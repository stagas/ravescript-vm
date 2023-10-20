import { entries } from 'everyday-utils'
import { Signal, type Buffers } from './backend'
import { Clock } from './clock'
import { BLOCK_SIZE, SAMPLE_RATE } from './constants'
import { defaultMainCode } from './defaults'
import { envTypes } from './env-types'
import { GenInfo, GenRuntime } from './gen-runtime'
import { AstNode, Source, Token, parse, produce, tokenize } from './lang'
import { analyse } from './lang/analyser'
import { Compile, compile } from './lang/compiler'
import { Emitter } from './lang/emitter'
import { SignalView } from './structs'
import { Vm } from './vm'

export type Block = Float32Array
export type BlockU32 = Uint32Array

type BuiltinError = Error

export namespace Build {
  export type Error = BuiltinError & { cause?: { nodes?: AstNode.Item[] } }

  export interface Memories {
    audios: Block[]
    gens: GenRuntime[]
    rms: Block
    lists: Block
    scalars: Block
    literals: Block
    events: Block // TODO: temporary
    pointers: BlockU32
  }

  export interface Payload {
    instanceId: number
    binary: Uint8Array
    signal: Signal
    gens: GenInfo[]
    literalsCount: number
    /** Live literals buffer, points to the instance's memory. */
    liveLiterals: Block
    /** Own literals buffer, unique for every saved sound, aka preset. */
    ownLiterals: Block
  }

  export interface Shared {
    info: Emitter.Info
    memories: Memories
    payload: Omit<Payload, 'ownLiterals'>
  }

  export interface Sound {
    info: Emitter.Info
    shared: Shared
    signal: Signal
    dirtyLiterals: boolean
    isTrashed?: boolean
    isNew?: boolean
    payload: Payload
    tokens?: Token[]
  }
}

export enum FrontendState {
  Idle,
  Started,
  Stopped,
}

export class Frontend {
  static core?: number

  debug = false

  state: FrontendState = FrontendState.Idle
  engine: number
  clock: Clock
  buffers: Buffers
  blocks: Block[] = []
  blocksU32: BlockU32[] = []
  signal: Signal

  initials: Record<string, Float32Array> = {}
  gensUsed: Record<string, GenRuntime[]> = {}
  gensFree: Record<string, GenRuntime[]> = {}

  buildsShared: Map<number, Build.Shared> = new Map()

  main: Build.Sound | null

  zero: Block

  constructor(
    public vm: Vm,
    public sampleRate = SAMPLE_RATE,
    public blockSize = BLOCK_SIZE,
  ) {
    Frontend.core ??= vm.exports.engine_Core_constructor(0, sampleRate)

    this.engine = vm.exports.engine_constructor(0, sampleRate, Frontend.core)

    this.clock = Clock(vm.view.buffer, vm.exports.engine_get_clock(this.engine))
    this.clock.ringPos = 0

    this.zero = this.getBlock()

    this.signal = {
      ptr: vm.exports.engine_get_signal(this.engine),
      L: this.getBlock(),
      R: this.getBlock(),
      LR: this.getBlock(),
    }
    const signal = SignalView(vm.view.buffer, this.signal.ptr)
    signal.L = this.signal.L!.byteOffset
    signal.R = this.signal.R!.byteOffset
    signal.LR = this.signal.LR!.byteOffset

    const mainInfo = this.produce([...this.tokenize({ code: defaultMainCode })])
    this.main = this.compileMain(mainInfo)
    // console.log(this.main, this)

    this.buffers = {
      clock: this.clock.byteOffset,
      engine: this.engine,
      signal: this.signal
    }
  }

  getBlock = (length = this.blockSize): Block => {
    // console.warn('GET BLOCK!')
    let block = this.blocks.pop()
    if (!block) {
      block = this.vm.view.getF32(
        this.vm.exports.engine_createBlock(this.engine, length),
        length
      )
    }
    return block
  }

  getBlockU32 = (length = this.blockSize): BlockU32 => {
    // console.warn('GET BLOCK U32')
    let block = this.blocksU32.pop()
    if (!block) {
      block = this.vm.view.getU32(
        this.vm.exports.engine_createBlock(this.engine, length),
        length
      )
    }
    return block
  }

  getMemories(info: Emitter.Info): Build.Memories {
    // console.warn('GET MEMORIES!')
    const audios = Array.from(info.audios,
      (_, index) =>
        info.overrideAudios.get(index) ?? this.getBlock()
    )

    const gens = Array.from(info.gens,
      (gen) => this.createGen(
        gen,
        gen.audio
          ? audios[gen.audio.ptr]
          : null
      )
    )

    // we need the out to pick it up in the ui
    info.audios.forEach((audio) => {
      audio.floats = audios[audio.ptr]
    })

    const memories: Build.Memories = {
      audios,
      gens,
      rms: this.getBlock(),
      lists: this.getBlock(),
      scalars: this.getBlock(),
      literals: this.getBlock(),
      events: this.getBlock(), // TODO: temporary
      pointers: this.getBlockU32(),
    }

    memories.pointers.fill(this.zero.byteOffset)

    return memories
  }

  freeBlock = (block: Block) => {
    if (block === this.signal.L
      || block === this.signal.R
      || block === this.signal.LR
    ) return

    if (this.blocks.includes(block)) return
    this.blocks.unshift(block)
    block.fill(0)
  }

  freeBlockU32 = (block: BlockU32) => {
    if (this.blocksU32.includes(block)) return
    this.blocksU32.unshift(block)
    block.fill(0)
  }

  free(memories: Partial<Build.Memories>) {
    memories.audios?.forEach(this.freeBlock)
    memories.gens?.forEach(this.freeGen)
    for (const [key, mem] of Object.entries(memories)) {
      if (key !== 'audios' && key !== 'gens') {
        if (mem instanceof Float32Array) {
          this.freeBlock(mem as Block)
        }
        else if (mem instanceof Uint32Array) {
          this.freeBlockU32(mem as BlockU32)
        }
        else {
          console.error(key, mem)
          throw new TypeError('Unknown memory type.')
        }
      }
    }
  }

  createGen(gen: Emitter.Gen, out: Block | null) {
    if (gen.kind in this.gensFree && this.gensFree[gen.kind]!.length) {
      const genRuntime = this.gensFree[gen.kind]!.pop()!
      gen.runtime = genRuntime
      genRuntime.out = out
      this.gensUsed[gen.kind]!.push(genRuntime)
      return genRuntime
    }
    return new GenRuntime(this, gen, out)
  }

  freeGen = (gen: GenRuntime) => {
    if (!(gen.kind in this.gensUsed)) {
      throw new Error(`Attempted to free gen of unknown kind '${gen.kind}'.`)
    }

    const index = this.gensUsed[gen.kind]!.indexOf(gen)
    if (!~index) {
      return
    }

    this.gensUsed[gen.kind]!.splice(index, 1)
    this.gensFree[gen.kind]!.unshift(gen)
    gen.reset()
  }

  tokenize(source: Source) {
    return tokenize(source)
  }

  produce(tokens: Token[], idModifier?: string) {
    const ast = parse(tokens)
    const scope = analyse(ast)
    return produce(scope, idModifier)
  }

  compileMain(mainInfo: Emitter.Info, clear = false): Build.Sound {
    mainInfo.overrideAudios.set(0, this.signal.L!)
    mainInfo.overrideAudios.set(1, this.signal.R!)
    mainInfo.overrideAudios.set(2, this.signal.LR!)

    //   , namedSignals ?: Map<string, Signal>
    // for (const [name, audio] of mainInfo.withs.entries()) {
    //   const signal = namedSignals?.get(name)
    //   if (signal) {
    //     mainInfo.overrideAudios.set(audio.ptr, signal.LR!)
    //   }
    // }
    // this.mainInfo.overrideAudios.set(this.mainInfo.L, this.mainOuts[0])
    // this.mainInfo.overrideAudios.set(this.mainInfo.R, this.mainOuts[1])
    this.main = this.compile(mainInfo, clear ? null : this.main, true)
    return this.main
  }

  compile(info: Emitter.Info, current?: Build.Sound | null | undefined, immediate = false) {
    // console.warn('compile')
    const hasInstance = this.buildsShared.has(info.id)

    let ownLiterals: Block

    if (!hasInstance || !immediate || !current) {
      ownLiterals = this.getBlock()
      if (current) {
        // Note: we release early but this goes at the end of the pool queue
        // so it shouldn't be a problem, otherwise we need to use a trash queue.
        this.freeBlock(current.payload.ownLiterals)
      }
    }
    else {
      ownLiterals = current.payload.ownLiterals
    }

    if (hasInstance) {
      const isCurrentSameInstance = immediate && current?.info.id === info.id

      const shared = this.buildsShared.get(info.id)!

      shared.info.gens.forEach((p, i) => {
        const n = info.gens[i]!
        n.audio = p.audio!
        n.runtime = p.runtime!
      })

      shared.info.audios.forEach((p, i) => {
        const n = info.audios[i]!
        n.floats = p.floats!
      })

      // if (!isCurrentSameInstance) {
      //   ownLiterals.set(shared.memories.literals)
      // }

      info.literals.forEach((l) => {
        ownLiterals[l.ptr] = l.value
      })

      // update info for next use
      shared.info = info

      const sound: Build.Sound = {
        info,
        shared,
        signal: shared.payload.signal,
        dirtyLiterals: true,
        payload: isCurrentSameInstance
          ? current.payload
          : {
            ...shared.payload,
            ownLiterals
          }
      }

      // if (current && current?.payload.ownLiterals !== ownLiterals) {
      //   this.freeBlock(current.payload.ownLiterals)
      // }

      // if (this.debug) {
      //   console.groupCollapsed('sound')
      //   console.log(sound)
      //   console.groupEnd()
      // }

      return sound
    }

    const code = info.codes.join('\n')
      + ' rms_ '

    const envTypesShaked =
      Object.fromEntries(Object.entries(envTypes)
        .filter(([key]) =>
          code.includes(key)
        ))

    const memories = this.getMemories(info)

    const ptrs: Compile.Ptrs = {
      engine: this.engine,
      clock: this.clock.byteOffset,
      audios: memories.audios.map((b) => b.byteOffset),
      gens: memories.gens.map((g) => g.ptr),
      literals: memories.literals.byteOffset,
      lists: memories.lists.byteOffset,
      scalars: memories.scalars.byteOffset,
      events: memories.events.byteOffset,
      pointers: memories.pointers.byteOffset,
    }

    let result: Compile.Result
    try {
      result = compile(
        info,
        {
          envTypes: envTypesShaked,
          ...ptrs
        },
        this.debug
      )
    }
    catch (error) {
      this.free(memories)
      throw error
    }

    // We check if either channels have been used otherwise we pass null.
    // When a channel is used it will have moved from its default index.
    const signal: Signal = {
      L: info.L !== 0 ? memories.audios[info.L] : null,
      R: info.R !== 1 ? memories.audios[info.R] : null,
      LR: info.LR !== 2 ? memories.audios[info.LR] : null,
    }

    const shared: Build.Shared = {
      info,
      memories,
      payload: {
        instanceId: info.id,
        binary: result.binary,
        signal,
        gens: memories.gens.map((g) =>
          g.toJSON()
        ),
        literalsCount: info.literals.length,
        liveLiterals: memories.literals,
      }
    }

    this.buildsShared.set(info.id, shared)

    info.literals.forEach((l) => {
      ownLiterals[l.ptr] = l.value
    })

    const sound: Build.Sound = {
      info,
      shared,
      signal,
      dirtyLiterals: true,
      payload: {
        ...shared.payload,
        ownLiterals
      }
    }

    if (this.debug) {
      console.groupCollapsed('sound')
      console.log(sound)
      console.groupEnd()
    }

    return sound
  }

  purge(infoId: number) {
    const shared = this.buildsShared.get(infoId)
    if (!shared) {
      if (this.debug) {
        console.log('Attempted to purge non-existent build:', infoId)
      }
      return
    }
    this.free(shared.memories)
    this.buildsShared.delete(infoId)
    if (this.debug) {
      console.log('Purged build:', infoId)
    }
  }
}

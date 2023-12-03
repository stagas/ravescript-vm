import { Signal, type Buffers } from './backend.ts'
import { Clock } from './clock.ts'
import { BLOCK_SIZE, SAMPLE_RATE } from './constants.ts'
import { envTypes } from './env-types.ts'
import { GenInfo, GenRuntime } from './gen-runtime.ts'
import { analyse } from './lang/analyser.ts'
import { Compile, compile } from './lang/compiler.ts'
import { Emitter } from './lang/emitter.ts'
import { AstNode, Source, Token, parse, produce, tokenize } from './lang/index.ts'
import { VmRunner } from './runner.ts'
import { SignalView } from './structs.ts'
import { Vm } from './vm.ts'

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
    scalarExports: Block
    literals: Block
    scalars: Block
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
    payload: Payload //Omit<Payload, 'ownLiterals'>
  }

  export interface Sound {
    frontend: Frontend
    info: Emitter.Info
    shared: Shared
    signal: Signal
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
  clock: Clock
  buffers: Buffers
  blocks: Block[] = []
  blocksU32: BlockU32[] = []
  // signal: Signal

  initials: Record<string, Float32Array> = {}
  gensUsed: Record<string, GenRuntime[]> = {}
  gensFree: Record<string, GenRuntime[]> = {}

  buildsShared: Map<number, Build.Shared> = new Map()

  // main: Build.Sound | null

  // zero: Block

  vmRunner?: VmRunner

  constructor(
    public name = 'default',
    public vm: Vm,
    public engine: number,
    public core: number,
    public signal: Signal | null,
    public zero: Block | null,
    public runner = true,
    public sampleRate = SAMPLE_RATE,
    public blockSize = BLOCK_SIZE,
  ) {
    if (engine) {
      this.engine = engine
    }
    else {
      this.core = core || vm.exports.engine_Core_constructor(0, sampleRate)
      this.engine = vm.exports.engine_constructor(0, sampleRate, this.core)
    }

    this.clock = Clock(
      vm.view.buffer,
      vm.exports.engine_get_clock(this.engine)
    )
    this.clock.ringPos = 0

    this.zero = zero ?? this.getBlock()

    const s: Signal = this.signal = signal ?? {
      ptr: vm.exports.engine_get_signal(this.engine),
      L: this.getBlock(),
      R: this.getBlock(),
      LR: this.getBlock(),
    }
    const signalView = SignalView(
      vm.view.buffer,
      s.ptr
    )
    signalView.L = s.L!.byteOffset
    signalView.R = s.R!.byteOffset
    signalView.LR = s.LR!.byteOffset

    this.buffers = {
      clock: this.clock.byteOffset,
      engine: this.engine,
      signal: this.signal
    }

    if (runner) {
      this.vmRunner = new VmRunner(
        this.vm,
        this.vm.exports.engine_get_runner(
          this.buffers.engine
        )
      )
    }
  }
  getBlock = (length = this.blockSize): Block => {
    let block = this.blocks.pop()?.fill(0)
    if (!block) {
      block = this.vm.view.getF32(
        this.vm.exports.engine_createBlock(this.engine, length),
        length
      )
    }
    return block
  }
  getBlockU32 = (length = this.blockSize): BlockU32 => {
    let block = this.blocksU32.pop()?.fill(0)
    if (!block) {
      block = this.vm.view.getU32(
        this.vm.exports.engine_createBlock(this.engine, length),
        length
      )
    }
    return block
  }
  getMemories(info: Emitter.Info): Build.Memories {
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
      scalarExports: this.getBlock(),
      scalars: this.getBlock(),
      literals: this.getBlock(),
      events: this.getBlock(), // TODO: temporary
      pointers: this.getBlockU32(),
    }

    memories.pointers.fill(this.zero!.byteOffset)

    return memories
  }
  freeBlock = (block: Block) => {
    if (block === this.signal!.L
      || block === this.signal!.R
      || block === this.signal!.LR
    ) return

    if (this.blocks.includes(block)) return
    this.blocks.unshift(block)
  }
  freeBlockU32 = (block: BlockU32) => {
    if (this.blocksU32.includes(block)) return
    this.blocksU32.unshift(block)
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
      genRuntime.reset()
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
  }
  tokenize(source: Source) {
    return tokenize(source)
  }
  produce(tokens: Token[], idModifier?: string) {
    const ast = parse(tokens)
    const scope = analyse(ast)
    return produce(tokens, scope, idModifier)
  }
  compile(info: Emitter.Info) {
    // console.warn('compile')
    let shared = this.buildsShared.get(info.instanceId)

    if (shared) {
      const ownLiterals = shared.payload.ownLiterals

      shared.info.gens.forEach((p, i) => {
        const n = info.gens[i]!
        n.audio = p.audio!
        n.runtime = p.runtime!
      })

      shared.info.audios.forEach((p, i) => {
        const n = info.audios[i]!
        n.floats = p.floats!
      })

      // TODO: only write literals when it is immediate
      // info.writeLiterals(ownLiterals)

      // update info for next use
      shared.info = info

      const build: Build.Sound = {
        frontend: this,
        info,
        shared: shared,
        signal: shared.payload.signal,
        payload: shared.payload,
        isNew: false,
      }

      // if (this.debug) {
      //   console.groupCollapsed('sound')
      //   console.log(sound)
      //   console.groupEnd()
      // }

      return build
    }

    const code = info.codes.join('\n')
      + info.resets.join('\n')
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
      scalars: memories.scalars.byteOffset,
      scalarExports: memories.scalarExports.byteOffset,
      lists: memories.lists.byteOffset,
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

    const ownLiterals = this.getBlock()

    shared = {
      info,
      memories,
      payload: {
        instanceId: info.instanceId,
        binary: result.binary,
        signal,
        gens: memories.gens.map((g) =>
          g.toJSON()
        ),
        literalsCount: info.literals.length,
        liveLiterals: memories.literals,
        ownLiterals,
      }
    }

    this.buildsShared.set(info.instanceId, shared)

    info.writeLiterals(ownLiterals)

    const build: Build.Sound = {
      frontend: this,
      info,
      shared,
      signal,
      payload: shared.payload,
      isNew: true,
    }

    if (this.debug) {
      console.groupCollapsed('sound')
      console.log(build)
      console.groupEnd()
    }

    return build
  }
  setupMain(info: Emitter.Info) {
    info.overrideAudios.set(0, this.signal!.L!)
    info.overrideAudios.set(1, this.signal!.R!)
    info.overrideAudios.set(2, this.signal!.LR!)
  }
  makeFromTokens(tokens: Token[], isMain = false, idModifier?: string) {
    const info = this.produce(tokens, idModifier)
    if (isMain) this.setupMain(info)
    const build = this.compile(info)
    return build
  }
  make(source: Source, isMain = false, idModifier?: string) {
    const tokens = Array.from(this.tokenize(source))
    return this.makeFromTokens(tokens, isMain, idModifier)
  }
  purge(instanceId: number) {
    // if (this.vmRunner!.hasPayload(instanceId)) {
    //   if (this.debug) {
    //     console.warn('Attempted to purge build that is currently in use:', instanceId)
    //   }
    //   return
    // }
    // console.log('PURGE', instanceId)

    const shared = this.buildsShared.get(instanceId)
    if (!shared) {
      if (this.debug) {
        console.warn('Attempted to purge non-existent build:', instanceId)
      }
      return
    }
    this.free(shared.memories)
    this.buildsShared.delete(instanceId)
    if (this.debug) {
      console.log('Purged build:', instanceId)
    }
  }
}

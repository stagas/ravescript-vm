import { Buffers, Signal } from './backend.ts'
import { Clock } from './clock.ts'
import { BLOCK_SIZE, SAMPLE_RATE } from './constants.ts'
import { Block, BlockU32 } from './frontend.ts'
import { VmObject, VmRunner } from './runner.ts'
import { SignalView } from './structs.ts'
import { Vm } from './vm.ts'

export class Engine extends VmObject {
  clock?: Clock
  signal?: Signal
  zero?: Block
  blocks: Block[] = []
  blocksU32: BlockU32[] = []
  vmRunner?: VmRunner
  constructor(
    public vm: Vm,
    public engine: number = 0,
    public core: number = 0,
    public sampleRate = SAMPLE_RATE,
    public blockSize = BLOCK_SIZE,
  ) {
    super(vm, engine)
    if (engine === 0) {
      if (core === 0) {
        core = this.core = vm.exports.engine_Core_constructor(0, sampleRate)
      }
      this.engine = this.ptr = vm.exports.engine_constructor(0, sampleRate, core)
    }
  }
  init(buffers?: Buffers) {
    const engine = this.engine!
    const clock = this.clock = Clock(
      this.vm.view.buffer,
      this.vm.exports.engine_get_clock(engine)
    )
    clock.ringPos = 0

    const signal = this.signal = buffers?.signal ?? {
      ptr: this.vm.exports.engine_get_signal(engine),
      L: this.getBlock(),
      R: this.getBlock(),
      LR: this.getBlock(),
    }
    const signalView = SignalView(
      this.vm.view.buffer,
      signal.ptr
    )
    signalView.L = signal.L!.byteOffset
    signalView.R = signal.R!.byteOffset
    signalView.LR = signal.LR!.byteOffset

    this.zero = buffers?.zero ?? this.getBlock()
  }
  get buffers(): Buffers {
    return {
      core: this.core!,
      engine: this.engine!,
      clock: this.clock!.byteOffset,
      signal: this.signal!,
      zero: this.zero!,
    }
  }
  createRunner() {
    return new VmRunner(
      this.vm,
      this.vm.exports.engine_get_runner(this.engine)
    )
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
}

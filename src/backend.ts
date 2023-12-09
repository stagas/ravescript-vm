import { VmCtrl, VmRunner } from './runner.ts'
import { Clock } from './clock.ts'
import { Build, type Block } from './frontend.ts'
import { SignalView } from './structs.ts'
import { Ring, toRing } from './util.ts'
import { Vm, VmInit, initVm } from './vm.ts'
import { Engine } from './engine.ts'

export interface BarBuildPtrs {
  bar: number
  ctrls: number[]
}

export interface Buffers {
  core: number
  engine: number
  clock: number
  signal: Signal
  zero: Block
}

export type BackendInit = {
  vm?: Vm
  vmInit?: VmInit
  buffers?: Buffers
}

export interface Signal<T = Block> {
  ptr?: number
  L: T | null
  R: T | null
  LR: T | null
}

const ctrlsById = new Map<number, VmCtrl>()
export function resetCtrlById(id: number) {
  ctrlsById.get(id)?.reset()
}

export class Backend {
  clock!: Clock
  chunkAheadTime = 0

  begin = 0
  end = 0

  signal!: Signal
  signalRing!: Signal<Ring>
  signalView!: SignalView

  L!: Float32Array
  R!: Float32Array

  engine!: Engine

  get vm() {
    return this.engine.vm!
  }
  get vmRunner() {
    return this.engine.vmRunner!
  }
  async init(init: BackendInit) {
    const vm = init.vm ?? await initVm({
      ...init.vmInit!,
      resetCtrlById,
    })

    this.engine = new Engine(vm, init.buffers!.engine)
    // TODO: we need this maybe instead of the below
    // this.engine.init(init.buffers!)
    this.engine.vmRunner = this.engine.createRunner()

    this.clock = Clock(vm.view.buffer, init.buffers!.clock)

    this.signal = init.buffers!.signal

    this.signalRing = {
      L: toRing(this.signal.L!),
      R: toRing(this.signal.R!),
      LR: toRing(this.signal.LR!)
    }

    this.signalView = SignalView(vm.view.buffer)
  }
  get bar() {
    const vmRunner = this.vmRunner
    const barPtr = vmRunner.bars[this.clock.internalTime | 0]
    const bar = vmRunner.vmBarsByPtr.get(barPtr)
    return bar
  }
  start() {
    if (this.process === this.doIdle) {
      this.clock.prevTime = -1
      this.process = this.doRun
    }
  }
  stop() {
    if (this.process === this.doRun) {
      this.process = this.doStop
    }
    else {
      this.resetClock()
      this.resetThisBar()
    }
  }
  reset() {
    if (this.process === this.doRun) {
      this.process = this.doResetting
    }
    else {
      this.resetClock()
      this.resetThisBar()
    }
  }
  resetClock() {
    this.clock.prevTime = -1
    this.clock.barTime = this.clock.internalTime = Math.max(0, this.clock.loopStart)
    this.clock.time = this.clock.internalTime * this.clock.coeff
  }
  resetThisBar() {
    this.bar?.reset()
  }
  clearSignal() {
    this.signal.L?.fill(0)
    this.signal.R?.fill(0)
    this.signal.LR?.fill(0)
    this.L?.fill(0)
    this.R?.fill(0)
  }
  updateTime(): void {
    const c = this.clock
    const coeff = c.coeff = c.bpm / 60 / 4
    c.timeStep = 1 / c.sampleRate
    c.barTimeStep = c.timeStep * coeff
    this.chunkAheadTime = 129 * c.barTimeStep

    const jumpBar = c.jumpBar

    const internalTimeBefore = c.internalTime
    let internalTimeNow = internalTimeBefore

    // advance barTime
    if (c.prevTime >= 0) {
      internalTimeNow = internalTimeBefore + (c.time - c.prevTime) * coeff
    }
    c.prevTime = c.time

    // is a loop active?
    const loopStart = Math.max(0, c.loopStart)
    const loopEnd = Math.min(c.endTime, c.loopEnd)

    // jump to bar
    if (jumpBar >= 0) {
      if ((internalTimeBefore | 0) !== (internalTimeNow | 0)) {
        const frac = internalTimeNow - (internalTimeNow | 0)
        internalTimeNow = jumpBar + frac
        c.jumpBar = -1
      }
    }
    else {
      if (internalTimeBefore < loopEnd && internalTimeNow >= loopEnd) {
        internalTimeNow -= (loopEnd - loopStart)
      }

      // wrap barTime on clock.endTime
      if (internalTimeNow >= c.endTime) {
        internalTimeNow -= c.endTime
        if (internalTimeNow >= c.endTime) {
          internalTimeNow %= c.endTime
        }
      }
    }

    // calculate next bar time (+1 frame for precision error)
    let nextBarTime = internalTimeNow + this.chunkAheadTime

    // jump to bar next bar time
    if (jumpBar >= 0) {
      if ((nextBarTime | 0) !== (internalTimeNow | 0)) {
        nextBarTime = c.jumpBar
      }
    }
    else {
      // is a loop active?
      if (internalTimeBefore < loopEnd && nextBarTime >= loopEnd) {
        nextBarTime -= (loopEnd - loopStart)
      }

      // wrap nextBarTime on clock.endTime
      if (nextBarTime >= c.endTime) {
        nextBarTime -= c.endTime
      }
    }

    c.barTime = c.internalTime = internalTimeNow
    c.nextBarTime = nextBarTime

    // update ringPos
    const ringPos
      = c.ringPos
      = (c.ringPos + 1) & 0xF // % 16

    // update buffer begin/end pointers
    this.begin = ringPos << 7 // * 128
    this.end = (ringPos + 1) << 7 // * 128

    // acquire and reset main outs for this turn
    this.L = this.signalRing.L![ringPos].fill(0)
    this.R = this.signalRing.R![ringPos].fill(0)
    this.signalRing.LR![ringPos].fill(0)
  }
  async putPayloads(payloads: Record<number, Build.Payload>) {
    const vmRunner = this.vmRunner!
    for (const ptr in payloads) {
      const payload = payloads[+ptr]
      const ctrl = vmRunner.vmCtrlsByPtr.get(+ptr)!
      await ctrl.setPayload(payload, true)
    }
  }
  async freePayloads(payloads: number[]) {
    for (const instanceId of payloads) {
      this.vm.ctrlInstances.delete(instanceId)
    }
  }
  doResetting: Process = (inputs, outputs) => {
    this.updateTime()

    this.clock.nextBarTime = -1
    this.vmRunner!.process(
      this.begin,
      this.end,
      this.signal
    )

    outputs[0].set(this.L)
    outputs[1].set(this.R)

    this.process = this.doReset
  }
  doReset: Process = (inputs, outputs) => {
    this.updateTime()

    this.resetClock()
    this.resetThisBar()

    this.vmRunner!.process(
      this.begin,
      this.end,
      this.signal
    )

    outputs[0].set(this.L)
    outputs[1].set(this.R)

    this.process = this.doRun
  }
  doStop: Process = (inputs, outputs) => {
    this.updateTime()

    this.clock.nextBarTime = -1
    this.vmRunner!.process(
      this.begin,
      this.end,
      this.signal
    )

    outputs[0].set(this.L)
    outputs[1].set(this.R)

    this.clock.prevTime = -1

    this.process = this.doIdle
  }
  doRun: Process = (inputs, outputs) => {
    this.updateTime()

    this.vmRunner!.process(
      this.begin,
      this.end,
      this.signal
    )
    outputs[0].set(this.L)
    outputs[1].set(this.R)
  }
  doIdle: Process = () => { }
  process: Process = this.doIdle
  async fill(barIndex: number, length: number, noReset = false) {
    // const ptr = this.vmRunner?.bars[0]
    // const bar = this.vmRunner?.vmBarsByPtr.get(ptr)!
    if (!noReset) {
      this.resetClock()
    }
    this.updateTime()
    this.clearSignal()
    this.vmRunner!.fill(
      barIndex,
      0,
      length,
      this.signal
    )
  }
}

export type Process = (inputs: Float32Array[], outputs: Float32Array[]) => void

export async function test_backend() {
  // @env browser
  const { fetchVmBinary, createVmMemory } = await import('./vm.ts')
  const { fetchPffftBinary } = await import('../vendor/pffft/pffft.ts')
  const { Frontend } = await import('./frontend.ts')

  const vmBinary = await fetchVmBinary()
  const pffftBinary = await fetchPffftBinary()

  async function prepare() {
    const vmMemory = createVmMemory()
    const vm = await initVm({
      memory: vmMemory,
      vmBinary,
      pffftBinary
    })
    const frontend = new Frontend('test', vm)
    // frontend.debug = true
    frontend.engine = new Engine(vm)
    frontend.engine.init()
    frontend.engine.vmRunner = frontend.engine.createRunner()

    const processorOptions: BackendInit = {
      vm,
      buffers: frontend.engine.buffers,
    }

    const backend = new Backend()
    await backend.init(processorOptions)
    backend.engine = frontend.engine!

    return { frontend, backend }
  }

  describe('backend', () => {
    it('fill', async () => {
      const { frontend, backend } = await prepare()

      // TODO: this code should fail because it's DC
      //  it should be [zero] 42+ LR+= to convert it to AC
      const source = { code: `42 LR+=` }
      const build = frontend.make(source)

      const runner = frontend.engine!.vmRunner!
      const ctrl = runner.vmCtrls[0]
      await ctrl.setPayload(build.payload, true)

      // await backend.putPayloads({ [ctrl.ptr]: ctrl.payload! })

      const bar = runner.vmBars[0]
      bar.addTrack(ctrl)
      // runner.setBar(0, bar)

      bar.reset()
      runner.bars[0] = bar.ptr
      backend.fill(0, 2048)

      const outs = backend.signal
      expect(outs.LR![0]).toEqual(42)
    })

    it('change', async () => {
      const { frontend, backend } = await prepare()

      // TODO: this code should fail because it's DC
      //  it should be [zero] 42+ LR+= to convert it to AC
      {
        const source = { code: `42 LR+=` }
        const build = frontend.make(source)

        const runner = frontend.engine!.vmRunner!
        const ctrl = runner.vmCtrls[0]
        await ctrl.setPayload(build.payload, true)

        const bar = runner.vmBars[0]
        bar.addTrack(ctrl)

        bar.reset()
        runner.bars[0] = bar.ptr
        backend.fill(0, 2048)

        const outs = backend.signal
        expect(outs.LR![0]).toEqual(42)
      }

      {
        const source = { code: `33 LR+=` }
        const build = frontend.make(source)
        if (!build.isNew) {
          build.info.writeLiterals(build.payload.ownLiterals)
        }

        const runner = frontend.engine!.vmRunner!
        const ctrl = runner.vmCtrls[0]
        await ctrl.setPayload(build.payload, true)

        const bar = runner.vmBars[0]
        bar.clear()
        bar.addTrack(ctrl)

        bar.reset()
        runner.bars[0] = bar.ptr
        backend.fill(0, 2048)

        const outs = backend.signal
        expect(outs.LR![0]).toEqual(33)
      }
    })
  })

}

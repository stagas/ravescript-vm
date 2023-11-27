import { Clock } from './clock.ts'
import { type Block, type Build } from './frontend.ts'
import type { GenInfo } from './gen-runtime.ts'
import { instantiate } from './instantiate.ts'
import type { Compile, Module } from './lang/index.ts'
import { BarView, CtrlView, SignalView } from './structs.ts'
import { FixedArray, Ring, toRing } from './util.ts'
import { Vm, VmInit, initVm } from './vm.ts'

const MAX = 512
const MAX_BAR_INSTANCES = MAX
const MAX_BARS = MAX
const MAX_CTRL_INSTANCES = MAX
const MAX_CTRLS = MAX

export interface Buffers {
  signal: Signal
  engine: number
  clock: number
}

export interface BackendInit {
  vmInit: VmInit
  buffers: Buffers
  runner: boolean
  vm?: Vm
}

export interface Signal<T = Block> {
  ptr?: number
  L: T | null
  R: T | null
  LR: T | null
}

export interface Ctrl {
  instance: Module.Instance
  instanceId: number
  ptr: number
  signal: Signal
  gens: GenInfo[]
  literalsCount: number
  liveLiterals: Block
  ownLiterals: Block
}

const ctrlsById = new Map<number, Ctrl>()
function resetCtrlById(id: number) {
  const ctrl = ctrlsById.get(id)
  if (ctrl) {
    resetCtrl(ctrl)
  }
}

function resetCtrl(ctrl: Ctrl) {
  // TODO: clear audios?
  ctrl.gens.forEach((gen) => {
    gen.mem.set(gen.initial)
  })

  // TODO: apply initial literals before this update/reset
  ctrl.instance.exports.update_gens()
  ctrl.instance.exports.reset_gens()
  ctrl.signal.L?.fill(0)
  ctrl.signal.R?.fill(0)
  ctrl.signal.LR?.fill(0)
  // ctrl.instance.exports.reset()
}

const barsByPtr = new Map<number, Bar>()
export class Bar {
  bar: BarView
  barCtrls: Uint32Array
  ctrls: FixedArray<Ctrl> = new FixedArray(16 * 4)
  main?: Ctrl

  constructor(public backend: Backend, public ptr: number) {
    barsByPtr.set(ptr, this)
    this.bar = BarView(this.backend.vm.view.buffer, this.ptr)
    this.barCtrls = this.backend.vm.view.getU32(this.bar.ctrls, 16 * 4)
  }

  reset() {
    this.ctrls.forEach(resetCtrl)
    if (this.main) resetCtrl(this.main)
  }

  clear() {
    const endTime = this.backend.clock.endTime

    // try to free and maybe reset the ctrls that are not used
    this.ctrls.forEach((ctrl) => {
      let reset = true
      out: for (let t = 0; t < endTime; t++) {
        const bar = this.backend.bars[t]
        if (bar) {
          for (const other of bar.ctrls) {
            // the ctrl instanceId exists in another bar, we should not reset it
            if (ctrl.instanceId === other.instanceId) {
              reset = false
              // the ctrl is the same in another bar, so we should not free it
              if (ctrl === other) {
                break out
              }
            }
          }
        }
      }
      // ctrl's instanceId isn't used anywhere, so we can reset it
      if (reset) resetCtrl(ctrl)
      // free the ctrl object
      this.backend.ctrlPool.unshift(ctrl)
    })

    // try to free main and maybe reset it
    // this.ctrls.forEach((ctrl) => {
    if (this.main) {
      out: {
        const { main } = this
        let reset = true
        for (let t = 0; t < endTime; t++) {
          const bar = this.backend.bars[t]
          if (bar) {
            // the ctrl instanceId exists in another bar, we should not reset it
            if (main.instanceId === bar.main?.instanceId) {
              reset = false
              // the ctrl is the same in another bar, so we should not free it
              if (main === bar.main) {
                break out
              }
            }
          }
        }
        // ctrl's instanceId isn't used anywhere, so we can reset it
        if (reset) resetCtrl(main)
        // free the ctrl object
        this.backend.ctrlPool.unshift(main)
      }
    }

    this.bar.size = 0
    this.bar.main = 0
    this.ctrls.clear()
  }

  addCtrl(instance: Module.Instance, payload: Build.Payload) {
    const ctrl = this.backend.putCtrl(instance, payload)

    this.barCtrls[this.ctrls.size] = ctrl.ptr
    this.ctrls.push(ctrl)
    this.bar.size = this.ctrls.size
  }
}

export class Backend {
  static async instantiate(init: BackendInit) {
    const vm = init.vm ?? await initVm({
      ...init.vmInit,
      resetCtrlById,
    })

    return new this(
      vm,
      init.buffers,
      init.runner,
    )
  }

  env: Compile.Env

  runnerPtr!: number
  runnerBars!: Uint32Array
  runnerCtrls!: Uint32Array

  chunkAheadTime = 0
  nextBarTime = 0

  begin = 0
  end = 0

  signal: Signal
  signalRing: Signal<Ring>
  signalView: SignalView

  L!: Float32Array
  R!: Float32Array

  main?: Ctrl | null
  bars: (Bar | void)[] = Array.from({ length: MAX_BARS })
  ctrl!: CtrlView

  oldBars: FixedArray<Bar> = new FixedArray(16 * 4)

  barPool: FixedArray<Bar> = new FixedArray(MAX_BAR_INSTANCES)
  barTrash: FixedArray<Bar> = new FixedArray(MAX_BAR_INSTANCES)

  ctrlPool: FixedArray<Ctrl> = new FixedArray(MAX_CTRL_INSTANCES)

  clock: Clock

  constructor(
    public vm: Vm,
    public buffers: Buffers,
    runner: boolean | undefined,
  ) {
    this.clock = Clock(vm.view.buffer, buffers.clock)

    this.signal = buffers.signal

    this.signalRing = {
      L: toRing(this.signal.L!),
      R: toRing(this.signal.R!),
      LR: toRing(this.signal.LR!)
    }

    this.signalView = SignalView(this.vm.view.buffer)

    this.env = {
      memory: vm.view.memory,
      log: (x: number) => {
        console.log('[ctrl]', x)
      },
      ...this.vm.exports
    }

    if (runner) {
      this.runnerPtr = this.vm.exports.engine_get_runner(this.buffers.engine)
      const runnerBarsPtr = this.vm.exports.runner_get_bars(this.runnerPtr)

      this.runnerBars = this.vm.view.getU32(runnerBarsPtr, MAX_BARS)

      const runnerBarInstancesPtr: number = this.vm.exports.runner_get_barInstances(this.runnerPtr)
      const runnerBarInstancesView = this.vm.view.getU32(runnerBarInstancesPtr, MAX_BAR_INSTANCES)
      for (let i = 0; i < MAX_BAR_INSTANCES; i++) {
        this.barPool.push(new Bar(this, runnerBarInstancesView[i]!))
      }

      const runnerCtrlsPtr = this.vm.exports.runner_get_ctrls(this.runnerPtr)
      this.runnerCtrls = this.vm.view.getU32(runnerCtrlsPtr, MAX_CTRLS)

      const runnerCtrlInstancesPtr: number = this.vm.exports.runner_get_ctrlInstances(this.runnerPtr)
      const runnerCtrlInstancesView = this.vm.view.getU32(runnerCtrlInstancesPtr, MAX_CTRL_INSTANCES)
      for (let i = 0; i < MAX_CTRL_INSTANCES; i++) {
        this.ctrlPool.push({ ptr: runnerCtrlInstancesView[i] } as Ctrl)
      }

      this.ctrl = CtrlView(this.vm.view.buffer)
    }
  }

  get bar() {
    return this.bars[this.clock.internalTime | 0]
  }

  updateTime(): void {
    const c = this.clock
    const coeff = c.coeff = c.bpm / 60 / 4
    c.timeStep = 1 / c.sampleRate
    c.barTimeStep = c.timeStep * coeff
    // c.barTimeStep = 1 / (coeff * c.sampleRate)
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
    this.nextBarTime = internalTimeNow + this.chunkAheadTime

    // jump to bar next bar time
    if (jumpBar >= 0) {
      if ((this.nextBarTime | 0) !== (internalTimeNow | 0)) {
        this.nextBarTime = c.jumpBar
      }
    }
    else {
      // is a loop active?
      if (internalTimeBefore < loopEnd && this.nextBarTime >= loopEnd) {
        this.nextBarTime -= (loopEnd - loopStart)
      }

      // wrap nextBarTime on clock.endTime
      if (this.nextBarTime >= c.endTime) {
        this.nextBarTime -= c.endTime
      }
    }

    c.barTime = c.internalTime = internalTimeNow

    // update ringPos
    const ringPos
      = c.ringPos
      = (c.ringPos + 1) & 0xF // % 16

    // update buffer begin/end pointers
    this.begin = ringPos << 7 // * 128
    this.end = (ringPos + 1) << 7 // * 128

    // acquire and reset main outs for this turn
    this.L = this.signalRing.L![ringPos]!.fill(0)
    this.R = this.signalRing.R![ringPos]!.fill(0)
    this.signalRing.LR![ringPos]!.fill(0)
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

  // this should be called when things have stopped, to free old instances/buffers from memory
  purgeCtrls() {
    for (const ctrl of this.runnerCtrls) {
      // check in bars
      // should purge old instances here
    }
  }

  async purge(instanceId: number) {
    this.vm.ctrlInstances.delete(instanceId)
  }

  async getCtrlInstance(payload: Build.Payload) {
    let instance = this.vm.ctrlInstances.get(payload.instanceId)

    if (!instance) {
      // console.log('INSTANTIATE')
      instance = await instantiate<Module.Instance>(payload.binary, this.env)
      this.vm.ctrlInstances.set(payload.instanceId, instance)
    }

    return instance
  }

  removeBarAt(barTime: number) {
    this.runnerBars[barTime] = 0
  }

  async setBarAt(barTimes: number[], buildPayloads: Build.Payload[], mainPayload: Build.Payload | null) {
    while (!this.barPool.size && this.barTrash.size) {
      const bar = this.barTrash.pop()
      this.barPool.unshift(bar)
      bar.clear()
    }

    // const currentBar = this.bars[barTime]
    // if (currentBar && currentBar.ctrls.size === buildPayloads.length && currentBar.ctrls.every((ctrl) => {
    //   let found = false
    //   for (const payload of buildPayloads) {
    //     if (ctrl.instanceId === payload.instanceId) {
    //       ctrl.ownLiterals.set(
    //         payload.ownLiterals.subarray(0, payload.literalsCount)
    //       )
    //       found = true
    //       break
    //     }
    //   }
    //   return found
    // })) {
    //   return
    // }

    const bar: Bar = this.barPool.pop()

    this.oldBars.clear()

    for (const barTime of barTimes) {
      const old = this.bars[barTime]
      if (old) this.oldBars.push(old)

      // this.barIndex = (this.barIndex + 1) % MAX_BAR_INSTANCES //& 0xFFF // % 4096
      this.bars[barTime] = bar
      this.runnerBars[barTime] = bar.ptr
    }

    // TODO: we shouldn't need this anymore, we're setting endTime explicitly from seq.tsx
    // update end time
    // if (barTime + 1 > this.clock.endTime) {
    //   this.clock.endTime = barTime + 1
    // }

    // clear previous bar ctrls
    // bar.clear()

    // add new ctrls

    for (const payload of buildPayloads) {
      const instance = await this.getCtrlInstance(payload)
      bar.addCtrl(instance, payload)
    }

    if (mainPayload) {
      const instance = await this.getCtrlInstance(mainPayload)
      const ctrl = this.putCtrl(instance, mainPayload)
      bar.main = ctrl
      bar.bar.main = ctrl.ptr
    }

    if (this.oldBars.size) {
      for (const old of this.oldBars) {
        this.barTrash.unshift(old)
      }
    }
  }

  putCtrl(instance: Module.Instance, payload: Build.Payload) {
    while (!this.ctrlPool.size && this.barTrash.size) {
      const bar = this.barTrash.pop()
      this.barPool.unshift(bar)
      bar.clear()
    }

    const ctrl: Ctrl = this.ctrlPool.pop()
    ctrl.instance = instance
    Object.assign(ctrl, payload)

    this.ctrl.byteOffset = ctrl.ptr
    this.ctrl.id = ctrl.instanceId
    ctrlsById.set(ctrl.instanceId, ctrl)

    const s = this.signalView
    s.byteOffset = this.ctrl.signal
    s.L = ctrl.signal.L?.byteOffset ?? 0
    s.R = ctrl.signal.R?.byteOffset ?? 0
    s.LR = ctrl.signal.LR?.byteOffset ?? 0

    this.ctrl.literalsCount = ctrl.literalsCount
    this.ctrl.liveLiterals = ctrl.liveLiterals.byteOffset
    this.ctrl.ownLiterals = ctrl.ownLiterals.byteOffset

    return ctrl
  }

  doResetting: Process = (inputs, outputs) => {
    this.updateTime()

    this.vm.exports.runner_process(
      this.runnerPtr,
      this.clock.time,
      this.clock.barTime,
      -1,
      this.begin,
      this.end,
      this.signal.ptr,
    )

    outputs[0].set(this.L)
    outputs[1].set(this.R)

    this.process = this.doReset
  }

  doReset: Process = (inputs, outputs) => {
    this.updateTime()

    this.resetClock()
    this.resetThisBar()

    this.vm.exports.runner_process(
      this.runnerPtr,
      this.clock.time,
      this.clock.barTime,
      this.nextBarTime,
      this.begin,
      this.end,
      this.signal.ptr,
    )

    outputs[0].set(this.L)
    outputs[1].set(this.R)

    this.process = this.doRun
  }

  doStop: Process = (inputs, outputs) => {
    this.updateTime()

    this.vm.exports.runner_process(
      this.runnerPtr,
      this.clock.time,
      this.clock.barTime,
      -1,
      this.begin,
      this.end,
      this.signal.ptr,
    )

    outputs[0].set(this.L)
    outputs[1].set(this.R)

    this.clock.prevTime = -1

    this.process = this.doIdle
  }

  doRun: Process = (inputs, outputs) => {
    this.updateTime()

    this.vm.exports.runner_process(
      this.runnerPtr,
      this.clock.time,
      this.clock.barTime,
      this.nextBarTime,
      this.begin,
      this.end,
      this.signal.ptr,
    )

    outputs[0].set(this.L)
    outputs[1].set(this.R)
  }

  doIdle: Process = () => { }

  process: Process = this.doIdle

  clearSignal() {
    this.signal.L?.fill(0)
    this.signal.R?.fill(0)
    this.signal.LR?.fill(0)
    this.L?.fill(0)
    this.R?.fill(0)
  }

  async fill(barIndex: number, length: number) {
    const bar = this.bars[barIndex]
    if (!bar) return

    bar.reset()
    this.resetClock()
    this.clearSignal()

    this.vm.exports.runner_clearLastBar(this.runnerPtr)
    this.vm.exports.runner_fill(
      this.runnerPtr,
      barIndex,
      0,
      length,
      this.signal.ptr
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
    const frontend = new Frontend('test', vm, 44100)

    const processorOptions: BackendInit = {
      vmInit: {
        memory: vmMemory,
        vmBinary,
        pffftBinary,
      },
      buffers: frontend.buffers,
      runner: true
    }

    const backend = await Backend.instantiate(processorOptions)

    return { frontend, backend }
  }

  describe('backend', () => {
    it('fill', async () => {
      const { frontend, backend } = await prepare()

      // TODO: this code should fail because it's DC
      //  it should be [zero] 42+ LR+= to convert it to AC
      const source = { code: `42 LR+=` }
      const tokens = Array.from(frontend.tokenize(source))
      const info = frontend.produce(tokens)
      const sound = frontend.compile(info)
      await backend.setBarAt([0], [sound.payload], null)

      backend.fill(0, 2048)
      // console.log(backend)

      const outs = backend.signal
      expect(outs.LR![0]).toEqual(42)
    })
  })

}

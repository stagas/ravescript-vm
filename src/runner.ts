import { of } from 'signal'
import { MapSet } from 'utils'
import { Signal } from './backend.js'
import { MAX_BARS, MAX_BAR_INSTANCES, MAX_CTRLS, MAX_CTRL_INSTANCES } from './constants.js'
import { Frontend, type Build } from './frontend.js'
import { instantiate } from './instantiate.js'
import type { Module } from './lang/index.js'
import { BarView, CtrlView, SignalView } from './structs.js'
import { FixedArray } from './util.js'
import type { Vm } from './vm.js'

export class VmObject {
  constructor(public vm: Vm, public ptr: number) { }
}

export class VmCtrl extends VmObject {
  ctrlView?: CtrlView
  signalView?: SignalView

  instance?: Module.Instance | undefined
  payload?: Build.Payload | undefined
  build?: Build.Sound
  trash: number[] = []

  constructor(public vm: Vm, public ptr: number, public runner: VmRunner) {
    super(vm, ptr)
    this.ctrlView = CtrlView(vm.view.buffer, this.ptr)
    this.signalView = SignalView(vm.view.buffer, this.ctrlView.signal)
  }
  purge() {
    const { payload } = of(this)
    this.runner.vmCtrlsByInstanceId.delete(payload.instanceId, this)
    // if no more ctrls are using this instance, delete it entirely
    if (!this.runner.vmCtrlsByInstanceId.get(payload.instanceId)?.size) {
      this.trash.push(payload.instanceId)
      if (this.trash.length > 64) {
        const id = this.trash.shift()! // FIFO
        this.vm.ctrlInstances.delete(id)
        this.runner.frontend?.purge(id)
      }
    }
    this.instance = this.payload = void 0
  }
  async setPayload(payload: Build.Payload) {
    const { ctrlView, signalView } = of(this)

    if (this.payload) this.purge()

    this.payload = payload

    ctrlView.id = payload.instanceId

    signalView.L = payload.signal.L?.byteOffset ?? 0
    signalView.R = payload.signal.R?.byteOffset ?? 0
    signalView.LR = payload.signal.LR?.byteOffset ?? 0

    ctrlView.literalsCount = payload.literalsCount
    ctrlView.liveLiterals = payload.liveLiterals.byteOffset
    ctrlView.ownLiterals = payload.ownLiterals.byteOffset

    let trashIndex = -1
    const isNew = !this.vm.ctrlInstances.has(payload.instanceId)
    const isTrashed = !isNew && ((trashIndex = this.trash.indexOf(payload.instanceId)) >= 0)
    if (isNew || isTrashed) {
      // if the payload is in trash, we purge immediately and remove it
      if (trashIndex >= 0) {
        this.vm.ctrlInstances.delete(payload.instanceId)
        this.runner.frontend?.purge(payload.instanceId)
        this.trash.splice(trashIndex, 1)
      }
      this.instance = await instantiate<Module.Instance>(payload.binary, this.vm.env)
      this.vm.ctrlInstances.set(payload.instanceId, this.instance)
    }
    else {
      this.instance = this.vm.ctrlInstances.get(payload.instanceId)
    }

    this.runner.vmCtrlsByInstanceId.add(payload.instanceId, this)
  }
  reset() {
    const { instance, payload } = of(this)

    payload.gens.forEach((gen) => {
      gen.mem.set(gen.initial)
    })

    // TODO: apply initial literals before this update/reset?
    instance.exports.update_gens()
    instance.exports.reset_gens()

    payload.signal.L?.fill(0)
    payload.signal.R?.fill(0)
    payload.signal.LR?.fill(0)
  }
}

export class VmBar extends VmObject {
  bar: BarView
  barCtrls: Uint32Array
  ctrls: FixedArray<VmCtrl> = new FixedArray(16 * 4)
  main?: VmCtrl

  constructor(public vm: Vm, public ptr: number) {
    super(vm, ptr)

    this.bar = BarView(vm.view.buffer, this.ptr)
    this.barCtrls = vm.view.getU32(this.bar.ctrls, 16 << 2)
  }
  reset() {
    for (const ctrl of this.ctrls) {
      ctrl.reset()
    }
    this.main?.reset()
  }
  clear() {
    this.bar.size = 0
    this.bar.main = 0
    this.ctrls.clear()
  }
  setMain(main: VmCtrl) {
    this.main = main
    this.bar.main = main.ptr
  }
  addCtrl(ctrl: VmCtrl) {
    this.barCtrls[this.ctrls.size] = ctrl.ptr
    this.ctrls.push(ctrl)
    this.bar.size = this.ctrls.size
  }
}

export class VmRunner extends VmObject {
  bars: Uint32Array
  ctrls: Uint32Array

  vmBars: VmBar[] = []
  vmCtrls: VmCtrl[] = []
  vmCtrlsByPtr = new Map<number, VmCtrl>()
  vmCtrlsByInstanceId = new MapSet<number, VmCtrl>()

  barViews: VmBar[] = []

  frontend?: Frontend

  constructor(public vm: Vm, public ptr: number) {
    super(vm, ptr)

    const barsPtr = this.vm.exports.runner_get_bars(ptr)

    this.bars = this.vm.view.getU32(barsPtr, MAX_BARS)

    const barInstancesPtr: number = this.vm.exports.runner_get_barInstances(ptr)
    const barInstancesView = this.vm.view.getU32(barInstancesPtr, MAX_BAR_INSTANCES)

    for (let i = 0; i < MAX_BAR_INSTANCES; i++) {
      const ptr = barInstancesView[i]
      const bar = new VmBar(this.vm, ptr)
      this.vmBars.push(bar)
    }

    const ctrlsPtr = this.vm.exports.runner_get_ctrls(ptr)
    this.ctrls = this.vm.view.getU32(ctrlsPtr, MAX_CTRLS)

    const ctrlInstancesPtr: number = this.vm.exports.runner_get_ctrlInstances(this.ptr)
    const ctrlInstancesView = this.vm.view.getU32(ctrlInstancesPtr, MAX_CTRL_INSTANCES)
    for (let i = 0; i < MAX_CTRL_INSTANCES; i++) {
      const ptr = ctrlInstancesView[i]
      const ctrl = new VmCtrl(this.vm, ptr, this)
      this.vmCtrls.push(ctrl)
      this.vmCtrlsByPtr.set(ptr, ctrl)
    }
  }
  hasPayload(ptr: number) {
    const payloads = this.getPayloads()
    return Boolean(payloads[ptr])
  }
  getPayloads() {
    const payloads: Record<number, Build.Payload> = {}
    for (const bar of this.barViews) {
      if (!bar) continue
      if (bar.main?.payload) {
        payloads[bar.main.ptr] = bar.main.payload
      }
      for (const ctrl of bar.ctrls) {
        if (ctrl.payload) {
          payloads[ctrl.ptr] = ctrl.payload
        }
      }
    }
    return payloads
  }
  setBarView(barIndex: number, bar: VmBar) {
    this.barViews[barIndex] = bar
  }
  setBar(barIndex: number, bar: VmBar) {
    this.bars[barIndex] = bar.ptr
    this.barViews[barIndex] = bar
    for (let i = 0; i < this.bars.length; i++) {
      if (this.bars[i] === 0) {
        this.bars[i] = bar.ptr
        this.barViews[i] = bar
      }
    }
  }
  clearLastBar() {
    this.vm.exports.runner_clearLastBar(this.ptr)
  }
  process(begin: number, end: number, signal: Signal) {
    // console.log('PROCESS', this.ptr, signal.ptr, begin ,end, this)
    this.vm.exports.runner_process(
      this.ptr,
      begin,
      end,
      signal.ptr!,
    )
  }
  fill(barIndex: number, begin: number, end: number, signal: Signal) {
    this.vm.exports.runner_fill(
      this.ptr,
      barIndex,
      begin,
      end,
      signal.ptr!,
    )
  }
}

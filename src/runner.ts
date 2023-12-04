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
  async setPayload(payload: Build.Payload, withInstance: boolean) {
    const { ctrlView, signalView } = of(this)

    // if (this.payload) this.purge()

    this.payload = payload

    ctrlView.id = payload.instanceId

    signalView.L = payload.signal.L?.byteOffset ?? 0
    signalView.R = payload.signal.R?.byteOffset ?? 0
    signalView.LR = payload.signal.LR?.byteOffset ?? 0

    ctrlView.literalsCount = payload.literalsCount
    ctrlView.liveLiterals = payload.liveLiterals.byteOffset
    ctrlView.ownLiterals = payload.ownLiterals.byteOffset

    if (withInstance) {
      let instance = this.vm.ctrlInstances.get(payload.instanceId)

      if (!instance) {
        instance = await instantiate<Module.Instance>(payload.binary, this.vm.env)
        this.vm.ctrlInstances.set(payload.instanceId, instance)
      }

      this.instance = instance
    }
  }
  reset() {
    const { instance, payload } = of(this)

    payload.gens.forEach((gen) => {
      gen.mem.set(gen.initial)
    })

    // TODO: apply initial literals before this update/reset?
    // payload.liveLiterals.set(payload.ownLiterals)
    instance.exports.update_gens()
    instance.exports.reset_gens()

    payload.signal.L?.fill(0)
    payload.signal.R?.fill(0)
    payload.signal.LR?.fill(0)
  }
}

export class VmBar extends VmObject {
  bar: BarView
  barTracks: Uint32Array

  main?: VmCtrl | null
  tracks: FixedArray<VmCtrl> = new FixedArray(16 * 4)

  constructor(public vm: Vm, public ptr: number) {
    super(vm, ptr)

    this.bar = BarView(vm.view.buffer, this.ptr)
    this.barTracks = vm.view.getU32(
      this.bar.tracks, 16 << 2)
  }
  reset() {
    // TODO: get the ctrls using the pointers instead
    for (const ctrl of this.tracks) {
      ctrl.reset()
    }
    this.main?.reset()
  }
  clear() {
    this.main = null
    this.bar.size = 0
    this.bar.main = 0
    this.tracks.clear()
  }
  setMain(main: VmCtrl) {
    if (!main.ptr) {
      throw new Error('setMain failed: main.ptr is null(0)')
    }
    this.main = main
    this.bar.main = main.ptr
  }
  addTrack(track: VmCtrl) {
    if (!track.ptr) {
      throw new Error('addTrack failed: track.ptr is null(0)')
    }
    this.barTracks[this.tracks.size] = track.ptr
    this.tracks.push(track)
    this.bar.size = this.tracks.size
  }
}

export class VmRunner extends VmObject {
  bars: Uint32Array
  vmBars: VmBar[] = []
  vmBarsByPtr = new Map<number, VmBar>()

  ctrls: Uint32Array
  vmCtrls: VmCtrl[] = []
  vmCtrlsByPtr = new Map<number, VmCtrl>()
  vmCtrlsByInstanceId = new MapSet<number, VmCtrl>()

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
      this.vmBarsByPtr.set(ptr, bar)
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
  getBars() {
    return new Set([...new Set(this.bars)]
      .map(ptr => this.vmBarsByPtr.get(ptr))
      .filter(Boolean))
  }
  clearLastBar() {
    this.vm.exports.runner_clearLastBar(this.ptr)
  }
  process(begin: number, end: number, signal: Signal) {
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

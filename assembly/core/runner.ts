import { logi, setCtrlInstanceAt, resetCtrlInstance } from '../env'
import { copyInto, copyMem } from '../graph/copy'
import { fadeIn, fadeOut } from '../graph/fade'
import { add_audio_audio } from '../math'
import { Clock } from './clock'

@unmanaged
class MidiEvent {
  time: f64 = 0
  x: u8 = 0
  y: u8 = 0
  z: u8 = 0
}

@unmanaged
export class Voices {
  voices: StaticArray<MidiEvent> = new StaticArray<MidiEvent>(16)
}

@unmanaged
export class Beats {
  beats: StaticArray<Voices> = new StaticArray<Voices>(8)
}

@unmanaged
export class Bar {
  size: u32 = 0
  main: usize = 0
  tracks: StaticArray<Ctrl> = new StaticArray<Ctrl>(16)
  // events: StaticArray<Beats> = new StaticArray<Beats>(16)
}

@unmanaged
export class Signal {
  L: usize = 0
  R: usize = 0
  LR: usize = 0
}

@unmanaged
export class Ctrl {
  tableIndex: u32 = 0
  id: u32 = 0
  signal: Signal = new Signal()
  literalsCount: usize = 0
  liveLiterals: usize = 0
  ownLiterals: usize = 0

  get run(): u32 { return this.tableIndex }
  get update_gens(): u32 { return this.tableIndex + 1 }
}

// @ts-ignore
@inline
function exists(ctrl: Ctrl, bar: Bar): bool {
  let found: bool = false
  let other: Ctrl
  for (let y: u32 = 0; y < bar.size; y++) {
    other = bar.tracks[y]
    if (ctrl.id === other.id) {
      found = true
      break
    }
  }
  return found
}

// @ts-ignore
@inline
function applyLiterals(ctrl: Ctrl): void {
  copyMem(
    ctrl.ownLiterals,
    ctrl.liveLiterals,
    ctrl.literalsCount << 2
  )
}

// @ts-ignore
@inline
function mix(last: Bar, ctrl: Ctrl, begin: u32, end: u32): void {
  let existed: bool = exists(ctrl, last)

  if (!existed) {
    resetCtrlInstance(ctrl.id)
  }

  applyLiterals(ctrl)

  call_indirect<void>(ctrl.run, begin, end)

  if (!existed) {
    fadeInSignal(8, begin, end, ctrl.signal)
  }
}

const MAX_BAR_INSTANCES: i32 = 512
const MAX_BARS: i32 = 512
const MAX_CTRL_INSTANCES: i32 = 512
const MAX_CTRLS: i32 = 512

export class Runner {
  barInstances: StaticArray<Bar> = new StaticArray<Bar>(MAX_BAR_INSTANCES)
  bars: StaticArray<Bar | null> = new StaticArray<Bar | null>(MAX_BARS)
  ctrlInstances: StaticArray<Ctrl> = new StaticArray<Ctrl>(MAX_CTRL_INSTANCES)
  ctrls: StaticArray<Ctrl> = new StaticArray<Ctrl>(MAX_CTRLS)

  // main: Ctrl | null = null
  lastMain: Ctrl | null = null

  last: Bar | null = null
  tableIndex: u32 = 0

  constructor(public clock: Clock) {
    for (let i = 0; i < MAX_BAR_INSTANCES; i++) {
      this.barInstances[i] = new Bar()
    }
    for (let i = 0; i < MAX_CTRL_INSTANCES; i++) {
      this.ctrlInstances[i] = new Ctrl()
    }
  }

  @inline
  setTimes(time: f64, barTime: f64): void {
    this.clock.time = time
    this.clock.barTime = barTime
  }

  @inline
  register(ctrl: Ctrl): void {
    let tableIndex: u32 = this.tableIndex

    setCtrlInstanceAt(ctrl.id, tableIndex)
    ctrl.tableIndex = tableIndex

    tableIndex = tableIndex + 2
    if (tableIndex === 128) tableIndex = 0

    this.tableIndex = tableIndex
  }

  fill(barIndex: u32, begin: u32, end: u32, out: Signal): void {
    const curr: Bar | null = this.bars[barIndex]
    if (!curr) return

    let ctrl: Ctrl
    for (let x: u32 = 0; x < curr.size; x++) {
      this.setTimes(0, 0)
      ctrl = curr.tracks[x]
      this.register(ctrl)
      applyLiterals(ctrl)
      call_indirect<void>(ctrl.run, begin, end)
      addSignal(begin, end, ctrl.signal, out)
    }

    const main: Ctrl | null = changetype<Ctrl | null>(curr.main)
    if (main) {
      this.setTimes(0, 0)
      this.register(main)
      applyLiterals(main)
      call_indirect<void>(main.run, begin, end)
      copyInto(begin, end, main.signal.L, out.L)
      copyInto(begin, end, main.signal.R, out.R)
    }
  }

  process(begin: u32, end: u32, out: Signal): void {
    const actualTime: f64 = this.clock.time
    const barTime: f64 = this.clock.barTime
    const currBarIndex: u32 = u32(barTime)
    const nextBarIndex: i32 = i32(this.clock.nextBarTime)

    // const main: Ctrl | null = this.main
    const curr: Bar | null = this.bars[currBarIndex]
    if (!curr || !curr.size) {
      this.clock.time = actualTime + (128 * this.clock.timeStep)
      return
    }

    const main: Ctrl = changetype<Ctrl>(curr.main)
    const next: Bar | null = nextBarIndex < 0 ? null : this.bars[nextBarIndex]
    const last: Bar | null = this.last
    let ctrl: Ctrl

    // x ? ?
    // We have been playing a bar.
    if (last) {
      // x x ?
      // We will play the same bar.
      if (last === curr) {
        // x x x
        // The next bar is the same, no transitions.
        if (curr === next) {
          // logi(111)
          for (let x: u32 = 0; x < curr.size; x++) {
            if (x > 0) this.setTimes(actualTime, barTime)
            ctrl = curr.tracks[x]

            // this.register(ctrl)

            applyLiterals(ctrl)
            call_indirect<void>(ctrl.run, begin, end)
            addSignal(begin, end, ctrl.signal, out)
          }
        }
        // x x y
        // Next bar is different, do transitions.
        else {
          // logi(112)
          for (let x: u32 = 0; x < curr.size; x++) {
            if (x > 0) this.setTimes(actualTime, barTime)
            ctrl = curr.tracks[x]

            // this.register(ctrl)

            applyLiterals(ctrl)
            call_indirect<void>(ctrl.run, begin, end)
            if (!next || !exists(ctrl, next)) {
              fadeOutSignal(128, begin, end, ctrl.signal)
            }
            addSignal(begin, end, ctrl.signal, out)
          }
        }
      }
      // x y ?
      // We will play a different bar.
      else {
        // x y y
        // The new bar is the same as the next.
        if (curr === next) {
          // logi(122)
          for (let x: u32 = 0; x < curr.size; x++) {
            if (x > 0) this.setTimes(actualTime, barTime)
            ctrl = curr.tracks[x]
            this.register(ctrl)
            mix(last, ctrl, begin, end)
            addSignal(begin, end, ctrl.signal, out)
          }
          this.lastMain = null
        }
        // x y z
        // The next bar is different, this is the case
        // where we navigate at the last bar right before
        // the loop.
        else {
          // logi(123)
          for (let x: u32 = 0; x < curr.size; x++) {
            if (x > 0) this.setTimes(actualTime, barTime)
            ctrl = curr.tracks[x]
            this.register(ctrl)
            mix(last, ctrl, begin, end)
            if (!next || !exists(ctrl, next)) {
              fadeOutSignal(128, begin, end, ctrl.signal)
            }
            addSignal(begin, end, ctrl.signal, out)
          }
          this.lastMain = null
        }
      }
    }
    // - ? ?
    // We are just starting.
    else {
      // - x x
      // The new bar is the same as the next.
      if (curr === next) {
        // logi(811)
        for (let x: u32 = 0; x < curr.size; x++) {
          if (x > 0) this.setTimes(actualTime, barTime)
          ctrl = curr.tracks[x]
          this.register(ctrl)
          resetCtrlInstance(ctrl.id)
          applyLiterals(ctrl)
          call_indirect<void>(ctrl.run, begin, end)
          fadeInSignal(32, begin, end, ctrl.signal)
          addSignal(begin, end, ctrl.signal, out)
        }
        this.lastMain = null
      }
      // - x y
      // The next bar is different, this is the case
      // where we navigate at the last bar right before
      // the loop.
      else {
        // logi(812)
        for (let x: u32 = 0; x < curr.size; x++) {
          if (x > 0) this.setTimes(actualTime, barTime)
          ctrl = curr.tracks[x]
          this.register(ctrl)
          resetCtrlInstance(ctrl.id)
          applyLiterals(ctrl)
          call_indirect<void>(ctrl.run, begin, end)
          fadeInSignal(32, begin, end, ctrl.signal)
          if (!next || !exists(ctrl, next)) {
            fadeOutSignal(128, begin, end, ctrl.signal)
          }
          addSignal(begin, end, ctrl.signal, out)
        }
        this.lastMain = null
      }
    }

    if (main !== this.lastMain) {
      this.lastMain = main
      if (main) this.register(main)
    }
    this.setTimes(actualTime, barTime)
    applyLiterals(main)
    call_indirect<void>(main.run, begin, end)
    copyInto(begin, end, main.signal.L, out.L)
    copyInto(begin, end, main.signal.R, out.R)

    this.last = curr
  }

  clearLastBar(): void {
    this.last = null
  }
}

// @ts-ignore
@inline
function addSignal(begin: u32, end: u32, sIn: Signal, sOut: Signal): void {
  if (sIn.L) add_audio_audio(sIn.L, sOut.L, begin, end, sOut.L)
  if (sIn.R) add_audio_audio(sIn.R, sOut.R, begin, end, sOut.R)
  if (sIn.LR) add_audio_audio(sIn.LR, sOut.LR, begin, end, sOut.LR)
}

// @ts-ignore
@inline
function fadeInSignal(total: u32, begin: u32, end: u32, s: Signal): void {
  if (s.L) fadeIn(total, begin, end, s.L)
  if (s.R) fadeIn(total, begin, end, s.R)
  if (s.LR) fadeIn(total, begin, end, s.LR)
}

// @ts-ignore
@inline
function fadeOutSignal(total: u32, begin: u32, end: u32, s: Signal): void {
  if (s.L) fadeOut(total, begin, end, s.L)
  if (s.R) fadeOut(total, begin, end, s.R)
  if (s.LR) fadeOut(total, begin, end, s.LR)
}

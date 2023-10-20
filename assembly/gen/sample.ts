import { DELAY_MAX_SIZE, SAMPLE_MAX_SIZE } from '../core/constants'
import { logd, logf, logi } from '../env'
import { cubic, cubicFrac, phaseFrac } from '../util'
import { Gen } from './gen'

export class Sample extends Gen {
  offset: f32 = 0;
  trig: f32 = 0

  _floats: StaticArray<f32> = new StaticArray<f32>(SAMPLE_MAX_SIZE)
  _mask: u32 = SAMPLE_MAX_SIZE - 1
  _phase: u32 = 0
  _step: u32 = 0
  _offsetCurrent: f64 = -1
  _offsetTarget: f64 = 0

  _lastTrig: f32 = -1

  _update(): void {
    this._offsetTarget = <f64>this.offset * <f64>(this._engine.rateStep >> 2) + <f64>this._mask
    if (this._offsetCurrent === -1) this._offsetCurrent = this._offsetTarget
    this.offset = 0

    if (this._lastTrig !== 0 && this.trig === 0) {
      this._phase = 0
    }

    this._lastTrig = this.trig
  }

  _audio(begin: u32, end: u32, out: usize): void {
    const mask: u32 = this._mask
    const step: u32 = this._engine.rateStep >> 2

    let offsetCurrent: f64 = this._offsetCurrent
    const offsetTarget: f64 = this._offsetTarget

    let phase: u32 = this._phase
    let index: u32
    let sample: f32
    let frac: f32
    let offset: u32

    let i: u32 = begin

    out += begin << 2

    for (; i < end; i += 16) {
      unroll(16, () => {
        offset = phase >> 14
        index = (offset + u32(offsetCurrent)) & mask
        frac = phaseFrac(phase)
        sample = cubicFrac(this._floats, index, frac, mask)
        f32.store(out, sample)
        out += 4
        phase += step
        offsetCurrent += (offsetTarget - offsetCurrent) * 0.0008
      })
    }

    this._phase = phase
    this._offsetCurrent = offsetCurrent
  }
}

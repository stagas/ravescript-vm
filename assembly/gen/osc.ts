import { logi } from '../env'
import { Gen } from './gen'

export abstract class Osc extends Gen {
  /** Frequency. */
  hz: f32 = 440
  /** Trigger phase sync when set to 0. */
  trig: f32 = 0
  /** Phase offset. */
  offset: f32 = 0

  _phase: u32 = 0
  _step: u32 = 0
  _sample: f32 = 0
  _lastTrig: i32 = -1
  _offsetU32: u32 = 0

  get _table(): StaticArray<f32> {
    return this._engine.wavetable.sine
  }

  get _mask(): u32 {
    return this._engine.wavetable.mask
  }

  _update(): void {
    // TODO: the / 8 needs to be determined and not hard coded
    this._step = u32(<f64>this.hz * <f64>this._engine.rateStep / 8)
    this._offsetU32 = u32(<f64>this.offset * <f64>0xFFFFFFFF)
    this.offset = 0

    if (this._lastTrig !== i32(this.trig)) {
      this._phase = 0
    }

    // TODO: implement Sync (zero crossing reset phase)

    this._lastTrig = i32(this.trig)
  }

  _next(): void {
    this._phase += this._step
  }

  _audio(begin: u32, end: u32, targetPtr: usize): void {
    this._phase = this._engine.wavetable.read(
      <u32>changetype<usize>(this._table),
      this._mask,
      this._phase,
      this._offsetU32,
      this._step,
      begin,
      end,
      targetPtr
    )
  }
}

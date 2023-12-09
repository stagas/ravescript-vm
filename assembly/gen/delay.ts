import { DELAY_MAX_SIZE } from '../core/constants'
import { cubic } from '../util'
import { logd, logf, logi } from '../env'
import { Gen } from './gen'

export class Delay extends Gen {
  ms: f32 = 200;
  fb: f32 = 0.5;

  in: u32 = 0;

  _floats: StaticArray<f32> = new StaticArray<f32>(DELAY_MAX_SIZE)
  _mask: u32 = DELAY_MAX_SIZE - 1
  _index: u32 = 0
  _stepf: f32 = 0
  _targetf: f32 = 0

  _update(): void {
    this._targetf = Mathf.min(<f32>DELAY_MAX_SIZE - 1, (this.ms * 0.001) * <f32>this._engine.rateStep)
    if (this._stepf === 0) this._stepf = this._targetf
  }

  _reset(): void {
    this._floats.fill(0, 0, DELAY_MAX_SIZE)
    // this._stepf = 0
    // this._index = 0
    // this._targetf = 0
  }

  _audio(begin: u32, end: u32, out: usize): void {
    const length: u32 = end - begin

    let sample: f32 = 0
    let inp: u32 = this.in

    let i: u32 = begin
    end = i + length

    const offset = begin << 2
    inp += offset
    out += offset

    const mask: u32 = this._mask
    let index: u32 = this._index
    const fb: f32 = this.fb
    let delay: f32 = 0
    let stepf: f32 = this._stepf
    const targetf: f32 = this._targetf

    for (; i < end; i += 16) {
      unroll(16, () => {
        sample = f32.load(inp)

        // logi((index - step) & mask)
        delay = cubic(this._floats, (<f32>index - stepf), mask)
        // delay = this.floats[(index - step) & mask]

        this._floats[index] = sample + delay * fb

        f32.store(out, delay)

        inp += 4
        out += 4

        index = (index + 1) & mask
        stepf += (targetf - stepf) * 0.0008
      })
    }

    this._index = index
    this._stepf = stepf
  }
}

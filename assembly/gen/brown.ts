import { Gen } from './gen'
import { logd, logf, logi } from '../env'
import { rnd } from '../util'

export class Brown extends Gen {
  _lastOut: f32 = 0.0
  _audio(begin: u32, end: u32, out: usize): void {
    const length: u32 = end - begin

    let i: u32 = begin
    end = i + length

    const offset = begin << 2
    out += offset

    let value: f32 = 0.0
    let lastOut = this._lastOut 
    for (; i < end; i += 16) {
      unroll(16, () => {
        //let white = f32(rnd()) * 2 - 1
        value = (this._lastOut + (0.02 * (f32(rnd()) * 2 - 1))) / 1.02
        this._lastOut = value
        value *= 3.5
        f32.store(out, value)

        out += 4
      })
    }
  }
}
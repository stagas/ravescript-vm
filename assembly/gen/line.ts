import { logi, logf } from '../env'
import { Gen } from './gen'

export class Line extends Gen {
  target: f32 = 1.0
  time: f32 = 1000 //milliseconds

  _lastTrig: i32 = -1

  _value: f32 = 0.0
  _msecSamples: f32 = <f32>this._engine.audioRate / 1000 //this is the ms in samples
  _stepf: f32 = 0

  _audio(begin: u32, end: u32, out: usize): void {
    const length: u32 = end - begin

    let i: u32 = begin
    end = i + length

    const offset = begin << 2
    out += offset

    let value: f32 = this._value
    let target: f32 = this.target
    let time: f32 = this.time
    let stepf: f32 = this._stepf
    let msecSamples: f32 = this._msecSamples
    let msec: f32 = 0
    for (; i < end; i += 16) {
      unroll(16, () => {
        f32.store(out, value)
        msec = <f32>Math.round(stepf / msecSamples)
        if(msec < time){
          value = ((msec % time) / time) * target
        }
          
        out += 4
        stepf += 1
        this._stepf = stepf
      })
    }

    this._value = value
  }
}

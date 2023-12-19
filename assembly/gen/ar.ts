import { logi, logf } from '../env'
import { Gen } from './gen'

export class Ar extends Gen {
  target: f32 = 1.0
  a: f32 = 1000 //milliseconds
  r: f32 = 1000
  _lastTrig: i32 = -1

  _value: f32 = 0.0
  _msecSamples: f32 = <f32>this._engine.audioRate / 1000 //this is the ms in samples
  _samplef: f32 = 0
  //_stepf: f32 = this.target / this.time
  _audio(begin: u32, end: u32, out: usize): void {
    const length: u32 = end - begin

    let i: u32 = begin
    end = i + length

    const offset = begin << 2
    out += offset

    let value: f32 = this._value
    let target: f32 = this.target
    let a_time: f32 = this.a
    let r_time: f32 = this.r
    let samplef: f32 = this._samplef
    let a_stepf: f32 = this.target / a_time
    let r_stepf: f32 = this.target / r_time
    //logf(stepf)
    let msecSamples: f32 = this._msecSamples
    let msec: f32 = 0
    let msec_old: f32 = 0
    let mode = 'attack'
    for (; i < end; i += 16) {
      unroll(16, () => {
        f32.store(out, value)
        msec = <f32>Math.round(samplef / msecSamples)
        //logf(msec)
        if(msec > a_time && mode === 'attack') {
          mode = 'release'
        }
        if(msec !== msec_old  && mode === 'attack')  {
          value += a_stepf
          msec_old = msec
        }
        else if (msec !== msec_old && mode === 'release') {
          value -= r_stepf 
          if(value < 0.0000001){
            mode = 'dead'
            value = 0
          } 
          msec_old = msec
        }

        out += 4
        samplef += 1
        this._samplef = samplef
      })
    }

    this._value = value
  }
}

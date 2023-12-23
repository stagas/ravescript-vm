import { logi, logf } from '../env'
import { Gen } from './gen'

enum AdsrState { Attack, Decay, Sustain, Release, End, }

export class Adsr extends Gen {
  attack: f32 = 1000 //milliseconds
  decay: f32 = 200
  sustain: f32 = 0.5
  release: f32 = 1000

  _value: f32 = 0.0
  _msecSamples: f32 = <f32>this._engine.audioRate / 1000 //this is the ms in samples
  _samplef: f32 = 0
  _state: AdsrState = AdsrState.Attack
  _msec: f32 = 0
  //_stepf: f32 = this.target / this.time
  _audio(begin: u32, end: u32, out: usize): void {
    const length: u32 = end - begin

    let i: u32 = begin
    end = i + length

    const offset = begin << 2
    out += offset

    

    let value: f32 = this._value
    let a_time: f32 = this.attack
    let d_time: f32 = this.decay
    let sustain: f32 = this.sustain
    let r_time: f32 = this.release
    let samplef: f32 = this._samplef
    let a_stepf: f32 = 1.0 / a_time
    let d_stepf: f32 = (1.0 - sustain) / d_time
    let r_stepf: f32 = sustain / r_time
    let msecSamples: f32 = this._msecSamples
    let msec: f32 = this._msec
    let msec_old: f32 = this._msec
    let state = this._state
    for (; i < end; i += 16) {
      unroll(16, () => {
        
        msec = <f32>Math.round(samplef / msecSamples)
        

        if (msec !== msec_old){
          msec_old = msec
          switch(state) {
            case AdsrState.Attack:
              value += a_stepf
              
              if(msec >= a_time)
                state = AdsrState.Decay
            break;
            case AdsrState.Decay:
              value -= d_stepf
              if(msec >= (a_time + d_time)) 
                state = AdsrState.Release
              break;
            case AdsrState.Release:
              value -= r_stepf
              if(value < 0.0000001){
                state = AdsrState.End
                value = 0
              }
            break;
          }
        }

        out += 4
        samplef += 1
        
        f32.store(out, value)
      })
    }

    this._samplef = samplef
    this._value = value
    this._state = state
    this._msec = msec
  }
}

import { logi } from '../env'

@unmanaged
export class Clock {
  /*0*/ time: f64 = 0
  /*1*/ timeStep: f64 = 0
  /*2*/ prevTime: f64 = -1
  /*3*/ endTime: f64 = 0
  /*4*/ internalTime: f64 = 0
  /*5*/ bpm: f64 = 60
  /*6*/ coeff: f64 = 0
  /*7*/ barTime: f64 = 0
  /*8*/ barTimeStep: f64 = 0
  /*9*/ nextBarTime: f64 = 0
  /*10*/ loopStart: f64 = -Infinity
  /*11*/ loopEnd: f64 = +Infinity
  /*12*/ sampleRate: u32 = 48000
  jumpBar: i32 = -1
  ringPos: u32 = 0
}

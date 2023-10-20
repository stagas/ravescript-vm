import { defineStruct } from './struct'

export type Clock = typeof Clock.type

export const Clock = defineStruct({
  time: 'f64',
  timeStep: 'f64',
  prevTime: 'f64',
  endTime: 'f64',
  internalTime: 'f64',
  bpm: 'f64',
  coeff: 'f64',
  barTime: 'f64',
  barTimeStep: 'f64',
  loopStart: 'f64',
  loopEnd: 'f64',
  sampleRate: 'u32',
  jumpBar: 'i32',
  ringPos: 'u32',
})

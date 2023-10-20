/* eslint-disable @typescript-eslint/ban-ts-comment */

import { WAVETABLE_SIZE } from './constants'

let seed: u32 = 0
function rnd(amt: f64 = 1): f64 {
  seed += 0x6D2B79F5
  let t: u32 = seed
  t = (t ^ t >>> 15) * (t | 1)
  t ^= t + (t ^ t >>> 7) * (t | 61)
  return (f64((t ^ t >>> 14) >>> 0) / 4294967296.0) * amt
}

// @ts-ignore
@inline const HALF_PI: f64 = Math.PI / 2.0

export class Wave {
  @inline static sine(phase: f64): f64 {
    return Math.sin(phase)
  }

  @inline static saw(phase: f64): f64 {
    return 1.0 - (((phase + Math.PI) / Math.PI) % 2.0)
  }

  @inline static ramp(phase: f64): f64 {
    return (((phase + Math.PI) / Math.PI) % 2.0) - 1.0
  }

  @inline static tri(phase: f64): f64 {
    return 1.0 - Math.abs(1.0 - (((phase + HALF_PI) / Math.PI) % 2.0)) * 2.0
  }

  @inline static sqr(phase: f64): f64 {
    return Wave.ramp(phase) < 0 ? -1 : 1
  }

  @inline static noise(phase: f64): f64 {
    return rnd() * 2.0 - 1.0
  }
}

const numHarmonics: u32 = 16
export class Blit {
  @inline static saw(i: u32): f64 {
    let value: f64 = 0.0
    for (let h: u32 = 1; h <= numHarmonics; h++) {
      const harmonicPhase: f64 = f64(i * h) / f64(WAVETABLE_SIZE)
      const harmonicValue: f64 = Math.sin(harmonicPhase) / f64(h);
      value += harmonicValue;
    }
    return value
  }
}

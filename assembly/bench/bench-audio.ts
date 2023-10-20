import { Gen } from '../gen/gen'
import { join21g } from '../graph/join'
import * as math from '../math'

const kBenchSize: u32 = 2048

export function benchAudio(gen: Gen, targetPtr: usize, times: u32): void {
  for (let i: u32 = 0; i < times; i++) {
    gen._audio(0, kBenchSize, targetPtr)
  }
}

export function benchAudioGain(gen: Gen, targetPtr: usize, times: u32): void {
  for (let i: u32 = 0; i < times; i++) {
    gen._audio(0, kBenchSize, targetPtr)
    math.mul_audio_scalar(targetPtr, gen.gain, 0, kBenchSize, targetPtr)
  }
}

export function benchAudioTwo(
  gen0: Gen,
  gen1: Gen,
  out0: usize,
  out1: usize,
  targetPtr: usize,
  times: u32
): void {
  for (let i: u32 = 0; i < times; i++) {
    gen0._audio(0, kBenchSize, out0)
    gen1._audio(0, kBenchSize, out1)
    join21g(
      0,
      kBenchSize,
      out0,
      out1,
      targetPtr,
      0.5,
      0.5
    )
  }
}

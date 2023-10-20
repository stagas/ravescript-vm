import { Wavetable } from './wavetable'
import { WAVETABLE_SIZE } from './constants'
import { allocF32, rateToPhaseStep } from '../util'
import { Clock } from './clock'
import { logi } from '../env'
import { Runner, Signal } from './runner'

export class Core {
  wavetable: Wavetable
  constructor(public audioRate: u32) {
    this.wavetable = new Wavetable(audioRate, WAVETABLE_SIZE)
  }
}

export class Engine {
  rateSamples: u32
  rateStep: u32
  wavetable: Wavetable
  clock: Clock
  runner: Runner
  signal: Signal = new Signal()

  constructor(public audioRate: u32, public core: Core) {
    const clock = new Clock()
    this.runner = new Runner(clock)
    this.wavetable = core.wavetable
    this.rateSamples = audioRate
    this.rateStep = rateToPhaseStep(audioRate)
    this.clock = clock
    this.clock.sampleRate = audioRate
  }

  createBlock(blockSize: u32): StaticArray<f32> {
    return allocF32(blockSize)
  }
}

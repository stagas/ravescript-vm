import { Engine } from '../core/engine'
import { logi } from '../env'
import { rateToPhaseStep } from '../util'
import { Gen } from './gen'

export class Rate extends Gen {
  samples: f32
  constructor(public _engine: Engine) {
    super(_engine)
    this.samples = f32(_engine.audioRate)
  }
  _update(): void {
    // if (this.samples < 1.0) this.samples = 1.0
    this._engine.rateSamples = u32(this.samples)
    this._engine.rateStep = rateToPhaseStep(u32(this.samples))
  }
}

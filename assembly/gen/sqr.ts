import { AOsc } from './aosc'

export class Sqr extends AOsc {
  get _tables(): StaticArray<StaticArray<f32>> {
    return this._engine.wavetable.antialias.sqr
  }
}

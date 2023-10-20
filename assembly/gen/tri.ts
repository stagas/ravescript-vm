import { AOsc } from './aosc'

export class Tri extends AOsc {
  get _tables(): StaticArray<StaticArray<f32>> {
    return this._engine.wavetable.antialias.tri
  }
}

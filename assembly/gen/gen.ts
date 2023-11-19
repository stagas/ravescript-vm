import { Engine } from '../core/engine'

export abstract class Gen {
  gain: f32 = 1
  constructor(public _engine: Engine) { }
  _update(): void { }
  _reset(): void { }
  _audio(begin: u32, end: u32, targetPtr: usize): void { }
}

import { defineStruct } from './struct.ts'

export type SignalView = typeof SignalView.type
export const SignalView = defineStruct({
  L: 'usize',
  R: 'usize',
  LR: 'usize',
})

export type BarView = typeof BarView.type
export const BarView = defineStruct({
  size: 'u32',
  main: 'usize',
  tracks: 'usize',
})

export type CtrlView = typeof CtrlView.type
export const CtrlView = defineStruct({
  tableIndex: 'u32',
  id: 'u32',
  signal: 'usize',
  literalsCount: 'usize',
  liveLiterals: 'usize',
  ownLiterals: 'usize',
})

export type VolView = typeof VolView.type
export const VolView = defineStruct({
  L: 'f32',
  R: 'f32',
  LR: 'f32',
})

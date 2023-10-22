import { envTypes } from './env-types.ts'

export { envTypes }

const keys = Object.entries(envTypes)

// const priv = `params x1 x2 y1 y2 a0 a1 a2 b0 b1 b2 alpha beta sample step
// c1 c2 a3 v1 v2 v3 floats index engine rateKind initial
// stepf targetf
// dpn exn edn predelay
// d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11
// mask lp1 lp2 lp3 excPhase pdn
// offsetIndex offsetCurrent offsetTarget phase
// prevLevel gainReduction attackRecip releaseRecip
// lastTrig hasTrig table gainv
// A a a2 b b2 c g g0 ah bh ainv k z0 z1 z2 z3 z4 C s
// offsetU32 real imag saw wavetables freqs numOfTables tableLength
// tableMask tableIndex maxHarms tables
// `.split(/\s+/g)

export type Range = [number | string, number | string, number | string, number]
const ranges: Record<string, Range> = {
  hz: [0, 'sample_rate_float', 'sample_rate_float/42.0', .5],
  cut: [10, 'sample_rate_float', 'sample_rate_float/42.0', .5],
  hpf: [0.0001, 'sample_rate_float', '1000', .5],
  q: [0.01, 5, 0.5, 1],
  ms: [0, 1000, 200, 1],
  fb: [0, 0.99, 0.5, 1],
  threshold: [0, 1, 0.5, 1],
  samples: [1, 10_000_000, 'sample_rate', 1],
}

export interface PropInfo {
  id: string
  label: string
  stack: boolean
  params: string[]
  /** [min,max,default,slope] */
  range: Range | null
}

const gens: Record<string, PropInfo[]> = {}


for (const [id, type] of keys) {
  const params = type.split(')')[0].split('(')[1].split(' ')
  let [pre, name, getOrSet, label, label2] = id.split('_')
  // || priv.includes(label)
  // console.log([pre, name, getOrSet, label, label2])
  if (pre === 'gen') {
    // console.log('YES', name)
    gens[name] ??= []
  }
  if (!getOrSet || !label) continue
  // label = label2 || label

  if (pre === 'gen') {
    // console.log('YES', name)
    gens[name] ??= []
    const stack = (
      ['in'].includes(label)
      || Object.keys(gens[name]).length === 0
    ) && !['offset'].includes(label)
    if (getOrSet === 'set') {
      gens[name].push({
        id,
        label,
        stack,
        params,
        range: ranges[label] ?? null
      })
    }
  }
}

for (const key in gens) {
  if (gens[key].find((x: any) => x.label === 'cut')
    && !gens[key].find((x: any) => x.label === 'in')) {
    gens[key].splice(1, 0, gens.biquad[0])
  }
}
delete gens.gen

const inheritAOsc = 'saw ramp sqr tri'.split(/\s+/g)
inheritAOsc.forEach((x) => {
  gens[x].push(...gens.aosc, ...gens.osc)
})
delete gens.aosc

const inheritOsc = 'sin exp noise'.split(/\s+/g)
inheritOsc.forEach((x) => {
  gens[x].push(...gens.osc)
})
delete gens.osc


const inheritSample = 'freesound say'.split(/\s+/g)
inheritSample.forEach((x) => {
  gens[x].push(...gens.sample)
})

delete gens.biquad
delete gens.sample

const Proto = [
  [['dc', 'rate'], []],
  [['blp', 'bhp', 'bbp', 'bno', 'bpk', 'bap', 'bls', 'bhs'], ['biquad', 'gen']],
  [['slp', 'sbp', 'shp', 'sap', 'sno', 'spk'], ['svf', 'gen']],
  [['mlp', 'mhp'], ['moog', 'gen']],
  [inheritSample, ['sample', 'gen']],
  [['delay', 'daverb', 'tap', 'comp', 'lp', 'diode',
    'dclip', 'dcliplin', 'dclipexp',
    'clip', 'clamp'], ['gen']],
  [inheritAOsc, ['aosc', 'osc', 'gen']],
  [inheritOsc, ['osc', 'gen']],
]

const protoMap = new Map(Proto.flatMap(([keys, chain]) =>
  keys.map((key) => [key, [key, ...chain]])
))

export function envLookupMethod(text: string, method: string) {
  const protoChain = protoMap.get(text) ?? [text, 'gen']

  for (const kind of protoChain) {
    let id: string
    id = `gen_${kind}_${method}`
    if (id in envTypes) return id
    id = `${id}_override`
    if (id in envTypes) return id
  }
}

// console.log(inheritAOsc, gens, protoMap.get('saw'))
export { gens as envGens }

import { lexify } from '../compiler/lexer.ts'
import { generateModule } from '../compiler/moduleCodeGen.ts'
import { parse as compilerParse } from '../compiler/parser.ts'
import { VM_MEM_PAGES } from '../constants.ts'
import { envTypes } from '../env-types.ts'
import { analyse } from './analyser.ts'
import { Emitter, produce } from './emitter.ts'
import { AstNode, parse } from './parser.ts'
import { tokenize } from './tokenizer.ts'

export interface Module {
  run(begin: number, end: number): void
  rms(begin: number, end: number, resultsPtr: number): void
  rms_params(begin: number, end: number, resultsPtr: number): void
  update_gens(): void
  reset_gens(): void
  bench(times: number, begin: number, end: number): void
}

export namespace Module {
  export interface Instance {
    exports: Module
  }
}

export interface Compile { }
export namespace Compile {
  export type Env = {
    memory: WebAssembly.Memory
    log: (x: number) => void
  } & Record<string, WebAssembly.Memory | ((...args: any[]) => any)>

  export interface Ptrs {
    engine: number
    clock: number
    gens: number[]
    audios: number[]
    literals: number
    lists: number
    scalars: number
    events: number
    pointers: number
  }

  export interface Meta extends Ptrs {
    envTypes: Record<string, string>
  }

  export interface Result {
    text: string
    binary: Uint8Array
  }
}

export function float(v: number | string): string {
  v = `${v}`
  return v.includes('.')
    ? v.startsWith('.')
      ? `0${v}`
      : v.endsWith('.')
        ? `${v}0`
        : v
    : `${v}.0`
}

export function compile(
  info: Emitter.Info,
  meta: Compile.Meta,
  debug = false
): Compile.Result {
  const volParams = [...info.scope.params].filter(([, param]) => param.isVol && param.last)
  let hasSolo = false
  for (const [, param] of volParams) {
    if (param.solo && param.name?.text !== "'main'") {
      hasSolo = true
    }
  }
  const literalValues = new Map<AstNode.Literal, number>()
  for (const [literal, param] of volParams) {
    literalValues.set(literal,
      (param.solo || !hasSolo || param.name?.text === "'main'") && !param.mute
        ? literal.info.value
        : 0
    )
  }

  let text = `\
import default_memory 1 ${VM_MEM_PAGES} from "env/memory"
import logi: fn (i32) void from "env/logi"
import logf: fn (f32) void from "env/logf"
import logd: fn (f64) void from "env/logf"

${Object.entries(meta.envTypes).map(([id, type]) =>
    `import ${id}: fn ${type} from "env/${id}"`
  ).join('\n')}

// audios
${Array.from(info.audios, (audio, i) =>
    `${audio.code}:i32=${meta.audios[i]}`
  ).join('\n')}

// gens
${Array.from(info.gens, (gen, i) =>
    `${gen.code}:i32=${meta.gens[i]} // ${gen.kind}${gen.audio ? ` -> ${gen.audio.code}` : ''}`
  ).join('\n')}

// scalars
${Array.from(info.scalars, (s) =>
    `${s.code}:f32=0.0`
  ).join('\n')}

// scalars exported
scalar_exports: ptr f32=${meta.scalars >> 2}

// lists
lists: ptr f32=${meta.lists >> 2}

// literals
literals: ptr f32=${meta.literals >> 2}

clock: ptr f64=${meta.clock >> 3}

events: ptr i32=${meta.events >> 2}

pointers: ptr i32=${meta.pointers >> 2}

export run
run: fn (i: i32, end: i32) void {
  // audio buffer
  audio: ptr f32 = 0

  sample_rate: i32 = to_i32 cast_i64 clock[11]
  sample_rate_float: f32 = to_f32 sample_rate
  literal_2 = sample_rate_float

  ${Array.from(info.literals)
      // .filter(literal => info.scope.used.has(literal))
      .map((literal) =>
        `${literal.code}:f32=literals[${literal.ptr}] // ${literal.value}`
      ).join('\n  ')}

  time: f64 = clock[0]
  time_step: f64 = clock[1] * 64.0x64

  bar_time: f64 = clock[7]
  bar_time_step: f64 = clock[8] * 64.0x64

  literal_0 = to_f32 time
  literal_1 = to_f32 bar_time
  literals[0] = literal_0
  literals[1] = literal_1

  coeff: f64 = clock[6]
  literal_3 = to_f32 coeff
  literals[3] = literal_3

  // list pointers
  list_pos: f32 = 0.0
  list_index: f32 = 0.0
  list_next: f32 = 0.0

  // sample now
  sample: f32 = 0.0

  // list literals
  ${info.lists.join('\n  ')}

  loop {
    begin: i32 = i

    i=i+64

    ${info.codes.join('\n    ')}

    time = time + time_step
    bar_time = bar_time + bar_time_step

    literal_0 = to_f32 time
    literal_1 = to_f32 bar_time

    if (i >= end) break
  }

  literals[0] = literal_0
  literals[1] = literal_1
  clock[0] = time
  clock[7] = bar_time
}

export rms
rms: fn (begin: i32, end: i32, results: ptr f32) void {
  ${Array.from(info.audios).map((audio) =>
        `results[${audio.ptr}]=rms_(begin,end,${audio.code})`
      ).join('\n  ')}
}

export rms_params
rms_params: fn (begin: i32, end: i32, results: ptr f32) void {
  ${volParams.map(([, param]) =>
        `results[${param.last!.ptr}]=rms_(begin,end,${param.last!.code})`
      ).join('\n  ')}
}

export update_gens
update_gens: fn () void {
  ${info.updates.join('\n  ')}
}

export reset_gens
reset_gens: fn () void {
  ${info.resets.join('\n  ')}
}

export bench
bench: fn (times: i32, begin: i32, end: i32) void {
  i:i32=0

  loop {
    run(begin, end)
    i=i+1
    if (i>=times) break
  }
}

clamp: fn (min: f32, max: f32, value: f32) f32 {
  if (value < min) { min }
  else if (value > max) { max }
  else { value }
}

mod: fn (x: f64, y: f64) f64 {
  x - (floor(x / y) * y)
}

modf: fn (x: f32, y: f32) f32 {
  x - (floor(x / y) * y)
}
`

  info.scope.feedbacks.forEach((src, dst) => {
    const d = dst.info.emitterValue?.code
    const s = src.info.emitterValue?.code
    if (d && s && d !== s) {
      text = text.replaceAll(
        `${d},`,
        `${s},`,
      )
    }
  })

  if (debug) {
    console.groupCollapsed('code')
    console.log(text)
    console.groupEnd()
  }

  const tokens = lexify(text)
  const ast = compilerParse(tokens)
  const wasm = generateModule(ast)
  const binary = wasm.toByteArray()

  return { text, binary }
}

export function test_compiler() {
  // @env browser
  describe('compile', () => {
    const passing: [string, any][] = [
      ['sin: { hz:= `sin` } [sin 200]', [
        'gen_osc_set_hz(g0,l0)',
        'gen_osc_update(g0)',
        'gen_osc_audio(g0,begin,i,o0) // sin'
      ]]
    ]

    passing.forEach(([code, expected]) => {
      it(code, async () => {
        const ast = parse([...tokenize({ code })])
        console.log(ast)
        const scope = analyse(ast)
        console.log(scope)
        const info = produce(scope)
        console.log(info)

        const outputCode = info.codes.join('\n')
          + ' rms_ '
          + ' engine_get_rateSamples '

        const envTypesShaked = Object.fromEntries(Object.entries(envTypes)
          .filter(([key, fn]) =>
            outputCode.includes(key)
          ))

        const meta: Compile.Meta = {
          envTypes: envTypesShaked,
          audios: Array.from(info.audios, (_, i) => i),
          gens: Array.from(info.gens, (_, i) => i),
          engine: 0,
          clock: 0,
          literals: 0,
          scalars: 0,
          lists: 0,
          events: 0,
          pointers: 0,
        }

        const result = await compile(info, meta)

        expect(result.text).toEqual(expected)
      })
    })
  })
}

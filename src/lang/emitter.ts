// import { Rms } from '../../../web/rms'
import { PropInfo, envGens, envLookupMethod, envTypes } from '../env-info.ts'
import { Block } from '../frontend.ts'
import { GenRuntime } from '../gen-runtime.ts'
import { checksum, parseNumber } from '../util.ts'
import { Scope, analyse, isExternalSource } from './analyser.ts'
import { float } from './compiler.ts'
import { AstNode, parse } from './parser.ts'
import { Token, tokenize } from './tokenizer.ts'

// const audioLabels = ['in', 'sidechain']

// function cast(params: string[], x: string) {
//   return `${params[1] !== 'f32' &&
//     (x[0] === 's' || x[0] === 'l') ? `to_${params[1]} ` : ''}${x}`
// }

// TODO: Emitter.Item should be Emitter.Op.Item probably

function getTopScope(item: Emitter.Item) {
  let s: Scope | undefined = item.info.returnValue.info.scope
  let top: Scope = s
  do {
    if (s.type === Scope.Type.Expression) {
      top = s
    }
  } while (s = s.parent)
  return top
}

function getCallers(item: Emitter.Item) {
  const callers: Emitter.Caller[] = []

  let s: Scope | undefined = item.info.returnValue.info.scope
  do {
    let node: AstNode.Item | undefined = s.node
    if (
      node.type === AstNode.Type.Block
      && node.kind === AstNode.Block.Kind.Expression
    ) {
      if (
        s.parent?.returnStack.length
        // || s.parent?.returnStack.length
        // && s.parent.type !== Scope.Type.Prog
      ) {
        node.info.hasView = true
      }
      // console.log('AAAH', node, s.parent)
      callers.unshift({ node, scopeId: s.id })
    }
  } while (s = s.parent)

  if (item.type === Emitter.Op.Type.Binary) {
    if (!isExternalSource(item.info.op)) {
      callers.unshift({ node: item.info.op, scopeId: item.info.returnValue.info.scope.id })
    }
  }

  return callers
}

const Op = {
  '*': 'mul',
  '/': 'div',
  '+': 'add',
  '-': 'sub',
  '^': 'pow',
  '%': 'mod',
  '!': 'not',
  'floor': 'floor',
  'pick': 'pick',
  'slide': 'slide',
  'to_audio': 'to_audio',
} as any

export class Emitter {
  items: Emitter.Item[]
  types: Record<string, [Scope.Value.Type, Scope.Value.Kind?][]>
  info!: Emitter.Info

  constructor(public scope: Scope) {
    this.items = scope.emits

    const { Scalar, List } = Scope.Value.Type
    const { Literal, Computed, Audio } = Scope.Value.Scalar.Kind

    this.types = {
      in: [[Scalar, Audio], [Scalar, Literal], [Scalar, Computed]],
      cut: [[Scalar, Literal], [Scalar, Computed], [Scalar, Audio], [List]],
      hz: [[Scalar, Literal], [Scalar, Computed], [Scalar, Audio], [List]],
      offset: [[Scalar, Literal], [Scalar, Computed], [Scalar, Audio], [List]],
    }
  }

  gen(identifier: string): Emitter.Gen {
    const ptr = this.info.gens.length
    const item: Emitter.Gen = {
      type: Emitter.ItemType.Gen,
      code: `gen_${ptr}`,
      ptr,
      kind: identifier,
      locals: {},
    }
    this.info.gens.push(item)
    return item
  }

  audioFromScopeItem(emitterItem: Emitter.Item, scopeItem: Scope.Item): Emitter.Audio {
    if (scopeItem.type !== Scope.Value.Type.Scalar)
      throw new TypeError('Unexpected type: ' + scopeItem.type)

    let value = scopeItem.info.emitterValue
    if (!value) value = scopeItem.info.emitterValue = this.audio(emitterItem)

    if (value.type !== Emitter.ItemType.Audio)
      throw new TypeError('Unexpected type: ' + value.type)

    return value
  }

  audio(emitterItem: Emitter.Item): Emitter.Audio {
    const ptr = this.info.audios.length
    const item: Emitter.Audio = {
      type: Emitter.ItemType.Audio,
      code: `audio_${ptr}`,
      ptr,
      emitterItem,
      scopeId: getTopScope(emitterItem).id,
      callers: getCallers(emitterItem),
    }
    this.info.audios.push(item)
    return item
  }

  scalarFromScopeItem(scopeItem: Scope.Item): Emitter.Scalar | Emitter.Literal {
    let value: Emitter.Value | undefined = scopeItem.info.emitterValue

    if (!value) {
      if (scopeItem.type === Scope.Value.Type.Scalar) {
        switch (scopeItem.kind) {
          case Scope.Value.Scalar.Kind.Literal: {
            value = this.literal(scopeItem.info.astNode.info.value, scopeItem)
            break
          }
        }
      }
    }

    if (!value) value = this.literal(0)

    if (value.type !== Emitter.ItemType.Scalar && value.type !== Emitter.ItemType.Literal)
      throw new TypeError('Unexpected type: ' + value.type)

    return value
  }

  literal(value: number, scopeItem?: Scope.Value.Scalar.Literal): Emitter.Literal {
    const ptr = this.info.literals.length
    const item: Emitter.Literal = {
      type: Emitter.ItemType.Literal,
      code: `literal_${ptr}`,
      ptr,
      value,
      astNode: scopeItem?.info.astNode,
    }
    if (scopeItem) scopeItem.info.emitterValue = item
    this.info.literals.push(item)
    return item
  }

  scalar(): Emitter.Scalar {
    const ptr = this.info.scalars.length
    const item: Emitter.Scalar = {
      type: Emitter.ItemType.Scalar,
      code: `scalar_${ptr}`,
      ptr,
    }
    this.info.scalars.push(item)
    return item
  }

  produce(idModifier?: string): Emitter.Info {
    // meta
    let listItems = 0
    let updated = 0

    // info
    this.info = new Emitter.Info(this.scope)
    const { codes, updates, resets, lists, picks, withs, gfx } = this.info
    // TODO: Hardcoding 2 inputs for the time being, but we need to
    //  actually infer the number of inputs from usage.
    // this.info.ins = 2

    const set = (gen: Emitter.Gen, propInfo: PropInfo, prop: Scope.Item, receiveKind: Scope.Value.Kind | null | undefined) => {
      const { id: propSetMethod, range } = propInfo

      const value = prop.info.emitterValue!

      const clampValue = (value: string): string => {
        if (range) {
          const [min, max] = range
          const minmax = `${typeof min === 'number'
            ? float(min)
            : min
            },${typeof max === 'number'
              ? float(max)
              : max
            }`
          return `clamp(${minmax},${value})`
        }
        else {
          return value
        }
      }

      let valueCode = clampValue(value.code)

      if (value.type === Emitter.ItemType.Audio) {
        if (receiveKind && receiveKind !== Scope.Value.Scalar.Kind.Audio) {
          switch (receiveKind) {
            case Scope.Value.Scalar.Kind.Literal:
              codes.push(`audio=${value.code}>>2`)
              valueCode = clampValue('audio[begin]')
              break
          }
        }
      }
      else if (value.type === Emitter.ItemType.Scalar || value.type === Emitter.ItemType.Literal) {
        if (receiveKind && receiveKind !== Scope.Value.Scalar.Kind.Literal) {
          switch (receiveKind) {
            case Scope.Value.Scalar.Kind.Audio: {
              // const { scalar, returnValue } = value.info
              const toAudio = Emitter.Op.ToAudio(this.scope, prop as Scope.Value.Scalar.Literal)
              const audio = this.audio(toAudio)
              // const value = scalar.info.emitterValue = scalar.info.emitterValue ?? this.literal(
              //   (scalar as Scope.Value.Scalar.Literal).info.astNode.info.value,
              //   (scalar as Scope.Value.Scalar.Literal)
              // )
              codes.push(`to_audio_scalar(${clampValue(value.code)},begin,i,${audio.code})`)
              valueCode = audio.code
              // returnValue.info.emitterValue = audio
              break
            }

          }
        }
      }

      const code = `${propSetMethod}(${gen.code},${valueCode})`
      codes.push(code)
      gen.locals[propSetMethod] = value

      updated++
    }

    for (const item of this.items) {
      switch (item.type) {
        default: {
          throw new Error('Not implemented: ' + Emitter.Op.Type[item.type])
        }
        case Emitter.Op.Type.ToAudio: {
          const { scalar, returnValue } = item.info
          const audio = this.audio(item)
          const value = scalar.info.emitterValue = scalar.info.emitterValue ?? this.literal(
            (scalar as Scope.Value.Scalar.Literal).info.astNode.info.value,
            (scalar as Scope.Value.Scalar.Literal)
          )
          codes.push(`to_audio_scalar(${value.code},begin,i,${audio.code})`)
          returnValue.info.emitterValue = audio
          break
        }
        case Emitter.Op.Type.Slide: {
          const { pickItem, slopeItem, items, indexValue, returnValue } = item.info
          picks.push(item)

          // console.log(item.info)
          const scalar = this.scalar()
          let i = listItems
          const ptr = i
          for (const item of items) {
            let target = item.kind === Scope.Value.Scalar.Kind.Literal
              ? lists
              : codes

            // console.log(item)
            const value = item.info.emitterValue ?? this.literal(
              (item as Scope.Value.Scalar.Literal).info.astNode.info.value,
              (item as Scope.Value.Scalar.Literal)
            )

            target.push(`literals[${i}]=${value.code}`)
            i = ++listItems
          }
          const length = i - ptr

          const pickItemValue = pickItem.info.emitterValue ?? this.literal(
            (pickItem as Scope.Value.Scalar.Literal).info.astNode.info.value,
            (pickItem as Scope.Value.Scalar.Literal)
          )

          const slopeItemValue = slopeItem.info.emitterValue ?? this.literal(
            (slopeItem as Scope.Value.Scalar.Literal).info.astNode.info.value,
            (slopeItem as Scope.Value.Scalar.Literal)
          )

          // TODO: if pickItem is not scalar then we need to cast
          // codes.push(`li=floor(modf(${pickItemValue.code},${length}.0)) // pick`)
          // codes.push(`s${scalar.ptr}=l[${ptr > 0 ? `${ptr} + ` : ''}(to_i32 li)]`)
          // codes.push(`se[${scalar.ptr}]=li`)


          // codes.push(`logf(${pickItemValue.code})`)
          codes.push(`list_pos=modf(${pickItemValue.code},${length}.0) // slide pos`)
          codes.push(`list_index=floor(list_pos) // slide index`)
          codes.push(`list_next=floor(modf(list_pos+1.0,${length}.0)) // slide next`)
          codes.push(`sample=literals[${ptr > 0 ? `${ptr} + ` : ''}(to_i32 list_index)]`)
          codes.push(`scalar_${scalar.ptr}=sample+(literals[${ptr > 0 ? `${ptr} + ` : ''}(to_i32 list_next)]-sample)*pow_scalar_scalar(list_pos-list_index,${slopeItemValue.code})`)
          codes.push(`scalar_exports[${scalar.ptr}]=list_index`)

          indexValue.info.emitterValue = scalar
          returnValue.info.emitterValue = scalar

          break
        }
        case Emitter.Op.Type.Pick: {
          const { pickItem, items, indexValue, returnValue } = item.info
          picks.push(item)

          // console.log(item.info)
          const scalar = this.scalar()
          let i = listItems
          const ptr = i
          for (const item of items) {
            let target = returnValue.kind === Scope.Value.Scalar.Kind.Audio
              ? codes
              : item.kind === Scope.Value.Scalar.Kind.Literal
                ? lists
                : codes

            // console.log(item)
            const value = item.info.emitterValue ?? this.literal(
              (item as Scope.Value.Scalar.Literal).info.astNode.info.value,
              (item as Scope.Value.Scalar.Literal)
            )

            target.push(`literals[${i}]=${returnValue.kind === Scope.Value.Scalar.Kind.Audio ? 'to_f32 ' : ''}${value.code}`)
            i = ++listItems
          }
          const length = i - ptr

          const pickItemValue = pickItem.info.emitterValue ?? this.literal(
            (pickItem as Scope.Value.Scalar.Literal).info.astNode.info.value,
            (pickItem as Scope.Value.Scalar.Literal)
          )

          // TODO: if pickItem is not scalar then we need to cast
          codes.push(`list_index=floor(modf(${pickItemValue.code},${length}.0)) // pick`)
          codes.push(`scalar_${scalar.ptr}=literals[${ptr > 0 ? `${ptr} + ` : ''}(to_i32 list_index)]`)
          // codes.push(`scalars[${scalar.ptr}]=scalar_${scalar.ptr}`)
          codes.push(`scalar_exports[${scalar.ptr}]=list_index`)

          if (returnValue.kind === Scope.Value.Scalar.Kind.Audio) {
            const audio = this.audio(item)
            codes.push(`${audio.code}=to_i32 scalar_${scalar.ptr}`)
            indexValue.info.emitterValue = scalar
            returnValue.info.emitterValue = audio
          }
          else {
            indexValue.info.emitterValue = scalar
            returnValue.info.emitterValue = scalar
          }

          break
        }
        case Emitter.Op.Type.Binary: {
          const { op, returnValue } = item.info
          let { lhs, rhs } = item.info

          switch (item.info.kind) {
            default: throw new Error('Not implemented: ' + item.info.kind)
            case Emitter.Op.Binary.Kind.AudioAudio: {
              const audio = this.audio(item)
              const AudioAudio = `${Op[op.kind]}_audio_audio`

              const l = this.audioFromScopeItem(item, lhs)
              const r = this.audioFromScopeItem(item, rhs)

              if (AudioAudio in envTypes) {
                codes.push(`${AudioAudio}(${l.code},${r.code},begin,i,${audio.code})`)
              }
              else {
                throw new Error('Not implemented: ' + op)
              }

              returnValue.info.emitterValue = audio

              break
            }

            case Emitter.Op.Binary.Kind.ScalarAudio:
              [lhs, rhs] = [rhs, lhs]
            case Emitter.Op.Binary.Kind.AudioScalar: {
              const audio = this.audio(item)

              let l = this.audioFromScopeItem(item, lhs)
              let r = this.scalarFromScopeItem(rhs)

              let ScalarAudio = `${Op[op.kind]}_scalar_audio`
              let AudioScalar = `${Op[op.kind]}_audio_scalar`

              if (item.info.kind === Emitter.Op.Binary.Kind.ScalarAudio) {
                ;[ScalarAudio, AudioScalar] = [AudioScalar, ScalarAudio]
                  ;[l, r] = [r, l] as any
              }

              if (AudioScalar in envTypes) {
                codes.push(`${AudioScalar}(${l.code},${r.code},begin,i,${audio.code})`)
              }
              else if (ScalarAudio in envTypes) {
                codes.push(`${ScalarAudio}(${r.code},${l.code},begin,i,${audio.code})`)
              }
              else {
                throw new Error('Not implemented: ' + op)
              }

              returnValue.info.emitterValue = audio

              if (r.type === Emitter.ItemType.Literal) {
                if (r.astNode?.info.param) {
                  r.astNode.info.param.last = audio
                }
              }

              break
            }

            case Emitter.Op.Binary.Kind.ScalarScalar: {
              const scalar = this.scalar()

              const l = this.scalarFromScopeItem(lhs)
              const r = this.scalarFromScopeItem(rhs)

              switch (op.kind) {
                case AstNode.Op.Kind.Binary.Pow:
                  codes.push(`scalar_${scalar.ptr} = pow_scalar_scalar(${l.code},${r.code})`)
                  break
                case AstNode.Op.Kind.Binary.Mod:
                  codes.push(`scalar_${scalar.ptr} = to_f32 mod(to_f64 ${l.code},to_f64 ${r.code})`)
                  break
                default:
                  codes.push(`scalar_${scalar.ptr} = ${l.code} ${op.kind} ${r.code}`)
                  break
              }

              codes.push(`scalars[${scalar.ptr}] = scalar_${scalar.ptr}`)

              returnValue.info.emitterValue = scalar

              break
            }
          }
          break
        }
        case Emitter.Op.Type.Native: {
          const kind = item.info.identifier

          // special internal native kinds

          if (kind === 'audio') {
            const audio = this.audio(item)
            item.info.returnValue.info.emitterValue = audio
            break
          }

          if (kind === 'lit') {
            const prop = item.info.props['x']
            if (prop && prop.type === Scope.Value.Type.Scalar && prop.kind === Scope.Value.Scalar.Kind.Literal) {
              const value = this.scalarFromScopeItem(prop)
              item.info.returnValue.info.emitterValue = value
              break
            }
            else {
              throw new Error('Expected a literal.')
            }
          }

          if (kind === 'with') {
            const prop = item.info.props['name']
            if (prop && prop.type === Scope.Value.Type.String) {
              const audio = this.audio(item)
              const index = withs.size
              codes.push(`${audio.code}=pointers[${index}]`)
              withs.set(prop.info.astNode.info.value, { index, audio })
              item.info.returnValue.info.emitterValue = audio
              break
            }
            else {
              throw new Error('Expected a name.')
            }
          }

          if (kind === 'spectrogram') {
            const prop = item.info.props['in']
            if (prop && prop.type === Scope.Value.Type.Scalar && prop.kind === Scope.Value.Scalar.Kind.Audio) {
              gfx.push({ kind, item, prop })
              item.info.returnValue.info.emitterValue = prop.info.emitterValue!
              break
            }
            else {
              throw new Error('Expected an audio in the stack before this node.')
            }
          }

          // regular gens

          const gen = this.gen(kind)

          updated = 0

          for (const propInfo of envGens[kind]) {
            const { label, params, range } = propInfo

            let prop = item.info.props[label]

            const acceptTypes = Scope.types[label] ?? [[Scope.Value.Type.Scalar, Scope.Value.Scalar.Kind.Literal]]
            const [_receiveType, receiveKind] = acceptTypes[0]

            // console.log(label, prop)

            if (prop?.type === Scope.Value.Type.Variable) {
              prop = prop.info.value
            }

            if (prop?.type === Scope.Value.Type.Prop) {
              // console.log(prop.info.identifier, label)
              prop = prop.info.scope.props.get(prop.info.identifier)!
            }

            if (prop?.type === Scope.Value.Type.List) prop = prop.info.scope.stack.at(-1) ?? null

            if (prop) {
              // console.log(prop, label)
              switch (prop.type) {
                default: {
                  console.warn(prop)
                  throw new Error('Not implemented: ' + Scope.Value.Type[prop.type])
                }

                case Scope.Value.Type.String: {
                  gen.locals[propInfo.id] = {
                    type: Emitter.ItemType.String,
                    code: '',
                    ptr: 0,
                    value: prop.info.astNode.info.value
                  }
                  // console.log('YEAH', gen.locals)
                  // updated++
                  // noop
                  break
                }

                case Scope.Value.Type.Scalar:
                  switch (prop.kind) {
                    default: throw new Error('Unreachable.')

                    case Scope.Value.Scalar.Kind.Audio: {
                      const value = this.audioFromScopeItem(item, prop)
                      prop.info.emitterValue = value
                      set(gen, propInfo, prop, receiveKind)
                      continue
                    }

                    case Scope.Value.Scalar.Kind.Computed: {
                      // Don't emit when it's a 0 in prelude (not set by the user).
                      // const token = prop.info.astNode.info.token
                      // if (isExternalSource(token) && parseNumber(token.text).value === (range?.[2] ?? 0)) continue

                      // const value = this.scalarFromScopeItem(prop)
                      // console.log('GOT', prop.info.emitterValue)
                      set(gen, propInfo, prop, receiveKind)
                      continue
                    }

                    case Scope.Value.Scalar.Kind.Literal: {
                      // Don't emit when it's a 0 in prelude (not set by the user).
                      const token = prop.info.astNode.info.token
                      if (isExternalSource(token) && parseNumber(token.text).value === (range?.[2] ?? 0)) continue

                      const value = this.scalarFromScopeItem(prop)
                      prop.info.emitterValue = value
                      set(gen, propInfo, prop, receiveKind)
                      continue
                    }
                  }
                  break
              }
            }
          }

          if (updated) {
            const updateMethod = envLookupMethod(kind, '_update')
            if (updateMethod) {
              const code = `${updateMethod}(${gen.code})`
              updates.push(code)
              codes.push(code)
            }

            const resetMethod = envLookupMethod(kind, '_reset')
            if (resetMethod) {
              const code = `${resetMethod}(${gen.code})`
              resets.push(code)
            }

            // Note: Special case gen `rate` needs these jit operations
            //  that set the audio rate inside the jit context.
            // if (kind === 'rate') {
            //   codes.push('sample_rate = ark')
            //   codes.push('arf=to_f32 ar')
            // }
          }

          const audioMethod = envLookupMethod(kind, '_audio')

          if (audioMethod) {
            const audio = this.audio(item)
            item.info.returnValue.info.emitterValue = audio
            codes.push(`${audioMethod}(${gen.code},begin,i,${audio.code}) // ${kind}`)
            gen.audio = audio
          }

          break
        }
      }
    }

    this.info.L = this.scope.props.get('L')!.info.emitterValue!.ptr
    this.info.R = this.scope.props.get('R')!.info.emitterValue!.ptr
    this.info.LR = this.scope.props.get('LR')!.info.emitterValue!.ptr

    this.info.name = (this.scope.props.get('name') as Scope.Value.String)?.info.astNode?.info.value ?? ''

    this.info.updateId(idModifier)

    return this.info
  }
}

function hashNodes(nodes: Set<AstNode.Item> | undefined) {
  const nodeItems = [...(nodes ?? [])]
  const hashId = nodeItems
    .filter((node) =>
      ![AstNode.Type.Literal].includes(node.type)
      && !['M', 'S'].includes((node as AstNode.Keyword)?.info?.token?.text)
    )
    .map((node) => `${node.type}:${node.kind ?? '-'}${((node as any).info?.token?.text ?? '-').trim()}${(node as any).info?.identifier ?? '-'}`)
    .join(' ')
  return hashId
}

export namespace Emitter {
  export class Info {
    instanceId = -1
    groupId = -1

    L = 0
    R = 0
    LR = 0

    name: string = ''

    gens: Emitter.Gen[] = []
    literals: Emitter.Literal[] = []
    scalars: Emitter.Scalar[] = []
    audios: Emitter.Audio[] = []
    picks: (Emitter.Op.Pick | Emitter.Op.Slide)[] = []
    lists: string[] = []
    codes: string[] = []
    updates: string[] = []
    resets: string[] = []
    withs: Map<string, { index: number, audio: Emitter.Audio }> = new Map()
    gfx: { kind: string, item: Emitter.Item, prop: Scope.Item }[] = []

    overrideAudios: Map<number, Float32Array> = new Map()

    constructor(public scope: Scope) { }

    updateId(idModifier = '') {
      this.instanceId = checksum(
        this.literals.length.toString()
        + hashNodes(this.scope.nodes)
        + idModifier
      )
      this.groupId = checksum(
        hashNodes(new Set([...this.scope.nodes].filter((node) =>
          ![...this.scope.propsNodes.keys()]
            .map((key) => [...this.scope.propsNodes.get(key)!])
            .find((items) =>
              items.find((p) =>
                node.index >= p.index
                && node.index <= p.index + p.length
              )
            )
        )))
      )
    }

    writeLiterals(block: Block) {
      this.literals.forEach((l) => {
        block[l.ptr] = l.value
      })
    }
  }

  export type Item =
    | Op.Native
    | Op.Pick
    | Op.Slide
    | Op.ToAudio
    | Op.Unary
    | Op.Binary
    | Op.Ternary

  export type Value =
    | String
    | Scalar
    | Literal
    | Audio

  export interface ValueInfo {
    scope: Scope
    emitterValue?: Value
  }

  export enum ItemType {
    Gen = 'Gen',
    String = 'String',
    Scalar = 'Scalar',
    Literal = 'Literal',
    Audio = 'Audio',
  }

  export interface Caller {
    node: AstNode.Item
    scopeId: number
  }

  export interface Gen {
    type: ItemType.Gen
    code: string
    ptr: number
    kind: string
    audio?: Audio
    runtime?: GenRuntime
    locals: Record<string, Emitter.Value>
  }

  export interface String {
    type: ItemType.String
    code: string
    ptr: number
    value: string
  }

  export interface Scalar {
    type: ItemType.Scalar
    code: string
    ptr: number
  }

  export interface Literal {
    type: ItemType.Literal
    code: string
    ptr: number
    value: number
    astNode: AstNode.Literal | undefined
  }

  export interface Audio {
    type: ItemType.Audio
    code: string
    ptr: number
    scopeId: number
    emitterItem: Emitter.Item
    callers: Emitter.Caller[]
    floats?: Float32Array
    // TODO: fix this
    // This is used for ParamRms, to pick up the audio
    // for the param using param.last.rms
    rms?: any //Rms['$']
  }

  export interface Param {
    target: AstNode.Literal
    scopeItem: Scope.Value.Scalar.Literal
    keyword: Token<Token.Type.Keyword>
    name: Token<Token.Type.String> | undefined
    mute: Token<Token.Type.Keyword> | undefined
    solo: Token<Token.Type.Keyword> | undefined
    min: number
    max: number
    step: number
    slope: number
    isVol: boolean
    tokens: Token[]
    last?: Audio | undefined
  }

  export class Op<T extends Op.Type, U> {
    constructor(
      public type: T,
      public info: U,
    ) { }
  }

  export namespace Op {
    export enum Type {
      Native = 'Native',
      Unary = 'Unary',
      Binary = 'Binary',
      Ternary = 'Ternary',
      Pick = 'Pick',
      Slide = 'Slide',
      ToAudio = 'ToAudio',
    }

    export interface Native extends Op<Type.Native, Native.Info> { }
    export namespace Native {
      export interface Info {
        identifier: string
        props: Record<string, Scope.Item | null>
        returnValue: Scope.Value.Scalar.Audio | Scope.Value.Scalar.Computed
      }
    }
    export function Native(identifier: string, scope: Scope): Op.Native {
      const props: Native.Info['props'] = Object.fromEntries(scope.props)
      // TODO: Native map identifiers to returnValue types, defaulting to Audio.
      //  For now it's fine because it's only one.
      const returnValue = identifier === 'lit'
        ? Scope.Value.Scalar.Computed(scope)
        : Scope.Value.Scalar.Audio(scope)
      const info: Native.Info = { identifier, props, returnValue }
      return new Op(Type.Native, info)
    }

    export interface Pick extends Op<Type.Pick, Pick.Info> { }
    export namespace Pick {
      export interface Info {
        pickItem: Scope.Item
        items: Scope.Item[]
        indexValue: Scope.Value.Scalar.Computed
        returnValue: Scope.Value.Scalar.Computed | Scope.Value.Scalar.Audio
      }
    }
    export function Pick(scope: Scope, pickItem: Scope.Item, items: Scope.Item[], returnValueKind: Scope.Value.Scalar.Kind.Computed | Scope.Value.Scalar.Kind.Audio): Op.Pick {
      const indexValue = Scope.Value.Scalar.Computed(scope)
      const returnValue = Scope.Value.Scalar[returnValueKind](scope)
      const info: Pick.Info = { pickItem, items, indexValue, returnValue }
      return new Op(Type.Pick, info)
    }

    export interface Slide extends Op<Type.Slide, Slide.Info> { }
    export namespace Slide {
      export interface Info {
        pickItem: Scope.Item
        slopeItem: Scope.Item
        items: Scope.Item[]
        indexValue: Scope.Value.Scalar.Computed
        returnValue: Scope.Value.Scalar.Computed
      }
    }
    export function Slide(scope: Scope, pickItem: Scope.Item, slopeItem: Scope.Item, items: Scope.Item[]): Op.Slide {
      const indexValue = Scope.Value.Scalar.Computed(scope)
      const returnValue = Scope.Value.Scalar.Computed(scope)
      const info: Slide.Info = { pickItem, slopeItem, items, indexValue, returnValue }
      return new Op(Type.Slide, info)
    }

    export interface ToAudio extends Op<Type.ToAudio, ToAudio.Info> { }
    export namespace ToAudio {
      export interface Info {
        scalar: Scope.Value.Scalar
        returnValue: Scope.Value.Scalar.Audio
      }
    }
    export function ToAudio(scope: Scope, scalar: Scope.Value.Scalar.Literal | Scope.Value.Scalar.Computed): Op.ToAudio {
      const returnValue = Scope.Value.Scalar.Audio(scope)
      const info: ToAudio.Info = { scalar, returnValue }
      return new Op(Type.ToAudio, info)
    }

    export interface Unary<U extends Unary.Kind = Unary.Kind> extends Op<Type.Unary, Unary.Info<U>> { }
    export namespace Unary {
      export enum Kind {
        Scalar = 'Scalar',
        Audio = 'Audio',
        // List = 'List',
      }
      export interface Info<U extends Unary.Kind = Unary.Kind> {
        kind: U
        op: AstNode.Op.Kind.Unary
        arg: Scope.Item
        astNode?: AstNode.Item
        returnValue:
        U extends Kind.Scalar ? Scope.Value.Scalar.Computed
        : U extends Kind.Audio ? Scope.Value.Scalar.Audio
        // : U extends Kind.List ? Scope.Value.List
        : never
      }
    }

    export interface Binary<U extends Binary.Kind = Binary.Kind> extends Op<Type.Binary, Binary.Info<U>> { }
    export function Binary<U extends Binary.Kind = Binary.Kind>(scope: Scope, kind: U, op: AstNode.Op.Binary, lhs: Scope.Item, rhs: Scope.Item): Binary<U> {
      let returnValue: Binary.Info<U>['returnValue']

      const computed = AstNode.Computed()

      Object.assign(computed,
        Token.bounds([
          op,
          'astNode' in lhs.info && lhs.info.astNode,
          'astNode' in rhs.info && rhs.info.astNode
        ].filter(Boolean))
      )

      switch (kind) {
        default:
          throw new Error('Not implemented: ' + Binary.Kind[kind])
        case Binary.Kind.ScalarScalar:
          returnValue = Scope.Value.Scalar.Computed(scope, computed) as Binary.Info<U>['returnValue']
          break
        case Binary.Kind.ScalarAudio:
        case Binary.Kind.AudioScalar:
        case Binary.Kind.AudioAudio:
          returnValue = Scope.Value.Scalar.Audio(scope, computed) as Binary.Info<U>['returnValue']
          break
        // case Binary.Kind.ScalarList:
        // case Binary.Kind.AudioList:
        // case Binary.Kind.ListScalar:
        // case Binary.Kind.ListAudio:
        // case Binary.Kind.ListList:
        //   returnValue = Scope.Value.List(scope) as Binary.Info<U>['returnValue']
        //   break
      }

      const info: Binary.Info<U> = { kind, op, lhs, rhs, returnValue }
      return new Op(Type.Binary, info)
    }
    export namespace Binary {
      export enum Kind {
        ScalarScalar = 'ScalarScalar',
        ScalarAudio = 'ScalarAudio',
        // ScalarList = 'ScalarList',
        AudioScalar = 'AudioScalar',
        AudioAudio = 'AudioAudio',
        // AudioList = 'AudioList',
        // ListScalar = 'ListScalar',
        // ListAudio = 'ListAudio',
        // ListList = 'ListList',
      }
      export interface Info<U extends Binary.Kind = Binary.Kind> {
        kind: U
        op: AstNode.Op.Binary
        lhs: Scope.Item
        rhs: Scope.Item
        astNode?: AstNode.Item
        returnValue:
        U extends Kind.ScalarScalar ? Scope.Value.Scalar.Computed

        // : U extends (
        //   Kind.ScalarList | Kind.AudioList |
        //   Kind.ListScalar | Kind.ListAudio | Kind.ListList
        // ) ? Scope.Value.List

        : U extends (
          Kind.ScalarAudio | Kind.AudioScalar | Kind.AudioAudio
        ) ? Scope.Value.Scalar.Audio

        : never
      }
    }

    export interface Ternary<U extends Ternary.Kind = Ternary.Kind> extends Op<Type.Ternary, Ternary.Info<U>> { }
    export namespace Ternary {
      export enum Kind {
        ListScalarScalar = 'ListScalarScalar'
      }
      export interface Info<U extends Ternary.Kind = Ternary.Kind> {
        kind: U
        op: AstNode.Op.Kind.Ternary
        lhs: Scope.Item
        mhs: Scope.Item
        rhs: Scope.Item
        astNode?: AstNode.Item
        returnValue:
        U extends Kind.ListScalarScalar ? Scope.Value.Scalar.Computed
        : never
      }
    }
  }
}

export function produce(scope: Scope, idModifier?: string): Emitter.Info {
  return new Emitter(scope).produce(idModifier)
}

export function test_emitter() {
  // @env browser
  describe('produce', () => {
    const passing: [string, any][] = [
      ['[sin 200]',
        [
          "gen_rate_set_samples(gen_0,clamp(1.0,10000000.0,literal_2))",
          "gen_rate__update(gen_0)",
          "gen_osc_set_hz(gen_1,clamp(0.0,sample_rate_float,literal_3))",
          "gen_osc__update(gen_1)",
          "gen_osc__audio(gen_1,begin,i,audio_3) // sin",
          "add_audio_audio(audio_2,audio_0,begin,i,audio_4)",
          "add_audio_audio(audio_2,audio_1,begin,i,audio_5)"
        ]
      ],

      ['[sin 200] [slp 200]',
        [
          "gen_rate_set_samples(gen_0,clamp(1.0,10000000.0,literal_2))",
          "gen_rate__update(gen_0)",
          "gen_osc_set_hz(gen_1,clamp(0.0,sample_rate_float,literal_3))",
          "gen_osc__update(gen_1)",
          "gen_osc__audio(gen_1,begin,i,audio_3) // sin",
          "gen_slp_set_cut(gen_2,clamp(10.0,sample_rate_float,literal_4))",
          "gen_biquad_set_in(gen_2,audio_3)",
          "gen_slp__update(gen_2)",
          "gen_slp__audio(gen_2,begin,i,audio_4) // slp",
          "add_audio_audio(audio_2,audio_0,begin,i,audio_5)",
          "add_audio_audio(audio_2,audio_1,begin,i,audio_6)"
        ]
      ],

      ['[sin hz:200]',
        [
          "gen_rate_set_samples(gen_0,clamp(1.0,10000000.0,literal_2))",
          "gen_rate__update(gen_0)",
          "gen_osc_set_hz(gen_1,clamp(0.0,sample_rate_float,literal_3))",
          "gen_osc__update(gen_1)",
          "gen_osc__audio(gen_1,begin,i,audio_3) // sin",
          "add_audio_audio(audio_2,audio_0,begin,i,audio_4)",
          "add_audio_audio(audio_2,audio_1,begin,i,audio_5)"
        ]
      ],
    ]

    passing.forEach(([code, expected]) => {
      it(code, () => {
        const ast = parse([...tokenize({ code })])
        // console.log(ast)
        const scope = analyse(ast)
        // console.log(scope)
        const info = produce(scope)
        console.log(info)
        expect(info.codes).toMatchObject(expected)
      })
    })
  })
}

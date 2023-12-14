import { MapSet, trunc } from 'utils'
import { envGens } from '../env-info.ts'
import { Emitter } from './emitter.ts'
import { AstNode, parse } from './parser.ts'
import { Source, Token, tokenize } from './tokenizer.ts'
// import { checksum } from '../util'

export class Scope<T extends Scope.Type = Scope.Type> {
  id = 0
  count = 0
  top: Scope

  emits: Emitter.Item[]
  nodes: Set<AstNode.Item>
  params: Map<AstNode.Literal, Emitter.Param>
  volParams: [AstNode.Literal, Emitter.Param][] = []
  feedbacks: Map<Scope.Item, Scope.Item>

  locals: Map<string, Scope.Item | null> = new Map()
  props: Map<string, Scope.Item | null> = new Map()
  propsNodes: MapSet<string, AstNode.Item> = new MapSet()
  presetProps: Map<string, string> = new Map()
  presetPropsId: string = ''

  stack: Scope.Item[] = []
  returnStack: Scope.Item[] = []

  declare parent?: Scope

  // meta
  meta: {
    mute?: Token<Token.Type.Keyword>
    solo?: Token<Token.Type.Keyword>
  } = {}

  constructor(
    public node: AstNode.Item,
    public type: T,
    parent?: Scope,
  ) {
    // singletons
    if (parent) {
      this.id = parent.top.count++
      this.top = parent.top
      this.nodes = parent.nodes
      this.emits = parent.emits
      this.params = parent.params
      this.feedbacks = parent.feedbacks
    }
    else {
      this.top = this
      this.emits = []
      this.nodes = new Set()
      this.params = new Map()
      this.feedbacks = new Map()
    }

    Object.defineProperty(this, 'parent', {
      enumerable: false,
      value: parent
    })
  }

  emit(item: Emitter.Item) {
    this.emits.push(item)
  }

  stackPop(identifier?: string): Scope.Item | undefined {
    const types = (Scope.types as any)[identifier as any]
    let scope: Scope | undefined = this
    do {
      if (scope.stack.length) {
        if (identifier && types) {
          let i = scope.stack.length - 1
          do {
            let item = scope.stack[i]!
            if (item.type === Scope.Value.Type.Variable && item.info.value) {
              // if (item.kind === Scope.Value.Variable.Kind.Prop) {
              // item = item.info.scope.props.get(item.info.identifier)!
              // continue
              // }
              // } else {

              item = item.info.value

              //   // }
            }

            // console.log(item)
            // if (item.type === Scope.Value.Type.Prop) {
            //   item = item.info.scope.props.get(item.info.identifier)!
            //   // if (item.kind === Scope.Value.Variable.Kind.Prop) {
            //   //   continue
            //   // }
            //   // item = item.info.value
            // }

            const type = item.type
            const kind = item.kind
            for (const [expType, expKind] of types) {
              if (expType === type && (!expKind || expKind === kind)) {
                const [el] = scope.stack.splice(i, 1)
                return el
              }
            }
          } while (i--)
        }
        else {
          return scope.stack.pop()
        }
      }
    } while (scope = scope.parent)
  }

  stackPush(value: Scope.Item) {
    this.stack.push(value)
  }

  lookup(identifier: string): Scope.Value.Variable | undefined {
    let scope: Scope | undefined = this
    let value: Scope.Item | null | undefined
    let kind: Scope.Value.Variable.Kind

    do {
      if (scope.locals.has(identifier)) {
        value = scope.locals.get(identifier)
        kind = Scope.Value.Variable.Kind.Local
        break
      }
      else if (scope.props.has(identifier)) {
        value = scope.props.get(identifier)
        kind = Scope.Value.Variable.Kind.Prop
        break
      }
    } while (scope = scope.parent)

    if (value) {

      return Scope.Value.Variable(scope!, kind!, identifier, value)
    }
  }

  lookupProp(identifier: string): Scope.Value.Variable | undefined {
    let scope: Scope | undefined = this
    let level = 0
    // props declared within a procedure can be overriden
    // by the calling expression by their abbreviation
    let abbr = scope.type === Scope.Type.Procedure
    const deep = abbr
    let candidate: string
    do {
      candidate = identifier
      // props can be shadowed at the first level or parent by any abbreviation
      if (scope.locals.has(candidate)) {
        const value = scope.locals.get(candidate)!
        return Scope.Value.Variable(scope, Scope.Value.Variable.Kind.Local, candidate, value)
      }
      if (abbr && level >= 1) {
        while (candidate.length >= 1) {
          if (scope.props.has(candidate)) {
            const value = scope.props.get(candidate)!
            return Scope.Value.Variable(scope, Scope.Value.Variable.Kind.Prop, candidate, value)
          }
          candidate = candidate.slice(0, -1)
        }
      }
      level++
      // if this lookup didn't originate from a procedure declared prop
      // then we don't look beyond this scope
      if (!deep) break
      // beyond the expression scope, the abbreviation is not possible
      if (scope.type === Scope.Type.Expression) {
        abbr = false
      }
    } while (scope = scope.parent)
  }
}

export namespace Scope {
  export enum Type {
    Prog = 'Prog',
    Procedure = 'Procedure',
    Expression = 'Expression',
    List = 'List',
  }

  export type Item =
    | Value.Variable
    | Value.Prop
    | Value.String
    | Value.Scalar.Literal
    | Value.Scalar.Computed
    | Value.Scalar.Audio
    | Value.Procedure
    | Value.List

  export class Value<
    T extends Value.Type = Value.Type,
    U extends Value.Kind | null = null,
    V extends Emitter.ValueInfo | null = null
  > {
    constructor(
      public type: T,
      public kind: U,
      public info: V,
    ) { }
  }

  export function unboxLiteral(variable: Scope.Value.Variable | undefined) {
    const value = variable?.info.value
    if (
      value
      && value.type === Scope.Value.Type.Scalar
      && value.kind === Scope.Value.Scalar.Kind.Literal
    ) {
      return value.info.astNode.info
    }
  }

  export namespace Value {
    export enum Type {
      Prop = 'Prop',
      Variable = 'Variable',
      Procedure = 'Procedure',
      String = 'String',
      Scalar = 'Scalar',
      List = 'List',
    }

    export type Kind =
      | Variable.Kind
      | Scalar.Kind
      | null

    export interface Procedure extends Value<Value.Type.Procedure, null, Procedure.Info> { }
    export namespace Procedure { export interface Info extends Emitter.ValueInfo { astNode: AstNode.Block.Procedure } }
    export function Procedure(scope: Scope, astNode: AstNode.Block.Procedure): Procedure {
      const info: Procedure.Info = { scope, astNode }
      return new Value(Value.Type.Procedure, null, info)
    }

    export interface List extends Value<Value.Type.List, null, List.Info> { }
    export namespace List { export interface Info extends Emitter.ValueInfo { items: Scope.Item[] } }
    export function List(scope: Scope, items: Scope.Item[]): List {
      const info: List.Info = { scope, items }
      return new Value(Value.Type.List, null, info)
    }

    export interface String extends Value<Value.Type.String, null, String.Info> { }
    export namespace String { export interface Info extends Emitter.ValueInfo { astNode: AstNode.String } }
    export function String(scope: Scope, astNode: AstNode.String): String {
      const info: String.Info = { scope, astNode }
      return new Value(Value.Type.String, null, info)
    }

    export interface Scalar<U extends Scalar.Kind = Scalar.Kind, V extends Scalar.Info = Scalar.Info> extends Value<Value.Type.Scalar, U, V> { }
    export namespace Scalar {
      export type Info =
        | Literal.Info
        | Computed.Info
        | Audio.Info

      export enum Kind {
        Literal = 'Literal',
        Computed = 'Computed',
        Audio = 'Audio',
      }
      export interface Literal extends Scalar<Scalar.Kind.Literal, Scalar.Literal.Info> { }
      export namespace Literal { export interface Info extends Emitter.ValueInfo { astNode: AstNode.Literal } }
      export function Literal(scope: Scope, astNode: AstNode.Literal): Value.Scalar.Literal {
        const info: Literal.Info = { scope, astNode }
        return new Value(Value.Type.Scalar, Scalar.Kind.Literal, info)
      }
      export interface Computed extends Scalar<Scalar.Kind.Computed> { }
      export namespace Computed { export interface Info extends Emitter.ValueInfo { astNode: AstNode.Item | undefined } }
      export function Computed(scope: Scope, astNode?: AstNode.Item): Value.Scalar.Computed {
        const info: Computed.Info = { scope, astNode }
        return new Value(Value.Type.Scalar, Scalar.Kind.Computed, info)
      }
      export interface Audio extends Scalar<Scalar.Kind.Audio, Scalar.Audio.Info> { }
      export namespace Audio { export interface Info extends Emitter.ValueInfo { astNode: AstNode.Item | undefined } }
      export function Audio(scope: Scope, astNode?: AstNode.Item): Value.Scalar.Audio {
        const info: Audio.Info = { scope, astNode }
        return new Value(Value.Type.Scalar, Scalar.Kind.Audio, info)
      }
    }

    export interface Variable<U extends Variable.Kind = Variable.Kind> extends Value<Value.Type.Variable, U, Variable.Info> { }
    export function Variable<U extends Variable.Kind>(scope: Scope, kind: U, identifier: string, value: Item | null): Variable<U> {
      const info: Variable.Info = { scope, identifier, value }
      return new Value(Value.Type.Variable, kind, info)
    }
    export namespace Variable {
      // TODO: is Emitter.ValueInfo required here?
      export interface Info extends Emitter.ValueInfo {
        identifier: string
        value: Item | null
        astNode?: AstNode.Item
      }
      export enum Kind {
        Local = 'Local',
        Prop = 'Prop',
      }
      export const KindMap = {
        [Kind.Local]: 'locals',
        [Kind.Prop]: 'props',
      } as const
    }

    export interface Prop extends Value<Value.Type.Prop, null, Prop.Info> { }
    export function Prop(scope: Scope, identifier: string): Prop {
      const info: Prop.Info = { scope, identifier, astNodes: [] }
      return new Value(Value.Type.Prop, null, info)
    }
    export namespace Prop {
      // TODO: is Emitter.ValueInfo required here?
      export interface Info extends Emitter.ValueInfo {
        identifier: string
        astNodes: AstNode.Item[]
      }
    }
  }

  const { Scalar, Variable, List } = Scope.Value.Type
  const { Literal, Computed, Audio } = Scope.Value.Scalar.Kind

  export const types: Record<string, (readonly [Scope.Value.Type, Scope.Value.Kind?])[]> = {
    in: [[Scalar, Audio], [Scalar, Literal], [Scalar, Computed]],
    sidechain: [[Scalar, Audio], [Scalar, Literal], [Scalar, Computed]],
    // TODO: we only need the Audio types because receive literal is default?
    // cut: [[Scalar, Literal], [Scalar, Computed], [Scalar, Audio], [List]],
    // hz: [[Scalar, Literal], [Scalar, Computed], [Scalar, Audio], [List]],
    // offset: [[Scalar, Literal], [Scalar, Computed], [Scalar, Audio], [List]],
  }

  export namespace Op {
    export function unboxUnary(scope: Scope, node: AstNode.Op.Unary) {
      let { arg } = node.info.analyse(scope)
      if (arg?.type === Variable && arg.info.value) arg = arg.info.value
      if (!arg) throw new TypeError('Missing operand.', cause(scope))
      return { arg }
    }

    export function unboxBinary(scope: Scope, node: AstNode.Op.Binary) {
      let { lhs, rhs } = node.info.analyse(scope)
      if (lhs?.type === Variable && lhs.info.value) lhs = lhs.info.value
      if (rhs?.type === Variable && rhs.info.value) rhs = rhs.info.value
      if (!lhs) throw new TypeError('Missing left operand.', cause(scope))
      if (!rhs) throw new TypeError('Missing right operand.', cause(scope))
      return { lhs, rhs }
    }

    export function unboxTernary(scope: Scope, node: AstNode.Op.Ternary) {
      let { lhs, mhs, rhs } = node.info.analyse(scope)
      if (lhs?.type === Variable && lhs.info.value) lhs = lhs.info.value
      if (mhs?.type === Variable && mhs.info.value) mhs = mhs.info.value
      if (rhs?.type === Variable && rhs.info.value) rhs = rhs.info.value
      if (!lhs) throw new TypeError('Missing left operand.', cause(scope))
      if (!mhs) throw new TypeError('Missing middle operand.', cause(scope))
      if (!rhs) throw new TypeError('Missing right operand.', cause(scope))
      return { lhs, mhs, rhs }
    }

    export function Binary(scope: Scope, node: AstNode.Op.Binary, lhs: Scope.Item, rhs: Scope.Item): { emitterItem?: Emitter.Op.Binary | undefined, stackValue: Scope.Item } {
      let kind: Emitter.Op.Binary.Kind

      if (lhs.type === Variable) {
        const value = Scope.Value.Scalar.Audio(scope, node)
        lhs.info.scope[Scope.Value.Variable.KindMap[lhs.kind]].set(lhs.info.identifier, value)
        lhs.info.scope.feedbacks.set(value, value)
        lhs = value
      }

      switch (lhs.type) {
        default: {
          console.warn(lhs, rhs)
          throw new TypeError(`Not implemented Binary Op: Lhs:${lhs.type}`, cause(scope))
        }

        case List: {
          const items: Scope.Item[] = []
          for (const item of lhs.info.scope.stack) {
            const result = Binary(scope, node, item, rhs)
            if (result.emitterItem) {
              scope.emit(result.emitterItem)
              items.push(result.stackValue)
            }
          }

          return { stackValue: Scope.Value.List(scope, items) }
        } // List

        case Scalar: {
          switch (lhs.kind) {
            case Literal:
            case Computed:
              switch (rhs.type) {
                default: {
                  console.warn(lhs, rhs, scope)
                  throw new TypeError(`Not implemented Binary Op: Lhs:${lhs.type}(${lhs.kind}) Rhs:${rhs.type}(${rhs.kind})`, cause(scope))
                }
                // TODO: List
                case Scalar: {
                  switch (rhs.kind) {
                    default: throw new TypeError(`Not implemented Binary Op Kind: Lhs:${lhs.type}(${lhs.kind}) Rhs:${(rhs as any).type}(${(rhs as any).kind})`, cause(scope))
                    case Literal:
                    case Computed:
                      kind = Emitter.Op.Binary.Kind.ScalarScalar
                      break
                    case Audio:
                      kind = Emitter.Op.Binary.Kind.ScalarAudio
                      break
                  }
                  break
                }
              }
              break

            case Audio:
              switch (rhs.type) {
                default: throw new TypeError(`Not implemented Binary Op: Lhs:${lhs.type}(${lhs.kind}) Rhs:${rhs.type}(${rhs.kind})`, cause(scope))
                // TODO: List
                case Scalar: {
                  switch (rhs.kind) {
                    default: throw new TypeError(`Not implemented Binary Op Kind: Lhs:${lhs.type}(${lhs.kind}) Rhs:${(rhs as any).type}(${(rhs as any).kind})`, cause(scope))
                    case Literal:
                    case Computed:
                      kind = Emitter.Op.Binary.Kind.AudioScalar
                      break
                    case Audio:
                      kind = Emitter.Op.Binary.Kind.AudioAudio
                      break
                  }
                  break
                }
              }
              break
          }
          break
        } // Scalar
      }
      const emitterItem = Emitter.Op.Binary(scope, kind, node, lhs, rhs)
      return { emitterItem, stackValue: emitterItem.info.returnValue }
    }
  }
}

function cause(scope: Scope) {
  return { cause: { nodes: [...scope.nodes].filter((node) => node.source !== prelude).slice(-1) } }
}

function visit(scope: Scope, node: AstNode.Item) {
  switch (node.type) {
    default: {
      throw new TypeError('Not implemented: ' + node.type, cause(scope))
    }

    case AstNode.Type.Keyword: {
      switch (node.kind) {

        case AstNode.Keyword.Kind.Comma: { // ','
          // TODO: flush label?
          break
        }

        case AstNode.Keyword.Kind.Mixdown: { // '@'
          process(scope, zero.info.body)
          // TODO: validate
          let rhs = scope.stackPop()!
          let lhs: Scope.Item | undefined
          while (scope.stack.length) {
            lhs = scope.stack.pop()
            if (lhs && lhs.type === Scope.Value.Type.Variable && lhs.info.value) {
              lhs = lhs.info.value
            }
            if (lhs && lhs.type === Scope.Value.Type.Scalar && lhs.kind === Scope.Value.Scalar.Kind.Audio) {
              const opNode = Object.assign(
                AstNode.Op.Binary({ ...Token.Empty, text: '+' }),
                {
                  source: node.source,
                  parent: node.parent
                }
              )
              Object.assign(opNode, Token.bounds([node.info.token]))
              const result = Scope.Op.Binary(scope, opNode, lhs, rhs)
              if (result.emitterItem) scope.emit(result.emitterItem)
              rhs = result.stackValue
            }
          }
          scope.stackPush(rhs)
          break
        }

        case AstNode.Keyword.Kind.Param: {
          const nameString = scope.stack.at(-1)

          let name: Token<Token.Type.String> | undefined
          if (nameString && nameString.type === Scope.Value.Type.String) {
            scope.stackPop() // dropping, we have it in unboxed in nameString
            name = nameString.info.astNode.info.token
          }

          const stackItem = scope.stack.at(-1)

          const isPropReassign = stackItem?.type === Scope.Value.Type.Prop

          let literal: Scope.Value.Scalar.Literal

          if (isPropReassign) {
            const propValue = stackItem.info.scope.props.get(stackItem.info.identifier)!
            literal = propValue as any
          }
          else {
            literal = stackItem as any
          }

          if (!literal
            || literal.type !== Scope.Value.Type.Scalar
            || literal.kind !== Scope.Value.Scalar.Kind.Literal
          ) {
            console.log(stackItem, literal)
            throw new SyntaxError('Param export needs a literal number.', cause(scope))
          }

          const mute = scope.meta.mute
          const solo = scope.meta.solo
          // we've consumed them so empty them for the next calls
          delete scope.meta.mute
          delete scope.meta.solo

          if (scope.params.has(literal.info.astNode)) break

          const ranges: [number, number][] = [
            [0, 0.999999],
            [1, 9.999999],
            [10, 99.99999],
            [100, 999.9999],
            [1_000, 9_999.99],
            [10_000, 99_999.9],
            [100_000, 999_999],
            [1_000_000, 9_999_999],
            [10_000_000, 99_999_999],
            [100_000_000, 999_999_999],
            [Infinity, 1]
          ]

          const rangeIndex = ranges.findIndex(
            (range) =>
              literal.info.astNode.info.value < range[0]
          )

          /** [min,max,step,slope] */
          const range = ranges[rangeIndex - 1]!

          const minInfo = Scope.unboxLiteral(scope.lookupProp('min'))
          const maxInfo = Scope.unboxLiteral(scope.lookupProp('max'))
          const slopeInfo = Scope.unboxLiteral(scope.lookupProp('slope'))
          const stepInfo = Scope.unboxLiteral(scope.lookupProp('step'))

          const digits = literal.info.astNode.info.digits
          const min = minInfo?.value ?? trunc(range[0], digits)
          const max = maxInfo?.value ?? trunc(range[1], digits)
          const slope = slopeInfo?.value ?? 1
          const step = stepInfo?.value ?? (1 / 10 ** literal.info.astNode.info.digits)

          const param: Emitter.Param = {
            target: literal.info.astNode,
            scopeItem: literal,
            keyword: node.info.token,
            name,
            mute,
            solo,
            min,
            max,
            slope,
            step,

            // TODO: crude heuristic to determine whether it's a named volume param.
            //  We should probably detect leading @ keyword instead and multiplier right after.
            //  So: @.5'vol'\*
            isVol: !!name && min === 0 && max <= 1 && max >= 0.9,

            tokens: [
              node.info.token,
              literal.info.astNode.info.token,
              minInfo?.token,
              maxInfo?.token,
              slopeInfo?.token,
              stepInfo?.token,
            ].filter(Boolean)
          }

          param.target.info.param = param
          scope.params.set(literal.info.astNode, param)

          break
        }

        case AstNode.Keyword.Kind.Mute: {
          scope.meta.mute = node.info.token
          break
        }

        case AstNode.Keyword.Kind.Solo: {
          scope.meta.solo = node.info.token
          break
        }
      }

      break
    }

    case AstNode.Type.UnaryOp: {
      switch (node.kind) {
        default: {
          throw new TypeError('Not implemented: ' + node.kind, cause(scope))
        }
        case AstNode.Op.Kind.Unary.AssignLabel: {
          const { arg } = node.info.analyse(scope)

          if (!arg) throw new TypeError('Missing operand.', cause(scope))
          if (arg.type !== Scope.Value.Type.Variable) throw new TypeError('Expected label.')

          let value: Scope.Item | null | undefined

          let variable = scope.lookupProp(arg.info.identifier)
          if (variable) value = variable.info.value

          if (value == null) {
            value = scope.stackPop(arg.info.identifier)
            if (value?.type === Scope.Value.Type.Variable) {
              value = value.info.value
            }
            if (!value) throw new TypeError('Expected value in the stack for: ' + arg.info.identifier, cause(scope))
          }

          scope.props.set(arg.info.identifier, value)

          break
        }
      }
      break
    }

    case AstNode.Type.BinaryOp: {
      const { Scalar, List, Variable } = Scope.Value.Type
      const { Literal, Computed, Audio } = Scope.Value.Scalar.Kind

      switch (node.kind) {
        default: {
          // throw new TypeError('Not implemented: ' + node.kind, cause(scope))
        }
        case AstNode.Op.Kind.Binary.Pick: {
          const { lhs, rhs } = Scope.Op.unboxBinary(scope, node)

          const isPropReassign = lhs.type === Scope.Value.Type.Prop

          let lhsValue: Scope.Item | null | undefined
          if (isPropReassign) {
            lhsValue = lhs.info.scope.props.get(lhs.info.identifier)
            if (!lhsValue) {
              throw new TypeError('Expected value in the stack for: ' + lhs.info.identifier, cause(scope))
            }
          }
          else {
            lhsValue = lhs
          }

          if (!lhsValue) {
            throw new TypeError('Expected value in the stack.', cause(scope))
          }

          if (lhsValue.type !== List) {
            throw new TypeError(`Expected "List", instead found: ${lhsValue.type}`, cause(scope))
          }

          if (rhs.type !== Scalar) {
            throw new TypeError(`Expected "Scalar", instead found: ${rhs.type}`, cause(scope))
          }

          const listItems = lhsValue.info.items

          let kind: Scope.Value.Scalar.Kind.Computed | Scope.Value.Scalar.Kind.Audio =
            listItems.some((item) =>
              item.kind === Audio
            )
              ? Audio
              : Computed

          const items: Scope.Item[] = []

          for (const item of listItems) {
            if (item.type === Scalar) {
              if (
                item.kind === Literal
                || item.kind === Computed
              ) {
                if (kind === Audio) {
                  const emitterItem = Emitter.Op.ToAudio(scope, item)
                  scope.emit(emitterItem)
                  items.push(emitterItem.info.returnValue)
                }
                else {
                  items.push(item)
                }
              }
              else if (item.kind === Audio) {
                items.push(item)
              }
            }
          }

          if (items.length) {
            const emitterItem = Emitter.Op.Pick(scope, rhs, items, kind!)
            scope.emit(emitterItem)

            if (isPropReassign) {
              lhs.info.scope.props.set(lhs.info.identifier, emitterItem.info.returnValue)
              if (!isExternalSource(node)) {
                lhs.info.scope.propsNodes.add(lhs.info.identifier, node)
              }
              scope.stackPush(lhs)
            }
            else {
              scope.stackPush(emitterItem.info.returnValue)
            }
          }

          break
        }

        case AstNode.Op.Kind.Binary.Assign: {
          let { lhs, rhs } = node.info.analyse(scope, true)

          if (!lhs) throw new TypeError('Missing left operand.', cause(scope))
          if (!rhs) throw new TypeError('Missing right operand.', cause(scope))

          if (rhs.type === Variable) {
            if (lhs.type === Variable) {
              lhs = lhs.info.value
            }

            if (lhs && rhs.info.value && scope.feedbacks.has(rhs.info.value)) {
              scope.feedbacks.set(rhs.info.value, lhs)
            }

            // console.log('ASSIGN', rhs.info.identifier, lhs)
            rhs.info.scope[Scope.Value.Variable.KindMap[rhs.kind]].set(rhs.info.identifier, lhs)
          }
          else {
            // console.log(lhs, rhs)
            throw new TypeError(`Not implemented Assign: Lhs:${lhs.type} Rhs:${rhs.type}`, cause(scope))
          }
          break
        }
        case AstNode.Op.Kind.Binary.AssignAdd:
        case AstNode.Op.Kind.Binary.AssignSub:
        case AstNode.Op.Kind.Binary.AssignMul:
        case AstNode.Op.Kind.Binary.AssignDiv:
        case AstNode.Op.Kind.Binary.AssignPow:
        case AstNode.Op.Kind.Binary.AssignMod:
          {
            let { lhs, rhs } = node.info.analyse(scope)

            if (lhs?.type === Variable && lhs.info.value) lhs = lhs.info.value

            if (!lhs) throw new TypeError('Missing left operand.', cause(scope))
            if (!rhs) throw new TypeError('Missing right operand.', cause(scope))

            const opText = node.kind[0]!

            switch (lhs.type) {
              default: {
                throw new TypeError(`Not implemented AssignAdd: Lhs:${lhs.type}`, cause(scope))
              }
              case Variable:
              case Scalar:
              case List:
                {
                  switch (rhs.type) {
                    default: {
                      throw new TypeError(`Not implemented Assign in place: ${opText} Lhs:${lhs.type} Rhs:${rhs.type}`, cause(scope))
                    }
                    case List: {
                      for (const item of rhs.info.items) {
                        scope.stackPush(lhs)
                        scope.stackPush(item)
                        if (item.type !== Variable) {
                          throw new TypeError('Assign in place list operation needs variables in Rhs list.', cause(scope))
                        }
                        if (!item.info.value) {
                          throw new TypeError(`Assign in place operation ${opText}  but variable is empty.`, cause(scope))
                        }

                        const opNode = AstNode.Op.Binary({ ...Token.Empty, text: opText })
                        Object.assign(opNode, Token.bounds([item.info.astNode, item.info.astNode].filter(Boolean)))
                        opNode.source = node.source
                        opNode.parent = node.parent
                        visit(scope, opNode)

                        scope.stackPush(item)
                        const assignNode = AstNode.Op.Binary({ ...Token.Empty, text: '=' })
                        Object.assign(assignNode, Token.bounds([item.info.astNode, item.info.astNode].filter(Boolean)))
                        assignNode.source = node.source
                        assignNode.parent = node.parent
                        visit(scope, assignNode)
                      }
                      break
                    }
                    case Variable: {
                      const variable = rhs
                      if (!variable.info.value) throw new TypeError(`Assign in place operation ${opText} but variable is empty.`, cause(scope))

                      const opNode = AstNode.Op.Binary({ ...Token.Empty, text: opText })
                      opNode.source = node.source
                      opNode.parent = node.parent

                      Object.assign(opNode, Token.bounds([node.info.token, rhs.info.astNode].filter(Boolean)))
                      const result = Scope.Op.Binary(scope, opNode, lhs, variable.info.value)
                      if (result.emitterItem) {
                        scope.emit(result.emitterItem)
                        result.emitterItem.info.astNode = node
                      }
                      rhs.info.scope[Scope.Value.Variable.KindMap[variable.kind]].set(variable.info.identifier, result.stackValue)
                      break
                    }
                  }
                  break
                }
            }
            break
          }

        case AstNode.Op.Kind.Binary.Add:
        case AstNode.Op.Kind.Binary.Sub:
        case AstNode.Op.Kind.Binary.Mul:
        case AstNode.Op.Kind.Binary.Div:
        case AstNode.Op.Kind.Binary.Pow:
        case AstNode.Op.Kind.Binary.Mod:
          {
            const { lhs, rhs } = Scope.Op.unboxBinary(scope, node)

            // if (rhs.info.astNode?.info?.value === 447) {
            //   console.log('yeah')
            //   // debugger
            // }
            // TODO: this could become generalized/implicit? consumeProp(lhs,)
            //  or maybe unboxWith((lhs, rhs) => ...) return value is then either
            //  assigned to prop or pushed to stack.
            const isPropReassign = lhs.type === Scope.Value.Type.Prop
            // if (node.kind === AstNode.Op.Kind.Binary.Mul) {
            //   console.log('MAYBE', lhs, rhs)
            // }

            if (isPropReassign) {
              const propValue = lhs.info.scope.props.get(lhs.info.identifier)!
              // console.log('yo', propValue, rhs)
              const result = Scope.Op.Binary(scope, node, propValue, rhs)
              if (result.emitterItem) scope.emit(result.emitterItem)
              // console.log('SET', lhs.info.identifier, result.stackValue)
              lhs.info.scope.props.set(lhs.info.identifier, result.stackValue)
              // prop goes back in the stack, now it points to the operation's return value
              scope.stackPush(lhs)
              // console.log('BACKKK', result.stackValue)
            }
            else {
              const result = Scope.Op.Binary(scope, node, lhs, rhs)
              if (result.emitterItem) scope.emit(result.emitterItem)
              scope.stackPush(result.stackValue)
              // console.log('PUSH', result.stackValue)
            }
            break
          }
      }
      break
    }

    case AstNode.Type.TernaryOp: {
      const { Scalar, List, Variable } = Scope.Value.Type
      const { Literal, Computed, Audio } = Scope.Value.Scalar.Kind

      switch (node.kind) {
        // default: {
        // throw new TypeError('Not implemented: ' + node.kind, cause(scope))
        // }
        case AstNode.Op.Kind.Ternary.Slide: {
          const { lhs, mhs, rhs } = Scope.Op.unboxTernary(scope, node)

          const isPropReassign = lhs.type === Scope.Value.Type.Prop

          let lhsValue: Scope.Item | null | undefined
          if (isPropReassign) {
            lhsValue = lhs.info.scope.props.get(lhs.info.identifier)
            if (!lhsValue) {
              throw new TypeError('Expected value in the stack for: ' + lhs.info.identifier, cause(scope))
            }
          }
          else {
            lhsValue = lhs
          }

          if (!lhsValue) {
            throw new TypeError('Expected value in the stack.', cause(scope))
          }

          if (lhsValue.type !== List) {
            throw new TypeError(`Expected "List", instead found: ${lhsValue.type}`, cause(scope))
          }

          if (mhs.type !== Scope.Value.Type.Scalar) {
            throw new TypeError(`Expected "Scalar", instead found: ${mhs.type}`, cause(scope))
          }

          if (rhs.type !== Scope.Value.Type.Scalar) {
            throw new TypeError(`Expected "Scalar", instead found: ${rhs.type}`, cause(scope))
          }

          const listItems = lhsValue.info.items

          let kind: Scope.Value.Scalar.Kind.Computed | Scope.Value.Scalar.Kind.Audio =
            listItems.some((item) =>
              item.kind === Audio
            )
              ? Audio
              : Computed

          const items: Scope.Item[] = []

          for (const item of listItems) {
            if (item.type === Scalar) {
              if (
                item.kind === Literal
                || item.kind === Computed
              ) {
                if (kind === Audio) {
                  const emitterItem = Emitter.Op.ToAudio(scope, item)
                  scope.emit(emitterItem)
                  items.push(emitterItem.info.returnValue)
                }
                else {
                  items.push(item)
                }
              }
              else if (item.kind === Audio) {
                items.push(item)
              }
            }
          }
          if (items.length) {
            const emitterItem = Emitter.Op.Slide(scope, mhs, rhs, items)

            // const emitterItem = Emitter.Op.Pick(scope, rhs, items, kind!)
            scope.emit(emitterItem)

            if (isPropReassign) {
              lhs.info.scope.props.set(lhs.info.identifier, emitterItem.info.returnValue)
              if (!isExternalSource(node)) {
                lhs.info.scope.propsNodes.add(lhs.info.identifier, node)
              }
              scope.stackPush(lhs)
            }
            else {
              scope.stackPush(emitterItem.info.returnValue)
            }
          }


          // const listScope = lhs.info.scope
          // const items: Scope.Item[] = []
          // for (const item of listScope.stack) {
          //   if (item.type === Scope.Value.Type.Scalar) {
          //     items.push(item)
          //   }
          // }
          // if (items.length) {
          //   const emitterItem = Emitter.Op.Slide(listScope, mhs, rhs, items)
          //   scope.emit(emitterItem)
          //   scope.stackPush(emitterItem.info.returnValue)
          // }
          break
        }
      }
      break
    }

    case AstNode.Type.Literal: {
      const item = Scope.Value.Scalar.Literal(scope, node)
      scope.stackPush(item)
      break
    }

    case AstNode.Type.String: {
      const item = Scope.Value.String(scope, node)
      scope.stackPush(item)
      break
    }

    case AstNode.Type.Block: {
      switch (node.kind) {
        default: {
          throw new Error('Unreachable.')
        }
        case AstNode.Block.Kind.Expression: {
          const child = new Scope(node, Scope.Type.Expression, scope)
          process(child, node.info.body)
          // console.log(child)

          for (let item of child.stack) {
            // unbox variable
            if (item.type === Scope.Value.Type.Variable && item.info.value) item = item.info.value

            switch (item.type) {
              default: {
                console.log(item)
                throw new Error('Not implemented: ' + Scope.Value.Type[item.type], cause(scope))
                // break
              }
              case Scope.Value.Type.Scalar: {
                if (item.kind === Scope.Value.Scalar.Kind.Literal) {
                  if (scope.params.has(item.info.astNode)) {
                    function unboxLiteral(value: Scope.Item | undefined) {
                      if (value?.type === Scope.Value.Type.Scalar) {
                        if (
                          value
                          && value.type === Scope.Value.Type.Scalar
                          && value.kind === Scope.Value.Scalar.Kind.Literal
                        ) {
                          return value.info.astNode.info
                        }
                      }
                    }

                    const param = scope.params.get(item.info.astNode)!

                    const literal = child.stack.pop()!

                    const minInfo = unboxLiteral(child.stack.shift())
                    const maxInfo = unboxLiteral(child.stack.shift())
                    const slopeInfo = unboxLiteral(child.stack.shift())
                    const stepInfo = unboxLiteral(child.stack.shift())

                    param.min = minInfo?.value ?? param.min
                    param.max = maxInfo?.value ?? param.max
                    param.slope = slopeInfo?.value ?? param.slope
                    param.step = stepInfo?.value ?? param.step
                    param.isVol = !!param.name && param.min === 0 && param.max <= 1 && param.max >= 0.9

                    scope.stack.push(literal)
                    return
                  }
                }
                break
              }
              case Scope.Value.Type.Procedure: {
                // remove props, we've already consumed them from the stack
                // into scope.props, remaining in stack will be used in the procedure,
                // e.g when doing:  foo: { hz:= p:45 } [foo 123 p:34]
                //  p:34 shadows p:45, and 123 is assigned to hz

                child.stack = child.stack.filter((item) =>
                  item.type !== Scope.Value.Type.Prop
                )

                const proc = new Scope(node, Scope.Type.Procedure, child)

                process(proc, item.info.astNode.info.body)

                scope.returnStack.push(...proc.stack.map((item) => {
                  if (item.type === Scope.Value.Type.Variable) {
                    return item.info.value
                  }
                  else {
                    if (item.kind === Scope.Value.Scalar.Kind.Audio) {
                      // used for UI pick/slide
                      item.info.astNode = node
                    }
                    return item
                  }
                }).filter(Boolean).filter((item) => {
                  if (item.type === Scope.Value.Type.Prop) {
                    return false
                  }
                  return true
                }))

                // const inProp = proc.props.get('in')
                // if (inProp) {
                //   if (inProp.type === Scope.Value.Type.Prop) {
                //     // console.log(inProp.info.scope.props.get(inProp.info.identifier), scope.returnStack.at(-1))
                //     const last = scope.returnStack.at(-1)!

                //     // const scopeItem = Scope.Value.Variable(scope, Scope.Value.Variable.Kind.Prop, inProp.info.identifier, last)
                //     // inProp.info.scope.props.set(inProp.info.identifier, last)

                //     scope.stackPush(inProp)
                //     // console.log([...scope.stack])
                //     return
                //   }
                // }

                if (scope.returnStack.length) {
                  // console.log([...scope.returnStack])
                  const last = scope.returnStack.at(-1)!
                  // console.log(scope, proc)
                  // scope.stack.push(...scope.returnStack)
                  scope.stack.push(last)
                }

                return
              }
            }
          }
          break
        }

        case AstNode.Block.Kind.List: {
          const child = new Scope(node, Scope.Type.Expression, scope)
          process(child, node.info.body)
          const item = Scope.Value.List(child, child.stack)
          scope.stackPush(item)
          break
        }

        case AstNode.Block.Kind.Procedure: {
          const item = Scope.Value.Procedure(scope, node)
          scope.stackPush(item)
          break
        }
      }
      break
    }

    case AstNode.Type.VariableSetOp: {
      let value: Scope.Item | null | undefined

      // check for shadow
      if (node.kind === AstNode.Variable.Kind.Prop) {
        const variable = scope.lookupProp(node.info.identifier)
        value = variable?.info.value
      }

      // if nothing found
      if (value == null) {
        // maybe use variable info value
        if (node.info.value) visit(scope, node.info.value)

        // try popping from stack
        value = scope.stackPop(node.info.identifier)
        if (value == null) throw new TypeError(`Nothing in the stack to assign to "${node.info.identifier}".`, cause(scope))
      }

      if (value.type === Scope.Value.Type.Variable) {
        const variable = value
        value = variable.info.value

        if (value == null) throw new TypeError(`Variable is undefined "${variable.info.identifier}".`, cause(scope))
      }

      // TODO: check type/cast

      scope[Scope.Value.Variable.KindMap[node.kind]].set(node.info.identifier, value)
      if (!isExternalSource(node)) {
        scope.propsNodes.add(node.info.identifier, node)
      }
      const prop = Scope.Value.Prop(scope, node.info.identifier)
      scope.stackPush(prop)
      break
    }

    case AstNode.Type.VariableGetOp: {
      const variable: Scope.Value.Variable = scope.lookup(node.info.identifier)
        ?? Scope.Value.Variable(scope, Scope.Value.Variable.Kind.Local, node.info.identifier, null)
      variable.info.astNode = node
      scope.stackPush(variable)
      break
    }

    case AstNode.Type.String: {
      const item = Scope.Value.String(scope, node)
      scope.stackPush(item)
      break
    }

    case AstNode.Type.Native: {
      const item = Emitter.Op.Native(node.info.identifier, scope)
      scope.emit(item)
      scope.stackPush(item.info.returnValue)
      break
    }
  }
}

function process(scope: Scope, body: AstNode.Item[]) {
  for (const node of body) {
    scope.nodes.add(node)
    visit(scope, node)
  }
}

let prelude: { code: string }
let preludeScope: Scope
const prelude2: Source = {
  code: `\
vol_L:[lit 0] vol_R:[lit 0] vol_LR:[lit 0]
t:[lit 0] bt:[lit 0] sr:[lit 44100] co:[lit 0]
L:[audio] R:[audio] LR:[audio]
[rate sr]`
}

const postlude = Object.defineProperty({}, 'code', {
  enumerable: false,
  value: `@ LR+=`
}) as Source

/*
  LR.5* hLR=
  hLR L+=
  hLR R+=
 */

const zeroSource = { code: `[zero]` }
const zero = parse([...tokenize(zeroSource)])

export function isExternalSource(tokenOrNode: Token | AstNode.Item) {
  return !tokenOrNode.source
    || tokenOrNode.source === prelude
    || tokenOrNode.source === prelude2
    || tokenOrNode.source === postlude
    || tokenOrNode.source === zeroSource
}

export function analyse(ast: AstNode.Prog): Scope<Scope.Type.Prog> {
  if (!prelude) {
    prelude = Object.defineProperty({}, 'code', {
      enumerable: false,
      writable: true,
      value:
        `\
        audio: { \`audio\` }
        lit: { x:= \`lit\` }
        with: { name:= \`with\` }
        spectrogram: { in:= \`spectrogram\` }
        `
        + Object.entries(envGens).map(([key, labels]) =>
          `${key}:{${labels.map(({ label, stack, range }) =>
            `${label}:${stack ? '=' : (range ? range[2] : '0')}`
          ).join(' ')},\`${key}\`}`
        ).join('\n')
    }) as Source
    const tokens = [...tokenize(prelude)]
    const ast = parse(tokens)
    preludeScope = new Scope(ast, Scope.Type.Prog)
    process(preludeScope, ast.info.body)
  }

  const scope = new Scope(ast, Scope.Type.Prog)
  scope.props = new Map(preludeScope.props)

  {
    const tokens = [...tokenize(prelude2)]
    const ast = parse(tokens)
    process(scope, ast.info.body)
  }

  process(scope, ast.info.body)

  // heuristic to see if we have used an output
  if (
    isExternalSource((scope.props.get('L')!.info as any).astNode)
    && isExternalSource((scope.props.get('R')!.info as any).astNode)
    && isExternalSource((scope.props.get('LR')!.info as any).astNode)
  ) {
    // {
    const tokens = [...tokenize(postlude)]
    const ast = parse(tokens)
    process(scope, ast.info.body)
    // }
  }

  // console.log(scope)
  // {
  //   const tokens = [...tokenize(postlude)]
  //   const ast = parse(tokens)
  //   process(scope, ast.info.body)
  // }

  const { propsNodes, presetProps } = scope

  for (const key of propsNodes.keys()) {
    const nodes = [...propsNodes.get(key)!]
    let slice: string

    // TODO: very limited heuristic for determining props, probably need
    //  something more sophisticated here in the future.
    if (nodes.length === 2) {
      const [start, end] = nodes

      slice = start!.source.code.slice(
        start!.index,
        end!.index + end!.length
      )
    }
    else {
      continue
    }

    presetProps.set(key, slice)
  }

  // sorted hash id of preset props keys, is used to display
  // picker with sounds with similar preset props
  // TODO: jaccard index against any overlapping set
  scope.presetPropsId = [...presetProps.keys()].sort().join()

  // vol params
  scope.volParams = [...scope.params].filter(([, param]) =>
    param.isVol
  )

  return scope
}

export function test_analyser() {
  // @env browser
  describe('process', () => {
    const passing: [string, any][] = [
      ['sin: { hz:= `sin` } [sin 200]', [
        {
          type: Emitter.Op.Type.Native,
          info: {
            identifier: 'sin',
            props: {
              hz: {
                type: Scope.Value.Type.Scalar,
                kind: Scope.Value.Scalar.Kind.Literal,
                info: {
                  astNode: {
                    info: {
                      value: 200
                    }
                  }
                }
              }
            }
          }
        }
      ]]
    ]

    passing.forEach(([code, expected]) => {
      it(code, () => {
        const ast = parse([...tokenize({ code })])
        // console.log(ast)
        const scope = new Scope(ast, Scope.Type.Prog)
        process(scope, ast.info.body)
        // console.log(scope)
        expect(scope.emits).toMatchObject(expected)
      })
    })
  })

  describe('analyse', () => {
    const passing: [string, any][] = [
      ['[sin 200]', [
        {
          "type": "Native",
          "info": {
            "identifier": "zero",
            "props": {},
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "ScalarScalar",
            "op": "*",
            "lhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 0,
                  "col": 0,
                  "right": 0,
                  "bottom": 0,
                  "index": 0,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 0,
                      "col": 2,
                      "right": 3,
                      "bottom": 0,
                      "index": 2,
                      "source": {}
                    }
                  }
                }
              }
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 42,
                  "col": 44,
                  "right": 45,
                  "bottom": 42,
                  "index": 1389,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 42,
                      "col": 44,
                      "right": 45,
                      "bottom": 42,
                      "index": 1389,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Computed",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "+",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Computed",
              "info": {}
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "+",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 0,
                  "col": 0,
                  "right": 0,
                  "bottom": 0,
                  "index": 0,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 0,
                      "col": 15,
                      "right": 16,
                      "bottom": 0,
                      "index": 15,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Native",
          "info": {
            "identifier": "sin",
            "props": {
              "hz": {
                "type": "Scalar",
                "kind": "Literal",
                "info": {
                  "astNode": {
                    "line": 0,
                    "col": 5,
                    "right": 8,
                    "bottom": 0,
                    "index": 5,
                    "type": "Literal",
                    "kind": null,
                    "info": {
                      "value": 200,
                      "format": "f",
                      "digits": 0,
                      "token": {
                        "type": 7,
                        "text": "200",
                        "line": 0,
                        "col": 5,
                        "right": 8,
                        "bottom": 0,
                        "index": 5,
                        "source": {
                          "code": "[sin 200]"
                        }
                      }
                    }
                  }
                }
              },
              "offset": {
                "type": "Scalar",
                "kind": "Literal",
                "info": {
                  "astNode": {
                    "line": 0,
                    "col": 0,
                    "right": 0,
                    "bottom": 0,
                    "index": 0,
                    "type": "Literal",
                    "kind": null,
                    "info": {
                      "value": 0,
                      "format": "f",
                      "digits": 0,
                      "token": {
                        "type": 7,
                        "text": "0",
                        "line": 3,
                        "col": 17,
                        "right": 18,
                        "bottom": 3,
                        "index": 122,
                        "source": {}
                      }
                    }
                  }
                }
              },
              "trig": {
                "type": "Scalar",
                "kind": "Literal",
                "info": {
                  "astNode": {
                    "line": 0,
                    "col": 0,
                    "right": 0,
                    "bottom": 0,
                    "index": 0,
                    "type": "Literal",
                    "kind": null,
                    "info": {
                      "value": 0,
                      "format": "f",
                      "digits": 0,
                      "token": {
                        "type": 7,
                        "text": "0",
                        "line": 3,
                        "col": 24,
                        "right": 25,
                        "bottom": 3,
                        "index": 129,
                        "source": {}
                      }
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "*",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 1,
                  "col": 4,
                  "right": 6,
                  "bottom": 1,
                  "index": 5,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0.5,
                    "format": "f",
                    "digits": 1,
                    "token": {
                      "type": 7,
                      "text": ".5",
                      "line": 1,
                      "col": 4,
                      "right": 6,
                      "bottom": 1,
                      "index": 5,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "+",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 0,
                  "col": 0,
                  "right": 0,
                  "bottom": 0,
                  "index": 0,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 0,
                      "col": 6,
                      "right": 7,
                      "bottom": 0,
                      "index": 6,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "+",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 0,
                  "col": 0,
                  "right": 0,
                  "bottom": 0,
                  "index": 0,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 0,
                      "col": 10,
                      "right": 11,
                      "bottom": 0,
                      "index": 10,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        }
      ]],
      ['[sin 200] [slp 200]', [
        {
          "type": "Native",
          "info": {
            "identifier": "zero",
            "props": {},
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "ScalarScalar",
            "op": "*",
            "lhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 0,
                  "col": 0,
                  "right": 0,
                  "bottom": 0,
                  "index": 0,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 0,
                      "col": 2,
                      "right": 3,
                      "bottom": 0,
                      "index": 2,
                      "source": {}
                    }
                  }
                }
              }
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 42,
                  "col": 44,
                  "right": 45,
                  "bottom": 42,
                  "index": 1389,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 42,
                      "col": 44,
                      "right": 45,
                      "bottom": 42,
                      "index": 1389,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Computed",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "+",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Computed",
              "info": {}
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "+",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 0,
                  "col": 0,
                  "right": 0,
                  "bottom": 0,
                  "index": 0,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 0,
                      "col": 15,
                      "right": 16,
                      "bottom": 0,
                      "index": 15,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Native",
          "info": {
            "identifier": "sin",
            "props": {
              "hz": {
                "type": "Scalar",
                "kind": "Literal",
                "info": {
                  "astNode": {
                    "line": 0,
                    "col": 5,
                    "right": 8,
                    "bottom": 0,
                    "index": 5,
                    "type": "Literal",
                    "kind": null,
                    "info": {
                      "value": 200,
                      "format": "f",
                      "digits": 0,
                      "token": {
                        "type": 7,
                        "text": "200",
                        "line": 0,
                        "col": 5,
                        "right": 8,
                        "bottom": 0,
                        "index": 5,
                        "source": {
                          "code": "[sin 200] [slp 200]"
                        }
                      }
                    }
                  }
                }
              },
              "offset": {
                "type": "Scalar",
                "kind": "Literal",
                "info": {
                  "astNode": {
                    "line": 0,
                    "col": 0,
                    "right": 0,
                    "bottom": 0,
                    "index": 0,
                    "type": "Literal",
                    "kind": null,
                    "info": {
                      "value": 0,
                      "format": "f",
                      "digits": 0,
                      "token": {
                        "type": 7,
                        "text": "0",
                        "line": 3,
                        "col": 17,
                        "right": 18,
                        "bottom": 3,
                        "index": 122,
                        "source": {}
                      }
                    }
                  }
                }
              },
              "trig": {
                "type": "Scalar",
                "kind": "Literal",
                "info": {
                  "astNode": {
                    "line": 0,
                    "col": 0,
                    "right": 0,
                    "bottom": 0,
                    "index": 0,
                    "type": "Literal",
                    "kind": null,
                    "info": {
                      "value": 0,
                      "format": "f",
                      "digits": 0,
                      "token": {
                        "type": 7,
                        "text": "0",
                        "line": 3,
                        "col": 24,
                        "right": 25,
                        "bottom": 3,
                        "index": 129,
                        "source": {}
                      }
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Native",
          "info": {
            "identifier": "slp",
            "props": {
              "cut": {
                "type": "Scalar",
                "kind": "Literal",
                "info": {
                  "astNode": {
                    "line": 0,
                    "col": 15,
                    "right": 18,
                    "bottom": 0,
                    "index": 15,
                    "type": "Literal",
                    "kind": null,
                    "info": {
                      "value": 200,
                      "format": "f",
                      "digits": 0,
                      "token": {
                        "type": 7,
                        "text": "200",
                        "line": 0,
                        "col": 15,
                        "right": 18,
                        "bottom": 0,
                        "index": 15,
                        "source": {
                          "code": "[sin 200] [slp 200]"
                        }
                      }
                    }
                  }
                }
              },
              "in": {
                "type": "Scalar",
                "kind": "Audio",
                "info": {}
              },
              "q": {
                "type": "Scalar",
                "kind": "Literal",
                "info": {
                  "astNode": {
                    "line": 0,
                    "col": 0,
                    "right": 0,
                    "bottom": 0,
                    "index": 0,
                    "type": "Literal",
                    "kind": null,
                    "info": {
                      "value": 0.5,
                      "format": "f",
                      "digits": 1,
                      "token": {
                        "type": 7,
                        "text": "0.5",
                        "line": 24,
                        "col": 18,
                        "right": 21,
                        "bottom": 24,
                        "index": 754,
                        "source": {}
                      }
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "*",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 1,
                  "col": 4,
                  "right": 6,
                  "bottom": 1,
                  "index": 5,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0.5,
                    "format": "f",
                    "digits": 1,
                    "token": {
                      "type": 7,
                      "text": ".5",
                      "line": 1,
                      "col": 4,
                      "right": 6,
                      "bottom": 1,
                      "index": 5,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "+",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 0,
                  "col": 0,
                  "right": 0,
                  "bottom": 0,
                  "index": 0,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 0,
                      "col": 6,
                      "right": 7,
                      "bottom": 0,
                      "index": 6,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        },
        {
          "type": "Binary",
          "info": {
            "kind": "AudioScalar",
            "op": "+",
            "lhs": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            },
            "rhs": {
              "type": "Scalar",
              "kind": "Literal",
              "info": {
                "astNode": {
                  "line": 0,
                  "col": 0,
                  "right": 0,
                  "bottom": 0,
                  "index": 0,
                  "type": "Literal",
                  "kind": null,
                  "info": {
                    "value": 0,
                    "format": "f",
                    "digits": 0,
                    "token": {
                      "type": 7,
                      "text": "0",
                      "line": 0,
                      "col": 10,
                      "right": 11,
                      "bottom": 0,
                      "index": 10,
                      "source": {}
                    }
                  }
                }
              }
            },
            "returnValue": {
              "type": "Scalar",
              "kind": "Audio",
              "info": {}
            }
          }
        }
      ]],
    ]

    passing.forEach(([code, expected]) => {
      it(code, () => {
        const ast = parse([...tokenize({ code })])
        console.log(ast)
        const scope = analyse(ast)
        console.log(scope)
        expect(scope.emits).toMatchObject(expected)
      })
    })
  })
}

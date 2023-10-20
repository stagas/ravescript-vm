import { NumberInfo, parseNumber } from '../util.ts'
import { Scope } from './analyser.ts'
import { Emitter } from './emitter.ts'
import { Source, Token, tokenize } from './tokenizer.ts'

export class AstNode<
  T extends AstNode.Type = AstNode.Type,
  U extends AstNode.Kind = null,
  V = null
> {
  constructor(
    /** AstNode type. */
    public type: T,
    /** AstNode secondary type (or "kind" for less ambiguity). */
    public kind: U,
    /** AstNode specific information. */
    public info: V,
  ) {
    Object.defineProperty(this, 'parent', { enumerable: false, writable: true })
    Object.defineProperty(this, 'source', { enumerable: false, writable: true })
  }
  /** AstNode's parent (undefined for root). */
  declare parent?: AstNode<any, any, any> | undefined
  /** Zero based line number. */
  line: number = 0
  /** Zero based column number. */
  col: number = 0
  /** Rightmost column number, zero based. */
  right: number = 0
  /** Bottom line, zero based. */
  bottom: number = 0
  /** Zero based index. */
  index: number = 0
  /** Node token(s) total length. */
  length: number = 0
  /** Reference to the source code document. */
  declare source: Source
}

export namespace AstNode {
  export enum Type {
    Prog = 'Prog',
    Keyword = 'Keyword',
    Block = 'Block',
    VariableGetOp = 'VariableGetOp',
    VariableSetOp = 'VariableSetOp',
    UnaryOp = 'UnaryOp',
    BinaryOp = 'BinaryOp',
    TernaryOp = 'TernaryOp',
    String = 'String',
    Literal = 'Literal',
    Computed = 'Computed',
    Native = 'Native',
    Invalid = 'Invalid',
  }

  export type Kind =
    | Block.Kind
    | Keyword.Kind
    | Op.Kind.Unary
    | Op.Kind.Binary
    | Op.Kind.Ternary
    | Variable.Kind
    | null

  export type Value =
    | Block.List
    | Block.Procedure
    | String
    | Literal
    | Computed
    | Native

  export type Info =
    | Prog.Info
    | Block.Info
    | Keyword.Info
    | Op.Unary.Info
    | Op.Binary.Info
    | Op.Ternary.Info
    | String.Info
    | Literal.Info
    | Computed.Info
    | Native.Info

  export type Item =
    | Prog
    | Keyword
    | Block.Expression
    | Block.List
    | Block.Procedure
    | VariableGetOp
    | VariableSetOp
    | Op.Unary
    | Op.Binary
    | Op.Ternary
    | String
    | Literal
    | Computed
    | Native
    | Invalid

  // variable types
  export interface String extends AstNode<Type.String, null, String.Info> { }
  export namespace String { export interface Info { token: Token<Token.Type.String>, value: string } }

  export interface Literal extends AstNode<Type.Literal, null, Literal.Info> { }
  export namespace Literal {
    export interface Info extends NumberInfo {
      token: Token<Token.Type.Number>
      param?: Emitter.Param
    }
  }

  export interface Computed extends AstNode<Type.Computed, null, Computed.Info> { }
  export namespace Computed { export interface Info { } }

  export interface Native extends AstNode<Type.Native, null, Native.Info> { }
  export namespace Native { export interface Info { identifier: string } }

  // variable access
  export namespace Variable {
    export enum Kind {
      Local = 'Local',
      Prop = 'Prop',
    }
  }
  export interface VariableGetOp extends AstNode<Type.VariableGetOp, null, VariableGetOp.Info> { }
  export namespace VariableGetOp { export interface Info { identifier: string } }
  export interface VariableSetOp<U extends Variable.Kind = Variable.Kind> extends AstNode<Type.VariableSetOp, U, VariableSetOp.Info> { }
  export namespace VariableSetOp { export interface Info { identifier: string, value: AstNode.Item } }

  // blocks
  export interface Block<U extends Block.Kind = Block.Kind, V = object> extends AstNode<Type.Block, U, V> { }{ }
  export namespace Block {
    export enum Kind {
      Expression = 'Expression',
      List = 'List',
      Procedure = 'Procedure',
    }

    export interface Info {
      body: Item[]
      tokens: Token[]
    }

    export const CloseType = {
      ']': AstNode.Block.Kind.Expression,
      ')': AstNode.Block.Kind.List,
      '}': AstNode.Block.Kind.Procedure,
    } as const
    export type Close = keyof typeof CloseType
    export const OpenType = {
      [AstNode.Block.Kind.Expression]: '[',
      [AstNode.Block.Kind.List]: '(',
      [AstNode.Block.Kind.Procedure]: '{',
    }

    export interface Expression extends Block<Kind.Expression, Expression.Info> { }
    export namespace Expression { export interface Info extends Block.Info { hasView?: boolean } }

    export interface List extends Block<Kind.List, List.Info> { }
    export namespace List { export interface Info extends Block.Info { } }

    export interface Procedure extends Block<Kind.Procedure, Procedure.Info> { }
    export namespace Procedure { export interface Info extends Block.Info { } }
  }

  // semantics
  export interface Prog extends AstNode<Type.Prog, null, Block.Info> { }
  export namespace Prog { export interface Info extends Block.Info { } }

  export interface Keyword<U extends Keyword.Kind = Keyword.Kind> extends AstNode<Type.Keyword, U, Keyword.Info> { }
  export function Keyword<U extends Keyword.Kind>(kind: U, token: Token): AstNode.Keyword<U> {
    const info: Keyword.Info = { token }
    return new AstNode(AstNode.Type.Keyword, kind, info)
  }
  export namespace Keyword {
    export enum Kind {
      Param = 'Param',
      Mute = 'Mute',
      Solo = 'Solo',
      Mixdown = 'Mixdown',
      Comma = 'Comma',
    }
    export interface Info {
      token: Token
    }
  }

  export interface Invalid extends AstNode<Type.Invalid, null, Invalid.Info> { }
  export namespace Invalid { export interface Info { token: Token } }

  // ops
  export namespace Op {
    export type Item = Unary | Binary | Ternary

    export namespace Kind {
      export enum Unary {
        Negate = '!',
        Floor = 'floor',
        AssignNeg = '!=',
        AssignFloor = 'floor=',
        AssignLabel = ':=',
      }

      export enum Binary {
        Add = '+',
        Sub = '-',
        Mul = '*',
        Div = '/',
        Pow = '^',
        Mod = '%',
        Pick = 'pick',
        Assign = '=',
        AssignAdd = '+=',
        AssignSub = '-=',
        AssignMul = '*=',
        AssignDiv = '/=',
        AssignPow = '^=',
        AssignMod = '%=',
      }

      export enum Ternary {
        Slide = 'slide',
      }
    }

    export interface Unary extends AstNode<Type.UnaryOp, Op.Kind.Unary, Unary.Info> { }
    export namespace Unary {
      export interface Info { token: Token<Token.Type.Op>, analyse(scope: Scope): OperandInfo }
      export interface OperandInfo { arg: Scope.Item | null | undefined }
    }
    export interface Binary extends AstNode<Type.BinaryOp, Op.Kind.Binary, Binary.Info> { }
    export namespace Binary {
      export interface Info { token: Token<Token.Type.Op>, analyse(scope: Scope, withIdentifier?: boolean): OperandInfo }
      export interface OperandInfo { lhs: Scope.Item | null | undefined, rhs: Scope.Item | null | undefined }
    }

    export interface Ternary extends AstNode<Type.TernaryOp, Op.Kind.Ternary, Ternary.Info> { }
    export namespace Ternary {
      export interface Info { token: Token<Token.Type.Op>, analyse(scope: Scope): OperandInfo }
      export interface OperandInfo { lhs: Scope.Item | null | undefined, mhs: Scope.Item | null | undefined, rhs: Scope.Item | null | undefined }
    }

    export function Unary(token: Token<Token.Type.Op>): Unary {
      const info: Unary.Info = {
        token,
        analyse: (scope: Scope): Unary.OperandInfo => ({
          arg: scope.stackPop()
        })
      }
      return new AstNode(
        AstNode.Type.UnaryOp,
        <Kind.Unary>token.text,
        info
      )
    }

    export function Binary(token: Token<Token.Type.Op>): Binary {
      const info: Binary.Info = {
        token,
        analyse: (scope: Scope, withIdentifier?: boolean): Binary.OperandInfo => {
          const rhs = scope.stackPop()
          const lhs = scope.stackPop(
            withIdentifier
            && (rhs as Scope.Value.Variable)?.info?.identifier
            || void 0
          )
          return { lhs, rhs }
        }
      }
      return new AstNode(
        AstNode.Type.BinaryOp,
        <Kind.Binary>token.text,
        info
      )
    }

    export function Ternary(token: Token<Token.Type.Op>): Ternary {
      const info: Ternary.Info = {
        token,
        analyse: (scope: Scope): Ternary.OperandInfo => ({
          rhs: scope.stackPop(), mhs: scope.stackPop(), lhs: scope.stackPop()
        })
      }
      return new AstNode(
        AstNode.Type.TernaryOp,
        <Kind.Ternary>token.text,
        info
      )
    }
  }

  export const unaryOps = new Set(Object.values(Op.Kind.Unary))
  export const binaryOps = new Set(Object.values(Op.Kind.Binary))
  export const ternaryOps = new Set(Object.values(Op.Kind.Ternary))

  // node factories

  export function Literal(token: Token<Token.Type.Number>): AstNode.Literal {
    return new AstNode(
      AstNode.Type.Literal,
      null,
      Object.assign(
        parseNumber(token.text),
        { token }
      )
    )
  }

  export function Computed(): AstNode.Computed {
    return new AstNode(
      AstNode.Type.Computed,
      null,
      {}
    )
  }

  export function VariableSetOp(kind: Variable.Kind, identifier: string, value: AstNode.Item): AstNode.VariableSetOp {
    const info: VariableSetOp.Info = { identifier, value }
    return new AstNode(AstNode.Type.VariableSetOp, kind, info)
  }

  export function VariableGetOp(identifier: string): AstNode.VariableGetOp {
    const info: VariableGetOp.Info = { identifier }
    return new AstNode(AstNode.Type.VariableGetOp, null, info)
  }

  export function Expression(info: AstNode.Block.Expression.Info): AstNode.Block.Expression {
    const node = new AstNode(AstNode.Type.Block, AstNode.Block.Kind.Expression, info)
    info.body.forEach(child => child.parent = node)
    return node
  }

  export function List(info: AstNode.Block.List.Info): AstNode.Block.List {
    const node = new AstNode(AstNode.Type.Block, AstNode.Block.Kind.List, info)
    info.body.forEach(child => child.parent = node)
    return node
  }

  export function Procedure(info: AstNode.Block.Procedure.Info): AstNode.Block.Procedure {
    const node = new AstNode(AstNode.Type.Block, AstNode.Block.Kind.Procedure, info)
    info.body.forEach(child => child.parent = node)
    return node
  }

  export function Native(token: Token<Token.Type.Native>): AstNode.Native {
    const info: Native.Info = { identifier: token.text.slice(1, -1) }
    return new AstNode(AstNode.Type.Native, null, info)
  }

  export function Prog(info: AstNode.Prog.Info): AstNode.Prog {
    const node = new AstNode(AstNode.Type.Prog, null, info)
    info.body.forEach(child => child.parent = node)
    return node
  }

  export function String(token: Token): AstNode.String {
    const info: String.Info = { token, value: token.text.slice(1, -1) }
    return new AstNode(AstNode.Type.String, null, info)
  }

  export function Invalid(token: Token): AstNode.Invalid {
    const info: Invalid.Info = { token }
    return new AstNode(AstNode.Type.Invalid, null, info)
  }
}

export function parse(inputTokens: Token[]): AstNode.Prog {
  const tokens = inputTokens.filter(Token.isTerminal)
  // console.log(tokens)
  const capturing: Token[][] = []
  const end = tokens.length
  let i = 0
  let token!: Token
  let peek: Token | undefined = tokens[i]

  function next() {
    token = peek!
    capturing.forEach(tokens => tokens.push(token))
    peek = tokens[++i]
  }

  function capture(until?: number) {
    const body: AstNode.Block.Info['body'] = []
    const tokens: Token[] = []
    capturing.push(tokens)
    if (token) tokens.push(token)
    let node: AstNode.Item
    while (i < end) {
      const tokens: Token[] = []
      capturing.push(tokens)
      try {
        next()
        if (until != null && token.text.charCodeAt(0) === until) {
          break
        }
        node = process(body)
        node.source = token.source
      } finally {
        if (capturing.pop() !== tokens) {
          throw new Error('Capturing group did not match.', { cause: { nodes: [token] } })
        }
      }
      Object.assign(node, Token.bounds(tokens))
      body.push(node)
    }
    if (capturing.pop() !== tokens) {
      throw new Error('Capturing group did not match.', { cause: { nodes: [token] } })
    }
    return { body, tokens }
  }

  function process(body: AstNode.Item[]): AstNode.Item {
    switch (token.type) {
      default: return AstNode.Invalid(token)

      case Token.Type.Keyword:
        switch (token.text) { // sorted by occurrence probability
          case '\\': return AstNode.Keyword(AstNode.Keyword.Kind.Param, token)
          case 'M': return AstNode.Keyword(AstNode.Keyword.Kind.Mute, token)
          case 'S': return AstNode.Keyword(AstNode.Keyword.Kind.Solo, token)
          case '@': return AstNode.Keyword(AstNode.Keyword.Kind.Mixdown, token)
          case ',': return AstNode.Keyword(AstNode.Keyword.Kind.Comma, token)
        }
        throw new Error('Unreachable.')

      case Token.Type.Op:
        switch (token.text) {
          case AstNode.Block.OpenType[AstNode.Block.Kind.List]: return AstNode.List(capture(Token.closeOf(token)))
          case AstNode.Block.OpenType[AstNode.Block.Kind.Procedure]: return AstNode.Procedure(capture(Token.closeOf(token)))
          case AstNode.Block.OpenType[AstNode.Block.Kind.Expression]: return AstNode.Expression(capture(Token.closeOf(token)))
        }

        if (AstNode.binaryOps.has(token.text)) {
          return AstNode.Op.Binary(token)
        }
        else if (AstNode.unaryOps.has(token.text)) {
          return AstNode.Op.Unary(token)
        }
        else if (AstNode.ternaryOps.has(token.text)) {
          return AstNode.Op.Ternary(token)
        }
        else {
          throw new SyntaxError('Unexpected operation.', { cause: { nodes: [token] } })
        }

      case Token.Type.Id:
        if (peek?.text === ':') {
          const id: Token<Token.Type.Id> = token

          next() // ':'

          const tokens: Token[] = []
          capturing.push(tokens)

          next()

          const value = process(body)
          value.source = token.source

          if (capturing.pop() !== tokens) {
            throw new Error('Capturing group did not match.')
          }
          Object.assign(value, Token.bounds(tokens))

          const node = AstNode.VariableSetOp(AstNode.Variable.Kind.Prop, id.text, value)
          value.parent = node
          return node
        }
        else {
          return AstNode.VariableGetOp(token.text)
        }

      case Token.Type.String: return AstNode.String(token)
      case Token.Type.Native: return AstNode.Native(token)
      case Token.Type.Number: return AstNode.Literal(token)
    }
  }

  return AstNode.Prog(capture())
}

export function test_parser() {
  // @env browser
  describe('parse', () => {
    const passing: [string, any][] = [
      ['[sin 200 [20 sin]+]', {
        type: AstNode.Type.Prog,
        info: {
          tokens: [
            {
              "type": 5,
              "text": "[",
              "line": 0,
              "col": 0,
              "right": 1,
              "bottom": 0,
              "index": 0,
              "source": {
                "code": "[sin 200 [20 sin]+]"
              }
            },
            {
              "type": 6,
              "text": "sin",
              "line": 0,
              "col": 1,
              "right": 4,
              "bottom": 0,
              "index": 1,
              "source": {
                "code": "[sin 200 [20 sin]+]"
              }
            },
            {
              "type": 7,
              "text": "200",
              "line": 0,
              "col": 5,
              "right": 8,
              "bottom": 0,
              "index": 5,
              "source": {
                "code": "[sin 200 [20 sin]+]"
              }
            },
            {
              "type": 5,
              "text": "[",
              "line": 0,
              "col": 9,
              "right": 10,
              "bottom": 0,
              "index": 9,
              "source": {
                "code": "[sin 200 [20 sin]+]"
              }
            },
            {
              "type": 7,
              "text": "20",
              "line": 0,
              "col": 10,
              "right": 12,
              "bottom": 0,
              "index": 10,
              "source": {
                "code": "[sin 200 [20 sin]+]"
              }
            },
            {
              "type": 6,
              "text": "sin",
              "line": 0,
              "col": 13,
              "right": 16,
              "bottom": 0,
              "index": 13,
              "source": {
                "code": "[sin 200 [20 sin]+]"
              }
            },
            {
              "type": 5,
              "text": "]",
              "line": 0,
              "col": 16,
              "right": 17,
              "bottom": 0,
              "index": 16,
              "source": {
                "code": "[sin 200 [20 sin]+]"
              }
            },
            {
              "type": 5,
              "text": "+",
              "line": 0,
              "col": 17,
              "right": 18,
              "bottom": 0,
              "index": 17,
              "source": {
                "code": "[sin 200 [20 sin]+]"
              }
            },
            {
              "type": 5,
              "text": "]",
              "line": 0,
              "col": 18,
              "right": 19,
              "bottom": 0,
              "index": 18,
              "source": {
                "code": "[sin 200 [20 sin]+]"
              }
            }
          ],
          body: [
            {
              type: AstNode.Type.Block,
              kind: AstNode.Block.Kind.Expression,
              info: {
                body: [
                  { type: AstNode.Type.VariableGetOp, info: { identifier: 'sin' } },
                  { type: AstNode.Type.Literal, info: { value: 200 } },
                  {
                    type: AstNode.Type.Block,
                    kind: AstNode.Block.Kind.Expression,
                    info: {
                      tokens: [
                        {
                          "type": 5,
                          "text": "[",
                          "line": 0,
                          "col": 9,
                          "right": 10,
                          "bottom": 0,
                          "index": 9,
                          "source": {
                            "code": "[sin 200 [20 sin]+]"
                          }
                        },
                        {
                          "type": 7,
                          "text": "20",
                          "line": 0,
                          "col": 10,
                          "right": 12,
                          "bottom": 0,
                          "index": 10,
                          "source": {
                            "code": "[sin 200 [20 sin]+]"
                          }
                        },
                        {
                          "type": 6,
                          "text": "sin",
                          "line": 0,
                          "col": 13,
                          "right": 16,
                          "bottom": 0,
                          "index": 13,
                          "source": {
                            "code": "[sin 200 [20 sin]+]"
                          }
                        },
                        {
                          "type": 5,
                          "text": "]",
                          "line": 0,
                          "col": 16,
                          "right": 17,
                          "bottom": 0,
                          "index": 16,
                          "source": {
                            "code": "[sin 200 [20 sin]+]"
                          }
                        }
                      ],
                      body: [
                        { type: AstNode.Type.Literal, info: { value: 20 } },
                        { type: AstNode.Type.VariableGetOp, info: { identifier: 'sin' } },
                      ]
                    }
                  },
                  {
                    type: AstNode.Type.BinaryOp,
                    kind: AstNode.Op.Kind.Binary.Add,
                  },
                ]
              }
            }
            // {
            //   stack: [
            //     { text: 'sin' },
            //     {
            //       type: 'Binary',
            //       text: '+',
            //       lhs: { text: '200' },
            //       rhs: { stack: [{ text: '20' }, { text: 'sin' }] },
            //     }
            //   ]
            // }
          ]
        }
      }],

      ['[sin hz:200]', {
        "line": 0,
        "col": 0,
        "right": 0,
        "bottom": 0,
        "index": 0,
        "type": "Prog",
        "kind": null,
        "info": {
          "body": [
            {
              "line": 0,
              "col": 0,
              "right": 12,
              "bottom": 0,
              "index": 0,
              "type": "Block",
              "kind": "Expression",
              "info": {
                "body": [
                  {
                    "line": 0,
                    "col": 1,
                    "right": 4,
                    "bottom": 0,
                    "index": 1,
                    "type": "VariableGetOp",
                    "kind": null,
                    "info": {
                      "identifier": "sin"
                    }
                  },
                  {
                    "line": 0,
                    "col": 5,
                    "right": 11,
                    "bottom": 0,
                    "index": 5,
                    "type": "VariableSetOp",
                    "kind": "Prop",
                    "info": {
                      "identifier": "hz",
                      "value": {
                        "line": 0,
                        "col": 0,
                        "right": 0,
                        "bottom": 0,
                        "index": 0,
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
                            "col": 8,
                            "right": 11,
                            "bottom": 0,
                            "index": 8,
                            "source": {
                              "code": "[sin hz:200]"
                            }
                          }
                        }
                      }
                    }
                  }
                ],
                "tokens": [
                  {
                    "type": 5,
                    "text": "[",
                    "line": 0,
                    "col": 0,
                    "right": 1,
                    "bottom": 0,
                    "index": 0,
                    "source": {
                      "code": "[sin hz:200]"
                    }
                  },
                  {
                    "type": 6,
                    "text": "sin",
                    "line": 0,
                    "col": 1,
                    "right": 4,
                    "bottom": 0,
                    "index": 1,
                    "source": {
                      "code": "[sin hz:200]"
                    }
                  },
                  {
                    "type": 6,
                    "text": "hz",
                    "line": 0,
                    "col": 5,
                    "right": 7,
                    "bottom": 0,
                    "index": 5,
                    "source": {
                      "code": "[sin hz:200]"
                    }
                  },
                  {
                    "type": 5,
                    "text": ":",
                    "line": 0,
                    "col": 7,
                    "right": 8,
                    "bottom": 0,
                    "index": 7,
                    "source": {
                      "code": "[sin hz:200]"
                    }
                  },
                  {
                    "type": 7,
                    "text": "200",
                    "line": 0,
                    "col": 8,
                    "right": 11,
                    "bottom": 0,
                    "index": 8,
                    "source": {
                      "code": "[sin hz:200]"
                    }
                  },
                  {
                    "type": 5,
                    "text": "]",
                    "line": 0,
                    "col": 11,
                    "right": 12,
                    "bottom": 0,
                    "index": 11,
                    "source": {
                      "code": "[sin hz:200]"
                    }
                  }
                ]
              }
            }
          ],
          "tokens": [
            {
              "type": 5,
              "text": "[",
              "line": 0,
              "col": 0,
              "right": 1,
              "bottom": 0,
              "index": 0,
              "source": {
                "code": "[sin hz:200]"
              }
            },
            {
              "type": 6,
              "text": "sin",
              "line": 0,
              "col": 1,
              "right": 4,
              "bottom": 0,
              "index": 1,
              "source": {
                "code": "[sin hz:200]"
              }
            },
            {
              "type": 6,
              "text": "hz",
              "line": 0,
              "col": 5,
              "right": 7,
              "bottom": 0,
              "index": 5,
              "source": {
                "code": "[sin hz:200]"
              }
            },
            {
              "type": 5,
              "text": ":",
              "line": 0,
              "col": 7,
              "right": 8,
              "bottom": 0,
              "index": 7,
              "source": {
                "code": "[sin hz:200]"
              }
            },
            {
              "type": 7,
              "text": "200",
              "line": 0,
              "col": 8,
              "right": 11,
              "bottom": 0,
              "index": 8,
              "source": {
                "code": "[sin hz:200]"
              }
            },
            {
              "type": 5,
              "text": "]",
              "line": 0,
              "col": 11,
              "right": 12,
              "bottom": 0,
              "index": 11,
              "source": {
                "code": "[sin hz:200]"
              }
            }
          ]
        }
      }],
      // ['[lpf 1k2 q:2]', {
      //   stack: [
      //     {
      //       stack: [
      //         { type: 'id', text: 'lpf' },
      //         { type: 'number', text: '1k2' },
      //         {
      //           type: 'varSet', text: 'q', value:
      //             { type: 'number', text: '2' },
      //         },
      //       ]
      //     }
      //   ]
      // }],
    ]

    passing.forEach(([code, expected]) => {
      it(code, () => {
        const ast = parse([...tokenize({ code })])
        console.log(ast)
        expect(ast).toMatchObject(expected)
      })
    })
  })
}

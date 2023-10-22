// import { LineCol } from '../../web/editor/editor'
import { Build, Frontend } from './frontend.ts'
import { AstNode, Emitter, Scope, isExternalSource, tokenize } from './lang/index.ts'
import { Vm, fetchVmBinary, initVm } from './vm.ts'

type LineColId = string & readonly ['lineColId']
type HashId = string & readonly ['hashId']
type ScopeHashId = string & readonly ['scopeHashId']

export namespace UI {
  export interface View {
    lineCol: LineColId
    hash: HashId
    scopeId: number
    scopeHash: ScopeHashId
    node: AstNode.Item
    audio: Emitter.Audio
    ancestorIds: number[]
  }

  export interface Node {
    lineCol: LineColId
    view: View | null
    children: Map<HashId, Node>
  }
}

export class UI {
  visible: Map<ScopeHashId, UI.View> = new Map()
  nextVisible: Map<LineColId, UI.View> = new Map()

  static lineColOf(node: AstNode.Item) {
    return `${node.line}:${node.col}` as LineColId
  }

  static hashOf(node: AstNode.Item, audio: Emitter.Audio) {
    return `${node.line}:${node.col}.${audio.ptr}` as HashId
  }

  static scopeHashOf(caller: Emitter.Caller, audio: Emitter.Audio) {
    return `${caller.scopeId}.${audio.ptr}` as HashId
  }

  static keys(caller: Emitter.Caller, audio?: Emitter.Audio) {
    return {
      scopeId: caller.scopeId,
      lineCol: UI.lineColOf(caller.node),
      scopeHash: (audio ? UI.scopeHashOf(caller, audio) : '') as ScopeHashId,
      hash: (audio ? UI.hashOf(caller.node, audio) : '') as HashId
    }
  }

  static views(arr: AstNode.Item[]): AstNode.Item[] {
    return arr.filter((x) => (
      x.type !== AstNode.Type.Block
      || x.kind !== AstNode.Block.Kind.Expression
      || x.info.hasView
    ) && !isExternalSource(x))
  }

  static makeView(caller: Emitter.Caller, audio: Emitter.Audio, ancestorIds: number[]): UI.View {
    return Object.assign(
      UI.keys(caller, audio),
      caller,
      { audio, ancestorIds })
  }

  static sortViews({ node: a }: UI.View, { node: b }: UI.View) {
    return a.line === b.line
      ? a.col - b.col
      : a.line < b.line
        ? -1
        : 1
  }

  constructor(public build: Build.Sound) { }

  updateVisible() {
    this.visible.clear()
    this.nextVisible.forEach((view, hash) => {
      this.visible.set(view.scopeHash, view)
    })
  }

  getElevated() {
    const gens = this.build.info.gens
    return [...new Map(gens.flatMap((gen) =>
      gen.audio?.callers.filter((view) =>
        !isExternalSource(view.node)
      )
    ).filter(Boolean).map((caller) =>
      [UI.keys(caller).lineCol, caller.node] as const
    )).values()]
  }

  getViews(posId: string) {
    const lineColId = posId as LineColId

    const { visible, nextVisible } = this
    const { info } = this.build

    const map: Map<HashId, UI.View> = new Map()
    const mapByLineCol: Map<LineColId, UI.View> = new Map()
    const newlyVisible: Map<LineColId, UI.View> = new Map()
    const scopeIds: Set<number> = new Set()
    const ptrs: Set<number> = new Set()
    const visibleByLineCol: Map<LineColId, UI.View> = new Map()
    const scopeHashes = new Set()

    let ancestorIds: number[]
    for (const audio of info.audios) {
      ancestorIds = []
      for (const caller of audio.callers.filter((view) =>
        !isExternalSource(view.node)
      )) {
        ancestorIds.push(caller.scopeId)
        const newView = UI.makeView(caller, audio, [...ancestorIds])
        let view: UI.View | undefined = map.get(newView.hash)
        if (!view) map.set(newView.hash, view = newView)
        mapByLineCol.set(view.lineCol, view)
        // TODO: test the moves
        if (visible.has(view.scopeHash)) {
          visibleByLineCol.set(view.lineCol, view)
        }
        scopeHashes.add(view.scopeHash)
      }
      scopeIds.add(audio.scopeId)
      ptrs.add(audio.ptr)
    }

    // TODO: test the clears
    for (const [scopeHashId, view] of visible.entries()) {
      if (!scopeHashes.has(scopeHashId) || !scopeIds.has(view.audio.scopeId) || !ptrs.has(view.audio.ptr)) {
        visible.clear()
        visibleByLineCol.clear()
        break
      }
    }

    let focused: UI.View | undefined

    if (!lineColId) {
      if (!visible.size) {
        map.forEach((view) => {
          newlyVisible.set(view.lineCol, view)
        })
      }
    }
    else {
      const current = visibleByLineCol.get(lineColId)
      let view: UI.View | undefined

      if (current && map.has(current.hash)) {
        view = map.get(current.hash)
      }
      else {
        view = mapByLineCol.get(lineColId)
      }

      if (view) {
        focused = view
        newlyVisible.set(view.lineCol, view)
        const candidates: Map<LineColId, Set<HashId>> = new Map()
        for (const v of map.values()) {
          if (v.ancestorIds.includes(view.scopeId)) {
            let c = candidates.get(v.lineCol)
            if (!c) candidates.set(v.lineCol, c = new Set())
            c.add(v.hash)
            // newlyVisible.set(v.lineCol, v)
          }
        }
        // prefer those that are already visible
        for (const [lineCol, c] of candidates) {
          const current = visibleByLineCol.get(lineCol)?.hash
          if (current && c.has(current)) {
            newlyVisible.set(lineCol, map.get(current)!)
          }
        }
        // fallback to the latest candidate
        for (const [lineCol, c] of candidates) {
          if (!newlyVisible.has(lineCol)) {
            newlyVisible.set(lineCol, map.get([...c].at(-1)!)!)
          }
        }
      }
    }

    nextVisible.clear()

    const newlyVisibleAncestorIds = [...newlyVisible]
      .flatMap(([, c]) => c.ancestorIds)

    visibleByLineCol.forEach((view) => {
      if (!newlyVisible.has(view.lineCol)
        && map.has(view.hash)
        && (
          !focused
          || view.ancestorIds.some(id => newlyVisibleAncestorIds.includes(id))
        )
      ) {
        nextVisible.set(
          view.lineCol,
          map.get(view.hash)!
        )
      }
    })

    visibleByLineCol.forEach((view) => {
      if (!nextVisible.has(view.lineCol) && map.has(view.hash)) {
        nextVisible.set(view.lineCol, view)
      }
    })

    newlyVisible.forEach((view) => {
      nextVisible.set(view.lineCol, view)
    })

    const prevVisible = new Set(nextVisible.keys())
    map.forEach((view) => {
      if (!prevVisible.has(view.lineCol)) {
        nextVisible.set(view.lineCol, view)
      }
    })

    // console.log(nextVisible)

    const views = [...nextVisible.values()]
    const lines: UI.View[] = []

    const genViews = views
      .filter((view) => {
        const item = view.audio.emitterItem
        const isBlockExpression =
          view.node.type === AstNode.Type.Block
          && view.node.kind === AstNode.Block.Kind.Expression

        return (!isExternalSource(view.node) && isBlockExpression || (
          item.type === Emitter.Op.Type.Binary
          && item.info.returnValue.kind === Scope.Value.Scalar.Kind.Audio
          && item.info.astNode?.kind === AstNode.Op.Kind.Binary.AssignAdd
        )) && view.audio.floats
      })

    const rmsViews = views
      .filter((view) =>
        view.audio.floats
        && !isExternalSource(view.node)
      )
      .map((view) => ({
        ...view,
        node: { ...view.node, bottom: view.node.line }
      }))

    genViews
      .sort(UI.sortViews)
      .forEach((view) => {
        if (lines[view.node.line]) {
          lines[view.node.line].node.right = Math.min(
            lines[view.node.line].node.right,
            view.node.col
          )
        }
        lines[view.node.line] = view
      })

    return { genViews, rmsViews }
  }
}

// export function test() {
//   // @env browser

//   jest.setTimeout(10000000)

//   let common: {
//     binary: Uint8Array
//     memory: WebAssembly.Memory
//     vm: Vm
//   }

//   describe('ui', () => {
//     beforeEach(async () => {
//       const binary = await fetchVmBinary(false)
//       const memory = createMemory()
//       const vm = await initVm(binary, memory)
//       common = { binary, memory, vm }
//     })

//     it('getElevated', async () => {
//       const { vm } = common
//       const frontend = new Frontend(vm)

//       const source = {
//         code: String.raw`
//         pulse: { freq:= width:.85 (0 1) t 8* pick trig=
//           [saw freq              ]
//           [ramp freq offset:width] @ .5 * }
//         [pulse 135 \ width:.655 \]
//         [pulse 247 \ width:.630 \]
//       ` }
//       const tokens = [...tokenize(source)]
//       const info = frontend.setTokens(tokens)
//       const track = frontend.tracks[0]
//       const build = await track.build(info)

//       const ui = new UI(build)
//       const elevated = ui.getElevated()

//       expect(elevated.map((view) => UI.lineColOf(view)))
//         .toEqual([
//           '4:8', '2:10', '3:10', '5:8'
//         ])
//     })

//     it('getViews', async () => {
//       const { vm } = common
//       const frontend = new Frontend(vm)

//       const source = {
//         code: String.raw`
//         pulse: { freq:= width:.85 (0 1) t 8* pick trig=
//           [saw freq              ]
//           [ramp freq offset:width] @ .5 * }
//         [pulse 135 \ width:.655 \]
//         [pulse 247 \ width:.630 \]
//       ` }
//       const tokens = [...tokenize(source)]
//       const info = frontend.setTokens(tokens)
//       const track = frontend.tracks[0]
//       const build = await track.build(info)

//       const ui = new UI(build)

//       {
//         const views = ui.getViews('')
//         expect(views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )).toEqual([
//           "2:10.9",
//           "3:10.10",
//           "4:8.8",
//           "5:8.14"
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '4:8'
//         )
//         expect(views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )).toEqual([
//           "2:10.3", // changed
//           "3:10.4", // changed
//           "4:8.8", // <-- cursor pos
//           "5:8.14", // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '3:10'
//         )
//         expect(views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )).toEqual([
//           "2:10.3", // same
//           "3:10.4", // <-- cursor pos
//           "4:8.8", // same
//           "5:8.14", // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '2:10'
//         )
//         expect(views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )).toEqual([
//           "2:10.3", // <-- cursor pos
//           "3:10.4", // same
//           "4:8.8", // same
//           "5:8.14", // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '0:0'
//         )
//         expect(views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )).toEqual([
//           // cursor outside
//           "2:10.3", // same
//           "3:10.4", // same
//           "4:8.8", // same
//           "5:8.14", // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '5:8'
//         )
//         expect(views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )).toEqual([
//           "2:10.9", // changed
//           "3:10.10", // changed
//           "4:8.8", // same
//           "5:8.14", // <-- cursor pos
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '3:10'
//         )
//         expect(views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )).toEqual([
//           "2:10.9", // same
//           "3:10.10", // <-- cursor pos
//           "4:8.8", // same
//           "5:8.14", // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '0:0'
//         )
//         expect(views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )).toEqual([
//           // cursor outside
//           "2:10.9", // same
//           "3:10.10", // same
//           "4:8.8", // same
//           "5:8.14", // same
//         ])
//       }
//     })

//     it('getViews remove', async () => {
//       const { vm } = common
//       const frontend = new Frontend(vm)

//       let ui: UI

//       {
//         const source = {
//           code: String.raw`
//           pulse: { freq:= width:.85 (0 1) t 8* pick trig=
//             [saw freq              ]
//             [ramp freq offset:width] @ .5 * }
//           [pulse 135 \ width:.655 \]
//           [pulse 247 \ width:.630 \]
//         ` }
//         const tokens = [...tokenize(source)]
//         const info = frontend.setTokens(tokens)
//         const track = frontend.tracks[0]
//         const build = await track.build(info)

//         ui = new UI(build)

//         {
//           const views = ui.getViews('')
//           expect(views.genViews.map((view) =>
//             `${UI.hashOf(view.node, view.audio)}`
//           )).toEqual([
//             "2:12.9",
//             "3:12.10",
//             "4:10.8",
//             "5:10.14"
//           ])
//         }

//         ui.updateVisible()

//       }

//       {
//         const source = {
//           code: String.raw`
//           pulse: { freq:= width:.85 (0 1) t 8* pick trig=
//             ;[saw freq              ]
//             [ramp freq offset:width] @ .5 * }
//           [pulse 135 \ width:.655 \]
//           [pulse 247 \ width:.630 \]
//         ` }
//         const tokens = [...tokenize(source)]
//         const info = frontend.setTokens(tokens)
//         const track = frontend.tracks[0]
//         const build = await track.build(info)

//         ui.build = build

//         {
//           const views = ui.getViews('')
//           expect(views.genViews.map((view) =>
//             `${UI.hashOf(view.node, view.audio)}`
//           )).toEqual([
//             // "2:12.9",
//             "3:12.7",
//             "4:10.6",
//             "5:10.10"
//           ])
//         }

//         ui.updateVisible()
//       }

//       {
//         const source = {
//           code: String.raw`
//           pulse: { freq:= width:.85 (0 1) t 8* pick trig=
//             [saw freq              ]
//             [ramp freq offset:width] @ .5 * }
//           [pulse 135 \ width:.655 \]
//           [pulse 247 \ width:.630 \]
//         ` }
//         const tokens = [...tokenize(source)]
//         const info = frontend.setTokens(tokens)
//         const track = frontend.tracks[0]
//         const build = await track.build(info)

//         ui.build = build

//         {
//           const views = ui.getViews('')
//           expect(views.genViews.map((view) =>
//             `${UI.hashOf(view.node, view.audio)}`
//           )).toEqual([
//             "2:12.9",
//             "3:12.10",
//             "4:10.8",
//             "5:10.14"
//           ])
//         }

//         ui.updateVisible()
//       }
//     })

//     it('getViews depth 2', async () => {
//       const { vm } = common
//       const frontend = new Frontend(vm)

//       const source = {
//         code: String.raw`
//           pulse: { freq:= width:.85 (0 1) t 8* pick trig=
//             [saw freq              ]
//             [ramp freq offset:width] @ .5 * }
//           cowbell: {
//           [pulse 135 \ width:.435 \]
//           [pulse 247 \ width:.318 \]
//           }
//           [cowbell] @ LR              +=
//         ` }
//       const tokens = [...tokenize(source)]
//       const info = frontend.setTokens(tokens)
//       const track = frontend.tracks[0]
//       const build = await track.build(info)

//       const ui = new UI(build)

//       // const views = ui.getViews(false)
//       // console.log(views)

//       {
//         const views = ui.getViews('')
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           // baseline
//           '2:12.9',
//           '3:12.10',
//           '5:10.8',
//           '6:10.14',
//           '8:10.14',
//           '8:22.17',
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '5:10'
//         )
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           '2:12.3', // changed
//           '3:12.4', // changed
//           '5:10.8', // <-- cursor pos
//           '6:10.14', // same
//           '8:10.14', // same
//           '8:22.17', // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '3:12'
//         )
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           '2:12.3', // same
//           '3:12.4', // <-- cursor pos
//           '5:10.8', // same
//           '6:10.14', // same
//           '8:10.14', // same
//           '8:22.17', // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '111:111'
//         )
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           // cursor outside
//           '2:12.3', // same
//           '3:12.4', // same
//           '5:10.8', // same
//           '6:10.14', // same
//           '8:10.14', // same
//           '8:22.17', // same
//         ])
//       }
//     })

//     it('getViews depth 2 move up', async () => {
//       const { vm } = common
//       const frontend = new Frontend(vm)

//       const source = {
//         code: String.raw`
//           pulse: { freq:= width:.85 (0 1) t 8* pick trig=
//             [saw freq              ]
//             [ramp freq offset:width] @ .5 * }
//           cowbell: {
//           [pulse 135 \ width:.435 \]
//           [pulse 247 \ width:.318 \]
//           }
//           [cowbell] @ LR              +=
//         ` }
//       const tokens = [...tokenize(source)]
//       const info = frontend.setTokens(tokens)
//       const track = frontend.tracks[0]
//       const build = await track.build(info)

//       const ui = new UI(build)

//       {
//         const views = ui.getViews('')
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           // baseline
//           '2:12.9',
//           '3:12.10',
//           '5:10.8',
//           '6:10.14',
//           '8:10.14',
//           '8:22.17',
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '5:10'
//         )
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           '2:12.3', // changed
//           '3:12.4', // changed
//           '5:10.8', // <-- cursor pos
//           '6:10.14', // same
//           '8:10.14', // same
//           '8:22.17', // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '3:12'
//         )
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           '2:12.3', // same
//           '3:12.4', // <-- cursor pos
//           '5:10.8', // same
//           '6:10.14', // same
//           '8:10.14', // same
//           '8:22.17', // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews(
//           '8:10'
//         )
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           '2:12.3', // same
//           '3:12.4', // same
//           '5:10.8', // same
//           '6:10.14', // same
//           '8:10.14', // <-- cursor pos
//           '8:22.17', // same
//         ])
//       }
//     })

//     it('getViews depth 2 move to other', async () => {
//       const { vm } = common
//       const frontend = new Frontend(vm)

//       const source = {
//         code: String.raw`
//           [sin 123]
//           pulse: { freq:= width:.85 (0 1) t 8* pick trig=
//             [saw freq              ]
//             [ramp freq offset:width] @ .5 * }
//           cowbell: {
//           [pulse 135 \ width:.435 \]
//           [pulse 247 \ width:.318 \]
//           }
//           [cowbell] @ LR              +=
//         ` }
//       const tokens = [...tokenize(source)]
//       const info = frontend.setTokens(tokens)
//       const track = frontend.tracks[0]
//       const build = await track.build(info)

//       const ui = new UI(build)

//       {
//         const views = ui.getViews('')
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           // baseline
//           '1:10.3',
//           '3:12.10',
//           '4:12.11',
//           '6:10.9',
//           '7:10.15',
//           '9:10.15',
//           '9:22.19'
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews('6:10')
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           // baseline
//           '1:10.3', // same
//           '3:12.4', // changed
//           '4:12.5', // changed
//           '6:10.9', // <-- cursor pos
//           '7:10.15', // same
//           '9:10.15', // same
//           '9:22.19' // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews('4:12')
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           // baseline
//           '1:10.3', // same
//           '3:12.4', // same
//           '4:12.5', // <-- cursor pos
//           '6:10.9', // same
//           '7:10.15', // same
//           '9:10.15', // same
//           '9:22.19' // same
//         ])
//       }

//       ui.updateVisible()

//       {
//         const views = ui.getViews('1:10')
//         const actual = views.genViews.map((view) =>
//           `${UI.hashOf(view.node, view.audio)}`
//         )
//         expect(actual).toEqual([
//           // baseline
//           '1:10.3', // <-- cursor pos
//           '3:12.4', // same
//           '4:12.5', // same
//           '6:10.9', // same
//           '7:10.15', // same
//           '9:10.15', // same
//           '9:22.19' // same
//         ])
//       }
//     })
//   })
// }

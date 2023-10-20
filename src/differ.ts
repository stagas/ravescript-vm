export interface Diff<T> {
  equal: [T, T][]
  added: T[]
  moved: [T, T][]
  changed: [T, T][]
  removed: T[]
}

export function createDiffer<T>(): Diff<T> {
  const diff: Diff<T> = {
    equal: [],
    added: [],
    moved: [],
    changed: [],
    removed: [],
  }
  return diff
}

export function differ<T>(prev: Set<T>, next: Set<T>, allowChanged: boolean, mapFn: (el: T) => string, diff: Diff<T> = createDiffer<T>()): Diff<T> {
  const plist = [...prev]
  const nlist = [...next]

  const pm = createMap(plist, mapFn)
  const nm = createMap(nlist, mapFn)

  for (const p of [...prev]) {
    const pid = pm.rev.get(p)!
    const n = nm.map.get(pid)?.shift()
    if (n) {
      next.delete(n)
      prev.delete(p)

      const [pi, ni] = [plist.indexOf(p), nlist.indexOf(n)]
      if (pi !== ni) {
        diff.moved.push([p, n])
      }
      else {
        diff.equal.push([p, n])
      }
    }
  }

  outer: for (const n of [...next]) {
    if (allowChanged) for (const p of prev) {
      next.delete(n)
      prev.delete(p)
      diff.changed.push([p, n])
      continue outer
    }
    diff.added.push(n)
  }

  diff.removed.push(...prev)

  return diff
}

function createMap<T>(x: T[], mapFn: (el: T) => string) {
  const map = new Map<string, T[]>()
  const rev = new Map<T, string>()
  for (const node of x) {
    const id = mapFn(node)
    if (map.has(id)) {
      map.get(id)!.push(node)
    }
    else {
      map.set(id, [node])
    }
    rev.set(node, id)
  }
  return { map, rev }
}

export function test() {
  // @env browser

  const passing: [any, any, { [K in keyof Diff<any>]: (any | any[])[] }][] = [
    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'a' }, { v: 'b' }],
      {
        equal: [
          [{ v: 'a' }, { v: 'a' }],
          [{ v: 'b' }, { v: 'b' }],
        ],
        added: [],
        moved: [],
        changed: [],
        removed: [],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'b' }, { v: 'a' }],
      {
        equal: [],
        added: [],
        moved: [
          [{ v: 'a' }, { v: 'a' }],
          [{ v: 'b' }, { v: 'b' }],
        ],
        changed: [],
        removed: [],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'a' }, { v: 'b' }, { v: 'c' }],
      {
        equal: [
          [{ v: 'a' }, { v: 'a' }],
          [{ v: 'b' }, { v: 'b' }],
        ],
        added: [
          { v: 'c' }
        ],
        moved: [],
        changed: [],
        removed: [],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'a' }, { v: 'c' }],
      {
        equal: [
          [{ v: 'a' }, { v: 'a' }],
        ],
        added: [],
        moved: [],
        changed: [[{ v: 'b' }, { v: 'c' }]],
        removed: [],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'a' }, { v: 'c' }, { v: 'b' }],
      {
        equal: [
          [{ v: 'a' }, { v: 'a' }],
        ],
        added: [
          { v: 'c' }
        ],
        moved: [
          [{ v: 'b' }, { v: 'b' }],
        ],
        changed: [],
        removed: [],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'c' }, { v: 'a' }, { v: 'b' }],
      {
        equal: [],
        added: [
          { v: 'c' }
        ],
        moved: [
          [{ v: 'a' }, { v: 'a' }],
          [{ v: 'b' }, { v: 'b' }],
        ],
        changed: [],
        removed: [],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'c' }, { v: 'b' }, { v: 'a' }],
      {
        equal: [
          [{ v: 'b' }, { v: 'b' }],
        ],
        added: [
          { v: 'c' }
        ],
        moved: [
          [{ v: 'a' }, { v: 'a' }],
        ],
        changed: [],
        removed: [],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'b' }, { v: 'c' }, { v: 'a' }],
      {
        equal: [],
        added: [
          { v: 'c' }
        ],
        moved: [
          [{ v: 'a' }, { v: 'a' }],
          [{ v: 'b' }, { v: 'b' }],
        ],
        changed: [],
        removed: [],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'b' }, { v: 'c' }],
      {
        equal: [],
        added: [],
        moved: [
          [{ v: 'b' }, { v: 'b' }],
        ],
        changed: [
          [{ v: 'a' }, { v: 'c' }]
        ],
        removed: [],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'b' }],
      {
        equal: [],
        added: [],
        moved: [
          [{ v: 'b' }, { v: 'b' }],
        ],
        changed: [],
        removed: [
          { v: 'a' }
        ],
      }
    ],

    [
      [{ v: 'a' }, { v: 'b' }],
      [{ v: 'c' }],
      {
        equal: [],
        added: [],
        moved: [],
        changed: [
          [{ v: 'a' }, { v: 'c' }],
        ],
        removed: [
          { v: 'b' }
        ],
      }
    ],
  ]

  describe('compare', () => {
    it(`null == [sin 1]`, () => {
      const res = differ(new Set(), new Set(['a', 'b']), true, x => x as any)
      expect(res).toMatchObject({
        equal: [],
        added: ['a', 'b'],
        changed: [],
        removed: [],
      })
    })

    const mapper = ({ v }: any) => v
    passing.forEach(([a, b, expected]) => {
      it(`${a.map(mapper)} == ${b.map(mapper)}`, () => {
        const res = differ(new Set(a), new Set(b), true, mapper)
        expect(res).toMatchObject(expected)
      })
    })
  })
}

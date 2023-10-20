interface DataTypes {
  bool: boolean
  u8: number
  u16: number
  u32: number
  u64: bigint
  i8: number
  i16: number
  i32: number
  i64: bigint
  f32: number
  f64: number
  usize: number
}

interface TypedArrayTypes {
  bool: Uint8Array
  u8: Uint8Array
  u16: Uint16Array
  u32: Uint32Array
  u64: BigUint64Array
  i8: Int8Array
  i16: Int16Array
  i32: Int32Array
  i64: BigInt64Array
  f32: Float32Array
  f64: Float64Array
}

type SingleValue = keyof DataTypes

type TupleValue = [keyof DataTypes, number]

type StructCollectionDef<T extends SchemaDef> = [StructFactory<T>, number]

type SchemaDef<U extends string = string> = {
  [K in U]: SingleValue | TupleValue | StructFactory<any> | StructCollectionDef<any>
}

type StructView<T extends SchemaDef> = {
  [K in keyof T]: T[K] extends SingleValue
  ? DataTypes[T[K]]
  : T[K] extends TupleValue
  ? StructLinearView<T[K][0]>
  : T[K] extends StructFactory<infer U>
  ? StructView<U extends SchemaDef ? U : never>
  : T[K] extends StructCollectionDef<infer U> ? StructCollection<U>
  : never
} & StructViewData

interface StructViewData {
  dataView: DataView
  buffer: ArrayBuffer
  byteOffset: number
  byteLength: number
  littleEndian: boolean
}

type StructFactoryFn<T extends SchemaDef> = {
  (buffer: TypedArrayTypes[keyof TypedArrayTypes]): StructView<T>
  (buffer: DataView): StructView<T>
  (buffer: ArrayBuffer, byteOffset?: number): StructView<T>
}

type StructFactory<T extends SchemaDef> = StructFactoryFn<T> & { byteLength: number, type: StructView<T> }

class StructLinearView<T extends SingleValue, U = T extends 'i64' | 'u64' ? bigint : number> {
  byteLength: number
  elementSize: number
  methods: any

  constructor(
    public view: StructView<any>,
    public type: T,
    public fieldOffset: number,
    public length: number
  ) {
    this.byteLength = this.length * sizes[type]
    this.methods = methods[type]
    this.elementSize = sizes[type]
  }

  get byteOffset() {
    return this.view.byteOffset + this.fieldOffset
  }

  get(index: number, littleEndian: boolean = this.view.littleEndian): U {
    return this.methods[0].call(
      this.view.dataView,
      this.byteOffset + index * this.elementSize,
      littleEndian
    ) as U
  }

  set(index: number, value: U, littleEndian: boolean = this.view.littleEndian): void {
    this.methods[1].call(
      this.view.dataView,
      this.byteOffset + index * this.elementSize,
      value,
      littleEndian
    )
  }
}

class StructCollection<T extends SchemaDef> {
  byteLength: number
  instance: StructView<T>

  constructor(
    public view: StructView<any>,
    public factory: StructFactory<T>,
    public fieldOffset: number,
    public length: number
  ) {
    this.byteLength = length * factory.byteLength
    this.instance = this.factory(this.view.buffer, this.view.byteOffset + this.fieldOffset)
  }

  get byteOffset() {
    return this.view.byteOffset + this.fieldOffset
  }

  at(index: number) {
    this.instance.byteOffset = this.byteOffset + index * this.factory.byteLength
    return this.instance
  }

  get(index: number) {
    return this.factory(this.view.buffer, this.byteOffset + index * this.factory.byteLength)
  }
}

const sizes = {
  bool: 1,
  u8: 1,
  u16: 2,
  u32: 4,
  u64: 8,
  i8: 1,
  i16: 2,
  i32: 4,
  i64: 8,
  f32: 4,
  f64: 8,
  usize: 4,
}

const methods = {
  bool: [DataView.prototype.getUint8, DataView.prototype.setUint8],
  u8: [DataView.prototype.getUint8, DataView.prototype.setUint8],
  u16: [DataView.prototype.getUint16, DataView.prototype.setUint16],
  u32: [DataView.prototype.getUint32, DataView.prototype.setUint32],
  u64: [DataView.prototype.getBigUint64, DataView.prototype.setBigUint64],
  i8: [DataView.prototype.getInt8, DataView.prototype.setInt8],
  i16: [DataView.prototype.getInt16, DataView.prototype.setInt16],
  i32: [DataView.prototype.getInt32, DataView.prototype.setInt32],
  i64: [DataView.prototype.getBigInt64, DataView.prototype.setBigInt64],
  f32: [DataView.prototype.getFloat32, DataView.prototype.setFloat32],
  f64: [DataView.prototype.getFloat64, DataView.prototype.setFloat64],
  usize: [DataView.prototype.getUint32, DataView.prototype.setUint32],
} as const

function getSizeOf<T extends SchemaDef>(schema: T) {
  let byteLength = 0

  for (const type of Object.values(schema)) {
    if (typeof type === 'string') {
      byteLength += sizes[type]
    }
    else if (Array.isArray(type)) {
      const [subType, count] = type

      if (typeof subType === 'string') {
        byteLength += count * sizes[subType]
      }
      else {
        byteLength += count * subType.byteLength
      }
    }
    else {
      byteLength += type.byteLength
    }
  }

  return byteLength
}

export function defineStruct<T extends SchemaDef>(schema: T, littleEndian = true): StructFactory<T> {
  let byteLength = getSizeOf(schema)

  const factory: StructFactoryFn<T> = (buffer, byteOffset?: number) => {
    let arrayBuffer: ArrayBuffer
    let dataView: DataView | undefined

    if (buffer instanceof ArrayBuffer || buffer instanceof SharedArrayBuffer) {
      arrayBuffer = buffer
    }
    else {
      arrayBuffer = buffer.buffer

      if (buffer instanceof DataView) {
        byteOffset = buffer.byteOffset
        dataView = new DataView(arrayBuffer)
      }
      else {
        byteOffset = buffer.byteOffset
      }
    }

    byteOffset ??= 0

    if (!dataView) dataView = new DataView(arrayBuffer)

    const structViewData: StructViewData = {
      buffer: arrayBuffer,
      dataView,
      byteOffset,
      byteLength,
      littleEndian
    }

    const structView: StructView<T> = structViewData as StructView<T>

    // We normalize byteOffset to 0 for the field offsets because we pull it again
    // dynamically using structView.byteOffset. This allows the struct view to move to a different
    // offset without having to create a new instance.
    byteOffset = 0

    const entries: [string, PropertyDescriptor][] = []

    for (const [key, type] of Object.entries(schema)) {
      let desc: PropertyDescriptor

      if (typeof type === 'string') {
        const m = methods[type] as [typeof DataView.prototype.getUint32, typeof DataView.prototype.setUint32]
        const fieldOffset = byteOffset
        desc = {
          get(): number {
            return m[0].call(dataView, structView.byteOffset + fieldOffset, structView.littleEndian)
          },
          set(value: number) {
            m[1].call(dataView, structView.byteOffset + fieldOffset, value, structView.littleEndian)
          }
        }

        byteOffset += sizes[type]
      }
      else if (Array.isArray(type)) {
        if (typeof type[0] === 'string') {
          const fieldOffset = byteOffset
          desc = {
            value: new StructLinearView(
              structView,
              type[0],
              fieldOffset,
              type[1]
            )
          }
          byteOffset += desc.value.byteLength
        }
        else {
          const fieldOffset = byteOffset
          const value = new StructCollection(
            structView,
            type[0],
            fieldOffset,
            type[1]
          )
          desc = { value }
          byteOffset += value.byteLength
        }
      }
      else {
        const fieldOffset = byteOffset
        const value = type(arrayBuffer, fieldOffset)
        desc = { value }
        byteOffset += value.byteLength
      }

      entries.push([key, desc])
    }

    Object.defineProperties(structView, Object.fromEntries(entries))

    return structView
  }

  return Object.assign(factory, { byteLength, type: {} as any })
}

export function test_struct() {
  // @env browser
  describe('defineStruct', () => {
    it('plain struct', () => {
      const Foo = defineStruct({
        u8: 'u8',
        f32_4: ['f32', 4],
      })
      const buffer = new Uint8Array(128)
      const data = new DataView(buffer.buffer, 1)
      const foo = Foo(buffer)
      foo.u8 = 42
      foo.f32_4.set(0, 1)
      foo.f32_4.set(1, 2)
      foo.f32_4.set(2, 3)
      expect(buffer[0]).toEqual(42)
      expect(foo.u8).toEqual(42)
      expect(data.getFloat32(0, true)).toEqual(1)
      expect(data.getFloat32(4, true)).toEqual(2)
      expect(data.getFloat32(8, true)).toEqual(3)
      expect(foo.f32_4.get(0)).toEqual(1)
      expect(foo.f32_4.get(1)).toEqual(2)
      expect(foo.f32_4.get(2)).toEqual(3)
    })

    fit('nested struct', () => {
      const Bar = defineStruct({
        u32: 'u32',
        u8: ['u8', 2],
        f64_2: ['f64', 2],
      })

      const Foo = defineStruct({
        u8: 'u8',
        f64: 'f64',
        f32_4: ['f32', 4],
        bar: Bar,
        many: [Bar, 2]
      })

      const buffer = new Uint8Array(128)
      const data = new DataView(buffer.buffer)

      const foo = Foo(buffer)
      foo.bar.u32 = 42
      foo.many.at(0).u32 = 42
      foo.many.at(1).u32 = 42
      foo.f64 = 1.234

      expect(foo.f64).toEqual(1.234)
      expect(foo.bar.u32).toEqual(42)
      expect(data.getUint32(foo.bar.byteOffset, true)).toEqual(42)
      expect(data.getUint32(foo.many.byteOffset, true)).toEqual(42)
      expect(data.getUint32(foo.many.byteOffset + foo.many.factory.byteLength, true)).toEqual(42)
      expect(data.getFloat64(foo.byteOffset + 1, true)).toEqual(1.234)
    })
  })

  xdescribe('uint32 or dataview', () => {
    it('compare Uint8', async () => {
      const length = 2048
      const a = new Uint8Array(length)
      const b = new DataView(a.buffer)
      const count = 500_000_000
      for (let z = 0; z < 5; z++) {
        console.time('Uint8Array')
        {
          let val = 0
          for (let i = 0; i < count; i++) {
            val += a[i % length]!
          }
        }
        console.timeEnd('Uint8Array')
        await Promise.resolve()
        console.time('DataView')
        {
          let val = 0
          for (let i = 0; i < count; i++) {
            val += b.getUint8(i % length)
          }
        }
        console.timeEnd('DataView')
        await Promise.resolve()
      }
    })

    it('compare Uint32', async () => {
      const length = 2048
      const length32 = 2048 << 2
      const a = new Uint32Array(length)
      const b = new DataView(a.buffer)
      const count = 500_000_000
      const count32 = count << 2
      for (let z = 0; z < 10; z++) {
        console.time('Uint32Array')
        {
          let val = 0
          for (let i = 0; i < count; i++) {
            val += a[i % length]!
          }
        }
        console.timeEnd('Uint32Array')
        await Promise.resolve()
        console.time('DataView')
        {
          let val = 0
          for (let i = 0; i < count32; i += 4) {
            val += b.getUint32(i % length32, true)
          }
        }
        console.timeEnd('DataView')
        await Promise.resolve()
      }
    })

    it('setters Uint32Array', async () => {
      const length = 2048
      const a = new Uint32Array(length)
      const count = 500_000_000
      for (let z = 0; z < 5; z++) {
        console.time('set Uint32Array')
        {
          for (let i = 0; i < count; i++) {
            a[i % length] = i
          }
        }
        console.timeEnd('set Uint32Array')
        await Promise.resolve()
      }

      for (let z = 0; z < 5; z++) {
        console.time('get Uint32Array')
        {
          let val = 0
          for (let i = 0; i < count; i++) {
            val += a[i % length]!
          }
        }
        console.timeEnd('get Uint32Array')
        await Promise.resolve()
      }
    })

    it('setters DataView Uint32', async () => {
      const length = 2048
      const length32 = length << 2
      const a = new DataView(new Uint32Array(length).buffer)
      const count = 500_000_000
      const count32 = count << 2
      for (let z = 0; z < 10; z++) {
        console.time('set Uint32')
        {
          for (let i = 0; i < count32; i += 4) {
            a.setUint32(i % length32, i, true)
          }
        }
        console.timeEnd('set Uint32')
        await Promise.resolve()
      }

      for (let z = 0; z < 10; z++) {
        console.time('get Uint32')
        {
          let val = 0
          for (let i = 0; i < count32; i += 4) {
            val += a.getUint32(i % length32, true)
          }
        }
        console.timeEnd('get Uint32')
        await Promise.resolve()
      }
    })
  })
}

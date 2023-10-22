import { envLookupMethod } from './env-info.ts'
import { Block, Frontend } from './frontend.ts'
import { Emitter } from './lang/index.ts'
import { capitalize } from './util.ts'

export interface GenInfo {
  kind: string
  ptr: number
  out: Block | null
  mem: Float32Array
  initial: Float32Array
}

export class GenRuntime {
  ptr: number
  mem: Uint32Array
  memf32: Float32Array
  initial: Float32Array
  memLength: number
  floats?: Float32Array

  constructor(
    private frontend: Frontend,
    public gen: Emitter.Gen,
    public out: Block | null
  ) {
    const { vm, engine, gensFree, gensUsed, initials } = frontend
    // console.log('create', this.kind, gensFree?.[this.kind]?.length, gensUsed?.[this.kind]?.length)
    this.ptr = vm.instance[`gen_${this.kind}_constructor`](0, engine)
    this.getFloats()
    this.saveInitial()
    this.initial = initials[this.kind]!
    this.memLength = this.initial.length
    this.mem = vm.view.getU32(this.ptr, this.memLength)
    this.memf32 = vm.view.getF32(this.ptr, this.memLength)
    gensUsed[this.kind]!.push(this)
    gen.runtime = this
  }

  get kind() {
    return this.gen.kind
  }

  getFloats() {
    const { frontend, kind } = this
    const { vm } = frontend

    const getFloats = envLookupMethod(kind, 'get__floats')
    if (getFloats && getFloats in vm.instance) {
      const floatsPtr = vm.instance[getFloats](this.ptr)
      this.floats = vm.view.getF32(floatsPtr, 1 << 16)
    }
  }

  saveInitial() {
    const { frontend, kind } = this
    const { vm, engine, gensFree, gensUsed, initials } = frontend

    const getObjectSize = `util_getObjectSize__gen_${this.kind}_${capitalize(kind)}_`
    const cloneI32 = `util_cloneI32`

    // first time creating this generator kind
    if (!(kind in gensUsed)) {
      // store initial object memory
      const size = vm.instance[getObjectSize]()
      const length = size >> 2
      const ptr = vm.instance[cloneI32](this.ptr, size)
      initials[kind] = vm.view.getF32(ptr, length)
      // console.log(kind, initials[kind])

      // create pool
      gensFree[kind] = []
      gensUsed[kind] = []
    }

  }

  getId() {
    const getId = envLookupMethod(this.kind, 'get_id')!
    return getId ? this.frontend.vm.instance[getId](this.ptr) as number : null
  }

  copyInto(other: GenRuntime) {
    other.mem.set(this.mem)
  }

  reset() {
    this.memf32.set(this.initial)
  }

  toJSON(): GenInfo {
    return {
      kind: this.kind,
      ptr: this.ptr,
      out: this.out,
      mem: this.memf32,
      initial: this.initial,
    }
  }
}

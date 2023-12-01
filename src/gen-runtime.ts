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
    const { kind } = this

    // console.log('create', this.kind, gensFree?.[this.kind]?.length, gensUsed?.[this.kind]?.length)
    this.ptr = vm.instance[`gen_${kind}_constructor`](0, engine)
    this.getFloats()
    // this.saveInitial()

    // TODO: currently we copy the initial for every instance, because of
    // certain gens that have pointers to buffers etc. If we somehow could compact
    // these or maybe maintain a list of which kinds need this separate getInitial,
    // then we could avoid this. But usually it's not a lot of memory, so it's fine.
    this.initial = this.getInitial()

    this.memLength = this.initial.length
    this.mem = vm.view.getU32(this.ptr, this.memLength)
    this.memf32 = vm.view.getF32(this.ptr, this.memLength)

    if (!(kind in gensUsed)) {
      // create pool
      gensFree[kind] = []
      gensUsed[kind] = [this]
    }
    else {
      gensUsed[kind].push(this)
    }

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
      // TODO: variable length? now it's DELAY_MAX_SIZE
      this.floats = vm.view.getF32(floatsPtr, 1 << 16)
    }
  }

  getInitial() {
    const { frontend, kind } = this
    const { vm } = frontend

    const getObjectSize = `util_getObjectSize__gen_${this.kind}_${capitalize(kind)}_`
    const cloneI32 = `util_cloneI32`

    // store initial object memory
    const size = vm.instance[getObjectSize]()
    const length = size >> 2
    const ptr = vm.instance[cloneI32](this.ptr, size)
    return vm.view.getF32(ptr, length)
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
    console.log('RESET...', this.kind)
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

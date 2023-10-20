// export type MemoryView = ReturnType<typeof getMemoryView>

export interface MemoryView {
  memory: WebAssembly.Memory
  buffer: ArrayBuffer
  data: DataView
  heapU8: Uint8Array
  heapU16: Uint16Array
  heapU32: Uint32Array
  heapF32: Float32Array
  heapF64: Float64Array
  getU8: (ptr: number, length: number) => Uint8Array
  getU32: (ptr: number, length: number) => Uint32Array
  getF32: (ptr: number, length: number) => Float32Array
  getF64: (ptr: number, length: number) => Float64Array
  setF32: (ptr: number, offset: number, value: number) => void
  setF64: (ptr: number, offset: number, value: number) => void
  readTypedArray: (constructor: Float32ArrayConstructor, ptr: number) => Float32Array | null
  readString: (pointer: number) => string | null
}

export function getMemoryView(memory: WebAssembly.Memory): MemoryView {
  const { buffer } = memory

  const data = new DataView(buffer)
  const heapU8 = new Uint8Array(buffer)
  const heapU16 = new Uint16Array(buffer)
  const heapU32 = new Uint32Array(buffer)
  const heapF32 = new Float32Array(buffer)
  const heapF64 = new Float64Array(buffer)

  function getU32LE(pointer: number) {
    return data.getUint32(pointer, true)
  }

  function getF32(ptr: number, length: number) {
    const address = ptr >> 2
    return heapF32.subarray(address, address + length)
  }

  function getF64(ptr: number, length: number) {
    const address = ptr >> 3
    return heapF64.subarray(address, address + length)
  }

  function getU8(ptr: number, length: number) {
    const address = ptr >> 2
    return heapU8.subarray(address, address + length)
  }

  function getU32(ptr: number, length: number) {
    const address = ptr >> 2
    return heapU32.subarray(address, address + length)
  }

  function setF32(ptr: number, offset: number, value: number) {
    const address = (ptr >> 2) + offset
    heapF32[address] = value
  }

  function setF64(ptr: number, offset: number, value: number) {
    const address = (ptr >> 3) + offset
    heapF64[address] = value
  }

  function readString(pointer: number) {
    if (!pointer) return null

    const end = pointer + heapU32[pointer - 4 >>> 2] >>> 1
    let start = pointer >>> 1
    let string = ''

    while (end - start > 1024) {
      string += String.fromCharCode(
        ...heapU16.subarray(
          start,
          start += 1024
        )
      )
    }

    return string + String.fromCharCode(
      ...heapU16.subarray(
        start,
        end
      )
    )
  }

  function readTypedArray(constructor: Float32ArrayConstructor, ptr: number) {
    if (!ptr) return null

    return new constructor(
      memory.buffer,
      heapU32[ptr + 4],
      getU32LE(ptr + 8) / constructor.BYTES_PER_ELEMENT
    )
  }

  return {
    memory,
    buffer,
    data,
    heapU8,
    heapU16,
    heapU32,
    heapF32,
    heapF64,
    getU8,
    getU32,
    getF32,
    getF64,
    setF32,
    setF64,
    readTypedArray,
    readString,
  }
}

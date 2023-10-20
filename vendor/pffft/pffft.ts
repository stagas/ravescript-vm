import pffft from '../../dist/wasm/pffft.js'

// dist/pffft.js header we copy it manually after every make of the pffft lib

// var pffft = (() => {
//   const self = globalThis
//   class URL {}
//   self.location ??= {}
//   var _scriptDir = '-' //import.meta.url;

//   return (
// function(moduleArg = {}) {
//   // console.warn(moduleArg)

type Resolved<T> = T extends Promise<infer U> ? U : never

export type Pffft = ReturnType<Resolved<ReturnType<typeof initPffft>>['create']>

export async function fetchPffftBinary() {
  const filename = '../../dist/wasm/pffft.wasm'
  const url = new URL(filename, import.meta.url).href
  const res = await fetch(url)
  const buffer = await res.arrayBuffer()
  const binary = new Uint8Array(new SharedArrayBuffer(buffer.byteLength))
  binary.set(new Uint8Array(buffer))
  return binary
}

export async function initPffft(
  binary: Uint8Array,
  memory: WebAssembly.Memory,
) {
  const Module: any = await pffft({
    wasmBinary: binary.buffer,
    wasmMemory: memory,
  })

  function createBlock(blockSize: number) {
    return new Float32Array(
      Module.HEAPF32.buffer,
      Module._malloc(blockSize * Float32Array.BYTES_PER_ELEMENT),
      blockSize
    )
  }

  return {
    exports: {
      pffft_forward: Module._pffft_runner_forward,
      pffft_inverse: Module._pffft_runner_inverse,
      pffft_magnitudes: Module._pffft_runner_magnitudes,
      pffft_free: Module._pffft_runner_free,
      pffft_destroy: Module._pffft_runner_destroy,
    },
    create(blockSize: number) {
      const fftSize = blockSize >> 1
      const runner: number = Module._pffft_runner_new(
        blockSize,
        Float32Array.BYTES_PER_ELEMENT
      )
      const fft = createBlock(fftSize)
      const mags = createBlock(fftSize)
      const cosSin = new Float64Array(blockSize)
      for (let k = 0, x, p, cos, sin; k < fftSize; k++) {
        x = (Math.min(1, k / (fftSize / 2 - 1)) ** .5) * Math.PI
        p = k * 2
        cos = Math.cos(x)
        sin = Math.sin(x)
        cosSin[p] = cos
        cosSin[p + 1] = sin
      }
      return {
        blockSize,
        fftSize,
        runner,
        fft,
        mags,
        cosSin,
        forward(audio: Float32Array, fft: Float32Array) {
          Module._pffft_runner_forward(runner, audio.byteOffset, fft.byteOffset)
        },
        inverse(fft: Float32Array, audio: Float32Array) {
          Module._pffft_runner_inverse(runner, fft.byteOffset, audio.byteOffset)
        },
        magnitudes(fft: Float32Array, mags: Float32Array) {
          Module._pffft_runner_magnitudes(runner, fft.byteOffset, mags.byteOffset)
        },
        destroy() {
          Module._pffft_runner_destroy(runner)
        },
      }
    },
    createBlock,
    freeBlock(block: Float32Array) {
      Module._free(block.byteOffset)
    },
  }
}

export function test() {
  // @env browser
  describe('pffft', () => {
    it('works', async () => {
      const binary = await fetchPffftBinary()
      const pffft = await initPffft(binary, new WebAssembly.Memory({
        initial: 3000,
        maximum: 3000,
        shared: true
      }))
      const fft: Pffft = pffft.create(2048)
      expect(fft.blockSize).toEqual(2048)
      expect(fft.fftSize).toEqual(1024)
    })
  })
}

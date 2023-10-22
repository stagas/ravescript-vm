import type { instantiate as vmInstantiate } from '../dist/wasm/vm-dev.d.ts'
import { Pffft, initPffft } from '../vendor/pffft/pffft.ts'
import { FFT_BLOCK_SIZE_FREQ_DOMAIN, FFT_BLOCK_SIZE_TIME_DOMAIN } from './constants.ts'
import { VM_MEM_PAGES } from './constants.ts'
import { envTypes } from './env-types.ts'
import { Module } from './lang/compiler.ts'
import { getMemoryView } from './memory-view.ts'
import { wasmSourceMap } from './wasm-sourcemap.ts'
import { Resolved } from './util.ts'

export type VmInstance = Resolved<ReturnType<typeof vmInstantiate>> & Record<string, any>
export type VmExports = { [K in keyof typeof envTypes]: (...args: any[]) => any }
export type Vm = Resolved<ReturnType<typeof initVm>>
export interface VmInit {
  memory: WebAssembly.Memory
  vmBinary: Uint8Array
  pffftBinary: Uint8Array
  pffftRunners?: {
    timeFFT: number
    freqFFT: number
  },
  resetCtrlById?: (id: number) => void
}

export async function fetchVmBinary(dev = location.href.includes('test')) {
  const filename = 'vm-' + (dev ? 'dev.wasm' : 'prod.wasm')

  const binaryRes = await fetch(
    new URL('../dist/wasm/' + filename, import.meta.url).href
  )

  let buffer = await binaryRes.arrayBuffer()

  if (dev) {
    const absoluteUrl = new URL('../dist/wasm/' + filename + '.map', import.meta.url).href
    buffer = wasmSourceMap.setSourceMapURL(buffer, absoluteUrl)
  }

  const binary = new Uint8Array(
    new SharedArrayBuffer(buffer.byteLength)
  )

  binary.set(new Uint8Array(buffer))

  return binary
}

function setCtrlInstanceAt(instance: Module.Instance, table: WebAssembly.Table, index: number) {
  table.set(index + 0, instance.exports.run)
  table.set(index + 1, instance.exports.update_gens)
}

export async function initVm({
  memory,
  vmBinary,
  pffftBinary,
  pffftRunners,
  resetCtrlById,
}: VmInit) {
  const pffft = await initPffft(pffftBinary, memory)

  let timeFFT: Pffft | undefined
  let freqFFT: Pffft | undefined

  let timeFFTRunner: number
  let freqFFTRunner: number
  if (pffftRunners) {
    timeFFTRunner = pffftRunners.timeFFT
    freqFFTRunner = pffftRunners.freqFFT
  }
  else {
    timeFFT = pffft.create(FFT_BLOCK_SIZE_TIME_DOMAIN)
    freqFFT = pffft.create(FFT_BLOCK_SIZE_FREQ_DOMAIN)
    timeFFTRunner = timeFFT.runner
    freqFFTRunner = freqFFT.runner
  }

  const view = getMemoryView(memory)

  function abort(messagePtr: number, filenamePtr: number, line: number, col: number) {
    const message = view.readString(messagePtr >>> 0)
    const filename = view.readString(filenamePtr >>> 0)
    line = line >>> 0
    col = col >>> 0
    throw Error(`${message} in ${filename}:${line}:${col}`)
  }

  const table: WebAssembly.Table = new WebAssembly.Table({
    element: 'anyfunc',
    initial: 128,
    maximum: 128
  })

  const ctrlInstances: Map<number, Module.Instance> = new Map()

  const wasm = await WebAssembly.instantiate(
    vmBinary,
    {
      env: {
        memory,
        table,
        abort,
        logi: console.log,
        logf: console.log,
        logd: console.log,
        timeFFT: timeFFTRunner,
        freqFFT: freqFFTRunner,
        ...pffft.exports,
        setCtrlInstanceAt: (instanceId: number, tableIndex: number) => {
          const instance = ctrlInstances.get(instanceId)
          if (instance == null) {
            throw new Error('Not instantiated: ' + instanceId)
          }
          setCtrlInstanceAt(instance, table, tableIndex)
        },
        resetCtrlInstance: (instanceId: number) => {
          resetCtrlById?.(instanceId)
        }
      }
    }
  )

  const instance = wasm.instance.exports as VmInstance

  const exports = Object.fromEntries(
    Object.entries(envTypes)
      .map(([k]) =>
        [k, instance[k]]
      )
  ) as VmExports

  return {
    view,
    table,
    instance,
    exports,
    ctrlInstances,
    pffft,
    timeFFT,
    freqFFT,
  }
}

export function createVmMemory() {
  return new WebAssembly.Memory({
    initial: VM_MEM_PAGES,
    maximum: VM_MEM_PAGES,
    shared: true
  })
}

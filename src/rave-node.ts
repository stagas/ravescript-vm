import { Agent, Alice } from 'alice-bob'
import { Deferred } from 'utils'
import { fetchPffftBinary } from '../vendor/pffft/pffft.ts'
import { Backend, BackendInit } from './backend.ts'
import { Frontend } from './frontend.ts'
import { Vm, VmInit, createVmMemory, fetchVmBinary, initVm } from './vm.ts'

// import { DEBUG } from '../../web/constants'
const DEBUG = false
const DEV = !location.href.includes('?prod')

export enum RaveNodeState {
  Idle,
  Running,
  Pausing,
  Paused,
  Stopped,
}

export interface RaveNodeInit extends AudioWorkletNodeOptions {
  vmMemory?: WebAssembly.Memory
  fetchSample: (sampleId: number) => Promise<Float32Array[]>
}

export interface RaveNodeOptions extends RaveNodeInit {
  vm: Vm
  vmMemory: WebAssembly.Memory
  frontend: Frontend
}

export class RaveNode extends AudioWorkletNode {
  static registered: Set<BaseAudioContext> = new Set()
  static vmBinary: Uint8Array
  static pffftBinary: Uint8Array
  static processorOptions: BackendInit

  static async register(context: BaseAudioContext) {
    if (this.registered.has(context)) return
    const moduleURL = new URL('./rave-processor.js', import.meta.url).href
    const [vmBinary, pffftBinary] = await Promise.all([
      this.vmBinary ? Promise.resolve(this.vmBinary) : fetchVmBinary(DEV),
      this.pffftBinary ? Promise.resolve(this.pffftBinary) : fetchPffftBinary(),
      context.audioWorklet.addModule(moduleURL)
    ])
    this.vmBinary = vmBinary
    this.pffftBinary = pffftBinary
    this.registered.add(context)
  }

  static async instantiate(
    context: BaseAudioContext,
    options: RaveNodeInit
  ) {
    options.vmMemory ??= createVmMemory()
    await this.register(context)
    const vmInit: VmInit = {
      vmBinary: this.vmBinary,
      pffftBinary: this.pffftBinary,
      memory: options.vmMemory,
    }
    const vm: Vm = await initVm(vmInit)
    const frontend = new Frontend(vm, context.sampleRate)
    const processorOptions: BackendInit = this.processorOptions = {
      vmInit,
      // vmInit: {
      //   ...vmInit,
      //   pffftRunners: {
      //     timeFFT: vm.timeFFT!.runner,
      //     freqFFT: vm.freqFFT!.runner,
      //   }
      // },
      buffers: frontend.buffers,
      runner: true
    }
    const node = new this(context, {
      fetchSample: options.fetchSample,
      vmMemory: options.vmMemory,
      frontend,
      vm,
      processorOptions,
    })
    await node.ready.promise
    return node
  }

  ready = Deferred<void>()
  state: RaveNodeState = RaveNodeState.Idle
  frontend: Frontend
  worklet: Agent<Backend, RaveNode>

  constructor(context: BaseAudioContext, public options: RaveNodeOptions) {
    super(context, 'rave', {
      ...options,
      numberOfInputs: 1,
      numberOfOutputs: 1,
      outputChannelCount: [2],
      channelCount: 2
    })

    this.frontend = options.frontend
    this.frontend.debug = DEBUG

    const [node, worklet] = new Alice<RaveNode, Backend>(
      data => void this.port.postMessage(data),
      this
    ).agents({ debug: false })
    this.worklet = worklet
    this.port.onmessage = ({ data }) => node.receive(data)
  }

  get clock() {
    return this.frontend.clock
  }

  async onProcessorReady() {
    await this.worklet.setMain(this.frontend.main!.payload)
    this.ready.resolve()
  }

  async start() {
    if (this.state === RaveNodeState.Running) return
    this.state = RaveNodeState.Running
    await this.worklet.start()
  }

  async stop() {
    if (
      this.state === RaveNodeState.Idle
      || this.state === RaveNodeState.Stopped
    ) return

    if (
      this.state === RaveNodeState.Pausing
      || this.state === RaveNodeState.Paused
    ) {
      this.state = RaveNodeState.Stopped
      this.reset()
      return
    }

    this.state = RaveNodeState.Pausing

    await this.worklet.stop()
    this.frontend.clock.ringPos = 0

    if (this.state === RaveNodeState.Pausing) {
      this.state = RaveNodeState.Paused
    }
  }

  async reset() {
    await this.worklet.reset()
  }
}

export async function test_rave_node() {
  // @env browser
  describe('RaveNode', () => {

    it('works', async () => {
      const ctx = new AudioContext()
      await RaveNode.register(ctx)
      const rave = await RaveNode.instantiate(ctx, {
        fetchSample: () => { return Promise.resolve([new Float32Array()]) }
      })
      expect(rave).toBeInstanceOf(AudioWorkletNode)
    })

    it('can produce output', async () => {
      const ctx = new OfflineAudioContext(1, 2048, 44100)
      await RaveNode.register(ctx)
      const rave = await RaveNode.instantiate(ctx, {
        fetchSample: () => { return Promise.resolve([new Float32Array()]) }
      })
      const source = { code: `42 LR+=` }
      rave.connect(ctx.destination)

      const { frontend } = rave
      rave.frontend.tokenize(source)
      const tokens = Array.from(frontend.tokenize(source))
      const info = frontend.produce(tokens)
      const sound = frontend.compile(info)

      await rave.worklet.setBarAt([0], [sound.payload])

      await rave.start()

      const buffer = await ctx.startRendering()
      const data = buffer.getChannelData(0)
      expect(data[128]).toEqual(42)
    })
  })
}

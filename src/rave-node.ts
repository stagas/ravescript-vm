import { Agent, Alice } from 'alice-bob'
import { Deferred, objectDiff, timeout } from 'utils'
import { fetchPffftBinary } from '../vendor/pffft/pffft.ts'
import { Backend, BackendInit } from './backend.ts'
import { Build, Frontend } from './frontend.ts'
import { Vm, VmInit, createVmMemory, fetchVmBinary, initVm } from './vm.ts'

// import { DEBUG } from '../../web/constants'
const DEBUG = true
const DEV = Boolean(location.port && !location.href.includes('?prod'))

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
    const frontend = new Frontend(
      'live',
      vm,
      0,
      0,
      true,
      context.sampleRate
    )
    const processorOptions: BackendInit = this.processorOptions = {
      vmInit,
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
  worklet: Agent<Backend, RaveNode>
  frontend: Frontend

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

    // this.backend = new Backend(options.vm, options.processorOptions.buffers, true)

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
    // await this.worklet.setMain(this.frontend.main!.payload)
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

  sentPayloads: Record<number, Build.Payload> = {}
  async sync(payloads: Record<number, Build.Payload>) {
    // const payloads = this.frontend.vmRunner!.getPayloads()
    const diff = objectDiff(this.sentPayloads, payloads)
    const toSend = Object.assign(diff.created, diff.updated)
    if (Object.keys(toSend).length) {
      Object.assign(this.sentPayloads, toSend)
      for (const k in diff.deleted) {
        delete this.sentPayloads[k]
      }
      await this.worklet.putPayloads(toSend)
      // There is a case of replacing just what is about to change
      // even though the payloads have been sent, they've been blocked
      // but somehow we return? Anyhow, this is probably fixing it.
      await timeout(10)
      console.log('SENT', [...Object.values(toSend)].map(x => x.instanceId))
    }
  }
}

// export async function test_rave_node() {
//   // @env browser
//   describe('RaveNode', () => {
//     it('works', async () => {
//       const ctx = new AudioContext()
//       await RaveNode.register(ctx)
//       const rave = await RaveNode.instantiate(ctx, {
//         fetchSample: () => { return Promise.resolve([new Float32Array()]) }
//       })
//       expect(rave).toBeInstanceOf(AudioWorkletNode)
//     })
//     it('can produce output', async () => {
//       const ctx = new OfflineAudioContext(1, 2048, 44100)
//       await RaveNode.register(ctx)
//       const rave = await RaveNode.instantiate(ctx, {
//         fetchSample: () => { return Promise.resolve([new Float32Array()]) }
//       })
//       rave.connect(ctx.destination)

//       const { frontend } = rave
//       frontend.debug = false
//       const runner = frontend.vmRunner!

//       const mainBuild = frontend.make({ code: 'LR L= LR R=' }, true)
//       const main = runner.vmCtrls[0]
//       await main.setPayload(mainBuild.payload)

//       const build = frontend.make({ code: `42 LR+=` })
//       const ctrl = runner.vmCtrls[1]
//       await ctrl.setPayload(build.payload)

//       const bar = runner.vmBars[0]
//       runner.setBar(0, bar)
//       bar.setMain(main)
//       bar.addTrack(ctrl)

//       await rave.sync()
//       expect(Object.keys(rave.sentPayloads).map(Number))
//         .toEqual([main.ptr, ctrl.ptr])

//       await rave.start()
//       const buffer = await ctx.startRendering()
//       const data = buffer.getChannelData(0)
//       expect(data[128]).toEqual(42)
//     })
//     it('[saw] (wavetable core) works', async () => {
//       const ctx = new OfflineAudioContext(1, 2048, 44100)
//       await RaveNode.register(ctx)
//       const rave = await RaveNode.instantiate(ctx, {
//         fetchSample: () => { return Promise.resolve([new Float32Array()]) }
//       })
//       rave.connect(ctx.destination)

//       const { frontend } = rave
//       frontend.debug = false
//       const runner = frontend.vmRunner!

//       const mainBuild = frontend.make({ code: 'LR L= LR R=' }, true)
//       const main = runner.vmCtrls[0]
//       await main.setPayload(mainBuild.payload)

//       const build = frontend.make({ code: `[saw 330] LR+=` })
//       const ctrl = runner.vmCtrls[1]
//       await ctrl.setPayload(build.payload)

//       const bar = runner.vmBars[0]
//       runner.setBar(0, bar)
//       bar.setMain(main)
//       bar.addTrack(ctrl)

//       await rave.sync()
//       expect(Object.keys(rave.sentPayloads).map(Number))
//         .toEqual([main.ptr, ctrl.ptr])

//       await rave.start()
//       const buffer = await ctx.startRendering()
//       const data = buffer.getChannelData(0)
//       expect(data.slice(128, 132).join()).toEqual([
//         -0.724669337272644,
//         -0.8175374269485474,
//         -0.9525049328804016,
//         -0.9910984039306641
//       ].join())
//     })
//   })
// }

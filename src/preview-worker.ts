import { Agent, Bob } from 'alice-bob'
import { checksum } from 'utils'
import { Backend, BackendInit, Buffers, resetCtrlById } from './backend.ts'
import { Engine } from './engine.ts'
import { Build, Frontend } from './frontend.ts'
import { Source } from './lang/tokenizer.ts'
import { PreviewService } from './preview-service.ts'
import { initVm } from './vm.ts'

export type PreviewWorkerInit = BackendInit & { length: number, buffers: Buffers }

export class PreviewWorker {
  service: Agent<PreviewService, PreviewWorker>
  backend?: Backend
  length = 2048

  constructor() {
    const [worker, service] = new Bob<PreviewWorker, PreviewService>(
      data => self.postMessage(data),
      this
    ).agents({ debug: false })
    this.service = service
    self.onmessage = ({ data }) => worker.receive(data)
  }

  async init({ vmInit, buffers, length }: PreviewWorkerInit) {
    this.length = length

    const vm = await initVm({ ...vmInit!, resetCtrlById })

    this.backend = await Backend.instantiate({
      vm,
      buffers,
    })
    this.backend.engine.vmRunner = this.backend.engine.createRunner()
  }

  builds = new Map<number, Build.Sound>()

  // async make(source: Source, isMain = false) {
  //   const cid = checksum(source.code)
  //   if (this.builds.has(cid)) return cid
  //   else {
  //     const build = this.frontend.make(source, isMain)
  //     this.builds.set(cid, build)
  //     return cid
  //   }
  // }

  // sentPayloads: Record<number, Build.Payload> = {}
  // async sync(payloads: Record<number, Build.Payload>) {
  //   const diff = objectDiff(this.sentPayloads, payloads)
  //   const toSend = Object.assign(diff.created, diff.updated)
  //   await this.backend.putPayloads(toSend)
  //   Object.assign(this.sentPayloads, toSend)
  //   for (const k in diff.deleted) {
  //     delete this.sentPayloads[k]
  //   }
  // }

  putPayloads(payloads: Record<number, Build.Payload>) {
    return this.backend!.putPayloads(payloads)
  }

  async render() {
    const runner = this.backend!.vmRunner!
    // const bar = runner.vmBars[0]
    // bar.clear()

    // // const toSend: Record<number, Build.Payload> = {}

    // if (mainCid >= 0) {
    //   const build = this.builds.get(mainCid)
    //   if (!build) {
    //     console.warn('Aborting, Build not found for main cid:', mainCid)
    //     return
    //   }
    //   // if (!build.isNew) {
    //   build.info.writeLiterals(build.payload.ownLiterals)
    //   // }

    //   const main = runner.vmCtrls[0]
    //   await main.setPayload(build.payload)
    //   // main.reset()
    //   bar.setMain(main)
    //   // toSend[main.ptr] = main.payload!
    // }

    // let i = 1
    // for (const trackCid of trackCids) {
    //   const build = this.builds.get(trackCid)
    //   if (!build) {
    //     console.warn('Aborting, Build not found for cid:', trackCid)
    //     return
    //   }
    //   // if (!build.isNew) {
    //   build.info.writeLiterals(build.payload.ownLiterals)
    //   // }

    //   const ctrl = runner.vmCtrls[i++]
    //   await ctrl.setPayload(build.payload)
    //   // ctrl.reset()
    //   bar.addTrack(ctrl)
    //   // toSend[ctrl.ptr] = ctrl.payload!
    // }
    // console.log(bar, mainCid, trackCids)

    // // await this.sync(toSend)
    // // bar.reset()
    // runner.bars[0] = bar.ptr
    await this.backend!.fill(0, this.length)

    // const build = mainCid >= 0
    //   ? this.builds.get(mainCid)
    //   : this.builds.get(trackCids[0])

    // return build?.signal.LR ?? build?.signal.L ?? build?.signal.R
  }

  // async render(
  //   isMain: boolean,
  //   payload: Build.Payload,
  //   payloads: Build.Payload[]
  // ) {
  //   if (!isMain) {
  //     const data = await this.backend.setBarAt(
  //       [0], [payload], null)
  //     await this.backend.fill(0, this.length)
  //     return data
  //   }
  //   else {
  //     if (!payloads.length) return
  //     const data = await this.backend.setBarAt(
  //       [0], payloads, payload)
  //     await this.backend.fill(0, this.length)
  //     return data
  //   }
  // }

  // async trash(ptrs: BarBuildPtrs) {
  //   await this.backend.trash(ptrs)
  // }

  // async purge(instanceId: number) {
  //   await this.backend.purge(instanceId)
  // }
}

new PreviewWorker()

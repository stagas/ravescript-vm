import { Agent, Bob } from 'alice-bob'
import { Backend, BackendInit, BarBuildPtrs } from './backend.ts'
import { Build, Frontend } from './frontend.ts'
import { PreviewService } from './preview-service.ts'
import { initVm } from './vm.ts'
import { Source } from './lang/tokenizer.ts'
import { checksum, objectDiff } from 'utils'

export interface PreviewWorkerInit extends BackendInit {
  length: number
}

export class PreviewWorker {
  service: Agent<PreviewService, PreviewWorker>
  frontend!: Frontend
  backend!: Backend
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
    const vm = await initVm(vmInit)
    this.frontend = new Frontend('preview-worker', vm, buffers.engine, false)
    this.backend = await Backend.instantiate({
      vmInit,
      buffers,
      runner: true
    })
  }

  builds = new Map<number, Build.Sound>()

  async make(source: Source, isMain = false) {
    const cid = checksum(source.code)
    if (this.builds.has(cid)) return cid
    else {
      const build = this.frontend.make(source, isMain)
      this.builds.set(cid, build)
      return cid
    }
  }

  sentPayloads: Record<number, Build.Payload> = {}
  async sync() {
    const payloads = this.backend.vmRunner!.getPayloads()
    const diff = objectDiff(this.sentPayloads, payloads)
    const toSend = Object.assign(diff.created, diff.updated)
    await this.backend.putPayloads(toSend)
    Object.assign(this.sentPayloads, toSend)
    for (const k in diff.deleted) {
      delete this.sentPayloads[k]
    }
  }

  async render(mainCid: number, trackCids: number[]) {
    const runner = this.backend.vmRunner!
    const bar = runner.vmBars[0]
    bar.clear()

    if (mainCid) {
      const main = runner.vmCtrls[0]
      await main.setPayload(this.builds.get(mainCid)!.payload)
      bar.setMain(main)
    }

    let i = 1
    for (const cid of trackCids) {
      const ctrl = runner.vmCtrls[i++]
      await ctrl.setPayload(this.builds.get(cid)!.payload)
      bar.addCtrl(ctrl)
    }

    runner.setBar(0, bar)
    await this.sync()
    await this.backend.fill(0, this.length)
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

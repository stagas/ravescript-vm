import { Agent, Bob } from 'alice-bob'
import { Backend, BackendInit } from './backend.ts'
import { Build } from './frontend.ts'
import { PreviewService } from './preview-service.ts'

export interface PreviewWorkerInit extends BackendInit {
  length: number
}

export class PreviewWorker {
  service: Agent<PreviewService, PreviewWorker>
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
    this.backend = await Backend.instantiate({
      vmInit,
      buffers,
      runner: true
    })
  }

  async render(isMain: boolean, payload: Build.Payload, payloads: Build.Payload[]) {
    if (!isMain) {
      // let tries = 3
      // this.backend.clearMain()
      // // try {
      // while (--tries) {
      const data = await this.backend.setBarAt([0], [payload], null)
      await this.backend.fill(0, this.length)
      return data
      // if (!(this.backend.signal?.LR ?? this.backend.signal?.L ?? this.backend.signal?.R)?.every((x) => x === 0)) {
      //   break
      // }
      // }
      // }
      // catch (error) {
      //   console.warn(error)
      // }
    }
    else {
      // this.backend.clearMain()
      if (!payloads.length) return
      // console.log('WHATTTT', payloads)
      // try {
      // await this.backend.setMain(payload)
      const data = await this.backend.setBarAt([0], payloads, payload)
      await this.backend.fill(0, this.length)
      return data
      // }
      // catch (error) {
      //   console.warn(error)
      // }
    }
  }

  async trash(data: any) {
    await this.backend.trash(data)
  }

  async purge(instanceId: number) {
    await this.backend.purge(instanceId)
  }
}

new PreviewWorker()

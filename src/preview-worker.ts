import { Agent, Bob } from 'alice-bob'
import { Backend, BackendInit, BarBuildPtrs } from './backend.ts'
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

  async render(
    isMain: boolean,
    payload: Build.Payload,
    payloads: Build.Payload[]
  ) {
    if (!isMain) {
      const data = await this.backend.setBarAt(
        [0], [payload], null)
      await this.backend.fill(0, this.length)
      return data
    }
    else {
      if (!payloads.length) return
      const data = await this.backend.setBarAt(
        [0], payloads, payload)
      await this.backend.fill(0, this.length)
      return data
    }
  }

  async trash(ptrs: BarBuildPtrs) {
    await this.backend.trash(ptrs)
  }

  // async purge(instanceId: number) {
  //   await this.backend.purge(instanceId)
  // }
}

new PreviewWorker()

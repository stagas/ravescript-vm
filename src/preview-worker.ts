import { Agent, Bob } from 'alice-bob'
import { Backend, BackendInit, Buffers } from './backend.ts'
import { Build } from './frontend.ts'
import { PreviewService } from './preview-service.ts'

export type PreviewWorkerInit = BackendInit & { length: number, buffers: Buffers }

export class PreviewWorker {
  backend: Backend
  service: Agent<PreviewService, Backend>
  length = 2048

  constructor() {
    this.backend = new Backend()
    const [worker, service] = new Bob<Backend, PreviewService>(
      data => self.postMessage(data),
      this.backend
    ).agents({ debug: false })
    this.service = service
    self.onmessage = ({ data }) => worker.receive(data)
  }
}

new PreviewWorker()

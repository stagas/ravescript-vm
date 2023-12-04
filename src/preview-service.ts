import { Agent, Alice } from 'alice-bob'
import { Deferred } from 'utils'
import { PreviewWorker } from './preview-worker.ts'
import { RaveNode } from './rave-node.ts'
import { VmInit, createVmMemory, initVm } from './vm.ts'
import { Engine } from './engine.ts'
import { Frontend } from './frontend.ts'
import { Backend } from './backend.ts'

export const previews: Map<string, Deferred<[Float32Array, Float32Array]>> = new Map()
const previewServices: Map<number, Deferred<PreviewService>> = new Map()

export async function createPreviewService(length: number, rave: RaveNode) {
  let deferred = previewServices.get(length)

  if (deferred) {
    return deferred.promise
  }

  deferred = Deferred()
  previewServices.set(length, deferred)

  const vmInit: VmInit = {
    ...RaveNode.processorOptions.vmInit!,
    // pffftRunners: {
    //   timeFFT: rave.frontend.vm.timeFFT!.runner,
    //   freqFFT: rave.frontend.vm.freqFFT!.runner,
    // },
    memory: createVmMemory()
  }

  const vm = await initVm(vmInit)
  const frontend = new Frontend('preview-service', vm)
  frontend.engine = new Engine(vm)
  frontend.engine.init()
  frontend.engine.vmRunner = frontend.engine.createRunner()

  const service = new PreviewService(frontend)

  await service.worker.init({
    vmInit,
    buffers: frontend.buffers,
  })
  deferred.resolve(service)

  return deferred.promise
}

export class PreviewService {
  worker: Agent<Backend, PreviewService>

  constructor(public frontend: Frontend) {
    const url = new URL('./preview-worker.js', import.meta.url).href
    const worker = new Worker(url)

    const [service, remote] = new Alice<PreviewService, Backend>(
      data => worker.postMessage(data),
      this
    ).agents({ debug: false })

    worker.onmessage = ({ data }) => service.receive(data)

    this.worker = remote
  }
}

import { Agent, Alice } from 'alice-bob'
import { queue } from 'event-toolkit'
import { Deferred } from 'utils'
import { Build, Frontend } from './frontend.ts'
import { PreviewWorker } from './preview-worker.ts'
import { RaveNode } from './rave-node.ts'
import { Vm } from './vm.ts'

type Sound = any

export const previews: Map<string, Deferred<[Float32Array, Float32Array]>> = new Map()

const previewServices: Map<number, Deferred<PreviewService>> = new Map()

export async function createPreviewService(length: number, vm: Vm) {
  let deferred = previewServices.get(length)

  if (deferred) {
    return deferred.promise
  }

  deferred = Deferred()
  previewServices.set(length, deferred)

  const frontend = new Frontend(vm)

  frontend.clock.endTime = 1

  const service = new PreviewService(frontend)

  await service.worker.init({
    vmInit: {
      ...RaveNode.processorOptions.vmInit,
      pffftRunners: {
        timeFFT: vm.timeFFT!.runner,
        freqFFT: vm.freqFFT!.runner,
      }
    },
    buffers: frontend.buffers,
    runner: true,
    length,
  })

  deferred.resolve(service)

  return deferred.promise
}

export class PreviewService {
  worker: Agent<PreviewWorker, PreviewService>
  trash: Build.Sound[] = []

  constructor(
    public frontend: Frontend
  ) {
    const url = new URL('./preview-worker.js', import.meta.url).href
    const worker = new Worker(url)

    const [service, remote] = new Alice<PreviewService, PreviewWorker>(
      data => worker.postMessage(data),
      this
    ).agents({ debug: false })

    worker.onmessage = ({ data }) => service.receive(data)

    this.worker = remote
  }

  render = queue.atomic(async (
    build: Build.Sound,
    builds: Build.Sound[] | undefined,
  ) => {
    await this.worker.render(build.payload, builds?.map((build) => build.payload))
  })

  async pushTrash(build: Build.Sound, sound: Sound) {
    this.trash = this.trash.filter((b) =>
      b.payload.instanceId !== build.payload.instanceId
    )

    this.trash.push(build)

    if (this.trash.length > 48) {
      const trashBuild = this.trash.shift()!
      trashBuild.isTrashed = true
      await this.purge(trashBuild.payload.instanceId, sound)
    }
  }

  purge = async (instanceId: number, sound: Sound) => {
    this.frontend.purge(instanceId)
    await this.worker.purge(instanceId)
  }
}

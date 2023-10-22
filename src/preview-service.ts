import { Agent, Alice } from 'alice-bob'
import { Deferred } from 'utils'
import { queue } from 'event-toolkit'
import { Build, Frontend } from './frontend.ts'
import { PreviewWorker } from './preview-worker.ts'
import { RaveNode } from './rave-node.ts'
import { Vm } from './vm.ts'
// import { printer } from '../../web/util/printer'
// import { Sound } from '../../web/sound'
// const print = printer('preview-service')

// TODO: fixme
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

  // const vmMemory = createVmMemory()

  // const vmInit: VmInit = {
  //   vmBinary: RaveNode.vmBinary,
  //   pffftBinary: RaveNode.pffftBinary,
  //   memory: vmMemory
  // }

  // const vm = await initVm(vmInit)

  // delete Frontend.core
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
    // TODO: why aren't they cleaned up properly?
    // build.shared.memories!.audios.forEach((audio) =>
    //   audio.fill(0)
    // )
    // build.info.literals.forEach((l) => {
    //   build.payload.liveLiterals[l.ptr]
    //     = build.payload.ownLiterals[l.ptr]
    //     = l.value
    // })
    // // build.payload.liveLiterals.set(
    // //   build.payload.ownLiterals
    // // )
    // builds?.forEach((build) => {
    //   build.shared.memories!.audios.forEach((audio) =>
    //     audio.fill(0)
    //   )
    //   build.info.literals.forEach((l) => {
    //     build.payload.liveLiterals[l.ptr]
    //       = build.payload.ownLiterals[l.ptr]
    //       = l.value
    //   })
    //   // build.payload.liveLiterals.set(
    //   //   build.payload.ownLiterals
    //   // )
    // })
    await this.worker.render(build.payload, builds?.map((build) => build.payload))
  })

  async pushTrash(build: Build.Sound, sound: Sound) {
    this.trash = this.trash.filter((b) =>
      b.payload.instanceId !== build.payload.instanceId
    )

    // print.id('pushTrash', sound.$.id)
    this.trash.push(build)

    if (this.trash.length > 48) {
      const trashBuild = this.trash.shift()!
      trashBuild.isTrashed = true
      await this.purge(trashBuild.payload.instanceId, sound)
    }
  }

  purge = async (instanceId: number, sound: Sound) => {
    // print.id('purge', sound.$.id)
    this.frontend.purge(instanceId)
    await this.worker.purge(instanceId)
  }
}

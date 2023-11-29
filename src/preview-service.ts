import { Agent, Alice } from 'alice-bob'
import { Deferred } from 'utils'
import { Build, Frontend } from './frontend.ts'
import { PreviewWorker } from './preview-worker.ts'
import { RaveNode } from './rave-node.ts'
import { Vm } from './vm.ts'

export const previews: Map<string, Deferred<[Float32Array, Float32Array]>> = new Map()
const previewServices: Map<number, Deferred<PreviewService>> = new Map()

export async function createPreviewService(length: number, vm: Vm) {
  let deferred = previewServices.get(length)

  if (deferred) {
    return deferred.promise
  }

  deferred = Deferred()
  previewServices.set(length, deferred)

  const frontend = new Frontend('preview', vm)

  frontend.clock.endTime = 1

  // const backend = new Backend(vm, frontend.buffers, true)

  const service = new PreviewService(frontend) //, backend)

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
  // trash: Build.Sound[] = []

  constructor(
    public frontend: Frontend,
    // public backend: Backend,
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

  // usedBars: any[] = []

  async render(
    isMain: boolean,
    build: Build.Sound,
    builds: Build.Sound[],
  ) {
    return await this.worker.render(
      isMain,
      build.payload,
      builds.map((build) =>
        build.payload
      )
    )

    // if (!res) return


    // TODO: return res to caller so we can manage when to trash.
    // We should trash when a sound is not visible anywhere and prepare
    // to trigger rebuild whenever it becomes visible again.


    // this.usedBars.push(res)

    // // TODO: queue usedBars and throttle trashing
    // if (this.usedBars.length > 5) {
    //   const data: any = this.usedBars.shift()
    //   const ctrls: number[] = []
    //   for (const ptr of data.ctrls) {
    //     let found = false
    //     for (const other of this.usedBars) {
    //       if (other.ctrls.includes(ptr)) {
    //         found = true
    //         break
    //       }
    //     }
    //     if (!found) {
    //       ctrls.push(ptr)
    //     }
    //   }
    //   this.worker.trash({
    //     bars: [data.bar],
    //     ctrls: data.ctrls
    //   })
    // }

  }

  // async pushTrash(build: Build.Sound, sound: Sound) {
  //   this.trash = this.trash.filter((b) =>
  //     b.payload.instanceId !== build.payload.instanceId
  //   )

  //   this.trash.push(build)

  //   if (this.trash.length > 48) {
  //     const trashBuild = this.trash.shift()!
  //     trashBuild.isTrashed = true
  //     await this.purge(trashBuild.payload.instanceId, sound)
  //     console.log('PURGING')
  //   }
  // }

  // purge = async (instanceId: number, sound: Sound) => {
  //   this.frontend.purge(instanceId)
  //   await this.worker.purge(instanceId)
  // }
}

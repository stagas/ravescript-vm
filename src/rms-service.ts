import { RaveNode } from './rave-node'
import { Build } from './frontend'
import { RmsWorkerMessagePayload } from './rms-worker'
import { post } from './util'
import { Deferred } from 'everyday-utils'
import { printer } from '../../web/util/printer'

const print = printer('rms-service')

export type RmsServiceMessagePayload =
  | { onReady: true }

export type RmsService = ReturnType<typeof createRms>

export function createRms(rave: RaveNode) {
  const url = new URL('./rms-worker.js', import.meta.url).href
  const worker = new Worker(url)
  const deferred = Deferred<void>()

  post<RmsWorkerMessagePayload>(worker, {
    init: {
      vmInit: {
        ...RaveNode.processorOptions.vmInit,
        pffftRunners: {
          timeFFT: rave.frontend.vm.timeFFT!.runner,
          freqFFT: rave.frontend.vm.freqFFT!.runner,
        }
      },
      buffers: rave.frontend.buffers,
      runner: false,
    }
  })

  const all: Map<number, Build.Shared> = new Map()

  const service = {
    onReady() { },
    async setShared(shared: Build.Shared) {
      if (all.has(shared.payload.instanceId)) return
      await deferred.promise
      all.set(shared.payload.instanceId, shared)
      post<RmsWorkerMessagePayload>(worker, {
        setPayload: shared.payload
      })
    },
    run(id: number, begin: number, end: number, paramsOnly?: boolean) {
      if (!all.has(id)) return
      post<RmsWorkerMessagePayload>(worker, {
        run: [id, begin, end, all.get(id)!.memories.rms.byteOffset, paramsOnly]
      })
    }
  }

  worker.onmessage = (e: MessageEvent<RmsServiceMessagePayload>) => {
    if ('onReady' in e.data) {
      print('ready')
      deferred.resolve()
      service.onReady?.()
    }
  }

  return service
}

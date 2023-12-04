import { Backend, BackendInit } from './backend.ts'
import { Build } from './frontend.ts'
import { instantiate } from './instantiate.ts'
import { Module } from './lang/index.ts'
import { RmsServiceMessagePayload } from './rms-service.ts'
import { post } from './util.ts'

export type RmsWorkerMessagePayload =
  | { run: Parameters<RmsWorker['run']> }
  | { init: BackendInit }
  | { setPayload: Build.Shared['payload'] }

export interface RmsWorkerMessageEvent extends MessageEvent<RmsWorkerMessagePayload> { }

class RmsWorker {
  backend?: Backend
  ctrls: Map<number, Module.Instance> = new Map()

  constructor() {
    self.onmessage = async (e: RmsWorkerMessageEvent) => {
      if ('run' in e.data) {
        this.run(...e.data.run)
      }
      else if ('init' in e.data) {
        this.backend = new Backend()
        await this.backend.init(e.data.init)
        post<RmsServiceMessagePayload>(self as any, { onReady: true })
      }
      else if ('setPayload' in e.data) {
        const payload = e.data.setPayload
        if (!this.ctrls.has(payload.instanceId)) {
          this.ctrls.set(
            payload.instanceId,
            await instantiate<Module.Instance>(payload.binary, this.backend!.vm.env)
          )
        }
      }
    }
  }

  run(id: number, begin: number, end: number, resultsPtr: number, paramsOnly?: boolean) {
    const ctrl = this.ctrls.get(id)
    if (!ctrl) return

    if (paramsOnly) {
      ctrl.exports.rms_params(begin, end, resultsPtr >> 2)
    }
    else {
      ctrl.exports.rms(begin, end, resultsPtr >> 2)
    }
    // console.log('YES', id)
  }
}

new RmsWorker()

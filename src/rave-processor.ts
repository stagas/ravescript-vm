import { Agent, Bob } from 'alice-bob'
import { Backend, BackendInit } from './backend.ts'
import { RaveNode } from './rave-node.ts'

export type RaveProcessorOptions = BackendInit

export class RaveProcessor extends AudioWorkletProcessor {
  backend: Backend
  node?: Agent<RaveNode, Backend>

  constructor(options: { processorOptions: RaveProcessorOptions }) {
    super()
    this.backend = new Backend()
    this.init(options.processorOptions)
  }

  async init(init: BackendInit) {
    await this.backend.init(init)

    const [worklet, node] = new Bob<Backend, RaveNode>(
      data => this.port.postMessage(data),
      this.backend
    ).agents({ debug: false })

    this.node = node
    this.port.onmessage = ({ data }) => worklet.receive(data)
    this.node.onProcessorReady()
  }

  process(inputs: Float32Array[][], outputs: Float32Array[][]) {
    this.backend.process(inputs[0], outputs[0])
    return true
  }
}

registerProcessor('rave', RaveProcessor)

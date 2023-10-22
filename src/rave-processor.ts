import { Agent, Bob } from 'alice-bob'
import { Backend, BackendInit } from './backend.ts'
import { RaveNode } from './rave-node.ts'

export interface RaveProcessorOptions extends BackendInit {
}

export class RaveProcessor extends AudioWorkletProcessor {
  backend?: Backend
  node?: Agent<RaveNode, Backend>

  constructor(options: { processorOptions: RaveProcessorOptions }) {
    super()
    this.init(options.processorOptions)
  }

  async init(init: BackendInit) {
    this.backend = await Backend.instantiate(init)

    const [worklet, node] = new Bob<Backend, RaveNode>(
      data => this.port.postMessage(data),
      this.backend
    ).agents({ debug: false })

    this.node = node
    this.port.onmessage = ({ data }) => worklet.receive(data)
    this.node.onProcessorReady()
  }

  process(inputs: Float32Array[][], outputs: Float32Array[][]) {
    this.backend?.process(inputs[0], outputs[0])
    return true
  }
}

registerProcessor('rave', RaveProcessor)

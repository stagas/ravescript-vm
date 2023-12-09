import { $, fx, of } from 'signal'
import { BackendInit, Backend, Signal } from '../src/backend.ts'
import { Engine } from '../src/engine.ts'
import { Frontend } from '../src/frontend.ts'
import { createVmMemory, fetchVmBinary, initVm } from '../src/vm.ts'
import { fetchPffftBinary } from '../vendor/pffft/pffft.ts'
import { dom } from 'utils'

async function prepare() {
  const vmBinary = await fetchVmBinary()
  const pffftBinary = await fetchPffftBinary()

  const vmMemory = createVmMemory()
  const vm = await initVm({
    memory: vmMemory,
    vmBinary,
    pffftBinary
  })
  const frontend = new Frontend('develop', vm)
  frontend.debug = true
  frontend.engine = new Engine(vm)
  frontend.engine.init()
  frontend.engine.vmRunner = frontend.engine.createRunner()

  const processorOptions: BackendInit = {
    vm,
    buffers: frontend.engine.buffers,
  }

  const backend = new Backend()
  await backend.init(processorOptions)
  backend.engine = frontend.engine!

  return { frontend, backend }
}

const LOCALSTORAGE_CODE_KEY = 'developGenCode'

async function start() {
  const { frontend, backend } = await prepare()

  const source = $({ code: localStorage[LOCALSTORAGE_CODE_KEY] || `[sin 1] LR+=` })

  const iters = 43
  const floats = new Float32Array(2048 * iters)

  const output = $({
    floats,
    updated: 0
  })
// trig:bt] [clip .25] 4* [slp 200] [inc .000122 trig:4 bt *] *
  fx(() => {
    const { code } = of(source)
    $()
    const build = frontend.make(source)
    const runner = frontend.engine!.vmRunner!
    const ctrl = runner.vmCtrls[0]
    ctrl.setPayload(build.payload, true)
      .then(() => {
        const bar = runner.vmBars[0]
        bar.reset()
        bar.clear()
        bar.addTrack(ctrl)
        runner.bars[0] = bar.ptr
        build.info.writeLiterals(build.payload.ownLiterals)

        // backend.clock.time = 0
        backend.fill(0, 2048)
        floats.subarray(0, 2048).set(backend.signal.LR!)
        for (let i = 1; i < iters; i++) {
          // backend.clock.time += (2048 * backend.clock.timeStep)
          // console.log(backend.clock.time)
          backend.fill(0, 2048, true)
          floats.subarray(i * 2048, (i + 1) * 2048).set(backend.signal.LR!)
        }

        output.updated++
      })
  })

  dom.head.append(dom.el<HTMLStyleElement>('style', {
    textContent: /*css*/`
      html, body {
        width: 100%;
        height: 100%;
      }
    `
  }))

  const audioContext = new AudioContext({ sampleRate: 44100, latencyHint: 0.00001 })

  const buffersPlaying = new Set<AudioBufferSourceNode>()
  const input = dom.el<HTMLInputElement>('input', {
    value: source.code,
    spellcheck: false,
    autocorrect: 'off',
    oninput: () => {
      source.code = localStorage[LOCALSTORAGE_CODE_KEY] = input.value
    },
    onkeydown: (e: KeyboardEvent) => {
      if (e.key === 'Enter') {
        e.preventDefault()
        audioContext.resume()
        const ab = audioContext.createBuffer(1, floats.length, audioContext.sampleRate)
        ab.getChannelData(0).set(floats)
        const bs = audioContext.createBufferSource()
        bs.buffer = ab
        bs.connect(audioContext.destination)
        bs.start()
        buffersPlaying.add(bs)
        bs.addEventListener('end', () => {
          buffersPlaying.delete(bs)
        })
      }
      else if (e.key === 'Escape') {
        buffersPlaying.forEach(b => b.stop())
      }
    },
    style: {
      cssText: /*css*/`
      position: fixed;
      bottom: 0;
      z-index: 999;
      color: #ccc;
      background: #444;
      font-family: "Roboto Mono", monospace;
      font-size: 12px;
      height: 50px;
      width: 100%;
      padding: 0 10px;
      border: none;
      outline: none;
      `
    }
  })

  const canvas = dom.el<HTMLCanvasElement>('canvas', {
    style: {
      cssText: /*css*/`
      position: fixed;
      width: 100%;
      height: calc(100% - 52px);
      `
    }
  })

  const c = canvas.getContext('2d')!

  fx(() => {
    const { updated } = of(output)
    $()
    const { width, height } = canvas
    // const floats = signal.LR!
    const coeff = floats.length / width
    const hh = height * .5
    c.clearRect(0, 0, width, height)
    c.save()
    c.translate(0, hh)
    c.beginPath()
    c.moveTo(0, floats[0] * hh)
    for (let i = 0; i < width; i++) {
      const f = floats[i * coeff | 0]
      c.lineTo(i, f * hh)
    }
    c.strokeStyle = '#bbb'
    c.lineWidth = 1.5 * window.devicePixelRatio
    c.stroke()
    c.restore()
  })

  dom.observe.resize(dom.body, () => {
    const pr = window.devicePixelRatio
    canvas.width = (window.innerWidth * pr)
    canvas.height = (window.innerHeight - 52) * pr
  }, { initial: true })

  dom.body.append(canvas)
  dom.body.append(input)
}

start()

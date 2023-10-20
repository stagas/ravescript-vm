import { WASI, File, OpenFile, PreopenDirectory } from '@bjorn3/browser_wasi_shim'

const samWasmPath = new URL('./sam.wasm', import.meta.url)

const wasmPromise = new Promise<WebAssembly.Module>((resolve, reject) => {
  WebAssembly.compileStreaming(fetch(samWasmPath)).then(resolve).catch(reject)
})

function toFloat32(data: Uint8Array): Float32Array {
  const outputData = new Float32Array(22050);
  const length = Math.min(data.length, 22050)
  for (let i = 0; i < length; i++) {
    outputData[i] = (data[i] - 128) / 128.0
  }
  return outputData;
}

export async function say(text: string) {
  const args: string[] = ["bin", "-wav", "out.wav", text]
  const env: string[] = []
  const dir = new PreopenDirectory(".", {})
  const fds = [
    new OpenFile(new File([])), // stdin
    new OpenFile(new File([])), // stdout
    new OpenFile(new File([])), // stderr
    dir,
  ];
  const wasi = new WASI(args, env, fds);
  const wasm = await wasmPromise
  const inst = await WebAssembly.instantiate(wasm, {
    "wasi_snapshot_preview1": wasi.wasiImport,
  });
  wasi.start(inst as any)
  const data = (dir.dir.contents['out.wav'] as File).data
  const wave8bit = data.slice(44)
  const floats = toFloat32(wave8bit)
  return floats
}

export async function test_sam() {
  // @env browser
  describe('sam', () => {
    it('works', async () => {
      await new Promise(resolve => setTimeout(resolve, 1000))
      console.time('say')
      await say('hello world')
      console.timeEnd('say')
      console.time('say')
      await say('hello world')
      console.timeEnd('say')
      console.time('say')
      await say('hello world')
      console.timeEnd('say')
      console.time('say')
      await say('hello world')
      console.timeEnd('say')
      console.time('say')
      await say('hello world')
      console.timeEnd('say')
    })
  })
}

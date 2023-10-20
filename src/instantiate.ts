import type { Compile } from './lang/compiler'

export async function instantiate<T>(binary: Uint8Array, env: Compile.Env) {
  const { instance: mod } = await WebAssembly.instantiate(binary, {
    env: Object.assign({
      logi: env.log,
      logf: env.log,
      logd: env.log,
    }, env),
  })

  return mod as unknown as T
}

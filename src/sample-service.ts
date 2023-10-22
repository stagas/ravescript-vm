import { Deferred } from 'everyday-utils'
import { Build } from './frontend.ts'
import { GenRuntime } from './gen-runtime.ts'
import { Emitter } from './lang/index.ts'
import { say } from './sam.ts'
import { upsampleBuffer } from './util.ts'

const samples: Map<number, Deferred<Float32Array[]>> = new Map()
const assignedSamples: Map<GenRuntime, number> = new Map()

const speeches: Map<string, Deferred<Float32Array>> = new Map()
const assignedSpeeches: Map<GenRuntime, string> = new Map()

export async function fetchSamples(build: Build.Sound, fetchSample: (sampleId: number) => Promise<Float32Array[]>) {
  for (const g of build.info.gens) {
    const gen = g.runtime
    if (!gen) continue

    const text = g.locals.gen_say_set_text
    if (text) {
      if (text.type !== Emitter.ItemType.String) {
        console.warn(text)
        throw new TypeError('Expected a string.', { cause: { nodes: [text] } })
      }

      try {
        if (!speeches.has(text.value)) {
          const deferred: Deferred<Float32Array> = Deferred()
          speeches.set(text.value, deferred)
          const floats = await say(text.value)
          deferred.resolve(upsampleBuffer(floats, 3))
        }

        if (assignedSpeeches.get(gen) !== text.value) {
          const deferred = speeches.get(text.value)!
          const floats = await deferred.promise
          if (floats) {
            gen.floats!.set(floats)
          }
          assignedSpeeches.set(gen, text.value)
        }
      } catch (error) {
        console.warn(error)
      }

      continue
    }

    const literal = g.locals.gen_freesound_set_id as Emitter.Literal
    if (!literal) continue
    if (literal.type !== Emitter.ItemType.Literal) {
      throw new TypeError('Expected a literal.', { cause: { nodes: [literal] } })
    }

    const sampleId = literal.value
    if (!sampleId) continue

    try {
      if (!samples.has(sampleId)) {
        const deferred: Deferred<Float32Array[]> = Deferred()
        samples.set(sampleId, deferred)
        const floatsStereo = await fetchSample(sampleId)
        deferred.resolve(floatsStereo.map((floats) =>
          upsampleBuffer(floats, 3))
        )
      }
      if (assignedSamples.get(gen) !== sampleId) {
        const deferred = samples.get(sampleId)!
        const floatsStereo = await deferred.promise
        if (floatsStereo) {
          // TODO: only Left channel for now, need to handle stereo
          gen.floats!.set(floatsStereo[0])
        }
        assignedSamples.set(gen, sampleId)
      }
    } catch (error) {
      console.warn(error)
    }
  }
}

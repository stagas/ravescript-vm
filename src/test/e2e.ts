import { fetchPffftBinary } from '../../vendor/pffft/pffft.ts'
import { Backend, BackendInit } from '../backend.ts'
import { Build, Frontend } from '../frontend.ts'
import { Emitter } from '../lang/index.ts'
import { createVmMemory, fetchVmBinary, initVm } from '../vm.ts'

jest.setTimeout(20000)

export async function test() {
  // @env browser
  const vmBinary = await fetchVmBinary()
  const pffftBinary = await fetchPffftBinary()

  async function prepare() {
    const vmMemory = createVmMemory()
    const vm = await initVm({
      memory: vmMemory,
      vmBinary,
      pffftBinary
    })
    const frontend = new Frontend(vm, 44100)

    const processorOptions: BackendInit = {
      vmInit: {
        memory: vmMemory,
        vmBinary,
        pffftBinary,
      },
      buffers: frontend.buffers,
      runner: true
    }

    const backend = await Backend.instantiate(processorOptions)

    return { frontend, backend }
  }

  describe('backend', () => {
    it('fill', async () => {
      const { frontend, backend } = await prepare()

      // TODO: this code should fail because it's DC
      //  it should be [zero] 42+ LR+= to convert it to AC
      const source = { code: `42 LR+=` }
      const tokens = Array.from(frontend.tokenize(source))
      const info = frontend.produce(tokens)
      const sound = frontend.compile(info)
      await backend.setBarAt([0], [sound.payload])

      backend.fill(0, 2048)
      // console.log(backend)

      const outs = backend.signal
      expect(outs.LR![0]).toEqual(42)
    })

    // it('fill twice', async () => {
    //   const { frontend, backend } = await prepare()

    //   let sound: Build.Sound
    //   // TODO: this code should fail because it's DC
    //   {
    //     //  it should be [zero] 42+ LR+= to convert it to AC
    //     const source = { code: `42 LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info)
    //     await backend.setBarAt(0, [sound.payload])

    //     backend.fill(0, 2048)

    //     const outs = backend.outs
    //     expect(outs[0][0]).toEqual(21)
    //     expect(outs[1][0]).toEqual(21)
    //     expect(outs[0][512]).toEqual(21)
    //     expect(outs[1][512]).toEqual(21)
    //   }

    //   {
    //     const source = { code: `42 LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info, sound)
    //     await backend.setBarAt(0, [sound.payload])

    //     backend.fill(0, 2048)

    //     const outs = backend.outs
    //     expect(outs[0][0]).toEqual(21)
    //     expect(outs[1][0]).toEqual(21)
    //     expect(outs[0][512]).toEqual(21)
    //     expect(outs[1][512]).toEqual(21)
    //   }
    // })

    // it('fill other', async () => {
    //   const { frontend, backend } = await prepare()

    //   let sound: Build.Sound
    //   let firstInfo: Emitter.Info
    //   {
    //     const source = { code: `42 LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = firstInfo = frontend.produce(tokens)
    //     sound = frontend.compile(info)
    //     await backend.setBarAt(0, [sound.payload])

    //     backend.fill(0, 2048)

    //     const outs = backend.outs
    //     expect(outs[0][0]).toEqual(21)
    //     expect(outs[1][0]).toEqual(21)
    //     expect(outs[0][512]).toEqual(21)
    //     expect(outs[1][512]).toEqual(21)
    //   }

    //   {
    //     const source = { code: `66 LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info, sound)
    //     await backend.setBarAt(0, [sound.payload])

    //     backend.fill(0, 2048)

    //     const outs = backend.outs
    //     expect(outs[0][0]).toEqual(33)
    //     expect(outs[1][0]).toEqual(33)
    //     expect(outs[0][512]).toEqual(33)
    //     expect(outs[1][512]).toEqual(33)
    //   }

    //   {
    //     sound = frontend.compile(firstInfo, sound)
    //     await backend.setBarAt(0, [sound.payload])

    //     backend.fill(0, 2048)

    //     const outs = backend.outs
    //     expect(outs[0][0]).toEqual(21)
    //     expect(outs[1][0]).toEqual(21)
    //     expect(outs[0][512]).toEqual(21)
    //     expect(outs[1][512]).toEqual(21)
    //   }
    // })

    // it('process - x x, x x x', async () => {
    //   const { frontend, backend } = await prepare()

    //   const source = { code: `[zero] 42+ LR+=` }
    //   const tokens = Array.from(frontend.tokenize(source))
    //   const info = frontend.produce(tokens)
    //   const sound = frontend.compile(info)
    //   await backend.setBarAt(0, [sound.payload])

    //   const outs: [Float32Array, Float32Array] = [
    //     new Float32Array(128),
    //     new Float32Array(128)
    //   ]

    //   backend.start()
    //   backend.process([], outs)

    //   const expected = [
    //     0,
    //     0,
    //     0,
    //     0,
    //     2.625,
    //     2.625,
    //     2.625,
    //     2.625,
    //     5.25,
    //     5.25,
    //     5.25,
    //     5.25,
    //     7.875,
    //     7.875,
    //     7.875,
    //     7.875,
    //     10.5,
    //     10.5,
    //     10.5,
    //     10.5,
    //     13.125,
    //     13.125,
    //     13.125,
    //     13.125,
    //     15.75,
    //     15.75,
    //     15.75,
    //     15.75,
    //     18.375,
    //     18.375,
    //     18.375,
    //     18.375,
    //     21,
    //     21,
    //     21,
    //     21,
    //     21,
    //     21,
    //   ]

    //   expect([...outs[0].slice(0, 38)]).toEqual(expected)
    //   expect([...outs[1].slice(0, 38)]).toEqual(expected)

    //   return
    //   {

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.clock.internalTime = .999
    //     backend.process([], outs)

    //     // console.log([...outs[0]])

    //     const expected = [
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }
    // })

    // it('process - x x, x x y, x y y', async () => {
    //   const { frontend, backend } = await prepare()
    //   let sound: Build.Sound

    //   {
    //     const source = { code: `[zero] 42+ LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info)
    //     await backend.setBarAt(0, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.start()
    //     backend.process([], outs)

    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //     ]

    //     expect([...outs[0].slice(0, 38)]).toEqual(expected)
    //     expect([...outs[1].slice(0, 38)]).toEqual(expected)
    //   }
    //   // return
    //   {
    //     const source = { code: `[zero] [zero] 42- LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info, sound)
    //     await backend.setBarAt(1, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.clock.internalTime = .997
    //     backend.process([], outs)

    //     // console.log([...outs[0]])
    //     const expected = [
    //       21,
    //       21,
    //       21,
    //       21,
    //       20.34375,
    //       20.34375,
    //       20.34375,
    //       20.34375,
    //       19.6875,
    //       19.6875,
    //       19.6875,
    //       19.6875,
    //       19.03125,
    //       19.03125,
    //       19.03125,
    //       19.03125,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       17.71875,
    //       17.71875,
    //       17.71875,
    //       17.71875,
    //       17.0625,
    //       17.0625,
    //       17.0625,
    //       17.0625,
    //       16.40625,
    //       16.40625,
    //       16.40625,
    //       16.40625,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.09375,
    //       15.09375,
    //       15.09375,
    //       15.09375,
    //       14.4375,
    //       14.4375,
    //       14.4375,
    //       14.4375,
    //       13.78125,
    //       13.78125,
    //       13.78125,
    //       13.78125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       12.46875,
    //       12.46875,
    //       12.46875,
    //       12.46875,
    //       11.8125,
    //       11.8125,
    //       11.8125,
    //       11.8125,
    //       11.15625,
    //       11.15625,
    //       11.15625,
    //       11.15625,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       9.84375,
    //       9.84375,
    //       9.84375,
    //       9.84375,
    //       9.1875,
    //       9.1875,
    //       9.1875,
    //       9.1875,
    //       8.53125,
    //       8.53125,
    //       8.53125,
    //       8.53125,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.21875,
    //       7.21875,
    //       7.21875,
    //       7.21875,
    //       6.5625,
    //       6.5625,
    //       6.5625,
    //       6.5625,
    //       5.90625,
    //       5.90625,
    //       5.90625,
    //       5.90625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       4.59375,
    //       4.59375,
    //       4.59375,
    //       4.59375,
    //       3.9375,
    //       3.9375,
    //       3.9375,
    //       3.9375,
    //       3.28125,
    //       3.28125,
    //       3.28125,
    //       3.28125,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       1.96875,
    //       1.96875,
    //       1.96875,
    //       1.96875,
    //       1.3125,
    //       1.3125,
    //       1.3125,
    //       1.3125,
    //       0.65625,
    //       0.65625,
    //       0.65625,
    //       0.65625
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }

    //   return

    //   {
    //     // const source = { code: `[zero] [zero] 42- LR+=` }
    //     // const tokens = Array.from(frontend.tokenize(source))
    //     // const info = frontend.produce(tokens)
    //     // build.payload = build.build(info)

    //     // await backend.createBar(1, [build.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     // backend.setClockTime(2)
    //     // backend.setBarTime(1)
    //     backend.process([], outs)

    //     // console.log([...outs[0]])
    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       -2.625,
    //       -2.625,
    //       -2.625,
    //       -2.625,
    //       -5.25,
    //       -5.25,
    //       -5.25,
    //       -5.25,
    //       -7.875,
    //       -7.875,
    //       -7.875,
    //       -7.875,
    //       -10.5,
    //       -10.5,
    //       -10.5,
    //       -10.5,
    //       -13.125,
    //       -13.125,
    //       -13.125,
    //       -13.125,
    //       -15.75,
    //       -15.75,
    //       -15.75,
    //       -15.75,
    //       -18.375,
    //       -18.375,
    //       -18.375,
    //       -18.375,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }
    // })

    // it('process - x x, x x y, x y y, y y x, y x x', async () => {
    //   const { frontend, backend } = await prepare()

    //   let sound: Build.Sound
    //   let firstInfo: Build.Sound['info']
    //   {
    //     const source = { code: `[zero] 42+ LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = firstInfo = frontend.produce(tokens)
    //     sound = frontend.compile(info)
    //     await backend.setBarAt(0, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.start()
    //     backend.process([], outs)

    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //     ]

    //     expect([...outs[0].slice(0, 38)]).toEqual(expected)
    //     expect([...outs[1].slice(0, 38)]).toEqual(expected)
    //   }
    //   // return
    //   {
    //     const source = { code: `[zero] [zero] 42- LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info, sound)
    //     await backend.setBarAt(1, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.clock.internalTime = .997
    //     backend.process([], outs)

    //     const expected = [
    //       21,
    //       21,
    //       21,
    //       21,
    //       20.34375,
    //       20.34375,
    //       20.34375,
    //       20.34375,
    //       19.6875,
    //       19.6875,
    //       19.6875,
    //       19.6875,
    //       19.03125,
    //       19.03125,
    //       19.03125,
    //       19.03125,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       17.71875,
    //       17.71875,
    //       17.71875,
    //       17.71875,
    //       17.0625,
    //       17.0625,
    //       17.0625,
    //       17.0625,
    //       16.40625,
    //       16.40625,
    //       16.40625,
    //       16.40625,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.09375,
    //       15.09375,
    //       15.09375,
    //       15.09375,
    //       14.4375,
    //       14.4375,
    //       14.4375,
    //       14.4375,
    //       13.78125,
    //       13.78125,
    //       13.78125,
    //       13.78125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       12.46875,
    //       12.46875,
    //       12.46875,
    //       12.46875,
    //       11.8125,
    //       11.8125,
    //       11.8125,
    //       11.8125,
    //       11.15625,
    //       11.15625,
    //       11.15625,
    //       11.15625,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       9.84375,
    //       9.84375,
    //       9.84375,
    //       9.84375,
    //       9.1875,
    //       9.1875,
    //       9.1875,
    //       9.1875,
    //       8.53125,
    //       8.53125,
    //       8.53125,
    //       8.53125,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.21875,
    //       7.21875,
    //       7.21875,
    //       7.21875,
    //       6.5625,
    //       6.5625,
    //       6.5625,
    //       6.5625,
    //       5.90625,
    //       5.90625,
    //       5.90625,
    //       5.90625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       4.59375,
    //       4.59375,
    //       4.59375,
    //       4.59375,
    //       3.9375,
    //       3.9375,
    //       3.9375,
    //       3.9375,
    //       3.28125,
    //       3.28125,
    //       3.28125,
    //       3.28125,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       1.96875,
    //       1.96875,
    //       1.96875,
    //       1.96875,
    //       1.3125,
    //       1.3125,
    //       1.3125,
    //       1.3125,
    //       0.65625,
    //       0.65625,
    //       0.65625,
    //       0.65625
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }

    //   // return

    //   {
    //     // const source = { code: `[zero] [zero] 42- LR+=` }
    //     // const tokens = Array.from(frontend.tokenize(source))
    //     // const info = frontend.produce(tokens)
    //     // build.payload = build.build(info)

    //     // await backend.createBar(1, [build.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     // console.log(backend.clock.time, backend.clock.internalTime, backend.clock.barTime)
    //     // backend.setClockTime(2)
    //     backend.process([], outs)

    //     // console.log([...outs[0]])
    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       -2.625,
    //       -2.625,
    //       -2.625,
    //       -2.625,
    //       -5.25,
    //       -5.25,
    //       -5.25,
    //       -5.25,
    //       -7.875,
    //       -7.875,
    //       -7.875,
    //       -7.875,
    //       -10.5,
    //       -10.5,
    //       -10.5,
    //       -10.5,
    //       -13.125,
    //       -13.125,
    //       -13.125,
    //       -13.125,
    //       -15.75,
    //       -15.75,
    //       -15.75,
    //       -15.75,
    //       -18.375,
    //       -18.375,
    //       -18.375,
    //       -18.375,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }

    //   // return

    //   {
    //     // const source = { code: `[zero] [zero] 42- LR+=` }
    //     // const tokens = Array.from(frontend.tokenize(source))
    //     // const info = frontend.produce(tokens)
    //     // build.payload = build.build(info)

    //     // await backend.createBar(1, [build.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     // build.payload = build.build(firstInfo)
    //     // await backend.setBarAt(0, [build.payload])

    //     // await backend.createBar(0, [{ ...build.payload }])

    //     backend.clock.internalTime = 1.997
    //     backend.process([], outs)

    //     // console.log([...outs[0]])
    //     const expected = [
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -20.34375,
    //       -20.34375,
    //       -20.34375,
    //       -20.34375,
    //       -19.6875,
    //       -19.6875,
    //       -19.6875,
    //       -19.6875,
    //       -19.03125,
    //       -19.03125,
    //       -19.03125,
    //       -19.03125,
    //       -18.375,
    //       -18.375,
    //       -18.375,
    //       -18.375,
    //       -17.71875,
    //       -17.71875,
    //       -17.71875,
    //       -17.71875,
    //       -17.0625,
    //       -17.0625,
    //       -17.0625,
    //       -17.0625,
    //       -16.40625,
    //       -16.40625,
    //       -16.40625,
    //       -16.40625,
    //       -15.75,
    //       -15.75,
    //       -15.75,
    //       -15.75,
    //       -15.09375,
    //       -15.09375,
    //       -15.09375,
    //       -15.09375,
    //       -14.4375,
    //       -14.4375,
    //       -14.4375,
    //       -14.4375,
    //       -13.78125,
    //       -13.78125,
    //       -13.78125,
    //       -13.78125,
    //       -13.125,
    //       -13.125,
    //       -13.125,
    //       -13.125,
    //       -12.46875,
    //       -12.46875,
    //       -12.46875,
    //       -12.46875,
    //       -11.8125,
    //       -11.8125,
    //       -11.8125,
    //       -11.8125,
    //       -11.15625,
    //       -11.15625,
    //       -11.15625,
    //       -11.15625,
    //       -10.5,
    //       -10.5,
    //       -10.5,
    //       -10.5,
    //       -9.84375,
    //       -9.84375,
    //       -9.84375,
    //       -9.84375,
    //       -9.1875,
    //       -9.1875,
    //       -9.1875,
    //       -9.1875,
    //       -8.53125,
    //       -8.53125,
    //       -8.53125,
    //       -8.53125,
    //       -7.875,
    //       -7.875,
    //       -7.875,
    //       -7.875,
    //       -7.21875,
    //       -7.21875,
    //       -7.21875,
    //       -7.21875,
    //       -6.5625,
    //       -6.5625,
    //       -6.5625,
    //       -6.5625,
    //       -5.90625,
    //       -5.90625,
    //       -5.90625,
    //       -5.90625,
    //       -5.25,
    //       -5.25,
    //       -5.25,
    //       -5.25,
    //       -4.59375,
    //       -4.59375,
    //       -4.59375,
    //       -4.59375,
    //       -3.9375,
    //       -3.9375,
    //       -3.9375,
    //       -3.9375,
    //       -3.28125,
    //       -3.28125,
    //       -3.28125,
    //       -3.28125,
    //       -2.625,
    //       -2.625,
    //       -2.625,
    //       -2.625,
    //       -1.96875,
    //       -1.96875,
    //       -1.96875,
    //       -1.96875,
    //       -1.3125,
    //       -1.3125,
    //       -1.3125,
    //       -1.3125,
    //       -0.65625,
    //       -0.65625,
    //       -0.65625,
    //       -0.65625
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }

    //   {
    //     // const source = { code: `[zero] [zero] 42- LR+=` }
    //     // const tokens = Array.from(frontend.tokenize(source))
    //     // const info = frontend.produce(tokens)
    //     // build.payload = build.build(info)

    //     // await backend.createBar(1, [build.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     // backend.setClockTime(3.999)
    //     backend.clock.internalTime = 0
    //     backend.process([], outs)

    //     // console.log([...outs[0]])

    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //     ]

    //     expect([...outs[0].slice(0, 38)]).toEqual(expected)
    //     expect([...outs[1].slice(0, 38)]).toEqual(expected)
    //   }
    // })

    // it('process - x x, x x x2, x x2 x2 (x2=same gens different ops)', async () => {
    //   const { frontend, backend } = await prepare()

    //   {
    //     const source = { code: `[zero] 42+ LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     const sound = frontend.compile(info)
    //     await backend.setBarAt(0, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.start()
    //     backend.process([], outs)

    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //     ]

    //     expect([...outs[0].slice(0, 38)]).toEqual(expected)
    //     expect([...outs[1].slice(0, 38)]).toEqual(expected)
    //   }

    //   {
    //     const source = { code: `[zero] 42- LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     const sound = frontend.compile(info)

    //     await backend.setBarAt(1, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.clock.internalTime = .997
    //     backend.process([], outs)

    //     // console.log([...outs[0]])

    //     const expected = [
    //       21,
    //       21,
    //       21,
    //       21,
    //       20.34375,
    //       20.34375,
    //       20.34375,
    //       20.34375,
    //       19.6875,
    //       19.6875,
    //       19.6875,
    //       19.6875,
    //       19.03125,
    //       19.03125,
    //       19.03125,
    //       19.03125,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       17.71875,
    //       17.71875,
    //       17.71875,
    //       17.71875,
    //       17.0625,
    //       17.0625,
    //       17.0625,
    //       17.0625,
    //       16.40625,
    //       16.40625,
    //       16.40625,
    //       16.40625,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.09375,
    //       15.09375,
    //       15.09375,
    //       15.09375,
    //       14.4375,
    //       14.4375,
    //       14.4375,
    //       14.4375,
    //       13.78125,
    //       13.78125,
    //       13.78125,
    //       13.78125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       12.46875,
    //       12.46875,
    //       12.46875,
    //       12.46875,
    //       11.8125,
    //       11.8125,
    //       11.8125,
    //       11.8125,
    //       11.15625,
    //       11.15625,
    //       11.15625,
    //       11.15625,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       9.84375,
    //       9.84375,
    //       9.84375,
    //       9.84375,
    //       9.1875,
    //       9.1875,
    //       9.1875,
    //       9.1875,
    //       8.53125,
    //       8.53125,
    //       8.53125,
    //       8.53125,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.21875,
    //       7.21875,
    //       7.21875,
    //       7.21875,
    //       6.5625,
    //       6.5625,
    //       6.5625,
    //       6.5625,
    //       5.90625,
    //       5.90625,
    //       5.90625,
    //       5.90625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       4.59375,
    //       4.59375,
    //       4.59375,
    //       4.59375,
    //       3.9375,
    //       3.9375,
    //       3.9375,
    //       3.9375,
    //       3.28125,
    //       3.28125,
    //       3.28125,
    //       3.28125,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       1.96875,
    //       1.96875,
    //       1.96875,
    //       1.96875,
    //       1.3125,
    //       1.3125,
    //       1.3125,
    //       1.3125,
    //       0.65625,
    //       0.65625,
    //       0.65625,
    //       0.65625
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }

    //   {
    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.process([], outs)

    //     // console.log([...outs[0]])

    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       -2.625,
    //       -2.625,
    //       -2.625,
    //       -2.625,
    //       -5.25,
    //       -5.25,
    //       -5.25,
    //       -5.25,
    //       -7.875,
    //       -7.875,
    //       -7.875,
    //       -7.875,
    //       -10.5,
    //       -10.5,
    //       -10.5,
    //       -10.5,
    //       -13.125,
    //       -13.125,
    //       -13.125,
    //       -13.125,
    //       -15.75,
    //       -15.75,
    //       -15.75,
    //       -15.75,
    //       -18.375,
    //       -18.375,
    //       -18.375,
    //       -18.375,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21,
    //       -21
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }
    // })

    // it("process - x x, x x x', x x' x' (x'=only literals)", async () => {
    //   const { frontend, backend } = await prepare()
    //   let sound: Build.Sound

    //   {
    //     const source = { code: `[zero] 42+ LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info)

    //     await backend.setBarAt(0, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.start()
    //     backend.process([], outs)

    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //     ]

    //     expect([...outs[0].slice(0, 38)]).toEqual(expected)
    //     expect([...outs[1].slice(0, 38)]).toEqual(expected)
    //   }
    //   // return
    //   {
    //     const source = { code: `[zero] 66+ LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info, sound)

    //     await backend.setBarAt(1, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.clock.internalTime = .997
    //     backend.process([], outs)

    //     // console.log([...outs[0]])

    //     const expected = [
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }
    //   // return
    //   {
    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.process([], outs)

    //     // console.log([...outs[0]])

    //     const expected = [
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33,
    //       33
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }
    // })

    // it('process - x x, x x x', async () => {
    //   const { frontend, backend } = await prepare()
    //   let sound: Build.Sound

    //   {
    //     const source = { code: `[zero] 42+ LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info)

    //     await backend.setBarAt(0, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.start()
    //     backend.process([], outs)

    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //     ]

    //     expect([...outs[0].slice(0, 38)]).toEqual(expected)
    //     expect([...outs[1].slice(0, 38)]).toEqual(expected)
    //   }

    //   {
    //     const source = { code: `[zero] 42+ LR+=` }
    //     const tokens = Array.from(frontend.tokenize(source))
    //     const info = frontend.produce(tokens)
    //     sound = frontend.compile(info, sound)

    //     await backend.setBarAt(1, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.clock.internalTime = .999
    //     backend.process([], outs)

    //     // console.log([...outs[0]])

    //     const expected = [
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }
    // })

    // it('process - x x, x x -', async () => {
    //   const { frontend, backend } = await prepare()
    //   const source = { code: `[zero] 42+ LR+=` }
    //   const tokens = Array.from(frontend.tokenize(source))
    //   const info = frontend.produce(tokens)
    //   const sound = frontend.compile(info)


    //   {
    //     await backend.setBarAt(0, [sound.payload])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.start()
    //     backend.process([], outs)

    //     const expected = [
    //       0,
    //       0,
    //       0,
    //       0,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //       21,
    //     ]

    //     expect([...outs[0].slice(0, 38)]).toEqual(expected)
    //     expect([...outs[1].slice(0, 38)]).toEqual(expected)
    //   }

    //   {
    //     await backend.setBarAt(1, [])

    //     const outs: [Float32Array, Float32Array] = [
    //       new Float32Array(128),
    //       new Float32Array(128)
    //     ]

    //     backend.clock.internalTime = .997
    //     backend.process([], outs)

    //     // console.log([...outs[0]])
    //     const expected = [
    //       21,
    //       21,
    //       21,
    //       21,
    //       20.34375,
    //       20.34375,
    //       20.34375,
    //       20.34375,
    //       19.6875,
    //       19.6875,
    //       19.6875,
    //       19.6875,
    //       19.03125,
    //       19.03125,
    //       19.03125,
    //       19.03125,
    //       18.375,
    //       18.375,
    //       18.375,
    //       18.375,
    //       17.71875,
    //       17.71875,
    //       17.71875,
    //       17.71875,
    //       17.0625,
    //       17.0625,
    //       17.0625,
    //       17.0625,
    //       16.40625,
    //       16.40625,
    //       16.40625,
    //       16.40625,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.75,
    //       15.09375,
    //       15.09375,
    //       15.09375,
    //       15.09375,
    //       14.4375,
    //       14.4375,
    //       14.4375,
    //       14.4375,
    //       13.78125,
    //       13.78125,
    //       13.78125,
    //       13.78125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       13.125,
    //       12.46875,
    //       12.46875,
    //       12.46875,
    //       12.46875,
    //       11.8125,
    //       11.8125,
    //       11.8125,
    //       11.8125,
    //       11.15625,
    //       11.15625,
    //       11.15625,
    //       11.15625,
    //       10.5,
    //       10.5,
    //       10.5,
    //       10.5,
    //       9.84375,
    //       9.84375,
    //       9.84375,
    //       9.84375,
    //       9.1875,
    //       9.1875,
    //       9.1875,
    //       9.1875,
    //       8.53125,
    //       8.53125,
    //       8.53125,
    //       8.53125,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.875,
    //       7.21875,
    //       7.21875,
    //       7.21875,
    //       7.21875,
    //       6.5625,
    //       6.5625,
    //       6.5625,
    //       6.5625,
    //       5.90625,
    //       5.90625,
    //       5.90625,
    //       5.90625,
    //       5.25,
    //       5.25,
    //       5.25,
    //       5.25,
    //       4.59375,
    //       4.59375,
    //       4.59375,
    //       4.59375,
    //       3.9375,
    //       3.9375,
    //       3.9375,
    //       3.9375,
    //       3.28125,
    //       3.28125,
    //       3.28125,
    //       3.28125,
    //       2.625,
    //       2.625,
    //       2.625,
    //       2.625,
    //       1.96875,
    //       1.96875,
    //       1.96875,
    //       1.96875,
    //       1.3125,
    //       1.3125,
    //       1.3125,
    //       1.3125,
    //       0.65625,
    //       0.65625,
    //       0.65625,
    //       0.65625
    //     ]

    //     expect([...outs[0]]).toEqual(expected)
    //     expect([...outs[1]]).toEqual(expected)
    //   }
    // })
  })
}

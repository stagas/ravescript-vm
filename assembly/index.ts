import { Core, Engine } from './core/engine'
import { Bar, Ctrl, Runner, Signal } from './core/runner'
import { logf } from './env'
import { Atan } from './gen/atan'
import { Bap } from './gen/bap'
import { Bbp } from './gen/bbp'
import { Bhp } from './gen/bhp'
import { Bhs } from './gen/bhs'
import { Blp } from './gen/blp'
import { Bls } from './gen/bls'
import { Bno } from './gen/bno'
import { Bpk } from './gen/bpk'
import { Clamp } from './gen/clamp'
import { Clip } from './gen/clip'
import { Comp } from './gen/comp'
import { Daverb } from './gen/daverb'
import { Dc } from './gen/dc'
import { Dclip } from './gen/dclip'
import { Dclipexp } from './gen/dclipexp'
import { Dcliplin } from './gen/dcliplin'
import { Delay } from './gen/delay'
import { Diode } from './gen/diode'
import { Exp } from './gen/exp'
import { Freesound } from './gen/freesound'
import { Gen } from './gen/gen'
import { Gendy } from './gen/gendy'
import { Grain } from './gen/grain'
import { Inc } from './gen/inc'
import { Lp } from './gen/lp'
import { Mhp } from './gen/mhp'
import { Mlp } from './gen/mlp'
import { Noise } from './gen/noise'
import { Ramp } from './gen/ramp'
import { Rate } from './gen/rate'
import { Sap } from './gen/sap'
import { Saw } from './gen/saw'
import { Say } from './gen/say'
import { Sbp } from './gen/sbp'
import { Shp } from './gen/shp'
import { Sin } from './gen/sin'
import { Slp } from './gen/slp'
import { Sno } from './gen/sno'
import { Spk } from './gen/spk'
import { Sqr } from './gen/sqr'
import { Tanh } from './gen/tanh'
import { Tanha } from './gen/tanha'
import { Tap } from './gen/tap'
import { Tri } from './gen/tri'
import { Zero } from './gen/zero'
import { copyInto, copyMem } from './graph/copy'
import { dcBias } from './graph/dc-bias'
import { fadeIn, fadeOut } from './graph/fade'
import { join21, join21g } from './graph/join'
import { rms } from './graph/rms'
import * as math from './math'
import * as util from './util'

export * from './bench/bench-audio'
export * from './core/constants'

export function preventTreeShaking(gen: Gen): void {
  // we use the entire api here to prevent tree shaking
  // also serves as a quick overview of the api.

  // engine

  const core = new Core(0)
  const engine = new Engine(0, core)
  const engineSignal: Signal = engine.signal
  const rateSamples: u32 = engine.rateSamples
  engine.createBlock(0)
  engine.clock.time = 0

  // runner

  const runner: Runner = engine.runner
  runner.clearLastBar()
  // const main: Ctrl | null = runner.main
  const ctrl: Ctrl = runner.ctrls[0]
  const signal: Signal = ctrl.signal
  runner.fill(0, 0, 0, signal)
  runner.process(0, 0, signal)
  const L: usize = signal.L
  const R: usize = signal.R
  const LR: usize = signal.LR
  ctrl.literalsCount = 0
  ctrl.liveLiterals = 0
  ctrl.ownLiterals = 0
  // runner.freeCtrl(ctrl)
  const bar: Bar | null = runner.bars[0]
  if (bar) {
    bar.tracks[0] = ctrl
    bar.size = 3
    bar.main = 0
  }
  const last: Bar | null = runner.last
  runner.last = bar
  runner.last = null

  // gen

  const zero: Zero = new Zero(engine)
  const zeroSize: usize = util.getObjectSize<Zero>()
  const zeroMem: StaticArray<i32> = util.cloneI32(changetype<usize>(zero), zeroSize)

  const sin: Sin = new Sin(engine)
  const sinSize: usize = util.getObjectSize<Sin>()
  sin.trig = 0

  const exp: Exp = new Exp(engine)
  const expSize: usize = util.getObjectSize<Exp>()

  const saw: Saw = new Saw(engine)
  const sawSize: usize = util.getObjectSize<Saw>()

  const ramp: Ramp = new Ramp(engine)
  const rampSize: usize = util.getObjectSize<Ramp>()

  const sqr: Sqr = new Sqr(engine)
  const sqrSize: usize = util.getObjectSize<Sqr>()

  const tri: Tri = new Tri(engine)
  const triSize: usize = util.getObjectSize<Tri>()

  const noise: Noise = new Noise(engine)
  const noiseSize: usize = util.getObjectSize<Noise>()

  const dc: Dc = new Dc(engine)
  const dcSize: usize = util.getObjectSize<Dc>()

  const delay: Delay = new Delay(engine)
  const delaySize: usize = util.getObjectSize<Delay>()

  const tap: Tap = new Tap(engine)
  const tapSize: usize = util.getObjectSize<Tap>()

  const lp: Lp = new Lp(engine)
  const lpSize: usize = util.getObjectSize<Lp>()

  const rate: Rate = new Rate(engine)
  const rateSize: usize = util.getObjectSize<Rate>()

  const blp: Blp = new Blp(engine)
  const blpSize: usize = util.getObjectSize<Blp>()
  const bhp: Bhp = new Bhp(engine)
  const bhpSize: usize = util.getObjectSize<Bhp>()
  const bbp: Bbp = new Bbp(engine)
  const bbpSize: usize = util.getObjectSize<Bbp>()
  const bno: Bno = new Bno(engine)
  const bnoSize: usize = util.getObjectSize<Bno>()
  const bpk: Bpk = new Bpk(engine)
  const bpkSize: usize = util.getObjectSize<Bpk>()
  const bap: Bap = new Bap(engine)
  const bapSize: usize = util.getObjectSize<Bap>()
  const bls: Bls = new Bls(engine)
  const blsSize: usize = util.getObjectSize<Bls>()
  const bhs: Bhs = new Bhs(engine)
  const bhsSize: usize = util.getObjectSize<Bhs>()

  const slp: Slp = new Slp(engine)
  const slpSize: usize = util.getObjectSize<Slp>()
  const shp: Shp = new Shp(engine)
  const shpSize: usize = util.getObjectSize<Shp>()
  const sbp: Sbp = new Sbp(engine)
  const sbpSize: usize = util.getObjectSize<Sbp>()
  const sap: Sap = new Sap(engine)
  const sapSize: usize = util.getObjectSize<Sap>()
  const sno: Sno = new Sno(engine)
  const snoSize: usize = util.getObjectSize<Sno>()
  const spk: Spk = new Spk(engine)
  const spkSize: usize = util.getObjectSize<Spk>()

  const mlp: Mlp = new Mlp(engine)
  const mlpSize: usize = util.getObjectSize<Mlp>()
  const mhp: Mhp = new Mhp(engine)
  const mhpSize: usize = util.getObjectSize<Mhp>()

  const daverb: Daverb = new Daverb(engine)
  const daverbSize: usize = util.getObjectSize<Daverb>()

  const tanha: Tanha = new Tanha(engine)
  const tanhaSize: usize = util.getObjectSize<Tanha>()
  
  const tanh: Tanh = new Tanh(engine)
  const tanhSize: usize = util.getObjectSize<Tanh>()

  const atan: Atan = new Atan(engine)
  const atanSize: usize = util.getObjectSize<Atan>()

  const grain: Grain = new Grain(engine)
  const grainSize: usize = util.getObjectSize<Grain>()

  const gendy: Gendy = new Gendy(engine)
  const gendySize: usize = util.getObjectSize<Gendy>()

  const diode: Diode = new Diode(engine)
  const diodeSize: usize = util.getObjectSize<Diode>()

  const dclip: Dclip = new Dclip(engine)
  const dclipSize: usize = util.getObjectSize<Dclip>()

  const dcliplin: Dcliplin = new Dcliplin(engine)
  const dcliplinSize: usize = util.getObjectSize<Dcliplin>()

  const dclipexp: Dclipexp = new Dclipexp(engine)
  const dclipexpSize: usize = util.getObjectSize<Dclipexp>()

  const clamp: Clamp = new Clamp(engine)
  const clampSize: usize = util.getObjectSize<Clamp>()

  const clip: Clip = new Clip(engine)
  const clipSize: usize = util.getObjectSize<Clip>()

  const comp: Comp = new Comp(engine)
  const compSize: usize = util.getObjectSize<Comp>()

  const inc: Inc = new Inc(engine)
  const incSize: usize = util.getObjectSize<Inc>()
  inc.trig = 0

  const freesound: Freesound = new Freesound(engine)
  const freesoundSize: usize = util.getObjectSize<Freesound>()
  logf(freesound.id)

  const say: Say = new Say(engine)
  const saySize: usize = util.getObjectSize<Say>()

  gen._update()
  gen._reset()
  gen._audio(0, 0, 0)

  // math

  math.pow_audio_scalar(0, 0, 0, 0, 0)
  math.pow_scalar_audio(0, 0, 0, 0, 0)
  math.pow_scalar_scalar(0, 0)

  math.mul_audio_scalar(0, 0, 0, 0, 0)
  math.mul_audio_audio(0, 0, 0, 0, 0)

  math.div_audio_scalar(0, 0, 0, 0, 0)
  math.div_scalar_audio(0, 0, 0, 0, 0)

  math.add_audio_scalar(0, 0, 0, 0, 0)
  math.add_audio_audio(0, 0, 0, 0, 0)

  math.sub_audio_scalar(0, 0, 0, 0, 0)
  math.sub_audio_audio(0, 0, 0, 0, 0)

  math.not_audio(0, 0, 0, 0)

  math.to_audio_scalar(0, 0, 0, 0)

  // graph

  fadeIn(0, 0, 0, 0)
  fadeOut(0, 0, 0, 0)
  join21g(0, 0, 0, 0, 0, 0, 0)
  join21(0, 0, 0, 0, 0)
  dcBias(0, 0, 0)
  rms(0, 0, 0)
  copyMem(0, 0, 0)
  copyInto(0, 0, 0, 0)
}

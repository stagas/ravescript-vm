// math_op(out_0, 80.0, begin, i, out_1)

import { logi } from './env'

export function pow_scalar_scalar(
  n1: f32,
  n2: f32,
): f32 {
  return Mathf.pow(n1, n2)
}

export function pow_audio_scalar(
  in0: usize,
  scalar: f32,
  begin: u32,
  end: u32,
  out: usize,
): void {
  let inp: f32
  let res: f32

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  out += offset

  for (; i < end; i += 16) {
    unroll(16, () => {
      inp = f32.load(in0)
      res = Mathf.pow(inp, scalar)
      f32.store(out, res)
      inp += 4
      out += 4
    })
  }
}

export function pow_scalar_audio(
  scalar: f32,
  in0: usize,
  begin: u32,
  end: u32,
  out: usize,
): void {
  let inp: f32
  let res: f32

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  out += offset

  for (; i < end; i += 16) {
    unroll(16, () => {
      inp = f32.load(in0)
      res = Mathf.pow(scalar, inp)
      f32.store(out, res)
      inp += 4
      out += 4
    })
  }
}

export function mul_audio_scalar(
  in0: usize,
  scalar: f32,
  begin: u32,
  end: u32,
  out: usize,
): void {
  const scalarv: v128 = f32x4.splat(scalar)

  let in0v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      resv = f32x4.mul(in0v, scalarv)
      v128.store(out, resv)
      in0 += 16
      out += 16
    })
  }
}

export function div_audio_scalar(
  in0: usize,
  scalar: f32,
  begin: u32,
  end: u32,
  out: usize,
): void {
  const scalarv: v128 = f32x4.splat(scalar)

  let in0v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      resv = f32x4.div(in0v, scalarv)
      v128.store(out, resv)
      in0 += 16
      out += 16
    })
  }
}

export function div_scalar_audio(
  scalar: f32,
  in0: usize,
  begin: u32,
  end: u32,
  out: usize,
): void {
  const scalarv: v128 = f32x4.splat(scalar)

  let in0v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      resv = f32x4.div(scalarv, in0v)
      v128.store(out, resv)
      in0 += 16
      out += 16
    })
  }
}

export function add_audio_scalar(
  in0: usize,
  scalar: f32,
  begin: u32,
  end: u32,
  out: usize,
): void {
  const scalarv: v128 = f32x4.splat(scalar)

  let in0v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      resv = f32x4.add(in0v, scalarv)
      v128.store(out, resv)
      in0 += 16
      out += 16
    })
  }
}

export function sub_audio_scalar(
  in0: usize,
  scalar: f32,
  begin: u32,
  end: u32,
  out: usize,
): void {
  const scalarv: v128 = f32x4.splat(scalar)

  let in0v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      resv = f32x4.sub(in0v, scalarv)
      v128.store(out, resv)
      in0 += 16
      out += 16
    })
  }
}

export function add_audio_audio(
  in0: usize,
  in1: usize,
  begin: u32,
  end: u32,
  out: usize,
): void {
  let in0v: v128
  let in1v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  in1 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      in1v = v128.load(in1)
      resv = f32x4.add(in0v, in1v)
      v128.store(out, resv)
      in0 += 16
      in1 += 16
      out += 16
    })
  }
}

export function addmul_audio_audio_scalar(
  in0: usize,
  in1: usize,
  scalar: f32,
  begin: u32,
  end: u32,
  out: usize,
): void {
  const scalarv: v128 = f32x4.splat(scalar)

  let in0v: v128
  let in1v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  in1 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      in1v = v128.load(in1)
      resv = f32x4.add(in0v, in1v)
      resv = f32x4.mul(resv, scalarv)
      v128.store(out, resv)
      in0 += 16
      in1 += 16
      out += 16
    })
  }
}

export function sub_audio_audio(
  in0: usize,
  in1: usize,
  begin: u32,
  end: u32,
  out: usize,
): void {
  let in0v: v128
  let in1v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  in1 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      in1v = v128.load(in1)
      resv = f32x4.sub(in0v, in1v)
      v128.store(out, resv)
      in0 += 16
      in1 += 16
      out += 16
    })
  }
}

export function mul_audio_audio(
  in0: usize,
  in1: usize,
  begin: u32,
  end: u32,
  out: usize,
): void {
  let in0v: v128
  let in1v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  in1 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      in1v = v128.load(in1)
      resv = f32x4.mul(in0v, in1v)
      v128.store(out, resv)
      in0 += 16
      in1 += 16
      out += 16
    })
  }
}

export function div_audio_audio(
  in0: usize,
  in1: usize,
  begin: u32,
  end: u32,
  out: usize,
): void {
  let in0v: v128
  let in1v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  in1 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      in1v = v128.load(in1)
      resv = f32x4.div(in0v, in1v)
      v128.store(out, resv)
      in0 += 16
      in1 += 16
      out += 16
    })
  }
}

export function not_audio(
  in0: usize,
  begin: u32,
  end: u32,
  out: usize,
): void {
  const minus1v: v128 = f32x4.splat(-1.0)

  let in0v: v128
  let resv: v128

  let i: u32 = begin

  const offset = begin << 2
  in0 += offset
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      in0v = v128.load(in0)
      resv = f32x4.mul(in0v, minus1v)
      v128.store(out, resv)
      in0 += 16
      out += 16
    })
  }
}

export function to_audio_scalar(
  scalar: f32,
  begin: u32,
  end: u32,
  out: usize,
): void {
  const scalarv: v128 = f32x4.splat(scalar)

  let i: u32 = begin

  const offset = begin << 2
  out += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      v128.store(out, scalarv)
      out += 16
    })
  }
}

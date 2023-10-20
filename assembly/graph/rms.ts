export function rms(
  begin: u32,
  end: u32,
  block: i32
): f32 {
  let sumv: v128 = f32x4.splat(0)
  let sv: v128 = f32x4.splat(0)
  const total: f32 = f32(end - begin)

  let i: u32 = begin

  const offset = begin << 2
  block += offset

  for (; i < end; i += 64) {
    unroll(16, () => {
      sv = v128.load(block)

      sumv = f32x4.add(
        sumv,
        f32x4.mul(sv, sv)
      )

      block += 16
    })
  }

  const sum: f32 =
    f32x4.extract_lane(sumv, 0) +
    f32x4.extract_lane(sumv, 1) +
    f32x4.extract_lane(sumv, 2) +
    f32x4.extract_lane(sumv, 3)

  return Mathf.sqrt(sum / total)
}

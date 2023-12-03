declare namespace __AdaptedExports {
  /** Exported memory */
  export const memory: WebAssembly.Memory;
  /**
   * assembly/index/preventTreeShaking
   * @param gen `assembly/gen/gen/Gen`
   */
  export function preventTreeShaking(gen: __Internref8): void;
  /**
   * assembly/bench/bench-audio/benchAudio
   * @param gen `assembly/gen/gen/Gen`
   * @param targetPtr `usize`
   * @param times `u32`
   */
  export function benchAudio(gen: __Internref8, targetPtr: number, times: number): void;
  /**
   * assembly/bench/bench-audio/benchAudioGain
   * @param gen `assembly/gen/gen/Gen`
   * @param targetPtr `usize`
   * @param times `u32`
   */
  export function benchAudioGain(gen: __Internref8, targetPtr: number, times: number): void;
  /**
   * assembly/bench/bench-audio/benchAudioTwo
   * @param gen0 `assembly/gen/gen/Gen`
   * @param gen1 `assembly/gen/gen/Gen`
   * @param out0 `usize`
   * @param out1 `usize`
   * @param targetPtr `usize`
   * @param times `u32`
   */
  export function benchAudioTwo(gen0: __Internref8, gen1: __Internref8, out0: number, out1: number, targetPtr: number, times: number): void;
  /** assembly/core/constants/WAVETABLE_SIZE */
  export const WAVETABLE_SIZE: {
    /** @type `u32` */
    get value(): number
  };
  /** assembly/core/constants/DELAY_MAX_SIZE */
  export const DELAY_MAX_SIZE: {
    /** @type `u32` */
    get value(): number
  };
  /** assembly/core/constants/SAMPLE_MAX_SIZE */
  export const SAMPLE_MAX_SIZE: {
    /** @type `u32` */
    get value(): number
  };
  /** assembly/core/constants/ANTIALIAS_WAVETABLE_OVERSAMPLING */
  export const ANTIALIAS_WAVETABLE_OVERSAMPLING: {
    /** @type `u32` */
    get value(): number
  };
}
/** assembly/gen/gen/Gen */
declare class __Internref8 extends Number {
  private __nominal8: symbol;
  private __nominal0: symbol;
}
/** Instantiates the compiled WebAssembly module with the given imports. */
export declare function instantiate(module: WebAssembly.Module, imports: {
  env: unknown,
}): Promise<typeof __AdaptedExports>;

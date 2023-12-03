declare namespace __AdaptedExports {
  /** Exported memory */
  export const memory: WebAssembly.Memory;
  /** assembly/asc-runtime/memory-allocator/offset */
  export const offset: {
    /** @type `usize` */
    get value(): number;
    set value(value: number);
  };
  /**
   * assembly/asc-runtime/memory-allocator/__alloc
   * @param size `usize`
   * @returns `usize`
   */
  export function __alloc(size: number): number;
  /**
   * assembly/asc-runtime/memory-allocator/__realloc
   * @param ptr `usize`
   * @param size `usize`
   * @returns `usize`
   */
  export function __realloc(ptr: number, size: number): number;
  /**
   * assembly/asc-runtime/memory-allocator/__free
   * @param ptr `usize`
   */
  export function __free(ptr: number): void;
  /**
   * assembly/asc-runtime/memory-allocator/__reset
   */
  export function __reset(): void;
  /**
   * assembly/asc-runtime/memory-allocator/__new
   * @param size `usize`
   * @param id `u32`
   * @returns `usize`
   */
  export function __new(size: number, id: number): number;
  /**
   * assembly/asc-runtime/memory-allocator/__renew
   * @param oldPtr `usize`
   * @param size `usize`
   * @returns `usize`
   */
  export function __renew(oldPtr: number, size: number): number;
  /**
   * assembly/asc-runtime/memory-allocator/__link
   * @param parentPtr `usize`
   * @param childPtr `usize`
   * @param expectMultiple `bool`
   */
  export function __link(parentPtr: number, childPtr: number, expectMultiple: boolean): void;
  /**
   * assembly/asc-runtime/memory-allocator/__pin
   * @param ptr `usize`
   * @returns `usize`
   */
  export function __pin(ptr: number): number;
  /**
   * assembly/asc-runtime/memory-allocator/__unpin
   * @param ptr `usize`
   */
  export function __unpin(ptr: number): void;
  /**
   * assembly/asc-runtime/memory-allocator/__collect
   */
  export function __collect(): void;
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

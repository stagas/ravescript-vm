export declare function logi(i: i32): void
export declare function logf(f: f32): void
export declare function logd(d: f64): void

export declare function setCtrlInstanceAt(instanceId: u32, tableIndex: u32): bool
export declare function resetCtrlInstance(instanceId: u32): bool

export declare const timeFFT: u32
export declare const freqFFT: u32
export declare function pffft_runner_forward(runner: u32, audio: u32, fft: u32): void
export declare function pffft_runner_inverse(runner: u32, fft: u32, audio: u32): void
export declare function pffft_runner_magnitudes(runner: u32, fft: u32, mags: u32): void
export declare function pffft_runner_free(runner: u32): void
export declare function pffft_runner_destroy(runner: u32): void

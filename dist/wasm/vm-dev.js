export async function instantiate(module, imports = {}) {
  const adaptedImports = {
    env: Object.assign(Object.create(globalThis), imports.env || {}, {
      abort(message, fileName, lineNumber, columnNumber) {
        // ~lib/builtins/abort(~lib/string/String | null?, ~lib/string/String | null?, u32?, u32?) => void
        message = __liftString(message >>> 0);
        fileName = __liftString(fileName >>> 0);
        lineNumber = lineNumber >>> 0;
        columnNumber = columnNumber >>> 0;
        (() => {
          // @external.js
          throw Error(`${message} in ${fileName}:${lineNumber}:${columnNumber}`);
        })();
      },
      setCtrlInstanceAt(instanceId, tableIndex) {
        // assembly/env/setCtrlInstanceAt(u32, u32) => bool
        instanceId = instanceId >>> 0;
        tableIndex = tableIndex >>> 0;
        return setCtrlInstanceAt(instanceId, tableIndex) ? 1 : 0;
      },
      resetCtrlInstance(instanceId) {
        // assembly/env/resetCtrlInstance(u32) => bool
        instanceId = instanceId >>> 0;
        return resetCtrlInstance(instanceId) ? 1 : 0;
      },
    }),
  };
  const { exports } = await WebAssembly.instantiate(module, adaptedImports);
  const memory = exports.memory || imports.env.memory;
  const adaptedExports = Object.setPrototypeOf({
    offset: {
      // assembly/asc-runtime/memory-allocator/offset: usize
      valueOf() { return this.value; },
      get value() {
        return exports.offset.value >>> 0;
      },
      set value(value) {
        exports.offset.value = value;
      }
    },
    __alloc(size) {
      // assembly/asc-runtime/memory-allocator/__alloc(usize) => usize
      return exports.__alloc(size) >>> 0;
    },
    __realloc(ptr, size) {
      // assembly/asc-runtime/memory-allocator/__realloc(usize, usize) => usize
      return exports.__realloc(ptr, size) >>> 0;
    },
    __new(size, id) {
      // assembly/asc-runtime/memory-allocator/__new(usize, u32) => usize
      return exports.__new(size, id) >>> 0;
    },
    __renew(oldPtr, size) {
      // assembly/asc-runtime/memory-allocator/__renew(usize, usize) => usize
      return exports.__renew(oldPtr, size) >>> 0;
    },
    __link(parentPtr, childPtr, expectMultiple) {
      // assembly/asc-runtime/memory-allocator/__link(usize, usize, bool) => void
      expectMultiple = expectMultiple ? 1 : 0;
      exports.__link(parentPtr, childPtr, expectMultiple);
    },
    __pin(ptr) {
      // assembly/asc-runtime/memory-allocator/__pin(usize) => usize
      return exports.__pin(ptr) >>> 0;
    },
    preventTreeShaking(gen) {
      // assembly/index/preventTreeShaking(assembly/gen/gen/Gen) => void
      gen = __lowerInternref(gen) || __notnull();
      exports.preventTreeShaking(gen);
    },
    benchAudio(gen, targetPtr, times) {
      // assembly/bench/bench-audio/benchAudio(assembly/gen/gen/Gen, usize, u32) => void
      gen = __lowerInternref(gen) || __notnull();
      exports.benchAudio(gen, targetPtr, times);
    },
    benchAudioGain(gen, targetPtr, times) {
      // assembly/bench/bench-audio/benchAudioGain(assembly/gen/gen/Gen, usize, u32) => void
      gen = __lowerInternref(gen) || __notnull();
      exports.benchAudioGain(gen, targetPtr, times);
    },
    benchAudioTwo(gen0, gen1, out0, out1, targetPtr, times) {
      // assembly/bench/bench-audio/benchAudioTwo(assembly/gen/gen/Gen, assembly/gen/gen/Gen, usize, usize, usize, u32) => void
      gen0 = __retain(__lowerInternref(gen0) || __notnull());
      gen1 = __lowerInternref(gen1) || __notnull();
      try {
        exports.benchAudioTwo(gen0, gen1, out0, out1, targetPtr, times);
      } finally {
        __release(gen0);
      }
    },
    WAVETABLE_SIZE: {
      // assembly/core/constants/WAVETABLE_SIZE: u32
      valueOf() { return this.value; },
      get value() {
        return exports.WAVETABLE_SIZE.value >>> 0;
      }
    },
    DELAY_MAX_SIZE: {
      // assembly/core/constants/DELAY_MAX_SIZE: u32
      valueOf() { return this.value; },
      get value() {
        return exports.DELAY_MAX_SIZE.value >>> 0;
      }
    },
    SAMPLE_MAX_SIZE: {
      // assembly/core/constants/SAMPLE_MAX_SIZE: u32
      valueOf() { return this.value; },
      get value() {
        return exports.SAMPLE_MAX_SIZE.value >>> 0;
      }
    },
    ANTIALIAS_WAVETABLE_OVERSAMPLING: {
      // assembly/core/constants/ANTIALIAS_WAVETABLE_OVERSAMPLING: u32
      valueOf() { return this.value; },
      get value() {
        return exports.ANTIALIAS_WAVETABLE_OVERSAMPLING.value >>> 0;
      }
    },
  }, exports);
  function __liftString(pointer) {
    if (!pointer) return null;
    const
      end = pointer + new Uint32Array(memory.buffer)[pointer - 4 >>> 2] >>> 1,
      memoryU16 = new Uint16Array(memory.buffer);
    let
      start = pointer >>> 1,
      string = "";
    while (end - start > 1024) string += String.fromCharCode(...memoryU16.subarray(start, start += 1024));
    return string + String.fromCharCode(...memoryU16.subarray(start, end));
  }
  class Internref extends Number {}
  function __lowerInternref(value) {
    if (value == null) return 0;
    if (value instanceof Internref) return value.valueOf();
    throw TypeError("internref expected");
  }
  const refcounts = new Map();
  function __retain(pointer) {
    if (pointer) {
      const refcount = refcounts.get(pointer);
      if (refcount) refcounts.set(pointer, refcount + 1);
      else refcounts.set(exports.__pin(pointer), 1);
    }
    return pointer;
  }
  function __release(pointer) {
    if (pointer) {
      const refcount = refcounts.get(pointer);
      if (refcount === 1) exports.__unpin(pointer), refcounts.delete(pointer);
      else if (refcount) refcounts.set(pointer, refcount - 1);
      else throw Error(`invalid refcount '${refcount}' for reference '${pointer}'`);
    }
  }
  function __notnull() {
    throw TypeError("value must not be null");
  }
  return adaptedExports;
}

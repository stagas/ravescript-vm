/*
  This file exports the ByteCodeContainer class, which provides a nice interface for writing WebAssembly bytecode.

  Structure of the file:
    1. The ByteCodeContainer class definition
    2. Utility functions and constants, mostly for numeric encoding
    3. The codeTable used by ByteCodeContainer.byte to allow specifying things like opcodes via string descriptors
*/
import { CompileError } from "./compileError";
import { generate } from "./functionCodeGen";
import { ASTNode, Def, RunType } from "./parser";
import { VOID } from "./syntax";


/*
  ByteCodeContainers store bytecode in an annotated format (for debugging purposes).

  In order to actually use the stored bytecode, you need to call .toByteArray() and send the result to something like WebAssembly.compile().
  Note, however, that the annotated format is not very memory efficient at all (an object is allocated for nearly every byte in the output).

  Most of this class's methods accept a "field" argument that specifies the purpose of the bytes being encoded.
  This allows clean debugging output (see the "Bytecode" panel in the WebBS editor),
    and has the additional pleasant side-effect of making the code generation functions nearly completely self-documenting.

  Additionally, nearly all of this class's methods return the instance on which the method was called.
    This allows for a concise chained calling convention that comes up in the other code generation files.
*/

type Field = string

interface BytesPart {
  byte?: number
  bytes?: number[] | Uint8Array
  field: Field
  path: string
  value: number | string
}

export class ByteCodeContainer {
  parts: BytesPart[]
  totalSize: number
  reservedSizeRecord: BytesPart | null

  constructor(public path: any, public parent: ByteCodeContainer | null = null) {
    this.parts = parent === null ? [] : parent.parts; // If this isn't the top-level container, we actually inject bytes into the parent.
    this.totalSize = 0;
    this.reservedSizeRecord = null;
  }


  /*
    This stores a single byte, from a string descriptor (see codeTable below).
  */
  byte(code: number | string, field: Field) {
    return this.bytes(codeTable[code], field, code);
  }


  /*
    This stores an array of pre-encoded bytes.
  */
  bytes(bytes: number[] | Uint8Array, field: Field, value: number | string) {
    this.parts.push({ bytes, field, path: `${this.path}|${field}`, value });
    this.totalSize += bytes.length;
    return this;
  }


  /*
    This finishes encoding the current section (by recording the payload size, if necessary) and returns the section's parent.
  */
  finishSection() {
    // If we've reserved a section to encode a payload size, we need to go back and fill that in.
    const record = this.reservedSizeRecord;
    if (record !== null) {
      // Here we use the non-payload size we recorded before to get the payload size (see the reserveSize method below for more info).
      const size = this.totalSize - <number>record.value;
      record.bytes = uLEB(size);
      record.value = size;
      this.totalSize += record.bytes.length;  // Update the total size since we added some bytes to record the payload size.
    }

    // Now that we're completely done with this section, we're going to add it to its parent.
    //this.parent.parts = this.parent.parts.concat(this.parts);
    this.parent!.totalSize += this.totalSize;

    // Finally, return the parent, so chaining can continue from there.
    return this.parent;
  }


  /*
    This is a wrapper around the generate function in /functionCodeGen.js,
      exposed so that it can be called via the chained style used for interacting with ByteCodeContainer objects.
  */
  generate(node: ASTNode, depth: number) {
    generate(this, node, depth);
    return this;
  }


  /*
    This is a wrapper around the generate function in /functionCodeGen.js that calls generate() on every item in a list,
      exposed so that it can be called via the chained style used for interacting with ByteCodeContainer objects.
  */
  generateEach(list: ASTNode[], depth: number) {
    for (const node of list) {
      generate(this, node, depth);
    }
    return this;
  }

  /*
    This is a convenience method that generates code to read a variable, given its index and a Boolean that indicates whether it's a global.
  */
  getVariable(index: number, isGlobal: boolean) {
    if (isGlobal) {
      return this.op("get_global").varuint(index, "global_index");
    } else {
      return this.op("get_local").varuint(index, "local_index");
    }
  }


  /*
    This encodes the common fields that precede an import definition, i.e.
      module_len
      module
      field_len
      field
      kind
  */
  importDefinition(definition: Def) {
    const [module, field] = definition.importSource!;
    return this
      .string(module, "module")
      .string(field, "field")
      .byte(`external_kind.${definition.kind}`, "kind");
  }


  /*
    This encodes record a numeric literal of the provided runType.
  */
  literal(runType: RunType, value: number | number[], field: Field) {
    if (runType === "i32" || runType === "i64") {
      // The limits for integer literals have already been checked during the validation stage,
      //  so we can just use LEB here with no size limits and trust that we get any acceptable sequence for both i32 and i64 values.
      this.bytes(LEB(<number>value), field, <number>value);
    } else if (runType === "f32") {
      this.bytes(f32(<number>value), field, <number>value);
    } else if (runType === "f64") {
      this.bytes(f64(<number>value), field, <number>value);
    } else if (runType === "v128") {
      this.bytes(v128(<number>value), field, <number>value);
    }
    return this;
  }


  /*
    This is a convenience method for enoding bytecode operators.
  */
  op(code: number | string) {
    return this.byte(code, "op");
  }


  /*
    The WASM specification requires that various sections are prefixed with a field that says how many bytes will follow in that section.
    We don't have that information until we're done encoding the section,
      so what we do here is mark off a segment as a placeholder, which we'll eventually fill with the final payload size.
  */
  reserveSize(field: Field) {
    /*
      Sections usually have a few prefix bytes before the payload begins, some bytes that reflect the size of the payload, then the payload.
      When this method is called, this.totalSize reflects the size of the prefix.
      When we finish encoding the payload, but before we add those payload-size-recording bytes in the middle,
        the total size of the section is equal to the size of the prefix + the payload size.
      Therefore, we can calulcate the payload size by subtracting the value of this.totalSize now from the value of this.totalSize later.
      So we temporarily store the current totalSize in the placeholder we're going to fill up later, so it's available when we need it.
    */
    this.bytes([], field, this.totalSize);
    this.reservedSizeRecord = this.parts[this.parts.length - 1];
    return this;
  }


  /*
    This encodes a size limits specification, featuring an initial and (optional) maximum size.
  */
  resizableLimits(definition: Def) {
    // TODO: this is modified temporarily to hardcode "shared" memory, but min, minmax should also work
    // we need to add a keyword to the syntax in order to be possible to differentiate among the three cases
    if (definition.maxSize.ASType === VOID) {
      this
        .byte("limits.shared", "limits")
        .varuint(definition.initialSize.meta.value, "initial")
        .varuint(definition.initialSize.meta.value, "maximum");
    } else {
      this
        .byte("limits.shared", "limits")
        .varuint(definition.initialSize.meta.value, "initial")
        .varuint(definition.maxSize.meta.value, "maximum");
    }
    return this;
  }


  /*
    This creates a new section/sub-section within the bytecode container.

    It's actually another ByteCodeContainer instance, with all the associated state information,
      but any byte sequences written to it will be directly injected into the parent ByteCodeContainer.

    The annotated path for bytes written to this sub-section extends the path of the parent.
  */
  section(name: string) {
    return new ByteCodeContainer(`${this.path}|${name}`, this);
  }


  /*
    This is a convenience method that generates code to set a variable, given:
    - The variable's index in its respective index space
    - A Boolean that indicates whether the variable is a global
    - A Boolean that indicates whether or not the stored value should be kept on the stack after the assignment
  */
  setVariable(index: number, isGlobal: boolean, tee: boolean) {
    if (isGlobal) {
      if (tee) {
        this
          .op("set_global").varuint(index, "global_index")
          .op("get_global").varuint(index, "global_index");
      } else {
        this.op("set_global").varuint(index, "global_index");
      }
    } else if (tee) {
      this.op("tee_local").varuint(index, "local_index");
    } else {
      this.op("set_local").varuint(index, "local_index");
    }
    return this
  }


  /*
    This encodes a UTF8 string (e.g. for import/export names).
    Note that this assumes the string is coming from WebBS source written by the user, so forward-slash escape sequences are un-escaped.
  */
  string(string: string, field: Field) {
    const formattedString = string.replace(unescapeRegex, "$1");
    const bytes = UTF8Encoder.encode(formattedString);  // Strings in JS are UTF16 (sigh) so we have to convert them to UTF8 before storage.
    this.varuint(bytes.length, `${field}_len`); // Strings in WebAssembly bytecode are prefixed by a length varuint.
    return this.bytes(bytes, field, string);
  }


  /*
    This returns the complete module bytecode as a Uint8Array, suitable for the final compilation into a WebAssembly module,
      e.g. via WebAssembly.compile().
  */
  toByteArray() {
    const bytes = new Uint8Array(new SharedArrayBuffer(this.totalSize));
    let i = 0;
    for (const part of this.parts) {
      bytes.set(part.bytes!, i);
      i += part.bytes!.length;
    }
    return bytes;
  }


  /*
    This encodes a variable length integer (e.g. an index of some sort).
    It's just a wrapper around the uLEB function defined below.
    Note that this is distinct from the way i32 literals are encoded, which uses the signed LEB enconding.
  */
  varuint(value: number, field: Field, bound = 32) {
    if (!Number.isInteger(value) || value < 0 || value > 2 ** bound - 1) {
      throw new CompileError("Integer Out of Range in Code Generation", {});
    }
    return this.bytes(uLEB(value), field, value);
  }


  /*
    WASM modules start with a specific sequence of bytes, which we encode here.
  */
  WASMModuleHeader() {
    return this
      .bytes([0x00, 0x61, 0x73, 0x6D], "magic number", "\"\\0asm\"")
      .bytes([0x01, 0x00, 0x00, 0x00], "version", 1);
  }
}


/*
  Utilities
*/

// This is a temporary buffer that we use to extract the bytes from 32/64-bit/f32x4/f64x2 floats in a predictable order.
const byteView = new DataView((new Float64Array(2)).buffer);

// This is used by ByteCodeContainer.string to remove forward-slash escapes in strings.
const unescapeRegex = /\\(.)/g;

// This is used by ByteCodeContainer.string to convert from UTF16 to UTF8.
const UTF8Encoder = new TextEncoder();


/*
  This is a utility function for encoding 32-bit floats into predictably ordered 4 byte segments.
*/
function f32(value: number) {
  byteView.setFloat32(0, value);
  return [
    byteView.getUint8(3),
    byteView.getUint8(2),
    byteView.getUint8(1),
    byteView.getUint8(0)
  ];
}


/*
  This is a utility function for encoding 64-bit floats into predictably ordered 8 byte segments.
*/
function f64(value: number) {
  byteView.setFloat64(0, value);
  return [
    byteView.getUint8(7),
    byteView.getUint8(6),
    byteView.getUint8(5),
    byteView.getUint8(4),
    byteView.getUint8(3),
    byteView.getUint8(2),
    byteView.getUint8(1),
    byteView.getUint8(0)
  ];
}


/*
  This is a utility function for encoding f32x4, f64x2 floats into predictably ordered 16 byte segments.
*/
function v128(values: number | number[]) {
  if (typeof values === 'number') {
    values = [values, values]
  }

  const lanes = values.length
  if (lanes === 2) {
    for (let i = 0; i < values.length; i++) {
      byteView.setFloat64(i * 8, values[values.length - 1 - i]);
    }
  } else if (lanes === 4) {
    for (let i = 0; i < values.length; i++) {
      byteView.setFloat32(i * 4, values[values.length - 1 - i]);
    }
  }
  return [
    byteView.getUint8(15),
    byteView.getUint8(14),
    byteView.getUint8(13),
    byteView.getUint8(12),
    byteView.getUint8(11),
    byteView.getUint8(10),
    byteView.getUint8(9),
    byteView.getUint8(8),
    byteView.getUint8(7),
    byteView.getUint8(6),
    byteView.getUint8(5),
    byteView.getUint8(4),
    byteView.getUint8(3),
    byteView.getUint8(2),
    byteView.getUint8(1),
    byteView.getUint8(0)
  ];
}


/*
  This implements signed LEB128 encoding for integers.
    LEB128 is a variable-length format. See https://en.wikipedia.org/wiki/LEB128 for more information.
    Due to limitations on the JS native number encoding format, this will likely only work for numbers in the safe integer range.
*/
function LEB(number: number, buffer: number[] = []): number[] {
  const byte = number & 0b01111111;
  const signBit = byte & 0b01000000;
  number = number >> 7;

  if ((number === 0 && signBit === 0) || (number === -1 && signBit !== 0)) {
    buffer.push(byte);
    return buffer;
  } else {
    buffer.push(byte | 0b10000000);
    return LEB(number, buffer);
  }
}


/*
  This implements unsigned LEB128 encoding for integers.
    LEB128 is a variable-length format. See https://en.wikipedia.org/wiki/LEB128 for more information.
    Due to limitations on the JS native number encoding format, this will likely only work for numbers in the safe integer range.
*/
function uLEB(number: number, buffer: number[] = []): number[] {
  const byte = number & 0b01111111;
  number = number >>> 7;

  if (number === 0) {
    buffer.push(byte);
    return buffer;
  } else {
    buffer.push(byte | 0b10000000);
    return uLEB(number, buffer);
  }
}


/*
  The codeTable maps string descriptors to numeric values that will appear in bytecode.

  This lets us refer to things like operators by name.
  In many ways it would be wiser to define each of these bytes as an exported constant,
    similar to the way ASTypes are defined in /syntax.js,
    as that approach is somewhat more resiliant against typos.
  At the same time, that would complicate the module dependency structure and would end up being very verbose.

  We initially populate this table with with non-instructional reference codes, then fill in all the defined WebAssembly instructions below.
*/

type CodeTable = Record<string | number, number[]>

const codeTable: CodeTable = {
  "i32": [0x7f],
  "i64": [0x7e],
  "f32": [0x7d],
  "f64": [0x7c],
  "v128": [0x7b],
  "anyfunc": [0x70],
  "func": [0x60],
  "void": [0x40],
  "section.type": [0x01],
  "section.import": [0x02],
  "section.function": [0x03],
  "section.table": [0x04],
  "section.memory": [0x05],
  "section.global": [0x06],
  "section.export": [0x07],
  "section.start": [0x08],
  "section.element": [0x09],
  "section.code": [0x0a],
  "section.data": [0x0b],
  "external_kind.function": [0x00],
  "external_kind.table": [0x01],
  "external_kind.memory": [0x02],
  "external_kind.global": [0x03],
  "global.immutable": [0x00],
  "global.mutable": [0x01],
  "limits.min": [0x00],
  "limits.minmax": [0x01],
  "limits.shared": [0x03],
};


/*
  The WebAssembly binary encoding documentation specifies all the instruction byte codes.
  See the MVP documentation (which is no longer maintained):
    https://webassembly.org/docs/binary-encoding/
  Or the normative post-MVP documentation (which is much more precise and complete, if perhaps less readable):
    http://webassembly.github.io/spec/core/binary/index.html

  This is a consecutive list of the entire range of instruction codes (with nulls in place of unused/reserved spaces).
  The codeTable is populated by assigning 0x00 to "unreachable", 0x01 to "nop", and so on (skipping the unused slots).
*/
const opCodes = ["unreachable", "nop", "block", "loop", "if", "else", null, null, null, null, null, "end", "br", "br_if", "br_table", "return", "call", "call_indirect", null, null, null, null, null, null, null, null, "drop", "select", null, null, null, null, "get_local", "set_local", "tee_local", "get_global", "set_global", null, null, null, "i32.load", "i64.load", "f32.load", "f64.load", "i32.load8_s", "i32.load8_u", "i32.load16_s", "i32.load16_u", "i64.load8_s", "i64.load8_u", "i64.load16_s", "i64.load16_u", "i64.load32_s", "i64.load32_u", "i32.store", "i64.store", "f32.store", "f64.store", "i32.store8", "i32.store16", "i64.store8", "i64.store16", "i64.store32", "current_memory", "grow_memory", "i32.const", "i64.const", "f32.const", "f64.const", "i32.eqz", "i32.eq", "i32.ne", "i32.lt_s", "i32.lt_u", "i32.gt_s", "i32.gt_u", "i32.le_s", "i32.le_u", "i32.ge_s", "i32.ge_u", "i64.eqz", "i64.eq", "i64.ne", "i64.lt_s", "i64.lt_u", "i64.gt_s", "i64.gt_u", "i64.le_s", "i64.le_u", "i64.ge_s", "i64.ge_u", "f32.eq", "f32.ne", "f32.lt", "f32.gt", "f32.le", "f32.ge", "f64.eq", "f64.ne", "f64.lt", "f64.gt", "f64.le", "f64.ge", "i32.clz", "i32.ctz", "i32.popcnt", "i32.add", "i32.sub", "i32.mul", "i32.div_s", "i32.div_u", "i32.rem_s", "i32.rem_u", "i32.and", "i32.or", "i32.xor", "i32.shl", "i32.shr_s", "i32.shr_u", "i32.rotl", "i32.rotr", "i64.clz", "i64.ctz", "i64.popcnt", "i64.add", "i64.sub", "i64.mul", "i64.div_s", "i64.div_u", "i64.rem_s", "i64.rem_u", "i64.and", "i64.or", "i64.xor", "i64.shl", "i64.shr_s", "i64.shr_u", "i64.rotl", "i64.rotr", "f32.abs", "f32.neg", "f32.ceil", "f32.floor", "f32.trunc", "f32.nearest", "f32.sqrt", "f32.add", "f32.sub", "f32.mul", "f32.div", "f32.min", "f32.max", "f32.copysign", "f64.abs", "f64.neg", "f64.ceil", "f64.floor", "f64.trunc", "f64.nearest", "f64.sqrt", "f64.add", "f64.sub", "f64.mul", "f64.div", "f64.min", "f64.max", "f64.copysign", "i32.wrap/i64", "i32.trunc_s/f32", "i32.trunc_u/f32", "i32.trunc_s/f64", "i32.trunc_u/f64", "i64.extend_s/i32", "i64.extend_u/i32", "i64.trunc_s/f32", "i64.trunc_u/f32", "i64.trunc_s/f64", "i64.trunc_u/f64", "f32.convert_s/i32", "f32.convert_u/i32", "f32.convert_s/i64", "f32.convert_u/i64", "f32.demote/f64", "f64.convert_s/i32", "f64.convert_u/i32", "f64.convert_s/i64", "f64.convert_u/i64", "f64.promote/f32", "i32.reinterpret/f32", "i64.reinterpret/f64", "f32.reinterpret/i32", "f64.reinterpret/i64"];


// Use the above opCodes list to fill the codeTable, skipping reserved segments.
for (let i = 0; i < opCodes.length; i++) {
  const op = opCodes[i];
  if (op !== null) {
    codeTable[op] = [i];
  }
}


const simdOpCodes = ["v128.load", "v128.load8x8_s", "v128.load8x8_u", "v128.load16x4_s", "v128.load16x4_u", "v128.load32x2_s", "v128.load32x2_u", "v128.load8_splat", "v128.load16_splat", "v128.load32_splat", "v128.load64_splat", "v128.store", "v128.const", "i8x16.shuffle", "i8x16.swizzle", "i8x16.splat",
  "i16x8.splat", "i32x4.splat", "i64x2.splat", "f32x4.splat", "f64x2.splat", "i8x16.extract_lane_s", "i8x16.extract_lane_u", "i8x16.replace_lane", "i16x8.extract_lane_s", "i16x8.extract_lane_u", "i16x8.replace_lane", "i32x4.extract_lane", "i32x4.replace_lane", "i64x2.extract_lane", "i64x2.replace_lane", "f32x4.extract_lane",
  "f32x4.replace_lane", "f64x2.extract_lane", "f64x2.replace_lane", "i8x16.eq", "i8x16.ne", "i8x16.lt_s", "i8x16.lt_u", "i8x16.gt_s", "i8x16.gt_u", "i8x16.le_s", "i8x16.le_u", "i8x16.ge_s", "i8x16.ge_u", "i16x8.eq", "i16x8.ne", "i16x8.lt_s",
  "i16x8.lt_u", "i16x8.gt_s", "i16x8.gt_u", "i16x8.le_s", "i16x8.le_u", "i16x8.ge_s", "i16x8.ge_u", "i32x4.eq", "i32x4.ne", "i32x4.lt_s", "i32x4.lt_u", "i32x4.gt_s", "i32x4.gt_u", "i32x4.le_s", "i32x4.le_u", "i32x4.ge_s",
  "i32x4.ge_u", "f32x4.eq", "f32x4.ne", "f32x4.lt", "f32x4.gt", "f32x4.le", "f32x4.ge", "f64x2.eq", "f64x2.ne", "f64x2.lt", "f64x2.gt", "f64x2.le", "f64x2.ge", "v128.not", "v128.and", "v128.andnot",
  "v128.or", "v128.xor", "v128.bitselect", "v128.any_true", "v128.load8_lane", "v128.load16_lane", "v128.load32_lane", "v128.load64_lane", "v128.store8_lane", "v128.store16_lane", "v128.store32_lane", "v128.store64_lane", "v128.load32_zero", "v128.load64_zero", "f32x4.demote_f64x2_zero", "f64x2.promote_low_f32x4",
  "i8x16.abs", "i8x16.neg", "i8x16.popcnt", "i8x16.all_true", "i8x16.bitmask", "i8x16.narrow_i16x8_s", "i8x16.narrow_i16x8_u", "f32x4.ceil", "f32x4.floor", "f32x4.trunc", "f32x4.nearest", "i8x16.shl", "i8x16.shr_s", "i8x16.shr_u", "i8x16.add", "i8x16.add_sat_s",
  "i8x16.add_sat_u", "i8x16.sub", "i8x16.sub_sat_s", "i8x16.sub_sat_u", "f64x2.ceil", "f64x2.floor", "i8x16.min_s", "i8x16.min_u", "i8x16.max_s", "i8x16.max_u", "f64x2.trunc", "i8x16.avgr_u", "i16x8.extadd_pairwise_i8x16_s", "i16x8.extadd_pairwise_i8x16_u", "i32x4.extadd_pairwise_i16x8_s", "i32x4.extadd_pairwise_i16x8_u",
  "i16x8.abs", "i16x8.neg", "i16x8.q15mulr_sat_s", "i16x8.all_true", "i16x8.bitmask", "i16x8.narrow_i32x4_s", "i16x8.narrow_i32x4_u", "i16x8.extend_low_i8x16_s", "i16x8.extend_high_i8x16_s", "i16x8.extend_low_i8x16_u", "i16x8.extend_high_i8x16_u", "i16x8.shl", "i16x8.shr_s", "i16x8.shr_u", "i16x8.add", "i16x8.add_sat_s",
  "i16x8.add_sat_u", "i16x8.sub", "i16x8.sub_sat_s", "i16x8.sub_sat_u", "f64x2.nearest", "i16x8.mul", "i16x8.min_s", "i16x8.min_u", "i16x8.max_s", "i16x8.max_u", "i16x8.avgr_u", "i16x8.extmul_low_i8x16_s", "i16x8.extmul_high_i8x16_s", "i16x8.extmul_low_i8x16_u", "i16x8.extmul_high_i8x16_u",
  "i32x4.abs", "i32x4.neg", "i8x16.relaxed_swizzle", "i32x4.all_true", "i32x4.bitmask", "i32x4.relaxed_trunc_f32x4_s", "i32x4.relaxed_trunc_f32x4_u", "i32x4.extend_low_i16x8_s", "i32x4.extend_high_i16x8_s", "i32x4.extend_low_i16x8_u", "i32x4.extend_high_i16x8_u", "i32x4.shl", "i32x4.shr_s", "i32x4.shr_u", "i32x4.add", "f32x4.relaxed_madd",
  "f32x4.relaxed_nmadd", "i32x4.sub", "i8x16.relaxed_laneselect", "i16x8.relaxed_laneselect", "f32x4.relaxed_min", "i32x4.mul", "i32x4.min_s", "i32x4.min_u", "i32x4.max_s", "i32x4.max_u", "i32x4.dot_i16x8_s", "i32x4.extmul_low_i16x8_s", "i32x4.extmul_high_i16x8_s", "i32x4.extmul_low_i16x8_u", "i32x4.extmul_high_i16x8_u",
  "i64x2.abs", "i64x2.neg", "i64x2.all_true", "i64x2.bitmask", "i32x4.relaxed_trunc_f64x2_s_zero", "i32x4.relaxed_trunc_f64x2_u_zero", "i64x2.extend_low_i32x4_s", "i64x2.extend_high_i32x4_s", "i64x2.extend_low_i32x4_u", "i64x2.extend_high_i32x4_u", "i64x2.shl", "i64x2.shr_s", "i64x2.shr_u", "i64x2.add", "f64x2.relaxed_madd",
  "f64x2.relaxed_nmadd", null, null, null, "i64x2.sub", "i32x4.relaxed_laneselect", "i64x2.relaxed_laneselect", "f64x2.relaxed_min", "i64x2.mul", "i64x2.eq", "i64x2.ne", "i64x2.lt_s", "i64x2.gt_s", "i64x2.le_s", "i64x2.ge_s", "i64x2.extmul_low_i32x4_s", "i64x2.extmul_high_i32x4_s", "i64x2.extmul_low_i32x4_u", "i64x2.extmul_high_i32x4_u",
  "f32x4.abs", "f32x4.neg", "f32x4.relaxed_max", "f32x4.sqrt", "f32x4.add", "f32x4.sub", "f32x4.mul", "f32x4.div", "f32x4.min", "f32x4.max", "f32x4.pmin", "f32x4.pmax", "f64x2.abs", "f64x2.neg", "f64x2.relaxed_max", "f64x2.sqrt",
  "f64x2.add", "f64x2.sub", "f64x2.mul", "f64x2.div", "f64x2.min", "f64x2.max", "f64x2.pmin", "f64x2.pmax", "i32x4.trunc_sat_f32x4_s", "i32x4.trunc_sat_f32x4_u", "f32x4.convert_i32x4_s", "f32x4.convert_i32x4_u", "i32x4.trunc_sat_f64x2_s_zero", "i32x4.trunc_sat_f64x2_u_zero", "f64x2.convert_low_i32x4_s", "f64x2.convert_low_i32x4_u"]

// Use the above simdOpCodes list to fill the codeTable, skipping reserved segments.
for (let i = 0; i < simdOpCodes.length; i++) {
  const op = simdOpCodes[i];
  if (op !== null) {
    // TODO: figure out which ones need the wtf 0x01 extra byte
    if (i > 0x1f) {
      codeTable[op] = [0xfd, i, 0x01];
    } else {
      codeTable[op] = [0xfd, i];
    }
  }
}

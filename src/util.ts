export type Resolved<T> = T extends Promise<infer U> ? U : never

export function xfer(args: any) {
  const xfers: MessagePort[] = []
  for (const arg of args) {
    if (arg instanceof MessagePort) {
      xfers.push(arg)
    }
  }
  return xfers
}

export function capitalize(s: string) {
  return s[0].toUpperCase() + s.slice(1)
}

export function getGenId(kind: string) {
  return `gen_${kind}_${capitalize(kind)}`
}

export function post<T>(port: MessagePort | Worker, message: T) {
  port.postMessage(message)
}

function sinc(x: number): number {
  if (x === 0) {
    return 1
  }
  const piX = Math.PI * x
  return Math.sin(piX) / piX
}

function lanczosKernel(x: number, a: number): number {
  if (x === 0) {
    return 1
  }
  if (Math.abs(x) >= a) {
    return 0
  }
  return sinc(x) * sinc(x / a)
}

export function upsampleBuffer(buffer: Float32Array, a: number): Float32Array {
  const originalLength = buffer.length
  const targetLength = 65536
  const upsampledBuffer = new Float32Array(targetLength)
  const ratio = originalLength / targetLength

  for (let i = 0; i < targetLength; i++) {
    const position = i * ratio
    let value = 0
    for (let j = -a + 1; j < a; j++) {
      const index = Math.round(position + j)
      if (index >= 0 && index < originalLength) {
        value += (buffer[index] ?? 0) * lanczosKernel(j, a)
      }
    }
    upsampledBuffer[i] = value
  }
  return upsampledBuffer
}

export type NumberFormat = 'f' | 'd' | 'h' | 'k' | '#'

export interface NumberInfo {
  value: number
  format: 'f' | 'd' | 'h' | 'k' | '#'
  digits: number
}

const testModifierRegExp = /[\.khd#]/

export function parseNumber(x: string): NumberInfo {
  let value: number
  let format: NumberFormat = 'f'
  let digits = 0

  let res: any
  out: {
    if (res = testModifierRegExp.exec(x)) {
      switch (res[0]) {
        case '.': {
          const [, b = ''] = x.split('.')
          digits = b.length
          value = Number(x)
          break out
        }

        case 'k': {
          const [a, b = ''] = x.split('k')
          format = 'k'
          digits = b.length
          value = Number(a) * 1000 + Number(b) * (1000 / (10 ** digits))
          break out
        }

        case 'h': {
          const [a, b = ''] = x.split('h')
          format = 'h'
          digits = b.length
          value = Number(a) * 100 + Number(b) * (100 / (10 ** digits))
          break out
        }

        case 'd': {
          const [a, b = ''] = x.split('d')
          format = 'd'
          digits = b.length
          value = Number(a) * 10 + Number(b) * digits
          break out
        }

        case '#': {
          format = '#'
          value = parseInt(x.slice(1), 16)
          break out
        }
      }
    }

    value = Number(x)
  }

  return { value, format, digits }
}

export function checksum(str: string) {
  let hash = 0
  for (let i = 0; i < str.length; i++) {
    hash = (hash << 6) - hash + str.charCodeAt(i)
    hash = hash & hash // Convert to 32-bit integer
  }
  return Math.abs(hash)
}

export type Ring = Float32Array[] & { ptr: number, full: Float32Array }

export function toRing<T extends Float32Array>(buffer: T): Ring {
  const length = buffer.length / 128
  return Object.assign(
    Array.from({ length }, (_, x) =>
      buffer.subarray(
        x * 128,
        (x + 1) * 128
      )
    ),
    {
      ptr: buffer.byteOffset,
      full: buffer
    }
  )
}

export class FixedArray<T> {
  data: T[]
  head = 0
  size = 0
  constructor(maxSize: number) {
    this.data = Array.from({ length: maxSize })
  }
  pop(): T {
    if (!this.size) {
      throw new Error('No elements to pop.')
    }
    --this.size
    return this.data[(this.head + this.size) % this.data.length]
  }
  push(item: T) {
    if (this.size === this.data.length) {
      throw new Error('No more space to push.')
    }
    this.data[(this.head + this.size) % this.data.length] = item
    this.size++
  }
  unshift(item: T) {
    if (this.size === this.data.length) {
      throw new Error('No more space to unshift.')
    }
    this.head = (this.head + this.data.length - 1) % this.data.length
    this.data[this.head] = item
    this.size++
  }
  forEach(fn: (item: T) => void) {
    for (let i = this.head; i < this.head + this.size; i++) {
      fn(this.data[i % this.data.length])
    }
  }
  every(fn: (item: T) => boolean) {
    for (let i = 0; i < this.size; i++) {
      if (!fn(this.data[i])) return false
    }
    return true
  }
  clear() {
    this.head = this.size = 0
  }
  *[Symbol.iterator]() {
    for (let i = this.head; i < this.head + this.size; i++) {
      yield this.data[i % this.data.length]
    }
  }
}

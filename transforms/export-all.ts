// @ts-ignore
import { Transform } from "assemblyscript/transform"
// @ts-ignore
import Binaryen from "assemblyscript/binaryen"
import * as fs from 'fs'
import * as path from 'path'
import * as util from 'util'

enum Types {
  i32 = 2,
  i64 = 3,
  f32 = 4,
  f64 = 5,
  v128 = 6,
}

function replaceNonAlphaNumeric(x: string, replaceValue: string) {
  return x.replaceAll(/[^a-z0-9]/ig, replaceValue)
}

function cleanupExportName(x: string) {
  x = replaceNonAlphaNumeric(x.split('assembly/').slice(1).join('_'), '_')
  const parts = x.split('_')
  const [pre, name, fn, ...methodParts] = parts
  if (!fn) {
    return x
  }
  else if (fn.toLowerCase() !== name) {
    return `${pre === 'gen' ? `${pre}_` : ''}${name}_${[fn, ...methodParts].join('_')}`
  }
  else {
    return `${pre === 'gen' ? `${pre}_` : ''}${name}_${methodParts.join('_')}`
  }
}

// function sortCompareKeys([a]: [string, any], [b]: [string, any]) {
//   return a < b ? -1 : a > b ? 1 : 0
// }

// function sortObjectInPlace<T extends Record<string, any>>(data: T) {
//   const sorted = Object.fromEntries(
//     Object.entries(data).sort(sortCompareKeys)
//   )
//   for (const key in data)
//     delete data[key]
//   Object.assign(data, sorted)
//   return data
// }

class ExportAllTransform extends Transform {
  afterCompile(module: any): void {
    const fnCount = module.getNumFunctions()
    const envObject: any = {}
    for (let i = 0; i < fnCount; i++) {
      const fnRef = module.getFunctionByIndex(i)
      const info = Binaryen.getFunctionInfo(fnRef)
      const name = info.name
      if (name.startsWith('assembly/')) {
        const paramsTypes = Binaryen.expandType(info.params)
        const resultsTypes = Binaryen.expandType(info.results)
        // @ts-ignore
        const params = paramsTypes.map(x => Types[x])
        // @ts-ignore
        const results = resultsTypes.map(x => Types[x])
        const exportName = cleanupExportName(name)
        const sig = `(${params.join(' ')}) ${results.length ? results.join(' ') : 'void'}`
        envObject[exportName] = sig
        console.log(name, '->', exportName, `[${paramsTypes}] => [${resultsTypes}]`)
        try {
          module.addFunctionExport(name, exportName)
        } catch (error) {
          continue
        }
      }
    }
    // console.log(envObject)
    // sortObjectInPlace(envObject)
    const formatted = util.format('%O', envObject)
    const envTypesContent = `// This file was automatically generated from the Assemblyscript transform: export-all.ts
// during the Assemblyscript compilation. Use \`npm run asbuild\` to regenerate.
export const envTypes = ${formatted} as const
`
    const filename = path.join(process.cwd(), 'src', 'env-types.ts')
    fs.writeFileSync(filename, envTypesContent)
  }
}

export default ExportAllTransform

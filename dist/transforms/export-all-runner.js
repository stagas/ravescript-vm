import { Transform } from "assemblyscript/transform";
import Binaryen from "assemblyscript/binaryen";
import * as fs from "fs";
import * as path from "path";
import * as util from "util";
var Types = /* @__PURE__ */ ((Types2) => {
  Types2[Types2["i32"] = 2] = "i32";
  Types2[Types2["i64"] = 3] = "i64";
  Types2[Types2["f32"] = 4] = "f32";
  Types2[Types2["f64"] = 5] = "f64";
  Types2[Types2["v128"] = 6] = "v128";
  return Types2;
})(Types || {});
function replaceNonAlphaNumeric(x, replaceValue) {
  return x.replaceAll(/[^a-z0-9]/ig, replaceValue);
}
function cleanupExportName(x) {
  x = replaceNonAlphaNumeric(x.split("vm/runner/").slice(1).join("_"), "_");
  const parts = x.split("_");
  const [pre, ...methodParts] = parts;
  return methodParts.join("_");
}
class ExportAllRunnerTransform extends Transform {
  afterCompile(module) {
    const fnCount = module.getNumFunctions();
    const envObject = {};
    for (let i = 0; i < fnCount; i++) {
      const fnRef = module.getFunctionByIndex(i);
      const info = Binaryen.getFunctionInfo(fnRef);
      const name = info.name;
      if (name.startsWith("vm/runner/")) {
        if (name.includes("prevent"))
          continue;
        const paramsTypes = Binaryen.expandType(info.params);
        const resultsTypes = Binaryen.expandType(info.results);
        const params = paramsTypes.map((x) => Types[x]);
        const results = resultsTypes.map((x) => Types[x]);
        const exportName = cleanupExportName(name);
        const sig = `(${params.join(" ")}) ${results.length ? results.join(" ") : "void"}`;
        envObject[exportName] = sig;
        console.log(name, "->", exportName, `[${paramsTypes}] => [${resultsTypes}]`);
        try {
          module.addFunctionExport(name, exportName);
        } catch (error) {
          continue;
        }
      }
    }
    const formatted = util.format("%O", envObject);
    const envTypesContent = `// This file was automatically generated from the Assemblyscript transform: export-all.ts
// during the Assemblyscript compilation. Use \`npm run asbuild\` to regenerate.
export const envTypesRunner = ${formatted} as const
`;
    const filename = path.join(process.cwd(), "src", "env-types-runner.ts");
    fs.writeFileSync(filename, envTypesContent);
  }
}
export default ExportAllRunnerTransform;

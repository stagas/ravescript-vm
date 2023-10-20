// @ts-ignore
import { TransformVisitor, utils } from "visitor-as"
// @ts-ignore
import { Parser, BlockStatement } from "assemblyscript"

const { not, isStdlib } = utils

class UnrollTransform extends TransformVisitor {
  visitBlockStatement(node: BlockStatement): BlockStatement {
    if (node.statements.length === 1) {
      // @ts-ignore
      if (node.statements[0]?.expression?.expression?.text === "unroll") {
        // @ts-ignore
        const args = node.statements[0].expression.args
        const body = args[1].declaration.body
        const times = args[0].value.low
        const res = body
        res.range = node.range
        body.statements = Array.from({ length: times }, () => body.statements).flat()
        return super.visitBlockStatement(res)
      }
    }
    return super.visitBlockStatement(node)
  }

  afterParse(parser: Parser): void {
    const sources = parser.sources.filter(not(isStdlib))
    // @ts-ignore
    this.visit(sources)
  }
}

export default UnrollTransform

/* usage:

// unroll() must be first expression inside for loop

for (i = begin; i < end; i += 64) {
  unroll(64, (): void => {
    // so that every iteration has the right index
    index++
    ... smth ...
  })
}

*/

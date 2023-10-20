import { annotate } from 'annotate-code'

/*
  The only purpose for this class is to enable anything that handles exceptions to use instanceof to easily distinguish between exceptions
    intentionally thrown due to a compilation error, and other exceptions that happen to be caught (e.g. bugs).
*/
export class CompileError extends Error {
  constructor(public type: any, public data: any) {
    const msg = annotate({
      message: type,
      index: data.node?.token?.pos || 0,
      size: data.node?.token?.length || 0,
      input: data.node?.token?.source?.code || '',
    }).message

    super(type + '\n' + msg, { cause: data })
  }
}

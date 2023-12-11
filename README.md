# RAVEscript VM

## Making a new Gen

- Under `assembly/gen/`, make a new file `mygen.ts`.
- In the file `assembly/index.ts`, add an import:
```ts
import { MyGen } from './gen/mygen'
```
- In the `preventTreeShaking()` function, make an instance of that class (`MyGen`) and get its size, and access any new properties, like this:
```ts
const sin: Sin = new Sin(engine)
const sinSize: usize = util.getObjectSize<Sin>()
sin.trig = 0
```
- Build the assembly project:

```
npm run asc:dev
```
- Start the `develop/gen` playground:
```
devito develop/gen
```
- Try it:
```c#
[mygen foo:123]
```

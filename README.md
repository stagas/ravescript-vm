# RAVEscript VM

This is the repo for the audio engine that powers RAVEscript.

## Prerequisites

- [bun](https://bun.sh/)
```
curl -fsSL https://bun.sh/install | bash
```
- [devito](https://github.com/stagas/devito)
```
bun add -g github:stagas/devito
```
> [Setting up an https cert for devito.](https://github.com/stagas/devito)

> [Addition cert setup instructions for Windows machines.](https://www.haveiplayedbowie.today/blog/posts/secure-localhost-with-mkcert/)

## Making a new Gen

- Under `assembly/gen/`, make a new file `mygen.ts`. All Gens inherit from the base class `Gen`.

```ts
import { Gen } from './gen'

export class Mygen extends Gen {
  ...
}
```

- In the file `assembly/index.ts`, add an import:
```ts
import { Mygen } from './gen/mygen'
```
- In the `preventTreeShaking()` function, make an instance of that class (`Mygen`) and get its size, and access any new public properties, like this:
```ts
const mygen: Mygen = new Mygen(engine)
const mygenSize: usize = util.getObjectSize<Mygen>()
mygen.trig = 0 // if used
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

## Extra info

- In a **Gen** class, all properties starting with `_` _(underscore)_ are private, and everything else is going to be the public properties that are available in the RAVEscript editor. Make sure to **use the property** in the `preventTreeShaking()` setup so that the compiler can see it.

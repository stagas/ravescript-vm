# RAVEscript language and features

RAVEscript is a postfix stack-based DSL (similar to Forth) that describes audio graphs.

## Syntax Overview:

#### A comment:

```rave
; this is a comment
(; list comment, can be nested)
[; procedure comment,
  [; can be nested] as well
]
```
#### Scalars:

```rave
.01
3.14
42
4k   ; 4000
4k1  ; 4100
4k23 ; 4230
```

#### A literal with a slider UI picker:
```rave
42 \
```

```rave
[min max slope value \]
```

This creates a slider with a range based on the order of magnitude of the given number, in this case the range will be from `10` to `99`. The sliders also try to use the same number of decimal digits (if any) so `42.55 \` will be a range from `10.00` to `99.99`

#### A list of literal numbers:
```rave
(1 2.5 3 4)
```

#### A generator:
```rave
[sin 333]
```

#### A generator with properties:
```rave
[slp 666 q:.7]
```

#### Data types:
```rave
42       ; a number value
[sin 42] ; an audio value
```

#### Some operations:

```rave
3 4 * ; mul
5 6 * ; mul
+     ; add
```

#### Operators:

| Operation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    | Action
|---------------|-------
| `x !` | Negate `x`.
| `x floor ` | Floor `x`.
| `x y *` | Multiply `x` by `y`.
| `x y /` | Divide `x` by `y`.
| `x y +` | Add `y` to `x`.
| `x y -` | Subtract `y` from `x`.
| `x y ^` | Raise `x` to the power `y`.
| `42 x =` | Assign `42` to the variable `x`.
| `42 x +=` | Add `42` to the existing variable `x` and write in-place.
| `42 x -=` | Subtract `42` from the existing variable `x` and write in-place.
| `42 x *=` | Multiply `42` with existing variable `x` and write the result to `x` in-place.
| `42 x /=` | Divide `42` with existing variable `x` and write the result to `x` in-place.
| `42 x ^=` | Raise `42` to the power `x` and write the result to `x` in-place.
| `@`     | Collect. Mixes all audio values from the stack, drops everything else, and pushes the new mixed audio to the stack again. Example: <pre>; push two sin sounds to the stack, mix them,<br>; and then add the result to the center channel<br>[sin 330] [sin 440] @ LR+=</pre>
| `(n1 n2 n3) n pick` | Picks the `n`'th element from the list `(n1 n2 n3)`, wraps around if greater than the list size (essentially an implicit `n` modulo list length).
| `(n1 n2 n3) n x slide` | Same as `pick`, except it also slides smoothly with the previous value by the slope `x`. Slope can take these values:<br> `1 = linear slope`<br>`less than 1 = logarithmic`<br>`greater than 1 = exponential`

## Gens

Gens or generators, can either just produce audio or literal values, but also can consume audio values from the stack.

### How to read the table below:

Signatures describe the stack state:
```
  --   ; no stack operations
  -- a ; pushes an audio value
a -- a ; pops an audio value from stack, pushes an audio value to the stack
```
Props:
```
prop: value (min .. max -- default)
```
A **bold** prop means the label is not necessary, it is implicit. The following two are identical:
```rave
[slp cut:300 q:.5]
[slp 300 q:.5]
```
`in:` props will pop one from the stack if not explicitly set. The following two are identical:
```rave
[saw 123] [slp 300]
[saw 123] bass= [slp in:bass 300]
```


Identifier | Signature | Props  | Description |
---------- | ----------- | ----------- | ------ |
`sin` | -- a | **`hz: frequency`** (any..any -- 440)<br>`trig: n` (any..any -- 0)<br>`offset: phase offset` (any..any -- 0) | Sine wave
`tri` | -- a | **`hz: frequency`** (any..any -- 440)<br>`trig: n` (any..any -- 0)<br>`offset: phase offset` (any..any -- 0) | Triangle wave
`saw` | -- a | **`hz: frequency`** (any..any -- 440)<br>`trig: n` (any..any -- 0)<br>`offset: phase offset` (any..any -- 0) | Sawtooth wave
`ramp`| -- a | **`hz: frequency`** (any..any -- 440)<br>`trig: n` (any..any -- 0)<br>`offset: phase offset` (any..any -- 0) | Ramp wave
`sqr` | -- a | **`hz: frequency`** (any..any -- 440)<br>`trig: n` (any..any -- 0)<br>`offset: phase offset` (any..any -- 0) | Square wave
`exp` | -- a | **`hz: frequency`** (any..any -- 440)<br>`trig: n` (any..any -- 0)<br>`offset: phase offset` (any..any -- 0) | Exponential wave
`noise` | -- a | **`hz: frequency`** (any..any -- 440)<br>`trig: n` (any..any -- 0)<br>`offset: phase offset` (any..any -- 0) | White noise
`say` | -- a | **`text: 'hello'`**<br>`trig: n` (any..any -- 0)<br>`offset: phase offset` (any..any -- 0) | Speak using SAM
`freesound` | -- a | **`id: number`** ( -- ) | Play sound from Freesound.org
`lp` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500) | One-pole Low-pass
`bap` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 40 -- 0.5) | Biquad All-pass
`bbp` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 40 -- 0.5) | Biquad Band-pass
`bhp` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 40 -- 0.5) | Biquad High-pass
`blp` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 40 -- 0.5) | Biquad Low-pass
`bhs` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 40 -- 0.5)<br>`gain: db` (-10 .. 10 -- 0) | Biquad High-shelf
`bls` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 40 -- 0.5)<br>`gain: db` (-10 .. 10 -- 0)  | Biquad Low-shelf
`bno` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 40 -- 0.5)<br>`gain: db` (-10 .. 10 -- 0)  | Biquad Notch
`bpk` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 40 -- 0.5)<br>`gain: db` (-10 .. 10 -- 0)  | Biquad Peak
 `sap` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 0.985 -- 0.5) | SVF All-pass
`sbp` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 0.985 -- 0.5) | SVF Band-pass
`shp` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 0.985 -- 0.5) | SVF High-pass
`slp` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 0.985 -- 0.5) | SVF Low-pass
`sno` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 0.985 -- 0.5) | SVF Notch
`spk` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 0.985 -- 0.5) | SVF Peak
`mhp` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 0.985 -- 0.5) | Moog High-pass
`mlp` | a -- a | `in: audio` ( -- pop from stack)<br> **`cut: hz`** (50 .. 22050 -- 500)<br>`q: resonance` (0.01 .. 0.985 -- 0.5) | Moog Low-pass
`diode` | a -- a | `in: audio` ( -- pop from stack)<br>**`cut: hz`** (50 .. 22050 -- 500)<br>`hpf: hz` (50 .. 22050 -- 1000)<br>`sat: saturation` (0 .. any -- 1.0)<br>`q: resonance` (0 .. 1 -- 0.0) | Diode-ladder filter
`clamp` | a -- a | `in: audio` ( -- pop from stack)<br>**`min: value`** (any..any -- -0.5)<br>`max: value` (any..any -- 0.5) | Clamp Value from `min` to `max`
`clip` | a -- a | `in: audio` ( -- pop from stack)<br>**`threshold: value`** (any..any -- 0.5) | Hard Clip `-threshold` to `+threshold`
`comp` | a -- a | `in: audio` ( -- pop from stack)<br>**`threshold: value`** (0 .. 1 -- 0.7)<br>`ratio: value` (0 .. 1 -- 1/3)<br>`attack: value` (0 .. 1 -- 0.01)<br>`release: value` (0..1 -- 0.01)<br>`sidechain: audio` | Dynamics Compressor
`daverb` | a -- a | **`pd: predelay`** (0 .. 1 -- 0.03)<br>`bw: lowpass bandwidth` (0 .. 1 -- 0.1)<br>`fi: input diffusion 1` (0 .. 1 -- 0.5)<br>`si: input diffusion 2` (0 .. 1 -- 0.5)<br>`dc: decay rate` (0 .. 1 -- 0.5)<br>`ft: decay diffusion 1` (0 .. 0.999999 -- 0.5)<br>`st: decay diffusion 2` (0 .. 0.999999 -- 0.5)<br>`dp: damping amount` (0 .. 1 -- 0.5)<br>`ex: excursion rate` (0 .. 2 -- 0.5)<br>`ed: excursion depth` (0 .. 2 -- 0.5) | Dattoro Plate Reverb
`dc` | a -- a | **`ceil: value`** (0 .. 1 -- 0.2) | DC filter
`dclip` | a -- a | - | Dclipper, clips(or zeroes) all negative values
`dclipexp` | a -- a | **`factor: value`** (any..any -- 1.0) | Exponential Dclipper
`dcliplin` | a -- a | **`threshold: value`** (any..any -- 0.5) `factor: value` (any..any -- 0.5) | Linear Dclipper
`tanh` | a -- a | `in: audio` ( -- pop from stack)<br>**`gain: value`** (0 .. any -- 1) | Hyperbolic Tangent (S-curve)
`tap` | a -- a | `in: audio` ( -- pop from stack)<br>**`ms: milliseconds`** (0 .. any -- 200) | Single Tap Delay
`delay` | a -- a | `in: audio` ( -- pop from stack)<br>**`ms: milliseconds`** (0 .. any -- 200)<br>`fb: feedback amount` (0 .. 1 -- 0.5) | Delay
`rate` | -- | **`samples: number`** | Adjust Sample Rate

## Procedures

An example `pulse` procedure:

```rave
pulse: {
  hz:=      ; hz frequency, pop from stack
  width:.65 ; pulse width
  ,         ; end of parameters
  [saw hz]  ; a sawtooth
  [ramp hz offset:width] ; a ramp, offset shifted by `width`
  @         ; mix the above
}
```

which can then be used as:

```rave
[pulse 333 width:.3]
```
The `hz` property pops one value from the stack, using the `:=` operator, but can also be entered as it is, so this is the same:
```rave
[pulse hz:333 width:.3]
```

For properties, a shorthand of the smallest common identifier that is not used elsewhere, can also be used. In this case we could write:

```rave
[pulse 333 w:.3]
```
And if `w` doesn't conflict with anything else, it will be used for the `width` property.

The comma `,` operator is used to terminate parameters.

Procedures can be used anywhere, including inside other procedures, but they must be declared earlier (no cyclical calls are possible at the moment).

## Feedback loops

You can create feedback loops by referencing a later assigned value. Example:

```rave
A .35* [saw 333] @ A=
```
Breakdown:
```rave
A .35*    ; read the value of A and multiply it by 0.35
[saw 333] ; generate a sawtooth audio
@         ; mix the above
A=        ; assign result to A
```

## Sequencing / Rhythmical

A very basic sequencing can be achieved using **lists**, the operators `pick` or `slide`, and the globals `t` (**t**ime) `bt` (bpm adjusted time, or **b**ar **t**ime) and `co` (bar time **co**efficient). Here are some examples:

```rave
; cycles through each value on every bar
(1 2 3 4) bt pick

; cycles through each value on every bar, 4 times faster, essentially every 1/4
(1 2 3 4) bt 4* pick

; a 3/4 cycle
(1 2 3 4) bt 4 3 / * pick

; slides through the values on every bar with a slope factor of 4
(1 2 3 4) bt 4 slide

; pick also works with audio values
([sin 333] [saw 444] [tri 555]) bt pick

; nesting is possible
(1 2 (10 11 12) bt pick 3 4) bt pick

; sine wave synced at 1 bar frequency, regardless of bpm, ideal for lfos
[sin 1 co*]

; trigger (reset phase) of the sawtooth on every bar
[saw 333 trig:bt]
```

## Shaping / Envelopes techniques

You can use the `[exp]` generator to create exponential curves. Example:

```rave
[saw 333] [exp .5 trig:bt 4*] 5^ *
```
Breakdown:
```rave
[saw 333]   ; a sawtooth wave
[exp .5     ; an exponential curve wave at .5 hz
 trig:bt 4* ; trigger (reset phase) on every 1/4 (4 times faster than 1 bar)
] 5^        ; raise the curve to the power 5 (i.e make it steeper)
*           ; multiply the sawtooth wave with the curve, creating a release envelope
```

## Sequencing ideas
```rave
; n ? = bt n* pick
n1:(: c e (: g g1) 1 ?) 4 ?
t1:(. ...-..) 1 ?
v1:(1 .8 .5 1) 1 ?
n2:(: e f (: a a1) 1 ?) 4 ?
t2:(. .-.- (. .-.-) 2 ? -) 1 ?
v2:(1 .8 .5 1) 1 ?
[saw n1] [exp trig:t1] *
[saw n2] [exp trig:t2] *
```

```
(
  ([saw n1] [saw n2]) 1B ?
  [zero]
  [sin n2]
) 8B ?

```

```
env: {
  trig:0
  vel:1
  ,
  := vel * [exp trig] *
}

[saw n1] [env trig:4b vel:(1 .8 1 .7) 1?]

```

```
synth: {
  hz :=
  [saw hz]
  [adsr att:.1 dec:4 sus:2 rel:.4 trig:4b vel:(1 .8 1 .7) 1?]
  *
}

```

```
mtof: {
  m :=,
  2 m 69 - 12 / ^ 440 *
}

n1:[mtof (33 37 42 35) 1 ?]

[saw n1]

([saw [mtof 32]] [saw 880]) 1 ?
```


```
cmaj:(0 3 7)

(5 6 7) (0 1 -1) 1 ? 12 * +
cmaj (0 1 -1) 1 ? 12 * +
```

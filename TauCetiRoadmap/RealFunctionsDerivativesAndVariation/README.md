# Roadmap: Real functions, derivatives and variation

**Summary.** This roadmap builds the fine structure of real functions of one real variable: what
can be said about a function from its difference quotients alone, without assuming that it is
differentiable, measurable or of bounded variation.

- The four Dini derivatives, valued in the extended reals, with Dini's theorem on their bounds,
  their measurability, and Young's theorem that the two sides disagree only at countably many
  points.
- Monotonicity criteria: the rising sun lemma, monotonicity from a nonnegative upper Dini
  derivative off a countable set, the almost-everywhere criteria and the Goldowski–Tonelli
  theorem.
- Images of sets under functions with derivatives on them, and the Denjoy–Young–Saks theorem on
  the almost-everywhere behaviour of the Dini derivatives of an arbitrary function.
- Variation and absolute continuity on the line: Helly's selection theorem, the inequality
  between the integral of the modulus of the derivative and the variation, Tonelli's
  characterization of absolute continuity, Fubini's termwise differentiation theorem, Lusin's
  property (N), the Banach–Zarecki theorem, and strictly increasing singular and nowhere
  monotone differentiable functions.
- Functions of the first Baire class: derivatives belong to it, the Lebesgue–Hausdorff and Baire
  characterizations, and the exact description of the continuity sets of derivatives.
- Typical continuous functions: the Banach–Mazurkiewicz theorem that the generic continuous
  function has an infinite right Dini derivative at every point.
- Approximate continuity and the density topology: Lebesgue density, Denjoy's measurability
  criterion, bounded approximately continuous functions are derivatives, the Lusin–Menchoff
  theorem, Zahorski's lemma, and the density topology, which is completely regular and not
  normal.

The roadmap is a synthesis of several sources: Bruckner, *Differentiation of Real Functions*;
Thomson, *Real Functions*; Leoni, *A First Course in Sobolev Spaces*; Hewitt–Stromberg, *Real
and Abstract Analysis*; Benedetto–Czaja, *Integration and Modern Analysis*; Kechris, *Classical
Descriptive Set Theory*; Stein–Shakarchi, *Real Analysis*; Bourbaki, *Functions of a Real
Variable*; and Kharazishvili, *Topics in Measure Theory and Real Analysis*. The layers follow the
proof-dependency order of the subject, not the chapter order of any one source.

The nearest roadmaps are GeometricMeasureTheory, which owns rectifiable curves and functions of
bounded variation in several variables and consumes the one-variable variation theory only as
the case of curves; PDE, which identifies first-order Sobolev functions on an interval with
absolutely continuous functions and takes absolute continuity as given; and the roadmap on Young
integration and rough paths, which owns the `p`-variation for `p ≠ 1`. Nothing passes from this
roadmap into them as a requirement.

[Suggested.lean](Suggested.lean) states, against the pinned Mathlib and Tau Ceti and each with
`sorry`, the headlines below that carry a Lean name, each with every conclusion this README
attaches to it, together with the definitions their statements need. It is not an exhaustive
acceptance test: the other headlines of this README are targets of the same standing, stated in
prose with their locators or proof routes.

Suggested home: `TauCeti/Analysis/Real/` for Layers 1–6 and `TauCeti/MeasureTheory/Density/`
for Layer 7.

## How to read the build

Layer 1 defines the Dini derivatives and proves their elementary theory. Layers 2 and 3 use only
Layer 1, Mathlib's mean-value and Vitali covering machinery, and Lebesgue outer measure. Layer 4
is the variation theory; it uses Layer 3 for the Banach–Zarecki theorem and is otherwise
independent of Layers 1–3. Layer 5 is topological and uses only Mathlib's Baire category theory;
Layer 6 uses Layers 1 and 5. Layer 7 uses Lebesgue's density theorem from Mathlib and Layer 5 for
the Baire-class statement. Each subsection has bold headlines with a Lean name, a locator with
its printed page or a proof route, and a *Needs:* line. Each layer ends with **Checks.**,
*Examples* and *Dependencies*.

## Conventions

- Functions are `f : ℝ → ℝ`, used on an interval; hypotheses are stated "on" a set. Intervals are
  either `Icc a b`, Mathlib's `uIcc a b` where Mathlib's `AbsolutelyContinuousOnInterval` uses it,
  or an order-connected set `D` with its `interior`, in the shape of the Mathlib pull request
  cited under *Exact supplier contracts*.
- The Dini derivatives take values in `EReal` and are the `limsup` and `liminf` of
  `slope f x y` as `y` tends to `x` from the right (`𝓝[>] x`) or from the left (`𝓝[<] x`).
  `slope f x y = (f y - f x) / (y - x)` for both sides, so no sign change is needed on the left.
  The values `⊤` and `⊥` are genuine: a real-valued `limsup` would return the junk value `0`
  where the quotients are unbounded, and the Checks of Layer 1 test this.
- The lower Dini derivative on a side is at most the upper one on the same side: this is
  `liminf_le_limsup` in a complete lattice and is not stated.
- Quantities that can be infinite take values in `ℝ≥0∞`: the variation `eVariationOn`, Lebesgue
  outer measure `volume s` of an arbitrary set, and the integral `∫⁻` of `‖deriv f x‖ₑ`. No real
  `⨆` over a possibly unbounded family appears in a statement; the suprema of Dini derivatives
  are in `EReal`.
- `deriv f x` is Mathlib's, with the junk value `0` where `f` is not differentiable. Every
  statement using it under an integral holds with that convention, because it only lowers the
  integrand where the derivative fails to exist.
- Sets whose measure is discussed are arbitrary unless a measurability hypothesis is written;
  "measurable" means Lebesgue measurable (`NullMeasurableSet`, `AEMeasurable`).
- Density is taken with centred closed balls `Metric.closedBall x r` and Lebesgue outer measure.
  For density `0` and density `1` this is equivalent to the sources' convention with arbitrary
  intervals containing `x`, since an interval of length `h` containing `x` lies in the ball of
  radius `h`.
- The density topology is a plain definition `densityTopology`, not an instance, since it
  competes with the order topology of `ℝ`; statements about it use `IsOpen[densityTopology]` and
  explicit instance arguments.
- The implementation namespace is TauCeti; the prototypes in `Suggested.lean` live in
  `TauCetiRoadmap.RealFunctionsDerivativesAndVariation`.

## Layer 1: Dini derivatives

### 1.1 Definitions and differentiability

- **Upper right Dini derivative** (`upperRightDini`): `D⁺f(x)`, the `limsup` of `slope f x y` as
  `y → x⁺`, in `EReal` (Hewitt–Stromberg, (17.1), p. 256; Bruckner, Chapter IV, §1, p. 52).
- **Lower right Dini derivative** (`lowerRightDini`): `D₊f(x)`, the corresponding `liminf`.
- **Upper left Dini derivative** (`upperLeftDini`): `D⁻f(x)`, the `limsup` as `y → x⁻`.
- **Lower left Dini derivative** (`lowerLeftDini`): `D₋f(x)`, the corresponding `liminf`
  (Hewitt–Stromberg, (17.2), p. 257).
- **Differentiability through Dini derivatives** (`hasDerivAt_iff_dini`): `HasDerivAt f d x`
  iff the four Dini derivatives at `x` all equal the real number `d` (Bruckner, Chapter IV,
  Theorem 1.1, p. 52).

*Proof route.* `HasDerivAt f d x` is the convergence of `slope f x y` to `d` along the punctured
neighbourhood filter (`hasDerivAt_iff_tendsto_slope` in Mathlib); split the filter into its two
sides and use that, in `EReal`, convergence to a real limit is equality of `limsup` and `liminf`
with that limit.

*Needs:* `slope`; nothing from this roadmap.

### 1.2 Bounds and measurability

- **Dini's bounds theorem** (`dini_bounds`): for `f` continuous on `[a, b]`, `a < b`, the
  supremum over `[a, b)` of the upper right Dini derivative, and that of the lower right Dini
  derivative, both equal the supremum of `slope f x y` over `a ≤ x < y ≤ b`; the infima over
  `[a, b)` of both right Dini derivatives equal the infimum of the same quotients (Bruckner,
  Chapter IV, Theorem 1.2, p. 53).
- Target in prose: the left Dini derivatives on `(a, b]` have the same bounds, by the reflection
  `x ↦ -x` (Bruckner, Chapter IV, Theorem 1.2, p. 53).
- Target in prose: if one of the four Dini derivatives of a continuous function is continuous at
  a point, the four agree there and the function is differentiable there (Bruckner, Chapter IV,
  Theorem 1.3, p. 53).
- **Measurability** (`aemeasurable_dini`): the four Dini derivatives of a Lebesgue measurable
  function are Lebesgue measurable (Bruckner, Chapter IV, Theorem 2.1, p. 54).
- **Borel measurability for continuous functions** (`measurable_dini_of_continuous`): the four
  Dini derivatives of a continuous function are Borel measurable. Bruckner, Chapter IV,
  Theorem 2.2, p. 55, places them in the second Baire class.

*Proof route.* Bounds: if `D⁺f(x₀) > M` some quotient from `x₀` exceeds `M`. Conversely, if
`slope f x y > M`, put `g t = f t - M t` and `z = sup {t ∈ [x, y] | g t ≤ g x}`; then `z < y`,
`g z = g x` by continuity and `g > g z` on `(z, y]`, so `D₊f(z) ≥ M`. The infima follow by
applying this to `-f`. Continuous case of measurability: for continuous `f` the `limsup` over
`y → x⁺` equals the `limsup` over rational `h ↓ 0` of `slope f x (x + h)`, a countable
`limsup` of continuous functions of `x`. Measurable case: Bruckner's proof, p. 54.

*Needs:* §1.1.

### 1.3 Young's countability theorem

- **G. C. Young's theorem** (`countable_setOf_upperDini_lt_lowerDini`): for an arbitrary `f`,
  the sets `{x | D⁺f(x) < D₋f(x)}` and `{x | D⁻f(x) < D₊f(x)}` are countable (Thomson, §59,
  p. 143).
- Target in prose: the points at which both one-sided derivatives exist, finite or infinite, and
  differ form a countable set (Hewitt–Stromberg, (17.9), p. 262). It is a corollary.

*Proof route.* If `D⁺f(x) < r < D₋f(x)` for a rational `r`, then `x` is a strict local maximum
of `t ↦ f t - r t`, and a function has only countably many strict local maxima (take a rational
interval isolating each). The second set is the first for `t ↦ -f (-t)`.

*Needs:* §1.1.

**Checks.**

- `dini_abs_zero`: at `0` the right Dini derivatives of `|x|` are `1` and the left ones `-1`, so
  `hasDerivAt_iff_dini` correctly reports non-differentiability.
- `dini_mul_sin_inv_zero`: for `x sin(1/x)` (with value `0` at `0`), `slope f 0 y = sin(1/y)`, so
  the right Dini derivatives at `0` are `1` and `-1`.
- Negative control for the `EReal` convention, `dini_sqrt_abs_zero`: both right Dini derivatives
  of `√|x|` at `0` are `⊤` (the quotient is `y^(-1/2)`, already `10` at `y = 10⁻²`); a
  real-valued `limsup` of an unbounded family would give the junk value `0`.
- Young's theorem at `-|x|`: `D⁺ = -1 < 1 = D₋` at `0`, so `0` lies in the first set, which is
  countable but not empty.
- `dini_bounds` for `x³` on `[-1, 1]`: `slope = x² + xy + y²` has supremum `3`, not attained, and
  infimum `0`; the right Dini derivatives `3x²` on `[-1, 1)` have the same supremum and infimum.

### Examples

- The Weierstrass function and the typical continuous function of Layer 6 have, at every point,
  an infinite Dini derivative on the right.

### Dependencies

Mathlib's `slope`, `EReal`, `limsup` and `liminf`.

## Layer 2: Monotonicity from Dini derivatives

### 2.1 The rising sun lemma

- **Rising sun lemma** (`risingSun`): for `G` continuous on `[a, b]` the shadow set
  `E = {x ∈ (a, b) | ∃ y ∈ (x, b], G x < G y}` is open, and for every component `(c, d)` of `E`
  (`Ioo c d ⊆ E`, `c ∉ E`, `d ∉ E`) one has `G c ≤ G d`, with `G c = G d` when `a < c`
  (Stein–Shakarchi, Lemma 3.5, p. 121, and Corollary 3.6, p. 122).

*Proof route.* Openness from continuity. On a component `(c, d)`, `d ∉ E` gives `G x ≤ G d`
for `x ≥ d`. If `G c > G d`, take the rightmost point `z` of `(c, d)` with
`G z = (G c + G d)/2`; since `z ∈ E` some `y > z` has `G y > G z`, necessarily `y < d`, and the
intermediate value theorem on `[y, d]` gives a point to the right of `z` at the same level, a
contradiction (Stein–Shakarchi, proof of Lemma 3.5, pp. 121–122). If `a < c` then `c ∈ [a, b]`
lies outside `E` only if `G c ≥ G d`.

*Needs:* nothing from this roadmap.

### 2.2 Countable exceptional sets

- **Monotonicity off a countable set** (`monotoneOn_of_upperRightDini_nonneg`): if `D` is
  order-connected, `s` countable, `f` continuous on `D`, and `D⁺f(x) ≥ 0` for every
  `x ∈ interior D` outside `s`, then `f` is monotone on `D` (Bruckner, Chapter XI, Corollary 4.2,
  p. 189; Bourbaki, *FRV*, Chapter I, §2, Proposition 2, p. 13, for the right derivative).

*Proof route.* Bruckner, Chapter XI, Theorem 4.1, p. 189, applied to `f t + ε t` for `ε > 0`:
if `f x₁ > f x₂` with `x₁ < x₂`, choose a level `y₀` strictly between, outside the countable
image `f(s)`, and take the last point where `f + ε t` is at least `y₀`; its upper right Dini
derivative is at most `0 < ε`. Let `ε → 0`. Mathlib's comparison lemma
`image_le_of_liminf_slope_right_lt_deriv_boundary` gives the case `s = ∅` in its lower-Dini form.

*Needs:* §1.1.

### 2.3 Almost-everywhere criteria

- **The almost-everywhere criterion** (`monotoneOn_of_ae_upperRightDini_nonneg`): if `f` is
  continuous on an order-connected `D`, `D⁺f ≥ 0` almost everywhere on `interior D`, and
  `D⁺f > -∞` at every point of `interior D` outside a countable set, then `f` is monotone on `D`
  (Bruckner, Chapter XI, Corollary 4.3, p. 189).
- **Goldowski–Tonelli theorem** (`monotoneOn_of_ae_deriv_nonneg`): if `f` is continuous on an
  order-connected `D`, has a derivative in `EReal` (the four Dini derivatives agree, possibly at
  `±∞`) at every point of `interior D` outside a countable set, and that derivative is
  nonnegative almost everywhere, then `f` is monotone on `D` (Bruckner, Chapter XI, p. 174;
  Thomson, §56, p. 137).

*Proof route.* For the almost-everywhere criterion: Bruckner, p. 189, observes that `f` has
property (N) on the set where `D⁺f` is finite and `≤ 0`; so for `ε > 0` the points of
`interior D` where `D⁺(f t + ε t) ≤ 0` lie in a null set of that kind together with a countable
set, their image under `f t + ε t` has empty interior, and Bruckner's Theorem 4.1, p. 189,
applies. For Goldowski–Tonelli: the same argument, where the exceptional null set also contains
points with derivative `-∞`, whose image must also be shown null; Thomson, §56, p. 137,
attributes the theorem and its proof to Saks. Both property (N) steps are cited, not derived
here, and are the parts of Layer 2 that need care.

*Needs:* §2.2; §3.1.

**Checks.**

- `risingSun` for `G = sin` on `[0, 2π]`: `E = (0, π/2) ∪ (π, 2π)`. On `(0, π/2)`, `c = a` and
  `G 0 = 0 < 1 = G (π/2)`, so only the inequality holds; on `(π, 2π)`, `G π = 0 = G (2π)`.
- Negative control for the countable exceptional set: `-C`, with `C` the Tau Ceti Cantor
  function, is continuous with derivative `0` almost everywhere and decreases from `0` to `-1` on
  `[0, 1]`, so it is not monotone (nondecreasing) there. The three theorems therefore force
  `D⁺(-C) < 0` on an uncountable set, `D⁺(-C) = -∞` on an uncountable set, and the failure of a
  finite or infinite derivative of `-C` on an uncountable set; replacing "off a countable set"
  by "almost everywhere" in any of them makes it false.
- `x ↦ -x` violates every hypothesis and is not monotone; `x ↦ |x|` on `[0, 1]` satisfies them
  with `s = ∅`.

### Examples

- A continuous function with a nonnegative right derivative everywhere is monotone, without
  any measure theory.

### Dependencies

Layer 1; Mathlib's `image_le_of_liminf_slope_right_lt_deriv_boundary`; §3.1 for §2.3.

## Layer 3: Images of null sets and the Denjoy–Young–Saks theorem

### 3.1 Images under functions with derivatives

- **Image estimate** (`volume_image_le_of_abs_deriv_le`): if `f` has a derivative at every point
  of an arbitrary set `A`, bounded in modulus by `K`, then `λ(f(A)) ≤ K λ(A)` for Lebesgue
  outer measure (Benedetto–Czaja, Lemma 4.6.1, p. 195; Leoni, Theorem 3.36, p. 85).
- **Null images** (`volume_image_eq_zero_iff`): if `f` has a derivative `f'` at every point of an
  arbitrary set `A`, then `λ(f(A)) = 0` iff `f' = 0` almost everywhere on `A`
  (Benedetto–Czaja, Theorem 4.6.4, p. 198).

*Proof route.* For the estimate: for `ε > 0` split `A` into the pieces `Aₙ` on which
`|f y - f x| ≤ (K + ε) |y - x|` for `|y - x| < 1/n`; cover `Aₙ` by intervals of length
`< 1/n` with total length `< λ(Aₙ) + ε`; each piece of `Aₙ` in such an interval has image of
diameter at most `(K + ε)` times the length. For null images, the forward direction: apply the
estimate with `K = ε` on `{f' = 0}` and Mathlib's null-image lemma on the null rest. The
converse is Benedetto–Czaja's proof, p. 198.

*Needs:* nothing from this roadmap.

### 3.2 The Denjoy–Young–Saks theorem

- **Denjoy–Young–Saks theorem** (`ae_dini_alternatives`): for an arbitrary `f`, at almost
  every `x` one of the following holds: the four Dini derivatives agree and are finite; or
  `D⁺f(x) = +∞`, `D₋f(x) = -∞` and `D₊f(x) = D⁻f(x)` is finite; or `D⁻f(x) = +∞`,
  `D₊f(x) = -∞` and `D₋f(x) = D⁺f(x)` is finite; or `D⁺f(x) = D⁻f(x) = +∞` and
  `D₊f(x) = D₋f(x) = -∞` (Thomson, §70, p. 166).
- **No infinite one-sided bounds** (`ae_dini_ne_infty`): for an arbitrary `f`, almost
  everywhere no lower Dini derivative is `+∞` and no upper Dini derivative is `-∞`. It is a
  corollary of the four alternatives, checked case by case.
- Target in prose: Lebesgue's theorem that a monotone function is differentiable almost
  everywhere (Mathlib's `Monotone.ae_hasDerivAt`) follows from the Denjoy–Young–Saks theorem,
  since for a monotone function the lower Dini derivatives are `≥ 0`, which excludes the last
  three alternatives on a set of full measure. This derivation is a test of the statement, not a
  replacement for Mathlib's proof.

*Proof route.* Thomson's proof, §70, p. 166 and the pages following: Young's theorem (§1.3)
disposes of the points where an upper Dini derivative on one side lies below the lower one on
the other side, and the remaining cases, a finite upper Dini derivative on one side with a
different lower one on the same side, are shown null for each pair of rationals by the Vitali
covering theorem for Lebesgue outer measure. The corollary `ae_dini_ne_infty` reads off the four
alternatives.

*Needs:* §§1.1, 1.3.

**Checks.**

- `volume_image_le_of_abs_deriv_le` for `x²` on `A = [0, 1]` with `K = 2`: the image `[0, 1]`
  has measure `1 ≤ 2`.
- Negative control for the hypothesis "the derivative exists at every point of `A`" in
  `volume_image_eq_zero_iff`: the Cantor function `C` has `C' = 0` almost everywhere on `[0, 1]`
  yet `C([0, 1]) = [0, 1]`. The theorem does not apply because `C` is not differentiable on the
  Cantor set; with `A` the complement of the Cantor set in `[0, 1]` it gives `λ(C(A)) = 0`,
  correctly, since `C(A)` is the countable set of dyadic rationals in `(0, 1)`.
- The Denjoy–Young–Saks alternatives at `x = 0` for `|x|`: none applies (right `1`, left `-1`),
  consistent with an exception on a null set.

### Examples

- For any `f : ℝ → ℝ`, even non-measurable, the set of points with a two-sided infinite
  derivative is null, by `ae_dini_ne_infty`.

### Dependencies

Layer 1; Lebesgue outer measure and Vitali covering families from Mathlib.

## Layer 4: Variation, absolute continuity and the Lusin property

### 4.1 Helly's selection theorem

- **Helly's selection theorem** (`exists_subseq_tendsto_of_eVariationOn_le`): on an
  order-connected `I` with `x₀ ∈ I`, a sequence `fₙ` with `|fₙ x₀| ≤ M` and
  `eVariationOn fₙ I ≤ V` (`V : ℝ≥0`) has a subsequence converging at every point of `I` to a
  function `g` with `eVariationOn g I ≤ V` (Leoni, Theorem 2.44, p. 49).

*Proof route.* Mathlib's Jordan decomposition writes each `fₙ` as a difference of monotone
functions bounded on `I` uniformly in `n`. A diagonal subsequence converges at the rationals of
`I` (and at its endpoints); the monotone limits extend, and converge off their countable sets of
discontinuities; a second diagonal argument handles those. The variation bound is lower
semicontinuity under pointwise convergence (Leoni, Proposition 2.47, p. 51), proved in Tau Ceti
in `TauCeti/Topology/EMetricSpace/BoundedVariation.lean`.

*Needs:* nothing from this roadmap.

### 4.2 Derivative and variation

- **Integral of the derivative** (`lintegral_enorm_deriv_le_eVariationOn`): for every `f` and
  `a, b`, `∫⁻ x in Icc a b, ‖deriv f x‖ₑ ≤ eVariationOn f (Icc a b)` (Leoni, Corollary 2.31,
  p. 42; Benedetto–Czaja, Theorem 4.5.6(a), p. 192).
- **Tonelli's characterization** (`absolutelyContinuousOnInterval_iff_eVariationOn_eq_lintegral`):
  for `f` of bounded variation on `[a, b]`, `f` is absolutely continuous on `[a, b]` iff
  `eVariationOn f (Icc a b) = ∫⁻ x in Icc a b, ‖deriv f x‖ₑ` (Leoni, Theorem 3.25, p. 80). The
  forward direction is in Tau Ceti (see *Exact supplier contracts*).
- **Fubini's termwise differentiation theorem** (`hasDerivAt_tsum_of_monotone`): for monotone
  `fₙ` with `∑ fₙ x` summable at every `x`, almost everywhere `∑ deriv fₙ x` is summable and is
  the derivative of the sum (Leoni, Theorem 1.34, p. 23; Hewitt–Stromberg, (17.18), p. 267).

*Proof route.* The inequality: with infinite variation there is nothing to prove; otherwise
Mathlib's almost-everywhere differentiability of functions of bounded variation, Fatou's lemma
for the difference quotients, and the bound of the integrated quotients by the variation.
Tonelli: with `v` the variation function `x ↦ eVariationOn f (Icc a x)`, `v' = |f'|` almost
everywhere; the hypothesis gives `v b - v a = ∫ v'`, so the monotone function
`v - ∫ v'` is constant, `v` is absolutely continuous, and `|f y - f x| ≤ v y - v x` transfers it
to `f`. Fubini: on each `[-N, N]`, the tails `∑_{n>m} fₙ` are monotone; Lebesgue's theorem and
a subsequence of partial sums whose tails at `±N` are summable give the result.

*Needs:* nothing from this roadmap.

### 4.3 Lusin's property (N) and the Banach–Zarecki theorem

- **Property (N)** (`HasLusinN`): `f` maps every Lebesgue-null subset of `s` to a Lebesgue-null
  set (Hewitt–Stromberg, (18.24), p. 288).
- **Banach–Zarecki theorem** (`absolutelyContinuousOnInterval_iff_hasLusinN`): `f` is
  absolutely continuous on `uIcc a b` iff it is continuous, of bounded variation and has
  property (N) there (Benedetto–Czaja, Theorem 4.6.2, p. 196; Hewitt–Stromberg, (18.25),
  p. 288; Leoni, Corollary 3.49, p. 89).
- **Measurable images** (`nullMeasurableSet_image_iff_hasLusinN`): a function continuous on
  `[a, b]` maps Lebesgue measurable subsets of `[a, b]` to Lebesgue measurable sets iff it has
  property (N) on `[a, b]` (Hewitt–Stromberg, Exercise (18.39)(b), p. 297).

*Proof route.* Banach–Zarecki forward: absolute continuity and an open cover of the null set by
intervals of small total length. Backward: Benedetto–Czaja, p. 196, using §3.1 on the set where
`f` has a finite derivative, property (N) on the null rest, and §4.2 to bound the oscillation
on each interval by the integral of `|f'|`. Measurable images: a measurable set is a
`σ`-compact set plus a null set, continuous images of compact sets are compact, and the null
part goes to a null set; conversely, if a null set has an image of positive outer measure, a
non-measurable subset of that image pulls back to a null, hence measurable, set
(Hewitt–Stromberg's hint, p. 297).

*Needs:* §§3.1, 4.2.

### 4.4 Singular and nowhere monotone functions

- **Strictly increasing singular functions** (`exists_strictMono_ae_hasDerivAt_zero`): there is
  a continuous strictly increasing `f : ℝ → ℝ` with derivative `0` almost everywhere (Leoni,
  Theorem 1.37, p. 25; Hewitt–Stromberg, (18.8), p. 278).
- **Weil's theorem** (`exists_hasDerivWithinAt_nowhere_monotone`): there is a function on
  `[0, 1]` with a derivative, bounded on `[0, 1]`, at every point of `[0, 1]`, that is monotone
  on no subinterval (Leoni, Theorem 2.40, p. 45; Bruckner, Chapter II, Theorem 6.6, p. 32).

*Proof route.* For the singular function: `∑ 2⁻ⁿ C(x - qₙ)` over an enumeration `qₙ` of the
rationals, with `C` the Tau Ceti Cantor function; it is strictly increasing since `C` is `0` on
`(-∞, 0]` and positive on `(0, ∞)`, continuous by uniform convergence, and singular by Fubini's
theorem (§4.2). For Weil's theorem: Leoni's proof, p. 45, is a Baire category argument in the
Banach space of bounded derivatives on `[0, 1]`; Bruckner's construction uses Zahorski's lemma
(§7.2).

*Needs:* §4.2; Mathlib's Baire category theorem.

**Checks.**

- `LipschitzOnWith.hasLusinN`: a function Lipschitz on `s` with constant `K` multiplies outer
  measure of subsets of `s` by at most `K`, so it has property (N).
- Negative control for property (N): the Cantor function `C` is continuous and of bounded
  variation on `[0, 1]` (variation `1`) and maps the null Cantor set onto `[0, 1]`, so it fails
  property (N) and, by Banach–Zarecki, is not absolutely continuous; this agrees with Tau Ceti's
  theorem that `C` is not absolutely continuous on `[0, 1]`.
- Negative control for the bounded-variation hypothesis in Tonelli's characterization:
  `x sin(1/x)` on `[0, 1]` is continuous with infinite variation and
  `∫ |f'| = ∞` (both grow like `(2/π) log(1/δ)` on `[δ, 1]`: numerically `≈ 3.0, 4.6, 5.9` for
  `δ = 10⁻², 10⁻³, 10⁻⁴`), so both sides of the equation are `⊤`, while `f` is not
  absolutely continuous.
- Negative control for the variation bound in Helly's theorem: `sin(n x)` on `[0, π]` is bounded
  by `1` with variation `2n`; for `n ≠ m`, `∫₀^π (sin nx - sin mx)² = π`, so no subsequence
  converges almost everywhere (dominated convergence would make these distances tend to `0`).
- Fubini for the jump series `∑ 2⁻ⁿ 1[qₙ ≤ x]`: the sum is strictly increasing, with derivative
  `0` almost everywhere, and each term has derivative `0` almost everywhere.
- Banach indicatrix: Tau Ceti's indicatrix theorem gives, for continuous `f`,
  `eVariationOn f (Icc a b)` as the integral of the number of preimages; for `sin` on `[0, 2π]`
  both sides are `4` (each `y ∈ (-1, 1)` has two preimages), a test of the variation
  conventions used here.

### Examples

- The Cantor function is continuous, of bounded variation, singular, and fails property (N);
  `x ↦ (x + C(x))/2` is strictly increasing and still fails property (N).
- `√x` on `[0, 1]` is absolutely continuous with unbounded derivative.

### Dependencies

Mathlib's `eVariationOn`, `BoundedVariationOn`, `AbsolutelyContinuousOnInterval` and its
fundamental theorem of calculus, `LocallyBoundedVariationOn.ae_differentiableAt` and
`Monotone.ae_hasDerivAt`; Tau Ceti's variation and Cantor function files listed under *Exact
supplier contracts*; Layer 3.

## Layer 5: Functions of the first Baire class

### 5.1 Definition and derivatives

- **First Baire class** (`IsBaireOne`): `f : X → Y` is a pointwise limit of a sequence of
  continuous functions. Kechris, §24.A, p. 190, defines the class by `F_σ` preimages of open
  sets; Theorem (24.10), p. 192, below, identifies the two for real functions on separable
  metrizable spaces.
- **Derivatives are of the first Baire class** (`Differentiable.isBaireOne_deriv`): the
  derivative of a differentiable `f : ℝ → ℝ` is of the first Baire class (Kechris, Exercise
  (24.17), p. 194).

*Proof route.* `deriv f x` is the limit of the continuous functions `n (f (x + 1/n) - f x)`.

*Needs:* nothing from this roadmap.

### 5.2 The characterizations of Lebesgue–Hausdorff and Baire

- **Lebesgue–Hausdorff theorem** (`isBaireOne_iff_isGδ_preimage`): on a separable metrizable
  space, a real function is of the first Baire class iff the preimage of every closed set is a
  `G_δ` (Kechris, Theorem (24.10), p. 192).
- **Baire's continuity theorem** (`IsBaireOne.setOf_continuousAt_mem_residual`): on a metrizable
  space, the continuity points of a real function of the first Baire class form a residual set
  (Kechris, Theorem (24.14), p. 193). That set is a `G_δ` by Mathlib's
  `IsGδ.setOfPred_continuousAt`, so the discontinuity set of a derivative is a meagre `F_σ`.
- **Baire's characterization** (`isBaireOne_iff_exists_continuousWithinAt`): on a Polish space,
  a real function is of the first Baire class iff its restriction to every nonempty closed set
  has a point of continuity (Kechris, Theorem (24.15), p. 193).

*Proof route.* Kechris's proofs, pp. 192–193. For Lebesgue–Hausdorff the backward direction
builds the approximating continuous functions from the `F_σ` preimages of the rational
intervals; the forward direction writes `f⁻¹(F)`, for closed `F`, as
`⋂ₖ ⋃ₙ ⋂_{m ≥ n} gₘ⁻¹(F_{1/k})` with `F_{1/k}` the closed `1/k`-neighbourhood. For Baire's
theorem, for each `ε` the set of points of oscillation `≥ ε` is closed and nowhere dense.

*Needs:* §5.1.

### 5.3 Continuity sets of derivatives

- **Continuity sets of derivatives** (`exists_deriv_continuity_set_iff`): a subset `A` of
  `[a, b]`, `a < b`, is the set of points of `[a, b]` at which a derivative on `[a, b]` is
  continuous relative to `[a, b]` iff `A` is dense in `[a, b]` and a `G_δ` (Bruckner, Chapter
  III, Theorems 2.1, p. 46, and 2.2, p. 47).

*Proof route.* Necessity from §§5.1–5.2 on the Polish space `[a, b]`, since `[a, b]` is closed
and a relative `G_δ` of it is a `G_δ` of `ℝ`. Sufficiency is Bruckner's construction,
pp. 46–47.

*Needs:* §§5.1, 5.2.

**Checks.**

- `isBaireOne_indicator_singleton`: the indicator of `{0}` is the limit of the tents
  `max 0 (1 - n|x|)`.
- Negative control `not_isBaireOne_indicator_rat`: the indicator of `ℚ` vanishes almost
  everywhere and is the double limit `lim_m lim_n cos(m! π x)^(2n)`, but it is continuous
  nowhere, so by Baire's theorem it is not of the first Baire class. A definition by
  almost-everywhere limits, or by iterated limits, would get this wrong.
- `x² sin(1/x)` (with value `0` at `0`) is differentiable with derivative discontinuous exactly
  at `0`; `ℝ \ {0}` is a dense `G_δ`, as §5.3 requires.

### Examples

- The derivative of a differentiable function is continuous on a dense `G_δ`, and Darboux's
  theorem (Mathlib's `exists_hasDerivWithinAt_eq_of_gt_of_lt`) gives it the intermediate value
  property; Weil's function (§4.4) shows that it can change sign on every interval.

### Dependencies

Mathlib's `IsGδ`, `residual`, `BaireSpace`, `PolishSpace` and Baire category theorem.

## Layer 6: Typical continuous functions

- **Banach–Mazurkiewicz theorem** (`isMeagre_setOf_exists_rightDini_finite`): in the Banach
  space `C(Icc a b, ℝ)`, `a < b`, the functions having, at some point of `[a, b)`, an upper right
  Dini derivative `< +∞` and a lower right Dini derivative `> -∞` form a meagre set
  (Hewitt–Stromberg, (17.8), p. 260, on `[0, 1]`). Functions are extended to `ℝ` by Mathlib's
  `Set.IccExtend`; for `x < b` the right Dini derivatives see only `[a, b]`.
- **Typical nowhere differentiability** (`residual_forall_not_differentiableAt`): the typical
  continuous function on `[a, b]` is differentiable at no point of `(a, b)` (Kechris, Exercise
  (8.6), p. 42).
- Target in prose: the typical continuous function is monotone on no subinterval, since the
  monotone functions on a fixed rational interval form a closed nowhere dense set.

*Proof route.* Hewitt–Stromberg, proof of (17.8): the set `Eₙ` of `g` for which some
`x ∈ [a, b - 1/n]` has `|g (x + h) - g x| ≤ n h` for `0 < h < 1/n` is closed and nowhere dense
(approximate by polygonal functions with steep teeth). If both right Dini derivatives at `x` are
finite, `g ∈ Eₙ` for large `n`. The general interval follows from `[0, 1]` by an affine change of
variable. Nowhere differentiability: differentiability at `x ∈ (a, b)` makes both right Dini
derivatives finite by `hasDerivAt_iff_dini`.

*Needs:* §1.1; Mathlib's Baire category theorem on the complete space `C(Icc a b, ℝ)`.

**Checks.**

- The meagre set is dense: it contains every polynomial and every piecewise linear function,
  whose right Dini derivatives are finite everywhere. So the theorem is a category statement and
  not a statement about an open set.

### Examples

- The Weierstrass function, proved nowhere differentiable in Mathlib's Counterexamples
  directory, is an explicit member of the residual set of the second headline.

### Dependencies

Layer 1; Mathlib's `IsMeagre`, `residual` and the Baire space instance on complete metric
spaces.

## Layer 7: Approximate continuity and the density topology

### 7.1 Density and approximate continuity

- **Density zero** (`HasDensityZeroAt`): `λ(s ∩ B(x, r)) / λ(B(x, r)) → 0` as `r → 0⁺`, for
  Lebesgue outer measure and closed balls (Bruckner, Chapter II, §5, p. 18).
- **Density point** (`IsDensityPoint`): `x` is a density point of `s` if `sᶜ` has density `0` at
  `x`.
- **Approximate continuity** (`ApproximatelyContinuousAt`): for every `ε > 0` the set
  `{y | ε ≤ |f y - f x|}` has density `0` at `x` (Bruckner, Chapter II, §5, p. 19).
- **Lebesgue's density theorem** (`ae_isDensityPoint`): almost every point of a Lebesgue
  measurable set is a density point of it (Bruckner, Chapter II, Theorem 5.1, p. 18).
- **Denjoy's measurability criterion** (`aemeasurable_iff_ae_approximatelyContinuousAt`): `f` is
  Lebesgue measurable iff it is approximately continuous almost everywhere (Bruckner, Chapter
  II, Theorem 5.2, p. 19; Kharazishvili, Exercise 4, p. 407).
- **Approximately continuous functions are derivatives**
  (`hasDerivAt_integral_of_approximatelyContinuousAt`): a bounded measurable `f` is the
  derivative of `u ↦ ∫ t in 0..u, f t` at every point of approximate continuity. Bruckner,
  Chapter II, Theorem 5.5(a), p. 21, states the everywhere form: a bounded approximately
  continuous function is a derivative.
- **Approximately continuous functions are of the first Baire class**
  (`isBaireOne_of_approximatelyContinuousAt`): a function approximately continuous at every
  point is of the first Baire class (Bruckner, Chapter II, Theorem 5.5(b), p. 21).

*Proof route.* Lebesgue's density theorem: Mathlib's
`Besicovitch.ae_tendsto_measure_inter_div` gives density `1` of `s` almost everywhere on `s`;
for measurable `s` the measure of `sᶜ ∩ B` is that of `B` minus that of `s ∩ B`. Denjoy:
forward from Lusin's theorem and the density theorem applied to the closed sets of continuity;
backward, the sets `{f > c}` differ from measurable sets by null sets. Derivatives: with
`|f| ≤ C` and `A_ε = {|f - f x| ≥ ε}`,
`|∫ₓ^{x+h} f - h f x| ≤ ε |h| + 2C λ(A_ε ∩ B(x, |h|)) = o(h)`. Baire class one: Bruckner's
proof, p. 21.

*Needs:* §5.1 for the last headline.

### 7.2 The Lusin–Menchoff theorem and Zahorski's lemma

- **Lusin–Menchoff theorem** (`exists_perfect_isDensityPoint`): if `E` is measurable, `X ⊆ E`
  closed, and every point of `X` is a density point of `E`, there is a perfect `P` with
  `X ⊆ P ⊆ E` and every point of `X` a density point of `P` (Bruckner, Chapter II, Theorem 6.4,
  p. 27).
- **Zahorski's lemma** (`exists_approximatelyContinuousAt_pos_on`): if `E = ⋃ₙ Fₙ` with `Fₙ`
  closed and every point of `E` a density point of `E`, there is an approximately continuous,
  upper semicontinuous `f` with `0 < f ≤ 1` on `E` and `f = 0` off `E` (Bruckner, Chapter II,
  Theorem 6.5, pp. 28–29).

*Proof route.* Bruckner's proofs, pp. 27–29. Lusin–Menchoff first replaces `E` by an `F_σ`
subset with density `1` at each of its points and `X` by a perfect set (Bruckner, p. 27).
Zahorski's lemma writes `E = ⋃ₙ Fₙ` and builds `f` from sets supplied by Lusin–Menchoff
(Bruckner, p. 29).

*Needs:* §7.1.

### 7.3 The density topology

- **Density-open sets** (`IsDensityOpen`): every point of `U` is a density point of `U`.
- **Density-open sets are measurable** (`IsDensityOpen.nullMeasurableSet`): every density-open
  set is Lebesgue measurable (Bruckner, Chapter II, §5, p. 20).
- **The density topology** (`densityTopology`): the topology on `ℝ` generated by the
  density-open sets.
- **Its open sets** (`isOpen_densityTopology_iff`): the open sets of `densityTopology` are
  exactly the density-open sets (Kharazishvili, Exercise 9, p. 408; Bruckner, Chapter II, §5,
  p. 20).
- **Comparison with the usual topology** (`densityTopology_lt`): `densityTopology` is strictly
  finer than the usual topology of `ℝ`, and every Lebesgue-null set is closed in it
  (Kharazishvili, Exercise 9, p. 408).
- **Continuity is approximate continuity** (`continuousAt_densityTopology_iff`): `f` is
  continuous at `x` from the density topology to the usual topology iff it is approximately
  continuous at `x` (Kharazishvili, Exercise 10, p. 408; Bruckner, Chapter II, §5, p. 20).
- **Baire property** (`baireSpace_densityTopology`): the density topology is a Baire space
  (Kharazishvili, Exercise 9, p. 408).
- **Complete regularity** (`completelyRegularSpace_densityTopology`): the density topology is
  completely regular (Kharazishvili, Appendix, p. 404).
- **Failure of normality** (`not_normalSpace_densityTopology`): the density topology is not
  normal.
- Target in prose: the density topology is not separable (Kharazishvili, Exercise 9,
  p. 408).

*Proof route.* Measurability: let `G` be a measurable hull of `Uᶜ`, so that
`λ(G ∩ B) = λ*(Uᶜ ∩ B)` for every ball; every point of `U ∩ G` has `G`-density `0`, so `U ∩ G`
is null by the density theorem and `U = Gᶜ ∪ (U ∩ G)`. Open sets: with outer measure in the
definition, density-open sets are closed under arbitrary unions (a density point of a member is
one of the union) and finite intersections (subadditivity), and contain `univ`, so they are
exactly the generated open sets. Comparison: usual open sets are density-open; for null `s`,
every point of `sᶜ` is a density point of `sᶜ`; `ℚ` is closed in `densityTopology` and not in
the usual topology. Continuity: for the backward direction take a measurable hull `G` of
`{y | ε ≤ |f y - f x|}`; the density points of `Gᶜ ∪ {x}` belonging to it form a density-open
neighbourhood of `x` on which `|f - f x| < ε`. Baire: a set with empty density-interior is
first category in `densityTopology` exactly when it is null (Kharazishvili, Exercise 9,
p. 408), while a nonempty density-open set has positive measure.
Complete regularity: for `x` in a density-open `U`, Lusin–Menchoff gives an `F_σ` set `E` with
`x ∈ E ⊆ U` and every point of `E` a density point of `E`; Zahorski's function for `E`, divided
by its value at `x` and truncated at `1`, separates `x` from `Uᶜ`. Non-normality: `ℚ` and a
null dense `G_δ` set `H` disjoint from it (for instance the Liouville numbers) are disjoint
closed sets. If `U ⊇ ℚ` and `V ⊇ H` were disjoint and density-open, the sets
`Dₙ = {x | ∀ h ∈ (0, 1/n), λ(V ∩ [x - h, x + h]) ≥ 3h/2}` are closed in the usual topology and
cover `H`; by the Baire category theorem on the Polish space `H` one of them contains `H ∩ J`
for an open interval `J`, hence, being closed and `H` dense, all of `J`, and so a rational `q`.
At `q`, `U` has density `1` and `V` relative density at least `3/4` in small intervals, so
`U ∩ V` has positive measure, a contradiction.

*Needs:* §§7.1, 7.2.

**Checks.**

- `hasDensityZeroAt_sparseSet`: the set `⋃ₙ [2^{-(n+1)} - 4^{-(n+1)}, 2^{-(n+1)}]` accumulates at
  `0` but has density `0` there; numerically the ratio is about `2.6·10⁻²`, `4.1·10⁻³`,
  `6.4·10⁻⁴` and `2.5·10⁻⁵` at `r = 10⁻¹, …, 10⁻⁴`.
- Negative control for the ball convention, `not_isDensityPoint_Ioi_zero`: `(0, ∞)` has density
  `1/2` at `0`, so `0` is not a density point of it; a one-sided ball `[x, x + r]` would make it
  one.
- `approximatelyContinuousAt_indicator_sparseSet`: the indicator of the sparse set is
  approximately continuous at `0` but not continuous there.
- Negative control `approximatelyContinuousAt_indicator_rat_iff`: the indicator of `ℚ` is
  approximately continuous exactly at the irrationals. At a rational `x` the bad set is the
  irrationals, of density `1`. A plausible wrong definition, "`f` agrees almost everywhere with
  a function continuous at `x`", would accept every point, since the indicator vanishes almost
  everywhere.
- In `densityTopology` every subset of `ℚ` is closed, being null, so `ℚ` is closed and
  discrete; this is the configuration used in the proof of non-normality.

### Examples

- A measurable set `E` is density-open after removing the null set of its points that are not
  density points: by Lebesgue's density theorem the density points of `E` lying in `E` form a
  density-open set of the same measure.

### Dependencies

Mathlib's Lebesgue and Besicovitch density theorems, `Real.volume_closedBall`, `Perfect`,
`TopologicalSpace.generateFrom`, `CompletelyRegularSpace`, `NormalSpace` and `BaireSpace`;
Layer 5.

## Downstream consumers

- No roadmap on main consumes this one. A roadmap on nonabsolute integration (the Denjoy,
  Perron and Henstock–Kurzweil integrals and their descriptive characterizations) is the
  intended consumer: it needs the Dini derivatives and monotonicity criteria of Layers 1–2, the
  image estimates and the Denjoy–Young–Saks theorem of Layer 3, property (N) and the
  Banach–Zarecki theorem of Layer 4, and approximate continuity of Layer 7 for the approximate
  derivative.

## Scope and ownership

Completion means:

1. The four Dini derivatives with differentiability, Dini's bounds theorem, measurability and
   Young's countability theorem (Layer 1).
2. The rising sun lemma and the monotonicity criteria with countable exceptional sets, almost
   everywhere, and of Goldowski–Tonelli (Layer 2).
3. The image estimates and the Denjoy–Young–Saks theorem (Layer 3).
4. Helly's selection theorem, the variation inequality and Tonelli's characterization, Fubini's
   termwise differentiation theorem, property (N), the Banach–Zarecki theorem and measurable
   images, strictly increasing singular functions and Weil's nowhere monotone function
   (Layer 4).
5. The first Baire class with the theorems of Lebesgue–Hausdorff and Baire and the continuity
   sets of derivatives (Layer 5).
6. The Banach–Mazurkiewicz theorem and typical nowhere differentiability (Layer 6).
7. Density, approximate continuity, the Lusin–Menchoff theorem, Zahorski's lemma and the density
   topology with its separation properties (Layer 7).

**Not owned here.**

- Rectifiable curves, arclength, and the variation of curves in several dimensions are owned by
  [GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G1. Distributional functions of
  bounded variation, their derivative measures and the one-dimensional comparison of the
  classical variation with the total variation of the derivative measure are owned there, G3.
  This roadmap states nothing about distributional derivatives.
- The identification of `W^{1,p}(a, b)` with absolutely continuous functions with derivative in
  `Lᵖ` is owned by [PDE](../PDE/README.md), §1.1.
- The `p`-variation for `p ≠ 1`, controls and Hölder paths are owned by the roadmap on Young
  integration and rough paths (an open pull request); this roadmap uses only the `1`-variation
  `eVariationOn`.
- The Banach indicatrix theorem for continuous curves, the variation formula for absolutely
  continuous curves, and the Cantor function are in Tau Ceti at the pin and are consumed, not
  restated. The continuous Jordan decomposition of a continuous function of locally bounded
  variation is in Tau Ceti after the pin and is not a target here.
- The Weierstrass nowhere differentiable function is in Mathlib's Counterexamples directory
  and is used only as an example.
- [Poincare3D](../Poincare3D/README.md), §11.1, uses an upper right Dini derivative inequality
  locally; it can consume `upperRightDini` and the monotonicity criterion of §2.2.
- Approximate derivatives and the approximate Denjoy–Young–Saks theorem are listed under
  *Beyond this roadmap*.

## Exact supplier contracts

### From Mathlib

- `slope` (`Mathlib/LinearAlgebra/AffineSpace/Slope.lean`), `EReal`, `limsup` and `liminf`: the
  Dini derivatives.
- `eVariationOn`, `BoundedVariationOn` and `eVariationOn.lowerSemicontinuous`
  (`Mathlib/Topology/EMetricSpace/BoundedVariation.lean`);
  `LocallyBoundedVariationOn.ae_differentiableAt` and `Monotone.ae_hasDerivAt`
  (`Mathlib/Analysis/BoundedVariation.lean`, `Mathlib/Analysis/Calculus/Monotone.lean`).
- `AbsolutelyContinuousOnInterval`, `AbsolutelyContinuousOnInterval.boundedVariationOn` and
  `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`
  (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean` and
  `Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`).
- `image_le_of_liminf_slope_right_lt_deriv_boundary` (`Mathlib/Analysis/Calculus/MeanValue.lean`)
  and `exists_hasDerivWithinAt_eq_of_gt_of_lt` (`Mathlib/Analysis/Calculus/Darboux.lean`).
- `MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero` and
  `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`
  (`Mathlib/MeasureTheory/Function/Jacobian.lean`): the null-image lemmas used in §3.1.
- `Besicovitch.ae_tendsto_measure_inter_div` (`Mathlib/MeasureTheory/Covering/Besicovitch.lean`)
  and Mathlib's Vitali covering families: the density theorems of Layers 3 and 7.
- `IsGδ.setOfPred_continuousAt`, `residual`, `IsMeagre`, `BaireSpace` and `Perfect`
  (`Mathlib/Topology/GDelta/`, `Mathlib/Topology/Baire/`, `Mathlib/Topology/Perfect.lean`);
  `Set.IccExtend`; `TopologicalSpace.generateFrom`, `CompletelyRegularSpace` and `NormalSpace`.
- Mathlib has no Dini derivative, property (N), Baire class, approximate continuity, density
  topology or Helly selection theorem. The open Mathlib pull request #41552
  (`Mathlib/Analysis/Calculus/MeanValueCountableExceptions.lean`) proves monotonicity of a
  continuous function on an order-connected set whose lower right difference quotients are
  eventually `> -r` for every `r > 0`, off a countable set, following Bourbaki, *FRV*, Chapter I,
  §2, Proposition 2, p. 13. §2.2 uses its hypothesis shape (`OrdConnected D`, countable `s`,
  `interior D`) and weakens its derivative hypothesis to the upper right Dini derivative; the
  pull request's theorem is the special case.

### From Tau Ceti

- `TauCeti/MeasureTheory/Function/MetricDerivative/Variation.lean`: the variation of an
  absolutely continuous function on `uIcc a b` equals the integral over `uIoc a b` of the norm
  of its derivative. It is the forward direction of Tonelli's characterization (§4.2).
- `TauCeti/MeasureTheory/Function/AreaFormula/Curve.lean`: the Banach indicatrix theorem, the
  variation on `[a, b]` of a curve continuous on `[a, b]` as the integral, against
  one-dimensional Hausdorff measure, of the number of preimages. It is used as a Check in
  Layer 4 and is not restated.
- `TauCeti/Topology/EMetricSpace/BoundedVariation.lean`: lower semicontinuity of the variation
  under pointwise convergence with eventually bounded variations, the last step of Helly's
  theorem (§4.1).
- `TauCeti/Analysis/SpecialFunctions/CantorFunction.lean`: the Cantor function, with its
  continuity, monotonicity, values, image of the Cantor set, almost-everywhere vanishing
  derivative, variation `1` and failure of absolute continuity. It is the negative control of
  Layers 2–4 and the building block of §4.4.
- These four files are at the Tau Ceti pin, but the shared build of the pin does not contain
  their compiled modules, so `Suggested.lean` imports only Mathlib and names them here only.

### From other roadmaps

- No other roadmap is consumed.

## Beyond this roadmap

- **Approximate derivatives and the approximate Denjoy–Young–Saks theorem**: the approximate
  Dini derivatives defined through density, Khintchine's theorem, and the approximate form of
  the four alternatives. It needs Layer 7 together with Layer 3.
- **Nonabsolute integration**: the Denjoy, Perron and Henstock–Kurzweil integrals, generalized
  absolute continuity (`ACG*`, `VBG*`), and the descriptive characterization of the Denjoy
  integral. A separate roadmap; it consumes Layers 1–4 and 7.
- **The Zahorski classes of derivatives** (Bruckner, Chapter VI, pp. 85–97): classes of
  functions defined by the density of their level sets; needs Layers 5 and 7.
- **Darboux functions of the first Baire class and monotonicity theorems for generalized
  derivatives** (Bruckner, Chapters I–II and XI, §§2–3): needs Layers 2 and 5.
- **Density topologies for other measures and in several variables**, and the
  `I`-density topology of category: separate topological roadmaps.

## Prior formalization

- CKMA, *Core knowledge in mathematical analysis*, a Lean project under the Apache 2.0 licence
  (https://github.com/bjbraams/lean-CKMA). Fully proved there, in `CKMA/Analysis/Real/`:
  `Dini/Basic.lean` defines the four Dini derivatives through the extended difference quotient
  at `0⁺` and the four Dini types; `Dini.lean` proves the Denjoy–Young–Saks theorem for an
  arbitrary function; `Dini/RisingSun.lean` proves a local rising sun lemma; `Baire.lean`
  defines first-class functions on a set and proves that derivatives are of the first class;
  `ApproximateContinuity.lean` defines density zero with closed balls and approximate
  continuity, and proves approximate continuity almost everywhere for measurable functions.
  They are the starting point for §§1.1, 3.2, 2.1, 5.1 and 7.1, with the statements here adapted
  to `slope` and to functions on all of `ℝ`.
- CKMA coverage of this roadmap, in the numbering of its synopsis of area 05: the proved
  entries 05.7 (Baire classification of derivatives, §5.1), 05.10 (Denjoy–Young–Saks, §3.2) and
  05.30 (approximate continuity, §7.1); the variation entries of that area that CKMA records as
  gaps are the subject of Layer 4.
- The Mathlib pull request #41552 on monotonicity with countable exceptional sets, see *Exact
  supplier contracts*.

## References

- A. M. Bruckner, *Differentiation of Real Functions*, Lecture Notes in Mathematics 659,
  Springer, 1978. Chapters II–IV and XI.
- B. S. Thomson, *Real Functions*, Lecture Notes in Mathematics 1170, Springer, 1985. §§56, 59,
  70.
- G. Leoni, *A First Course in Sobolev Spaces*, 2nd ed., Graduate Studies in Mathematics 181,
  American Mathematical Society, 2017. Chapters 1–3.
- E. Hewitt and K. Stromberg, *Real and Abstract Analysis*, Graduate Texts in Mathematics 25,
  Springer, 1975. §§17–18.
- J. J. Benedetto and W. Czaja, *Integration and Modern Analysis*, Birkhäuser, 2009. Chapter 4.
- A. S. Kechris, *Classical Descriptive Set Theory*, Graduate Texts in Mathematics 156,
  Springer, 1995. §§8, 24.
- E. M. Stein and R. Shakarchi, *Real Analysis: Measure Theory, Integration, and Hilbert
  Spaces*, Princeton Lectures in Analysis III, Princeton University Press, 2005. Chapter 3.
- N. Bourbaki, *Functions of a Real Variable: Elementary Theory*, Springer, 2004. Chapter I.
- A. B. Kharazishvili, *Topics in Measure Theory and Real Analysis*, Atlantis Studies in
  Mathematics 2, Atlantis Press / World Scientific, 2009. Exercises of the chapter on the density
  topology and the Appendix.

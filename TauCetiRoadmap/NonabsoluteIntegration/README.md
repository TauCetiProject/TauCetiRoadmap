# Roadmap: Nonabsolute integration

**Summary.** This roadmap builds the theory of the Henstock–Kurzweil integral on a compact
interval of the real line: the gauge integral defined by Riemann sums over tagged partitions
whose fineness may vary from point to point, which integrates every derivative and contains the
Lebesgue integral and the improper Riemann integral.

- The basic theory of the indefinite integral: the Saks–Henstock lemma, continuity of the
  primitive, differentiability at points of continuity of the integrand, Hake's theorem that
  the integral contains its own improper extensions, and monotonicity of the integral.
- The comparison with Lebesgue integration: the primitive has derivative equal to the
  integrand almost everywhere, so every integrable function is measurable; an integrable
  function bounded below by a Lebesgue integrable one is Lebesgue integrable; a function is
  Lebesgue integrable exactly when it and its modulus are gauge integrable; the McShane integral
  is the Lebesgue integral; and the monotone and dominated convergence theorems.
- Generalized absolute continuity in the restricted sense: the classes VB*, VBG*, AC* and ACG*
  of Denjoy and Lusin, the theorem that VBG* functions are differentiable almost everywhere,
  the characterization of ACG* functions as the continuous VBG* functions with Lusin's
  property (N), and the descriptive characterization of the integral: the primitives are
  exactly the ACG* functions, and they are determined by their derivative almost everywhere.
  This identifies the Henstock–Kurzweil integral with the restricted Denjoy integral.
- The Perron integral, defined through major and minor functions with Dini derivatives, and its
  equality with the Henstock–Kurzweil integral.
- Multipliers: integration by parts against an absolutely continuous factor, functions of
  bounded variation as multipliers, and the incompleteness of the Alexiewicz norm.

The roadmap is a synthesis of several sources: Bogachev, *Measure Theory*, Vol. 1, for the
definition, the indefinite integral and the comparison with Lebesgue and McShane integration;
Dudley–Norvaiša, *Concrete Functional Calculus*, for the Saks–Henstock lemma, Hake's theorem and
the equality of the Perron and Henstock–Kurzweil integrals; Bruckner, *Differentiation of Real
Functions*, for generalized bounded variation and absolute continuity in the restricted sense;
and Thomson, *Real Functions*, for the variational theory of VBG* and ACG* functions. The layers
follow the proof-dependency order of the subject, not the chapter order of any one source.

The nearest neighbours are four. Mathlib's box integrals supply the Henstock filter of tagged
partitions, Cousin's lemma, uniqueness, linearity, the weak Saks–Henstock estimate and the
inclusion of the Lebesgue integral. Tau Ceti's oriented one-dimensional Henstock integral
supplies the interval form of that integral, restriction and subdivision, and the fundamental
theorem of calculus for continuous functions differentiable off a countable set; this roadmap is
written against it and restates none of it. The roadmap on real functions, derivatives and
variation supplies the Dini derivatives used for Perron major functions, Lusin's property (N),
and the image estimates for sets on which a function is differentiable.
[DifferentialGeometry](../DifferentialGeometry/README.md) consumes Tau Ceti's one-dimensional
fundamental theorem for boundary integrals in its planar Green theorem; nothing passes between
it and this roadmap.

[Suggested.lean](Suggested.lean) states, against the pinned Mathlib and Tau Ceti and each with
`sorry`, the headlines below that carry a Lean name, each with every conclusion this README
attaches to it, together with the definitions their statements need. It is not an exhaustive
acceptance test: the other headlines of this README are targets of the same standing, stated in
prose with their locators or proof routes.

Suggested home: `TauCeti/Analysis/BoxIntegral/` beside the existing interval files, with
Layer 3 in `TauCeti/Analysis/BoxIntegral/Descriptive/` and Layer 4 in
`TauCeti/Analysis/BoxIntegral/Perron.lean`.

## How to read the build

Layer 1 proves the Saks–Henstock lemma and the elementary theory of the indefinite integral from
Mathlib's box integrals and Tau Ceti's interval API. Layer 2 uses Layer 1, Lebesgue's
differentiation theorem for monotone functions and the Vitali covering theorem to compare the
integral with the Lebesgue integral. Layer 3 defines the restricted variation classes and uses
Layers 1–2 together with property (N) and the image estimates of the roadmap on real functions,
derivatives and variation to characterize the primitives. Layer 4 uses the Dini derivatives of
that roadmap and Cousin's lemma; its equality theorem uses Layer 1. Layer 5 uses Layers 1–3.
Each subsection has bold headlines with a Lean name, a locator with its printed page or a proof
route, and a *Needs:* line. Each layer ends with **Checks.**, *Examples* and *Dependencies*.

## Conventions

- Integrands are real functions `f : ℝ → ℝ`; the integral of `f` on `[a, b]` with value `y` is
  `HasHenstockIntervalIntegral f a b y`, and existence of a value is
  `HenstockIntervalIntegrable f a b`. These are Tau Ceti's oriented interval integral
  (`TauCeti/Analysis/BoxIntegral/Oriented/Basic.lean`): for `a < b` the Henstock box integral
  `BoxIntegral.HasIntegral` with parameters `BoxIntegral.IntegrationParams.Henstock` on the
  one-dimensional box `intervalBox a b`, the half-open box `(a, b]` of `Fin 1 → ℝ`, with the
  sign reversed for `b < a` and value `0` for `a = b`.
- A gauge is Mathlib's `(Fin 1 → ℝ) → Ioi 0`. A tagged prepartition is subordinate to it when
  each closed box lies in the closed ball about its tag of the gauge's radius
  (`BoxIntegral.TaggedPrepartition.IsSubordinate`), and Henstock when each tag lies in its closed
  box (`BoxIntegral.TaggedPrepartition.IsHenstock`). The sources use open intervals
  `(x - δ(x), x + δ(x))`; halving the gauge passes between the conventions.
- The indefinite integral is never a defined function. A statement about it carries a function
  `F` and the hypothesis `∀ x ∈ Icc a b, HasHenstockIntervalIntegral f a x (F x)`, which forces
  `F a = 0`. No junk value enters any statement.
- Quantities that can be infinite take values in `ℝ≥0∞` or `EReal`: the oscillation of a
  function on an interval is `Metric.ediam` of its image, the restricted variation
  `eVariationStarOn` is a supremum in `ℝ≥0∞`, and the upper and lower Perron integrals
  `perronUpper` and `perronLower` are an infimum and a supremum in `EReal`, equal to `⊤` and `⊥`
  when there is no major or minor function.
- Measure-theoretic statements are relative to Lebesgue measure; "measurable" means Lebesgue
  measurable (`AEMeasurable` for the restricted measure), and almost-everywhere hypotheses on an
  interval are written `∀ᵐ x, x ∈ Icc a b → …`.
- The Dini derivatives are those of the roadmap on real functions, derivatives and variation,
  §1.1: `EReal`-valued `limsup` and `liminf` of the difference quotient from the right and from
  the left. Property (N) is that roadmap's, §4.3.
- "Monotone" means nondecreasing throughout, as Mathlib's `Monotone` and `MonotoneOn`.
- The implementation namespace is TauCeti; the prototypes in `Suggested.lean` live in
  `TauCetiRoadmap.NonabsoluteIntegration`.

## Layer 1: The indefinite integral

What is already in the libraries and is not a target: Cousin's lemma
(`BoxIntegral.Box.exists_taggedPartition_isHenstock_isSubordinate_homothetic`), uniqueness
(`BoxIntegral.HasIntegral.unique`), the weak Saks–Henstock estimate
(`BoxIntegral.Integrable.dist_integralSum_sum_integral_le_of_memBaseSet`), invariance under
changes on null sets (`BoxIntegral.HasIntegral.congr_ae`), Lebesgue integrable functions are
gauge integrable with the same integral (`MeasureTheory.IntegrableOn.hasBoxIntegral`); and, in
Tau Ceti's `Oriented/Basic.lean`, `Oriented/Calculus.lean` and `FundThmCalculus.lean`, linearity,
reversal, restriction to subintervals, subdivision and gluing, agreement with the interval
integral, and the fundamental theorem for continuous functions differentiable off a countable
set (Bogachev, Theorem 5.7.7, p. 356).

### 1.1 The Saks–Henstock lemma

- **Saks–Henstock lemma** (`sum_abs_sub_le_of_hasHenstockIntervalIntegral`): if
  `F x` is the integral of `f` on `[a, x]` for every `x ∈ [a, b]`, `a < b`, then for every
  `ε > 0` there is a gauge such that every Henstock tagged prepartition subordinate to it
  satisfies `∑ |f(tⱼ) |Jⱼ| - (F(dⱼ) - F(cⱼ))| ≤ ε`, the sum over its intervals `Jⱼ = (cⱼ, dⱼ]`
  with tags `tⱼ` (Bogachev, Lemma 5.7.9, p. 357, second estimate; Dudley–Norvaiša, Lemma 2.59,
  p. 60, for the signed sum over subfamilies).

*Proof route.* Mathlib's weak estimate bounds the signed sum over any subordinate Henstock
prepartition by `ε`, with the integrals over the subboxes; Tau Ceti's subdivision identifies
these with the increments of `F`. Apply it separately to the intervals on which the term is
nonnegative and to those on which it is negative, with the gauge for `ε/2`.

*Needs:* nothing from this roadmap.

### 1.2 Continuity and differentiability of the primitive

- **Continuity** (`continuousOn_henstockPrimitive`): for `a ≤ b`, if `F x` is the integral of
  `f` on `[a, x]` for every `x ∈ [a, b]`, then `F` is continuous on `[a, b]` (Bogachev, Theorem
  5.7.10, p. 358, first assertion).
- **Points of continuity** (`hasDerivAt_henstockPrimitive_of_continuousAt`): under the same
  hypothesis, at every `x ∈ (a, b)` at which `f` is continuous, `F` has derivative `f x`.

*Proof route.* Continuity: the one-interval prepartition tagged at `c` with interval between
`c` and `x` is subordinate once `|x - c|` is small, and §1.1 bounds `|F x - F c - f(c)(x - c)|`
(Bogachev, proof of Theorem 5.7.10, p. 358). Points of continuity: if `|f - f x| < ε` near `x`,
the monotonicity of §1.3 applied to `f` and the constants `f x ± ε` on the interval between `x`
and `y` gives `|F y - F x - f(x)(y - x)| ≤ ε |y - x|`.

*Needs:* §1.1; §1.3 for the second headline.

### 1.3 Hake's theorem and monotonicity

- **Hake's theorem at the left endpoint** (`hasHenstockIntervalIntegral_iff_tendsto_left`): for
  `a < b`, if `f` has integral `G c` on `[c, b]` for every `c ∈ (a, b)`, then `f` has integral
  `y` on `[a, b]` iff `G c → y` as `c → a⁺` (Dudley–Norvaiša, Proposition 2.58, p. 59, where for
  the integrator `h(x) = x` the correction term `f(a)(x - a)` tends to `0`; Bogachev, Theorem
  5.7.8, p. 357, for the two-sided form).
- **Hake's theorem at the right endpoint** (`hasHenstockIntervalIntegral_iff_tendsto_right`):
  the same with `f` having integral `G c` on `[a, c]` and `c → b⁻` (Dudley–Norvaiša,
  Proposition 2.58, p. 59, second part).
- Target in prose: a function integrable on every `[c, d]` with `a < c < d < b` whose integrals
  have a finite limit as `c → a`, `d → b` is integrable on `[a, b]` with that limit as integral
  (Bogachev, Theorem 5.7.8, p. 357); in particular the integral contains the improper Riemann
  integral. It follows from the two headlines and subdivision.
- **Monotonicity** (`HasHenstockIntervalIntegral.le_of_ae_le`): for `a ≤ b`, if `f` and `g` have
  integrals `y` and `z` on `[a, b]` and `f ≤ g` almost everywhere on `[a, b]`, then `y ≤ z`
  (Bogachev, Proposition 5.7.6(iv), p. 356).

*Proof route.* Hake: the forward directions are continuity of the primitive (§1.2) and
subdivision; the backward directions are Dudley–Norvaiša's proof, pp. 59–61, which builds a
gauge on `(a, b]` from gauges for the integrals on `[uₙ, uₙ₋₂]`, `uₙ ↓ a`, and uses the
Saks–Henstock lemma on each piece. Monotonicity: `g - f` has integral `z - y` and is
nonnegative almost everywhere; change it on a null set to a nonnegative function, which keeps
the integral, and its Riemann sums are nonnegative.

*Needs:* Hake's theorem: §1.1 and the continuity headline of §1.2. Monotonicity: nothing from
this roadmap.

**Checks.**

- Hake for `x^{-1/2}` on `[0, 1]`, with any value at `0`: the integral on `[c, 1]` is
  `2 - 2√c` (`1.8` at `c = 10⁻²`, `1.98` at `c = 10⁻⁴`), so the integral on `[0, 1]` is `2`, the
  Lebesgue integral, as Mathlib's inclusion requires.
- Hake for `x⁻¹ sin(x⁻¹)` on `[0, 1]`: the integral on `[c, 1]` is `Si(1/c) - Si(1)`
  (`0.61614`, `0.62415`, `0.62481` at `c = 10⁻², 10⁻³, 10⁻⁴`), with limit
  `π/2 - Si(1) ≈ 0.62471`, while the integral of the modulus on `[c, 1]` grows like
  `(2/π) log(1/c)` (`3.10`, `4.56` at `c = 10⁻², 10⁻³`). The function is gauge integrable on
  `[0, 1]` and not Lebesgue integrable there.
- `hasDerivAt_henstockPrimitive_of_continuousAt` at a jump: for the indicator of `[0, ∞)` on
  `[-1, 1]` the primitive from `-1` is `max x 0`, not differentiable at `0`, where the integrand
  is not continuous; at every other point of `(-1, 1)` the integrand is continuous and the
  primitive has the predicted derivative.

### Examples

- The derivative of `x² sin(x⁻²)` (value `0` at `0`) has integral `sin 1 ≈ 0.84147` on `[0, 1]`
  by Tau Ceti's fundamental theorem (`TauCeti/Analysis/BoxIntegral/Examples/GaugeFTC.lean`),
  and the integral of its modulus on `[δ, 1]` is `3.03`, `4.57`, `5.97` at
  `δ = 10⁻¹, 3·10⁻², 10⁻²`, growing like `(2/π) log(δ⁻²)`.

### Dependencies

Mathlib's `BoxIntegral` files; Tau Ceti's `Analysis/BoxIntegral/` interval files.

## Layer 2: Measurability and the Lebesgue integral

### 2.1 The derivative of the primitive

- **Derivative almost everywhere** (`ae_hasDerivAt_henstockPrimitive`): if `F x` is the
  integral of `f` on `[a, x]` for every `x ∈ [a, b]`, then `F` has derivative `f x` at almost
  every `x ∈ (a, b)` (Bogachev, Theorem 5.7.10, p. 358).
- **Measurability** (`HenstockIntervalIntegrable.aemeasurable`): for `a ≤ b`, a function
  integrable on `[a, b]` is Lebesgue measurable on `[a, b]` (Bogachev, Theorem 5.7.10, p. 358,
  last assertion).

*Proof route.* Bogachev's proof, p. 358: the set where a Dini derivative of `F` differs from `f`
by at least `1/n` is covered in the sense of Vitali by intervals `[x, y]` on which the
increment of `F` differs from `f(x)(y - x)` by at least `(y - x)/n`; a disjoint finite subfamily
of almost full measure is a subordinate prepartition, and §1.1 bounds its total length.
Measurability: `f` agrees almost everywhere with the derivative of the continuous function `F`,
a pointwise limit of continuous difference quotients.

*Needs:* §§1.1–1.2; Mathlib's Vitali covering theorem.

### 2.2 Comparison with the Lebesgue integral

- **Lower bounds** (`HenstockIntervalIntegrable.integrableOn_of_ae_le`): for `a ≤ b`, a function
  integrable on `[a, b]` that is almost everywhere at least a Lebesgue integrable function is
  Lebesgue integrable on `[a, b]` (Bogachev, Corollary 5.7.11, p. 358, for a constant bound).
- **Absolute integrability** (`integrableOn_iff_henstockIntervalIntegrable_abs`): for `a ≤ b`,
  `f` is Lebesgue integrable on `[a, b]` iff `f` and `|f|` are gauge integrable there.
- **Measurable restrictions** (`integrableOn_iff_forall_henstockIntervalIntegrable_indicator`):
  for `a ≤ b`, `f` is Lebesgue integrable on `[a, b]` iff its restriction (indicator) to every
  measurable set is gauge integrable on `[a, b]` (Bogachev, Corollary 5.7.12, p. 359).
- **McShane and the modulus** (`integrable_mcShane_abs`): for `a < b`, if `f` is integrable on
  `intervalBox a b` for the parameters `BoxIntegral.IntegrationParams.McShane`, so is `|f|`
  (Bogachev, Lemma 5.7.13, p. 359).
- **McShane is Lebesgue** (`hasIntegral_mcShane_iff`): for `a < b`, `f` has McShane integral `y`
  on `intervalBox a b` iff `f` is Lebesgue integrable on `[a, b]` with integral `y` (Bogachev,
  Theorem 5.7.14, p. 360). The backward direction is Mathlib's
  `MeasureTheory.IntegrableOn.hasBoxIntegral`; the target is the forward direction.

*Proof route.* Lower bounds: `g` is gauge integrable (Mathlib), so `f - g` is integrable and
nonnegative almost everywhere; its primitive is monotone by §1.3, so by §2.1 and Lebesgue's
theorem its derivative `f - g` is Lebesgue integrable with integral at most the increment.
Absolute integrability: forward by Mathlib's inclusion; backward apply the lower bound to
`(f + |f|)/2 ≥ 0` and `(|f| - f)/2 ≥ 0`. Measurable restrictions: Bogachev, p. 359, applies the
lower bound to the restrictions to `{f ≥ 0}` and `{f < 0}`, measurable by §2.1. McShane: every
Henstock prepartition is a McShane prepartition, so a McShane integrable function is gauge
integrable; Bogachev's proof of Lemma 5.7.13 combines two free tagged partitions into their
common refinement to show `|f|` McShane integrable, and absolute integrability concludes.

*Needs:* §2.1; §1.3.

### 2.3 Convergence theorems

- **Monotone convergence** (`hasHenstockIntervalIntegral_of_monotone`): for `a ≤ b`, if `fₙ` has
  integral `yₙ` on `[a, b]`, the sequence `fₙ x` is monotone and tends to `g x` for almost every
  `x ∈ [a, b]`, and `yₙ → L`, then `g` has integral `L` on `[a, b]`.
- **Dominated convergence** (`hasHenstockIntervalIntegral_of_dominated`): for `a ≤ b`, if `fₙ`
  has integral `yₙ`, `g ≤ fₙ ≤ h` almost everywhere on `[a, b]` for gauge integrable `g` and `h`,
  and `fₙ → φ` almost everywhere on `[a, b]`, then `φ` has an integral `L` on `[a, b]` and
  `yₙ → L`.

*Proof route.* Monotone convergence: `fₙ - f₀` is gauge integrable and nonnegative almost
everywhere, hence Lebesgue integrable with integral `yₙ - y₀` (§2.2 and Tau Ceti's agreement
with the interval integral); Lebesgue's monotone convergence theorem gives `g - f₀` Lebesgue
integrable with integral `L - y₀`, and `g = (g - f₀) + f₀` almost everywhere. Dominated
convergence: `fₙ - g` lies between `0` and `h - g`, which is Lebesgue integrable by §2.2; apply
Lebesgue's dominated convergence theorem and add `g` back.

*Needs:* §2.2.

**Checks.**

- Negative control for the modulus in `integrableOn_iff_henstockIntervalIntegrable_abs`: the
  derivative of `x² sin(x⁻²)` is gauge integrable on `[0, 1]` (Layer 1, *Examples*) and not
  Lebesgue integrable, so by the theorem its modulus is not gauge integrable; and by
  `hasIntegral_mcShane_iff` it is not McShane integrable, so the McShane integral is strictly
  smaller than the Henstock–Kurzweil integral.
- Negative control for measurable restrictions: for the same derivative `f`, `f` is integrable
  but its restriction to the measurable set `{f > 0}` is not, since otherwise both
  restrictions would be Lebesgue integrable by the lower-bound theorem and `f` with them.
- Negative control for the bounds in `hasHenstockIntervalIntegral_of_dominated`: `fₙ = n` on
  `(0, 1/n]` and `0` elsewhere tends to `0` everywhere while every integral on `[0, 1]` is `1`.
  The smallest upper bound `sup fₙ = ⌊1/x⌋` has integral `4.19`, `6.49`, `8.79` on
  `[10⁻ᵏ, 1]` for `k = 2, 3, 4`, so it is not gauge integrable (a nonnegative gauge integrable
  function is Lebesgue integrable).
- `HenstockIntervalIntegrable.aemeasurable` as a negative control: the indicator of a
  non-measurable subset of `[0, 1]` is bounded and nonnegative, and is not gauge integrable.

### Examples

- The indicator of the rationals has integral `0` on `[0, 1]` (Bogachev, Example 5.7.5,
  p. 355), by invariance under null modifications; its primitive is `0`, whose derivative differs
  from the integrand on the null set `ℚ`, as `ae_hasDerivAt_henstockPrimitive` allows.

### Dependencies

Layer 1; Mathlib's `Monotone.ae_hasDerivAt`, its integrability of the derivative of a monotone
function, Vitali covering families, and the monotone and dominated convergence theorems.

## Layer 3: Generalized absolute continuity and the descriptive characterization

### 3.1 The restricted variation classes

All four classes concern a function `F : ℝ → ℝ` and an arbitrary set `E`. A family of intervals
with endpoints in `E` is a finite family of nonoverlapping closed intervals `[cᵢ, dᵢ]` with
`cᵢ, dᵢ ∈ E` (`IsIntervalFamilyIn`). The oscillation of `F` on `[c, d]` is
`Metric.ediam (F '' Icc c d)`: it depends on `F` on all of `[c, d]`, not only on `E`, which is
what "restricted" means.

- **Restricted variation** (`eVariationStarOn`): the supremum over families with endpoints in
  `E` of the sum of the oscillations of `F` on their intervals, in `ℝ≥0∞`; `F` is VB* on `E`
  when it is finite (Bruckner, Chapter V, Definition 4.4, p. 82).
- **VBG*** (`IsVBGStarOn`): `E` is a countable union of sets on each of which `F` is VB*
  (Bruckner, Chapter V, Definition 4.2, p. 82, and p. 83; Thomson, §40, p. 93).
- **AC*** (`AbsContStarOn`): for every `ε > 0` there is `δ > 0` such that every family with
  endpoints in `E` of total length `< δ` has sum of oscillations `< ε` (Bruckner, Chapter V,
  p. 83, "in the obvious manner").
- **ACG*** (`IsACGStarOn`): `F` is continuous on `E` and `E` is a countable union of sets on each
  of which `F` is AC* (Bruckner, Chapter V, p. 83).
- **On intervals** (`absContStarOn_Icc_iff`): for `a ≤ b`, `F` is AC* on `[a, b]` iff it is
  absolutely continuous there in Mathlib's sense `AbsolutelyContinuousOnInterval` (Bruckner,
  Chapter V, p. 83: on intervals AC and AC* coincide).
- **AC* gives VB*** (`AbsContStarOn.eVariationStarOn_ne_top`): if `F` is continuous on `[a, b]`
  and AC* on `E ⊆ [a, b]`, its restricted variation on `E` is finite.
- Target in prose: the restricted variation is nondecreasing in `E`, and each of the four classes
  passes from `E` to its subsets; VBG* and ACG* are closed under sums; and for `F` continuous on
  `[a, b]`, AC* and VB* on `E ⊆ [a, b]` pass to the closure of `E`.

*Proof route.* On intervals: an oscillation of a continuous function on `[c, d]` is attained at
two points of `[c, d]`, which span a subinterval, so a family's oscillation sum is a sum of
increments over a family of no greater total length; conversely an increment is at most an
oscillation. AC* gives VB*: with `δ` for `ε = 1`, a family splits into at most
`(b - a)/δ` intervals of length `≥ δ`, each of oscillation at most that of `F` on `[a, b]`
(finite by continuity), and the intervals of length `< δ`, taken from left to right and grouped
greedily so that each group has total length `< δ` and any two consecutive groups total `≥ δ`,
form at most `2(b - a)/δ + 1` groups, each of oscillation sum `< 1`. Passage to subsets is
immediate, since a subset of `E` admits fewer families; sums use the pieces `Sₙ ∩ S'ₘ` and the
bound of the oscillation of a sum by the sum of the oscillations, and the closure follows by
moving the endpoints of a family into `E` with continuity of `F`.

*Needs:* nothing from this roadmap.

### 3.2 Differentiability and property (N)

- **Denjoy–Lusin theorem** (`IsVBGStarOn.ae_differentiableAt`): a function VBG* on a set `E` is
  differentiable at almost every point of `E` (Thomson, Theorem (44.1), p. 103).
- **ACG* is VBG* with property (N)** (`isACGStarOn_iff_isVBGStarOn_and_hasLusinN`): if `F` is
  continuous on `[a, b]` and `E ⊆ [a, b]` is closed, then `F` is ACG* on `E` iff it is VBG* on
  `E` and has property (N) on `E` (Thomson, Theorem (45.3), p. 106, characterization (ii), which
  Thomson attributes to Saks, Chapter VII).
- **Uniqueness** (`IsACGStarOn.eq_of_ae_hasDerivAt_zero`): an ACG* function on `[a, b]` with
  derivative `0` at almost every point of `[a, b]` is constant on `[a, b]`.

*Proof route.* Denjoy–Lusin: Thomson's proof, p. 103: the sets where two Dini derivatives are
separated by rationals `p > q > r` carry the variational measure of `F` and of `F - px`, and
VBG* forces them to be null. ACG* and VBG* with (N): Thomson's proof, p. 106, through the
variational measure of §§37–43 of Thomson; AC* on a piece gives VB* there by §3.1, and property
(N) on a piece follows from AC* by covering a null subset with an open set of small measure.
Uniqueness: let `A` be the set of points of `[a, b]` at which `F` has derivative `0` and `Z` the
null rest. By the image estimate of the roadmap on real functions, derivatives and variation
(§3.1 there, with bound `0`) `F(A)` is null; by the previous headline with `E = [a, b]`,
`F(Z)` is null. So `F([a, b])`, an interval by continuity, is null, hence a point.

*Needs:* §3.1; property (N) and the image estimate of the roadmap on real functions,
derivatives and variation (§§3.1, 4.3 there).

### 3.3 The descriptive characterization

- **Primitives are ACG*** (`isACGStarOn_henstockPrimitive`): for `a ≤ b`, if `F x` is the
  integral of `f` on `[a, x]` for every `x ∈ [a, b]`, then `F` is ACG* on `[a, b]`.
- **Descriptive characterization** (`hasHenstockIntervalIntegral_iff_isACGStarOn`): for
  `a ≤ b`, `F x - F a` is the integral of `f` on `[a, x]` for every `x ∈ [a, b]` iff `F` is ACG*
  on `[a, b]` and has derivative `f x` at almost every `x ∈ [a, b]`. The function `F` determines
  `f` up to a null set, and `f` determines `F` up to a constant by uniqueness (§3.2). This
  identifies the Henstock–Kurzweil integral with the restricted Denjoy integral.
- **Monotonicity** (`IsACGStarOn.monotoneOn_of_ae_deriv_nonneg`): an ACG* function on `[a, b]`
  whose derivative (Mathlib's `deriv`, `0` where it does not exist) is nonnegative almost
  everywhere on `[a, b]` is monotone on `[a, b]`.
- **Differentiable functions** (`isACGStarOn_of_differentiableAt_off_countable`): a function
  continuous on `[a, b]` and differentiable at every point of `(a, b)` outside a countable set
  is ACG* on `[a, b]` (Bruckner, Chapter V, p. 83, for differentiable functions).

*Proof route.* Primitives: continuity is §1.2. Fix a gauge `δ` for `ε = 1` from §1.1 and let
`Eₙ,ₖ` be the points `x` of the `k`-th subinterval of length `1/n` of `[a, b]` with `|f(x)| ≤ n`
and `δ(x) ≥ 1/n`. For a family with endpoints in `Eₙ,ₖ`, every subinterval `[cᵢ, u]` tagged at
`cᵢ` is subordinate, so §1.1 bounds the oscillation sum by `2 + 2n` times the total length:
`F` is VB* on each `Eₙ,ₖ`, hence VBG* on `[a, b]`. Property (N) on `[a, b]`: for a null `Z` on
which `|f| ≤ n`, take an open set of measure `< ε/n` around `Z` and shrink the gauge on `Z` into
it; a Vitali cover of `Z` by intervals tagged in `Z` and §1.1 bound the outer measure of `F(Z)`
by `ε` plus `ε`. Then §3.2. Descriptive characterization: forward from the previous headline and
§2.1. Backward, after changing `f` to `0` on the null set where `F` fails to have derivative `f`
(which changes no integral): at tags off that set use the derivative to bound the term by `ε`
times the length; at tags in it, lying in a closed AC* piece `Eₙ` (closed by §3.1), use AC* on
`Eₙ` for intervals with endpoints in `Eₙ`, continuity of `F` on the intervals contiguous to `Eₙ`
for the countably many tags that are their endpoints, and open sets of small measure around the
null set; this is Saks's argument for the restricted Denjoy integral, to which Bruckner,
Chapter V, p. 83, points (Saks, Chapter VIII). Then uniqueness (§3.2) identifies the primitive.
Monotonicity: by the descriptive characterization with `f = deriv F` (which is the derivative
almost everywhere by §3.2), `F y - F x` is the integral of `deriv F` on `[x, y]`, nonnegative by
§1.3. Differentiable functions: Tau Ceti's fundamental theorem makes `F - F a` the primitive of
`deriv F`; apply the first headline.

*Needs:* §§1.1–1.3, 2.1, 3.1–3.2.

**Checks.**

- Negative control for oscillations in AC*, `not_absContStarOn_spikes`: the spikes
  `|sin(π/x)|` vanish at `0` and at every `1/(n + 1)`, so they are absolutely continuous on
  `E = {0} ∪ {1/(n + 1)}` in the wide sense, where only the values on `E` count; but on each
  `[1/(n + 2), 1/(n + 1)]`, with endpoints in `E`, the oscillation is `1`, and these intervals
  for `n ≥ N` have total length `1/(N + 1)`. So they are not AC* (not even VB*) on `E`, as
  Bruckner's Example 4.5, p. 83, illustrates on the Cantor set.
- The continuity hypothesis in `AbsContStarOn.eVariationStarOn_ne_top` cannot be dropped: on
  `E = {0, 1}` every function is AC* (for `δ < 1` only degenerate intervals qualify), while the
  restricted variation is the oscillation on `[0, 1]`, infinite for `1/x` on `(0, 1]`.
- Negative control for ACG* in `IsACGStarOn.eq_of_ae_hasDerivAt_zero`: Tau Ceti's Cantor function
  is continuous, has derivative `0` almost everywhere and is not constant. It is VB* on `[0, 1]`
  (variation `1`) but maps the null Cantor set onto `[0, 1]`, so it fails property (N), and by
  `isACGStarOn_iff_isVBGStarOn_and_hasLusinN` it is not ACG*.
- `x² sin(x⁻²)` (value `0` at `0`) is ACG* on `[0, 1]` and not absolutely continuous there
  (Bruckner, Example 4.6, p. 83); `isACGStarOn_of_differentiableAt_off_countable` gives the first
  property and Tau Ceti's infinite-variation theorem for it the second.

### Examples

- On an interval, ACG* with a single piece is absolute continuity (`absContStarOn_Icc_iff`), and
  the descriptive characterization reduces to Mathlib's fundamental theorem for absolutely
  continuous functions.

### Dependencies

Layers 1–2; Mathlib's `AbsolutelyContinuousOnInterval` and `Metric.ediam`; property (N) and
the image estimate of the roadmap on real functions, derivatives and variation; Tau Ceti's
fundamental theorem and Cantor function.

## Layer 4: The Perron integral

### 4.1 Major and minor functions

- **Major functions** (`IsPerronMajor`): `M` is a major function of `f` on `[a, b]` if its lower
  right Dini derivative is at least `f x` at every `x ∈ [a, b)` and its lower left Dini
  derivative is at least `f x` at every `x ∈ (a, b]`. Since `f x` is real, both lower
  derivatives are `> -∞`. No continuity is required.
- **Minor functions** (`IsPerronMinor`): `m` is a minor function if its upper right Dini
  derivative is at most `f x` on `[a, b)` and its upper left one is at most `f x` on `(a, b]`.
- **Upper and lower integrals** (`perronUpper`, `perronLower`): the infimum of `M b - M a` over
  major functions and the supremum of `m b - m a` over minor functions, in `EReal`.
- **Perron integral** (`HasPerronIntegral`): both equal the real number `y`.
- **Monotonicity without continuity** (`monotoneOn_of_lowerDini_nonneg`): a function whose lower
  right Dini derivative is `≥ 0` on `[a, b)` and whose lower left Dini derivative is `≥ 0` on
  `(a, b]` is monotone on `[a, b]`.
- **Majors dominate minors** (`IsPerronMajor.monotoneOn_sub`): for a major function `M` and a
  minor function `m` of `f` on `[a, b]`, `M - m` is monotone on `[a, b]`; hence
  (`perronLower_le_perronUpper`) for `a ≤ b` the lower Perron integral is at most the upper one
  (Dudley–Norvaiša, Lemma 2.62, p. 62, for the major and minor functions of Ward's form).

*Proof route.* Monotonicity: for `ε > 0`, `w + εx` has lower Dini derivatives `≥ ε > 0`, so each
point has a neighbourhood in which `w + εx` is strictly larger to the right and strictly smaller
to the left; a subordinate tagged partition of `[x, y]` from Cousin's lemma chains these
inequalities to `w x + εx ≤ w y + εy`; let `ε → 0`. Majors dominate minors: the lower Dini
derivative of `M - m` on each side is at least that of `M` minus the upper one of `m`, which is
`≥ f x - f x = 0`; the `EReal` sum has no `⊤ + ⊥` term since both summands are bounded on the
correct side by the real `f x`. Then `M b - M a ≥ m b - m a`.

*Needs:* the Dini derivatives of the roadmap on real functions, derivatives and variation
(§1.1 there); Mathlib's Cousin lemma.

### 4.2 Perron equals Henstock–Kurzweil

- **Equality of the integrals** (`hasPerronIntegral_iff`): for `a ≤ b`, `f` has Perron integral
  `y` on `[a, b]` iff it has Henstock–Kurzweil integral `y` there (Dudley–Norvaiša, Theorem 2.65,
  p. 64, for Ward's major and minor functions with integrator `h(x) = x`).

*Proof route.* Dudley–Norvaiša define, in (2.57), p. 62, a Ward major function by local
inequalities: `M z ≥ M x + f(x)(z - x)` for `z ∈ [x, x + δ(x)] ∩ [a, b]` and
`M z ≤ M x + f(x)(z - x)` for `z ∈ [x - δ(x), x] ∩ [a, b]`. A Ward major function is a major
function in the sense of §4.1, and a major function in that sense plus `ε(x - a)` is a Ward major
function, since its lower Dini derivatives exceed `f x` strictly; the same holds for minor
functions. So the upper and lower integrals of §4.1 are Dudley–Norvaiša's, and their Theorem
2.65, p. 64, applies: a major `M` and minor `m` bound every Riemann sum of a partition
subordinate to `min δ_M δ_m`, and conversely, from a gauge for `ε`, the supremum and infimum of
the Riemann sums over subordinate partitions of `[a, x]` are a major and a minor function within
`ε` of the integral.

*Needs:* §4.1; Layer 1.

**Checks.**

- Negative control for the endpoint condition, `not_isPerronMajor_endpoint_jump`: the function
  equal to `-1` at `1` and `0` elsewhere has every Dini derivative `0` on `[0, 1)`, but its left
  difference quotients at `1` are `-1/h` (`-10`, `-10³`, `-10⁶` at `h = 10⁻¹, 10⁻³, 10⁻⁶`), so it
  is not a major function of `0` on `[0, 1]`. Imposing the left condition only on `(a, b)` would
  admit it and make the upper Perron integral of `0` at most `-1`.
- `hasPerronIntegral_of_hasDerivWithinAt`: a function with a derivative relative to `[a, b]` at
  every point of `[a, b]` is a major and a minor function of its derivative, which therefore has
  Perron integral `F b - F a`. For `x² sin(x⁻²)` on `[0, 1]` the value is `sin 1`, matching the
  Henstock–Kurzweil value of Layer 1 as `hasPerronIntegral_iff` requires.
- Two-sided lower conditions are needed in `monotoneOn_of_lowerDini_nonneg`: `-1` on `(0, 1]` and
  `0` on `[-1, 0]` has left Dini derivatives `0` everywhere but right quotients `-1/h` at `0`, and
  it is not nondecreasing.

### Examples

- A constant `c` has the major and minor function `cx`, so its Perron integral on `[a, b]` is
  `c(b - a)`.

### Dependencies

Layer 1 for the equality theorem; the Dini derivatives of the roadmap on real functions,
derivatives and variation.

## Layer 5: Multipliers and the Alexiewicz norm

- **Integration by parts** (`hasHenstockIntervalIntegral_mul_of_absolutelyContinuousOnInterval`):
  for `a ≤ b`, if `F x` is the integral of `f` on `[a, x]` for every `x ∈ [a, b]` and `g` is
  absolutely continuous on `[a, b]`, then `f g` is integrable on `[a, b]` with integral
  `F(b) g(b) - ∫ₐᵇ F g'`, the last a Lebesgue integral.
- **Bounded variation multipliers** (`HenstockIntervalIntegrable.mul_of_boundedVariationOn`): if
  `f` is integrable on `[a, b]` and `g` is of bounded variation on the closed interval with
  endpoints `a` and `b` (`uIcc a b`, since the integral is oriented), then `f g` is integrable on
  `[a, b]`.
- **Incompleteness of the Alexiewicz norm** (`exists_tendstoUniformlyOn_not_henstockPrimitive`):
  there are integrable `fₙ` on `[0, 1]` whose primitives converge uniformly on `[0, 1]` to a
  function that is the primitive of no integrable function. Equivalently the Alexiewicz norm
  `‖f‖ = sup_{x ∈ [0, 1]} |∫₀ˣ f|` makes the integrable functions modulo null functions a
  normed space that is not complete.
- Target in prose: the uniform closure of the primitives on `[a, b]` is the space of continuous
  functions vanishing at `a`; it is the completion of the Alexiewicz norm.

*Proof route.* Integration by parts: `g` is AC* on every subset of `[a, b]` (§3.1), and the
oscillation of `F g` on an interval is at most `sup |F|` times that of `g` plus `sup |g|` times
that of `F`, so `F g` is ACG* on `[a, b]` with derivative `f g + F g'` almost everywhere (§§2.1,
3.2). `F g'` is Lebesgue integrable, as `F` is bounded and `g' ∈ L¹`, hence gauge integrable; by
§3.3 `(F g)'` has integral `F(b) g(b)`, and `f g = (F g)' - F g'` almost everywhere. Multipliers:
Mathlib's `LocallyBoundedVariationOn.exists_monotoneOn_sub_monotoneOn` reduces to monotone `g`.
For a subordinate partition, `∑ f(tⱼ) g(tⱼ) |Jⱼ|` differs from `∑ g(tⱼ) (F(dⱼ) - F(cⱼ))` by at most
`sup |g|` times the Saks–Henstock sum of §1.1, and Abel summation writes the latter as
`F(b) g(b)` minus a Riemann–Stieltjes sum of the continuous `F` against the monotone `g`, which
is Cauchy as the mesh shrinks. Alexiewicz: the Cantor function of Tau Ceti is continuous with
value `0` at `0`; by `exists_polynomial_near_of_continuousOn` it is a uniform limit of
polynomials `pₙ - pₙ(0)`, the primitives of `pₙ'`. If it were a primitive it would be ACG*
(§3.3) and have property (N) (§3.2), but it maps the null Cantor set onto `[0, 1]`.

*Needs:* Layers 1–3.

**Checks.**

- Integration by parts with `f = 1`, `g(x) = x`: `F(x) = x - a` and
  `(b - a) b - ∫ₐᵇ (x - a) dx = (b² - a²)/2`; with `f = cos`, `g(x) = x²` on `[0, 1]`:
  `sin 1 - ∫₀¹ 2x sin x dx = ∫₀¹ x² cos x dx ≈ 0.23913`.
- The derivative `f` of `x² sin(x⁻²)` times the indicator of `{f > 0}` is not integrable (Layer
  2, *Checks*), and that indicator is not of bounded variation on `[0, 1]`: the bounded variation
  hypothesis of the multiplier theorem cannot be weakened to boundedness and measurability.

### Dependencies

Layers 1–3; Mathlib's Jordan decomposition and Weierstrass approximation theorem; Tau Ceti's
Cantor function.

## Downstream consumers

- No roadmap on main consumes this one. [DifferentialGeometry](../DifferentialGeometry/README.md),
  §5.6.2, consumes Tau Ceti's one-dimensional fundamental theorem directly; Hake's theorem and the
  convergence theorems of this roadmap are available to its boundary integrals but are not
  required there.

## Scope and ownership

Completion means:

1. The strong Saks–Henstock lemma, continuity and differentiability of the primitive, Hake's
   theorem at both endpoints and monotonicity (Layer 1).
2. The derivative of the primitive almost everywhere, measurability, the comparison theorems
   with the Lebesgue and McShane integrals, and the monotone and dominated convergence theorems
   (Layer 2).
3. The restricted variation classes VB*, VBG*, AC* and ACG* with their basic theory, the
   Denjoy–Lusin theorem, the characterization of ACG* by VBG* and property (N), uniqueness,
   and the descriptive characterization of the integral with its corollaries (Layer 3).
4. The Perron integral by Dini major and minor functions, monotonicity without continuity, and
   its equality with the Henstock–Kurzweil integral (Layer 4).
5. Integration by parts against absolutely continuous functions, bounded variation multipliers,
   and the incompleteness of the Alexiewicz norm with the identification of its completion
   (Layer 5).

**Not owned here.**

- The definition, Cousin's lemma, uniqueness, linearity, the weak Saks–Henstock estimate and
  the inclusion of the Lebesgue integral are Mathlib's. The oriented interval integral,
  restriction, subdivision, gluing, agreement with the interval integral, the fundamental
  theorem for continuous functions differentiable off a countable set, substitution and the
  example `x² sin(x⁻²)` are in Tau Ceti at the pin (`TauCeti/Analysis/BoxIntegral/`). They are
  consumed and not restated.
- The Dini derivatives, the monotonicity criteria for continuous functions, property (N), the
  Banach–Zarecki theorem and the image estimates are owned by the roadmap on real functions,
  derivatives and variation, §§1–4 there; this roadmap consumes them.
  The monotonicity lemma of §4.1, for two-sided lower Dini derivatives without continuity, is
  owned here; that roadmap's §2.2 assumes continuity and bounds the upper right derivative.
- The planar Green theorem with Henstock–Kurzweil boundary integrals is owned by
  [DifferentialGeometry](../DifferentialGeometry/README.md), §5.6.
- Approximate derivatives, the wide Denjoy integral and the Khintchine integral are listed under
  *Beyond this roadmap*; they need the approximate continuity of the roadmap on real functions,
  derivatives and variation, §7.

## Exact supplier contracts

### From Mathlib

- `BoxIntegral.HasIntegral`, `BoxIntegral.IntegrationParams.Henstock`,
  `BoxIntegral.IntegrationParams.McShane`, `BoxIntegral.TaggedPrepartition.IsHenstock` and
  `BoxIntegral.TaggedPrepartition.IsSubordinate` (`Mathlib/Analysis/BoxIntegral/Basic.lean`,
  `Mathlib/Analysis/BoxIntegral/Partition/Filter.lean`): the integral and its partitions.
- `BoxIntegral.Box.exists_taggedPartition_isHenstock_isSubordinate_homothetic`
  (`Mathlib/Analysis/BoxIntegral/Partition/SubboxInduction.lean`): Cousin's lemma, used in §4.1.
- `BoxIntegral.Integrable.dist_integralSum_sum_integral_le_of_memBaseSet` and
  `BoxIntegral.HasIntegral.unique` (`Mathlib/Analysis/BoxIntegral/Basic.lean`): the weak
  Saks–Henstock estimate, used in §1.1.
- `BoxIntegral.HasIntegral.congr_ae` and `MeasureTheory.IntegrableOn.hasBoxIntegral`
  (`Mathlib/Analysis/BoxIntegral/Integrability.lean`): null modifications and the inclusion of
  the Lebesgue integral, used in Layers 1–2.
- `AbsolutelyContinuousOnInterval` (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean`),
  `BoundedVariationOn`, `LocallyBoundedVariationOn.exists_monotoneOn_sub_monotoneOn` and
  `LocallyBoundedVariationOn.ae_differentiableAt`; `Metric.ediam`
  (`Mathlib/Topology/EMetricSpace/Diam.lean`); `exists_polynomial_near_of_continuousOn`
  (`Mathlib/Topology/ContinuousMap/Weierstrass.lean`).

### From Tau Ceti

- `TauCeti/Analysis/BoxIntegral/IntervalIntegral.lean` and
  `TauCeti/Analysis/BoxIntegral/Oriented/Basic.lean`: `intervalBox`,
  `HasHenstockIntervalIntegral` and `HenstockIntervalIntegrable` with restriction, subdivision,
  gluing, reversal, linearity, uniqueness, null modifications and agreement with the interval
  integral.
- `TauCeti/Analysis/BoxIntegral/FundThmCalculus.lean` and
  `TauCeti/Analysis/BoxIntegral/Oriented/Calculus.lean`: the agreement of the `GP` and Henstock
  integrals in dimension one and the fundamental theorem for continuous functions differentiable
  off a countable set, on the box and in oriented form.
- `TauCeti/Analysis/BoxIntegral/Examples/GaugeFTC.lean`: `x² sin(x⁻²)`, its derivative with
  integral `sin 1`, infinite variation, and the failure of Bochner integrability.
- `TauCeti/Analysis/SpecialFunctions/CantorFunction.lean`: the Cantor function, its continuity,
  its almost everywhere vanishing derivative and its image of the Cantor set.
- `Suggested.lean` imports `TauCeti/Analysis/BoxIntegral/Oriented/Basic.lean`, which imports
  `TauCeti/Analysis/BoxIntegral/IntervalIntegral.lean`, so its statements are about these
  definitions.

### From other roadmaps

- The roadmap on real functions, derivatives and variation: the four Dini derivatives of §1.1
  there, with values in `EReal`, for the major and minor functions of Layer 4; property (N) of
  §4.3 there for §3.2; and the image estimate of §3.1 there (if `F` has a derivative bounded by
  `K` at every point of a set `A`, then the outer measure of `F(A)` is at most `K` times that of
  `A`) for uniqueness in §3.2. `Suggested.lean` carries verbatim local copies of the five
  definitions, each with a docstring naming that roadmap and section.

## Beyond this roadmap

- **Approximate derivatives and the wide Denjoy integral**: the classes VBG and ACG in the wide
  sense, the approximate derivative, and the wide Denjoy and Khintchine integrals, which
  integrate approximate derivatives and are strictly larger than the integral of this roadmap
  (Bruckner, Chapter V, p. 83, points to Saks, Chapter VIII). They need Layer 3 and the
  approximate continuity of the roadmap on real functions, derivatives and variation, §7.
- **Denjoy's constructive integral**: the transfinite totalization that reconstructs the
  primitive of an arbitrary finite derivative (Bruckner, Chapter V, Theorem 2.6, p. 78). A
  roadmap of its own; it consumes Layer 3 for the comparison.
- **Multipliers are exactly bounded variation**: a function `g` with `f g` integrable for every
  integrable `f` agrees almost everywhere with a function of bounded variation; and the duality
  of the Alexiewicz space with bounded variation. Needs Layer 5 and a uniform boundedness
  argument adapted to the incomplete space.
- **Henstock–Stieltjes integrals and integration by parts against bounded variation**:
  `∫ f dh` for gauges and an integrator `h`, the Ward–Perron–Stieltjes integral, and the formula
  `∫ f g = F(b) g(b) - ∫ F dg` with a Riemann–Stieltjes integral (Dudley–Norvaiša, §§2.6–2.7,
  pp. 56–71). Needs a Riemann–Stieltjes integral, which no roadmap owns.
- **The Lebesgue–Dini problem**: if `f` is continuous on `[c, d]` with finite upper right Dini
  derivative everywhere and that derivative is integrable in the sense of this roadmap, then it
  reconstructs `f` (Benedetto–Czaja, §4.7, item 4, p. 203). Needs Layer 4 together with a
  monotonicity criterion for Perron major functions that are not continuous.
- **Gauge integrals in several variables**: the Henstock–Kurzweil integral on boxes of `ℝⁿ`, the
  gauge divergence theorem and Pfeffer's integrals (Pfeffer, *Derivation and Integration*).
  Mathlib's `GP` divergence theorem is the starting point.

## Prior formalization

- Isabelle/HOL's analysis library (theory `Henstock_Kurzweil_Integration`) and HOL Light's
  multivariate analysis library define the gauge integral on boxes of `ℝⁿ` and prove the
  fundamental theorem, the comparison with the Lebesgue integral for absolutely integrable
  functions, and monotone and dominated convergence. They are prior art for Layers 1–2; neither
  treats ACG* functions or the Perron integral.

## References

- V. I. Bogachev, *Measure Theory*, Vol. 1, Springer, 2007. §5.7, pp. 353–361.
- R. M. Dudley and R. Norvaiša, *Concrete Functional Calculus*, Springer Monographs in
  Mathematics, Springer, 2011. §§2.6–2.7, pp. 56–71.
- A. M. Bruckner, *Differentiation of Real Functions*, Lecture Notes in Mathematics 659,
  Springer, 1978. Chapter V, pp. 71–84.
- B. S. Thomson, *Real Functions*, Lecture Notes in Mathematics 1170, Springer, 1985. §§40–45,
  pp. 93–106.
- J. J. Benedetto and W. Czaja, *Integration and Modern Analysis*, Birkhäuser, 2009. §4.7.
- W. F. Pfeffer, *Derivation and Integration*, Cambridge Tracts in Mathematics 140, Cambridge
  University Press, 2001.
- S. Saks, *Theory of the Integral*, 2nd ed., Monografie Matematyczne 7, Warsaw, 1937.
  Chapters VI–VIII.

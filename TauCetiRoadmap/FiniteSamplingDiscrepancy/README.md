# Roadmap: sampling with and without replacement, exact discrepancy for finite populations

**Summary.** Draw `m` values from a finite population of size `n`, once without replacement and
once with replacement. This roadmap computes how far apart the two laws are. The difference on
every event is at most the collision probability `1 - (n)_m / n^m`, and populations of distinct
values attain it; Layer 1 proves both, for deterministic and random populations and for the
prefix laws of finitely exchangeable processes. For `2 ≤ m ≤ n`, distinct values are the only
populations that attain it (Layer 3). A population identifying
one pair of indices has an exact discrepancy `1 - p - t * min p (1 - p)` (Layer 2), every
population with a repeated value satisfies that smaller sharp bound (Layer 3), and integrating it
gives a finite de Finetti bound that improves with the probability of ties (Layer 4). The roadmap
is this README; `Suggested.lean` states the headline theorems against the pinned APIs.

## Scope and ownership

This roadmap owns the exact collision masses of uniform index maps, the exact-collision
eventwise bounds between the pinned sampling laws (Section 1.2) and between a finitely
exchangeable prefix law and the with-replacement sample of a longer prefix (Section 1.3), their
attainment, the exact one-pair formula and the repeated-value bound with its characterization,
and the tie-weighted mixture and finite de Finetti bounds. It also owns the three excess tools of
Sections 0.3 to 0.5, stated for finite measures in this roadmap's carriers.

- **Exchangeability (completed), Layer 8**, owns the sampling constructions `samplePopulation`,
  `sampleWithoutReplacement`, `sampleWithReplacement`, their probability instances, the
  representation of an exchangeable prefix law by sampling without replacement, and the
  finite de Finetti bound with error `choose m 2 / n`. This roadmap consumes all of them and
  sharpens the error to `1 - (n)_m / n^m`.
- **MarkovChainsAndRenewal, Layer 3**, owns total variation of measures on countable spaces in
  its own carrier. Section 0.4 is the finite-type excess identity in this roadmap's carriers,
  which Layer 2 uses.
- **StandardDistributions §9.3** owns the multivariate hypergeometric and multinomial count
  laws. The laws here are laws of sampled words, not of counts.
- Approximation of a sampling law by an arbitrary i.i.d. mixture, and optimality among such
  mixtures, are outside this roadmap.

## Conventions

- `ι`, `κ` are finite types, `m = Fintype.card ι`, `n = Fintype.card κ`, and `κ` carries a
  measurable space with `[MeasurableSingletonClass κ]`. The value space `α` is an arbitrary
  measurable space unless a section says otherwise.
- For a population `x : κ → α`, `P x = sampleWithoutReplacement (ι := ι) (Measure.dirac x)` and
  `Q x = sampleWithReplacement (ι := ι) (Measure.dirac x)`.
- `p = n.descFactorial m / n ^ m` and `t = m.descFactorial 2 / n.descFactorial 2`, as real
  numbers in the formulas of Layers 2 to 4 and as elements of `ℝ≥0∞` in Layer 1. Division by zero
  is Mathlib's: `x / 0 = 0` in `ℝ`; in `ℝ≥0∞`, `0 / 0 = 0` and `x / 0 = ⊤` for `x ≠ 0`. The second
  case never arises in `p`, since `n ^ m = 0` forces `n.descFactorial m = 0`.
- The **excess** of `μ` over `ν` is `⨆ (A) (_ : MeasurableSet A), μ A - ν A` in `ℝ≥0∞`.
- The **norm** of `μ - ν`, for finite measures, is
  `(μ.toSignedMeasure - ν.toSignedMeasure).totalVariation Set.univ`, Mathlib's total variation
  of the signed measure. For measures of equal total mass it is twice the excess (Section 0.5),
  so its values lie in `[0, 2]` for probability measures. The eventwise and excess forms are the
  owned statements; each norm form is a corollary through Section 0.5.
- The one-pair population for distinct `a b : κ` is `Function.update id b a : κ → κ`, which sends
  `b` to `a` and fixes every other index. It is not a new definition.
- "`m ≤ n`" is written as an embedding `e : ι ↪ κ` where a probability law is needed, and as
  `Fintype.card ι ≤ Fintype.card κ` where only a count is.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.uniformOn` in `Mathlib/Probability/UniformOn.lean`: the uniform law on a
  finite set; on an empty set it is the zero measure.
- `MeasureTheory.Measure.toSignedMeasure` in `Mathlib/MeasureTheory/VectorMeasure/Operations.lean`
  and `MeasureTheory.SignedMeasure.totalVariation` in
  `Mathlib/MeasureTheory/VectorMeasure/Decomposition/Jordan.lean`: the norm carrier.
- `Nat.descFactorial` and `Nat.descFactorial_eq_zero_iff_lt` in
  `Mathlib/Data/Nat/Factorial/Basic.lean`, and `Fintype.card_embedding_eq` in
  `Mathlib/Data/Fintype/CardEmbedding.lean`: the injective index maps `ι → κ` number
  `n.descFactorial m`, which is `0` exactly when `n < m`.
- `MeasureTheory.Measure.map_apply`, `MeasureTheory.Measure.dirac`, `MeasureTheory.Measure.pi`,
  `Function.update`.

### From Tau Ceti

- `TauCeti.Probability.samplePopulation`, `samplePopulation_def`, `samplePopulation_apply`,
  `samplePopulation_apply_population` and `samplePopulation_eq_bind_population` in
  `TauCeti/Probability/PopulationSampling.lean`: sampling a random population `ρ` along an
  independent selection law `σ`, for countable `κ` with measurable singletons.
  `samplePopulation_apply` evaluates a measurable event as an integral over `σ` and needs
  `[SFinite ρ]`; `samplePopulation_apply_population` (a measurable event, as an integral over
  `ρ`) and `samplePopulation_eq_bind_population` need `[SFinite σ]` and `[SFinite ρ]`. The
  instance `isFiniteMeasure_samplePopulation` needs both measures finite.
- `TauCeti.Probability.sampleWithoutReplacement` and
  `isProbabilityMeasure_sampleWithoutReplacement` in
  `TauCeti/Probability/Exchangeability/SamplingWithoutReplacement.lean`: sampling along
  `uniformOn {k : ι → κ | Function.Injective k}`, a probability measure for
  `[IsProbabilityMeasure ρ]` and `e : ι ↪ κ`, and the zero measure when no injection exists. `IsFiniteMeasure (sampleWithoutReplacement ρ)` for
  finite `ρ` follows from `isFiniteMeasure_samplePopulation`.
- `TauCeti.Probability.sampleWithReplacement`, `sampleWithReplacement_eq_samplePopulation_uniformOn`
  and `isProbabilityMeasure_sampleWithReplacement` (for `[IsProbabilityMeasure ρ]` and
  `[Nonempty κ]`) in
  `TauCeti/Probability/Exchangeability/FiniteDeFinetti.lean`: sampling along
  `uniformOn (Set.univ : Set (ι → κ))`.
- `TauCeti.Probability.uniformOn_injective_le_add` and `uniformOn_univ_le_injective_add` in
  `TauCeti/Probability/UniformSampling.lean`: for every set `A` of index maps, the two uniform laws
  differ on `A` by at most `uniformOn Set.univ {x | ¬ Function.Injective x}`, in both directions.
- `TauCeti.Probability.ExchangeableAt.sampleWithoutReplacement_eq_prefixLaw` in
  `TauCeti/Probability/Exchangeability/SamplingWithoutReplacement.lean`: for
  `[IsFiniteMeasure μ]`, `h : ExchangeableAt μ X n`, `m ≤ n` and
  `hX : ∀ i : Fin n, AEMeasurable (X i.val) μ`,
  `sampleWithoutReplacement (ι := Fin m) (prefixLaw μ X n) = prefixLaw μ X m`.
- `TauCeti.Probability.ExchangeableAt.finiteDeFinetti` in the same `FiniteDeFinetti.lean`: the
  bound with error `m.choose 2 / n`, which Section 1.3 sharpens under the same hypotheses.
- `MeasureTheory.Measure.toJordanDecomposition_toSignedMeasure_sub_posPart_univ_eq_iSup`,
  `toJordanDecomposition_toSignedMeasure_sub_posPart_univ_eq_negPart_univ` and
  `totalVariation_toSignedMeasure_sub_univ_le_two_mul_iff` in
  `TauCeti/MeasureTheory/VectorMeasure/Decomposition/Jordan.lean`: for finite measures, the
  positive part of `μ - ν` on `univ` is the excess; for equal total mass the two parts agree and
  the norm is at most `2 * c` iff every measurable event has `μ A ≤ ν A + c`.

## How to read the build

Layers are in dependency order and each section ends with a *Needs:* line. Hypotheses are stated
in the sentence that states the target. **Checks** give values that a correct statement must
produce and, where a hypothesis is essential, an instance showing that the statement fails
without it. `Suggested.lean` states the headline theorems; the remaining targets here are equally
part of the roadmap.

## Layer 0: Deterministic populations and excess tools

### 0.1 Deterministic populations

For `[SFinite σ]` and `x : κ → α`, `samplePopulation σ (Measure.dirac x) = σ.map (fun k i => x (k i))`,
as a simp lemma. Specializations: `P x` is the pushforward of
`uniformOn {k : ι → κ | Function.Injective k}`, and `Q x` of `uniformOn Set.univ`, along
`k ↦ x ∘ k`.

**Checks.** `n = 3`, `m = 2`, `x` injective: `P x` gives each of the six injective words mass
`1/6`, `Q x` each of the nine words mass `1/9`.

*Needs:* `samplePopulation_def`, `Measure.prod_dirac`, `Measure.map_map`.

### 0.2 Observation commutes with sampling

For `[SFinite ρ]` and measurable `g : α → β`,
`samplePopulation σ (ρ.map (g ∘ ·)) = (samplePopulation σ ρ).map (g ∘ ·)`, with its `P` and `Q`
specializations. In particular `P (x ∘ y) = (P y).map (x ∘ ·)` and likewise for `Q`, for
`y : κ → κ'` and measurable `x : κ' → α`; when `κ'` is finite with measurable singletons, as in
Layer 3, every `x` is measurable.

**Checks.** `g` constant with value `c`: both sides are the total mass times the Dirac measure at
the constant word `c`.

*Needs:* 0.1; `samplePopulation_apply`; `Measure.map_apply`.

### 0.3 Excess contracts under measurable maps

For measures `μ ν` and measurable `f`, the excess of `μ.map f` over `ν.map f` is at most the excess
of `μ` over `ν`.

**Checks.** `f` constant: the left side is `μ univ - ν univ`, the excess at `A = univ`.

*Needs:* `Measure.map_apply`.

### 0.4 Excess on a finite type

For finite measures `μ ν` on a finite type with measurable singletons, the excess of `μ` over `ν`
is `∑ y, (μ {y} - ν {y})`, the subtraction being truncated in `ℝ≥0∞`. It is attained at
`A = {y | ν {y} < μ {y}}`. For probability measures this is [LPW, Proposition 4.2 and
Remark 4.3, equation (4.5), p. 48].

**Checks.** On `Bool`, `μ = dirac true` and `ν` uniform: excess `1/2`, sum `1/2 + 0`.

*Needs:* finite sums of singleton masses.

### 0.5 Norm and excess

For finite measures `μ ν` with `μ univ = ν univ`, the norm of `μ - ν` is twice the excess of `μ`
over `ν`.

**Checks.** `μ = ν`: both sides `0`. `μ = dirac a`, `ν = dirac b`, `a ≠ b` with measurable
singletons: norm `2`, excess `1`.

*Needs:* the three Jordan-decomposition supplier lemmas.

### Examples

On `Bool` with `μ = dirac true` and `ν` uniform, the excess is `1/2` (0.4) and the norm is `1`
(0.5); pushing both forward by a constant map gives excess `0`, below `1/2` (0.3).

### Dependencies

0.1 precedes 0.2. Sections 0.3 to 0.5 are independent of 0.1 and 0.2.

## Layer 1: The exact collision bound and its attainment

### 1.1 Collision masses

`uniformOn_injective_apply_eq`: `uniformOn (Set.univ : Set (ι → κ)) {k | Function.Injective k} = p`,
for all finite `ι κ` (both sides are `0` when `ι → κ` is empty), as a simp lemma.
`uniformOn_not_injective_apply_eq`: for `[Nonempty (ι → κ)]`,
`uniformOn (Set.univ : Set (ι → κ)) {k | ¬ Function.Injective k} = 1 - p`, as a simp lemma. For injective `x` and
`MeasurableSet {f : ι → α | Function.Injective f}`, pushing forward gives
`Q x {f | Function.Injective f} = p`, and `P x {f | Function.Injective f} = 1` given `e : ι ↪ κ`.

**Checks.** `n = 3`, `m = 2`: `6/9` and `3/9`. `m > n ≥ 1`: `p = 0` and the non-injective mass is
`1`. Without `Nonempty (ι → κ)`, take `κ` empty and `m = 1`: the left side is `0` and the right
side `1 - 0 = 1`, so the second identity fails.

*Needs:* `Fintype.card_embedding_eq`, `Nat.descFactorial`; 0.1.

### 1.2 Exact collision bound for random populations

For a probability measure `ρ` on `κ → α` and measurable `A`,
`sampleWithoutReplacement_le_sampleWithReplacement_add_collision` and
`sampleWithReplacement_le_sampleWithoutReplacement_add_collision` bound each law's mass of `A`
by the other's plus `uniformOn (Set.univ : Set (ι → κ)) {k | ¬ Function.Injective k}`: integrate
`uniformOn_injective_le_add` and `uniformOn_univ_le_injective_add` over `ρ` by
`samplePopulation_apply_population`, as the supplier's `choose m 2 / n` bound does. By 1.1 the
error is `1 - p` when `ι → κ` is nonempty; when it is empty both laws are zero. Norm form: with
`e : ι ↪ κ` and `[Nonempty κ]`, the norm of the difference is at most `2 * (1 - p)`.

**Checks.** `ρ = dirac x`, `x` injective, `n = 3`, `m = 2`: error `1/3`, attained at
`A = {f | Function.Injective f}` (masses `1` and `2/3`). `n = 4`, `m = 3`: `1 - p = 5/8`, below the
supplier's `choose 3 2 / 4 = 3/4`.

*Needs:* 1.1; `samplePopulation_apply_population`; the two uniform-sampling supplier lemmas; 0.5.

### 1.3 Exact-collision finite de Finetti

`ExchangeableAt.finiteDeFinetti_exact_collision`: for `[IsProbabilityMeasure μ]`,
`h : ExchangeableAt μ X n`, `m ≤ n`, `hX : ∀ i : Fin n, AEMeasurable (X i.val) μ` and measurable
`A : Set (Fin m → α)`, the two inequalities of 1.2 hold between `prefixLaw μ X m` and
`sampleWithReplacement (ι := Fin m) (prefixLaw μ X n)`, with error
`1 - n.descFactorial m / n ^ m`, and the norm of the difference is at most twice the error. This is
[DF80, Theorem 13]: rewrite the prefix law by
`TauCeti.Probability.ExchangeableAt.sampleWithoutReplacement_eq_prefixLaw` and apply 1.2.

**Checks.** `n = m = 2`: error `1/2`; `m = 1`: error `0`, and both laws are the one-dimensional
marginal.

*Needs:* 1.2; `TauCeti.Probability.ExchangeableAt.sampleWithoutReplacement_eq_prefixLaw`.

### 1.4 Distinct values attain the bound

For injective `x`, `e : ι ↪ κ` and `MeasurableSet {f : ι → α | Function.Injective f}`, the excess
of `P x` over `Q x` is exactly `1 - p`, and with `[Nonempty κ]` the norm of `P x - Q x` is
`2 * (1 - p)`. The upper bound is 1.2; the event `{f | Function.Injective f}` attains it by 1.1.

**Checks.** `n = 3`, `m = 2`: excess `1/3`, norm `2/3`. `m ≤ 1`: `p = 1`, both sides `0`. The
measurability hypothesis is used only to evaluate 1.1: on `α` with the trivial σ-algebra and
`2 ≤ m ≤ n`, the all-distinct set is neither `∅` nor `univ`, so the hypothesis fails there.

*Needs:* 1.1, 1.2, 0.5.

### 1.5 Attainment for exchangeable processes

For `[Nonempty α]`, `m ≤ n` and injective `x : Fin n → α` with
`MeasurableSet {f : Fin m → α | Function.Injective f}`, there is a probability space carrying a
process `X`, measurable in each coordinate and exchangeable at `n`, with
`prefixLaw μ X m {f | Function.Injective f} = 1` and
`sampleWithReplacement (ι := Fin m) (prefixLaw μ X n) {f | Function.Injective f} = n.descFactorial m / n ^ m`,
so 1.3 holds with equality on that event. Take `Ω = Equiv.Perm (Fin n)` with the uniform law,
`X i σ = x (σ i)` for `i < n`, and `X i` constant for `i ≥ n` (this uses `Nonempty α`).

**Checks.** `n = m = 2`, `x = id`: masses `1` and `2/4`. `n = m = 0`: masses `1` and `1`.

*Needs:* 1.1, 1.3; `ExchangeableAt`, `prefixLaw`.

### Examples

With `n = 3`, `m = 2` and distinct values, `P x` and `Q x` give the all-distinct event masses `1`
and `2/3`: excess `1/3`, norm `2/3` (1.2, 1.4). With `n = 4`, `m = 3` the exact error is `5/8`,
against the supplier's `3/4`. A uniformly random ordering of two distinct values (`n = m = 2`)
is an exchangeable process whose prefix law and with-replacement law differ by exactly the
error `1/2` of 1.3 (1.5).

### Dependencies

1.1, then 1.2, then 1.3 and 1.4; 1.5 uses 1.1 and 1.3. Layer 1 uses 0.1 and 0.5.

## Layer 2: One repeated pair, exactly

Throughout, `a b : κ` are distinct, `q = Function.update id b a`, and `m ≤ n`.

### 2.1 Singleton masses

For `[MeasurableSingletonClass α]`, `x : κ → α` and `y : ι → α`,
`P x {y} = Nat.card {f : ι ↪ κ // x ∘ f = y} / n.descFactorial m` and
`Q x {y} = Nat.card {f : ι → κ // x ∘ f = y} / n ^ m` in `ℝ≥0∞`, for all `m` and `n`.

**Checks.** `n = 3`, `m = 2`, `x = id`, `y = (0, 1)`: one embedding and one map, masses `1/6`
and `1/9`. `m > n`: `0 / 0 = 0 = P x {y}`.

*Needs:* 0.1; `uniformOn` on a finite set.

### 2.2 Fibres of the one-pair population

For an embedding `f : ι ↪ κ`, let `r` be the number of `i` with `q (f i) = a`; then `r ≤ 2`, and
`r = 2` iff `a, b ∈ Set.range f`. The fibre `{g : ι ↪ κ // q ∘ g = q ∘ f}` has one element if
`r = 0` and two otherwise, and the fibre `{g : ι → κ // q ∘ g = q ∘ f}` has `2 ^ r` elements.

**Checks.** `r = 2`: the two embeddings place `a` and `b` in either order; the four maps choose
`a` or `b` independently at both positions.

*Needs:* `Function.update`.

### 2.3 Two-hit mass

`uniformOn {k : ι → κ | Function.Injective k} {k | a ∈ Set.range k ∧ b ∈ Set.range k} =
m.descFactorial 2 / n.descFactorial 2` in `ℝ≥0∞`; here `n ≥ 2`, so this is `t` cast to `ℝ≥0∞`.

**Checks.** `n = 3`, `m = 2`: `2/6 = t`. `m = 1`: both sides `0`. Without `m ≤ n` the left side is
`0` and `t > 0` once `m ≥ 2`.

*Needs:* `Fintype.card_embedding_eq`.

### 2.4 The one-pair formula

The excess of `P q` over `Q q` (laws on `ι → κ`) is `ENNReal.ofReal (1 - p - t * min p (1 - p))`,
and the norm of their difference is twice that. By 2.1 and 2.2, on the support of `P q` the
likelihood ratio `Q q {y} / P q {y}` is `p` where `r ≤ 1` and `2 * p` where `r = 2`, and by 2.3
the two parts of the support have `P q`-mass `1 - t` and `t`. Section 0.4 gives the excess as the
sum of the positive parts; words outside the support contribute zero.

**Checks.** `κ = {a, b, c}`, `n = 3`, `m = 2`: `P q` gives `(a,a)`, `(a,c)`, `(c,a)` mass `1/3` each,
`Q q` gives them `4/9`, `2/9`, `2/9` and `(c,c)` mass `1/9`; the excess is `1/9 + 1/9 = 2/9`, and the
formula gives `1 - 2/3 - (1/3)(1/3) = 2/9`. `n = m = 4`: `p = 3/32`, `t = 1`, excess `13/16`.
`n = m = 2`: `P q = Q q = dirac (a, a)`, excess `0`. Without `m ≤ n`, take `n = 2`, `m = 3`: `P q`
is zero, the excess is `0`, and the formula gives `1`.

*Needs:* 2.1, 2.2, 2.3, 0.4, 0.5.

### Examples

With `n = 3`, `m = 2`, the norm of `P x - Q x` is `2/3` for distinct values (1.4), `4/9` for one
pair, and `0` for a constant population. With `n = m = 4` and one pair it is `13/8`.

### Dependencies

2.1, 2.2 and 2.3 are independent; 2.4 uses all three and Sections 0.4 and 0.5.

## Layer 3: Repeated values, the general bound

### 3.1 The bound

For `x : κ → α` not injective and measurable `A : Set (ι → α)`,
`P x A ≤ Q x A + ENNReal.ofReal (1 - p - t * min p (1 - p))` and the converse inequality hold,
and with `e : ι ↪ κ` and `[Nonempty κ]` the norm of `P x - Q x` is at most twice that error. No
hypothesis on `α` is needed. For `m ≤ n`, choose `a ≠ b` with `x a = x b`, so that `x = x ∘ q`;
then 0.2 writes `P x` and `Q x` as pushforwards of `P q` and `Q q`, and 0.3 with 2.4 bounds the
excess in both directions. For `m > n`, `P x` is zero, `p = 0`, and the error is `1`.

**Checks.** Constant `x`, `n = 3`, `m = 2`: the excess is `0`, below `2/9`. Every `x : κ → α` is
measurable because `κ` is finite with measurable singletons.

*Needs:* 0.2, 0.3, 0.5, 2.4.

### 3.2 Strictness

For `2 ≤ m ≤ n`, `0 < t * min p (1 - p)`, so the bound of 3.1 is strictly below `1 - p`.

**Checks.** `n = 3`, `m = 2`: `1/9`. `m = n = 2`: `1/2`. `m = 1`: `t = 0`, so `2 ≤ m` is needed.

*Needs:* `Nat.descFactorial`.

### 3.3 Characterization and small samples

For `2 ≤ m ≤ n` and `MeasurableSet {f : ι → α | Function.Injective f}`, the excess of `P x` over
`Q x` equals `1 - p` iff `x` is injective. For `m ≤ 1`, `P x = Q x` for every `x`.

**Checks.** `n = 3`, `m = 2`: excess `1/3` for distinct values, `2/9` for one pair, `0` for a
constant population. `m = 1`: `1 - p = 0` equals the excess for every `x`, so `2 ≤ m` is needed
for the characterization.

*Needs:* 1.4, 3.1, 3.2.

### Examples

With `n = 3`, `m = 2`, the excess is `1/3` for distinct values, `2/9` for one pair and `0` for a
constant population; every non-injective population is at most `2/9`, strictly below `1/3`
(3.1, 3.2, 3.3). With `n = m = 4` and one pair, the bound `13/16` is attained, against
`1 - p = 29/32`.

### Dependencies

3.1 uses Layers 0 and 2; 3.3 uses 1.4, 3.1 and 3.2.

## Layer 4: Random populations and finite de Finetti with ties

### 4.1 Mixture bound

For a probability measure `ρ` on `κ → α`, `e : ι ↪ κ`, a measurable set `S` of non-injective
populations and measurable `A`, both eventwise inequalities between
`sampleWithoutReplacement ρ` and `sampleWithReplacement ρ` hold with error
`ENNReal.ofReal (1 - p - t * min p (1 - p) * (ρ S).toReal)`, and with `[Nonempty κ]` the norm of
the difference is at most twice that. Integrate over `ρ` by
`samplePopulation_apply_population`, using 1.2 for `ρ = dirac x` off `S` and 3.1 on `S`.

**Checks.** `S = ∅`: the error is `1 - p`, as in 1.2. `ρ = ½ dirac x₁ + ½ dirac x₂` with `x₁`
injective and `x₂` one pair, `n = 3`, `m = 2`, `S = {x₂}`: error `1/3 - 1/18 = 5/18`, the average of
`1/3` and `2/9`.

*Needs:* 1.2, 3.1.

### 4.2 Finite de Finetti with ties

For `[IsProbabilityMeasure μ]`, `h : ExchangeableAt μ X n`, `m ≤ n`,
`hX : ∀ i : Fin n, AEMeasurable (X i.val) μ`, a measurable set `S` of non-injective populations in
`Fin n → α` and measurable `A`, the two inequalities of 4.1 hold between `prefixLaw μ X m` and
`sampleWithReplacement (ι := Fin m) (prefixLaw μ X n)`, with `ρ = prefixLaw μ X n` in the error.

**Checks.** `S = ∅` recovers 1.3. A process whose `n`-prefix has a repeated value almost surely
has error `1 - p - t * min p (1 - p)`.

*Needs:* 4.1; `TauCeti.Probability.ExchangeableAt.sampleWithoutReplacement_eq_prefixLaw`.

### Examples

With `n = 3`, `m = 2` and `ρ` the even mixture of a distinct-value population and a one-pair
population, the error with `S` the one-pair population is `5/18`, against `1/3` with `S = ∅`
(4.1). A uniformly random ordering of the population `(a, a, c)` is exchangeable at `n = 3`, its
`3`-prefix has a repeated value almost surely, and with `m = 2` the error of 4.2 is `2/9`.

### Dependencies

4.1 uses Layers 1 and 3; 4.2 uses 4.1.

## Downstream consumers

Any development that uses Exchangeability Layer 8's finite de Finetti bound can use the exact
error of Section 1.3 in its place, and the tie-dependent error of Section 4.2 when populations
repeat values. The exact formulas of Layers 1 and 2 are the error terms a finite-population
sampling development needs when it compares with-replacement and without-replacement designs.

## References

- [DF80] P. Diaconis and D. Freedman, "Finite exchangeable sequences", *Ann. Probab.* 8 (4)
  (1980), 745–764, [doi:10.1214/aop/1176994663](https://doi.org/10.1214/aop/1176994663).
  Theorem 13: Section 1.3.
- [LPW] D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov Chains and Mixing
  Times*, second edition, American Mathematical Society, 2017. Proposition 4.2 and Remark 4.3,
  p. 48: Section 0.4.

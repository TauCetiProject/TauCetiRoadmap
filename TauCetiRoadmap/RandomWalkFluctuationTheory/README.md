# Roadmap: random walk fluctuation theory

**Summary.** A fair coin is tossed repeatedly and a player's fortune goes up or down by one
with each toss. The partial sums form the simple random walk on the integers, and its
fluctuations behave against intuition: the walk returns to zero, yet it typically spends long
stretches on one side, and the last return before a fixed time is more likely near the start or
the end than in the middle. This roadmap proves the exact laws behind these facts and Pólya's
theorem on returns of the simple random walk on the lattice `ℤ^d`. The walk is given by its steps
on an arbitrary probability space: independent steps, each `+1` or `−1` with probability `1/2`, or
in `ℤ^d` each one of the `2d` unit vectors `± eⱼ` with probability `1/(2d)`. The walk starts at
the origin.

The headline theorems are these.

- *The reflection principle and the ballot theorem.* For integers `a ≥ 0` and `b ≤ a`, the walk
  reaches level `a` by time `n` and ends at `b` with the same probability as it ends at
  `2a − b`. For every `n` and every `k ≥ 0`, `n` times the probability that the walk is strictly
  positive at times `1, …, n` and ends at `k` is `k` times the probability that it ends at `k`.
- *The arcsine laws.* Write `u₂ₙ = P(S₂ₙ = 0) = C(2n, n)/4ⁿ`. For `0 ≤ k ≤ n`, the last visit
  to `0` up to time `2n` is at time `2k` with probability `u₂ₖ u₂ₙ₋₂ₖ`; for `k = 0` this says
  that the walk avoids `0` at all times `1, …, 2n` with probability `u₂ₙ`. The number of steps
  up to time `2n` that the walk spends above the axis is `2k` with the same probability. Divided
  by `2n`, both converge in distribution to the arcsine law, whose distribution function is
  `(2/π) arcsin √x` on `[0, 1]`.
- *Pólya's theorem.* The simple random walk on `ℤ²` visits the origin infinitely often almost
  surely. For `d ≥ 3`, the simple random walk on `ℤ^d` returns to the origin with probability
  strictly less than one.

The roadmap builds on Mathlib's independence of random variables, laws of random variables,
convergence in distribution and Stirling's formula, and on Tau Ceti's arcsine distribution, which
is the limit law of the arcsine laws. Tau Ceti's path law of a Markov chain and its recurrence
criterion, which formalize parts of what the roadmap MarkovChainsAndRenewal plans, are used for
Pólya's theorem; that roadmap also treats the walk on `ℤ` itself, where the walk is recurrent.

Layer 1 below sets up the walk on the integers and proves the reflection principle, the ballot
theorem and the identity for avoiding zero. Layer 2, which uses it, proves the two arcsine laws.
Layer 3 sets up the walk on `ℤ^d` and proves Pólya's theorem; of the earlier layers it uses only
the first section of Layer 1, the walk and its return probabilities.

## Conventions

- **Steps and positions.** The steps are random variables `ξ i : Ω → ℤ` (or `Ω → Fin d → ℤ`),
  `i : ℕ`, on a measurable space `Ω` with a measure `P`. The position at time `n` is
  `walk ξ n ω = ∑ i ∈ Finset.range n, ξ i ω`, written `Sₙ`; so `S₀ = 0` and step `ξ i` takes the
  walk from time `i` to time `i + 1`. The lattice `ℤ^d` is `Fin d → ℤ` with coordinatewise
  addition, and `eⱼ = Pi.single j 1`.
- **The walk hypothesis.** `IsSimpleRandomWalk P ξ` asks that the steps be independent
  (Mathlib's `iIndepFun ξ P`) and that each have law `signLaw`, in the sense of Mathlib's
  `HasLaw` (each step is almost everywhere measurable and its image measure is the given law).
  `IsLatticeWalk d P ξ` is the same with the law `latticeStepLaw d`. Both laws are probability
  measures (for `d ≥ 1`), so each hypothesis forces `P` to be a probability measure.
- **Probabilities.** Probabilities are values of `P` in `ℝ≥0∞`, applied to sets of outcomes
  described by the positions; `uₘ` denotes `P(Sₘ = 0)`. Natural-number subtraction appears in
  `2 * (n − k)`, always under the hypothesis `k ≤ n`, and in `k − 1` for `k ≥ 1`.
- **Times.** "At times `1, …, n`" means for every `j ∈ Finset.Icc 1 n`, which is empty for
  `n = 0`. Times are natural numbers, and the limits of Layer 2 are along `n → ∞`.

## Layer 1: the simple random walk on the integers

### 1.1 The walk

Define the step law `signLaw = ½ (δ₁ + δ₋₁)` on `ℤ`, the position `walk ξ n ω`, and the structure
`IsSimpleRandomWalk P ξ` with the fields `hasLaw` and `indep` of the Conventions.

- Under `IsSimpleRandomWalk P ξ`, for every `n` the first `n` steps have the joint law of `n`
  independent fair signs: each sign sequence `(s₀, …, s_(n−1)) ∈ {±1}ⁿ` has probability `2⁻ⁿ`.
  This follows from Mathlib's `iIndepFun_iff_map_fun_eq_pi_map` applied to the restriction of the
  steps to `Fin n` (`iIndepFun.precomp`). Every statement of Layers 1 and 2 is a statement about
  this finite law, so it reduces to counting sign sequences.
- `Sₙ` has the binomial law `P(Sₙ = x) = C(n, (n + x)/2) 2⁻ⁿ` when `|x| ≤ n` and `n + x` is even,
  and `0` otherwise; in particular `u₂ₙ = C(2n, n)/4ⁿ` and `u₂ₙ₊₁ = 0` (Durrett, (4.9.1), p. 263).
- The law of the walk is symmetric: `P(Sₙ = x) = P(Sₙ = −x)`, and more generally the steps `−ξ`
  also satisfy `IsSimpleRandomWalk`.
- `signLaw` is the integer-valued form of Tau Ceti's Rademacher law: its image under the cast
  `ℤ → ℝ` is `TauCeti.Probability.rademacherMeasure`.

**Checks.**
- `u₂ = 1/2`, `u₄ = 3/8`, `u₆ = 5/16`.
- The law `signLaw` has total mass `1`; the variant `δ₁ + δ₋₁` without the factor `½` would have
  mass `2` and no probability space would carry such a step.

*Needs:* Mathlib `HasLaw`, `HasLaw.measure_eq`, `iIndepFun`, `iIndepFun_iff_map_fun_eq_pi_map`,
`iIndepFun.precomp`, `Measure.pi`, `Measure.dirac`. (Proved here.)

### 1.2 The reflection principle

Prove `measure_exists_le_walk_and_walk_eq`: under `IsSimpleRandomWalk P ξ`, for all natural
numbers `n`, `a` and every integer `b ≤ a`,
`P(∃ k ≤ n, a ≤ S_k, and Sₙ = b) = P(Sₙ = 2a − b)`. This is the counting statement of Durrett,
Theorem 4.9.1, p. 263, translated by `a` and reflected (there for paths started at `x > 0` and
ended at `y > 0`, which is the case `a ≥ 1`, `b < a` here; the cases `a = 0` and `b = a` are
proved here).

- *The maximum.* For every `a : ℕ`, `P(max_(k ≤ n) S_k ≥ a) = P(Sₙ ≥ a) + P(Sₙ > a)`, by summing
  the identity over `b < a` and adding the paths that end at or above `a`.

Route: by 1.1 it suffices to count sign sequences. A path that reaches `a` first does so at a time
`K ≤ n`; reflecting the steps after `K` maps the paths that reach `a` and end at `b` bijectively
onto the paths that end at `2a − b`, since `2a − b ≥ a` and every path ending there reaches `a`.

**Checks.**
- `n = 4`, `a = 1`, `b = 0`: both sides are `1/4` (the four paths ending at `2`, against the four
  paths ending at `0` after touching `1`).
- `n = 4`, `a = 1`: `P(max_(k ≤ 4) S_k ≥ 1) = 5/8 = 5/16 + 5/16`.
- The hypothesis `b ≤ a` is needed: for `n = 4`, `a = 1`, `b = 2` the left side is `P(S₄ = 2) = 1/4`
  while `P(S₄ = 0) = 3/8`.
- `a = 0`: every path qualifies at `k = 0`, and the identity becomes the symmetry
  `P(Sₙ = b) = P(Sₙ = −b)`.

*Needs:* 1.1. (Durrett, Theorem 4.9.1.)

### 1.3 The ballot theorem

Prove `natCast_mul_measure_forall_pos_and_walk_eq`: under `IsSimpleRandomWalk P ξ`, for all
natural numbers `n` and `k`,
`n · P(S_j > 0 for j = 1, …, n, and Sₙ = k) = k · P(Sₙ = k)` in `ℝ≥0∞` (Durrett, Theorem 4.9.2
and its proof, pp. 263–264, where it is stated for an election in which the winner receives
`(n + k)/2` of `n` votes). For `1 ≤ k ≤ n` with `n + k` even, so that
`P(Sₙ = k) > 0`, this says that a walk conditioned to end at `k` stays positive with
probability `k/n`.

Route: a positive path from `0` to `(n, k)` starts with an up-step, and by 1.2 the paths from
`(1, 1)` to `(n, k)` that touch `0` are as many as those from `(1, −1)` to `(n, k)`. The count is
`C(n − 1, (n + k)/2 − 1) − C(n − 1, (n + k)/2) = (k/n) C(n, (n + k)/2)` when `1 ≤ k ≤ n` and
`n + k` is even; both sides vanish in every other case.

**Checks.**
- `n = 5`, `k = 3`: `P(positive, S₅ = 3) = 3/32` and `P(S₅ = 3) = 5/32`, and `5 · 3/32 = 3 · 5/32`.
  For `k = 1` the values are `1/16` and `5/16`.
- At `n = 0` the event "positive at times `1, …, 0`" is the whole space, so for `k = 0` the
  probability is `1`. The divided form `P(…) = (k/n) P(Sₙ = k)` would read `1 = 0` there with the
  junk value `0/0 = 0`; the multiplied form reads `0 = 0`.

*Needs:* 1.1, 1.2. (Durrett, Theorem 4.9.2.)

### 1.4 Avoiding zero

Prove that under `IsSimpleRandomWalk P ξ`, for every `n`,
`P(S_j ≠ 0 for j = 1, …, 2n) = P(S₂ₙ = 0)` (Durrett, Lemma 4.9.3, p. 264). It is the case
`k = 0` of the law of the last zero (2.1), whose route uses it.

- For `n ≥ 1`, `2 · P(S_j > 0 for j = 1, …, 2n) = u₂ₙ` (Durrett, proof of Lemma 4.9.3, p. 264).
- For every `n`, `P(S_j ≥ 0 for j = 1, …, 2n) = u₂ₙ` (Durrett, proof of Theorem 4.9.6, p. 267).
- Consequently the first return time `R = min {m ≥ 1 : Sₘ = 0}` has `P(R > 2n) = u₂ₙ` and
  `P(R = 2n) = u₂ₙ₋₂ − u₂ₙ` for `n ≥ 1` (Durrett, (4.9.2) and the display after it, pp. 264–265).

Route: by the count in the route of 1.3, for `r ≥ 1` the probability that `S_j > 0` for
`j = 1, …, 2n − 1` and `S₂ₙ = 2r` is `½ (P(S₂ₙ₋₁ = 2r − 1) − P(S₂ₙ₋₁ = 2r + 1))`; summed over
`r ≥ 1` these telescope to `½ P(S₂ₙ₋₁ = 1) = ½ u₂ₙ`, and the negative paths contribute the same by
symmetry.
The nonnegative form follows by removing the first step: a path that stays positive after an
up-step is a path that stays nonnegative, shifted.

**Checks.**
- `n = 2`: the walk avoids `0` at times `1, …, 4` with probability `3/8 = u₄`.
- The horizon must be even: at time `3` the walk avoids `0` at times `1, 2, 3` with probability
  `1/2`, while `P(S₃ = 0) = 0`.
- The positive form needs `n ≥ 1`: at `n = 0` the event is the whole space and `2 · 1 ≠ u₀ = 1`.
- `P(R = 2) = 1/2`, `P(R = 4) = 1/8`, `P(R = 6) = 1/16`.

*Needs:* 1.1, 1.3. (Durrett, Lemma 4.9.3.)

### Examples

The paths of length `4` and `5`: the reflection of a path at its first visit to level `1`, the
maximum up to time `4`, the positive paths ending at `1` and `3`; the first return times `2`, `4`
and `6`.

### Dependencies

Mathlib `HasLaw`, `HasLaw.measure_eq`, `iIndepFun`, `iIndepFun_iff_map_fun_eq_pi_map`,
`iIndepFun.precomp`, `Measure.pi`, `Measure.dirac`. No other layer.

## Layer 2: the arcsine laws

### 2.1 The last zero

Define `lastZero ξ n ω`, the largest `m ≤ n` with `S_m = 0`; it is the supremum of a finite set
of times that always contains `0`. Prove `measure_lastZero_eq`: under `IsSimpleRandomWalk P ξ`,
for `k ≤ n`, `P(lastZero ξ (2n) = 2k) = u₂ₖ · u₂ₙ₋₂ₖ` (Durrett, Lemma 4.9.4, p. 265).

- The last zero up to time `2n` is even, and its law is symmetric about `n`:
  `P(lastZero ξ (2n) = 2k) = P(lastZero ξ (2n) = 2n − 2k)`.

Route: the event is `S₂ₖ = 0` and `S_j ≠ 0` for `2k < j ≤ 2n`; by independence of the steps before
and after time `2k` it has probability `u₂ₖ` times the probability of avoiding `0` for `2n − 2k`
steps, which is `u₂ₙ₋₂ₖ` by 1.4.

**Checks.**
- `n = 2`: the last zero up to time `4` is `0`, `2`, `4` with probabilities `3/8`, `1/4`, `3/8`,
  and never odd.
- `n = 7`: the last zero up to time `14` is at most `7` with probability exactly `1/2`, by the
  symmetry above (the times `0, 2, 4, 6` and `8, 10, 12, 14` pair off).
- The hypothesis `k ≤ n` is needed: for `n = 1`, `k = 2` the left side is `0`, while the right side
  with natural-number subtraction is `u₄ · u₀ = 3/8`.

*Needs:* 1.1, 1.4. (Durrett, Lemma 4.9.4.)

### 2.2 The time spent positive

Define `timePositive ξ n ω`, the number of `k ∈ {1, …, n}` with `S_(k−1) + S_k > 0`. Since
consecutive positions differ by one, this says that the segment from `(k − 1, S_(k−1))` to
`(k, S_k)` lies in the closed upper half-plane, which is how Durrett counts the time the walk
spends above the axis. Prove `measure_timePositive_eq`: under `IsSimpleRandomWalk P ξ`, for
`k ≤ n`, `P(timePositive ξ (2n) = 2k) = u₂ₖ · u₂ₙ₋₂ₖ` (Durrett, Theorem 4.9.6, pp. 266–267). In
particular the time spent positive and the last zero up to time `2n` have the same law.

Route: by induction on `n`, following Durrett. The cases `k = n` and `k = 0` are the nonnegative
form of 1.4 and its reflection. For `1 ≤ k ≤ n − 1` the walk returns to `0` before time `2n`;
split the sign sequences of length `2n` at the first return time `R = 2m`, whose law is given in
1.4, and according to the side of the first excursion; the remaining `2n − 2m` signs are uniform
and independent of the first `2m`, so the induction hypothesis applies to them, and the recursion
closes with the identity `u₂ₙ = ∑_(m=1)^n f₂ₘ u₂ₙ₋₂ₘ` for `f₂ₘ = P(R = 2m)`.

**Checks.**
- `n = 2`: the time spent positive up to time `4` is `0`, `2`, `4` with probabilities `3/8`,
  `1/4`, `3/8`, as for the last zero; it is always even.
- The definition counts segments, not times of positivity: the number of `k ≤ 4` with `S_k > 0`
  takes the values `0, 1, 2, 3, 4` with probabilities `3/8, 3/16, 1/8, 1/8, 3/16`, which is not the
  law above.

*Needs:* 1.1, 1.4. (Durrett, Theorem 4.9.6.)

### 2.3 The arcsine limit

Prove `tendstoInDistribution_arcsine`: under `IsSimpleRandomWalk P ξ` (with the probability
measure `P` registered as such), the random variables `lastZero ξ (2n)/(2n)` and
`timePositive ξ (2n)/(2n)` converge in distribution, in the sense of Mathlib's
`TendstoInDistribution`, to Tau Ceti's `arcsineMeasure`, the beta law of parameters `(½, ½)` on
`[0, 1]` with density `1/(π √(x(1 − x)))` (Durrett, Theorems 4.9.5 and 4.9.6, pp. 265–266, where
the convergence is stated for `P(a ≤ L₂ₙ/2n ≤ b)` with `0 < a < b < 1`). At `n = 0` the quotient
is the junk value `0/0 = 0`, which does not affect the limit.

- For `0 ≤ x ≤ 1`, `P(lastZero ξ (2n) ≤ 2nx) → (2/π) arcsin √x`, by Tau Ceti's
  `cdf_arcsineMeasure_eq`; the same holds for the time spent positive.

Route: by 2.1 and 2.2 both variables have the law `k ↦ u₂ₖ u₂ₙ₋₂ₖ` on `{0, 2, …, 2n}`, so it
suffices to treat the last zero. From Mathlib's Stirling formula
(`Stirling.tendsto_stirlingSeq_sqrt_pi`) and 1.1, `√(πm) u₂ₘ → 1`; hence
`n u₂ₖ u₂ₙ₋₂ₖ → 1/(π √(x(1 − x)))` uniformly for `k/n` in compact subsets of `(0, 1)`, and the
masses of intervals `[a, b]` with `0 < a < b < 1` converge to their arcsine masses (Durrett, proof
of Theorem 4.9.5, pp. 265–266). Since the arcsine law has no atoms and these intervals exhaust
`(0, 1)`, the masses of all closed intervals converge, and Mathlib's
`IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem` with the π-system of closed intervals
(`isPiSystem_Icc`) gives convergence of the laws.

**Checks.**
- The limit distribution function is `1/2` at `x = 1/2` and `1/3` at `x = 1/4`
  (`(2/π) arcsin(1/2)`).
- From the exact law of 2.1, `P(lastZero ξ (2n) ≤ n/2)` is `0.3352`, `0.3343` and `0.3334` for
  `n = 50`, `500`, `5000`, approaching `1/3`.
- The law gives most mass near the ends: `k ↦ u₂ₖ u₂ₙ₋₂ₖ` decreases up to the middle and increases
  after it, so its largest value is `u₂ₙ`, at `k = 0` and `k = n`; for `n = 4` the values are
  `35/128, 5/32, 9/64, 5/32, 35/128`.

*Needs:* 2.1, 2.2; Mathlib `TendstoInDistribution`, `Stirling.tendsto_stirlingSeq_sqrt_pi`,
`IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem`, `isPiSystem_Icc`; Tau Ceti
`arcsineMeasure`, `cdf_arcsineMeasure_eq`. (Durrett, Theorems 4.9.5 and 4.9.6.)

### Examples

The laws of the last zero and of the time spent positive up to time `4`; the exact value `1/2` of
`P(lastZero ξ 14 ≤ 7)`; the convergence of `P(lastZero ξ (2n) ≤ n/2)` to `1/3`.

### Dependencies

1.1, 1.4; Mathlib `TendstoInDistribution`, `Stirling.tendsto_stirlingSeq_sqrt_pi`,
`IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem`, `isPiSystem_Icc`; Tau Ceti
`arcsineMeasure`, `cdf_arcsineMeasure_eq`.

## Layer 3: Pólya's theorem

### 3.1 The walk on the lattice

Define the step law `latticeStepLaw d = (2d)⁻¹ ∑_j (δ_(eⱼ) + δ_(−eⱼ))` on `Fin d → ℤ` and the
structure `IsLatticeWalk d P ξ` with the fields `hasLaw` and `indep`. For `d = 0` the step law is
the zero measure (the factor `0⁻¹ = ∞` multiplies the empty sum), so no measure `P` carries such a
walk with `P ≠ 0`; the theorems below assume `d = 2` or `d ≥ 3`.

- The position `Sₙ` has `P(Sₙ = 0) = 0` for odd `n` and
  `P(S₂ₙ = 0) = (2d)⁻²ⁿ ∑ (2n)!/(m₁! ⋯ m_d!)²` over `m₁ + ⋯ + m_d = n`, the number of closed paths
  of length `2n` divided by `(2d)²ⁿ` (Durrett, proof of Theorem 5.4.4, pp. 289–290, for
  `d = 2, 3`).
- For `d = 1` the first coordinate of the walk is a simple random walk on `ℤ` in the sense of 1.1.

**Checks.**
- `d = 2`: `P(S₂ = 0) = 1/4` and `P(S₄ = 0) = 9/64`. `d = 3`: `P(S₂ = 0) = 1/6` and
  `P(S₄ = 0) = 5/72`. These agree with a direct count of closed paths.
- The normalization `(2d)⁻¹` makes a probability measure: the variant `d⁻¹` gives total mass `2`.

*Needs:* 1.1; Mathlib `Pi.single`, `Measure.dirac`, `HasLaw`, `iIndepFun`,
`iIndepFun_iff_map_fun_eq_pi_map`. (Proved here.)

### 3.2 The return criterion

This section is for every step law on `ℤ^d`, not only the simple walk. Let the steps
`ξ i : Ω → Fin d → ℤ` be independent (`iIndepFun ξ P`) with a common law `μ`
(`HasLaw (ξ i) μ P` for every `i`, `μ` a probability measure on `Fin d → ℤ`), and let
`Sₙ = ξ₀ + ⋯ + ξ_(n−1)`. Prove that the path `ω ↦ (Sₙ ω)ₙ` has Tau Ceti's law
`markovChainLaw (δ₀) κ_μ`, where `κ_μ` is the translation kernel `x ↦ μ` shifted by `x`
(Mathlib's `Kernel.ofFunOfCountable`), and deduce, for the walk:

- `P(∃ n ≥ 1, Sₙ = 0) = 1` if and only if `∑ₙ P(Sₙ = 0) = ∞`;
- if `∑ₙ P(Sₙ = 0) = ∞`, the walk is at `0` at infinitely many times almost surely.

This is Durrett, Theorem 5.4.3, p. 289, for walks on `ℤ^d` (there for every random walk on
`ℝ^d`). The simple walk of 3.1 is the case `μ = latticeStepLaw d` with `d ≥ 1`, which is how 3.3
and 3.4 use it.

Route: Tau Ceti's `hasLaw_markovChainLaw_iff_prefixLaw_singleton` reduces the law of the path to
the masses of finite paths, which by independence are products of one-step masses `κ_μ x {y}`;
the time-`n` law is `(κ_μ ^ n) 0` by `HasLaw.eval_markovChainLaw`. (Tau Ceti's
`hasLaw_randomizedChain` gives the same path law for a chain driven by independent noise, here
with update `x, u ↦ x + u`; it asks for measurable noise variables consumed from index `1`, so the
finite-path route, which needs only almost everywhere measurable steps, is the one followed.) Then Tau Ceti's recurrence
criterion `Kernel.tsum_pow_apply_singleton_self_eq_top_iff` and
`Kernel.ae_infinite_setOf_eq_markovChainLaw_dirac`, read through the law of the path, give the two
statements; the first return of the path is Mathlib's `hittingAfter` from time `1`.

**Checks.**
- The criterion counts the visit at time `0`: `∑ₙ P(Sₙ = 0) = 1/(1 − ρ)` with
  `ρ = P(∃ n ≥ 1, Sₙ = 0)`, so the sum is at least `1` for every walk.
- A step law that is not the simple one: on `ℤ` with `μ{1} = 2/3`, `μ{−1} = 1/3`,
  `∑ₙ P(Sₙ = 0) = ∑ₙ C(2n, n) (2/9)ⁿ = 1/√(1 − 8/9) = 3`, so the return probability is
  `1 − 1/3 = 2/3 < 1`.

*Needs:* Mathlib `HasLaw`, `iIndepFun`, `Kernel.ofFunOfCountable`, `hittingAfter`; Tau Ceti
`markovChainLaw`,
`hasLaw_markovChainLaw_iff_prefixLaw_singleton`, `HasLaw.eval_markovChainLaw`,
`Kernel.tsum_pow_apply_singleton_self_eq_top_iff`,
`Kernel.ae_infinite_setOf_eq_markovChainLaw_dirac`. (Durrett, Theorem 5.4.3.)

### 3.3 Recurrence in dimension two

Prove `ae_frequently_walk_eq_zero_two`: under `IsLatticeWalk 2 P ξ`, almost surely `Sₙ = 0` for
infinitely many `n` (Durrett, Theorem 5.4.4, p. 289; Lyons–Peres, §2.5, Pólya's Theorem (first
part), p. 38; Pólya, 1921).

- `P(S₂ₙ = 0) = u₂ₙ²`, where `u₂ₙ = C(2n, n)/4ⁿ` is the one-dimensional value of 1.1 (Durrett,
  proof of Theorem 5.4.4, p. 289, by Vandermonde's identity `∑ₘ C(n, m)² = C(2n, n)`).
- `∑ₙ P(Sₙ = 0) = ∞`, since `π n u₂ₙ² → 1` by Stirling's formula and the harmonic series
  diverges.

Route: the two bullets and 3.2.

**Checks.**
- `P(S₂ = 0) = 1/4 = u₂²` and `P(S₄ = 0) = 9/64 = u₄²`.
- The partial sums `∑_(n ≤ N) u₂ₙ²` are `1.82`, `2.53`, `3.27` for `N = 10`, `100`, `1000`,
  growing like `(log N)/π`.

*Needs:* 1.1, 3.1, 3.2; Mathlib `Nat.add_choose_eq` (Vandermonde),
`Stirling.tendsto_stirlingSeq_sqrt_pi`. (Durrett, Theorem 5.4.4.)

### 3.4 Transience in dimensions three and more

Prove `measure_exists_walk_eq_zero_lt_one`: for `d ≥ 3`, under `IsLatticeWalk d P ξ`,
`P(∃ n ≥ 1, Sₙ = 0) < 1` (Durrett, Theorem 5.4.4, pp. 289–290; Lyons–Peres, §2.5, Pólya's
Theorem (second part), p. 41; Pólya, 1921).

- For `d = 3`, `P(S₂ₙ = 0) ≤ C n^(−3/2)` for a constant `C`, so `∑ₙ P(Sₙ = 0) < ∞`.
- For `d ≥ 3`, `∑ₙ P(Sₙ = 0) ≤ (d/3) ∑ₙ P(Tₙ = 0)` for a simple random walk `T` on `ℤ³`; in
  particular the sum is finite.

Route: for `d = 3`, write `P(S₂ₙ = 0) = u₂ₙ ∑ (3⁻ⁿ n!/(i! j! l!))²` over `i + j + l = n`; the
inner weights are a probability vector, so the sum of their squares is at most the largest
weight, which is at most `C/n` by Stirling's formula, while `u₂ₙ ≤ 1/√(2n + 1)` by Tau Ceti's
`Nat.centralBinom_mul_sqrt_le_four_pow` (Durrett, proof of Theorem 5.4.4, p. 290). For `d > 3`, the
first three coordinates of `S`, watched at the times when one of them
moves, form a simple random walk on `ℤ³`; the waiting times between these moves are independent
of that walk with mean `d/3`, which gives the comparison of Green sums (Durrett, p. 290, where the
comparison is made for returns). Then 3.2: a finite sum excludes return with probability one.

**Checks.**
- For `d = 3`, `n · max_(i+j+l=n) 3⁻ⁿ n!/(i! j! l!)` stays below `0.83` for `n ≤ 300`.
- The partial sum of `P(S₂ₙ = 0)` over `2n < 500` in `ℤ³` is `1.4868…`, so the return probability
  is at least `1 − 1/1.4868 > 0.32`; it is strictly less than one by the theorem.

*Needs:* 1.1, 3.1, 3.2; Mathlib `Stirling.tendsto_stirlingSeq_sqrt_pi`; Tau Ceti
`Nat.centralBinom_mul_sqrt_le_four_pow`. (Durrett, Theorem 5.4.4.)

### Examples

Return probabilities after two and four steps in `ℤ²` and `ℤ³` by counting closed paths; the
growth of the Green sum in `ℤ²`; a lower bound for the return probability in `ℤ³`.

### Dependencies

1.1; Mathlib `Pi.single`, `Measure.dirac`, `HasLaw`, `iIndepFun`, `iIndepFun_iff_map_fun_eq_pi_map`,
`Kernel.ofFunOfCountable`, `hittingAfter`, `Nat.add_choose_eq`,
`Stirling.tendsto_stirlingSeq_sqrt_pi`; Tau Ceti `markovChainLaw`,
`hasLaw_markovChainLaw_iff_prefixLaw_singleton`, `HasLaw.eval_markovChainLaw`,
`Kernel.tsum_pow_apply_singleton_self_eq_top_iff`,
`Kernel.ae_infinite_setOf_eq_markovChainLaw_dirac`, `Nat.centralBinom_mul_sqrt_le_four_pow`.
Layer 2 is not used.

## Scope and ownership

This roadmap owns the targets stated above: the simple random walk on `ℤ` given by independent
fair steps, the reflection principle and the law of the maximum, the ballot theorem for the walk,
the identities for avoiding zero and the law of the first return, the exact laws of the last zero
and of the time spent positive and their arcsine limit; the simple random walk on `ℤ^d`, the
return criterion for walks on `ℤ^d` with any step law, recurrence in dimension two and transience in dimensions three and more.

Already in the libraries and therefore not targets: Mathlib's independence of families of random
variables and its finite product form, laws of random variables (`HasLaw`), convergence in
distribution, the portmanteau theorem in the π-system form used in 2.3, Stirling's formula and
Vandermonde's identity; Tau Ceti's bound `C(2n, n) √(2n + 1) ≤ 4ⁿ` on central binomial
coefficients, its Rademacher law `rademacherMeasure` on `ℝ` (of which `signLaw` is the
integer-valued form, kept on `ℤ` because the parity and counting arguments of Layers 1 and 2 are
integer statements), its path law of a chain driven by independent noise
(`hasLaw_randomizedChain`), its arcsine law with its density and distribution function, the
path law of a Markov chain with its characterization by finite paths, and the recurrence
criterion through the Green function together with the infinitely many visits of a recurrent
state. Mathlib's `Archive` (not part of the imported library) proves the ballot problem in its
urn form, for the uniform measure on arrangements of `p` votes for one candidate and `q` for the
other; 1.3 is the statement for the random walk, in which the end point is random, and its route
does not use the archived file.

Left to other roadmaps and stated differently here:

- MarkovChainsAndRenewal owns the classification of states of countable Markov chains and the
  recurrence criterion through the Green function (its Layer 2), whose formalization 3.2
  consumes, and the classification of the nearest-neighbour walk on `ℤ` (also its Layer 2, the
  symmetric walk null recurrent, the asymmetric walk transient). Pólya's theorem in dimension one is therefore not
  restated here: 3.3 and 3.4 treat `d = 2` and `d ≥ 3`.
- StochasticCalculus owns the Brownian counterparts: the reflection principle and the law of the
  maximum of Brownian motion (its 6.2), neighbourhood recurrence and transience of Brownian motion
  in `ℝ^d` (its 6.4), the gambler's-ruin exit probabilities of the nearest-neighbour walk by
  optional sampling (its 2.3), and the invariance principle for random walks (its 1.5). The
  statements here are exact identities for the discrete walk and the discrete arcsine limit; no
  Brownian object enters them.
- MathematicalStatisticsNonparametric 3.5 counts lattice paths of `n` up-steps and `n` down-steps
  that stay in a strip `(−k, k)`, by iterated reflection, for the Gnedenko–Korolyuk formula. That
  is a two-sided statement about paths with a fixed end point; 1.2 is the one-sided statement for
  the free walk. This roadmap does not depend on that one.
- StandardDistributions 10.20 owns the arcsine law as the beta law of parameters `(½, ½)`, and
  excludes the Brownian arcsine theorems; Tau Ceti's `arcsineMeasure` is its formalization, and the
  limit theorem 2.3 is stated with it.
- ElectricalNetworksAndRandomWalks treats reversible random walks
  on finite networks, with effective resistance, escape probabilities and commute times; it
  excludes infinite networks, recurrence and transience, and walks on lattices. Lyons–Peres prove
  Pólya's theorem through effective resistance of infinite networks; the routes here do not use
  networks. This roadmap does not depend on that one.
- BernoulliPercolation defines the nearest-neighbour graph of `ℤ^d`
  as a graph; the walk of 3.1 is defined by its step law and uses no graph. This roadmap does not
  depend on that one.

Outside the scope: the finer theory of walks with general step laws (the Chung–Fuchs theorem, Sparre Andersen's
theorem, Spitzer's identity, the cycle lemma), local limit theorems and the asymptotics of
`P(Sₙ = x)` beyond the one-line consequence of Stirling's formula used in the routes, the
Catalan-number enumeration of paths, Brownian motion, the number of distinct points visited, and
walks on groups other than `ℤ^d`.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/HasLaw.lean`: `ProbabilityTheory.HasLaw X μ P` (`X` is almost everywhere
  measurable for `P` and `P.map X = μ`); `ProbabilityTheory.HasLaw.measure_eq` (for a measurable
  set `{x | p x}`, `P {ω | p (X ω)} = μ {x | p x}`).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun f μ` (mutual
  independence of a family of random variables); `ProbabilityTheory.iIndepFun_iff_map_fun_eq_pi_map`
  (for a finite index type and almost everywhere measurable variables, independence is equality
  of the joint law with the product `Measure.pi` of the laws); `ProbabilityTheory.iIndepFun.precomp`
  (independence passes to a reindexing along an injective map).
- `Mathlib/MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi` (the product measure
  over a finite index type). `Mathlib/MeasureTheory/Measure/Dirac/Def.lean`:
  `MeasureTheory.Measure.dirac`. `Mathlib/Algebra/Notation/Pi/Basic.lean`: `Pi.single` (the
  function equal to a given value at one index and `0` elsewhere).
- `Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`:
  `MeasureTheory.TendstoInDistribution X l Z μ μ'` (for probability measures `μ i` and `μ'`, the
  variables are almost everywhere measurable and the image laws converge weakly).
- `Mathlib/MeasureTheory/Measure/Portmanteau.lean`:
  `IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem` (on a second countable space, if the
  masses of every member of a π-system of measurable sets that contains arbitrarily small
  neighbourhoods of every point converge, the probability measures converge weakly).
  `Mathlib/MeasureTheory/PiSystem.lean`: `isPiSystem_Icc`.
- `Mathlib/Analysis/SpecialFunctions/Stirling.lean`: `Stirling.tendsto_stirlingSeq_sqrt_pi`
  (`n! / (√(2n) (n/e)ⁿ) → √π`).
- `Mathlib/Data/Nat/Choose/Vandermonde.lean`: `Nat.add_choose_eq` (Vandermonde's identity).
- `Mathlib/Probability/Kernel/Basic.lean`: `ProbabilityTheory.Kernel.ofFunOfCountable` (a kernel
  from a countable measurable space with measurable singletons, given by any function to
  measures). `Mathlib/Probability/Process/HittingTime.lean`: `MeasureTheory.hittingAfter u s n`
  (the first time at least `n` at which `u` is in `s`, in `WithTop`, and `⊤` if there is none).

### From Tau Ceti

- `TauCeti/Probability/Distributions/Rademacher/Basic.lean`:
  `TauCeti.Probability.rademacherMeasure` (the law on `ℝ` with mass `1/2` at `−1` and at `1`),
  compared with `signLaw` in 1.1. `TauCeti/Probability/MarkovChain/Simulation.lean`:
  `TauCeti.Probability.hasLaw_randomizedChain` (a chain driven by independent measurable noise
  with a common law has the path law `markovChainLaw`), named in the route of 3.2.
- `TauCeti/Data/Nat/Choose/Central.lean`: `Nat.centralBinom_mul_sqrt_le_four_pow`
  (`C(2n, n) · √(2n + 1) ≤ 4ⁿ` in `ℝ`).
- `TauCeti/Probability/Distributions/Arcsine/Basic.lean`: `TauCeti.Probability.arcsineMeasure`
  (the beta law `betaMeasure (1/2) (1/2)` on `ℝ`) and its instance `IsProbabilityMeasure`.
  `TauCeti/Probability/Distributions/Arcsine/Cdf.lean`: `TauCeti.Probability.cdf_arcsineMeasure_eq`
  (`cdf arcsineMeasure x = 2/π · arcsin (√x)` for every real `x`).
- `TauCeti/Probability/Process/MarkovChain.lean`: `TauCeti.Probability.markovChainLaw ν κ` (the
  path law on `ℕ → α` of the chain with initial measure `ν` and Markov kernel `κ`);
  `TauCeti.Probability.hasLaw_markovChainLaw_iff_prefixLaw_singleton` (on a countable space with
  measurable singletons, a coordinatewise almost everywhere measurable process has path law
  `markovChainLaw ν κ` exactly when every finite path has the product mass
  `ν {w 0} · ∏ κ (w i) {w (i + 1)}`); `ProbabilityTheory.HasLaw.eval_markovChainLaw` (the time-`n`
  law is `(κ ^ n) ∘ₘ ν`).
- `TauCeti/Probability/MarkovChain/Visits.lean`, for a Markov kernel on a measurable space with
  measurable singletons: `ProbabilityTheory.Kernel.tsum_pow_apply_singleton_self_eq_top_iff`
  (`∑ₙ (κ ^ n) y {y} = ∞` exactly when the chain started at `y` returns to `y` at a positive time
  with probability one); `ProbabilityTheory.Kernel.ae_infinite_setOf_eq_markovChainLaw_dirac`
  (under return with probability one, the chain started at `y` is at `y` at infinitely many times
  almost surely).

## References

- R. Durrett, *Probability: Theory and Examples*, fifth edition, Cambridge University Press, 2019;
  the version of 11 January 2019 made available on the author's page. Section 4.9: (4.9.1),
  Theorem 4.9.1, Theorem 4.9.2, Lemma 4.9.3, Lemma 4.9.4, Theorems 4.9.5 and 4.9.6 and their
  proofs, pp. 262–267. Section 5.4: Example 5.4.2, Theorems 5.4.3 and 5.4.4 and their proofs,
  pp. 288–290.
- R. Lyons and Y. Peres, *Probability on Trees and Networks*, Cambridge University Press, 2016;
  the corrected and updated edition on the first author's site,
  §2.5, Pólya's Theorem (first part), p. 38, and (second part), p. 41.
- G. Pólya, Über eine Aufgabe der Wahrscheinlichkeitsrechnung betreffend die Irrfahrt im
  Straßennetz, *Mathematische Annalen* 84 (1921), 149–160; named as Durrett and Lyons–Peres
  attribute the theorem, not consulted.

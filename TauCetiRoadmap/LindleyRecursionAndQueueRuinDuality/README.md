# Roadmap: Lindley recursion and queue–ruin duality

**Summary.** In a single-server queue served in order of arrival, let `Bₙ` be the service time of
the `n`-th customer and `Aₙ` the time between the arrivals of the `n`-th and the `(n + 1)`-st. The
waiting times satisfy Lindley's recursion `Wₙ₊₁ = max(Wₙ + ξₙ, 0)` with `ξₙ = Bₙ − Aₙ`. This
roadmap develops the recursion for an arbitrary real sequence `ξ`, then for random increments, and
connects the waiting time to the maximum of the random walk `Sₙ = ξ₀ + ⋯ + ξₙ₋₁` and to the ruin
probability of that walk. Its main results are the following.

- *Lindley's identity and the running maximum.* For every real sequence and `W₀ = w ≥ 0`,
  `Wₙ = max(w + Sₙ, max_{0 ≤ k ≤ n} (ξₖ + ⋯ + ξₙ₋₁))`, and `W` is the unique solution of the
  discrete reflection (Skorokhod) problem for `w + S`. If the increments are measurable and the
  law of `(ξ₀, …, ξₙ₋₁)` is invariant under permutations, in particular for independent,
  identically distributed increments, the
  waiting time `Wₙ` started at `0` has the law of `max_{0 ≤ k ≤ n} Sₖ`; no moment is needed.
- *Queue–ruin duality.* For exchangeable measurable increments, a queue started empty and every
  real `u`, `P(Wₙ > u)` is
  nondecreasing in `n` and tends to the ruin probability `P(Sₙ > u for some n ≥ 0)` of the walk
  from capital `u`. For measurable, independent, identically distributed increments of negative
  mean the same limit holds for every measurable initial waiting time `W₀ ≥ 0`, with any dependence on the
  increments.
- *The stationary law.* For measurable, independent, identically distributed increments of
  negative mean the
  transition kernel of the recursion has exactly one invariant probability measure, and its tail
  at `u` is the ruin probability from capital `u`. For positive mean it has none, and `P(Wₙ > u)`
  tends to `1` for every `u`.
- *The M/M/1 queue.* For exponential service of rate `μ`, independent exponential interarrival
  times of rate `λ` and `0 < λ < μ`, the stationary waiting time has an atom `1 − λ/μ` at `0` and
  the tail `(λ/μ) exp (−(μ − λ) u)` for `u ≥ 0`.

It builds on RuinTheory, whose ruin probability is the limit in the duality and whose net-profit
dichotomy, Lundberg inequality and exponential-claims formula become, through the duality,
statements about waiting times; on Tau Ceti's exchangeable sequences; and on Mathlib's strong law,
independence, Markov kernels and the exponential law. It sits beside QueueingModels, which treats
finite birth–death queues, and RandomWalkFluctuationTheory, which treats the simple random walk.

Layer 1 below studies the recursion on real sequences, with no probability. Layer 2 proves the
equality in law with the running maximum, the duality and the forgetting of the initial waiting
time. Layer 3 defines the transition kernel and proves existence, uniqueness and absence of a
stationary law. Layer 4 computes the M/M/1 stationary law.

## Conventions

- **Increments and the walk.** In Layer 1 the increments are a real sequence `ξ : ℕ → ℝ`; in
  Layers 2 and 3 they are real random variables `ξ i : Ω → ℝ` on a measurable space `Ω` with a
  measure `P`. The walk at time `n` is `Sₙ = ∑ i ∈ Finset.range n, ξ i`, written out in every
  statement, so `S₀ = 0` and `ξ i` moves the walk from time `i` to time `i + 1`.
- **The recursion.** `lindley w ξ 0 = w` and `lindley w ξ (n + 1) = max (lindley w ξ n + ξ n) 0`.
  In the queueing reading `ξ n = B n − A n` with `A n` the time between the arrivals of customers
  `n` and `n + 1`, as in Adan–Resing, equation (7.10), p. 68; Durrett, Example 5.8.3, p. 323,
  indexes the same recursion as `Wₙ = (Wₙ₋₁ + ξₙ)⁺`, so his `ξₙ₊₁` is `ξ n` here.
- **Maxima.** The running maximum up to time `n` is a maximum over the finite set `0 ≤ k ≤ n`,
  Mathlib's `Finset.sup'` over `Finset.range (n + 1)`. The supremum `M = sup_{n ≥ 0} Sₙ` of the
  whole walk, a value in `[0, ∞]`, enters only through the events `{M > u} = {∃ n, u < Sₙ}`; no
  statement takes a real supremum of a family that may be unbounded.
- **Ruin.** Ruin from capital `u ∈ ℝ` is the event `∃ n, u < Sₙ` with `n ≥ 0` ranging over all
  times: the horizon is infinite, the inequality strict, and for `u < 0` the time `n = 0` gives
  ruin. Its probability is RuinTheory's `ruinProb P ξ u`, copied in 2.2, a value in `ℝ≥0∞`; it is
  `P(M > u)`, not `P(M ≥ u)`. Waiting-time events are strict in the same way: `{u < Wₙ}`.
- **Exchangeability and independence.** Exchangeability is Tau Ceti's `ExchangeableAt P ξ n` (the
  law of `(ξ 0, …, ξ (n − 1))` is invariant under every permutation of `Fin n`) and
  `Exchangeable P ξ` (this at every `n`). Independent, identically distributed increments are
  `iIndepFun ξ P` with `IdentDistrib (ξ i) (ξ 0) P P` for every `i`; independence forces `P` to be
  a probability measure (Mathlib's `iIndepFun.isProbabilityMeasure`), and Tau Ceti's
  `Exchangeable.of_iIndepFun_identDistrib` makes such a sequence exchangeable.
- **Means.** `∫ ω, ξ 0 ω ∂P` is a Bochner integral, `0` for a non-integrable increment, so a
  strict sign of the mean contains integrability. The zero-mean case is outside this roadmap.
- **The kernel and invariance.** For a measure `m` on `ℝ`, `lindleyKernel m` is the Markov kernel
  that sends `x` to the law of `max (x + Y) 0` with `Y` of law `m`. A measure `ν` is invariant
  when `ν.bind (lindleyKernel m) = ν`, Mathlib's `Kernel.Invariant`.
- **Exponential laws.** `expMeasure r` is Mathlib's exponential law of rate `r` and mean `1/r`; for
  `r ≤ 0` it is the zero measure.

## Layer 1: the recursion on real sequences

### 1.1 The recursion

Define `lindley (w : ℝ) (ξ : ℕ → ℝ) : ℕ → ℝ` by recursion on `n` as in the Conventions (Adan–Resing,
§7.5, equation (7.10), p. 68, where the recursion is called Lindley's equation; Durrett,
Example 5.8.3, p. 323).

- `lindley w ξ n ≥ 0` for `n ≥ 1`, and for `n = 0` when `w ≥ 0`.
- `lindley w ξ n` is nondecreasing in `w` and `lindley w ξ n ≥ w + Sₙ`, both by induction on `n`.

### 1.2 Lindley's pathwise identity

Prove `lindley_eq_max_sup'`: for `w ≥ 0`, a real sequence `ξ` and every `n`,
`lindley w ξ n = max (w + ∑ i ∈ range n, ξ i) ((range (n + 1)).sup' _ fun k ↦ ∑ i ∈ Ico k n, ξ i)`,
the empty sum at `k = n` being `0`. The second term is `lindley 0 ξ n`, so equivalently
`lindley w ξ n = max (w + Sₙ) (lindley 0 ξ n)`; and since `∑ i ∈ Ico k n, ξ i = Sₙ − Sₖ`, it is
`Sₙ − min_{k ≤ n} Sₖ`. Reindexing `i = n − 1 − j` turns it into the running maximum of the reversed
increments: `max_{0 ≤ m ≤ n} ∑ j ∈ range m, ξ (n − 1 − j)` (Durrett, Exercise 5.8.6 (i)–(ii),
p. 330, for `w = 0`; proved here for every `w ≥ 0`).

Route. Write `Tₙ` for the maximum over `k ≤ n` of `∑ i ∈ Ico k n, ξ i`. For `k ≤ n` the sum over
`Ico k (n + 1)` is the sum over `Ico k n` plus `ξ n`, and the term `k = n + 1` is `0`, so
`Tₙ₊₁ = max (Tₙ + ξ n) 0`. Induction on `n`: at `n = 0` both sides are `max w 0 = w` because
`w ≥ 0`. If `lindley w ξ n = max (w + Sₙ) Tₙ`, then
`lindley w ξ (n + 1) = max (max (w + Sₙ) Tₙ + ξ n) 0 = max (w + Sₙ₊₁) (max (Tₙ + ξ n) 0)`, which is
`max (w + Sₙ₊₁) Tₙ₊₁` (Mathlib `Finset.sum_Ico_succ_top`, `Finset.sup'` over `range (n + 2)` split
at its last point, `max_add_add_right`). The same recursion for `T` shows `Tₙ = lindley 0 ξ n`.
The reflected form is `Finset.sum_Ico_eq_sum_range` and `Finset.sum_range_reflect`.

**Checks.**
- For `ξ = (1, −2, 2)` and `w = 0` the recursion gives `0, 1, 0, 2`; the sums over `Ico k 3` for
  `k = 0, 1, 2, 3` are `1, 0, 2, 0`, with maximum `2`. For `w = 1` it gives `1, 2, 0, 2`, and
  `max (1 + 1) 2 = 2`.
- `w ≥ 0` is needed: for `w = −1` and `n = 0` the left side is `−1` and the right side `0`.
- The identity uses the sums ending at time `n`, not the walk itself: for `ξ = (1, −1)` the
  waiting time at time `2` is `0` while `max (S₀, S₁, S₂) = 1`. The two agree only in law (2.1).

*Needs:* 1.1; Mathlib `Finset.sum_Ico_succ_top`, `Finset.sup'`, `Finset.sum_Ico_eq_sum_range`,
`Finset.sum_range_reflect`. (Proved here.)

### 1.3 The discrete Skorokhod problem

Prove `lindley_solves_skorokhod_and_unique`: let `w ≥ 0`, let `ξ` be a real sequence and put
`xₙ = w + Sₙ`. Then (a) `lindley w ξ` is nonnegative, and the regulator
`lₙ = lindley w ξ n − xₙ` is nondecreasing and increases only at zeros of the recursion: if
`lₙ < lₙ₊₁` then `lindley w ξ (n + 1) = 0`; (b) if `z, l : ℕ → ℝ` satisfy `zₙ = xₙ + lₙ`,
`zₙ ≥ 0`, `l₀ = 0`, `l` nondecreasing, and `lₙ < lₙ₊₁` only when `zₙ₊₁ = 0`, then
`z = lindley w ξ`. By 1.2 the regulator is `lₙ = max 0 (max_{k ≤ n} (−xₖ))`. (Proved here.)

Route. (a) Nonnegativity is the `max` with `0`, and `w ≥ 0` at `n = 0`. With
`y = lindley w ξ n + ξ n`, `lₙ₊₁ − lₙ = max y 0 − y = max (−y) 0 ≥ 0`, which is positive only when
`y < 0`, and then `lindley w ξ (n + 1) = max y 0 = 0`. (b) Induction on `n`: `z₀ = w + l₀ = w`.
If `zₙ = lindley w ξ n`, put `y = zₙ + ξ n` and `Δ = lₙ₊₁ − lₙ ≥ 0`, so `zₙ₊₁ = y + Δ ≥ 0`. If
`Δ = 0` then `zₙ₊₁ = y ≥ 0`, so `zₙ₊₁ = max y 0`. If `Δ > 0` then `zₙ₊₁ = 0`, so `y = −Δ < 0` and
`max y 0 = 0 = zₙ₊₁`. In both cases `zₙ₊₁ = lindley w ξ (n + 1)`.

**Checks.**
- The complementarity condition is needed in (b): for `ξ = 0` and `w = 0`, `zₙ = lₙ = n` meets
  every other condition, while `lindley 0 0 n = 0`.
- `l₀ = 0` is needed: for `ξ = 0`, `w = 0`, `zₙ = lₙ = 1` meets every other condition.
- For `ξ = (1, −2, 2)` and `w = 0` the walk is `0, 1, −1, 1`, the recursion `0, 1, 0, 2`, and the
  regulator `0, 0, 1, 1`: it moves once, at time `2`, where the recursion is `0`.

*Needs:* 1.1; 1.2 (for the formula for the regulator only). (Proved here.)

### Examples

For `ξ ≥ 0` the recursion started at `w ≥ 0` is `w + Sₙ` and the regulator is `0`; for `ξ ≤ 0` the
recursion started at `0` stays at `0`; for a constant `ξ = c < 0` started at `w ≥ 0` it is
`max (w + n c) 0`.

### Dependencies

Mathlib `Finset.sup'`, `Finset.sum_Ico_succ_top`, `Finset.sum_Ico_eq_sum_range`,
`Finset.sum_range_reflect`. No other roadmap.

## Layer 2: waiting times and the maximum of the walk

Throughout, `Wₙ(w)` is `fun ω ↦ lindley w (fun i ↦ ξ i ω) n`, and `Wₙ` is `Wₙ(0)`.

### 2.1 The waiting time has the law of the running maximum

Prove `identDistrib_lindley_sup'`: if every `ξ i` is measurable and `ExchangeableAt P ξ n`, then
`Wₙ` and `fun ω ↦ (range (n + 1)).sup' _ fun k ↦ ∑ i ∈ range k, ξ i ω` are identically distributed
(Mathlib's `IdentDistrib`). In particular this holds for independent, identically distributed
increments, with no moment hypothesis (Durrett, Exercise 5.8.6 (i)–(ii), p. 330, for i.i.d.
increments; Kevei, §11.2, p. 74, uses the reversal of an i.i.d. vector; proved here for an
exchangeable vector).

Route. Let `V ω = (ξ 0 ω, …, ξ (n − 1) ω)` and `R ω = (ξ (n − 1) ω, …, ξ 0 ω)`, maps into
`Fin n → ℝ`. `ExchangeableAt P ξ n` applied to the reversal `Fin.revPerm` says that `R` and `V`
have the same law (Tau Ceti `blockLaw`, `prefixLaw`); both are measurable, so they are identically
distributed. Let `g v` be the maximum over `0 ≤ m ≤ n` of the sum of the first `m` coordinates of
`v : Fin n → ℝ`; it is continuous, hence measurable. Then `g ∘ V` is the running
maximum of the walk, and by 1.2 with `w = 0` in its reflected form `g ∘ R = Wₙ`. Mathlib
`IdentDistrib.comp` gives the claim.

**Checks.**
- Exchangeable but not independent: if `(ξ 0, …, ξ 4)` is a uniformly random ordering of
  `(−2, −1, 0, 1, 3)`, then `P(W₅ > 1) = P(max_{k ≤ 5} Sₖ > 1) = 5/8` and
  `P(W₅ > 2) = P(max_{k ≤ 5} Sₖ > 2) = 11/24`.
- Exchangeability is needed: for the deterministic increments `ξ 0 = 1`, `ξ 1 = −1`, `W₂ = 0` and
  `max (S₀, S₁, S₂) = 1`.
- For `n = 0` both sides are `0`.

*Needs:* 1.2; Tau Ceti `TauCeti.Probability.ExchangeableAt`, `TauCeti.Probability.blockLaw`,
`TauCeti.Probability.prefixLaw`; Mathlib `Fin.revPerm`, `ProbabilityTheory.IdentDistrib.comp`.

### 2.2 Queue–ruin duality

Copy `ruinProb` verbatim from RuinTheory 1.1:
`ruinProb P Y u = P {ω | ∃ n, u < ∑ i ∈ range n, Y i ω}`.

Prove `measure_lt_lindley_tendsto_ruinProb`: if every `ξ i` is measurable and `Exchangeable P ξ`,
then for every real `u`: (a) `P {u < Wₙ} = P {∃ k ≤ n, u < Sₖ}`, the ruin probability by time `n`;
(b) `n ↦ P {u < Wₙ}` is nondecreasing; (c) `P {u < Wₙ} → ruinProb P ξ u` as `n → ∞` (Durrett,
Exercise 5.8.6 (iii), p. 330, convergence in law of `Wₙ` to `M`; Kevei, §11.1, p. 72, identifies
the ruin probability with `P(M > u)`; proved here).

Route. (a) By 2.1 and Mathlib `IdentDistrib.measure_mem_eq` on the measurable set `Ioi u`, then
`Finset.lt_sup'_iff`. (b) The events `{∃ k ≤ n, u < Sₖ}` increase with `n`. (c) Their union is
`{∃ k, u < Sₖ}`, so Mathlib `tendsto_measure_iUnion_atTop` gives the limit.

**Checks.**
- For the `±1` walk with up-probability `1/3`, `P(W₈ > 0) = 1003/2187`, below the ruin probability
  `ruinProb P ξ 0 = 1/2`; for `u < 0` both sides of (a) are `1`.
- Strict against weak: for `ξ = 0`, `P(Wₙ ≥ 0) = 1` for every `n`, while `ruinProb P ξ 0 = 0`.
  The strict waiting-time event matches the strict ruin event.
- For `ξ ≥ 0` almost surely, `Wₙ = Sₙ = max_{k ≤ n} Sₖ`, and (a) is an equality of events.

*Needs:* 2.1; RuinTheory 1.1 (`ruinProb`, copied); Mathlib
`ProbabilityTheory.IdentDistrib.measure_mem_eq`, `Finset.lt_sup'_iff`,
`MeasureTheory.tendsto_measure_iUnion_atTop`.

### 2.3 Forgetting the initial waiting time

Prove `tendsto_measure_lt_lindley_of_integral_neg`: let the increments be measurable,
independent and identically distributed with `∫ ξ 0 dP < 0`, and let `W₀ : Ω → ℝ` be measurable
with `W₀ ≥ 0` almost surely, with any dependence on the increments. Then for every real `u`,
`P {ω | u < lindley (W₀ ω) (fun i ↦ ξ i ω) n} → ruinProb P ξ u`. (Proved here.)

Route. `P` is a probability measure (Mathlib `iIndepFun.isProbabilityMeasure`), and the
increments are exchangeable (Tau Ceti `Exchangeable.of_iIndepFun_identDistrib`). Put
`Aₙ = {u < Wₙ(W₀)}`, `Bₙ = {u < Wₙ}` and `Cₙ = {0 < W₀ + Sₙ}`, all measurable. Where `W₀ ≥ 0`,
1.2 gives `Wₙ(W₀) = max (W₀ + Sₙ) Wₙ` with `Wₙ ≥ 0`; so `Bₙ ⊆ Aₙ`, and a point of `Aₙ` outside
`Bₙ` has `W₀ + Sₙ > u ≥ Wₙ ≥ 0`, so it lies in `Cₙ`. Hence, almost everywhere,
`Bₙ ⊆ Aₙ ⊆ Bₙ ∪ Cₙ` and `P Bₙ ≤ P Aₙ ≤ P Bₙ + P Cₙ` (Mathlib `measure_mono_ae`,
`measure_union_le`). By 2.2, `P Bₙ → ruinProb P ξ u`. The mean is nonzero, so `ξ 0` is integrable
(Mathlib `Integrable.of_integral_ne_zero`); the increments are pairwise independent
(`iIndepFun.indepFun`); so Mathlib `strong_law_ae` gives `Sₙ/n → ∫ ξ 0 dP < 0` almost surely,
hence `W₀ + Sₙ → −∞` almost surely and almost every point lies in only finitely many `Cₙ`. Mathlib
`tendsto_measure_of_ae_tendsto_indicator_of_isFiniteMeasure` with limit set `∅` gives
`P Cₙ → 0`. The squeeze in `ℝ≥0∞` gives the claim.

**Checks.**
- For `ξ = −1` and `W₀ = 5`, `Wₙ(5) = max (5 − n) 0`, which is `0` from `n = 5` on, and
  `ruinProb P ξ u = 0` for `u ≥ 0`.
- A hypothesis on the mean is needed: for `ξ = 0` and `W₀ = 1`, `Wₙ(1) = 1` for every `n`, so
  `P {0 < Wₙ(1)} = 1`, while `ruinProb P ξ 0 = 0`. Positive mean is treated in 3.4.

*Needs:* 1.2; 2.2; Tau Ceti `TauCeti.Probability.Exchangeable.of_iIndepFun_identDistrib`;
Mathlib `ProbabilityTheory.iIndepFun.isProbabilityMeasure`,
`MeasureTheory.Integrable.of_integral_ne_zero`, `ProbabilityTheory.iIndepFun.indepFun`,
`ProbabilityTheory.strong_law_ae`, `MeasureTheory.measure_mono_ae`,
`MeasureTheory.measure_union_le`,
`MeasureTheory.tendsto_measure_of_ae_tendsto_indicator_of_isFiniteMeasure`.

### Examples

The `±1` walk with up-probability `p < 1/2`, where `P(Wₙ > u)` increases to
`(p/q)^(⌊u⌋ + 1)` for `u ≥ 0` (RuinTheory 1.1, Checks); the walk with steps `−1, 0, +2` of
probabilities `1/2, 1/3, 1/6`, where `P(W₈ > 0) = 860033/1679616` lies below the limit `2/3`.

### Dependencies

Layer 1; RuinTheory 1.1 (`ruinProb`); Tau Ceti `ExchangeableAt`, `Exchangeable`,
`Exchangeable.of_iIndepFun_identDistrib`, `blockLaw`, `prefixLaw`; Mathlib `IdentDistrib`,
`Fin.revPerm`, `strong_law_ae`, `tendsto_measure_iUnion_atTop`,
`tendsto_measure_of_ae_tendsto_indicator_of_isFiniteMeasure`.

## Layer 3: the stationary law

### 3.1 The transition kernel

Define `lindleyKernel (m : Measure ℝ) : Kernel ℝ ℝ` as the image of
`Kernel.deterministic id ×ₖ Kernel.const ℝ m` under `fun p ↦ max (p.1 + p.2) 0`.

- For an s-finite `m`, `lindleyKernel m x = m.map (fun y ↦ max (x + y) 0)` (Mathlib
  `Kernel.map_apply`, `Kernel.prod_apply`, `Kernel.deterministic_apply`, `Kernel.const_apply`,
  `Measure.dirac_prod`, `Measure.map_map`); for a probability measure `m` it is a Markov kernel.
- Every `lindleyKernel m x` is carried by `[0, ∞)`, so an invariant probability measure `ν` has
  `ν (Iio 0) = (ν.bind (lindleyKernel m)) (Iio 0) = 0`.
- For an s-finite `ν` and a probability measure `m`, `ν.bind (lindleyKernel m)` is the image of
  `ν.prod m` under `fun p ↦ max (p.1 + p.2) 0` (Mathlib `Measure.bind_apply`, `Measure.prod_apply`
  and the first bullet, evaluated on measurable sets). Call this identity (★).

**Checks.**
- For `m` the law of the `±1` step with up-probability `p = 1/3`, the geometric law
  `π {k} = (1/2)^(k + 1)` on `ℕ` is invariant: `π {0} = q (π {0} + π {1})` and
  `π {j} = q π {j + 1} + p π {j − 1}` for `j ≥ 1`, with `q = 2/3`.
- The reflection matters: the translation kernel `x ↦ law of x + Y` has no invariant probability
  measure for `Y = −1`, while `lindleyKernel (dirac (−1))` has `dirac 0`.

*Needs:* Mathlib `ProbabilityTheory.Kernel.deterministic`, `ProbabilityTheory.Kernel.const`,
`ProbabilityTheory.Kernel.prod`, `ProbabilityTheory.Kernel.map`,
`ProbabilityTheory.Kernel.Invariant`, the lemmas named in the bullets.

### 3.2 Started from an invariant law, the waiting time keeps it

Prove `hasLaw_lindley_of_invariant`: let the increments be measurable, independent and identically
distributed, let `ν` be invariant for `lindleyKernel (P.map (ξ 0))`, and let `W₀` have law `ν`
(Mathlib `HasLaw W₀ ν P`) and be independent of the whole sequence `fun ω i ↦ ξ i ω`. Then
`Wₙ(W₀)` has law `ν` for every `n`. (Proved here.)

Route. `P` is a probability measure, so `ν` is one. By Mathlib
`indepFun_iff_map_prod_eq_prod_map_map` the pair `(W₀, ξ)` has law `ν ⊗ L`, where `L` is the law
of the sequence, and by `iIndepFun_iff_map_fun_eq_infinitePi_map` `L` is the product
`Measure.infinitePi` of copies of `m = P.map (ξ 0)`. Under this product the coordinates are
independent, so `(W₀, ξ 0, …, ξ (n − 1))` is independent of `ξ n`. `Wₙ(W₀)` is a measurable
function of the former, so `(Wₙ(W₀), ξ n)` has law `(law of Wₙ(W₀)) ⊗ m`. Induction on `n`: the law
at `n = 0` is `ν`; if it is `ν` at `n`, then `Wₙ₊₁(W₀) = max (Wₙ(W₀) + ξ n) 0` has law the image of
`ν.prod m` under `fun p ↦ max (p.1 + p.2) 0`, which is `ν.bind (lindleyKernel m) = ν` by (★) and
invariance.

**Checks.**
- Independence of `W₀` is needed: for the `±1` walk with up-probability `1/3` and
  `ν {k} = (1/2)^(k + 1)`, take `W₀` of law `ν` with `ξ 0 = −1` exactly when `W₀ ≥ 1`. Such a pair
  exists: `P(W₀ ≥ 1) = 1/2 ≤ 2/3 = P(ξ 0 = −1)`. Then `W₁ = W₀ − 1` on `{W₀ ≥ 1}`, so
  `P(W₁ = 0) = P(W₀ = 1) + P(W₀ = 0, ξ 0 = −1) = 1/4 + 1/6 = 5/12`, while `ν {0} = 1/2`.

*Needs:* 3.1 (identity (★)); Mathlib `ProbabilityTheory.HasLaw`,
`ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map`,
`ProbabilityTheory.iIndepFun_iff_map_fun_eq_infinitePi_map`,
`MeasureTheory.Measure.infinitePi`, `ProbabilityTheory.iIndepFun_infinitePi`.

### 3.3 The stationary law for negative drift

Prove `invariant_lindleyKernel_of_integral_neg`: for measurable, independent, identically
distributed increments with `∫ ξ 0 dP < 0`, there is a probability measure `π` on `ℝ`, invariant
for `lindleyKernel (P.map (ξ 0))`, with `π (Ioi u) = ruinProb P ξ u` for every real `u`, and every
invariant probability measure equals `π` (Adan–Resing, §7.5, equation (7.11), p. 69, for the
limiting form of the recursion; Durrett, §5.8.4, p. 327, for the existence of a stationary
distribution when the mean is negative; uniqueness and the tail are proved here).

Route. Existence. As in 2.3, `Sₙ → −∞` on a set `G` of full measure. Let
`Mω = ⨆ n, Sₙ ω` in `ℝ`, measurable by Mathlib `Measurable.iSup`; on `G` the family is bounded
above, so `u < Mω ↔ ∃ n, u < Sₙ ω` (Mathlib `lt_ciSup_iff`). Let `π = P.map M`, a probability
measure; then `π (Ioi u) = ruinProb P ξ u` because the two events agree on `G` (Mathlib
`measure_congr`). Let `M′ω = ⨆ n, ∑ i ∈ range n, ξ (i + 1) ω`. On `G`, splitting off `n = 0`,
`M = max (ξ 0 + M′) 0`. The increment `ξ 0` is independent of the shifted sequence
`(ξ (i + 1))ᵢ` (Mathlib `indep_iSup_of_disjoint`), which has the law of `ξ` (both laws are the
product of copies of `m = P.map (ξ 0)` by `iIndepFun_iff_map_fun_eq_infinitePi_map`); so `M′` has
law `π` and `(M′, ξ 0)` has law `π ⊗ m`. Hence `π` is the image of `π.prod m` under
`fun p ↦ max (p.1 + p.2) 0`, which is `π.bind (lindleyKernel m)` by (★).

Uniqueness. Let `ν` be an invariant probability measure. On `Ω′ = ℝ × Ω` with `P′ = ν.prod P` put
`W₀′ (x, ω) = x` and `ξ′ i (x, ω) = ξ i ω`. Since `P′.map Prod.snd = P` (Mathlib
`Measure.map_snd_prod`), `Measure.map_map` gives
`P′.map (fun p i ↦ ξ′ i p) = P.map (fun ω i ↦ ξ i ω)` and `P′.map (ξ′ i) = P.map (ξ i)`; so the `ξ′ i` are measurable and identically distributed with
the law and the mean of `ξ i`, and they are independent by
`iIndepFun_iff_map_fun_eq_infinitePi_map` applied in both directions (`P′` is a probability
measure); `ruinProb P′ ξ′ u = ruinProb P ξ u`, and under the product measure
`W₀′` has law `ν` (`Measure.map_fst_prod`) and is independent of `ξ′` (the law of
`(W₀′, ξ′)` is `ν.prod (P.map (fun ω i ↦ ξ i ω))` by `Measure.map_prod_map`, then
`indepFun_iff_map_prod_eq_prod_map_map`). By 3.2 every `Wₙ(W₀′)`
has law `ν`, so `P′ {u < Wₙ(W₀′)} = ν (Ioi u)` for every `n`. By 3.1, `W₀′ ≥ 0` almost surely, so
2.3 gives `P′ {u < Wₙ(W₀′)} → ruinProb P ξ u`. Hence `ν (Ioi u) = π (Ioi u)` for every `u`,
so `ν (Iic u) = π (Iic u)` (Mathlib `prob_compl_eq_one_sub`) and `ν = π` (Mathlib
`Measure.ext_of_Iic`).

**Checks.**
- For the `±1` walk with up-probability `1/3`, `π {k} = (1/2)^(k + 1)` and
  `π (Ioi u) = (1/2)^(⌊u⌋ + 1) = ruinProb P ξ u` for `u ≥ 0`; the weak event `∃ n, 1 ≤ Sₙ` has
  probability `1/2`, while `π (Ioi 1) = 1/4`.
- For steps `−1, 0, +2` with probabilities `1/2, 1/3, 1/6` (mean `−1/6`), the invariant law on `ℕ`
  solves `π {0} = (1/2)(π {0} + π {1}) + (1/3) π {0}` and
  `π {j} = (1/2) π {j + 1} + (1/3) π {j} + (1/6) π {j − 2}` for `j ≥ 1` (with `π {−1} = 0`); it is
  `π {j} = C₁ r₁^j + C₂ r₂^j` for `j ≥ 1` with `r = (1 ± √13)/6`, and `π {0} = 1/3`,
  `π {1} = 1/9`, `π {2} = 4/27`, `π {3} = 7/81`. The ruin probabilities, solved independently from
  the first-step equation `g(k) = (1/2) g(k + 1) + (1/3) g(k) + (1/6) g(k − 2)` with `g = 1` on
  `k ≤ 0` and `g → 0`, are `P(∃ n, Sₙ ≥ k) = 2/3, 5/9, 11/27, 26/81` for `k = 1, 2, 3, 4`, equal
  to `π (Ioi (k − 1))`.
- For `ξ = −1`, `π = dirac 0`.

*Needs:* 1.2; 2.3; 3.1; 3.2; RuinTheory 1.1 (`ruinProb`, copied); Mathlib `Measurable.iSup`,
`lt_ciSup_iff`, `MeasureTheory.measure_congr`, `ProbabilityTheory.indep_iSup_of_disjoint`,
`ProbabilityTheory.iIndepFun_iff_map_fun_eq_infinitePi_map`, `ProbabilityTheory.strong_law_ae`,
`MeasureTheory.Measure.map_fst_prod`, `MeasureTheory.Measure.map_snd_prod`,
`MeasureTheory.Measure.map_map`, `MeasureTheory.Measure.map_prod_map`,
`ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map`,
`MeasureTheory.prob_compl_eq_one_sub`, `MeasureTheory.Measure.ext_of_Iic`.

### 3.4 Positive drift

Prove `not_exists_invariant_lindleyKernel_of_integral_pos`: for measurable, independent,
identically distributed increments with `0 < ∫ ξ 0 dP`, (a) `lindleyKernel (P.map (ξ 0))` has no
invariant probability measure, and (b) for every `W₀ : Ω → ℝ` with `W₀ ≥ 0` almost surely and
every real `u`, `P {u < Wₙ(W₀)} → 1` (Durrett, Exercise 5.8.5, p. 330, states transience for
positive mean; proved here).

Route. (b) Where `W₀ ≥ 0`, 1.2 gives `Wₙ(W₀) ≥ Wₙ`, so `P {u < Wₙ} ≤ P {u < Wₙ(W₀)} ≤ 1`
(`measure_mono_ae`, `prob_le_one`); by 2.2 and RuinTheory 1.3
`TauCetiRoadmap.RuinTheory.ruinProb_eq_one`, `P {u < Wₙ}` tends to `ruinProb P ξ u = 1`. No
measurability of `W₀` is used. (a) If `ν` were an invariant probability measure, the construction of
the uniqueness part of 3.3 (with 3.1 and 3.2) on `Ω′ = ℝ × Ω` would give
`ν (Ioi u) = P′ {u < Wₙ(W₀′)}` for every `n`, which tends to `1` by (b) applied on `Ω′`. So
`ν (Ioi u) = 1` for every `u`, while `ν (Ioi k) → ν ∅ = 0` as `k → ∞` (Mathlib
`tendsto_measure_iInter_atTop`).

**Checks.**
- For the `±1` walk with up-probability `2/3`, `P(W₈ > 0) = 2006/2187` and
  `P(W₈ > 2) = 152/243`, increasing in `n` to `1`.
- For `ξ = 1`, `lindleyKernel (dirac 1)` moves every point of `[0, ∞)` up by `1`. An invariant
  probability measure `ν` would be carried by `[0, ∞)` (3.1), and invariance would give
  `ν [0, 1) = ν [−1, 0) = 0` and `ν [k + 1, k + 2) = ν [k, k + 1)` for `k ≥ 0`, so `ν = 0`.

*Needs:* 1.2; 2.2; 3.1; 3.2; RuinTheory 1.3 (`TauCetiRoadmap.RuinTheory.ruinProb_eq_one`); Mathlib
`MeasureTheory.measure_mono_ae`, `MeasureTheory.prob_le_one`,
`MeasureTheory.tendsto_measure_iInter_atTop`, and the inputs of the uniqueness part of 3.3.

### Examples

- *Atom at zero.* Under the hypotheses of 3.3, `π {0} = 1 − ruinProb P ξ 0`, because `π` is carried
  by `[0, ∞)` and `π (Ioi 0) = ruinProb P ξ 0`; by RuinTheory 1.3
  (`TauCetiRoadmap.RuinTheory.ruinProb_lt_one_and_tendsto_zero`) it is positive.
- *Exponential tail.* If moreover `R ≥ 0`, `exp (R ξ 0)` is integrable and `E[exp (R ξ 0)] ≤ 1`,
  then `π (Ioi u) ≤ exp (−R u)` and, for the queue started empty, `P(Wₙ > u) ≤ exp (−R u)` for
  every `n` and every real `u`:
  by 2.2 and 3.3, both are at most `ruinProb P ξ u`, which is at most
  `P {∃ n, u ≤ Sₙ} ≤ exp (−R u)` by RuinTheory 3.1 (`measure_exists_le_sum_le_exp`).

### Dependencies

Layers 1 and 2; RuinTheory 1.1 (`ruinProb`), 1.3 (`TauCetiRoadmap.RuinTheory.ruinProb_eq_one`, and
`TauCetiRoadmap.RuinTheory.ruinProb_lt_one_and_tendsto_zero` in Examples), 3.1
(`measure_exists_le_sum_le_exp`, in Examples); Mathlib kernels (`Kernel.deterministic`,
`Kernel.const`, `Kernel.prod`, `Kernel.map`, `Kernel.Invariant`), `Measure.infinitePi`,
`iIndepFun_iff_map_fun_eq_infinitePi_map`, `indep_iSup_of_disjoint`, `Measure.ext_of_Iic`.

## Layer 4: the M/M/1 queue

### 4.1 The M/M/1 stationary law

Prove `invariant_lindleyKernel_mm1_iff`: let `0 < λ < μ` (`lam`, `mu` in Lean), `ρ = λ/μ`, and
let `m` be the image of
`(expMeasure μ).prod (expMeasure λ)` under `fun p ↦ p.1 − p.2`, the law of a service time of rate
`μ` minus an independent interarrival time of rate `λ`. A probability measure `ν` on `ℝ` is
invariant for `lindleyKernel m` if and only if `ν = (1 − ρ) • dirac 0 + ρ • expMeasure (μ − λ)`,
the coefficients taken in `ℝ≥0∞` through `ENNReal.ofReal`. This law has an atom `1 − ρ` at `0`
and `ν (Ioi u) = ρ exp (−(μ − λ) u)` for `u ≥ 0` (Adan–Resing, Example 7.4.1, p. 68; Durrett,
Example 5.8.14, p. 328, for the law of `M` with exponential service; the route here is through
RuinTheory 4.2).

Route. Take `Ω = ℕ → ℝ × ℝ` with `P = Measure.infinitePi` of copies of
`(expMeasure μ).prod (expMeasure λ)` (both factors are probability measures, Mathlib
`isProbabilityMeasure_expMeasure`), `Z i ω = (ω i).1`, `T i ω = (ω i).2` and `ξ i = Z i − T i`. The
pairs are independent and identically distributed (Mathlib `iIndepFun_infinitePi`), `Z 0` and `T 0`
are independent with laws `expMeasure μ` and `expMeasure λ`, so the `ξ i` are measurable,
independent and identically distributed with law `m`, and `∫ ξ 0 dP = 1/μ − 1/λ < 0` (Tau Ceti
`integral_id_expMeasure`, `integrable_pow_expMeasure`). By 3.3, `lindleyKernel m` has a unique
invariant probability measure `π`, with `π (Ioi u) = ruinProb P ξ u`. RuinTheory 4.2
(`TauCetiRoadmap.RuinTheory.ruinProb_eq_of_exponential_claims_and_waiting_times`, with `c = 1`,
`δ = μ`, `lam = λ`, and `1 * T i ω = T i ω`) gives `ruinProb P ξ u = ρ exp (−(μ − λ) u)` for
`u ≥ 0`; for `u < 0` it is `1`. The candidate law `ν₀` is a probability measure (`(1 − ρ) + ρ = 1`)
with the same tails: for `u ≥ 0`, `dirac 0 (Ioi u) = 0` and
`expMeasure (μ − λ) (Ioi u) = exp (−(μ − λ) u)` (Tau Ceti `measure_Ioi_expMeasure`); for `u < 0`
both terms give their full mass. So `ν₀ = π` by `prob_compl_eq_one_sub` and `Measure.ext_of_Iic`,
and `ν` is invariant if and only if `ν = π = ν₀`.

**Checks.**
- For `λ = 1`, `μ = 2`: `ν₀ = (1/2) dirac 0 + (1/2) expMeasure 1`. With `W` of law `ν₀` independent
  of `X = B − A`, `P(W + X > 1) = (1/2) exp (−1)`, which is `ν₀ (Ioi 1)`, as invariance requires at
  `u = 1 ≥ 0` (where `max (W + X) 0 > 1` is `W + X > 1`). The variant with rate `μ` in place of
  `μ − λ`, `(1/2) dirac 0 + (1/2) expMeasure 2`, gives
  `P(W + X > 1) − (1/2) exp (−2) = (5/18) exp (−2)`,
  so it is not invariant.
- `0 < λ` is needed: for `λ = 0`, `expMeasure 0` is the zero measure, so `m = 0`, `lindleyKernel m`
  is the zero kernel and no probability measure is invariant, while the right side is `dirac 0`.
- `λ < μ` is the stability condition. For `λ ≥ μ` the right side is the zero measure
  (`ENNReal.ofReal (1 − ρ) = 0`, and `expMeasure (μ − λ)` has a nonpositive rate, so it is the zero
  measure), not a probability measure; for `λ > μ` the mean `1/μ − 1/λ` is positive and 3.4
  shows that no probability measure is invariant.

*Needs:* 3.3; RuinTheory 4.2
(`TauCetiRoadmap.RuinTheory.ruinProb_eq_of_exponential_claims_and_waiting_times`); Mathlib
`ProbabilityTheory.expMeasure`, `ProbabilityTheory.isProbabilityMeasure_expMeasure`,
`MeasureTheory.Measure.infinitePi`, `ProbabilityTheory.iIndepFun_infinitePi`,
`MeasureTheory.Measure.dirac_apply'`, `MeasureTheory.Measure.ext_of_Iic`; Tau Ceti
`TauCeti.Probability.measure_Ioi_expMeasure`, `TauCeti.Probability.integral_id_expMeasure`,
`TauCeti.Probability.integrable_pow_expMeasure`.

### Examples

For `B` exponential of rate `μ`, `A` exponential of rate `λ`, `0 < λ < μ`, pairs `(Bₙ, Aₙ)`
independent and identically distributed with `B₀` independent of `A₀`, and every measurable
`W₀ ≥ 0`, `P(Wₙ > u) → (λ/μ) exp (−(μ − λ) u)` for `u ≥ 0`: by 2.3 and RuinTheory 4.2. For `λ = 1`,
`μ = 2` this is `(1/2) exp (−u)`, and the waiting time of a customer who finds the queue in
equilibrium is `0` with probability `1/2`.

### Dependencies

Layer 3; RuinTheory 4.2; Mathlib `expMeasure`, `Measure.infinitePi`, `iIndepFun_infinitePi`;
Tau Ceti exponential law (`TauCeti/Probability/Distributions/Exponential/Basic.lean`).

## Scope and ownership

This roadmap owns the targets stated above: the Lindley recursion on real sequences with its
pathwise identity and its characterization through the discrete Skorokhod problem; the equality in
law of the waiting time with the running maximum of an exchangeable walk; the duality between
waiting times and ruin; the forgetting of the initial waiting time for negative drift; the
transition kernel of the recursion, the preservation of an invariant law, existence and uniqueness
of the stationary law for negative drift and its absence for positive drift; and the M/M/1
stationary law.

Layer 1 is for every later use of the recursion on deterministic data (storage models, reflected
walks, sample-path arguments); Layer 2 is the interface between queues and the maximum of a random
walk; Layer 3 is the stationary theory a consumer cites for a GI/G/1 queue; Layer 4 is its first
closed form.

Already in the libraries and therefore not targets: Mathlib's strong law, independence and
product measures, Markov kernels and their invariant measures, hitting of levels through
`Finset.sup'`, and the exponential law; Tau Ceti's exchangeable sequences, the exchangeability of
an i.i.d. sequence, and the tail, mean and moments of the exponential law.

Left to other roadmaps and stated differently here:

- RuinTheory (1.1) owns the ruin probability, copied verbatim in 2.2, with its net-profit
  dichotomy (1.3), Lundberg's inequality (3.1) and the exponential-claims formulas (4.1, 4.2).
  This roadmap restates none of them; it uses 1.3, 3.1 and 4.2 through the duality, and its own
  targets are statements about waiting times and the recursion, which RuinTheory does not treat.
- RandomWalkFluctuationTheory owns the reflection principle and the law of the maximum of the
  simple random walk; it leaves Sparre Andersen's theorem and Spitzer's identity outside its scope.
  Nothing here is about the simple walk in particular, and this roadmap does not depend on that
  one.
- QueueingModels owns finite birth–death queues and the Erlang and Engset loss systems, and leaves
  waiting-time laws, M/G/1 and the Pollaczek–Khinchine formula outside its scope; the stationary
  M/M/1 queue length is its limit of finite waiting rooms, and nothing here concerns queue
  lengths. ShotNoiseAndCampbellTheorem owns the infinite-server queue. ContinuousTimeMarkovChains
  and MarkovChainsAndRenewal own continuous-time chains and renewal processes; none is used.

Not treated here: the Pollaczek–Khinchine formulas for M/G/1 (the transform, Adan–Resing (7.9),
p. 68, and Durrett, p. 329, and the mean, Adan–Resing (7.14), p. 70, which needs a finite second
moment of the service time), whose derivation needs the probability `1 − ρ` that the stationary
waiting time is `0`, obtained there through the ladder heights of the walk (Durrett, Example
5.8.15) or through the probability that an arriving customer finds the system empty (Adan–Resing,
§7.5, p. 69); ladder heights, the Wiener–Hopf factorization and
Spitzer's identity; the zero-mean case, which needs the oscillation of a mean-zero walk; moments
of the stationary waiting time; multi-server queues; the workload process in continuous time; and
general state-space Markov chains beyond this kernel.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Data/Finset/Range.lean`: `Finset.nonempty_range_add_one`.
- `Mathlib/Data/Finset/Lattice/Fold.lean`: `Finset.sup'`, `Finset.lt_sup'_iff`
  (`a < s.sup' H f ↔ ∃ b ∈ s, a < f b`).
- `Finset.sum_Ico_succ_top`, `Finset.sum_Ico_eq_sum_range`
  (`∑ k ∈ Ico m n, f k = ∑ k ∈ range (n − m), f (m + k)`), `Finset.sum_range_reflect`
  (`∑ j ∈ range n, f (n − 1 − j) = ∑ j ∈ range n, f j`); `Fin.revPerm`
  (`Mathlib/Data/Fin/Rev.lean`).
- `Mathlib/Probability/IdentDistrib.lean`: `ProbabilityTheory.IdentDistrib`,
  `IdentDistrib.comp` (with a measurable map), `IdentDistrib.measure_mem_eq` (measurable sets).
- `Mathlib/MeasureTheory/Measure/Continuity.lean`: `MeasureTheory.tendsto_measure_iUnion_atTop`
  (monotone sets), `MeasureTheory.tendsto_measure_iInter_atTop` (antitone sets, one of finite
  measure).
- `Mathlib/MeasureTheory/Integral/Indicator.lean`:
  `MeasureTheory.tendsto_measure_of_ae_tendsto_indicator_of_isFiniteMeasure` (finite measure,
  measurable sets).
- `MeasureTheory.measure_mono_ae`, `MeasureTheory.measure_union_le`, `MeasureTheory.measure_congr`,
  `MeasureTheory.prob_le_one`, `MeasureTheory.prob_compl_eq_one_sub` (measurable set),
  `MeasureTheory.Integrable.of_integral_ne_zero`.
- `Mathlib/Probability/StrongLaw.lean`: `ProbabilityTheory.strong_law_ae` (integrable `X 0`,
  pairwise independent, identically distributed).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun`,
  `iIndepFun.indepFun`, `iIndepFun.isProbabilityMeasure`, `ProbabilityTheory.IndepFun`,
  `indepFun_iff_map_prod_eq_prod_map_map` (finite measure, a.e.-measurable maps),
  `ProbabilityTheory.indep_iSup_of_disjoint`.
- `ProbabilityTheory.iIndepFun_iff_map_fun_eq_infinitePi_map` (probability measure),
  `ProbabilityTheory.iIndepFun_infinitePi` (`Mathlib/Probability/Independence/InfinitePi.lean`),
  `MeasureTheory.Measure.infinitePi`.
- `Mathlib/MeasureTheory/Constructions/BorelSpace/Order.lean`: `Measurable.iSup` (countable index,
  real values, the supremum read as Mathlib's `iSup`), `MeasureTheory.Measure.ext_of_Iic` (finite
  measures); `lt_ciSup_iff` (bounded above).
- `MeasureTheory.Measure.bind_apply`, `MeasureTheory.Measure.prod_apply` (s-finite second factor),
  `MeasureTheory.Measure.dirac_prod`, `MeasureTheory.Measure.map_fst_prod`,
  `MeasureTheory.Measure.map_snd_prod`, `MeasureTheory.Measure.map_map`,
  `MeasureTheory.Measure.map_prod_map` (measurable maps, s-finite measures),
  `MeasureTheory.Measure.dirac_apply'`.
- `Mathlib/Probability/Kernel/`: `ProbabilityTheory.Kernel.deterministic`, `Kernel.const`,
  `Kernel.prod` (`×ₖ`), `Kernel.map`, `Kernel.map_apply` (measurable map), `Kernel.prod_apply`
  (s-finite kernels), `Kernel.deterministic_apply`, `Kernel.const_apply`,
  `ProbabilityTheory.Kernel.Invariant` (`μ.bind κ = μ`).
- `Mathlib/Probability/HasLaw.lean`: `ProbabilityTheory.HasLaw`.
- `Mathlib/Probability/Distributions/Exponential.lean`: `ProbabilityTheory.expMeasure`,
  `ProbabilityTheory.isProbabilityMeasure_expMeasure` (positive rate).

### From Tau Ceti

- `TauCeti/Probability/Exchangeability/Basic.lean`: `TauCeti.Probability.ExchangeableAt`,
  `TauCeti.Probability.Exchangeable`; `TauCeti/Probability/Process/PathLaw/Basic.lean`:
  `TauCeti.Probability.blockLaw`, `TauCeti.Probability.prefixLaw`.
- `TauCeti/Probability/Exchangeability/IID.lean`:
  `TauCeti.Probability.Exchangeable.of_iIndepFun_identDistrib` (independent, identically
  distributed sequences are exchangeable; no measurability hypothesis).
- `TauCeti/Probability/Distributions/Exponential/Basic.lean`:
  `TauCeti.Probability.measure_Ioi_expMeasure` (for a positive rate `r`, the tail at `x` is
  `exp (−r x)` for `x ≥ 0` and `1` otherwise), `TauCeti.Probability.integral_id_expMeasure` (mean
  `r⁻¹`), `TauCeti.Probability.integrable_pow_expMeasure`.

### From TauCetiRoadmap.RuinTheory

- 1.1 `ruinProb P Y u = P {ω | ∃ n, u < ∑ i ∈ Finset.range n, Y i ω}`, copied verbatim in 2.2:
  strict ruin, infinite horizon, times `n ≥ 0`.
- 1.3 `TauCetiRoadmap.RuinTheory.ruinProb_eq_one` (measurable, independent, identically distributed
  increments with `0 < ∫ Y 0`: `ruinProb P Y u = 1` for every `u`), used in 3.4;
  `TauCetiRoadmap.RuinTheory.ruinProb_lt_one_and_tendsto_zero` (same, with `∫ Y 0 < 0`:
  `ruinProb P Y u < 1` for `u ≥ 0` and `ruinProb P Y u → 0`), used in the Examples of Layer 3.
- 3.1 `measure_exists_le_sum_le_exp` (Lundberg: for `R ≥ 0` with `exp (R Y 0)` integrable and
  `mgf (Y 0) P R ≤ 1`, `P {∃ n, u ≤ Sₙ} ≤ exp (−R u)` for every `u`), used in the Examples of
  Layer 3.
- 4.2 `TauCetiRoadmap.RuinTheory.ruinProb_eq_of_exponential_claims_and_waiting_times` (pairs
  `(Z i, T i)` measurable, independent, identically distributed, `Z 0` independent of `T 0`, laws
  `expMeasure δ` and `expMeasure lam`, `lam < c δ`: `ruinProb` of `Z i − c T i` at `u ≥ 0` is
  `(lam/(c δ)) exp (−(δ − lam/c) u)`), used in 4.1 with `c = 1`.

## References

- Ivo Adan and Jacques Resing, *Queueing Systems*, lecture notes, Eindhoven University of
  Technology, posted on I. Adan's page (`www.win.tue.nl/~iadan/queueing.pdf`): §7.4, equation
  (7.9) and Example 7.4.1, p. 68; §7.5, equation (7.10), p. 68, and equations (7.11)–(7.13),
  p. 69; §7.6, equation (7.14), p. 70.
- Rick Durrett, *Probability: Theory and Examples*, version 5 of 11 January 2019, posted on the
  author's page at Duke University (`services.math.duke.edu/~rtd/PTE/PTE5_011119.pdf`):
  Example 5.8.3, p. 323; §5.8.4 and Lemma 5.8.13, p. 327; Example 5.8.14, p. 328; Example 5.8.15,
  pp. 328–329; Exercises 5.8.5 and 5.8.6, p. 330. Exercises 5.8.5 and 5.8.6 are exercises of
  that text; the routes of 1.2, 2.1, 2.2 and 3.4 are this roadmap's own.
- Péter Kevei, *Financial mathematics and risk theory*, lecture notes, University of Szeged,
  version dated 19 November 2026, on the author's page
  (`www.math.u-szeged.hu/~kevei/tanitas/jegyzet/finance-risk_notes.pdf`): §11.1, p. 72; §11.2,
  pp. 73–74.

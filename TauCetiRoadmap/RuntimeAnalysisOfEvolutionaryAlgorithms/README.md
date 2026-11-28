# Roadmap: runtime analysis of evolutionary algorithms

**Summary.** This roadmap develops the probabilistic theory behind runtime bounds for
randomized search heuristics as theorems about stochastic processes, Markov chains and hitting
times. A heuristic appears only as a Markov kernel on bit strings, its "runtime" only as a
hitting time. Means are extended nonnegative numbers, so infinite means are honest.

The first part is drift analysis for a real adapted process; drift conditions are conditional
expectations given the past, required only before the stopping time (Kötzing and Krejca's
form). The headline theorems are these.

- *Additive drift.* If `X` is nonnegative up to a stopping time `τ` and its expected decrease
  before `τ` is at least `δ > 0`, then `E[τ] ≤ E[X 0]/δ`. If instead the expected decrease is
  at most `δ > 0`, the expected absolute step is bounded and `X τ ≤ 0`, then `E[τ] ≥ E[X 0]/δ`.
- *Multiplicative drift.* If `X` starts at or above `xmin > 0`, is nonnegative and its expected
  decrease is at least `δ X t` with `δ > 0`, then the first time `T` below `xmin` has
  `E[T] ≤ (1 + E[log(X 0/xmin)])/δ`; and, without the condition on the start and for every real
  `δ`, `P(T > t) ≤ exp(−δt) E[X 0]/xmin` for every integer `t`.

The second part turns drift into bounds for Markov chains and proves the fitness-level method.
The third part applies them to the elitist mutation chain on `{0,1}^n`: a mask drawn from a
fixed law is added modulo 2 to the current string, and the result replaces it when the
objective does not decrease. With standard bit mutation of rate `1/n`:

- *OneMax.* From a string with `k` zeros the mean time to reach the all-ones string is at most
  `n H_k (1 − 1/n)^(−(n−1)) ≤ e n (1 + log n)`. For every objective and every target point,
  from a uniform start, it is at least `(1 − 1/e)(n − 1) log(n/2)`. Random local search from `k`
  zeros needs exactly `n H_k`.
- *LeadingOnes.* For every law of the mask, from a uniform start, the mean time is
  `½ Σ_{i<n} 1/q_i`, where `q_i` is the probability that the mask leaves the first `i` bits
  and flips bit `i`. With rate `1/n` and `n ≥ 2` it lies between `(n² + n)/2` and
  `((e − 1)n² + n)/2`.

The roadmap rests on Mathlib's conditional expectations, stopping times and hitting times, on
Tau Ceti's path law of a Markov chain and its Markov property (the library that grew out of
MarkovChainsAndRenewal), and on HittingAndCoverTimes, whose mean hitting time it copies and
whose characterisation of mean hitting times by linear equations gives the exact value for
random local search.

Below, Layer 1 proves the drift theorems for adapted processes; Layer 2 the drift bound and
fitness levels for Markov chains; Layer 3 defines the mutation chains and treats OneMax and
lower bounds for every objective; Layer 4 treats LeadingOnes. Layers 3 and 4 use Layer 2.

## Conventions

- **Processes.** `(Ω, μ)` is a probability space with a filtration `ℱ : Filtration ℕ m`, and
  `X : ℕ → Ω → ℝ` is adapted (`Adapted ℱ X`: each `X t` is `ℱ t`-measurable) with every `X t`
  integrable. Integrability is part of every drift theorem: for a non-integrable `X (t+1)` the
  conditional expectation `μ[X (t+1) | ℱ t]` is the junk value `0`, and a drift hypothesis would
  then hold vacuously.
- **Stopping times and hitting times.** A stopping time is `τ : Ω → ℕ∞` with
  `IsStoppingTime ℱ τ`. The first time below `xmin` is Mathlib's
  `hittingAfter X (Set.Iio xmin) 0`, equal to `⊤` when the process never goes below `xmin`, and
  to `0` when `X 0 < xmin`. Means are lower integrals `∫⁻ ENat.toENNReal τ`.
- **Before the stopping time.** A drift hypothesis "before `τ`" is required almost surely on
  `{t < τ}` for every `t`, with `μ[X (t+1) | ℱ t]`; nothing is assumed of the process after
  `τ`. This is the convention of Kötzing–Krejca (p. 4), who multiply each requirement by the
  indicator of `{t < τ}`. A hypothesis conditioned only on the event `{X t = s}` is weaker and
  does not suffice; see the Check of 1.1.
- **Conditional on the start.** Each conclusion of Layer 1 is stated on every event `A ∈ ℱ 0`
  (`E[τ; A]` is `∫⁻ ω in A, τ ω`), which is the source's bound on `E[τ | X 0]` in integrated
  form; `A = Ω` gives the unconditional bound.
- **Markov chains.** `S` is a measurable space with measurable singletons, `κ` a Markov kernel
  on `S`, and the chain with initial law `ν` has Tau Ceti's path law `markovChainLaw ν κ` on
  `ℕ → S`. `meanHittingTime κ ν A` is the mean of the first time `n ≥ 0` at which the
  coordinate process is in `A`; it is copied verbatim from HittingAndCoverTimes 1.1.
- **Bit strings.** The search space is `Fin n → Bool` with `true` for a one; it is finite, and
  every set of strings is measurable. `n = 0` is allowed: then there is one string and every
  hitting time of it is `0`.
- **Elitist mutation chains.** For an objective `f` with values in a linear order and a
  probability law `M` of masks `m : Fin n → Bool`, `elitistKernel f M` moves from `x` to the
  offspring `offspring x m` (coordinatewise exclusive or) when `f x ≤ f (offspring x m)`, and
  stays at `x` otherwise. Offspring of equal value are accepted, as in Doerr (2018,
  Algorithm 1, p. 7) and Lengler (Algorithm 1, p. 9). Standard bit mutation with rate
  `p ∈ [0, 1]` (`bitFlipMask n p`, with `p : unitInterval`) flips each bit independently with
  probability `p`; random local search (`rlsMask n`, `n ≥ 1`) flips one uniformly chosen bit.
  Rate `1/n` is written `(p : ℝ) = 1 / n`; at `n = 0` this is `p = 0`.
- **Objectives and targets.** `oneMax x` is the number of ones of `x`; `leadingOnes x` is the
  number of positions `i` such that `x j` is true for all `j ≤ i`, which is the length of the
  longest all-ones prefix (Lengler's sum-of-products form, p. 9). The all-ones string is
  `fun _ => true`. The uniform start is `uniformOn Set.univ`.
- **Numbers.** `H_k = 1 + 1/2 + … + 1/k` is Mathlib's `harmonic k` (a rational, cast to `ℝ`),
  with `H_0 = 0`. In `ℝ≥0∞`, `0⁻¹ = ⊤`; in `ℝ`, `0⁻¹ = 0`, which is why closed forms that
  divide by a probability are stated only where it is positive.

## Layer 1: drift theorems for adapted processes

### 1.1 Additive drift: the upper bound

Prove `additiveDrift_upper`: let `τ` be a stopping time, `δ > 0`, and suppose that
`X t ≥ 0` almost surely on `{t ≤ τ}` and `μ[X (t+1) | ℱ t] ≤ X t − δ` almost surely on
`{t < τ}`, for every `t`. Then for every `A ∈ ℱ 0`,
`∫⁻ ω in A, τ ω ≤ ofReal ((∫ ω in A, X 0 ω) / δ)` (Kötzing–Krejca, Theorem 5, p. 8, with proof
in Appendix A.2, pp. 15–16, for `τ` the first time `X ≤ 0`).

The source states it for the first time `X t ≤ 0` and remarks (p. 4) that its results hold for
any filtration to which the process is adapted; the statement here allows any stopping time,
which the route below proves directly. The source's own proof truncates the state space and
uses optional stopping for bounded processes.

Route: put `Y t = X (t ∧ τ) + δ (t ∧ τ)`. For `B = A ∩ {t < τ} ∈ ℱ t`,
`∫_B X (t+1) = ∫_B μ[X (t+1) | ℱ t] ≤ ∫_B (X t − δ)` by the defining property of the
conditional expectation, and on `A ∩ {τ ≤ t}` the stopped process does not move. Hence
`∫_A Y (t+1) ≤ ∫_A Y t`, and by induction
`δ ∫_A (t ∧ τ) ≤ ∫_A X 0 − ∫_A X (t ∧ τ) ≤ ∫_A X 0`, since `X (t ∧ τ) ≥ 0`. Each `X (t ∧ τ)` is
a finite sum of the integrable `X s` on `{t ∧ τ = s}`. Let `t → ∞` by monotone convergence.

**Checks.**

- Nonnegativity is needed (Kötzing–Krejca, Example 6, p. 8): for `n = 3`, let `X 0 = 1` and let
  `X` stay where it is with probability `2/3` and jump to `−2` otherwise; before the first
  time `X ≤ 0` the drift is exactly `1`, the bound is `1`, but that time is geometric with
  mean `3`.
- `δ > 0` is needed: the constant process `X = 1` with `τ = ⊤` satisfies the drift hypothesis
  with `δ = 0`, and `ofReal (1/0) = 0 < ⊤`.
- Conditioning on the event `{X t = s}` alone does not suffice. On `{0, 2}` take three paths:
  `0, 2, 0, 2, …` and `2, 0, 2, 0, …` with mass `9/20` each and the constant path `2` with mass
  `1/10`. For every `t`, `P(X t = 2) = 11/20` and `E[X t − X (t+1) | X t = 2] = 18/11 ≥ 1`, while
  `E[X 0] = 11/10` and the first time `X = 0` is infinite with probability `1/10`. The
  hypothesis of 1.1 fails on the constant path, whose drift before `τ` is `0`.

*Needs:* Mathlib `IsStoppingTime`, `MeasureTheory.setIntegral_condExp`,
`MeasureTheory.stoppedProcess`, `MeasureTheory.lintegral_iSup`.

### 1.2 Additive drift: the lower bound

Prove `additiveDrift_lower`: let `τ` be a stopping time with `X τ ≤ 0` almost surely on
`{τ < ⊤}`, let `δ > 0` and `c` be real, and suppose that almost surely on `{t < τ}`,
`X t − δ ≤ μ[X (t+1) | ℱ t]` and `μ[|X (t+1) − X t| | ℱ t] ≤ c`, for every `t`. Then for every
`A ∈ ℱ 0`, `ofReal ((∫ ω in A, X 0 ω) / δ) ≤ ∫⁻ ω in A, τ ω` (Kötzing–Krejca, Theorem 7,
pp. 8–9, proof printed p. 9, for `τ` the first time `X ≤ 0`; the general stopping time is
handled by the same proof).

Route (the source's, with optional stopping proved in place): if `∫⁻_A τ = ⊤` there is nothing
to prove; otherwise `τ < ⊤` almost surely on `A`. The process `X (t ∧ τ) + δ (t ∧ τ)` is a
submartingale on `A` by the computation of 1.1 with the inequality reversed, so
`∫_A X (t ∧ τ) + δ ∫_A (t ∧ τ) ≥ ∫_A X 0`. As `t → ∞`, `X (t ∧ τ) → X τ` almost surely on `A`,
dominated by `|X 0| + Σ_{s<τ} |X (s+1) − X s|`, whose integral over `A` is at most
`∫_A |X 0| + c ∫_A τ < ∞` (apply the step bound on `A ∩ {s < τ} ∈ ℱ s` and sum over `s`).
Dominated and monotone convergence give `∫_A X τ + δ ∫_A τ ≥ ∫_A X 0`, and `X τ ≤ 0`.

**Checks.**

- The step bound is needed (Kötzing–Krejca, Example 8, p. 9): with `δ = 1/2`, `X 0 = 2` and
  `X (t+1) = 0` or `2 X t − 1` with probability `1/2` each, the drift is exactly `1/2` at every
  state, the bound claims `E[τ] ≥ 4`, but `τ` is geometric with mean `2`.
- `δ > 0` is needed: with `δ = −1`, `X 0 = −1` and `τ = 0`, the left side is `ofReal 1` and the
  right side `0`.
- Exactness: for a deterministic process decreasing by exactly `δ`, from `X 0 = kδ`, both 1.1 and
  1.2 give `E[τ] = k` for the first time `X ≤ 0`.

*Needs:* Mathlib `MeasureTheory.setIntegral_condExp`, `MeasureTheory.stoppedProcess`,
`MeasureTheory.tendsto_integral_of_dominated_convergence`, `MeasureTheory.lintegral_iSup`.

### 1.3 Variable drift

Let `T = hittingAfter X (Set.Iio xmin) 0` be the first time `X` is below `xmin > 0`. Prove
`variableDrift_upper`: let `D` be an interval (`D.OrdConnected`) containing `xmin`, and `h`
monotone and positive on `D`. Suppose `X 0 ≥ xmin` almost surely, `X t ≥ 0` almost surely on
`{t ≤ T}`, `X t ∈ D` almost surely on `{t < T}`, and `h (X t) ≤ X t − μ[X (t+1) | ℱ t]`
almost surely on `{t < T}`. Then for every `A ∈ ℱ 0`,
`∫⁻ ω in A, T ω ≤ ofReal (xmin / h xmin · P(A) + ∫ ω in A, ∫ z in xmin..X 0 ω, (h z)⁻¹)`
(Kötzing–Krejca, Theorem 9, p. 10, proof in Appendix A.3, pp. 16–17; there `D` is the smallest
interval containing the values `≥ xmin` of the process up to `T`).

Route: define `g x = x / h xmin` for `x < xmin` and `g x = xmin / h xmin + ∫_{xmin}^x 1/h` for
`x ∈ D`, `x ≥ xmin` (and `g x = x / h xmin` elsewhere); `1/h` is interval integrable on
`[xmin, x]` by `AntitoneOn.intervalIntegrable`, since `1/h` is antitone there. For `x ∈ D`,
`x ≥ xmin`, and every `y ∈ [0, xmin)` or `y ∈ D` with `y ≥ xmin`,
`g y ≤ g x + (y − x)/h x`: for `y ≥ x` because `1/h ≤ 1/h x` on `[x, y]`, for `xmin ≤ y < x`
because `1/h ≥ 1/h x` on `[y, x]`, and for `y < xmin` because in addition `h xmin ≤ h x`. On
`{t < T}` the value `X (t+1)` is in one of these ranges almost surely, so, pulling out the
`ℱ t`-measurable factor `1{t < T}/h (X t) ≤ 1/h xmin` (with `h` replaced off `D` by the constant
`h xmin`, which changes nothing on `{t < T}` and makes `h ∘ X t` measurable, since a function
monotone on an interval is measurable there),
`μ[g ∘ X (t+1) | ℱ t] ≤ g (X t) + (μ[X (t+1) | ℱ t] − X t)/h (X t) ≤ g (X t) − 1`. Since
`0 ≤ g x ≤ x / h xmin` for `x ≥ 0` and `|g x| ≤ |x| / h xmin + xmin / h xmin` everywhere, the
process `g ∘ X` is adapted, integrable and nonnegative up to `T`, and 1.1 with `δ = 1` and the
stopping time `T` (Mathlib `Adapted.isStoppingTime_hittingAfter`) gives the bound, since
`g (X 0) = xmin / h xmin + ∫_{xmin}^{X 0} 1/h` almost surely.

**Checks.**

- `X 0 ≥ xmin` is needed: with `xmin = 1`, `D = [1, ∞)`, `h = 1` on `D` and `h = 1/4` on
  `[0, 1)`, let `X 0` be `0` or `1` with probability `1/2` each and let the process go from `1`
  to `0`. Then `E[T] = 1/2`, while the right side is `1 + ½ · 0 + ½ · (−4) = −1`, so its
  `ofReal` is `0`.
- Monotonicity is needed: let `X 0 = 2`, `xmin = 1`, `D = [1, 2]`, and let the process stay at
  `2` with probability `1/2` and go to `0` otherwise. The drift at `2` is `1`; with `h = 4` on
  `[1, 2)` and `h 2 = 1` the bound is `1/4 + 1/4 = 1/2`, but `E[T] = 2`. Every monotone `h` with
  `h 2 ≤ 1` has `h ≤ 1` on `[1, 2]`, and the bound is then at least `2`.

*Needs:* 1.1; Mathlib `Adapted.isStoppingTime_hittingAfter`,
`MeasureTheory.condExp_mul_of_stronglyMeasurable_left`, `AntitoneOn.intervalIntegrable`,
`intervalIntegral`.

### 1.4 Multiplicative drift

With `T` as in 1.3, prove `multiplicativeDrift_upper`: if `δ > 0`, `X 0 ≥ xmin` almost surely,
`X t ≥ 0` almost surely on `{t ≤ T}` and `δ X t ≤ X t − μ[X (t+1) | ℱ t]` almost surely on
`{t < T}`, then for every `A ∈ ℱ 0`,
`∫⁻ ω in A, T ω ≤ ofReal ((P(A) + ∫ ω in A, log (X 0 ω / xmin)) / δ)` (Kötzing–Krejca,
Corollary 11, p. 11, proof in Appendix A.5, p. 17).

Route: 1.3 with `D = [xmin, ∞)` and `h x = δ x`, which is monotone and positive on `D`; then
`xmin / h xmin = 1/δ` and `∫_{xmin}^{X 0} 1/(δ z) dz = log (X 0 / xmin)/δ`.

**Checks.**

- Nonnegativity is needed: with `xmin = 1`, `δ = 1`, `X 0 = 1`, let `X` stay with probability
  `1/2` and jump to `−1` otherwise. The drift is exactly `1 · X t` before `T`, the bound is
  `(1 + log 1)/1 = 1`, but `E[T] = 2`.
- `δ > 0` is needed: the constant process `X = 1` with `xmin = 1/2` satisfies the hypothesis with
  `δ = 0`, never goes below `xmin`, and `ofReal (… / 0) = 0`.

*Needs:* 1.3.

### 1.5 Multiplicative drift: the upper tail

With `T` as in 1.3, prove `multiplicativeDrift_tail`: let `δ` be any real number, and suppose
`X t ≥ 0` almost surely on `{t ≤ T}` and `δ X t ≤ X t − μ[X (t+1) | ℱ t]` almost surely on
`{t < T}`. Then for every `A ∈ ℱ 0` and every `t ∈ ℕ`,
`μ (A ∩ {t < T}) ≤ ofReal (exp (−δ t) · (∫ ω in A, X 0 ω) / xmin)`.

Source: Lengler, Theorem 18, p. 28, proof printed there (after Doerr and Goldberg), for a
finite state space, `xmin` the least positive state, `T` the first time `X = 0` and `δ > 0`,
with the bound at a real time `(r + log (X 0/xmin))/δ`. The statement here is in integer time,
for adapted processes and every real `δ`; the route is complete. At a real time that is not an
integer the bound `e^(−r)` can fail: for the chain on `{0, 1}` that leaves `1` for `0` with
probability `1/2`, `X 0 = 1`, `r = 1/10`, `P(T > 1/5) = P(T ≥ 1) = 1 > e^(−1/10)`.

Route: put `Z t = X t · 1{t < T}`. Then
`∫_A Z (t+1) ≤ ∫_{A ∩ {t < T}} X (t+1) = ∫_{A ∩ {t < T}} μ[X (t+1) | ℱ t] ≤ (1 − δ) ∫_A Z t`,
the first step because `X (t+1) ≥ 0` on `{t+1 ≤ T}`. Since `∫_A Z t ≥ 0`, induction gives
`∫_A Z t ≤ e^(−δt) ∫_A X 0`: when `1 − δ ≥ 0` use `1 − δ ≤ e^(−δ)` (`Real.add_one_le_exp`), and
when `1 − δ < 0` the step gives `∫_A Z (t+1) ≤ 0`. Finally `X t ≥ xmin` on `{t < T}`, so
`xmin · μ (A ∩ {t < T}) ≤ ∫_A Z t`.

**Checks.**

- As an inequality of real numbers, the form `(1 − δ)^t` in place of `exp (−δ t)` is false for
  `δ > 1`: for `X = 1/2` constant, `xmin = 1` and `δ = 2`, the hypotheses hold (`T = 0`),
  `μ{1 < T} = 0`, and `(1 − δ) · E[X 0]/xmin = −1/2 < 0`. (Inside `ofReal` both forms are true
  for `δ > 1`, since the hypotheses then force `μ{t < T} = 0` for every `t`.)
- On the chain above (`δ = 1/2`), `P(T > t) = 2^(−t) ≤ e^(−t/2)`, which holds because `e ≤ 4`.
- `xmin > 0` is needed: with `xmin = 0` the right side is `ofReal (… / 0) = 0`, while a process
  that is constant at `1` has `T = ⊤`, drift `0`, and satisfies the hypotheses with `δ = 0`.

*Needs:* Mathlib `MeasureTheory.setIntegral_condExp`, `Real.add_one_le_exp`.

### Examples

- The coupon collector as a process: the number of missing coupons decreases by one with
  probability `k/n` when `k ≥ 1` are missing; 1.4 with `xmin = 1` and `δ = 1/n` gives
  `E[T] ≤ n (1 + log k)` from `k` missing coupons (Lengler, Example 4, pp. 13–14, gives the same
  bound with `k = n`).

### Dependencies

1.1 uses Mathlib only. 1.2 uses Mathlib only. 1.3 uses 1.1. 1.4 uses 1.3. 1.5 uses Mathlib only.

## Layer 2: drift and fitness levels for Markov chains

### 2.1 The drift bound for Markov chains

`meanHittingTime κ ν A` is copied verbatim from HittingAndCoverTimes 1.1:
`∫⁻ ω, ENat.toENNReal (hittingAfter (fun n ω => ω n) A 0 ω) ∂markovChainLaw ν κ`.

Prove `meanHittingTime_le_of_drift`: let `ν` be a probability measure, `A` a measurable set,
`g : S → ℝ≥0∞` measurable and `δ > 0`, and suppose `∫⁻ y, g y ∂κ x + ofReal δ ≤ g x` for every
`x ∉ A`. Then `meanHittingTime κ ν A ≤ (∫⁻ x, g x ∂ν) / ofReal δ`. This is the Markov-chain form
of the additive drift theorem, which Kötzing–Krejca (pp. 1–2) trace to He and Yao and to Hajek;
the statement here is on a general measurable state space, with an extended-valued potential
and no integrability condition. (Proved here.)

Route: let `T` be the hitting time of `A` by the coordinate process. The event `{t < T}` is
`{ω 0 ∉ A, …, ω t ∉ A}`, a preimage under the prefix map `ω ↦ (ω 0, …, ω t)`, so it lies in
`Filtration.piLE t` (Tau Ceti `piLE_eq_comap_prefix`). The Markov property in prefix form (Tau
Ceti `markovChainLaw_map_prefix_succ_eq_compProd`: the law of the prefix and the next state is
the prefix law composed with `κ` at the last coordinate) and `Measure.lintegral_compProd` give,
for every event `B` of the prefix up to `t`,
`∫⁻_B g (ω (t+1)) = ∫⁻_B (∫⁻ g dκ (ω t))`. With `B = {t < T}`, on which `ω t ∉ A`,
`∫⁻_{t+1<T} g (ω (t+1)) + ofReal δ · P(t < T) ≤ ∫⁻_{t<T} g (ω t)`. Summing from `0` to `t`,
`ofReal δ · Σ_{s ≤ t} P(s < T) ≤ ∫⁻ g (ω 0) = ∫⁻ g dν` (Tau Ceti `markovChainLaw_map_eval_zero`),
and `E[T] = Σ_s P(s < T)` by monotone convergence. On a countable state space the bound also
follows from HittingAndCoverTimes 1.2
(`TauCetiRoadmap.HittingAndCoverTimes.isLeast_meanHittingTime`): the iterates from `0` of the
first-step map stay below `g/δ`, and their supremum is a solution of the first-step equations.

**Checks.**

- Equality on two states: if `a` moves to `b` with probability `q > 0` and stays otherwise,
  `A = {b}`, `g a = 1/q`, `g b = 0` and `δ = 1`, then `(1 − q)/q + 1 = 1/q`, and the mean
  hitting time from `a` is `1/q` (exactly for `q = 1/2, 1/3, 2/5`: `2, 3, 5/2`).
- `δ > 0` is needed: `g = 0` and `δ = 0` satisfy the hypothesis, and the right side is
  `0 / 0 = 0` in `ℝ≥0∞`, while every start outside `A` has mean hitting time at least `1`.

*Needs:* HittingAndCoverTimes 1.1 (`meanHittingTime`, copied); Tau Ceti
`markovChainLaw_map_prefix_succ_eq_compProd`, `markovChainLaw_map_eval_zero`,
`piLE_eq_comap_prefix`; Mathlib `Measure.lintegral_compProd`, `MeasureTheory.lintegral_iSup`.

### 2.2 The fitness-level method

Prove `meanHittingTime_le_of_fitnessLevels`: let `f : S → ℕ` be measurable, `m ∈ ℕ` and
`p : ℕ → ℝ≥0∞`. Suppose that for every `x` with `f x < m`, `κ x {y | f y < f x} = 0` (no step
to a lower level) and `p (f x) ≤ κ x {y | f x < f y}`. Then for every probability measure `ν`,
`meanHittingTime κ ν {y | m ≤ f y} ≤ ∫⁻ x, Σ_{f x ≤ i < m} (p i)⁻¹ ∂ν`.

Source: Doerr, "Probabilistic tools", Theorem 1.8.6 and the remark after its proof, which gives
the expectation form `E[T] ≤ Σ_i 1/p_i` (the domination version is proved there via
Lemma 1.8.8). The source is about the levels of an elitist heuristic; the statement here is
for any Markov chain whose level never decreases, with probabilities in `ℝ≥0∞` so that
`p i = 0` gives `⊤`. Route (own): 2.1 with `δ = 1` and the potential
`g x = Σ_{f x ≤ i < m} (p i)⁻¹`. If `g x = ⊤` there is nothing to prove. Otherwise, from `x`
with `f x = i < m` the chain stays on level `i`, where `g = g x`, or moves up, where
`g ≤ g x − (p i)⁻¹`; with `r = κ x {f > i} ≥ p i`,
`∫⁻ g dκ x ≤ g x − r (p i)⁻¹ ≤ g x − 1`.

**Checks.**

- Random local search on OneMax (3.5) meets the bound with equality.
- The bound need not be attained: for LeadingOnes with `n = 3` and rate `1/3`, the levels give
  `345/32` from a uniform start, while the exact mean is `57/8`, since levels can be skipped.
- The no-decrease hypothesis is needed: on levels `0, 1, 2` with `m = 2`, let `0` move to `1`,
  and `1` move to `2` or to `0` with probability `1/2` each. Then `p 0 = 1`, `p 1 = 1/2`, the
  bound from `0` is `3`, but the mean time from `0` is `4`.

*Needs:* 2.1.

### Examples

- A chain on `ℕ` that moves from `k ≥ 1` to `k − 1` with probability `1/2` and to `k + 1`
  otherwise does not satisfy 2.1 for `A = {0}` with any finite potential, as it must not: its
  mean hitting time of `0` is infinite.

### Dependencies

2.1 uses HittingAndCoverTimes 1.1 and Tau Ceti's Markov property. 2.2 uses 2.1. Layer 2 does not
use Layer 1.

## Layer 3: elitist mutation chains; OneMax and lower bounds

### 3.1 Bit strings, masks and the elitist chain

Define `oneMax`, `leadingOnes`, `offspring x m` (the coordinatewise exclusive or),
`elitistStep f x m` (the offspring when `f x ≤ f (offspring x m)`, otherwise `x`),
`elitistKernel f M` (the kernel `x ↦ M.map (elitistStep f x)`, built with
`Kernel.ofFunOfCountable`, a Markov kernel for every probability law `M`), `bitFlipMask n p`
(the product `Measure.pi` of `bernoulliMeasure true false p`) and `rlsMask n` (the image of the
uniform law on `Fin n` under `i ↦ (j ↦ decide (j = i))`), both probability measures.

**Checks.**

- `oneMax 1101 = 3` and `leadingOnes 1101 = 2`; `leadingOnes 0111 = 0`, where a count of
  trailing ones would give `3`.
- `p` is the probability of flipping: for `n = 2` and `p = 1`, OneMax from `00` reaches `11` in
  one step; with the roles of `p` and `1 − p` exchanged the chain would never move.
- Acceptance of ties matters: for the objective that is `1` at `11` and `0` elsewhere, with
  `n = 2` and `p = 1/3`, the mean time from `00` is `6`; accepting only strict improvements gives
  `9`.
- For `n = 1` and `p = 1` the chain on OneMax reaches `1` from `0` in one step, so the mean time
  from a uniform start is `1/2`.

### 3.2 OneMax: the upper bound

Prove `meanHittingTime_oneMax_le`: for rate `1/n` and every `x` with `k` zeros,
`meanHittingTime (elitistKernel oneMax (bitFlipMask n p)) (dirac x) {fun _ => true}` is at most
`ofReal (n H_k / (1 − 1/n)^(n−1))`, and at most `ofReal (e n (1 + log n))`.

Source: Doerr, "Probabilistic tools", Lemma 1.10.36(a), which states `E[T] ≤ e n H_n` from a
uniform start through a domination by geometric laws and cites Droste, Jansen and Wegener for
the proof. The per-start form with `H_k` and the factor `(1 − 1/n)^(−(n−1))` is proved here.
Route: 2.2 with levels `oneMax`, `m = n` and `p i = (n − i) (1/n) (1 − 1/n)^(n−1)` for `i < n`:
the chain never lowers the number of ones, and from a string with `n − i` zeros it gains a one
at least when exactly one of those zeros is flipped and no other bit. The sum is
`Σ_{j=1}^{k} n / (j (1 − 1/n)^(n−1)) = n H_k / (1 − 1/n)^(n−1)`. For the second bound,
`H_k ≤ H_n ≤ 1 + log n` (Mathlib `harmonic_le_one_add_log`) and `(1 − 1/n)^(n−1) ≥ 1/e`, from
`1 + 1/(n−1) ≤ e^(1/(n−1))` (`Real.add_one_le_exp`) for `n ≥ 2`; for `n ≤ 1` both sides are
direct.

**Checks.**

- Exact means for `n ≤ 6` at every start satisfy the first bound, with equality at every start
  with one zero (then the time is geometric with parameter `(1/n)(1 − 1/n)^(n−1)`).
- `n = 2`: from `00` the mean is `4` (bound `6`), from `01` it is `4` (bound `4`), and from a
  uniform start `3`. `n = 3`: from `000` the mean is `189/22` (bound `99/8`), from a uniform
  start `1161/176`.

*Needs:* 2.2; Mathlib `harmonic`, `harmonic_le_one_add_log`, `Real.add_one_le_exp`.

### 3.3 The lower tail

Prove `hittingTime_le_prob_le`: for every objective `f`, every target `x⋆`, every rate `p` and
every `t ∈ ℕ`, under the chain `elitistKernel f (bitFlipMask n p)` from a uniform start,
`P(T ≤ t) ≤ ofReal ((1 − (1 − p)^t / 2)^n)`, where `T` is the hitting time of `x⋆`.

Source: Doerr, "Probabilistic tools", Theorem 1.9.4 and its proof, for rate `1/n` and the time
to reach the unique global maximum of `f`: a bit that is wrong at the start and never flipped
by a mask stays wrong. The statement here is for every rate, every objective and every target
point, which the route below proves without a uniqueness hypothesis. (Proved here.)

Route: for `x` let `D x` be the set of positions where `x` differs from `x⋆`, let
`a t = 1 − (1 − p)^t`, and prove by induction on `t` that `P_x(T ≤ t) ≤ a t ^ |D x|` for every
start `x`. For `t = 0` both sides are `1` at `x⋆` and the left side is `0` elsewhere. For
`x ≠ x⋆`, the Markov property at time `1` (Tau Ceti `Measure.markovChainLaw_map_shift_iterate`
with `n = 1`, and `Measure.markovChainLaw_eq_comp`) gives
`P_x(T ≤ t+1) = ∫ P_y(T ≤ t) dκ(x)(y)`. The next point `y` is `offspring x m` or `x`; in both
cases it differs from `x⋆` at every position of `D x` that the mask `m` leaves unchanged. So
`P_y(T ≤ t) ≤ Π_{i ∈ D x} (1 if m i else a t)`, and under the product law of the mask the
expectation of the right side is `(p + (1 − p) a t)^|D x| = a (t+1) ^ |D x|`. Averaging over the
uniform start, `2^(−n) Σ_x a t ^ |D x| = ((1 + a t)/2)^n = (1 − (1 − p)^t/2)^n`.

**Checks.**

- For `1 ≤ n ≤ 3`, every target point, `t ≤ 10`, rates `1/n, 1/3, 1/2, 1` and the objectives OneMax,
  LeadingOnes, the trap (`n + 1` at `11…1`, otherwise the number of zeros), a constant and a
  needle at `00…0`, the exact probabilities satisfy the bound (3080 cases); for `n ≤ 4` the
  per-start bound of the route holds for OneMax, LeadingOnes and the trap.
- At `t = 0` both sides are `2^(−n)`. For `n = 1`, `p = 1/2` and a constant objective the bound
  is attained for every `t`: `P(T ≤ t) = 1 − 2^(−(t+1))`.
- The exponential form `exp(−n^ε)` at time `(1 − ε)(n − 1) log(n/2)` fails at `ε = 1`: the time
  is `0`, and `P(T ≤ 0) = 2^(−n) > e^(−n)` for every `n ≥ 1`.

*Needs:* 3.1; Tau Ceti `Measure.markovChainLaw_map_shift_iterate`, `Measure.markovChainLaw_eq_comp`;
Mathlib `Measure.pi`, `bernoulliMeasure`.

### 3.4 The lower bound in expectation

Prove `meanHittingTime_ge_of_bitFlip`: for every objective and every target `x⋆`, with rate
`1/n` and a uniform start, the mean time to reach `x⋆` is at least
`ofReal ((1 − e^(−1)) (n − 1) log (n/2))`. (Proved here; Doerr, "Probabilistic tools", states
the corresponding tail bound, Theorem 1.9.4, and not this mean.)

Route: for `n ≤ 2` the right side is `0` (`log 1 = 0`, and `log 0 = 0` at `n = 0`). For
`n ≥ 2` put `L = (n − 1) log (n/2)`. For an integer `s ≤ L`,
`(1 − 1/n)^s ≥ ((1 − 1/n)^(n−1))^(log (n/2)) ≥ e^(−log (n/2)) = 2/n`, so 3.3 gives
`P(T ≤ s) ≤ (1 − 1/n)^n ≤ e^(−1)` (`Real.one_sub_div_pow_le_exp_neg`). Hence
`E[T] = Σ_s P(T > s) ≥ (⌊L⌋ + 1)(1 − e^(−1)) ≥ (1 − e^(−1)) L`.

**Checks.**

- For OneMax and `n = 3` the bound is `(1 − 1/e) · 2 log (3/2) < 1`, because
  `log (3/2) < 1/2` (that is, `e > 9/4`), and the exact mean from a uniform start is
  `1161/176 ≥ 1`.

*Needs:* 3.3; Mathlib `Real.one_sub_div_pow_le_exp_neg`, `Real.add_one_le_exp`.

### 3.5 Random local search on OneMax

Prove `meanHittingTime_rls_oneMax`: for `n ≥ 1` and `x` with `k` zeros,
`meanHittingTime (elitistKernel oneMax (rlsMask n)) (dirac x) {fun _ => true} = ofReal (n H_k)`.

Source: Doerr, "Probabilistic tools", Theorem 1.9.1, proof printed (sum of geometric waiting
times), for the coupon collector from no coupon (`k = n`), and the remark before it that random
local search on OneMax is the coupon collector started with the coupons already present; the
form for every start is proved here. Route: HittingAndCoverTimes 1.3
(`TauCetiRoadmap.HittingAndCoverTimes.meanHittingTime_ne_top_and_eq_iff`, for a finite state
space from which the target is
reachable): the function `h x = n H_k` vanishes at the all-ones string and satisfies
`h x = 1 + Σ_y κ(x, y) h y` elsewhere, because a flip of one of the `k` zeros (probability
`k/n`) is accepted and leaves `k − 1` zeros, a flip of a one is rejected, and
`1 + k H_(k−1) + (n − k) H_k = n H_k`. Every string reaches the all-ones string in `k` steps.

**Checks.**

- `n = 1, …, 6` from all zeros: `1, 3, 11/2, 25/3, 137/12, 147/10`, equal to `n H_n`; for
  `n ≤ 6` the exact means equal `n H_k` at every start.

*Needs:* 3.1; HittingAndCoverTimes 1.3; Mathlib `harmonic`.

### Examples

- The bounds of 3.2 and 3.4 together say that the mean time of standard bit mutation on OneMax
  lies between `(1 − 1/e)(n − 1) log (n/2)` and `e n (1 + log n)`.

### Dependencies

3.2 uses 2.2. 3.3 uses 3.1 and Tau Ceti's Markov property. 3.4 uses 3.3. 3.5 uses
HittingAndCoverTimes 1.3.

## Layer 4: LeadingOnes

### 4.1 The LeadingOnes formula

Prove `meanHittingTime_leadingOnes`: for every probability law `M` of masks, from a uniform
start, the mean time of `elitistKernel leadingOnes M` to reach the all-ones string is
`2⁻¹ · Σ_{i<n} (M {m | m j = false for all j < i, and m i = true})⁻¹`, computed in `ℝ≥0∞`
(Doerr, "Better runtime guarantees via stochastic domination", Theorem 3, p. 9, proof printed
pp. 9–10). In the theorem `q_i` is the probability of a strict improvement from a string of
LeadingOnes value `i`. For a mutation that adds a mask whose law does not depend on the current
string, this probability is the mask probability above, and the proof needs this
form: at each time the bits after position `i + 1` of the current string are uniform and
independent of the past, because the current string is the uniform start plus masks that were
drawn independently of those bits.

Route (the source's): let `T_i` be the time from a string of value exactly `i` whose bits after
position `i` are uniform, and `T'_i` the time from a string of value at least `i`, its bits from
position `i` on uniform. The time spent at value `i` is geometric with parameter `q_i`; when the
improvement comes, the bits after position `i + 1` are still uniform, so `T_i = Geom(q_i) +
T'_(i+1)` and `T'_i = X_i T_i + (1 − X_i) T'_(i+1)` for a fair bit `X_i` independent of the
rest. Hence `E T'_0 = Σ_i ½ (q_i)⁻¹`, with `(q_i)⁻¹ = ⊤` when `q_i = 0`: value `i` is then
reached with positive probability (at least `2^(−(i+1))`, from the start) and never left. In
Lean the mean is `meanHittingTime`, and the independence statements are statements about the
law of the path under `markovChainLaw`, proved from the product formula for finite paths (Tau
Ceti `markovChainLaw_map_prefix_apply_singleton`).

**Checks.**

- Exact means for `n ≤ 4` agree with the formula for standard bit mutation with rates
  `1/3, 1/2, 2/3, 1/n, 1`, random local search, the correlated law giving each mask `m` weight
  proportional to `1 + (m read in binary mod 3)`, the law flipping a uniformly chosen suffix, and
  the law putting mass `1/2` on each of `00…0` and `11…1` (then, for `n ≥ 2`, `q_1 = 0` and both
  sides are `⊤`); the same holds when only strict improvements are accepted.
- Random local search (`q_i = 1/n`) gives `n²/2` (`2, 9/2, 8` for `n = 2, 3, 4`).
- For `p = 1` and `n = 2`, `q_1 = 0`: from `10` the offspring is `01`, which is rejected, so the
  mean is `⊤`.

*Needs:* 3.1; Tau Ceti `markovChainLaw_map_prefix_apply_singleton`,
`Measure.markovChainLaw_map_shift_iterate`.

### 4.2 Standard bit mutation

Prove `meanHittingTime_leadingOnes_bitFlip`: for `0 < p < 1`, from a uniform start, the mean
time of `elitistKernel leadingOnes (bitFlipMask n p)` is
`ofReal (((1 − p)^(1−n) − (1 − p)) / (2 p²))`, with an integer exponent (Doerr, "Better runtime
guarantees", the bullet on the (1 + 1) EA after Corollary 4, pp. 11–12, which credits Böttcher,
Doerr and Neumann; p. 8 credits the exact mean to them and to Sudholt). Route: 4.1 with
`q_i = (1 − p)^i p` and the geometric sum.

**Checks.**

- For `n ≤ 6` and `p = 1/3, 1/2, 2/3` the exact means equal the formula; for `n = 1` it gives
  `1/(2p)`, and for `n = 0` it gives `0`. With the natural-number exponent `n − 1` in place of
  the integer `1 − n`, `n = 0` would give `1/(2p)` instead.
- At `p = 1` the formula is excluded: Lean's `0⁻¹ = 0` would make it `0`, while the mean is `⊤`
  for `n ≥ 2` (Check of 4.1).

*Needs:* 4.1.

### 4.3 Rate `1/n`

Prove `meanHittingTime_leadingOnes_bounds`: for `n ≥ 2` and rate `1/n`, from a uniform start,
`ofReal ((n² + n)/2) ≤ meanHittingTime … ≤ ofReal (((e − 1) n² + n)/2)`. (Proved here from 4.2;
Doerr, pp. 11–12, gives only the asymptotic form `½ (e − 1 − o(1)) n²` at `p = 1/n`.) Route: at
`p = 1/n` the formula of 4.2 is `(n²/2) (u − (n − 1)/n)` with `u = (1 + 1/(n − 1))^(n−1)`, and
`2 ≤ u ≤ e` by Bernoulli's inequality and `Real.add_one_le_exp`.

**Checks.**

- Exact means for `n = 2, …, 6`: `3, 57/8, 350/27, 10505/512, 93093/3125`; the lower bound `3` is
  attained at `n = 2`, and each mean is at most `((2.718 − 1) n² + n)/2`.
- `n ≥ 2` is needed: for `n = 1` the rate is `1`, the mean is `1/2`, and the lower bound would be
  `1`.

*Needs:* 4.2; Mathlib `Real.add_one_le_exp`, `one_add_mul_le_pow`.

### Examples

- The optimal static rate for LeadingOnes is not `1/n`; Doerr (p. 8) reports that `p = 1.59/n`
  improves the time by about 16%, citing Böttcher, Doerr and Neumann. The formula of 4.2 is
  what such comparisons evaluate.

### Dependencies

4.1 uses 3.1 and Tau Ceti's Markov property. 4.2 uses 4.1. 4.3 uses 4.2.

## Scope and ownership

This roadmap owns: the drift theorems of Layer 1 (additive upper and lower bounds, variable and
multiplicative drift, the multiplicative tail), the drift bound and the fitness-level method
for Markov chains, the elitist mutation chains on bit strings with their objectives OneMax and
LeadingOnes, and the hitting-time results of Layers 3 and 4.

Left to other roadmaps and to the libraries:

- the path law of a Markov chain, its finite-dimensional laws and its Markov property are Tau
  Ceti library, grown from MarkovChainsAndRenewal (Layer 0, items 1–2, and Layer 1, items 1–2);
  this roadmap uses the declarations and restates none;
- the mean hitting time of a set and its characterisation as the least, or for finite chains the
  unique, solution of the first-step equations are HittingAndCoverTimes (1.1–1.3): the
  definition is copied verbatim, and 1.3 is cited in 3.5; 2.1 is a drift bound, not a
  characterisation;
- Mathlib supplies conditional expectation, filtrations, stopping and hitting times, harmonic
  numbers and their logarithmic bounds; optional stopping is used only through the defining
  property of the conditional expectation;
- the coupon-collector union bound for the random walk on the hypercube and its separation
  distance, evolutionarily stable strategies and replicator dynamics are not treated here; the
  identity for electrical networks also called Foster's theorem (the sum over the edges `e` of a
  connected network on `n` vertices of the conductance of `e` times the effective resistance
  between its endpoints is `n − 1`) is unrelated to the drift theorems
  here.

Not treated here: lower bounds under variable or multiplicative drift, negative drift and
concentration of hitting times beyond 1.5; the bound `e n log n − O(n)` for OneMax; runtimes on
all linear functions; populations, crossover and offspring populations; continuous search spaces;
and no-free-lunch theorems for optimization or for learning.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.Filtration`, `MeasureTheory.Adapted` (`Mathlib/Probability/Process/Adapted.lean`:
  each `X t` is `ℱ t`-measurable), `MeasureTheory.IsStoppingTime`, `MeasureTheory.stoppedProcess`
  (`Mathlib/Probability/Process/Stopping.lean`); `MeasureTheory.hittingAfter` and
  `MeasureTheory.Adapted.isStoppingTime_hittingAfter` (for a measurable set and a countable
  well-founded index) (`Mathlib/Probability/Process/HittingTime.lean`);
  `MeasureTheory.Filtration.piLE` (`Mathlib/Probability/Process/Filtration.lean`).
- `MeasureTheory.condExp` with `MeasureTheory.setIntegral_condExp` (for `B ∈ ℱ t` and integrable
  `f`, `∫_B μ[f | ℱ t] = ∫_B f`)
  (`Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`)
  and `MeasureTheory.condExp_mul_of_stronglyMeasurable_left` (pull-out property)
  (`Mathlib/MeasureTheory/Function/ConditionalExpectation/PullOut.lean`).
- `MeasureTheory.lintegral_iSup` (monotone convergence)
  (`Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`);
  `MeasureTheory.tendsto_integral_of_dominated_convergence`
  (`Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`);
  `MeasureTheory.Measure.lintegral_compProd`
  (`Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`); `AntitoneOn.intervalIntegrable`
  and `intervalIntegral` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`).
- `ProbabilityTheory.Kernel.ofFunOfCountable` (`Mathlib/Probability/Kernel/Basic.lean`),
  `measurable_of_countable` (`Mathlib/MeasureTheory/MeasurableSpace/Basic.lean`),
  `ProbabilityTheory.bernoulliMeasure` (`Mathlib/Probability/Distributions/Bernoulli.lean`: mass
  `p` at the first point), `MeasureTheory.Measure.pi`, `ProbabilityTheory.uniformOn`
  (`Mathlib/Probability/UniformOn.lean`), `unitInterval`.
- `harmonic` (`Mathlib/NumberTheory/Harmonic/Defs.lean`), `harmonic_le_one_add_log`
  (`Mathlib/NumberTheory/Harmonic/Bounds.lean`); `Real.add_one_le_exp`,
  `Real.one_sub_div_pow_le_exp_neg` (`(1 − t/n)^n ≤ e^(−t)` for `t ≤ n`)
  (`Mathlib/Analysis/Complex/Exponential.lean`); `one_add_mul_le_pow` (Bernoulli's inequality).

### From Tau Ceti

- `TauCeti.Probability.markovChainLaw` (`TauCeti/Probability/Process/MarkovChain.lean`), with
  `TauCeti.Probability.markovChainLaw_map_eval_zero` (the chain starts from `ν`),
  `TauCeti.Probability.markovChainLaw_map_prefix_succ_eq_compProd` (for s-finite `ν`, the joint
  law of `(X 0, …, X n)` and `X (n+1)` is the prefix law composed with `κ` at the last state),
  `TauCeti.Probability.markovChainLaw_map_prefix_apply_singleton` (measurable singletons: the
  mass of a finite path is the initial weight times the product of transition weights) and
  `MeasureTheory.Measure.markovChainLaw_eq_comp` (the path law is the path-law kernel integrated
  against `ν`).
- `MeasureTheory.Measure.markovChainLaw_map_shift_iterate` (for finite `ν`, the path seen from
  time `n` is the chain started from `(κ ^ n) ∘ₘ ν`)
  (`TauCeti/Probability/MarkovChain/MarkovProperty.lean`); in the same file,
  `MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw` is the conditional-expectation
  form of the Markov property, an alternative for 2.1 when `g` is bounded.
- `MeasureTheory.Filtration.piLE_eq_comap_prefix`
  (`TauCeti/Probability/Process/PathLaw/Filtration.lean`:
  `piLE n` is generated by the prefix of length `n + 1`).

### From TauCetiRoadmap.MarkovChainsAndRenewal

- Layer 0, item 2 (marginals, uniqueness from the prefix recursion, the path-law kernel) and
  Layer 1, item 2 (the path-valued Markov property): consumed through the Tau Ceti declarations
  listed above, which realise them.

### From TauCetiRoadmap.HittingAndCoverTimes

- 1.1 `meanHittingTime` (copied verbatim, with its `variable` line).
- 1.2 `TauCetiRoadmap.HittingAndCoverTimes.isLeast_meanHittingTime` (countable state space: the
  mean hitting time is the least
  solution in `ℝ≥0∞` of the first-step equations), as the alternative route of 2.1.
- 1.3 `TauCetiRoadmap.HittingAndCoverTimes.meanHittingTime_ne_top_and_eq_iff` (finite state
  space, target reachable from every state:
  the mean hitting times are finite and form the unique real solution of the first-step
  equations), in 3.5.

## References

- T. Kötzing and M. S. Krejca, *First-hitting times under additive drift*, arXiv:1805.09415v1
  (2018). Used: the history of the additive drift theorem, pp. 1–2; the convention on `{t < T}`,
  p. 4; Theorem 5 and Example 6, p. 8; Theorem 7, pp. 8–9; Example 8, p. 9; Theorem 9, p. 10;
  Corollary 11, p. 11; Appendix A.
- J. Lengler, *Drift analysis*, arXiv:1712.00964v2 (2018). Used: Algorithm 1 and the definition of
  LeadingOnes, p. 9; Example 4, pp. 13–14; Theorem 18, p. 28.
- B. Doerr, *Probabilistic tools for the analysis of randomized optimization heuristics*,
  arXiv:1801.06733v6 (2021). Used: Theorem 1.8.6 and Lemma 1.8.8; Theorem 1.9.1 and the remark
  before it; Theorem 1.9.4; Lemma 1.10.36(a).
- B. Doerr, *Better runtime guarantees via stochastic domination*, arXiv:1801.04487v5 (2018).
  Used: Algorithm 1, p. 7; Theorem 3, pp. 9–10; the bullets after Corollary 4, pp. 10–12; p. 8.

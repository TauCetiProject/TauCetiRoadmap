# Roadmap: optimal stopping

**Summary.** An optimal stopping problem asks when to stop a random process so as to maximise
the expected reward collected at the moment of stopping, using only the information available
up to that moment. This roadmap treats the discrete-time problem with a finite horizon `N`: a
filtration on a probability space, a real reward process `Z` adapted to it and integrable up to
time `N`, and stopping times bounded by `N`. It then solves two classical problems exactly: the
secretary problem and the prophet inequality. Every target is a theorem, not a procedure. The
headline theorems are these.

- *The Snell envelope.* Define `U N = Z N` and, going backwards, `U n` as the larger of the reward
  `Z n` and the conditional expectation of `U (n + 1)` given the information at time `n`. Then `U`
  is a supermartingale, it dominates the reward up to time `N`, and every supermartingale that
  dominates the reward almost surely up to time `N` dominates `U` almost surely up to time `N`.
- *Optimality of the first meeting time.* For every stopping time `τ` with `n ≤ τ ≤ N`, the
  conditional expectation of `Z τ` given the information at time `n` is at most `U n`. The first
  time from `n` on at which the envelope equals the reward is a stopping time that attains this
  bound. In particular the largest expected reward over stopping times bounded by `N` is the mean of
  `U 0`.
- *The secretary problem.* With `n ≥ 1` candidates arriving in a uniformly random order, and
  decisions based only on the relative ranks of the candidates already seen, the largest probability
  of selecting the best candidate is attained by a threshold rule: pass over the first `r − 1`
  candidates and take the first one that is better than all before it. The best threshold is the
  least `r ≥ 1` with `1/r + 1/(r + 1) + ⋯ + 1/(n − 1) ≤ 1`, and as `n` grows both the optimal
  probability and the best threshold divided by `n` tend to `1/e`.
- *The prophet inequality.* If `X 0, …, X n` are independent and integrable and `X n ≥ 0` almost
  surely, the rule that stops at the first `X i` exceeding half the expected maximum, or at the last
  one, has expected reward at least half the expected maximum. The constant `2` cannot be lowered:
  for every `c < 2` there are two independent nonnegative rewards whose expected maximum exceeds `c`
  times the expected reward of every stopping time of the two.

The roadmap builds on Mathlib's filtrations, stopping and hitting times, conditional
expectation, martingales with their optional stopping, and independence. MarkovDecisionProcesses
proves backward induction for Markov decision processes with countably many states; the envelope
here is built for an arbitrary filtration and does not use that roadmap.

Layer 1 below builds the Snell envelope and its optimality theory. Layer 2 uses it to solve the
secretary problem and proves the two limits. Layer 3, the prophet inequality and the sharpness of
its constant, uses no other layer.

## Conventions

- **Probability space and filtration.** `Ω` carries a measurable space and a probability measure
  `μ` (`IsProbabilityMeasure μ`). A filtration is Mathlib's `MeasureTheory.Filtration ℕ m0`, an
  increasing sequence `𝓕 n` of sub-σ-algebras of the ambient σ-algebra `m0`.
- **Rewards and horizon.** A reward is a process `Z : ℕ → Ω → ℝ`; the horizon is `N : ℕ`, and
  `N = 0` is allowed. Statements assume only what they use on `[0, N]`: `Z n` is
  `𝓕 n`-strongly measurable (`StronglyMeasurable[𝓕 n] (Z n)`) and integrable for every `n ≤ N`;
  nothing is assumed about `Z n` for `n > N`.
- **Conditional expectation.** `μ[f | 𝓕 n]` is Mathlib's `MeasureTheory.condExp`, a fixed
  `𝓕 n`-strongly measurable representative. It is `0` when `f` is not integrable, which is why
  the integrability of the rewards cannot be dropped (Check in 1.1).
- **Stopping times.** A stopping time is `τ : Ω → WithTop ℕ` with Mathlib's `IsStoppingTime 𝓕 τ`,
  that is `{τ ≤ i}` is `𝓕 i`-measurable for every `i`. Every stopping time below is bounded by a
  natural number at every point (`∀ ω, τ ω ≤ N`), so the value `⊤` does not occur. The reward at
  `τ` is `stoppedValue Z τ`, the function `ω ↦ Z (τ ω) ω`.
- **Hitting times.** Mathlib's `hittingBtwn u s n m ω` is the least `k ∈ [n, m]` with
  `u k ω ∈ s`, and `m` when there is none (in particular when `n > m`); it takes values in `ℕ`
  and is coerced to `WithTop ℕ`.
- **Supermartingales.** Mathlib's `Supermartingale V 𝓕 μ`: `V` is strongly adapted, every `V n`
  is integrable, and `μ[V j | 𝓕 i] ≤ V i` almost surely for `i ≤ j`. Supermartingales are indexed
  by all of `ℕ`; the Snell envelope is extended beyond the horizon by the constant `Z N`, and a
  supermartingale given only on `[0, N]` extends in the same way.
- **Relative ranks.** In the secretary problem the candidates are numbered `0, …, n − 1` in order
  of arrival and the relative rank of candidate `i` is the number of earlier candidates better
  than it, a value in `{0, …, i}`; relative rank `0` means relatively best. Ranks are indexed by
  `ℕ`, and values at indices `i ≥ n` play no role.

## Layer 1: the Snell envelope

### 1.1 The envelope and its minimality

Define `snellEnvelope μ 𝓕 Z N : ℕ → Ω → ℝ` by `snellEnvelope μ 𝓕 Z N n = Z N` for `n ≥ N` and,
for `n < N`, by
`snellEnvelope μ 𝓕 Z N n ω = max (Z n ω) (μ[snellEnvelope μ 𝓕 Z N (n + 1) | 𝓕 n] ω)`
(recursion on `N − n`). Write `U` for it. By definition `Z n ≤ U n` at every point for `n ≤ N`.

Prove `snellEnvelope_supermartingale`: if `Z n` is `𝓕 n`-strongly measurable and integrable for
every `n ≤ N`, then `U` is a supermartingale (Bingham, §7, Theorem, p. 2, for a finite sample
space; Ferguson, §3.2, Theorem 2, p. 3.5, gives the same recursion for the essential supremum).
Prove `snellEnvelope_le_of_supermartingale`: if `Z n` is integrable for every `n ≤ N`, `V` is a
supermartingale and `Z n ≤ V n` almost surely for every `n ≤ N`, then `U n ≤ V n` almost surely
for every `n ≤ N` (Bingham, §7, Theorem, p. 2). This statement does not need `Z` to be adapted.

Route: `U` is strongly adapted because `μ[· | 𝓕 n]` is `𝓕 n`-strongly measurable and `Z N` is
`𝓕 n`-strongly measurable for `n ≥ N`; it is integrable by induction. The one-step inequality
`μ[U (n + 1) | 𝓕 n] ≤ U n` holds by the definition for `n < N` and with equality for `n ≥ N`
(`condExp_of_stronglyMeasurable`), and `supermartingale_nat` turns it into the supermartingale
property. Minimality is backward induction: `U N = Z N ≤ V N`, and if `U (n + 1) ≤ V (n + 1)`
almost surely then `μ[U (n + 1) | 𝓕 n] ≤ μ[V (n + 1) | 𝓕 n] ≤ V n` by `condExp_mono` and the
supermartingale property, while `Z n ≤ V n`.

**Checks.**
- `N = 0`: `U n = Z 0` for every `n`, a martingale.
- Coin toss: `Ω = {H, T}` with equal weights, `𝓕 0` trivial, `𝓕 1` everything, `N = 1`,
  `Z 0 = 1`, `Z 1 H = 3`, `Z 1 T = 0`. Then `U 1 = Z 1` and `U 0 = max(1, 3/2) = 3/2`.
- The maximum cannot be dropped: with a trivial filtration, `N = 2` and the constant rewards
  `Z = (2, 0, 1)`, the envelope is `(2, 1, 1)`, while the recursion without the maximum,
  `U n = μ[U (n + 1) | 𝓕 n]`, gives `(1, 1, 1)`, which does not dominate `Z 0 = 2`.
- Adaptedness is needed for the first statement: with `N = 0` and `Z 0` not `𝓕 0`-measurable,
  `U 0 = Z 0` is not adapted.
- Integrability is needed for the second statement: take `Ω = (0, 1]` with Lebesgue measure,
  `𝓕 0` trivial, `𝓕 1` the Borel sets, `N = 1`, `Z 0 = −1` and `Z 1 ω = −1/ω`, which is not
  integrable. The constant `V = −1` is a martingale with `Z ≤ V`, but `μ[Z 1 | 𝓕 0] = 0` by the
  convention on non-integrable functions, so `U 0 = max(−1, 0) = 0 > V 0`.

*Needs:* Mathlib `MeasureTheory.condExp`, `stronglyMeasurable_condExp`, `integrable_condExp`,
`condExp_of_stronglyMeasurable`, `condExp_mono`, `Supermartingale`, `supermartingale_nat`.

### 1.2 Optional sampling for supermartingales

Prove: if `V` is a supermartingale and `τ` is a stopping time with `n ≤ τ ≤ N` at every point,
then `μ[stoppedValue V τ | 𝓕 n] ≤ V n` almost surely (proved here; Bingham, §6, Proposition (ii),
p. 1, proves that a stopped supermartingale is a supermartingale on a finite sample space).
Mathlib proves that a stopped submartingale is a submartingale (`Submartingale.stoppedProcess`)
and the unconditional inequality for submartingales and bounded stopping times
(`Submartingale.expected_stoppedValue_mono`); the conditional inequality for supermartingales is
the target.

Route: `−V` is a submartingale (`Supermartingale.neg`), so its process stopped at `τ` is a
submartingale and the process `k ↦ stoppedValue V (min k τ)` is a supermartingale
(`Submartingale.neg`, `stoppedProcess_eq_stoppedValue`). Its supermartingale inequality between
the times `n` and `N` (`Supermartingale.condExp_ae_le`) is the statement, because `min N τ = τ`
and `min n τ = n` at every point.

**Checks.**
- For `τ = n` the statement reads `μ[V n | 𝓕 n] ≤ V n`, an equality.
- The lower bound `n ≤ τ` is needed: for the supermartingale of constants `V k = −k` and the
  stopping time `τ = 0`, the conditional expectation of `V τ` given `𝓕 1` is `0 > V 1 = −1`.

*Needs:* Mathlib `Supermartingale.neg`, `Submartingale.neg`, `Submartingale.stoppedProcess`,
`stoppedProcess_eq_stoppedValue`, `Supermartingale.condExp_ae_le`.

### 1.3 Optimality of the first meeting time

Define `optimalStoppingTime μ 𝓕 Z N n`, the time
`hittingBtwn (fun k ω ↦ U k ω − Z k ω) {0} n N`, coerced to `WithTop ℕ`: the first `k ∈ [n, N]`
with `U k = Z k`. For `n ≤ N` such a `k` exists because `U N = Z N`; for `n > N` the time is `N`.

Prove `condExp_stoppedValue_le_snellEnvelope`: under the hypotheses of 1.1 on `Z`, for every
stopping time `τ` with `n ≤ τ ≤ N` at every point, `μ[stoppedValue Z τ | 𝓕 n] ≤ U n` almost
surely. Prove `condExp_stoppedValue_optimalStoppingTime`: under the same hypotheses, for every
`n`, `optimalStoppingTime μ 𝓕 Z N n` is a stopping time and
`μ[stoppedValue Z (optimalStoppingTime μ 𝓕 Z N n) | 𝓕 n] = U n` almost surely (Bingham, §7,
Proposition, p. 2, and the last Theorem of §7, p. 3; Ferguson, §3.2, equation (11) and Theorem 3,
p. 3.6, in the infinite-horizon setting under the condition A1 there, that the supremum of the
rewards has finite expectation, and the existence of an optimal rule, which A2 there guarantees).

Route: the first statement is 1.2 applied to the supermartingale `U` of 1.1 together with
`stoppedValue Z τ ≤ stoppedValue U τ`, which holds because `τ ≤ N`, and `condExp_mono`. For the
second, the hitting time reads the process only at times in `[n, N]`, where `U − Z` is adapted; it
is therefore also the hitting time of the process equal to `U − Z` up to `N` and to `0` after, which
is a stopping time by `Adapted.isStoppingTime_hittingBtwn`. The equality is backward induction on
`n` from `N`: on the `𝓕 n`-measurable event `{U n = Z n}` the time is `n` and the reward is `U n`;
on its complement `U n = μ[U (n + 1) | 𝓕 n]` at every point and the time is the one started at
`n + 1`, so the tower property (`condExp_condExp_of_le`) and the induction hypothesis give `U n`.
For `n > N` both sides are `Z N`.

**Checks.**
- In the coin toss of 1.1, `U 0 = 3/2 > Z 0 = 1` and `U 1 = Z 1`, so the time from `0` is `1`,
  with conditional expected reward `3/2`; stopping at `0` earns only `1`.
- Ties: for the constant rewards `Z = (1, 1)` with `N = 1`, both `τ = 0` and `τ = 1` are optimal
  and the first meeting time is `0`.
- The one-step look-ahead rule, which stops at the first `n` with `Z n ≥ μ[Z (n + 1) | 𝓕 n]`, is
  not optimal in general: for the constant rewards `Z = (1, 0, 3)` with `N = 2` it stops at `0`
  and earns `1`, whereas `U = (3, 3, 3)` and the first meeting time is `2`.
- For `n > N` the time is `N < n`, and both sides of the equality are `Z N`.

*Needs:* 1.1, 1.2; Mathlib `hittingBtwn`, `hittingBtwn_le`, `hittingBtwn_mem_Icc`,
`Adapted.isStoppingTime_hittingBtwn`, `StronglyAdapted.adapted`, `stoppedValue`,
`integrable_stoppedValue`, `condExp_mono`, `condExp_condExp_of_le`, `condExp_indicator`,
`condExp_of_stronglyMeasurable`.

### 1.4 The value of the problem

Prove `isGreatest_integral_stoppedValue`: under the hypotheses of 1.1 on `Z`, the mean of `U 0` is
the greatest element of the set of expected rewards `μ[stoppedValue Z τ]` over stopping times `τ`
bounded by `N` (Bingham, §7, Theorem, p. 3; Ferguson, Chapter 2, equation (1), p. 2.1, for rewards
that are functions of observations). It is attained by `optimalStoppingTime μ 𝓕 Z N 0`.

Route: integrate the two statements of 1.3 at `n = 0` with `integral_condExp`. The upper bound
also follows from `Submartingale.expected_stoppedValue_mono` applied to `−U` and the stopping
times `0 ≤ τ`.

**Checks.**
- `N = 0`: the only stopping time bounded by `0` is `0`, and the value is the mean of `Z 0`.
- In the coin toss of 1.1 the value is `3/2`, and the two stopping times bounded by `1` that are
  constant earn `1` and `3/2`.

*Needs:* 1.3; Mathlib `integral_condExp`, `Submartingale.expected_stoppedValue_mono`,
`isStoppingTime_const`.

### Examples

The coin toss of 1.1, the constant rewards `(2, 0, 1)` and `(1, 0, 3)`, the non-integrable reward
`−1/ω` on `(0, 1]`, and the secretary problem of Layer 2, whose envelope 2.3 computes.

### Dependencies

Mathlib only: conditional expectation (`MeasureTheory.condExp`, `stronglyMeasurable_condExp`,
`integrable_condExp`, `condExp_of_stronglyMeasurable`, `condExp_mono`, `condExp_condExp_of_le`,
`condExp_indicator`, `integral_condExp`), supermartingales and submartingales (`Supermartingale`,
`supermartingale_nat`, `Supermartingale.neg`, `Submartingale.neg`,
`Supermartingale.condExp_ae_le`, `Submartingale.stoppedProcess`,
`Submartingale.expected_stoppedValue_mono`), stopping times and hitting times
(`IsStoppingTime`, `isStoppingTime_const`, `stoppedValue`, `stoppedProcess_eq_stoppedValue`,
`integrable_stoppedValue`, `hittingBtwn`, `hittingBtwn_le`, `hittingBtwn_mem_Icc`,
`Adapted.isStoppingTime_hittingBtwn`, `StronglyAdapted.adapted`). No other layer.

## Layer 2: the secretary problem

### 2.1 Relative ranks and the reward

Define `IsRelativeRanks μ n R` for `R : ℕ → Ω → ℕ`: the family `R 0, …, R (n − 1)` is independent
(`iIndepFun` over `Fin n`), and for every `i < n` and `k ≤ i`, `μ {R i = k} = 1/(i + 1)`. Define
`rankFiltration R hR`, for measurable `R i`, as Mathlib's natural filtration of `R`, and
`secretaryReward n R : ℕ → Ω → ℝ` as `1` at `(i, ω)` when `i < n`, `R i ω = 0` and `R j ω ≠ 0`
for every `j` with `i < j < n`, and `0` otherwise.

Prove: if `σ` is a uniformly random permutation of `{0, …, n − 1}`, read as the qualities of the
candidates in order of arrival (larger is better), the relative ranks `R i = #{j < i : σ j > σ i}`
satisfy `IsRelativeRanks μ n R`, the map from permutations to rank sequences is a bijection onto
`∏_{i<n} {0, …, i}`, and `secretaryReward n R i = 1` exactly when `σ i = n − 1`, that is when
candidate `i` is the best of all (Ferguson, §2.1, p. 2.2, for independence and uniformity;
proved here). Prove also that for every stopping time `τ` of `rankFiltration R hR` with `τ < n`,
the expected reward at `τ` equals the expected value at `τ` of the adapted reward
`(i + 1)/n · 1{R i = 0}`, the conditional probability that candidate `i` is the best given the
ranks up to `i` (Ferguson, §2.1, equation (2), p. 2.2; proved here).

Route: the bijection is the inversion table of a permutation. A candidate is best of all exactly
when it is relatively best and no later candidate is. Given the ranks up to `i`, the event that
no later rank is `0` is independent of them and has probability `∏_{i<j<n} j/(j + 1) = (i + 1)/n`;
summing over `{τ = i} ∈ 𝓕 i` gives the reduction.

**Checks.**
- For `n = 3` the six permutations give the six rank sequences `(0, a, b)` with `a ≤ 1`, `b ≤ 2`,
  each once, and the best candidate is the last one with rank `0`.
- The condition that no later candidate is relatively best cannot be dropped from the reward:
  with the reward `1{R i = 0}` alone, stopping at candidate `0` (always relatively best) earns
  `1` for every `n`.
- `R 0 = 0` almost surely, since `μ {R 0 = 0} = 1`.

*Needs:* Mathlib `iIndepFun`, `iIndepFun.indepFun_finset`, `Filtration.natural`,
`Measurable.stronglyMeasurable`, `IsStoppingTime`, `stoppedValue`.

### 2.2 Threshold rules

Define `thresholdRule n r R`, the time `hittingBtwn R {0} (r − 1) (n − 1)` coerced to
`WithTop ℕ`: pass over the candidates `0, …, r − 2` and stop at the first relatively best
candidate after them, or at the last candidate if there is none. Define
`thresholdWinProb n r` as `1/n` when `r = 1` and `(r − 1)/n · Σ_{k=r}^{n} 1/(k − 1)` otherwise.

Prove `integral_stoppedValue_thresholdRule`: if the `R i` are measurable,
`IsRelativeRanks μ n R` holds and `1 ≤ r ≤ n`, the threshold rule selects the best candidate with
probability `thresholdWinProb n r` (Ferguson, §2.1, equation (3), p. 2.3). It is a stopping time
of `rankFiltration R hR` by `Adapted.isStoppingTime_hittingBtwn`.

Route: the rule wins exactly when, for some `k` with `r ≤ k ≤ n`, the candidate with index
`k − 1` is the best of all and the best of the candidates with indices below `k − 1` has index
below `r − 1`; by 2.1 this has probability `(1/n) · (r − 1)/(k − 1)` for `r ≥ 2`, and the sum over
`k` is the formula. When there is no relatively best candidate after the first `r − 1`, the rule
stops at the last candidate, who is then not the best, so the forced stop does not change the
winning probability.

**Checks.**
- `n = 4`: the thresholds `r = 1, 2, 3, 4` give `1/4`, `11/24`, `5/12` and `1/4`.
- `r = 1` stops at candidate `0` and wins with probability `1/n`. The general formula read
  literally at `r = 1` has the factor `r − 1 = 0` and would give `0`; the case split is needed.
- `r = n` stops at the last candidate and wins with probability `(n − 1)/n · 1/(n − 1) = 1/n` for
  `n ≥ 2`.
- `p(r + 1) − p(r) = (Σ_{k=r+1}^{n} 1/(k − 1) − 1)/n` for `1 ≤ r < n`, where `p` is
  `thresholdWinProb n`. The tail sum decreases in `r`, so `p(r + 1) > p(r)` exactly for the `r`
  below the least `r` at which the tail sum is at most `1`, and `p(r + 1) ≤ p(r)` from there on.

*Needs:* 2.1; Mathlib `hittingBtwn`, `Adapted.isStoppingTime_hittingBtwn`,
`Filtration.stronglyAdapted_natural`, `StronglyAdapted.adapted`, `iIndepFun`, `stoppedValue`.

### 2.3 Optimality of the best threshold rule

Define `secretaryThreshold n` as the least `r ≥ 1` with `Σ_{k=r+1}^{n} 1/(k − 1) ≤ 1` (an
`sInf` of a set of natural numbers; the set contains `n` when `n ≥ 1`, and `1` when `n = 0`) and
`secretaryValue n` as `thresholdWinProb n (secretaryThreshold n)`.

Prove `secretary_isGreatest`: if the `R i` are measurable, `IsRelativeRanks μ n R` holds and
`n ≥ 1`, then `secretaryValue n` is the greatest expected reward
`μ[stoppedValue (secretaryReward n R) τ]` over stopping times `τ` of `rankFiltration R hR` with
`τ < n` at every point, and the threshold rule with threshold `secretaryThreshold n` attains it
(Ferguson, §2.1, equations (3) and (4), pp. 2.2–2.3).

Route: by 2.1 the problem is the stopping problem of Layer 1 for the adapted reward
`(i + 1)/n · 1{R i = 0}` with horizon `n − 1`. By independence of the ranks, the conditional
expectation of the envelope at `i + 1` given `𝓕 i` is a constant `W i`, nonincreasing in `i`, and
the envelope at `i` is the larger of the reward and `W i`. Since `(i + 1)/n` increases, the set of
times where it is optimal to stop on a relatively best candidate is an interval `[r − 1, n − 1]`,
so the first meeting time of 1.3 is a threshold rule; by 1.4 and 2.2 the value is the largest
`thresholdWinProb n r`, and the difference formula of 2.2 shows that the least maximiser is
`secretaryThreshold n`.

**Checks.**
- For `n = 1, …, 10` the optimal thresholds are `1, 1, 2, 2, 3, 3, 3, 4, 4, 4` and the optimal
  values `1, 1/2, 1/2, 11/24, 13/30, 77/180, 29/70, 459/1120, 341/840, 3349/8400`. They agree
  with the backward induction of Layer 1 carried out over all histories of relative ranks, and
  to three decimals with the table of Ferguson, §2.1, p. 2.3, for `n ≤ 8`.
- `n = 2`: both thresholds win with probability `1/2`; `secretaryThreshold 2 = 1`, since the
  tail sum for `r = 1` is `1/1 = 1 ≤ 1`.
- For `3 ≤ n ≤ 10` the maximiser is unique; by the difference formula of 2.2, a tie between `r`
  and `r + 1` needs `1/r + ⋯ + 1/(n − 1) = 1`.

*Needs:* 1.3, 1.4, 2.1, 2.2; Mathlib `iIndepFun`, `Filtration.natural`.

### 2.4 The limit `1/e`

Prove `tendsto_secretaryValue`: `secretaryValue n → e⁻¹`, and
`tendsto_secretaryThreshold_div`: `secretaryThreshold n / n → e⁻¹` as `n → ∞` (Ferguson, §2.1,
pp. 2.3–2.4, as an approximation; proved here).

Route: `Σ_{k=r+1}^{n} 1/(k − 1)` is `H(n − 1) − H(r − 1)` for the harmonic numbers `H`, and
`H(m) − log m` converges (`Real.tendsto_harmonic_sub_log`). The threshold is the least `r ≥ 1`
with `H(n − 1) − H(r − 1) ≤ 1`, and the convergence gives `log(n/r) → 1` for it, so
`r/n → e⁻¹`. For `r ≥ 2`, `thresholdWinProb n r = (r − 1)/n · (H(n − 1) − H(r − 2))`, which then
tends to `e⁻¹ · 1`.

**Checks.**
- `n = 100`: threshold `38`, value `0.371043` (rounded); `n = 1000`: threshold `369`, value
  `0.368196`; `n = 10⁶`: threshold `367880`, value `0.3678798`, against `e⁻¹ = 0.3678794`.

*Needs:* 2.3; Mathlib `harmonic`, `Real.tendsto_harmonic_sub_log`, `Real.exp`.

### Examples

The six permutations of three candidates, the four threshold rules for four candidates, and the
exact values for `n ≤ 10` of 2.3.

### Dependencies

Layer 1 (1.3 and 1.4, in 2.3). Mathlib `iIndepFun`, `iIndepFun.indepFun_finset`,
`Filtration.natural`, `Measurable.stronglyMeasurable`, `IsStoppingTime`, `stoppedValue`,
`hittingBtwn`, `Adapted.isStoppingTime_hittingBtwn`, `Filtration.stronglyAdapted_natural`,
`StronglyAdapted.adapted`, `harmonic`,
`Real.tendsto_harmonic_sub_log`, `Real.exp`.

## Layer 3: the prophet inequality

### 3.1 The inequality with a single threshold

Prove `prophet_inequality`: let `X 0, …, X n` be independent (`iIndepFun` over `Fin (n + 1)`) and
integrable with `X n ≥ 0` almost surely, let `M` be their pointwise maximum and `t = μ[M]/2`.
Then the time `hittingBtwn X (Set.Ioi t) 0 n`, the first `i ≤ n` with `X i > t` or `n` if there
is none, satisfies `μ[M] ≤ 2 · μ[stoppedValue X τ]`. No measurability is assumed beyond what
integrability gives. When the `X i` are measurable, the time is a stopping time of their
natural filtration bounded by `n`, so the inequality `μ[M] ≤ 2 · sup_τ μ[stoppedValue X τ]` over
those stopping times follows.

This is the prophet inequality of Krengel, Sucheston and Garling (Ferguson, §3.4, equation (21),
p. 3.9). The threshold half the expected maximum is that of Kleinberg and Weinberg (§1), who use
a strict threshold and no forced stop; Ferguson's Theorem 5, p. 3.11, proves the inequality with
a median of `M` as threshold, following Samuel-Cahn, and remarks there that only `X n` needs to
be nonnegative.

Route: let `p = μ{M > t}`. On stopping at `i` by the threshold, `X i = t + (X i − t)⁺`, so the
expected reward is at least `t · p + Σ_{i≤n} μ{X j ≤ t for j < i} · μ[(X i − t)⁺]`, using the
independence of `X i` from `(X j)_{j<i}` (`iIndepFun.indepFun_finset₀`,
`IndepFun.integral_mul_eq_mul_integral`) and `X n ≥ 0` on the event of no threshold stop. Each
probability is at least `1 − p`, and `Σ_i μ[(X i − t)⁺] ≥ μ[(M − t)⁺] ≥ μ[M] − t`, so the reward is
at least `t · p + (1 − p)(μ[M] − t) = t`.

**Checks.**
- `n = 0`: the time is `0` and the statement is `μ[X 0] ≤ 2 μ[X 0]`, which needs `X 0 ≥ 0`; for
  `X 0 = −1` it reads `−1 ≤ −2`, false. So the hypothesis on `X n` is needed.
- Only `X n` needs to be nonnegative: `X 0` uniform on `{−1, 3}` and `X 1 = 1` give `μ[M] = 2`,
  `t = 1`, a stop at `0` when `X 0 = 3` and at `1` otherwise, and expected reward `2`.
- The threshold `μ[M]` in place of half of it fails: for `X 0 = 2` and `X 1 = 3` with probability
  `1/3` and `0` otherwise, `μ[M] = 7/3`; the threshold `7/3` passes over `X 0` and earns
  `μ[X 1] = 1 < 7/6`, while the threshold `7/6` stops at `X 0` and earns `2 ≥ 7/6`.

*Needs:* Mathlib `iIndepFun`, `iIndepFun.indepFun_finset₀`,
`IndepFun.integral_mul_eq_mul_integral`, `hittingBtwn`, `stoppedValue`, `Finset.sup'`,
`integrable_stoppedValue`.

### 3.2 Sharpness of the constant

Prove `prophet_inequality_sharp`: for every `c < 2` there are a probability measure `μ` on `Bool`
and rewards `X : ℕ → Bool → ℝ` with `X 0` and `X 1` independent and nonnegative, such that every
stopping time `τ ≤ 1` of the natural filtration of `X` has
`c · μ[stoppedValue X τ] < μ[max (X 0) (X 1)]` (Ferguson, §3.4, p. 3.10).

Route: take `X 0 = 1`, `X 1 = B` with probability `1/B` and `0` otherwise, and `X i = 0` for
`i ≥ 2`, with `B > max(1, 1/(2 − c))`. The σ-algebra at time `0` is trivial, so a stopping time
bounded by `1` is `0` everywhere or `1` everywhere, and both earn `1`; the expected maximum is
`2 − 1/B > c`.

**Checks.**
- `B = 2`: expected maximum `3/2`, every stopping time earns `1`; `B = 10`: `19/10` against `1`;
  `B = 100`: `199/100` against `1`. The ratio `2 − 1/B` is below `2` for every `B`, so `2` is a
  supremum that is not attained in this family.
- In this family the threshold of 3.1 is `1 − 1/(2B) < 1 = X 0`, so the rule of 3.1 stops at `0`
  and earns `1`, which is the optimal value.

*Needs:* Mathlib `Filtration.natural`, `IsStoppingTime`, `iIndepFun`, `stoppedValue`.

### Examples

The two-variable family of 3.2 for `B = 2, 10, 100`, the negative reward of the first Check of
3.1 and the comparison of the thresholds `μ[M]` and `μ[M]/2` there.

### Dependencies

Mathlib `iIndepFun`, `iIndepFun.indepFun_finset₀`, `IndepFun.integral_mul_eq_mul_integral`,
`hittingBtwn`, `stoppedValue`, `Finset.sup'`, `integrable_stoppedValue`, `Filtration.natural`,
`IsStoppingTime`. No other layer.

## Scope and ownership

This roadmap owns the targets stated above: the finite-horizon Snell envelope of an adapted
integrable reward, its characterization as the least supermartingale dominating the reward,
conditional optional sampling for supermartingales and bounded stopping times, the optimality of
the first time the envelope meets the reward and the value of the problem; the classical
secretary problem on independent uniform relative ranks, the winning probabilities of threshold
rules, the optimality of the best threshold rule and the two limits `1/e`; the prophet
inequality for independent rewards with the threshold half the expected maximum, and the
sharpness of its constant.

Already in the library and therefore not targets: filtrations, natural filtrations, stopping
times, hitting times, stopped values and stopped processes; conditional expectation and its
monotonicity and tower property; martingales, submartingales and supermartingales; the theorem
that a stopped submartingale is a submartingale and optional stopping in expectation for
submartingales and bounded stopping times; independence of families of random variables and the
product formula for expectations; the asymptotics of the harmonic numbers. Each is cited in the
supplier contracts below.

Neighbouring roadmaps:

- MarkovDecisionProcesses (on main), its 2.1, proves backward induction for finite-horizon Markov
  decision processes with countably many states, finitely many actions and bounded rewards, and
  its Downstream consumers note that this covers stopping problems with a stopping action. The
  Snell envelope here is built for an arbitrary filtration and integrable, possibly unbounded,
  rewards, with no Markov structure; nothing of that roadmap is used or restated, and its scope
  excludes optimal stopping as a separate theory.
- MultiArmedBandits (an open roadmap, not on main) studies regret of bandit strategies and states
  no optimal stopping theorem; this roadmap does not depend on it.

Out of scope: infinite-horizon optimal stopping (essential suprema over unbounded stopping
times, the conditions under which an optimal rule exists, the largest optimal stopping time),
continuous time, Markov and monotone stopping problems beyond the secretary problem, Bayes
sequential testing and the sequential probability ratio test, American options, the
full-information secretary problem and other variants, prophet inequalities for dependent,
identically distributed or bounded rewards and for several selections, and every procedure for
computing an envelope.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Process/Filtration.lean`: `MeasureTheory.Filtration` (an increasing
  sequence of sub-σ-algebras of `m0`); `MeasureTheory.Filtration.natural u hum` (for
  `hum : ∀ i, StronglyMeasurable (u i)`, the σ-algebra at `i` generated by `u j` for `j ≤ i`).
- `Mathlib/Probability/Process/Adapted.lean`: `MeasureTheory.Adapted`,
  `MeasureTheory.StronglyAdapted` and `MeasureTheory.StronglyAdapted.adapted`;
  `MeasureTheory.Filtration.stronglyAdapted_natural` (a process is strongly adapted to its
  natural filtration).
- `Mathlib/Probability/Process/Stopping.lean`: `MeasureTheory.IsStoppingTime f τ` for
  `τ : Ω → WithTop ι` (`{τ ≤ i}` is `f i`-measurable for all `i`);
  `MeasureTheory.isStoppingTime_const`; `MeasureTheory.stoppedValue u τ` (`ω ↦ u (τ ω) ω`,
  with a junk value at `⊤`); `MeasureTheory.stoppedProcess` and
  `MeasureTheory.stoppedProcess_eq_stoppedValue` (the stopped process at `i` is the stopped
  value at `min i τ`); `MeasureTheory.integrable_stoppedValue` (for a stopping time bounded by
  `N` and integrable `u n` for all `n`).
- `Mathlib/Probability/Process/HittingTime.lean`: `MeasureTheory.hittingBtwn u s n m` (the least
  `k ∈ [n, m]` with `u k ω ∈ s`, else `m`), `MeasureTheory.hittingBtwn_le` (it is at most `m`),
  `MeasureTheory.hittingBtwn_mem_Icc` (it lies in `[n, m]` when `n ≤ m`), and
  `MeasureTheory.Adapted.isStoppingTime_hittingBtwn` (for a time index that is countable,
  well-founded and conditionally complete, an adapted process and a measurable `s`, it is a
  stopping time).
- `Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`: `MeasureTheory.condExp`
  (`μ[f | m]`, `0` for non-integrable `f` or `m` not below `m0`);
  `MeasureTheory.stronglyMeasurable_condExp`; `MeasureTheory.integrable_condExp`;
  `MeasureTheory.condExp_of_stronglyMeasurable` (`μ[f | m] = f` for `m`-strongly measurable
  integrable `f`, `m ≤ m0`, `μ.trim` σ-finite); `MeasureTheory.condExp_mono` (for integrable
  `f ≤ g` almost everywhere); `MeasureTheory.condExp_condExp_of_le` (the tower property for
  `m₁ ≤ m₂ ≤ m0`); `MeasureTheory.integral_condExp`.
  `Mathlib/MeasureTheory/Function/ConditionalExpectation/Indicator.lean`:
  `MeasureTheory.condExp_indicator` (for integrable `f` and an `m`-measurable set `s`,
  `μ[s.indicator f | m] = s.indicator (μ[f | m])` almost everywhere).
- `Mathlib/Probability/Martingale/Basic.lean`: `MeasureTheory.Martingale`,
  `MeasureTheory.Supermartingale` (strongly adapted, integrable, `μ[f j | ℱ i] ≤ f i` almost
  everywhere for `i ≤ j`), `MeasureTheory.Supermartingale.condExp_ae_le` (that inequality),
  `MeasureTheory.Supermartingale.neg` and `MeasureTheory.Submartingale.neg` (negation exchanges
  the two notions), `MeasureTheory.supermartingale_nat` (for a finite measure, the one-step
  inequality suffices on `ℕ`).
- `Mathlib/Probability/Martingale/OptionalStopping.lean`:
  `MeasureTheory.Submartingale.expected_stoppedValue_mono` (for a submartingale with values in
  an ordered Banach space, a σ-finite filtration and stopping times `τ ≤ π` with `π` bounded,
  `μ[stoppedValue f τ] ≤ μ[stoppedValue f π]`); `MeasureTheory.Submartingale.stoppedProcess`
  (for a real submartingale, a σ-finite filtration and a stopping time `τ`, the stopped process
  is a submartingale). `Mathlib/Probability/Process/Filtration.lean`:
  `MeasureTheory.IsFiniteMeasure.sigmaFiniteFiltration` (under a finite measure every filtration
  is σ-finite).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun` (mutual
  independence of the σ-algebras generated by the functions);
  `ProbabilityTheory.iIndepFun.indepFun_finset` (for measurable functions) and
  `ProbabilityTheory.iIndepFun.indepFun_finset₀` (for almost everywhere measurable functions):
  the tuples over two disjoint finite index sets are independent.
- `Mathlib/Probability/Independence/Integration.lean`:
  `ProbabilityTheory.IndepFun.integral_mul_eq_mul_integral` (for independent almost everywhere
  strongly measurable `X`, `Y`, `μ[X * Y] = μ[X] * μ[Y]`).
- `Mathlib/MeasureTheory/Function/StronglyMeasurable/Basic.lean`: `Measurable.stronglyMeasurable`
  (into a second-countable pseudometrizable space with its Borel σ-algebra, such as `ℕ` or `ℝ`).
- `Mathlib/NumberTheory/Harmonic/Defs.lean`: `harmonic`;
  `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean`: `Real.tendsto_harmonic_sub_log`
  (`harmonic n − log n` converges to the Euler–Mascheroni constant).
- Basic Mathlib: `Finset.sup'`, `Real.exp`, `IsGreatest`, `Filter.Tendsto`.

## References

- Thomas S. Ferguson, *Optimal Stopping and Applications*, online text on the author's page at
  UCLA (`www.math.ucla.edu/~tom/Stopping/Contents.html`), with pages numbered within chapters:
  Chapter 2, equation (1), p. 2.1, and §2.1, equations (2)–(4) and the table, pp. 2.2–2.4;
  Chapter 3, §3.2, Theorems 2 and 3 and equation (11), pp. 3.5–3.6, and §3.4, equation (21),
  the examples and Theorem 5 with the remark after its proof, pp. 3.9–3.11.
- N. H. Bingham, *M3A22 Mathematical Finance*, Lecture 13 (4 November 2016), Imperial College
  London, lecture notes on the author's page (`www.ma.ic.ac.uk/~bin06/M3A22/2016/m3a22l13.pdf`),
  §6 (the stopped supermartingale), §7 (the Snell envelope: the Theorem on minimality, the
  Proposition on the first meeting time and the two optimality Theorems), pp. 1–3. The notes
  work on a finite sample space.
- Robert Kleinberg and S. Matthew Weinberg, *Matroid prophet inequalities*, arXiv:1201.4764,
  version 1 (2012), §1.
- The finite-horizon envelope is due to Snell (1952), the prophet inequality to Krengel and
  Sucheston (1977, 1978) with Garling, and the single-threshold proof to Samuel-Cahn (1984), as
  Ferguson attributes them; those papers were not consulted and carry no locator.

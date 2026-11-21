# Roadmap: series of independent random variables

**Summary.** When does a series `X₀ + X₁ + X₂ + ⋯` of independent real random variables converge?
By Kolmogorov's zero–one law the answer is almost surely yes or almost surely no, and this
roadmap proves the classical criteria that decide which, together with the maximal inequalities
behind them and the strong laws of large numbers that follow from them. Throughout, the variables
are real valued and independent on one probability space, and a series converges when its
partial sums do; nothing is assumed about integrability unless a statement says so.

The headline theorems are these.

- *The three-series theorem.* For independent `Xₙ` and any level `c > 0`, the series `∑ Xₙ`
  converges almost surely if and only if three numerical series converge: `∑ P(|Xₙ| > c)`, the
  series of the means of the truncated variables `Xₙ 1{|Xₙ| ≤ c}`, and the series of their
  variances. In particular the criterion does not depend on the level. For independent random
  signs `εₙ`, it shows that `∑ aₙ εₙ` converges almost surely exactly when `∑ aₙ² < ∞`.
- *Lévy's equivalence theorem.* For partial sums of independent variables, convergence in
  probability implies almost sure convergence to the same limit, and convergence in
  distribution implies almost sure convergence. Both rest on the Lévy–Ottaviani inequality,
  which bounds the probability that some partial sum is large by the probability that the last
  one is.
- *The Marcinkiewicz–Zygmund strong law.* For independent identically distributed `Xₙ` and
  `0 < p < 2`, the normalized sums `(X₀ + ⋯ + Xₙ₋₁) / n^(1/p)` tend to `0` almost surely if and
  only if `E|X₀|^p < ∞` and, when `p ≥ 1`, `E X₀ = 0`. For `p = 1` this is the strong law of
  large numbers with its converse.

The roadmap builds on Mathlib's probability library, which supplies independence, variances, the
almost sure convergence of martingales bounded in `L¹`, the Borel–Cantelli lemmas,
characteristic functions and the strong law of large numbers for identically distributed
variables. StochasticCalculus proves Kolmogorov's maximal inequality for centred partial sums as
a step in approximating Brownian motion by random walks, and this roadmap can use it.
MathematicalStatisticsAsymptotic supplies the Lindeberg–Feller central limit theorem,
one of two routes to the converse half of the three-series theorem. Tau Ceti supplies the
Rademacher law of the random signs.

Layer 1 below proves Kronecker's lemma, a deterministic statement turning convergent series into
vanishing averages. Layer 2 proves the Lévy–Ottaviani inequality and Lévy's inequalities for
symmetric summands. Layer 3 proves the two-series and three-series theorems, Lévy's equivalence
theorem (using the Lévy–Ottaviani inequality) and the criterion for random-sign series. Layer 4
combines Layers 1 and 3 into Kolmogorov's strong law with norming constants and the
Marcinkiewicz–Zygmund strong law.

## Conventions

- **Probability space.** `(Ω, μ)` is a probability space (`IsProbabilityMeasure μ`), and random
  variables are measurable maps `X i : Ω → ℝ`, indexed by `i : ℕ` from `0`. Independence is
  Mathlib's mutual independence `iIndepFun X μ`; identical distribution is `IdentDistrib`.
- **Partial sums.** `partialSum X n ω` is `X 0 ω + ⋯ + X (n − 1) ω`, the sum over
  `Finset.range n`; in particular `partialSum X 0 = 0`. Prose writes `Sₙ` for it.
- **Convergence of a series.** A series `∑ aᵢ` of real numbers converges when its partial sums
  `∑_{i<n} aᵢ` have a limit as `n → ∞`; this is written `∃ l, Tendsto (fun n ↦ ∑ i ∈ range n, a i) atTop (𝓝 l)`.
  Mathlib's `Summable` is unconditional summation; it is used only for series of nonnegative
  terms (probabilities, variances, squares), where it agrees with convergence of the partial
  sums. A random series converges almost surely when its partial sums converge at almost every
  `ω`.
- **Moments.** `μ[X]` is the expectation, `variance X μ` Mathlib's variance. Mathlib's variance
  is `0` for a variable that is not square integrable, so every statement that sums variances
  of unbounded variables assumes `MemLp (X i) 2 μ`; truncated variables are bounded and need no
  such hypothesis.
- **Probabilities.** Probabilities of events are written with `μ.real`, the real-valued
  measure.
- **Junk values.** `x / 0 = 0` in the reals and `0 ^ r = 0` for `r > 0`, so the normalized sums of
  Layer 4 and the quotients `x i / b i` take the value `0` at finitely many indices where the
  norming constant vanishes; this never affects a limit, and every statement is true as written
  at those indices.

## Layer 1: Kronecker's lemma

### 1.1 Kronecker's lemma

Prove `tendsto_sum_div_of_tendsto_sum_div`: let `b : ℕ → ℝ` be monotone with `b n → ∞`, and let
`x : ℕ → ℝ`. If the series `∑ x i / b i` converges, then `(∑_{i<n} x i) / b n → 0` (Durrett,
Theorem 2.5.9, p. 85; Moshayedi, Lemma 8.16, p. 124, where `b` is strictly positive).

- Route: with `B n = ∑_{i<n} x i / b i`, on the range of indices where `b` is positive summation
  by parts (`Finset.sum_range_by_parts`) writes the sum of the `x i` as `b (n − 1) B n` minus a sum
  of the increments `b i − b (i − 1) ≥ 0` against `B i`. Dividing by `b (n − 1)`, the subtracted
  term is a weighted average of the `B i` whose total weight `(b (n − 1) − b m) / b (n − 1)` tends
  to `1` (with `m` the first index where `b` is positive) and whose weight on any fixed initial
  range tends to `0`, so it tends to the same limit as `B n` and the quotient by `b (n − 1)` tends
  to `0`. The quotient by `b n` is that one times `b (n − 1) / b n ∈ (0, 1]`. (Dividing by `b n`
  directly does not give total weight `1`: for `b n = 2^n` it tends to `1/2`.)
- No positivity of `b` is assumed: a monotone sequence tending to infinity is positive from some
  index on, and the finitely many earlier terms contribute a fixed sum divided by `b n`, which
  tends to `0`, whatever junk value `x i / b i` takes when `b i = 0`.

**Checks.**
- `b n = n`, `x n = (−1)^n √n`: the series `∑ (−1)^n / √n` converges, and the ratio
  `(∑_{i<n} x i) / n` is about `−0.0162` at `n = 1000` and about `−0.0005` at `n = 10⁶`.
- `b n = n − 3` (negative for `n < 3`, zero at `n = 3`) with the same `x` gives the same limit `0`;
  the value at `n = 10⁶` is again about `−0.0005`.
- Monotonicity is needed: with `b n = n` for odd `n`, `b n = n²` for even `n` and
  `x n = (−1)^n b n / n` for `n ≥ 1`, `x 0 = 0`, the series `∑ x n / b n = ∑ (−1)^n / n` converges (to
  `−log 2`), but `(∑_{i<n} x i) / b n` is about `n / 4` along odd `n` (`249.75` at `n = 1001`).
- `x n = 1`, `b n = n`: the series `∑ 1 / n` diverges and the ratio is `1` for every `n ≥ 1`, so the
  hypothesis cannot be dropped.

*Needs:* Mathlib `Finset.sum_range_by_parts`.

### Examples

With `b n = n` and `x n = c_n n` for a convergent series `∑ c_n`, Kronecker's lemma says that the
averages of `c_1, 2c_2, …` tend to `0`; this is the form used in 4.1.

### Dependencies

Mathlib only.

## Layer 2: maximal inequalities

### 2.1 The Lévy–Ottaviani inequality

Define `partialSum X n ω` as in the conventions. Prove `levy_ottaviani`: let `X i` be independent
and measurable, `n : ℕ` and `a, c` real. If `c ≤ P(|Sₙ − S_k| ≤ a)` for every `1 ≤ k ≤ n`, then

    c · P(max_{1 ≤ k ≤ n} |S_k| > 2a) ≤ P(|Sₙ| > a)

(Durrett, Exercise 2.5.9, p. 91, which states it for the block `X_{m+1}, …, X_n`, with `c` the
minimum; Itô–Nisio, proof of Theorem 3.1, p. 38, in the ratio form for Banach-space-valued
variables). The statement assumes nothing about `a`, `c` or `n`.

- Route: let `N` be the first `k ∈ [1, n]` with `|S_k| > 2a`. The event `{N = k}` depends on
  `X 0, …, X (k − 1)` and `Sₙ − S_k` on `X k, …, X (n − 1)`, so they are independent
  (`iIndepFun.indepFun_finset`). On `{N = k, |Sₙ − S_k| ≤ a}` one has `|Sₙ| > a`; summing
  `P(N = k) · P(|Sₙ − S_k| ≤ a) ≥ c · P(N = k)` over `k` gives the claim.
- For `n = 0` the maximum is over the empty range and the left side is `0`. For `a < 0` the
  hypothesis at `k = n` reads `c ≤ P(0 ≤ a) = 0`, so the left side is at most `0`.

**Checks.**
- Exact enumeration over 3000 random families of at most four independent variables with
  values in `{−4, …, 4}` and over `a ∈ {−5/2, −2, …, 9/2}` (45000 cases) finds no violation.
- Independence is needed: with `X 0 = Y`, `X 1 = −Y` and `P(Y = 0) = P(Y = 3) = 1/2`, take
  `n = 2`, `a = 1`. Then `S₂ = 0`, the best `c` is `min(P(|Y| ≤ 1), 1) = 1/2`, the left side is
  `1/2 · 1/2 = 1/4` and the right side is `P(0 > 1) = 0`.
- The range `1 ≤ k ≤ n` matters: if `k = 0` were allowed in the maximum but not in the
  hypothesis, then for `n = 0`, `a = −1` and `c = 100` the left side would be `100` and the right
  side `1`.

*Needs:* Mathlib `iIndepFun`, `iIndepFun.indepFun_finset`. (Durrett states it as an exercise;
proved here.)

### 2.2 Lévy's inequalities for symmetric summands

Prove `levy_symmetric`: let `X i` be independent and measurable, and let each `X i` have the law
of `−X i`. Then for every `n : ℕ` and every real `a`

    P(max_{1 ≤ k ≤ n} S_k > a) ≤ 2 P(Sₙ > a)   and   P(max_{1 ≤ k ≤ n} |S_k| > a) ≤ 2 P(|Sₙ| > a).

(P. Lévy, 1937; Durrett, Theorem 5.2.7, p. 278, proves the first inequality for i.i.d. symmetric
summands and `a > 0` with `≥` in place of `>`; the general form is proved here.)

- Route: let `N` be the first `k ∈ [1, n]` with `S_k > a` (respectively `|S_k| > a`). The
  difference `Sₙ − S_k` is independent of `(S_k, 1{N = k})` and symmetric, so
  `P(Sₙ − S_k ≥ 0) ≥ 1/2` and `P(Sₙ − S_k ≤ 0) ≥ 1/2`. For the first inequality, on
  `{N = k, Sₙ − S_k ≥ 0}` one has `Sₙ ≥ S_k > a`. For the second, given `S_k = s` the
  probability that `Sₙ − S_k` is `0` or has the sign of `s` is at least `1/2`, and on that event
  `|Sₙ| ≥ |S_k| > a`. Sum over `k`.
- No hypothesis on `a`: for `a < 0` the right side of the signed inequality is at least
  `2 P(Sₙ ≥ 0) ≥ 1` for `n ≥ 1`, by symmetry of `Sₙ`.

**Checks.**
- Exact enumeration over 1500 random families of at most four independent symmetric variables
  with values in `{−4, …, 4}` and over `a ∈ {−5/2, −2, …, 9/2}` finds no violation of either
  inequality.
- Symmetry is needed: for three independent variables with `P(X = 1) = P(X = −3) = 1/2` and
  `a = 1/2`, the maximum exceeds `1/2` exactly when `X 0 = 1`, with probability `1/2`, while
  `2 P(S₃ > 1/2) = 2 · 1/8 = 1/4`.
- For independent signs `±1` and `n = 2`, `a = 1/2`: `P(max(S₁, S₂) > 1/2) = 1/2` and
  `2 P(S₂ > 1/2) = 2 · 1/4 = 1/2`, so the constant `2` is attained.

*Needs:* Mathlib `iIndepFun`, `iIndepFun.indepFun_finset`, `IdentDistrib`.

### Examples

For independent signs, `n = 2` and `a = 1/2`, the hypothesis of 2.1 at `k = 1` forces
`c ≤ P(|X 1| ≤ 1/2) = 0`, so 2.1 says nothing there, while 2.2 is an equality there (last Check
of 2.2).

### Dependencies

Mathlib only.

## Layer 3: convergence of random series

### 3.1 The two-series theorem

Prove `ae_exists_tendsto_partialSum_of_summable_variance`: let `X i` be independent, measurable
and square integrable. If the series of means `∑ E X i` converges and `∑ Var(X i) < ∞`, the
series `∑ X i` converges almost surely (Durrett, Theorem 2.5.6, p. 84, and Moshayedi,
Theorem 8.11 (i), p. 122, for centred `X i`; the means then add a convergent deterministic
series).

- Route: the centred partial sums `Sₙ − E Sₙ` form a martingale for the natural filtration
  (`iIndepFun.condExp_natural_ae_eq_of_lt`) whose second moments are `∑_{i<n} Var(X i)`
  (`IndepFun.variance_sum`), hence bounded in `L²` and in `L¹`; Mathlib's
  `Submartingale.exists_ae_tendsto_of_bdd` gives almost sure convergence. Durrett's route instead
  applies Kolmogorov's maximal inequality (StochasticCalculus §1.5) to the tails.

**Checks.**
- `X i = ±1/(i + 1)` with independent fair signs: the means vanish and `∑ 1/(i + 1)² = π²/6`,
  so the random harmonic series converges almost surely.
- Square integrability is needed: for independent standard Cauchy variables Mathlib's mean and
  variance are both `0` (the variable is not integrable and its variance is infinite), so the two
  series converge trivially, yet `P(|X i| > 1) = 1/2` for every `i` and, by the second
  Borel–Cantelli lemma, `X i` does not tend to `0`, so the series diverges almost surely.

*Needs:* Mathlib `iIndepFun.condExp_natural_ae_eq_of_lt`, `IndepFun.variance_sum`,
`Submartingale.exists_ae_tendsto_of_bdd`, `MeasureTheory.Martingale`; or StochasticCalculus §1.5
(Kolmogorov's maximal inequality) for Durrett's route.

### 3.2 The three-series theorem

Define `truncate c x`, equal to `x` when `|x| ≤ c` and to `0` otherwise, and `ThreeSeries X c μ`,
the conjunction of: `∑ P(|X i| > c) < ∞`; the series `∑ E[truncate c (X i)]` converges; and
`∑ Var(truncate c (X i)) < ∞`. Prove `ae_exists_tendsto_partialSum_iff_threeSeries`: for
independent measurable `X i` and every `c > 0`, the series `∑ X i` converges almost surely if
and only if `ThreeSeries X c μ` (Durrett, Theorem 2.5.8, p. 85, for sufficiency and
Example 3.4.12, pp. 150–151, for necessity; Moshayedi, Theorem 8.14, p. 123, which also records
that the conditions hold for some `c > 0` exactly when they hold for every `c > 0`).

- Sufficiency: 3.1 applied to the truncated variables, then the first Borel–Cantelli lemma
  (`MeasureTheory.measure_limsup_atTop_eq_zero`) shows `X i = truncate c (X i)` for all but
  finitely many `i`, almost surely.
- Necessity: if the series converges, `X i → 0` almost surely, so `|X i| > c` occurs finitely
  often and the second Borel–Cantelli lemma (`ProbabilityTheory.measure_limsup_eq_one`) gives the
  first series. The truncated series then converges almost surely, and for bounded independent
  summands almost sure convergence forces the variance series to converge. Two routes: the proof
  of Moshayedi, Lemma 8.13, bounds `|E exp(itZ)| ≤ exp(−t²σ²/3)` for a centred `Z` with `|Z| ≤ K`,
  `Var Z = σ²` and `|t| ≤ 1/K`; applied to the centred truncations, which are bounded by `2c`, for
  `|t| ≤ 1/(2c)`, it is compared with the characteristic function of the limit
  (`TendstoInDistribution.tendsto_charFun`, `IndepFun.charFun_map_add_eq_mul`); Durrett's route
  normalizes by the variance and applies the Lindeberg–Feller theorem
  (MathematicalStatisticsAsymptotic §1.2) in dimension one. The series of means then converges
  by 3.1 applied to the centred truncations.

**Checks.**
- `truncate c (−c) = −c` and `truncate c (c) = c`; the level is kept on both sides. Mathlib's
  `ProbabilityTheory.truncation` keeps `(−c, c]`, so for `X = ±c` with probability `1/2` each,
  `truncate` gives mean `0` and variance `c²`, while `truncation` gives mean `c/2` and variance
  `c²/4`.
- The level must be positive: for `X i = ±2^(−i)` with independent fair signs the series
  converges absolutely, but at `c = 0` the first series is `∑ P(X i ≠ 0) = ∞`.
- For `X i = ±1/(i + 1)` with independent fair signs and `c = 1/2`, only `i = 0` is truncated
  to `0`; the first series is `1`, the means vanish and the variances sum to `π²/6 − 1`. At
  `c = 1` nothing is truncated and the sums are `0`, `0` and `π²/6`: both levels certify
  convergence.

*Needs:* 3.1; Mathlib `MeasureTheory.measure_limsup_atTop_eq_zero`,
`ProbabilityTheory.measure_limsup_eq_one`, `TendstoInDistribution.tendsto_charFun`,
`IndepFun.charFun_map_add_eq_mul`, `tendstoInMeasure_of_tendsto_ae`; or
MathematicalStatisticsAsymptotic §1.2 for Durrett's route.

### 3.3 Lévy's equivalence theorem

Prove, for independent measurable `X i`:

- `ae_tendsto_partialSum_of_tendstoInMeasure`: if `Sₙ` converges in probability
  (`TendstoInMeasure`) to some `g : Ω → ℝ`, then `Sₙ → g` almost surely (Durrett,
  Exercise 2.5.10, p. 91; Itô–Nisio, Theorem 3.1, p. 37). No measurability of `g` is assumed:
  limits in probability are unique almost everywhere.
- `ae_exists_tendsto_partialSum_of_tendstoInDistribution`: if `Sₙ` converges in distribution
  (`TendstoInDistribution`) to a random variable `Z` on some probability space, then `Sₙ`
  converges almost surely (Itô–Nisio, Theorem 3.1, p. 37, condition (c), for separable Banach
  spaces).

Route. In probability: `(Sₙ)` is Cauchy in probability; by 2.1 applied to the blocks
`X m, …, X (n − 1)`, `P(max_{m < k ≤ n} |S_k − S_m| > 2ε)` is at most `P(|Sₙ − S_m| > ε)` divided
by a quantity tending to `1`, so the oscillation of `(Sₙ)` beyond `m` tends to `0` in probability
as `m → ∞` and the partial sums are almost surely Cauchy; the almost sure limit agrees almost
everywhere with `g` (`tendstoInMeasure_of_tendsto_ae`). In distribution: the characteristic
functions satisfy `φ_{Sₙ} = φ_{S_m} φ_{Sₙ − S_m}` by independence; `φ_{Sₙ} → φ_Z` with `φ_Z`
continuous and `φ_Z(0) = 1`, so on a neighbourhood `|t| < δ` of `0` the factors
`φ_{Sₙ − S_m}(t)` tend to `1` as `m, n → ∞`. The inequality `|φ(t + s) − φ(t)|² ≤ 2 |1 − φ(s)|`,
valid for every characteristic function (Itô–Nisio, p. 37), gives
`|1 − φ(2t)| ≤ |1 − φ(t)| + (2 |1 − φ(t)|)^(1/2)` and so spreads this convergence to every `t`;
then `measureReal_abs_gt_le_integral_charFun` with dominated convergence on `[−2/r, 2/r]` gives
`P(|Sₙ − S_m| > r) → 0` for every `r > 0`, and the Cauchy-in-probability argument above concludes
(Itô–Nisio prove this implication on pp. 38–39 by tightness instead).

**Checks.**
- Independence is needed: on `[0, 1]` with Lebesgue measure, let `Sₙ` be the indicators of the
  dyadic intervals `[j 2^(−k), (j + 1) 2^(−k)]` listed level by level and `X n = S (n + 1) − S n`
  (with `S 0 = 0`). Then `Sₙ → 0` in probability (`P(Sₙ ≠ 0) = 2^(−k)` on level `k`), but at every
  point `Sₙ = 1` infinitely often, so `Sₙ` converges nowhere.
- The converse implications (almost sure convergence implies convergence in probability and in
  distribution) hold for all sequences of measurable random variables on a probability space and
  are Mathlib's (`tendstoInMeasure_of_tendsto_ae`, `TendstoInMeasure.tendstoInDistribution`).

*Needs:* 2.1; Mathlib `TendstoInMeasure`, `tendstoInMeasure_of_tendsto_ae`,
`TendstoInMeasure.exists_seq_tendsto_ae`, `TendstoInDistribution`,
`TendstoInDistribution.tendsto_charFun`, `IndepFun.charFun_map_add_eq_mul`,
`measureReal_abs_gt_le_integral_charFun`.

### 3.4 Series with random signs

Prove `ae_exists_tendsto_sum_mul_rademacher_iff`: let `ε i` be independent with the Rademacher
law (`HasLaw (ε i) TauCeti.Probability.rademacherMeasure μ`, so `P(ε i = 1) = P(ε i = −1) = 1/2`),
and let `a : ℕ → ℝ`. The series `∑ a i ε i` converges almost surely if and only if
`∑ a i² < ∞` (Moshayedi, Example 8.12, p. 122; Durrett, Example 2.5.7, p. 85, for
`a i = i^(−α)`).

- Route: if `∑ a i² < ∞`, apply 3.1 (means `0`, variances `a i²`). Conversely apply 3.2 at
  level `c = 1`: the first series forces `|a i| ≤ 1` for all large `i`, and then the truncated
  variances are `a i²`.

**Checks.**
- `a i = 1/(i + 1)`: converges almost surely. `a i = 1/√(i + 1)`: `∑ a i² = ∑ 1/(i + 1)` diverges,
  so the series diverges almost surely although its terms tend to `0`.
- `a i = (−1)^i` fixed signs: the series `∑ a i ε i` has terms of absolute value `1` and diverges,
  matching `∑ a i² = ∞`.

*Needs:* 3.1, 3.2; Tau Ceti `TauCeti.Probability.rademacherMeasure`,
`TauCeti.Probability.integral_id_rademacherMeasure`,
`TauCeti.Probability.variance_id_rademacherMeasure`; Mathlib `HasLaw`.

### Examples

The random harmonic series `∑ ±1/(i + 1)` converges almost surely by 3.1 and 3.4, and the series
`∑ ±(i + 1)^(−α)` converges almost surely exactly for `α > 1/2`, while it converges absolutely
only for `α > 1`.

### Dependencies

3.1 uses Mathlib's martingale convergence (or StochasticCalculus §1.5). 3.2 uses 3.1 and, for
Durrett's route to necessity, MathematicalStatisticsAsymptotic §1.2. 3.3 uses 2.1. 3.4 uses 3.1
and 3.2 and Tau Ceti's Rademacher law.

## Layer 4: strong laws

### 4.1 Kolmogorov's strong law with norming constants

Prove `ae_tendsto_sum_sub_integral_div`: let `X i` be independent, measurable and square
integrable, and let `b : ℕ → ℝ` be monotone with `b n → ∞`. If `∑ Var(X i) / b i² < ∞`, then
`(∑_{i<n} (X i − E X i)) / b n → 0` almost surely (Durrett, Exercise 2.5.4 (i), p. 90, for
`b n = n`; Moshayedi, Proposition 8.17, p. 124, states the case `b n = n` but omits the
independence hypothesis, which the third Check shows is needed).

- Route: 3.1 applied to `(X i − E X i) / b i` (with the finitely many indices where `b i ≤ 0`
  moved into a fixed prefix), then 1.1. Durrett's proof of Theorem 2.5.11, p. 87, is this route
  with `b n = √n (log n)^(1/2 + δ)`.

**Checks.**
- `b n = n` and `Var(X i) = (i + 1)^(2β)`: the hypothesis holds exactly for `β < 1/2`.
- For `b n = n` the condition is sharp (Durrett, Exercise 2.5.4 (ii), p. 90): for any `σᵢ² ≤ i²`
  with `∑ σᵢ²/i² = ∞` there are independent centred `X i` with `Var(X i) ≤ σᵢ²` whose averages do
  not tend to `0` almost surely.
- Independence is needed: if every `X i` equals one fair sign `Y = ±1`, then `∑ Var(X i)/i² < ∞` with
  `b n = n` but the averages are `Y` for every `n ≥ 1`.

*Needs:* 1.1, 3.1.

### 4.2 The Marcinkiewicz–Zygmund strong law

Prove `ae_tendsto_partialSum_div_rpow_iff`: let `X i` be independent, measurable and identically
distributed, and `0 < p < 2`. Then `Sₙ / n^(1/p) → 0` almost surely if and only if
`E|X 0|^p < ∞` and, when `p ≥ 1`, `E X 0 = 0` (Durrett, Theorem 2.5.12, p. 87, for `1 < p < 2`,
and Exercise 2.5.2, p. 90, for the necessity of `E|X 0|^p < ∞` for every `p > 0`; the case
`p = 1` of the sufficiency is Mathlib's strong law, and its converse is the necessity argument
below; the case `0 < p < 1` is due to Marcinkiewicz and Zygmund, 1937).

- Sufficiency: truncate at `k^(1/p)`; the first Borel–Cantelli lemma removes the truncation, the
  variance series `∑ Var(Y_k)/k^(2/p)` is finite because `p < 2`, and 3.1 with 1.1 gives
  `n^(−1/p) ∑ (Y_k − E Y_k) → 0`. For `1 < p < 2` the means are controlled by `E X 0 = 0` as in
  Durrett; for `p = 1` the statement is `ProbabilityTheory.strong_law_ae_real`; for `p < 1`,
  `∑ k^(−1/p) E[|X 0|; |X 0| ≤ k^(1/p)] < ∞` and 1.1 removes the means without centring.
- Necessity: `X n / n^(1/p) → 0` almost surely, so by the second Borel–Cantelli lemma
  `∑ P(|X 0|^p > n) < ∞`, which gives `E|X 0|^p < ∞`. For `p ≥ 1`, `X 0` is then integrable and
  `Sₙ / n = (Sₙ / n^(1/p)) · n^(1/p − 1) → 0`, so `E X 0 = 0` by the strong law.

**Checks.**
- Centring is not needed for `p < 1`: for `X i = 1` and `p = 1/2`, `Sₙ / n² = 1/n → 0`. It is
  needed for `p ≥ 1`: for `X i = 1`, `Sₙ / n = 1` at `p = 1` and `Sₙ / n^(2/3) = n^(1/3) → ∞` at
  `p = 3/2`.
- A standard Cauchy variable has `E|X|^(1/2) = 1/cos(π/4) = √2` (numerical integration agrees),
  so its sums satisfy `Sₙ / n² → 0` almost surely although `E|X| = ∞`. (Here `Sₙ / n` is again
  standard Cauchy, so `Sₙ / n²` is `1/n` times a standard Cauchy variable.)
- `p < 2` is needed: at `p = 2` a standard normal sequence satisfies the right side
  (`E X² = 1`, `E X = 0`), but `Sₙ / √n` is standard normal for every `n` and does not tend to
  `0`.

*Needs:* 1.1, 3.1; Mathlib `ProbabilityTheory.strong_law_ae_real`,
`MeasureTheory.measure_limsup_atTop_eq_zero`, `ProbabilityTheory.measure_limsup_eq_one`,
`IdentDistrib`.

### Examples

For independent identically distributed variables with `E X = 0` and `E X² < ∞`, 4.1 with
`b n = √n (log n)^(1/2 + δ)` for `n ≥ 2` gives `Sₙ / (√n (log n)^(1/2 + δ)) → 0` almost surely
for every `δ > 0` (Durrett, Theorem 2.5.11, p. 87), while 4.2 at `p` close to `2` gives only
`Sₙ / n^(1/p) → 0`.

### Dependencies

4.1 uses 1.1 and 3.1. 4.2 uses 1.1, 3.1 and Mathlib's strong law and Borel–Cantelli lemmas.

## Scope and ownership

This roadmap owns Kronecker's lemma (1.1), the Lévy–Ottaviani inequality (2.1), Lévy's
inequalities for symmetric summands (2.2), the two-series and three-series theorems (3.1, 3.2),
Lévy's equivalence theorem in its in-probability and in-distribution forms for real summands
(3.3), the criterion for series with random signs (3.4), Kolmogorov's strong law with norming
constants (4.1) and the Marcinkiewicz–Zygmund strong law with its converse (4.2), with the
definitions `partialSum`, `truncate` and `ThreeSeries`.

Already in the libraries and therefore not targets:

- Mathlib: independence and its consequences for disjoint blocks; the variance of a sum of
  independent variables; Kolmogorov's zero–one law
  (`ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`), which shows that the
  event of convergence of `∑ X i` has probability `0` or `1`; both Borel–Cantelli lemmas; the
  almost sure convergence of `L¹`-bounded submartingales; convergence in measure and in
  distribution, with characteristic functions; the strong law of large numbers for pairwise
  independent identically distributed variables (`ProbabilityTheory.strong_law_ae_real`, Etemadi's
  form), which is the case `p = 1` of the sufficiency in 4.2.
- Tau Ceti: the Rademacher law and its moments; the specialization of the strong law to
  countable product measures and its infinite-mean form
  (`TauCeti/Probability/StrongLaw.lean`), which this roadmap does not use.

Left to other roadmaps:

- StochasticCalculus §1.5 proves, as a step of the random-walk approximation of Brownian motion,
  Kolmogorov's maximal inequality `P(max_{k ≤ n} |∑_{j<k} Z_j| ≥ λ) ≤ ∑_{j<n} E[Z_j²] / λ²` for
  independent centred `Z_j` and `λ > 0`. It is not restated here; 3.1 can use it.
- MathematicalStatisticsAsymptotic §1.2 owns the Lindeberg–Feller central limit theorem, used in
  one route to the necessity half of 3.2.
- MarkovDecisionProcesses §6.1 proves a stochastic-approximation lemma whose special case
  `α t = 1/(t + 1)` is a strong law for martingale differences with bounded conditional
  variance. It is not used here; 4.1 is about independent summands with arbitrary norming
  constants.

Outside the scope: random series in Banach spaces and the Itô–Nisio theorem beyond the real
line; the law of the iterated logarithm and the exponential inequalities behind it; central and
local limit theorems; rates in the strong law beyond the example of Layer 4; Feller's theorem
for infinite means; martingale analogues of the series criteria.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun` (mutual
  independence of a family of functions); `ProbabilityTheory.iIndepFun.indepFun_finset` (for
  disjoint finite index sets `S`, `T` and measurable members, the vectors indexed by `S` and by
  `T` are independent).
- `Mathlib/Probability/IdentDistrib.lean`: `ProbabilityTheory.IdentDistrib` (almost everywhere
  measurable with equal laws). `Mathlib/Probability/HasLaw.lean`: `ProbabilityTheory.HasLaw`
  (almost everywhere measurable with the given law).
- `Mathlib/Probability/Moments/Variance.lean`: `ProbabilityTheory.variance` (the real part of
  `evariance`, so `0` when the variance is infinite); `ProbabilityTheory.IndepFun.variance_sum`
  (for square-integrable, pairwise independent summands the variance of a finite sum is the sum
  of the variances).
- `Mathlib/Probability/BorelCantelli.lean`:
  `ProbabilityTheory.iIndepFun.condExp_natural_ae_eq_of_lt` (for `i < j`, the conditional
  expectation of `f j` given the natural filtration at `i` is the constant `E f j`);
  `ProbabilityTheory.measure_limsup_eq_one` (second Borel–Cantelli lemma for independent
  measurable sets with divergent sum of measures).
- `Mathlib/MeasureTheory/OuterMeasure/BorelCantelli.lean`:
  `MeasureTheory.measure_limsup_atTop_eq_zero` (first Borel–Cantelli lemma).
- `Mathlib/Probability/Martingale/Basic.lean`: `MeasureTheory.Martingale`.
  `Mathlib/Probability/Martingale/Convergence.lean`:
  `MeasureTheory.Submartingale.exists_ae_tendsto_of_bdd` (a submartingale bounded in `L¹`
  converges almost everywhere, on a finite measure space).
- `Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`: `MeasureTheory.TendstoInMeasure`;
  `MeasureTheory.tendstoInMeasure_of_tendsto_ae` (on a finite measure space, almost everywhere
  convergence of almost everywhere strongly measurable functions implies convergence in
  measure); `MeasureTheory.TendstoInMeasure.exists_seq_tendsto_ae` (a subsequence converges
  almost everywhere).
- `Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`:
  `MeasureTheory.TendstoInDistribution` (weak convergence of the laws in `ProbabilityMeasure E`,
  with almost everywhere measurability of the variables and the limit);
  `MeasureTheory.TendstoInMeasure.tendstoInDistribution` (convergence in measure of almost
  everywhere measurable variables implies convergence in distribution).
  `Mathlib/MeasureTheory/Measure/LevyConvergence.lean`:
  `MeasureTheory.TendstoInDistribution.tendsto_charFun` (pointwise convergence of the
  characteristic functions).
- `Mathlib/Probability/Independence/CharacteristicFunction.lean`:
  `ProbabilityTheory.IndepFun.charFun_map_add_eq_mul` (the characteristic function of a sum of
  two independent variables is the product).
  `Mathlib/MeasureTheory/Measure/IntegralCharFun.lean`:
  `MeasureTheory.measureReal_abs_gt_le_integral_charFun` (for a probability measure on `ℝ` and
  `r > 0`, `μ{|x| > r} ≤ (r/2) ‖∫_{−2/r}^{2/r} (1 − φ(t)) dt‖`).
- `Mathlib/Probability/StrongLaw.lean`: `ProbabilityTheory.strong_law_ae_real` (for integrable,
  pairwise independent, identically distributed real `X i`, `(∑_{i<n} X i)/n → E X 0` almost
  surely); `ProbabilityTheory.truncation` (named in a Check of 3.2 only).
- `Mathlib/Probability/Independence/ZeroOne.lean`:
  `ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop` (Kolmogorov's zero–one
  law; named in the scope only).
- `Mathlib/Algebra/BigOperators/Module.lean`: `Finset.sum_range_by_parts` (summation by parts).

### From Tau Ceti

- `TauCeti/Probability/Distributions/Rademacher/Basic.lean`:
  `TauCeti.Probability.rademacherMeasure` (the law on `ℝ` with mass `1/2` at `−1` and at `1`),
  `TauCeti.Probability.integral_id_rademacherMeasure` (mean `0`),
  `TauCeti.Probability.variance_id_rademacherMeasure` (variance `1`).

### From TauCetiRoadmap.StochasticCalculus

- §1.5 (random-walk approximation): Kolmogorov's maximal inequality for independent centred
  square-integrable `Z_j` and `λ > 0`, as quoted in the scope above; an alternative input to 3.1.

### From TauCetiRoadmap.MathematicalStatisticsAsymptotic

- §1.2: the Lindeberg–Feller theorem `tendstoInDistribution_sum_of_lindeberg` for triangular
  arrays of row-wise independent centred square-integrable vectors in `EuclideanSpace ℝ (Fin k)`,
  used with `k = 1` in one route to the necessity half of 3.2.

## References

- Rick Durrett, *Probability: Theory and Examples*, fifth edition, version of 11 January 2019
  (file `PTE5_011119.pdf` on the author's page at Duke University); the theorem, example,
  exercise and page numbers above are those of that version.
- Nima Moshayedi, *Lectures on Probability Theory*, arXiv:2010.16280v1 (2020); Chapter 4, §8.2.
- Kiyosi Itô and Makiko Nisio, *On the convergence of sums of independent Banach space valued
  random variables*, Osaka Journal of Mathematics 5 (1968), 35–48, open copy at the University of
  Osaka's repository (doi:10.18910/11410).
- Attributions made in prose without a locator: A. N. Kolmogorov and A. Khinchin (the two- and
  three-series theorems, 1925–1928); P. Lévy (the equivalence theorem and the inequalities for
  symmetric summands, 1937); G. Ottaviani (1939); J. Marcinkiewicz and A. Zygmund (the strong law
  for `0 < p < 2`, 1937); H. Rademacher (series with random signs, 1922).

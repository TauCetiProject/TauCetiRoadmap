# Roadmap: from the binomial tree to Black–Scholes

**Summary.** The Cox–Ross–Rubinstein tree prices an option in discrete time: over `N` periods
the stock moves up by the factor `u` or down by `d`, money in the bank grows by a fixed factor
per period, and the price of a claim is its discounted mean under the unique probability that
makes the discounted stock a martingale. This roadmap proves that, when the horizon `T` is fixed,
the tree is refined with `u = e^(σ√(T/N))`, `d = 1/u` and a bank factor `e^(rT/N)` per period,
and `N` tends to infinity, the tree prices converge to the Black–Scholes prices. Throughout, the
volatility `σ` is positive, the interest rate `r` is any real number, and the initial spot `s` is
positive.

The headline theorems are these.

- *The risk-neutral probability.* The up-probability of the tree with `N` periods is
  `1/2 + ((r − σ²/2)/(2σ)) √(T/N)` up to an error that, multiplied by `N^(3/2)`, tends to
  `(12r² − 4rσ² + σ⁴) T^(3/2)/(48σ)`. There is no term of order `1/N`.
- *The log-return in law.* Under that probability the logarithm of the terminal stock price
  divided by the initial one converges in law to the Gaussian law with mean `(r − σ²/2) T` and
  variance `σ² T`.
- *Prices of bounded payoffs.* For every payoff that is continuous and bounded on the positive
  half-line, for instance the put, the tree prices converge to the discounted mean of the payoff of
  `s e^((r − σ²/2)T + σ√T Z)` with `Z` standard Gaussian.
- *The call.* For a positive strike and `T > 0` the tree prices of the call converge to the
  Black–Scholes price `s Φ(d₊) − K e^(−rT) Φ(d₋)`. The call payoff is unbounded; the route goes
  through the put and put–call parity in the tree.

The tree, its no-arbitrage criterion and its unique martingale measure come from
DiscreteTimeFinance, whose price process and product measure are used here as they are. The
limit objects are the Black–Scholes prices of Tau Ceti's finance library, the closed forms that
FinancialMathematics treats in the continuous-time market. The convergence in law rests on the
Lindeberg–Feller theorem of MathematicalStatisticsAsymptotic, applied to a triangular array of
two-point laws.

Layer 1 below fixes the tree with `N` periods and proves the expansion of its risk-neutral
probability. Layer 2 proves the convergence in law of the log-return. Layer 3 proves the
convergence of prices: bounded continuous payoffs first, then the call.

## Conventions

- **The tree.** The paths of the tree with `N` periods are `Fin N → Bool`; `true` is an up move.
  Prices are discounted, as in DiscreteTimeFinance Layer 4: with the gross moves `u > d` of the
  stock and the bank factor `B` per period, the discounted returns are `b = u/B − 1` (up) and
  `a = d/B − 1` (down), and `crrPrice N S₀ a b t ω` is the discounted price at time `t`. The
  measure `crrMeasure N q` gives a path with `k` up moves the mass `q^k (1 − q)^(N − k)`, clipped
  at `0` by `ENNReal.ofReal`; for `N ≥ 1` it is a probability measure exactly when `0 ≤ q ≤ 1`.
- **The refinement.** For `T > 0` and `N ≥ 1`, write `h = √(T/N)`. The tree with `N` periods over
  `[0, T]` has `u = e^(σh)`, `d = e^(−σh) = 1/u` and `B = e^(rT/N) = e^(rh²)`. The bank account over
  the whole horizon is then exactly `B^N = e^(rT)`, the continuous-time bank account at `T`, so the
  discount factor of a claim paid at `T` is `e^(−rT)` for every `N`. (With the simple per-period
  rate `B = 1 + rT/N`, as in Bingham's notes, the factor `(1 + rT/N)^(−N)` only tends to `e^(−rT)`.)
- **The risk-neutral probability.** It is `q = −a/(b − a) = (B − d)/(u − d)`, the up-probability
  of the unique martingale measure of DiscreteTimeFinance 4.3. Here
  `2q − 1 = (e^(rh²) − cosh(σh)) / sinh(σh)`.
- **When the tree is free of arbitrage.** For `σ > 0`, `T > 0` and `N ≥ 1`: `b > 0` iff `rh < σ`
  and `a < 0` iff `−rh < σ`, so `a < 0 < b` iff `r² T < σ² N`. For `r = 0` this holds for every
  `N ≥ 1`; for `r ≠ 0`, of either sign, it holds exactly when `N > r² T/σ²`. Always `a > −1`, since
  `d/B > 0`. So for `N > r² T/σ²` DiscreteTimeFinance 4.2 gives no arbitrage, 4.3 gives the
  unique equivalent martingale measure `crrMeasure N q` (for any reference measure charging every
  path), and 1.3 with 2.2 there make the tree price `crrEuropeanPrice` of 1.1 the initial
  capital of the replicating strategy. For `N ≤ r² T/σ²` the tree has an arbitrage and `q` lies
  outside `(0, 1)`; for `N < r² T/σ²` the measure `crrMeasure N q` is not a probability measure.
  The definitions still have values, and every theorem below is a statement about large `N` only.
- **Degenerate parameters.** `N = 0` gives `T/N = 0` in Lean, so `a = b = 0`; `T = 0` gives the
  same. Then `q = −0/0 = 0`, `crrMeasure N 0` is the point mass at the path with no up move, and
  the tree is constant. For `T < 0`, `√(T/N) = 0` and the tree is constant again but its bank
  account is `e^(rT)`. These values matter only for the hypotheses on `T` below. At `T = 0` the
  statements of 2.1 and 3.1 concern the constant tree, on which every probability measure on the
  paths gives the same means; `crrMeasure N 0` is such a measure, so these cases would hold equally
  for any value of `q` in `[0, 1]`.
- **The orientation.** `σ > 0` is the case in which the up move is the larger return (`a < b`),
  which is the convention of DiscreteTimeFinance 4.2 and 4.3 and of Tau Ceti's Black–Scholes
  formulas.
- **Black–Scholes objects.** `TauCeti.BlackScholes.terminalSpot s r σ τ z` is
  `s e^((r − σ²/2)τ + σ√τ z)`, `TauCeti.BlackScholes.riskNeutralPrice h s r σ τ` is
  `e^(−rτ) ∫ h(terminalSpot s r σ τ z) dN(0, 1)(z)` (zero when the payoff is not integrable),
  and `TauCeti.BlackScholes.callPrice s r σ K τ` and `TauCeti.BlackScholes.putPrice s r σ K τ`
  are `s Φ(d₊) − K e^(−rτ) Φ(d₋)` and `K e^(−rτ) Φ(−d₋) − s Φ(−d₊)` with
  `d₊ = (log(s/K) + (r + σ²/2)τ)/(σ√τ)`, `d₋ = d₊ − σ√τ` and `Φ = cdf (gaussianReal 0 1)`.
- **Convergence in law.** Mathlib's `MeasureTheory.TendstoInDistribution` asks every measure of
  the sequence to be a probability measure, which `crrMeasure N q` is not for small `N`. Layer 2
  therefore states convergence in law in the equivalent form: the means of every bounded
  continuous function converge
  (`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`).

**Checks.**
- With `σ = log 2`, `T = 2`, `N = 2` (so `h = 1`) and `r = log(5/4)`: `u = 2`, `d = 1/2`,
  `B = 5/4`, `a = −3/5`, `b = 3/5`, `q = 1/2`, and `r² T = 2 log²(5/4) < 2 log² 2 = σ² N`.
- With the same `σ`, `T`, `N` and `r = 0`: `q = (1 − 1/2)/(2 − 1/2) = 1/3`. In general, for `r = 0`,
  `q = 1/(1 + e^(σh)) < 1/2`.
- The no-arbitrage bound is sharp: for `r = σ = T = 1` and `N = 1`, `b = e^0 − 1 = 0`, so there is
  an arbitrage, while for `N = 2`, `b = e^(1/√2 − 1/2) − 1 > 0` and `a < 0`; the same holds for
  `r = −1` with the roles of `a` and `b` exchanged.
- For `N = 2` and `q = 3/2`, the masses `9/4, −3/4, −3/4, 1/4` of the four paths are clipped to
  `9/4, 0, 0, 1/4`, so `crrMeasure 2 (3/2)` has total mass `5/2`.

## Layer 1: the tree with `N` periods and its risk-neutral probability

### 1.1 The tree, its prices and its log-return

`crrPrice` and `crrMeasure` are copied verbatim from DiscreteTimeFinance 4.1. Define, for
`r σ T : ℝ` and `N : ℕ`,

- `crrDownReturn r σ T N = e^(−σ√(T/N) − rT/N) − 1` and
  `crrUpReturn r σ T N = e^(σ√(T/N) − rT/N) − 1`, the discounted returns `a` and `b`
  of the refinement;
- `crrRiskNeutralProb r σ T N = −a/(b − a)`, the up-probability `q`;
- `crrLogReturn r σ T N ω = log(e^(rT) · crrPrice N 1 a b N ω 0)`, the logarithm of the
  undiscounted terminal price of the tree started at `1`, which is `log(S_N/S_0)` for every
  initial spot `S_0 ≠ 0`;
- `crrEuropeanPrice h s r σ T N`, equal to
  `e^(−rT) ∫ h(e^(rT) · crrPrice N s a b N ω 0) d(crrMeasure N q)(ω)`,
  the tree price at time `0` of the claim paying `h(S_N)` at `T` from the spot `s`.

Facts used below:

- `crrPrice N s a b N ω 0 = s · crrPrice N 1 a b N ω 0`, and `e^(rT) · crrPrice N 1 a b N ω 0`
  is `e^(σh(2k − N))` for a path with `k` up moves, so `crrLogReturn r σ T N ω = σh(2k − N)`
  exactly.
- Under `crrMeasure N q` with `0 ≤ q ≤ 1` the log-return is `x(ε₁ + ⋯ + ε_N)` with `x = σh` and
  independent signs `ε_k = ±1`, `P(ε_k = 1) = q`. Its mean is `N x (2q − 1)` and its variance is
  `N x² · 4q(1 − q)`; here `N x² = σ² T`.
- `q(1 + b) + (1 − q)(1 + a) = 1` whenever `b ≠ a`, so the mean of the discounted terminal price
  under `crrMeasure N q`, for `0 ≤ q ≤ 1`, is the initial price.

**Checks.**
- With `σ = log 2`, `T = 2`, `N = 2`, `r = 0` (`q = 1/3`): the log-return takes the values
  `2 log 2`, `0`, `−2 log 2` with probabilities `1/9`, `4/9`, `4/9`; in units of `log 2` its mean
  is `−2/3 = N(2q − 1)` and its variance `16/9 = N · 4q(1 − q)`.
- With `σ = log 2`, `T = 2`, `N = 2`, `r = log(5/4)` (`q = 1/2`) and `s = K = 1`: the
  undiscounted terminal price is `4, 1, 1/4` with probabilities `1/4, 1/2, 1/4`; the call price is
  `(16/25)(3/4) = 12/25`, the put price is `(16/25)(3/16) = 3/25`, and their difference is
  `9/25 = 1 − 16/25 = s − K e^(−rT)`, put–call parity in the tree.

*Needs:* DiscreteTimeFinance 4.1 (`crrPrice`, `crrMeasure`, copied); Mathlib `Real.exp`,
`Real.log`, `Real.sqrt`. (Definitions.)

### 1.2 The expansion of the risk-neutral probability

Prove `tendsto_crrRiskNeutralProb`: for `σ > 0` and `T > 0`,

    N^(3/2) · (q_N − 1/2 − ((r − σ²/2)/(2σ)) √(T/N)) → (12r² − 4rσ² + σ⁴) T^(3/2) / (48σ),

with `N^(3/2)` written `N · √N` and `T^(3/2)` written `T · √T`. Consequently
`N x_N (2q_N − 1) → (r − σ²/2) T` and `N x_N² · 4q_N(1 − q_N) → σ² T`, with `x_N = σ√(T/N)`: the
mean and variance of the log-return have the limits of 2.1.

Bingham (Lecture 17, p. 3) expands `1 − 2p*` to first order for a different refinement: the
gross moves divided by the simple bank factor `1 + ρT/N` are `e^(±σ/√N)` (the variance per unit
time enters afterwards, by replacing `σ²` with `σ²T`), `p*` is the probability of the down move,
and the remainder is written as dots. The refinement here,
the vanishing of the term of order `1/N` and the third-order coefficient are derived here.
(Proved here.)

Route.
- For `N ≥ 1` put `h = √(T/N) > 0` and `x = σh > 0`. Then `b − a = e^(−rh²)(e^x − e^(−x)) > 0` and
  `q − 1/2 = (e^(rh²) − cosh x) / (2 sinh x)`, by direct computation from the definitions.
- The right side is an odd function of `h` (replacing `h` by `−h` changes the sign of the
  denominator only), which is why no even power of `h` appears. Concretely, for `h ≤ h₀` small
  enough that `|rh²| ≤ 1` and `x ≤ 1`, Mathlib's `Real.exp_bound` (the remainder of the
  exponential series after `n` terms is at most `|y|^n (n + 1)/(n! n)` for `|y| ≤ 1`) gives
  `e^(rh²) = 1 + rh² + r²h⁴/2 + O(h⁶)`, `cosh x = 1 + x²/2 + x⁴/24 + O(x⁶)` and
  `sinh x = x + x³/6 + O(x⁵)` (from `Real.cosh_eq`, `Real.sinh_eq` and the bound for `n = 6` at
  `±x`), with constants depending only on `r` and `σ`.
- Hence the numerator is `(r − σ²/2)h² + (r²/2 − σ⁴/24)h⁴ + O(h⁶)` and the denominator is
  `2σh(1 + σ²h²/6 + O(h⁴))`, so
  `q − 1/2 = ((r − σ²/2)/(2σ)) h + ((r²/2 − rσ²/6 + σ⁴/24)/(2σ)) h³ + O(h⁵)`, and
  `(r²/2 − rσ²/6 + σ⁴/24)/(2σ) = (12r² − 4rσ² + σ⁴)/(48σ)`.
- Multiply by `N√N = T√T / h³` and let `h → 0`.
- The consequences: `N x_N (2q_N − 1) = 2σ√(TN) (q_N − 1/2)`, and `√(TN) √(T/N) = T`; and
  `4q_N(1 − q_N) = 1 − (2q_N − 1)² → 1`.

**Checks.**
- The exact expansion of `q` in powers of `h` gives the coefficients `1/2`,
  `(2r − σ²)/(4σ)`, `0`, `(12r² − 4rσ² + σ⁴)/(48σ)`, `0` of `h⁰` to `h⁴`, and
  `q(−h) = 1 − q(h)` identically.
- For `r = 0` the limit is `σ³ T^(3/2)/48`, the third-order term of `1/(1 + e^(σh)) − 1/2 + σh/4`.
- `T > 0` is needed: for `T = 0`, `q_N = 0` for every `N`, and the left side is `−N√N/2`.
- `σ = 0` must be excluded: for `σ = 0`, `a = b` and `q_N = 0`, and the left side is again
  `−N√N/2`.
- The bank factor matters at third order: with `1 + rT/N` in place of `e^(rT/N)` the same exact
  expansion gives the coefficients `1/2`, `(2r − σ²)/(4σ)`, `0`, `−σ(4r − σ²)/48`, which differs
  from the limit above by `−r²/(4σ)`; for `r = 0` the two refinements coincide.

*Needs:* 1.1; Mathlib `Real.exp_bound`, `Real.cosh_eq`, `Real.sinh_eq`. (Proved here.)

### Examples

The trees with `σ = log 2`, `T = N = 2` and `r = 0` or `r = log(5/4)`; the constant trees at
`N = 0`, `T = 0` and `σ = 0`.

### Dependencies

DiscreteTimeFinance 4.1 (`crrPrice`, `crrMeasure`, copied); Mathlib `Real.exp_bound`,
`Real.cosh_eq`, `Real.sinh_eq`.

## Layer 2: the log-return in law

### 2.1 Convergence in law to the Gaussian

Prove `tendsto_integral_crrLogReturn`: for `σ > 0`, `T ≥ 0` and every bounded continuous
`f : ℝ →ᵇ ℝ`,

    ∫ f(crrLogReturn r σ T N ω) d(crrMeasure N q_N)(ω) → ∫ f dN((r − σ²/2)T, σ²T),

where the Gaussian is Mathlib's `gaussianReal ((r − σ²/2) * T) (σ ^ 2 * T).toNNReal`. For `N`
large the measures are probability measures, and this is convergence in law of the log-return to
`N((r − σ²/2)T, σ²T)` (Bingham, Lecture 17, Lemma, p. 2, and Lecture 18, p. 1, for the refinement
recalled in 1.2; Bingham states the Lemma for an arbitrary row-wise i.i.d. array with
`N µ_N → µ` and variance `σ²(1 + o(1))/N`, which needs in addition a condition such as
Lindeberg's; here every summand is bounded by `2σ√(T/N)`, so that condition holds).

Route (the triangular-array central limit theorem for two-point laws, through
MathematicalStatisticsAsymptotic 1.2).
- `T = 0`: every `crrMeasure N 0` is a point mass, the log-return is `0`, and the limit law is
  `gaussianReal 0 0 = Measure.dirac 0` (Mathlib `gaussianReal_zero_var`).
- `T > 0`: choose `N₀` with `r² T < σ² N` for `N ≥ N₀`. For such `N`, `0 < q_N < 1`, and
  `crrMeasure N q_N` equals `Measure.pi` of the law `q_N δ_true + (1 − q_N) δ_false` on each
  coordinate (both give every path its product mass; Mathlib `Measure.ext_iff_singleton`), so the
  coordinates are independent (Mathlib `iIndepFun_pi`).
- Put `x_N = σ√(T/N)`, `m_N = x_N(2q_N − 1)` and `Y_(N,k) = (±x_N − m_N)` (the sign of the
  coordinate `k`), viewed in `EuclideanSpace ℝ (Fin 1)`. The `Y_(N,k)`, `k < N`, are independent,
  centred and bounded by `2x_N`, so for every `ε > 0` the Lindeberg sum vanishes once `2x_N ≤ ε`;
  their covariance matrices sum to the `1 × 1` matrix `N x_N² · 4q_N(1 − q_N)`, which tends to
  `σ² T` by 1.2. MathematicalStatisticsAsymptotic 1.2 (`tendstoInDistribution_sum_of_lindeberg`,
  with `k = 1`, along the sequence `N₀ + n`) gives `∑_k Y_(N,k) → N(0, σ²T)` in law; Mathlib's
  `measurePreserving_eval_multivariateGaussian` and `TendstoInDistribution.continuous_comp` turn
  the limit in `EuclideanSpace ℝ (Fin 1)` into `gaussianReal 0 (σ² T)` on the line.
- The sum is `crrLogReturn r σ T N − N m_N`, and `N m_N → (r − σ²/2)T` by 1.2. The
  characteristic function of the log-return is `e^(itNm_N)` times that of the sum (Mathlib
  `charFun_map_add_const`), so it tends to `e^(it(r − σ²/2)T − σ²Tt²/2)`, the characteristic
  function of the limit (`charFun_gaussianReal`); Lévy's theorem
  (`ProbabilityMeasure.tendsto_iff_tendsto_charFun`) and
  `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` give the means of `f`, with
  `integral_map` to pass between the law and the path space.
- The same limit follows without the Lindeberg–Feller theorem: for `N ≥ N₀` the characteristic
  function of the log-return is exactly `(q_N e^(itx_N) + (1 − q_N) e^(−itx_N))^N`, and 1.2 gives
  that this is `(1 + (it(r − σ²/2)T − σ²Tt²/2)/N + o(1/N))^N`, so Mathlib's
  `Complex.tendsto_pow_exp_of_isLittleO_sub_add_div` and Lévy's theorem apply.

**Checks.**
- An exact symbolic expansion gives
  `N log(q e^(itσh) + (1 − q) e^(−itσh)) → it(r − σ²/2)T − σ²Tt²/2`
  as `h = √(T/N) → 0`.
- `σ = 0` must be excluded: for `σ = 0` and `T > 0`, `a = b = e^(−rT/N) − 1`, `q_N = 0`, the
  log-return is `log(e^(rT) e^(−rT)) = 0`, while the limit law is the point mass at `rT`; for
  `r ≠ 0` the means of a bounded continuous `f` with `f(0) ≠ f(rT)` do not converge to the right
  value.
- `T ≥ 0` is needed: for `T = −1`, `r = 0`, `σ = 1` the log-return is `0` (the tree is constant,
  and `e^(rT) = 1`), while the limit law is `gaussianReal (1/2) 0`, the point mass at `1/2`.
- The mean of the limit is `(r − σ²/2)T`, not `rT`: the discounted terminal price has mean `1`
  for every `N` with `r²T < σ²N`, and `E e^Y = e^(rT)` for `Y ∼ N((r − σ²/2)T, σ²T)`.

*Needs:* 1.1, 1.2; MathematicalStatisticsAsymptotic 1.2 (`tendstoInDistribution_sum_of_lindeberg`);
Tau Ceti `TauCeti.covMatrix`; Mathlib `Measure.pi`, `Measure.ext_iff_singleton`, `iIndepFun_pi`,
`multivariateGaussian`, `measurePreserving_eval_multivariateGaussian`,
`TendstoInDistribution.continuous_comp`, `charFun_map_add_const`, `charFun_gaussianReal`,
`gaussianReal_zero_var`, `ProbabilityMeasure.tendsto_iff_tendsto_charFun`,
`ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`, `integral_map`; for the second route
`Complex.tendsto_pow_exp_of_isLittleO_sub_add_div`.

### Examples

The tree with `σ = log 2`, `T = N = 2`, `r = 0` and its three log-returns; the constant trees at
`T = 0`, `T < 0` and `σ = 0`.

### Dependencies

Layer 1 (1.1, 1.2); MathematicalStatisticsAsymptotic 1.2; Tau Ceti `TauCeti.covMatrix`; the
Mathlib declarations of 2.1.

## Layer 3: prices

### 3.1 Payoffs bounded on the positive half-line

Prove `tendsto_crrEuropeanPrice`: for `h : ℝ → ℝ` continuous on `(0, ∞)` with `|h x| ≤ C` for all
`x > 0`, and `s > 0`, `σ > 0`, `T ≥ 0`,

    crrEuropeanPrice h s r σ T N → TauCeti.BlackScholes.riskNeutralPrice h s r σ T.

The put payoff `x ↦ (K − x)⁺` with `K ≥ 0` is such an `h` (bounded by `K` on `x > 0`), and for
`s, σ, K, T > 0` the limit is `TauCeti.BlackScholes.putPrice s r σ K T` by Tau Ceti's
`TauCeti.BlackScholes.riskNeutralPrice_put`. Bingham (Lecture 18, p. 1, formula (∗)) writes the
price of a general payoff `h` as this Gaussian integral, by analogy with the call, for which he
justifies the passage to the limit by "standard properties of convergence in distribution"; the
statement here assumes continuity and boundedness on `(0, ∞)`, and the Checks show that neither
can be dropped. (Proved here.)

Route.
- `T = 0`: both sides are `h s` (the tree is constant; Tau Ceti
  `TauCeti.BlackScholes.riskNeutralPrice_zero`).
- `T > 0`: by 1.1 the undiscounted terminal price is `s · e^(crrLogReturn r σ T N ω)`. The function
  `g(y) = h(s e^y)` is continuous on `ℝ` (as `s e^y > 0`; Mathlib `ContinuousOn.comp_continuous`)
  and bounded by `C`, so it is a bounded continuous function (Mathlib
  `BoundedContinuousFunction.mkOfBound`), and 2.1 gives
  `∫ g(crrLogReturn) d(crrMeasure N q_N) → ∫ g dN((r − σ²/2)T, σ²T)`.
- `N((r − σ²/2)T, σ²T)` is the image of `N(0, 1)` under `z ↦ (r − σ²/2)T + σ√T z` (Mathlib
  `gaussianReal_map_const_mul` and `gaussianReal_map_add_const`, with `(σ√T)² = σ²T` since
  `T ≥ 0`), and `s e^((r − σ²/2)T + σ√T z) = TauCeti.BlackScholes.terminalSpot s r σ T z`. Multiply
  by `e^(−rT)`.

**Checks.**
- Boundedness on `(0, ∞)` cannot be dropped: for `h(x) = e^(x²)`, `s = 1` and `T > 0`, every tree
  price is at least `e^(−rT)` (as `h ≥ 1`) once `crrMeasure N q_N` is a probability measure, while
  `x ↦ e^(x²)` composed with the terminal spot is not integrable against `N(0, 1)` (it grows like
  `e^(e^(2σ√T z))`), so `riskNeutralPrice` is `0`.
- Continuity cannot be dropped: let `h` be the indicator of the countable set of all values of
  the undiscounted terminal prices of all trees from `s`, and `T > 0`. Then every tree price is
  `e^(−rT)` for large `N`, while the terminal spot has a density, so the limit side is `0`.
- `s > 0` cannot be dropped: for `s = −1`, `T > 0` and `h(x) = e^((min x 0)²)`, which is `1` on
  `x > 0`, the tree prices are at least `e^(−rT)` while `h ∘ terminalSpot` is not integrable, so
  the limit side is `0`.
- For the put with `σ = log 2`, `T = N = 2`, `r = log(5/4)`, `s = K = 1`, the tree price at
  `N = 2` is `3/25` (1.1).

*Needs:* 1.1, 2.1; Tau Ceti `TauCeti.BlackScholes.riskNeutralPrice`,
`TauCeti.BlackScholes.terminalSpot`, `TauCeti.BlackScholes.riskNeutralPrice_zero`; Mathlib
`ContinuousOn.comp_continuous`, `BoundedContinuousFunction.mkOfBound`,
`gaussianReal_map_const_mul`, `gaussianReal_map_add_const`, `integral_map`.

### 3.2 The call

Prove `tendsto_crrEuropeanPrice_call`: for `s > 0`, `σ > 0`, `K > 0` and `T > 0`,

    crrEuropeanPrice (fun x => (x − K)⁺) s r σ T N → TauCeti.BlackScholes.callPrice s r σ K T,

the Black–Scholes call price `s Φ(d₊) − K e^(−rT) Φ(d₋)` (Bingham, Lecture 18, p. 1, which
identifies the limit with a Gaussian integral and evaluates it; the passage to the limit for the
unbounded call payoff is the route below). (Proved here.)

Route.
- The put: by 3.1 and Tau Ceti's `TauCeti.BlackScholes.riskNeutralPrice_put`, the tree prices of
  `(K − x)⁺` tend to `TauCeti.BlackScholes.putPrice s r σ K T`.
- Parity in the tree: `(x − K)⁺ − (K − x)⁺ = x − K`. For `N` with `r²T < σ²N`, `crrMeasure N q_N`
  is a probability measure and the equivalent martingale measure of the tree
  (DiscreteTimeFinance 4.3, `crr_equivMartingaleMeasures`, with the reference measure
  `crrMeasure N q_N` itself, which charges every path), so the mean of the discounted terminal
  price is the initial price `s`; directly, it is `s (q(1 + b) + (1 − q)(1 + a))^N = s` (1.1).
  Hence the tree call price minus the tree put price is `s − K e^(−rT)` for all such `N`.
- In the limit the call prices tend to `putPrice s r σ K T + s − K e^(−rT)`, which is
  `callPrice s r σ K T` by Tau Ceti's `TauCeti.BlackScholes.putPrice_eq_callPrice`.

**Checks.**
- In the tree with `σ = log 2`, `T = N = 2`, `r = log(5/4)`, `s = K = 1` the call price is
  `12/25` and parity holds exactly (1.1).
- `T > 0` is needed: for `T = 0` the tree price is `(s − K)⁺`, while `callPrice s r σ K 0` has
  `d₊ = d₋ = log(s/K)/0 = 0` in Lean and equals `(s − K)/2`; for `s = 2`, `K = 1` these are `1`
  and `1/2`.
- `K > 0` is needed for this form of the limit: for `K < 0`, `log(s/K)` is `log |s/K|` in Lean,
  and `callPrice s r σ K T` is not the risk-neutral price of `(x − K)⁺ = x − K` on `x > 0`, which is
  `s − K e^(−rT)`; at `s = 1`, `K = −1`, `r = 0`, `σ = 1`, `T = 1` the price is `2`, while
  `callPrice = Φ(1/2) + Φ(−1/2) = 1`.
- `σ > 0` is needed here, not only `σ ≠ 0`: for `s = K = T = 1`, `r = 0` and `σ = −1`, Lean's
  `d₊ = (1/2)/(−1) = −1/2` and `d₋ = d₊ − σ = 1/2`, so `callPrice = Φ(−1/2) − Φ(1/2) < 0`, while
  for `r = 0` every `crrMeasure N q_N`, `N ≥ 1`, is a probability measure and every tree price of
  the call is nonnegative.

*Needs:* 1.1, 3.1; DiscreteTimeFinance 4.3 (`crr_equivMartingaleMeasures`); Tau Ceti
`TauCeti.BlackScholes.callPrice`, `TauCeti.BlackScholes.putPrice`,
`TauCeti.BlackScholes.riskNeutralPrice_put`, `TauCeti.BlackScholes.putPrice_eq_callPrice`.

### Examples

The two-period tree with `u = 2`, `d = 1/2`, `B = 5/4` and its call and put; the constant tree
at `T = 0` against the closed form.

### Dependencies

Layers 1 and 2 (1.1, 2.1, via 3.1); DiscreteTimeFinance 4.3; Tau Ceti's Black–Scholes prices and
their risk-neutral identities.

## Scope and ownership

This roadmap owns the refinement of the Cox–Ross–Rubinstein tree with `u = e^(σ√(T/N))`,
`d = 1/u` and bank factor `e^(rT/N)` (the definitions of 1.1 other than the copied ones), the
expansion of its risk-neutral probability (1.2), the convergence in law of its log-return (2.1),
and the convergence of its prices for payoffs bounded on the positive half-line (3.1) and for the
call (3.2).

Stated by other roadmaps and not restated here:

- DiscreteTimeFinance 4.1 to 4.3 own the tree with fixed discounted returns `a < b`, its
  no-arbitrage criterion `a < 0 < b` (`crr_noArbitrage_iff`) and its unique equivalent martingale
  measure (`crr_equivMartingaleMeasures`); `crrPrice` and `crrMeasure` are copied verbatim, and
  4.2 and 4.3 are used for the refinement in the conventions above and in 3.2. Its 1.3 and 2.2
  (pricing of attainable claims, completeness) identify `crrEuropeanPrice` with the replication
  price; they are cited in the conventions and used in no route. DiscreteTimeFinance lists the
  limit of binomial prices to Black–Scholes prices as not treated there.
- MathematicalStatisticsAsymptotic 1.2 owns the Lindeberg–Feller theorem for triangular arrays.
  The central limit theorem for the two-point arrays of the tree is a step of the route of 2.1,
  not a target.
- FinancialMathematics M0.4 (Black–Scholes calls and puts) treats the call and put of the
  continuous-time Brownian market; its closed-form call price `s Φ(d₊) − K e^(−rτ) Φ(d₋)` is the
  expression of Tau Ceti's `TauCeti.BlackScholes.callPrice` used here. Nothing of the stochastic
  calculus of that roadmap is used: the limits here are limits of numbers and of laws.
- Tau Ceti's `Probability/Finance/BlackScholes/` already has the risk-neutral prices, the closed
  forms, put–call parity and the identities `riskNeutralPrice_call` and `riskNeutralPrice_put`;
  they are used by name. Mathlib has the central limit theorem for i.i.d. sequences
  (`ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum`), which does not apply because the
  law of the steps changes with `N`, and Lévy's continuity theorem.

Not treated here: the convergence of the hedge ratio of the tree to the Black–Scholes delta,
American options (for the call, DiscreteTimeFinance 5.3 identifies the American with the European
price when the bank account is nondecreasing), rates of convergence of option prices, other
refinements of the tree (for instance with a drift in `u` and `d`), and the convergence of the
price process of the tree to geometric Brownian motion.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`
  (`MeasureTheory/Measure/ProbabilityMeasure.lean`): weak convergence of probability measures iff
  convergence of the integrals of bounded continuous real functions.
- `MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun`
  (`MeasureTheory/Measure/LevyConvergence.lean`): Lévy's continuity theorem on finite-dimensional
  spaces.
- `MeasureTheory.TendstoInDistribution` and `MeasureTheory.TendstoInDistribution.continuous_comp`
  (`MeasureTheory/Function/ConvergenceInDistribution.lean`): convergence in law on varying spaces,
  every measure a probability measure, and the continuous mapping theorem.
- `MeasureTheory.charFun_map_add_const` (`MeasureTheory/Measure/CharacteristicFunction/Basic.lean`);
  `ProbabilityTheory.charFun_gaussianReal`, `ProbabilityTheory.gaussianReal_zero_var`,
  `ProbabilityTheory.gaussianReal_map_add_const`, `ProbabilityTheory.gaussianReal_map_const_mul`
  (`Probability/Distributions/Gaussian/Real.lean`; `gaussianReal μ v` has variance `v : ℝ≥0`).
- `ProbabilityTheory.multivariateGaussian`,
  `ProbabilityTheory.measurePreserving_eval_multivariateGaussian` (for `S` positive semidefinite
  the coordinate `i` has law `gaussianReal (μ i) (S i i).toNNReal`)
  (`Probability/Distributions/Gaussian/Multivariate.lean`).
- `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.ext_iff_singleton`
  (`MeasureTheory/Measure/Dirac/Basic.lean`, countable spaces), `ProbabilityTheory.iIndepFun_pi`
  (`Probability/Independence/Basic.lean`), `MeasureTheory.integral_map`.
- `Real.exp_bound` (`Analysis/Complex/Exponential.lean`, `|x| ≤ 1`, `0 < n`), `Real.cosh_eq`,
  `Real.sinh_eq`; `Complex.tendsto_pow_exp_of_isLittleO_sub_add_div`
  (`Analysis/SpecialFunctions/Complex/LogBounds.lean`); `BoundedContinuousFunction.mkOfBound`
  (`Topology/ContinuousMap/Bounded/Basic.lean`), `ContinuousOn.comp_continuous`
  (`Topology/ContinuousOn.lean`).
- `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum`
  (`Probability/CentralLimitTheorem.lean`), named in the scope only.

### From Tau Ceti

- `TauCeti/Probability/Finance/BlackScholes/Basic.lean`: `TauCeti.BlackScholes.terminalSpot`,
  `TauCeti.BlackScholes.riskNeutralPrice` (Bochner integral, so `0` for a non-integrable payoff),
  `TauCeti.BlackScholes.riskNeutralPrice_zero` (`τ = 0`), `TauCeti.BlackScholes.callPrice`,
  `TauCeti.BlackScholes.putPrice`, `TauCeti.BlackScholes.riskNeutralPrice_put` (for `0 < s`,
  `0 < σ`, `0 < K`, `0 < τ`) and `TauCeti.BlackScholes.putPrice_eq_callPrice` (all parameters);
  `TauCeti.BlackScholes.riskNeutralPrice_call` is named in the scope only.
- `TauCeti/Probability/Moments/Covariance.lean`: `TauCeti.covMatrix`, the covariance matrix of a
  measure on `EuclideanSpace ℝ ι`.

### From TauCetiRoadmap.DiscreteTimeFinance

- 4.1: `crrPrice` and `crrMeasure`, copied verbatim into `Suggested.lean`.
- 4.2: `crr_noArbitrage_iff` (for `N ≥ 1`, a reference measure charging every path, `S₀ > 0` and
  `a < b`: no arbitrage iff `a < 0 < b`), used in the conventions.
- 4.3: `crr_equivMartingaleMeasures` (for a reference measure charging every path, `S₀ > 0` and
  `−1 < a < 0 < b`: the equivalent martingale measures are `{crrMeasure N (−a/(b − a))}`), used in
  the conventions and in 3.2.
- 1.3 (`integral_eq_and_condExp_eq_of_attainable`) and 2.2
  (`isCompleteMarket_iff_subsingleton_trim`), cited in the conventions for the meaning of
  `crrEuropeanPrice`; 5.3 (`snellEnvelope_call_eq_condExp`) is named in the scope only.

### From TauCetiRoadmap.MathematicalStatisticsAsymptotic

- 1.2: `tendstoInDistribution_sum_of_lindeberg`: for row-wise independent, centred,
  square-integrable random vectors `Y n i`, `i : Fin (m n)`, in `EuclideanSpace ℝ (Fin k)` on
  probability spaces `Ωn n`, whose covariance matrices (`TauCeti.covMatrix` of the laws) sum to a
  limit `S` and which satisfy Lindeberg's condition, the row sums converge in law to a variable
  with law `multivariateGaussian 0 S`. Used with `k = 1` in 2.1.

## References

- N. H. Bingham, *M345F22 Mathematical Finance*, lecture notes, Imperial College London, 2016,
  author's page: Lecture 17 (14 November 2016),
  https://www.ma.imperial.ac.uk/~bin06/M3A22/2016/m3a22l17.pdf (§6, the Lemma on p. 2 and the
  expansion of `1 − 2p*` on p. 3); Lecture 18 (17 November 2016),
  https://www.ma.imperial.ac.uk/~bin06/M3A22/2016/m3a22l18.pdf (the limit of the call price and
  formula (∗) for a general payoff, p. 1).
- J. C. Cox, S. A. Ross and M. Rubinstein introduced the binomial tree and its limit; F. Black and
  M. Scholes, and R. C. Merton, the continuous-time formula. Attributed in prose, without
  locators.

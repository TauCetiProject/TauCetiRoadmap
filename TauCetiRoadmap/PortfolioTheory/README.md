# Roadmap: portfolio theory

**Summary.** This roadmap develops two classical answers to the question of how to divide wealth
among `m` assets. In the first, the investor maximizes the expected logarithm of the return,
period after period; in the second, the investor minimizes the variance of the return for a
prescribed mean. A portfolio is a vector of nonnegative weights summing to `1`, the market of one
period is a random vector `X` of nonnegative price relatives, and the return of the portfolio `b`
is `⟨b, X⟩`. Ruin is allowed: a price relative may be `0`, and every statement says what happens
to portfolios whose return vanishes with positive probability.

The headline theorems are these.

- *The Kuhn–Tucker conditions for log-optimality.* If the coordinates of `X` are nonnegative and
  their sum is almost surely positive, a log-optimal portfolio exists, any two have almost surely
  equal returns, and `b*` is log-optimal if and only if `E[X_j / ⟨b*, X⟩] ≤ 1` for every asset
  `j`, with equality for every asset it holds. In a horse race the log-optimal bet is the vector
  of win probabilities, whatever the odds.
- *Asymptotic optimality (Breiman; Algoet–Cover).* If a nonanticipating strategy has almost
  surely positive returns and satisfies the conditional Kuhn–Tucker conditions at every period,
  then against every nonanticipating strategy
  the ratio of wealths `S_n / S*_n` is a nonnegative supermartingale, it converges almost surely,
  and almost surely `S_n ≤ exp(nε) S*_n` for every `ε > 0` and all large `n`. For independent,
  identically distributed price relatives the constant log-optimal portfolio qualifies, and its
  wealth grows at the exponential rate `E log ⟨b*, X⟩` when `log ∑_j X_j` is integrable.
- *Cover's universal portfolio.* For every sequence of `n` nonnegative market vectors on `m`
  assets, the wealth of the universal portfolio, which weights every constant rebalanced
  portfolio by the wealth it has already earned, is at least `1 / (n + m − 1 choose m − 1)` times
  the wealth of every constant rebalanced portfolio.
- *The mean–variance frontier and the two-fund theorem.* For a positive semidefinite covariance
  matrix `Σ`, a portfolio of mean `r` has least variance exactly when `Σw` is a combination of
  the constant vector and the mean vector `μ`; affine combinations of frontier portfolios are
  frontier portfolios, for every matrix `Σ`. When `Σ` is positive definite and the assets do not
  all have the same mean, the frontier portfolio of mean `r` is unique, affine in `r`, with
  variance `(C r² − 2 B r + A) / D`.

The roadmap builds on Mathlib's integrals, conditional expectations, supermartingale convergence,
strong law of large numbers and positive definite matrices, and on Tau Ceti's Dirichlet
distributions, whose law with all parameters `1` is the uniform law on the simplex over which the
universal portfolio averages.

Layer 1 below treats one period: log-optimality, the Kuhn–Tucker conditions, existence, the
horse race and Kelly's criterion. Layer 2, which uses Layer 1, proves the asymptotic optimality
of log-optimal investment. Layer 3 proves Cover's bound for arbitrary market sequences, and
Layer 4 describes the mean–variance frontier; Layers 3 and 4 use no other layer.

## Conventions

- **Assets and portfolios.** There are `m` assets, indexed by `Fin m`. The portfolios form the
  set `portfolios m` of vectors `b : Fin m → ℝ` with `b j ≥ 0` and `∑ j, b j = 1`, defined as
  `simplex (Fin m)`, where `simplex ι` is the image of Mathlib's `Convexity.StdSimplex ℝ ι` under
  its weights; Mathlib's `Convexity.StdSimplex.range_toFun_comp_weights` identifies it with that
  coordinate description.
  It is empty for `m = 0` and the single point `1` for `m = 1`. In Layers 1 to 3 no short sale is
  allowed; in Layer 4 the weights sum to `1` and may be negative.
- **Returns.** The price relative `X j` of asset `j` is the factor by which one unit invested in
  it grows over the period; it is nonnegative and may be `0`. The return of `b` is the dot
  product `b ⬝ᵥ X`. Over several periods the wealth from initial wealth `1` is the product of the
  returns.
- **Logarithms and junk values.** `Real.log 0 = 0` and `Real.log x = Real.log |x|`, and the
  Bochner integral of a non-integrable function is `0`. A growth rate taken at face value would
  therefore reward ruin: in a fair race between two horses the portfolio `(1, 0)` has true growth
  rate `−∞`, but `½ log 1 + ½ log 0` evaluates to `0`, above the optimum `−log 2`. Every
  statement here takes the logarithm only of returns that are almost surely positive, and the
  competitors in the definition of log-optimality are required to have such returns.
- **Relative growth rate.** The growth rate of `b` is measured relative to the sum of the price
  relatives, `relGrowthRate P X b = E log(⟨b, X⟩ / ∑_j X_j)`. For a portfolio with almost surely
  positive return the integrand lies in `(−∞, 0]`, so the expectation is either a real number or
  `−∞`, with no integrability assumption on `X`. This is Algoet and Cover's normalization of the
  market by a reference portfolio (§3, equations (20)–(23), p. 882) with the uniform portfolio as
  reference, up to the constant `log m`. When `log ∑_j X_j` is integrable the ordinary growth
  rate `growthRate P X b = E log ⟨b, X⟩` differs from it by the constant `E log ∑_j X_j`.
- **Scores.** The expected score `E[X_j / ⟨b, X⟩]` is computed as a lower integral in `ℝ≥0∞`,
  where `x / 0 = ∞` for `x > 0` and `0 / 0 = 0`. A score therefore detects a portfolio that is
  ruined with positive probability while some asset it does not hold pays.
- **Strategies.** Periods are numbered from `0`. A strategy is a sequence of portfolio-valued
  random variables; it is nonanticipating when the portfolio of period `t` is measurable for the
  information available at the start of period `t`.
- **Measures.** One-period statements are about a probability measure `P` on a measurable space
  `Ω`. The uniform law on the portfolio simplex is Tau Ceti's `dirichletMeasure` with every
  parameter `1`, a law on `EuclideanSpace ℝ (Fin m)`; it is the zero measure for `m = 0`.
- **Matrices.** In Layer 4 the covariance matrix `S : Matrix ι ι ℝ` is indexed by a finite type
  `ι`, the variance of `w` is `w ⬝ᵥ (S *ᵥ w)`, and `1` is the constant vector. Mathlib's matrix
  inverse `S⁻¹` is `0` for a singular matrix; only 4.4 uses it, under positive definiteness.

## Layer 1: log-optimal portfolios for one period

### 1.1 Growth rates and log-optimality

Define `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`, the weight
vectors of Mathlib's standard simplex (copied verbatim from RegretMinimizationAndEquilibria,
Layer 1, 1.1), and the abbreviation `portfolios m = simplex (Fin m)`. For a probability measure
`P` and price relatives
`X : Ω → Fin m → ℝ`, define:

- `relGrowthRate P X b`, the integral of `log(b ⬝ᵥ X / ∑_j X_j)`, and `growthRate P X b`, the
  integral of `log(b ⬝ᵥ X)`;
- `IsAdmissible P X b`: `b` is a portfolio, `b ⬝ᵥ X > 0` almost surely, and
  `log(b ⬝ᵥ X / ∑_j X_j)` is integrable;
- `IsLogOptimal P X b`: `b` is admissible and `relGrowthRate P X b' ≤ relGrowthRate P X b` for
  every admissible `b'`.

A portfolio that is not admissible has true relative growth rate `−∞`: either its return vanishes
with positive probability, or its relative log return, which is at most `0`, has expectation
`−∞`. So a log-optimal portfolio in this sense maximizes the true relative growth rate over all
portfolios, and the definition is Algoet and Cover's log-optimality (Definition (15), p. 881)
for markets whose total `∑_j X_j` is almost surely positive: there the expectation in (15) is
the difference of the two relative growth rates.

**Checks.**
- Cash and one stock: `X = (1, 2)` with probability `0.4` and `X = (1, 0.6)` with probability
  `0.6`. The portfolio `(3/5, 2/5)` returns `1.4` or `0.84`, its growth rate is
  `0.4 log 1.4 + 0.6 log 0.84 ≈ 0.02998`, and both of its scores equal
  `0.4 · 1/1.4 + 0.6 · 1/0.84 = 0.4 · 2/1.4 + 0.6 · 0.6/0.84 = 1`, so by 1.2 it is log-optimal.
- In the fair race between two horses (`X = (1, 0)` or `(0, 1)` with probability `½` each),
  `(1, 0)` is not admissible, although the face-value integral of `log(b ⬝ᵥ X)` at it is `0`,
  larger than the growth rate `−log 2` of the log-optimal portfolio `(½, ½)`.
- With one asset the only portfolio is `1`; it is log-optimal exactly when `X > 0` almost surely,
  its relative growth rate being `0`.

### 1.2 The Kuhn–Tucker conditions

Define `score P X b j`, the lower integral of `ENNReal.ofReal (X j) / ENNReal.ofReal (b ⬝ᵥ X)`.
Assume `X` measurable with nonnegative coordinates and `∑_j X_j > 0` almost surely.

Prove `isLogOptimal_iff_score_le_one`: `IsLogOptimal P X b` holds if and only if `b` is a
portfolio and `score P X b j ≤ 1` for every `j`, and at a log-optimal `b` the score of every asset
with `b j > 0` equals `1` (Algoet–Cover, Theorem 1, p. 881, the Kuhn–Tucker conditions, recalled
there from Bell and Cover; stated there without the hypothesis on `∑_j X_j`, see 1.1).

Route. If the scores are at most `1`: on a set of positive probability where `b ⬝ᵥ X = 0`, some
asset with `X j > 0` would have infinite score, so `b ⬝ᵥ X > 0` almost surely. Then
`t = ∑_j X_j / (b ⬝ᵥ X) ≥ 1` has expectation at most `m`, and `0 ≥ −log t ≥ 1 − t` makes the
relative log return integrable. For an admissible `b'`, the inequality `log y ≤ y − 1` gives
`E log(⟨b', X⟩ / ⟨b, X⟩) ≤ E[⟨b', X⟩ / ⟨b, X⟩] − 1 = ∑_j b'_j score_j − 1 ≤ 0`, and the left side
is the difference of the two relative growth rates; since `⟨b, X⟩ > 0` almost surely, each real
quotient `X_j / ⟨b, X⟩` is integrable with Bochner integral the (finite) score.
Conversely, for `b` log-optimal and the vertex `e_j`, the portfolio `b_λ = (1 − λ) b + λ e_j` is
admissible for `0 ≤ λ < 1` (its return is at least `(1 − λ)` times that of `b`), and with
`Z = X_j / ⟨b, X⟩ − 1 ≥ −1` the quotients `λ⁻¹ log(1 + λ Z)` increase to `Z` as `λ` decreases to
`0` and are bounded below by `2 log(1/2)` for `λ ≤ 1/2`; monotone convergence turns
`E λ⁻¹ log(1 + λ Z) ≤ 0` into `E Z ≤ 0` (Algoet–Cover, proof of Theorem 1, equation (19),
p. 881, by a truncation). Finally `∑_j b_j score_j = E[⟨b, X⟩ / ⟨b, X⟩] = 1` with every score at
most `1` forces `score_j = 1` where `b_j > 0`.

**Checks.**
- In the market of 1.1 the scores of `(3/5, 2/5)` are both `1`, while at `(1, 0)` the stock's
  score is `0.4 · 2 + 0.6 · 0.6 = 1.16 > 1`.
- The lower integral matters: if `X = (0, 1)` almost surely, the portfolio `(1, 0)` has return
  `0`; its stock score is `∞` in `ℝ≥0∞`, whereas the real quotient `1 / 0` would be the junk value
  `0` and would pass the test.
- The conditions are an inequality, not an equality: with `X = (1, 1/2)` almost surely the
  log-optimal portfolio is `(1, 0)`, whose scores are `1` and `1/2`.

*Needs:* 1.1; Mathlib `Real.log_le_sub_one_of_pos`, `lintegral_iSup`. (Algoet–Cover, Theorem 1.)

### 1.3 Existence and uniqueness of the log-optimal return

Under the hypotheses of 1.2:

- `exists_isLogOptimal`: a log-optimal portfolio exists (Algoet–Cover, p. 882, and Theorem 2,
  p. 883, for the normalized market).
- `ae_eq_of_isLogOptimal`: any two log-optimal portfolios have almost surely equal returns
  (Algoet–Cover, p. 882; Breiman, Proposition 1, p. 67, for finitely many outcomes).

Route. On the compact set `portfolios m` the relative growth rate, with value `−∞` at the
portfolios that are not admissible, is upper semicontinuous by Fatou's lemma, its integrand being
at most `0`, and it is finite at the uniform portfolio, whose relative return is at least `1/m`;
a maximizer exists, and its value is finite, so it is admissible. For uniqueness, if `b` and `b'`
are log-optimal, they have the same relative growth rate, and `(b + b')/2` is admissible: its
relative log return lies between `0` and the mean of those of `b` and `b'`. With `u`, `v` the two
returns, positive almost surely, `log((u + v)/2) − (log u + log v)/2` is integrable (a difference
of relative log returns), nonnegative, and positive where `u ≠ v`; if the returns differed on a
set of positive probability, its integral would be positive, and `(b + b')/2` would be strictly
better.

**Checks.**
- The portfolio need not be unique: if two assets have equal price relatives in every outcome,
  every split between them is log-optimal, and the returns agree.
- `X = (1, 1/2)` almost surely: the unique log-optimal portfolio is `(1, 0)`, on the boundary of
  the simplex.

*Needs:* 1.1; Mathlib `UpperSemicontinuousOn.exists_isMaxOn`, `lintegral_liminf_le`,
`strictConcaveOn_log_Ioi`, `integral_pos_iff_support_of_nonneg_ae`.

### 1.4 The horse race

Define `horseRace o`, the market on `Ω = Fin m` in which, when horse `ω` wins, asset `ω` pays
`o ω` per unit and the others pay nothing. Prove `isLogOptimal_horseRace_iff`: for every
probability measure `P` on `Fin m` and odds `o j > 0`, `b` is log-optimal if and only if
`b j = P {j}` for every `j` (Breiman, Proposition 2, p. 68, for disjoint betting sets;
Algoet–Cover, §8, p. 895). Horses that cannot win get nothing, and the odds play no role.

Route. In this market `score_j(b) = P{j} / b_j`, read in `ℝ≥0∞`. If every score is at most `1`
then `b_j ≥ P{j}` for every `j`, and both vectors sum to `1`; conversely the vector of win
probabilities has every score `0` or `1`. Apply 1.2; the total `∑_j X_j` is the positive odds
of the winner.

**Checks.**
- Kelly's coin as a race: two horses, heads and tails, each paying `2`, with `P{heads} = p`.
  The log-optimal bet `(p, 1 − p)` means betting the fraction `2p − 1` of wealth on heads when
  `p ≥ ½`, and the growth rate is `log 2 − H(p)` in nats, `H` the binary entropy
  (`Real.binEntropy`): `0.0201355` for `p = 0.6`.
- With odds `(10, 1)` and probabilities `(0.1, 0.9)` the bet is still `(0.1, 0.9)`.
- A horse with `P{j} = 0` and `b_j > 0` gives a portfolio that is not log-optimal: its other
  coordinates are too small, and some horse that can win has score above `1`.

*Needs:* 1.2.

### 1.5 Kelly's criterion

Define `kellyGrowth p o f = p log(1 + o f) + (1 − p) log(1 − f)`, the growth rate of betting the
fraction `f` of wealth on an event of probability `p` that pays `o` to `1`. Prove
`kelly_isGreatest`: for `0 ≤ p < 1` and `o > 0`, the fraction `f* = max(0, p − (1 − p)/o)` lies
in `[0, 1)`, maximizes `kellyGrowth p o` over `[0, 1)`, and is the only maximizer there. For
`o = 1` and `p ≥ ½` it is Breiman's fraction `p − q` for the coin (p. 66). (Proved here.) This is
the one-period problem of 1.1 for the two-asset market of cash and the bet, with outcomes
`(1, 1 + o)` with probability `p` and `(1, 0)` otherwise, at the portfolio `(1 − f, f)`; the
statement is kept for its closed form.

The interval excludes `f = 1`, which is ruin with probability `1 − p > 0`; `Real.log 0 = 0`
would give it the junk value `p log(1 + o)`. The hypothesis `p < 1` is needed: for `p = 1` the
growth rate increases on `[0, 1)` and has no maximum there.

Route. On `[0, 1)` the function is strictly concave when `p < 1`, with derivative
`p o / (1 + o f) − (1 − p)/(1 − f)`, which vanishes at `p − (1 − p)/o` and is at most `0` at
`f = 0` when that number is not positive.

**Checks.**
- `p = 0.6`, `o = 1`: `f* = 0.2` and `kellyGrowth = 0.6 log 1.2 + 0.4 log 0.8 ≈ 0.0201355`,
  equal to `log 2 − H(0.6)` as in 1.4.
- `p = 0.3`, `o = 3`: `f* = 0.3 − 0.7/3 = 1/15`; `p = 0.2`, `o = 3`: `f* = 0`, an unfavourable
  bet.
- The junk value at `f = 1` for `p = 0.9`, `o = 1` is `0.9 log 2 ≈ 0.624`, above the true maximum
  `kellyGrowth 0.9 1 0.8 ≈ 0.368`.

*Needs:* Mathlib `strictConcaveOn_log_Ioi`.

### Examples

The cash-and-stock market of 1.1, the fair race and the race with odds `(10, 1)`, Kelly's coin.

### Dependencies

Mathlib `Convexity.StdSimplex`, `Real.log_le_sub_one_of_pos`, `lintegral_iSup`,
`lintegral_liminf_le`, `UpperSemicontinuousOn.exists_isMaxOn`, `strictConcaveOn_log_Ioi`,
`integral_pos_iff_support_of_nonneg_ae`, `Real.binEntropy` (in a Check); `simplex` copied
verbatim from RegretMinimizationAndEquilibria, Layer 1, 1.1. No other layer.

## Layer 2: asymptotic optimality of log-optimal investment

### 2.1 The asymptotic optimality principle

Define `wealth b X n ω`, the product over `t < n` of `b t ω ⬝ᵥ X t ω`. Let `ℱ` be a filtration
indexed by `ℕ`, `X t` measurable for `ℱ (t + 1)` with nonnegative coordinates, `b` and `bstar`
nonanticipating strategies (each `b t` measurable for `ℱ t` and portfolio-valued), and suppose
that `bstar` satisfies the conditional Kuhn–Tucker conditions: for every `t`,
`bstar t ⬝ᵥ X t > 0` almost surely and, for every `j`, `X t j / (bstar t ⬝ᵥ X t)` is integrable
with conditional expectation given `ℱ t` at most `1`. Prove `logOptimal_asymptotic`:

- the ratio `wealth b X n / wealth bstar X n` is a supermartingale for `ℱ`, of mean at most `1`
  for every `n`;
- it converges almost surely to an integrable limit `Y` with `E Y ≤ 1`;
- almost surely, for every `ε > 0`, `wealth b X n ≤ exp(ε n) · wealth bstar X n` for all large
  `n`.

(Algoet–Cover, Theorem 5, p. 888, with its proof, pp. 888–889, for a log-optimum strategy given
`ℱ t`; that proof uses conditional log-optimality only through the conditional Kuhn–Tucker
conditions, to which Algoet and Cover note it is equivalent (p. 888), and the hypotheses here are
those conditions. Breiman, Theorem 2, p. 72, for independent repetitions of a game with finitely
many outcomes.)

Route. Write `R n` for the ratio and `Q n = (b n ⬝ᵥ X n) / (bstar n ⬝ᵥ X n)`, so that
`R (n + 1) = R n · Q n` everywhere. Since `Q n = ∑_j b n j · X n j / (bstar n ⬝ᵥ X n)` with weights
in `[0, 1]`, `Q n` is integrable; pulling the bounded `ℱ n`-measurable weights `b n j` out of the
conditional expectation, the Kuhn–Tucker conditions give `E[Q n | ℱ n] ≤ ∑_j b n j = 1`. The
integrability of `R n`, which a supermartingale requires, follows by induction on `n`: for
`K > 0`, `E[min(R n, K) · Q n] = E[min(R n, K) · E[Q n | ℱ n]] ≤ E[R n] ≤ 1`, and monotone
convergence in `K` gives `E[R (n + 1)] ≤ 1`. Pulling `R n` out then gives the supermartingale
inequality; the supermartingale is nonnegative with means at most `1`, so `−R` is an
`L¹`-bounded submartingale and converges almost surely; the limit, set to `0` where it does not
exist, is a.e. measurable, and Fatou's lemma bounds its mean. For the last item, Markov's
inequality gives `P(S_n / S*_n ≥ exp(ε n)) ≤ exp(−ε n)`, which is summable, and Borel–Cantelli
applies for each
rational `ε`; the positivity hypothesis makes `S*_n > 0` for all `n` almost surely, so that the
bound on the ratio is the bound on the wealths.

**Checks.**
- Positivity of the log-optimal return cannot be dropped: with `X t = (0, 1)` for every `t` and
  `bstar t = (1, 0)`, every real quotient `X t j / 0` is the junk value `0`, so the conditional
  conditions hold, while `b t = (0, 1)` has wealth `1 > exp(ε n) · 0`.
- In the market of 1.1 repeated independently, with `bstar = (3/5, 2/5)` both scores equal `1`,
  the ratio is a martingale, and `E[S_n / S*_n] = 1` for every nonanticipating `b`: for `n = 1`
  and `b 0 = (1, 0)` it is `0.4 · 1/1.4 + 0.6 · 1/0.84 = 1`.
- For `n = 0` both wealths are `1`.

*Needs:* 1.2 (for the reading of the hypothesis); Mathlib `Supermartingale`,
`supermartingale_nat`, `condExp_mul_of_stronglyMeasurable_left`, `lintegral_iSup`,
`Submartingale.exists_ae_tendsto_of_bdd`, `mul_meas_ge_le_integral_of_nonneg`,
`measure_limsup_atTop_eq_zero`. (Algoet–Cover, Theorem 5.)

### 2.2 Breiman's theorem for independent, identically distributed returns

Let `X t` be independent, identically distributed and measurable, with nonnegative coordinates
and `∑_j X 0 j > 0` almost surely, let `bstar` be log-optimal for `X 0`, and let a competing
strategy choose at period `t` the portfolio `g t (X 0, …, X (t − 1))` for measurable,
portfolio-valued maps `g t`. Prove `breiman`:

- almost surely, for every `ε > 0`, the competitor's wealth is at most `exp(ε n)` times the
  wealth of the constant strategy `bstar` for all large `n`;
- if `log ∑_j X 0 j` is integrable, then almost surely `(1/n) log` of the wealth of `bstar`
  tends to `growthRate P (X 0) bstar`.

(Breiman, Theorem 2, p. 72, and Proposition 3 with (2.6), p. 68, for finitely many outcomes;
Algoet–Cover, §6, equation (41), p. 889, where the growth rate is attributed to Breiman.)

Route. By independence the conditional expectation of `X t j / ⟨bstar, X t⟩` given
`X 0, …, X (t − 1)` is the constant `score P (X 0) bstar j ≤ 1`, so 2.1 applies with the natural
filtration. The relative log return of `bstar` is integrable by admissibility, so
`log ⟨bstar, X 0⟩ = log(⟨bstar, X 0⟩ / ∑_j X 0 j) + log ∑_j X 0 j` is integrable under the extra
hypothesis, and the strong law of large numbers gives the rate.

**Checks.**
- In the market of 1.1, `(1/n) log S*_n → 0.4 log 1.4 + 0.6 log 0.84 ≈ 0.02998`, while the
  stock alone has growth rate `0.4 log 2 + 0.6 log 0.6 ≈ −0.0292`, so its wealth tends to `0`
  almost surely, like `exp(−0.0292 n)` to first order in the exponent.
- Without the integrability of `log ∑_j X 0 j` the rate need not be finite: if `X 0 = (Y, Y)`
  with `(log Y)⁻` integrable and `E (log Y)⁺ = ∞`, every portfolio has the same wealth, the
  first item holds trivially, and `(1/n) log S*_n → +∞` almost surely.

*Needs:* 1.1, 1.2, 2.1; Mathlib `iIndepFun`, `IdentDistrib`, `condExp_indep_eq`,
`strong_law_ae`.

### Examples

The cash-and-stock market of 1.1 repeated independently; the degenerate market of the first
Check of 2.1.

### Dependencies

Layer 1 (1.1, 1.2); Mathlib `Supermartingale`, `supermartingale_nat`, `lintegral_iSup`,
`condExp_mul_of_stronglyMeasurable_left`, `Submartingale.exists_ae_tendsto_of_bdd`,
`mul_meas_ge_le_integral_of_nonneg`, `measure_limsup_atTop_eq_zero`, `iIndepFun`,
`IdentDistrib`, `condExp_indep_eq`, `strong_law_ae`.

## Layer 3: the universal portfolio

### 3.1 Constant rebalanced portfolios and the universal portfolio

A market sequence is `x : ℕ → Fin m → ℝ` with nonnegative entries; nothing about it is random.
Define:

- `crpWealth x n b`, the product over `i < n` of `b ⬝ᵥ x i`: the wealth of the constant
  rebalanced portfolio `b` after `n` periods;
- `uniformSimplex m`, Tau Ceti's `dirichletMeasure` with every parameter `1`, and
  `universalWealth x n`, the integral of `crpWealth x n b` against it;
- `universalPortfolio x n`, the portfolio used at period `n`: coordinate `j` is the integral of
  `b j · crpWealth x n b` divided by `universalWealth x n`, the average of all portfolios weighted
  by the wealth they earned in the first `n` periods (Cover, equation (3), p. 3).

Prove `prod_universalPortfolio_eq`: for `m ≥ 1`, the product over `i < n` of
`universalPortfolio x i ⬝ᵥ x i` equals `universalWealth x n` (Cover, Lemma 1, p. 6; Blum–Kalai,
equation (1), p. 5).

Route. The `i`-th factor is the ratio `universalWealth x (i + 1) / universalWealth x i`, and the
product telescopes from `universalWealth x 0 = 1`. If `universalWealth x i = 0` for some `i`, the
wealths `crpWealth x i b` vanish for almost every `b`, so every later universal wealth is `0`; the
universal portfolio is then the junk vector `0` and the product is `0` too.

**Checks.**
- The first universal portfolio is the uniform portfolio `(1/m, …, 1/m)`, the mean of the uniform
  law on the simplex.
- `m ≥ 1` is needed: for `m = 0` and `n = 0` the product is the empty product `1`, while the
  integral against the zero measure is `0`.
- For a market whose `i`-th vector is the basis vector `e_(j_i)`, the universal wealth is the
  Dirichlet moment `(m − 1)! ∏_j k_j! / (n + m − 1)!`, `k_j` the number of periods in which asset
  `j` pays.

*Needs:* Tau Ceti `dirichletMeasure`, `isProbabilityMeasure_dirichletMeasure`,
`ae_mem_stdSimplex_dirichletMeasure`, `integral_prod_pow_dirichletMeasure` (in a Check).

### 3.2 Cover's bound

Prove `crpWealth_le_choose_mul_universalWealth`: for every `n`, every market sequence with
nonnegative entries and every portfolio `b`,
`crpWealth x n b ≤ (n + m − 1 choose m − 1) · universalWealth x n` (Blum–Kalai, Theorem 1, p. 5,
with its proof, pp. 5–6). Since `(n + m − 1 choose m − 1) ≤ (n + 1)^(m − 1)`, the per-period
deficit `(1/n) log(crpWealth x n b / universalWealth x n)` is at most `(m − 1) log(n + 1) / n`,
which tends to `0`: this is Cover's universality (Cover, equation (7), p. 3, there for bounded
market sequences and the best constant rebalanced portfolio; here for every nonnegative sequence).

Route (Blum and Kalai). If `b' = (1 − α) b + α z` with `z` a portfolio, every factor of
`crpWealth x n b'` is at least `(1 − α)` times the matching factor at `b`, by nonnegativity of
the entries. Under the uniform law, the portfolios of this form, `α` fixed, have probability
`α^(m − 1)`, the volume of a copy of the simplex scaled by `α`. Hence
`universalWealth x n ≥ E[(1 − α_b)^n] crpWealth x n b`, with `1 − α_b` the minimum of `b'_j / b_j`
over the `j` with `b_j > 0` (the least `α` for which `b'` has this form), and
`E[(1 − α_b)^n] = ∫_0^1 (1 − x^(1/n))^(m − 1) dx = 1 / (n + m − 1 choose m − 1)` by repeated
integration by parts.

**Checks.**
- The bound is attained: if every market vector is `e_1` and `b = e_1`, the constant wealth is
  `1` and the universal wealth is `(m − 1)! n! / (n + m − 1)! = 1 / (n + m − 1 choose m − 1)`;
  for `m = 2`, `n = 4` this is `1/5`.
- Nonnegativity is needed: for `m = 2`, `n = 1`, `x 0 = (1, −1)` and `b = (1, 0)`, the constant
  wealth is `1` but the universal wealth is the mean return `0`.
- Range in which the bound says something. On the two-asset market of Blum and Kalai (cash, and a
  stock that halves and doubles alternately, Blum–Kalai p. 1), `crpWealth` at `(½, ½)` is
  `(9/8)^(n/2)` for even `n` (the best constant rebalanced wealth for even `n`), and among even
  horizons the bound guarantees universal wealth above `1` exactly from `n = 74` on
  (`(9/8)^36 / 73 = 0.951`, `(9/8)^37 / 75 = 1.041`), while the universal wealth itself is
  `1.0833` at `n = 2` and `134.69` at `n = 100`.
  The guaranteed per-period deficit `(1/n) log(n + m − 1 choose m − 1)` is `0.0220` for `m = 2`,
  `n = 252`, `0.00155` for `m = 2`, `n = 5544`, and `0.147` for `m = 10`, `n = 252`. The bound
  guarantees growth of the universal portfolio only when the best constant rebalanced portfolio
  beats the alternatives at a per-period exponential rate above these values; for many assets
  and short horizons it guarantees nothing.

*Needs:* 3.1; Tau Ceti `dirichletMeasure`, `dirichletMeasure_eq_map_withDensity_dirichletChartPDF`,
`ae_mem_stdSimplex_dirichletMeasure`; Mathlib `Measure.addHaar_smul`, `Nat.choose`.
(Blum–Kalai, Theorem 1.)

### Examples

The market of basis vectors (sharpness), the halving-and-doubling market, the market with a
negative entry.

### Dependencies

Tau Ceti `dirichletMeasure`, `isProbabilityMeasure_dirichletMeasure`,
`ae_mem_stdSimplex_dirichletMeasure`, `dirichletMeasure_eq_map_withDensity_dirichletChartPDF`,
`integral_prod_pow_dirichletMeasure` (in a Check); Mathlib `Measure.addHaar_smul`. No other
layer.

## Layer 4: the mean–variance frontier

### 4.1 Frontier portfolios and their characterization

For a finite type `ι` of assets, a mean vector `μ : ι → ℝ`, a matrix `S : Matrix ι ι ℝ` and
`r : ℝ`, define `IsFeasible μ r w` (`∑_i w i = 1` and `μ ⬝ᵥ w = r`; short sales allowed) and
`IsFrontier S μ r w` (`w` is feasible and `w ⬝ᵥ (S *ᵥ w) ≤ v ⬝ᵥ (S *ᵥ v)` for every feasible
`v`). This is the problem (2) of Haugh, §1.1, p. 2, without assuming `S` invertible.

Prove `isFrontier_iff`: if `S` is positive semidefinite and `w` is feasible, then `w` is a
frontier portfolio if and only if `S *ᵥ w = a • 1 + c • μ` for some reals `a`, `c`. (Proved
here.)

Route. If `S *ᵥ w = a • 1 + c • μ` and `v` is feasible, `d = v − w` satisfies `∑ d = 0` and
`μ ⬝ᵥ d = 0`, so `v ⬝ᵥ S *ᵥ v = w ⬝ᵥ S *ᵥ w + 2 d ⬝ᵥ S *ᵥ w + d ⬝ᵥ S *ᵥ d`, the middle term is
`0` and the last is nonnegative. Conversely, along every such `d` the quadratic
`s ↦ (w + s d) ⬝ᵥ S *ᵥ (w + s d)` is least at `s = 0`, so `S *ᵥ w` is orthogonal to the
subspace of such `d`, whose orthogonal complement is spanned by `1` and `μ`. No constraint
qualification is needed: the constraints are linear, and `1` and `μ` may be dependent.

**Checks.**
- Two uncorrelated assets with variances `1`, `4` and means `0`, `1`: the portfolio `(0.8, 0.2)`
  has mean `0.2`, variance `0.64 + 0.16 = 0.8`, and `S *ᵥ w = (0.8, 0.8) = 0.8 • 1`.
- Positive semidefiniteness is needed: for `S = −I` on three assets, `μ = 0`, `r = 0`, the
  portfolio `(1/3, 1/3, 1/3)` has `S *ᵥ w = −(1/3) • 1`, but the variance is unbounded below on
  the feasible plane.
- All assets with the same mean `c`: feasibility forces `r = c`, the mean constraint is redundant,
  and the frontier portfolios are the global minimum-variance portfolios, characterized by
  `S *ᵥ w ∈ span{1}`.

*Needs:* 4.1's definitions; Mathlib `Matrix.PosSemidef`, `Matrix.dotProduct_mulVec`,
`Submodule.mem_span_pair`.

### 4.2 Existence

Prove `exists_isFrontier`: if `S` is positive semidefinite and some portfolio is feasible for
`r`, a frontier portfolio for `r` exists. (Proved here.)

Route. Writing `S = Rᵀ R`, the variance is `‖R w‖²`, and the image under `R` of the feasible
affine subspace is an affine subspace of a finite-dimensional space, hence closed; the point of it
nearest to `0` is attained. Feasibility can fail: with no asset, or when every asset has mean
`c ≠ r`.

**Checks.**
- A singular matrix: two assets with identical returns (`S` the all-ones matrix scaled by `σ²`)
  and equal means `c`: every portfolio is feasible for `r = c` and every one is a frontier
  portfolio, of variance `σ²`.

*Needs:* 4.1; Mathlib `Matrix.PosSemidef`, `IsCompact.exists_isMinOn` (on a closed ball meeting
the subspace).

### 4.3 The two-fund theorem

Prove `isFrontier_affineCombination`: if `w₁` and `w₂` are frontier portfolios for means `r₁` and
`r₂`, then for every real `α` the portfolio `α w₁ + (1 − α) w₂` is a frontier portfolio for the
mean `α r₁ + (1 − α) r₂`. No hypothesis on `S` is needed. (The two-fund theorem is posed as
Exercise 2 in Haugh, §1.1, p. 2, for efficient portfolios under the normality assumption of
that section; proved here.)

Route. The variance depends only on the symmetric part `T = (S + Sᵀ)/2`. A frontier portfolio
exists for `r₁`, so `T` is positive semidefinite on the directions `d` with `∑ d = 0` and
`μ ⬝ᵥ d = 0`, and the argument of 4.1 gives `T *ᵥ wₖ ∈ span{1, μ}` for `k = 1, 2`; both facts
pass to the combination, and the sufficiency half of 4.1 applies on those directions.

**Checks.**
- With `S = diag(1, 1, −1)`, which is not positive semidefinite, and `μ = (0, 0, 1)`, frontier
  portfolios exist for every `r` and their affine combinations are again frontier portfolios.
- In the example of 4.1, the frontier portfolios for means `0` and `1` are `(1, 0)` and `(0, 1)`,
  and `α = 0.8` gives the frontier portfolio `(0.8, 0.2)` of mean `0.2`.

*Needs:* 4.1.

### 4.4 The nondegenerate frontier

Let `S` be positive definite and `1`, `μ` linearly independent, and put `A = μ ⬝ᵥ S⁻¹ *ᵥ μ`,
`B = 1 ⬝ᵥ S⁻¹ *ᵥ μ`, `C = 1 ⬝ᵥ S⁻¹ *ᵥ 1` and `D = A C − B²`. Prove
`isFrontier_iff_eq_of_posDef`: for every `r`, `w` is a frontier portfolio if and only if
`w = S⁻¹ *ᵥ (((A − B r)/D) • 1 + ((C r − B)/D) • μ)`, and its variance is
`(C r² − 2 B r + A)/D`. (Proved here.)

In particular the frontier portfolio of mean `r` is unique and affine in `r`, so every frontier
portfolio is an affine combination of the frontier portfolios for any two distinct means: the
two-fund theorem in the form of Haugh's Exercise 2. The variance is least at `r = B/C`, where it
is `1/C`, the variance of the global minimum-variance portfolio `S⁻¹ *ᵥ 1 / C`.

Route. By 4.1, `w = S⁻¹ *ᵥ (a • 1 + c • μ)`, and the two constraints read `a C + c B = 1`,
`a B + c A = r`, a linear system with determinant `D`. By the Cauchy–Schwarz inequality for the
inner product `⟨u, v⟩ = u ⬝ᵥ S⁻¹ *ᵥ v`, `D > 0` exactly when `1` and `μ` are linearly
independent. The variance is `w ⬝ᵥ (a • 1 + c • μ) = a + c r`.

**Checks.**
- In the example of 4.1: `A = 1/4`, `B = 1/4`, `C = 5/4`, `D = 1/4`, the variance is
  `5r² − 2r + 1`, equal to `1`, `0.8`, `4` at `r = 0`, `0.2`, `1`, least at `r = B/C = 0.2`.
- Same means: `μ = c • 1` gives `D = c² C² − c² C² = 0`, and the formula would divide by `0`; the
  hypothesis of independence excludes it, and 4.1 describes that case.
- One asset: `1` and `μ` are dependent, so the statement assumes nothing; the only portfolio is
  `1`, feasible only for `r = μ 0`.

*Needs:* 4.1; Mathlib `Matrix.PosDef`, `Matrix.PosDef.isUnit`.

### Examples

Two uncorrelated assets (the running example of 4.1, 4.3, 4.4), two identical assets, the
indefinite matrix of 4.3, assets with a common mean.

### Dependencies

Mathlib `Matrix.PosSemidef`, `Matrix.PosDef`, `Matrix.PosDef.isUnit`, `Matrix.dotProduct_mulVec`,
`Submodule.mem_span_pair`, `IsCompact.exists_isMinOn`. No other layer.

## Scope and ownership

This roadmap owns log-optimal portfolios for one period with their Kuhn–Tucker conditions,
existence and the uniqueness of the log-optimal return; the horse-race and Kelly corollaries; the
asymptotic optimality of log-optimal strategies and Breiman's theorem; constant rebalanced
portfolios, Cover's universal portfolio, its wealth identity and Cover's bound; and the
mean–variance frontier with the two-fund theorem.

Already in the libraries and therefore not targets: the standard simplex (Mathlib
`Convexity.StdSimplex`), monotone convergence and Fatou's lemma, conditional
expectations and supermartingale convergence, the Borel–Cantelli lemma, the strong law of large
numbers, binary entropy, positive definite matrices and their inverses (Mathlib); the Dirichlet
law and its mixed moments (Tau Ceti `TauCeti/Probability/Distributions/Dirichlet/`).

Boundaries with other roadmaps:

- StatisticalLearningTheory 1.3, proper losses, states that the logarithmic loss is proper, in
  the form `−∑ p log q = −∑ p log p + ∑ p log(p/q)` with its inequality; in a horse race with odds
  `o` it gives, after adding `∑ p log o` to both sides, the identity `W(p) − W(b) = D(p ‖ b)`
  between growth rates for bets `b` that are positive wherever `p` is. That identity is not
  restated here. 1.4 above is a different statement, the characterization of all the log-optimal
  portfolios of the race (it also needs the equality case of that inequality and the exclusion of
  bets that vanish on a winning horse), proved through the Kuhn–Tucker conditions of 1.2; this
  roadmap does not depend on that one. Proper scoring rules in general are not treated here.
- OnlineConvexOptimization leaves exp-concave losses and the online Newton step out of its scope
  and states no wealth-ratio bound; Cover's bound above is a statement about wealth ratios of
  constant rebalanced portfolios, not about regret for losses in its sense.
- RegretMinimizationAndEquilibria 1.1 owns `simplex`, the weight vectors of Mathlib's standard
  simplex; it is copied verbatim, and the portfolios on `m` assets are `simplex (Fin m)`. Its
  Hedge (1.2), on the simplex with linear payoffs, is a different algorithm with an additive
  regret; nothing else of it is used.
- EntropyAndSourceCoding leaves universal coding out of its scope; the universal portfolio above is
  not a code.
- ConvexAnalysisAndDuality 5.2 states the Karush–Kuhn–Tucker theorem for convex programs under
  Slater's condition, with subgradients. 4.1 above is its special case with no inequality
  constraint, the two linear constraints of the budget and the mean, and the convex quadratic
  objective, written with `S *ᵥ w` in place of a subgradient; it is proved above by an elementary
  orthogonality argument. 1.2 concerns an expected logarithm that may take the value `−∞`, outside
  that theorem's real-valued functions. This roadmap does not depend on that one.
- FinancialMathematics is the continuous-time model of one stock and a bond; nothing of
  it is used here.

Outside the scope: arbitrage pricing, martingale measures, superhedging and option pricing in
discrete time; risk measures, value at risk and expected shortfall; ruin probabilities; utility
functions, expected-utility representations and comparisons of risk aversion (the logarithm
appears here only as the growth rate); stochastic dominance; continuous-time portfolio choice;
the asymptotic equipartition property for stationary ergodic markets (Algoet–Cover, Theorem 6);
Breiman's expected-time optimality; universal portfolios with transaction costs (Blum–Kalai,
Theorem 2) or side information and the Dirichlet(½, …, ½) variant; the capital asset pricing
model, the tangency portfolio and beta; portfolio constraints beyond the budget; and every
algorithm for computing these portfolios.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex` (nonnegative finitely
  supported weights summing to `1`) and `Convexity.StdSimplex.range_toFun_comp_weights` (for a
  finite type, the image of the weights is the set of nonnegative vectors with sum `1`).
- `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`: `integral_pos_iff_support_of_nonneg_ae`
  (an integrable, almost everywhere nonnegative function has positive integral exactly when its
  support has positive measure).
- `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `strictConcaveOn_log_Ioi`.
  `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`: `Real.log_le_sub_one_of_pos`.
  `Mathlib/Analysis/SpecialFunctions/BinaryEntropy.lean`: `Real.binEntropy` (in a Check).
- `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`: `lintegral_iSup` (monotone convergence for
  measurable functions) and `lintegral_liminf_le` (Fatou).
- `Mathlib/Topology/Semicontinuity/Basic.lean`: `UpperSemicontinuousOn.exists_isMaxOn` (an upper
  semicontinuous function on a nonempty compact set attains its maximum).
  `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMinOn`.
- `Mathlib/Probability/Process/Filtration.lean`: `MeasureTheory.Filtration`.
  `Mathlib/Probability/Martingale/Basic.lean`: `MeasureTheory.Supermartingale` (strongly adapted,
  integrable, conditional expectations of later values at most the present one) and
  `MeasureTheory.supermartingale_nat` (one-step criterion for discrete time).
  `Mathlib/Probability/Martingale/Convergence.lean`:
  `MeasureTheory.Submartingale.exists_ae_tendsto_of_bdd` (an `L¹`-bounded submartingale converges
  almost everywhere), applied to the negative of the ratio.
- `Mathlib/MeasureTheory/Function/ConditionalExpectation/PullOut.lean`:
  `MeasureTheory.condExp_mul_of_stronglyMeasurable_left` (a measurable factor comes out of the
  conditional expectation, under integrability of the product and of the other factor).
  `Mathlib/Probability/ConditionalExpectation.lean`: `MeasureTheory.condExp_indep_eq` (the
  conditional expectation given an independent σ-algebra is the expectation).
- `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`: `mul_meas_ge_le_integral_of_nonneg`
  (Markov's inequality). `Mathlib/MeasureTheory/OuterMeasure/BorelCantelli.lean`:
  `MeasureTheory.measure_limsup_atTop_eq_zero` (Borel–Cantelli).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun`.
  `Mathlib/Probability/IdentDistrib.lean`: `ProbabilityTheory.IdentDistrib`.
  `Mathlib/Probability/StrongLaw.lean`: `ProbabilityTheory.strong_law_ae` (pairwise independent,
  identically distributed, integrable).
- `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`: `MeasureTheory.Measure.addHaar_smul` (an
  additive Haar measure scales by `|r|^d` under `x ↦ r x`).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef` (Hermitian with nonnegative
  quadratic form), `Matrix.PosDef` (Hermitian with positive quadratic form off `0`),
  `Matrix.PosDef.isUnit` (a positive definite matrix over a field is invertible).
  `Mathlib/Data/Matrix/Mul.lean`: `Matrix.dotProduct_mulVec`.
  `Mathlib/LinearAlgebra/Span/Defs.lean`: `Submodule.mem_span_pair`.

### From Tau Ceti

- `TauCeti/Probability/Distributions/Dirichlet/Basic.lean`:
  `TauCeti.Probability.dirichletMeasure` (the normalized product of Gamma laws on
  `EuclideanSpace ℝ ι`, the zero measure for an empty index type or a nonpositive parameter),
  `TauCeti.Probability.isProbabilityMeasure_dirichletMeasure` (a probability measure for a
  nonempty index type and positive parameters),
  `TauCeti.Probability.ae_mem_stdSimplex_dirichletMeasure` (concentrated on the standard simplex).
- `TauCeti/Probability/Distributions/Dirichlet/Density.lean`:
  `TauCeti.Probability.dirichletMeasure_eq_map_withDensity_dirichletChartPDF` (the law as the
  image of its density in the chart that drops one coordinate; for parameters all `1` the density
  is the constant `(m − 1)!` on the open chart region).
- `TauCeti/Probability/Distributions/Dirichlet/MixedMoments.lean`:
  `TauCeti.Probability.integral_prod_pow_dirichletMeasure` (the mixed moments
  `E ∏ x_i^(k_i)` as ratios of Gamma values), used in a Check of 3.1.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- 1.1: `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`, copied verbatim
  into `Suggested.lean` (same name in this roadmap's namespace, same docstring and body); here
  `portfolios m` is the abbreviation `simplex (Fin m)`. Nothing else of that roadmap is used.

## References

- Paul H. Algoet and Thomas M. Cover, *Asymptotic optimality and asymptotic equipartition
  properties of log-optimum investment*, Annals of Probability 16 (1988), no. 2, 876–898; read
  from the scan of the journal pages on Cover's page at Stanford. Definition (15), Theorem 1 and
  equation (19), p. 881; p. 882 and §3, equations (20)–(23); Theorem 2, p. 883; Theorem 5,
  p. 888, proof pp. 888–889; §6, equation (41), p. 889; §8, p. 895.
- Leo Breiman, *Optimal gambling systems for favorable games*, Proceedings of the Fourth Berkeley
  Symposium on Mathematical Statistics and Probability, vol. 1 (1961), 65–78; read from the
  University of California's digital collection of the proceedings. The coin, p. 66;
  Propositions 1–3, pp. 67–68; Theorem 2, p. 72.
- Thomas M. Cover, *Universal portfolios*, Mathematical Finance 1 (1991), 1–29; read in the
  typescript dated 23 October 1996 on Cover's page at Stanford, whose numbering is cited:
  equations (3) and (7), p. 3; Lemma 1, p. 6.
- Avrim Blum and Adam Kalai, *Universal portfolios with and without transaction costs*, Machine
  Learning 35 (1999), 193–205; read in the preprint on Blum's page at Carnegie Mellon (pages
  1–13), whose numbering is cited: the two-asset example, p. 1; Definition 1, equation (1) and
  Theorem 1, p. 5, with the proof on pp. 5–6; Theorem 2, p. 8.
- Martin Haugh, *Mean-variance optimization and the CAPM*, lecture notes for IEOR E4706,
  Columbia University (2016), from the author's page: §1.1, problem (2) and Exercise 2, p. 2.
- Attributions made in prose: J. L. Kelly (1956), whose horse-race interpretation of
  investment Algoet and Cover recall in §8; the Kuhn–Tucker conditions for log-optimality, which
  Algoet and Cover attribute to Bell and Cover (1980); Markowitz's mean–variance analysis (1952),
  as cited by Haugh and by Algoet and Cover.

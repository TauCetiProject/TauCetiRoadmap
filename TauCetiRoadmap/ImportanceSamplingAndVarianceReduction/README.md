# Roadmap: importance sampling and variance reduction

**Summary.** A Monte Carlo method estimates an integral `μ = ∫ f dp` by averaging `f` over random
points. This roadmap studies how the variance of that average changes when the points are drawn
differently: from another law (importance sampling), with the weights normalized by their own sum
(self-normalized importance sampling), against a correlated quantity of known mean (control
variates), in reflected pairs (antithetic variates), or stratum by stratum (stratified sampling).
The target law `p` and the proposal law `q` are measures on an arbitrary measurable space, the
importance weight is the Radon–Nikodym derivative `w = dp/dq`, and the samples are random variables
with a prescribed law, independent where a statement needs it.

The headline theorems are these.

- *Variance and the optimal proposal.* If `q` charges every set on which `|f| p` lives, the
  importance sampling average of `n` points has mean `∫ f dp` and variance
  `(∫ f² w dp − μ²)/n`. For every such probability measure `q` the second moment `∫ (f w)² dq` is
  at least `(∫ |f| dp)²`, and the proposal proportional to `|f| p` attains this bound (Kahn and
  Marshall).
- *The sample size is about `exp KL(p‖q)`.* With `L` the Kullback–Leibler divergence of `p` from
  `q`, `n ≥ exp(L + t)` samples bring the mean absolute error below an explicit multiple of the
  `L²(p)` norm of `f`, while with `n ≤ exp(L − t)` the probability that the estimate of
  `∫ 1 dp = 1` reaches `1 − δ` is at most an explicit quantity. Both bounds are small when `t` is
  large and `log w` concentrates near `L` (Chatterjee and Diaconis).
- *Self-normalized importance sampling.* For a finite, possibly unnormalized target `p ≪ q`, the
  ratio `∑ f(Xᵢ) w(Xᵢ) / ∑ w(Xᵢ)` converges almost surely to the mean of `f` under `p` normalized.
  For a probability measure `p ≪ q` it is asymptotically normal with variance `∫ w² (f − μ)² dq`
  when `w` and `f w` are square integrable, and no proposal brings that variance below
  `(∫ |f − μ| dp)²`.
- *Control, antithetic and stratified variates.* The best linear combination of controls with
  positive definite covariance `Σ` reduces `Var Y` by `cᵀ Σ⁻¹ c`, and estimating the coefficient
  of one control from the sample keeps that asymptotic variance. For a product law on `ℝ^d`, a
  coordinatewise monotone integrand is nonpositively correlated with its image under coordinatewise
  antitone measure-preserving reflections, so a reflected pair has at most half the variance of one
  evaluation. Proportional allocation of strata never does worse than plain sampling, and Neyman's
  allocation is optimal.

The roadmap builds on Mathlib's Radon–Nikodym derivatives, variances, strong law, central limit
theorem and Kullback–Leibler divergence, and on the stochastic algebra of convergence in
probability of MathematicalStatisticsFoundations, whose Rao–Blackwell theorem (variance reduction
by conditioning) is not restated.

Layer 1 below treats importance sampling and Layer 2, which uses it, the self-normalized estimate.
Layers 3, 4 and 5 treat control variates, antithetic variates and stratified sampling; each depends
on no other layer.

## Conventions

- **Laws and weights.** `α` is a measurable space. The target `p` is a finite measure, and a
  probability measure in 1.4, 1.5 and 2.2–2.4; the proposal `q` is a probability measure on `α`
  (σ-finite in the identity of 1.1).
  The importance weight is `isWeight p q x = (p.rnDeriv q x).toReal`, Mathlib's Radon–Nikodym
  derivative read in `ℝ`. When `p ≪ q` it is a density of `p` against `q`; in general it is the
  density of the part of `p` absolutely continuous with respect to `q`.
- **The support condition.** Owen's condition that `q > 0` wherever `f p ≠ 0` is written
  `p.withDensity (fun x ↦ ‖f x‖ₑ) ≪ q`: every `q`-null set carries no `|f| p`-mass. It is weaker
  than `p ≪ q`, which the self-normalized estimate needs.
- **Samples.** Samples are random variables `X i : Ω → α`, `i : ℕ`, on a probability space
  `(Ω, P)`, each with law `q` in Mathlib's sense `HasLaw (X i) q P`. Each statement says which
  independence it needs: pairwise (`X i ⟂ᵢ[P] X j` for `i ≠ j`) or mutual (`iIndepFun X P`). The
  average of `n` points carries the factor `(n : ℝ)⁻¹`, which is `0` for `n = 0`.
- **Variances.** `variance` and `covariance` are Mathlib's; `variance X μ` is the real number
  `∫ (X − ∫ X dμ)² dμ` for square-integrable `X` and `0` otherwise, so every statement about it
  carries a square-integrability hypothesis or derives one. `evariance` is the same quantity in
  `ℝ≥0∞`, infinite when `X` is not square integrable. Second moments that may be infinite are
  written as lower Lebesgue integrals in `ℝ≥0∞`.
- **Division.** Real division by `0` gives `0`. So the self-normalized estimate is `0` when the
  weights sum to `0`, an estimated control coefficient is `0` when the sample of the control is
  constant, and `Var f − Cov(f, h)²/Var h` reads `Var f` when `Var h = 0`; each statement below is
  true with these values.
- **Gaussian limits.** A limit law `N(0, v)` is Mathlib's `gaussianReal 0 v` with `v : ℝ≥0`,
  written with `.toNNReal` of a real or extended real variance; `N(0, 0)` is the point mass at `0`.

## Layer 1: importance sampling

### 1.1 The weight, the estimate and its mean

Define `isWeight p q` as above and `isEstimator p q f X n ω`, the average
`(1/n) ∑_{i<n} f(X i ω) · isWeight p q (X i ω)`.

- `integral_mul_isWeight`: for a finite measure `p`, a σ-finite `q` and `f ∈ L¹(p)`,
  `∫ f w dq = ∫ f dp − ∫ f d(p.singularPart q)`. The importance sampling estimate misses exactly
  the integral of `f` over the part of `p` that `q` cannot see (Owen, §9.1, (9.2), p. 4, in the
  density form).
- `integral_isEstimator`: if `p` is finite, `q` a probability measure, `f ∈ L¹(p)`, the support
  condition holds and `n ≥ 1`, then `E isEstimator = ∫ f dp` for samples of law `q` (Owen,
  Theorem 9.1, p. 5). No independence is needed.

Route: by the Lebesgue decomposition `q.withDensity (p.rnDeriv q) + p.singularPart q = p`, the
first statement is `∫ f w dq = ∫ f d(q.withDensity w)`. Under the support condition the
singular part is carried by a `q`-null set on which `|f| p` has no mass, so `∫ f d(p.singularPart
q) = 0`; the mean of the average is the mean of one term.

**Checks.**
- `p` uniform on `{0, 1}`, `q = δ₀`, `f = 1`: `w(0) = 1/2`, so `∫ f w dq = 1/2`, and
  `p.singularPart q = (1/2) δ₁` accounts for the missing `1/2`; the support condition fails.
- Same `p` and `q`, `f = 1_{0}`: the support condition holds and `∫ f w dq = 1/2 = ∫ f dp`,
  although `p` is not absolutely continuous with respect to `q`.
- `n = 0`: the estimate is `0`, which is why `n ≥ 1` is assumed.

*Needs:* Mathlib `Measure.rnDeriv`, `Measure.singularPart`, `Measure.rnDeriv_add_singularPart`,
`MeasureTheory.integral_rnDeriv_smul`, `HasLaw`.

### 1.2 The variance of the estimate

`variance_isEstimator`: for finite `p`, probability `q`, `f` almost everywhere strongly measurable
for `p`, the support condition, `f w ∈ L²(q)` and pairwise independent samples of law `q`, for
every `n`,
`Var isEstimator = (∫ f² w dp − (∫ f dp)²)/n` (Owen, Theorem 9.1 and (9.4), p. 5). Equivalently
the variance of one term is `∫ (f w − μ)² dq`, the second form of (9.4).

Route: `∫ (f w)² dq = ∫ f² w dp` under the support condition, by the same decomposition as 1.1;
the variance of the average is the sum of the variances by `IndepFun.variance_sum`. For `n = 0`
both sides are `0`.

**Checks.**
- `p = N(0, 1)`, `f(x) = x`, `q = N(0, σ²)`: `∫ f² w dp = σ/(2 − σ⁻²)^(3/2)` for `σ² > 1/2`,
  and `f w ∉ L²(q)` for `σ² ≤ 1/2` (Owen, Example 9.1, p. 7). At `σ² = 1` the value is `1`, the
  plain Monte Carlo variance; at `σ² = 2` it is `√2/1.5^(3/2) ≈ 0.7698`, which is the minimum
  over `σ²`.
- `q = p`: the weight is `1` `p`-almost everywhere and the formula is `Var_p(f)/n`.
- Measurability of `f` for `p` is assumed. On `{a, b, 1, 2}` with the σ-algebra generated by
  `{a}`, `{b}`, `{1, 2}`, take `q = ½δ_a + ½δ_b`, `p = q` plus mass `1` on the atom `{1, 2}`, and
  `f = (1, 2, 1, 0)`. The support condition holds (the lower integral of `|f|` over `{1, 2}` is
  `0`) and `f w ∈ L²(q)` with variance `1/4`, so the left side is `1/(4n)`; but `∫ f dp` is the
  junk value `0` and the right side is `5/(2n)` or `0`, according to the value of `w` on `{1, 2}`.

*Needs:* 1.1; Mathlib `MeasureTheory.lintegral_rnDeriv_mul`, `IndepFun.variance_sum`, `variance`.

### 1.3 The optimal proposal

Define `optimalProposal p f = (∫⁻ ‖f‖ₑ dp)⁻¹ • p.withDensity ‖f‖ₑ`, the measure proportional to
`|f| p`. When `0 < ∫⁻ ‖f‖ₑ dp < ∞` it is a probability measure; when the integral is `0` or `∞`
it is the zero measure.

- `sq_lintegral_le_lintegral_mul_isWeight_sq` (Kahn–Marshall): for a finite measure `p`, a
  probability measure `q`, measurable `f` and the support condition,
  `(∫⁻ ‖f‖ₑ dp)² ≤ ∫⁻ ‖f w‖ₑ² dq`. Since the mean of `f w` is `μ` under the support condition, no
  proposal gives variance below `(∫ |f| dp)² − μ²` (Owen, §9.1, p. 6, with the attribution to
  Kahn and Marshall, 1953).
- `lintegral_mul_isWeight_optimalProposal_sq`: for measurable `f` with `∫⁻ ‖f‖ₑ dp < ∞`, the
  optimal proposal attains the bound: `∫⁻ ‖f w*‖ₑ² dq* = (∫⁻ ‖f‖ₑ dp)²`.
- Zero variance: if moreover `f ≥ 0` `p`-almost everywhere and `∫ f dp > 0`, the attained second
  moment is `μ²` and the mean of `f w*` under `q*` is `μ` by 1.1, so `f w*` has variance `0` under
  the optimal proposal and the estimate is exact (Owen, p. 5). This is a consequence of the
  attainment and is not stated separately.

Route: `∫ |f| dp = ∫ |f| w dq ≤ (∫ (f w)² dq)^(1/2)` by Cauchy–Schwarz on the probability space
`(α, q)`. Under `q*`, `w* = c/|f|` on `{f ≠ 0}` with `c = ∫ |f| dp`, and `{f = 0}` is `q*`-null.

**Checks.**
- `p` uniform on `{0, 1, 2}`, `f = (1, −1, 2)`: `∫ |f| dp = 4/3`, `μ = 2/3`, the optimal
  proposal is `(1/4, 1/4, 1/2)`, and its variance is `16/9 − 4/9 = 4/3`, not `0`, because `f`
  changes sign; plain sampling (`q = p`) has second moment `2 > 16/9`.
- The support condition is needed: `p` uniform on `{0, 1}`, `q = δ₀`, `f = 1` give
  `(∫ |f| dp)² = 1 > 1/4 = ∫ (f w)² dq`.
- `∫⁻ ‖f‖ₑ dp = ∞` makes the optimal proposal `0`, both sides of the equality `0` and `∞`; hence the
  finiteness hypothesis. For `∫⁻ ‖f‖ₑ dp = 0` both sides are `0`.

*Needs:* 1.1; Mathlib `Measure.withDensity`, `Measure.rnDeriv_withDensity`,
`Measure.rnDeriv_smul_right`, `ENNReal.lintegral_mul_le_Lp_mul_Lq`.

### 1.4 Bounded weights and defensive mixtures

- `variance_mul_isWeight_le_of_le`: for probability measures `p`, `q`, `f ∈ L²(p)`, the support
  condition and `dp/dq ≤ c` `q`-almost everywhere,
  `Var_q(f w) ≤ c Var_p(f) + (c − 1) μ²` (Owen, Exercise 9.6, p. 40).
- `variance_mul_isWeight_defensive_le`: for `0 < a ≤ 1` and the defensive mixture
  `q_a = a p + (1 − a) q`, `Var_{q_a}(f w) ≤ (Var_p(f) + (1 − a) μ²)/a` for `f ∈ L²(p)`, with no
  condition on `q` (Owen, (9.23), p. 28, attributed there to Hesterberg).

Route: `Var_q(f w) = ∫ f² w dp − μ² ≤ c ∫ f² dp − μ²`, where `w ≤ c` is used only on the part of
`p` absolutely continuous with respect to `q`. The bound is asked `q`-almost everywhere because off
that part (on a `q`-null set) Mathlib's `rnDeriv` is not determined by `p` and `q`. For the mixture
`p ≪ q_a` and `dp/dq_a ≤ 1/a`.

**Checks.**
- `p` uniform on `{0, 1}`, `q = δ₀`, `a = 1/2`: `q_a = (3/4, 1/4)`, `w = (2/3, 2)`, and for
  `f = 1` the variance is `1/3 ≤ (0 + 1/2)/(1/2) = 1`.
- The term `(c − 1) μ²` is needed: with `f = 1`, `Var_p(f) = 0` while in the previous example
  `c = 2` and `Var_{q_a}(w) = 1/3 > 0`. The text of Owen §9.1, p. 7, states the bound as
  `c σ_p²`; Exercise 9.6 has the correct form.
- The support condition is needed in the first bound: `p` uniform on `{0, 1}`, `q` uniform on
  `{0, 2}` in `α = {0, 1, 2}`, `f = 1` give `w = (1, 0)` on `{0, 2}`, so `w ≤ 1` `q`-almost
  everywhere, `Var_q(f w) = 1/4` and right side `0`.

*Needs:* 1.2; Mathlib `variance`, `MeasureTheory.lintegral_rnDeriv_mul`.

### 1.5 The sample size and the Kullback–Leibler divergence

Let `p`, `q` be probability measures, `L = (klDiv p q).toReal` the Kullback–Leibler divergence of
`p` from `q` (Mathlib's `InformationTheory.klDiv`, read in `ℝ`), and `t ≥ 0`.

- `integral_abs_isEstimator_sub_le`: if `p ≪ q`, `f ∈ L²(p)`, the samples are independent with
  law `q` and `exp(L + t) ≤ n`, then
  `E |isEstimator − ∫ f dp| ≤ ‖f‖_{L²(p)} (exp(−t/4) + 2 √(p{log w > L + t/2}))`
  (Chatterjee–Diaconis, Theorem 1.1, first part, p. 3, stated there for `n = exp(L + t)`).
- `measureReal_isEstimator_one_ge_le`: if the samples have law `q` (no independence) and
  `n ≤ exp(L − t)`, then for `0 < δ < 1`,
  `P(isEstimator of 1 ≥ 1 − δ) ≤ exp(−t/2) + p{log w ≤ L − t/2}/(1 − δ)` (Chatterjee–Diaconis,
  Theorem 1.1, second part, p. 3).

Route (the source's proof, Section 4, p. 21): truncate `f` where `w > a = exp(L + t/2)`; the
truncated part costs `‖f‖ √(p{w > a})` twice by Cauchy–Schwarz, and the rest has variance at most
`a ‖f‖²/n ≤ exp(−t/2) ‖f‖²`. For the second part, a union bound gives
`P(max w(Xᵢ) > a) ≤ n/a ≤ exp(−t/2)` with `a = exp(L − t/2)`, and Markov's inequality bounds the
average of the truncated weights. The proofs use no property of `L`, so both bounds hold for any
real `L`; in particular they hold, with `L = 0`, when the divergence is infinite.

**Checks.**
- The direction of the divergence matters: for `p = (1/2, 1/2)` and `q = (3/4, 1/4)`,
  `L = KL(p‖q) = (1/2) log(4/3) ≈ 0.1438`, while `KL(q‖p) ≈ 0.1308`.
- `q = p`: `L = 0`, `w = 1` and the event `{log w > t/2}` is empty, so the first bound says that the
  plain average of `n ≥ eᵗ` points has mean absolute error at most `‖f‖ exp(−t/4)`; the plain
  variance bound gives the stronger `‖f‖ n^(−1/2) ≤ ‖f‖ exp(−t/2)`. For `f = 1` the estimate is
  exact.
- Exact enumeration over all samples on spaces of at most four points with `n ≤ 7` (several
  hundred random `p`, `q`, `f`) satisfies both bounds.

*Needs:* 1.1, 1.2; Mathlib `InformationTheory.klDiv`, `integral_mul_le_Lp_mul_Lq_of_nonneg`,
`mul_meas_ge_le_integral_of_nonneg`, `IndepFun.variance_sum`.

### Examples

Gaussian proposals for a Gaussian target (1.2); the optimal proposal of a function that changes
sign (1.3); a defensive mixture with a point-mass proposal (1.4).

### Dependencies

Mathlib only. Within the layer, 1.2 and 1.3 use 1.1, 1.4 uses 1.2, and 1.5 uses 1.1 and 1.2.

## Layer 2: self-normalized importance sampling

### 2.1 Consistency

Define `snisEstimator p q f X n ω = ∑_{i<n} f(X i ω) w(X i ω) / ∑_{i<n} w(X i ω)`.

- `ae_tendsto_snisEstimator`: for a finite measure `p` with `p ≪ q`, `f ∈ L¹(p)` and
  pairwise independent samples of law `q`, the estimate converges almost surely to
  `p(α)⁻¹ ∫ f dp`, the mean of `f` under `p` normalized (Owen, Theorem 9.2, p. 8, for a
  probability density).
- Scale invariance: for `0 < c < ∞` the estimates for `c • p` and `p` agree almost surely, because
  `d(c p)/dq = c · dp/dq` `q`-almost everywhere; so `p` need only be known up to a constant.

Route: the strong law (`strong_law_ae`) for numerator and denominator, whose limits are `∫ f dp`
and `p(α)` by 1.1 with `p ≪ q`. For `p = 0` the weights vanish `q`-almost everywhere and both
sides are `0`; otherwise `p(α) > 0`.

**Checks.**
- `p ≪ q` is needed, not only the support condition: `p` uniform on `{0, 1}`, `q = δ₀`, `f = 1_{0}`
  gives the estimate `1` at every `n ≥ 1`, while the mean of `f` under `p` is `1/2`.
- `f = 1`: the estimate is `1` as soon as one weight is positive; the unnormalized estimate of 1.1
  is not.

*Needs:* 1.1; Mathlib `strong_law_ae`, `HasLaw`.

### 2.2 The central limit theorem

Define `snisAsymptoticVariance p q f = ∫⁻ (dp/dq)² ‖f − ∫ f dp‖ₑ² dq` in `ℝ≥0∞`.

`tendstoInDistribution_snisEstimator`: for probability measures `p ≪ q`, `w ∈ L²(q)`,
`f w ∈ L²(q)` and independent samples of law `q`, `√n (snisEstimator − ∫ f dp)` converges in law
to `N(0, snisAsymptoticVariance p q f)` (Owen, (9.8), p. 9, as a delta-method approximation).

Route: `√n (μ̃ₙ − μ) = Aₙ · (1/Dₙ)` with `Aₙ = n^(−1/2) ∑ w(Xᵢ)(f(Xᵢ) − μ)` and
`Dₙ = n⁻¹ ∑ w(Xᵢ)`. The summands of `Aₙ` are centred (by 1.1) with variance the asymptotic
variance, so the central limit theorem applies; `1/Dₙ → 1` almost surely, hence in probability;
Slutsky's theorem with multiplication finishes.

**Checks.**
- `p = N(0, 1)`, `q = N(0, 4)`, `f(x) = x²`: `w(x) = 2 exp(−3x²/8)` and the asymptotic variance is
  `(2/√(7/4)) (3/(4a²) − 1/a + 1)` with `a = 7/8`, about `1.2650`, below the plain value
  `Var_p(x²) = 2`; a simulation with `n = 400` and 4000 repetitions gives `n Var ≈ 1.25`.
- `f` constant: the estimate is exact as soon as one weight is positive, and the asymptotic variance
  is `0`.

*Needs:* 1.1, 2.1; Mathlib `tendstoInDistribution_inv_sqrt_mul_sum_sub`,
`TendstoInDistribution.continuous_comp_prodMk_of_tendstoInMeasure_const`,
`tendstoInMeasure_of_tendsto_ae`, `strong_law_ae`, `gaussianReal`.

### 2.3 The optimal self-normalized proposal

- `sq_lintegral_le_snisAsymptoticVariance`: for probability measures `p ≪ q` and measurable `f`,
  `(∫⁻ ‖f − μ‖ₑ dp)² ≤ snisAsymptoticVariance p q f` (Owen, (9.10), p. 9, attributed there to
  Hesterberg, 1988).
- Attainment: for measurable `f` with `∫⁻ ‖f − μ‖ₑ dp < ∞`, the proposal
  `optimalProposal p (f − μ)`, proportional to `|f − μ| p`, attains the bound (Owen, Exercise
  9.15(a), p. 42). Since `(dp/dq)² ‖f − μ‖ₑ² = ‖(f − μ) w‖ₑ²` `q`-almost everywhere, this is the
  attainment of 1.3 applied to `f − μ`, and it is not stated separately.

So self-normalized sampling cannot have zero asymptotic variance unless `f` is `p`-almost surely
constant. The optimal proposal dominates `p` only when `f ≠ μ` `p`-almost everywhere; the equality
is a statement about the number `snisAsymptoticVariance`, and the consistency of 2.1 needs that
domination.

Route: 1.3 applied to `f − μ`, since `snisAsymptoticVariance p q f` is the Kahn–Marshall second
moment of `f − μ`; the support condition for `f − μ` follows from `p ≪ q`.

**Checks.**
- `f = 1_A` with `μ = p(A)`: the bound is `(2μ(1 − μ))²` and the optimal proposal puts mass `1/2`
  on `A` (Owen, Example 9.4, p. 10). For `μ = 0.01` this is `0.00039204`, against `μ(1 − μ) =
  0.0099` for plain sampling.

*Needs:* 1.3; Mathlib `MeasureTheory.lintegral_rnDeriv_mul`.

### 2.4 Defensive self-normalized sampling

`snisAsymptoticVariance_defensive_le`: for probability measures `p`, `q`, measurable `f` and
`0 < a ≤ 1`, the defensive mixture `q_a = a p + (1 − a) q` has
`snisAsymptoticVariance p q_a f ≤ evariance f p / a` (Owen, Theorem 9.5, p. 28, after Hesterberg,
1995; Exercise 9.8, p. 40, for bounded weights).

Route: `∫ w² (f − μ)² dq_a = ∫ w (f − μ)² dp` and `w ≤ 1/a`.

**Checks.**
- `p` uniform on `{0, 1}`, `q = δ₀`, `a = 1/2`, `f = 1_{1}`: `μ = 1/2`, the asymptotic variance is
  `(4/9)(1/4)(3/4) + 4 (1/4)(1/4) = 1/3`, and the bound is `(1/4)/(1/2) = 1/2`.

*Needs:* 1.4; Mathlib `evariance`, `MeasureTheory.lintegral_rnDeriv_mul`.

### Examples

The Gaussian example of 2.2; rare events and the optimal self-normalized proposal (2.3).

### Dependencies

1.1 (2.1, 2.2), 1.3 (2.3), 1.4 (2.4); Mathlib.

## Layer 3: control variates

### 3.1 Optimal coefficients

For `Y : Ω → ℝ` and controls `Z : Ω → ι → ℝ` with `ι` finite, define `controlCovMatrix P Z`, the
matrix `(Cov(Zᵢ, Zⱼ))ᵢⱼ`, and write `c = (Cov(Y, Zⱼ))ⱼ`. When every `Zⱼ` is a.e. measurable (for
instance square integrable), `controlCovMatrix P Z` equals Tau Ceti's `TauCeti.covMatrix` of the
law of `Z` viewed in `EuclideanSpace ℝ ι` (the law of `ω ↦ WithLp.toLp 2 (Z ω)`); the random-vector
form is used because the controls are random variables on one probability space together with `Y`.

`isLeast_variance_sub_controls`: if `Y` and every `Zⱼ` are square integrable and the covariance
matrix `Σ` is positive definite, the least value of `Var(Y − ∑ βⱼ Zⱼ)` over `β ∈ ℝ^ι` is
`Var Y − cᵀ Σ⁻¹ c`, attained at `β = Σ⁻¹ c` (Owen, (8.31) and (8.32), pp. 30–31). The known means
of the controls play no role in the variance: they make `Ȳ − βᵀ(Z̄ − θ)` unbiased.

Route: `Var(Y − βᵀZ) = Var Y − 2βᵀc + βᵀΣβ`, a strictly convex quadratic in `β`, completed to a
square around `Σ⁻¹ c`.

**Checks.**
- One control: the minimum is `(1 − ρ²) Var Y` at `β = Cov(Y, Z)/Var Z` (Owen, p. 29). For `U`
  uniform on `[0, 1]`, `Y = e^U`, `Z = U`: `Var Y ≈ 0.24204`, `Cov ≈ 0.14086`, `Var Z = 1/12`, the
  minimum is `≈ 0.0039402` and `ρ² ≈ 0.9837`.
- No controls (`ι` empty): the value is `Var Y`.
- Positive definiteness is needed for the formula: two equal controls give a singular `Σ`, whose
  Mathlib inverse is `0`, and the formula would read `Var Y`.

*Needs:* Mathlib `covariance`, `variance_add`, `covariance_self`, `Matrix.PosDef`,
`Matrix.mulVec`, `dotProduct`.

### 3.2 The estimated coefficient

Define `cvCoeffHat f h X n`, the least-squares coefficient
`∑ (f(Xᵢ) − f̄)(h(Xᵢ) − h̄) / ∑ (h(Xᵢ) − h̄)²`, and `regressionEstimator Q f h X n`, the estimate
`f̄ − β̂ₙ (h̄ − ∫ h dQ)`.

`tendstoInDistribution_regressionEstimator`: for a probability measure `Q`, `f, h ∈ L²(Q)` and
independent samples of law `Q`, `√n (regressionEstimator − ∫ f dQ)` converges in law to
`N(0, Var f − Cov(f, h)²/Var h)`, the optimal variance of 3.1 (Owen, (8.34) and the discussion on
p. 32). With `Var h = 0` the control is almost surely constant, the estimate is the plain average
and the variance reads `Var f`.

Route: by (8.34), `√n (μ̂ − μ) = √n (μ̂_{β*} − μ) + (β̂ₙ − β*) · √n (θ − h̄)`. The first term
satisfies the central limit theorem; `β̂ₙ → β*` almost surely by the strong law, and `√n (h̄ − θ)`
converges in law, hence is bounded in probability, so the product tends to `0` in probability
(MathematicalStatisticsFoundations 8.2 and 8.3); Slutsky's theorem finishes.

**Checks.**
- `Y = e^U`, `h = U`: a simulation with `n = 400` and 4000 repetitions gives `n Var ≈ 0.00400`
  against the limit `0.00394`, and the plain average has `0.242`.

*Needs:* 3.1; Mathlib `tendstoInDistribution_inv_sqrt_mul_sum_sub`,
`tendstoInDistribution_of_tendstoInMeasure_sub`, `strong_law_ae`, `tendstoInMeasure_of_tendsto_ae`;
MathematicalStatisticsFoundations 8.2, 8.3.

### Examples

The exponential of a uniform variable with the variable itself as control (3.1, 3.2).

### Dependencies

Mathlib; MathematicalStatisticsFoundations 8.2 and 8.3 (3.2). No other layer.

## Layer 4: antithetic variates

### 4.1 Harris's inequality for product measures on `ℝ^ι`

`covariance_nonneg_of_monotone`: for a finite type `ι`, probability measures `ν i` on `ℝ` and
`f, g : (ι → ℝ) → ℝ` monotone for the coordinatewise order and square integrable under
`Measure.pi ν`, `Cov(f, g) ≥ 0`. (Proved here; attributed in prose to Harris, 1960, for product
measures on `{0, 1}^n`, and to Esary, Proschan and Walkup, 1967, for independent random
variables.) Mathlib's Fortuin–Kasteleyn–Ginibre inequality `fkg`, for nonnegative monotone functions
on a finite distributive lattice with a log-supermodular weight, gives the case of finitely
supported laws `ν i` (the product weights are log-modular on the finite product of their supports,
and `f`, `g` may be shifted to be nonnegative); the statement for arbitrary laws on `ℝ` is not in
Mathlib.

Route: for one coordinate, `∫∫ (f(x) − f(y))(g(x) − g(y)) dν(x) dν(y) ≥ 0` because the two factors
have the same sign; for more coordinates, induction with Fubini, conditioning on all coordinates
but one: the conditional means of `f` and `g` remain monotone.

**Checks.**
- Monotonicity is needed: `f(x) = x`, `g(x) = −x` under any non-Dirac `ν` give `Cov = −Var < 0`.
- Exact computation on products of one to three laws with two or three atoms, for random monotone
  `f` and `g` built from indicators of up-sets, gives a nonnegative covariance in every case.
- Square integrability is part of the statement: for coordinatewise monotone functions on `ℝ²`
  Borel measurability is not automatic (the indicator of the union of `{x + y > 0}` with a
  non-Borel subset of the antidiagonal is monotone).

*Needs:* Mathlib `Measure.pi`, `measurePreserving_piFinSuccAbove`, `integral_prod`, `covariance`;
optionally `fkg` for the finitely supported case.

### 4.2 Antithetic pairs

`variance_antithetic_le`: if each `T i : ℝ → ℝ` is antitone and preserves `ν i`, and `f` is
monotone and square integrable under `Measure.pi ν`, then with `T̃ x = (T i (x i))ᵢ`,
`Cov(f, f ∘ T̃) ≤ 0` and `Var((f + f ∘ T̃)/2) ≤ Var(f)/2`. Since `n/2` antithetic pairs average
`n` evaluations, the antithetic estimate has variance at most that of `n` independent points
(Owen, §8.2, (8.3) and p. 7, where the correlation is said to be negative; the weak inequality
is stated here, and it also covers integrands of variance `0`).

Route: `f ∘ T̃` is antitone and has the law of `f` by `measurePreserving_pi`; apply 4.1 to `f` and
`−f ∘ T̃`, and `Var((f + f ∘ T̃)/2) = (Var f + Cov(f, f ∘ T̃))/2`.

**Checks.**
- `ν` uniform on `[0, 1]`, `T x = 1 − x`, `f(x) = x`: `Cov = −1/12` and the antithetic average is
  the constant `1/2`.
- `f(x) = eˣ` on the uniform law: `Var f ≈ 0.24204` and the antithetic average has variance
  `((e² − 1) + 2e)/4 − (e − 1)² ≈ 0.0039125`.
- `f(x) = (x − 1/2)²`, not monotone: `f ∘ T = f`, and the antithetic average has variance `Var f`,
  twice the bound.

*Needs:* 4.1; Mathlib `measurePreserving_pi`, `Antitone.measurable`, `variance_add`.

### Examples

The uniform cube with the reflection `x ↦ 1 − x` (4.2).

### Dependencies

Mathlib. No other layer.

## Layer 5: stratified sampling

### 5.1 The stratified estimate

Let `Q` be a probability measure on `α`, `s : α → ι` a stratum map to a finite type with
measurable fibres, `stratumWeight Q s h = Q(s = h)`, and `Q[|s ⁻¹' {h}]` the conditional law on
stratum `h`. Samples `X (h, j)`, `(h, j) : ι × ℕ`, are independent and `X (h, j)` has the
conditional law of stratum `h`; with `n h` points in stratum `h`, `stratifiedEstimator` is
`∑_h ω_h (1/n_h) ∑_{j < n_h} f(X (h, j))`. A stratum with `Q(s = h) = 0` has the zero measure as
conditional law, which no random variable has, so the hypotheses force every stratum to have
positive probability.

`integral_variance_stratifiedEstimator`: for `f ∈ L²(Q)` and `n h ≥ 1` for every `h`, the
estimate has mean `∫ f dQ` and variance `∑_h ω_h² σ_h²/n_h`, where `σ_h²` is the variance of `f`
under `Q[|s ⁻¹' {h}]` (Owen, (8.7) and (8.8), pp. 11–12).

**Checks.**
- Exact enumeration on a four-point space with two strata of weights `1/2`, `n = (2, 1)` and
  `f = (2, −1, 5, 1)`, `Q = (1/6, 1/3, 1/4, 1/4)`: mean `3/2`, variance `5/4` by both
  enumeration and formula.
- `f` constant on each stratum: the variance is `0`.
- `n h = 0` for some `h` drops the stratum and biases the estimate.

*Needs:* Mathlib `ProbabilityTheory.cond`, `ProbabilityTheory.cond_apply`,
`IndepFun.variance_sum`, `HasLaw`.

### 5.2 Proportional allocation

`variance_stratifiedEstimator_le_of_proportional`: if `n h = N ω_h` for every `h`, the variance
is `(1/N) ∑_h ω_h σ_h² ≤ Var_Q(f)/N` (Owen, (8.13) and (8.14), p. 13). The difference is the
between-strata variance `∑_h ω_h (μ_h − μ)²` divided by `N` (Owen, (8.9), p. 12).

Route: 5.1 and the decomposition of `Var_Q(f)` into within- and between-strata parts, the law of
total variance for the σ-algebra generated by `s`.

**Checks.**
- `Q` uniform on `[0, 1]`, strata `[0, 1/2)` and `[1/2, 1]`, `f(x) = x`, `N = 2`: variance
  `2 · (1/4)(1/48) = 1/96` against `(1/12)/2 = 1/24`.

*Needs:* 5.1; Mathlib `integral_condVar_add_variance_condExp`.

### 5.3 Neyman allocation

`sq_sum_le_variance_stratifiedEstimator`: if `∑_h n h = N` and every `n h ≥ 1`, the variance is at
least `(∑_h ω_h σ_h)²/N`, with equality when `n_h ∑_k ω_k σ_k = N ω_h σ_h` for every `h` (Owen,
(8.17) and (8.18), p. 14; Neyman, 1934).

Route: 5.1 and Cauchy–Schwarz in the form `(∑ a_h)²/∑ n_h ≤ ∑ a_h²/n_h`
(`Finset.sq_sum_div_le_sum_sq_div`).

**Checks.**
- Equal `σ_h`: Neyman allocation is proportional allocation.
- `n h ≥ 1` is needed: two strata with `ω = (1/2, 1/2)`, `σ = (1, 1)` and `n = (0, N)` give
  variance `1/(4N)` against the bound `1/N`.
- Every `σ_h = 0`: the bound and the variance are `0`.

*Needs:* 5.1; Mathlib `Finset.sq_sum_div_le_sum_sq_div`.

### Examples

The uniform law cut at `1/2` (5.2).

### Dependencies

Mathlib. No other layer.

## Downstream consumers

Sequential Monte Carlo (Feynman–Kac particle approximations) uses the importance weights and the
self-normalized estimate of Layers 1 and 2; Markov chain Monte Carlo with control variates uses
Layer 3.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: the mean and variance of the
importance sampling estimate, the Kahn–Marshall optimal proposal, bounded weights and defensive
mixtures, the Chatterjee–Diaconis sample-size bounds, the consistency, asymptotic normality and
optimal proposal of self-normalized importance sampling, optimal control-variate coefficients and
the regression estimator, Harris's inequality for product measures on `ℝ^ι` with antithetic pairs,
and the stratified estimate with proportional and Neyman allocation.

Already in the library and therefore not targets: Radon–Nikodym derivatives and the Lebesgue
decomposition, variances and covariances of sums, the strong law of large numbers, the central
limit theorem, Slutsky's theorem and the Kullback–Leibler divergence, all in Mathlib. Mathlib also
has the Fortuin–Kasteleyn–Ginibre inequality and the Harris–Kleitman inequality on finite
distributive lattices; 4.1 is the measure-theoretic statement for products of laws on `ℝ`, which
it does not contain.

Left to other roadmaps:

- MathematicalStatisticsFoundations owns the stochastic algebra of convergence in probability
  (8.2, 8.3), used above, the delta method (8.4), the i.i.d. vocabulary and the weak law (8.5), and
  the Rao–Blackwell theorem (4.2), which is variance reduction by conditioning; none of them is
  restated. Its simple random sampling design (9.5) is sampling without replacement from a finite
  population, a different design from the stratified sampling of Layer 5.
- MathematicalStatisticsNonparametric 1.2 owns the chi-squared divergence; for `p ≪ q`,
  `∫ w² dq = 1 + chiSqDiv p q`, so the variance of the weight is that divergence. No statement
  above is about it.
- StatisticalLearningTheory (an open roadmap, not on main), 8.2, states the change of measure
  `∫ L d(μT ⊗ κ) = ∫ (dμT/dμS) L d(μS ⊗ κ)` under covariate shift for `μT ≪ μS`, the special case of
  the identity of 1.1 with no singular part on a product with a common kernel, and
  importance-weighted validation: unbiasedness, a mean squared error bound `B/n` and a Bernstein
  bound for a loss in `[0, 1]` with weights bounded by `B`. The statements of 1.1 and 1.2 here
  are for every integrable `f` under the support condition, with the exact variance; this roadmap
  does not depend on that one.
- BernoulliPercolation (an open roadmap, not on main), 3.1, owns Harris's inequality for Bernoulli
  random subsets of a countable set. 4.1 here is the inequality for finite products of laws on
  `ℝ`. The two agree only on their common case, finitely many coordinates with Bernoulli laws
  (identify a subset with its indicator vector), and neither implies the other: that one allows
  countably many coordinates, this one arbitrary laws on `ℝ` and square-integrable functions.
  This roadmap does not depend on that one.
- RenyiDivergenceAndPrivacy (a roadmap not on main) treats the Rényi divergence of order 2,
  `log(1 + χ²)`; nothing above uses or restates it. PACBayesBounds (a roadmap not on main) treats
  the change of measure inequality of PAC-Bayesian bounds, a different statement from 1.1.
- Markov chain Monte Carlo (MarkovChainMixing, LangevinAndHamiltonianMonteCarlo, open roadmaps not
  on main) samples dependent points; every statement here is about independent samples.

Outside the scope: multiple importance sampling and the balance heuristic; mixture importance
sampling with control variates (Owen and Zhou); exponential tilting and its asymptotic optimality
for rare events; nonasymptotic bias and mean squared error bounds for self-normalized importance
sampling; the multivariate regression estimator with estimated coefficients; common random
numbers; Latin hypercube and quasi-Monte Carlo sampling; optimal strata; costs and efficiency.

## Exact supplier contracts

### From Mathlib

- `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean`: `Measure.rnDeriv`,
  `Measure.singularPart`, `Measure.rnDeriv_add_singularPart` (`q.withDensity (p.rnDeriv q) +
  p.singularPart q = p`).
- `Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean`:
  `MeasureTheory.lintegral_rnDeriv_mul` and `MeasureTheory.integral_rnDeriv_smul` (for `p ≪ q`,
  integrals against `p` are integrals of `w ·` against `q`), `Measure.rnDeriv_withDensity`,
  `Measure.rnDeriv_smul_right`.
- `Mathlib/MeasureTheory/Integral/MeanInequalities.lean`: `ENNReal.lintegral_mul_le_Lp_mul_Lq`
  and `integral_mul_le_Lp_mul_Lq_of_nonneg` (Hölder, used with exponents `2, 2`).
  `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`: `mul_meas_ge_le_integral_of_nonneg`
  (Markov's inequality).
- `Mathlib/Probability/Moments/Variance.lean`: `variance`, `evariance`, `variance_add`,
  `covariance_self`, `IndepFun.variance_sum` (pairwise independent square-integrable summands).
  `Mathlib/Probability/Moments/Covariance.lean`: `covariance`.
  `Mathlib/Probability/CondVar.lean`: `integral_condVar_add_variance_condExp` (law of total
  variance).
- `Mathlib/Probability/StrongLaw.lean`: `ProbabilityTheory.strong_law_ae` (pairwise independent,
  identically distributed, integrable). `Mathlib/Probability/CentralLimitTheorem.lean`:
  `tendstoInDistribution_inv_sqrt_mul_sum_sub` (independent, identically distributed, square
  integrable, with a limit of law `gaussianReal 0 Var`).
- `Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`: `TendstoInDistribution`,
  `TendstoInDistribution.continuous_comp_prodMk_of_tendstoInMeasure_const` (Slutsky with a
  continuous map), `tendstoInDistribution_of_tendstoInMeasure_sub`.
  `Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`: `tendstoInMeasure_of_tendsto_ae`.
- `Mathlib/Probability/HasLaw.lean`: `HasLaw`. `Mathlib/Probability/Independence/Basic.lean`:
  `iIndepFun`. `Mathlib/Probability/ConditionalProbability.lean`: `ProbabilityTheory.cond` with the
  notation `Q[|s]`, `ProbabilityTheory.cond_apply`.
  `Mathlib/Probability/Distributions/Gaussian/Real.lean`: `gaussianReal`.
- `Mathlib/InformationTheory/KullbackLeibler/Basic.lean`: `InformationTheory.klDiv`
  (`∞` unless `p ≪ q` and the log-likelihood ratio is integrable).
- `Mathlib/Combinatorics/SetFamily/FourFunctions.lean`: `fkg` (finite distributive lattices; the
  finitely supported case of 4.1).
- `Mathlib/MeasureTheory/Constructions/Pi.lean`: `Measure.pi`, `measurePreserving_pi`,
  `measurePreserving_piFinSuccAbove`. `Mathlib/MeasureTheory/Integral/Prod.lean`: `integral_prod`.
  `Antitone.measurable` (an antitone map of `ℝ` is measurable).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef`; `Matrix.mulVec`, `dotProduct`.
  `Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`: `Finset.sq_sum_div_le_sum_sq_div`.

### From Tau Ceti

- `TauCeti/Probability/Moments/Covariance.lean`: `TauCeti.covMatrix μ`, the matrix of coordinate
  covariances of a measure `μ` on `EuclideanSpace ℝ ι`. It is not imported: 3.1 states the same
  matrix in random-vector form as `controlCovMatrix P Z`, which equals `TauCeti.covMatrix` of the
  law of `Z` when every `Zⱼ` is a.e. measurable.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- 8.2: a sequence converging in law is bounded in probability (`IsBoundedInProbability`).
- 8.3: `tendstoInMeasure_mul_zero_of_isBoundedInProbability`, a sequence bounded in probability
  times a sequence tending to `0` in probability tends to `0` in probability. Used in the route of
  3.2 only.

## References

- Art B. Owen, *Monte Carlo theory, methods and examples*, chapters 8 (Variance reduction) and 9
  (Importance sampling), version © 2009–2013, 2018, chapter files `Ch-var-basic.pdf` and
  `Ch-var-is.pdf` at artowen.su.domains/mc; the page, equation, theorem and exercise numbers above
  are those of these files.
- Sourav Chatterjee and Persi Diaconis, *The sample size required in importance sampling*,
  arXiv:1511.01437, version 3 (June 2017); Theorem 1.1 and its proof in Section 4 are cited from
  this version.
- Attributions made in prose without a locator: H. Kahn and A. W. Marshall (1953) for the optimal
  proposal; T. Hesterberg (1988 thesis; 1995) for the optimal self-normalized proposal and
  defensive mixtures; J. M. Hammersley and K. W. Morton (1956) for antithetic variates;
  T. E. Harris (1960) and J. D. Esary, F. Proschan and D. W. Walkup (1967) for the correlation
  inequality of 4.1; J. Neyman (1934) for the optimal allocation.

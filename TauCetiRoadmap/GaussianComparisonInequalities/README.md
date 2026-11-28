# Roadmap: gaussian comparison inequalities

**Summary.** How large is the maximum of finitely many jointly Gaussian random variables? For a
centred Gaussian vector the answer is governed by the geometry of its increments, the mean squared
distances `E(Xᵢ − Xⱼ)²`, and the comparison inequalities of Slepian, Sudakov–Fernique and Gordon
make this precise: a Gaussian vector whose increments are smaller has a smaller expected maximum,
and under equal variances a smaller maximum in the sense of tail probabilities. This
roadmap proves these inequalities for centred Gaussian vectors in `ℝⁿ` with possibly singular
covariance matrices, and draws from them Sudakov's lower bound for the expected maximum and the
sharp bounds on the extreme singular values of Gaussian matrices.

- *Slepian's lemma.* If `X` and `Y` are centred Gaussian vectors in `ℝⁿ` with `E Xᵢ² = E Yᵢ²` for
  every `i` and `E(Xᵢ − Xⱼ)² ≤ E(Yᵢ − Yⱼ)²` for all `i, j`, then for every real `τ` the
  probability that some coordinate of `X` is at least `τ` is at most the same probability for `Y`.
  The equality of variances cannot be dropped.
- *The Sudakov–Fernique inequality.* For `n ≥ 1`, if only the increment condition holds, then
  `E maxᵢ Xᵢ ≤ E maxᵢ Yᵢ`.
- *Gordon's inequality.* For centred Gaussian families indexed by pairs `(u, t)`, with equal
  variances, increments within each row `u` dominated by those of the second family and
  increments between distinct rows dominating them, the probability that `minᵤ maxₜ X(u, t)` is at
  least `τ` is at most the same probability for `Y`, for every real `τ`; and the same holds for
  the expectations.
- *Sudakov's minoration.* There is an absolute constant `c > 0` such that the expected maximum of
  a centred Gaussian vector in `ℝⁿ`, `n ≥ 1`, with `E(Xᵢ − Xⱼ)² ≥ ε²` for all `i ≠ j`, is at least
  `c ε √(log n)`.

As applications, an `m × n` matrix `G` with independent standard Gaussian entries has
`E ‖G‖ ≤ √m + √n` for its operator norm and, for `n ≥ 1`, `E min_{‖u‖ = 1} ‖G u‖ ≥ √m − √n`;
more generally, for a nonempty set `K` of unit vectors, `E inf_{u ∈ K} ‖G u‖` is at least the
expected length of a standard Gaussian vector of `ℝᵐ` minus the Gaussian width of `K`.

The roadmap builds on Mathlib's multivariate Gaussian measures and on Tau Ceti's Gaussian library:
affine images and sums of Gaussian vectors, the chi law of the length of a standard Gaussian
vector, and a lower bound for the expected maximum of independent Gaussians. Gaussian integration
by parts comes from MathematicalStatisticsFoundations. MathematicalStatisticsAsymptotic states the
upper bound `√(2 c log N)` for maxima of sub-Gaussian variables, of which Sudakov's minoration is
a lower counterpart.

Layer 1 below proves the Gaussian interpolation formula and the comparison principle that follows
from it. Layer 2 deduces Slepian's lemma and the Sudakov–Fernique inequality, and Layer 3 Gordon's
inequality, both from Layer 1. Layer 4 proves Sudakov's minoration from Layer 2. Layer 5 treats
Gaussian matrices, using Layers 2 and 3.

## Conventions

- **Gaussian vectors.** A centred Gaussian vector with covariance matrix `S` is Mathlib's
  `multivariateGaussian 0 S` on `EuclideanSpace ℝ ι`, for `S` positive semidefinite
  (`Matrix.PosSemidef`); every statement assumes this of each covariance matrix, since Mathlib
  sets `multivariateGaussian μ S` to the point mass at `μ` when `S` is not positive semidefinite.
  The index type `ι` is `Fin n`, or `Fin m × Fin n` for the doubly indexed families of Layer 3.
  Covariance matrices may be singular; the point mass at `0` is the case `S = 0`.
- **Increments.** The squared increment `E(Xᵢ − Xⱼ)²` of `X ~ N(0, S)` is
  `S i i + S j j − 2 S i j`, and every hypothesis on increments is written in that form. It is
  `0` for `i = j`, so a hypothesis stated for all `i, j` is a condition on distinct pairs.
- **Maxima and tail events.** Expected maxima and min–max values are integrals of
  `Finset.sup'` and `Finset.inf'` over the full index set, which is then assumed nonempty
  (`[NeZero n]`). Tail events are written with quantifiers: `{x | ∃ i, τ ≤ x i}` is the event
  `maxᵢ xᵢ ≥ τ` and `{x | ∀ u, ∃ t, τ ≤ x (u, t)}` is the event `minᵤ maxₜ x(u, t) ≥ τ`, so that
  they need no nonemptiness. Probabilities are `Measure.real`.
- **Derivatives.** `∂ᵢ∂ⱼ f(x)` is `iteratedFDeriv ℝ 2 f x ![eᵢ, eⱼ]` with
  `eᵢ = EuclideanSpace.single i 1`. The functions of Layer 1 are `C²` with bounded second
  derivative, so they grow at most quadratically and are integrable for every Gaussian law.
- **Gaussian matrices.** `toMatrix x` is the `m × n` matrix with entries `x (i, j)`, for `x` in
  `EuclideanSpace ℝ (Fin m × Fin n)`. Under `stdGaussian (EuclideanSpace ℝ (Fin m × Fin n))` its
  entries are independent standard Gaussians. The operator norm `‖A‖` is the `ℓ²` operator norm of
  Mathlib's scope `Matrix.Norms.L2Operator`; `A` acts on vectors through
  `Matrix.toEuclideanLin`. The Gaussian width of a bounded nonempty set `K ⊆ ℝⁿ` is
  `w(K) = E sup_{u ∈ K} ⟪g, u⟫` for a standard Gaussian `g`, and `aₖ` denotes `E ‖h‖` for a
  standard Gaussian vector `h` of `ℝᵏ`, so that `a₀ = 0` and `aₖ = √2 Γ((k + 1)/2)/Γ(k/2)` for
  `k ≥ 1`.

## Layer 1: Gaussian interpolation

### 1.1 The interpolation formula

Prove `hasDerivAt_integral_multivariateGaussian_interpolate`: for positive semidefinite `S` and
`T` and a `C²` function `f` on `ℝⁿ` with bounded second derivative, the function
`Φ(s) = ∫ f d N(0, s S + (1 − s) T)` has, at every `t ∈ (0, 1)`, the derivative
`(1/2) ∑ᵢ ∑ⱼ (S i j − T i j) ∫ ∂ᵢ∂ⱼ f d N(0, t S + (1 − t) T)` (Vershynin, Lemma 7.2.7, p. 163,
there for twice differentiable `f` assuming the expectations finite).

Route: take independent `X ~ N(0, S)` and `Y ~ N(0, T)` on a product space; for `s ∈ [0, 1]` the
vector `Z(s) = √s X + √(1 − s) Y` has law `N(0, s S + (1 − s) T)`, by the affine image and the
sum of independent Gaussian vectors. Differentiate under the integral at `t ∈ (0, 1)`: the
derivative of `f(Z(s))` is `⟨∇f(Z(s)), X/(2√s) − Y/(2√(1 − s))⟩`, dominated near `t` by an
integrable function because `∇f` grows at most linearly. Condition on `Y` and apply Gaussian
integration by parts to the coordinates of `X`, written as `S^(1/2) g` with `g` standard; then
condition on `X` and do the same for `Y`. The two terms combine to the formula.

**Checks.**
- `f(x) = xᵢ xⱼ` with `i ≠ j`: `Φ(s) = s S i j + (1 − s) T i j`, of derivative `S i j − T i j`,
  and the formula gives `(1/2)((S − T) i j + (S − T) j i) = S i j − T i j`. Without the factor
  `1/2` it would give `2(S i j − T i j)`.
- `n = 2`, `f(x) = log(e^(x₁) + e^(x₂))`, `S = A Aᵀ` for a random `A` and `T = b bᵀ` of rank one:
  a central difference of `Φ` at `t = 0.2, 0.5, 0.8`, computed by Gauss–Hermite quadrature,
  agrees with the formula to six decimals, the singular `T` included.
- The growth hypothesis is needed: for `n = 1`, `f(x) = exp(x²)`, `S = 1` and `T = 0`,
  `Φ(s) = (1 − 2s)^(−1/2)` for `s < 1/2` and `f` is not integrable for `s ≥ 1/2`, although `f` is
  smooth.

*Needs:* MathematicalStatisticsFoundations §4.4 (`gaussian_integration_by_parts`, at `θ = 0`,
`v = 1`); Tau Ceti `TauCeti.Probability.map_affine_multivariateGaussian`,
`TauCeti.Probability.multivariateGaussian_conv_multivariateGaussian`,
`TauCeti.Probability.multivariateGaussian_zero_eq_map_stdGaussian_sqrt`; Mathlib
`multivariateGaussian`, `multivariateGaussian_zero_one`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

### 1.2 The comparison principle

Prove `integral_le_integral_multivariateGaussian_of_sum_nonneg`: for positive semidefinite `S`,
`T` and `f` as in 1.1, if `∑ᵢ ∑ⱼ (S i j − T i j) ∂ᵢ∂ⱼ f(x) ≥ 0` for every `x`, then
`∫ f d N(0, T) ≤ ∫ f d N(0, S)` (Vershynin, Lemma 7.2.8, pp. 164–165, where the hypotheses are
equal diagonals, `S i j ≥ T i j` and `∂ᵢ∂ⱼ f ≥ 0` for `i ≠ j`, which imply the sum condition;
Kahane's form of the principle is attributed in prose).

Route: by 1.1, `Φ′ ≥ 0` on `(0, 1)`. `Φ` is continuous on `[0, 1]` by dominated convergence along
the coupling `Z(s)`, with the quadratic bound on `f`; so `Φ(0) ≤ Φ(1)`.

**Checks.**
- `n = 1`, `f(x) = x²`, `S = 1`, `T = 0`: the sum is `2 ≥ 0`, and indeed `0 ≤ 1`. For `−x²` the
  sum is `−2` and the conclusion `0 ≤ −1` fails.
- `n = 0`: both laws are the point mass at the only point and both sides equal `f 0`.

*Needs:* 1.1; Mathlib `monotoneOn_of_deriv_nonneg`, `tendsto_integral_of_dominated_convergence`.

### Examples

For `X = (g, g)` and `Y = (g₁, g₂)` with independent standard `g, g₁, g₂`, `S` is the all-ones
matrix and `T = I₂`. With `f(x) = h(x₁) h(x₂)`, `h` smooth and nonincreasing with values in
`[0, 1]` and with bounded first and second derivatives, the sum condition reads
`2 h′(x₁) h′(x₂) ≥ 0`, so `E h(Y₁) h(Y₂) ≤ E h(g)²`.

### Dependencies

MathematicalStatisticsFoundations §4.4; Tau Ceti `map_affine_multivariateGaussian`,
`multivariateGaussian_conv_multivariateGaussian`, `multivariateGaussian_zero_eq_map_stdGaussian_sqrt`;
Mathlib `multivariateGaussian`, `multivariateGaussian_zero_one`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `monotoneOn_of_deriv_nonneg`,
`tendsto_integral_of_dominated_convergence`. No other layer.

## Layer 2: Slepian's lemma and the Sudakov–Fernique inequality

### 2.1 Slepian's lemma

Prove `slepian`: for positive semidefinite `S`, `T` on `Fin n` with `S i i = T i i` for every `i`
and `S i i + S j j − 2 S i j ≤ T i i + T j j − 2 T i j` for all `i, j`, and for every real `τ`,
the `N(0, S)`-probability of `{x | ∃ i, τ ≤ xᵢ}` is at most its `N(0, T)`-probability
(Vershynin, Theorem 7.2.1, p. 161, for every real `τ`, and Theorem 7.2.9, p. 165, whose proof is
the route; Davidson–Szarek, Remark II.10, with strict inequalities `> λ`).

Route: under equal variances the increment hypothesis says `S i j ≥ T i j`. For `δ > 0` take a
smooth nonincreasing `h` with values in `[0, 1]`, equal to `1` on `(−∞, τ − δ]` and to `0` on
`[τ, ∞)`, and `f(x) = ∏ᵢ h(xᵢ)`. Then `∂ᵢ∂ⱼ f ≥ 0` for `i ≠ j`, the diagonal terms vanish, and 1.2
gives `E_T f ≤ E_S f`. As `δ → 0`, `f` tends pointwise to the indicator of `{∀ i, xᵢ < τ}`; dominated
convergence gives `P_T(max < τ) ≤ P_S(max < τ)`, and passing to complements gives the claim.

**Checks.**
- The equality of variances is needed: for `n = 1`, `S = 1`, `T = 4` the increment hypothesis
  holds trivially, but at `τ = −1` the two probabilities are `Φ(1) ≈ 0.841` and
  `Φ(1/2) ≈ 0.691`, where `Φ` is the standard normal distribution function.
- `S` the all-ones matrix and `T = I₂` (Examples of Layer 1): at `τ = 0` the probabilities are
  `1/2` and `3/4`.
- Monte Carlo on 60 random pairs in dimensions 2 to 4 with equal variances and `S ≥ T` entrywise,
  at `τ ∈ {−2, −1/2, 0, 1/2, 2}` with `2 · 10⁵` samples: no difference above sampling error in
  the wrong direction.

*Needs:* 1.2; Mathlib `tendsto_integral_of_dominated_convergence`, `Measure.real`.

### 2.2 The Sudakov–Fernique inequality

Prove `sudakov_fernique`: for `n ≥ 1` and positive semidefinite `S`, `T` on `Fin n` with
`S i i + S j j − 2 S i j ≤ T i i + T j j − 2 T i j` for all `i, j`,
`∫ maxᵢ xᵢ d N(0, S) ≤ ∫ maxᵢ xᵢ d N(0, T)` (Vershynin, Theorem 7.2.11, p. 166, and
Exercise 7.2.12, p. 167; Davidson–Szarek, Lemma II.9, first part). No hypothesis on the variances
is made.

Route: for `β > 0` apply 1.2 with the roles of `S` and `T` exchanged to
`f_β(x) = β⁻¹ log ∑ᵢ e^(β xᵢ)`, whose second derivative is `β(diag p − p pᵀ)` with
`pᵢ = e^(β xᵢ)/∑ₖ e^(β xₖ)`, bounded by `β`. For a symmetric `σ` and `∑ pᵢ = 1`,
`∑ᵢⱼ σᵢⱼ (δᵢⱼ pᵢ − pᵢ pⱼ) = (1/2) ∑_{i ≠ j} (σᵢᵢ + σⱼⱼ − 2σᵢⱼ) pᵢ pⱼ`; with `σ = T − S` this is
`≥ 0`. So `E_S f_β ≤ E_T f_β`, and `maxᵢ xᵢ ≤ f_β(x) ≤ maxᵢ xᵢ + β⁻¹ log n` gives the claim as
`β → ∞`.

**Checks.**
- `n = 2`: `E max(X₁, X₂) = √((S 1 1 + S 2 2 − 2 S 1 2)/(2π))`, increasing in the increment, which
  is the inequality in this case; for `S = I₂` it is `1/√π ≈ 0.564`, and for the all-ones `S` it is
  `0`.
- The increment hypothesis cannot be reversed: `S = I₂` and `T` the all-ones matrix give
  `0.564 > 0`.
- `n = 1`: both sides are `0`, whatever the variances.
- Monte Carlo on random pairs in dimensions 2 to 4 with unequal variances satisfying the
  hypothesis: no violation.

*Needs:* 1.2; Mathlib `Finset.sup'`, `integral_mono`.

### Examples

Under equal variances, the expectation form of Slepian's lemma, `E max X ≤ E max Y`, is a case of
2.2 and is not stated apart. For `X = (g, g)` and `Y = (g₁, g₂)` 2.2 gives
`E max(g, g) = E g = 0 ≤ 1/√π = E max(g₁, g₂)`.

### Dependencies

Layer 1 (1.2). Mathlib `tendsto_integral_of_dominated_convergence`, `Measure.real`,
`Finset.sup'`, `integral_mono`.

## Layer 3: Gordon's min–max comparison

### 3.1 Gordon's inequality for tails

Prove `gordon`: let `S`, `T` be positive semidefinite on `Fin m × Fin n` with `S p p = T p p`
for every `p`, with `S (u,t)(u,t) + S (u,s)(u,s) − 2 S (u,t)(u,s)` at most the same expression for
`T`, for all `u, t, s` (increments within a row), and with the increment of `T` between `(u, t)`
and `(v, s)` at most that of `S` whenever `u ≠ v` (increments across rows). Then for every real
`τ`, the `N(0, S)`-probability of `{x | ∀ u, ∃ t, τ ≤ x (u, t)}` is at most its
`N(0, T)`-probability (Vershynin, Exercise 7.2.14, pp. 167–168, stated for `τ ≥ 0`; the proof
there does not use the sign of `τ`, and every real `τ` is needed for 3.2).

Route: with `h` as in 2.1, put `f(x) = ∏ᵤ (1 − ∏ₜ h(x (u, t)))`, which tends to the indicator of
`{∀ u, ∃ t, x (u, t) ≥ τ}` as `δ → 0`. For `(u, t) ≠ (u, s)` in one row, `∂∂ f ≤ 0`; for
`u ≠ v`, `∂∂ f ≥ 0`; and the diagonal terms have zero coefficient. Under equal variances the
hypotheses say `S − T ≥ 0` within rows and `S − T ≤ 0` across rows, so the sum of 1.2 is `≤ 0`
and 1.2 applied with the roles exchanged gives `E_S f ≤ E_T f`. Let `δ → 0`.

**Checks.**
- `m = 1` is Slepian's lemma 2.1. `n = 1` is the reflected statement: there the hypothesis says
  that the increments of `X` dominate those of `Y`, and the conclusion
  `P(minᵤ Xᵤ ≥ τ) ≤ P(minᵤ Yᵤ ≥ τ)` follows from 2.1 applied to `−Y` and `−X` at the levels
  `−τ + 1/k`, letting `k → ∞` (the events `max ≥ −τ + 1/k` increase to `max > −τ`).
- `n = 0` with `m ≥ 1`: both events are empty. `m = 0`: both events are everything.
- The equality of variances is needed, by the Check of 2.1 at `m = n = 1`.
- Monte Carlo for `m = n = 2`: 59 pairs `S = T + D` with `D` nonnegative within rows and
  nonpositive across rows, zero on the diagonal, and `S` positive semidefinite; four values of `τ`
  and the expectations, `2 · 10⁵` samples each: no violation.

*Needs:* 1.2; Mathlib `tendsto_integral_of_dominated_convergence`, `Measure.real`.

### 3.2 Gordon's inequality for expectations

Prove `gordon_integral`: under the hypotheses of 3.1 and for `m, n ≥ 1`,
`∫ minᵤ maxₜ x (u, t) d N(0, S) ≤ ∫ minᵤ maxₜ x (u, t) d N(0, T)` (Vershynin, Exercise 7.2.14,
(7.12), p. 168).

Route: write `E Z = ∫₀^∞ P(Z ≥ τ) dτ − ∫_(−∞)^0 P(Z < τ) dτ` for the integrable min–max `Z`
(layer cake applied to the positive and negative parts) and compare the integrands by 3.1.

**Checks.**
- `m = 1`: the expectation form of Slepian's lemma, a case of 2.2.

*Needs:* 3.1; Mathlib `Integrable.integral_eq_integral_meas_le`, `Finset.inf'`, `Finset.sup'`.

### Examples

For `n = 1` and `m = 2`, take the first family `(g₁, g₂)` (increment `2` across its two rows) and
the second `(g, g)` (increment `0`): the hypotheses hold, and 3.2 gives
`E min(g₁, g₂) = −1/√π ≤ 0 = E min(g, g)`.

### Dependencies

Layer 1 (1.2). Mathlib `tendsto_integral_of_dominated_convergence`, `Measure.real`,
`Integrable.integral_eq_integral_meas_le`, `Finset.inf'`, `Finset.sup'`.

## Layer 4: Sudakov's minoration

### 4.1 Sudakov's minoration for separated Gaussian vectors

Prove `sudakov_minoration`: there is `c > 0` such that for every `n ≥ 1`, every positive
semidefinite `S` on `Fin n` and every real `ε` with `ε² ≤ S i i + S j j − 2 S i j` for all
`i ≠ j`, `c ε √(log n) ≤ ∫ maxᵢ xᵢ d N(0, S)` (Vershynin, Theorem 7.4.1, p. 171, for the
`ε`-separated subsets used in its proof; the covering-number form follows by restricting to a
maximal separated subset). The constant is absolute and not specified.

Route: compare `N(0, S)` with `N(0, (ε²/2) I)` by 2.2: the increments of the latter are `ε²`.
So the expected maximum is at least `(ε/√2) E maxᵢ gᵢ` for independent standard `gᵢ`. For
`n ≥ 2`, `E maxᵢ gᵢ ≥ E max(g₁, g₂) = 1/√π`, and `E maxᵢ |gᵢ| ≤ 2 E maxᵢ gᵢ + 2/√(2π)` (bound
`max(A, B) ≤ A⁺ + B⁺` with `A = maxᵢ gᵢ`, `B = maxᵢ(−gᵢ)` of the same law, and `A⁻ ≤ g₁⁻`), while
Tau Ceti gives `E maxᵢ |gᵢ| ≥ √(log n)/32`; together these give `E maxᵢ gᵢ ≥ c₀ √(log n)` for an
absolute `c₀ > 0`. For `n = 1`, `log n = 0` and the expected maximum is `0`. A negative `ε` makes
the left side `≤ 0`, and the expected maximum is `≥ E x₁ = 0`.

**Checks.**
- `n = 2` with `S i i + S j j − 2 S i j = ε²` exactly: the expected maximum is `ε/√(2π)`, so the
  constant can be at most `1/(√(2π) √(log 2)) ≈ 0.479`.
- Independent standard Gaussians (`ε = √2`): `E max` over `n = 2, 3, 10, 100, 1000` is about
  `0.564, 0.846, 1.539, 2.508, 3.241`, and its ratio to `√(log n)` stays between `0.67` and `1.24`;
  a constant above `0.479` is excluded by the previous Check.
- Separation cannot be dropped: `n` equal coordinates have expected maximum `0`.

*Needs:* 2.2; Tau Ceti `TauCeti.Probability.sqrt_log_card_div_le_integral_sup'_abs`; Mathlib
`multivariateGaussian_zero_one`, `stdGaussian`, `stdGaussian_eq_map_pi_orthonormalBasis`.

### Examples

For `X = ⟨g, t⟩`, `t` in a finite set `T ⊆ ℝᵈ` and `g` standard, the increments are `‖s − t‖²`;
4.1 gives `E max_{t ∈ T} ⟨g, t⟩ ≥ c ε √(log |T|)` for every `ε`-separated `T`.

### Dependencies

Layer 2 (2.2). Tau Ceti `sqrt_log_card_div_le_integral_sup'_abs`; Mathlib
`multivariateGaussian_zero_one`, `stdGaussian`, `stdGaussian_eq_map_pi_orthonormalBasis`.

## Layer 5: Gaussian matrices

### 5.1 The operator norm

Define `toMatrix`. Prove `integral_opNorm_toMatrix_le`: for all `m, n`,
`∫ ‖toMatrix x‖ d stdGaussian ≤ √m + √n`, the operator norm being the `ℓ²` operator norm
(Vershynin, Theorem 7.3.1, pp. 168–169; Davidson–Szarek, Theorem II.13, upper estimate, for
`N(0, 1/n)` entries).

Route: `‖G‖ = sup_{u, v} ⟨G u, v⟩` over the unit spheres. For finite sets `U ⊆ Sⁿ⁻¹`, `V ⊆ Sᵐ⁻¹`
compare `X(u, v) = ⟨G u, v⟩` with `Y(u, v) = ⟨g, u⟩ + ⟨h, v⟩`: their increments are
`‖u vᵀ − u′ v′ᵀ‖²_F ≤ ‖u − u′‖² + ‖v − v′‖²` (Vershynin, Exercise 7.3.2). By 2.2,
`E max_{U × V} X ≤ E max_U ⟨g, u⟩ + E max_V ⟨h, v⟩ ≤ aₙ + aₘ`. Exhaust the spheres by finite sets
and use monotone convergence; finally `aₖ ≤ √k` by Jensen. For `m = 0` or `n = 0` the norm is `0`.

**Checks.**
- `m = n = 1`: `E|g| = √(2/π) ≈ 0.798 ≤ 2`, and the sharper `a₁ + a₁ ≈ 1.596`.
- Monte Carlo (`4 · 10⁴` samples) for `(m, n) = (3, 2), (5, 3), (4, 4), (8, 3)`: `E‖G‖` is about
  `2.137, 3.077, 3.123, 3.708`, below `aₘ + aₙ` and `√m + √n`.

*Needs:* 2.2; Tau Ceti `TauCeti.Probability.stdGaussian_map_norm`,
`TauCeti.Probability.integral_id_chiMeasure`, `TauCeti.Probability.map_affine_multivariateGaussian`;
Mathlib `stdGaussian`, `multivariateGaussian_zero_one`, `Matrix.l2_opNorm_def`,
`Matrix.toEuclideanLin`.

### 5.2 Gordon's bound on a subset of the sphere

Prove `integral_norm_sub_gaussianWidth_le_integral_iInf`: for a nonempty `K ⊆ Sⁿ⁻¹`,
`aₘ − w(K) ≤ ∫ inf_{u ∈ K} ‖toMatrix x · u‖ d stdGaussian`. (Proved here. For `K` the whole
sphere it is the bound `E s_min ≥ aₘ − aₙ` of Davidson–Szarek's proof of Theorem II.13; the
general form is attributed in prose to Gordon's work on random subspaces escaping through a mesh.)

Route: for finite `U ⊆ K`, `V ⊆ Sᵐ⁻¹` and an independent standard `γ`, compare
`Y(u, v) = ⟨g, u⟩ + ⟨h, v⟩` with `X(u, v) = ⟨G u, v⟩ + γ`, indexed by `U × V` with rows `u`. Both
have variance `2` because `u` and `v` are unit vectors. Within a row the increments agree
(`‖v − v′‖²`); across rows those of `Y`, `‖u − u′‖² + ‖v − v′‖²`, dominate those of `X`. So 3.2
applies with `Y` as the first family: `E min_U max_V Y ≤ E min_U max_V X ≤ E min_U ‖G u‖`. The left
side is `E min_U ⟨g, u⟩ + E max_V ⟨h, v⟩ ≥ −w(K) + E max_V ⟨h, v⟩`. Let `V` exhaust the sphere,
then `U` exhaust a countable dense subset of `K`, by monotone convergence. For `m = 0` both
`G u = 0` and `aₘ = 0`, and `w(K) ≥ 0`.

**Checks.**
- `K = {u}`: `E ‖G u‖ = aₘ` and `w(K) = 0`, equality.
- The hypothesis `K ⊆ Sⁿ⁻¹` is needed: `K = {0}` gives `0` on the right and `aₘ > 0` on the left
  for `m ≥ 1`.
- Monte Carlo with `m = n = 3` and random sets of 1 to 5 unit vectors: no violation.

*Needs:* 3.2; Tau Ceti `TauCeti.Probability.stdGaussian_map_norm`,
`TauCeti.Probability.integral_id_chiMeasure`, `TauCeti.Probability.map_affine_multivariateGaussian`;
Mathlib `stdGaussian`, `multivariateGaussian_zero_one`, `Matrix.toEuclideanLin`.

### 5.3 The smallest singular value

Prove `sqrt_sub_sqrt_le_integral_iInf_sphere`: for `n ≥ 1` and every `m`,
`√m − √n ≤ ∫ min_{‖u‖ = 1} ‖toMatrix x · u‖ d stdGaussian` (Vershynin, Exercise 7.3.4, p. 170;
Davidson–Szarek, Theorem II.13, lower estimate, for `m ≥ n` in the present notation).

Route: for `m < n` the right side is nonnegative and the left negative. For `m ≥ n`, 5.2 with
`K = Sⁿ⁻¹`, where `w(K) = aₙ`, gives `aₘ − aₙ`, and `aₘ − aₙ ≥ √m − √n` because `aₖ − √k` is
nondecreasing for `k ≥ 1`. Neither source proves this monotonicity; its proof is part of this
target. Put `R(x) = Γ(x + 1)/Γ(x + 1/2)` and `θ(x) = R(x)² − x` for `x ≥ 0`. From the formula for
`aₖ`, `aₖ aₖ₊₁ = k` and `aₖ₊₁² = k + 2θ(k/2)`, so `aₖ₊₁ − aₖ = 2θ/√(k + 2θ)` with `θ = θ(k/2)`.
Log-convexity of `Γ` gives `x ≤ R(x)² ≤ x + 1/2`, so `θ` is bounded, and `Γ(y + 1) = y Γ(y)`
gives the exact recursion `θ(x) = 1/(4(x + 1)) + r(x) θ(x + 1)` with
`r(x) = ((x + 1/2)/(x + 1))²`. The function `L(x) = 1/4 + 1/(64(x + 1))` satisfies
`L(x) ≤ 1/(4(x + 1)) + r(x) L(x + 1)` for `x ≥ 0` (after clearing denominators this is
`2x + 7/4 ≤ 4x + 8`), so `D = θ − L` satisfies `D(x) ≥ r(x) ⋯ r(x + N − 1) D(x + N)`; the product
is at most `(x + 1/2)/(x + N + 1/2)` and `D` is bounded, so `D ≥ 0`. Hence
`2θ(k/2) ≥ 1/2 + 1/(16(k + 2))`. With `(√k + √(k + 1))² ≥ 4k + 2 − 1/(4k)` (from
`√(k² + k) ≥ k + 1/2 − 1/(8k)`), the inequality `2θ/√(k + 2θ) ≥ √(k + 1) − √k` follows, since its
left side increases with `θ`, from `1/(16(k + 2)) ≥ 1/(64k²)`, which holds for `k ≥ 1`.

**Checks.**
- `n = 0` must be excluded: the sphere of `ℝ⁰` is empty, the infimum is `0`, and for `m ≥ 1` the
  left side `√m` is positive.
- `m = n = 1`: `E|g| ≈ 0.798 ≥ 0`. `m = 2`, `n = 1`: `a₂ = √(π/2) ≈ 1.253 ≥ √2 − 1 ≈ 0.414`.
- `aₖ − √k` at `k = 1, 2, 3` is `−0.202, −0.161, −0.136`, increasing. At `k = 0` it is `0`,
  above its value at `k = 1`, which is why the monotonicity starts at `k = 1`.
- The lower bound for `θ`: `θ(0) = 1/π ≈ 0.318 ≥ L(0) = 0.265625`, and
  `θ(1/2) = π/4 − 1/2 ≈ 0.285 ≥ L(1/2) ≈ 0.260`. With `θ ≥ 1/4` alone, the estimate the route
  needs would read `√(k + 1) + √k ≥ 2√(k + 1/2)`, which is false for every `k` by concavity of the square root.
- Monte Carlo for `(m, n) = (3, 2), (5, 3), (8, 3)`: `E s_min` is about `0.885, 0.988, 1.629`,
  above `aₘ − aₙ ≈ 0.342, 0.532, 1.146` and `√m − √n ≈ 0.318, 0.504, 1.096`.

*Needs:* 5.2; Tau Ceti `TauCeti.Probability.integral_id_chiMeasure`,
`TauCeti.Probability.stdGaussian_map_norm`; Mathlib `Real.Gamma`, `Real.Gamma_add_one`,
`Real.convexOn_log_Gamma`.

### Examples

For `m = n`, 5.1 and 5.3 give `0 ≤ E s_min ≤ E ‖G‖ ≤ 2√n`; for `m = 2n`, `E s_min ≥ (√2 − 1)√n`.

### Dependencies

Layers 2 (2.2) and 3 (3.2). Tau Ceti `stdGaussian_map_norm`, `integral_id_chiMeasure`,
`map_affine_multivariateGaussian`; Mathlib `stdGaussian`, `multivariateGaussian_zero_one`,
`Matrix.l2_opNorm_def`, `Matrix.toEuclideanLin`, `Real.Gamma`, `Real.Gamma_add_one`,
`Real.convexOn_log_Gamma`.

## Scope and ownership

This roadmap owns the Gaussian interpolation formula and the comparison principle of Layer 1,
Slepian's lemma, the Sudakov–Fernique inequality, Gordon's inequality in tail and expectation
form, Sudakov's minoration for separated Gaussian vectors, and the bounds on Gaussian matrices of
Layer 5, all stated above.

Already in the libraries and therefore not targets: multivariate Gaussian measures with their
covariances and characteristic functions (Mathlib `Mathlib/Probability/Distributions/Gaussian/`);
affine images and sums of independent multivariate Gaussians, the chi law of the length of a
standard Gaussian vector with its mean, and the lower bound `√(log n)/32` for the expected
maximum of the absolute values of `n` independent standard Gaussians (Tau Ceti, listed in the
supplier contracts).

Left to other roadmaps:

- Gaussian integration by parts is stated by RandomMatrices §2.5 and, in the coordinate form for
  `N(θ, v I)` used in 1.1, by MathematicalStatisticsFoundations §4.4; it is not restated.
- MathematicalStatisticsAsymptotic §3.3 owns the upper bound `E max_j Y_j ≤ √(2 c log N)` for
  sub-Gaussian variables and the chaining bound for sub-Gaussian processes; 4.1 is the lower
  bound for Gaussian vectors and is not a consequence of either.
- RandomMatrices §2.4 bounds the extreme singular values of matrices with independent
  sub-Gaussian entries up to unspecified constants; 5.1 and 5.3 are the sharp bounds for
  standard Gaussian entries.
- GaussianIsoperimetryAndClusters §8.1 owns the Borell–Sudakov–Tsirelson inequality, §8.4 the
  concentration of Lipschitz functions about a median and §8.5 the concentration of the maximum of
  a Gaussian vector about a median. Those are tail bounds about a median, not comparisons between
  two Gaussian vectors; the tail bounds that combine them with 5.1 and 5.3 are not stated here.
- MathematicalStatisticsHighDimensional lists Gaussian comparison among the subjects it leaves to
  others; the phase transitions of basis pursuit that use Gaussian widths are not stated here.

Outside the scope: Gaussian processes on infinite index sets beyond the unit spheres of Layer 5,
majorizing measures and generic chaining, Gordon's inequality without equal variances, the
covering-number form of Sudakov's minoration for infinite index sets, Kahane's inequality for
convex functions of Gaussian vectors, and the escape-through-a-mesh probability bound.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`: `stdGaussian E` (the standard
  Gaussian on a finite-dimensional real inner product space, independent standard coordinates in
  every orthonormal basis); `multivariateGaussian μ S` (the Gaussian on `EuclideanSpace ℝ ι` with
  mean `μ` and covariance `S` for positive semidefinite `S`, the point mass at `μ` otherwise);
  `multivariateGaussian_zero_one` (`N(0, I)` is `stdGaussian`);
  `stdGaussian_eq_map_pi_orthonormalBasis` (`stdGaussian` is the image of the product of standard
  real Gaussians under an orthonormal basis, so the coordinates are independent).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef`.
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `Matrix.toEuclideanLin` (a rectangular matrix
  as a linear map between Euclidean spaces). `Mathlib/Analysis/CStarAlgebra/Matrix.lean`:
  `Matrix.l2_opNorm_def` (the norm of the scope `Matrix.Norms.L2Operator` is the operator norm of
  `Matrix.toEuclideanLin A`).
- `Mathlib/Analysis/Calculus/ParametricIntegral.lean`:
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (differentiation under the integral with a
  local integrable bound on the derivative). `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`:
  `monotoneOn_of_deriv_nonneg`.
- `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`:
  `tendsto_integral_of_dominated_convergence`. `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`:
  `integral_mono`. `Mathlib/MeasureTheory/Integral/Layercake.lean`:
  `Integrable.integral_eq_integral_meas_le` (the integral of an integrable nonnegative function is
  the integral of its tail probabilities `μ{f ≥ t}`).
- `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`: `Real.Gamma_add_one`
  (`Γ(s + 1) = s Γ(s)` for `s ≠ 0`). `Mathlib/Analysis/SpecialFunctions/Gamma/BohrMollerup.lean`:
  `Real.convexOn_log_Gamma` (`log ∘ Γ` is convex on `(0, ∞)`).
- `Measure.real`, `Finset.sup'`, `Finset.inf'`, `iteratedFDeriv`, `EuclideanSpace.single`,
  `Real.Gamma`.

### From Tau Ceti

- `TauCeti/Probability/Distributions/Gaussian/Affine.lean`:
  `TauCeti.Probability.map_affine_multivariateGaussian` (for positive semidefinite `S`, the image
  of `N(m, S)` under `x ↦ L x + c` is `N(L m + c, L S Lᵀ)`, `L` rectangular).
- `TauCeti/Probability/Distributions/Gaussian/Sum.lean`:
  `TauCeti.Probability.multivariateGaussian_conv_multivariateGaussian` (for positive semidefinite
  `S₁`, `S₂`, `N(m₁, S₁) ∗ N(m₂, S₂) = N(m₁ + m₂, S₁ + S₂)`).
- `TauCeti/Probability/Distributions/Gaussian/Multivariate.lean`:
  `TauCeti.Probability.multivariateGaussian_zero_eq_map_stdGaussian_sqrt` (`N(0, S)` is the image
  of `stdGaussian` under the square root of `S`).
- `TauCeti/Probability/Distributions/Gaussian/Maximum.lean`:
  `TauCeti.Probability.sqrt_log_card_div_le_integral_sup'_abs` (for `m ≥ 1` independent standard
  Gaussians `g_j`, `√(log m)/32 ≤ E max_j |g_j|`).
- `TauCeti/Probability/Distributions/Chi/Gaussian.lean`: `TauCeti.Probability.stdGaussian_map_norm`
  (the length of a standard Gaussian vector has the unit-scale chi law).
  `TauCeti/Probability/Distributions/Chi/Moments.lean`:
  `TauCeti.Probability.integral_id_chiMeasure` (the chi mean `s √2 Γ((k + 1)/2)/Γ(k/2)`).

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- §4.4, `gaussian_integration_by_parts`: for `X ~ N(θ, v I)` on `EuclideanSpace ℝ (Fin p)` with
  `v > 0`, a `C¹` field `g` in `L²` with integrable partial derivatives `∂ᵢ gᵢ`, and every `i`,
  `E[(Xᵢ − θᵢ) gᵢ(X)] = v E[∂ᵢ gᵢ(X)]`. Used at `θ = 0`, `v = 1` in 1.1, for fields built from
  `∇f` with `f` as in 1.1.

## References

- Roman Vershynin, *High-Dimensional Probability: An Introduction with Applications in Data
  Science*, Cambridge University Press, 2018; the first-edition text posted on the author's page
  at the University of California, Irvine (`HDP-1.pdf`). Theorem, lemma, exercise and page
  numbers above are those of that text: Lemma 7.2.7 (p. 163), Lemma 7.2.8 (pp. 164–165),
  Theorems 7.2.1 (p. 161), 7.2.9 (p. 165) and 7.2.11 (p. 166), Exercises 7.2.12 (p. 167) and
  7.2.14 (pp. 167–168), Theorem 7.3.1 (pp. 168–169), Exercises 7.3.2 (p. 169) and 7.3.4 (p. 170),
  Theorem 7.4.1 (p. 171).
- Kenneth R. Davidson and Stanislaw J. Szarek, *Local operator theory, random matrices and Banach
  spaces*, in *Handbook of the Geometry of Banach Spaces*, Vol. I, North-Holland, 2001,
  pp. 317–366; the preprint posted on K. R. Davidson's page at the University of Waterloo, titled
  *Banach space theory and local operator theory*, whose numbering is used above: Lemma II.9,
  Remark II.10 and Theorem II.13 with its proof (§IIc, pp. 39–43 of the preprint).
- Attributions made in prose without a locator: David Slepian (1962) for the lemma that bears his
  name; Vladimir N. Sudakov (1971) and Xavier Fernique (1975) for the comparison of expectations
  and Sudakov for the minoration; Yehoram Gordon (1985, 1988) for the min–max comparison and its
  application to random subspaces; Jean-Pierre Kahane (1986) for the comparison principle in the
  form of 1.2.

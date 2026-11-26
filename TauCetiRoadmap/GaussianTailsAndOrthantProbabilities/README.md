# Roadmap: gaussian tails and orthant probabilities

**Summary.** This roadmap proves the classical shape theorems for the standard normal tail on
the whole real line, and the closed forms for normal probabilities of quadrants and orthants in
two and three dimensions. Write `Φ` and `φ` for the standard normal distribution function and
density. The Mills ratio is `R = (1 − Φ)/φ` and the hazard rate is its reciprocal
`λ = φ/(1 − Φ)`.

- *The Mills ratio.* `R` is strictly decreasing and strictly convex on all of `ℝ`.
- *The hazard rate.* At every real `x`, the derivative of `λ` is `λ(x)(λ(x) − x)`, and it lies
  strictly between `0` and `1`. As a consequence, both `Φ` and `1 − Φ` are strictly
  log-concave on `ℝ`.
- *Plackett's identity.* For `|ρ| < 1`, the derivative in `ρ` of the bivariate normal
  distribution function `Φ₂(h, k; ρ)` is the bivariate normal density at `(h, k)`. For fixed
  `h` and `k`, `ρ ↦ Φ₂(h, k; ρ)` is strictly increasing on `[−1, 1]`. Its endpoint values are
  the Fréchet bounds `max(Φ(h) + Φ(k) − 1, 0)` and `Φ(min(h, k))`.
- *Orthant formulas.* For a centred normal pair with unit variances and correlation `ρ`,
  `|ρ| ≤ 1`, both coordinates are positive with probability `1/4 + arcsin(ρ)/(2π)`. This is
  Sheppard's quadrant formula. For three coordinates with a positive semidefinite correlation
  matrix, the orthant probability is `1/8 + (arcsin ρ₀₁ + arcsin ρ₀₂ + arcsin ρ₁₂)/(4π)`.
  For `n` coordinates with all correlations `1/2`, it is `1/(n + 1)`.

Along the line `k = 0`, the bivariate distribution function is a value of Owen's `T` function,
`Φ₂(h, 0; ρ) = Φ(h)/2 − T(h, −ρ/√(1 − ρ²))`. That is the route to Sheppard's formula.

The roadmap builds on Mathlib's multivariate Gaussian measures and on Tau Ceti's Gaussian
library: affine images of Gaussian vectors, continuity of the Gaussian law in its covariance,
symmetry under negation, the normal distribution function, and Owen's `T` function with its
skew-normal integral. The classical bounds for the Mills ratio on `[0, ∞)` belong to
SpecialFunctionsEiLiErfIncompleteGamma and GaussianIsoperimetryAndClusters. The routes here prove
the three comparisons they need, on the whole line, by one comparison argument.

Layer 1 treats the one-dimensional tail, and Layer 2 the bivariate and trivariate
probabilities. The two layers are independent.

## Conventions

- `Φ` is `cdf (gaussianReal 0 1)` and `φ` is `gaussianPDFReal 0 1`. `Q = 1 − Φ` is the
  survival function, and `Φ(−x) = Q(x)`.
- `millsRatio x = (1 − Φ x)/φ x` and `gaussianHazard x = φ x/(1 − Φ x)`. Both denominators are
  positive at every real `x`, so neither definition has a junk value.
- Gaussian vectors are Mathlib's `multivariateGaussian 0 C` on `EuclideanSpace ℝ ι`.
  Coordinates are `x i`, which elaborates as `x.ofLp i`. Mathlib sets the law to the point mass
  at `0` when `C` is not positive semidefinite. Every statement therefore assumes that `C` is a
  positive semidefinite correlation matrix (`Matrix.PosSemidef`, unit diagonal). For
  `corrMatrix2 ρ = !![1, ρ; ρ, 1]`, this means `|ρ| ≤ 1`.
- `bivariateNormalCdf ρ h k` is `Φ₂(h, k; ρ) = P(X₀ ≤ h, X₁ ≤ k)` under
  `multivariateGaussian 0 (corrMatrix2 ρ)`, and `bivariateNormalPDF ρ h k` is
  `exp(−(h² − 2ρhk + k²)/(2(1 − ρ²)))/(2π√(1 − ρ²))`, used for `|ρ| < 1`.
  Probabilities are `Measure.real`.
- `T(h, a)` is Tau Ceti's `Real.owensT h a = (2π)⁻¹ ∫₀^a e^(−h²(1+t²)/2)/(1 + t²) dt`.
- Each coordinate of `multivariateGaussian 0 C`, `C` a correlation matrix, has law `N(0, 1)`,
  because it is the image under the row `eᵢᵀ` and `eᵢᵀ C eᵢ = 1`. Hyperplanes `{xᵢ = c}` are
  therefore null, and strict and non-strict inequalities give the same probabilities.

## Layer 1: the Mills ratio and the Gaussian hazard rate

### 1.0 Definitions

`millsRatio` and `gaussianHazard`, as in the Conventions.

Two facts are used throughout. Write `Q = 1 − Φ` and `R = millsRatio`. Then `Q′ = −φ` (Tau Ceti
`hasDerivAt_cdf_gaussianReal`) and `φ′ = −xφ`. The quotient rule gives

    R′(x) = x R(x) − 1,        R″(x) = R(x) + x R′(x) = (1 + x²) R(x) − x.

*Comparison lemma* (used in the routes of 1.1 and 1.2). Let `u` be differentiable on an open
interval `(a, ∞)`, `−∞ ≤ a`, and bounded on `[b, ∞)` for some `b > a`. Put
`g(x) = (R(x) − u(x)) e^(−x²/2)`. Then

    g′(x) = e^(−x²/2) (x u(x) − 1 − u′(x)),

because the terms in `R` cancel by `R′ = xR − 1`. Moreover `g(x) → 0` as `x → ∞`, since
`R e^(−x²/2) = √(2π) Q → 0` and `u` is bounded. Hence:

- if `x u − 1 − u′ > 0` on `(a, ∞)`, then `g` is strictly increasing with limit `0`, so `g < 0`
  and `R < u` there;
- if `x u − 1 − u′ < 0` on `(a, ∞)`, then `g > 0` and `R > u` there. Indeed `g(x) > g(y)` for
  every `y > x`, so `g(x) > g(x + 1) ≥ lim g = 0`.

The lemma is applied three times:

- (a) `u = 1/x` on `(0, ∞)`: `x u − 1 − u′ = 1/x² > 0`, so `R(x) < 1/x` for `x > 0`. This is
  the first bound of GaussianIsoperimetryAndClusters §1.2, which may be cited instead.
- (b) `u = x/(1 + x²)` on `ℝ`: `x u − 1 − u′ = −2/(1 + x²)² < 0`, so `R(x) > x/(1 + x²)` for
  every real `x`.
- (c) `u = (√(x² + 4) − x)/2 = 2/(x + √(x² + 4))` on `ℝ`, bounded on `[0, ∞)`. Put
  `h = 1/u = (√(x² + 4) + x)/2` and `t = x/√(x² + 4) ∈ (−1, 1)`. Then `h² − x h = 1`, so
  `x u − 1 = (x − h)/h = −1/h²`; and `h′ = (1 + t)/2 < 1`, so `u′ = −h′/h²`. Hence
  `x u − 1 − u′ = −(1 − h′)/h² < 0`, and the lemma gives `R(x) > (√(x² + 4) − x)/2` for every
  real `x`.

### 1.1 The Mills ratio is decreasing and convex

`millsRatio_strictAnti_and_strictConvexOn`: `R` is strictly decreasing on `ℝ` and strictly
convex on `ℝ`.

Route. `R′(x) = xR(x) − 1`. This is `−1 < 0` at `x = 0`, it is negative for `x < 0` because
`R > 0`, and it is negative for `x > 0` by (a). Mathlib's `strictAnti_of_deriv_neg` applies.
`R″(x) = (1 + x²)R(x) − x` is positive for `x ≤ 0` because `R > 0`, and for `x > 0` by (b).
`R` is twice differentiable, so `strictConvexOn_of_deriv2_pos` on `univ` applies. (Proved here.
Gasull and Utzet, Corollary 2(i), state complete monotonicity of `R` on `(0, ∞)`, which gives
decrease and convexity there.)

*Needs:* 1.0 (comparison lemma, (a), (b)); Tau Ceti `hasDerivAt_cdf_gaussianReal`; Mathlib
`gaussianPDFReal_pos`, `strictAnti_of_deriv_neg`, `strictConvexOn_of_deriv2_pos`.

### 1.2 The hazard rate and log-concavity

`gaussianHazard_hasDerivAt_mem_Ioo_and_logConcave`: for every real `x`, `λ = gaussianHazard`
has derivative `λ(x)(λ(x) − x)` at `x`, and `0 < λ(x)(λ(x) − x) < 1`. Moreover
`x ↦ log(1 − Φ(x))` and `x ↦ log Φ(x)` are strictly concave on `ℝ`.

Route. `λ = φ/Q` and the quotient rule give `λ′ = (−xφQ + φ²)/Q² = λ(λ − x)`. Set `r = R(x)`,
so `λ(x) = 1/r` with `r > 0`.

- *Lower bound.* `λ − x > 0`: for `x ≤ 0` because `λ > 0`, and for `x > 0` because `x r < 1`
  by (a). So the product is positive.
- *Upper bound.* `λ(λ − x) < 1` is `(1 − x r)/r² < 1`, that is `r² + x r − 1 > 0`. The roots of
  `s² + x s − 1` are `(−x ± √(x² + 4))/2`, so this is exactly `r > (√(x² + 4) − x)/2`, which
  is (c).
- *Log-concavity.* `log Q` is differentiable with derivative `−φ/Q = −λ`. This derivative is
  strictly decreasing because `λ′ > 0` everywhere. `StrictAntiOn.strictConcaveOn_of_deriv` on
  `univ` applies. Since `Φ(x) = Q(−x)`, `log Φ` has derivative `λ(−x)`, which is strictly
  decreasing in `x`, and the same lemma applies.

(Proved here. The hazard bound on `[0, ∞)` is equivalent to the lower bound of Dümbgen's (3),
which he attributes to Birnbaum and Komatu. Dümbgen's derivative identity (9), Section 2, is the
same computation on `(0, ∞)`. Bound (c) holds on the whole line by the same
computation.)

*Needs:* 1.0 ((a), (c)); 1.1 is not used; Tau Ceti `hasDerivAt_cdf_gaussianReal`,
`cdf_gaussianReal_zero_one_neg`, `cdf_gaussianReal_pos`, `cdf_gaussianReal_lt_one`; Mathlib
`StrictAntiOn.strictConcaveOn_of_deriv`.

### Examples

- `R(0) = (1/2)·√(2π) = √(π/2)`, `λ(0) = √(2/π)`, and `λ′(0) = λ(0)² = 2/π`, which lies in
  `(0, 1)`. `R″(0) = R(0) > 0`.
- *Chernoff-type bound.* By 1.1, `R(x) < R(0)` for `x > 0`, so
  `1 − Φ(x) = R(x) φ(x) < √(π/2) e^(−x²/2)/√(2π) = e^(−x²/2)/2`. Equality holds at `x = 0`.
  The bound is the second statement of GaussianIsoperimetryAndClusters §1.2; 1.1 gives it at
  once. Gasull and Utzet, Section 5, derive it in the same way and note that it is the optimal
  bound of the form `a e^(−b x²)`.
- *Swapping `Φ` and `1 − Φ` reverses 1.1.* `Φ(x)/φ(x) = R(−x)` is strictly increasing, with
  limit `0` at `−∞` (it is below `1/|x|` for `x < 0` by (a)) and limit `∞` at `∞`.
- *Large `x`.* (a) and (b) give `x/(1 + x²) < R(x) < 1/x`. With 1.2, `0 < λ(x) − x < 1/λ(x)`,
  so `λ(x) − x → 0` as `x → ∞`.

### Dependencies

Mathlib's Gaussian density and distribution function, and Tau Ceti's derivative and reflection
of `Φ`. No other layer.

## Layer 2: bivariate and trivariate normal probabilities

### 2.0 Definitions

`corrMatrix2`, `bivariateNormalCdf` and `bivariateNormalPDF`, as in the Conventions.

*Representation* (used in the routes of 2.1 and 2.2). Let `|ρ| < 1` and `s = √(1 − ρ²) > 0`.
Let `L = !![1, 0; ρ, s]`. Then `L Lᵀ = corrMatrix2 ρ`, so by Tau Ceti
`map_affine_multivariateGaussian`, `multivariateGaussian 0 (corrMatrix2 ρ)` is the image of the
standard Gaussian of `ℝ²` under `(x, z) ↦ (x, ρx + s z)`. By
`multivariateGaussian_one_eq_map_pi`, the standard Gaussian is the product of two copies of
`N(0, 1)`. Fubini then gives

    Φ₂(h, k; ρ) = ∫_(−∞)^h φ(x) Φ((k − ρx)/s) dx.

### 2.1 Owen's formula on the line `k = 0`

`bivariateNormalCdf_zero_right_eq_owensT`: for `|ρ| < 1` and real `h`,
`Φ₂(h, 0; ρ) = Φ(h)/2 − T(h, −ρ/√(1 − ρ²))`.

Route. By the representation with `k = 0`, `Φ₂(h, 0; ρ) = ∫_(−∞)^h φ(x) Φ(αx) dx` with
`α = −ρ/s`. Tau Ceti's skew-normal identity
`∫_(−∞)^h 2φ(t)Φ(αt) dt = Φ(h) − 2T(h, α)`
(`integral_Iic_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`) gives the result after
halving. (Meyer, (3.14), p. 6, in copula form
`C(u, 1/2; ρ) = u/2 − T(Φ⁻¹(u), −ρ/√(1 − ρ²))`, from Owen's formula (3.11).)

**Checks.**

- `h = 0`, `ρ = 0`: `1/4 − T(0, 0) = 1/4 = Φ(0)²`, which is the independent case.
- `h = 0`, `ρ = 1/2`: `T(0, −1/√3) = −arctan(1/√3)/(2π) = −1/12`, so the formula gives
  `1/4 + 1/12 = 1/3`. The sign variant `Φ(h)/2 + T(…)` would give `1/6`.
- `|ρ| < 1` is needed. At `ρ = 1`, `√0 = 0` and `−1/0 = 0` make the right side `Φ(h)/2`. The
  left side is `Φ(min(h, 0))` (2.3), which is `1/2` at `h = 0`, not `1/4`.

*Needs:* 2.0 (representation); Tau Ceti `map_affine_multivariateGaussian`,
`multivariateGaussian_one_eq_map_pi`,
`integral_Iic_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`, `Real.owensT`.

### 2.2 Plackett's identity

`hasDerivAt_bivariateNormalCdf`: for `|ρ| < 1` and real `h`, `k`, the function
`r ↦ Φ₂(h, k; r)` has derivative `φ₂(h, k; ρ)` at `ρ`, where `φ₂ = bivariateNormalPDF`.

Route. Use the representation for `r` near `ρ`, and write `a(r, x) = (k − r x)/s(r)` with
`s(r) = √(1 − r²)`. Then `∂a/∂r = (r k − x)/s(r)³`, using `s′ = −r/s`. Choose `δ > 0` with
`[ρ − δ, ρ + δ] ⊂ (−1, 1)`, and let `s₀ > 0` be the least value of `s` there. On that interval,
the `r`-derivative `φ(x) φ(a(r, x)) (r k − x)/s(r)³` of the integrand is bounded by
`φ(x)(|k| + |x|)/(√(2π) s₀³)`, which is integrable. Mathlib's
`hasDerivAt_integral_of_dominated_loc_of_deriv_le` differentiates under the integral sign.
Completing the square gives `φ(x) φ(a(ρ, x)) = s φ₂(x, k; ρ)`, because
`x² + (k − ρx)²/s² = (x² − 2ρkx + k²)/s²`. So the derivative at `ρ` is
`∫_(−∞)^h φ₂(x, k; ρ)(ρk − x)/s² dx`. The integrand is `∂ₓ φ₂(x, k; ρ)`, and
`φ₂(x, k; ρ) → 0` as `x → −∞`, so the integral is `φ₂(h, k; ρ)`. (Proved here. Meyer, (2.5),
p. 3, attributes the identity to Plackett.)

**Checks.**

- `h = k = 0`: the derivative of `1/4 + arcsin(r)/(2π)` (2.4; its route identifies
  `Φ₂(0, 0; r)` with the quadrant probability) is `1/(2π√(1 − ρ²)) = φ₂(0, 0; ρ)`.
- `|ρ| < 1` is needed. For `r > 1`, `corrMatrix2 r` is not positive semidefinite, the law is
  the point mass at `0`, and `Φ₂(0, 0; r) = 1`. Since `Φ₂(0, 0; 1) = 1/2`, the function jumps at
  `1` and has no derivative there.

*Needs:* 2.0 (representation); Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`gaussianPDFReal`; Tau Ceti `hasDerivAt_cdf_gaussianReal` and the suppliers of 2.1's
representation.

### 2.3 Concordance ordering and the Fréchet endpoints

`strictMonoOn_bivariateNormalCdf_and_endpoints`: for real `h`, `k`, `ρ ↦ Φ₂(h, k; ρ)` is
strictly increasing on `[−1, 1]`. Its endpoint values are `Φ₂(h, k; 1) = Φ(min(h, k))` and
`Φ₂(h, k; −1) = max(Φ(h) + Φ(k) − 1, 0)`.

Route.

- *Endpoint values.* `corrMatrix2 1 = L Lᵀ` with `L = !![1, 0; 1, 0]`, so the law at `ρ = 1` is
  that of `(X, X)` with `X ~ N(0, 1)` (by `map_affine_multivariateGaussian` applied to the
  standard Gaussian). Then `P(X ≤ h, X ≤ k) = Φ(min(h, k))`. Likewise `L = !![1, 0; −1, 0]`
  gives `(X, −X)` at `ρ = −1`, and `P(X ≤ h, −X ≤ k) = P(−k ≤ X ≤ h)`. That probability is
  `Φ(h) − Φ(−k) = Φ(h) + Φ(k) − 1` when `−k ≤ h` (the point `−k` is null) and `0` otherwise,
  which is the stated maximum in both cases.
- *Continuity on `[−1, 1]`.* `corrMatrix2 ρ` is positive semidefinite for `|ρ| ≤ 1`, with trace
  `2` and determinant `1 − ρ² ≥ 0`. So `ρ ↦ (0, corrMatrix2 ρ)` is continuous into the domain of
  Tau Ceti's `continuous_multivariateGaussian`, and the laws are weakly continuous. The frontier
  of `{x₀ ≤ h, x₁ ≤ k}` lies in `{x₀ = h} ∪ {x₁ = k}`, which is null for every `ρ` by the
  Conventions. `ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` gives continuity
  of `ρ ↦ Φ₂(h, k; ρ)` on `[−1, 1]`.
- *Strict increase.* On the interior `(−1, 1)`, the derivative is `φ₂(h, k; ρ) > 0` by 2.2.
  `strictMonoOn_of_deriv_pos` on the convex set `[−1, 1]` concludes.

(Proved here. Meyer, (2.2)–(2.3), p. 2, gives the endpoint values as limits, and states the
ordering on p. 3.)

**Checks.**

- `h = k = 0`: the endpoint values are `0` and `1/2`. At `ρ = 0`, 2.1 gives
  `Φ₂(h, 0; 0) = Φ(h)/2 = Φ(h)Φ(0)`.
- At `ρ = −1` with `h = −1`, `k = 0`: `Φ(−1) + Φ(0) − 1 < 0`, so the maximum is `0`, and indeed
  `P(0 ≤ X ≤ −1) = 0`.

*Needs:* 2.2; Tau Ceti `continuous_multivariateGaussian`, `map_affine_multivariateGaussian`,
`multivariateGaussian_one_eq_map_pi`, `cdf_gaussianReal_zero_one_neg`; Mathlib
`ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`, `strictMonoOn_of_deriv_pos`.

### 2.4 Sheppard's quadrant formula

`measureReal_quadrant_multivariateGaussian`: for `|ρ| ≤ 1`, the law
`multivariateGaussian 0 (corrMatrix2 ρ)` gives `{x₀ > 0, x₁ > 0}` the probability
`1/4 + arcsin(ρ)/(2π)`.

Route. The law has mean `0` (`integral_id_multivariateGaussian`), so it is invariant under
`x ↦ −x` (Tau Ceti `IsGaussian.map_neg_eq_self`). The quadrant therefore has the probability of
`{x₀ < 0, x₁ < 0}`, which equals `Φ₂(0, 0; ρ)` because the axes are null. For `|ρ| < 1`, 2.1
at `h = 0` gives `1/4 − T(0, −ρ/s) = 1/4 + arctan(ρ/s)/(2π)` (Tau Ceti `owensT_neg_right`,
`owensT_zero_left`), and `arctan(ρ/√(1 − ρ²)) = arcsin ρ` (`Real.arcsin_eq_arctan`). For
`ρ = 1`, 2.3 gives `Φ(0) = 1/2 = 1/4 + (π/2)/(2π)`. For `ρ = −1`, it gives `0 = 1/4 − 1/4`.
(Koch and Lapidoth, Proposition 2, eq. (11) at `A = 0`, p. 4, for `|ρ| < 1`, citing Sheppard
1900. Meyer, (2.10), p. 3, attributes it to Stieltjes 1889.)

**Checks.**

- `ρ = 0, 1/2, −1/2, 1, −1` give `1/4, 1/3, 1/6, 1/2, 0`.
- `|ρ| ≤ 1` is needed. At `ρ = 2`, the law is the point mass at `0` and the quadrant has
  probability `0`, while Mathlib's `arcsin 2 = π/2` makes the right side `1/2`.

*Needs:* 2.1, 2.3; Mathlib `integral_id_multivariateGaussian`, `Real.arcsin_eq_arctan`; Tau
Ceti `IsGaussian.map_neg_eq_self`, `owensT_zero_left`, `owensT_neg_right`.

### 2.5 The trivariate orthant formula

`measureReal_orthant_multivariateGaussian_fin_three`: for a positive semidefinite
`C : Matrix (Fin 3) (Fin 3) ℝ` with unit diagonal, the orthant `{x₀ > 0, x₁ > 0, x₂ > 0}` has
probability `1/8 + (arcsin C₀₁ + arcsin C₀₂ + arcsin C₁₂)/(4π)`.

Route.

- *Pairs.* `C` is symmetric, and its `2 × 2` principal minors give `|Cᵢⱼ| ≤ 1`. With `L` the
  `2 × 3` matrix selecting coordinates `i < j`, `L C Lᵀ = corrMatrix2 Cᵢⱼ`, so the pair
  `(xᵢ, xⱼ)` has law `multivariateGaussian 0 (corrMatrix2 Cᵢⱼ)`.
- *Opposite signs.* By 2.4 and negation invariance, the pair has opposite signs with
  probability `1 − 2(1/4 + arcsin(Cᵢⱼ)/(2π)) = 1/2 − arcsin(Cᵢⱼ)/π`.
- *Counting.* Off the null set where some coordinate vanishes, let `D` be the number of the
  three pairs with opposite signs. If all three signs agree, `D = 0`. Otherwise exactly one
  coordinate has the minority sign and `D = 2`. So the indicator of "not all signs agree" is
  `D/2` almost surely. Taking expectations, "not all signs agree" has probability
  `(1/2) Σ (1/2 − arcsin(Cᵢⱼ)/π) = 3/4 − Σ arcsin(Cᵢⱼ)/(2π)`.
- *Conclusion.* The events "all positive" and "all negative" are disjoint, have equal
  probability by negation invariance, and together have probability
  `1/4 + Σ arcsin(Cᵢⱼ)/(2π)`.

(Koch and Lapidoth, Proposition 3, eq. (12) at `A = 0`, p. 5, for `|Cᵢⱼ| < 1` and
`det C > 0`, citing David 1953. Here `C` may be singular.)

**Checks.**

- `C = I` gives `1/8`. The all-ones matrix gives `1/8 + 3/8 = 1/2`, the law of `(X, X, X)`.
- `C₀₁ = C₀₂ = 1/2`, `C₁₂ = −1/2` is singular, the law of `(X₀, X₁, X₀ − X₁)`. The formula gives
  `1/8 + 1/24 = 1/6`. Directly, this is `P(X₀ > X₁ > 0)`, half of the Sheppard value `1/3`.
- The unit diagonal is needed. `C = !![4, 1, 0; 1, 1, 0; 0, 0, 1]` is positive definite, and the
  pair `(x₀, x₁)` has correlation `1/2`, so the orthant has probability `(1/3)(1/2) = 1/6`. The
  formula, with `arcsin 1 = π/2`, gives `1/4`.

*Needs:* 2.4; Tau Ceti `map_affine_multivariateGaussian`, `IsGaussian.map_neg_eq_self`;
Mathlib `integral_id_multivariateGaussian`.

### 2.6 The equicorrelated orthant with correlation one half

`measureReal_orthant_multivariateGaussian_equicorr_half`: for every `n : ℕ`, the law
`multivariateGaussian 0 E`, with `E i i = 1` and `E i j = 1/2` for `i ≠ j`, gives the open
positive orthant of `ℝⁿ` the probability `1/(n + 1)`.

Route. Let `Z` be standard Gaussian on `ℝⁿ⁺¹`, with coordinates `Z₀, …, Zₙ`. Let `L` be the
`n × (n + 1)` matrix with `L i 0 = 1/√2`, `L i (i + 1) = −1/√2` and zeros elsewhere. Then
`L Lᵀ = E`: diagonal entries `1/2 + 1/2`, and off-diagonal entries `1/2` from column `0`. So
`E = (1/2) I + (1/2) J` is positive semidefinite, and `X = L Z` has law
`multivariateGaussian 0 E` (`map_affine_multivariateGaussian`). The orthant event is
`{Z₀ > Zᵢ for all i ≥ 1}`, that `Z₀` is the strict maximum. For a permutation matrix `P`,
`P · 1 · Pᵀ = 1`, so `map_affine_multivariateGaussian` shows that the law of `Z` is invariant
under permuting coordinates. Hence each `Z_j` is the strict maximum with the same probability. These `n + 1`
events are disjoint. Their union is the complement of the ties `{Z_a = Z_b}`, each null because
`Z_a − Z_b ~ N(0, 2)`. So each event has probability `1/(n + 1)`. For `n = 0`, the event is the
whole space and the value is `1`. (Proved here.)

**Checks.**

- `n = 1, 2, 3` give `1/2, 1/3, 1/4`. They agree with Sheppard at `ρ = 1/2`
  (`1/4 + 1/12`), and with 2.5 at all correlations `1/2` (`1/8 + 3(π/6)/(4π) = 1/4`).

*Needs:* Tau Ceti `map_affine_multivariateGaussian`; Mathlib `multivariateGaussian_zero_one`,
`measurePreserving_eval_multivariateGaussian` (each coordinate of `Z_a − Z_b`, an affine image,
is a real Gaussian).

### Examples

- *Sign correlation.* By 2.4, `E[sign X₀ · sign X₁] = 4(1/4 + arcsin(ρ)/(2π)) − 1 =
  (2/π) arcsin ρ` for `|ρ| ≤ 1`. For an independent copy `(X₀′, X₁′)`, the pair
  `(X₀ − X₀′, X₁ − X₁′)/√2` has the same law, so this is also Kendall's `τ` of the pair.
- *Positive quadrant dependence.* By 2.3, `Φ₂(h, k; ρ) ≥ Φ₂(h, k; 0) = Φ(h)Φ(k)` for
  `0 ≤ ρ ≤ 1`, with strict inequality for `ρ > 0`.

### Dependencies

Mathlib's multivariate Gaussian measures, portmanteau theorem and differentiation under the
integral sign. Tau Ceti's affine images, continuity and negation symmetry of Gaussian laws, and
Owen's `T` function. No other layer.

## Scope and ownership

This roadmap owns the five definitions of 1.0 and 2.0 and the eight theorems 1.1, 1.2 and
2.1–2.6, all stated in `Suggested.lean`.

Stated elsewhere and not restated:

- The inequalities DLMF 7.8.2–7.8.5 for the Mills ratio of `erfc` on `x ≥ 0` are
  SpecialFunctionsEiLiErfIncompleteGamma §12.2 (inequalities for the error functions). In
  normal-law form, they imply Gordon's bounds `x/(1 + x²) < R(x) < 1/x` for `x > 0` and the
  Birnbaum–Komatu bound `R(x) > 2/(x + √(x² + 4))` for `x ≥ 0`.
  SteinsMethodForNormalApproximation §2.1 consumes them. GaussianIsoperimetryAndClusters §1.2
  owns `R(x) < 1/x` for `x > 0` and `1 − Φ(x) ≤ e^(−x²/2)/2` for `x ≥ 0`, which the
  Chernoff-type Example of Layer 1 rederives from 1.1. Layer 1 proves the three comparisons
  (a)–(c) of 1.0 inline, on the whole line, as steps of its routes; they are not targets here.
- Gaussian integration by parts (Stein's identity) is MathematicalStatisticsFoundations §4.4.
- MathematicalStatisticsNonparametric §4.2 uses the value `τ = (2/π) arcsin ρ` of Kendall's
  `τ` in a Check, which the sign-correlation example above derives.
- Owen's `T` function, its derivatives and special values, and the skew-normal integral of 2.1
  are already in the library (Tau Ceti; StandardDistributions §8.2 describes them).
- Non-strict log-concavity of `Φ` also follows from Tau Ceti's Prékopa–Leindler theorem for
  marginals of log-concave functions. 1.2 is the strict statement for `Φ` and `1 − Φ`.

Not treated here: Slepian's inequality for Gaussian vectors in general dimension (in dimension
two with equal thresholds it gives the non-strict monotonicity in `ρ`; 2.3 is the strict
statement with two thresholds on the closed interval, proved from 2.2); the Gaussian
interpolation formula for smooth test functions, of which Price's theorem is the bivariate
case; strict convexity of the hazard rate (Gasull and Utzet, Theorem 9, for `x ≥ 0`, with
attributions to Sampford and Shenton); Owen's general formula for `Φ₂(h, k; ρ)`; the
tetrachoric series; orthant probabilities in dimension four and higher with general
correlations; multivariate Mills ratios.

Layer 1 is for statements about normal tails that need monotonicity or log-concavity on the
whole line, such as truncated normal moments. Layer 2 supplies exact orthant values for
Gaussian sign statistics and normal-copula computations.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.multivariateGaussian`
  (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`), with
  `multivariateGaussian_of_not_posSemidef` (the point mass at the mean off positive
  semidefinite `S`), `multivariateGaussian_zero_one` (`= stdGaussian`) and
  `integral_id_multivariateGaussian` (mean `μ`, no hypothesis on `S`).
- `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gaussianPDFReal` and `gaussianPDFReal_pos`
  (for `v ≠ 0`), in `Mathlib/Probability/Distributions/Gaussian/Real.lean`;
  `ProbabilityTheory.cdf` (`Mathlib/Probability/CDF.lean`).
- `Real.arcsin_eq_arctan`: `arcsin x = arctan (x/√(1 − x²))` for `x ∈ (−1, 1)`
  (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Arctan.lean`).
- `strictAnti_of_deriv_neg` and `strictMonoOn_of_deriv_pos` (convex `D`, continuity on `D`,
  positive derivative on `interior D`), in `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`.
- `strictConvexOn_of_deriv2_pos` and `StrictAntiOn.strictConcaveOn_of_deriv` (convex `D`,
  continuity on `D`), in `Mathlib/Analysis/Convex/Deriv.lean`.
- `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (local domination of the derivative by an
  integrable bound), in `Mathlib/Analysis/Calculus/ParametricIntegral.lean`.
- `MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` (weak
  convergence and a null frontier), in `Mathlib/MeasureTheory/Measure/Portmanteau.lean`.
- `ProbabilityTheory.measurePreserving_eval_multivariateGaussian` (each coordinate of
  `multivariateGaussian μ S`, `S` positive semidefinite, has law `gaussianReal (μ i) (S i i)`), in
  the same file as `multivariateGaussian`.

### From Tau Ceti

- `Real.owensT`, `Real.owensT_zero_left` (`T(0, a) = arctan a/(2π)`) and
  `Real.owensT_neg_right`, in `TauCeti/Analysis/SpecialFunctions/OwensT.lean`.
- `TauCeti.Probability.integral_Iic_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`: for all real
  `α`, `x`, `∫_(Iic x) 2φ(t)Φ(αt) dt = Φ(x) − 2T(x, α)`, in
  `TauCeti/Probability/Distributions/Gaussian/OwensT.lean`.
- `TauCeti.Probability.hasDerivAt_cdf_gaussianReal` (for `v ≠ 0`),
  `cdf_gaussianReal_zero_one_neg` (`Φ(−x) = 1 − Φ(x)`), `cdf_gaussianReal_pos` and
  `cdf_gaussianReal_lt_one` (for `v ≠ 0`), in `TauCeti/Probability/Distributions/Gaussian/Cdf.lean`.
- `TauCeti.Probability.map_affine_multivariateGaussian`: for positive semidefinite `S` and a
  rectangular `L`, the image under `x ↦ L x + c` is `multivariateGaussian (L m + c) (L S Lᵀ)`; and
  `multivariateGaussian_one_eq_map_pi` (identity covariance as a product of `N(mᵢ, 1)`), in
  `TauCeti/Probability/Distributions/Gaussian/Affine.lean`.
- `TauCeti.Probability.continuous_multivariateGaussian`: the law is continuous in the mean and
  the positive semidefinite covariance, as a probability measure, in
  `TauCeti/Probability/Distributions/Gaussian/Continuity.lean`.
- `ProbabilityTheory.IsGaussian.map_neg_eq_self`: a Gaussian measure with mean zero is invariant
  under negation, in `TauCeti/Probability/Distributions/Gaussian/Symmetry.lean`.

## References

- L. Dümbgen, *Bounding standard Gaussian tail probabilities*, Technical Report 76, University
  of Bern, 2010, arXiv:1012.2063v3. Inequalities (2) and (3) and Gordon's bounds in Section 1;
  the derivative identity (9) in Section 2.
- A. Gasull and F. Utzet, *Approximating Mills ratio*, J. Math. Anal. Appl. 420 (2014),
  1832–1853, preprint at `ddd.uab.cat/pub/artpub/2014/gsduab_3600/GasUtz2013.pdf`. Corollary 2(i)
  (complete monotonicity), Theorem 9 (strict convexity of `1/R` for `x ≥ 0`), Section 5
  (Chernoff-type bounds).
- T. Koch and A. Lapidoth, *Increased capacity per unit-cost by oversampling*,
  arXiv:1008.5393v2, 2010. Proposition 2, eq. (11), p. 4, and Proposition 3, eq. (12), p. 5,
  with references to W. F. Sheppard (Trans. Cambridge Philos. Soc. 19, 1900) and F. N. David
  (Biometrika 40, 1953).
- C. Meyer, *The bivariate normal copula*, arXiv:0912.2816v1, 2009. Equations (2.2)–(2.3), p. 2;
  (2.5) (Plackett's identity), the concordance ordering and (2.10), p. 3; Owen's `T`, (3.10) and
  (3.14), p. 6.
- NIST Digital Library of Mathematical Functions, §7.8, `dlmf.nist.gov/7.8`.

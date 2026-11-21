# Roadmap: discriminant analysis and logistic regression

**Summary.** Two-class classification asks for a rule that assigns one of two labels to a
feature vector. This roadmap treats the classical linear and quadratic rules of statistics from
two directions. In the generative direction one models the law of the features within each
class and computes the posterior probability of a label by Bayes' formula; in the discriminative
direction one fits that posterior directly as a logistic function of a linear score, by maximum
likelihood. Throughout, the feature space is a finite-dimensional Euclidean space and the labels
are Booleans; there is no other standing hypothesis.

The headline theorems are these.

- *Gaussian classes.* If the two classes are Gaussian with positive definite covariances and the
  prior of each class is strictly between `0` and `1`, the posterior probability of the first
  class is the logistic sigmoid of a quadratic function of the features, the log-ratio of the
  weighted class densities. When the two covariances are equal to `S`, this function is affine,
  `⟪S⁻¹(μ₁ − μ₀), x⟫ + w₀`, so for `μ₀ ≠ μ₁` the Bayes rule is a half-space.
- *Naive Bayes.* If, within each class, binary features are independent with probabilities
  strictly between `0` and `1`, the posterior is again the sigmoid of an affine function of the
  features, with explicit weights.
- *Fisher's discriminant.* For a labelled sample whose within-class scatter matrix `S_W` is
  positive definite, the largest value of Fisher's ratio `⟪w, δ⟫² / ⟪w, S_W w⟫` over nonzero
  directions is `⟪δ, S_W⁻¹ δ⟫`, where `δ` is the difference of the class means; when `δ ≠ 0` it
  is attained exactly on the nonzero multiples of `S_W⁻¹ δ`. Least squares with suitably coded
  targets produces the same direction, with an explicit positive factor.
- *Logistic regression.* The log-likelihood of a labelled sample is concave, and strictly
  concave exactly when the sample points span the space. Its maximum is attained exactly when
  every direction that misclassifies no point is orthogonal to all points, and it is attained at
  a unique point exactly when the data overlap: no nonzero direction classifies every point
  correctly or on the boundary. Its supremum is `0` exactly under complete separation, and
  otherwise the log-likelihood never exceeds `−log 2`.

The roadmap builds on Mathlib's logistic sigmoid, multivariate Gaussian and Bernoulli laws,
and on Tau Ceti's density of a nondegenerate Gaussian law. It takes the notion of a regression
function and the `±1` reading of labels from the roadmap StatisticalLearningTheory, whose
theorem on the Bayes classifier turns the two Gaussian posterior formulas into descriptions
of the Bayes rule. The logistic likelihood is that of an exponential family, and the existence
theorem rests on MathematicalStatisticsFoundations 3.6, translated into the labelled points.

Layer 1 computes the posteriors of the Gaussian and naive Bayes models. Layer 2 defines
the class means, the within-class scatter matrix and Fisher's criterion, and proves Fisher's
theorem and its least-squares form. Layer 3 defines the logistic log-likelihood and proves the
concavity, score, existence, uniqueness and separation theorems. The layers are independent.

## Conventions

- **Features and samples.** A real feature space is `EuclideanSpace ℝ ι` for a finite type `ι`,
  with inner product `⟪·, ·⟫`. A labelled sample of size `n` is `z : Fin n → EuclideanSpace ℝ ι ×
  Bool`, with points `xᵢ = (z i).1` and labels `(z i).2`. The label `true` is "class 1" and
  `false` is "class 0".
- **Labels as numbers.** `labelSign` reads a label as `1` (`true`) or `−1` (`false`), the
  convention of StatisticalLearningTheory 1.1; where a probability or a least-squares target is
  meant, the label is read as `1` or `0` through `cond b 1 0`. With `yᵢ = labelSign` of the
  i-th label, the identity `yᵢ σ(−yᵢ s) = tᵢ − σ(s)` for `tᵢ = cond (z i).2 1 0` links the two
  readings (Check in 3.2).
- **Posteriors.** A labelled law is a measure on `X × Bool`. That `η` is the posterior
  probability of the label `true` is the predicate `IsRegressionFunction P η` of
  StatisticalLearningTheory 1.2, copied verbatim: `η` is measurable with values in `[0, 1]` and
  `P(A × {true}) = ∫_A η d(P.map Prod.fst)` for every measurable `A`. A posterior is determined
  only almost everywhere for the feature marginal; each theorem of Layer 1 names one version.
- **Matrices.** Matrices are `Matrix ι ι ℝ`, acting on `EuclideanSpace ℝ ι` through
  `Matrix.toEuclideanLin`; positive definite is `Matrix.PosDef`, and `S⁻¹` is Mathlib's matrix
  inverse, which is the true inverse for a positive definite `S`. The sigmoid is `Real.sigmoid`,
  `σ(s) = 1/(1 + e^(−s))`.
- **Junk values.** A class mean of an empty class is `0` (the inverse of `0` is `0`); the
  least-squares statement assumes both classes nonempty. Fisher's criterion at `w = 0` is the
  junk `0/0 = 0`, so its maximum is taken over nonzero `w`. Priors and Bernoulli parameters are
  points of `unitInterval`; the posterior formulas assume them strictly between `0` and `1`, since
  `log 0 = 0` in Lean would otherwise enter the formulas.
- **The intercept.** The logistic model `σ(⟪w, x⟫)` has no separate intercept: a model with
  intercept is the case where one coordinate of every sample point is `1`. All Layer 3 statements
  hold for every sample, with or without such a coordinate.

## Layer 1: posteriors of class-conditional models

### 1.1 The labelled two-class model

Define `classModel p Q`, for a prior `p ∈ [0, 1]` and class-conditional laws `Q : Bool → Measure X`:
the measure `p · (Q true).map (x ↦ (x, true)) + (1 − p) · (Q false).map (x ↦ (x, false))` on
`X × Bool`. For probability measures `Q b` it is the law of `(X, Y)` when `Y` is `true` with
probability `p` and `X` given `Y = b` has law `Q b`. `IsRegressionFunction` is copied verbatim
from StatisticalLearningTheory 1.2 (see Conventions).

API, stated in prose:

- The feature marginal of `classModel p Q` is `p · Q true + (1 − p) · Q false`, and
  `classModel p Q (A × {true}) = p · Q true (A)` for measurable `A`.
- **Route lemma for 1.2–1.4.** If `Q true` and `Q false` have measurable densities `f₁`, `f₀`
  with respect to a common σ-finite measure `λ`, both everywhere positive and finite, and
  `0 < p < 1`, then `x ↦ σ(log (p f₁(x)) − log ((1 − p) f₀(x)))` is a regression function of
  `classModel p Q`. Proof: `σ(log a − log b) = a/(a + b)` for `a, b > 0`, so this function times
  the marginal density `p f₁ + (1 − p) f₀` is `p f₁`, and integrating over `A` against `λ`
  (Mathlib `setIntegral_withDensity_eq_setIntegral_toReal_smul`) gives `p · Q true (A)`. This
  is Bayes' formula in the form of Bishop, §4.2, (4.57)–(4.58), p. 197. The lemma is a step of
  the routes below, not a separate target.

**Checks.**

- For `p = 1/2`, `Q true = δ₁` and `Q false = δ₀` on `ℝ`, the regression function is `1` at `1`
  and `0` at `0`; no function of the form `σ(s)` takes these values, since `0 < σ < 1`. This is
  why the posterior theorems below need densities that are positive everywhere.

*Needs:* Mathlib `Measure.map`, `Measure.withDensity`,
`setIntegral_withDensity_eq_setIntegral_toReal_smul`, `Real.sigmoid`.

### 1.2 Quadratic discriminant analysis

Define `qdaScore p μ₀ μ₁ S₀ S₁ x`, the quadratic discriminant score

    log (p/(1 − p)) − (log det S₁ − log det S₀)/2
      − ⟪x − μ₁, S₁⁻¹(x − μ₁)⟫/2 + ⟪x − μ₀, S₀⁻¹(x − μ₀)⟫/2,

which for positive definite `S₀`, `S₁` and `0 < p < 1` is `log (p f₁(x)) − log ((1 − p) f₀(x))`
for the Gaussian densities `f_b` with mean `μ_b` and covariance `S_b`.

Prove `isRegressionFunction_sigmoid_qdaScore`: if `0 < p < 1` and `S₀`, `S₁` are positive
definite, then `x ↦ σ(qdaScore p μ₀ μ₁ S₀ S₁ x)` is a regression function of the model with
prior `p` and classes `multivariateGaussian μ_b S_b` (Bishop, §4.2.1, the paragraph after
(4.70), p. 199, where the quadratic discriminant is described without a formula; the formula is
the route lemma of 1.1 applied to (4.64) with a covariance per class).

Route: Tau Ceti `TauCeti.Probability.multivariateGaussian_eq_withDensity` writes each class as
Lebesgue measure with the density `multivariateGaussianPDFReal μ_b S_b`, which is positive
(`multivariateGaussianPDFReal_pos`, since `det S_b > 0`) and measurable. The logarithm of that
density is `−(card ι/2) log 2π − (log det S_b)/2 − ⟪x − μ_b, S_b⁻¹(x − μ_b)⟫/2`, because
`log (det S ^ (−1/2)) = −(log det S)/2` for `det S > 0`; the constants cancel in the difference,
which is `qdaScore`. The route lemma of 1.1 concludes. (Proved here.)

Consequence (not a separate target): the model is a probability measure, so by
StatisticalLearningTheory 1.2 (the Bayes classifier theorem,
`classificationError_bayesClassifier`), the plug-in rule of this regression function, which
predicts `true` where
`σ(qdaScore) ≥ 1/2`, that is where `qdaScore ≥ 0`, has the least misclassification probability
among measurable classifiers. Its decision boundary is the zero set of `qdaScore`, a
polynomial of degree at most two in `x`.

**Checks.**

- One dimension, `μ₀ = μ₁ = 0`, `S₀ = 1`, `S₁ = 4`, `p = 1/2`: the score is
  `−log 2 + 3x²/8`, so the posterior at `0` is `σ(−log 2) = 1/3`, which is `f₁(0)/(f₁(0) + f₀(0))`
  with `f₁(0) = 1/(2√(2π))` and `f₀(0) = 1/√(2π)`. The Bayes rule predicts the wide class
  exactly where `|x| ≥ √((8/3) log 2) ≈ 1.3596`, not a half-line. A score without the
  determinant term would give `1/2` at `0`.
- The prior hypothesis is needed: for `p = 1` the model has only the class `true`, its regression
  function is `1` almost everywhere, and `σ(·) < 1` everywhere; symmetrically for `p = 0`, where
  it is `0` almost everywhere and `σ(·) > 0`.
- Positive definiteness is needed: for `S₁ = 0` in one dimension the class `true` is `δ_{μ₁}`,
  the marginal has an atom of mass `p` at `μ₁` that the other class does not charge, so the
  regression function must be `1` at `μ₁`, which no sigmoid value is.

*Needs:* 1.1; Mathlib `multivariateGaussian`, `Matrix.PosDef`, `Matrix.toEuclideanLin`,
`Real.sigmoid`; Tau Ceti `TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.multivariateGaussianPDFReal`,
`TauCeti.Probability.multivariateGaussianPDFReal_pos`,
`TauCeti.Probability.measurable_multivariateGaussianPDFReal`.

### 1.3 Linear discriminant analysis

Prove `isRegressionFunction_sigmoid_linear`: if `0 < p < 1` and the two Gaussian classes have a
common positive definite covariance `S`, then `x ↦ σ(⟪w, x⟫ + w₀)` is a regression function of
the model, with `w = S⁻¹(μ₁ − μ₀)` and `w₀ = log (p/(1 − p)) − (⟪μ₁, S⁻¹μ₁⟫ − ⟪μ₀, S⁻¹μ₀⟫)/2`
(Bishop, §4.2.1, (4.64)–(4.67), p. 198).

Route: 1.2 with `S₀ = S₁ = S`. The determinant terms cancel, and since `S⁻¹` is symmetric
(`Matrix.PosDef.inv`), `−⟪x − μ₁, S⁻¹(x − μ₁)⟫/2 + ⟪x − μ₀, S⁻¹(x − μ₀)⟫/2` expands to
`⟪S⁻¹(μ₁ − μ₀), x⟫ − (⟪μ₁, S⁻¹μ₁⟫ − ⟪μ₀, S⁻¹μ₀⟫)/2`. (Proved here.)

Consequence (not a separate target): by StatisticalLearningTheory 1.2 the Bayes rule of this
model predicts `true` exactly where `⟪w, x⟫ + w₀ ≥ 0`; for `μ₀ ≠ μ₁` the weight `w` is nonzero
and this is a closed half-space, whose boundary the prior moves parallel to itself (for
`μ₀ = μ₁` it is the whole space or empty).

**Checks.**

- One dimension, `μ₀ = 0`, `μ₁ = 2`, `S = 1`, `p = 1/2`: `w = 2`, `w₀ = −2`, the posterior is
  `1/2` at the midpoint `1` and `σ(−2) ≈ 0.1192` at `0`, and the Bayes rule is `x ≥ 1`.
- Sign: with the roles of the classes exchanged the weight is `S⁻¹(μ₀ − μ₁)`; on the example
  above the variant `w = S⁻¹(μ₀ − μ₁) = −2` would give the posterior `σ(−2 · 2 − 2) < 1/2` at
  `μ₁ = 2`, where the true posterior is `σ(2) > 1/2`.
- The maximum-likelihood estimate of the shared covariance in Bishop, §4.2.2, (4.78)–(4.80),
  p. 202, is `S_W/n` with the within-class scatter matrix of 2.1, so substituting it for `S`
  gives the direction `n S_W⁻¹(m₁ − m₀)`, a positive multiple of Fisher's direction in 2.1.

*Needs:* 1.2; Mathlib `Matrix.PosDef.inv`, `Matrix.IsHermitian`.

### 1.4 Naive Bayes with binary features

Prove `isRegressionFunction_sigmoid_naiveBayes`: let the features be `x : Fin d → Bool` and let
class `b` be the product law `Measure.pi (j ↦ bernoulliMeasure true false (θ b j))`, so that the
coordinates are independent given the label with `P(xⱼ = true) = θ b j`. If `0 < p < 1` and
`0 < θ b j < 1` for all `b`, `j`, the posterior of `true` is `σ(∑ⱼ [xⱼ] wⱼ + w₀)` with
`wⱼ = log (θ₁ⱼ(1 − θ₀ⱼ)/(θ₀ⱼ(1 − θ₁ⱼ)))` and `w₀ = log (p/(1 − p)) + ∑ⱼ log ((1 − θ₁ⱼ)/(1 − θ₀ⱼ))`,
where `[xⱼ]` is `1` if `xⱼ` is `true` and `0` otherwise (Bishop, §4.2.3, (4.81)–(4.82),
p. 202).

Route: the feature space is finite with every set measurable; by `Measure.pi_pi` and
`bernoulliMeasure_apply` class `b` gives the point `x` the mass
`∏ⱼ (θ b j if xⱼ else 1 − θ b j) > 0`, a density with respect to counting measure. The route
lemma of 1.1 applies, and the log-ratio of the masses is
`log (p/(1 − p)) + ∑ⱼ ([xⱼ] log (θ₁ⱼ/θ₀ⱼ) + (1 − [xⱼ]) log ((1 − θ₁ⱼ)/(1 − θ₀ⱼ)))`, which
regroups to `∑ⱼ [xⱼ] wⱼ + w₀`. (Proved here.)

**Checks.**

- `d = 1`, `θ₀ = 1/4`, `θ₁ = 3/4`, `p = 1/2`: `w₁ = log 9`, `w₀ = log (1/3)`; the posterior is
  `σ(log 3) = 3/4` at `true` and `σ(−log 3) = 1/4` at `false`, which are `(3/8)/(3/8 + 1/8)`
  and `(1/8)/(1/8 + 3/8)`.
- The parameter hypothesis is needed: for `d = 1`, `θ₁ = 1`, `θ₀ = 1/2`, the point `false` has
  positive marginal mass and posterior `0`, which no sigmoid value is; symmetrically, for
  `θ₁ = 0` the point `true` has posterior `0`. The prior hypothesis is needed as in 1.2.

*Needs:* 1.1; Mathlib `bernoulliMeasure`, `bernoulliMeasure_apply`, `Measure.pi`,
`Measure.pi_pi`.

### Examples

- Equal covariances, two dimensions: `μ₀ = (0, 0)`, `μ₁ = (2, 0)`, `S = I`, `p = 1/2` give
  `w = (2, 0)` and `w₀ = −2`; the Bayes rule is the half-plane `x₁ ≥ 1`.

### Dependencies

Mathlib's Gaussian and Bernoulli laws and the sigmoid; Tau Ceti's Gaussian density; the
regression-function predicate copied from StatisticalLearningTheory 1.2. No other layer.

## Layer 2: Fisher's linear discriminant

### 2.1 Class means, within-class scatter and Fisher's theorem

Define, for a labelled sample `z`:

- `classCount z b`, the number of points with label `b`, and `classMean z b`, the mean of those
  points (`0` for an empty class); write `m₁`, `m₀`, `n₁`, `n₀` and `δ = m₁ − m₀`.
- `withinClassScatter z`, the matrix `S_W = ∑ᵢ (xᵢ − m_{yᵢ})(xᵢ − m_{yᵢ})ᵀ`: the sum of the
  scatter matrices of MathematicalStatisticsFoundations 9.5 of the two classes, each about its
  own mean.
- `fisherCriterion z w = ⟪w, δ⟫² / ⟪w, S_W w⟫`, Fisher's criterion, the generalised Rayleigh
  quotient `wᵀ S_B w / wᵀ S_W w` of the between-class matrix `S_B = δ δᵀ` and `S_W`.

Prove `fisherCriterion_isGreatest`: if `ι` is nonempty and `S_W` is positive definite, then
`⟪δ, S_W⁻¹ δ⟫` is the greatest value of `fisherCriterion z w` over nonzero `w`; and if moreover
`δ ≠ 0`, a nonzero `w` attains it exactly when `w = c S_W⁻¹ δ` for some `c ≠ 0` (Bishop,
§4.1.4, (4.26)–(4.30), p. 189, where the direction is found from the stationarity
condition (4.29) and the value is not computed).

Route: `B(u, v) = ⟪u, S_W v⟫` is a symmetric positive definite bilinear form, and
`⟪w, δ⟫ = B(w, u)` for `u = S_W⁻¹ δ`, with `B(u, u) = ⟪δ, S_W⁻¹ δ⟫`. Cauchy–Schwarz for `B`
(Mathlib `LinearMap.BilinForm.apply_sq_le_of_symm`) gives `⟪w, δ⟫² ≤ ⟪w, S_W w⟫ ⟪δ, S_W⁻¹ δ⟫`,
so the criterion is at most `⟪δ, S_W⁻¹ δ⟫` at every nonzero `w`. Attainment: if `δ ≠ 0` then
`u ≠ 0` and `w = u` gives equality; if `δ = 0` every nonzero `w`, which exists since `ι` is
nonempty, gives `0`. Equality case: if `B(w, u)² = B(w, w) B(u, u)` with `u ≠ 0`, put
`t = B(w, u)/B(u, u)`; then `B(w − t u, w − t u) = B(w, w) − B(w, u)²/B(u, u) = 0`, so
`w = t u` by definiteness, and `t ≠ 0` because `w ≠ 0`; conversely every `c u` with `c ≠ 0`
gives equality by homogeneity. (Proved here.)

API, stated in prose:

- `fisherCriterion z (c • w) = fisherCriterion z w` for `c ≠ 0`: the criterion depends only on
  the line of `w`, so its maximizer is a line, never a single vector.
- `S_W` is positive semidefinite, and it is positive definite exactly when the centred points
  `xᵢ − m_{yᵢ}` span the space; with both classes nonempty this needs at least `card ι + 2`
  points.

**Checks.**

- The sample with class `true` at `(0, 0)`, `(2, 2)` and class `false` at `(3, 0)`, `(3, 2)`:
  `m₁ = (1, 1)`, `m₀ = (3, 1)`, `δ = (−2, 0)`, `S_W = [[2, 2], [2, 4]]`, `S_W⁻¹ δ = (−2, 1)`, and
  the maximum is `⟪δ, S_W⁻¹ δ⟫ = 4`, attained at `(−2, 1)`. The plausible wrong answer "`w`
  parallel to `δ`" gives `fisherCriterion z δ = 16/8 = 2`, and `w = (1, 0)` also gives `2`.
- `δ = 0` (equal class means): the criterion is `0` at every nonzero `w`, every such `w` is a
  maximizer and none is a nonzero multiple of `S_W⁻¹ δ = 0`, which is why the characterization
  assumes `δ ≠ 0`.
- Empty `ι`: `S_W` is the empty matrix, positive definite vacuously, and there is no nonzero
  `w`, so the set of values is empty and has no greatest element; hence `Nonempty ι`.
- Positive definiteness is needed: for the points `0` (label `true`) and `1` (label `false`) of
  `ℝ`, `S_W = 0` and `δ = −1`; the criterion is the junk `w²/0 = 0` at every `w`, and Lean's
  inverse of the zero matrix is `0`, so the value `⟪δ, S_W⁻¹ δ⟫ = 0` is attained by every nonzero
  `w`, none of which is a multiple of `S_W⁻¹ δ = 0`.

*Needs:* Mathlib `Matrix.vecMulVec`, `Matrix.PosDef`, `Matrix.PosDef.inv`,
`Matrix.toEuclideanLin`, `LinearMap.BilinForm.apply_sq_le_of_symm`, `IsGreatest`.

### 2.2 Fisher's direction from least squares

Prove `leastSquares_isMin_iff`: suppose both classes are nonempty and `S_W` is positive definite,
and code the targets as `tᵢ = n/n₁` for label `true` and `tᵢ = −n/n₀` for `false`. Then
`(w, w₀)` minimizes `∑ᵢ (⟪w, xᵢ⟫ + w₀ − tᵢ)²` over all pairs exactly when
`w = c S_W⁻¹ δ` with `c = n / (1 + (n₀ n₁/n) ⟪δ, S_W⁻¹ δ⟫)` and `w₀ = −⟪w, m⟫`, where `m` is the
mean of all `n` points (Bishop, §4.1.5, (4.31)–(4.38), pp. 189–190, for `w₀ = −⟪w, m⟫` and
`w ∝ S_W⁻¹ δ`; the step (4.37) is Bishop's Exercise 4.6 and the factor `c` is not given there,
so both are derived in the route).

Route: `∑ᵢ tᵢ = n₁ (n/n₁) − n₀ (n/n₀) = 0`. Write `f` for the objective and `rᵢ` for the
residuals `⟪w, xᵢ⟫ + w₀ − tᵢ`. Expanding the square,
`f(w + v, w₀ + v₀) = f(w, w₀) + 2 ∑ᵢ rᵢ (⟪v, xᵢ⟫ + v₀) + ∑ᵢ (⟪v, xᵢ⟫ + v₀)²`; replacing
`(v, v₀)` by `s (v, v₀)` with `s → 0` of either sign shows that `(w, w₀)` is a minimizer exactly
when the linear term vanishes for all `(v, v₀)`, that is when the normal equations
`∑ᵢ rᵢ = 0` and `∑ᵢ rᵢ xᵢ = 0` hold. The equation for `w₀` gives `n(⟪w, m⟫ + w₀) = ∑ tᵢ = 0`.
Substituting, the equation for `w` reads
`S_T w = ∑ᵢ tᵢ xᵢ = n δ`, where `S_T = ∑ᵢ (xᵢ − m)(xᵢ − m)ᵀ`. Since `m₁ − m = (n₀/n) δ` and
`m₀ − m = −(n₁/n) δ`, the between-within decomposition gives
`S_T = S_W + n₁(m₁ − m)(m₁ − m)ᵀ + n₀(m₀ − m)(m₀ − m)ᵀ = S_W + (n₀ n₁/n) δ δᵀ`, which is positive
definite, so the solution is unique; and `w = c S_W⁻¹ δ` solves it, because
`S_T (c S_W⁻¹ δ) = c (1 + (n₀ n₁/n) ⟪δ, S_W⁻¹ δ⟫) δ = n δ`. (Proved here.)

**Checks.**

- The sample of the Check in 2.1: `n = 4`, `n₀ = n₁ = 2`, targets `±2`, `c = 4/(1 + 1 · 4) = 4/5`,
  `w = (−8/5, 4/5)`, `m = (2, 1)`, `w₀ = 12/5`; an exact least-squares solve gives the same
  `(−1.6, 0.8, 2.4)`. The factor `c` is positive, so the least-squares rule `⟪w, x⟫ + w₀ > 0`
  orients the direction towards class `true`.
- Both classes must be nonempty: the points `0, 1, 3` of `ℝ`, all labelled `true`, have targets
  `n/n₁ = 1`, least-squares solution `w = 0`, `w₀ = 1`, while the formula with the junk mean
  `m₀ = 0` gives `δ = 4/3`, `S_W = 14/3` and `w = 3 · (4/3)/(14/3) = 6/7`.
- `S_W` must be positive definite: for the points `0` (label `true`) and `1` (label `false`) of
  `ℝ`, the targets `2`, `−2` are fitted exactly by `w = −4`, `w₀ = 2`, the unique least-squares
  solution, while `S_W = 0` and Lean's inverse `0` make the formula give `w = 0`.

*Needs:* 2.1; Mathlib `Matrix.PosDef`, `Matrix.PosDef.inv`.

### Examples

- For a positive definite `S_W` proportional to the identity, Fisher's direction is `δ`
  itself, the line through the two class means (Bishop, p. 189, remark after (4.30)).

### Dependencies

Mathlib's matrices and Cauchy–Schwarz for symmetric bilinear forms. No other layer.

## Layer 3: the logistic log-likelihood

### 3.1 The log-likelihood and its concavity

`labelSign` is copied verbatim from StatisticalLearningTheory 1.1. Define `logLikelihood z w`,
the logistic log-likelihood `ℓ(w) = −∑ᵢ log (1 + exp (−yᵢ ⟪w, xᵢ⟫))` with `yᵢ = labelSign` of
the i-th label. It is the log of `∏ᵢ σ(yᵢ ⟪w, xᵢ⟫)`, the probability that the model
`P(Y = true | x) = σ(⟪w, x⟫)` gives to the observed labels, and `−ℓ` is the empirical logistic
loss of Shalev-Shwartz–Ben-David, §9.3, (9.10), p. 127, times `n`.

Prove `concaveOn_logLikelihood`: `ℓ` is concave on the whole space, and it is strictly concave
exactly when the points `xᵢ` span the space (Bishop, §4.3.3, (4.96)–(4.98), pp. 207–208, for
the Hessian `∑ᵢ σᵢ(1 − σᵢ) xᵢ xᵢᵀ` of `−ℓ`; Shalev-Shwartz–Ben-David, p. 127, for convexity of the
logistic loss).

Route: `φ(s) = log (1 + eˢ)` has `φ' = σ` (Tau Ceti `Real.hasDerivAt_log_one_add_exp`) and
`φ'' = σ(1 − σ) > 0` (Mathlib `Real.hasDerivAt_sigmoid`), so it is strictly convex
(`strictConvexOn_of_deriv2_pos`). Each `w ↦ φ(−yᵢ ⟪w, xᵢ⟫)` is convex as the composition with a
linear functional, and the sum is convex. If the `xᵢ` span and `w ≠ w'`, then
`⟪w − w', xᵢ⟫ ≠ 0` for some `i`, and that term is strictly convex along the segment, so `−ℓ` is
strictly convex. If they do not span, a nonzero `v` orthogonal to all `xᵢ` exists
(`Submodule.orthogonal_eq_bot_iff`), and `ℓ(w + t v) = ℓ(w)` for all `t`, so `ℓ` is not
strictly concave. (Proved here.)

**Checks.**

- No sample points (`n = 0`): `ℓ ≡ 0`, concave and, for nonempty `ι`, not strictly concave; the
  empty family spans `{0}`.
- In `ℝ²`, the points `(1, 0)` with label `true` and `(1, 0)` with label `false`:
  `ℓ(w) = −log (1 + e^(−w₁)) − log (1 + e^(w₁))` does not depend on `w₂`, the points span only
  the first axis, and `ℓ` is not strictly concave.
- Label convention: reading the labels as `1`/`0` inside the exponent would make the term of a
  point labelled `false` the constant `−log 2`. For the single point `x = 1` labelled `false`
  the true log-likelihood is `−log (1 + e^w)`, with supremum `0`; the variant is constant.

*Needs:* Mathlib `Real.sigmoid`, `Real.hasDerivAt_sigmoid`, `strictConvexOn_of_deriv2_pos`,
`ConvexOn.comp_linearMap`, `StrictConvexOn.add_convexOn`, `Submodule.orthogonal_eq_bot_iff`;
Tau Ceti `Real.hasDerivAt_log_one_add_exp`.

### 3.2 The score equations

Prove `logLikelihood_score`: `ℓ` has at `w` the gradient `∑ᵢ (tᵢ − σ(⟪w, xᵢ⟫)) xᵢ` with
`tᵢ = 1` for label `true` and `0` for `false`, and `w` is a maximizer of `ℓ` exactly when this
gradient is `0` (Bishop, §4.3.2, (4.91), p. 206, for the gradient of `−ℓ`).

Route: the chain rule with `φ' = σ` gives the derivative `yᵢ σ(−yᵢ s) xᵢ` of the i-th term at
`s = ⟪w, xᵢ⟫`, and `yᵢ σ(−yᵢ s) = tᵢ − σ(s)` by `Real.sigmoid_neg` in each of the two cases of
the label. A maximizer has zero gradient (`IsLocalMax.hasFDerivAt_eq_zero`). Conversely, for any
`v` the function `g(t) = ℓ(w + t(v − w))` is concave on `ℝ` (3.1) with `g'(0) = 0`; the slopes
of a concave function from `0` decrease (`ConcaveOn.slope_anti`), so
`g(1) − g(0) ≤ g'(0) = 0`. (Proved here.)

**Checks.**

- Intercept-only model, three points `x = 1` with labels `true`, `true`, `false`:
  `ℓ(w) = −2 log (1 + e^(−w)) − log (1 + e^w)`; the gradient at `0` is `2 · (1/2) − 1/2 = 1/2`,
  and the score equation `2 (1 − σ(w)) − σ(w) = 0` gives `σ(w) = 2/3`, `w = log 2`: with an
  intercept, the fitted probabilities sum to the number of points labelled `true`.
- The identity of the Conventions: for label `false`, `y = −1`, `t = 0`, and
  `−σ(s) = 0 − σ(s)`; for `true`, `σ(−s) = 1 − σ(s)`.

*Needs:* 3.1; Mathlib `HasGradientAt`, `Real.sigmoid_neg`, `IsLocalMax.hasFDerivAt_eq_zero`,
`ConcaveOn.slope_anti`; Tau Ceti `Real.hasDerivAt_log_one_add_exp`.

### 3.3 Existence of the maximum-likelihood estimate

Prove `exists_isMax_logLikelihood_iff`: `ℓ` attains its supremum exactly when every `b` with
`yᵢ ⟪b, xᵢ⟫ ≥ 0` for all `i` satisfies `⟪b, xᵢ⟫ = 0` for all `i`. No rank hypothesis is made.
For points that span the space the condition says that no nonzero `b` has `yᵢ ⟪b, xᵢ⟫ ≥ 0` for
all `i`, which is the theorem of Albert and Anderson as stated by Candès–Sur, §1.1, (1)–(2),
p. 2; their paper's proof was not read. For spanning points the theorem is
MathematicalStatisticsFoundations 3.6 for the exponential family of Step 1 below; what is proved
here is that translation and the reduction of points that do not span to their span. (Proved
here, from Foundations 3.6.)

Route. Write `tᵢ = cond (z i).2 1 0`, so that `yᵢ = 2tᵢ − 1`, and `t = ∑ᵢ tᵢ xᵢ`. Steps 1–5
are stated for any finite-dimensional real inner product space `E` with its Borel σ-algebra that
contains the points `xᵢ` and on which `ℓ(w) = −∑ᵢ log (1 + exp (−yᵢ ⟪w, xᵢ⟫))`; Step 6 uses them
for `E` the feature space and for `E` the span of the points.

- *Step 1 (the family).* Let `ν` be the image of counting measure on `Fin n → Bool` under
  `s ↦ ∑ᵢ [sᵢ] xᵢ`, where `[sᵢ]` is `1` or `0` (measurable, since the domain is finite with every
  set measurable). It is finite with total mass `2ⁿ`, hence σ-finite and nonzero, and every
  `exp ⟪η, ·⟫` is `ν`-integrable, so `naturalParameterSpace ν id` is all of `E`. By
  `integral_map`, `integral_count` and `Finset.prod_univ_sum`,
  `∫ exp ⟪w, x⟫ dν = ∑ₛ ∏ᵢ exp ([sᵢ] ⟪w, xᵢ⟫) = ∏ᵢ (1 + exp ⟪w, xᵢ⟫)`,
  so `logPartition ν id w = ∑ᵢ log (1 + exp ⟪w, xᵢ⟫)`. Since `tᵢ r − log (1 + eʳ)` equals
  `−log (1 + e^(−yᵢ r))` for each of the two labels, `⟪w, t⟫ − logPartition ν id w = ℓ(w)`.
- *Step 2 (minimality).* The `ν`-null sets are those containing none of the points `∑ᵢ [sᵢ] xᵢ`,
  so `⟪u, ·⟫` is `ν`-a.e. constant exactly when it is constant on these points; comparing `s = 0`
  with the `s` whose only `true` entry is `i`, this holds exactly when `⟪u, xᵢ⟫ = 0` for every
  `i`. Hence `IsMinimalExponentialFamily ν id` holds exactly when the points span `E`
  (`Submodule.orthogonal_eq_bot_iff`).
- *Step 3 (support and hull).* The support of `ν` is the finite set of the points `∑ᵢ [sᵢ] xᵢ`:
  each is an atom of positive mass, and the complement of a finite set is open and `ν`-null. This
  set is the Minkowski sum of the pairs `{0, xᵢ}`, so by `convexHull_sum` and `convexHull_pair`
  its convex hull is the zonotope `Z = {∑ᵢ λᵢ xᵢ : λ ∈ [0, 1]ⁿ}`, which contains `t`.
- *Step 4 (interior).* Let the points span `E`. Then `Z` contains `0` and a basis of `E`, so its
  interior is nonempty (`interior_convexHull_nonempty_iff_affineSpan_eq_top`), and
  `geometric_hahn_banach_of_nonempty_interior`, applied to `Z` and `{t}` with the functional
  written as `⟪u, ·⟫` (`InnerProductSpace.toDual`), shows: `t` is not in the interior of `Z`
  exactly when some nonzero `u` has `⟪u, z − t⟫ ≤ 0` for all `z ∈ Z` (conversely, such a `u`
  puts `t + εu` outside `Z` for every `ε > 0`). Now `max_{z ∈ Z} ⟪u, z⟫ = ∑ᵢ max (0, ⟪u, xᵢ⟫)`,
  which is at least `⟪u, t⟫ = ∑ᵢ tᵢ ⟪u, xᵢ⟫`, with equality exactly when
  `tᵢ ⟪u, xᵢ⟫ = max (0, ⟪u, xᵢ⟫)` for each `i`, that is when `yᵢ ⟪u, xᵢ⟫ ≥ 0` for all `i`.
  So `t` lies in the interior of `Z` exactly when no nonzero `u` has `yᵢ ⟪u, xᵢ⟫ ≥ 0` for all
  `i`.
- *Step 5 (spanning points).* If the points span `E`, Steps 1 and 2 give the hypotheses of
  Foundations 3.6 (σ-finite, nonzero, minimal, nonempty natural parameter space), and since the
  natural parameter space is `E`, its conclusion says that `ℓ` has a maximizer on `E` exactly
  when `t` is in the interior of the convex hull of the support, that is (Steps 3 and 4) exactly
  when no nonzero `u ∈ E` has `yᵢ ⟪u, xᵢ⟫ ≥ 0` for all `i`.
- *Step 6 (any points).* Let `V` be the span of the `xᵢ` in the feature space and `P` the
  orthogonal projection onto `V`. Since `⟪w − P w, xᵢ⟫ = 0`
  (`Submodule.starProjection_inner_eq_zero`), `ℓ(w) = ℓ(P w)`, so `ℓ` has a maximizer exactly
  when its restriction to `V` has one. If `V = {0}`, `ℓ` is constant and the condition holds.
  Otherwise Step 5 applies to `E = V` (with the Borel σ-algebra of the subspace,
  `Subtype.borelSpace`), where the points span: a maximizer exists exactly when no nonzero
  `u ∈ V` has `yᵢ ⟪u, xᵢ⟫ ≥ 0` for all `i`. This is the condition of the theorem: a `b` in the
  feature space has the same inner products with the `xᵢ` as `P b ∈ V`, and `P b = 0` exactly
  when `b` is orthogonal to every `xᵢ`.

**Checks.**

- Quasi-complete separation, one feature: `x₁ = 1` labelled `true` and `x₂ = 0` labelled
  `false`. Then `ℓ(w) = −log (1 + e^(−w)) − log 2` is strictly increasing with supremum `−log 2`,
  not attained; `b = 1` has `y₁ ⟪b, x₁⟫ = 1 ≥ 0`, `y₂ ⟪b, x₂⟫ = 0 ≥ 0` and `⟪b, x₁⟫ ≠ 0`. Values:
  `ℓ(0) = −2 log 2 ≈ −1.3863`, `ℓ(20) ≈ −0.693147`.
- Rank deficiency: the two points `(1, 0)` of the Check in 3.1 satisfy the condition (a `b` with
  `b₁ ≥ 0` and `−b₁ ≥ 0` has `b₁ = 0`), and `ℓ` attains its maximum `−2 log 2` on the whole line
  `w₁ = 0`; the full-rank form "no nonzero `b`" fails there (`b = (0, 1)`), so it is not the
  right condition for existence alone.
- `n = 0`: the condition holds vacuously and `ℓ ≡ 0` attains its supremum.

*Needs:* MathematicalStatisticsFoundations 3.6
(`exists_isMaxOn_logLikelihood_iff_mem_interior_convexHull_support`, with its definitions
`naturalParameterSpace`, `logPartition`, `IsMinimalExponentialFamily`); Mathlib `Measure.count`,
`Measure.map`, `measurable_of_finite`, `Integrable.of_finite`, `integrable_map_measure`,
`integral_map`, `integral_count`, `Finset.prod_univ_sum`, `Submodule.orthogonal_eq_bot_iff`,
`Measure.support`, `convexHull_sum`, `convexHull_pair`,
`interior_convexHull_nonempty_iff_affineSpan_eq_top`,
`geometric_hahn_banach_of_nonempty_interior`, `InnerProductSpace.toDual`,
`Submodule.starProjection_inner_eq_zero`, `Subtype.borelSpace`.

### 3.4 Existence with uniqueness: overlap

Prove `existsUnique_isMax_logLikelihood_iff`: `ℓ` has exactly one maximizer exactly when the
data overlap, that is, no nonzero `b` has `yᵢ ⟪b, xᵢ⟫ ≥ 0` for all `i` (Candès–Sur, §1.1,
p. 2, statement of Albert and Anderson's theorem; their overlap, a correctly and an incorrectly
classified point for every nonzero `b`, is this condition applied to `b` and `−b`). (Proved
here.)

Route: overlap implies that the `xᵢ` span the space, since a nonzero `v` orthogonal to all of
them would have `yᵢ ⟪v, xᵢ⟫ = 0 ≥ 0`. Under overlap the condition of 3.3 holds (only `b = 0`
satisfies its premise), so a maximizer exists, and it is unique by strict concavity (3.1, with
`StrictConvexOn.eq_of_isMinOn` for `−ℓ`). Conversely, if the maximizer is unique and a nonzero
`b` had `yᵢ ⟪b, xᵢ⟫ ≥ 0` for all `i`, then by 3.3 `b` would be orthogonal to every `xᵢ`, and
`w* + b` would be a second maximizer.

**Checks.**

- The rank-deficient sample of 3.3 has a maximizer but not a unique one, and it does not overlap
  (`b = (0, 1)`): both sides are false.
- Overlap, intercept-only: the three points of the Check in 3.2 overlap (`b > 0` misclassifies
  the third point, `b < 0` the first two), and `w = log 2` is the unique maximizer.

*Needs:* 3.1, 3.3; Mathlib `StrictConvexOn.eq_of_isMinOn`.

### 3.5 Complete separation

Prove `sSup_logLikelihood_eq_zero_iff`: the supremum of `ℓ` is `0` exactly when the data are
completely separated, some `b` having `yᵢ ⟪b, xᵢ⟫ > 0` for every `i`; and if they are not, then
`ℓ(w) ≤ −log 2` for every `w` (Candès–Sur, §1.1, (1), p. 2, for complete separation; Bishop,
§4.3.2, p. 206, for the behaviour of the maximum-likelihood fit on separable data). (Proved
here.)

Route: every term of `ℓ` is negative, so `ℓ < 0` when `n ≥ 1` and the supremum is at most `0`.
Under complete separation by `b`, each term `−log (1 + exp (−t yᵢ ⟪b, xᵢ⟫))` tends to `0` as
`t → ∞`, so the supremum is `0`. If `ℓ(w) > −log 2` for some `w`, then each of the `n`
positive terms is below `log 2`, so `exp (−yᵢ ⟪w, xᵢ⟫) < 1` and `yᵢ ⟪w, xᵢ⟫ > 0` for every `i`:
`w` separates completely. This gives the second statement, and with it the converse of the first,
since a supremum `0 > −log 2` is exceeded by some value of `ℓ`.

**Checks.**

- Complete separation, one feature: `x₁ = 1` labelled `true`, `x₂ = −1` labelled `false`:
  `ℓ(w) = −2 log (1 + e^(−w))`, supremum `0`, not attained.
- The bound `−log 2` is attained: for the single point `x = 0` with any label, `ℓ ≡ −log 2`, and
  there is no complete separation.
- The quasi-complete example of 3.3 has supremum exactly `−log 2`, in the second case.
- `n = 0`: complete separation holds vacuously and `ℓ ≡ 0`, supremum `0`.

*Needs:* Mathlib `Real.log_lt_log`, `Real.sSup_nonpos`, `le_csSup`; nothing from 3.1–3.4.

### Examples

- Bishop, §4.3.2, p. 206, describes the separable case: the fitted weights run off to infinity
  and every training point is assigned probability `1`. In the terms above, the supremum `0` of
  3.5 is not attained when `n ≥ 1`, by 3.3 applied to a separating direction.

### Dependencies

Mathlib's sigmoid, convexity on `ℝ`, gradients and the separation theorem in finite dimension;
Tau Ceti's derivative of `log (1 + eˢ)`; `labelSign` copied from StatisticalLearningTheory 1.1;
MathematicalStatisticsFoundations 3.6, in the route of 3.3. No other layer.

## Scope and ownership

This roadmap owns the labelled two-class model with Gaussian and binary naive Bayes classes and
the logistic form of their posteriors (Layer 1); the class means, the within-class scatter matrix,
Fisher's criterion, Fisher's theorem with its value and maximizers, and its least-squares form
(Layer 2); and the logistic log-likelihood with its concavity, score equations, existence,
uniqueness and separation theorems (Layer 3).

Already in the libraries and therefore not targets: Mathlib's logistic sigmoid with its
derivative and symmetry, multivariate Gaussian and Bernoulli laws, product measures, positive
definite matrices and Cauchy–Schwarz for symmetric bilinear forms; Tau Ceti's density of a
nondegenerate multivariate Gaussian law and the derivative of `log (1 + eˢ)`. Tau Ceti's
Rayleigh principle for a coercive form, `IsCoercive.isLeast_rayleighQuotient`, gives the extreme
value of a generalised Rayleigh quotient as the reciprocal norm of a solution operator; 2.1 is
the rank-one case made explicit, with the value `⟪δ, S_W⁻¹ δ⟫` and the set of all maximizers,
which that theorem does not state, and its route does not use it.

Left to other roadmaps:

- StatisticalLearningTheory 1.1 and 1.2 define `labelSign` and the regression-function predicate,
  copied verbatim here, and state the Bayes classifier theorem (the plug-in rule of a regression
  function is optimal) and the plug-in bounds; this roadmap uses the Bayes classifier theorem
  only in the consequences stated in prose after 1.2 and 1.3, and does not restate it.
  StatisticalLearningTheory 1.3 (the log loss is proper) and the logistic example of its 1.4
  (classification calibration of the logistic loss) are not restated; Layer 3 concerns the
  empirical likelihood of a fixed sample, not risks or calibration.
- MathematicalStatisticsFoundations 9.5 names the scatter matrix of a sample, the Gaussian
  likelihood and its maximizer `(x̄, scatter/n)`; the within-class scatter matrix of 2.1 is the
  sum of the scatter matrices of the two classes and is defined here because 9.5 has no Lean
  declaration. MathematicalStatisticsFoundations 3.6
  (`exists_isMaxOn_logLikelihood_iff_mem_interior_convexHull_support`) characterizes, for a
  nonzero σ-finite minimal family with nonempty natural parameter space, existence of the
  maximum of an exponential-family likelihood by the observation lying in the interior of the
  convex hull of the support. `ℓ` is such a likelihood: take for `ν` the image of counting
  measure on `{0, 1}ⁿ` under `s ↦ ∑ᵢ sᵢ xᵢ` and the observation `t = ∑ᵢ tᵢ xᵢ`; then `ν` is
  finite and nonzero, its natural parameter space is the whole space,
  `⟪w, t⟫ − logPartition ν id w = ℓ(w)`, and the family is minimal exactly when the points
  span. For spanning points, 3.6 is therefore the theorem of 3.3 once its interior condition is
  translated: the convex hull of the support is the zonotope `{∑ᵢ λᵢ xᵢ : λ ∈ [0, 1]ⁿ}`, and a
  nonzero `u` with `⟪u, z − t⟫ ≤ 0` on it is exactly a nonzero `u` with `yᵢ ⟪u, xᵢ⟫ ≥ 0` for
  all `i`. 3.3 rests on 3.6: its route proves this dictionary and reduces points that do not
  span to their span, where 3.6 applies. 3.4 adds uniqueness, from the strict concavity of 3.1
  (for an open natural parameter space, uniqueness is a bullet of the prose of 3.6, not a
  declared theorem there). 3.1, 3.2 and 3.5 are not declared in Foundations: its 3.3 declares
  the derivative and the Hessian of the log partition function (`hasFDerivAt_logPartition`,
  `fderiv_fderiv_logPartition_apply`), which under the dictionary give the gradient of 3.2 and
  the concavity of 3.1, but neither the strict concavity, nor the characterization of maximizers
  by the score, nor the supremum of 3.5 is stated there; 3.1 and 3.2 are proved here directly by
  the chain rule.
- MathematicalStatisticsAsymptotic Layer 5 owns the asymptotics of maximum-likelihood estimators;
  no limit theorem for the logistic estimator is stated here.
- GaussianLinearModels owns least squares in a linear model: in Layer 1 the normal equations
  (`isLeastSquares_iff_adjoint_apply`), the solution set and the hat operator, in Layer 2 the
  Gauss–Markov theorem. 2.2 is a different statement, the identification of one least-squares
  solution with Fisher's direction; its route derives the normal equations of this one quadratic
  directly, so this roadmap does not depend on GaussianLinearModels.
- ExponentialCone 2.3 represents the logistic cost in the exponential cone; it is neither used
  nor restated.

Outside the scope: more than two classes (softmax posteriors, Fisher's discriminant for several
classes and its generalised eigenvector form), estimation of the Gaussian parameters and the
consistency of plug-in discriminant rules, Gaussian mixture models and their estimation, hinge
losses and margins, regularised logistic regression, every iterative fitting procedure
(including iteratively reweighted least squares), and the asymptotic and high-dimensional
theory of the logistic estimator.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/SpecialFunctions/Sigmoid.lean`: `Real.sigmoid` (`σ(s) = (1 + e^(−s))⁻¹`),
  `Real.sigmoid_neg` (`σ(−s) = 1 − σ(s)`), `Real.hasDerivAt_sigmoid` (derivative
  `σ(1 − σ)`), `Real.sigmoid_pos`, `Real.sigmoid_lt_one`.
- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`:
  `ProbabilityTheory.multivariateGaussian` (the Gaussian law on `EuclideanSpace ℝ ι` with mean
  `μ` and covariance `S`, meaningful for positive semidefinite `S`).
- `Mathlib/Probability/Distributions/Bernoulli.lean`: `ProbabilityTheory.bernoulliMeasure`
  (mass `p` at the first point and `1 − p` at the second, `p : unitInterval`),
  `ProbabilityTheory.bernoulliMeasure_apply`.
- `Mathlib/MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi`,
  `MeasureTheory.Measure.pi_pi` (the product measure of a box, for σ-finite factors).
- `Mathlib/MeasureTheory/Integral/Bochner/ContinuousLinearMap.lean`:
  `setIntegral_withDensity_eq_setIntegral_toReal_smul` (a set integral against `μ.withDensity f`
  for measurable `f` finite a.e. is the integral of `f.toReal • g` against `μ`).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef`, `Matrix.PosDef.inv` (the inverse
  of a positive definite matrix is positive definite). `Mathlib/Data/Matrix/Mul.lean`:
  `Matrix.vecMulVec`. `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `Matrix.toEuclideanLin`.
- `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`:
  `LinearMap.BilinForm.apply_sq_le_of_symm` (Cauchy–Schwarz `B(x, y)² ≤ B(x, x) B(y, y)` for a
  symmetric bilinear form with `B(x, x) ≥ 0`).
- `Mathlib/Analysis/Convex/Deriv.lean`: `strictConvexOn_of_deriv2_pos` (a continuous function on
  a convex set of `ℝ` with positive second derivative in the interior is strictly convex),
  `ConcaveOn.slope_anti`. `Mathlib/Analysis/Convex/Function.lean`:
  `StrictConvexOn.eq_of_isMinOn`, `StrictConvexOn.add_convexOn`, `ConvexOn.comp_linearMap`.
- `Mathlib/Analysis/Calculus/Gradient/Basic.lean`: `HasGradientAt`.
  `Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`: `IsLocalMax.hasFDerivAt_eq_zero`.
- `Mathlib/MeasureTheory/Measure/Count.lean`: `MeasureTheory.Measure.count`.
  `Mathlib/MeasureTheory/Measure/Support.lean`: `MeasureTheory.Measure.support` (the points
  every neighbourhood of which has positive measure).
  `Mathlib/MeasureTheory/Function/L1Space/Integrable.lean`: `MeasureTheory.Integrable.of_finite`,
  `MeasureTheory.integrable_map_measure`. `Mathlib/MeasureTheory/MeasurableSpace/Basic.lean`:
  `measurable_of_finite`. `Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean`:
  `Subtype.borelSpace`. `Mathlib/Algebra/BigOperators/Ring/Finset.lean`: `Finset.prod_univ_sum`
  (a product of sums is a sum of products).
- `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`: `MeasureTheory.integral_map` (the integral
  against an image measure). `Mathlib/MeasureTheory/Integral/Bochner/SumMeasure.lean`:
  `MeasureTheory.integral_count` (on a finite type, the integral against counting measure is
  the sum).
- `Mathlib/Analysis/Convex/Combination.lean`: `convexHull_sum` (the convex hull of a finite
  Minkowski sum is the sum of the convex hulls). `Mathlib/Analysis/Convex/Hull.lean`:
  `convexHull_pair` (the convex hull of two points is their segment).
  `Mathlib/Analysis/Normed/Affine/AddTorsorBases.lean`:
  `interior_convexHull_nonempty_iff_affineSpan_eq_top`.
  `Mathlib/Analysis/LocallyConvex/Separation.lean`: `geometric_hahn_banach_of_nonempty_interior`
  (a nonzero continuous linear functional weakly separates a convex set with nonempty interior
  from a convex set disjoint from that interior). `Mathlib/Analysis/InnerProductSpace/Dual.lean`:
  `InnerProductSpace.toDual`. `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`:
  `Submodule.starProjection_inner_eq_zero` (`⟪v − P_K v, w⟫ = 0` for `w ∈ K`).
- `Mathlib/Analysis/InnerProductSpace/Projection/Submodule.lean`:
  `Submodule.orthogonal_eq_bot_iff` (a subspace with an orthogonal projection has zero
  orthogonal complement exactly when it is the whole space).

### From Tau Ceti

- `TauCeti/Probability/Distributions/Gaussian/Density.lean`:
  `TauCeti.Probability.multivariateGaussianPDFReal` (the density
  `(2π)^(−d/2) (det S)^(−1/2) exp (−⟪x − m, S⁻¹(x − m)⟫/2)`),
  `TauCeti.Probability.multivariateGaussian_eq_withDensity` (for positive definite `S`, the
  Gaussian law is Lebesgue measure with that density),
  `TauCeti.Probability.multivariateGaussianPDFReal_pos` (positive when `det S > 0`),
  `TauCeti.Probability.measurable_multivariateGaussianPDFReal`; used in 1.2 and 1.3.
- `TauCeti/Analysis/SpecialFunctions/Sigmoid.lean`: `Real.hasDerivAt_log_one_add_exp` (the
  derivative of `log (1 + eˢ)` is `σ(s)`); used in 3.1 and 3.2.
- `TauCeti/Analysis/InnerProductSpace/Variational/Rayleigh.lean`:
  `IsCoercive.isLeast_rayleighQuotient`; named in the scope section only, not used by a route.

### From TauCetiRoadmap.StatisticalLearningTheory

- Section 1.1: the definition `labelSign`, copied verbatim into `Suggested.lean`; used in Layer 3.
- Section 1.2: the definition `IsRegressionFunction`, copied verbatim into `Suggested.lean` and
  used in every statement of Layer 1; and the Bayes classifier theorem (the plug-in rule
  `decide (1/2 ≤ η x)` of a regression function `η` has the least misclassification probability
  among measurable classifiers; `classificationError_bayesClassifier`, for a probability
  measure `P`), used only in the consequences stated after 1.2 and 1.3.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- Section 3.1: the definitions `naturalParameterSpace ν T` (the `η` with `exp ⟪η, T⟫`
  `ν`-integrable), `logPartition ν T η = log ∫ exp ⟪η, T x⟫ dν` and
  `IsMinimalExponentialFamily ν T` (no nonzero `⟪u, T⟫` is `ν`-a.e. constant), used with
  `T = id` in the route of 3.3 and not copied into `Suggested.lean`, which states nothing in
  their terms.
- Section 3.6: `exists_isMaxOn_logLikelihood_iff_mem_interior_convexHull_support` (for a
  σ-finite `ν ≠ 0` on a finite-dimensional real inner product space with its Borel σ-algebra,
  minimal for `id`, with nonempty natural parameter space `N`, and an observation `t`: some
  `η ∈ N` maximizes `ζ ↦ ⟪ζ, t⟫ − logPartition ν id ζ` on `N` exactly when `t` lies in the
  interior of the convex hull of `ν.support`); used in the route of 3.3, and through it in 3.4.

## References

- Christopher M. Bishop, *Pattern Recognition and Machine Learning*, Springer, 2006; the PDF
  linked from the author's book page at Microsoft Research
  (microsoft.com/en-us/research/people/cmbishop/prml-book/). Locators are printed pages: §4.1.4,
  (4.25)–(4.30), pp. 187–189; §4.1.5, (4.31)–(4.38), pp. 189–190; §4.2, (4.57)–(4.58), p. 197;
  §4.2.1, (4.64)–(4.70), pp. 198–199; §4.2.2, (4.78)–(4.80), p. 202; §4.2.3, (4.81)–(4.82),
  p. 202; §4.3.2, (4.89)–(4.91) and the remark on separable data, p. 206; §4.3.3,
  (4.96)–(4.98), pp. 207–208. On pp. 207–208 the cross-entropy error, which is convex, is
  called "concave", and its Hessian is stated to be positive definite and its minimum unique
  with no hypothesis on the data; these need that the points span (3.1; the Check there with two
  equal points is a counterexample to definiteness) and that the data overlap (3.4; the
  separated sample of the Check in 3.5 has no minimum).
- Shai Shalev-Shwartz and Shai Ben-David, *Understanding Machine Learning: From Theory to
  Algorithms*, Cambridge University Press, 2014; the PDF on the first author's page. §9.3,
  (9.10) and the paragraph after it, p. 127.
- Emmanuel J. Candès and Pragya Sur, The phase transition for the existence of the maximum
  likelihood estimate in high-dimensional logistic regression, arXiv:1804.09753v1 (April
  2018). §1.1, (1)–(2), p. 2: the definitions of complete separation, quasi-complete
  separation and overlap, and the statement, credited to Albert and Anderson, that the
  maximum-likelihood estimate exists exactly when the data overlap. The statement there does
  not mention the rank of the design; for points that do not span, the rank-deficient Check of
  3.3 has a maximizer and no overlap, and existence alone is 3.3.
- A. Albert and J. A. Anderson, On the existence of maximum likelihood estimates in logistic
  regression models, *Biometrika* (1984): attributed in prose through Candès–Sur only; the paper
  was not opened, and no locator into it is given.

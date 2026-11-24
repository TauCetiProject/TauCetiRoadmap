# Roadmap: Gaussian linear models

**Summary.** This roadmap builds the exact finite-sample theory of the linear model
`Y = Xβ + ε`. The observation `Y` lives in a finite-dimensional real inner product space of
dimension `n`, the design `X` is a linear map of any rank from a finite-dimensional parameter
space, and the mean `μ = Xβ` ranges over the range `L` of the design, of dimension `p`. Full
column rank is assumed only where a statement says so; otherwise the theory is stated for the
fitted value and for the estimable functionals. The errors are, in turn, absent (the geometry
of least squares), of mean zero with a known covariance operator, and Gaussian, `ε = σZ` with
`Z` standard Gaussian and `σ ≠ 0`. Throughout, `P_K` is the orthogonal projection onto `K`.

The headline theorems are these.

- *Gauss–Markov and Aitken.* If the errors have mean zero and covariance `σ²` times the
  identity, and the linear estimator `⟪b, Y⟫` is unbiased for the functional `⟪a, μ⟫` of the
  mean on `L`, then its variance is the variance of the least-squares estimator `⟪a, P_L Y⟫`
  plus `σ² ‖b − P_L a‖²`. For errors with any covariance operator `S` there is an unbiased
  `⟪b₀, Y⟫` with `S b₀ ∈ L`, and the variance of every unbiased `⟪b, Y⟫` exceeds its variance by
  `⟪b − b₀, S(b − b₀)⟫`.
- *Cochran's theorem.* Finitely many endomorphisms of a finite-dimensional vector space over a
  field of characteristic zero that sum to the identity are all idempotent if and only if
  their pairwise products vanish, if and only if their ranks add up to the dimension. For a
  standard Gaussian vector `Z`, a vector `v` and finitely many pairwise orthogonal subspaces
  `Kᵢ`, the squared lengths `‖P_{Kᵢ}(v + Z)‖²` are independent, and the `i`-th has the
  noncentral chi-squared law with `dim Kᵢ` degrees of freedom and noncentrality `‖P_{Kᵢ} v‖²`.
- *The `t` and `F` laws.* Let `Y = μ + σZ` with `σ ≠ 0`, and let `M` be a subspace of dimension
  `ν ≥ 1` orthogonal to `μ`. For a nonzero `a` orthogonal to `M` and a real `t₀`,
  `(⟪a, Y⟫ − t₀) / (‖a‖ √(‖P_M Y‖²/ν))` has the noncentral `t` law with `ν` degrees of freedom
  and noncentrality `(⟪a, μ⟫ − t₀)/(|σ| ‖a‖)`. For a subspace `K` of dimension `k ≥ 1`
  orthogonal to `M` and any vector `m₀`, `(‖P_K(Y − m₀)‖²/k) / (‖P_M Y‖²/ν)` has the noncentral
  `F` law with degrees `k` and `ν` and noncentrality `‖P_K(μ − m₀)‖²/σ²`. With `M` the
  orthogonal complement of `L`, these are the laws of the studentized estimable functional and
  of the `F`-statistic of a linear hypothesis, under the hypothesis and under every
  alternative.

The chi-squared, Student, Fisher–Snedecor and noncentral laws and the projection laws of a
standard Gaussian vector come from Tau Ceti, as built by the StandardDistributions roadmap.
MathematicalStatisticsFoundations has Student's theorem for a Gaussian sample, the case of a
constant design, and Scheffé's intervals for this model. MathematicalStatisticsHighDimensional
continues with penalties and model selection in the same Gaussian regression model, and
MathematicalStatisticsAsymptotic treats non-Gaussian errors in the limit.

## How to read the build

Layer 1 is the deterministic geometry: least-squares solutions, the hat operator, estimable
functionals, and sums of squares for nested models and linear constraints. Layer 2, which uses
Layer 1, is the second-order theory: moments of linear and quadratic statistics, Gauss–Markov
and Aitken. Layer 3, which uses Layers 1 and 2, is the Gaussian theory: Cochran's theorem, the
laws of the fitted value, the residual sum of squares, the `t` and `F` statistics, and the
likelihood. Layer 4, which uses Layers 1 to 3, reads the general theorems in the classical
layouts: one-way analysis of variance, the two-sample `t` statistic, simple linear regression,
and the balanced two-way additive layout.

## Conventions

- **Namespace.** The implementation is in the namespace `TauCeti`, with Mathlib's
  `ProbabilityTheory` and `MeasureTheory` opened. `Suggested.lean` states the prototypes in the
  namespace `TauCetiRoadmap.GaussianLinearModels`.
- **Spaces.** `E` (parameters), `F` (observations) and `G` (values of a linear constraint) are
  finite-dimensional real inner product spaces, and `n = dim F`. The inner product of `E` serves
  only to write functionals as `⟪c, ·⟫` and to form adjoints; the fitted value, the residual and
  every statistic of Layers 3 and 4 do not depend on it.
- **Design.** A design is a linear map `X : E →ₗ[ℝ] F` of any rank. Its range `L` is the mean
  space, `p = dim L` is the rank of `X` (not `dim E`), and `X†` is Mathlib's `LinearMap.adjoint`.
  "Full rank" means that `X` is injective; this is assumed only in the statements that contain
  `(X† X)⁻¹`, and each such statement says so.
- **Projections.** `P_K` is the orthogonal projection onto a subspace `K`, Mathlib's
  `K.starProjection`, as a map `F → F`, and `Kᗮ` is the orthogonal complement. The fitted value
  of `y` is `P_L y`, the residual is `y − P_L y = P_{Lᗮ} y`, and `RSS(y) = ‖y − P_L y‖²`.
- **Estimable functionals.** A vector `c : E` is estimable for `X` when `c` lies in the range of
  `X†`. By 1.3 this means that `⟪c, b⟫` is the same for all least-squares solutions `b`.
- **Errors.** The model is `Y = μ + ε` with `μ ∈ L`, on a probability space `(Ω, P)`.
  Second-order statements assume `IsCenteredWithCovariance ε S P` (2.1): mean zero and
  covariance operator `S`, with no independence and no law. White noise of variance `σ²` is
  `S = σ² · id`; `σ = 0` is allowed there. Gaussian statements take `ε = σ • Z` with
  `Z : Ω → F` of law Mathlib's `stdGaussian F`, where `F` carries its Borel σ-algebra, and
  `σ ≠ 0` real; only `|σ|` enters the laws. For `σ = 0` the statistics of Layer 3 are constants
  or of the form `0/0`, and no law is claimed.
- **Subspaces in place of designs.** Layers 2 and 3 state their theorems for a subspace `L` of
  `F`, or for subspaces `K` and `M` orthogonal to each other, and a mean vector; a design enters
  through `L = range X`, `M = Lᗮ` and `ν = dim M = n − p`. With `M = Lᗮ` the hypotheses
  `μ ∈ Mᗮ`, `a ∈ Mᗮ` and `K ⟂ M` of 3.5 and 3.6 read `μ ∈ L`, `a ∈ L` and `K ≤ L`.
- **Laws.** `χ²(k)`, `χ²(k; λ)`, `t(ν; δ)` and `F(k, ν; λ)` are Tau Ceti's `chiSquaredMeasure`,
  `noncentralChiSquaredMeasure`, `noncentralTMeasure` and `noncentralFMeasure`, with real
  degrees of freedom and with `λ : ℝ≥0`. `χ²(0)` is the Dirac mass at `0`. The `t` and `F`
  measures are the zero measure when a degree of freedom is not positive, which is why every
  `t` and `F` statement assumes `ν ≥ 1` (that is, `n > p` in a linear model) and `k ≥ 1`.
- **Degenerate cases covered.** `E = 0`, `X = 0`, `p = n`, a design that is not injective,
  `K = 0`, an empty family of subspaces, and empty groups in a layout are all inside the
  statements unless a hypothesis excludes them; each exclusion is recorded as a Check.

## Layer 1: least squares

Everything in this layer is deterministic.

### 1.1 Least-squares solutions and the fitted value

Define `IsLeastSquares X y b`: for every `b' : E`, `‖y − X b‖ ≤ ‖y − X b'‖`.

- **Normal equations** (`isLeastSquares_iff_adjoint_apply`). For every design `X`, observation
  `y` and `b : E`: `b` is a least-squares solution if and only if `X†(X b) = X† y`
  (Chua, §3.1, p. 39, for a matrix of full column rank; the form for a design of any rank is
  proved here).
- `b` is a least-squares solution if and only if `X b = P_L y`.
- A least-squares solution exists for every `y`. If `b` is one, the set of all of them is
  `b + ker X`. Hence the solution is unique for one `y`, equivalently for every `y`, exactly
  when `X` is injective; the fitted value `X b = P_L y` is the same for all solutions in every
  case.
- Among the least-squares solutions exactly one lies in `(ker X)ᗮ`, and it is the one of least
  norm.

The proof is the characterization of the nearest point of a subspace by orthogonality of the
residual, with `⟪X b', y − X b⟫ = ⟪b', X†(y − X b)⟫`.

*Needs:* Mathlib `Submodule.starProjection`, `Submodule.starProjection_minimal`,
`Submodule.norm_eq_iInf_iff_real_inner_eq_zero`, `LinearMap.adjoint`,
`LinearMap.adjoint_inner_left`.

**Checks.**

- Collinear design `X(b₁, b₂) = (b₁ + b₂)·(1, 1)` on `ℝ²` and `y = (1, 3)`: the fitted value is
  `(2, 2)`, `RSS = 2`, and the least-squares solutions are exactly the `b` with `b₁ + b₂ = 2`,
  among them `(2, 0)` and `(0, 2)`; the one of least norm is `(1, 1)`. A definition asking for
  `X b = y` would have no solution here.
- `X = 0`: every `b` is a least-squares solution and the fitted value is `0`.
- `X(b) = b·(1, 1)` from `ℝ` to `ℝ²` and `y = (1, 3)`: `X† X = 2`, `X† y = 4`, and the only
  solution is `b = 2`.

### 1.2 The hat operator

The hat operator of a design is `H = P_L`.

- `H X = X`, `H` is symmetric and idempotent, and `tr H = p`, `tr (id − H) = n − p`, where `p`
  is the rank of `X` (Shalizi, §12.3, p. 208, for a matrix of full column rank with an
  intercept, where `p` is the number of columns).
- `X† X` is invertible exactly when `X` is injective. In that case `H = X (X† X)⁻¹ X†` and the
  unique least-squares solution is `β̂(y) = (X† X)⁻¹ X† y` (Chua, §3.1, p. 39).
- **Leverages.** For a unit vector `e`, `⟪e, H e⟫ = ‖H e‖² ∈ [0, 1]`, and for an orthonormal
  basis `(eᵢ)` of `F` the leverages `⟪eᵢ, H eᵢ⟫` sum to `p`.

*Needs:* 1.1; Mathlib `Submodule.starProjection_isSymmetric`, `LinearMap.IsProj.trace`,
`LinearMap.trace`.

**Checks.**

- `X(b) = b·(1, 1)`: `H` has matrix `[[1/2, 1/2], [1/2, 1/2]]`, trace `1`, and both leverages
  are `1/2`.
- The collinear design of 1.1 has two columns and the same `H`: the trace is the rank `1`, not
  the number of columns `2`, and `X† X = [[2, 2], [2, 2]]` is singular.
- `X` surjective (`p = n`): `H = id`, every leverage is `1`, and `RSS = 0` for every `y`.

### 1.3 Estimable functionals

- **Estimability** (`mem_range_adjoint_iff_forall_isLeastSquares`). For every design `X`, every
  observation `y` and every `c : E`: `c` lies in the range of `X†` if and only if
  `⟪c, b⟫ = ⟪c, b'⟫` for all least-squares solutions `b`, `b'` for `y`.
- The condition of the previous bullet does not depend on `y`, and it is equivalent to
  `c ∈ (ker X)ᗮ`.
- If `c = X† a` with `a : F`, then `⟪c, b⟫ = ⟪a, P_L y⟫ = ⟪P_L a, y⟫` for every least-squares
  solution `b` for `y`.
- A linear function `y ↦ ⟪a, y⟫` satisfies `⟪a, X β⟫ = ⟪c, β⟫` for every `β` if and only if
  `c = X† a`. So `c` is estimable exactly when `⟪c, β⟫` is the mean of some linear function of
  the observation, for every `β` and every error with mean zero.
- Every `c` is estimable if and only if `X` is injective.

*Needs:* 1.1; Mathlib `LinearMap.orthogonal_ker`, `Submodule.inner_starProjection_left_eq_right`.
(Proved here.)

**Checks.**

- Collinear design of 1.1, `y = (1, 3)`: `c = (1, 1)` is estimable and `⟪c, b⟫ = 2` on every
  solution; `c = (1, 0)` is not, with values `2` and `0` at the solutions `(2, 0)` and `(0, 2)`.
- `X = 0`: only `c = 0` is estimable.

### 1.4 Sums of squares, nested models and linear constraints

- **Nested models.** For subspaces `L₀ ≤ L` of `F`: `P_L − P_{L₀} = P_K` with `K = L ⊓ L₀ᗮ`,
  `dim K = dim L − dim L₀`, and
  `‖y − P_{L₀} y‖² = ‖y − P_L y‖² + ‖P_L y − P_{L₀} y‖²` (Chua, §3.8.1, pp. 51–52).
- **Coefficient of determination.** For `L₀ ≤ L` and `y ∉ L₀`, put
  `R²(y) = ‖P_L y − P_{L₀} y‖² / ‖y − P_{L₀} y‖²`. Then `R² = 1 − RSS/RSS₀ ∈ [0, 1]`, with
  `R² = 1` exactly when `y ∈ L` and `R² = 0` exactly when `P_L y ∈ L₀`; when `P_L y ∉ L₀`, `R²`
  is the squared cosine of the angle between `y − P_{L₀} y` and `P_L y − P_{L₀} y`. The classical
  coefficient is the case where `L₀` is the line of constant vectors (Shalizi, §10.3, p. 180,
  for simple regression).
- **Linear constraints, multiplier form**
  (`isLeast_image_sq_norm_sub_of_adjoint_apply_eq`). Let `C : E →ₗ[ℝ] G` and `d : G`, with no
  assumption on the ranks of `X` and `C`. If `bh` is a least-squares solution for `y`, and
  `u : E`, `w : G` satisfy `X†(X u) = C† w` and `C u = C bh − d`, then `‖y − X b‖²` has a
  least value over the `b` with `C b = d`, and it is `‖y − X bh‖² + ⟪w, C bh − d⟫`.
- In the previous bullet the least value is attained at `bh − u`, and a pair `(u, w)` as there
  exists if and only if `d` lies in the range of `C`.
- **Explicit form.** If `X` is injective and `C` is surjective, then `C (X† X)⁻¹ C†` is
  invertible, `w = (C (X† X)⁻¹ C†)⁻¹ (C β̂ − d)`, the constrained minimizer is unique and equals
  `β̂ − (X† X)⁻¹ C† w`, and the increase of the residual sum of squares is
  `⟪C β̂ − d, (C (X† X)⁻¹ C†)⁻¹ (C β̂ − d)⟫`.
- **Subspace form.** If `ker X ≤ ker C` (each component of `C` is estimable) and `C b₀ = d`,
  then the increase is `‖P_K (y − X b₀)‖²` with `K = L ⊓ (X(ker C))ᗮ`, and `dim K` is the rank
  of `C`.

*Needs:* 1.1, 1.2; Mathlib `Submodule.norm_sq_eq_add_norm_sq_starProjection`,
`Submodule.starProjection_comp_starProjection_of_le`,
`Submodule.sup_orthogonal_inf_of_hasOrthogonalProjection`,
`Submodule.finrank_add_finrank_orthogonal`. (The multiplier, explicit and subspace forms are
proved here.)

**Checks.**

- `F = ℝ³`, `L` spanned by `(1, 1, 1)` and `(0, 1, 2)`, `L₀` by `(1, 1, 1)`, `y = (1, 1, 4)`:
  `P_{L₀} y = (2, 2, 2)`, `P_L y = (1/2, 2, 7/2)`, `RSS₀ = 6`, `RSS = 3/2`, the difference is
  `9/2`, and `R² = 3/4`.
- `L₀ = L`: `R² = 0` for every `y ∉ L`. The quotient is `0/0` for `y ∈ L₀`, which is why
  `y ∉ L₀` is assumed.
- Constraint: `X = id` on `ℝ²`, `y = (1, 3)`, `C b = b₁ − b₂`, `d = 0`. Then `bh = (1, 3)`,
  `u = (−1, 1)`, `w = −1` solve the two equations, the increase is `⟪w, C bh − d⟫ = 2`, and the
  constrained minimizer `(2, 2)` has `‖y − (2, 2)‖² = 2`. The explicit form gives
  `(−2)² / 2 = 2`.
- `C = 0` and `d ≠ 0`: no `b` satisfies the constraint, and no pair `(u, w)` exists, since
  `C u = C bh − d` reads `0 = −d`.

### Examples

- For the design `X(α, β) = (α + β xᵢ)ᵢ` of simple regression with `x = (0, 1, 2)` and
  `y = (1, 1, 4)`, the normal equations give `(α̂, β̂) = (1/2, 3/2)`; this is the first Check of
  1.4 read in coordinates.
- For a one-way layout with two groups and a redundant intercept, `X(m, a₁, a₂)ᵢ = m + a_{g i}`,
  the design has rank `2` in a parameter space of dimension `3`; the group difference
  `a₁ − a₂` and the group means `m + a₁`, `m + a₂` are estimable, and `m`, `a₁`, `a₂` alone are
  not.

### Dependencies

Mathlib only: orthogonal projections, adjoints and traces in finite-dimensional inner product
spaces. 1.2, 1.3 and 1.4 use 1.1; 1.4 also uses 1.2.

## Layer 2: second-order theory

Here `(Ω, P)` is a probability space and `Y = μ + ε` with `μ : F`.

### 2.1 Errors with a covariance operator

Define `IsCenteredWithCovariance ε S P` for `ε : Ω → F` and a linear map `S : F →ₗ[ℝ] F`: `ε`
belongs to `L²(P)`, `∫ ⟪u, ε⟫ ∂P = 0` for every `u`, and
`∫ ⟪u, ε⟫ ⟪v, ε⟫ ∂P = ⟪u, S v⟫` for all `u`, `v`.

- `S` is determined by `ε`, and it is symmetric and positive semidefinite:
  `⟪u, S u⟫ = ∫ ⟪u, ε⟫² ∂P ≥ 0`.
- `∫ ⟪u, Y⟫ ∂P = ⟪u, μ⟫`, the covariance of `⟪u, Y⟫` and `⟪v, Y⟫` is `⟪u, S v⟫`, and
  `Var ⟪u, Y⟫ = ⟪u, S u⟫`.
- For a linear map `B` from `F` to a finite-dimensional real inner product space, `B ∘ ε` has
  mean zero and covariance operator `B S B†`.
- **Agreement with Mathlib.** When `F` carries its Borel σ-algebra, the definition holds if and
  only if `ε ∈ L²(P)`, `∫ ε ∂P = 0`, and Mathlib's covariance form of the law of `ε` satisfies
  `covarianceBilin (P.map ε) u v = ⟪u, S v⟫` for all `u`, `v`.
- **Gaussian errors.** If `Z` has law `stdGaussian F` and `σ` is real, then `σ • Z` satisfies
  the definition with `S = σ² · id`.

*Needs:* Mathlib `MeasureTheory.MemLp`, `ProbabilityTheory.variance`,
`ProbabilityTheory.covariance`, `ProbabilityTheory.covarianceBilin_apply_eq_cov`,
`ProbabilityTheory.covarianceBilin_stdGaussian`, `ProbabilityTheory.integral_id_stdGaussian`,
`ProbabilityTheory.IsGaussian.memLp_two_id`. (Proved here.)

**Checks.**

- `F = ℝ` and `ε = ±1` with probability `1/2` each: white noise of variance `1` that is not
  Gaussian. Layer 2 applies to it and Layer 3 does not.
- `ε` uniform on the four points `(±1, 0)`, `(0, ±1)` of `ℝ²`: mean zero and `S = (1/2) · id`,
  although the two coordinates are dependent. White noise asks for no independence.
- `ε` constant equal to `(1, 0)`: the second-moment identity holds with `S` the projection onto
  the first axis, but the mean is not zero, so the definition fails. Without the mean-zero
  clause `S` would be a second-moment operator and `Var ⟪u, Y⟫ = ⟪u, S u⟫` would be false: the
  variance is `0` here.
- `S = 0` forces `ε = 0` almost everywhere, since `∫ ‖ε‖² ∂P = tr S`.

### 2.2 Means of quadratic forms

- **Quadratic forms** (`integral_inner_apply_add`). If `IsCenteredWithCovariance ε S P`, then
  for every linear `A : F →ₗ[ℝ] F` and every `μ : F`,
  `∫ ⟪μ + ε, A (μ + ε)⟫ ∂P = tr (A S) + ⟪μ, A μ⟫` (Shalizi, eq. (11.96), p. 198).
- For white noise of variance `σ²` and a subspace `K`:
  `∫ ‖P_K Y‖² ∂P = σ² dim K + ‖P_K μ‖²`.
- **The residual variance.** For white noise and `μ ∈ L`: `∫ RSS(Y) ∂P = σ² (n − p)` and
  `∫ ‖P_L Y − μ‖² ∂P = σ² p`. Hence, when `n > p`, `RSS/(n − p)` is an unbiased estimator of
  `σ²` (Shalizi, §16.1, p. 273, for a matrix of full column rank and Gaussian errors).

*Needs:* 2.1, 1.2; Mathlib `LinearMap.trace`, `LinearMap.IsProj.trace`.

**Checks.**

- `F = ℝ²`, `L` the line through `(1, 1)`, `μ = (m, m)`: `RSS = (Y₁ − Y₂)²/2` has mean
  `σ² = σ² (2 − 1)`.
- `A = id`: `∫ ‖Y‖² ∂P = n σ² + ‖μ‖²`.
- `p = n`: `RSS = 0` identically and `RSS/(n − p)` is `0/0`; no estimator of `σ²` is claimed.
- The divisor `n` in place of `n − p` gives mean `σ² (n − p)/n`, which is `σ²/2` in the first
  Check: biased. This is the maximum-likelihood variance of 3.7.

### 2.3 The Gauss–Markov theorem

For `a : F` the functional of the mean to be estimated is `μ ↦ ⟪a, μ⟫` on `L`. An affine
estimator `⟪b, Y⟫ + t` has mean `⟪a, μ⟫` for every `μ ∈ L` if and only if `t = 0` and
`b − a ∈ Lᗮ`; so the unbiased affine estimators are the `⟪b, Y⟫` with `b − a ∈ Lᗮ`, and the
least-squares estimator `⟪a, P_L Y⟫ = ⟪P_L a, Y⟫` is one of them.

- **Gauss–Markov** (`variance_inner_eq_variance_inner_starProjection_add`). If
  `IsCenteredWithCovariance ε (σ² · id) P`, `L` is a subspace, `b − a ∈ Lᗮ` and `μ : F`, then
  `Var ⟪b, Y⟫ = Var ⟪P_L a, Y⟫ + σ² ‖b − P_L a‖²` (Chua, §3.2, p. 40, and Shalizi, §21.3,
  pp. 363–364, for a matrix of full column rank, as an inequality; the identity is proved
  here).
- Hence the least-squares estimator has the least variance among the unbiased affine
  estimators, and an unbiased `⟪b, Y⟫` attains it if and only if `σ = 0` or `b = P_L a`.
- **Operator form.** For linear maps `A`, `B` from `F` to a finite-dimensional real inner
  product space with `B = A` on `L`:
  `B B† = (A P_L)(A P_L)† + (B − A P_L)(B − A P_L)†`. So the covariance operator of `B Y`
  exceeds that of `A P_L Y` by `σ² (B − A P_L)(B − A P_L)†`, which is positive semidefinite,
  and vanishes exactly when `σ = 0` or `B = A P_L`.
- **Design form.** For an estimable `c = X† a`, the least-squares estimator of `⟪c, β⟫` is
  `⟪c, b⟫` for any least-squares solution `b` (1.3); it is the best unbiased affine estimator
  of `⟪c, β⟫`. For estimable `c = X† a` and `c' = X† a'` the covariance of the two estimators
  is `σ² ⟪P_L a, P_L a'⟫ = σ² ⟪c, g⟫` for every `g` with `X† X g = c'`. If `X` is injective,
  `β̂` is unbiased with covariance operator `σ² (X† X)⁻¹` (Chua, §3.1, p. 39).
- If `c` is not estimable, no affine function of `Y` has mean `⟪c, β⟫` for every `β`.

*Needs:* 2.1, 1.3; Mathlib `Submodule.starProjection`, `ProbabilityTheory.variance`.

**Checks.**

- `F = ℝ²`, `L` the line through `(1, 1)`, `a = b = (1, 0)` (estimate the common mean by
  `Y₁`): `P_L a = (1/2, 1/2)`, the sample mean has variance `σ²/2`, `Y₁` has variance `σ²`,
  and the difference is `σ² ‖(1/2, −1/2)‖² = σ²/2`.
- `b = 0` has variance `0`, less than the least-squares variance, but `b − a = −a ∉ Lᗮ` in the
  previous Check: it is biased. Unbiasedness is used.
- `σ = 0`: every variance is `0`, so equality holds for every unbiased `b`; this is the first
  alternative in the equality case.
- `L = F`: the only unbiased `b` is `a`. `L = 0`: every `b` is unbiased for the zero
  functional and the best is `P_L a = 0`.

### 2.4 Aitken's theorem and generalized least squares

- **Aitken** (`exists_forall_variance_inner_eq_add`). If `IsCenteredWithCovariance ε S P`, `L`
  is a subspace and `a, μ : F`, there is `b₀ : F` with `b₀ − a ∈ Lᗮ` and `S b₀ ∈ L` such that
  every `b` with `b − a ∈ Lᗮ` satisfies
  `Var ⟪b, Y⟫ = Var ⟪b₀, Y⟫ + ⟪b − b₀, S (b − b₀)⟫`. No invertibility of `S` is assumed
  (Shalizi, §21.3, eqs. (21.19)–(21.26), pp. 363–364, for an invertible covariance matrix and
  a matrix of full column rank; the theorem is due to Aitken (1935), and the form for a
  singular `S` is proved here).
- An unbiased `⟪b, Y⟫` has least variance if and only if `S b ∈ L`. For `μ ∈ L`, two unbiased
  estimators of least variance are almost surely equal; and if `S` is injective the vector `b₀`
  is unique.
- **When least squares is best.** `⟪P_L a, Y⟫` has least variance among the unbiased
  estimators for every `a` if and only if `S` maps `L` into `L`.
- **Generalized least squares.** If `S` is invertible, let `Q` be the projection onto `L`
  along `S(Lᗮ)`; it is the orthogonal projection onto `L` for the inner product `⟪u, S⁻¹ v⟫`,
  `Q y` is the unique minimizer of `⟪y − m, S⁻¹ (y − m)⟫` over `m ∈ L`, `Q S = S Q†`, and
  `b₀ = Q† a`. If moreover `X` is injective, then `Q = X (X† S⁻¹ X)⁻¹ X† S⁻¹`, the estimator
  `(X† S⁻¹ X)⁻¹ X† S⁻¹ Y` is unbiased for `β` with covariance operator `(X† S⁻¹ X)⁻¹`, and it
  is the best unbiased affine estimator of every `⟪c, β⟫` (Shalizi, §21.6.1, pp. 376–377).

*Needs:* 2.1, 2.3. The existence of `b₀` is the attainment of the minimum of the positive
semidefinite quadratic function `b ↦ ⟪b, S b⟫` on the affine subspace `a + Lᗮ`, and `S b₀ ∈ L`
is its first-order condition.

**Checks.**

- `F = ℝ²`, `S = diag(1, 4)`, `L` the line through `(1, 1)`, `a = (1/2, 1/2)`:
  `b₀ = (4/5, 1/5)`, `S b₀ = (4/5, 4/5) ∈ L`, with variance `4/5`; the unweighted mean
  `b = (1/2, 1/2)` has variance `5/4`, and the gap `9/20` is `⟪b − b₀, S (b − b₀)⟫` for
  `b − b₀ = (−3/10, 3/10)`.
- `S = σ² · id`: the condition `S b₀ ∈ L` with `b₀ − a ∈ Lᗮ` gives `b₀ = P_L a` when `σ ≠ 0`,
  which is 2.3.
- Equicorrelated errors `S = (1 − ρ) · id + ρ · J` on `ℝⁿ`, with `J` the all-ones matrix, and
  `L` the constants: `S` maps `L` into `L`, so the sample mean is best although `S` is not a
  multiple of the identity. For `S = diag(1, 4)` it does not, and the first Check shows the
  sample mean is not best.
- Singular `S = diag(1, 0)`, `L` the line through `(1, 1)`, `a = (1/2, 1/2)`: `b₀ = (0, 1)`
  with `S b₀ = 0 ∈ L` and variance `0` (the second observation equals the mean exactly).
- `S = 0`: every unbiased `b` has variance `0`, so `b₀` is not unique; injectivity of `S` is
  used for uniqueness.

### Examples

- Weighted least squares is 2.4 with `S` diagonal in an orthonormal basis: the weights are
  the reciprocal variances, as in the first Check of 2.4.
- For the sample mean of `n` uncorrelated observations with common mean and variance `σ²`,
  2.2 gives `∫ ∑ (Yᵢ − Ȳ)² ∂P = σ² (n − 1)` and 2.3 says that `Ȳ` is the best unbiased affine
  estimator of the mean.

### Dependencies

Layer 1 (1.2 for 2.2, 1.3 for 2.3) and Mathlib's `MemLp`, variance, covariance and trace. 2.2,
2.3 and 2.4 use 2.1; 2.4 uses 2.3 for the comparison with least squares.

## Layer 3: exact Gaussian theory

In 3.2 to 3.7, `F` carries its Borel σ-algebra, `Z : Ω → F` has law `stdGaussian F` under `P`,
and `Y = μ + σ • Z` with `σ ≠ 0`.

### 3.1 Cochran's theorem: the algebraic form

- **Cochran, algebraic form** (`tfae_isIdempotentElem_of_sum_eq_one`). Let `V` be a
  finite-dimensional vector space over a field `K` of characteristic zero, and let `(Aᵢ)` be a
  finite family of endomorphisms of `V` with `∑ Aᵢ = id`. The following are equivalent: every
  `Aᵢ` is idempotent; `Aᵢ Aⱼ = 0` for all `i ≠ j`; `∑ rank Aᵢ = dim V`. (The theorem is due to
  Cochran (1934) for real symmetric matrices; proved here.)
- If moreover `V = F` and every `Aᵢ` is symmetric, then under these conditions the ranges
  `Kᵢ` of the `Aᵢ` are pairwise orthogonal, `Aᵢ = P_{Kᵢ}`, and `⟪x, Aᵢ x⟫ = ‖P_{Kᵢ} x‖²`.

Route: pairwise products zero gives `Aᵢ = Aᵢ ∑ⱼ Aⱼ = Aᵢ²`; idempotents have trace equal to
rank, so the ranks add up to `tr id` in `K`, hence in `ℕ` by characteristic zero; if the ranks
add up, the ranges form a direct sum decomposition of `V`, and comparing the two decompositions
`Aⱼ x = ∑ᵢ Aᵢ Aⱼ x` gives `Aᵢ Aⱼ = 0` and `Aⱼ² = Aⱼ`.

*Needs:* Mathlib `IsIdempotentElem`, `LinearMap.IsProj.trace`, `LinearMap.trace`,
`LinearMap.IsIdempotentElem.isSymmetric_iff_orthogonal_range`.

**Checks.**

- `A₁ = diag(1/2, 1)`, `A₂ = diag(1/2, 0)` on `ℝ²`: symmetric with sum `id`; `A₁` is not
  idempotent, `A₁ A₂ = diag(1/4, 0) ≠ 0`, and the ranks add up to `3 ≠ 2`. All three conditions
  fail together.
- `A₁ = [[1, 1], [0, 0]]`, `A₂ = [[0, −1], [0, 1]]`: sum `id`, both idempotent, both products
  zero, ranks `1 + 1 = 2`; the ranges, spanned by `(1, 0)` and `(−1, 1)`, are not orthogonal.
  Symmetry is used only in the second bullet.
- Over the field with two elements, three copies of the identity of a line sum to the
  identity and are idempotent, but their products are not zero and the ranks add up to `3`:
  characteristic zero is used.
- An empty family: `∑ Aᵢ = 0 = id` forces `V = 0`, and the three conditions hold.

### 3.2 Cochran's theorem: independent chi-squared laws

- **Cochran with a mean** (`hasLaw_pi_norm_sq_starProjection_add_stdGaussian`). Let `(Kᵢ)` be
  a finite family of pairwise orthogonal subspaces of `F`, not assumed to span, and `v : F`.
  Then the random vector `(‖P_{Kᵢ}(v + Z)‖²)ᵢ` has the product law of the
  `χ²(dim Kᵢ; ‖P_{Kᵢ} v‖²)`: the squared lengths are independent with these noncentral
  chi-squared laws (Chua, §3.3, Lemma (i), p. 44, and §3.8.1, Lemma, p. 50, for `v = 0` and
  two projections; the form with a mean is proved here).
- **Operator form.** If `(Aᵢ)` are symmetric endomorphisms of `F` with `∑ Aᵢ = id` satisfying
  the conditions of 3.1, the quadratic forms `⟪v + Z, Aᵢ (v + Z)⟫` are independent and the
  `i`-th has the law `χ²(rank Aᵢ; ⟪v, Aᵢ v⟫)`.
- **With a scale.** For a subspace `K`, `‖P_K Y‖²/σ²` has the law
  `χ²(dim K; ‖P_K μ‖²/σ²)`.

Route: `P_{Kᵢ}(v + Z) = P_{Kᵢ} v + P_{Kᵢ} Z`, and the `P_{Kᵢ} Z` are independent by Tau Ceti's
`HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian`, which gives the independence. For the
law of one term, take an orthonormal basis `(eⱼ)` of `Kᵢ`: the coordinates `⟪eⱼ, v + Z⟫` are
independent with laws `N(⟪eⱼ, v⟫, 1)` because `P_{Kᵢ} Z` is standard Gaussian on `Kᵢ`
(`HasLaw.orthogonalProjectionOnto_stdGaussian`, `stdGaussian_eq_map_pi_orthonormalBasis`), and
Tau Ceti's `iIndepFun.hasLaw_sum_sq_gaussianReal_noncentral` gives the law of the sum of their
squares.

*Needs:* 3.1 for the operator form; Tau Ceti `noncentralChiSquaredMeasure`,
`HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian`,
`HasLaw.orthogonalProjectionOnto_stdGaussian`,
`iIndepFun.hasLaw_sum_sq_gaussianReal_noncentral`; Mathlib `stdGaussian`,
`stdGaussian_eq_map_pi_orthonormalBasis`, `HasLaw`.

**Checks.**

- `F = ℝ`, `K = F`: `(v + Z)²` has the law `χ²(1; v²)`.
- `K = 0`: the squared length is `0` and `χ²(0; 0)` is the Dirac mass at `0`.
- The mean of `χ²(k; λ)` is `k + λ`, in agreement with 2.2 at `σ = 1`:
  `∫ ‖P_K (v + Z)‖² ∂P = dim K + ‖P_K v‖²`.
- The noncentrality is `‖P_K v‖²`, not `‖v‖²`: for `v ⊥ K` the law is the central `χ²(dim K)`
  whatever the length of `v`.
- `K₁` the line through `(1, 0)` and `K₂` the line through `(1, 1)` in `ℝ²` are not
  orthogonal, and `Z₁²` and `(Z₁ + Z₂)²/2` have covariance `1`: orthogonality is used.

### 3.3 Which quadratic forms are chi-squared

- **Characterization** (`hasLaw_inner_apply_chiSquared_iff`). For a symmetric
  `A : F →ₗ[ℝ] F` and `r : ℕ`: `⟪Z, A Z⟫` has the law `χ²(r)` if and only if `A` is idempotent
  of rank `r`. (The "if" part is Chua, §3.3, Lemma (i), p. 44; the converse is proved here.)

Route: in an orthonormal eigenbasis of `A` with eigenvalues `λⱼ`, `⟪Z, A Z⟫ = ∑ λⱼ ⟪eⱼ, Z⟫²`
with independent standard normal coordinates, so its moment generating function is
`∏ (1 − 2 t λⱼ)^(−1/2)` near `0` (Tau Ceti's `mgf_sum_mul_sq_pi_gaussianReal`), while that of
`χ²(r)` is `(1 − 2t)^(−r/2)` (`mgf_id_chiSquaredMeasure`). Equality near `0` forces the
nonzero `λⱼ` to be `r` ones, by comparing the derivatives of the logarithms at `0`:
`∑ λⱼ^m = r` for every `m ≥ 1`.

*Needs:* 3.2; Tau Ceti `chiSquaredMeasure`, `mgf_sum_mul_sq_pi_gaussianReal`,
`mgf_id_chiSquaredMeasure`; Mathlib `LinearMap.IsSymmetric.eigenvectorBasis`,
`stdGaussian_eq_map_pi_orthonormalBasis`.

**Checks.**

- `A = 2 P` with `P` a projection of rank `1`: `⟪Z, A Z⟫ = 2 Z₁²` has mean `2`, like `χ²(2)`,
  but variance `8 ≠ 4`; it is not chi-squared, and `A² = 2A ≠ A`.
- `A = P/2` with `P` a projection of rank `2`: mean `1`, like `χ²(1)`, but variance `1 ≠ 2`.
- `A = 0`, `r = 0`: the form is `0`, of law `χ²(0)`, and `A` is idempotent of rank `0`.

### 3.4 The fitted value, the residual and the estimator

For a subspace `L` and `μ ∈ L`:

- `P_L Y = μ + σ P_L Z` and `Y − P_L Y = σ P_{Lᗮ} Z`, and these two random vectors are
  independent;
- `RSS(Y)/σ²` has the law `χ²(n − p)`, where `n − p = dim Lᗮ`;
- for `a : F`, `⟪a, P_L Y⟫` has the Gaussian law `N(⟪a, μ⟫, σ² ‖P_L a‖²)` and is independent
  of `RSS(Y)`;
- if `L` is the range of an injective design `X` and `μ = X β`, then `β̂(Y)` has a Gaussian
  law on `E` (Mathlib's `IsGaussian`) with mean `β` and covariance
  `(c, c') ↦ σ² ⟪c, (X† X)⁻¹ c'⟫`, and `β̂(Y)` is independent of `RSS(Y)` (Chua, §3.3,
  Theorem, p. 44).

*Needs:* 1.2, 2.1, 2.3; Tau Ceti `HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian`,
`HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian`; Mathlib `IsGaussian`, `gaussianReal`,
`covarianceBilin`.

**Checks.**

- `p = n`: `RSS = 0` and `χ²(0)` is the Dirac mass at `0`.
- `F = ℝ²`, `L` the line through `(1, 1)`: `P_L Y = (Ȳ, Ȳ)`, `RSS = (Y₁ − Y₂)²/2`, and
  `RSS/σ²` has the law `χ²(1)`: `(Y₁ − Y₂)/(σ√2)` is standard normal.
- Independence fails for a non-Gaussian white noise: for the four-point error of the second
  Check of 2.1, `L` the first axis and `μ = (m, 0)`, the fitted value is `(m + ε₁, 0)` and
  `RSS = ε₂² = 1 − ε₁²`, which is not constant; the two are uncorrelated and dependent.

### 3.5 The studentized functional

- **Noncentral `t`** (`hasLaw_noncentralT_studentized`). Let `M` be a subspace of `F` with
  `ν = dim M ≥ 1`, let `μ ∈ Mᗮ`, let `a ∈ Mᗮ` with `a ≠ 0`, and let `t₀` be real. Then
  `T = (⟪a, Y⟫ − t₀) / (‖a‖ √(‖P_M Y‖²/ν))` has the law `t(ν; δ)` with
  `δ = (⟪a, μ⟫ − t₀)/(|σ| ‖a‖)` (Chua, §3.5, p. 47, for a coefficient in a full-rank model and
  `δ = 0`; the noncentral form is proved here).
- For `t₀ = ⟪a, μ⟫` the law of `T` is Student's law with `ν` degrees of freedom.
- **In a linear model.** Take `M = Lᗮ`, so `ν = n − p ≥ 1`, and `s² = RSS/(n − p)`. For
  `a' : F` with `P_L a' ≠ 0`, the theorem with `a = P_L a'` gives the law of
  `(⟪a', P_L Y⟫ − t₀)/(s ‖P_L a'‖)`; for an estimable `c = X† a'` this is the studentized
  least-squares estimator of `⟪c, β⟫`, and `‖P_L a'‖² = ⟪c, (X† X)⁻¹ c⟫` when `X` is
  injective.
- **Confidence intervals.** For `q ≥ 0`, the interval with endpoints
  `⟪a', P_L Y⟫ ± q s ‖P_L a'‖` contains `⟪a', μ⟫` with probability exactly the mass that
  Student's law with `n − p` degrees of freedom gives to `[−q, q]`. That mass is `1 − α` when
  the distribution function at `q` is `1 − α/2`, since the law is symmetric and has a density.
- **Prediction.** Let `(Z, Z₀)` be standard Gaussian in the `L²` product `F × ℝ`,
  `Y = μ + σ Z` with `μ ∈ L`, and `Y₀ = ⟪a', μ⟫ + σ Z₀`. If `n > p`, then
  `(Y₀ − ⟪a', P_L Y⟫) / (s √(1 + ‖P_L a'‖²))` has Student's law with `n − p` degrees of
  freedom: this is the first bullet in `F × ℝ` with `M = Lᗮ × 0` and the vector
  `(−P_L a', 1)` (Chua, §3.7, pp. 48–49).

Route for the first bullet: `⟪a, Y⟫ − t₀ = ⟪a, μ⟫ − t₀ + σ ⟪a, Z⟫` and
`‖P_M Y‖² = σ² ‖P_M Z‖²` because `μ ⊥ M`; `⟪a, Z⟫/‖a‖` is standard normal, also after
multiplication by the sign of `σ`, and it is independent of `‖P_M Z‖²`, of law `χ²(ν)`,
because `a ⊥ M`; conclude by Tau Ceti's `hasLaw_noncentralT_of_gaussian_chiSquared`.

*Needs:* 1.2, 1.3, 3.2; Tau Ceti `noncentralTMeasure`, `hasLaw_noncentralT_of_gaussian_chiSquared`,
`noncentralTMeasure_zero_noncentrality`, `studentTMeasure`, `studentTMeasure_map_neg`,
`HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian`,
`HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian`.

**Checks.**

- `F = ℝ²`, `L` the line through `(1, 1)`, `M = Lᗮ`, `a = (1/2, 1/2)`, `μ = (m, m)`,
  `t₀ = m`: `T = 2 (Ȳ − m)/|Y₁ − Y₂|`, of law `t(1)`, the Cauchy law.
- `a ∈ Mᗮ` is used: for `F = M = ℝ`, `a = 1`, `μ = 0`, `t₀ = 0`, the statistic is the sign of
  `Z`, which takes only the values `±1`.
- `|σ|` and not `σ`: for `σ < 0` and `δ ≠ 0` the law with `σ` in place of `|σ|` has
  noncentrality `−δ`, a different law.
- `ν = 0` (in a linear model, `n = p`): the statistic divides by `0` and `t(0; δ)` is the zero
  measure; the hypothesis `ν ≥ 1` excludes it.

### 3.6 The variance ratio and the `F`-test

- **Noncentral `F`** (`hasLaw_noncentralF_variance_ratio`). Let `K` and `M` be orthogonal
  subspaces of `F` with `k = dim K ≥ 1` and `ν = dim M ≥ 1`, let `μ ∈ Mᗮ`, and let `m₀ : F`.
  Then `(‖P_K (Y − m₀)‖²/k) / (‖P_M Y‖²/ν)` has the law `F(k, ν; λ)` with
  `λ = ‖P_K (μ − m₀)‖²/σ²` (Chua, §3.8.1, pp. 50–52, for `m₀ = 0`, a full-rank model and
  `λ = 0`; the noncentral form is proved here).
- If `P_K (μ − m₀) = 0`, the law of the ratio is the Fisher–Snedecor law with degrees `k` and
  `ν`.
- **Nested models.** For `L₀ ≤ L` with `q = dim L − dim L₀ ≥ 1`, `n > p`, `μ ∈ L` and
  `m₀ ∈ L`, take `K = L ⊓ L₀ᗮ` and `M = Lᗮ`. With `RSS₀` the squared distance from `Y − m₀`
  to `L₀`, the statistic is `((RSS₀ − RSS)/q) / (RSS/(n − p))` by 1.4. Under the hypothesis
  `μ − m₀ ∈ L₀` its law is the Fisher–Snedecor law with degrees `q` and `n − p`; in general
  `λ` is the squared distance from `μ − m₀` to `L₀`, divided by `σ²`.
- **Linear hypotheses.** For a design `X`, a constraint `C β = d` with `ker X ≤ ker C` and
  `C b₀ = d`, take `L₀ = X(ker C)` and `m₀ = X b₀`; then `q` is the rank of `C` and the
  numerator is the increase of the residual sum of squares of 1.4, divided by `q`. If `X` is
  injective and `C` is surjective,
  `λ = ⟪C β − d, (C (X† X)⁻¹ C†)⁻¹ (C β − d)⟫/σ²`.
- **One degree of freedom.** If `K` is the line through `a ≠ 0`, then
  `‖P_K (y − m₀)‖² = ⟪a, y − m₀⟫²/‖a‖²`, so the ratio is the square of the statistic `T` of 3.5
  with `t₀ = ⟪a, m₀⟫`, and `λ = δ²`; the two laws agree by Tau Ceti's
  `noncentralTMeasure_map_sq` (Chua, §3.8.2, p. 53, for the slope of a simple regression).
- The theorem allows `M` strictly smaller than `Lᗮ`: a denominator computed from part of the
  residual space, as in a test of lack of fit against replicated observations.

Route: apply 3.2 to the two orthogonal subspaces `K`, `M` and the vector
`P_K (μ − m₀)/σ`, whose projection onto `M` is zero; then
`‖P_K (Y − m₀)‖²/σ²` and `‖P_M Y‖²/σ²` are independent with laws `χ²(k; λ)` and `χ²(ν)`, and
Tau Ceti's `hasLaw_noncentralF_of_noncentralChiSquared` gives the law of the ratio.

*Needs:* 1.4, 3.2, and 3.5 for the case of one degree of freedom; Tau Ceti
`noncentralFMeasure`,
`hasLaw_noncentralF_of_noncentralChiSquared`, `noncentralFMeasure_zero_noncentrality`,
`fisherSnedecorMeasure`, `noncentralTMeasure_map_sq`.

**Checks.**

- First Check of 1.4 (`n = 3`, `p = 2`, `q = 1`): the statistic is `(9/2)/(3/2) = 3`. The
  slope statistic of 3.5 is `(3/2)/√((3/2)/2) = √3`, with square `3`.
- `μ ∈ Mᗮ` is used: if `μ` has a component in `M`, the denominator has a noncentral
  chi-squared law and the ratio is not `F(k, ν; λ)`. For a linear model this is the
  misspecified case `μ ∉ L`.
- `K = 0` (`q = 0`, the hypothesis `L₀ = L`) and `M = 0` (`n = p`) are excluded: the statistic
  contains `0/0`, and the `F` measure with a degree `0` is the zero measure.
- `m₀` does not appear in the denominator: replacing `‖P_M Y‖²` by `‖P_M (Y − m₀)‖²` changes
  the statistic unless `m₀ ⊥ M`.

### 3.7 The likelihood and the likelihood ratio

Define `gaussianLikelihood m v y = (2πv)^(−n/2) exp(−‖y − m‖²/(2v))` for `m, y : F` and real
`v`, with `n = dim F`.

- **Density** (`hasLaw_add_smul_stdGaussian_withDensity`). For `σ ≠ 0` and `μ : F`, the law of
  `μ + σ • Z` is the measure with density `gaussianLikelihood μ σ²` with respect to the volume
  of `F`.
- **Maximum likelihood** (`isMaxOn_gaussianLikelihood`). For a subspace `L` and `y ∉ L`, the
  function `(m, v) ↦ gaussianLikelihood m v y` on `{(m, v) | m ∈ L, v > 0}` is maximal at
  `(P_L y, RSS(y)/n)` (Chua, §3.3, pp. 43–44).
- The maximizer of the previous bullet is unique, and the maximum is
  `(2πe · RSS(y)/n)^(−n/2)`.
- For `y ∈ L` and `n ≥ 1` the likelihood is unbounded on that set (take `m = y` and `v → 0`),
  which is why `y ∉ L` is assumed.
- **Likelihood ratio.** Let `L₀ ≤ L`, `m₀ ∈ L`, `q = dim L − dim L₀ ≥ 1`, `n > p`, and
  `y ∉ L`. The ratio of the maximum of the likelihood over `m ∈ m₀ + L₀`, `v > 0` to its
  maximum over `m ∈ L`, `v > 0` is `(RSS/RSS₀)^(n/2) = (1 + q f/(n − p))^(−n/2)`, where `f` is
  the statistic of 3.6 at `y`. It is a strictly decreasing function of `f`, so the tests that
  reject for a small likelihood ratio are the tests that reject for a large `f`
  (Chua, §3.8.1, p. 51).

*Needs:* 1.4, 3.6; Tau Ceti `stdGaussian_eq_withDensity_norm`; Mathlib
`measureSpaceOfInnerProductSpace`, `Submodule.starProjection_minimal`.

**Checks.**

- `n = 1`: `gaussianLikelihood 0 1 0 = (2π)^(−1/2) ≈ 0.3989`, the standard normal density at
  `0`, and `gaussianLikelihood 0 4 0 = (8π)^(−1/2) ≈ 0.1995`, the density at `0` of the normal
  law with variance `4`; the second argument is a variance, not a standard deviation.
- `n = 1`, `L = 0`, `y = 2`: the maximum over `v > 0` is at `v = 4 = RSS/n`, with value
  `(8πe)^(−1/2) ≈ 0.1210`.
- The maximum-likelihood variance `RSS/n` has mean `σ² (n − p)/n` by 2.2; it is not the
  unbiased `RSS/(n − p)`.
- `n = 0`: `F = 0`, every `y` lies in `L`, the likelihood is `1`, and the law of `Y` is the
  Dirac mass, which is the volume of `F`.

### Examples

- **A Gaussian sample.** For `F = ℝⁿ` with `n ≥ 2` and `L` the constants, 3.4 and 3.5 give
  that `Ȳ` and `∑ (Yᵢ − Ȳ)²` are independent, that the second divided by `σ²` has the law
  `χ²(n − 1)`, and that `√n (Ȳ − m)/s` has Student's law with `n − 1` degrees of freedom.
- **A single coefficient.** For an injective design and `c` a basis vector of `E`, 3.5 gives
  the `t` statistic of one coefficient, and 3.6 with `C = ⟪c, ·⟫` gives the `F` statistic of
  the hypothesis that it vanishes; the second is the square of the first.
- **Power.** The noncentrality of 3.6 is the squared distance of the mean from the hypothesis
  divided by `σ²`. At distance `0` the law is the central one, so the test that rejects when
  the statistic exceeds `c` has size equal to the mass that the Fisher–Snedecor law with
  degrees `q` and `n − p` gives to `(c, ∞)`.

### Dependencies

Layer 1 (1.2, 1.3, 1.4), Layer 2 (2.1, 2.3), and Tau Ceti's Gaussian projection laws and
chi-squared, noncentral chi-squared, Student, Fisher–Snedecor, noncentral `t` and noncentral
`F` laws (see the supplier contracts). 3.1 uses Mathlib only; 3.2 uses 3.1 for its operator
form; 3.3, 3.5 and 3.6 use 3.2; 3.4 uses 1.2, 2.1 and 2.3; 3.5 uses 1.2 and 1.3 for its reading
in a linear model; 3.6 uses 1.4, and 3.5 for the case of one degree of freedom; 3.7 uses 1.4
and 3.6.

## Layer 4: classical layouts

Here `ι` is a finite type of observations, `F = EuclideanSpace ℝ ι`, and `Z` has law
`stdGaussian (EuclideanSpace ℝ ι)`; equivalently the coordinates `Zᵢ` are independent standard
normal variables. Observations are `Yᵢ = μᵢ + σ Zᵢ` with `σ ≠ 0`, and `n` is the number of
observations.

### 4.1 One-way analysis of variance

Let `g : ι → G` assign a group to each observation; `G` is any type with decidable equality,
and groups may be empty. Let `k` be the number of nonempty groups, the cardinality of the image
of `g`. Define

- `groupMean g y j`, the mean of the `yᵢ` with `g i = j` (the sum divided by the number of such
  `i`);
- `withinSS g y = ∑ᵢ (yᵢ − groupMean g y (g i))²`;
- `betweenSS g y = ∑ᵢ (groupMean g y (g i) − ȳ)²`, with `ȳ` the mean of all the `yᵢ`.

Targets:

- The vectors constant on groups form a subspace `L` of dimension `k`, with
  `(P_L y)ᵢ = groupMean g y (g i)`; so `withinSS g y = RSS(y)`, and for `n ≥ 1`
  `betweenSS g y = ‖P_L y − P_{L₀} y‖²` with `L₀` the constants. Hence
  `∑ᵢ (yᵢ − ȳ)² = betweenSS g y + withinSS g y`, and `betweenSS g y = ∑ⱼ nⱼ (ȳⱼ − ȳ)²` over
  the nonempty groups, with `nⱼ` the size and `ȳⱼ` the mean of group `j`.
- **The `F` law** (`hasLaw_noncentralF_oneWay`). Let `m : G → ℝ`, `μᵢ = m (g i)`, `k ≥ 2` and
  `k < n`. Then `(betweenSS g Y/(k − 1)) / (withinSS g Y/(n − k))` has the law
  `F(k − 1, n − k; λ)` with `λ = betweenSS g μ/σ² = ∑ᵢ (m (g i) − m̄)²/σ²`, where `m̄` is the
  mean of the `m (g i)` over the observations (Chua, §3.8.3, pp. 53–54, for groups of equal
  size and `λ = 0`; the general form is proved here).
- If `m` is constant on the nonempty groups, the law of the previous bullet is the
  Fisher–Snedecor law with degrees `k − 1` and `n − k`.

*Needs:* 1.4, 3.6; Mathlib `EuclideanSpace`, `map_pi_eq_stdGaussian`.

**Checks.**

- Groups `{1, 3}` and `{5}`: group means `2` and `5`, grand mean `3`, `betweenSS = 6`,
  `withinSS = 2`, total `8`, and the statistic is `(6/1)/(2/1) = 3`.
- The degrees use the number `k` of nonempty groups, not the cardinality of `G`: with a third,
  empty group in the previous Check the statistic and its law are unchanged.
- The noncentrality uses the mean over observations: for group sizes `3` and `1` with means
  `0` and `4`, `m̄ = 1` and `λ σ² = 3·1 + 9 = 12`; the unweighted mean `2` of the two group
  means would give `16`.
- `k = n` (every nonempty group a singleton): `withinSS = 0` and the statistic divides by `0`;
  excluded by `k < n`. `k = 1`: `betweenSS = 0` and the numerator is `0/0`; excluded by
  `k ≥ 2`.

### 4.2 The two-sample `t` statistic

Let exactly two groups be nonempty, of sizes `n₁, n₂ ≥ 1` with `n₁ + n₂ ≥ 3`, with group means
`m₁`, `m₂` of the model and sample means `Ȳ₁`, `Ȳ₂`, and put
`s² = withinSS g Y/(n₁ + n₂ − 2)`, the pooled variance.

- `T = (Ȳ₁ − Ȳ₂) / (s √(1/n₁ + 1/n₂))` has the law `t(n₁ + n₂ − 2; δ)` with
  `δ = (m₁ − m₂)/(|σ| √(1/n₁ + 1/n₂))`; for `m₁ = m₂` it is Student's law with `n₁ + n₂ − 2`
  degrees of freedom. This is 3.5 with `M = Lᗮ` and the vector `a` equal to `1/n₁` on the
  first group and `−1/n₂` on the second, which lies in `L` and has `‖a‖² = 1/n₁ + 1/n₂`.
- `T²` is the statistic of 4.1.

*Needs:* 3.5, 3.6, 4.1. (Proved here.)

**Checks.**

- Groups `{1, 3}` and `{5}`: `Ȳ₁ − Ȳ₂ = −3`, `s² = 2`, `1/n₁ + 1/n₂ = 3/2`, so `T = −√3` and
  `T² = 3`, the statistic of the first Check of 4.1.
- `n₁ = n₂ = 1`: `withinSS = 0` and `s² = 0/0`; excluded by `n₁ + n₂ ≥ 3`.

### 4.3 Simple linear regression

Let `x : ι → ℝ` be not constant, `x̄` its mean and `Sxx = ∑ (xᵢ − x̄)² > 0`, and let
`μᵢ = α + β xᵢ`. The design `(α, β) ↦ (α + β xᵢ)ᵢ` is injective exactly because `x` is not
constant, so `p = 2`.

- The least-squares solution is `β̂ = ∑ (xᵢ − x̄)(yᵢ − ȳ)/Sxx` and `α̂ = ȳ − β̂ x̄`, and
  `RSS = ∑ (yᵢ − ȳ)² − β̂² Sxx`; the coefficient of determination of 1.4 relative to the
  constants is the squared sample correlation of `x` and `y` when `y` is not constant.
- For white noise of variance `σ²` (2.1): `Var β̂ = σ²/Sxx`, `Var α̂ = σ² (1/n + x̄²/Sxx)`, the
  covariance of `α̂` and `β̂` is `−σ² x̄/Sxx`, and `Var (α̂ + β̂ x₀) = σ² (1/n + (x₀ − x̄)²/Sxx)`
  (Chua, §3.2, pp. 39–40, in the centred parametrization `a' + b (x − x̄)`).
- For Gaussian errors and `n ≥ 3`, with `s² = RSS/(n − 2)`:
  `(β̂ − β) √Sxx / s`,
  `(α̂ + β̂ x₀ − α − β x₀) / (s √(1/n + (x₀ − x̄)²/Sxx))` and, for a new observation
  `Y₀ = α + β x₀ + σ Z₀` with `Z₀` standard normal and independent of `Z`,
  `(Y₀ − α̂ − β̂ x₀) / (s √(1 + 1/n + (x₀ − x̄)²/Sxx))` each have Student's law with `n − 2`
  degrees of freedom (Chua, §3.6, p. 47, and §3.7, pp. 48–49).

*Needs:* 1.2, 1.4, 2.3, 3.5.

**Checks.**

- `x = (0, 1, 2)`, `y = (1, 1, 4)`: `β̂ = 3/2`, `α̂ = 1/2`, `RSS = 3/2`, `R² = 3/4`,
  `Var β̂ = σ²/2` and `Var α̂ = 5σ²/6`.
- `x` constant: the design has rank `1`, the slope is not estimable, and `α + β x₀` is
  estimable only at the common value `x₀` of `x`, where it is the mean.
- The interval for the mean response is too short for a new observation: its half-width has
  `1/n + (x₀ − x̄)²/Sxx` under the root where the prediction interval has
  `1 + 1/n + (x₀ − x̄)²/Sxx`.

### 4.4 The balanced two-way additive layout

Let `ι = I × J × R` with `I`, `J`, `R` finite and nonempty, of cardinalities `a`, `b`, `r` (a
balanced layout with `r` observations per cell), `n = a b r`, and `μ_{ijl} = αᵢ + βⱼ`. Write
`ȳ_{i··}`, `ȳ_{·j·}` and `ȳ` for the row, column and grand means.

- The additive mean vectors form a subspace `L` of dimension `a + b − 1`. With `L₀` the
  constants, `K_A` the vectors depending on `i` only with sum zero and `K_B` the vectors
  depending on `j` only with sum zero, the subspaces `L₀`, `K_A`, `K_B` are pairwise
  orthogonal with sum `L`, of dimensions `1`, `a − 1`, `b − 1`, and `dim Lᗮ = n − a − b + 1`.
- `‖P_{K_A} y‖² = b r ∑ᵢ (ȳ_{i··} − ȳ)²`, `‖P_{K_B} y‖² = a r ∑ⱼ (ȳ_{·j·} − ȳ)²`,
  `RSS = ∑ (y_{ijl} − ȳ_{i··} − ȳ_{·j·} + ȳ)²`, and the total `∑ (y_{ijl} − ȳ)²` is the sum of
  the three.
- For Gaussian errors, `a ≥ 2` and `n − a − b + 1 ≥ 1`: the three sums of squares are
  independent, and `(‖P_{K_A} Y‖²/(a − 1)) / (RSS/(n − a − b + 1))` has the law
  `F(a − 1, n − a − b + 1; λ)` with `λ = b r ∑ᵢ (αᵢ − ᾱ)²/σ²`; symmetrically for the columns.

*Needs:* 1.4, 3.2, 3.6. (Proved here.)

**Checks.**

- `a = b = 2`, `r = 1`, `y = [[1, 2], [3, 6]]`: grand mean `3`, row means `3/2`, `9/2`, column
  means `2`, `4`; the sums of squares are `9` (rows), `4` (columns) and `1` (residual), with
  total `14`; the row statistic is `(9/1)/(1/1) = 9` with degrees `1` and `1`.
- `b = 1` and `r = 1`: `n − a − b + 1 = 0`, the model fits exactly and the statistic is
  excluded.
- Balance is used: for the four observations in cells `(1, 1)`, `(1, 1)`, `(1, 2)`, `(2, 2)`
  the row and column subspaces, after removing constants, are not orthogonal, and the
  decomposition into three independent sums of squares fails.

### Examples

- With `k = 2`, 4.1 and 4.2 are the same test: the `F` statistic is the square of the pooled
  `t` statistic, as in the Checks.
- A simple regression on a two-valued `x` is the two-sample layout: `β̂` is the difference of
  the two group means divided by the difference of the two values of `x`.

### Dependencies

Layers 1 to 3: 4.1 uses 1.4 and 3.6; 4.2 uses 3.5, 3.6 and 4.1; 4.3 uses 1.2, 1.4, 2.3 and
3.5; 4.4 uses 1.4, 3.2 and 3.6. Mathlib's `EuclideanSpace` and `map_pi_eq_stdGaussian` identify
the standard Gaussian vector with independent standard normal coordinates.

## Downstream consumers

- Penalized and high-dimensional regression in the Gaussian sequence and regression models
  use the projections, the residual chi-squared law and the noncentrality formulas of
  Layers 1 and 3.
- Simultaneous inference for all contrasts in a linear model applies Scheffé's intervals to
  `L = range X` and reads them, through 1.3, as intervals for every estimable functional.
- Large-sample regression theory with non-Gaussian errors compares its limits with the exact
  laws of Layer 3.

## Scope and ownership

**Owned here.** Least-squares solutions for a design of any rank, the hat operator, estimable
functionals, the sums of squares of nested models and of linear constraints (Layer 1); errors
with a covariance operator, means of quadratic forms, the Gauss–Markov and Aitken theorems
(Layer 2); Cochran's theorem in its algebraic and distributional forms with a mean, the
characterization of chi-squared quadratic forms, the laws of the fitted value, the residual sum
of squares, the studentized functional and the variance ratio with their noncentrality
parameters, and the Gaussian likelihood of the model (Layer 3); one-way analysis of variance,
the two-sample `t` statistic, simple linear regression and the balanced two-way additive
layout (Layer 4).

**Not owned here.**

- The distributions: the chi-squared, Student and Fisher–Snedecor laws and their
  representations by Gaussian squares and ratios (StandardDistributions, 4.1 and 4.2), the
  noncentral chi-squared, `t` and `F` laws (StandardDistributions, 10.5 and 10.6), all already
  in the library as the Tau Ceti declarations listed in the supplier contracts below, and the
  projection laws of a standard Gaussian vector (Tau Ceti,
  `TauCeti/Probability/Distributions/Gaussian/Projection.lean`). The central case `v = 0` of
  3.2 is already in the library as `HasLaw.pi_norm_sq_orthogonalProjectionOnto_stdGaussian`,
  and so is the noncentral law of the squared norm of the whole vector in coordinates,
  `HasLaw.norm_sq_multivariateGaussian`
  (`TauCeti/Probability/Distributions/NoncentralChiSquared/Gaussian.lean`, for a Gaussian
  vector with identity covariance in `EuclideanSpace ℝ ι`); 3.2 above adds the mean to the
  first and the subspaces and their joint independence to the second.
- The mean of a centred quadratic form in coordinates is already in the library:
  `TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix_map`
  (`TauCeti/Probability/Moments/Covariance.lean`) gives, for a square-integrable random vector
  `X` in `EuclideanSpace ℝ ι` and a matrix `B`, the mean of `⟪B (X − E X), X − E X⟫` as the
  trace of `B` times the covariance matrix. 2.2 above is the statement in a finite-dimensional
  inner product space, with the mean term `⟪μ, A μ⟫`. The moment generating function of a
  quadratic form in a standard Gaussian vector of `EuclideanSpace ℝ ι`, in terms of the
  eigenvalues of its matrix, is also in the library
  (`TauCeti/Probability/Distributions/Gaussian/QuadraticForm.lean`); 3.3 above is the
  characterization of the chi-squared forms, which that file does not state.
- Student's theorem for a Gaussian sample is stated by MathematicalStatisticsFoundations, 5.2
  (`gaussian_sample_mean_residual_laws`); it is the case of 3.4 and 3.5 above in which `L` is
  the line of constants, and it is not restated.
- The Gaussian negative log-likelihood of a sample with an unrestricted mean vector and
  covariance matrix, and its minimizer (the sample mean and the scatter matrix divided by the
  sample size), are stated by MathematicalStatisticsFoundations, 9.5. 3.7 above is a different
  model: one observation vector with covariance `v · id`, `v` a scalar, and mean restricted to
  a subspace.
- Scheffé's simultaneous intervals are stated by MathematicalStatisticsFoundations, 7.4, for a
  mean in a subspace of `EuclideanSpace ℝ (Fin n)`, which is the model of Layer 3 above. They
  are not restated. Bonferroni, Tukey and Holm procedures and the studentized range law are
  outside this roadmap.
- Gaussian quadratic forms in coordinates, `xᵀ S⁻¹ x` under `N(m, S)` on `EuclideanSpace`, are
  stated by MathematicalStatisticsAsymptotic, 1.3; 3.2 above is the coordinate-free statement
  for projections of a shifted standard Gaussian vector, and 3.3 above is a converse that 1.3
  there does not state. Regression with non-Gaussian errors in the limit, including
  least squares as an M-estimator, is MathematicalStatisticsAsymptotic, 9.6.
- The lasso, ridge regression, restricted eigenvalue conditions and model selection in the
  Gaussian regression model are MathematicalStatisticsHighDimensional, Layers 3 and 4. This
  roadmap has no penalty and no data-dependent choice of model.
- Optimality of the `t` and `F` tests (uniformly most powerful unbiased or invariant tests) is
  outside this roadmap; the general theory of such tests is
  MathematicalStatisticsFoundations, Layer 6.
- Outside this roadmap altogether: random and mixed effects and variance components;
  generalized linear models; robust and heteroscedasticity-consistent covariance estimation;
  estimated covariance operators in generalized least squares; Bayesian linear regression;
  optimal design; unbalanced or interaction layouts beyond 4.1.

## Exact supplier contracts

### From Mathlib

- `Submodule.starProjection` with `Submodule.starProjection_minimal`
  (`‖y − P_U y‖ = ⨅ x : U, ‖y − x‖`), `Submodule.norm_eq_iInf_iff_real_inner_eq_zero` (for
  `v ∈ K`: `v` is nearest to `u` in `K` iff `u − v ⊥ K`),
  `Submodule.starProjection_isSymmetric`, `Submodule.inner_starProjection_left_eq_right`,
  `Submodule.norm_sq_eq_add_norm_sq_starProjection`,
  `Submodule.starProjection_comp_starProjection_of_le`,
  `Submodule.sup_orthogonal_inf_of_hasOrthogonalProjection` (`K₁ ≤ K₂` gives
  `K₁ ⊔ K₁ᗮ ⊓ K₂ = K₂`) and `Submodule.finrank_add_finrank_orthogonal`
  (`Mathlib/Analysis/InnerProductSpace/Projection/`).
- `LinearMap.adjoint`, `LinearMap.adjoint_inner_left` (`⟪A† y, x⟫ = ⟪y, A x⟫`),
  `LinearMap.orthogonal_ker` (`(ker A)ᗮ = range A†`, both spaces finite-dimensional)
  (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean`);
  `LinearMap.IsSymmetric.eigenvectorBasis` (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean`);
  `LinearMap.IsIdempotentElem.isSymmetric_iff_orthogonal_range`
  (`Mathlib/Analysis/InnerProductSpace/Symmetric.lean`).
- `LinearMap.trace` and `LinearMap.IsProj.trace` (a projection onto `p` with free
  finite-dimensional range and kernel has trace `finrank p`)
  (`Mathlib/LinearAlgebra/Trace.lean`); `IsIdempotentElem`.
- `MeasureTheory.MemLp`, `ProbabilityTheory.variance`, `ProbabilityTheory.covariance`,
  `ProbabilityTheory.covarianceBilin` and `ProbabilityTheory.covarianceBilin_apply_eq_cov` (for
  a finite measure `μ` with `MemLp id 2 μ`, `covarianceBilin μ x y` is the covariance of
  `⟪x, ·⟫` and `⟪y, ·⟫`) (`Mathlib/Probability/Moments/`).
- `ProbabilityTheory.HasLaw` (`Mathlib/Probability/HasLaw.lean`); `gaussianReal`;
  `ProbabilityTheory.stdGaussian`, `integral_id_stdGaussian`, `covarianceBilin_stdGaussian`
  (`= innerSL ℝ`), `stdGaussian_eq_map_pi_orthonormalBasis` (the coordinates of a standard
  Gaussian vector in any orthonormal basis are independent standard normal) and
  `map_pi_eq_stdGaussian` (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`);
  `ProbabilityTheory.IsGaussian` and `IsGaussian.memLp_two_id`
  (`Mathlib/Probability/Distributions/Gaussian/`).
- `measureSpaceOfInnerProductSpace`, the volume of a finite-dimensional real inner product
  space; `EuclideanSpace`.

### From Tau Ceti

All in `TauCeti/Probability/Distributions/`; `F` is a finite-dimensional real inner product
space with its Borel σ-algebra.

- `TauCeti.Probability.chiSquaredMeasure k` (`ChiSquared/Basic.lean`): Dirac at `0` for
  `k = 0`, a gamma law for `k > 0`; `mgf_id_chiSquaredMeasure`: for `k ≥ 0` and `t < 1/2` its
  moment generating function at `t` is `(1 − 2t)^(−k/2)`.
- `TauCeti.Probability.noncentralChiSquaredMeasure k l` (`NoncentralChiSquared/Basic.lean`),
  `l : ℝ≥0`; `iIndepFun.hasLaw_sum_sq_gaussianReal_noncentral`
  (`NoncentralChiSquared/Gaussian.lean`): for a finite independent family with `Xᵢ` of law
  `gaussianReal (mᵢ) 1`, `∑ Xᵢ²` has the law with degree the cardinality of the family and
  noncentrality `∑ ‖mᵢ‖₊²`.
- `ProbabilityTheory.HasLaw.orthogonalProjectionOnto_stdGaussian`,
  `HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian` and
  `HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian` (`Gaussian/Projection.lean`): if
  `X` has law `stdGaussian F`, then for a subspace `K` the projection of `X` onto `K` has law
  `stdGaussian K` and its squared norm has law `chiSquaredMeasure (finrank ℝ K)`; for a family
  of pairwise orthogonal subspaces, of any cardinality and not assumed to span, the
  projections are independent.
- `TauCeti.Probability.mgf_sum_mul_sq_pi_gaussianReal` (`Gaussian/ChiSquared.lean`): if
  `2 t wⱼ < 1` for all `j`, the moment generating function of `∑ wⱼ cⱼ²` under independent
  standard normal `cⱼ` is `∏ (1 − 2 t wⱼ)^(−1/2)` at `t`.
- `TauCeti.Probability.stdGaussian_eq_withDensity_norm` (`Gaussian/Density.lean`):
  `stdGaussian F` has density `(2π)^(−dim F/2) exp(−‖x‖²/2)` with respect to the volume.
- `TauCeti.Probability.studentTMeasure` and `studentTMeasure_map_neg` (`StudentT/Basic.lean`):
  a measure with a density with respect to Lebesgue measure, invariant under `x ↦ −x`.
- `TauCeti.Probability.noncentralTMeasure ν δ`, `noncentralTMeasure_zero_noncentrality`
  (`δ = 0` gives `studentTMeasure ν`), `noncentralTMeasure_map_sq` (the image under squaring is
  `noncentralFMeasure 1 ν (‖δ‖₊²)`) and `hasLaw_noncentralT_of_gaussian_chiSquared`
  (`NoncentralT/Basic.lean`): for `ν > 0`, independent `Z` of law `gaussianReal 0 1` and `V` of
  law `chiSquaredMeasure ν`, `(Z + δ)/√(V/ν)` has law `noncentralTMeasure ν δ`.
- `TauCeti.Probability.fisherSnedecorMeasure` (`FisherSnedecor/Basic.lean`);
  `TauCeti.Probability.noncentralFMeasure m n l`, `noncentralFMeasure_zero_noncentrality`
  (`l = 0` gives `fisherSnedecorMeasure m n`) and `hasLaw_noncentralF_of_noncentralChiSquared`
  (`NoncentralF/Basic.lean`): for `m, n > 0`, independent `X` of law
  `noncentralChiSquaredMeasure m l` and `Y` of law `chiSquaredMeasure n`, `(X/m)/(Y/n)` has law
  `noncentralFMeasure m n l`.

## References

- D. Chua, *Part IB Statistics*, notes on the Cambridge lectures of D. Spiegelhalter, Lent 2015,
  [dec41.user.srcf.net/notes/IB_L/statistics.pdf](https://dec41.user.srcf.net/notes/IB_L/statistics.pdf).
  Its theorems are not numbered; locators give the section and the page of this version.
- C. R. Shalizi, *The Truth About Linear Regression*, draft textbook, version of 20 October
  2025, [stat.cmu.edu/~cshalizi/TALR/TALR.pdf](https://www.stat.cmu.edu/~cshalizi/TALR/TALR.pdf).
  Locators give the section, equation and page of this version.

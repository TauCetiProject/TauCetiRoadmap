# Roadmap: Bayesian inverse problems and Gaussian priors

**Summary.** An inverse problem asks for an unknown `u` from noisy data `y = G(u) + η`. The
Bayesian approach puts a prior probability measure `μ₀` on the unknown, usually a Gaussian
measure on a function space, and answers with the posterior: the conditional law of `u` given `y`.
This roadmap builds the measure theory behind that approach and its link to classical
regularization:
- Gaussian measures on a separable Hilbert space: on top of the trace-class covariances and the
  Gaussian measures `N(m, C)` of functional data analysis, the square root `C^{1/2}` of a
  covariance is Hilbert–Schmidt with energy the trace of `C`;
- the Feldman–Hájek theorem: two Gaussian measures on a Hilbert space are either equivalent or
  mutually singular, and they are equivalent exactly when the ranges of the square roots of
  their covariances agree, the difference of their means lies in that range, and an explicit
  operator built from the two covariances differs from the identity by a Hilbert–Schmidt
  operator; with its consequences for shifts (the Cameron–Martin theorem in Hilbert form),
  for covariances diagonal in a common basis, and for dilations;
- the Karhunen–Loève expansion of a square-integrable random variable in a Hilbert space and of
  a random field: the exact truncation error `∑_{j ∉ S} λⱼ` for every finite set `S` of indices,
  independent standard normal coefficients for a Gaussian law, and for a continuous covariance on
  a compact domain the covariance as an integral operator, Mercer's theorem and uniform
  convergence of the pointwise mean-square error;
- Bayes' theorem in function space: for additive noise with a density, the posterior has density
  `Z(y)⁻¹ exp(-Φ(u; y))` with respect to the prior, with a normalizer that is positive for every
  `y` and finite for almost every `y` (for every `y` when the noise density is bounded);
- well-posedness: under a Gaussian tail of the prior and growth and Lipschitz conditions on the
  potential `Φ`, the posterior is a probability measure and depends locally Lipschitz on the data
  in Hellinger distance, and expectations of square-integrable quantities inherit the bound;
- maximum a posteriori estimators: the functional `½ ‖h‖² + Φ(J h)` with a compact `J` attains
  its minimum and its minimizing sequences converge along subsequences; in finite dimension the
  minimizers are exactly the modes of the posterior; for a linear observation with Gaussian noise
  the posterior is Gaussian with the Kalman gain and measurement update, its mean is the unique
  minimizer of the generalized Tikhonov functional, and for isotropic covariances the Kalman gain
  is the Tikhonov operator.

The roadmap is a synthesis of Stuart's survey of the Bayesian approach to inverse problems, of
Sullivan's text on uncertainty quantification, of the data assimilation text of Law, Stuart and
Zygalakis, and of the Karhunen–Loève chapters of Lord, Powell and Shardlow (see
[References](#references)); it follows none of them section by section. Headlines that restate a
source result cite a theorem, definition or equation number with its printed page; corollaries
and adaptations carry a proof route.

The roadmap rests on Mathlib's Gaussian measures on Banach spaces, their covariance operators on
Hilbert spaces and Fernique's theorem, and on Mathlib's posterior kernels; on Tau Ceti's
continuous functional calculus, trace-class and Hilbert–Schmidt operators, spectral theorem for
compact self-adjoint operators and multivariate Gaussian densities. It takes from
[MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) the
squared Hellinger distance and, from its functional-data layer, the centred covariance operator
with its trace, eigen-expansions, the Karhunen–Loève expansion with its moments and convergence,
and the Gaussian measures with a given trace-class covariance; it takes the Kalman gain and the
measurement update, and the conditional law of a linearly observed Gaussian state, from
[KalmanFiltering](../KalmanFiltering/README.md); and the
Tikhonov operator from the family roadmap RegularizationOfLinearIllPosedProblems, whose
functional is the MAP functional of a linear Gaussian problem. The Cameron–Martin space of a
Gaussian measure on a Banach space, with its translation theorem, belongs to
[StochasticCalculus](../StochasticCalculus/README.md) §8.1; Layer 1 here is the Hilbert-space
theory, which identifies that space with the range of `C^{1/2}`. Its downstream consumers are
sampling methods on function space, data assimilation, and the numerical analysis of random
fields and of partial differential equations with random coefficients.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. Every headline whose carriers exist at the pins carries a Lean name; the bullets
without one are definitions, results supplied by Mathlib, Tau Ceti or other roadmaps, or facts
about a single definition, as the module docstring of `Suggested.lean` says. It is not an
exhaustive acceptance test: the prose targets have the same standing.

Suggested home: `TauCeti/Probability/Distributions/Gaussian/Hilbert/` for Layers 1–2 and
`TauCeti/Probability/InverseProblems/` for Layers 3–5.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof route
for a corollary or adaptation, and Checks, which are sanity checks of the key definitions and
theorems.

Layer 1 is the theory of Gaussian measures on a separable Hilbert space: covariances, Gaussian
measures and the square root of a covariance (1.1), the Feldman–Hájek theorem (1.2) and its
corollaries (1.3). Layer 2 is the Karhunen–Loève expansion, first for an `H`-valued random
variable (2.1), then for a random field with a covariance function, with Mercer's theorem (2.2).
Layer 3 defines the posterior by its density with respect to the prior and proves Bayes'
theorem for additive noise. Layer 4 proves that the posterior is well defined and depends
continuously on the data. Layer 5 treats maximum a posteriori estimators and their relation to
Tikhonov regularization and to the Kalman update.

The layers are in build order. Layer 2 uses the suppliers of 1.1 for the covariance and the
Gaussian case. Layers 3 and 4 use only the suppliers and Layer 3's definitions; Layer 4 needs of
the prior only a Gaussian tail, which Fernique's theorem gives for a Gaussian prior. Layer 5 uses
Layers 3 and 4, and 1.1 for the compactness of `C^{1/2}`.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace `TauCeti`, with Mathlib's
  `ProbabilityTheory` and `MeasureTheory` opened. `Suggested.lean` states the prototypes in the
  namespace `TauCetiRoadmap.BayesianInverseProblemsAndGaussianPriors`.
- **Hilbert spaces.** In Layers 1 and 2, `H` is a separable real Hilbert space (`CompleteSpace`,
  `SecondCountableTopology`) with its Borel σ-algebra. Gaussian measures are Mathlib's
  `IsGaussian`: a probability measure whose image under every continuous linear functional is a
  Gaussian law on `ℝ`, possibly a point mass (`gaussianReal`).
- **Covariances.** The covariance of a random variable `u : Ω → H` under `P` is
  MathematicalStatisticsNonparametric's `centeredCovariance P u`, Mathlib's uncentred
  `covarianceOperator` applied to the law of `u - m`, `m = ∫ u dP` (1.1); that of a measure `μ`
  on `H` is `centeredCovariance μ id`. It is `0` when the second moment is infinite, so every
  statement about it assumes a finite second moment (`MemLp u 2 P`) or a Gaussian law, which has
  one. Mathlib's `covarianceBilin` is the same covariance as a bilinear form. Eigen-expansions
  are MathematicalStatisticsNonparametric's `IsEigenExpansion`, indexed by `ℕ` with nonincreasing
  eigenvalues.
- **Operators.** Positive means `IsPositive` of the underlying linear map; the square root
  `C^{1/2}` is `cfc Real.sqrt C`, Tau Ceti's continuous functional calculus for self-adjoint
  operators over `RCLike 𝕜`, and `sqrtRange C` is its range. Trace class is
  `Summable C.singularValue` (Tau Ceti's approximation numbers), with trace norm `nuclearENorm`;
  Hilbert–Schmidt is finite `hilbertSchmidtEnergy` in a Hilbert basis, which does not depend on
  the basis. Inner products are `⟪x, y⟫`.
- **Equivalence of measures.** `μ` and `ν` are equivalent when `μ ≪ ν ∧ ν ≪ μ`; mutual
  singularity is Mathlib's `⟂ₘ`.
- **Bases and series.** Other eigenbases are Mathlib's `HilbertBasis`, indexed by an arbitrary
  type.
  Series over the index are `HasSum` or `Summable`, never a bare sum `∑'`, which is `0` on a
  nonsummable family; convergence of truncations is along finite sets of indices (`atTop` on
  `Finset ι`), which is unconditional convergence.
- **Posteriors.** The unknown lives in a measurable space `X`, the data in `Y`. The potential is
  `Φ : X → Y → ℝ`, written `Φ(u; y)` in the sources. The likelihood `exp(-Φ(u; y))`, the evidence
  `Z(y) = ∫⁻ exp(-Φ(u; y)) dμ₀(u)` and the posterior `Z(y)⁻¹ exp(-Φ(·; y)) μ₀` take values in
  `ℝ≥0∞` (3.1). Where `Z(y) = ∞` the posterior is the zero measure, because `∞⁻¹ = 0`; every
  statement that calls the posterior a probability measure proves `Z(y) < ∞` first.
- **Finite dimension.** Data and finite-dimensional unknowns lie in `EuclideanSpace ℝ κ`,
  matrices act through `toEuclideanLin`, multivariate Gaussians are Mathlib's
  `multivariateGaussian`, and positive definiteness is `PosDef`. Mathlib's matrix inverse is `0`
  on a singular matrix, so every inverse is of a matrix assumed positive definite.
- **Hellinger distance.** `sqHellinger μ μ' = ∫ (√p - √q)² = 2 (1 - hellingerAffinity μ μ')`, as
  in MathematicalStatisticsNonparametric. Stuart's and Law–Stuart–Zygalakis's distance has the
  factor `½`, so their d_Hell² is `sqHellinger / 2`; Sullivan's has no factor, so his d_H² is
  `sqHellinger`.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references). Stuart writes `μ₀ = N(0, C)` for the prior and `E` for its
  Cameron–Martin space; Sullivan writes `H` for the observation map and `U` for the space of
  unknowns.

## Layer 1: Gaussian measures on a Hilbert space

### 1.1 Covariances, Gaussian measures and the square root

The centred covariance, its trace and the Gaussian measures with a given covariance are
MathematicalStatisticsNonparametric's (Layer 8); this subsection records what Layers 1–5 use of
them and adds the square root.

- **The centred covariance** `centeredCovariance P u` of a square-integrable `u : Ω → H`, and
  `centeredCovariance μ id` of a measure `μ` on `H` (MathematicalStatisticsNonparametric 8.1). It
  is positive with `⟪C x, y⟫ = E ⟪u - m, x⟫ ⟪u - m, y⟫`, compact, of trace `E ‖u - m‖²` in every
  Hilbert basis (8.1), with trace norm `E ‖u - m‖²` (8.2); by Tau Ceti's
  `nuclearENorm_ne_top_iff_summable` it is of trace class. For a Gaussian measure this is [Su,
  Theorem 2.49 (Sazonov), p. 27] and [St, Theorem 6.6, p. 529].
- **Gaussian measures `N(m, C)`.** For every positive compact `C` with finite trace norm and
  every eigen-expansion `(λ, φ)` of `C`, the law of `∑ √λⱼ zⱼ φⱼ` under independent standard
  normal `zⱼ` is the unique centred Gaussian measure with covariance `C`
  (MathematicalStatisticsNonparametric 8.4) [St, Theorem 6.6, p. 529, and Theorem 6.19, p. 533];
  [Su, Theorem 2.49, p. 27, and Remark 2.53, pp. 28–29]. Its image under `x ↦ x + m` is the
  unique Gaussian measure with mean `m` and covariance `C`: translation preserves Gaussian laws
  and centred covariances, and uniqueness is Mathlib's `IsGaussian.ext`.
- **The range of the square root** (`sqrtRange`): the range of `C^{1/2} = cfc Real.sqrt C`. For a
  Gaussian covariance this is the Cameron–Martin space of [St, Lemma 6.10, p. 530] and [Su,
  Definition 2.50, pp. 27–28], with the norm `‖h‖_C = ‖v‖` for the `v ⊥ ker C^{1/2}` with
  `C^{1/2} v = h`; 1.3 identifies it as the space of admissible shifts.
- **The square root is Hilbert–Schmidt** (`sqrt_hilbertSchmidt`). For a positive trace-class `C`,
  the Hilbert–Schmidt energy `∑ ‖C^{1/2} bᵢ‖²` in every Hilbert basis `b` equals the trace norm of
  `C`, which is finite, and `C^{1/2}` is compact [Su, remark after Theorem 2.49, p. 27]. Route:
  `‖C^{1/2} x‖² = ⟪C x, x⟫`, MathematicalStatisticsNonparametric 8.2 for the trace norm of a
  positive compact operator as `∑ ⟪C bᵢ, bᵢ⟫`, and Tau Ceti's
  `isCompactOperator_of_hilbertSchmidtEnergy_ne_top`.
- **Fernique's theorem**, `∫ exp(α ‖x‖²) dμ < ∞` for some `α > 0`, is Mathlib's
  `IsGaussian.exists_integrable_exp_sq` on every separable Banach space [St, Theorem 6.9, p. 530];
  [Su, Theorem 2.47, p. 26]. It is the only property of a Gaussian prior that Layer 4 uses.

*Needs:* MathematicalStatisticsNonparametric 8.1, 8.2 and 8.4; Tau Ceti's functional calculus,
approximation numbers, nuclear norm and Hilbert–Schmidt energy; Mathlib's Fernique theorem.

**Checks.**

- `H = ℝ²`, `C = diag(2, ½)`: `C^{1/2} = diag(√2, 1/√2)` has Hilbert–Schmidt energy
  `2 + ½ = 5/2`, the trace of `C`.
- Brownian motion on `[0, 1]` as a Gaussian measure on `L²(0, 1)`: the eigenvalues
  `((j - ½)² π²)⁻¹`, `j ≥ 1`, sum to `½ = ∫₀¹ t dt`, which is the energy of `C^{1/2}`.
- Negative control: the energy of `C` itself is `∑ λⱼ²`, which for `C = diag(2, ½)` is
  `17/4 ≠ 5/2`; the identity is for the square root. On an infinite-dimensional `H` the identity
  operator is not of trace class, and its square root, the identity, has infinite energy.

### 1.2 The Feldman–Hájek theorem

- **The dichotomy** (`equivalent_or_mutuallySingular`). Two Gaussian measures on a separable
  Hilbert space are either equivalent or mutually singular [St, Theorem 6.13, p. 531]; [Su,
  Theorem 2.51, p. 28]. Route: in infinite dimension the criterion below either holds, or one of
  its conditions fails and Kakutani's dichotomy for the product of the laws of independent
  coordinates gives singularity; finite dimension is a direct computation with
  `multivariateGaussian` densities on the common support.
- **The criterion** (`equivalent_iff_feldmanHajek`). Write `R₁ = C₁^{1/2}`, `R₂ = C₂^{1/2}` for
  the square roots of the covariances of `μ` and `ν`, and `P` for the orthogonal projection onto
  `(ker R₁)ᗮ`, the closure of the range of `R₁`. Then `μ` and `ν` are equivalent exactly when
  - the ranges of `R₁` and `R₂` agree;
  - the difference of the means lies in that range;
  - the operator `S` with `R₂ = R₁ S` and range in `(ker R₁)ᗮ` (it exists by the first condition,
    Douglas's factorization, and is unique) has `S S* - P` Hilbert–Schmidt.

  [St, Theorem 6.13, p. 531]; [Su, Theorem 2.51, p. 28]. The sources write the third condition
  as `(C₁^{-1/2} C₂^{1/2})(C₁^{-1/2} C₂^{1/2})* - I` Hilbert–Schmidt, Stuart on the Cameron–Martin
  space and Sullivan on the range of `C₁^{1/2}`, with `C₁^{-1/2}` the inverse of `R₁` on its
  range. That operator is `S S*` on `(ker R₁)ᗮ` minus the identity there; `S*` vanishes on
  `ker R₁`, which is orthogonal to the range of `S`, so `S S* - P` is the same operator extended by
  `0`, and the condition is read on the closure of the range in the norm of `H`. Stuart's
  Lemma 6.15, p. 531, characterizes the inclusion of ranges for positive definite covariances by
  the bound `⟪C₁ h, h⟫ ≤ K ⟪C₂ h, h⟫`.

*Needs:* 1.1; Mathlib's absolute continuity, mutual singularity, orthogonal projections and
`multivariateGaussian`; Tau Ceti's Hilbert–Schmidt energy.

**Checks.**

- `H = ℝ²`, `C₁ = I`, `C₂ = diag(2, 3)`: both ranges are `ℝ²`, `S = diag(√2, √3)`, and in finite
  dimension every operator is Hilbert–Schmidt, so the measures are equivalent, as two
  nondegenerate Gaussians on `ℝ²` are.
- `H = ℝ²`, `C₁ = diag(1, 0)`, `C₂ = diag(0, 1)`: the ranges are the two axes, so the measures
  are singular; they live on the two axes.
- Two point masses `δ_{m₁}`, `δ_{m₂}`: `R₁ = R₂ = 0`, `P = 0`, `S = 0`, and the criterion reduces
  to `m₁ - m₂ ∈ {0}`.
- Negative control: replacing Hilbert–Schmidt by compact is wrong. For covariances diagonal in a
  common basis with ratios `a₂ᵢ / a₁ᵢ = 1 + i^{-1/2}`, `S S* - I` is diagonal with entries
  `i^{-1/2} → 0`, hence compact, but `∑ i⁻¹ = ∞`, and the measures are singular (1.3).

### 1.3 Shifts, diagonal covariances and dilations

- **Shifts** (`equivalent_map_add_iff`). The translate of a Gaussian measure by `h` is equivalent
  to it exactly when `h` lies in the range of `C^{1/2}`, and mutually singular to it otherwise
  [St, Theorem 6.13, p. 531, and the remark after it]; [Su, Definition 2.50, p. 28]. Route: 1.2
  with `C₁ = C₂`, where `S = P` and `S S* - P = 0`. The density of the shifted measure,
  `exp(⟨h, x - m⟩_C - ½ ‖h‖_C²)` [St, Theorem 6.14, p. 531], is not restated: it is the
  translation density of StochasticCalculus §8.1.
- **Covariances diagonal in a common basis** (`equivalent_iff_of_diagonal`). If both covariances
  are diagonal in a Hilbert basis `b` with positive eigenvalues `a₁ᵢ` and `a₂ᵢ`, the measures are
  equivalent exactly when `∑ (a₂ᵢ / a₁ᵢ - 1)² < ∞` and `∑ ⟪m₁ - m₂, bᵢ⟫² / a₁ᵢ < ∞`. Route: 1.2
  with the diagonal `S = diag(√(a₂ᵢ / a₁ᵢ))`; square summability of `a₂ᵢ / a₁ᵢ - 1` forces the
  ratios to tend to `1`, so they are bounded above and away from `0`, which is the first
  condition. This is the computation of [St, Example 6.17, p. 532].
- **Dilations** (`equivalent_map_smul_iff`). A centred Gaussian measure whose range of `C^{1/2}`
  is infinite-dimensional is equivalent to its image under `x ↦ c x` exactly when `c = ±1`, and
  mutually singular to it otherwise [Su, Proposition 2.52, p. 28]. Route: the image has
  covariance `c² C`, so `S = |c| P` and `S S* - P = (c² - 1) P`, Hilbert–Schmidt only for
  `c² = 1` on an infinite-dimensional range; `c = -1` preserves a centred Gaussian.

*Needs:* 1.2.

**Checks.**

- [St, Example 6.17, p. 532]: `a₁ₖ = (k² π² + 1)⁻¹`, `a₂ₖ = (k² π²)⁻¹`, equal means:
  `∑ (a₂ₖ / a₁ₖ - 1)² = ∑ (kπ)⁻⁴ = 1/90`, so the two measures are equivalent; numerically the
  partial sum to `2·10⁵` is `0.0111111`.
- Shifts of Brownian motion on `L²(0, 1)`, with eigenvalues `aⱼ = ((j - ½)² π²)⁻¹` and
  eigenfunctions `bⱼ(t) = √2 sin((j - ½) π t)`: `h(t) = t` lies in the range of `C^{1/2}`, since
  `⟪h, bⱼ⟫² / aⱼ = 2 ((j - ½) π)⁻²` is summable, while `h = 1` does not, since
  `⟪1, bⱼ⟫² / aⱼ = 2` for every `j`.
- `c = 0`: the image is the point mass at `0`, which an infinite-dimensional centred Gaussian
  measure does not charge, so the two are singular.
- Negative control: the dilation `c = 2` of an infinite-dimensional centred Gaussian has
  `(c² - 1)² = 9` in every term of the diagonal series, so it is singular, although `S = 2 P` is
  bounded and invertible on the range.

## Layer 2: the Karhunen–Loève expansion

### 2.1 Random variables in a Hilbert space

Let `u : Ω → H` be square integrable with mean `m` and covariance `C = centeredCovariance P u`, and
let `(λ, φ)` be an eigen-expansion of `C` (`IsEigenExpansion`, MathematicalStatisticsNonparametric
8.2): `λ` is nonincreasing, nonnegative and tends to `0`, the `φⱼ` with `λⱼ > 0` are orthonormal,
and `C x = ∑ λⱼ ⟪x, φⱼ⟫ φⱼ`. The coefficients are `γⱼ = ⟪u - m, φⱼ⟫`, and the normalized
coefficients `ξⱼ = γⱼ / √λⱼ` are defined only for `λⱼ > 0`; `φⱼ` is unconstrained where `λⱼ = 0`,
and the expansion uses only the indices with `λⱼ > 0`. That the `γⱼ` are centred and uncorrelated
with variances `λⱼ`, and that the expansion converges almost surely and in `L²(Ω; H)`, is
MathematicalStatisticsNonparametric 8.3 [LPS, Theorem 5.28, p. 202, and Theorem 7.52, p. 293]; [Su,
Theorem 11.4, p. 225].

- **Truncation error** (`karhunenLoeve_truncation`). For every finite set `S` of indices,
  `E ‖u - m - ∑_{j ∈ S, λⱼ > 0} γⱼ φⱼ‖² = ∑_{j ∉ S} λⱼ`. Route: the truncation is the orthogonal
  projection of `u - m` onto the span of the `φⱼ` with `j ∈ S` and `λⱼ > 0`, so the error is
  `E ‖u - m‖² - ∑_{j ∈ S, λⱼ > 0} λⱼ` by Pythagoras and the variances of 8.3, and
  `E ‖u - m‖² = ∑ λⱼ` by the trace of 8.1 in a Hilbert basis extending the `φⱼ` with `λⱼ > 0`, on
  whose other vectors `C` vanishes. Lord, Powell and Shardlow state the error identity integrated
  over the domain only for stationary fields [LPS, Corollary 7.54, p. 294]; it holds for every
  square-integrable `u`.
- **Gaussian coefficients** (`karhunenLoeve_iIndepFun_of_isGaussian`). If the law of `u` is
  Gaussian, the `ξⱼ` with `λⱼ > 0` are independent with law `gaussianReal 0 1` [LPS,
  Theorem 7.52, p. 293]. Route: every finite subfamily of `(γⱼ)` is jointly Gaussian as the image
  of `u` under a continuous linear map to `ℝⁿ`, with diagonal covariance by 8.3; uncorrelated
  jointly Gaussian variables indexed by a finite type are independent (Mathlib's
  `HasGaussianLaw.iIndepFun_of_covariance_eq_zero`), and independence of a family is independence
  of its finite subfamilies. The proof of [LPS, Theorem 5.28, p. 203] states pairwise
  independence; mutual independence is what the joint Gaussian law gives.

*Needs:* MathematicalStatisticsNonparametric 8.1–8.3; Mathlib's `iIndepFun` and Gaussian laws.

**Checks.**

- Brownian motion on `[0, 1]` in `L²(0, 1)`: `λⱼ = ((j + ½)² π²)⁻¹` for `j ≥ 0`, and the truncation
  to `S = {0, …, J - 1}` has mean-square error `∑_{j ≥ J} λⱼ = 0.02020, 0.00507, 0.00127` at
  `J = 5, 20, 80`.
- `H = ℝ²`, `u = (Z, 0)` with `Z` standard normal: `λ = (1, 0, 0, …)`, `φ₀ = e₁`, `ξ₀ = Z`, and
  no normalized coefficient is defined at the zero eigenvalues.
- Negative control for the restriction to `λⱼ > 0`: in the previous example the eigen-expansion
  may take `φ₁ = 5 e₁`; truncating to `S = {0, 1}` with every index would subtract
  `⟪u, 5 e₁⟫ 5 e₁ = 25 Z e₁` once more and give error `E (25 Z)² = 625`, not `∑_{j ∉ S} λⱼ = 0`.
- Negative control: without the Gaussian hypothesis the `ξⱼ` need not be independent. For
  `u = (Z, Z² - 1)` in `ℝ²` with `Z` standard normal, `E Z (Z² - 1) = 0`, so the covariance is
  `diag(1, 2)`, with eigen-expansion `λ = (2, 1, 0, …)`, `φ = (e₂, e₁, …)`; the coefficients
  `(Z² - 1)/√2` and `Z` are uncorrelated with variance `1` but dependent.

### 2.2 Random fields and Mercer's theorem

Let `(T, μ_T)` be a σ-finite measure space with `L²(T)` separable, and `U : Ω → T → ℝ` a jointly
measurable field that represents a square-integrable `L²(T)`-valued random variable `u`. The
covariance function is `c(x, y) = E[(U(x) - m(x)) (U(y) - m(y))]` with `m(x) = E U(x)`
(`covarianceFunction`).

- **The covariance operator is an integral operator** (`covarianceFunction_spec`). `c` lies in
  `L²(T × T)`, and the covariance of `u` is the integral operator with kernel `c`:
  `⟪C f, g⟫ = ∫∫ c(x, y) f(y) g(x)` [LPS, proof of Theorem 5.28, p. 202, and (7.40), p. 293].
  Route: Cauchy–Schwarz and Fubini, as in that proof.
- **Mercer's theorem** (`mercer`). Let `K` be a compact metric space with a finite Borel measure
  of full support (`IsOpenPosMeasure`), and `c` a continuous symmetric positive semidefinite
  kernel. For an orthonormal basis `φ` of `L²(K)` of eigenfunctions of the integral operator of
  `c` with eigenvalues `ν`:
  - `νᵢ ≥ 0` and `∑ νᵢ = ∫ c(x, x) dμ`;
  - each `φᵢ` with `νᵢ > 0` has a continuous representative `gᵢ`;
  - `∑ νᵢ gᵢ(x) gᵢ(y)` converges to `c(x, y)` uniformly on `K × K`, unconditionally.

  [Su, Theorem 11.3 (Mercer), p. 225]; [LPS, Theorem 7.53, p. 294, which uses Mercer's theorem in
  the form of its Theorem 1.80]. Route: the integral of `c(x, ·) φᵢ` is continuous in `x`, which
  gives `gᵢ`; the partial sums on the diagonal increase and are bounded by `c(x, x)` (positive
  semidefiniteness of the remainder kernel), they converge to `c(x, x)` pointwise, and Dini's
  theorem for the net of finite sets makes this uniform; Cauchy–Schwarz extends it off the
  diagonal. The full-support hypothesis is not in the cited statements and is needed: Lebesgue
  measure on `[0, 1] ∪ {2}` does not see the isolated point (Checks).
- **Uniform convergence for a field** (`karhunenLoeve_tendstoUniformly`). For a field on such a
  `K` with continuous covariance function, `E (U(x) - m(x) - ∑_{i ∈ S, νᵢ > 0} γᵢ gᵢ(x))²` equals
  `c(x, x) - ∑_{i ∈ S, νᵢ > 0} νᵢ gᵢ(x)²` and tends to `0` uniformly in `x` [LPS, Theorem 7.53,
  p. 294]. Route: `E[(U(x) - m(x)) γᵢ] = ∫ c(x, y) φᵢ(y) dy = νᵢ gᵢ(x)` for every `x`, by
  continuity and full support; then Mercer's theorem on the diagonal.

*Needs:* 2.1 and the suppliers of 1.1; Mathlib's `Lp`, Fubini–Tonelli, `TendstoUniformly` and
`IsOpenPosMeasure`.

**Checks.**

- Brownian motion, `c(s, t) = min(s, t)` on `[0, 1]`: the sup of `|c - c_J|` over a grid of 401
  points is `0.04040, 0.01013, 0.00253` at `J = 5, 20, 80`, equal to the supremum over `x` of
  the error `∑_{j > J} νⱼ φⱼ(x)²` of 2.2's identity, attained at `x = 1`, where it is twice the
  tail of 2.1.
- Negative control for full support: `K = [0, 1] ∪ {2}` with Lebesgue measure and the continuous
  kernel `c(x, y) = 1` if `x = y = 2` and `0` otherwise. The integral operator is `0`, so every
  `νᵢ = 0` and the Mercer series is `0`, while `c(2, 2) = 1`.

## Layer 3: Bayes' theorem in function space

### 3.1 Likelihood, evidence and posterior

- **The likelihood** (`likelihood`) `exp(-Φ(u; y))`, **the evidence** (`evidence`)
  `Z(y) = ∫⁻ exp(-Φ(u; y)) dμ₀(u)`, and **the posterior** (`bayesPosterior`)
  `μʸ = Z(y)⁻¹ exp(-Φ(·; y)) μ₀`, all in `ℝ≥0∞`
  [St, (2.24)–(2.25), p. 470]; [Su, Theorem 6.6, p. 100].
- The evidence is positive for every `y` whenever `μ₀` is a nonzero measure and `Φ(·; y)` is
  measurable, since the likelihood is positive everywhere; the posterior is a probability measure
  exactly when moreover `Z(y) < ∞`. These are facts about the definitions.

*Needs:* Mathlib's `Measure.withDensity` and lower Lebesgue integrals.

**Checks.**

- `μ₀ = δ₀` and `Φ(u; y) = y²`: `Z(y) = exp(-y²)` and `μʸ = δ₀`.
- Junk value: if `Z(y) = ∞`, `μʸ = 0`, not a probability measure; Layer 4 excludes it.

### 3.2 Bayes' theorem

- **Additive noise** (`bayes_additiveNoise`). Let `y = G(u) + η` in a finite-dimensional space,
  with `u ∼ μ₀`, `G` measurable, and `η` independent of `u` with Lebesgue probability density `ρ`.
  Let `Φ` be jointly measurable with `exp(-Φ(u; y)) = c(y) ρ(y - G u)` for some
  `0 < c(y) < ∞`. Then:
  - `Z(y) > 0` for every `y`;
  - `Z(y) < ∞` for almost every `y`, and for every `y` when `ρ` is bounded;
  - the law of `y` has density `∫ ρ(y - G u) dμ₀(u)`;
  - `y ↦ μʸ(A)` is measurable, and the joint law of `(u, y)` gives `A × B` the mass
    `∫_B μʸ(A) d(law of y)`: the posterior kernel disintegrates the joint law, so it is a version
    of the conditional law of `u` given `y`, equal almost everywhere to Mathlib's
    `condDistrib` and `posterior`.

  [St, Theorem 6.31, p. 544]; [Su, Theorem 6.6 and Lemma 6.7, p. 100]. Stuart and Sullivan assume
  a continuous `G` on a separable Banach space and a noise density with support `ℝ^q`, and assert
  the density formula for every `y`. A real-valued `Φ` with the stated relation forces `ρ > 0`
  everywhere; the proofs assert only `Z(y) > 0`. The finiteness of `Z(y)` holds only almost
  everywhere, because `Z(y) / c(y)` is the density of the law of `y`: with prior density
  proportional to `|u|^{-1/2}` near `0` and `ρ(z) ∝ |z|^{-1/2} e^{-|z|}`, `Z(0) ∝ ∫ |u|⁻¹ du`,
  which is `∞`. Route: Tonelli and translation invariance of Lebesgue measure, and on the null
  set where `Z = ∞` nothing needs to hold; Mathlib's
  `condDistrib_ae_eq_of_measure_eq_compProd` identifies the version.
- **Gaussian noise** (`bayes_gaussianNoise`). For `η ∼ N(0, Γ)` with `Γ` positive definite and
  `Φ(u; y) = ½ ⟪y - G u, Γ⁻¹ (y - G u)⟫` (`gaussianPotential`), `0 < Z(y) ≤ 1`, the posterior is a
  probability measure for every `y`, and it disintegrates the joint law [St, (2.26), p. 471, and
  Theorem 6.31, p. 544]. Route: the previous theorem with Tau Ceti's
  `multivariateGaussian_eq_withDensity`, `c(y) = (2π)^{q/2} (det Γ)^{1/2}`, a bounded `ρ`, and
  `Φ ≥ 0`.

*Needs:* 3.1; Mathlib's `Measure.prod`, `multivariateGaussian` and
`condDistrib_ae_eq_of_measure_eq_compProd`; Tau Ceti's `multivariateGaussian_eq_withDensity`.

**Checks.**

- Prior `N(0, 1)`, `G = id`, noise `N(0, 1)`: `Z(y) = e^{-y²/4} / √2`, numerically `0.707107`,
  `0.550695`, `0.001365` at `y = 0, 1, 5`; the posterior is `N(y/2, 1/2)`.
- Negative control: a noise density that is not integrable, `ρ(z) = |z|⁻²` for `z ≠ 0`, with
  the uniform prior on `[0, 1]` and `G = id`, gives `Z(y) = ∞` for every `y ∈ (0, 1)`, a set of
  positive measure; the probability-density hypothesis on `ρ` is what makes `Z` finite almost
  everywhere.

## Layer 4: well-posedness of the posterior

The conditions on the potential are those of [St, Assumption 2.6, p. 471] and [Su, (A1)–(A4),
p. 102], for a normed space `X` of unknowns and a seminormed space `Y` of data:
- (i) for all `ε, r > 0` there is `M` with `Φ(u; y) ≥ M - ε ‖u‖²` for all `u` and `‖y‖ < r`;
- (ii) for every `r > 0` there is `K` with `Φ(u; y) ≤ K` when `‖u‖, ‖y‖ < r`;
- (iii) for every `r > 0` there is `L` with `|Φ(u₁; y) - Φ(u₂; y)| ≤ L ‖u₁ - u₂‖` when
  `‖u₁‖, ‖u₂‖, ‖y‖ < r`;
- (iv) for all `ε, r > 0` there is `C` with
  `|Φ(u; y₁) - Φ(u; y₂)| ≤ exp(ε ‖u‖² + C) ‖y₁ - y₂‖` for all `u` and `‖y₁‖, ‖y₂‖ < r`.

They are hypotheses written out in each statement, not named predicates. The prior enters only
through a Gaussian tail `∫⁻ exp(α ‖u‖²) dμ₀ < ∞` for some `α > 0`, which Fernique's theorem (1.1)
supplies for a Gaussian prior on a separable Banach space.

### 4.1 The posterior is a probability measure

- **Normalizability** (`bayesPosterior_isProbabilityMeasure`). If the prior has a Gaussian tail,
  `Φ(·; y)` is measurable and (i) holds at `y`, then `0 < Z(y) < ∞` and `μʸ` is a probability
  measure [St, Theorem 4.1, p. 501]; [Su, Theorem 6.8, p. 102]. The sources assume (i)–(iii) and
  a Gaussian prior; (iii) serves only to make `Φ(·; y)` measurable, and (ii) only for a lower
  bound on `Z`, which positivity of the likelihood gives (3.1). Route:
  `Z(y) ≤ e^{-M(α)} ∫ exp(α ‖u‖²) dμ₀`.

*Needs:* 3.1; Fernique's theorem (1.1) for a Gaussian prior.

**Checks.**

- Prior `N(0, 1)`, `Φ(u) = -u²/4`: (i) fails for `ε < ¼`, but the tail `α = ½ - δ` still gives
  `Z = √2`; with `Φ(u) = -u²` the evidence is `∫ e^{u²} dN(0, 1) = ∞` and the posterior is the
  zero measure.

### 4.2 Hellinger stability and expectations

- **Expectations** (`norm_integral_sub_integral_le`). For probability measures `μ`, `μ'` and
  `f : X → W` square integrable under both, with `W` a Banach space,
  `‖E^μ f - E^{μ'} f‖ ≤ √(2 (E^μ ‖f‖² + E^{μ'} ‖f‖²) · sqHellinger μ μ')` [St, Lemma 6.37,
  p. 546]; [Su, Proposition 5.12, p. 85]; [LSZ, Lemma 1.30, p. 17]. With the halved distance of
  Stuart and Law–Stuart–Zygalakis this is their constant `2`. Sullivan's distance is
  `√sqHellinger`, `√2` times theirs, so his statement with the constant `2` is weaker than this
  one by the factor `√2`. Route: `f (p - q) = f (√p + √q)(√p - √q)` and Cauchy–Schwarz, with
  `(√p + √q)² ≤ 2 (p + q)`.
- **Local Lipschitz dependence on the data** (`sqHellinger_bayesPosterior_le`). If the prior has a
  Gaussian tail, each `Φ(·; y)` is measurable and (i) and (iv) hold, then for every `r > 0` there
  is `C(r)` with `sqHellinger(μʸ, μʸ') ≤ C(r) ‖y - y'‖²` for `‖y‖, ‖y'‖ < r` [St, Theorem 4.2,
  p. 501]; [Su, Theorem 6.9, p. 103]. Sullivan states one constant for all `y, y'`; his proof,
  like Stuart's, gives the local constant `C(r)`, which is the statement here. The sources also
  assume (ii), for a lower bound on `Z` uniform on the ball; (iv) gives that bound, because
  `Φ(u; y) ≤ Φ(u; 0) + r exp(ε ‖u‖² + C)` for `‖y‖ < r`. Route, as in Stuart's proof: bound
  `|Z(y) - Z(y')|` and `∫ (e^{-Φ(·; y)/2} - e^{-Φ(·; y')/2})²` by `‖y - y'‖` and `‖y - y'‖²` with
  the tail, and compute `sqHellinger` with `μ₀` as dominating measure
  (MathematicalStatisticsNonparametric §1.1, independence of the dominating measure).

*Needs:* 3.1 and 4.1; MathematicalStatisticsNonparametric 1.1 (the squared Hellinger distance
and its computation with any dominating measure).

**Checks.**

- `μ = N(0, 1)`, `μ' = N(a, 1)`, `f = id`: `sqHellinger = 2 (1 - e^{-a²/8})`, and the ratio of
  the left to the right side of the expectation bound is `0.99998, 0.981, 0.842, 0.550` at
  `a = 0.01, 0.3, 1, 3`; the constant cannot be improved as `a → 0`.
- Prior `N(0, 1)`, `G = id`, noise `N(0, 1)`: the posteriors are `N(y/2, 1/2)` and
  `sqHellinger = 2 (1 - e^{-Δ²/16}) ≤ Δ²/8` for `Δ = y - y'` (`0.00125`, `0.12117`, `1.26424`
  against `0.00125`, `0.125`, `2` at `Δ = 0.1, 1, 4`).
- Negative control: without (iv), for `μ₀ = N(0, 1)` and `Φ(u; y) = 0` for `y ≤ 0` and `u²/2`
  for `y > 0`, the posterior jumps from `N(0, 1)` to `N(0, 1/2)` at `y = 0`, and no bound
  `C ‖y - y'‖²` holds.

### 4.3 Finite data with Gaussian noise

- **The conditions for the Gaussian potential** (`gaussianPotential_assumptions`). If
  `‖G u‖ ≤ exp(ε ‖u‖² + M(ε))` for every `ε > 0` and `G` is Lipschitz on bounded sets, the
  Gaussian potential satisfies (i)–(iv) with the Euclidean norm on the data [St, Assumption 2.7
  and Lemma 2.8, pp. 471–472]. Stuart measures data and `G` in the norm `|Γ^{-1/2} ·|`, which is
  equivalent to the Euclidean norm for positive definite `Γ`, so the conditions are the same.
  Route: (i) with `M = 0`, since the potential is nonnegative; (iii) and (iv) from
  `⟪a, Γ⁻¹ a⟫ - ⟪b, Γ⁻¹ b⟫ = ⟪a - b, Γ⁻¹ (a + b)⟫`.
- **Well-posedness for a Gaussian prior** (`bayesPosterior_gaussian_wellPosed`). For a Gaussian
  prior on a separable Banach space, Gaussian noise and such a `G`, the posterior is a probability
  measure for every `y` and depends locally Lipschitz on `y` in Hellinger distance [St,
  Corollary 4.4, p. 503]. Route: 4.1, 4.2, the previous bullet and Fernique's theorem; 3.2 makes
  this posterior the conditional law.

*Needs:* 3.2, 4.1 and 4.2; Fernique's theorem (1.1).

**Checks.**

- `G = id` on `ℝ` satisfies both conditions: `|u| ≤ e^{εu² + M(ε)}` holds with
  `M(ε) = max(0, -½ ln(2eε))`, the maximum of `ln |u| - εu²`, attained at `|u| = (2ε)^{-1/2}`
  (`M(0.01) = 1.4560`); `M(ε) = 0` is not enough for small `ε`, since `ln 3 > 0.09`.
- Negative control: `G(u) = e^{u²}` on `ℝ` is Lipschitz on bounded sets but violates the growth
  condition for `ε < 1`, and (iv) fails at every `ε < 1`.

## Layer 5: maximum a posteriori estimators and Tikhonov regularization

### 5.1 Existence of minimizers

- **The MAP functional** (`exists_minimizer_mapFunctional`). Let `J : E → X` be a compact
  operator from a Hilbert space to a normed space, `Φ` continuous on `X` with
  `Φ(x) ≥ M(ε) - ε ‖x‖²` for every `ε > 0`, and `I(h) = ½ ‖h‖² + Φ(J h)`. Then `I` attains its
  infimum, and every sequence along which `I` tends to its minimum has a subsequence converging
  in `E` to a minimizer [St, (5.3), p. 510, and Theorem 5.4, p. 514]. Stuart takes `E` the
  Cameron–Martin space of the prior with its compact embedding, and (iii) of Layer 4 for `Φ`;
  his proof uses only the continuity of `Φ`. His statement has the subsequence converge to the
  given minimizer; the proof gives a minimizer, which is the given one only when it is unique.
  Route, as in Stuart: weak compactness of bounded sets of `E`, compactness of `J` turning weak
  into strong convergence, and the parallelogram identity for strong convergence.
- For a Gaussian prior `N(0, C)` on a Hilbert space `H`, the functional of Stuart's (5.3) on the
  Cameron–Martin space is `I` with `E = H` and `J = C^{1/2}`, compact by 1.1, through
  `u = C^{1/2} h`; components of `h` in `ker C^{1/2}` only increase `I`.

*Needs:* 1.1 for the compactness of `C^{1/2}`; weak sequential compactness of bounded sets
in a Hilbert space.

**Checks.**

- `E = X = ℝ`, `J = id`, `Φ(x) = -x²`: (i) fails for `ε < 1`, and `I(h) = -h²/2` has no minimum.
- Negative control for compactness: `E = X = ℓ²`, `J = id` and
  `Φ(x) = (‖x‖² - 1)² - ½ ‖x‖² + ∑ ⟪x, eₖ⟫² / k²` satisfy the other hypotheses, and
  `I(h) = (‖h‖² - 1)² + ∑ hₖ² / k²` has infimum `0`, approached by `I(eₙ) = n⁻²`, but not
  attained.

### 5.2 Modes in finite dimension

- **Modes** (`IsMode`): `u` is a mode of `μ` when some continuous Lebesgue density of `μ` attains
  its maximum at `u`. A measure without a continuous density has no mode.
- **Posterior density and modes** (`bayesPosterior_isMode_iff`). For the prior `N(0, C)` on `ℝⁿ`
  with `C` positive definite and a continuous potential satisfying (i) at `y`, the posterior has
  Lebesgue density `k exp(-I(u))` with `k > 0` and `I(u) = ½ ⟪u, C⁻¹ u⟫ + Φ(u; y)`, and its modes
  are exactly the minimizers of `I` [St, (2.10)–(2.12), p. 460, and §5.3, p. 513]. Route: Tau
  Ceti's `multivariateGaussian_eq_withDensity`, 4.1 for `Z(y) < ∞`, and the uniqueness of a
  continuous density, since Lebesgue measure charges every nonempty open set. In infinite
  dimension Stuart motivates the minimizers of `I` as maximizers of small-ball probabilities but
  does not prove it [St, p. 513]; that characterization is not claimed here.

*Needs:* 3.1 and 4.1; Tau Ceti's `multivariateGaussian_eq_withDensity`.

**Checks.**

- Prior `N(0, 1)`, `Φ(u; y) = (y - u)²/2`: `I(u) = u²/2 + (y - u)²/2` has its minimum at `y/2`,
  the mode of `N(y/2, 1/2)`.
- Negative control: dropping continuity of the density makes every point a mode: `N(0, 1)` has
  the density `φ` changed to `1` at `x = 5`, the same measure, maximized at `5`.

### 5.3 Linear Gaussian problems and Tikhonov regularization

- **The linear Gaussian posterior** (`bayesPosterior_linearGaussian`). For the prior `N(m₀, C)`
  with `C` positive semidefinite, `G(u) = A u` and noise `N(0, Γ)` with `Γ` positive definite,
  the posterior at every `y` is `N(m₀ + K (y - A m₀), P⁺)`, with the Kalman gain
  `K = kalmanGain A Γ C` and the measurement update `P⁺ = measurementUpdate A Γ C` of
  KalmanFiltering §1.1 [St, (2.16a)–(2.16b), p. 464, for invertible `C`]; [Su, Theorem 2.54,
  p. 29]. Route: 3.2 and KalmanFiltering §3.1 at time `0` identify the two sides for almost
  every `y`, as the conditional law of the initial state given the first observation; both
  sides are weakly continuous in `y`, which gives every `y`.
- **The MAP estimator is the posterior mean** (`minimizer_generalizedTikhonov_iff`). For `C`
  and `Γ` positive definite, the generalized Tikhonov functional
  `½ ⟪y - A u, Γ⁻¹ (y - A u)⟫ + ½ ⟪u, C⁻¹ u⟫` has exactly one minimizer, `K y`, the mean of the
  posterior of the prior `N(0, C)` [St, (2.12), p. 460, and Theorem 2.4, (2.17a), p. 464]; [LSZ,
  §3.3, p. 65]. Route: the minimizer solves `(Aᵀ Γ⁻¹ A + C⁻¹) u = Aᵀ Γ⁻¹ y`, and the information
  form of KalmanFiltering §1.5 rewrites `(Aᵀ Γ⁻¹ A + C⁻¹)⁻¹ Aᵀ Γ⁻¹` as the Kalman gain.
- **Isotropic covariances give the Tikhonov operator** (`kalmanGain_smul_one_eq_tikhonov`). For
  `C = c I` and `Γ = γ I` with `c, γ > 0`, the Kalman gain is the Tikhonov operator `tikhonov`
  of `A` with parameter `α = γ / c`, of the family roadmap RegularizationOfLinearIllPosedProblems
  §4.1. Route: `c Aᵀ (c A Aᵀ + γ I)⁻¹ = (Aᵀ A + (γ/c) I)⁻¹ Aᵀ`, the push-through identity.
- On Hilbert spaces, for the prior `N(0, C)`, a bounded linear `A : H → Y` into a Hilbert space and
  white noise in `Y` (the potential `½ ‖y - A u‖²`), the functional of 5.1 with `J = C^{1/2}` is
  `½ ‖y - A C^{1/2} h‖² + ½ ‖h‖²`, whose unique minimizer is the Tikhonov solution of
  `A C^{1/2}` with `α = 1`, by the variational characterization of
  RegularizationOfLinearIllPosedProblems §4.1; the MAP estimator is `C^{1/2}` of it.

*Needs:* 3.2 and 5.1; KalmanFiltering §1.1, §1.5 and §3.1; RegularizationOfLinearIllPosedProblems
§4.1.

**Checks.**

- Scalar: `A = 1`, `C = 1`, `Γ = 1`, `m₀ = 0`: `K = ½`, `P⁺ = ½`, the posterior is `N(y/2, ½)`.
- Singular prior covariance `C = 0`: the prior is `δ_{m₀}`, `K = 0`, `P⁺ = 0`, and the posterior
  is `δ_{m₀}` for every `y`.
- On random `3 × 3` problems the Monte Carlo mean and covariance of the reweighted prior agree
  with `m₀ + K (y - A m₀)` and `P⁺` to `7·10⁻³` (4·10⁵ samples), also for a rank-`2` `C`; the
  Kalman gain and the information-form minimizer agree to `6·10⁻¹⁷`; for a random `4 × 3` matrix
  `A`, `c = 0.7` and `γ = 0.3`, the Kalman gain and `(Aᵀ A + (γ/c) I)⁻¹ Aᵀ` agree to `5·10⁻¹⁶`.
- Negative control: with `Γ` singular Mathlib's inverse is `0`, the potential vanishes, and the
  "posterior" is the prior, while the true conditional law given a noiseless observation is
  concentrated on `{A u = y}`.

## Downstream consumers

- Sampling methods on function space (Metropolis–Hastings samplers with Gaussian proposals that
  preserve the prior) consume the posterior of Layer 3, its well-posedness (4.1) and the shift
  criterion of 1.3, which says which proposals keep the prior's support.
- Data assimilation (3DVAR and 4DVAR as MAP estimators of filtering and smoothing problems)
  consumes 4.2 and Layer 5.
- Numerical methods for random fields and for elliptic equations with random coefficients
  (stochastic Galerkin and collocation, multilevel Monte Carlo) consume the Karhunen–Loève
  truncation error of 2.1 and the uniform convergence of 2.2.
- Parametric model reduction consumes the exact truncation error of 2.1, alongside the
  optimality of principal components in MathematicalStatisticsNonparametric 8.3.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

1. **Gaussian measures on a Hilbert space.** The range of the square root, the Hilbert–Schmidt
   square root, the Feldman–Hájek dichotomy and criterion, shifts, diagonal covariances and
   dilations.
2. **Karhunen–Loève.** The exact truncation error, independence of the Gaussian coefficients, the
   covariance function as an integral kernel, Mercer's theorem, uniform convergence for fields.
3. **Bayes.** Likelihood, evidence and posterior, Bayes' theorem for additive and for Gaussian
   noise.
4. **Well-posedness.** Normalizability, the Hellinger bound for expectations, local Lipschitz
   dependence on the data, the conditions for the Gaussian potential.
5. **MAP.** Existence of minimizers with compact embedding, modes in finite dimension, the linear
   Gaussian posterior, MAP = posterior mean, Kalman gain = Tikhonov operator.

The numbers are those of the layers, and k.n names subsection `n` of Layer `k`.

**Not owned here.**
- The centred covariance of a square-integrable random element of a separable Hilbert space, its
  trace, eigen-expansions, the Karhunen–Loève expansion with its moments and its convergence
  almost surely and in `L²`, and the Gaussian measures with a given trace-class covariance (their
  series construction, existence, uniqueness and the trace criterion):
  MathematicalStatisticsNonparametric 8.1–8.4. This roadmap adds to them only the results of
  1.1–1.3 and 2.1 stated on their carriers.
- Gaussian measures on Banach spaces, their characteristic functions, Fernique's theorem, Gaussian
  images, the uniqueness of a Gaussian measure with given mean and covariance, and multivariate
  Gaussians: Mathlib.
- The Cameron–Martin space of a Gaussian measure on a separable Banach space, its Hilbert
  structure, its translation theorem and the density of an admissible translate: StochasticCalculus
  §8.1. Layer 1 owns the Hilbert-space equivalence theory; the shift criterion of 1.3 shows that
  on a Hilbert space §8.1's Cameron–Martin space is `sqrtRange` of the covariance.
- Equivalence and singularity of Gaussian measures on an arbitrary index set or on a Banach
  space, outside the Hilbert-space form of 1.2, belong to the theory of Gaussian random fields
  and are not owned here.
- The Kalman gain, the measurement update, their information form and the Kalman filter:
  KalmanFiltering, whose §3.1 at time `0` is the conditional law used in 5.3.
- The Hellinger affinity and distance, and the independence of the dominating measure:
  MathematicalStatisticsNonparametric §1.1.
- The Tikhonov operator and its variational characterization: the family roadmap
  RegularizationOfLinearIllPosedProblems §4.1.
- Trace-class and Hilbert–Schmidt operators, approximation numbers, the continuous functional
  calculus and the spectral theorem for compact self-adjoint operators: Tau Ceti.

Boundary in one sentence: Gaussian measures on Hilbert spaces, Karhunen–Loève expansions, the
Bayesian posterior with its well-posedness, and MAP estimation are here; Gaussian measures on
Banach spaces and their Cameron–Martin translations, filtering in time, and sampling algorithms
are not.

## Exact supplier contracts

### From Mathlib

- **Gaussian measures:** `IsGaussian`, `gaussianReal`, `multivariateGaussian`,
  `IsGaussian.exists_integrable_exp_sq` (Fernique, on a complete second-countable normed space),
  `IsGaussian.ext` (equality from the mean and `covarianceBilin`),
  `HasGaussianLaw.iIndepFun_of_covariance_eq_zero` (uncorrelated jointly Gaussian variables).
- **Covariance:** `covarianceOperator` with `covarianceOperator_inner` (for `MemLp id 2 μ`) and
  `isPositive_covarianceOperator`; `covarianceBilin`.
- **Posterior kernels and conditional laws:** `posterior` with `posterior_eq_withDensity`,
  `condDistrib_ae_eq_of_measure_eq_compProd`.
- **Measures and series:** `Measure.withDensity`, `Measure.prod`, `iIndepFun`, `MemLp`, `Lp`,
  `HilbertBasis`, `HasSum`, `TendstoUniformly`, `IsOpenPosMeasure`, `IsCompactOperator`, `cfc`.

### From Tau Ceti

- **Functional calculus:** the instance `ContinuousFunctionalCalculus ℝ (E →L[𝕜] E) IsSelfAdjoint`
  over `RCLike 𝕜` (TauCeti/Analysis/InnerProductSpace/ContinuousFunctionalCalculus.lean), for
  `cfc Real.sqrt C`.
- **Operator ideals:** `ContinuousLinearMap.singularValue`, `ContinuousLinearMap.nuclearENorm` with
  `nuclearENorm_ne_top_iff_summable` (TauCeti/Analysis/OperatorIdeal/Nuclear/Basic.lean);
  `ContinuousLinearMap.hilbertSchmidtEnergy` and `isCompactOperator_of_hilbertSchmidtEnergy_ne_top`
  (TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Columns.lean).
- **Spectral theorem:** `exists_hilbertBasis_forall_hasEigenvector`
  (TauCeti/Analysis/InnerProductSpace/Spectrum.lean): a compact self-adjoint operator has a
  Hilbert basis of eigenvectors.
- **Multivariate Gaussian density:** `multivariateGaussian_eq_withDensity`
  (TauCeti/Probability/Distributions/Gaussian/Density.lean).

### From KalmanFiltering

[KalmanFiltering](../KalmanFiltering/README.md) supplies `innovationCov`, `kalmanGain` and
`measurementUpdate` (§1.1), copied verbatim into `Suggested.lean`; the information form (§1.5)
for the route of 5.3; and §3.1, the conditional law of the state given the observations, at
time `0`, for the route of 5.3. Its observations start at time `0`, which is the one-step setting
used here.

### From MathematicalStatisticsNonparametric

[MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) supplies:
- §1.1: `hellingerAffinity` and `sqHellinger`, copied verbatim, and the computation of the
  squared Hellinger distance with any dominating measure, used in 4.2;
- §8.1: `centeredCovariance`, copied verbatim, with the covariance identity, positivity,
  compactness and trace, used throughout Layers 1 and 2;
- §8.2: `IsEigenExpansion`, copied verbatim, with existence and the trace norm of a positive
  compact operator, used in 1.1, 2.1 and 2.2;
- §8.3: the moments of the Karhunen–Loève coefficients and the convergence of the expansion,
  used in 2.1;
- §8.4: the Gaussian measures with a given trace-class covariance, used in 1.1 and, through
  Gaussian priors, in Layers 4 and 5.

### From StochasticCalculus

[StochasticCalculus](../StochasticCalculus/README.md) §8.1 owns the Cameron–Martin space of a
Gaussian measure on a separable Banach space and its translation theorem. Nothing here is stated
on its carriers; the shift criterion of 1.3 is the Hilbert-space form, and 1.3 defers the density
of an admissible shift to §8.1.

### From RegularizationOfLinearIllPosedProblems

The family roadmap RegularizationOfLinearIllPosedProblems supplies the Tikhonov operator
`tikhonov` (§4.1), copied verbatim, and its variational characterization (§4.1), for 5.3.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

No Tau Ceti roadmap owns these topics; each is material for a further roadmap built on this one.

- Approximation of posteriors: Hellinger bounds for the posteriors of approximate potentials
  `Φ_N` in terms of `|Φ - Φ_N|` [St, §4.4, p. 504]; [Su, Theorem 6.10, p. 105].
- The small-ball characterization of MAP estimators in infinite dimension, and the
  Banach-space setting of 5.1: the compact embedding of the Cameron–Martin space into every
  separable Banach space of full measure [St, Theorem 6.11, p. 530] and the null measure of an
  infinite-dimensional Cameron–Martin space [St, Lemma 6.10, p. 530].
- Function-space Markov chain Monte Carlo and its dimension-independent convergence [St, §5.2,
  p. 510].
- Small-noise limits and posterior consistency [St, Theorems 2.4 and 2.5, pp. 464–465].

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 92a6dba, states targets of Layers 1–5 in the modules NASC/GaussianApproximation.lean
and NASC/BayesianInverseProblems.lean: the trace of a Gaussian covariance (1.1), the shift
dichotomy in an eigenbasis (1.3), the Karhunen–Loève truncation error (2.1), the Gaussian-noise
posterior with its disintegration (3.2), the Hellinger bound for the squared distance (4.2), the
MAP minimizer with a compact embedding (5.1) and a one-step Gaussian update in information form
(5.3). All of them are stated with `sorry`; none is proved. Its modules are a cited source, not
the specification.

## References

- [St] A. M. Stuart, Inverse problems: a Bayesian perspective, *Acta Numerica* 19 (2010),
  451–559, §§2, 4, 5 and 6.
- [Su] T. J. Sullivan, *Introduction to Uncertainty Quantification*, Texts in Applied
  Mathematics 63, Springer, 2015, Chapters 2, 5, 6 and 11.
- [LSZ] K. Law, A. Stuart, K. Zygalakis, *Data Assimilation: A Mathematical Introduction*, Texts
  in Applied Mathematics 62, Springer, 2015, Chapters 1 and 3.
- [LPS] G. J. Lord, C. E. Powell, T. Shardlow, *An Introduction to Computational Stochastic PDEs*,
  Cambridge Texts in Applied Mathematics, Cambridge University Press, 2014, §§5.4 and 7.4.

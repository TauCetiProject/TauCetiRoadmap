# Roadmap: semiparametric statistics and missing data

**Summary.** This roadmap builds the information theory of semiparametric models and its
first applications, on Mathlib's Hilbert spaces `Lp ℝ 2 P`, orthogonal projections and
conditional expectations:
- the Hilbert geometry of scores: mean-zero `L²`, tangent spaces, efficient scores and
  information, and the conditional expectation as the adjoint of a pullback;
- differentiable paths of probability measures, their scores, and local asymptotic normality
  along a path;
- pathwise differentiable parameters, influence functions and the efficient influence function
  (canonical gradient), with the mean, the quantile and the semiparametric parameter `θ` of a
  model `P_{θ,η}` as worked cases;
- the lower bounds: the convolution and local asymptotic minimax theorems along paths, the
  characterization of efficiency by asymptotic linearity, and the semiparametric convolution
  bound `N(0, Ĩ⁻¹) * M`;
- efficient estimation: sample splitting as a measurable construction, the cross-fitting lemma,
  the one-step construction from a `√n`-consistent preliminary estimator, adaptive estimation of
  a centre of symmetry, and partially linear regression;
- missing data: missingness at random in measure-theoretic form, the observed-data likelihood
  and ignorability, augmented inverse-probability weighting, double robustness, and the
  efficient influence function and cross-fitted estimation of a missing mean;
- the EM algorithm: monotonicity, Fisher's identity, Louis's formula, the derivative of the EM
  map, fractions of missing information and the linear rate of convergence;
- multiple imputation: the conditional law of total variance, the posterior as a mixture over
  imputations, and the exact moments of Rubin's combining rules.

Headlines that restate a source result carry a theorem, definition,
section or equation locator with its printed page in a text listed under References; corollaries
and adaptations are derived in the proof routes.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. The headlines without a Lean name are those whose carrier is missing at the
pins; the module docstring of `Suggested.lean` lists them with the carrier each one lacks.

Suggested home: `TauCeti/Statistics/Semiparametric/` for Layers 1–5 and
`TauCeti/Statistics/MissingData/` for Layers 6–8.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Hilbert geometry of scores.** `L²₀(P)` as the orthogonal complement of the constants,
   tangent spaces as closed submodules, efficient scores and the efficient information matrix
   with the information-loss inequalities, the conditional expectation operator as the adjoint of
   the pullback isometry, and the projection formula `A (A† A)⁻¹ A†` for a score operator.
2. **Differentiable paths.** Paths differentiable in quadratic mean from the right, the score
   as a mean-zero element of `L²`, independence of the dominating measure, bounded tilts, every
   element of `L²₀(P)` as a score, the information-loss lemma for images, parametric and location
   paths, families of paths, and local asymptotic normality along a path.
3. **Pathwise differentiability.** Pathwise derivatives, influence functions, the efficient
   influence function and its characterizations, the variance decomposition
   `Pφ² = Pφ̃² + P(φ - φ̃)²`, the Cramér–Rao supremum over submodels, the mean, the quantile and
   the median model, the efficient influence function `Ĩ⁻¹ ℓ̃` of `θ` in a semiparametric model,
   the symmetric-location and partially linear efficient scores, and least favourable submodels.
4. **Lower bounds.** Regularity along paths, asymptotic linearity, the identification of the
   influence function of a regular asymptotically linear estimator, the convolution and local
   asymptotic minimax theorems for linear tangent sets, efficiency as asymptotic linearity in the
   efficient influence function, and the semiparametric convolution bound.
5. **Efficient estimation.** Sample splitting, cross-fitted averages and the cross-fitting lemma
   with no fold-size condition, the one-step theorem with data splitting, adaptive estimation of
   a centre of symmetry, and the identification of the partially linear coefficient.
6. **Missing data.** Missingness at random and completely at random, the observed-data density,
   ignorability for likelihood and Bayesian inference, the augmented inverse-probability-weighted
   estimating function and its mixed-bias identity, identification and the efficient influence
   function of a missing mean, and its cross-fitted estimator.
7. **EM.** The observed-data likelihood at fixed observed data, the EM criterion `Q`, the EM
   inequality and monotonicity, stationarity of fixed points, Fisher's identity, Louis's formula,
   the derivative of the EM map, the fractions of missing information and local linear
   convergence.
8. **Multiple imputation.** The law of total variance for nested σ-algebras,
   the posterior as a mixture over the posterior predictive law, and the exact moments of the
   combined estimate and of Rubin's total variance, scalar and vector.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- convergence in probability and in law on varying probability spaces, Le Cam's first and third
  lemmas, differentiability in quadratic mean of parametric models, local asymptotic normality of
  experiments, the asymptotic representation theorem, the convolution and local asymptotic
  minimax theorems for locally asymptotically normal experiments, and the multivariate central
  limit theorem: these
  belong to MathematicalStatisticsAsymptotic, and the exact list is under
  [Exact supplier contracts](#from-mathematicalstatisticsasymptotic);
- the Fisher information matrix `E ℓ̇ ℓ̇ᵀ` of a score function, owned by
  MathematicalStatisticsAsymptotic 7.3; `informationMatrix` of 1.3 is the same matrix for scores
  given as `Lp` classes, kept as a definition because Layer 1 uses Mathlib only;
- i.i.d. families, the weak law of large numbers, Slutsky's lemma, the `o_P` algebra and
  contiguity basics:
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md),
  8.2–8.6;
- Z-estimator theory beyond the monotone `√n`-consistency lemma of 5.3, and every empirical-process
  result. Nothing in this roadmap uses a Donsker class: the cross-fitting lemma replaces the
  Donsker condition by sample splitting, and the one-step theorem of 5.2 uses splitting in the
  same way.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace TauCeti, with `MeasureTheory` and
  `ProbabilityTheory` opened. `Suggested.lean` states the prototypes in the namespace
  `TauCetiRoadmap.MathematicalStatisticsSemiparametric`.
- **Scores live in `Lp ℝ 2 P`.** For a probability measure `P` on `X`, a score, an influence
  function and a nuisance score are elements of Mathlib's `Lp ℝ 2 P`, with its inner product
  `⟪f, g⟫ = ∫ f g dP`. `L²₀(P)` is `meanZeroL2 P := (span ℝ {Lp.const 2 P 1})ᗮ`. A function
  `g : X → ℝ` with `MemLp g 2 P` enters through `MemLp.toLp`; statements that need a pointwise
  function coerce the `Lp` element back, and all pointwise identities are `P`-a.e.
- **Tangent spaces are closed submodules.** For a set `T ⊆ Lp ℝ 2 P`,
  `tangentSpace P T : ClosedSubmodule ℝ (Lp ℝ 2 P)` is the closure of `span ℝ T`. Projections are
  Mathlib's `Submodule.starProjection` of `(tangentSpace P T).toSubmodule`; the instance
  `Submodule.HasOrthogonalProjection` comes from completeness of a closed submodule of a Hilbert
  space.
- **Paths.** A path is `Q : ℝ → Measure X` with `Q 0 = P`, each `Q t` a probability measure. It
  is differentiable with score `g` relative to a σ-finite `ν` dominating every `Q t`
  (`HasPathScore ν Q g`) when
  `t⁻¹ ‖√q_t - √q_0 - (t/2) g √q_0‖_{L²(ν)} → 0` as `t ↓ 0`, with `q_t` the real Radon–Nikodym
  derivative of `Q t` with respect to `ν` and the norm Mathlib's `eLpNorm` in `ℝ≥0∞`. The
  one-sided limit is van der Vaart's (25.13), p. 362. With `eLpNorm` a remainder that is not
  square integrable has infinite norm, so no junk value of a Bochner integral can make it small.
  Values of `Q t` for `t < 0` play no role.
- **Tangent sets are path families.** A tangent set is the range of the scores of a
  `PathFamily 𝓜 P ν ι`: paths `path i` through `P`, each in the model `𝓜 : Set (Measure X)` for
  small `t ≥ 0`, with scores `score i`. Pathwise derivatives, regularity and the lower bounds are
  relative to a path family, as in van der Vaart, §25.3, where the tangent set is any set of scores
  of chosen submodels.
- **Parameters along paths.** A Euclidean parameter is read along the paths as
  `value : ι → ℝ → EuclideanSpace ℝ (Fin k)`, with `value i t = ψ (path i t)` for a functional
  `ψ` on the model; the lower bounds only use these values. Pathwise derivatives are continuous
  linear maps `ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)` and the derivative along a path is
  one-sided, `HasDerivWithinAt (value i) (ψ' (score i)) (Ici 0) 0`.
- **Samples.** A sample of size `n` is `x : Fin n → X` with law `Measure.pi (fun _ ↦ P)`. Local
  alternatives along a path are the product laws of `path i (1/√n)`. An estimator sequence is
  `T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k)`, measurable for every `n`. For results on a
  sequence of random variables on one probability space, the first `n` of an i.i.d. sequence are
  used, as in the Conventions of Foundations.
- **Convergence.** Convergence in probability on varying spaces is `TendstoInProbability μ X l c` of
  MathematicalStatisticsAsymptotic 1.1: for every `ε > 0`, `μ i {ω | ε ≤ dist (X i ω) c} → 0` along
  `l`, with sets measured by the outer measure. Asymptotic linearity at `P` with influence function
  `φ` is `TendstoInProbability (P^n) (√n (Tₙ - θ) - n^{-1/2} Σ φ(xᵢ)) atTop 0`. Convergence in law
  is Mathlib's `TendstoInDistribution`; on one probability space convergence in probability is
  Mathlib's `TendstoInMeasure`.
- **Gaussian laws and convolution.** `N(0, Σ)` is Mathlib's `multivariateGaussian 0 Σ`, and
  the convolution `L = N(0, Σ) * M` is Mathlib's `Measure.conv`.
- **Risks are lower integrals.** In the local asymptotic minimax theorem risks are
  `∫⁻ ENNReal.ofReal (ℓ x)`, so an unbounded loss with infinite risk is not a junk `0`.
- **Missing data.** One full observation is `w = (r, x, y) : Bool × X × ℝ`, with `r = true`
  when the response is observed. The observed part is `observe w = (r, x, if r then y else 0)`.
  Missingness at random with propensity `π : X → ℝ` is the set-function identity of 6.1, not a
  statement about conditional probabilities given null events.
- **EM at fixed observed data.** The observed data are fixed throughout Layer 7. The missing
  part `z` ranges over a measurable space `Z` with a σ-finite reference measure `ρ`, the
  parameter over a finite-dimensional real inner product space `E`, and the complete-data
  density at the observed data is `f : E → Z → ℝ`. The observed likelihood is `∫ f θ dρ`.
- **Multiple imputation at fixed observed data.** Layer 8 fixes the observed data. The
  complete-data posterior of `θ` is a Markov kernel `κ : Kernel M ℝ` from the missing data and
  the posterior predictive law of the missing data is `ν : Measure M`; `κ ∘ₘ ν` is then the
  observed-data posterior (8.2). The between-imputation variance has divisor `D - 1`.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references). A locator marked *by the same argument* names the theorem whose
  proof the target follows when the hypotheses differ from those printed.

## Exact supplier contracts

### From Mathlib

- **Hilbert spaces:** `Lp`, `Lp.const`, `MemLp.toLp`, `eLpNorm`, `ClosedSubmodule`,
  `Submodule.topologicalClosure`, `Submodule.orthogonal` (`ᗮ`), `Submodule.starProjection`,
  `Submodule.norm_sq_eq_add_norm_sq_projection`, `InnerProductSpace.toDual`,
  `Matrix.posDef_gram_iff_linearIndependent`,
  `ContinuousLinearMap.adjoint`, `ContinuousLinearMap.orthogonal_range`,
  `ContinuousLinearMap.IsPositive`, `Ring.inverse`, and
  `Lp.compMeasurePreservingₗᵢ` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` and its
  composition file); density of simple functions `Lp.simpleFunc.isDenseEmbedding`
  (`Mathlib/MeasureTheory/Function/SimpleFuncDenseLp.lean`) and of bounded continuous functions
  `BoundedContinuousFunction.toLp_denseRange`
  (`Mathlib/MeasureTheory/Function/ContinuousMapDense.lean`).
- **Conditional expectation:** `condExp` (`μ[f | m]`), `condExpL2`,
  `condExp_condExp_of_le`, `setIntegral_condExp`, `condExp_mul_of_stronglyMeasurable_left`,
  `condVar` (`Var[X; μ | m]`), `condVar_ae_eq_condExp_sq_sub_sq_condExp` and
  `integral_condVar_add_variance_condExp` (`Mathlib/Probability/CondVar.lean`), `condDistrib`,
  `ProbabilityTheory.cond` (`μ[|s]`), `CondIndepFun`.
- **Measures and kernels:** `Measure.withDensity`, `Measure.rnDeriv`, `Measure.map`,
  `Measure.pi`, `Measure.prod`, `Measure.dirac`, `Measure.bind` (`κ ∘ₘ ν`), `Kernel.comp`
  (`∘ₖ`), `Kernel.prod` (`×ₖ`), `Kernel.id`, `IsMarkovKernel`, `StandardBorelSpace`,
  `Measurable.measurePreserving`.
- **Probability:** `iIndepFun`, `IndepFun`, `gaussianReal`, `variance`, `covarianceBilin` and
  `covarianceOperator` (`Mathlib/Probability/Moments/CovarianceBilin.lean`),
  `multivariateGaussian`, `Measure.conv`, `TendstoInMeasure`, `TendstoInDistribution`
  (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`).
- **Divergence:** `klDiv`, `llr`, `toReal_klDiv` and `integral_llr_add_sub_measure_univ_nonneg`
  (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`).
- **Calculus and spectra:** `IsMaxOn`, `HasDerivWithinAt`, `HasFDerivAt`, `gradient` and
  `HasGradientAt`, `ContDiffOn`, `hasFDerivAt_integral_of_dominated_of_fderiv_le`,
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `spectrum`, `Real.tanh`, `Matrix.PosDef`,
  `Matrix.PosSemidef`.

### From Tau Ceti

- **Quantiles:** `MeasureTheory.Measure.quantile` with `quantile_def` and
  `quantile_eq_of_le_cdf_iff` (`TauCeti/Probability/Quantile.lean`), for 3.3.
- **Mixture moments:** `ProbabilityTheory.Kernel.variance_comp` and
  `ProbabilityTheory.Kernel.covariance_comp` (`TauCeti/Probability/Moments/Mixture.lean`), for 8.1
  and 8.3.
- **Sample means:** `TauCeti.integral_norm_finiteMean_sub_sq` and `integral_finiteMean_sub_sq`
  (`TauCeti/Probability/Moments/SampleMean.lean`), the mean-square error of an average of
  pairwise independent variables, for 8.3.

### From MathematicalStatisticsFoundations

[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) supplies:
- 8.3: the algebra of convergence in probability on one probability space, including
  `O_P(1) · o_P(1) = o_P(1)` (5.1, 5.2, 6.5);
- 8.4: Slutsky's lemma without separability;
- 8.5: `IsIndependentIdenticallyDistributed`, the law of `(X 0, …, X (n-1))` as `Measure.pi`,
  and the weak law of large numbers;
- 8.6: contiguity of sequences of laws and the transfer of convergence in probability under
  contiguity.

`Suggested.lean` carries a local copy of `IsIndependentIdenticallyDistributed`.

### From MathematicalStatisticsAsymptotic

MathematicalStatisticsAsymptotic supplies exactly the following, and nothing else is used:
- **Convergence on varying spaces** (1.1): `TendstoInProbability` and boundedness in
  probability along a filter, the algebra of convergence in probability on varying spaces
  (sums, constant multiples, `O_P(1) · o_P(1) = o_P(1)`, transfer under contiguity) and Slutsky's
  lemma on varying spaces, used wherever the sample space is `Fin n → X` under a product law
  (2.3, 4.2, 4.4, 5.2, 5.3). `Suggested.lean` carries a local copy of `TendstoInProbability`.
- **Contiguity** (7.1): Le Cam's first lemma (contiguity from the limit laws of the likelihood
  ratios), applied to log-likelihood ratios converging in law to `N(-σ²/2, σ²)`, whose
  exponential has mean `1`, and mutual contiguity of `Qₙ,ₕ` and `Qₙ,₀` under local asymptotic
  normality at each fixed `h` (used in 2.3 and 5.3).
- **Le Cam's third lemma** (7.2), Gaussian form: joint convergence of `(Sₙ, log dQₙ/dPₙ)` to a
  Gaussian `(S, Λ)` with `Λ ~ N(-σ²/2, σ²)` under `Pₙ` gives `Sₙ → S + Cov(S, Λ)` under `Qₙ`.
- **Quadratic-mean differentiability and local asymptotic normality** (7.3): differentiability
  in quadratic mean of parametric densities within a set of parameters, used for the parametric
  paths of 2.1; local asymptotic normality within a set, used along the one-sided paths of 2.3
  with `k = 1`, `s = [0, ∞)` and `hₙ = 1`; and the fixed-`h` definition of a locally
  asymptotically normal sequence of
  experiments, used for the finite-dimensional subexperiments of 4.3. Location families are not
  taken from 7.3, which states only the case of a positive, continuously differentiable density
  (van der Vaart, Lemma 7.6, p. 95, and Example 7.8, p. 96); the location paths of an absolutely
  continuous density of finite Fisher information are owned here (2.1).
- **The asymptotic representation theorem** (7.4) for sequences of experiments `(Qₙ,h : h ∈ ℝᵐ)`
  that are locally asymptotically normal at each fixed `h`, with the limit `N(h, I⁻¹)` (van der
  Vaart, Theorem 7.10, p. 98), used in 4.4.
- **The convolution theorem** (7.5) under fixed-`h` local asymptotic normality: the limit law of a
  regular estimator sequence of `Ah` is `N(0, A I⁻¹ Aᵀ) * M` (van der Vaart, Theorem 8.8, p. 115),
  used in 4.3.
- **The local asymptotic minimax theorem** (7.6) under fixed-`h` local asymptotic normality, for a
  lower semicontinuous bowl-shaped loss and every measurable estimator sequence, with no tightness
  hypothesis (van der Vaart, Theorem 8.11, p. 118), used in 4.3.
- **The multivariate central limit theorem** (1.2) for i.i.d. vectors in `EuclideanSpace ℝ (Fin k)`.

## How to read the build

Layer 1 is Hilbert-space geometry and nothing else: every information bound of the roadmap is a
norm of a projection computed there. Layer 2 turns paths of measures into elements of `L²₀(P)` and
proves the one analytic fact that all later asymptotics rest on, local asymptotic normality along
a single path. Layer 3 identifies influence functions as the elements of `L²` whose inner
products with scores give the pathwise derivative; the efficient one is the projection onto the
tangent space. Layer 4 reduces the semiparametric lower bounds to the convolution and local
asymptotic minimax theorems of MathematicalStatisticsAsymptotic for locally asymptotically normal
experiments, by choosing finitely many orthonormal scores in a
linear tangent set and letting them fill the tangent space. Layer 5 constructs estimators that
attain the bounds; its only probabilistic tool beyond the weak law is conditional Chebyshev on
an independent fold, which is what sample splitting buys. Layers 6–8 are missing data. Layer 6
applies Layers 1–5 to the mean of a response missing at random. Layers 7 and 8 work at fixed
observed data and need only Layer 1 and Mathlib.

The layers are in build order: each needs only earlier layers and the suppliers. Layers 7 and 8
need nothing from Layers 2–6 and may be built first.

## Layer 1: Hilbert geometry of scores

### 1.1 Mean-zero `L²` and constants

- `meanZeroL2 P` (Conventions): `f ∈ meanZeroL2 P` exactly when `∫ f dP = 0`.
- `starProjection_meanZeroL2`: `L²(P) = span {1} ⊕ L²₀(P)`, the projection onto `L²₀(P)` is
  `f ↦ f - ∫ f dP`, and `‖f - ∫ f dP‖² = Var_P f`.
- `meanZeroL2_subset_closure_bounded`: bounded mean-zero elements are dense in `L²₀(P)`. Route:
  project a dense family of bounded elements of `L²(P)` (the simple functions) by
  `f ↦ f - ∫ f dP`, which is continuous and keeps boundedness.
- `meanZeroL2_subset_closure_boundedContinuous`: on a normal topological space with its Borel
  σ-algebra and a weakly regular `P` (Mathlib's hypotheses of
  `BoundedContinuousFunction.toLp_denseRange`), bounded continuous mean-zero functions are dense
  in `L²₀(P)`. Route: as before, projecting the bounded continuous functions, which keeps
  continuity.

These are the Hilbert-space facts of van der Vaart, §25.2, pp. 360–362.

*Needs:* Mathlib `Lp.const`, `Submodule.orthogonal`, `Lp.simpleFunc.isDenseEmbedding`,
`BoundedContinuousFunction.toLp_denseRange`.

**Checks.**

- `meanZeroL2`: on `X = {0, 1}` with `P = (1/2, 1/2)` it is the line through `(1, -1)`; the
  projection of `f = (1, 0)` is `(1/2, -1/2)`, of squared norm `1/4 = Var_P f`.
- `meanZeroL2` uses the inner product of `P`, not the counting inner product: for
  `P = (3/4, 1/4)`, `(1, -3)` has mean `3/4 - 3/4 = 0` and lies in `meanZeroL2 P`, while
  `(1, -1)`, orthogonal to the constants for counting measure, has mean `1/2` and does not.
- `meanZeroL2`: for a Dirac mass `P = δ₀`, `L²(P)` is one-dimensional and `meanZeroL2 P = ⊥`.

### 1.2 Tangent spaces

- `tangentSpace P T` (Conventions).
- `tangentSpace P T` is monotone in `T`, equals `T` when `T` is a closed submodule, and
  `tangentSpace P T ≤ meanZeroL2 P` when `T ⊆ meanZeroL2 P`, since `meanZeroL2 P` is closed.
- `tangentSpace_union`: `tangentSpace P (T ∪ T')` is the closure of
  `tangentSpace P T + tangentSpace P T'`; if the two
  are orthogonal it is their sum, and the projections add (van der Vaart, §25.2, p. 361).

*Needs:* 1.1; Mathlib `ClosedSubmodule`, `Submodule.topologicalClosure`.

**Checks.**

- `tangentSpace P ∅ = ⊥`: the closure of the span of the empty set is `{0}`.
- `tangentSpace`: on `X = {0, 1, 2}` with the uniform law, `T = {(1, -1, 0)}` gives the line
  through `(1, -1, 0)`, and `T = {(1, -1, 0), (1, -2, 1)}` gives all of `L²₀`, which is
  two-dimensional.
- `tangentSpace` is the closed span, not the closed cone: for `T = {(1, -1, 0)}` it contains
  `(-1, 1, 0)`, which no nonnegative multiple of the given score reaches.
- `tangentSpace` takes a closure: for the uniform law on `[0, 1]` and `T` the bounded measurable
  mean-zero functions, `span T = T` is not closed, since `x^{-1/4} - 4/3` is in `L²₀`
  (`∫₀¹ x^{-1/4} dx = 4/3`, `∫₀¹ x^{-1/2} dx = 2`) and unbounded; `tangentSpace P T = L²₀(P)` by
  1.1.

### 1.3 Efficient scores and information

- `efficientScore P N ℓ = ℓ - Π_N ℓ`, with `Π_N` the projection onto `tangentSpace P N`: the
  residual of `ℓ` after projection onto the nuisance tangent space.
- `efficientScore P N ℓ` is orthogonal to `N`, and it equals `ℓ` iff `ℓ ⊥ N`.
- `informationMatrix P ℓ` and `efficientInformationMatrix P N ℓ`, the Gram matrices of `ℓ` and of
  the efficient scores (van der Vaart, §25.4, p. 369). `informationMatrix P ℓ` is the Fisher
  information matrix of MathematicalStatisticsAsymptotic 7.3, `E ℓ̇ ℓ̇ᵀ` for the score
  `x ↦ (ℓ j x)ⱼ`, read on `Lp` classes; it is kept as a definition because Layer 1 uses Mathlib
  only.
- `posSemidef_informationMatrix_sub_efficient`: `I - Ĩ` is positive semidefinite, and `Ĩ = I`
  iff every coordinate of `ℓ` is orthogonal to `N`. This is the algebraic form of the
  adaptation criterion (van der Vaart, §25.4, pp. 369–370). Route: `I - Ĩ` is the Gram matrix of
  the projections `Π_N ℓᵢ`.
- `posSemidef_efficientInformationMatrix_sub_of_subset`: `N ⊆ N'` gives `Ĩ_N - Ĩ_{N'}` positive
  semidefinite. Route: `ℓ̃_N = ℓ̃_{N'} + (Π_{N'} - Π_N) ℓ` with the two terms orthogonal.
- `Ĩ` is positive definite iff the efficient scores are linearly independent in `L²` (Mathlib
  `Matrix.posDef_gram_iff_linearIndependent`).

*Needs:* 1.2; Mathlib `Submodule.starProjection`, `Submodule.norm_sq_eq_add_norm_sq_projection`,
`Matrix.PosSemidef`, `Matrix.posDef_gram_iff_linearIndependent`.

**Checks.** On `X = {0, 1, 2}` with the uniform law, `ℓ₁ = (1, 0, -1)` and `ℓ₂ = (1, -1, 0)`:

- `efficientScore`: with `N = {(1, -1, 0)}`, `⟪ℓ₁, n⟫ = 1/3`, `‖n‖² = 2/3`, so
  `Π_N ℓ₁ = (1/2, -1/2, 0)`, `ℓ̃₁ = (1/2, 1/2, -1)`, `Ĩ = 1/2` and `I = 2/3`;
  `I - Ĩ = 1/6 = ⟪ℓ₁, n⟫²/‖n‖²`.
- `efficientScore`: with `N = {(1, -2, 1)}` instead, `⟪ℓ₁, n⟫ = 0`, so `ℓ̃₁ = ℓ₁` and `Ĩ = I`: an
  adaptive direction.
- `efficientScore` projects onto the span, with the factor `1/‖n‖²`: the unnormalized residual
  `ℓ₁ - ⟪ℓ₁, n⟫ n = (2/3, 1/3, -1)` for `N = {(1, -1, 0)}` has inner product `1/9 ≠ 0` with `n`.
- `posSemidef_efficientInformationMatrix_sub_of_subset`: with `N' = {(1, -1, 0), (1, -2, 1)}`,
  which spans `L²₀`, `ℓ̃₁ = 0` and `Ĩ = 0 ≤ 1/2`.
- `informationMatrix` of `(ℓ₁, ℓ₂)` is `[[2/3, 1/3], [1/3, 2/3]]`, with determinant `1/3 > 0`.
- `informationMatrix` is the Gram matrix `E[ℓᵢ ℓⱼ]`, not a covariance: for the constant `ℓ = (1)`
  it is `1`, while the variance of a constant is `0`.
- `efficientInformationMatrix` of `(ℓ₁, ℓ₂)` with `N = {(1, -1, 0)}` is `[[1/2, 0], [0, 0]]`,
  since `ℓ̃₂ = 0`: singular, and the efficient scores are linearly dependent.
- `efficientInformationMatrix` with `N = ∅` is `informationMatrix`, since `tangentSpace P ∅ = ⊥`.
- `efficientInformationMatrix` (negative control): with `N = {(1, -2, 1)}`, `⟪ℓ₂, n⟫ = 1` and
  `‖n‖² = 2`, so `ℓ̃₂ = (1/2, 0, -1/2)` and `Ĩ₂₂ = 2/3 - 1²/2 = 1/6`; omitting the division by
  `‖n‖²` would give `2/3 - 1 = -1/3`, a negative diagonal entry.
- `informationMatrix` of `(ℓ₁, ℓ₁)` is `[[2/3, 2/3], [2/3, 2/3]]`, with determinant `0`: a repeated
  score gives a singular matrix.

### 1.4 The conditional expectation operator and score operators

- `pullbackL2 η m hm : Lp ℝ 2 (η.map m) →L[ℝ] Lp ℝ 2 η`, composition with a measurable map,
  an isometry by Mathlib's `Lp.compMeasurePreservingₗᵢ`.
- `condExpOperator η m hm := (pullbackL2 η m hm)†`, and `pullbackL2_condExpOperator_ae_eq`:
  composed with `m` it is `η[b | σ(m)]` a.e. (van der Vaart, §25.5, p. 375, where the score
  operator of `m(Y)` is this conditional expectation and its adjoint is the pullback).
- `condExpOperator_comp_pullbackL2`: `condExpOperator η m hm` after the pullback is the identity,
  since the pullback is an isometry, so it is onto `L²(η.map m)`; it is a contraction, and it maps
  `L²₀(η)` onto `L²₀(η.map m)`.
- `starProjection_closure_range_eq`: for a continuous linear `A : H → L²(P)` from a real Hilbert
  space with `A† A` invertible, the projection onto `tangentSpace P (range A)` is
  `A (A† A)⁻¹ A†` (van der Vaart, §25.2, p. 362).
- `isClosed_range_of_isUnit_adjoint_comp`: under the same invertibility the range of `A` is
  closed. In general `(range A)ᗮ = ker A†` is Mathlib's `ContinuousLinearMap.orthogonal_range`,
  and applied to `A†` it gives `(range A†)ᗮ = ker A` (van der Vaart, §25.2, pp. 361–362).

The adjoint form avoids a separate construction of conditional expectation on the image space:
`condExpOperator` reads `η[b | σ(m)]` on the sample space of `m`, which is what the
information-loss lemma 2.2 needs.

*Needs:* 1.1; Mathlib `Lp.compMeasurePreservingₗᵢ`, `ContinuousLinearMap.adjoint`,
`ContinuousLinearMap.orthogonal_range`, `condExp`, `condExpL2`, `setIntegral_condExp`.

**Checks.** `Y = {0, 1, 2}` uniform and `m y = 1{y ≥ 1}`, so that the image law gives mass `1/3`
to `0` and `2/3` to `1`:

- `pullbackL2` sends `(u at 0, v at 1)` to `(u, v, v)`, and both have squared norm
  `u²/3 + 2v²/3`.
- `pullbackL2` for `m = id` is the identity of `Lp ℝ 2 η`, since `η.map id = η`.
- `pullbackL2` is not onto: `b = (0, 1, 3)` is not constant on `{1, 2}`, and
  `pullbackL2 (condExpOperator b) = (0, 2, 2) ≠ b`.
- `condExpOperator`: for `b = (0, 1, 3)`, `condExpOperator b = (0 at 0, 2 at 1)`; its pullback
  `(0, 2, 2)` is `η[b | σ(m)]`.
- `condExpOperator` averages over the fibre: the value at `1` is
  `(1 · 1/3 + 3 · 1/3)/(2/3) = 2`; without the division by the image mass it would be `4/3`.
- `condExpOperator` is a contraction: `‖b‖² = 10/3` and `‖condExpOperator b‖² = (2/3) · 4 = 8/3`.
- `starProjection_closure_range_eq`: `H = ℝ`, `A a = a s` with `s ≠ 0`: `A† A = ‖s‖²` and the
  formula is the rank-one projection `f ↦ ⟪s, f⟫ s / ‖s‖²`.

### Examples

- The uniform law on `{0, 1, 2}`: `L²₀` is the plane `a + b + c = 0` (1.1). For the score
  `ℓ₁ = (1, 0, -1)` and the nuisance score `(1, -1, 0)` the efficient score is `(1/2, 1/2, -1)`,
  with `I = 2/3`, `Ĩ = 1/2` and information loss `1/6`; the nuisance score `(1, -2, 1)` is
  orthogonal to `ℓ₁` and costs nothing (1.3).
- On the same space with `m y = 1{y ≥ 1}`, `condExpOperator` sends `(0, 1, 3)` to the fibre
  averages `(0 at 0, 2 at 1)`, of squared norm `8/3 ≤ 10/3` (1.4).

### Dependencies

Mathlib only.

## Layer 2: differentiable paths

### 2.1 Path scores

- `HasPathScore ν Q g` (Conventions).
- `HasPathScore.memLp_integral_eq_zero`: a measurable path score at `P = Q 0` is in `L²(P)` and
  has mean zero (van der Vaart, Lemma 25.14, p. 363, first assertion). Route: the remainder is
  in `L²(ν)` for small `t`, and so are `√q_t` and `√q_0`, so `g √q_0 ∈ L²(ν)`; mean zero follows
  from `∫ (√q_t - √q_0)(√q_t + √q_0) dν = 0`, dividing by `t`.
- `hasPathScore_iff_of_absolutelyContinuous`: if every `Q t` is absolutely continuous with
  respect to both `ν` and `ν'`, the path scores relative to `ν` and `ν'` coincide. Route: pass
  to `ν + ν'`; the density with respect to `ν + ν'` is `q_t · dν/d(ν + ν')`, so the two remainder
  norms are equal.
- `HasPathScore.ae_eq` (uniqueness): two measurable path scores of one path of probability
  measures agree `Q 0`-a.e. Route: the difference of the two
  remainders is `(t/2)(g - g') √q_0`, of norm `o(t)`.
- **Parametric paths.** If densities `p : EuclideanSpace ℝ (Fin k) → X → ℝ` with respect to `ν`
  are differentiable in quadratic mean at `θ` within `s` with score `ℓ̇`
  (MathematicalStatisticsAsymptotic 7.3) and `θ + t a ∈ s` for `0 ≤ t < ε`, then
  `t ↦ ν.withDensity (p (θ + t a))` has path score `⟪a, ℓ̇⟫` relative to `ν` (van der Vaart,
  Example 25.15, pp. 363–364). Route: the remainder at `t` is the quadratic-mean remainder at
  `η = θ + t a`, which is `o(t ‖a‖)` in `L²(ν)`.
- **Location paths.** `hasPathScore_location`: let `η` be a probability density on `ℝ` that is
  absolutely continuous, `η x = η 0 + ∫₀ˣ η'` with `η'` locally integrable, and of finite Fisher
  information `I_η = ∫ η'²/η`. Then for every `θ` the path `t ↦ η(x - θ - t) dx` has score
  `-(η'/η)(x - θ)` relative to Lebesgue measure, with `η'/η := 0` where `η = 0`
  (Bickel–Klaassen–Ritov–Wellner, Appendix A.5, Corollary 1 (Corollary A.5.1), parts C and D,
  p. 460; §2.1, Example 2, p. 15). No positivity or continuity of `η'` is assumed, so the
  Laplace density is covered, which the continuously differentiable case of
  MathematicalStatisticsAsymptotic 7.3 (van der Vaart, Example 7.8, p. 96) is not. Route
  (Bickel–Klaassen–Ritov–Wellner, Corollary A.5.1, part A, and Hájek–Šidák's direct proof cited
  there): `η' = 0` a.e. on `{η = 0}`, since there `η` attains its minimum; `s = √η` is absolutely
  continuous with `s' = η'/(2√η)`, as the limit of `√(η + ε)` by dominated convergence with the
  bound `|η'|/(2√η) ∈ L²`; then
  `(s(· - t) - s)/t + s' = -∫₀¹ (s'(· - u t) - s') du`, whose `L²` norm is at most
  `sup_{0 ≤ u ≤ 1} ‖s'(· - u t) - s'‖₂ → 0` by continuity of translation in `L²(ℝ)`, and
  `-(t/2)(η'/η) √η = -t s'`.

*Needs:* Layer 1; Mathlib `Measure.rnDeriv`, `eLpNorm`; MathematicalStatisticsAsymptotic 7.3
(quadratic-mean differentiability, for parametric paths).

**Checks.**

- `HasPathScore`: the normal location path `Q t = N(t, 1)` relative to Lebesgue measure has
  score `g x = x`.
- `HasPathScore`: the path `Q t = Uniform[0, 1 + t]` has no score: on `[0, 1]` the difference
  `√q_t - √q_0` is `(1 + t)^{-1/2} - 1 ≈ -t/2`, and on `(1, 1 + t]` it is `(1 + t)^{-1/2} ≈ 1`,
  so the remainder has `L²` norm of order `√t` and `t⁻¹` times it diverges for every `g`.
- `HasPathScore` is one-sided: `Q t = N(|t|, 1)` has score `g x = x`; a two-sided definition
  would reject it, the left derivative giving `-x`.
- `HasPathScore.memLp_integral_eq_zero`: for `N(t, 1)`, `∫ x dN(0, 1) = 0` and
  `∫ x² dN(0, 1) = 1 < ∞`.
- `hasPathScore_location`: the Laplace density `e^{-|x|}/2` is absolutely continuous with
  `η' = -sign(x) η` and `I_η = ∫ η = 1`, though not differentiable at `0`; the score of the
  location path is `sign(x - θ)`.
- `hasPathScore_location`: the uniform density on `[-1, 1]` is not absolutely continuous on `ℝ`
  (it jumps at `±1`), and its location path has no score, by the computation for
  `Uniform[0, 1 + t]` above.

### 2.2 Constructions of paths

- `tiltPath P g C t`: the bounded tilt `dP_t = (1 + t g) dP` for `|t| C < 1`, and `P` otherwise.
  `hasPathScore_tiltPath`: for measurable `g` with `|g| ≤ C` and `∫ g dP = 0`, every `tiltPath`
  is a probability measure and the path has score `g` relative to `P` (van der Vaart, Example
  25.16, p. 364). Route: `√(1 + t g) - 1 - t g/2` is bounded by a multiple of `t² C²`.
- `exists_hasPathScore_of_mem_meanZeroL2`: every `g ∈ L²₀(P)` is the score, relative to `P`, of
  a path of probability measures through `P`, each absolutely continuous with respect to `P`
  (van der Vaart, Example 25.16, p. 364). Route: the path `dP_t = c(t) k(t g) dP` with
  `k(x) = 2 / (1 + e^{-2x})` and `c(t)` the normalizing constant; `0 < k < 2`,
  `k(0) = k'(0) = 1`, and `k'/k` takes values in `(0, 2)`, so the remainder is dominated by a
  multiple of `g² dP`, and dominated convergence applies.
- `hasPathScore_map`: if `Q` is a path on `Y` through `η` with score `b`, and `m : Y → X` is
  measurable, then `t ↦ (Q t).map m` has score `condExpOperator η m hm b`, relative to any
  σ-finite `ν'` dominating the image laws (van der Vaart, Lemma 25.34, p. 375). This is the
  information-loss lemma behind every missing-data tangent space.
- `HasPathScore.prod` (paths in a product): if paths of probability measures `t ↦ Q₁ t` and
  `t ↦ Q₂ t` have measurable scores `g₁`, `g₂` relative to `ν₁`, `ν₂`, then
  `t ↦ (Q₁ t).prod (Q₂ t)` has score `g₁ ⊗ 1 + 1 ⊗ g₂` relative to `ν₁ ⊗ ν₂`. Route:
  `√(q₁ₜ q₂ₜ) - √(q₁ q₂) = (√q₁ₜ - √q₁) √q₂ₜ + √q₁ (√q₂ₜ - √q₂)`, and the `L²` norm of a product
  of functions of separate coordinates is the product of the norms.

*Needs:* 2.1, 1.4; Mathlib `Measure.withDensity`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

**Checks.**

- `tiltPath`: `P` uniform on `[0, 1]`, `g x = 2x - 1`, `C = 1`: for `|t| < 1` the density
  `1 + t(2x - 1)` is positive and integrates to `1`; at `t = 1` the cut-off returns `P`, although
  `2x` is still a density; the score is unaffected, since only small `t` matter.
- `tiltPath`: without the cut-off, `t = -3` in the same example gives `1 - 3(2x - 1) = 4 - 6x`,
  negative for `x > 2/3`; `ENNReal.ofReal` clips it to a measure of mass
  `∫₀^{2/3} (4 - 6x) dx = 4/3`, not a probability measure.
- `tiltPath P 0 C t = P` for every `t` and `C`, the density being `1`.
- `exists_hasPathScore_of_mem_meanZeroL2`: `k(0) = 1`, `k'(x) = 4e^{-2x}/(1 + e^{-2x})²` gives
  `k'(0) = 1`, and `k'/k = 2e^{-2x}/(1 + e^{-2x}) ∈ (0, 2)`.
- `hasPathScore_map`: for `Q t = N(t, 1) ⊗ N(0, 1)` on `ℝ²` and `m (y₁, y₂) = y₁ + y₂`, the image
  path is `N(t, 2)` with score `x/2`, and `E[Y₁ | Y₁ + Y₂] = (Y₁ + Y₂)/2`.

### 2.3 Path families and local asymptotic normality along a path

- `PathFamily 𝓜 P ν ι` (Conventions), with the probability-measure field an instance.
- `tendstoInProbabilityZero_logLikelihoodRatio_path`: for a path with score `g` relative to `ν`,
  under `P^n`,
  `Σᵢ log (dQ_{1/√n}/dP)(xᵢ) = n^{-1/2} Σᵢ g(xᵢ) - ‖g‖²/2 + o_P(1)` (van der Vaart, Lemma 25.14,
  p. 363). The Radon–Nikodym derivative is that of `Q t` with respect to `P` (of its absolutely
  continuous part). Route: for measurable `g`, the path score makes `t ↦ d(Q t)/dν`
  differentiable in quadratic mean within `[0, ∞)` at `0` with `k = 1` and score `g` (2.1 gives
  `g ∈ L²(P)`, and the remainder is square integrable for small `t`, so its Bochner integral is
  the squared `eLpNorm`). The local asymptotic normality within a set of
  MathematicalStatisticsAsymptotic 7.3, with `hₙ = 1`, gives the multiplicative expansion
  `ratio · exp(-Δₙ + ‖g‖²/2) → 1` in probability; taking logarithms on the event of a positive
  ratio, whose probability tends to one, gives the additive form, and Lean's `log 0 = 0` is never
  used.
- `tendsto_pi_path_iff` (contiguity): in the same setting `P^n` and `Q_{1/√n}^n` are mutually
  contiguous: for measurable events `Aₙ`, `P^n(Aₙ) → 0` iff `Q_{1/√n}^n(Aₙ) → 0`. Route: the
  previous item, the central limit theorem and Le Cam's first lemma
  (MathematicalStatisticsAsymptotic 7.1).
- `tendstoInDistribution_path` (joint convergence): in the same setting, for `φ ∈ L²₀(P)`, under
  `P^n` the pair `(n^{-1/2} Σ φ(xᵢ), Σ log (dQ_{1/√n}/dP)(xᵢ))` converges in law to the Gaussian
  with mean `(0, -‖g‖²/2)` and covariance matrix `[[‖φ‖², ⟪φ, g⟫], [⟪φ, g⟫, ‖g‖²]]`, and
  `n^{-1/2} Σ φ(xᵢ) → N(⟪φ, g⟫, ‖φ‖²)` in law under `Q^n_{1/√n}`. Route: the multivariate
  central limit theorem with the expansion of the first item, and Le Cam's third lemma
  (MathematicalStatisticsAsymptotic 7.2).

*Needs:* 2.1–2.2; Foundations 8.5, 8.6; MathematicalStatisticsAsymptotic 1.1, 7.1 and 7.2 (Le Cam's
first and third lemmas), 7.3 (local asymptotic normality within a set) and 1.2 (multivariate
central limit theorem).

**Checks.**

- `PathFamily`: the bounded tilts `tiltPath P g C`, with `g` ranging over bounded measurable
  mean-zero functions, form a path family in the model of all probability measures, with
  `ν = P` and scores `g` (2.2).
- `PathFamily`: the single path `N(t, 1)` in the normal location model, with `ν` Lebesgue measure
  and score `x`.
- `PathFamily` asks for membership in the model only for small `t ≥ 0`: `N(t, 1)` is a path of
  the model `{N(θ, 1) : θ ≥ 0}` through `N(0, 1)`, although `N(t, 1)` leaves the model for
  `t < 0`; the reversed path `N(-t, 1)` is not.
- `tendstoInProbabilityZero_logLikelihoodRatio_path`: for `N(t, 1)` the log-likelihood ratio at
  `t = 1/√n` is `n^{-1/2} Σ xᵢ - 1/2` exactly, with `‖g‖² = 1`: the remainder is `0`.
- Joint convergence: for `N(t, 1)` and `φ x = x`, `n^{-1/2} Σ xᵢ ~ N(1, 1)` exactly under
  `N(1/√n, 1)^n`, matching `⟪φ, g⟫ = 1`.

### Examples

- The normal location path `N(t, 1)` has score `x` relative to Lebesgue measure (2.1), and its
  log-likelihood ratio at `t = 1/√n` is `n^{-1/2} Σ xᵢ - 1/2` exactly, the expansion of 2.3 with
  remainder `0`.
- The two-point law `P = (1 - p, p)` on `{0, 1}` and `g = x - p`: for `|t| < 1`,
  `tiltPath P g 1 t` puts mass `p (1 + t (1 - p))` on `1` and `(1 - p)(1 - t p)` on `0`, and the
  score `x - p` has `‖x - p‖² = p(1 - p)` (2.2).

### Dependencies

Layer 1; Foundations 8.5, 8.6; MathematicalStatisticsAsymptotic as listed.

## Layer 3: pathwise differentiability and efficient influence functions

### 3.1 Influence functions and the canonical gradient

- `HasPathwiseDerivative F value ψ'` (Conventions; van der Vaart, §25.3, p. 363).
- `IsInfluenceFunction F ψ' φ`: `ψ' (score i) = (⟪φ j, score i⟫)ⱼ` for every path.
- `IsInfluenceFunction.apply_eq_inner`: if `φ` is an influence function, the identity
  `ψ' h = (⟪φ j, h⟫)ⱼ` holds on all of
  `tangentSpace P (range score)`, by linearity and continuity.
- `efficientInfluence F ψ' j`: the Riesz representer of the `j`-th coordinate of `ψ'`,
  projected onto the tangent space. `efficientCovariance F ψ'` is its Gram matrix.
- `isInfluenceFunction_iff_starProjection`: `φ` is an influence function iff each `φ j` projects
  onto `efficientInfluence F ψ' j` (van der Vaart, §25.3, p. 363). Route: with `r_j` the Riesz
  representer, `φ` is an influence function iff `φ j - r_j` is orthogonal to every score.
- `isInfluenceFunction_efficientInfluence`: consequently the efficient influence function is an
  influence function, and it is the unique influence function in the tangent space (the
  canonical gradient).
- `norm_sq_eq_efficientInfluence_add`: for every influence function,
  `‖φ j‖² = ‖φ̃ j‖² + ‖φ j - φ̃ j‖²`; and `posSemidef_gram_sub_efficientCovariance`:
  `Pφφᵀ - Pφ̃φ̃ᵀ` is positive semidefinite, being the Gram matrix of `φ - φ̃`, which is orthogonal
  to the tangent space.
- `isLUB_cramerRao_efficientInfluence`: for `k = 1` and a tangent set with a nonzero score,
  `‖φ̃‖²` is the least upper bound of `⟪φ̃, g⟫²/‖g‖²` over nonzero `g` in the tangent space, the
  Cramér–Rao bounds of the one-dimensional submodels (van der Vaart, Lemma 25.19, p. 365). Without
  a nonzero score the set is empty and has no least upper bound in `ℝ`.

*Needs:* Layers 1–2; Mathlib `InnerProductSpace.toDual`.

**Checks.** Two families serve: the bounded tilts of a two-point law `P = (1 - p, p)` on
`{0, 1}`, whose tangent space is all of `L²₀`, spanned by `x - p`, with the mean `ψ(P) = p`; and
the single path `N(t, 1)` with score `x` and `value t = t`.

- `HasPathwiseDerivative`: the mean along the tilt by `g` is `p + t ⟪x, g⟫`, so
  `ψ' g = ⟪x, g⟫` is a pathwise derivative.
- `HasPathwiseDerivative`: along `N(t, 1)`, `value t = t` has derivative `1 = ⟪x, x⟫`, so
  `ψ' h = ⟪x, h⟫` is a pathwise derivative.
- `HasPathwiseDerivative` is one-sided: along `N(|t|, 1)` with score `x`, `value t = |t|` has
  right derivative `1 = ⟪x, x⟫` and qualifies, although it has no two-sided derivative at `0`.
- `IsInfluenceFunction`: in the two-point family, `x` and `x - p` are influence functions of
  `ψ' g = ⟪x, g⟫`, and only `x - p` is in the tangent space.
- `IsInfluenceFunction`: for `N(t, 1)`, `x + c` is an influence function for every constant `c`
  (`⟪x + c, x⟫ = 1`), while `2x` is not (`⟪2x, x⟫ = 2 ≠ 1`).
- `efficientInfluence`: `x - p` in the two-point family, and `x` for `N(t, 1)`.
- `efficientInfluence` depends on `ψ'` only through the tangent space: for `N(t, 1)` with
  `ψ' h = ⟪x + x², h⟫`, the Riesz representer is `x + x²`, an influence function of variance
  `E(X + X²)² = 4`, and its projection onto the span of `x` is `x`, since
  `⟪x + x², x⟫ = 1`.
- `efficientCovariance`: `p(1 - p)` in the two-point family, and `1` for `N(t, 1)`; the
  unprojected representer `x + x²` would give `4`.
- `IsInfluenceFunction`: for a family with no paths (`ι` empty) every `φ` is an influence
  function of every `ψ'`, the condition ranging over the paths.
- `efficientInfluence`: for a family with no paths the tangent space is `⊥`, and
  `efficientInfluence F ψ' j = 0` for every `ψ'` and `j`.
- `efficientCovariance`: for a family with no paths it is the zero matrix.
- `efficientCovariance`: in the two-point family with `ψ(P) = (p, 2p)`, so that
  `ψ' g = (⟪x, g⟫, 2⟪x, g⟫)`, the efficient influence function is `(x - p, 2(x - p))` and the
  covariance is `p(1 - p) [[1, 2], [2, 4]]`, of determinant `0`: positive semidefinite, not
  positive definite.
- `norm_sq_eq_efficientInfluence_add`: in the two-point family `‖x‖² = p` and
  `‖x - p‖² = p(1 - p)`, and `p = p(1 - p) + p²`, the last term being `‖p‖²`.

### 3.2 Two calculus rules

- **Chain rule** (`hasPathwiseDerivative_comp`). If `ψ'` is a pathwise derivative of `value` and
  `h : ℝᵏ → ℝᵐ` is differentiable at the common value `θ = value i 0` with derivative `Dh`, then
  `Dh ∘ ψ'` is a pathwise derivative of `h ∘ value`, with efficient influence function `Dh φ̃`
  (Bickel–Klaassen–Ritov–Wellner, §3.3, Corollary 2, p. 63, for continuously differentiable `h`).
  Route: the chain rule for one-sided derivatives along each path, and linearity of the projection.
- **Score operators** (`exists_hasPathwiseDerivative_iff_mem_range_adjoint`). For a path family
  indexed by a real Hilbert space `H`, the path in direction `b ∈ H` having score `A b` for a
  continuous linear score operator `A : H →L L²(P)`, a parameter with derivative `b ↦ ⟪χ, b⟫_H` is
  pathwise differentiable relative to `range A` iff `χ ∈ range A†`, and then the efficient influence
  function is the `ψ̃` with `A† ψ̃ = χ` in `closure (range A)`; if `χ = A† A b₀` then `ψ̃ = A b₀`
  (van der Vaart, Theorem 25.31, p. 373). With `A† A` invertible this is `ψ̃ = A (A† A)⁻¹ χ`, by
  1.4. Route: a continuous `ψ'` on `L²(P)` is `⟪r, ·⟫`, and `⟪r, A b⟫ = ⟪A† r, b⟫`; uniqueness holds
  because `closure (range A) ∩ ker A† = 0`.

*Needs:* 3.1, 1.4.

### 3.3 The mean, the quantile and the median model

- `hasDerivAt_integral_tiltPath`: for `f ∈ L²(P)` and a bounded measurable mean-zero `g`, the
  mean `∫ f dP_t` along the tilt by `g` has derivative `⟪f - P f, g⟫` at `0` (van der Vaart,
  Example 25.24, p. 368). Route: `∫ f (1 + t g) dP = P f + t ⟪f, g⟫` for `|t| C < 1`, and
  `⟪P f, g⟫ = 0`.
- `efficientInfluence_integral_tiltPath`: consequently the canonical gradient of `P ↦ P f` in the
  nonparametric model, relative to the path family of bounded tilts, is `f - P f`: the bounded
  mean-zero functions are dense in `L²₀(P)` (1.1).
- `hasDerivAt_quantile_tiltPath`: if `P` has a density `f` continuous and positive at
  `q = P.quantile p`, `0 < p < 1`, then along bounded tilts the quantile has derivative
  `∫ (p - 1{x ≤ q}) g dP / f(q)`. Route: the tilted distribution function is
  `F_t(x) = F(x) + t ∫_{-∞}^x g dP`, strictly increasing near `q` because `f ≥ f(q)/2` near `q`
  and `1 + t g ≥ 1 - |t| C`, so `F_t(q_t) = p` determines `q_t` (Tau Ceti
  `quantile_eq_of_le_cdf_iff`), and `(q_t - q) f(q) (1 + o(1)) = -t ∫_{-∞}^{q_t} g dP`.
- `efficientInfluence_quantile_tiltPath`: consequently, under the same hypotheses, the canonical
  gradient of the quantile relative to the path family of bounded tilts is
  `(p - 1{x ≤ q})/f(q)`, with variance `p(1 - p)/f(q)²`.
- **The median model** (`efficientInfluence_median`). In the model of laws on `ℝ` with a density
  that is continuous on an open neighbourhood of its median `m` and positive at `m`, the median is
  pathwise differentiable relative to the bounded continuous tilts, with efficient influence
  function `(1/2 - 1{x ≤ m})/f(m)` and information bound `4 f(m)²`. Each bounded continuous tilt
  stays in the model for small `t ≥ 0`: the tilted density `(1 + t g) f` is continuous on the same
  neighbourhood `U` of `m`, and by `hasDerivAt_quantile_tiltPath` the tilted median `m_t` tends to
  `m`, so `m_t ∈ U` and `f(m_t) > 0` for small `t`. Continuity at the median alone does not suffice:
  a tilt can move the median onto a jump of `f` accumulating at `m`. The bounded continuous
  mean-zero functions are dense in `L²₀(P)` (1.1), so the tangent space is `L²₀(P)` and the
  canonical gradient is the efficient influence function.

Written as a location model `η(x - θ)` with `η` unknown, ranging over densities with median zero
that are continuous near `0` and positive at `0`, this is the information bound `4 η(0)²` for `θ`.
With `η` known, the parametric location model of 3.4 and 5.3 is a submodel.

*Needs:* 3.1, 2.2; Tau Ceti `Measure.quantile`.

**Checks.**

- `hasDerivAt_quantile_tiltPath`: for `N(0, 1)` and `p = 1/2`, `f(0) = 1/√(2π)` and the variance
  bound is `(1/4) · 2π = π/2 ≈ 1.5708`; the information `4 f(0)² = 2/π ≈ 0.6366` is below the
  location information `1` of the normal family, as it must be, since the median model contains
  the normal location model.
- `hasDerivAt_integral_tiltPath`: for `f x = x²` under `N(0, 1)` the bound is
  `Var(X²) = 2`; `f` is unbounded, and only `f ∈ L²(P)` is used.

### 3.4 Semiparametric models: the efficient influence function of `θ`

- `efficientInfluence_semiparametric`: let every path `i` have score `aᵢᵀ ℓ̇ + gᵢ` with
  `gᵢ ∈ N` and move the parameter to `θ + t aᵢ`, let the scores span the same closed subspace as
  `ℓ̇₁, …, ℓ̇ₖ` and `N`, and let `Ĩ` be positive definite. Then the parameter is pathwise
  differentiable, with efficient influence function `Ĩ⁻¹ ℓ̃` (van der Vaart, Lemma 25.25,
  p. 369). Route: `⟪ℓ̃ⱼ, aᵢᵀ ℓ̇ + gᵢ⟫ = (Ĩ aᵢ)ⱼ`, since `ℓ̃ⱼ ⊥ N` and `⟪ℓ̃ⱼ, ℓ̇ₗ⟫ = Ĩⱼₗ`, so
  `h ↦ Ĩ⁻¹ ⟪ℓ̃, h⟫` is a continuous pathwise derivative; its Riesz representer `Ĩ⁻¹ ℓ̃` already
  lies in the tangent space.
- **Symmetric location** (`efficientScore_symmetricLocation`; van der Vaart, Example 25.27, p. 370):
  in the model `η(x - θ)` with `η` as in `hasPathScore_location` and moreover even, with an odd
  version `η'` of its derivative, the location path has score `-(η'/η)(x - θ)`
  (`hasPathScore_location`, 2.1), which is odd in `x - θ`, and the nuisance scores are even
  functions of `x - θ`, so they are orthogonal: for every set of nuisance scores that are even
  functions of `x - θ`, the efficient score is the ordinary score and `Ĩ = I_η`. Route: reflection
  `x ↦ 2θ - x` preserves `locationLaw η θ`, so even and odd functions are orthogonal. The nuisance
  paths are the tilts of `η` by bounded even `g` that are continuously differentiable with bounded
  derivative: `(1 + t g) η` is again symmetric and absolutely continuous, with Fisher information at
  most `2 ∫ (1 + t g) η'²/η + 2 t² ∫ g'² η/(1 + t g) < ∞`, so the path stays in the model; a tilt by
  a discontinuous `g` would leave it.
- **Partially linear regression** (`efficientScore_partiallyLinear`). Let `(D, X, Y)` with `D ∈ ℝᵈ`,
  `E ‖D‖² < ∞`, satisfy `Y = Dᵀβ + g(X) + ε` with `ε ~ N(0, σ²)`, `σ² > 0`, independent of `(D, X)`,
  and `g` ranging over the measurable functions with `E g(X)² < ∞`. The nuisance scores are the
  mean-zero `a(D, X)` (changes of the law of `(D, X)`), `k(X) ε/σ²` (changes of `g`), and, when `σ²`
  is unknown, `ε² - σ²`; the score for `β` is `D ε/σ²`. Then the efficient score is `ℓ̃ = ε V/σ²`
  with `V = D - E[D | X]`, `Ĩ = Q/σ²` with `Q = E[V Vᵀ]`, and for `Q` positive definite
  `Ĩ⁻¹ = σ² Q⁻¹` and the efficient influence function is `Q⁻¹ V ε`, with covariance `σ² Q⁻¹`
  (Bickel–Klaassen–Ritov–Wellner, §4.3, Example 5, pp. 107–108, with the efficient score (18),
  p. 110, for known `σ` and known law of `(D, X)`; van der Vaart, §25.11.3, pp. 415 and 418, for
  `σ = 1`). Route, exact: `D ε/σ² = ε V/σ² + E[D | X] ε/σ²`, and the second term is in the closure
  of the scores `k(X) ε/σ²`, since `E ‖E[D | X]‖² ≤ E ‖D‖²`; `ε V/σ²` is orthogonal to `a(D, X)`
  because `E[ε | D, X] = 0`, to `k(X) ε` because `E[ε² V k(X)] = σ² E[k(X) E[V | X]] = 0`, and to
  `ε² - σ²` because `E[ε³] = E[ε] = 0`; by independence `E[ε² V Vᵀ]/σ⁴ = Q/σ²`. The same efficient
  score results for every set of nuisance scores among these that contains all the `k(X) ε/σ²`, in
  particular when `σ²` or the law of `(D, X)` is known. The paths are bounded tilts of the law of
  `(D, X)`, the shift `σ² ↦ σ² (1 + t)`, and the shifts `g + t k` with bounded `k` and `β + t a`,
  whose path scores come from `hasPathScore_location` (2.1) for the normal density applied
  conditionally on `(D, X)`, integrated by dominated convergence with the Hellinger bound
  `∫ (√φ(e - u) - √φ(e))² de = 2 (1 - e^{-u²/(8σ²)}) ≤ u²/(4σ²)` for the `N(0, σ²)` density `φ` and
  `E ‖D‖² < ∞`.

*Needs:* 3.1, 1.3, 2.1–2.2.

**Checks.**

- Symmetric location: for the logistic density `η = e^{-x}/(1 + e^{-x})²`, `η'/η = 1 - 2F` with
  `F` the logistic distribution function, and `I_η = 1/3`; for `N(0, 1)`,
  `I_η = 1`.
- Partially linear: with `D = X + U`, `X, U` independent `N(0, 1)`, `V = U`, `Q = 1`, and
  `Ĩ = 1/σ²`, while the information with `g` known is `E[D²]/σ² = 2/σ²`: the price of the unknown
  `g` is half the information.
- `efficientInfluence_semiparametric`: with `N = ∅` it is the parametric `I⁻¹ ℓ̇`.

### 3.5 Least favourable submodels

- `efficientInformation_le_norm_sq_add`: among the scores `ℓ + g` with `g` in the nuisance
  tangent space, `‖ℓ + g‖² ≥ ‖ℓ̃‖² = Ĩ`, with equality exactly when `ℓ + g = ℓ̃`, that is,
  `g = -Π_N ℓ` (the one-dimensional case). A submodel with score `ℓ̃` is least favourable (van
  der Vaart, §25.3, p. 362, for the notion, and §25.5.1, p. 374, for the least favourable
  direction). Route: `ℓ + g = ℓ̃ + (Π_N ℓ + g)` with the two terms orthogonal.
- `posSemidef_gram_add_sub_efficientInformationMatrix`: the matrix case, `Gram(ℓ + g) ≥ Ĩ` in the
  Loewner order for nuisance directions `gᵢ` in the nuisance tangent space, by the same
  orthogonal decomposition.

*Needs:* 1.3.

### Examples

- In the two-point family of the Checks of 3.1 the mean `ψ(P) = p` has efficient influence
  function `x - p` and efficient variance `p(1 - p)`, the variance of one Bernoulli observation;
  `x` is an influence function outside the tangent space, of second moment `p` (3.1).
- Along `N(t, 1)` with `value t = t` the efficient influence function is `x`, of variance `1`
  (3.1); in the median model at `N(0, 1)` the variance bound is `π/2 ≈ 1.5708` (3.3).

### Dependencies

Layers 1–2; Tau Ceti quantiles.

## Layer 4: regular estimators and lower bounds

### 4.1 Regularity and asymptotic linearity

- `IsRegularAlong F value T L`: for every path, `√n (Tₙ - value i 0)` converges in law to `L`
  under `P^n`, and `√n (Tₙ - value i (1/√n))` converges in law to `L` under
  `(path i (1/√n))^n` (van der Vaart, §25.3, p. 365). The limit law is the same for every path
  and agrees with the null limit, as in Hájek's local regularity, where the parameter sequences
  `θₙ` with `√n |θₙ - θ|` bounded include `θₙ = θ` (Bickel–Klaassen–Ritov–Wellner, §2.2,
  Definition 7, p. 21).
- `IsAsymptoticallyLinear P T θ φ` (Conventions).

*Needs:* Layer 2; Mathlib `TendstoInDistribution`.

**Checks.**

- `IsRegularAlong`: the sample mean in the normal location model, along the path `N(t, 1)` with
  `value t = t`, is regular with limit `N(0, 1)`: `√n (x̄ - 1/√n) ~ N(0, 1)` exactly under
  `N(1/√n, 1)^n`.
- `IsRegularAlong`: Hodges' estimator `Tₙ = X̄ 1{|X̄| ≥ n^{-1/4}}` at `θ = 0` is not regular:
  under `N(h/√n, 1)^n`, `|X̄| < n^{-1/4}` with probability tending to one, so
  `√n (Tₙ - h/√n) → -h`, a limit depending on `h`, while the null limit is `δ_0`.
- `IsRegularAlong` needs its null clause: for the single path `N(t, 1)`, `value t = t` and
  `Tₙ = 0`, the alternatives alone give the limit `δ_{-1}` and would be regular; `Tₙ` is
  asymptotically linear in `φ = 0`, but `ψ'(g) = 1 ≠ 0 = ⟪φ, g⟫`, so `φ` is not an influence
  function. The null limit `δ_0` excludes it.
- `IsAsymptoticallyLinear`: `Tₙ = x̄` under a law with mean `θ` and finite variance is
  asymptotically linear in `x - θ`, with remainder `0`; `Tₙ = x̄ + 1/n` is as well, with
  remainder `n^{-1/2}`.
- `IsAsymptoticallyLinear`: `Tₙ = x̄ + n^{-1/2}` is not asymptotically linear in `x - θ`: the
  remainder is `1` for every `n ≥ 1`.
- `IsAsymptoticallyLinear`: Hodges' estimator at `θ = 0` is asymptotically linear in `φ = 0`,
  since `√n Tₙ = 0` with probability tending to one; it is not regular, so 4.2 does not apply.

### 4.2 Regular asymptotically linear estimators

- `isInfluenceFunction_of_isRegularAlong`: if `T` is regular along `F`, asymptotically linear at
  `P` in `φ ∈ L²₀(P)ᵏ`, and the parameter has pathwise derivative `ψ'`, then `φ` is an influence
  function of `ψ'` (Bickel–Klaassen–Ritov–Wellner, §3.3, Proposition 1, part A, p. 65). Route:
  under `P^n` the central limit theorem gives `√n (Tₙ - θ) → N(0, Pφφᵀ)`, so the null clause of
  regularity makes `L = N(0, Pφφᵀ)`; by 2.3, `√n (Tₙ - θ) → N(⟪φ, g⟫, Pφφᵀ)` under the path, and
  `√n (value (1/√n) - θ) → ψ'(g)`, so the alternative clause makes `N(⟪φ, g⟫ - ψ'(g), Pφφᵀ) = L`,
  and a probability measure on `ℝᵏ` equal to a translate of itself by `a` has `a = 0`.
- `posSemidef_gram_sub_efficientCovariance_of_isRegularAlong`: consequently, in the same setting,
  the asymptotic covariance `Pφφᵀ` of a regular asymptotically linear estimator dominates
  `Pφ̃φ̃ᵀ` (3.1); this is the form of the bound for asymptotically linear estimators.

*Needs:* 4.1, 3.1, 2.3; MathematicalStatisticsAsymptotic 1.1.

### 4.3 Convolution and local asymptotic minimax

- `exists_conv_of_isRegularAlong`: let the tangent set be a linear space (the family is
  nonempty and every linear combination of two scores is a score of the family, so `0` is a
  score), the parameter be pathwise differentiable with common value at `t = 0`, and `T`
  regular with limit `L`. Then
  `L = N(0, Pφ̃φ̃ᵀ) * M` for a probability measure `M` (van der Vaart, Theorem 25.20, p. 366;
  Bickel–Klaassen–Ritov–Wellner, §3.3, Theorem 2, p. 63; Kosorok, Theorem 18.3, p. 338).
- `lintegral_gaussian_le_iSup_liminf`: under the same tangent-set hypothesis, for a loss `ℓ ≥ 0`
  that is symmetric with closed convex sublevel sets and every measurable estimator sequence,
  with no tightness hypothesis,
  `∫⁻ ℓ dN(0, Pφ̃φ̃ᵀ) ≤ sup_I liminf_n max_{i ∈ I} E_{path i (1/√n)} ℓ(√n (Tₙ - value i (1/√n)))`,
  the supremum over finite sets of paths (van der Vaart, Theorem 25.21, p. 366, whose subconvex
  losses are these).
- Route for both (van der Vaart, proof on p. 366): fix an orthonormal family `g₁, …, g_m` in the
  tangent set, choose a path for each `hᵀg`, `h ∈ ℝᵐ`; by 2.3 the experiments
  `(path_{hᵀg}(1/√n)^n : h ∈ ℝᵐ)` are locally asymptotically normal at each fixed `h` with
  information the identity (the Fisher information matrix of MathematicalStatisticsAsymptotic 7.3
  of the orthonormal scores `g₁, …, g_m`, which is `informationMatrix` of 1.3) and central
  sequence `n^{-1/2} Σ g(xᵢ)`, relative to the path chosen for `h = 0`, and `√n (value_{hᵀg}(1/√n) - θ) → A h` with `A = (⟪φ̃ⱼ, g_l⟫)`. The convolution
  theorem and the local asymptotic minimax theorem of MathematicalStatisticsAsymptotic (7.5,
  van der Vaart, Theorem 8.8; 7.6, van der Vaart, Theorem 8.11, which needs no tightness) give
  the two bounds with `A Aᵀ` in place of `Pφ̃φ̃ᵀ`. Since `φ̃` lies in the tangent space,
  `A Aᵀ → Pφ̃φ̃ᵀ` along an increasing orthonormal family. For the convolution, the factors `M_A`
  have characteristic functions `φ_L(u) e^{uᵀ A Aᵀ u/2} → φ_L(u) e^{uᵀ Pφ̃φ̃ᵀ u/2}`, continuous at
  `0`, so Lévy's continuity theorem gives `M`. For the minimax bound,
  `N(0, A Aᵀ) → N(0, Pφ̃φ̃ᵀ)` weakly and `ℓ` is lower semicontinuous and nonnegative, so the
  portmanteau theorem gives `∫ ℓ dN(0, Pφ̃φ̃ᵀ) ≤ liminf ∫ ℓ dN(0, A Aᵀ)`.

*Needs:* 4.1, 3.1, 2.3; MathematicalStatisticsAsymptotic 7.3 (local asymptotic normality),
7.5 (convolution theorem) and 7.6 (local asymptotic minimax theorem); Mathlib `Measure.conv`,
`multivariateGaussian`.

**Checks.**

- `exists_conv_of_isRegularAlong`: the sample median under `N(θ, 1)` is regular with limit
  `N(0, π/2) = N(0, 1) * N(0, π/2 - 1)`.
- `lintegral_gaussian_le_iSup_liminf` without tightness: in the normal location model the
  estimator `Tₙ = n` is not `√n`-tight; for squared error its local risks diverge, and the bound
  holds.

### 4.4 Efficiency

- `isRegularAlong_gaussian_iff_isAsymptoticallyLinear`: for a linear tangent set, `T` is regular
  with limit `N(0, Pφ̃φ̃ᵀ)` iff it is asymptotically linear in `φ̃` (van der Vaart, (25.22) and
  Lemma 25.23, p. 367; Kosorok, Theorem 18.7, p. 339). "If" is 2.3 with Le Cam's third lemma.
  "Only if" follows van der Vaart's proof: the oracle `Sₙ = θ + n⁻¹ Σ φ̃(xᵢ)` is efficient, the
  matching randomized estimators `S`, `T` in the limit experiment (the representation theorem,
  MathematicalStatisticsAsymptotic 7.4) have equal projections onto the observation, and their
  covariances force `S = T`.

*Needs:* 4.3, 2.3; MathematicalStatisticsAsymptotic 1.1, 7.2 and 7.4.

### 4.5 The semiparametric convolution bound

- `exists_conv_semiparametric`: in the setting of 3.4 with a linear tangent set, the limit law of
  every estimator sequence of `θ` regular along the paths is `N(0, Ĩ⁻¹) * M` for a probability
  measure `M`. This is 4.3 with 3.4, since `P (Ĩ⁻¹ ℓ̃)(Ĩ⁻¹ ℓ̃)ᵀ = Ĩ⁻¹ Ĩ Ĩ⁻¹ = Ĩ⁻¹`.
- `isRegularAlong_gaussian_iff_semiparametric`: in the same setting, a measurable sequence is
  regular with limit `N(0, Ĩ⁻¹)` iff `√n (Tₙ - θ) = n^{-1/2} Σ Ĩ⁻¹ ℓ̃(xᵢ) + o_P(1)`. This is 4.4
  with 3.4.

For `N = ∅` these are the parametric convolution theorem and the characterization of efficient
estimators along lines.

*Needs:* 4.3–4.4, 3.4.

### Examples

- In the normal location model the sample mean is regular with limit `N(0, 1)` and
  asymptotically linear in `x - θ`, hence efficient (4.1, 4.4); the sample median is regular with
  limit `N(0, π/2) = N(0, 1) * N(0, π/2 - 1)`, the convolution of 4.3.
- Hodges' estimator `Tₙ = X̄ 1{|X̄| ≥ n^{-1/4}}` at `θ = 0` is asymptotically linear in `φ = 0`
  but not regular (4.1): under `N(h/√n, 1)^n`, `√n (Tₙ - h/√n) → -h`. Its squared-error risk
  along the path `N(h t, 1)` at `t = 1/√n` tends to `h²`, unbounded in `h`, so it does not
  beat the local asymptotic minimax bound `1` of 4.3.

### Dependencies

Layers 2–3; MathematicalStatisticsAsymptotic 1.1 (varying spaces) and 7.2–7.6 (local asymptotic
normality and limit experiments).

## Layer 5: sample splitting and efficient estimation

### 5.1 Sample splitting and the cross-fitting lemma

- `SampleSplit n K`: a labelling `fold : Fin n → Fin K`; `SampleSplit.training s k` is the subtype
  of indices outside fold `k`. A split is data independent.
- `indepFun_restrict_training`: restricting a sample `x : Fin n → O` to `s.training k` is a
  measurable map, and under `Measure.pi` the training sample of fold `k` is independent of the
  observations in fold `k`. Route: the two restrictions use disjoint sets of coordinates
  (Mathlib `iIndepFun` of the coordinates under `Measure.pi`).
- `crossFittedAverage s fit φ o = n⁻¹ Σᵢ φ (fit (fold i) (o restricted to training (fold i))) (oᵢ)`,
  with `fit k` a nuisance estimator on the training sample of fold `k` and `φ h` an estimating
  function at nuisance `h`.
- `crossFittedAverage_asymptotically_linear`: let `W` be i.i.d. with law `P`, `K` fixed,
  `φ h₀ ∈ L²(P)`, `(p, o) ↦ φ (fit n k p) o` jointly measurable, and on every fold, with the
  nuisance held fixed: `‖φ(fitted) - φ h₀‖_{L²(P)} → 0` in probability, finite for every sample, and
  `√n (P φ(fitted) - P φ h₀) → 0` in probability. Then
  `√n (crossFittedAverage - P φ h₀) = n^{-1/2} Σ (φ h₀ (Wᵢ) - P φ h₀) + o_P(1)`. No condition on
  fold sizes is needed. Route: the difference is
  `Σₖ n^{-1/2} Σ_{i ∈ Iₖ} [(φ̂ₖ - φ₀)(Wᵢ) - P(φ̂ₖ - φ₀)] + Σₖ (|Iₖ|/n) √n P(φ̂ₖ - φ₀)`. Given the
  training sample, the first sum has mean zero and variance at most
  `(|Iₖ|/n) ‖φ̂ₖ - φ₀‖² ≤ ‖φ̂ₖ - φ₀‖²`, so conditional Chebyshev and the hypothesis make it
  `o_P(1)`; the second is `o_P(1)` since `|Iₖ|/n ≤ 1`.

*Needs:* Foundations 8.3, 8.5; Mathlib `Measure.pi`, `condExp`, `iIndepFun`.

**Checks.**

- `SampleSplit`: `n = 5`, `K = 2`, folds `(0, 0, 0, 1, 1)`: the training sets have `2` and `3`
  elements.
- `SampleSplit` (negative control): in the same split `s.training 0` is `{3, 4}`, the indices
  outside fold `0`, not the fold itself `{0, 1, 2}`.
- `SampleSplit`: with `K = 1` every index is in fold `0` and `s.training 0` is empty.
- `crossFittedAverage`: `n = 2`, folds `(0, 1)`, `fit k p` the single training value and
  `φ h o = o - h`: the average is `((o₀ - o₁) + (o₁ - o₀))/2 = 0`.
- `crossFittedAverage` (negative control): same split, `o = (0, 2)` and `φ h o = (o - h)²`: each
  observation is scored against the other, and the average is `4`, while the in-sample plug-in
  with `h = ō = 1` gives `1`.
- `crossFittedAverage`: with `K = 1` the training sample is empty, `fit` is a constant nuisance
  `h`, and the average is the ordinary mean `n⁻¹ Σ φ h (oᵢ)`; for `n = 0` it is `0`.
- `crossFittedAverage_asymptotically_linear`: with a single fold, `K = 1`, the lemma reduces to
  its hypotheses: bias `o(n^{-1/2})` and an `L²` limit for a deterministic nuisance.

### 5.2 The one-step theorem with data splitting

Let `{P_{θ,G} : θ ∈ Θ ⊆ ℝᵏ open, G ∈ 𝒢}` be a model and `ψ(x; θ, G)` a function with
`∫ ψ(·; θ, G) dP_{θ,G} = 0` and `∫ ‖ψ‖² dP_{θ,G} < ∞`. Suppose, for every `(θ, G)` and every
sequence `θₙ` with `√n |θₙ - θ|` bounded:
- (contiguity) `P^n_{θₙ,G}` and `P^n_{θ,G}` are mutually contiguous;
- (smoothness)
  `√n (θₙ - θ) + n^{-1/2} Σ [ψ(Xᵢ; θₙ, G) - ψ(Xᵢ; θ, G)] → 0` in `P^n_{θ,G}`-probability;
- (preliminary estimator) a `√n`-consistent estimator `θ̃ₙ` exists;
- (influence function estimator) estimators `ψ̂ₘ(·; θ; X₁, …, Xₘ)`, jointly measurable in
  `(x, θ, X₁, …, Xₘ)`, exist with `√m ∫ ψ̂ₘ(x; θₘ) dP_{θₘ,G}(x) → 0` and
  `∫ ‖ψ̂ₘ(·; θₘ) - ψ(·; θₘ, G)‖² dP_{θₘ,G} → 0` in `P^m_{θₘ,G}`-probability.

Then (`exists_oneStep_estimator`; Bickel–Klaassen–Ritov–Wellner, §7.8, Theorem 1, p. 395,
conditions (i)–(vi)) some measurable estimator sequence `θ̂ₙ` satisfies
`√n (θ̂ₙ - θₙ - n⁻¹ Σ ψ(Xᵢ; θₙ, G)) → 0` in `P^n_{θₙ,G}`-probability for every `(θ, G)` and every
`θₙ` with `√n |θₙ - θ|` bounded. In Lean, contiguity is mutual contiguity on measurable events,
`√n`-consistency is boundedness in probability of `√n (θ̃ₙ - θ)`, and the `L²` condition is
stated in `ℝ≥0∞`. The estimator of the proof is built from four consecutive blocks of the sample,
of sizes proportional to `n`: two preliminary estimators on the first and third, two
influence-function estimators on the second and fourth, each applied to blocks disjoint from
those it was computed on (the estimator (22), p. 396, due to Klaassen). Route, as in the
source: each preliminary estimator is
independent of the observations and of the influence-function estimator it is combined with, so
conditionally on it the conditions apply at a deterministic point. A remainder that tends to `0`
in probability along every deterministic sequence `θ + O(n^{-1/2})` does so uniformly over
`|θₙ - θ| ≤ M n^{-1/2}`, and Fubini, which needs the joint measurability above, then handles the
random point. Van der Vaart's version of the one-step theorem discretizes the preliminary
estimator to a grid of mesh `n^{-1/2}` instead (van der Vaart, Theorem 25.57, p. 393).

With `ψ = Ĩ⁻¹ ℓ̃` the efficient influence function this gives an estimator asymptotically linear
in `ψ`, hence efficient by 4.4 (Bickel–Klaassen–Ritov–Wellner, §7.8, Corollary 1, p. 398). The
smoothness condition is the local linearity of the score sum; it is a hypothesis here and is
verified in each application.

*Needs:* 5.1, 4.4; Foundations 8.3, 8.6; MathematicalStatisticsAsymptotic 1.1.

### 5.3 Adaptive estimation of a centre of symmetry

- `IsSymmetricFiniteInformationDensity η η'`: `η` measurable, nonnegative, of integral `1`,
  even; `η'` measurable, odd and locally integrable with `η x = η 0 + ∫₀ˣ η'`; and
  `η'²/η` integrable. `locationLaw η θ` has density `η(x - θ)`, and
  `locationFisherInformation η η' = ∫ η'²/η`, with `η'²/0 = 0`.
- **Monotone preliminary estimator** (`sqrt_consistent_sSup_tanh`). For `ψ = tanh(·/2)` (the
  logistic score), the estimator `θ̃ₙ = sup {t : Σ ψ(xᵢ - t) > 0}` is measurable for every `n`
  (for `n = 0` the set is empty and `θ̃₀ = 0`), and it is `√n`-consistent at every
  `locationLaw η θ` with `η` a measurable, nonnegative, even density of integral `1`: for every
  `ε > 0` there is `M` with `P^n(√n |θ̃ₙ - θ| > M) ≤ ε` for all large `n`. Symmetry gives
  `E ψ(X - θ) = 0`. Route, exact: `t ↦ Σ ψ(xᵢ - t)` is decreasing, so
  `P(√n (θ̃ₙ - θ) > M) ≤ P(n⁻¹ Σ ψ(xᵢ - θ - M/√n) ≥ 0)`; the summands have mean
  `-c M/√n + o(n^{-1/2})` with `c = E ψ'(X - θ) > 0` and variance at most `1`, and Chebyshev bounds
  the probability by `1/(c M)²` for large `n`. This replaces van der Vaart's appeal to Theorem
  5.21 (van der Vaart, §25.8.1, p. 397).
- `tendstoInProbabilityZero_locationScoreSum`: for `η`, `η'` satisfying the hypotheses of
  `hasPathScore_location` (nonnegative, of integral `1`, `η x = η 0 + ∫₀ˣ η'` with `η'` locally
  integrable, `η'²/η` integrable; no symmetry) and bounded `hₙ`, under `locationLaw η θ`,
  `n^{-1/2} Σ [ℓ̇(xᵢ - θ - hₙ/√n) - ℓ̇(xᵢ - θ)] + I_η hₙ → 0` in probability, with
  `ℓ̇ = -η'/η`, read as `0` where `η = 0` (Bickel–Klaassen–Ritov–Wellner, §2.1, Proposition 2,
  p. 16, display (15), p. 17, for a regular parametric model; the location model of finite
  information is regular by their Corollary A.5.1, p. 460; this is the absolutely continuous
  location family of 2.1 of this roadmap). By translation invariance this is the smoothness
  condition of 5.2 for `ψ = I_η⁻¹ ℓ̇`.
- **Score estimation** (`exists_score_estimator`). Estimators `ℓ̂ₘ(x; X₁, …, Xₘ)` of `ℓ̇`,
  jointly measurable in `x` and the sample, exist such that at every `η` satisfying
  `IsSymmetricFiniteInformationDensity`, from a sample of `η`, `∫ (ℓ̂ₘ - ℓ̇)² η → 0` in probability
  (a lower integral, in `ℝ≥0∞`) and `∫ ℓ̂ₘ² η` is consistent for `I_η`
  (Bickel–Klaassen–Ritov–Wellner, §7.8, Proposition 1, p. 400; one construction is the truncated
  kernel estimator of van der Vaart, (25.63), p. 397, with Lemma 25.64, p. 398, applied to
  `|Xᵢ - θ|`, whose density is `2η` on `(0, ∞)`).
- `exists_adaptive_estimator_centre_of_symmetry`: one measurable estimator sequence, not depending
  on `η`, is asymptotically linear in `-(η'/η)(x - θ)/I_η` at every `η` satisfying
  `IsSymmetricFiniteInformationDensity` and every `θ` (van der Vaart, §25.8.1, p. 397;
  Bickel–Klaassen–Ritov–Wellner, §7.8, Example 1, pp. 398–401). It is therefore regular with limit
  `N(0, I_η⁻¹)` along the paths of 3.4, by 4.4: adaptive. Route: 5.2 with the three preceding items;
  the odd symmetrization `x ↦ (ℓ̂ₘ(x) - ℓ̂ₘ(-x))/2` of the score estimator has integral zero against
  every symmetric density, so the bias condition of 5.2 holds exactly. The contiguity condition of
  5.2 is mutual contiguity of the `n`-fold products of `locationLaw η (θ + hₙ/√n)` and
  `locationLaw η θ` for bounded `hₙ` (Bickel–Klaassen–Ritov–Wellner, §2.1, Proposition 3, p. 17, for
  a regular parametric model, with Corollary A.5.1, p. 460). Route: for a fixed `h` it is the
  contiguity item of 2.3 along the location path of 2.1 of this roadmap (absolutely continuous
  location families), with MathematicalStatisticsAsymptotic 7.1. For a sequence, pass to a
  subsequence with `hₙ → h`; the squared Hellinger distance between `locationLaw η (θ + δ)` and
  `locationLaw η θ` is at most `δ² ∫ ((√η)')² = δ² I_η/4`, so the products at `hₙ` and at `h` merge
  in total variation, and contiguity transfers.

*Needs:* 5.2, 3.4, 2.1 (absolutely continuous location families), 2.3;
MathematicalStatisticsAsymptotic 1.1, 7.1.

**Checks.**

- `tendstoInProbabilityZero_locationScoreSum`: for `η = N(0, 1)`, `ℓ̇(x) = x`, the sum is
  `-hₙ` exactly and `I_η = 1`: the expression is identically `0`.
- `tendstoInProbabilityZero_locationScoreSum` needs no symmetry: the Gumbel density
  `η(x) = e^{-x - e^{-x}}`, with `η(1) = 0.25465 ≠ η(-1) = 0.17937`, is absolutely continuous with
  `η' = (e^{-x} - 1) η`, score `ℓ̇(x) = 1 - e^{-x}` and `I_η = Var(e^{-X}) = 1`, since `e^{-X}` is
  standard exponential under `η`.
- Monotone preliminary estimator: its asymptotic variance `Eψ²/(Eψ')²` is `3 = 1/I_η` under the
  logistic law, where it is the maximum likelihood estimator, and `1.016` under `N(0, 1)`, against
  the bound `1`.
- `IsSymmetricFiniteInformationDensity`: the Laplace density `e^{-|x|}/2` qualifies, with
  `η' = -sign(x) η` (odd, with `η'(0) = 0`) and `I_η = 1`.
- `IsSymmetricFiniteInformationDensity`: `η(x) = cos²(πx/2)` on `[-1, 1]`, `0` outside, qualifies:
  it is absolutely continuous on `ℝ`, and `η'²/η = π² sin²(πx/2)` on `(-1, 1)`, so `I_η = π²`.
- `IsSymmetricFiniteInformationDensity` (negative control): the uniform density on `[-1, 1]`
  fails, since it is not absolutely continuous on `ℝ`; the density `(3/4)(1 - x²)` on `[-1, 1]`
  is absolutely continuous but fails integrability of `η'²/η = 3x²/(1 - x²)` at `±1`.
- `locationLaw`: for `η` the standard normal density, `locationLaw η θ` is `gaussianReal θ 1`;
  the density `η(x - θ)` shifts the centre to `+θ`, not `-θ`.
- `locationLaw`: under `IsSymmetricFiniteInformationDensity` it is a probability measure for
  every `θ`, by translation invariance of Lebesgue measure.
- `locationLaw`: for `η` the uniform density on `[0, 1]` and `θ = 2` it is the uniform law on
  `[2, 3]`.
- `locationFisherInformation`: `1` for the standard normal and the Laplace densities, `1/3` for
  the logistic density and `1/2` for the Cauchy density `1/(π(1 + x²))`.
- `locationFisherInformation`: for the `N(0, σ²)` density it is `1/σ²`; it is not scale
  invariant.
- `locationFisherInformation` (negative control): for the uniform density on `[-1, 1]` with the
  version `η' = 0`, the integral `∫ η'²/η` is `0`, a meaningless value; the absolute continuity
  field of `IsSymmetricFiniteInformationDensity` excludes this pair.

### 5.4 Partially linear regression: identification

- `partiallyLinear_identification`: with σ-algebras `σ(X) ≤ σ(D, X)`, `D` and `Y` in `L²`,
  `E[Y | D, X] = Dᵀβ + g(X)` with `g ∈ L²` and `σ(X)`-measurable, `V = D - E[D | X]` and
  `Q = E[V Vᵀ]` positive definite: `β = Q⁻¹ E[V (Y - E[Y | X])]`. Route, exact:
  `Y - E[Y | X] = Vᵀβ + (Y - E[Y | D, X])`, and `V` is `σ(D, X)`-measurable, so the second term is
  orthogonal to `V`.

The efficient influence function `Q⁻¹ V ε` of β is 3.4.

*Needs:* Mathlib `condExp`, `condExp_mul_of_stronglyMeasurable_left`.

**Checks.**

- `partiallyLinear_identification`: `D = X + U`, `Y = βD + X² + ε` with `X, U, ε` independent
  standard normal: `E[D | X] = X`, `V = U`, `E[Y | X] = βX + X²`, `Y - E[Y | X] = βU + ε` and
  `E[U(βU + ε)] = β`, with `Q = 1`.
- Without the partialling out, `E[D²]⁻¹ E[D Y] = β + E[D X²]/2 = β`, by symmetry, here; with
  `g(X) = X` instead it is `β + 1/2`, so the naive regression is biased.

### Examples

- The split `(0, 0, 0, 1, 1)` of `n = 5` into `K = 2` folds has training sets `{3, 4}` and
  `{0, 1, 2}` (5.1). With `o = (0, 1, 2, 3, 4)`, `fit` the mean of the training sample and
  `φ h o = o - h`, the fold-`0` observations are centred at `3.5` and the fold-`1` ones at `1`,
  so `crossFittedAverage = (-3.5 - 2.5 - 1.5 + 2 + 3)/5 = -0.5`; the in-sample plug-in gives `0`.
- Centre of symmetry (5.3): `locationFisherInformation` is `1` for the standard normal and the
  Laplace densities and `1/3` for the logistic, so the adaptive estimator has asymptotic variance
  `1`, `1` and `3`; the monotone preliminary estimator has asymptotic variance `3` under the
  logistic law and `1.016` under `N(0, 1)`.

### Dependencies

Layers 1–4, including the absolutely continuous location families of 2.1; Foundations 8.3,
8.5, 8.6; MathematicalStatisticsAsymptotic 1.1 (varying spaces) and 7.1 (mutual contiguity under
local asymptotic normality).

## Layer 6: missing data

### 6.1 Missingness at random

- `IsMissingAtRandom Q π`: `π` measurable with values in `[0, 1]`, and
  `Q(R = 1, (X, Y) ∈ A) = ∫_{(X,Y) ∈ A} π(X) dQ` for every measurable `A ⊆ X × ℝ` (Little–Rubin,
  (6.51), p. 134, in set-function form: the probability of observing the response does not
  depend on the response).
- `isMissingAtRandom_iff_condExp`: for measurable `π` with values in `[0, 1]`, missingness at
  random is `E[1{R = 1} | X, Y] = π(X)` a.e. Route: both sides of the defining identity are the
  set integrals over `σ(X, Y)`-sets of `1{R = 1}` and of the `σ(X, Y)`-measurable `π(X)`, and
  `condExp` is characterized by them.
- **Consequences** (`IsMissingAtRandom.condExp_and_condIndepFun`). For standard Borel `X`, under
  missingness at random, `π(X)` is a version of `P(R = 1 | X)` (tower
  property), and `R` and `Y` are conditionally independent given `X` (Mathlib `CondIndepFun`),
  since `P(R = 1 | X, Y) = P(R = 1 | X)` and `R` takes two values.
- `isMissingAtRandom_of_indepFun` (missing completely at random): if `R` is independent of
  `(X, Y)`, the data are missing at random with the constant propensity `π = P(R = 1)`.
- `observe` (Conventions) is measurable.

*Needs:* Mathlib `condExp`, `CondIndepFun`, `setIntegral_condExp`.

**Checks.**

- `IsMissingAtRandom`: `X ∈ {0, 1}` equiprobable, `π = (0.5, 0.8)`, `E[Y | X] = (1, 3)`: missing
  at random but not completely at random, and the complete-case mean
  `E[π m₀]/E[π] = 1.45/0.65 ≈ 2.2308` differs from `E Y = 2`.
- `IsMissingAtRandom`: `π(x) = 2` on a `Q`-null set fails the definition, although the
  conditional-expectation form holds; the `[0, 1]` hypothesis of
  `isMissingAtRandom_iff_condExp` excludes this.
- `IsMissingAtRandom`: with `A = X × ℝ` the identity gives `Q(R = 1) = E π(X)`; in the example
  above, `0.65`.
- `IsMissingAtRandom` (negative control): `R = 1{Y > 0}` with `Y ~ N(0, 1)` and `X` a point is
  not missing at random: `A = {y > 0}` gives `Q(R = 1, Y > 0) = 1/2`, while `∫_A π dQ = π/2`
  would force `π = 1`, and `A = {y ≤ 0}` would force `π = 0`.
- `observe`: `observe (true, x, y) = (true, x, y)` and `observe (false, x, y) = (false, x, 0)`.
- `observe` (negative control): `observe (false, x, 0) = observe (false, x, 5)`, so the response is
  lost when `r = false`, while `observe (true, x, 0) ≠ observe (false, x, 0)`: the placeholder
  `0` is never confused with an observed `0`, because `r` is kept.
- `observe` is idempotent: `observe (observe w) = observe w`.

### 6.2 The observed-data likelihood and ignorability

- `observedDensity ρ f π o`: `π(x) f(x, y)` if `r`, and `(1 - π(x)) ∫ f(x, y') dρ(y')` if not.
- `observedReference ν ρ = δ_true ⊗ (ν ⊗ ρ) + δ_false ⊗ (ν ⊗ δ₀)`.
- `map_observe_eq_withDensity`: if `(X, Y)` has density `f` with respect to `ν ⊗ ρ` (σ-finite)
  and `R` is missing at random with propensity `π`, the observed law `Q.map observe` has density
  `observedDensity ρ f π` with respect to `observedReference ν ρ` (Little–Rubin, (6.46)–(6.47),
  pp. 132–133, with the factorization under (6.51), p. 134).
- `setOf_isMaxOn_observedLikelihood` (ignorability for likelihood): for a parametric family
  `f θ`, propensities `π φ`, and a sample `o`, if every propensity factor
  `π_φ(xᵢ)` (observed) or `1 - π_φ(xᵢ)` (missing) is positive, the maximizers in `θ` of
  `∏ observedDensity` equal those of the ignorable likelihood `∏ (f θ (xᵢ, yᵢ) or ∫ f θ (xᵢ, ·))`,
  and in particular do not depend on `φ` (Little–Rubin, Theorem 6.1A and Corollary 6.1A, p. 134,
  with the ignorable likelihood (6.48), p. 133). The positivity hypothesis is necessary: if a
  factor vanishes, every `θ` maximizes the observed likelihood.
- **Ignorability for Bayesian inference** (`condDistrib_fst_ae_eq_ignorable`). Let `f θ` be
  probability densities of `(X, Y)` with respect to `ν ⊗ ρ` (σ-finite), jointly measurable in
  `θ`, let `π φ` be jointly measurable propensities with values in `[0, 1]`, let the prior be a
  product `pθ ⊗ pφ` of probability measures, and let `Θ` be standard Borel. Let `J` be the law of
  `((θ, φ), o)` with density `∏ᵢ observedDensity ρ (f θ) (π φ) (oᵢ)` with respect to
  `pθ ⊗ pφ ⊗ (observedReference ν ρ)ⁿ`, the full model with data missing at random, and let
  `Jign` be the law of `(θ, o)` with density `∏ᵢ observedDensity ρ (f θ) (1/2) (oᵢ)` with respect
  to `pθ ⊗ (observedReference ν ρ)ⁿ`, which is `2⁻ⁿ` times the ignorable likelihood, so that its
  posterior is the posterior from the ignorable likelihood. Then Mathlib's posterior
  `condDistrib` of `θ` given `o` is the same under `J` and under `Jign`, `J`-a.e. in `o`
  (Little–Rubin, Theorem 6.1B and Corollary 6.1B, p. 135). Route: the posterior density under
  `J` factors as `pθ`-density `∝ L_ign(θ)` times a `pφ`-density in `φ`, and the second factor
  integrates out; no positivity of the propensity factors is needed, since the observed data
  where the normalizers vanish form a `J`-null set.

*Needs:* 6.1; Mathlib `Measure.withDensity`, `Measure.prod`, `condDistrib`.

**Checks.**

- `setOf_isMaxOn_observedLikelihood`: one observed `y = 1` under `f θ = N(θ, 1)` and
  `π_φ ≡ φ`: for `φ ∈ (0, 1]` the maximizer is `θ = 1`; for `φ = 0` the observed likelihood is
  identically `0` and every `θ` maximizes.
- `map_observe_eq_withDensity`: with `X` a point, `Y ~ N(0, 1)` and `π = 1/2`, the observed law
  is `(1/2) δ_true ⊗ N(0, 1) + (1/2) δ_false ⊗ δ₀`, and the density at `(false, ·, 0)` is
  `(1/2) · 1`.
- `observedDensity`: at an observed point `(true, x, y)` it is `π(x) f(x, y)`; with `π ≡ 1` it is
  the full-data density `f`.
- `observedDensity` (negative control): in the example above, evaluating the missing branch at
  the placeholder, `(1/2) f(·, 0) = 0.19947`, instead of integrating out `y`, gives total
  mass `0.69947`, not `1`.
- `observedDensity`: with `π ≡ 0` it is `0` at every observed point and `∫ f(x, ·) dρ` at a
  missing point `(false, x, 0)`.
- `observedReference`: the mass of `{false} × B × ℝ` is `ν(B)`, since `δ₀(ℝ) = 1`; the mass of
  `{true} × B × C` is `ν(B) ρ(C)`.
- `observedReference`: for `ν = δ_x` and `ρ = δ_y` it is `δ_(true, x, y) + δ_(false, x, 0)`, of
  total mass `2`: a reference measure, not a probability.
- `observedReference` (negative control): with `ν ⊗ ρ` also on the missing branch and `ρ`
  Lebesgue measure, the observed law, which puts mass `1/2` on the Lebesgue-null set
  `{false} × X × {0}`, would have no density.

### 6.3 Augmented inverse probability weighting and double robustness

- `aipwScore m π o = m(x) + r (y - m(x))/π(x)`, which equals
  `R Y/π(X) - (R - π(X)) m(X)/π(X)` on observed data.
- `integral_aipwScore_sub` (the mixed-bias identity): under missingness at random with
  propensity `π₀`, `Y` integrable, `m₀` a measurable version of `E[Y | X]`, `m(X)` integrable,
  and `π` measurable with `π ≥ δ > 0`:
  `E φ_{m,π} - E Y = E[(π₀ - π)(m₀ - m)/π]`. Route, exact: condition on `(X, Y)`, then on `X`.
- **Double robustness** (`integral_aipwScore_eq`). Under the hypotheses on `π₀`, `Y` and `m₀` of
  the mixed-bias identity, with `π₀ ≥ δ > 0`: `E φ_{m,π} = E Y` when `π = π₀`, for every
  measurable `m` with `m(X)` integrable, and when `m = m₀`, for every measurable `π` bounded
  below by a positive constant. Both are read off the
  identity above. Square integrability of `m` is not needed.
- `abs_integral_aipwScore_sub_le`: under the hypotheses of `integral_aipwScore_sub`,
  `|E φ_{m,π} - E Y| ≤ δ⁻¹ ‖π - π₀‖_{L²} ‖m - m₀‖_{L²}`, by Cauchy–Schwarz, with the norms in
  `ℝ≥0∞`; when either norm is `0` the bias is `0`, so the convention `0 · ∞ = 0` is harmless.

*Needs:* 6.1; Mathlib `condExp`, `setIntegral_condExp`.

**Checks.**

- `integral_aipwScore_sub`: in the example of 6.1, with `m = 0` and `π = 1`, `φ = R Y` and
  `E φ = E[π₀ m₀] = (0.5 · 1 + 0.8 · 3)/2 = 1.45`, while
  `E[(π₀ - 1)(m₀ - 0)] = ((-0.5) · 1 + (-0.2) · 3)/2 = -0.55 = 1.45 - 2`.
- Double robustness: same example, `m = 0`, `π = π₀`: `E[R Y/π₀] = E[m₀] = 2`; and `m = m₀`,
  `π = 1`: `E[m₀ + R(Y - m₀)] = 2`, since `E[R (Y - m₀) | X] = π₀ · 0`.
- `aipwScore`: at a missing observation `(false, x, 0)` it is `m(x)`; at an observed one with
  `π(x) = 1` it is `y`.
- `aipwScore`: with `m = 0` it is the inverse-probability-weighted `r y/π(x)`.
- `aipwScore` (negative control): that unaugmented score is not doubly robust: in the example of
  6.1 with `π = 1` its mean is `1.45`, not `E Y = 2`, by the first check.

### 6.4 Identification and the efficient influence function of a missing mean

- `marMean P`: for a law `P` of observed data, `∫ E_{P[| R = 1]}[Y | X = x] dP(x)`, through
  Mathlib's `condDistrib` of `Y` given `X` under the conditioned law `P[|R = 1]`.
- `marMean_map_observe`: under missingness at random with `π₀ ≥ δ > 0` and `Y` integrable,
  `marMean (Q.map observe) = E Y`. The lower bound on `π₀` makes the law of `X` absolutely
  continuous with respect to its law given `R = 1`, so the conditional mean among the observed is
  defined almost everywhere where it is integrated.
- `marPath Q₀ π₀ a e t`: the full-data path with density
  `(1 + t a(X, Y))(1 + t (R - π₀(X)) e(X))` with respect to `Q₀`, for bounded measurable `a` with
  `E a = 0` and bounded measurable `e`.
- `isMissingAtRandom_marPath`: for `|t|` small this path is a probability measure, missing at
  random with propensity `π₀ + t π₀(1 - π₀) e`, and its observed path has score
  `E[a | O] + (R - π₀(X)) e(X)` relative to the observed law `Q₀.map observe`. Route:
  the density is positive for small `|t|`; conditioning the second factor on `(X, Y)` and using
  `E[R | X, Y] = π₀(X)` gives the total mass `1` and the propensity; the full-data score
  `a + (R - π₀) e` comes from the bounded tilts of 2.2, and the observed score is its
  conditional expectation given `O` by the information-loss lemma for images (2.2), with
  `(R - π₀(X)) e(X)` already a function of `O`.
- `hasDerivAt_marMean_marPath`: for `Y ∈ L²`, `π₀ ≥ δ` and `m₀` a measurable version of
  `E[Y | X]` with `m₀(X)` integrable (as in 6.3, so that the defining set integrals of `m₀` are not
  junk zeros), the derivative at `0` of the identified mean along the observed paths is
  `E[(φ_{m₀,π₀} - μ) (a + (R - π₀) e)]`.
- `eq_zero_of_forall_integral_mul_marScore_eq_zero`: the observed scores are dense in `L²₀` of
  the observed law. Route, exact: write `u(O) = R u₁(X, Y) + (1 - R) u₀(X)`; orthogonality to the
  `e` scores gives `π₀(1 - π₀)(E[u₁ | X] - u₀) = 0`, and to the `a` scores
  `π₀ u₁ + (1 - π₀) u₀ = 0`; hence `u₁ = 0` (using `π₀ ≥ δ`) and `u₀ = 0` where `π₀ < 1`.
- **The efficient influence function** (`efficientInfluence_marMean`). Take the model of all
  observed laws `Q.map observe` of full-data laws `Q` with `Y ∈ L²`, missing at random with a
  propensity bounded below by a positive constant, and at `Q₀` the hypotheses of
  `hasDerivAt_marMean_marPath`. The observed paths of `marPath`, indexed by the bounded measurable
  `(a, e)` with `E a = 0`, form a path family in this model (each path equals
  `(marPath Q₀ π₀ a e t).map observe` for small `t ≥ 0`), along which `marMean` is pathwise
  differentiable with efficient influence function
  `φ_{m₀,π₀} - μ = m₀(X) + R (Y - m₀(X))/π₀(X) - μ`, and the efficient variance is
  `Var m₀(X) + E[Var(Y | X)/π₀(X)] = Var m₀(X) + E[(Y - m₀(X))²/π₀(X)]`. Van der Vaart describes the
  tangent space under coarsening at random (Theorem 25.40, p. 380) and all influence functions
  (Lemma 25.41, p. 381), and in the missing-at-random case (Example 25.43, p. 383) minimizes the
  variance over the augmentation term, with minimizer `c̃ = E(χ_Q(Y) | X)`; with `χ_Q = y - μ`, the
  only influence function of the mean on the nonparametric full-data model, this is `φ_{m₀,π₀} - μ`.
  Route here: the two previous items, since the tangent space is all of `L²₀` and
  `φ_{m₀,π₀} - μ ∈ L²₀`; the variance formula follows from `E[R (Y - m₀)² | X] = π₀ Var(Y | X)` and
  the vanishing cross term.

*Needs:* 6.3, Layers 2–3; Mathlib `condDistrib`, `ProbabilityTheory.cond`.

**Checks.**

- Efficient variance, exact, in the example of 6.1 with `Var(Y | X) = 1`:
  `Var m₀ = 1` and `E[1/π₀] = (2 + 1.25)/2 = 1.625`, total `2.625`.
- `marPath`: `E[(1 + t a)(1 + t (R - π₀) e)] = E[(1 + t a) E[1 + t (R - π₀) e | X, Y]]` and this
  is `E[1 + t a] = 1`, by missingness at random.
- `marPath`: at `t = 0` it is `Q₀`; with `π₀ = 1/2`, `e = 1` and `t = 0.2` the propensity along
  the path is `0.5 + 0.2 · 0.25 = 0.55`.
- `marPath` (negative control): with the propensity factor `1 + t R e` in place of
  `1 + t (R - π₀) e`, the total mass in the same case with `a = 0` is `1 + t E[π₀ e] = 1.1`: not a
  probability.
- `marMean`: in the example of 6.1, the regression among the observed is `m₀` by missingness at
  random, and `marMean` of the observed law is `E m₀(X) = 2`.
- `marMean` (negative control): integrating the same regression over the law of `X` given
  `R = 1`, which puts mass `0.5/1.3` and `0.8/1.3` on the two values, gives the complete-case
  mean `2.2308`, not `2`.
- `marMean`: if `R` is independent of `(X, Y)`, `marMean` is the mean of `Y` among the observed,
  which is `E Y`.
- Efficient influence function (negative control): the inverse-probability-weighted
  `R Y/π₀ - μ` is an influence function but not the efficient one; in the example its variance is
  `E[(1 + m₀²)/π₀] - 4 = (2/0.5 + 10/0.8)/2 - 4 = 4.25 > 2.625`.

### 6.5 Cross-fitted estimation of a missing mean

- **Cross-fitted estimation** (`crossFittedAverage_aipwScore_asymptotically_linear`). With a
  split into `K` folds, nuisance estimators `m̂ₖ`, `π̂ₖ` on the training samples, jointly
  measurable in the training sample and `x`, and `μ̂ = crossFittedAverage` of `aipwScore`: if
  `Y ∈ L²`, `π₀ ≥ δ` and `π̂ₖ ≥ δ`, `m̂ₖ(X)` is square integrable for every training sample, and
  on every fold `‖m̂ₖ - m₀‖_{L²(P_X)} → 0` and `‖π̂ₖ - π₀‖_{L²(P_X)} → 0` in probability with
  `√n ‖m̂ₖ - m₀‖ ‖π̂ₖ - π₀‖ → 0` in probability, then
  `√n (μ̂ - μ) = n^{-1/2} Σ [φ_{m₀,π₀}(Oᵢ) - μ] + o_P(1)`, an efficient estimator by 6.4 and 4.4.
  No fold-size condition is needed. Route: 5.1 with `φ(m, π) = aipwScore m π`; the bias
  condition is the Cauchy–Schwarz bound of 6.3; the `L²` condition follows from
  `φ_{m,π} - φ_{m₀,π₀} = (m - m₀)(1 - R/π) + R (Y - m₀)(π₀ - π)/(π π₀)`, whose norm is at most
  `(1 + δ⁻¹) ‖m - m₀‖ + (E[σ²(X) D(X)])^{1/2}` with `σ²(X) = Var(Y | X)` integrable and
  `D = (1/π - 1/π₀)²`. No upper bound on `π̂ₖ` is assumed; instead `π, π₀ ≥ δ` give
  `D ≤ δ⁻²` and `D ≤ δ⁻⁴ (π - π₀)²`, so for every `M > 0`
  `E[σ² D] ≤ M δ⁻⁴ ‖π - π₀‖² + δ⁻² E[σ² 1{σ² > M}]`, and `‖π - π₀‖ → 0` in probability forces
  the last term of the norm bound to `0` in probability. The square integrability of `m̂ₖ(X)`
  makes the `L²` distance finite for every sample, as 5.1 requires.

*Needs:* 5.1, 6.3, 6.4.

### Examples

- The two-point propensity example of 6.1: `X ∈ {0, 1}` equiprobable, `π₀ = (0.5, 0.8)`,
  `m₀ = (1, 3)` and `Var(Y | X) = 1`. The complete-case mean is `1.45/0.65 ≈ 2.2308`, while
  `marMean` of the observed law is `E Y = 2` (6.4); the inverse-probability-weighted score with
  `π₀` and the augmented score with `m₀` and `π = 1` both have mean `2` (6.3); the efficient
  variance is `2.625`, against `4.25` for inverse probability weighting alone (6.4).

### Dependencies

Layers 1–5; Foundations 8.3–8.5.

## Layer 7: the EM algorithm and missing information

### 7.1 Setting

- `obsLikelihood ρ f θ = ∫ f θ dρ` and `obsLogLikelihood = log obsLikelihood`.
- `missingLaw ρ f θ = ρ.withDensity (f θ / obsLikelihood ρ f θ)`, the conditional law of the
  missing part given the observed data; a probability measure when `f θ > 0` is integrable and
  `ρ ≠ 0`.
- `emQ ρ f θ θ' = ∫ log f θ d(missingLaw θ')`, the criterion `Q(θ | θ')` (Little–Rubin, (8.15),
  p. 194, with the decomposition (8.13)–(8.14), p. 193). It is a Bochner integral: where
  `log f θ` is not integrable under `missingLaw θ'` its value is `0`, so every statement about
  `emQ` assumes that integrability.
- `IsEMStep ρ Θ f θ' θ''`: `θ'' ∈ Θ` maximizes `Q(· | θ')` over `Θ`. An EM map `M` is a function
  with `IsEMStep ρ Θ f θ' (M θ')` for every `θ' ∈ Θ`.

*Needs:* Mathlib `Measure.withDensity`.

**Checks.**

The multinomial example of Little–Rubin (Example 8.2, p. 190, Table 8.1, p. 191): observed counts
`(38, 34, 125)` with cell probabilities `(1/2 - θ/2, θ/4, 1/2 + θ/4)`, the last cell split into
unobserved counts `y₃` and `125 - y₃` of probabilities `θ/4` and `1/2`; `Z = {0, …, 125}` with
counting measure and `f θ y₃ = C(125, y₃) (1 - θ)^{38} θ^{34 + y₃} 2^{-y₃}`, up to a factor free of
`θ` and `y₃`. The normal example, also used in 7.3: `E = ℝ`, `Z = ℝ` with Lebesgue measure,
nothing else observed, and `f θ z = (2π)^{-1/2} e^{-(z - θ)²/2}`.

- `missingLaw`: in this example it is the binomial law of `y₃` with `125` trials and success
  probability `θ/(2 + θ)`; at `θ = 1/2` its mean is `25`.
- `missingLaw` (negative control): for `ρ = 0`, `obsLikelihood` is `0`, `obsLogLikelihood` is
  `log 0 = 0` in Lean, and `missingLaw` is the zero measure, not a probability.
- `obsLikelihood`: in the example, summing over `y₃` gives
  `(1 - θ)^{38} θ^{34} (1/2 + θ/4)^{125}` times a constant, so `obsLogLikelihood` is the observed
  log-likelihood up to an additive constant.
- `emQ`: in the example `Q(θ | θ') = 38 log(1 - θ) + (34 + ŷ₃(θ')) log θ` plus terms free of
  `θ`, with `ŷ₃(θ') = 125 θ'/(2 + θ')`.
- `emQ` (negative control): `Z = (0, 1/2)` with Lebesgue measure and
  `f θ z = e^{-θ²}/(z log² z)`: `f θ` is integrable, but `log f θ` is not integrable under
  `missingLaw θ'`, since `∫ dz/(z |log z|)` diverges at `0`; so `emQ` is `0` for all `θ, θ'`,
  although `log f θ - log f θ' = θ'² - θ²` is bounded.
- `IsEMStep`: from `θ' = 1/2` over `Θ = (0, 1)` the step is `(34 + 25)/(72 + 25) = 0.608247`, the
  first iterate of Table 8.1.
- `IsEMStep` (negative control): over `Θ = (0, 0.55]` the step from `1/2` is `0.55`, since
  `Q(· | 1/2)` is concave with unconstrained maximizer `0.608247`; the parameter set matters.
- `obsLikelihood`: in the normal example it is `1` for every `θ`.
- `obsLikelihood` (negative control): for `Z = ℝ` with Lebesgue measure and `f θ z = 1`, `f θ` is
  not integrable and `obsLikelihood` is the junk value `0` of the Bochner integral, not `∞`; so
  `missingLaw` is the zero measure.
- `obsLogLikelihood`: in the normal example it is `0` for every `θ`.
- `obsLogLikelihood`: in the multinomial example, with `f` exactly as written, it is
  `38 log(1 - θ) + 34 log θ + 125 log(1 + θ/2)`, of derivative `-76 + 68 + 50 = 42` at
  `θ = 1/2`.
- `obsLogLikelihood` (negative control): in the multinomial example at `θ = 0` the likelihood is
  `0` and `obsLogLikelihood` is `log 0 = 0` in Lean, above its value `-19.259` at
  `θ̂ = 0.626821`; a maximizer over `[0, 1)` would be the junk point `0`, so `Θ = (0, 1)`.
- `missingLaw`: in the normal example it is `N(θ, 1)`.
- `emQ`: in the normal example
  `Q(θ | θ') = -(1 + (θ - θ')²)/2 - log(2π)/2`.
- `IsEMStep`: in the normal example over `Θ = ℝ` the step from `θ'` is `θ'` itself: all
  information is missing, and EM does not move.

### 7.2 Monotonicity and stationarity

- `emQ_sub_le_obsLogLikelihood_sub`: for positive measurable integrable `f θ`, `f θ'` with
  `log f θ`, `log f θ'` integrable under `missingLaw θ'`,
  `L(θ) - L(θ') = Q(θ | θ') - Q(θ' | θ') + KL(missingLaw θ' ‖ missingLaw θ)`, and so
  `Q(θ | θ') - Q(θ' | θ') ≤ L(θ) - L(θ')` (Little–Rubin, (8.17)–(8.18), p. 194). Route:
  `log f θ - log f θ' = (L(θ) - L(θ')) + log (dk_θ/dk_θ')`, integrate under `k_θ'`, and use Gibbs'
  inequality `toReal_klDiv`, `integral_llr_add_sub_measure_univ_nonneg`.
- `obsLogLikelihood_le_of_isEMStep`: an EM step does not decrease `L` (Little–Rubin, Theorem 8.1,
  p. 194), and equality forces `missingLaw θ'' = missingLaw θ'` and `Q(θ'' | θ') = Q(θ' | θ')`.
  Route: in the identity above both the gain in `Q` and the Kullback–Leibler term are
  nonnegative, so equality makes both vanish. The converse half of the source's "if and only if"
  is not claimed: equal `Q` values leave the Kullback–Leibler term, which can be positive.
- **Stationarity.** If `θ*` is an interior point of `Θ` maximizing `Q(· | θ*)` over `Θ`,
  `Q(· | θ*)` has a gradient at `θ*`, and `L` has the same
  gradient there (Fisher's identity `∇L(θ*) = ∇Q(θ* | θ*)`), then `∇L(θ*) = 0`. Little–Rubin,
  Theorem 8.2, p. 195, draw the same conclusion for a limit of EM iterates.

*Needs:* 7.1; Mathlib `klDiv`, `llr`, `toReal_klDiv`, `integral_llr_add_sub_measure_univ_nonneg`.

**Checks.**

- `obsLogLikelihood_le_of_isEMStep`: in the multinomial example of 7.1, from `θ₀ = 0.5` the
  iterates are `0.608247, 0.624321, 0.626489, 0.626777, 0.626816, …` (Little–Rubin, Table 8.1,
  p. 191), with strictly increasing log-likelihood, converging to `θ̂ = 0.626821`.

### 7.3 Fisher's identity and Louis's formula

- `EMRegular ρ f U`: `U` open; `f θ > 0` measurable; `θ ↦ f θ z` of class `C²` on `U`; and one
  `ρ`-integrable `G` with `|f θ z| + ‖D f θ z‖ + ‖D² f θ z‖ ≤ G z` and
  `(‖D log f θ z‖² + ‖D² log f θ z‖) f θ' z ≤ G z` for all `θ, θ' ∈ U`; and `log f θ` integrable
  under `missingLaw θ'` for all `θ, θ' ∈ U`, so that `emQ` is a genuine integral there. The bounds
  on derivatives do not give the last condition (see the Checks).
- `completeScore f θ z = ∇_θ log f θ z`.
- `hasGradientAt_obsLogLikelihood` (Fisher's identity): `∇L(θ) = E_{missingLaw θ}[completeScore θ]`
  for `θ ∈ U`. Route: differentiate under the integral sign
  (`hasFDerivAt_integral_of_dominated_of_fderiv_le`).
- `louis_formula`: for `θ ∈ U`, `-D²L(θ) = -D²₁Q(θ | θ) - Cov_{missingLaw θ}(completeScore θ)`, that
  is `i_{obs} = i_{com} - i_{mis}` with `i_{mis}` the conditional covariance operator of the
  complete score (Mathlib `covarianceOperator`), positive semidefinite (Little–Rubin, (8.26)–(8.27),
  p. 198, and Louis's expression for the missing information, p. 199, with its form (8.30) at the
  maximum likelihood estimate). Route: differentiate Fisher's identity once more; the derivative
  of the conditional density contributes `E[S Sᵀ] - E[S] E[S]ᵀ`.

*Needs:* 7.1; Mathlib `hasFDerivAt_integral_of_dominated_of_fderiv_le`, `gradient`,
`covarianceOperator`.

**Checks.**

- `louis_formula`: `Z = ℝ` with Lebesgue measure, nothing else observed, and
  `f θ z = (2π)^{-1/2} e^{-(z - θ)²/2}`: `L ≡ 0`, `completeScore f θ z = z - θ`, Fisher's identity
  reads `0 = E(z - θ)`, and Louis's formula reads `0 = 1 - 1`: all information is missing.
- `completeScore`: in the multinomial example of 7.1 it is `-38/(1 - θ) + (34 + y₃)/θ`
  (Little–Rubin, Example 8.5, p. 199); at `θ = 1/2` its mean under `missingLaw (1/2)` is
  `-76 + 118 = 42 > 0`, the observed score, so `θ = 1/2` is not stationary.
- `completeScore`: at `θ̂ = 0.626821` its mean under `missingLaw θ̂` is `0`, Fisher's
  identity at the maximum likelihood estimate.
- `completeScore` (negative control): it is the gradient of `log f θ` in `θ`, not of `f θ`; for
  the normal example the gradient of `f θ z` at `z = θ + 1` is `(2π)^{-1/2} e^{-1/2} = 0.24197`, not
  `1`.
- `EMRegular`: the multinomial example satisfies it on `U = (ε, 1 - ε)` for `0 < ε < 1/2`, with
  `G` a constant on the finite set `Z`.
- `EMRegular`: the normal example satisfies it on every bounded open `U`, with
  `G z = C (1 + z²)² sup_{θ ∈ U} e^{-(z - θ)²/2}`.
- `EMRegular` (negative control): the example `f θ z = e^{-θ²}/(z log² z)` on `(0, 1/2)` of 7.1
  meets every condition except the integrability of `log f θ` on `U = (-1, 1)`, and there Louis's
  formula fails: `-D²L = 2` and the covariance term is `0`, while `emQ ≡ 0` makes the
  complete-information term `0`.

### 7.4 The derivative of the EM map, fractions of missing information and the rate

- `comp_fderiv_emMap_eq`: under `EMRegular` on `U ∋ θ*`, if `M θ* = θ*`, for `θ'` near `θ*` the
  value `M θ'` maximizes `Q(· | θ')` over `U`, and `M` is differentiable at `θ*`, then
  `i_{com} ∘ DM(θ*) = i_{mis}`. Route: `∇₁Q(M θ' | θ') = 0` near `θ*`; differentiate in `θ'` at
  `θ*`, with `D₁₂Q(θ* | θ*) = i_{mis}` from the derivative of the missing-data density.
- `spectrum_subset_Ico_of_comp_eq`: under the hypotheses of `comp_fderiv_emMap_eq`, if moreover
  the observed information `i_{obs} = -D²L(θ*)` satisfies `i_{obs} ≥ c > 0`, the spectrum of `DM`
  lies in `[0, 1)`. Route: by `louis_formula`, `i_{obs} = i_{com} - i_{mis}` with `i_{mis} ≥ 0`,
  `i_{com}` is self-adjoint, being the Hessian of a `C²` function, and `i_{com} ∘ DM = i_{mis}`
  by `comp_fderiv_emMap_eq`; the operator step is that for self-adjoint `i_{com}`, positive
  `i_{mis}` with `i_{com} - i_{mis} ≥ c > 0` and `i_{com} ∘ DM = i_{mis}`, the spectrum of `DM`
  lies in `[0, 1)`. These are the fractions of missing information:
  `DM = i_{com}⁻¹ i_{mis} = I - i_{com}⁻¹ i_{obs}` is similar to the self-adjoint
  `i_{com}^{-1/2} i_{mis} i_{com}^{-1/2}`, and Little–Rubin's `i_{mis} i_{com}⁻¹` is its transpose
  (Little–Rubin, §8.4.3, (8.28), p. 198); the rate (8.29), p. 198, is governed by its largest
  eigenvalue (p. 199).
- `tendsto_iterate_emMap`: under the hypotheses of `spectrum_subset_Ico_of_comp_eq`, there is a
  neighbourhood of `θ*` from which the iterates `M^[t] θ₀` converge to `θ*`, and for every `r` above
  every eigenvalue of `DM` there is `C` with `‖M^[t] θ₀ - θ*‖ ≤ C rᵗ`; that is,
  `limsup ‖θ_t - θ*‖^{1/t} ≤ λ_max`. Route: in the `i_{com}` inner product `DM` is self-adjoint with
  norm `λ_max < 1`. For `r > λ_max`, differentiability at `θ*` gives a ball `B` about `θ*` in that
  norm on which `‖M θ - θ*‖_* ≤ r ‖θ - θ*‖_*`; for `r < 1` this radial estimate maps `B` into
  itself, and induction gives `‖M^[t] θ₀ - θ*‖_* ≤ rᵗ ‖θ₀ - θ*‖_*` for `θ₀ ∈ B`. Take `V` the ball
  for one `r₀ ∈ (λ_max, 1)`; for smaller `r` the iterates from `V` enter the smaller ball after
  finitely many steps, which fixes `C`, and norm equivalence returns to `‖·‖`. Only this radial
  estimate is used, not a Lipschitz bound between pairs of points of `B`.

*Needs:* 7.3; Mathlib `spectrum`, `ContinuousLinearMap.IsPositive`.

**Checks.**

- The multinomial example of 7.1 (Little–Rubin, Example 8.5, pp. 199–200): at
  `θ̂ = 0.626821`, `i_{com} = 435.318`, `i_{obs} = 377.517`, `i_{mis} = 57.801`, and the fraction
  of missing information is `0.13278`; the EM error ratios `|θ_{t+1} - θ̂|/|θ_t - θ̂|` are
  `0.132779` from `t = 5` on (Table 8.1, p. 191, prints `0.1328`). Little–Rubin print
  `435.8 - 57.8 = 377.5`; the computation gives `435.3`, as they print on the line above.
- `spectrum_subset_Ico_of_comp_eq`: with no missing data `i_{mis} = 0`, `DM = 0` and EM converges in
  one step; the bound `λ < 1` fails only if `i_{obs}` is singular.

### Examples

- The multinomial example of 7.1 (Little–Rubin, Example 8.2, p. 190): EM from `θ₀ = 1/2` gives
  `0.608247, 0.624321, 0.626489, …` with increasing log-likelihood (7.2), converging to
  `θ̂ = 0.626821` at the rate `0.13278`, the fraction of missing information
  `i_{mis}/i_{com} = 57.801/435.318` (7.4).
- The normal example of 7.1: `L ≡ 0`, each EM step returns its starting point, and Louis's
  formula reads `0 = 1 - 1` (7.3): all information is missing.

### Dependencies

Layer 1 (for the inner products); Mathlib.

## Layer 8: multiple imputation

### 8.1 Laws of total variance

- The law of total variance of a mixture `κ ∘ₘ ν`,
  `Var(κ ∘ₘ ν) = ∫ Var(κ z) dν(z) + Var_ν(z ↦ mean of κ z)`, is Tau Ceti's
  `ProbabilityTheory.Kernel.variance_comp`, and the covariance form is
  `ProbabilityTheory.Kernel.covariance_comp`.
- `condVar_ae_eq_condExp_condVar_add_condVar_condExp`: for `m₁ ≤ m₂ ≤ m₀` and `Θ ∈ L²`,
  `Var[Θ | m₁] = E[Var[Θ | m₂] | m₁] + Var[E[Θ | m₂] | m₁]` a.e. Route: Mathlib
  `condVar_ae_eq_condExp_sq_sub_sq_condExp` and the tower property `condExp_condExp_of_le`; the
  unconditional case `m₁ = ⊥` is Mathlib's `integral_condVar_add_variance_condExp`.

With `m₁ = σ(Y_obs)`, `m₂ = σ(Y_obs, Y_mis)` these are the two identities of Little–Rubin,
(10.9)–(10.10), p. 233.

*Needs:* Mathlib `condVar`, `Measure.bind`.

### 8.2 The posterior as a mixture over imputations

- `condDistrib_ae_eq_comp`: for a joint law `J` of `(θ, Y_obs, Y_mis)` with standard Borel `M`,
  `condDistrib θ Y_obs = condDistrib θ (Y_obs, Y_mis) ∘ₖ (Kernel.id ×ₖ condDistrib Y_mis Y_obs)`,
  `J.map Y_obs`-a.e.: the observed-data posterior is the complete-data posterior averaged over
  the posterior predictive law of the missing data (Little–Rubin, (10.8), p. 233).

At fixed observed data this identifies `κ ∘ₘ ν` of the Conventions with the observed-data
posterior.

*Needs:* Mathlib `condDistrib`, `Kernel.comp`, `Kernel.prod`.

### 8.3 Rubin's combining rules, exact form

- `miMean κ z = D⁻¹ Σ_d mean(κ z_d)` (`θ̄`), `miWithin κ z = D⁻¹ Σ_d Var(κ z_d)` (`V̄`),
  `miBetween κ z = (D - 1)⁻¹ Σ_d (mean(κ z_d) - θ̄)²` (`B`), and
  `rubinTotalVariance = V̄ + (1 + D⁻¹) B` (`T`) (Little–Rubin, (10.12)–(10.14), p. 234).
- `integral_rubinTotalVariance`: for imputations `z₁, …, z_D` i.i.d. from `ν`, `D ≥ 2`, `x²`
  integrable under `κ ∘ₘ ν`, and `θ` drawn from `κ ∘ₘ ν` independently of the imputations:
  - `E θ̄ = E(θ | Y_obs)`;
  - `E T = Var(θ | Y_obs) + D⁻¹ B_∞`, with `B_∞ = Var_ν(mean of κ z)`;
  - `E(θ - θ̄)² = Var(θ | Y_obs) + D⁻¹ B_∞`.
  Route, exact: `E V̄ = V_∞` and `E B = B_∞` (unbiasedness with divisor `D - 1`, Tau Ceti
  `integral_finiteMean_sub_sq`), `Var(κ ∘ₘ ν) = V_∞ + B_∞` by 8.1, and independence of `θ` and
  `θ̄` with `Var θ̄ = B_∞/D`.
- **Vector estimands** (`integral_rubinTotalVariance_vector`). For
  `κ : Kernel M (EuclideanSpace ℝ (Fin k))` with `‖x‖²` integrable under `κ ∘ₘ ν` the same three
  statements hold with squares replaced by outer products and variances by `covarianceBilin`
  matrices, the mixture step coordinatewise by `ProbabilityTheory.Kernel.covariance_comp`.
- **What is not claimed.** The statements are exact moment identities given the observed data.
  The Student-`t` reference distribution of Little–Rubin (10.15) and the frequentist validity of
  `T` are approximations in the source and are not targets.

*Needs:* 8.1, 8.2; Mathlib `Measure.pi`, `variance`, `covarianceBilin`; Tau Ceti
`integral_finiteMean_sub_sq`, `ProbabilityTheory.Kernel.variance_comp` and
`ProbabilityTheory.Kernel.covariance_comp`.

**Checks.**

- `integral_rubinTotalVariance`: `κ z = N(z, 1)`, `ν = N(0, 1)`: `κ ∘ₘ ν = N(0, 2)`,
  `V_∞ = B_∞ = 1`, and `E T = 2 + 1/D`; for `D = 5`, `2.2`, and `E(θ - θ̄)² = 2.2`.

- `miMean`, `miWithin`, `miBetween`, `rubinTotalVariance`: for `κ z = N(z, 1)`, `D = 2` and
  `z = (0, 2)`: `θ̄ = 1`, `V̄ = 1`, `B = (1 + 1)/1 = 2` and `T = 1 + 1.5 · 2 = 4`.
- `miMean`, `miWithin`: for `D = 1`, `θ̄` and `V̄` are the mean and the variance of `κ z₁`; for
  `D = 0` both are `0`, by Lean's `0⁻¹ = 0`.
- `miBetween` (negative control): with divisor `D` instead of `D - 1`, `E T = 1 + 1.2 · 0.8 = 1.96`
  for `D = 5`, not `2.2`.
- `miBetween` (negative control): for `D = 1` the divisor is `0⁻¹ = 0` in Lean and `B = 0`, so
  `E T = V_∞`, short of `Var(θ | Y_obs) + B_∞` by `2 B_∞`; hence `D ≥ 2` in
  `integral_rubinTotalVariance`.
- `rubinTotalVariance`: if every `κ z` is the same law, `B = 0` and `T = V̄` is its variance, with
  no inflation.
- `miMean`: for `κ z = N(z, 1)`, `D = 3` and `z = (0, 1, 2)`, `θ̄ = 1`.
- `miWithin` (negative control): in the same case `V̄ = 1`, the average of the completed-data
  variances, not the variance `1 + 2/3 = 5/3` of the equal mixture of `N(0, 1)`, `N(1, 1)` and
  `N(2, 1)`.
- `rubinTotalVariance`: in the same case `B = (1 + 0 + 1)/2 = 1` and `T = 1 + (4/3) · 1 = 7/3`;
  without the factor `1 + D⁻¹` it would be `V̄ + B = 2`.

### Examples

- `κ z = N(z, 1)` and `ν = N(0, 1)`: the mixture `κ ∘ₘ ν` is `N(0, 2)`, with `V_∞ = B_∞ = 1`
  (8.1). With `D = 5` imputations `E T = E(θ - θ̄)² = 2 + 1/5 = 2.2`, and the imputations
  `z = (0, 2)` give `θ̄ = 1`, `V̄ = 1`, `B = 2` and `T = 4` (8.3).

### Dependencies

Mathlib; Tau Ceti sample means.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Tangent sets that are not linear spaces.** The convolution and minimax theorems for convex
  tangent cones and the regular case for nonconvex cones (van der Vaart, pp. 366–367). They need
  cone versions of the limit-experiment propositions, which MathematicalStatisticsAsymptotic does
  not provide.
- **Infinite-dimensional parameters**: efficiency in `ℓ^∞(T)` and product spaces (van der Vaart,
  Theorems 25.47 and 25.50; Kosorok, Chapter 18), and the efficiency of the empirical distribution
  function as a process.
- **Semiparametric tests** (van der Vaart, §25.6).
- **Efficient score equations under Donsker conditions** (van der Vaart, Theorems 25.54 and
  25.59), maximum likelihood in semiparametric models, profile likelihood, and the NPMLE.
- **Examples requiring empirical-process or counting-process theory**: the Cox model, censoring,
  current status data, mixtures and frailty (van der Vaart, Chapter 25).
- **Heteroscedastic partially linear models** and efficient estimation of `β` (the partially
  linear efficient score of 3.4 is at a homoscedastic law), and double machine learning beyond the
  missing mean.
- **Targeted maximum likelihood**, estimation of treatment effects, and coarsening at random
  beyond a single missing response (van der Laan–Robins; Tsiatis).
- **Nonignorable missingness**, selection and pattern-mixture models.
- **Rubin's Student-`t` approximation**, its degrees of freedom, and the frequentist validity of
  multiple imputation (Little–Rubin, §10.2; Rubin 1987): these are approximations in the sources.
- **EM variants and accelerations**: ECM, the supplemented EM algorithm for the observed
  information, and global convergence of EM.

## Prior formalization

The headlines of Layers 3–6 are formalized in `CKSD/Asymptotics/` of
[lean-CKSD](https://github.com/bjbraams/lean-CKSD) (Apache 2.0), the Core Knowledge of Statistics
and Data Science project:
- `Statistics.lean` defines the nuisance tangent space as a closed submodule, the efficient score,
  sample splits and cross-fitted averages, and the missing-mean estimating function;
- `Semiparametric.lean` proves the orthogonality of the symmetric-location score to the even
  nuisance scores, and states with admitted proofs the convolution bound (its synopsis item 34),
  the characterization of efficiency, and the adaptive estimator of a centre of symmetry (item
  41);
- `CrossFitting.lean` proves the cross-fitted missing-mean theorem (item 39) without a fold-size
  condition, which this roadmap adopts in 5.1 and 6.5;
- `QMDReference.lean` treats quadratic-mean differentiability relative to a reference measure.

Items 35–37, 40, 42 and 43 (ignorability, EM, double robustness, partially linear regression,
missing information, combining rules) are not formalized there; its structure notes record that
the unconditional law of total variance is Mathlib's and nothing else of Layers 7–8 exists.
Its synopsis statement of ignorability omits positivity of the propensity factor, which the
likelihood statement of 6.2 adds. The map, which is not prescriptive:

| Layer | lean-CKSD files |
|---|---|
| 1 | Asymptotics: Statistics |
| 2 | Asymptotics: QMDReference |
| 3–4 | Asymptotics: Semiparametric, Statistics |
| 5 | Asymptotics: CrossFitting, Semiparametric |
| 6 | Asymptotics: CrossFitting, Statistics |
| 7–8 | none |

Related libraries:
- [Statlib](https://github.com/stat-lib/statlib) (Apache 2.0) develops contiguity and quadratic-mean
  differentiability on Mathlib's kernel vocabulary; it has no tangent spaces or missing-data
  structures.

## Downstream consumers

No other roadmap consumes the results of this one. MathematicalStatisticsAsymptotic leaves the
semiparametric one-step estimator with sample splitting to this roadmap (5.2).

## References

The locators refer to these editions; page numbers are printed page numbers.

- A. W. van der Vaart, *Asymptotic Statistics*, Cambridge University Press, 1998.
- P. J. Bickel, C. A. J. Klaassen, Y. Ritov and J. A. Wellner, *Efficient and Adaptive
  Estimation for Semiparametric Models*, Johns Hopkins University Press, 1993 (Springer reprint,
  1998).
- M. R. Kosorok, *Introduction to Empirical Processes and Semiparametric Inference*, Springer,
  2008.
- R. J. A. Little and D. B. Rubin, *Statistical Analysis with Missing Data*, 3rd ed., Wiley,
  2020.

Also cited, without locators:

- A. P. Dempster, N. M. Laird and D. B. Rubin, Maximum likelihood from incomplete data via the
  EM algorithm, *J. Roy. Statist. Soc. Ser. B* 39 (1977), 1–38.
- C. A. J. Klaassen, Consistent estimation of the influence function of locally asymptotically
  linear estimators, *Ann. Statist.* 15 (1987), 1548–1562.
- T. A. Louis, Finding the observed information matrix when using the EM algorithm, *J. Roy.
  Statist. Soc. Ser. B* 44 (1982), 226–233.
- D. B. Rubin, *Multiple Imputation for Nonresponse in Surveys*, Wiley, 1987.
- A. A. Tsiatis, *Semiparametric Theory and Missing Data*, Springer, 2006.
- M. J. van der Laan and J. M. Robins, *Unified Methods for Censored Longitudinal Data and
  Causality*, Springer, 2003.

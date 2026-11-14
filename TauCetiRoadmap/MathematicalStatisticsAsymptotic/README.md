# Roadmap: asymptotic and robust statistics

**Summary.** This roadmap builds first-order asymptotic statistics and robustness on Mathlib's
convergence in law, its central limit theorem and its Gaussian measures, and on the finite-sample
core of [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md):
- the missing Euclidean limit theorems: the multivariate Lindeberg–Feller and i.i.d. central limit
  theorems, Gaussian quadratic forms and the second-order delta method;
- weak convergence of maps that need not be measurable, in the sense of Hoffmann-Jørgensen, and
  the space `ℓ^∞(T)`;
- empirical processes: Glivenko–Cantelli and Donsker theorems under bracketing and uniform
  entropy, VC classes, the maximal inequalities, and the classical Donsker theorem with the
  Brownian bridge limit;
- Hadamard differentiability, the functional delta method and the argmax theorem;
- M- and Z-estimators, maximum likelihood, one-step estimators, rates, misspecification, sample
  quantiles and the Bahadur representation;
- Hájek projections, U-statistics with the Hoeffding decomposition and the degenerate case, and
  L-statistics;
- Le Cam's first and third lemmas, local asymptotic normality of models differentiable in
  quadratic mean, the asymptotic representation, convolution and local asymptotic minimax
  theorems, and superefficiency;
- likelihood ratio, Wald and score tests, power envelopes, Pitman efficiency, Pearson's tests and
  the generalized method of moments;
- robust statistics: influence functions, Hampel's and Huber's optimality, breakdown points and
  regression M-estimators.

The material is the standard graduate content of van der Vaart (1998) and van der
Vaart–Wellner (2023), with the robust theory of Jurečková–Sen and Lehmann (1999) (see
[References](#references)). Each headline carries a locator in a text listed under References,
except the contamination bound for the median in 9.3, which carries a proof route.

**This roadmap is a supplier.** The roadmaps
[MathematicalStatisticsSemiparametric](../MathematicalStatisticsSemiparametric/README.md),
[MathematicalStatisticsHigherOrderAndResampling](../MathematicalStatisticsHigherOrderAndResampling/README.md),
[MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) and
[MathematicalStatisticsHighDimensional](../MathematicalStatisticsHighDimensional/README.md)
consume its empirical-process toolkit and its limits of experiments. The headlines they use are
listed under [Supplied to later roadmaps](#supplied-to-later-roadmaps), and their names and
statements are part of the contract of this roadmap.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, every headline below that
carries a Lean name, with the definitions those statements need. The remaining targets are
stated in prose with their locators or proof routes.

Suggested home: `TauCeti/Statistics/Asymptotic/`, with one subdirectory per layer.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Limit theorems in Euclidean space.** Convergence in probability and boundedness in
   probability on sample spaces that vary with `n`, with Slutsky's lemma there; the multivariate
   Lindeberg–Feller theorem; the multivariate central limit theorem; the laws of Gaussian
   quadratic forms; the second-order delta method.
2. **Weak convergence of arbitrary maps.** Outer integrals, weak convergence in the sense of
   Hoffmann-Jørgensen, asymptotic tightness and measurability, the portmanteau, continuous
   mapping and Slutsky theorems for it, the bridge to Mathlib's convergence in law, the space
   `ℓ^∞(T)`, convergence there from marginals and asymptotic equicontinuity, and Brownian bridge
   laws.
3. **Empirical processes.** Glivenko–Cantelli and Donsker classes, bracketing and covering
   numbers, the finite sub-Gaussian maximal inequality, symmetrization, chaining and the
   bracketing maximal inequality, the Glivenko–Cantelli and Donsker theorems under bracketing
   and uniform entropy, VC classes, the classical theorems for the empirical distribution
   function with the `F`-Brownian bridge, and the asymptotic equicontinuity lemma.
4. **Differentiable functionals.** Hadamard differentiability, its chain rule, the quantile
   functional, the functional delta method and the argmax continuous mapping theorem.
5. **M- and Z-estimators.** Consistency under uniform convergence, Wald's consistency of maximum
   likelihood, the Z-estimator theorem, asymptotic normality of maximum likelihood, parametric
   one-step and discretized one-step estimators, M-estimators with Lipschitz criteria, the rate theorem,
   misspecified maximum likelihood, sample quantiles and the Bahadur representation.
6. **Projections and U- and L-statistics.** The Hájek projection and its limit theorem, the
   nondegenerate U-statistic theorem, the Hoeffding decomposition with the optimality of
   U-statistics over every family containing the finitely supported laws, degenerate quadratic
   U-statistics, L-statistics and the trimmed mean.
7. **Limits of experiments.** Le Cam's first and third lemmas, differentiability in quadratic
   mean and local asymptotic normality, the expansion of the Kullback–Leibler divergence, the
   asymptotic representation theorem, Anderson's lemma, the convolution and local asymptotic
   minimax theorems, and superefficiency.
8. **Tests and efficiency.** Likelihood ratio, Wald and score tests and their local limits, the
   likelihood ratio on converging local parameter sets, the asymptotic power envelope, local
   power and Pitman efficiency, the efficiencies of the sign, Wilcoxon and `t` tests with the
   Hodges–Lehmann bound, Pearson's tests and the generalized method of moments.
9. **Robust statistics.** Influence functions, the influence function and asymptotic variance
   of location M-functionals, Hampel's optimality and Huber's minimax property, the median and
   its contamination bound, breakdown points of the mean, median, least squares, least median of
   squares and least absolute deviations, influence functions of Hadamard differentiable
   functionals, and regression M-estimators.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- the first-order delta method and the stochastic algebra of convergence in probability, Slutsky's
  lemma on a fixed space, i.i.d. sequences and the weak law, and contiguity with its sufficient
  uniform-integrability criterion:
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 8.1–8.6;
- the definition of the U-statistic, the completeness of symmetric statistics (Foundations 2.4)
  and the optimality of U-statistics among unbiased estimators over a family closed under binary
  mixtures and complete for the identity statistic (Foundations 4.2). 6.3 transfers that
  optimality to every family of laws that contains the finitely supported laws;
- the empirical distribution function, the sample quantile and the Huber score (Foundations 9.1
  and 9.2);
- the scalar central limit theorem `tendstoInDistribution_inv_sqrt_mul_sum_sub`, the Cramér–Wold
  device `tendstoInDistribution_iff_tendstoInDistribution_inner`, multivariate Gaussian laws and
  the theory of tight families of measures: Mathlib;
- the chi-squared, noncentral chi-squared and multinomial laws and covariance matrices: Tau Ceti;
- Wiener measure and the Brownian bridge on `[0, 1]`:
  [StochasticCalculus](../StochasticCalculus/README.md) §1.2 and §1.4. 3.4 identifies the
  `F`-Brownian bridge as an image of that law and builds nothing about Brownian motion;
- Berry–Esseen bounds and Edgeworth expansions, the bootstrap, jackknife, empirical likelihood
  and subsampling: MathematicalStatisticsHigherOrderAndResampling;
- tangent sets, efficient influence functions, the semiparametric convolution bound and the
  semiparametric one-step estimator with sample splitting: MathematicalStatisticsSemiparametric.
  5.4 is the parametric Newton step only;
- the exact laws of rank statistics, rank tests and their optimal scores, the Kolmogorov law, the
  Kolmogorov–Smirnov and Cramér–von Mises tests, and the minimax lower-bound toolkit:
  MathematicalStatisticsNonparametric. 8.3 defines the sign statistic and the Wilcoxon signed-rank
  statistic only as far as their local power is computed, and Nonparametric consumes those
  definitions.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

### Supplied to later roadmaps

These headlines are the contract with the later statistics roadmaps; their names are fixed.

- Convergence on varying spaces: `TendstoInProbability` and `IsBoundedInProbabilityAlong` (1.1).
- Multivariate central limit theorems: `tendstoInDistribution_sum_of_lindeberg` and
  `tendstoInDistribution_inv_sqrt_smul_sum_sub_euclidean` (1.2).
- Gaussian quadratic forms, including the singular case
  `map_quadForm_pseudoInverse_multivariateGaussian` (1.3).
- Weak convergence in `ℓ^∞(T)`: `outerIntegral`, `innerIntegral`, the extended outer expectation
  `outerLIntegral` with its Markov inequality (2.1), `TendstoInOuterDistribution`,
  asymptotic measurability and the bounded Lipschitz characterization (2.2), `Linfty`,
  `liftLinfty`, `marginal`, the bridge `TendstoInOuterDistribution.tendstoInDistribution_comp`, the
  continuous mapping theorem `TendstoInOuterDistribution.comp`,
  `tendstoInOuterDistribution_of_marginal_of_equicontinuous`, `ext_of_marginal` and
  `IsBrownianBridgeLaw` (Layer 2).
- Glivenko–Cantelli and Donsker classes: `IsGlivenkoCantelli`, `IsDonsker`,
  `isGlivenkoCantelli_of_bracketingNumber_lt_top`, `isDonsker_of_bracketingEntropyIntegral_lt_top`,
  `isGlivenkoCantelli_of_uniformCoveringNumber`, `isDonsker_of_uniformEntropyIntegral_lt_top`,
  `coveringNumberLp_indicator_le_of_vcDimSet` and `tendstoInProbability_empiricalProcess_sub`
  (3.4–3.6).
- The empirical distribution function: the classical Glivenko–Cantelli theorem,
  `isDonsker_indicator_Iic` with the Brownian bridge identification
  `isBrownianBridgeLaw_map_comp_cdf` (3.4).
- Hadamard differentiability and the functional delta method: `HasHadamardDerivWithinAt`,
  `hasHadamardDerivWithinAt_quantileFunctional`,
  `tendstoInOuterDistribution_functional_delta_method` (Layer 4).
- The argmax theorem `tendstoInOuterDistribution_argmax` (4.3).
- The Z-estimator theorem with Donsker conditions `zEstimator_asymptotically_linear` and
  `zEstimator_tendstoInDistribution` (5.3).
- Local asymptotic normality: `HasQMDWithinAt` with the sufficient condition for smooth and
  location families, `IsLocallyAsymptoticallyNormal` (fixed-`h` form),
  `tendstoInProbability_likelihoodRatio_of_hasQMDWithinAt` (7.3); Le Cam's lemmas
  `isContiguous_iff_forall_mapClusterPt_integral_eq_one`, `tendstoInDistribution_leCam_third`
  and `tendstoInDistribution_leCam_third_gaussian` (7.1–7.2).
- The representation theorem `exists_kernel_of_isLocallyAsymptoticallyNormal` (7.4), in the
  fixed-`h` form.
- The Gaussian shift and the convolution and local asymptotic minimax theorems:
  `exists_conv_of_equivariantInLaw`, `lintegral_multivariateGaussian_le_iSup_risk`,
  `lintegral_multivariateGaussian_le_conv` (Anderson's lemma), `exists_conv_of_isRegular` and
  `lintegral_multivariateGaussian_le_localMinimax` (7.5–7.6), all under fixed-`h` local asymptotic
  normality.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the Tau Ceti namespace, with Mathlib's `ProbabilityTheory` and
  `MeasureTheory` opened throughout. `Suggested.lean` states the prototypes in the namespace
  `TauCetiRoadmap.MathematicalStatisticsAsymptotic`.
- **Samples.** A sample of size `n` from `P` on a measurable space `X` is `x : Fin n → X` under
  `Measure.pi (fun _ : Fin n ↦ P)`, as in Foundations. A statistic is a family
  `T : ∀ n, (Fin n → X) → E`, so the sample space varies with `n`. Triangular arrays and
  sequences of experiments live on spaces `Ω n` with probability measures `μ n`. Almost sure
  statements about an i.i.d. sequence use `Measure.infinitePi (fun _ : ℕ ↦ P)` on `ℕ → X`, and a
  statistic of the sequence at size `n` uses its first `n` coordinates.
- **Outer measure.** Mathlib's `μ s` is defined for every set `s` and is the outer measure of a
  non-measurable set. Statements of the form `μ {ω | …} → 0` and `∀ᵐ ω ∂μ, …` are therefore in
  outer probability and outer almost surely, and need no measurability. Outer probability is the
  convention of van der Vaart–Wellner, §1.2. For almost sure convergence of non-measurable maps,
  this roadmap uses Mathlib's `∀ᵐ` form: the set where convergence fails is contained in a
  measurable null set. Van der Vaart–Wellner's outer almost sure convergence, `‖Xₙ - X‖* → 0`
  almost surely for the measurable covers, is stronger in general; the two agree for the
  Glivenko–Cantelli suprema of pointwise separable classes, which are measurable.
- **Convergence in probability** along a filter on varying spaces is
  `TendstoInProbability μ X l c`: `μ i {ω | ε ≤ dist (X i ω) c} → 0` for every `ε > 0`. For a
  constant family of measures it is Mathlib's `TendstoInMeasure`, the convention of Foundations,
  and 1.1 proves the adapter. **Boundedness in probability** on varying spaces is
  `IsBoundedInProbabilityAlong`, which is the boundedness in probability of Foundations 8.2 for
  a constant family and `l = atTop`.
- **Convergence in law of measurable maps** is Mathlib's `TendstoInDistribution X l Z μ μ'`,
  which allows the spaces `Ω i` to vary. Limits are given either as a random variable `Z` or, with
  `Z = id`, as a law.
- **Weak convergence of arbitrary maps** is the Hoffmann-Jørgensen convergence
  `TendstoInOuterDistribution X l L μ`: for every bounded continuous `f : E →ᵇ ℝ`, the outer
  integrals `outerIntegral (μ i) (f ∘ X i)` tend to `∫ f dL`, where `L` is a Borel probability
  measure on `E` (van der Vaart–Wellner, Def 1.3.3, p. 16). The outer
  integral of a real function is the infimum of the integrals of its measurable integrable
  majorants; for a bounded function under a probability measure it is attained by the minimal
  measurable majorant (2.1). Limits in `ℓ^∞(T)` are required to be tight Borel laws,
  `IsTightMeasureSet {L}`.
- **Outer expectations of unbounded functions.** The real-valued `outerIntegral` is used only for
  bounded functions: a function with no integrable majorant would get the empty real infimum `0`.
  Maximal inequalities and rate moduli, written `E*`, use the extended-valued
  `outerLIntegral μ f ∈ [0, ∞]` of a nonnegative `f`, which is `∞` in that case (2.1).
- **Outer and inner probability.** `μ s` for a possibly non-measurable `s` is Mathlib's outer
  measure, the outer probability `μ*(s)`; the inner probability of `s` under a probability measure
  is `μ_*(s) = 1 - μ sᶜ`.

  *Why this choice.* The empirical process of the empirical distribution function is not Borel
  measurable as a map into `ℓ^∞(ℝ)` (see the Checks of 2.3), so a theory restricted to
  measurable maps would exclude the central example. The cylinder σ-algebra makes the process
  measurable but does not make the supremum norm, or any other functional the applications need,
  continuous for it, so the continuous mapping theorem would not apply to the
  Kolmogorov–Smirnov statistic. Outer integrals keep the Borel σ-algebra and every bounded
  continuous functional, at the cost of measurability bookkeeping that the bridge theorem of 2.2
  discharges: a measurable continuous image of a weakly convergent sequence converges in law in
  Mathlib's sense. Every limit statement of Layers 5–9 is for measurable statistics and is stated
  with `TendstoInDistribution`.
- **The space `ℓ^∞(T)`** is `Linfty T := lp (fun _ : T ↦ ℝ) ∞` with the supremum norm and its Borel
  σ-algebra. A function `g : T → ℝ` enters it through `liftLinfty g`, which is `g` when `g` is
  bounded and the junk value `0` otherwise; every theorem that uses `liftLinfty` either assumes
  boundedness or concerns functions that are bounded by construction.
- **Gaussian laws.** Euclidean parameters and statistics live in `EuclideanSpace ℝ (Fin k)`.
  Covariance and information matrices are `Matrix (Fin k) (Fin k) ℝ`, applied through
  `WithLp.ofLp`, `*ᵥ` and `Matrix.toEuclideanCLM`. The centred Gaussian law with covariance `S` is
  Mathlib's `multivariateGaussian 0 S`; the covariance matrix of a law is Tau Ceti's
  `TauCeti.covMatrix`. The standard normal quantile `z_α` is
  `Measure.quantile (gaussianReal 0 1) (1 - α)` and `Φ` is `cdf (gaussianReal 0 1)`.
- **Likelihood ratios** are `((Q n).rnDeriv (P n) ω).toReal`, the density of the absolutely
  continuous part of `Q n`. **Local asymptotic normality** is stated in multiplicative form:
  `dQₙ,ₕ/dQₙ,₀ · exp(-⟪h, Δₙ⟫ + hᵀIh/2) → 1` in `Qₙ,₀`-probability, for every fixed local
  parameter `h`. Van der Vaart's Def 7.14, p. 104, asks for it along every convergent sequence
  `hₙ → h`; the fixed-`h` form is weaker, and it is the hypothesis of every theorem of Layers 7–8
  that assumes local asymptotic normality, since their proofs use only finitely many fixed local
  parameters at a time. They therefore apply to the path families of semiparametric models,
  which give local asymptotic normality only at fixed `h` (van der Vaart, Lemma 25.14). Models
  differentiable in quadratic mean satisfy the sequence form (van der Vaart, Thm 7.2, p. 94),
  proved in 7.3. The additive form
  `log(dQ/dP) = ⟪h, Δₙ⟫ - hᵀIh/2 + o_P(1)` is equivalent, because the product is bounded away from
  `0` in probability, but in Lean `Real.log 0 = 0` makes it false at the points where the ratio
  vanishes, so it is not used as a definition. 7.3 proves the equivalence.
- **VC dimension.** The VC dimension of a family of sets is the largest size of a shattered
  finite set, as in Mathlib's `Finset.vcDim`, with values in `ℕ∞`. This is the `V(C)` of van der
  Vaart–Wellner (2023), §2.6.1, p. 199. Van der Vaart (1998) uses the VC index, the least `n`
  such that no set of size `n` is shattered, which is the dimension plus one for a nonempty
  family. The empty family shatters no set, so its index is `0`, while `vcDimSet` gives it
  dimension `0`.
- **Entropy.** Bracketing and covering numbers have values in `ℕ∞`, entropy integrals in `ℝ≥0∞`,
  and an infinite number contributes `∞` to the integrand, so that a finite entropy integral
  asserts finiteness of the numbers.
- **Hadamard derivatives** are continuous linear maps on the whole normed space `D`, restricted in
  use to the tangent set `D₀`. Every derivative used here is of this kind; the quantile
  derivative is `-(1/f) · lp.evalCLM ℝ (fun _ : ℝ ↦ ℝ) ∞ ξ`.
- **Integrals** are Bochner integrals; every theorem that uses one carries the integrability
  hypotheses that exclude the junk value `0`, unless its integrand is bounded and its measure
  finite. Suprema of real families are taken in `ℝ` only where a `BddAbove` hypothesis is present,
  and in `ℝ≥0∞` otherwise (the Glivenko–Cantelli supremum).
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references). A locator marked *by the same argument* names the theorem whose
  proof the target follows when the target's hypotheses differ from those printed.

## Exact supplier contracts

### From Mathlib

- **Convergence in law:** `TendstoInDistribution` (on varying spaces),
  `TendstoInDistribution.continuous_comp`, `tendstoInDistribution_of_tendstoInMeasure_sub`,
  `TendstoInDistribution.prodMk_of_tendstoInMeasure_const`,
  `tendstoInDistribution_iff_forall_integral_rclike_tendsto`, the portmanteau theorem
  `tendsto_iff_forall_lipschitz_integral_tendsto` (`Mathlib/MeasureTheory/Measure/Portmanteau.lean`),
  Lévy's continuity theorem (`Mathlib/MeasureTheory/Measure/LevyConvergence.lean`) and
  `TendstoInMeasure`.
- **Central limit theorem and Cramér–Wold:** `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub`
  (`Mathlib/Probability/CentralLimitTheorem.lean`) and
  `tendstoInDistribution_iff_tendstoInDistribution_inner` (`Mathlib/Probability/CramerWold.lean`).
- **Gaussian measures:** `gaussianReal`, `multivariateGaussian` with `charFun_multivariateGaussian`
  (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`), `stdGaussian`, `IsGaussian`,
  `HasGaussianLaw`, `isGaussian_map_of_measurable`, `covarianceBilin` and `IsGaussianProcess`
  (`Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean`).
- **Tightness:** `IsTightMeasureSet`, Prokhorov's theorem `isCompact_closure_of_isTightMeasureSet`
  and its converse `isTightMeasureSet_of_isCompact_closure`
  (`Mathlib/MeasureTheory/Measure/Prokhorov.lean`).
- **Sub-Gaussian variables:** `HasSubgaussianMGF` with `HasSubgaussianMGF.measure_ge_le` and
  `HasSubgaussianMGF.sum_of_iIndepFun` (`Mathlib/Probability/Moments/SubGaussian.lean`).
- **Combinatorics and metric entropy:** `Finset.Shatters`, `Finset.vcDim` and the Sauer–Shelah
  bound `Finset.card_shatterer_le_sum_vcDim` (`Mathlib/Combinatorics/SetFamily/Shatter.lean`);
  `Metric.coveringNumber`, `Metric.externalCoveringNumber` and `Metric.packingNumber`
  (`Mathlib/Topology/MetricSpace/CoveringNumbers.lean`); Radon's theorem `radon_partition`
  (`Mathlib/Analysis/Convex/Radon.lean`).
- **Spaces:** `lp` with `lp.evalCLM` and `lp.completeSpace`; `BoundedContinuousFunction`;
  `ContinuousMap` on `unitInterval`.
- **Spectral theory:** the spectral theorem for compact self-adjoint operators
  `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` with
  `finite_dimensional_eigenspace` (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean`), and
  `isCompactOperator_of_tendsto`.
- **Likelihood:** `Measure.rnDeriv`, `llr`, `klDiv`, `tvDist`,
  `Kernel`, `IsMarkovKernel`, composition `κ ∘ₘ μ`, and `Measure.infinitePi`. The convolution
  `Measure.conv` is the additive form of `Measure.mconv` (`Mathlib/MeasureTheory/Group/Convolution.lean`).
- **Analysis:** `HasFDerivAt`, `HasGradientAt`, `HasDerivWithinAt`, `ContDiffOn`, the little-o
  relation `=o[𝓝 θ]`, `ConvexOn`, `UpperSemicontinuous`, `LowerSemicontinuous`, `MapClusterPt`,
  and `Convexity.StdSimplex`.
- **Sorting:** `Tuple.sort`.

Mathlib has no Lindeberg–Feller theorem, multivariate central limit theorem, Glivenko–Cantelli
or Donsker theorem, Hadamard derivative, Anderson's lemma or sub-Gaussian maximal inequality, and
its Brownian motion files (`Mathlib/Probability/BrownianMotion/`) define `IsPreBrownianReal` and
`IsBrownianReal` without constructing a Brownian motion.

### From Tau Ceti

- **Covariance:** `TauCeti.covMatrix` (`TauCeti/Probability/Moments/Covariance.lean`) and the
  Moore–Penrose inverse of a covariance matrix `Matrix.covariancePseudoInverse`
  (`TauCeti/Analysis/Matrix/CovariancePseudoInverse.lean`), whose Euclidean operator is Tau Ceti's
  `LinearMap.moorePenroseInverse`. The general finite-dimensional Moore–Penrose theory is owned by
  [OperatorTheory/PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md), PD-C19–PD-C27;
  1.3 uses only the covariance case already in the pinned Tau Ceti.
- **Chi-squared laws:** `TauCeti.Probability.chiSquaredMeasure` with `chiSquaredMeasure_zero`
  (`TauCeti/Probability/Distributions/ChiSquared/Basic.lean`);
  `TauCeti.Probability.noncentralChiSquaredMeasure` with
  `map_norm_sq_multivariateGaussian_noncentral` and `HasLaw.norm_sq_multivariateGaussian`
  (`TauCeti/Probability/Distributions/NoncentralChiSquared/Gaussian.lean`).
- **Gaussian projections:** `Submodule.map_norm_sq_starProjection_stdGaussian`
  (`TauCeti/Probability/Distributions/Gaussian/Projection.lean`): the squared norm of the
  orthogonal projection of a standard Gaussian vector onto a subspace `K` is `χ²` with
  `finrank K` degrees of freedom, including rank `0`. The norm laws of Gaussian projections are
  owned by [StandardDistributions](../StandardDistributions/README.md) §5.3; 1.3 and 8.4 use
  this theorem and do not restate it.
- **Multinomial laws:** `TauCeti.Probability.multinomialMeasure` with
  `isProbabilityMeasure_multinomialMeasure`, `multinomialToEuclidean` and
  `covMatrix_map_multinomialToEuclidean_multinomialMeasure`
  (`TauCeti/Probability/Distributions/Multinomial/Moments.lean`).
- **Quantiles and the normal law:** `MeasureTheory.Measure.quantile` with `quantile_le_iff`
  (`TauCeti/Probability/Quantile.lean`), `quantile_gaussianReal`, `cdf_gaussianReal_eq` and
  `hasDerivAt_cdf_gaussianReal` (`TauCeti/Probability/Distributions/Gaussian/`).
- **Location families:** `laplaceMeasure` and `logisticMeasure`
  (`TauCeti/Probability/Distributions/Laplace/Basic.lean`, `Logistic/Basic.lean`), used in the
  Checks of 8.3.
- **Empirical measures and order statistics:** `TauCeti.Probability.empiricalFiniteMeasure`
  (`TauCeti/Probability/Process/EmpiricalMeasure.lean`) and `TauCeti.orderStatistic`
  (`TauCeti/Data/Fin/Tuple/OrderStatistic.lean`).
- **Randomization:** `unitIntervalCoding` with `map_volume_unitIntervalCoding`
  (`TauCeti/Probability/Kernel/Randomization.lean`), which turns a Markov kernel into a
  randomized statistic `T(X, U)` with `U` uniform (7.4).

### From MathematicalStatisticsFoundations

[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) is the base.
This roadmap consumes:
- 2.4: the U-statistic `uStatistic`, the average of a kernel over injections `Fin m → Fin n`,
  and the completeness of symmetric statistics over a family closed under binary mixtures and
  complete for the identity statistic (6.3);
- 4.2: the optimality of U-statistics among unbiased estimators (6.3);
- 4.3: the information matrix `(∫ sᵢ sⱼ dP)ᵢⱼ` of a vector score, which this roadmap uses as
  `fisherInformation` (7.3);
- 8.1–8.3: the adapters to Mathlib's convergence, boundedness in probability on a fixed space
  and the algebra of convergence in probability there;
- 8.4: Slutsky's lemma without separability and the first-order delta method;
- 8.5: the i.i.d. predicate and the weak law of large numbers;
- 8.6: `IsContiguous`, its transfer of convergence in probability, and the sufficient condition
  for contiguity by absolute continuity and uniform integrability;
- 9.1: the empirical distribution function and the sample quantile, with the Galois inequality;
- 9.2: the Huber score, its derivative identity and the Kolmogorov–Smirnov statistic.

`Suggested.lean` carries local copies of `IsContiguous`, `uStatistic`, the empirical
distribution function of a finite sample (`empiricalCdf`), `sampleQuantile`, `huberScore` and the
information matrix `fisherInformation`, each with a docstring naming its owner. Foundations' own
`fisherInformation` is the scalar information of a one-parameter family; the matrix version
here is a different declaration and keeps this roadmap's name.

### From StochasticCalculus

[StochasticCalculus](../StochasticCalculus/README.md) owns the construction of Brownian motion.
This roadmap consumes its §1.2 (the existence of Wiener measure on `C(ℝ≥0, ℝ)`) and its
§1.4 (the Brownian bridge law on `[0, T]` with covariance `min(s, t) - st/T`), at `T = 1`, as a
Borel probability measure on `C(unitInterval, ℝ)` with centred Gaussian marginals of covariance
`min(s, t) - st`. 3.4 uses it only through these marginals. Its §1.5 (Donsker's invariance
principle for random walks) is not used: the classical Donsker theorem of 3.4 is proved by
bracketing.

### From the other statistics roadmaps

Nothing. This roadmap needs only Foundations among the statistics roadmaps.

## How to read the build

Layer 1 fills the Euclidean gaps: Mathlib proves the scalar central limit theorem, and this
roadmap adds the Lindeberg condition and dimension `k` by the Cramér–Wold device. Layer 2 is the
only place where non-measurable maps are handled. It fixes outer integrals and the
Hoffmann-Jørgensen convergence, proves the portmanteau and continuous mapping theorems for it,
and proves the bridge back to Mathlib. Layer 3 is the empirical-process toolkit: entropy numbers,
maximal inequalities by chaining, and the four Glivenko–Cantelli and Donsker theorems. Layer 4
adds the two transfer principles that turn process limits into limits of statistics, the
functional delta method and the argmax theorem.

Layers 5–9 are statistics. Every estimator theorem of Layer 5 has the same shape: consistency
gives localization, an empirical-process lemma (3.6) controls the remainder, and the derivative of
the population criterion linearizes; the result is an asymptotically linear estimator, which
converges in law by the multivariate central limit theorem. Layer 6 does the same for U- and
L-statistics by projection. Layer 7 is Le Cam's theory: contiguity and the third lemma move
limits from the null to local alternatives, local asymptotic normality reduces every local
problem to a Gaussian shift, and Anderson's lemma solves the Gaussian shift. Layer 8 applies
Layer 7 to tests, and Layer 9 applies Layers 4–5 to robust functionals.

The layers are in build order: each layer needs only earlier layers and the suppliers. Within
Layer 5 the order is 5.1 → 5.6 → 5.5 (see Layer 5). Apart from the maximum likelihood theorem of
7.3, which uses 5.5, Layer 7 needs only Layers 1–2 and Foundations and may be built directly
after Layer 2.

## Layer 1: limit theorems in Euclidean space

### 1.1 Convergence on varying spaces

- `TendstoInProbability μ X l c` and `IsBoundedInProbabilityAlong μ X l` (Conventions). For a
  constant family of finite measures the first is `TendstoInMeasure μ X l (fun _ ↦ c)` and the
  second is the boundedness in probability of Foundations 8.2 at `l = atTop`.
- The algebra of Foundations 8.3 on varying spaces: sums and constant multiples of sequences
  tending to `0` tend to `0`; continuous mapping at a constant; `O_P(1) · o_P(1) = o_P(1)`; a
  sequence that converges in law is bounded in probability; convergence of each coordinate in
  `EuclideanSpace ℝ (Fin k)` is convergence of the vector; and convergence in
  `μ`-probability transfers to a contiguous `ν` (Foundations 8.6 on varying spaces).
- **Slutsky's lemma on varying spaces**
  (`TendstoInDistribution.of_tendstoInProbability_dist`): if `Xᵢ → Z` in law and
  `dist (Yᵢ, Xᵢ) → 0` in probability, with `Yᵢ` a.e.-measurable, then `Yᵢ → Z` in law (van der
  Vaart, Thm 2.7(iv), p. 10). The joint form: if moreover `Wᵢ → c` in probability, then
  `(Yᵢ, Wᵢ) → (Z, c)` in law (Thm 2.7(v)).

*Proof route.* The Lipschitz portmanteau `tendsto_iff_forall_lipschitz_integral_tendsto`: for a
bounded Lipschitz `f`, `|∫ f(Yᵢ) - ∫ f(Xᵢ)| ≤ L ε + 2‖f‖ μᵢ{dist ≥ ε}`, and the outer measure
bounds the integral over the non-measurable part from above. Mathlib's
`tendstoInDistribution_of_tendstoInMeasure_sub` is the fixed-space, second-countable case.

*Needs:* Foundations 8.1–8.3, 8.6; Mathlib `TendstoInDistribution`, `TendstoInMeasure`.

**Checks.**

- `TendstoInProbability`: on `Ωₙ = Fin n → ℝ` under `N(0, 1)^n`, the sample mean tends to `0`
  (variance `1/n`); the first coordinate does not, its law being `N(0, 1)` for every `n`.
- `TendstoInProbability` needs no measurability: on `Ωₙ = [0, 1]` with Lebesgue measure,
  `Xₙ = n⁻¹ 1_A` for a non-measurable `A` tends to `0` in probability (the set `{ε ≤ Xₙ}` is
  empty once `n > 1/ε`), while `Xₙ = 1_A` does not: for `ε ≤ 1` the set `{ε ≤ Xₙ}` is `A`, of
  positive outer measure.
- `IsBoundedInProbabilityAlong`: `√n · (sample mean)` is bounded in probability (it is `N(0, 1)`
  for every `n`); `n · (sample mean)` is not, being `N(0, n)`.
- `IsBoundedInProbabilityAlong` is not a moment condition: on `[0, 1]` with Lebesgue measure,
  `Xₙ = n 1_{[0, 1/n]}` has mean `1` for every `n` and is bounded in probability, since
  `μ{C < Xₙ} ≤ 1/n` for every `C`.
- `IsBoundedInProbabilityAlong` along a filter: the constant sequence `Xᵢ = i` on a one-point
  space is bounded along any filter `l` that contains a bounded set of indices, such as the
  principal filter of `{0, 1}`, and is not bounded along `atTop`.

### 1.2 Lindeberg–Feller and the multivariate central limit theorem

- **Multivariate Lindeberg–Feller theorem** (`tendstoInDistribution_sum_of_lindeberg`): for each
  `n` let `Yₙ,₁, …, Yₙ,ₘₙ` be independent centred square-integrable random vectors in
  `EuclideanSpace ℝ (Fin k)` on `(Ωₙ, μₙ)`. If `∑ᵢ Cov Yₙ,ᵢ → S` and, for every `ε > 0`,
  `∑ᵢ E ‖Yₙ,ᵢ‖² 1{‖Yₙ,ᵢ‖ > ε} → 0`, then `∑ᵢ Yₙ,ᵢ → N(0, S)` in law (van der Vaart, Prop 2.27,
  p. 20).
- **Multivariate central limit theorem**
  (`tendstoInDistribution_inv_sqrt_smul_sum_sub_euclidean`): for an i.i.d. sequence in
  `EuclideanSpace ℝ (Fin k)` with finite second moment,
  `n^{-1/2} ∑_{i<n} (Xᵢ - E X₀) → N(0, Cov X₀)` in law (van der Vaart, Prop 2.17, p. 16).
- The i.i.d. sample form on `Fin n → X`: for a measurable `s : X → EuclideanSpace ℝ (Fin k)` with
  `E ‖s‖² < ∞`, `n^{-1/2} ∑ᵢ (s(xᵢ) - E s) → N(0, Cov s)` under `Measure.pi`. It is the form used
  in Layers 5–9.

*Proof route.* For the i.i.d. theorem, the Cramér–Wold device
`tendstoInDistribution_iff_tendstoInDistribution_inner` reduces to `⟪Xᵢ, t⟫`, which is Mathlib's
scalar theorem `tendstoInDistribution_inv_sqrt_mul_sum_sub` with variance `tᵀ (Cov X₀) t`; the
limit `⟪Z, t⟫` is `N(0, tᵀ S t)` by `charFun_multivariateGaussian`. The sample form follows by the
identity of the law of the first `n` terms with `Measure.pi` (Foundations 8.5). For
Lindeberg–Feller, Cramér–Wold again reduces to dimension one; there, compare characteristic
functions with `|e^{iu} - 1 - iu + u²/2| ≤ min(|u|³/6, u²)`, split each summand at `ε`, and use
`∏ aᵢ - ∏ bᵢ ≤ ∑ |aᵢ - bᵢ|` for complex numbers of modulus at most `1`; then Lévy's continuity
theorem. The Lindeberg condition gives `maxᵢ Var Yₙ,ᵢ → 0`, which controls
`|e^{-σ²/2} - (1 - σ²/2)|`.

*Needs:* 1.1; Mathlib's central limit theorem, Cramér–Wold and Lévy continuity; Tau Ceti
`covMatrix`.

**Checks.**

- Lindeberg: Rademacher signs `Yₙ,ᵢ = ±1/√n`, `i < n`, satisfy it (the indicator vanishes once
  `ε > 1/√n`), and the sum tends to `N(0, 1)`.
- Lindeberg fails for `Yₙ,ᵢ = Bₙ,ᵢ - 1/n` with `Bₙ,ᵢ` Bernoulli(`1/n`), `i < n`: the variances sum
  to `1 - 1/n → 1`, but for `ε < 1/2` the Lindeberg sum is `n · (1/n)(1 - 1/n)² → 1`, and the sum
  tends to a centred Poisson law, not to `N(0, 1)`.
- Multivariate CLT: for `X = (U, U)` with `U` Rademacher, the limit is `N(0, S)` with `S` the
  all-ones matrix, which is singular; the theorem allows singular `S`.

### 1.3 Gaussian quadratic forms

- **The noncentral chi-squared form** (`map_quadForm_inv_multivariateGaussian`): for `S` positive
  definite, the law of `xᵀ S⁻¹ x` under `N(m, S)` is the noncentral chi-squared law with `k`
  degrees of freedom and noncentrality `mᵀ S⁻¹ m`.
- **Singular covariance** (`map_quadForm_pseudoInverse_multivariateGaussian`): if `S` is positive
  semidefinite of rank `q`, then `xᵀ S⁺ x` is `χ²_q` under `N(0, S)`, with `S⁺` the Moore–Penrose
  inverse, Tau Ceti's `Matrix.covariancePseudoInverse`.
- More generally, under `N(0, S)` the law of `‖X‖²` is that of `∑ⱼ λⱼ Zⱼ²` with `λⱼ` the
  eigenvalues of `S` (van der Vaart, Lemma 17.1, p. 242).

*Proof route.* Write `S = A Aᵀ` with `A = S^{1/2}`; `A⁻¹ X` is `N(A⁻¹ m, I)`, and Tau Ceti's
`map_norm_sq_multivariateGaussian_noncentral` gives the law of its squared norm. A symmetric
idempotent `S` is the orthogonal projection onto its range `K`, and `N(0, S)` is the image of the
standard Gaussian under that projection (Gaussian transport: both are centred Gaussian with
covariance `S Sᵀ = S`), so `‖X‖²` is `χ²_{rank S}` by Tau Ceti's
`Submodule.map_norm_sq_starProjection_stdGaussian`; this is the form used in 8.4. For the
singular form, diagonalize `S = U D Uᵀ`; then
`S⁺ = U D⁺ Uᵀ`, and `xᵀ S⁺ x = ∑_{dⱼ > 0} (Uᵀx)ⱼ²/dⱼ` is a sum of `q` squares of independent standard
normal variables.

*Needs:* Mathlib `multivariateGaussian`, `Matrix.IsHermitian.spectral_theorem`; Tau Ceti
`chiSquaredMeasure`, `noncentralChiSquaredMeasure`, `Submodule.map_norm_sq_starProjection_stdGaussian`.

**Checks.**

- `k = 1`, `S = (σ²)`, `m = (a)`: the form `x²/σ²` under `N(a, σ²)` has noncentrality `a²/σ²`.
- `S = I - u uᵀ` with `‖u‖ = 1` is the projection onto `u^⊥`, of rank `k - 1`, so `‖X‖²` is
  `χ²_{k-1}` under `N(0, S)` by the Tau Ceti projection theorem; this is the Pearson covariance of
  8.4 with `u = (√p₁, …, √pₖ)`. The singular form gives the same law, since `S⁺ = S`.
- `S = 0` has rank `0`, `S⁺ = 0`, and `xᵀ S⁺ x = 0` has law `χ²_0 = δ₀` (Tau Ceti
  `chiSquaredMeasure_zero`).
- Singular form with `S = diag(2, 0)`: `S⁺ = diag(1/2, 0)` and `x₁²/2` with `x₁ ~ N(0, 2)` is `χ²_1`;
  the ordinary inverse does not exist.

### 1.4 The second-order delta method

- **Second-order delta method** (`tendstoInDistribution_second_order_delta_method`): in a
  finite-dimensional normed space `E`, if `√n (Tₙ - θ) → Z` in law, `g` is measurable,
  differentiable near `θ` with `Dg(θ) = 0`, and `Dg` is differentiable at `θ` with derivative
  `D₂`, then `n (g(Tₙ) - g(θ)) → ½ D₂(Z, Z)` in law (by the same argument as van der Vaart, Thm
  3.1, p. 26, with the second-order Taylor formula).

The first-order delta method is Foundations 8.4 and is not restated.

*Proof route.* Taylor's formula with the Peano remainder for `g` at `θ`
(`HasFDerivAt` of `fderiv ℝ g` at `θ` and the mean value inequality on a segment) gives
`n (g(Tₙ) - g(θ)) - ½ D₂(√n(Tₙ - θ), √n(Tₙ - θ)) → 0` in probability, since `√n(Tₙ - θ)` is
bounded in probability and `Tₙ → θ` in probability; then continuous mapping and Slutsky (1.1).

*Needs:* 1.1; Foundations 8.2, 8.4.

**Checks.**

- `g(x) = x²` at `θ = 0` with `√n X̄ → N(0, σ²)`: `D₂(z, z) = 2z²`, so `n X̄² → σ² χ²_1`.
- `g(x) = x²` at `θ = 1`: `Dg(1) = 2 ≠ 0`, the hypothesis fails, and `n(X̄² - 1)` diverges; the
  first-order method gives `√n (X̄² - 1) → N(0, 4σ²)`.

### Examples

- For `Xᵢ` i.i.d. in `ℝ²` with covariance `S` positive definite and `X̄ₙ` the sample mean,
  `n (X̄ₙ - μ)ᵀ S⁻¹ (X̄ₙ - μ) → χ²_2`, by 1.2, continuous mapping and 1.3.

### Dependencies

Mathlib, Tau Ceti's chi-squared and covariance files, and Foundations Layer 8.

## Layer 2: weak convergence of arbitrary maps and the space `ℓ^∞(T)`

### 2.1 Outer integrals

- `outerIntegral μ f`, the infimum of `∫ g dμ` over measurable integrable `g ≥ f`, and
  `innerIntegral μ f = -outerIntegral μ (-f)`.
- **Measurable cover**: for `f` bounded and `μ` finite there is a measurable `f*` with
  `f ≤ f*`, `outerIntegral μ f = ∫ f* dμ`, and `f* ≤ g` a.e. for every measurable `g ≥ f`
  (van der Vaart–Wellner, Lemma 1.2.1, p. 6).
- `outerLIntegral μ f`, for `f : Ω → [0, ∞]`, the infimum of `∫⁻ g dμ` over measurable `g ≥ f`.
  There is no integrability condition, so the value is `∞` exactly when `f` has no integrable
  measurable majorant. **Markov's inequality** (`measure_le_le_outerLIntegral_div`):
  `μ*{t ≤ f} ≤ outerLIntegral μ f / t` for `0 < t < ∞`. **The bounded case**
  (`outerLIntegral_ofReal_eq`): for `0 ≤ f ≤ C` under a finite measure,
  `outerLIntegral μ (ofReal ∘ f) = ofReal (outerIntegral μ f)`.
- **The measurable case** (`outerIntegral_eq_integral`): for bounded a.e.-measurable `f` under a
  probability measure the outer integral is the integral.
- For bounded `f`, `g`: monotonicity, `outerIntegral (f + g) ≤ outerIntegral f + outerIntegral g`,
  `outerIntegral (c f) = c outerIntegral f` for `c ≥ 0`, `innerIntegral f ≤ outerIntegral f`, and
  `outerIntegral μ (s.indicator 1) = μ.real s` for every set `s`, so outer probability is
  Mathlib's measure of a set.

*Proof route.* Take a minimizing sequence of majorants and their pointwise infimum, which is a
measurable majorant; boundedness makes the integrals finite and monotone convergence identifies
the infimum. Markov: for a measurable `g ≥ f`, `{t ≤ f} ⊆ {t ≤ g}` and Mathlib's
`mul_meas_ge_le_lintegral₀`. The bounded case: truncating a majorant to `min g C` changes neither
side's infimum. The indicator case is Mathlib's `measurableSet_toMeasurable` and
`measure_toMeasurable`.

*Needs:* Mathlib integration, `toMeasurable`.

**Checks.**

- `outerIntegral`: for `μ` Lebesgue on `[0, 1]` and `s` a non-measurable set of outer measure
  `1` and inner measure `0` (a Bernstein set), the outer integral of `s.indicator 1` is `1` and
  the inner integral is `0`; for measurable `s` both are `μ s`.
- `outerLIntegral`: for `X ≥ 1` with `P(X > t) = 1/t` for `t ≥ 1`, `E X = ∞` and
  `outerLIntegral P (ofReal ∘ X) = ∞`, while the real infimum defining `outerIntegral P X` is over
  the empty set of integrable majorants and is the junk value `0`.
- `outerIntegral`: subadditivity is strict for `s.indicator 1` and `sᶜ.indicator 1` with `s` the
  Bernstein set: the sum of the outer integrals is `2` and the outer integral of the sum is `1`.
- `outerLIntegral`: for the Bernstein set `s`, `outerLIntegral μ (s.indicator 1) = 1`, the outer
  measure of `s`, while the lower Lebesgue integral `∫⁻ (s.indicator 1) dμ` is `0`; so the outer
  integral is not Mathlib's `lintegral` of a non-measurable function.
- `outerLIntegral`: for measurable `f` it is `∫⁻ f dμ`, by taking `g = f`.

### 2.2 Weak convergence in the sense of Hoffmann-Jørgensen

- `TendstoInOuterDistribution X l L μ` (Conventions) and `IsAsymptoticallyTight X l μ`: for every
  `ε > 0` a nonempty compact `K` with `μᵢ{δ ≤ infDist (Xᵢ, K)} ≤ ε` eventually, for every `δ > 0`
  (van der Vaart–Wellner, Def 1.3.7, p. 20). Asymptotic measurability: the outer and inner
  integrals of `f ∘ Xᵢ` have the same limit behaviour, `outer - inner → 0`, for every bounded
  continuous `f`.
- **Portmanteau** (`tendstoInOuterDistribution_iff_limsup_le`; van der Vaart–Wellner, Thm 1.3.4,
  p. 17; van der Vaart, Lemma 18.9, p. 259):
  the definition is equivalent to `liminf (μᵢ)_*(Xᵢ ∈ G) ≥ L(G)` for open `G`, with the inner
  probability, to `limsup μᵢ*(Xᵢ ∈ F) ≤ L(F)` for closed `F`, with the outer probability, and to convergence of outer integrals of bounded
  Lipschitz functions. **Bounded Lipschitz metric**: when `L` is concentrated on a separable
  measurable set, weak convergence is equivalent to
  `sup_{f ∈ BL₁} |outerIntegral μᵢ (f ∘ Xᵢ) - ∫ f dL| → 0` together with asymptotic measurability,
  with `BL₁` the functions bounded by `1` and `1`-Lipschitz; the uniformity over `BL₁` comes from
  approximating `BL₁` uniformly on a compact set of large `L`-mass by a finite family. Weak convergence implies asymptotic measurability, and convergence to a
  tight limit implies asymptotic tightness (van der Vaart–Wellner, Lemma 1.3.8, p. 20).
- **Prohorov's theorem for arbitrary maps** (`exists_strictMono_tendstoInOuterDistribution`): an
  asymptotically tight and asymptotically measurable sequence has a subsequence converging to a
  tight Borel law (van der Vaart–Wellner, Thm 1.3.9(ii), p. 20; van der Vaart, Thm 18.12, p. 260).
- **Measurable maps** (`tendstoInOuterDistribution_iff_tendstoInDistribution`): for a.e.-measurable
  `Xᵢ` the definition is Mathlib's `TendstoInDistribution X l id μ L`.
- **The bridge to Mathlib** (`TendstoInOuterDistribution.tendstoInDistribution_comp`): if
  `Xᵢ → L` weakly and `g` is continuous with `g ∘ Xᵢ` a.e.-measurable, then `g ∘ Xᵢ → L.map g` in
  Mathlib's sense.
- **Continuous mapping** (`TendstoInOuterDistribution.comp`): `g ∘ Xᵢ → L.map g` for continuous
  `g` (van der Vaart–Wellner, Thm 1.3.6, p. 19). The **extended continuous mapping theorem**: if
  `gₙ(xₙ) → g(x)` whenever `xₙ → x` with `xₙ ∈ Dₙ` and `x ∈ D₀`, and `Xₙ → L` with `Xₙ ∈ Dₙ` and
  `L` separable and concentrated on `D₀`, then `gₙ(Xₙ) → L.map g` (van der Vaart, Thm 18.11(i),
  p. 259).
- **Slutsky's lemma** (`TendstoInOuterDistribution.of_tendstoInProbability_dist`): if `Xᵢ → L`
  weakly with `L` concentrated on a separable measurable set and `dist(Yᵢ, Xᵢ) → 0` in outer
  probability, then `Yᵢ → L` weakly (van der Vaart, Thm 18.10(iv), p. 259).

*Proof route.* The portmanteau follows Mathlib's proof for measurable maps, with outer integrals
in place of integrals and the measurable covers of 2.1 where a set or function must be measured;
the Lipschitz approximation of indicators of closed sets is Mathlib's. The equivalence for
measurable maps is 2.1 applied to `f ∘ Xᵢ`. The bridge is continuous mapping followed by the
equivalence. Slutsky is the Lipschitz portmanteau with the estimate of 1.1; separability of the
limit makes the bounded Lipschitz functions convergence-determining. Prohorov uses Mathlib's
`isCompact_closure_of_isTightMeasureSet` on the laws of measurable covers.

*Needs:* 1.1, 2.1; Mathlib portmanteau and Prokhorov.

**Checks.**

- Asymptotic measurability is not automatic: on `[0, 1]` with Lebesgue measure, let every `Xₙ`
  be the indicator of a Bernstein set, as a map into `ℝ`, and let `f(x) = max 0 (min 1 x)`. The
  outer integrals of `f ∘ Xₙ` and of `(-f) ∘ Xₙ` are `1` and `0`, so a limit `L` would have
  `∫ f dL = 1` and `∫ f dL = 0`: the constant sequence converges weakly to no law.
- The open-set condition needs inner probability: for the same Bernstein indicators and
  `L = δ₁`, every open `G ∋ 1` has `{Xₙ ∈ G}` equal to the Bernstein set or to `[0, 1]`, of outer
  probability `1`, so `liminf μ*(Xₙ ∈ G) ≥ L(G)` holds for every open `G`, although the sequence
  converges to no law. The inner probability of the Bernstein set is `0`.
- Tightness needs `K` nonempty: `Metric.infDist x ∅ = 0`, so with `K = ∅` the condition would hold
  for every sequence, including `Xₙ = n` in `ℝ`.
- For a constant sequence of measurable maps the definition reduces to `L` being the law of `X₀`.
- `IsAsymptoticallyTight`: `Xₙ = n` in `ℝ` is not asymptotically tight; a single measurable map
  into a Polish space, repeated, is, by Mathlib's tightness of one Borel probability measure on
  a Polish space.
- `IsAsymptoticallyTight` does not imply asymptotic measurability: the Bernstein indicators above
  take values in the compact set `{0, 1}`, so they are asymptotically tight, yet they converge to
  no law. This is why Prohorov's theorem assumes both.

### 2.3 The space `ℓ^∞(T)`

- `Linfty T`, its Borel σ-algebra, `liftLinfty g` (Conventions), and the marginal map
  `marginal t z = (z(t₁), …, z(tₘ))` into `EuclideanSpace ℝ (Fin m)`, which is continuous linear.
- `IsAsymptoticallyUniformlyEquicontinuous ρ X l μ`: for all `ε, η > 0` there is `δ > 0` with
  `μᵢ*{∃ s t, ρ(s, t) < δ ∧ |Xᵢ(s) - Xᵢ(t)| > ε} ≤ η` eventually.
- **Convergence from marginals and equicontinuity**
  (`tendstoInOuterDistribution_of_marginal_of_equicontinuous`): if `ρ` is a totally bounded
  semimetric on `T`, every finite marginal of `Xᵢ` converges weakly, and `Xᵢ` is asymptotically
  uniformly `ρ`-equicontinuous in probability, then `Xᵢ` converges weakly in `ℓ^∞(T)` to a tight
  Borel law (van der Vaart, Thm 18.14, p. 261; van der Vaart–Wellner, Thms 1.5.4, p. 34, and
  1.5.7, p. 36). Conversely, convergence to a tight limit implies marginal convergence and the
  existence of such a semimetric.
- **Uniqueness** (`ext_of_marginal`): tight Borel probability laws on `ℓ^∞(T)` with the same
  finite marginals are equal (van der Vaart–Wellner, Lemma 1.5.3, p. 34).
- A tight Borel law on `ℓ^∞(T)` is concentrated on the separable closed subspace `UC(T, ρ)` of
  bounded `ρ`-uniformly continuous functions for a totally bounded semimetric `ρ` on `T`.

*Proof route.* Uniqueness: a tight law lives on a σ-compact, hence separable, set, on which the
Borel σ-algebra is generated by the evaluations at a countable dense set of points; finite
marginals determine the law on that σ-algebra. For the convergence theorem, follow van der
Vaart's proof of Thm 18.14: finite `δ`-nets `T_δ` of `(T, ρ)` give the piecewise constant
approximations `Xᵢ ∘ π_δ`, which are finite-dimensional and converge by the marginal hypothesis;
equicontinuity bounds `‖Xᵢ - Xᵢ ∘ π_δ‖` in outer probability; a diagonal argument and the
Cauchy criterion in the bounded Lipschitz metric give the limit, which lies in `UC(T, ρ)`.

*Needs:* 2.2; Mathlib `lp`, `lp.evalCLM`, `lp.completeSpace`, `TotallyBounded`.

**Checks.**

- **Non-measurability of the empirical process** (exact argument). For `P` uniform on `[0, 1]`
  and `n = 1`, the map `x ↦ 1_{[x, 1]}` from `[0, 1]` into `ℓ^∞([0, 1])` sends distinct points to
  functions at distance `1`. For any `A ⊆ [0, 1]` the union of the open balls of radius `1/2`
  about the images of `A` is open, and its preimage is `A`. Taking `A` non-Lebesgue-measurable,
  the map is not Borel measurable. The same holds for `x ↦ 1{x ≤ t} - t`, and for every `n`.
- `liftLinfty`: `t ↦ t` on `T = ℝ` is unbounded and lifts to `0`; on `T = [0, 1]` it lifts to
  itself, of norm `1`.
- `liftLinfty`: `n ↦ (-1)ⁿ` on `T = ℕ` is bounded but not convergent and lifts to itself, of norm
  `1`; boundedness, not continuity or convergence, decides the lift.
- `liftLinfty`: the constant `c` lifts to the constant `c`, of norm `|c|`, on every nonempty `T`.
- `marginal`: for `t = (0, 1)` and `z = 1_{[1/2, 1]}` on `[0, 1]`, the marginal is `(0, 1)`.
- `marginal`: with `m = 0` it is the zero vector of `EuclideanSpace ℝ (Fin 0)` for every `z`.
- `marginal`: at a repeated point `t = (s, s)` both coordinates equal `z(s)`, and
  `marginal t (a z + w) = a · marginal t z + marginal t w`.
- `IsAsymptoticallyUniformlyEquicontinuous`: a process constant in `t`, `Xᵢ(t) = Zᵢ`, satisfies it
  for every `ρ`, since all increments vanish.
- `IsAsymptoticallyUniformlyEquicontinuous`: the fixed path `Xᵢ = 1_{[1/2, 1]}` on `[0, 1]` with
  `ρ(s, t) = |s - t|` fails it, since every `δ > 0` admits `s < 1/2 ≤ t` with `ρ(s, t) < δ` and
  increment `1`.
- `IsAsymptoticallyUniformlyEquicontinuous`: on `T = {0, 1}` with `ρ ≡ 0` and `Xᵢ = (0, Z)`,
  `Z ~ N(0, 1)`, it fails, since `ρ(0, 1) < δ` for every `δ` and `P(|Z| > ε) > 0` does not depend
  on `i`.

### 2.4 Brownian bridge laws

- `IsBrownianBridgeLaw P f L`, for a class `f : T → X → ℝ` with `f t ∈ L²(P)`: `L` is a tight
  Borel probability law on `ℓ^∞(T)` whose marginal at `(t₁, …, tₘ)` is the centred Gaussian with
  covariance `P(f_{tₐ} f_{t_b}) - P f_{tₐ} · P f_{t_b}`. By `ext_of_marginal` there is at most one
  such law.
- Layer 3 obtains existence for every Donsker class, as the limit of its empirical process
  (`IsDonsker.isBrownianBridgeLaw`), and for the indicators of half-lines as the image of the
  standard Brownian bridge (`isBrownianBridgeLaw_map_comp_cdf`). These are the forms every later
  target uses.

*Needs:* 2.3; Mathlib `multivariateGaussian`, `IsGaussianProcess`.

**Checks.**

- For `X = ℝ`, `T = ℝ` and `f_t = 1_{(-∞, t]}`, the covariance is
  `F(s ∧ t) - F(s) F(t)`; for `P` uniform on `[0, 1]` and `s, t ∈ [0, 1]` it is `min(s, t) - st`,
  which vanishes at `s = 0` and at `t = 1`.
- For a finite `T`, `ℓ^∞(T)` is `ℝ^T`, every law is tight, and the bridge law is the multivariate
  Gaussian with the displayed covariance.
- For `P` uniform on `[0, 1]` and the half-line indicators, the bridge covariance at `s = 1/4`,
  `t = 1/2` is `1/4 - 1/8 = 1/8`, and the variance at the endpoint `t = 1` is `F(1)(1 - F(1)) = 0`:
  the marginal at `t = 1` is the Dirac law at `0`.
- The centring is part of the definition: a law whose marginal at `(t₁)` is `N(c, σ²)` with
  `c ≠ 0` is not a bridge law, since the marginal of `IsBrownianBridgeLaw` is
  `multivariateGaussian 0 _`, with mean `0`.

### Examples

- The empirical process of `n` uniform observations, at the finitely many points `t₁, …, tₘ`, is
  measurable; its marginals converge by 1.2 to the bridge marginals of 2.4. Layer 3 adds the
  equicontinuity.

### Dependencies

Layer 1; Mathlib's portmanteau theorem, Prokhorov's theorem and `lp`.

## Layer 3: empirical processes

Throughout, `P` is a probability measure on `X` and `f : T → X → ℝ` is an indexed class of
measurable functions; `ℙₙ f_t = n⁻¹ ∑ᵢ f_t(xᵢ)` and `P f_t = ∫ f_t dP`.

### 3.1 Glivenko–Cantelli and Donsker classes

- `empiricalProcess P f n x = liftLinfty (t ↦ √n (ℙₙ f_t - P f_t))`, a map from `Fin n → X` to
  `ℓ^∞(T)`, in general not measurable (2.3).
- `IsGlivenkoCantelli P f`: `sup_t |ℙₙ f_t - P f_t| → 0` outer almost surely under
  `Measure.infinitePi`, the supremum taken in `ℝ≥0∞`.
- `IsDonsker P f`: the centred values `t ↦ f_t(x) - P f_t` are bounded for every `x`, and the
  empirical process converges weakly in `ℓ^∞(T)` to a tight Borel law. The boundedness makes
  `liftLinfty` exact, and it holds for every class with a finite envelope and bounded `P f_t`.
- **The limit is the Brownian bridge** (`IsDonsker.isBrownianBridgeLaw`): for a Donsker class in
  `L²(P)`, the limit law satisfies `IsBrownianBridgeLaw P f L` (van der Vaart, §19.2).
- A Donsker class with `sup_t |P f_t| < ∞` is Glivenko–Cantelli in outer probability:
  `sup_t |ℙₙ f_t - P f_t| → 0` in outer probability, since `√n` times it is bounded in
  probability.

*Proof route.* The marginal map at finitely many points is continuous and its composite with the
empirical process is the measurable vector `n^{-1/2} ∑ᵢ (f_{t_a}(xᵢ) - P f_{t_a})_a`. The bridge
(2.2) and the multivariate central limit theorem (1.2) identify its limit, and uniqueness of
limits in law gives the bridge marginals; tightness of `L` is part of the definition.

*Needs:* 1.2, 2.2–2.4.

**Checks.**

- `IsDonsker`: a finite class of square-integrable functions is Donsker, by 1.2 and 2.3 with
  `ρ` the discrete metric (distance `1` between distinct points): the modulus over `ρ(s, t) < δ`
  is `0` for `δ < 1`, so equicontinuity holds. A semimetric that identifies distinct functions
  does not serve: for `f₀ = 0`, `f₁(x) = x` under Rademacher `P` and `ρ ≡ 0`, the modulus contains
  the increment `𝔾ₙ f₁`, whose limit law is `N(0, 1)`, not `δ₀`.
- `IsGlivenkoCantelli`: for `P` uniform on `[0, 1]` and the class of indicators of finite subsets
  `A`, `P 1_A = 0` while `ℙₙ 1_A = 1` for `A` the set of sample points, so the supremum is `1` for
  every `n` and the class is not Glivenko–Cantelli.
- `IsDonsker`: the single function `f(x) = x` under a law with infinite variance is not Donsker,
  as its marginal `√n (X̄ - μ)` does not converge in law.
- `IsGlivenkoCantelli`: the half-line indicators are Glivenko–Cantelli for every `P` (the
  classical theorem of 3.4); the single function `f(x) = x` under the standard Cauchy law is not,
  since `ℙₙ f` is standard Cauchy for every `n` while `P f` is the junk value `0`.
- `empiricalProcess`: for `n = 1`, `P` uniform on `[0, 1]`, `f_t = 1_{(-∞, t]}` and the sample
  point `1/2`, it is `t ↦ 1{1/2 ≤ t} - F(t)`, of norm `1/2`.
- `empiricalProcess`: for `n = 0` it is `0`, since `√0 = 0`.
- `empiricalProcess`: for `f_t(x) = t x` on `T = ℝ` the path `t ↦ √n t x̄` is unbounded whenever
  `x̄ ≠ 0` and lifts to the junk value `0`; `IsDonsker` excludes such classes by its boundedness
  clause.

### 3.2 Bracketing and covering numbers

- `bracketingNumber r P f ε`: the least number of measurable brackets `[l, u]` with
  `‖u - l‖_{Lʳ(P)} ≤ ε` covering every `f_t`; `bracketingEntropyIntegral P f δ`, the integral over
  `(0, δ]` of `√(log N_[](ε, f, L²(P)))`.
- `coveringNumberLp r Q f ε`: the least number of functions `g` with every `f_t` within
  `Lʳ(Q)`-distance `ε` of one of them (external covering number); `uniformEntropyIntegral f F δ`,
  the integral over `(0, δ]` of `sup_Q √(log N(ε ‖F‖_{Q,2}, f, L²(Q)))`, the supremum over finitely
  supported probability measures `Q` with `‖F‖_{Q,2} > 0`, for an envelope `F ≥ |f_t|`.
- `IsPointwiseSeparable f`: a countable subfamily approximates every member pointwise, the
  sufficient measurability condition stated after van der Vaart, Thm 19.14, p. 274.
- Comparisons: `coveringNumberLp r P f ε ≤ bracketingNumber r P f (2ε)`, since the midpoint of a
  bracket of size `2ε` is within `ε` of every function in it; and the external covering numbers
  dominate Mathlib's `Metric.externalCoveringNumber` of the image of `f` in the space `Lʳ(Q)`,
  with equality when `f_t ∈ Lʳ(Q)` for every `t`.
- **Lipschitz parametric classes**: if `Θ ⊆ ℝ^d` is bounded and
  `|f_{θ₁}(x) - f_{θ₂}(x)| ≤ m(x) ‖θ₁ - θ₂‖` with `‖m‖_{P,r} < ∞`, then
  `N_[](ε ‖m‖_{P,r}, f, Lʳ(P)) ≤ K (diam Θ / ε)^d` for `0 < ε < diam Θ`, with `K` depending only
  on `d` (van der Vaart, Ex 19.7, p. 271). Such a class has a finite bracketing entropy integral.

*Needs:* 3.1; Mathlib `eLpNorm`, `Metric.externalCoveringNumber`.

**Checks.**

- `bracketingNumber`: a single function has bracketing number `1` for every `ε ≥ 0`, using the
  bracket `[f, f]`, and bracketing entropy integral `0`.
- `bracketingNumber`: for the half-line indicators `1_{(-∞, t]}`, brackets
  `[1_{(-∞, t_{i-1}]}, 1_{(-∞, t_i)}]` over a grid with `F(t_i-) - F(t_{i-1}) < ε` have
  `L¹(P)`-size `ε` and `L²(P)`-size `√ε`, and fewer than `2/ε` of them suffice, so
  `N_[](ε, f, L²(P)) ≤ 2/ε²` for `0 < ε < 1` (van der Vaart, Ex 19.6, p. 271). The integral of
  `√(log(2/ε²))` over `(0, 1]` is finite.
- `bracketingNumber`: the two constants `{0, 1}` under any probability `P` have bracketing number
  `1` for `ε ≥ 1` (the bracket `[0, 1]`) and `2` for `ε < 1`.
- `coveringNumberLp`: for a probability `Q`, `0 < r ≤ ∞` and every finite `ε`, the constants
  `f_t = t`, `t ∈ ℝ`, have infinite covering and bracketing numbers in `Lʳ(Q)`, since
  `‖s - t‖_{Lʳ(Q)} = |s - t|`; so the bracketing entropy integral is `∞`. The exponent `r = 0` is
  excluded: Mathlib's `eLpNorm` with exponent `0` is `0`, and one centre covers the class.
- `coveringNumberLp`: for `ε ≥ 1` and a probability `Q`, the zero function is within `ε` of every
  indicator in `Lʳ(Q)`, so the half-line indicators have covering number `1`.
- `coveringNumberLp`: a single function has covering number `1` for every `ε ≥ 0`.
- `uniformEntropyIntegral`: a single function `f` with envelope `F = |f|` has every covering number
  `1` and integral `0`; the half-line indicators with `F = 1` have a finite integral by 3.5.
- `uniformEntropyIntegral`: the indicators of finite subsets of `[0, 1]` with `F = 1` have integral
  `∞`: under `Q` uniform on `m` points the `2^m` traces are pairwise at `L²(Q)`-distance at least
  `m^{-1/2}`, so the covering number at `ε < 1/(2√m)` is at least `2^m`, and the integrand is at
  least of order `1/ε`.
- `uniformEntropyIntegral` with `F = 0`: no measure `Q` has `‖F‖_{Q,2} > 0`, so the supremum is
  over an empty index and the integral is `0` for every class.
- `IsPointwiseSeparable`: the half-line indicators are pointwise separable, with
  `1_{(-∞, q]} → 1_{(-∞, t]}` pointwise as rational `q` decrease to `t`.
- `IsPointwiseSeparable`: every class indexed by a countable `T` is pointwise separable.
- `IsPointwiseSeparable`: the singleton indicators `1_{{t}}`, `t ∈ [0, 1]`, are not: for `t`
  outside a countable `T₀`, `1_{{s_j}}(t) = 0` for every `j`, which does not tend to `1_{{t}}(t) = 1`.

### 3.3 Maximal inequalities

Here `E* Z` for a nonnegative, possibly non-measurable `Z` is `outerLIntegral μ (ofReal ∘ Z)` (2.1).

- **Finite sub-Gaussian maximum** (`integral_sup'_le_of_hasSubgaussianMGF`): if each of
  `Y₀, …, Y_{N-1}` has a sub-Gaussian moment generating function with parameter `c`, then
  `E max_j Y_j ≤ √(2 c log N)`. No independence is assumed.
- **Symmetrization** (`outerLIntegral_iSup_le_two_mul_rademacher`): for `n ≥ 1` and integrable
  `f_t`, `E* sup_t |ℙₙ f_t - P f_t| ≤ 2 E* sup_t |n⁻¹ ∑ᵢ εᵢ f_t(Xᵢ)|` for independent Rademacher
  signs `εᵢ`, and the same for every nondecreasing convex function of the supremum (van der
  Vaart–Wellner, Lemma 2.3.1, p. 172).
- **Chaining** (`outerLIntegral_iSup_sub_le_packingEntropyIntegral`): for a separable process
  with sub-Gaussian increments with respect to a semimetric `d` (here `X_s - X_t` has a
  sub-Gaussian moment generating function with parameter `d(s, t)²`),
  `E* sup_{d(s,t) ≤ δ} |X_s - X_t| ≤ K ∫₀^δ √(log D(ε, d)) dε` for a universal `K`, with `D`
  Mathlib's `Metric.packingNumber` (van der Vaart–Wellner, Thm 2.2.4, p. 147, for the function
  `ψ₂`, and Cor 2.2.9, p. 152).
- **Bracketing maximal inequality** (`outerLIntegral_iSup_empiricalProcess_le_bracketing`): for a
  class of square-integrable `f_t` with `P f_t² < δ²` and a measurable envelope `F`,
  `E* sup_t |√n (ℙₙ - P) f_t| ≤ K (δ + J_[](δ, f, L²(P)) + √n P F 1{F > √n a(δ)})` for a
  universal `K`, with `a(δ) = δ / √(Log N_[](δ, f, L²(P)))` and `Log x = max 1 (log x)` (van der
  Vaart, Lemma 19.34, p. 286; `Log` is defined on p. 284). The source's entropy integral has the
  integrand `√(Log N_[])`, which exceeds `√(log N_[])` by at most `1`; the term `δ` accounts for
  the difference, and it cannot be dropped: for a single bounded function the entropy integral
  with `log` is `0` and the truncation term vanishes for large `n`. The inequality is built on
  the finite-class Bernstein bound (van der Vaart, Lemmas 19.32 and 19.33, p. 285).

*Proof route.* The sub-Gaussian maximum: by Jensen,
`exp(λ E max Yⱼ) ≤ E exp(λ max Yⱼ) ≤ ∑ⱼ E exp(λ Yⱼ) ≤ N exp(c λ²/2)`; take logarithms and choose `λ = √(2 log N / c)`. Symmetrization:
introduce an independent ghost sample, use Jensen to insert it, and use that
`f(Xᵢ) - f(Xᵢ')` is symmetric. Chaining: dyadic nets at scales `2^{-j} δ`, telescoping links, and
the finite maximum at each scale. Conditionally on the sample, Rademacher sums are sub-Gaussian by
Hoeffding's lemma (Mathlib `hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero` and
`HasSubgaussianMGF.sum_of_iIndepFun`). The bracketing inequality is van der Vaart's chaining with
brackets and truncation, using Bernstein's inequality for the finite classes.

*Needs:* 3.2; Mathlib `HasSubgaussianMGF`, Jensen's inequality, `Metric.packingNumber`.

**Checks.**

- `N = 1`: the bound is `0`, and indeed a sub-Gaussian variable has mean `0`.
- Two independent standard normal variables (`c = 1`): `E max = 1/√π ≈ 0.564`, below
  `√(2 log 2) ≈ 1.177`.
- `N` copies of one standard normal variable: `E max = 0`, consistent with the bound; the bound
  needs no independence.

### 3.4 Bracketing theorems and the empirical distribution function

- **Glivenko–Cantelli under bracketing** (`isGlivenkoCantelli_of_bracketingNumber_lt_top`): if
  `N_[](ε, f, L¹(P)) < ∞` for every `ε > 0` and each `f_t` is integrable, the class is
  Glivenko–Cantelli (van der Vaart, Thm 19.4, p. 270; van der Vaart–Wellner, Thm 2.4.1, p. 185).
- **Donsker under bracketing** (`isDonsker_of_bracketingEntropyIntegral_lt_top`): if
  every `f_t` belongs to `L²(P)`, `J_[](1, f, L²(P)) < ∞` and the centred values are bounded at
  every point, the class is Donsker
  (van der Vaart, Thm 19.5, p. 270; van der Vaart–Wellner, Thm 2.5.6, p. 194).
- **The classical Glivenko–Cantelli theorem**: `sup_t |Fₙ(t) - F(t)| → 0` almost surely, the
  Kolmogorov–Smirnov statistic of Foundations 9.2 being measurable (van der Vaart, Thm 19.1,
  p. 266).
- **The classical Donsker theorem** (`isDonsker_indicator_Iic`): the half-line indicators form a
  Donsker class for every `P` on `ℝ` (van der Vaart, Thm 19.3, p. 266).
- **The `F`-Brownian bridge** (`isBrownianBridgeLaw_map_comp_cdf`): if `B` is a Borel probability
  measure on `C(unitInterval, ℝ)` with centred Gaussian marginals of covariance `min(s, t) - st`,
  the standard Brownian bridge of StochasticCalculus §1.4, then the image of `B` under
  `x ↦ liftLinfty (x ∘ F)` is the Brownian bridge law of the half-line class. Hence the limit in
  the classical Donsker theorem is the law of `B ∘ F`.

*Proof route.* Glivenko–Cantelli: for a bracket `[l, u]` of `L¹` size `ε`,
`ℙₙ f - P f ≤ ℙₙ u - P u + ε`; the strong law (Mathlib `ProbabilityTheory.strong_law_ae`) on the
finitely many `l, u` gives `limsup ≤ ε` almost surely, and `ε` runs through `1/m`. Donsker: the
marginals converge by 1.2; for asymptotic equicontinuity, the bracketing maximal inequality (3.3)
applied to the class of differences at `L²` distance `δ`, whose bracketing integral is at most
`J_[](δ, f, L²(P))` up to a constant, tends to `0` with `δ`; and 2.3 concludes with
`ρ = L²(P)`. The classical Donsker theorem is the bracketing theorem with Ex 19.6 (3.2). For the
`F`-Brownian bridge, `x ↦ x ∘ F` is a continuous linear map from `C(unitInterval, ℝ)` (with the
supremum norm) into `ℓ^∞(ℝ)`, so the image of the tight law `B` is tight; its marginals are those
of `B` at `(F(t₁), …, F(tₘ))`, with covariance `min(F(s), F(t)) - F(s)F(t) = F(s ∧ t) - F(s)F(t)`,
and 2.4 identifies the law.

*Needs:* 2.3, 2.4, 3.1–3.3; Mathlib `ProbabilityTheory.strong_law_ae`; StochasticCalculus §1.4 for
the existence of `B`.

**Checks.**

- Square integrability is needed in the bracketing Donsker theorem: the single function
  `f(x) = x` under the standard Cauchy law has bracketing number `1` (the bracket `[f, f]`) and
  entropy integral `0`, yet `√n (ℙₙ f - P f)` is Cauchy with scale `√n`, which is not tight.
- `isDonsker_indicator_Iic` for `P = δ₀`: `Fₙ = F` for every sample, the empirical process is
  `0`, and the bridge has covariance `F(s ∧ t) - F(s)F(t) = 0`, the Dirac law at `0`.
- The `F`-bridge at `t` with `F(t) = 1/2` has variance `1/4`, the largest possible; at
  `F(t) ∈ {0, 1}` it vanishes.
- For `P` uniform on `[0, 1]`, `x ↦ x ∘ F` is `x` on `[0, 1]`, extended by the constants `x(0)`
  to the left and `x(1)` to the right, which vanish `B`-almost surely; so the limit is the
  standard bridge itself.

### 3.5 VC classes and uniform entropy

- `vcDimSet C`, for a family of sets `C`: the supremum of the sizes of the finite sets shattered
  by `C`. For finite `X` it is Mathlib's `Finset.vcDim` of the family of traces.
- **Sauer–Shelah**: a family of VC dimension `d` has at most `∑_{j ≤ d} (n choose j)` traces on
  any `n`-point set, from Mathlib's `Finset.card_shatterer_le_sum_vcDim` applied to the traces.
- **Covering numbers of VC classes** (`coveringNumberLp_indicator_le_of_vcDimSet`): there is a
  universal `K` such that for every family `C` of measurable sets of VC dimension `d`, every
  probability `Q` and `0 < ε < 1`,
  `N(ε, C, L¹(Q)) ≤ K (d + 1) (4e)^{d+1} ε^{-d}` (van der Vaart–Wellner, Thm 2.6.4, p. 201, which
  gives `K d (4e)^d ε^{-d}` for `d ≥ 1`; the form with `d + 1` also covers `d = 0`, where the
  family has at most one member up to null sets). The Lean statement asserts that the covering
  number is finite before bounding it, since `ENat.toNat ⊤ = 0`. In `Lʳ(Q)`, `r ≥ 1`, the bound holds with
  `ε^{-rd}`, since `‖1_A - 1_B‖_{Q,r} = ‖1_A - 1_B‖_{Q,1}^{1/r}`.
- **VC-subgraph classes**: a class whose subgraphs `{(x, s) | s < f_t(x)}` form a VC family of
  dimension `d`, with measurable envelope `F`, satisfies
  `N(ε ‖F‖_{Q,r}, f, Lʳ(Q)) ≤ K d (16e)^d ε^{-rd}` for `d ≥ 1` and `0 < ε < 1` (van der
  Vaart–Wellner, Thm 2.6.7, p. 206), and so has a finite uniform entropy integral.
- **Glivenko–Cantelli under uniform entropy** (`isGlivenkoCantelli_of_uniformCoveringNumber`):
  for a pointwise separable class with integrable envelope `F` and uniformly bounded
  `N(ε ‖F‖_{Q,1}, f, L¹(Q))` over empirical measures `Q`, for every `ε > 0`, the class is
  Glivenko–Cantelli (van der Vaart, Thm 19.13, p. 274; van der Vaart–Wellner, Thm 2.4.3, p. 186).
- **Donsker under uniform entropy** (`isDonsker_of_uniformEntropyIntegral_lt_top`): for a
  pointwise separable class with square-integrable envelope and finite uniform entropy integral,
  the class is Donsker (van der Vaart, Thm 19.14, p. 274; van der Vaart–Wellner, Thm 2.5.2,
  p. 192).
- Examples of VC dimension: half-lines `(-∞, t]` in `ℝ` have dimension `1`, intervals dimension
  `2`, and half-spaces in `ℝ^p` dimension `p + 1`, the upper bound by Radon's theorem (Mathlib
  `radon_partition`) (van der Vaart, Ex 19.16, p. 276, for cells).

*Proof route.* The covering bound follows van der Vaart–Wellner: a maximal `ε`-separated subfamily
in `L¹(Q)`, sampled at `m` i.i.d. points from `Q`, is still separated on the sample with positive
probability for `m` of order `ε⁻¹ log` of its size; Sauer–Shelah bounds the number of traces, and
solving the resulting inequality gives the polynomial bound. The uniform-entropy theorems use
symmetrization and, conditionally on the sample, the chaining bound (3.3) with respect to
`L²(ℙₙ)`, which is controlled by the uniform entropy integral; pointwise separability reduces the
suprema to countable ones, so the conditional expectations are those of measurable functions.

*Needs:* 3.1–3.4; Mathlib `Finset.vcDim`, `Finset.card_shatterer_le_sum_vcDim`, `radon_partition`.

**Checks.**

- `vcDimSet`: half-lines shatter every one-point set; on `{a < b}` they cannot pick out `{b}`, so
  the dimension is `1`. Intervals shatter `{a < b}` but cannot pick out `{a, c}` from `{a < b < c}`,
  so the dimension is `2`.
- `vcDimSet`: all finite subsets of `ℕ` have dimension `∞`.
- `vcDimSet`: the empty family and the family `{∅}` both have dimension `0`, the first shattering
  no set and the second only `∅`; the power set of a three-point `X` has dimension `3`.
- Sauer–Shelah with `d = 1` and `n = 3`: at most `1 + 3 = 4` traces, attained by half-lines on
  three points (`∅` and the three initial segments).

### 3.6 Asymptotic equicontinuity

- **Random indices** (`tendstoInProbability_empiricalProcess_sub`): on a Donsker class, if `τₙ` is
  a random index with `‖f_{τₙ} - f_{t₀}‖_{L²(P)} → 0` in outer probability, then
  `𝔾ₙ f_{τₙ} - 𝔾ₙ f_{t₀} → 0` in outer probability, with `𝔾ₙ` the empirical process (van der
  Vaart, Lemma 19.24, p. 280).

*Proof route.* By 2.3 the limit concentrates on `UC(T, ρ_P)` for the `L²(P)` semimetric, so the
empirical process is asymptotically `ρ_P`-equicontinuous; on the event `ρ_P(τₙ, t₀) < δ` the
difference is at most the modulus at `δ`.

*Needs:* 2.3, 3.1.

**Checks.**

- For the half-line class and `τₙ = t₀ + Zₙ` with `Zₙ → 0` in probability and `F` continuous,
  `‖1_{(-∞, τₙ]} - 1_{(-∞, t₀]}‖²_{L²(P)} = |F(τₙ) - F(t₀)| → 0`, so `𝔾ₙ(τₙ) - 𝔾ₙ(t₀) → 0`; this is
  the step behind the Bahadur representation of 5.8.

### Examples

- Kolmogorov–Smirnov limit: `√n sup_t |Fₙ(t) - F(t)|` converges in law to `sup_t |B(F(t))|`, by
  3.4 and the bridge of 2.2 applied to the supremum norm, a continuous function on `ℓ^∞(ℝ)`; the
  statistic is measurable by Foundations 9.2. MathematicalStatisticsNonparametric identifies the
  law of the limit.

### Dependencies

Layers 1–2; Mathlib's strong law, sub-Gaussian and shattering files; StochasticCalculus §1.4.

## Layer 4: Hadamard differentiability, the functional delta method and the argmax theorem

### 4.1 Hadamard derivatives

- `HasHadamardDerivWithinAt φ dom D₀ φ' θ`, for normed spaces `D`, `F`, a domain `dom ⊆ D`, a
  tangent set `D₀` and `φ' : D →L[ℝ] F`: `θ ∈ dom`, and
  `(φ(θ + tₙ hₙ) - φ(θ)) / tₙ → φ'(h)` whenever `tₙ > 0`, `tₙ → 0`, `hₙ → h ∈ D₀` and
  `θ + tₙ hₙ ∈ dom` (van der Vaart, §20.2, p. 296, where the domain is written `D_φ`).
- **Chain rule** (`HasHadamardDerivWithinAt.comp`): if `φ` is Hadamard differentiable at `θ`
  tangentially to `D₀`, `ψ` at `φ(θ)` tangentially to a set containing `φ'(D₀)`, and `φ` maps
  `dom φ` into `dom ψ`, then `ψ ∘ φ` is Hadamard differentiable with derivative `ψ' ∘ φ'` (van
  der Vaart, Thm 20.9, p. 298).
- In finite dimensions, with `dom` a neighbourhood of `θ` and `D₀ = D`, Hadamard differentiability
  is Mathlib's `HasFDerivAt`. In general, if `θ ∈ dom` and `HasFDerivAt φ φ' θ`, then
  `HasHadamardDerivWithinAt φ dom D₀ φ' θ` for every tangent set `D₀`.
- `quantileFunctional p z = sInf {x | p ≤ z(x)}` on `ℓ^∞(ℝ)`.
- **The quantile functional** (`hasHadamardDerivWithinAt_quantileFunctional`): for `0 < p < 1`, if
  the distribution function `F` of `P` has `F(ξ) = p` and a derivative `f > 0` at `ξ`, then the
  quantile functional is Hadamard differentiable at `F`, within the monotone functions and
  tangentially to the functions continuous at `ξ`, with derivative `h ↦ -h(ξ)/f` (van der Vaart,
  Lemma 21.3, p. 306).

*Proof route.* The chain rule: `ψ(φ(θ + tₙhₙ)) = ψ(φ(θ) + tₙ kₙ)` with
`kₙ = (φ(θ + tₙhₙ) - φ(θ))/tₙ → φ'(h)`. The quantile: let `ξₙ` be the quantile of `F + tₙ hₙ`;
monotonicity gives `(F + tₙhₙ)(ξₙ - εₙ) ≤ p ≤ (F + tₙhₙ)(ξₙ + εₙ)` for `εₙ = o(tₙ)`; `F(ξ) = p` with
`F'(ξ) > 0` gives `ξₙ → ξ` and `F(ξₙ ± εₙ) - p = f (ξₙ - ξ) + o(|ξₙ - ξ| + tₙ)`; continuity of `h`
at `ξ` gives `hₙ(ξₙ ± εₙ) → h(ξ)`; solve for `(ξₙ - ξ)/tₙ`.

*Needs:* 2.3; Mathlib `HasFDerivAt`, `lp.evalCLM`.

**Checks.**

- `quantileFunctional`: at the uniform distribution function on `[0, 1]` and `p = 1/2`, the
  value is `1/2`; at `z = 1_{[1/2, ∞)}` it is `1/2` for every `p ∈ (0, 1]`.
- The tangent set is needed: for `F` uniform on `[0, 1]`, `p = 1/2` and the direction
  `h = 1_{[1/2, ∞)}`, which is discontinuous at `ξ = 1/2`, the set `{x | 1/2 ≤ F(x) + t h(x)}` is
  `[1/2, ∞)` for `0 < t < 1/2`, so every difference quotient is `0`, while `-h(ξ)/f = -1`. For the
  continuous direction `h = 1` the quantile of `F + t` is `1/2 - t` and the quotient is
  `-1 = -h(ξ)/f`.
- `h ↦ -h(ξ)/f` is continuous linear on `ℓ^∞(ℝ)` with norm `1/f`.
- `HasHadamardDerivWithinAt` requires `θ ∈ dom`: for `φ = id`, `θ = 0` and `dom = ∅`, the Fréchet
  derivative is `id`, but the predicate is false because its first conjunct `0 ∈ ∅` fails.

### 4.2 The functional delta method

- **Functional delta method** (`tendstoInOuterDistribution_functional_delta_method`): let
  `rₙ → ∞`, let `Tₙ` take values in `dom`, and let `rₙ(Tₙ - θ) → L` weakly in `D`, with `L`
  concentrated on a separable measurable subset of `D₀`. If `φ` is Hadamard differentiable at `θ`
  within `dom` tangentially to `D₀`, then `rₙ(φ(Tₙ) - φ(θ)) → L.map φ'` weakly, and
  `rₙ(φ(Tₙ) - φ(θ)) - φ'(rₙ(Tₙ - θ)) → 0` in outer probability (van der Vaart, Thm 20.8, p. 297;
  van der Vaart–Wellner, Thm 3.10.4, p. 520).
- With the bridge of 2.2: if moreover the statistics `φ(Tₙ)` are measurable, `rₙ(φ(Tₙ) - φ(θ))`
  converges in law in Mathlib's sense.

*Proof route.* Apply the extended continuous mapping theorem (2.2) to
`gₙ(h) = rₙ(φ(θ + h/rₙ) - φ(θ))` on `Dₙ = {h | θ + h/rₙ ∈ dom}`, which converges to `φ'` along
sequences with limits in `D₀` by Hadamard differentiability (`tₙ = 1/rₙ`). For the remainder,
apply it to the pair `(gₙ(h), φ'(h))`, whose difference converges weakly to the Dirac law at `0`,
hence in outer probability.

*Needs:* 2.2, 4.1.

**Checks.**

- `D = F = ℝ`, `φ(x) = x²`, `θ = 1`, `rₙ = √n`: the theorem is Foundations 8.4 with derivative `2`.
- Quantiles (van der Vaart, Ex 20.5, p. 294): with `Tₙ` the empirical distribution function,
  `θ = F` and `L` the `F`-bridge of 3.4, which is concentrated on functions continuous at `ξ` when
  `F` is, the derivative of 4.1 gives `√n(F_n^{-1}(p) - ξ) → N(0, p(1 - p)/f²)`, which is 5.8.

### 4.3 The argmax theorem

- **Argmax continuous mapping** (`tendstoInOuterDistribution_argmax`): let `Mₙ` and `M` be random
  criteria on a metric space `H` such that, for every compact `K ⊆ H`, `Mₙ → M` weakly in
  `ℓ^∞(K)`. If almost every sample path of `M` is upper semicontinuous with a unique maximizer
  `T`, `T` is a tight random element, `T̂ₙ` is uniformly tight (for every `ε > 0` a compact set
  contains `T̂ₙ` with outer probability at least `1 - ε` for all large `n`) and
  `Mₙ(T̂ₙ) ≥ sup_h Mₙ(h) - o_P(1)`, then `T̂ₙ → T` weakly in `H` (van der Vaart, Cor 5.58, p. 81,
  for `H = ℝ^k`; Thm 5.56, p. 80; van der Vaart–Wellner, Thm 3.2.2, p. 394).

The paths of `Mₙ` and `M` are assumed bounded on compact sets, so that their restrictions are
elements of `ℓ^∞(K)` through `liftLinfty`, and the limit restrictions are measurable.

*Proof route.* For a closed `F ⊆ H` and a compact `K`, the event `T̂ₙ ∈ F ∩ K` implies
`sup_{F ∩ K} Mₙ ≥ sup_K Mₙ - o_P(1)`; the map `z ↦ sup_{F ∩ K} z - sup_K z` is continuous on
`ℓ^∞(K)`, so by the portmanteau (2.2) `limsup P*(T̂ₙ ∈ F ∩ K) ≤ P(sup_{F∩K} M ≥ sup_K M)`. Upper
semicontinuity and uniqueness of the maximizer bound the right side by `P(T ∈ F) + P(T ∉ K)`, and
tightness of `T̂ₙ` and `T` removes `K`.

*Needs:* 2.2, 2.3.

**Checks.**

- `H = ℝ`, `M(h) = hZ - h²/2` with `Z ~ N(0, 1)` and `Mₙ(h) = h Zₙ - h²/2` with `Zₙ → Z` in law: the
  maximizers are `Zₙ` and `Z`, and the theorem gives `Zₙ → Z`.
- The uniqueness hypothesis is needed: for `M ≡ 0` every point is a maximizer, and `T̂ₙ` may
  oscillate between `0` and `1` while satisfying every other hypothesis.
- Uniform tightness cannot be weakened to asymptotic tightness (closeness to a compact set) in an
  infinite-dimensional `H`: in `ℓ²([0, 1])` let `ω` be uniform on `[0, 1]`, `T̂ₙ = e_ω/(n + 1)`,
  `M(h) = -‖h - e₀‖²` and `Mₙ = M` except `Mₙ(T̂ₙ) = 1`. Every compact set meets the spikes
  `{e_ω/(n + 1)}` in a countable set of `ω`, so the restrictions to compacts agree almost surely
  and `Mₙ → M` there; `T̂ₙ → 0` is asymptotically tight and maximizes `Mₙ`, but the maximizer of
  `M` is `e₀`. No compact set contains `T̂ₙ` with positive probability, so uniform tightness
  fails.

### Examples

- The median as an argmax: for `m_θ(x) = -|x - θ|` and a median `θ₀` with density `f(θ₀) > 0`,
  the local criterion `Mₙ(h) = n ℙₙ(m_{θ₀ + h/√n} - m_{θ₀})` converges in every `ℓ^∞([-K, K])`
  to `h W - f(θ₀) h²` with `W ~ N(0, 1)`. Its maximizer `W/(2 f(θ₀))` has variance
  `1/(4 f(θ₀)²)`, which is 5.8 at `p = 1/2`.

### Dependencies

Layers 2–3.

## Layer 5: M- and Z-estimators, maximum likelihood and quantiles

The law `P` of the observations need not belong to a model unless a statement says so. For
`θ ∈ EuclideanSpace ℝ (Fin k)`, `V` is a `k × k` matrix acting through `Matrix.toEuclideanCLM`.
*Asymptotically linear* means `√n(θ̂ₙ - θ₀) + V⁻¹ n^{-1/2} ∑ᵢ ψ(xᵢ) → 0` in probability for an
influence function `-V⁻¹ψ`; by 1.1 and 1.2 such an estimator converges in law to
`N(0, V⁻¹ Cov(ψ) V⁻ᵀ)` (`zEstimator_tendstoInDistribution`).

The subsections are numbered by topic. The internal build order is 5.1 → 5.6 → 5.5: the
M-estimator theorem of 5.5 takes its `√n` rate from the rate theorem of 5.6, which needs only
5.1. Every other subsection needs only earlier ones.

### 5.1 Consistency

- **Consistency of approximate maximizers** (`tendstoInProbability_of_isWellSeparated`): if
  `sup_θ |Mₙ(θ) - M(θ)| → 0` in outer probability, the maximum of `M` at `θ₀` is well separated
  (`sup_{d(θ, θ₀) ≥ ε} M(θ) < M(θ₀)` for every `ε > 0`), and `Mₙ(θ̂ₙ) ≥ Mₙ(θ₀) - o_P(1)`, then
  `θ̂ₙ → θ₀` in outer probability (van der Vaart, Thm 5.7, p. 45).
- The uniform convergence holds for `Mₙ = ℙₙ m_θ` when `Θ` is a compact metric space,
  `θ ↦ m_θ(x)` is continuous for every `x` and `P sup_θ |m_θ| < ∞`: the class is
  Glivenko–Cantelli by bracketing (3.4), with brackets from the modulus of continuity on small
  balls and dominated convergence.
- For one-dimensional `Θ` and a monotone estimating function, a near zero of `Ψₙ` is consistent
  when `Ψ(θ₀ - ε) < 0 < Ψ(θ₀ + ε)` (van der Vaart, Lemma 5.10, p. 47).

*Needs:* 1.1, 3.4.

**Checks.**

- Well-separatedness is needed: on `Θ = ℝ` with `M(θ) = -θ²/(1 + θ⁴)`, the maximum `0` at `θ = 0`
  is unique but `M(θ) → 0` as `θ → ∞`, so the condition fails for every `ε`.
- `Mₙ = M` deterministic with the exact maximizer `θ̂ₙ = θ₀`: the conclusion is trivial.

### 5.2 Wald's consistency of maximum likelihood

- **Wald's theorem** (`tendstoInProbability_mle_of_isCompact`): let `Θ` be a compact metric space
  and `p_θ` positive measurable probability densities with respect to `ν`, every one
  normalized (`hnorm`), identifiable, with
  `θ ↦ log p_θ(x)` upper semicontinuous for `ν`-almost every `x`, and suppose every `θ` has a
  ball `U` with `sup_{θ' ∈ U} log(p_{θ'}/p_{θ₀})` measurable and of finite positive part under
  `P_{θ₀}`. If `ℓₙ(θ̂ₙ) ≥ ℓₙ(θ₀) - o_P(n)`, then `θ̂ₙ → θ₀` in `P_{θ₀}`-probability (van der Vaart,
  Thm 5.14, p. 48).

*Proof route.* By the information inequality `P_{θ₀} log(p_θ/p_{θ₀}) < 0` for `θ ≠ θ₀` (identifiability
and Mathlib's `klDiv_eq_zero_iff`). Upper semicontinuity and monotone convergence make
`P_{θ₀} sup_{U} log(p/p_{θ₀}) < 0` on small balls `U` around each `θ ≠ θ₀`; cover the compact set
`{d(θ, θ₀) ≥ ε}` by finitely many such balls and apply the strong law on each.

*Needs:* 5.1; Foundations 8.5; Mathlib `klDiv`, `ProbabilityTheory.strong_law_ae`.

**Checks.**

- `p_θ = N(θ, 1)` on `Θ = [-1, 1]`: `log(p_θ/p_{θ₀})(x) = (θ - θ₀)x - (θ² - θ₀²)/2` is continuous
  in `θ` and its supremum over a ball is integrable; the maximizer is the sample mean clipped to
  `[-1, 1]`.
- Identifiability is needed: for `p_θ = N(θ², 1)` on `[-1, 1]` and `θ₀ = 1/2`, the maximizer
  may converge to `-1/2`.
- Normalization of every density is needed: on a one-point space with `ν` the unit mass,
  `Θ = {0, 1}`, `p₀ = 1` and `p₁ = 2`, the estimator `θ̂ₙ = 1` has the larger likelihood and never
  converges to `θ₀ = 0`.

### 5.3 Z-estimators and maximum likelihood

- **The Z-estimator theorem** (`zEstimator_asymptotically_linear`): let `ψ_θ` be measurable with
  values in `EuclideanSpace ℝ (Fin k)`, square-integrable, with the coordinate classes
  `{ψ_θ,j : ‖θ - θ₀‖ < δ}` Donsker, `ψ_θ → ψ_{θ₀}` in `L²(P)` as `θ → θ₀`, `P ψ_{θ₀} = 0`, and
  `θ ↦ P ψ_θ` differentiable at `θ₀` with nonsingular derivative `V`. If `θ̂ₙ → θ₀` in probability
  and `n^{-1/2} ∑ᵢ ψ_{θ̂ₙ}(xᵢ) → 0` in probability, then `θ̂ₙ` is asymptotically linear with
  influence function `-V⁻¹ψ_{θ₀}` (van der Vaart, Thm 5.21, p. 52, with its Donsker form
  Thm 5.31, p. 60; van der Vaart–Wellner, Thm 3.3.1, p. 418).
- **Asymptotic normality** (`zEstimator_tendstoInDistribution`): an asymptotically linear
  estimator converges in law to `N(0, V⁻¹ Cov(ψ_{θ₀}) V⁻ᵀ)`.
- **The Lipschitz form**: if `‖ψ_{θ₁}(x) - ψ_{θ₂}(x)‖ ≤ ψ̇(x) ‖θ₁ - θ₂‖` near `θ₀` with
  `P ψ̇² < ∞`, the Donsker and continuity hypotheses hold, by 3.2 (Lipschitz parametric classes)
  and 3.4 (van der Vaart, Thm 5.21, p. 52).
- **Asymptotic normality of maximum likelihood**: in a dominated model on an open `Θ ⊆ ℝ^k` with
  `θ ↦ log p_θ(x)` three times continuously differentiable near `θ` with third derivatives
  dominated by an integrable function, score of mean `0` and nonsingular covariance `I(θ)`, and
  `E D² log p_θ = -I(θ)`, a consistent root of the likelihood equation satisfies
  `√n(θ̂ₙ - θ) = I(θ)⁻¹ n^{-1/2} ∑ᵢ ℓ̇_θ(xᵢ) + o_P(1)`, hence `→ N(0, I(θ)⁻¹)`; and with probability
  tending to one the likelihood equation has a consistent root, which a consistent sequence of
  maximizers is (van der Vaart, Thms 5.41 and 5.42, p. 68). These are the case `ψ_θ = ℓ̇_θ` of
  the classical Z-estimator theorem (`zEstimator_asymptotically_linear_of_contDiffOn`): if
  `θ ↦ ψ_θ(x)` is twice continuously differentiable on a ball around `θ₀` with second
  derivatives dominated by an integrable function, `P ψ_{θ₀} = 0`, `ψ_{θ₀} ∈ L²(P)` and
  `V = P ψ̇_{θ₀}` is invertible, every consistent approximate root is asymptotically linear with
  influence function `-V⁻¹ψ_{θ₀}` (van der Vaart, Thm 5.41, p. 68); and under the same hypotheses
  there are estimators converging to `θ₀` in probability that are roots with probability tending
  to one (`exists_tendstoInProbability_root_of_contDiffOn`; van der Vaart, Thm 5.42, p. 68). The
  form under differentiability in quadratic mean, for consistent maximizers, is in 7.3, since
  it uses Layer 7.

*Proof route.* By the asymptotic equicontinuity lemma (3.6) applied to each coordinate class
with the random index `θ̂ₙ`, `𝔾ₙ ψ_{θ̂ₙ} - 𝔾ₙ ψ_{θ₀} → 0` in probability. Hence
`√n P ψ_{θ̂ₙ} = -𝔾ₙ ψ_{θ₀} + o_P(1)`. Differentiability gives
`P ψ_{θ̂ₙ} = V(θ̂ₙ - θ₀) + o(‖θ̂ₙ - θ₀‖)`, which first yields `√n‖θ̂ₙ - θ₀‖ = O_P(1)` (nonsingular
`V`) and then the linear expansion. The normality statement is 1.2 and Slutsky (1.1). The
maximum likelihood statements are the case `ψ_θ = ℓ̇_θ`, with `V = -I(θ)` from the third-derivative
bound, and the existence of consistent roots as in the proof of van der Vaart's Thm 5.42.

*Needs:* 1.1, 1.2, 3.2, 3.4, 3.6, 5.1.

**Checks.**

- `ψ_θ(x) = x - θ`: `V = -I`, `θ̂ₙ = X̄ₙ`, the influence function is `x - θ₀` and the limit is
  `N(0, Cov X)`.
- `ψ_θ(x) = sign(x - θ)` (the median), `P` with density `f(θ₀) > 0` at its median: `V = -2f(θ₀)`
  and the limit variance is `1/(4f(θ₀)²)`, as in 5.8. This class is not Lipschitz but its
  half-line indicators are Donsker (3.4), so only the Donsker form applies.
- Exponential model `p_θ(x) = θ e^{-θx}`: `I(θ) = 1/θ²`, and the maximum likelihood estimator
  `1/X̄ₙ` has limit `N(0, θ²)`, agreeing with the delta method applied to `X̄ₙ`.

### 5.4 Parametric one-step estimators

This subsection is the parametric Newton step from a preliminary estimator; the semiparametric
one-step estimator with sample splitting belongs to MathematicalStatisticsSemiparametric.

- **One-step estimators** (`oneStep_asymptotically_linear`): let `Ψₙ` be random estimating
  functions with `√n Ψₙ(θ₀)` bounded in probability and, for every `C > 0`,
  `sup_{‖θ - θ₀‖ ≤ C/√n} ‖√n(Ψₙ(θ) - Ψₙ(θ₀)) - V √n(θ - θ₀)‖ → 0` in probability, for an invertible
  `V`. If `θ̃ₙ` is `√n`-consistent and `V̂ₙ → V` in probability, the one-step estimator
  `θ̂ₙ = θ̃ₙ - V̂ₙ⁻¹ Ψₙ(θ̃ₙ)` satisfies `√n(θ̂ₙ - θ₀) = -V⁻¹ √n Ψₙ(θ₀) + o_P(1)` (van der Vaart,
  Thm 5.45, p. 72).
- **Discretized preliminary estimators** (`oneStep_asymptotically_linear_of_discretized`): if
  `θ̃ₙ` takes values in the grid `n^{-1/2} ℤ^k`, it suffices that the expansion
  `√n(Ψₙ(θₙ) - Ψₙ(θ₀)) - V √n(θₙ - θ₀) → 0` in probability hold along every deterministic
  `θₙ = θ₀ + n^{-1/2} hₙ` with `hₙ` bounded (van der Vaart, Thm 5.48, p. 73, with condition
  (5.47), p. 72).
- The uniform expansion holds for `Ψₙ = ℙₙ ψ_θ` under the hypotheses of the Lipschitz form in 5.3,
  and under those of maximum likelihood in 5.3 with `V̂ₙ = n⁻¹ D² ℓₙ(θ̃ₙ)`, the one-step
  estimator is asymptotically `N(0, I(θ₀)⁻¹)` without any root of the likelihood equation.

*Proof route.* Insert `θ = θ̃ₙ`, which lies in a ball of radius `C/√n` with probability at least
`1 - ε`; `√n Ψₙ(θ̃ₙ) = √n Ψₙ(θ₀) + V√n(θ̃ₙ - θ₀) + o_P(1)`, and `V̂ₙ⁻¹ → V⁻¹` by continuity of
inversion. The grid case reduces the supremum to finitely many deterministic sequences on each
ball.

*Needs:* 1.1, 5.3.

**Checks.**

- `Ψₙ(θ) = X̄ₙ - θ`, `V = V̂ₙ = -1`: the one-step estimator is `X̄ₙ` from any start.
- Cauchy location from the sample median as `θ̃ₙ`: the one-step estimator has limit variance
  `1/I = 2`, against `π²/4 ≈ 2.47` for the median.

### 5.5 M-estimators

- **M-estimators with a Lipschitz criterion** (`mEstimator_asymptotically_linear`): let
  `θ ↦ m_θ(x)` be differentiable at `θ₀` for `P`-almost every `x` with gradient `ṁ(x)`, Lipschitz
  on a common ball around `θ₀` (one radius for all pairs `θ₁, θ₂` and all `x`) with a
  square-integrable constant `L(x)`, and let `θ ↦ P m_θ` have a second-order
  expansion at its maximum `θ₀` with nonsingular symmetric `V`. If `θ̂ₙ → θ₀` in probability and
  `ℙₙ m_{θ̂ₙ} ≥ sup_θ ℙₙ m_θ - o_P(n⁻¹)`, then `θ̂ₙ` is asymptotically linear with influence
  function `-V⁻¹ ṁ` (van der Vaart, Thm 5.23, p. 53).

*Proof route.* Van der Vaart's proof: the class `{√n (m_{θ₀ + h/√n} - m_{θ₀}) - hᵀṁ : ‖h‖ ≤ C}` is
Lipschitz-dominated, so by 3.4 and 3.6 the local criterion `n ℙₙ(m_{θ₀ + h/√n} - m_{θ₀})` equals
`hᵀ 𝔾ₙ ṁ + ½ hᵀVh + o_P(1)` uniformly on compacts; the rate `√n` follows by 5.6 with
`φₙ(δ) = δ`, and comparing the criterion at `√n(θ̂ₙ - θ₀)` and at `-V⁻¹𝔾ₙ ṁ` gives the expansion.

*Needs:* 3.4, 3.6, 5.6.

**Checks.**

- The median: `m_θ(x) = |x| - |x - θ|` with `L ≡ 1`, `ṁ(x) = sign(x - θ₀)` and `V = -2f(θ₀)`.
- `m_θ(x) = -(x - θ)²` under finite variance: not Lipschitz with a fixed `L` globally, but on a
  neighbourhood `L(x) = 2(|x - θ₀| + 1)` works; `V = -2`, `ṁ = 2(x - θ₀)` and the limit is
  `N(0, Var X)`.

### 5.6 Rates of convergence

- **The rate theorem** (`isBoundedInProbability_rate_mEstimator`): suppose
  `M(θ) - M(θ₀) ≤ -c d(θ, θ₀)²` near `θ₀`; that
  `E* sup_{d(θ, θ₀) < δ} |(Mₙ - M)(θ) - (Mₙ - M)(θ₀)| ≤ C φₙ(δ)/√n` for `n ≥ 1` and small `δ`,
  with `E*` the extended outer expectation `outerLIntegral` (2.1), and with
  `δ ↦ φₙ(δ)/δ^a` decreasing for some `a < 2`; and `rₙ² φₙ(1/rₙ) ≤ √n`. If
  `Mₙ(θ̂ₙ) ≥ Mₙ(θ₀) - O_P(rₙ⁻²)` and `θ̂ₙ → θ₀` in outer probability, then
  `rₙ d(θ̂ₙ, θ₀) = O_P(1)` (van der Vaart, Thm 5.52, p. 75; van der Vaart–Wellner, Thm 3.2.5,
  p. 397).
- The modulus `φₙ(δ) = δ` gives `rₙ = √n`, for criteria with a Lipschitz-in-parameter bound
  (van der Vaart, Cor 5.53, p. 77).
- **The modal interval**: for `m_θ = 1_{[θ - 1, θ + 1]}`, a law with bounded density for which
  `θ ↦ P[θ - 1, θ + 1]` has a unique maximizer `θ₀` with negative second derivative, and a
  consistent maximizer `θ̂ₙ`, `n^{1/3}(θ̂ₙ - θ₀) = O_P(1)` (van der Vaart, Ex 5.54, p. 77).

*Proof route.* The peeling argument: split `{rₙ d(θ̂ₙ, θ₀) > 2^M}` into shells
`2^{j-1} < rₙ d ≤ 2^j`; on each shell the curvature and the near-maximality force the centred
criterion to exceed `c 2^{2j-2}/rₙ²`, whose outer probability is at most
`C φₙ(2^j/rₙ) rₙ²/(√n 2^{2j-2})` by Markov's inequality for `outerLIntegral` (2.1); the decrease of
`φₙ(δ)/δ^a` and the rate equation bound the sum over `j ≥ M` by a tail of `∑ 2^{j(a-2)}`.

*Needs:* 2.1, 3.3, 5.1.

**Checks.**

- Rate equation: `φₙ(δ) = δ` gives `rₙ² · rₙ⁻¹ = rₙ ≤ √n`; `φₙ(δ) = √δ` gives `rₙ^{3/2} ≤ √n`,
  so `rₙ = n^{1/3}`.
- `a < 2` is needed: `φₙ(δ) = δ²` would give the rate equation `1 ≤ √n` for every `rₙ`.
- The outer expectation must be extended-valued: with `X ≥ 1`, `P(X > t) = 1/t`,
  `M(θ) = -θ²`, `Mₙ(θ) = -θ² + 2n^{-1/4} X θ` and the exact maximizer `θ̂ₙ = n^{-1/4} X`, the local
  modulus `2n^{-1/4} X δ` is finite pointwise but not integrable. Its real `outerIntegral` is the
  junk value `0`, which would satisfy the modulus bound with `C = 0`, yet `√n |θ̂ₙ| = n^{1/4} X` is
  not bounded in probability. Its `outerLIntegral` is `∞`, so the hypothesis fails as it should.

### 5.7 Misspecified maximum likelihood

- **Misspecification**: let the observations have law `P`, possibly outside the model, and let
  `θ*` be the unique maximizer of `θ ↦ P log p_θ`. If `ψ_θ = ∇ log p_θ` satisfies the hypotheses
  of 5.3 with `P` and `θ*`, with derivative `-A` of `θ ↦ P ψ_θ` at `θ*`, and
  `B = P[ψ_{θ*} ψ_{θ*}ᵀ]`, then a consistent sequence of maximizers satisfies
  `√n(θ̂ₙ - θ*) → N(0, A⁻¹ B A⁻ᵀ)` (van der Vaart, Ex 5.25, p. 55). When `P log p` is finite for
  the density `p` of `P`, `θ*` minimizes `θ ↦ KL(P ‖ P_θ)`; when `P = P_{θ*}`, `A = B = I(θ*)`.

*Needs:* 5.3; Mathlib `klDiv`.

**Checks.**

- Fitting `N(θ, 1)` to a law with mean `μ` and variance `σ²`: `θ* = μ`, `A = 1`, `B = σ²`, and
  the sandwich `σ²` is the variance of `X̄ₙ`; the model-based variance `1` is wrong unless
  `σ² = 1`.

### 5.8 Sample quantiles and the Bahadur representation

- **Sample quantiles** (`tendstoInDistribution_sampleQuantile`): for `0 < p < 1`, if `F(ξ) = p`
  and `F` has a derivative `f > 0` at `ξ`, then `√n(F_n^{-1}(p) - ξ) → N(0, p(1 - p)/f²)` (van
  der Vaart, Cor 21.5, p. 307).
- **Bahadur representation** (`tendstoInProbability_bahadur_remainder`): under the same
  hypotheses `√n(F_n^{-1}(p) - ξ - (p - Fₙ(ξ))/f) → 0` in probability (van der Vaart, Cor 21.5,
  p. 307). Hence finitely many sample quantiles are jointly asymptotically normal with covariance
  `(p ∧ p' - pp')/(f(ξ_p) f(ξ_{p'}))`.

*Proof route.* The functional delta method (4.2) with the quantile derivative of 4.1 and the
classical Donsker theorem (3.4); the limit `B ∘ F` is concentrated on functions continuous at
`ξ`, since `F` is continuous at `ξ` and `B` has continuous paths. The remainder statement of 4.2
is the Bahadur representation. Measurability of the sample quantile, a coordinate of the sorted
sample, gives Mathlib's convergence in law through the bridge (2.2).

*Needs:* 3.4, 4.1, 4.2; Foundations 9.1.

**Checks.**

- The median of `N(0, 1)`: `f(0) = 1/√(2π)` and the variance is `(1/4) · 2π = π/2 ≈ 1.571`; of
  the Laplace law `e^{-|x|}/2`, `1`; of the Cauchy law, `π²/4 ≈ 2.467`.
- `P` uniform on `[0, 1]`: `ξ = p`, `f = 1`, and the Bahadur term is `p - Fₙ(p)`, whose variance
  `p(1 - p)/n` matches the limit.
- The density hypothesis is needed: for `P = (δ₀ + δ₁)/2` and `p = 1/2`, `F(0) = 1/2` and the
  sample median is `0` or `1` with probabilities tending to `1/2` each, so `√n(F_n^{-1}(1/2) - 0)`
  is not tight.

### Examples

- Huber's location M-estimator, `ψ = ψ_k` the Huber score of Foundations 9.2: by the Lipschitz
  form of 5.3, `√n(θ̂ₙ - θ₀) → N(0, E ψ_k(X - θ₀)²/(2F(θ₀ + k) - 1)²)` for `F` symmetric about
  `θ₀` and continuous at `θ₀ ± k` (van der Vaart, Ex 5.28, p. 58, for regression).

### Dependencies

Layers 1–4 and Foundations 8.5, 9.1–9.2.

## Layer 6: projections, U-statistics and L-statistics

### 6.1 The Hájek projection

- `hajekProjection P T x = ∑ᵢ E(T | Xᵢ = xᵢ) - (n - 1) E T` for independent coordinates with laws
  `P i`, the conditional expectations written as integrals over the other coordinates.
- **Orthogonality** (`integral_sub_hajekProjection_mul_eq_zero`): for square-integrable `T`, the
  residual `T - T̂` is orthogonal in `L²` to every sum `∑ᵢ gᵢ(xᵢ)` with `gᵢ ∈ L²(P i)`. For
  `n ≥ 1` these sums contain the constants and `T̂` is one of them, so `T̂` is the `L²` projection
  onto the closed space of such sums (van der Vaart, Lemma 11.10, p. 157). For `n = 0` the space
  of empty sums is `{0}` and the formula gives `T̂ = E T`, not the projection.
- **The projection theorem** (`tendsto_integral_sq_standardized_sub_of_isProjection`): if
  `Var Tₙ / Var Sₙ → 1` for the projections `Sₙ` of `Tₙ` onto closed linear spaces containing the
  constants (so that `Tₙ - Sₙ` is orthogonal to `Sₙ` and to `1`), then
  `(Tₙ - E Tₙ)/sd(Tₙ) - (Sₙ - E Sₙ)/sd(Sₙ) → 0` in `L²` (van der Vaart, Thm 11.2, p. 154). With the
  Hájek projection and the Lindeberg condition on its summands (1.2),
  `(Tₙ - E Tₙ)/sd(Tₙ) → N(0, 1)`.

*Proof route.* Orthogonality: Fubini on `Measure.pi`, and `E(gᵢ(Xᵢ) | Xⱼ) = E gᵢ(Xᵢ)` for
`j ≠ i`. The projection theorem: `E(Tₙ Sₙ) = E Sₙ²` by the projection property, so the squared
`L²` norm of the difference of the standardized variables is `2 - 2 sd(Sₙ)/sd(Tₙ) → 0`, and the
norm tends to `0` with it.

*Needs:* 1.2; Mathlib `Measure.pi`, `MemLp`.

**Checks.**

- `T(x) = x₁ x₂` with centred `P`: `E(T | X₁) = X₁ E X₂ = 0`, the projection is `0`, and `T` is
  orthogonal to every sum of one-coordinate functions.
- `T(x) = ∑ᵢ xᵢ`: the projection is `T` itself.
- `hajekProjection` at `n = 0` with `T ≡ 1`: the formula gives `0 - (-1) · 1 = 1`, while the
  projection onto the empty sums `{0}` is `0`; the projection statement needs `n ≥ 1`.
- The normalization of the projection theorem: for independent standard normal `X`, `Y`,
  `T = X + Y` and its projection `S = X` onto the span of `1` and `X`, the squared `L²` norm of
  `T/√2 - X` is `2 - √2 ≈ 0.586` and its norm is `√(2 - √2) ≈ 0.765`; here `Var T / Var S = 2`.

### 6.2 Nondegenerate U-statistics

- **Asymptotic normality** (`tendstoInDistribution_uStatistic`): for a measurable symmetric kernel
  `h` of order `m` (written `m + 1` in `Suggested.lean`) with `E h² < ∞`, `θ = E h` and
  `ζ₁ = Var g(X₁)` with `g(x) = E h(x, X₂, …, X_m)`,
  `√n (Uₙ - θ) → N(0, m² ζ₁)` (van der Vaart, Thm 12.3, p. 162). For `ζ₁ = 0` the limit is the
  Dirac law at `0`.
- The Hájek projection of `Uₙ - θ` is `(m/n) ∑ᵢ (g(Xᵢ) - θ)`, and
  `√n (Uₙ - θ - Ûₙ) → 0` in `L²`.

*Proof route.* Compute the projection: `E(Uₙ | Xᵢ) - θ = (m/n)(g(Xᵢ) - θ)`, since a fraction `m/n`
of the subsamples contain `i`. The variance of `Uₙ` is `m² ζ₁/n + O(n⁻²)` by counting pairs of
subsamples sharing `c` points; then 6.1 and the central limit theorem (1.2).

*Needs:* 1.2, 6.1; Foundations 2.4.

**Checks.**

- Sample variance: `h(x, y) = (x - y)²/2`, `m = 2`, `g(x) = ((x - μ)² + σ²)/2`, and
  `m² ζ₁ = μ₄ - σ⁴`, which is `2` for `N(0, 1)` and `8` for the exponential law of mean `1`
  (`μ₄ = 9`).
- Wilcoxon kernel `h(x, y) = 1{x + y > 0}` under a continuous law symmetric about `0`:
  `g(x) = F(x)`, `ζ₁ = Var F(X) = 1/12`, and `m² ζ₁ = 1/3`.

### 6.3 The Hoeffding decomposition and degenerate U-statistics

- `hoeffdingProjection P h S y`, the conditional expectation of `h` given the coordinates in `S`,
  evaluated at `y` (the other coordinates integrated out under `P`), and
  `hoeffdingKernel P h S = ∑_{T ⊆ S} (-1)^{|S| - |T|} hoeffdingProjection P h T`.
- **Hoeffding decomposition** (`uStatistic_hoeffding_decomposition`): for a square-integrable
  symmetric kernel `h` of order `m` and `n ≥ m`, `Uₙ - θ` is the sum over nonempty `S ⊆ Fin m`
  of the U-statistics of the kernels `h_S`; each `h_S` is canonical (its integral in any one
  coordinate of `S` vanishes a.e.), and
  `Var Uₙ = ∑_{j=1}^m (m choose j)² / (n choose j) · E h_{S_j}²` with `S_j = {0, …, j - 1}` (by the
  same argument as van der Vaart, Thm 12.3, p. 162). By symmetry the `(m choose j)` sets of size
  `j` give the same statistic, `U_{n,j}`, the U-statistic of order `j` of the symmetric canonical
  kernel `h_j = h_{S_j}`, so `Uₙ - θ = ∑_j (m choose j) U_{n,j}`; the terms are orthogonal in `L²`
  and `h₁ = g - θ`. For `n < m` there are no injections, `Uₙ = 0`, and neither identity is
  asserted.
- **Optimality** (`variance_uStatistic_le_of_unbiased`): let `C` be a family of laws on `X`, with measurable singletons, that contains the
  finitely supported laws, and let `h` be measurable, symmetric and square-integrable under every
  `P ∈ C`, with `n ≥ m`. Every estimator `δ` of `P ↦ ∫ h dPᵐ` that is unbiased and
  square-integrable under every `Pⁿ`, `P ∈ C`, has `Var_P δ ≥ Var_P Uₙ` for every `P ∈ C`.
- **The eigen-expansion of a degenerate kernel**: for symmetric `h ∈ L²(P ⊗ P)`, the integral
  operator `a ↦ ∫ h(·, y) a(y) dP(y)` on `L²(P)` is compact and self-adjoint; its eigenvalues
  `λⱼ` and orthonormal eigenfunctions `φⱼ` give `h = ∑ⱼ λⱼ φⱼ ⊗ φⱼ` in `L²(P ⊗ P)` with
  `∑ⱼ λⱼ² < ∞`, and `∑ⱼ λⱼ (Zⱼ² - 1)` converges in `L²` for independent standard normal `Zⱼ`.
- **Degenerate quadratic U-statistics** (`tendstoInDistribution_degenerate_uStatistic`): if
  moreover `∫ h(x, y) dP(y) = 0` for every `x`, then `n Uₙ → ∑ⱼ λⱼ (Zⱼ² - 1)` in law (van der
  Vaart, Thm 12.10, p. 169). The eigenvalues are indexed by `ℕ`, a finite expansion being padded
  with `λⱼ = 0`, and orthonormality is required only among the `φⱼ` with `λⱼ ≠ 0`, so that a
  finite-dimensional `L²(P)` is covered.

*Proof route.* The decomposition is inclusion–exclusion over subsets of the arguments of `h`
(Möbius inversion on the subset lattice gives `∑_{S} h_S = h` with `h_∅ = θ`), with
orthogonality from canonicity. Optimality is not Foundations 4.2 applied to `C` directly, since a
family of laws with `E h² < ∞` need not be closed under mixtures. Instead: replace `δ` by its
average `δ̄` over the permutations of the sample, which is unbiased with variance at most that of
`δ` under every `Pⁿ` (Jensen). The finitely supported laws form a family closed under binary
mixtures and complete for the identity statistic (Dirac laws separate points), so by the
completeness of symmetric statistics (Foundations 2.4) the symmetric statistic `δ̄ - Uₙ`, of mean
`0` under every `Qⁿ` with `Q` finitely supported, vanishes `Qⁿ`-a.e. for each such `Q`. Every
`x ∈ Xⁿ` is an atom of `Qⁿ` for `Q` the uniform law on the coordinates of `x`, so `δ̄ = Uₙ` at every
point; hence `Var_P δ ≥ Var_P δ̄ = Var_P Uₙ` for every `P ∈ C`. The eigen-expansion is Mathlib's spectral theorem
`ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot`, compactness from
`isCompactOperator_of_tendsto` applied to the finite-rank truncations of `h` in an orthonormal
basis of `L²(P ⊗ P)`. For the limit: for a finite truncation `h_N = ∑_{j<N} λⱼ φⱼ ⊗ φⱼ`,
`n U_n(h_N) = (n/(n-1)) ∑_{j<N} λⱼ ((n^{-1/2} ∑ᵢ φⱼ(Xᵢ))² - n⁻¹ ∑ᵢ φⱼ(Xᵢ)²)`, which converges by the
multivariate central limit theorem and the weak law; the variance identity of the Hoeffding
decomposition gives `E(n Uₙ(h - h_N))² = (2n/(n - 1)) ∑_{j ≥ N} λⱼ² ≤ 4 ∑_{j ≥ N} λⱼ²` for
`n ≥ 2`, uniformly in `n`.

*Needs:* 1.2, 6.1, 6.2; Mathlib spectral theorem; Foundations 2.4, 4.2, 8.5.

**Checks.**

- `h(x, y) = xy` under `N(0, 1)`: one eigenvalue `1` with eigenfunction `x`, and
  `n Uₙ = ((∑ xᵢ)² - ∑ xᵢ²)/(n - 1) → Z² - 1`.
- Variance formula with `m = 2`, `h(x, y) = (x - y)²/2` under `N(0, 1)`: `h₁(x) = (x² - 1)/2` with
  `E h₁² = 1/2`, `h₂(x, y) = -xy` with `E h₂² = 1`, giving
  `Var Uₙ = 4 · (1/2)/n + 1/(n(n-1)/2) = 2/(n - 1)`, the variance of the sample variance of a
  standard normal sample.
- `hoeffdingProjection` with `S = ∅` is the constant `θ = ∫ h dPᵐ`.
- `hoeffdingProjection` with `S = Fin m` is `h(y)`, since `P` is a probability measure.
- `hoeffdingProjection` integrates out exactly the coordinates outside `S`: for the Rademacher law,
  `h(y) = y₀² + y₁` and `S = {0}`, its value at `(2, 3)` is `4`, while `h(2, 3) = 7` and
  `∫ h dP² = 1`.
- `hoeffdingKernel` with `m = 1`: `h_∅ = θ` and `h_{{0}} = h - θ`; with `m = 2` and
  `h(x, y) = (x - y)²/2` under `N(0, 1)`, `h_{{0}}(y) = (y₀² - 1)/2` and `h_{{0,1}}(y) = -y₀ y₁`, the
  kernels of the variance Check above.
- `hoeffdingKernel`: for the product kernel `h(y) = y₀ y₁` under a centred `P`, `h_{{0}} = 0` and
  `h_{{0,1}} = h`, so the decomposition has the single degenerate term.
- The decomposition needs `n ≥ m`: for `n = 1`, `m = 2` and `h ≡ 1`, `Uₙ = 0` (no injections) and
  `θ = 1`, while every `h_S` with `S` nonempty vanishes, so the identity would read `-1 = 0`.
- The tail bound has the factor `2n/(n - 1)`: for `h(x, y) = xy` under `N(0, 1)`, `N = 0` and
  `n = 2`, `n Uₙ = 2 X₁ X₂` has second moment `4 = (2 · 2/1) · 1`, above `2 ∑ λⱼ² = 2`.
- Finite-dimensional `L²(P)`: for `P = (δ₋₁ + δ₁)/2` and `h(x, y) = xy`, `L²(P)` has dimension `2`
  and `h` has the single nonzero eigenvalue `1` with `φ₀(x) = x`; padding `λⱼ = 0`, `φⱼ = 0` for
  `j ≥ 1` meets the hypotheses, and `n Uₙ → Z² - 1`.

### 6.4 L-statistics and the trimmed mean

- `lStatistic φ x = n⁻¹ ∑ᵢ φ(i/(n + 1)) X_(i)`, with `X_(i)` the `i`-th order statistic from
  `Tuple.sort`.
- **Asymptotic normality** (`tendstoInDistribution_lStatistic`): if `E X² < ∞`, `φ` is bounded on
  `(0, 1)` and continuous at `F(y)` for Lebesgue-almost every `y`, then
  `√n (Lₙ - E Lₙ) → N(0, σ²(φ, F))` with
  `σ²(φ, F) = ∬ φ(F(x)) φ(F(y)) (F(x ∧ y) - F(x)F(y)) dx dy` (van der Vaart, Thm 22.3, p. 318).
- `trimmedMean α x`, the average of the order statistics `X_(i)` with `⌊αn⌋ < i ≤ n - ⌊αn⌋`.
- **The trimmed mean** (`tendstoInDistribution_trimmedMean`): for `0 < α < 1/2`, `Tₙ = trimmedMean α`
  satisfies, without moment conditions, when `{x | F(x) ∈ {α, 1 - α}}` is
  Lebesgue-null,
  `√n (Tₙ - μ_α) → N(0, (1 - 2α)^{-2} ∫_a^b ∫_a^b (F(x ∧ y) - F(x)F(y)) dx dy)` with
  `a = F^{-1}(α)`, `b = F^{-1}(1 - α)` and `μ_α = (1 - 2α)⁻¹ ∫_α^{1-α} F^{-1}(u) du` (van der Vaart,
  Ex 22.11, p. 323). For `F` symmetric about `0` the variance is
  `(1 - 2α)^{-2} (∫_{-b}^{b} x² dF + 2α b²)`.

*Proof route.* Van der Vaart's proof: write `Lₙ` as `∫ x φ(Fₙ(x)) dFₙ(x)` up to a remainder from
replacing `i/(n + 1)` by `Fₙ`, and its Hájek projection (6.1) as `-∫ (Fₙ - F)(x) φ(F(x)) dx` plus a
negligible term; the variance of the projection converges to `σ²(φ, F)` by dominated convergence
and the continuity hypothesis. The trimmed mean is the functional delta method (4.2) for the
Hadamard differentiable map `F ↦ ∫_α^{1-α} F^{-1}(u) du` (the quantile process of 4.1 integrated
over `u`) with the classical Donsker theorem (3.4).

*Needs:* 3.4, 4.1, 4.2, 6.1; Mathlib `Tuple.sort`.

**Checks.**

- `φ ≡ 1`: `Lₙ` is the sample mean and `σ²(1, F) = ∬ (F(x ∧ y) - F(x)F(y)) dx dy = Var X`
  (Hoeffding's covariance identity).
- Trimmed mean of `N(0, 1)` at `α = 0.1`: `b = 1.2816`, and both the double integral and the
  symmetric formula give variance `1.0604`, against `1` for the mean and `π/2` for the median.
- `lStatistic` at `n = 1` is `φ(1/2) x₀`; for `φ(u) = 1{u > 1/2}` and `n = 3` it is `x_(3)/3`, a
  function of the largest observation only, which distinguishes it from any symmetric weighting.
- `trimmedMean`: for `n = 3` and `α = 1/3`, `⌊αn⌋ = 1` and the statistic is the median `x_(2)`;
  for `n = 3` and `α = 0.1`, `⌊αn⌋ = 0` and it is the sample mean.
- `trimmedMean`: for `n = 10`, `α = 0.25` and the sample `(1, 2, …, 9, 100)`, `⌊αn⌋ = 2` and the
  statistic is the mean of `3, …, 8`, which is `5.5`, unaffected by the outlier.
- Trimmed mean of the uniform law on `[0, 1]` at `α = 1/4`: `a = 1/4`, `b = 3/4`, `μ_α = 1/2`, and
  both the double integral and the symmetric formula give variance `4 · (1/24) = 1/6`, against
  `1/12` for the mean.

### Examples

- The Gini mean difference `U` with `h(x, y) = |x - y|` under `N(0, 1)`: `θ = 2/√π`, an
  instance of 6.2.

### Dependencies

Layers 1–4 and Foundations 2.4, 4.2, 8.5.

## Layer 7: contiguity, local asymptotic normality and the limits of experiments

Throughout, `Pₙ`, `Qₙ` are probability measures on `Ωₙ`, and a sequence of experiments with local
parameter `h ∈ EuclideanSpace ℝ (Fin k)` is `Q : ∀ n, 𝔼ₖ → Measure (Ω n)`.

### 7.1 Le Cam's first lemma

- `likelihoodRatioLaw P Q`, the law of `dQ/dP` under `P`, a probability measure on `ℝ`.
- **Le Cam's first lemma** (`isContiguous_iff_forall_mapClusterPt_integral_eq_one`): `Qₙ` is
  contiguous to `Pₙ` iff every cluster point `V` of the laws of `dQₙ/dPₙ` under `Pₙ` has mean
  `1` (van der Vaart, Lemma 6.4, (i) ⇔ (iii), p. 88). Foundations 8.6 owns the definition and the
  sufficient uniform-integrability criterion; this target adds the characterization.
- **Lognormal limits**: if `dQₙ/dPₙ → e^Y` in law under `Pₙ` with `Y ~ N(-σ²/2, σ²)`, then
  `Qₙ` is contiguous to `Pₙ`, since `E e^Y = 1`.
- **Mutual contiguity under local asymptotic normality**: if `IsLocallyAsymptoticallyNormal Q I Δ`,
  then `Qₙ,ₕ` and `Qₙ,₀` are mutually contiguous for every `h`.

*Proof route.* The laws of `dQₙ/dPₙ` have mean at most `1`, so they are tight and every
subsequence has a convergent subsequence (Mathlib `isCompact_closure_of_isTightMeasureSet`).
For the forward direction, contiguity makes the mass of `Qₙ` singular to `Pₙ` and the mass where
`dQₙ/dPₙ > M` small, uniformly, which gives `∫ v dV ≥ 1` by the portmanteau with truncation, and
`≤ 1` by Fatou. For the converse, if `Pₙ(Aₙ) → 0` but `Qₙ(Aₙ) ≥ ε` along a subsequence, pass to a
further subsequence on which the laws converge; then
`Qₙ(Aₙ) ≤ ∫_{Aₙ} (dQₙ/dPₙ ∧ M) dPₙ + ∫ (dQₙ/dPₙ - M)⁺ dPₙ + Qₙ^⊥(Ωₙ)`, and mean `1` of the
limit makes the last two small for large `M`. Mutual contiguity: by the multiplicative LAN and
Slutsky (1.1), `dQₙ,ₕ/dQₙ,₀ → exp(⟪h, Z⟫ - hᵀIh/2)` with `Z ~ N(0, I)`, which is lognormal with mean `1`; the reverse direction uses the positivity of
the limit (van der Vaart, Lemma 6.4 (ii)).

*Needs:* 1.1; Foundations 8.6; Mathlib `Measure.rnDeriv`, `ProbabilityMeasure`, `MapClusterPt`.

**Checks.**

- `Pₙ = N(0, 1)^{⊗n}`, `Qₙ = N(1/√n, 1)^{⊗n}`: `log(dQₙ/dPₙ) = n^{-1/2} ∑ xᵢ - 1/2`, exactly
  `N(-1/2, 1)` under `Pₙ`, so the lemma gives contiguity.
- `Pₙ = N(0, 1)^{⊗n}`, `Qₙ = N(1, 1)^{⊗n}`: `log(dQₙ/dPₙ) ~ N(-n/2, n)`, the laws of the ratio
  converge to `δ₀`, of mean `0 ≠ 1`, and indeed `Aₙ = {x̄ > 1/2}` has `Pₙ(Aₙ) → 0`,
  `Qₙ(Aₙ) → 1`.
- `likelihoodRatioLaw P P = δ₁`; for `Q` singular to `P`, `dQ/dP = 0` `P`-a.e. and the law is
  `δ₀`, of mean `0`: the law records only the absolutely continuous part of `Q`.
- `likelihoodRatioLaw P Q` for `P = N(0, 1)`, `Q = N(μ, 1)` is the lognormal law of `e^Y` with
  `Y ~ N(-μ²/2, μ²)`, of mean `1`.

### 7.2 Le Cam's third lemma

- **The general form** (`tendstoInDistribution_leCam_third`): if `Qₙ` is contiguous to `Pₙ`
  and `(Xₙ, dQₙ/dPₙ) → J` in law under `Pₙ`, for `Xₙ` with values in a second-countable metric
  space, then `B ↦ ∫ 1_B(x) v dJ(x, v)` is a probability law and `Xₙ` converges to it in law
  under `Qₙ` (van der Vaart, Thm 6.6, p. 90; van der Vaart–Wellner, Thm 3.11.7, p. 552).
- **The Gaussian form** (`tendstoInDistribution_leCam_third_gaussian`): if under `Pₙ`,
  `(Sₙ, dQₙ/dPₙ) → (S, e^Λ)` in law with `(S, Λ)` jointly Gaussian, `Λ ~ N(-σ²/2, σ²)` and
  `τ = Cov(S, Λ)`, then `Sₙ → S + τ` in law under `Qₙ` (van der Vaart, Ex 6.7, p. 90).
- In a locally asymptotically normal sequence, the central sequence `Δₙ` converges to
  `N(I h, I)` under `Qₙ,ₕ`.

*Proof route.* The general form: for bounded continuous `f` and `M > 0`,
`∫ f(Xₙ) dQₙ = ∫ f(Xₙ) (dQₙ/dPₙ) dPₙ + ∫ f dQₙ^⊥`; the singular part vanishes by contiguity and
7.1, and the first term converges to `∫ f(x) v dJ` by truncating `v` at `M` and the uniform
integrability that 7.1 gives. The Gaussian form identifies `∫ 1_B(s) e^λ dN(s, λ)` with the law of
`S + τ` by completing the square in the characteristic function (Mathlib
`charFun_multivariateGaussian`).

*Needs:* 7.1; Mathlib `HasGaussianLaw`, `charFun_multivariateGaussian`.

**Checks.**

- Gaussian shift of 7.1: `Sₙ = n^{-1/2} ∑ xᵢ` and `Λₙ = Sₙ - 1/2` are jointly `N` with
  `Cov(S, Λ) = 1`, so under `Qₙ` the limit is `N(1, 1)`, which is exact: under `N(1/√n, 1)^{⊗n}`,
  `Sₙ ~ N(1, 1)`.
- Contiguity is needed: for `Qₙ = N(1, 1)^{⊗n}`, `Sₙ = x̄` tends to `0` under `Pₙ` and to `1` under
  `Qₙ`, while the joint limit under `Pₙ` is `(0, 0)` and the formula would give `δ₀` with
  total mass `0`.

### 7.3 Differentiability in quadratic mean and local asymptotic normality

- `HasQMDWithinAt ν p s θ ℓ̇`, for densities `p_η` with respect to `ν` and a set `s` of
  parameters: `ℓ̇ ∈ L²(P_θ)` and
  `∫ (√p_η - √p_θ - ½ ⟪η - θ, ℓ̇⟫ √p_θ)² dν = o(‖η - θ‖²)` as `η → θ` within `s`. The case
  `s = univ` is the differentiability in quadratic mean of van der Vaart, (7.1), p. 93; a set `s`
  serves models on closed parameter sets and the one-sided paths of semiparametric models.
- `fisherInformation P ℓ̇ = E ℓ̇ ℓ̇ᵀ`, the information matrix of Foundations 4.3, positive
  semidefinite when `ℓ̇ ∈ L²(P)`.
- **Local asymptotic normality of smooth models**
  (`tendstoInProbability_likelihoodRatio_of_hasQMDWithinAt`): if the model is differentiable in
  quadratic mean at `θ` within `s`, then for every convergent `hₙ → h` with `θ + hₙ/√n ∈ s`,
  `dP^n_{θ + hₙ/√n}/dP^n_θ · exp(-⟪h, Δₙ⟫ + hᵀIh/2) → 1` in `P^n_θ`-probability, with
  `Δₙ = n^{-1/2} ∑ᵢ ℓ̇(xᵢ)` and `I` the Fisher information; moreover `P_θ ℓ̇ = 0` when `θ` is an
  interior point of `s` (van der Vaart, Thm 7.2, p. 94).
- `IsLocallyAsymptoticallyNormal Q I Δ`: `I` positive definite, `Δₙ` measurable, `Δₙ → N(0, I)`
  under `Qₙ,₀`, and the multiplicative expansion at every fixed `h` (Conventions). For an i.i.d.
  model differentiable in quadratic mean at an interior `θ` with nonsingular information, the
  local experiments `Qₙ,ₕ = P^n_{θ + h/√n}` satisfy it, by the theorem above and 1.2.
- **The additive form**: under `IsLocallyAsymptoticallyNormal`, `dQₙ,ₕ/dQₙ,₀ > 0` with
  `Qₙ,₀`-probability tending to one, and
  `log(dQₙ,ₕ/dQₙ,₀) - ⟪h, Δₙ⟫ + hᵀIh/2 → 0` in probability.
- **Sufficient conditions**: if `θ ↦ √p_θ(x)` is continuously differentiable for every `x` on an
  open set and the information `∫ (ṗ_θ/p_θ)(ṗ_θ/p_θ)ᵀ p_θ dν` is well defined and continuous, the
  model is differentiable in quadratic mean with score `ṗ_θ/p_θ` (van der Vaart, Lemma 7.6,
  p. 95). In particular a location family `f(x - θ)` with `f` positive and continuously
  differentiable and finite Fisher information `∫ f'²/f` is differentiable in quadratic mean
  with score `-(f'/f)(x - θ)` (van der Vaart, Ex 7.8, p. 96).
- **Maximum likelihood under differentiability in quadratic mean**
  (`mle_asymptotically_linear_of_hasQMDWithinAt`): if the model is differentiable in quadratic
  mean at `θ₀` with nonsingular information `I`, the log-likelihood satisfies
  `|log p_{θ₁}(x) - log p_{θ₂}(x)| ≤ L(x) ‖θ₁ - θ₂‖` on a ball around `θ₀` for `P_{θ₀}`-almost
  every `x` with `L ∈ L²(P_{θ₀})` (the densities being positive there), and `θ̂ₙ` is a consistent
  maximizer up to `o_P(n⁻¹)`, then `√n(θ̂ₙ - θ₀) = I⁻¹ n^{-1/2} ∑ᵢ ℓ̇(xᵢ) + o_P(1)`, hence
  `→ N(0, I⁻¹)` (van der Vaart, Thm 5.39, p. 65). The proof applies the M-estimator theorem of
  5.5 with `m_θ = log p_θ` and `V = -I`, the second-order expansion of `θ ↦ P_{θ₀} log p_θ` coming
  from quadratic-mean differentiability.
- **The Kullback–Leibler expansion** (`isLittleO_klDiv_sub_quadForm`): if, in addition, the densities `p_{θ+h}` for `h` near `0`
  are positive on a common set and vanish off it, and `h ↦ p_{θ+h}(x)` and
  `h ↦ p_{θ+h}(x) log(p_{θ+h}(x)/p_θ(x))` are twice continuously differentiable with first and
  second derivatives dominated near `0` by a `ν`-integrable function, then
  `KL(P_{θ+h} ‖ P_θ) = ½ hᵀ I h + o(‖h‖²)` (Mathlib `klDiv`).

*Proof route.* Van der Vaart's proof of Thm 7.2: write `Wₙᵢ = 2(√(p_{θ+hₙ/√n}/p_θ)(xᵢ) - 1)`; by
quadratic-mean differentiability `∑ᵢ Wₙᵢ = ⟪h, Δₙ⟫ - ¼ hᵀIh + o_P(1)` (the variance of the
remainder is `n · o(1/n)` and the mean is computed from the Hellinger distance) and
`∑ᵢ Wₙᵢ² → hᵀIh` by the weak law with a Lindeberg-type truncation; then
`log ∏(1 + Wₙᵢ/2)² = ∑ Wₙᵢ - ¼ ∑ Wₙᵢ² + o_P(1)`, from `max |Wₙᵢ| → 0` in probability. The
multiplicative form follows by exponentiating on the event where the product is positive, whose
probability tends to one. Lemma 7.6 is Vitali's convergence theorem for the difference quotients
of `√p_θ`. The Kullback–Leibler expansion is Taylor's formula under the integral
(`hasDerivAt_integral_of_dominated_loc_of_deriv_le`) with `∫ ṗ = 0` and `∫ p̈ = 0`.

*Needs:* 1.1, 1.2, 5.5; Foundations 4.3, 8.5; Mathlib `Measure.withDensity`, `klDiv`, Vitali's
theorem.

**Checks.**

- `N(θ, 1)`: `ℓ̇(x) = x - θ`, `I = 1`, and the log-likelihood ratio is exactly
  `h Δₙ - h²/2` with `Δₙ ~ N(0, 1)`; `KL(N(θ + h, 1) ‖ N(θ, 1)) = h²/2` exactly.
- The uniform family on `[0, θ]` is not differentiable in quadratic mean: the squared Hellinger
  integral `∫ (√p_{θ+h} - √p_θ)²` is `2(1 - (1 + h/θ)^{-1/2})`, of order `h`, not `o(h²)` along any
  candidate score.
- Laplace location `e^{-|x - θ|}/2`: not continuously differentiable at `x = θ`, but
  differentiable in quadratic mean with score `sign(x - θ)` and `I = 1` (van der Vaart, Ex 7.8,
  p. 96), so the sufficient condition is not necessary.
- `fisherInformation`: the exponential model `θ e^{-θx}` has score `1/θ - x` and `I(θ) = 1/θ²`;
  the score `s = (1, x)` under `N(0, 1)` gives the identity matrix.
- `fisherInformation` needs `ℓ̇ ∈ L²`: for the density `2 (1 + x)⁻³` on `x ≥ 0` and `s = (1, x)`,
  the junk value of the nonintegrable `x²` gives `[[1, 1], [1, 0]]`, which is not positive
  semidefinite (the example of Foundations 4.3).
- `IsLocallyAsymptoticallyNormal`: the Gaussian shift `Qₙ,ₕ = N(h/√n, 1)^{⊗n}` satisfies it with
  `I = 1` and `Δₙ = n^{-1/2} ∑ xᵢ`, exactly.
- `IsLocallyAsymptoticallyNormal` requires `I` positive definite: the constant experiment
  `Qₙ,ₕ = Qₙ,₀` has ratio `1` and satisfies the expansion with `I = 0`, `Δₙ = 0`, and is excluded.
- `IsLocallyAsymptoticallyNormal` fails for the uniform family on `[0, θ]` at rate `√n`: for
  `h > 0` the ratio `dP^n_{θ+h/√n}/dP^n_θ = (1 + h/(θ√n))^{-n}` tends to `0` on the event where it
  is positive, so no Gaussian expansion holds.

### 7.4 The asymptotic representation theorem

- **Representation** (`exists_kernel_of_isLocallyAsymptoticallyNormal`): in a locally
  asymptotically normal sequence (fixed-`h` form) with information `I`, let `Tₙ` be measurable
  statistics with values in a Polish space that converge in law under `Qₙ,ₕ` to `L_h` for every
  fixed `h`. Then there is a Markov kernel `K` with `L_h = K ∘ₘ N(h, I⁻¹)` for every `h` (van der
  Vaart, Thm 7.10, p. 98).
- **Randomized statistics**: with Tau Ceti's `unitIntervalCoding`, the kernel is a measurable
  `T(x, u)` with `u` uniform on `[0, 1]` and `T(X, U) ~ L_h` for `X ~ N(h, I⁻¹)`.
- **Estimators**: for `√n(Tₙ - ψ(θ + h/√n)) → L_{θ,h}` under every `h`, with `ψ` differentiable at
  `θ`, there is such a `T` with `T - ψ̇h ~ L_{θ,h}` for every `h`.

*Proof route.* Van der Vaart's proof: for fixed `h`, `(Tₙ, Δₙ)` is tight under `Qₙ,₀` and has a
convergent subsequence with limit `(S, Δ)`, `Δ ~ N(0, I)`; by Le Cam's third lemma (7.2) the law of
`S` under `h` is `B ↦ E 1_B(S) exp(⟪h, Δ⟫ - hᵀIh/2)`. The kernel is the conditional law of `S`
given `I⁻¹Δ` (disintegration in a Polish space), and the exponential tilt of `N(0, I⁻¹)` by
`exp(⟪h, I x⟫ - hᵀIh/2)` is `N(h, I⁻¹)`. A diagonal argument over a countable dense set of `h` is
not needed, since each `h` uses only the joint limit under `Qₙ,₀`, which is fixed once.

*Needs:* 7.1, 7.2; Mathlib `condDistrib`, `StandardBorelSpace`; Tau Ceti `unitIntervalCoding`.

**Checks.**

- `Tₙ = Δₙ`: the limit under `h` is `N(Ih, I)`, represented by `K(x) = δ_{Ix}`.
- `Tₙ` independent of the data, with fixed law `M`: `K(x) = M` for every `x`.

### 7.5 Anderson's lemma and the convolution theorem

- A loss `ℓ : EuclideanSpace ℝ (Fin m) → ℝ≥0∞` is **bowl-shaped** when its sublevel sets are
  convex and symmetric about `0`.
- **Anderson's lemma** (`lintegral_multivariateGaussian_le_conv`): for a measurable bowl-shaped
  `ℓ`, a positive semidefinite `S` and every probability measure `M`,
  `∫ ℓ dN(0, S) ≤ ∫ ℓ d(N(0, S) ∗ M)` (van der Vaart, Lemma 8.5, p. 113).
- **Equivariant estimators in the Gaussian shift** (`exists_conv_of_equivariantInLaw`): if a
  randomized estimator `K` of `A h` in the experiment `(N(h, I⁻¹) : h)` is equivariant in law,
  that is, the law of `T - Ah` under `h` is a fixed `L`, then `L = N(0, A I⁻¹ Aᵀ) ∗ M` for a
  probability `M`; `M` is degenerate at `0` only for `T = AX` (van der Vaart, Prop 8.4, p. 113).
- **Minimax in the Gaussian shift** (`lintegral_multivariateGaussian_le_iSup_risk`): for a
  measurable bowl-shaped `ℓ`, every randomized estimator `K` of `A h` has
  `sup_h E_h ℓ(T - Ah) ≥ E_0 ℓ(AX) = ∫ ℓ dN(0, A I⁻¹ Aᵀ)`, so `AX` is minimax (van der Vaart,
  Prop 8.6, p. 113).
- **The convolution theorem** (`exists_conv_of_isRegular`): in a locally asymptotically normal
  sequence (fixed-`h` form) with information `I`, if `Zₙ - Ah → L` in law under `Qₙ,ₕ` for every
  `h`, the regularity of an estimator sequence of `A h`, then `L = N(0, A I⁻¹ Aᵀ) ∗ M` for a
  probability measure `M` (van der Vaart, Thm 8.8, p. 115). If `L` has finite covariance, it
  dominates `A I⁻¹ Aᵀ` in the Loewner order.
- **Efficient estimators are regular**: if `Zₙ = A I⁻¹ Δₙ + o_P(1)` under `Qₙ,₀`, then `Zₙ - Ah` has
  limit `N(0, A I⁻¹ Aᵀ)` under every `Qₙ,ₕ`, by Le Cam's third lemma (7.2). In an i.i.d. model,
  `Zₙ = √n(Tₙ - ψ(θ))` with `ψ` differentiable and `A = ψ̇`; by 5.3, a consistent root of the
  likelihood equation is such an estimator of `θ`.

*Proof route.* Anderson's lemma: for `ℓ = 1_{Cᶜ}` with `C` convex symmetric, the function
`y ↦ N(0, S)(C + y)` is maximized at `y = 0`, by the Brunn–Minkowski inequality in its
Prékopa–Leindler form for the log-concave Gaussian density (`N(0, S)(C + y)` is log-concave and
even in `y`); integrate over `M`, and pass to general `ℓ` by the layer-cake formula
`ℓ = ∫₀^∞ 1{ℓ > t} dt`. For degenerate `S`, work on the range of `S`. Prop 8.4: average the
equivariance identity over a prior `N(0, Λ)` on `h` with `Λ → ∞`; the posterior of `h` is Gaussian
and the law of `T - Ah` factors as the posterior spread convolved with the law of the Bayes
residual; take a weak limit with Prokhorov. Prop 8.6 combines Prop 8.4 with Anderson's lemma
after the same averaging. The convolution theorem is the representation theorem (7.4) applied to
`Zₙ`, which turns regularity into equivariance in law, followed by Prop 8.4.

*Needs:* 7.2, 7.4; Mathlib `multivariateGaussian`, `Measure.conv`, `Convex`, Prokhorov.

**Checks.**

- Anderson with `S = 1`, `ℓ = 1{|x| > 1}` and `M = δ₁`: `P(|Z + 1| > 1) = Φ(-2) + 1/2 ≈ 0.523`, at
  least `P(|Z| > 1) ≈ 0.317`.
- Anderson fails without symmetry: `ℓ = 1{x < 0}` (convex sublevel sets, not symmetric) has
  `∫ ℓ dN(0, 1) = 1/2 > ∫ ℓ d(N(0, 1) ∗ δ₁) = Φ(-1) ≈ 0.159`.
- Convolution in the Gaussian shift of 7.1 with `Zₙ = √n x̄ₙ + Wₙ`, `Wₙ` independent noise of law
  `M`: the limit is `N(0, 1) ∗ M`, exactly of the stated form.

### 7.6 The local asymptotic minimax theorem

- **Local asymptotic minimax** (`lintegral_multivariateGaussian_le_localMinimax`): in a locally
  asymptotically normal sequence (fixed-`h` form), for a lower semicontinuous bowl-shaped `ℓ`,
  local targets `cₙ(h) → Ah` and every measurable estimator sequence `Zₙ`, with no tightness
  hypothesis,
  `sup_{H finite} liminf_n max_{h ∈ H} E_{Qₙ,ₕ} ℓ(Zₙ - cₙ(h)) ≥ ∫ ℓ dN(0, A I⁻¹ Aᵀ)` (van der
  Vaart, Thm 8.11, p. 118; by the same argument as van der Vaart–Wellner, Thm 3.12.5, p. 563,
  with proof on pp. 563–565, whose subconvex losses are the lower semicontinuous bowl-shaped
  ones, and Ex 3.12.6, p. 565, for Borel estimators in a separable Banach space).
- **Attainment**: for an i.i.d. model differentiable in quadratic mean and an estimator with
  `√n(Tₙ - θ) = I⁻¹Δₙ + o_P(1)`, equality holds for every bounded continuous bowl-shaped `ℓ`.

*Proof route.* Van der Vaart–Wellner's proof of Thm 3.12.5, which needs no tightness of `Zₙ`.
(a) First let `ℓ(y) = ∑_{i ≤ r} 1_{Kᵢᶜ}(Bᵢ y)` for linear maps `Bᵢ : ℝ^m → ℝ^{pᵢ}` and compact,
convex, symmetric `Kᵢ ⊆ ℝ^{pᵢ}`. Regard `Bᵢ(Zₙ - cₙ(h))` as a map into the one-point
compactification of `ℝ^{pᵢ}`, which is compact metrizable, so every sequence of laws there is
tight. Along a subsequence realizing the `liminf` over an increasing sequence of finite sets of
local parameters, Prokhorov's theorem and Le Cam's third lemma (7.2) give limits at every `h`,
and the representation of 7.4 on the compactification identifies them, averaged over
`h ~ N(0, λ⁻¹ I)`, as the laws of `Gλ + Wλ` with `Gλ` Gaussian and `Wλ` independent of it. The
portmanteau on the open sets `Kᵢᶜ` bounds the minimax risk below by `∑ᵢ P(Gλᵢ + Wλᵢ ∉ Kᵢ)`, at
least `∑ᵢ P(Gλᵢ ∉ Kᵢ)` by Anderson's lemma (7.5); let `λ ↓ 0`. The point at infinity lies outside
every `Kᵢ`, so mass escaping to infinity only increases the risk. (b) A general lower
semicontinuous bowl-shaped `ℓ` is the increasing limit of
`ℓ_r = 2^{-r} ∑_{i ≤ 2^{2r}} 1{ℓ > i 2^{-r}}`, and each sublevel set `{ℓ ≤ c}` is closed, convex
and symmetric, hence the countable intersection of slabs `{|⟪bⱼ, y⟫| ≤ cⱼ}`, so `1{ℓ > c}` is the
increasing limit of losses of the form (a) with boxes `Kᵢ`. Each such loss is below `ℓ`, so the
bound of (a) holds for it, and monotone convergence under `N(0, A I⁻¹ Aᵀ)` gives the bound for
`ℓ`. Attainment is 7.5 (efficient estimators are regular) with the portmanteau.

*Needs:* 2.2, 7.2, 7.4, 7.5; Mathlib Prokhorov's theorem and `OnePoint`; Foundations 8.2.

**Checks.**

- Gaussian shift `N(θ, 1)` with `Tₙ = x̄ₙ` and squared error truncated at `1`: every local risk
  equals `E min(Z², 1)` for `Z ~ N(0, 1)`, which is the bound.
- No tightness is assumed: in the scalar Gaussian shift the estimator `Zₙ ≡ n` is measurable and
  not bounded in probability; its local risks under squared error diverge, and the theorem
  applies to it.
- The constant estimator `Tₙ = θ₀` has local risk `ℓ(-h)` at `h`, and the supremum over finite `H`
  is `sup ℓ`, which exceeds the bound for a nonconstant loss.

### 7.7 Superefficiency

- **Hodges' estimator**: for `N(θ, 1)`, `θ̂ₙ = x̄ₙ` when `|x̄ₙ| ≥ n^{-1/4}` and `0` otherwise, the
  limit of `√n(θ̂ₙ - θ)` is `N(0, 1)` for `θ ≠ 0` and `δ₀` at `θ = 0`; under `θₙ = h/√n`,
  `√n(θ̂ₙ - θₙ) → -h` in probability, so the estimator is not regular at `0` (van der Vaart, Ex 8.1,
  p. 109).
- **Superefficiency is confined to a null set**
  (`ae_posSemidef_covMatrix_sub_inv_fisherInformation`): if the model is differentiable in
  quadratic mean with nonsingular information at every point of an open `U`, the densities are
  jointly measurable, and `√n(Tₙ - θ) → L_θ` in law with `L_θ` square-integrable for every
  `θ ∈ U`, then `Cov L_θ - I(θ)⁻¹` is positive semidefinite for Lebesgue-almost every `θ ∈ U`
  (van der Vaart, Thm 8.9, p. 116).

*Proof route.* Hodges: at `θ = 0`, `P(|x̄ₙ| < n^{-1/4}) = P(|Z| < n^{1/4}) → 1`; at `θ ≠ 0` the
probability of truncation tends to `0`; under `h/√n`, `√n x̄ₙ ~ N(h, 1)` is truncated with
probability tending to one. Thm 8.9: the Bayes argument of van der Vaart with a prior density on a
small ball, Fubini over `θ` (joint measurability), and the Lebesgue differentiation theorem show
that the estimator is regular, along a subsequence, at almost every `θ`; then the convolution
theorem (7.5).

*Needs:* 7.3, 7.5; Mathlib Lebesgue differentiation (`Besicovitch` or `VitaliFamily`).

**Checks.**

- Hodges' estimator at `θ = 0`: limit variance `0 < 1 = I(0)⁻¹`, on the null set `{0}`.
- Its maximal local risk under squared error truncated at `1` is `min(h², 1) → 1` at the point
  `h` for large `h`, above the bound `E min(Z², 1) = 1 - 2φ(1) ≈ 0.5161` of 7.6, with `φ` the
  standard normal density.

### Examples

- Pitman's location experiment `f(x - θ)` with `f` of finite Fisher information `I_f`: by 7.3 it
  is locally asymptotically normal, and by 7.6 no estimator has local asymptotic squared-error
  risk below `1/I_f`. The efficient one-step estimator of 5.4 attains the Gaussian limit law
  `N(0, 1/I_f)`; its squared-error risk converges to `1/I_f` when the scaled squared errors are
  uniformly integrable, and its local supremum risk does when they are uniformly integrable
  uniformly over the local alternatives. Convergence in law alone does not suffice: in the normal
  location model, an ancillary event of probability `1/n` on which the one-step output is moved by
  `n` keeps the limit law `N(0, 1)` but has scaled risk `1 + n²`.

### Dependencies

Layers 1–2 (the portmanteau and Prohorov's theorem in 7.6), Layer 5 for the maximum likelihood
theorem of 7.3 (through 5.5), Foundations 4.3, 8.2, 8.5 and 8.6, Mathlib's disintegration and
Gaussian measures, and Tau Ceti's `unitIntervalCoding`.

## Layer 8: asymptotic tests and efficiency

`quadForm I v = vᵀ I v`. A test is a measurable `φₙ` with values in `[0, 1]` (Foundations 1.3), with
power `πₙ(θ) = E_θ φₙ`.

### 8.1 Likelihood ratio, Wald and score tests

- **The simple hypothesis** (`tendstoInDistribution_likelihoodRatio_wald_score`): for `θ = θ₀`, in a
  model with positive densities, differentiable in quadratic mean at `θ₀` with positive definite
  information `I` and a log-likelihood that is Lipschitz on a common ball around `θ₀` with a
  square-integrable constant, and a measurable maximum likelihood estimator `θ̂ₙ` consistent under `P_{θ₀}`, the
  statistics `λₙ = 2(ℓₙ(θ̂ₙ) - ℓₙ(θ₀))`, `Wₙ = n (θ̂ₙ - θ₀)ᵀ I (θ̂ₙ - θ₀)` and
  `Sₙ = n⁻¹ (∑ᵢ ℓ̇(xᵢ))ᵀ I⁻¹ (∑ᵢ ℓ̇(xᵢ))` differ by `o_P(1)` under `P_{θ₀}` (van der Vaart, §16.3,
  p. 231; Lehmann, Thm 7.7.3, p. 535, under the classical conditions), and under
  `P_{θ₀ + h/√n}` the statistic `λₙ` converges to the noncentral chi-squared law with `k` degrees
  of freedom and noncentrality `hᵀ I h` (by Le Cam's third lemma, 7.2, applied to
  `Δₙ = n^{-1/2} ∑ᵢ ℓ̇(xᵢ)`, whose limit under the alternative is `N(I h, I)`).
- **The three classical tests for a composite hypothesis**
  (`tendstoInDistribution_likelihoodRatio_wald_score_composite`): let `Θ ⊆ ℝ^k` be open, `Θ₀ = {c = 0}` for a continuously
  differentiable `c : Θ → ℝ^q` with `C = Dc(θ₀)` of rank `q`, and let the maximum likelihood
  hypotheses of 5.3 hold at `θ₀ ∈ Θ₀` with `I` continuous at `θ₀`. For consistent maximizers
  `θ̂ₙ` over `Θ` and `θ̃ₙ` over `Θ₀`, the likelihood ratio statistic
  `λₙ = 2(ℓₙ(θ̂ₙ) - ℓₙ(θ̃ₙ))`, the Wald statistic
  `Wₙ = n c(θ̂ₙ)ᵀ [Dc(θ̂ₙ) I(θ̂ₙ)⁻¹ Dc(θ̂ₙ)ᵀ]⁻¹ c(θ̂ₙ)` and the score statistic
  `Sₙ = n⁻¹ ∇ℓₙ(θ̃ₙ)ᵀ I(θ̃ₙ)⁻¹ ∇ℓₙ(θ̃ₙ)` differ by `o_P(1)` and converge to `χ²_q` under `P_{θ₀}`.
  Under `P_{θ₀ + h/√n}` the common limit is the noncentral chi-squared law with `q` degrees of
  freedom and noncentrality `(Ch)ᵀ [C I⁻¹ Cᵀ]⁻¹ (Ch)` (by the same argument as van der Vaart,
  Thm 16.7, p. 233, with Le Cam's third lemma 7.2).
- **Local parameter sets**: `Hₙ = √n(Θ - θ)` converges to `H` when `H` contains the limits of
  convergent sequences `hₙ ∈ Hₙ` and of convergent subsequences `h_{nⱼ} ∈ H_{nⱼ}`, and every point
  of `H` is such a limit.
- **The likelihood ratio on converging local sets**
  (`tendstoInDistribution_likelihoodRatio_localSets`): let the model be differentiable in
  quadratic mean at `θ ∈ Θ₀` with nonsingular information, with a log-likelihood that is
  Lipschitz on a common ball around `θ` with a square-integrable constant, maximum likelihood estimators over `Θ₀`
  and `Θ` that are consistent under every `P_{θ + h/√n}`, and local sets `Hₙ → H`,
  `Hₙ,₀ → H₀`. Then under `P_{θ + h/√n}`,
  `λₙ → inf_{g ∈ H₀} ‖I^{1/2}(X - g)‖² - inf_{g ∈ H} ‖I^{1/2}(X - g)‖²` with `X ~ N(h, I⁻¹)` (van der
  Vaart, Thm 16.7, p. 233). The infima are over the sets themselves (subtypes in Lean); both sets
  contain `0`, since `θ ∈ Θ₀ ⊆ Θ`, and the quadratic form is nonnegative, so they are genuine
  infima.
- Special cases: for an interior `θ` and `H₀` a linear subspace of dimension `l`, the null limit is
  `χ²_{k-l}`; for `Θ = [0, ∞)` and `Θ₀ = {0}`, it is `½ δ₀ + ½ χ²_1`. For polyhedral cones the
  limit is a chi-bar-squared law, whose identification belongs to
  MathematicalStatisticsNonparametric.

*Proof route.* Van der Vaart's proof: the Lipschitz condition and 3.6 give the uniform
expansion of the local log-likelihood `h ↦ ℓₙ(θ + h/√n) - ℓₙ(θ)` as `hᵀΔₙ - ½ hᵀIh + o_P(1)` on
compacts; consistency and the rate `√n` (5.6) localize the maximizers; the limit of the maximum
over `Hₙ` is the maximum over `H` by the set convergence, and continuous mapping with
`Δₙ = I X + o_P(1)` and Le Cam's third lemma under the alternative give the limit. The Wald and
score statistics are quadratic in `√n(θ̂ₙ - θ₀)` and `Δₙ` up to `o_P(1)` by 5.3; 1.3 gives the laws.

*Needs:* 1.3, 3.6, 5.3, 5.6, 7.2, 7.3.

**Checks.**

- `N(θ, 1)`, `Θ = ℝ`, `Θ₀ = {0}`: `λₙ = n x̄ₙ² = Wₙ = Sₙ` exactly, which is `χ²_1` under `θ = 0` and
  noncentral `χ²_1` with noncentrality `h²` under `h/√n`.
- `Θ = [0, ∞)`, `Θ₀ = {0}`, `I = 1`, `h = 0`: the limit is `X² - (X⁻)² = (X⁺)²` with `X ~ N(0, 1)`,
  which is `0` with probability `1/2` and `χ²_1` otherwise.
- The infima must be over the sets: with `I = 1`, `H₀ = {0}`, `H = ℝ` and `Y = 1`, the limit
  statistic is `(1 - 0)² - 0 = 1`. A bounded infimum `⨅ g ∈ H₀` over all `g : ℝ` in Lean would
  insert the junk value `0` for every `g ∉ H₀` and give `0`, turning the limit `χ²_1` into `δ₀`.
- `quadForm`: `quadForm (1) h = h²` in dimension `1`, and `quadForm I 0 = 0` for every `I`.
- `quadForm` sees only the symmetric part of `I`: for `I = [[0, 1], [0, 0]]`,
  `quadForm I v = v₀ v₁`, the same as for `[[0, 1/2], [1/2, 0]]`, and it takes the value `-1` at
  `v = (1, -1)`; the theorems that need nonnegativity assume `I` positive definite.

### 8.2 The asymptotic power envelope

- **Power envelope** (`limsup_power_le_envelope`): in a locally asymptotically normal sequence
  (fixed-`h` form) with information `I`, let `ψ` be differentiable at `0` with `ψ(0) = 0` and
  nonzero gradient `ψ̇`. For every sequence of tests with `E_{Qₙ,ₕ} φₙ ≤ α` whenever
  `ψ(h/√n) ≤ 0`, and every `h` with `⟪ψ̇, h⟫ > 0`,
  `limsup πₙ(h) ≤ 1 - Φ(z_α - ⟪ψ̇, h⟫/(ψ̇ᵀ I⁻¹ ψ̇)^{1/2})` (van der Vaart, Thm 15.4, p. 219).
- **Attainment**: the tests rejecting when `Tₙ ≥ z_α`, with
  `Tₙ = ψ̇ᵀ I⁻¹ Δₙ/(ψ̇ᵀ I⁻¹ ψ̇)^{1/2} + o_P(1)` under `Qₙ,₀`, attain the bound for every `h`; the Wald
  statistic built on an efficient estimator (7.5) is such a `Tₙ`.

*Proof route.* By the representation theorem (7.4), along a subsequence realizing the `limsup`
the power functions converge to the power function of a test in the Gaussian shift
`N(h, I⁻¹)`, which has level `α` on the half-space `{⟪ψ̇, h⟫ ≤ 0}` by the level condition and the
differentiability of `ψ`; the Neyman–Pearson lemma in the Gaussian shift (Foundations 6.2) bounds
its power by the displayed envelope. Attainment is Le Cam's third lemma (7.2).

*Needs:* 7.2, 7.4; Foundations 6.2.

**Checks.**

- Scalar `θ`, `ψ(θ) = θ`, `I = 1`, `α = 0.05`, `h = 1`: the envelope is
  `1 - Φ(1.645 - 1) ≈ 0.260`.
- At `h = 0` the bound is `1 - Φ(z_α) = α`, as it must be.

### 8.3 Local power, Pitman efficiency and the sign, Wilcoxon and `t` tests

- **Local power** (`tendsto_power_localAlternatives`): if `√n(Tₙ - μ(θₙ))/σ(θₙ) → N(0, 1)` under
  `θₙ` for every `θₙ → 0` from above, with `μ` differentiable at `0` and `σ` continuous at `0` with
  `σ(0) > 0`, the test rejecting when `√n(Tₙ - μ(0)) > σ(0) z_α` has power at `h/√n` tending to
  `1 - Φ(z_α - h μ'(0)/σ(0))` for `h ≥ 0` (van der Vaart, Thm 14.7, p. 195).
- **Pitman efficiency**: for two such sequences of tests with `μᵢ'(0) > 0` and `σᵢ(0) > 0`, in
  models with `P_{n,θ} → P_{n,0}` in total variation as `θ → 0` for each `n`, let `n_{ν,i}` be the
  least sample size at which the test based on `Tₙ,ᵢ` has level at most `α` and power at least
  `γ` at `θ_ν`. The Pitman relative efficiency `lim n_{ν,2}/n_{ν,1}` is the ratio of the
  efficacies `(μᵢ'(0)/σᵢ(0))²`, for every `0 < α < γ < 1` and every sequence of alternatives
  `θ_ν ↓ 0` (van der Vaart, Thm 14.19, pp. 201–202). The positive slopes are needed: the upper-tail
  test based on `-X̄` under `N(θ, 1)` has power below `α` at every `θ > 0` and never reaches `γ`. With nondecreasing power functions, asymptotic normality
  along `θₙ = O(n^{-1/2})` suffices.
- **The three one-sample tests**: the sign statistic `n⁻¹ #{i | xᵢ > 0}`, the Wilcoxon signed-rank
  statistic, defined as the U-statistic of order `2` with kernel `1{x₁ + x₂ > 0}` (Foundations 2.4),
  and the `t` statistic. For a density `f(x - θ)` with `f` symmetric about `0`, of finite variance
  `σ²`, continuous at `0` with `f(0) > 0` and `∫ f² < ∞`, their efficacies are `4f(0)²`,
  `12(∫ f²)²` and `1/σ²`, so `e_{S,t} = 4σ² f(0)²` and `e_{W,t} = 12σ² (∫ f²)²` (van der Vaart,
  Exs 14.9–14.10, p. 196; Lehmann, §3.4, pp. 173–177, Exs 3.4.1–3.4.3).
- **The Hodges–Lehmann bound** (`le_twelve_mul_variance_mul_sq_integral_sq`): for every
  probability density of finite variance and square-integrable,
  `12 σ² (∫ f²)² ≥ 108/125`, with equality for the scale family of `(3/4)(1 - x²)⁺` (Lehmann,
  (3.4.17), p. 176). `e_{W,t}` is unbounded above. Among symmetric unimodal `f`, `e_{S,t} ≥ 1/3`,
  with equality for the uniform law.
- **Two samples**: in the shift model `G(x) = F(x - θ)`, the Wilcoxon–Mann–Whitney test has
  efficiency `12 σ² (∫ f²)²` relative to the two-sample `t` test, with the same bound, and no
  symmetry of `f` is needed (van der Vaart, Exs 14.11–14.13, pp. 197–198).

The exact laws, rank forms and optimal scores of these tests belong to
MathematicalStatisticsNonparametric (3.2–3.3, 4.2), which defines the signed-rank statistic in its
rank form `W⁺ = ∑_{i : 0 < xᵢ} rank |xᵢ|` and consumes the efficiencies above. Without ties,
`W⁺ = #{i ≤ j | xᵢ + xⱼ > 0}`, so `W⁺/C(n, 2)` and the U-statistic used here differ by
`O(1/n)`, which does not change the efficacy.

*Proof route.* Local power: the rejection event is
`{√n(Tₙ - μ(θₙ))/σ(θₙ) > (σ(0) z_α - √n(μ(θₙ) - μ(0)))/σ(θₙ)}` and the right side tends to
`z_α - h μ'(0)/σ(0)`; the limit law is continuous. Pitman: invert the local power at the
alternatives `θ_ν` to find the sample sizes. The efficacies: the sign statistic is a binomial
mean with `μ(θ) = 1 - F(-θ)`; the Wilcoxon statistic has `μ(θ) = P(X₁ + X₂ > 0)` with
`μ'(0) = 2∫ f²` and limit variance `1/3` from 6.2; local uniform asymptotic normality from the
Lindeberg theorem (1.2) and 6.2 along `θₙ`. The Hodges–Lehmann bound: minimize `∫ f²` at fixed
variance, a convex problem whose Lagrangian solution is the Epanechnikov density
`(3/4)(1 - x²)⁺` by the pointwise inequality `f² - 2f(a - b x²) ≥ -(a - b x²)⁺²` integrated against
the constraints. The unimodal bound: for symmetric unimodal `f`, `M = f(0) = sup f`, and
`a = 1/(2M)`, the integrand `(x² - a²)(f(x) - M 1_{[-a, a]}(x))` is nonnegative everywhere, and
integrating it gives `σ² - 1/(12 M²) ≥ 0`, so `4σ² f(0)² ≥ 1/3`. For the uniform law on
`[-1/2, 1/2]` both sides are `1/12`.

*Needs:* 1.2, 6.2; Foundations 2.4, 9.2; Tau Ceti `laplaceMeasure`, `logisticMeasure`.

**Checks.**

- Normal: `e_{S,t} = 2/π ≈ 0.637`, `e_{W,t} = 3/π ≈ 0.955`.
- Laplace `e^{-|x|}/2`: `σ² = 2`, `f(0) = 1/2`, `∫ f² = 1/4`, giving `e_{S,t} = 2` and
  `e_{W,t} = 3/2`.
- Uniform on `[-1/2, 1/2]`: `σ² = 1/12`, `f(0) = 1`, `∫ f² = 1`, giving `1/3` and `1`.
- Logistic `e^{-x}/(1 + e^{-x})²`: `σ² = π²/3`, `f(0) = 1/4`, `∫ f² = 1/6`, giving `π²/12 ≈ 0.822`
  and `π²/9 ≈ 1.097`.
- Epanechnikov `(3/4)(1 - x²)` on `[-1, 1]`: `σ² = 1/5`, `∫ f² = 3/5`, and
  `12 · (1/5) · (9/25) = 108/125 = 0.864`.
- The variance factor is `∫ x² f - (∫ x f)²`, computed from two integrals: for `f = 1_{[1, 2]}`
  the mean is `3/2`, the second moment `7/3` and `∫ f² = 1`, so the right side is
  `12 · (1/12) · 1 = 1`. Integrating `x² f(x) - (3/2)²` over all of `ℝ` instead would give the
  junk value `0` of a nonintegrable Bochner integral, and the uncentred second moment would give
  `12 · (7/3) = 28`.

### 8.4 Pearson's tests and the generalized method of moments

- **Pearson's theorem** (`tendstoInDistribution_pearson`): for multinomial counts
  `N ~ Mult(n; p)` on `k` cells with all `pᵢ > 0`,
  `∑ᵢ (Nᵢ - npᵢ)²/(npᵢ) → χ²_{k-1}` (van der Vaart, Thm 17.2, p. 243).
- **Estimated parameters**: for `p = p(ϑ₀)` with `ϑ ↦ p(ϑ)` from an open set of `ℝ^d` into the open
  simplex, continuously differentiable with derivative of rank `d` at `ϑ₀`, and a consistent
  maximum likelihood estimator `ϑ̂ₙ`, the statistic with `p(ϑ̂ₙ)` converges to `χ²_{k-1-d}` (van der
  Vaart, Cor 17.5, p. 246). For an `r × c` table under independence, with fitted counts
  `N_{i+} N_{+j}/n`, the degrees of freedom are `(r - 1)(c - 1)`. The likelihood ratio statistic
  `2 ∑ N_{ij} log(N_{ij}/N̂_{ij})`, with `0 log 0 = 0`, has the same limit and differs from
  Pearson's statistic by `o_P(1)`.
- **Generalized method of moments** (`gmm_tendstoInDistribution`): let `m(x, θ) ∈ ℝ^q`, `q ≥ k`,
  with `P m(·, θ₀) = 0`, positive definite covariance `Ω`, `θ ↦ m(x, θ)` continuously
  differentiable on a ball `B` around `θ₀` with `‖D_θ m(x, θ)‖ ≤ D(x)` for all `θ ∈ B` and an
  integrable `D`, and `G = P D_θ m(·, θ₀)` of rank `k`. If `Wₙ → W` positive definite in probability and `θ̂ₙ → θ₀` in
  probability minimizes `m̄ₙ(θ)ᵀ Wₙ m̄ₙ(θ)`, then
  `√n(θ̂ₙ - θ₀) → N(0, (GᵀWG)⁻¹ GᵀWΩWG (GᵀWG)⁻¹)`.
- **The optimal weight** (`posSemidef_gmm_covariance_sub_optimal`): for `G` of rank `k` and
  positive definite `Ω`, `W`, the matrix `(GᵀWG)⁻¹ GᵀWΩWG (GᵀWG)⁻¹ - (GᵀΩ⁻¹G)⁻¹` is positive
  semidefinite, so `W = Ω⁻¹` minimizes the covariance in the Loewner order.
- **Overidentification** (`tendstoInDistribution_gmm_overidentification`): under the hypotheses
  above with measurable `m` and weights `Wₙ → Ω⁻¹` in probability, for instance `Wₙ = Ω̂ₙ⁻¹` with
  `Ω̂ₙ → Ω`, the statistic `n m̄ₙ(θ̂ₙ)ᵀ Wₙ m̄ₙ(θ̂ₙ) → χ²_{q-k}`.
- The three statements are Hansen (1982), Thm 3.1, p. 1042 (asymptotic normality), Thm 3.2,
  p. 1048 (the optimal weight), and Lemma 4.2, pp. 1049–1050 (the overidentification statistic,
  `χ²` with `r - q` degrees of freedom in his notation), specialized to i.i.d. data, which satisfy
  his stationarity, ergodicity and martingale-difference assumptions 3.1 and 3.5. Hansen's
  estimators solve `a_N g_N(b) = 0`; the minimizer of `m̄ₙᵀ Wₙ m̄ₙ` corresponds to `a* = Gᵀ W`.

*Proof route.* Pearson: `(Nᵢ - npᵢ)/√(npᵢ)` is `n^{-1/2}` times a sum of `n` i.i.d. vectors with
covariance `I - √p √pᵀ`, the covariance `diag(p) - ppᵀ` of one trial (Tau Ceti
`covMatrix_map_multinomialToEuclidean_multinomialMeasure`) scaled by `diag(p)^{-1/2}`. That
covariance is the orthogonal projection onto `√p^⊥`, so 1.2 and the Tau Ceti projection theorem
`Submodule.map_norm_sq_starProjection_stdGaussian` (as in 1.3) give `χ²_{k-1}`; the multinomial count is the sum of `n`
independent one-trial counts. Estimated parameters: the delta method for `p(ϑ̂ₙ)` turns the
standardized vector into the projection of the limit onto the orthogonal complement of the
range of the `d` columns of `diag(p)^{-1/2} Dp(ϑ₀)` within `√p^⊥`, idempotent of rank `k - 1 - d`.
The likelihood ratio statistic: Taylor expansion of `x log(x/y)` at `x = y`. GMM: the first-order
condition `D m̄ₙ(θ̂ₙ)ᵀ Wₙ m̄ₙ(θ̂ₙ) = 0`, the mean value theorem coordinatewise with the uniform law of
large numbers for `D_θ m` on the ball (3.4 with the integrable envelope `D`), and 1.2. The Loewner
optimality is `(GᵀWG)⁻¹ GᵀWΩWG (GᵀWG)⁻¹ - (GᵀΩ⁻¹G)⁻¹ = A Ω Aᵀ ⪰ 0` with
`A = (GᵀWG)⁻¹GᵀW - (GᵀΩ⁻¹G)⁻¹GᵀΩ⁻¹`. The overidentification statistic is the singular form of 1.3
for the projection of rank `q - k`.

*Needs:* 1.2, 1.3, 3.4, 5.3; Foundations 8.4; Tau Ceti `multinomialMeasure`.

**Checks.**

- Pearson with `k = 1`: the statistic is `0` and `χ²_0 = δ₀` (Tau Ceti `chiSquaredMeasure_zero`).
- Pearson with `k = 2`: the statistic is `(N₁ - np₁)²/(np₁ p₂)`, the square of the standardized
  binomial, which is `χ²_1` in the limit.
- `r × c` independence: `rc - 1 - ((r - 1) + (c - 1)) = (r - 1)(c - 1)`; a `2 × 2` table has one
  degree of freedom.
- GMM with `q = k` (exactly identified): `G` is invertible and the covariance is `G⁻¹ Ω G⁻ᵀ` for
  every `W`; the overidentification statistic is `0`, matching `χ²_0`.
- The envelope must bound the derivative on the whole ball: for `m(x, θ) = x + θ/(1 - θ²)` on the
  ball `(-1, 1)` the derivative norms are unbounded and no integrable `D` exists, so the
  hypothesis fails. A real supremum `⨆_θ ‖D_θ m(x, θ)‖` of an unbounded family would be the junk
  value `0` and integrable.

### Examples

- The `t` test against the Wilcoxon test under logistic errors: Pitman efficiency
  `e_{W,t} = π²/9 ≈ 1.097`, so the Wilcoxon test needs about `9%` fewer observations.

### Dependencies

Layers 1–7 and Foundations 2.4, 6.2, 8.4.

## Layer 9: robust statistics

Functionals are maps `T : Measure ℝ → ℝ` on probability laws, or `T : Linfty ℝ → ℝ` on distribution
functions. The ε-contamination of `F` at `x` is `(1 - ε) F + ε δₓ`. `ψₖ` is the Huber score of
Foundations 9.2, `ψₖ(u) = max(-k, min(k, u))`.

### 9.1 Influence functions and location M-functionals

- `HasInfluenceFunction T F IF`: for every `x`, `ε ↦ T((1 - ε) F + ε δₓ)` has right derivative
  `IF(x)` at `0` (van der Vaart, §20.1, p. 291). The **gross-error sensitivity** is
  `sup_x |IF(x)|`.
- **Influence function of a location M-functional** (`hasInfluenceFunction_mFunctional`): let `ψ`
  be odd and continuous and let `T` solve `∫ ψ(x - T(G)) dG(x) = 0` on the contaminations of `F`.
  If `λ(θ) = ∫ ψ(x - θ) dF(x)` has derivative `-γ ≠ 0` at `θ₀ = T(F)` and
  `ε ↦ T((1 - ε)F + ε δₓ)` is right differentiable at `0`, then `IF(x) = ψ(x - θ₀)/γ`.
- **Asymptotic normality**: if moreover `ψ` is Lipschitz and `E ψ(X - θ₀)² < ∞`, a consistent
  `θ̂ₙ` with `∑ᵢ ψ(xᵢ - θ̂ₙ) = o_P(√n)` has `√n(θ̂ₙ - θ₀) → N(0, E ψ(X - θ₀)²/γ²) = N(0, E IF²)`, by
  the Lipschitz form of 5.3.

*Proof route.* Differentiate the defining equation along the contamination: with `θ_ε` the
functional at `(1 - ε)F + εδₓ`, `(1 - ε) λ(θ_ε) + ε ψ(x - θ_ε) = 0`; divide by `ε`, use
`λ(θ₀) = 0`, the derivative of `λ`, and `θ_ε → θ₀` from the right differentiability.

*Needs:* 5.3; Foundations 9.2.

**Checks.**

- `ψ(u) = u`: the mean, with `γ = 1` and `IF(x) = x - μ`, unbounded, so the gross-error
  sensitivity is `∞`.
- `ψ = ψₖ` at `F = N(0, 1)`: `γ = 2Φ(k) - 1`, `IF(x) = ψₖ(x)/(2Φ(k) - 1)`, and the gross-error
  sensitivity is `k/(2Φ(k) - 1)`.
- `HasInfluenceFunction` for a constant functional `T ≡ c` holds with `IF ≡ 0`; for
  `T(G) = G((-∞, t₀])` it holds with `IF(x) = 1{x ≤ t₀} - F(t₀)`, since the contaminated value is
  `(1 - ε)F(t₀) + ε 1{x ≤ t₀}`, linear in `ε`.
- `HasInfluenceFunction` is a right derivative at every `x`: for `T(G) = G({0})` at a continuous
  `F`, the contaminated value is `ε 1{x = 0}`, so `IF = 1_{{0}}`, which is nonzero although
  `F({0}) = 0`.

### 9.2 Hadamard differentiable functionals

- **Influence function and asymptotic normality**
  (`tendstoInDistribution_of_hasHadamardDerivWithinAt_cdf`): let `T` on `ℓ^∞(ℝ)` be Hadamard
  differentiable at `F` within the monotone functions and tangentially to all of `ℓ^∞(ℝ)`, with
  derivative `T′_F`, and let `IF(x) = T′_F(1_{[x, ∞)} - F)` be measurable and square-integrable.
  Then `∫ IF dF = 0`, `IF` is the influence function of `T` on the contaminations, and for
  measurable `T(Fₙ)`,
  `√n(T(Fₙ) - T(F)) = n^{-1/2} ∑ᵢ IF(xᵢ) + o_P(1) → N(0, ∫ IF² dF)` (van der Vaart, §20.1, p. 291,
  and Thm 20.8, p. 297).
- **Tangential differentiability**: if `T` is Hadamard differentiable only tangentially to a closed
  subspace carrying the limit `B ∘ F` of `√n(Fₙ - F)`, as for quantiles (4.1), then
  `√n(T(Fₙ) - T(F)) → T′_F(B ∘ F)`, a centred normal law.

*Proof route.* The functional delta method (4.2) with the classical Donsker theorem (3.4); the
derivative is linear, so `T′_F(√n(Fₙ - F)) = n^{-1/2} ∑ᵢ T′_F(1_{[xᵢ, ∞)} - F)` exactly — the
empirical distribution function is `n⁻¹ ∑ᵢ 1_{[xᵢ, ∞)}` — and 1.2 gives the limit. The influence
function: `t ↦ F + t(1_{[x, ∞)} - F)` is the contamination, and Hadamard differentiability along
the constant direction gives the derivative. The mean of `IF` vanishes by a law of large numbers
argument, not by commuting `T′_F` with an integral (the map `x ↦ 1_{[x, ∞)} - F` is not Bochner
integrable in `ℓ^∞(ℝ)`: for `F` uniform its values are pairwise at distance `1`). By the delta
method `T′_F(√n(Fₙ - F))` converges in law, so it is bounded in probability; it equals
`n^{-1/2} ∑ᵢ IF(xᵢ)` exactly, so `n⁻¹ ∑ᵢ IF(xᵢ) → 0` in probability; the weak law gives
`n⁻¹ ∑ᵢ IF(xᵢ) → ∫ IF dF`, hence `∫ IF dF = 0`, and the scalar central limit theorem gives the
limit `N(0, ∫ IF² dF)`.

*Needs:* 3.4, 4.2; Foundations 9.1.

**Checks.**

- `T(z) = z(t₀)`, the distribution function at `t₀`: `T' = lp.evalCLM` at `t₀`,
  `IF(x) = 1{x ≤ t₀} - F(t₀)` and the limit variance is `F(t₀)(1 - F(t₀))`.
- The quantile (4.1) at `F(ξ) = p`, `F'(ξ) = f`: `IF(x) = (p - 1{x ≤ ξ})/f`, of variance
  `p(1 - p)/f²`, recovering 5.8.

### 9.3 The median

- **Influence function of the median**: if `F` has a unique median `m` and a positive density `f`
  continuous at `m`, the median functional has `IF(x) = (1/2 - 1{x ≤ m})/f(m)` for `x ≠ m`,
  asymptotic variance `1/(4 f(m)²)` and gross-error sensitivity `1/(2 f(m))` (the case `p = 1/2`
  of van der Vaart, Ex 20.5, p. 294, for quantiles).
- **The contamination bound** (`median_mem_Icc_of_contamination`): for `F` continuous and strictly
  increasing, `0 ≤ ε < 1/2` and any law `H`, every median of `G = (1 - ε)F + εH` lies in
  `[F^{-1}((1/2 - ε)/(1 - ε)), F^{-1}(1/(2(1 - ε)))]`; the bounds are attained by `H = δ_y` with
  `y` far to the left and far to the right. None of the cited texts states this bound; it carries
  the proof route below in place of a locator.

*Proof route.* The influence function is 9.2 with the quantile derivative of 4.1, or 9.1 with
`ψ = sign`. The bound: `G(x) ≥ (1 - ε)F(x)` and `G(x) ≤ (1 - ε)F(x) + ε`, so `G(x) ≥ 1/2` forces
`F(x) ≥ (1/2 - ε)/(1 - ε)` and `G(x) ≤ 1/2` for `x` below a median forces `F(x) ≤ 1/(2(1 - ε))`;
the quantile Galois inequality (Tau Ceti `quantile_le_iff`) converts these into the interval.

*Needs:* 4.1, 9.1, 9.2; Tau Ceti `Measure.quantile`.

**Checks.**

- `F = N(0, 1)`, `ε = 0.1`: the interval is `[Φ⁻¹(4/9), Φ⁻¹(5/9)] ≈ [-0.1397, 0.1397]`.
- `ε = 0`: the interval is `{m}`; as `ε → 1/2` the left end tends to `-∞`.
- The median of `N(0, 1)` has gross-error sensitivity `√(2π)/2 ≈ 1.2533`.

### 9.4 Breakdown points

- `breakdownPoint T x ∈ [0, ∞]`: the least fraction `m/n` of coordinates of the sample `x` whose
  arbitrary replacement makes `T` unbounded, and `∞` when no `m ≤ n` does (in particular for
  `n = 0`); this is `m*/n` for the replacement number `m*` of Jurečková–Sen, (2.3.16), p. 26.
- **Mean and median** (`breakdownPoint_sampleMean_and_median`): the sample mean has breakdown point
  `1/n` at every sample of size `n ≥ 1`, and the sample median of `2m + 1` observations has
  breakdown point `(m + 1)/(2m + 1)`, which tends to `1/2`.
- **Least squares** has breakdown point `1/n` at every regression sample with a design of full
  rank.
- **Least median of squares**: consider a regression sample with `p ≥ 2` coefficients, no design
  row `xᵢ = 0`, observations in general position (any `p` observations determine the coefficient
  vector uniquely), and no vertical hyperplane of `ℝ^{p+1}` (a `p`-dimensional subspace containing
  the `y`-axis) containing more than `⌊n/2⌋` observations. Breakdown is taken for the set of all
  minimizers of the median squared residual (the order statistic of rank `⌊n/2⌋ + 1` of the
  squared residuals): it breaks down when the set of minimizers over the corrupted samples is
  unbounded. Its breakdown point is `(⌊n/2⌋ - p + 2)/n` (Rousseeuw 1984, Thm 1, p. 872, with the
  standing assumptions of §2, p. 872; the proof on p. 878 constructs an unbounded family of
  minimizers, which is why the set-valued form is the one proved). Every selection of a minimizer
  therefore has breakdown point at least `(⌊n/2⌋ - p + 2)/n`, and a particular selection can do
  better. Under general position at most `p - 1` design rows lie in a hyperplane of the design
  space, so the vertical-hyperplane condition is `p - 1 ≤ ⌊n/2⌋`. Without it the formula can be
  `0` or negative, as for `n = 8`, `p = 6`, where `0` replacements cannot break a fixed estimate.
- **Least absolute deviations** has breakdown point `1/n` when whole pairs `(xᵢ, yᵢ)` may be
  replaced (Jurečková–Sen, §4.8, p. 176).

*Proof route.* Mean: one replaced coordinate moves the mean by `1/n` times the change. Median:
`m` replacements leave at least `m + 1` original points on each side, so the median stays in the
range of the original sample; `m + 1` replacements placed at `y → ∞` move it to `y`. Least squares
is linear in the responses. Least median of squares: Rousseeuw's argument with the half-sample of
original points in general position. Least absolute deviations: a single pair with a large design
point `x` and a response `y = c x` with large `c` forces the fit through it.

*Needs:* Foundations 9.1.

**Checks.**

- `n = 5` (`m = 2`): the median breaks down at `3/5`; two replacements leave three original
  points and the median between the original extremes.
- `n = 1`: the mean and the median both have breakdown point `1`.
- Least median of squares with `n = 20` and `p = 2`: `(10 - 2 + 2)/20 = 1/2`.
- `breakdownPoint` of a constant estimator is `∞` at every sample: no replacement makes it
  unbounded, and the infimum over the empty set of fractions is `⊤`.
- `breakdownPoint` at `n = 0` is `∞`: the only `m` is `0`, and the image of the one empty sample is
  a point, which is bounded.
- The selection matters: for `n = 6`, `p = 3`, rows `(1, t, t²)`, `t = 0, …, 5`, and responses `0`,
  the formula gives `2/6`. The minimum-norm minimizer stays `0` after any two replacements, since
  four zero residuals remain, so that selection breaks down only at `3/6`. With three replacements,
  the responses at `t = 3, 4, 5` replaced by `A(t - 2)`, the minimum-norm minimizer is
  `(0, -A/6, A/6)`, which is unbounded in `A`.

### 9.5 Hampel's optimality and Huber's minimax property

- **Hampel's optimality** (`integral_sq_huberScore_le_of_abs_le`): for `c > √(π/2)` let `k > 0`
  solve `k/(2Φ(k) - 1) = c`. Among measurable `φ` with `∫ φ dΦ = 0`, `∫ x φ(x) dΦ(x) = 1` and
  `|φ| ≤ c`, the integral `∫ φ² dΦ` is minimized by `φ = ψₖ/(2Φ(k) - 1)`, and every minimizer
  agrees with it `Φ`-almost everywhere, that is, the minimizer is unique in `L²(Φ)`. Equivalently,
  `ψₖ` minimizes the asymptotic variance among location M-estimators with gross-error
  sensitivity at most `c` at the normal model (van der Vaart, Ex 5.29, pp. 59–60, with the
  normalization `P ψ' = 1`, which is `∫ x ψ(x) dΦ(x) = 1` after integration by parts against the
  normal density).
- **Huber's minimax property** (`huber_minimax`): for `0 < ε < 1` let `k > 0` solve
  `2φ(k)/k - 2Φ(-k) = ε/(1 - ε)` and let `G₀` have density `(1 - ε)φ(x)` for `|x| ≤ k` and
  `(1 - ε)φ(k) e^{k² - k|x|}` for `|x| > k`. With
  `V(ψₖ, G) = ∫ ψₖ² dG / G((-k, k))²`, for every `G = (1 - ε)Φ + εH` with `H` symmetric about `0`,
  `V(ψₖ, G) ≤ V(ψₖ, G₀) = 1/I(G₀)` (Jurečková–Sen, §2.4, (2.4.9)–(2.4.16), pp. 32–36, restating
  Huber 1964). Moreover `G₀ = (1 - ε)Φ + εH₀` for a symmetric `H₀` carried by `{|x| > k}`, `ψₖ` is
  the score `-g₀'/g₀`, and `∫ ψ² dG₀/(∫ ψ' dG₀)² ≥ 1/I(G₀)` for every bounded absolutely continuous
  `ψ` with `∫ ψ' dG₀ ≠ 0`, so `(ψₖ, G₀)` is a saddle point.

*Proof route.* Hampel: the Lagrangian `∫ (φ² - 2aφx) dΦ` with the pointwise constraint `|φ| ≤ c`
is minimized pointwise by `φ = max(-c, min(c, ax))`, and the normalization fixes `a`; the
pointwise minimizer is unique at every `x`, so a feasible `φ` with the same integral agrees with
it `Φ`-a.e. Pointwise uniqueness fails: changing the minimizer at the single point `0` from `0`
to `c` changes no constraint and no integral. Huber: the mass of `ψₖ²` beyond `±k` is `k²`, the largest
value of `ψₖ²`, and the denominator counts only `(-k, k)`, so moving the contaminating mass outside
`(-k, k)` maximizes `V`; `G₀` puts its contamination there, the equation for `k` is
`∫_{|x| > k} dG₀ = ε + (1 - ε)(2Φ(-k))`, and `V(ψₖ, G₀) = 1/I(G₀)` is the identity
`∫ ψₖ² dG₀ = G₀((-k, k))` obtained by integrating by parts against `g₀`. The last inequality is the
Cauchy–Schwarz inequality `(∫ ψ' dG₀)² = (∫ ψ ψₖ dG₀)² ≤ ∫ ψ² dG₀ ∫ ψₖ² dG₀`.

*Needs:* 9.1; Foundations 9.2; Tau Ceti `cdf_gaussianReal_eq`, `hasDerivAt_cdf_gaussianReal`.

**Checks.**

- The equation for `k` (computed): `ε = 0.01, 0.05, 0.1` give `k ≈ 1.9451, 1.3984, 1.1402`, and
  `V(ψₖ, G₀) = 1/I(G₀) ≈ 1.0652, 1.2561, 1.4899`; the density of `G₀` integrates to `1`.
- At `ε = 0.05`, `H = δ₀` gives `V ≈ 0.9755 < 1.2561`, and `H = (δ₋₁₀ + δ₁₀)/2` gives the maximum
  `1.2561`.
- Hampel's threshold: `k/(2Φ(k) - 1) → 1/(2φ(0)) = √(π/2) ≈ 1.2533` as `k → 0`, the gross-error
  sensitivity of the median, which is the least attainable.

### 9.6 Regression M-estimators

- **Asymptotic linearity** (`regression_mEstimator_asymptotically_linear`): in the linear model
  `yᵢ = xᵢᵀβ + εᵢ` with fixed design rows, `n⁻¹ ∑ xᵢ xᵢᵀ → Q` positive definite and
  `maxᵢ ‖xᵢ‖/√n → 0`, and i.i.d. errors with law `F`, let `ρ` be convex with right derivative `ψ`,
  `E ψ(ε) = 0`, `E ψ(ε)² < ∞`, `E(ψ(ε - t) - ψ(ε))² → 0` as `t → 0`, and `t ↦ E ψ(ε - t)` with
  derivative `-γ < 0` at `0`. Then every sequence of minimizers satisfies
  `√n(β̂ₙ - β) = (Q⁻¹/(γ√n)) ∑ᵢ xᵢ ψ(εᵢ) + o_P(1) → N(0, (E ψ(ε)²/γ²) Q⁻¹)` (Jurečková–Sen, §5.5,
  p. 215, Thm 5.5.1, p. 218; Hjort–Pollard 1993, Thm 2.2, p. 4, applied to least squares and least
  absolute deviations in §3D, pp. 7–8).
- Least squares is `ρ(u) = u²/2` with `E ε² < ∞` and `γ = 1`; least absolute deviations is
  `ρ(u) = |u|` when `F` has median `0` and a derivative `F'(0) > 0`, with `γ = 2F'(0)`.

*Proof route.* The convexity argument of Hjort and Pollard: the process
`Zₙ(u) = ∑ᵢ [ρ(εᵢ - xᵢᵀu/√n) - ρ(εᵢ)]` is convex in `u`, and for each `u`,
`Zₙ(u) = -uᵀ n^{-1/2} ∑ᵢ xᵢ ψ(εᵢ) + ½ γ uᵀQu + o_P(1)`: the mean of the remainder from the
derivative of `t ↦ E ρ(ε - t)` and its variance from the `L²`-continuity of `ψ` and the design
condition. Pointwise convergence of convex functions is uniform on compacts, and the minimizer of
a convex function close to a strictly convex quadratic is close to the quadratic's minimizer. The
limit law is the Lindeberg theorem (1.2), whose condition follows from `maxᵢ ‖xᵢ‖/√n → 0`.

*Needs:* 1.1, 1.2; Mathlib `ConvexOn`.

**Checks.**

- Least squares: `β̂ₙ - β = (∑ xᵢxᵢᵀ)⁻¹ ∑ xᵢ εᵢ` exactly, and the limit covariance is `σ² Q⁻¹`.
- Least absolute deviations with Laplace errors `e^{-|u|}/2`: `γ = 2 · 1/2 = 1` and `E ψ² = 1`, so
  the covariance is `Q⁻¹`, half that of least squares (`σ² = 2`).
- The design condition fails for `xᵢ = 2^i`: `maxᵢ ‖xᵢ‖/√n` diverges, and least squares is
  dominated by the last observation, with a non-Gaussian limit for non-Gaussian errors.

### Examples

- The Hodges–Lehmann location estimator is the median of the Walsh averages; its influence
  function is a target of MathematicalStatisticsNonparametric, which consumes 9.1–9.2.

### Dependencies

Layers 1–5 and Foundations 9.1–9.2.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **The Bahadur–Kiefer theorem**: the almost sure order
  `limsup n^{3/4} |Rₙ|/(log log n)^{3/4} = (32 p(1 - p)/27)^{1/4}/f(ξ_p)` of the Bahadur remainder.
  It needs the law of the iterated logarithm for the oscillation modulus of the uniform empirical
  process, and neither Mathlib nor Tau Ceti has a law of the iterated logarithm; 5.8 owns the
  representation in probability.
- **Hampel's general optimal bounded-influence estimators** beyond the location case of 9.5.
- **Further empirical-process theory**: Talagrand's and Bousquet's concentration inequalities,
  multiplier and exchangeable bootstrap central limit theorems, empirical processes of dependent
  data, uniform-in-`P` Donsker theorems and the Komlós–Major–Tusnády approximation.
- **Further limits of experiments**: Le Cam's theory of convergence of experiments in the deficiency
  distance, local asymptotic mixed normality, and the Hájek–Le Cam theory for nonregular models.
- **Further tests**: Bahadur and Hodges–Lehmann efficiency, and the asymptotic theory of
  likelihood ratio tests with nuisance parameters on the boundary beyond 8.1.

## Prior formalization

Most targets are formalized in `CKSD/Asymptotics/` of
[lean-CKSD](https://github.com/bjbraams/lean-CKSD), the Core Knowledge of Statistics and Data
Science project, many of them proved. lean-CKSD works with Mathlib's `TendstoInMeasure` on a fixed
space and states its process results through `Framework.lean`, which defines an outer expectation,
outer weak convergence, a Hadamard derivative, local asymptotic normality and regular estimators;
its local asymptotic minimax theorem is admitted, and its degenerate U-statistic theorem covers
only kernels of finite rank. Differences with this roadmap:
- the varying-space conventions of 1.1 and the fixed-`h` form of local asymptotic normality;
- the empirical-process toolkit of Layer 3 is not developed as such in lean-CKSD, which proves
  the estimator theorems with direct Lipschitz chaining (`LipschitzChaining.lean`);
- the Moore–Penrose quadratic form of 1.3, the general eigen-expansion of 6.3, and Layer 9 beyond
  the Huber inequality and regression M-estimators.

The map, which is not prescriptive, lists files of `CKSD/Asymptotics/`:

| Layer | lean-CKSD files |
|---|---|
| 1 | MultivariateCLT, Lindeberg/Basic, Basic (delta method) |
| 2 | Framework |
| 3 | LipschitzChaining, LipschitzExpansion |
| 4 | Framework (Hadamard, functional delta method), AsymptoticTheory (argmax) |
| 5 | MEstimators, MaximumLikelihood, ZEstimators, MEstimatorNormality, RatesOfConvergence, Quantiles, Estimators |
| 6 | UStatistics, UStatisticsProjection, Statistics |
| 7 | Experiments, LANApproximation, LANJointLimit, LANLikelihood, QMDReference, RepresentationKernel, ConvolutionKernel, KernelConvolution, KernelTranslation, GaussianAnderson, GaussianShiftComplete, GaussianShiftTilt, GaussianKernelTranslation, LikelihoodSingular, LikelihoodSupport, LikelihoodTransfer, Framework |
| 8 | LikelihoodTests, Experiments (local power), AsymptoticTheory (Pearson) |
| 9 | HigherOrder (Huber), RegressionMEstimators, ConvexArgmin/Basic, ConvexRegression/Basic |

Related libraries:
- [Statlib](https://github.com/stat-lib/statlib) (Apache 2.0) develops contiguity on sample spaces
  varying along a filter, quadratic-mean differentiability, the squared Hellinger distance and a
  weak law of large numbers. `HasQMDWithinAt` in 7.3 follows the shape of its QMD definition in
  `Statlib/Inference/QMD.lean` at commit `af349698`; no Statlib code is copied.

## References

The locators refer to these editions; page numbers are printed page numbers.

- A. W. van der Vaart, *Asymptotic Statistics*, Cambridge University Press, 1998.
- A. W. van der Vaart and J. A. Wellner, *Weak Convergence and Empirical Processes*, 2nd ed.,
  Springer, 2023.
- J. Jurečková and P. K. Sen, *Robust Statistical Procedures: Asymptotics and Interrelations*,
  Wiley, 1996.
- E. L. Lehmann, *Elements of Large-Sample Theory*, Springer, 1999.
- P. J. Huber, Robust estimation of a location parameter, *Ann. Math. Statist.* 35 (1964), 73–101.
- P. J. Rousseeuw, Least median of squares regression, *J. Amer. Statist. Assoc.* 79 (1984),
  871–880.
- L. P. Hansen, Large sample properties of generalized method of moments estimators,
  *Econometrica* 50 (1982), 1029–1054.
- N. L. Hjort and D. Pollard, Asymptotics for minimisers of convex processes, preprint 1993,
  arXiv:1107.3806.

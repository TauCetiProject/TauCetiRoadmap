# Roadmap: foundations of mathematical statistics

**Summary.** This roadmap builds the finite-sample core of mathematical statistics on Mathlib's
measure theory, Markov kernels and decision-theoretic risk:
- statistical experiments, densities and tests;
- sufficiency, completeness and ancillarity;
- natural exponential families;
- unbiased estimation and information;
- order statistics and the Gaussian sampling laws;
- the Neyman–Pearson theory of tests, from the lemma to unbiased and conditional tests;
- decision theory: minimax and Bayes rules, complete classes, admissibility, equivariance and
  Blackwell's comparison of experiments.

It also builds a **starting vocabulary for later statistics roadmaps**:
- convergence in probability and in law, and their stochastic algebra;
- i.i.d. sequences, the laws of large numbers and the central limit theorem for statistics;
- contiguity;
- empirical distributions and the elementary estimators, distances and procedures of
  asymptotic, nonparametric, Bayesian, linear-model, time-series and survival statistics.

The material is the standard graduate content of Lehmann–Casella, Lehmann–Romano, Brown and
Ferguson (see [References](#references)).

**This roadmap is a base.** Layers 8 and 9 provide vocabulary for later roadmaps on five areas:
asymptotic and robust statistics; nonparametric and high-dimensional statistics; Bayesian
statistics and stochastic computation; linear models and design; and dependent data, stochastic
models and survival analysis. The aim is that each such roadmap needs this one and none of the
others. Layer 9 is a closed list, stated by its own rule (see [Layer 9](#layer-9-shared-vocabulary)).

Suggested home: `TauCeti/Statistics/`, with one subdirectory per layer.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Experiments, densities and tests.** Real densities, countable mixtures and domination,
   randomized tests and their power, confidence sets, risk of randomized rules, and garblings.
2. **Sufficiency and completeness.** The factorization theorem, minimal sufficiency, Basu's
   theorem, completeness of symmetric statistics.
3. **Natural exponential families.** Convexity, Laplace determinacy, analyticity and moments of
   the log partition function, completeness, the mean parametrization, maximum likelihood,
   conditional families and the Pitman–Koopman–Darmois theorem.
4. **Unbiased estimation and information.** Rao–Blackwell, Lehmann–Scheffé, the covariance
   characterization of UMVU estimators, the optimality of U-statistics, the information
   inequality, Stein's identity, the James–Stein estimator and the Pitman estimator.
5. **Order statistics and Gaussian samples.** Joint and marginal laws of order statistics, the
   law of the ranks, and the chi-squared, independence and Student statements for a Gaussian
   sample.
6. **Tests.** Threshold tests, the Neyman–Pearson lemma in its constrained, sum-of-errors and
   generalized forms, monotone likelihood ratio and the Karlin–Rubin theorems, least favorable
   mixtures, uniformly most powerful interval tests, unbiased tests and Neyman structure,
   conditional tests with a nuisance parameter, maximal invariants, and the duality of tests and
   confidence sets.
7. **Decision theory.** Admissible, Bayes and minimax rules, the minimax theorem for finite
   statistical games, the complete class theorem for a finite parameter set, averaging over a
   finite group, Blyth's method, Scheffé's contrast supremum, and Blackwell's comparison theorem.
8. **Convergence and stochastic algebra.** Boundedness in probability, the adapters to Mathlib's
   convergence in law and in measure, Slutsky's lemma without separability, the delta method,
   i.i.d. sequences with their laws of large numbers and central limit theorem, and contiguity.
9. **Shared vocabulary.** Empirical distributions, quantiles and U-statistics; Kolmogorov and
   total variation distances; the Huber score; kernel density estimators; sparse vectors and the
   restricted isometry property; the Benjamini–Hochberg count; the Poisson likelihood,
   Metropolis–Hastings and leapfrog maps and the normal-location posterior; sample means,
   scatter matrices and the Gaussian likelihood; simple random sampling and Latin squares; weak
   stationarity, i.i.d. noise and the sample autocovariance; the Nelson–Aalen and Kaplan–Meier
   estimators.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- the probability distributions themselves (Gaussian, chi-squared, Student, Fisher–Snedecor,
  beta, Poisson, quantile functions). They are Mathlib's and Tau Ceti's, as built by
  [StandardDistributions](../StandardDistributions/README.md), which leaves statistical
  inference out of its scope;
- the order-statistic facts that StandardDistributions (Layer 4.6) and the pinned Tau Ceti
  provide: the definition `TauCeti.orderStatistic`, its distribution function
  `cdf_map_orderStatistic_pi_eq_regularizedIncompleteBeta`, the beta law of a uniform order
  statistic, the joint density of uniform order statistics, and the chamber formula
  `map_orderStatistics_pi`. Layer 5 builds only what StandardDistributions excludes: the joint
  and marginal densities for a general density, and the law of the ranks;
- Markov chain theory, including invariance, detailed balance in Mathlib's `Kernel.IsReversible`
  form and its finite-matrix adapters
  ([MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md), Layer 3). 9.4 only checks that
  the Metropolis–Hastings kernel is reversible.

Asymptotic theory beyond the stochastic algebra of Layer 8, and every result that is not listed
in a layer, belongs to the [boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** Everything is in `TauCeti`. Mathlib's `ProbabilityTheory` and `MeasureTheory`
  are opened throughout.
- **Parametric families.** A family of laws on a measurable space `X` is `P : Θ → Measure X`
  with `[∀ θ, IsProbabilityMeasure (P θ)]`. The parameter type carries no measurable structure.
  Where a prior or a mixture over parameters is integrated (Bayes rules, least favorable
  mixtures, Blackwell's theorem), the family is a Markov kernel `P : Kernel Θ X`, as in Mathlib's
  [`ProbabilityTheory.bayesRisk`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Probability/Decision/Risk/Defs.html).
  A family on a countable parameter type is a kernel by `Kernel.ofFunOfCountable`.
- **Statistics** are measurable maps `T : X → S`. A **randomized rule** with actions in `A` is a
  Markov kernel `κ : Kernel X A`, `[IsMarkovKernel κ]`, as in Mathlib. The subtype of Markov
  kernels appears only as the class `D` of the criteria of 7.1.
- **Tests** are measurable `φ : X → ℝ` with values in `[0, 1]`, the probability of rejection.
  This is the test class of the open Mathlib pull request
  [#39791](https://github.com/leanprover-community/mathlib4/pull/39791) on the Neyman–Pearson
  lemma, whose names 6.2 adopts.
- **Real densities.** `HasDensity P μ f` means `f` is measurable, `μ`-a.e. nonnegative and
  `P = μ.withDensity (fun x ↦ ENNReal.ofReal (f x))`. Laws with densities in `ℝ≥0∞` use
  Mathlib's `withDensity` and `rnDeriv` directly.
- **Integrals** are Bochner integrals with values in `ℝ`. Every theorem that uses one carries the
  integrability hypotheses that exclude the junk value `0` of a nonintegrable integrand, unless
  its integrand is bounded and its measure finite.
- **Risk.** For a real loss `L : Θ → A → ℝ`, `risk P L κ θ = ∫ a, L θ a ∂(κ ∘ₘ P θ)`. For a
  nonnegative loss this is the real form of Mathlib's `∫⁻ y, ℓ θ y ∂((κ ∘ₖ P) θ)`, and 1.5 proves
  the agreement.
- **Decision criteria** (Layer 7) are stated for a class `D` of rules with real risk functions
  `R : D → Θ → ℝ`, so that they apply to estimators, tests and randomized rules alike. Bayes
  rules have integrable risk and are compared with rules of integrable risk. Minimax rules have
  risk bounded above and are compared with rules of risk bounded above.
- **Convergence.** Convergence in probability of `X n` to `c` is Mathlib's
  `TendstoInMeasure μ X atTop (fun _ ↦ c)`. Convergence in law is Mathlib's
  `TendstoInDistribution X atTop Z (fun _ ↦ μ) μ'`; convergence of laws that are not presented
  as laws of random variables is convergence in Mathlib's `ProbabilityMeasure` topology.
  Variance, covariance and distribution functions are Mathlib's `variance`, `covariance` and
  `cdf`.
- **Samples.** A finite sample is `x : Fin n → E`, and its law under i.i.d. sampling from `P` is
  `Measure.pi (fun _ : Fin n ↦ P)`. A statistic of a sequence `X : ℕ → Ω → E` at sample size `n`
  uses the first `n` observations `X 0, …, X (n - 1)`. Layer 9 proves that the two forms agree.
- **Euclidean spaces.** Finite-dimensional parameters and statistics live in a real inner product
  space `E` with `[FiniteDimensional ℝ E]` when no coordinates are needed, and in
  `EuclideanSpace ℝ (Fin d)` when they are. A pair of statistics `(T, S)` with values in `E` and
  `F` has values in `WithLp 2 (E × F)`. No separate split exponential family is defined.
- **Total variation** is Mathlib's `tvDist`, the total variation norm of `P - Q`, with values in
  `[0, 2]` for probability measures. The statistical normalization `sup_A |P A - Q A|` is
  `tvDist P Q / 2` (9.2). It is not a separate definition.

## Exact supplier contracts

### From Mathlib

- **Measures and kernels:** `Measure.withDensity`, `Measure.rnDeriv`, `Measure.pi`, `Kernel`,
  `IsMarkovKernel`, composition `κ ∘ₘ μ`, composition product `μ ⊗ₘ κ`, `Kernel.withDensity`,
  `condDistrib`, `condExp` (notation `μ[f | m]`), `StandardBorelSpace`.
- **Probability:** `iIndepFun`, `IndepFun`, `IdentDistrib`, `HasLaw`, `variance` (`Var[X; μ]`),
  `covariance` (`cov[X, Y; μ]`), `cdf`, `gaussianReal`, `multivariateGaussian`, `stdGaussian`,
  `poissonMeasure`, `betaMeasure`, the strong law `ProbabilityTheory.strong_law_ae`, the
  central limit theorem `tendstoInDistribution_inv_sqrt_mul_sum_sub`, the characteristic
  function and `Measure.ext_of_charFun`.
- **Convergence:** `TendstoInMeasure`, `TendstoInDistribution`,
  `TendstoInDistribution.continuous_comp`, `tendstoInDistribution_of_tendstoInMeasure_sub`,
  `IsTightMeasureSet`, `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`.
- **Decision theory:** `avgRisk`, `bayesRisk`, `minimaxRisk`, `IsBayesEstimator` and the
  posterior `P†π` of `Mathlib/Probability/Decision`.
- **Divergences:** `tvDist`, `etvDist`, `klDiv`.
- **Analysis:** Sion's minimax theorem (`Sion.minimax'`, `Sion.exists_isSaddlePointOn`) and
  `IsSaddlePointOn`; Banach–Alaoglu (`WeakDual.isCompact_polar`) and `InnerProductSpace.toDual`;
  analytic functions
  (`AnalyticOnNhd`, `HasFPowerSeriesOnBall`); `hasSum_integral_of_dominated_convergence`;
  integration by parts `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable`; convex hulls,
  separation (`geometric_hahn_banach_*`), and the inverse function theorem
  (`HasStrictFDerivAt.toPartialHomeomorph`).
- **Sorting:** `Tuple.sort` and `Function.FactorsThrough`.
- **Markov kernels and sparsity:** `Kernel.IsReversible`, `Kernel.IsReversible.invariant`,
  `Kernel.ofFunOfCountable`, `hammingNorm` and `hammingDist_triangle`.

### From Tau Ceti

- **Distributions:** `TauCeti.Probability.chiSquaredMeasure` with
  `isProbabilityMeasure_chiSquaredMeasure`, `studentTMeasure`, `fisherSnedecorMeasure`, the Gaussian
  projection laws `HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian` and
  `HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian`, and
  `hasLaw_studentT_of_gaussian_chiSquared`. Also the density `multivariateGaussianPDFReal` with
  `multivariateGaussian_eq_withDensity`.
- **Order statistics and quantiles:** `TauCeti.orderStatistic`, `orderStatistic_comp_perm`, the
  chamber formula `TauCeti.Probability.map_orderStatistics_pi`,
  `cdf_map_orderStatistic_pi_eq_regularizedIncompleteBeta`, `cdf_betaMeasure_eq`, the quantile
  function `MeasureTheory.Measure.quantile`, `measurePreserving_quantile`,
  `monotoneOn_quantile` and `cdf_map_eq_volume_restrict`.
- **Empirical measures:** `TauCeti.Probability.empiricalFiniteMeasure`, `empiricalMeasure`,
  `integral_empiricalFiniteMeasure`, `empiricalFiniteMeasure_comp_equiv`,
  `map_empiricalFiniteMeasure` and `isProbabilityMeasure_empiricalFiniteMeasure`.
- **Total variation:** `MeasureTheory.etvDist_eq_two_mul_iSup_sub`,
  `etvDist_eq_iSup_sub_add_iSup_sub` and `etvDist_le_two_mul_iff`.
- **Measure theory:** `TauCeti.pi_withDensity`, `integrableOn_norm_rpow_ball`, and determinacy
  by the moment generating function `TauCeti.Measure.ext_of_mgf`.

## How to read the build

Layers 1–7 are finite-sample theory. Layer 1 fixes the objects. Layer 2 represents sufficiency
by one Markov kernel that disintegrates every joint law of `(T, X)`. Every later use of
sufficiency (Rao–Blackwell, Basu, Neyman structure) goes through the integration identity of
2.1. The exponential-family results of Layer 3 rest on two analytic facts, Laplace determinacy
and the power series of the partition function. Completeness, the mean map and maximum
likelihood follow from these, and so do the size calculations of the tests in Layer 6. Layer 6
is one argument used many times: a test that rejects where a likelihood ratio, or a positive
combination of likelihood ratios, exceeds a threshold maximizes the power among tests satisfying
the matching side conditions. Layer 7 is convex geometry of risk sets together with Sion's
theorem.

Layers 8 and 9 are independent of Layers 2–7 and may be built first. They contain everything the
other statistics roadmaps share. One target of Layer 4, the optimality of U-statistics, uses the
U-statistic of 9.1.

## Layer 1: experiments, densities and tests

### 1.1 Real densities

- `HasDensity P μ f` (Conventions).
- `HasDensity.integral_eq`: `∫ g dP = ∫ f g dμ` for every `g`, with no integrability hypothesis
  (both sides are the junk `0` together).
- `HasDensity.integrable_iff`: `g` is `P`-integrable iff `f g` is `μ`-integrable.
- `HasDensity.integrable` and `HasDensity.integral_eq_one`: for finite, respectively probability,
  `P`.
- `hasDensity_withDensity_ofReal`, `integral_withDensity_ofReal`,
  `integrable_withDensity_ofReal_iff` and their pushforward forms
  `integral_map_withDensity_ofReal`, `integrable_map_withDensity_ofReal_iff`, for everywhere
  nonnegative measurable densities.
- `map_withDensity_comp`: `(ν.withDensity (k ∘ φ)).map φ = (ν.map φ).withDensity k`.

### 1.2 Countable mixtures and domination

- `mixtureWeight n = 2^{-(n+1)}` and `countableMixture P θs = ∑ₙ mixtureWeight n • P (θs n)`,
  with `tsum_mixtureWeight`, the probability instance, `countableMixture_apply_eq_zero` (null
  iff null for every component), `absolutelyContinuous_countableMixture` and
  `countableMixture_eq_withDensity`.
- **Halmos–Savage lemma** (`exists_absolutelyContinuous_countableMixture`): a nonempty family with
  densities with respect to a σ-finite `μ` is dominated by one of its countable mixtures.

### 1.3 Tests and their power

- `IsStatisticalTest φ`, with `nonneg`, `le_one`, `abs_le_one`, `const`, `one_sub`, `integrable`
  (for every finite measure), `integrable_mul`, `integral_nonneg`, `integral_le_one`,
  `integral_mem_Icc` and `integral_one_sub`.
- `testPower P φ θ = ∫ φ dP θ`.
- `HasTestLevel P H₀ α φ`: `φ` is a test whose power is at most `α` at every `θ ∈ H₀`. This is
  stated pointwise, so that no supremum over a possibly empty `H₀` is taken.
- `IsSimilarTest P B α φ`: power `α` at every `θ ∈ B`.
- `IsUniformlyMostPowerfulTest P H₀ H₁ α φ` and `IsUniformlyMostPowerfulUnbiasedTest P H₀ H₁ α φ`.
  The latter also requires power at least `α` on `H₁`, and its competitors are the unbiased
  level-`α` tests. Add `IsUniformlyMostPowerfulTest.hasTestLevel` and the unbiased analogue.
- `thresholdTest T c γ x`: `1` if `c < T x`, `γ` if `T x = c`, `0` otherwise, for `T` with values
  in a linear order. `intervalTest t c₁ c₂ γ₁ γ₂`: `1` on `(c₁, c₂)`, `γᵢ` at `cᵢ`, `0` otherwise.
  Both are tests for measurable statistics and randomizations in `[0, 1]`
  (`isStatisticalTest_thresholdTest`, `isStatisticalTest_intervalTest`).

### 1.4 Confidence sets

- `HasConfidenceCoverage P C α`: for every `θ` the event `{x | θ ∈ C x}` is measurable and has
  probability at least `1 - α`.
- `confidenceSetOfTests reject x = {θ | x ∉ reject θ}`.
- `hasConfidenceCoverage_confidenceSetOfTests`: inverting level-`α` tests with measurable
  rejection regions gives coverage `1 - α`.
- The converse, `exists_reject_of_hasConfidenceCoverage`: a confidence set of coverage `1 - α`
  gives the level-`α` tests `reject θ = {x | θ ∉ C x}`.

### 1.5 Risk and garblings

- `risk P L κ θ` (Conventions).
- `risk_eq_integral_integral`: `risk P L κ θ = ∫ x, ∫ a, L θ a ∂κ x ∂P θ` for `L θ` bounded and
  measurable.
- `ofReal_risk_eq_lintegral`: for a nonnegative measurable bounded loss, `ENNReal.ofReal` of the
  risk is Mathlib's risk integral `∫⁻ a, ENNReal.ofReal (L θ a) ∂((κ ∘ₖ P) θ)` for a Markov kernel
  `P`.
- `IsGarbling P Q`: some Markov kernel `K` has `Q θ = K ∘ₘ P θ` for all `θ`. Add
  `IsGarbling.refl` and `IsGarbling.trans`.
- `risk_garbling`: for every rule `κ` based on `Q = K ∘ₘ P`, the rule `κ ∘ₖ K` based on `P` has the
  same risk.

### Examples

- The empty null hypothesis: every test has every level.
- The test `φ = α` is similar of size `α` on every set.

### Dependencies

Mathlib only.

## Layer 2: sufficiency and completeness

### 2.1 Definitions and the integration identity

- `IsSufficientStatistic P T`: `T` is measurable and some Markov kernel `K : Kernel S X` has
  `(P θ).map (fun x ↦ (T x, x)) = (P θ).map T ⊗ₘ K` for every `θ`. The kernel is the conditional
  law of the observation given `T`, chosen independently of `θ`.
- `IsCompleteStatistic P T`: every measurable `g` with `g ∘ T` integrable and of mean `0` under
  every `P θ` has `g ∘ T = 0` `P θ`-a.e. for every `θ`.
- `IsBoundedlyCompleteStatistic P T`: the same for bounded measurable `g`. Add
  `IsCompleteStatistic.isBoundedlyComplete`.
- `IsAncillaryStatistic P T`: `T` is measurable and `(P θ).map T` does not depend on `θ`.
- `IsMinimalSufficientStatistic P T`: `T` is sufficient, and for every sufficient `U : X → S'`
  there is a measurable `φ` with `T = φ ∘ U` `P θ`-a.e. for every `θ`.
- `integral_comp_mul_eq_integral_comp_mul_integral_kernel`: if `μ.map (T, id) = μ.map T ⊗ₘ K`,
  then `∫ g(T) φ dμ = ∫ g(T) (∫ φ dK(T)) dμ` for bounded measurable `g` and `φ`. Also its
  indicator form `integral_indicator_comp_mul_eq`, `comp_map_eq_of_map_prodMk_eq_compProd`
  (`K ∘ₘ μ.map T = μ`), and `integral_comp_eq_integral_integral` for a mixture `P ∘ₘ Λ`.
- `isSufficientStatistic_iff_condExp`: on a standard Borel `X`, `T` is sufficient iff for every
  bounded measurable `φ` there is one measurable `ψ` with `(P θ)[φ | σ(T)] = ψ ∘ T` `P θ`-a.e. for
  every `θ`. Here σ(T) is `MeasurableSpace.comap T`.
- `ae_integral_kernel_eq_of_isBoundedlyCompleteStatistic`: for a boundedly complete `T` with
  disintegrating kernel `K`, a bounded measurable `φ` with mean `α` under every `θ` has
  `∫ φ dK(T) = α` a.e. under every `θ`.

### 2.2 Factorization and minimal sufficiency

- `exists_factorization_of_isSufficientStatistic`: if the `P θ` have densities `f θ` with
  respect to a σ-finite `μ` and `T` is sufficient, there are measurable `g θ ≥ 0` and `h ≥ 0`
  with `f θ = (g θ ∘ T) h` `μ`-a.e. The proof uses `eq_withDensity_rnDeriv_comp_of_compProd`: two
  finite laws `P ≪ L` disintegrated by one kernel have `dP/dL` a function of `T`.
- `isSufficientStatistic_of_factorization`: on a standard Borel `X`, the converse. The common
  kernel is the conditional distribution `condDistrib` of the sample given `T` under a dominating
  countable mixture (1.2). This uses `map_prodMk_eq_compProd_of_withDensity_comp` and
  `countableMixture_map_prodMk_eq_compProd`.
- **Factorization theorem** `isSufficientStatistic_iff_exists_factorization`, on a standard Borel
  `X` and a nonempty parameter type.
- **Minimal sufficiency of the likelihood ratio**
  (`isMinimalSufficientStatistic_likelihoodRatio`): let `X` be a nonempty standard Borel space,
  `Θ` countable, and `P θ` probability laws with everywhere positive densities `f θ` with respect
  to a σ-finite `μ`. For a reference parameter `θ₀`, the statistic
  `x ↦ (θ ↦ f θ x / f θ₀ x) : X → (Θ → ℝ)` is minimal sufficient. Its sufficiency is
  `isSufficientStatistic_of_factorization`, which is where `X` standard Borel is used; its
  minimality is `exists_factorization_of_isSufficientStatistic` applied to every sufficient
  statistic.

### 2.3 Basu's theorem

- `indepFun_of_isSufficientStatistic_of_isBoundedlyCompleteStatistic`: a boundedly complete
  sufficient statistic is independent of every ancillary statistic under every `P θ`.

### 2.4 Symmetric statistics

- `IsSymmetricStatistic T`: `T (x ∘ σ) = T x` for every permutation `σ` of `Fin n`.
- `IsSymmetricallyComplete P n`: completeness of the `n`-sample model restricted to symmetric
  statistics.
- `ae_eq_zero_of_setIntegral_pi_eq_zero`: an integrable function on a finite product whose
  integrals over all measurable boxes vanish is `0` a.e.
- `integral_pi_comp_equiv_of_symmetric`: a symmetric function has the same integral under
  `Measure.pi μ` and under `Measure.pi (μ ∘ σ)`.
- `integral_pi_eq_integral_integral_insertNth`: Fubini at one coordinate.
- **Completeness of symmetric statistics** (`ae_eq_zero_pi_of_isCompleteStatistic_of_convex` and
  `isSymmetricallyComplete_of_complete_convex_family`). Let `C` be a set of probability laws,
  closed under binary mixtures and complete for the identity statistic. Then a measurable
  symmetric `g` of `n` coordinates with mean `0` under every `Pⁿ`, `P ∈ C`, vanishes `Pⁿ`-a.e.
  The proof:
  - expands the `n`-th power of a uniform mixture of `Q₁, …, Qₙ ∈ C` multilinearly;
  - isolates the permutation terms by Möbius inversion over subsets, which gives
    `∫ g d(Q₁ ⊗ ⋯ ⊗ Qₙ) = 0`;
  - applies completeness one coordinate at a time to get vanishing box integrals.

### Examples

- For `n` Bernoulli trials the number of successes is complete and sufficient.
- For a Gaussian sample with known variance the sample mean and the residual vector are
  independent, by Basu.

### Dependencies

Layer 1.

## Layer 3: natural exponential families

### 3.1 Definitions and convexity

For a measure `ν` on `X` and a statistic `T : X → E` into a real inner product space:
- `naturalParameterSpace ν T = {η | Integrable (fun x ↦ exp ⟪η, T x⟫) ν}`;
- `logPartition ν T η = log ∫ exp ⟪η, T x⟫ dν`;
- `exponentialFamilyMeasure ν T η = ν.withDensity (exp (⟪η, T⟫ - logPartition ν T η))`;
- `IsMinimalExponentialFamily ν T`: no nonzero `⟪u, T⟫` is `ν`-a.e. constant.

The targets:
- `convex_naturalParameterSpace`;
- `isProbabilityMeasure_exponentialFamilyMeasure` for `ν ≠ 0` and `η` in the natural parameter
  space;
- `exponentialFamilyMeasure_eq_withDensity`, which compares two parameters by an exponential
  tilt;
- `absolutelyContinuous_exponentialFamilyMeasure`, in both directions: the laws of the family and
  `ν` are mutually absolutely continuous.

### 3.2 Laplace determinacy

- `measure_eq_of_integral_exp_inner_eq`: two finite measures on a finite-dimensional real inner
  product space whose Laplace transforms `u ↦ ∫ exp ⟪u, t⟫` are finite and agree on a ball about
  `0` are equal. The proof applies `TauCeti.Measure.ext_of_mgf` to each one-dimensional
  projection and then `Measure.ext_of_charFun`.

### 3.3 The log partition function

For a nonzero `ν` on a finite-dimensional `E` and `T = id`, at every point `η` of the interior of
the natural parameter space:
- `analyticOnNhd_logPartition`: `logPartition ν id` is real analytic on the interior;
- `hasFDerivAt_logPartition`: its derivative at `η` is `⟪m, ·⟫`, with `m = ∫ x dP_η`;
- `fderiv_fderiv_logPartition_apply`: its second derivative at `η` is
  `(u, v) ↦ cov[⟪u, ·⟫, ⟪v, ·⟫; P_η]`;
- `integrable_id_exponentialFamilyMeasure` and `memLp_inner_exponentialFamilyMeasure` (all
  moments of linear functionals are finite).

The proof needs `r > 0` with `exp (⟪η, x⟫ + r ‖x‖)` integrable. The partition function then has
on the ball of radius `r` the power series `h ↦ ∑ₙ ∫ e^{⟪η,x⟫} ⟪x, h⟫ⁿ / n! dν`, whose
coefficients are Bochner integrals of continuous multilinear maps
(`hasSum_integral_of_dominated_convergence`).

The general statistic `T` reduces to `T = id` by pushing `ν` forward along `T`:
`logPartition_map` and `exponentialFamilyMeasure_map` give
`logPartition (ν.map T) id = logPartition ν T`, and the law of `T` under the family is the
family of `ν.map T`.

### 3.4 Completeness

- `isCompleteStatistic_withDensity_exp_inner`: for `T : X → EuclideanSpace ℝ (Fin d)` and `η`
  ranging over a nonempty open set `U` inside the natural parameter space, `T` is complete for
  the family `exp ⟪η, T⟫ / Z(η) · ν`. Each of the two Laplace transforms of `g⁺ ∘ T` and
  `g⁻ ∘ T` is finite on `U`, and the two agree there, so 3.2 applies after a shift.

### 3.5 Mean parametrization

For a nonzero σ-finite `ν` on a finite-dimensional `E`, a minimal family, and an open natural
parameter space `N`, write `M η = ∫ x dP_η` for the mean map:
- `analyticOnNhd_mean_exponentialFamilyMeasure`: `M` is analytic on `N`;
- `injOn_mean_exponentialFamilyMeasure`: `M` is injective on `N`;
- `mean_exponentialFamilyMeasure_mem_interior_convexHull_support`: `M η` lies in
  `interior (convexHull ℝ ν.support)`;
- `exists_hasStrictFDerivAt_mean_exponentialFamilyMeasure`: the derivative of `M` is a continuous
  linear equivalence;
- **Mean parametrization** (`exists_analytic_inverse_exponential_family_mean`): `M` is a
  bijection of `N` onto `interior (convexHull ℝ ν.support)` with analytic inverse.

The Hessian is positive definite by minimality, which gives injectivity along segments and the
inverse function theorem. Surjectivity is 3.6 applied to `t` in the interior.

### 3.6 Maximum likelihood

With the same hypotheses, except that `N` need only be nonempty:
- `exists_isMaxOn_logLikelihood_iff_mem_interior_convexHull_support`: the log likelihood
  `η ↦ ⟪η, t⟫ - logPartition ν id η` of an observation `t` attains its maximum on `N` iff `t` lies
  in `interior (convexHull ℝ ν.support)`. Existence: `η ↦ ∫⁻ exp ⟪η, x - t⟫ dν` is lower
  semicontinuous (Fatou) and coercive. The converse: a separating direction
  (`exists_ne_zero_forall_inner_le_of_notMem_interior`) strictly increases the likelihood.
- `hasFDerivAt_logPartition_and_eq_of_isMaxOn`: for `N` open, a maximizer solves the likelihood
  equation `M η = t` and is the unique maximizer. Uniqueness is strict convexity of the log
  partition function (`logPartition_midpoint_lt`, the equality case of Cauchy–Schwarz).

### 3.7 Conditional exponential families

For statistics `T : X → E` and `S : X → F` into Euclidean spaces, write `P_{η,ζ}` for the family
with statistic `x ↦ WithLp.toLp 2 (T x, S x)` and natural parameter `WithLp.toLp 2 (η, ζ)`.
- `conditionalExponentialKernel κ η`: for a kernel `κ : Kernel F E`, the fibrewise normalized
  tilt `s ↦ exp (⟪η, t⟫ - log ∫ exp ⟪η, t'⟫ dκ s) · κ s`.
- `withDensity_exp_compProd_eq_fst_compProd`: an exponential tilt of `μ ⊗ₘ κ` is its first
  marginal composed with the normalized tilt of `κ`.
- **Conditional families** (`exists_kernel_conditional_exponential_family`): there is one
  s-finite kernel `κ`, free of the parameter, with
  `P_{η,ζ}.map (S, T) = P_{η,ζ}.map S ⊗ₘ conditionalExponentialKernel κ η` at every natural
  parameter. That is, the conditional law of `T` given `S` is an exponential family in `η`
  alone.

### 3.8 The Pitman–Koopman–Darmois theorem

- `exists_exponential_family_of_monotone_sufficient_statistics`. The hypotheses:
  - the `P θ` are mutually absolutely continuous with a probability `P₀`;
  - for an infinite set of sample sizes `n` containing `1` there is one measurable statistic
    `Tₙ : (Fin n → X) → ℝ`, not depending on `θ`, such that for every `θ` the density of
    `(P θ)ⁿ` with respect to `P₀ⁿ` is `H_{n,θ} ∘ Tₙ` for a nondecreasing `H_{n,θ} : ℝ → ℝ`.

  The order of quantifiers matters. If `Tₙ` could depend on `θ`, the density itself would serve,
  and the Cauchy location family would satisfy the hypotheses without being an exponential
  family.

  Then there are a real statistic `T` and constants with `dP θ / dP₀ = C(θ) exp (a(θ) T)`. The
  proof:
  - writes the `n`-sample log density as the sum `∑ᵢ ℓ_θ(xᵢ)`;
  - uses that a function of a sum which is a monotone function of one statistic for infinitely
    many `n` makes `ℓ_θ − ℓ_{θ'}` affine in a common statistic;
  - obtains the common statistic from the case `n = 1` and the monotone representation for two
    sizes.

  This is the theorem of Koopman and Pitman in the form of Lehmann–Casella, §1.6.

### Examples

- Bernoulli, Poisson, Gaussian with known variance, and Gamma with known shape are minimal
  regular families. In each, the mean map is the classical one (`θ = log (p / (1 - p))`, `log λ`,
  `μ / σ²`), and the maximum likelihood estimator exists iff the observation is interior.
- The Gaussian family with both parameters, with `(T, S) = (Σ x, Σ x²)`.

### Dependencies

Layers 1–2.

## Layer 4: unbiased estimation and information

### 4.1 Unbiasedness and UMVU estimators

- `IsUnbiasedEstimator P δ g`: `δ` is measurable and integrable under every `P θ` with mean
  `g θ`.
- `IsMinimumVarianceUnbiasedEstimator P W g`: `W` is a square-integrable unbiased estimator of
  `g` whose variance at every `θ` is at most that of every square-integrable unbiased estimator
  of `g`.
- `isMinimumVarianceUnbiasedEstimator_iff_covariance_eq_zero`: a square-integrable unbiased `W`
  is UMVU iff `cov[W, U; P θ] = 0` for every `θ` and every square-integrable unbiased estimator
  `U` of zero.
- `IsMinimumVarianceUnbiasedEstimator.ae_eq`: two UMVU estimators of `g` agree `P θ`-a.e.

### 4.2 Rao–Blackwell and Lehmann–Scheffé

- **Rao–Blackwell** (`exists_rao_blackwell_estimator`): for a sufficient `T` with kernel `K` and
  an integrable `δ`, the rule `r(s) = ∫ δ dK(s)` is measurable and has the same mean as `δ`, and
  `∫ L(r ∘ T) dP θ ≤ ∫ L(δ) dP θ` for every convex `L : ℝ → ℝ` with `L ∘ δ` integrable. The loss
  may depend on `θ`, since `r` does not. The proof uses Jensen's inequality for the probability
  measure `K s`, with `exists_sub_mul_abs_le_of_convexOn` for integrability.
- **Lehmann–Scheffé, uniqueness** (`ae_eq_of_isCompleteStatistic_of_isUnbiasedEstimator`):
  unbiased functions of a complete statistic agree a.e.
- **Lehmann–Scheffé, optimality** (`isMinimumVarianceUnbiasedEstimator_of_isCompleteStatistic`):
  if `T` is complete and sufficient and `r ∘ T` is a square-integrable unbiased estimator of
  `g`, then `r ∘ T` is UMVU, and it is the Rao–Blackwellization of every square-integrable
  unbiased estimator of `g`.
- **U-statistics are UMVU** (`isMinimumVarianceUnbiasedEstimator_uStatistic`): let `C` be a set
  of probability laws on `X` that is closed under binary mixtures and complete for the identity
  statistic, as in 2.4, and let `h : (Fin m → X) → ℝ` be measurable with `m ≤ n` and
  `Pᵐ`-integrable for every `P ∈ C`. If `uStatistic m n h` (9.1) is square-integrable under every
  `Pⁿ`, `P ∈ C`, it is UMVU for
  `P ↦ ∫ h dPᵐ` in the model `{Pⁿ | P ∈ C}`. The proof averages an unbiased estimator over the
  permutations of the sample, which does not increase its variance, and applies 2.4 to the
  difference of the average and the U-statistic.

### 4.3 Information

- `likelihoodScore f θ x = ∂/∂θ log f(θ, x)` (Mathlib's `deriv`), for a real parameter;
  `fisherInformation P f θ = ∫ (likelihoodScore f θ)² dP θ`, with `fisherInformation_nonneg`; and
  `fisherInformationMatrix P s = (∫ sᵢ sⱼ dP)ᵢⱼ` for a vector score `s`, with
  `fisherInformationMatrix_posSemidef`. The matrix is shared vocabulary: it is the limiting
  covariance of the asymptotic roadmaps. The matrix information inequality is in the boundary
  list.
- **Information inequality, score-moment form** (`sq_div_information_le_variance`): for
  square-integrable `W` and `score` under a probability `P`, with
  `∫ (W - E W) score dP = g'` and `I = ∫ score² dP > 0`, `g'² / I ≤ Var[W; P]` (Cauchy–Schwarz).
- **Information inequality, regular model form** (`sq_deriv_div_fisherInformation_le_variance`).
  The setting is a real parameter in an open interval with densities `f θ` with respect to `μ`;
  the hypotheses are the differentiation-under-the-integral hypotheses of Mathlib's
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le` for `∫ f θ` and `∫ W f θ`. For an
  estimator `W` with mean `g θ`, the conclusion is `g'(θ)² ≤ Var[W; P θ] · I(θ)`. The proof
  verifies the cross-moment identity of the score-moment form.

### 4.4 Stein's identity and James–Stein

- `multivariateGaussianPDFReal_smul_one`: the closed form of the density of `N(θ, v I)`.
- **Stein's identity** (`gaussian_integration_by_parts`): for `X ~ N(θ, v I)` on
  `EuclideanSpace ℝ (Fin p)` and a `C¹` field `g ∈ L²` with integrable partial derivatives,
  `E[(Xᵢ - θᵢ) gᵢ(X)] = v E[∂ᵢ gᵢ(X)]`.
- **James–Stein** (`james_stein_risk_eq_and_lt`): for `p ≥ 3` and `X ~ N(θ, I)`, the estimator
  `(1 - (p - 2)/‖X‖²) X` has risk `p - (p - 2)² E‖X‖⁻²`, strictly less than `p`. The proof:
  - applies Stein's identity to `(‖x‖² + ε)⁻¹ x`;
  - lets `ε → 0` by dominated convergence;
  - bounds `E‖X‖⁻²` by `integrableOn_norm_rpow_ball`.

### 4.5 The Pitman estimator

- `IsLocationEquivariant δ`: `δ (x + a·1) = δ x + a`.
- `pitmanEstimator f x = ∫ u ∏ f(xᵢ - u) du / ∫ ∏ f(xᵢ - u) du`, and `pitmanGoodSet f`, the
  samples at which both integrals exist and the denominator is positive. The targets are
  measurability of both, translation invariance of the good set, and equivariance on it.
- **Optimality** (`pitmanEstimator_minimum_equivariant_risk`): for a density `f` of `P` with the
  good set of full measure, the Pitman estimator has squared-error risk at most that of every
  square-integrable location-equivariant estimator. The proof uses two lemmas:
  - `lintegral_eq_lintegral_indicator_mul_lintegral_sub_const` decomposes the Lebesgue integral
    along the diagonal orbits;
  - `lintegral_ofReal_sq_sub_mul_le` minimizes a weighted quadratic at its weighted mean.

### Examples

- For a Gaussian sample the sample mean is UMVU for the mean, and the Pitman estimator is the
  sample mean.
- For `N(θ, 1)` the Fisher information is `1`, and the sample mean attains the bound.
- The laws on `ℝ` with a Lebesgue density and a finite second moment are closed under mixtures
  and complete, so for `n ≥ 1` the sample mean is UMVU for the mean in that model. A finite mean
  is not enough: the density `2 (1 + x)⁻³` on `x ≥ 0` has mean `1` and infinite second moment,
  and `IsMinimumVarianceUnbiasedEstimator` requires square-integrability under every law.

### Dependencies

Layers 1–3, and 9.1 for the U-statistic.

## Layer 5: order statistics and Gaussian samples

### 5.1 Order statistics

For a probability `P` on `ℝ` with density `f`, and the order statistics `TauCeti.orderStatistic`
of an i.i.d. sample of size `n`. These targets take the chamber formula `map_orderStatistics_pi`
as input; the uniform case is StandardDistributions, Layer 4.6.
- `map_orderStatistics_eq_withDensity`: the vector of order statistics has density
  `n! ∏ f(xᵢ)` on the increasing tuples (`map_orderStatistics_pi` with `TauCeti.pi_withDensity`);
- `map_orderStatistic_eq_withDensity`: the `j`-th order statistic (zero-indexed) has density
  `n! / (j! (n - j - 1)!) F^j (1 - F)^{n-j-1} f`, where `F = cdf P`;
- **Ranks** (`map_sort_eq_and_indepFun_orderStatistics`): for an atomless `P`, the sorting
  permutation `Tuple.sort` is uniform on the `n!` permutations and independent of the order
  statistics. Ties are null, and coordinate permutations preserve the product law and the order
  statistics. Also `measurableSet_setOf_sort_eq`.

### 5.2 Gaussian samples

- `hasLaw_standardize_pi_gaussianReal`: the standardized coordinates of an i.i.d. `N(m, v)`
  sample form a standard Gaussian vector in `EuclideanSpace ℝ (Fin n)`.
- `stdGaussian_map_inner_of_norm_eq_one`: a unit functional of a standard Gaussian vector is
  `N(0, 1)`.
- **Sample mean and residuals** (`gaussian_sample_mean_residual_laws`): for `n ≥ 2`,
  - `SS / v` has law `χ²_{n-1}`, where `SS = ∑ (xᵢ - x̄)²`;
  - `SS` is independent of `x̄`;
  - `√n (x̄ - m) / √(SS / (n - 1))` has Student's law with `n - 1` degrees of freedom.

  The proof projects onto the constants and their orthogonal complement.

### Examples

- The median of a sample of odd size `2k + 1` from a law with density `f` has density
  `(2k + 1)! / (k!)² F^k (1 - F)^k f`, the marginal density at `j = k`.
- For an i.i.d. `N(m₀, v)` sample with `n ≥ 2`, the test that rejects when
  `|√n (x̄ - m₀) / √(SS / (n - 1))|` exceeds the `(1 - α/2)`-quantile of Student's law with `n - 1`
  degrees of freedom has size exactly `α`.

### Dependencies

Layer 1.

## Layer 6: tests

### 6.1 Threshold tests

- `integral_thresholdTest`: the size of `thresholdTest T c γ` is `P(T > c) + γ P(T = c)`.
- `exists_integral_thresholdTest_eq`: for a probability `P` and a real statistic `T`, every size
  `β ∈ (0, 1)` is the size under `P` of a threshold test `thresholdTest T c γ` with `γ ∈ [0, 1]`
  and `c` the `(1 - β)`-quantile of the law of `T` under `P`.

### 6.2 The Neyman–Pearson lemma

- **Constrained form** (`exists_neyman_pearson_test`): for probability laws `P₀`, `P₁` with
  densities `f₀`, `f₁` with respect to `μ` and `α ∈ (0, 1)`, there are `k ≥ 0` and a test `φ` of
  size exactly `α` with `φ = 1` on `{f₁ > k f₀}` and `φ = 0` on `{f₁ < k f₀}`, and it is most
  powerful at level `α`.
- **Necessity** (`ae_eq_of_most_powerful`): every most powerful level-`α` test equals `φ` a.e. on
  `{f₁ ≠ k f₀}` and has size `α`, unless it has power `1`.
- **Sum-of-errors form**, in the names of Mathlib pull request
  [#39791](https://github.com/leanprover-community/mathlib4/pull/39791), for finite measures
  `P`, `Q`, a threshold `t > 0` and `η ∈ [0, 1]`:
  - `npLikelihoodRatio P Q = (dQ/d(P+Q)) / (dP/d(P+Q))`;
  - `npTest P Q t η`: `1` where the ratio exceeds `t⁻¹` or `dP/d(P+Q) = 0`, `η` at the ratio
    `t⁻¹`, and `0` elsewhere;
  - `npSumError P Q t T = ∫ T dP + t ∫ (1 - T) dQ`;
  - `neyman_pearson`: `npTest P Q t η` minimizes `npSumError P Q t` over measurable
    `[0, 1]`-valued tests.

  These are stated in the namespace `TauCeti.NeymanPearson`.
- **Generalized lemma** (`integral_le_of_generalized_neyman_pearson`): suppose `φ` rejects where
  `f₀ > ∑ kᵢ fᵢ` and accepts where `f₀ < ∑ kᵢ fᵢ`, with signed multipliers. Then every test `ψ`
  with `kᵢ ∫ ψ fᵢ ≤ kᵢ ∫ φ fᵢ` has `∫ ψ f₀ ≤ ∫ φ f₀`.

### 6.3 Monotone likelihood ratio

- `integral_le_integral_thresholdTest_of_monotone_likelihood_ratio` and
  `integral_thresholdTest_le_of_monotone_likelihood_ratio`: the two Neyman–Pearson comparisons
  for positive densities whose ratio is a nondecreasing function of `T`.
- `integral_eq_zero_of_integral_eq_zero_of_pos_density`.
- **Karlin–Rubin** (`isUniformlyMostPowerfulTest_of_monotone_likelihood_ratio`): in a family with
  everywhere positive densities and monotone likelihood ratio in `T`, the threshold test of size
  `α` at `θ₀` is UMP of level `α` for `θ ≤ θ₀` against `θ > θ₀`.
- `monotone_testPower_thresholdTest`: its power function is nondecreasing.
- **Essential completeness** (`exists_one_sided_test_risk_le`): in such a family, consider a
  loss `L θ` of rejecting minus accepting that is positive below `θ₀` and negative above.
  Every test is matched at every `θ` by a threshold test in `T`, with a threshold in `EReal`.

### 6.4 Least favorable mixtures

- **Sufficiency** (`most_powerful_of_mixture_null`): for a Markov kernel `P : Kernel Θ X` and a
  prior `Λ`, let `φ` have level `α` at every null parameter and be most powerful at level `α`
  for the simple null `P ∘ₘ Λ` against `Q`. Then `φ` is most powerful at level `α` for the
  composite null.
- **Concentration** (`ae_testPower_eq_of_most_powerful_mixture`): if moreover `φ` has size `α`
  under `P ∘ₘ Λ`, then `testPower P φ = α` `Λ`-a.e., and `Λ` is least favorable: for every
  prior `Λ'`, the most powerful level-`α` test of `P ∘ₘ Λ'` against `Q` has power at least that
  of `φ`.

### 6.5 Interval tests in one-parameter families

For a one-parameter family `P_η = exponentialFamilyMeasure ν T η` with real `T`, `η` in an open
interval `U` inside the natural parameter space, and `T` not `ν`-a.e. constant:
- `exists_intervalWeight_integral_eq_setIntegral_quantile`: for a real law `μ` and
  `0 < a < b < 1`, an interval weight between `Q a ≤ Q b` integrates every integrable function
  like the window `(a, b)` of quantile levels (`Q = μ.quantile`);
- `exists_setIntegral_comp_quantile_eq_mul`: the window of levels with prescribed integral, by
  the intermediate value theorem;
- `exists_mul_exp_add_mul_exp_le_one_iff`: positive combinations `A e^{β₁ t} + B e^{β₂ t}`, with
  `β₁ < 0 < β₂`, that are at most `1` exactly on `[c₁, c₂]`;
- **UMP interval tests** (`exists_ump_interval_test`): for `η₁ < η₂` and `α ∈ (0, 1)`, an
  interval test in `T` of size exactly `α` at `η₁` and at `η₂` exists. It is UMP of level `α` for
  `η ≤ η₁ ∨ η ≥ η₂` against `η₁ < η < η₂`.

### 6.6 Unbiased tests and Neyman structure

- `hasDerivAt_integral_mul_exp`: differentiation under the integral in the natural parameter,
  with `abs_mul_exp_le_of_abs_sub_lt` and `exists_chord_of_const_mul_exp`.
- **Two-sided UMPU test** (`isUniformlyMostPowerfulUnbiasedTest_of_two_tail_moment_constraints`):
  the test rejecting outside `[c₁, c₂]` whose size is `α` and with `E[Tφ] = α E[T]` at `η₀` is UMPU
  of level `α` for `η = η₀` against `η ≠ η₀`. The proof:
  - the power of an unbiased test has zero derivative at `η₀`, which gives the two side
    conditions;
  - 6.2 then applies with the chord of the likelihood ratio.
- `isSimilarTest_of_unbiased`: for a parameter space with a topology, an unbiased level-`α` test
  with continuous power function is similar on `closure H₀ ∩ closure H₁`.
- **Neyman structure** (`condExp_eq_const_of_isSimilarTest`): for a boundedly complete sufficient
  `T`, every test similar of size `α` has `(P θ)[φ | σ(T)] = α` a.e. under every `θ`.

### 6.7 Conditional tests with a nuisance parameter

In the family of 3.7 with real `T` and nuisance statistic `S : X → EuclideanSpace ℝ (Fin l)`, the
setting is:
- `IsMinimalSplitStatistic ν T S`: no nontrivial `a T + ⟪b, S⟫` is `ν`-a.e. constant;
- the parameter `(η, ζ)` ranges over an open convex set `U` inside the natural parameter space
  that meets the hyperplane `η = η₀`.

The targets:
- **Two-sided** (`isUniformlyMostPowerfulUnbiasedTest_conditional_two_sided`): a test that
  rejects for `T` outside `[c₁(S), c₂(S)]` and accepts inside, with conditional size `α` and
  `E[Tφ | S] = α E[T | S]` at one point of the hyperplane, is UMPU of level `α` for `η = η₀`
  against `η ≠ η₀`.
- **One-sided** (`isUniformlyMostPowerfulUnbiasedTest_conditional_one_sided`): rejecting for
  `T > c(S)` with conditional size `α` gives the UMPU test of `η ≤ η₀` against `η > η₀`.

The proof:
- on the hyperplane, `S` is sufficient and complete for the boundary family (3.4, 3.7), so
  unbiased tests have Neyman structure (6.6);
- for almost every `s`, the conditional law of `T` given `S = s` is a one-parameter family in
  `η` (3.7), in which 6.3 and 6.6 apply;
- the conditional optimality integrates to unconditional optimality.

### 6.8 Invariance and duality

- `invariant_iff_factors_through_maximal_invariant`: for a maximal invariant `M` of a group
  action, a function is invariant iff it factors through `M` (`Function.FactorsThrough`).
- `mean_scale_ratio_eq_iff`: `x / s` is a maximal invariant of the scale group acting on pairs
  `(x, s)`, `s > 0`.
- 1.4 is the duality of tests and confidence sets.

### Examples

- For `N(θ, 1)` the one-sided `z`-test is UMP and the two-sided `z`-test is UMPU.
- For two Poisson counts the conditional binomial test of equal rates is the test of 6.7.

### Dependencies

Layers 1–3.

## Layer 7: decision theory

### 7.1 Criteria

For a class `D` of rules with risk functions `R : D → Θ → ℝ`:
- `IsAdmissibleRisk R δ`: no `δ'` has `R δ' ≤ R δ` everywhere with strict inequality somewhere;
- `IsBayesRule R π δ`: `R δ` is `π`-integrable, and `∫ R δ dπ ≤ ∫ R δ' dπ` for every `δ'` with
  integrable risk;
- `IsMinimaxRule R δ`: `R δ` is bounded above, and `⨆ R δ ≤ ⨆ R δ'` for every `δ'` with risk
  bounded above.

When the rules are the randomized rules, the class `D` is the subtype
`{κ : Kernel X A // IsMarkovKernel κ}` and `R` is `fun κ ↦ risk P L κ`. The bridge to Mathlib is
`isBayesRule_iff_isBayesEstimator`: for a bounded nonnegative measurable loss and a finite prior
`π`, `IsBayesRule` holds for this class iff Mathlib's `IsBayesEstimator` holds for the loss
`ENNReal.ofReal ∘ L`.

The three definitions compare a rule with different competitors: all rules, rules of
integrable risk, and rules of risk bounded above. The consequences below therefore assume that
every rule of `D` has `π`-integrable risk, which holds for instance for nonnegative bounded
measurable losses and a finite prior. Without it they are false: on `Θ = ℕ` with
`π {n} = 2^{-(n+1)}`, the risks `0` and `-2^{n+1}` make the first rule the unique Bayes rule,
although the second dominates it everywhere and has smaller supremum.
- `IsBayesRule.isAdmissibleRisk_of_unique`: for a finite prior `π`, if every rule of `D` has
  `π`-integrable risk and every Bayes rule for `π` has the same risk function as `δ`, then `δ`
  is admissible.
- `IsBayesRule.isAdmissibleRisk_of_pos`: for a topological `Θ` with an opens-measurable
  structure and a finite prior `π` that charges every nonempty open set, if every rule of `D`
  has continuous `π`-integrable risk, then every Bayes rule for `π` is admissible.
- `IsMinimaxRule.of_isBayesRule_of_risk_le`: for a probability prior `π`, if every rule of `D` has
  `π`-integrable risk and `δ` is Bayes for `π` with `R δ θ ≤ ∫ R δ dπ` for every `θ`, then `δ` is
  minimax, and `π` is least favorable: `∫ R δ dπ' ≤ ∫ R δ dπ` for every probability prior `π'`
  under which `R δ` is integrable, so no prior has larger Bayes risk. The prior must be a
  probability: with risk vectors `(1, 2)` and `(1.1, 1.1)` and the prior `2 δ₀`, the first rule
  is the unique Bayes rule and satisfies the risk bound, but it is not minimax.

### 7.2 Finite games and complete classes

- **Minimax theorem for finite statistical games** (`exists_statistical_game_saddle_point`): for
  finite nonempty parameter and action sets and probability laws `P θ`, there are a randomized
  rule `δ` and a prior `π` with `δ` Bayes for `π` and `risk δ θ ≤ ∫ risk δ dπ` for all `θ`. Hence
  `δ` is minimax and the minimax and maximin values agree.

  The proof has two steps.
  - `isCompact_riskSet`: the risk set `{(risk δ θ)_θ | δ}` of a finite game is compact and
    convex. With `μ = ∑ θ, P θ`, a rule is a measurable map from `X` to the simplex on the
    actions. The risk is `∑ₐ ∫ δₐ · L(θ, a) · dP θ/dμ dμ`, a continuous linear function of `δ`
    in `L²(μ)`, since the densities are at most `1`. The rules form a bounded closed convex set
    in `L²(μ)`, which is weakly compact (Banach–Alaoglu, `WeakDual.isCompact_polar`, through the
    Riesz isomorphism `InnerProductSpace.toDual`).
  - Sion's theorem (`exists_isSaddlePointOn`) applied to `(π, r) ↦ ∑ θ, π θ r θ` on the prior
    simplex times the risk set gives the saddle point.
- **Complete class theorem** (`exists_admissible_bayes_risk_le_of_closed_convex`): let `C` be a
  closed convex set of risk vectors in `ℝ^d`, `d > 0`, bounded below. Every point of `C` is
  dominated by an admissible point of `C` that is Bayes for a prior on the `d` parameter values.
  The proof separates the lower orthant at an admissible point.

### 7.3 Equivariance and admissibility

- **Averaging over a finite group** (`exists_equivariant_rule_risk_eq_average`): consider an
  invariant decision problem with a bounded measurable invariant loss and a finite group `G`.
  Every randomized rule has an equivariant rule whose risk at `θ` is the average of its risks
  over the orbit of `θ`.
- `IsMinimaxRule.exists_equivariant`: in that problem, if a minimax rule exists, an equivariant
  minimax rule exists.
- **Blyth's method** (`isAdmissibleRisk_of_blyth`): suppose the parameter set is a convex subset
  of Euclidean space with nonempty interior and the risk functions are continuous. Suppose
  finite measures `πₙ` with Bayes rules `δₙ` give uniformly positive mass to each convex set
  with nonempty interior, every rule of `D` has `πₙ`-integrable risk for every `n`, and
  `∫ R δ₀ dπₙ - ∫ R δₙ dπₙ → 0`. Then `δ₀` is admissible.

### 7.4 Simultaneous contrasts

- **Scheffé's contrast supremum** (`scheffe_contrast_supremum`): for `v` in a subspace `S`,
  `sup_{u ∈ S, u ≠ 0} ⟪u, v⟫² / (s² ‖u‖²) = ‖v‖² / s²`.
- **Scheffé's simultaneous intervals** (`hasConfidenceCoverage_scheffe`). Let `Y ~ N(μ, σ² I)` in
  `EuclideanSpace ℝ (Fin n)`, let `μ` range over a subspace `L` of dimension `q`, and let `σ²` be
  estimated from the residual in `Lᗮ` with `n - q` degrees of freedom. Then the intervals for all
  contrasts `⟪u, μ⟫`, `u ∈ S ⊆ L`, built from the F quantile hold simultaneously with
  probability `1 - α`. This uses 5.2, the projection laws of Tau Ceti, and the F law
  `TauCeti.Probability.fisherSnedecorMeasure`.

### 7.5 Comparison of experiments

- `likelihoodVector P`, `standardExperiment P` and `exists_dilation_of_convexOrder` (below).
- `IsMoreInformative P Q` (Blackwell): for every finite action set `Fin n` and every bounded loss,
  every randomized rule based on `Q` is matched at every parameter by a rule based on `P` with
  risk at most its risk.
- `IsGarbling.isMoreInformative`: a garbling is less informative (by 1.5).
- **Blackwell's theorem** (`isMoreInformative_iff_isGarbling`): for a finite parameter set,
  probability laws `P θ` on an arbitrary measurable space `X` and `Q θ` on a nonempty standard
  Borel space `Y`, `P` is more informative than `Q` iff `Q` is a garbling of `P`.

  For an empty parameter set both sides hold, by a constant kernel into `Y`. For a nonempty
  `Θ` with `d` elements, the proof:
  - `likelihoodVector P x = (dP θ / d∑P (x))_θ`, a measurable map into the simplex `Δ`, and
    `standardExperiment P`, the law `σ_P` of `likelihoodVector P` under the uniform mixture
    `d⁻¹ ∑ θ, P θ`, a probability measure on `Δ`. The law of `likelihoodVector P` under `P θ`
    is `d s_θ σ_P(ds)`. This is a forward map only; no kernel back into `X` is needed;
  - the Bayes risk of a finite decision problem is the same for `P` as for its likelihood
    vector, since a Bayes rule may be chosen measurably as a function of the posterior. It is a
    minimum of finitely many linear functions of the vector, so `IsMoreInformative P Q` says
    `∫ ψ dσ_P ≥ ∫ ψ dσ_Q` for every convex piecewise-linear `ψ` on `Δ`, hence for every
    continuous convex `ψ`;
  - **Strassen's theorem** (`exists_dilation_of_convexOrder`, a target here): for probability
    measures `σ, τ` on a compact convex subset of `ℝ^d` with `∫ ψ dσ ≤ ∫ ψ dτ` for every continuous
    convex `ψ`, there is a Markov kernel `D` with `τ = D ∘ₘ σ` and barycentre of `D s` equal to
    `s`. Its proof is the Hahn–Banach separation of `τ` from the weak-* compact convex set of
    such images;
  - Strassen applied to `σ_Q` and `σ_P` gives a dilation `D` with `σ_P = D ∘ₘ σ_Q`. Disintegrating
    the coupling `σ_Q ⊗ₘ D` on the standard Borel `Δ` along its second coordinate gives a
    Markov kernel `E` from `Δ` to `Δ`. Because `D s` has barycentre `s`, `E` carries the law of
    `likelihoodVector P` under `P θ` to that of `likelihoodVector Q` under `Q θ`, for every `θ`;
  - the likelihood vector of `Q` is sufficient (Layer 2.2), and `Y` is standard Borel, so its
    conditional law `condDistrib` gives a Markov kernel `K` from `Δ` to `Y` with
    `Q θ = K ∘ₘ (Q θ).map (likelihoodVector Q)`;
  - the composite of `likelihoodVector P`, `E` and `K` is the garbling.

### Examples

- Estimating a Bernoulli proportion with squared error: the constant-risk rule
  `(x + √n/2)/(n + √n)` is Bayes for a Beta prior and hence minimax by 7.1.
- A sample of size `n` is more informative than a sample of size `m ≤ n`, by the projection
  garbling.

### Dependencies

Layers 1–6.

## Layer 8: convergence and stochastic algebra

### 8.1 Adapters to Mathlib

- `tendstoInDistribution_of_map_eq`: the limit random variable matters only through its law.
- `tendstoInDistribution_id_iff`: convergence in law to `ν` with limit `id` is a.e.-measurability
  together with convergence of the laws in the `ProbabilityMeasure` topology.
- `tendstoInMeasure_iff_measureReal_lt_dist`: for a finite measure, convergence in measure in the
  form `∀ ε > 0, μ.real {ε < dist (f i) g} → 0`.
- The instance `isProbabilityMeasure_chiSquaredMeasure_natCast`, that is
  `IsProbabilityMeasure (chiSquaredMeasure k)` for `k : ℕ`, from Tau Ceti's
  `isProbabilityMeasure_chiSquaredMeasure` and `Nat.cast_nonneg`, so that the chi-squared laws
  serve as limits. The Tau Ceti lemma takes `0 ≤ k` as a hypothesis, which blocks instance
  synthesis.

### 8.2 Boundedness in probability

- `IsBoundedInProbability μ X`, for `X : ℕ → Ω → E` and `E` a seminormed group: for every `ε > 0`
  there is `C > 0` with `μ.real {C < ‖X n‖} ≤ ε` eventually. The sets are measured by the outer
  measure, so no measurability of `X n` is required.
- `isBoundedInProbability_iff_isTightMeasureSet`: for a finite-dimensional real normed space `E`
  with its Borel σ-algebra, a.e.-measurable `X n` and finite `μ`, boundedness in probability is
  tightness of the laws. In infinite dimension only boundedness follows: the unit vectors of
  `ℓ²` are bounded in probability, and their Dirac laws are not tight.
- `IsBoundedInProbability.of_tendstoInDistribution` and `.of_tendstoInMeasure`; also
  `exists_measureReal_lt_norm_le_of_tendstoInDistribution`.
- `IsBoundedInProbability.add`, `.smul_const`, `.of_norm_le`.

### 8.3 The algebra of convergence in probability

For real sequences under a finite measure:
- `tendstoInMeasure_add_zero`, `tendstoInMeasure_const_mul_zero` and
  `tendstoInMeasure_const_of_tendsto`;
- `tendstoInMeasure_zero_of_abs_le`: domination on events of probability tending to one;
- `tendstoInMeasure_comp_of_continuousAt`: continuous mapping to a constant;
- `tendstoInMeasure_mul_zero_of_isBoundedInProbability`: `O_P(1) · o_P(1) = o_P(1)`;
- `tendsto_zero_of_forall_eventually_le`.

### 8.4 Slutsky and the delta method

- **Slutsky without separability** (`tendstoInDistribution_of_tendstoInMeasure_sub_of_measurable`):
  if `Xₙ → Z` in law and `Yₙ - Xₙ → 0` in probability, with `Xₙ`, `Yₙ` measurable in a seminormed
  group with opens-measurable structure, then `Yₙ → Z` in law. Mathlib's
  `tendstoInDistribution_of_tendstoInMeasure_sub` assumes `[SecondCountableTopology E]`; this
  target does not.
- **Delta method** (`tendstoInDistribution_delta_method`): in normed spaces `E`, `F`, suppose
  `√n (Tₙ - θ) → Z` in law and `g` is differentiable at `θ` with derivative `D`. Then
  `√n (g Tₙ - g θ) → D Z` in law, and the remainder `√n (g Tₙ - g θ) - D (√n (Tₙ - θ))` tends to `0`
  in probability (`tendstoInMeasure_delta_method_remainder`).

### 8.5 i.i.d. sequences

- `IsIndependentIdenticallyDistributed μ X P`, for `X : ι → Ω → E` and any index type: the `X i`
  are measurable, mutually independent, and each has law `P`.
- `pairwise_indepFun_comp`, `identDistrib_comp`, `comp` (measurable statistics of an i.i.d.
  family are i.i.d.), and `map_pi_eq`: the law of `(X 0, …, X (n-1))` is `Measure.pi`.
- **Weak law** (`tendstoInMeasure_sampleMean_of_iid`): the sample mean of an integrable measurable
  statistic converges in probability to its mean, from Mathlib's strong law.
- **Central limit theorem** (`tendstoInDistribution_inv_sqrt_mul_sum_of_iid`): for a centred
  square-integrable measurable statistic `s`, `n^{-1/2} ∑ s(Xᵢ) → N(0, ∫ s² dP)` in law, from
  Mathlib's `tendstoInDistribution_inv_sqrt_mul_sum_sub`.
- `ae_tendsto_div_of_summable_integral_sq_div`: if `∑ₖ E[Zₖ²]/bₖ² < ∞` then `Zₖ/bₖ → 0`
  a.s. (Chebyshev and Borel–Cantelli).

### 8.6 Contiguity

- `IsContiguous l P Q`, for probability measures `P i`, `Q i` on spaces `Ω i` and a filter `l`:
  every measurable `A i` with `P i (A i) → 0` along `l` has `Q i (A i) → 0`.
- `IsContiguous.refl`, `.trans`, and `isContiguous_of_tvDist_tendsto_zero`.
- `IsContiguous.tendstoInMeasure`: convergence in `P`-probability to a constant implies
  convergence in `Q`-probability.
- `isContiguous_of_absolutelyContinuous_of_uniformlyIntegrable`: if `Q i ≪ P i` and the
  likelihood ratios `dQ i / dP i` are uniformly integrable under `P i`, then `Q` is contiguous to
  `P`.

### Examples

- `Xₙ = Z + 1/n` and `Xₙ = Z · (1 + 1/n)` for any `Z`.
- `√n (X̄ₙ² - μ²) → N(0, 4 μ² σ²)` by the delta method.

### Dependencies

Mathlib, and Tau Ceti's `chiSquaredMeasure` for the instance of 8.1.

## Layer 9: shared vocabulary

**The rule for this layer.** Layer 9 is a closed list: the objects below, each with its
definition and the elementary theory listed with it, which consists of finite-sample identities,
inequalities and measurability, with no limit theorems. They are the objects with which the five
areas named in the Summary start. Some serve one area only, such as the leapfrog map, the
sampling designs or the restricted isometry property; they are here so that each later roadmap
can start from definitions fixed in the conventions of this roadmap without depending on another
later roadmap. An object not on the list belongs to the roadmap of its area, even if it is
elementary: for example the Hodges–Lehmann estimator, a Gibbs sampler, or the log-rank test.

### 9.1 Empirical objects

- The empirical distribution of a finite sample `x : Fin n → E` is Tau Ceti's
  `empiricalFiniteMeasure x`, as a measure: `n⁻¹ ∑ᵢ δ_{xᵢ}`, the zero measure for `n = 0`. Its
  probability instance, integral formula `integral_empiricalFiniteMeasure`, and invariance
  under permutations `empiricalFiniteMeasure_comp_equiv` are suppliers, not targets. The
  sequence form `TauCeti.Probability.empiricalMeasure x n` uses the first `n + 1` terms; the
  adapter `empiricalMeasure_eq_empiricalFiniteMeasure` identifies it with
  `empiricalFiniteMeasure` of `x` on `Fin (n + 1)`. No second definition is introduced.
- `sampleMean x = n⁻¹ ∑ xᵢ` for `x : Fin n → E` in a real module, and `sampleAverage X n ω`, the
  mean of the first `n` observations of a sequence, with `sampleAverage_eq_sampleMean`.
- `empiricalCDF X n ω t = #{i < n | X i ω ≤ t} / n`. Its theory:
  - `empiricalCDF_eq_measureReal`: it is the distribution function of the empirical
    distribution `empiricalFiniteMeasure` of the first `n` observations, and
    `empiricalCDF_succ_eq_cdf_empiricalMeasure` relates it to `empiricalMeasure` at `n + 1`;
  - it is monotone and right-continuous, with limits `0` and `1` for `n > 0`, and values in
    `{k / n}`.
- `sampleQuantile X n ω p = sInf {t | p ≤ empiricalCDF X n ω t}` (the left empirical quantile).
  It is the `quantile` of the empirical distribution (`sampleQuantile_eq_quantile`) and satisfies
  the Galois inequality `sampleQuantile X n ω p ≤ t ↔ p ≤ empiricalCDF X n ω t` for `n > 0` and
  `p ∈ (0, 1]`.
- `uStatistic m n h x`: the average of `h (x ∘ f)` over the injections `f : Fin m → Fin n`. Its
  theory:
  - `uStatistic_comp_perm`: it is symmetric;
  - `integral_uStatistic`: it is unbiased for `∫ h d(Pᵐ)` under an i.i.d. sample with `m ≤ n`
    and `h` integrable;
  - `uStatistic_one`: for `m = 1` it is the sample mean of `h`.

### 9.2 Distances and scores

- **Total variation, statistical form.** These are real-valued adapters of Tau Ceti's
  `MeasureTheory.etvDist_eq_two_mul_iSup_sub` and `etvDist_le_two_mul_iff`, not a new
  development of the supremum theory. For probability measures:
  - `abs_measureReal_sub_le_tvDist_div_two`: `|P A - Q A| ≤ tvDist P Q / 2` for measurable `A`;
  - `tvDist_eq_two_mul_iSup`: `tvDist P Q = 2 ⨆_{A measurable} |P A - Q A|`;
  - `tvDist_eq_two_mul_measureReal_sub`: the supremum is attained at
    `{dP/d(P+Q) > dQ/d(P+Q)}`.
- `kolmogorovDistance P Q = sup_t |cdf P t - cdf Q t|`. Its theory:
  - it is a metric on probability measures on `ℝ`: symmetric, satisfies the triangle
    inequality, and is `0` iff `P = Q` (`ProbabilityTheory.cdf` determines the law);
  - `kolmogorovDistance_le_tvDist_div_two`.
- `kolmogorovSmirnovStatistic X P n ω = sup_{t ∈ ℚ} |empiricalCDF X n ω t - cdf P t|`, with
  `kolmogorovSmirnovStatistic_eq_kolmogorovDistance`: for `n > 0` and a probability measure `P`,
  it is the Kolmogorov distance from the empirical distribution to `P`, the rational supremum
  being the real one by right continuity. At `n = 0` the empirical distribution function is
  `0` while Mathlib's `cdf` of the zero measure is a distribution function, so the identity
  fails there.
  Hence it is measurable in `ω` for measurable `X i`.
- `huberScore k x = max (-k) (min k x)`. For `k ≥ 0` it is monotone, bounded by `k`, odd and
  `1`-Lipschitz, and it is the derivative of the Huber loss
  (`hasDerivAt_huberLoss`, with `huberLoss k x = x²/2` for `|x| ≤ k` and `k|x| - k²/2` otherwise).

### 9.3 Nonparametric and high-dimensional objects

- `finiteKernelDensityEstimator K h x t = (n h)⁻¹ ∑ K((t - xᵢ)/h)` and its sequence form
  `kernelDensityEstimator X K h n ω t`, with `kernelDensityEstimator_eq`. For `h > 0`, `n > 0`:
  - it is nonnegative for `K ≥ 0`;
  - `integral_finiteKernelDensityEstimator`: it integrates to `∫ K` for integrable `K`;
  - it is the density of the convolution of the empirical distribution with the law of density
    `K_h`, for a probability density `K`.
- The number of nonzero coordinates of `x : EuclideanSpace ℝ (Fin p)` is Mathlib's
  `hammingNorm (WithLp.ofLp x)`; no separate sparsity is defined. Also
  `restrictedL1Norm S x = ∑_{j ∈ S} |xⱼ|` and
  `bestSparseL1Error s x = inf {‖x - y‖₁ | hammingNorm y ≤ s}`. The targets:
  - `bestSparseL1Error_eq_zero_iff`: it is `0` iff `hammingNorm x ≤ s`;
  - it is antitone in `s` and at most `‖x‖₁`;
  - `bestSparseL1Error_eq_sum_compl`: it equals `restrictedL1Norm Sᶜ x` for a set `S` of `s`
    largest coordinates of `|x|`, so the infimum is attained;
  - `hammingNorm_add_le`: `hammingNorm (x + y) ≤ hammingNorm x + hammingNorm y`, from
    `hammingDist_triangle`.
- `HasRestrictedIsometry A s δ`: `(1 - δ)‖x‖² ≤ ‖A x‖² ≤ (1 + δ)‖x‖²` for every `s`-sparse `x`.
  It passes to smaller orders and larger constants, and `HasRestrictedIsometry.injOn` shows that
  for `δ < 1` and order `2s`, `A` is injective on `s`-sparse vectors.
- `benjaminiHochbergCount p α`: the largest `k ≤ m` with at least `k` p-values at most `k α / m`.
  It is at most `m`, monotone in `α`, and antitone in each p-value. For `0 ≤ α` the rejection
  set `{i | p i ≤ k α / m}`, with `k` this count, has exactly `k` elements
  (`card_benjaminiHochberg_rejections`). For negative `α` it can have more.

### 9.4 Bayesian and Monte Carlo objects

- `poissonMass θ x = e^{-θ} θˣ / x!` for real `θ`. `poissonMass_coe` identifies it with
  `poissonMeasure` on singletons for `θ ≥ 0`, and `hasSum_poissonMass` gives
  `∑ₓ poissonMass θ x = 1` for every real `θ`.
- On a finite state space `ι` with the discrete measurable structure, for weights `π : ι → ℝ`
  and a proposal `q : ι → ι → ℝ`: `metropolisAcceptance π q x y = min 1 (π y q y x / (π x q x y))`,
  equal to `1` when `π x q x y = 0`, and `metropolisKernel π q : Kernel ι ι`, which moves from `x`
  to `y ≠ x` with probability `q x y · metropolisAcceptance π q x y` and stays at `x` with the
  remaining probability. Write `weightMeasure π = ∑ x, π x • δ_x`. For positive `π` and a
  nonnegative `q` with rows summing to `1`:
  - `isMarkovKernel_metropolisKernel`;
  - `isReversible_metropolisKernel`: Mathlib's
    `Kernel.IsReversible (metropolisKernel π q) (weightMeasure π)`. This is the computation that
    the acceptance rule gives detailed balance.

  Invariance is then Mathlib's `Kernel.IsReversible.invariant`, not a target. Further chain
  theory is MarkovChainsAndRenewal's.
- `leapfrogStep g h z`, one leapfrog step with identity mass matrix, and
  `momentumFlip (x, p) = (x, -p)`. The targets:
  - `leapfrogStep_reversible`: the composite
    `momentumFlip ∘ leapfrogStep g h ∘ momentumFlip ∘ leapfrogStep g h` is the identity;
  - `measurePreserving_leapfrogStep`: for measurable `g`, it preserves Lebesgue measure, being a
    composition of shears;
  - `leapfrogStep_injective`.
- `normalPosterior prior v n m`: the normalized measure with density
  `prior θ · exp(-n (θ - m)²/(2v))`. For `v > 0` and a nonnegative measurable prior for which
  this density has positive finite integral:
  - `isProbabilityMeasure_normalPosterior`;
  - `normalPosterior_gaussian`: for a `N(μ₀, τ²)` prior it is `N` with precision
    `n/v + 1/τ²` and the precision-weighted mean.
- `integral_comp_eq_sum_measureReal` and `integrable_comp_of_finite`: integrals of functions of a
  finitely valued random variable.

### 9.5 Linear-model and design objects

- `matrixQuadraticForm A x = ⟪x, A x⟫` on `EuclideanSpace ℝ (Fin d)`, with
  `measurable_matrixQuadraticForm`, `continuous_matrixQuadraticForm`, and its nonnegativity for
  positive semidefinite `A`.
- `scatterMatrix x = ∑ᵢ (xᵢ - x̄)(xᵢ - x̄)ᵀ`. It is symmetric and positive semidefinite, and
  `scatterMatrix_eq_sum_sub`: it equals `∑ xᵢ xᵢᵀ - n x̄ x̄ᵀ`.
- `gaussianNegLogLikelihood x m C = (n/2) log det C + ½ ∑ (xᵢ - m)ᵀ C⁻¹ (xᵢ - m)`. The target
  `gaussianNegLogLikelihood_ge`: for `n > 0` and positive definite `scatterMatrix x`, it is
  minimized over `m` and positive definite `C` at `(x̄, scatterMatrix x / n)`.
- `Matrix.inv_smul_of_ne_zero`: `(c • A)⁻¹ = c⁻¹ • A⁻¹` for `c ≠ 0`, singular `A` included.
- `simpleRandomSampleDesign N n`, the uniform law on the `n`-subsets of `Fin N`, on the discrete
  measurable space of finsets. The targets:
  - `isProbabilityMeasure_simpleRandomSampleDesign` for `n ≤ N`;
  - `simpleRandomSampleDesign_inclusion`: for `1 ≤ N` and `n ≤ N`, each unit has inclusion
    probability `n/N`; for `2 ≤ N` and `n ≤ N`, each pair of distinct units has inclusion
    probability `n(n-1)/(N(N-1))`.
- `populationMean y` (divisor `N`) and `populationVariance y` (divisor `N - 1`). The targets:
  - `integral_sampleMean_simpleRandomSampleDesign`: for `1 ≤ n ≤ N`, the sample mean of a simple
    random sample is unbiased for `populationMean`;
  - `variance_sampleMean_simpleRandomSampleDesign`: for `2 ≤ N` and `1 ≤ n ≤ N`, its variance is
    `(1 - n/N) populationVariance y / n`.
- `IsLatinSquare L` and `OrthogonalLatinSquares L M`. The targets:
  - `isLatinSquare_add`: `(i, j) ↦ i + j` in `ZMod s` is a Latin square;
  - `orthogonalLatinSquares_add_mul`: for prime `s`, with `Fin s` identified with `ZMod s`, the
    squares `(i, j) ↦ i + a j` for distinct nonzero `a` are Latin and mutually orthogonal.

### 9.6 Dependent-data and survival objects

- `IsWeaklyStationary 𝕜 X`: `⟪X s, X t⟫ = ⟪X 0, X (t - s)⟫` for `X : ℤ → H` in an inner product
  space over `𝕜`. The targets:
  - `IsWeaklyStationary.inner_eq_inner_sub_zero`;
  - `.inner_neg`: the autocovariance `γ h = ⟪X 0, X h⟫` has `γ (-h) = conj (γ h)`;
  - `.posSemidef`: the matrix `(γ (j - i))_{i, j ∈ s}` is positive semidefinite for every finite
    set `s` of indices.
- `IsIIDNoise μ Z σ²`, for a probability measure `μ`: an i.i.d. family indexed by `ℤ` (8.5),
  integrable with mean `0`, and with second moment `σ² > 0`. The targets:
  - `memLp_two`, `integral_eq_zero'`, `integral_sq'` and `identDistrib` at every index;
  - `IsIIDNoise.isWeaklyStationary`: in `L²`, the centred noise is weakly stationary with
    `γ h = σ² 1_{h = 0}`;
  - `memLp_id_two_of_variance_pos`: a law with positive variance has a finite second moment.
- `sampleAutocovariance X h n ω = n⁻¹ ∑_{i < n-h} (X_{i+h} - X̄)(X_i - X̄)`. The target
  `sampleAutocovariance_posSemidef`: with divisor `n`, the matrix `(γ̂(|i - j|))_{i, j < k}` is
  positive semidefinite for every `k`.
- For failure times `T` and censoring times `C` of subjects `i < n`, the observed time of `i` is
  `min (T i) (C i)` and its failure is observed when `T i ≤ C i`. At a time `s`:
  - `atRiskCount T C n ω s`, the number of subjects with observed time at least `s`;
  - `failureCount T C n ω s`, the number of observed failures at time exactly `s`;
  - `observedFailureTimes T C n ω t`, the finite set of distinct observed failure times `≤ t`.

  Then `nelsonAalenEstimator T C n ω t = ∑_s d(s) / Y(s)` and
  `kaplanMeierEstimator T C n ω t = ∏_s (1 - d(s) / Y(s))`, over `s` in
  `observedFailureTimes T C n ω t`, with `d = failureCount` and `Y = atRiskCount`. Tied failures
  enter through one factor `1 - d/Y`: two subjects failing together at the only failure time
  give `0`, not `(1 - 1/2)²`. The targets:
  - `kaplanMeierEstimator_eq_prod_subject`: when the observed failure times are distinct, the
    estimator is the product over observed failures `i` of `1 - 1 / Y(T i)`, and likewise for
    Nelson–Aalen;
  - `kaplanMeierEstimator_mem_Icc` and `antitone_kaplanMeierEstimator`;
  - `nelsonAalenEstimator_nonneg` and `monotone_nelsonAalenEstimator`;
  - `kaplanMeierEstimator_eq_one_sub_empiricalCDF`: when every failure is observed
    (`T i ≤ C i` for `i < n`) and the failure times are distinct, Kaplan–Meier is one minus the
    empirical distribution function of the failure times;
  - `kaplanMeierEstimator_le_exp_neg_nelsonAalen`.

### Examples

- The empirical distribution function of `(0.3, 0.1)` at `0.2` is `1/2`.
- The Metropolis–Hastings kernel for a symmetric proposal accepts with probability
  `min 1 (π y / π x)`.

### Dependencies

Layer 8 for the sequence forms; otherwise Mathlib only.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **The rest of the finite-sample theory of the standard texts**:
  - the likelihood principle and Birnbaum's theorem;
  - minimal sufficiency of the likelihood ratio on a countable sample space with an uncountable
    parameter set (2.2 covers the countable parameter set);
  - the multiparameter (Loewner) information inequality `Cov W ≥ G I⁻¹ Gᵀ`, equality in the
    information inequality, and the Chapman–Robbins and nuisance-parameter information bounds;
  - invariance of maximum likelihood and finite-sample likelihood ratio tests;
  - two-sample `t` procedures, quantile and exact binomial intervals, Fisher's exact test,
    `p`-values, exact inference for a normal variance;
  - bias–variance decompositions;
  - pivots and shortest intervals, Pratt's theorem, conditional inference in location families;
  - Bayes rules via posterior risk, extended Bayes rules, and minimax estimation of a binomial
    proportion beyond the example of Layer 7;
  - the Pitman estimator of scale, and the Girshick–Savage theorem that the Pitman estimator of
    location is minimax among all estimators;
  - the Hunt–Stein theorem for compact and amenable groups (7.3 covers finite groups);
  - the remaining decision theory of the normal mean: `p` is the minimax risk in every
    dimension, `X` is admissible for `p = 1` and `p = 2` (Blyth's method applied to
    `N(θ, 1)`), and the positive-part James–Stein estimator dominates James–Stein;
  - Kullback–Leibler divergence in exponential families;
  - unbiased confidence sets and uniformly most accurate procedures;
  - the UMPU test of an interval null in a one-parameter exponential family, and the absence of a
    UMP test for it (6.5 covers the complementary problem);
  - UMP invariant normal tests, and the UMP chi-squared test of `σ ≤ σ₀` for a normal sample with
    unknown mean (6.4 covers the abstract least favorable theorem);
  - Bonferroni, Tukey, Holm and closed testing;
  - total variation bounds for tests.
- **Asymptotic theory**: consistency and asymptotic normality of M- and Z-estimators, local
  asymptotic normality, Le Cam's lemmas, efficiency and the bootstrap.
- **Nonparametric, Bayesian, linear-model, time-series and survival theory** beyond the
  vocabulary of Layer 9, and every object not listed in Layer 9.

## Prior formalization

Layers 1–7 are formalized in `CKSD/Inference/` of
[lean-CKSD](https://github.com/bjbraams/lean-CKSD), the Core Knowledge of Statistics and Data
Science project, and Layers 8 and 9 in its shared `Basic.lean` files. Most targets are proved
there. The minimax theorem of 7.2, Blackwell's theorem 7.5, the
Pitman–Koopman–Darmois theorem 3.8 and the conditional tests of 6.7 are stated there with
admitted proofs. The completions this roadmap adds are not there:
- `isSufficientStatistic_iff_condExp`;
- the regular form of the information inequality;
- the optimality of U-statistics in 4.2;
- Neyman–Pearson necessity and the sum-of-errors form;
- least favorable concentration;
- Scheffé's intervals;
- contiguity beyond the definition;
- most of the Layer 9 theory.

`CKSD/Processes/Basic.lean` defines Kaplan–Meier and Nelson–Aalen with one factor per failed
subject, which is wrong for tied failures; 9.6 defines them per distinct failure time.
`CKSD` also has its own empirical distribution, where 9.1 uses Tau Ceti's.

The map, which is not prescriptive:

| Layer | lean-CKSD files |
|---|---|
| 1 | `Inference/Basic.lean`, `Model.lean`, `Density.lean`, `Factorization.lean` (mixtures) |
| 2 | `Sufficiency.lean`, `Factorization.lean`, `ExponentialFamily.lean` (2.2), `Families.lean`, `SymmetricCompleteness.lean`, `Estimation.lean` (Basu) |
| 3 | `ExponentialFamily.lean`, `LaplaceDeterminacy.lean`, `LogPartition.lean`, `MeanParametrization.lean`, `ExponentialFamilyMLE.lean`, `ConditionalExponentialFamily.lean`, `Decision.lean` (3.5) |
| 4 | `Estimation.lean`, `Gaussian.lean`, `Families.lean` (Pitman) |
| 5 | `Families.lean`, `Testing.lean` (Gaussian sample laws) |
| 6 | `NeymanPearson.lean`, `Testing.lean`, `IntervalTestConstruction.lean`, `InvariantTesting.lean`, `ConditionalExponentialFamily.lean` |
| 7 | `Decision.lean`, `Gaussian.lean` (Scheffé) |
| 8 | `Inference/Basic.lean`, `Asymptotics/Basic.lean`, `Bayes/Basic.lean` (8.5) |
| 9 | `Asymptotics/Basic.lean`, `Nonparametric/Basic.lean`, `Bayes/Basic.lean`, `LinearModels/Basic.lean`, `Processes/Basic.lean` |

Related libraries:
- [Statlib](https://github.com/stat-lib/statlib) develops divergences, binary hypothesis
  testing, contiguity and quadratic-mean differentiability on Mathlib's kernel vocabulary.
  Its contiguity is stated, as in 8.6, for probability measures on sample spaces that vary
  along a filter.
- The open Mathlib pull requests
  [#27579](https://github.com/leanprover-community/mathlib4/pull/27579) (risk, DeGroot
  information and total variation) and
  [#39791](https://github.com/leanprover-community/mathlib4/pull/39791) (Neyman–Pearson) are
  followed as stated in the Conventions.

## References

- D. Blackwell, Equivalent comparisons of experiments, *Ann. Math. Statist.* 24 (1953), 265–272.
- L. D. Brown, *Fundamentals of Statistical Exponential Families*, IMS Lecture Notes 9, 1986.
- T. S. Ferguson, *Mathematical Statistics: A Decision Theoretic Approach*, Academic Press, 1967.
- E. L. Lehmann and G. Casella, *Theory of Point Estimation*, 2nd ed., Springer, 1998.
- E. L. Lehmann and J. P. Romano, *Testing Statistical Hypotheses*, 4th ed., Springer, 2022.
- M. Sion, On general minimax theorems, *Pacific J. Math.* 8 (1958), 171–176.
- A. W. van der Vaart, *Asymptotic Statistics*, Cambridge University Press, 1998 (Layer 8).

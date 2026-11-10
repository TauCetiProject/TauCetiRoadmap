# Roadmap: foundations of mathematical statistics

**Summary.** This roadmap builds the finite-sample core of mathematical statistics on Mathlib's
measure theory, Markov kernels and decision-theoretic risk:
- statistical experiments, densities and tests;
- sufficiency, completeness, ancillarity and U-statistics;
- natural exponential families;
- unbiased estimation and information;
- order statistics and the Gaussian sampling laws;
- the Neyman–Pearson theory of tests, from the lemma to unbiased and conditional tests;
- decision theory: minimax and Bayes rules, complete classes, admissibility, equivariance and
  Blackwell's comparison of experiments.

It also builds a **starting vocabulary for later statistics roadmaps**:
- convergence in probability and in law, and their stochastic algebra;
- i.i.d. sequences and the laws of large numbers for statistics;
- contiguity;
- empirical distributions and the elementary estimators, distances and procedures of
  asymptotic, nonparametric, Bayesian, linear-model, time-series and survival statistics.

The material is the standard graduate content of Pfanzagl, Schervish, Brown and Ferguson (see
[References](#references)). Each headline carries a locator in a text listed under References.

**This roadmap is a base.** Layers 8 and 9 provide vocabulary for later roadmaps on five areas:
asymptotic and robust statistics; nonparametric and high-dimensional statistics; Bayesian
statistics and stochastic computation; linear models and design; and dependent data, stochastic
models and survival analysis. The aim is that each such roadmap needs this one and none of the
others. Layer 9 is a closed list, stated by its own rule (see [Layer 9](#layer-9-shared-vocabulary)).

`Suggested.lean` states every headline of Layers 1–8 against the pinned Mathlib and Tau Ceti,
with the definitions those statements need. Layer 9 has no headlines.

Suggested home: `TauCeti/Statistics/`, with one subdirectory per layer.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Experiments, densities and tests.** Real densities, countable mixtures and domination,
   randomized tests and their power, confidence sets, risk of randomized rules, and garblings.
2. **Sufficiency and completeness.** The factorization theorem, minimal sufficiency, Basu's
   theorem, completeness of symmetric statistics, and U-statistics.
3. **Natural exponential families.** Convexity, Laplace determinacy, analyticity and moments of
   the log partition function, completeness, the mean parametrization, maximum likelihood,
   conditional families and the Pitman–Koopman–Darmois theorem. The family law is Mathlib's
   exponential tilt `Measure.tilted`, and the case `E = ℝ` of 3.1–3.3 is already Mathlib's:
   `integrableExpSet`, `convex_integrableExpSet`, `cgf`, `analyticOnNhd_cgf`,
   `integral_tilted_mul_self` and `variance_tilted_mul`
   (`Mathlib/Probability/Moments/IntegrableExpMul.lean`, `Basic.lean`, `MGFAnalytic.lean`,
   `Tilted.lean`). Layer 3 owns the finite-dimensional case.
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
   finite group, Blyth's method, Scheffé's simultaneous intervals, and Blackwell's comparison
   theorem.
8. **Convergence and stochastic algebra.** Boundedness in probability, the adapters to Mathlib's
   convergence in law and in measure, Slutsky's lemma without separability, the delta method,
   i.i.d. sequences with the weak law of large numbers, and contiguity.
9. **Shared vocabulary.** Empirical distributions and quantiles; Kolmogorov and total variation
   distances; the Huber score; kernel density estimators; sparse vectors and the restricted
   isometry property; the Benjamini–Hochberg count; the Poisson likelihood, Metropolis–Hastings
   and leapfrog maps and the normal-location posterior; sample means, scatter matrices and the
   Gaussian likelihood; simple random sampling and Latin squares; weak stationarity, i.i.d.
   noise and the sample autocovariance; the Nelson–Aalen and Kaplan–Meier estimators.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- the probability distributions themselves (Gaussian, chi-squared, Student, Fisher–Snedecor,
  beta, Poisson, quantile functions). They are Mathlib's and Tau Ceti's, as built by
  [StandardDistributions](../StandardDistributions/README.md), which leaves statistical
  inference out of its scope;
- the order-statistic facts that StandardDistributions (4.6) and the pinned Tau Ceti provide: the
  definition `TauCeti.orderStatistic`, its distribution function
  `cdf_map_orderStatistic_pi_eq_regularizedIncompleteBeta`, the beta law of a uniform order
  statistic, the joint density of uniform order statistics, and the chamber formula
  `map_orderStatistics_pi`. Layer 5 builds only what StandardDistributions excludes: the joint
  and marginal densities for a general density, and the law of the ranks;
- Markov chain theory, including invariance, detailed balance in Mathlib's `Kernel.IsReversible`
  form and its finite-matrix adapters
  ([MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md), Layer 3). 9.4 only checks that
  the Metropolis–Hastings kernel is reversible;
- sampling from a finite population: Tau Ceti's
  `TauCeti.Probability.sampleWithoutReplacement`, the uniform law on injective selections, owned
  by [Exchangeability (completed)](../../Completed/Exchangeability/README.md), Layer 8. The
  simple random sampling design of 9.5 is Mathlib's `uniformOn` on the `n`-subsets, and 9.5
  relates the two;
- the central limit theorem: Mathlib's `tendstoInDistribution_inv_sqrt_mul_sum_sub`, applied to
  a statistic `s ∘ Xᵢ` of an i.i.d. sequence through the i.i.d. adapters of 8.5.

Asymptotic theory beyond the stochastic algebra of Layer 8, and every result that is not listed
in a layer, belongs to the [boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in `TauCeti`, with Mathlib's `ProbabilityTheory` and
  `MeasureTheory` opened throughout. `Suggested.lean` states the prototypes in the namespace
  `TauCetiRoadmap.MathematicalStatisticsFoundations`.
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
  nonnegative bounded loss this is the real form of Mathlib's `∫⁻ y, ℓ θ y ∂((κ ∘ₖ P) θ)`.
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
  `F` has values in `WithLp 2 (E × F)`, through `WithLp.toLp`. No separate split exponential
  family is defined: a family in a pair statistic is the family of
  `fun x ↦ WithLp.toLp 2 (T x, S x)`.
- **Total variation** is Mathlib's `tvDist`, the total variation norm of `P - Q`, with values in
  `[0, 2]` for probability measures. The statistical normalization `sup_A |P A - Q A|` is
  `tvDist P Q / 2` (9.2). It is not a separate definition.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references). A locator marked *by the same argument* names the theorem whose
  proof the target follows when the target's hypotheses differ from those printed.

## Exact supplier contracts

### From Mathlib

- **Measures and kernels:** `Measure.withDensity`, `Measure.rnDeriv`, `Measure.pi`, `Kernel`,
  `IsMarkovKernel`, composition `κ ∘ₘ μ`, composition product `μ ⊗ₘ κ`, `Kernel.withDensity`,
  `condDistrib`, `condExp` (notation `μ[f | m]`), `StandardBorelSpace`, `uniformOn` with
  `isProbabilityMeasure_uniformOn`.
- **Probability:** `iIndepFun`, `IndepFun`, `IdentDistrib`, `HasLaw`, `variance` (`Var[X; μ]`),
  `covariance` (`cov[X, Y; μ]`), `memLp_two_of_variance_ne_zero`, `cdf`, `gaussianReal`,
  `multivariateGaussian`, `stdGaussian`, `poissonMeasure`, `betaMeasure`, the strong law
  `ProbabilityTheory.strong_law_ae`, the central limit theorem
  `tendstoInDistribution_inv_sqrt_mul_sum_sub`, the characteristic function and
  `Measure.ext_of_charFun`.
- **Convergence:** `TendstoInMeasure`, `TendstoInDistribution`,
  `TendstoInDistribution.continuous_comp`, `tendstoInDistribution_of_tendstoInMeasure_sub`,
  `IsTightMeasureSet`, `isTightMeasureSet_range_iff_tendsto_limsup_measure_norm_gt`,
  `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`.
- **Decision theory:** `avgRisk`, `bayesRisk`, `minimaxRisk`, `IsBayesEstimator` and the
  posterior `P†π` of `Mathlib/Probability/Decision`.
- **Divergences:** `tvDist`, `etvDist`, `klDiv`.
- **Tilting and cumulants:** `Measure.tilted` with `isProbabilityMeasure_tilted`, `tilted_tilted`,
  `tilted_absolutelyContinuous` and `absolutelyContinuous_tilted`
  (`Mathlib/MeasureTheory/Measure/Tilted.lean`); the scalar case of Layer 3: `integrableExpSet`,
  `convex_integrableExpSet`, `cgf`, `analyticOnNhd_cgf`, `integral_tilted_mul_self` and
  `variance_tilted_mul`.
- **Analysis:** Sion's minimax theorem (`Sion.minimax'`, `Sion.exists_isSaddlePointOn`) and
  `IsSaddlePointOn`; Banach–Alaoglu (`WeakDual.isCompact_polar`) and `InnerProductSpace.toDual`;
  analytic functions (`AnalyticOnNhd`, `HasFPowerSeriesOnBall`);
  `hasSum_integral_of_dominated_convergence` and
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; integration by parts
  `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable`; convex hulls, the separation theorems
  `geometric_hahn_banach_open_point` and `geometric_hahn_banach_point_closed`, Jensen's
  inequality `ConvexOn.map_integral_le`, and the inverse function theorem
  (`HasStrictFDerivAt.toOpenPartialHomeomorph`) with its analytic form
  `OpenPartialHomeomorph.analyticAt_symm`.
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
- **Finite populations:** `TauCeti.Probability.sampleWithoutReplacement` with
  `isProbabilityMeasure_sampleWithoutReplacement`.

### From StandardDistributions

[StandardDistributions](../StandardDistributions/README.md) is the owner of the laws above. This
roadmap consumes its 4.6 (extrema and order statistics: the uniform order statistics, their beta
laws and the chamber formula), its 7.2 (lower and upper quantiles), its 7.8 (exponential tilting,
built on Mathlib's `Measure.tilted`, which is the family law of Layer 3) and its Gaussian,
chi-squared, Student and Fisher–Snedecor laws in Layers 1 and 4. Where these are already in the
pinned Tau Ceti, the names above are the contract. Layer 5 takes nothing from 4.6 that 4.6
excludes.

### From MarkovChainsAndRenewal

[MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md), Layer 3, owns stationarity and
detailed balance, stated with Mathlib's `Kernel.Invariant` and `Kernel.IsReversible`. 9.4 proves
only that the Metropolis–Hastings kernel satisfies `Kernel.IsReversible`, and consumes
`Kernel.IsReversible.invariant` for invariance. No other chain theory is used.

### From Exchangeability (completed)

[Exchangeability](../../Completed/Exchangeability/README.md), Layer 8, owns the finite sampling
laws `sampleWithoutReplacement` and `sampleWithReplacement`. 9.5 consumes the first and proves
that the law of its image set is the simple random sampling design.

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

The layers are in build order: each layer needs only earlier layers and the suppliers. Layers 8
and 9 need none of Layers 2–7 and may be built first. They contain everything the other
statistics roadmaps share.

## Layer 1: experiments, densities and tests

### 1.1 Real densities

- `HasDensity P μ f` (Conventions).
- The integral transfer: `∫ g dP = ∫ f g dμ` for every `g`, with no integrability hypothesis
  (both sides are the junk `0` together); `g` is `P`-integrable iff `f g` is `μ`-integrable; a
  finite `P` with a density has an integrable density, and a probability `P` a density of
  integral `1`.
- The same transfer for `ν.withDensity (ENNReal.ofReal ∘ f)` with `f` everywhere nonnegative and
  measurable, and for its pushforwards; and the pushforward of a density that factors through a
  map: `(ν.withDensity (k ∘ φ)).map φ = (ν.map φ).withDensity k`.

These are Schervish, Thm A.54, p. 591 (a nonnegative measurable density defines a measure), and
Thm A.74 with (A.76), pp. 597–598 (`∫ g dP = ∫ g f dμ` for `P`-integrable `g`); the transfer
without an integrability hypothesis is by the same argument, with Lean's junk value `0` on both
sides.

*Needs:* Mathlib `Measure.withDensity`, `integral_withDensity_eq_integral_toReal_smul`.

**Checks.**

- `HasDensity`: for `P` uniform on `[0, 1]`, `μ = volume` and `f = 1` on `[0, 1]`, `0` elsewhere,
  `HasDensity P μ f` holds; `f = 1` everywhere fails, since it gives `μ` itself.
- `HasDensity`: `f = -1` on a `μ`-null set and `1` on `[0, 1]` is still a density; `f = -1` on
  `[0, 1/2]` is not, being negative on a set of positive measure.
- The transfer: `P` uniform on `[0, 1]`, `g x = x` gives `∫ g dP = 1/2 = ∫ f g dμ`; `g x = 1/x`
  gives the junk `0` on both sides, and neither side is integrable.

### 1.2 Countable mixtures and domination

- `mixtureWeight n = 2^{-(n+1)}` and `countableMixture P θs = ∑ₙ mixtureWeight n • P (θs n)`. The
  weights sum to `1`, the mixture of probability laws is a probability law, a set is null for the
  mixture iff it is null for every component, every component is absolutely continuous with
  respect to the mixture, and the mixture of laws with densities has the mixed density.
- **Halmos–Savage lemma** (`exists_absolutelyContinuous_countableMixture`): a nonempty family with
  densities with respect to a σ-finite `μ` is dominated by one of its countable mixtures
  (Pfanzagl, Lemma 1.2.1, p. 4; Schervish, Thm A.78, p. 600).

*Needs:* 1.1; Mathlib `Measure.sum`, `ENNReal.tsum_geometric`.

**Checks.**

- `mixtureWeight`: the values at `0` and `2` are `1/2` and `1/8`; the weights `2^{-n}` would give
  `1` at `0`.
- `mixtureWeight`: the sum over `ℕ` is `1`; the weights `2^{-n}` would sum to `2`.
- `mixtureWeight`: every weight is positive, so a set that is null for a mixture is null for
  every component.
- `countableMixture`: for `P n = δₙ` on `ℕ` and `θs = id`, the mixture gives `{3}` the mass `1/16`
  and charges every point.
- `countableMixture`: for `θs` constant `θ₀`, the mixture is `P θ₀`.
- `countableMixture`: for `P θ = δ_θ` on `ℝ` and `θs n = 1/(n + 1)`, the mixture gives `{1}` the
  mass `1/2` and `(0, 1/2]` the mass `1/2`, and `{0}` the mass `0` although `0` is a limit of the
  atoms.

### 1.3 Tests and their power

- `IsStatisticalTest φ`. Constants in `[0, 1]` and `1 - φ` are tests; a test is integrable for
  every finite measure, as is its product with an integrable function; its integral under a
  probability lies in `[0, 1]`.
- `testPower P φ θ = ∫ φ dP θ`.
- `HasTestLevel P H₀ α φ`: `φ` is a test whose power is at most `α` at every `θ ∈ H₀`. This is
  stated pointwise, so that no supremum over a possibly empty `H₀` is taken.
- `IsSimilarTest P B α φ`: power `α` at every `θ ∈ B`.
- `IsUniformlyMostPowerfulTest P H₀ H₁ α φ` and `IsUniformlyMostPowerfulUnbiasedTest P H₀ H₁ α φ`.
  The latter also requires power at least `α` on `H₁`, and its competitors are the unbiased
  level-`α` tests. Both imply the level.
- `thresholdTest T c γ x`: `1` if `c < T x`, `γ` if `T x = c`, `0` otherwise, for `T` with values
  in a linear order. `intervalTest t c₁ c₂ γ₁ γ₂`: `1` on `(c₁, c₂)`, `γᵢ` at `cᵢ`, `0` otherwise.
  Both are tests for measurable statistics and randomizations in `[0, 1]`.

These are Schervish's test function, power function, level and size (Schervish, Def 4.4,
p. 215), uniformly most powerful tests (Schervish, Def 4.34, p. 230), and unbiased and similar
tests (Schervish, Def 4.91, p. 254).

*Needs:* 1.1; Mathlib `Integrable.bdd_mul`.

**Checks.**

- `thresholdTest id 0 (1/2)` takes the values `0, 1/2, 1` at `-1, 0, 1`.
- `thresholdTest id 2 0` on `ℕ` takes the values `0, 0, 1` at `1, 2, 3`.
- `thresholdTest id 0 1` is the indicator of `{x ≥ 0}`: its value at `0` is `1`, where the strict
  threshold alone would give `0`.
- `intervalTest t 0 1 α α` takes the values `α, 1, α, 0` at `t = 0, 1/2, 1, 2`.
- `intervalTest 0 0 0 γ₁ γ₂ = γ₁`: for `c₁ = c₂` the open interval is empty and the left endpoint
  clause applies.
- `intervalTest (1/2) 1 0 γ₁ γ₂ = 0`: for `c₁ > c₂` the test rejects nowhere.
- `IsStatisticalTest`: the constant `1/2` is a test; `2` and the non-measurable indicator of a
  Vitali set are not.
- `testPower`: for `P θ = N(θ, 1)` and the indicator of `{x > 1.645}`, the power is about `0.05`
  at `θ = 0` and `0.259` at `θ = 1`.
- `testPower`: the constant test `α` has power `α` at every `θ`.
- `testPower`: for `P θ = Bern(θ)` on `{0, 1}`, the test `φ x = x` has power `θ` and `1 - φ` has
  power `1 - θ`.
- `HasTestLevel` with `H₀ = ∅`: every test has every level, even `α = -1`.
- `HasTestLevel`: for `N(θ, 1)` the indicator of `{x > 1.645}` has level `0.05` on `H₀ = (-∞, 0]`,
  where its power is at most `0.05`, and not on `H₀ = (-∞, 1]`, where its power at `1` is `0.259`.
- `HasTestLevel`: the constant `-1` has power `-1 ≤ α` everywhere but is not a test, so it has no
  level.
- `IsSimilarTest`: the constant `α` is similar of size `α` on every set.
- `IsSimilarTest`: the indicator of `{x > 1.645}` under `N(θ, 1)` is not similar on `{0, 1}`.
- `IsSimilarTest`: on `B = ∅` every test is similar of every size, even `5`.
- `IsUniformlyMostPowerfulTest`: for `Θ = {0, 1}`, `H₀ = {0}`, `H₁ = {1}`, the Neyman–Pearson test
  above is UMP at level `0.05`; the constant `0.05` has level `0.05` but power `0.05 < 0.259`, so
  it is not.
- `IsUniformlyMostPowerfulTest`: for `H₁ = ∅` every test of level `α` is UMP.
- `IsUniformlyMostPowerfulTest`: for `H₀ ≠ ∅` and `α < 0` no test has level `α`, so none is UMP;
  for `α ≥ 1` the constant `1` is UMP.
- `IsUniformlyMostPowerfulUnbiasedTest`: the constant `α` is unbiased of level `α`; a test with
  power below `α` somewhere on `H₁` is not unbiased.
- `IsUniformlyMostPowerfulUnbiasedTest`: in the two-point problem above, the Neyman–Pearson test
  is UMPU at level `0.05`, being UMP with power `0.259 ≥ 0.05`; the constant `0.05` is unbiased but
  not UMPU.
- `IsUniformlyMostPowerfulUnbiasedTest`: for `H₁ = ∅` every test of level `α` is UMPU.

### 1.4 Confidence sets

- `HasConfidenceCoverage P C α`: for every `θ` the event `{x | θ ∈ C x}` is measurable and has
  probability at least `1 - α`.
- Duality: inverting level-`α` tests with measurable rejection regions `reject θ` gives the
  confidence set `{θ | x ∉ reject θ}` of coverage `1 - α`, and a confidence set of coverage
  `1 - α` gives the level-`α` tests with rejection regions `{x | θ ∉ C x}` (Schervish,
  Def 5.47, p. 315, and Prop 5.48, p. 316).

*Needs:* 1.3.

**Checks.**

- For `P θ = N(θ, 1)`, `C x = [x - 1.96, x + 1.96]` has coverage `0.95`, so
  `HasConfidenceCoverage P C 0.05` holds and `HasConfidenceCoverage P C 0.01` fails.
- `C x = ∅` has coverage `1 - α` only for `α ≥ 1`; `C x = univ` has every coverage.
- The `z`-tests rejecting `θ` when `|x - θ| > 1.96` invert to the interval above.

### 1.5 Risk and garblings

- `risk P L κ θ` (Conventions). For `L θ` bounded and measurable it is
  `∫ x, ∫ a, L θ a ∂κ x ∂P θ` (Schervish, Def 3.4, p. 145, and p. 149; Ferguson, §1.5, p. 25), and
  for a nonnegative bounded measurable loss and a Markov kernel `P`, `ENNReal.ofReal` of the risk
  is Mathlib's `∫⁻ a, ENNReal.ofReal (L θ a) ∂((κ ∘ₖ P) θ)`.
- `IsGarbling P Q`: some Markov kernel `K` has `Q θ = K ∘ₘ P θ` for all `θ`. It is reflexive and
  transitive, and for every rule `κ` based on `Q = K ∘ₘ P` the rule `κ ∘ₖ K` based on `P` has the
  same risk.

*Needs:* 1.1; Mathlib `Kernel.comp`, `Measure.bind`, `avgRisk`.

**Checks.**

- `risk`: for squared-error loss on `ℝ`, `P θ = N(θ, 1)` and the rule `κ x = δₓ`, the risk is `1`
  at every `θ`; for `κ x = δ₀` it is `θ²`.
- `risk`: a rule that ignores `x` and draws `a` from `N(0, 1)` has risk `θ² + 1` under squared
  error.
- `IsGarbling`: the constant laws `Q θ = δ₀` are a garbling of every family, by the constant
  kernel; `N(θ, 1)` is a garbling of `N(θ, 1/2)` by adding independent `N(0, 1/2)` noise;
  `N(θ, 1/2)` is not a garbling of `N(θ, 1)`, since a garbling cannot raise the Fisher
  information from `1` to `2`.

### Examples

- The empty null hypothesis: every test has every level.
- The test `φ = α` is similar of size `α` on every set.

### Dependencies

Mathlib only.

## Layer 2: sufficiency and completeness

### 2.1 Definitions and the integration identity

- `IsSufficientStatistic P T`: `T` is measurable and some Markov kernel `K : Kernel S X` has
  `(P θ).map (fun x ↦ (T x, x)) = (P θ).map T ⊗ₘ K` for every `θ`. The kernel is the conditional
  law of the observation given `T`, chosen independently of `θ`. This is Schervish's sufficiency
  in the classical sense (Schervish, Def 2.8, p. 85) and Pfanzagl's exhaustivity (Pfanzagl,
  Def 1.1.1, p. 2).
- `IsCompleteStatistic P T`: every measurable `g` with `g ∘ T` integrable and of mean `0` under
  every `P θ` has `g ∘ T = 0` `P θ`-a.e. for every `θ`. `IsBoundedlyCompleteStatistic P T`: the
  same for bounded measurable `g`; completeness implies bounded completeness (Pfanzagl,
  Def 1.5.1, pp. 17–18; Schervish, Def 2.34, p. 94).
- `IsAncillaryStatistic P T`: `T` is measurable and `(P θ).map T` does not depend on `θ`
  (Pfanzagl, Def 1.8.1, p. 44).
- `IsMinimalSufficientStatistic P T`: `T` is sufficient, and for every sufficient `U : X → S'`
  there is a measurable `φ` with `T = φ ∘ U` `P θ`-a.e. for every `θ` (Pfanzagl, Def 1.4.1, p. 12;
  Schervish, Def 2.28, p. 92).
- The integration identity: if `μ.map (T, id) = μ.map T ⊗ₘ K`, then
  `∫ g(T) φ dμ = ∫ g(T) (∫ φ dK(T)) dμ` for bounded measurable `g` and `φ`; in particular
  `K ∘ₘ μ.map T = μ`, and the identity integrates over a mixture `P ∘ₘ Λ`.
- On a standard Borel `X`, `T` is sufficient iff for every bounded measurable `φ` there is one
  measurable `ψ` with `(P θ)[φ | σ(T)] = ψ ∘ T` `P θ`-a.e. for every `θ`. Here σ(T) is
  `MeasurableSpace.comap T` (Pfanzagl, Cor 1.3.11, p. 10).
- For a boundedly complete `T` with disintegrating kernel `K`, a bounded measurable `φ` with mean
  `α` under every `θ` has `∫ φ dK(T) = α` a.e. under every `θ`.

*Needs:* Layer 1; Mathlib `Measure.compProd`, `condExp`, `condDistrib`.

**Checks.**

- `IsSufficientStatistic`: for `Bern(p)²` the sum is sufficient, with kernel uniform on
  `{(0,1), (1,0)}` at `1`; the first coordinate `x₁` is not, since the law of `x₂` given `x₁` is
  `Bern(p)` and depends on `p`.
- `IsSufficientStatistic`: the identity is sufficient for every family, with `K s = δ_s`; a
  constant statistic is sufficient only for a family with one law.
- `IsCompleteStatistic`: for `Bern(p)²`, `p ∈ (0, 1)`, the sum is complete; the identity is not,
  because `g = x₁ - x₂` has mean `0` for every `p` and is not a.e. `0`.
- `IsCompleteStatistic`: for the one-law family `{δ₀}`, every statistic is complete.
- `IsCompleteStatistic`: for `N(θ, 1)²`, `θ ∈ ℝ`, the statistic `x₁ - x₂` is not complete: `g = id`
  has mean `0` for every `θ`.
- `IsBoundedlyCompleteStatistic`: the sum for `Bern(p)²` is complete, hence boundedly complete.
- `IsBoundedlyCompleteStatistic`: for the one-law family `{δ₀}`, every statistic is.
- `IsBoundedlyCompleteStatistic`: for `N(θ, 1)²`, `x₁ - x₂` is not: the bounded `g = sign` has mean
  `0` for every `θ`, by the symmetry of `N(0, 2)`.
- `IsAncillaryStatistic`: for `N(θ, 1)²`, `x₁ - x₂` is ancillary with law `N(0, 2)`; `x₁` is not.
- `IsAncillaryStatistic`: a constant statistic is ancillary for every family; for `Bern(p)²` the
  indicator of `x₁ ≠ x₂` is not, its mean `2p(1 - p)` depending on `p`.
- `IsAncillaryStatistic`: for `N(0, σ²)²`, `σ > 0`, the ratio `x₁ / x₂` is ancillary with the
  standard Cauchy law.
- `IsMinimalSufficientStatistic`: for `Bern(p)²` the sum is minimal sufficient; the identity is
  sufficient but not minimal, since it is not a function of the sum.
- `IsMinimalSufficientStatistic`: for a one-law family a constant statistic is minimal sufficient.
- `IsMinimalSufficientStatistic`: for `N(θ, 1)²` the sum `x₁ + x₂` is minimal sufficient, and so is
  `2 (x₁ + x₂)`; the pair `(x₁ + x₂, x₁ - x₂)` is sufficient but not minimal.

### 2.2 Factorization and minimal sufficiency

- If the `P θ` have densities `f θ` with respect to a σ-finite `μ` and `T` is sufficient, there are
  measurable `g θ ≥ 0` and `h ≥ 0` with `f θ = (g θ ∘ T) h` `μ`-a.e. The proof: two finite laws
  `P ≪ L` disintegrated by one kernel have `dP/dL` a function of `T`.
- On a standard Borel `X`, the converse. The common kernel is the conditional distribution
  `condDistrib` of the sample given `T` under a dominating countable mixture (1.2).
- **Factorization theorem** (`isSufficientStatistic_iff_exists_factorization`), on a standard Borel
  `X` and a nonempty parameter type (Pfanzagl, Thm 1.2.10, p. 6, with Cor 1.3.11, p. 10, for the
  kernel form; Schervish, Thm 2.21, p. 89).
- **Minimal sufficiency of the likelihood ratio**
  (`isMinimalSufficientStatistic_likelihoodRatio`): let `X` be a nonempty standard Borel space,
  `Θ` countable, and `P θ` probability laws with everywhere positive densities `f θ` with respect
  to a σ-finite `μ`. For a reference parameter `θ₀`, the statistic
  `x ↦ (θ ↦ f θ x / f θ₀ x) : X → (Θ → ℝ)` is minimal sufficient (Schervish, Thm 2.29, p. 92;
  Pfanzagl, Thm 1.4.4, p. 14). Its sufficiency is the converse of the factorization, which is
  where `X` standard Borel is used; its minimality is the factorization applied to every
  sufficient statistic.

*Needs:* 1.2, 2.1; Mathlib `Measure.rnDeriv`, `condDistrib`.

### 2.3 Basu's theorem

- **Basu** (`indepFun_of_isSufficientStatistic_of_isBoundedlyCompleteStatistic`): a boundedly
  complete sufficient statistic is independent of every ancillary statistic under every `P θ`
  (Pfanzagl, Thm 1.8.2(ii), p. 45; Schervish, Thm 2.48, p. 99). Pfanzagl assumes a dominated
  family, which the kernel form of sufficiency does not need.

*Needs:* 2.1.

### 2.4 Symmetric statistics and U-statistics

- A statistic `g` of `n` coordinates is symmetric if `g (x ∘ σ) = g x` for every permutation `σ`
  of `Fin n`. The `n`-sample model of a set `C` of laws is symmetrically complete if every
  symmetric `g` with mean `0` under every `Pⁿ`, `P ∈ C`, vanishes `Pⁿ`-a.e. (Pfanzagl, Def 1.5.4,
  p. 19).
- Tools: an integrable function on a finite product whose integrals over all measurable boxes
  vanish is `0` a.e.; a symmetric function has the same integral under `Measure.pi μ` and under
  `Measure.pi (μ ∘ σ)`; Fubini at one coordinate.
- **Completeness of symmetric statistics** (`ae_eq_zero_pi_of_isCompleteStatistic_of_convex`). Let
  `C` be a set of probability laws, closed under binary mixtures and complete for the identity
  statistic. Then a measurable symmetric `g` of `n` coordinates with mean `0` under every `Pⁿ`,
  `P ∈ C`, vanishes `Pⁿ`-a.e. (Pfanzagl, Thm 1.5.10, p. 21). The proof:
  - expands the `n`-th power of a uniform mixture of `Q₁, …, Qₙ ∈ C` multilinearly;
  - isolates the permutation terms by Möbius inversion over subsets, which gives
    `∫ g d(Q₁ ⊗ ⋯ ⊗ Qₙ) = 0`;
  - applies completeness one coordinate at a time to get vanishing box integrals.
- `uStatistic m n h x`: the average of `h (x ∘ f)` over the injections `f : Fin m → Fin n`. It is
  symmetric, it is unbiased for `∫ h d(Pᵐ)` under an i.i.d. sample with `m ≤ n` and `h`
  integrable, and for `m = 1` it is the sample mean of `h`.

*Needs:* 2.1; Mathlib `Measure.pi`, `Equiv.Perm`, `Function.Embedding`.

**Checks.**

- `uStatistic 2 3 (fun y ↦ (y 0 - y 1)^2 / 2)` at `x = (0, 1, 2)` is `1`, the sample variance with
  divisor `n - 1 = 2`; the divisor `n` would give `2/3`.
- `uStatistic 1 n h` at `x` is `n⁻¹ ∑ h (xᵢ)`; at `n = 3`, `h = id`, `x = (1, 2, 6)` it is `3`.
- `uStatistic 0 n h` is the constant `h` of the empty tuple; `uStatistic 3 2 h` averages over no
  injections and is `0`.
- Symmetric completeness: for `C = {N(θ, 1)}`, which is not closed under mixtures,
  `g = x₁ - x₂` is not symmetric; `g = (x₁ - x₂)² - 2` is symmetric with mean `0`, so the
  hypothesis of closure under mixtures cannot be dropped (Pfanzagl, p. 21).

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
- `exponentialFamilyMeasure ν T η = ν.tilted (fun x ↦ ⟪η, T x⟫)`, Mathlib's exponential tilt,
  whose density is `exp ⟪η, T⟫ / ∫ exp ⟪η, T⟫ dν`; StandardDistributions 7.8 builds tilting on the
  same definition;
- `IsMinimalExponentialFamily ν T`: no nonzero `⟪u, T⟫` is `ν`-a.e. constant.

These are Brown's natural exponential family and its minimality (Brown, Def 1.1, pp. 1–2). The
target is that the natural parameter space is convex (Brown, Thm 1.13(i), p. 19; Pfanzagl,
Thm 1.6.5, p. 23); for `E = ℝ` it is Mathlib's `convex_integrableExpSet`. For `ν ≠ 0` and `η` in
the natural parameter space, the family law is a probability measure, two parameters are related
by an exponential tilt, and the laws of the family and `ν` are mutually absolutely continuous;
these are Mathlib's `isProbabilityMeasure_tilted`, `tilted_tilted`, `tilted_absolutelyContinuous`
and `absolutelyContinuous_tilted`, consumed, not restated.

*Needs:* 1.1; Mathlib `Measure.tilted`, `ConvexOn`, Hölder's inequality.

**Checks.**

- `naturalParameterSpace`: for `ν = e^{-|x|} dx` and `T = id` it is `(-1, 1)`; for Lebesgue
  measure it is `∅`; for the Cauchy law it is `{0}`.
- `naturalParameterSpace`: for `E = ℝ` it is Mathlib's `integrableExpSet T ν`.
- `logPartition`: for `ν = δ₀ + δ₁` and `T = id` it is `log (1 + e^η)`, whose derivative at `0` is
  `1/2`.
- `logPartition`: for `ν = N(0, 1)` and `T = id` it is `η²/2`; for Lebesgue measure at `η = 0` the
  integral is the junk `0` and the value is `log 0 = 0`.
- `logPartition`: for `E = ℝ` it is Mathlib's `cgf T ν`.
- `exponentialFamilyMeasure`: for `ν = δ₀ + δ₁` it is `Bern(e^η / (1 + e^η))`.
- `exponentialFamilyMeasure`: for `ν = N(0, 1)` and `T = id` it is `N(η, 1)`.
- `exponentialFamilyMeasure`: for `ν = 0` it is `0`, not a probability; for Lebesgue measure and
  `η = 0` it is `0`, not Lebesgue measure, since the normalizing integral is the junk `0`.
- `IsMinimalExponentialFamily`: `δ₀ + δ₁` with `T = id` is minimal; `δ₀` is not, since
  `⟪1, x⟫ = 0` a.e.; on `ℝ²`, `δ₀ + δ_{(1,1)}` is not, since `x₁ - x₂ = 0` a.e.

### 3.2 Laplace determinacy

- `measure_eq_of_integral_exp_inner_eq`: two finite measures on a finite-dimensional real inner
  product space whose Laplace transforms `u ↦ ∫ exp ⟪u, t⟫` are finite and agree on a ball about
  `0` are equal (Brown, proof of Thm 2.12, p. 43; Schervish, proof of Thm 2.74, pp. 108–109). The
  proof applies `TauCeti.Measure.ext_of_mgf` to each one-dimensional projection and then
  `Measure.ext_of_charFun`.

*Needs:* Tau Ceti `TauCeti.Measure.ext_of_mgf`; Mathlib `Measure.ext_of_charFun`.

### 3.3 The log partition function

For a nonzero `ν` on a finite-dimensional `E` and `T = id`, at every point `η` of the interior of
the natural parameter space (Brown, Thm 2.2, pp. 34–35, and Thm 2.7, p. 39; Schervish, Thm 2.64,
p. 105):
- `analyticOnNhd_logPartition`: `logPartition ν id` is real analytic on the interior;
- `hasFDerivAt_logPartition`: its derivative at `η` is `⟪m, ·⟫`, with `m = ∫ x dP_η`;
- `fderiv_fderiv_logPartition_apply`: its second derivative at `η` is
  `(u, v) ↦ cov[⟪u, ·⟫, ⟪v, ·⟫; P_η]`;
- the identity is integrable under `P_η`, and every linear functional has finite moments of all
  orders.

The proof needs `r > 0` with `exp (⟪η, x⟫ + r ‖x‖)` integrable. The partition function then has
on the ball of radius `r` the power series `h ↦ ∑ₙ ∫ e^{⟪η,x⟫} ⟪x, h⟫ⁿ / n! dν`, whose
coefficients are Bochner integrals of continuous multilinear maps
(`hasSum_integral_of_dominated_convergence`).

The general statistic `T` reduces to `T = id` by pushing `ν` forward along `T`:
`logPartition (ν.map T) id = logPartition ν T`, and the law of `T` under the family is the
family of `ν.map T`.

*Needs:* 3.1; Mathlib `AnalyticOnNhd`, `HasFPowerSeriesOnBall`,
`hasSum_integral_of_dominated_convergence`.

### 3.4 Completeness

- `isCompleteStatistic_withDensity_exp_inner`: for `T : X → EuclideanSpace ℝ (Fin d)` and `η`
  ranging over a nonempty open set `U` inside the natural parameter space, `T` is complete for
  the family `exp ⟪η, T⟫ / Z(η) · ν` (Brown, Thm 2.12, p. 43; Pfanzagl, Thm 1.6.10, p. 26;
  Schervish, Thm 2.74, p. 108). Each of the two Laplace transforms of `g⁺ ∘ T` and `g⁻ ∘ T` is
  finite on `U`, and the two agree there, so 3.2 applies after a shift.

*Needs:* 2.1, 3.1, 3.2.

### 3.5 Mean parametrization

For a nonzero σ-finite `ν` on a finite-dimensional `E`, a minimal family, and a **nonempty** open
natural parameter space `N`, write `M η = ∫ x dP_η` for the mean map. The targets: `M` is
analytic on `N`, injective on `N`, takes values in `interior (convexHull ℝ ν.support)`, and has
a derivative that is a continuous linear equivalence at every point of `N`.
- **Mean parametrization** (`exists_analytic_inverse_exponential_family_mean`): `M` is a
  bijection of `N` onto `interior (convexHull ℝ ν.support)` with analytic inverse.

Brown proves that `M` is a homeomorphism of `N` onto this interior (Brown, Thm 3.6, p. 74, for
steep families; a family with `N` open is steep, p. 71); injectivity is Brown, Cor 2.5, p. 37.
Analyticity of the inverse is the analytic inverse function theorem applied to `M`, whose
derivative, the covariance, is positive definite by minimality. The nonemptiness of `N` is
needed: for Lebesgue measure on `ℝ`, `N = ∅` while the interior is `ℝ`. Surjectivity is 3.6
applied to `t` in the interior.

*Needs:* 3.3; Mathlib `HasStrictFDerivAt.toOpenPartialHomeomorph`,
`OpenPartialHomeomorph.analyticAt_symm`, `AnalyticOnNhd`.

### 3.6 Maximum likelihood

With the hypotheses of 3.5, except that `N` need only be nonempty:
- `exists_isMaxOn_logLikelihood_iff_mem_interior_convexHull_support`: the log likelihood
  `η ↦ ⟪η, t⟫ - logPartition ν id η` of an observation `t` attains its maximum on `N` iff `t` lies
  in `interior (convexHull ℝ ν.support)` (Brown, Thm 5.5, p. 148, for steep families; by the
  same argument as the surjectivity in Brown, Thm 3.6, pp. 74–75, otherwise). Existence:
  `η ↦ ∫⁻ exp ⟪η, x - t⟫ dν` is lower semicontinuous (Fatou) and coercive. The converse: for
  `t` outside the interior, the separation theorem `geometric_hahn_banach_open_point` applied to
  the interior of the convex hull gives a nonzero `u` with `⟪u, x - t⟫ ≤ 0` on the support. Along
  `η + s u`, `s → ∞`, the likelihood does not decrease, and it strictly increases unless `ν` lives
  on the hyperplane `⟪u, x - t⟫ = 0`, which minimality excludes; so no maximum is attained.
- For `N` open, a maximizer solves the likelihood equation `M η = t` and is the unique maximizer.
  Uniqueness is strict convexity of the log partition function, the equality case of
  Cauchy–Schwarz (Brown, Thm 1.13(iv), p. 19).

*Needs:* 3.3; Mathlib `geometric_hahn_banach_open_point`, `LowerSemicontinuous`,
`lintegral_liminf_le`.

### 3.7 Conditional exponential families

For statistics `T : X → E` and `S : X → F` into Euclidean spaces, write `P_{η,ζ}` for the family
with statistic `x ↦ WithLp.toLp 2 (T x, S x)` and natural parameter `WithLp.toLp 2 (η, ζ)`.
- `conditionalExponentialKernel κ η`: for a kernel `κ : Kernel F E`, the fibrewise normalized
  tilt `s ↦ exp (⟪η, t⟫ - log ∫ exp ⟪η, t'⟫ dκ s) · κ s`, through `Kernel.withDensity`.
- An exponential tilt of `μ ⊗ₘ κ` is its tilted first marginal composed with the normalized tilt
  of `κ`.
- **Conditional families** (`exists_kernel_conditional_exponential_family`): there is one
  s-finite kernel `κ`, free of the parameter, with
  `P_{η,ζ}.map (S, T) = P_{η,ζ}.map S ⊗ₘ conditionalExponentialKernel κ η` at every natural
  parameter. That is, the conditional law of `T` given `S` is an exponential family in `η`
  alone (Brown, Thm 1.15, p. 22).

*Needs:* 3.1; Mathlib `Kernel.withDensity`, `condDistrib`, `Measure.compProd`.

**Checks.**

- `conditionalExponentialKernel κ 0 = κ` on every fibre where `κ s` is a probability: the tilt by
  `0` is `exp (0 - log 1) = 1`.
- For `κ s = δ₀ + δ₁` for every `s`, `conditionalExponentialKernel κ η s` is
  `Bern(e^η / (1 + e^η))`, the same law for every `s`.
- On a fibre with `κ s = 0` the kernel is `0`, and on a fibre with `∫ exp ⟪η, t⟫ dκ s = ∞` the
  integral is the junk `0`, the logarithm is `0`, and the kernel is the unnormalized tilt; the
  conditional family theorem only uses fibres of positive finite normalizer, which carry the
  law of `S`.

### 3.8 The Pitman–Koopman–Darmois theorem

- `exists_exponential_family_of_monotone_sufficient_statistics` (Pfanzagl, Thm 1.7.16,
  pp. 36–37, after Borges and Pfanzagl). The hypotheses:
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

  The forms of Darmois, Koopman and Pitman without monotonicity need regularity conditions
  (Pfanzagl, p. 36; Schervish, Thm 2.76, p. 109, is a smooth version) and are not targets.

*Needs:* 1.1; Mathlib `Measure.pi`, `Measure.rnDeriv`.

### Examples

- Bernoulli, Poisson, Gaussian with known variance, and Gamma with known shape are minimal
  regular families. In each, the mean map is the classical one (`θ = log (p / (1 - p))`, `log λ`,
  `μ / σ²`), and the maximum likelihood estimator exists iff the observation is interior.
- The Gaussian family with both parameters, with `(T, S) = (Σ x, Σ x²)`.

### Dependencies

Layers 1–2 (2.1 for completeness in 3.4).

## Layer 4: unbiased estimation and information

### 4.1 Unbiasedness and UMVU estimators

- `IsUnbiasedEstimator P δ g`: `δ` is measurable and integrable under every `P θ` with mean
  `g θ`.
- `IsMinimumVarianceUnbiasedEstimator P W g`: `W` is a square-integrable unbiased estimator of
  `g` whose variance at every `θ` is at most that of every square-integrable unbiased estimator
  of `g` (Schervish, Def 5.4, p. 297).
- `isMinimumVarianceUnbiasedEstimator_iff_covariance_eq_zero`: a square-integrable unbiased `W`
  is UMVU iff `cov[W, U; P θ] = 0` for every `θ` and every square-integrable unbiased estimator
  `U` of zero (Schervish, Thm 5.9, pp. 298–299).
- Two UMVU estimators of `g` agree `P θ`-a.e.

*Needs:* Layer 1; Mathlib `variance`, `covariance`.

**Checks.**

- `IsUnbiasedEstimator`: for `Bern(p)²`, `x₁`, `x₂` and `(x₁ + x₂)/2` are unbiased for `p`;
  `x₁ x₂` is unbiased for `p²`, not for `p`.
- `IsUnbiasedEstimator`: for `Bern(p)` with one observation no estimator is unbiased for `p²`,
  since every mean is affine in `p`.
- `IsMinimumVarianceUnbiasedEstimator`: for `Bern(p)²`, `(x₁ + x₂)/2` is UMVU for `p` with
  variance `p(1 - p)/2`; `x₁` has variance `p(1 - p)` and is not.
- `IsMinimumVarianceUnbiasedEstimator`: for one observation from the laws on `ℝ` with a finite
  mean, the only unbiased estimator of the mean is `x`, since `δ(a) = a` under every Dirac law
  `δ_a`. It is not square-integrable under the law of density `2 (1 + x)⁻³` on `x ≥ 0`, so the
  mean has no UMVU estimator in that model, while `W ≡ 0` is UMVU for `g ≡ 0`.

### 4.2 Rao–Blackwell and Lehmann–Scheffé

- **Rao–Blackwell** (`exists_rao_blackwell_estimator`): for a sufficient `T` with kernel `K` and
  an integrable `δ`, the rule `r(s) = ∫ δ dK(s)` is measurable and has the same mean as `δ`, and
  `∫ L(r ∘ T) dP θ ≤ ∫ L(δ) dP θ` for every convex `L : ℝ → ℝ` with `L ∘ δ` integrable
  (Schervish, Thm 3.22, pp. 152–153; Pfanzagl, Thm 3.2.1, p. 105). The loss may depend on `θ`,
  since `r` does not. The proof uses Jensen's inequality `ConvexOn.map_integral_le` for the
  probability measure `K s`; integrability of `L ∘ r ∘ T` follows because a convex function on
  `ℝ` lies above one of its supporting lines, `L x ≥ L a + c (x - a)`, so its negative part is
  dominated by an integrable function.
- **Lehmann–Scheffé, uniqueness** (`ae_eq_of_isCompleteStatistic_of_isUnbiasedEstimator`):
  unbiased functions of a complete statistic agree a.e. (Schervish, Thm 5.5, p. 298).
- **Lehmann–Scheffé, optimality** (`isMinimumVarianceUnbiasedEstimator_of_isCompleteStatistic`):
  if `T` is complete and sufficient and `r ∘ T` is a square-integrable unbiased estimator of
  `g`, then `r ∘ T` is UMVU, and it is the Rao–Blackwellization of every square-integrable
  unbiased estimator of `g` (Schervish, Thm 5.5, p. 298; Pfanzagl, Thm 3.2.5, pp. 106–107).
- **U-statistics are UMVU** (`isMinimumVarianceUnbiasedEstimator_uStatistic`): let `C` be a set
  of probability laws on `X` that is closed under binary mixtures and complete for the identity
  statistic, as in 2.4, and let `h : (Fin m → X) → ℝ` be measurable with `m ≤ n` and
  `Pᵐ`-integrable for every `P ∈ C`. If `uStatistic m n h` is square-integrable under every `Pⁿ`,
  `P ∈ C`, it is UMVU for `P ↦ ∫ h dPᵐ` in the model `{Pⁿ | P ∈ C}` (Pfanzagl, Thm 3.2.7,
  p. 108). The proof averages an unbiased estimator over the permutations of the sample, which
  does not increase its variance, and applies 2.4 to the difference of the average and the
  U-statistic.

*Needs:* 2.1, 2.4, 4.1; Mathlib `ConvexOn.map_integral_le`, `condExp`.

### 4.3 Information

- `likelihoodScore f θ x = ∂/∂θ log f(θ, x)` (Mathlib's `deriv`), for a real parameter, and
  `fisherInformation P f θ = ∫ (likelihoodScore f θ)² dP θ`, which is nonnegative.
- The information matrix `(∫ sᵢ sⱼ dP)ᵢⱼ` of a vector score `s` with `MemLp (s i) 2 P` for every
  `i` is positive semidefinite, since `uᵀ M u = ∫ (uᵀ s)² dP`. Square-integrability is needed:
  for the density `2 (1 + x)⁻³` on `x ≥ 0` and `s = (1, x)`, the junk value of the nonintegrable
  `x²` gives `M = [[1, 1], [1, 0]]` and `uᵀ M u = -1` at `u = (1, -1)`. The matrix is shared
  vocabulary: it is the limiting covariance of the asymptotic roadmaps. The matrix information
  inequality is in the boundary list.
- **Information inequality** (`sq_deriv_le_variance_mul_fisherInformation`): for a real
  parameter, everywhere positive densities `f θ` with respect to `μ`, a square-integrable `W`,
  and the differentiation-under-the-integral identities
  `d/dθ ∫ f θ dμ = ∫ ∂_θ f θ dμ` and `d/dθ ∫ W f θ dμ = ∫ W ∂_θ f θ dμ` at `θ`, together with
  `fisherInformation P f θ > 0`, the derivative of the mean of `W` satisfies
  `(d/dθ ∫ W dP θ)² ≤ Var[W; P θ] · fisherInformation P f θ` (Schervish, Thm 5.13, p. 301;
  Casella–Berger, Thm 7.3.9, pp. 271–272). The two identities are what Mathlib's
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le` provides under a local domination of
  `∂_θ f`. Positivity of the densities makes `likelihoodScore` the true score, avoiding Lean's
  `log 0 = 0`. The proof: the first identity gives a score of mean `0`, the second gives
  `cov[W, score] = d/dθ ∫ W dP θ`, and Cauchy–Schwarz concludes.

*Needs:* 1.1; Mathlib `deriv`, `variance`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

**Checks.**

- `likelihoodScore`: for `f θ x = φ(x - θ)`, the `N(θ, 1)` density, the score is `x - θ`.
- `likelihoodScore`: for `f θ x = θ e^{-θ x}` on `x > 0` it is `1/θ - x`.
- `likelihoodScore`: for `Bern(p)` with the counting density `p^x (1 - p)^{1-x}`, `p ∈ (0, 1)`, it
  is `x/p - (1 - x)/(1 - p)`: `1/p` at `1` and `-1/(1 - p)` at `0`.
- `fisherInformation`: `1` for `N(θ, 1)`; `1/θ²` for the exponential law of rate `θ`;
  `1/(p(1 - p))` for `Bern(p)` with the counting density.
- `fisherInformation`: for a family whose density does not depend on `θ` it is `0`, so the
  hypothesis `fisherInformation P f θ > 0` of the information inequality fails.
- Information inequality: for the exponential law of rate `θ` and `W = x`, the mean is `1/θ`, and
  `(d/dθ θ⁻¹)² = θ⁻⁴ = Var[W] · fisherInformation = θ⁻² · θ⁻²`, with equality.

### 4.4 Stein's identity and James–Stein

- The density of `N(θ, v I)` on `EuclideanSpace ℝ (Fin p)` in closed form, from
  `multivariateGaussianPDFReal`.
- **Stein's identity** (`gaussian_integration_by_parts`): for `X ~ N(θ, v I)` with `v > 0` and a
  `C¹` field `g ∈ L²` with integrable partial derivatives,
  `E[(Xᵢ - θᵢ) gᵢ(X)] = v E[∂ᵢ gᵢ(X)]` (Schervish, Lemmas 3.51–3.52, pp. 163–164, for `v = 1`;
  the factor `v` follows by scaling `X = θ + √v Z`).
- **James–Stein** (`james_stein_risk_eq_and_lt`): for `p ≥ 3` and `X ~ N(θ, I)`, the estimator
  `(1 - (p - 2)/‖X‖²) X` has risk `p - (p - 2)² E‖X‖⁻²`, strictly less than `p` (Schervish,
  Thm 3.50, p. 163, and (3.54), pp. 164–165). The proof:
  - applies Stein's identity to `(‖x‖² + ε)⁻¹ x`;
  - lets `ε → 0` by dominated convergence;
  - bounds `E‖X‖⁻²` by `integrableOn_norm_rpow_ball`.

*Needs:* Tau Ceti `multivariateGaussianPDFReal`, `multivariateGaussian_eq_withDensity`,
`integrableOn_norm_rpow_ball`; Mathlib `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable`.

### 4.5 The Pitman estimator

- `IsLocationEquivariant δ`: `δ (x + a·1) = δ x + a`.
- `pitmanEstimator f x = ∫ u ∏ f(xᵢ - u) du / ∫ ∏ f(xᵢ - u) du`. The samples at which both
  integrals exist and the denominator is positive form a measurable, translation-invariant set,
  and the estimator is measurable and equivariant on it.
- **Optimality** (`pitmanEstimator_minimum_equivariant_risk`): for a density `f` of `P` such that
  the good set above has full measure, the Pitman estimator has squared-error risk at most that
  of every square-integrable location-equivariant estimator (Schervish, Thm 6.10, p. 348;
  Ferguson, §4.7, pp. 186–188). Equivariant estimators have constant risk, so the statement is
  at `θ = 0`. The proof decomposes the Lebesgue integral along the diagonal orbits and
  minimizes a weighted quadratic at its weighted mean.

*Needs:* 1.1; Mathlib `Measure.pi`, `lintegral_prod`.

**Checks.**

- `IsLocationEquivariant`: the mean, the median and `x₁` are equivariant; `2 x̄` and the
  constant `0` are not.
- `pitmanEstimator`: for the `N(0, 1)` density it is the sample mean; at `n = 1` it is
  `x₁ - ∫ u f(u) du`, which is `x₁` for a centred density.
- `pitmanEstimator`: for the uniform density on `[-1/2, 1/2]` it is the midrange
  `(min + max)/2`, not the mean: at `x = (0, 0.9, 0.1)` it is `0.45`, while the mean is `1/3`.

### Examples

- For a Gaussian sample the sample mean is UMVU for the mean, and the Pitman estimator is the
  sample mean.
- For `N(θ, 1)` the Fisher information is `1`, and the sample mean attains the bound.
- The laws on `ℝ` with a Lebesgue density and a finite second moment are closed under mixtures
  and complete, so for `n ≥ 1` the sample mean is UMVU for the mean in that model.

### Dependencies

Layers 1–2; Tau Ceti's Gaussian density `multivariateGaussianPDFReal` and
`integrableOn_norm_rpow_ball`.

## Layer 5: order statistics and Gaussian samples

### 5.1 Order statistics

For a probability `P` on `ℝ` and the order statistics `TauCeti.orderStatistic` of an i.i.d.
sample of size `n`. These targets take the chamber formula `map_orderStatistics_pi` as input;
the uniform case is StandardDistributions, 4.6.
- For a density `f` of `P`, the vector of order statistics has density `n! ∏ f(xᵢ)` on the
  increasing tuples, by `map_orderStatistics_pi` and `TauCeti.pi_withDensity` (Casella–Berger,
  p. 187).
- The `j`-th order statistic (zero-indexed) has density
  `n! / (j! (n - j - 1)!) F^j (1 - F)^{n-j-1} f`, where `F = cdf P` (Casella–Berger, Thm 5.4.4,
  p. 186, with one-based index).
- **Ranks** (`map_sort_eq_and_indepFun_orderStatistics`): for an atomless `P`, the sorting
  permutation `Tuple.sort` is uniform on the `n!` permutations and independent of the vector of
  order statistics: the event that the sort is `σ` and the order statistics lie in `B` has
  probability `(n!)⁻¹` times that of the second event (Cox–Hinkley, Example 2.11, p. 20, for a
  law with a density, in the conditional form; the atomless case by the same argument). Ties
  are null, and coordinate permutations preserve the product law and the order statistics.

*Needs:* Layer 1; Tau Ceti `TauCeti.orderStatistic`, `map_orderStatistics_pi`,
`TauCeti.pi_withDensity`, `orderStatistic_comp_perm`; Mathlib `Tuple.sort`.

### 5.2 Gaussian samples

For `v > 0`:
- the standardized coordinates of an i.i.d. `N(m, v)` sample form a standard Gaussian vector in
  `EuclideanSpace ℝ (Fin n)`;
- a unit functional of a standard Gaussian vector is `N(0, 1)`;
- **Sample mean and residuals** (`gaussian_sample_mean_residual_laws`): for `n ≥ 2`,
  - `SS / v` has law `χ²_{n-1}`, where `SS = ∑ (xᵢ - x̄)²`;
  - `SS` is independent of `x̄`;
  - `√n (x̄ - m) / √(SS / (n - 1))` has Student's law with `n - 1` degrees of freedom
    (Casella–Berger, Thm 5.3.1, p. 178, and §5.3.2, pp. 181–182).

  The proof projects onto the constants and their orthogonal complement. The hypothesis
  `v > 0` is needed: Mathlib's `gaussianReal m 0` is `dirac m`, for which `SS / v = 0`.

*Needs:* Tau Ceti `chiSquaredMeasure`, `studentTMeasure`,
`HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian`,
`HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian`, `hasLaw_studentT_of_gaussian_chiSquared`;
Mathlib `gaussianReal`, `stdGaussian`.

### Examples

- The median of a sample of odd size `2k + 1` from a law with density `f` has density
  `(2k + 1)! / (k!)² F^k (1 - F)^k f`, the marginal density at `j = k`.
- For an i.i.d. `N(m₀, v)` sample with `n ≥ 2` and `v > 0`, the test that rejects when
  `|√n (x̄ - m₀) / √(SS / (n - 1))|` exceeds the `(1 - α/2)`-quantile of Student's law with `n - 1`
  degrees of freedom has size exactly `α`.
- For `n = 2`, `m = 0`, `v = 1`: `SS = (x₁ - x₂)²/2` has law `χ²₁`, and the Student statistic has
  the Cauchy law `t₁`.

### Dependencies

Layer 1, and the Tau Ceti order statistics, chi-squared, Student and Gaussian projection laws
(see the supplier contracts).

## Layer 6: tests

### 6.1 Threshold tests

- The size of `thresholdTest T c γ` is `P(T > c) + γ P(T = c)`.
- For a probability `P` and a real statistic `T`, every size `β ∈ (0, 1)` is the size under `P` of
  a threshold test `thresholdTest T c γ` with `γ ∈ [0, 1]` and `c` the `(1 - β)`-quantile
  `Measure.quantile` of the law of `T` under `P` (Schervish, Thm 4.56 and its proof,
  pp. 240–241; Pfanzagl, Lemma 4.3.3(i), pp. 133–134).

*Needs:* 1.3; Tau Ceti `MeasureTheory.Measure.quantile`.

### 6.2 The Neyman–Pearson lemma

- **Constrained form** (`exists_neyman_pearson_test`): for probability laws `P₀`, `P₁` with
  densities `f₀`, `f₁` with respect to `μ` and `α ∈ (0, 1)`, there are `k ≥ 0` and a test `φ` of
  size exactly `α` with `φ = 1` on `{f₁ > k f₀}` and `φ = 0` on `{f₁ < k f₀}`, and it is most
  powerful at level `α` (Ferguson, Neyman–Pearson Lemma (a)–(b), p. 201; Pfanzagl,
  Lemma 4.3.3, pp. 133–134).
- **Necessity** (`ae_eq_of_most_powerful`): every most powerful level-`α` test `ψ` equals `φ`
  `μ`-a.e. on `{f₁ ≠ k f₀}`, and has size `α` unless its power is `1` (Pfanzagl,
  Lemma 4.3.3(ii''), p. 134, and Lemma 4.3.12, p. 135; Schervish, Lemma 4.45, p. 234).
- **Sum-of-errors form**, in the names of Mathlib pull request
  [#39791](https://github.com/leanprover-community/mathlib4/pull/39791), for finite measures
  `P`, `Q`, a threshold `t > 0` and `η ∈ [0, 1]`, in the namespace `TauCeti.NeymanPearson`:
  - `npLikelihoodRatio P Q = (dQ/d(P+Q)) / (dP/d(P+Q))`;
  - `npTest P Q t η`: `1` where the ratio exceeds `t⁻¹` or `dP/d(P+Q) = 0`, `η` at the ratio
    `t⁻¹`, and `0` elsewhere;
  - `npSumError P Q t T = ∫ T dP + t ∫ (1 - T) dQ`;
  - `neyman_pearson`: `npTest P Q t η` minimizes `npSumError P Q t` over measurable
    `[0, 1]`-valued tests (Schervish, Thm 3.87, p. 175, and Prop 3.91, p. 178, for probability
    measures; the finite-measure form is that of the pull request).
- **Generalized lemma** (`integral_le_of_generalized_neyman_pearson`): suppose `φ` rejects where
  `f₀ > ∑ kᵢ fᵢ` and accepts where `f₀ < ∑ kᵢ fᵢ`, with signed multipliers. Then every test `ψ`
  with `kᵢ ∫ ψ fᵢ ≤ kᵢ ∫ φ fᵢ` has `∫ ψ f₀ ≤ ∫ φ f₀` (Schervish, Lemma 4.78, p. 247).

*Needs:* 1.1, 1.3, 6.1; Mathlib `Measure.rnDeriv`.

**Checks.**

- `npLikelihoodRatio`: for `P = δ₀`, `Q = δ₁` it is `0` at `0` and the junk `1/0 = 0` at `1`,
  where `dP/d(P+Q) = 0`.
- `npLikelihoodRatio`: for `P = Q` it is `1` a.e.
- `npLikelihoodRatio`: for `P = (δ₀ + δ₁)/2` and `Q = (δ₀ + 3δ₁)/4` it is `1/2` at `0` and `3/2` at
  `1`.
- `npTest`: for `P = δ₀`, `Q = δ₁`, `t = 1` it is `0` at `0` and `1` at `1`, and its sum of
  errors `0` is the minimum.
- `npTest`: for `P = (δ₀ + δ₁)/2`, `Q = (δ₀ + 3δ₁)/4` and `t = 2`, the threshold `t⁻¹ = 1/2` is
  met at `0` and exceeded at `1`, so the test is `(η, 1)`. A test `T` has sum of errors
  `2 - T(1)`, with minimum `1`, which `npTest` attains for every `η`; the threshold `t` in place of
  `t⁻¹` would give the test `(0, 0)`, with sum of errors `2`.
- `npTest`: for `P = Q` a probability and `t = 1`, the ratio is `t⁻¹ = 1` a.e., so the test is `η`
  a.e., with sum of errors `η + (1 - η) = 1`.
- `npSumError`: the constant tests `0` and `1` have sums of errors `t Q(X)` and `P(X)`; for
  `P = Q` a probability and `t = 1` every test has sum of errors `1`.
- `exists_neyman_pearson_test`: for `N(0, 1)` against `N(1, 1)` and `α = 0.05`, `k = e^{1.145}`
  and the power is `0.259`.

### 6.3 Monotone likelihood ratio

- The two Neyman–Pearson comparisons for positive densities whose ratio is a nondecreasing
  function of `T`, and the vanishing of an integral against a positive density.
- **Karlin–Rubin** (`isUniformlyMostPowerfulTest_of_monotone_likelihood_ratio`): in a family with
  everywhere positive densities and monotone likelihood ratio in `T`, the threshold test of size
  `α` at `θ₀` is UMP of level `α` for `θ ≤ θ₀` against `θ > θ₀`, and its power function is
  nondecreasing (Schervish, Def 4.51, p. 239, and Thm 4.56, pp. 240–241; Casella–Berger,
  Thm 8.3.17, p. 317).
- **Essential completeness** (`exists_one_sided_test_risk_le`): in such a family, consider a
  loss `L θ` of rejecting minus accepting that is positive below `θ₀` and negative above.
  Every test `ψ` is matched at every `θ` by a threshold test in `T`, with a threshold `c` in
  `EReal` and `γ ∈ [0, 1]`: `L θ · testPower (thresholdTest T c γ) θ ≤ L θ · testPower ψ θ`
  (Schervish, Thm 4.68, p. 244).

*Needs:* 6.1, 6.2.

### 6.4 Least favorable mixtures

For a Markov kernel `P : Kernel Θ X` on a measurable parameter space, a measurable null set
`H₀`, and a prior `Λ` carried by the null set, `Λ H₀ᶜ = 0`:
- **Sufficiency** (`most_powerful_of_mixture_null`): let `φ` have level `α` at every null
  parameter and be most powerful at level `α` for the simple null `P ∘ₘ Λ` against `Q`. Then `φ`
  is most powerful at level `α` for the composite null `H₀` against `Q`.
- **Concentration** (`ae_testPower_eq_of_most_powerful_mixture`): if moreover `φ` has size `α`
  under `P ∘ₘ Λ`, then `testPower P φ = α` `Λ`-a.e., and `Λ` is least favorable: for every prior
  `Λ'` with `Λ' H₀ᶜ = 0`, the most powerful level-`α` test of `P ∘ₘ Λ'` against `Q` has power at
  least that of `φ`.

(Pfanzagl, Prop 4.4.2, p. 136, which assumes power `< 1` for the concentration; this gives size
`α` under the mixture by Pfanzagl, Lemma 4.3.12, p. 135.) The restriction to priors on the null
set is needed: with `H₀ = {0}`, `P θ = N(θ, 1)`, `Q = P 1` and `Λ = δ₁`, the constant test `0.05`
has level `0.05` at `0` and is most powerful for `P 1` against `P 1`, but has power `0.05`
against the Neyman–Pearson power `0.259`.

*Needs:* 1.3, 2.1 (integration over a mixture), 6.2; Mathlib `Measure.bind`.

### 6.5 Interval tests in one-parameter families

For a one-parameter family `P_η = exponentialFamilyMeasure ν T η` with real `T`, `η` in an open
interval `U` inside the natural parameter space, and `T` not `ν`-a.e. constant:
- Interval weights. For a real law `μ` with quantile function `Q = μ.quantile` and
  `0 < a < b < 1`, an *interval weight* for `(a, b)` is a measurable `w : ℝ → [0, 1]` equal to `1`
  on `(Q a, Q b)` and `0` outside `[Q a, Q b]`, whose values at the endpoints `Q a` and `Q b` are
  fixed so that `∫ g w dμ = ∫_{(a, b)} g (Q u) du` for every `μ`-integrable `g`. The target is
  that an interval weight exists; the endpoint values are the fractions of the atoms of `μ` at
  `Q a`, `Q b` that the window `(a, b)` of levels covers.
- By the intermediate value theorem, a window of levels with any prescribed integral of a
  continuous increasing integrand exists.
- Positive combinations `A e^{β₁ t} + B e^{β₂ t}`, `β₁ < 0 < β₂`, are at most `1` exactly on a
  closed interval `[c₁, c₂]`.
- **UMP interval tests** (`exists_ump_interval_test`): for `η₁ < η₂` and `α ∈ (0, 1)`, an
  interval test in `T` of size exactly `α` at `η₁` and at `η₂` exists. It is UMP of level `α` for
  `η ≤ η₁ ∨ η ≥ η₂` against `η₁ < η < η₂` (Schervish, Thm 4.82, pp. 249–250, with Lemma 4.81,
  p. 248).

*Needs:* 3.1, 3.3, 6.2; Tau Ceti `MeasureTheory.Measure.quantile`, `measurePreserving_quantile`.

**Checks.**

- Interval weight: for `μ` uniform on `[0, 1]`, the indicator of `(a, b)` is an interval weight;
  for `μ = δ₀` and `(a, b) = (1/4, 3/4)`, the weight is `1/2` at `0`.
- For `μ = (δ₀ + δ₁)/2` and `(a, b) = (1/4, 3/4)`, `Q a = 0`, `Q b = 1`, and the weight is `1/2` at
  both atoms: each covers a quarter of the levels out of its half.
- `intervalTest t c₁ c₂ γ₁ γ₂` with `T` two-valued `{0, 1}`: equal sizes at `η₁` and `η₂` force the
  test to be the constant `α`.

### 6.6 Unbiased tests and Neyman structure

- Differentiation under the integral in the natural parameter of the power function, with the
  domination `|t| e^{η t} ≤ C (e^{η' t} + e^{η'' t})` for `η' < η < η''` and the chord of
  `t ↦ e^{(η - η₀) t}`.
- **Two-sided UMPU test** (`isUniformlyMostPowerfulUnbiasedTest_of_two_tail_moment_constraints`):
  the test rejecting outside `[c₁, c₂]` (with randomizations `γᵢ` at `cᵢ`) whose size is `α` and
  with `E[Tφ] = α E[T]` at `η₀` is UMPU of level `α` for `η = η₀` against `η ≠ η₀` (Schervish,
  Cor 4.109, p. 260, with Thm 4.104, pp. 258–260, and the identity on p. 259 that turns a zero
  derivative of the power into `E[Tφ] = αE[T]`). The proof:
  - the power of an unbiased test has zero derivative at `η₀`, which gives the two side
    conditions;
  - 6.2 then applies with the chord of the likelihood ratio.
- For a parameter space with a topology, an unbiased level-`α` test with continuous power
  function is similar on `closure H₀ ∩ closure H₁` (Schervish, Prop 4.92, p. 254).
- **Neyman structure** (`condExp_eq_const_of_isSimilarTest`): for a boundedly complete sufficient
  `T`, every test similar of size `α` has `(P θ)[φ | σ(T)] = α` a.e. under every `θ` (Schervish,
  Lemma 4.122, p. 267).

*Needs:* 2.1, 3.3, 6.2; Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

### 6.7 Conditional tests with a nuisance parameter

In the family of 3.7 with real `T` and nuisance statistic `S : X → EuclideanSpace ℝ (Fin l)`, the
setting is:
- minimality of the pair, `IsMinimalExponentialFamily ν (fun x ↦ WithLp.toLp 2 (T x, S x))`: no
  nontrivial `a T + ⟪b, S⟫` is `ν`-a.e. constant;
- the parameter `(η, ζ)` ranges over an open convex set `U` inside the natural parameter space
  that meets the hyperplane `η = η₀`, and the conditions below are imposed at one point `p₀` of
  `U` on the hyperplane;
- the critical values `c₁ ≤ c₂`, `c` and the randomizations are measurable functions of `S`.

The targets (Schervish, Thm 4.124, pp. 268–269, with Thm 4.123, p. 267):
- **Two-sided** (`isUniformlyMostPowerfulUnbiasedTest_conditional_two_sided`): a test that
  rejects for `T` outside `[c₁(S), c₂(S)]` and accepts inside, with conditional size `α` and
  `E[Tφ | S] = α E[T | S]` at `p₀`, is UMPU of level `α` for `η = η₀` against `η ≠ η₀`.
- **One-sided** (`isUniformlyMostPowerfulUnbiasedTest_conditional_one_sided`): rejecting for
  `T > c(S)` with conditional size `α` at `p₀` gives the UMPU test of `η ≤ η₀` against `η > η₀`.

The proof:
- on the hyperplane, `S` is sufficient and complete for the boundary family (3.4, 3.7), so
  unbiased tests have Neyman structure (6.6);
- for almost every `s`, the conditional law of `T` given `S = s` is a one-parameter family in
  `η` (3.7), in which 6.3 and 6.6 apply;
- the conditional optimality integrates to unconditional optimality.

*Needs:* 3.4, 3.7, 6.3, 6.6.

### 6.8 Invariance and duality

- For a maximal invariant `M` of a group action, a function is invariant iff it factors through
  `M` (`Function.FactorsThrough`) (Ferguson, §5.6, Thm 1, pp. 244–245).
- `x / s` is a maximal invariant of the scale group acting on pairs `(x, s)`, `s > 0` (Ferguson,
  §5.6, Example 2, p. 246).
- 1.4 is the duality of tests and confidence sets.

*Needs:* 1.4; Mathlib `MulAction`, `Function.FactorsThrough`.

### Examples

- For `N(θ, 1)` the one-sided `z`-test is UMP and the two-sided `z`-test is UMPU.
- For two Poisson counts the conditional binomial test of equal rates is the test of 6.7.

### Dependencies

Layers 1–3, and Tau Ceti's quantile function for 6.1 and 6.5.

## Layer 7: decision theory

### 7.1 Criteria

For a class `D` of rules with risk functions `R : D → Θ → ℝ`:
- `IsAdmissibleRisk R δ`: no `δ'` has `R δ' ≤ R δ` everywhere with strict inequality somewhere;
- `IsBayesRule R π δ`: `R δ` is `π`-integrable, and `∫ R δ dπ ≤ ∫ R δ' dπ` for every `δ'` with
  integrable risk;
- `IsMinimaxRule R δ`: `R δ` is bounded above, and `⨆ R δ ≤ ⨆ R δ'` for every `δ'` with risk
  bounded above.

These are Ferguson's admissible, Bayes and minimax rules (Ferguson, Def 2.1.2, p. 54, Def 1.6.1, p.
31, and Def 1.6.3, p. 33). When the rules are the randomized rules, the class `D` is the subtype
`{κ : Kernel X A // IsMarkovKernel κ}` and `R` is `fun κ ↦ risk P L κ`. For a bounded nonnegative
measurable loss and a finite prior `π`, `IsBayesRule` holds for this class iff Mathlib's
`IsBayesEstimator` holds for the loss `ENNReal.ofReal ∘ L`.

The three definitions compare a rule with different competitors: all rules, rules of
integrable risk, and rules of risk bounded above. The consequences below therefore assume that
every rule of `D` has `π`-integrable risk, which holds for instance for nonnegative bounded
measurable losses and a finite prior. Without it they are false: on `Θ = ℕ` with
`π {n} = 2^{-(n+1)}`, the risks `0` and `-2^{n+1}` make the first rule the unique Bayes rule,
although the second dominates it everywhere and has smaller supremum.
- `IsBayesRule.isAdmissibleRisk_of_unique`: for a finite prior `π`, if every rule of `D` has
  `π`-integrable risk and every Bayes rule for `π` has the same risk function as `δ`, then `δ`
  is admissible (Ferguson, Thm 2.3.1, p. 60; Berger, Thm 8, p. 253).
- For a topological `Θ` with an opens-measurable structure and a finite prior `π` that charges
  every nonempty open set, if every rule of `D` has continuous `π`-integrable risk, then every
  Bayes rule for `π` is admissible (Berger, Thm 9, p. 254; Ferguson, Thm 2.3.3, p. 62, for
  `Θ = ℝ`).
- `IsMinimaxRule.of_isBayesRule_of_risk_le`: for a probability prior `π`, if every rule of `D` has
  `π`-integrable risk and `δ` is Bayes for `π` with `R δ θ ≤ ∫ R δ dπ` for every `θ`, then `δ` is
  minimax, and `π` is least favorable: `∫ R δ dπ' ≤ ∫ R δ dπ` for every probability prior `π'` under
  which `R δ` is integrable (Ferguson, Thm 2.11.1, p. 90; Berger, Thm 17, p. 350). The prior must be
  a probability: with risk vectors `(1, 2)` and `(1.1, 1.1)` and the prior `2 δ₀`, the first rule is
  the unique Bayes rule and satisfies the risk bound, but it is not minimax.

*Needs:* 1.5; Mathlib `IsBayesEstimator`, `avgRisk`.

**Checks.**

- `IsAdmissibleRisk`: among the risk vectors `(1, 2)`, `(1.1, 1.1)` and `(2, 2)` on two
  parameters, the first two are admissible and `(2, 2)` is not.
- `IsBayesRule`: for the same vectors and the prior `(1/2, 1/2)`, the Bayes rule is `(1.1, 1.1)`
  with Bayes risk `1.1`, against `1.5` and `2`.
- `IsBayesRule`: for the prior `δ₀` only `(1, 2)` is Bayes, with Bayes risk `1`.
- `IsBayesRule`: for the zero prior every rule is Bayes; on `Θ = ℕ` with `π {n} = 2^{-(n+1)}`, a
  rule with risk `2^{n+1}` is not integrable and so is not Bayes.
- `IsMinimaxRule`: for the same vectors, `(1.1, 1.1)` is minimax with maximum `1.1`; `(1, 2)` has
  maximum `2` and is not.
- `IsMinimaxRule`: a rule with risk `θ` on `Θ = ℕ` is not bounded above and is never minimax; if
  every rule is unbounded, every rule vacuously satisfies the comparison but none is minimax.

### 7.2 Finite games and complete classes

- **Minimax theorem for finite statistical games** (`exists_statistical_game_saddle_point`): for
  finite nonempty parameter and action sets and probability laws `P θ`, there are a randomized rule
  `δ` and a prior `π` with `δ` Bayes for `π` and `risk δ θ ≤ ∫ risk δ dπ` for all `θ`. Hence `δ` is
  minimax and the minimax and maximin values agree (Ferguson, Thm 2.9.1, p. 82; Berger, Thm 15, p.
  345).

  The proof has two steps.
  - The risk set `{(risk δ θ)_θ | δ}` of a finite game is compact and convex (Ferguson, Lemma
    1.7.1, p. 35; Berger, Lemmas 9–10, p. 355). With `μ = ∑ θ, P θ`, a rule is a measurable map from
    `X` to the simplex on the actions. The risk is `∑ₐ ∫ δₐ · L(θ, a) · dP θ/dμ dμ`, a continuous
    linear function of `δ` in `L²(μ)`, since the densities are at most `1`. The rules form a bounded
    closed convex set in `L²(μ)`, which is weakly compact (Banach–Alaoglu,
    `WeakDual.isCompact_polar`, through the Riesz isomorphism `InnerProductSpace.toDual`).
  - Sion's theorem (Sion, Thm 3.4, p. 174; `Sion.exists_isSaddlePointOn`) applied to
    `(π, r) ↦ ∑ θ, π θ r θ` on the prior simplex times the risk set gives the saddle point.
- **Complete class theorem** (`exists_admissible_bayes_risk_le_of_closed_convex`): let `C` be a
  closed convex set of risk vectors in `ℝ^d`, `d > 0`, bounded below. Every point of `C` is
  dominated by an admissible point of `C` that is Bayes for a prior on the `d` parameter values
  (Ferguson, Thm 2.6.1, p. 69, and Thms 2.10.1–2.10.2, pp. 86–87). The proof separates the lower
  orthant at an admissible point.

*Needs:* 7.1; Mathlib `Sion.exists_isSaddlePointOn`, `WeakDual.isCompact_polar`,
`geometric_hahn_banach_point_closed`.

### 7.3 Equivariance and admissibility

- **Averaging over a finite group** (`exists_equivariant_rule_risk_eq_average`): consider an
  invariant decision problem with a bounded measurable invariant loss and a finite group `G`
  acting measurably on the sample and action spaces. Every randomized rule has an equivariant
  rule whose risk at `θ` is the average of its risks over the orbit of `θ` (Ferguson, §4.3,
  proof of Thm 4.3.2, p. 156). In that problem, if a minimax rule exists, an equivariant minimax
  rule exists (Ferguson, Thm 4.3.1, p. 154).
- **Blyth's method** (`isAdmissibleRisk_of_blyth`): suppose the parameter set is a convex subset
  `K` of Euclidean space with nonempty interior and the risk functions are continuous on `K`.
  Suppose finite measures `πₙ` on `K` with Bayes rules `δₙ` give every ball about a point of `K` a
  mass bounded below uniformly in `n`, every rule of `D` has `πₙ`-integrable risk for every `n`, and
  `∫ R δ₀ dπₙ - ∫ R δₙ dπₙ → 0`. Then `δ₀` is admissible (Berger, Thm 13, p. 547, which needs
  continuity only on a complete class).

*Needs:* 1.5, 7.1; Mathlib `MulAction`, `Kernel.map`.

### 7.4 Simultaneous intervals

- **Scheffé's simultaneous intervals** (`measureReal_scheffe_event_eq_one_sub`). Let
  `Y ~ N(μ, σ² I)` in `EuclideanSpace ℝ (Fin n)` with `σ > 0`, let `μ` range over a subspace `L`
  of dimension `q < n`, let `S ≤ L` be a subspace of dimension `r ≥ 1`, and let `α ∈ (0, 1)`.
  Put
  - `μ̂ = P_L Y`, the orthogonal projection onto `L`;
  - `s² = ‖Y - μ̂‖² / (n - q)`, the residual variance with `n - q` degrees of freedom;
  - `f`, the `(1 - α)`-quantile of the Fisher–Snedecor law
    `TauCeti.Probability.fisherSnedecorMeasure r (n - q)`.

  Then `P(∀ u ∈ S, |⟪u, μ̂ - μ⟫| ≤ √(r f) · s · ‖u‖) = 1 - α` (Seber–Lee, §5.1.1, pp. 123–124, with
  A.4.11, p. 463). The proof: by
  Cauchy–Schwarz, the supremum of `⟪u, v⟫² / ‖u‖²` over nonzero `u ∈ S` is `‖P_S v‖²`, so the
  event is `‖P_S (μ̂ - μ)‖² / (r s²) ≤ f`; by the Gaussian projection laws of Tau Ceti the
  numerator and denominator are independent `σ² χ²_r / r` and `σ² χ²_{n-q} / (n - q)`.

  At `n = 2`, `L = S = span (1, 1)` the event is `|2 (ȳ - m)| / |y₁ - y₂| ≤ √f`, the Student `t₁`
  interval of 5.2, of coverage exactly `1 - α`.

*Needs:* 5.2; Tau Ceti `fisherSnedecorMeasure`, `MeasureTheory.Measure.quantile`, the Gaussian
projection laws; Mathlib `multivariateGaussian`, `Submodule.orthogonalProjectionOnto`.

### 7.5 Comparison of experiments

- `IsMoreInformative P Q`: for every finite action set `Fin n` and every bounded loss, every
  randomized rule based on `Q` is matched at every parameter by a rule based on `P` with risk at
  most its risk (Blackwell–Girshick, Def 12.2.1, p. 328, for finite sample spaces; Strasser,
  Def 49.5, p. 260).
- A garbling is less informative, by 1.5.
- **Strassen's theorem** (`exists_dilation_of_convexOrder`): for probability measures `σ, τ`
  carried by a compact convex subset of `ℝ^d` with `∫ ψ dσ ≤ ∫ ψ dτ` for every continuous convex
  `ψ`, there is a Markov kernel `D` with `τ = D ∘ₘ σ` whose laws `D s` have barycentre `s` for
  `σ`-almost every `s` (Shaked–Shanthikumar, Thm 7.A.1, p. 324, on `ℝ^d` with all convex functions,
  which is equivalent for measures carried by the compact set). Its proof is the Hahn–Banach
  separation of `τ` from the weak-* compact convex set of such images.
- **Blackwell's theorem** (`isMoreInformative_iff_isGarbling`): for a finite parameter set,
  probability laws `P θ` on an arbitrary measurable space `X` and `Q θ` on a nonempty standard
  Borel space `Y`, `P` is more informative than `Q` iff `Q` is a garbling of `P`
  (Blackwell–Girshick, Thm 12.2.2, pp. 328–331, for finite sample spaces; Strasser,
  Cor 55.11, pp. 282–283, in general; the dilation route is Strasser, Thm 25.4, pp. 110–111).

  For an empty parameter set both sides hold, by a constant kernel into `Y`. For a nonempty
  `Θ` with `d` elements, the proof:
  - the likelihood vector `x ↦ (dP θ / d∑P (x))_θ` is a measurable map into the simplex `Δ`; the
    standard experiment `σ_P` is its law under the uniform mixture `d⁻¹ ∑ θ, P θ`, a probability
    measure on `Δ`. The law of the likelihood vector under `P θ` is `d s_θ σ_P(ds)`. This is a
    forward map only; no kernel back into `X` is needed;
  - the Bayes risk of a finite decision problem is the same for `P` as for its likelihood
    vector, since a Bayes rule may be chosen measurably as a function of the posterior. It is a
    minimum of finitely many linear functions of the vector, so `IsMoreInformative P Q` says
    `∫ ψ dσ_P ≥ ∫ ψ dσ_Q` for every convex piecewise-linear `ψ` on `Δ`, hence for every
    continuous convex `ψ`;
  - Strassen applied to `σ_Q` and `σ_P` gives a dilation `D` with `σ_P = D ∘ₘ σ_Q`.
    Disintegrating the coupling `σ_Q ⊗ₘ D` on the standard Borel `Δ` along its second coordinate
    gives a Markov kernel `E` from `Δ` to `Δ`. Because `D s` has barycentre `s`, `E` carries the
    law of the likelihood vector of `P` under `P θ` to that of `Q` under `Q θ`, for every `θ`;
  - the likelihood vector of `Q` is sufficient (2.2), and `Y` is standard Borel, so its
    conditional law `condDistrib` gives a Markov kernel `K` from `Δ` to `Y` with `Q θ` equal to
    `K` composed with the law of the likelihood vector under `Q θ`;
  - the composite of the likelihood vector of `P`, `E` and `K` is the garbling.

*Needs:* 1.5, 2.2, 7.1; Mathlib `condDistrib`, `WeakDual.isCompact_polar`,
`geometric_hahn_banach_point_closed`.

**Checks.**

- `IsMoreInformative`: every family is more informative than itself and than the constant family
  `Q θ = δ₀`; `N(θ, 1)` is more informative than the law of `1{x > 0}` under `N(θ, 1)`.
- `IsMoreInformative`: on `Θ = {0, 1}`, `Q θ = δ_θ` is not less informative than `P θ = N(θ, 1)`:
  the rule `a = y` has risk `0` under the 0–1 loss, which no rule based on `P` attains.
- `IsMoreInformative` with `Θ = ∅` holds whenever `Y` is nonempty: no Markov kernel `Y → Fin 0`
  exists, and for `n ≥ 1` a constant kernel serves. With `Y = ∅` and `X = ℝ` it fails at `n = 0`:
  the empty kernel on `Y` is Markov, and no Markov kernel `ℝ → Fin 0` exists.

### Examples

- Estimating a Bernoulli proportion with squared error: the constant-risk rule
  `(x + √n/2)/(n + √n)` is Bayes for a Beta prior and hence minimax by 7.1.
- A sample of size `n` is more informative than a sample of size `m ≤ n`, by the projection
  garbling.

### Dependencies

Layers 1, 2 and 5 (1.5, 2.2, 5.2).

## Layer 8: convergence and stochastic algebra

### 8.1 Adapters to Mathlib

- Convergence in law depends on the limit random variable only through its law.
- Convergence in law to `ν` with limit `id` is a.e.-measurability together with convergence of
  the laws in the `ProbabilityMeasure` topology.
- For a finite measure, convergence in measure is `∀ ε > 0, μ.real {ε < dist (f i) g} → 0`.
- The probability instance of `chiSquaredMeasure k` for natural `k`, from Tau Ceti's
  `isProbabilityMeasure_chiSquaredMeasure` and `Nat.cast_nonneg`, so that the chi-squared laws
  serve as limits. The Tau Ceti lemma takes `0 ≤ k` as a hypothesis, which blocks instance
  synthesis.

*Needs:* Mathlib `TendstoInDistribution`, `TendstoInMeasure`; Tau Ceti `chiSquaredMeasure`.

### 8.2 Boundedness in probability

- `IsBoundedInProbability μ X`, for `X : ℕ → Ω → E` and `E` a seminormed group: for every `ε > 0`
  there is `C > 0` with `μ.real {C < ‖X n‖} ≤ ε` eventually. The sets are measured by the outer
  measure, so no measurability of `X n` is required.
- For a proper normed group `E` with its Borel σ-algebra, a.e.-measurable `X n` and finite `μ`,
  boundedness in probability is tightness of the laws `μ.map (X n)` (van der Vaart, §2.1, p. 8,
  for `ℝ^k`). This is the adapter from Mathlib's
  `isTightMeasureSet_range_iff_tendsto_limsup_measure_norm_gt`, whose limit statement is
  boundedness in probability written out for the laws. In a space that is not proper only
  boundedness follows: the unit vectors of `ℓ²` are bounded in probability, and their Dirac laws
  are not tight.
- Sequences converging in law or in probability are bounded in probability (van der Vaart, Thm
  2.4(i), p. 8); so are sums, scalar multiples, and sequences dominated in norm by a bounded one.

*Needs:* 8.1; Mathlib `IsTightMeasureSet`,
`isTightMeasureSet_range_iff_tendsto_limsup_measure_norm_gt`.

**Checks.**

- `IsBoundedInProbability`: the constant sequence `X n = Z` is bounded for every real `Z`; the
  deterministic `X n = n` is not, and neither are its laws `δₙ` tight.
- `IsBoundedInProbability`: `X n = n · 1_{[0, 1/n]}` under Lebesgue measure on `[0, 1]` is bounded
  in probability, although `E X n = 1` and `X n` is unbounded.
- `IsBoundedInProbability`: in `E = ℝ²`, `X n = n e₁` is neither bounded in probability nor
  tight, while `X n = e₁ sin n` is both.

### 8.3 The algebra of convergence in probability

For real sequences under a finite measure: sums of sequences tending to `0` in probability tend
to `0`, as do constant multiples; deterministic convergence implies convergence in probability;
domination on events of probability tending to one transfers convergence to `0`; continuous
mapping at a constant; and
- `tendstoInMeasure_mul_zero_of_isBoundedInProbability`: `O_P(1) · o_P(1) = o_P(1)` (van der
  Vaart, §2.2, pp. 12–13).

*Needs:* 8.2; Mathlib `TendstoInMeasure`.

### 8.4 Slutsky and the delta method

- **Slutsky without separability** (`tendstoInDistribution_of_tendstoInMeasure_sub_of_measurable`):
  if `Xₙ → Z` in law and `Yₙ - Xₙ → 0` in probability, with `Xₙ`, `Yₙ` measurable in a seminormed
  group with opens-measurable structure, then `Yₙ → Z` in law (van der Vaart, Thm 2.7(iv), p. 10,
  for `ℝ^k`). Mathlib's `tendstoInDistribution_of_tendstoInMeasure_sub` assumes
  `[SecondCountableTopology E]`; this target does not.
- **Delta method** (`tendstoInDistribution_delta_method`): in normed spaces `E`, `F`, suppose
  `√n (Tₙ - θ) → Z` in law and `g` is measurable and differentiable at `θ` with derivative `D`.
  Then `√n (g Tₙ - g θ) → D Z` in law, and the remainder `√n (g Tₙ - g θ) - D (√n (Tₙ - θ))`
  tends to `0` in probability (van der Vaart, Thm 3.1, p. 26).

*Needs:* 8.1–8.3; Mathlib `TendstoInDistribution.continuous_comp`.

### 8.5 i.i.d. sequences

- `IsIndependentIdenticallyDistributed μ X P`, for `X : ι → Ω → E` and any index type: the `X i`
  are measurable, mutually independent, and each has law `P`.
- Measurable statistics of an i.i.d. family are i.i.d., pairwise independent and identically
  distributed, and the law of `(X 0, …, X (n-1))` is `Measure.pi`.
- **Weak law** (`tendstoInMeasure_sampleMean_of_iid`): the sample mean of an integrable measurable
  statistic converges in probability to its mean, from Mathlib's strong law
  `ProbabilityTheory.strong_law_ae` (van der Vaart, Prop 2.16, p. 15, and the remark on p. 16).
- If `∑ₖ E[Zₖ²]/bₖ² < ∞` then `Zₖ/bₖ → 0` a.s. (Chebyshev and Borel–Cantelli).
- The central limit theorem for a centred square-integrable statistic `s` is Mathlib's
  `tendstoInDistribution_inv_sqrt_mul_sum_sub` applied to `s ∘ Xᵢ`, through the adapters above;
  it is not a separate target.

*Needs:* Mathlib `iIndepFun`, `IdentDistrib`, `ProbabilityTheory.strong_law_ae`.

**Checks.**

- `IsIndependentIdenticallyDistributed`: the coordinates of `Measure.pi (fun _ : Fin n ↦ P)` are
  i.i.d. with law `P`.
- `IsIndependentIdenticallyDistributed`: `X i = X 0` for every `i` is identically distributed
  but not independent unless the law is a Dirac mass.
- `IsIndependentIdenticallyDistributed`: independent `X 0 ~ N(0, 1)` and `X 1 ~ N(0, 2)` are
  independent but not identically distributed.

### 8.6 Contiguity

- `IsContiguous l P Q`, for probability measures `P i`, `Q i` on spaces `Ω i` and a filter `l`:
  every measurable `A i` with `P i (A i) → 0` along `l` has `Q i (A i) → 0`. It is reflexive and
  transitive, and holds when `tvDist (P i) (Q i) → 0`.
- Under contiguity, convergence in `P`-probability to a constant implies convergence in
  `Q`-probability.
- `isContiguous_of_absolutelyContinuous_of_uniformlyIntegrable`: if `Q i ≪ P i` and the
  likelihood ratios are uniformly integrable, in the form that the mass `Q i` puts where
  `dQ i / dP i > C` is small uniformly in `i` for large `C`, then `Q` is contiguous to `P`
  (a consequence of Le Cam's first lemma, van der Vaart, Lemma 6.4 (iii)⇒(i), p. 88, since
  uniform integrability makes every weak limit of the likelihood ratios have mean `1`).

*Needs:* Mathlib `Measure.rnDeriv`, `tvDist`.

**Checks.**

- `IsContiguous`: `P = Q` is contiguous; `P i = N(0, 1)`, `Q i = N(1/√i, 1)` along `atTop` is
  contiguous in both directions.
- `IsContiguous`: `P i = N(0, 1)` and `Q i = N(1, 1)` constant are contiguous; `P i = δ₀` and
  `Q i = δ₁` are not, with `A i = {1}`.
- `IsContiguous`: `P i = N(0, 1)`, `Q i = N(i, 1)` is not contiguous, with `A i = {x > i/2}`.

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

Layer 9 has no headline theorems, and `Suggested.lean` states none of it. The objects are named
below in words; their Lean names follow the conventions of Mathlib.

### 9.1 Empirical objects

- The empirical distribution of a finite sample `x : Fin n → E` is Tau Ceti's
  `empiricalFiniteMeasure x`: `n⁻¹ ∑ᵢ δ_{xᵢ}`, the zero measure for `n = 0`. Its probability
  instance, integral formula `integral_empiricalFiniteMeasure`, and invariance under
  permutations `empiricalFiniteMeasure_comp_equiv` are suppliers, not targets. The sequence form
  `TauCeti.Probability.empiricalMeasure x n` uses the first `n + 1` terms; the target is that it is
  `empiricalFiniteMeasure` of `x` on `Fin (n + 1)`. No second definition is introduced.
- The sample mean `n⁻¹ ∑ xᵢ` of `x : Fin n → E` in a real module, and the sample average of the
  first `n` observations of a sequence; the two agree on the first `n` observations.
- The empirical distribution function `#{i < n | X i ω ≤ t} / n` of a sequence (van der Vaart,
  §19.1, p. 265). It is the
  distribution function of `empiricalFiniteMeasure` of the first `n` observations, and of
  `empiricalMeasure` at `n - 1` for `n > 0`. It is monotone and right-continuous, with limits
  `0` and `1` for `n > 0`, and values in `{k / n}`.
- The sample quantile `sInf {t | p ≤ F̂ₙ(t)}`, the left empirical quantile of the empirical
  distribution function `F̂ₙ`. It is `Measure.quantile` of the empirical distribution and
  satisfies the Galois inequality `q ≤ t ↔ p ≤ F̂ₙ(t)` for `n > 0` and `p ∈ (0, 1]` (van der
  Vaart, Lemma 21.1(i), p. 304, for `p < 1`).

The U-statistic is 2.4.

*Needs:* 8.5 for the sequence forms; Tau Ceti `empiricalFiniteMeasure`, `empiricalMeasure`,
`MeasureTheory.Measure.quantile`.

**Checks.**

- Empirical distribution function: for `(0.3, 0.1)` at `0.2` it is `1/2`; at `0.1` it is `1/2`
  (right-continuous), and at `0.0999` it is `0`.
- Sample quantile: for `(0.3, 0.1)` it is `0.1` at `p = 1/2` and `0.3` at `p = 0.6`; the right
  quantile would give `0.3` at `p = 1/2`.
- Sample mean: for `(1, 2, 6)` it is `3`; for `n = 0` it is `0`.

### 9.2 Distances and scores

- Total variation, statistical form. Real-valued adapters of Tau Ceti's
  `MeasureTheory.etvDist_eq_two_mul_iSup_sub` and `etvDist_le_two_mul_iff`, not a new
  development of the supremum theory. For probability measures: `|P A - Q A| ≤ tvDist P Q / 2`
  for measurable `A`; `tvDist P Q = 2 ⨆_{A measurable} |P A - Q A|`; and the supremum is attained
  at `{dP/d(P+Q) > dQ/d(P+Q)}` (Tsybakov, Lemma 2.1, p. 84, whose `V` is `tvDist / 2`).
- The Kolmogorov distance `sup_t |cdf P t - cdf Q t|`. It is a metric on probability measures on
  `ℝ`: symmetric, satisfies the triangle inequality, and is `0` iff `P = Q` (`ProbabilityTheory.cdf`
  determines the law); and it is at most `tvDist P Q / 2`.
- The Kolmogorov–Smirnov statistic `sup_{t ∈ ℚ} |F̂ₙ(t) - cdf P t|`. For `n > 0` and a
  probability measure `P`, it is the Kolmogorov distance from the empirical distribution to `P`,
  the rational supremum being the real one by right continuity. At `n = 0` the empirical
  distribution function is `0` while Mathlib's `cdf` of the zero measure is a distribution
  function, so the identity fails there. Hence it is measurable in `ω` for measurable `X i`.
- The Huber score `max (-k) (min k x)`. For `k ≥ 0` it is monotone, bounded by `k`, odd and
  `1`-Lipschitz, and it is the derivative of the Huber loss (`x²/2` for `|x| ≤ k` and
  `k|x| - k²/2` otherwise) (van der Vaart, Examples 5.4 and 5.28, pp. 42–43 and 58).

*Needs:* 9.1; Tau Ceti `etvDist_eq_two_mul_iSup_sub`, `etvDist_le_two_mul_iff`; Mathlib
`tvDist`, `cdf`.

**Checks.**

- Total variation: `tvDist δ₀ δ₁ = 2`, and `A = {0}` gives `|1 - 0| = 1 = 2/2`; with the supremum
  normalization the bound `|P A - Q A| ≤ tvDist / 2` would read `1 ≤ 1/2`.
- Kolmogorov distance: `δ₀` and `δ₁` are at distance `1`; `δ₀` and `δ_ε` are at distance `1` for
  every `ε > 0`, while their total variation is `2`.
- Huber score: at `k = 1` it takes the values `-1, 1/2, 1` at `-3, 1/2, 3`; at `k = 0` it is `0`.
- Kolmogorov–Smirnov statistic: for `n = 1` and `P` uniform on `[0, 1]` it is `1/2` at `X 0 = 1/2`
  (at `t = 1/2`) and `1` at `X 0 = 0` (at `t = 0`).

### 9.3 Nonparametric and high-dimensional objects

- The kernel density estimator `(n h)⁻¹ ∑ K((t - xᵢ)/h)` of a finite sample (Tsybakov, (1.2),
  p. 3), and its sequence form. For `h > 0`, `n > 0`: it is nonnegative for `K ≥ 0`; it integrates
  to `∫ K` for integrable `K`; and it is the density of the convolution of the empirical
  distribution with the law of density `K_h`, for a probability density `K`.
- The number of nonzero coordinates of `x : EuclideanSpace ℝ (Fin p)` is Mathlib's
  `hammingNorm (WithLp.ofLp x)`; no separate sparsity is defined. Also the restricted `ℓ¹` norm
  `∑_{j ∈ S} |xⱼ|` and the best `s`-sparse `ℓ¹` error `inf {‖x - y‖₁ | hammingNorm y ≤ s}`. The
  error is `0` iff `hammingNorm x ≤ s`; it is antitone in `s` and at most `‖x‖₁`; it equals the
  restricted norm on `Sᶜ` for a set `S` of `s` largest coordinates of `|x|`, so the infimum is
  attained (Foucart–Rauhut, Def 2.2, p. 42); and
  `hammingNorm (x + y) ≤ hammingNorm x + hammingNorm y`, from `hammingDist_triangle`.
- The restricted isometry property of order `s` and constant `δ`:
  `(1 - δ)‖x‖² ≤ ‖A x‖² ≤ (1 + δ)‖x‖²` for every `s`-sparse `x`. It passes to smaller orders and
  larger constants, and for `δ < 1` and order `2s`, `A` is injective on `s`-sparse vectors
  (Foucart–Rauhut, Def 6.1, p. 133, and Thm 2.13, p. 49).
- The Benjamini–Hochberg count: the largest `k ≤ m` with at least `k` p-values at most `k α / m`
  (Dickhaus, Def 5.6, p. 80).
  It is at most `m`, monotone in `α`, and antitone in each p-value. For `0 ≤ α` the rejection set
  `{i | p i ≤ k α / m}`, with `k` this count, has exactly `k` elements. For negative `α` it can
  have more.

*Needs:* 9.1; Mathlib `hammingNorm`, `hammingDist_triangle`, `Measure.conv`.

**Checks.**

- Kernel density estimator: for `K` the indicator of `[-1/2, 1/2]`, `h = 1` and the sample
  `(0)`, it is `1` on `[-1/2, 1/2]`; for the sample `(0, 2)` it is `1/2` at `0` and `0` at `1`.
- Best sparse error: for `x = (3, -1, 2)` and `s = 1` it is `3`; for `s = 0` it is `‖x‖₁ = 6`; for
  `s = 3` it is `0`.
- Restricted `ℓ¹` norm: for `x = (3, -1, 2)` it is `3` on `S = {1, 2}` (zero-indexed), the best
  `1`-sparse error, `0` on `S = ∅`, and `6` on all three coordinates.
- Benjamini–Hochberg: for `p = (0.01, 0.04, 0.5)` and `α = 0.1` the count is `2` with rejection
  set of size `2`; for `p = (-1, -1)` and `α = -3` the count is `0` with rejection set of size `2`.
- Restricted isometry: the identity has the property with `δ = 0` for every order; the matrix
  `[[1, 1]]` has `‖A eᵢ‖² = 1`, so it holds at order `1` with `δ = 0`, and fails at order `2` for
  every `δ < 1`, since `A (e₁ - e₂) = 0`.

### 9.4 Bayesian and Monte Carlo objects

- The Poisson mass `e^{-θ} θˣ / x!` for real `θ`. It is `poissonMeasure` on singletons for
  `θ ≥ 0`, and the masses sum to `1` for every real `θ`.
- On a finite state space `ι` with the discrete measurable structure, for weights `π : ι → ℝ`
  and a proposal `q : ι → ι → ℝ`: the Metropolis acceptance `min 1 (π y q y x / (π x q x y))`, equal
  to `1` when `π x q x y = 0`, and the Metropolis–Hastings kernel `Kernel ι ι`, which moves from `x`
  to `y ≠ x` with probability `q x y` times the acceptance and stays at `x` with the remaining
  probability. Write `∑ x, π x • δ_x` for the weight measure. For positive `π` and a nonnegative `q`
  with rows summing to `1`, the kernel is Markov and `Kernel.IsReversible` holds for the weight
  measure. This is the computation that the acceptance rule gives detailed balance (Robert–Casella,
  Thm 7.2(a), p. 272). Invariance is then Mathlib's `Kernel.IsReversible.invariant`, not a target.
  Further chain theory is MarkovChainsAndRenewal's.
- One leapfrog step with identity mass matrix for a gradient `g` and step `h`, and the momentum
  flip `(x, p) ↦ (x, -p)`. The flip, the step, the flip and the step compose to the identity; for
  measurable `g` the step preserves Lebesgue measure, being a composition of shears; and it is
  injective (Leimkuhler–Reich, §2.5, p. 26, and §4.3.1, p. 82, for `g` a gradient).
- The normal-location posterior: the normalized measure with density
  `prior θ · exp(-n (θ - m)²/(2v))`. For `v > 0` and a nonnegative measurable prior for which
  this density has positive finite integral, it is a probability measure, and for a
  `N(μ₀, τ²)` prior it is `N` with precision `n/v + 1/τ²` and the precision-weighted mean
  (Casella–Berger, Example 7.2.16, p. 263).
- Integrals of functions of a finitely valued random variable are finite sums over its values.

*Needs:* Mathlib `poissonMeasure`, `Kernel.IsReversible`, `gaussianReal`.

**Checks.**

- Poisson mass: at `θ = 1` the masses at `0, 1, 2` are `e⁻¹, e⁻¹, e⁻¹/2`; at `θ = -1` the mass at
  `1` is `-e`, and the masses still sum to `1`.
- Metropolis–Hastings: for `π = (1, 2)` and the proposal that always flips, the flows are
  `1 · 1 = 2 · (1/2)`; for a symmetric proposal the acceptance is `min 1 (π y / π x)`.
- Leapfrog: for `d = 1`, `g = id`, `h = 1`, `z = (1, 0)`, the step gives `(0.5, -0.75)`, and flip,
  step, flip return `(1, 0)`.
- Normal posterior: for a `N(0, 1)` prior, `n = v = 1` and `m = 2`, the posterior is `N(1, 1/2)`.

### 9.5 Linear-model and design objects

- The quadratic form `⟪x, A x⟫` on `EuclideanSpace ℝ (Fin d)`: it is measurable, continuous, and
  nonnegative for positive semidefinite `A`.
- The scatter matrix `∑ᵢ (xᵢ - x̄)(xᵢ - x̄)ᵀ`. It is symmetric and positive semidefinite, and
  equals `∑ xᵢ xᵢᵀ - n x̄ x̄ᵀ` (Anderson, Lemma 3.2.1, p. 68).
- The Gaussian negative log-likelihood `(n/2) log det C + ½ ∑ (xᵢ - m)ᵀ C⁻¹ (xᵢ - m)`. For `n > 0`
  and a positive definite scatter matrix, it is minimized over `m` and positive definite `C` at
  `(x̄, scatter / n)` (Anderson, Lemma 3.2.2 and Thm 3.2.1,
  pp. 69–70).
- `(c • A)⁻¹ = c⁻¹ • A⁻¹` for `c ≠ 0`, singular `A` included; Mathlib's `Matrix.inv_smul` needs
  `IsUnit A.det`.
- Simple random sampling. The design of size `n` from `Fin N` is Mathlib's
  `uniformOn {s : Finset (Fin N) | s.card = n}`, on the discrete measurable space of finsets; its
  probability instance is `isProbabilityMeasure_uniformOn` for `n ≤ N`. The targets:
  - it is the law of the image set of Tau Ceti's `sampleWithoutReplacement` with `n` draws;
  - for `1 ≤ N` and `n ≤ N`, each unit has inclusion probability `n/N`; for `2 ≤ N` and
    `n ≤ N`, each pair of distinct units has inclusion probability `n(n-1)/(N(N-1))`;
  - for the population mean of `y : Fin N → ℝ` (divisor `N`) and the population variance
    (divisor `N - 1`): for `1 ≤ n ≤ N` the sample mean is unbiased for the population mean, and
    for `2 ≤ N` and `1 ≤ n ≤ N` its variance is `(1 - n/N)` times the population variance over
    `n` (Bickel–Doksum, Example 3.4.1, p. 177).
- Latin squares of order `s` and their orthogonality. `(i, j) ↦ i + j` in `ZMod s` is a Latin
  square, and for prime `s` the squares `(i, j) ↦ i + a j` for distinct nonzero `a` are Latin and
  mutually orthogonal (Cox–Reid, §4.1.1, §4.1.3 and Appendix B.3).

*Needs:* Mathlib `uniformOn`, `Matrix.PosSemidef`; Tau Ceti `sampleWithoutReplacement`;
Exchangeability (completed), Layer 8.

**Checks.**

- Simple random sampling: for `N = 3`, `n = 2` each of the three pairs has probability `1/3`, and
  each unit has inclusion probability `2/3`.
- Sample mean under the design: for `N = 2`, `n = 1`, `y = (0, 2)` its variance is `1`, which is
  `(1 - 1/2) · 2 / 1`; for `n = N` it is `0`.
- Latin squares: `(i, j) ↦ i + j` in `ZMod 3` is Latin; `(i, j) ↦ i` is not; in `ZMod 4`, `a = 2`
  gives a square that is not Latin, so primality is used.
- Scatter matrix: for the scalars `(0, 2)` it is `2`; for one observation it is `0`.
- Quadratic form: for `A = diag(1, -1)` it is `0` at `(1, 1)` and `-1` at `(0, 1)`, negative since
  `A` is not positive semidefinite; for `A = I` it is `‖x‖²`.
- Gaussian negative log-likelihood: for `d = 1`, the sample `(0, 2)`, `m = 1` and `C = 1` it is
  `log 1 + ½ (1 + 1) = 1`, the minimum, at `(x̄, scatter / n) = (1, 1)`; at `C = 2` it is
  `log 2 + ½ = 1.193…`.

### 9.6 Dependent-data and survival objects

- Weak stationarity of `X : ℤ → H` in an inner product space over `𝕜`:
  `⟪X s, X t⟫ = ⟪X 0, X (t - s)⟫`. The autocovariance `γ h = ⟪X 0, X h⟫` has
  `γ (-h) = conj (γ h)`, and the matrix `(γ (j - i))_{i, j ∈ s}` is positive semidefinite for every
  finite set `s` of indices (Brockwell–Davis, Thm 4.1.1, p. 115).
- i.i.d. noise of variance `σ² > 0` under a probability measure `μ`: an i.i.d. family indexed by
  `ℤ` (8.5), integrable with mean `0`, and with second moment `σ²`. Each variable is
  square-integrable, by `memLp_two_of_variance_ne_zero`, with mean `0` and second moment `σ²`,
  and in `L²` the noise is weakly stationary with `γ h = σ² 1_{h = 0}`.
- The sample autocovariance `n⁻¹ ∑_{i < n-h} (X_{i+h} - X̄)(X_i - X̄)`. With divisor `n`, the
  matrix `(γ̂(|i - j|))_{i, j < k}` is positive semidefinite for every `k` (Brockwell–Davis, §7.2,
  pp. 220–221, for `k = n`; for `k > n` the extra entries vanish).
- For failure times `T` and censoring times `C` of subjects `i < n`, the observed time of `i` is
  `min (T i) (C i)` and its failure is observed when `T i ≤ C i`. At a time `s`: the at-risk count
  `Y(s)` of subjects with observed time at least `s`; the failure count `d(s)` of observed
  failures at time exactly `s`; and the finite set of distinct observed failure times `≤ t`.

  The Nelson–Aalen estimator is `∑_s d(s) / Y(s)` and the Kaplan–Meier estimator
  `∏_s (1 - d(s) / Y(s))`, over the distinct observed failure times `s ≤ t`. Tied failures enter
  through one factor `1 - d/Y`: two subjects failing together at the only failure time give `0`,
  not `(1 - 1/2)²` (Aalen–Borgan–Gjessing, (3.13), p. 84, and (3.32), p. 94). The targets:
  - when the observed failure times are distinct, Kaplan–Meier is the product over observed
    failures `i` of `1 - 1 / Y(T i)`, and likewise for Nelson–Aalen;
  - Kaplan–Meier lies in `[0, 1]` and is antitone; Nelson–Aalen is nonnegative and monotone;
  - when every failure is observed (`T i ≤ C i` for `i < n`) and the failure times are distinct,
    Kaplan–Meier is one minus the empirical distribution function of the failure times
    (Aalen–Borgan–Gjessing, p. 91);
  - Kaplan–Meier is at most `exp` of minus Nelson–Aalen.

*Needs:* 8.5, 9.1; Mathlib `memLp_two_of_variance_ne_zero`, `Matrix.PosSemidef`.

**Checks.**

- Kaplan–Meier: two tied failures at the only failure time give `0`, and `0 ≤ e^{-1}`; for
  `T = (1, 2)` uncensored, at `t = 2` it is `(1 - 1/2)(1 - 1) = 0`, and Nelson–Aalen is `1.5`.
- Kaplan–Meier: for `T = (1, 2)` with the second censored at `1.5`, at `t = 2` it is `1/2`.
- Weak stationarity: a constant sequence `X t = v` is stationary; `X t = t v` is not.
- Sample autocovariance: for `(1, -1)` at `h = 0` it is `1`, at `h = 1` it is `-1/2`.
- i.i.d. noise: i.i.d. Rademacher signs `±1` are i.i.d. noise of variance `1`, with
  `γ h = 1_{h = 0}`; one sign repeated at every time is not independent, and i.i.d. `N(1, 1)`
  variables do not have mean `0`.

### Examples

- The empirical distribution function of `(0.3, 0.1)` at `0.2` is `1/2`.
- The Metropolis–Hastings kernel for a symmetric proposal accepts with probability
  `min 1 (π y / π x)`.

### Dependencies

Layer 8 (8.5 for i.i.d. noise and the sequence forms); Tau Ceti's empirical measures, quantile
function, total variation identities and `sampleWithoutReplacement`; Mathlib otherwise.

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
Science project, and Layers 8 and 9 in its shared files `Basic.lean`. Most targets are proved
there. The minimax theorem of 7.2, Blackwell's theorem 7.5, the Pitman–Koopman–Darmois theorem
3.8 and the conditional tests of 6.7 are stated there with admitted proofs. The completions this
roadmap adds are not there:
- the conditional-expectation form of sufficiency in 2.1;
- the regular form of the information inequality;
- the optimality of U-statistics in 4.2;
- Neyman–Pearson necessity and the sum-of-errors form;
- least favorable concentration;
- Scheffé's intervals;
- contiguity beyond the definition;
- most of the Layer 9 theory.

The lean-CKSD file on processes defines Kaplan–Meier and Nelson–Aalen with one factor per failed
subject, which is wrong for tied failures; 9.6 defines them per distinct failure time. lean-CKSD
also has its own empirical distribution, where 9.1 uses Tau Ceti's.

The map, which is not prescriptive, lists the directories of `CKSD/Inference/` and `CKSD/`:

| Layer | lean-CKSD files |
|---|---|
| 1 | Inference: Basic, Model, Density, Factorization (mixtures) |
| 2 | Inference: Sufficiency, Factorization, ExponentialFamily (2.2), Families, SymmetricCompleteness, Estimation (Basu); Asymptotics: Basic (U-statistics) |
| 3 | Inference: ExponentialFamily, LaplaceDeterminacy, LogPartition, MeanParametrization, ExponentialFamilyMLE, ConditionalExponentialFamily, Decision (3.5) |
| 4 | Inference: Estimation, Gaussian, Families (Pitman) |
| 5 | Inference: Families, Testing (Gaussian sample laws) |
| 6 | Inference: NeymanPearson, Testing, IntervalTestConstruction, InvariantTesting, ConditionalExponentialFamily |
| 7 | Inference: Decision, Gaussian (Scheffé) |
| 8 | Inference: Basic; Asymptotics: Basic; Bayes: Basic (8.5) |
| 9 | Asymptotics, Nonparametric, Bayes, LinearModels, Processes: Basic |

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

The locators refer to these editions; page numbers are printed page numbers.

- L. D. Brown, *Fundamentals of Statistical Exponential Families*, IMS Lecture Notes 9, 1986.
- G. Casella and R. L. Berger, *Statistical Inference*, 2nd ed., CRC Press, 2024 (reissue of the
  Duxbury 2002 edition).
- D. R. Cox and D. V. Hinkley, *Theoretical Statistics*, Chapman and Hall, 1974.
- T. S. Ferguson, *Mathematical Statistics: A Decision Theoretic Approach*, Academic Press, 1967.
- J. Pfanzagl, *Parametric Statistical Theory*, de Gruyter, 1994.
- M. J. Schervish, *Theory of Statistics*, Springer, 1995.
- M. Sion, On general minimax theorems, *Pacific J. Math.* 8 (1958), 171–176.
- A. W. van der Vaart, *Asymptotic Statistics*, Cambridge University Press, 1998.

Layers 7–9 also cite:

- O. O. Aalen, Ø. Borgan and H. K. Gjessing, *Survival and Event History Analysis*, Springer,
  2008.
- T. W. Anderson, *An Introduction to Multivariate Statistical Analysis*, 3rd ed., Wiley, 2003.
- J. O. Berger, *Statistical Decision Theory and Bayesian Analysis*, 2nd ed., Springer, 1985.
- P. J. Bickel and K. A. Doksum, *Mathematical Statistics*, Vol. I, 2nd ed., CRC Press, 2015.
- D. Blackwell and M. A. Girshick, *Theory of Games and Statistical Decisions*, Wiley, 1954
  (Dover reprint, 1979).
- P. J. Brockwell and R. A. Davis, *Time Series: Theory and Methods*, 2nd ed., Springer, 1991.
- D. R. Cox and N. Reid, *The Theory of the Design of Experiments*, Chapman and Hall/CRC, 2000.
- T. Dickhaus, *Simultaneous Statistical Inference*, Springer, 2014.
- S. Foucart and H. Rauhut, *A Mathematical Introduction to Compressive Sensing*, Birkhäuser,
  2013.
- B. Leimkuhler and S. Reich, *Simulating Hamiltonian Dynamics*, Cambridge University Press,
  2004.
- C. P. Robert and G. Casella, *Monte Carlo Statistical Methods*, 2nd ed., Springer, 2004.
- G. A. F. Seber and A. J. Lee, *Linear Regression Analysis*, 2nd ed., Wiley, 2003.
- M. Shaked and J. G. Shanthikumar, *Stochastic Orders*, Springer, 2007.
- H. Strasser, *Mathematical Theory of Statistics*, de Gruyter, 1985.
- A. B. Tsybakov, *Introduction to Nonparametric Estimation*, Springer, 2009.


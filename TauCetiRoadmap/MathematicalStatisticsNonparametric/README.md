# Roadmap: nonparametric statistics

**Summary.** This roadmap builds the theory of nonparametric inference on Mathlib's measure
theory, Markov kernels, divergences and Hilbert spaces:
- divergences between probability measures (Hellinger, chi-squared, Kullback–Leibler, total
  variation) and the inequalities between them;
- the minimax lower-bound toolkit: reduction to testing, Le Cam's two-point method, Fano's
  method, the Varshamov–Gilbert bound and Assouad's lemma;
- ranks, signed ranks and linear rank statistics, their exact null laws and their asymptotics,
  locally most powerful and asymptotically optimal rank tests, the Hodges–Lehmann estimator;
- goodness of fit: distribution-freeness and the limit laws of the Kolmogorov–Smirnov and
  Cramér–von Mises statistics, the Kolmogorov distribution, a Dvoretzky–Kiefer–Wolfowitz bound;
- smoothing: kernels of order `ℓ`, kernel density estimation, linear smoothers, local
  polynomial regression, Stone's consistency theorem, cross-validation, reproducing kernels and
  smoothing splines, and the minimax rates over Hölder and Sobolev classes;
- the Gaussian sequence model: ellipsoids, Pinsker's theorem, soft thresholding, the
  chi-bar-squared law and the nonparametric detection boundary;
- shape constraints: isotonic regression and its risk, the Grenander estimator and Chernoff's
  limit, log-concave maximum likelihood;
- functional data: covariance operators on a separable Hilbert space, the Karhunen–Loève
  expansion, the Hilbertian central limit theorem, functional principal components and
  functional linear regression.

Headlines that restate a source result carry a theorem, definition,
section or equation locator with its printed page in a text listed under References; corollaries
and adaptations are derived in the proof routes.

**This roadmap is a supplier.** Layers 1 and 2 and the soft-threshold section 6.4 are
self-contained: they need only Mathlib, Tau Ceti and
[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) (6.4 also uses
the finite form of 6.1), and their headline statements are the contract used by the high-dimensional
statistics roadmap MathematicalStatisticsHighDimensional (see
[Downstream consumers](#downstream-consumers)). The remaining layers also consume the
empirical-process, contiguity and argmax material of the asymptotic statistics roadmap
MathematicalStatisticsAsymptotic (see [Exact supplier contracts](#exact-supplier-contracts)).

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. The headlines without a Lean name are those whose carrier is missing at the
pins; the module docstring of `Suggested.lean` lists them with the carrier each one lacks.

Suggested home: `TauCeti/Statistics/Nonparametric/`, with one subdirectory per layer.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Divergences.** The Hellinger affinity and distance, the chi-squared divergence, the
   Kullback–Leibler complements (finite products, Gaussian laws, binary divergence), and the
   comparison inequalities of Le Cam, Pinsker, Bretagnolle–Huber and the chi-squared bound,
   with the testing affinity `1 - tvDist / 2`.
2. **Minimax lower bounds.** Reduction of estimation to testing, Le Cam's two-point bounds in
   total variation, Hellinger and Kullback–Leibler form, the Varshamov–Gilbert bound, Fano's
   inequality for the average and the maximal error with the mutual-information bound, Assouad's
   lemma with its metric form, and the corollaries for Mathlib's `minimaxRisk`.
3. **Exact rank theory.** Ranks and signed ranks and their null laws, linear rank statistics
   with their means and variances, exact and approximate scores, score-generating functions of
   location and scale families, the sign test, the Wilcoxon signed-rank and Mann–Whitney laws,
   Kendall's tau and Spearman's rho under independence, the Kruskal–Wallis statistic, the
   Hodges–Lehmann estimator, and the distribution-freeness of the one- and two-sample
   Kolmogorov–Smirnov and Cramér–von Mises statistics. The Kolmogorov distribution and the
   Cramér–von Mises limit law.
4. **Rank and goodness-of-fit asymptotics.** The projection of a rank statistic and the rank
   central limit theorem, the limits of the classical rank statistics, locally most powerful
   rank tests and their asymptotic optimality, the Chernoff–Savage inequality, the
   Hodges–Lehmann limit, the Kolmogorov–Smirnov limit and the identification of the Kolmogorov
   law, a Dvoretzky–Kiefer–Wolfowitz bound, the Cramér–von Mises limit, the two-sample
   Kolmogorov–Smirnov limit and its consistency, and the Kolmogorov–Smirnov statistic with
   estimated parameters.
5. **Smoothing.** Hölder and Sobolev classes, kernels of order `ℓ`, bias, variance, asymptotic
   normality and mean integrated squared error of the kernel density estimator, universal `L¹`
   consistency, linear smoothers and the leave-one-out identity, Nadaraya–Watson and local
   polynomial asymptotics in the interior and at the boundary, Stone's theorem,
   cross-validation, the representer theorem, smoothing splines as linear smoothers, and the
   minimax rates of density estimation and of Hölder regression.
6. **The Gaussian sequence model.** Ellipsoids, periodic Sobolev classes as ellipsoids,
   Pinsker's linear minimax theorem and its asymptotic minimaxity, the Sobolev rate and constant,
   the soft-threshold oracle inequality, the chi-bar-squared law for polyhedral cones, and the
   detection boundary.
7. **Shape constraints.** Isotonic least squares and its max–min and convex-minorant
   characterizations, its risk bound and the matching lower bound, the Grenander estimator, the
   switching relation, the local empirical-process limit and the cube-root limit with Chernoff's
   distribution, and log-concave
   maximum likelihood with its Hellinger rates.
8. **Functional data.** The covariance operator of a square-integrable random element of a
   separable Hilbert space, its eigen-expansion, the Karhunen–Loève expansion, Gaussian measures
   with a given trace-class covariance, the Hilbertian central limit theorem, the asymptotics of
   functional principal components and their optimality, and functional linear regression.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- the vocabulary of
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md): tests,
  the law of the ranks (5.1), U-statistics (2.4), convergence in probability and in law with
  Slutsky's lemma and the delta method (Layer 8), i.i.d. sequences (8.5), contiguity (8.6), the
  empirical distribution function and the sample quantile (9.1), the statistical form of total
  variation and the Kolmogorov–Smirnov statistic (9.2), and the kernel density estimator (9.3).
  This roadmap proves the asymptotic and minimax theory of these objects, not their definitions
  or their finite-sample identities;
- the empirical-process toolkit: weak convergence in `ℓ^∞(T)`, the classical Donsker theorem for
  the empirical distribution function with the Brownian bridge limit, Donsker theorems for
  bracketing and VC classes, maximal inequalities, and the argmax continuous-mapping theorem,
  owned by MathematicalStatisticsAsymptotic. The one triangular-array empirical-process limit
  this roadmap needs, the local empirical process at the cube-root scale (7.4), is owned here;
- the asymptotic theory of experiments: the Lindeberg–Feller and multivariate central limit
  theorems, asymptotic normality of nondegenerate U-statistics with the Hoeffding projection,
  local asymptotic normality of smooth models, Le Cam's third lemma, the asymptotic power
  envelope, and Pitman efficiency with the efficiencies `3/π` of the Wilcoxon test and
  `108/125` of the Hodges–Lehmann bound, all owned by MathematicalStatisticsAsymptotic. Layer 4
  applies them to rank statistics;
- Wiener measure, Brownian motion and Brownian bridges as processes, owned by the
  StochasticCalculus roadmap (its Wiener measure on `C(ℝ≥0, ℝ)` and its Brownian bridges). This
  roadmap uses Mathlib's `IsBrownianReal` predicate and never constructs a process;
- the Kullback–Leibler divergence, its chain rule, its tensorization for two factors, Pinsker's
  inequality and McDiarmid's inequality, already proved in Tau Ceti;
- trace-class operators as an operator ideal, owned by OperatorTheory/OperatorIdeals; Layer 8
  consumes nothing from it. It uses Tau Ceti's approximation numbers
  `ContinuousLinearMap.singularValue` and `ContinuousLinearMap.nuclearENorm` as the trace norm,
  introduces no second trace-class carrier, and proves the identity it needs between
  `nuclearENorm` of a positive compact operator and the sum of its diagonal entries in a Hilbert
  basis (8.2);
- Gaussian integration by parts `E[Z f(Z)] = E f'(Z)` for smooth `f`, owned by RandomMatrices
  §2.5; 4.4 states the form for nondecreasing maps as its own target;
- the high-dimensional theory (sparse minimax rates, the Lasso, multiple testing), which consumes
  Layers 1 and 2 and 6.4 and belongs to MathematicalStatisticsHighDimensional.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace TauCeti, with Mathlib's `ProbabilityTheory`
  and `MeasureTheory` opened throughout. `Suggested.lean` states the prototypes in the namespace
  `TauCetiRoadmap.MathematicalStatisticsNonparametric`.
- **Families, tests and samples** are those of
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md): a family
  is `P : Θ → Measure X` with `[∀ θ, IsProbabilityMeasure (P θ)]`; a test is a measurable
  `φ : X → ℝ` with values in `[0, 1]`; a sample of size `n` is `x : Fin n → E` with the law
  `Measure.pi (fun _ : Fin n ↦ P)`; i.i.d. sequences are Foundations'
  `IsIndependentIdenticallyDistributed μ X P` (8.5).
- **Estimators are Markov kernels.** An estimator with values in `Y` is a Markov kernel
  `κ : Kernel X Y`, `[IsMarkovKernel κ]`, as in Mathlib's `minimaxRisk`; a deterministic
  estimator `T` enters as `Kernel.deterministic T hT`. The law of the estimate under `P θ` is
  `κ ∘ₘ P θ`. Every lower bound of Layers 2, 5, 6 and 7 is stated for all Markov kernels, so it
  covers randomized estimators. The corollaries for Mathlib's `minimaxRisk ℓ P` take
  `P : Kernel Θ X` and `ℓ : Θ → Y → ℝ≥0∞`.
- **Risks of unbounded losses are extended integrals.** A risk with an unbounded nonnegative
  loss, such as `∫⁻ y, ENNReal.ofReal (d y θ ^ 2) ∂(κ ∘ₘ P θ)`, is a lower Lebesgue integral in
  `ℝ≥0∞`, and suprema and infima of such risks are taken in `ℝ≥0∞`, so that an estimator without
  a finite second moment has infinite risk, not the Bochner junk value `0`. Every lower bound over
  all estimators is stated this way; a real-valued corollary carries an explicit integrability
  hypothesis. Real integrals of losses appear only for bounded losses (Hamming loss, error
  probabilities), in upper bounds for a fixed estimator, and in identities that carry the
  integrability hypotheses making the integrals finite (5.2, 5.7).
- **Log-likelihoods are extended reals.** The log-likelihood `∫ log f dP` of a density is in
  `EReal`, with the value `⊥` unless `f > 0` holds `P`-almost everywhere and `log f` is
  `P`-integrable. A finite-sample likelihood is the product `∏ f (x i)`; its logarithm is used
  only for densities positive at every observation.
- **Total variation** is Mathlib's `tvDist`, with values in `[0, 2]` for probability measures.
  The statistical distance `sup_A |P A - Q A|` is `tvDist P Q / 2` (Foundations 9.2), and Tsybakov's
  `V(P, Q)` is `tvDist P Q / 2`. Every bound of Layers 1 and 2 is written with `tvDist / 2`, never
  with a separate supremum.
- **Hellinger.** The Hellinger affinity is `∫ √(p q) dν` for densities `p`, `q` of `P`, `Q` with
  respect to `ν = P + Q`, and the squared Hellinger distance is
  `sqHellinger P Q = 2 (1 - affinity) = ∫ (√p - √q)² dν`, with values in `[0, 2]` (Tsybakov,
  Def 2.3, p. 83; Samworth–Shah use the same normalization). It is not halved.
- **Chi-squared** is `chiSqDiv P Q = ∫⁻ (dP/dQ)² dQ - 1` in `ℝ≥0∞` when `P ≪ Q`, and `∞`
  otherwise (Tsybakov, p. 86).
- **Kullback–Leibler** is Mathlib's `InformationTheory.klDiv` in `ℝ≥0∞`. Real forms use
  `(klDiv P Q).toReal` under the hypothesis `klDiv P Q ≠ ∞`.
- **Gaussian sequence laws.** The law of `Y = θ + ε ξ` on `ℕ → ℝ` is
  `Measure.infinitePi (fun j ↦ gaussianReal (θ j) (ε²))`, for every `θ : ℕ → ℝ`, without a
  summability condition. Risks are `∫⁻ y, ∑' j, ENNReal.ofReal ((T y j - θ j)²)`, so the junk
  value of a nonsummable error is `∞`. A minimax risk over `Θ ⊆ ℕ → ℝ` is
  `⨅ κ Markov, ⨆ θ ∈ Θ` of the risk, the shape of Mathlib's `minimaxRisk`.
- **Ranks.** For `x : Fin n → ℝ`, `rank x i = #{j | x j ≤ x i}`, a natural number. For distinct
  entries it is the one-based position of `x i` in the sorted sample, and it equals
  `(Tuple.sort x).symm i + 1`. Under an atomless law ties are null, so every distributional
  statement is unaffected by the convention for ties. A score vector is `a : ℕ → ℝ`, read at
  ranks `1, …, N`.
- **Convergence.** Convergence in probability and in law are Mathlib's `TendstoInMeasure` and
  `TendstoInDistribution` (Foundations Layer 8). When a statement would need weak convergence in
  `ℓ^∞(T)`, this roadmap states its real-valued consequence (for example the law of
  `√n · KS`), and consumes the `ℓ^∞(T)` statement from MathematicalStatisticsAsymptotic inside
  the proof.
- **Limit laws are measures.** The Kolmogorov distribution is a Stieltjes measure defined by
  its distribution function, the Cramér–von Mises limit is the law of a series of independent
  squared Gaussians, and the Chernoff variable is the largest maximizer of a two-sided Brownian
  motion with parabolic drift. Brownian motion enters only through Mathlib's `IsBrownianReal`
  and only in the identification theorems 4.6, 4.7 and 7.4.
- **Hilbert spaces.** Functional data live in a real separable Hilbert space `H`
  (`[InnerProductSpace ℝ H] [CompleteSpace H] [SeparableSpace H]`) with its Borel σ-algebra.
  Mathlib's `ProbabilityTheory.covarianceOperator` is uncentered; the centered covariance of 8.1
  is that of the law of `X - E X`.
- **Eigenvalues** of a compact positive operator are listed in decreasing order as its
  approximation numbers `ContinuousLinearMap.singularValue C j`, indexed from `0`, with
  multiplicity, so that the `j`-th eigenvalue of the texts is index `j - 1`.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references). A locator marked *by the same argument* names the theorem whose
  proof the target follows when the target's hypotheses differ from those printed. A target
  without a locator carries a proof route.

## Exact supplier contracts

### From Mathlib

- **Divergences:** `InformationTheory.klDiv` with `klDiv_map_le` (data processing,
  `Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean`) and `klDiv_compProd_eq_add`
  (`ChainRule.lean`), `InformationTheory.klFun`; `MeasureTheory.tvDist`, `etvDist`,
  `tvDist_triangle`, `tvDist_comm`, `tvDist_self`, `tvDist_eq_zero_iff`, `tvDist_le_add`,
  `tvDist_eq_integral_abs_rnDeriv_of_ac`, `tvDist_of_mutuallySingular`
  (`Mathlib/MeasureTheory/Measure/TotalVariation/`).
- **Decision theory:** `ProbabilityTheory.avgRisk`, `bayesRisk`, `minimaxRisk`,
  `bayesRisk_le_minimaxRisk`, `iSup_bayesRisk_le_minimaxRisk`
  (`Mathlib/Probability/Decision/Risk/`).
- **Combinatorics and entropy:** `hammingDist`, `hammingNorm`
  (`Mathlib/InformationTheory/Hamming.lean`), `Metric.packingNumber`
  (`Mathlib/Topology/MetricSpace/CoveringNumbers.lean`), `Tuple.sort`, `Equiv.Perm`,
  `Finset.card`.
- **Measures and kernels:** `Measure.pi`, `Measure.infinitePi`
  (`Mathlib/Probability/ProductMeasure.lean`), `Measure.rnDeriv`, `Measure.withDensity`, `Kernel`,
  `IsMarkovKernel`, `Kernel.deterministic`, `Measure.bind`, `StieltjesFunction.measure`, `cdf`,
  `MeasureTheory.condExp`, `ProbabilityTheory.bernoulliMeasure`.
- **Gaussian laws and limit theorems:** `gaussianReal`, `stdGaussian`, `multivariateGaussian`,
  `IsGaussian` (`Mathlib/Probability/Distributions/Gaussian/`), Fernique's moment bound
  `IsGaussian.memLp_id`, the central limit
  theorem `tendstoInDistribution_inv_sqrt_mul_sum_sub`, the Cramér–Wold device
  `tendstoInDistribution_iff_tendstoInDistribution_inner`, martingale convergence
  `tendsto_ae_condExp` and `tendsto_eLpNorm_condExp`
  (`Mathlib/Probability/Martingale/Convergence.lean`).
- **Brownian motion:** `IsPreBrownianReal`, `IsBrownianReal`
  (`Mathlib/Probability/BrownianMotion/Basic.lean`), processes `ℝ≥0 → Ω → ℝ` with continuous
  paths.
- **Hilbert spaces and operators:** `HilbertBasis`, `Orthonormal`, `OrthonormalBasis`,
  `OrthogonalFamily.summable_iff_norm_sq_summable`,
  `Submodule.orthogonalProjectionOnto`, `Submodule.starProjection`,
  `exists_norm_eq_iInf_of_complete_convex` and `norm_eq_iInf_iff_real_inner_le_zero`
  (`Mathlib/Analysis/InnerProductSpace/Projection/`), `IsCompactOperator`,
  `ContinuousLinearMap.IsPositive`, `LinearMap.IsSymmetric`, `Module.End.HasEigenvector`; the
  reproducing-kernel Hilbert space class `RKHS` with `RKHS.kerFun` and `RKHS.inner_kerFun`
  (`Mathlib/Analysis/InnerProductSpace/Reproducing.lean`); the uncentered covariance operator
  `ProbabilityTheory.covarianceOperator` with `covarianceOperator_inner` and
  `isPositive_covarianceOperator` (`Mathlib/Probability/Moments/CovarianceBilin.lean`).
- **Analysis:** `HolderWith`, `HolderOnWith`, `iteratedDeriv`, `ContDiff`, `ConcaveOn`,
  `ConvexOn`, `MonotoneOn`, `AntitoneOn`, `Real.cos` and `Real.sin` for the trigonometric
  bases, `intervalIntegral`, `MeasureTheory.Lp`, `HasSum`.

### From Tau Ceti

- **Kullback–Leibler** (`TauCeti/InformationTheory/KullbackLeibler/`): Pinsker
  `TauCeti.etvDist_sq_le_two_mul_klDiv` and `TauCeti.two_mul_sq_measureReal_sub_le_klDiv`
  (`Pinsker.lean`); `TauCeti.klDiv_prod_prod`, `TauCeti.klDiv_prod_prod_eq_add`,
  `TauCeti.klDiv_prod_left`, `TauCeti.klDiv_prod_right`,
  `TauCeti.klDiv_compProd_eq_add_lintegral` (`ChainRule.lean`); convexity
  `TauCeti.klDiv_smul_add_smul_le` (`Convex.lean`); `TauCeti.klDiv_eq_sum_klFun_singleton`
  (`Finite.lean`); `TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure` (`Variational.lean`).
- **Total variation:** `MeasureTheory.etvDist_eq_two_mul_iSup_sub`.
- **Concentration:** McDiarmid's inequality
  `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences_fin`
  (`TauCeti/Probability/McDiarmid.lean`).
- **Counting laws:** `TauCeti.Probability.hasLaw_card_filter_mem_pi` (Poisson-binomial counts,
  `TauCeti/Probability/Distributions/PoissonBinomial/Count.lean`),
  `TauCeti.Probability.iIndepFun.hasLaw_sum_bernoulli`,
  `TauCeti.Probability.binomial_tail_eq_regularizedIncompleteBeta`.
- **Order statistics and quantiles:** `TauCeti.orderStatistic`
  (`TauCeti/Data/Fin/Tuple/OrderStatistic.lean`), the chamber formula
  `TauCeti.Probability.map_orderStatistics_pi` and
  `TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`
  (`TauCeti/Probability/Distributions/OrderStatistic/`), `MeasureTheory.Measure.quantile`,
  `MeasureTheory.Measure.cdf_map_eq_volume_restrict` and
  `MeasureTheory.Measure.map_quantile_volume_Ioo` (`TauCeti/Probability/Quantile.lean`).
- **Gaussian projections:** `HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian` and
  `HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian`
  (`TauCeti/Probability/Distributions/Gaussian/Projection.lean`); the chi-squared laws
  `TauCeti.Probability.chiSquaredMeasure`.
- **Empirical measures:** `TauCeti.Probability.empiricalFiniteMeasure`.
- **Approximate identities:** `TauCeti.tendsto_eLpNorm_normed_convolution_sub`
  (`TauCeti/MeasureTheory/Function/Lp/ApproximateIdentity.lean`).
- **Log-concavity:** `TauCeti.LogConcave` for `f : E → ℝ≥0∞`
  (`TauCeti/Analysis/Convex/LogConcave.lean`) and the Prékopa–Leindler consequence
  `TauCeti.LogConcave.lintegral_prod_right` (`TauCeti/MeasureTheory/Integral/PrekopaLeindler.lean`).
- **Hilbert–Schmidt operators:** `ContinuousLinearMap.hilbertSchmidtEnergy` and
  `ContinuousLinearMap.hilbertSchmidtNorm`
  (`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean`),
  `ContinuousLinearMap.tsum_singularValue_sq_eq_hilbertSchmidtEnergy`
  (`OperatorIdeal/ApproximationNumber/HilbertSchmidt.lean`), and the min–max characterization
  `singularValue_eq_iInf_nnnorm_comp_orthogonal` (`ApproximationNumber/MinMax.lean`).
- **Spectral theory and approximation numbers:**
  `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`
  (`TauCeti/Analysis/InnerProductSpace/Spectrum.lean`): a compact symmetric operator on a Hilbert
  space has a Hilbert basis of eigenvectors; `ContinuousLinearMap.singularValue`
  (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.lean`),
  `ContinuousLinearMap.abs_singularValue_sub_singularValue_le` (`|aₙ(S) - aₙ(T)| ≤ ‖S - T‖`),
  `IsCompactOperator.tendsto_singularValue`, `ContinuousLinearMap.nuclearENorm`
  (`OperatorIdeal/Nuclear/Basic.lean`), `ContinuousLinearMap.kyFanGauge`,
  `ContinuousLinearMap.IsPositive.exists_orthonormal_kyFanGauge_le_sum_re_inner_add`, and the
  finite-dimensional Ky
  Fan principle `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`.

### From MathematicalStatisticsFoundations

[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) is consumed
as follows, with its names as the contract:
- 2.4: the U-statistic `uStatistic m n h x`;
- 5.1: the law of the ranks: under an atomless law the sorting permutation is uniform and
  independent of the order statistics;
- 1.3: statistical tests `IsStatisticalTest` (functions with values in `[0, 1]`) and their level,
  used in 6.6;
- 6.2: the Neyman–Pearson lemma for tests in `[0, 1]`, used in 3.2 for locally most powerful
  rank tests;
- Layer 8: the adapters to Mathlib's `TendstoInMeasure` and `TendstoInDistribution` (8.1),
  boundedness in probability (8.2), Slutsky's lemma and the delta method (8.4),
  `IsIndependentIdenticallyDistributed` with the weak law of large numbers (8.5), and contiguity
  (8.6);
- 9.1: the empirical distribution function `empiricalCdf` and the sample quantile;
- 9.2: the statistical form of total variation, the distribution-function bound and the
  Kolmogorov–Smirnov statistic `sup_{t ∈ ℚ} |F̂ₙ(t) - cdf P t|`;
- 9.3: the kernel density estimator `(n h)⁻¹ ∑ K((t - xᵢ)/h)` and its integral identities.
- 9.4: the posterior of the normal-location model, used in 6.3 for the Bayes risk of the
  Pinsker lower bound.

### From MathematicalStatisticsAsymptotic

The asymptotic statistics roadmap MathematicalStatisticsAsymptotic owns the following, consumed
by name and material:
- weak convergence in `ℓ^∞(T)` with the continuous-mapping theorem (2.2), convergence from
  finite-dimensional laws plus asymptotic equicontinuity, and the uniqueness of a tight law
  given its finite-dimensional marginals (2.3);
- the bracketing maximal inequality (3.3), stated with the extended outer expectation of 2.1,
  and the classical Glivenko–Cantelli theorem for the empirical distribution function (3.4);
- the classical Donsker theorem for the empirical distribution function with the Brownian bridge
  limit (3.4), the Brownian bridge law described by its marginals (2.4);
- the Donsker theorems for bracketing (3.4) and VC (3.5) classes (for 4.7 with estimated
  parameters);
- the Lindeberg–Feller central limit theorem and the multivariate central limit theorem (1.2);
- asymptotic normality of nondegenerate U-statistics with the Hoeffding projection and variance
  (6.2);
- local asymptotic normality of quadratic-mean differentiable models (7.3), Le Cam's third lemma
  (7.2), and the asymptotic power envelope for one-sided tests (8.2);
- the argmax continuous-mapping theorem (4.3), whose hypotheses include the uniform tightness of
  the maximizers (for every `ε > 0` a compact set contains them with outer probability at least
  `1 - ε` for all large `n`), and the rate theorem for M-estimators (5.6), whose modulus bound is
  stated with the extended outer expectation of 2.1 and which needs consistency in outer
  probability;
- Pitman efficiency (8.3) with its hypotheses, used in 4.4, and the efficiencies of the sign and
  Wilcoxon tests relative to the `t` test.
- influence functions `HasInfluenceFunction` (9.1) and the influence function of a functional
  Hadamard differentiable at the distribution function (9.2), used in 4.5 for the Hodges–Lehmann
  functional.

### From StochasticCalculus

The StochasticCalculus roadmap owns Wiener measure on `C(ℝ≥0, ℝ)`, Brownian bridges, and the
law of large numbers `B t / t → 0` for Brownian motion (its §1.4). This roadmap consumes the
existence of a process satisfying Mathlib's `IsBrownianReal` and the a.s. growth `B t / t → 0` of
§1.4, in 7.4. The
Brownian bridge enters only through MathematicalStatisticsAsymptotic's Donsker theorem (3.4).

## How to read the build

Layers 1 and 2 are information theory of finitely many experiments. Every lower bound in the
roadmap is one of four arguments, all in Layer 2: two hypotheses (Le Cam), many separated
hypotheses (Fano), a hypercube of hypotheses (Assouad), each fed by a bound on a divergence from
Layer 1 and, for Fano, a packing from the Varshamov–Gilbert bound. Layers 5, 6 and 7 apply them
to specific classes: perturbations of a fixed density or regression function by bumps scaled to
the bandwidth.

Layers 3 and 4 are rank theory. Every exact statement is one fact, the uniform law of the rank
vector (Foundations 5.1), and every limit statement is the projection of a rank statistic
onto a sum of independent terms, after which the central limit theorems and LAN of
MathematicalStatisticsAsymptotic apply. The goodness-of-fit statistics reduce, by the quantile
transform, to the uniform case, and their limits are real-valued functionals of the Brownian
bridge.

Layer 5 is bias–variance calculus with kernels; its single nonelementary input is the
approximate identity of Tau Ceti for `L¹` consistency. Layer 6 is Gaussian computations in the
sequence model, with the Bayes risk of Gaussian priors as the lower bound. Layer 7 is convex
analysis of least squares under order and concavity constraints, plus the cube-root asymptotics
built on the argmax theorem. Layer 8 is spectral theory of compact positive operators.

Layers 1, 3, 5, 6 and 8 need none of the others except as stated in their `*Needs:*` lines.
Layers 1 and 2 may be built first. They and 6.4 are the only parts that
MathematicalStatisticsHighDimensional consumes.

## Layer 1: divergences

Throughout, `P`, `Q` are probability measures on a measurable space `X`.

### 1.1 The Hellinger affinity and distance

- `hellingerAffinity P Q = ∫ √(dP/dν · dQ/dν) dν` with `ν = P + Q`, a real number, and
  `sqHellinger P Q = 2 (1 - hellingerAffinity P Q)` (Conventions).
- **Independence of the dominating measure** (`hellingerAffinity_eq_integral`,
  `sqHellinger_eq_integral`). For every σ-finite `μ` with `P ≪ μ` and `Q ≪ μ`,
  `hellingerAffinity P Q = ∫ √(dP/dμ · dQ/dμ) dμ` and
  `sqHellinger P Q = ∫ (√(dP/dμ) - √(dQ/dμ))² dμ` (Tsybakov, Def 2.3 and property (iii), p. 83).
  Proof: chain rule for `rnDeriv` through `ν ≪ μ`, and `√(f g) · h = √(f h · g h)`.
- **Range** (`hellingerAffinity_mem_Icc`). `0 ≤ hellingerAffinity P Q ≤ 1`, hence
  `0 ≤ sqHellinger P Q ≤ 2` (Tsybakov, Def 2.3, property (ii), p. 83); `sqHellinger P Q = 0 ↔ P = Q`
  and `sqHellinger P Q = 2 ↔ P ⟂ₘ Q`. The upper bound on the affinity is Cauchy–Schwarz in `L²(ν)`.
- **Metric** (`sqrt_sqHellinger_triangle`). `√(sqHellinger P Q)` is symmetric and satisfies the
  triangle inequality (Tsybakov, Def 2.3, property (i), p. 83): it is the `L²(μ)` distance of
  `√(dP/dμ)` and `√(dQ/dμ)` for `μ = P + Q + R`.
- **Products.** `hellingerAffinity (P.prod P') (Q.prod Q')` is the product of the affinities
  (`hellingerAffinity_prod`), and for finite products
  `hellingerAffinity (Measure.pi P) (Measure.pi Q) = ∏ i, hellingerAffinity (P i) (Q i)`
  (`hellingerAffinity_pi`). Hence
  `sqHellinger (Measure.pi (fun _ : Fin n ↦ P)) (Measure.pi (fun _ ↦ Q)) = 2 (1 - (1 - sqHellinger P Q / 2)^n)`
  (Tsybakov, Def 2.3, property (iv), p. 83). Proof: densities of products are products of densities,
  and Tonelli. At `n = 0` both sides are `0`: the empty product is `1`.
- **Data processing** (`hellingerAffinity_le_comp`). For a Markov kernel `κ : Kernel X Y`,
  `hellingerAffinity P Q ≤ hellingerAffinity (κ ∘ₘ P) (κ ∘ₘ Q)`; in particular for a measurable map
  `T`, `hellingerAffinity P Q ≤ hellingerAffinity (P.map T) (Q.map T)` (Samworth–Shah,
  Lemma 8.10, p. 233, for measurable maps and every `f`-divergence, of which
  `sqHellinger` is the case `f(x) = (√x - 1)²`; for kernels by the same argument). Proof: with
  `p = dP/dν`, `q = dQ/dν` and the joint law `π = ν ⊗ₘ κ` on `X × Y`, whose second marginal is
  `κ ∘ₘ ν`, the densities of `κ ∘ₘ P` and `κ ∘ₘ Q` with respect to `κ ∘ₘ ν` are the conditional
  expectations `p'` and `q'` of `p ∘ Prod.fst` and `q ∘ Prod.fst` under `π` given the second
  coordinate (`MeasureTheory.condExp`). The conditional Cauchy–Schwarz inequality
  `E[√(p q) | Y] ≤ √(p' q')` and integration against `κ ∘ₘ ν` give the claim. No joint density with
  respect to `ν ⊗ (κ ∘ₘ ν)` is used; none need exist (an identity kernel with an atomless `ν` has a
  joint law on the diagonal). Measurable maps are the deterministic kernels.
- **Gaussian laws** (`hellingerAffinity_gaussianReal`).
  `hellingerAffinity (gaussianReal a v) (gaussianReal b v) = exp (-(a - b)² / (8 v))` for `v > 0`;
  for the Gaussian sequence laws of the Conventions with `ε ≠ 0` and `θ - θ'` finitely supported,
  the affinity is `exp (-‖θ - θ'‖² / (8 ε²))`, the norm a finite sum over the support
  (`hellingerAffinity_infinitePi_gaussianReal`). Proof: with `φ_c` the density of `N(c, v)`,
  completing the square gives `√(φ_a φ_b) = exp (-(a - b)² / (8 v)) · φ_{(a+b)/2}`; the sequence
  form by the splitting into the finite support and its complement of 1.3, and the products bullet.

*Needs:* Mathlib `Measure.rnDeriv`, `Measure.pi`, `integral_gaussian`, `condExp`.

**Checks.**

- `hellingerAffinity (Ber 1/2) (Ber 1/4) = √(1/8) + √(3/8) = 0.96593`, and
  `hellingerAffinity P P = 1` for every probability measure `P`.
- `sqHellinger (gaussianReal 0 1) (gaussianReal 1 1) = 2 (1 - e^{-1/8}) = 0.2350`.
- Bernoulli: `sqHellinger (Ber 1/2) (Ber 1/4) = (√(1/2) - √(1/4))² + (√(1/2) - √(3/4))² = 0.06815`.
- `sqHellinger δ₀ δ₁ = 2`: the affinity is `0`; a halved convention would give `1`.

### 1.2 The chi-squared divergence

- `chiSqDiv P Q` (Conventions), with values in `[0, ∞]`; `chiSqDiv P Q = 0 ↔ P = Q` for probability
  measures (`chiSqDiv_eq_zero_iff`). The truncated subtraction in `ℝ≥0∞` loses nothing: for `P ≪ Q`
  with `P` a probability measure, `∫⁻ (dP/dQ)² dQ ≥ (∫⁻ dP/dQ dQ)² = 1` by Cauchy–Schwarz.
- **Products** (`one_add_chiSqDiv_pi`).
  `1 + chiSqDiv (Measure.pi P) (Measure.pi Q) = ∏ i, (1 + chiSqDiv (P i) (Q i))` (Tsybakov, p. 86,
  property (ii)). If some `P i` is not absolutely continuous with respect to `Q i`, both sides are
  `∞`: a cylinder set over a `Q i`-null set separates the products, and every factor is at least
  `1`.
- **Gaussian laws** (`one_add_chiSqDiv_gaussianReal`).
  `1 + chiSqDiv (gaussianReal a v) (gaussianReal b v) = exp ((a - b)² / v)`
  for `v > 0`. Proof: `dP/dQ (x) = exp ((a - b)(x - b)/v - (a - b)²/(2v))`, and the moment
  generating function of `gaussianReal b v`.
- **Gaussian mixtures** (`one_add_chiSqDiv_gaussianMixture`). For `ε > 0`, a probability measure `π`
  on `EuclideanSpace ℝ (Fin d)` and `P̄ = ∫ N(θ, ε² I) dπ(θ)` (the bind of `π` with the Gaussian
  kernel), `1 + chiSqDiv P̄ (N(0, ε² I)) = ∫⁻∫⁻ exp (⟪θ, θ'⟫ / ε²) dπ(θ) dπ(θ')`, both sides in
  `ℝ≥0∞`. Proof: the density of `P̄` with respect to `N(0, ε² I)` is
  `∫ exp (⟪θ, y⟫/ε² - ‖θ‖²/(2ε²)) dπ(θ)`; square, apply Tonelli and the Gaussian moment generating
  function. This is the identity used for the detection lower bound of 6.6.

*Needs:* Mathlib `Measure.rnDeriv`, `Measure.pi`, `multivariateGaussian`, `mgf` of `gaussianReal`.

**Checks.**

- `chiSqDiv (gaussianReal 1 1) (gaussianReal 0 1) = e - 1 = 1.7183`.
- `chiSqDiv (Ber 1/2) (Ber 1/4) = (1/2)²/(1/4) + (1/2)²/(3/4) - 1 = 1/3`.
- Mixture identity for `π` the uniform law on `{±1}` in `d = 1`, `ε = 1`:
  `1 + χ² = (e + e^{-1})/2 = cosh 1 = 1.5431`, and numerical integration of the squared density
  ratio gives the same value.
- Absolute continuity: `chiSqDiv (Ber 1/2) δ₀ = ∞`, while `chiSqDiv δ₀ (Ber 1/2) = 2² · ½ - 1 = 1`.
  Without the `P ≪ Q` branch the first would be `(½)² - 1`, truncated to `0`, for two different
  laws.

### 1.3 Kullback–Leibler complements

- **Finite products** (`klDiv_pi`).
  `klDiv (Measure.pi P) (Measure.pi Q) = ∑ i, klDiv (P i) (Q i)` for
  `P Q : Fin n → Measure X` probability measures (Tsybakov, property (iii), p. 85), by induction
  from Tau Ceti's `klDiv_prod_prod_eq_add` through `MeasurableEquiv.piFinSuccAbove`; hence
  `klDiv (P^n) (Q^n) = n · klDiv P Q`.
- **Gaussian laws** (`klDiv_gaussianReal`, `klDiv_infinitePi_gaussianReal`).
  `klDiv (gaussianReal a v) (gaussianReal b v) = ENNReal.ofReal ((a - b)² / (2 v))` for `v > 0`
  (Tsybakov, Cor 2.1(i), p. 87, for `v = 1`; general `v` by the scaling `x ↦ x / √v`, a measurable
  bijection, which preserves `klDiv`), and for the Gaussian sequence laws with `ε ≠ 0` and `θ - θ'`
  finitely supported, `klDiv = ofReal (‖θ - θ'‖² / (2 ε²))`. Proof for the sequence laws: split `ℕ`
  into the finite support `S` and its complement; `Measure.infinitePi` is the product of the two
  blocks; the complement block is the same law under both parameters.
- **Isotropic Gaussian laws on `ℝ^d`** (`klDiv_multivariateGaussian`): for
  `a, b : EuclideanSpace ℝ (Fin d)` and `v > 0`,
  `klDiv (multivariateGaussian a (v • 1)) (multivariateGaussian b (v • 1)) = ofReal (‖a - b‖² / (2 v))`.
  Proof: both laws are images of `Measure.pi (fun _ ↦ gaussianReal · v)` under the coordinate
  equivalence, which preserves `klDiv`; then the finite-product formula and the scalar form. The
  scalar form is `klDiv_gaussianReal`.
- **Binary divergence** (`klDiv_bernoulliMeasure`, `convexOn_klBin`).
  `klBin a b = a log (a/b) + (1 - a) log ((1 - a)/(1 - b))` for
  `a, b ∈ [0, 1]`, with `0 log 0 = 0`, as a real number for `b ∈ (0, 1)`. For `a ∈ [0, 1]` and
  `b ∈ (0, 1)` it is the divergence of `Ber a` from `Ber b` (the laws on `Bool` with mass `a` and
  `b` at `true`), and it is jointly convex on
  `[0, 1] × (0, 1)` (Samworth–Shah, proof of Thm 8.11, p. 235). Outside `b ∈ (0, 1)` the Lean
  definition takes the junk value of `Real.log 0 = 0` where the divergence is `∞` (at
  `b ∈ {0, 1}` with `a ≠ b`).
- **Fano's lower bound for `klBin`** (`mul_log_sub_log_two_le_klBin`):
  `klBin a (1/M) ≥ a log M - log 2` for `M ≥ 2` and `a ∈ [0, 1]` (Samworth–Shah, (8.10),
  p. 235, which has `log (2 - b)` in place of `log 2`). Proof:
  `klBin a b = -h(a) - a log b - (1 - a) log (1 - b) ≥ -log 2 + a log (1/b)`, with
  `h ≤ log 2` the binary entropy and `-(1 - a) log (1 - b) ≥ 0`. For `M = 1` the point `b = 1` is
  outside `(0, 1)`.
- **Data processing to an event** (`ofReal_klBin_le_klDiv`). For a measurable set `A`,
  `ENNReal.ofReal (klBin (P.real A) (Q.real A)) ≤ klDiv P Q`, by `klDiv_map_le` for the
  indicator of `A`. When `Q.real A ∈ {0, 1}` and `P.real A` differs from it, `klBin` takes the junk
  value `(1 - a) log (1 - a)` or `a log a`, which is at most `0`, so the inequality still holds.

*Needs:* Tau Ceti `klDiv_prod_prod_eq_add`, `klDiv_smul_add_smul_le`,
`klDiv_eq_sum_klFun_singleton`; Mathlib `klDiv_map_le`, `Measure.infinitePi`.

**Checks.**

- `klDiv (gaussianReal 0 1) (gaussianReal 1 1) = 1/2`.
- `klBin (1/2) (1/4) = ½ log 2 + ½ log (2/3) = 0.14384`, the divergence of `Ber 1/2`
  from `Ber 1/4`.
- `klBin (1/4) (1/2) = ¼ log ½ + ¾ log (3/2) = 0.13081`: the arguments do not commute,
  and the swapped order would give `0.14384`.
- `klBin a (1/M) ≥ a log M - log 2` at `a = 1`, `M = 2`: `log 2 ≥ 0`; at `a = 1/2`, `M = 2`:
  `0 ≥ -½ log 2`.

### 1.4 Comparison inequalities

- **Testing affinity** (`iInf_test_eq_one_sub_tvDist`, `one_sub_tvDist_eq_integral_min`,
  `iInf_kernel_test_eq_one_sub_tvDist`). For probability measures,
  `⨅ φ test, (∫ φ dP + ∫ (1 - φ) dQ) = 1 - tvDist P Q / 2 = ∫ min (dP/dν) (dQ/dν) dν`, with
  `ν = P + Q`, and the infimum is attained by the indicator of `{dP/dν < dQ/dν}`. The second
  equality is Scheffé's theorem (Tsybakov, Lemma 2.1, p. 84); the first is the minimal sum of the
  two error probabilities (Tsybakov, proof of Thm 2.2, pp. 90–91; Samworth–Shah, after Lemma 8.4,
  p. 226, for nonrandomized tests; a test in `[0, 1]` changes nothing, since the sum is affine in
  `φ` and minimized pointwise). The infimum over Markov kernels `ψ : Kernel X Bool` of
  `(ψ ∘ₘ P) {true} + (ψ ∘ₘ Q) {false}` is the same number, with `φ x = ψ x {true}`.
- **Le Cam's inequalities** (`sq_one_sub_sqHellinger_le_integral_min`,
  `sqHellinger_le_tvDist_le`; Tsybakov, Lemma 2.3, p. 86):
  `∫ min (dP/dν) (dQ/dν) dν ≥ ½ (1 - sqHellinger P Q / 2)²` and
  `sqHellinger P Q ≤ tvDist P Q ≤ √(sqHellinger P Q · (4 - sqHellinger P Q))`.
- **Hellinger and Kullback–Leibler** (`ofReal_sqHellinger_le_klDiv`; Tsybakov, Lemma 2.4, p. 87):
  `ENNReal.ofReal (sqHellinger P Q) ≤ klDiv P Q`.
- **Pinsker** (Tsybakov, Lemma 2.5(i), p. 88): `ENNReal.ofReal (tvDist P Q) ^ 2 ≤ 2 * klDiv P Q`,
  which is Tau Ceti's `etvDist_sq_le_two_mul_klDiv` read through the definition of `tvDist`.
- **Bretagnolle–Huber** (`half_exp_neg_klDiv_le`; Tsybakov, Lemma 2.6, p. 89):
  `1 - tvDist P Q / 2 ≥ ½ exp (-(klDiv P Q).toReal)` when `klDiv P Q ≠ ∞`.
- **Chi-squared bound** (`klDiv_le_log_one_add_chiSqDiv`; Tsybakov, Lemma 2.7, p. 90):
  `klDiv P Q ≤ ENNReal.ofReal (log (1 + (chiSqDiv P Q).toReal))` when `chiSqDiv P Q ≠ ∞`, and
  the right side is at most `chiSqDiv P Q` since `log (1 + x) ≤ x`. Proof: Jensen for the concave
  `log` under `P`, with `dP/dQ` as the integrand.

*Needs:* 1.1, 1.2; Mathlib `tvDist_eq_integral_abs_rnDeriv_of_ac`, `klDiv`; Tau Ceti
`etvDist_sq_le_two_mul_klDiv`; Mathlib `ConcaveOn.le_map_integral` for Jensen.

**Checks** (for `P = N(0, 1)`, `Q = N(1, 1)`):

- `tvDist = 2 (2 Φ(1/2) - 1) = 0.76585`;
  `sqHellinger = 0.2350 ≤ 0.76585 ≤ √(0.2350 · 3.7650) = 0.9406`.
- `1 - tvDist / 2 = 0.6171 ≥ ½ (1 - 0.1175)² = 0.3894` and `≥ ½ e^{-1/2} = 0.3033`.
- Pinsker: `0.76585² = 0.5865 ≤ 2 · ½ = 1`.
- `klDiv = 0.5 ≤ log (1 + (e - 1)) = 1 ≤ e - 1`.
- Bernoulli `Ber 1/2`, `Ber 1/4`: `tvDist = 1/2`; `sqHellinger = 0.0681 ≤ 1/2`;
  `klDiv = 0.1438 ≥ 0.0681`; Pinsker `1/4 ≤ 0.2877`; `log (4/3) = 0.2877 ≥ 0.1438`.

### Examples

- Two Dirac masses `δ₀`, `δ₁`: `tvDist = 2`, `sqHellinger = 2`, `klDiv = ∞`, `chiSqDiv = ∞`, and
  the testing affinity `1 - 2/2 = 0`: the test `1_{x = 1}` makes no error.

### Dependencies

Mathlib and the Kullback–Leibler files of Tau Ceti only. This layer and Layer 2 are the contract
consumed by MathematicalStatisticsHighDimensional.

## Layer 2: minimax lower bounds

Throughout, `(Y, d)` is a pseudometric space with its Borel σ-algebra, an estimator is a Markov
kernel `κ : Kernel X Y`, and a family `θ : ι → Y` of parameters indexes observation laws
`P : ι → Measure X`.

### 2.1 Reduction to testing

- **Estimation to testing** (`le_max_measure_dist_ge_of_test`): if `ι` is finite and nonempty and
  `d (θ i) (θ j) ≥ 2 s` for `i ≠ j`, then for every estimator `κ` there is a Markov kernel
  `ψ : Kernel X ι` with `(ψ ∘ₘ P i) {i}ᶜ ≤ (κ ∘ₘ P i) {y | s ≤ d y (θ i)}` for every `i`
  (Tsybakov, (2.8), p. 80; Wainwright, Prop 15.1 and its proof, pp. 487–488; Samworth–Shah, proof
  of Lemma 8.1, p. 222, all for deterministic estimators; for kernels by the same argument). If
  `ψ y ≠ i` then `d y (θ (ψ y)) ≤ d y (θ i)`, so `2 s ≤ d (θ i) (θ (ψ y)) ≤ 2 d y (θ i)`. The
  test is the composition of `κ` with a
  measurable nearest-parameter map `Y → ι` (minimum of the finitely many continuous functions
  `d · (θ j)` with ties broken by a fixed linear order on `ι`).
- **Risk form** (`mul_measure_le_lintegral_edist`). For every measure `P`, kernel `κ`, point
  `θ : Y`, real `s` and monotone `ℓ : ℝ≥0∞ → ℝ≥0∞`,
  `∫⁻ y, ℓ (edist y θ) ∂(κ ∘ₘ P) ≥ ℓ (ENNReal.ofReal s) · (κ ∘ₘ P) {y | s ≤ d y θ}`, applied with
  `P i` and `θ i` (Markov's inequality; Tsybakov, (2.5), p. 79). No measurability of `ℓ` is needed:
  the lower integral is monotone and the set is measurable.

*Needs:* Mathlib `Kernel.deterministic`, `Kernel.comp`, `measurable_dist`; Layer 1 not needed.

### 2.2 Le Cam's two-point method

For two parameters `θ₀`, `θ₁` with `d θ₀ θ₁ ≥ 2 s` and every estimator `κ`, writing
`e j = (κ ∘ₘ P j).real {y | s ≤ d y (θ j)}`:
- **Total variation form** (`max_measure_ge_of_tvDist`, Tsybakov, Thm 2.2(i), p. 90;
  Wainwright, (15.13), p. 491): `max (e 0) (e 1) ≥ (1 - tvDist (P 0) (P 1) / 2) / 2`. Proof:
  2.1 and the testing affinity of 1.4, since `max ≥` the average.
- **Hellinger form** (`max_measure_ge_of_sqHellinger`, Tsybakov, Thm 2.2(ii), p. 90): if
  `sqHellinger (P 0) (P 1) ≤ α < 2`, then `max (e 0) (e 1) ≥ ½ (1 - √(α (1 - α / 4)))`. Proof: the
  second Le Cam inequality of 1.4 and the monotonicity of `x (1 - x/4)` on `[0, 2]`.
- **Kullback–Leibler form** (`max_measure_ge_of_klDiv`, Tsybakov, Thm 2.2(iii), p. 90): if `α ≥ 0`
  and `klDiv (P 0) (P 1) ≤ ofReal α`, then
  `max (e 0) (e 1) ≥ max (¼ exp (-α)) ((1 - √(α / 2)) / 2)`. Proof: Bretagnolle–Huber and Pinsker in
  1.4.
- **Samples** (`max_measure_ge_of_pi`). For `P j = Q j ^ n` and an estimator
  `κ : Kernel (Fin n → X) Y`: when `klDiv (Q 0) (Q 1) ≠ ∞`, the Kullback–Leibler form holds with
  `α = n (klDiv (Q 0) (Q 1)).toReal` (1.3), and, when `sqHellinger (Q 0) (Q 1) < 2`, the Hellinger
  form with `α = 2 (1 - (1 - sqHellinger (Q 0) (Q 1) / 2)^n) < 2` (1.1).
- **Minimax risk** (`minimaxRisk_ge_of_tvDist`; Samworth–Shah, Lemma 8.4, p. 225, for the
  squared loss). For `P : Kernel Θ X`, two points `θ₀ θ₁ : Θ`, a map `g : Θ → Y` with
  `d (g θ₀) (g θ₁) ≥ 2 s` and `s ≥ 0`, and the loss
  `ℓ θ y = ofReal (d y (g θ) ^ 2)`, Mathlib's
  `minimaxRisk ℓ P ≥ ofReal (s² (1 - tvDist (P θ₀) (P θ₁) / 2) / 2)`. The sign condition is
  needed: for `s < 0` the separation hypothesis is vacuous while `s²` is positive.

*Needs:* 1.1–1.4, 2.1; Mathlib `minimaxRisk`.

### 2.3 The Varshamov–Gilbert bound

- **Hamming balls** (`card_hammingDist_le`). For `m ≥ 1` and `0 ≤ r ≤ m/2`, the number of
  `ω : Fin m → Bool` with `hammingDist ω 0 ≤ r` is at most `2^m exp (-2 (m/2 - r)² / m)`, with `0`
  the constant `false` word. Proof: Hoeffding's inequality (Tsybakov, Lemma 2.8, p. 104) for a sum
  of `m` independent fair Bernoulli variables, as in the proof of Tsybakov, Lemma 2.9, p. 105.
- **Varshamov–Gilbert** (`exists_varshamovGilbert`, Tsybakov, Lemma 2.9, p. 104): for `m ≥ 8`
  there are `M ≥ 2^{m/8}` and `ω : Fin (M + 1) → (Fin m → Bool)` with `ω 0 = 0` and
  `m / 8 ≤ hammingDist (ω j) (ω k)` for `j ≠ k`. Proof (Tsybakov, pp. 104–105): with
  `D = ⌊m/8⌋`, choose points greedily, each at distance more than `D` from the earlier ones,
  until the cube is exhausted; the balls of radius `D` about them cover the cube, so
  `(M + 1) · #ball(D) ≥ 2^m`, and the ball bound with `r = D ≤ m/8` gives
  `M + 1 ≥ exp (9m/32) ≥ 2^{m/8} + 1` for `m ≥ 8`.
- The packing form (`le_packingNumber_hamming`): the greedy points are separated by at least
  `D + 1 > m/8`, strictly, so on `Hamming (fun _ : Fin m ↦ Bool)` with its metric, Mathlib's
  `Metric.packingNumber` at radius `m/8` of the whole cube is at least `M + 1 > 2^{m/8}`. The strict
  separation matters, since Mathlib's `Metric.IsSeparated` asks for `m/8 < edist`.

*Needs:* Mathlib `hammingDist`, `Hamming`, `Metric.packingNumber`; the Hoeffding bound from
Mathlib's `HasSubgaussianMGF` for bounded variables.

**Checks**: the ratio of `2^m` to the size of the Hamming ball of radius `⌊m/8⌋` is
`28.4`, `478`, `7216` and `103620` for `m = 8, 16, 24, 32`, each at least `2^{m/8} = 2, 4, 8, 16`,
so the greedy packing is at least that large.

### 2.4 Fano's method

For `M ≥ 2` and probability measures `P : Fin M → Measure X`, let
`P̄ = M⁻¹ ∑ j, P j` and `mutualInfoUniform P = M⁻¹ ∑ j, klDiv (P j) P̄`, the mutual information
of a uniform index and the observation.
- **Fano's inequality** (`fano_average`, `fano`; Wainwright, (15.30) and (15.31), p. 501;
  Samworth–Shah, Thm 8.11, p. 234): for every Markov kernel `ψ : Kernel X (Fin M)`, the average
  error `M⁻¹ ∑ j, (ψ ∘ₘ P j).real {j}ᶜ` is at least
  `1 - ((mutualInfoUniform P).toReal + log 2) / log M` (`fano_average`), hence so is the maximum
  `max_j (ψ ∘ₘ P j).real {j}ᶜ` (`fano`). The mutual information is finite, since `P j ≤ M • P̄`
  gives `klDiv (P j) P̄ ≤ log M`, so its `toReal` is not a junk value. The sources state this
  for nonrandomized tests; the proof below covers kernels. Proof: let `a j = (ψ ∘ₘ P j).real {j}`,
  `b j = (ψ ∘ₘ P̄).real {j}` and `ā` the average of the `a j`; data processing through `ψ` and
  then to the event `{j}` gives `klBin (a j) (b j) ≤ klDiv (P j) P̄` (1.3); average using joint
  convexity of `klBin` and `∑ j, b j = 1` to get `klBin ā (1/M) ≤ mutualInfoUniform P`; conclude
  by `klBin ā (1/M) ≥ ā log M - log 2`. The junk values of `klBin` do not occur: `b j = 0`
  forces `a j = 0`, and `b j = 1` forces `a j = 1`, since `P j ≤ M • P̄`.
- **Mixture bound** (`inv_mul_sum_klDiv_eq`, `mutualInfoUniform_le`; Tsybakov, (2.69), p. 114,
  there with `Q = P 0`): for every probability measure `Q`,
  `M⁻¹ ∑ j, klDiv (P j) Q = mutualInfoUniform P + klDiv P̄ Q` (`inv_mul_sum_klDiv_eq`, for every
  `M ≥ 1`), hence `mutualInfoUniform P ≤ M⁻¹ ∑ j, klDiv (P j) Q`.
- **Estimation form** (`max_measure_ge_of_fano`). If `d (θ i) (θ j) ≥ 2 s` for `i ≠ j`, then for
  every probability measure `Q` with `klDiv (P j) Q ≠ ∞` for every `j`, every estimator `κ` has
  `max_j (κ ∘ₘ P j).real {y | s ≤ d y (θ j)} ≥ 1 - (M⁻¹ ∑ j (klDiv (P j) Q).toReal + log 2) / log M`
  (2.1 with the two bullets above; Samworth–Shah, Cor 8.12, p. 236, with `log (2 - 1/M)` in place of
  `log 2`). Without the finiteness hypothesis the `toReal` of an infinite divergence is `0` and the
  bound fails: four mutually singular Dirac laws and a reference law singular to all of them would
  give `1/2` for a problem with exact recovery.
- **Packing form** (`max_measure_ge_of_packing`; Tsybakov, Cor 2.6, p. 114, and Thm 2.5, p. 99, by
  the same argument): for `M ≥ 2` and `M + 1` laws `P 0, …, P M` with `2 s`-separated parameters and
  `(M + 1)⁻¹ ∑ j, klDiv (P j) (P 0) ≤ ofReal (α log M)`, `0 < α < 1/8`, the estimation form with
  `Q = P 0` and `M + 1` hypotheses gives
  `max_j (κ ∘ₘ P j).real {y | s ≤ d y (θ j)} ≥ 1 - α - log 2 / log (M + 1)`. The right side is at
  least `1 - 1/8 - log 2 / log 3 > 0.24`, independent of `M`. In applications the parameters are
  indexed by the Varshamov–Gilbert family of 2.3, for which `M ≥ 2^{m/8} ≥ 2`.

*Needs:* 1.3, 2.1, 2.3; Tau Ceti `klDiv_smul_add_smul_le`; Mathlib `klDiv_map_le`.

**Checks.**

- `uniformMixture` of `δ₀`, `δ₁` is `½ δ₀ + ½ δ₁`, a probability measure; the unnormalized sum
  would have mass `2`. At `M = 0` it is the zero measure, `⊤ • 0 = 0` in `ℝ≥0∞`.
- `mutualInfoUniform` of `M` mutually singular laws is `log M`, the largest possible value: each
  `klDiv (P j) P̄ = log M`, since `dP j / dP̄ = M` on the support of `P j`. Without the factor
  `M⁻¹` it would be `M log M`. For `M = 4` Dirac laws Fano's bound is
  `1 - (log 4 + log 2) / log 4 = -1/2`, consistent with exact recovery.
- Fano with `M = 2` and `P 0 = P 1`: `mutualInfoUniform = 0` and the bound is
  `1 - log 2 / log 2 = 0`, which is sharp in sign: the trivial test errs with probability `1/2 ≥ 0`.
- Mixture identity for `M = 2`, `P 0 = δ₀`, `P 1 = δ₁`, `Q = P̄`: both sides are `log 2`.
- Packing form: `1 - 1/8 - log 2 / log 3 = 0.2441`.

### 2.5 Assouad's lemma

For `P : (Fin m → Bool) → Measure X` probability measures:
- **Assouad's lemma** (`assouad`, Tsybakov, Lemma 2.12, p. 117; Samworth–Shah, Lemma 8.7, p. 229,
  with the Hamming loss; both for nonrandomized estimators, kernels by the same argument): for
  every Markov kernel `κ : Kernel X (Fin m → Bool)`,
  `max_ω ∫ hammingDist ŵ ω ∂(κ ∘ₘ P ω) ≥ (m / 2) · min_{hammingDist ω ω' = 1} (1 - tvDist (P ω) (P ω') / 2)`.
  Proof: write the Hamming distance as a sum over coordinates, bound the maximum by the average over
  the cube, and for each coordinate pair the cube along that coordinate; each pair is a two-point
  test bounded by the testing affinity of 1.4. At `m = 0` both sides are `0` (the infimum over
  the empty set of neighbours is the real junk value `0`, multiplied by `m = 0`).
- **Divergence forms** (`assouad_klDiv`, `assouad_sqHellinger`; Tsybakov, Thm 2.12(iv),
  pp. 118–119): if `α ≥ 0` and
  `klDiv (P ω) (P ω') ≤ ofReal α` for neighbours, the right side is at least
  `(m / 2) max (½ exp (-α)) (1 - √(α / 2))`, by Bretagnolle–Huber and Pinsker in 1.4. If
  `sqHellinger (P ω) (P ω') ≤ α < 2` for neighbours, it is at least
  `(m / 2) (1 - √(α (1 - α / 4)))` (Tsybakov, Thm 2.12(iii), p. 118).
- **Metric form** (`assouad_metric`; van der Vaart, Lemma 24.3, p. 347, with `p = 2`): if
  `θ : (Fin m → Bool) → Y` satisfies
  `d (θ ω) (θ ω')² ≥ c · hammingDist ω ω'` with `c > 0`, then every estimator `κ : Kernel X Y` has
  `max_ω ∫⁻ y, ofReal (d y (θ ω)²) ∂(κ ∘ₘ P ω) ≥ ofReal ((c / 8) · m · min_{neighbours} (1 - tvDist / 2))`,
  the risks taken in `ℝ≥0∞` (Conventions). Proof: the nearest-index map `ŵ` of 2.1 has
  `d (θ ŵ) (θ ω) ≤ 2 d y (θ ω)`, so `d y (θ ω)² ≥ (c / 4) hammingDist ŵ ω`.

*Needs:* 1.4, 2.1; Mathlib `hammingDist`.

**Checks.**

- `m = 1`: Assouad is the two-point bound `max_ω E ρ ≥ ½ (1 - tvDist / 2)`, the Le Cam bound
  of 2.2 times `1` (the loss `ρ ∈ {0, 1}`).
- `P ω = P` constant: the bound is `m / 2`, attained by the estimator that is uniform on the cube
  (its expected Hamming distance to every `ω` is exactly `m / 2`).

### 2.6 Minimax corollaries

The headline names of Layers 1 and 2 and of 6.4 are a contract with a consumer (see
[Downstream consumers](#downstream-consumers)).

For `P : Kernel Θ X`, a map `g : Θ → Y` and the loss `ℓ θ y = ofReal (d y (g θ) ^ 2)`, Mathlib's
`minimaxRisk ℓ P` is bounded below as follows. Proof: the supremum over `Θ` dominates the maximum
over the chosen parameters, and the risk form of 2.1.
- **Two points** (`minimaxRisk_ge_of_klDiv`; the total variation form is the minimax risk bullet
  of 2.2): for
  `θ₀ θ₁ : Θ`, `s ≥ 0` with `d (g θ₀) (g θ₁) ≥ 2 s`, `α ≥ 0` and `klDiv (P θ₀) (P θ₁) ≤ ofReal α`,
  `minimaxRisk ℓ P ≥ ofReal (s² max (¼ exp (-α)) ((1 - √(α / 2)) / 2))`.
- **Fano** (`minimaxRisk_ge_of_fano`): for `M ≥ 2`, `θ : Fin M → Θ`, `s ≥ 0` with
  `d (g (θ i)) (g (θ j)) ≥ 2 s` for `i ≠ j`, and a probability measure `Q` with
  `klDiv (P (θ j)) Q ≠ ∞` for every `j`, `minimaxRisk ℓ P` is at least `ofReal` of `s²` times the
  estimation form of 2.4 for the laws `P (θ j)`.
- **Assouad** (`minimaxRisk_ge_of_assouad`): for `θ : (Fin m → Bool) → Θ` and `c > 0` with
  `d (g (θ ω)) (g (θ ω'))² ≥ c · hammingDist ω ω'`, `minimaxRisk ℓ P` is at least the metric form
  of 2.5 for the laws `P (θ ω)`.

*Needs:* 2.1, 2.2, 2.4, 2.5; Mathlib `minimaxRisk`.

### Examples

- Estimating a normal mean from `n` observations of `N(θ, 1)`: Le Cam's method with
  `θ₀ = 0`, `θ₁ = n^{-1/2}`, `s = n^{-1/2}/2` and `klDiv = 1/2` (1.3) gives
  `minimaxRisk ≥ (1/(4n)) · max(¼ e^{-1/2}, (1 - ½)/2) = 1/(16 n)`.

### Dependencies

Layer 1; Mathlib's decision theory and Hamming distance; Tau Ceti's Kullback–Leibler files.

## Layer 3: exact rank theory

Throughout, `P` is an atomless probability measure on `ℝ` (`∀ t, P {t} = 0`), and samples are
`x : Fin N → ℝ` under `Measure.pi (fun _ ↦ P)` unless independent non-identical coordinates are
stated.

### 3.1 Ranks and signed ranks

- `rank x i = #{j | x j ≤ x i}` and `absRank x i = #{j | |x j| ≤ |x i|}` (Conventions). For
  injective `x`, `fun i ↦ rank x i - 1` is a permutation of `Fin N`, the inverse of
  `Tuple.sort x` (`rank_eq_sort_symm_add_one`); ranks are invariant under strictly increasing maps
  applied coordinatewise (`rank_comp_strictMono`) and equivariant under permutations of the
  coordinates (`rank_comp_perm`).
- **The law of the ranks** (`measure_rank_eq_perm`, van der Vaart, Lemma 13.1(i) and (iv),
  p. 174): for every permutation `σ` and every measurable set `A`, the event that
  `rank x = σ + 1` and the sorted vector `x ∘ Tuple.sort x` lies in `A` has probability `(N!)⁻¹`
  times the probability that the sorted vector lies in `A`. With `A` the whole space the rank
  vector is uniform on the `N!` permutations; in general it is independent of the order
  statistics. Van der Vaart states the lemma for a law with a density; (i) and (iv) use only
  that ties are null. This is the law of the ranks of Foundations 5.1 restated for `rank`; the
  target here is only the translation.
- **Signed ranks** (`measure_signs_absRank_eq`, van der Vaart, Lemma 13.17(i)–(iii), p. 182): if
  moreover `P` is symmetric (`P.map Neg.neg = P`), the signs `1_{0 < x i}` are independent fair
  Bernoulli variables, independent of the vector `absRank x`, which is uniform on the
  permutations. Proof: `x ↦ (sign x, |x|)` sends `P` to `Ber(1/2) ⊗ P.map abs`, and `P.map abs`
  is atomless.

*Needs:* Foundations 5.1; Mathlib `Tuple.sort`, `Measure.pi`.

**Checks.**

- `rank`: `rank (0.3, 0.1, 0.7) = (2, 1, 3)`.
- `rank`: ranks are invariant under a strictly increasing map, so
  `rank (e^{0.3}, e^{0.1}, e^{0.7}) = (2, 1, 3)` as well.
- `rank` (negative control): with a tie, `rank (0.3, 0.3) = (2, 2)`; the convention
  `1 + #{j | x j < x i}` would give `(1, 1)`, and the position in `Tuple.sort` would give `(1, 2)`.
- `absRank`: `absRank (-2, -1, 3) = (2, 1, 3)`.
- `absRank` (negative control): the ordinary ranks of `(-2, -1, 3)` are `(1, 2, 3)`, not the
  absolute ranks.
- `absRank`: a tie of absolute values, `absRank (-1, 1) = (2, 2)`.

### 3.2 Linear rank statistics and scores

- `linearRankStatistic c a x = ∑ i, c i * a (rank x i)` for coefficients `c : Fin N → ℝ` and
  scores `a : ℕ → ℝ`.
- **Moments** (`integral_linearRankStatistic`, `variance_linearRankStatistic`, van der Vaart,
  Lemma 13.1(vi), p. 174): `E T = N c̄ ā` and
  `Var T = (N - 1)⁻¹ ∑ i, (c i - c̄)² · ∑ k ∈ [1, N], (a k - ā)²` for `N ≥ 2`, with `c̄`, `ā` the
  averages of `c` and of `a 1, …, a N`. Proof: by 3.1, `rank x i` is uniform on `[1, N]` and
  `(rank x i, rank x j)` is uniform on the ordered pairs of distinct values.
- **Scores.** A score-generating function is a measurable `φ : ℝ → ℝ` with `∫₀¹ φ² < ∞`, not a.e.
  constant on `(0, 1)`. Its exact scores are `exactScore φ N i = E φ(U_{N(i)})`, the integral of
  `φ` against the beta law `Beta(i, N - i + 1)` of the `i`-th uniform order statistic (Tau Ceti
  `map_orderStatistic_pi_uniformMeasure`; van der Vaart, (13.3), p. 175), and its approximate
  scores are `φ (i / (N + 1))` (van der Vaart, (13.4), p. 175).
- The exact scores sum to `N ∫₀¹ φ` (`sum_exactScore`): for `φ` integrable on `(0, 1)`,
  `∑_{i=1}^N exactScore φ N i = N ∫₀¹ φ`, since the beta densities of the `N` order statistics
  sum to `N`.
- **Score functions of location and scale families** (`score_logistic_gaussian_exponential`,
  `exactScore_logistic_savage`). For a density `f` absolutely continuous
  with distribution function `F` and finite Fisher information `I_f = ∫ (f'/f)² f`, the location
  score is `φ_f u = -(f'/f)(F⁻¹ u)` and the scale score is `-1 - F⁻¹(u) (f'/f)(F⁻¹ u)`, with
  `F⁻¹` Mathlib's quantile of the law (van der Vaart, Examples 13.13 and 13.14, pp. 179–180).
  Computations: the logistic density gives `φ_f u = 2u - 1`, whose exact scores `2i/(N + 1) - 1`
  are an affine image of the Wilcoxon scores `i`; the standard normal gives `φ_f = Φ⁻¹`; the
  standard exponential scale family gives `-1 - log (1 - u)`, whose exact scores
  `∑_{j=N-i+1}^N 1/j - 1` are the Savage scores minus `1` (van der Vaart, Example 13.15,
  p. 180).
- **Locally most powerful rank tests** (`hasDerivAt_measure_rank_location`,
  `hasDerivAt_measure_rank_scale`, `rankTest_locallyMostPowerful`; van der Vaart, §13.1,
  pp. 178–179): if `X i` has density `f (x - θ c i)`, independent, with `f` as above, then for
  every permutation `r`, `θ ↦ P_θ (rank = r)` is differentiable at `0` with derivative
  `(N!)⁻¹ ∑ i, c i · exactScore φ_f N (r i)` (`hasDerivAt_measure_rank_location`). Hence, by the
  Neyman–Pearson lemma on the finite set of rank vectors (Foundations 6.2), the test rejecting for
  large values of `T = linearRankStatistic c (exactScore φ_f N)`, randomized on the boundary,
  maximizes the derivative at `0` of the power among rank tests of the same size; when it is not
  randomized, that is the indicator of `{T > k}` for some `k`, it is most powerful among rank
  tests of its size for all `θ ∈ (0, ε)`, for some `ε > 0` (`rankTest_locallyMostPowerful`, for
  every family of laws with distinct entries almost surely, uniform ranks at `θ = 0` and these
  derivatives). The scale family `e^{-θ c i} f (e^{-θ c i} x)`, for `f` absolutely continuous with
  finite scale information `∫ (1 + x f'/f)² f`, gives the same derivatives with the scale score
  (`hasDerivAt_measure_rank_scale`), hence the same statements (van der Vaart, Example 13.13,
  p. 179). Proof of the
  derivative: finite Fisher information makes the location family differentiable in quadratic
  mean, so `θ ↦ P_θ(B)` is differentiable at `0` for every event `B`, with derivative
  `∫_B ∑ i, c i (-(f'/f))(x i) ∏ f(x j) dx`; conditioning on the rank vector and 3.1 give
  `E[-(f'/f)(X i) | rank = r] = exactScore φ_f N (r i)`.

*Needs:* 3.1; Foundations 6.2; Tau Ceti `map_orderStatistic_pi_uniformMeasure`; Mathlib
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `Measure.quantile` from Tau Ceti.

**Checks.**

- `linearRankStatistic`: `N = 3`, `c = (1, 0, 0)`, `a k = k`: `T = rank x 0` is uniform on
  `{1, 2, 3}`, with mean `2 = 3 · ⅓ · 2` and variance `2/3 = ½ · (4/9 + 1/9 + 1/9) · 2`.
- `linearRankStatistic` (negative control): the same case with `N⁻¹` in place of `(N - 1)⁻¹` in
  the variance formula would give `4/9`, not the true `2/3`.
- `linearRankStatistic`: two-sample coefficients `c = (0, 0, 1, 1)` and `a k = k` give the
  Wilcoxon rank sum of the second sample; for the pooled sample `(0.1, 0.4, 0.2, 0.3)` it is
  `2 + 3 = 5`, and the Mann–Whitney count `#{x i < y j}` of 3.3 is `2 = 5 - 2·3/2`.
- `exactScore`: for `φ u = u`, `exactScore φ N i = i/(N + 1)`, the mean of `Beta(i, N - i + 1)`.
- `exactScore`: exact normal scores for `N = 2`: `E Φ⁻¹(U_{2(1)}) = -1/√π = -0.56419`,
  and the two scores sum to `0 = 2 ∫₀¹ Φ⁻¹`.
- `exactScore` (negative control): the approximate score `Φ⁻¹(1/3) = -0.43073` differs
  from the exact score `-0.56419`.
- Logistic: `log f = -x - 2 log (1 + e^{-x})`, so `-(log f)' = 2F - 1` and `φ_f u = 2u - 1`.

### 3.3 The classical rank statistics and their null laws

- **Sign test** (`measure_card_gt_ge`, Hollander–Wolfe–Chicken, §3.4, Assumptions B1–B2 and
  (3.39)–(3.40), pp. 63–64): for independent `X i` with laws `P i` satisfying
  `P i (Ioi θ₀) = 1/2` (not necessarily identical or symmetric), `#{i | θ₀ < X i}` has the law
  `Bin(n, 1/2)`, so the test rejecting when the count is at least `k` has size
  `P(Bin(n, 1/2) ≥ k)` under every such law. Hollander–Wolfe–Chicken assume continuous laws; the
  count needs only `P i (Ioi θ₀) = 1/2`. Proof: Tau Ceti's `hasLaw_card_filter_mem_pi` with equal
  success probabilities.
- `signedRankStatistic x = W⁺ x = ∑_{i : 0 < x i} absRank x i`, the Wilcoxon signed-rank statistic.
- **Null law of the signed-rank statistic** (`map_signedRankStatistic_pi`): under a symmetric
  atomless `P`, `W⁺` has the law of `∑_{j=1}^n j B_j` for independent Bernoulli variables
  `B_j ∈ {0, 1}` with success probability `1/2`. Proof: by 3.1 the signs are independent of the
  absolute ranks, so given `absRank x = σ + 1` the sum is `∑_j j B_j` with `B_j` the sign of the
  coordinate of absolute rank `j`.
- **Null moments** (`integral_variance_signedRankStatistic`, Hollander–Wolfe–Chicken, (3.7)–(3.8),
  pp. 41–42): `E W⁺ = n(n + 1)/4` and `Var W⁺ = n(n + 1)(2n + 1)/24`.
- `mannWhitney x y = U = #{(i, j) | x i < y j}` for samples `x : Fin m → ℝ`, `y : Fin n → ℝ`
  (Hollander–Wolfe–Chicken, (4.15), p. 119). Without ties, `U` is the rank sum of the `y` in the
  pooled sample `Fin.append x y` minus `n(n + 1)/2` (Hollander–Wolfe–Chicken, (4.16), p. 119), so
  it is a linear rank statistic with two-sample coefficients and the scores `a k = k`, minus
  `n(n + 1)/2` (`mannWhitney_eq_rankSum`).
- **Null moments** (`integral_variance_mannWhitney`, Hollander–Wolfe–Chicken, (4.18)–(4.19),
  p. 119): for samples from a common atomless law, `E U = mn/2` and `Var U = mn(m + n + 1)/12`.
  Proof: 3.2 with two-sample coefficients.
- `kendallTau z = τ̂`, Foundations' `uStatistic 2 n h` with
  `h (p, q) = sign ((p.1 - q.1) (p.2 - q.2))` on pairs. Without ties in either coordinate and for
  `n ≥ 2` it is `4/(n(n - 1)) · #{concordant pairs} - 1` (`kendallTau_eq_concordant`; van der
  Vaart, Example 12.5, p. 164), and
  `K = n(n - 1)/2 · τ̂` is the statistic of Hollander–Wolfe–Chicken.
- **Kendall's null moments** (`integral_variance_kendallTau`, Hollander–Wolfe–Chicken,
  (8.11)–(8.12), p. 396, for `K`): under independence (`P = P₁ ⊗ P₂` with atomless marginals),
  for `n ≥ 2`, `E τ̂ = 0` and `Var τ̂ = 2(2n + 5) / (9 n (n - 1))`.
- `spearmanRho z = r_s = 1 - 6 ∑ (R i - S i)² / (n (n² - 1))` with `R`, `S` the ranks of the two
  coordinates of `z : Fin n → ℝ × ℝ` (Hollander–Wolfe–Chicken, (8.64), p. 428), Spearman's rank
  correlation; `sampleCorrelation u v` is the sample correlation of two vectors.
- **Spearman** (`spearmanRho_eq_sampleCorrelation`, `map_spearmanRho_pi_eq`,
  `integral_variance_spearmanRho`): for `n ≥ 2` and injective coordinates `r_s` is the sample
  correlation of the rank vectors (van der Vaart, Example 13.22, p. 184). Under independence
  (`P = P₁ ⊗ P₂` with atomless marginals) its law does not depend on `P₁`, `P₂`, and for `n ≥ 2`,
  `E r_s = 0` and `Var r_s = 1/(n - 1)` (Hollander–Wolfe–Chicken, (8.71)–(8.72), pp. 428–429).
  Proof: `r_s` is a function of the two rank vectors, which are independent and uniform on the
  permutations (3.1); with `R` sorted, `r_s` is an affine function of the linear rank statistic
  `∑ i, i S i`, and 3.2 gives its moments.
- `kruskalWallis g x = H = 12/(N(N + 1)) ∑ R_j² / n_j - 3(N + 1)` for a group map
  `g : Fin N → Fin k` with group sizes `n_j > 0` and rank sums `R_j` in the pooled sample, the
  Kruskal–Wallis statistic (van der Vaart, Example 13.16, pp. 180–181, writes it with the average
  ranks `R_j/n_j` of the groups). It is a function of the rank vector, so its law
  under a common atomless `P` does not depend on `P` (`map_kruskalWallis_pi_eq`, by 3.1).
- **Kruskal–Wallis null mean** (`integral_kruskalWallis`): for `k ≥ 1` nonempty groups
  (`g` surjective) and `N ≥ 1`, `E H = k - 1`. For `N = 0` the formula gives `-3`, which is why
  the statement assumes `0 < N`. Proof: `R_j` is a linear rank statistic with `c = 1_{group j}`,
  and 3.2 gives `E R_j² = n_j (N - n_j)(N + 1)/12 + n_j² (N + 1)²/4`.

*Needs:* 3.1, 3.2; Foundations 2.4; Tau Ceti `hasLaw_card_filter_mem_pi`,
`binomial_tail_eq_regularizedIncompleteBeta`.

**Checks.**

- Sign test: `P(Bin(10, 1/2) ≥ 9) = 11/1024 = 0.01074`.
- `signedRankStatistic`: `x = (-2, -1, 3)` has `absRank x = (2, 1, 3)` and only the third entry
  positive, so `W⁺ = 3`.
- `signedRankStatistic`: for `n = 3` the law of `B₁ + 2B₂ + 3B₃` is `(1, 1, 1, 2, 1, 1, 1)/8` on
  `0, …, 6`, with mean `3 = 3·4/4` and variance `3.5 = 3·4·7/24`.
- `signedRankStatistic` (negative control): van der Vaart's `∑ i, absRank x i · sign (x i)` is
  `2 W⁺ - n(n + 1)/2`, which is `0` at `x = (-2, -1, 3)` and has null mean `0`, not `n(n + 1)/4`.
- `mannWhitney`: for `m = n = 2` the law of `U` is `(1, 1, 2, 1, 1)/6` on `0, …, 4`, with mean `2`
  and variance `5/3 = 4·5/12`.
- `mannWhitney`: the pooled sample of 3.2's check gives `U = 2`, the rank sum `5` minus `3`.
- `mannWhitney` (negative control): at a tie, `x = (0)`, `y = (0)`, the strict count gives
  `U = 0`; van der Vaart's `1{X ≤ Y}` (Example 12.7, p. 166) gives `1`. Ties are null under an
  atomless law, so the moments agree.
- `kendallTau`: `Var τ̂ = 11/27`, `13/54`, `1/6` for `n = 3, 4, 5`, by enumeration of permutations,
  matching `2(2n + 5)/(9n(n - 1))`.
- `kendallTau`: for `n ≥ 2`, a sample whose two coordinates are in the same order (all pairs
  concordant) has `τ̂ = 1`.
- `kendallTau` (negative control): the unnormalized count `K = 3 τ̂` for `n = 3` has variance
  `3·2·11/18 = 11/3`, nine times the `11/27` of `τ̂`.
- `spearmanRho`: `Var r_s = 1/2`, `1/3`, `1/4` and `E r_s = 0` for `n = 3, 4, 5`, by enumeration
  of permutations, matching `1/(n - 1)`.
- `spearmanRho`: for `n = 3` with rank vectors `(1, 2, 3)` and `(1, 3, 2)`,
  `r_s = 1 - 6 · 2/24 = 1/2`, and `sampleCorrelation` of the two rank vectors is `1/2` as well.
- `spearmanRho` (negative control): for `n = 3` with reversed ranks, `∑ (R i - S i)² = 8` and
  `r_s = 1 - 48/24 = -1`; the denominator `n³` in place of `n (n² - 1)` would give `-0.778`.
- `sampleCorrelation`: `sampleCorrelation u u = 1` for every nonconstant `u`.
- `sampleCorrelation`: `sampleCorrelation (1, 2) (2, 1) = -1`, the value of `spearmanRho` for
  `n = 2` with reversed ranks, `1 - 6 · 2/6`.
- `sampleCorrelation` (negative control): for a constant `u` the denominator is `√0 = 0` and the
  value is the junk `0`; every theorem that uses it has injective coordinates and `n ≥ 2`.
- `kruskalWallis`: `E H = 2` for sizes `(2, 2, 1)`, `1` for `(2, 3)`, `3` for `(1, 1, 1, 2)`, by
  enumeration.
- `kruskalWallis`: for `k = 1`, `R₁ = N(N + 1)/2` and `H = 0` identically.
- `kruskalWallis` (negative control): for `N = 0` the formula is `-3`, not `k - 1`.

### 3.4 The Hodges–Lehmann estimator

- The Walsh averages of `x : Fin n → ℝ` are `(x i + x j)/2` for `i ≤ j`, a multiset of
  `M = n(n + 1)/2` numbers, and `walshCount x t` is the number of them at most `t`.
  `hodgesLehmann x` is their median (Hollander–Wolfe–Chicken, (3.23)–(3.25), p. 56), written as
  the midpoint of the lower and upper medians: the lower median is
  `sInf {t | M/2 ≤ walshCount x t}` and the upper one `sInf {t | M/2 < walshCount x t}`.
- **Equivariance** (`hodgesLehmann_add_const_smul`). For `n ≥ 1`,
  `hodgesLehmann (x + c) = hodgesLehmann x + c` and `hodgesLehmann (a • x) = a · hodgesLehmann x`
  for every real `a`. For `n ≥ 1` both sets are nonempty and bounded below, so the infima are the
  true medians; for `n = 0` the estimator is `0` by an explicit convention, which is not translation
  equivariant.
- **Tukey's identity** (`signedRankStatistic_sub_eq`, Hollander–Wolfe–Chicken, Comment 17,
  pp. 57–58): for `x` with distinct entries and `θ` not a Walsh average,
  `W⁺ (x - θ) = #{(i, j) | i ≤ j, θ < (x i + x j)/2}`. The two hypotheses make the values
  `|x i - θ|` distinct and nonzero; with ties the identity fails (`x = (1, 1)`, `θ = 0`: `W⁺ = 4`
  under the tie convention of `absRank`, and three Walsh averages exceed `0`). Proof: for `i ≤ j`
  ordered by `|x i - θ| ≤ |x j - θ|`, the Walsh average of the pair exceeds `θ` iff `x j > θ`;
  summing over `i` for fixed `j` counts `absRank (x - θ) j`.
- **Consequence** (`hodgesLehmann_crossing`). For `n ≥ 1`, `x` with distinct entries and `θ`
  not a Walsh average, `W⁺ (x - θ) > M/2` implies `θ < hodgesLehmann x`, and `W⁺ (x - θ) < M/2`
  implies `hodgesLehmann x < θ`: the estimator is the point where `θ ↦ W⁺ (x - θ)`, a
  nonincreasing step function, crosses `M/2`, its null mean. Under an atomless law the entries of
  a sample are distinct almost surely, and for each sample only finitely many `θ` are Walsh
  averages. Proof: by Tukey's identity `W⁺ (x - θ) = M - walshCount x θ`, and the lower and upper
  medians bracket `hodgesLehmann x`.

*Needs:* 3.3.

**Checks.**

- `walshCount`: for `x = (1, 2, 6)` the Walsh averages are `1, 1.5, 2, 3.5, 4, 6`, so
  `walshCount x 2 = 3` and `walshCount x 3.5 = 4`.
- `walshCount`: `walshCount x t = M` for `t ≥ max x`, `6` for `x = (1, 2, 6)`.
- `walshCount` (negative control): counting all ordered pairs `(i, j)` instead of `i ≤ j` would
  give `9` at the top for `x = (1, 2, 6)`, not `M = 6`.
- `hodgesLehmann`: for `x = (1, 2, 6)` the lower and upper medians are `2` and `3.5`, so
  `hodgesLehmann x = 2.75`, different from the sample median `2` and the mean `3`.
- `hodgesLehmann`: for `n = 1`, `M = 1` and both infima are `x 0`; for `x = (0, 1)`, `M = 3`, the
  Walsh averages are `0, 0.5, 1` and `hodgesLehmann x = 0.5`.
- `hodgesLehmann` (negative control): for `n = 0`, `M = 0` and `walshCount x t = 0`, so the first
  set `{t | 0 ≤ walshCount x t}` is all of `ℝ`, unbounded below, and the second is empty; `sInf`
  would return Lean's junk `0` for both, which is why the definition takes the value `0` by
  convention and claims equivariance only for `n ≥ 1`.
- Tukey's identity: at `x = (1, 2, 6)` and `θ = 3`, `x - θ = (-2, -1, 3)`, `W⁺ = 3`, and three
  Walsh averages exceed `3`.

### 3.5 Distribution-free goodness-of-fit statistics

For `P` with continuous distribution function `F = cdf P`, `F̂ₙ` the empirical distribution
function of Foundations 9.1, and the order statistics `x₍₁₎ ≤ … ≤ x₍ₙ₎`:
- **Kolmogorov–Smirnov formula** (`ksStatistic_eq_iSup`, with a zero-based index). For `n > 0` and a
  sorted sample (`x i = x₍ᵢ₎`), Foundations' statistic `ksStatistic` satisfies
  `ksStatistic x = max_i max (i/n - F x₍ᵢ₎, F x₍ᵢ₎ - (i - 1)/n)`: the supremum over `ℚ` equals the
  supremum over `ℝ` because `F̂ₙ` is a right-continuous step function and `F` is continuous.
- **Kolmogorov–Smirnov is distribution-free** (`map_ksStatistic_pi`, van der Vaart, Cor 19.21
  and its proof, pp. 277–278): the law of `ksStatistic` under `P^n` equals its law under the
  uniform law on `[0, 1]`. Proof: `F̂ₙ(t)` at `t = F⁻¹(u)` is the empirical distribution function
  of `F(x i)` at `u`, and `F(x i)` are i.i.d. uniform for continuous `F` (Tau Ceti
  `cdf_map_eq_volume_restrict`, `map_quantile_volume_Ioo`).
- `cvmStatistic x = n ∫ (F̂ₙ - F)² dP`, the Cramér–von Mises statistic (van der Vaart,
  Example 12.13, pp. 170–171).
- **Cramér–von Mises formula** (`cvmStatistic_eq`): for `n ≥ 1` and a sorted sample,
  `cvmStatistic x = 1/(12 n) + ∑_i (F x₍ᵢ₎ - (2i - 1)/(2n))²`, with `i` one-based (`(2i + 1)/(2n)`
  with a zero-based index). Proof: `F̂ₙ(t) = Ĝₙ(F(t))` for `P`-almost every `t`,
  with `Ĝₙ` the empirical distribution function of the `F(x i)`, so the statistic is
  `n ∫₀¹ (Ĝₙ(u) - u)² du`, computed piecewise between consecutive `F(x₍ᵢ₎)`. By the same
  substitution the statistic is distribution-free in the sense of the previous bullet
  (`map_cvmStatistic_pi`).
- `ksTwoSample x y = D_{m,n} = sup_t |F̂_m(t) - Ĝ_n(t)|` for samples `x`, `y`, the two-sample
  Kolmogorov–Smirnov statistic, a supremum over `ℚ` that equals the supremum over `ℝ`. It is
  distribution-free under a common atomless law (`map_ksTwoSample_pi_eq`). Proof: it is a
  function of the rank vector of the pooled sample (3.1); the pooled ordering is a uniformly
  random arrangement of `m` steps `+1/m` and `n` steps `-1/n`, and `D_{m,n}` is the maximal
  absolute partial sum of the lattice path.
- `gnedenkoKorolyuk n k = C(2n, n)⁻¹ ∑_{j ∈ ℤ} (-1)^j C(2n, n - j k)`, with `C(2n, l) = 0` for
  `l < 0` and `l > 2n`, a finite sum for `k ≥ 1`.
- **The Gnedenko–Korolyuk formula** (`measureReal_mul_ksTwoSample_lt`; the lattice-path form of the
  statistic is Hollander–Wolfe–Chicken, Comment 36, (5.80), p. 194):
  for `m = n`, a common continuous law and every integer `k ≥ 1`,
  `P(n D_{n,n} < k) = gnedenkoKorolyuk n k`; for `k > n` both sides are `1`. Proof: `n D_{n,n}`
  is the maximal absolute value of a uniformly random
  path of `n` steps `+1` and `n` steps `-1`, and the reflection principle counts the paths that stay
  in `(-k, k)` as `∑_j (-1)^j C(2n, n - j k)`.

*Needs:* 3.1; Foundations 9.1, 9.2; Tau Ceti `cdf_map_eq_volume_restrict`,
`map_quantile_volume_Ioo`.

**Checks.**

- KS, `n = 1`, uniform: `max (1 - u, u)`, which is `1/2` at `u = 1/2` (Foundations 9.2's check).
- `cvmStatistic`: for `n = 1`, uniform, at `u`:
  `∫₀¹ (1_{t ≥ u} - t)² dt = u³/3 + (1 - u)³/3 = 1/12 + (u - ½)²`.
- `cvmStatistic`: at `u = 0` both sides of the previous check are `1/3`; at `u = 1/2` both are
  `1/12`.
- `cvmStatistic` (negative control): reading the one-based `(2i - 1)/(2n)` with a zero-based
  index gives, for `n = 1` at `u = 1/2`, `1/12 + 1/4 = 1/3` instead of `1/12`.
- `ksTwoSample`: `x = (1, 3)`, `y = (2, 4)`: `F̂ - Ĝ` takes the values `1/2, 0, 1/2, 0` from `1`,
  `2`, `3`, `4` on, so `D_{2,2} = 1/2`.
- `ksTwoSample`: for `m = n = 1` and `x ≠ y`, `D_{1,1} = 1`, so `P(D_{1,1} < 1) = 0`, matching
  `gnedenkoKorolyuk 1 1 = (2 - 1 - 1)/2 = 0`.
- `ksTwoSample` (negative control): for `m = 0` the empirical distribution function is the junk
  `0/0 = 0`, so `D_{0,n} = 1` for `n ≥ 1`; every theorem takes `m, n → ∞` or `m = n`.
- `gnedenkoKorolyuk`: against enumeration of all `C(2n, n)` paths: `n = 3`: `0, 0.4, 0.9`
  for `k = 1, 2, 3`; `n = 4, k = 2`: `0.22857`; `n = 5, k = 3`: `0.64286`.
- `gnedenkoKorolyuk`: for `k > n` only `j = 0` contributes and the value is `1`, the probability
  that a path of `2n` steps stays in `(-k, k)`.
- `gnedenkoKorolyuk` (negative control): for `k = 0` the series is not summable and the value is
  the junk `0`; the formula and the limit below take `k ≥ 1`.

### 3.6 The Kolmogorov and Cramér–von Mises laws

- **Lattice-path limit** (`tendsto_gnedenkoKorolyuk`): for `x > 0` and `k_n = ⌈x √(2n)⌉`,
  `gnedenkoKorolyuk n k_n → kolmogorovCdf x`. This is a statement about the explicit finite sums
  of 3.5, with no limit law involved. Proof:
  `C(2n, n - j k)/C(2n, n) → exp (-2 j² x²)` for each `j`, dominated in `j` by `exp (-c j²)`.
- **Consequence** (`gnedenkoKorolyuk_ceil_eq`, `monotoneOn_kolmogorovCdf`). For `n ≥ 1`, a
  common continuous law and `x > 0`: since `n D_{n,n}` is an integer,
  `n D_{n,n} < k_n ↔ √(n/2) D_{n,n} < x`, so by the Gnedenko–Korolyuk formula
  `gnedenkoKorolyuk n k_n = P(√(n/2) D_{n,n} < x)`. Hence `kolmogorovCdf` is nondecreasing on
  `(0, ∞)`, as a pointwise limit of nondecreasing functions.
- **Kolmogorov.** `kolmogorovCdf x = 1 - 2 ∑_{k ≥ 1} (-1)^{k-1} exp (-2 k² x²)` for `x > 0` and
  `0` for `x ≤ 0` (van der Vaart, §19.3, p. 279, in the form
  `P(‖𝔾‖_∞ > x) = 2 ∑_{j ≥ 1} (-1)^{j+1} e^{-2j²x²}`);
  `kolmogorovDensity x = 8 x ∑_{k ≥ 1} (-1)^{k-1} k² exp (-2 k² x²)` for `x > 0`;
  `kolmogorovMeasure = volume.withDensity (ofReal ∘ kolmogorovDensity)`. Targets: the density is
  nonnegative (`kolmogorovDensity_nonneg`), `kolmogorovMeasure` is a probability measure
  (`isProbabilityMeasure_kolmogorovMeasure`), and `cdf kolmogorovMeasure = kolmogorovCdf`
  (`cdf_kolmogorovMeasure`). Proof: the theta transformation
  `kolmogorovCdf x = (√(2π)/x) ∑_{k ≥ 1} exp (-(2k - 1)² π² / (8 x²))` from Mathlib's
  `Real.tsum_exp_neg_mul_int_sq` (applied to `ℤ` and to `2ℤ`) gives `kolmogorovCdf x → 0` as
  `x → 0⁺`; termwise differentiation for `x ≥ δ > 0` gives the density; nonnegativity is the
  monotonicity of `kolmogorovCdf` from the consequence above.
- **Cramér–von Mises limit law** (`cvmLimitLaw`, `cvmLimitLaw_mean`): `cvmLimitLaw` is the law of
  `∑_{j ≥ 1} Z_j² / (j π)²` under `Measure.infinitePi (fun _ ↦ gaussianReal 0 1)`, the series
  taken in `ℝ≥0∞` and then in `ℝ` (van der Vaart, Example 12.13, pp. 170–171, in the form
  `1/6 + ∑_j (jπ)⁻² (Z_j² - 1)`, the same law since `∑_j (jπ)⁻² = 1/6`). It is a probability
  measure of mean `1/6` and variance `1/45`.

*Needs:* 3.5 (the Gnedenko–Korolyuk formula); Mathlib `Real.tsum_exp_neg_mul_int_sq`,
`Measure.withDensity`, `Measure.infinitePi`, `Measurable.tsum`.

**Checks**.

- `kolmogorovCdf`: `kolmogorovCdf 1 = 0.73000`, `kolmogorovCdf 1.224 = 0.90007`,
  `kolmogorovCdf 1.358 = 0.94997`, `kolmogorovCdf 1.628 = 0.99002`, each equal to
  `scipy.stats.kstwobign.cdf` to five digits.
- `kolmogorovCdf`: at `x = 0.5` the series and the theta form both give `0.036055`.
- `kolmogorovCdf` (negative control): at `x = 0.2` the true value is `5.05 · 10⁻¹³` (theta form),
  while the series truncated after one term gives `1 - 2e^{-0.08} = -0.846`; the series converges
  slowly near `0`, which is why the proof uses the theta form there.
- `kolmogorovDensity`: `kolmogorovDensity 1 = 1.07195`, equal to the numerical derivative of
  `kolmogorovCdf` at `1`.
- `kolmogorovDensity`: `∫₀^∞ kolmogorovDensity = 1`.
- `kolmogorovDensity` (negative control): the density is `0` for `x ≤ 0`; without the case split
  the odd function `8x ∑ …` would be negative there.
- `kolmogorovMeasure`: its mean is `√(π/2) log 2 = 0.86873`, by integrating `1 - kolmogorovCdf`.
- `kolmogorovMeasure`: its 95% quantile is `1.358` to three digits, the classical critical value.
- `kolmogorovMeasure` (negative control): `P(K ≤ 0.5) = 0.036055`; the one-sided law
  `P(sup B⁰ ≤ x) = 1 - e^{-2x²}` would give `0.39347`.
- `cvmLimitLaw`: `∑ 1/(jπ)² = 1/6`, the mean.
- `cvmLimitLaw`: `∑ 2/(jπ)⁴ = 1/45`, the variance.
- `cvmLimitLaw` (negative control): dropping the factor `π²` would give the mean `∑ 1/j² = π²/6`
  instead of `1/6`.

### Examples

- The two-sided Wilcoxon signed-rank test for `n = 3` that rejects when `W⁺ ∈ {0, 6}` has size
  `2/8 = 1/4` under every symmetric atomless law (3.3).

### Dependencies

Foundations 2.4, 5.1, 6.2, 9.1, 9.2; Tau Ceti's order statistics, quantile function and
Poisson-binomial counts; Mathlib.

## Layer 4: rank and goodness-of-fit asymptotics

Sequences of samples are the first `N` terms of an i.i.d. sequence (Foundations 8.5), or
`Measure.pi` on `Fin N`; the two forms agree because the law of the first `N` terms of an i.i.d.
sequence is `Measure.pi` (Foundations 8.5). Coefficients form a triangular array
`c N : Fin N → ℝ`, and `c̄` is the average of `c N`. In Lean, `firstN X N` is the sample of the
first `N` terms of a sequence `X`, a point of `Fin N → α`.

### 4.1 The projection of a rank statistic and the rank central limit theorem

- `rankStatisticProjection P φ c x = N c̄ ā + ∑ i, (c i - c̄) φ (F (x i))`, the approximating sum
  of the linear rank statistic `T_N` with exact scores in van der Vaart, Thm 13.5, p. 176, with
  `F = cdf P` and `ā` the average of the exact scores. It is not the Hájek projection
  `∑ᵢ E(T_N | X i) - (N - 1) E T_N` of MathematicalStatisticsAsymptotic 6.1, from which it differs
  at fixed `N`; the two are asymptotically equivalent.
- **Projection** (`tendsto_variance_linearRankStatistic_sub_projection`, van der Vaart,
  Thm 13.5, p. 176): for a score-generating function `φ` and exact scores, `E T_N = E T̂_N` for
  every `N` and `Var (T_N - T̂_N) / Var T_N → 0`, with `T̂_N` the approximating sum. When
  `∑_i (c N i - c̄)² = 0` both `T_N` and `T̂_N` are constant and the ratio is Lean's `0/0 = 0`.
- **Approximate scores** (`tendsto_variance_linearRankStatistic_sub_projection_approx`, van der
  Vaart, Thm 13.5, p. 176): the same holds with the approximate scores `φ (i/(N + 1))`, and `ā`
  their average in the approximating sum, when `φ` is nonconstant and continuous almost
  everywhere and `N⁻¹ ∑_{i ≤ N} φ (i/(N + 1))² → ∫₀¹ φ²`.
- *Proof route for the projection.* With `U i = F (X i)`,
  `exactScore φ N (rank U 0) = E[φ (U 0) | rank vectors of U up to N]`, the rank vectors form a
  filtration, and Mathlib's `tendsto_eLpNorm_condExp` gives `L²` convergence to `φ (U 0)`, which
  is measurable for the limit σ-algebra because `rank U 0 / (N + 1) → U 0` in `L²`. Since
  `T_N = E[T̂_N | rank vector]`, `Var (T̂_N - T_N) = Var T̂_N - Var T_N`, and the ratio
  `Var T̂_N / Var T_N = (N - 1)/N · Var φ(U 0) / Var exactScore φ N (rank U 0)` tends to `1`.
- **Rank central limit theorem** (`tendstoInDistribution_linearRankStatistic`, van der Vaart,
  Cor 13.8, p. 177): if `∑_i (c N i - c̄)² > 0` for all large `N` and
  `max_i (c N i - c̄)² / ∑_i (c N i - c̄)² → 0` (Noether's condition, van der Vaart, (13.7),
  p. 177), then `Var T_N > 0` for all large `N` and `(T_N - E T_N) / √(Var T_N) ⇝ N(0, 1)`. The
  positivity hypothesis is needed under Lean's division: for `c N = 0` the Noether ratio is `0`,
  while the standardized statistic is identically `0`. Positivity of `Var T_N` follows from 3.2,
  since `N⁻¹ ∑_{k ≤ N} (a k - ā)² → ∫₀¹ (φ - ∫₀¹ φ)² > 0` for a score-generating `φ` (the
  projection proof route). Proof: the projection, the Lindeberg–Feller theorem
  (MathematicalStatisticsAsymptotic 1.2) for `T̂_N`, and Slutsky (Foundations 8.4).

*Needs:* 3.1, 3.2; Foundations 8.4, 8.5; MathematicalStatisticsAsymptotic 1.2 (Lindeberg–Feller);
Mathlib `tendsto_eLpNorm_condExp`.

**Checks.**

- `rankStatisticProjection`: for `φ u = u` and two-sample coefficients (`m` zeros, `n` ones,
  `N = m + n`), `ā = 1/2` and `T̂_N = n/2 + ∑ i, (c i - n/N) U i`, with `Var T̂_N = mn/(12N)`; the
  Wilcoxon statistic `T_N = ∑_{i > m} rank/(N + 1)` has `Var T_N = mn/(12(N + 1))` (van der Vaart,
  Example 13.11, p. 178).
- `rankStatisticProjection`: in the same case
  `Var (T_N - T̂_N) / Var T_N = (N + 1)/N - 1 = 1/N → 0`.
- Approximate scores: for `φ u = u` the approximate scores `i/(N + 1)` are the exact scores
  `E U_{N(i)} = i/(N + 1)`, and `N⁻¹ ∑_{i ≤ N} (i/(N + 1))² = (2N + 1)/(6(N + 1)) → 1/3 = ∫₀¹ u²`.
- `rankStatisticProjection`: `E T̂_N = N c̄ ā = E T_N`, since `∑_i (c i - c̄) = 0` and
  `E φ(U i) = ∫₀¹ φ` is the same for every `i`.
- `rankStatisticProjection` (negative control): for constant coefficients `c i = 1`, `T_N = T̂_N`
  identically and the variance ratio is the junk `0/0 = 0`; a theorem stated without this
  convention in mind would claim a ratio of two zero variances.
- `rankStatisticProjection` (negative control): for `N = 2`, `φ u = u`, `c = (1, 0)` and the
  uniform law, the exact scores are `1/3, 2/3` and `T_N = rank U 0 / 3`. The approximating sum is
  `1/2 + (u₀ - u₁)/2`, while the Hájek projection of MathematicalStatisticsAsymptotic 6.1 is
  `(1 + u₀)/3 + (2 - u₁)/3 - 1/2 = 1/2 + (u₀ - u₁)/3`.

### 4.2 Limits of the classical rank statistics

- **Wilcoxon signed rank** (`tendstoInDistribution_signedRankStatistic`, van der Vaart,
  Thm 13.18 and Example 13.19, pp. 182–183): under a symmetric atomless law,
  `(W⁺ - n(n + 1)/4) / √(n(n + 1)(2n + 1)/24) ⇝ N(0, 1)`, and, in van der Vaart's form for
  `W_n = ∑ i, absRank X i · sign (X i)`, which is `2W⁺ - n(n + 1)/2` almost surely,
  `n^{-3/2} W_n ⇝ N(0, 1/3)`.
- **Mann–Whitney** (`tendstoInDistribution_mannWhitney`): with `m, n → ∞`,
  `(U - mn/2) / √(mn(m + n + 1)/12) ⇝ N(0, 1)` under a common atomless law. Proof: 4.1 with
  two-sample coefficients, which satisfy Noether's condition as soon as `m, n → ∞` (van der
  Vaart, Example 13.10, p. 178).
- **Kendall under independence** (`tendstoInDistribution_kendallTau`, van der Vaart,
  Example 12.5, p. 164): if `P = P₁ ⊗ P₂` with atomless marginals, `√n τ̂ ⇝ N(0, 4/9)`.
- **Kendall in general** (`tendstoInDistribution_kendallTau_sub`, van der Vaart, Example 12.5,
  p. 164): `√n (τ̂ - τ) ⇝ N(0, 4 ζ₁)` for
  every law with continuous marginals, with `τ = E sign ((X₁ - X₂)(Y₁ - Y₂))` and `ζ₁` the
  variance of the first Hoeffding projection of the kernel (MathematicalStatisticsAsymptotic 6.2,
  nondegenerate U-statistics); for `ζ₁ = 0` the limit is the Dirac law at `0`. Under
  independence `ζ₁ = 1/9`, which gives the previous bullet.
- **Spearman** (`tendstoInDistribution_spearmanRho`, van der Vaart, Example 13.22, p. 184): for
  `r_s = spearmanRho`, the statistic of 3.3, under independence with atomless marginals
  `√n r_s ⇝ N(0, 1)`.
- **Tests of independence** (`tendsto_measure_independenceTest`). The test rejecting when
  `(3/2) √n |τ̂| > z_{α/2}` has asymptotic level `α` under independence and power tending to `1` at
  every law with continuous marginals and `τ ≠ 0`; the same for `√n |r_s|` with `τ` replaced by
  `12 E[F_X(X) F_Y(Y)] - 3`. Proof: the limits above and consistency in probability of `τ̂` and
  `r_s`. For `τ̂`, a U-statistic with a bounded kernel, `√n (τ̂ - τ)` converges in law
  (MathematicalStatisticsAsymptotic 6.2), so `τ̂ - τ → 0` in probability by Slutsky (Foundations
  8.4). For `r_s`, with almost surely distinct coordinates, `R i = n F̂_n(X i)` and
  `S i = n Ĝ_n(Y i)`, so `r_s = 12 n²/(n² - 1) · n⁻¹ ∑ F̂_n(X i) Ĝ_n(Y i) - 3 (n + 1)/(n - 1)`;
  replacing `F̂_n`, `Ĝ_n` by `F`, `G` costs at most `‖F̂_n - F‖_∞ + ‖Ĝ_n - G‖_∞`, which tends to `0`
  almost surely by the classical Glivenko–Cantelli theorem (MathematicalStatisticsAsymptotic 3.4),
  and the weak law (Foundations 8.5) gives `n⁻¹ ∑ F(X i) G(Y i) → E[F(X) G(Y)]`.
- **Kruskal–Wallis** (`tendstoInDistribution_kruskalWallis`, van der Vaart, Example 13.16,
  pp. 180–181): under a common atomless law, for fixed `k` and `n_j / N → λ_j > 0`,
  `H ⇝ χ²_{k-1}` (Tau Ceti `chiSquaredMeasure (k - 1)`). Proof: the vector
  of standardized rank sums is asymptotically `N(0, I - √λ √λᵀ)` by 4.1 and the Cramér–Wold
  device; its squared norm has the chi-squared law by Tau Ceti's
  `HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian`.

*Needs:* 3.3, 4.1; Foundations 2.4, 8.4, 8.5, 9.1; MathematicalStatisticsAsymptotic 1.2
(multivariate central limit theorem), 3.4 (the classical Glivenko–Cantelli theorem), 6.2
(nondegenerate U-statistics); Mathlib `tendstoInDistribution_iff_tendstoInDistribution_inner`.

**Checks.**

- Kendall under independence: the projection of `sign((x₂ - x₁)(y₂ - y₁))` given `(x₁, y₁)` is
  `(1 - 2U)(1 - 2V)` with `U`, `V` independent uniform, of variance `(1/3)(1/3) = 1/9`, and
  `4 · 1/9 = 4/9`; consistent with `n Var τ̂ = 2(2n + 5)/(9(n - 1)) → 4/9`.
- Wilcoxon signed rank: `Var W⁺ / n³ → 1/12`, and `Var (2W⁺) / n³ → 1/3`, van der Vaart's
  normalization.
- `spearmanRho` for `n = 2` or `n = 3` and one coordinate the reverse of the other:
  `∑ (R i - S i)² = 2`, respectively `8`, and `r_s = 1 - 12/6 = -1`, respectively
  `1 - 48/24 = -1`; for equal orderings `r_s = 1`.
- `spearmanRho`: `Var r_s = 1/(n - 1)` (3.3), so `n Var r_s → 1`, the variance of the limit.
- `spearmanRho`, negative control: with the divisor `n³` in place of `n(n² - 1)` the reversed
  sample of size `3` would give `1 - 48/27 = -0.778`, not `-1`; for `n ≤ 1` the
  divisor is `0` and the value is the junk `1`, which the limit never sees.
- Tests of independence at the bivariate normal law with correlation `ρ = 1/2`:
  `τ = (2/π) arcsin ρ = 1/3` and `12 E[F_X(X) F_Y(Y)] - 3 = (6/π) arcsin (ρ/2) = 0.48258`, both
  nonzero, so both tests have power tending to `1`.

### 4.3 Locally most powerful rank tests are asymptotically optimal

Two-sample shift: `X₁, …, X_m` with density `f (x - μ)` and `Y₁, …, Y_n` with density
`f (x - ν)`, independent, `f` absolutely continuous with Fisher information `I_f < ∞`,
`N = m + n`, `m / N → λ ∈ (0, 1)`. The location model is then differentiable in quadratic mean
(MathematicalStatisticsAsymptotic 7.3), and the two-sample model is locally asymptotically
normal at `(μ₀, μ₀)` with information `diag (λ I_f, (1 - λ) I_f)`.
- **Power envelope** (`limsup_power_le_envelope`, van der Vaart, Cor 15.14, p. 224): for tests
  `φ_N` of level `α` for `H₀ : ν = μ` (`E_{μ,μ} φ_N ≤ α` for every `μ` and `N`), at
  `μ = μ₀ + g/√N`, `ν = μ₀ + (g + h)/√N` with `h > 0`,
  `limsup_N E φ_N ≤ 1 - Φ (z_α - h √(λ (1 - λ) I_f))`. Proof: the argument of
  MathematicalStatisticsAsymptotic 8.2 (van der Vaart, Thm 15.4, p. 219) with
  `ψ(μ, ν) = ν - μ`; the null is the line `ν = μ` rather than a half-space, and the linearity of
  `ψ` lets the proof go through (van der Vaart's proof of Cor 15.14). The efficient information
  for `ν - μ` is `(1/(λ I_f) + 1/((1 - λ) I_f))⁻¹ = λ (1 - λ) I_f`.
- **Power of rank tests** (`tendsto_power_rankTest`; the case of `φ_f` for the logistic law is
  van der Vaart, Example 15.15, p. 225): for a score-generating `φ` and the two-sample statistic
  `T_N = linearRankStatistic c (exactScore φ N)` with `c i = 1` on the second sample and `0` on
  the first, the rank test that rejects when
  the standardized statistic `(T_N - E₀ T_N)/√(Var₀ T_N)` exceeds `z_α` has power tending to
  `1 - Φ (z_α - h √(λ (1 - λ)) ⟨φ, φ_f⟩ / ‖φ - ∫φ‖)` at the alternatives above, with the inner
  product and norm of `L²(0, 1)`. For `φ = φ_f`, `∫ φ_f = 0` and `⟨φ_f, φ_f⟩ = I_f`, so the test
  with scores `φ_f` attains the envelope: the Wilcoxon test for the logistic shift and the
  normal-scores test for the normal shift. Proof: 4.1, the joint asymptotic normality of the
  projection and the log likelihood ratio, then Le Cam's third lemma
  (MathematicalStatisticsAsymptotic 7.2).
- **One sample** (`tendsto_power_signedRankTest`, van der Vaart, Cor 15.10, p. 222): for a
  symmetric `f` with `I_f < ∞`, the
  signed-rank statistic `∑ sign (X i) a_n (absRank X i)` with exact scores generated by
  `-(f'/f)((F⁺)⁻¹ u)`, `F⁺ = 2F - 1` on `[0, ∞)`, standardized by its null standard deviation,
  gives the test rejecting above `z_α`, of asymptotic level `α`, whose power at `θ = h/√n` tends
  to `1 - Φ (z_α - h √I_f)`, the envelope (the level is the case `h = 0`).

*Needs:* 3.2, 4.1; Foundations 8.6; MathematicalStatisticsAsymptotic 7.2 (Le Cam's third lemma),
7.3 (local asymptotic normality of quadratic-mean differentiable models), 8.2 (the asymptotic
power envelope).

**Checks.**

- Logistic: `φ_f u = 2u - 1`, `I_f = ∫₀¹ (2u - 1)² du = 1/3`, and the Wilcoxon scores `φ u = u`
  give `⟨φ, φ_f⟩ / ‖φ - ½‖ = (1/6)/(1/√12) = 1/√3 = √I_f`: the envelope is attained.
- Normal: the Wilcoxon scores give `⟨u, Φ⁻¹⟩ / ‖u - ½‖ = (1/(2√π)) √12 = √(3/π) = 0.97721`, below
  `√I_f = 1`; its square `3/π` is the Pitman efficiency of the Wilcoxon test relative to the
  `t` test at the normal law (MathematicalStatisticsAsymptotic 8.3).
- One sample: for the Laplace density `-f'/f = sign`, so the optimal scores are `φp ≡ 1`, the
  sign test, with `I_f = 1` and limiting power `1 - Φ (z_α - h)` (van der Vaart, Example 15.11,
  p. 222).
- One sample: replacing `f` by `σ⁻¹ f (x/σ)` multiplies the scores `φp` by `σ⁻¹`, since
  `(F⁺)⁻¹` is multiplied by `σ`, and leaves the standardized statistic and the test unchanged
  (van der Vaart, p. 222).

### 4.4 The Chernoff–Savage inequality

- **Efficacy of the normal-scores test** (`efficacy_normalScores`). For `φ = Φ⁻¹` and a density
  `f`, absolutely continuous
  with `I_f < ∞` and with distribution function `F`,
  `⟨Φ⁻¹, φ_f⟩ = ∫ f (x)² / φ_N (Φ⁻¹ (F x)) dx`, with `φ_N` the standard normal density, and
  `‖Φ⁻¹‖ = 1`, `∫₀¹ Φ⁻¹ = 0`. Proof: integration by parts with `h = Φ⁻¹ ∘ F`, `h' = f/φ_N(h)`;
  `‖φ_f‖ = √I_f` and `h(X) ~ N(0, 1)` make `h f'` integrable, and the boundary terms `h f` vanish
  at `±∞` because `|h| → ∞` while `f` is integrable. In particular the right side is at most
  `√I_f < ∞`.
- **Gaussian integration by parts for monotone maps** (`covariance_gaussianReal_of_monotone`).
  For `Z ~ N(0, 1)` and a nondecreasing
  `g : ℝ → ℝ` with `E g(Z)² < ∞`, `Cov(g(Z), Z) = ∫ φ_N dg`, the integral of the standard normal
  density against the Stieltjes measure of the right-continuous version of `g` (equal to `g`
  off the countable set of its jumps). Proof: `Cov(g(Z), Z) = E[Z (g(Z) - g(0))]`; write
  `g(z) - g(0) = dg((0, z])` for `z > 0` and `-dg((z, 0])` for `z < 0`, apply Tonelli to each
  half, and use `∫_t^∞ z φ_N(z) dz = φ_N(t)` for `t ≥ 0` and its mirror image for `t < 0`. For
  smooth `g` this is the identity `E[Z g(Z)] = E g'(Z)` of RandomMatrices §2.5.
- **Chernoff–Savage** (`chernoffSavage`): for a probability density `f` with finite variance
  `σ² = ∫ x² f - (∫ x f)²`, `σ² (∫ f² / φ_N (Φ⁻¹ ∘ F))² ≥ 1`. The integral is taken in `ℝ≥0∞` (it
  may be infinite, where a Bochner integral would be the junk `0`). Proof: let `Z ~ N(0, 1)` and
  `g = F⁻¹ ∘ Φ`, a nondecreasing map with `g(Z) ~ f`, and `g'` its almost-everywhere derivative;
  then `∫ f² / φ_N (Φ⁻¹ ∘ F) = E[1/g'(Z)]`. By Cauchy–Schwarz and the previous bullet,
  `σ ≥ Cov(g(Z), Z) = ∫ φ_N dg ≥ E g'(Z)`, the jumps of `g` (at gaps of the support of `f`) only
  increasing the middle term, and `E[1/g'(Z)] ≥ 1 / E g'(Z)` by Jensen.
- **Equality** (`chernoffSavage_eq_one_iff`): equality holds iff `f` is a
  normal density. Proof route:
  equality in Jensen forces `g'` constant, equality in the middle step forces `g` absolutely
  continuous, and equality in Cauchy–Schwarz forces `g` affine.
- **Pitman efficiency** (by the argument of MathematicalStatisticsAsymptotic 8.3, van der Vaart,
  Thm 14.19, pp. 201–202): in the two-sample shift model of 4.3, with `f` as in the first bullet and
  of finite variance `σ² > 0`, compare the normal-scores rank test with
  the two-sample `t` test. Each rejects when its standardized statistic exceeds a critical value
  `c_N` calibrated to level at most `α` at every `N` under the null law with the fixed `f`
  (exactly, for the distribution-free rank statistic) with `c_N → z_α`. Their local slopes,
  from 4.3 and MathematicalStatisticsAsymptotic 8.3, are `√(λ (1 - λ)) ⟨Φ⁻¹, φ_f⟩` and
  `√(λ (1 - λ))/σ`, both positive and finite (the first by
  the first bullet, since the integrand is positive), with null standard deviation `1` after
  standardization. The model is continuous in total variation in the shift for each `N`, and
  both tests have nondecreasing power functions in the shift (the normal scores are increasing,
  and the `t` statistic increases with the shift of the second sample while the pooled variance
  is shift-invariant), so asymptotic normality along shifts `O(N^{-1/2})` (4.3) suffices. Then for
  every `0 < α < γ < 1` and every sequence of alternatives `θ_ν ↓ 0`, the Pitman efficiency of
  the normal-scores test relative to the `t` test is `σ² (∫ f² / φ_N (Φ⁻¹ ∘ F))²`, which is at
  least `1` by the previous bullets.

*Needs:* 3.2, 4.3; MathematicalStatisticsAsymptotic 8.3; Mathlib `ConvexOn.map_integral_le`,
`StieltjesFunction.measure`.

**Checks.**

- Monotone integration by parts at `g z = z`: `dg` is Lebesgue measure and both sides are
  `Var Z = 1`.
- Monotone integration by parts at `g = 1_{[0, ∞)}`: `dg = δ₀`, and both sides are
  `φ_N(0) = E[Z; Z ≥ 0] = 0.398942`.
- Monotone integration by parts (negative control): for the same step function the
  almost-everywhere derivative is `0`, so the smooth form `E g'(Z)` gives `0` instead of
  `0.398942`; the jump must be kept in `dg`.
- `chernoffSavage` at `f = N(0, σ²)`: `Φ⁻¹(F x) = x/σ` and `∫ f²/φ_N(x/σ) dx = ∫ f(x)/σ dx = 1/σ`,
  so the left side is `1`, the equality case.
- Laplace `e^{-|x|}/2`: `σ² = 2` and `∫ f²/φ_N(Φ⁻¹ ∘ F) = √(2/π) = 0.79788`, so the left
  side is `4/π = 1.27324`.
- Logistic: `σ² = π²/3` and the integral is `1/√π = 0.56419`, so the left side is
  `π/3 = 1.04720`; the efficacy integral `0.56419` is below `√I_f = 1/√3 = 0.57735`, and
  at the Laplace law `0.79788` is below `√I_f = 1`, as the first bullet requires.
- Negative control: the uniform law on `[0, 1]` has `σ² = 1/12` and
  `∫₀¹ 1/φ_N(Φ⁻¹(x)) dx = ∫ dz = ∞`, so the left side is `∞ ≥ 1`; a Bochner integral would give the
  junk `0` and the false `0 ≥ 1`.

### 4.5 The Hodges–Lehmann limit

- **Asymptotic normality** (`tendstoInDistribution_hodgesLehmann`; the efficiency form is
  Hollander–Wolfe–Chicken, §3.11, p. 113): for i.i.d. observations with
  density `f (x - θ)`, `f` symmetric and `∫ f² < ∞`,
  `√n (hodgesLehmann X - θ) ⇝ N(0, 1/(12 (∫ f²)²))`. The variance is the reciprocal of the
  squared efficacy `12 (∫ f²)²` of the Wilcoxon signed-rank test
  (MathematicalStatisticsAsymptotic 8.3). Proof: by Tukey's identity (3.4), whose hypotheses hold
  almost surely for each fixed `t` because the law has a density, `{√n (θ̂ - θ) ≤ t}` differs
  from `{W⁺(X - θ - t/√n) ≤ M/2}` only on events of probability tending to `0`. By the same
  identity `W⁺(X - θ - t/√n)` is the number of observations above `θ + t/√n`, at most `n`, plus
  `C(n, 2)` times the U-statistic with kernel `1_{(x₁ + x₂)/2 > θ + t/√n}`. Its mean is
  `C(n, 2) (1 - G(2t/√n)) + O(n)`, where `G` is the distribution function of `X₁ + X₂ - 2θ`,
  which by symmetry has the density `g = f * f` of `X₁ - X₂`; `g` is continuous because
  `f ∈ L²`, and `g(0) = ∫ f² > 0`. Conclude with the U-statistic central limit theorem
  (MathematicalStatisticsAsymptotic 6.2; projection variance `1/12` at `t = 0`) and Slutsky.

- **Influence function** (`hasInfluenceFunction_hodgesLehmannFunctional`). For `f` symmetric
  with `∫ f² < ∞`, the Hodges–Lehmann functional `hodgesLehmannFunctional`, the lower median of
  the law of `(X₁ + X₂)/2` for `X₁`, `X₂` i.i.d. `F`, has at the law with density `f (x - θ)` the
  influence function `x ↦ (F(x - θ) - ½) / ∫ f²` in the sense of `HasInfluenceFunction`
  (MathematicalStatisticsAsymptotic 9.1), with `F` the distribution function of `f`; its variance
  `(1/12)/(∫ f²)²` is the limit variance above. Proof: the law of `(X₁ + X₂)/2` under
  `(1 - ε) F_θ + ε δₓ` has distribution function
  `(1 - ε)² H(t) + 2ε(1 - ε) F_θ(2t - x) + ε² 1_{x ≤ t}`, with `H` of derivative `2 ∫ f²` at
  `θ` (the density `f * f` is continuous); differentiate the median equation at `ε = 0` and use
  `F_θ(2θ - x) = 1 - F(x - θ)`. The variance is that of `F(X - θ) - ½`, uniform on
  `(-½, ½)`.

*Needs:* 3.4, 4.2; Foundations 8.4; MathematicalStatisticsAsymptotic 6.2, 8.3, 9.1, 9.2.

**Checks.**

- Normal `f = N(0, 1)`: `∫ f² = 1/(2√π)` and the variance is `4π/12 = π/3`, against `1` for the
  mean: the ratio of asymptotic variances is `3/π = 0.95493`.
- Laplace `e^{-|x|}/2`: `∫ f² = 1/4`, the variance is `4/3`, against `2` for the mean: ratio
  `3/2`.
- Negative control: with the reciprocal of the efficacy `√12 ∫ f²` instead of its square, the
  normal case would give `2√π/√12 = 1.02333` instead of `π/3 = 1.04720`.
- `hasInfluenceFunction_hodgesLehmannFunctional` at `N(0, 1)`, `θ = 0`: the numerical
  contamination derivative of the median of the Walsh-average law is `1.2100` at `x = 1` and
  `-1.6918` at `x = -2`, against `(Φ(x) - ½) · 2√π = 1.2100` and `-1.6918`; at the logistic law,
  with `∫ f² = 1/6`, `1.3863` and `-2.2848` against `6 (F(x) - ½)`.
- The variance identity: `∫ IF² dF = (1/12) · 4π = π/3 = 1.04720` at `N(0, 1)` and
  `(1/12) · 36 = 3` at the logistic law, equal to `1/(12 (∫ f²)²)`.
- `hodgesLehmannFunctional`: at `δ_a` the Walsh-average law is `δ_a` and the value is `a`; at the
  two-point law `½ δ₀ + ½ δ₂` it is the law `¼ δ₀ + ½ δ₁ + ¼ δ₂`, whose lower median is `1`.
- `hodgesLehmannFunctional`, negative control: it is not the median of `F`. At
  `⅔ δ₀ + ⅓ δ₃` the median of `F` is `0`, while the Walsh-average law
  `(4/9) δ₀ + (4/9) δ_{3/2} + (1/9) δ₃` has distribution function `4/9 < ½` at `0`, so its lower
  median is `3/2`.

### 4.6 The Kolmogorov–Smirnov limit and a Dvoretzky–Kiefer–Wolfowitz bound

For `P` with continuous distribution function, `D_n = ksStatistic` of the first `n`
observations.
- **Kolmogorov's theorem** (`tendstoInDistribution_sqrt_mul_ksStatistic`, van der Vaart,
  Cor 19.21, p. 277, with the limit law on p. 279): `√n D_n ⇝ kolmogorovMeasure`. Proof: by the
  Donsker theorem for the empirical distribution function (MathematicalStatisticsAsymptotic 3.4)
  and the continuous map `z ↦ ‖z‖_∞` on `ℓ^∞(ℝ)` (MathematicalStatisticsAsymptotic 2.2),
  `√n D_n` converges in law to the law `L₀` of the supremum of a Brownian bridge; the same
  theorem for two independent samples gives `√(n/2) D_{n,n} ⇝ L₀`. By 3.6,
  `P(√(n/2) D_{n,n} < x) = gnedenkoKorolyuk n k_n → kolmogorovCdf x` for every `x > 0`, so the
  distribution functions of `L₀` and `kolmogorovMeasure` agree at the common continuity points,
  and `L₀ = kolmogorovMeasure`.
- **Brownian identification** (`map_sup_brownianBridge`): if `B` satisfies Mathlib's
  `IsBrownianReal B μ`, the law of `sup_{t ∈ [0, 1]} |B t - t B 1|` is `kolmogorovMeasure`.
  Proof: `t ↦ B t - t B 1` has almost surely continuous paths and centered Gaussian marginals with
  covariance `s ∧ t - s t`, so its law on `ℓ^∞([0, 1])` is the Brownian-bridge law
  (MathematicalStatisticsAsymptotic 2.4, characterized by its marginals), and the first bullet
  identifies the law of the supremum.
- **Bounded-differences DKW bound** (`measure_ksStatistic_ge_le`): for every `n ≥ 1` and
  `t ≥ 0`, `P(D_n ≥ √(log (2n + 2) / (2n)) + 1/n + t) ≤ exp (-2 n t²)`. Proof: changing one
  observation changes `D_n` by at most `1/n`, so Tau Ceti's McDiarmid inequality gives
  `P(D_n - E D_n ≥ t) ≤ exp (-2 n t²)`; on the grid `F(t_k) = k/n`, `D_n` is at most `1/n` plus a
  maximum of `2(n + 1)` sub-Gaussian averages of variance proxy `1/(4n)`, whose mean is at most
  `√(log (2n + 2)/(2n))`.

*Needs:* 3.5, 3.6; Foundations 9.1, 9.2; Tau Ceti
`hasSubgaussianMGF_of_bounded_differences_fin`; MathematicalStatisticsAsymptotic 2.2 and 2.3
(weak convergence in `ℓ^∞(T)` with the continuous-mapping theorem), 2.4, 3.4 (the Donsker theorem
for the empirical distribution function); Mathlib `IsBrownianReal`.

**Checks.**

- Gnedenko–Korolyuk at `n = 20000`, `x = 1`: `k_n = 200` and the value is `0.729996`, against
  `kolmogorovCdf 1 = 0.730000`.
- Negative control for the lattice: at `n = 20001`, `k_n = 201` and the value is `0.73529`; the
  ceiling makes the convergence oscillate at the scale `n^{-1/2}`, so agreement at
  one `n` is no proof of the rate.
- DKW bound at `n = 100`: `√(log 202 / 200) + 0.01 = 0.173`, above the limiting mean
  `E sup |B⁰| / √n = √(π/2) log 2 / 10 = 0.087`.

### 4.7 Cramér–von Mises and two-sample limits

- **Cramér–von Mises limit** (`tendstoInDistribution_cvmStatistic`, van der Vaart, Cor 19.21,
  p. 277): `cvmStatistic ⇝ cvmLimitLaw` for continuous `F`. Proof without empirical processes:
  by 3.5 it suffices to treat uniform `U i`; then
  `∫₀¹ (1_{U ≤ t} - t) √2 sin (jπt) dt = √2 cos (jπU)/(jπ)`, so by Parseval in `L²(0, 1)` for
  the sine basis, `cvmStatistic = ∑_j (jπ)⁻² (n^{-1/2} ∑_i √2 cos (jπ U_i))²`; the variables
  `√2 cos (jπU)` are orthonormal and centered, so finitely many coordinates converge jointly to
  independent `N(0, 1)` by the multivariate central limit theorem, and the tail `∑_{j > J}` has
  expectation `∑_{j > J} (jπ)⁻²` uniformly in `n`.
- **Brownian identification** (`map_integral_sq_brownianBridge`): for `B` with
  `IsBrownianReal B μ`, the law of `∫₀¹ (B t - t B 1)² dt` is `cvmLimitLaw`. Proof: the sine
  coefficients `∫₀¹ (B t - t B 1) √2 sin (jπt) dt` of the bridge are jointly Gaussian, and the
  direct computation `∫₀¹∫₀¹ (s ∧ t - s t) 2 sin (jπs) sin (kπt) ds dt = δ_{jk} (jπ)⁻²` shows they
  are independent `N(0, (jπ)⁻²)`; Parseval for the sine basis concludes.
- **Two-sample Kolmogorov–Smirnov** (`tendstoInDistribution_twoSampleKS`): for sequences
  `m k, n k → ∞`, independent samples and a common continuous law,
  `√(m n / (m + n)) D_{m,n} ⇝ kolmogorovMeasure`. Proof: `√(mn/(m + n)) (F̂_m - Ĝ_n)` is
  `√(n/(m + n))` times one empirical process minus `√(m/(m + n))` times an independent one; along
  subsequences with `m/(m + n)` convergent, the Donsker theorem (MathematicalStatisticsAsymptotic
  3.4) for both samples gives a Brownian-bridge limit, whose supremum has the law
  `kolmogorovMeasure` by 4.6; the limit does not depend on the subsequence.
- **Consistency of the two-sample test** (`tendsto_ksTwoSample_of_ne`). If the two laws differ,
  then
  `D_{m,n} → sup_t |F(t) - G(t)| > 0` almost surely by the classical Glivenko–Cantelli theorem
  (MathematicalStatisticsAsymptotic 3.4), so `√(mn/(m + n)) D_{m,n} → ∞` in probability and the
  test with the critical values of `kolmogorovMeasure` is consistent against every alternative.
- **Estimated parameters** (van der Vaart, Thm 19.23, p. 278). Let `{F_θ}`, `θ ∈ Θ ⊆ ℝ^k` open,
  satisfy `sup_x |F_{θ+u}(x) - F_θ(x) - uᵀ Ḟ_θ(x)| = o(|u|)` (Fréchet differentiability of
  `θ ↦ P_θ` in `ℓ^∞` of the half-line indicators), and let
  `√n (θ̂_n - θ) = n^{-1/2} ∑ ψ_θ(X i) + o_P(1)` with `E ψ_θ = 0`, `E |ψ_θ|² < ∞`. Then
  `√n (F̂_n - F_{θ̂_n})(t) = 𝔾_n f_t + o_P(1)` uniformly in `t`, for the class
  `f_t(x) = 1_{x ≤ t} - Ḟ_θ(t)ᵀ ψ_θ(x)`, which is Donsker; hence
  `√n sup_t |F̂_n(t) - F_{θ̂_n}(t)|` converges in law to the supremum of the Brownian bridge of
  this class, a centered Gaussian process with covariance
  `F_θ(s ∧ t) - F_θ(s) F_θ(t) - Ḟ_θ(s)ᵀ E[ψ_θ 1_{X ≤ t}] - Ḟ_θ(t)ᵀ E[ψ_θ 1_{X ≤ s}] + Ḟ_θ(s)ᵀ E[ψ_θ ψ_θᵀ] Ḟ_θ(t)`.
  Proof: the Donsker theorem for VC classes (MathematicalStatisticsAsymptotic 3.5) applied to
  `f_t`, and the continuous map `z ↦ ‖z‖_∞`.

*Needs:* 3.5, 3.6, 4.6; Foundations 8.4; MathematicalStatisticsAsymptotic 1.2 (multivariate
central limit theorem), 2.2 and 2.3 (weak convergence in `ℓ^∞(T)`), 3.4 (Glivenko–Cantelli and
Donsker for the empirical distribution function), 3.5 (Donsker for VC classes); Mathlib
`HilbertBasis` of `L²(0, 1)` built from the sine functions.

**Checks.**

- `∫₀¹ (1_{u ≤ t} - t) sin (jπt) dt = cos (jπu)/(jπ)`: at `u = 0` the left side is
  `∫₀¹ (1 - t) sin (jπt) dt = (1 - (-1)^j)/(jπ) + (-1)^j/(jπ) = 1/(jπ)`.
- `E cvmStatistic = ∑_j (jπ)⁻² · E (√2 cos (jπU))² = 1/6` for every `n`, matching the exact
  mean `n · ∫₀¹ t(1 - t)/n dt = 1/6`.

### Examples

- The 95% quantile of `kolmogorovMeasure` is `1.358` to three digits (3.6's check), the classical
  critical value of the Kolmogorov–Smirnov test.

### Dependencies

Layer 3 and Foundations Layer 8; MathematicalStatisticsAsymptotic as listed in each
subsection; Tau Ceti's McDiarmid inequality and chi-squared laws.

## Layer 5: smoothing

### 5.1 Function classes and kernels

- **Hölder classes** (`holderClass β L`, Tsybakov, Def 1.2, p. 5): for `β > 0`, `L > 0` and
  `ℓ = ⌈β⌉ - 1`, the largest integer strictly smaller than `β`, the functions `f : ℝ → ℝ` with
  `ContDiff ℝ ℓ f` and `HolderWith L (β - ℓ) (iteratedDeriv ℓ f)`. The Hölder density class
  `holderDensityClass β L` (`𝒫(β, L)`, Tsybakov, p. 6) is its intersection with the probability
  densities. Only values on `[0, 1]` enter the regression statements.
- **Sobolev classes.** For an integer `β ≥ 1`, `W(β, L)` is the set of `f` on `[0, 1]` with
  `f^{(β-1)}` absolutely continuous and `∫₀¹ (f^{(β)})² ≤ L²`, and `W^per(β, L)` the subset with
  `f^{(j)}(0) = f^{(j)}(1)` for `j < β` (Tsybakov, Def 1.11, p. 49). For an integer `m ≥ 1` and
  `M > 0`, `𝓕_{m,M}` is the class of densities on `ℝ` with `m` continuous derivatives and
  `∫ (f^{(m)})² ≤ M` (van der Vaart, p. 346).
- **Kernels of order `ℓ`** (`IsKernelOfOrder K ℓ`, Tsybakov, Def 1.3, p. 5, which takes
  `ℓ ≥ 1`; here also `ℓ = 0`): integrable `K` with `∫ |u|^ℓ |K u| < ∞`, `∫ K = 1` and
  `∫ u^j K = 0` for `1 ≤ j ≤ ℓ`.
- **Sign of higher-order kernels** (`volume_neg_ne_zero_of_isKernelOfOrder`, Tsybakov, p. 10): a
  kernel of order `ℓ ≥ 2` is negative on a set of positive Lebesgue measure. Proof: if `K ≥ 0`
  a.e., then `∫ u² K = 0` forces `K = 0` a.e., against `∫ K = 1`.
- **Legendre kernels** (`isKernelOfOrder_legendreKernel`, Tsybakov, Prop 1.3, p. 10): for every
  `ℓ ≥ 1` the function `legendreKernel ℓ u = ∑_{m=0}^ℓ φ_m(0) φ_m(u) 1_{|u| ≤ 1}`, with
  `φ_m = √((2m + 1)/2) P_m` the orthonormal Legendre polynomials on `[-1, 1]` and
  `P_m = legendreP m` (Mathlib's shifted Legendre polynomial at `(1 - u)/2`), is a kernel of
  order `ℓ`; it is bounded, being a polynomial on `[-1, 1]`.
- **Bias and variance at a point** (`kde_bias_variance_le`, Tsybakov, Prop 1.1, p. 4, Prop 1.2,
  p. 6, and (1.9), p. 9): the densities in `𝒫(β, L)` are bounded by a constant `p_max(β, L)`;
  for `p ∈ 𝒫(β, L)` with `p ≤ p_max`, a kernel `K` of order `ℓ` with `∫ |u|^β |K| < ∞` and
  `∫ K² < ∞`, every `x₀`, `h > 0` and `n ≥ 1`, the kernel density estimator `p̂` of
  Foundations 9.3 satisfies `|E p̂(x₀) - p(x₀)| ≤ (L/ℓ!) ∫ |u|^β |K u| du · h^β` and
  `Var p̂(x₀) ≤ p_max ∫ K² / (n h)`. Proof: Taylor's formula of order `ℓ` with the Hölder
  remainder, and the vanishing moments; for `β ≤ 1` (`ℓ = 0`) only `∫ K = 1` is used.
- **Pointwise risk** (`kde_risk_le`, Tsybakov, Thm 1.1, p. 9): under the same hypotheses, with
  `h = c n^{-1/(2β+1)}` and `c > 0`, there is `C = C(β, L, K, c)` with
  `sup_{x₀} sup_{p ∈ 𝒫(β, L)} E (p̂(x₀) - p(x₀))² ≤ C n^{-2β/(2β+1)}` for every `n ≥ 1`.
  Proof: the bias and variance bounds and `p ≤ p_max`.

*Needs:* Mathlib `HolderWith`, `iteratedDeriv`, `ContDiff`, `taylor_mean_remainder_lagrange`;
Foundations 9.3.

**Checks.**

- `holderClass`: `β = 1` gives `ℓ = 0` and the `L`-Lipschitz functions (`HolderWith L 1` is
  `LipschitzWith L`); `x ↦ |x|` lies in `holderClass 1 1`.
- `holderClass`, negative control: `β = 2` gives `ℓ = ⌈2⌉ - 1 = 1`, the `C¹` functions with
  `L`-Lipschitz derivative, so `x ↦ |x|` is not in `holderClass 2 L` for any `L`, and
  `x ↦ x²` is in `holderClass 2 2`. A convention with `ℓ = ⌊β⌋` would ask for `C²` at `β = 2`.
- `holderClass`: the classes on `ℝ` are not nested in `β`: `x ↦ x²` is in `holderClass 2 2`
  but in no `holderClass 1 L`, since it is not Lipschitz on `ℝ`.
- `holderDensityClass`: the standard normal density `φ` is in `holderDensityClass 1 L` exactly
  when `L ≥ sup |φ'| = φ(1) = 0.24197`; the Laplace density `½ e^{-|x|}` is in
  `holderDensityClass 1 ½` and in no `holderDensityClass 2 L`, being nondifferentiable at `0`.
- `holderDensityClass`, negative control: the uniform density `1_{[0,1]}` is in no
  `holderDensityClass β L` with `β > 0`: it is discontinuous, so it fails `HolderWith` for
  `ℓ = 0` and `ContDiff` for `ℓ ≥ 1`.
- `holderDensityClass`: the condition `∫ p = 1` is a Bochner integral, so it forces `p` to be
  integrable (a nonintegrable `p` has `∫ p = 0`).
- `IsKernelOfOrder`: the order-2 Legendre kernel is `(9/8 - 15/8 u²) 1_{|u| ≤ 1}`: `∫ K = 1`,
  `∫ u K = 0`, `∫ u² K = 0`, so it is of order 2 and, by symmetry, of order 3;
  `∫ u⁴ K = -3/35 ≠ 0`, so it is not of order 4; it is negative for `|u| > √(3/5)`.
- `IsKernelOfOrder`, negative control: the Epanechnikov kernel `¾ (1 - u²)₊` is of order 1
  but not of order 2 (`∫ u² K = 1/5`); the order counts vanishing moments, not the first
  nonvanishing one (Tsybakov, p. 6, contrasts the two conventions).
- `IsKernelOfOrder`: order `0` is integrability with `∫ K = 1`, which every probability density
  satisfies.
- `legendreP`: `legendreP 1 u = u` (Mathlib's `shiftedLegendre 1 = 1 - 2X` at `(1 - u)/2`),
  `legendreP 2 0 = -1/2`, and `legendreP m 1 = 1`.
- `legendreP`, negative control: evaluated at `u` instead of `(1 - u)/2`, the shifted polynomial
  gives `1 - 2u` for `m = 1`, which is not odd, and the moments below would fail.
- `legendreKernel`: `legendreKernel 1 = ½ 1_{[-1,1]}` (as `P_1(0) = 0`), and
  `legendreKernel 2 u = 9/8 - 15/8 u²` on `[-1, 1]`, the order-2 kernel above; at `u = ½` both
  sides are `0.65625`.
- `legendreKernel`: `legendreKernel 3 = legendreKernel 2`, since `P_3(0) = 0`, and its moments
  `1, 0, 0, 0, -3/35` show order `3` and not `4`; `legendreKernel 4` has vanishing moments up to
  order `5`.
- `legendreKernel`, negative control: without the factors `(2m + 1)/2`, the case `ℓ = 2` has
  integral `2`, not `1`.
- `kde_bias_variance_le` at the Laplace density (in `𝒫(1, ½)`), `K = ½ 1_{[-1,1]}`, `x₀ = 0`:
  the bias is `½ - (1 - e^{-h})/(2h)`, `0.18394` at `h = 1` and `0.02419` at `h = 0.1`, below
  the bound `(L/0!) ∫ |u| K · h = h/4`, which is sharp as `h → 0`.
- `densityLaw`: `densityLaw volume (1_{[0,1]})` is `volume.restrict [0, 1]`, the uniform law.
- `densityLaw`: for a measurable `p ≥ 0` with `∫ p = 1` it is a probability measure.
- `densityLaw`, negative control: negative values are clipped by `ENNReal.ofReal`, so
  `densityLaw volume (-1_{[0,1]}) = 0`, not a signed measure.

### 5.2 Kernel density estimation on the line

For a bounded symmetric probability density `K` with `μ₂ = ∫ u² K` and `R(K) = ∫ K²` finite:
- **Exact mean integrated squared error** (`integral_mise_eq`, Wand–Jones, (2.7), p. 16): for
  every `h > 0`, `n ≥ 1` and density `f` with `∫ f² < ∞`,
  `E ∫ (f̂_h - f)² = ∫ (K_h * f - f)² + R(K)/(n h) - n⁻¹ ∫ (K_h * f)²`, with `K_h = h⁻¹ K(·/h)`.
  This identity uses only `K ≥ 0`, `∫ K = 1` and `R(K) < ∞`, not boundedness or symmetry.
- **Order of the risk** (`mise_le_of_contDiff`, van der Vaart, Thm 24.1, p. 344): if `f` is twice
  continuously differentiable with `∫ (f'')² < ∞`, then `E ∫ (f̂_h - f)² ≤ C_f (1/(n h) + h⁴)` for
  small `h > 0`.
- **Asymptotic expansion** (`isLittleO_mise_sub`, Wand–Jones, (2.12), p. 21, by the same
  argument): if `f` is twice
  continuously differentiable with `f`, `f''` square-integrable, then as `h → 0`, `n h → ∞`,
  `E ∫ (f̂_h - f)² = ¼ h⁴ μ₂² ∫ (f'')² + R(K)/(n h) + o(h⁴ + 1/(n h))`. Wand–Jones assume
  instead that `f''` is ultimately monotone and `K` has a finite fourth moment. Proof: write the
  bias as `½ h² μ₂ g_h` with `g_h` an average of translates of `f''` with weights
  `u² K(u) 2(1 - s)/μ₂`; continuity of translation in `L²` gives `g_h → f''` in `L²`; the
  integrated variance is `R(K)/(n h) - n⁻¹ ∫ (K_h * f)²` with `∫ (K_h * f)² ≤ ∫ f²`.
- **Optimal bandwidth** (`isMinOn_amise`, Wand–Jones, (2.13) and (2.14), p. 22): if
  `∫ (f'')² > 0`, the leading term `¼ h⁴ μ₂² ∫ (f'')² + R(K)/(n h)` has on `h > 0` the unique
  minimizer `h*_n = (R(K) / (μ₂² ∫ (f'')² n))^{1/5}`, with minimum
  `(5/4) (μ₂² ∫ (f'')²)^{1/5} R(K)^{4/5} n^{-4/5}`.
- **Pointwise asymptotic normality** (`tendstoInDistribution_kde`; the bias and variance terms are
  Fan–Gijbels, (2.40), p. 46): if moreover `f''` is bounded,
  `f(x) > 0`, `h → 0`, `n h → ∞` and `n h⁵ = O(1)`, then
  `√(n h) (f̂_h(x) - f(x) - ½ h² μ₂ f''(x)) ⇝ N(0, R(K) f(x))`. Proof: the bias is
  `½ h² μ₂ f''(x) + o(h²)` by dominated convergence with the bound `‖f''‖_∞ u² K(u)`; the
  variance is `(n h)⁻¹ (R(K) f(x) + o(1))`, using `K² ≤ ‖K‖_∞ K`; the summands are bounded by
  `2 ‖K‖_∞ / √(n h)`, so the Lindeberg–Feller theorem of MathematicalStatisticsAsymptotic
  (1.2) applies, and Slutsky; if `n h⁵ → 0` the bias term is negligible.
- **Higher order** (`kde_sobolev_risk_le`, van der Vaart, Thm 24.2 and the remark after it,
  p. 346): for an integer
  `m ≥ 1`, `f ∈ 𝓕_{m,M}` and a kernel `K` of order `m - 1` (not necessarily nonnegative) with
  `∫ |y|^m |K| < ∞` and `∫ K² < ∞`, `h = n^{-1/(2m+1)}` gives
  `sup_{f ∈ 𝓕_{m,M}} E ∫ (f̂_h - f)² ≤ C_{m,M} n^{-2m/(2m+1)}`.

*Needs:* 5.1; Foundations 8.4, 9.3; MathematicalStatisticsAsymptotic 1.2 (Lindeberg–Feller);
Mathlib
`Measure.conv`, `integral_prod`.

**Checks**.

- Gaussian kernel and `f = N(0, 1)`: `R(K) = 1/(2√π) = 0.28209`, `μ₂ = 1`,
  `∫ (f'')² = 3/(8√π) = 0.21157`, so `h* = (4/3)^{1/5} n^{-1/5} = 1.0592 n^{-1/5}`, the normal
  reference bandwidth.
- Epanechnikov `¾(1 - u²)₊`: `μ₂ = 1/5`, `R(K) = 3/5`.
- `isMinOn_amise` with `A = 0.7`, `B = 0.3`, `n = 100`: a numerical minimization gives
  `h = 0.336051`, against `(B/(A n))^{1/5} = 0.336051`, with minimum `0.0111590` both ways.

### 5.3 Multivariate kernel density estimation and `L¹` consistency

- The `d`-dimensional estimator `kdeEuclidean K h x t = (n h^d)⁻¹ ∑ K((t - x i)/h)` on
  `EuclideanSpace ℝ (Fin d)`. For `h > 0`, `n ≥ 1` and integrable `K` it integrates to `∫ K`
  (`integral_kdeEuclidean`), so it is a density for a probability density `K`, as in
  Foundations 9.3.
- **Bias** (`tendsto_integral_abs_conv_sub`, Devroye–Lugosi, Thm 9.1, p. 79): for integrable `K`
  with `∫ K = 1` and every density `f`, `∫ |K_h * f - f| → 0` as `h → 0`, Tau Ceti's
  `tendsto_eLpNorm_normed_convolution_sub` for `p = 1`.
- **Universal consistency in mean** (`tendsto_integral_integral_abs_kde_sub`, Devroye–Lugosi,
  Thm 9.2, p. 81): for such `K`, if `h → 0`
  and `n h^d → ∞`, then `E ∫ |f̂_n - f| → 0` for every density `f`.
- **Almost sure consistency** (`tendsto_ae_integral_abs_kde_sub`, Devroye–Lugosi, §9.4,
  pp. 82–83): under the same conditions `∫ |f̂_n - f| → 0` almost surely, for every density `f`.
  Proof: changing one observation changes `∫ |f̂_n - f|` by at most `2 ∫ |K| / n`, so McDiarmid
  gives `P(∫ |f̂_n - f| - E ∫ |f̂_n - f| ≥ t) ≤ exp (-n t² / (2 (∫ |K|)²))`, summable in `n`;
  Borel–Cantelli.

*Needs:* Tau Ceti `tendsto_eLpNorm_normed_convolution_sub`,
`hasSubgaussianMGF_of_bounded_differences_fin`; Mathlib `measure_limsup_atTop_eq_zero`
(Borel–Cantelli).

**Checks.**

- `kdeEuclidean` at `d = 1` is `kernelDensityEstimator` of Foundations 9.3, since
  `h⁻¹ • (t - x i) = (t - x i)/h`.
- `kdeEuclidean` at `n = 0` is `0` (Lean's `0⁻¹ = 0`), so the theorems concern large `n` only.
- `kdeEuclidean`, negative control: `d = 2`, `K` the indicator of `[-½, ½]²`, `n = 1`, `x = 0`,
  `h = 2`: the estimate is `1/4` on `[-1, 1]²` and `0` outside, with integral `1`; the
  normalization `(n h)⁻¹` in place of `(n h^d)⁻¹` would give integral `2`.
- At `d = 0` the space is one point with `volume` the unit mass, `f = 1`, `K = 1`, and
  `kdeEuclidean K h x = 1` for every `n ≥ 1`, so the consistency statement holds trivially.

### 5.4 Linear smoothers

Regression data are `(x i, Y i)`, `i : Fin n`, with design `x` and responses `Y`.
- **Nadaraya–Watson** (`nadarayaWatson`): weights
  `w i (t) = K((x i - t)/h) / ∑ j, K((x j - t)/h)`, with `0/0 = 0` (Lean's division), and the
  estimator `∑ w i (t) Y i`.
- **Local polynomials** (`localPolynomialCoeff`, `localPolynomialCoeff_spec`). For degree `p`, the
  design matrix `X_t = ((x i - t)^k)_{i, k ≤ p}`, the weights `W_t = diag (K((x i - t)/h))`, the
  coefficient vector `β̂(t) = (X_tᵀ W_t X_t)⁻¹ X_tᵀ W_t Y` (Fan–Gijbels, (3.5), p. 59), with
  Mathlib's inverse, `0` for a singular matrix, and `m̂_ν(t) = ν! β̂_ν(t)`. For `p = 0` it is
  Nadaraya–Watson. When `X_tᵀ W_t X_t` is invertible, `β̂(t)` is the unique stationary point of the
  weighted least-squares criterion `∑ K((x i - t)/h) (Y i - ∑_k β_k (x i - t)^k)²` and the estimator
  reproduces every polynomial of degree at most `p` exactly. If also `K ≥ 0`, the matrix is positive
  definite and `β̂(t)` is the unique minimizer. Without `K ≥ 0` it need not be a minimizer: for
  degree `0` and one observation with weight `-1` the criterion is unbounded below.
- **Leave-one-out identity** (`leaveOneOut_eq`). A linear smoother is a matrix `L` with fitted
  values `L Y`. If `L i i ≠ 1` for every `i`, then for every `i`
  `Y i - ∑_{j ≠ i} L i j Y j / (1 - L i i) = (Y i - (L Y) i) / (1 - L i i)`, and hence
  `∑ (Y i - ∑_{j ≠ i} L i j Y j / (1 - L i i))² = ∑ ((Y i - (L Y) i)/(1 - L i i))²`.
- **Leave-one-out fits** (`nadarayaWatson_leaveOneOut`, `localPolynomialCoeff_leaveOneOut`, and
  `smoothingSpline_leaveOneOut` of 5.8; Green–Silverman, Lemma 3.1, p. 32, for splines; by the same
  argument for the others). For Nadaraya–Watson with a nonnegative kernel, for local polynomials
  with the kernel centered at `x i`, and for the smoothing splines of 5.8,
  `∑_{j ≠ i} L i j Y j / (1 - L i i)` is the fit at `x i` computed without the `i`-th observation,
  provided `L i i ≠ 1` and, for local polynomials, the matrices with and without observation `i` are
  invertible. So the leave-one-out cross-validation score is `n⁻¹ ∑ ((Y i - (L Y) i)/(1 - L i i))²`.
  Proof: the fit without observation `i` is unchanged when the observation `(x i, m̂_{(-i)}(x i))`
  is added, since it has zero residual; read off row `i`. The row `L i` is the fit at `x i` to the
  data `Pi.single j 1`, `j` varying.
- **Equivalent kernel** (`equivalentKernel`, `integral_pow_mul_equivalentKernel`, Fan–Gijbels,
  (3.16) and (3.17), p. 64). For `μ_j = ∫ u^j K` finite for `j ≤ 2p + 2` and
  `S = (μ_{j+l})_{j,l ≤ p}` invertible, `K*_ν(t) = e_νᵀ S⁻¹ (1, t, …, t^p)ᵀ K(t)` satisfies
  `∫ t^q K*_ν = δ_{νq}` for `q ≤ p`. If `K` is symmetric, `p - ν` is even and the moment matrix of
  order `p + 1` is also invertible, `K*_{ν,p} = K*_{ν,p+1}`, so `∫ (K*_{ν,p})² = ∫ (K*_{ν,p+1})²`
  (Fan–Gijbels, p. 59: no increase in variability from `p = ν + 2q` to `p = ν + 2q + 1`). Proof: the
  odd moments of `K` vanish, so `S_p⁻¹` has a checkerboard pattern and `e_νᵀ S_p⁻¹ s = 0` for
  `s = (μ_{p+1+j})_{j ≤ p}`; by the block inverse formula, row `ν` of `S_{p+1}⁻¹` is row `ν` of
  `S_p⁻¹` followed by `0`.

*Needs:* Mathlib `Matrix.inv`, `Matrix.mulVec`.

**Checks.**

- `nadarayaWatson` with `K = 1_{[-1,1]}`, `h = 1`, design `(0, 1, 3)`, responses `(1, 2, 6)`:
  at `t = 0.5` the weights are `(½, ½, 0)` and the fit `1.5`.
- `nadarayaWatson`, negative control: at `t = 10` all weights vanish and the fit is `0` by
  `0/0 = 0`, not undefined and not the mean `3` of the responses.
- `nadarayaWatson` is unchanged when `K` is replaced by `2 K`: the weights are normalized.
- `localPolynomialCoeff` with `p = 0` is `nadarayaWatson`, including the value `0` when all
  weights vanish (the inverse of the zero `1 × 1` matrix is `0`).
- `localPolynomialCoeff` with `p = 1` on the data above at `t = 0.5`: the window holds
  `(0, 1)` and `(1, 2)`, and the coefficients are `(1.5, 1)`, the intercept and slope of the line
  through them.
- `localPolynomialCoeff`, negative control: `p = 1` at `t = 3` with `h = 1`: only `x = 3` has
  positive weight, `X_tᵀ W_t X_t = diag (1, 0)` is singular, and the coefficients are
  `(0, 0)`, while Nadaraya–Watson gives `6`.
- Leave-one-out identity for `L = (1/3) 𝟙𝟙ᵀ` (`n = 3`, the sample mean): `L i i = 1/3`, and
  `∑_{j ≠ i} L i j Y j / (1 - L i i) = ∑_{j ≠ i} Y j / 2` is the mean of the other two
  observations. For `L = I` every `L i i = 1` and the identity is not claimed.
- `equivalentKernel` for `p = 1`, `ν = 0`, symmetric `K`, `s = univ`: `S = diag (1, μ₂)` and
  `K*_{0,1} = K = K*_{0,0}`.
- `equivalentKernel` for the Epanechnikov kernel: `K*_{0,2} = K*_{0,3}` and
  `K*_{1,1} = K*_{1,2}` (`p - ν` even), while `K*_{0,1}(½) = 0.5625` and
  `K*_{0,2}(½) = 0.43945` differ (`p - ν` odd).
- `equivalentKernel`, negative control: at the boundary `s = [0, ∞)` (`c = 0`), `p = 0`, the
  kernel is `2 K 1_{[0, ∞)}` for symmetric `K`, not `K`: the moment matrix is the truncated one;
  for `p = 1` its moments `∫ K*_{0} = 1`, `∫ t K*_{0} = 0` over `[0, ∞)` still hold.
- `nadarayaWatson_leaveOneOut` on the data above at `x 0 = 0` (`i = 0`): the weights are
  `(½, ½, 0)`, the leave-one-out fit at `0` is `2`, and `(½ · 2 + 0 · 6)/(1 - ½) = 2`.
- `nadarayaWatson_leaveOneOut`, negative control: with a signed kernel and weights `K = 1` at
  `x i`, `-1` at one other point and `0` elsewhere, `∑ K = 0`, so `L i i = 0` and the formula
  gives `0`, while the leave-one-out fit is `Y j`: the nonnegativity is needed.

### 5.5 Local polynomial asymptotics

For i.i.d. `(X i, Y i)` with `m(x) = E[Y | X = x]`, `σ²(x) = Var(Y | X = x)`, design density
`f_X`, a bounded symmetric compactly supported probability kernel `K`, `h → 0` and `n h → ∞`.
Conditionally on the design the estimator `m̂_ν = ν! β̂_ν` of 5.4 is linear in the responses, so
its conditional bias is `ν! β̂_ν(m(X)) - m^{(ν)}(x₀)`, the fit to the data `m(X i)`, and its
conditional variance is `ν!² ∑ i, L_i² σ²(X i)`, with `L_i` the coefficient `β̂_ν` of the data
`Pi.single i 1`. `K*_ν` is the equivalent kernel `equivalentKernel univ K p ν` of 5.4.
- **Interior bias and variance** (`tendstoInMeasure_localPolynomial_bias_variance`,
  `localPolynomial_bias_even`, `tendstoInMeasure_nadarayaWatson_bias`; Fan–Gijbels, Thm 3.1,
  p. 62, with (3.18) and (3.19), p. 66): if `f_X(x₀) > 0` and `f_X`, `m^{(p+1)}`, `σ²` are
  continuous near `x₀`, then conditionally on the design
  `Var m̂_ν(x₀) = ν!² ∫ K*_ν² σ²(x₀) / (f_X(x₀) n h^{1+2ν}) + o_P((n h^{1+2ν})⁻¹)`, and for `p - ν`
  odd `Bias m̂_ν(x₀) = ν!/(p + 1)! (∫ t^{p+1} K*_ν) m^{(p+1)}(x₀) h^{p+1-ν} + o_P(h^{p+1-ν})`. For
  `p - ν` even the bias is `O_P(h^{p+2-ν})` when also `f_X'(·)` and `m^{(p+2)}` are continuous
  near `x₀` and `n h³ → ∞`; for Nadaraya–Watson (`p = ν = 0`) its leading term is
  `½ h² μ₂ (m''(x₀) + 2 m'(x₀) f_X'(x₀)/f_X(x₀))`, with `μ₂ = ∫ u² K` (Fan–Gijbels, (3.9),
  p. 62).
- **Boundary** (`tendstoInMeasure_localPolynomial_boundary`, Fan–Gijbels, Thm 3.2, p. 70, and
  (3.22), p. 70): for a design supported on `[0, ∞)` with `f_X(0+) > 0`, `f_X`, `m^{(p+1)}`, `σ²`
  right continuous at `0`, and `x₀ = c h`, `c ≥ 0`, for every `p ≥ ν`, conditionally on the
  design, `n h^{1+2ν} Var m̂_ν(x₀) → ν!² ∫ K*_{ν,c}² σ²(0+)/f_X(0+)` and
  `Bias m̂_ν(x₀) / h^{p+1-ν} → ν!/(p+1)! (∫ t^{p+1} K*_{ν,c}) m^{(p+1)}(0+)`, both in probability,
  with the boundary kernel `K*_{ν,c} = equivalentKernel (Ici (-c)) K p ν` of the truncated
  moments `(∫_{-c}^∞ u^{j+l} K)`. The two limits are stated separately: when the bias coefficient
  vanishes, the mean squared error need not be its leading term times `1 + o_P(1)`.
- **Asymptotic normality** (`tendstoInDistribution_localPolynomialCoeff`, Fan–Gijbels, Thm 5.2,
  p. 196, with the identity link): for `p - ν` odd, if moreover `E[Y⁴ | X = z]` is bounded near
  `x₀` and `σ²(x₀) > 0`, then `(m̂_ν(x₀) - m^{(ν)}(x₀) - b_ν(x₀) + o(h^{p+1-ν})) / sd ⇝ N(0, 1)`,
  with `b_ν` the leading bias and `sd²` the leading variance of the first bullet.
- **Local linear** (`tendstoInDistribution_localLinear`, the case `p = 1`, `ν = 0` of the
  previous bullet, so `K*_0 = K`): with `n h⁵ = O(1)`, the intercept `m̂_h` of
  `localPolynomialCoeff K h 1` satisfies
  `√(n h) (m̂_h(x₀) - m(x₀) - ½ h² μ₂ m''(x₀)) ⇝ N(0, R(K) σ²(x₀)/f_X(x₀))`. Proof: the previous
  bullet, with `√(n h) o(h²) = o(√(n h⁵)) = o(1)`.
- **Nadaraya–Watson** (`tendstoInDistribution_nadarayaWatson`, by the same argument as
  Fan–Gijbels, Thm 5.2, with the bias of (3.9)): if also `f_X'(·)` and `m''` are continuous near
  `x₀` and `n h⁵ = O(1)`, then
  `√(n h) (m̂_h(x₀) - m(x₀) - ½ h² μ₂ (m''(x₀) + 2 m'(x₀) f_X'(x₀)/f_X(x₀)))` converges in law
  to `N(0, R(K) σ²(x₀)/f_X(x₀))`.

*Needs:* 5.4; Foundations 8.1, 8.4; MathematicalStatisticsAsymptotic 1.2 (Lindeberg–Feller).

**Checks.**

- Local linear with the Epanechnikov kernel: `μ₂ = 1/5`, `R(K) = 3/5`, so the limit variance is
  `(3/5) σ²(x₀)/f_X(x₀)` and the bias constant `½ μ₂ = 1/10`.
- Nadaraya–Watson against local linear: for a uniform design (`f_X' = 0`) the two leading biases
  agree; for `f_X(x) = 2x` on `[0, 1]`, `m(x) = x` (so `m'' = 0`), at `x₀ = ½` the
  Nadaraya–Watson bias term is `½ h² μ₂ · 2 · 1 · 2/1 = 2 μ₂ h²`, while the local linear bias term
  vanishes: local linear fits reproduce lines (5.4).
- Boundary negative control: at `c = 0`, `p = 0`, the boundary kernel is `2 K 1_{[0, ∞)}` (5.4),
  whose first moment `2 ∫₀^∞ t K` is nonzero, so Nadaraya–Watson has an `O(h)` bias at the
  boundary, while for `p = 1` the boundary kernel at `c = 0` has first moment `0` (5.4).
- Boundary with a vanishing bias coefficient: `p = ν = 0`, `c = 1`, `K = ½ 1_{[-1, 1]}`,
  `X ~ U[0, 1]`, `Y = X² + N(0, 1)`, `h = n^{-1/6}`. Then `K*_{0,1} = K`, the coefficient
  `∫ t K · m'(0)` is `0`, the bias is `4h²/3 - h² = h²/3` and the variance `1/(2nh)`. Both limits
  of the boundary bullet hold (`h/3 → 0`), while the ratio of `Bias² + Var` to its leading term is
  `1 + (2/9) n h⁵ = 1 + (2/9) n^{1/6} → ∞`.


### 5.6 Stone's consistency theorem

- **Nadaraya–Watson** (`tendsto_lintegral_nadarayaWatson_sub_sq`; Devroye–Györfi–Lugosi, Thm 6.3, p.
  98, states Stone's three weight conditions and proves the
  conclusion for `Y ∈ {0, 1}`): for the estimate `m̂_n` of 5.4 on `ℝ^d`, with `K((x i - t)/h)`
  read as `K(h⁻¹ • (x i - t))`, and every law of `(X, Y)` on
  `EuclideanSpace ℝ (Fin d) × ℝ` with `E Y² < ∞`, a nonnegative bounded compactly supported
  kernel bounded below by a positive constant on a ball around `0`, `h → 0` and `n h^d → ∞`,
  `E ∫ (m̂_n - m)² dμ_X → 0`; hence `E[(m̂_n(X) - m(X))² | data] → 0` in probability. Proof:
  Stone's three conditions on the weights (domination, local concentration, no dominant weight)
  are verified by the covering argument for kernel weights, with the event that no observation
  falls in the window around `X` of probability tending to `0`; they imply `L²` consistency by the
  argument of Devroye–Györfi–Lugosi for bounded `Y` and truncation of `Y`.
- **Nearest neighbours** (`tendsto_lintegral_nearestNeighbour_sub_sq`; Devroye–Györfi–Lugosi,
  Thm 6.4, p. 101, which verifies Stone's conditions for these weights): the `k`-nearest-neighbour
  estimate, with distance ties broken
  by index, is `L²` consistent in the same sense for every law with `E Y² < ∞` when `k → ∞` and
  `k/n → 0`.

*Needs:* 5.4; Mathlib `condExp`; Foundations 8.5.

### 5.7 Cross-validation

- **Unbiased risk estimate** (`integral_lscv_eq`, Tsybakov, Prop 1.9, p. 29): with
  `CV(h) = ∫ f̂_h² - (2/n) ∑ f̂_{h,-i}(X i)`, `f̂_{h,-i}` the estimator from the other observations
  with divisor `(n - 1) h`, if `n ≥ 2`, `h > 0`, `K` is integrable with `∫ K² < ∞`,
  `∫ f² < ∞` and `∬ |K((x - z)/h)| f(z) f(x) dz dx < ∞`, then
  `E CV(h) = E ∫ (f̂_h - f)² - ∫ f²`. Proof: `E f̂_{h,-1}(X 1) = ∫ (K_h * f) f = E ∫ f̂_h f`.
- **Stone's form** (`stoneCriterion_eq`):
  `M₁(h) = ∫ f̂_h² - (2/(n² h)) ∑_{i ≠ j} K((X i - X j)/h)` equals
  `∫ f̂_h² - (2(n - 1)/n²) ∑ f̂_{h,-i}(X i)` for `n ≥ 2` and `h ≠ 0` (an identity).
- Regression cross-validation for linear smoothers is the leave-one-out identity of 5.4.
- The hypothesis `∫ K² < ∞`, which Tsybakov leaves implicit, is needed: it makes `∫ f̂_h²` and
  `∫ (f̂_h - f)²` finite, so the real integrals are the true ones. For `K u = 1/(2√u)` on
  `(0, 1)`, `f = 1_{(0, 1)}`, `h = 1`, `n = 2`, both integrals are infinite and the real-valued
  identity would read `-4/3 = -1`.

*Needs:* 5.2, 5.4.

**Checks.**

- `n = 2`, `X = (0, 1)`, `K = 1_{[-1/2, 1/2]}`, `h = 2`: `f̂_{h,-1}(X 1) = ½ K(-½) = ½` and
  likewise for the other; `∑_{i ≠ j} K((X i - X j)/2) = 2`, so the two forms of `M₁` agree:
  `2/(4 · 2) · 2 = ½ = 2 · 1/4 · (½ + ½)`.
- In the counterexample above, `∫ K = 1`, `E K(X 1 - X 2) = ∫₀¹ (1 - u) K(u) du = 2/3`, so the
  left side is `0 - (2/2)(2/3 + 2/3) = -4/3` with the Bochner junk value `0` for `∫ f̂_h²`, and
  the right side is `0 - 1`.

### 5.8 Reproducing kernels and smoothing splines

- **Representer theorem** (`mem_span_kerFun_of_isMinOn`; Wahba, Thm 1.3.1, p. 11, treats
  squared loss, and the argument is the same for any loss): for Mathlib's `RKHS ℝ H 𝒳 ℝ`,
  points `x : Fin n → 𝒳`, any loss `L : ℝ → ℝ → ℝ`, responses `Y` and `λ > 0`, every minimizer
  of `f ↦ n⁻¹ ∑ L (Y i) (f (x i)) + λ ‖f‖²` lies in the span of the kernel functions
  `RKHS.kerFun H (x i) 1`. Proof: the orthogonal component vanishes at every `x i` by
  `RKHS.inner_kerFun` and strictly increases the norm unless it is zero.
- **Sobolev space of order 2** (`smoothingSplineCriterion`). On `[a, b]`, `W²[a, b]` is
  represented as the functions `g(t) = c₀ + c₁ (t - a) + ∫_a^t (t - s) u(s) ds` with
  `u ∈ L²[a, b]`, so that `g(a) = c₀`, `g'(a) = c₁` and `g'' = u` a.e.; the criterion is
  `S(g) = ∑ (Y i - g(t i))² + α ∫_a^b u²`.
- **Value–second-derivative representation** (`integral_sq_naturalSpline_eq`, Green–Silverman,
  Thm 2.1, p. 13): for knots
  `t₁ < … < tₙ`, `h_j = t_{j+1} - t_j`, the band matrices `Q` (`n × (n - 2)`) and `R`
  (`(n - 2) × (n - 2)`, positive definite), with columns and rows numbered from `2` to `n - 1`,
  are `Q_{j-1,j} = 1/h_{j-1}`, `Q_{jj} = -1/h_{j-1} - 1/h_j`, `Q_{j+1,j} = 1/h_j`,
  `R_{jj} = (h_{j-1} + h_j)/3`, `R_{j,j+1} = R_{j+1,j} = h_j/6`, and the natural cubic spline
  with values `g` at the knots has `∫ g''² = gᵀ Q R⁻¹ Qᵀ g`. In the representation below, a
  natural cubic spline is a `g` whose `u = g''` is continuous on `[a, b]`, affine between
  consecutive knots and `0` outside `[t₁, tₙ]`.
- **Smoothing splines** (`existsUnique_smoothingSpline`, Green–Silverman, Thm 2.4, p. 19): for
  `n ≥ 3` design points `a < t₁ < … < tₙ < b` and `α > 0`, `S` has a minimizer on `W²[a, b]`,
  it is unique (any other minimizer has the same `c₀`, `c₁` and the same `u` a.e.), and its
  values at the knots are `(I + α Q R⁻¹ Qᵀ)⁻¹ Y`. Proof: among `g` with given knot values the
  natural interpolating spline minimizes `∫ g''²` (integration by parts against the
  piecewise-linear `g''`), and the reduced problem is a positive definite quadratic in the knot
  values.
- **The minimizer is the natural cubic spline** (`smoothingSpline_secondDeriv_eq`,
  Green–Silverman, Thm 2.4, p. 19): the second derivative `u` of the minimizer is almost
  everywhere equal on `[a, b]` to a function continuous on `[a, b]`, affine between consecutive
  knots and `0` outside `[t₁, tₙ]`; so the minimizer is cubic on each `[t i, t (i+1)]`, linear on
  `[a, t₁]` and `[tₙ, b]`, and `C²` on `[a, b]`.
- **Cross-validation** (`smoothingSpline_leaveOneOut`, Green–Silverman, Thm 3.1, p. 31): with the
  hat matrix `A(α) = (I + α Q R⁻¹ Qᵀ)⁻¹`, `A i i < 1`, the leave-one-out fit at `t i` is
  `∑_{j ≠ i} A i j Y j / (1 - A i i)`, and so `CV(α) = n⁻¹ ∑ ((Y i - ĝ(t i)) / (1 - A i i (α)))²` by
  5.4. The bound `A i i < 1` holds because the eigenvalues of `A` lie in `(0, 1]`, the eigenvalue
  `1` belongs to the vectors `(c₀ + c₁ t i)_i`, and for `n ≥ 3` no unit vector `e_i` is of that
  form.

*Needs:* 5.4; Mathlib `RKHS`, `RKHS.kerFun`, `RKHS.inner_kerFun`, `intervalIntegral`,
`Matrix.PosDef`.

**Checks.**

- Representer theorem with `H = ℝ` as the RKHS on a one-point set (`f ↦ f(pt)`), squared loss and
  one observation `Y`: the minimizer of `(Y - f)² + λ f²` is `Y / (1 + λ)`, a multiple of the
  kernel function.
- `n = 3`, `t = (0, 1, 2)`: `Q = (1, -2, 1)ᵀ`, `R = (2/3)`, so
  `Q R⁻¹ Qᵀ = (3/2) (1, -2, 1)(1, -2, 1)ᵀ`; for `g = (0, 1, 0)` the natural spline has
  `g''(1) = R⁻¹ Qᵀ g = -3`, `g''` piecewise linear and `0` at the ends, and
  `∫ g''² = 2 ∫₀¹ 9 s² ds = 6 = (3/2) · 4`.
- `smoothingSpline_leaveOneOut` at `t = (0, 1, 2)`, `α = 1`, `Y = (0, 1, 3)`:
  `A = I - (3/20) v vᵀ` with `v = (1, -2, 1)`, so `A 1 1 = 0.4`, `A 1 0 = A 1 2 = 0.3`, and
  `(0.3 · 0 + 0.3 · 3)/(1 - 0.4) = 1.5`, the value at `1` of the line through `(0, 0)` and
  `(2, 3)` that minimizes the criterion without the middle point.
- `smoothingSplineCriterion` with `u = 0` is the residual sum of squares of the line
  `c₀ + c₁ (t - a)`: data on a line give the minimum `0` with `u = 0`.
- `smoothingSplineCriterion` with `u = 1`: `g(t) = c₀ + c₁ (t - a) + (t - a)²/2`, penalty
  `α (b - a)`.
- `smoothingSplineCriterion`, negative control: the penalty integrates over `[a, b]`, not over
  `[t₁, tₙ]`. With the shorter range, `u` on `[tₙ, b]` would affect no fitted value, and `u` on
  `[a, t₁]` only through an affine function that `c₀`, `c₁` absorb, so the minimizer would not
  be unique.

### 5.9 Minimax rates of density estimation and of Hölder regression

- **Pointwise density rate, lower bound** (`kde_minimax_lower`, Tsybakov, Exercise 2.8,
  p. 135): for `β > 0`, `L > 0` and every `x₀` there is `c' = c'(β, L) > 0` with
  `n^{2β/(2β+1)} inf_κ sup_{p ∈ 𝒫(β, L)} E (κ - p(x₀))² ≥ c'` for all large `n`, the risks
  `∫⁻ y, ofReal ((y - p(x₀))²) ∂(κ ∘ₘ p^n)` taken in `ℝ≥0∞` (Conventions). With `kde_risk_le`
  of 5.1 the rate `n^{-2β/(2β+1)}` is exact. Proof: Le Cam's two-point method (2.2) with
  `p₁ = p₀ + L h^β φ((x - x₀)/h)` for a fixed `p₀ ∈ 𝒫(β, L/2)` bounded below near `x₀` and a
  smooth `φ` with `∫ φ = 0`, `h = n^{-1/(2β+1)}`, and `klDiv ≤ chiSqDiv = O(1/n)` per
  observation.
- **Integrated density rate, lower bound** (`kde_minimax_lower_integrated`, Tsybakov,
  Exercise 2.10, p. 135): the same with `E ∫ (κ - p)²` in place of `E (κ - p(x₀))²`, for
  estimators that are Markov kernels with values in `L²(ℝ)` with its Borel σ-algebra, by Assouad
  (2.5) over `m ≍ 1/h` disjoint bumps.
- **Sobolev density rate** (`sobolev_density_minimax_rate`, van der Vaart, Thm 24.4, p. 348):
  for an integer `m ≥ 1` and `M > 0` there is `D_{m,M} > 0` such that for every `n ≥ 1` every
  density estimator, a Markov kernel with values in `L²(ℝ)`, has
  `sup_{f ∈ 𝓕_{m,M}} E ∫ (f̂_n - f)² ≥ D_{m,M} n^{-2m/(2m+1)}`, by Assouad (2.5) with `2^{r_n}`
  perturbations, `r_n ≍ n^{1/(2m+1)}`; the rate is exact: the kernel estimator of 5.2 with a
  kernel of order `m - 1` and `h = n^{-1/(2m+1)}` has maximal risk at most
  `C_{m,M} n^{-2m/(2m+1)}` for every `n ≥ 1` (van der Vaart, p. 346).
- **Hölder regression** (`holder_regression_minimax_rate`, Tsybakov, Thms 1.7 and 1.8, pp. 42
  and 44, upper; Thm 2.8 and Cor 2.3, p. 107, and Thm 2.10 and Cor 2.5, p. 110, lower): for
  `Y i = f(i/n) + ξ i` with `ξ i` i.i.d. `N(0, σ²)`, `σ > 0`, `β > 0`, `L > 0`, let
  `R_n^{(2)} = inf_T sup_f E ‖T - f‖²_{L²[0,1]}` and
  `R_n^{(∞)} = inf_T sup_f E ‖T - f‖²_{∞,[0,1]}`, the suprema over `holderClass β L` and the
  infima over Markov kernels with values in `L²[0, 1]`, respectively `L^∞[0, 1]`, with their Borel
  σ-algebras; `‖·‖_{∞,[0,1]}` is the essential supremum on `[0, 1]` (`eLpNorm` with `p = ∞`),
  which keeps the risk measurable. Then
  `0 < liminf n^{2β/(2β+1)} R_n^{(2)} ≤ limsup n^{2β/(2β+1)} R_n^{(2)} < ∞`, and the same for
  `R_n^{(∞)}` with `n/log n` in place of `n`. The lower bounds are Fano (2.4) with the
  Varshamov–Gilbert family (2.3) for `L²`, and Fano with `M ≍ (n / log n)^{1/(2β+1)}` disjoint
  bumps for the sup norm; the bumps are continuous, so their essential and pointwise sup-norm
  distances agree, and the essential supremum is at most the pointwise one, so Tsybakov's upper
  bound applies.
- **Local polynomial attainment** (`localPolynomial_holder_risk_le`, Tsybakov, Thms 1.7 and
  1.8, pp. 42 and 44). The `L²` upper bound of the previous bullet is attained by the local
  polynomial estimator of degree `ℓ` (the intercept of `localPolynomialCoeff`) with
  `h = c n^{-1/(2β+1)}` and a kernel with `K_min 1_{|u| ≤ Δ} ≤ K ≤ K_max 1_{|u| ≤ 1}`; the
  sup-norm upper bound by the same estimator with `h = c (log n / n)^{1/(2β+1)}` and such a kernel
  that is also Lipschitz. For the design `i/n` these kernel conditions give Tsybakov's
  assumptions (LP1)–(LP3) (Lemma 1.5, p. 38, for (LP1)).
- **Bias and coverage** (`tendsto_coverage_kde`). With `h = c n^{-1/5}`, `c > 0`, the `h²` bias
  of 5.2 is of the order of the standard error, so the pointwise intervals `f̂ ± z_{α/2} sd`,
  with `sd = √(R(K) f(x)/(n h))` the asymptotic standard deviation, have asymptotic coverage
  `P(|Z + b| ≤ z_{α/2}) = Φ(z_{α/2} - b) - Φ(-z_{α/2} - b) < 1 - α`, with
  `b = c^{5/2} μ₂ f''(x) / (2 √(R(K) f(x))) ≠ 0` when `f''(x) ≠ 0`, while `n h⁵ → 0` restores the
  nominal coverage. In general, if `√(n h⁵) → κ`, then `b = κ μ₂ f''(x) / (2 √(R(K) f(x)))`. Proof:
  the central limit theorem of 5.2 and Slutsky (Foundations 8.4).

*Needs:* 2.2–2.5, 5.1, 5.2, 5.4; Foundations 8.4, 9.3.

**Checks.**

- Bias and coverage at the Gaussian kernel, `f = N(0, 1)`, `x = 0`, `κ = 1`, `α = 0.05`:
  `b = -φ(0)/(2 √(φ(0)/(2√π))) = -0.59460` and the coverage is `0.90861 < 0.95`.

### Examples

- Uniform kernel `K = ½ 1_{[-1,1]}`, `h = 1`, sample `(0, 2)`: `f̂(1) = (1/2)(½ + ½) = ½` and
  `f̂(0) = ¼`.

### Dependencies

Layer 2 (lower bounds in 5.9); Foundations 8.4, 8.5, 9.3; MathematicalStatisticsAsymptotic:
Lindeberg–Feller (1.2); Tau Ceti approximate identities and McDiarmid; Mathlib's `RKHS`.

## Layer 6: the Gaussian sequence model

The observation is `Y = θ + ε ξ` on `ℕ → ℝ` with the law `gaussSeqLaw θ ε` of the Conventions,
indexed from `0`; the `j`-th coordinate of the texts is index `j - 1`.

### 6.1 The model, ellipsoids and linear estimators

- `ellipsoid a C = {θ | ∑' j, a j² θ j² ≤ C²}` (the sum in `ℝ≥0∞`), for `a : ℕ → ℝ` nonnegative.
- `gaussSeqRisk κ θ ε = ∫⁻ y, ∑' j, ofReal ((y j - θ j)²) ∂(κ ∘ₘ gaussSeqLaw θ ε)` and
  `gaussSeqMinimax Θ ε = ⨅ κ Markov, ⨆ θ ∈ Θ, gaussSeqRisk κ θ ε`; the linear minimax risk
  `gaussSeqLinearMinimax Θ ε` is the same infimum over the deterministic diagonal estimators
  `y ↦ (c j y j)_j`, `c : ℕ → ℝ`, written with the risk formula of the next bullet.
- **Risk of a diagonal estimator** (`gaussSeqRisk_diagonal`). For every `c : ℕ → ℝ`, the diagonal
  estimator is measurable and `gaussSeqRisk (c ⊙ ·) θ ε = ∑' j, ofReal (c j² ε² + (1 - c j)² θ j²)`,
  by exchanging `∫⁻` and `∑'` for nonnegative measurable functions.
- **Finite-coordinate reduction** (`map_restrict_gaussSeqLaw_eq`). If `θ` and `θ'` agree outside
  a finite set `S`, the law of the coordinates outside `S` is common to both. This is the step
  that reduces Bayes risks of priors supported on such `θ` to the finite-dimensional normal model
  on `S`. Proof: both laws are `Measure.infinitePi` of the same factors on the complement of `S`.

*Needs:* Mathlib `Measure.infinitePi`, `gaussianReal`, `minimaxRisk` for the shape of the
definition.

**Checks.**

- `gaussSeqLaw θ 0` is the point mass at `θ`, since `gaussianReal (θ j) 0` is the point mass.
- `gaussSeqLaw`, negative control: the variance parameter is `ε²`, so `ε = 2` gives coordinate
  variance `4` (a convention passing `ε` as the variance gives `2`), and `gaussSeqLaw θ ε`
  equals `gaussSeqLaw θ (-ε)`.
- `gaussSeqLaw θ ε` is defined for every `θ`, also `θ = 1` (not in `ℓ²`); then `Y ∉ ℓ²`
  almost surely.
- `ellipsoid 1 C` is the closed `ℓ²` ball of radius `|C|`, and `ellipsoid 0 C` is everything.
- `ellipsoid`, negative control: `θ = 1` with `a = 1` has `∑' j, ofReal 1 = ∞`, so it is not in
  `ellipsoid 1 C`; with a real-valued `tsum` the junk value `0` would put it in.
- `ellipsoid a C = ellipsoid a (-C)`: only `C²` enters.
- `gaussSeqRisk` of the identity estimator (`c = 1`) is `∑' j, ofReal ε² = ∞` for `ε ≠ 0`; a
  Bochner-integral risk would give the junk value `0` here (negative control).
- `gaussSeqRisk` of the zero estimator is `∑' j, ofReal (θ j²)`, which is `∞` for `θ ∉ ℓ²`.
- `gaussSeqRisk` of `c = 1_{j < k}` is `k ε² + ∑_{j ≥ k} θ j²`.
- `gaussSeqMinimax {θ₀} ε = 0` (the constant estimator `θ₀`), and `gaussSeqMinimax ∅ ε = 0`
  (`⨆` over the empty set in `ℝ≥0∞`).
- `gaussSeqMinimax`, negative control: for `Θ = {θ | ∀ j ≥ 1, θ j = 0}` it is `ε²`, attained by
  `y ↦ (y 0, 0, 0, …)`, with the lower bound from the priors `N(0, τ²)` on coordinate `0` as
  `τ → ∞`; the estimator `Y` itself has risk `∞`.
- `gaussSeqLinearMinimax {0} ε = 0` (`c = 0`), and for
  `Θ = {θ | |θ 0| ≤ C, ∀ j ≥ 1, θ j = 0}` it is `ε² C² / (ε² + C²)`, attained by
  `c 0 = C² / (C² + ε²)` and `c j = 0` for `j ≥ 1`.
- `gaussSeqLinearMinimax`, negative control (the hypothesis `a → ∞` of 6.3): for `a = 1` it is
  `C²`, since a finite risk forces `∑ c j² < ∞`, hence `c j → 0` and `sup_j (1 - c j)² ≥ 1`;
  the equation `ε² ∑ a_j (μ - a_j)₊ = C²` of 6.3 has no solution.

### 6.2 Periodic Sobolev classes as ellipsoids

- **Sobolev ellipsoids** (Tsybakov, Prop 1.14, p. 50): for an integer `β ≥ 1`, `L > 0` and the
  trigonometric basis `φ₁ = 1`, `φ_{2k} = √2 cos (2πkx)`, `φ_{2k+1} = √2 sin (2πkx)` of
  `L²[0, 1]` (Tsybakov, Example 1.3, p. 48), `f = ∑ θ_j φ_j` belongs to `W^per(β, L)` iff
  `∑ a_j² θ_j² ≤ L² / π^{2β}` with `a_j = j^β` for even `j` and `(j - 1)^β` for odd `j`.
  Proof: the Fourier coefficients of `f^{(β)}` are `(2πk)^β` times those of `f`, up to the
  rotation within each pair `(φ_{2k}, φ_{2k+1})`, and Parseval.
- With `ε = σ n^{-1/2}`, the sequence model is the coordinate form of the white-noise model; this
  roadmap states every result in the sequence model.

*Needs:* 5.1; Mathlib `HilbertBasis` of `L²` from the Fourier basis on `AddCircle`.

### 6.3 Pinsker's theorem

For `a` nonnegative, nondecreasing and tending to `∞`, `C > 0`, `ε > 0`, `Θ = ellipsoid a C`:
- **Linear minimax risk** (`gaussSeqLinearMinimax_eq`, Johnstone, Thm 5.1, p. 142, with its
  proviso for `a_j = 0`; Tsybakov, Lemma 3.2, p. 143):
  `gaussSeqLinearMinimax Θ ε = ε² ∑ (1 - a_j/μ)₊`, where `μ > 0` solves
  `ε² ∑ a_j (μ - a_j)₊ = C²`, attained by `c_j = (1 - a_j/μ)₊`. The sums are finite since
  `a_j → ∞`. Proof: the risk of `c` is convex in `c` and linear in `(θ_j²)`; a saddle point is
  `θ_j² = ε² (μ/a_j - 1)₊`.
- **Asymptotic minimaxity** (`tendsto_gaussSeqMinimax_div_linear`, Johnstone, Thm 5.3, p. 148):
  if moreover every `a_j > 0`, then
  `gaussSeqMinimax Θ ε / gaussSeqLinearMinimax Θ ε → 1` as `ε → 0`. Proof: the Bayes risk of
  the independent priors `N(0, τ_j²)`, `τ_j² = (1 - δ) ε² (μ/a_j - 1)₊`, on the finitely many
  coordinates with `a_j < μ`, conditioned on `Θ`, bounds the minimax risk below (Mathlib
  `iSup_bayesRisk_le_minimaxRisk`); the prior puts mass `1 - o(1)` on `Θ` by Chebyshev, and the
  Bayes risk of the unconditioned prior is `∑ τ_j² ε² / (τ_j² + ε²)`.
- **Sobolev rate and constant** (`tendsto_gaussSeqMinimax_sobolev`, Johnstone, (5.15), p. 145,
  for the linear risk, with the previous bullet): for `a_j = j^β` (one-based), `β > 0`,
  `gaussSeqMinimax Θ ε ~ P_β C^{2/(2β+1)} ε^{4β/(2β+1)}` with
  `P_β = (2β + 1)^{1/(2β+1)} (β/(β + 1))^{2β/(2β+1)}`, Johnstone's Pinsker constant `P_r` with
  `r = 2β/(2β+1)`. Tsybakov, Thm 3.1, p. 138, has the same constant for the weights of 6.2 with
  `C² = L²/π^{2β}`.
- **Two-sided rate** (`gaussSeqMinimax_two_sided`). For `β > 0` and `c > 0`, if only
  `c j^β ≤ a_j ≤ C' j^β` for `j ≥ 2`, with `a_1 ≥ 0` arbitrary and `a` not assumed monotone (the
  Sobolev ellipsoids of 6.2), then `gaussSeqMinimax Θ ε` lies between positive multiples,
  depending only on `β`, `c`, `C'`, of `C^{2/(2β+1)} ε^{4β/(2β+1)}` for all `ε ≤ ε₀`, with
  `ε₀` depending also on `C` (with `ε = n^{-1/2}`, `ε^{4β/(2β+1)} = n^{-2β/(2β+1)}`). Proof:
  monotonicity of the minimax risk under inclusion of ellipsoids; an unconstrained coordinate
  adds at most `ε²`, which is `o(C^{2/(2β+1)} ε^{4β/(2β+1)})` as `ε/C → 0`.

*Needs:* 6.1; Mathlib `iSup_bayesRisk_le_minimaxRisk`, `bayesRisk`; the posterior mean of the
normal-location model (Foundations 9.4).

**Checks**.

- For `a_j = j`, `C = 1`: `ε^{-4/3} · ε² ∑ (1 - j/μ)₊ = 0.9036` at `ε = 10⁻³` and `0.9083` at
  `ε = 10⁻⁵`, tending to `P_1 = 3^{1/3} (1/2)^{2/3} = 0.90856`. For `β = 2`: `0.9660`, `0.9925`,
  tending to `P_2 = 0.99752`.

### 6.4 Soft thresholding

- **Soft thresholding** `softThreshold λ y = sign y · (|y| - λ)₊` and its one-coordinate risk
  `softThresholdRisk λ θ = E (softThreshold λ (θ + Z) - θ)²`, `Z ~ N(0, 1)`. This roadmap owns
  both; MathematicalStatisticsHighDimensional consumes them.
- **Risk at zero** (`softThresholdRisk_zero_le`, Johnstone, (8.7), p. 220): for `λ ≥ 0`,
  `softThresholdRisk λ 0 ≤ e^{-λ²/2}`. Proof: `softThresholdRisk λ 0 = 2 ∫_0^∞ u² φ(λ + u) du`,
  `φ(λ + u) = φ(u) e^{-λu - λ²/2} ≤ φ(u) e^{-λ²/2}` for `u ≥ 0`, and `2 ∫_0^∞ u² φ(u) du = 1`.
- **Risk bound** (`softThresholdRisk_le`, Johnstone, Lemma 8.3, p. 220, and (8.12), p. 221): for
  `λ ≥ 0` and every `θ`, `softThresholdRisk λ θ ≤ min (softThresholdRisk λ 0 + θ²) (1 + λ²)` and
  `softThresholdRisk λ θ ≤ softThresholdRisk λ 0 + min (θ², 1 + λ²)`. Johnstone states the
  lemma for `λ > 0`; at `λ = 0` the risk is `1` and both bounds hold. Proof: the risk is
  increasing in `|θ|` with `∂/∂θ r(λ, θ) = 2θ Φ([-λ - θ, λ - θ]) ≤ 2θ` for `θ ≥ 0` (Johnstone,
  (8.5)), and tends to `1 + λ²` as `θ → ∞` (Johnstone, (8.6)).
- **Oracle inequality** (`soft_threshold_oracle`, Johnstone, Prop 8.8, p. 227): in the finite
  model `Y = θ + σ ξ` on `Fin n → ℝ`, `n ≥ 1`, `σ > 0`, soft thresholding
  `η_λ(y) = sign y (|y| - λ)₊` at `λ = σ √(2 log n)` satisfies
  `E ‖η_λ(Y) - θ‖² ≤ (2 log n + 1) (σ² + ∑ min (θ i²) σ²)`. Proof (for `σ = 1`, by scaling): the
  two bullets above give `n r(λ, 0) ≤ 1` and `min (θ², 1 + λ²) ≤ (1 + λ²) min (θ², 1)`.

*Needs:* 6.1 (finite form); Mathlib `gaussianReal`, `integral_gaussian`.

**Checks.**

- `softThreshold 1 3 = 2`, `softThreshold 1 ½ = 0`, and `softThreshold 0` is the identity.
- `softThreshold`, negative control: `softThreshold 1 (-3) = -2`; dropping the sign gives `2`,
  and hard thresholding gives `-3`.
- `softThresholdRisk 0 θ = 1` for every `θ`.
- `softThresholdRisk λ 0 = 2 ((1 + λ²) Φ̄(λ) - λ φ(λ))`; at `λ = 1` this is `0.15068`, below
  `e^{-1/2} = 0.60653`; and `softThresholdRisk 1 10 = 2.0000`, the limit `1 + λ²` of (8.6).
- `softThresholdRisk`, negative control: hard thresholding at `λ = 1` has risk
  `2 (φ(1) + Φ̄(1)) = 0.80125` at `θ = 0`, above `e^{-1/2}`, so `softThresholdRisk_zero_le` fails
  for it.
- `r(λ, 0) ≤ e^{-λ²/2}` and `r(λ, θ) ≤ r(λ, 0) + min (θ², 1 + λ²)` hold on the grid
  `λ ∈ {0, ½, 1, 2, 3}`, `θ ∈ {-6, -5.9, …, 6}`; for `n = 100` and one coordinate `θ = 3σ` the
  risk is `7.22 σ²`, below the bound `20.42 σ²`.

### 6.5 The chi-bar-squared law

Let `K = polyhedralCone A = {x | ∀ k, ⟪A k, x⟫ ≤ 0}` be a polyhedral cone in
`EuclideanSpace ℝ (Fin p)` given by finitely many `A k`, `P_K = metricProj K` the metric
projection onto `K` (the nearest point, which exists and is unique since `K` is closed, convex and
nonempty; `metricProj` is `0` where no nearest point exists), and for `y ∈ K` let
`faceDim A y` be the dimension of the span of the smallest face of `K` containing `y`, namely
`{x ∈ K | ∀ k, ⟪A k, y⟫ = 0 → ⟪A k, x⟫ = 0}`.
- **Likelihood ratio** (`iSup_sub_norm_sq_eq_norm_sq_metricProj`). For `Y ~ N(μ, I)`, twice the
  log likelihood ratio for `μ = 0` against `μ ∈ K` is `sup_{v ∈ K} (‖Y‖² - ‖Y - v‖²)`, and for
  every `y`, `sup_{v ∈ K} (‖y‖² - ‖y - v‖²) = ‖y‖² - ‖y - P_K y‖² = ‖P_K y‖²`. Proof: the
  supremum is attained at the nearest point `P_K y`, and `⟪y - P_K y, P_K y⟫ = 0`
  (Mathlib `norm_eq_iInf_iff_real_inner_le_zero` applied at `0` and `2 P_K y`).
- **Chi-bar-squared** (`map_norm_sq_metricProj_stdGaussian`, Robertson–Wright–Dykstra, §2.7,
  (2.7.5) and (2.7.6), p. 111, by the proof of Thm 2.3.1,
  p. 69): under `μ = 0` the law of `‖P_K Y‖²` is `∑_{j=0}^p w_j χ²_j` with
  `w_j = P(faceDim A (P_K Y) = j)` and `χ²_0 = δ₀` (Tau Ceti's `chiSquaredMeasure 0`). Proof: for
  each face `F` with span `L`, on the event `{P_K Y ∈ relint F}` one has `P_K Y = P_L Y`, and the
  event is determined by the direction of `P_L Y` and by `P_{L^⊥} Y`; Tau Ceti's Gaussian
  projection laws make `‖P_L Y‖²` a `χ²_{dim L}` independent of both.

*Needs:* Mathlib `exists_norm_eq_iInf_of_complete_convex`, `norm_eq_iInf_iff_real_inner_le_zero`,
`stdGaussian`; Tau Ceti `HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian`,
`HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian`, `chiSquaredMeasure`.

**Checks.**

- `polyhedralCone` with no constraints (`m = 0`) is the whole space; with `A = (-e₁, -e₂)` it
  is the orthant `ℝ²₊`; with `A = (a, -a)` it is the hyperplane `a^⊥`.
- `polyhedralCone`, negative control: in `p = 1`, `A = (e₁)` gives `(-∞, 0]`, not `[0, ∞)`; the
  orthant needs the constraints `-e_k`.
- `metricProj` onto the orthant `ℝ²₊` is `y ↦ (y₁⁺, y₂⁺)`, and onto `ℝ^p` (`m = 0`) the identity.
- `metricProj ∅ x = 0`, the junk value.
- `metricProj`, negative control: for `s = (0, 1) ⊆ ℝ` and `x = 2`, `infDist x s = 1` but no
  point of `s` is at distance `1`, so `metricProj s 2 = 0`, not `1`; the chi-bar-squared theorem
  uses `metricProj` only on closed cones.
- `faceDim` for the orthant `ℝ²₊`: `faceDim A (1, 1) = 2`, `faceDim A (1, 0) = 1` (the second
  constraint is active and the face is `{x ∈ K | x₂ = 0}`), `faceDim A 0 = 0`; for `m = 0`,
  `faceDim A y = p`.
- `faceDim`, negative control: for the hyperplane `K = a^⊥` with `A = (a, -a)`, both constraints
  are active at every `y ∈ K`, the face is `K` itself and `faceDim A y = p - 1`, while counting
  active constraints would give `p - 2`.
- The orthant `ℝ²₊`: `P_K Y = (Y₁⁺, Y₂⁺)`, so `w = (1/4, 1/2, 1/4)`, and
  `P(χ̄² > 2.706) = ½ P(χ²₁ > 2.706) + ¼ P(χ²₂ > 2.706) = 0.1146`.
- `K` a subspace (`A` closed under negation): `w_{dim K} = 1` and the law is `χ²_{dim K}`.

### 6.6 The detection boundary

Let `Θ = ellipsoid a R` with `a_j = j^β` (one-based), `β > 0`, `R > 0`, and `ε = n^{-1/2}`. For
`ρ > 0` let `γ_n(ρ) = detectionError Θ ε ρ`, where, with `E_θ` the expectation under
`gaussSeqLaw θ ε`, `detectionError Θ ε ρ = ⨅ φ test, (E_0 φ + ⨆_{θ ∈ Θ, ‖θ‖₂ ≥ ρ} E_θ (1 - φ))`,
and let `r_n = n^{-2β/(4β+1)}`.
- **Detection boundary** (`detection_boundary`, Ingster–Suslina, §1.4.3, (1.47)–(1.49), p. 25,
  stated there at a fixed level `α`): if `ρ_n / r_n → 0` then `γ_n(ρ_n) → 1`, and if
  `ρ_n / r_n → ∞` then `γ_n(ρ_n) → 0`. Since `2β/(4β + 1) > β/(2β + 1)`, `r_n` is of smaller
  order than the estimation rate `n^{-β/(2β+1)}` of 6.3 (Ingster–Suslina, (1.50), p. 26). Proof
  of the lower bound: the uniform prior on `θ = ρ m^{-1/2} (±1, …, ±1, 0, …)` over the first
  `m ≍ (R/ρ)^{1/β}` coordinates lies in the alternative; by the mixture identity of 1.2,
  `1 + χ² = ∏_{j ≤ m} cosh (ρ² n / m) ≤ exp (n² ρ⁴ / (2m))`, and `γ ≥ 1 - √χ² / 2`. Upper bound:
  the test rejecting when `∑_{j ≤ m} (Y_j² - ε²) > c_n ε² √(2m)`, with `m ≍ (R/ρ)^{1/β}` and
  `c_n → ∞` slowly, by Chebyshev under both hypotheses. When `ρ_n > R` the alternative is
  empty and `γ_n(ρ_n) = 0`.

*Needs:* 1.2, 1.4, 6.1; Foundations 1.3 (tests).

**Checks.**

- `cosh t ≤ e^{t²/2}` (compare series termwise: `(2k)! ≥ 2^k k!`), so
  `∏_{j ≤ m} cosh (ρ² n/m) ≤ exp (m (ρ² n/m)²/2) = exp (n² ρ⁴/(2m))`; with `m = ρ^{-1/β}` this is
  `exp (n² ρ^{4 + 1/β} / 2)`, which tends to `1` iff `ρ ≪ n^{-2β/(4β+1)}`.
- `detectionError Θ ε 0 = 1` when `0 ∈ Θ`: the alternative contains `θ = 0`, so every test has
  error sum at least `1`, and `φ = 0` attains `1`.
- `detectionError Θ ε ρ = 0` when no `θ ∈ Θ` has `‖θ‖₂ ≥ ρ`: `φ = 0` and the `⨆` over the empty
  set is `0`, matching the absence of a type II error.
- `detectionError`, negative control: for the single alternative `Θ = {ρ e₀}`, the value is
  `1 - tvDist / 2` between `N(0, ε²)` and `N(ρ, ε²)`, that is `2 Φ(-ρ/(2ε))`; at `ρ = 2ε` it is
  `2 Φ(-1) = 0.3173`, not the averaged error `0.1587`.

### Examples

- `n = 100`, `β = 1`: `r_n = 100^{-2/5} = 0.158`, against the estimation rate
  `100^{-1/3} = 0.215`.

### Dependencies

Layers 1, 2 and 5.1; Foundations 1.3, 9.4; Mathlib's decision theory and Gaussian laws; Tau Ceti's
Gaussian projection laws and chi-squared laws.

## Layer 7: shape constraints

### 7.1 Isotonic least squares

For `y : Fin n → ℝ` and weights `w : Fin n → ℝ` with `w i > 0`:
- `isotonicRegression w y i = max_{a ≤ i} min_{b ≥ i} (∑_{j=a}^b w j y j) / (∑_{j=a}^b w j)`.
- **Characterization** (`isMinOn_isotonicRegression`, Robertson–Wright–Dykstra, Thm 1.4.4 and
  (1.4.3), pp. 23–24): `isotonicRegression w y` is monotone, it is the unique minimizer of
  `θ ↦ ∑ w i (y i - θ i)²` over the monotone `θ`, and it equals the min–max formula
  `min_{b ≥ i} max_{a ≤ i}` of the same averages. Proof: existence and uniqueness are the
  projection onto a closed convex cone in the weighted Euclidean space
  (`exists_norm_eq_iInf_of_complete_convex`); the variational inequality
  `norm_eq_iInf_iff_real_inner_le_zero` identifies the projection with the max–min formula on
  each block of constancy, and the same argument with the roles of lower and upper windows
  exchanged gives the min–max formula.
- **Convex minorant** (`isotonicRegression_eq_slope_convexMinorant`, Robertson–Wright–Dykstra,
  Thm 1.2.1, pp. 7–8; Groeneboom–Jongbloed, Lemma 2.1 and the remark after it, pp. 19–20):
  `isotonicRegression w y i` is the left slope at `W_i = ∑_{j ≤ i} w j` of the greatest convex
  minorant of the cumulative-sum diagram through `(0, 0)` and the points
  `(W_i, ∑_{j ≤ i} w j y j)`. In Lean the minorant is the supremum of the affine functions lying
  below the `n + 1` points; at `t ∈ [0, W_{n-1}]` the family is nonempty and bounded above, and
  the left slope at `W_i > 0` reads only such `t`.
- **Properties** (`isotonicRegression_properties`). `∑ w i isotonicRegression w y i = ∑ w i y i`;
  the map is monotone in `y` and commutes with adding constants and with positive scaling. Proof:
  the constant vectors `1` and `-1` are monotone, so the variational inequality of the projection
  gives `∑ w i (y i - isotonicRegression w y i) = 0`; the other three properties are read off the
  max–min formula, whose averages are monotone in `y` and equivariant under `y ↦ c y + d`, `c > 0`.

*Needs:* Mathlib `exists_norm_eq_iInf_of_complete_convex`, `norm_eq_iInf_iff_real_inner_le_zero`,
`Monotone`.

**Checks.**

- Unit weights, `y = (3, 1, 2)`: at `i = 0` the averages from `a = 0` are `3, 2, 2`, with minimum
  `2`, and the fit is `(2, 2, 2)` (pool-adjacent-violators gives the same fit).
- Unit weights, `y = (1, 3, 2)`: the fit is `(1, 2.5, 2.5)`.
- A monotone `y` is its own fit.
- Weights (negative control): for the weights `(1, 2)` and `y = (2, 1)` of the Examples the fit
  pools to `4/3`; ignoring the weights would pool to `3/2`.
- Negative control: for `y = (3, 1, 2)` the running maximum `(3, 3, 3)` is monotone and lies
  above `y`, but its loss is `5`, against `2` for the fit `(2, 2, 2)`.

### 7.2 The risk of isotonic regression

- **Risk bound** (`isotonic_risk_le`, Samworth–Shah, Thm 9.39(a), pp. 299–300): there is a
  universal `C` such that for `n ≥ 1`, `Y i = θ* i + ε i` with `θ*` nondecreasing and independent
  errors of mean `0` and variance `1`, the unit-weight isotonic fit satisfies
  `n⁻¹ E ‖θ̂ - θ*‖² ≤ C (((θ*_{n} - θ*_{1}) / n)^{2/3} + log (e n) / n)`. In particular the worst
  case over nondecreasing `θ*` with `‖θ*‖_∞ ≤ 1` is at most `C' n^{-2/3}`, and for constant `θ*`
  the bound is `C log (e n)/n`. Proof: the max–min formula of 7.1 reduces the risk at `i` to
  averages of the errors over windows, controlled by Kolmogorov's maximal inequality, with the
  window chosen by the local variation of `θ*`. The fit lies between `min Y` and `max Y`, so the
  integrand is integrable and the Bochner integral is the true risk.
- **Lower bound** (`isotonic_minimax_lower`, Samworth–Shah, Example 8.9, pp. 231–232): for
  standard normal errors, every estimator has worst-case risk at least `c n^{-2/3}` over the
  nondecreasing `θ` with `‖θ‖_∞ ≤ 1`, `c` universal. Proof: the metric form of Assouad's lemma
  (2.5), which covers Markov kernels, over `m = ⌊n/k⌋ ≍ n^{1/3}` blocks of length
  `k ≍ n^{2/3}`, each carrying either the ramp `i/n` or its flattening to the block's first
  value, a perturbation of height `≍ n^{-1/3}`; the source works in the smaller class
  `[0, 1]ⁿ`, which only lowers the supremum.

*Needs:* 2.5, 7.1; Mathlib `MeasureTheory.Submartingale` maximal inequalities.

### 7.3 The Grenander estimator

For `x : Fin n → ℝ` with positive entries, `F̂_n` the empirical distribution function:
- `leastConcaveMajorant F t = ⨅_{(a, b) : ∀ s ≥ 0, F s ≤ a + b s} (a + b t)` for `t ≥ 0`, when
  `F` has an affine majorant on `[0, ∞)` (as `F̂_n ≤ 1` does); the family is then nonempty and
  bounded below by `F t`. The value is `0` by convention for `t < 0` and when there is no affine
  majorant. `grenander x t` is its left derivative at `t > 0`, its right derivative at `0`, and
  `0` for `t < 0`, so only values of the majorant on `[0, ∞)` enter.
- **Maximum likelihood** (`grenander_isMaxLikelihood`, van der Vaart, Lemma 24.5, pp. 350–351;
  Groeneboom–Jongbloed, Lemma 2.2, pp. 23–24): `grenander x` is a nonincreasing probability
  density on `[0, ∞)`, constant on each interval `(x₍ᵢ₋₁₎, x₍ᵢ₎]` (with `x₍₀₎ = 0`), and it
  maximizes the likelihood `∏ f (x i)` among nonincreasing densities on `[0, ∞)`, uniquely on
  `(0, x₍ₙ₎]` (the value at `0` of a nonincreasing density does not enter the likelihood). The
  constancy is stated as: `grenander x s = grenander x t` whenever `0 < s ≤ t` and no `x i` lies
  in `[s, t)`. Proof of the uniqueness: the sources give uniqueness among densities constant on
  the intervals `(x₍ᵢ₋₁₎, x₍ᵢ₎]`; a maximizer `f` agrees with `grenander x` at the data points,
  is at least `f (x₍ᵢ₎)` on `(x₍ᵢ₋₁₎, x₍ᵢ₎]` by monotonicity, and has integral `1`, so it equals
  the constant there except on a null set, and monotonicity turns this into equality at every
  point of `(0, x₍ₙ₎]`.
- **Log form** (`grenander_isMaxLogLikelihood`). `grenander x` is positive at every `x i`, so the
  maximum of the likelihood is positive and `grenander x` equivalently maximizes `∑ log f (x i)`
  among the nonincreasing densities positive at every `x i` (Conventions). With Lean's `log 0 = 0`
  the sum of logarithms over all densities would be a different problem: for the sample `(1, 3)` a
  density vanishing on `[1, ∞)` would score `0 > log (1/2) + log (1/4)`.
- **Switching relation** (`grenander_le_iff`): for `t > 0` and `a > 0`,
  `grenander x t ≤ a ↔ ŝ(a) < t`, where `ŝ(a)` is the smallest maximizer of
  `s ↦ F̂_n(s) - a s` over `s ≥ 0` (attained at `0` or at a data point). This is the relation used
  in the proofs of van der Vaart, Thm 24.7, p. 353, and Groeneboom–Jongbloed, Thm 3.5, p. 64,
  which state it with the largest maximizer and `≤`; that form holds only almost surely for fixed
  `t` and `a`, and the form here holds for every sample. Proof: the majorant is piecewise affine
  with vertices at `0` and at data points, where it touches `F̂_n`, and its left slope is constant
  on each `(x₍ᵢ₋₁₎, x₍ᵢ₎]`; the maximizers of `F̂_n(s) - a s` are the vertices at which a line of
  slope `a` supports the majorant, the smallest of them is the leftmost vertex whose right slope
  is at most `a`, and the left slope at `t` is at most `a` exactly when `t` lies strictly to the
  right of that vertex.

*Needs:* Foundations 9.1; Mathlib `ConcaveOn`, `derivWithin`.

**Checks.**

- Majorant for the sample `(1, 3)`: it is `t/2` on `[0, 1]`, `(1 + t)/4` on `[1, 3]` and `1` on
  `[3, ∞)`; at `t = 2` it is `3/4`, above `F̂(2) = 1/2`.
- Majorant at negative arguments (negative control): for the sample `(1, 3)`, `(a, b) = (1, b)`
  is an affine majorant of `F̂` on `[0, ∞)` for every `b ≥ 0`, with value `1 - b` at `t = -1`.
  The family is unbounded below there and the real infimum would be Lean's junk `0`; the
  convention makes `0` the stated value for `t < 0`, and `grenander` never reads it.
- Majorant without an affine majorant: for `F s = s²` the value is `0` at every `t`, by
  convention.
- Grenander for the sample `(1, 3)`: `½` on `(0, 1]`, `¼` on `(1, 3]` and `0` beyond; it
  integrates to `½ + ½ = 1`.
- Grenander at `0` (negative control): the right derivative gives `½`. A left derivative at `0`
  would read the convention value `0` of the majorant on `t < 0` and give `0`, below the value
  `½` at `t = ½`, so the estimate would not be nonincreasing on `[0, ∞)`.
- Likelihood for the sample `(1, 3)`: `½ · ¼ = 1/8`, against `1/9` for the uniform density on
  `[0, 3]`.
- Switching for the sample `(1, 3)`: `F̂ - a s` takes the values `0, ½ - a, 1 - 3a` at `0, 1, 3`;
  at `a = ¼` the maximizers are `1` and `3`, `ŝ = 1`, and `grenander t ≤ ¼ ↔ 1 < t`; at
  `a = 0.1`, `ŝ = 3` and `grenander t ≤ 0.1 ↔ 3 < t`.
- Switching with the largest maximizer (negative control): at `a = ¼` it is `3`, and
  `grenander 2 = ¼ ≤ ¼` while `3 < 2` fails. The relation with the smallest maximizer was
  checked by exhaustive search over samples with ties.

### 7.4 Chernoff's distribution and the cube-root limit

- **Two-sided Brownian motion** from two processes `B₁`, `B₂` with `IsBrownianReal` that are
  independent: `W t = B₁ t` for `t ≥ 0` and `B₂ (-t)` for `t < 0`. The **Chernoff variable** is
  `chernoffArgmax W = sSup {t | ∀ s, W s - s² ≤ W t - t²}`, the largest maximizer. On the null
  set of paths where the set of maximizers is empty or unbounded above the real supremum is
  Lean's junk `0`; laws and limits in distribution do not see it.
- **Existence and uniqueness** (`ae_existsUnique_argmax_chernoff`): almost surely
  `t ↦ W t - t²` has exactly one maximizer, so `chernoffArgmax W` is that maximizer. Proof:
  `W t / t → 0` a.s. (StochasticCalculus §1.4) and continuity give a maximum; uniqueness is Kim and
  Pollard's Lemma 2.6 for Gaussian processes with `Var (W s - W t) ≠ 0` for `s ≠ t` (Kim–Pollard
  1990, quoted in Groeneboom–Jongbloed, p. 62, and van der Vaart, p. 354), proved through the
  a.s. uniqueness of the maximum of a continuous Gaussian process on each pair of disjoint
  rational intervals.
- **Symmetry** (`map_chernoffArgmax`). `chernoffArgmax W` is almost everywhere measurable,
  `chernoffArgmax W` and `-chernoffArgmax W` have the same law, and its law does not depend on
  the choice of `B₁`, `B₂` (Groeneboom–Jongbloed, Exercise 3.12(a), p. 82; Thm 3.9, p. 76, gives
  the density). Proof: `t ↦ W (-t)` is the two-sided motion built from
  `B₂`, `B₁`, whose maximizer is `-chernoffArgmax W` almost surely; the law of the continuous path
  `W` is determined by its Gaussian finite-dimensional marginals, and on the full-measure set of
  paths with a unique maximizer the maximizer is a measurable function of the restriction of the
  path to the rationals.
- **Cube-root limit** (`tendstoInDistribution_grenander`, van der Vaart, Thm 24.7, p. 353;
  Groeneboom–Jongbloed, Thm 3.5, p. 64): for a nonincreasing density `f` on `[0, ∞)`
  differentiable at `x₀ > 0` with `f'(x₀) < 0` (so `f(x₀) > 0`),
  `n^{1/3} (grenander X x₀ - f(x₀)) ⇝ |4 f'(x₀) f(x₀)|^{1/3} · chernoffArgmax W`. Proof, by
  Groeneboom–Jongbloed's argument, pp. 64–67, in the conventions of this roadmap: fix `u ∈ ℝ`,
  put `a = f(x₀)` and `aₙ = a + n^{-1/3} u`. By the switching relation,
  `{n^{1/3}(grenander X x₀ - a) ≤ u} = {ŝₙ(aₙ) < x₀}` for large `n`, and
  `ĥₙ = n^{1/3}(ŝₙ(aₙ) - x₀)` is the smallest maximizer over `h ≥ -n^{1/3} x₀` of
  `Mₙ(h) = Zₙ(h) + n^{2/3}(F(x₀ + n^{-1/3} h) - F(x₀) - a n^{-1/3} h) - u h`, with `Zₙ` the local
  empirical process below; extend `Mₙ` to the left of `-n^{1/3} x₀` by a value below its
  maximum. The hypotheses of the argmax theorem of MathematicalStatisticsAsymptotic (4.3) are met
  as follows.
  - Convergence on compacts: `Mₙ → M`, `M(h) = √f(x₀) W(h) + ½ f'(x₀) h² - u h`, weakly in
    `ℓ^∞([-K, K])` for every `K`, by the local empirical-process limit below and the deterministic
    expansion `F(x₀ + t) - F(x₀) - a t = ½ f'(x₀) t² + o(t²)`, which follows from the
    differentiability of `f` at `x₀`.
  - The limit: its paths are continuous, and it has an a.s. unique maximizer `T`, by the
    uniqueness bullet after Brownian scaling; `T` is a real random variable, hence tight.
  - Uniform tightness of `ĥₙ`: the rate theorem of MathematicalStatisticsAsymptotic (5.6), applied
    to the fixed criterion `𝕄(t) = F(x₀ + t) - F(x₀) - a t`, which satisfies
    `𝕄(t) ≤ ¼ f'(x₀) t²` near `0`, and to `𝕄ₙ(t) = F̂ₙ(x₀ + t) - F̂ₙ(x₀) - aₙ t`, with modulus
    `φₙ(δ) = (√δ + n^{1/6} δ)/2`, from the bracketing maximal inequality for the indicators of
    `(x₀, x₀ + t]` plus the drift `n^{-1/3} |u| δ`, the factor `1 + |u|` going into the constant
    of the modulus bound, which is stated with the extended outer expectation (2.1); `φₙ(δ)/δ^{3/2}`
    is decreasing and `rₙ = n^{1/3}` gives
    `rₙ² φₙ(1/rₙ) = √n`. Its consistency hypothesis
    `ŝₙ(aₙ) → x₀` in probability holds because `𝕄ₙ(t) ≤ 1 - aₙ t` keeps the maximizer in a
    bounded interval once `aₙ > 0`, `𝕄` is concave (`F` is concave on `[0, ∞)`) with
    `𝕄 ≤ ¼ f'(x₀) ε² < 0` outside `(-ε, ε)`, and `𝕄ₙ - 𝕄 → 0` uniformly on bounded intervals in
    probability (the classical Glivenko–Cantelli theorem, 3.4). The
    conclusion `ĥₙ = O_P(1)` says that for every `ε > 0` there is `M` with
    `P*(|ĥₙ| > M) ≤ ε` for all large `n`, which is the uniform tightness hypothesis of the
    argmax theorem with the compact set `[-M, M]`.
  - Near-maximization: `ĥₙ` is an exact maximizer.

  The argmax theorem gives `ĥₙ ⇝ T`; `T` has a continuous law, so
  `P(ĥₙ < 0) → P(T < 0)`. Brownian scaling and completing the square give
  `T = -u/(2c) + (σ/c)^{2/3} Z` in law with `σ = √f(x₀)`, `c = -½ f'(x₀)` and `Z` the Chernoff
  variable, so `P(T < 0) = P(|4 f'(x₀) f(x₀)|^{1/3} Z ≤ u)`.
- **Local empirical process** (van der Vaart, Example 19.29, p. 283, by the argument of
  Thm 19.28, pp. 282–283): for i.i.d. observations from a law with continuous distribution
  function `F`, differentiable at `x₀` with `F'(x₀) = f(x₀)`, and every `K > 0`, the processes
  `Z_n(s) = n^{2/3} ((F̂_n - F)(x₀ + n^{-1/3} s) - (F̂_n - F)(x₀))`, `s ∈ [-K, K]`, converge
  weakly in `ℓ^∞([-K, K])` to `√f(x₀) W` for a two-sided Brownian motion `W`. This is a
  triangular-array statement: `Z_n = 𝔾_n g_{n,s}` for the class
  `g_{n,s} = n^{1/6} (1_{(-∞, x₀ + n^{-1/3} s]} - 1_{(-∞, x₀]})`, which changes with `n` and whose
  envelope `n^{1/6} 1_{(x₀ - n^{-1/3} K, x₀ + n^{-1/3} K]}` grows; the fixed-class Donsker
  theorems of MathematicalStatisticsAsymptotic do not apply to it, and this roadmap owns it.
  Proof: the finite marginals converge by MathematicalStatisticsAsymptotic's Lindeberg–Feller
  theorem (1.2), the envelope satisfying the Lindeberg condition because `n · n^{-1/3} → ∞`, and
  the covariances `P(g_{n,s} g_{n,t}) - P g_{n,s} P g_{n,t}` tend to `f(x₀) min(|s|, |t|)` for `s`,
  `t` of the same sign and to `0` otherwise, since
  `n^{1/3} (F(x₀ + n^{-1/3} s) - F(x₀)) → f(x₀) s` uniformly for `|s| ≤ K`; asymptotic
  equicontinuity for `ρ(s, t) = |s - t|` follows from the bracketing maximal inequality of
  MathematicalStatisticsAsymptotic (3.3), applied for each `n` to the differences on a partition
  of `[-K, K]` into intervals of length `δ`, with brackets between consecutive points of a grid
  on which `F` has equal increments (the continuity of `F` makes such a grid exist), so that the
  bracketing numbers at `L²(P)` size `ε` are `O(K/ε²)` uniformly in `n`, and with the truncation
  term of the inequality vanishing for large `n` by the Lindeberg condition; then convergence from
  marginals and equicontinuity (MathematicalStatisticsAsymptotic 2.3) gives a tight limit,
  identified with `√f(x₀) W` by the uniqueness of tight laws with given marginals (2.3). It is
  stated separately from the argmax and rate steps above.

*Needs:* 7.3; Mathlib `IsBrownianReal`; StochasticCalculus §1.4 (`B t / t → 0`);
MathematicalStatisticsAsymptotic: the Lindeberg–Feller theorem (1.2), convergence from marginals and
equicontinuity with uniqueness from marginals (2.3), the bracketing maximal inequality (3.3), the
Glivenko–Cantelli theorem (3.4), the argmax continuous-mapping theorem (4.3) and the rate
theorem for M-estimators (5.6).

**Checks.**

- Two-sided motion at the junction: `twoSided B₁ B₂ 0 = B₁ 0`, the branch `t ≥ 0`, and
  `twoSided B₁ B₂ (-2) = B₂ 2`.
- Increments: with `B₁`, `B₂` independent, `W 1 - W (-1) = B₁ 1 - B₂ 1` has variance
  `2 = |1 - (-1)|`, as for a two-sided Brownian motion.
- Independence is needed (negative control): with `B₂ = B₁`, `W 1 - W (-1) = 0`, the path
  `t ↦ W t - t²` is even, its maximum is positive (Brownian oscillation at `0`) and is attained at
  `±t*`, so the maximizer is a.s. not unique and `chernoffArgmax W ≥ 0` is not symmetric.
- Chernoff variable of the path `W ≡ 0`: the maximizers of `-t²` are `{0}`, so the value is `0`.
- Sign convention: for the path `W t = 2t`, `W t - t² = 1 - (t - 1)²`, so the value is `1`.
- Largest maximizer (negative control): for the path `W t = 2|t|` the maximizers are `±1`, and
  the value is `1`; the smallest maximizer would give `-1`.
- Junk value: for the path `W t = t²` every `t` is a maximizer, the set is unbounded above, and
  the value is the junk `0`.
- Scaling constant: for `σ = √f(x₀)` and `c = -½ f'(x₀)`,
  `2c (σ/c)^{2/3} = 2^{2/3} |f'(x₀) f(x₀)|^{1/3} = |4 f'(x₀) f(x₀)|^{1/3}`, the constant of the
  cube-root limit.

### 7.5 Log-concave maximum likelihood

Let `logConcaveDensities d`, written `𝓕_d`, be the upper semicontinuous densities
`f : EuclideanSpace ℝ (Fin d) → ℝ≥0∞` with Tau Ceti's `TauCeti.LogConcave f` and `∫⁻ f = 1`.
- **Log-likelihood** (`logLikelihood`): `logLikelihood P f = ∫ log f dP` in `EReal`, with the
  value `⊥` unless `f > 0` holds `P`-almost everywhere and `log f` is `P`-integrable
  (Conventions). The densities of `𝓕_d` are bounded, so for them the value `⊥` is exactly the
  case `∫ log f dP = -∞`.
- **Log-concave projection** (`existsUnique_logConcaveProjection`, Samworth–Shah, Thm 9.15(c),
  p. 266): for a probability measure `P` with `∫ ‖x‖ dP < ∞` and `P H < 1` for every affine
  hyperplane `H`, `logLikelihood P` has a unique maximizer `f*` in `𝓕_d`, its value is finite,
  and `int csupp P ⊆ {f* > 0} ⊆ csupp P`, where the convex support `csupp P` is the intersection
  of the closed convex sets of full `P`-measure. Proof: the functional is concave and upper
  semicontinuous on a compact family after the hyperplane condition bounds `sup log f`
  (Samworth–Shah's argument); uniqueness by strict concavity of `log ∫ exp`.
- **The estimator** (`logConcaveMLE_tent`). For `x : Fin n → ℝ^d` with `n ≥ d + 1` and
  `d`-dimensional convex hull `C_n` (nonempty interior), the empirical distribution satisfies the
  hypotheses, so the log-concave maximum likelihood estimator `f̂_n` exists and is unique; it
  vanishes outside `C_n` (the convex support of the empirical distribution), and on `C_n`,
  `f̂_n = exp h̄_y` for some heights `y`, with the tent function
  `h̄_y z = inf {g z | g concave on C_n, g (x i) ≥ y i ∀ i}` (Samworth–Shah, p. 266 for the
  support, p. 272 for the tent form). On `C_n` the infimum is over a nonempty family bounded below
  by `min y`.
- **Rate in dimension one** (`logConcaveMLE_sqHellinger_le`, Samworth–Shah, Thm 9.26(a),
  p. 279): for `d = 1`, `n ≥ 2` and samples from `f₀ ∈ 𝓕_1`,
  `sup_{f₀} E sqHellinger(f̂_n, f₀) ≤ C n^{-4/5}`, `C` universal, with `f̂_n` any maximizer of
  the log-likelihood of the empirical distribution over `𝓕_1` on the samples with distinct
  entries, which carry full measure. Proof: the
  peeling argument of the rate theorem of MathematicalStatisticsAsymptotic (5.6), carried out in
  expectation and uniformly over `𝓕_1` after affine standardization, for the criterion
  `log ((f + f₀)/(2 f₀))`, whose mean is at most a negative multiple of `sqHellinger(f, f₀)`; the
  modulus comes from the bracketing maximal inequality (3.3) with the Hellinger bracketing entropy
  of the standardized class. The rate theorem itself gives only an `O_P` rate at each `f₀`.
- **Lower bounds** (`logConcave_minimax_lower`, Samworth–Shah, Thm 9.26(b), p. 279): for every
  `d ≥ 1` there is `c_d > 0` such that for every `n ≥ d + 1` and every estimator `f̃_n`,
  `sup_{f₀ ∈ 𝓕_d} E sqHellinger(f̃_n, f₀) ≥ c_1 n^{-4/5}` for `d = 1` and `≥ c_d n^{-2/(d+1)}` for
  `d ≥ 2`. Samworth–Shah state the bound with one universal constant for all `d`; the target is the
  per-dimension form, which Kim and Samworth (2016), Thm 1, also give. The estimate at `x` is the
  probability measure `κ x` of a Markov kernel `κ`; a randomized estimator, a kernel into such
  measures, does no better than its mean kernel, since `sqHellinger (·, f₀)` is convex. The source
  states it for measurable deterministic estimators with integrable values; the squared distance of
  a probability measure to `f₀` is at least that of its absolutely continuous part, so the source
  covers these. Proof: Assouad (2.5) with perturbations of a log-concave density by
  `≍ n^{(d-1)/(d+1)}` caps near the boundary of its support for `d ≥ 2` and by interior bumps of
  width `n^{-1/5}` for `d = 1`, with the Hellinger form of 2.5.

*Needs:* 2.5; Tau Ceti `TauCeti.LogConcave`, `LogConcave.lintegral_prod_right`;
MathematicalStatisticsAsymptotic: the bracketing maximal inequality (3.3) and the peeling argument
of the rate theorem (5.6); Mathlib `convexHull`,
`ConcaveOn`, `UpperSemicontinuous`.

**Checks.**

- The standard Gaussian density on `ℝ` (`d = 1`) is in `𝓕_1`: its logarithm
  `-x²/2 - ½ log (2π)` is concave and it is continuous.
- The exponential density `e^{-x}` on the closed half-line `[0, ∞)` is in `𝓕_1`: its value `1` at
  `0` is the upper limit there.
- Version (negative control): the indicator of the closed interval `[0, 1]` is in `𝓕_1`; the
  indicator of the open interval `(0, 1)` is log-concave with integral `1` but not upper
  semicontinuous at `0` and `1`, so it is not.
- Shape (negative control): the Cauchy density `1/(π (1 + x²))` is not in `𝓕_1`, since the
  second derivative of its logarithm is `2(x² - 1)/(1 + x²)² > 0` for `|x| > 1`.
- `logLikelihood` of the standard Gaussian density under `P = N(0, 1)`:
  `-½ log (2π) - ½ ≈ -1.4189`.
- `logLikelihood` of the exponential density under its own law: `∫ (-x) e^{-x} dx = -1`.
- Extended value (negative control): under `P = N(0, 1)` the uniform density on `[0, 1]` has
  `logLikelihood = ⊥`. The real integral with `log 0 = 0` would give it `0`, more than the true
  density's `-1.4189`.
- Extended value (negative control): for `P = (δ₋₁ + δ₁)/2`, which satisfies the hypotheses of
  the projection theorem in `d = 1`, the uniform densities on `[-1 - δ, -1 + δ]` vanish at `1`
  and have `logLikelihood = ⊥`; with the real integral and `log 0 = 0` they would score
  `½ log (1/(2δ)) → ∞`, and no maximizer would exist.
- Two points `x₁ < x₂` in `d = 1`: the tent function is affine on `[x₁, x₂]`; among the densities
  `e^{a + b t}` on `[x₁, x₂]` the log-likelihood `a + b(x₁ + x₂)/2` with `∫ e^{a + bt} = 1` is
  maximal at `b = 0` by Jensen, so `f̂` is uniform on `[x₁, x₂]`.

### Examples

- Isotonic regression with weights `(1, 2)` and `y = (2, 1)`: the pooled value
  `(2 + 2)/3 = 4/3` for both coordinates.

### Dependencies

Layers 2 and 5; Foundations 9.1; MathematicalStatisticsAsymptotic: the Lindeberg–Feller
theorem (1.2), convergence from marginals and equicontinuity (2.3), the bracketing maximal
inequality (3.3), the Glivenko–Cantelli theorem (3.4), the argmax theorem (4.3) and the rate
theorem for M-estimators (5.6);
StochasticCalculus §1.4: the growth of Brownian motion; Tau Ceti log-concavity.

## Layer 8: functional data

`H` is a real separable Hilbert space with its Borel σ-algebra (Conventions), `X : Ω → H`
measurable with `MemLp X 2 μ` under a probability measure `μ`, and `m = ∫ X dμ`.

### 8.1 The covariance operator

- `centeredCovariance μ X = covarianceOperator (μ.map (fun ω ↦ X ω - m))`, with Mathlib's
  uncentered `covarianceOperator`.
- **Covariance identity** (`inner_centeredCovariance`, Hsing–Eubank, Thm 7.2.5, p. 180):
  `⟪centeredCovariance μ X x, y⟫ = ∫ ⟪X - m, x⟫ ⟪X - m, y⟫ dμ`; the operator is symmetric and
  positive (Mathlib's `IsPositive` includes symmetry). Proof: Mathlib `covarianceOperator_inner`,
  `isPositive_covarianceOperator`.
- **Trace class** (`centeredCovariance_trace`, Hsing–Eubank, Thm 7.2.5, p. 180): for every Hilbert
  basis `b`, `∑' i, ⟪C (b i), b i⟫ = ∫ ‖X - m‖² dμ`, and `C` is compact. Proof: the identity is
  Parseval inside the integral; `hilbertSchmidtEnergy C b ≤ ‖C‖ ∑ ⟪C b i, b i⟫ < ∞`, so the
  approximation numbers are square-summable (Tau Ceti
  `tsum_singularValue_sq_eq_hilbertSchmidtEnergy`) and tend to `0`, hence `C` is compact
  (`isCompactOperator_of_tendsto_singularValue`). The trace-norm form
  `nuclearENorm C = ofReal (∫ ‖X - m‖² dμ)` of the source is `nuclearENorm_centeredCovariance`,
  proved in 8.2 from the trace of a positive compact operator.
- **Support** (`ae_mem_closure_range_centeredCovariance`, Hsing–Eubank, Thm 7.2.5,
  pp. 180–181): `X - m` lies a.s. in the closure of the range of `C`.

*Needs:* Mathlib `covarianceOperator`, `HilbertBasis`, `IsCompactOperator`; Tau Ceti
`hilbertSchmidtEnergy`, `tsum_singularValue_sq_eq_hilbertSchmidtEnergy`,
`isCompactOperator_of_tendsto_singularValue`; 8.2 for the trace-norm identity only.

**Checks.**

- `H = ℝ²`, `X` uniform on `{±e₁, ±2e₂}`: `m = 0`, `C = diag (½, 2)`, and the trace `5/2` equals
  `E ‖X‖² = (1 + 1 + 4 + 4)/4`.
- Centering (negative control): for a constant `X ≡ v` the centered covariance is `0`, while
  Mathlib's uncentered `covarianceOperator` of the law `δ_v` is `x ↦ ⟪x, v⟫ v`, with trace `‖v‖²`.
- `H = ℝ`, `X` Bernoulli with parameter `p`: `C` is multiplication by `p (1 - p)`; the uncentered
  operator would multiply by `p`.

### 8.2 Eigen-expansions of compact positive operators

- `IsEigenExpansion T λ φ` for `T : H →L[ℝ] H`, `λ : ℕ → ℝ`, `φ : ℕ → H`: `λ` is antitone,
  nonnegative and tends to `0`; `φ` restricted to `{j | 0 < λ j}` is orthonormal; and
  `HasSum (fun j ↦ λ j • ⟪x, φ j⟫ • φ j) (T x)` for every `x`.
- **Existence** (`exists_isEigenExpansion`; Hsing–Eubank, Thm 4.2.4, p. 98, for the expansion):
  a positive compact `T` has an eigen-expansion with `λ j = singularValue T j`. Proof: Tau Ceti's
  `exists_hilbertBasis_forall_hasEigenvector` gives a Hilbert basis of eigenvectors; finitely
  many eigenvalues exceed each positive level (compactness), so the positive ones can be listed in
  decreasing order with multiplicity; the identification with the approximation numbers is the
  min–max characterization `singularValue_eq_iInf_nnnorm_comp_orthogonal` (the Courant–Fischer
  principle, Hsing–Eubank, Thm 4.2.7, p. 100).
- **Ky Fan's maximum principle** (`IsEigenExpansion.sum_inner_le`): for an eigen-expansion
  `(λ, φ)` of `T` and every orthonormal `v : Fin k → H`,
  `∑ i, ⟪T (v i), v i⟫ ≤ ∑_{j < k} λ j`, with equality for `v = φ` on the first `k` indices when
  `λ (k - 1) > 0` (then `φ 0, …, φ (k - 1)` are orthonormal). `IsEigenExpansion` constrains `φ`
  only at positive eigenvalues; at a zero eigenvalue `φ j` may be `0`. Proof: Tau Ceti's
  `IsPositive.exists_orthonormal_kyFanGauge_le_sum_re_inner_add` and `kyFanGauge`, the sum of the
  first `k` approximation numbers.
- **Trace of a positive compact operator** (`nuclearENorm_eq_tsum_inner`): for a positive compact
  `T` on `H` and every Hilbert basis `b`, `nuclearENorm T = ∑' i, ofReal ⟪T (b i), b i⟫`. Proof:
  Tau Ceti's `exists_hilbertBasis_forall_hasEigenvector` gives a Hilbert basis of eigenvectors,
  in which the right side is the sum of the eigenvalues, which by the existence bullet are the
  approximation numbers; the right side does not depend on `b`, by writing
  `⟪T b i, b i⟫ = ‖T^{1/2} b i‖²` and the basis independence of `hilbertSchmidtEnergy`.
- **Trace norm of the covariance** (`nuclearENorm_centeredCovariance`; Hsing–Eubank, Thm 7.2.5,
  p. 180): `nuclearENorm (centeredCovariance μ X) = ofReal (∫ ‖X - m‖² dμ)`, from the previous
  bullet and the diagonal identity of 8.1.

*Needs:* Tau Ceti `exists_hilbertBasis_forall_hasEigenvector`, `singularValue`,
`singularValue_eq_iInf_nnnorm_comp_orthogonal`, `kyFanGauge`, `hilbertSchmidtEnergy`; 8.1 only
for the last bullet. The operator-theoretic bullets do not use 8.1.

**Checks.**

- The Brownian-motion covariance `s ∧ t` on `L²[0, 1]` has eigenvalues `4/((2j - 1)π)²`
  (one-based) with eigenfunctions `√2 sin ((j - ½)πt)` (Hsing–Eubank, Example 4.6.3,
  pp. 118–119); they sum to `∫₀¹ t dt = ½`.
- The bridge covariance `s ∧ t - st` has eigenvalues `1/(jπ)²` with eigenfunctions
  `√2 sin (jπt)`, summing to `∫₀¹ t(1 - t) dt = 1/6`.
- Order (negative control): for `C = diag (½, 2)` on `ℝ²`, `λ = (½, 2, 0, …)` with
  `φ = (e₁, e₂, 0, …)` satisfies the `HasSum` field but is not antitone; the eigen-expansion is
  `λ = (2, ½, 0, …)`, `φ = (e₂, e₁, …)`.
- Freedom at zero: the zero operator has the eigen-expansion `λ ≡ 0` with any `φ`, for example
  `φ ≡ 0`, since the orthonormality field ranges over the empty set.

### 8.3 The Karhunen–Loève expansion and principal components

Let `C = centeredCovariance μ X` with an eigen-expansion `(λ, φ)` from 8.2.
- **Karhunen–Loève** (`karhunenLoeve`, Hsing–Eubank, Thms 7.2.6–7.2.7, p. 181): the scores
  `⟪X - m, φ j⟫` have mean `0`, and for `λ j`, `λ k > 0` they are uncorrelated with variance
  `λ j`; and `X = m + ∑_{λ j > 0} ⟪X - m, φ j⟫ φ j` almost surely in `H` and in `L²(μ; H)`.
  Proof: the moments are the covariance identity of 8.1 with `C φ j = λ j φ j`; for a.s.
  convergence, the series is the expansion of `X - m` in the orthonormal family `φ`, whose closed
  span is the closure of the range of `C`, which contains `X - m` a.s. (8.1); the `L²`
  convergence follows by dominated convergence, the squared norms of the remainders being at most
  `‖X - m‖²` (Bessel).
- **Optimality of principal components** (`fpca_optimal`, Hsing–Eubank, Thm 7.2.8, p. 181): every
  `k`-dimensional subspace `V` has `∑_{j ≥ k} λ j ≤ ∫ ‖X - m - P_V (X - m)‖² dμ`. If `k ≥ 1` and
  `λ (k - 1) > 0`, the subspace `span {φ 0, …, φ (k - 1)}` has dimension `k` and attains the
  bound, and if moreover `λ (k - 1) > λ k` it is the only `k`-dimensional subspace that does.
  Proof: `E ‖(I - P_V)(X - m)‖² = E ‖X - m‖² - ∑ ⟪C v i, v i⟫` for an orthonormal basis `v` of
  `V`, and Ky Fan (8.2), with the equality case for uniqueness.
- **Degenerate case** (`fpca_degenerate`). If only `r < k` eigenvalues are positive (`λ r = 0`)
  and `H` has a subspace of dimension `k`, some `k`-dimensional `V` has residual `0`, so the
  infimum over `k`-dimensional `V` is `0` and attained, and the minimizers are exactly the
  `k`-dimensional `V` containing `span {φ j | λ j > 0}` (no choice of the `φ j` with `λ j = 0` is
  made). Proof: `E ‖(I - P_V)(X - m)‖² = 0` iff `(I - P_V) C = 0`, iff `V` contains the range of
  `C`, which is `span {φ j | λ j > 0}`.

*Needs:* 8.1, 8.2; Mathlib `Submodule.starProjection`, `Orthonormal`.

### 8.4 Gaussian measures on a Hilbert space

- `gaussianHilbert T`, for `T` positive compact with eigen-expansion `(λ, φ)` and
  `∑ λ j < ∞`: the law of `z ↦ ∑' j, √(λ j) z j • φ j` (the sum where it exists, `0` elsewhere)
  under `Measure.infinitePi (fun _ ↦ gaussianReal 0 1)`. In Lean it is `gaussianHilbert λ φ`.
- **Existence and uniqueness** (`isGaussian_gaussianHilbert`, `eq_gaussianHilbert`; uniqueness
  of a law on `H` given the
  laws of all `⟪x, f⟫`: Hsing–Eubank, Thm 7.1.2, p. 177): the series converges a.s.;
  `gaussianHilbert λ φ` is a probability measure, satisfies Mathlib's `IsGaussian`, is centered and
  has `covarianceOperator (gaussianHilbert λ φ) = T`; and every centered Gaussian measure on `H`
  with covariance operator `T` equals it. Proof: the terms with `λ j = 0` vanish and the others are
  orthogonal, so the series has a sum exactly when `∑ λ j z j² < ∞`
  (`OrthogonalFamily.summable_iff_norm_sq_summable`), which holds a.s. because its expectation is
  `∑ λ j < ∞`; the set where it holds and the sum on it are measurable, so the image measure is a
  probability measure. The covariance is `∑ λ j ⟪x, φ j⟫ ⟪y, φ j⟫ = ⟪T x, y⟫`. Uniqueness by
  Mathlib's `ProbabilityTheory.IsGaussian.ext`: two Gaussian measures on a Hilbert space with the
  same mean and covariance are equal; the second moment of a Gaussian
  measure, which makes its covariance operator meaningful, is Fernique's theorem
  (`IsGaussian.memLp_id`).
- **Trace criterion** (`exists_isGaussian_covarianceOperator_iff`). A positive compact operator `T`
  is the covariance operator of a centered Gaussian measure iff `nuclearENorm T < ∞`. Proof: a
  Gaussian measure has a second moment (Fernique), so its covariance has finite trace by 8.1 and
  8.2; conversely `∑ λ j = nuclearENorm T < ∞` by 8.2, and `gaussianHilbert λ φ` has covariance `T`.

*Needs:* 8.1, 8.2; Mathlib `IsGaussian`, `IsGaussian.memLp_id`, `IsGaussian.ext`,
`Measure.infinitePi`, `OrthogonalFamily.summable_iff_norm_sq_summable`.

**Checks.**

- `H = ℝ`, `T` multiplication by `σ²`: `λ = (σ², 0, 0, …)`, `φ 0 = 1`, and `gaussianHilbert` is the
  law of `σ z₀`, `gaussianReal 0 σ²`.
- `H = ℝ²`, `T = diag (½, 2)`: `λ = (2, ½, 0, …)`, `φ = (e₂, e₁, …)`, and `gaussianHilbert` is the
  law of `√2 z₀ e₂ + z₁ e₁/√2`, with covariance `diag (½, 2)`.
- Summability is needed (negative control): for `λ j = 1/(j + 1)` and an orthonormal `φ` in an
  infinite-dimensional `H`, `∑ z j²/(j + 1) = ∞` almost surely, the series never has a sum, and the
  image measure is the Dirac measure at `0`, whose covariance is `0`, not `T`.

### 8.5 The Hilbertian central limit theorem

- **Central limit theorem** (`tendstoInDistribution_hilbert_clt`, Hsing–Eubank, Thm 7.7.6,
  p. 210): for an i.i.d. sequence `X i` in `H` (Foundations 8.5) with `E ‖X 0‖² < ∞`,
  `n^{-1/2} ∑_{i < n} (X i - m) ⇝ gaussianHilbert λ φ` for an eigen-expansion `(λ, φ)` of the
  centered covariance `C`. Proof: for every finite-dimensional subspace `V`, the projections
  converge by Mathlib's multivariate route (the scalar central limit theorem and the Cramér–Wold
  device `tendstoInDistribution_iff_tendstoInDistribution_inner` in `V`); tightness by the
  flat-concentration criterion (Hsing–Eubank, Thm 7.7.5, p. 209):
  `E ‖P_{V_k^⊥} S_n‖² = ∑_{j ≥ k} λ j` uniformly in `n`, for `V_k` spanned by the first `k`
  eigenvectors; the limit is identified by 8.4.

*Needs:* 8.3, 8.4; Foundations 8.5; Mathlib `tendstoInDistribution_inv_sqrt_mul_sum_sub`,
`tendstoInDistribution_iff_tendstoInDistribution_inner`, `IsTightMeasureSet`.

### 8.6 Asymptotics of functional principal components

For an i.i.d. sequence with `E ‖X 0‖⁴ < ∞`, the empirical covariance
`empiricalCovariance x = Ĉ_n` of the sample `x = firstN X n`,
`Ĉ_n = n⁻¹ ∑_{i<n} (X i - X̄_n) ⊗ (X i - X̄_n)` (a positive operator of rank at most `n - 1`) and
its approximation numbers `λ̂_j = singularValue Ĉ_n j`. Hsing–Eubank normalize by `(n - 1)⁻¹`;
the difference is `O(1/n)` in operator norm and does not affect the limits below.
- **Consistency** (`fpca_consistency`; Hsing–Eubank, Thm 8.1.2, pp. 212–213, for the first
  part): `Ĉ_n → C` almost surely in Hilbert–Schmidt norm when `E ‖X 0‖² < ∞` (in Lean, the
  Hilbert–Schmidt energy in a Hilbert basis `b` tends to `0`); `‖Ĉ_n - C‖ = O_P(n^{-1/2})` when
  `E ‖X 0‖⁴ < ∞`, in outer probability. The bound `|λ̂_j - λ_j| ≤ ‖Ĉ_n - C‖` for every `j`, `n`
  and sample (Hsing–Eubank, Thm 4.2.8, p. 102), which transfers the rate to the eigenvalues, is
  Tau Ceti's `ContinuousLinearMap.abs_singularValue_sub_singularValue_le`. Proof of the rate:
  `Ĉ_n - C = n⁻¹ ∑ ((X i - m) ⊗ (X i - m) - C) - (X̄_n - m) ⊗ (X̄_n - m)`; the first
  term has `E ‖·‖²_{HS} ≤ n⁻¹ E ‖X 0 - m‖⁴` (the bound in the proof of Thm 8.1.2, p. 213), the
  second has `E ‖·‖_{HS} = n⁻¹ E ‖X 0 - m‖²`, and Chebyshev and Markov conclude.
- **Operator limit** (Hsing–Eubank, Thm 8.1.2, pp. 212–213): when `E ‖X 0‖⁴ < ∞`,
  `√n (Ĉ_n - C)` converges in law in the Hilbert–Schmidt operators to a centered Gaussian
  element with covariance operator that of `(X 0 - m) ⊗ (X 0 - m)`. Proof: the Hilbertian
  central limit theorem (8.5) in the Hilbert space of Hilbert–Schmidt operators, applied to
  `(X i - m) ⊗ (X i - m) - C`, plus the remainder `√n (X̄_n - m) ⊗ (X̄_n - m) → 0` in
  probability.
- **Eigenvalues** (`tendstoInDistribution_fpca_eigenvalue`, Hsing–Eubank, Thm 9.1.3, p. 255, with
  the variance from p. 213): if `λ_j` is positive and simple,
  `√n (λ̂_j - λ_j) ⇝ N(0, Var ⟪X 0 - m, φ_j⟫²)`; for Gaussian `X` the variance is `2 λ_j²`. Proof:
  the perturbation identity (Hsing–Eubank, Thm 5.1.6 and (5.17), (5.20), pp. 136–137)
  `λ̂_j - λ_j = ⟪(Ĉ_n - C) φ̂_j, φ̂_j⟫ + O(‖C‖ ‖Ĉ_n - C‖²/η_j²)` with
  `η_j = ½ min_{k ≠ j} |λ_j - λ_k|`, so
  `√n (λ̂_j - λ_j) = √n ⟪(Ĉ_n - C) φ_j, φ_j⟫ + o_P(1)`, a scalar average plus `o_P(1)`, and
  Mathlib's central limit theorem.
- **Eigenfunctions** (`fpca_eigenvector`, Hsing–Eubank, Thm 5.1.8, p. 138, and Thm 9.1.3,
  p. 255): if `λ_j` is positive and simple, then for any unit eigenvector `φ̂_j` of `Ĉ_n` for
  `λ̂_j`, signed so that `⟪φ̂_j, φ_j⟫ ≥ 0`, `‖φ̂_j - φ_j‖ = O_P(n^{-1/2})` and
  `φ̂_j - φ_j = ∑_{k ≠ j} ⟪(Ĉ_n - C) φ_j, φ_k⟫ / (λ_j - λ_k) · φ_k + o_P(n^{-1/2})`, the sum over a
  Hilbert basis of eigenvectors of `C` including the null space, which converges because the gaps
  are bounded below; both in outer probability, since the choice of `φ̂_j` need not be
  measurable. In Lean `φ_j` is the basis vector `b i₀` with eigenvalue `ev i₀ = λ_j`.

*Needs:* 8.1–8.5; Foundations 8.2–8.4; Tau Ceti
`ContinuousLinearMap.abs_singularValue_sub_singularValue_le` for the eigenvalue bound,
`hilbertSchmidtEnergy` for the consistency statement.

**Checks.**

- One observation: `Ĉ_1 = 0`, since the single point is its own mean.
- Normalization (negative control): `H = ℝ`, `x = (0, 2)`: `X̄ = 1` and `Ĉ_2` is multiplication by
  `(1 + 1)/2 = 1`; the normalization `(n - 1)⁻¹` of Hsing–Eubank would give `2`.
- Rank: `H = ℝ²`, `x = (e₁, -e₁)`: `X̄ = 0`, `Ĉ_2 = e₁ ⊗ e₁`, with approximation numbers
  `(1, 0, …)`.
- Gaussian `X`: `⟪X - m, φ_j⟫ ~ N(0, λ_j)`, so `Var ⟪X - m, φ_j⟫² = λ_j² Var Z² = 2 λ_j²`.

### 8.7 Functional linear regression

Let `H = L²[0, 1]`, `X` centered with continuous covariance kernel, eigenvalues `λ` (8.2) and
tails `V_k = ∑_{j > k} λ_j`; `Y i = ⟪β, X i⟫ + ε i` with errors independent of the design, mean
`0` and variance `σ²`; `β ∈ W_q[0, 1]`, `‖g‖²_{W_q} = ‖g‖² + ‖g^{(q)}‖²`; and the penalized
estimator `β̂_η = argmin_{g ∈ W_q} n⁻¹ ∑ (Y i - ⟪g, X i⟫)² + η ‖g‖²_{W_q}`, which exists and is
unique for `η > 0` (a positive definite quadratic problem on the Hilbert space `W_q`).
- **Prediction rate** (Hsing–Eubank, Thm 11.2.7, p. 317): if
  `V_k = O(k^{-α})`, `α > 0`, and the scores `Z_j = ⟪X, φ_j⟫` satisfy
  `Var (Z_j Z_k) ≤ c λ_j λ_k`, then for `η = n^{-(2q+α+1)/(2q+α+2)}`,
  `E_{ε,X} (⟪X, β̂_η⟫ - ⟪X, β⟫)² = O_P(n^{-(2q+α+1)/(2q+α+2)} + n^{-(α+1)/2})`, the expectation
  over the errors and an independent copy `X`, given the design. For `α ≥ 1` the first term
  dominates.
- **Lower bound** (Hsing–Eubank, Thm 11.3.1, p. 318): for `α ≥ 1` and the class `Θ` of models with
  `‖β‖_{W_q} ≤ 1` and `V_k ≤ k^{-α}`,
  `liminf_n n^{(2q+α+1)/(2q+α+2)} inf_{β̃} sup_Θ E (⟪X, β̃⟫ - ⟪X, β⟫)² ≥ C > 0`. Proof:
  standard normal errors, a design `X` with independent scores uniform on `[-√3, √3]` along the
  `k_n ≍ n^{1/(2q+α+2)}` directions `k_n < j ≤ 2 k_n`, coefficients `β` switched on or off along
  those directions, and Assouad's lemma (2.5) over the switches.
- **Brownian covariates** (Hsing–Eubank, pp. 313–314): `λ_j = 4/((2j - 1)π)²` (8.2's check),
  `V_k = O(k^{-1})`, so `α = 1`; the Gaussian scores satisfy `Var (Z_j Z_k) ≤ 2 λ_j λ_k`, and the
  rate is `n^{-(2q+2)/(2q+3)}`.

*Needs:* 2.3–2.5, 8.1–8.3; Mathlib `MeasureTheory.Lp`, `iteratedDeriv`.

### Examples

- `H = ℝ²` with `X` uniform on `{±e₁, ±2e₂}` (each with probability `1/4`): `C = diag (½, 2)`,
  `λ = (2, ½)`, `φ = (e₂, e₁)`, and the best one-dimensional subspace is `span e₂` with residual
  `½ = λ 1`.

### Dependencies

Layers 2 and Foundations 8.2–8.5; Mathlib's covariance operators, Gaussian measures and
Hilbert bases; Tau Ceti's spectral theorem for compact operators and approximation numbers.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **The sharp Dvoretzky–Kiefer–Wolfowitz inequality** `P(√n D_n > x) ≤ 2 e^{-2x²}` with
  Massart's constant: its proof is a long special-purpose argument; 4.6 proves the
  bounded-differences form.
- **Stone's asymptotic optimality of the cross-validated bandwidth**
  `∫ (f̂_{ĥ} - f)² / inf_h ∫ (f̂_h - f)² → 1` a.s.: it needs uniform-in-bandwidth bounds for a
  degenerate U-process; 5.7 proves the unbiasedness and the identity it rests on.
- **The white-noise model on path space** `dY = f dt + ε dW` and its equivalence with the sequence
  model: it needs the Wiener integral of the StochasticCalculus roadmap; Layer 6 states every
  result in the sequence model, which is its coordinate form.
- **The log-concave rate in dimension `d ≥ 2`**,
  `sup E sqHellinger(f̂_n, f₀) ≤ C_d n^{-2/(d+1)} log n`: it rests on bracketing-entropy bounds
  for log-concave densities in several dimensions (Kim–Samworth); 7.5 proves the lower bounds in
  every dimension and the upper bound for `d = 1`.
- **Silverman's equivalent kernel for smoothing splines**: an approximation, not a theorem in the
  form of the texts.
- **The Chernoff density** in terms of Airy functions (Groeneboom–Jongbloed, Thm 3.9): 7.4 uses
  only the existence, uniqueness and symmetry of the argmax.
- **Further nonparametric theory**: wavelet thresholding and Besov classes, adaptive estimation
  (Lepski's method, oracle inequalities beyond 6.4), nonparametric Bayes, Hájek–Šidák rank
  theory under alternatives beyond 4.3, permutation tests, and the bootstrap.
- **High-dimensional statistics**: sparse minimax rates, the Lasso and multiple testing belong
  to MathematicalStatisticsHighDimensional, which consumes Layers 1 and 2 and 6.4.

## Prior formalization

Layers 1–8 are formalized in part in `CKSD/Nonparametric/` of
[lean-CKSD](https://github.com/bjbraams/lean-CKSD) (Apache 2.0), the Core Knowledge of Statistics
and Data Science project, where they are items 1–32, 39, 40, 45 and 46 of its file SYNOPSIS103.md.
Many headlines are proved there, among them the two-point, Fano and Assouad bounds, the Hamming
packing, the Gaussian divergences, the moments of linear rank statistics, the distribution-freeness
of the goodness-of-fit statistics, the soft-threshold bounds, the characterization of isotonic
regression, and the Grenander estimator as maximum likelihood estimator. Several targets here are
more general than the proved source results, which they enlarge rather than integrate: the pointwise
Hölder density lower bound is proved there for `0 < β ≤ 1` and measurable deterministic estimators
(file HolderDensityMinimax), while 5.9 asks for every `β > 0` and all randomized estimators; the
`L¹` consistency there is in expectation, in dimension one, for bounded compactly supported kernels
(file KernelDensityL1), while 5.3 asks for almost sure consistency for integrable kernels on `ℝ^d`.
Admitted there, and not discharged by the proved material: the asymptotic minimaxity of Pinsker's
estimator (file Models), universal Nadaraya–Watson consistency (file SmoothingRates), the isotonic
upper risk bound (file ShapeAndSelection), the Grenander cube-root limit, and the log-concave
projection and rate theorems. Its definitions are not canonized here: it has its own empirical
distribution function and total variation distance, where this roadmap uses Foundations 9.1 and
Mathlib's `tvDist`.

The map, which is not prescriptive, lists files of `CKSD/Nonparametric/`:

| Layer | lean-CKSD files | synopsis items |
|---|---|---|
| 1, 2 | LowerBounds/Testing, LowerBounds/Gaussian, Basic | 39, 40, 45, 46 |
| 3, 4 | Estimation (ranks, Kolmogorov–Smirnov), GoodnessOfFit | 1, 2, 3, 14–20 |
| 5 | Estimation (kernel density, representer), KernelDensityL1, HolderDensityMinimax, HolderRegressionMinimax, SmoothingRates | 4–8, 22–26 |
| 6 | Models, GaussianProjection | 9, 10, 12, 13 |
| 7 | ShapeAndSelection, Grenander, LogConcave | 11, 21, 27, 28 |
| 8 | EmpiricalCovariance (finite-dimensional leading component) | 29–32 |

Related libraries:
- [Statlib](https://github.com/stat-lib/statlib) (Apache 2.0) develops divergences on Mathlib's
  kernel vocabulary: a squared Hellinger distance (with the halved normalization, so that its value
  is half of 1.1's) with its bound by half the total variation, the Bretagnolle–Huber inequality,
  the tensorization of the Kullback–Leibler divergence over finite products and powers, mutual
  information with a Fano-type bound on the binary Bayes risk, the binary testing identity, and a
  product bound on the total variation. Layers 1 and 2 follow the same route and may port these
  proofs with attribution; the roadmap copies no Statlib code.

## Downstream consumers

The high-dimensional statistics roadmap MathematicalStatisticsHighDimensional consumes Layers 1
and 2 and the soft-threshold section 6.4 (with the finite form of 6.1), and nothing else of this
roadmap. Its contract is the following list of stable headline names:
`max_measure_ge_of_tvDist` and `max_measure_ge_of_klDiv` (Le Cam, 2.2),
`minimaxRisk_ge_of_tvDist` (2.2), `fano` and `mutualInfoUniform_le` (2.4), `assouad` and
`assouad_metric` and `assouad_klDiv` (2.5), `exists_varshamovGilbert` (2.3, the
full hypercube), `klDiv_gaussianReal` and `klDiv_multivariateGaussian` (1.3), and `softThreshold`,
`softThresholdRisk`, `softThresholdRisk_zero_le` and `softThresholdRisk_le` (6.4).
`fano_average` (2.4) is stated alongside `fano`. The sparse Varshamov–Gilbert packing belongs to
MathematicalStatisticsHighDimensional.

The Kolmogorov distance between distribution functions is not defined here; it belongs to the
higher-order asymptotics roadmap MathematicalStatisticsHigherOrderAndResampling, and this roadmap
does not use it.

## References

The locators refer to these editions; page numbers are printed page numbers.

- L. Devroye, L. Györfi and G. Lugosi, *A Probabilistic Theory of Pattern Recognition*,
  Springer, 1996.
- L. Devroye and G. Lugosi, *Combinatorial Methods in Density Estimation*, Springer, 2001.
- J. Fan and I. Gijbels, *Local Polynomial Modelling and Its Applications*, Chapman and Hall,
  1996.
- P. J. Green and B. W. Silverman, *Nonparametric Regression and Generalized Linear Models*,
  Chapman and Hall, 1994.
- P. Groeneboom and G. Jongbloed, *Nonparametric Estimation under Shape Constraints*, Cambridge
  University Press, 2014.
- M. Hollander, D. A. Wolfe and E. Chicken, *Nonparametric Statistical Methods*, 3rd ed., Wiley,
  2014 (cited by equation number).
- T. Hsing and R. Eubank, *Theoretical Foundations of Functional Data Analysis, with an
  Introduction to Linear Operators*, Wiley, 2015.
- Yu. I. Ingster and I. A. Suslina, *Nonparametric Goodness-of-Fit Testing under Gaussian
  Models*, Springer, 2003.
- I. M. Johnstone, *Gaussian Estimation: Sequence and Wavelet Models*, draft version of
  August 9, 2017.
- T. Robertson, F. T. Wright and R. L. Dykstra, *Order Restricted Statistical Inference*, Wiley,
  1988.
- R. J. Samworth and R. D. Shah, *Modern Statistical Methods and Theory*, Cambridge University
  Press, 2026.
- A. B. Tsybakov, *Introduction to Nonparametric Estimation*, Springer, 2009.
- A. W. van der Vaart, *Asymptotic Statistics*, Cambridge University Press, 1998.
- G. Wahba, *Spline Models for Observational Data*, SIAM, 1990.
- M. J. Wainwright, *High-Dimensional Statistics: A Non-Asymptotic Viewpoint*, Cambridge
  University Press, 2019.
- M. P. Wand and M. C. Jones, *Kernel Smoothing*, Chapman and Hall, 1995.

Original papers. Kim–Pollard and Kim–Samworth are cited in 7.4 and 7.5; the others are the
original sources of the results named after their authors in 3.5 (Gnedenko–Korolyuk), 4.4
(Chernoff–Savage), 4.5 (Hodges–Lehmann), 5.2 (Parzen) and 5.6 (Stone), which the README cites by
the secondary locators given there:

- H. Chernoff and I. R. Savage, Asymptotic normality and efficiency of certain nonparametric test
  statistics, *Ann. Math. Statist.* 29 (1958), 972–994.
- J. Kim and D. Pollard, Cube root asymptotics, *Ann. Statist.* 18 (1990), 191–219.
- C. J. Stone, Consistent nonparametric regression, *Ann. Statist.* 5 (1977), 595–645.
- A. K. H. Kim and R. J. Samworth, Global rates of convergence in log-concave density
  estimation, *Ann. Statist.* 44 (2016), 2756–2779.
- B. V. Gnedenko and V. S. Korolyuk, On the maximum discrepancy between two empirical
  distributions, *Dokl. Akad. Nauk SSSR* 80 (1951), 525–528.
- J. L. Hodges and E. L. Lehmann, Estimates of location based on rank tests, *Ann. Math.
  Statist.* 34 (1963), 598–611.
- E. Parzen, On estimation of a probability density function and mode, *Ann. Math. Statist.* 33
  (1962), 1065–1076.

# Roadmap: higher-order asymptotics and resampling

**Summary.** This roadmap builds the theory that refines the central limit theorem and the
resampling methods that exploit the refinement:
- the Kolmogorov and bounded Lipschitz distances, and conditional convergence in law of random
  laws, in outer probability and outer almost surely;
- Esseen's smoothing inequality and the Berry–Esseen theorem;
- lattice laws and Cramér's condition;
- Edgeworth expansions: the one-term expansion in the nonlattice and lattice cases, expansions of
  every order under Cramér's condition, smooth functions of means and studentized statistics,
  local expansions of densities and Cornish–Fisher expansions;
- the saddlepoint approximation to the density of a sample mean;
- the nonparametric bootstrap as a Markov kernel, its consistency for the mean, for the empirical
  distribution function and for Hadamard differentiable functionals, and its failure at a
  vanishing derivative and for the sample maximum, with the `m`-out-of-`n` remedy;
- the jackknife variance, subsampling and empirical likelihood;
- second-order accuracy of the studentized bootstrap and the coverage of bootstrap intervals;
- Čencov's theorem: the Fisher–Rao metric and the Amari–Chentsov tensor are the only invariant
  tensors on the finite probability simplices.

The material is the standard graduate content of Petrov, Bhattacharya–Ranga Rao, Hall, Shao–Tu,
van der Vaart, Owen, Politis–Romano–Wolf and Čencov (see [References](#references)). Headlines
that restate a source result cite a theorem, definition, section or equation number with its
printed page; corollaries and adaptations carry a proof route.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. Every headline whose carriers exist at the pins carries a Lean name; the bullets
without one are definitions, results supplied by Tau Ceti or other roadmaps, or facts about a
single definition, as the module docstring of `Suggested.lean` says.

Suggested home: `TauCeti/Statistics/HigherOrder/` for Layers 1–5 and
`TauCeti/Statistics/Resampling/` for Layers 6–8, with Layer 9 in
`TauCeti/Statistics/InformationGeometry/`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Distances and conditional laws.** The Kolmogorov distance and Pólya's theorem; the bounded
   Lipschitz distance, with the metrization of weak convergence supplied by Tau Ceti; random laws
   and their conditional convergence in law in outer probability and outer almost surely, with the
   equivalence of the bounded Lipschitz and Kolmogorov forms for a limit with continuous
   distribution function.
2. **Smoothing and Berry–Esseen.** Fourier–Stieltjes transforms of signed densities, the Pólya
   density, Esseen's smoothing inequality, and the Berry–Esseen theorem for independent summands,
   with its sharpness.
3. **Lattice laws and Cramér's condition.** Lattice laws and their characterization by the
   characteristic function; Cramér's condition, its sufficient conditions (an absolutely
   continuous component, the moment curve of such a variable) and its consequences (nonlattice,
   exponentially small atoms).
4. **Edgeworth expansions.** Cumulants and the Edgeworth polynomials; the one-term expansion for
   nonlattice means and its sharp constant; the one-term lattice expansion with the sawtooth term,
   and the failure of every continuous expansion for lattice means; expansions of every order
   under Cramér's condition in one and several dimensions; expansions for smooth functions of
   means, for studentized statistics and for the `t` statistic; the local expansion of densities;
   the Cornish–Fisher expansion of quantiles.
5. **The saddlepoint approximation.** Exponential tilting of a sample mean and the saddlepoint
   approximation to its density, with relative error `O(n⁻¹)`.
6. **The bootstrap.** The resampling kernel and bootstrap laws; the bootstrap law as the
   conditional law given the data; consistency for the mean and for the empirical distribution
   function; the delta method for the bootstrap and its failure at a vanishing derivative; the
   sample maximum: the atom of the bootstrap law, inconsistency, and consistency of the
   `m`-out-of-`n` bootstrap.
7. **Jackknife, subsampling and empirical likelihood.** Strong consistency of the jackknife
   variance of a smooth function of means; consistency of subsampling and the coverage of the
   subsampling interval; Owen's empirical
   likelihood theorem.
8. **The studentized bootstrap.** The bootstrap Edgeworth expansion, second-order accuracy of the
   studentized bootstrap in Kolmogorov distance, and the coverage of the normal-theory, percentile
   and percentile-`t` intervals.
9. **Čencov's theorem.** Congruent embeddings of probability simplices; invariance of the
   Fisher–Rao metric and the Amari–Chentsov tensor; uniqueness of continuous invariant bilinear
   and trilinear tensor fields up to a constant.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- convergence in probability and in law, boundedness in probability, Slutsky's lemma, the delta
  method, i.i.d. sequences and the weak law, the empirical distribution function, the sample
  mean and the distribution-function bound `|cdf P t - cdf Q t| ≤ tvDist P Q / 2`: these are
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 8.1–8.5,
  9.1 and 9.2;
- the empirical-process toolkit of MathematicalStatisticsAsymptotic: outer integrals,
  Hoffmann-Jørgensen weak convergence and asymptotic measurability, the space `ℓ^∞(T)` with its
  Borel σ-algebra, the Brownian bridge laws, the Glivenko–Cantelli and classical Donsker theorems
  for the empirical distribution function, Hadamard differentiability and the functional delta
  method, the Lindeberg–Feller theorem and the multivariate central limit theorem;
- the central limit theorem, the strong law and the Cramér–Wold device: Mathlib's
  `tendstoInDistribution_inv_sqrt_mul_sum_sub`, `ProbabilityTheory.strong_law_ae` and
  `tendstoInDistribution_iff_tendstoInDistribution_inner`;
- Fourier inversion of characteristic functions: Tau Ceti's `charFunDensity`;
- the chi-squared laws: Tau Ceti's `chiSquaredMeasure`;
- Wiener measure and the standard Brownian bridge: StochasticCalculus, through the Brownian
  bridge laws of MathematicalStatisticsAsymptotic.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace TauCeti, with Mathlib's `ProbabilityTheory`
  and `MeasureTheory` opened throughout. `Suggested.lean` states the prototypes in the namespace
  `TauCetiRoadmap.MathematicalStatisticsHigherOrderAndResampling`.
- **Samples.** As in Foundations: a finite sample is `x : Fin n → E` with law
  `Measure.pi (fun _ : Fin n ↦ P)`, and a statistic of a sequence `X : ℕ → Ω → E` at sample size
  `n` is evaluated at `sample X n ω = fun i : Fin n ↦ X i ω`, the first `n` observations.
  i.i.d. is Foundations' `IsIndependentIdenticallyDistributed μ X P` (8.5). The sample mean
  `x̄ = n⁻¹ ∑ xᵢ` and the empirical distribution function `F̂ₙ(t) = #{i | xᵢ ≤ t}/n` are those of
  Foundations 9.1; both are `0` at `n = 0`.
- **Distribution functions and transforms.** Distribution functions are Mathlib's
  right-continuous `cdf`. Characteristic functions are Mathlib's `charFun`, with kernel
  `exp (i ⟪x, t⟫)`; on `ℝ` this is `∫ exp (i t x) dP(x)`. The standard normal law is
  `gaussianReal 0 1`, with distribution function `Φ = cdf (gaussianReal 0 1)` and density
  `φ = gaussianPDFReal 0 1`; `zₐ = Φ⁻¹(α)` is the lower `α`-quantile, negative for `α < 1/2`.
  The Hermite polynomials are Mathlib's `Polynomial.hermite`, the probabilists' polynomials
  `He₀ = 1`, `He₁ = X`, `He₂ = X² - 1`, `He₃ = X³ - 3X`, monic and orthogonal for `φ`.
- **Normalization.** Expansions are for the standardized sum `Sₙ = n^{-1/2} ∑ᵢ₌₁ⁿ Xᵢ` of centred
  variables with unit variance, or for `√n A(X̄)/σ` with `A(μ) = 0` and `σ² = Var[DA(μ) X]`. The
  error terms are uniform in `x ∈ ℝ` unless a statement says otherwise. `κⱼ` is the `j`th cumulant
  of the summand (`cumulant`, 4.1); for a standardized summand `κ₃ = E X³` and `κ₄ = E X⁴ - 3`.
- **Distances between laws.** `kolmogorovDist P Q = sup_t |cdf P t - cdf Q t|` in `ℝ` and
  `boundedLipschitzDist P Q = sup |∫ f dP - ∫ f dQ|` over `1`-Lipschitz `f` with `|f| ≤ 1`, in
  `ℝ≥0∞`. Total variation is Mathlib's `tvDist`, with values in `[0, 2]` (Foundations 9.2).
- **The bootstrap.** The resampling kernel `bootstrapKernel n m : Kernel (Fin n → E) (Fin m → E)`
  sends a sample `x` with `n > 0` to `m` independent draws from its empirical distribution (6.1).
  The bootstrap law of a statistic `R x y` of the sample `x` and the resample `y` is
  `bootstrapLaw n m R x = (bootstrapKernel n m x).map (R x)`. The resample size is `m = n`
  unless stated. The bootstrap law is a random law: for data `X`, it is
  `ω ↦ bootstrapLaw n n R (sample X n ω)`.
- **Measurability of resampled statistics.** `bootstrapLaw` uses Mathlib's `Measure.map`, which
  returns `0` for a map that is not a.e.-measurable. When `E` and the value space have
  measurable singletons, every statistic is a.e.-measurable for the law of each resample, which
  is carried by finitely many points; 6.1 proves the integral and probability formulas that
  this gives, so that no measurability hypothesis on `R x` is needed.
- **Outer probability.** Mathlib's `μ s` of a set that need not be measurable is its outer
  measure. "In outer probability" therefore means `μ {ω | ε < dₙ(ω)} → 0` with no measurability
  assumption, and "outer almost surely" means Mathlib's `∀ᵐ ω ∂μ`, which asks for a null set
  containing the exceptional set. The first is the mode of van der Vaart, §23.2.1,
  pp. 332–333. His outer almost sure convergence asks that a measurable majorant of `dₙ` tend to
  `0` almost surely; it implies the second, and for measurable `dₙ` the two agree.
- **Conditional convergence in law.** For random laws `L n ω` on a metric space and a law `ν`:
  - `TendstoInLawInProbability μ L ν`: `boundedLipschitzDist (L n ω) ν → 0` in outer probability;
  - `TendstoInLawAlmostSurely μ L ν`: `boundedLipschitzDist (L n ω) ν → 0` outer almost surely.

  For laws on `ℝ` and `ν` with continuous distribution function, these are equivalent to the
  same statements for `kolmogorovDist` (1.3), which is the form used for real statistics.
- **Weak convergence in `ℓ^∞(T)`.** `ℓ^∞(T)` is `lp (fun _ : T ↦ ℝ) ∞` with its Borel
  σ-algebra, and weak convergence of maps that need not be measurable is the Hoffmann-Jørgensen
  convergence `TendstoInOuterDistribution` of MathematicalStatisticsAsymptotic: outer integrals of
  bounded continuous functions converge to integrals under a Borel limit. A function `T → ℝ`
  enters `ℓ^∞(T)` through `liftLinfty`, which is `0` on unbounded functions.
- **Integrals** are Bochner integrals. Every theorem carries the moment hypotheses that exclude
  Lean's junk value `0` of a nonintegrable integrand.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references). A locator marked *by the same argument* names the theorem whose
  proof the target follows when the target's hypotheses differ from those printed.

## Exact supplier contracts

### From Mathlib

- **Measures and kernels:** `Measure.pi`, `Measure.infinitePi`, `Measure.map`,
  `Measure.withDensity`, `Kernel`, `IsMarkovKernel`, `Kernel.comap`, `Kernel.map`, composition
  product `μ ⊗ₘ κ`, `condDistrib` with `condDistrib_ae_eq_of_measure_eq_compProd`,
  `StandardBorelSpace`, `uniformOn`, `SignedMeasure`, and `Metric.thickening` for the boundary
  neighbourhoods of 4.4.
- **Probability:** `iIndepFun`, `variance` (`Var[X; μ]`), `cdf` with
  `MeasureTheory.Measure.eq_of_cdf`, `gaussianReal`, `gaussianPDFReal`, `charFun_gaussianReal`,
  `multivariateGaussian`, `ProbabilityTheory.strong_law_ae`,
  `tendstoInDistribution_inv_sqrt_mul_sum_sub`,
  `tendstoInDistribution_iff_tendstoInDistribution_inner`, `ProbabilityMeasure` and its
  topology, `IsTightMeasureSet`, `tvDist`.
- **Characteristic functions** (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/`):
  `charFun`, `norm_charFun_le_one`, `continuous_charFun`, `contDiff_charFun` and
  `taylor_charFun_two`.
- **Fourier analysis:** the Riemann–Lebesgue lemma `tendsto_integral_exp_inner_smul_cocompact`
  (`Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean`).
- **Cumulants and tilting:** `mgf`, `cgf`, `complexMGF`, `integrableExpSet`, `Measure.tilted`,
  `integral_tilted_mul_self` and `variance_tilted_mul` (`Mathlib/Probability/Moments/`).
- **Analysis:** `Polynomial.hermite`, `Polynomial.deriv_gaussian_eq_hermite_mul_gaussian`,
  `Polynomial.hermite_succ`, `LipschitzWith`, `BoundedContinuousFunction`, `lp`,
  `Memℓp`, `ContDiffOn`, `fderiv`, `Real.tendsto_one_add_div_pow_exp`.

### From Tau Ceti

- **Empirical measures:** `TauCeti.Probability.empiricalMeasureOfFintype` (the empirical law of
  `x : κ → α` for a nonempty finite `κ`, as a `ProbabilityMeasure`),
  `measurable_empiricalMeasureOfFintype`, `empiricalMeasureOfFintype_eq_map_uniformOn` and
  `integral_empiricalMeasureOfFintype` (`TauCeti/Probability/Process/EmpiricalMeasure.lean`).
- **Product kernels:** `TauCeti.MeasureTheory.iidBlockKernel m`, the Markov kernel
  `ProbabilityMeasure α → (Fin m → α)` sending `P` to `Pᵐ`, with `iidBlockKernel_apply` and
  `measurable_probabilityMeasure_pi_const_toMeasure`
  (`TauCeti/MeasureTheory/Measure/ProductKernel.lean`).
- **Sampling with replacement:**
  `TauCeti.Probability.pi_empiricalMeasureOfFintype_eq_map_uniformOn`, which writes `m` independent
  draws from an empirical law as a uniform index map
  (`TauCeti/Probability/PopulationSampling/Finite.lean`).
- **Fourier inversion:** `MeasureTheory.Measure.charFunDensity`, `continuous_charFunDensity` and
  `eq_withDensity_charFunDensity` (`TauCeti/Analysis/Bochner/CharFun/Inversion.lean`): a finite
  law on `ℝ` with integrable characteristic function has the continuous density
  `charFunDensity`.
- **Bounded Lipschitz convergence:**
  `TauCeti.tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/BoundedLipschitz.lean`): on a Polish space,
  weak convergence is convergence to `0` of the supremum defining `boundedLipschitzDist` with
  bound `R > 0`.
- **Tilting:** `TauCeti.mgf_tilted_mul` and `TauCeti.cgf_tilted_mul`
  (`TauCeti/Probability/Moments/Tilted.lean`).
- **Distribution functions and quantiles:** `MeasureTheory.Measure.continuous_cdf_of_noAtoms` and
  `MeasureTheory.Measure.leftLim_cdf` (`TauCeti/Probability/Cdf.lean`),
  `MeasureTheory.Measure.quantile` and `measurePreserving_quantile`
  (`TauCeti/Probability/Quantile.lean`).
- **Chi-squared laws:** `TauCeti.Probability.chiSquaredMeasure` with
  `isProbabilityMeasure_chiSquaredMeasure`.

### From MathematicalStatisticsFoundations

[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) supplies:
- 8.1, the adapters to `TendstoInDistribution` and `TendstoInMeasure`, and the probability
  instance of `chiSquaredMeasure k` for natural `k` (local copy
  `isProbabilityMeasure_chiSquaredMeasure_nat`);
- 8.2, `IsBoundedInProbability`, measured by the outer measure;
- 8.3–8.4, the algebra of convergence in probability, Slutsky's lemma without separability and
  the delta method;
- 8.5, `IsIndependentIdenticallyDistributed` and the weak law;
- 9.1, the sample mean `sampleMean`, the empirical distribution function `empiricalCdf` and the
  sample quantile;
- 9.2, the distribution-function bound `|cdf P t - cdf Q t| ≤ tvDist P Q / 2`.

### From MathematicalStatisticsAsymptotic

[MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md) owns the
empirical-process toolkit and the central limit theorems that Mathlib lacks. This roadmap consumes exactly:
- **outer integrals and weak convergence:** `outerIntegral` and `innerIntegral` (2.1),
  `TendstoInOuterDistribution` and asymptotic measurability (outer minus inner integrals of
  bounded continuous functions tend to `0`), with the characterization of weak convergence to a
  separable limit by the bounded Lipschitz supremum of outer expectations, the continuous mapping
  theorem and Slutsky's lemma for outer probability (2.2). The real-valued
  `outerIntegral` is used here only on bounded functions, where an integrable measurable majorant
  exists; the outer Markov inequality is taken in the `ℝ≥0∞`-valued form, the extended outer
  expectation of a nonnegative function with its Markov inequality (2.1);
- **`ℓ^∞(T)`:** `Linfty T = lp (fun _ : T ↦ ℝ) ∞` with its Borel σ-algebra, `liftLinfty` and
  `marginal` (2.3);
- **Brownian bridges:** `IsBrownianBridgeLaw P f L` and the uniqueness of tight laws on `ℓ^∞(T)`
  with given marginals (2.3, 2.4), the classical Donsker theorem for the empirical distribution
  function of the uniform law with its Brownian bridge limit (3.4), and the asymptotic uniform
  equicontinuity of a sequence converging to a tight Gaussian limit, with the standard-deviation
  semimetric (2.3);
- **Glivenko–Cantelli** for the empirical distribution function (3.4);
- **Hadamard differentiability** `HasHadamardDerivWithinAt φ dom D₀ φ' θ` (4.1) and the
  functional delta method (4.2);
- **central limit theorems:** the Lindeberg–Feller theorem for triangular arrays and the
  multivariate central limit theorem in `EuclideanSpace ℝ (Fin d)` (1.2);
- **Gaussian quadratic forms:** the chi-squared law of `zᵀ Σ⁺ z` for `z ~ N(0, Σ)` with `Σ` of
  rank `q` (1.3).

The section numbers in this list are those of MathematicalStatisticsAsymptotic.

## How to read the build

Layers 1–5 are about laws of sums. Layer 1 fixes the distances in which the statements of all other
layers are measured, and the meaning of convergence of a random law. Layer 2 turns a bound on the
difference of characteristic functions near the origin into a bound on the difference of
distribution functions; every quantitative result of Layers 2 and 4 is one application of the
smoothing inequality of 2.2, with the remaining work in bounding characteristic functions. Layer 3
supplies the bounds away from the origin: a nonlattice law has `|φ| < 1` on compact sets avoiding
`0`, and Cramér's condition makes this uniform at infinity. Layer 4 combines the two: Taylor
expansion of `log φ` near the origin produces the Edgeworth polynomials, and Layer 3 controls the
rest. Layer 5 is Layer 4 applied to a tilted law at its mean.

Layers 6–8 are resampling. Layer 6 defines the bootstrap as a Markov kernel, so that a bootstrap
law is a random law in the sense of Layer 1; its consistency theorems are limit theorems for
triangular arrays drawn from the empirical law, applied along almost every data sequence.
Layer 7 treats the resampling schemes that do not draw from the empirical law. Layer 8 applies
Layer 4 twice, to the statistic and to its bootstrap version, and compares the expansions: the
studentized statistic is asymptotically pivotal, so the leading terms agree to `O_P(n⁻¹)`.

Layer 9 is independent of Layers 1–8: it is finite-dimensional linear algebra on the simplices.

The layers are in build order: each layer needs only earlier layers and the suppliers.

## Layer 1: distances and conditional laws

### 1.1 The Kolmogorov distance

- `kolmogorovDist P Q = ⨆ t, |cdf P t - cdf Q t|`, for probability measures on `ℝ`; Mathlib's
  `cdf` is the distribution function only for a probability measure, and every statement here
  assumes one. The supremum is over values in `[0, 1]`, so it is a real supremum, not the junk
  value of an unbounded one. It lies in `[0, 1]`, is symmetric, satisfies the triangle
  inequality, and vanishes iff `P = Q` (Mathlib `MeasureTheory.Measure.eq_of_cdf`).
- `kolmogorovDist P Q ≤ tvDist P Q / 2`, from the distribution-function bound of Foundations 9.2.
- The supremum may be taken over rational `t`, by right continuity of `cdf`. Hence for a random
  law `ω ↦ L ω` with `ω ↦ cdf (L ω) t` measurable for every `t`, the distance
  `ω ↦ kolmogorovDist (L ω) Q` is measurable.
- Invariance: for `a > 0` and `b`, the Kolmogorov distance of the images under `x ↦ a x + b`
  equals that of `P` and `Q`. More generally the same holds for any increasing homeomorphism of
  `ℝ`.
- The jump bound: if `P {x₀} = a` and `cdf Q` is continuous at `x₀`, then
  `kolmogorovDist P Q ≥ a / 2`. The two values `cdf P x₀` and `lim_{t ↑ x₀} cdf P t = P (Iio x₀)`
  (Tau Ceti `MeasureTheory.Measure.leftLim_cdf`) differ by `a`, and `cdf Q` takes one value at
  `x₀`.
- **Pólya's theorem** (`tendsto_kolmogorovDist_iff_tendsto`): for probability laws `Pᵢ`, `Q` on
  `ℝ` along a countably generated filter, with `cdf Q` continuous, `kolmogorovDist Pᵢ Q → 0` iff
  `Pᵢ → Q` in the `ProbabilityMeasure` topology. The direction from weak convergence to uniform
  convergence is van der Vaart, Lemma 2.11, p. 12: a finite grid `t₀ < … < t_k` with
  `cdf Q (tⱼ₊₁) - cdf Q (tⱼ) < ε` and monotonicity between grid points. The other direction holds
  for every `Q`: uniform convergence of distribution functions implies convergence at continuity
  points.

*Needs:* Foundations 9.2; Mathlib `cdf`, `MeasureTheory.Measure.eq_of_cdf`, the portmanteau
theorem for `ProbabilityMeasure` on `ℝ`; Tau Ceti `MeasureTheory.Measure.leftLim_cdf`.

**Checks.**

- `kolmogorovDist δ₀ N(0, 1) = 1/2`, attained at `t = 0`, where `cdf δ₀` jumps from `0` to `1`
  and `Φ(0) = 1/2`.
- The jump bound with `a = 1` is attained by `δ₀` and `N(0, 1)`.
- `kolmogorovDist` (negative control): `δ_{1/n} → δ₀` weakly while `kolmogorovDist δ_{1/n} δ₀ = 1`
  for every `n`, so the continuity hypothesis in Pólya's theorem cannot be dropped.
- `kolmogorovDist` (negative control): for the finite measures `2 • δ₀` and `2 • δ₁` the
  supremum of `|2 · 1{t ≥ 0} - 2 · 1{t ≥ 1}|` is `2`, while `kolmogorovDist` is at most `1`,
  since Mathlib's `cdf` takes values in `[0, 1]`; so the definition is not the distance of
  distribution functions of measures that are not probability measures.
- `kolmogorovDist N(0, 1) N(0, 4) = Φ(c) - Φ(c/2) = 0.1613`, at the crossing point `c` of the
  densities `φ(t)` and `φ(t/2)/2`, `c² = (8/3) log 2`.
- `kolmogorovDist N(b, 1) N(b, 4) = 0.1613` and `kolmogorovDist N(0, a²) N(0, 4a²) = 0.1613` for
  every `b` and `a > 0`, by invariance.

### 1.2 The bounded Lipschitz distance

- `boundedLipschitzDist P Q`, for finite measures on a pseudometric space with a measurable
  structure, is
  `⨆ (f) (_ : LipschitzWith 1 f) (_ : ∀ y, ‖f y‖ ≤ 1), ENNReal.ofReal |∫ f dP - ∫ f dQ|`,
  a supremum in `ℝ≥0∞`. Every test function is bounded and continuous, so for finite measures
  on a Borel space every integral in the supremum is finite.
- For probability measures on a metric space with its Borel σ-algebra: it is at most `2`, at
  most `tvDist P Q`, symmetric, satisfies the triangle inequality, and vanishes iff `P = Q`
  (bounded Lipschitz functions approximate indicators of closed sets).
- Metrization is supplied: on a Polish space with its Borel σ-algebra, `Pᵢ → P` in the
  `ProbabilityMeasure` topology iff `boundedLipschitzDist Pᵢ P → 0`, which is Tau Ceti's
  `tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz` at `R = 1`
  read through the definition (van der Vaart–Wellner, Thm 1.12.4, p. 72, for separable limits on
  any metric space). It is not a target.
- On `ℝ`, a uniform modulus: for every probability law `ν` and every `ε > 0` there is `δ > 0` such
  that `kolmogorovDist Q ν < δ` implies `boundedLipschitzDist Q ν < ε` for every probability law
  `Q`. Choose `M` with `ν (|x| > M) < ε/8`, integrate by parts on `[-M, M]`, and bound the tails
  by `ν (|x| > M) + 2 δ`.

*Needs:* 1.1; Mathlib `LipschitzWith`, `tvDist`; Tau Ceti
`tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz`.

**Checks.**

- `boundedLipschitzDist δ₀ δ_a = min a 2` on `ℝ` for `a > 0`, attained by
  `f(y) = max (-1) (min 1 (y - a/2))` (van der Vaart–Wellner, p. 72,
  `d_BL(δ_x, δ_y) = d(x, y) ∧ 2`).
- `boundedLipschitzDist δ_{1/n} δ₀ = 1/n → 0`, while the Kolmogorov distance stays `1` (1.1).
- `boundedLipschitzDist` (negative control): it is not the total variation distance, since
  `tvDist δ₀ δ_a = 2` for every `a ≠ 0`.
- `boundedLipschitzDist` (negative control): the bound `‖f‖ ≤ 1` matters; over all `1`-Lipschitz
  `f` the supremum for `δ₀` and `δ_a` is `a`, the Wasserstein distance, which exceeds `2` for
  `a > 2`.

### 1.3 Random laws and conditional convergence

- A random law is a map `L : Ω → Measure Y`; no measurability in `ω` is required.
  `TendstoInLawInProbability μ L ν` and `TendstoInLawAlmostSurely μ L ν` are as in the
  Conventions.
- If every `ω ↦ boundedLipschitzDist (L n ω) ν` is a.e.-measurable, the almost sure mode
  implies the in-probability mode for a probability `μ`, by dominated convergence. Without
  measurability this implication is not claimed: outer measure is not continuous along
  decreasing sequences of nonmeasurable sets.
- **Kolmogorov form** (`tendstoInLawInProbability_iff_kolmogorovDist`): for random probability
  laws on `ℝ` and `ν` with continuous distribution function, `TendstoInLawInProbability μ L ν`
  iff `kolmogorovDist (L n ω) ν → 0` in outer probability, and `TendstoInLawAlmostSurely μ L ν`
  iff `kolmogorovDist (L n ω) ν → 0` outer almost surely. The proof is deterministic: the uniform
  modulus of 1.2 gives one direction, and the other is the modulus "for every `ε > 0` there is
  `δ > 0` with `boundedLipschitzDist Q ν < δ → kolmogorovDist Q ν < ε`", which follows from
  Pólya's theorem and the metrization of 1.2 by contradiction along a sequence. Monotonicity of
  outer measure then transfers the statements.
- For random probability laws on `ℝ` compared with a deterministic sequence of probability laws
  `νₙ → ν`, where `ν` has a continuous distribution function, `kolmogorovDist (L n ω) νₙ → 0` in
  outer probability iff `kolmogorovDist (L n ω) ν → 0` in outer probability, since
  `kolmogorovDist νₙ ν → 0` by Pólya's theorem, and by the triangle inequality.

*Needs:* 1.1, 1.2.

**Checks.**

- `TendstoInLawInProbability`: the constant random law `L n ω = N(1/n, 1)` converges to
  `N(0, 1)`, with Kolmogorov distance `Φ(1/(2n)) - Φ(-1/(2n))`, attained at `t = 1/(2n)`.
- `TendstoInLawInProbability`: for any set `A ⊆ Ω`, measurable or not, `L n ω = δ_{1_A(ω)/n}`
  converges to `δ₀`, since `boundedLipschitzDist (L n ω) δ₀ ≤ 1/n` at every `ω`; no measurability
  in `ω` enters.
- `TendstoInLawInProbability` (negative control): `L n ω = δ_{1/n}` converges to `δ₀`, while its
  Kolmogorov distance to `δ₀` stays `1`, so the continuity hypothesis of the Kolmogorov form is
  needed.
- `TendstoInLawAlmostSurely`: the constant random law `L n ω = N(1/n, 1)` converges to `N(0, 1)`
  at every `ω`.
- `TendstoInLawAlmostSurely` (negative control): under Lebesgue measure on `[0, 1]`, the random
  law `L n ω = δ_{Zₙ(ω)}`, for the typewriter sequence `Zₙ` of indicators of dyadic intervals
  sweeping `[0, 1]`, converges to `δ₀` in outer probability, since `μ {Zₙ ≠ 0}` is the length of
  the `n`th interval, but at no `ω`, since `Zₙ(ω) = 1` infinitely often.
- `TendstoInLawAlmostSurely` (negative control): for a set `A ⊆ [0, 1]` of outer Lebesgue measure
  `1` and inner measure `0`, the random law `L n ω = δ_{1_A(ω)}` does not converge to `δ₀` outer
  almost surely, since its exceptional set `A` lies in no null set, nor in outer probability,
  since `μ {ω | 1/2 < boundedLipschitzDist (L n ω) δ₀} = μ A = 1`; with inner probability both
  would read `0`.

### Examples

- Point masses `δ_a` and the normal laws `N(b, a²)` serve throughout. For `a ≠ 0` the Kolmogorov
  distance of `δ₀` and `δ_a` is `1` and their bounded Lipschitz distance is `min |a| 2`; the
  Kolmogorov distance of `N(0, 1)` and `N(b, 1)` is `Φ(|b|/2) - Φ(-|b|/2)` (1.1, 1.2).
- The typewriter sequence on `[0, 1]` separates the two modes of 1.3.

### Dependencies

Mathlib, Foundations 9.2, and Tau Ceti's bounded Lipschitz characterization and `leftLim_cdf`.

## Layer 2: smoothing and the Berry–Esseen theorem

### 2.1 Fourier–Stieltjes transforms and the Pólya density

- `fourierStieltjes g t = ∫ exp (i t x) g x dx` for an integrable real `g`. For `g ≥ 0` with
  `∫ g = 1` it is `charFun` of `volume.withDensity (ENNReal.ofReal ∘ g)`. It is linear in `g`,
  bounded by `∫ |g|`, and for `g` with `x g` integrable it is differentiable with derivative
  `i ∫ x exp (i t x) g x dx`.
- The transform of `φ` is `exp (-t²/2)` (Mathlib `charFun_gaussianReal`), and the transform of
  `He_k φ` is `(i t)^k exp (-t²/2)` (repeated integration by parts, using
  `(-d/dx)^{k} φ = He_k φ`). Hence `x ↦ (p.eval x) φ(x)` has transform `q(i t) exp (-t²/2)` for
  the polynomial `q` determined by `p` through the Hermite expansion, and `∫ (p.eval x) φ x dx`
  is the constant term of `p` in the Hermite basis.
- **The Pólya density** (`polya_density_charFun_tail`): `h_L(x) = (1 - cos L x) / (π L x²)`,
  `L > 0`, is a probability density with characteristic function `(1 - |t|/L)⁺`, and
  `∫_{|x| > a} h_L ≤ 4/(π L a)` for `a > 0` (Durrett, Example 3.3.15, p. 113, at `L = 1`, with
  the scaling `x ↦ L x`; the tail bound is in the proof of Lemma 3.4.18, p. 137).

*Needs:* Mathlib `charFun`, `charFun_gaussianReal`, `Polynomial.hermite`, integration by parts.

**Checks.**

- `fourierStieltjes φ t = exp (-t²/2)`, which is `charFun (gaussianReal 0 1) t`.
- `fourierStieltjes ((X³ - 3X).eval · φ) 1 = i³ e^{-1/2} = -0.6065 i`, the case `k = 3` of the
  Hermite rule.
- `fourierStieltjes ((X² - 1).eval · φ) 0 = 0`: the signed density `He₂ φ` has total mass `0`,
  the constant term of `He₂` in the Hermite basis.
- `fourierStieltjes` (negative control): for `g = 1_{[0, 1]}` the value at `t = π` is
  `∫₀¹ exp (i π x) dx = 2i/π`; the kernel `exp (-i t x)` would give `-2i/π`.
- `fourierStieltjes` (negative control): for `g = 1`, which is not integrable, Lean's Bochner
  integral returns `0` at every `t`, including `t = 0`, where `∫ g` would be infinite; every
  statement about `fourierStieltjes g` assumes `g` integrable.

### 2.2 Esseen's smoothing inequality

**Smoothing inequality** (`abs_cdf_sub_integral_le_smoothing`): let `P` be a probability law on
`ℝ` with a first moment, and `g` an integrable real function with `∫ g = 1`, `x g` integrable and
`|g| ≤ m`. Then for every `T > 0` and `x`,

`|cdf P x - ∫_{-∞}^{x} g|`
`≤ π⁻¹ ∫_{-T}^{T} |charFun P t - fourierStieltjes g t| / |t| dt + 24 m / (π T)`.

The integral is finite, so it is not Lean's junk value `0` of a nonintegrable integrand: the first
moments make both transforms Lipschitz with value `1` at `0`, so the integrand
`|charFun P t - ĝ t| / |t|` is bounded on `[-T, T]` (with the value `0` at `t = 0`, from
`x / 0 = 0`).

Locators: Durrett, p. 138, the inequality obtained from Lemmas 3.4.18 and 3.4.19, for `G` a
distribution function with `G' ≤ m`; Petrov, Thm V.2, p. 109, for `G` differentiable of bounded
variation with `|G'| ≤ m`, with an unspecified constant in place of `24/π`; Bhattacharya–Ranga Rao,
Lemma 12.2, pp. 101–102, for a signed `G` with first moments and a general smoothing kernel. The
constant `24/π` for signed `g` is *by the same argument* as Durrett's: his proof of Lemma 3.4.18
uses only that `G` is continuous with limits `0` and `1` at `∓∞` and `|G(x + s) - G(x)| ≤ m |s|`,
and that `cdf P` is monotone. Proof route: convolve `P - G` with the Pólya density `h_T`; the
transform of the convolution is supported in `[-T, T]`, so Fourier inversion gives the integral
term; the concentration of `h_T` near `0` (2.1) and `|g| ≤ m` give the term `24 m/(π T)`. Tau Ceti's
inversion theorem `eq_withDensity_charFunDensity` is stated for finite measures, so `g` enters
through a signed corollary, proved first: split `g = g⁺ - g⁻` into integrable nonnegative parts,
apply the inversion theorem to the finite measures `P * h_T`, `(g⁺ dx) * h_T` and `(g⁻ dx) * h_T`,
whose transforms `charFun P · ĥ_T` and `ĝ^± · ĥ_T` are bounded and supported in `[-T, T]`, hence
integrable, and recombine by linearity. The result is that `(P - G) * h_T` has the density
`(2π)⁻¹ ∫_{-T}^{T} exp (-i t x) (charFun P t - ĝ t) ĥ_T(t) dt`.

*Needs:* 2.1; Tau Ceti `eq_withDensity_charFunDensity`.

### 2.3 The Berry–Esseen theorem

- **Berry–Esseen** (`abs_cdf_sum_sub_cdf_gaussian_le`): let `X₁, …, Xₙ` be independent centred
  real variables with finite third moments and `Bₙ = ∑ E Xᵢ² > 0`. Then for every `x`,

  `|P(∑ Xᵢ / √Bₙ ≤ x) - Φ(x)| ≤ 2.75 · ∑ E|Xᵢ|³ / Bₙ^{3/2}`.

  (Bhattacharya–Ranga Rao, Thm 12.4, p. 104, whose Liapounov ratio `l₃,ₙ` is
  `∑ E|Xᵢ|³ / Bₙ^{3/2}`; Petrov, Thm V.3, p. 111, with an unspecified absolute constant.) Proof
  route: the smoothing inequality with `g = φ` and `T` proportional to the inverse Lyapunov ratio,
  and the bound `|E exp (i t Sₙ) - exp (-t²/2)| ≤ C L |t|³ exp (-t²/4)` for `|t| ≤ 1/(4L)`, where
  `L` is the Lyapunov ratio, from the third-order Taylor bound on each factor (Mathlib
  `taylor_charFun_two` with the third-moment remainder).
- **i.i.d. form** (`abs_cdf_iid_sum_sub_cdf_gaussian_le`): for an i.i.d. sequence with law `P`,
  `E X = 0`, `E X² = σ² > 0` and `ρ = E |X|³ < ∞`, and every `n ≥ 1` and `x`,
  `|P(Sₙ/σ ≤ x) - Φ(x)| ≤ 2.75 ρ / (σ³ √n)`, for the standardized sum `Sₙ` of the first `n`
  observations. This is the case of equal summands of the previous item (Durrett, Thm 3.4.17,
  p. 136, with the constant `3`). The case `n = 0` is excluded: there the right side is the junk
  value `ρ / 0 = 0`.
- **Sharpness** (`kolmogorovDist_rademacher_sum_ge`): for i.i.d. Rademacher summands and every
  `k`, the Kolmogorov distance between the law of `S_{2k}` and `N(0, 1)` is at least
  `P(S_{2k} = 0)/2`, by the jump bound of 1.1; and for every `ε > 0`, eventually
  `√(2k) · kolmogorovDist ≥ 1/√(2π) - ε`, since `√(2k) P(S_{2k} = 0)/2 → 1/√(2π)` by Stirling's
  formula. So the rate `n^{-1/2}` cannot be improved under a third moment (Durrett, remarks
  after Thm 3.4.17, p. 136).

*Needs:* 1.1, 2.2; Mathlib `iIndepFun`, `taylor_charFun_two`, `charFun_gaussianReal`; Foundations
8.5.

### Examples

- The Pólya density with `L = 1`: `∫ (1 - cos x)/(π x²) dx = 1`, since `∫ (1 - cos x)/x² dx = π`,
  and its characteristic function at `t = 1/2` is `1/2`; at `|t| ≥ 1` it vanishes, which is why the
  smoothing integral is over `[-T, T]`.
- Berry–Esseen for the Rademacher law at `n = 100`: the bound is `2.75/10 = 0.275`, and the jump
  of `Sₙ/√n` at `0` has mass `P(S₁₀₀ = 0) = 0.07959`, so the supremum is at least `0.03979`.
- The smoothing inequality for `P = δ₀` and `g = φ` at `x = 0`: the left side is `1/2`, and the
  right side, with `m = φ(0) = 0.3989`, is `3.189` at `T = 1` and `1.597` at `T = 5`.

### Dependencies

Mathlib, Tau Ceti's Fourier inversion, Foundations 8.5.

## Layer 3: lattice laws and Cramér's condition

### 3.1 Lattice laws

- `IsLatticeLaw P`: there are `a` and `h > 0` with `P (a + h ℤ)ᶜ = 0`. A span of `P` is such an
  `h`. A nondegenerate lattice law has a largest span, its maximal span, which is Durrett's span.
  Point masses are lattice laws under this definition; Durrett calls them degenerate and reserves
  "lattice" for the nondegenerate case.
- **Characterization** (`isLatticeLaw_iff_exists_norm_charFun_eq_one`): a law on `ℝ` is lattice
  iff `‖charFun P t‖ = 1` for some `t ≠ 0`. If `P` is nondegenerate, the set of such `t` is
  `(2π/h) ℤ` for its maximal span `h`; if `P` is a point mass it is all of `ℝ`
  (Durrett, Thm 3.5.2, p. 140). Proof: `|φ(t)| = 1` iff `exp (i t X)` is a.s. constant, iff `X`
  is a.s. in `b + (2π/t) ℤ`.
- **Nonlattice bound** (`exists_lt_one_norm_charFun_le_of_not_isLatticeLaw`): if `P` is not
  lattice, then for every `δ > 0` and `T` there is `c < 1` with `‖charFun P t‖ ≤ c` for
  `δ ≤ |t| ≤ T`. Proof route: `‖charFun P t‖ < 1` for `t ≠ 0` by the characterization, and
  continuity of `charFun` on the compact set `δ ≤ |t| ≤ T`.

*Needs:* Mathlib `charFun`, `continuous_charFun`.

**Checks.**

- `IsLatticeLaw`: the Rademacher law is lattice with `a = -1` and maximal span `2`, and
  `|charFun P t| = |cos t|` equals `1` exactly on `π ℤ = (2π/2) ℤ`.
- `IsLatticeLaw`: the Bernoulli law `(δ₀ + δ₁)/2` has maximal span `1`, and also span `1/2`.
- `IsLatticeLaw`: a point mass `δ_b` is lattice, with `‖charFun δ_b t‖ = 1` for every `t`.
- `IsLatticeLaw` (negative control): `(δ₀ + δ_{√2})/2` is lattice with `a = 0` and `h = √2`, and
  `charFun` at `t = π √2` is `(1 + exp (2πi))/2 = 1`; a convention requiring `h = 1` or integer
  atoms would call it nonlattice.
- `IsLatticeLaw` (negative control): `(δ₀ + δ₁ + δ_{√2})/3` is not lattice, since a lattice
  `a + h ℤ` containing `0`, `1` and `√2` has `1/h` and `√2/h` integers, so `√2` rational.
- `IsLatticeLaw`: `N(0, 1)` is not lattice, as `|charFun| = exp (-t²/2) < 1` for `t ≠ 0`.

### 3.2 Cramér's condition

- `SatisfiesCramerCondition P` for a law on a real inner product space:
  `∃ c < 1, ∃ R, ∀ t, R ≤ ‖t‖ → ‖charFun P t‖ ≤ c`, which is
  `limsup_{‖t‖ → ∞} ‖charFun P t‖ < 1` (Hall, (2.34), p. 56).
- Cramér's condition implies, in dimension one, that `P` is not lattice, since a lattice law has
  `|φ| = 1` on an unbounded set. On a space of dimension at least `1` it implies that `P` is not
  carried by an affine hyperplane, so the covariance of a square-integrable `P` is nonsingular.
  On the zero space every law satisfies Cramér's condition vacuously, since no `t` has
  `‖t‖ ≥ R > 0`; the consequences below assume dimension at least `1`.
- **Absolutely continuous component** (`satisfiesCramerCondition_of_withDensity_le`): on a finite-
  dimensional space, if `volume.withDensity f ≤ P` for a nonzero `volume.withDensity f`, then `P`
  satisfies Cramér's condition. With `α = ∫ f` the mass of the component,
  `‖charFun P t‖ ≤ (1 - α) + ‖∫ exp (i⟪x, t⟫) f x dx‖`, and the last term tends to `0` by the
  Riemann–Lebesgue lemma; so the limsup is at most `1 - α` (Hall, p. 57, proved on pp. 65–66).
- **Moment curve** (`satisfiesCramerCondition_map_powers`): if a real `W` has a law with a nonzero
  absolutely continuous component, then `(W, W², …, W^d)` satisfies Cramér's condition (Hall,
  p. 57, proved on pp. 66–67). Proof route: as in the previous item it suffices that
  `∫ exp (i ∑ tⱼ wʲ) f(w) dw → 0` as `‖t‖ → ∞`. Approximate `f` in `L¹` by a step function on
  finitely many bounded intervals; this reduces the claim to the indicator of one bounded interval
  `S`, with no lower bound on `f` needed (the component may be carried by a nowhere dense set).
  On `S`, pass to a subsequence along which `t/‖t‖` converges to some `τ` on the unit sphere; the
  polynomial `∑ τⱼ wʲ` is nonconstant, so `S` splits into at most `d` intervals on each of which it
  and, for large `‖t‖`, `∑ (tⱼ/‖t‖) wʲ` are strictly monotone, with endpoints converging. A change
  of variables on each piece and the Riemann–Lebesgue lemma give the limit `0`.
- **Atoms** (`exists_pos_iSup_measure_singleton_le`): if `P` on `ℝ^d`, `d ≥ 1`, satisfies Cramér's
  condition, then for some `ε > 0`, `sup_x P(X̄ₙ = x) = O(exp (-ε n))` (Hall, Thm 2.3, p. 57, proved
  on pp. 67–68). Proof route: an atom of `X̄ₙ` gives atoms of each coordinate, and each coordinate
  satisfies Cramér's condition, so `d = 1`. Then `C₁ = sup_{|t| ≥ 1} |φ(t)| < 1` by Cramér's
  condition and the nonlattice bound of 3.1. Put `η = C₁^{n/2}` and add an independent `η² N`
  with `N` standard normal to `n X̄ₙ`; Fourier inversion bounds the density of the sum by a
  constant `C₂` independent of `n`, so an atom of `n X̄ₙ` has mass at most
  `2 C₂ η + P(|N| > η⁻¹) = O(η)`.

*Needs:* 3.1; Mathlib `tendsto_integral_exp_inner_smul_cocompact`, `charFun`.

**Checks.**

- `SatisfiesCramerCondition`: `N(0, 1)` satisfies it with any `c ∈ (0, 1)`, taking `R` with
  `exp (-R²/2) ≤ c`.
- `SatisfiesCramerCondition`: the uniform law on `[0, 1]` satisfies it with `c = 1/2` and `R = 4`,
  as `|charFun P t| = |sin (t/2)| / |t/2| ≤ 2/|t|`.
- `SatisfiesCramerCondition`: the mixture `(δ₀ + N(0, 1))/2` satisfies it with every `c > 1/2`
  and with no `c ≤ 1/2`, as `|φ(t)| = (1 + exp (-t²/2))/2 > 1/2`; the bound `1 - α` of the
  absolutely continuous component is attained.
- `SatisfiesCramerCondition` (negative control): a point mass fails it, since `‖charFun‖ = 1`.
- `SatisfiesCramerCondition` (negative control): `(δ₀ + δ₁ + δ_{√2})/3` is nonlattice (3.1) but
  fails it: for the infinitely many integers `q` with `|q √2 - p| < 1/q` (Dirichlet),
  `charFun P (2π q) = (2 + exp (2πi q √2))/3` tends to `1`. Nonlattice does not imply Cramér.
- `SatisfiesCramerCondition` (negative control): on `EuclideanSpace ℝ (Fin 0)` the point mass
  `δ₀` satisfies it, with `c = 0` and `R = 1`, while the mean of `n` draws has an atom of mass `1`
  for every `n`; so the atom bound needs `d ≥ 1`.

### Examples

- The Rademacher law, the Bernoulli law `(δ₀ + δ₁)/2` and the three-point law
  `(δ₀ + δ₁ + δ_{√2})/3` are the lattice and nonlattice discrete examples (3.1, 3.2).
- `N(0, 1)`, the uniform law on `[0, 1]` and the mixture `(δ₀ + N(0, 1))/2` satisfy Cramér's
  condition, the last with `limsup |φ| = 1/2`, the mass of its atom (3.2).

### Dependencies

Mathlib.

## Layer 4: Edgeworth expansions

### 4.1 Edgeworth polynomials

- `edgeworthApproximation p j n x = Φ(x) + φ(x) ∑_{r=1}^{j} n^{-r/2} (p r).eval x`, for a family
  `p : ℕ → Polynomial ℝ`. At `n = 0` Lean's `0 ^ (-r/2)` is `0` and the approximation is `Φ`; every
  statement uses `n ≥ 1`.
- **Cumulants.** `cumulant P k` is the `k`th cumulant of a law on `ℝ`, defined from the moments
  `mₖ = ∫ x ^ k ∂P` by the formal identity `log (1 + ∑ⱼ mⱼ (it)ʲ/j!) = ∑ⱼ κⱼ (it)ʲ/j!` (Hall,
  (2.6), p. 42), in the coefficient form `κ_{r+1} = m_{r+1} - ∑_{k<r} C(r, k) κ_{k+1} m_{r-k}`,
  with `κ₀ = 0`. If `P` has a finite `k`th moment then `κ₁, …, κₖ` are its cumulants; the higher
  values involve Lean's junk value `0` of nonintegrable moments and no statement uses them. For a
  standardized law `κ₃ = m₃` and `κ₄ = m₄ - 3`.
- **The polynomials of a standardized sum.** For a cumulant sequence `κ`, `edgeworthCharPoly κ r`
  is the polynomial `r_r` defined by the formal expansion in `u`

  `exp (∑_{k ≥ 3} κ_k (i t)^k u^{k-2} / k!) = 1 + ∑_{r ≥ 1} r_r(i t) u^r`

  (Hall, (2.7), p. 42), computed by the recursion `r · r_r = ∑_{k=1}^{r} k g_k r_{r-k}`,
  `g_k = κ_{k+2} X^{k+2}/(k+2)!`, that `f' = g' f` gives for `f = exp g`. `edgeworthPoly κ r` is
  the CDF correction `p_r`, defined by `p_r(x) φ(x) = r_r(-d/dx) Φ(x)` (Hall, (2.13)–(2.14),
  p. 44): since `(-d/dx)ᵏ Φ = -Heₖ₋₁ φ` for `k ≥ 1`, it is `-∑_k c_k He_{k-1}` for
  `r_r = ∑_k c_k Xᵏ`. It is used for `r ≥ 1`, where `r_r` has no constant term. The first two are

  `p₁(x) = -(κ₃/6) (x² - 1)` and
  `p₂(x) = -x ((κ₄/24) (x² - 3) + (κ₃²/72) (x⁴ - 10 x² + 15))`

  (Hall, (2.15)–(2.16), p. 45).
- **Properties of `p_r`** (`fourierStieltjes_edgeworthPoly`): for `r ≥ 1`, `p_r` has degree at most
  `3r - 1`, is even for odd `r` and odd for even `r`, and depends only on `κ₃, …, κ_{r+2}` (Hall,
  p. 42 for the dependence, and p. 45, where `r_r` has degree `3r` and the parity of `r`). The
  density correction is `(p_r φ)' = P_r φ` with `P_r = p_r' - X p_r = ∑_k c_k Heₖ`, that is
  `r_r(-d/dx) φ`, and `fourierStieltjes (P_r φ) t = r_r(i t) exp (-t²/2)`. The degree bounds are not
  equalities: for a Gaussian law every `κ_k` with `k ≥ 3` vanishes and `p_r = 0`. Proof route:
  induction on the recursion for the degree, parity and dependence; `He_k = X He_{k-1} - He_{k-1}'`
  (Mathlib `Polynomial.hermite_succ`) for the identity `p_r' - X p_r = ∑_k c_k Heₖ`; and
  `∫ exp (i t x) Heₖ(x) φ(x) dx = (i t)ᵏ exp (-t²/2)`, which is 2.1, from `(-d/dx)ᵏ φ = Heₖ φ`
  (Mathlib `Polynomial.deriv_gaussian_eq_hermite_mul_gaussian`).
- Hence the derivative of `edgeworthApproximation p j n` for `p = edgeworthPoly κ` is the signed
  density `φ(x) (1 + ∑ n^{-r/2} P_r(x))`, with `P₁ = (κ₃/6) He₃`. Its total mass is `1`, since
  the approximation tends to `0` and `1` at `∓∞`; its transform is
  `exp (-t²/2) (1 + ∑ n^{-r/2} r_r(i t))`; and it has every moment. So it is an admissible `g` in
  the smoothing inequality 2.2.

*Needs:* 2.1; Mathlib `Polynomial.hermite`, `Polynomial.deriv_gaussian_eq_hermite_mul_gaussian`,
`gaussianPDFReal`.

**Checks.**

- `edgeworthApproximation`: with `j = 0` the sum is empty and the approximation is `Φ`.
- `edgeworthApproximation`: for every `p`, `j` and `n ≥ 1` it tends to `0` at `-∞` and to `1` at
  `+∞`, since each `(p r).eval x · φ(x)` tends to `0`.
- `edgeworthApproximation` (negative control): it need not be a distribution function. For the
  centred exponential summand (`κ₃ = 2`), `j = 1` and `n = 1`, its value at `x = -2` is
  `Φ(-2) - φ(2) = -0.0312`; so it cannot be stated as the `cdf` of a measure.
- `cumulant`: for `N(0, 1)` the moments `0, 1, 0, 3` give `κ₁, …, κ₄ = 0, 1, 0, 0`.
- `cumulant`: for the exponential law of mean `1`, `mₖ = k!` gives `κₖ = (k - 1)!`, so `κ₃ = 2` and
  `κ₄ = 6`; for the Rademacher law `κ₄ = 1 - 3 = -2`.
- `cumulant` (negative control): `κ₄` of `N(0, 1)` is `0`, while its fourth moment and its fourth
  central moment are both `3`; a definition by central moments gets it wrong.
- `cumulant`: for a point mass at `c`, `κ₁ = c` and `κₖ = 0` for every `k ≥ 2`, while `mₖ = cᵏ`.
- `edgeworthCharPoly`: `r₁ = κ₃ X³/6` and `r₂ = κ₄ X⁴/24 + κ₃² X⁶/72` (Hall, (2.8)–(2.9), p. 43),
  and `r₃ = κ₅ X⁵/120 + κ₃ κ₄ X⁷/144 + κ₃³ X⁹/1296`.
- `edgeworthCharPoly`: for the cumulants of `N(0, 1)`, `r_r = 0` for every `r ≥ 1`.
- `edgeworthCharPoly` (negative control): the power `u^{k-2}`, not `u^k`, puts `κ₃` into `r₁`;
  with `u^k` the coefficient of `u¹` would be `0` for every law. For the Rademacher law (`κ₃ = 0`,
  `κ₄ = -2`), `r₁ = 0` and `r₂ = -X⁴/12`, of degree `4 < 3 · 2`.
- `edgeworthPoly`: `p₁` and `p₂` are Hall's (2.15)–(2.16); for the centred exponential summand
  `p₁ = -(X² - 1)/3` and `p₂ = -X⁵/18 + 11 X³/36 - X/12`, of degree `5 = 3 · 2 - 1`.
- `edgeworthPoly`: for the Rademacher law `p₁ = 0` and `p₂ = He₃/12 = (X³ - 3X)/12`.
- `edgeworthPoly` (negative control): for the centred exponential summand at `n = 10`,
  `P(Sₙ ≤ 0) - 1/2 = 0.04207` (the gamma law of shape `10` below its mean), against
  `n^{-1/2} p₁(0) φ(0) = 0.04205`. The operator `r_r(d/dx)` in place of `r_r(-d/dx)` changes the
  sign of `p₁` and gives `-0.04205`.

### 4.2 The one-term expansion for nonlattice means

- **One-term expansion** (`exists_uniform_edgeworth_expansion_nonlattice`): let `X` be i.i.d. with
  law `P`, `E X = 0`, `E X² = 1`, `E |X|³ < ∞`, and `P` not lattice. Then

  `sup_x |P(Sₙ ≤ x) - Φ(x) + (κ₃ / (6 √n)) (x² - 1) φ(x)| = o(n^{-1/2})`,

  stated in `Suggested.lean` as a bound `e n` with `√n e n → 0`. Locators: Bhattacharya–Ranga Rao,
  Thm 20.8, p. 218, for strongly nonlattice laws in `ℝ^k`, which for `k = 1` are the nonlattice
  laws (p. 221); Petrov, Ch. VI, §5 (Supplement), item 7, p. 185. Proof route: the smoothing
  inequality with `g` the derivative of the one-term approximation and `T = a √n`. On
  `|t| ≤ δ √n`, a third-order expansion of `log charFun P (t/√n)` bounds the integrand by
  `ε(n) (|t|² + |t|⁵) exp (-t²/4)/√n` with `ε(n) → 0`. On `δ √n ≤ |t| ≤ a √n` the nonlattice bound
  of 3.1 gives `|charFun P (t/√n)|ⁿ ≤ cⁿ` with `c < 1`. The term `24 m/(π a √n)` is then at most
  `ε/√n` for `a` large.
- **The sharp constant** (`tendsto_sqrt_mul_kolmogorovDist_nonlattice`): under the same
  hypotheses `√n kolmogorovDist (law of Sₙ) N(0, 1) → |κ₃| / (6 √(2π))` (Bhattacharya–Ranga Rao,
  (20.78), p. 221). Proof route: the one-term expansion and `sup_x |(x² - 1) φ(x)| = φ(0)`.

*Needs:* 1.1, 2.2, 3.1, 4.1; Foundations 8.5.

### 4.3 The one-term expansion for lattice means

- **Lattice expansion** (`exists_uniform_edgeworth_expansion_lattice`): with the hypotheses of 4.2
  except that `P` is carried by `a + h ℤ` with maximal span `h`,

  `sup_x |P(Sₙ ≤ x) - Φ(x) + (κ₃/(6√n)) (x² - 1) φ(x) - (h/√n) S((x √n - n a)/h) φ(x)| = o(n^{-1/2})`

  with the sawtooth `S(y) = ⌊y⌋ - y + 1/2`. Locator: Petrov, Thm VI.6, p. 171, the case `r = 3`,
  by the same argument: Petrov's distribution functions are left-continuous, and for Mathlib's
  right-continuous `cdf` the sawtooth is `⌊y⌋ - y + 1/2`. Proof route: Esseen's argument; the
  sawtooth term is the correction that makes the smoothed approximation match the jumps of
  `P(Sₙ ≤ x)` at the lattice points `(n a + h ℤ)/√n`, and the integral in the smoothing inequality
  is taken over `|t| ≤ π √n / h`, the period of `|charFun P|`.
- **No continuous expansion** (`eventually_le_sqrt_mul_kolmogorovDist_lattice`): with the
  hypotheses of 4.2 except that `P` is carried by `a + h ℤ` for some span `h`, and for every law
  `G` with continuous distribution function, `liminf √n kolmogorovDist (law of Sₙ) G ≥ h φ(0) / 2`,
  stated as: for every `ε > 0`, eventually `√n kolmogorovDist (law of Sₙ) G ≥ h φ(0)/2 - ε`. Proof
  route: let `H ≥ h` be the maximal span. By the lattice expansion with span `H`, the jump of
  `P(Sₙ ≤ x)` at the lattice point `xₙ` nearest `0` is `(H/√n) φ(xₙ) + o(n^{-1/2})`, and
  `xₙ → 0`; the jump bound of 1.1 gives the claim.

*Needs:* 1.1, 2.2, 3.1, 4.1.

### 4.4 Expansions of every order under Cramér's condition

- **Uniform expansion** (`exists_uniform_edgeworth_expansion_of_cramer`): let `X` be i.i.d.
  real, `E X = 0`, `E X² = 1`, `E |X|^k < ∞` for an integer `k ≥ 3`, and let `P` satisfy Cramér's
  condition. Then, with the polynomials `p_r = edgeworthPoly (cumulant P) r` of 4.1,

  `sup_x |P(Sₙ ≤ x) - edgeworthApproximation p (k - 2) n x| = o(n^{-(k-2)/2})`

  (Petrov, Thm VI.4, p. 169), and the weighted form, with the factor `(1 + |x|)^k` inside the
  supremum, holds as well (Petrov, Thm VI.3, p. 169). Petrov's distribution functions are
  left-continuous; the right-continuous form follows from his theorems applied to `-X`, since
  `P(Sₙ ≤ x) = 1 - P(-Sₙ < -x)` and the polynomials of `-X` satisfy `p̃_r(-x) = -p_r(x)`.
- **Several dimensions** (`exists_edgeworth_expansion_of_cramer_euclidean`): let `X` be i.i.d. in
  `EuclideanSpace ℝ (Fin d)` with mean `0`, covariance `V`, `E ‖X‖^s < ∞` for an integer
  `s ≥ 3`, satisfying Cramér's condition; `V` is then nonsingular (3.2). Let `Qₙ` be the law of
  `Sₙ` and `Pᵣ` the signed measure with density `r_r(-∇) φ_V`, where `r_r` is the polynomial of
  the multivariate cumulants defined as in 4.1 from the cumulant tensors of `X`, and `P₀` is
  `N(0, V)`. Then for every `a, c > 0`,

  `sup_A |Qₙ(A) - ∑_{r=0}^{s-2} n^{-r/2} Pᵣ(A)| = o(n^{-(s-2)/2})`,

  the supremum over Borel `A` with `N(0, V)((∂A)^ε) ≤ c ε^a` for all `ε > 0`, where `(∂A)^ε` is the
  `ε`-neighbourhood of the boundary (Bhattacharya–Ranga Rao, Cor 20.4, p. 215, under the
  hypotheses of Thm 20.1, p. 208, with the polynomials of §7, p. 51; the class is stated there for
  `a ≤ 1`, and a set in the class for `a > 1` is in the class for `a = 1` and the constant
  `max c 1`). The same holds uniformly over the measurable convex sets ((20.49), p. 215). The
  signed measures `Pᵣ` are determined by the expansion over convex sets, and `Suggested.lean`
  states them existentially with `P₀ = N(0, V)`.

*Needs:* 2.2, 3.2, 4.1, and for the multivariate case the smoothing inequality over sets of
small boundary, which is proved as in Bhattacharya–Ranga Rao, Thm 20.1, p. 208.

### 4.5 Smooth functions of means and studentized statistics

- **Smooth functions of means** (`exists_edgeworth_expansion_smooth_function_of_means`): let `X`
  be i.i.d. in `EuclideanSpace ℝ (Fin d)` with law `P`, mean `μ`, `E ‖X‖^{j+2} < ∞`, satisfying
  Cramér's condition, and let `A` be measurable, `C^{j+2}` on a neighbourhood of `μ`, with
  `A(μ) = 0` and `σ² = Var[DA(μ) X] > 0`. Then there are polynomials `p₁, …, p_j`, `p_r` of degree
  at most `3r - 1` and even or odd as `r` is odd or even, with

  `sup_x |P(√n A(X̄)/σ ≤ x) - edgeworthApproximation p j n x| = o(n^{-j/2})`

  and

  `p₁(x) = -(A₁ σ⁻¹ + (1/6) A₂ σ⁻³ (x² - 1))`

  (Hall, Thm 2.2 and (2.36), p. 56). Hall's constants (2.31)–(2.33), p. 55, are, in terms of the
  derivatives at `μ` and an independent copy `Y` of `X`, `σ² = E[(DA(μ)(X - μ))²]`,
  `A₁ = ½ E[D²A(μ)(X - μ, X - μ)]` and
  `A₂ = E[(DA(μ)(X - μ))³] + 3 E[D²A(μ)(X - μ, Y - μ) DA(μ)(X - μ) DA(μ)(Y - μ)]`. Proof route
  (Hall, p. 56): the delta-method expansion of `√n A(X̄)` to order `j + 1` reduces it to a
  polynomial in `√n (X̄ - μ)` plus a remainder of order `o(n^{-j/2})` outside an event of that
  probability; the polynomial's distribution function is expanded by integrating the multivariate
  expansion of 4.4 over the sets `{z | poly(z) ≤ x}`, whose boundaries are small.
- **The augmented vector and the plug-in variance.** `augmentedVector x = (x, (x_k x_l)_{k ≤ l})`,
  indexed by `Fin d ⊕ {p : Fin d × Fin d // p.1 ≤ p.2}` so that each product appears once, and
  for a sample `x : Fin n → EuclideanSpace ℝ (Fin d)`,
  `pluginVariance A x = n⁻¹ ∑ᵢ (DA(x̄)(xᵢ - x̄))²`, the sample variance with divisor `n` of the
  linear statistic `DA(x̄)`. It is a smooth function `τ(z)²` of the mean `z` of the augmented
  sample near the mean of `augmentedVector X` (Hall, p. 57).
- **Studentized statistics** (`exists_edgeworth_expansion_studentized`): with
  `Z = augmentedVector X` and `τ(Z̄)² = pluginVariance A (sample X n)`, the same holds for
  `√n A(X̄)/τ(Z̄)` in place of `√n A(X̄)/σ`, with polynomials `q_r`, when `E ‖X‖^{2(j+2)} < ∞`, `Z`
  satisfies Cramér's condition, and `A` is `C^{j+3}` on a neighbourhood of `μ`. Proof route: it is
  the first statement applied to `Z` and the function `B(z) = A(z_X)/τ(z)` (Hall, p. 57), which is
  `C^{j+2}` because `τ` involves `DA`, and whose linearization has variance `1`. Division by
  `τ(Z̄) = 0` gives Lean's `x / 0 = 0`; that event has probability `o(n^{-j/2})`, so the junk value
  does not affect the expansion.
- **The `t` statistic** (`exists_edgeworth_expansion_tStatistic`): let `X` be i.i.d. real with mean
  `m`, variance `σ² > 0`, skewness `γ = E (X - m)³/σ³`, `E X⁶ < ∞`, and let `(X, X²)` satisfy
  Cramér's condition. Then the standardized mean `√n (X̄ - m)/σ` has the expansion with `j = 1` and
  `p₁(x) = -γ (x² - 1)/6`, and the studentized mean `√n (X̄ - m)/τ`, `τ²` the sample variance with
  divisor `n`, has it with `q₁(x) = γ (2x² + 1)/6` (Hall, (2.52), p. 71, and (2.55), p. 72, where
  `A₁ = -γ/2` and `A₂ = -2γ`). It is the first statement for `A(x) = (x - m)/σ` and the studentized
  statement for `A(x) = x - m` in dimension one, where `Z = (X, X²)` and `pluginVariance A x = τ²`.
  `(X, X²)` satisfies Cramér's condition when `X` has a nonzero absolutely continuous component
  (3.2).

*Needs:* 3.2, 4.1, 4.4; Foundations 8.4 (delta method); Mathlib `ContDiffOn`, `fderiv`.

**Checks.**

- `augmentedVector`: for `d = 1` it is `x ↦ (x, x²)`; for `d = 2` it has the five coordinates
  `x₁, x₂, x₁², x₁ x₂, x₂²`, and in general `d + d(d + 1)/2`.
- `augmentedVector`: the law of `augmentedVector X` for `X ~ N(0, 1)` in dimension one satisfies
  Cramér's condition, since `(X, X²)` is the moment curve of 3.2 for a law with a density.
- `augmentedVector` (negative control): indexing the products by all of `Fin d × Fin d` would list
  `x₁ x₂` and `x₂ x₁` separately; the vector would lie in the hyperplane where these coordinates
  agree, its characteristic function would be `1` along the direction that separates them, and no
  law would satisfy Cramér's condition.
- `pluginVariance`: for `d = 1` and `A(x) = x - c` it is `n⁻¹ ∑ (xᵢ - x̄)²`; for the sample
  `(0, 1)` it is `1/4`, not the `1/2` of the divisor `n - 1`.
- `pluginVariance`: for `d = 1`, `A(x) = x²` and the sample `(1, 3)`, `DA(x̄)` is multiplication by
  `2 x̄ = 4` and the value is `16 · 1 = 16`.
- `pluginVariance` (negative control): for `A(x) = x²` and the sample `(-1, 1)`, `x̄ = 0`, so
  `DA(x̄) = 0` and the plug-in variance is `0` although the sample variance is `1`; there the
  studentized statistic is Lean's junk value `0`, which is why its expansion needs that event to
  be small.

### 4.6 The local expansion of densities

- **Local expansion** (`exists_local_edgeworth_expansion_density`): let `X` be i.i.d. real with
  `E X = 0`, `0 < σ² = E X²`, `E X⁴ < ∞`, and `|charFun P|^ν` integrable for some integer `ν ≥ 1`.
  Then for `n ≥ ν` the law of `Sₙ` has a bounded continuous density `qₙ`, and

  `sup_x |qₙ(x) - σ⁻¹ φ(x/σ) (1 + κ₃ He₃(x/σ) / (6 σ³ √n))| = O(n⁻¹)`.

  (Bhattacharya–Ranga Rao, Thm 19.2, p. 192, the case `s = 4`, `k = 1`, whose `o(n⁻¹)` bound with
  the further term of order `n⁻¹` gives `O(n⁻¹)`.) Proof route: `charFun` of `Sₙ` is
  `charFun P (t/√n)ⁿ`, integrable for `n ≥ ν` since `|charFun P| ≤ 1`, so Tau Ceti's
  `eq_withDensity_charFunDensity` gives the continuous density as a Fourier integral. The
  difference with the expansion is bounded by `(2π)⁻¹` times the `L¹` distance of the transforms,
  split as in 4.2: near `0` by the fourth-order Taylor expansion, and away from `0` by
  `sup_{|t| ≥ δ} |charFun P t| < 1`. That bound holds because `(charFun P)^ν` is integrable, so
  `X₁ + … + X_ν` has a density and `charFun P` tends to `0` at infinity by the Riemann–Lebesgue
  lemma; in particular `P` is not lattice, and 3.1 covers compact ranges of `t`.

*Needs:* 3.1, 4.1; Tau Ceti `eq_withDensity_charFunDensity`, `continuous_charFunDensity`.

### 4.7 Cornish–Fisher expansions

- **Cornish–Fisher** (`cornishFisher_quantile`): under the hypotheses of the first statement of
  4.5, the lower `α`-quantile `wₐ = inf {x | α ≤ P(√n A(X̄)/σ ≤ x)}` satisfies

  `wₐ = zₐ + ∑_{r=1}^{j} n^{-r/2} p_{r1}(zₐ) + o(n^{-j/2})`

  uniformly in `α ∈ [ε, 1 - ε]` for each `ε ∈ (0, 1/2)` (Hall, Thm 2.4, p. 70), where the
  polynomials `p_{r1}` are determined by `p₁, …, p_r` through the formal identity (2.49), p. 69,
  and `p₁₁ = -p₁` (Hall, p. 69). For `j = 1` this is `wₐ = zₐ - n^{-1/2} p₁(zₐ) + o(n^{-1/2})`.
  `Suggested.lean` states the expansion with `wₐ` the `quantile` of the law of `√n A(X̄)/σ`, `zₐ`
  that of `gaussianReal 0 1`, and the `p_{r1}` existential beside the Edgeworth polynomials of
  4.5, with `p₁₁ = -p₁`. Proof route: invert the uniform expansion, using
  `φ(zₐ) ≥ φ(z_ε) > 0` on the range of `α`.

*Needs:* 4.5; Tau Ceti `Measure.quantile`.

### Examples

- For `X = E - 1` with `E` exponential of mean `1`, `κ₃ = 2` and `κ₄ = 6`. The exact law of `Sₙ` is
  a shifted gamma law. Then `√n sup_x |P(Sₙ ≤ x) - Φ(x) - n^{-1/2} p₁(x) φ(x)|` is `0.0252`,
  `0.0068`, `0.0020`, `0.0006` for `n = 10, 10², 10³, 10⁴`. Also `√n sup_x |P(Sₙ ≤ x) - Φ(x)|` is
  `0.1330` at `n = 10⁴`, against the sharp constant `2/(6 √(2π)) = 0.13298` of 4.2. With two terms,
  `n^{3/2} sup_x |…|` is `0.079`, `0.061`, `0.056` for `n = 10, 10², 10³`, which confirms `p₂` of
  4.1.
- Lattice case: for the Rademacher law (`a = -1`, `h = 2`, `κ₃ = 0`), `√n` times the supremum
  error of the expansion in 4.3 is `0.0125`, `0.0062`, `0.0031`, `0.0015` for
  `n = 100, 400, 1600, 6400`. For the centred and standardized Bernoulli law with `p = 0.3` it is
  `0.0235`, `0.0116`, `0.0058`, `0.0029`. Without the sawtooth term, `√n sup |…|` for the
  Rademacher law tends to `φ(0) · h/2 = 0.399`, the bound of the no-continuous-expansion statement.
- Local expansion for the same exponential summand: `n sup_x |qₙ(x) - φ(x)(1 + He₃(x)/(3 √n))|`
  is `0.162`, `0.115`, `0.105`, `0.102` for `n = 10, 10², 10³, 10⁴`; here `|charFun P|²` is
  integrable and `ν = 2`.
- Cornish–Fisher for the same summand: `√n (wₐ - zₐ + n^{-1/2} p₁(zₐ))` is `0.0193`, `0.0002`,
  `-0.0199` at `α = 0.05, 0.5, 0.95` for `n = 100`, and `0.0062`, `0.00002`, `-0.0062` for
  `n = 1000`. At the median the correction is `-p₁(0)/√n = -1/(3 √n)`, the classical
  `median ≈ n - 1/3` of the gamma law.
- The studentized mean `T` of exponential data at `n = 40`: `τ > 0` almost surely, so
  `P(T ≤ 0) = P(X̄ ≤ 1)`, the probability that a gamma variable of shape `40` is at most `40`, and
  `P(T ≤ 0) - 1/2 = 0.02103`, against `n^{-1/2} q₁(0) φ(0) = 0.02103` with `γ = 2`. At `x = ±1`
  the two first-order terms differ: `p₁(±1) = 0` while `q₁(±1) = γ/2 = 1`.

### Dependencies

Layers 1–3, Foundations 8.4–8.5, Tau Ceti's Fourier inversion and quantiles.

## Layer 5: the saddlepoint approximation

### 5.1 Tilting a sample mean

- For a law `P` on `ℝ` with `0` in the interior of `integrableExpSet id P` and `s` in that
  interior, `P_s = P.tilted (fun x ↦ s * x)` is a probability law with mean `K'(s)` and variance
  `K''(s)`, where `K = cgf id P` (Mathlib `integral_tilted_mul_self`, `variance_tilted_mul`), and
  with cumulant generating function `u ↦ K(s + u) - K(s)` (Tau Ceti `cgf_tilted_mul`). Its
  characteristic function is `t ↦ complexMGF id P (s + i t) / mgf id P s`.
- **Tilting identity** (`map_sampleMean_eq_tilted`): the law of `X̄ₙ` under `Pⁿ` is
  `y ↦ exp (n (K(s) - s y))` times the law of `X̄ₙ` under `P_sⁿ`, as measures. Hence if
  `X̄ₙ` has a density `fₙ` under `P` and `f_{n,s}` under `P_s`, then
  `fₙ(y) = exp (n (K(s) - s y)) f_{n,s}(y)` for almost every `y` (Severini, proof of Thm 14.4,
  p. 449, for the density of the sum). Proof: the tilt of `Pⁿ` by `s ∑ xᵢ` is `P_sⁿ` (Mathlib
  `Measure.tilted` and `Measure.pi`), and the tilting factor depends on `x` only through `x̄`.

*Needs:* Mathlib `Measure.tilted`, `cgf`, `integrableExpSet`; Tau Ceti `cgf_tilted_mul`.

### 5.2 The saddlepoint density

- `saddlepointDensity K n s x = (n / (2π K''(s)))^{1/2} exp (n (K(s) - s x))`, the density of the
  sample mean, not of the sum.
- **Saddlepoint approximation** (`saddlepoint_approximation_sampleMean_density`): let `X` be i.i.d.
  with an absolutely continuous law `P`, with `0` in the interior of `integrableExpSet id P`. Let
  `x` be given and `s` in the interior with `K'(s) = x`, the saddlepoint. Suppose the
  characteristic function of `P_s` is in `L^ν` for an integer `ν ≥ 1`. Then for `n > ν` the law of
  `X̄ₙ` has a continuous density `fₙ`, bounded when `|charFun P|^ν` is integrable, and

  `fₙ(x) = saddlepointDensity K n s x · (1 + O(n⁻¹))`.

  The statement is pointwise in `x`. Locators: Severini, Thm 14.4, p. 449, with relative error
  `o(n^{-1/2})` under a bounded density in place of the `L^ν` hypothesis; the `O(n⁻¹)` form
  follows from Bhattacharya–Ranga Rao, Thm 19.2, p. 192, with `s = 4`, through 4.6. Proof route:
  by 5.1, `fₙ(x) = exp (n (K(s) - s x)) f_{n,s}(x)`. Under `P_s` the point `x` is the mean, and
  `f_{n,s}(x) = √n q̃ₙ(0)` with `q̃ₙ` the density of the normalized sum `n^{-1/2} ∑ (Xᵢ - x)` under
  `P_s`. The local expansion 4.6 for `P_s`, which has every moment because `s` is interior and
  variance `K''(s) > 0`, gives `q̃ₙ(0) = (2π K''(s))^{-1/2} (1 + O(n⁻¹))`, since `He₃(0) = 0`.
  Continuity of `fₙ` comes from the integrability of the tilted characteristic function to the
  power `n`, and boundedness from the same argument at `s = 0`.

*Needs:* 4.6, 5.1.

**Checks.**

- `saddlepointDensity` for the exponential law of mean `1` (Examples): `fₙ(x)/saddlepointDensity`
  is `nⁿ e^{-n} √(2πn)/n!` for every `x > 0`, a relative error `1/(12n) + O(n⁻²)`.
- `saddlepointDensity` for `N(m, 1)`: `K(s) = m s + s²/2`, the saddlepoint is `s = x - m`, and the
  saddlepoint density is `√(n/(2π)) exp (-n (x - m)²/2)`, the exact density of `X̄ₙ`.
- `saddlepointDensity` (negative control): the factor `(n / (2π K''(s)))^{1/2}` belongs to the
  sample mean; the density of the sum, `(2π n K''(s))^{-1/2} exp (K(s) n - s t)` at `t = n x`,
  differs from it by the factor `n`, which for `N(m, 1)` makes the exact identity fail.
- `saddlepointDensity` (negative control): for the Bernoulli law `(δ₀ + δ₁)/2`,
  `K(s) = log ((1 + eˢ)/2)`, every `x ∈ (0, 1)` has a saddlepoint and `saddlepointDensity` is
  positive there, while `X̄ₙ` has no density; the `L^ν` hypothesis excludes this law, since
  `|charFun P t| = |cos (t/2)|` is in no `L^ν`.

### Examples

- The exponential law of mean `1`: `K(s) = -log (1 - s)` for `s < 1`, the saddlepoint of `x > 0`
  is `s = 1 - 1/x` and `K''(s) = x²`. The exact density of `X̄ₙ` is the gamma density
  `nⁿ x^{n-1} e^{-n x}/(n - 1)!`, and `fₙ(x)/saddlepointDensity K n s x = nⁿ e^{-n} √(2πn)/n!`,
  which is `0.92214`, `0.95950`, `0.99170`, `0.99917` at `n = 1, 2, 10, 100`. The tilted law `P_s`
  is exponential of rate `1 - s = 1/x`, with `|charFun P_s t|² = 1/(1 + x² t²)` integrable, so
  `ν = 2`.
- The normal law `N(m, 1)`: `P_s = N(m + s, 1)` and the saddlepoint approximation is exact for
  every `n`.

### Dependencies

Layer 4, Mathlib's tilting and cumulants, Tau Ceti `cgf_tilted_mul`.

## Layer 6: the bootstrap

### 6.1 The resampling kernel

- `bootstrapKernel n m : Kernel (Fin n → E) (Fin m → E)`, for `n > 0` the composite of Tau Ceti's
  `empiricalMeasureOfFintype : (Fin n → E) → ProbabilityMeasure E` with
  `TauCeti.MeasureTheory.iidBlockKernel m`, through `Kernel.comap` and
  `measurable_empiricalMeasureOfFintype`; for `n = 0` the zero kernel.
- `bootstrapLaw n m R x = (bootstrapKernel n m x).map (R x)` is Mathlib's `Measure.map`, which
  uses a.e.-measurability; it is a probability law for `n > 0`.
- The resampling kernel is a Markov kernel for `n > 0` (`isMarkovKernel_bootstrapKernel`).
- **Index form** (`bootstrapKernel_index_form`): for `n > 0`, `bootstrapKernel n m x` is the image
  of the uniform law on `Fin m → Fin n` under `k ↦ x ∘ k` (Tau Ceti `iidBlockKernel_apply` and
  `pi_empiricalMeasureOfFintype_eq_map_uniformOn`). When `E` and the value space `Y` have
  measurable singletons, moreover:
  - every map `F : (Fin m → E) → Y` is a.e.-measurable for `bootstrapKernel n m x`, since that law
    is carried by the finite set `{x ∘ k}`;
  - `bootstrapLaw n m R x = n^{-m} ∑_{k : Fin m → Fin n} δ_{R x (x ∘ k)}`;
  - `∫ h d(bootstrapLaw n m R x) = n^{-m} ∑_k h (R x (x ∘ k))` for every `h : Y → ℝ`.

  None of these needs a measurability hypothesis on `R`.
- **Conditional law** (`condDistrib_snd_fst_bootstrap`): for `E` standard Borel and `n > 0`, under
  the joint law `Pⁿ ⊗ₘ bootstrapKernel n m` the conditional distribution of the resample given the
  sample is `bootstrapKernel n m`, `Pⁿ`-a.e. (Mathlib `condDistrib_ae_eq_of_measure_eq_compProd`).
  In Lean the Markov property of the kernel, `isMarkovKernel_bootstrapKernel`, is passed as an
  instance argument.
  So bootstrap laws are conditional laws given the data, and every statement about
  `ω ↦ bootstrapLaw n m R (sample X n ω)` is a statement about conditional laws.
- The joint space: for data `X : ℕ → Ω → E` with measurable `X i`, the probability
  `μ ⊗ₘ (bootstrapKernel n m).comap (sample X n)` on `Ω × (Fin m → E)` carries the data and the
  resample together; resampled statistics are functions on it, and asymptotic measurability in
  6.4 refers to it.

*Needs:* Mathlib `Kernel.comap`, `condDistrib`, `uniformOn`; Tau Ceti `iidBlockKernel`,
`empiricalMeasureOfFintype`, `pi_empiricalMeasureOfFintype_eq_map_uniformOn`.

**Checks.**

- `bootstrapKernel`: for `n = 1` it is `δ_{fun _ ↦ x 0}` for every `m`.
- `bootstrapKernel`: for `x = (0, 1)`, the resample maximum equals `1` with probability `3/4`.
- `bootstrapKernel` (negative control): the draws are with replacement. For `x = (0, 1)` and
  `m = 2` the resample `(0, 0)` has probability `1/4`; drawing without replacement would give it
  probability `0`.
- `bootstrapKernel` (negative control): for `n = 0` it is the zero kernel, so the Markov property
  needs `n > 0`.
- `bootstrapLaw`: for `x = (0, 1)` and `R x y = √2 (ȳ - x̄)`, it gives `-1/√2`, `0`, `1/√2` the
  masses `1/4`, `1/2`, `1/4`; its variance is `1/4`, the sample variance of `x` with divisor `n`.
- `bootstrapLaw`: for `m = 1` and `R x y = y 0` it is the empirical law of `x`; for `x = (0, 1)`
  it is `(δ₀ + δ₁)/2`.
- `bootstrapLaw` (negative control): let `A ⊆ ℝ` be a set that is not Borel, with `0 ∈ A` and
  `1 ∉ A`, and `R x y = 1_A (y 0)`. For `x = (0, 1)` and `m = 1` the bootstrap law is
  `(δ₁ + δ₀)/2`, by the index form; `Measure.map` of a map that is not a.e.-measurable would be
  `0`, so the a.e.-measurability clause is what makes the law correct.

### 6.2 The bootstrap of the mean

**Consistency** (`tendsto_kolmogorovDist_bootstrap_mean`): let `X` be i.i.d. real with
`E X² < ∞` and `σ² = Var X > 0`, and let `Lₙ(ω)` be the bootstrap law of `√n (Ȳ - X̄)` at the
sample `sample X n ω`. Then almost surely `kolmogorovDist (Lₙ(ω)) N(0, σ²) → 0` and
`kolmogorovDist (Lₙ(ω)) (law of √n (X̄ₙ - μ)) → 0` (van der Vaart, Thm 23.4, p. 330, for the first;
Shao–Tu, Thm 3.1, p. 80, with `g = id`, for the second). Proof route: fix `ω` in the event where
the strong law holds for `X` and `X²` and for `X² 1{|X| > M}` for every rational `M`. Given the
data, the resampled values form a triangular array of i.i.d. draws from the empirical law, with
mean `X̄ₙ` and variance `σ̂ₙ² → σ²`, and Lindeberg's condition
`n⁻¹ ∑ᵢ (Xᵢ - X̄ₙ)² 1{|Xᵢ - X̄ₙ| > ε √n} → 0` holds along `ω`. The Lindeberg–Feller theorem
(MathematicalStatisticsAsymptotic 1.2, in dimension `1`) gives convergence in law to `N(0, σ²)`,
and Pólya's theorem (1.1) the Kolmogorov form. The second statement follows by the triangle
inequality, since `kolmogorovDist N(0, σ²) (law of √n (X̄ₙ - μ)) → 0` by Mathlib's central limit
theorem and Pólya's theorem; it is a deterministic sequence.

*Needs:* 1.1, 6.1; MathematicalStatisticsAsymptotic 1.2 (Lindeberg–Feller); Mathlib
`ProbabilityTheory.strong_law_ae`, `tendstoInDistribution_inv_sqrt_mul_sum_sub`.

**Checks.**

- For `P = (δ₀ + δ₁)/2`, `σ² = 1/4`; at a sample with `X̄ₙ = 1/2` the bootstrap law of
  `√n (Ȳ - X̄)` is that of `√n (Bin(n, 1/2)/n - 1/2)`, whose variance is `1/4` for every `n`.
- For `x = (0, 1, 2)` the bootstrap law of `√3 (Ȳ - x̄)` puts mass `7/27` at `0` and `1/27` at
  `±√3`; its variance is `2/3`, the sample variance with divisor `n`.
- (negative control) The second moment is needed: for real data, `E X² < ∞` is necessary and
  sufficient for strong consistency of the bootstrap of the mean (Shao–Tu, p. 80, citing
  Giné–Zinn and Hall).

### 6.3 The bootstrap of the empirical distribution function

**Bootstrap Donsker theorem** (`tendstoInLawAlmostSurely_bootstrap_empiricalProcess`): let `X` be
i.i.d. real with law `P`, and let `B` be the law on `ℓ^∞(ℝ)` with
`IsBrownianBridgeLaw P (fun t x ↦ 1{x ≤ t}) B`, the `F`-Brownian bridge. Then the bootstrap law of
`liftLinfty (t ↦ √n (F*ₙ(t) - F̂ₙ(t)))`, with `F*ₙ` the empirical distribution function of the
resample, converges to `B` in bounded Lipschitz distance outer almost surely:
`TendstoInLawAlmostSurely μ L B`. Each bootstrap law is a finitely supported Borel law on `ℓ^∞(ℝ)`
by 6.1, so the statement involves no outer integral (van der Vaart, Thm 23.7, p. 333, for
Donsker classes with square-integrable envelope, which the indicators `1{x ≤ t}` are).

Proof route:
- the quantile transform: with `U₁, …, Uₙ` i.i.d. uniform, the values `Q̂ₙ(Uⱼ)`, for `Q̂ₙ` the
  quantile function of the empirical law (Tau Ceti `Measure.quantile`,
  `measurePreserving_quantile`), are a resample; and `1{Q̂ₙ(u) ≤ t} = 1{u ≤ F̂ₙ(t)}` for
  `0 < u ≤ 1`, so the bootstrap process has the law of `Uₙ ∘ F̂ₙ`, with `Uₙ` the uniform empirical
  process. Since `F̂ₙ` takes the values `k/n`, `Uₙ ∘ F̂ₙ` depends on finitely many coordinates of
  `Uₙ` and is Borel measurable;
- the classical Donsker theorem for the uniform law (MathematicalStatisticsAsymptotic 3.4), in the
  bounded Lipschitz form of MathematicalStatisticsAsymptotic 2.2, gives `Uₙ ⇒ B⁰`, the Brownian
  bridge law of the uniform law, which does not depend on `ω`;
- Glivenko–Cantelli (MathematicalStatisticsAsymptotic 3.4) gives `sup_t |F̂ₙ(t) - F(t)| → 0`
  almost surely. `Uₙ` is asymptotically uniformly equicontinuous for
  `ρ(u, v) = sd(B⁰(u) - B⁰(v)) ≤ |u - v|^{1/2}` (the converse and the Gaussian clause of
  MathematicalStatisticsAsymptotic 2.3), so for every such `ω`
  `sup_t |Uₙ(F̂ₙ(t)) - Uₙ(F(t))| → 0` in outer probability;
- `z ↦ z ∘ F` is continuous linear on `ℓ^∞(ℝ)`, so `Uₙ ∘ F ⇒ B⁰ ∘ F` by the continuous mapping
  theorem, and `Uₙ ∘ F̂ₙ ⇒ B⁰ ∘ F` by Slutsky's lemma (both MathematicalStatisticsAsymptotic 2.2);
  the law of `B⁰ ∘ F` is tight with the marginals of the `F`-bridge, so it is `B` by uniqueness of
  tight laws with given marginals (MathematicalStatisticsAsymptotic 2.3, 2.4).

*Needs:* 1.2, 1.3, 6.1; MathematicalStatisticsAsymptotic 2.2 (the bounded Lipschitz form,
continuous mapping and Slutsky's lemma), 2.3 (`Linfty`, `liftLinfty`, equicontinuity and
uniqueness), 2.4 (`IsBrownianBridgeLaw`) and 3.4 (Donsker and Glivenko–Cantelli for the empirical
distribution function); Tau Ceti `Measure.quantile`.

**Checks.**

- For `P = δ₀` every sample and every resample is constant, the bootstrap process is `0`, and `B`
  has covariance `F(s ∧ t) - F(s) F(t) = 0`, so `B = δ₀` and every distance is `0`.
- For `n = 1` the resample equals the sample, `F*₁ = F̂₁`, and the bootstrap law is `δ₀`; the
  theorem is asymptotic only.
- For `P` uniform on `[0, 1]` and `n = 2` with distinct sample values `a < b`, the bootstrap
  process at `t ∈ [a, b)` is `√2 (F*₂(t) - 1/2)`, which takes the values `-1/√2`, `0`, `1/√2` with
  probabilities `1/4`, `1/2`, `1/4`; its variance `1/4` is `F̂₂(t)(1 - F̂₂(t))`, the bridge
  variance at the empirical law.

### 6.4 The delta method for the bootstrap

- **Bootstrap delta method** (`tendstoInLawInProbability_bootstrap_delta_method`): let `D` be a
  normed space with its Borel σ-algebra, `D₀ : Submodule ℝ D` a linear subspace, and
  `φ : D → ℝ^k` Hadamard differentiable at `θ` within `dom` and tangentially to `D₀`, with
  derivative `φ'` (`HasHadamardDerivWithinAt φ dom D₀ φ' θ`, MathematicalStatisticsAsymptotic 4.1,
  applied to the carrier of `D₀`). Let `Tₙ` and the resampled `T*ₙ` take values in `dom`,
  `rₙ → ∞`, and `G` a Borel probability law concentrated on a σ-compact subset `S` of `D₀` (`G` is
  tight and carried by `D₀`). Suppose
  - `rₙ (Tₙ - θ) → G` in the sense of `TendstoInOuterDistribution`;
  - the bootstrap law of `rₙ (T*ₙ - Tₙ)` tends to `G` conditionally in outer probability
    (`TendstoInLawInProbability`);
  - `rₙ (T*ₙ - Tₙ)` is asymptotically measurable on the joint space of 6.1: for every bounded
    continuous `f`, outer minus inner integrals of `f (rₙ (T*ₙ - Tₙ))` tend to `0`.

  Then the bootstrap law of `rₙ (φ(T*ₙ) - φ(Tₙ))` tends to `G.map φ'` conditionally in outer
  probability (van der Vaart, Thm 23.9, p. 333, with `rₙ = √n`, where `D₀` is a subspace and the
  limit is tight; the stated form, for any `rₙ → ∞`, is by the same argument). Proof route: on the
  joint space, the pair `(rₙ (Tₙ - θ), rₙ (T*ₙ - Tₙ))` converges in outer distribution to
  independent copies of `G` (van der Vaart, Problem 23.8, p. 340), so `rₙ (T*ₙ - θ)` converges to
  the law of their sum, which is carried by `S + S`. That set is σ-compact (the image of `S ×ˢ S`
  under addition), hence measurable and separable, and it lies in `D₀` because `D₀` is closed
  under addition. The functional delta method (MathematicalStatisticsAsymptotic 4.2) applied at
  `θ` to `Tₙ` and to `T*ₙ` gives `rₙ (φ(T*ₙ) - φ(Tₙ)) - φ'(rₙ (T*ₙ - Tₙ)) → 0` in outer
  probability on the joint space. For bounded Lipschitz `h`, the outer Markov inequality for the
  extended outer expectation (MathematicalStatisticsAsymptotic 2.1), applied to the nonnegative
  bounded function `min (1, ‖rₙ (φ(T*ₙ) - φ(Tₙ)) - φ'(rₙ (T*ₙ - Tₙ))‖)`, transfers this to the
  bootstrap laws: `|∫ h dL*ₙ - ∫ h ∘ φ' dL'ₙ| → 0` in outer probability, where `L*ₙ` and `L'ₙ`
  are the bootstrap laws of `rₙ (φ(T*ₙ) - φ(Tₙ))` and of `rₙ (T*ₙ - Tₙ)`. Finally `h ∘ φ'` is
  bounded Lipschitz up to the constant `‖φ'‖`.
- **Failure at a vanishing derivative** (`not_tendsto_bootstrap_square_of_gaussian`): for an i.i.d.
  `N(0, σ²)` sample with `σ > 0`, the bounded Lipschitz distance between the bootstrap law of
  `n ((Ȳ)² - X̄²)` and the law of `n X̄²` does not tend to `0` in outer probability. Here `φ(x) = x²`
  has derivative `0` at `θ = 0`. Proof: `n X̄² = σ² Z²` with `Z = √n X̄/σ ~ N(0, 1)` for every `n`,
  and the bootstrap statistic is `(√n (Ȳ - X̄))² + 2 σ Z √n (Ȳ - X̄)`, whose bootstrap law, by 6.2 and
  the continuous mapping theorem uniformly for `z` in compact sets, is within `o(1)` in bounded
  Lipschitz distance of the law `M_z` of `σ² (W² + 2 z W)`, `W ~ N(0, 1)`, at `z = Z`. The variance
  of `M_z` is `σ⁴ (2 + 4 z²)`, so `M_z ≠ σ² χ²₁` for `z ≠ 0`, and the distance `d(z)` between them
  is continuous and positive off `0`; then `P(d(Z) > ε) > 0` is independent of `n` for small `ε`.
  This is the case `g(x) = x²` of Shao–Tu, Example 3.6, p. 119, where the bootstrap law of
  `n (g(Ȳ) - g(X̄))` is shown to have no limit for almost every data sequence.

*Needs:* 1.2, 1.3, 6.1, 6.2; MathematicalStatisticsAsymptotic 2.1 (`outerIntegral`,
`innerIntegral`, the extended outer expectation and its Markov inequality), 2.2
(`TendstoInOuterDistribution`), 4.1 (`HasHadamardDerivWithinAt`) and 4.2 (the functional delta
method); Mathlib `Submodule`, `IsSigmaCompact`, `IsSigmaCompact.image`.

**Checks.**

- `D = ℝ`, `φ(x) = x²`, `θ = μ ≠ 0`, `Tₙ = X̄`, `rₙ = √n`: `φ'(h) = 2 μ h`, and the bootstrap of
  `√n (X̄² - μ²)` has the limit `N(0, 4 μ² σ²)` (the third example below).
- (negative control) The subspace is needed. In `D = ℝ²` let `D₀` be the union of the coordinate
  axes, `φ(v) = min (|v₁|, |v₂|)` and `G = (δ_{e₁} + δ_{e₂})/2`; `φ` is Hadamard differentiable
  at `0` tangentially to `D₀` with derivative `0`. For data i.i.d. with law `G`, `Tₙ = X₀/√n` and
  `T*ₙ = (X₀ + Y₀)/√n`, with `Y₀` the first resampled value, satisfy every other hypothesis with
  `rₙ = √n`, but `rₙ (φ(T*ₙ) - φ(Tₙ)) = 1{X₀ ≠ Y₀}`, whose bootstrap law tends to
  `(δ₀ + δ₁)/2 ≠ δ₀ = G.map 0`.
- A vanishing derivative is allowed, and then the limit is `δ₀` at the scale `rₙ`: for
  `φ(x) = x²` at `θ = 0` the theorem gives `√n ((Ȳ)² - X̄²) → δ₀` conditionally, while at the
  scale `n` there is no conditional limit (the failure below).

### 6.5 The sample maximum

- **The atom** (`bootstrapKernel_iSup_eq`): for `n ≥ 1`, if the maximum of `x : Fin n → ℝ` is
  attained at exactly one index, then the resample maximum equals the sample maximum with
  probability `1 - (1 - 1/n)ⁿ`, one minus the probability that the index of the maximum is never
  drawn (Shao–Tu, (3.79), p. 123). By the index form of 6.1 this is a count of index maps.
- The number `1 - (1 - 1/n)ⁿ` decreases in `n ≥ 1` to `1 - e⁻¹` (Mathlib
  `Real.tendsto_one_add_div_pow_exp` at `-1`, and monotonicity of `(1 - 1/n)ⁿ`).
- **Inconsistency** (`le_kolmogorovDist_bootstrap_max`): if `F` is continuous, then almost surely,
  for every normalization `bₙ`, every law `G` with continuous distribution function and every
  `n ≥ 1`, the bootstrap law of `bₙ (X₍ₙ₎ - Y₍ₙ₎)` is at Kolmogorov distance at least
  `(1 - (1 - 1/n)ⁿ)/2` from `G`. The sample values are almost surely distinct, so the atom at `0`
  has at least the mass of the atom bullet, and the jump bound of 1.1 applies. Since the bound is
  at least `(1 - e⁻¹)/2`, the bootstrap of the maximum is not consistent for any limit law with a
  continuous distribution function (Shao–Tu, Example 3.9, p. 123; van der Vaart, Problem 23.3,
  p. 340).
- **The `m`-out-of-`n` bootstrap** (`tendsto_kolmogorovDist_m_out_of_n_bootstrap_max`): let `F` have
  right endpoint `θ` (`F(θ) = 1` and `F(x) < 1` for `x < θ`), and suppose
  `n^{1/δ} (θ - X₍ₙ₎)` converges in law to the Weibull law `G(x) = 1 - exp (-(x/c)^δ)`,
  `x ≥ 0`, with `δ, c > 0`. If `m → ∞` and `m/n → 0`, then the bootstrap law of
  `m^{1/δ} (X₍ₙ₎ - Y₍ₘ₎)`, for a resample of size `m`, tends to `G` in Kolmogorov distance in
  probability (Shao–Tu, Thm 3.15, p. 124, by the same argument, which generalizes their
  (3.77), p. 123). Proof route: the convergence hypothesis is
  `n (1 - F(θ - x n^{-1/δ})) → (x/c)^δ`; the bootstrap probability
  `P*(m^{1/δ} (X₍ₙ₎ - Y₍ₘ₎) ≤ x)` is `1 - F̂ₙ(X₍ₙ₎ - x m^{-1/δ} -)^m`, the count
  `n (1 - F̂ₙ(θ - x m^{-1/δ}))` is binomial with mean of order `n/m → ∞`, so it concentrates, and
  `X₍ₙ₎ - θ = O_P(n^{-1/δ}) = o_P(m^{-1/δ})`. Pólya's theorem gives uniformity in `x`.

*Needs:* 1.1, 1.3, 6.1; Foundations 8.2–8.3; Mathlib `Real.tendsto_one_add_div_pow_exp`.

**Checks.**

- The atom for `x = (0, 1)`: three of the four index maps draw index `1`, so the probability is
  `3/4 = 1 - (1 - 1/2)²`.
- (negative control) The uniqueness hypothesis is needed: for `x = (1, 1)` the resample maximum
  is `1` with probability `1`, not `3/4`.
- Inconsistency at `n = 1`: the resample equals the sample, the bootstrap law is `δ₀` for every
  `b₁`, and its Kolmogorov distance to `N(0, 1)` is `1/2`, the bound `(1 - 0)/2`.
- (negative control) The `m`-out-of-`n` theorem needs `m/n → 0`: with `m = n` and `F`
  continuous, as for the uniform law, the atom of the bootstrap law at `0` has mass at least
  `1 - e⁻¹` along almost every sample, so the Kolmogorov
  distance to the continuous `G` stays at least `(1 - e⁻¹)/2`.

### Examples

- Bootstrap atom: `1 - (1 - 1/n)ⁿ` is `1`, `0.75`, `0.65132`, `0.63397` at `n = 1, 2, 10, 100`;
  the limit is `1 - e⁻¹ = 0.63212`.
- For uniform data on `[0, θ]`, `n (θ - X₍ₙ₎)` has the limit `G(x) = 1 - exp (-x/θ)`, the case
  `δ = 1`, `c = θ` of 6.5; the bootstrap fails and the `m`-out-of-`n` bootstrap with `m = ⌊√n⌋`
  succeeds.
- The bootstrap of `√n (X̄² - μ²)` for `μ ≠ 0` is consistent by 6.4 with `φ(x) = x²`,
  `φ'(h) = 2 μ h`, and the limit `N(0, 4 μ² σ²)`.

### Dependencies

Layer 1, Foundations 8.2–8.5 and 9.1, MathematicalStatisticsAsymptotic 1.2 (Lindeberg–Feller),
2.1–2.4 (outer integrals, weak convergence in `ℓ^∞(T)` and Brownian bridge laws), 3.4 (Donsker and
Glivenko–Cantelli for the empirical distribution function) and 4.1–4.2 (Hadamard derivatives and
the functional delta method), Tau Ceti's empirical measures, product kernels and quantiles.

## Layer 7: the jackknife, subsampling and empirical likelihood

### 7.1 The jackknife variance

- `deleteOneMean x i = (n - 1)⁻¹ ∑_{j ≠ i} x j`, the mean with the `i`th observation deleted, and
  for a statistic `g (x̄)` the delete-one jackknife variance

  `jackknifeVariance g x = ((n - 1)/n) ∑ᵢ (g(x̄₍ᵢ₎) - n⁻¹ ∑ⱼ g(x̄₍ⱼ₎))²`, with
  `x̄₍ᵢ₎ = deleteOneMean x i`.

  At `n = 1` the delete-one mean is `0⁻¹ · 0 = 0` and the variance is `0`.
- **Strong consistency** (`tendsto_mul_jackknifeVariance`): let `X` be i.i.d. in
  `EuclideanSpace ℝ (Fin d)` with `E ‖X‖² < ∞` and mean `μ`, and let `g` be differentiable on a
  neighbourhood of `μ` with `Dg` continuous at `μ`. Then almost surely
  `n · jackknifeVariance g (sample X n) → Var[Dg(μ) X]`. (Shao–Tu, Thm 2.1, p. 25, which assumes
  in addition `∇g(μ) ≠ 0` and states the ratio form; the stated form is by the same argument,
  and for `∇g(μ) = 0` both sides tend to `0`.) Proof route: `x̄₍ᵢ₎ - x̄ = (x̄ - xᵢ)/(n - 1)`, and
  `maxᵢ ‖Xᵢ‖ / n → 0` almost surely under a second moment (Borel–Cantelli), so every `x̄₍ᵢ₎` lies
  in a small ball around `μ` for `n` large. The mean value theorem writes
  `g(x̄₍ᵢ₎) - g(x̄) = Dg(ξᵢ)(x̄₍ᵢ₎ - x̄)`, and continuity of `Dg` at `μ` replaces `Dg(ξᵢ)` by
  `Dg(μ)` with a uniform `o(1)` error. The leading term is `(n - 1)⁻¹ ∑ᵢ (Dg(μ)(Xᵢ - X̄))²`,
  which converges to `Var[Dg(μ) X]` by the strong law.

*Needs:* Foundations 8.5; Mathlib `ProbabilityTheory.strong_law_ae`, the mean value theorem.

**Checks.**

- `deleteOneMean`: for `x = (0, 1, 2)` the delete-one means are `1.5`, `1`, `0.5`; for `n ≥ 2` their
  average is `x̄`, since `x̄₍ᵢ₎ - x̄ = (x̄ - xᵢ)/(n - 1)`.
- `deleteOneMean`: at `n = 1` it is `0⁻¹ · 0 = 0`, whatever `x 0` is.
- `deleteOneMean` (negative control): the divisor is `n - 1`, the size of the reduced sample. For
  `x = (1, 1)` the delete-one means are `1`; the divisor `n` would give `1/2`.
- `jackknifeVariance`: for `g = id` and `n ≥ 2` it is `s²/n`, with `s²` the sample variance with
  divisor `n - 1`; for `x = (0, 1, 2)` it is `1/3`.
- `jackknifeVariance`: for a constant `g` it is `0`, and so is the limit `Var[Dg(μ) X]`.
- `jackknifeVariance`: for `g(t) = t²` and `x = (0, 1, 2)` the values `g(x̄₍ᵢ₎)` are `9/4`, `1`,
  `1/4` and the variance is `49/36`, close to the delta-method value `(2 x̄)² s²/n = 4/3`.
- `jackknifeVariance` (negative control): the factor is `(n - 1)/n`, not the factor `1/(n - 1)`
  of the sample variance of the delete-one values. For `x = (0, 1, 2)` and `g = id` the latter
  gives `1/4`, and for `g = id` it is `s²/(n - 1)²`, so `n` times it tends to `0`, not to `Var X`.
- Strong consistency with `∇g(μ) = 0`: for `g(t) = t²` and `μ = 0`, `n · jackknifeVariance` tends
  to `0 = Var[Dg(0) X]`; the stated form needs no hypothesis `∇g(μ) ≠ 0`.

### 7.2 Subsampling

- `subsamplingLaw θ_b θ_n τ x`, for a sample `x : Fin n → E`: the law of
  `τ (θ_b (x ∘ ι) - θ_n x)` for `ι` uniform among the strictly increasing maps `Fin b → Fin n`.
  These are the `C(n, b)` subsamples of size `b`, drawn without replacement. For `b > n` there is
  no such map, `uniformOn ∅ = 0`, and the law is the zero measure; every theorem below has
  `b/n → 0`, so `b ≤ n` eventually.
- **Consistency** (`tendsto_kolmogorovDist_subsamplingLaw`): let `X` be i.i.d., `θ̂ₙ` measurable
  statistics with `τₙ (θ̂ₙ - θ) → J` in law, where `J` has a continuous distribution function, and
  let `b → ∞`, `b/n → 0` and `τ_b/τₙ → 0`. Then the subsampling law with scale `τ_b` tends to `J` in
  Kolmogorov distance in probability (Politis–Romano–Wolf, Thm 2.2.1(ii), p. 43, which compares
  with the law of `τₙ (θ̂ₙ - θ)` instead of `J`; the two forms are equivalent by Pólya's theorem).
  Proof route: `Uₙ(x)`, the same average with `θ̂ₙ` replaced by `θ`, is a U-statistic of order `b`
  with kernel `1{τ_b (θ̂_b - θ) ≤ x}`, mean `P(τ_b (θ̂_b - θ) ≤ x) → J(x)` and variance at most
  `b/n` (Hoeffding's bound for U-statistics of order `b`, from the representation as an average
  of `⌊n/b⌋` independent blocks). The difference `τ_b (θ̂ₙ - θ) = (τ_b/τₙ) τₙ (θ̂ₙ - θ)` is
  `o_P(1)`, and Pólya's theorem gives uniformity.
- **Coverage** (`tendsto_measureReal_le_quantile_subsamplingLaw`): under the same hypotheses on `X`,
  `θ̂ₙ`, `b` and `τ`, let `τₙ (θ̂ₙ - θ)` converge in law to `J` (at the continuity points of `J`), let
  `0 < α < 1`, and let `J` be continuous at its `(1 - α)`-quantile. With `c_{n,b}(1 - α)` the
  `(1 - α)`-quantile of the subsampling law `L` (Tau Ceti `Measure.quantile`, the infimum of
  `{x | 1 - α ≤ cdf L x}`), `P(τₙ (θ̂ₙ - θ) ≤ c_{n,b}(1 - α)) → 1 - α` (Politis–Romano–Wolf,
  Thm 2.2.1(iii), p. 43). Proof route: the pointwise form below places `c_{n,b}(1 - α)` between
  `c - ε` and `c' + ε` with probability tending to `1`, where `[c, c']` is the set where
  `J = 1 - α`, and `J(c - ε)` and `J(c' + ε)` tend to `1 - α` as `ε → 0`.
- The same theorem gives convergence of the subsampling distribution function at each continuity
  point of `J` when `J` is not continuous (part (i)), and almost sure convergence in (i) and (ii)
  when `τ_b (θ̂ₙ - θ) → 0` almost surely and `∑ₙ exp (-d n/b) < ∞` for every `d > 0` (part (iv),
  by the exponential form of Hoeffding's bound and Borel–Cantelli).
- **The maximum** (`tendsto_kolmogorovDist_subsamplingLaw_max`): under the convergence hypothesis
  of the `m`-out-of-`n` bootstrap of 6.5, `n^{1/δ} (θ - X₍ₙ₎) → G` with `G` Weibull, subsampling the
  maximum with `τₙ = n^{1/δ}`, `b → ∞` and `b/n → 0` is consistent for the law of
  `n^{1/δ} (X₍ₙ₎ - θ)`, whose limit is the reflection `G.map (x ↦ -x)`. This is the consistency
  theorem with `J` that reflection, which is continuous, and `τ_b/τₙ = (b/n)^{1/δ} → 0`.

*Needs:* 1.1, 1.3; Foundations 8.3, 8.5; Mathlib `uniformOn`; Tau Ceti `Measure.quantile`.

**Checks.**

- `subsamplingLaw`: for `x = (0, 1, 2)`, `b = 2`, `θ` the mean and `τ = 1`, the three subsamples
  have means `0.5`, `1`, `1.5`, so the law gives `-0.5`, `0`, `0.5` the mass `1/3` each.
- `subsamplingLaw`: with `b = n` the only subsample is the sample, and the law is `δ₀` whatever
  the statistic and the scale.
- `subsamplingLaw` (negative control): subsamples are drawn without replacement. For
  `x = (0, 1)`, `b = 2`, the mean and `τ = 1` the law is `δ₀`; drawing with replacement, as the
  bootstrap does, would give `±1/2` the mass `1/4` each.
- `subsamplingLaw` (negative control): for `b = 3 > n = 2` it is the zero measure, not a
  probability law.
- (negative control) `b/n → 0` is needed: for the mean with `b = n - 1` the values
  `(n - 1)(θ̂_{n,b,i} - θ̂ₙ) = X̄ₙ - Xᵢ` have the empirical law of `X̄ₙ - Xᵢ`, which tends to the law
  of `μ - X₁`, not to a normal law unless `X₁` is normal (Politis–Romano–Wolf, p. 43).

### 7.3 Empirical likelihood

- `empiricalLikelihoodRatio x m = sSup {∏ᵢ n wᵢ | w ≥ 0, ∑ wᵢ = 1, ∑ wᵢ xᵢ = m}` for
  `x : Fin n → E`. The set is bounded by `1` (AM–GM), the supremum is attained when the set is
  nonempty (compactness of the simplex), and it is `0` when `m` is outside the convex hull of the
  sample, where the set is empty. Then `-2 log R = 0` is Lean's junk value of `log 0`; the
  theorem is unaffected, since the true mean lies in the relative interior of the convex hull
  (its interior within the affine hull of the sample) with probability tending to `1`. The
  ambient interior is the wrong notion: for `X = (Z, 0)` in `ℝ²` with `Z ~ N(0, 1)`, every sample
  hull lies on the first axis and has empty interior.
- `x ↦ empiricalLikelihoodRatio x m` is upper semicontinuous, as the value of the maximization of a
  continuous function over a compact feasible set with closed graph in `x`; so it is Borel, and
  `-2 log R` of the sample is a random variable.
- **Owen's theorem** (`tendstoInDistribution_empiricalLikelihood`): let `X` be i.i.d. in
  `EuclideanSpace ℝ (Fin d)` with `E ‖X‖² < ∞`, mean `μ`, and covariance `V` of rank `q > 0`. Then
  `-2 log empiricalLikelihoodRatio (sample X n) μ → χ²_q` in law (Owen, Thm 3.2, p. 30; Thm 2.2,
  p. 16, for `d = 1`). The rank is stated through the range `K` of `V`: a subspace `K` with
  `X - μ ∈ K` almost surely and `Var ⟪u, X⟫ > 0` for every nonzero `u ∈ K` is the range of `V`,
  and `q = dim K`; `K` is the whole space exactly when `V` is nonsingular. Proof route:
  - the nonsingular case (`q = d`): the true mean lies in the interior of the sample convex hull
    with probability tending to `1`: `inf_θ P(θᵀ (X - μ) > 0) > 0` over unit vectors `θ` (Owen,
    Lemma 11.1, p. 217); for each `θ` some `δ > 0` has `P(θᵀ (X - μ) > δ ‖X - μ‖) > 0`, and that
    event forces `θ'ᵀ (X - μ) > 0` for every unit `θ'` within `δ` of `θ`; finitely many such caps
    cover the sphere, and each is hit by some `Xᵢ` with probability tending to `1`, so no closed
    half-space through `μ` contains the sample (Owen, p. 219, argues through a Glivenko–Cantelli
    theorem for half-spaces instead). For `μ` interior to the hull, the maximizer is
    `wᵢ = (n (1 + λᵀ (Xᵢ - μ)))⁻¹`, with the Lagrange multiplier `λ` solving
    `∑ᵢ (Xᵢ - μ)/(1 + λᵀ (Xᵢ - μ)) = 0`; `maxᵢ ‖Xᵢ‖ = o(n^{1/2})` almost surely and
    `λ = O_P(n^{-1/2})`; `-2 log R = n (X̄ - μ)ᵀ Ŝ⁻¹ (X̄ - μ) + o_P(1)`, with `Ŝ` the sample
    second-moment matrix about `μ`; the multivariate central limit theorem and the chi-squared law
    of a Gaussian quadratic form (MathematicalStatisticsAsymptotic 1.2 and 1.3), with Slutsky's
    lemma (Foundations 8.4), finish;
  - reduction of the singular case (`q < d`): `Xᵢ - μ ∈ range V` almost surely, since
    `E ⟪u, X - μ⟫² = uᵀ V u = 0` for `u ⊥ range V`. Choose a linear isometry
    `A : range V ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin q)`; on that event the constraint `∑ wᵢ (Xᵢ - μ) = 0`
    is equivalent to `∑ wᵢ A (Xᵢ - μ) = 0`, so `empiricalLikelihoodRatio (sample X n ω) μ` equals
    the empirical likelihood ratio at `0` of the sample `A (Xᵢ(ω) - μ)`, `i < n`, almost surely. The
    vectors `A (Xᵢ - μ)` have mean `0` and the nonsingular covariance `A V Aᵀ`, and the nonsingular
    case gives `χ²_q`.
- **Estimating equations** (`tendstoInDistribution_empiricalLikelihood_estimatingEquation`): for
  `m : E → Θ → ℝ^s` with `x ↦ m(x, θ₀)` measurable, `E ‖m(X, θ₀)‖² < ∞`, `E m(X, θ₀) = 0` and
  `Var m(X, θ₀)` of rank `q > 0` (with range `K`, as above), the ratio
  `R(θ₀) = sup {∏ n wᵢ | w ≥ 0, ∑ wᵢ = 1, ∑ wᵢ m(Xᵢ, θ₀) = 0}`, the empirical likelihood ratio of
  the vectors `m(Xᵢ, θ₀)` at `0`, satisfies `-2 log R(θ₀) → χ²_q` in law (Owen, Thm 3.4, p. 41).
  Proof route: the vectors `m(Xᵢ, θ₀)` are i.i.d. (Foundations 8.5), and Owen's theorem applies to
  them at `μ = 0`.

*Needs:* Foundations 8.1, 8.4, 8.5; MathematicalStatisticsAsymptotic 1.2 (the multivariate central
limit theorem) and 1.3 (chi-squared laws of Gaussian quadratic forms); Tau Ceti
`chiSquaredMeasure`.

**Checks.**

- `empiricalLikelihoodRatio`: at `m = x̄` the uniform weights are feasible and `R = 1`, the
  largest value, by AM–GM; for `x = (0, 2)` and `m = 1` the weights are `(1/2, 1/2)`.
- `empiricalLikelihoodRatio`: for `x = (0, 2)` and `m = 1/2` the only feasible weights are
  `(3/4, 1/4)`, so `R = (3/2)(1/2) = 3/4` and `-2 log R = 0.57536`.
- `empiricalLikelihoodRatio`: for `x = (0, 2)` and `m = 0`, a vertex of the hull, the only
  feasible weights are `(1, 0)` and `R = 0`; so is `R` at `m = 3`, outside the hull, where the
  feasible set is empty and `sSup ∅ = 0`. In both cases `-2 log R` is Lean's `0`, not `+∞`.
- `empiricalLikelihoodRatio` (negative control): the factor `n` in `∏ n wᵢ` normalizes the
  maximum to `1`. Without it the value at `m = x̄` would be `n^{-n}`, which is `1/4` for `n = 2`,
  and `-2 log R` would diverge.
- Owen's theorem with `d = 1` and `P = (δ₀ + δ₂)/2`: `μ = 1`, `q = 1`, and the true mean lies
  inside the sample hull as soon as both values occur, with probability `1 - 2^{1-n}`.
- (negative control) The rank, not the dimension, gives the degrees of freedom: for `X = (Z, Z)`
  in `ℝ²` with `Z ~ N(0, 1)`, `V` has rank `1`, `K` is the diagonal, and the limit is `χ²_1`, not
  `χ²_2`.

### Examples

- `jackknifeVariance id` of `x = (0, 1, 2)`: the delete-one means are `1.5`, `1`, `0.5`, with
  average `1`, so the variance is `(2/3)(0.25 + 0 + 0.25) = 1/3`, and `n · v = 1`, the sample
  variance with divisor `n - 1`. For `g = id` and `n ≥ 2` the jackknife variance is `s²/n`.
- `subsamplingLaw` of `x = (0, 1, 2)` with `b = 2`, `θ` the mean and `τ = 1`: the three subsamples
  have means `0.5`, `1`, `1.5`, so the law gives `-0.5`, `0`, `0.5` the mass `1/3` each. With
  `b = n` the only subsample is the sample and the law is `δ₀`.
- `empiricalLikelihoodRatio` of `x = (0, 2)`: at `m = 1` the weights are `(1/2, 1/2)` and `R = 1`;
  at `m = 1/2` they are `(3/4, 1/4)`, `R = (3/2)(1/2) = 3/4` and `-2 log R = 0.57536`; at `m = 3`
  the set is empty and `R = 0`.

### Dependencies

Layer 1, Foundations 8.1–8.5, MathematicalStatisticsAsymptotic 1.2–1.3, Tau Ceti
`chiSquaredMeasure` and `Measure.quantile`.

## Layer 8: second-order accuracy of the studentized bootstrap

### 8.1 The setting

Throughout this layer:
- `X` is i.i.d. in `EuclideanSpace ℝ (Fin d)` with law `P` and mean `μ`, and `E ‖X‖^k < ∞` for
  every `k`;
- the augmented vector `augmentedVector X` of 4.5 satisfies Cramér's condition;
- `g` is measurable and `C^∞` on a neighbourhood of `μ`, `θ = g(μ)`, and
  `σ² = Var[Dg(μ) X] > 0`;
- `θ̂ = g(X̄)` and `σ̂² = pluginVariance g (sample X n)` (4.5); for a resample `y`, `θ̂* = g(ȳ)` and
  `σ̂*² = pluginVariance g y`, recomputed in every resample;
- `S = √n (θ̂ - θ)/σ`, `T = √n (θ̂ - θ)/σ̂`, and their bootstrap versions `S* = √n (θ̂* - θ̂)/σ̂`
  and `T* = √n (θ̂* - θ̂)/σ̂*`. Division by `σ̂ = 0` gives `0`, which happens with probability
  `O(n^{-λ})` for every `λ`: `σ̂² → σ² > 0`, and the moment bounds
  `E |Z̄ - E Z|^{2k} = O(n^{-k})` for the augmented mean `Z̄` make `P(|σ̂² - σ²| > σ²/2)` smaller
  than every power of `n`.

`σ̂²` is a smooth function of the mean of the augmented vector, so 4.5 applies to `S` with
polynomials `p_r` and to `T` with polynomials `q_r`, to every order. The statistics are Hall's
smooth function model, with Hall's `X` the augmented vector and `h(z)² = τ(z)²` of 4.5 (Hall,
§5.2.1, p. 238, (5.1)–(5.4)).

*Needs:* 3.2, 4.5.

### 8.2 The bootstrap Edgeworth expansion

- **Bootstrap expansion** (`bootstrap_edgeworth_expansion`): for every `j ≥ 1` and `λ > 0` there
  are `C` and, for each sample `x`, polynomials `q̂_r` and `p̂_r` such that

  `sup_x |P*(T* ≤ x) - Φ(x) - ∑_{r=1}^{j} n^{-r/2} q̂_r(x) φ(x)| ≤ C n^{-(j+1)/2}`

  and the same for `S*` with `p̂_r`, on an event of probability at least `1 - C n^{-λ}`; and
  `√n (q̂_r - q_r)` and `√n (p̂_r - p_r)` are bounded in probability coefficientwise (Foundations
  8.2), where `p_r` and `q_r` are the polynomials of 4.5 for `S` and `T` (Hall, Thm 5.1, p. 239,
  where the moment order `l(λ)` and the number `j + 3` of bounded derivatives depend on `j` and
  `λ`; under the hypotheses of 8.1 they hold for every `j` and `λ`). `Suggested.lean` pins `p_r`
  and `q_r` by the expansions of order `j` of `S` and `T`.
- The plug-in polynomials: Hall's `q̂_r` is `q_r` with the population moments of the augmented
  vector replaced by the sample moments (Hall, p. 239), so that the derivatives of `g` are taken at
  `X̄` in place of `μ`, and likewise `p̂_r`; its coefficients are smooth functions of sample
  moments, which gives the coefficientwise bound by the multivariate central limit theorem. Proof
  route of the expansion: 4.5 applied to the empirical law, with every constant made explicit in the
  moments and the Cramér constant; outside an event of probability `O(n^{-λ})` the empirical moments
  are close to the population moments and the empirical characteristic function of the augmented
  vector satisfies Cramér's bound on the range `|t| ≤ n^{c}` that the smoothing inequality uses.
- **Bootstrap Cornish–Fisher** (`bootstrap_edgeworth_expansion`, on the same event): for each
  `ε ∈ (0, 1/2)`, on such an event the `α`-quantile `v̂ₐ` of the bootstrap law of `T*` satisfies
  `|v̂ₐ - zₐ + n^{-1/2} q̂₁(zₐ)| ≤ C n⁻¹` for every `α ∈ [ε, 1 - ε]`. Hall, Thm 5.2, p. 241, gives
  `|v̂ₐ - zₐ - ∑_{r ≤ j} n^{-r/2} q̂_{r1}(zₐ)| ≤ C n^{-(j+1)/2 + δ}` for every `δ > 0`, uniformly in
  `n^{-ε'} ≤ α ≤ 1 - n^{-ε'}`, with probability `1 - O(n^{-λ})`; take `j = 2`, and bound
  `q̂₂₁(zₐ)` on `[ε, 1 - ε]` by the bound on the coefficients of `q̂_r` that holds with
  probability `1 - O(n^{-λ})` (Hall, (5.8), p. 239). Here `q̂₁₁ = -q̂₁`, as in 4.7.

*Needs:* 4.5, 4.7, 6.1, 8.1; Foundations 8.2.

### 8.3 Second-order accuracy

- **Kolmogorov accuracy** (`studentized_bootstrap_second_order_accuracy`, first part): the
  Kolmogorov distance between the bootstrap law of `T*` and the law of `T` is `O_P(n⁻¹)`, that
  is, `n · kolmogorovDist` is bounded in probability (Foundations 8.2). Proof route: 4.5 for `T`
  with `j = 2` gives `P(T ≤ x) = Φ(x) + n^{-1/2} q₁(x) φ(x) + O(n⁻¹)` uniformly in `x`, and 8.2 for
  `T*` with `j = 1` gives the same with `q̂₁` and remainder `C n⁻¹` outside an event of
  probability `O(n^{-λ})`; the difference is `n^{-1/2} (q̂₁ - q₁) φ + O(n⁻¹) = O_P(n⁻¹)`.
- The normal approximation is not better than `n^{-1/2}`:
  `√n kolmogorovDist (law of T) N(0, 1) → sup_x |q₁(x) φ(x)|`, which is positive unless
  `q₁ = 0`. Proof route: 4.5 for `T` with `j = 1`.

*Needs:* 4.5, 8.2; Foundations 8.2.

### 8.4 Coverage of bootstrap confidence intervals

Fix `α ∈ (0, 1/2)` and the nominal level `1 - α`. Each one-sided interval is an upper confidence
bound for `θ`, and `p₁`, `q₁` are the polynomials of 4.5 for `S` and `T`.
- **Normal theory** (`bootstrap_interval_coverage`, second part):
  `I_N = (-∞, θ̂ - n^{-1/2} σ̂ zₐ]` has coverage
  `P(θ ∈ I_N) = 1 - α - n^{-1/2} q₁(zₐ) φ(zₐ) + O(n⁻¹)`.
- **Percentile** (`bootstrap_interval_coverage`, third part): `I_P = (-∞, ĉ]` with `ĉ` the
  `(1 - α)`-quantile of the bootstrap law of `θ̂*` has coverage
  `1 - α - n^{-1/2} (p₁ + q₁)(zₐ) φ(zₐ) + O(n⁻¹)`. This is Efron's percentile interval, which
  Hall calls the "other percentile" interval (Hall, §3.4, p. 95).
- **Percentile-`t`** (`studentized_bootstrap_second_order_accuracy`, second part):
  `I_T = (-∞, θ̂ - n^{-1/2} σ̂ v̂ₐ]` with `v̂ₐ` the `α`-quantile of the bootstrap law of `T*` has
  coverage `1 - α + O(n⁻¹)`.
- **Two-sided equal-tailed intervals** (`bootstrap_interval_coverage`, fourth to sixth parts):
  `[θ̂ - n^{-1/2} σ̂ v̂_{1-α}, θ̂ - n^{-1/2} σ̂ v̂ₐ]` has coverage `1 - 2α + O(n⁻¹)`, and so do the
  normal-theory interval `[θ̂ - n^{-1/2} σ̂ z_{1-α}, θ̂ - n^{-1/2} σ̂ zₐ]` and the percentile
  interval `[ĉ_α, ĉ_{1-α}]` between the bootstrap quantiles of `θ̂*`: their `n^{-1/2}` terms
  cancel because `p₁` and `q₁` are even (Hall, §3.5.5, p. 104, and (3.42), p. 105).

`Suggested.lean` pins `p₁` and `q₁` by the expansions of order `2` of `S` and `T` (the first part
of `bootstrap_interval_coverage`). Locators: Hall, (3.39), p. 101, and Prop 3.1, p. 102, for the
formal coverage expansion of an interval `(-∞, θ̂ + n^{-1/2} σ̂ ĉ]` with
`ĉ = z_β + n^{-1/2} ŝ₁(z_β) + …` and nominal level `β`, namely
`β + n^{-1/2} (s₁ - q₁)(z_β) φ(z_β) + O(n⁻¹)`; Hall, Thm 5.3, p. 262, for the rigorous version,
whose hypothesis (5.39) on `ĉ` Hall derives from Thm 5.2 for the percentile and percentile-`t`
intervals (pp. 260–261) and which holds trivially for the normal-theory interval. The three
one-sided intervals are the cases `s₁ = 0`, `s₁ = -p₁` and `s₁ = q₁` with `β = 1 - α`,
`z_β = -zₐ`, using the Cornish–Fisher expansions of 4.7 and 8.2 and the evenness of `p₁` and
`q₁`; Hall, p. 108, records `s₁ = q₁` for percentile-`t`. The percentile coefficient
`-(p₁ + q₁)` is computed this way from Prop 3.1. Proof route for the rigorous version:
`P(θ ∈ I_T) = P(T ≥ v̂ₐ)`, and `v̂ₐ = zₐ - n^{-1/2} q₁(zₐ) + n^{-1/2} Δₙ` with
`Δₙ = O_P(n^{-1/2})` a smooth function of sample moments; the delta method for the joint
Edgeworth expansion of `(T, Δₙ)` (4.5 applied to the vector of `T` and the moments in `Δₙ`)
shows that the perturbation changes the probability by `O(n⁻¹)`.

*Needs:* 4.5, 4.7, 8.2.

### Examples

- The mean, `g = id`, `d = 1`, with skewness `γ`: `p₁ = -γ (x² - 1)/6`, `q₁ = γ (2x² + 1)/6` and
  `p₁ + q₁ = γ (x² + 2)/6` (Hall, (3.47), p. 106). At `α = 0.05`, `zₐ = -1.6449`, the
  normal-theory coverage error is `-n^{-1/2} γ (2 · 2.7055 + 1) φ(1.6449)/6 = -0.1102 γ n^{-1/2}`
  and the percentile error is `-n^{-1/2} γ (2.7055 + 2) φ(1.6449)/6 = -0.0809 γ n^{-1/2}`; for
  exponential data (`γ = 2`) and `n = 25` these are `-0.044` and `-0.032`, while the
  percentile-`t` error is `O(n⁻¹)`. The exponential law satisfies the hypotheses of 8.1: all its
  moments are finite, and `(X, X²)` satisfies Cramér's condition by 3.2.
- For a symmetric law (`γ = 0`) of the mean, `p₁ = q₁ = 0`, and all three one-sided intervals have
  coverage `1 - α + O(n⁻¹)`.
- The `n^{-1/2}` coverage term is not removed by studentizing alone: for the normal-theory
  interval of the mean it is `-n^{-1/2} q₁(zₐ) φ(zₐ)`, and `q₁(zₐ) = γ (2zₐ² + 1)/6 > 0` for every
  `α` when `γ > 0`.

### Dependencies

Layers 4 and 6, Foundations 8.2.

## Layer 9: Čencov's theorem

### 9.1 Simplices, congruent embeddings and invariant tensors

- `openSimplex m = {p : Fin m → ℝ | ∀ i, 0 < pᵢ, ∑ pᵢ = 1}` and the tangent space
  `simplexTangent m = {u | ∑ uᵢ = 0}`. Mathlib's `Convexity.StdSimplex` is a type of finitely
  supported weights, not a subset of `Fin m → ℝ`, so the open simplex is defined directly.
- `fisherRao p u v = ∑ uᵢ vᵢ / pᵢ` and `amariChentsov p u v w = ∑ uᵢ vᵢ wᵢ / pᵢ²`. The Fisher–Rao
  form is positive definite on `simplexTangent m` at every `p ∈ openSimplex m`.
- `CongruentEmbedding m n`: a surjection `block : Fin n → Fin m` and weights `q > 0` with
  `∑_{block j = i} q j = 1` for each `i` (surjectivity also follows from the weight condition,
  since an empty sum is `0`). Its map `p ↦ (p (block j) · q j)_j` is linear
  (`CongruentEmbedding.toLinearMap`), maps `openSimplex m` into `openSimplex n` and
  `simplexTangent m` into `simplexTangent n`, and is its own derivative. Permutations of `Fin m`
  are the congruent embeddings with `n = m` and `q = 1`. These are Chentsov's congruent embeddings
  of simplices, which are linear and given in coordinates by his (10.33) (Chentsov, p. 159, with
  Lemmas 9.5 and 10.10).
- **Invariance** (`fisherRao_congruentEmbedding`, `amariChentsov_congruentEmbedding`): for every
  congruent embedding `e`, `p ∈ openSimplex m` and tangent `u, v, w`,
  `fisherRao (e p) (e u) (e v) = fisherRao p u v` and the same for `amariChentsov` (Chentsov,
  proof of Thm 11.1, pp. 159–160, for the Fisher–Rao form). Proof: the summand at `j` is the
  summand at `block j` times `q j`, and the weights sum to `1` on each block.

*Needs:* Mathlib linear algebra.

**Checks.**

- `openSimplex`: `(1/2, 1/2) ∈ openSimplex 2`.
- `openSimplex`: `(1, 0) ∉ openSimplex 2`, although the closed simplex contains it.
- `openSimplex`: `openSimplex 0 = ∅`, since the empty sum is `0`.
- `openSimplex`: `openSimplex 1` is the single point `p = 1`.
- `simplexTangent`: `(1, -1) ∈ simplexTangent 2`.
- `simplexTangent`: `(1, 0) ∉ simplexTangent 2`.
- `simplexTangent`: `simplexTangent 1 = ⊥`, so the statements about tangent vectors are empty for
  `m = 1`.
- `simplexTangent`: its dimension is `m - 1` for `m ≥ 1`.
- `fisherRao`: at `p = (1/2, 1/2)` with `u = v = (1, -1)` it is `4`.
- `fisherRao`: at `p = (1/4, 3/4)` with `u = v = (1, -1)` it is `16/3`.
- `fisherRao`: under the congruent embedding with `block = (0, 1, 1)` and `q = (1, 1/2, 1/2)`,
  `(1/2, 1/2) ↦ (1/2, 1/4, 1/4)` and `(1, -1) ↦ (1, -1/2, -1/2)`, and the value is
  `2 + 1 + 1 = 4`, as before.
- `fisherRao`: the Euclidean form `∑ uᵢ vᵢ` is not invariant: it is `2` for `u = v = (1, -1)` and
  `1.5` for the image above.
- `fisherRao`: the form `∑ uᵢ vᵢ pᵢ` is not invariant: it is `1` at `(1/2, 1/2)` and `5/8` at the
  image above.
- `amariChentsov`: at the centre of `S₃` with `u = v = w = (2, -1, -1)` it is
  `9 (8 - 1 - 1) = 54`.
- `amariChentsov`: at the centre of `S₂` it is `0` for all tangent `u, v, w`.
- `amariChentsov`: at `p = (1/4, 3/4)` with `u = v = w = (1, -1)` it is `16 - 16/9 = 128/9`.
- `amariChentsov`: under the embedding above, `(1/4, 3/4) ↦ (1/4, 3/8, 3/8)` and the value is
  again `128/9`.
- `amariChentsov`: the variant `∑ uᵢ³/pᵢ` is not invariant: it changes from `8/3` to `10/3` under
  the same embedding.
- `CongruentEmbedding`: `block = (0, 1, 1)` with `q = (1, 1/2, 1/2)` is a congruent embedding of
  `S₂` into `S₃`.
- `CongruentEmbedding`: `block = (0, 1, 1)` with `q = (1, 1/2, 1/3)` is not: the weights on the
  second block sum to `5/6`.
- `CongruentEmbedding`: every permutation `σ` of `Fin m`, with `q = 1`, is a congruent embedding of
  `S_m` into itself.
- `CongruentEmbedding.toLinearMap`: for `block = id` and `q = 1` it is the identity.
- `CongruentEmbedding.toLinearMap`: for `block = (0, 1, 1)` and `q = (1, 1/2, 1/2)` it sends
  `(1/2, 1/2)` to `(1/2, 1/4, 1/4) ∈ openSimplex 3`.
- `CongruentEmbedding.toLinearMap`: dropping the weights, `p ↦ p ∘ block` sends `(1/2, 1/2)` to
  `(1/2, 1/2, 1/2)`, whose sum is `3/2`, so the weights are needed.

### 9.2 Invariant bilinear forms

- **Čencov's theorem** (`exists_eq_smul_fisherRao_of_invariant`): let `h_m(p)` be a bilinear form on
  `Fin m → ℝ` for every `m` and `p`, continuous in `p` on `openSimplex m`, with
  `h_n(e p)(e u, e v) = h_m(p)(u, v)` for every congruent embedding `e : S_m → S_n`, every
  `p ∈ openSimplex m` and tangent `u, v`. Then there is a constant `c` with
  `h_m(p)(u, v) = c · fisherRao p u v` for every `m ≥ 2`, `p ∈ openSimplex m` and tangent `u, v`.
  No symmetry of `h_m` is assumed.
- **Metrics** (`exists_pos_eq_smul_fisherRao_of_invariant_metric`): if moreover each `h_m(p)` is
  positive definite on the tangent space, then `c > 0`.

Locators: Chentsov, Thm 11.1, p. 159, for invariant `(0, 2)` tensor fields, with Lemma 11.1,
p. 157, and Lemma 11.2, p. 158; Amari–Nagaoka, Thm 2.6, p. 38, stated through sufficient
statistics, without proof. Continuity is essential for tensor fields (Chentsov, p. 158): a
continuous invariant field is fixed by its values at the centres of the simplices, through the
rational points (Lemma 11.1, p. 157). Proof route:
- at the centre `c_m = (1/m, …, 1/m)`, invariance under permutations makes `h_m(c_m)` an
  `S_m`-invariant bilinear form on the standard representation `{∑ uᵢ = 0}`. That
  representation is absolutely irreducible for `m ≥ 2`, so its invariant bilinear forms form a
  one-dimensional space, spanned by `fisherRao c_m`; so `h_m(c_m) = a_m fisherRao c_m`.
  Chentsov, pp. 160–161, computes this directly: the matrix `h_m(c_m)(eᵢ, eⱼ)` has one value on
  the diagonal and one off it;
- the congruent embedding `S_m → S_{mk}` that splits every block into `k` equal parts maps `c_m`
  to `c_{mk}`, so `a_m = a_{mk}`, and `a_m = a_{m'}` through `mm'`; call the common value `c`;
- at a rational point `p = (k₁/N, …, k_m/N)`, the embedding that splits block `i` into `kᵢ`
  equal parts maps `p` to `c_N`, so `h_m(p) = c · fisherRao p` by invariance and 9.1;
- rational points are dense in `openSimplex m`, and both sides are continuous in `p`.

*Needs:* 9.1; Mathlib representation theory of `Equiv.Perm (Fin m)` or a direct computation of
the invariant bilinear forms.

### 9.3 Invariant trilinear forms

- **The Amari–Chentsov tensor** (`exists_eq_smul_amariChentsov_of_invariant`): with the
  hypotheses of 9.2 for trilinear forms `h_m(p)`, there is `c` with
  `h_m(p)(u, v, w) = c · amariChentsov p u v w` for every `m ≥ 2`. No symmetry of `h_m` is
  assumed.

Chentsov states the uniqueness of the invariant `(0, 3)` tensor field without proof (p. 165).
Proof route: that of 9.2, once the invariant trilinear forms on the standard representation are
known. They form a one-dimensional space for `m ≥ 3`, spanned by `amariChentsov c_m`, since the
standard representation occurs once in its tensor square; for `m = 2` they are `0`, since the
transposition acts on the one-dimensional tangent space by `-1`. The constant is fixed by any
`m ≥ 3`, and it is consistent at `m = 2`, where `amariChentsov c₂ = 0` on tangent vectors and
every rational point other than `c₂` maps to a centre `c_N` with `N ≥ 3`.

*Needs:* 9.1, 9.2.

### Examples

- The centre `c₃ = (1/3, 1/3, 1/3)` and `u = (2, -1, -1)`: `fisherRao c₃ u u = 3 · 6 = 18` and
  `amariChentsov c₃ u u u = 54`.
- The form `h_m(p)(u, v) = 7 · fisherRao p u v` satisfies the hypotheses of 9.2 with `c = 7`, and
  `h_m(p)(u, v) = (∑ uᵢ)(∑ vᵢ) + fisherRao p u v` shows that the conclusion is only about tangent
  vectors: it is invariant on tangent vectors, where the first term vanishes, but not of the form
  `c · fisherRao p` on all of `Fin m → ℝ`.

### Dependencies

Mathlib.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Higher-order theory of intervals**: the coverage error `O(n⁻²)` of symmetric percentile-`t`
  intervals, which Hall derives only formally (§3.6), with no statement under explicit
  conditions; bias-corrected and accelerated intervals, the iterated bootstrap and bootstrap
  calibration; coverage uniform in `α` near `0` and `1`.
- **Other resampling schemes**: the parametric, Bayesian, wild, weighted and exchangeable
  bootstraps; the bootstrap of a general Donsker class and the multiplier central limit
  theorem, beyond the empirical distribution function of 6.3; block and stationary bootstraps
  and subsampling for dependent data; the delete-`d` jackknife, the jackknife bias estimate, and
  the inconsistency of the delete-one jackknife for quantiles.
- **Further expansions**: higher-order lattice expansions; Edgeworth expansions for
  non-identically distributed summands, for U-statistics and for dependent sequences; the
  Bartlett correction of empirical and parametric likelihood ratios; large deviations and
  Cramér's theorem; the Lugannani–Rice tail approximation and multivariate saddlepoint
  approximations; the saddlepoint approximation uniform in `x`.
- **Information geometry beyond the simplices**: dual connections and the `α`-connections,
  Čencov's theorem for positive measures (Campbell) and for infinite sample spaces, and the
  geometry of exponential families.

## Prior formalization

Parts of Layers 1, 3–6, 8 and 9 are stated in `CKSD/Asymptotics/` of
[lean-CKSD](https://github.com/bjbraams/lean-CKSD) (Apache 2.0), the Core Knowledge of Statistics
and Data Science project, from items 49–61 of its file SYNOPSIS102.md. The bootstrap of the mean
(6.2, item 51) is proved there, through the strong law, Lévy's continuity theorem and Pólya's
theorem, and so is the invariance of the Fisher–Rao metric in 9.1. The one-term expansion (item 49),
the expansion for smooth functions of means (item 50), the bootstrap of the empirical distribution
function (item 52), the saddlepoint approximation (item 55) and the studentized bootstrap of the
mean (item 60, for `d = 1` and `g = id`) are stated with admitted proofs. The jackknife
(item 53), empirical likelihood (item 56), subsampling (item 57), the uniqueness half of Čencov's
theorem (item 58), the bootstrap delta method (item 59) and the sample maximum (item 61) are not
there, and neither are Berry–Esseen, the smoothing inequality, the lattice theory, the expansions
of every order, the local and Cornish–Fisher expansions, and the coverage results of 8.4.

The design differs in two places. lean-CKSD defines the bootstrap law by averaging over the `nⁿ`
index maps; 6.1 defines a Markov kernel and proves the averaging formula, so that bootstrap laws
are conditional laws. lean-CKSD states the bootstrap of the empirical distribution function in
probability with a Brownian bridge built from a Brownian motion; 6.3 states it outer almost
surely with the Brownian bridge law of MathematicalStatisticsAsymptotic.

The map, which is not prescriptive, lists files of `CKSD/Asymptotics/`:

| Layer | lean-CKSD files |
|---|---|
| 1 | Basic (the Kolmogorov distance), Bootstrap (the bounded Lipschitz test functions) |
| 3 | Expansions (Cramér's condition) |
| 4 | Expansions (the one-term expansion and smooth functions of means), Statistics (the Edgeworth approximation) |
| 5 | Expansions (the saddlepoint approximation), Statistics (the saddlepoint density) |
| 6 | Statistics (the bootstrap law), Bootstrap (the bootstrap of the mean, the bootstrap empirical process and its bounded Lipschitz distance) |
| 8 | Bootstrap (second-order accuracy for the mean), Statistics (the studentized statistic) |
| 9 | InformationGeometry (the Fisher–Rao metric, the Amari–Chentsov tensor, congruent embeddings and the invariance of the Fisher–Rao metric) |

Related libraries:
- [Statlib](https://github.com/stat-lib/statlib) (Apache 2.0) has no material on expansions,
  resampling or information geometry.
- No open Mathlib pull request concerns Berry–Esseen, Edgeworth expansions, the bootstrap,
  Pólya's theorem, Fourier inversion of characteristic functions or Čencov's theorem.

## Downstream consumers

No other roadmap consumes the results of this one.

## References

The locators refer to these editions; page numbers are printed page numbers.

- S.-I. Amari and H. Nagaoka, *Methods of Information Geometry*, Translations of Mathematical
  Monographs 191, American Mathematical Society and Oxford University Press, 2000.
- R. N. Bhattacharya and R. Ranga Rao, *Normal Approximation and Asymptotic Expansions*, SIAM
  Classics in Applied Mathematics 64, 2010 (reprint of the 1986 edition).
- N. N. Čencov (Chentsov), *Statistical Decision Rules and Optimal Inference*, Translations of
  Mathematical Monographs 53, American Mathematical Society, 1982.
- R. Durrett, *Probability: Theory and Examples*, 5th ed., Cambridge University Press, 2019.
- P. Hall, *The Bootstrap and Edgeworth Expansion*, Springer, 1992.
- A. B. Owen, *Empirical Likelihood*, Chapman and Hall/CRC, 2001.
- V. V. Petrov, *Sums of Independent Random Variables*, Springer, 1975.
- D. N. Politis, J. P. Romano and M. Wolf, *Subsampling*, Springer, 1999.
- T. A. Severini, *Elements of Distribution Theory*, Cambridge University Press, 2005.
- J. Shao and D. Tu, *The Jackknife and Bootstrap*, Springer, 1995.
- A. W. van der Vaart, *Asymptotic Statistics*, Cambridge University Press, 1998.
- A. W. van der Vaart and J. A. Wellner, *Weak Convergence and Empirical Processes*, 2nd ed.,
  Springer, 2023.

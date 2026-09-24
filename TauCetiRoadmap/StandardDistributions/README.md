# Roadmap: standard probability distributions and their elementary theory

Mathlib supplies the starting definitions for the real and multivariate Gaussian, Gamma, Beta, exponential, Cauchy, Pareto, Poisson, geometric, binomial, and Bernoulli laws.
This roadmap completes their elementary distributional APIs and connects the continuous scalar families to `MeasureTheory.HasPDF` and Radon–Nikodym derivatives.

It also develops interval and finite uniform, categorical, Laplace, log-normal, Weibull, chi-squared, chi, inverse-gamma, Student's t, Fisher's F, logistic, extreme-value, generalized Pareto, inverse-Gaussian, skew-normal, triangular, Kumaraswamy, Irwin–Hall, and Bates families, together with their named transformations and noncentral extensions.
The discrete families include negative binomial, hypergeometric, beta-binomial, Poisson-binomial, Skellam, Zipf, Yule–Simon, logarithmic series, and integer Laplace and Gaussian laws.
The multivariate families include Gaussian and Student's t, multinomial, Dirichlet, Dirichlet-multinomial, multivariate hypergeometric, matrix normal, proper complex Gaussian, and nonsingular, Gaussian-Gram, and inverse-Wishart laws.
Uniform sphere and ball, von Mises–Fisher, von Mises, and wrapped normal supply the spherical and circular families.
The shared API covers affine transformations, quantiles, truncation, atom mixtures, and compound Poisson laws.

It develops each distribution as a measure, proves the elementary theory appropriate to its carrier, and records the standard relationships among the families as pushforward, convolution, independence, or mixture statements.
It also supplies the special functions, inverse functions, and matrix and spherical measure theory needed to state the cdfs, quantiles, densities, and Wishart formulas.

The roadmap is complete when every target in Layers 0–13 and every completion check has been met.
Statistical inference is outside its scope: there are no targets about data, likelihoods, sufficiency, estimators, priors or posteriors, hypothesis tests, losses, or decision rules.

Suggested files:

```text
TauCeti/Probability/Distributions/          (one file or directory per family)
TauCeti/Probability/GeneratingFunction.lean (probability generating functions)
TauCeti/Analysis/Matrix/Frobenius.lean
TauCeti/Analysis/SpecialFunctions/          (incomplete gamma and beta, error function, Bessel I, Owen T)
TauCeti/Probability/Quantile.lean
TauCeti/Probability/Distributions/Affine.lean
TauCeti/Probability/Distributions/Truncation.lean
TauCeti/Probability/Distributions/CompoundPoisson.lean
TauCeti/LinearAlgebra/Matrix/Cholesky.lean
TauCeti/MeasureTheory/Measure/SymmetricMatrix.lean
```

## What every distribution must provide

The required API depends on the carrier.
A law on `ℕ`, a Euclidean space, or symmetric matrices should not be forced through operations that only make sense on `ℝ`.
Subject to that distinction, every family has the following targets.
Write `fooMeasure p : Measure α` for the measure and `p` for its parameters.

1. **A measure**, with its behavior for every parameter value stated explicitly.
2. **An `IsProbabilityMeasure` theorem** under exactly the classical parameter hypotheses, together with any named boundary cases that are also probability measures.
3. **A density or mass formula.**
   - A full-dimensional continuous family gets `fooPDFReal : … → ℝ`, `fooPDF : … → ℝ≥0∞`, a definition or theorem `fooMeasure p = volume.withDensity (fooPDF p)`, a `MeasureTheory.HasPDF` theorem for random variables with that law, and an `rnDeriv` theorem.
   - A constrained family such as Dirichlet gets an explicit lower-dimensional chart and reference measure.
     Do not claim absolute continuity with respect to ambient volume.
   - A singular boundary law gets a singularity or Dirac theorem instead of a density theorem.
   - A real law specified as a mixture of atoms and an absolutely continuous law gets that explicit decomposition, with masses and the density of the continuous part.
     Do not assert `HasPDF` for the whole law when a nonzero atom is present.
   - Sphere and circle laws name their reference surface or Haar measure.
     Their Radon–Nikodym statements use that measure, not ambient Euclidean volume.
   - A discrete family gets its singleton masses and a representation as a weighted sum of Dirac measures.
4. **Parameter measurability** in the form `Measurable fun p => fooMeasure p`, using the Giry measurable structure on `Measure α`.
   This is enough for a consumer to construct a `ProbabilityTheory.Kernel`.
   State matrix-parameter measurability through the coordinate carrier and `Matrix.of`: use the target `Measurable fun S : ι → ι → ℝ => fooMeasure (Matrix.of S)`, with the remaining parameters paired alongside.
   When the matrix is the scale of a symmetric-matrix family, also record the corollary in which it ranges over the symmetric-matrix carrier of Layer 6 with its Borel σ-algebra; that is the form a kernel with a random scale needs.
5. **The family-specific identities** listed in the relevant layer below.
6. **Affine transport and quantiles**, as specified in Layers 7 and 13 for every existing and new family.
   Scalar quantiles apply to real laws and numerical casts; other carriers use the explicitly named scalar observables.
   Elementary formulas, inverse special functions, least cumulative-mass crossings, and unique-root characterizations have distinct requirements in Layer 13.

The family entries in Layers 0–13 are exhaustive about which cdfs, moments, transforms, and exponential-integrability results are targets.
The carrier rules below specify how to state those listed targets; they do not silently require an additional closed form.

- **Real-valued families (`Measure ℝ`)** use `ProbabilityTheory.cdf`; each family entry says whether the target is a named closed form or the integral of its pdf.
  They get exactly the means, variances, raw or central moments, and descriptions of `integrableExpSet id μ` stated in their family entries.
  Prove a closed form for `mgf id` or `MeasureTheory.charFun` only when one is named below.
  Heavy-tailed families need both the sharp existence hypotheses and the matching non-integrability results.
  Whenever an mgf formula is requested on its finiteness domain, also give the corresponding `cgf` as the real logarithm of that formula.

  A transform formula is required only where a family entry names it.
  First-kind modified Bessel functions are developed in Layer 8 for noncentral and directional densities.
  The confluent-hypergeometric Beta transforms, second-kind Bessel inverse-gamma and Student-t transforms, and a log-normal mgf formula are not targets.
  The exact exponential-integrability domain is still required.
- **Discrete families on `ℕ`** stay on their native carrier for masses, support, convolution, and `pgf`.
  Each family entry lists the required cumulative-mass, moment, mgf, cgf, and characteristic-function formulas.
  State its listed real-valued results for the pushforward `(fooMeasure p).map (Nat.cast : ℕ → ℝ)`, using Mathlib's `Bin(ℝ, n, p)` notation where available.
  A finite-sum cdf or transform is a complete target when the family entry says so; no unstated hypergeometric-function closed form is required.
  Never apply real-only operations directly to `Measure ℕ`.
  The pgf–mgf bridge is `pgf X P (exp t) = mgf (fun ω => (X ω : ℝ)) P t`.
- **Discrete families on `ℤ`** keep integer masses, support, translations, reflection, and convolution on their native carrier.
  Analytic statements and quantiles concern the cast to `ℝ`.
  They do not use the `ℕ`-valued pgf; any bilateral series is stated explicitly with its convergence domain.
- **Finite multivariate families** get the Bochner mean, `covMatrix`/`covarianceBilin`, coordinate marginals, affine or aggregation laws, and transforms listed in their family entries.
  They do not get a scalar cdf or `mgf id`.
  A listed directional mgf applies `ProbabilityTheory.mgf` to an explicit real-valued linear functional and pairs it with an exact `integrableExpSet` theorem.
  A discrete vector law stays on `ι → ℕ` for masses and support, then uses the coordinatewise cast to `EuclideanSpace ℝ ι` for means, covariances, and characteristic functions.
- **Symmetric-matrix families** get exactly the density or singular-support theorem, Bochner mean, covariance data, and transforms listed in Layer 6.
  Wishart trace mgfs use an explicit real-valued linear functional; matrix-valued `mgf id` and joint matrix cdfs are not targets.
  Diagonal scalar cdfs and quantiles are supplied by the marginal laws in Layer 13.
  Whenever a trace mgf formula is requested on its finiteness domain, also give the corresponding `cgf` as the real logarithm of that formula.
  The inverse-Wishart family has no covariance or transform target beyond the mean and non-integrability statements explicitly listed in Layer 6.
  Layer 6 supplies its diagonal inverse-gamma marginals, and Layer 13 their quantiles.
- **Rectangular matrix and complex Gaussian laws** use the explicit real-coordinate identifications in Layer 11 for Lebesgue measure and scalar observables.
  Complex covariance and pseudocovariance are stated separately.
- **Spherical and circular laws** use the carriers and normalized reference measures in Layer 12.
  Their moments concern the ambient embedding or circle characters; real angle cdfs and quantiles require the declared representative interval.

Measure-level theorems are primary.
Random-variable corollaries use `ProbabilityTheory.HasLaw` on the same carrier.
For example, a native `X : Ω → ℕ` has mass and pgf corollaries, while its real moment statements concern `fun ω => (X ω : ℝ)` and the cast law.

## Conventions used throughout

- **Measures are the primary objects.** A distribution is a `Measure`, and random-variable statements go through `HasLaw`, following `Mathlib/Probability/HasLaw.lean`.
  Do not introduce an `IsDistributedAs`-style predicate; `HasLaw` already fills that role.
- **Discrete families are weighted sums of Dirac measures**, following `poissonMeasure` and `geometricMeasure`.
  Do not define new `PMF` versions or restate measure-level theorems for PMFs.
  Where Mathlib already has a PMF, such as `poissonPMF`, connect to it; new API still belongs on the measure.
- **Continuous families use `volume.withDensity`** with an `ℝ≥0∞`-valued pdf and a companion `ℝ`-valued `fooPDFReal`, following `gammaPDFReal`/`gammaPDF`/`gammaMeasure`.
- **Behavior outside the probability range is definition-specific.** Existing Mathlib measures retain their actual definitions there; in particular, do not claim that `gammaMeasure` becomes zero for invalid parameters.
  Every new family below states its totalization explicitly.
  A new density-defined family is zero outside its stated range unless a useful boundary law is named.
  In particular, `chiSquaredMeasure 0` and `negativeBinomialMeasure 0 p` are `Measure.dirac 0`, so empty sums and convolution units behave correctly.
  A pushforward inherits the source measure's behavior only when the relevant definition says so; otherwise branch before taking the pushforward.
  Every probability theorem carries either the classical hypotheses or a listed boundary case.
- **Transforms use Mathlib's conventions.** `charFun` means `MeasureTheory.charFun`, with kernel `e^{i⟪t, x⟫}`, not the `2π`-normalized Fourier transform.
  For real-valued laws, `mgf` and `cgf` mean `ProbabilityTheory.mgf` and `ProbabilityTheory.cgf` applied to `id`.
  On another carrier, apply `ProbabilityTheory.mgf` to the named real-valued linear functional.
  The real scalar cdf is the `StieltjesFunction` `ProbabilityTheory.cdf`.
- **Continuous multivariate laws live on `EuclideanSpace ℝ ι`** with `[Fintype ι]`, following `multivariateGaussian`.
  Their covariance data is a `Matrix ι ι ℝ`, connected to `covarianceBilin` in Layer 5.
  A discrete multivariate law stays on its native product carrier and is cast to `EuclideanSpace ℝ ι` only for analytic results.
- **Symmetric-matrix laws use Mathlib's self-adjoint subspace.** Index matrices by `Fin p` and use `selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)`.
  Over `ℝ`, `star` is transpose, so these are exactly the symmetric matrices.
  The Frobenius norm and inner product are compatible with the retained product and subtype topologies, but do not determine the normalization of Lebesgue measure.
- **Names follow the Mathlib files being extended:** `fooMeasure`, `fooPDFReal`, `fooPDF`, and `isProbabilityMeasure_fooMeasure`.
  Real laws use `integral_id_fooMeasure`, `variance_id_fooMeasure`, `mgf_id_fooMeasure`, `charFun_fooMeasure`, and `cdf_fooMeasure_eq`.
  For a discrete law, analytic theorem names mention the cast law — or follow Mathlib's existing `…_of_hasLaw_…` style — rather than suggesting that `id : ℕ → ℕ` is real-valued.

## Mathlib foundations to reuse

- **Named scalar distributions.** Under `Mathlib/Probability/Distributions/`, use `gaussianReal`, `gammaMeasure`, `betaMeasure`, `expMeasure`, `cauchyMeasure`, `paretoMeasure`, `poissonMeasure`, `geometricMeasure`, `binomial`, `bernoulliMeasure`, and `pdf.IsUniform`.
  The real Gaussian, including `rnDeriv_gaussianReal`, is the model for the elementary API.
  For Poisson, reuse `charFun_map_cast_poissonMeasure`, `poissonMeasure_conv_poissonMeasure`, and the limit theorem in `Poisson/PoissonLimitThm.lean`.
- **Multivariate Gaussian theory.** Use `stdGaussian`, `multivariateGaussian`, `charFun_multivariateGaussian`, `covarianceBilin_multivariateGaussian`, `measurePreserving_eval_multivariateGaussian` for coordinates, `measurePreserving_restrict₂_multivariateGaussian` for sub-family marginals, and `stdGaussian_eq_map_pi_orthonormalBasis` for rotation invariance.
  Also use the Banach-space class `IsGaussian`, `isGaussian_iff_charFunDual_eq`, `HasGaussianLaw`, and the equivalence between independence and zero covariance for jointly Gaussian pairs.
- **Moments and transforms.** Under `Mathlib/Probability/Moments/`, use `mgf`, `cgf`, `complexMGF`, `integrableExpSet`, `moment`, `centralMoment`, `variance`, `evariance`, `covariance`, `covarianceBilin`, and `MGFAnalytic`.
  When `0 ∈ interior (integrableExpSet X μ)`, obtain moments from mgfs through `deriv_mgf_zero` and `iteratedDeriv_mgf_zero`; when an explicit mgf formula on a real neighborhood of `0` admits a stated holomorphic continuation, identify the characteristic function through the analyticity of `complexMGF` on its vertical strip (`analyticOnNhd_complexMGF`).
  Obtain mgfs of independent sums through `iIndepFun.mgf_sum`.
  Use `MeasureTheory.charFun`/`charFunDual`, uniqueness via `Measure.ext_of_charFun`, and the independence results `ProbabilityTheory.iIndepFun_iff_charFun_pi` and `IndepFun.charFun_map_add_eq_mul`.
- **Densities, cdfs, and laws.** Use the `StieltjesFunction`-valued `ProbabilityTheory.cdf` together with `measure_cdf` and `Measure.eq_of_cdf`; `MeasureTheory.pdf`/`HasPDF` and `HasPDF.hasLaw`; `Measure.withDensity`; and `HasLaw`/`HasCondDistrib`.
- **Convolution, mixtures, and independence.** Use `Measure.conv`, `MeasureTheory.Measure.conv_assoc` and its surrounding API, and `Measure.bind` with kernel composition.
  Reuse `iIndepFun`, `IndepFun`, `IdentDistrib`, `variance_sum`, and `IndepFun.variance_sum`.
- **Special functions.** Use `Real.Gamma`, `Complex.Gamma`, `ProbabilityTheory.beta`, `Complex.betaIntegral`, `Real.Gamma_add_one`, the log-convexity and Bohr–Mollerup results, and `integral_gaussian`.
- **Change of variables.** Use `Mathlib/MeasureTheory/Function/Jacobian.lean` and `Mathlib/MeasureTheory/Function/JacobianOneDim.lean`.
  The concrete distribution proofs should use `map_withDensity_abs_det_fderiv_eq_addHaar`, `restrict_map_withDensity_abs_det_fderiv_eq_addHaar`, `lintegral_image_eq_lintegral_abs_det_fderiv_mul`, and `integral_image_eq_integral_abs_det_fderiv_smul` rather than introducing another change-of-variables abstraction.
  For the log-normal exponential map, scalar inversion, the Gamma–Beta coordinate map, the Dirichlet normalization chart, Cholesky reconstruction, symmetric congruence, and symmetric inversion, name the source and target regions, the injectivity statement, the derivative determinant, and the resulting measure equality used by the distribution theorem.
- **Matrix and finite-dimensional analysis.** Use `Matrix.PosDef`/`PosSemidef` and their spectral theory, including `Matrix.IsHermitian.spectral_theorem`, `eigenvalues_pos`, `Matrix.IsHermitian.det_eq_prod_eigenvalues`, `Matrix.PosDef.det_pos`, and Sylvester's identity `Matrix.det_one_add_mul_comm`.
  Use the continuous functional calculus on Hermitian matrices, especially `CFC.sqrt`; `Matrix.frobeniusNormedAddCommGroup` and `Matrix.frobeniusNormedSpace` for the Frobenius norm; `Matrix.IsLowerTriangular`; the LDL decomposition in `Mathlib/Analysis/Matrix/LDL.lean`; the Schur-complement file `Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`; and `condDistrib` with `condDistrib_ae_eq_of_measure_eq_compProd`.

  For symmetric matrices, use `selfAdjoint.submodule ℝ` and `Matrix.isHermitian_iff_isSelfAdjoint`.
  For simplex-valued parameters, use `stdSimplex` and `stdSimplex.map`.
  Product Lebesgue measure and the finite-dimensional additive-Haar infrastructure (`MeasureTheory.Measure.addHaar`) supply the starting point for Layer 6, but an arbitrary Haar normalization does not give the classical Wishart constants.

Use these directly.
Do not re-prove Mathlib's Gaussian, Gamma-function, matrix-spectral, or independence infrastructure.
Do not introduce a second pdf abstraction, cdf, or convolution.

## Coordination with existing work

The following Mathlib work fixes API shapes used by this roadmap:

- [mathlib4#40613](https://github.com/leanprover-community/mathlib4/pull/40613) gives the binomial mean;
- [mathlib4#40916](https://github.com/leanprover-community/mathlib4/pull/40916) gives the binomial variance;
- [mathlib4#35504](https://github.com/leanprover-community/mathlib4/pull/35504) gives the exponential mgf, moments, and memorylessness; and
- [mathlib4#34053](https://github.com/leanprover-community/mathlib4/pull/34053) proposes `Real.erf`, `Real.erfc`, `Complex.erf`, and their basic API.

Consume these declarations whenever they are available at Tau Ceti's Mathlib pin.
Otherwise implement matching declarations in Tau Ceti using the linked names and theorem shapes, and remove the local versions once the corresponding Mathlib imports provide them.
Layer 2 needs only the real error functions, not `Complex.erf`.

Two other projects are nearby but do not provide code for this roadmap:

- [`leanprover/SampCert`](https://github.com/leanprover/SampCert) (Apache 2.0) verifies discrete Laplace and discrete Gaussian samplers for differential privacy in its weighted-program monad [`SLang`](https://github.com/leanprover/SampCert/blob/main/SampCert/SLang.lean).
  These are not the continuous `laplaceMeasure` or `gaussianReal` used here.
  Layer 9 independently develops these integer laws as measures and cites SampCert as related work.
  It does not port the samplers, prove differential privacy, or duplicate the `SLang` programming interface.
- [`stat-lib/statlib`](https://github.com/stat-lib/statlib) develops frequentist inference on top of Mathlib.
  Its decision-rule and asymptotic results lie beyond this roadmap's inference boundary.
  Coordinate on the Lean Zulip if future work approaches that boundary.

Additional design references are [mathlib4#42461](https://github.com/leanprover-community/mathlib4/pull/42461) for a lower quantile, [mathlib4#43070](https://github.com/leanprover-community/mathlib4/pull/43070) and its [Bessel discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Bessel.20functions/with/611260325), and [mathlib4#42909](https://github.com/leanprover-community/mathlib4/pull/42909) for measure-level finite uniform laws.
The measure-first API uses `Measure` for distribution laws; [mathlib4#42821](https://github.com/leanprover-community/mathlib4/pull/42821) discusses the corresponding role of PMFs.
These proposals are design references rather than required interfaces; use accepted Mathlib declarations when available and the mathematical conventions specified here otherwise.
The lower-quantile infimum construction agrees with the existing `MeasureTheory.Measure.quantile` in `TauCeti/Probability/Quantile.lean`; reuse that measure-level API rather than introducing the proposal’s functional spelling as a competing definition.
Layer 7 supplies the upper quantile and reflection rules needed for atoms, with interior-level hypotheses that exclude empty or unbounded-below defining sets.
The Bessel target uses the positive-argument series and the regularized hypergeometric representation, with explicit singular-endpoint treatment for negative orders.
Finite uniform uses the existing `uniformOn` measure; PMFs appear only in compatibility theorems.
Build any missing declarations in Tau Ceti without waiting for those proposals or making their acceptance a prerequisite.

Within Tau Ceti, reuse the following existing material directly:

- [`TauCeti/Probability/Distributions/Gaussian/Pi.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Probability/Distributions/Gaussian/Pi.lean), especially `TauCeti.pi_gaussianReal_eq_withDensity`, supplies the isotropic product-density starting point for Layer 5;
- [`TauCeti/MeasureTheory/Measure/GiryMonad.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/MeasureTheory/Measure/GiryMonad.lean) supplies `Measure.map_bind` and `Measure.bind_map` for the mixture and normalization targets;
- [`TauCeti/LinearAlgebra/Matrix/Triangular.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/LinearAlgebra/Matrix/Triangular.lean) supplies the triangular-matrix diagonal and inverse lemmas needed by the Cholesky development; and
- [`TauCeti/Probability/Moments/Determinacy.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Probability/Moments/Determinacy.lean) proves moment determinacy under an exponential-moment hypothesis.

The determinacy theorem belongs to the [orthogonal-L²-bases roadmap](../OrthogonalL2Bases/README.md); use it for uniqueness from moments.

## Work plan

### Layer 0: connect existing densities and add the uniform distribution

Suggested files:

```text
TauCeti/Probability/Distributions/Uniform.lean
TauCeti/Probability/Distributions/PDFInstances.lean
```

Targets:

1. **Connect Mathlib's continuous families to `HasPDF`.** If `HasLaw X (gammaMeasure a r) P`, prove `HasPDF X P` and `pdf X P =ᵐ[volume] gammaPDF a r`.
   Prove the analogous statements for `gaussianReal`, `betaMeasure`, `expMeasure`, `cauchyMeasure`, and `paretoMeasure` on their absolutely continuous parameter ranges.

   Require `v ≠ 0` for `gaussianReal m v` and `γ ≠ 0` for `cauchyMeasure x₀ γ`.
   Their zero-spread laws are Dirac measures and have no pdf with respect to `volume`.
   A single helper, `hasPDF_of_hasLaw_withDensity`, should prove all six cases once the nonzero-spread Gaussian and Cauchy laws have been rewritten as `withDensity` measures.
2. **Identify the Radon–Nikodym derivatives.** Prove `(gammaMeasure a r).rnDeriv volume =ᵐ[volume] gammaPDF a r` and the corresponding statements for `betaMeasure`, `expMeasure`, `cauchyMeasure`, and `paretoMeasure`.
   Use `Measure.rnDeriv_withDensity` in the `withDensity` cases.
   At the boundary `cauchyMeasure x₀ 0 = Measure.dirac x₀`, prove that the derivative is zero almost everywhere.
   Use Mathlib's `rnDeriv_gaussianReal` directly; it already covers both positive variance and the singular zero-variance case.
3. **Define the uniform measure on an interval.** Set `uniformMeasure (a b : ℝ) : Measure ℝ` to `ProbabilityTheory.cond volume (Set.Ioc a b)`.
   This is normalized volume on `Ioc a b` when `a < b`, and the zero measure when `b ≤ a`.
   Mathlib defines `pdf.IsUniform` by `map X ℙ = ProbabilityTheory.cond μ s`, so this choice gives the desired bridge without a second normalization.

   For `a < b`:
   - Define `uniformPDFReal a b x = if x ∈ Set.Ioc a b then (b - a)⁻¹ else 0` and its `ℝ≥0∞`-valued companion.
     Prove the `withDensity`, `HasPDF`, and `rnDeriv` statements.
   - Prove that the cdf is `if x ≤ a then 0 else if b ≤ x then 1 else (x - a) / (b - a)`, the mean is `(a+b)/2`, and the variance is `(b-a)²/12`.
   - Prove `integrableExpSet id = Set.univ`.
     The mgf is `1` at `t = 0` and `(exp (b*t) - exp (a*t)) / ((b-a)*t)` for `t ≠ 0`.
     The cgf is the real logarithm of this positive formula.
   - The characteristic function is `1` at `t = 0` and `(Complex.exp (Complex.I * (b : ℂ) * (t : ℂ)) - Complex.exp (Complex.I * (a : ℂ) * (t : ℂ))) / (Complex.I * ((b - a) : ℂ) * (t : ℂ))` for `t ≠ 0`.
   - Prove the affine identity `(uniformMeasure 0 1).map (fun x => a + (b - a) * x) = uniformMeasure a b` and parameter measurability.

   This is the first complete example of the shared API and establishes the pattern for later families.
4. **Prove parameter measurability for Mathlib's existing families.** The target is `Measurable fun p => fooMeasure p`.
   For `withDensity` families, derive it uniformly from the joint measurability of the pdf in `(p, x)`.
   Separately prove `Measurable fun r : ℝ≥0 => poissonMeasure r`; Layer 4 uses it after composition with `Real.toNNReal` in the Gamma-mixed Poisson kernel.

Key declarations:

```lean
hasPDF_of_hasLaw_withDensity
uniformMeasure
isProbabilityMeasure_uniformMeasure
integral_id_uniformMeasure
variance_id_uniformMeasure
charFun_uniformMeasure
measurable_gammaMeasure
measurable_poissonMeasure
```

Completion checks:

- A random variable with law `uniformMeasure 0 1` is `pdf.IsUniform`-uniform on `Ioc 0 1`.
- The five new `rnDeriv` identifications are proved, and the Gaussian case uses `rnDeriv_gaussianReal` directly.

### Layer 1: complete the elementary theory of existing distributions

Suggested files: continue the existing per-family names, such as `TauCeti/Probability/Distributions/Gamma.lean`, and add `TauCeti/Probability/GeneratingFunction.lean`.

For each family, supply the following missing results:

- **Bernoulli and binomial.** For `Ber((1 : ℝ), 0, p)`, prove the mean `(p : ℝ)`, variance `(p : ℝ) * (1 - p)`, mgf `1 - (p : ℝ) + (p : ℝ) * Real.exp t`, and characteristic function `1 - (p : ℂ) + (p : ℂ) * Complex.exp (I * t)`.
  Its cgf is the real logarithm of the mgf.

  For the cast binomial law `Bin(ℝ, n, p)`, prove the mean `(p : ℝ) * n`, variance `(p : ℝ) * (1 - p) * n`, mgf `(1 - (p : ℝ) + (p : ℝ) * Real.exp t) ^ n`, and characteristic function `(1 - (p : ℂ) + (p : ℂ) * Complex.exp (I * t)) ^ n` for every `t`.
  Its cgf is the real logarithm of the mgf.
  The last expression is a natural-number power, so there is no branch choice.
  On the native carrier, prove `binomial n p ∗ binomial m p = binomial (n + m) p` and the `HasLaw` version of "a sum of `n` i.i.d. Bernoulli variables is binomial."
  Follow Mathlib's notation and the theorem shapes in the linked mean and variance PRs.
  Layer 2's binomial-tail identity supplies the cumulative-mass formula, with Bernoulli as the `n = 1` case; no additional general raw-moment formula is a target.
- **Geometric.** Let `p : I` and `q = 1 - (p : ℝ)`.
  At `p = 0`, Mathlib defines `geometricMeasure 0 = Measure.dirac 0`; prove that its mean and variance are `0` and that its pgf, mgf, and characteristic function are all identically `1`.

  For `p ≠ 0`, prove mean `q / (p : ℝ)`, variance `q / (p : ℝ)^2`, and integrability of the mgf integrand exactly when `q * exp t < 1`.
  On that domain the mgf is `(p : ℝ) / (1 - q * exp t)`; outside it the integrand is not integrable.
  The cgf on the same domain is the real logarithm of the mgf.
  The characteristic function of the cast law is `(p : ℂ) / (1 - q * Complex.exp (Complex.I * t))` for every `t`.
  On the native carrier, prove `(geometricMeasure p).real {k | k ≤ n} = 1 - q ^ (n + 1)` for `p ≠ 0`; at `p = 0`, use the Dirac cumulative-mass formula.

  On the native carrier, prove memorylessness for every `p` in the division-free form `μ {k | n + m ≤ k} * μ Set.univ = μ {k | n ≤ k} * μ {k | m ≤ k}`.
  State the version using `ProbabilityTheory.cond` only when the conditioning event has nonzero measure; this is automatic for `0 < p < 1`.
- **Poisson.** For `(poissonMeasure r).map (Nat.cast : ℕ → ℝ)`, prove mean `(r : ℝ)`, variance `(r : ℝ)`, `integrableExpSet id = Set.univ`, and mgf `Real.exp ((r : ℝ) * (Real.exp t - 1))` for every `t`.
  Prove the cgf `(r : ℝ) * (Real.exp t - 1)`; Layer 2's tail identity supplies the native cumulative-mass formula and hence the cast-law cdf.
  Use Mathlib's `charFun_map_cast_poissonMeasure` and native additivity rather than restating them.
- **Exponential.** For `0 < r`, prove mean `r⁻¹`, variance `r⁻²`, `integrableExpSet id (expMeasure r) = Set.Iio r`, mgf `r / (r - t)` exactly on that domain, characteristic function `(r : ℂ) / (r - I * t)`, and memorylessness via `cond`.
  On the mgf domain, prove the cgf `Real.log (r / (r - t))`.
  Shape the mgf theorem as in mathlib4#35504.
  If `0 < r`, `0 < s`, and independent variables satisfy `X ~ expMeasure r` and `Y ~ expMeasure s`, prove `min X Y ~ expMeasure (r + s)`.
- **Gamma.** Under `0 < a` and `0 < r`, prove mean `a / r`, variance `a / r²`, `integrableExpSet id = Set.Iio r`, mgf `(1 - t / r) ^ (-a)` on that domain, and characteristic function `(1 - Complex.I * t / r) ^ (-(a : ℂ))`.
  On the mgf domain, prove the corresponding cgf as the real logarithm of the displayed real power.
  Use the principal `Complex.cpow`; the base has real part `1`, so it does not cross the branch cut.

  Under `0 < a`, `0 < b`, and `0 < r`, prove `gammaMeasure a r ∗ gammaMeasure b r = gammaMeasure (a + b) r`.
  Under `0 < a`, `0 < r`, and `0 < c`, prove `(gammaMeasure a r).map (c * ·) = gammaMeasure a (r / c)`.
- **Beta.** Under `0 < a` and `0 < b`, prove mean `a / (a + b)`, variance `a * b / ((a + b) ^ 2 * (a + b + 1))`, and, for `n : ℕ`, `∫ x, x ^ n ∂betaMeasure a b = Real.Gamma (a + n) * Real.Gamma (a + b) / (Real.Gamma a * Real.Gamma (a + b + n))`, with `n` coerced to `ℝ` in the Gamma arguments.
  Bounded support gives `integrableExpSet id (betaMeasure a b) = Set.univ`.
  No mgf or characteristic-function formula is required; those formulas use confluent hypergeometric functions.
- **Cauchy.** Prove `charFun (cauchyMeasure x₀ γ) t = exp (I * x₀ * t - γ * |t|)`.
  When `γ ≠ 0`, also prove `cdf (cauchyMeasure x₀ γ) x = 1 / 2 + Real.arctan ((x - x₀) / γ) / π`, `integrableExpSet id (cauchyMeasure x₀ γ) = {0}`, non-integrability of `id`, and non-integrability of the mgf integrand for every `t ≠ 0`.

  At `γ = 0`, use `cauchyMeasure_zero_scale` and prove the Dirac formulas: cdf `if x₀ ≤ x then 1 else 0`, mean `x₀`, variance `0`, `integrableExpSet id = Set.univ`, mgf `exp (t * x₀)`, and cgf `t * x₀`.

  Finally, let `0 < n`, let `P` be a probability measure, and suppose `X : Fin n → Ω → ℝ` satisfies `iIndepFun X P` and `∀ i, HasLaw (X i) (cauchyMeasure x₀ γ) P`.
  Prove `HasLaw (fun ω => (n : ℝ)⁻¹ * ∑ i, X i ω) (cauchyMeasure x₀ γ) P`.
  There is no target for the empty family because its average is undefined.
- **Pareto.** Use Mathlib's threshold `t` and shape `r` in `paretoMeasure t r`.
  Within the valid family `0 < t`, `0 < r`:
  - prove mean `r * t / (r - 1)` when `1 < r`, and non-integrability of `id` when `r ≤ 1`;
  - prove variance `r * t^2 / ((r - 1)^2 * (r - 2))` when `2 < r`, and non-integrability of `x ↦ x^2` when `r ≤ 2`;
  - prove `cdf (paretoMeasure t r) x = if x < t then 0 else 1 - Real.rpow (t / x) r`; and
  - prove `integrableExpSet id (paretoMeasure t r) = Set.Iic 0`.
    The integrand is bounded on the support for `u ≤ 0` and non-integrable for every `u > 0`.
- **Real Gaussian.** Prove `centralMoment id (2*n) = v^n * (2*n - 1)‼`, the vanishing of odd central moments, and `∫ x, |x - m| ^ n ∂gaussianReal m v = Real.rpow (2 * v) ((n : ℝ) / 2) * Real.Gamma ((n + 1) / 2) / Real.sqrt π`.
  Noncentral absolute moments require confluent hypergeometric functions and are not targets.
  The cdf appears in Layer 2.
- **Probability generating functions.** This fills a named gap in [Mathlib's undergraduate curriculum](https://github.com/leanprover-community/mathlib4/blob/9caeba1000ef8f302920981f4a08651d325abc81/docs/undergrad.yaml#L574-L575).
  Define `pgf X μ t = ∫ x, t ^ X x ∂μ` for `ℕ`-valued `X`, and prove `pgf X μ (exp t) = mgf (fun ω => (X ω : ℝ)) μ t`.

  Under a probability measure, prove multiplicativity over independent sums without extra hypotheses for `|t| ≤ 1`, and for arbitrary `t` when both factor integrands are integrable.
  Do not state an unrestricted theorem: Mathlib's totalized integral would make both sides zero when a factor is non-integrable, but that equality is only a consequence of totalization.

  For every `t : ℝ`, prove
  - `pgf id (Ber((1 : ℕ), 0, p)) t = 1 - (p : ℝ) + (p : ℝ) * t` for `p : I`;
  - `pgf id (binomial n p) t = (1 - (p : ℝ) + (p : ℝ) * t)^n` for `n : ℕ` and `p : I`; and
  - `pgf id (poissonMeasure r) t = exp ((r : ℝ) * (t - 1))` for `r : ℝ≥0`.

  For geometric `p ≠ 0`, prove that the pgf integrand is integrable exactly when `|(1 - (p : ℝ)) * t| < 1`.
  On that domain, `pgf id (geometricMeasure p) t = (p : ℝ) / (1 - (1 - (p : ℝ)) * t)`; outside it the integrand is not integrable.
  At `p = 0`, the pgf is `1` for every `t` because the law is Dirac.

  For a probability measure `μ` on `ℕ`, prove coefficient recovery at the origin: `iteratedDeriv n (pgf id μ) 0 = (n.factorial : ℝ) * μ.real {n}`.
  Deduce `measure_eq_of_pgf_eqOn`: probability measures `μ` and `ν` on `ℕ` are equal whenever `Set.EqOn (pgf id μ) (pgf id ν) (Set.Ioo (-1) 1)`.
  Moment extraction at `1` is not a target; it concerns factorial moments and needs additional integrability hypotheses.

Key declarations:

```lean
integral_of_hasLaw_binomial
variance_of_hasLaw_binomial
mgf_id_expMeasure
memoryless_expMeasure
map_min_expMeasure
gammaMeasure_conv_gammaMeasure
charFun_cauchyMeasure
not_integrable_id_cauchyMeasure
centralMoment_two_mul_gaussianReal
pgf
pgf_bernoulliMeasure
pgf_poissonMeasure
iteratedDeriv_pgf_zero
measure_eq_of_pgf_eqOn
```

Completion checks:

- For `X : Ω → ℝ`, derive `Var[X; P] = p * (1 - p) * n` from `HasLaw X Bin(ℝ, n, p) P`.
- Obtain the exponential and geometric memorylessness statements.
- The pgf of an independent sum is the product of the pgfs for `|t| ≤ 1`, and for arbitrary `t` under the stated integrability hypotheses.
- Equality of pgfs on `(-1, 1)` determines the native law on `ℕ`.

### Layer 2: incomplete special functions and closed-form cdfs

Suggested files:

```text
TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean
TauCeti/Analysis/SpecialFunctions/IncompleteBeta.lean
TauCeti/Analysis/SpecialFunctions/Erf.lean
```

This layer develops reusable analysis, not distribution-specific infrastructure.
Use Mathlib's complete Gamma function and `ProbabilityTheory.beta` as the normalizing constant.
For incomplete Gamma, incomplete Beta, and the real error function, consume Mathlib declarations whenever the Tau Ceti pin provides them; otherwise implement the shapes specified here, following the error-function API in [mathlib4#34053](https://github.com/leanprover-community/mathlib4/pull/34053).

Targets:

- **Lower incomplete gamma.** Define `lowerIncompleteGamma s x = if 0 < s then ∫ t in 0..max x 0, t ^ (s-1) * exp (-t) else 0` and `regularizedGamma s x = if 0 < s then lowerIncompleteGamma s x / Gamma s else 0`.

  For `0 < s`, prove convergence, continuity and monotonicity for every `x`, the recurrence `γ(s+1, x) = s * γ(s, x) - x^s * exp (-x)` for `0 ≤ x`, and `regularizedGamma s x → 1` as `x → ∞`.
  Prove strict monotonicity of both lower incomplete gamma and regularized gamma on `[0,∞)` for `s>0`.
  State differentiability with `deriv = x^(s-1) * exp (-x)` only for `0 < x`.
  When `0 < s < 1`, continuity — not differentiability — is the target at `x = 0`.
- **Regularized incomplete beta.** For `0 < a` and `0 < b`, define it as the integral from `0` to `min 1 (max x 0)`, normalized by `ProbabilityTheory.beta a b`.
  Use zero for invalid parameters, with one deliberate exception: `regularizedIncompleteBeta 0 b x = 1` when `0 < b` and `0 ≤ x`.

  For positive `a,b`, prove that the function is `0` on `x ≤ 0`, `1` on `1 ≤ x`, continuous and monotone on `ℝ`, and state differentiability only under `0 < x < 1`.
  Prove strict monotonicity on `[0,1]` for positive shapes.
  For `0 ≤ x ≤ 1`, prove the reflection formula `I_x(a,b) = 1 - I_{1-x}(b,a)`.
  On the same range, prove the unit-step recurrence `I_x(a+1,b) = I_x(a,b) - Real.rpow x a * Real.rpow (1-x) b / (a * ProbabilityTheory.beta a b)`, in the form of [DLMF 8.17.20](https://dlmf.nist.gov/8.17.E20).

  The `a = 0` convention records the cdf of the weak limit `betaMeasure a b → Measure.dirac 0` as `a → 0⁺`.
  It also makes the `m = 0` binomial-tail formula below hold without a separate case.
  Keep the default value zero when `b = 0`; no later target uses that boundary.
  The other possible weak-limit convention would record the cdf of `Measure.dirac 1`.
  Do not state a reflection theorem on either boundary edge: the positive-parameter identity cannot include both atomic limit laws at their discontinuities.
- **Error function.** Using the names from mathlib4#34053, define `Real.erf x = (2 / √π) * ∫ t in 0..x, exp (-t^2)` and `Real.erfc x = 1 - Real.erf x`.
  Prove oddness, strict monotonicity on `ℝ`, the limits at both infinities, the derivative, and `Real.erf x = regularizedGamma (1/2) (x^2)` for `0 ≤ x`.
- **Closed-form cdfs and tails.** Prove:
  - for `v ≠ 0` and every `x`, `cdf (gaussianReal m v) x = (1 + Real.erf ((x - m) / √(2*v))) / 2`;
  - at the singular boundary, `cdf (gaussianReal m 0) x = if m ≤ x then 1 else 0`;
  - for valid gamma and beta parameters and every `x`, `cdf (gammaMeasure a r) x = regularizedGamma a (r * x)` and `cdf (betaMeasure a b) x = regularizedIncompleteBeta a b x`; the special functions are clamped below the support;
  - for `m ≤ n` and `p : I`, `(binomial n p).real {k | m ≤ k} = regularizedIncompleteBeta m (n - m + 1) (p : ℝ)`; and
  - for `r : ℝ≥0`, `(poissonMeasure r).real {k | n < k} = regularizedGamma (n + 1) (r : ℝ)`.

Key declarations:

```lean
lowerIncompleteGamma
regularizedGamma
regularizedIncompleteBeta
Real.erf
Real.erfc
cdf_gaussianReal_eq
cdf_gaussianReal_zero
cdf_gammaMeasure_eq
cdf_betaMeasure_eq
binomial_tail_eq_regularizedIncompleteBeta
poissonMeasure_tail_eq_regularizedGamma
```

Completion checks:

- For `0 ≤ x`, `regularizedGamma 1 x = 1 - exp (-x)`, recovering Mathlib's exponential cdf.
- `Real.erf 0 = 0`.
- For every admissible binomial `p`, including `p = 0`, the tail identity at `m = 0` reduces to `1 = 1` through the stated boundary convention.

### Layer 3: new scalar families

Suggested files: one file per family under `TauCeti/Probability/Distributions/`.

Every family below must satisfy the shared requirements in [What every distribution must provide](#what-every-distribution-must-provide).
The targets here fix the definition, valid parameter range, boundary behavior, and family-specific formulas.
Layers 9–12 specify the additional discrete, scalar, multivariate, and directional families.
Every family and named specialization is subject to the shared requirements and Layer 13 quantile coverage.

- **Laplace** `laplaceMeasure (μ : ℝ) (b : ℝ)`.
  - When `0 < b`, use density `(2b)⁻¹ * exp (-|x - μ| / b)`.
    Prove mean `μ`, variance `2 * b ^ 2`, cdf `if x < μ then exp ((x - μ) / b) / 2 else 1 - exp (-(x - μ) / b) / 2`, `integrableExpSet id = Set.Ioo (-b⁻¹) b⁻¹`, mgf `exp (μ * t) / (1 - b ^ 2 * t ^ 2)` on that domain, its real-log cgf, and characteristic function `exp (I μ t) / (1 + b² t²)`.
  - When `b ≤ 0`, both the pdf and the measure are zero.
- **Log-normal** `logNormalMeasure (μ : ℝ) (v : ℝ≥0)`.
  - Define it by pushforward: `logNormalMeasure μ v = (gaussianReal μ v).map exp`.
    Derive the density theorem from a change of variables rather than using the density as the definition.
  - When `v ≠ 0`, prove the density `fun x => if x ≤ 0 then 0 else (x * Real.sqrt (2 * π * v))⁻¹ * exp (-(Real.log x - μ) ^ 2 / (2 * v))` with respect to `volume`, and the cdf `if x ≤ 0 then 0 else (1 + Real.erf ((Real.log x - μ) / Real.sqrt (2 * v))) / 2`.
    Prove `integrableExpSet id = Set.Iic 0` and non-integrability of the mgf integrand for every `t > 0`.
    There is no closed-form mgf target.
  - When `v = 0`, prove `logNormalMeasure μ 0 = Measure.dirac (exp μ)`.
    At this boundary the cdf is `if exp μ ≤ x then 1 else 0`, the mean is `exp μ`, the variance is `0`, `integrableExpSet id = Set.univ`, the mgf is `exp (t * exp μ)`, the cgf is `t * exp μ`, and the characteristic function is `Complex.exp (Complex.I * (t : ℂ) * Real.exp μ)`.
  - For every `n : ℕ`, including `v = 0`, prove the raw moment `exp ((n : ℝ) * μ + (n : ℝ) ^ 2 * (v : ℝ) / 2)`.
    Record the resulting mean `exp (μ + v / 2)` and variance `(exp v - 1) * exp (2 * μ + v)`.
- **Weibull** `weibullMeasure (k lam : ℝ)`.
  - The pdf and measure are zero unless `0 < k` and `0 < lam`.
  - Under those hypotheses, prove the density `fun x => if x ≤ 0 then 0 else (k / lam) * Real.rpow (x / lam) (k - 1) * exp (-Real.rpow (x / lam) k)`, the cdf `0` for `x ≤ 0` and `1 - exp (-(x/lam)^k)` for `0 < x`, moments `lam^n * Gamma (1 + n/k)`, and variance `lam ^ 2 * (Gamma (1 + 2 / k) - Gamma (1 + 1 / k) ^ 2)`.
  - Distinguish the three mgf regimes exactly:
    - if `1 < k`, the integrand is integrable for every `t : ℝ`, and the mgf is the convergent series `∑' n : ℕ, (t * lam)^n * Real.Gamma (1 + (n : ℝ) / k) / n.factorial`;
    - if `k = 1`, it is integrable exactly for `t < lam⁻¹`, with mgf `(1 - lam * t)⁻¹`; and
    - if `0 < k < 1`, it is integrable exactly for `t ≤ 0` and non-integrable for every `t > 0`.
      No cgf formula is required in this case.
    In the first two regimes, prove the cgf as the real logarithm of the stated mgf on its domain.
- **Chi-squared** `chiSquaredMeasure (k : ℝ)`.
  - Define it as `Measure.dirac 0` when `k = 0`, `gammaMeasure (k/2) (1/2)` when `0 < k`, and the zero measure when `k < 0`.
  - For `0 < k`, prove the bridge to `gammaMeasure` and specialize its pdf, cdf, mean `k`, variance `2k`, `integrableExpSet id = Set.Iio (1 / 2)`, and mgf `Real.rpow (1 - 2 * t) (-(k / 2))` on that domain.
    Prove the cgf as the real logarithm of this formula.
    Prove the characteristic function `(1 - 2 * Complex.I * (t : ℂ)) ^ (-(k : ℂ) / 2)` for every `t`.
  - At `k = 0`, prove cdf `if 0 ≤ x then 1 else 0`, mean and variance `0`, `integrableExpSet id = Set.univ`, mgf and characteristic function identically `1`, and cgf identically `0`.
  - Prove additivity for nonnegative degrees of freedom.
- **Inverse-gamma** `inverseGammaMeasure (a r : ℝ)`.
  - Define it as `(gammaMeasure a r).map (·⁻¹)` when `0 < a` and `0 < r`, and as zero otherwise.
  - In the valid family, prove the density `fun x => if x ≤ 0 then 0 else Real.rpow r a / Real.Gamma a * Real.rpow x (-a - 1) * exp (-r / x)` and the cdf `if x ≤ 0 then 0 else 1 - regularizedGamma a (r / x)`.
  - Prove mean `r / (a - 1)` for `1 < a` and variance `r ^ 2 / ((a - 1) ^ 2 * (a - 2))` for `2 < a`, always with `0 < r`.
    Within the valid family, prove the matching non-integrability for `0 < a ≤ 1` and `0 < a ≤ 2`, respectively.
  - Prove `integrableExpSet id = Set.Iic 0` and non-integrability for `t > 0`.
    The value for `t < 0` is a Bessel expression and is not a target.
- **Student's t** `studentTMeasure (ν : ℝ)`.
  - For `0 < ν`, use density `fun x => Real.Gamma ((ν + 1) / 2) / (Real.sqrt (ν * π) * Real.Gamma (ν / 2)) * Real.rpow (1 + x ^ 2 / ν) (-((ν + 1) / 2))`.
    The measure is zero otherwise.
  - Within the valid family, prove mean `0` when `1 < ν` and non-integrability of `id` when `ν ≤ 1`.
    Prove variance `ν / (ν - 2)` when `2 < ν` and non-integrability of `x ↦ x^2` when `ν ≤ 2`.
  - Writing `z = ν / (ν + x^2)`, prove for every `x` `cdf (studentTMeasure ν) x = if x < 0 then regularizedIncompleteBeta (ν/2) (1/2) z / 2 else 1 - regularizedIncompleteBeta (ν/2) (1/2) z / 2`.
  - Prove `integrableExpSet id (studentTMeasure ν) = {0}` and non-integrability of the mgf integrand for every `t ≠ 0`.
    A closed-form characteristic function would require Bessel-type special functions and is not a target.
- **Fisher's F** `fisherSnedecorMeasure (m n : ℝ)`.
  - For `0 < m` and `0 < n`, use density `fun x => if x ≤ 0 then 0 else Real.Gamma ((m + n) / 2) / (Real.Gamma (m / 2) * Real.Gamma (n / 2)) * Real.rpow (m / n) (m / 2) * Real.rpow x (m / 2 - 1) * Real.rpow (1 + m * x / n) (-((m + n) / 2))`.
    The measure is zero otherwise.
  - Within the valid family, prove mean `n / (n - 2)` when `2 < n` and non-integrability of `id` when `n ≤ 2`.
    Prove variance `2 * n^2 * (m + n - 2) / (m * (n - 2)^2 * (n - 4))` when `4 < n`, and non-integrability of `x ↦ x^2` when `n ≤ 4`.
  - For every `x`, prove `cdf (fisherSnedecorMeasure m n) x = if x ≤ 0 then 0 else regularizedIncompleteBeta (m/2) (n/2) (m*x / (n + m*x))`.
  - Prove `integrableExpSet id (fisherSnedecorMeasure m n) = Set.Iic 0`: the mgf integrand is integrable exactly for `t ≤ 0` and non-integrable for `t > 0`.
    No cgf formula is required.
- **Negative binomial** `negativeBinomialMeasure (r : ℝ) (p : ℝ)`.
  - For `0 < r` and `0 < p ≤ 1`, define the weighted Dirac sum with singleton mass `Gamma (k + r) / (k! * Gamma r) * p^r * (1-p)^k`.
    At `p = 1`, this sum is `Measure.dirac 0`, matching `geometricMeasure 1` and keeping the Layer 4 finite-sum identity valid on all of `0 < p ≤ 1`.
  - When `r = 0` and `0 < p ≤ 1`, define the measure to be `Measure.dirac 0`.
    It is zero for all other parameter values.
  - For `0 ≤ r`, `0 ≤ s`, and `0 < p ≤ 1`, prove the native mass and support formulas and `negativeBinomialMeasure r p ∗ negativeBinomialMeasure s p = negativeBinomialMeasure (r + s) p`.
  - For `0 < r` and `0 < p ≤ 1`, the pgf integrand is integrable exactly when `|(1 - p) * t| < 1`.
    On that domain, prove `pgf id (negativeBinomialMeasure r p) t = Real.rpow (p / (1 - (1 - p) * t)) r`; outside it, prove non-integrability.
    At `r = 0`, the pgf is `1` for every `t`.
  - For the cast law with `0 < r` and `0 < p ≤ 1`, prove mean `r * (1 - p) / p`, variance `r * (1 - p) / p ^ 2`, `integrableExpSet id = {t | (1 - p) * Real.exp t < 1}`, mgf `Real.rpow (p / (1 - (1 - p) * Real.exp t)) r` on that set, and characteristic function `(p / (1 - (1 - p) * Complex.exp (I * t))) ^ (r : ℂ)`.
    On the mgf domain, prove the cgf as the real logarithm of the displayed real power.
    Use principal `Complex.cpow`; the base has positive real part.
  - For `0 < r`, prove the native cumulative-mass formula `(negativeBinomialMeasure r p).real {j | j ≤ k} = regularizedIncompleteBeta r (k + 1) p`; derive the cast-law cdf by taking the floor of its argument.
  - At `r = 0`, prove the Dirac cumulative-mass formula, mean and variance `0`, `integrableExpSet id = Set.univ`, mgf and characteristic function identically `1`, and cgf identically `0`.
    Do not reuse the positive-`r` exponential-moment domain here; it is false at this boundary when `p < 1`.
- **Hypergeometric** `hypergeometricMeasure (N K n : ℕ)`.
  - When `K ≤ N` and `n ≤ N`, define the weighted Dirac sum with coefficient `K.choose k * (N - K).choose (n - k) / N.choose n` — an `ℝ≥0∞` ratio of `Nat.choose` values — when `k ≤ n`, and coefficient `0` when `n < k`.
    Outside that parameter range, use the zero measure.
  - In the valid range, prove that the singleton mass is zero unless `k ≤ K ∧ k ≤ n ∧ n - k ≤ N - K`, and equals the displayed ratio on that exact support.
  - With real casts throughout, prove mean `n * K / N` when `0 < N` and variance `n * (K / N) * (1 - K / N) * ((N - n) / (N - 1))` when `1 < N`.
  - At the only valid parameters with `N = 0`, namely `K = n = 0`, prove mean and variance zero.
    At `N = 1`, retain the mean formula — equal to `1` when `K = n = 1` — and prove only that the variance is zero, avoiding totalized division by `N - 1`.
  - In the valid range, prove the cumulative-mass formula as the finite sum of the singleton masses over `j ≤ k`.
    For the cast law, prove `integrableExpSet id = Set.univ`, the mgf and characteristic function as the corresponding finite sums over `j ≤ n`, and the cgf as the real logarithm of the mgf.
    These finite sums are the requested transform formulas; no Gauss-hypergeometric closed form is a target.
  - Prove `hypergeometricMeasure N K n = hypergeometricMeasure N n K`.
  - For the binomial limit, take `p : I` and `K : ℕ → ℕ`.
    Assume `∀ N, K N ≤ N` and `Tendsto (fun N => (K N : ℝ) / N) atTop (𝓝 (p : ℝ))`.
    For every fixed `k`, prove `Tendsto (fun N => ENNReal.toReal ((hypergeometricMeasure N (K N) n) {k})) atTop (𝓝 (ENNReal.toReal ((binomial n p) {k})))`.

Key declarations:

```lean
laplaceMeasure
charFun_laplaceMeasure
logNormalMeasure_map_exp
integral_pow_logNormalMeasure
chiSquaredMeasure
charFun_chiSquaredMeasure
weibullMeasure
variance_id_weibullMeasure
inverseGammaMeasure
studentTMeasure
integral_id_studentTMeasure
not_integrable_sq_studentTMeasure
fisherSnedecorMeasure
negativeBinomialMeasure
hypergeometricMeasure
```

Completion checks:

- `chiSquaredMeasure 2 = expMeasure (1/2)` as measures.
- `studentTMeasure 1 = cauchyMeasure 0 1`.
- The Weibull cdf at `k = 1` recovers the exponential cdf.

### Layer 4: relationships among distributions

Suggested file: `TauCeti/Probability/Distributions/Relations.lean`, split by source family if it becomes too large.

State these classical identities as pushforwards of product measures, as `Measure.bind` statements for mixtures, and in `HasLaw`/`iIndepFun` form where that is more useful to consumers.

Targets:

1. **Squares of Gaussian variables.** Prove `(gaussianReal 0 1).map (· ^ 2) = chiSquaredMeasure 1`.
   If `X : Fin k → Ω → ℝ` is an i.i.d. standard Gaussian family, prove `HasLaw (fun ω => ∑ i, X i ω ^ 2) (chiSquaredMeasure k) P`.
   At `k = 0`, the sum is empty and `chiSquaredMeasure 0 = Measure.dirac 0`.
2. **Ratios.** Prove the following laws for independent variables:
   - if `0 < ν`, `Z ~ gaussianReal 0 1`, and `V ~ chiSquaredMeasure ν`, then `Z / √(V/ν) ~ studentTMeasure ν`;
   - if `0 < m`, `0 < n`, `U ~ chiSquaredMeasure m`, and `V ~ chiSquaredMeasure n`, then `(U/m) / (V/n) ~ fisherSnedecorMeasure m n`; and
   - if `Z₁` and `Z₂` are standard Gaussian, then `Z₁ / Z₂ ~ cauchyMeasure 0 1`.
3. **Independent gamma variables.** For `0 < a`, `0 < b`, and `0 < r`, prove the joint product-pushforward theorem

   ```lean
   ((gammaMeasure a r).prod (gammaMeasure b r)).map
       (fun z => (z.1 / (z.1 + z.2), z.1 + z.2)) =
     (betaMeasure a b).prod (gammaMeasure (a + b) r)
   ```

   Lean's division totalizes the zero-denominator branch; prove that branch null under the source product measure.
   Deduce the Beta marginal and independence from the sum, together with the corresponding `HasLaw` statement for independent variables.
4. **Sums and differences.** Prove:
   - for `0 < b`, `X - Y` has law `laplaceMeasure 0 b` when `X` and `Y` are i.i.d. with law `expMeasure b⁻¹`;
   - for `p : I` with `p ≠ 0`, the sum of `n` i.i.d. `geometricMeasure p` variables has law `negativeBinomialMeasure (n : ℝ) (p : ℝ)`, including the empty sum at `n = 0` and the Dirac case `p = 1`; and
   - for `0 < n` and `0 < r`, the sum of `n` i.i.d. exponentials has law `gammaMeasure (n : ℝ) r`, the Erlang case of the Layer 1 convolution theorem.
5. **Gamma-mixed Poisson law.** For `0 < r` and `0 < p < 1`, prove `(gammaMeasure r (p / (1 - p))).bind (fun lam => poissonMeasure (Real.toNNReal lam)) = negativeBinomialMeasure r p`.
   Layer 0 supplies the parameter-measurability theorem needed by `Measure.bind`.
6. **Finite minima and maxima.** Include the Layer 1 theorem for the minimum of independent exponentials.
   More generally, let `[Fintype ι] [Nonempty ι]`, let `P : Measure Ω` be a probability measure, and suppose `X : ι → Ω → ℝ` satisfies `iIndepFun X P` and `∀ i, HasLaw (X i) μ P`.
   Put `d = Fintype.card ι`.
   For every `x`, prove `P.real {ω | max i, X i ω ≤ x} = (cdf μ x)^d` and `P.real {ω | min i, X i ω ≤ x} = 1 - (1 - cdf μ x)^d`, together with the equivalent cdf formulas for the two pushforward laws.

   Define the finite maximum and minimum using `Finset.univ` and its nonemptiness proof, so neither theorem acquires an empty-family default.
   A general theory of order statistics is outside this roadmap.

Key declarations:

```lean
map_sq_gaussianReal
hasLaw_sum_sq_gaussian
hasLaw_studentT_of_gaussian_chiSquared
hasLaw_fisherSnedecor_of_chiSquared
hasLaw_ratio_gaussian_cauchy
map_div_add_prod_gammaMeasure
bind_gammaMeasure_poissonMeasure
cdf_max_iid
```

Completion check: at `ν = 1`, the t-ratio and Cauchy-ratio theorems give the same law through `studentTMeasure 1 = cauchyMeasure 0 1` from Layer 3.

### Layer 5: multivariate distributions

Suggested files:

```text
TauCeti/Probability/Distributions/Multinomial.lean
TauCeti/Probability/Distributions/Dirichlet.lean
TauCeti/Probability/Distributions/Gaussian/Multivariate.lean
```

Targets:

1. **Covariance matrices.** Define `covMatrix (μ : Measure (EuclideanSpace ℝ ι)) : Matrix ι ι ℝ` by `covMatrix μ i j = cov[fun z => z i, fun z => z j; μ]`.
   For positive-semidefinite `S`, prove `covMatrix (multivariateGaussian m S) = S`.
   Also prove integrability of `id` and the Bochner mean `∫ x, x ∂multivariateGaussian m S = m`.

   Under `[IsFiniteMeasure μ]` and `MemLp id 2 μ`, connect this matrix to Mathlib's bilinear form: `covarianceBilin μ x y = ⟪x, (covMatrix μ).toEuclideanLin y⟫`.
   Keep the `MemLp` hypothesis.
   Mathlib sets `covarianceBilin` to `0` outside it via `covarianceBilin_of_not_memLp`, while entrywise covariances need not vanish there; a product of Cauchy and Gaussian coordinates gives a nonzero diagonal entry but a zero bilinear form.
2. **Multivariate Gaussian density.** Let `S` be positive-definite and put `d = Fintype.card ι`.
   Prove `HasPDF` with respect to `volume` on `EuclideanSpace ℝ ι`, with density `fun x => Real.rpow (2 * π) (-(d : ℝ) / 2) * Real.rpow S.det (-(1 : ℝ) / 2) * exp (-⟪x - m, (S⁻¹).toEuclideanLin (x - m)⟫ / 2)`.
   The inner product is Euclidean, and the matrix acts through `Matrix.toEuclideanLin`.
   When `S` is not positive-definite, prove singularity with respect to `volume`.
   Derive the positive-definite case from `TauCeti.pi_gaussianReal_eq_withDensity` by an affine change of variables rather than rebuilding the product-density calculation.
3. **Affine maps of Gaussian laws.** For `L : Matrix κ ι ℝ`, `[Fintype κ]`, `c : EuclideanSpace ℝ κ`, and `S.PosSemidef`, prove `(multivariateGaussian m S).map (fun x => L.toEuclideanLin x + c) = multivariateGaussian (L.toEuclideanLin m + c) (L * S * Lᵀ)`.
   Allow rectangular `L`, and distinguish the matrix from its induced map using `Matrix.toEuclideanLin`.

   Do not state this formula for non-positive-semidefinite `S`.
   Mathlib then totalizes `multivariateGaussian m S` to `Measure.dirac m`, and arbitrary projections do not preserve that totalization.

   For every `θ : EuclideanSpace ℝ ι`, prove
   `integrableExpSet (fun x => ⟪θ, x⟫_ℝ) (multivariateGaussian m S) = Set.univ` and
   `mgf (fun x => ⟪θ, x⟫_ℝ) (multivariateGaussian m S) t = exp (t * ⟪θ, m⟫_ℝ + t ^ 2 / 2 * ⟪θ, S.toEuclideanLin θ⟫_ℝ)`.
   Record the coordinate marginals by reusing `measurePreserving_eval_multivariateGaussian` and the corresponding restriction theorem rather than reproving them.

   **Gaussian quadratic forms.** For positive-semidefinite `S` and real symmetric `Θ` (`Θ.IsHermitian`), prove the exact domain
   `t ∈ integrableExpSet (fun x => ⟪x, Θ.toEuclideanLin x⟫_ℝ) (multivariateGaussian 0 S) ↔ (1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef`,
   and on that domain the mgf `Real.rpow (det (1 - (2 * t) • (Θ * S))) (-1 / 2)` together with its cgf as the real logarithm of this value.
   The determinant identity `det (1 - (2 * t) • (Θ * S)) = det (1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S))` follows from `CFC.sqrt_mul_sqrt_self` and `Matrix.det_one_add_mul_comm`, so the value is a positive real power on the domain.
   Prove it by writing `multivariateGaussian 0 S` as the image of `stdGaussian` under `CFC.sqrt S`, rotating `stdGaussian` along the eigenbasis of the Hermitian matrix `CFC.sqrt S * Θ * CFC.sqrt S` with `stdGaussian_eq_map_pi_orthonormalBasis`, and combining the resulting independent scaled squares of standard Gaussians with `iIndepFun.mgf_sum`; the one-dimensional factor `∫ x, exp (s * x ^ 2) ∂gaussianReal 0 1 = Real.rpow (1 - 2 * s) (-1 / 2)` for `s < 1 / 2` follows from `integral_gaussian`, and is the mgf of Layer 3's `chiSquaredMeasure 1` at `s`.
   Layer 6 uses this for the transforms of the Gaussian-Gram Wishart family.
4. **Conditional Gaussian laws.** Use joint carrier `EuclideanSpace ℝ (ι ⊕ κ)`.
   Define the covariance blocks by `Sum`-submatrices: `S₁₁ = S.submatrix Sum.inl Sum.inl`, `S₁₂ = S.submatrix Sum.inl Sum.inr`, `S₂₁ = S.submatrix Sum.inr Sum.inl`, and `S₂₂ = S.submatrix Sum.inr Sum.inr`.
   Let `m₁`, `m₂` be the matching coordinate restrictions.
   If `HasLaw X (multivariateGaussian m S) P`, let `X₁`, `X₂` be the corresponding restrictions of `X`.

   For positive-definite `S`, use parameter measurability to define `gaussianCondKernel` from `fun x₂ => multivariateGaussian (m₁ + (S₁₂ * S₂₂⁻¹).toEuclideanLin (x₂ - m₂)) (S₁₁ - S₁₂ * S₂₂⁻¹ * S₂₁)`.
   Prove the Schur-complement formula `condDistrib X₁ X₂ P =ᵐ[P.map X₂] gaussianCondKernel`; the almost-everywhere quantifier is over the conditioning law `P.map X₂`.
   Use `condDistrib_ae_eq_of_measure_eq_compProd` and Mathlib's Schur-complement API.
   Also prove that block independence is equivalent to `S₁₂ = 0`.
5. **Multinomial distribution.** Assume `[Fintype ι] [Nonempty ι]`.
   Define `multinomialMeasure (n : ℕ) (p : stdSimplex ℝ≥0 ι)` as a weighted Dirac sum on `ι → ℕ`.
   On the support `∑ i, k i = n`, its real singleton mass is `(multinomialMeasure n p).real {k} = (n.factorial : ℝ) / ∏ i, ((k i).factorial : ℝ) * ∏ i, (p i : ℝ) ^ k i`; off that support the mass is zero.
   Using `stdSimplex` as the parameter type removes any invalid branch and supplies `p i ≤ 1` for each coordinate marginal.

   Prove the mass and support formulas, native binomial coordinate marginals, and aggregation along any map `f : ι → κ` between nonempty finite index types.
   The pushforward under `fun k j => ∑ i with f i = j, k i` must be `multinomialMeasure n (stdSimplex.map f p)`.

   Define `multinomialToEuclidean k = EuclideanSpace.equiv.symm (fun i => (k i : ℝ))`.
   For `(multinomialMeasure n p).map multinomialToEuclidean`, not for the native law, prove:
   - mean `EuclideanSpace.equiv.symm (fun i => (n : ℝ) * (p i : ℝ))`;
   - covariance with diagonal `(n : ℝ) * p i * (1 - p i)` and off-diagonal `-((n : ℝ) * p i * p j)`; and
   - characteristic function `(∑ j, (p j : ℝ) * Complex.exp (I * t j)) ^ n`.
     This is a natural-number power, so no branch choice is involved.

   Package the entrywise covariance formula as an equality for `covMatrix` and derive the corresponding `covarianceBilin` theorem.
   For every `θ : EuclideanSpace ℝ ι`, prove that the directional `integrableExpSet` is `Set.univ` and that the directional mgf is `(∑ j, (p j : ℝ) * exp (t * θ j)) ^ n`; its cgf is the real logarithm of this formula.
6. **Dirichlet distribution.** Assume `[Fintype ι] [Nonempty ι]`.
   Define `dirichletMeasure (a : ι → ℝ)` to be zero unless `∀ i, 0 < a i`.
   In the valid case, start with independent `gammaMeasure (a i) 1` variables, divide each coordinate by their sum, and push the result to `EuclideanSpace ℝ ι`.
   Define the normalization map to return the zero vector when the sum vanishes, and prove that this branch is null under the valid source law.

   Prove that the support lies in the pullback of `stdSimplex ℝ ι` along `EuclideanSpace.equiv`.
   When `ι = Fin 2`, evaluation at `0` must recover `betaMeasure (a 0) (a 1)` through Layer 4.

   Under `∀ i, 0 < a i`, write `a₀ = ∑ j, a j` and prove:
   - Bochner mean `EuclideanSpace.equiv.symm (fun i => a i / a₀)`;
   - variance `a i * (a₀ - a i) / (a₀ ^ 2 * (a₀ + 1))`;
   - covariance `-(a i * a j) / (a₀ ^ 2 * (a₀ + 1))` for `i ≠ j`; and
   - for a surjective `f : ι → κ`, the fibre-sum pushforward is `dirichletMeasure (fun j => ∑ i with f i = j, a i)`.
     Surjectivity is required because it keeps every aggregated parameter positive.

   If `[Nontrivial ι]`, prove the coordinate marginal `(dirichletMeasure a).map (fun x => EuclideanSpace.equiv x i) = betaMeasure (a i) (∑ j with j ≠ i, a j)`.
   When `Fintype.card ι = 1`, prove instead `dirichletMeasure a = Measure.dirac (EuclideanSpace.equiv.symm (fun _ => 1))`; the marginal is not a Beta law with a zero second parameter.

   For the density, choose `i₀ : ι` and let `J = {i // i ≠ i₀}`.
   Reconstruct a simplex point from `x : J → ℝ` by keeping the displayed coordinates and setting coordinate `i₀` to `1 - ∑ j, x j`.
   Under positive parameters, the real chart density is zero unless `(∀ j, 0 < x j) ∧ ∑ j, x j < 1`; on that set it is `(Real.Gamma (∑ i, a i) / ∏ i, Real.Gamma (a i)) * (∏ j : J, Real.rpow (x j) (a j - 1)) * Real.rpow (1 - ∑ j, x j) (a i₀ - 1)`.
   Define the `ℝ≥0∞`-valued density with `ENNReal.ofReal`.
   State that `dirichletMeasure a` is the pushforward, along the reconstruction map, of product `volume` on `J → ℝ` with this density.
   Do not claim a density with respect to ambient `d`-dimensional volume.

   Package the variance and covariance formulas as an equality for `covMatrix` and derive the corresponding `covarianceBilin` theorem.
   Bounded simplex support gives `integrableExpSet (fun x => ⟪θ, x⟫_ℝ) (dirichletMeasure a) = Set.univ` for every `θ`.
   No closed-form directional mgf or characteristic-function formula is a target; in particular, the chart integral is not to be renamed as a transform formula.
7. **Parameter measurability.** Prove the shared parameter-measurability target for the multivariate Gaussian, multinomial, and Dirichlet families.
   For the Gaussian, the covariance parameter is taken in coordinates, as the shared requirement prescribes for matrix parameters: `Measurable fun q : EuclideanSpace ℝ ι × (ι → ι → ℝ) => multivariateGaussian q.1 (Matrix.of q.2)`.

Key declarations:

```lean
covMatrix
rnDeriv_multivariateGaussian
map_affine_multivariateGaussian
mgf_inner_toEuclideanLin_multivariateGaussian
condDistrib_multivariateGaussian
multinomialMeasure
dirichletMeasure
dirichletMeasure_marginal_beta
measurable_multivariateGaussian
```

Completion checks:

- The `Fin 1` Gaussian specialization is `gaussianReal`.
- A coordinate of the `Fin 2` multinomial is binomial.
- Evaluation at `0` of the `Fin 2` Dirichlet is `betaMeasure`.
- For a 2×2 covariance matrix, the conditional-Gaussian formula reduces to `m₁ + ρ√(v₁/v₂)(x₂ - m₂)`.

### Layer 6: symmetric matrices and Wishart distributions

Suggested files:

```text
TauCeti/Analysis/Matrix/Frobenius.lean
TauCeti/MeasureTheory/Measure/SymmetricMatrix.lean
TauCeti/LinearAlgebra/Matrix/Cholesky.lean
TauCeti/Analysis/SpecialFunctions/MultivariateGamma.lean
TauCeti/Probability/Distributions/Wishart.lean
```

Targets:

1. **Symmetric matrices and their Lebesgue measure.** Index matrices by `Fin p` and use Mathlib's carrier `selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)`.
   Over `ℝ`, `star` is transpose, so this is exactly the subspace of symmetric matrices; `Matrix.isHermitian_iff_isSelfAdjoint` connects it to the spectral API.
   Do not introduce a separate `Matrix.symmetricSubmodule`.

   Keep the product topology and uniformity already installed on `Matrix`, and keep the resulting subtype topology and uniformity on the self-adjoint submodule; do not install replacements for either one.
   Install the ambient Frobenius norm using `Matrix.frobeniusNormedAddCommGroup` and `Matrix.frobeniusNormedSpace`, whose topology and uniformity are definitionally the product ones.
   Add `Matrix.frobeniusInnerProductSpace` with `⟪A, B⟫_ℝ = ∑ i, ∑ j, A i j * B i j`, prove that it is compatible with that norm, and inherit the normed additive group, normed-space, and inner-product structures on the self-adjoint submodule.
   Do not use `Matrix.toMatrixInnerProductSpace`: its induced topology is not definitionally the product topology.
   Provide explicit coherent instances for `IsUniformAddGroup`, `SecondCountableTopology`, `CompleteSpace`, `ContinuousENorm`, `MeasurableSpace`, `BorelSpace`, and the inner-product `MeasureSpace`; use finite dimensionality for completeness, take the measurable structure to be the Borel structure of the retained subtype topology, and obtain `volume` from `measureSpaceOfInnerProductSpace`.

   On this carrier, provide:
   - dimension `p(p+1)/2`;
   - the Frobenius inner-product topology and Borel σ-algebra;
   - measurability of the positive-definite cone; and
   - the pairing identity `⟪A, Θ⟫_ℝ = trace ((Θ : Matrix _ _ ℝ) * (A : Matrix _ _ ℝ))` for symmetric `A` and `Θ`.
     This makes `charFun` use the same pairing as the real trace statistic below.

   Define `upperTriangle p = {ij : Fin p × Fin p // ij.1 ≤ ij.2}` and the continuous linear equivalence `symmetricCoordinates : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ≃L[ℝ] (upperTriangle p → ℝ)` by reading the upper-triangular entries.
   Record its induced measurable equivalence; equivalently, prove that its coordinate σ-algebra is the Borel σ-algebra just selected.
   Define `symmetricLebesgue p` as the pushforward of product `volume` on `upperTriangle p → ℝ` along `symmetricCoordinates.symm`, and prove that the coordinate equivalence is measure-preserving.

   This fixes the normalization.
   Provide the named instance `MeasureTheory.Measure.IsAddHaarMeasure (symmetricLebesgue p)` needed by Mathlib's Jacobian API.
   Prove the named comparison `volume_symmetricMatrix_eq_smul_symmetricLebesgue`: Frobenius volume is `Real.rpow 2 (((p : ℝ) * ((p : ℝ) - 1)) / 4)` times `symmetricLebesgue p`, with the positive real factor coerced to `ℝ≥0∞` for measure scalar multiplication.
   The casts and `Real.rpow` are essential; the exponent is not the natural-number quotient `p * (p - 1) / 4`.
   Prove explicitly that `symmetricLebesgue 0` is the Dirac measure on the unique zero-dimensional symmetric matrix.
   Prove `symmetricLebesgue_setOf_det_eq_zero`: the singular matrices `{A | det A = 0}` are `symmetricLebesgue p`-null.
   Prove this by expanding the determinant along one diagonal coordinate, on whose fibres it is an affine function with at most one root unless the complementary minor vanishes, and use Fubini in the product coordinates with induction on `p`; suitable imported polynomial-zero-locus infrastructure may replace parts of this argument.
   Item 4 uses this for the singularity of the Gaussian-Gram family.

   For `C : Matrix.GeneralLinearGroup (Fin p) ℝ`, define `symmetricCongruence C` by `A ↦ C * A * Cᵀ`.
   In `symmetricCoordinates`, prove that its determinant is `(Matrix.det (C : Matrix _ _ ℝ)) ^ (p + 1)`.
   Equivalently, prove `(symmetricLebesgue p).map (symmetricCongruence C) = ((ENNReal.ofReal |Matrix.det (C : Matrix _ _ ℝ)|) ^ (p + 1))⁻¹ • symmetricLebesgue p`.
   This change of variables supplies the general-scale Wishart formulas.
   The next item gives the separate positive-cone change of variables.
2. **Cholesky decomposition.** Define the target subtype with `Matrix.IsLowerTriangular` and positive diagonal; do not restate lower triangularity entrywise.
   Build the Cholesky factor from Mathlib's `LDL.lower` and `LDL.diag`.
   As an explicit prerequisite, prove `Matrix.IsLowerTriangular (LDL.lower hS)` from `LDL.lowerInv_triangular` and `blockTriangular_inv_of_blockTriangular`.

   Package Cholesky and `L ↦ L * Lᵀ` as `choleskyEquiv` between the positive-definite symmetric matrices and the positive-diagonal lower-triangular matrices.
   Prove both named inverse identities, continuity and measurability in both directions, and expose the resulting homeomorphism and measurable equivalence.
   The equation `A = L * Lᵀ` and uniqueness are corollaries of this package.

   Keep the positive-diagonal lower-triangular carrier's existing subtype topology and Borel structure; do not define a second topology by inducing along the coordinate map.
   Prove that its diagonal and strict-lower-triangular coordinate map is a homeomorphism for that subtype topology, and use the resulting product coordinates in the Jacobian theorem.
   In those coordinates, prove that the absolute determinant of the derivative of `L ↦ L * Lᵀ` is `2 ^ p * ∏ i : Fin p, (L i i) ^ (p - i.1)`.
   Prove that the restriction of `symmetricLebesgue p` to the positive-definite cone is the pushforward, under `L ↦ L * Lᵀ`, of the positive-diagonal coordinate region weighted by `2 ^ p * ∏ i : Fin p, (L i i) ^ (p - i.1)`.
   The multivariate-Gamma integral and Bartlett decomposition must use this Jacobian in these exact coordinates.
   A Cholesky value outside the positive-definite subtype is not part of this API.
   Indexing by `Fin p` fixes the ordering and the zero-based rank used in Bartlett decomposition.
3. **Multivariate Gamma function.** Define `multivariateGamma (p : ℕ) (a : ℝ) = Real.rpow π (((p : ℝ) * ((p : ℝ) - 1)) / 4) * ∏ i : Fin p, Real.Gamma (a - (i.1 : ℝ) / 2)`.
   The casts and `Real.rpow` are part of the definition: the exponent is real, not the natural-number quotient `p * (p - 1) / 4`.

   For `0 < p` and `a > ((p : ℝ) - 1) / 2`, prove `∫ A in PosDef, Real.rpow (det A) (a - ((p : ℝ) + 1) / 2) * exp (-trace A) ∂symmetricLebesgue p = multivariateGamma p a`.
   At `p = 0`, prove the same identity for every `a`; both sides are `1`, so no convergence hypothesis is needed.
   The occurrence of `symmetricLebesgue p` in this theorem is essential: its normalization is the one used by the Wishart density, and the Cholesky theorem computes the integral in independent lower-triangular coordinates.
4. **Wishart distributions.** Use two linked families so that the generic Wishart development does not turn legitimate singular laws into the zero measure.
   Expressions such as `det A`, `A⁻¹`, and `trace A` refer to the underlying matrix of a bundled symmetric value.

   **Nonsingular real-degree family.** Define `nonsingularWishartMeasure (n : ℝ) (S : Matrix (Fin p) (Fin p) ℝ)` on the symmetric-matrix subspace.
   When `hS : S.PosDef`, write `Sₛ` for `S` bundled into that subspace using `hS.isHermitian` and `Matrix.isHermitian_iff_isSelfAdjoint`.
   When `S.PosDef` and `(p : ℝ) - 1 < n`, define the law relative to `symmetricLebesgue p`.
   On the positive-definite cone its density is `Real.rpow (det A) ((n - (p : ℝ) - 1) / 2) * exp (-trace (S⁻¹ * A) / 2) / (Real.rpow 2 (n * (p : ℝ) / 2) * Real.rpow (det S) (n / 2) * multivariateGamma p (n / 2))`; outside the cone it is zero.
   Define this measure to be zero when either parameter hypothesis fails.
   This real-degree density family deliberately fixes a positive-definite scale matrix; singular scales belong to the Gaussian-Gram family below.

   Do not add a separate definition at `p = 0`.
   The symmetric space is then a singleton, `symmetricLebesgue 0` is Dirac, and the empty determinants, trace, and normalizing constant make the density `1`.
   Thus, for `-1 < n`, the general definition already gives the Dirac law and the theorems below need no dimension-zero exception.

   Prove that `nonsingularWishartMeasure n S` is a probability measure under exactly the stated hypotheses, its mean is `n • Sₛ`, and its entrywise covariance is
   `cov[fun A => (A : Matrix _ _ ℝ) i j, fun A => (A : Matrix _ _ ℝ) k l; nonsingularWishartMeasure n S] = n * (S i k * S j l + S i l * S j k)`.
   Obtain the mean and covariance from the trace mgf below: its domain contains a neighbourhood of `0`, so `deriv_mgf_zero` and `iteratedDeriv_mgf_zero` give the first two moments of `trace (Θ * A)` for every symmetric `Θ`, and polarization over the symmetrized elementary matrices `Θ = (Matrix.single i j 1 + Matrix.single j i 1) / 2` recovers the entries.
   The same derivation serves the Gaussian-Gram family below, including its covariance at `ν < p`, which the density family cannot supply.

   At fixed `S`, prove convolution when `(p : ℝ) - 1 < n₁`, `(p : ℝ) - 1 < n₂`, and `(p : ℝ) - 1 < n₁ + n₂`.
   The last condition is automatic for `0 < p`, but not for `p = 0`: two inputs greater than `-1` may have sum at most `-1`, where the totalized output law is zero rather than Dirac.

   For `M : Matrix (Fin q) (Fin p) ℝ` with `M.rank = q`, prove that the pushforward under `A ↦ M * A * Mᵀ` is `nonsingularWishartMeasure n (M * S * Mᵀ)`.
   Full row rank keeps the new scale matrix positive-definite.
   The intended mgf proof uses `det (I + 2 • ((Mᵀ * Θ * M) * S)) = det (I + 2 • (Θ * (M * S * Mᵀ)))`.
   Record invertible congruence and principal-submatrix marginals as special cases.
   Deficient-row-rank congruences are handled by the Gaussian-Gram family rather than this density family.

   In every transform theorem, take `Θ : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)` rather than alternating between a raw matrix plus a symmetry proof and a bundled matrix.
   Prove the exact domain theorem `mem_integrableExpSet_trace_mul_nonsingularWishartMeasure_iff`:
   `t ∈ integrableExpSet (fun A ↦ trace ((Θ : Matrix _ _ ℝ) * A)) (nonsingularWishartMeasure n S) ↔ (I - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef`.
   On this domain, prove `mgf_trace_mul_nonsingularWishartMeasure` with value `Real.rpow (det (I - (2 * t) • ((Θ : Matrix _ _ ℝ) * S))) (-n / 2)`.
   Prove `cgf_trace_mul_nonsingularWishartMeasure` on the same domain as the real logarithm of this value.
   This uses Mathlib's scalar mgf on the trace statistic; do not introduce a separate matrix-valued transform.

   For positive-semidefinite `Θ`, record the `t = -1` cone-Laplace specialization without wrapping it in a new transform definition.
   Prove a named lemma that `CFC.sqrt S * (Θ : Matrix _ _ ℝ) * CFC.sqrt S` is Hermitian from `S.PosSemidef` and the bundled symmetry of `Θ`; positive semidefiniteness suffices, and stating it that way lets the Gaussian-Gram family below reuse it.
   Use that lemma internally in the spectral characteristic-function statement; callers do not supply an `hB` proof.
   State the formula as the exponential of `-(n : ℂ) / 2` times the sum of the principal logarithms of `1 - 2 * Complex.I * λ`, one for each eigenvalue `λ` of this Hermitian sandwich.
   Do not replace it by a principal complex power of the determinant: as explained in [Mayerhofer's branch analysis](https://arxiv.org/abs/1901.09347), multiplying the factors before taking `Complex.log` can cross the branch cut.
   Prove it by analytic continuation of the trace mgf: `complexMGF` of the trace statistic is analytic on the vertical strip over the mgf domain (`analyticOnNhd_complexMGF`), it agrees there with `exp (-(n / 2) * ∑ j, log (1 - 2 * z * λ j))` because both are analytic and agree on the real interval, and `charFun μ Θ` is its value at `z = I` through the pairing identity.
   Factor this step into one lemma about a real random variable whose mgf is a product `∏ j, (1 - 2 * t * λ j) ^ (-a j)` on its natural domain, so that both Wishart families use it; `Suggested.lean` shows one form.

   Under the canonical `Fin 1` symmetric-coordinate equivalence, prove for `0 < n` and `0 < σ²` that `nonsingularWishartMeasure n (σ²)` is `(chiSquaredMeasure n).map (σ² * ·)`.

   **Natural-degree Gaussian-Gram family.** Define `wishartGramMeasure (ν : ℕ) (S : Matrix (Fin p) (Fin p) ℝ)` as the pushforward of `Measure.pi (fun _ : Fin ν => multivariateGaussian 0 S)` under `X ↦ ∑ r, Matrix.vecMulVec (X r) (X r)`, bundled into the symmetric subspace, with no branch on `S`.
   This inherits Mathlib's totalization deliberately: when `S` is not positive semidefinite, `multivariateGaussian 0 S = Measure.dirac 0`, so `wishartGramMeasure ν S = Measure.dirac 0` for every `ν`.
   Prove that it is a probability measure for every `ν` and every `S`, that `wishartGramMeasure 0 S = Measure.dirac 0`, and the `HasLaw` statement that the Gram sum of an i.i.d. `multivariateGaussian 0 S` family has this law; none of these needs a hypothesis on `S`.

   Under `S.PosSemidef`, prove support in the positive-semidefinite cone, the almost-sure rank bound `rank A ≤ min ν S.rank`, and, for every `M : Matrix (Fin q) (Fin p) ℝ` with no rank hypothesis, that congruence pushes `wishartGramMeasure ν S` to `wishartGramMeasure ν (M * S * Mᵀ)`.
   The positive-semidefinite hypothesis on congruence is necessary: a projection can carry a scale that is not positive semidefinite to one that is.
   For all natural `ν₁`, `ν₂` and every `S`, prove `wishartGramMeasure ν₁ S ∗ wishartGramMeasure ν₂ S = wishartGramMeasure (ν₁ + ν₂) S`, by splitting `Measure.pi` over `Fin (ν₁ + ν₂) ≃ Fin ν₁ ⊕ Fin ν₂`; through the equality below this also yields the density family's convolution at natural degrees.

   For positive-semidefinite `S`, bundled symmetric `Θ`, and `0 < ν`, prove the exact domain theorem
   `t ∈ integrableExpSet (fun A ↦ trace ((Θ : Matrix _ _ ℝ) * A)) (wishartGramMeasure ν S) ↔ (I - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef`;
   at `ν = 0` the law is Dirac and the domain is `Set.univ`, stated separately, and for every `S`, `Θ`, and `t` the mgf is `1` and the cgf is `0`.
   On that positive-definite domain, for every `ν`, prove `mgf_trace_mul_wishartGramMeasure` with value `Real.rpow (det (I - (2 * t) • ((Θ : Matrix _ _ ℝ) * S))) (-(ν : ℝ) / 2)`, `cgf_trace_mul_wishartGramMeasure` as its real logarithm, and the `t = -1` cone-Laplace specialization for positive-semidefinite `Θ`.
   These follow from the Gaussian quadratic-form mgf of Layer 5 by independence over the `Fin ν` factors (`iIndepFun.mgf_sum`).
   Prove `charFun_wishartGramMeasure` by the same spectral formula as for the density family, with `n = ν`, using the shared continuation lemma and the Hermitian-sandwich lemma at positive-semidefinite `S`.
   Derive the mean `(ν : ℝ) • Sₛ` and the entrywise covariance, the formulas above with `n = ν`, from the trace mgf as described for the density family.

   For `S.PosDef` and `p ≤ ν`, prove `wishartGramMeasure ν S = nonsingularWishartMeasure (ν : ℝ) S` from the two characteristic-function formulas and `Measure.ext_of_charFun`; deduce the `HasLaw` corollary that the Gram sum of an i.i.d. `multivariateGaussian 0 S` family has law `nonsingularWishartMeasure (ν : ℝ) S`.
   For `S.PosSemidef` with `min ν S.rank < p`, prove that `wishartGramMeasure ν S` is singular with respect to `symmetricLebesgue p`, using the rank bound and `symmetricLebesgue_setOf_det_eq_zero` from item 1.
5. **Bartlett decomposition.** Let `ν : ℕ` with `p ≤ ν`.
   Lift `nonsingularWishartMeasure (ν : ℝ) 1` to the positive-definite subtype using `(nonsingularWishartMeasure (ν : ℝ) 1).comap Subtype.val`, then apply the Cholesky equivalence.
   Prove that mapping the lift back along `Subtype.val` returns the original Wishart law.
   The proof should use `map_comap_subtype_coe` to obtain the restriction to the measurable cone, then remove that restriction because the cone's complement is null under the valid law.

   For the resulting Cholesky factor `T`, give one joint `iIndepFun` theorem for the diagonal and strict-lower-triangular entries:
   - `(T i i) ^ 2` has law `chiSquaredMeasure (ν - i.1)`;
   - `T i j` has law `gaussianReal 0 1` whenever `j < i`; and
   - all these entries are independent.

   The zero-based `Fin p` index fixes the degrees of freedom in the diagonal laws.
6. **Inverse-Wishart distribution.** Define `inverseWishartMeasure n S` by starting with `nonsingularWishartMeasure n S⁻¹` and mapping it under the symmetric-subspace map induced by `A ↦ A⁻¹`.
   Mathlib's totalized inverse is zero on singular matrices; keep that value.
   The singular set is null for valid source parameters, and the inverse-Wishart measure is zero in the same invalid-parameter cases as Wishart.

   Prove the inversion change of variables on the positive-definite cone: the pushforward of `(symmetricLebesgue p).restrict PosDef` under `A ↦ A⁻¹` is `((symmetricLebesgue p).restrict PosDef).withDensity (fun B => ENNReal.ofReal (Real.rpow (det B) (-((p : ℝ) + 1))))`.

   For `S.PosDef` and `(p : ℝ) - 1 < n`, derive the density `Real.rpow (det S) (n / 2) * Real.rpow (det A) (-((n + (p : ℝ) + 1) / 2)) * exp (-trace (S * A⁻¹) / 2) / (Real.rpow 2 (n * (p : ℝ) / 2) * multivariateGamma p (n / 2))` on the positive-definite cone.

   If `0 < p` and `(p : ℝ) + 1 < n`, prove mean `(n - (p : ℝ) - 1)⁻¹ • Sₛ`.
   Within the valid family, prove non-integrability of the identity at and below that threshold.
   At `p = 0`, every valid inverse-Wishart law is Dirac at the unique zero matrix; prove that the identity is integrable with mean zero for every `-1 < n`.
7. **Parameter measurability.** Prove the shared target for `nonsingularWishartMeasure`, `wishartGramMeasure`, and `inverseWishartMeasure` with the scale in coordinates, for example `Measurable fun q : ℝ × (Fin p → Fin p → ℝ) => nonsingularWishartMeasure q.1 (Matrix.of q.2)`, with `ℕ` in place of `ℝ` for the natural degree.
   Record the corollary in which the scale ranges over `selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)` with the Borel σ-algebra of item 1; a Wishart kernel with a random scale is built from that form.
8. **Real-degree Schur complements and inverse-Wishart diagonal marginals.** For `p>0`, `S.PosDef`, and real degree `n>p-1`, let `W~nonsingularWishartMeasure n S⁻¹`.
   For each coordinate `i`, prove that `((W⁻¹) i i)⁻¹` has law `(chiSquaredMeasure (n-p+1)).map ((S i i)⁻¹ * ·)`.
   Identify this reciprocal with the scalar Schur complement after separating coordinate `i` from its complementary principal block.
   Prove the block determinant and inverse identities, the change-of-variables Jacobian in the fixed symmetric coordinates, and the gamma integrals that give this marginal for real degrees; the natural-degree Bartlett theorem alone is insufficient.
   Deduce that coordinate `A ↦ A i i` of `inverseWishartMeasure n S` has law `inverseGammaMeasure ((n-p+1)/2) (S i i/2)`.
   For `p=1`, the complementary block is empty and the result reduces to the scalar chi-squared/inverse-gamma identities.

Key declarations:

```lean
symmetricCoordinates
symmetricLebesgue
symmetricLebesgue_zero
symmetricLebesgue_setOf_det_eq_zero
Matrix.frobeniusInnerProductSpace
volume_symmetricMatrix_eq_smul_symmetricLebesgue
symmetricCongruence
det_symmetricCongruence
map_symmetricCongruence_symmetricLebesgue
isLowerTriangular_ldl_lower
choleskyEquiv
choleskyHomeomorph
choleskyMeasurableEquiv
abs_det_fderiv_choleskyReconstruction
map_cholesky_symmetricLebesgue
map_inv_symmetricLebesgue
multivariateGamma
integral_posDef_multivariateGamma
nonsingularWishartMeasure
isProbabilityMeasure_nonsingularWishartMeasure
wishartGramMeasure
isProbabilityMeasure_wishartGramMeasure
wishartGramMeasure_zero
hasLaw_sum_vecMulVec_gaussian
wishartGramMeasure_conv_wishartGramMeasure
wishartGramMeasure_eq_nonsingularWishartMeasure
hasLaw_sum_vecMulVec_gaussian_nonsingularWishartMeasure
mutuallySingular_wishartGramMeasure_symmetricLebesgue
integral_id_nonsingularWishartMeasure
mem_integrableExpSet_trace_mul_nonsingularWishartMeasure_iff
mgf_trace_mul_nonsingularWishartMeasure
cgf_trace_mul_nonsingularWishartMeasure
charFun_nonsingularWishartMeasure
mem_integrableExpSet_trace_mul_wishartGramMeasure_iff
mgf_trace_mul_wishartGramMeasure
cgf_trace_mul_wishartGramMeasure
charFun_wishartGramMeasure
bartlett_nonsingularWishartMeasure
inverseWishartMeasure
integral_id_inverseWishartMeasure
measurable_nonsingularWishartMeasure
measurable_wishartGramMeasure
hasLaw_reciprocal_inv_diagonal_nonsingularWishartMeasure
map_diagonal_inverseWishartMeasure
```

Completion checks:

- For every `p`, the selected topology and uniformity on `selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)` are definitionally equal to the corresponding subtype instances, and the topology induced by the selected uniformity is definitionally the selected topology.
- For every `p`, the selected topology and uniformity on the positive-diagonal lower-triangular carrier are definitionally the corresponding subtype instances.
- Under the stated positive parameters, the `1 × 1` nonsingular Wishart law agrees with Layer 3's chi-squared law through the explicit coordinate equivalence.
- For every natural `ν` and `0 ≤ σ²`, the `1 × 1` Gaussian-Gram law is `(chiSquaredMeasure ν).map (σ² * ·)` through the same equivalence, by Layer 4 item 1; at `ν = 0` both sides are `Measure.dirac 0`.
- In every dimension, the natural-degree Gaussian-Gram and nonsingular density families agree when `S.PosDef` and `p ≤ ν`, and their trace mgfs, cgfs, and characteristic functions are literally the same formulas there.
- `multivariateGamma 1 a = Gamma a`.

### Layer 7: affine laws, quantiles, and distribution constructions

This layer applies to every valid probability law in this roadmap, including the families in Layers 0–6.
It supplies measure-level results before specializing them to named distributions.
In the formulas below, `F(x) = cdf μ x` and `F(x-) = μ.real (Set.Iio x)`.

1. **Location and scale.** Work with `μ.map (fun x : ℝ => a + b * x)` for arbitrary real `a, b`, rather than a second distribution structure.
   Prove probability preservation, joint parameter measurability in `(μ, a, b)` for probability measures, composition of affine maps, the Dirac law at `b = 0`, and the `HasLaw` transport theorem.
   For `b ≠ 0`, prove the transformed density `|b|⁻¹ * f ((x-a)/b)`, with the corresponding `HasPDF` and Radon–Nikodym statements.
   Prove the cdf formulas `F ((x-a)/b)` for `b > 0` and `1 - F (((x-a)/b)-)` for `b < 0`; the left limit is essential when atoms are present.
   Prove transport of integrability, mean, variance, and every natural raw and central moment under the corresponding absolute-moment hypotheses.
   Prove `mgf id (μ.map (a + b * ·)) t = exp (a*t) * mgf id μ (b*t)`, the analogous characteristic-function identity, and the exact exponential-integrability preimage `{t | b*t ∈ integrableExpSet id μ}`.
   Give the cgf formula on this domain.
   Specialize the generic transport results to every scalar family.
   The named parameter identities required in addition to that transport are listed below; all other affine images retain the explicit pushforward rather than acquiring a new distribution definition.
   In the tables, `Y=a+b*X`; parameters not mentioned stay fixed, and every identity assumes valid input parameters.

   | Family | Required affine parameter identity |
   | --- | --- |
   | Gaussian `(m,v)` | `(a+b*m,b²*v)` for every `b`. |
   | Cauchy `(m,γ)` | `(a+b*m,abs(b)*γ)` for every `b`, including its zero-scale convention. |
   | Laplace and logistic `(m,s)` | `(a+b*m,abs(b)*s)` for `b≠0`. |
   | Uniform on `(l,r]` | Endpoints `a+b*l,a+b*r` for `b>0`, reversed for `b<0`; endpoint conventions agree as measures. |
   | Triangular `(l,r,c)` | Endpoints transformed and sorted, mode `a+b*c`, for `b≠0`. |
   | Gumbel `(m,s)` and GEV `(m,s,ξ)` | Location `a+b*m`, scale `b*s`, for `b>0`. |
   | Lévy `(m,c)` | `(a+b*m,b*c)` for `b>0`. |
   | Skew-normal `(m,s,α)` | `(a+b*m,abs(b)*s,sign(b)*α)` for `b≠0`. |
   | Truncated Gaussian | Transform its Gaussian parameters and truncation interval, reversing endpoints and their inclusion flags when `b<0`. |

   For negative `b`, maximum-Gumbel, GEV, and Lévy images are the reflected laws specified in Layer 10, not members of the same named family in general.
   At `b=0`, every valid probability law maps to Dirac at `a`; do not extend families that have no zero-scale convention merely to name this image.

   | Family | Required positive-scaling identity, `a=0`, `b>0` |
   | --- | --- |
   | Exponential of rate `r`; Gamma of shape `k`, rate `r` | Rate `r/b`. |
   | Inverse-gamma `(k,r)` | Second parameter `b*r`. |
   | Weibull of shape `k`, scale `s`; Pareto of threshold `t`, shape `r` | Scale `b*s`; threshold `b*t`, respectively. |
   | Log-normal `(m,v)` | Log-location `m+log b`. |
   | Chi `(k,s)` and noncentral chi `(k,δ,s)` | Scale `b*s`; this includes half-normal, Rayleigh, and Maxwell. |
   | Rice `(ν,s)`; folded normal `(m,s)` | `(b*ν,b*s)`; `(b*m,b*s)`, respectively. |
   | Nakagami `(m,Ω)` | Spread `b²*Ω`. |
   | GPD `(s,ξ)`; log-logistic of scale `s`, shape `k` | Scale `b*s`. |
   | Inverse Gaussian `(μ,λ)` | `(b*μ,b*λ)`. |
   | Gompertz of shape `η`, rate `r` | Rate `r/b`. |

   Also prove Beta reflection `1-X~Beta(β,α)` for `X~Beta(α,β)` and Student-t reflection `-X~StudentT(ν)`; the noncentral-t reflection changes `δ` to `-δ`.
   For atom mixtures, truncations, and independent sums, prove that affine pushforward commutes with the defining mixture, event transformation when `b≠0`, or sum with its accumulated translation; for compound Poisson the jump-law identity concerns linear scaling, while translations remain an outer pushforward.
   Arbitrary real affine transformations of discrete laws concern their real cast.
   On `ℤ`, prove integer-translation and reflection transport.
   Translation by `h : ℤ` adds `h` to the endpoints of integer-interval uniform and to the center of discrete Laplace or discrete Gaussian; reflection negates and reverses the interval endpoints or negates the center, leaving the other parameters fixed.
   Skellam reflection exchanges its two rates.
   On `ℕ`, use natural-number translations; reflection is stated only after casting to `ℤ` or `ℝ`.
   Include the finite-support identities `n-X~Binomial(n,1-p)` and `n-X~BetaBinomial(n,β,α)`, with support bounds justifying natural subtraction, and the analogous hypergeometric complement `n-X~Hypergeometric(N,N-K,n)`.

2. **Lower and upper quantiles.** Reuse `MeasureTheory.Measure.quantile` from `TauCeti/Probability/Quantile.lean`, with `μ.quantile u = sInf {x : ℝ | u ≤ cdf μ x}`.
   Add the upper counterpart `sInf {x : ℝ | u < cdf μ x}` on the same measure carrier.
   For a probability measure, write `Qμ(u)` and `Qμ⁺(u)` for the lower and upper quantiles.
   All finite-valued distribution theorems have `0 < u < 1` as an explicit hypothesis.
   Reuse `nonempty_setOf_le_cdf` and `bddBelow_setOf_le_cdf` for the lower quantile; prove the corresponding upper-quantile bounds before using conditional completeness of `ℝ`.
   Outside this range the definitions retain the ordinary `sInf` totalization; do not present its value as a probabilistic endpoint quantile.
   Reuse `monotoneOn_quantile`, `measurable_quantile`, and `quantile_le_iff`.
   Prove the upper counterparts, left continuity of the lower quantile in the level, and `F(Qμ(u)-) ≤ u ≤ F(Qμ(u))`; the upper quantile has its own strict-level characterizations, not the lower adjunction with a changed symbol.
   The latter inequalities alone do not characterize the lower quantile when the cdf has a flat interval; retain the adjunction as the general characterization.
   If `F` is continuous, prove `F(Qμ(u)) = u`; if it is strictly increasing on its support interval, prove uniqueness there.
   Prove joint measurability of `(μ,u) ↦ Qμ(u)` on probability measures and interior levels, using the Giry measurable structure, and the corresponding parameterized-family corollary.
   Reuse `map_quantile_volume_Ioo` and `measurePreserving_quantile` for inverse transform sampling, prove the bridge `(uniformMeasure 0 1).map Qμ = μ`, and prove the probability-integral-transform theorem for atomless real laws.
   Endpoint values are specified through the one-sided limits as `u ↓ 0` and `u ↑ 1`, in `EReal`; identify these with the infimum and supremum of the topological support, allowing infinite endpoints.

   Prove `Q(μ.map (a+b*·))(u) = a+b*Qμ(u)` when `b > 0`, the value `a` when `b = 0`, and `a+b*Qμ⁺(1-u)` when `b < 0`.
   Prove the analogous upper-quantile formulas and the identities for continuous strictly monotone transformations on a support interval.
   Increasing transformations use the lower quantile; decreasing ones use the upper quantile at `1-u` unless the two quantiles are proved equal there.
   Include exponential, logarithm, positive powers, square root, and reciprocal on the positive half-line as explicit specializations.
   For discrete laws on `ℕ` or `ℤ`, prove that the cast-law quantile is the least integer whose cumulative mass is at least `u`, including finite-support boundary cases.
   No ordering, scalar cdf, or scalar quantile is imposed on an abstract finite type, a vector, a matrix, or a circle.
   For those carriers, quantile targets concern the real observables explicitly listed in Layers 11–12.

3. **Conditioning and interval truncation.** Reuse `ProbabilityTheory.cond`.
   For measurable `A` with `0 < μ A < ∞`, prove the probability, density/mass, integral, and parameter-measurability formulas for `μ[|A]`.
   For measurable parameterized sets, state measurability through the measurability of their incidence set; include all four interval endpoint conventions and the set `{0}ᶜ`.
   Zero conditioning mass gives the zero measure, not an arbitrary probability measure.
   For truncation to `(l,r]`, allowing infinite bounds, put `L = μ.real (Iic l)` and `R = μ.real (Iic r)` with their natural values `0,1` at infinite endpoints.
   When `L < R`, prove the clipped cdf `(min R (max L (F x)) - L)/(R-L)` and quantile `Qμ(L+u*(R-L))`.
   For `[l,r]`, `(l,r)`, and `[l,r)`, replace the excluded lower mass and retained upper mass by the appropriate `Iio`/`Iic` values and prove the corresponding formulas.
   Do not remove atom corrections on finite endpoints.

4. **Atoms and mixtures.** For a probability measure `μ` on a measurable carrier with measurable singletons and `w ∈ [0,1]`, use `w • Measure.dirac c + (1-w) • μ`, with nonnegative extended-real coefficients.
   Prove singleton masses, the atomic/absolutely-continuous decomposition when the carrier is real and `μ` has a density, parameter measurability, mean, variance, and linearity of transforms.
   On `ℝ`, prove cdf `w * 1_{c ≤ x} + (1-w) * F(x)` and the general lower-quantile characterization using this explicit cdf.
   For `μ` supported on `[0,∞)` and `c = 0`, prove the piecewise quantile: zero for `u ≤ w+(1-w)*μ.real {0}`, and `Qμ((u-w)/(1-w))` above that threshold when `w < 1`; at `w = 1` every interior quantile is zero.
   Include zero-inflated Poisson and negative-binomial laws, and their zero-truncated laws from item 3, with explicit masses, cdfs, quantiles, means, variances, and exact mgf domains.
   Treat Poisson rate zero and the degenerate negative-binomial boundaries separately when conditioning removes all mass.
   Supply the general mixture-density and mixture-mass theorems for `Measure.bind`, under measurable probability kernels and the corresponding component density or mass hypotheses, used by Layers 9–11.
   General mixtures and compound Poisson laws may retain singular continuous components; no atomic/absolutely-continuous dichotomy is imposed on arbitrary jump laws.

5. **Compound Poisson.** For a probability measure `μ` on a finite-dimensional real vector space and `λ : ℝ≥0`, define `compoundPoissonMeasure λ μ = (poissonMeasure λ).bind (fun n => μ ^∗ n)`, where convolution power zero is `Measure.dirac 0`.
   Define convolution powers and prove their measurable dependence on `μ`, addition of exponents, and their independent-sum `HasLaw` characterization using existing convolution API.
   Prove the probability theorem, joint parameter measurability, the rate-zero and zero-jump laws, and addition of rates under convolution at fixed jump law.
   Prove `charFun = exp (λ * (charFun μ - 1))`; for each real linear functional, prove the analogous mgf and cgf formulas.
   At positive rate, the exponential-integrability domain equals the jump law's domain; at rate zero it is all of `ℝ`.
   Under first and second moment hypotheses, prove mean `λ * E[X]` and covariance `λ * E[X Xᵀ]`, with the scalar variance `λ * E[X²]`.
   For real jumps, prove the Poisson-weighted cdf series, including the `n = 0` atom, and its quantile adjunction; do not assert that a general compound Poisson law has a density.
   For native `ℕ` and `ℤ` jumps give the mass-series and cast bridges.

Key declarations:

```lean
upperQuantile
atomMixture
convolutionPower
compoundPoissonMeasure
quantile_map_affine_pos
quantile_map_affine_neg
quantile_cond_Ioc
charFun_compoundPoissonMeasure
```

Completion checks:

- A two-atom law verifies the negative-scale formula using the upper quantile; replacing it by the lower quantile must not be used as a general identity.
- All Dirac boundaries have constant interior quantiles and the expected affine images.
- The quantile transform reconstructs every probability law on `ℝ`, including discrete and mixed laws.
- No new PMF, cdf, convolution, conditioning, or probability-kernel abstraction is introduced.

### Layer 8: special functions for the expanded families

The distribution entries specify which formulas are required; introducing a special function does not silently add every possible transform involving it.

1. **Modified Bessel functions.** Develop the first-kind function `I_ν(x)` for real order and nonnegative argument through the regularized hypergeometric representation compatible with `Complex.besselI` in the cited proposal.
   The required real distribution identities use `ν > -1` and `x > 0`, where
   `I_ν(x) = ∑' j : ℕ, (x/2)^(2*j+ν)/(j!*Gamma(j+ν+1))`.
   Prove convergence, positivity, joint continuity and measurability on that domain, the differential identity `I_ν' = I_(ν+1) + (ν/x)*I_ν`, and the adjacent-order recurrence.
   For nonnegative integer orders, prove continuity at zero, `I_0(0)=1`, and `I_n(0)=0` for `n > 0`.
   For negative orders in `(-1,0)`, state right-hand asymptotics instead of a false finite continuity theorem at zero.
   Prove `I_n(κ) = (2π)⁻¹ ∫ θ in [-π,π], exp(κ*cos θ)*cos(n*θ)` for integer `n ≥ 0` and `κ ≥ 0`, and the sphere integral in Layer 12.
   Density formulas containing `I_(k/2-1)` are stated on `x > 0`; values at single Lebesgue-null endpoints are fixed separately.
   Second-kind `K_ν` and the inverse-gamma and Student-t transform formulas requiring it are outside this roadmap.

2. **Owen's T.** Define `owensT h a = (2π)⁻¹ * ∫ t in 0..a, exp(-h²*(1+t²)/2)/(1+t²)` for real `h,a` using oriented interval integration.
   Prove joint continuity and measurability, evenness in `h`, oddness in `a`, and `T(0,a)=arctan(a)/(2π)`.
   Prove `∂h T(h,a) = -φ(h)*(Φ(a*h)-1/2)` and `∂a T(h,a) = exp(-h²*(1+a²)/2)/(2π*(1+a²))`.
   Prove the Gaussian integral identity needed for `Φ(x)-2*T(x,α)` to be the skew-normal cdf, its limits at both infinities, and its derivative `2*φ(x)*Φ(α*x)`.
   Here `φ` and `Φ` are the standard Gaussian density and cdf from Layers 0–2, not separate probability abstractions.

3. **Zeta and Gaussian lattice sums.** For `s > 1`, identify `∑' n : ℕ, ((n+1 : ℕ) : ℝ)^(-s)` with the real value of Mathlib's `riemannZeta s`.
   Prove positivity, finiteness, parameter measurability, and the shifted-exponent convergence/divergence tests needed for Zipf moments.
   For `c : ℝ` and `s > 0`, define the positive real lattice sum `Z(c,s) = ∑' n : ℤ, exp(-((n:ℝ)-c)²/(2*s²))`.
   Prove finiteness, positivity, smooth dependence on `c,s`, integer-translation and reflection identities, and differentiation under the sum with polynomial weights.
   Identify it with Mathlib's two-variable Jacobi theta function, by `Z(c,s) = exp(-c²/(2*s²)) * Re(jacobiTheta₂ (-I*c/(2*π*s²)) (I/(2*π*s²)))`; the defining series fixes the normalization unambiguously.
   Prove the periodized Gaussian identity and locally uniform convergence of the density and Fourier series used for wrapped normal in Layer 12, using the existing theta/Poisson-summation infrastructure.
   This is real probability API over existing theta functions, not a second theta-function theory.

4. **Inverse special functions.** Define `G_a⁻¹(u)` as the unique positive solution of `regularizedGamma a x = u` for `a > 0`, `0 < u < 1`, and `B_(a,b)⁻¹(u)` as the unique solution in `(0,1)` of `regularizedIncompleteBeta a b x = u` for positive shapes.
   Prove existence, uniqueness, inverse identities, strict monotonicity, continuity, joint parameter measurability, and endpoint limits.
   Use zero as the value outside these parameter ranges and prove the resulting piecewise functions measurable.
   Similarly obtain the standard Gaussian quantile `z(u)` from the inverse of `erf` on `(-1,1)`, with `z(u)=sqrt 2 * erf⁻¹(2*u-1)`.
   Reuse existing inverse-function declarations when available; otherwise construct precisely these inverses from the continuity, strict monotonicity, and endpoint limits in Layer 2.
   No numerical approximation or root-finding algorithm is required.

Key declarations:

```lean
Complex.besselI
owensT
gaussianLatticeSum
inverseRegularizedGamma
inverseRegularizedIncompleteBeta
hasDerivAt_owensT_right
gaussianLatticeSum_eq_jacobiTheta₂
regularizedGamma_inverse
regularizedIncompleteBeta_inverse
```

Completion checks:

- The Bessel circle-integral identity at concentration zero agrees with `I_0(0)=1` and the vanishing of the positive integer orders.
- Owen's T has the stated values at `h=0` and `a=0`; the skew-normal cdf expression at shape zero reduces to the Gaussian cdf.
- The Gaussian lattice sum and its theta representation have the same normalization and integer-translation symmetry, and the periodized Gaussian density and Fourier series have equal integrals over one period.
- Composing each inverse special function with its defining function returns every interior level, with the stated support bounds and endpoint limits; inverse definitions retain their specified totalization outside the valid range.

### Layer 9: finite, mixed, and integer-valued discrete families

Every new family in this layer has the shared measure, normalization, singleton-mass, support, parameter-measurability, and `HasLaw` targets.
For scalar discrete laws require the cumulative sum, the cast-law quantile as its least crossing, and support-endpoint limits from Layer 7.
For finite support require all natural moments as finite sums, exact exponential-integrability domain `ℝ`, pgf on `ℕ`, and mgf/cgf/characteristic function as finite sums or the specified product.
For infinite support the individual entries specify additional moment and transform targets.
These are complete targets even when no named special-function transform or quantile exists.

1. **Finite uniform and categorical.** On a nonempty finite type with its discrete σ-algebra, reuse `uniformOn Set.univ`; on a nonempty finite subset use `uniformOn` of that subset.
   Prove agreement with `(PMF.uniformOfFintype ι).toMeasure` and `(PMF.uniformOfFinset s hs).toMeasure`, respectively, uniform masses, pushforward under bijections, and finite-sum integration.
   For `p : Convexity.StdSimplex ℝ≥0 ι`, define the categorical measure by `∑ i, (p.weights i : ℝ≥0∞) • Measure.dirac i`, using the measurable structure induced by its finite weight coordinates.
   Prove aggregation along arbitrary maps of finite types and that its one-hot pushforward is multinomial with one trial and the same weights, supplying the measurable bridge to the multinomial simplex parameter carrier.
   Numeric means and quantiles concern a specified real observable on `ι`, not an intrinsic ordering of category names.
   Include the Rademacher specialization with equal masses at `-1,1`, mean zero, variance one, mgf `cosh t`, and characteristic function `cos t`.
   For integer endpoints `a ≤ b`, put `N=b-a+1` and use uniform mass `1/N` on the inclusive interval `[a,b]` in `ℤ`; use the zero measure for `b<a`.
   Prove mean `(a+b)/2`, variance `(N²-1)/12`, and quantile `a+ceil(N*u)-1`.
   Give its mgf by the finite geometric sum, treating `t=0` explicitly, and the pgf after translating the interval to `{0,…,N-1}`.

2. **Beta-binomial and Dirichlet-multinomial.** Define beta-binomial for `n : ℕ` and `a,b > 0` by mixing `binomial n p` against `betaMeasure a b`, using an everywhere measurable extension of the kernel that agrees on `[0,1]`.
   It is zero for invalid shapes, and Dirac at zero for `n=0` with valid shapes.
   For `0 ≤ k ≤ n`, prove mass `choose(n,k)*B(k+a,n-k+b)/B(a,b)`.
   Put `A=a+b` and `p=a/A`; prove mean `n*p` and variance `n*p*(1-p)*(A+n)/(A+1)`.
   On a finite nonempty category type, define Dirichlet-multinomial by mixing the existing multinomial against Dirichlet, transporting its almost-sure simplex values to the multinomial parameter carrier by a measurable map and proving independence of its choice off the simplex.
   For positive `α_i`, `A=∑ i, α_i`, and `∑ i, k_i=n`, prove mass `n!/∏ i,k_i! * Gamma(A)/Gamma(A+n) * ∏ i,Gamma(α_i+k_i)/Gamma(α_i)`; it is zero off that support and for invalid shapes.
   Its mean vector is `n*p`, and its covariance is `n*(A+n)/(A+1) * (diag p - p*pᵀ)`, where `p_i=α_i/A`.
   Prove aggregation and beta-binomial coordinate marginals when there are at least two categories, with the one-category Dirac case separate.
   Require vector characteristic functions and directional mgfs as finite sums, not a scalar vector quantile.

3. **Sampling without replacement.** For category counts `K_i : ℕ`, total `N=∑ i,K_i`, and `n ≤ N`, define multivariate hypergeometric mass `∏ i, choose(K_i,k_i)/choose(N,n)` on `∑ i,k_i=n` and `∀ i,k_i≤K_i`.
   Use zero for `n>N`, and include `N=0` and `N=1` explicitly.
   Prove aggregation, scalar hypergeometric coordinate marginals, mean `n*p`, and covariance `n*(N-n)/(N-1) * (diag p-p*pᵀ)` when `N>1`, with `p_i=K_i/N`; handle the smaller totals by Dirac laws.
   Define negative hypergeometric as the number `k` of failures before the `r`th success when sampling a population of `N` containing `K` successes.
   For `1 ≤ r ≤ K ≤ N`, its mass on `0 ≤ k ≤ N-K` is `choose(k+r-1,k)*choose(N-r-k,K-r)/choose(N,K)`.
   For `r=0` and `K≤N`, use `Measure.dirac 0`; for all other invalid parameters use zero.
   Prove the sampling interpretation using a uniformly random permutation of labeled population elements, mean `r*(N-K)/(K+1)`, and variance `r*(N+1)*(N-K)*(K-r+1)/((K+1)²*(K+2))`.
   Include the cdf relation to the hypergeometric count in the first `k+r` draws, with the necessary support cases.

4. **Poisson-binomial.** For a finite family `p_i ∈ [0,1]`, define the law of the sum of independent `bernoulliMeasure 1 0 p_i` on `ℕ`.
   Its mass at `k` is the sum over subsets of cardinality `k` of `∏ i∈S,p_i * ∏ i∉S,(1-p_i)`.
   Prove pgf `∏ i,(1-p_i+p_i*z)`, mean `∑ i,p_i`, variance `∑ i,p_i*(1-p_i)`, the corresponding mgf and characteristic-function products, and the recursion obtained by adjoining one trial.
   The empty family gives Dirac at zero; constant probabilities recover binomial.
   This entry owns the general independent non-identical Bernoulli-sum theorem.

5. **Skellam.** For rates `λ₁,λ₂ : ℝ≥0`, use the integer difference of independent Poisson variables.
   For `k≥0`, prove mass `exp(-λ₁-λ₂) * ∑' j : ℕ, λ₁^(j+k)*λ₂^j/((j+k)!*j!)`; negative masses follow by exchanging the rates.
   Prove convergence, mean `λ₁-λ₂`, variance `λ₁+λ₂`, mgf `exp(λ₁*(exp t-1)+λ₂*(exp(-t)-1))`, characteristic function by the analogous complex exponential, and exponential-integrability domain `ℝ`.
   Include zero rates, reflection, and convolution by adding both rates.
   The cumulative mass is an absolutely convergent series over integers at most the argument; no Bessel mass formula is required.

6. **Zipf/zeta and finite Zipf.** For `s>1`, use mass `k^(-s)/ζ(s)` on positive integers, zero at `0`, and the zero measure for `s≤1`.
   Prove the `n`th raw moment `ζ(s-n)/ζ(s)` exactly when `n<s-1`, and non-integrability otherwise, including the resulting mean and variance conditions.
   Its exponential-integrability domain is `(-∞,0]`.
   For cutoff `N≥1` and any real `s`, define finite Zipf with normalizer `∑ k=1..N,k^(-s)`; use zero at `N=0`.
   Prove convergence of finite Zipf to the infinite law for `s>1`, in total variation.
   Both cdfs are the corresponding partial sums, and both quantiles are their least crossings.

7. **Yule–Simon and logarithmic series.** For `ρ>0`, define Yule–Simon on positive integers by mass `ρ*B(k,ρ+1)` and use zero for `ρ≤0`.
   Prove tail `P(X>k)=k*B(k,ρ+1)` for integer `k≥1`, with `P(X>0)=1`, mean `ρ/(ρ-1)` for `ρ>1`, and variance `ρ²/((ρ-1)²*(ρ-2))` for `ρ>2`.
   Prove absolute `n`th-moment integrability exactly when `n<ρ`, and exponential-integrability domain `(-∞,0]`.
   For logarithmic series, parameterize by `0<q<1`, with mass `-q^k/(k*log(1-q))` on positive integers and zero measure for invalid parameters.
   Prove pgf `log(1-q*z)/log(1-q)` exactly on the absolute-convergence domain `|q*z|<1`, mean `-q/((1-q)*log(1-q))`, and variance `-q*(q+log(1-q))/((1-q)²*log(1-q)²)`.
   Its mgf domain is `t < -log q`, and the pgf formula gives its mgf/cgf there.
   Require its characteristic function as the principal-log version of the pgf at `exp(I*t)`, with the branch justified by the positive real part of `1-q*exp(I*t)`.
   With logarithmic-series jumps of parameter `q ∈ (0,1)` and compound Poisson rate `-r*log(1-q)`, prove the negative-binomial law with parameters `r ≥ 0` and `p = 1-q` using Layer 7's construction.
   The identity includes `r = 0` and remains a distributional statement, without a stochastic-process construction.

8. **Discrete Laplace and Gaussian.** For integer center `m` and `0≤q<1`, define discrete Laplace mass `(1-q)/(1+q) * q^|k-m|` on `ℤ`, interpreting `q=0` as Dirac at `m`; use zero outside that range.
   Prove mean `m`, variance `2*q/(1-q)²`, and, for `0<q<1`, mgf `exp(m*t)*(1-q)²/((1-q*exp t)*(1-q*exp(-t)))` on `|t| < -log q`, with exact non-integrability outside.
   Prove the characteristic-function counterpart and, for `0<q<1` and integer `k`, cdf `q^(m-k)/(1+q)` when `k<m`, and `1-q^(k-m+1)/(1+q)` when `k≥m`.
   Real arguments use their floor; quantify the lower quantile by the integer crossings of this formula and handle `q=0` separately.
   For discrete Gaussian use real center `c`, width `s>0`, and mass `exp(-(k-c)²/(2*s²))/Z(c,s)`; use zero for `s≤0`.
   Prove integer-translation and reflection laws, all natural moments via differentiated lattice sums, and exponential-integrability domain `ℝ`.
   Its mgf is `exp(c*t+s²*t²/2)*Z(c+s²*t,s)/Z(c,s)`.
   Prove mean `c+s²*∂c log Z(c,s)` and variance `s²+s⁴*∂c² log Z(c,s)`; the center and width are not generally its mean and standard deviation.
   When `2*c` is an integer, reflection gives mean `c`.
   Require the convergent mass-series cdf and characteristic function, and the quantile least-crossing theorem.

Key declarations:

```lean
uniformOn
categoricalMeasure
betaBinomialMeasure
dirichletMultinomialMeasure
multivariateHypergeometricMeasure
negativeHypergeometricMeasure
poissonBinomialMeasure
skellamMeasure
zipfMeasure
finiteZipfMeasure
yuleSimonMeasure
logarithmicSeriesMeasure
discreteLaplaceMeasure
discreteGaussianMeasure
map_coordinate_dirichletMultinomialMeasure
pgf_poissonBinomialMeasure
mgf_discreteGaussianMeasure
```

Completion checks:

- Finite Zipf at exponent zero is discrete uniform on `{1,…,N}`.
- Beta-binomial is a coordinate marginal of Dirichlet-multinomial and its mixture agrees with the stated mass formula.
- Zero-inflated and zero-truncated specializations have the same cdfs and quantiles whether computed through Layer 7 or directly from their masses.
- All integer differences are cast to `ℤ` before subtraction, never subtracted in `ℕ`.

### Layer 10: scalar continuous and noncentral families

Every entry has the shared density or mixed-law decomposition, probability, parameter-measurability, affine-transport, `HasLaw`, and quantile requirements.
Unless an entry says otherwise, a new family is the zero measure outside its stated valid parameter range, and its real and extended-real pdfs are zero there.
Density formulas are stated on the open support and set to zero off it; endpoint choices on Lebesgue-null sets do not define atoms.
`Φ`, `φ`, `G_a⁻¹`, and `B_(a,b)⁻¹` have the meanings fixed in Layer 8.
Every quantile formula below has `0<u<1` and valid distribution parameters as hypotheses.
For a continuous law without an explicit quantile expression, require the unique solution of its stated cdf equation on the support interior, with existence, uniqueness, continuity in `u`, and endpoint limits proved.
Natural moments listed below include the zeroth moment; sharp moment thresholds include matching non-integrability.

1. **Logistic.** For location `m : ℝ` and scale `s>0`, define the logit pushforward of `uniformMeasure 0 1` under `u ↦ m+s*log(u/(1-u))`.
   Prove cdf `1/(1+exp(-(x-m)/s))` and density `exp(-z)/(s*(1+exp(-z))²)`, where `z=(x-m)/s`.
   Prove quantile `m+s*log(u/(1-u))`, mean `m`, variance `π²*s²/3`, and exact mgf domain `|t|<1/s`.
   On this domain the mgf is `exp(m*t)*Gamma(1-s*t)*Gamma(1+s*t)`.
   Prove characteristic function `exp(I*m*t)*(π*s*t)/sinh(π*s*t)`, with the value `1` at `t=0` stated separately.
   Give the corresponding uniform-variable `HasLaw` theorem and prove its construction as the difference of independent Gumbels of equal scale, allowing unequal locations.

2. **Gumbel and generalized extreme value.** Use the maximum convention: Gumbel has cdf `exp(-exp(-(x-m)/s))` for `s>0`.
   Define it as the image of a rate-one exponential under `y ↦ m-s*log y` and derive its density.
   Prove mean `m+s*Real.eulerMascheroniConstant`, variance `π²*s²/6`, mgf `exp(m*t)*Gamma(1-s*t)` exactly for `t<1/s`, characteristic function `exp(I*m*t)*Complex.Gamma(1-I*s*t)`, and quantile `m-s*log(-log u)`.
   Minimum Gumbel is its reflection, with the lower/upper quantile bridge from Layer 7.

   For real shape `ξ` and `s>0`, generalized extreme value (GEV) has cdf `exp(-(1+ξ*(x-m)/s)^(-1/ξ))` wherever `1+ξ*(x-m)/s>0`, and the Gumbel cdf at `ξ=0`.
   At and beyond the finite support boundary use cdf zero when `ξ>0` and one when `ξ<0`.
   Use Coles's maximum-law shape convention; its sign is opposite to SciPy's `genextreme` parameter.
   Define it from rate-one exponential `E` by `m+s*(E^(-ξ)-1)/ξ` for `ξ≠0`, with the logarithmic branch at zero, and derive the density.
   Prove quantile `m+s*((-log u)^(-ξ)-1)/ξ`, with the Gumbel branch at zero, and weak continuity as `ξ→0`.
   For `ξ≠0` and `ξ<1`, prove mean `m+s*(Gamma(1-ξ)-1)/ξ`; for `ξ≠0` and `ξ<1/2`, prove variance `s²*(Gamma(1-2*ξ)-Gamma(1-ξ)²)/ξ²`.
   For each natural `n≥1`, prove absolute `n`th-moment integrability exactly when `n*ξ<1`, and derive raw moments by the finite binomial expansion of the exponential construction; at `ξ=0`, all natural moments exist.
   Prove the exact exponential-integrability domains: `(-∞,0]` for `ξ>0`, `(-∞,1/s)` for `ξ=0`, all of `ℝ` for `-1<ξ<0`, `(-1/s,∞)` for `ξ=-1`, and `[0,∞)` for `ξ<-1`.
   No general GEV closed-form transform is required.
   Prove finite-maximum stability: the maximum of `n≥1` independent copies has scale `s*n^ξ` and location `m+s*(n^ξ-1)/ξ`, with location `m+s*log n` at `ξ=0`.
   Identify Fréchet, cdf `exp(-(x/a)^(-α))` on `x>0` for `a,α>0`, and reversed Weibull, the reflection of the existing Weibull law, as explicit affine GEV specializations.

3. **Generalized Pareto.** For `s>0` and shape `ξ : ℝ`, define the image of a rate-one exponential `E` under `s*(exp(ξ*E)-1)/ξ`, with `s*E` at `ξ=0`.
   On `x≥0` with `1+ξ*x/s>0`, prove cdf `1-(1+ξ*x/s)^(-1/ξ)`, replacing the survival function by `exp(-x/s)` at zero shape.
   For `ξ<0` the upper endpoint is `-s/ξ`; the cdf there and above is one.
   Prove the density, quantile `s*((1-u)^(-ξ)-1)/ξ` with branch `-s*log(1-u)`, mean `s/(1-ξ)` for `ξ<1`, and variance `s²/((1-ξ)²*(1-2*ξ))` for `ξ<1/2`.
   Its `n`th raw moment is `s^n*n!/∏ j=1..n,(1-j*ξ)`, exactly when `n*ξ<1` for `n≥1`.
   Prove mgf domains `(-∞,0]`, `(-∞,1/s)`, and `ℝ` for positive, zero, and negative shape respectively.
   Prove threshold stability: conditional excess over `v≥0` in the support has shape `ξ` and scale `s+ξ*v`.
   At `ξ=0`, identify `expMeasure (1/s)`; at `ξ=-1`, identify `uniformMeasure 0 s`.
   For `ξ>0`, identify the Lomax scale `s/ξ` and shape `1/ξ`, and prove `(generalizedParetoMeasure s ξ).map (fun x => x+s/ξ) = paretoMeasure (s/ξ) (1/ξ)`.
   Conversely, `X-t` for `X~paretoMeasure t r` has GPD scale `t/r` and shape `1/r`.

4. **Chi and Nakagami.** For `k≥0` and `s>0`, define chi as `(chiSquaredMeasure k).map (fun x => s*sqrt x)`; for `k=0` this is Dirac at zero.
   For `k>0`, derive density `2^(1-k/2)*x^(k-1)*exp(-x²/(2*s²))/(Gamma(k/2)*s^k)` on `x>0`, cdf `regularizedGamma (k/2) (x²/(2*s²))`, and quantile `s*sqrt(2*G_(k/2)⁻¹(u))`.
   Prove moments `s^n*2^(n/2)*Gamma((k+n)/2)/Gamma(k/2)`, mean and variance from these, and mgf domain `ℝ`; no closed-form mgf is required.
   Identify half-normal (`k=1`), Rayleigh (`k=2`), and Maxwell–Boltzmann (`k=3`), including their Gaussian absolute-value/norm constructions.
   Define Nakagami for `m≥1/2`, `Ω>0` as the square root of `gammaMeasure m (m/Ω)`.
   Derive density `2*(m/Ω)^m*x^(2*m-1)*exp(-m*x²/Ω)/Gamma(m)`, cdf, moments, quantile, and its equality to chi with `k=2*m`, `s=sqrt(Ω/(2*m))`.

5. **Noncentral chi-squared and noncentral chi.** For real `k≥0` and `λ : ℝ≥0`, define the Poisson mixture `J~Poisson(λ/2)`, `X|J~chiSquaredMeasure(k+2*J)`.
   Branch to zero before mixing if `k<0`; do not inherit a nonzero subprobability measure from the invalid initial components.
   Prove mean `k+λ`, variance `2*(k+2*λ)`, and mgf `(1-2*t)^(-k/2)*exp(λ*t/(1-2*t))` exactly for `t<1/2` when `k+λ>0`.
   At `k=λ=0`, the law is Dirac and its domain is `ℝ`.
   Prove the characteristic function with `1-2*I*t` and the principal complex power, including the branch justification.
   For `k>0`, give the density and cdf as Poisson-weighted series of central densities and cdfs, and identify the density for `λ>0`, `x>0` with `exp(-(x+λ)/2)*(x/λ)^(k/4-1/2)*I_(k/2-1)(sqrt(λ*x))/2`.
   At `λ=0`, state the central formula directly.
   At `k=0`, prove the decomposition into mass `exp(-λ/2)` at zero and the continuous mixture over `J≥1`.
   Prove additivity of both degree and noncentrality under convolution and the squared-norm law for a standard-covariance Gaussian with nonzero mean in every positive natural dimension, with `λ=‖m‖²`.
   At zero dimension that construction gives only `λ=0`; the positive-noncentrality zero-degree law is justified by the mixture.
   Quantiles are zero up to the atom mass and otherwise the unique positive solutions of the explicit mixture-cdf equation.

   Define noncentral chi for `k≥0`, noncentrality `δ≥0`, and `s>0` by the square root of noncentral chi-squared with `λ=δ²`, scaled by `s`.
   Derive its density by change of variables, cdf, quantile, and any atom from the preceding law.
   Prove all natural moments as convergent Poisson mixtures of the central-chi moments, giving zero for the zero-degree component when the moment order is positive, and one for order zero.
   Derive its mean and variance from these series and prove mgf domain `ℝ`.
   Rice has `k=2`, `δ=ν/s` with `ν≥0`; derive density `x/s² * exp(-(x²+ν²)/(2*s²))*I_0(x*ν/s²)` on `x>0` and its planar Gaussian-norm law.
   Folded normal is the absolute value of `gaussianReal m (s²)`, corresponding to `k=1`, `δ=|m|/s`; additionally give its elementary Gaussian cdf, mean, and variance.

6. **Noncentral t and F.** For `ν>0`, `δ : ℝ`, define noncentral t by `(Z+δ)/sqrt(V/ν)`, with independent standard Gaussian `Z` and central chi-squared `V` of degree `ν`.
   Prove the denominator's positivity almost surely and give the density and cdf by integrating `sqrt(v/ν)*φ(x*sqrt(v/ν)-δ)` and `Φ(x*sqrt(v/ν)-δ)` against the chi-squared law.
   Prove these are respectively a strictly positive density and a continuous strictly increasing cdf, giving a unique real quantile at every interior level.
   Prove mean `δ*sqrt(ν/2)*Gamma((ν-1)/2)/Gamma(ν/2)` for `ν>1`, second moment `ν*(1+δ²)/(ν-2)` for `ν>2`, and variance by subtraction.
   Prove absolute natural-moment integrability exactly for order `n<ν`, and mgf domain `{0}`.
   Include reflection `δ↦-δ`, the central case, and the law of its square as noncentral F with numerator degree one and noncentrality `δ²`.

   For `m,n>0` and `λ≥0`, define noncentral F as `(X/m)/(Y/n)` for independent noncentral chi-squared `X` with parameters `m,λ` and central chi-squared `Y` with degree `n`.
   Give its density and cdf as Poisson mixtures of the scaled central F laws `((m+2*j)/m) * F(m+2*j,n)`, and prove the quantile characterization using this cdf.
   For `n>2`, its mean is `n*(m+λ)/(m*(n-2))`; for `n>4`, its second moment is `n²*((m+λ)²+2*(m+2*λ))/(m²*(n-2)*(n-4))`.
   Derive variance, prove absolute natural-moment integrability exactly for `2*r<n`, and mgf domain `(-∞,0]`.
   No hypergeometric closed form for the noncentral-t or noncentral-F density is required.

7. **Beta prime and Lévy.** For `a,b>0`, define beta prime as the pushforward of `betaMeasure a b` under `x↦x/(1-x)`.
   Prove density `x^(a-1)*(1+x)^(-a-b)/B(a,b)` on `x>0`, cdf `regularizedIncompleteBeta a b (x/(1+x))`, and quantile `B_(a,b)⁻¹(u)/(1-B_(a,b)⁻¹(u))`.
   Prove its independent-gamma ratio construction, its equality to `(a/b)*F(2*a,2*b)`, moments `B(a+r,b-r)/B(a,b)` for natural `r<b`, the corresponding sharp non-integrability, and mgf domain `(-∞,0]`.
   Prove mean `a/(b-1)` for `b>1` and variance `a*(a+b-1)/((b-2)*(b-1)²)` for `b>2`.
   For location `m` and `c>0`, define Lévy as the translate by `m` of `inverseGammaMeasure (1/2) (c/2)`.
   Prove density `sqrt(c/(2*π))*(x-m)^(-3/2)*exp(-c/(2*(x-m)))`, cdf `erfc(sqrt(c/(2*(x-m))))` for `x>m`, and quantile `m+c/(z(1-u/2)²)`.
   Prove positive fractional absolute moments of `X-m` exist exactly below `1/2`, mgf domain `(-∞,0]`, and mgf `exp(m*t-sqrt(-2*c*t))` there.
   Identify its construction `m+c/Z²` from a standard Gaussian and include reflected Lévy by affine transport.
   General stable laws are outside this roadmap.

8. **Inverse Gaussian.** For mean parameter `μ>0` and shape `λ>0`, use density `sqrt(λ/(2*π*x³))*exp(-λ*(x-μ)²/(2*μ²*x))` on `x>0`.
   Prove cdf `Φ(sqrt(λ/x)*(x/μ-1)) + exp(2*λ/μ)*Φ(-sqrt(λ/x)*(x/μ+1))`, normalization, mean `μ`, and variance `μ³/λ`.
   Prove mgf `exp((λ/μ)*(1-sqrt(1-2*μ²*t/λ)))` on the exact closed domain `t≤λ/(2*μ²)`; the finite value at the endpoint must be included.
   Give the corresponding characteristic function using the principal square root, and the unique-positive-root quantile characterization using the displayed cdf.
   Include positive scaling `a*X ~ IG(a*μ,a*λ)` and the standard Wald specialization `μ=1`.
   A Brownian first-passage construction is not a target.

9. **Truncated and skew normal.** Truncated normal is the Layer 7 conditioning construction applied to `gaussianReal m v`, with variance `v : ℝ≥0` and bounds `l<r` in the extended reals.
   For `v>0`, with `s=sqrt v`, `α=(l-m)/s`, `β=(r-m)/s`, and `D=Φ(β)-Φ(α)>0`, prove density `φ((x-m)/s)/(s*D)` on the interval, the clipped cdf, and quantile `m+s*z(Φ(α)+u*D)`.
   Prove mean `m+s*(φ(α)-φ(β))/D` and variance `v*(1+(α*φ(α)-β*φ(β))/D-((φ(α)-φ(β))/D)²)`.
   Infinite-bound products such as `α*φ(α)` mean their zero limits; define these extensions explicitly.
   Under the same `v>0` hypothesis, prove mgf `exp(m*t+v*t²/2)*(Φ(β-s*t)-Φ(α-s*t))/D` on all of `ℝ`.
   At zero Gaussian variance, conditioning returns Dirac at `m` if `m` belongs to the chosen interval and zero otherwise; record the exact endpoint convention.
   Identify half-normal as the centered one-sided case.

   For skew-normal, use location `m`, scale `s>0`, and shape `α : ℝ`, with density `2*φ(y)*Φ(α*y)/s`, `y=(x-m)/s`.
   Put `d=α/sqrt(1+α²)` and prove the construction `m+s*(d*|Z₁|+sqrt(1-d²)*Z₂)` from independent standard Gaussians.
   Prove cdf `Φ(y)-2*owensT y α`, mean `m+s*d*sqrt(2/π)`, variance `s²*(1-2*d²/π)`, and mgf `2*exp(m*t+s²*t²/2)*Φ(d*s*t)` on all of `ℝ`.
   Give its unique-real-root quantile characterization using Owen's T, its Gaussian specialization at `α=0`, and reflection of the shape.

10. **Uniform sums and bounded elementary laws.** Define Irwin–Hall for `n : ℕ` as the sum of `n` independent `uniformMeasure 0 1` variables.
    At `n=0`, use Dirac at zero.
    For `n≥1`, prove cdf `1/n! * ∑ k=0..n, (-1)^k*choose(n,k)*(max (x-k) 0)^n`, and for `n≥2` density `1/(n-1)! * ∑ k=0..n, (-1)^k*choose(n,k)*(max (x-k) 0)^(n-1)`; handle `n=1` as uniform separately.
    Prove mean `n/2`, variance `n/12`, and mgf `((exp t-1)/t)^n` for `t≠0`, with value one at zero and domain `ℝ`.
    Bates is the scaled law `X/n` for `n≥1`, with zero measure at `n=0`; derive density, cdf, quantile, mean, variance, and transforms by affine transport.
    Quantiles for `n≥1` are the unique roots of the displayed piecewise-polynomial cdf on the support interior; no radical formula for arbitrary degree is required.

    For triangular parameters `a<b` and `a≤c≤b`, define the density `2*(x-a)/((b-a)*(c-a))` on `(a,c)` and `2*(b-x)/((b-a)*(b-c))` on `(c,b)`.
    At `c=a` use only the decreasing branch; at `c=b` use only the increasing branch.
    Prove the piecewise-quadratic cdf, mean `(a+b+c)/3`, variance `(a²+b²+c²-a*b-a*c-b*c)/18`, and quantile `a+sqrt(u*(b-a)*(c-a))` for `u≤(c-a)/(b-a)`, otherwise `b-sqrt((1-u)*(b-a)*(b-c))`.
    All natural moments exist; require their finite binomial-sum formulas obtained by integrating the two density branches and mgf domain `ℝ`.

    For Kumaraswamy shapes `a,b>0`, use cdf `1-(1-x^a)^b` on `[0,1]` and density `a*b*x^(a-1)*(1-x^a)^(b-1)` on `(0,1)`.
    Prove quantile `(1-(1-u)^(1/b))^(1/a)`, moments `b*B(1+n/a,b)`, mean and variance, and mgf domain `ℝ`.
    Prove that `X^a` has Beta law with parameters `1,b`.

11. **Gompertz and log-logistic.** For Gompertz use shape `η>0` and rate `b>0`, with survival `exp(-η*(exp(b*x)-1))` on `x≥0`.
    Define it as `log(1+E/η)/b` for rate-one exponential `E`, and derive density `η*b*exp(b*x)*exp(-η*(exp(b*x)-1))`, cdf, and quantile `log(1-log(1-u)/η)/b`.
    All natural moments and exponential moments exist.
    Require the explicit convergent integral `b^(-n)*∫ y in (0,∞), log(1+y/η)^n*exp(-y)` for each raw moment, mean and variance expressed through the first two such integrals, and mgf `∫ y in (0,∞), (1+y/η)^(t/b)*exp(-y)`.
    These integral representations are the exact requested formulas; no exponential-integral special function is introduced.

    For log-logistic use scale `a>0`, shape `b>0`, and cdf `1/(1+(x/a)^(-b))` on `x>0`.
    Define it by exponentiating logistic with location `log a` and scale `1/b`, and derive its density and quantile `a*(u/(1-u))^(1/b)`.
    For real `r` with `|r|<b`, prove moment `a^r*Gamma(1+r/b)*Gamma(1-r/b)` and non-integrability of `X^r` outside this interval.
    Derive mean and variance under `b>1` and `b>2`, respectively, and prove mgf domain `(-∞,0]`.

Key declarations:

```lean
logisticMeasure
gumbelMeasure
generalizedExtremeValueMeasure
generalizedParetoMeasure
chiMeasure
nakagamiMeasure
noncentralChiSquaredMeasure
noncentralChiMeasure
noncentralTMeasure
noncentralFMeasure
betaPrimeMeasure
levyMeasure
inverseGaussianMeasure
truncatedNormalMeasure
skewNormalMeasure
irwinHallMeasure
batesMeasure
triangularMeasure
kumaraswamyMeasure
gompertzMeasure
logLogisticMeasure
noncentralChiSquaredMeasure_zero_degree_mass
noncentralTMeasure_zero
quantile_generalizedExtremeValueMeasure
```

Completion checks:

- Each density integrates to one on its stated continuous range, including all named shape specializations.
- Noncentrality zero gives the corresponding central chi-squared, chi, t, and F laws.
- All transformations used to define laws have measure-level equalities and independent-variable `HasLaw` corollaries.
- Every finite quantile formula has an interior probability level and a valid-law hypothesis; all atoms and support endpoints are accounted for separately.

### Layer 11: multivariate t and Gaussian matrix and complex laws

All vector and matrix laws have joint parameter measurability, independent-variable constructions, density or singular-support results, Bochner means when integrable, and covariance formulas in their stated real or complex coordinates.
No scalar multivariate quantile is introduced.
Layer 13 specifies the scalar marginal and radial quantiles.

1. **Multivariate t.** On `EuclideanSpace ℝ ι` with finite nonempty `ι`, parameters are location `m`, real symmetric positive-semidefinite scale `S`, and degree `ν>0`.
   Define the law of `m+sqrt(ν/V) • Z`, with independent `Z~multivariateGaussian 0 S` and `V~chiSquaredMeasure ν`; use zero for `ν≤0` or non-positive-semidefinite scale.
   Scale is not covariance: when `ν>2`, covariance is `ν/(ν-2) • S`.
   If `S.PosDef` and `d=card ι`, prove density `Gamma((ν+d)/2)/(Gamma(ν/2)*(ν*π)^(d/2)*sqrt(det S)) * (1+⟪x-m,S⁻¹*(x-m)⟫/ν)^(-(ν+d)/2)`.
   If `S` is singular, prove support on `m+range S` and singularity with respect to ambient volume; if `S=0`, the law is Dirac at `m` for every positive `ν`.
   For nonzero positive-semidefinite `S`, prove norm-moment integrability of positive natural order `r` exactly when `r<ν`.
   Prove mean `m` for `ν>1`, covariance as above for `ν>2`, scalar linear-functional marginals as location-scale Student t, arbitrary affine-map closure, and convergence to the multivariate Gaussian as `ν→∞` in the topology of probability measures.
   Directional exponential integrability is `{0}` if the direction has positive scale variance and `ℝ` if that variance is zero.
   For a positive-definite block scale on `ι ⊕ κ`, prove the conditional distribution given the second block: degree `ν+card κ`, location `m₁+S₁₂*S₂₂⁻¹*(x₂-m₂)`, and scale `(ν+q)/(ν+card κ) • (S₁₁-S₁₂*S₂₂⁻¹*S₂₁)`, where `q=⟪x₂-m₂,S₂₂⁻¹*(x₂-m₂)⟫`.
   State this through `condDistrib` and an explicitly measurable kernel as in Layer 5.

2. **Matrix normal.** The carrier is `Matrix ι κ ℝ` with its existing product Borel structure, for finite row and column types `ι,κ`.
   For location `M`, positive-semidefinite row covariance `U`, and positive-semidefinite column covariance `V`, define the law by transporting the existing multivariate Gaussian on `EuclideanSpace ℝ (ι × κ)` under `x ↦ Matrix.of (fun i j => x (i,j))`.
   Package this coordinate map and the inverse `A ↦ WithLp.toLp 2 (fun ij => A ij.1 ij.2)` as a measurable equivalence and prove the comparison with product Lebesgue measure.
   The covariance entry at `((i,j),(k,l))` is `U i k * V j l`; this fixes vectorization order without an ambiguous Kronecker convention.
   For invalid covariances use Dirac at `M`, matching the Gaussian totalization by an explicit branch.
   For valid covariances prove mean `M`, the stated entrywise covariance, support in the appropriate affine image, row and column Gaussian marginals, and `A*X*B+C` closure with parameters `A*M*B+C`, `A*U*Aᵀ`, `Bᵀ*V*B`.
   For positive-definite `U,V`, prove density `(2π)^(-r*c/2)*(det U)^(-c/2)*(det V)^(-r/2)*exp(-trace(V⁻¹*(X-M)ᵀ*U⁻¹*(X-M))/2)` relative to product Lebesgue measure on entries.
   Require the directional mgf and characteristic function obtained by vectorization.
   Handle empty row or column types as the unique-matrix Dirac law and describe singular support when the product covariance is singular.

3. **Proper complex Gaussian.** On `ι → ℂ` for finite `ι`, with its product Borel structure, use arbitrary mean `m` and Hermitian positive-semidefinite covariance `C`.
   Define it by realification: `(Re Z, Im Z)` has real Gaussian mean `(Re m, Im m)` and block covariance `(1/2) * [[Re C,-Im C],[Im C,Re C]]`.
   Prove that this real matrix is positive semidefinite exactly when the Hermitian `C` is, and use Dirac at `m` for invalid `C`.
   Complex covariance means `E[(Z-m)*(Z-m)ᴴ]=C`, and pseudocovariance means `E[(Z-m)*(Z-m)ᵀ]=0`; prove both.
   Prove complex affine closure, coordinate marginals, the real directional transforms, and singular support through realification.
   For positive-definite `C`, prove density `exp(-Re((z-m)ᴴ*C⁻¹*(z-m)))/(π^d*det C)` relative to real product Lebesgue measure on complex coordinates, using `Re (det C) > 0` as the real determinant factor.
   Prove invariance of the centered law under multiplication by any unit complex scalar.
   State circular symmetry about zero for `m=0`; a translated law has circularly symmetric centered fluctuations, not generally circular symmetry about zero.
   A standard complex coordinate has real and imaginary variances `1/2` and expected squared modulus one.
   Prove that its modulus is Rayleigh with scale `1/sqrt 2`, its squared modulus is rate-one exponential, and the nonzero-mean scalar modulus is Rice with the corresponding parameters.
   General improper complex Gaussians with nonzero pseudocovariance are outside this roadmap.

Key declarations:

```lean
multivariateTMeasure
matrixCoordinateEquiv
matrixNormalMeasure
complexGaussianRealCovariance
properComplexGaussianMeasure
covariance_matrixNormalMeasure
properComplexGaussianMeasure_centered_rotation
```

Completion checks:

- One-dimensional multivariate t is the location-scale scalar Student law, including the zero-scale Dirac case.
- Vectorizing matrix normal recovers precisely the declared product-index covariance.
- Realifying a standard complex Gaussian gives independent real Gaussians of variance `1/2`.

### Layer 12: spherical and circular laws

1. **Uniform sphere and ball.** For a real Euclidean space of dimension `d≥1`, normalize `volume.toSphere` by its total mass to obtain the probability measure on the unit-sphere subtype.
   Prove its total surface mass `2*π^(d/2)/Gamma(d/2)`, rotation invariance, its equality to the direction of a standard Gaussian, and independence of Gaussian radius and direction.
   Use an explicitly measurable normalization map outside zero, prove that zero is Gaussian-null, and show independence of the arbitrary value assigned there.
   The Gaussian radius has chi law of degree `d` and scale one.
   Prove sphere mean zero and covariance `I/d` after embedding in the ambient space.
   In dimension one, identify equal mass at `-1,+1`; dimension zero has an empty unit sphere and no uniform probability law.

   Uniform on a ball of center `c` and radius `r>0` is `cond volume (ball c r)`.
   At `r=0`, define Dirac at `c`; for `r<0`, use zero.
   Prove volume `π^(d/2)*r^d/Gamma(d/2+1)`, density, affine scaling/translation, orthogonal invariance, mean `c`, and covariance `r²/(d+2) • I`.
   For `d≥1` and `r>0`, prove that the radius divided by `r` has cdf `t^d` on `[0,1]`, is independent of direction, and has quantile `u^(1/d)`.
   In dimension zero the valid ball laws are Dirac at the unique point.
   For a unit coordinate `X_i` of the sphere with `d≥2`, prove `(X_i+1)/2 ~ Beta((d-1)/2,(d-1)/2)`.
   For a centered unit ball with `d≥1`, prove `(X_i+1)/2 ~ Beta((d+1)/2,(d+1)/2)`.
   These equalities supply the coordinate cdfs and quantiles; arbitrary projections follow by rotation and scaling.

2. **Von Mises–Fisher.** On the unit sphere in dimension `d≥2`, take a unit direction `m` and concentration `κ≥0`.
   Write `σ_d` for the uniform sphere probability measure, put `f(x)=exp(κ*⟪m,x⟫)` and `Z=∫ x, f(x) ∂σ_d`, and define `σ_d.withDensity (fun x => ENNReal.ofReal (f(x)/Z))`.
   Prove integrability of `f` and positivity of `Z`; branch to zero for `κ<0`, and use zero measure in ambient dimensions below two if the definition accepts all natural dimensions.
   For `κ>0`, prove that the normalizing integral relative to unnormalized surface area is `(2π)^(d/2)*κ^(1-d/2)*I_(d/2-1)(κ)`.
   Include `κ=0` as the uniform law, without evaluating a `0/0` normalizer.
   Put `A_d(κ)=I_(d/2)(κ)/I_(d/2-1)(κ)` for `κ>0`.
   Prove mean `A_d(κ)*m`, second moment `(A_d(κ)/κ)*I + (1-d*A_d(κ)/κ)*m*mᵀ`, and covariance obtained by subtracting the mean outer product.
   At zero concentration prove mean zero and covariance `I/d` directly.
   Prove orthogonal equivariance, joint parameter measurability, and the directional mgf as the ratio of normalizing integrals at vector parameters `κ*m+t*θ` and `κ*m`, handling a zero vector by the surface-area value.
   The exponential-integrability domain of each real projection is `ℝ`.
   Prove the one-dimensional density of `⟪m,X⟫` proportional to `exp(κ*y)*(1-y²)^((d-3)/2)` on `(-1,1)`, including its normalization constant from the sphere integral, cdf integral, and unique-root quantile.

3. **Circle carrier and von Mises.** Use `AddCircle (2*π)` with its Borel structure and the normalized Haar probability measure `ProbabilityTheory.cond (volume : Measure (AddCircle (2*π))) Set.univ`.
   Prove its equality to `(ENNReal.ofReal (2*π))⁻¹ • volume`, and connect it by the usual sine/cosine map to the unit circle in `EuclideanSpace ℝ (Fin 2)`.
   Prove that this map transports Haar probability to the uniform sphere law and that integration in the angle chart corresponds to `dθ/(2π)` on `[-π,π)`.
   Define von Mises at location `m` in this circle and `κ≥0` by Haar density `exp(κ*cos(θ-m))/I_0(κ)`; invalid negative concentration gives zero.
   Prove the two-dimensional von Mises–Fisher identification, rotational equivariance, and integer Fourier moments `E[exp(I*n*θ)] = exp(I*n*m)*I_|n|(κ)/I_0(κ)`.
   The exponentials are well-defined circle characters; the notation using a real representative must be proved independent of that representative.
   State the first trigonometric moment and circular variance `1-I_1(κ)/I_0(κ)`; do not call the direction parameter an ordinary real expectation.
   At `κ=0` recover uniform Haar probability.
   Fix the measurable representative map to `[-π,π)` and give its real cdf as the integral of the angle density, and its quantile as the unique interior solution at `0<u<1`.
   These are chart-dependent quantities, not an intrinsic order on the circle.

4. **Wrapped normal.** For circle location `m` and variance `v : ℝ≥0`, define the translate by `m` of the pushforward of `gaussianReal 0 v` under the quotient map `ℝ → AddCircle (2*π)`.
   At `v=0`, prove Dirac at `m`.
   For `v>0`, derive the angle density relative to `dθ` as `∑' k : ℤ, (2π*v)^(-1/2)*exp(-(θ-m+2π*k)²/(2*v))` and the equivalent Fourier series `(2π)⁻¹*(1+2*∑' n≥1, exp(-n²*v/2)*cos(n*(θ-m)))`.
   The Haar density is `2π` times either expression; prove positivity, normalization, independence of the location representative, and locally uniform convergence supporting termwise integration.
   Prove integer Fourier moments `exp(I*n*m-n²*v/2)`, first trigonometric moment, circular variance `1-exp(-v/2)`, and convolution by addition of circle locations and variances.
   Prove weak convergence to Dirac as `v↓0` and to uniform Haar probability as `v→∞`.
   In the same `[-π,π)` chart as von Mises, prove the cdf by integrating the periodized density, equivalently summing Gaussian interval probabilities, and the unique-root quantile for `v>0`.
   At zero variance, the chart law and quantile are Dirac at the chosen representative of `m`.

Key declarations:

```lean
uniformSphereMeasure
uniformBallMeasure
vonMisesFisherMeasure
circleHaarProbability
vonMisesMeasure
wrappedNormalMeasure
map_direction_multivariateGaussian
vonMisesFisherMeasure_zero
wrappedNormalMeasure_conv
```

Completion checks:

- The circle's uniform angle chart agrees with `uniformMeasure (-π) π` as a real measure; differing endpoint conventions are null for Haar probability.
- Von Mises is the two-dimensional von Mises–Fisher law under the declared carrier equivalence.
- Wrapped normal has Gaussian integer Fourier coefficients with the characteristic-function convention of this roadmap, without an extra `2π` in the exponent.
- All sphere/circle density statements name their reference measure and all chart quantiles name their cut.

### Layer 13: quantile formulas and coverage of all families

This layer specializes Layer 7 to both existing and new distributions.
It does not replace the moment, transform, or cdf targets in any earlier layer.
Use `Qμ(u) = μ.quantile u` with `0<u<1`; write `z(u)` for the standard Gaussian quantile and use the inverse special functions of Layer 8.
All entries below include their degenerate probability boundaries as constant quantiles where appropriate.
Every finite formula has valid parameter hypotheses, and every scalar family gets the one-sided endpoint limits prescribed in Layer 7.

| Existing real law | Required interior quantile |
| --- | --- |
| Gaussian `gaussianReal m v` | `m+sqrt(v)*z(u)`, also at `v=0`. |
| Gamma, shape `a>0`, rate `r>0` | `G_a⁻¹(u)/r`. |
| Beta, shapes `a,b>0` | `B_(a,b)⁻¹(u)`. |
| Exponential, rate `r>0` | `-log(1-u)/r`. |
| Cauchy, location `m`, scale `γ≥0` | `m+γ*tan(π*(u-1/2))`, also at `γ=0`. |
| Pareto, threshold `t>0`, shape `r>0` | `t*(1-u)^(-1/r)`. |
| Interval uniform, `a<b` | `a+(b-a)*u`. |
| Laplace, location `m`, scale `b>0` | `m+b*log(2*u)` for `u≤1/2`, otherwise `m-b*log(2*(1-u))`. |
| Log-normal, location `m`, log-variance `v≥0` | `exp(m+sqrt(v)*z(u))`, also at `v=0`. |
| Weibull, shape `k>0`, scale `a>0` | `a*(-log(1-u))^(1/k)`. |
| Chi-squared, `k>0` | `2*G_(k/2)⁻¹(u)`; at `k=0`, zero. |
| Inverse-gamma, shapes `a,r>0` | `r/G_a⁻¹(1-u)`. |
| Student t, degree `ν>0` | For `u<1/2`, `-sqrt(ν*(1/b-1))` with `b=B_(ν/2,1/2)⁻¹(2*u)`; for `u>1/2`, the positive expression with `b=B_(ν/2,1/2)⁻¹(2*(1-u))`; at `u=1/2`, zero. |
| Fisher F, degrees `m,n>0` | `(n/m)*b/(1-b)` with `b=B_(m/2,n/2)⁻¹(u)`. |

For the existing discrete families, require these cast-law results:

- Bernoulli on `{0,1}`: zero if `u≤1-p`, one otherwise, including `p=0,1`.
- Geometric counting failures, `0<p<1`: `ceil(log(1-u)/log(1-p))-1`; at both `p=0` and `p=1`, zero under Mathlib's Dirac conventions.
- Poisson: the least `k : ℕ` for which the explicit Poisson cumulative sum is at least `u`, and the equivalent regularized-gamma characterization from Layer 2; at rate zero, zero.
- Binomial, negative binomial, and hypergeometric: the least supported integer for which the cumulative formulas in Layers 1–3 reach `u`, with their incomplete-beta versions where specified there.
  Prove these least-crossing formulas using the closed cdf or finite sum, not merely a restatement of the real `sInf` definition.

For new scalar laws, prove the formulas in Layers 9–10; the explicit cdf there supplies the least-crossing or unique-root characterization when no elementary or named-special-function inverse is given.
For compound Poisson and atom mixtures, use the explicit cdf series or mixture cdf and the general adjunction, without asserting strict monotonicity or uniqueness of every cdf level.
For all interval-truncated laws, use Layer 7's rescaled probability level, including one-sided unbounded intervals and atom corrections.

For multivariate and constrained families, require the following scalar quantile coverage:

- Categorical and finite uniform laws: for any supplied real-valued label map, order the finitely many distinct values and use the least cumulative-mass crossing, aggregating equal labels.
- Multinomial, Dirichlet-multinomial, and multivariate hypergeometric: coordinate quantiles through their binomial, beta-binomial, and hypergeometric marginals.
- Dirichlet: beta coordinate quantiles, with the one-coordinate simplex handled as Dirac at one.
- Multivariate Gaussian, multivariate t, matrix normal, and proper complex Gaussian: real linear-functional quantiles via the corresponding scalar Gaussian or Student-t law, with variance-zero or scale-zero directions handled separately.
- Uniform sphere and ball: coordinate/projection quantiles through the beta laws of Layer 12, and ball-radius quantiles; dimension-one sphere uses its two-point law.
- Von Mises–Fisher: the mean-direction projection quantile of Layer 12; von Mises and wrapped normal: the fixed angle-chart quantiles there.
- Wishart: diagonal quantiles through `S_ii * chiSquared(n)` for the nonsingular family and `S_ii * chiSquared(ν)` for the Gaussian-Gram family, including zero scales and degrees where valid.
  Prove the diagonal marginal equalities from the existing congruence and Gaussian-square results.
- Inverse-Wishart in positive dimension: use the diagonal inverse-gamma law of Layer 6 item 8 to prove quantile `(S_ii/2)/G_((n-p+1)/2)⁻¹(1-u)` for valid `S,n`.
  At `p=1`, this agrees with the scalar inverse-gamma specialization.

No joint multivariate quantile, numerical quantile algorithm, statistical estimator, or order-statistic theory is required.

Key declarations:

```lean
quantile_gammaMeasure
quantile_inverseGammaMeasure
quantile_studentTMeasure
quantile_fisherSnedecorMeasure
quantile_map_cast_geometricMeasure
quantile_multivariateTMeasure_projection
quantile_diagonal_inverseWishartMeasure
```

Completion checks:

- Each row of the scalar table and each named discrete family has a quantile theorem instantiated on its actual measure.
- The interior quantile at probability `1/2` specializes to a median, including atoms; no uniqueness of medians is asserted in general.
- The location-scale theorem transports every scalar formula and every stated real-observable formula to arbitrary positive scales and translations, with zero and negative scales handled by Layer 7.
- Each declared inverse-function formula is justified by a cdf identity, support bounds, and monotonicity, rather than by a new name for an unproved inverse.

## Boundaries with other roadmaps

- The [orthogonal-L²-bases roadmap](../OrthogonalL2Bases/README.md) owns moment determinacy and Gaussian Hermite L² theory, represented in `TauCeti/Probability/Moments/` and `TauCeti/Probability/Distributions/Gaussian/`.
  This roadmap reuses the existing Gaussian `Basic`, `Pi`, and `PolynomialMemLp` material and adds elementary distribution APIs; it does not restate the Hermite-basis or determinacy targets.
- The [optimal-transport roadmap](../OptimalTransport/README.md) covers multivariate-Gaussian transport: the Brenier matrix formula, the closed `W₂` formula, interpolation, barycenters, and the positive-definite square-root and geometric-mean identities they require.
  This roadmap covers distribution theory — densities, conditional laws, affine formulas — and Cholesky decomposition.
  Neither roadmap restates the other's matrix results.
  Optimal transport also owns the quantile construction, measurability, and uniform pushforward used for monotone transport, implemented in `TauCeti/Probability/Quantile.lean`.
  Layers 7 and 13 import that API and own its distribution formulas, parameter measurability, upper-quantile reflection bridge, and elementary inverse-function specializations; optimal couplings and Wasserstein quantile identities remain in optimal transport.
- The [one-parameter-semigroups roadmap](../OneParameterSemigroups/README.md) covers positive-definite functions and Bochner's theorem.
  This roadmap computes characteristic functions for named distributions but does not redevelop their general positive-definiteness or Bochner representations.
  The two roadmaps have no shared targets or dependencies.
- General stable laws and Lévy processes are outside this roadmap.
  The scalar Lévy distribution is included as an inverse-gamma specialization, and compound Poisson is developed as a distribution construction.
  Neither requires a general stable-law existence theorem or a process construction.

These boundaries do not permit missing glue.
A target that uses another roadmap must still include any bridge not supplied by its stated prerequisites.

## Ordering and claim size

Build Layer 0 first, because it establishes the measure and density conventions, and then Layer 1.
After that:

- Layers 2 and 3 are independent, except that the closed-form cdfs in Layer 3 require Layer 2.
- Layer 4 requires Layers 1–3.
- The Gaussian parts of Layer 5 require only Layer 0.
  The rest requires Layers 0–2, and the Dirichlet-to-Beta marginal also requires item 3 of Layer 4.
- Layer 6 requires Layers 3–5: chi-squared is used in Bartlett decomposition and the one-dimensional density theorem, Layer 4's Gaussian-square laws supply the one-dimensional Gaussian-Gram theorem, and the Gaussian quadratic-form mgf of Layer 5 supplies the Gaussian-Gram transforms.

- Layer 7's affine, conditioning, mixture, and compound Poisson results use Layers 0–1 and existing measure theory; its quantile results also import the existing optimal-transport quantile foundation.
- Layer 8's inverse functions use Layer 2; its Bessel, Owen, zeta, and theta bridges have the prerequisites listed in their entries.
- Layer 9 uses Layer 7 and the relevant parts of Layer 8, together with the Beta, multinomial, Dirichlet, and hypergeometric laws already specified.
- Layer 10 uses Layers 0–4 and 7–8; noncentral families additionally use Poisson mixtures, without a dependency on discrete families unrelated to those mixtures.
- Layer 11 uses the Gaussian and chi-squared laws, Layer 7, and the scalar Student law; conditional multivariate t requires Layer 5's conditional Gaussian infrastructure.
- Layer 12's uniform sphere and ball require the Gaussian and chi laws and the existing polar-measure infrastructure; von Mises–Fisher and circular laws then use the relevant Layer 8 functions.
- Layer 13 specializes quantiles as soon as each cdf and marginal law is available.
  The inverse-Wishart diagonal entry uses Layer 6 item 8's real-degree Schur-complement law.

A good claim is one numbered construction, one distribution family with its specializations, or one inverse-function development.
A family's claim includes its listed quantile targets and affine identifications.
Treat the conditional-Gaussian, conditional-multivariate-t, multivariate-Gamma integral, and real-degree Wishart Schur-complement results as separate claims.

## References

- N. L. Johnson, S. Kotz, N. Balakrishnan, *Continuous Univariate Distributions*, [vol. 1](https://books.google.com/books?vid=ISBN9780471584957) (1994) and [vol. 2](https://books.google.com/books?id=BTANEAAAQBAJ) (1995), 2nd ed., Wiley (the scalar continuous families and their transformations).
- N. L. Johnson, A. W. Kemp, S. Kotz, [*Univariate Discrete Distributions*](https://onlinelibrary.wiley.com/doi/book/10.1002/0471715816), 3rd ed., Wiley, 2005 (especially chs. 3–6 for binomial, Poisson, negative-binomial, and hypergeometric laws).
- R. J. Muirhead, [*Aspects of Multivariate Statistical Theory*](https://onlinelibrary.wiley.com/doi/book/10.1002/9780470316559), Wiley, 1982 ([ch. 2](https://onlinelibrary.wiley.com/doi/10.1002/9780470316559.ch2) for the matrix Jacobians of Layer 6; [ch. 3](https://onlinelibrary.wiley.com/doi/10.1002/9780470316559.ch3) for multivariate Gamma, the Wishart density and moment-generating function, and Bartlett decomposition).
- E. Mayerhofer, [*Reforming the Wishart characteristic function*](https://arxiv.org/abs/1901.09347), 2019 (the branch ambiguity in determinant-power formulas for the Wishart characteristic function).
- T. W. Anderson, [*An Introduction to Multivariate Statistical Analysis*](https://books.google.com/books?id=1Ts4nwEACAAJ), 3rd ed., Wiley, 2003 (conditional multivariate Gaussians).
- M. L. Eaton, [*Multivariate Statistics: A Vector Space Approach*](https://books.google.com/books?id=WyvvAAAAMAAJ), IMS Lecture Notes–Monograph Series 53 (vector-space Gaussians, invariant measures, and Wishart theory).
- *NIST Digital Library of Mathematical Functions*, [ch. 7](https://dlmf.nist.gov/7) (error functions, especially [§7.2](https://dlmf.nist.gov/7.2) and [§7.11](https://dlmf.nist.gov/7.11)) and [ch. 8](https://dlmf.nist.gov/8) (incomplete gamma and beta functions, especially [§8.2](https://dlmf.nist.gov/8.2) and [§8.17](https://dlmf.nist.gov/8.17)).
- P. Billingsley, [*Probability and Measure*](https://books.google.com/books?id=d27jzQEACAAJ), 3rd ed., Wiley, 1995 (measure-theoretic probability foundations).
- N. I. Fisher, *Statistical Analysis of Circular Data*, Cambridge University Press, 1993, and K. V. Mardia and P. E. Jupp, *Directional Statistics*, Wiley, 2000 (circle and sphere laws, reference measures, and directional moments).
- S. Coles, *An Introduction to Statistical Modeling of Extreme Values*, Springer, 2001 (GEV and generalized Pareto conventions and stability identities).
- A. Azzalini and A. Capitanio, *The Skew-Normal and Related Families*, Cambridge University Press, 2014 (skew-normal constructions and Owen's T).
- D. Tse and P. Viswanath, [*Fundamentals of Wireless Communication*, appendix A](https://web.stanford.edu/~dntse/papers/press_book.pdf), Cambridge University Press, 2005 (proper complex Gaussian conventions).
- *NIST Digital Library of Mathematical Functions*, [§10.25](https://dlmf.nist.gov/10.25), [§10.29](https://dlmf.nist.gov/10.29), and [§10.32](https://dlmf.nist.gov/10.32) (modified Bessel functions, recurrences, and integral representations).
- C. L. Canonne, G. Kamath, and T. Steinke, [*The Discrete Gaussian for Differential Privacy*](https://arxiv.org/abs/2004.00010), 2020 (integer Gaussian normalization and parameter conventions; privacy theorems are outside scope).

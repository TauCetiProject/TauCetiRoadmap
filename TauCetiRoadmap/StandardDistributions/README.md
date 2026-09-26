# Roadmap: standard probability distributions and their elementary theory

Mathlib supplies the starting definitions for the real and multivariate Gaussian, Gamma, Beta, exponential, Cauchy, Pareto, Poisson, geometric, binomial, and Bernoulli laws.
This roadmap completes their elementary distributional APIs and connects the continuous scalar families to `MeasureTheory.HasPDF` and Radon–Nikodym derivatives.

It also asks Tau Ceti to define a uniform probability measure on an interval and the Laplace, log-normal, Weibull, chi-squared, inverse-gamma, Student's t, Fisher's F, negative-binomial, hypergeometric, multinomial, Dirichlet, and nonsingular and Gaussian-Gram Wishart families.
The multivariate-Gaussian targets include densities and conditional-distribution formulas.

It develops each distribution as a measure, proves the elementary theory appropriate to its carrier, and records the standard relationships among the families as pushforward, convolution, independence, or mixture statements.
It also supplies the special functions and matrix measure theory needed to state the usual cdfs and Wishart formulas.

The roadmap is complete when every target in Layers 0–6 and every completion check has been met.
Statistical inference is outside its scope: there are no targets about data, likelihoods, sufficiency, estimators, priors or posteriors, hypothesis tests, losses, or decision rules.

Suggested files:

```text
TauCeti/Probability/Distributions/          (one file or directory per family)
TauCeti/Probability/GeneratingFunction.lean (probability generating functions)
TauCeti/Analysis/Matrix/Frobenius.lean
TauCeti/Analysis/SpecialFunctions/          (incomplete gamma and beta, error function)
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
   - A discrete family gets its singleton masses and a representation as a weighted sum of Dirac measures.
4. **Parameter measurability** in the form `Measurable fun p => fooMeasure p`, using the Giry measurable structure on `Measure α`.
   This is enough for a consumer to construct a `ProbabilityTheory.Kernel`.
   State matrix-parameter measurability through the coordinate carrier and `Matrix.of`: use the target `Measurable fun S : ι → ι → ℝ => fooMeasure (Matrix.of S)`, with the remaining parameters paired alongside.
   When the matrix is the scale of a symmetric-matrix family, also record the corollary in which it ranges over the symmetric-matrix carrier of Layer 6 with its Borel σ-algebra; that is the form a kernel with a random scale needs.
5. **The family-specific identities** listed in the relevant layer below.

The family entries in Layers 0–6 are exhaustive about which cdfs, moments, transforms, and exponential-integrability results are targets.
The carrier rules below specify how to state those listed targets; they do not silently require an additional closed form.

- **Real-valued families (`Measure ℝ`)** use `ProbabilityTheory.cdf`; each family entry says whether the target is a named closed form or the integral of its pdf.
  They get exactly the means, variances, raw or central moments, and descriptions of `integrableExpSet id μ` stated in their family entries.
  Prove a closed form for `mgf id` or `MeasureTheory.charFun` only when one is named below.
  Heavy-tailed families need both the sharp existence hypotheses and the matching non-integrability results.
  Whenever an mgf formula is requested on its finiteness domain, also give the corresponding `cgf` as the real logarithm of that formula.

  The absence of an mgf or characteristic-function formula is deliberate.
  In particular, this roadmap does not ask for the confluent-hypergeometric Beta transforms, the Bessel-function inverse-gamma transforms, or a log-normal mgf formula.
  The exact exponential-integrability domain is still required.
- **Discrete families on `ℕ`** stay on their native carrier for masses, support, convolution, and `pgf`.
  Each family entry lists the required cumulative-mass, moment, mgf, cgf, and characteristic-function formulas.
  State its listed real-valued results for the pushforward `(fooMeasure p).map (Nat.cast : ℕ → ℝ)`, using Mathlib's `Bin(ℝ, n, p)` notation where available.
  A finite-sum cdf or transform is a complete target when the family entry says so; no unstated hypergeometric-function closed form is required.
  Never apply real-only operations directly to `Measure ℕ`.
  The pgf–mgf bridge is `pgf X P (exp t) = mgf (fun ω => (X ω : ℝ)) P t`.
- **Finite multivariate families** get the Bochner mean, `covMatrix`/`covarianceBilin`, coordinate marginals, affine or aggregation laws, and transforms listed in their Layer 5 entries.
  They do not get a scalar cdf or `mgf id`.
  A listed directional mgf applies `ProbabilityTheory.mgf` to an explicit real-valued linear functional and pairs it with an exact `integrableExpSet` theorem.
  A discrete vector law stays on `ι → ℕ` for masses and support, then uses the coordinatewise cast to `EuclideanSpace ℝ ι` for means, covariances, and characteristic functions.
- **Symmetric-matrix families** get exactly the density or singular-support theorem, Bochner mean, covariance data, and transforms listed in Layer 6.
  Wishart trace mgfs use an explicit real-valued linear functional; scalar cdfs and `mgf id` are not targets.
  Whenever a trace mgf formula is requested on its finiteness domain, also give the corresponding `cgf` as the real logarithm of that formula.
  The inverse-Wishart family has no covariance or transform target beyond the mean and non-integrability statements explicitly listed there.

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
  This roadmap does not port from SampCert and does not include discrete Laplace or Gaussian distributions on `ℤ`.
- [`stat-lib/statlib`](https://github.com/stat-lib/statlib) develops frequentist inference on top of Mathlib.
  Its decision-rule and asymptotic results lie beyond this roadmap's inference boundary.
  Coordinate on the Lean Zulip if future work approaches that boundary.

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
  State differentiability with `deriv = x^(s-1) * exp (-x)` only for `0 < x`.
  When `0 < s < 1`, continuity — not differentiability — is the target at `x = 0`.
- **Regularized incomplete beta.** For `0 < a` and `0 < b`, define it as the integral from `0` to `min 1 (max x 0)`, normalized by `ProbabilityTheory.beta a b`.
  Use zero for invalid parameters, with one deliberate exception: `regularizedIncompleteBeta 0 b x = 1` when `0 < b` and `0 ≤ x`.

  For positive `a,b`, prove that the function is `0` on `x ≤ 0`, `1` on `1 ≤ x`, continuous and monotone on `ℝ`, and state differentiability only under `0 < x < 1`.
  For `0 ≤ x ≤ 1`, prove the reflection formula `I_x(a,b) = 1 - I_{1-x}(b,a)`.
  On the same range, prove the unit-step recurrence `I_x(a+1,b) = I_x(a,b) - Real.rpow x a * Real.rpow (1-x) b / (a * ProbabilityTheory.beta a b)`, in the form of [DLMF 8.17.20](https://dlmf.nist.gov/8.17.E20).

  The `a = 0` convention records the cdf of the weak limit `betaMeasure a b → Measure.dirac 0` as `a → 0⁺`.
  It also makes the `m = 0` binomial-tail formula below hold without a separate case.
  Keep the default value zero when `b = 0`; no later target uses that boundary.
  The other possible weak-limit convention would record the cdf of `Measure.dirac 1`.
  Do not state a reflection theorem on either boundary edge: the positive-parameter identity cannot include both atomic limit laws at their discontinuities.
- **Error function.** Using the names from mathlib4#34053, define `Real.erf x = (2 / √π) * ∫ t in 0..x, exp (-t^2)` and `Real.erfc x = 1 - Real.erf x`.
  Prove oddness, monotonicity, the limits at both infinities, the derivative, and `Real.erf x = regularizedGamma (1/2) (x^2)` for `0 ≤ x`.
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
Families not named here, such as logistic, Rayleigh, and von Mises, are outside this roadmap.

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
```

Completion checks:

- For every `p`, the selected topology and uniformity on `selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)` are definitionally equal to the corresponding subtype instances, and the topology induced by the selected uniformity is definitionally the selected topology.
- For every `p`, the selected topology and uniformity on the positive-diagonal lower-triangular carrier are definitionally the corresponding subtype instances.
- Under the stated positive parameters, the `1 × 1` nonsingular Wishart law agrees with Layer 3's chi-squared law through the explicit coordinate equivalence.
- For every natural `ν` and `0 ≤ σ²`, the `1 × 1` Gaussian-Gram law is `(chiSquaredMeasure ν).map (σ² * ·)` through the same equivalence, by Layer 4 item 1; at `ν = 0` both sides are `Measure.dirac 0`.
- In every dimension, the natural-degree Gaussian-Gram and nonsingular density families agree when `S.PosDef` and `p ≤ ν`, and their trace mgfs, cgfs, and characteristic functions are literally the same formulas there.
- `multivariateGamma 1 a = Gamma a`.

## Boundaries with other roadmaps

- The [orthogonal-L²-bases roadmap](../OrthogonalL2Bases/README.md) owns moment determinacy and Gaussian Hermite L² theory, represented in `TauCeti/Probability/Moments/` and `TauCeti/Probability/Distributions/Gaussian/`.
  This roadmap reuses the existing Gaussian `Basic`, `Pi`, and `PolynomialMemLp` material and adds elementary distribution APIs; it does not restate the Hermite-basis or determinacy targets.
- The [optimal-transport roadmap](../OptimalTransport/README.md) covers multivariate-Gaussian transport: the Brenier matrix formula, the closed `W₂` formula, interpolation, barycenters, and the positive-definite square-root and geometric-mean identities they require.
  This roadmap covers distribution theory — densities, conditional laws, affine formulas — and Cholesky decomposition.
  Neither roadmap restates the other's matrix results.
- The [one-parameter-semigroups roadmap](../OneParameterSemigroups/README.md) covers positive-definite functions and Bochner's theorem.
  This roadmap computes characteristic functions for named distributions but does not redevelop their general positive-definiteness or Bochner representations.
  The two roadmaps have no shared targets or dependencies.

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

A good claim is one distribution family (usually one file) or one numbered item from Layer 4 or Layer 6.
Treat the conditional-Gaussian result and the multivariate-Gamma integral as separate claims.

## References

- N. L. Johnson, S. Kotz, N. Balakrishnan, *Continuous Univariate Distributions*, [vol. 1](https://books.google.com/books?vid=ISBN9780471584957) (1994) and [vol. 2](https://books.google.com/books?id=BTANEAAAQBAJ) (1995), 2nd ed., Wiley (the scalar continuous families and their transformations).
- N. L. Johnson, A. W. Kemp, S. Kotz, [*Univariate Discrete Distributions*](https://onlinelibrary.wiley.com/doi/book/10.1002/0471715816), 3rd ed., Wiley, 2005 (especially chs. 3–6 for binomial, Poisson, negative-binomial, and hypergeometric laws).
- R. J. Muirhead, [*Aspects of Multivariate Statistical Theory*](https://onlinelibrary.wiley.com/doi/book/10.1002/9780470316559), Wiley, 1982 ([ch. 2](https://onlinelibrary.wiley.com/doi/10.1002/9780470316559.ch2) for the matrix Jacobians of Layer 6; [ch. 3](https://onlinelibrary.wiley.com/doi/10.1002/9780470316559.ch3) for multivariate Gamma, the Wishart density and moment-generating function, and Bartlett decomposition).
- E. Mayerhofer, [*Reforming the Wishart characteristic function*](https://arxiv.org/abs/1901.09347), 2019 (the branch ambiguity in determinant-power formulas for the Wishart characteristic function).
- T. W. Anderson, [*An Introduction to Multivariate Statistical Analysis*](https://books.google.com/books?id=1Ts4nwEACAAJ), 3rd ed., Wiley, 2003 (conditional multivariate Gaussians).
- M. L. Eaton, [*Multivariate Statistics: A Vector Space Approach*](https://books.google.com/books?id=WyvvAAAAMAAJ), IMS Lecture Notes–Monograph Series 53 (vector-space Gaussians, invariant measures, and Wishart theory).
- *NIST Digital Library of Mathematical Functions*, [ch. 7](https://dlmf.nist.gov/7) (error functions, especially [§7.2](https://dlmf.nist.gov/7.2) and [§7.11](https://dlmf.nist.gov/7.11)) and [ch. 8](https://dlmf.nist.gov/8) (incomplete gamma and beta functions, especially [§8.2](https://dlmf.nist.gov/8.2) and [§8.17](https://dlmf.nist.gov/8.17)).
- P. Billingsley, [*Probability and Measure*](https://books.google.com/books?id=d27jzQEACAAJ), 3rd ed., Wiley, 1995 (measure-theoretic probability foundations).

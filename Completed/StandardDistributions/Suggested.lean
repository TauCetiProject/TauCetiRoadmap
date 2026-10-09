import Mathlib
import TauCeti.Analysis.Matrix.Frobenius
import TauCeti.Analysis.Matrix.Sqrt
import TauCeti.Analysis.SpecialFunctions.Erf
import TauCeti.Analysis.SpecialFunctions.IncompleteBeta
import TauCeti.Analysis.SpecialFunctions.IncompleteGamma
import TauCeti.Analysis.SpecialFunctions.MultivariateGamma.Basic
import TauCeti.Analysis.SpecialFunctions.MultivariateGamma.Integral
import TauCeti.LinearAlgebra.Matrix.Cholesky.Basic
import TauCeti.LinearAlgebra.Matrix.Cholesky.Coordinates
import TauCeti.LinearAlgebra.Matrix.Cholesky.Equiv
import TauCeti.LinearAlgebra.Matrix.Cholesky.Jacobian
import TauCeti.LinearAlgebra.Matrix.Cholesky.Topology
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Basic
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Cholesky
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Congruence
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Determinant
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Inv
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Lebesgue
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.PosDef
import TauCeti.Probability.Density
import TauCeti.Probability.Distributions.Bernoulli.Basic
import TauCeti.Probability.Distributions.Bernoulli.Measurability
import TauCeti.Probability.Distributions.Beta.Basic
import TauCeti.Probability.Distributions.Beta.Cdf
import TauCeti.Probability.Distributions.Beta.Measurability
import TauCeti.Probability.Distributions.Beta.PDF
import TauCeti.Probability.Distributions.Binomial.Basic
import TauCeti.Probability.Distributions.Binomial.Measurability
import TauCeti.Probability.Distributions.Binomial.Tail
import TauCeti.Probability.Distributions.Cauchy.Basic
import TauCeti.Probability.Distributions.Cauchy.Measurability
import TauCeti.Probability.Distributions.Cauchy.PDF
import TauCeti.Probability.Distributions.ChiSquared
import TauCeti.Probability.Distributions.Dirichlet.Aggregation
import TauCeti.Probability.Distributions.Dirichlet.Basic
import TauCeti.Probability.Distributions.Dirichlet.Density
import TauCeti.Probability.Distributions.Dirichlet.Marginal
import TauCeti.Probability.Distributions.Dirichlet.Measurability
import TauCeti.Probability.Distributions.Dirichlet.Moments
import TauCeti.Probability.Distributions.Exponential.Basic
import TauCeti.Probability.Distributions.Exponential.Measurability
import TauCeti.Probability.Distributions.Exponential.PDF
import TauCeti.Probability.Distributions.FisherSnedecor.Basic
import TauCeti.Probability.Distributions.FisherSnedecor.Cdf
import TauCeti.Probability.Distributions.FisherSnedecor.ChiSquared
import TauCeti.Probability.Distributions.FisherSnedecor.Measurability
import TauCeti.Probability.Distributions.FisherSnedecor.Moments
import TauCeti.Probability.Distributions.Gamma.Basic
import TauCeti.Probability.Distributions.Gamma.Beta
import TauCeti.Probability.Distributions.Gamma.Cdf
import TauCeti.Probability.Distributions.Gamma.CharFun
import TauCeti.Probability.Distributions.Gamma.Measurability
import TauCeti.Probability.Distributions.Gamma.PDF
import TauCeti.Probability.Distributions.Gamma.Pi
import TauCeti.Probability.Distributions.Gamma.Poisson
import TauCeti.Probability.Distributions.Gaussian.Affine
import TauCeti.Probability.Distributions.Gaussian.Cauchy
import TauCeti.Probability.Distributions.Gaussian.Cdf
import TauCeti.Probability.Distributions.Gaussian.ChiSquared
import TauCeti.Probability.Distributions.Gaussian.Conditional
import TauCeti.Probability.Distributions.Gaussian.Density
import TauCeti.Probability.Distributions.Gaussian.LowDimension
import TauCeti.Probability.Distributions.Gaussian.Measurability
import TauCeti.Probability.Distributions.Gaussian.Moments
import TauCeti.Probability.Distributions.Gaussian.Multivariate
import TauCeti.Probability.Distributions.Gaussian.PDF
import TauCeti.Probability.Distributions.Gaussian.QuadraticForm
import TauCeti.Probability.Distributions.Gaussian.Transforms
import TauCeti.Probability.Distributions.Geometric.Basic
import TauCeti.Probability.Distributions.Geometric.Measurability
import TauCeti.Probability.Distributions.Hypergeometric.Basic
import TauCeti.Probability.Distributions.Hypergeometric.Limit
import TauCeti.Probability.Distributions.Hypergeometric.Symmetry
import TauCeti.Probability.Distributions.InverseGamma.Basic
import TauCeti.Probability.Distributions.InverseGamma.Cdf
import TauCeti.Probability.Distributions.InverseGamma.Moments
import TauCeti.Probability.Distributions.Laplace
import TauCeti.Probability.Distributions.LogNormal
import TauCeti.Probability.Distributions.Multinomial.Aggregation
import TauCeti.Probability.Distributions.Multinomial.Basic
import TauCeti.Probability.Distributions.Multinomial.Marginal
import TauCeti.Probability.Distributions.Multinomial.Measurability
import TauCeti.Probability.Distributions.Multinomial.Moments
import TauCeti.Probability.Distributions.Multinomial.Transforms
import TauCeti.Probability.Distributions.NegativeBinomial.Basic
import TauCeti.Probability.Distributions.NegativeBinomial.Cdf
import TauCeti.Probability.Distributions.NegativeBinomial.Measurability
import TauCeti.Probability.Distributions.NegativeBinomial.Transforms
import TauCeti.Probability.Distributions.Pareto.Basic
import TauCeti.Probability.Distributions.Pareto.Measurability
import TauCeti.Probability.Distributions.Pareto.PDF
import TauCeti.Probability.Distributions.Poisson.Basic
import TauCeti.Probability.Distributions.Poisson.Measurability
import TauCeti.Probability.Distributions.Poisson.Tail
import TauCeti.Probability.Distributions.Relations
import TauCeti.Probability.Distributions.StudentT.Basic
import TauCeti.Probability.Distributions.StudentT.Cdf
import TauCeti.Probability.Distributions.StudentT.ChiSquared
import TauCeti.Probability.Distributions.StudentT.Moments
import TauCeti.Probability.Distributions.Sums
import TauCeti.Probability.Distributions.Uniform
import TauCeti.Probability.Distributions.Weibull.Basic
import TauCeti.Probability.Distributions.Weibull.Transforms
import TauCeti.Probability.Distributions.Wishart.Agreement
import TauCeti.Probability.Distributions.Wishart.Bartlett
import TauCeti.Probability.Distributions.Wishart.Basic
import TauCeti.Probability.Distributions.Wishart.CharFun
import TauCeti.Probability.Distributions.Wishart.Congruence
import TauCeti.Probability.Distributions.Wishart.Inverse.Basic
import TauCeti.Probability.Distributions.Wishart.Inverse.Measurability
import TauCeti.Probability.Distributions.Wishart.Inverse.Moments
import TauCeti.Probability.Distributions.Wishart.LowDimension
import TauCeti.Probability.Distributions.Wishart.Marginal
import TauCeti.Probability.Distributions.Wishart.Measurability
import TauCeti.Probability.Distributions.Wishart.Moments
import TauCeti.Probability.Distributions.Wishart.Nonsingular
import TauCeti.Probability.Distributions.Wishart.Transforms
import TauCeti.Probability.GeneratingFunction
import TauCeti.Probability.Moments.ComplexMGF
import TauCeti.Probability.Moments.Covariance

/-!
# Standard probability distributions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every target of `README.md`, Layers 0 to 6 with their completion checks and the shared
per-family requirements, has a statement here in the form the roadmap asks for, closed by the
Tau Ceti or Mathlib declaration that realizes it, so the correspondence is checked by the Lean
kernel rather than asserted in prose. No statement is left unproved. That is evidence for
completion, not its criterion: completion is judged by a milestone-by-milestone audit against
`README.md`, which a fully discharged file of suggested forms cannot replace.

Boundary cases that Tau Ceti proves only as instances of a general theorem (the chi-squared mean,
variance and characteristic function at `k = 0`, the log-normal mean and variance at `v = 0`)
are stated here explicitly and closed by specializing that theorem.

The earlier version of this file proposed local definitions (`uniformMeasure`, the incomplete
gamma and beta functions, `erf`, `laplaceMeasure`, `chiSquaredMeasure`, `logNormalMeasure`,
`studentTMeasure`, `negativeBinomialMeasure`, `covMatrix`, `multinomialMeasure`,
`dirichletMeasure`, `gaussianCondKernel`, the symmetric-matrix carrier and Cholesky coordinates,
`multivariateGamma`, and the Wishart and inverse-Wishart families) with `sorry` goals about them.
Those definitions now live in Tau Ceti, mostly in `TauCeti.Probability`, and each is certified
below by its defining property or formula. Every earlier target is carried over, some under the
Tau Ceti name or in a more general form. Local helpers that Tau Ceti does not need are not
restated: the block and restriction functions of the conditional Gaussian (replaced by
`EuclideanSpace.sumEquivProd` and `Matrix.submatrix`), `posDefToSymmetric` and
`posSemidefToSymmetric` (the bundled scale is written inline), `sumVecMulVec` (now
`TauCeti.Probability.wishartGram`), `rectangularSymmetricCongruence` (now
`Matrix.symmetricCongruenceLinearMap`), the measures on the positive-diagonal lower-triangular
subtype (replaced by the coordinate region `posDiagLowerRegion`), and the Bartlett encodings
`bartlettIndex`, `bartlettEntry` and `wishartPosDefMeasure` (replaced by a `HasLaw` statement for
the Cholesky entries of a random matrix with the `comap` law).

The deliberate differences between the README's requested forms and Tau Ceti's are these.

* The error function is Tau Ceti's `TauCeti.Real.erf`. Mathlib at the pinned revision has no
  `Real.erf` (mathlib4#34053 has not landed), and the exponential mgf and memorylessness of
  mathlib4#35504 are likewise local Tau Ceti theorems. The README asks for these stand-ins to be
  removed once the pinned Mathlib provides the upstream declarations; that condition has not yet
  occurred. The binomial mean of mathlib4#40613 is consumed from Mathlib.
* pgf multiplicativity on `|t| ≤ 1` assumes `AEMeasurable X` and `AEMeasurable Y`; it needs no
  integrability hypothesis. The README's "without extra hypotheses" is corrected by a marked
  erratum: Mathlib's `IndepFun` does not include measurability, and without it `pgf X μ t` can be
  the totalized value of a non-measurable integrand.
* The uniform `ℝ≥0∞` density is Mathlib's `pdf.uniformPDF`, linked to `uniformPDFReal`. Geometric
  memorylessness is stated in Tau Ceti with `measureReal`; the README's division-free `ℝ≥0∞` form
  is a short bridge.
* Many Tau Ceti statements hold more generally than requested: `HasPDF` for gamma, beta,
  exponential, Pareto and Laplace for all parameters; geometric moments for every `p`;
  incomplete-beta reflection for every `x`; negative-binomial convolution and cast-law transforms
  for `0 ≤ r`; the conditional Gaussian law for positive-semidefinite `S` with a positive-definite
  observed block; the multivariate Gamma integral and the inverse-Wishart mean without `0 < p`;
  the Bartlett decomposition for real degree `n > p - 1` (the README's natural-degree form is a
  specialization).
* The multinomial parameter is Mathlib's `Convexity.StdSimplex ℝ≥0 ι` with `StdSimplex.map`, and
  the Dirichlet support is stated through `StdSimplex.weights`, because the set `stdSimplex` the
  README names is deprecated in Mathlib.
* Several Tau Ceti names differ from the README's: `gaussianReal_map_sq` (README
  `map_sq_gaussianReal`), `map_eval_dirichletMeasure` (README `dirichletMeasure_marginal_beta`),
  `hasLaw_wishartGram_gaussian` (README `hasLaw_sum_vecMulVec_gaussian`), and
  `Matrix.GeneralLinearGroup.symmetricCongruence` (README `symmetricCongruence`). The certificate
  states these theorems under the README names.
* Tau Ceti writes several cgfs in expanded form (for example `-(k / 2) * log (1 - 2 * t)`); the
  certificate states the README's form, the real logarithm of the mgf. The Wishart cone-Laplace
  specialization is stated as an integral of `exp (-trace (Θ * A))` rather than as `mgf` at
  `t = -1`.
-/

namespace TauCetiRoadmap.StandardDistributions

noncomputable section Layers01

open MeasureTheory ProbabilityTheory TauCeti.Probability
open scoped ENNReal NNReal unitInterval ProbabilityTheory Nat

/-! ## Layer 0: connect existing densities and add the uniform distribution -/

section Layer0

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} {X : Ω → ℝ}

/-- **Layer 0, item 1.** The shared helper: a law presented as `withDensity` has a pdf. -/
theorem hasPDF_of_hasLaw_withDensity {E : Type*} [MeasurableSpace E] {μ : Measure E}
    {Y : Ω → E} {f : E → ℝ≥0∞} (hf : AEMeasurable f μ) (hY : HasLaw Y (μ.withDensity f) P) :
    HasPDF Y P μ :=
  TauCeti.Probability.hasPDF_of_hasLaw_withDensity hf hY

/-- Gamma laws have a pdf, equal to `gammaPDF a r`. -/
theorem hasPDF_pdf_of_hasLaw_gammaMeasure {a r : ℝ} (hX : HasLaw X (gammaMeasure a r) P) :
    HasPDF X P ∧ pdf X P =ᵐ[volume] gammaPDF a r :=
  ⟨hasPDF_of_hasLaw_gammaMeasure hX, pdf_eq_gammaPDF_of_hasLaw_gammaMeasure hX⟩

/-- Nondegenerate real Gaussian laws have a pdf, equal to `gaussianPDF m v`. -/
theorem hasPDF_pdf_of_hasLaw_gaussianReal {m : ℝ} {v : ℝ≥0} (hv : v ≠ 0)
    (hX : HasLaw X (gaussianReal m v) P) :
    HasPDF X P ∧ pdf X P =ᵐ[volume] gaussianPDF m v :=
  ⟨hasPDF_of_hasLaw_gaussianReal hv hX, pdf_eq_gaussianPDF_of_hasLaw_gaussianReal hX⟩

/-- Beta laws have a pdf, equal to `betaPDF a b`. -/
theorem hasPDF_pdf_of_hasLaw_betaMeasure {a b : ℝ} (hX : HasLaw X (betaMeasure a b) P) :
    HasPDF X P ∧ pdf X P =ᵐ[volume] betaPDF a b :=
  ⟨hasPDF_of_hasLaw_betaMeasure hX, pdf_eq_betaPDF_of_hasLaw_betaMeasure hX⟩

/-- Exponential laws have a pdf, equal to `exponentialPDF r`. -/
theorem hasPDF_pdf_of_hasLaw_expMeasure {r : ℝ} (hX : HasLaw X (expMeasure r) P) :
    HasPDF X P ∧ pdf X P =ᵐ[volume] exponentialPDF r :=
  ⟨hasPDF_of_hasLaw_expMeasure hX, pdf_eq_exponentialPDF_of_hasLaw_expMeasure hX⟩

/-- Nondegenerate Cauchy laws have a pdf, equal to `cauchyPDF x₀ γ`. -/
theorem hasPDF_pdf_of_hasLaw_cauchyMeasure {x₀ : ℝ} {γ : ℝ≥0} (hγ : γ ≠ 0)
    (hX : HasLaw X (cauchyMeasure x₀ γ) P) :
    HasPDF X P ∧ pdf X P =ᵐ[volume] cauchyPDF x₀ γ :=
  ⟨hasPDF_of_hasLaw_cauchyMeasure hγ hX, pdf_eq_cauchyPDF_of_hasLaw_cauchyMeasure hX⟩

/-- Pareto laws have a pdf, equal to `paretoPDF t r`. -/
theorem hasPDF_pdf_of_hasLaw_paretoMeasure {t r : ℝ} (hX : HasLaw X (paretoMeasure t r) P) :
    HasPDF X P ∧ pdf X P =ᵐ[volume] paretoPDF t r :=
  ⟨hasPDF_of_hasLaw_paretoMeasure hX, pdf_eq_paretoPDF_of_hasLaw_paretoMeasure hX⟩

/-- **Layer 0, item 2.** The five new Radon-Nikodym identifications. -/
theorem rnDeriv_gammaMeasure (a r : ℝ) :
    (gammaMeasure a r).rnDeriv volume =ᵐ[volume] gammaPDF a r :=
  TauCeti.Probability.rnDeriv_gammaMeasure a r

/-- The Beta Radon-Nikodym derivative. -/
theorem rnDeriv_betaMeasure (a b : ℝ) :
    (betaMeasure a b).rnDeriv volume =ᵐ[volume] betaPDF a b :=
  TauCeti.Probability.rnDeriv_betaMeasure a b

/-- The exponential Radon-Nikodym derivative. -/
theorem rnDeriv_expMeasure (r : ℝ) :
    (expMeasure r).rnDeriv volume =ᵐ[volume] exponentialPDF r :=
  TauCeti.Probability.rnDeriv_expMeasure r

/-- The Cauchy Radon-Nikodym derivative. -/
theorem rnDeriv_cauchyMeasure (x₀ : ℝ) (γ : ℝ≥0) :
    (cauchyMeasure x₀ γ).rnDeriv volume =ᵐ[volume] cauchyPDF x₀ γ :=
  TauCeti.Probability.rnDeriv_cauchyMeasure x₀ γ

/-- At the boundary `cauchyMeasure x₀ 0 = dirac x₀` the derivative vanishes almost everywhere. -/
theorem rnDeriv_cauchyMeasure_zero_scale (x₀ : ℝ) :
    (cauchyMeasure x₀ 0).rnDeriv volume =ᵐ[volume] 0 :=
  TauCeti.Probability.rnDeriv_cauchyMeasure_zero_scale x₀

/-- The Pareto Radon-Nikodym derivative. -/
theorem rnDeriv_paretoMeasure (t r : ℝ) :
    (paretoMeasure t r).rnDeriv volume =ᵐ[volume] paretoPDF t r :=
  TauCeti.Probability.rnDeriv_paretoMeasure t r

/-- The Gaussian case is Mathlib's `rnDeriv_gaussianReal`, used directly. -/
theorem rnDeriv_gaussianReal (m : ℝ) (v : ℝ≥0) :
    (gaussianReal m v).rnDeriv volume =ᵐ[volume] gaussianPDF m v :=
  ProbabilityTheory.rnDeriv_gaussianReal m v

/-- **Layer 0, item 3.** The uniform measure is the conditioned volume on `Ioc a b`. -/
theorem uniformMeasure_def (a b : ℝ) :
    uniformMeasure a b = ProbabilityTheory.cond volume (Set.Ioc a b) := rfl

/-- The uniform measure is zero when `b ≤ a`. -/
theorem uniformMeasure_eq_zero_of_le {a b : ℝ} (hba : b ≤ a) : uniformMeasure a b = 0 :=
  TauCeti.Probability.uniformMeasure_eq_zero_of_le hba

/-- The uniform measure is a probability measure when `a < b`. -/
theorem isProbabilityMeasure_uniformMeasure {a b : ℝ} (hab : a < b) :
    IsProbabilityMeasure (uniformMeasure a b) :=
  TauCeti.Probability.isProbabilityMeasure_uniformMeasure hab

/-- The real uniform density, by its defining formula. -/
theorem uniformPDFReal_def (a b x : ℝ) :
    uniformPDFReal a b x = if x ∈ Set.Ioc a b then (b - a)⁻¹ else 0 := rfl

/-- The `ℝ≥0∞`-valued companion is Mathlib's `pdf.uniformPDF`, the `ofReal` of `uniformPDFReal`. -/
theorem uniformPDF_eq_ofReal_uniformPDFReal {a b : ℝ} (x : ℝ) :
    pdf.uniformPDF (Set.Ioc a b) x volume = ENNReal.ofReal (uniformPDFReal a b x) :=
  TauCeti.Probability.uniformPDF_eq_ofReal_uniformPDFReal x

/-- The uniform `withDensity` identity. -/
theorem uniformMeasure_eq_withDensity {a b : ℝ} :
    uniformMeasure a b =
      volume.withDensity (fun x => ENNReal.ofReal (uniformPDFReal a b x)) := by
  rw [TauCeti.Probability.uniformMeasure_eq_withDensity]
  simp_rw [TauCeti.Probability.uniformPDF_eq_ofReal_uniformPDFReal]

/-- A uniform random variable has a pdf. -/
theorem hasPDF_of_hasLaw_uniformMeasure {a b : ℝ} (hX : HasLaw X (uniformMeasure a b) P) :
    HasPDF X P :=
  TauCeti.Probability.hasPDF_of_hasLaw_uniformMeasure hX

/-- The uniform Radon-Nikodym derivative. -/
theorem rnDeriv_uniformMeasure {a b : ℝ} :
    (uniformMeasure a b).rnDeriv volume
      =ᵐ[volume] fun x => ENNReal.ofReal (uniformPDFReal a b x) := by
  simpa only [TauCeti.Probability.uniformPDF_eq_ofReal_uniformPDFReal] using
    TauCeti.Probability.rnDeriv_uniformMeasure (a := a) (b := b)

/-- The uniform cdf. -/
theorem cdf_uniformMeasure {a b : ℝ} (hab : a < b) (x : ℝ) :
    cdf (uniformMeasure a b) x =
      if x ≤ a then 0 else if b ≤ x then 1 else (x - a) / (b - a) :=
  TauCeti.Probability.cdf_uniformMeasure hab x

/-- The uniform mean. -/
theorem integral_id_uniformMeasure {a b : ℝ} (hab : a < b) :
    ∫ x, x ∂uniformMeasure a b = (a + b) / 2 :=
  TauCeti.Probability.integral_id_uniformMeasure hab

/-- The uniform variance. -/
theorem variance_id_uniformMeasure {a b : ℝ} (hab : a < b) :
    variance id (uniformMeasure a b) = (b - a) ^ 2 / 12 :=
  TauCeti.Probability.variance_id_uniformMeasure hab

/-- The uniform law has exponential moments of every order. -/
theorem integrableExpSet_id_uniformMeasure {a b : ℝ} :
    integrableExpSet id (uniformMeasure a b) = Set.univ :=
  TauCeti.Probability.integrableExpSet_id_uniformMeasure

/-- The uniform mgf at `t = 0`. -/
theorem mgf_id_uniformMeasure_zero {a b : ℝ} (hab : a < b) :
    mgf id (uniformMeasure a b) 0 = 1 :=
  TauCeti.Probability.mgf_id_uniformMeasure_zero hab

/-- The uniform mgf at `t ≠ 0`. -/
theorem mgf_id_uniformMeasure {a b t : ℝ} (hab : a < b) (ht : t ≠ 0) :
    mgf id (uniformMeasure a b) t =
      (Real.exp (b * t) - Real.exp (a * t)) / ((b - a) * t) := by
  rw [TauCeti.Probability.mgf_id_uniformMeasure hab ht, mul_comm t b, mul_comm t a]

/-- The uniform mgf is positive, so its cgf is a genuine logarithm. -/
theorem mgf_id_uniformMeasure_pos {a b : ℝ} (hab : a < b) (t : ℝ) :
    0 < mgf id (uniformMeasure a b) t :=
  TauCeti.Probability.mgf_id_uniformMeasure_pos hab t

/-- The uniform cgf at `t = 0`. -/
theorem cgf_id_uniformMeasure_zero {a b : ℝ} (hab : a < b) :
    cgf id (uniformMeasure a b) 0 = 0 :=
  TauCeti.Probability.cgf_id_uniformMeasure_zero hab

/-- The uniform cgf at `t ≠ 0` is the real logarithm of the mgf formula. -/
theorem cgf_id_uniformMeasure {a b t : ℝ} (hab : a < b) (ht : t ≠ 0) :
    cgf id (uniformMeasure a b) t =
      Real.log ((Real.exp (b * t) - Real.exp (a * t)) / ((b - a) * t)) := by
  rw [TauCeti.Probability.cgf_id_uniformMeasure hab ht, mul_comm t b, mul_comm t a]

/-- The uniform characteristic function at `t = 0`. -/
theorem charFun_uniformMeasure_zero {a b : ℝ} (hab : a < b) :
    charFun (uniformMeasure a b) 0 = 1 :=
  TauCeti.Probability.charFun_uniformMeasure_zero hab

/-- The uniform characteristic function at `t ≠ 0`. -/
theorem charFun_uniformMeasure {a b t : ℝ} (hab : a < b) (ht : t ≠ 0) :
    charFun (uniformMeasure a b) t =
      (Complex.exp (Complex.I * (b : ℂ) * (t : ℂ)) -
          Complex.exp (Complex.I * (a : ℂ) * (t : ℂ))) /
        (Complex.I * ((b : ℂ) - (a : ℂ)) * (t : ℂ)) := by
  rw [TauCeti.Probability.charFun_uniformMeasure hab ht]
  push_cast
  rfl

/-- The affine identity for uniform laws. -/
theorem map_uniformMeasure_affine {a b : ℝ} (hab : a < b) :
    (uniformMeasure 0 1).map (fun x => a + (b - a) * x) = uniformMeasure a b :=
  TauCeti.Probability.map_uniformMeasure_affine hab

/-- Uniform parameter measurability. -/
theorem measurable_uniformMeasure : Measurable fun p : ℝ × ℝ => uniformMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_uniformMeasure

/-- **Layer 0, item 4.** Parameter measurability of the gamma family. -/
theorem measurable_gammaMeasure : Measurable fun p : ℝ × ℝ => gammaMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_gammaMeasure

/-- Parameter measurability of the Beta family. -/
theorem measurable_betaMeasure : Measurable fun p : ℝ × ℝ => betaMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_betaMeasure

/-- Parameter measurability of the exponential family. -/
theorem measurable_expMeasure : Measurable fun r : ℝ => expMeasure r :=
  TauCeti.Probability.measurable_expMeasure

/-- Parameter measurability of the Cauchy family. -/
theorem measurable_cauchyMeasure : Measurable fun p : ℝ × ℝ≥0 => cauchyMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_cauchyMeasure

/-- Parameter measurability of the Pareto family. -/
theorem measurable_paretoMeasure : Measurable fun p : ℝ × ℝ => paretoMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_paretoMeasure

/-- Parameter measurability of the real Gaussian family (Mathlib). -/
theorem measurable_gaussianReal : Measurable fun p : ℝ × ℝ≥0 => gaussianReal p.1 p.2 :=
  ProbabilityTheory.measurable_gaussianReal

/-- Parameter measurability of the Poisson family, as Layer 4 needs it. -/
theorem measurable_poissonMeasure : Measurable fun r : ℝ≥0 => poissonMeasure r :=
  TauCeti.Probability.measurable_poissonMeasure

/-- Parameter measurability of the geometric family. -/
theorem measurable_geometricMeasure : Measurable fun p : I => geometricMeasure p :=
  TauCeti.Probability.measurable_geometricMeasure

/-- Parameter measurability of the binomial family. -/
theorem measurable_binomial : Measurable fun q : ℕ × I => binomial q.1 q.2 :=
  TauCeti.Probability.measurable_binomial

/-- Parameter measurability of the Bernoulli family. -/
theorem measurable_bernoulliMeasure {α : Type*} [MeasurableSpace α] (x y : α) :
    Measurable fun p : I => bernoulliMeasure x y p :=
  TauCeti.Probability.measurable_bernoulliMeasure x y

/-- **Layer 0 completion check.** A random variable with law `uniformMeasure 0 1` is
`pdf.IsUniform` on `Ioc 0 1`. -/
example (hX : HasLaw X (uniformMeasure 0 1) P) : pdf.IsUniform X (Set.Ioc 0 1) P volume :=
  isUniform_of_hasLaw_uniformMeasure hX

end Layer0

/-! ## Layer 1: complete the elementary theory of existing distributions -/

section Layer1

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-! ### Bernoulli and binomial -/

/-- The Bernoulli mean. -/
theorem integral_id_bernoulliMeasure (p : I) : ∫ x, x ∂Ber((1 : ℝ), 0, p) = (p : ℝ) :=
  TauCeti.Probability.integral_id_bernoulliMeasure p

/-- The Bernoulli variance. -/
theorem variance_id_bernoulliMeasure (p : I) :
    variance id Ber((1 : ℝ), 0, p) = (p : ℝ) * (1 - p) :=
  TauCeti.Probability.variance_id_bernoulliMeasure p

/-- The Bernoulli mgf. -/
theorem mgf_id_bernoulliMeasure (p : I) (t : ℝ) :
    mgf id Ber((1 : ℝ), 0, p) t = 1 - (p : ℝ) + (p : ℝ) * Real.exp t :=
  TauCeti.Probability.mgf_id_bernoulliMeasure p t

/-- The Bernoulli cgf. -/
theorem cgf_id_bernoulliMeasure (p : I) (t : ℝ) :
    cgf id Ber((1 : ℝ), 0, p) t = Real.log (1 - (p : ℝ) + (p : ℝ) * Real.exp t) :=
  TauCeti.Probability.cgf_id_bernoulliMeasure p t

/-- The Bernoulli characteristic function. -/
theorem charFun_bernoulliMeasure (p : I) (t : ℝ) :
    charFun Ber((1 : ℝ), 0, p) t = 1 - (p : ℂ) + (p : ℂ) * Complex.exp (Complex.I * t) :=
  TauCeti.Probability.charFun_bernoulliMeasure p t

/-- The cast binomial mean (Mathlib's `integral_of_hasLaw_binomial`, mathlib4#40613). -/
theorem integral_id_map_cast_binomial (n : ℕ) (p : I) :
    ∫ x, x ∂Bin(ℝ, n, p) = (p : ℝ) * n :=
  ProbabilityTheory.integral_of_hasLaw_binomial (X := id) (HasLaw.id)

/-- The binomial mean, random-variable form (Mathlib). -/
theorem integral_of_hasLaw_binomial {n : ℕ} {p : I} {X : Ω → ℝ} (hX : HasLaw X Bin(ℝ, n, p) P) :
    P[X] = (p : ℝ) * n :=
  ProbabilityTheory.integral_of_hasLaw_binomial hX

/-- The cast binomial variance. -/
theorem variance_id_map_cast_binomial (n : ℕ) (p : I) :
    variance id Bin(ℝ, n, p) = (p : ℝ) * (1 - p) * n :=
  TauCeti.Probability.variance_id_map_cast_binomial n p

/-- The cast binomial mgf. -/
theorem mgf_id_map_cast_binomial (n : ℕ) (p : I) (t : ℝ) :
    mgf id Bin(ℝ, n, p) t = (1 - (p : ℝ) + (p : ℝ) * Real.exp t) ^ n :=
  TauCeti.Probability.mgf_id_map_cast_binomial n p t

/-- The cast binomial cgf. -/
theorem cgf_id_map_cast_binomial (n : ℕ) (p : I) (t : ℝ) :
    cgf id Bin(ℝ, n, p) t = Real.log ((1 - (p : ℝ) + (p : ℝ) * Real.exp t) ^ n) :=
  TauCeti.Probability.cgf_id_map_cast_binomial n p t

/-- The cast binomial characteristic function, for every `t`. -/
theorem charFun_map_cast_binomial (n : ℕ) (p : I) (t : ℝ) :
    charFun Bin(ℝ, n, p) t = (1 - (p : ℂ) + (p : ℂ) * Complex.exp (Complex.I * t)) ^ n :=
  TauCeti.Probability.charFun_map_cast_binomial n p t

/-- Binomial convolution on the native carrier. -/
theorem binomial_conv_binomial (n m : ℕ) (p : I) :
    binomial n p ∗ binomial m p = binomial (n + m) p :=
  TauCeti.Probability.binomial_conv_binomial n m p

/-- A sum of `n` i.i.d. Bernoulli variables is binomial. -/
theorem hasLaw_sum_bernoulli {n : ℕ} {p : I} {X : Fin n → Ω → ℕ} (hindep : iIndepFun X P)
    (hX : ∀ i, HasLaw (X i) Ber((1 : ℕ), 0, p) P) :
    HasLaw (fun ω => ∑ i, X i ω) (binomial n p) P := by
  simpa using TauCeti.Probability.iIndepFun.hasLaw_sum_bernoulli hindep hX

/-- **Layer 1 completion check.** `Var[X; P] = p * (1 - p) * n` from `HasLaw X Bin(ℝ, n, p) P`. -/
example {n : ℕ} {p : I} {X : Ω → ℝ} (hX : HasLaw X Bin(ℝ, n, p) P) :
    Var[X; P] = p * (1 - p) * n :=
  variance_of_hasLaw_binomial hX

/-! ### Geometric -/

/-- At `p = 0` Mathlib's geometric law is the Dirac mass at `0`. -/
theorem geometricMeasure_zero : geometricMeasure (0 : I) = Measure.dirac 0 :=
  TauCeti.Probability.geometricMeasure_zero

/-- At `p = 0` the mean and variance vanish. -/
theorem integral_variance_map_cast_geometricMeasure_zero :
    ∫ x, x ∂((geometricMeasure (0 : I)).map (Nat.cast : ℕ → ℝ)) = 0 ∧
      variance id ((geometricMeasure (0 : I)).map (Nat.cast : ℕ → ℝ)) = 0 :=
  ⟨integral_id_map_cast_geometricMeasure_zero, variance_id_map_cast_geometricMeasure_zero⟩

/-- At `p = 0` the pgf, mgf and characteristic function are identically `1`. -/
theorem transforms_geometricMeasure_zero (t : ℝ) :
    pgf id (geometricMeasure 0) t = 1 ∧
      mgf id ((geometricMeasure (0 : I)).map (Nat.cast : ℕ → ℝ)) t = 1 ∧
      charFun ((geometricMeasure (0 : I)).map (Nat.cast : ℕ → ℝ)) t = 1 :=
  ⟨pgf_geometricMeasure_zero t, mgf_id_map_cast_geometricMeasure_zero t,
    charFun_map_cast_geometricMeasure_zero t⟩

/-- The geometric mean `q / p` (for `p = 0` both sides are `0`). -/
theorem integral_id_map_cast_geometricMeasure (p : I) :
    ∫ x, x ∂((geometricMeasure p).map (Nat.cast : ℕ → ℝ)) = (1 - (p : ℝ)) / (p : ℝ) :=
  TauCeti.Probability.integral_id_map_cast_geometricMeasure

/-- The geometric variance `q / p ^ 2`. -/
theorem variance_id_map_cast_geometricMeasure (p : I) :
    variance id ((geometricMeasure p).map (Nat.cast : ℕ → ℝ)) =
      (1 - (p : ℝ)) / (p : ℝ) ^ 2 :=
  TauCeti.Probability.variance_id_map_cast_geometricMeasure

/-- The geometric mgf integrand is integrable exactly when `q * exp t < 1`. -/
theorem integrable_exp_mul_id_map_cast_geometricMeasure_iff {p : I} (hp : p ≠ 0) (t : ℝ) :
    Integrable (fun x : ℝ => Real.exp (t * x)) ((geometricMeasure p).map (Nat.cast : ℕ → ℝ)) ↔
      (1 - (p : ℝ)) * Real.exp t < 1 :=
  TauCeti.Probability.integrable_exp_mul_id_map_cast_geometricMeasure_iff hp t

/-- The geometric mgf on its domain. -/
theorem mgf_id_map_cast_geometricMeasure {p : I} (hp : p ≠ 0) {t : ℝ}
    (ht : (1 - (p : ℝ)) * Real.exp t < 1) :
    mgf id ((geometricMeasure p).map (Nat.cast : ℕ → ℝ)) t =
      (p : ℝ) / (1 - (1 - (p : ℝ)) * Real.exp t) :=
  TauCeti.Probability.mgf_id_map_cast_geometricMeasure hp ht

/-- The geometric cgf on the same domain. -/
theorem cgf_id_map_cast_geometricMeasure {p : I} (hp : p ≠ 0) {t : ℝ}
    (ht : (1 - (p : ℝ)) * Real.exp t < 1) :
    cgf id ((geometricMeasure p).map (Nat.cast : ℕ → ℝ)) t =
      Real.log ((p : ℝ) / (1 - (1 - (p : ℝ)) * Real.exp t)) :=
  TauCeti.Probability.cgf_id_map_cast_geometricMeasure hp ht

/-- The geometric characteristic function, for every `t`. -/
theorem charFun_map_cast_geometricMeasure {p : I} (hp : p ≠ 0) (t : ℝ) :
    charFun ((geometricMeasure p).map (Nat.cast : ℕ → ℝ)) t =
      (p : ℂ) / (1 - (1 - (p : ℂ)) * Complex.exp (Complex.I * t)) :=
  TauCeti.Probability.charFun_map_cast_geometricMeasure hp t

/-- The geometric cumulative mass for `p ≠ 0`. -/
theorem geometricMeasure_real_Iic {p : I} (hp : p ≠ 0) (n : ℕ) :
    (geometricMeasure p).real {k | k ≤ n} = 1 - (1 - (p : ℝ)) ^ (n + 1) :=
  TauCeti.Probability.geometricMeasure_real_Iic hp n

/-- The Dirac cumulative mass at `p = 0`. -/
theorem geometricMeasure_real_Iic_zero (n : ℕ) :
    (geometricMeasure (0 : I)).real {k | k ≤ n} = 1 :=
  TauCeti.Probability.geometricMeasure_real_Iic_zero n

/-- Geometric memorylessness for every `p`, in the division-free form. -/
theorem geometricMeasure_memoryless (p : I) (n m : ℕ) :
    geometricMeasure p {k | n + m ≤ k} * geometricMeasure p Set.univ =
      geometricMeasure p {k | n ≤ k} * geometricMeasure p {k | m ≤ k} := by
  have h := TauCeti.Probability.geometricMeasure_memoryless p n m
  simp only [measureReal_def] at h
  rw [measure_univ, mul_one, ← ENNReal.toReal_eq_toReal_iff' (measure_ne_top _ _)
    (ENNReal.mul_ne_top (measure_ne_top _ _) (measure_ne_top _ _)), ENNReal.toReal_mul, h]

/-- Geometric memorylessness via `cond`, when the conditioning event has nonzero measure. -/
theorem geometricMeasure_cond_Ici (p : I) (n m : ℕ) (hn : geometricMeasure p {k | n ≤ k} ≠ 0) :
    (ProbabilityTheory.cond (geometricMeasure p) {k | n ≤ k}).real {k | n + m ≤ k} =
      (geometricMeasure p).real {k | m ≤ k} :=
  TauCeti.Probability.geometricMeasure_cond_Ici p n m hn

/-! ### Poisson -/

/-- The cast Poisson mean. -/
theorem integral_id_map_cast_poissonMeasure (r : ℝ≥0) : ∫ x, x ∂Po(ℝ, r) = (r : ℝ) :=
  TauCeti.Probability.integral_id_map_cast_poissonMeasure r

/-- The cast Poisson variance. -/
theorem variance_id_map_cast_poissonMeasure (r : ℝ≥0) : variance id Po(ℝ, r) = (r : ℝ) :=
  TauCeti.Probability.variance_id_map_cast_poissonMeasure r

/-- The cast Poisson law has exponential moments of every order. -/
theorem integrableExpSet_id_map_cast_poissonMeasure (r : ℝ≥0) :
    integrableExpSet id Po(ℝ, r) = Set.univ :=
  TauCeti.Probability.integrableExpSet_id_map_cast_poissonMeasure r

/-- The cast Poisson mgf, for every `t`. -/
theorem mgf_id_map_cast_poissonMeasure (r : ℝ≥0) (t : ℝ) :
    mgf id Po(ℝ, r) t = Real.exp ((r : ℝ) * (Real.exp t - 1)) :=
  congrFun (TauCeti.Probability.mgf_id_map_cast_poissonMeasure r) t

/-- The cast Poisson cgf, for every `t`. -/
theorem cgf_id_map_cast_poissonMeasure (r : ℝ≥0) (t : ℝ) :
    cgf id Po(ℝ, r) t = (r : ℝ) * (Real.exp t - 1) :=
  congrFun (TauCeti.Probability.cgf_id_map_cast_poissonMeasure r) t

/-! ### Exponential -/

/-- The exponential mean. -/
theorem integral_id_expMeasure {r : ℝ} (hr : 0 < r) : ∫ x, x ∂expMeasure r = r⁻¹ :=
  TauCeti.Probability.integral_id_expMeasure hr

/-- The exponential variance `r⁻²`. -/
theorem variance_id_expMeasure {r : ℝ} (hr : 0 < r) : variance id (expMeasure r) = r⁻¹ ^ 2 := by
  rw [TauCeti.Probability.variance_id_expMeasure hr, inv_pow]

/-- The exponential mgf domain. -/
theorem integrableExpSet_id_expMeasure {r : ℝ} (hr : 0 < r) :
    integrableExpSet id (expMeasure r) = Set.Iio r :=
  TauCeti.Probability.integrableExpSet_id_expMeasure hr

/-- The exponential mgf, shaped as in mathlib4#35504. -/
theorem mgf_id_expMeasure {r t : ℝ} (hr : 0 < r) (ht : t < r) :
    mgf id (expMeasure r) t = r / (r - t) :=
  TauCeti.Probability.mgf_id_expMeasure hr ht

/-- The exponential cgf on the mgf domain. -/
theorem cgf_id_expMeasure {r t : ℝ} (hr : 0 < r) (ht : t < r) :
    cgf id (expMeasure r) t = Real.log (r / (r - t)) :=
  TauCeti.Probability.cgf_id_expMeasure hr ht

/-- The exponential characteristic function. -/
theorem charFun_expMeasure {r : ℝ} (hr : 0 < r) (t : ℝ) :
    charFun (expMeasure r) t = (r : ℂ) / (r - Complex.I * t) :=
  TauCeti.Probability.charFun_expMeasure hr t

/-- **Layer 1 completion check.** Exponential memorylessness via `cond`. -/
theorem memoryless_expMeasure {r s t : ℝ} (hr : 0 < r) (hs : 0 ≤ s) (ht : 0 ≤ t) :
    ProbabilityTheory.cond (expMeasure r) (Set.Ioi s) (Set.Ioi (s + t)) =
      expMeasure r (Set.Ioi t) :=
  TauCeti.Probability.memoryless_expMeasure hr hs ht

/-- The minimum of independent exponentials is exponential with the summed rate. -/
theorem hasLaw_min_expMeasure {r s : ℝ} (hr : 0 < r) (hs : 0 < s) {X Y : Ω → ℝ}
    (hXY : IndepFun X Y P) (hX : HasLaw X (expMeasure r) P) (hY : HasLaw Y (expMeasure s) P) :
    HasLaw (fun ω => min (X ω) (Y ω)) (expMeasure (r + s)) P :=
  hasLaw_min_expMeasure_of_indepFun hr hs hXY hX hY

/-- The measure-level form of the minimum law. -/
theorem map_min_expMeasure {r s : ℝ} (hr : 0 < r) (hs : 0 < s) :
    ((expMeasure r).prod (expMeasure s)).map (fun z => min z.1 z.2) = expMeasure (r + s) :=
  TauCeti.Probability.map_min_expMeasure hr hs

/-! ### Gamma -/

/-- The gamma mean. -/
theorem integral_id_gammaMeasure {a r : ℝ} (ha : 0 < a) (hr : 0 < r) :
    ∫ x, x ∂gammaMeasure a r = a / r :=
  TauCeti.Probability.integral_id_gammaMeasure ha hr

/-- The gamma variance. -/
theorem variance_id_gammaMeasure {a r : ℝ} (ha : 0 < a) (hr : 0 < r) :
    variance id (gammaMeasure a r) = a / r ^ 2 :=
  TauCeti.Probability.variance_id_gammaMeasure ha hr

/-- The gamma mgf domain. -/
theorem integrableExpSet_id_gammaMeasure {a r : ℝ} (ha : 0 < a) (hr : 0 < r) :
    integrableExpSet id (gammaMeasure a r) = Set.Iio r :=
  TauCeti.Probability.integrableExpSet_id_gammaMeasure ha hr

/-- The gamma mgf. -/
theorem mgf_id_gammaMeasure {a r t : ℝ} (ha : 0 < a) (hr : 0 < r) (ht : t < r) :
    mgf id (gammaMeasure a r) t = (1 - t / r) ^ (-a) :=
  TauCeti.Probability.mgf_id_gammaMeasure ha hr ht

/-- The gamma cgf, the real logarithm of the mgf. -/
theorem cgf_id_gammaMeasure {a r t : ℝ} (ha : 0 < a) (hr : 0 < r) (ht : t < r) :
    cgf id (gammaMeasure a r) t = Real.log ((1 - t / r) ^ (-a)) := by
  rw [TauCeti.Probability.cgf_id_gammaMeasure ha hr ht, Real.log_rpow]
  rw [sub_pos, div_lt_one hr]
  exact ht

/-- The gamma characteristic function, with principal `cpow`. -/
theorem charFun_gammaMeasure {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (t : ℝ) :
    charFun (gammaMeasure a r) t = (1 - Complex.I * t / r) ^ (-(a : ℂ)) :=
  TauCeti.Probability.charFun_gammaMeasure ha hr t

/-- Gamma convolution adds shapes. -/
theorem gammaMeasure_conv_gammaMeasure {a b r : ℝ} (ha : 0 < a) (hb : 0 < b) (hr : 0 < r) :
    gammaMeasure a r ∗ gammaMeasure b r = gammaMeasure (a + b) r :=
  TauCeti.Probability.gammaMeasure_conv_gammaMeasure ha hb hr

/-- Gamma scaling. -/
theorem gammaMeasure_map_const_mul {a r c : ℝ} (ha : 0 < a) (hr : 0 < r) (hc : 0 < c) :
    (gammaMeasure a r).map (c * ·) = gammaMeasure a (r / c) :=
  TauCeti.Probability.gammaMeasure_map_const_mul ha hr hc

/-! ### Beta -/

/-- The Beta mean. -/
theorem integral_id_betaMeasure {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∫ x, x ∂betaMeasure a b = a / (a + b) :=
  TauCeti.Probability.integral_id_betaMeasure ha hb

/-- The Beta variance. -/
theorem variance_id_betaMeasure {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    variance id (betaMeasure a b) = a * b / ((a + b) ^ 2 * (a + b + 1)) :=
  TauCeti.Probability.variance_id_betaMeasure ha hb

/-- The Beta raw moments. -/
theorem integral_pow_betaMeasure {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (n : ℕ) :
    ∫ x, x ^ n ∂betaMeasure a b =
      Real.Gamma (a + n) * Real.Gamma (a + b) / (Real.Gamma a * Real.Gamma (a + b + n)) :=
  TauCeti.Probability.integral_pow_betaMeasure ha hb n

/-- Bounded support gives exponential moments of every order. -/
theorem integrableExpSet_id_betaMeasure {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    integrableExpSet id (betaMeasure a b) = Set.univ :=
  TauCeti.Probability.integrableExpSet_id_betaMeasure ha hb

/-! ### Cauchy -/

/-- The Cauchy characteristic function, for every scale including `γ = 0`. -/
theorem charFun_cauchyMeasure (x₀ : ℝ) (γ : ℝ≥0) (t : ℝ) :
    charFun (cauchyMeasure x₀ γ) t =
      Complex.exp (Complex.I * x₀ * t - ((γ : ℝ) : ℂ) * ((|t| : ℝ) : ℂ)) := by
  rw [TauCeti.Probability.charFun_cauchyMeasure]
  ring_nf

/-- The Cauchy cdf for `γ ≠ 0`. -/
theorem cdf_cauchyMeasure {x₀ : ℝ} {γ : ℝ≥0} (hγ : γ ≠ 0) (x : ℝ) :
    cdf (cauchyMeasure x₀ γ) x = 1 / 2 + Real.arctan ((x - x₀) / γ) / Real.pi :=
  cdf_cauchyMeasure_of_scale_ne_zero x₀ hγ x

/-- For `γ ≠ 0`, only `t = 0` has an integrable mgf integrand. -/
theorem integrableExpSet_id_cauchyMeasure {x₀ : ℝ} {γ : ℝ≥0} (hγ : γ ≠ 0) :
    integrableExpSet id (cauchyMeasure x₀ γ) = {0} :=
  TauCeti.Probability.integrableExpSet_id_cauchyMeasure x₀ hγ

/-- For `γ ≠ 0`, the identity is not integrable. -/
theorem not_integrable_id_cauchyMeasure {x₀ : ℝ} {γ : ℝ≥0} (hγ : γ ≠ 0) :
    ¬ Integrable id (cauchyMeasure x₀ γ) :=
  TauCeti.Probability.not_integrable_id_cauchyMeasure x₀ hγ

/-- For `γ ≠ 0` and `t ≠ 0`, the mgf integrand is not integrable. -/
theorem not_integrable_exp_mul_id_cauchyMeasure {x₀ : ℝ} {γ : ℝ≥0} (hγ : γ ≠ 0) {t : ℝ}
    (ht : t ≠ 0) : ¬ Integrable (fun x : ℝ => Real.exp (t * x)) (cauchyMeasure x₀ γ) :=
  TauCeti.Probability.not_integrable_exp_mul_id_cauchyMeasure x₀ hγ ht

/-- The Dirac formulas at `γ = 0`: cdf, mean, variance, mgf domain, mgf and cgf. -/
theorem cauchyMeasure_zero_scale_formulas (x₀ t x : ℝ) :
    cauchyMeasure x₀ 0 = Measure.dirac x₀ ∧
      cdf (cauchyMeasure x₀ 0) x = (if x₀ ≤ x then 1 else 0) ∧
      ∫ y, y ∂cauchyMeasure x₀ 0 = x₀ ∧ variance id (cauchyMeasure x₀ 0) = 0 ∧
      integrableExpSet id (cauchyMeasure x₀ 0) = Set.univ ∧
      mgf id (cauchyMeasure x₀ 0) t = Real.exp (t * x₀) ∧
      cgf id (cauchyMeasure x₀ 0) t = t * x₀ :=
  ⟨cauchyMeasure_zero_scale x₀, cdf_cauchyMeasure_zero_scale x₀ x,
    integral_id_cauchyMeasure_zero_scale x₀, variance_id_cauchyMeasure_zero_scale x₀,
    integrableExpSet_id_cauchyMeasure_zero_scale x₀, mgf_id_cauchyMeasure_zero_scale x₀ t,
    cgf_id_cauchyMeasure_zero_scale x₀ t⟩

/-- The sample mean of `n > 0` i.i.d. Cauchy variables is again Cauchy. -/
theorem hasLaw_average_of_iIndepFun_cauchyMeasure [IsProbabilityMeasure P] {n : ℕ} (hn : 0 < n)
    {x₀ : ℝ} {γ : ℝ≥0} {X : Fin n → Ω → ℝ} (hindep : iIndepFun X P)
    (hlaw : ∀ i, HasLaw (X i) (cauchyMeasure x₀ γ) P) :
    HasLaw (fun ω => (n : ℝ)⁻¹ * ∑ i, X i ω) (cauchyMeasure x₀ γ) P :=
  TauCeti.Probability.hasLaw_average_of_iIndepFun_cauchyMeasure hn hindep hlaw

/-! ### Pareto -/

/-- The Pareto mean when `1 < r`. -/
theorem integral_id_paretoMeasure {t r : ℝ} (ht : 0 < t) (hr : 1 < r) :
    ∫ x, x ∂paretoMeasure t r = r * t / (r - 1) :=
  TauCeti.Probability.integral_id_paretoMeasure ht hr

/-- The identity is not Pareto-integrable when `r ≤ 1`. -/
theorem not_integrable_id_paretoMeasure {t r : ℝ} (ht : 0 < t) (hr : 0 < r) (h : r ≤ 1) :
    ¬ Integrable id (paretoMeasure t r) :=
  TauCeti.Probability.not_integrable_id_paretoMeasure ht hr h

/-- The Pareto variance when `2 < r`. -/
theorem variance_id_paretoMeasure {t r : ℝ} (ht : 0 < t) (hr : 2 < r) :
    variance id (paretoMeasure t r) = r * t ^ 2 / ((r - 1) ^ 2 * (r - 2)) :=
  TauCeti.Probability.variance_id_paretoMeasure ht hr

/-- The square is not Pareto-integrable when `r ≤ 2`. -/
theorem not_integrable_sq_paretoMeasure {t r : ℝ} (ht : 0 < t) (hr : 0 < r) (h : r ≤ 2) :
    ¬ Integrable (fun x : ℝ => x ^ 2) (paretoMeasure t r) :=
  TauCeti.Probability.not_integrable_sq_paretoMeasure ht hr h

/-- The Pareto cdf. -/
theorem cdf_paretoMeasure_eq {t r : ℝ} (ht : 0 < t) (hr : 0 < r) (x : ℝ) :
    cdf (paretoMeasure t r) x = if x < t then 0 else 1 - Real.rpow (t / x) r :=
  TauCeti.Probability.cdf_paretoMeasure_eq ht hr x

/-- The Pareto mgf integrand is integrable exactly for `u ≤ 0`. -/
theorem integrable_exp_mul_id_paretoMeasure_iff {t r : ℝ} (ht : 0 < t) (hr : 0 < r) (u : ℝ) :
    Integrable (fun x : ℝ => Real.exp (u * x)) (paretoMeasure t r) ↔ u ≤ 0 :=
  TauCeti.Probability.integrable_exp_mul_id_paretoMeasure_iff ht hr u

/-- The Pareto mgf domain. -/
theorem integrableExpSet_id_paretoMeasure {t r : ℝ} (ht : 0 < t) (hr : 0 < r) :
    integrableExpSet id (paretoMeasure t r) = Set.Iic 0 :=
  TauCeti.Probability.integrableExpSet_id_paretoMeasure ht hr

/-! ### Real Gaussian -/

/-- Even central moments of the real Gaussian. -/
theorem centralMoment_two_mul_gaussianReal (m : ℝ) (v : ℝ≥0) (n : ℕ) :
    centralMoment id (2 * n) (gaussianReal m v) = (v : ℝ) ^ n * (2 * n - 1 : ℕ)‼ :=
  centralMoment_id_two_mul_gaussianReal m v n

/-- Odd central moments of the real Gaussian vanish. -/
theorem centralMoment_two_mul_add_one_gaussianReal (m : ℝ) (v : ℝ≥0) (n : ℕ) :
    centralMoment id (2 * n + 1) (gaussianReal m v) = 0 :=
  centralMoment_id_two_mul_add_one_gaussianReal m v n

/-- Absolute central moments of the real Gaussian. -/
theorem integral_abs_sub_pow_gaussianReal (m : ℝ) (v : ℝ≥0) (n : ℕ) :
    ∫ x, |x - m| ^ n ∂gaussianReal m v =
      Real.rpow (2 * v) ((n : ℝ) / 2) * Real.Gamma ((n + 1) / 2) / Real.sqrt Real.pi :=
  TauCeti.Probability.integral_abs_sub_pow_gaussianReal m v n

/-! ### Probability generating functions -/

/-- The pgf, by its defining integral. -/
theorem pgf_def (X : Ω → ℕ) (μ : Measure Ω) (t : ℝ) : pgf X μ t = ∫ ω, t ^ X ω ∂μ :=
  TauCeti.Probability.pgf_def X μ t

/-- The pgf-mgf bridge. -/
theorem pgf_exp (X : Ω → ℕ) (μ : Measure Ω) (t : ℝ) :
    pgf X μ (Real.exp t) = mgf (fun ω => (X ω : ℝ)) μ t :=
  TauCeti.Probability.pgf_exp X μ t

/-- **Layer 1 completion check.** On `[-1, 1]`, the pgf of an independent sum is the product.
The factors are assumed almost everywhere measurable, per the README erratum; no integrability
hypothesis is needed. -/
theorem pgf_add_of_abs_le_one [IsProbabilityMeasure P] {X Y : Ω → ℕ} (hXY : IndepFun X Y P)
    (hX : AEMeasurable X P) (hY : AEMeasurable Y P) {t : ℝ} (ht : |t| ≤ 1) :
    pgf (X + Y) P t = pgf X P t * pgf Y P t :=
  IndepFun.pgf_add_of_abs_le_one hXY hX hY ht

/-- For arbitrary `t`, the same holds when both factor integrands are integrable. -/
theorem pgf_add {X Y : Ω → ℕ} (hXY : IndepFun X Y P) (t : ℝ)
    (hXt : Integrable (fun ω => t ^ X ω) P) (hYt : Integrable (fun ω => t ^ Y ω) P) :
    pgf (X + Y) P t = pgf X P t * pgf Y P t :=
  IndepFun.pgf_add hXY t hXt hYt

/-- The Bernoulli pgf. -/
theorem pgf_bernoulliMeasure (p : I) (t : ℝ) :
    pgf id (bernoulliMeasure (1 : ℕ) 0 p) t = 1 - (p : ℝ) + (p : ℝ) * t :=
  TauCeti.Probability.pgf_bernoulliMeasure p t

/-- The binomial pgf. -/
theorem pgf_binomial (n : ℕ) (p : I) (t : ℝ) :
    pgf id (binomial n p) t = (1 - (p : ℝ) + (p : ℝ) * t) ^ n :=
  TauCeti.Probability.pgf_binomial n p t

/-- The Poisson pgf. -/
theorem pgf_poissonMeasure (r : ℝ≥0) (t : ℝ) :
    pgf id (poissonMeasure r) t = Real.exp ((r : ℝ) * (t - 1)) :=
  TauCeti.Probability.pgf_poissonMeasure r t

/-- The geometric pgf integrand is integrable exactly when `|(1 - p) * t| < 1`. -/
theorem integrable_pow_geometricMeasure_iff {p : I} (hp : p ≠ 0) (t : ℝ) :
    Integrable (fun n : ℕ => t ^ n) (geometricMeasure p) ↔ |(1 - (p : ℝ)) * t| < 1 :=
  TauCeti.Probability.integrable_pow_geometricMeasure_iff hp t

/-- The geometric pgf on that domain. -/
theorem pgf_geometricMeasure {p : I} (hp : p ≠ 0) {t : ℝ} (ht : |(1 - (p : ℝ)) * t| < 1) :
    pgf id (geometricMeasure p) t = (p : ℝ) / (1 - (1 - (p : ℝ)) * t) :=
  TauCeti.Probability.pgf_geometricMeasure hp ht

/-- Coefficient recovery at the origin. -/
theorem iteratedDeriv_pgf_zero (μ : Measure ℕ) [IsProbabilityMeasure μ] (n : ℕ) :
    iteratedDeriv n (pgf id μ) 0 = (n.factorial : ℝ) * μ.real {n} :=
  TauCeti.Probability.iteratedDeriv_pgf_zero μ n

/-- **Layer 1 completion check.** Equality of pgfs on `(-1, 1)` determines the law on `ℕ`. -/
theorem measure_eq_of_pgf_eqOn {μ ν : Measure ℕ} [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (h : Set.EqOn (pgf id μ) (pgf id ν) (Set.Ioo (-1) 1)) : μ = ν :=
  TauCeti.Probability.measure_eq_of_pgf_eqOn h

end Layer1

end Layers01

noncomputable section Layers23

open MeasureTheory ProbabilityTheory Filter Set Topology
open TauCeti TauCeti.Probability
open scoped ENNReal NNReal unitInterval

/-! ## Layer 2: incomplete special functions and closed-form cdfs -/

section Layer2

/-! ### Lower incomplete gamma -/

/-- `lowerIncompleteGamma s x` is the truncated Euler integral up to `max x 0` for `0 < s`. -/
theorem lowerIncompleteGamma_def (s x : ℝ) :
    lowerIncompleteGamma s x =
      if 0 < s then ∫ t in (0 : ℝ)..max x 0, t ^ (s - 1) * Real.exp (-t) else 0 := by
  by_cases hs : 0 < s
  · simp only [hs, ↓reduceIte]
    rcases le_total x 0 with hx | hx
    · rw [lowerIncompleteGamma_eq_zero_of_nonpos_right s hx, max_eq_right hx,
        intervalIntegral.integral_same]
    · rw [lowerIncompleteGamma_eq_integral hs hx, max_eq_left hx]
  · simp only [hs, ↓reduceIte]
    rw [lowerIncompleteGamma_eq_zero_of_nonpos_left (not_lt.1 hs)]

/-- `regularizedGamma s x` is `γ(s, x) / Γ(s)` for `0 < s` and `0` otherwise. -/
theorem regularizedGamma_def (s x : ℝ) :
    regularizedGamma s x = if 0 < s then lowerIncompleteGamma s x / Real.Gamma s else 0 := by
  by_cases hs : 0 < s
  · simp only [hs, ↓reduceIte]
    rw [regularizedGamma_eq_div]
  · simp only [hs, ↓reduceIte]
    rw [regularizedGamma_eq_zero_of_nonpos_left (not_lt.1 hs)]

/-- Convergence: the integrand of `γ(s, ·)` is interval integrable for `0 < s`. -/
theorem intervalIntegrable_lowerIncompleteGamma_integrand {s : ℝ} (hs : 0 < s) (a b : ℝ) :
    IntervalIntegrable (fun t : ℝ => t ^ (s - 1) * Real.exp (-t)) volume a b :=
  intervalIntegrable_rpow_mul_exp_neg (by linarith) a b

/-- Continuity of `γ(s, ·)`. -/
theorem continuous_lowerIncompleteGamma' (s : ℝ) : Continuous (lowerIncompleteGamma s) :=
  continuous_lowerIncompleteGamma s

/-- Monotonicity of `γ(s, ·)`. -/
theorem monotone_lowerIncompleteGamma (s : ℝ) : Monotone (lowerIncompleteGamma s) :=
  lowerIncompleteGamma_monotone s

/-- Continuity of `P(s, ·)`. -/
theorem continuous_regularizedGamma' (s : ℝ) : Continuous (regularizedGamma s) :=
  continuous_regularizedGamma s

/-- Monotonicity of `P(s, ·)`. -/
theorem monotone_regularizedGamma (s : ℝ) : Monotone (regularizedGamma s) :=
  regularizedGamma_monotone s

/-- The recurrence `γ(s+1, x) = s γ(s, x) - x^s e^{-x}` for `0 < s` and `0 ≤ x`. -/
theorem lowerIncompleteGamma_add_one' {s x : ℝ} (hs : 0 < s) (hx : 0 ≤ x) :
    lowerIncompleteGamma (s + 1) x = s * lowerIncompleteGamma s x - x ^ s * Real.exp (-x) :=
  lowerIncompleteGamma_add_one hs hx

/-- `P(s, x) → 1` as `x → ∞`. -/
theorem tendsto_regularizedGamma_atTop' {s : ℝ} (hs : 0 < s) :
    Tendsto (regularizedGamma s) atTop (𝓝 1) :=
  tendsto_regularizedGamma_atTop hs

/-- The derivative of `γ(s, ·)` at `0 < x`. -/
theorem hasDerivAt_lowerIncompleteGamma' {s x : ℝ} (hs : 0 < s) (hx : 0 < x) :
    HasDerivAt (lowerIncompleteGamma s) (x ^ (s - 1) * Real.exp (-x)) x :=
  hasDerivAt_lowerIncompleteGamma hs hx

/-! ### Regularized incomplete beta -/

/-- The definition, including the `a = 0` convention and the zero default. -/
theorem regularizedIncompleteBeta_def_of_pos' {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (x : ℝ) :
    regularizedIncompleteBeta a b x =
      (∫ t in (0 : ℝ)..min 1 (max x 0), t ^ (a - 1) * (1 - t) ^ (b - 1)) /
        ProbabilityTheory.beta a b :=
  regularizedIncompleteBeta_def_of_pos ha hb x

/-- The deliberate exception `I_x(0, b) = 1` for `0 < b` and `0 ≤ x`. -/
theorem regularizedIncompleteBeta_zero_left' {b x : ℝ} (hb : 0 < b) (hx : 0 ≤ x) :
    regularizedIncompleteBeta 0 b x = 1 :=
  regularizedIncompleteBeta_zero_left hb hx

/-- Zero for a negative first parameter. -/
theorem regularizedIncompleteBeta_of_neg_left {a : ℝ} (ha : a < 0) (b x : ℝ) :
    regularizedIncompleteBeta a b x = 0 :=
  regularizedIncompleteBeta_eq_zero_of_neg_left ha b x

/-- Zero for a nonpositive second parameter, including `b = 0`. -/
theorem regularizedIncompleteBeta_of_nonpos_right {b : ℝ} (hb : b ≤ 0) (a x : ℝ) :
    regularizedIncompleteBeta a b x = 0 :=
  regularizedIncompleteBeta_eq_zero_of_nonpos_right hb a x

/-- For positive parameters the function vanishes on `x ≤ 0`. -/
theorem regularizedIncompleteBeta_of_nonpos {a b x : ℝ} (ha : 0 < a) (hx : x ≤ 0) :
    regularizedIncompleteBeta a b x = 0 :=
  regularizedIncompleteBeta_eq_zero_of_nonpos ha.ne' b hx

/-- For positive parameters the function is `1` on `1 ≤ x`. -/
theorem regularizedIncompleteBeta_of_one_le {a b x : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hx : 1 ≤ x) : regularizedIncompleteBeta a b x = 1 :=
  regularizedIncompleteBeta_eq_one_of_one_le ha.le hb hx

/-- Continuity on `ℝ` for positive parameters. -/
theorem continuous_regularizedIncompleteBeta' {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    Continuous (regularizedIncompleteBeta a b) :=
  continuous_regularizedIncompleteBeta ha hb

/-- Monotonicity on `ℝ`. -/
theorem monotone_regularizedIncompleteBeta (a b : ℝ) :
    Monotone (regularizedIncompleteBeta a b) :=
  regularizedIncompleteBeta_monotone a b

/-- Differentiability on `0 < x < 1`. -/
theorem hasDerivAt_regularizedIncompleteBeta' {a b x : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hx0 : 0 < x) (hx1 : x < 1) :
    HasDerivAt (regularizedIncompleteBeta a b)
      (x ^ (a - 1) * (1 - x) ^ (b - 1) / ProbabilityTheory.beta a b) x :=
  hasDerivAt_regularizedIncompleteBeta ha hb hx0 hx1

/-- The reflection formula `I_x(a,b) = 1 - I_{1-x}(b,a)`, here for every `x`. -/
theorem regularizedIncompleteBeta_reflection {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (x : ℝ) :
    regularizedIncompleteBeta a b x = 1 - regularizedIncompleteBeta b a (1 - x) :=
  regularizedIncompleteBeta_symm ha hb x

/-- The unit-step recurrence DLMF 8.17.20. -/
theorem regularizedIncompleteBeta_add_one_left' {a b x : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hx₀ : 0 ≤ x) (hx₁ : x ≤ 1) :
    regularizedIncompleteBeta (a + 1) b x = regularizedIncompleteBeta a b x -
      Real.rpow x a * Real.rpow (1 - x) b / (a * ProbabilityTheory.beta a b) :=
  regularizedIncompleteBeta_add_one_left ha hb hx₀ hx₁

/-! ### Error function -/

/-- `erf x = (2 / √π) ∫₀ˣ exp (-t²)`. -/
theorem erf_def (x : ℝ) :
    TauCeti.Real.erf x = 2 / √Real.pi * ∫ t in (0 : ℝ)..x, Real.exp (-t ^ 2) :=
  TauCeti.Real.erf_def x

/-- `erfc x = 1 - erf x`. -/
theorem erfc_def (x : ℝ) : TauCeti.Real.erfc x = 1 - TauCeti.Real.erf x :=
  TauCeti.Real.erfc_def x

/-- Oddness. -/
theorem erf_neg (x : ℝ) : TauCeti.Real.erf (-x) = -TauCeti.Real.erf x :=
  TauCeti.Real.erf_neg x

/-- Monotonicity. -/
theorem strictMono_erf : StrictMono TauCeti.Real.erf :=
  TauCeti.Real.strictMono_erf

/-- The limit at `+∞`. -/
theorem tendsto_erf_atTop : Tendsto TauCeti.Real.erf atTop (𝓝 1) :=
  TauCeti.Real.tendsto_erf_atTop

/-- The limit at `-∞`. -/
theorem tendsto_erf_atBot : Tendsto TauCeti.Real.erf atBot (𝓝 (-1)) :=
  TauCeti.Real.tendsto_erf_atBot

/-- The derivative. -/
theorem hasDerivAt_erf (x : ℝ) :
    HasDerivAt TauCeti.Real.erf (2 / √Real.pi * Real.exp (-x ^ 2)) x :=
  TauCeti.Real.hasDerivAt_erf x

/-- `erf x = P(1/2, x²)` for `0 ≤ x`. -/
theorem erf_eq_regularizedGamma {x : ℝ} (hx : 0 ≤ x) :
    TauCeti.Real.erf x = regularizedGamma (1 / 2) (x ^ 2) :=
  TauCeti.Real.erf_eq_regularizedGamma_half_sq hx

/-! ### Closed-form cdfs and tails -/

/-- The Gaussian cdf through `erf`, for `v ≠ 0`. -/
theorem cdf_gaussianReal_eq {m : ℝ} {v : ℝ≥0} (hv : v ≠ 0) (x : ℝ) :
    cdf (gaussianReal m v) x = (1 + TauCeti.Real.erf ((x - m) / √(2 * (v : ℝ)))) / 2 :=
  TauCeti.Probability.cdf_gaussianReal_eq m hv x

/-- The singular Gaussian cdf. -/
theorem cdf_gaussianReal_zero (m x : ℝ) :
    cdf (gaussianReal m 0) x = if m ≤ x then 1 else 0 :=
  TauCeti.Probability.cdf_gaussianReal_zero m x

/-- The gamma cdf. -/
theorem cdf_gammaMeasure_eq {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (x : ℝ) :
    cdf (gammaMeasure a r) x = regularizedGamma a (r * x) :=
  TauCeti.Probability.cdf_gammaMeasure_eq ha hr x

/-- The beta cdf. -/
theorem cdf_betaMeasure_eq {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (x : ℝ) :
    cdf (betaMeasure a b) x = regularizedIncompleteBeta a b x :=
  TauCeti.Probability.cdf_betaMeasure_eq ha hb x

/-- The binomial tail. -/
theorem binomial_tail_eq_regularizedIncompleteBeta {m n : ℕ} (hmn : m ≤ n) (p : I) :
    (binomial n p).real {k | m ≤ k} =
      regularizedIncompleteBeta m ((n : ℝ) - m + 1) (p : ℝ) :=
  TauCeti.Probability.binomial_tail_eq_regularizedIncompleteBeta hmn p

/-- The Poisson tail. -/
theorem poissonMeasure_tail_eq_regularizedGamma (r : ℝ≥0) (n : ℕ) :
    (poissonMeasure r).real {k | n < k} = regularizedGamma (n + 1) (r : ℝ) :=
  TauCeti.Probability.poissonMeasure_tail_eq_regularizedGamma r n

/-! ### Completion checks -/

/-- `P(1, x) = 1 - e^{-x}`, recovering Mathlib's exponential cdf. -/
example {x : ℝ} (hx : 0 ≤ x) : regularizedGamma 1 x = 1 - Real.exp (-x) :=
  regularizedGamma_one hx

/-- ... and indeed agreeing with `cdf (expMeasure 1)`. -/
example {x : ℝ} (hx : 0 ≤ x) : regularizedGamma 1 x = cdf (expMeasure 1) x := by
  rw [regularizedGamma_one hx, cdf_expMeasure_eq one_pos]
  simp [hx]

/-- `erf 0 = 0`. -/
example : TauCeti.Real.erf 0 = 0 := TauCeti.Real.erf_zero

/-- At `m = 0` both sides of the binomial tail identity are `1`, for every `p`, including
`p = 0`. -/
example (n : ℕ) (p : I) :
    (binomial n p).real {k | 0 ≤ k} = 1 ∧
      regularizedIncompleteBeta ((0 : ℕ) : ℝ) ((n : ℝ) - ((0 : ℕ) : ℝ) + 1) (p : ℝ) = 1 := by
  refine ⟨?_, ?_⟩
  · simp
  · rw [Nat.cast_zero]
    exact regularizedIncompleteBeta_zero_left (by linarith [(Nat.cast_nonneg n : (0 : ℝ) ≤ n)])
      p.2.1

end Layer2

/-! ## Layer 3: new scalar families -/

section Layer3

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} {X : Ω → ℝ}

/-! ### Laplace -/

/-- The Laplace density for `0 < b`. -/
theorem laplacePDFReal_of_pos {b : ℝ} (hb : 0 < b) (μ x : ℝ) :
    laplacePDFReal μ b x = (2 * b)⁻¹ * Real.exp (-|x - μ| / b) :=
  TauCeti.Probability.laplacePDFReal_of_pos hb μ x

/-- The Laplace pdf vanishes for `b ≤ 0`. -/
theorem laplacePDFReal_of_nonpos {b : ℝ} (hb : b ≤ 0) (μ x : ℝ) : laplacePDFReal μ b x = 0 :=
  TauCeti.Probability.laplacePDFReal_of_nonpos hb μ x

/-- The Laplace measure is `volume.withDensity` of its pdf. -/
theorem laplaceMeasure_eq_withDensity (μ b : ℝ) :
    laplaceMeasure μ b = volume.withDensity (laplacePDF μ b) :=
  TauCeti.Probability.laplaceMeasure_eq_withDensity μ b

/-- The Laplace measure vanishes for `b ≤ 0`. -/
theorem laplaceMeasure_of_nonpos {b : ℝ} (hb : b ≤ 0) (μ : ℝ) : laplaceMeasure μ b = 0 :=
  TauCeti.Probability.laplaceMeasure_of_nonpos hb μ

/-- Probability measure for `0 < b`. -/
theorem isProbabilityMeasure_laplaceMeasure {b : ℝ} (hb : 0 < b) (μ : ℝ) :
    IsProbabilityMeasure (laplaceMeasure μ b) :=
  TauCeti.Probability.isProbabilityMeasure_laplaceMeasure hb μ

/-- `HasPDF`. -/
theorem hasPDF_of_hasLaw_laplaceMeasure {μ b : ℝ} (hX : HasLaw X (laplaceMeasure μ b) P) :
    HasPDF X P volume :=
  TauCeti.Probability.hasPDF_of_hasLaw_laplaceMeasure hX

/-- The pdf of a Laplace random variable. -/
theorem pdf_eq_laplacePDF_of_hasLaw {μ b : ℝ} (hX : HasLaw X (laplaceMeasure μ b) P) :
    pdf X P volume =ᵐ[volume] laplacePDF μ b :=
  TauCeti.Probability.pdf_eq_laplacePDF_of_hasLaw_laplaceMeasure hX

/-- `rnDeriv`. -/
theorem rnDeriv_laplaceMeasure (μ b : ℝ) :
    (laplaceMeasure μ b).rnDeriv volume =ᵐ[volume] laplacePDF μ b :=
  TauCeti.Probability.rnDeriv_laplaceMeasure μ b

/-- Mean `μ`. -/
theorem integral_id_laplaceMeasure {b : ℝ} (hb : 0 < b) (μ : ℝ) :
    ∫ x, x ∂laplaceMeasure μ b = μ :=
  TauCeti.Probability.integral_id_laplaceMeasure hb μ

/-- Variance `2 b²`. -/
theorem variance_id_laplaceMeasure {b : ℝ} (hb : 0 < b) (μ : ℝ) :
    variance id (laplaceMeasure μ b) = 2 * b ^ 2 :=
  TauCeti.Probability.variance_id_laplaceMeasure hb μ

/-- The Laplace cdf. -/
theorem cdf_laplaceMeasure_eq {b : ℝ} (hb : 0 < b) (μ x : ℝ) :
    cdf (laplaceMeasure μ b) x =
      if x < μ then Real.exp ((x - μ) / b) / 2 else 1 - Real.exp (-(x - μ) / b) / 2 :=
  TauCeti.Probability.cdf_laplaceMeasure_eq hb μ x

/-- `integrableExpSet id = Ioo (-b⁻¹) b⁻¹`. -/
theorem integrableExpSet_id_laplaceMeasure {b : ℝ} (hb : 0 < b) (μ : ℝ) :
    integrableExpSet id (laplaceMeasure μ b) = Set.Ioo (-b⁻¹) b⁻¹ :=
  TauCeti.Probability.integrableExpSet_id_laplaceMeasure hb μ

/-- The Laplace mgf. -/
theorem mgf_id_laplaceMeasure {b : ℝ} (hb : 0 < b) (μ : ℝ) {t : ℝ}
    (ht : t ∈ Set.Ioo (-b⁻¹) b⁻¹) :
    mgf id (laplaceMeasure μ b) t = Real.exp (μ * t) / (1 - b ^ 2 * t ^ 2) :=
  TauCeti.Probability.mgf_id_laplaceMeasure hb μ ht

/-- The Laplace cgf. -/
theorem cgf_id_laplaceMeasure {b : ℝ} (hb : 0 < b) (μ : ℝ) {t : ℝ}
    (ht : t ∈ Set.Ioo (-b⁻¹) b⁻¹) :
    cgf id (laplaceMeasure μ b) t = Real.log (Real.exp (μ * t) / (1 - b ^ 2 * t ^ 2)) :=
  TauCeti.Probability.cgf_id_laplaceMeasure hb μ ht

/-- The Laplace characteristic function. -/
theorem charFun_laplaceMeasure {b : ℝ} (hb : 0 < b) (μ t : ℝ) :
    charFun (laplaceMeasure μ b) t =
      Complex.exp (Complex.I * μ * t) / (1 + b ^ 2 * t ^ 2) :=
  TauCeti.Probability.charFun_laplaceMeasure hb μ t

/-- Parameter measurability. -/
theorem measurable_laplaceMeasure : Measurable fun p : ℝ × ℝ => laplaceMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_laplaceMeasure

/-! ### Log-normal -/

/-- The log-normal law is defined by pushforward of the Gaussian along `exp`. -/
theorem logNormalMeasure_map_exp (μ : ℝ) (v : ℝ≥0) :
    logNormalMeasure μ v = (gaussianReal μ v).map Real.exp :=
  TauCeti.Probability.logNormalMeasure_map_exp μ v

/-- Probability measure for every parameter. -/
theorem isProbabilityMeasure_logNormalMeasure (μ : ℝ) (v : ℝ≥0) :
    IsProbabilityMeasure (logNormalMeasure μ v) :=
  TauCeti.Probability.isProbabilityMeasure_logNormalMeasure μ v

/-- The log-normal density in the README's form. -/
theorem logNormalPDFReal_eq (μ : ℝ) (v : ℝ≥0) (x : ℝ) :
    logNormalPDFReal μ v x = if x ≤ 0 then 0 else
      (x * Real.sqrt (2 * Real.pi * v))⁻¹ * Real.exp (-(Real.log x - μ) ^ 2 / (2 * v)) := by
  split_ifs with hx
  · exact TauCeti.Probability.logNormalPDFReal_of_nonpos hx μ v
  · exact TauCeti.Probability.logNormalPDFReal_of_pos (not_le.1 hx) μ v

/-- The log-normal law has its density for `v ≠ 0`. -/
theorem logNormalMeasure_eq_withDensity (μ : ℝ) {v : ℝ≥0} (hv : v ≠ 0) :
    logNormalMeasure μ v = volume.withDensity (logNormalPDF μ v) :=
  TauCeti.Probability.logNormalMeasure_eq_withDensity μ hv

/-- **Log-normal change of variables.** `exp` maps `ℝ` injectively onto `(0, ∞)` with derivative
`exp`, and transports weighted Lebesgue measure accordingly; this is the step from the Gaussian
density to the log-normal one. -/
theorem exp_changeOfVariables (f : ℝ → ℝ≥0∞) :
    Real.exp '' Set.univ = Set.Ioi 0 ∧ Set.InjOn Real.exp Set.univ ∧
      (∀ x, HasDerivAt Real.exp (Real.exp x) x) ∧
      ((volume.restrict Set.univ).withDensity
          fun t ↦ ENNReal.ofReal |Real.exp t| * f (Real.exp t)).map Real.exp =
        (volume.restrict (Set.Ioi 0)).withDensity f := by
  have h := TauCeti.MeasureTheory.map_withDensity_abs_deriv_mul (f := f) MeasurableSet.univ
    Real.measurable_exp (fun x _ ↦ (Real.hasDerivAt_exp x).hasDerivWithinAt)
    Real.exp_injective.injOn
  rw [Set.image_univ, Real.range_exp] at h
  exact ⟨by rw [Set.image_univ, Real.range_exp], Real.exp_injective.injOn, Real.hasDerivAt_exp, h⟩

/-- `HasPDF` for `v ≠ 0`. -/
theorem hasPDF_of_hasLaw_logNormalMeasure {μ : ℝ} {v : ℝ≥0} (hv : v ≠ 0)
    (hX : HasLaw X (logNormalMeasure μ v) P) : HasPDF X P volume :=
  TauCeti.Probability.hasPDF_of_hasLaw_logNormalMeasure hv hX

/-- `rnDeriv` for `v ≠ 0`. -/
theorem rnDeriv_logNormalMeasure (μ : ℝ) {v : ℝ≥0} (hv : v ≠ 0) :
    (logNormalMeasure μ v).rnDeriv volume =ᵐ[volume] logNormalPDF μ v :=
  TauCeti.Probability.rnDeriv_logNormalMeasure μ hv

/-- The log-normal cdf for `v ≠ 0`. -/
theorem cdf_logNormalMeasure_eq (μ : ℝ) {v : ℝ≥0} (hv : v ≠ 0) (x : ℝ) :
    cdf (logNormalMeasure μ v) x =
      if x ≤ 0 then 0 else (1 + TauCeti.Real.erf ((Real.log x - μ) / Real.sqrt (2 * v))) / 2 :=
  TauCeti.Probability.cdf_logNormalMeasure_eq μ hv x

/-- `integrableExpSet id = Iic 0` for `v ≠ 0`. -/
theorem integrableExpSet_id_logNormalMeasure (μ : ℝ) {v : ℝ≥0} (hv : v ≠ 0) :
    integrableExpSet id (logNormalMeasure μ v) = Set.Iic 0 :=
  TauCeti.Probability.integrableExpSet_id_logNormalMeasure μ hv

/-- Non-integrability of the mgf integrand for `t > 0` and `v ≠ 0`. -/
theorem not_integrable_exp_logNormalMeasure (μ : ℝ) {v : ℝ≥0} (hv : v ≠ 0) {t : ℝ}
    (ht : 0 < t) : ¬ Integrable (fun x => Real.exp (t * x)) (logNormalMeasure μ v) :=
  TauCeti.Probability.not_integrable_exp_mul_logNormalMeasure μ hv ht

/-- At `v = 0` the law is the Dirac mass at `exp μ`. -/
theorem logNormalMeasure_zero_var (μ : ℝ) :
    logNormalMeasure μ 0 = Measure.dirac (Real.exp μ) :=
  TauCeti.Probability.logNormalMeasure_zero_var μ

/-- The `v = 0` cdf. -/
theorem cdf_logNormalMeasure_zero_var (μ x : ℝ) :
    cdf (logNormalMeasure μ 0) x = if Real.exp μ ≤ x then 1 else 0 :=
  TauCeti.Probability.cdf_logNormalMeasure_zero_var μ x

/-- The `v = 0` mean, specializing the general mean. -/
theorem integral_id_logNormalMeasure_zero_var (μ : ℝ) :
    ∫ x, x ∂logNormalMeasure μ 0 = Real.exp μ := by
  rw [TauCeti.Probability.integral_id_logNormalMeasure μ 0]
  simp

/-- The `v = 0` variance, specializing the general variance. -/
theorem variance_id_logNormalMeasure_zero_var (μ : ℝ) :
    variance id (logNormalMeasure μ 0) = 0 := by
  rw [TauCeti.Probability.variance_id_logNormalMeasure μ 0]
  simp

/-- The `v = 0` exponential-integrability domain. -/
theorem integrableExpSet_id_logNormalMeasure_zero_var (μ : ℝ) :
    integrableExpSet id (logNormalMeasure μ 0) = Set.univ :=
  TauCeti.Probability.integrableExpSet_id_logNormalMeasure_zero_var μ

/-- The `v = 0` mgf. -/
theorem mgf_id_logNormalMeasure_zero_var (μ t : ℝ) :
    mgf id (logNormalMeasure μ 0) t = Real.exp (t * Real.exp μ) :=
  TauCeti.Probability.mgf_id_logNormalMeasure_zero_var μ t

/-- The `v = 0` cgf. -/
theorem cgf_id_logNormalMeasure_zero_var (μ t : ℝ) :
    cgf id (logNormalMeasure μ 0) t = t * Real.exp μ :=
  TauCeti.Probability.cgf_id_logNormalMeasure_zero_var μ t

/-- The `v = 0` characteristic function. -/
theorem charFun_logNormalMeasure_zero_var (μ t : ℝ) :
    charFun (logNormalMeasure μ 0) t = Complex.exp (Complex.I * (t : ℂ) * Real.exp μ) :=
  TauCeti.Probability.charFun_logNormalMeasure_zero_var μ t

/-- Raw moments, for every `v` including `v = 0`. -/
theorem integral_pow_logNormalMeasure (μ : ℝ) (v : ℝ≥0) (n : ℕ) :
    ∫ x, x ^ n ∂logNormalMeasure μ v =
      Real.exp ((n : ℝ) * μ + (n : ℝ) ^ 2 * (v : ℝ) / 2) :=
  TauCeti.Probability.integral_pow_logNormalMeasure μ v n

/-- The mean `exp (μ + v / 2)`. -/
theorem integral_id_logNormalMeasure (μ : ℝ) (v : ℝ≥0) :
    ∫ x, x ∂logNormalMeasure μ v = Real.exp (μ + v / 2) :=
  TauCeti.Probability.integral_id_logNormalMeasure μ v

/-- The variance `(exp v - 1) exp (2μ + v)`. -/
theorem variance_id_logNormalMeasure (μ : ℝ) (v : ℝ≥0) :
    variance id (logNormalMeasure μ v) = (Real.exp v - 1) * Real.exp (2 * μ + v) :=
  TauCeti.Probability.variance_id_logNormalMeasure μ v

/-- Parameter measurability. -/
theorem measurable_logNormalMeasure :
    Measurable fun p : ℝ × ℝ≥0 => logNormalMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_logNormalMeasure

/-! ### Weibull -/

/-- The Weibull measure is `volume.withDensity` of its pdf. -/
theorem weibullMeasure_def (k lam : ℝ) :
    weibullMeasure k lam = volume.withDensity (weibullPDF k lam) :=
  TauCeti.Probability.weibullMeasure_def k lam

/-- The pdf vanishes unless `0 < k` and `0 < lam`. -/
theorem weibullPDFReal_of_not_pos {k lam : ℝ} (h : ¬ (0 < k ∧ 0 < lam)) (x : ℝ) :
    weibullPDFReal k lam x = 0 := by
  rcases not_and_or.1 h with hk | hl
  · exact TauCeti.Probability.weibullPDFReal_of_shape_nonpos (not_lt.1 hk) lam x
  · exact TauCeti.Probability.weibullPDFReal_of_scale_nonpos (not_lt.1 hl) k x

/-- The measure vanishes unless `0 < k` and `0 < lam`. -/
theorem weibullMeasure_of_not_pos {k lam : ℝ} (h : ¬ (0 < k ∧ 0 < lam)) :
    weibullMeasure k lam = 0 :=
  TauCeti.Probability.weibullMeasure_of_not_pos h

/-- The Weibull density in the README's form. -/
theorem weibullPDFReal_eq {k lam : ℝ} (hk : 0 < k) (hlam : 0 < lam) (x : ℝ) :
    weibullPDFReal k lam x = if x ≤ 0 then 0 else
      (k / lam) * Real.rpow (x / lam) (k - 1) * Real.exp (-Real.rpow (x / lam) k) := by
  split_ifs with hx
  · exact TauCeti.Probability.weibullPDFReal_of_nonpos hx k lam
  · exact TauCeti.Probability.weibullPDFReal_of_pos hk hlam (not_le.1 hx)

/-- Probability measure exactly for `0 < k` and `0 < lam`. -/
theorem isProbabilityMeasure_weibullMeasure {k lam : ℝ} (hk : 0 < k) (hlam : 0 < lam) :
    IsProbabilityMeasure (weibullMeasure k lam) :=
  TauCeti.Probability.isProbabilityMeasure_weibullMeasure hk hlam

/-- `HasPDF`. -/
theorem hasPDF_of_hasLaw_weibullMeasure {k lam : ℝ} (hX : HasLaw X (weibullMeasure k lam) P) :
    HasPDF X P volume :=
  TauCeti.Probability.hasPDF_of_hasLaw_weibullMeasure hX

/-- `rnDeriv`. -/
theorem rnDeriv_weibullMeasure (k lam : ℝ) :
    (weibullMeasure k lam).rnDeriv volume =ᵐ[volume] weibullPDF k lam :=
  TauCeti.Probability.rnDeriv_weibullMeasure k lam

/-- The Weibull cdf. -/
theorem cdf_weibullMeasure_eq {k lam : ℝ} (hk : 0 < k) (hlam : 0 < lam) (x : ℝ) :
    cdf (weibullMeasure k lam) x = if x ≤ 0 then 0 else 1 - Real.exp (-(x / lam) ^ k) :=
  TauCeti.Probability.cdf_weibullMeasure_eq hk hlam x

/-- Raw moments `lam^n Γ(1 + n/k)`. -/
theorem integral_pow_weibullMeasure {k lam : ℝ} (hk : 0 < k) (hlam : 0 < lam) (n : ℕ) :
    ∫ y, y ^ n ∂weibullMeasure k lam = lam ^ n * Real.Gamma (1 + (n : ℝ) / k) :=
  TauCeti.Probability.integral_pow_weibullMeasure hk hlam n

/-- The variance. -/
theorem variance_id_weibullMeasure {k lam : ℝ} (hk : 0 < k) (hlam : 0 < lam) :
    variance id (weibullMeasure k lam) =
      lam ^ 2 * (Real.Gamma (1 + 2 / k) - Real.Gamma (1 + 1 / k) ^ 2) :=
  TauCeti.Probability.variance_id_weibullMeasure hk hlam

/-- `1 < k`: integrable for every `t`. -/
theorem integrableExpSet_id_weibullMeasure_of_one_lt {k lam : ℝ} (hk : 1 < k) :
    integrableExpSet id (weibullMeasure k lam) = Set.univ :=
  TauCeti.Probability.integrableExpSet_id_weibullMeasure_of_one_lt hk

/-- `1 < k`: the mgf series. -/
theorem mgf_id_weibullMeasure_of_one_lt {k lam : ℝ} (hk : 1 < k) (hlam : 0 < lam) (t : ℝ) :
    mgf id (weibullMeasure k lam) t =
      ∑' n : ℕ, (t * lam) ^ n * Real.Gamma (1 + (n : ℝ) / k) / n.factorial :=
  TauCeti.Probability.mgf_id_weibullMeasure_of_one_lt hk hlam t

/-- `1 < k`: the mgf series converges, and its sum is the mgf. -/
theorem hasSum_mgf_id_weibullMeasure_of_one_lt {k lam : ℝ} (hk : 1 < k) (hlam : 0 < lam)
    (t : ℝ) :
    HasSum (fun n : ℕ => (t * lam) ^ n * Real.Gamma (1 + (n : ℝ) / k) / n.factorial)
      (mgf id (weibullMeasure k lam) t) :=
  TauCeti.Probability.hasSum_mgf_id_weibullMeasure_of_one_lt hk hlam t

/-- `1 < k`: the cgf. -/
theorem cgf_id_weibullMeasure_of_one_lt {k lam : ℝ} (hk : 1 < k) (hlam : 0 < lam) (t : ℝ) :
    cgf id (weibullMeasure k lam) t =
      Real.log (∑' n : ℕ, (t * lam) ^ n * Real.Gamma (1 + (n : ℝ) / k) / n.factorial) :=
  TauCeti.Probability.cgf_id_weibullMeasure_of_one_lt hk hlam t

/-- `k = 1`: integrable exactly for `t < lam⁻¹`. -/
theorem integrableExpSet_id_weibullMeasure_one {lam : ℝ} (hlam : 0 < lam) :
    integrableExpSet id (weibullMeasure 1 lam) = Set.Iio lam⁻¹ :=
  TauCeti.Probability.integrableExpSet_id_weibullMeasure_one hlam

/-- `k = 1`: the mgf. -/
theorem mgf_id_weibullMeasure_one {lam t : ℝ} (hlam : 0 < lam) (ht : t < lam⁻¹) :
    mgf id (weibullMeasure 1 lam) t = (1 - lam * t)⁻¹ :=
  TauCeti.Probability.mgf_id_weibullMeasure_one hlam ht

/-- `k = 1`: the cgf, the real logarithm of the mgf. -/
theorem cgf_id_weibullMeasure_one {lam t : ℝ} (hlam : 0 < lam) (ht : t < lam⁻¹) :
    cgf id (weibullMeasure 1 lam) t = Real.log ((1 - lam * t)⁻¹) := by
  rw [Real.log_inv]
  exact TauCeti.Probability.cgf_id_weibullMeasure_one hlam ht

/-- `0 < k < 1`: integrable exactly for `t ≤ 0`. -/
theorem integrableExpSet_id_weibullMeasure_of_lt_one {k lam : ℝ} (hk : 0 < k) (hk' : k < 1)
    (hlam : 0 < lam) : integrableExpSet id (weibullMeasure k lam) = Set.Iic 0 :=
  TauCeti.Probability.integrableExpSet_id_weibullMeasure_of_lt_one hk hk' hlam

/-- `0 < k < 1`: non-integrability for every `t > 0`. -/
theorem not_integrable_exp_weibullMeasure_of_lt_one {k lam t : ℝ} (hk : 0 < k) (hk' : k < 1)
    (hlam : 0 < lam) (ht : 0 < t) :
    ¬ Integrable (fun x : ℝ => Real.exp (t * x)) (weibullMeasure k lam) :=
  TauCeti.Probability.not_integrable_exp_mul_id_weibullMeasure_of_lt_one hk hk' hlam ht

/-- Parameter measurability. -/
theorem measurable_weibullMeasure : Measurable fun p : ℝ × ℝ => weibullMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_weibullMeasure

/-! ### Chi-squared -/

/-- The chi-squared law is `gammaMeasure (k/2) (1/2)` for `0 < k`. -/
theorem chiSquaredMeasure_eq_gammaMeasure {k : ℝ} (hk : 0 < k) :
    chiSquaredMeasure k = gammaMeasure (k / 2) (1 / 2) :=
  TauCeti.Probability.chiSquaredMeasure_eq_gammaMeasure hk

/-- `chiSquaredMeasure 0 = dirac 0`. -/
theorem chiSquaredMeasure_zero : chiSquaredMeasure 0 = Measure.dirac 0 :=
  TauCeti.Probability.chiSquaredMeasure_zero

/-- The zero measure for `k < 0`. -/
theorem chiSquaredMeasure_of_neg {k : ℝ} (hk : k < 0) : chiSquaredMeasure k = 0 :=
  TauCeti.Probability.chiSquaredMeasure_of_neg hk

/-- Probability measure for `0 ≤ k`, including the boundary `k = 0`. -/
theorem isProbabilityMeasure_chiSquaredMeasure {k : ℝ} (hk : 0 ≤ k) :
    IsProbabilityMeasure (chiSquaredMeasure k) :=
  TauCeti.Probability.isProbabilityMeasure_chiSquaredMeasure hk

/-- The pdf is the specialized gamma pdf. -/
theorem chiSquaredPDF_eq_gammaPDF (k x : ℝ) : chiSquaredPDF k x = gammaPDF (k / 2) (1 / 2) x :=
  TauCeti.Probability.chiSquaredPDF_eq_gammaPDF k x

/-- Density for `0 < k`. -/
theorem chiSquaredMeasure_eq_withDensity {k : ℝ} (hk : 0 < k) :
    chiSquaredMeasure k = volume.withDensity (chiSquaredPDF k) :=
  TauCeti.Probability.chiSquaredMeasure_eq_withDensity hk

/-- `HasPDF` for `0 < k`. -/
theorem hasPDF_of_hasLaw_chiSquaredMeasure {k : ℝ} (hk : 0 < k)
    (hX : HasLaw X (chiSquaredMeasure k) P) : HasPDF X P :=
  TauCeti.Probability.hasPDF_of_hasLaw_chiSquaredMeasure hk hX

/-- `rnDeriv` for `0 < k`. -/
theorem rnDeriv_chiSquaredMeasure {k : ℝ} (hk : 0 < k) :
    (chiSquaredMeasure k).rnDeriv volume =ᵐ[volume] chiSquaredPDF k :=
  TauCeti.Probability.rnDeriv_chiSquaredMeasure hk

/-- The cdf for `0 < k`. -/
theorem cdf_chiSquaredMeasure_eq {k : ℝ} (hk : 0 < k) (x : ℝ) :
    cdf (chiSquaredMeasure k) x = regularizedGamma (k / 2) (x / 2) :=
  TauCeti.Probability.cdf_chiSquaredMeasure_eq hk x

/-- Mean `k`, including `k = 0`. -/
theorem integral_id_chiSquaredMeasure {k : ℝ} (hk : 0 ≤ k) : ∫ x, x ∂chiSquaredMeasure k = k :=
  TauCeti.Probability.integral_id_chiSquaredMeasure hk

/-- Variance `2k`, including `k = 0`. -/
theorem variance_id_chiSquaredMeasure {k : ℝ} (hk : 0 ≤ k) :
    variance id (chiSquaredMeasure k) = 2 * k :=
  TauCeti.Probability.variance_id_chiSquaredMeasure hk

/-- `integrableExpSet id = Iio (1/2)` for `0 < k`. -/
theorem integrableExpSet_id_chiSquaredMeasure {k : ℝ} (hk : 0 < k) :
    integrableExpSet id (chiSquaredMeasure k) = Set.Iio (1 / 2) :=
  TauCeti.Probability.integrableExpSet_id_chiSquaredMeasure hk

/-- The mgf `(1 - 2t)^(-(k/2))` on its domain. -/
theorem mgf_id_chiSquaredMeasure {k t : ℝ} (hk : 0 < k) (ht : t < 1 / 2) :
    mgf id (chiSquaredMeasure k) t = Real.rpow (1 - 2 * t) (-(k / 2)) :=
  TauCeti.Probability.mgf_id_chiSquaredMeasure hk.le (by simpa using ht)

/-- The cgf, the real logarithm of the mgf. -/
theorem cgf_id_chiSquaredMeasure {k t : ℝ} (hk : 0 < k) (ht : t < 1 / 2) :
    cgf id (chiSquaredMeasure k) t = Real.log (Real.rpow (1 - 2 * t) (-(k / 2))) := by
  rw [TauCeti.Probability.cgf_id_chiSquaredMeasure hk.le (by simpa using ht),
    Real.rpow_eq_pow, Real.log_rpow (by linarith)]

/-- The characteristic function, for every `t`. -/
theorem charFun_chiSquaredMeasure {k : ℝ} (hk : 0 < k) (t : ℝ) :
    charFun (chiSquaredMeasure k) t = (1 - 2 * Complex.I * (t : ℂ)) ^ (-(k : ℂ) / 2) :=
  TauCeti.Probability.charFun_chiSquaredMeasure hk.le t

/-- `k = 0`: the cdf. -/
theorem cdf_chiSquaredMeasure_zero (x : ℝ) :
    cdf (chiSquaredMeasure 0) x = if 0 ≤ x then 1 else 0 :=
  TauCeti.Probability.cdf_chiSquaredMeasure_zero x

/-- `k = 0`: mean `0`. -/
theorem integral_id_chiSquaredMeasure_zero : ∫ x, x ∂chiSquaredMeasure 0 = 0 :=
  TauCeti.Probability.integral_id_chiSquaredMeasure le_rfl

/-- `k = 0`: variance `0`. -/
theorem variance_id_chiSquaredMeasure_zero : variance id (chiSquaredMeasure 0) = 0 := by
  rw [TauCeti.Probability.variance_id_chiSquaredMeasure le_rfl, mul_zero]

/-- `k = 0`: `integrableExpSet id = univ`. -/
theorem integrableExpSet_id_chiSquaredMeasure_zero :
    integrableExpSet id (chiSquaredMeasure 0) = Set.univ :=
  TauCeti.Probability.integrableExpSet_id_chiSquaredMeasure_zero

/-- `k = 0`: mgf identically `1`. -/
theorem mgf_id_chiSquaredMeasure_zero (t : ℝ) : mgf id (chiSquaredMeasure 0) t = 1 :=
  TauCeti.Probability.mgf_id_chiSquaredMeasure_zero t

/-- `k = 0`: cgf identically `0`. -/
theorem cgf_id_chiSquaredMeasure_zero (t : ℝ) : cgf id (chiSquaredMeasure 0) t = 0 :=
  TauCeti.Probability.cgf_id_chiSquaredMeasure_zero t

/-- `k = 0`: characteristic function identically `1`. -/
theorem charFun_chiSquaredMeasure_zero (t : ℝ) : charFun (chiSquaredMeasure 0) t = 1 := by
  rw [TauCeti.Probability.charFun_chiSquaredMeasure le_rfl t]
  simp

/-- Additivity for nonnegative degrees of freedom. -/
theorem chiSquaredMeasure_conv_chiSquaredMeasure {k l : ℝ} (hk : 0 ≤ k) (hl : 0 ≤ l) :
    chiSquaredMeasure k ∗ chiSquaredMeasure l = chiSquaredMeasure (k + l) :=
  TauCeti.Probability.chiSquaredMeasure_conv_chiSquaredMeasure hk hl

/-- Parameter measurability. -/
theorem measurable_chiSquaredMeasure : Measurable fun k : ℝ => chiSquaredMeasure k :=
  TauCeti.Probability.measurable_chiSquaredMeasure

/-! ### Inverse-gamma -/

/-- The inverse-gamma law is the inversion pushforward of the Gamma law in the valid family. -/
theorem inverseGammaMeasure_of_pos {a r : ℝ} (ha : 0 < a) (hr : 0 < r) :
    inverseGammaMeasure a r = (gammaMeasure a r).map (·⁻¹) :=
  TauCeti.Probability.inverseGammaMeasure_of_pos ha hr

/-- ... and zero otherwise. -/
theorem inverseGammaMeasure_of_not_pos {a r : ℝ} (h : ¬ (0 < a ∧ 0 < r)) :
    inverseGammaMeasure a r = 0 :=
  TauCeti.Probability.inverseGammaMeasure_of_not_pos h

/-- Probability measure in the valid family. -/
theorem isProbabilityMeasure_inverseGammaMeasure {a r : ℝ} (ha : 0 < a) (hr : 0 < r) :
    IsProbabilityMeasure (inverseGammaMeasure a r) :=
  TauCeti.Probability.isProbabilityMeasure_inverseGammaMeasure ha hr

/-- The inverse-gamma density in the README's form. -/
theorem inverseGammaPDFReal_eq {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (x : ℝ) :
    inverseGammaPDFReal a r x = if x ≤ 0 then 0 else
      Real.rpow r a / Real.Gamma a * Real.rpow x (-a - 1) * Real.exp (-r / x) := by
  split_ifs with hx
  · exact TauCeti.Probability.inverseGammaPDFReal_of_nonpos hx a r
  · exact TauCeti.Probability.inverseGammaPDFReal_of_pos ha hr (not_le.1 hx)

/-- The density presentation. -/
theorem inverseGammaMeasure_eq_withDensity (a r : ℝ) :
    inverseGammaMeasure a r = volume.withDensity (inverseGammaPDF a r) :=
  TauCeti.Probability.inverseGammaMeasure_eq_withDensity a r

/-- **Scalar inversion change of variables.** `x ↦ x⁻¹` maps `(0, ∞)` injectively onto itself
with derivative `-(x ^ 2)⁻¹`, and transports weighted Lebesgue measure accordingly; this is the
step from the Gamma density to the inverse-gamma one. -/
theorem inv_changeOfVariables (f : ℝ → ℝ≥0∞) :
    (·⁻¹) '' Set.Ioi (0 : ℝ) = Set.Ioi 0 ∧ Set.InjOn (·⁻¹ : ℝ → ℝ) (Set.Ioi 0) ∧
      (∀ x ∈ Set.Ioi (0 : ℝ), HasDerivAt (·⁻¹) (-(x ^ 2)⁻¹) x) ∧
      ((volume.restrict (Set.Ioi 0)).withDensity
          fun t ↦ ENNReal.ofReal |-(t ^ 2)⁻¹| * f t⁻¹).map (·⁻¹ : ℝ → ℝ) =
        (volume.restrict (Set.Ioi 0)).withDensity f := by
  have himage : (·⁻¹) '' Set.Ioi (0 : ℝ) = Set.Ioi 0 := by
    ext y; simp [Set.image_inv_eq_inv]
  have h := TauCeti.MeasureTheory.map_withDensity_abs_deriv_mul (f := f) measurableSet_Ioi
    measurable_inv (fun y hy ↦ (hasDerivAt_inv (ne_of_gt hy)).hasDerivWithinAt)
    inv_injective.injOn
  rw [himage] at h
  exact ⟨himage, inv_injective.injOn, fun x hx ↦ hasDerivAt_inv (ne_of_gt hx), h⟩

/-- `HasPDF`. -/
theorem hasPDF_of_hasLaw_inverseGammaMeasure {a r : ℝ}
    (hX : HasLaw X (inverseGammaMeasure a r) P) : HasPDF X P volume :=
  TauCeti.Probability.hasPDF_of_hasLaw_inverseGammaMeasure hX

/-- `rnDeriv`. -/
theorem rnDeriv_inverseGammaMeasure (a r : ℝ) :
    (inverseGammaMeasure a r).rnDeriv volume =ᵐ[volume] inverseGammaPDF a r :=
  TauCeti.Probability.rnDeriv_inverseGammaMeasure a r

/-- The cdf. -/
theorem cdf_inverseGammaMeasure_eq {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (x : ℝ) :
    cdf (inverseGammaMeasure a r) x = if x ≤ 0 then 0 else 1 - regularizedGamma a (r / x) :=
  TauCeti.Probability.cdf_inverseGammaMeasure_eq ha hr x

/-- Mean `r / (a - 1)` for `1 < a`. -/
theorem integral_id_inverseGammaMeasure {a r : ℝ} (ha : 1 < a) (hr : 0 < r) :
    ∫ x, x ∂inverseGammaMeasure a r = r / (a - 1) :=
  TauCeti.Probability.integral_id_inverseGammaMeasure hr ha

/-- Variance for `2 < a`. -/
theorem variance_id_inverseGammaMeasure {a r : ℝ} (ha : 2 < a) (hr : 0 < r) :
    variance id (inverseGammaMeasure a r) = r ^ 2 / ((a - 1) ^ 2 * (a - 2)) :=
  TauCeti.Probability.variance_id_inverseGammaMeasure hr ha

/-- Non-integrability of `id` for `0 < a ≤ 1`. -/
theorem not_integrable_id_inverseGammaMeasure {a r : ℝ} (ha : 0 < a) (hr : 0 < r)
    (h : a ≤ 1) : ¬ Integrable id (inverseGammaMeasure a r) :=
  TauCeti.Probability.not_integrable_id_inverseGammaMeasure ha hr h

/-- Non-integrability of `x ↦ x²` for `0 < a ≤ 2`. -/
theorem not_integrable_sq_inverseGammaMeasure {a r : ℝ} (ha : 0 < a) (hr : 0 < r)
    (h : a ≤ 2) : ¬ Integrable (fun x : ℝ => x ^ 2) (inverseGammaMeasure a r) :=
  TauCeti.Probability.not_integrable_sq_inverseGammaMeasure ha hr h

/-- `integrableExpSet id = Iic 0`. -/
theorem integrableExpSet_id_inverseGammaMeasure {a r : ℝ} (ha : 0 < a) (hr : 0 < r) :
    integrableExpSet id (inverseGammaMeasure a r) = Set.Iic 0 :=
  TauCeti.Probability.integrableExpSet_id_inverseGammaMeasure ha hr

/-- Non-integrability of the mgf integrand for `t > 0`. -/
theorem not_integrable_exp_inverseGammaMeasure {a r t : ℝ} (ha : 0 < a) (hr : 0 < r)
    (ht : 0 < t) : ¬ Integrable (fun x : ℝ => Real.exp (t * x)) (inverseGammaMeasure a r) :=
  TauCeti.Probability.not_integrable_exp_mul_inverseGammaMeasure ha hr ht

/-- Parameter measurability. -/
theorem measurable_inverseGammaMeasure :
    Measurable fun p : ℝ × ℝ => inverseGammaMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_inverseGammaMeasure

/-! ### Student's t -/

/-- The Student t density for `0 < ν`. -/
theorem studentTPDFReal_of_pos {ν : ℝ} (hν : 0 < ν) (x : ℝ) :
    studentTPDFReal ν x =
      Real.Gamma ((ν + 1) / 2) / (Real.sqrt (ν * Real.pi) * Real.Gamma (ν / 2)) *
        Real.rpow (1 + x ^ 2 / ν) (-((ν + 1) / 2)) :=
  TauCeti.Probability.studentTPDFReal_of_pos hν x

/-- The Student t measure is `volume.withDensity` of its pdf. -/
theorem studentTMeasure_def (ν : ℝ) : studentTMeasure ν = volume.withDensity (studentTPDF ν) :=
  TauCeti.Probability.studentTMeasure_def ν

/-- The zero measure for `ν ≤ 0`. -/
theorem studentTMeasure_of_nonpos {ν : ℝ} (hν : ν ≤ 0) : studentTMeasure ν = 0 :=
  TauCeti.Probability.studentTMeasure_of_nonpos hν

/-- Probability measure for `0 < ν`. -/
theorem isProbabilityMeasure_studentTMeasure {ν : ℝ} (hν : 0 < ν) :
    IsProbabilityMeasure (studentTMeasure ν) :=
  TauCeti.Probability.isProbabilityMeasure_studentTMeasure hν

/-- `HasPDF`. -/
theorem hasPDF_of_hasLaw_studentTMeasure {ν : ℝ} (hX : HasLaw X (studentTMeasure ν) P) :
    HasPDF X P volume :=
  TauCeti.Probability.hasPDF_of_hasLaw_studentTMeasure hX

/-- `rnDeriv`. -/
theorem rnDeriv_studentTMeasure (ν : ℝ) :
    (studentTMeasure ν).rnDeriv volume =ᵐ[volume] studentTPDF ν :=
  TauCeti.Probability.rnDeriv_studentTMeasure ν

/-- Mean `0` for `1 < ν` (Tau Ceti proves it for every `ν`). -/
theorem integral_id_studentTMeasure {ν : ℝ} (_hν : 1 < ν) :
    ∫ x, x ∂studentTMeasure ν = 0 :=
  TauCeti.Probability.integral_id_studentTMeasure ν

/-- Non-integrability of `id` for `0 < ν ≤ 1`. -/
theorem not_integrable_id_studentTMeasure {ν : ℝ} (hν0 : 0 < ν) (hν1 : ν ≤ 1) :
    ¬ Integrable id (studentTMeasure ν) := by
  rw [TauCeti.Probability.integrable_id_studentTMeasure_iff hν0]
  exact not_lt.2 hν1

/-- Integrability of `id` for `1 < ν`, the sharp existence hypothesis for the mean. -/
theorem integrable_id_studentTMeasure {ν : ℝ} (hν : 1 < ν) :
    Integrable id (studentTMeasure ν) :=
  (TauCeti.Probability.integrable_id_studentTMeasure_iff (by linarith)).2 hν

/-- Within the valid family, `id` is integrable exactly when `1 < ν`. -/
theorem integrable_id_studentTMeasure_iff {ν : ℝ} (hν : 0 < ν) :
    Integrable id (studentTMeasure ν) ↔ 1 < ν :=
  TauCeti.Probability.integrable_id_studentTMeasure_iff hν

/-- Within the valid family, `x ↦ x²` is integrable exactly when `2 < ν`. -/
theorem integrable_sq_studentTMeasure_iff {ν : ℝ} (hν : 0 < ν) :
    Integrable (fun x : ℝ => x ^ 2) (studentTMeasure ν) ↔ 2 < ν := by
  simpa using TauCeti.Probability.integrable_pow_studentTMeasure_iff hν 2

/-- Variance `ν / (ν - 2)` for `2 < ν`. -/
theorem variance_id_studentTMeasure {ν : ℝ} (hν : 2 < ν) :
    variance id (studentTMeasure ν) = ν / (ν - 2) :=
  TauCeti.Probability.variance_id_studentTMeasure hν

/-- Non-integrability of `x ↦ x²` for `0 < ν ≤ 2`. -/
theorem not_integrable_sq_studentTMeasure {ν : ℝ} (hν0 : 0 < ν) (hν2 : ν ≤ 2) :
    ¬ Integrable (fun x : ℝ => x ^ 2) (studentTMeasure ν) :=
  TauCeti.Probability.not_integrable_sq_studentTMeasure hν0 hν2

/-- The Student t cdf through the regularized incomplete beta function. -/
theorem cdf_studentTMeasure_eq {ν : ℝ} (hν : 0 < ν) (x : ℝ) :
    cdf (studentTMeasure ν) x =
      if x < 0 then regularizedIncompleteBeta (ν / 2) (1 / 2) (ν / (ν + x ^ 2)) / 2
      else 1 - regularizedIncompleteBeta (ν / 2) (1 / 2) (ν / (ν + x ^ 2)) / 2 :=
  TauCeti.Probability.cdf_studentTMeasure_eq hν x

/-- `integrableExpSet id = {0}`. -/
theorem integrableExpSet_id_studentTMeasure {ν : ℝ} (hν : 0 < ν) :
    integrableExpSet id (studentTMeasure ν) = {0} :=
  TauCeti.Probability.integrableExpSet_id_studentTMeasure hν

/-- Non-integrability of the mgf integrand for `t ≠ 0`. -/
theorem not_integrable_exp_studentTMeasure {ν t : ℝ} (hν : 0 < ν) (ht : t ≠ 0) :
    ¬ Integrable (fun x : ℝ => Real.exp (t * x)) (studentTMeasure ν) :=
  TauCeti.Probability.not_integrable_exp_mul_id_studentTMeasure hν ht

/-- Parameter measurability. -/
theorem measurable_studentTMeasure : Measurable fun ν : ℝ => studentTMeasure ν :=
  TauCeti.Probability.measurable_studentTMeasure

/-! ### Fisher's F -/

/-- The F density in the README's form. -/
theorem fisherSnedecorPDFReal_eq {m n : ℝ} (hm : 0 < m) (hn : 0 < n) (x : ℝ) :
    fisherSnedecorPDFReal m n x = if x ≤ 0 then 0 else
      Real.Gamma ((m + n) / 2) / (Real.Gamma (m / 2) * Real.Gamma (n / 2)) *
        Real.rpow (m / n) (m / 2) * Real.rpow x (m / 2 - 1) *
          Real.rpow (1 + m * x / n) (-((m + n) / 2)) := by
  split_ifs with hx
  · exact TauCeti.Probability.fisherSnedecorPDFReal_of_nonpos hx m n
  · exact TauCeti.Probability.fisherSnedecorPDFReal_of_pos hm hn (not_le.1 hx)

/-- The density presentation. -/
theorem fisherSnedecorMeasure_eq_withDensity (m n : ℝ) :
    fisherSnedecorMeasure m n = volume.withDensity (fisherSnedecorPDF m n) :=
  TauCeti.Probability.fisherSnedecorMeasure_eq_withDensity m n

/-- The zero measure outside `0 < m`, `0 < n`. -/
theorem fisherSnedecorMeasure_of_not_pos {m n : ℝ} (h : ¬ (0 < m ∧ 0 < n)) :
    fisherSnedecorMeasure m n = 0 :=
  TauCeti.Probability.fisherSnedecorMeasure_of_not_pos h

/-- Probability measure for `0 < m`, `0 < n`. -/
theorem isProbabilityMeasure_fisherSnedecorMeasure {m n : ℝ} (hm : 0 < m) (hn : 0 < n) :
    IsProbabilityMeasure (fisherSnedecorMeasure m n) :=
  TauCeti.Probability.isProbabilityMeasure_fisherSnedecorMeasure hm hn

/-- `HasPDF`. -/
theorem hasPDF_of_hasLaw_fisherSnedecorMeasure {m n : ℝ}
    (hX : HasLaw X (fisherSnedecorMeasure m n) P) : HasPDF X P volume :=
  TauCeti.Probability.hasPDF_of_hasLaw_fisherSnedecorMeasure hX

/-- `rnDeriv`. -/
theorem rnDeriv_fisherSnedecorMeasure (m n : ℝ) :
    (fisherSnedecorMeasure m n).rnDeriv volume =ᵐ[volume] fisherSnedecorPDF m n :=
  TauCeti.Probability.rnDeriv_fisherSnedecorMeasure m n

/-- Mean `n / (n - 2)` for `2 < n`. -/
theorem integral_id_fisherSnedecorMeasure {m n : ℝ} (hm : 0 < m) (hn : 2 < n) :
    ∫ x, x ∂fisherSnedecorMeasure m n = n / (n - 2) :=
  TauCeti.Probability.integral_id_fisherSnedecorMeasure hm hn

/-- Non-integrability of `id` for `n ≤ 2`. -/
theorem not_integrable_id_fisherSnedecorMeasure {m n : ℝ} (hm : 0 < m) (hn : 0 < n)
    (h : n ≤ 2) : ¬ Integrable id (fisherSnedecorMeasure m n) := by
  rw [TauCeti.Probability.integrable_id_fisherSnedecorMeasure_iff hm hn]
  exact not_lt.2 h

/-- The variance for `4 < n`. -/
theorem variance_id_fisherSnedecorMeasure {m n : ℝ} (hm : 0 < m) (hn : 4 < n) :
    variance id (fisherSnedecorMeasure m n) =
      2 * n ^ 2 * (m + n - 2) / (m * (n - 2) ^ 2 * (n - 4)) :=
  TauCeti.Probability.variance_id_fisherSnedecorMeasure hm hn

/-- Non-integrability of `x ↦ x²` for `n ≤ 4`. -/
theorem not_integrable_sq_fisherSnedecorMeasure {m n : ℝ} (hm : 0 < m) (hn : 0 < n)
    (h : n ≤ 4) : ¬ Integrable (fun x : ℝ => x ^ 2) (fisherSnedecorMeasure m n) := by
  rw [TauCeti.Probability.integrable_sq_fisherSnedecorMeasure_iff hm hn]
  exact not_lt.2 h

/-- The F cdf. -/
theorem cdf_fisherSnedecorMeasure_eq {m n : ℝ} (hm : 0 < m) (hn : 0 < n) (x : ℝ) :
    cdf (fisherSnedecorMeasure m n) x =
      if x ≤ 0 then 0 else regularizedIncompleteBeta (m / 2) (n / 2) (m * x / (n + m * x)) :=
  TauCeti.Probability.cdf_fisherSnedecorMeasure_eq hm hn x

/-- `integrableExpSet id = Iic 0`. -/
theorem integrableExpSet_id_fisherSnedecorMeasure {m n : ℝ} (hm : 0 < m) (hn : 0 < n) :
    integrableExpSet id (fisherSnedecorMeasure m n) = Set.Iic 0 :=
  TauCeti.Probability.integrableExpSet_id_fisherSnedecorMeasure hm hn

/-- Non-integrability of the mgf integrand for `t > 0`. -/
theorem not_integrable_exp_fisherSnedecorMeasure {m n t : ℝ} (hm : 0 < m) (hn : 0 < n)
    (ht : 0 < t) :
    ¬ Integrable (fun x : ℝ => Real.exp (t * x)) (fisherSnedecorMeasure m n) :=
  TauCeti.Probability.not_integrable_exp_mul_id_fisherSnedecorMeasure hm hn ht

/-- Parameter measurability. -/
theorem measurable_fisherSnedecorMeasure :
    Measurable fun p : ℝ × ℝ => fisherSnedecorMeasure p.1 p.2 :=
  TauCeti.Probability.measurable_fisherSnedecorMeasure

/-! ### Negative binomial -/

/-- The weighted Dirac sum for `0 ≤ r` and `0 < p ≤ 1`. -/
theorem negativeBinomialMeasure_eq_sum_dirac {r p : ℝ} (hr : 0 ≤ r) (hp : 0 < p)
    (hp1 : p ≤ 1) :
    negativeBinomialMeasure r p =
      Measure.sum (fun k => negativeBinomialWeight r p k • Measure.dirac k) :=
  TauCeti.Probability.negativeBinomialMeasure_eq_sum_dirac hr hp hp1

/-- The singleton mass `Γ(k + r) / (k! Γ(r)) p^r (1-p)^k` for `0 < r`, `0 < p ≤ 1`. -/
theorem negativeBinomialMeasure_real_singleton {r p : ℝ} (hr : 0 < r) (hp : 0 < p)
    (hp1 : p ≤ 1) (k : ℕ) :
    (negativeBinomialMeasure r p).real {k} =
      Real.Gamma (k + r) / (k.factorial * Real.Gamma r) * Real.rpow p r * (1 - p) ^ k := by
  rw [TauCeti.Probability.negativeBinomialMeasure_real_singleton hr.le hp hp1,
    TauCeti.Probability.negativeBinomialWeightReal_eq_gamma hr.ne']

/-- At `p = 1` the law is `dirac 0`. -/
theorem negativeBinomialMeasure_one {r : ℝ} (hr : 0 ≤ r) :
    negativeBinomialMeasure r 1 = Measure.dirac 0 :=
  TauCeti.Probability.negativeBinomialMeasure_eq_dirac_of_successProbability_eq_one hr

/-- At `r = 0` the law is `dirac 0`. -/
theorem negativeBinomialMeasure_zero {p : ℝ} (hp : 0 < p) (hp1 : p ≤ 1) :
    negativeBinomialMeasure 0 p = Measure.dirac 0 :=
  TauCeti.Probability.negativeBinomialMeasure_zero hp hp1

/-- Zero for all other parameters. -/
theorem negativeBinomialMeasure_of_invalid {r p : ℝ} (h : ¬ (0 ≤ r ∧ 0 < p ∧ p ≤ 1)) :
    negativeBinomialMeasure r p = 0 :=
  TauCeti.Probability.negativeBinomialMeasure_eq_zero_of_invalid h

/-- Probability measure for `0 ≤ r`, `0 < p ≤ 1`. -/
theorem isProbabilityMeasure_negativeBinomialMeasure {r p : ℝ} (hr : 0 ≤ r) (hp : 0 < p)
    (hp1 : p ≤ 1) : IsProbabilityMeasure (negativeBinomialMeasure r p) :=
  TauCeti.Probability.isProbabilityMeasure_negativeBinomialMeasure hr hp hp1

/-- The support. -/
theorem negativeBinomialMeasure_singleton_ne_zero_iff {r p : ℝ} (hr : 0 ≤ r) (hp : 0 < p)
    (hp1 : p ≤ 1) (k : ℕ) :
    negativeBinomialMeasure r p {k} ≠ 0 ↔ k = 0 ∨ (0 < r ∧ p < 1) :=
  TauCeti.Probability.negativeBinomialMeasure_singleton_ne_zero_iff hr hp hp1 k

/-- Convolution for `0 ≤ r`, `0 ≤ s` (Tau Ceti needs no hypothesis on `p`). -/
theorem negativeBinomialMeasure_conv {r s p : ℝ} (hr : 0 ≤ r) (hs : 0 ≤ s) :
    negativeBinomialMeasure r p ∗ negativeBinomialMeasure s p =
      negativeBinomialMeasure (r + s) p :=
  TauCeti.Probability.negativeBinomialMeasure_conv_negativeBinomialMeasure hr hs

/-- The pgf integrand is integrable exactly when `|(1 - p) t| < 1`. -/
theorem integrable_pow_negativeBinomialMeasure_iff {r p : ℝ} (hr : 0 < r) (hp : 0 < p)
    (hp1 : p ≤ 1) (t : ℝ) :
    Integrable (fun k : ℕ => t ^ k) (negativeBinomialMeasure r p) ↔ |(1 - p) * t| < 1 :=
  TauCeti.Probability.integrable_pow_negativeBinomialMeasure_iff hr hp hp1 t

/-- The pgf on its domain. -/
theorem pgf_negativeBinomialMeasure {r p t : ℝ} (hr : 0 < r) (hp : 0 < p) (hp1 : p ≤ 1)
    (ht : |(1 - p) * t| < 1) :
    pgf id (negativeBinomialMeasure r p) t = Real.rpow (p / (1 - (1 - p) * t)) r :=
  TauCeti.Probability.pgf_negativeBinomialMeasure hr hp hp1 ht

/-- At `r = 0` the pgf is `1` for every `t`. -/
theorem pgf_negativeBinomialMeasure_zero {p : ℝ} (hp : 0 < p) (hp1 : p ≤ 1) (t : ℝ) :
    pgf id (negativeBinomialMeasure 0 p) t = 1 := by
  rw [TauCeti.Probability.pgf_negativeBinomialMeasure_zero, ]
  simp [hp, hp1]

/-- Mean `r (1 - p) / p` of the cast law. -/
theorem integral_id_map_cast_negativeBinomialMeasure {r p : ℝ} (hr : 0 < r) (hp : 0 < p)
    (hp1 : p ≤ 1) :
    ∫ x, x ∂((negativeBinomialMeasure r p).map (Nat.cast : ℕ → ℝ)) = r * (1 - p) / p :=
  TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure hr.le hp hp1

/-- Variance `r (1 - p) / p²` of the cast law. -/
theorem variance_id_map_cast_negativeBinomialMeasure {r p : ℝ} (hr : 0 < r) (hp : 0 < p)
    (hp1 : p ≤ 1) :
    variance id ((negativeBinomialMeasure r p).map (Nat.cast : ℕ → ℝ)) =
      r * (1 - p) / p ^ 2 :=
  TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure hr.le hp hp1

/-- The exponential-integrability domain of the cast law. -/
theorem integrableExpSet_id_map_cast_negativeBinomialMeasure {r p : ℝ} (hr : 0 < r)
    (hp : 0 < p) (hp1 : p ≤ 1) :
    integrableExpSet id ((negativeBinomialMeasure r p).map (Nat.cast : ℕ → ℝ)) =
      {t | (1 - p) * Real.exp t < 1} :=
  TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure hr hp hp1

/-- The mgf of the cast law on its domain. -/
theorem mgf_id_map_cast_negativeBinomialMeasure {r p t : ℝ} (hr : 0 < r) (hp : 0 < p)
    (hp1 : p ≤ 1) (ht : (1 - p) * Real.exp t < 1) :
    mgf id ((negativeBinomialMeasure r p).map (Nat.cast : ℕ → ℝ)) t =
      Real.rpow (p / (1 - (1 - p) * Real.exp t)) r :=
  TauCeti.Probability.mgf_id_map_cast_negativeBinomialMeasure hr.le hp hp1 ht

/-- The cgf of the cast law on its domain. -/
theorem cgf_id_map_cast_negativeBinomialMeasure {r p t : ℝ} (hr : 0 < r) (hp : 0 < p)
    (hp1 : p ≤ 1) (ht : (1 - p) * Real.exp t < 1) :
    cgf id ((negativeBinomialMeasure r p).map (Nat.cast : ℕ → ℝ)) t =
      Real.log (Real.rpow (p / (1 - (1 - p) * Real.exp t)) r) :=
  TauCeti.Probability.cgf_id_map_cast_negativeBinomialMeasure hr.le hp hp1 ht

/-- The characteristic function of the cast law. -/
theorem charFun_map_cast_negativeBinomialMeasure {r p : ℝ} (hr : 0 < r) (hp : 0 < p)
    (hp1 : p ≤ 1) (t : ℝ) :
    charFun ((negativeBinomialMeasure r p).map (Nat.cast : ℕ → ℝ)) t =
      ((p : ℂ) / (1 - (1 - (p : ℂ)) * Complex.exp (Complex.I * t))) ^ (r : ℂ) :=
  TauCeti.Probability.charFun_map_cast_negativeBinomialMeasure hr.le hp hp1 t

/-- The native cumulative mass for `0 < r`. -/
theorem negativeBinomialMeasure_real_le {r p : ℝ} (hr : 0 < r) (hp : 0 < p) (hp1 : p ≤ 1)
    (k : ℕ) :
    (negativeBinomialMeasure r p).real {j | j ≤ k} = regularizedIncompleteBeta r (k + 1) p :=
  TauCeti.Probability.negativeBinomialMeasure_real_Iic hr hp hp1 k

/-- The cast-law cdf, through the floor of its argument. -/
theorem cdf_map_cast_negativeBinomialMeasure {r p x : ℝ} (hr : 0 < r) (hp : 0 < p)
    (hp1 : p ≤ 1) (hx : 0 ≤ x) :
    cdf ((negativeBinomialMeasure r p).map (Nat.cast : ℕ → ℝ)) x =
      regularizedIncompleteBeta r (⌊x⌋₊ + 1) p :=
  TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure hr hp hp1 hx

/-- `r = 0`: the Dirac cumulative mass. -/
theorem negativeBinomialMeasure_zero_real_le {p : ℝ} (hp : 0 < p) (hp1 : p ≤ 1) (k : ℕ) :
    (negativeBinomialMeasure 0 p).real {j | j ≤ k} = 1 :=
  TauCeti.Probability.negativeBinomialMeasure_real_Iic_zero hp hp1 k

/-- `r = 0`: mean `0`. -/
theorem integral_id_map_cast_negativeBinomialMeasure_zero (p : ℝ) :
    ∫ x, x ∂((negativeBinomialMeasure 0 p).map (Nat.cast : ℕ → ℝ)) = 0 :=
  TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure_zero p

/-- `r = 0`: variance `0`. -/
theorem variance_id_map_cast_negativeBinomialMeasure_zero (p : ℝ) :
    variance id ((negativeBinomialMeasure 0 p).map (Nat.cast : ℕ → ℝ)) = 0 :=
  TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure_zero p

/-- `r = 0`: `integrableExpSet id = univ`. -/
theorem integrableExpSet_id_map_cast_negativeBinomialMeasure_zero (p : ℝ) :
    integrableExpSet id ((negativeBinomialMeasure 0 p).map (Nat.cast : ℕ → ℝ)) = Set.univ :=
  TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure_zero p

/-- `r = 0`: mgf identically `1`. -/
theorem mgf_id_map_cast_negativeBinomialMeasure_zero {p : ℝ} (hp : 0 < p) (hp1 : p ≤ 1)
    (t : ℝ) : mgf id ((negativeBinomialMeasure 0 p).map (Nat.cast : ℕ → ℝ)) t = 1 := by
  rw [TauCeti.Probability.mgf_id_map_cast_negativeBinomialMeasure_zero, ]
  simp [hp, hp1]

/-- `r = 0`: characteristic function identically `1`. -/
theorem charFun_map_cast_negativeBinomialMeasure_zero {p : ℝ} (hp : 0 < p) (hp1 : p ≤ 1)
    (t : ℝ) : charFun ((negativeBinomialMeasure 0 p).map (Nat.cast : ℕ → ℝ)) t = 1 := by
  rw [TauCeti.Probability.charFun_map_cast_negativeBinomialMeasure_zero, ]
  simp [hp, hp1]

/-- `r = 0`: cgf identically `0`. -/
theorem cgf_id_map_cast_negativeBinomialMeasure_zero (p t : ℝ) :
    cgf id ((negativeBinomialMeasure 0 p).map (Nat.cast : ℕ → ℝ)) t = 0 :=
  TauCeti.Probability.cgf_id_map_cast_negativeBinomialMeasure_zero p t

/-- Parameter measurability. -/
theorem measurable_negativeBinomialMeasure :
    Measurable fun q : ℝ × ℝ => negativeBinomialMeasure q.1 q.2 :=
  TauCeti.Probability.measurable_negativeBinomialMeasure

/-! ### Hypergeometric -/

/-- The weighted Dirac sum in the valid range. -/
theorem hypergeometricMeasure_eq_sum_dirac {N K n : ℕ} (hK : K ≤ N) (hn : n ≤ N) :
    hypergeometricMeasure N K n =
      ∑ k ∈ Finset.range (n + 1), hypergeometricWeight N K n k • Measure.dirac k :=
  TauCeti.Probability.hypergeometricMeasure_eq_sum_dirac hK hn

/-- The coefficient for `k ≤ n`, an `ℝ≥0∞` ratio of `Nat.choose` values. -/
theorem hypergeometricWeight_of_le {N K n k : ℕ} (hkn : k ≤ n) :
    hypergeometricWeight N K n k =
      (K.choose k : ℝ≥0∞) * ((N - K).choose (n - k) : ℝ≥0∞) / (N.choose n : ℝ≥0∞) :=
  TauCeti.Probability.hypergeometricWeight_of_le hkn

/-- The coefficient vanishes for `n < k`. -/
theorem hypergeometricWeight_of_lt {N K n k : ℕ} (hkn : n < k) :
    hypergeometricWeight N K n k = 0 :=
  TauCeti.Probability.hypergeometricWeight_of_not_le (not_le.2 hkn)

/-- The zero measure outside the valid range. -/
theorem hypergeometricMeasure_of_invalid {N K n : ℕ} (h : ¬ (K ≤ N ∧ n ≤ N)) :
    hypergeometricMeasure N K n = 0 :=
  TauCeti.Probability.hypergeometricMeasure_eq_zero_of_invalid h

/-- Probability measure in the valid range. -/
theorem isProbabilityMeasure_hypergeometricMeasure {N K n : ℕ} (hK : K ≤ N) (hn : n ≤ N) :
    IsProbabilityMeasure (hypergeometricMeasure N K n) :=
  TauCeti.Probability.isProbabilityMeasure_hypergeometricMeasure hK hn

/-- The exact support. -/
theorem hypergeometricMeasure_singleton_ne_zero_iff {N K n : ℕ} (hK : K ≤ N) (hn : n ≤ N)
    (k : ℕ) : hypergeometricMeasure N K n {k} ≠ 0 ↔ k ≤ K ∧ k ≤ n ∧ n - k ≤ N - K :=
  TauCeti.Probability.hypergeometricMeasure_singleton_ne_zero_iff hK hn k

/-- The singleton mass. -/
theorem hypergeometricMeasure_singleton {N K n : ℕ} (hK : K ≤ N) (hn : n ≤ N) (k : ℕ) :
    hypergeometricMeasure N K n {k} = hypergeometricWeight N K n k :=
  TauCeti.Probability.hypergeometricMeasure_singleton hK hn k

/-- Mean `n K / N` for `0 < N`, which at `N = 1` and `K = n = 1` is `1`. -/
theorem integral_id_map_cast_hypergeometricMeasure {N K n : ℕ} (hK : K ≤ N) (hn : n ≤ N)
    (hN : 0 < N) :
    ∫ x, x ∂((hypergeometricMeasure N K n).map (Nat.cast : ℕ → ℝ)) = (n : ℝ) * K / N :=
  TauCeti.Probability.integral_id_map_cast_hypergeometricMeasure hK hn hN

/-- Variance for `1 < N`. -/
theorem variance_id_map_cast_hypergeometricMeasure {N K n : ℕ} (hK : K ≤ N) (hn : n ≤ N)
    (hN : 1 < N) :
    variance id ((hypergeometricMeasure N K n).map (Nat.cast : ℕ → ℝ)) =
      (n : ℝ) * ((K : ℝ) / N) * (1 - (K : ℝ) / N) * (((N : ℝ) - n) / ((N : ℝ) - 1)) :=
  TauCeti.Probability.variance_id_map_cast_hypergeometricMeasure hK hn hN

/-- `N = 0`: mean zero. -/
theorem integral_id_map_cast_hypergeometricMeasure_zero :
    ∫ x, x ∂((hypergeometricMeasure 0 0 0).map (Nat.cast : ℕ → ℝ)) = 0 :=
  TauCeti.Probability.integral_id_map_cast_hypergeometricMeasure_zero

/-- `N = 0`: variance zero. -/
theorem variance_id_map_cast_hypergeometricMeasure_zero :
    variance id ((hypergeometricMeasure 0 0 0).map (Nat.cast : ℕ → ℝ)) = 0 :=
  TauCeti.Probability.variance_id_map_cast_hypergeometricMeasure_zero

/-- `N = 1`: the mean at `K = n = 1` is `1`. -/
example : ∫ x, x ∂((hypergeometricMeasure 1 1 1).map (Nat.cast : ℕ → ℝ)) = 1 := by
  rw [TauCeti.Probability.integral_id_map_cast_hypergeometricMeasure
    (N := 1) (K := 1) (n := 1) le_rfl le_rfl one_pos]
  simp

/-- `N = 1`: variance zero. -/
theorem variance_id_map_cast_hypergeometricMeasure_one {K n : ℕ} (hK : K ≤ 1) (hn : n ≤ 1) :
    variance id ((hypergeometricMeasure 1 K n).map (Nat.cast : ℕ → ℝ)) = 0 :=
  TauCeti.Probability.variance_id_map_cast_hypergeometricMeasure_of_population_one hK hn

/-- The cumulative mass as a finite sum of the singleton masses over `j ≤ k`. -/
theorem hypergeometricMeasure_real_le {N K n : ℕ} (k : ℕ) :
    (hypergeometricMeasure N K n).real {j | j ≤ k} =
      ∑ j ∈ Finset.Iic k, (hypergeometricMeasure N K n).real {j} :=
  TauCeti.Probability.hypergeometricMeasure_real_Iic k

/-- `integrableExpSet id = univ`. -/
theorem integrableExpSet_id_map_cast_hypergeometricMeasure (N K n : ℕ) :
    integrableExpSet id ((hypergeometricMeasure N K n).map (Nat.cast : ℕ → ℝ)) = Set.univ :=
  TauCeti.Probability.integrableExpSet_id_map_cast_hypergeometricMeasure N K n

/-- The mgf as a finite sum over `j ≤ n`. -/
theorem mgf_id_map_cast_hypergeometricMeasure {N K n : ℕ} (hK : K ≤ N) (hn : n ≤ N) (t : ℝ) :
    mgf id ((hypergeometricMeasure N K n).map (Nat.cast : ℕ → ℝ)) t =
      ∑ k ∈ Finset.range (n + 1),
        (hypergeometricWeight N K n k).toReal * Real.exp (t * (k : ℝ)) :=
  TauCeti.Probability.mgf_id_map_cast_hypergeometricMeasure hK hn t

/-- The cgf, the real logarithm of the mgf. -/
theorem cgf_id_map_cast_hypergeometricMeasure {N K n : ℕ} (hK : K ≤ N) (hn : n ≤ N) (t : ℝ) :
    cgf id ((hypergeometricMeasure N K n).map (Nat.cast : ℕ → ℝ)) t =
      Real.log (∑ k ∈ Finset.range (n + 1),
        (hypergeometricWeight N K n k).toReal * Real.exp (t * (k : ℝ))) :=
  TauCeti.Probability.cgf_id_map_cast_hypergeometricMeasure hK hn t

/-- The characteristic function as a finite sum over `j ≤ n`. -/
theorem charFun_map_cast_hypergeometricMeasure {N K n : ℕ} (hK : K ≤ N) (hn : n ≤ N)
    (t : ℝ) :
    charFun ((hypergeometricMeasure N K n).map (Nat.cast : ℕ → ℝ)) t =
      ∑ k ∈ Finset.range (n + 1),
        (hypergeometricWeight N K n k).toReal * Complex.exp (((k : ℝ) * t) * Complex.I) :=
  TauCeti.Probability.charFun_map_cast_hypergeometricMeasure hK hn t

/-- Symmetry in sample size and marked count. -/
theorem hypergeometricMeasure_comm (N K n : ℕ) :
    hypergeometricMeasure N K n = hypergeometricMeasure N n K :=
  TauCeti.Probability.hypergeometricMeasure_comm N K n

/-- The binomial limit, in the README's form. -/
theorem tendsto_hypergeometricMeasure_binomial (p : I) (K : ℕ → ℕ) (hK : ∀ N, K N ≤ N)
    (hKp : Tendsto (fun N => (K N : ℝ) / N) atTop (𝓝 (p : ℝ))) (n k : ℕ) :
    Tendsto (fun N => ENNReal.toReal ((hypergeometricMeasure N (K N) n) {k})) atTop
      (𝓝 (ENNReal.toReal ((binomial n p) {k}))) :=
  TauCeti.Probability.tendsto_hypergeometricMeasure_real_singleton p K
    (Eventually.of_forall hK) hKp n k

/-- Parameter measurability. -/
theorem measurable_hypergeometricMeasure :
    Measurable fun p : ℕ × ℕ × ℕ => hypergeometricMeasure p.1 p.2.1 p.2.2 :=
  TauCeti.Probability.measurable_hypergeometricMeasure

/-! ### Completion checks -/

/-- `chiSquaredMeasure 2 = expMeasure (1/2)`. -/
example : chiSquaredMeasure 2 = expMeasure (1 / 2) :=
  TauCeti.Probability.chiSquaredMeasure_two

/-- `studentTMeasure 1 = cauchyMeasure 0 1`. -/
example : studentTMeasure 1 = cauchyMeasure 0 1 :=
  TauCeti.Probability.studentTMeasure_one

/-- The Weibull cdf at `k = 1` recovers the exponential cdf. -/
example {lam : ℝ} (x : ℝ) :
    cdf (weibullMeasure 1 lam) x = cdf (expMeasure lam⁻¹) x := by
  rw [TauCeti.Probability.weibullMeasure_one_eq_expMeasure]

end Layer3

end Layers23

noncomputable section Layers45

open MeasureTheory ProbabilityTheory TauCeti TauCeti.Probability Convexity
open scoped ENNReal NNReal RealInnerProductSpace MatrixOrder

/-! ## Layer 4: relationships among distributions -/

section Layer4

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-- **Layer 4, item 1.** The square of a standard Gaussian is chi-squared with one degree of
freedom. -/
theorem map_sq_gaussianReal :
    (gaussianReal 0 1).map (fun x : ℝ ↦ x ^ 2) = chiSquaredMeasure 1 :=
  TauCeti.Probability.gaussianReal_map_sq

/-- **Layer 4, item 1.** A sum of `k` squared i.i.d. standard Gaussians is chi-squared with `k`
degrees of freedom; at `k = 0` both sides are `Measure.dirac 0`. -/
theorem hasLaw_sum_sq_gaussian {k : ℕ} {X : Fin k → Ω → ℝ} (hindep : iIndepFun X P)
    (hlaw : ∀ i, HasLaw (X i) (gaussianReal 0 1) P) :
    HasLaw (fun ω ↦ ∑ i, X i ω ^ 2) (chiSquaredMeasure k) P := by
  simpa using TauCeti.Probability.iIndepFun.hasLaw_sum_sq_gaussian hindep hlaw

/-- **Layer 4, item 2.** Student's t as a Gaussian over the root of a scaled chi-squared. -/
theorem hasLaw_studentT_of_gaussian_chiSquared {ν : ℝ} {Z V : Ω → ℝ} (hν : 0 < ν)
    (hZV : IndepFun Z V P) (hZ : HasLaw Z (gaussianReal 0 1) P)
    (hV : HasLaw V (chiSquaredMeasure ν) P) :
    HasLaw (fun ω ↦ Z ω / √(V ω / ν)) (studentTMeasure ν) P :=
  TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared hν hZV hZ hV

/-- **Layer 4, item 2.** Fisher's F as a ratio of two scaled chi-squares. -/
theorem hasLaw_fisherSnedecor_of_chiSquared {m n : ℝ} {U V : Ω → ℝ} (hm : 0 < m) (hn : 0 < n)
    (hUV : IndepFun U V P) (hU : HasLaw U (chiSquaredMeasure m) P)
    (hV : HasLaw V (chiSquaredMeasure n) P) :
    HasLaw (fun ω ↦ (U ω / m) / (V ω / n)) (fisherSnedecorMeasure m n) P :=
  TauCeti.Probability.hasLaw_fisherSnedecor_of_chiSquared hm hn hUV hU hV

/-- **Layer 4, item 2.** The ratio of two independent standard Gaussians is standard Cauchy. -/
theorem hasLaw_ratio_gaussian_cauchy {Z₁ Z₂ : Ω → ℝ} (hZ : IndepFun Z₁ Z₂ P)
    (hZ₁ : HasLaw Z₁ (gaussianReal 0 1) P) (hZ₂ : HasLaw Z₂ (gaussianReal 0 1) P) :
    HasLaw (fun ω ↦ Z₁ ω / Z₂ ω) (cauchyMeasure 0 1) P :=
  TauCeti.Probability.hasLaw_ratio_gaussian_cauchy hZ hZ₁ hZ₂

/-- **Layer 4, item 3.** The joint product-pushforward Gamma-Beta theorem. -/
theorem map_div_add_prod_gammaMeasure {a b r : ℝ} (ha : 0 < a) (hb : 0 < b) (hr : 0 < r) :
    ((gammaMeasure a r).prod (gammaMeasure b r)).map
        (fun z ↦ (z.1 / (z.1 + z.2), z.1 + z.2)) =
      (betaMeasure a b).prod (gammaMeasure (a + b) r) :=
  TauCeti.Probability.map_div_add_prod_gammaMeasure ha hb hr

/-- **Gamma-Beta change of variables.** The coordinate map `(u, s) ↦ (u s, (1 - u) s)` sends the
target region `(0, 1) × (0, ∞)` injectively onto the source region `(0, ∞) × (0, ∞)`, with
derivative determinant `s`, and transports Lebesgue measure accordingly. -/
theorem betaGammaMap_changeOfVariables :
    gammaBetaTarget = Set.Ioo 0 1 ×ˢ Set.Ioi 0 ∧ gammaBetaSource = Set.Ioi 0 ×ˢ Set.Ioi 0 ∧
      (∀ z, betaGammaMap z = (z.1 * z.2, (1 - z.1) * z.2)) ∧
      betaGammaMap '' gammaBetaTarget = gammaBetaSource ∧
      Set.InjOn betaGammaMap gammaBetaTarget ∧
      (∀ z, HasFDerivAt betaGammaMap (fderivBetaGammaMap z) z ∧
        (fderivBetaGammaMap z).det = z.2) ∧
      Measure.map betaGammaMap
          ((volume.restrict gammaBetaTarget).withDensity fun z ↦ ENNReal.ofReal z.2) =
        volume.restrict gammaBetaSource :=
  ⟨rfl, rfl, fun _ ↦ rfl, betaGammaMap_image_target, betaGammaMap_injOn,
    fun z ↦ ⟨hasFDerivAt_betaGammaMap z, det_fderivBetaGammaMap z⟩, map_betaGammaMap_withDensity⟩

/-- **Layer 4, item 3.** The Beta marginal of the Gamma ratio. -/
theorem map_div_add_gammaMeasure {a b r : ℝ} (ha : 0 < a) (hb : 0 < b) (hr : 0 < r) :
    ((gammaMeasure a r).prod (gammaMeasure b r)).map (fun z ↦ z.1 / (z.1 + z.2)) =
      betaMeasure a b :=
  TauCeti.Probability.map_div_add_gammaMeasure ha hb hr

/-- **Layer 4, item 3.** The Gamma ratio is independent of the sum. -/
theorem indepFun_div_add_gammaMeasure {a b r : ℝ} (ha : 0 < a) (hb : 0 < b) (hr : 0 < r) :
    IndepFun (fun z : ℝ × ℝ ↦ z.1 / (z.1 + z.2)) (fun z ↦ z.1 + z.2)
      ((gammaMeasure a r).prod (gammaMeasure b r)) :=
  TauCeti.Probability.indepFun_div_add_gammaMeasure ha hb hr

/-- **Layer 4, item 3.** The `HasLaw` form for independent Gamma variables. -/
theorem hasLaw_div_add_prod_gammaMeasure_of_indepFun {X Y : Ω → ℝ} {a b r : ℝ} (ha : 0 < a)
    (hb : 0 < b) (hr : 0 < r) (hXY : IndepFun X Y P) (hX : HasLaw X (gammaMeasure a r) P)
    (hY : HasLaw Y (gammaMeasure b r) P) :
    HasLaw (fun ω ↦ (X ω / (X ω + Y ω), X ω + Y ω))
      ((betaMeasure a b).prod (gammaMeasure (a + b) r)) P :=
  TauCeti.Probability.hasLaw_div_add_prod_gammaMeasure_of_indepFun ha hb hr hXY hX hY

/-- **Layer 4, item 4.** The difference of i.i.d. `expMeasure b⁻¹` variables is Laplace. -/
theorem hasLaw_sub_expMeasure {X Y : Ω → ℝ} {b : ℝ} (hb : 0 < b) (hXY : IndepFun X Y P)
    (hX : HasLaw X (expMeasure b⁻¹) P) (hY : HasLaw Y (expMeasure b⁻¹) P) :
    HasLaw (fun ω ↦ X ω - Y ω) (laplaceMeasure 0 b) P :=
  TauCeti.Probability.IndepFun.hasLaw_sub_expMeasure hXY hb hX hY

/-- **Layer 4, item 4.** A sum of `n` i.i.d. geometric variables is negative binomial, including
`n = 0` and `p = 1`. -/
theorem hasLaw_sum_geometricMeasure {n : ℕ} {X : Fin n → Ω → ℕ} {p : unitInterval}
    (hp : p ≠ 0) (hindep : iIndepFun X P) (hlaw : ∀ i, HasLaw (X i) (geometricMeasure p) P) :
    HasLaw (fun ω ↦ ∑ i, X i ω) (negativeBinomialMeasure (n : ℝ) (p : ℝ)) P := by
  simpa using TauCeti.Probability.iIndepFun.hasLaw_sum_geometricMeasure hindep hp hlaw

/-- **Layer 4, item 4.** A sum of `n > 0` i.i.d. exponentials is Erlang. -/
theorem hasLaw_sum_expMeasure {n : ℕ} (hn : 0 < n) {X : Fin n → Ω → ℝ} {r : ℝ} (hr : 0 < r)
    (hindep : iIndepFun X P) (hlaw : ∀ i, HasLaw (X i) (expMeasure r) P) :
    HasLaw (fun ω ↦ ∑ i, X i ω) (gammaMeasure (n : ℝ) r) P := by
  have : Nonempty (Fin n) := ⟨⟨0, hn⟩⟩
  simpa using TauCeti.Probability.iIndepFun.hasLaw_sum_expMeasure hindep hr hlaw

/-- **Layer 4, item 5.** A Gamma mixture of Poisson laws is negative binomial. -/
theorem bind_gammaMeasure_poissonMeasure {r p : ℝ} (hr : 0 < r) (hp : 0 < p) (hp1 : p < 1) :
    (gammaMeasure r (p / (1 - p))).bind (fun lam ↦ poissonMeasure (Real.toNNReal lam)) =
      negativeBinomialMeasure r p :=
  TauCeti.Probability.bind_gammaMeasure_poissonMeasure hr hp hp1

/-- **Layer 4, item 6.** The Layer 1 minimum of independent exponentials. -/
example {r s : ℝ} (hr : 0 < r) (hs : 0 < s) :
    ((expMeasure r).prod (expMeasure s)).map (fun z ↦ min z.1 z.2) = expMeasure (r + s) :=
  map_min_expMeasure hr hs

section MinMax

variable {ι : Type*} [Fintype ι] [Nonempty ι] [IsProbabilityMeasure P] {μ : Measure ℝ}
  {X : ι → Ω → ℝ}

omit [IsProbabilityMeasure P] [Fintype ι] in
private theorem isProbabilityMeasure_of_iid [IsProbabilityMeasure P]
    (hlaw : ∀ i, HasLaw (X i) μ P) : IsProbabilityMeasure μ :=
  (hlaw (Classical.arbitrary ι)).isProbabilityMeasure_iff.1 inferInstance

/-- **Layer 4, item 6.** The maximum of `d` i.i.d. variables is at most `x` with probability
`(cdf μ x) ^ d`. -/
theorem measureReal_max_le_iid (hindep : iIndepFun X P) (hlaw : ∀ i, HasLaw (X i) μ P)
    (x : ℝ) :
    P.real {ω | (Finset.univ.sup' Finset.univ_nonempty fun i ↦ X i ω) ≤ x} =
      cdf μ x ^ Fintype.card ι :=
  have := isProbabilityMeasure_of_iid hlaw
  TauCeti.Probability.measureReal_setOf_max_le_iid hindep hlaw x

/-- **Layer 4, item 6.** The minimum of `d` i.i.d. variables is at most `x` with probability
`1 - (1 - cdf μ x) ^ d`. -/
theorem measureReal_min_le_iid (hindep : iIndepFun X P) (hlaw : ∀ i, HasLaw (X i) μ P)
    (x : ℝ) :
    P.real {ω | (Finset.univ.inf' Finset.univ_nonempty fun i ↦ X i ω) ≤ x} =
      1 - (1 - cdf μ x) ^ Fintype.card ι :=
  have := isProbabilityMeasure_of_iid hlaw
  TauCeti.Probability.measureReal_setOf_min_le_iid hindep hlaw x

/-- **Layer 4, item 6.** The cdf of the law of the maximum. -/
theorem cdf_max_iid (hindep : iIndepFun X P) (hlaw : ∀ i, HasLaw (X i) μ P) (x : ℝ) :
    cdf (P.map fun ω ↦ Finset.univ.sup' Finset.univ_nonempty fun i ↦ X i ω) x =
      cdf μ x ^ Fintype.card ι :=
  have := isProbabilityMeasure_of_iid hlaw
  TauCeti.Probability.cdf_max_iid hindep hlaw x

/-- **Layer 4, item 6.** The cdf of the law of the minimum. -/
theorem cdf_min_iid (hindep : iIndepFun X P) (hlaw : ∀ i, HasLaw (X i) μ P) (x : ℝ) :
    cdf (P.map fun ω ↦ Finset.univ.inf' Finset.univ_nonempty fun i ↦ X i ω) x =
      1 - (1 - cdf μ x) ^ Fintype.card ι :=
  have := isProbabilityMeasure_of_iid hlaw
  TauCeti.Probability.cdf_min_iid hindep hlaw x

end MinMax

/-- **Layer 4 completion check.** At `ν = 1` the t-ratio and the Cauchy ratio give the same law,
through `studentTMeasure 1 = cauchyMeasure 0 1`. -/
example {Z V : Ω → ℝ} (hZV : IndepFun Z V P) (hZ : HasLaw Z (gaussianReal 0 1) P)
    (hV : HasLaw V (chiSquaredMeasure 1) P) :
    HasLaw (fun ω ↦ Z ω / √(V ω / 1)) (cauchyMeasure 0 1) P := by
  simpa [TauCeti.Probability.studentTMeasure_one] using
    TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared one_pos hZV hZ hV

end Layer4

/-! ## Layer 5: multivariate distributions -/

section Layer5

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

section Gaussian

variable [DecidableEq ι] [DecidableEq κ]

/-! ### Item 1: covariance matrices -/

omit [Fintype ι] [DecidableEq ι] in
/-- `covMatrix` is the matrix of coordinate covariances. -/
theorem covMatrix_apply (μ : Measure (EuclideanSpace ℝ ι)) (i j : ι) :
    covMatrix μ i j = cov[fun z ↦ z i, fun z ↦ z j; μ] :=
  TauCeti.covMatrix_apply μ i j

/-- **Layer 5, item 1.** The covariance matrix of `multivariateGaussian m S` is `S`. -/
theorem covMatrix_multivariateGaussian (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ}
    (hS : S.PosSemidef) : covMatrix (multivariateGaussian m S) = S :=
  TauCeti.Probability.covMatrix_multivariateGaussian m hS

/-- **Layer 5, item 1.** The multivariate Gaussian has an integrable identity. -/
theorem integrable_id_multivariateGaussian (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) :
    Integrable id (multivariateGaussian m S) :=
  IsGaussian.integrable_id

/-- **Layer 5, item 1.** The Bochner mean of `multivariateGaussian m S` is `m` (Mathlib). -/
theorem integral_id_multivariateGaussian (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) :
    ∫ x, x ∂multivariateGaussian m S = m :=
  ProbabilityTheory.integral_id_multivariateGaussian

/-- **Layer 5, item 1.** `covMatrix` represents `covarianceBilin` under `MemLp id 2`. -/
theorem covarianceBilin_eq_covMatrix (μ : Measure (EuclideanSpace ℝ ι)) [IsFiniteMeasure μ]
    (hμ : MemLp id 2 μ) (x y : EuclideanSpace ℝ ι) :
    covarianceBilin μ x y = ⟪x, (covMatrix μ).toEuclideanLin y⟫ :=
  TauCeti.covarianceBilin_eq_covMatrix μ hμ x y

/-! ### Item 2: the multivariate Gaussian density -/

/-- **Layer 5, item 2.** The density formula, with `d = Fintype.card ι`. -/
theorem multivariateGaussianPDFReal_apply (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ)
    (x : EuclideanSpace ℝ ι) :
    multivariateGaussianPDFReal m S x =
      Real.rpow (2 * Real.pi) (-(Fintype.card ι : ℝ) / 2) * Real.rpow S.det (-(1 : ℝ) / 2) *
        Real.exp (-⟪x - m, (S⁻¹).toEuclideanLin (x - m)⟫ / 2) :=
  congrFun (multivariateGaussianPDFReal_def m S) x

/-- **Layer 5, item 2.** The `ℝ≥0∞`-valued density is `ENNReal.ofReal` of the real one. -/
theorem multivariateGaussianPDF_apply (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ)
    (x : EuclideanSpace ℝ ι) :
    multivariateGaussianPDF m S x = ENNReal.ofReal (multivariateGaussianPDFReal m S x) :=
  congrFun (multivariateGaussianPDF_def m S) x

/-- **Layer 5, item 2.** For positive-definite `S`, the law is `volume.withDensity`. -/
theorem multivariateGaussian_eq_withDensity {S : Matrix ι ι ℝ} (hS : S.PosDef)
    (m : EuclideanSpace ℝ ι) :
    multivariateGaussian m S = volume.withDensity (multivariateGaussianPDF m S) :=
  TauCeti.Probability.multivariateGaussian_eq_withDensity hS m

/-- **Layer 5, item 2.** `HasPDF` for a random variable with a positive-definite Gaussian law,
with the stated density. -/
theorem hasPDF_multivariateGaussian {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {X : Ω → EuclideanSpace ℝ ι} {m : EuclideanSpace ℝ ι} {S : Matrix ι ι ℝ} (hS : S.PosDef)
    (hX : HasLaw X (multivariateGaussian m S) P) :
    HasPDF X P ∧ pdf X P =ᵐ[volume] multivariateGaussianPDF m S :=
  ⟨hasPDF_of_hasLaw_multivariateGaussian hS hX,
    pdf_eq_multivariateGaussianPDF_of_hasLaw_multivariateGaussian hS hX⟩

/-- **Layer 5, item 2.** The Radon-Nikodym derivative. -/
theorem rnDeriv_multivariateGaussian {S : Matrix ι ι ℝ} (hS : S.PosDef)
    (m : EuclideanSpace ℝ ι) :
    (multivariateGaussian m S).rnDeriv volume =ᵐ[volume] multivariateGaussianPDF m S :=
  TauCeti.Probability.rnDeriv_multivariateGaussian hS m

/-- **Layer 5, item 2.** When `S` is not positive definite, the law is singular. -/
theorem mutuallySingular_multivariateGaussian_volume {S : Matrix ι ι ℝ} (hS : ¬ S.PosDef)
    (m : EuclideanSpace ℝ ι) :
    multivariateGaussian m S ⟂ₘ (volume : Measure (EuclideanSpace ℝ ι)) :=
  TauCeti.Probability.mutuallySingular_multivariateGaussian_volume hS m

/-! ### Item 3: affine maps, directional transforms, quadratic forms -/

/-- **Layer 5, item 3.** Affine images, with rectangular `L` and positive-semidefinite `S`. -/
theorem map_affine_multivariateGaussian (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ}
    (hS : S.PosSemidef) (L : Matrix κ ι ℝ) (c : EuclideanSpace ℝ κ) :
    (multivariateGaussian m S).map (fun x ↦ L.toEuclideanLin x + c) =
      multivariateGaussian (L.toEuclideanLin m + c) (L * S * L.transpose) :=
  TauCeti.Probability.map_affine_multivariateGaussian m hS L c

/-- **Layer 5, item 3.** The directional exponential-integrability set is `Set.univ`. -/
theorem integrableExpSet_inner_multivariateGaussian (m θ : EuclideanSpace ℝ ι)
    (S : Matrix ι ι ℝ) :
    integrableExpSet (fun x ↦ ⟪θ, x⟫) (multivariateGaussian m S) = Set.univ :=
  TauCeti.Probability.integrableExpSet_inner_multivariateGaussian m θ S

/-- **Layer 5, item 3.** The directional mgf. -/
theorem mgf_inner_multivariateGaussian (m θ : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ}
    (hS : S.PosSemidef) (t : ℝ) :
    mgf (fun x ↦ ⟪θ, x⟫) (multivariateGaussian m S) t =
      Real.exp (t * ⟪θ, m⟫ + t ^ 2 / 2 * ⟪θ, S.toEuclideanLin θ⟫) :=
  TauCeti.Probability.mgf_inner_multivariateGaussian m θ hS t

/-- **Layer 5, item 3.** Coordinate marginals, reusing Mathlib. -/
theorem map_eval_multivariateGaussian (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ}
    (hS : S.PosSemidef) (i : ι) :
    (multivariateGaussian m S).map (fun x ↦ x i) = gaussianReal (m i) (S i i).toNNReal :=
  (measurePreserving_eval_multivariateGaussian hS).map_eq

/-- **Layer 5, item 3.** Sub-family marginals, reusing Mathlib's restriction theorem. -/
theorem map_restrict₂_multivariateGaussian {α : Type*} [DecidableEq α] {I J : Finset α}
    {m : EuclideanSpace ℝ I} {S : Matrix I I ℝ} (hS : S.PosSemidef) (hJI : J ⊆ I) :
    (multivariateGaussian m S).map (EuclideanSpace.restrict₂ hJI) =
      multivariateGaussian (m.restrict₂ hJI)
        (S.submatrix (fun i : J ↦ ⟨i.1, hJI i.2⟩) (fun i : J ↦ ⟨i.1, hJI i.2⟩)) :=
  (measurePreserving_restrict₂_multivariateGaussian hS hJI).map_eq

/-- **Layer 5, item 3, quadratic forms.** The exact exponential-integrability domain. -/
theorem mem_integrableExpSet_inner_toEuclideanLin_multivariateGaussian_iff
    (S : Matrix ι ι ℝ) {Θ : Matrix ι ι ℝ} (hΘ : Θ.IsHermitian) (t : ℝ) :
    t ∈ integrableExpSet (fun x ↦ ⟪x, Θ.toEuclideanLin x⟫) (multivariateGaussian 0 S) ↔
      (1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef :=
  TauCeti.Probability.mem_integrableExpSet_inner_toEuclideanLin_multivariateGaussian_iff S hΘ t

/-- **Layer 5, item 3, quadratic forms.** The mgf on its domain. -/
theorem mgf_inner_toEuclideanLin_multivariateGaussian {S Θ : Matrix ι ι ℝ}
    (hS : S.PosSemidef) (hΘ : Θ.IsHermitian) {t : ℝ}
    (ht : (1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef) :
    mgf (fun x ↦ ⟪x, Θ.toEuclideanLin x⟫) (multivariateGaussian 0 S) t =
      Real.rpow (1 - (2 * t) • (Θ * S)).det (-1 / 2) :=
  TauCeti.Probability.mgf_inner_toEuclideanLin_multivariateGaussian hS hΘ ht

/-- **Layer 5, item 3, quadratic forms.** The cgf is the real logarithm of the mgf value. -/
theorem cgf_inner_toEuclideanLin_multivariateGaussian {S Θ : Matrix ι ι ℝ}
    (hS : S.PosSemidef) (hΘ : Θ.IsHermitian) {t : ℝ}
    (ht : (1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef) :
    cgf (fun x ↦ ⟪x, Θ.toEuclideanLin x⟫) (multivariateGaussian 0 S) t =
      Real.log (Real.rpow (1 - (2 * t) • (Θ * S)).det (-1 / 2)) := by
  rw [cgf, mgf_inner_toEuclideanLin_multivariateGaussian hS hΘ ht]

/-! ### Item 4: conditional Gaussian laws -/

/-- **Layer 5, item 4.** `gaussianCondKernel` is the Schur-complement Gaussian kernel. -/
theorem gaussianCondKernel_apply (m : EuclideanSpace ℝ (ι ⊕ κ))
    (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) (x₂ : EuclideanSpace ℝ κ) :
    m.gaussianCondKernel S x₂ =
      multivariateGaussian
        ((EuclideanSpace.sumEquivProd m).1 +
          (S.submatrix Sum.inl Sum.inr * (S.submatrix Sum.inr Sum.inr)⁻¹).toEuclideanLin
            (x₂ - (EuclideanSpace.sumEquivProd m).2))
        (S.submatrix Sum.inl Sum.inl -
          S.submatrix Sum.inl Sum.inr * (S.submatrix Sum.inr Sum.inr)⁻¹ *
            S.submatrix Sum.inr Sum.inl) := by
  rw [EuclideanSpace.gaussianCondKernel_apply, EuclideanSpace.gaussianCondMean_def,
    Matrix.gaussianCondCov_def]

/-- `gaussianCondKernel` is a Markov kernel. -/
example (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) :
    IsMarkovKernel (m.gaussianCondKernel S) :=
  inferInstance

/-- **Layer 5, item 4.** The Schur-complement formula for the conditional distribution, for
positive-definite `S`. -/
theorem condDistrib_multivariateGaussian {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] (X : Ω → EuclideanSpace ℝ (ι ⊕ κ))
    (m : EuclideanSpace ℝ (ι ⊕ κ)) {S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ}
    (hX : HasLaw X (multivariateGaussian m S) P) (hS : S.PosDef) :
    condDistrib (fun ω ↦ (EuclideanSpace.sumEquivProd (X ω)).1)
        (fun ω ↦ (EuclideanSpace.sumEquivProd (X ω)).2) P
      =ᵐ[P.map (fun ω ↦ (EuclideanSpace.sumEquivProd (X ω)).2)] m.gaussianCondKernel S :=
  TauCeti.Probability.condDistrib_multivariateGaussian X m hX hS.posSemidef
    (hS.submatrix Sum.inr_injective)

/-- **Layer 5, item 4.** Block independence is equivalent to `S₁₂ = 0`. -/
theorem indepFun_blocks_multivariateGaussian_iff (m : EuclideanSpace ℝ (ι ⊕ κ))
    {S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ} (hS : S.PosSemidef) :
    IndepFun (fun x ↦ (EuclideanSpace.sumEquivProd x).1)
        (fun x ↦ (EuclideanSpace.sumEquivProd x).2) (multivariateGaussian m S) ↔
      S.submatrix Sum.inl Sum.inr = 0 :=
  TauCeti.Probability.indepFun_sumEquivProd_multivariateGaussian_iff m hS

end Gaussian

/-! ### Item 5: the multinomial distribution -/

section Multinomial

/-- **Layer 5, item 5.** The multinomial law is a weighted Dirac sum on `ι → ℕ`. -/
theorem multinomialMeasure_eq_sum_dirac [DecidableEq ι] (n : ℕ) (p : StdSimplex ℝ≥0 ι) :
    multinomialMeasure n p =
      ∑ k ∈ Finset.piAntidiag Finset.univ n, multinomialWeight p.weights k • Measure.dirac k := by
  classical
  convert multinomialMeasure_def n p

/-- The multinomial law is a probability measure. -/
theorem isProbabilityMeasure_multinomialMeasure (n : ℕ) (p : StdSimplex ℝ≥0 ι) :
    IsProbabilityMeasure (multinomialMeasure n p) :=
  TauCeti.Probability.isProbabilityMeasure_multinomialMeasure n p

/-- **Layer 5, item 5.** The real singleton mass, zero off the support `∑ i, k i = n`. -/
theorem multinomialMeasure_real_singleton (n : ℕ) (p : StdSimplex ℝ≥0 ι) (k : ι → ℕ) :
    (multinomialMeasure n p).real {k} =
      if ∑ i, k i = n then
        ((n.factorial : ℝ) / ∏ i, ((k i).factorial : ℝ)) * ∏ i, (p.weights i : ℝ) ^ k i
      else 0 :=
  TauCeti.Probability.multinomialMeasure_real_singleton n p k

/-- **Layer 5, item 5.** The support formula. -/
theorem multinomialMeasure_singleton_ne_zero_iff (n : ℕ) (p : StdSimplex ℝ≥0 ι) (k : ι → ℕ) :
    multinomialMeasure n p {k} ≠ 0 ↔ (∑ i, k i = n) ∧ ∀ i, k i ≠ 0 → p.weights i ≠ 0 :=
  TauCeti.Probability.multinomialMeasure_singleton_ne_zero_iff n p k

/-- **Layer 5, item 5.** Native binomial coordinate marginals. -/
theorem map_eval_multinomialMeasure (n : ℕ) (p : StdSimplex ℝ≥0 ι) (i : ι) :
    (multinomialMeasure n p).map (fun k ↦ k i) = Bin(n, p.multinomialCellProbability i) :=
  TauCeti.Probability.map_eval_multinomialMeasure n p i

/-- The cell probability of a multinomial marginal is the coordinate `p i`. -/
example (p : StdSimplex ℝ≥0 ι) (i : ι) :
    (p.multinomialCellProbability i : ℝ) = p.weights i :=
  StdSimplex.coe_multinomialCellProbability p i

/-- **Layer 5, item 5.** Aggregation along any `f : ι → κ` by fibre sums. -/
theorem map_fiberSum_multinomialMeasure [DecidableEq κ] (f : ι → κ) (n : ℕ)
    (p : StdSimplex ℝ≥0 ι) :
    (multinomialMeasure n p).map (fun k j ↦ ∑ i with f i = j, k i) =
      multinomialMeasure n (p.map f) := by
  have hf : (fun (k : ι → ℕ) j ↦ ∑ i with f i = j, k i) = FunOnFinite.map (M := ℕ) f := by
    funext k j
    exact (FunOnFinite.map_apply_apply f k j).symm
  rw [hf, TauCeti.Probability.map_funOnFinite_map_multinomialMeasure]

omit [Fintype ι] in
/-- **Layer 5, item 5.** The cast `multinomialToEuclidean`. -/
theorem multinomialToEuclidean_eq (k : ι → ℕ) :
    multinomialToEuclidean k = (EuclideanSpace.equiv ι ℝ).symm (fun i ↦ (k i : ℝ)) :=
  rfl

/-- **Layer 5, item 5.** The mean of the cast law. -/
theorem integral_id_map_multinomialToEuclidean (n : ℕ) (p : StdSimplex ℝ≥0 ι) :
    ∫ z, z ∂(multinomialMeasure n p).map multinomialToEuclidean =
      (EuclideanSpace.equiv ι ℝ).symm (fun i ↦ (n : ℝ) * p.weights i) :=
  integral_id_map_multinomialToEuclidean_multinomialMeasure n p

/-- **Layer 5, item 5.** The diagonal of the covariance. -/
theorem variance_eval_map_multinomialToEuclidean (n : ℕ) (p : StdSimplex ℝ≥0 ι) (i : ι) :
    Var[fun z : EuclideanSpace ℝ ι ↦ z i; (multinomialMeasure n p).map multinomialToEuclidean] =
      (n : ℝ) * p.weights i * (1 - p.weights i) :=
  variance_eval_map_multinomialToEuclidean_multinomialMeasure n p i

/-- **Layer 5, item 5.** The off-diagonal covariance. -/
theorem covariance_eval_map_multinomialToEuclidean_of_ne (n : ℕ) (p : StdSimplex ℝ≥0 ι)
    {i j : ι} (hij : i ≠ j) :
    cov[fun z : EuclideanSpace ℝ ι ↦ z i, fun z ↦ z j;
        (multinomialMeasure n p).map multinomialToEuclidean] =
      -((n : ℝ) * p.weights i * p.weights j) := by
  rw [covariance_eval_map_multinomialToEuclidean_multinomialMeasure_of_ne n p hij]
  ring

/-- **Layer 5, item 5.** The covariance packaged as `covMatrix`. -/
theorem covMatrix_map_multinomialToEuclidean [DecidableEq ι] (n : ℕ) (p : StdSimplex ℝ≥0 ι) :
    covMatrix ((multinomialMeasure n p).map multinomialToEuclidean) =
      (n : ℝ) • (Matrix.diagonal (fun i ↦ (p.weights i : ℝ)) -
        Matrix.vecMulVec (fun i ↦ (p.weights i : ℝ)) fun i ↦ (p.weights i : ℝ)) :=
  by convert covMatrix_map_multinomialToEuclidean_multinomialMeasure n p

/-- **Layer 5, item 5.** The corresponding `covarianceBilin` theorem. -/
theorem covarianceBilin_map_multinomialToEuclidean [DecidableEq ι] (n : ℕ) (p : StdSimplex ℝ≥0 ι)
    (x y : EuclideanSpace ℝ ι) :
    covarianceBilin ((multinomialMeasure n p).map multinomialToEuclidean) x y =
      ⟪x, ((n : ℝ) • (Matrix.diagonal (fun i ↦ (p.weights i : ℝ)) -
        Matrix.vecMulVec (fun i ↦ (p.weights i : ℝ)) fun i ↦
          (p.weights i : ℝ))).toEuclideanLin y⟫ :=
  by convert covarianceBilin_map_multinomialToEuclidean_multinomialMeasure n p x y

/-- **Layer 5, item 5.** The characteristic function of the cast law. -/
theorem charFun_map_multinomialToEuclidean (n : ℕ) (p : StdSimplex ℝ≥0 ι)
    (t : EuclideanSpace ℝ ι) :
    charFun ((multinomialMeasure n p).map multinomialToEuclidean) t =
      (∑ j, (p.weights j : ℂ) * Complex.exp (Complex.I * (t j : ℂ))) ^ n :=
  charFun_map_multinomialToEuclidean_multinomialMeasure n p t

/-- **Layer 5, item 5.** The directional exponential-integrability set is `Set.univ`. -/
theorem integrableExpSet_inner_multinomial (n : ℕ) (p : StdSimplex ℝ≥0 ι)
    (θ : EuclideanSpace ℝ ι) :
    integrableExpSet (fun x ↦ ⟪θ, x⟫) ((multinomialMeasure n p).map multinomialToEuclidean) =
      Set.univ :=
  TauCeti.Probability.integrableExpSet_inner_multinomial n p θ

/-- **Layer 5, item 5.** The directional mgf. -/
theorem mgf_inner_multinomial (n : ℕ) (p : StdSimplex ℝ≥0 ι) (θ : EuclideanSpace ℝ ι)
    (t : ℝ) :
    mgf (fun x ↦ ⟪θ, x⟫) ((multinomialMeasure n p).map multinomialToEuclidean) t =
      (∑ j, (p.weights j : ℝ) * Real.exp (t * θ j)) ^ n :=
  TauCeti.Probability.mgf_inner_multinomial n p θ t

/-- **Layer 5, item 5.** The directional cgf is the real logarithm of the mgf. -/
theorem cgf_inner_multinomial (n : ℕ) (p : StdSimplex ℝ≥0 ι) (θ : EuclideanSpace ℝ ι)
    (t : ℝ) :
    cgf (fun x ↦ ⟪θ, x⟫) ((multinomialMeasure n p).map multinomialToEuclidean) t =
      Real.log ((∑ j, (p.weights j : ℝ) * Real.exp (t * θ j)) ^ n) :=
  TauCeti.Probability.cgf_inner_multinomial n p θ t

/-- **Layer 5 completion check.** A coordinate of the `Fin 2` multinomial is binomial. -/
example (n : ℕ) (p : StdSimplex ℝ≥0 (Fin 2)) :
    (multinomialMeasure n p).map (fun k ↦ k 0) = Bin(n, p.multinomialCellProbability 0) :=
  TauCeti.Probability.map_eval_multinomialMeasure n p 0

end Multinomial

/-! ### Item 6: the Dirichlet distribution -/

section Dirichlet

/-- **Layer 5, item 6.** The definition: zero unless the parameters are positive, and otherwise
the normalized product of unit-rate Gamma laws, pushed to `EuclideanSpace ℝ ι`. -/
theorem dirichletMeasure_eq [Nonempty ι] (a : ι → ℝ) :
    dirichletMeasure a = if ∀ i, 0 < a i then
      (Measure.pi fun i ↦ gammaMeasure (a i) 1).map dirichletNormalize else 0 := by
  split_ifs with ha
  · exact dirichletMeasure_of_pos ha
  · exact dirichletMeasure_eq_zero_of_invalid (by tauto)

/-- The normalization map divides by the coordinate sum. -/
theorem dirichletNormalize_eq (x : ι → ℝ) :
    dirichletNormalize x = (EuclideanSpace.equiv ι ℝ).symm fun i ↦ x i / ∑ j, x j :=
  rfl

/-- **Layer 5, item 6.** The normalization map returns zero when the sum vanishes. -/
theorem dirichletNormalize_of_sum_eq_zero {x : ι → ℝ} (hx : ∑ i, x i = 0) :
    dirichletNormalize x = 0 :=
  dirichletNormalize_eq_zero_of_sum_eq_zero hx

/-- **Layer 5, item 6.** The zero-sum branch is null under the valid source law. -/
theorem ae_sum_ne_zero_pi_gammaMeasure [Nonempty ι] (a : ι → ℝ) :
    ∀ᵐ x ∂(Measure.pi fun i ↦ gammaMeasure (a i) 1), ∑ i, x i ≠ 0 := by
  filter_upwards [ae_pos_sum_pi_gammaMeasure a fun _ ↦ 1] with x hx using hx.ne'

/-- The Dirichlet law is a probability measure under positive parameters. -/
theorem isProbabilityMeasure_dirichletMeasure [Nonempty ι] {a : ι → ℝ} (ha : ∀ i, 0 < a i) :
    IsProbabilityMeasure (dirichletMeasure a) :=
  TauCeti.Probability.isProbabilityMeasure_dirichletMeasure ha

/-- **Layer 5, item 6.** The support lies in the pullback of the standard simplex. -/
theorem ae_mem_stdSimplex_dirichletMeasure [Nonempty ι] {a : ι → ℝ} (ha : ∀ i, 0 < a i) :
    ∀ᵐ x ∂dirichletMeasure a,
      EuclideanSpace.equiv ι ℝ x ∈ Set.range (fun p : StdSimplex ℝ ι ↦ (p.weights : ι → ℝ)) :=
  TauCeti.Probability.ae_mem_stdSimplex_dirichletMeasure ha

/-- **Layer 5, item 6.** The Bochner mean. -/
theorem integral_id_dirichletMeasure [Nonempty ι] {a : ι → ℝ} (ha : ∀ i, 0 < a i) :
    ∫ x, x ∂dirichletMeasure a = (EuclideanSpace.equiv ι ℝ).symm fun i ↦ a i / ∑ j, a j :=
  TauCeti.Probability.integral_id_dirichletMeasure ha

/-- **Layer 5, item 6.** The variance of a coordinate. -/
theorem variance_eval_dirichletMeasure [Nonempty ι] {a : ι → ℝ} (ha : ∀ i, 0 < a i) (i : ι) :
    Var[fun x ↦ x i; dirichletMeasure a] =
      a i * ((∑ j, a j) - a i) / ((∑ j, a j) ^ 2 * ((∑ j, a j) + 1)) :=
  TauCeti.Probability.variance_eval_dirichletMeasure ha i

/-- **Layer 5, item 6.** The covariance of two distinct coordinates. -/
theorem covariance_eval_dirichletMeasure_of_ne [Nonempty ι] {a : ι → ℝ} (ha : ∀ i, 0 < a i)
    {i j : ι} (hij : i ≠ j) :
    cov[fun x ↦ x i, fun x ↦ x j; dirichletMeasure a] =
      -(a i * a j) / ((∑ k, a k) ^ 2 * ((∑ k, a k) + 1)) :=
  TauCeti.Probability.covariance_eval_dirichletMeasure_of_ne ha hij

/-- **Layer 5, item 6.** Fibre-sum aggregation along a surjection. -/
theorem map_fiberSum_dirichletMeasure [DecidableEq κ] {f : ι → κ} (hf : Function.Surjective f)
    {a : ι → ℝ} (ha : ∀ i, 0 < a i) :
    (dirichletMeasure a).map (fun x ↦ (EuclideanSpace.equiv κ ℝ).symm
        fun j ↦ ∑ i with f i = j, x i) =
      dirichletMeasure fun j ↦ ∑ i with f i = j, a i := by
  have h : (fun x : EuclideanSpace ℝ ι ↦ (EuclideanSpace.equiv κ ℝ).symm
      fun j ↦ ∑ i with f i = j, x i) = euclideanFiberSum f := by
    funext x
    ext j
    simp
  rw [h, map_euclideanFiberSum_dirichletMeasure hf ha]

/-- **Layer 5, item 6.** The coordinate marginal is Beta when `ι` is nontrivial. -/
theorem dirichletMeasure_marginal_beta [DecidableEq ι] [Nontrivial ι] {a : ι → ℝ}
    (ha : ∀ i, 0 < a i) (i : ι) :
    (dirichletMeasure a).map (fun x ↦ EuclideanSpace.equiv ι ℝ x i) =
      betaMeasure (a i) (∑ j with j ≠ i, a j) :=
  map_eval_dirichletMeasure ha i

/-- **Layer 5, item 6.** With one coordinate, the Dirichlet law is a point mass. -/
theorem dirichletMeasure_of_card_eq_one {a : ι → ℝ} (ha : ∀ i, 0 < a i)
    (hcard : Fintype.card ι = 1) :
    dirichletMeasure a = Measure.dirac ((EuclideanSpace.equiv ι ℝ).symm fun _ ↦ 1) :=
  dirichletMeasure_eq_dirac_of_card_eq_one ha hcard

/-- **Layer 5, item 6.** The chart reconstruction keeps the coordinates away from `i₀` and sets
coordinate `i₀` to `1 - ∑ j, x j`. -/
theorem dirichletChart_spec [DecidableEq ι] (i₀ : ι) (x : {i // i ≠ i₀} → ℝ) :
    dirichletChart i₀ x i₀ = 1 - ∑ j, x j ∧ ∀ j : {i // i ≠ i₀}, dirichletChart i₀ x j = x j :=
  ⟨dirichletChart_apply_self i₀ x, dirichletChart_apply_coe i₀ x⟩

/-- **Layer 5, item 6.** The real chart density. -/
theorem dirichletChartPDFReal_eq [DecidableEq ι] (a : ι → ℝ) (i₀ : ι)
    (x : {i // i ≠ i₀} → ℝ) :
    dirichletChartPDFReal a i₀ x =
      if (∀ j, 0 < x j) ∧ ∑ j, x j < 1 then
        (Real.Gamma (∑ i, a i) / ∏ i, Real.Gamma (a i)) *
          (∏ j : {i // i ≠ i₀}, Real.rpow (x j) (a j - 1)) *
            Real.rpow (1 - ∑ j, x j) (a i₀ - 1)
      else 0 := by
  simp only [dirichletChartPDFReal, mem_dirichletChartRegion_iff, Real.rpow_eq_pow]

/-- **Layer 5, item 6.** The `ℝ≥0∞`-valued chart density. -/
theorem dirichletChartPDF_eq [DecidableEq ι] (a : ι → ℝ) (i₀ : ι)
    (x : {i // i ≠ i₀} → ℝ) :
    dirichletChartPDF a i₀ x = ENNReal.ofReal (dirichletChartPDFReal a i₀ x) :=
  dirichletChartPDF_eq_ofReal a i₀ x

/-- **Layer 5, item 6.** The Dirichlet law is the pushforward of the chart density along the
reconstruction map; no ambient density is claimed. -/
theorem dirichletMeasure_eq_map_withDensity_dirichletChartPDF [DecidableEq ι] {a : ι → ℝ}
    (ha : ∀ i, 0 < a i) (i₀ : ι) :
    dirichletMeasure a =
      ((volume : Measure ({i // i ≠ i₀} → ℝ)).withDensity (dirichletChartPDF a i₀)).map
        (dirichletChart i₀) :=
  TauCeti.Probability.dirichletMeasure_eq_map_withDensity_dirichletChartPDF ha i₀

/-- **Dirichlet normalization change of variables.** The scaling map
`(s, x) ↦ (s (1 - ∑ j, x j), s x)` sends the source region (a positive total and a point of the
open chart region) injectively onto the open positive orthant, with derivative determinant
`s ^ card J`, and transports Lebesgue measure accordingly. -/
theorem dirichletUnchart_changeOfVariables [DecidableEq ι] (i₀ : ι) :
    dirichletUnchartSource i₀ = Set.Ioi 0 ×ˢ dirichletChartRegion i₀ ∧
      dirichletUnchartTarget i₀ = Set.Ioi 0 ×ˢ {y | ∀ j, 0 < y j} ∧
      (∀ z, dirichletUnchart i₀ z = (z.1 * (1 - ∑ j, z.2 j), fun j ↦ z.1 * z.2 j)) ∧
      dirichletUnchart i₀ '' dirichletUnchartSource i₀ = dirichletUnchartTarget i₀ ∧
      Set.InjOn (dirichletUnchart i₀) (dirichletUnchartSource i₀) ∧
      (∀ z, (fderiv ℝ (dirichletUnchart i₀) z).det = z.1 ^ Fintype.card {i // i ≠ i₀}) ∧
      Measure.map (dirichletUnchart i₀)
          ((volume.restrict (dirichletUnchartSource i₀)).withDensity
            fun z ↦ ENNReal.ofReal (z.1 ^ Fintype.card {i // i ≠ i₀})) =
        volume.restrict (dirichletUnchartTarget i₀) :=
  ⟨rfl, rfl, fun _ ↦ rfl, dirichletUnchart_image_source i₀, dirichletUnchart_injOn i₀,
    det_fderiv_dirichletUnchart i₀, map_dirichletUnchart_withDensity i₀⟩

/-- **Layer 5, item 6.** The covariance packaged as `covMatrix`. -/
theorem covMatrix_dirichletMeasure [DecidableEq ι] [Nonempty ι] {a : ι → ℝ} (ha : ∀ i, 0 < a i) :
    covMatrix (dirichletMeasure a) =
      ((∑ k, a k) ^ 2 * ((∑ k, a k) + 1))⁻¹ •
        ((∑ k, a k) • Matrix.diagonal a - Matrix.vecMulVec a a) :=
  by convert TauCeti.Probability.covMatrix_dirichletMeasure ha

/-- **Layer 5, item 6.** The corresponding `covarianceBilin` theorem. -/
theorem covarianceBilin_dirichletMeasure [DecidableEq ι] [Nonempty ι] {a : ι → ℝ}
    (ha : ∀ i, 0 < a i)
    (x y : EuclideanSpace ℝ ι) :
    covarianceBilin (dirichletMeasure a) x y =
      ⟪x, (((∑ k, a k) ^ 2 * ((∑ k, a k) + 1))⁻¹ •
        ((∑ k, a k) • Matrix.diagonal a - Matrix.vecMulVec a a)).toEuclideanLin y⟫ :=
  by convert TauCeti.Probability.covarianceBilin_dirichletMeasure ha x y

/-- **Layer 5, item 6.** The directional exponential-integrability set is `Set.univ`. -/
theorem integrableExpSet_inner_dirichletMeasure [Nonempty ι] {a : ι → ℝ}
    (θ : EuclideanSpace ℝ ι) :
    integrableExpSet (fun x ↦ ⟪θ, x⟫) (dirichletMeasure a) = Set.univ :=
  TauCeti.Probability.integrableExpSet_inner_dirichletMeasure θ

/-- **Layer 5 completion check.** Evaluation at `0` of the `Fin 2` Dirichlet is Beta. -/
example {a : Fin 2 → ℝ} (ha : ∀ i, 0 < a i) :
    (dirichletMeasure a).map (fun x ↦ x 0) = betaMeasure (a 0) (a 1) :=
  map_eval_zero_dirichletMeasure_fin_two ha

end Dirichlet

/-! ### Item 7: parameter measurability -/


/-- **Layer 5, item 7.** The multivariate Gaussian, with the covariance in coordinates. -/
theorem measurable_multivariateGaussian [DecidableEq ι] :
    Measurable fun q : EuclideanSpace ℝ ι × (ι → ι → ℝ) ↦
      multivariateGaussian q.1 (Matrix.of q.2) :=
  TauCeti.Probability.measurable_multivariateGaussian

/-- **Layer 5, item 7.** The multinomial family, jointly in sample size and cell
probabilities. -/
theorem measurable_multinomialMeasure [Nonempty ι] :
    Measurable fun q : ℕ × StdSimplex ℝ≥0 ι ↦ multinomialMeasure q.1 q.2 :=
  TauCeti.Probability.measurable_multinomialMeasure

/-- **Layer 5, item 7.** The Dirichlet family. -/
theorem measurable_dirichletMeasure : Measurable fun a : ι → ℝ ↦ dirichletMeasure a :=
  TauCeti.Probability.measurable_dirichletMeasure

/-! ### Completion checks -/

/-- **Layer 5 completion check.** The `Fin 1` Gaussian is `gaussianReal`, carried to the unique
coordinate. -/
example (m : EuclideanSpace ℝ (Fin 1)) (S : Matrix (Fin 1) (Fin 1) ℝ) :
    multivariateGaussian m S =
      (gaussianReal (m 0) (S 0 0).toNNReal).map (EuclideanSpace.single 0) :=
  EuclideanSpace.multivariateGaussian_eq_map_single m S

/-- **Layer 5 completion check.** For a `2 × 2` covariance, the conditional mean is
`m₁ + ρ √(v₁ / v₂) (x₂ - m₂)`. -/
example (m : EuclideanSpace ℝ (Fin 1 ⊕ Fin 1)) {S : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℝ}
    (hS : S.PosSemidef) (x₂ : EuclideanSpace ℝ (Fin 1)) {v₁ v₂ ρ : ℝ}
    (hv₁ : v₁ = S (Sum.inl 0) (Sum.inl 0)) (hv₂ : v₂ = S (Sum.inr 0) (Sum.inr 0))
    (hρ : ρ = S (Sum.inl 0) (Sum.inr 0) / Real.sqrt (v₁ * v₂)) :
    m.gaussianCondMean S x₂ 0 =
      m (Sum.inl 0) + ρ * Real.sqrt (v₁ / v₂) * (x₂ 0 - m (Sum.inr 0)) :=
  EuclideanSpace.gaussianCondMean_apply_of_unique_of_posSemidef m hS x₂ hv₁ hv₂ hρ

end Layer5

end Layers45

noncomputable section Layer6

open MeasureTheory ProbabilityTheory TauCeti TauCeti.Probability
open scoped ENNReal Matrix InnerProductSpace MatrixOrder

/-! ## Layer 6: symmetric matrices and Wishart distributions -/

/-! ### Item 1: symmetric matrices and their Lebesgue measure -/

section SymmetricMatrices

open scoped Matrix.Norms.Frobenius in
/-- The Frobenius inner product is `⟪A, B⟫_ℝ = ∑ i, ∑ j, A i j * B i j`. -/
theorem frobenius_inner_def {m n : Type*} [Fintype m] [Fintype n] (A B : Matrix m n ℝ) :
    ⟪A, B⟫_ℝ = ∑ i, ∑ j, A i j * B i j :=
  Matrix.frobenius_inner_def A B

open scoped Matrix.Norms.Frobenius in
/-- The Frobenius inner product is compatible with the Frobenius norm. -/
example {m n : Type*} [Fintype m] [Fintype n] (A : Matrix m n ℝ) : ‖A‖ ^ 2 = ⟪A, A⟫_ℝ :=
  (real_inner_self_eq_norm_sq A).symm

variable (p : ℕ)

/-- The topology on the symmetric subspace is the subtype topology of the product topology. -/
example : (inferInstance : TopologicalSpace (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)))
    = @instTopologicalSpaceSubtype _ _ inferInstance := rfl

/-- The uniformity on the symmetric subspace is the subtype uniformity. -/
example : (inferInstance : UniformSpace (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)))
    = @instUniformSpaceSubtype _ _ inferInstance := rfl

/-- The selected uniformity induces the selected topology. -/
example :
    @UniformSpace.toTopologicalSpace _
        (inferInstance : UniformSpace (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))) =
      (inferInstance : TopologicalSpace (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))) :=
  rfl

/-- The measurable structure is the Borel structure of the retained topology. -/
example : (inferInstance : MeasurableSpace (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)))
    = borel _ :=
  BorelSpace.measurable_eq

/-- `volume` on the symmetric subspace comes from `measureSpaceOfInnerProductSpace`. -/
example : (volume : Measure (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))) =
    (measureSpaceOfInnerProductSpace :
      MeasureSpace (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))).volume := rfl

/-- The subspace inner product is the ambient Frobenius one. -/
example (A B : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) :
    ⟪A, B⟫_ℝ = ∑ i, ∑ j, (A : Matrix (Fin p) (Fin p) ℝ) i j * (B : Matrix (Fin p) (Fin p) ℝ) i j :=
  by rw [selfAdjoint.coe_inner, Matrix.frobenius_inner_def]

example : IsUniformAddGroup (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) := inferInstance
example : SecondCountableTopology (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) :=
  inferInstance
example : CompleteSpace (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) := inferInstance
example : ContinuousENorm (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) := inferInstance

/-- The symmetric subspace has dimension `p(p+1)/2`. -/
theorem finrank_symmetricMatrix :
    Module.finrank ℝ (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) = p * (p + 1) / 2 :=
  TauCeti.finrank_symmetricMatrix p

/-- The positive-definite cone is measurable. -/
theorem measurableSet_posDefMatrix :
    MeasurableSet {A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) |
      (A : Matrix (Fin p) (Fin p) ℝ).PosDef} :=
  TauCeti.measurableSet_posDefMatrix p

/-- The Frobenius pairing is the trace pairing. -/
theorem inner_eq_trace_mul (A Θ : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) :
    ⟪A, Θ⟫_ℝ = ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace :=
  selfAdjoint.inner_eq_trace_mul A Θ

/-- `symmetricCoordinates` reads the upper-triangular entries. -/
theorem symmetricCoordinates_apply (A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))
    (ij : upperTriangle p) :
    symmetricCoordinates p A ij = (A : Matrix (Fin p) (Fin p) ℝ) ij.1.1 ij.1.2 :=
  TauCeti.symmetricCoordinates_apply p A ij

/-- The induced measurable equivalence is `symmetricCoordinates`. -/
example : (symmetricCoordinatesMeasurableEquiv p : _ → upperTriangle p → ℝ) =
    symmetricCoordinates p :=
  symmetricCoordinatesMeasurableEquiv_coe p

/-- `symmetricLebesgue p` is the pushforward of product `volume` along the coordinates. -/
theorem symmetricLebesgue_eq_map :
    symmetricLebesgue p = (volume : Measure (upperTriangle p → ℝ)).map
      (symmetricCoordinates p).symm :=
  (measurePreserving_symmetricCoordinates_symm p).map_eq.symm

/-- The coordinate equivalence is measure-preserving. -/
theorem measurePreserving_symmetricCoordinates :
    MeasurePreserving (symmetricCoordinates p) (symmetricLebesgue p) volume :=
  TauCeti.measurePreserving_symmetricCoordinates p

example : (symmetricLebesgue p).IsAddHaarMeasure := inferInstance

/-- Frobenius volume is `2 ^ (p (p - 1) / 4)` times `symmetricLebesgue p`. -/
theorem volume_symmetricMatrix_eq_smul_symmetricLebesgue :
    (volume : Measure (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))) =
      ENNReal.ofReal (Real.rpow 2 (((p : ℝ) * ((p : ℝ) - 1)) / 4)) • symmetricLebesgue p :=
  TauCeti.volume_symmetricMatrix_eq_smul_symmetricLebesgue p

/-- In dimension zero, `symmetricLebesgue` is Dirac. -/
theorem symmetricLebesgue_zero : symmetricLebesgue 0 = Measure.dirac 0 :=
  TauCeti.symmetricLebesgue_zero

/-- The singular symmetric matrices are `symmetricLebesgue`-null. -/
theorem symmetricLebesgue_setOf_det_eq_zero :
    symmetricLebesgue p {A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) |
      (A : Matrix (Fin p) (Fin p) ℝ).det = 0} = 0 :=
  TauCeti.symmetricLebesgue_setOf_det_eq_zero p

variable {p}

/-- `symmetricCongruence C` is `A ↦ C * A * Cᵀ`. -/
theorem coe_symmetricCongruence_apply (C : Matrix.GeneralLinearGroup (Fin p) ℝ)
    (A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) :
    (Matrix.GeneralLinearGroup.symmetricCongruence C A : Matrix (Fin p) (Fin p) ℝ) =
      (C : Matrix (Fin p) (Fin p) ℝ) * A * (C : Matrix (Fin p) (Fin p) ℝ)ᵀ :=
  Matrix.GeneralLinearGroup.coe_symmetricCongruence_apply C A

/-- The determinant of symmetric congruence is `(det C) ^ (p + 1)`. -/
theorem det_symmetricCongruence (C : Matrix.GeneralLinearGroup (Fin p) ℝ) :
    LinearMap.det ((Matrix.GeneralLinearGroup.symmetricCongruence C).toLinearMap :
        selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) →ₗ[ℝ] _) =
      Matrix.det (C : Matrix (Fin p) (Fin p) ℝ) ^ (p + 1) :=
  Matrix.GeneralLinearGroup.det_symmetricCongruence C

/-- The congruence change of variables for `symmetricLebesgue`. -/
theorem map_symmetricCongruence_symmetricLebesgue (C : Matrix.GeneralLinearGroup (Fin p) ℝ) :
    (symmetricLebesgue p).map (Matrix.GeneralLinearGroup.symmetricCongruence C) =
      ((ENNReal.ofReal |Matrix.det (C : Matrix (Fin p) (Fin p) ℝ)|) ^ (p + 1))⁻¹ •
        symmetricLebesgue p :=
  Matrix.GeneralLinearGroup.map_symmetricCongruence_symmetricLebesgue C

end SymmetricMatrices


/-! ### Item 2: Cholesky decomposition -/

section Cholesky

variable {p : ℕ}

/-- The target carrier: lower-triangular matrices with positive diagonal. -/
example : PosDiagLowerTriangular p =
    {L : Matrix (Fin p) (Fin p) ℝ // L.IsLowerTriangular ∧ ∀ i, 0 < L i i} := rfl

/-- The prerequisite: Mathlib's `LDL.lower` is lower triangular. -/
theorem isLowerTriangular_ldl_lower {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef) :
    (LDL.lower hS).IsLowerTriangular :=
  LDL.isLowerTriangular_lower hS

/-- The Cholesky factor is built from `LDL.lower` and the square roots of `LDL.diag`. -/
theorem cholesky_coe (A : PosDefMatrix p) :
    (cholesky A).1 =
      LDL.lower A.2 * Matrix.diagonal fun i ↦ Real.sqrt (LDL.diagEntries A.2 i) :=
  TauCeti.cholesky_coe A

/-- `choleskyEquiv` is Cholesky in one direction. -/
theorem choleskyEquiv_apply (A : PosDefMatrix p) : choleskyEquiv A = cholesky A :=
  TauCeti.choleskyEquiv_apply A

/-- `choleskyEquiv` is `L ↦ L * Lᵀ` in the other direction. -/
theorem choleskyEquiv_symm_apply_coe (L : PosDiagLowerTriangular p) :
    ((choleskyEquiv.symm L).1 : Matrix (Fin p) (Fin p) ℝ) = L.1 * L.1ᵀ := by
  rw [TauCeti.choleskyEquiv_symm_apply, TauCeti.choleskyReconstruction_coe]

/-- The first inverse identity. -/
theorem choleskyReconstruction_cholesky (A : PosDefMatrix p) :
    choleskyReconstruction (cholesky A) = A :=
  TauCeti.choleskyReconstruction_cholesky A

/-- The second inverse identity. -/
theorem cholesky_choleskyReconstruction (L : PosDiagLowerTriangular p) :
    cholesky (choleskyReconstruction L) = L :=
  TauCeti.cholesky_choleskyReconstruction L

/-- Corollary: `A = L * Lᵀ`. -/
theorem cholesky_mul_transpose (A : PosDefMatrix p) :
    (cholesky A).1 * ((cholesky A).1)ᵀ = (A.1 : Matrix (Fin p) (Fin p) ℝ) :=
  TauCeti.cholesky_mul_transpose A

/-- Corollary: uniqueness of the Cholesky factor. -/
theorem cholesky_unique (A : PosDefMatrix p) (L : PosDiagLowerTriangular p)
    (hL : L.1 * L.1ᵀ = (A.1 : Matrix (Fin p) (Fin p) ℝ)) : L = cholesky A :=
  eq_cholesky_of_mul_transpose_self_eq A L hL

theorem continuous_cholesky : Continuous (@cholesky p) := TauCeti.continuous_cholesky

theorem continuous_choleskyReconstruction : Continuous (@choleskyReconstruction p) :=
  TauCeti.continuous_choleskyReconstruction

theorem measurable_cholesky : Measurable (@cholesky p) := TauCeti.measurable_cholesky

theorem measurable_choleskyReconstruction : Measurable (@choleskyReconstruction p) :=
  TauCeti.measurable_choleskyReconstruction

/-- The homeomorphism form of the Cholesky equivalence. -/
example : (choleskyHomeomorph (p := p)).toEquiv = choleskyEquiv :=
  choleskyHomeomorph_toEquiv

/-- The measurable-equivalence form of the Cholesky equivalence. -/
example (A : PosDefMatrix p) : choleskyMeasurableEquiv A = cholesky A :=
  choleskyMeasurableEquiv_apply A

/-- The positive-diagonal carrier keeps its subtype topology. -/
example : (inferInstance : TopologicalSpace (PosDiagLowerTriangular p)) =
    @instTopologicalSpaceSubtype _ _ inferInstance := rfl

/-- The positive-diagonal carrier keeps its subtype uniformity. -/
example : (inferInstance : UniformSpace (PosDiagLowerTriangular p)) =
    @instUniformSpaceSubtype _ _ inferInstance := rfl

/-- The positive-diagonal carrier keeps its Borel structure. -/
example : BorelSpace (PosDiagLowerTriangular p) := inferInstance

/-- The coordinate map to diagonal and strict-lower-triangular entries is a homeomorphism for
the subtype topology. -/
theorem lowerTriangleCoordinatesHomeomorph_apply_coe (L : PosDiagLowerTriangular p)
    (ij : lowerTriangle p) :
    (lowerTriangleCoordinatesHomeomorph p L).1 ij = L.1 ij.1.1 ij.1.2 :=
  TauCeti.lowerTriangleCoordinatesHomeomorph_apply_coe p L ij

/-- The Jacobian of `L ↦ L * Lᵀ` in the lower-triangular coordinates. -/
theorem abs_det_fderiv_choleskyReconstruction (x : lowerTriangle p → ℝ)
    (hx : ∀ i : Fin p, 0 < x ⟨(i, i), le_rfl⟩) :
    |(fderiv ℝ (choleskyReconstructionCoordinates p) x).det| =
      2 ^ p * ∏ i : Fin p, x ⟨(i, i), le_rfl⟩ ^ (p - i.1) :=
  abs_det_fderiv_choleskyReconstructionCoordinates x hx

/-- `choleskyReconstructionCoordinates` is `L ↦ L * Lᵀ` read in lower-triangular coordinates. -/
example (L : PosDiagLowerTriangular p) (ij : lowerTriangle p) :
    choleskyReconstructionCoordinates p (lowerTriangleCoordinatesHomeomorph p L).1 ij =
      ((choleskyReconstruction L).1 : Matrix (Fin p) (Fin p) ℝ) ij.1.1 ij.1.2 :=
  choleskyReconstructionCoordinates_lowerTriangleCoordinatesHomeomorph L ij

/-- The cone restriction of `symmetricLebesgue p` is the Jacobian-weighted pushforward of the
positive-diagonal coordinate region under `L ↦ L * Lᵀ`. -/
theorem map_cholesky_symmetricLebesgue :
    ((volume.restrict (posDiagLowerRegion p)).withDensity
          (fun x ↦ ENNReal.ofReal (2 ^ p * ∏ i : Fin p, x ⟨(i, i), le_rfl⟩ ^ (p - i.1)))).map
        (lowerTriangleGram p) =
      (symmetricLebesgue p).restrict
        {A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) |
          (A : Matrix (Fin p) (Fin p) ℝ).PosDef} := by
  rw [← funext (choleskyJacobianDensity_def p)]
  exact TauCeti.map_cholesky_symmetricLebesgue p

/-- The positive-diagonal region and its Gram map. -/
example (x : lowerTriangle p → ℝ) :
    (lowerTriangleGram p x : Matrix (Fin p) (Fin p) ℝ) =
      lowerTriangleMatrix p x * (lowerTriangleMatrix p x)ᵀ ∧
    (x ∈ posDiagLowerRegion p ↔ ∀ i : Fin p, 0 < x ⟨(i, i), le_rfl⟩) :=
  ⟨coe_lowerTriangleGram p x, mem_posDiagLowerRegion p⟩

end Cholesky

/-! ### Item 3: the multivariate Gamma function -/

section MultivariateGamma

/-- The multivariate Gamma function, with real exponent of `π`. -/
theorem multivariateGamma_def (p : ℕ) (a : ℝ) :
    multivariateGamma p a = Real.rpow Real.pi (((p : ℝ) * ((p : ℝ) - 1)) / 4) *
      ∏ i : Fin p, Real.Gamma (a - (i.1 : ℝ) / 2) :=
  TauCeti.multivariateGamma_def p a

/-- The multivariate Gamma integral, for every `p` when `a > (p - 1) / 2`. -/
theorem integral_posDef_multivariateGamma {p : ℕ} {a : ℝ} (ha : ((p : ℝ) - 1) / 2 < a) :
    ∫ A in {A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) |
        (A : Matrix (Fin p) (Fin p) ℝ).PosDef},
      Real.rpow (A : Matrix (Fin p) (Fin p) ℝ).det (a - ((p : ℝ) + 1) / 2) *
        Real.exp (-(A : Matrix (Fin p) (Fin p) ℝ).trace) ∂symmetricLebesgue p =
      multivariateGamma p a :=
  TauCeti.integral_posDef_multivariateGamma ha

/-- At `p = 0` the multivariate Gamma integral holds for every `a`. -/
theorem integral_posDef_multivariateGamma_zero (a : ℝ) :
    ∫ A in {A : selfAdjoint.submodule ℝ (Matrix (Fin 0) (Fin 0) ℝ) |
        (A : Matrix (Fin 0) (Fin 0) ℝ).PosDef},
      Real.rpow (A : Matrix (Fin 0) (Fin 0) ℝ).det (a - (((0 : ℕ) : ℝ) + 1) / 2) *
        Real.exp (-(A : Matrix (Fin 0) (Fin 0) ℝ).trace) ∂symmetricLebesgue 0 =
      multivariateGamma 0 a := by
  simpa using TauCeti.integral_posDef_multivariateGamma_zero a

end MultivariateGamma

/-! ### Item 4: Wishart distributions -/

section NonsingularWishart

variable {p : ℕ} {n t : ℝ} {S : Matrix (Fin p) (Fin p) ℝ}

/-- The nonsingular Wishart law: the stated density against `symmetricLebesgue p` when
`S.PosDef` and `p - 1 < n`, and zero otherwise. -/
theorem nonsingularWishartMeasure_def (n : ℝ) (S : Matrix (Fin p) (Fin p) ℝ) [Decidable S.PosDef]
    [Decidable ((p : ℝ) - 1 < n)] :
    nonsingularWishartMeasure n S =
      if S.PosDef ∧ (p : ℝ) - 1 < n then
        (symmetricLebesgue p).withDensity (nonsingularWishartPDF n S)
      else 0 := by
  rw [TauCeti.Probability.nonsingularWishartMeasure_def]; congr

/-- The nonsingular Wishart density on the positive-definite cone. -/
theorem nonsingularWishartPDF_of_posDef {A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)}
    (hA : (A : Matrix (Fin p) (Fin p) ℝ).PosDef) :
    nonsingularWishartPDF n S A =
      ENNReal.ofReal (Real.rpow (A : Matrix (Fin p) (Fin p) ℝ).det ((n - (p : ℝ) - 1) / 2) *
          Real.exp (-Matrix.trace (S⁻¹ * (A : Matrix (Fin p) (Fin p) ℝ)) / 2) /
        (Real.rpow 2 (n * (p : ℝ) / 2) * Real.rpow S.det (n / 2) *
          multivariateGamma p (n / 2))) :=
  TauCeti.Probability.nonsingularWishartPDF_of_posDef n S hA

/-- The nonsingular Wishart density vanishes off the positive-definite cone. -/
theorem nonsingularWishartPDF_of_not_posDef
    {A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)}
    (hA : ¬ (A : Matrix (Fin p) (Fin p) ℝ).PosDef) : nonsingularWishartPDF n S A = 0 :=
  TauCeti.Probability.nonsingularWishartPDF_of_not_posDef n S hA

/-- At `p = 0` the general definition is the Dirac law for every `-1 < n`. -/
theorem nonsingularWishartMeasure_zero (hn : -1 < n) (S : Matrix (Fin 0) (Fin 0) ℝ) :
    nonsingularWishartMeasure n S = Measure.dirac 0 :=
  TauCeti.Probability.nonsingularWishartMeasure_zero hn S

theorem isProbabilityMeasure_nonsingularWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    IsProbabilityMeasure (nonsingularWishartMeasure n S) :=
  TauCeti.Probability.isProbabilityMeasure_nonsingularWishartMeasure hS hn

/-- The mean is `n • Sₛ`. -/
theorem integral_id_nonsingularWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    ∫ A, A ∂nonsingularWishartMeasure n S =
      n • (⟨S, Matrix.isHermitian_iff_isSelfAdjoint.1 hS.isHermitian⟩ :
        selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) :=
  TauCeti.Probability.integral_id_nonsingularWishartMeasure hS hn

/-- The entrywise covariance. -/
theorem cov_apply_nonsingularWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) - 1 < n)
    (i j k l : Fin p) :
    cov[fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) =>
          (A : Matrix (Fin p) (Fin p) ℝ) i j,
        fun A => (A : Matrix (Fin p) (Fin p) ℝ) k l; nonsingularWishartMeasure n S] =
      n * (S i k * S j l + S i l * S j k) :=
  covariance_coe_apply_nonsingularWishartMeasure hS hn i j k l

/-- Convolution at fixed scale. -/
theorem nonsingularWishartMeasure_conv (S : Matrix (Fin p) (Fin p) ℝ) {n₁ n₂ : ℝ}
    (hn₁ : (p : ℝ) - 1 < n₁) (hn₂ : (p : ℝ) - 1 < n₂) (hn : (p : ℝ) - 1 < n₁ + n₂) :
    nonsingularWishartMeasure n₁ S ∗ nonsingularWishartMeasure n₂ S =
      nonsingularWishartMeasure (n₁ + n₂) S :=
  nonsingularWishartMeasure_conv_nonsingularWishartMeasure S hn₁ hn₂ hn

/-- Full-row-rank congruence `A ↦ M * A * Mᵀ`. -/
theorem map_rank_congruence_nonsingularWishartMeasure {q : ℕ} (M : Matrix (Fin q) (Fin p) ℝ)
    (hM : M.rank = q) (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    (nonsingularWishartMeasure n S).map (Matrix.symmetricCongruenceLinearMap M) =
      nonsingularWishartMeasure n (M * S * Mᵀ) :=
  map_symmetricCongruenceLinearMap_nonsingularWishartMeasure M hM hS hn

/-- Special case: invertible congruence. -/
example (C : Matrix.GeneralLinearGroup (Fin p) ℝ) :
    (nonsingularWishartMeasure n S).map (Matrix.GeneralLinearGroup.symmetricCongruence C) =
      nonsingularWishartMeasure n
        ((C : Matrix (Fin p) (Fin p) ℝ) * S * (C : Matrix (Fin p) (Fin p) ℝ)ᵀ) :=
  map_symmetricCongruence_nonsingularWishartMeasure n S C

/-- Special case: principal-submatrix marginals. -/
example {q : ℕ} (f : Fin q → Fin p) (hf : Function.Injective f) (hS : S.PosDef)
    (hn : (p : ℝ) - 1 < n) :
    (nonsingularWishartMeasure n S).map
        (Matrix.symmetricCongruenceLinearMap ((1 : Matrix (Fin p) (Fin p) ℝ).submatrix f id)) =
      nonsingularWishartMeasure n (S.submatrix f f) :=
  map_symmetricCongruenceLinearMap_submatrix_one_nonsingularWishartMeasure f hf hS hn

variable (Θ : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))

/-- The exact trace-mgf domain. -/
theorem mem_integrableExpSet_trace_mul_nonsingularWishartMeasure_iff (hS : S.PosDef)
    (hn : (p : ℝ) - 1 < n) :
    t ∈ integrableExpSet (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (nonsingularWishartMeasure n S) ↔
      (1 - (2 * t) • (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef :=
  TauCeti.Probability.mem_integrableExpSet_trace_mul_nonsingularWishartMeasure_iff hS hn t

/-- The trace mgf. -/
theorem mgf_trace_mul_nonsingularWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) - 1 < n)
    (ht : (1 - (2 * t) • (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef) :
    mgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (nonsingularWishartMeasure n S) t =
      Real.rpow (1 - (2 * t) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S)).det (-n / 2) :=
  TauCeti.Probability.mgf_trace_mul_nonsingularWishartMeasure hS hn ht

/-- The trace cgf is the real logarithm of the trace mgf. -/
theorem cgf_trace_mul_nonsingularWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) - 1 < n)
    (ht : (1 - (2 * t) • (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef) :
    cgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (nonsingularWishartMeasure n S) t =
      Real.log (Real.rpow (1 - (2 * t) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S)).det (-n / 2)) :=
  congrArg Real.log (mgf_trace_mul_nonsingularWishartMeasure Θ hS hn ht)

/-- The `t = -1` cone-Laplace specialization for positive-semidefinite `Θ`. -/
theorem integral_exp_neg_trace_mul_nonsingularWishartMeasure (hS : S.PosDef)
    (hn : (p : ℝ) - 1 < n) (hΘ : (Θ : Matrix (Fin p) (Fin p) ℝ).PosSemidef) :
    ∫ A, Real.exp (-((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      ∂nonsingularWishartMeasure n S =
      Real.rpow (1 + (2 : ℝ) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S)).det (-n / 2) :=
  TauCeti.Probability.integral_exp_neg_trace_mul_nonsingularWishartMeasure hS hn hΘ

/-- The Hermitian-sandwich lemma; Tau Ceti needs no hypothesis on `S`. -/
theorem isHermitian_wishartSandwich (S : Matrix (Fin p) (Fin p) ℝ) :
    (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S).IsHermitian :=
  Matrix.isHermitian_sqrt_mul_mul_sqrt S (selfAdjoint.isHermitian_coe Θ)

/-- The shared continuation lemma: a real statistic whose mgf is `∏ j, (1 - 2 t λ j) ^ (-a j)`
on its natural domain has the eigenvalue-wise principal-logarithm value at `I`. -/
theorem complexMGF_I_of_mgf_eq_prod_rpow {Ω ι : Type*} [MeasurableSpace Ω] [Fintype ι]
    {μ : Measure Ω} {X : Ω → ℝ} (lam a : ι → ℝ)
    (h : ∀ t : ℝ, (∀ j, 0 < 1 - 2 * t * lam j) →
      mgf X μ t = ∏ j, Real.rpow (1 - 2 * t * lam j) (-a j)) :
    complexMGF X μ Complex.I =
      Complex.exp (-∑ j, (a j : ℂ) * Complex.log (1 - 2 * Complex.I * (lam j : ℂ))) :=
  TauCeti.complexMGF_I_eq_exp_of_mgf_eq_prod_rpow lam a h

/-- The characteristic function, as a sum of principal logarithms over the eigenvalues of the
Hermitian sandwich. -/
theorem charFun_nonsingularWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    charFun (nonsingularWishartMeasure n S) Θ =
      Complex.exp (-(n : ℂ) / 2 * ∑ j, Complex.log (1 - 2 * Complex.I *
        ((isHermitian_wishartSandwich Θ S).eigenvalues j : ℂ))) :=
  TauCeti.Probability.charFun_nonsingularWishartMeasure hS hn Θ

/-- In dimension one, the nonsingular Wishart law is a scaled chi-squared law. -/
theorem map_finOne_nonsingularWishartMeasure {σ2 : ℝ} (hn : 0 < n) (hσ : 0 < σ2) :
    (nonsingularWishartMeasure n (Matrix.of fun _ _ : Fin 1 => σ2)).map symmetricFinOneEquiv =
      (Probability.chiSquaredMeasure n).map (σ2 * ·) :=
  map_symmetricFinOneEquiv_nonsingularWishartMeasure hn hσ

/-- A random matrix with a nonsingular Wishart law has a density against `symmetricLebesgue p`,
which is the Wishart density in the valid family. -/
theorem hasPDF_of_hasLaw_nonsingularWishartMeasure {Ω : Type*} [MeasurableSpace Ω]
    {P : Measure Ω} {X : Ω → selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) (hX : HasLaw X (nonsingularWishartMeasure n S) P) :
    HasPDF X P (symmetricLebesgue p) ∧
      pdf X P (symmetricLebesgue p) =ᵐ[symmetricLebesgue p] nonsingularWishartPDF n S :=
  ⟨TauCeti.Probability.hasPDF_of_hasLaw_nonsingularWishartMeasure hX,
    pdf_eq_nonsingularWishartPDF_of_hasLaw_nonsingularWishartMeasure hS hn hX⟩

/-- The Radon-Nikodym derivative of the nonsingular Wishart law against `symmetricLebesgue p`. -/
theorem rnDeriv_nonsingularWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    (nonsingularWishartMeasure n S).rnDeriv (symmetricLebesgue p) =ᵐ[symmetricLebesgue p]
      nonsingularWishartPDF n S :=
  TauCeti.Probability.rnDeriv_nonsingularWishartMeasure hS hn

end NonsingularWishart

section GaussianGram

variable {p ν : ℕ} {t : ℝ} {S : Matrix (Fin p) (Fin p) ℝ}

/-- The Gaussian-Gram law is the pushforward of `ν` i.i.d. `multivariateGaussian 0 S` vectors
under the Gram sum `X ↦ ∑ r, vecMulVec (X r) (X r)`, with no branch on `S`. -/
theorem wishartGramMeasure_def (ν : ℕ) (S : Matrix (Fin p) (Fin p) ℝ) :
    wishartGramMeasure ν S =
      (Measure.pi fun _ : Fin ν ↦ multivariateGaussian 0 S).map wishartGram ∧
    ∀ X : Fin ν → EuclideanSpace ℝ (Fin p),
      (wishartGram X : Matrix (Fin p) (Fin p) ℝ) =
        ∑ r, Matrix.vecMulVec (X r).ofLp (X r).ofLp :=
  ⟨wishartGramMeasure_eq_map_pi ν S, coe_wishartGram⟩

/-- Mathlib's totalization is inherited: a non-positive-semidefinite scale gives `dirac 0`. -/
example (hS : ¬ S.PosSemidef) : wishartGramMeasure ν S = Measure.dirac 0 :=
  wishartGramMeasure_of_not_posSemidef ν hS

example (S : Matrix (Fin p) (Fin p) ℝ) : IsProbabilityMeasure (wishartGramMeasure ν S) :=
  inferInstance

theorem wishartGramMeasure_zero (S : Matrix (Fin p) (Fin p) ℝ) :
    wishartGramMeasure 0 S = Measure.dirac 0 :=
  TauCeti.Probability.wishartGramMeasure_zero S

/-- The Gram sum of an i.i.d. Gaussian family has the Gaussian-Gram law. -/
theorem hasLaw_sum_vecMulVec_gaussian {Ω : Type*} {mΩ : MeasurableSpace Ω} {P : Measure Ω}
    {X : Fin ν → Ω → EuclideanSpace ℝ (Fin p)}
    (hX : ∀ r, HasLaw (X r) (multivariateGaussian 0 S) P) (hindep : iIndepFun X P) :
    HasLaw (fun ω ↦ wishartGram fun r ↦ X r ω) (wishartGramMeasure ν S) P :=
  hasLaw_wishartGram_gaussian hX hindep

/-- Support in the positive-semidefinite cone. -/
theorem ae_posSemidef_wishartGramMeasure (S : Matrix (Fin p) (Fin p) ℝ) :
    ∀ᵐ A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ∂wishartGramMeasure ν S,
      (A : Matrix (Fin p) (Fin p) ℝ).PosSemidef :=
  TauCeti.Probability.ae_posSemidef_wishartGramMeasure ν S

/-- The almost-sure rank bound. -/
theorem ae_rank_le_wishartGramMeasure (S : Matrix (Fin p) (Fin p) ℝ) :
    ∀ᵐ A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ∂wishartGramMeasure ν S,
      (A : Matrix (Fin p) (Fin p) ℝ).rank ≤ min ν S.rank :=
  TauCeti.Probability.ae_rank_le_wishartGramMeasure ν S

/-- Congruence by any rectangular `M`, for positive-semidefinite `S`. -/
theorem map_congruence_wishartGramMeasure {q : ℕ} (M : Matrix (Fin q) (Fin p) ℝ)
    (hS : S.PosSemidef) :
    (wishartGramMeasure ν S).map (Matrix.symmetricCongruenceLinearMap M) =
      wishartGramMeasure ν (M * S * Mᵀ) :=
  map_symmetricCongruenceLinearMap_wishartGramMeasure ν M hS

theorem wishartGramMeasure_conv_wishartGramMeasure (ν₁ ν₂ : ℕ) (S : Matrix (Fin p) (Fin p) ℝ) :
    wishartGramMeasure ν₁ S ∗ wishartGramMeasure ν₂ S = wishartGramMeasure (ν₁ + ν₂) S :=
  TauCeti.Probability.wishartGramMeasure_conv_wishartGramMeasure ν₁ ν₂ S

variable (Θ : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))

/-- The exact trace-mgf domain for `0 < ν`. -/
theorem mem_integrableExpSet_trace_mul_wishartGramMeasure_iff (hν : 0 < ν) :
    t ∈ integrableExpSet (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (wishartGramMeasure ν S) ↔
      (1 - (2 * t) • (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef :=
  TauCeti.Probability.mem_integrableExpSet_trace_mul_wishartGramMeasure_iff hν S t

/-- At `ν = 0`: domain `Set.univ`, mgf `1` and cgf `0`. -/
theorem trace_mul_wishartGramMeasure_zero (S : Matrix (Fin p) (Fin p) ℝ) (t : ℝ) :
    integrableExpSet (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (wishartGramMeasure 0 S) = Set.univ ∧
    mgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (wishartGramMeasure 0 S) t = 1 ∧
    cgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (wishartGramMeasure 0 S) t = 0 :=
  ⟨integrableExpSet_trace_mul_wishartGramMeasure_zero Θ S,
    mgf_trace_mul_wishartGramMeasure_zero Θ S t, cgf_trace_mul_wishartGramMeasure_zero Θ S t⟩

/-- The trace mgf, for every `ν`. -/
theorem mgf_trace_mul_wishartGramMeasure (hS : S.PosSemidef)
    (ht : (1 - (2 * t) • (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef) :
    mgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (wishartGramMeasure ν S) t =
      Real.rpow (1 - (2 * t) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S)).det (-(ν : ℝ) / 2) :=
  TauCeti.Probability.mgf_trace_mul_wishartGramMeasure ν hS ht

/-- The trace cgf is the real logarithm of the trace mgf. -/
theorem cgf_trace_mul_wishartGramMeasure (hS : S.PosSemidef)
    (ht : (1 - (2 * t) • (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef) :
    cgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (wishartGramMeasure ν S) t =
      Real.log (Real.rpow (1 - (2 * t) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S)).det
        (-(ν : ℝ) / 2)) :=
  congrArg Real.log (mgf_trace_mul_wishartGramMeasure Θ hS ht)

/-- The `t = -1` cone-Laplace specialization for positive-semidefinite `Θ`. -/
theorem integral_exp_neg_trace_mul_wishartGramMeasure (hS : S.PosSemidef)
    (hΘ : (Θ : Matrix (Fin p) (Fin p) ℝ).PosSemidef) :
    ∫ A, Real.exp (-((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      ∂wishartGramMeasure ν S =
      Real.rpow (1 + (2 : ℝ) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S)).det (-(ν : ℝ) / 2) :=
  TauCeti.Probability.integral_exp_neg_trace_mul_wishartGramMeasure ν hS hΘ

/-- The characteristic function, by the same spectral formula with `n = ν`. -/
theorem charFun_wishartGramMeasure (S : Matrix (Fin p) (Fin p) ℝ) :
    charFun (wishartGramMeasure ν S) Θ =
      Complex.exp (-(ν : ℂ) / 2 * ∑ j, Complex.log (1 - 2 * Complex.I *
        ((isHermitian_wishartSandwich Θ S).eigenvalues j : ℂ))) :=
  TauCeti.Probability.charFun_wishartGramMeasure ν S Θ

/-- The mean `ν • Sₛ`. -/
theorem integral_id_wishartGramMeasure (hS : S.PosSemidef) :
    ∫ A, A ∂wishartGramMeasure ν S =
      (ν : ℝ) • (⟨S, Matrix.isHermitian_iff_isSelfAdjoint.1 hS.1⟩ :
        selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) :=
  TauCeti.Probability.integral_id_wishartGramMeasure hS ν

/-- The entrywise covariance, including the singular range `ν < p`. -/
theorem cov_apply_wishartGramMeasure (hS : S.PosSemidef) (i j k l : Fin p) :
    cov[fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) =>
          (A : Matrix (Fin p) (Fin p) ℝ) i j,
        fun A => (A : Matrix (Fin p) (Fin p) ℝ) k l; wishartGramMeasure ν S] =
      (ν : ℝ) * (S i k * S j l + S i l * S j k) :=
  covariance_coe_apply_wishartGramMeasure hS ν i j k l

/-- The two Wishart families agree for `S.PosDef` and `p ≤ ν`. -/
theorem wishartGramMeasure_eq_nonsingularWishartMeasure (hS : S.PosDef) (hp : p ≤ ν) :
    wishartGramMeasure ν S = nonsingularWishartMeasure (ν : ℝ) S :=
  TauCeti.Probability.wishartGramMeasure_eq_nonsingularWishartMeasure hS hp

/-- The Gram sum of an i.i.d. Gaussian family has the nonsingular Wishart law. -/
theorem hasLaw_sum_vecMulVec_gaussian_nonsingularWishartMeasure {Ω : Type*}
    {mΩ : MeasurableSpace Ω} {P : Measure Ω} {X : Fin ν → Ω → EuclideanSpace ℝ (Fin p)}
    (hS : S.PosDef) (hp : p ≤ ν) (hX : ∀ r, HasLaw (X r) (multivariateGaussian 0 S) P)
    (hindep : iIndepFun X P) :
    HasLaw (fun ω => wishartGram fun r => X r ω) (nonsingularWishartMeasure (ν : ℝ) S) P :=
  hasLaw_wishartGram_gaussian_nonsingularWishartMeasure hS hp hX hindep

/-- Singularity when `min ν (rank S) < p`. -/
theorem mutuallySingular_wishartGramMeasure_symmetricLebesgue (S : Matrix (Fin p) (Fin p) ℝ)
    (h : min ν S.rank < p) : wishartGramMeasure ν S ⟂ₘ symmetricLebesgue p :=
  TauCeti.Probability.mutuallySingular_wishartGramMeasure_symmetricLebesgue ν S h

/-- For `S.PosDef` and `p ≤ ν`, a Gaussian-Gram random matrix has the Wishart density against
`symmetricLebesgue p`; otherwise the law is singular (see `mutuallySingular_*` above). -/
theorem hasPDF_of_hasLaw_wishartGramMeasure {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {X : Ω → selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)}
    (hS : S.PosDef) (hp : p ≤ ν) (hX : HasLaw X (wishartGramMeasure ν S) P) :
    HasPDF X P (symmetricLebesgue p) ∧
      pdf X P (symmetricLebesgue p) =ᵐ[symmetricLebesgue p] nonsingularWishartPDF (ν : ℝ) S :=
  ⟨TauCeti.Probability.hasPDF_of_hasLaw_wishartGramMeasure hS hp hX,
    pdf_eq_nonsingularWishartPDF_of_hasLaw_wishartGramMeasure hS hp hX⟩

/-- The Radon-Nikodym derivative of the Gaussian-Gram law for `S.PosDef` and `p ≤ ν`. -/
theorem rnDeriv_wishartGramMeasure (hS : S.PosDef) (hp : p ≤ ν) :
    (wishartGramMeasure ν S).rnDeriv (symmetricLebesgue p) =ᵐ[symmetricLebesgue p]
      nonsingularWishartPDF (ν : ℝ) S :=
  TauCeti.Probability.rnDeriv_wishartGramMeasure hS hp

end GaussianGram

/-! ### Item 5: Bartlett decomposition -/

section Bartlett

variable {p : ℕ} {n : ℝ}

/-- Mapping the positive-definite lift back along `Subtype.val` returns the Wishart law. -/
theorem map_val_comap_val_nonsingularWishartMeasure (n : ℝ) :
    ((nonsingularWishartMeasure n (1 : Matrix (Fin p) (Fin p) ℝ)).comap
        (Subtype.val : PosDefMatrix p → selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))).map
        Subtype.val = nonsingularWishartMeasure n 1 :=
  map_subtype_val_comap_nonsingularWishartMeasure n 1

/-- **Bartlett decomposition.** For the Cholesky factor `T` of a standard Wishart matrix, the
entries are independent, `(T i i) ^ 2` is chi-squared with `n - i` degrees of freedom and the
strictly lower entries are standard Gaussian. Tau Ceti allows any real `n > p - 1`. -/
theorem bartlett_nonsingularWishartMeasure {Ω : Type*} {mΩ : MeasurableSpace Ω}
    {P : Measure Ω} (hn : (p : ℝ) - 1 < n) {A : Ω → PosDefMatrix p}
    (hA : HasLaw A ((nonsingularWishartMeasure n (1 : Matrix (Fin p) (Fin p) ℝ)).comap
      Subtype.val) P) :
    iIndepFun (fun (ij : lowerTriangle p) (ω : Ω) ↦ (cholesky (A ω)).1 ij.1.1 ij.1.2) P ∧
      (∀ i : Fin p, HasLaw (fun ω ↦ (cholesky (A ω)).1 i i ^ 2)
          (Probability.chiSquaredMeasure (n - i.1)) P) ∧
      (∀ i j : Fin p, j < i →
        HasLaw (fun ω ↦ (cholesky (A ω)).1 i j) (gaussianReal 0 1) P) :=
  TauCeti.Probability.bartlett_nonsingularWishartMeasure hn hA

/-- The README's natural-degree form `p ≤ ν`. -/
example {ν : ℕ} (hpν : p ≤ ν) {Ω : Type*} {mΩ : MeasurableSpace Ω} {P : Measure Ω}
    {A : Ω → PosDefMatrix p}
    (hA : HasLaw A ((nonsingularWishartMeasure (ν : ℝ) (1 : Matrix (Fin p) (Fin p) ℝ)).comap
      Subtype.val) P) (i : Fin p) :
    HasLaw (fun ω ↦ (cholesky (A ω)).1 i i ^ 2)
      (Probability.chiSquaredMeasure ((ν : ℝ) - i.1)) P :=
  (bartlett_nonsingularWishartMeasure (by
    have : (p : ℝ) ≤ ν := by exact_mod_cast hpν
    linarith) hA).2.1 i

end Bartlett

/-! ### Item 6: inverse-Wishart distribution -/

section InverseWishart

variable {p : ℕ} {n : ℝ} {S : Matrix (Fin p) (Fin p) ℝ}

/-- The symmetric inverse keeps Mathlib's totalized inverse. -/
theorem coe_symmetricInv (A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) :
    (symmetricInv A : Matrix (Fin p) (Fin p) ℝ) = (A : Matrix (Fin p) (Fin p) ℝ)⁻¹ :=
  TauCeti.coe_symmetricInv A

/-- The inverse-Wishart law is the pushforward of `nonsingularWishartMeasure n S⁻¹`. -/
theorem inverseWishartMeasure_def (n : ℝ) (S : Matrix (Fin p) (Fin p) ℝ) :
    inverseWishartMeasure n S = (nonsingularWishartMeasure n S⁻¹).map symmetricInv :=
  TauCeti.Probability.inverseWishartMeasure_def n S

/-- The inverse-Wishart law is a probability measure under the Wishart parameter hypotheses. -/
theorem isProbabilityMeasure_inverseWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    IsProbabilityMeasure (inverseWishartMeasure n S) :=
  TauCeti.Probability.isProbabilityMeasure_inverseWishartMeasure hS hn

/-- A random matrix with an inverse-Wishart law has a density against `symmetricLebesgue p`,
which is the inverse-Wishart density in the valid family. -/
theorem hasPDF_of_hasLaw_inverseWishartMeasure {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {X : Ω → selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) (hX : HasLaw X (inverseWishartMeasure n S) P) :
    HasPDF X P (symmetricLebesgue p) ∧
      pdf X P (symmetricLebesgue p) =ᵐ[symmetricLebesgue p] inverseWishartPDF n S :=
  ⟨TauCeti.Probability.hasPDF_of_hasLaw_inverseWishartMeasure hX,
    pdf_eq_inverseWishartPDF_of_hasLaw_inverseWishartMeasure hS hn hX⟩

/-- The Radon-Nikodym derivative of the inverse-Wishart law against `symmetricLebesgue p`. -/
theorem rnDeriv_inverseWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    (inverseWishartMeasure n S).rnDeriv (symmetricLebesgue p) =ᵐ[symmetricLebesgue p]
      inverseWishartPDF n S :=
  TauCeti.Probability.rnDeriv_inverseWishartMeasure hS hn

/-- Zero in the same invalid-parameter cases as Wishart. -/
example : (¬ S.PosDef → inverseWishartMeasure n S = 0) ∧
    (n ≤ (p : ℝ) - 1 → inverseWishartMeasure n S = 0) :=
  ⟨inverseWishartMeasure_of_not_posDef n, inverseWishartMeasure_of_le S⟩

/-- The inversion change of variables on the positive-definite cone. -/
theorem map_inv_symmetricLebesgue (p : ℕ) :
    ((symmetricLebesgue p).restrict
        {A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) |
          (A : Matrix (Fin p) (Fin p) ℝ).PosDef}).map symmetricInv =
      ((symmetricLebesgue p).restrict
        {A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) |
          (A : Matrix (Fin p) (Fin p) ℝ).PosDef}).withDensity
        fun B => ENNReal.ofReal
          (Real.rpow (B : Matrix (Fin p) (Fin p) ℝ).det (-((p : ℝ) + 1))) :=
  map_symmetricInv_symmetricLebesgue p

/-- The inverse-Wishart density on the positive-definite cone. -/
theorem inverseWishartMeasure_eq_withDensity (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    inverseWishartMeasure n S = (symmetricLebesgue p).withDensity (inverseWishartPDF n S) ∧
    ∀ B : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ),
      (B : Matrix (Fin p) (Fin p) ℝ).PosDef →
      inverseWishartPDF n S B = ENNReal.ofReal (Real.rpow S.det (n / 2) *
          Real.rpow (B : Matrix (Fin p) (Fin p) ℝ).det (-((n + (p : ℝ) + 1) / 2)) *
            Real.exp (-Matrix.trace (S * (B : Matrix (Fin p) (Fin p) ℝ)⁻¹) / 2) /
          (Real.rpow 2 (n * (p : ℝ) / 2) * multivariateGamma p (n / 2))) :=
  ⟨inverseWishartMeasure_of_posDef hS hn, fun _ hB => inverseWishartPDF_of_posDef n S hB⟩

/-- The mean `(n - p - 1)⁻¹ • Sₛ` above the threshold (Tau Ceti needs no `0 < p`). -/
theorem integral_id_inverseWishartMeasure (hS : S.PosDef) (hn : (p : ℝ) + 1 < n) :
    ∫ B, B ∂inverseWishartMeasure n S =
      (n - (p : ℝ) - 1)⁻¹ • (⟨S, Matrix.isHermitian_iff_isSelfAdjoint.1 hS.1⟩ :
        selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) :=
  TauCeti.Probability.integral_id_inverseWishartMeasure hS hn

/-- Non-integrability of the identity at and below the threshold, within the valid family. -/
theorem not_integrable_id_inverseWishartMeasure (hp : 0 < p) (hS : S.PosDef)
    (hn : (p : ℝ) - 1 < n) (hn' : n ≤ (p : ℝ) + 1) :
    ¬ Integrable (fun B : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦ B)
      (inverseWishartMeasure n S) :=
  TauCeti.Probability.not_integrable_id_inverseWishartMeasure hp hS hn hn'

/-- At `p = 0` every valid inverse-Wishart law is Dirac, integrable, with mean zero. -/
theorem inverseWishartMeasure_zero (hn : -1 < n) (S : Matrix (Fin 0) (Fin 0) ℝ) :
    inverseWishartMeasure n S = Measure.dirac 0 ∧ Integrable id (inverseWishartMeasure n S) ∧
      ∫ B, B ∂inverseWishartMeasure n S = 0 :=
  ⟨TauCeti.Probability.inverseWishartMeasure_zero hn S,
    integrable_id_inverseWishartMeasure_zero hn S, integral_id_inverseWishartMeasure_zero hn S⟩

end InverseWishart

/-! ### Item 7: parameter measurability -/

section Measurability

variable (p : ℕ)

theorem measurable_nonsingularWishartMeasure :
    Measurable fun q : ℝ × (Fin p → Fin p → ℝ) =>
      nonsingularWishartMeasure q.1 (Matrix.of q.2) :=
  TauCeti.Probability.measurable_nonsingularWishartMeasure

theorem measurable_wishartGramMeasure :
    Measurable fun q : ℕ × (Fin p → Fin p → ℝ) => wishartGramMeasure q.1 (Matrix.of q.2) :=
  TauCeti.Probability.measurable_wishartGramMeasure

theorem measurable_inverseWishartMeasure :
    Measurable fun q : ℝ × (Fin p → Fin p → ℝ) => inverseWishartMeasure q.1 (Matrix.of q.2) :=
  TauCeti.Probability.measurable_inverseWishartMeasure

/-- The corollaries with the scale on the symmetric-matrix carrier. -/
example :
    (Measurable fun q : ℝ × selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) =>
      nonsingularWishartMeasure q.1 (q.2 : Matrix (Fin p) (Fin p) ℝ)) ∧
    (Measurable fun q : ℕ × selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) =>
      wishartGramMeasure q.1 (q.2 : Matrix (Fin p) (Fin p) ℝ)) ∧
    (Measurable fun q : ℝ × selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) =>
      inverseWishartMeasure q.1 (q.2 : Matrix (Fin p) (Fin p) ℝ)) :=
  ⟨measurable_nonsingularWishartMeasure_selfAdjoint, measurable_wishartGramMeasure_selfAdjoint,
    measurable_inverseWishartMeasure_selfAdjoint⟩

end Measurability

/-! ### Layer 6 completion checks -/

section CompletionChecks

/-- The `1 × 1` Gaussian-Gram law is a scaled chi-squared law for every `ν` and `0 ≤ σ²`. -/
example (ν : ℕ) {σ2 : ℝ} (hσ : 0 ≤ σ2) :
    (wishartGramMeasure ν (Matrix.of fun _ _ : Fin 1 => σ2)).map symmetricFinOneEquiv =
      (Probability.chiSquaredMeasure ν).map (σ2 * ·) :=
  map_symmetricFinOneEquiv_wishartGramMeasure ν hσ

/-- At `ν = 0` both sides are `dirac 0`. -/
example {σ2 : ℝ} :
    (wishartGramMeasure 0 (Matrix.of fun _ _ : Fin 1 => σ2)).map symmetricFinOneEquiv =
      Measure.dirac 0 ∧
    (Probability.chiSquaredMeasure 0).map (σ2 * ·) = Measure.dirac 0 := by
  constructor
  · rw [TauCeti.Probability.wishartGramMeasure_zero,
      Measure.map_dirac' symmetricFinOneEquiv.continuous.measurable, map_zero]
  · rw [Probability.chiSquaredMeasure_zero, Measure.map_dirac' (measurable_const_mul σ2),
      mul_zero]

/-- Where the two families agree, their trace mgfs, cgfs and characteristic functions are
literally the same formulas. -/
example {p ν : ℕ} {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef) (hp : p ≤ ν)
    (Θ : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) {t : ℝ}
    (ht : (1 - (2 * t) • (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef) :
    mgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (wishartGramMeasure ν S) t =
      mgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (nonsingularWishartMeasure (ν : ℝ) S) t ∧
    cgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (wishartGramMeasure ν S) t =
      cgf (fun A : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ) ↦
        ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)).trace)
      (nonsingularWishartMeasure (ν : ℝ) S) t ∧
    charFun (wishartGramMeasure ν S) Θ = charFun (nonsingularWishartMeasure (ν : ℝ) S) Θ := by
  have hn : (p : ℝ) - 1 < ν := by
    have : (p : ℝ) ≤ ν := by exact_mod_cast hp
    linarith
  refine ⟨?_, ?_, ?_⟩
  · rw [mgf_trace_mul_wishartGramMeasure Θ hS.posSemidef ht,
      mgf_trace_mul_nonsingularWishartMeasure Θ hS hn ht]
  · rw [cgf_trace_mul_wishartGramMeasure Θ hS.posSemidef ht,
      cgf_trace_mul_nonsingularWishartMeasure Θ hS hn ht]
  · rw [charFun_wishartGramMeasure, charFun_nonsingularWishartMeasure Θ hS hn]
    push_cast; rfl

/-- `multivariateGamma 1 a = Gamma a`. -/
example (a : ℝ) : multivariateGamma 1 a = Real.Gamma a := multivariateGamma_one a

end CompletionChecks

end Layer6

end TauCetiRoadmap.StandardDistributions

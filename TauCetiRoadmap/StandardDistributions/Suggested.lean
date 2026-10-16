import Mathlib
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
import TauCeti.LinearAlgebra.Matrix.Triangular
import TauCeti.MeasureTheory.Measure.GiryMonad
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Basic
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Cholesky
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Congruence
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Determinant
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Lebesgue
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.PosDef
import TauCeti.Probability.Cdf
import TauCeti.Probability.Distributions.Bernoulli.Basic
import TauCeti.Probability.Distributions.Binomial.Tail
import TauCeti.Probability.Distributions.Cauchy.Basic
import TauCeti.Probability.Distributions.Cauchy.PDF
import TauCeti.Probability.Distributions.ChiSquared
import TauCeti.Probability.Distributions.Dirichlet.Basic
import TauCeti.Probability.Distributions.Dirichlet.Moments
import TauCeti.Probability.Distributions.Exponential.Basic
import TauCeti.Probability.Distributions.Gamma.Basic
import TauCeti.Probability.Distributions.Gamma.Beta
import TauCeti.Probability.Distributions.Gamma.Cdf
import TauCeti.Probability.Distributions.Gamma.Measurability
import TauCeti.Probability.Distributions.Gamma.PDF
import TauCeti.Probability.Distributions.Gamma.Poisson
import TauCeti.Probability.Distributions.Gaussian.Affine
import TauCeti.Probability.Distributions.Gaussian.Cdf
import TauCeti.Probability.Distributions.Gaussian.ChiSquared
import TauCeti.Probability.Distributions.Gaussian.Conditional
import TauCeti.Probability.Distributions.Gaussian.Density
import TauCeti.Probability.Distributions.Gaussian.Multivariate
import TauCeti.Probability.Distributions.Gaussian.PDF
import TauCeti.Probability.Distributions.Gaussian.Pi
import TauCeti.Probability.Distributions.Gaussian.QuadraticForm
import TauCeti.Probability.Distributions.Gaussian.Transforms
import TauCeti.Probability.Distributions.InverseGamma.Basic
import TauCeti.Probability.Distributions.Laplace
import TauCeti.Probability.Distributions.LogNormal
import TauCeti.Probability.Distributions.Multinomial.Aggregation
import TauCeti.Probability.Distributions.Multinomial.Basic
import TauCeti.Probability.Distributions.Multinomial.Transforms
import TauCeti.Probability.Distributions.NegativeBinomial.Basic
import TauCeti.Probability.Distributions.Poisson.Measurability
import TauCeti.Probability.Distributions.Poisson.Tail
import TauCeti.Probability.Distributions.StudentT.Basic
import TauCeti.Probability.Distributions.StudentT.Cdf
import TauCeti.Probability.Distributions.StudentT.Moments
import TauCeti.Probability.Distributions.Uniform
import TauCeti.Probability.Distributions.Wishart.Agreement
import TauCeti.Probability.Distributions.Wishart.Bartlett
import TauCeti.Probability.Distributions.Wishart.Basic
import TauCeti.Probability.Distributions.Wishart.CharFun
import TauCeti.Probability.Distributions.Wishart.Congruence
import TauCeti.Probability.Distributions.Wishart.Inverse.Measurability
import TauCeti.Probability.Distributions.Wishart.Inverse.Moments
import TauCeti.Probability.Distributions.Wishart.Measurability
import TauCeti.Probability.Distributions.Wishart.Moments
import TauCeti.Probability.Distributions.Wishart.Nonsingular
import TauCeti.Probability.Distributions.Wishart.Transforms
import TauCeti.Probability.GeneratingFunction
import TauCeti.Probability.Moments.ComplexMGF
import TauCeti.Probability.Moments.Covariance
import TauCeti.Probability.Quantile

/-!
# Suggested declarations for standard probability distributions

This file gives possible Lean statements for milestones in [`README.md`](README.md). The roadmap
is authoritative: these declarations are examples, not an exhaustive API, and proving them does
not by itself complete a layer.

The file intentionally uses `sorry`. It makes the important choices of carrier, parameter type,
boundary behavior, and library interface concrete enough to review and implement.
Implemented objects are imported from Tau Ceti.
Local aliases keep the suggested statements readable.
Examples check public theorems, while new targets and extensions use suggested signatures.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Real Filter
open scoped ENNReal NNReal Topology unitInterval Matrix InnerProductSpace MatrixOrder

namespace TauCetiRoadmap.StandardDistributions

/-! ## Layer 0: Connect existing densities and add the uniform distribution -/

abbrev uniformMeasure (a b : ℝ) : Measure ℝ :=
  TauCeti.Probability.uniformMeasure a b

example (a b : ℝ) : uniformMeasure a b = ProbabilityTheory.cond volume (Set.Ioc a b) := rfl

example {a b : ℝ} (hab : a < b) :
    IsProbabilityMeasure (uniformMeasure a b) := by
  solve_by_elim [TauCeti.Probability.isProbabilityMeasure_uniformMeasure]

example {a b : ℝ} (hab : a < b) :
    ∫ x, x ∂uniformMeasure a b = (a + b) / 2 := by
  solve_by_elim [TauCeti.Probability.integral_id_uniformMeasure]

example {a b : ℝ} (hab : a < b) :
    variance id (uniformMeasure a b) = (b - a) ^ 2 / 12 := by
  solve_by_elim [TauCeti.Probability.variance_id_uniformMeasure]

example {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {X : Ω → ℝ} {a r : ℝ} (hX : HasLaw X (gammaMeasure a r) P) :
    HasPDF X P := TauCeti.Probability.hasPDF_of_hasLaw_gammaMeasure hX

example {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {X : Ω → ℝ} {m : ℝ} {v : ℝ≥0} (hv : v ≠ 0) (hX : HasLaw X (gaussianReal m v) P) :
    HasPDF X P := by
  solve_by_elim [TauCeti.Probability.hasPDF_of_hasLaw_gaussianReal]

example {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {X : Ω → ℝ} {x₀ : ℝ} {γ : ℝ≥0} (hγ : γ ≠ 0) (hX : HasLaw X (cauchyMeasure x₀ γ) P) :
    HasPDF X P := by
  solve_by_elim [TauCeti.Probability.hasPDF_of_hasLaw_cauchyMeasure]

example :
    Measurable fun p : ℝ × ℝ => gammaMeasure p.1 p.2 := by
  solve_by_elim [TauCeti.Probability.measurable_gammaMeasure]

example :
    Measurable fun r : ℝ≥0 => poissonMeasure r := by
  solve_by_elim [TauCeti.Probability.measurable_poissonMeasure]

example {a b : ℝ} (hab : a < b) {t : ℝ} (ht : t ≠ 0) :
    charFun (uniformMeasure a b) t =
      (Complex.exp (Complex.I * (b : ℂ) * (t : ℂ)) - Complex.exp (Complex.I * (a : ℂ) * (t : ℂ))) /
        (Complex.I * ((b - a : ℝ) : ℂ) * (t : ℂ)) := by
  solve_by_elim [TauCeti.Probability.charFun_uniformMeasure]

/-! ## Layer 1: Complete the elementary theory of existing distributions -/

example {r t : ℝ} (hr : 0 < r) (ht : t < r) :
    mgf id (expMeasure r) t = r / (r - t) := by
  solve_by_elim [TauCeti.Probability.mgf_id_expMeasure]

example {r : ℝ} (hr : 0 < r) :
    variance id (expMeasure r) = (r ^ 2)⁻¹ := by
  solve_by_elim [TauCeti.Probability.variance_id_expMeasure]

example {a b r : ℝ} (ha : 0 < a) (hb : 0 < b) (hr : 0 < r) :
    (gammaMeasure a r) ∗ (gammaMeasure b r) = gammaMeasure (a + b) r := by
  solve_by_elim [TauCeti.Probability.gammaMeasure_conv_gammaMeasure]

example (x₀ : ℝ) (γ : ℝ≥0) (t : ℝ) :
    charFun (cauchyMeasure x₀ γ) t =
      Complex.exp ((t : ℂ) * x₀ * Complex.I - γ * |t|) := by
  solve_by_elim [TauCeti.Probability.charFun_cauchyMeasure]

example (x₀ : ℝ) (γ : ℝ≥0) (hγ : γ ≠ 0) :
    ¬ Integrable id (cauchyMeasure x₀ γ) := by
  solve_by_elim [TauCeti.Probability.not_integrable_id_cauchyMeasure]

/-! ### Probability generating functions -/

abbrev pgf {Ω : Type*} [MeasurableSpace Ω] (X : Ω → ℕ) (μ : Measure Ω) (t : ℝ) : ℝ :=
  TauCeti.Probability.pgf X μ t

example {Ω : Type*} [MeasurableSpace Ω] (X : Ω → ℕ) (μ : Measure Ω) (t : ℝ) :
    pgf X μ (rexp t) = mgf (fun ω => (X ω : ℝ)) μ t := by
  solve_by_elim [TauCeti.Probability.pgf_exp]

example (p : I) (t : ℝ) :
    pgf id (bernoulliMeasure (1 : ℕ) 0 p) t = 1 - (p : ℝ) + (p : ℝ) * t := by
  solve_by_elim [TauCeti.Probability.pgf_bernoulliMeasure]

-- Derivatives at zero extract coefficients; factorial moments would use derivatives at one.
example (μ : Measure ℕ) [IsProbabilityMeasure μ] (n : ℕ) :
    iteratedDeriv n (pgf id μ) 0 = (n.factorial : ℝ) * μ.real {n} := by
  solve_by_elim [TauCeti.Probability.iteratedDeriv_pgf_zero]

example {μ ν : Measure ℕ}
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (h : Set.EqOn (pgf id μ) (pgf id ν) (Set.Ioo (-1) 1)) :
    μ = ν := by
  solve_by_elim [TauCeti.Probability.measure_eq_of_pgf_eqOn]

/-! ## Layer 2: Incomplete special functions and closed-form cdfs -/

abbrev lowerIncompleteGamma (s x : ℝ) : ℝ :=
  TauCeti.lowerIncompleteGamma s x

abbrev regularizedGamma (s x : ℝ) : ℝ :=
  TauCeti.regularizedGamma s x

-- The `a = 0` branch makes the binomial tail formula below include `m = 0`.
abbrev regularizedIncompleteBeta (a b x : ℝ) : ℝ :=
  TauCeti.regularizedIncompleteBeta a b x

example {s x : ℝ} (hs : 0 < s) (hx : 0 < x) :
    HasDerivAt (lowerIncompleteGamma s) (x ^ (s - 1) * rexp (-x)) x := by
  solve_by_elim [TauCeti.hasDerivAt_lowerIncompleteGamma]

example {b x : ℝ} (hb : 0 < b) (hx : 0 ≤ x) :
    regularizedIncompleteBeta 0 b x = 1 := by
  solve_by_elim [TauCeti.regularizedIncompleteBeta_zero_left]

example {a b x : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hx₀ : 0 ≤ x) (hx₁ : x ≤ 1) :
    regularizedIncompleteBeta (a + 1) b x = regularizedIncompleteBeta a b x -
      Real.rpow x a * Real.rpow (1 - x) b / (a * ProbabilityTheory.beta a b) := by
  solve_by_elim [TauCeti.regularizedIncompleteBeta_add_one_left]

abbrev erf (x : ℝ) : ℝ :=
  TauCeti.Real.erf x

abbrev erfc (x : ℝ) : ℝ :=
  TauCeti.Real.erfc x

example {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (x : ℝ) :
    cdf (gammaMeasure a r) x = regularizedGamma a (r * x) := by
  solve_by_elim [TauCeti.Probability.cdf_gammaMeasure_eq]

example {m : ℝ} {v : ℝ≥0} (hv : v ≠ 0) (x : ℝ) :
    cdf (gaussianReal m v) x = (1 + erf ((x - m) / √(2 * v))) / 2 := by
  solve_by_elim [TauCeti.Probability.cdf_gaussianReal_eq]

example (m x : ℝ) :
    cdf (gaussianReal m 0) x = if m ≤ x then 1 else 0 := by
  solve_by_elim [TauCeti.Probability.cdf_gaussianReal_zero]

example {m n : ℕ} (hmn : m ≤ n) (p : I) :
    (binomial n p).real {k | m ≤ k} =
      regularizedIncompleteBeta m (n - m + 1) (p : ℝ) := by
  solve_by_elim [TauCeti.Probability.binomial_tail_eq_regularizedIncompleteBeta]

example (r : ℝ≥0) (n : ℕ) :
    (poissonMeasure r).real {k | n < k} = regularizedGamma (n + 1) (r : ℝ) := by
  solve_by_elim [TauCeti.Probability.poissonMeasure_tail_eq_regularizedGamma]

example {x : ℝ} (hx : 0 ≤ x) : regularizedGamma 1 x = 1 - rexp (-x) :=
  TauCeti.regularizedGamma_one hx

/-! ## Layer 3: New scalar families -/

abbrev laplacePDFReal (m b x : ℝ) : ℝ :=
  TauCeti.Probability.laplacePDFReal m b x

abbrev laplacePDF (m b x : ℝ) : ℝ≥0∞ :=
  TauCeti.Probability.laplacePDF m b x

abbrev laplaceMeasure (m b : ℝ) : Measure ℝ :=
  TauCeti.Probability.laplaceMeasure m b

example {b : ℝ} (hb : 0 < b) (m : ℝ) :
    IsProbabilityMeasure (laplaceMeasure m b) := by
  solve_by_elim [TauCeti.Probability.isProbabilityMeasure_laplaceMeasure]

example {b : ℝ} (hb : 0 < b) (m : ℝ) :
    ∫ x, x ∂laplaceMeasure m b = m := by
  solve_by_elim [TauCeti.Probability.integral_id_laplaceMeasure]

example {b : ℝ} (hb : 0 < b) (m : ℝ) :
    variance id (laplaceMeasure m b) = 2 * b ^ 2 := by
  solve_by_elim [TauCeti.Probability.variance_id_laplaceMeasure]

example {b : ℝ} (hb : 0 < b) (m t : ℝ) :
    charFun (laplaceMeasure m b) t =
      Complex.exp (Complex.I * m * t) / (1 + b ^ 2 * t ^ 2) := by
  solve_by_elim [TauCeti.Probability.charFun_laplaceMeasure]

abbrev chiSquaredMeasure (k : ℝ) : Measure ℝ :=
  TauCeti.Probability.chiSquaredMeasure k

example (k : ℝ) : chiSquaredMeasure k =
    if k = 0 then Measure.dirac 0 else if 0 < k then gammaMeasure (k / 2) (1 / 2) else 0 := rfl

example {k : ℝ} (hk : 0 < k) :
    chiSquaredMeasure k = gammaMeasure (k / 2) (1 / 2) := by
  solve_by_elim [TauCeti.Probability.chiSquaredMeasure_eq_gammaMeasure]

example : chiSquaredMeasure 0 = Measure.dirac 0 := by
  solve_by_elim [TauCeti.Probability.chiSquaredMeasure_zero]

example {k : ℝ} (hk : 0 < k) (t : ℝ) :
    charFun (chiSquaredMeasure k) t =
      (1 - 2 * Complex.I * t) ^ (-(k : ℂ) / 2) := by
  exact TauCeti.Probability.charFun_chiSquaredMeasure hk.le t

abbrev logNormalMeasure (m : ℝ) (v : ℝ≥0) : Measure ℝ :=
  TauCeti.Probability.logNormalMeasure m v

example {m : ℝ} {v : ℝ≥0} (n : ℕ) :
    ∫ x, x ^ n ∂logNormalMeasure m v = rexp (n * m + n ^ 2 * v / 2) := by
  solve_by_elim [TauCeti.Probability.integral_pow_logNormalMeasure]

example {m : ℝ} {v : ℝ≥0} (hv : v ≠ 0) {t : ℝ} (ht : 0 < t) :
    ¬ Integrable (fun x => rexp (t * x)) (logNormalMeasure m v) := by
  solve_by_elim [TauCeti.Probability.not_integrable_exp_mul_logNormalMeasure]

def logNormalMomentPerturbation (ε : ℝ) : Measure ℝ :=
  (logNormalMeasure 0 1).withDensity
    (fun x => ENNReal.ofReal (1 + ε * Real.sin (2 * Real.pi * Real.log x)))

theorem isProbabilityMeasure_logNormalMomentPerturbation {ε : ℝ} (hε : |ε| ≤ 1) :
    IsProbabilityMeasure (logNormalMomentPerturbation ε) := by sorry

theorem logNormalMomentPerturbation_injective :
    Set.InjOn logNormalMomentPerturbation (Set.Icc (-1 : ℝ) 1) := by sorry

theorem integral_pow_logNormalMomentPerturbation {ε : ℝ} (hε : |ε| ≤ 1) (n : ℕ) :
    Integrable (fun x : ℝ => x ^ n) (logNormalMomentPerturbation ε) ∧
      ∫ x, x ^ n ∂logNormalMomentPerturbation ε = Real.exp ((n : ℝ) ^ 2 / 2) := by sorry


abbrev studentTPDFReal (ν x : ℝ) : ℝ :=
  TauCeti.Probability.studentTPDFReal ν x

abbrev studentTMeasure (ν : ℝ) : Measure ℝ :=
  TauCeti.Probability.studentTMeasure ν

example (ν : ℝ) : studentTMeasure ν =
    volume.withDensity (fun x => ENNReal.ofReal (studentTPDFReal ν x)) := rfl

example {ν : ℝ} (hν : 0 < ν) (x : ℝ) :
    cdf (studentTMeasure ν) x =
      if x < 0 then
        regularizedIncompleteBeta (ν / 2) (1 / 2) (ν / (ν + x ^ 2)) / 2
      else
        1 - regularizedIncompleteBeta (ν / 2) (1 / 2) (ν / (ν + x ^ 2)) / 2 := by
  solve_by_elim [TauCeti.Probability.cdf_studentTMeasure_eq]

example {ν : ℝ} :
    ∫ x, x ∂studentTMeasure ν = 0 := by
  solve_by_elim [TauCeti.Probability.integral_id_studentTMeasure]

example {ν : ℝ} (hν0 : 0 < ν) (hν1 : ν ≤ 1) :
    ¬ Integrable id (studentTMeasure ν) := by
  simpa only [TauCeti.Probability.integrable_id_studentTMeasure_iff hν0, not_lt] using hν1

example {ν : ℝ} (hν0 : 0 < ν) (hν2 : ν ≤ 2) :
    ¬ Integrable (fun x : ℝ => x ^ 2) (studentTMeasure ν) := by
  solve_by_elim [TauCeti.Probability.not_integrable_sq_studentTMeasure]

example : studentTMeasure 1 = cauchyMeasure 0 1 :=
  TauCeti.Probability.studentTMeasure_one

abbrev negativeBinomialMeasure (r p : ℝ) : Measure ℕ :=
  TauCeti.Probability.negativeBinomialMeasure r p

/-! ## Layer 4: Relationships among distributions -/

example :
    (gaussianReal 0 1).map (fun x => x ^ 2) = chiSquaredMeasure 1 :=
  TauCeti.Probability.gaussianReal_map_sq

example {a b r : ℝ} (ha : 0 < a) (hb : 0 < b) (hr : 0 < r) :
    ((gammaMeasure a r).prod (gammaMeasure b r)).map
        (fun z => (z.1 / (z.1 + z.2), z.1 + z.2)) =
      (betaMeasure a b).prod (gammaMeasure (a + b) r) := by
  solve_by_elim [TauCeti.Probability.map_div_add_prod_gammaMeasure]

example {r p : ℝ} (hr : 0 < r) (hp : p ∈ Set.Ioo (0 : ℝ) 1) :
    (gammaMeasure r (p / (1 - p))).bind (fun lam => poissonMeasure (Real.toNNReal lam)) =
      negativeBinomialMeasure r p := by
  exact TauCeti.Probability.bind_gammaMeasure_poissonMeasure hr hp.1 hp.2

/-! ## Layer 5: Multivariate distributions -/

/-! ### Multivariate Gaussian distributions -/

abbrev covMatrix {ι : Type*} [Fintype ι] (μ : Measure (EuclideanSpace ℝ ι)) :
    Matrix ι ι ℝ :=
  TauCeti.covMatrix μ

example {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : S.PosSemidef) :
    covMatrix (multivariateGaussian m S) = S := by
  solve_by_elim [TauCeti.Probability.covMatrix_multivariateGaussian]

example {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) :
    ∫ x, x ∂multivariateGaussian m S = m :=
  ProbabilityTheory.integral_id_multivariateGaussian

example {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m θ : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) :
    integrableExpSet (fun x => ⟪θ, x⟫_ℝ) (multivariateGaussian m S) = Set.univ :=
  TauCeti.Probability.integrableExpSet_inner_multivariateGaussian m θ S

example {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m θ : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : S.PosSemidef) (t : ℝ) :
    mgf (fun x => ⟪θ, x⟫_ℝ) (multivariateGaussian m S) t =
      rexp (t * ⟪θ, m⟫_ℝ + t ^ 2 / 2 * ⟪θ, S.toEuclideanLin θ⟫_ℝ) := by
  solve_by_elim [TauCeti.Probability.mgf_inner_multivariateGaussian]

-- `covarianceBilin` is zero outside `MemLp id 2 μ`; the entrywise matrix need not be.
example {ι : Type*} [Fintype ι] [DecidableEq ι]
    {μ : Measure (EuclideanSpace ℝ ι)} [IsFiniteMeasure μ] (h : MemLp id 2 μ)
    (x y : EuclideanSpace ℝ ι) :
    covarianceBilin μ x y = ⟪x, (covMatrix μ).toEuclideanLin y⟫_ℝ := by
  solve_by_elim [TauCeti.covarianceBilin_eq_covMatrix]

abbrev multivariateGaussianPDFReal {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) (x : EuclideanSpace ℝ ι) : ℝ :=
  TauCeti.Probability.multivariateGaussianPDFReal m S x

abbrev multivariateGaussianPDF {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) (x : EuclideanSpace ℝ ι) : ℝ≥0∞ :=
  TauCeti.Probability.multivariateGaussianPDF m S x

example {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : S.PosDef) :
    (multivariateGaussian m S).rnDeriv volume =ᵐ[volume]
      multivariateGaussianPDF m S := by
  solve_by_elim [TauCeti.Probability.rnDeriv_multivariateGaussian]

example {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : ¬S.PosDef) :
    multivariateGaussian m S ⟂ₘ volume := by
  solve_by_elim [TauCeti.Probability.mutuallySingular_multivariateGaussian_volume]

example {Ω ι : Type*} [MeasurableSpace Ω] [Fintype ι]
    [DecidableEq ι] {P : Measure Ω}
    (X : Ω → EuclideanSpace ℝ ι) (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ}
    (hX : HasLaw X (multivariateGaussian m S) P) (hS : S.PosDef) :
    HasPDF X P := TauCeti.Probability.hasPDF_of_hasLaw_multivariateGaussian hS hX

example {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ] (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ}
    (hS : S.PosSemidef) (L : Matrix κ ι ℝ) (c : EuclideanSpace ℝ κ) :
    (multivariateGaussian m S).map (fun x => L.toEuclideanLin x + c) =
      multivariateGaussian (L.toEuclideanLin m + c) (L * S * Lᵀ) := by
  solve_by_elim [TauCeti.Probability.map_affine_multivariateGaussian]

-- The quadratic form `x ↦ ⟪x, Θ x⟫` of a centred Gaussian: exact domain and mgf.
-- `det (1 - 2t • Θ S) = det (1 - 2t • √S Θ √S)` by `CFC.sqrt_mul_sqrt_self` and
-- `Matrix.det_one_add_mul_comm`, so the value is a positive real power on the domain.
example {ι : Type*}
    [Fintype ι] [DecidableEq ι] {S Θ : Matrix ι ι ℝ} (hΘ : Θ.IsHermitian)
    (t : ℝ) :
    t ∈ integrableExpSet (fun x => ⟪x, Θ.toEuclideanLin x⟫_ℝ) (multivariateGaussian 0 S) ↔
      (1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef := by
  solve_by_elim
    [TauCeti.Probability.mem_integrableExpSet_inner_toEuclideanLin_multivariateGaussian_iff]

example {ι : Type*} [Fintype ι] [DecidableEq ι]
    {S Θ : Matrix ι ι ℝ} (hS : S.PosSemidef) (hΘ : Θ.IsHermitian) {t : ℝ}
    (ht : (1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef) :
    mgf (fun x => ⟪x, Θ.toEuclideanLin x⟫_ℝ) (multivariateGaussian 0 S) t =
      Real.rpow (Matrix.det (1 - (2 * t) • (Θ * S))) (-1 / 2) := by
  solve_by_elim [TauCeti.Probability.mgf_inner_toEuclideanLin_multivariateGaussian]

-- State matrix-parameter measurability through the coordinate carrier and `Matrix.of`.
example {ι : Type*} [Fintype ι] [DecidableEq ι] :
    Measurable fun q : EuclideanSpace ℝ ι × (ι → ι → ℝ) =>
      multivariateGaussian q.1 (Matrix.of q.2) :=
  ProbabilityTheory.measurable_multivariateGaussian

/-! ### Multinomial and Dirichlet distributions -/

abbrev multinomialMeasure {ι : Type*} [Fintype ι] [Nonempty ι] (n : ℕ)
    (p : Convexity.StdSimplex ℝ≥0 ι) : Measure (ι → ℕ) :=
  TauCeti.Probability.multinomialMeasure n p

example {ι : Type*} [Fintype ι] [Nonempty ι]
    (n : ℕ) (p : Convexity.StdSimplex ℝ≥0 ι) :
    IsProbabilityMeasure (multinomialMeasure n p) := by
  solve_by_elim [TauCeti.Probability.isProbabilityMeasure_multinomialMeasure]

example {ι κ : Type*} [Fintype ι] [Nonempty ι] [Fintype κ]
    [Nonempty κ] [DecidableEq κ] (n : ℕ) (p : Convexity.StdSimplex ℝ≥0 ι) (f : ι → κ) :
    (multinomialMeasure n p).map (FunOnFinite.map (M := ℕ) f) =
      multinomialMeasure n (Convexity.StdSimplex.map f p) :=
  TauCeti.Probability.map_funOnFinite_map_multinomialMeasure f n p

abbrev multinomialToEuclidean {ι : Type*} [Fintype ι] (k : ι → ℕ) :
    EuclideanSpace ℝ ι :=
  TauCeti.Probability.multinomialToEuclidean k

example {ι : Type*} [Fintype ι]
    [Nonempty ι] [DecidableEq ι] (n : ℕ) (p : Convexity.StdSimplex ℝ≥0 ι)
    (θ : EuclideanSpace ℝ ι) :
    integrableExpSet (fun x => ⟪θ, x⟫_ℝ)
      ((multinomialMeasure n p).map multinomialToEuclidean) = Set.univ := by
  solve_by_elim [TauCeti.Probability.integrableExpSet_inner_multinomial]

example {ι : Type*} [Fintype ι] [Nonempty ι]
    [DecidableEq ι] (n : ℕ) (p : Convexity.StdSimplex ℝ≥0 ι)
    (θ : EuclideanSpace ℝ ι) (t : ℝ) :
    mgf (fun x => ⟪θ, x⟫_ℝ) ((multinomialMeasure n p).map multinomialToEuclidean) t =
      (∑ j, (p.weights j : ℝ) * rexp (t * θ j)) ^ n := by
  solve_by_elim [TauCeti.Probability.mgf_inner_multinomial]

open scoped Classical in

abbrev dirichletMeasure {ι : Type*} [Fintype ι] [Nonempty ι] (a : ι → ℝ) :
    Measure (EuclideanSpace ℝ ι) :=
  TauCeti.Probability.dirichletMeasure a

example {ι : Type*} [Fintype ι] [Nonempty ι]
    {a : ι → ℝ} (ha : ∀ i, 0 < a i) :
    IsProbabilityMeasure (dirichletMeasure a) := by
  solve_by_elim [TauCeti.Probability.isProbabilityMeasure_dirichletMeasure]

example {ι : Type*} [Fintype ι] [Nonempty ι] [Nontrivial ι]
    [DecidableEq ι] {a : ι → ℝ} (ha : ∀ i, 0 < a i) (i : ι) :
    (dirichletMeasure a).map (fun x => x i) =
      betaMeasure (a i) (∑ j with j ≠ i, a j) := by
  solve_by_elim [TauCeti.Probability.map_eval_dirichletMeasure]

example {ι : Type*} [Fintype ι]
    [Nonempty ι] [DecidableEq ι] {a : ι → ℝ}
    (θ : EuclideanSpace ℝ ι) :
    integrableExpSet (fun x => ⟪θ, x⟫_ℝ) (dirichletMeasure a) = Set.univ := by
  solve_by_elim [TauCeti.Probability.integrableExpSet_inner_dirichletMeasure]

/-! ### Dirichlet concentration limits -/

def dirichletConcentrationLaw {ι : Type*} [Fintype ι] [Nonempty ι]
    (p : Convexity.StdSimplex ℝ ι) (hp : ∀ i, 0 < p.weights i) (c : Set.Ioi (0 : ℝ)) :
    ProbabilityMeasure (EuclideanSpace ℝ ι) :=
  ⟨dirichletMeasure (fun i => c.val * p.weights i),
    TauCeti.Probability.isProbabilityMeasure_dirichletMeasure (fun i => mul_pos c.property (hp i))⟩

theorem tendsto_dirichletMeasure_concentration_atTop {ι : Type*} [Fintype ι] [Nonempty ι]
    (p : Convexity.StdSimplex ℝ ι) (hp : ∀ i, 0 < p.weights i) :
    Tendsto (dirichletConcentrationLaw p hp) (Filter.comap Subtype.val atTop)
      (𝓝 ((Measure.dirac ((EuclideanSpace.equiv ι ℝ).symm p.weights)).toProbabilityMeasure)) :=
  by sorry

theorem tendsto_dirichletMeasure_concentration_zero {ι : Type*} [Fintype ι] [Nonempty ι]
    [DecidableEq ι] (p : Convexity.StdSimplex ℝ ι) (hp : ∀ i, 0 < p.weights i) :
    Tendsto (dirichletConcentrationLaw p hp) (Filter.comap Subtype.val (𝓝[>] (0 : ℝ)))
      (𝓝 (⟨∑ i, ENNReal.ofReal (p.weights i) •
        Measure.dirac ((EuclideanSpace.equiv ι ℝ).symm (Pi.single i 1)), by sorry⟩ :
          ProbabilityMeasure (EuclideanSpace ℝ ι))) := by sorry

/-! ### Conditional multivariate Gaussian distributions -/

example {Ω ι κ : Type*} [MeasurableSpace Ω] [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ] {P : Measure Ω} [IsProbabilityMeasure P]
    (X : Ω → EuclideanSpace ℝ (ι ⊕ κ)) (m : EuclideanSpace ℝ (ι ⊕ κ))
    {S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ}
    (hX : HasLaw X (multivariateGaussian m S) P) (hS : S.PosSemidef)
    (hS₂₂ : (S.submatrix Sum.inr Sum.inr).PosDef) :
    condDistrib (fun ω => (EuclideanSpace.sumEquivProd (X ω)).1)
        (fun ω => (EuclideanSpace.sumEquivProd (X ω)).2) P
      =ᵐ[P.map (fun ω => (EuclideanSpace.sumEquivProd (X ω)).2)]
        EuclideanSpace.gaussianCondKernel m S :=
  TauCeti.Probability.condDistrib_multivariateGaussian X m hX hS hS₂₂

/-! ### Conditioning on a possibly singular observed block

The following definitions propose an extension of the public conditional API.
The positive-definite case is checked against the current public kernel below.
-/

open Classical in
def covariancePseudoInverse {ι : Type*} [Fintype ι] [DecidableEq ι]
    (S : Matrix ι ι ℝ) : Matrix ι ι ℝ :=
  if S.PosSemidef then cfc (fun x : ℝ => x⁻¹) S else 0

theorem covariancePseudoInverse_of_not_posSemidef {ι : Type*} [Fintype ι] [DecidableEq ι]
    {S : Matrix ι ι ℝ} (hS : ¬ S.PosSemidef) : covariancePseudoInverse S = 0 := by
  simp [covariancePseudoInverse, hS]

theorem covariancePseudoInverse_penrose {ι : Type*} [Fintype ι] [DecidableEq ι]
    {S : Matrix ι ι ℝ} (hS : S.PosSemidef) :
    let C := covariancePseudoInverse S
    C.PosSemidef ∧ S * C * S = S ∧ C * S * C = C ∧
      (S * C).IsHermitian ∧ (C * S).IsHermitian := by sorry

theorem covariancePseudoInverse_eq_inv {ι : Type*} [Fintype ι] [DecidableEq ι]
    {S : Matrix ι ι ℝ} (hS : S.PosDef) : covariancePseudoInverse S = S⁻¹ := by sorry

theorem measurable_covariancePseudoInverse {ι : Type*} [Fintype ι] [DecidableEq ι] :
    Measurable fun S : ι → ι → ℝ => covariancePseudoInverse (Matrix.of S) := by sorry

theorem Matrix.PosSemidef.ker_toBlocks₂₂_le_ker_toBlocks₁₂
    {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq κ]
    {S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ} (hS : S.PosSemidef) :
    LinearMap.ker S.toBlocks₂₂.toEuclideanLin ≤
      LinearMap.ker S.toBlocks₁₂.toEuclideanLin := by sorry

theorem Matrix.PosSemidef.range_toBlocks₂₁_le_range_toBlocks₂₂
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ] {S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ} (hS : S.PosSemidef) :
    LinearMap.range S.toBlocks₂₁.toEuclideanLin ≤
      LinearMap.range S.toBlocks₂₂.toEuclideanLin := by sorry

def gaussianCondMean {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq κ]
    (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ)
    (x₂ : EuclideanSpace ℝ κ) : EuclideanSpace ℝ ι :=
  (EuclideanSpace.sumEquivProd m).1 +
    (S.submatrix Sum.inl Sum.inr *
      covariancePseudoInverse (S.submatrix Sum.inr Sum.inr)).toEuclideanLin
      (x₂ - (EuclideanSpace.sumEquivProd m).2)

def gaussianCondCov {ι κ : Type*} [Fintype κ] [DecidableEq κ]
    (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) : Matrix ι ι ℝ :=
  S.submatrix Sum.inl Sum.inl -
    S.submatrix Sum.inl Sum.inr * covariancePseudoInverse (S.submatrix Sum.inr Sum.inr) *
      S.submatrix Sum.inr Sum.inl

theorem posSemidef_gaussianCondCov {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ] {S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ}
    (hS : S.PosSemidef) : (gaussianCondCov S).PosSemidef := by sorry

def gaussianCondKernel {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ]
    (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) :
    Kernel (EuclideanSpace ℝ κ) (EuclideanSpace ℝ ι) where
  toFun x₂ := multivariateGaussian (gaussianCondMean m S x₂) (gaussianCondCov S)
  measurable' := by sorry

instance isMarkovKernel_gaussianCondKernel {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ]
    (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) :
    IsMarkovKernel (gaussianCondKernel m S) := ⟨fun _ => by
  change IsProbabilityMeasure (multivariateGaussian _ _)
  infer_instance⟩

theorem gaussianCondKernel_eq_of_posDef {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ]
    (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ)
    (hS₂₂ : (S.submatrix Sum.inr Sum.inr).PosDef) :
    gaussianCondKernel m S = EuclideanSpace.gaussianCondKernel m S := by sorry

theorem condDistrib_multivariateGaussian
    {Ω ι κ : Type*} [MeasurableSpace Ω] [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ] {P : Measure Ω} [IsProbabilityMeasure P]
    (X : Ω → EuclideanSpace ℝ (ι ⊕ κ))
    (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ)
    (hX : HasLaw X (multivariateGaussian m S) P) (hS : S.PosSemidef) :
    condDistrib (fun ω => (EuclideanSpace.sumEquivProd (X ω)).1)
        (fun ω => (EuclideanSpace.sumEquivProd (X ω)).2) P
      =ᵐ[P.map (fun ω => (EuclideanSpace.sumEquivProd (X ω)).2)] gaussianCondKernel m S := by sorry

example (a b : ℝ) (ha : b ^ 2 ≤ a) (m : EuclideanSpace ℝ (Fin 1 ⊕ Fin 2))
    (x₂ : EuclideanSpace ℝ (Fin 2)) :
    let S : Matrix (Fin 1 ⊕ Fin 2) (Fin 1 ⊕ Fin 2) ℝ :=
      Matrix.fromBlocks !![a] !![b, 0] !![b; 0] !![1, 0; 0, 0]
    S.PosSemidef ∧
      (gaussianCondKernel m S x₂).map (fun x => x 0) =
        gaussianReal (m (Sum.inl 0) + b * (x₂ 0 - m (Sum.inr 0)))
          (a - b ^ 2).toNNReal := by sorry

/-! ## Layer 6: Symmetric matrices and Wishart distributions -/

/-! ### Symmetric-matrix coordinates and Lebesgue measure -/

-- This private abbreviation keeps the prototypes readable. It unfolds in exported declarations,
-- so it does not propose a public Mathlib alias.
private abbrev SymmetricMatrix (p : ℕ) : Submodule ℝ (Matrix (Fin p) (Fin p) ℝ) :=
  selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)

abbrev upperTriangle (p : ℕ) :=
  TauCeti.upperTriangle p

example (p : ℕ) :
    (inferInstance : TopologicalSpace (SymmetricMatrix p)) =
      @instTopologicalSpaceSubtype _ _ inferInstance := by
  rfl

example (p : ℕ) :
    (inferInstance : UniformSpace (SymmetricMatrix p)) =
      @instUniformSpaceSubtype _ _ inferInstance := by
  rfl

example (p : ℕ) :
    (inferInstance : UniformSpace (SymmetricMatrix p)).toTopologicalSpace =
      (inferInstance : TopologicalSpace (SymmetricMatrix p)) := by
  rfl

example (p : ℕ) :
    Continuous (fun A : SymmetricMatrix p =>
      (A : Matrix (Fin p) (Fin p) ℝ)) :=
  continuous_subtype_val

abbrev symmetricCoordinates (p : ℕ) :
    SymmetricMatrix p ≃L[ℝ] (upperTriangle p → ℝ) :=
  TauCeti.symmetricCoordinates p

abbrev symmetricCoordinatesMeasurableEquiv (p : ℕ) :
    SymmetricMatrix p ≃ᵐ (upperTriangle p → ℝ) :=
  TauCeti.symmetricCoordinatesMeasurableEquiv p

example (p : ℕ) :
    Module.finrank ℝ (SymmetricMatrix p) = p * (p + 1) / 2 := by
  solve_by_elim [TauCeti.finrank_symmetricMatrix]

example {p : ℕ} (A Θ : SymmetricMatrix p) :
    ⟪A, Θ⟫_ℝ =
      Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)) :=
  selfAdjoint.inner_eq_trace_mul A Θ

abbrev symmetricLebesgue (p : ℕ) : Measure (SymmetricMatrix p) :=
  TauCeti.symmetricLebesgue p

example (p : ℕ) :
    MeasurePreserving (symmetricCoordinates p).symm volume (symmetricLebesgue p) := by
  solve_by_elim [TauCeti.measurePreserving_symmetricCoordinates_symm]

example (p : ℕ) :
    (volume : Measure (SymmetricMatrix p)) =
      ENNReal.ofReal (Real.rpow 2 (((p : ℝ) * ((p : ℝ) - 1)) / 4)) •
        symmetricLebesgue p := by
  solve_by_elim [TauCeti.volume_symmetricMatrix_eq_smul_symmetricLebesgue]

example : symmetricLebesgue 0 = Measure.dirac 0 := by
  solve_by_elim [TauCeti.symmetricLebesgue_zero]

-- Expand `det` along one diagonal coordinate and use Fubini, inducting on `p`; suitable imported
-- polynomial-zero-locus infrastructure may replace parts of this argument.
example (p : ℕ) :
    symmetricLebesgue p {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).det = 0} = 0 := by
  solve_by_elim [TauCeti.symmetricLebesgue_setOf_det_eq_zero]

abbrev symmetricCongruence {p : ℕ} (C : Matrix.GeneralLinearGroup (Fin p) ℝ) :
    SymmetricMatrix p ≃L[ℝ] SymmetricMatrix p :=
  C.symmetricCongruence

example {p : ℕ} (C : Matrix.GeneralLinearGroup (Fin p) ℝ) :
    LinearMap.det (symmetricCongruence C).toLinearMap =
      Matrix.det (C : Matrix (Fin p) (Fin p) ℝ) ^ (p + 1) := by
  solve_by_elim [Matrix.GeneralLinearGroup.det_symmetricCongruence]

example {p : ℕ}
    (C : Matrix.GeneralLinearGroup (Fin p) ℝ) :
    (symmetricLebesgue p).map (symmetricCongruence C) =
      (ENNReal.ofReal |Matrix.det (C : Matrix (Fin p) (Fin p) ℝ)| ^ (p + 1))⁻¹ •
        symmetricLebesgue p := by
  solve_by_elim [Matrix.GeneralLinearGroup.map_symmetricCongruence_symmetricLebesgue]

/-! ### Cholesky coordinates -/

abbrev PosDefMatrix (p : ℕ) :=
  TauCeti.PosDefMatrix p

example (p : ℕ) :
    MeasurableSet {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef} := by
  solve_by_elim [TauCeti.measurableSet_posDefMatrix]

abbrev PosDiagLowerTriangular (p : ℕ) :=
  TauCeti.PosDiagLowerTriangular p

abbrev lowerTriangle (p : ℕ) :=
  TauCeti.lowerTriangle p

abbrev PosDiagLowerCoordinates (p : ℕ) :=
  TauCeti.PosDiagLowerCoordinates p

example (p : ℕ) :
    (inferInstance : TopologicalSpace (PosDiagLowerTriangular p)) =
      @instTopologicalSpaceSubtype _ _ inferInstance := by
  rfl

example (p : ℕ) :
    (inferInstance : UniformSpace (PosDiagLowerTriangular p)) =
      @instUniformSpaceSubtype _ _ inferInstance := by
  rfl

abbrev lowerTriangleCoordinatesHomeomorph (p : ℕ) :
    PosDiagLowerTriangular p ≃ₜ PosDiagLowerCoordinates p :=
  TauCeti.lowerTriangleCoordinatesHomeomorph p

abbrev lowerTriangleCoordinates (p : ℕ) :
    PosDiagLowerTriangular p ≃ᵐ PosDiagLowerCoordinates p :=
  TauCeti.lowerTriangleCoordinates p

abbrev choleskyEquiv {p : ℕ} :
    PosDefMatrix p ≃ PosDiagLowerTriangular p :=
  TauCeti.choleskyEquiv

abbrev cholesky {p : ℕ} : PosDefMatrix p → PosDiagLowerTriangular p :=
  TauCeti.cholesky

abbrev choleskyReconstruction {p : ℕ} :
    PosDiagLowerTriangular p → PosDefMatrix p :=
  TauCeti.choleskyReconstruction

example {p : ℕ} (A : PosDefMatrix p) :
    (cholesky A).1 * ((cholesky A).1)ᵀ =
      (A.1 : Matrix (Fin p) (Fin p) ℝ) := by
  solve_by_elim [TauCeti.cholesky_mul_transpose]

example {p : ℕ} (A : PosDefMatrix p) (L : PosDiagLowerTriangular p)
    (hL : L.1 * L.1ᵀ = (A.1 : Matrix (Fin p) (Fin p) ℝ)) :
    L = cholesky A := by
  solve_by_elim [TauCeti.eq_cholesky_of_mul_transpose_self_eq]

example {p : ℕ} (L : PosDiagLowerTriangular p) :
    ((choleskyReconstruction L).1 : Matrix (Fin p) (Fin p) ℝ) = L.1 * L.1ᵀ := by
  solve_by_elim [TauCeti.choleskyReconstruction_coe]

example {p : ℕ} (A : PosDefMatrix p) :
    choleskyReconstruction (cholesky A) = A := by
  solve_by_elim [TauCeti.choleskyReconstruction_cholesky]

example {p : ℕ} (L : PosDiagLowerTriangular p) :
    cholesky (choleskyReconstruction L) = L := by
  solve_by_elim [TauCeti.cholesky_choleskyReconstruction]

example {p : ℕ} :
    Continuous (@cholesky p) := by
  solve_by_elim [TauCeti.continuous_cholesky]

example {p : ℕ} :
    Continuous (@choleskyReconstruction p) := by
  solve_by_elim [TauCeti.continuous_choleskyReconstruction]

abbrev choleskyHomeomorph {p : ℕ} :
    PosDefMatrix p ≃ₜ PosDiagLowerTriangular p :=
  TauCeti.choleskyHomeomorph

example {p : ℕ} :
    Measurable (@cholesky p) := by
  solve_by_elim [TauCeti.measurable_cholesky]

example {p : ℕ} :
    Measurable (@choleskyReconstruction p) := by
  solve_by_elim [TauCeti.measurable_choleskyReconstruction]

abbrev choleskyMeasurableEquiv {p : ℕ} :
    PosDefMatrix p ≃ᵐ PosDiagLowerTriangular p :=
  TauCeti.choleskyMeasurableEquiv

abbrev choleskyReconstructionCoordinates (p : ℕ) :
    (lowerTriangle p → ℝ) → (lowerTriangle p → ℝ) :=
  TauCeti.choleskyReconstructionCoordinates p

example {p : ℕ} (x : lowerTriangle p → ℝ)
    (hx : ∀ i : Fin p, 0 < x ⟨(i, i), le_rfl⟩) :
    |(fderiv ℝ (choleskyReconstructionCoordinates p) x).det| =
      (2 : ℝ) ^ p * ∏ i : Fin p, x ⟨(i, i), le_rfl⟩ ^ (p - i.1) := by
  solve_by_elim [TauCeti.abs_det_fderiv_choleskyReconstructionCoordinates]

example (p : ℕ) :
    ((volume.restrict (TauCeti.posDiagLowerRegion p)).withDensity
        (TauCeti.choleskyJacobianDensity p)).map (TauCeti.lowerTriangleGram p) =
      (symmetricLebesgue p).restrict
        {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef} :=
  TauCeti.map_cholesky_symmetricLebesgue p

/-! ### Wishart distributions -/

abbrev multivariateGamma (p : ℕ) (a : ℝ) : ℝ :=
  TauCeti.multivariateGamma p a

example {p : ℕ} {a : ℝ}
    (ha : ((p : ℝ) - 1) / 2 < a) :
    ∫ A in {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef},
      Real.rpow (A : Matrix (Fin p) (Fin p) ℝ).det (a - ((p : ℝ) + 1) / 2) *
        rexp (-Matrix.trace (A : Matrix (Fin p) (Fin p) ℝ)) ∂symmetricLebesgue p =
      multivariateGamma p a := by
  solve_by_elim [TauCeti.integral_posDef_multivariateGamma]

example (a : ℝ) :
    ∫ A in {A : SymmetricMatrix 0 | (A : Matrix (Fin 0) (Fin 0) ℝ).PosDef},
      Real.rpow (A : Matrix (Fin 0) (Fin 0) ℝ).det (a - (1 : ℝ) / 2) *
        rexp (-Matrix.trace (A : Matrix (Fin 0) (Fin 0) ℝ)) ∂symmetricLebesgue 0 =
      multivariateGamma 0 a := by
  solve_by_elim [TauCeti.integral_posDef_multivariateGamma_zero]

open scoped Classical in

abbrev nonsingularWishartPDFReal {p : ℕ} (n : ℝ) (S : Matrix (Fin p) (Fin p) ℝ)
    (A : SymmetricMatrix p) : ℝ :=
  TauCeti.Probability.nonsingularWishartPDFReal n S A

open scoped Classical in

abbrev nonsingularWishartMeasure {p : ℕ} (n : ℝ)
    (S : Matrix (Fin p) (Fin p) ℝ) :
    Measure (SymmetricMatrix p) :=
  TauCeti.Probability.nonsingularWishartMeasure n S

example {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    IsProbabilityMeasure (nonsingularWishartMeasure n S) := by
  solve_by_elim [TauCeti.Probability.isProbabilityMeasure_nonsingularWishartMeasure]

noncomputable def posDefToSymmetric {p : ℕ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) : SymmetricMatrix p :=
  ⟨S, Matrix.isHermitian_iff_isSelfAdjoint.1 hS.1⟩

example {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} :
    Integrable id (nonsingularWishartMeasure n S) := by
  solve_by_elim [TauCeti.Probability.integrable_id_nonsingularWishartMeasure]

example {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    ∫ A, A ∂nonsingularWishartMeasure n S = n • posDefToSymmetric hS := by
  solve_by_elim [TauCeti.Probability.integral_id_nonsingularWishartMeasure]

example {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) (i j : Fin p) :
    ∫ A, (A : Matrix (Fin p) (Fin p) ℝ) i j ∂nonsingularWishartMeasure n S =
      n * S i j := by
  solve_by_elim [TauCeti.Probability.integral_coe_apply_nonsingularWishartMeasure]

example {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) (i j k l : Fin p) :
    cov[fun A : SymmetricMatrix p => (A : Matrix (Fin p) (Fin p) ℝ) i j,
        fun A => (A : Matrix (Fin p) (Fin p) ℝ) k l; nonsingularWishartMeasure n S] =
      n * (S i k * S j l + S i l * S j k) := by
  solve_by_elim [TauCeti.Probability.covariance_coe_apply_nonsingularWishartMeasure]

example {p : ℕ} {n t : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (Θ : SymmetricMatrix p)
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    t ∈ integrableExpSet
        (fun A : SymmetricMatrix p =>
          Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)))
        (nonsingularWishartMeasure n S) ↔
      (1 - (2 * t) •
        (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef := by
  solve_by_elim [TauCeti.Probability.mem_integrableExpSet_trace_mul_nonsingularWishartMeasure_iff]

example {p : ℕ} {n t : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (Θ : SymmetricMatrix p)
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n)
    (ht : (1 - (2 * t) •
      (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef) :
    mgf (fun A : SymmetricMatrix p =>
        Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)))
        (nonsingularWishartMeasure n S) t =
      Real.rpow
        (Matrix.det (1 - (2 * t) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S))) (-n / 2) := by
  solve_by_elim [TauCeti.Probability.mgf_trace_mul_nonsingularWishartMeasure]

example {p : ℕ} {n t : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (Θ : SymmetricMatrix p)
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n)
    (ht : (1 - (2 * t) •
      (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef) :
    cgf (fun A : SymmetricMatrix p =>
        Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)))
        (nonsingularWishartMeasure n S) t =
      -n / 2 * Real.log
        (Matrix.det (1 - (2 * t) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S))) := by
  solve_by_elim [TauCeti.Probability.cgf_trace_mul_nonsingularWishartMeasure]

-- The analytic-continuation step shared by both Wishart families, in scalar form: a real statistic
-- whose mgf is a product of `(1 - 2 t λ)` powers on its natural domain has the eigenvalue-wise
-- principal-logarithm characteristic function.  `complexMGF X μ I` is the characteristic function
-- of the law of `X` at `1`; for a Wishart law and the trace statistic it is `charFun μ Θ`.
example {Ω ι : Type*} [MeasurableSpace Ω] [Fintype ι]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {X : Ω → ℝ} (lam a : ι → ℝ)
    (h : ∀ t : ℝ, (∀ j, 0 < 1 - 2 * t * lam j) →
      mgf X μ t = ∏ j, Real.rpow (1 - 2 * t * lam j) (-a j)) :
    complexMGF X μ Complex.I =
      Complex.exp (-∑ j, (a j : ℂ) * Complex.log (1 - 2 * Complex.I * (lam j : ℂ))) :=
  TauCeti.complexMGF_I_eq_exp_of_mgf_eq_prod_rpow lam a h

-- The exponential of a sum of principal logarithms makes the complex branch choice explicit.
example {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (Θ : SymmetricMatrix p)
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    charFun (nonsingularWishartMeasure n S) Θ =
      Complex.exp (-(n : ℂ) / 2 *
        ∑ j : Fin p, Complex.log
          (1 - 2 * Complex.I *
            ((Matrix.isHermitian_sqrt_mul_mul_sqrt S
              (selfAdjoint.isHermitian_coe Θ)).eigenvalues j : ℂ))) := by
  solve_by_elim [TauCeti.Probability.charFun_nonsingularWishartMeasure]

/-! ### Gaussian-Gram Wishart distributions -/

abbrev sumVecMulVec {p ν : ℕ} (X : Fin ν → EuclideanSpace ℝ (Fin p)) :
    SymmetricMatrix p := TauCeti.Probability.wishartGram X

abbrev wishartGramMeasure {p : ℕ} (ν : ℕ) (S : Matrix (Fin p) (Fin p) ℝ) :
    Measure (SymmetricMatrix p) := TauCeti.Probability.wishartGramMeasure ν S

example {p ν : ℕ} (S : Matrix (Fin p) (Fin p) ℝ) :
    IsProbabilityMeasure (wishartGramMeasure ν S) := by infer_instance

example {p ν : ℕ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : ¬ S.PosSemidef) : wishartGramMeasure ν S = Measure.dirac 0 := by
  solve_by_elim [TauCeti.Probability.wishartGramMeasure_of_not_posSemidef]

example {p : ℕ} (S : Matrix (Fin p) (Fin p) ℝ) :
    wishartGramMeasure 0 S = Measure.dirac 0 := by
  solve_by_elim [TauCeti.Probability.wishartGramMeasure_zero]

example {Ω : Type*} [MeasurableSpace Ω] {p ν : ℕ}
    {P : Measure Ω} [IsProbabilityMeasure P] (X : Fin ν → Ω → EuclideanSpace ℝ (Fin p))
    (S : Matrix (Fin p) (Fin p) ℝ)
    (hX : ∀ r, HasLaw (X r) (multivariateGaussian 0 S) P) (hIndep : iIndepFun X P) :
    HasLaw (fun ω => sumVecMulVec (fun r => X r ω)) (wishartGramMeasure ν S) P := by
  solve_by_elim [TauCeti.Probability.hasLaw_wishartGram_gaussian]

noncomputable def posSemidefToSymmetric {p : ℕ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosSemidef) : SymmetricMatrix p :=
  ⟨S, Matrix.isHermitian_iff_isSelfAdjoint.1 hS.1⟩

example {p ν : ℕ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosSemidef) :
    ∫ A, A ∂wishartGramMeasure ν S = (ν : ℝ) • posSemidefToSymmetric hS := by
  solve_by_elim [TauCeti.Probability.integral_id_wishartGramMeasure]

example {p ν : ℕ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosSemidef) (i j k l : Fin p) :
    cov[fun A : SymmetricMatrix p => (A : Matrix (Fin p) (Fin p) ℝ) i j,
        fun A => (A : Matrix (Fin p) (Fin p) ℝ) k l; wishartGramMeasure ν S] =
      (ν : ℝ) * (S i k * S j l + S i l * S j k) := by
  solve_by_elim [TauCeti.Probability.covariance_coe_apply_wishartGramMeasure]

example {p : ℕ} (ν : ℕ) (S : Matrix (Fin p) (Fin p) ℝ) :
    ∀ᵐ (A : SymmetricMatrix p) ∂wishartGramMeasure ν S,
      (A : Matrix (Fin p) (Fin p) ℝ).PosSemidef :=
  TauCeti.Probability.ae_posSemidef_wishartGramMeasure ν S

theorem ae_rank_wishartGramMeasure {p ν : ℕ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosSemidef) :
    ∀ᵐ (A : SymmetricMatrix p) ∂wishartGramMeasure ν S,
      Matrix.rank (A : Matrix (Fin p) (Fin p) ℝ) = min ν S.rank := by sorry

example {p ν : ℕ}
    {S : Matrix (Fin p) (Fin p) ℝ} :
    ∀ᵐ (A : SymmetricMatrix p) ∂wishartGramMeasure ν S,
      Matrix.rank (A : Matrix (Fin p) (Fin p) ℝ) ≤ min ν S.rank := by
  solve_by_elim [TauCeti.Probability.ae_rank_le_wishartGramMeasure]

abbrev rectangularSymmetricCongruence {p q : ℕ}
    (M : Matrix (Fin q) (Fin p) ℝ) : SymmetricMatrix p → SymmetricMatrix q :=
  Matrix.symmetricCongruenceLinearMap M

-- Positive semidefiniteness is needed here: a projection can carry a scale that is not positive
-- semidefinite to one that is.
example {p q ν : ℕ}
    (M : Matrix (Fin q) (Fin p) ℝ) {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosSemidef) :
    (wishartGramMeasure ν S).map (rectangularSymmetricCongruence M) =
      wishartGramMeasure ν (M * S * Mᵀ) :=
  TauCeti.Probability.map_symmetricCongruenceLinearMap_wishartGramMeasure ν M hS

example {p : ℕ} (ν₁ ν₂ : ℕ)
    (S : Matrix (Fin p) (Fin p) ℝ) :
    wishartGramMeasure ν₁ S ∗ wishartGramMeasure ν₂ S =
      wishartGramMeasure (ν₁ + ν₂) S := by
  solve_by_elim [TauCeti.Probability.wishartGramMeasure_conv_wishartGramMeasure]

example {p ν : ℕ} {t : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (Θ : SymmetricMatrix p)
    (hν : 0 < ν) :
    t ∈ integrableExpSet
        (fun A : SymmetricMatrix p =>
          Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)))
        (wishartGramMeasure ν S) ↔
      (1 - (2 * t) •
        (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef := by
  solve_by_elim [TauCeti.Probability.mem_integrableExpSet_trace_mul_wishartGramMeasure_iff]

-- At `ν = 0` the law is Dirac, so the domain is everything.
example {p : ℕ}
    (S : Matrix (Fin p) (Fin p) ℝ) (Θ : SymmetricMatrix p) :
    integrableExpSet
        (fun A : SymmetricMatrix p =>
          Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)))
        (wishartGramMeasure 0 S) = Set.univ := by
  solve_by_elim [TauCeti.Probability.integrableExpSet_trace_mul_wishartGramMeasure_zero]

example {p : ℕ}
    (S : Matrix (Fin p) (Fin p) ℝ) (Θ : SymmetricMatrix p) (t : ℝ) :
    mgf (fun A : SymmetricMatrix p =>
        Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)))
        (wishartGramMeasure 0 S) t = 1 := by
  solve_by_elim [TauCeti.Probability.mgf_trace_mul_wishartGramMeasure_zero]

example {p : ℕ}
    (S : Matrix (Fin p) (Fin p) ℝ) (Θ : SymmetricMatrix p) (t : ℝ) :
    cgf (fun A : SymmetricMatrix p =>
        Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)))
        (wishartGramMeasure 0 S) t = 0 := by
  solve_by_elim [TauCeti.Probability.cgf_trace_mul_wishartGramMeasure_zero]

example {p ν : ℕ} {t : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (Θ : SymmetricMatrix p) (hS : S.PosSemidef)
    (ht : (1 - (2 * t) •
      (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef) :
    mgf (fun A : SymmetricMatrix p =>
        Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)))
        (wishartGramMeasure ν S) t =
      Real.rpow
        (Matrix.det (1 - (2 * t) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S)))
        (-(ν : ℝ) / 2) := by
  solve_by_elim [TauCeti.Probability.mgf_trace_mul_wishartGramMeasure]

example {p ν : ℕ} {t : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (Θ : SymmetricMatrix p) (hS : S.PosSemidef)
    (ht : (1 - (2 * t) •
      (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S)).PosDef) :
    cgf (fun A : SymmetricMatrix p =>
        Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)))
        (wishartGramMeasure ν S) t =
      -(ν : ℝ) / 2 * Real.log
        (Matrix.det (1 - (2 * t) • ((Θ : Matrix (Fin p) (Fin p) ℝ) * S))) := by
  solve_by_elim [TauCeti.Probability.cgf_trace_mul_wishartGramMeasure]

example {p ν : ℕ} {S : Matrix (Fin p) (Fin p) ℝ}
    (Θ : SymmetricMatrix p) :
    charFun (wishartGramMeasure ν S) Θ =
      Complex.exp (-(ν : ℂ) / 2 *
        ∑ j : Fin p, Complex.log
          (1 - 2 * Complex.I *
            ((Matrix.isHermitian_sqrt_mul_mul_sqrt S
              (selfAdjoint.isHermitian_coe Θ)).eigenvalues j : ℂ))) := by
  solve_by_elim [TauCeti.Probability.charFun_wishartGramMeasure]

-- Both characteristic functions are the same formula, so `Measure.ext_of_charFun` closes this.
example {p ν : ℕ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef) (hpν : p ≤ ν) :
    wishartGramMeasure ν S = nonsingularWishartMeasure (ν : ℝ) S := by
  solve_by_elim [TauCeti.Probability.wishartGramMeasure_eq_nonsingularWishartMeasure]

example {Ω : Type*} [MeasurableSpace Ω]
    {p ν : ℕ} {P : Measure Ω} [IsProbabilityMeasure P]
    (X : Fin ν → Ω → EuclideanSpace ℝ (Fin p))
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef) (hpν : p ≤ ν)
    (hX : ∀ r, HasLaw (X r) (multivariateGaussian 0 S) P) (hIndep : iIndepFun X P) :
    HasLaw (fun ω => sumVecMulVec (fun r => X r ω))
      (nonsingularWishartMeasure (ν : ℝ) S) P := by
  solve_by_elim [TauCeti.Probability.hasLaw_wishartGram_gaussian_nonsingularWishartMeasure]

example {p ν : ℕ}
    {S : Matrix (Fin p) (Fin p) ℝ} (h : min ν S.rank < p) :
    wishartGramMeasure ν S ⟂ₘ symmetricLebesgue p := by
  solve_by_elim [TauCeti.Probability.mutuallySingular_wishartGramMeasure_symmetricLebesgue]

/-! ### Bartlett decomposition -/

example {p : ℕ} {n : ℝ} {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    (hn : (p : ℝ) - 1 < n) {A : Ω → PosDefMatrix p}
    (hA : HasLaw A ((nonsingularWishartMeasure n (1 : Matrix (Fin p) (Fin p) ℝ)).comap
      Subtype.val) P) :
    iIndepFun (fun (ij : lowerTriangle p) (ω : Ω) => (cholesky (A ω)).1 ij.1.1 ij.1.2) P ∧
      (∀ i : Fin p, HasLaw (fun ω => (cholesky (A ω)).1 i i ^ 2)
        (chiSquaredMeasure (n - i.1)) P) ∧
      (∀ i j : Fin p, j < i →
        HasLaw (fun ω => (cholesky (A ω)).1 i j) (gaussianReal 0 1) P) :=
  TauCeti.Probability.bartlett_nonsingularWishartMeasure hn hA

/-! ### Determinant moments -/

theorem integrable_rpow_det_nonsingularWishartMeasure_iff {p : ℕ} (hp : 0 < p)
    {n : ℝ} {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef)
    (hn : (p : ℝ) - 1 < n) (q : ℝ) :
    Integrable (fun A : SymmetricMatrix p => Real.rpow A.val.det q)
      (nonsingularWishartMeasure n S) ↔ -(n - (p : ℝ) + 1) / 2 < q := by sorry

theorem integral_rpow_det_nonsingularWishartMeasure {p : ℕ}
    {n q : ℝ} {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef)
    (hn : (p : ℝ) - 1 < n) (hq : -(n - (p : ℝ) + 1) / 2 < q) :
    ∫ A : SymmetricMatrix p, Real.rpow A.val.det q ∂nonsingularWishartMeasure n S =
      Real.rpow 2 ((p : ℝ) * q) * Real.rpow S.det q *
        multivariateGamma p (n / 2 + q) / multivariateGamma p (n / 2) := by sorry

/-! ### Inverse-Wishart distributions -/

abbrev symmetricInv {p : ℕ} (A : SymmetricMatrix p) : SymmetricMatrix p :=
  TauCeti.symmetricInv A

example {p : ℕ} :
    ((symmetricLebesgue p).restrict
        {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef}).map symmetricInv =
      ((symmetricLebesgue p).restrict
          {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef}).withDensity
        fun B => ENNReal.ofReal
          (Real.rpow (B : Matrix (Fin p) (Fin p) ℝ).det (-((p : ℝ) + 1))) := by
  solve_by_elim [TauCeti.map_symmetricInv_symmetricLebesgue]

abbrev inverseWishartMeasure {p : ℕ} (n : ℝ) (S : Matrix (Fin p) (Fin p) ℝ) :
    Measure (SymmetricMatrix p) :=
  TauCeti.Probability.inverseWishartMeasure n S

example {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef)
    (hn : (p : ℝ) + 1 < n) :
    Integrable id (inverseWishartMeasure n S) := by
  solve_by_elim [TauCeti.Probability.integrable_id_inverseWishartMeasure]

example {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef)
    (hn : (p : ℝ) + 1 < n) :
    ∫ A, A ∂inverseWishartMeasure n S =
      (n - (p : ℝ) - 1)⁻¹ • posDefToSymmetric hS := by
  solve_by_elim [TauCeti.Probability.integral_id_inverseWishartMeasure]

example {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hp : 0 < p) (hS : S.PosDef)
    (hnValid : (p : ℝ) - 1 < n) (hn : n ≤ (p : ℝ) + 1) :
    ¬Integrable id (inverseWishartMeasure n S) := by
  solve_by_elim [TauCeti.Probability.not_integrable_id_inverseWishartMeasure]

example {n : ℝ} {S : Matrix (Fin 0) (Fin 0) ℝ}
    (hn : -(1 : ℝ) < n) :
    inverseWishartMeasure n S = Measure.dirac 0 := by
  solve_by_elim [TauCeti.Probability.inverseWishartMeasure_zero]

example {n : ℝ} {S : Matrix (Fin 0) (Fin 0) ℝ}
    (hn : -(1 : ℝ) < n) :
    Integrable id (inverseWishartMeasure n S) := by
  solve_by_elim [TauCeti.Probability.integrable_id_inverseWishartMeasure_zero]

example {n : ℝ} {S : Matrix (Fin 0) (Fin 0) ℝ}
    (hn : -(1 : ℝ) < n) :
    ∫ A, A ∂inverseWishartMeasure n S = 0 := by
  solve_by_elim [TauCeti.Probability.integral_id_inverseWishartMeasure_zero]

/-! ### Parameter measurability -/

-- State matrix-parameter measurability through the coordinate carrier and `Matrix.of`.
example (p : ℕ) :
    Measurable fun q : ℝ × (Fin p → Fin p → ℝ) =>
      nonsingularWishartMeasure q.1 (Matrix.of q.2) := by
  solve_by_elim [TauCeti.Probability.measurable_nonsingularWishartMeasure]

example (p : ℕ) :
    Measurable fun q : ℕ × (Fin p → Fin p → ℝ) =>
      wishartGramMeasure q.1 (Matrix.of q.2) := by
  solve_by_elim [TauCeti.Probability.measurable_wishartGramMeasure]

example (p : ℕ) :
    Measurable fun q : ℝ × (Fin p → Fin p → ℝ) =>
      inverseWishartMeasure q.1 (Matrix.of q.2) := by
  solve_by_elim [TauCeti.Probability.measurable_inverseWishartMeasure]

-- The form a Wishart kernel with a random symmetric scale needs.
example (p : ℕ) :
    Measurable fun q : ℝ × SymmetricMatrix p =>
      nonsingularWishartMeasure q.1 (q.2 : Matrix (Fin p) (Fin p) ℝ) := by
  fun_prop

/-! ## Layers 7–15: constructions, extended families, and quantiles

These prototypes use the public Tau Ceti distributions already available at the pin.
The README supplies the complete family list and formula requirements.
-/

namespace Expansion

open scoped ComplexOrder

def upperQuantile (μ : Measure ℝ) (u : ℝ) : ℝ := sInf {x | u < cdf μ x}

theorem cdf_quantile_eq (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hF : Continuous (cdf μ : ℝ → ℝ)) {u : ℝ} (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    cdf μ (μ.quantile u) = u := by sorry

theorem measurable_quantile_cdf_family {α : Type*} [MeasurableSpace α]
    (μ : α → Measure ℝ) (hμ : Measurable μ) (hprob : ∀ a, IsProbabilityMeasure (μ a)) :
    Measurable fun q : α × Set.Ioo (0 : ℝ) 1 => (μ q.1).quantile q.2 := by sorry

theorem map_uniform_quantile (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    (TauCeti.Probability.uniformMeasure 0 1).map (μ.quantile) = μ := by sorry

theorem quantile_map_affine_pos (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (a : ℝ) {b u : ℝ} (hb : 0 < b) (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (μ.map (fun x => a + b * x)).quantile u =
      a + b * μ.quantile u := by sorry

theorem quantile_map_affine_neg (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (a : ℝ) {b u : ℝ} (hb : b < 0) (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (μ.map (fun x => a + b * x)).quantile u =
      a + b * upperQuantile μ (1 - u) := by sorry

theorem cdf_map_affine_neg (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (a : ℝ) {b : ℝ} (hb : b < 0) (x : ℝ) :
    cdf (μ.map (fun y => a + b * y)) x = 1 - μ.real (Set.Iio ((x - a) / b)) := by sorry

theorem integrableExpSet_map_affine (μ : Measure ℝ) [IsProbabilityMeasure μ] (a b : ℝ) :
    integrableExpSet id (μ.map (fun x => a + b * x)) =
      {t | b * t ∈ integrableExpSet id μ} := by sorry

theorem quantile_cond_Ioc (μ : Measure ℝ) [IsProbabilityMeasure μ]
    {l r u : ℝ} (hmass : 0 < μ (Set.Ioc l r)) (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (ProbabilityTheory.cond μ (Set.Ioc l r)).quantile u =
      μ.quantile (cdf μ l + u * (cdf μ r - cdf μ l)) := by sorry

def atomMixture (μ : Measure ℝ) (c : ℝ) (w : I) : Measure ℝ :=
  ENNReal.ofReal (w : ℝ) • Measure.dirac c + ENNReal.ofReal (1 - (w : ℝ)) • μ

theorem atomMixture_withDensity (f : ℝ → ℝ≥0∞) (c : ℝ) (w : I) :
    atomMixture (volume.withDensity f) c w =
      ENNReal.ofReal (w : ℝ) • Measure.dirac c +
        volume.withDensity (fun x => ENNReal.ofReal (1 - (w : ℝ)) * f x) := by sorry

def convolutionPower {E : Type*} [AddMonoid E] [MeasurableSpace E]
    (μ : Measure E) : ℕ → Measure E
  | 0 => Measure.dirac 0
  | n + 1 => convolutionPower μ n ∗ μ

def compoundPoissonMeasure {E : Type*} [AddMonoid E] [MeasurableSpace E]
    (lam : ℝ≥0) (μ : Measure E) : Measure E :=
  (poissonMeasure lam).bind (convolutionPower μ)

theorem charFun_compoundPoissonMeasure {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (lam : ℝ≥0) (μ : Measure E) [IsProbabilityMeasure μ] (t : E) :
    charFun (compoundPoissonMeasure lam μ) t =
      Complex.exp ((lam : ℝ) * (charFun μ t - 1)) := by sorry

/-! ### Hazard reconstruction for absolutely continuous survival functions -/

theorem survival_eq_exp_integral_hazard {S f : ℝ → ℝ} {a x : ℝ} (hax : a ≤ x)
    (hS : AbsolutelyContinuousOnInterval S a x)
    (hpos : ∀ t ∈ Set.Icc a x, 0 < S t)
    (hderiv : ∀ᵐ t ∂volume.restrict (Set.Icc a x), HasDerivAt S (-f t) t) :
    IntervalIntegrable (fun t => f t / S t) volume a x ∧
      S x = S a * Real.exp (-(∫ t in a..x, f t / S t)) := by sorry

/-! ### Weighted laws and parameter comparisons -/

def powerBias (μ : Measure ℝ) (q : ℝ) : Measure ℝ :=
  (∫⁻ x, ENNReal.ofReal (Real.rpow x q) ∂μ)⁻¹ •
    μ.withDensity (fun x => ENNReal.ofReal (Real.rpow x q))

theorem isProbabilityMeasure_powerBias (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (q : ℝ) (hpos : ∀ᵐ x ∂μ, 0 < x) (hq : Integrable (fun x => Real.rpow x q) μ) :
    IsProbabilityMeasure (powerBias μ q) := by sorry

theorem powerBias_eq_tilted (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (q : ℝ) (hpos : ∀ᵐ x ∂μ, 0 < x) (hq : Integrable (fun x => Real.rpow x q) μ) :
    powerBias μ q = μ.tilted (fun x => q * Real.log x) := by sorry

theorem powerBias_powerBias (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (q r : ℝ) (hpos : ∀ᵐ x ∂μ, 0 < x)
    (hq : Integrable (fun x => Real.rpow x q) μ)
    (hqr : Integrable (fun x => Real.rpow x (q + r)) μ) :
    powerBias (powerBias μ q) r = powerBias μ (q + r) := by sorry

theorem integrable_rpow_powerBias_iff (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (q r : ℝ) (hpos : ∀ᵐ x ∂μ, 0 < x) (hq : Integrable (fun x => Real.rpow x q) μ) :
    Integrable (fun x => Real.rpow x r) (powerBias μ q) ↔
      Integrable (fun x => Real.rpow x (q + r)) μ := by sorry

theorem integral_rpow_powerBias (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (q r : ℝ) (hpos : ∀ᵐ x ∂μ, 0 < x)
    (hq : Integrable (fun x => Real.rpow x q) μ)
    (hqr : Integrable (fun x => Real.rpow x (q + r)) μ) :
    ∫ x, Real.rpow x r ∂powerBias μ q =
      (∫ x, Real.rpow x (q + r) ∂μ) / ∫ x, Real.rpow x q ∂μ := by sorry

theorem powerBias_gammaMeasure {a r q : ℝ} (ha : 0 < a) (hr : 0 < r) (hq : -a < q) :
    powerBias (gammaMeasure a r) q = gammaMeasure (a + q) r := by sorry

theorem sizeBias_poissonMeasure {r : ℝ≥0} (hr : 0 < r) :
    (∫⁻ k : ℕ, (k : ℝ≥0∞) ∂poissonMeasure r)⁻¹ •
        (poissonMeasure r).withDensity (fun k => (k : ℝ≥0∞)) =
      (poissonMeasure r).map Nat.succ := by sorry

theorem cdf_le_iff_quantile_le (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    (∀ x, cdf ν x ≤ cdf μ x) ↔
      ∀ u ∈ Set.Ioo (0 : ℝ) 1, μ.quantile u ≤ ν.quantile u := by sorry

theorem quantile_ordered_coupling (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] (h : ∀ x, cdf ν x ≤ cdf μ x) :
    let coupling := (uniformMeasure 0 1).map (fun u => (μ.quantile u, ν.quantile u))
    coupling.map Prod.fst = μ ∧ coupling.map Prod.snd = ν ∧
      ∀ᵐ xy ∂coupling, xy.1 ≤ xy.2 := by sorry

/-! ### Special-function and elementary quantiles -/

def inverseRegularizedGamma (a u : ℝ) : ℝ :=
  if 0 < a ∧ u ∈ Set.Ioo (0 : ℝ) 1 then
    sInf {x : ℝ | 0 ≤ x ∧ u ≤ TauCeti.regularizedGamma a x}
  else 0

theorem regularizedGamma_inverse {a u : ℝ} (ha : 0 < a)
    (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    TauCeti.regularizedGamma a (inverseRegularizedGamma a u) = u := by sorry

theorem quantile_gammaMeasure {a r u : ℝ} (ha : 0 < a) (hr : 0 < r)
    (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (gammaMeasure a r).quantile u = inverseRegularizedGamma a u / r := by sorry

theorem quantile_inverseGammaMeasure {a r u : ℝ} (ha : 0 < a) (hr : 0 < r)
    (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (TauCeti.Probability.inverseGammaMeasure a r).quantile u =
      r / inverseRegularizedGamma a (1 - u) := by sorry

def logisticMeasure (m s : ℝ) : Measure ℝ :=
  if 0 < s then
    (TauCeti.Probability.uniformMeasure 0 1).map (fun u => m + s * Real.log (u / (1 - u)))
  else 0

theorem quantile_logisticMeasure (m : ℝ) {s u : ℝ} (hs : 0 < s)
    (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (logisticMeasure m s).quantile u = m + s * Real.log (u / (1 - u)) := by sorry

def generalizedExtremeValueMeasure (m s ξ : ℝ) : Measure ℝ :=
  if 0 < s then
    (expMeasure 1).map (fun y =>
      if ξ = 0 then m - s * Real.log y else m + s * (Real.rpow y (-ξ) - 1) / ξ)
  else 0

theorem quantile_generalizedExtremeValueMeasure (m ξ : ℝ) {s u : ℝ}
    (hs : 0 < s) (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (generalizedExtremeValueMeasure m s ξ).quantile u =
      if ξ = 0 then m - s * Real.log (-Real.log u)
      else m + s * (Real.rpow (-Real.log u) (-ξ) - 1) / ξ := by sorry

def generalizedParetoMeasure (s ξ : ℝ) : Measure ℝ :=
  if 0 < s then
    (expMeasure 1).map (fun y => if ξ = 0 then s * y else s * (Real.exp (ξ * y) - 1) / ξ)
  else 0

theorem quantile_generalizedParetoMeasure (ξ : ℝ) {s u : ℝ}
    (hs : 0 < s) (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (generalizedParetoMeasure s ξ).quantile u =
      if ξ = 0 then -s * Real.log (1 - u)
      else s * (Real.rpow (1 - u) (-ξ) - 1) / ξ := by sorry

/-! ### Mixtures and noncentral boundaries -/

def noncentralChiSquaredMeasure (k : ℝ) (lam : ℝ≥0) : Measure ℝ :=
  if 0 ≤ k then
    (poissonMeasure (lam / 2)).bind (fun j => TauCeti.Probability.chiSquaredMeasure (k + 2 * j))
  else 0

theorem isProbabilityMeasure_noncentralChiSquaredMeasure {k : ℝ} (hk : 0 ≤ k) (lam : ℝ≥0) :
    IsProbabilityMeasure (noncentralChiSquaredMeasure k lam) := by sorry

theorem noncentralChiSquaredMeasure_zero_degree_mass (lam : ℝ≥0) :
    (noncentralChiSquaredMeasure 0 lam).real {0} = Real.exp (-(lam : ℝ) / 2) := by sorry

theorem noncentralChiSquaredMeasure_zero_noncentrality {k : ℝ} (hk : 0 ≤ k) :
    noncentralChiSquaredMeasure k 0 = TauCeti.Probability.chiSquaredMeasure k := by sorry

theorem quantile_noncentralChiSquaredMeasure_zero_degree (lam : ℝ≥0)
    {u : ℝ} (hu : u ∈ Set.Ioo (0 : ℝ) 1) (h : u ≤ Real.exp (-(lam : ℝ) / 2)) :
    (noncentralChiSquaredMeasure 0 lam).quantile u = 0 := by sorry

theorem measurable_noncentralChiSquaredMeasure :
    Measurable fun p : ℝ × ℝ≥0 => noncentralChiSquaredMeasure p.1 p.2 := by sorry

theorem quantile_noncentralChiSquaredMeasure_mono {k₁ k₂ : ℝ} {lam₁ lam₂ : ℝ≥0}
    (hk₁ : 0 ≤ k₁) (hk : k₁ ≤ k₂) (hlam : lam₁ ≤ lam₂)
    {u : ℝ} (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (noncentralChiSquaredMeasure k₁ lam₁).quantile u ≤
      (noncentralChiSquaredMeasure k₂ lam₂).quantile u := by sorry

def noncentralTMeasure (ν δ : ℝ) : Measure ℝ :=
  if 0 < ν then
    ((gaussianReal 0 1).prod (TauCeti.Probability.chiSquaredMeasure ν)).map
      (fun z => (z.1 + δ) / Real.sqrt (z.2 / ν))
  else 0

theorem noncentralTMeasure_zero {ν : ℝ} (hν : 0 < ν) :
    noncentralTMeasure ν 0 = TauCeti.Probability.studentTMeasure ν := by sorry

def categoricalMeasure {ι : Type*} [Fintype ι] [MeasurableSpace ι]
    (p : Convexity.StdSimplex ℝ≥0 ι) : Measure ι :=
  ∑ i, (p.weights i : ℝ≥0∞) • Measure.dirac i

theorem categoricalMeasure_singleton {ι : Type*} [Fintype ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] (p : Convexity.StdSimplex ℝ≥0 ι) (i : ι) :
    categoricalMeasure p {i} = (p.weights i : ℝ≥0∞) := by sorry

def gaussianLatticeSum (c s : ℝ) : ℝ :=
  ∑' k : ℤ, Real.exp (-((k : ℝ) - c) ^ 2 / (2 * s ^ 2))

def discreteGaussianMeasure (c s : ℝ) : Measure ℤ :=
  if 0 < s then
    Measure.sum (fun k : ℤ =>
      ENNReal.ofReal (Real.exp (-((k : ℝ) - c) ^ 2 / (2 * s ^ 2)) / gaussianLatticeSum c s) •
        Measure.dirac k)
  else 0

theorem mgf_discreteGaussianMeasure (c t : ℝ) {s : ℝ} (hs : 0 < s) :
    mgf (fun k : ℤ => (k : ℝ)) (discreteGaussianMeasure c s) t =
      Real.exp (c * t + s ^ 2 * t ^ 2 / 2) *
        gaussianLatticeSum (c + s ^ 2 * t) s / gaussianLatticeSum c s := by sorry

/-! ### Vector, complex, and circular carriers -/

def multivariateTMeasure {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) (ν : ℝ) : Measure (EuclideanSpace ℝ ι) := by
  classical
  exact if 0 < ν ∧ S.PosSemidef then
    ((multivariateGaussian 0 S).prod (TauCeti.Probability.chiSquaredMeasure ν)).map
      (fun z => m + Real.sqrt (ν / z.2) • z.1)
    else 0

theorem multivariateTMeasure_zero_scale {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) {ν : ℝ} (hν : 0 < ν) :
    multivariateTMeasure m 0 ν = Measure.dirac m := by sorry

theorem quantile_multivariateTMeasure_projection {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m θ : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : S.PosSemidef)
    {ν u : ℝ} (hν : 0 < ν) (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    ((multivariateTMeasure m S ν).map (fun x => ⟪θ, x⟫_ℝ)).quantile u =
      ⟪θ, m⟫_ℝ + Real.sqrt (⟪θ, S.toEuclideanLin θ⟫_ℝ) *
        (TauCeti.Probability.studentTMeasure ν).quantile u := by sorry

def matrixCoordinateEquiv {ι κ : Type*} [Fintype ι] [Fintype κ] :
    EuclideanSpace ℝ (ι × κ) ≃ᵐ Matrix ι κ ℝ where
  toFun x := Matrix.of (fun i j => x (i, j))
  invFun A := WithLp.toLp 2 (fun ij => A ij.1 ij.2)
  left_inv := by intro x; ext ij; rfl
  right_inv := by intro A; rfl
  measurable_toFun := by
    change Measurable (fun x : EuclideanSpace ℝ (ι × κ) => Matrix.of (fun i j => x (i, j)))
    fun_prop
  measurable_invFun := by
    change Measurable (fun A : Matrix ι κ ℝ => WithLp.toLp 2 (fun ij : ι × κ => A ij.1 ij.2))
    fun_prop

def matrixNormalMeasure {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ]
    (M : Matrix ι κ ℝ) (U : Matrix ι ι ℝ) (V : Matrix κ κ ℝ) : Measure (Matrix ι κ ℝ) := by
  classical
  exact if U.PosSemidef ∧ V.PosSemidef then
    (multivariateGaussian (matrixCoordinateEquiv.symm M)
      (fun ij kl => U ij.1 kl.1 * V ij.2 kl.2)).map matrixCoordinateEquiv
  else Measure.dirac M

theorem covariance_matrixNormalMeasure {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ]
    (M : Matrix ι κ ℝ) {U : Matrix ι ι ℝ} {V : Matrix κ κ ℝ}
    (hU : U.PosSemidef) (hV : V.PosSemidef) (i k : ι) (j l : κ) :
    covariance (fun A => A i j) (fun A => A k l) (matrixNormalMeasure M U V) =
      U i k * V j l := by sorry

def complexGaussianRealCovariance {ι : Type*} (C : Matrix ι ι ℂ) :
    Matrix (ι ⊕ ι) (ι ⊕ ι) ℝ :=
  Matrix.fromBlocks (fun i j => (C i j).re / 2) (fun i j => -(C i j).im / 2)
    (fun i j => (C i j).im / 2) (fun i j => (C i j).re / 2)

def properComplexGaussianMeasure {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : ι → ℂ) (C : Matrix ι ι ℂ) : Measure (ι → ℂ) := by
  classical
  exact if C.PosSemidef then
    (multivariateGaussian
      (WithLp.toLp 2 (Sum.elim (fun i => (m i).re) (fun i => (m i).im)))
      (complexGaussianRealCovariance C)).map
        (fun (x : EuclideanSpace ℝ (ι ⊕ ι)) i =>
          (x (Sum.inl i) : ℂ) + Complex.I * (x (Sum.inr i) : ℂ))
  else Measure.dirac m

theorem properComplexGaussianMeasure_centered_rotation {ι : Type*} [Fintype ι] [DecidableEq ι]
    {C : Matrix ι ι ℂ} (hC : C.PosSemidef) (θ : ℝ) :
    (properComplexGaussianMeasure (0 : ι → ℂ) C).map
      (fun z i => Complex.exp (Complex.I * θ) * z i) =
        properComplexGaussianMeasure 0 C := by sorry

def wrappedNormalMeasure (m : AddCircle (2 * Real.pi)) (v : ℝ≥0) :
    Measure (AddCircle (2 * Real.pi)) :=
  (gaussianReal 0 v).map (fun x : ℝ => m + (x : AddCircle (2 * Real.pi)))

theorem wrappedNormalMeasure_zero (m : AddCircle (2 * Real.pi)) :
    wrappedNormalMeasure m 0 = Measure.dirac m := by sorry

theorem wrappedNormalMeasure_conv (m₁ m₂ : AddCircle (2 * Real.pi)) (v₁ v₂ : ℝ≥0) :
    wrappedNormalMeasure m₁ v₁ ∗ wrappedNormalMeasure m₂ v₂ =
      wrappedNormalMeasure (m₁ + m₂) (v₁ + v₂) := by sorry

theorem measurable_wrappedNormalMeasure :
    Measurable fun p : AddCircle (2 * Real.pi) × ℝ≥0 => wrappedNormalMeasure p.1 p.2 := by sorry

/-! ### Spherical reference measure and special functions -/

abbrev UnitSphere (d : ℕ) := Metric.sphere (0 : EuclideanSpace ℝ (Fin d)) 1

def uniformSphereMeasure (d : ℕ) : Measure (UnitSphere d) :=
  let surfaceMeasure := (volume : Measure (EuclideanSpace ℝ (Fin d))).toSphere
  (surfaceMeasure Set.univ)⁻¹ • surfaceMeasure

theorem isProbabilityMeasure_uniformSphereMeasure {d : ℕ} (hd : 0 < d) :
    IsProbabilityMeasure (uniformSphereMeasure d) := by sorry

def vonMisesFisherNaturalMeasure (d : ℕ) (η : EuclideanSpace ℝ (Fin d)) :
    Measure (UnitSphere d) :=
  (uniformSphereMeasure d).tilted (fun x => ⟪η, x.val⟫_ℝ)

def vonMisesFisherMeasure (d : ℕ) (m : UnitSphere d) (κ : ℝ) : Measure (UnitSphere d) :=
  if 0 ≤ κ then vonMisesFisherNaturalMeasure d (κ • m.val) else 0

theorem vonMisesFisherMeasure_zero {d : ℕ} (hd : 0 < d) (m : UnitSphere d) :
    vonMisesFisherMeasure d m 0 = uniformSphereMeasure d := by sorry

theorem measurable_vonMisesFisherMeasure (d : ℕ) :
    Measurable fun p : UnitSphere d × ℝ => vonMisesFisherMeasure d p.1 p.2 := by sorry

local instance : Fact (0 < (2 * Real.pi : ℝ)) := ⟨by positivity⟩

def circleHaarProbability : Measure (AddCircle (2 * Real.pi)) :=
  ProbabilityTheory.cond (volume : Measure (AddCircle (2 * Real.pi))) Set.univ

theorem circleHaarProbability_eq_smul_volume :
    circleHaarProbability = (ENNReal.ofReal (2 * Real.pi))⁻¹ • volume := by sorry

theorem isProbabilityMeasure_circleHaarProbability :
    IsProbabilityMeasure circleHaarProbability := by sorry

def owensT (h a : ℝ) : ℝ :=
  (2 * Real.pi)⁻¹ * ∫ t in (0 : ℝ)..a, Real.exp (-h ^ 2 * (1 + t ^ 2) / 2) / (1 + t ^ 2)

theorem hasDerivAt_owensT_right (h a : ℝ) :
    HasDerivAt (owensT h) (Real.exp (-h ^ 2 * (1 + a ^ 2) / 2) /
      (2 * Real.pi * (1 + a ^ 2))) a := by sorry

/-! ### Shared moments, mixtures, and transformations -/

theorem integrable_rpow_gammaMeasure_iff {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (q : ℝ) :
    Integrable (fun x => Real.rpow x q) (gammaMeasure a r) ↔ -a < q := by sorry

theorem integral_rpow_gammaMeasure {a r q : ℝ} (ha : 0 < a) (hr : 0 < r) (hq : -a < q) :
    ∫ x, Real.rpow x q ∂gammaMeasure a r =
      Real.rpow r (-q) * Real.Gamma (a + q) / Real.Gamma a := by sorry

theorem iteratedDeriv_pgf_one (μ : Measure ℕ) [IsProbabilityMeasure μ]
    {t : ℝ} (ht : 0 < t) (hint : Integrable (fun k : ℕ => Real.exp (t * k)) μ) (n : ℕ) :
    iteratedDeriv n (pgf id μ) 1 = ∫ k, (k.descFactorial n : ℝ) ∂μ := by sorry

theorem map_normalize_sum_pi_gammaMeasure {ι : Type*} [Fintype ι] [Nonempty ι]
    {a : ι → ℝ} {r : ℝ} (ha : ∀ i, 0 < a i) (hr : 0 < r) :
    (Measure.pi (fun i => gammaMeasure (a i) r)).map
        (fun x => (TauCeti.Probability.dirichletNormalize x, ∑ i, x i)) =
      (TauCeti.Probability.dirichletMeasure a).prod (gammaMeasure (∑ i, a i) r) := by sorry

theorem quantile_map_monotone (μ : Measure ℝ) [IsProbabilityMeasure μ]
    {g : ℝ → ℝ} (hg : Monotone g) (hc : Continuous g)
    {u : ℝ} (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (μ.map g).quantile u = g (μ.quantile u) := by sorry

theorem variance_bind {α : Type*} [MeasurableSpace α]
    (ρ : Measure α) [IsProbabilityMeasure ρ] (K : α → Measure ℝ) (hK : Measurable K)
    (hprob : ∀ᵐ a ∂ρ, IsProbabilityMeasure (K a)) (hint : MemLp id 2 (ρ.bind K)) :
    variance id (ρ.bind K) = (∫ a, variance id (K a) ∂ρ) +
      variance (fun a => ∫ x, x ∂K a) ρ := by sorry

theorem variance_bind_kernel {α : Type*} [MeasurableSpace α]
    (ρ : Measure α) [IsProbabilityMeasure ρ] (K : Kernel α ℝ) [IsMarkovKernel K]
    (hint : MemLp id 2 (ρ.bind K)) :
    variance id (ρ.bind K) = (∫ a, variance id (K a) ∂ρ) +
      variance (fun a => ∫ x, x ∂K a) ρ :=
  variance_bind ρ K K.measurable (Filter.Eventually.of_forall fun _ => inferInstance) hint

def mixedPoissonMeasure (ρ : Measure ℝ≥0) : Measure ℕ := ρ.bind poissonMeasure

theorem variance_mixedPoissonMeasure (ρ : Measure ℝ≥0) [IsProbabilityMeasure ρ]
    (hint : MemLp (fun x : ℝ≥0 => (x : ℝ)) 2 ρ) :
    variance (fun k : ℕ => (k : ℝ)) (mixedPoissonMeasure ρ) =
      (∫ x, (x : ℝ) ∂ρ) + variance (fun x : ℝ≥0 => (x : ℝ)) ρ := by sorry

theorem tilted_gammaMeasure {a r t : ℝ} (ha : 0 < a) (hr : 0 < r) (ht : t < r) :
    (gammaMeasure a r).tilted (fun x => t * x) = gammaMeasure a (r - t) := by sorry

theorem isProbabilityMeasure_compoundPoissonMeasure {E : Type*}
    [AddMonoid E] [MeasurableSpace E] [MeasurableAdd₂ E]
    (lam : ℝ≥0) (μ : Measure E) [IsProbabilityMeasure μ] :
    IsProbabilityMeasure (compoundPoissonMeasure lam μ) := by sorry

/-! ### Additional scalar and count families -/

def generalizedGammaMeasure (a c s : ℝ) : Measure ℝ :=
  if 0 < a ∧ c ≠ 0 ∧ 0 < s then
    (gammaMeasure a 1).map (fun x => s * Real.rpow x c⁻¹)
  else 0

theorem integral_rpow_generalizedGammaMeasure {a c s q : ℝ}
    (ha : 0 < a) (hc : c ≠ 0) (hs : 0 < s) (hq : 0 < a + q / c) :
    ∫ x, Real.rpow x q ∂generalizedGammaMeasure a c s =
      Real.rpow s q * Real.Gamma (a + q / c) / Real.Gamma a := by sorry

theorem quantile_generalizedGammaMeasure_neg {a c s u : ℝ}
    (ha : 0 < a) (hc : c < 0) (hs : 0 < s) (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    (generalizedGammaMeasure a c s).quantile u =
      s * Real.rpow (inverseRegularizedGamma a (1 - u)) c⁻¹ := by sorry

def generalizedNormalMeasure (m s p : ℝ) : Measure ℝ :=
  if 0 < s ∧ 0 < p then
    volume.withDensity (fun x => ENNReal.ofReal
      (p / (2 * s * Real.Gamma p⁻¹) * Real.exp (-Real.rpow |(x - m) / s| p)))
  else 0

def asymmetricLaplaceMeasure (m l r : ℝ) : Measure ℝ :=
  if 0 < l ∧ 0 < r then
    ((expMeasure r).prod (expMeasure l)).map (fun x => m + x.1 - x.2)
  else 0

def logitNormalMeasure (m : ℝ) (v : ℝ≥0) : Measure ℝ :=
  (gaussianReal m v).map (fun x => (1 + Real.exp (-x))⁻¹)

def logUniformMeasure (a b : ℝ) : Measure ℝ :=
  if 0 < a ∧ a < b then
    (TauCeti.Probability.uniformMeasure (Real.log a) (Real.log b)).map Real.exp
  else 0

def halfStudentTMeasure (ν s : ℝ) : Measure ℝ :=
  if 0 < ν ∧ 0 < s then
    (TauCeti.Probability.studentTMeasure ν).map (fun x => s * |x|)
  else 0

abbrev halfCauchyMeasure (s : ℝ) : Measure ℝ := halfStudentTMeasure 1 s

def negativeMultinomialMeasure {ι : Type*} [Fintype ι]
    (r p₀ : ℝ) (p : ι → ℝ≥0) : Measure (ι → ℕ) :=
  if 0 < p₀ ∧ p₀ + ∑ i, (p i : ℝ) = 1 then
    if r = 0 then Measure.dirac 0
    else if 0 < r then
      (gammaMeasure r p₀).bind
        (fun lam => Measure.pi (fun i => poissonMeasure (p i * Real.toNNReal lam)))
    else 0
  else 0

def betaNegativeBinomialMeasure (r a b : ℝ) : Measure ℕ :=
  if 0 < a ∧ 0 < b ∧ 0 ≤ r then
    (betaMeasure a b).bind (TauCeti.Probability.negativeBinomialMeasure r)
  else 0

def wrappedCauchyMeasure (m : AddCircle (2 * Real.pi)) (γ : ℝ≥0) :
    Measure (AddCircle (2 * Real.pi)) :=
  (cauchyMeasure 0 γ).map (fun x : ℝ => m + (x : AddCircle (2 * Real.pi)))

theorem wrappedCauchyMeasure_conv (m₁ m₂ : AddCircle (2 * Real.pi)) (γ₁ γ₂ : ℝ≥0) :
    wrappedCauchyMeasure m₁ γ₁ ∗ wrappedCauchyMeasure m₂ γ₂ =
      wrappedCauchyMeasure (m₁ + m₂) (γ₁ + γ₂) := by sorry

/-! ### Correlation coordinates and LKJ reference measure -/

abbrev strictLowerTriangle (p : ℕ) := {ij : Fin p × Fin p // ij.2 < ij.1}

def correlationCoordinates (p : ℕ) (x : strictLowerTriangle p → ℝ) : SymmetricMatrix p :=
  ⟨fun i j => if h : j < i then x ⟨(i, j), h⟩
    else if h : i < j then x ⟨(j, i), h⟩ else 1, by sorry⟩

def correlationLebesgue (p : ℕ) : Measure (SymmetricMatrix p) :=
  (volume : Measure (strictLowerTriangle p → ℝ)).map (correlationCoordinates p)

def lkjNormalizer (p : ℕ) (η : ℝ) : ℝ :=
  ∏ j ∈ Finset.range (p - 1), ProbabilityTheory.beta (1 / 2)
    (η + ((p : ℝ) - j - 2) / 2) ^ (p - j - 1)

def lkjMeasure (p : ℕ) (η : ℝ) : Measure (SymmetricMatrix p) := by
  classical
  exact if 0 < η then
    (correlationLebesgue p).withDensity (fun R =>
      if (R.val).PosDef then ENNReal.ofReal (Real.rpow (Matrix.det R.val) (η - 1) /
        lkjNormalizer p η) else 0)
  else 0

theorem isProbabilityMeasure_lkjMeasure (p : ℕ) {η : ℝ} (hη : 0 < η) :
    IsProbabilityMeasure (lkjMeasure p η) := by sorry

theorem lkjMeasure_entry_beta {p : ℕ} {η : ℝ} (hη : 0 < η)
    (i j : Fin p) (hij : i ≠ j) :
    (lkjMeasure p η).map (fun R => (R.val i j + 1) / 2) =
      betaMeasure (η + ((p : ℝ) - 2) / 2) (η + ((p : ℝ) - 2) / 2) := by sorry

theorem integrable_rpow_det_lkjMeasure_iff {p : ℕ} (hp : 2 ≤ p)
    {η : ℝ} (hη : 0 < η) (q : ℝ) :
    Integrable (fun R : SymmetricMatrix p => Real.rpow R.val.det q) (lkjMeasure p η) ↔
      -η < q := by sorry

theorem integral_rpow_det_lkjMeasure {p : ℕ}
    {η q : ℝ} (hη : 0 < η) (hq : -η < q) :
    ∫ R : SymmetricMatrix p, Real.rpow R.val.det q ∂lkjMeasure p η =
      lkjNormalizer p (η + q) / lkjNormalizer p η := by sorry

/-! ### Cast cdfs and almost-everywhere probability mixtures -/

example (μ : Measure ℕ) [IsProbabilityMeasure μ] (x : ℝ) :
    cdf (μ.map (Nat.cast : ℕ → ℝ)) x =
      if x < 0 then 0 else μ.real {k | k ≤ ⌊x⌋₊} := by
  split_ifs with hx
  · exact μ.cdf_map_natCast_of_neg hx
  · exact μ.cdf_map_natCast (le_of_not_gt hx)

example {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    (ρ : Measure α) [IsProbabilityMeasure ρ] (K : α → Measure β)
    (hK : AEMeasurable K ρ) (hprob : ∀ᵐ p ∂ρ, IsProbabilityMeasure (K p)) :
    IsProbabilityMeasure (ρ.bind K) := MeasureTheory.isProbabilityMeasure_bind hK hprob

/-! ### Gaussian transformations and noncentral Beta -/

def multivariateLogNormalMeasure {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) : Measure (EuclideanSpace ℝ ι) :=
  (multivariateGaussian m S).map (fun x => WithLp.toLp 2 (fun i => Real.exp (x i)))

theorem integrable_mixed_rpow_multivariateLogNormalMeasure {ι : Type*}
    [Fintype ι] [DecidableEq ι] (m q : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) :
    Integrable (fun x : EuclideanSpace ℝ ι => ∏ i, Real.rpow (x i) (q i))
      (multivariateLogNormalMeasure m S) := by sorry

theorem integral_mixed_rpow_multivariateLogNormalMeasure {ι : Type*}
    [Fintype ι] [DecidableEq ι] (m q : EuclideanSpace ℝ ι)
    {S : Matrix ι ι ℝ} (hS : S.PosSemidef) :
    ∫ x, ∏ i, Real.rpow (x i) (q i) ∂multivariateLogNormalMeasure m S =
      Real.exp (⟪q, m⟫_ℝ + ⟪q, S.toEuclideanLin q⟫_ℝ / 2) := by sorry

def logisticNormalChart {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι) (z : EuclideanSpace ℝ {i : ι // i ≠ r}) : EuclideanSpace ℝ ι :=
  let zbar : ι → ℝ := fun i => if h : i = r then 0 else z ⟨i, h⟩
  WithLp.toLp 2 (fun i => Real.exp (zbar i) / ∑ j, Real.exp (zbar j))

def logisticNormalMeasure {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι) (m : EuclideanSpace ℝ {i : ι // i ≠ r})
    (S : Matrix {i : ι // i ≠ r} {i : ι // i ≠ r} ℝ) : Measure (EuclideanSpace ℝ ι) :=
  (multivariateGaussian m S).map (logisticNormalChart r)

def logisticNormalReferenceChange {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r s : ι) : Matrix {i : ι // i ≠ s} {i : ι // i ≠ r} ℝ :=
  fun i j => (if i.val = j.val then 1 else 0) - (if s = j.val then 1 else 0)

theorem logisticNormalMeasure_change_reference {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r s : ι) (m : EuclideanSpace ℝ {i : ι // i ≠ r})
    (S : Matrix {i : ι // i ≠ r} {i : ι // i ≠ r} ℝ) :
    logisticNormalMeasure r m S =
      logisticNormalMeasure s ((logisticNormalReferenceChange r s).toEuclideanLin m)
        (logisticNormalReferenceChange r s * S * (logisticNormalReferenceChange r s)ᵀ) := by
  sorry

theorem logisticNormalMeasure_of_not_posSemidef {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι) (m : EuclideanSpace ℝ {i : ι // i ≠ r})
    {S : Matrix {i : ι // i ≠ r} {i : ι // i ≠ r} ℝ} (hS : ¬ S.PosSemidef) :
    logisticNormalMeasure r m S = Measure.dirac (logisticNormalChart r m) := by sorry

def noncentralBetaMeasure (a b : ℝ) (lam : ℝ≥0) : Measure ℝ :=
  if 0 ≤ a ∧ 0 < b then
    ((noncentralChiSquaredMeasure (2 * a) lam).prod
      (TauCeti.Probability.chiSquaredMeasure (2 * b))).map (fun x => x.1 / (x.1 + x.2))
  else 0

theorem noncentralBetaMeasure_zero_shape_mass {b : ℝ} (hb : 0 < b) (lam : ℝ≥0) :
    (noncentralBetaMeasure 0 b lam).real {0} = Real.exp (-(lam : ℝ) / 2) := by sorry

theorem quantile_noncentralBetaMeasure_zero_shape {b u : ℝ} (hb : 0 < b)
    (lam : ℝ≥0) (hu : u ∈ Set.Ioo (0 : ℝ) 1)
    (hw : u ≤ Real.exp (-(lam : ℝ) / 2)) :
    (noncentralBetaMeasure 0 b lam).quantile u = 0 := by sorry

/-! ### Exponential sums, mixtures, and named Beta specializations -/

def hypoexponentialMeasure {ι : Type*} [Fintype ι] (rates : ι → ℝ) : Measure ℝ :=
  if ∀ i, 0 < rates i then
    (Measure.pi (fun i => expMeasure (rates i))).map (fun x => ∑ i, x i)
  else 0

theorem hypoexponentialMeasure_empty {ι : Type*} [Fintype ι] [IsEmpty ι]
    (rates : ι → ℝ) : hypoexponentialMeasure rates = Measure.dirac 0 := by sorry

theorem integrableExpSet_hypoexponentialMeasure {ι : Type*} [Fintype ι]
    (rates : ι → ℝ) (hr : ∀ i, 0 < rates i) :
    integrableExpSet id (hypoexponentialMeasure rates) = {t | ∀ i, t < rates i} := by sorry

def hyperexponentialMeasure {ι : Type*} [Fintype ι]
    (p : Convexity.StdSimplex ℝ≥0 ι) (rates : ι → ℝ) : Measure ℝ :=
  if ∀ i, 0 < p.weights i → 0 < rates i then
    ∑ i, (p.weights i : ℝ≥0∞) • expMeasure (rates i)
  else 0

theorem integrableExpSet_hyperexponentialMeasure {ι : Type*} [Fintype ι]
    (p : Convexity.StdSimplex ℝ≥0 ι) (rates : ι → ℝ)
    (hr : ∀ i, 0 < p.weights i → 0 < rates i) :
    integrableExpSet id (hyperexponentialMeasure p rates) =
      {t | ∀ i, 0 < p.weights i → t < rates i} := by sorry

def arcsineMeasure : Measure ℝ := betaMeasure (1 / 2) (1 / 2)

def semicircleMeasure : Measure ℝ :=
  (betaMeasure (3 / 2) (3 / 2)).map (fun x => 2 * x - 1)

theorem quantile_arcsineMeasure {u : ℝ} (hu : u ∈ Set.Ioo (0 : ℝ) 1) :
    arcsineMeasure.quantile u = Real.sin (Real.pi * u / 2) ^ 2 := by sorry

/-! ### Scalar stable laws in Nolan's S₀ parameterization -/

def stableShapeValid (α β : ℝ) : Prop := 0 < α ∧ α ≤ 2 ∧ -1 ≤ β ∧ β ≤ 1

def stableCharacteristicExponent (α β u : ℝ) : ℂ :=
  if u = 0 then 0
  else if α = 1 then
    -(abs u : ℝ) - Complex.I * (2 * β / Real.pi : ℝ) * u * Real.log |u|
  else
    -(Real.rpow |u| α : ℂ) + Complex.I * (β * Real.tan (Real.pi * α / 2) : ℝ) *
      (SignType.sign u * Real.rpow |u| α - u : ℝ)

def stableS1Location (α β : ℝ) (s : ℝ≥0) (m : ℝ) : ℝ :=
  m - if s = 0 then 0
      else if α = 1 then (2 / Real.pi) * β * s * Real.log s
      else β * s * Real.tan (Real.pi * α / 2)

def stableMeasure (α β : ℝ) (s : ℝ≥0) (m : ℝ) : Measure ℝ := by sorry

theorem stableMeasure_of_invalid {α β : ℝ} (h : ¬ stableShapeValid α β)
    (s : ℝ≥0) (m : ℝ) : stableMeasure α β s m = 0 := by sorry

theorem stableMeasure_zero_scale {α β : ℝ} (h : stableShapeValid α β) (m : ℝ) :
    stableMeasure α β 0 m = Measure.dirac m := by sorry

theorem isProbabilityMeasure_stableMeasure {α β : ℝ} (h : stableShapeValid α β)
    (s : ℝ≥0) (m : ℝ) : IsProbabilityMeasure (stableMeasure α β s m) := by sorry

theorem charFun_stableMeasure {α β : ℝ} (h : stableShapeValid α β)
    (s : ℝ≥0) (m t : ℝ) :
    charFun (stableMeasure α β s m) t =
      Complex.exp (Complex.I * m * t + stableCharacteristicExponent α β ((s : ℝ) * t)) := by
  sorry

theorem integrable_rpow_abs_stableMeasure_iff {α β q : ℝ}
    (h : stableShapeValid α β) (hα : α < 2) {s : ℝ≥0} (hs : 0 < s)
    (m : ℝ) (hq : 0 < q) :
    Integrable (fun x => Real.rpow |x| q) (stableMeasure α β s m) ↔ q < α := by sorry

theorem integrableExpSet_stableMeasure {α β : ℝ} (h : stableShapeValid α β)
    (s : ℝ≥0) (m : ℝ) :
    integrableExpSet id (stableMeasure α β s m) =
      if s = 0 ∨ α = 2 then Set.univ
      else if β = 1 then Set.Iic 0
      else if β = -1 then Set.Ici 0
      else {0} := by sorry

theorem exists_probabilityMeasure_of_tendsto_charFun
    (μ : ℕ → ProbabilityMeasure ℝ) (f : ℝ → ℂ) (hf : ContinuousAt f 0)
    (hlim : ∀ t, Tendsto (fun n => charFun (μ n) t) atTop (𝓝 (f t))) :
    ∃ ν : ProbabilityMeasure ℝ, (∀ t, charFun ν t = f t) ∧ Tendsto μ atTop (𝓝 ν) := by sorry


end Expansion

end TauCetiRoadmap.StandardDistributions

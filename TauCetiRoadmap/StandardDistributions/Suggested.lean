import Mathlib

/-!
# Suggested declarations for standard probability distributions

This file gives possible Lean statements for milestones in [`README.md`](README.md). The roadmap
is authoritative: these declarations are examples, not an exhaustive API, and proving them does
not by itself complete a layer.

The file intentionally uses `sorry`. It makes the important choices of carrier, parameter type,
boundary behavior, and Mathlib interface concrete enough to review and implement.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Real Filter
open scoped ENNReal NNReal Topology unitInterval Matrix InnerProductSpace MatrixOrder

namespace TauCetiRoadmap.StandardDistributions

/-! ## Layer 0: Connect existing densities and add the uniform distribution -/

def uniformMeasure (a b : ℝ) : Measure ℝ :=
  ProbabilityTheory.cond volume (Set.Ioc a b)

theorem isProbabilityMeasure_uniformMeasure {a b : ℝ} (hab : a < b) :
    IsProbabilityMeasure (uniformMeasure a b) := by sorry

theorem integral_id_uniformMeasure {a b : ℝ} (hab : a < b) :
    ∫ x, x ∂uniformMeasure a b = (a + b) / 2 := by sorry

theorem variance_id_uniformMeasure {a b : ℝ} (hab : a < b) :
    variance id (uniformMeasure a b) = (b - a) ^ 2 / 12 := by sorry

theorem hasPDF_of_hasLaw_gammaMeasure {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {X : Ω → ℝ} {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (hX : HasLaw X (gammaMeasure a r) P) :
    HasPDF X P := by sorry

theorem hasPDF_of_hasLaw_gaussianReal {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {X : Ω → ℝ} {m : ℝ} {v : ℝ≥0} (hv : v ≠ 0) (hX : HasLaw X (gaussianReal m v) P) :
    HasPDF X P := by sorry

theorem hasPDF_of_hasLaw_cauchyMeasure {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {X : Ω → ℝ} {x₀ : ℝ} {γ : ℝ≥0} (hγ : γ ≠ 0) (hX : HasLaw X (cauchyMeasure x₀ γ) P) :
    HasPDF X P := by sorry

theorem measurable_gammaMeasure :
    Measurable fun p : ℝ × ℝ => gammaMeasure p.1 p.2 := by sorry

/-! ## Layer 1: Complete the elementary theory of existing distributions -/

theorem mgf_id_expMeasure {r t : ℝ} (hr : 0 < r) (ht : t < r) :
    mgf id (expMeasure r) t = r / (r - t) := by sorry

theorem variance_id_expMeasure {r : ℝ} (hr : 0 < r) :
    variance id (expMeasure r) = r⁻¹ ^ 2 := by sorry

theorem gammaMeasure_conv_gammaMeasure {a b r : ℝ} (ha : 0 < a) (hb : 0 < b) (hr : 0 < r) :
    (gammaMeasure a r) ∗ (gammaMeasure b r) = gammaMeasure (a + b) r := by sorry

theorem charFun_cauchyMeasure (x₀ : ℝ) (γ : ℝ≥0) (t : ℝ) :
    charFun (cauchyMeasure x₀ γ) t =
      Complex.exp (Complex.I * x₀ * t - γ * |t|) := by sorry

theorem not_integrable_id_cauchyMeasure (x₀ : ℝ) (γ : ℝ≥0) (hγ : γ ≠ 0) :
    ¬ Integrable id (cauchyMeasure x₀ γ) := by sorry

/-! ### Probability generating functions -/

def pgf {Ω : Type*} [MeasurableSpace Ω] (X : Ω → ℕ) (μ : Measure Ω) (t : ℝ) : ℝ :=
  ∫ ω, t ^ X ω ∂μ

theorem pgf_eq_mgf_natCast {Ω : Type*} [MeasurableSpace Ω] (X : Ω → ℕ) (μ : Measure Ω) (t : ℝ) :
    pgf X μ (rexp t) = mgf (fun ω => (X ω : ℝ)) μ t := by sorry

theorem pgf_bernoulliMeasure (p : I) (t : ℝ) :
    pgf id (bernoulliMeasure (1 : ℕ) 0 p) t = 1 - (p : ℝ) + (p : ℝ) * t := by sorry

-- Derivatives at zero extract coefficients; factorial moments would use derivatives at one.
theorem iteratedDeriv_pgf_zero (μ : Measure ℕ) [IsProbabilityMeasure μ] (n : ℕ) :
    iteratedDeriv n (pgf id μ) 0 = (n.factorial : ℝ) * μ.real {n} := by sorry

theorem measure_eq_of_pgf_eqOn {μ ν : Measure ℕ}
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (h : Set.EqOn (pgf id μ) (pgf id ν) (Set.Ioo (-1) 1)) :
    μ = ν := by sorry

/-! ## Layer 2: Incomplete special functions and closed-form cdfs -/

def lowerIncompleteGamma (s x : ℝ) : ℝ :=
  if 0 < s then ∫ t in (0)..max x 0, t ^ (s - 1) * rexp (-t) else 0

def regularizedGamma (s x : ℝ) : ℝ :=
  if 0 < s then lowerIncompleteGamma s x / Real.Gamma s else 0

-- The `a = 0` branch makes the binomial tail formula below include `m = 0`.
def regularizedIncompleteBeta (a b x : ℝ) : ℝ :=
  if a = 0 ∧ 0 < b ∧ 0 ≤ x then 1
  else if 0 < a ∧ 0 < b then
    (∫ t in (0)..min 1 (max x 0), t ^ (a - 1) * (1 - t) ^ (b - 1)) /
      (Real.Gamma a * Real.Gamma b / Real.Gamma (a + b))
  else 0

theorem hasDerivAt_lowerIncompleteGamma {s x : ℝ} (hs : 0 < s) (hx : 0 < x) :
    HasDerivAt (lowerIncompleteGamma s) (x ^ (s - 1) * rexp (-x)) x := by sorry

theorem regularizedIncompleteBeta_zero_left {b x : ℝ} (hb : 0 < b) (hx : 0 ≤ x) :
    regularizedIncompleteBeta 0 b x = 1 := by sorry

theorem regularizedIncompleteBeta_add_one_left {a b x : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hx₀ : 0 ≤ x) (hx₁ : x ≤ 1) :
    regularizedIncompleteBeta (a + 1) b x = regularizedIncompleteBeta a b x -
      Real.rpow x a * Real.rpow (1 - x) b * Real.Gamma (a + b) /
        (a * Real.Gamma a * Real.Gamma b) := by sorry

-- These local definitions stand in for the intended Mathlib names `Real.erf` and `Real.erfc`.
def erf (x : ℝ) : ℝ := 2 / √π * ∫ t in (0)..x, rexp (-t ^ 2)

def erfc (x : ℝ) : ℝ := 1 - erf x

theorem cdf_gammaMeasure_eq {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (x : ℝ) :
    cdf (gammaMeasure a r) x = regularizedGamma a (r * x) := by sorry

theorem cdf_gaussianReal_eq {m : ℝ} {v : ℝ≥0} (hv : v ≠ 0) (x : ℝ) :
    cdf (gaussianReal m v) x = (1 + erf ((x - m) / √(2 * v))) / 2 := by sorry

theorem cdf_gaussianReal_zero (m x : ℝ) :
    cdf (gaussianReal m 0) x = if m ≤ x then 1 else 0 := by sorry

theorem binomial_tail_eq_regularizedIncompleteBeta {m n : ℕ} (hmn : m ≤ n) (p : I) :
    (binomial n p).real {k | m ≤ k} =
      regularizedIncompleteBeta m (n - m + 1) (p : ℝ) := by sorry

theorem poissonMeasure_tail_eq_regularizedGamma (r : ℝ≥0) (n : ℕ) :
    (poissonMeasure r).real {k | n < k} = regularizedGamma (n + 1) (r : ℝ) := by sorry

example {x : ℝ} (hx : 0 ≤ x) : regularizedGamma 1 x = 1 - rexp (-x) := by sorry

/-! ## Layer 3: New scalar families -/

def laplacePDFReal (m b x : ℝ) : ℝ :=
  if 0 < b then (2 * b)⁻¹ * rexp (-|x - m| / b) else 0

def laplacePDF (m b x : ℝ) : ℝ≥0∞ := ENNReal.ofReal (laplacePDFReal m b x)

def laplaceMeasure (m b : ℝ) : Measure ℝ := volume.withDensity (laplacePDF m b)

theorem isProbabilityMeasure_laplaceMeasure {b : ℝ} (hb : 0 < b) (m : ℝ) :
    IsProbabilityMeasure (laplaceMeasure m b) := by sorry

theorem variance_id_laplaceMeasure {b : ℝ} (hb : 0 < b) (m : ℝ) :
    variance id (laplaceMeasure m b) = 2 * b ^ 2 := by sorry

theorem charFun_laplaceMeasure {b : ℝ} (hb : 0 < b) (m t : ℝ) :
    charFun (laplaceMeasure m b) t =
      Complex.exp (Complex.I * m * t) / (1 + b ^ 2 * t ^ 2) := by sorry

def chiSquaredMeasure (k : ℝ) : Measure ℝ :=
  if k = 0 then Measure.dirac 0
  else if 0 < k then gammaMeasure (k / 2) (1 / 2)
  else 0

theorem chiSquaredMeasure_eq_gammaMeasure {k : ℝ} (hk : 0 < k) :
    chiSquaredMeasure k = gammaMeasure (k / 2) (1 / 2) := by sorry

theorem chiSquaredMeasure_zero : chiSquaredMeasure 0 = Measure.dirac 0 := by sorry

def logNormalMeasure (m : ℝ) (v : ℝ≥0) : Measure ℝ := (gaussianReal m v).map rexp

theorem integral_pow_logNormalMeasure {m : ℝ} {v : ℝ≥0} (n : ℕ) :
    ∫ x, x ^ n ∂logNormalMeasure m v = rexp (n * m + n ^ 2 * v / 2) := by sorry

theorem not_integrable_exp_logNormalMeasure {m : ℝ} {v : ℝ≥0} (hv : v ≠ 0) {t : ℝ} (ht : 0 < t) :
    ¬ Integrable (fun x => rexp (t * x)) (logNormalMeasure m v) := by sorry

def studentTPDFReal (ν x : ℝ) : ℝ :=
  if 0 < ν then
    Real.Gamma ((ν + 1) / 2) / (√(ν * π) * Real.Gamma (ν / 2)) *
      (1 + x ^ 2 / ν) ^ (-((ν + 1) / 2))
  else 0

def studentTMeasure (ν : ℝ) : Measure ℝ :=
  volume.withDensity fun x => ENNReal.ofReal (studentTPDFReal ν x)

theorem cdf_studentTMeasure_eq {ν : ℝ} (hν : 0 < ν) (x : ℝ) :
    cdf (studentTMeasure ν) x =
      if x < 0 then
        regularizedIncompleteBeta (ν / 2) (1 / 2) (ν / (ν + x ^ 2)) / 2
      else
        1 - regularizedIncompleteBeta (ν / 2) (1 / 2) (ν / (ν + x ^ 2)) / 2 := by sorry

theorem integral_id_studentTMeasure {ν : ℝ} (hν : 1 < ν) :
    ∫ x, x ∂studentTMeasure ν = 0 := by sorry

theorem not_integrable_id_studentTMeasure {ν : ℝ} (hν0 : 0 < ν) (hν1 : ν ≤ 1) :
    ¬ Integrable id (studentTMeasure ν) := by sorry

theorem not_integrable_sq_studentTMeasure {ν : ℝ} (hν0 : 0 < ν) (hν2 : ν ≤ 2) :
    ¬ Integrable (fun x : ℝ => x ^ 2) (studentTMeasure ν) := by sorry

example : studentTMeasure 1 = cauchyMeasure 0 1 := by sorry

def negativeBinomialMeasure (r p : ℝ) : Measure ℕ :=
  if r = 0 ∧ p ∈ Set.Ioc (0 : ℝ) 1 then Measure.dirac 0
  else if 0 < r ∧ p ∈ Set.Ioc (0 : ℝ) 1 then
    Measure.sum fun k : ℕ =>
      (ENNReal.ofReal (Real.Gamma (k + r) / (k.factorial * Real.Gamma r) *
        p ^ r * (1 - p) ^ k)) • Measure.dirac k
  else 0

/-! ## Layer 4: Relationships among distributions -/

theorem map_sq_gaussianReal :
    (gaussianReal 0 1).map (fun x => x ^ 2) = chiSquaredMeasure 1 := by sorry

theorem bind_gammaMeasure_poissonMeasure {r p : ℝ} (hr : 0 < r) (hp : p ∈ Set.Ioo (0 : ℝ) 1) :
    (gammaMeasure r (p / (1 - p))).bind (fun lam => poissonMeasure (Real.toNNReal lam)) =
      negativeBinomialMeasure r p := by sorry

/-! ## Layer 5: Multivariate distributions -/

/-! ### Multivariate Gaussian distributions -/

noncomputable def covMatrix {ι : Type*} [Fintype ι] (μ : Measure (EuclideanSpace ℝ ι)) :
    Matrix ι ι ℝ :=
  Matrix.of fun i j => cov[fun z => z i, fun z => z j; μ]

theorem covMatrix_multivariateGaussian {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : S.PosSemidef) :
    covMatrix (multivariateGaussian m S) = S := by sorry

-- `covarianceBilin` is zero outside `MemLp id 2 μ`; the entrywise matrix need not be.
theorem covarianceBilin_eq_covMatrix {ι : Type*} [Fintype ι] [DecidableEq ι]
    {μ : Measure (EuclideanSpace ℝ ι)} [IsFiniteMeasure μ] (h : MemLp id 2 μ)
    (x y : EuclideanSpace ℝ ι) :
    covarianceBilin μ x y = ⟪x, (covMatrix μ).toEuclideanLin y⟫_ℝ := by sorry

noncomputable def multivariateGaussianPDFReal {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) (x : EuclideanSpace ℝ ι) : ℝ :=
  Real.rpow (2 * π) (-(Fintype.card ι : ℝ) / 2) *
    Real.rpow S.det (-(1 : ℝ) / 2) *
      rexp (-⟪x - m, (S⁻¹).toEuclideanLin (x - m)⟫_ℝ / 2)

noncomputable def multivariateGaussianPDF {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) (x : EuclideanSpace ℝ ι) : ℝ≥0∞ :=
  ENNReal.ofReal (multivariateGaussianPDFReal m S x)

theorem rnDeriv_multivariateGaussian {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : S.PosDef) :
    (multivariateGaussian m S).rnDeriv volume =ᵐ[volume]
      multivariateGaussianPDF m S := by sorry

theorem mutuallySingular_multivariateGaussian_volume {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : ¬S.PosDef) :
    multivariateGaussian m S ⟂ₘ volume := by sorry

theorem hasPDF_multivariateGaussian {Ω ι : Type*} [MeasurableSpace Ω] [Fintype ι]
    [DecidableEq ι] {P : Measure Ω} [IsProbabilityMeasure P]
    (X : Ω → EuclideanSpace ℝ ι) (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ}
    (hX : HasLaw X (multivariateGaussian m S) P) (hS : S.PosDef) :
    HasPDF X P := by sorry

theorem map_affine_multivariateGaussian {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ] (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ}
    (hS : S.PosSemidef) (L : Matrix κ ι ℝ) (c : EuclideanSpace ℝ κ) :
    (multivariateGaussian m S).map (fun x => L.toEuclideanLin x + c) =
      multivariateGaussian (L.toEuclideanLin m + c) (L * S * Lᵀ) := by sorry

/-! ### Multinomial and Dirichlet distributions -/

noncomputable def multinomialMeasure {ι : Type*} [Fintype ι] [Nonempty ι] (n : ℕ)
    (p : stdSimplex ℝ≥0 ι) : Measure (ι → ℕ) :=
  Measure.sum fun k : ι → ℕ =>
    (if ∑ i, k i = n then
      ENNReal.ofReal ((n.factorial : ℝ) / (∏ i, ((k i).factorial : ℝ)) *
        (∏ i, ((p : ι → ℝ≥0) i : ℝ) ^ k i))
    else 0) • Measure.dirac k

theorem isProbabilityMeasure_multinomialMeasure {ι : Type*} [Fintype ι] [Nonempty ι]
    (n : ℕ) (p : stdSimplex ℝ≥0 ι) :
    IsProbabilityMeasure (multinomialMeasure n p) := by sorry

theorem map_multinomialMeasure {ι κ : Type*} [Fintype ι] [Nonempty ι] [Fintype κ]
    [Nonempty κ] [DecidableEq κ] (n : ℕ) (p : stdSimplex ℝ≥0 ι) (f : ι → κ) :
    (multinomialMeasure n p).map (fun k j => ∑ i with f i = j, k i) =
      multinomialMeasure n (stdSimplex.map f p) := by sorry

open scoped Classical in

noncomputable def dirichletMeasure {ι : Type*} [Fintype ι] [Nonempty ι] (a : ι → ℝ) :
    Measure (EuclideanSpace ℝ ι) :=
  if ∀ i, 0 < a i then
    (Measure.pi fun i => gammaMeasure (a i) 1).map fun x =>
      (EuclideanSpace.equiv ι ℝ).symm fun i => if ∑ j, x j = 0 then 0 else x i / ∑ j, x j
  else 0

theorem isProbabilityMeasure_dirichletMeasure {ι : Type*} [Fintype ι] [Nonempty ι]
    {a : ι → ℝ} (ha : ∀ i, 0 < a i) :
    IsProbabilityMeasure (dirichletMeasure a) := by sorry

theorem dirichletMeasure_marginal_beta {ι : Type*} [Fintype ι] [Nonempty ι] [Nontrivial ι]
    [DecidableEq ι] {a : ι → ℝ} (ha : ∀ i, 0 < a i) (i : ι) :
    (dirichletMeasure a).map (fun x => x i) =
      betaMeasure (a i) (∑ j with j ≠ i, a j) := by sorry

/-! ### Conditional multivariate Gaussian distributions -/

def euclideanSumFst {ι κ : Type*} [Fintype ι] [Fintype κ]
    (x : EuclideanSpace ℝ (ι ⊕ κ)) : EuclideanSpace ℝ ι :=
  (EuclideanSpace.sumEquivProd x).1

def euclideanSumSnd {ι κ : Type*} [Fintype ι] [Fintype κ]
    (x : EuclideanSpace ℝ (ι ⊕ κ)) : EuclideanSpace ℝ κ :=
  (EuclideanSpace.sumEquivProd x).2

def gaussianBlock11 {ι κ : Type*} (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) : Matrix ι ι ℝ :=
  S.submatrix Sum.inl Sum.inl

def gaussianBlock12 {ι κ : Type*} (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) : Matrix ι κ ℝ :=
  S.submatrix Sum.inl Sum.inr

def gaussianBlock21 {ι κ : Type*} (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) : Matrix κ ι ℝ :=
  S.submatrix Sum.inr Sum.inl

def gaussianBlock22 {ι κ : Type*} (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) : Matrix κ κ ℝ :=
  S.submatrix Sum.inr Sum.inr

def gaussianCondMean {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq κ]
    (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ)
    (x₂ : EuclideanSpace ℝ κ) : EuclideanSpace ℝ ι :=
  euclideanSumFst m +
    Matrix.toEuclideanLin
      (gaussianBlock12 S * (gaussianBlock22 S)⁻¹)
      (x₂ - euclideanSumSnd m)

def gaussianCondCov {ι κ : Type*} [Fintype κ] [DecidableEq κ]
    (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) : Matrix ι ι ℝ :=
  gaussianBlock11 S - gaussianBlock12 S * (gaussianBlock22 S)⁻¹ * gaussianBlock21 S

def gaussianCondKernel {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ]
    (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) :
    Kernel (EuclideanSpace ℝ κ) (EuclideanSpace ℝ ι) where
  toFun x₂ := multivariateGaussian (gaussianCondMean m S x₂) (gaussianCondCov S)
  measurable' := by sorry

instance isMarkovKernel_gaussianCondKernel {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ]
    (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ) :
    IsMarkovKernel (gaussianCondKernel m S) := by sorry

theorem condDistrib_multivariateGaussian
    {Ω ι κ : Type*} [MeasurableSpace Ω] [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ] {P : Measure Ω} [IsProbabilityMeasure P]
    (X : Ω → EuclideanSpace ℝ (ι ⊕ κ))
    (m : EuclideanSpace ℝ (ι ⊕ κ)) (S : Matrix (ι ⊕ κ) (ι ⊕ κ) ℝ)
    (hX : HasLaw X (multivariateGaussian m S) P) (hS : S.PosDef) :
    condDistrib (fun ω => euclideanSumFst (X ω)) (fun ω => euclideanSumSnd (X ω)) P
      =ᵐ[P.map (fun ω => euclideanSumSnd (X ω))] gaussianCondKernel m S := by sorry

/-! ## Layer 6: Symmetric matrices and Wishart distributions -/

/-! ### Symmetric-matrix coordinates and Lebesgue measure -/

-- This private abbreviation keeps the prototypes readable. It unfolds in exported declarations,
-- so it does not propose a public Mathlib alias.
private abbrev SymmetricMatrix (p : ℕ) : Submodule ℝ (Matrix (Fin p) (Fin p) ℝ) :=
  selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)

abbrev upperTriangle (p : ℕ) := {ij : Fin p × Fin p // ij.1 ≤ ij.2}

noncomputable def symmetricCoordinates (p : ℕ) :
    SymmetricMatrix p ≃ₗ[ℝ] (upperTriangle p → ℝ) := sorry

noncomputable instance symmetricMatrixMeasurableSpace (p : ℕ) :
    MeasurableSpace (SymmetricMatrix p) :=
  MeasurableSpace.comap (symmetricCoordinates p) inferInstance

noncomputable instance symmetricMatrixNormedAddCommGroup (p : ℕ) :
    NormedAddCommGroup (SymmetricMatrix p) := sorry

noncomputable instance symmetricMatrixContinuousENorm (p : ℕ) :
    ContinuousENorm (SymmetricMatrix p) := sorry

noncomputable instance symmetricMatrixNormedSpace (p : ℕ) :
    NormedSpace ℝ (SymmetricMatrix p) := sorry

noncomputable instance symmetricMatrixInnerProductSpace (p : ℕ) :
    InnerProductSpace ℝ (SymmetricMatrix p) := sorry

noncomputable instance symmetricMatrixCompleteSpace (p : ℕ) :
    CompleteSpace (SymmetricMatrix p) := sorry

noncomputable instance symmetricMatrixBorelSpace (p : ℕ) :
    BorelSpace (SymmetricMatrix p) := sorry

theorem finrank_symmetricMatrix (p : ℕ) :
    Module.finrank ℝ (SymmetricMatrix p) = p * (p + 1) / 2 := by sorry

theorem inner_symmetricMatrix_eq_trace_mul {p : ℕ} (A Θ : SymmetricMatrix p) :
    ⟪A, Θ⟫_ℝ =
      Matrix.trace ((Θ : Matrix (Fin p) (Fin p) ℝ) * (A : Matrix (Fin p) (Fin p) ℝ)) := by
  sorry

noncomputable def symmetricLebesgue (p : ℕ) : Measure (SymmetricMatrix p) :=
  (volume : Measure (upperTriangle p → ℝ)).map (symmetricCoordinates p).symm

theorem measurePreserving_symmetricCoordinates_symm (p : ℕ) :
    MeasurePreserving (symmetricCoordinates p).symm volume (symmetricLebesgue p) := by sorry

theorem symmetricLebesgue_zero : symmetricLebesgue 0 = Measure.dirac 0 := by sorry

noncomputable def symmetricCongruence {p : ℕ} (C : Matrix.GeneralLinearGroup (Fin p) ℝ) :
    SymmetricMatrix p ≃ₗ[ℝ] SymmetricMatrix p := sorry

theorem map_symmetricCongruence_symmetricLebesgue {p : ℕ}
    (C : Matrix.GeneralLinearGroup (Fin p) ℝ) :
    (symmetricLebesgue p).map (symmetricCongruence C) =
      (ENNReal.ofReal |Matrix.det (C : Matrix (Fin p) (Fin p) ℝ)| ^ (p + 1))⁻¹ •
        symmetricLebesgue p := by sorry

/-! ### Cholesky coordinates -/

abbrev PosDefMatrix (p : ℕ) :=
  {A : SymmetricMatrix p // (A : Matrix (Fin p) (Fin p) ℝ).PosDef}

theorem measurableSet_posDefMatrix (p : ℕ) :
    MeasurableSet {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef} := by sorry

abbrev PosDiagLowerTriangular (p : ℕ) :=
  {L : Matrix (Fin p) (Fin p) ℝ // (∀ i j : Fin p, i < j → L i j = 0) ∧ ∀ i, 0 < L i i}

abbrev lowerTriangle (p : ℕ) := {ij : Fin p × Fin p // ij.2 ≤ ij.1}

abbrev PosDiagLowerCoordinates (p : ℕ) :=
  {x : lowerTriangle p → ℝ // ∀ i : Fin p, 0 < x ⟨(i, i), le_rfl⟩}

def lowerTriangleEntries {p : ℕ} (L : PosDiagLowerTriangular p) : lowerTriangle p → ℝ :=
  fun ij => L.1 ij.1.1 ij.1.2

noncomputable instance posDiagLowerTriangularMeasurableSpace (p : ℕ) :
    MeasurableSpace (PosDiagLowerTriangular p) :=
  MeasurableSpace.comap lowerTriangleEntries inferInstance

noncomputable def lowerTriangleCoordinates (p : ℕ) :
    PosDiagLowerTriangular p ≃ᵐ PosDiagLowerCoordinates p := sorry

noncomputable def posDiagLowerCoordinatesLebesgue (p : ℕ) :
    Measure (PosDiagLowerCoordinates p) :=
  (volume : Measure (lowerTriangle p → ℝ)).comap Subtype.val

noncomputable def posDiagLowerTriangularLebesgue (p : ℕ) :
    Measure (PosDiagLowerTriangular p) :=
  (posDiagLowerCoordinatesLebesgue p).map (lowerTriangleCoordinates p).symm

-- This local name stands in for the intended Mathlib declaration `Matrix.PosDef.cholesky`.
noncomputable def cholesky {p : ℕ} (A : PosDefMatrix p) :
    PosDiagLowerTriangular p := sorry

theorem cholesky_mul_transpose {p : ℕ} (A : PosDefMatrix p) :
    (cholesky A).1 * ((cholesky A).1)ᵀ =
      (A.1 : Matrix (Fin p) (Fin p) ℝ) := by sorry

theorem cholesky_unique {p : ℕ} (A : PosDefMatrix p) (L : PosDiagLowerTriangular p)
    (hL : L.1 * L.1ᵀ = (A.1 : Matrix (Fin p) (Fin p) ℝ)) :
    L = cholesky A := by sorry

noncomputable def choleskyReconstruction {p : ℕ}
    (L : PosDiagLowerTriangular p) : PosDefMatrix p := sorry

theorem choleskyReconstruction_coe {p : ℕ} (L : PosDiagLowerTriangular p) :
    ((choleskyReconstruction L).1 : Matrix (Fin p) (Fin p) ℝ) = L.1 * L.1ᵀ := by sorry

theorem measurable_cholesky {p : ℕ} :
    Measurable (@cholesky p) := by sorry

theorem measurable_choleskyReconstruction {p : ℕ} :
    Measurable (@choleskyReconstruction p) := by sorry

noncomputable def choleskyJacobianDensity {p : ℕ} (L : PosDiagLowerTriangular p) : ℝ≥0∞ :=
  ENNReal.ofReal ((2 : ℝ) ^ p * ∏ i : Fin p, (L.1 i i) ^ (p - i.1))

theorem map_cholesky_symmetricLebesgue (p : ℕ) :
    ((posDiagLowerTriangularLebesgue p).withDensity choleskyJacobianDensity).map
        (fun L => (choleskyReconstruction L).1) =
      (symmetricLebesgue p).restrict
        {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef} := by sorry

/-! ### Wishart distributions -/

noncomputable def multivariateGamma (p : ℕ) (a : ℝ) : ℝ :=
  Real.rpow π ((p : ℝ) * ((p : ℝ) - 1) / 4) * ∏ i : Fin p, Real.Gamma (a - (i.1 : ℝ) / 2)

theorem integral_posDef_multivariateGamma {p : ℕ} {a : ℝ} (hp : 0 < p)
    (ha : ((p : ℝ) - 1) / 2 < a) :
    ∫ A in {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef},
      Real.rpow (A : Matrix (Fin p) (Fin p) ℝ).det (a - ((p : ℝ) + 1) / 2) *
        rexp (-Matrix.trace (A : Matrix (Fin p) (Fin p) ℝ)) ∂symmetricLebesgue p =
      multivariateGamma p a := by sorry

theorem integral_posDef_multivariateGamma_zero (a : ℝ) :
    ∫ A in {A : SymmetricMatrix 0 | (A : Matrix (Fin 0) (Fin 0) ℝ).PosDef},
      Real.rpow (A : Matrix (Fin 0) (Fin 0) ℝ).det (a - (1 : ℝ) / 2) *
        rexp (-Matrix.trace (A : Matrix (Fin 0) (Fin 0) ℝ)) ∂symmetricLebesgue 0 =
      multivariateGamma 0 a := by sorry

open scoped Classical in

noncomputable def wishartPDFReal {p : ℕ} (n : ℝ) (S : Matrix (Fin p) (Fin p) ℝ)
    (A : SymmetricMatrix p) : ℝ :=
  if (A : Matrix (Fin p) (Fin p) ℝ).PosDef then
    Real.rpow (A : Matrix (Fin p) (Fin p) ℝ).det ((n - (p : ℝ) - 1) / 2) *
        rexp (-Matrix.trace (S⁻¹ * (A : Matrix (Fin p) (Fin p) ℝ)) / 2) /
      (Real.rpow 2 (n * (p : ℝ) / 2) * Real.rpow S.det (n / 2) * multivariateGamma p (n / 2))
  else 0

open scoped Classical in

noncomputable def wishartMeasure {p : ℕ} (n : ℝ) (S : Matrix (Fin p) (Fin p) ℝ) :
    Measure (SymmetricMatrix p) :=
  if S.PosDef ∧ (p : ℝ) - 1 < n then
    (symmetricLebesgue p).withDensity fun A => ENNReal.ofReal (wishartPDFReal n S A)
  else 0

theorem isProbabilityMeasure_wishartMeasure {p : ℕ} {n : ℝ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    IsProbabilityMeasure (wishartMeasure n S) := by sorry

noncomputable def posDefToSymmetric {p : ℕ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) : SymmetricMatrix p :=
  ⟨S, by sorry⟩

theorem integrable_id_wishartMeasure {p : ℕ} {n : ℝ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    Integrable id (wishartMeasure n S) := by sorry

theorem integral_id_wishartMeasure {p : ℕ} {n : ℝ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) :
    ∫ A, A ∂wishartMeasure n S = n • posDefToSymmetric hS := by sorry

theorem integral_apply_wishartMeasure {p : ℕ} {n : ℝ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) (i j : Fin p) :
    ∫ A, (A : Matrix (Fin p) (Fin p) ℝ) i j ∂wishartMeasure n S = n * S i j := by sorry

noncomputable def sumVecMulVec {p ν : ℕ} (X : Fin ν → EuclideanSpace ℝ (Fin p)) :
    SymmetricMatrix p :=
  ⟨∑ r, Matrix.vecMulVec (X r) (X r), by sorry⟩

theorem hasLaw_sum_vecMulVec_gaussian {Ω : Type*} [MeasurableSpace Ω] {p ν : ℕ}
    {P : Measure Ω} [IsProbabilityMeasure P] (X : Fin ν → Ω → EuclideanSpace ℝ (Fin p))
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef) (hpν : p ≤ ν)
    (hX : ∀ r, HasLaw (X r) (multivariateGaussian 0 S) P) (hIndep : iIndepFun X P) :
    HasLaw (fun ω => sumVecMulVec (fun r => X r ω)) (wishartMeasure (ν : ℝ) S) P := by sorry

theorem cov_apply_wishartMeasure {p : ℕ} {n : ℝ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) (i j k l : Fin p) :
    cov[fun A : SymmetricMatrix p => (A : Matrix (Fin p) (Fin p) ℝ) i j,
        fun A => (A : Matrix (Fin p) (Fin p) ℝ) k l; wishartMeasure n S] =
      n * (S i k * S j l + S i l * S j k) := by sorry

theorem mem_integrableExpSet_trace_mul_wishartMeasure_iff {p : ℕ} {n t : ℝ}
    {S Θ : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef) (hn : (p : ℝ) - 1 < n)
    (hΘ : Θ.IsHermitian) :
    t ∈ integrableExpSet
        (fun A : SymmetricMatrix p => Matrix.trace (Θ * (A : Matrix (Fin p) (Fin p) ℝ)))
        (wishartMeasure n S) ↔
      (1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef := by sorry

theorem mgf_trace_mul_wishartMeasure {p : ℕ} {n t : ℝ} {S Θ : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (hn : (p : ℝ) - 1 < n) (hΘ : Θ.IsHermitian)
    (ht : (1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef) :
    mgf (fun A : SymmetricMatrix p => Matrix.trace (Θ * (A : Matrix (Fin p) (Fin p) ℝ)))
        (wishartMeasure n S) t =
      Real.rpow (Matrix.det (1 - (2 * t) • (Θ * S))) (-n / 2) := by sorry

-- The exponential of a sum of principal logarithms makes the complex branch choice explicit.
theorem charFun_wishartMeasure {p : ℕ} {n : ℝ} {S : Matrix (Fin p) (Fin p) ℝ}
    (Θ : SymmetricMatrix p) (hS : S.PosDef) (hn : (p : ℝ) - 1 < n)
    (hB : (CFC.sqrt S * (Θ : Matrix (Fin p) (Fin p) ℝ) * CFC.sqrt S).IsHermitian) :
    charFun (wishartMeasure n S) Θ =
      Complex.exp (-(n : ℂ) / 2 *
        ∑ j : Fin p, Complex.log (1 - 2 * Complex.I * (hB.eigenvalues j : ℂ))) := by sorry

/-! ### Bartlett decomposition -/

abbrev bartlettIndex (p : ℕ) :=
  Fin p ⊕ {ij : Fin p × Fin p // ij.2 < ij.1}

def bartlettEntry {p : ℕ} (T : PosDiagLowerTriangular p) : bartlettIndex p → ℝ
  | Sum.inl i => (T.1 i i) ^ 2
  | Sum.inr ij => T.1 ij.1.1 ij.1.2

noncomputable def wishartPosDefMeasure (p ν : ℕ) : Measure (PosDefMatrix p) :=
  (wishartMeasure (ν : ℝ) (1 : Matrix (Fin p) (Fin p) ℝ)).comap Subtype.val

theorem map_wishartPosDefMeasure (p ν : ℕ) (hpν : p ≤ ν) :
    (wishartPosDefMeasure p ν).map (Subtype.val : PosDefMatrix p → SymmetricMatrix p) =
      wishartMeasure (ν : ℝ) (1 : Matrix (Fin p) (Fin p) ℝ) := by sorry

theorem bartlett_wishartMeasure {p ν : ℕ} (hpν : p ≤ ν) :
    iIndepFun
        (fun r : bartlettIndex p => fun A : PosDefMatrix p =>
          bartlettEntry (cholesky A) r)
        (wishartPosDefMeasure p ν) ∧
      (∀ i : Fin p,
        HasLaw
          (fun A : PosDefMatrix p => bartlettEntry (cholesky A) (Sum.inl i))
          (chiSquaredMeasure ((ν : ℝ) - (i.1 : ℝ))) (wishartPosDefMeasure p ν)) ∧
      (∀ ij : {ij : Fin p × Fin p // ij.2 < ij.1},
        HasLaw
          (fun A : PosDefMatrix p => bartlettEntry (cholesky A) (Sum.inr ij))
          (gaussianReal 0 1) (wishartPosDefMeasure p ν)) := by sorry

/-! ### Inverse-Wishart distributions -/

noncomputable def symmetricInv {p : ℕ} (A : SymmetricMatrix p) : SymmetricMatrix p :=
  ⟨(A : Matrix (Fin p) (Fin p) ℝ)⁻¹, by sorry⟩

theorem map_inv_symmetricLebesgue {p : ℕ} :
    ((symmetricLebesgue p).restrict
        {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef}).map symmetricInv =
      ((symmetricLebesgue p).restrict
          {A : SymmetricMatrix p | (A : Matrix (Fin p) (Fin p) ℝ).PosDef}).withDensity
        fun B => ENNReal.ofReal
          (Real.rpow (B : Matrix (Fin p) (Fin p) ℝ).det (-((p : ℝ) + 1))) := by sorry

noncomputable def inverseWishartMeasure {p : ℕ} (n : ℝ) (S : Matrix (Fin p) (Fin p) ℝ) :
    Measure (SymmetricMatrix p) :=
  (wishartMeasure n S⁻¹).map symmetricInv

theorem integrable_id_inverseWishartMeasure {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hp : 0 < p) (hS : S.PosDef)
    (hn : (p : ℝ) + 1 < n) :
    Integrable id (inverseWishartMeasure n S) := by sorry

theorem integral_id_inverseWishartMeasure {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hp : 0 < p) (hS : S.PosDef)
    (hn : (p : ℝ) + 1 < n) :
    ∫ A, A ∂inverseWishartMeasure n S =
      (n - (p : ℝ) - 1)⁻¹ • posDefToSymmetric hS := by sorry

theorem integral_apply_inverseWishartMeasure {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hp : 0 < p) (hS : S.PosDef) (hn : (p : ℝ) + 1 < n)
    (i j : Fin p) :
    ∫ A, (A : Matrix (Fin p) (Fin p) ℝ) i j ∂inverseWishartMeasure n S =
      S i j / (n - (p : ℝ) - 1) := by sorry

theorem not_integrable_id_inverseWishartMeasure {p : ℕ} {n : ℝ}
    {S : Matrix (Fin p) (Fin p) ℝ} (hp : 0 < p) (hS : S.PosDef)
    (hnValid : (p : ℝ) - 1 < n) (hn : n ≤ (p : ℝ) + 1) :
    ¬Integrable id (inverseWishartMeasure n S) := by sorry

theorem inverseWishartMeasure_zero {n : ℝ} {S : Matrix (Fin 0) (Fin 0) ℝ}
    (hS : S.PosDef) (hn : -(1 : ℝ) < n) :
    inverseWishartMeasure n S = Measure.dirac 0 := by sorry

theorem integrable_id_inverseWishartMeasure_zero {n : ℝ} {S : Matrix (Fin 0) (Fin 0) ℝ}
    (hS : S.PosDef) (hn : -(1 : ℝ) < n) :
    Integrable id (inverseWishartMeasure n S) := by sorry

theorem integral_id_inverseWishartMeasure_zero {n : ℝ} {S : Matrix (Fin 0) (Fin 0) ℝ}
    (hS : S.PosDef) (hn : -(1 : ℝ) < n) :
    ∫ A, A ∂inverseWishartMeasure n S = 0 := by sorry

end TauCetiRoadmap.StandardDistributions

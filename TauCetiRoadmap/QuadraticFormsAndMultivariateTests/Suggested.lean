import Mathlib
import TauCeti.Probability.Distributions.Wishart.Basic
import TauCeti.Probability.Distributions.NoncentralF.Basic
import TauCeti.Probability.Distributions.StudentT.Basic

/-!
# Quadratic forms and multivariate tests: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the two
definitions they need; both definitions have real bodies.

Conventions, as in the README: vectors live in `EuclideanSpace ℝ ι`; a matrix `A` acts through
`A.toEuclideanLin`, and the quadratic form of `A` is `x ↦ ⟪x, A.toEuclideanLin x⟫`; Gaussian
laws are Mathlib's `multivariateGaussian m C`; chi-squared, Student, noncentral `F` and Wishart
laws are Tau Ceti's `chiSquaredMeasure`, `studentTMeasure`, `noncentralFMeasure` and
`wishartGramMeasure`, and `wishartGram` is Tau Ceti's Gram (scatter) sum of a family of vectors.
-/

noncomputable section

open MeasureTheory ProbabilityTheory
open scoped RealInnerProductSpace NNReal

namespace TauCetiRoadmap.QuadraticFormsAndMultivariateTests

open TauCeti.Probability

/-! ## Layer 1: the Craig–Sakamoto determinant identity -/

section CraigSakamoto

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 1.1 (Craig–Sakamoto–Matusita): for real symmetric `A` and `B`, the identity
`det (1 - s A - t B) = det (1 - s A) det (1 - t B)` holds for all `(s, t)` near `(0, 0)` if and
only if `A B = 0`; in that case it holds for all real `s`, `t`. -/
theorem eventually_det_eq_mul_det_iff_mul_eq_zero {A B : Matrix ι ι ℝ} (hA : A.IsHermitian)
    (hB : B.IsHermitian) :
    (∀ᶠ st : ℝ × ℝ in nhds (0, 0),
        (1 - st.1 • A - st.2 • B).det = (1 - st.1 • A).det * (1 - st.2 • B).det) ↔
      A * B = 0 := by
  sorry

end CraigSakamoto

/-! ## Layer 2: quadratic forms in a Gaussian vector -/

section GaussianForms

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 2.1: under a centred Gaussian law with positive semidefinite covariance `C` (possibly
singular), the quadratic form of a symmetric `A` has the chi-squared law with `r` degrees of
freedom if and only if `C A C A C = C A C` and `tr (A C) = r`. -/
theorem map_inner_multivariateGaussian_eq_chiSquared_iff {C A : Matrix ι ι ℝ}
    (hC : C.PosSemidef) (hA : A.IsHermitian) (r : ℕ) :
    (multivariateGaussian 0 C).map (fun x ↦ ⟪x, A.toEuclideanLin x⟫) = chiSquaredMeasure r ↔
      C * A * C * A * C = C * A * C ∧ (A * C).trace = r := by
  sorry

/-- 2.2 (Craig's theorem): under a centred Gaussian law with positive semidefinite covariance
`C`, the quadratic forms of symmetric `A` and `B` are independent if and only if
`C A C B C = 0`. -/
theorem indepFun_inner_multivariateGaussian_iff {C A B : Matrix ι ι ℝ} (hC : C.PosSemidef)
    (hA : A.IsHermitian) (hB : B.IsHermitian) :
    IndepFun (fun x ↦ ⟪x, A.toEuclideanLin x⟫) (fun x ↦ ⟪x, B.toEuclideanLin x⟫)
        (multivariateGaussian 0 C) ↔
      C * A * C * B * C = 0 := by
  sorry

/-- 2.3 (Kac's theorem): under a centred Gaussian law with positive semidefinite covariance
`C`, the linear form `⟪a, x⟫` and the quadratic form of a symmetric `A` are independent if and
only if `C A C a = 0`. -/
theorem indepFun_inner_inner_multivariateGaussian_iff {C A : Matrix ι ι ℝ} (hC : C.PosSemidef)
    (hA : A.IsHermitian) (a : EuclideanSpace ℝ ι) :
    IndepFun (fun x ↦ ⟪a, x⟫) (fun x ↦ ⟪x, A.toEuclideanLin x⟫) (multivariateGaussian 0 C) ↔
      (C * A * C).toEuclideanLin a = 0 := by
  sorry

/-- 2.4: under the Gaussian law with mean `μ` and positive semidefinite covariance `C`, the
covariance of the quadratic forms of symmetric `A` and `B` is
`2 tr (A C B C) + 4 ⟪μ, A C B μ⟫`. -/
theorem covariance_inner_multivariateGaussian {C A B : Matrix ι ι ℝ} (hC : C.PosSemidef)
    (hA : A.IsHermitian) (hB : B.IsHermitian) (μ : EuclideanSpace ℝ ι) :
    cov[fun x ↦ ⟪x, A.toEuclideanLin x⟫, fun x ↦ ⟪x, B.toEuclideanLin x⟫;
        multivariateGaussian μ C] =
      2 * (A * C * B * C).trace + 4 * ⟪μ, (A * C * B).toEuclideanLin μ⟫ := by
  sorry

end GaussianForms

/-! ## Layer 3: Hotelling's `T²` -/

section Hotelling

variable {p n : ℕ}

/-- 3.1 (the multivariate Student theorem): for `n ≥ 1` independent observations with law
`N(μ, S)`, `S` positive semidefinite, the sample mean and the scatter matrix of the deviations
from it are independent, with laws `N(μ, S / n)` and the Gaussian-Gram (Wishart) law of degree
`n - 1` and scale `S`. -/
theorem map_pi_multivariateGaussian_sampleMean_wishartGram (hn : 1 ≤ n)
    (μ : EuclideanSpace ℝ (Fin p)) {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosSemidef) :
    (Measure.pi fun _ : Fin n ↦ multivariateGaussian μ S).map
        (fun x ↦ (((n : ℝ)⁻¹ • ∑ i, x i), wishartGram fun i ↦ x i - (n : ℝ)⁻¹ • ∑ j, x j)) =
      (multivariateGaussian μ ((n : ℝ)⁻¹ • S)).prod (wishartGramMeasure (n - 1) S) := by
  sorry

/-- 3.2: if `y` has law `N(δ, S)` with `S` positive definite, `W` is independent of `y` with
the Wishart law of degree `m ≥ p ≥ 1` and scale `S`, then `((m - p + 1) / p) ⟪y, W⁻¹ y⟫` has
the noncentral `F` law with degrees `p` and `m - p + 1` and noncentrality `⟪δ, S⁻¹ δ⟫`. -/
theorem hasLaw_noncentralF_inner_inv_wishartGram {Ω : Type*} [MeasurableSpace Ω]
    {P : Measure Ω} {m : ℕ} (hp : 1 ≤ p) (hpm : p ≤ m) {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosDef) (δ : EuclideanSpace ℝ (Fin p)) {y : Ω → EuclideanSpace ℝ (Fin p)}
    {W : Ω → selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)}
    (hy : HasLaw y (multivariateGaussian δ S) P) (hW : HasLaw W (wishartGramMeasure m S) P)
    (hyW : IndepFun y W P) :
    HasLaw (fun ω ↦ ((m : ℝ) - p + 1) / p *
        ⟪y ω, ((W ω : Matrix (Fin p) (Fin p) ℝ)⁻¹).toEuclideanLin (y ω)⟫)
      (noncentralFMeasure p ((m : ℝ) - p + 1) (Real.toNNReal ⟪δ, (S⁻¹).toEuclideanLin δ⟫))
      P := by
  sorry

/-- 3.3: Hotelling's statistic `T² = n ⟪x̄ - μ₀, S⁻¹ (x̄ - μ₀)⟫` of a sample
`x : Fin n → ℝᵖ`, where `x̄` is the sample mean and `S` the sample covariance matrix, the scatter
matrix divided by `n - 1`. -/
def hotellingTSq (μ₀ : EuclideanSpace ℝ (Fin p)) (x : Fin n → EuclideanSpace ℝ (Fin p)) : ℝ :=
  n * ⟪((n : ℝ)⁻¹ • ∑ i, x i) - μ₀,
    ((((n : ℝ) - 1)⁻¹ • ((wishartGram fun i ↦ x i - (n : ℝ)⁻¹ • ∑ j, x j :
        selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) : Matrix (Fin p) (Fin p) ℝ))⁻¹
      ).toEuclideanLin (((n : ℝ)⁻¹ • ∑ i, x i) - μ₀)⟫

/-- 3.3 (Hotelling): for `n > p ≥ 1` independent observations with law `N(μ, S)`, `S` positive
definite, `((n - p) / (p (n - 1))) T²` has the noncentral `F` law with degrees `p` and `n - p`
and noncentrality `n ⟪μ - μ₀, S⁻¹ (μ - μ₀)⟫`; for `μ₀ = μ` it is Snedecor's `F` law. -/
theorem hasLaw_noncentralF_hotellingTSq {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    (hp : 1 ≤ p) (hpn : p < n) (μ μ₀ : EuclideanSpace ℝ (Fin p))
    {S : Matrix (Fin p) (Fin p) ℝ} (hS : S.PosDef) {X : Ω → Fin n → EuclideanSpace ℝ (Fin p)}
    (hX : HasLaw X (Measure.pi fun _ : Fin n ↦ multivariateGaussian μ S) P) :
    HasLaw (fun ω ↦ ((n : ℝ) - p) / (p * ((n : ℝ) - 1)) * hotellingTSq μ₀ (X ω))
      (noncentralFMeasure p ((n : ℝ) - p)
        (Real.toNNReal (n * ⟪μ - μ₀, (S⁻¹).toEuclideanLin (μ - μ₀)⟫))) P := by
  sorry

end Hotelling

/-! ## Layer 4: Fieller's confidence sets for a ratio -/

section Fieller

/-- 4.1: Fieller's set for the observation `y = (y₀, y₁)`, the symmetric matrix `V` and the
threshold `c`: the `r` with `(y₀ - r y₁)² ≤ c (V₀₀ - 2 r V₀₁ + r² V₁₁)`. -/
def fiellerSet (y : EuclideanSpace ℝ (Fin 2)) (V : Matrix (Fin 2) (Fin 2) ℝ) (c : ℝ) : Set ℝ :=
  {r | (y 0 - r * y 1) ^ 2 ≤ c * (V 0 0 - 2 * r * V 0 1 + r ^ 2 * V 1 1)}

/-- 4.1 (Fieller's theorem): let `Y` have law `N(μ, σ² V)` with `V` positive definite and
`σ > 0`, let `ν s² / σ²` have the chi-squared law with `ν ≥ 1` degrees of freedom, `s`
independent of `Y`, and let `μ₀ = ρ μ₁`. Then the probability that `ρ` lies in Fieller's set
with threshold `q² s²` is the mass of `[-|q|, |q|]` under Student's law with `ν` degrees of
freedom, whatever the value of `μ`. -/
theorem measure_mem_fiellerSet {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    {Y : Ω → EuclideanSpace ℝ (Fin 2)} {s : Ω → ℝ} {μ : EuclideanSpace ℝ (Fin 2)}
    {V : Matrix (Fin 2) (Fin 2) ℝ} (hV : V.PosDef) {σ : ℝ} (hσ : 0 < σ) {ν : ℕ} (hν : 1 ≤ ν)
    {ρ : ℝ} (hρ : μ 0 = ρ * μ 1) (q : ℝ)
    (hY : HasLaw Y (multivariateGaussian μ (σ ^ 2 • V)) P)
    (hs : HasLaw (fun ω ↦ ν * s ω ^ 2 / σ ^ 2) (chiSquaredMeasure ν) P) (hYs : IndepFun Y s P) :
    P {ω | ρ ∈ fiellerSet (Y ω) V (q ^ 2 * s ω ^ 2)} =
      studentTMeasure ν (Set.Icc (-|q|) |q|) := by
  sorry

/-- 4.2 (the shape of Fieller's set): for `V` positive definite and `c > 0`, write
`a = y₁² - c V₁₁` and `Q = ⟪y, V⁻¹ y⟫`. If `a > 0` the set is a bounded closed interval with
distinct ends; if `a < 0 < Q - c` it is the union of two disjoint closed half-lines; if
`a = 0 < Q - c` it is one closed half-line; if `Q ≤ c` it is the whole line. -/
theorem fiellerSet_cases {V : Matrix (Fin 2) (Fin 2) ℝ} (hV : V.PosDef)
    (y : EuclideanSpace ℝ (Fin 2)) {c : ℝ} (hc : 0 < c) :
    (0 < y 1 ^ 2 - c * V 1 1 →
        ∃ l₁ l₂, l₁ < l₂ ∧ fiellerSet y V c = Set.Icc l₁ l₂) ∧
      (y 1 ^ 2 - c * V 1 1 < 0 → c < ⟪y, (V⁻¹).toEuclideanLin y⟫ →
        ∃ l₁ l₂, l₁ < l₂ ∧ fiellerSet y V c = Set.Iic l₁ ∪ Set.Ici l₂) ∧
      (y 1 ^ 2 - c * V 1 1 = 0 → c < ⟪y, (V⁻¹).toEuclideanLin y⟫ →
        ∃ l, fiellerSet y V c = Set.Iic l ∨ fiellerSet y V c = Set.Ici l) ∧
      (⟪y, (V⁻¹).toEuclideanLin y⟫ ≤ c → fiellerSet y V c = Set.univ) := by
  sorry

end Fieller

end TauCetiRoadmap.QuadraticFormsAndMultivariateTests

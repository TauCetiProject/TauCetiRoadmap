import Mathlib
import TauCeti.Analysis.SpecialFunctions.OwensT

/-!
# Gaussian tails and orthant probabilities: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's theorems
against the pinned Mathlib and Tau Ceti, with the few definitions they need, every theorem with
`sorry` and every definition with a real body.

`Φ` is `cdf (gaussianReal 0 1)` and `φ` is `gaussianPDFReal 0 1`. Gaussian vectors are
Mathlib's `multivariateGaussian 0 C` on `EuclideanSpace ℝ ι` for a positive semidefinite
correlation matrix `C` (unit diagonal); probabilities are `Measure.real`.
-/

open MeasureTheory ProbabilityTheory Set Real

noncomputable section

namespace TauCetiRoadmap.GaussianTailsAndOrthantProbabilities

/-! ## Layer 1: the Mills ratio and the Gaussian hazard rate -/

/-- 1.0. The Mills ratio `R(x) = (1 − Φ(x)) / φ(x)` of the standard normal law. -/
def millsRatio (x : ℝ) : ℝ :=
  (1 - cdf (gaussianReal 0 1) x) / gaussianPDFReal 0 1 x

/-- 1.0. The hazard rate `λ(x) = φ(x) / (1 − Φ(x))` of the standard normal law, the reciprocal
of the Mills ratio. -/
def gaussianHazard (x : ℝ) : ℝ :=
  gaussianPDFReal 0 1 x / (1 - cdf (gaussianReal 0 1) x)

/-- 1.1. The Mills ratio is strictly decreasing and strictly convex on the whole line. -/
theorem millsRatio_strictAnti_and_strictConvexOn :
    StrictAnti millsRatio ∧ StrictConvexOn ℝ univ millsRatio := by
  sorry

/-- 1.2. The Gaussian hazard rate has derivative `λ(x)(λ(x) − x)`, which lies strictly between
`0` and `1` at every real `x`; consequently `1 − Φ` and `Φ` are strictly log-concave. -/
theorem gaussianHazard_hasDerivAt_mem_Ioo_and_logConcave :
    (∀ x : ℝ, HasDerivAt gaussianHazard (gaussianHazard x * (gaussianHazard x - x)) x ∧
      0 < gaussianHazard x * (gaussianHazard x - x) ∧
      gaussianHazard x * (gaussianHazard x - x) < 1) ∧
    StrictConcaveOn ℝ univ (fun x ↦ Real.log (1 - cdf (gaussianReal 0 1) x)) ∧
    StrictConcaveOn ℝ univ (fun x ↦ Real.log (cdf (gaussianReal 0 1) x)) := by
  sorry

/-! ## Layer 2: bivariate normal probabilities -/

/-- 2.0. The `2 × 2` correlation matrix with off-diagonal entry `ρ`; it is positive
semidefinite exactly when `|ρ| ≤ 1`. -/
def corrMatrix2 (ρ : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![1, ρ; ρ, 1]

/-- 2.0. The bivariate standard normal distribution function
`Φ₂(h, k; ρ) = P(X ≤ h, Y ≤ k)` for `(X, Y)` with correlation matrix `corrMatrix2 ρ`. -/
def bivariateNormalCdf (ρ h k : ℝ) : ℝ :=
  (multivariateGaussian 0 (corrMatrix2 ρ)).real {x | x 0 ≤ h ∧ x 1 ≤ k}

/-- 2.0. The bivariate standard normal density with correlation `ρ`, `|ρ| < 1`:
`exp(−(h² − 2ρhk + k²) / (2(1 − ρ²))) / (2π √(1 − ρ²))`. -/
def bivariateNormalPDF (ρ h k : ℝ) : ℝ :=
  Real.exp (-(h ^ 2 - 2 * ρ * h * k + k ^ 2) / (2 * (1 - ρ ^ 2))) /
    (2 * π * √(1 - ρ ^ 2))

/-- 2.1. On the line `k = 0` the bivariate normal distribution function is an Owen's `T`
value: `Φ₂(h, 0; ρ) = Φ(h)/2 − T(h, −ρ/√(1 − ρ²))` for `|ρ| < 1`. -/
theorem bivariateNormalCdf_zero_right_eq_owensT {ρ : ℝ} (hρ : |ρ| < 1) (h : ℝ) :
    bivariateNormalCdf ρ h 0 =
      cdf (gaussianReal 0 1) h / 2 - Real.owensT h (-ρ / √(1 - ρ ^ 2)) := by
  sorry

/-- 2.2. Plackett's identity: for `|ρ| < 1` the derivative of `Φ₂(h, k; ·)` at `ρ` is the
bivariate density at `(h, k)`. -/
theorem hasDerivAt_bivariateNormalCdf {ρ : ℝ} (hρ : |ρ| < 1) (h k : ℝ) :
    HasDerivAt (fun r ↦ bivariateNormalCdf r h k) (bivariateNormalPDF ρ h k) ρ := by
  sorry

/-- 2.3. For fixed `h`, `k`, the map `ρ ↦ Φ₂(h, k; ρ)` is strictly increasing on `[−1, 1]`,
from the lower Fréchet value `max(Φ(h) + Φ(k) − 1, 0)` at `ρ = −1` to the upper Fréchet value
`Φ(min(h, k))` at `ρ = 1`. -/
theorem strictMonoOn_bivariateNormalCdf_and_endpoints (h k : ℝ) :
    StrictMonoOn (fun r ↦ bivariateNormalCdf r h k) (Icc (-1) 1) ∧
      bivariateNormalCdf 1 h k = cdf (gaussianReal 0 1) (min h k) ∧
      bivariateNormalCdf (-1) h k =
        max (cdf (gaussianReal 0 1) h + cdf (gaussianReal 0 1) k - 1) 0 := by
  sorry

/-- 2.4. Sheppard's quadrant formula: for `|ρ| ≤ 1`,
`P(X > 0, Y > 0) = 1/4 + arcsin(ρ)/(2π)`. -/
theorem measureReal_quadrant_multivariateGaussian {ρ : ℝ} (hρ : |ρ| ≤ 1) :
    (multivariateGaussian 0 (corrMatrix2 ρ)).real {x | 0 < x 0 ∧ 0 < x 1} =
      1 / 4 + Real.arcsin ρ / (2 * π) := by
  sorry

/-- 2.5. The trivariate orthant formula: for a positive semidefinite `3 × 3` correlation matrix
`C`, `P(X₀ > 0, X₁ > 0, X₂ > 0) = 1/8 + (arcsin C₀₁ + arcsin C₀₂ + arcsin C₁₂)/(4π)`. -/
theorem measureReal_orthant_multivariateGaussian_fin_three {C : Matrix (Fin 3) (Fin 3) ℝ}
    (hC : C.PosSemidef) (hdiag : ∀ i, C i i = 1) :
    (multivariateGaussian 0 C).real {x | ∀ i, 0 < x i} =
      1 / 8 + (Real.arcsin (C 0 1) + Real.arcsin (C 0 2) + Real.arcsin (C 1 2)) / (4 * π) := by
  sorry

/-- 2.6. The equicorrelated orthant with correlation `1/2`: for every `n`, a centred Gaussian
vector of `ℝⁿ` with unit variances and all correlations `1/2` has all coordinates positive with
probability `1/(n + 1)`. -/
theorem measureReal_orthant_multivariateGaussian_equicorr_half (n : ℕ) :
    (multivariateGaussian 0
        (fun i j : Fin n ↦ if i = j then (1 : ℝ) else 1 / 2)).real {x | ∀ i, 0 < x i} =
      1 / ((n : ℝ) + 1) := by
  sorry

end TauCetiRoadmap.GaussianTailsAndOrthantProbabilities

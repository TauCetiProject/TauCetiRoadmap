import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.InternalEnergy.Basic
import TauCeti.Probability.Distributions.Gaussian.Density
import TauCeti.Probability.Moments.Covariance

/-!
# Differential entropy and the entropy power inequality: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here: the affine change of variables (1.2), the divergence from
a Gaussian and the Gaussian maximum entropy (1.3), the monotonicity under convolution (1.4), de
Bruijn's identity (2.2), the two ends of the heat flow (2.3), the weighted and the reciprocal forms
of Stam's inequality for smoothed laws (3.2, 3.3), Lieb's form (4.1) and the entropy power
inequality (4.2). The lemmas recorded in 2.1 and 3.1 of the README, its API lists and its Checks
are not restated.

Laws are probability measures on `EuclideanSpace ℝ (Fin d)`. The differential entropy is the
negative of Tau Ceti's signed Boltzmann entropy against Lebesgue measure, an extended real that is
`⊥` for a law without a density. The law of `X + √t Z` is `μ ∗ multivariateGaussian 0 (t • 1)`,
whose density is `smoothedDensity μ 1 √t`, the definition of DenoisingDiffusion 3.1 copied with
the same body because a roadmap's Lean file does not import another roadmap.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Real TauCeti.Probability
open scoped ENNReal NNReal Gradient RealInnerProductSpace

namespace TauCetiRoadmap.DifferentialEntropyAndEntropyPower

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-! ## Layer 1: differential entropy and the Gaussian maximum -/

/-- 1.1 The differential entropy `h(μ) = −D(μ ‖ Lebesgue)`, the negative of Tau Ceti's signed
Boltzmann entropy against `volume`; it is `⊥` when `μ` has no density. -/
def differentialEntropy (μ : Measure E) : EReal :=
  -TauCeti.boltzmannEntropy volume μ

/-- 1.2 Affine change of variables: for every law `μ`, every invertible linear map `A` and every
`b`, the image of `μ` under `x ↦ A x + b` has differential entropy `h(μ) + log |det A|`, in `EReal`
(infinite values included). -/
theorem differentialEntropy_map_affine (μ : Measure E) [IsProbabilityMeasure μ] (A : E ≃L[ℝ] E)
    (b : E) :
    differentialEntropy (μ.map fun x ↦ A x + b) =
      differentialEntropy μ + ((Real.log |LinearMap.det (A : E →ₗ[ℝ] E)| : ℝ) : EReal) :=
  sorry

/-- 1.3 The divergence of a law with a finite second moment from an arbitrary nondegenerate
Gaussian law, in `EReal`. -/
theorem klDiv_multivariateGaussian (μ : Measure E) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ) (m : E) {S : Matrix (Fin d) (Fin d) ℝ}
    (hS : S.PosDef) :
    (klDiv μ (multivariateGaussian m S) : EReal) =
      ((Real.log ((2 * π) ^ d * S.det) / 2 +
          (∫ x, ⟪x - m, S⁻¹.toEuclideanLin (x - m)⟫ ∂μ) / 2 : ℝ) : EReal) -
        differentialEntropy μ :=
  sorry

/-- 1.3 The Gaussian maximum entropy: a law with a finite second moment and a positive definite
covariance matrix `Σ` (Tau Ceti's `TauCeti.covMatrix`) has `h(μ) ≤ (1/2) log((2πe)^d det Σ)`,
with equality exactly for the Gaussian law with the same mean and covariance. -/
theorem differentialEntropy_le_of_covMatrix (μ : Measure E) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ) (hC : (TauCeti.covMatrix μ).PosDef) :
    differentialEntropy μ ≤
        ((Real.log ((2 * π * exp 1) ^ d * (TauCeti.covMatrix μ).det) / 2 : ℝ) : EReal) ∧
      (differentialEntropy μ =
          ((Real.log ((2 * π * exp 1) ^ d * (TauCeti.covMatrix μ).det) / 2 : ℝ) : EReal) ↔
        μ = multivariateGaussian (∫ x, x ∂μ) (TauCeti.covMatrix μ)) :=
  sorry

/-- 1.4 Adding an independent variable does not decrease the differential entropy: for laws with
finite second moments, `max(h(μ), h(ν)) ≤ h(μ ∗ ν)`. -/
theorem differentialEntropy_le_conv (μ ν : Measure E) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ)
    (hν : Integrable (fun x ↦ ‖x‖ ^ 2) ν) :
    max (differentialEntropy μ) (differentialEntropy ν) ≤ differentialEntropy (μ ∗ ν) :=
  sorry

/-! ## Layer 2: Fisher information and the heat flow -/

/-- 2.1 The density of `c • X + s • Z` for `X ~ μ₀` and an independent standard Gaussian `Z`;
the definition of DenoisingDiffusion 3.1, with the same body. -/
def smoothedDensity (μ₀ : Measure E) (c s : ℝ) (y : E) : ℝ :=
  ∫ x, multivariateGaussianPDFReal 0 ((s ^ 2) • (1 : Matrix (Fin d) (Fin d) ℝ)) (y - c • x) ∂μ₀

/-- 2.1 The Fisher information `∫ ‖∇p‖² / p` of a density, in `[0, ∞]`; it is meant for positive
differentiable densities and is applied here to smoothed densities only. -/
def fisherInformation (p : E → ℝ) : ℝ≥0∞ :=
  ∫⁻ y, ENNReal.ofReal (‖∇ p y‖ ^ 2 / p y)

/-- 2.2 De Bruijn's identity: for a law with a finite second moment and `t > 0`, the entropy of
`X + √u Z` has derivative half the Fisher information of `X + √t Z` at `u = t`. -/
theorem hasDerivAt_differentialEntropy_conv (μ : Measure E) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ) {t : ℝ} (ht : 0 < t) :
    HasDerivAt
      (fun u : ℝ ↦ (differentialEntropy (μ ∗ multivariateGaussian 0 (u • 1))).toReal)
      ((fisherInformation (smoothedDensity μ 1 √t)).toReal / 2) t :=
  sorry

/-- 2.3 Small times: for a law with a finite second moment, `h(X + √t Z) → h(X)` in `EReal` as
`t → 0⁺`, including when `h(X) = ⊥`. -/
theorem tendsto_differentialEntropy_conv_nhdsGT_zero (μ : Measure E) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ) :
    Filter.Tendsto (fun t : ℝ ↦ differentialEntropy (μ ∗ multivariateGaussian 0 (t • 1)))
      (nhdsWithin 0 (Set.Ioi 0)) (nhds (differentialEntropy μ)) :=
  sorry

/-- 2.3 Large times: for a law with a finite second moment,
`h(X + √t Z) − (d/2) log(2πe t) → 0` as `t → ∞`. -/
theorem tendsto_differentialEntropy_conv_sub_atTop (μ : Measure E) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ) :
    Filter.Tendsto
      (fun t : ℝ ↦ (differentialEntropy (μ ∗ multivariateGaussian 0 (t • 1))).toReal -
        d / 2 * Real.log (2 * π * exp 1 * t))
      Filter.atTop (nhds 0) :=
  sorry

/-! ## Layer 3: Stam's Fisher information inequality -/

/-- 3.2 The weighted Fisher information inequality for smoothed laws:
`J(X_s + Y_u) ≤ λ² J(X_s) + (1 − λ)² J(Y_u)` for `λ ∈ [0, 1]`. -/
theorem fisherInformation_conv_le (μ ν : Measure E) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] {s u : ℝ} (hs : 0 < s) (hu : 0 < u) {l : ℝ} (hl₀ : 0 ≤ l)
    (hl₁ : l ≤ 1) :
    fisherInformation (smoothedDensity (μ ∗ ν) 1 √(s + u)) ≤
      ENNReal.ofReal (l ^ 2) * fisherInformation (smoothedDensity μ 1 √s) +
        ENNReal.ofReal ((1 - l) ^ 2) * fisherInformation (smoothedDensity ν 1 √u) :=
  sorry

/-- 3.3 Stam's inequality for smoothed laws: `1/J(X_s) + 1/J(Y_u) ≤ 1/J(X_s + Y_u)`. -/
theorem inv_fisherInformation_add_le (μ ν : Measure E) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] {s u : ℝ} (hs : 0 < s) (hu : 0 < u) :
    (fisherInformation (smoothedDensity μ 1 √s))⁻¹ +
        (fisherInformation (smoothedDensity ν 1 √u))⁻¹ ≤
      (fisherInformation (smoothedDensity (μ ∗ ν) 1 √(s + u)))⁻¹ :=
  sorry

/-! ## Layer 4: the entropy power inequality -/

/-- 4.1 The entropy power `exp(2 h(μ)/d)/(2πe)`, which is `0` when `h(μ) = ⊥`. -/
def entropyPower (μ : Measure E) : ℝ≥0∞ :=
  EReal.exp (((2 / d : ℝ) : EReal) * differentialEntropy μ) / ENNReal.ofReal (2 * π * exp 1)

/-- 4.1 Lieb's form of the entropy power inequality: for laws with finite second moments and
`λ ∈ [0, 1]`, `h(√λ X + √(1 − λ) Y) ≥ λ h(X) + (1 − λ) h(Y)` in `EReal`. -/
theorem le_differentialEntropy_conv_map_sqrt (μ ν : Measure E) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ)
    (hν : Integrable (fun x ↦ ‖x‖ ^ 2) ν) {l : ℝ} (hl₀ : 0 ≤ l) (hl₁ : l ≤ 1) :
    ((l : ℝ) : EReal) * differentialEntropy μ + ((1 - l : ℝ) : EReal) * differentialEntropy ν ≤
      differentialEntropy ((μ.map fun x ↦ √l • x) ∗ (ν.map fun x ↦ √(1 - l) • x)) :=
  sorry

/-- 4.2 The entropy power inequality: for `d ≥ 1` and laws with finite second moments,
`N(μ) + N(ν) ≤ N(μ ∗ ν)`. -/
theorem entropyPower_add_le (hd : 0 < d) (μ ν : Measure E) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ)
    (hν : Integrable (fun x ↦ ‖x‖ ^ 2) ν) :
    entropyPower μ + entropyPower ν ≤ entropyPower (μ ∗ ν) :=
  sorry

end TauCetiRoadmap.DifferentialEntropyAndEntropyPower

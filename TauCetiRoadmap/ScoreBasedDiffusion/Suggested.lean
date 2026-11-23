import Mathlib
import TauCeti.Probability.Distributions.Gaussian.Density

/-!
# Score-based diffusion in continuous time: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here: the Fokker–Planck equation of a noising path and its
variance-preserving case (1.2), the pointwise Tweedie formulas (2.1), the score bounds for data
in a ball (2.2) and the generator of the reversed path (3.2), with the composition law of
Gaussian kernels (1.1) on which the two-time laws rest. The README's remaining targets, API lists
and Checks are not restated.

The definitions `gaussianKernel`, `smoothedDensity` and `noisyScore` restate, on the same
native carriers and with identical bodies, the definitions of the same names of
DenoisingDiffusion 1.2 and 3.1, which owns them, so that the headlines can be stated here
without importing another roadmap.

Suppliers used by the README and not restated here: DenoisingDiffusion 2.1 (`noiseKernel_apply`,
`noiseKernel_comp`), 2.2 (`klDiv_forwardMarginal_le`), 2.3 (`ddpm_posterior`), 3.1
(`hasLaw_smoothedDensity`), 3.2 (`tweedie`), 3.3 (`memLp_noisyScore`, `dsm_eq_esm_add`), 4.1
(`forwardPath_reverse`) and 4.2 (`forwardPath_map_posterior`); Tau Ceti
`multivariateGaussian_conv_multivariateGaussian`, `map_affine_multivariateGaussian`,
`multivariateGaussian_eq_withDensity`, `TauCeti.heatKernel`, `TauCeti.contDiff_heatKernel`,
`TauCeti.hasDerivAt_heatKernel`, `TauCeti.laplacian_heatKernel`,
`TauCeti.exists_norm_iteratedDeriv_iteratedFDeriv_heatKernel_le`,
`TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp`,
`TauCeti.contDiff_heatKernel_convolution`, `TauCeti.hasDerivAt_heatKernel_convolution`,
`TauCeti.wassersteinEDist`, `TauCeti.wassersteinEDist_le`, `TauCeti.IsCoupling`,
`stdGaussian_map_norm_sq` and `integral_id_chiSquaredMeasure`; Mathlib
`hasFDerivAt_integral_of_dominated_of_fderiv_le`, `HasFDerivAt.comp_hasDerivAt`,
`intervalIntegral.integral_hasDerivAt_right`,
`integral_bilinear_hasLineDerivAt_right_eq_neg_left_of_integrable`,
`Measure.integral_compProd`, `Measure.fst_compProd`, `Measure.snd_compProd`,
`lipschitzWith_of_nnnorm_fderiv_le`, `lintegral_add_left` and
`Measurable.lintegral_prod_right'`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Real TauCeti.Probability InnerProductSpace Laplacian
open scoped ENNReal NNReal Gradient RealInnerProductSpace

namespace TauCetiRoadmap.ScoreBasedDiffusion

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-! ## Layer 1: Gaussian noising paths and their Fokker–Planck equation -/

/-- 1.1: the Gaussian observation kernel `x ↦ N(c • x, v)` of DenoisingDiffusion 1.2. -/
def gaussianKernel (c v : ℝ) : Kernel E E :=
  (Kernel.id ×ₖ Kernel.const E (multivariateGaussian 0 (v • 1))).map (fun p ↦ c • p.1 + p.2)

/-- 1.1: Gaussian observation kernels compose: observing `N(c • x, v)` and then `N(c' • y, v')`
is observing `N((c' * c) • x, c' ^ 2 * v + v')`. -/
theorem gaussianKernel_comp {c v c' v' : ℝ} (hv : 0 ≤ v) (hv' : 0 ≤ v') :
    gaussianKernel (d := d) c' v' ∘ₖ gaussianKernel c v =
      gaussianKernel (c' * c) (c' ^ 2 * v + v') :=
  sorry

/-- 1.2: the density of `c • X + s • Z` for `X ~ μ₀` and an independent standard Gaussian `Z`, as
in DenoisingDiffusion 3.1. -/
def smoothedDensity (μ₀ : Measure E) (c s : ℝ) (y : E) : ℝ :=
  ∫ x, multivariateGaussianPDFReal 0 ((s ^ 2) • (1 : Matrix (Fin d) (Fin d) ℝ)) (y - c • x) ∂μ₀

/-- 1.2: the Fokker–Planck equation along a noising path. If `c` and `s` are differentiable at
`t` with `c t ≠ 0` and `s t > 0`, the density at level `(c r, s r)` is differentiable in `r` at
`t`, with derivative `-(c'/c) ∇·(y p) + (s s' - s² c'/c) Δ p`, where
`∇·(y p) = d p + ⟪y, ∇ p⟫`. No moment of `μ₀` is assumed. -/
theorem hasDerivAt_smoothedDensity_path (μ₀ : Measure E) [IsFiniteMeasure μ₀] {c s : ℝ → ℝ}
    {c' s' t : ℝ} (hc : HasDerivAt c c' t) (hs : HasDerivAt s s' t) (hc0 : c t ≠ 0)
    (hs0 : 0 < s t) (y : E) :
    HasDerivAt (fun r ↦ smoothedDensity μ₀ (c r) (s r) y)
      (-(c' / c t) * (d * smoothedDensity μ₀ (c t) (s t) y +
          ⟪y, ∇ (smoothedDensity μ₀ (c t) (s t)) y⟫_ℝ) +
        (s t * s' - s t ^ 2 * c' / c t) * Δ (smoothedDensity μ₀ (c t) (s t)) y) t :=
  sorry

/-- 1.2: the signal level `α t = exp (-(1/2) ∫₀ᵗ β)` of the variance-preserving path. -/
def vpSignal (β : ℝ → ℝ) (t : ℝ) : ℝ := Real.exp (-(1 / 2) * ∫ r in (0 : ℝ)..t, β r)

/-- 1.2: the noise level `σ t = √(1 - α t ^ 2)` of the variance-preserving path. -/
def vpNoise (β : ℝ → ℝ) (t : ℝ) : ℝ := √(1 - vpSignal β t ^ 2)

/-- 1.2: the variance-preserving Fokker–Planck equation `∂ₜ p = (β/2) (∇·(y p) + Δ p)`, for a
continuous `β`, at every time with `∫₀ᵗ β > 0` and every point. -/
theorem hasDerivAt_smoothedDensity_vp (μ₀ : Measure E) [IsFiniteMeasure μ₀] {β : ℝ → ℝ}
    (hβ : Continuous β) {t : ℝ} (ht : 0 < ∫ r in (0 : ℝ)..t, β r) (y : E) :
    HasDerivAt (fun r ↦ smoothedDensity μ₀ (vpSignal β r) (vpNoise β r) y)
      (β t / 2 * (d * smoothedDensity μ₀ (vpSignal β t) (vpNoise β t) y +
        ⟪y, ∇ (smoothedDensity μ₀ (vpSignal β t) (vpNoise β t)) y⟫_ℝ +
        Δ (smoothedDensity μ₀ (vpSignal β t) (vpNoise β t)) y)) t :=
  sorry

/-! ## Layer 2: the score along the path -/

/-- 2.1: the score of the law at level `(c, s)`, as in DenoisingDiffusion 3.1. -/
def noisyScore (μ₀ : Measure E) (c s : ℝ) (y : E) : E :=
  ∇ (fun z ↦ Real.log (smoothedDensity μ₀ c s z)) y

/-- 2.1: the denoiser, the mean of the posterior law of `X` given `c • X + s • Z = y`. -/
def denoiser (μ₀ : Measure E) (c s : ℝ) (y : E) : E :=
  (smoothedDensity μ₀ c s y)⁻¹ •
    ∫ x, multivariateGaussianPDFReal 0 ((s ^ 2) • (1 : Matrix (Fin d) (Fin d) ℝ)) (y - c • x) • x
      ∂μ₀

/-- 2.1: the covariance operator of the posterior law of `X` given `c • X + s • Z = y`. -/
def posteriorCov (μ₀ : Measure E) (c s : ℝ) (y : E) : E →L[ℝ] E :=
  (smoothedDensity μ₀ c s y)⁻¹ •
    ∫ x, multivariateGaussianPDFReal 0 ((s ^ 2) • (1 : Matrix (Fin d) (Fin d) ℝ)) (y - c • x) •
      (innerSL ℝ (x - denoiser μ₀ c s y)).smulRight (x - denoiser μ₀ c s y) ∂μ₀

/-- 2.1: Tweedie's formula at every point, for every data law and every `c`. -/
theorem noisyScore_eq_denoiser (μ₀ : Measure E) [IsProbabilityMeasure μ₀] (c : ℝ) {s : ℝ}
    (hs : 0 < s) (y : E) :
    noisyScore μ₀ c s y = (s ^ 2)⁻¹ • (c • denoiser μ₀ c s y - y) :=
  sorry

/-- 2.1: the derivative of the score is `s⁻² ((c²/s²) Cov - 1)` at every point, for every data
law and every `c`. -/
theorem hasFDerivAt_noisyScore (μ₀ : Measure E) [IsProbabilityMeasure μ₀] (c : ℝ) {s : ℝ}
    (hs : 0 < s) (y : E) :
    HasFDerivAt (noisyScore μ₀ c s)
      ((s ^ 2)⁻¹ • ((c ^ 2 / s ^ 2) • posteriorCov μ₀ c s y - ContinuousLinearMap.id ℝ E)) y :=
  sorry

/-- 2.2: for data in the closed ball of radius `R`, the score grows at most linearly. -/
theorem norm_noisyScore_le (μ₀ : Measure E) [IsProbabilityMeasure μ₀] (c : ℝ) {s R : ℝ}
    (hs : 0 < s) (hR : ∀ᵐ x ∂μ₀, ‖x‖ ≤ R) (y : E) :
    ‖noisyScore μ₀ c s y‖ ≤ (‖y‖ + |c| * R) / s ^ 2 :=
  sorry

/-- 2.2: for data in the closed ball of radius `R`, the derivative of the score is at most
`c² R² / s⁴ - 1 / s²` as a quadratic form. -/
theorem inner_fderiv_noisyScore_le (μ₀ : Measure E) [IsProbabilityMeasure μ₀] (c : ℝ) {s R : ℝ}
    (hs : 0 < s) (hR : ∀ᵐ x ∂μ₀, ‖x‖ ≤ R) (y v : E) :
    ⟪fderiv ℝ (noisyScore μ₀ c s) y v, v⟫_ℝ ≤ (c ^ 2 * R ^ 2 / s ^ 4 - 1 / s ^ 2) * ‖v‖ ^ 2 :=
  sorry

/-! ## Layer 3: time reversal -/

/-- 3.1: the joint law of the path at two levels: the law at level `(c₁, s₁)` followed by the
Gaussian transition kernel to level `(c₂, s₂)`. -/
def twoTimeLaw (μ₀ : Measure E) (c₁ s₁ c₂ s₂ : ℝ) : Measure (E × E) :=
  (μ₀.bind (gaussianKernel c₁ (s₁ ^ 2))) ⊗ₘ
    gaussianKernel (c₂ / c₁) (s₂ ^ 2 - (c₂ / c₁) ^ 2 * s₁ ^ 2)

/-- 3.2: the generator of the reversed path at level `(c, s)`, with drift coefficient `a` and
diffusion coefficient `G`: `A f = ⟪-a • x + G • ∇ log p, ∇ f⟫ + (G/2) Δ f`. -/
def reverseGenerator (μ₀ : Measure E) (c s a G : ℝ) (f : E → ℝ) (x : E) : ℝ :=
  ⟪(-a) • x + G • noisyScore μ₀ c s x, ∇ f x⟫_ℝ + G / 2 * Δ f x

/-- 3.2: time reversal. For a second level `(c₂, s₂)` held fixed, the two-time expectation
`E[f(X_r) g(X_t)]` is differentiable in the earlier time, with derivative
`-E[(A f)(X_r) g(X_t)]`, where `A` is the generator of the reverse-time equation. -/
theorem hasDerivAt_integral_twoTimeLaw (μ₀ : Measure E) [IsProbabilityMeasure μ₀] {c s : ℝ → ℝ}
    {c' s' r c₂ s₂ : ℝ} (hc : HasDerivAt c c' r) (hs : HasDerivAt s s' r) (hc0 : c r ≠ 0)
    (hs0 : 0 < s r) (hv : (c₂ / c r) ^ 2 * s r ^ 2 < s₂ ^ 2) {f g : E → ℝ}
    (hf : ContDiff ℝ 2 f) (hfc : HasCompactSupport f) (hg : Measurable g)
    (hgb : ∃ C, ∀ y, |g y| ≤ C) :
    HasDerivAt (fun u ↦ ∫ z, f z.1 * g z.2 ∂(twoTimeLaw μ₀ (c u) (s u) c₂ s₂))
      (-∫ z, reverseGenerator μ₀ (c r) (s r) (c' / c r)
          (2 * (s r * s' - s r ^ 2 * c' / c r)) f z.1 * g z.2
        ∂(twoTimeLaw μ₀ (c r) (s r) c₂ s₂)) r :=
  sorry

end TauCetiRoadmap.ScoreBasedDiffusion

import Mathlib
import TauCeti.Analysis.Bochner.BochnerTheorem

/-!
# Power spectra and the Wiener–Khinchin theorem: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

A process is a family `X : ℝ → E` in a complex inner product space. Its spectral measure is Tau
Ceti's Bochner measure `TauCeti.bochnerMeasure` of `τ ↦ autocov X (-τ)`, so that
`autocov X τ = ∫ exp (2πiτξ) dμ(ξ)` in ordinary frequency; Bochner's theorem itself is Tau Ceti's
and is not restated. Mathlib's Fourier transform is `𝓕 h ξ = ∫ exp (-2πisξ) h s ds`.
-/

open MeasureTheory Filter Topology Complex Real
open scoped FourierTransform InnerProductSpace ENNReal NNReal BoundedContinuousFunction

namespace TauCetiRoadmap.PowerSpectraAndWienerKhinchin

/-! ## Layer 1: the spectral measure and the spectral isometry -/

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

/-- 1.0 Second-order stationarity of `X : ℝ → E`: `⟪X s, X t⟫` depends only on `t - s`. -/
def IsSecondOrderStationary (X : ℝ → E) : Prop :=
  ∀ s t : ℝ, ⟪X s, X t⟫_ℂ = ⟪X 0, X (t - s)⟫_ℂ

/-- 1.0 The autocovariance `τ ↦ ⟪X 0, X τ⟫` of a family `X : ℝ → E`. -/
noncomputable def autocov (X : ℝ → E) (τ : ℝ) : ℂ :=
  ⟪X 0, X τ⟫_ℂ

/-- 1.0 The spectral measure of `X`: the Bochner measure of `τ ↦ autocov X (-τ)`, which is the
zero measure when that function is not continuous and positive definite. -/
noncomputable def spectralMeasure (X : ℝ → E) : Measure ℝ :=
  TauCeti.bochnerMeasure fun τ => autocov X (-τ)

/-- 1.1 The spectral isometry: a linear isometry from `L²` of the spectral measure into `E`
sending the exponential `ξ ↦ exp (2πitξ)` to `X t`, with range the closed span of the family. -/
theorem exists_linearIsometry [CompleteSpace E] {X : ℝ → E} (hX : IsSecondOrderStationary X)
    (hc : ContinuousAt X 0) :
    ∃ U : Lp ℂ 2 (spectralMeasure X) →ₗᵢ[ℂ] E,
      (∀ (t : ℝ) (f : Lp ℂ 2 (spectralMeasure X)),
        (f : ℝ → ℂ) =ᵐ[spectralMeasure X] (fun ξ => Complex.exp (2 * π * ξ * t * I)) →
          U f = X t) ∧
      LinearMap.range U.toLinearMap = (Submodule.span ℂ (Set.range X)).topologicalClosure := by
  sorry

/-! ## Layer 2: periodograms, spectral densities and atoms -/

/-- 2.0 The periodogram `‖∫₀ᵀ exp (-2πiξt) X t dt‖² / T` of `X` at time `T` and frequency `ξ`. -/
noncomputable def periodogram (X : ℝ → E) (T ξ : ℝ) : ℝ :=
  ‖∫ t in (0 : ℝ)..T, Complex.exp (-(2 * π * ξ * t * I)) • X t‖ ^ 2 / T

/-- 2.1 The periodogram converges weakly to the spectral measure. -/
theorem tendsto_integral_mul_periodogram [CompleteSpace E] {X : ℝ → E}
    (hX : IsSecondOrderStationary X) (hc : ContinuousAt X 0) (g : ℝ →ᵇ ℝ) :
    Tendsto (fun T => ∫ ξ, g ξ * periodogram X T ξ) atTop
      (𝓝 (∫ ξ, g ξ ∂(spectralMeasure X))) := by
  sorry

/-- 2.2 Wiener–Khinchin: for an integrable autocovariance the spectral measure has density
`𝓕 (autocov X)`, and the periodogram converges to it at every frequency. -/
theorem spectralMeasure_eq_withDensity_fourier [CompleteSpace E] {X : ℝ → E}
    (hX : IsSecondOrderStationary X) (hc : ContinuousAt X 0) (hint : Integrable (autocov X)) :
    spectralMeasure X = volume.withDensity (fun ξ => ENNReal.ofReal (𝓕 (autocov X) ξ).re) ∧
      ∀ ξ : ℝ, Tendsto (fun T => (periodogram X T ξ : ℂ)) atTop (𝓝 (𝓕 (autocov X) ξ)) := by
  sorry

/-- 2.3 Atoms: the averages `T⁻¹ ∫₀ᵀ exp (-2πiνt) X t dt` converge to a vector of squared norm
`μ {ν}`, and the corresponding averages of the autocovariance converge to `μ {ν}`. -/
theorem tendsto_average_of_atom [CompleteSpace E] {X : ℝ → E}
    (hX : IsSecondOrderStationary X) (hc : ContinuousAt X 0) (ν : ℝ) :
    (∃ Z : E, Tendsto (fun T : ℝ =>
        T⁻¹ • ∫ t in (0 : ℝ)..T, Complex.exp (-(2 * π * ν * t * I)) • X t) atTop (𝓝 Z) ∧
      ‖Z‖ ^ 2 = (spectralMeasure X).real {ν}) ∧
    Tendsto (fun T : ℝ =>
        (T : ℂ)⁻¹ * ∫ t in (0 : ℝ)..T, Complex.exp (-(2 * π * ν * t * I)) * autocov X t)
      atTop (𝓝 ((spectralMeasure X).real {ν} : ℂ)) := by
  sorry

/-! ## Layer 3: linear filters and mean-square derivatives -/

/-- 3.1 A linear time-invariant filter with integrable impulse response `h` multiplies the
spectral measure by `‖𝓕 h‖²`; the output is stationary and continuous, with the stated
cross-covariance. -/
theorem filter_spectralMeasure [CompleteSpace E] {X Y : ℝ → E}
    (hX : IsSecondOrderStationary X) (hc : ContinuousAt X 0) {h : ℝ → ℂ} (hh : Integrable h)
    (hY : ∀ t, Y t = ∫ s, h s • X (t - s)) :
    IsSecondOrderStationary Y ∧ Continuous Y ∧
      spectralMeasure Y = (spectralMeasure X).withDensity (fun ξ => (‖𝓕 h ξ‖₊ : ℝ≥0∞) ^ 2) ∧
      ∀ s t : ℝ, ⟪X s, Y t⟫_ℂ =
        ∫ ξ, 𝓕 h ξ * Complex.exp (2 * π * ξ * (t - s) * I) ∂(spectralMeasure X) := by
  sorry

/-- 3.2 Mean-square differentiability holds exactly when the second spectral moment is finite. -/
theorem exists_hasDerivAt_iff [CompleteSpace E] {X : ℝ → E} (hX : IsSecondOrderStationary X)
    (hc : ContinuousAt X 0) :
    (∃ X' : ℝ → E, ∀ t, HasDerivAt X (X' t) t) ↔
      Integrable (fun ξ : ℝ => ξ ^ 2) (spectralMeasure X) := by
  sorry

/-- 3.3 The derivative of a differentiable stationary family is stationary and continuous, with
spectral measure `(2πξ)² μ` and the stated cross-covariance. -/
theorem spectralMeasure_deriv {X X' : ℝ → E} (hX : IsSecondOrderStationary X)
    (hd : ∀ t, HasDerivAt X (X' t) t) :
    IsSecondOrderStationary X' ∧ Continuous X' ∧
      spectralMeasure X' =
        (spectralMeasure X).withDensity (fun ξ => ENNReal.ofReal ((2 * π * ξ) ^ 2)) ∧
      ∀ s t : ℝ, ⟪X s, X' t⟫_ℂ =
        ∫ ξ, 2 * π * ξ * I * Complex.exp (2 * π * ξ * (t - s) * I) ∂(spectralMeasure X) := by
  sorry

/-! ## Layer 4: band-limited processes -/

/-- 4.1 The sampling theorem: if the spectral measure is carried by `(-W, W)`, the sampling sums
with spacing `1 / (2W)` converge to `X t` in norm. -/
theorem tendsto_sum_sinc {X : ℝ → E} (hX : IsSecondOrderStationary X)
    (hc : ContinuousAt X 0) {W : ℝ} (hW : 0 < W)
    (hband : spectralMeasure X (Set.Ioo (-W) W)ᶜ = 0) (α t : ℝ) :
    Tendsto (fun N : ℕ => ∑ k ∈ Finset.Icc (-(N : ℤ)) N,
        (Real.sinc (π * (2 * W * (t - α) - k)) : ℂ) • X (α + k / (2 * W))) atTop
      (𝓝 (X t)) := by
  sorry

end TauCetiRoadmap.PowerSpectraAndWienerKhinchin

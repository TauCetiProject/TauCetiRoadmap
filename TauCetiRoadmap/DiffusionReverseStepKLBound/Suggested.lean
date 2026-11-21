import Mathlib
import TauCeti.Probability.Distributions.Gaussian.Density

/-!
# Kullback–Leibler bound for one reverse step of a diffusion model: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here: the three Gaussian facts of Layer 1 and the one-step
bound 2.1.

The definitions `noiseKernel`, `alphaBar`, `forwardMarginal`, `smoothedDensity`, `noisyScore` and
`epsModelKernel` are copied verbatim from DenoisingDiffusion (Layers 2 to 4), which owns them.
`LogSobolevInequality` and `relativeFisherInformation` are copied verbatim from
LogConcaveFunctionalInequalities 1.2 and 1.3, which owns them. They are restated here, with
identical bodies, only so that the headlines can be stated without importing another roadmap.
Owned here: `scoreLip` and `scoreNoise`.

Suppliers used by the README and not restated here: DenoisingDiffusion 1.2 (`gaussianKernel`),
2.1 (`noiseKernel_apply`) and 4.3 (`posteriorLoss_minimizer`); ScoreBasedDiffusion 2.1
(`hasFDerivAt_noisyScore`), 2.2 (the Lipschitz constant of the score) and 3.1 (`twoTimeLaw`,
Bayes' formula and the moments of the backward kernel); LogConcaveFunctionalInequalities 1.1 (the
Gibbs law) and 2.3 (`logSobolevInequality_gibbsMeasure`); MathematicalStatisticsNonparametric 1.3
(`klDiv_multivariateGaussian`); Tau Ceti `TauCeti.klDiv_compProd_right`,
`TauCeti.klDiv_eq_klDiv_add_klDiv`, `TauCeti.klDiv_tilted_eq_boltzmannEntropy`,
`TauCeti.klDiv_eq_boltzmannEntropy_of_measure_univ_eq`,
`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.multivariateGaussianPDFReal_def`,
`TauCeti.Probability.map_affine_multivariateGaussian`,
`TauCeti.Probability.stdGaussian_map_norm_sq` and
`TauCeti.Probability.integral_id_chiSquaredMeasure`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Real TauCeti.Probability Finset
open scoped ENNReal NNReal Gradient

namespace TauCetiRoadmap.DiffusionReverseStepKLBound

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-! ## Definitions copied from DenoisingDiffusion and LogConcaveFunctionalInequalities -/

/-- Conventions: the noising kernel `x ↦ N(√a • x, 1 - a)` (copied verbatim from
DenoisingDiffusion 2.1). -/
def noiseKernel (a : ℝ) : Kernel E E :=
  (Kernel.id ×ₖ Kernel.const E (stdGaussian E)).map (fun p ↦ √a • p.1 + √(1 - a) • p.2)

/-- Conventions: the cumulative signal level `ᾱ t = ∏_{s=1}^t (1 - β s)` (copied verbatim from
DenoisingDiffusion 2.2). -/
def alphaBar (β : ℕ → ℝ) (t : ℕ) : ℝ := ∏ s ∈ Icc 1 t, (1 - β s)

/-- Conventions: the marginal `q_t` of the forward chain (copied verbatim from
DenoisingDiffusion 2.2). -/
def forwardMarginal (μ₀ : Measure E) (β : ℕ → ℝ) (t : ℕ) : Measure E :=
  μ₀.bind (noiseKernel (alphaBar β t))

/-- Conventions: the density of `c • X + s • Z` (copied verbatim from DenoisingDiffusion 3.1). -/
def smoothedDensity (μ₀ : Measure E) (c s : ℝ) (y : E) : ℝ :=
  ∫ x, multivariateGaussianPDFReal 0 ((s ^ 2) • (1 : Matrix (Fin d) (Fin d) ℝ)) (y - c • x) ∂μ₀

/-- Conventions: the score of the smoothed law (copied verbatim from DenoisingDiffusion 3.1). -/
def noisyScore (μ₀ : Measure E) (c s : ℝ) (y : E) : E :=
  ∇ (fun z ↦ Real.log (smoothedDensity μ₀ c s z)) y

/-- Conventions: the model kernel `x ↦ N((1/√α t)(x - (β t/√(1 - ᾱ t)) ε̂ x), σ²)` (copied
verbatim from DenoisingDiffusion 4.3). -/
def epsModelKernel (β : ℕ → ℝ) (t : ℕ) (σ : ℝ) (εhat : E → E) : Kernel E E :=
  (Kernel.id ×ₖ Kernel.const E (multivariateGaussian 0 ((σ ^ 2) • 1))).map
    (fun p ↦ (1 / √(1 - β t)) • (p.1 - (β t / √(1 - alphaBar β t)) • εhat p.1) + p.2)

/-- Conventions: the logarithmic Sobolev inequality with constant `C` for test functions
(copied verbatim from LogConcaveFunctionalInequalities 1.2). -/
def LogSobolevInequality (μ : Measure E) (C : ℝ) : Prop :=
  ∀ f : E → ℝ, ContDiff ℝ 1 f → (∃ M, ∀ x, |f x| ≤ M) → (∃ M, ∀ x, ‖∇ f x‖ ≤ M) →
    ∫ x, f x ^ 2 * Real.log (f x ^ 2) ∂μ -
        (∫ x, f x ^ 2 ∂μ) * Real.log (∫ x, f x ^ 2 ∂μ) ≤
      2 * C * ∫ x, ‖∇ f x‖ ^ 2 ∂μ

/-- Conventions: the relative Fisher information `I(h μ ‖ μ)` (copied verbatim from
LogConcaveFunctionalInequalities 1.3). -/
def relativeFisherInformation (μ : Measure E) (h : E → ℝ) : ℝ≥0∞ :=
  ∫⁻ x, ENNReal.ofReal (‖∇ h x‖ ^ 2 / h x) ∂μ

/-! ## Layer 1: three Gaussian facts -/

/-- 1.1 A logarithmic Sobolev inequality with constant `C` gives `KL(h μ ‖ μ) ≤ (C/2) I(h μ ‖ μ)`
for every positive `C¹` probability density `h`, bounded or not. -/
theorem klDiv_withDensity_le_relativeFisherInformation {μ : Measure E} [IsProbabilityMeasure μ]
    {C : ℝ} (hLSI : LogSobolevInequality μ C) {h : E → ℝ} (hh : ContDiff ℝ 1 h)
    (hpos : ∀ x, 0 < h x) (hint : ∫ x, h x ∂μ = 1) :
    klDiv (μ.withDensity fun x ↦ ENNReal.ofReal (h x)) μ ≤
      ENNReal.ofReal (C / 2) * relativeFisherInformation μ h := by
  sorry

/-- 1.2 Moving the centre of an isotropic Gaussian reference away from the mean of `ν` adds
exactly the squared distance over `2σ²`. -/
theorem klDiv_multivariateGaussian_eq_add (ν : Measure E) [IsProbabilityMeasure ν]
    (hν : Integrable id ν) {σ : ℝ} (hσ : 0 < σ) (a : E) :
    klDiv ν (multivariateGaussian a ((σ ^ 2) • 1)) =
      klDiv ν (multivariateGaussian (∫ y, y ∂ν) ((σ ^ 2) • 1)) +
        ENNReal.ofReal (‖a - ∫ y, y ∂ν‖ ^ 2 / (2 * σ ^ 2)) := by
  sorry

/-- 1.3 A Gaussian tilted by `exp f` with an `L`-Lipschitz gradient is within
`(σ² L² / 2) · (its variance)` of the Gaussian with its own mean and the same covariance. -/
theorem klDiv_tilted_multivariateGaussian_le {σ : ℝ} (hσ : 0 < σ) (a : E) {f : E → ℝ}
    (hf : Differentiable ℝ f) {L : ℝ≥0} (hL : LipschitzWith L (∇ f))
    (hexp : Integrable (fun y ↦ Real.exp (f y)) (multivariateGaussian a ((σ ^ 2) • 1))) :
    let ν := (multivariateGaussian a ((σ ^ 2) • 1)).tilted f
    klDiv ν (multivariateGaussian (∫ y, y ∂ν) ((σ ^ 2) • 1)) ≤
      ENNReal.ofReal (σ ^ 2 * L ^ 2 / 2) * ∫⁻ y, ‖y - ∫ z, z ∂ν‖ₑ ^ 2 ∂ν := by
  sorry

/-! ## Layer 2: the one-step bound -/

variable {β : ℕ → ℝ}

/-- 2.1 The Lipschitz constant `max (1/(1-a)) (a R²/(1-a)² - 1/(1-a))` of the score of the law
`μ₀.bind (noiseKernel a)` for data in the ball of radius `R` (ScoreBasedDiffusion 2.2 with
`c = √a`, `s = √(1 - a)`). -/
def scoreLip (R a : ℝ) : ℝ := max (1 / (1 - a)) (a * R ^ 2 / (1 - a) ^ 2 - 1 / (1 - a))

/-- 2.1 The ideal noise predictor `ε*_t = -√(1 - ᾱ t) ∇ log q_t`, the minimizer of
DenoisingDiffusion 4.3 (a `let` there, not a declaration). -/
def scoreNoise (μ₀ : Measure E) (β : ℕ → ℝ) (t : ℕ) (y : E) : E :=
  (-√(1 - alphaBar β t)) • noisyScore μ₀ (√(alphaBar β t)) (√(1 - alphaBar β t)) y

/-- 2.1 The one-step bound, `t ≥ 2`, model variance `β t / α t`. -/
theorem klDiv_reverseStep_le (μ₀ : Measure E) [IsProbabilityMeasure μ₀]
    (hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1) {R : ℝ} (hR : ∀ᵐ x ∂μ₀, ‖x‖ ≤ R)
    {t : ℕ} (ht : 2 ≤ t) {εhat : E → E} (hε : Measurable εhat) :
    klDiv ((forwardMarginal μ₀ β (t - 1) ⊗ₘ noiseKernel (1 - β t)).map Prod.swap)
        (forwardMarginal μ₀ β t ⊗ₘ epsModelKernel β t (√(β t / (1 - β t))) εhat) ≤
      ENNReal.ofReal (d * β t ^ 2 * scoreLip R (alphaBar β (t - 1)) ^ 2 /
          (2 * (1 - β t) ^ 2)) +
        ENNReal.ofReal (β t / (2 * (1 - alphaBar β t))) *
          ∫⁻ x, ‖εhat x - scoreNoise μ₀ β t x‖ₑ ^ 2 ∂(forwardMarginal μ₀ β t) := by
  sorry

end TauCetiRoadmap.DiffusionReverseStepKLBound

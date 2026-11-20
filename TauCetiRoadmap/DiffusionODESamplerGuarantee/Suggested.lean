import Mathlib
import TauCeti.Probability.Distributions.Gaussian.Density
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic

/-!
# Wasserstein guarantee for the discretized flow sampler: target signatures

This file is not the roadmap: the roadmap is `README.md`. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here: the continuous-time guarantee (2.1), the pathwise Euler
bound (3.1), the guarantee for the Euler sampler (4.1) and the Heun bound (4.2), with the facts
about the exact velocity on which they rest (1.1 to 1.5).

Definitions copied verbatim from other roadmaps, so that the statements elaborate without
importing another roadmap's module (they are not new notions; an implementation uses the owners'
declarations): `gaussianKernel` and `smoothedDensity` (DenoisingDiffusion 1.2 and 3.1, in the form
of ScoreBasedDiffusion 1.1 and 1.2), `denoiser` (ScoreBasedDiffusion 2.1), `IsFlowOn`
(FlowMatching 1.1), `mixture` and `IsMarginalVelocity` (FlowMatching 2.1), `interpolant`,
`interpolantVelocity` and `IsInterpolantVelocity` (FlowMatching 3.1), `meshNode` and `oneStepSeq`
(OneStepMethodsForODEs 1.1 and 1.2), `ButcherTableau` with `IsStage`, `stages` and `increment`
(OneStepMethodsForODEs 2.1), and `explicitEuler` and `heun` (OneStepMethodsForODEs 3.1 and 3.2).
The one definition owned here is `exactVelocity`.

Suppliers used by the README and not restated here: FlowMatching 1.1 (`exists_isFlowOn`), 3.1
(the velocity–denoiser identity), 3.2 (`map_interpolant_eq_map_flow`) and 5.2
(`wassersteinEDist_map_flow_le`); ScoreBasedDiffusion 1.3 (the distance from the data), 2.1
(`noisyScore_eq_denoiser`, `hasFDerivAt_noisyScore`) and 2.2 (the posterior covariance bound);
OneStepMethodsForODEs 1.4 (`norm_sub_oneStepSeq_le`), 2.1
(`existsUnique_isStage_of_isExplicit`), 2.2 (`norm_increment_sub_le_of_isExplicit`), 3.1
(`explicitEuler_error_le`) and 3.2 (`heun_defect_le`); DenoisingDiffusion 3.1
(`hasLaw_smoothedDensity`); Tau Ceti
`TauCeti.wassersteinEDist_triangle`, `TauCeti.wassersteinEDist_map_le_eLpNorm`,
`MeasureTheory.Measure.isCoupling_diagonalCoupling`,
`TauCeti.Probability.stdGaussian_map_norm_sq`,
`TauCeti.Probability.integral_id_chiSquaredMeasure`,
`TauCeti.Probability.map_affine_multivariateGaussian`; Mathlib
`ProbabilityTheory.multivariateGaussian_zero_one`, `MeasureTheory.Measure.map_prod_map`,
`measurable_deriv`, `ContinuousLinearMap.norm_eq_iSup_rayleighQuotient`,
`lipschitzWith_of_nnnorm_fderiv_le`, `MeasureTheory.continuousOn_of_dominated`,
`IsCompact.exists_bound_of_continuousOn`, `gronwallBound` (used below),
`norm_le_gronwallBound_of_norm_deriv_right_le`, `dist_le_of_trajectories_ODE`, `measurable_edist`,
`MeasureTheory.eLpNorm_add_le` and `MeasureTheory.setLIntegral_congr_fun`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Set Function TauCeti TauCeti.Probability
open scoped ENNReal NNReal

namespace TauCetiRoadmap.DiffusionODESamplerGuarantee

/-! ## Copied definitions: Gaussian observation and the denoiser -/

section Gaussian

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-- 1.1: the Gaussian observation kernel `x ↦ N(c • x, v)` (copied verbatim from
DenoisingDiffusion 1.2, as restated in ScoreBasedDiffusion 1.1). -/
def gaussianKernel (c v : ℝ) : Kernel E E :=
  (Kernel.id ×ₖ Kernel.const E (multivariateGaussian 0 (v • 1))).map (fun p ↦ c • p.1 + p.2)

/-- 1.2: the density of `c • X + s • Z` for `X ~ μ₀` and an independent standard Gaussian `Z`
(copied verbatim from DenoisingDiffusion 3.1, as restated in ScoreBasedDiffusion 1.2). -/
def smoothedDensity (μ₀ : Measure E) (c s : ℝ) (y : E) : ℝ :=
  ∫ x, multivariateGaussianPDFReal 0 ((s ^ 2) • (1 : Matrix (Fin d) (Fin d) ℝ)) (y - c • x) ∂μ₀

/-- 1.2: the denoiser, the mean of the posterior law of `X` given `c • X + s • Z = y` (copied
verbatim from ScoreBasedDiffusion 2.1). -/
def denoiser (μ₀ : Measure E) (c s : ℝ) (y : E) : E :=
  (smoothedDensity μ₀ c s y)⁻¹ •
    ∫ x, multivariateGaussianPDFReal 0 ((s ^ 2) • (1 : Matrix (Fin d) (Fin d) ℝ)) (y - c • x) • x
      ∂μ₀

end Gaussian

/-! ## Copied definitions: flows, marginal velocities and interpolants -/

section Flows

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 2.1: `φ` is a flow of the time-dependent field `v` on `[a, b]` started at time `a`
(copied verbatim from FlowMatching 1.1). -/
structure IsFlowOn (v : ℝ → E → E) (φ : ℝ → E → E) (a b : ℝ) : Prop where
  apply_left : ∀ x, φ a x = x
  isIntegralCurveOn : ∀ x, IsIntegralCurveOn (fun t ↦ φ t x) v (Icc a b)

end Flows

section Mixtures

variable {Z : Type*} [MeasurableSpace Z] {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- 1.2: the mixture at time `t` of the conditional curves `μ z`, with mixing measure `ρ`
(copied verbatim from FlowMatching 2.1). -/
def mixture (ρ : Measure Z) (μ : Z → ℝ → Measure E) (t : ℝ) : Measure E :=
  ρ.bind fun z ↦ μ z t

/-- 1.2: `w` is a marginal velocity on `(a, b)` of the conditional curves `μ z` with conditional
velocities `u z` (copied verbatim from FlowMatching 2.1). -/
structure IsMarginalVelocity (ρ : Measure Z) (μ : Z → ℝ → Measure E) (u : Z → ℝ → E → E)
    (w : ℝ → E → E) (a b : ℝ) : Prop where
  measurable : Measurable (uncurry w)
  setIntegral_eq : ∀ᵐ t ∂volume.restrict (Ioo a b), ∀ s : Set E, MeasurableSet s →
    ∫ x in s, w t x ∂mixture ρ μ t = ∫ z, (∫ x in s, u z t x ∂μ z t) ∂ρ

end Mixtures

section Interpolants

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 1.1: the interpolant `α t • x₁ + β t • x₀` of a pair `z = (x₀, x₁)` (copied verbatim from
FlowMatching 3.1). -/
def interpolant (α β : ℝ → ℝ) (t : ℝ) (z : E × E) : E :=
  α t • z.2 + β t • z.1

/-- 1.2: the velocity `α' t • x₁ + β' t • x₀` of the interpolant of the pair `z = (x₀, x₁)`
(copied verbatim from FlowMatching 3.1). -/
def interpolantVelocity (α β : ℝ → ℝ) (t : ℝ) (z : E × E) : E :=
  deriv α t • z.2 + deriv β t • z.1

/-- 1.2: `w` is a marginal velocity of the interpolant of the coupling `π` (copied verbatim from
FlowMatching 3.1). -/
def IsInterpolantVelocity (π : Measure (E × E)) (α β : ℝ → ℝ) (w : ℝ → E → E) (a b : ℝ) : Prop :=
  IsMarginalVelocity π (fun z t ↦ Measure.dirac (interpolant α β t z))
    (fun z t _ ↦ interpolantVelocity α β t z) w a b

end Interpolants

/-! ## Copied definitions: one-step methods -/

section OneStep

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 3.1: the `n`-th node `t₀ + h 0 + ⋯ + h (n - 1)` of the mesh with first node `t₀` and steps
`h` (copied verbatim from OneStepMethodsForODEs 1.1). -/
def meshNode (t₀ : ℝ) (h : ℕ → ℝ) (n : ℕ) : ℝ := t₀ + ∑ i ∈ Finset.range n, h i

/-- 3.1: the numerical solution of the one-step method with increment function `Φ` (copied
verbatim from OneStepMethodsForODEs 1.2). -/
def oneStepSeq (Φ : ℝ → E → ℝ → E) (t₀ : ℝ) (h : ℕ → ℝ) (y₀ : E) : ℕ → E
  | 0 => y₀
  | n + 1 => oneStepSeq Φ t₀ h y₀ n + h n • Φ (meshNode t₀ h n) (oneStepSeq Φ t₀ h y₀ n) (h n)

/-- 3.1: a Butcher tableau with `s` stages (copied verbatim from OneStepMethodsForODEs 2.1). -/
structure ButcherTableau (s : ℕ) where
  /-- The Runge–Kutta matrix. -/
  A : Matrix (Fin s) (Fin s) ℝ
  /-- The weights. -/
  b : Fin s → ℝ
  /-- The nodes. -/
  c : Fin s → ℝ

namespace ButcherTableau

variable {s : ℕ} (T : ButcherTableau s)

/-- 3.1: `k` solves the stage equations (copied verbatim from OneStepMethodsForODEs 2.1). -/
def IsStage (f : ℝ → E → E) (t : ℝ) (y : E) (h : ℝ) (k : Fin s → E) : Prop :=
  ∀ i, k i = f (t + T.c i * h) (y + h • ∑ j, T.A i j • k j)

/-- 3.1: the stage vector, the unique solution of the stage equations when there is exactly one
and `0` otherwise (copied verbatim from OneStepMethodsForODEs 2.1). -/
def stages (f : ℝ → E → E) (t : ℝ) (y : E) (h : ℝ) : Fin s → E := by
  classical exact if hk : ∃! k, T.IsStage f t y h k then hk.choose else 0

/-- 3.1: the increment function `∑ i, b i • k i` of the Runge–Kutta method (copied verbatim from
OneStepMethodsForODEs 2.1). -/
def increment (f : ℝ → E → E) (t : ℝ) (y : E) (h : ℝ) : E := ∑ i, T.b i • T.stages f t y h i

end ButcherTableau

/-- 3.1: the explicit Euler method (copied verbatim from OneStepMethodsForODEs 3.1). -/
def explicitEuler : ButcherTableau 1 := ⟨!![0], ![1], ![0]⟩

/-- 4.2: the explicit trapezoidal method, Heun's method (copied verbatim from
OneStepMethodsForODEs 3.2). -/
def heun : ButcherTableau 2 := ⟨!![0, 0; 1, 0], ![1 / 2, 1 / 2], ![0, 1]⟩

end OneStep

/-! ## Layer 1: the exact velocity for data in a ball -/

section ExactVelocity

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-- 1.2: the exact velocity of the interpolant `α t • x₁ + β t • x₀` of a standard Gaussian
source `x₀` and a data point `x₁ ~ μ₁`, in denoiser form:
`(β'/β) x + (α' - α β'/β) D(x)` with `D = denoiser μ₁ (α t) (β t)`. -/
def exactVelocity (μ₁ : Measure E) (α β : ℝ → ℝ) (t : ℝ) (x : E) : E :=
  (deriv β t / β t) • x + (deriv α t - α t * deriv β t / β t) • denoiser μ₁ (α t) (β t) x

/-- 1.1: the law of the interpolant at time `t` is the law of the data observed at level
`(α t, β t)`. -/
theorem map_interpolant_eq_bind (μ₁ : Measure E) [IsProbabilityMeasure μ₁] (α β : ℝ → ℝ)
    (t : ℝ) :
    ((stdGaussian E).prod μ₁).map (interpolant α β t) =
      μ₁.bind (gaussianKernel (α t) (β t ^ 2)) :=
  sorry

/-- 1.2: for data with a finite first moment, the exact velocity is a marginal velocity of the
interpolant of the standard Gaussian and the data on `(0, b)` when `β ≠ 0` on `(0, b)`. -/
theorem isInterpolantVelocity_exactVelocity (μ₁ : Measure E) [IsProbabilityMeasure μ₁]
    (hμ₁ : ∫⁻ x, ‖x‖ₑ ∂μ₁ < ∞) {α β : ℝ → ℝ} (hα : Measurable α) (hβ : Measurable β) {b : ℝ}
    (hβb : ∀ t ∈ Ioo 0 b, β t ≠ 0) :
    IsInterpolantVelocity ((stdGaussian E).prod μ₁) α β (exactVelocity μ₁ α β) 0 b :=
  sorry

/-- 1.3: for data in the ball of radius `R` and `β t > 0`, the exact velocity at time `t` is
Lipschitz with constant `max |β'/β| |β'/β + (α' - α β'/β) α R²/β²|`. -/
theorem lipschitzWith_exactVelocity (μ₁ : Measure E) [IsProbabilityMeasure μ₁] {R : ℝ}
    (hR : ∀ᵐ x ∂μ₁, ‖x‖ ≤ R) (α β : ℝ → ℝ) {t : ℝ} (hβt : 0 < β t) :
    LipschitzWith
      (max |deriv β t / β t|
        |deriv β t / β t + (deriv α t - α t * deriv β t / β t) * α t * R ^ 2 / β t ^ 2|).toNNReal
      (exactVelocity μ₁ α β t) :=
  sorry

/-- 1.4: for data with a finite first moment, the exact velocity is jointly continuous on
`[0, b] × E`. -/
theorem continuousOn_exactVelocity (μ₁ : Measure E) [IsProbabilityMeasure μ₁]
    (hμ₁ : ∫⁻ x, ‖x‖ₑ ∂μ₁ < ∞) {α β : ℝ → ℝ} (hα : ContDiff ℝ 1 α) (hβ : ContDiff ℝ 1 β) {b : ℝ}
    (hβb : ∀ t ∈ Icc 0 b, 0 < β t) :
    ContinuousOn (uncurry (exactVelocity μ₁ α β)) (Icc 0 b ×ˢ univ) :=
  sorry

/-- 1.5: a flow of the exact velocity pushes the standard Gaussian to the law of the data at level
`(α t, β t)`, for every `t ∈ [0, b]`. -/
theorem map_flow_exactVelocity (μ₁ : Measure E) [IsProbabilityMeasure μ₁] {R : ℝ}
    (hR : ∀ᵐ x ∂μ₁, ‖x‖ ≤ R) {α β : ℝ → ℝ} (hα : ContDiff ℝ 1 α) (hβ : ContDiff ℝ 1 β)
    (hα0 : α 0 = 0) (hβ0 : β 0 = 1) {b : ℝ} (hβb : ∀ t ∈ Icc 0 b, 0 < β t) {φ : ℝ → E → E}
    (hφ : IsFlowOn (exactVelocity μ₁ α β) φ 0 b) {t : ℝ} (ht : t ∈ Icc 0 b) :
    (stdGaussian E).map (φ t) = μ₁.bind (gaussianKernel (α t) (β t ^ 2)) :=
  sorry

/-! ## Layer 2: the continuous-time guarantee -/

/-- 2.1: the Wasserstein distance of order two from the data to the law produced by a learned
field `w` that is `K`-Lipschitz in space and continuous in time is at most the early-stopping
term plus the training error under the exact laws, weighted by `exp (K (b - t))`. -/
theorem wassersteinEDist_data_flow_le (μ₁ : Measure E) [IsProbabilityMeasure μ₁] {R : ℝ}
    (hR : ∀ᵐ x ∂μ₁, ‖x‖ ≤ R) {α β : ℝ → ℝ} (hα : ContDiff ℝ 1 α) (hβ : ContDiff ℝ 1 β)
    (hα0 : α 0 = 0) (hβ0 : β 0 = 1) {b : ℝ} (hb : 0 ≤ b) (hβb : ∀ t ∈ Icc 0 b, 0 < β t)
    {w ψ : ℝ → E → E} {K : ℝ≥0} (hK : ∀ t, LipschitzWith K (w t))
    (hwc : ∀ x, ContinuousOn (fun t ↦ w t x) (Icc 0 b)) (hψ : IsFlowOn w ψ 0 b) :
    wassersteinEDist 2 μ₁ ((stdGaussian E).map (ψ b)) ≤
      ENNReal.ofReal √((1 - α b) ^ 2 * ∫ x, ‖x‖ ^ 2 ∂μ₁ + β b ^ 2 * d) +
        ∫⁻ t in Ioo 0 b, ENNReal.ofReal (Real.exp (K * (b - t))) *
          (∫⁻ x, ‖exactVelocity μ₁ α β t x - w t x‖ₑ ^ (2 : ℝ)
            ∂(μ₁.bind (gaussianKernel (α t) (β t ^ 2)))) ^ (1 / 2 : ℝ) :=
  sorry

end ExactVelocity

/-! ## Layer 3: the Euler sampler, pathwise -/

section Pathwise

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 3.1: along a flow of a field that is `K`-Lipschitz in space and Lipschitz in time with linear
growth, the explicit Euler method started at `x` on a mesh of `[0, b]` with steps at most `hmax`
errs at time `b` by at most `gronwallBound 0 K (M x * hmax / 2) b`. -/
theorem norm_flow_sub_euler_le {w ψ : ℝ → E → E} {K Λ : ℝ≥0} {b B₀ hmax : ℝ}
    (hK : ∀ t, LipschitzWith K (w t))
    (hΛ : ∀ r ∈ Icc 0 b, ∀ s ∈ Icc 0 b, ∀ x, ‖w r x - w s x‖ ≤ Λ * (1 + ‖x‖) * |r - s|)
    (hB₀ : ∀ t ∈ Icc 0 b, ‖w t 0‖ ≤ B₀) (hψ : IsFlowOn w ψ 0 b) {h : ℕ → ℝ} {N : ℕ}
    (hh : ∀ n < N, 0 ≤ h n ∧ h n ≤ hmax) (hN : meshNode 0 h N = b) (x : E) :
    ‖ψ b x - oneStepSeq (explicitEuler.increment w) 0 h x N‖ ≤
      gronwallBound 0 K
        (((Λ + K ^ 2) * (Real.exp (K * b) * ‖x‖ + B₀ * gronwallBound 0 K 1 b) + Λ + K * B₀) *
          hmax / 2) b :=
  sorry

end Pathwise

/-! ## Layer 4: the sampler guarantee -/

section Sampler

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-- 4.1: the Wasserstein distance of order two from the data to the law of the explicit Euler
sampler started from the standard Gaussian is at most the two terms of 2.1 plus a
discretization term of order `hmax`. -/
theorem wassersteinEDist_data_euler_le (μ₁ : Measure E) [IsProbabilityMeasure μ₁] {R : ℝ}
    (hR : ∀ᵐ x ∂μ₁, ‖x‖ ≤ R) {α β : ℝ → ℝ} (hα : ContDiff ℝ 1 α) (hβ : ContDiff ℝ 1 β)
    (hα0 : α 0 = 0) (hβ0 : β 0 = 1) {b : ℝ} (hβb : ∀ t ∈ Icc 0 b, 0 < β t)
    {w ψ : ℝ → E → E} {K Λ : ℝ≥0} {B₀ hmax : ℝ} (hK : ∀ t, LipschitzWith K (w t))
    (hΛ : ∀ r ∈ Icc 0 b, ∀ s ∈ Icc 0 b, ∀ x, ‖w r x - w s x‖ ≤ Λ * (1 + ‖x‖) * |r - s|)
    (hB₀ : ∀ t ∈ Icc 0 b, ‖w t 0‖ ≤ B₀) (hψ : IsFlowOn w ψ 0 b) {h : ℕ → ℝ} {N : ℕ}
    (hh : ∀ n < N, 0 ≤ h n ∧ h n ≤ hmax) (hN : meshNode 0 h N = b) :
    wassersteinEDist 2 μ₁
        ((stdGaussian E).map fun x ↦ oneStepSeq (explicitEuler.increment w) 0 h x N) ≤
      ENNReal.ofReal √((1 - α b) ^ 2 * ∫ x, ‖x‖ ^ 2 ∂μ₁ + β b ^ 2 * d) +
        (∫⁻ t in Ioo 0 b, ENNReal.ofReal (Real.exp (K * (b - t))) *
          (∫⁻ x, ‖exactVelocity μ₁ α β t x - w t x‖ₑ ^ (2 : ℝ)
            ∂(μ₁.bind (gaussianKernel (α t) (β t ^ 2)))) ^ (1 / 2 : ℝ)) +
        ENNReal.ofReal (gronwallBound 0 K
          (((Λ + K ^ 2) * (Real.exp (K * b) * √d + B₀ * gronwallBound 0 K 1 b) + Λ + K * B₀) *
            hmax / 2) b) :=
  sorry

/-- 4.2: under bounds `M₂ x`, `M₃ x` on the Lipschitz constants of the first and second time
derivatives of the trajectory from `x`, square integrable for the standard Gaussian, the law of
Heun's method is within `gronwallBound 0 (K (1 + hmax K / 2)) ((m₃/12 + K m₂/4) hmax²) b` of the
law of the flow in the Wasserstein distance of order two. -/
theorem wassersteinEDist_flow_heun_le {w ψ : ℝ → E → E} {K : ℝ≥0} {b hmax : ℝ}
    (hK : ∀ t, LipschitzWith K (w t)) (hψ : IsFlowOn w ψ 0 b) {M₂ M₃ : E → ℝ≥0}
    (hM₂m : Measurable M₂) (hM₃m : Measurable M₃) {m₂ m₃ : ℝ≥0}
    (hm₂ : ∫⁻ x, (M₂ x : ℝ≥0∞) ^ 2 ∂(stdGaussian E) ≤ (m₂ : ℝ≥0∞) ^ 2)
    (hm₃ : ∫⁻ x, (M₃ x : ℝ≥0∞) ^ 2 ∂(stdGaussian E) ≤ (m₃ : ℝ≥0∞) ^ 2)
    (hM₂ : ∀ x, LipschitzOnWith (M₂ x) (fun r ↦ w r (ψ r x)) (Icc 0 b))
    (hM₃ : ∀ x, ∃ y₂ : ℝ → E,
      (∀ r ∈ Icc 0 b, HasDerivWithinAt (fun r ↦ w r (ψ r x)) (y₂ r) (Icc 0 b) r) ∧
        LipschitzOnWith (M₃ x) y₂ (Icc 0 b))
    {h : ℕ → ℝ} {N : ℕ} (hh : ∀ n < N, 0 ≤ h n ∧ h n ≤ hmax) (hN : meshNode 0 h N = b) :
    wassersteinEDist 2 ((stdGaussian E).map (ψ b))
        ((stdGaussian E).map fun x ↦ oneStepSeq (heun.increment w) 0 h x N) ≤
      ENNReal.ofReal
        (gronwallBound 0 (K * (1 + hmax * K / 2)) ((m₃ / 12 + K * m₂ / 4) * hmax ^ 2) b) :=
  sorry

end Sampler

end TauCetiRoadmap.DiffusionODESamplerGuarantee

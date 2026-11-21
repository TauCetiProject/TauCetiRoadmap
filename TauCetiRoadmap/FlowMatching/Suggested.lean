import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.ContinuityEquation.Basic
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic

/-!
# Flow matching and probability-flow ODEs: target signatures

This file is not the roadmap: the roadmap is `README.md`. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Suppliers used by the README and not restated here: Mathlib `IsIntegralCurveOn` (used below),
`IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`,
`ODE_solution_unique_of_mem_Icc_right`, `dist_le_of_trajectories_ODE`,
`image_le_of_liminf_slope_right_le_deriv_boundary`,
`MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`,
`MeasureTheory.Measure.bind` (used below), `MeasureTheory.Measure.bind_dirac_eq_map`,
`MeasureTheory.condExp`, `MeasureTheory.StronglyMeasurable.exists_eq_measurable_comp`,
`MeasureTheory.condExp_stronglyMeasurable_bilin_of_bound`, `ConvexOn.map_integral_le`,
`ConvexOn.map_condExp_le_of_finiteDimensional`,
`integral_bilinear_hasLineDerivAt_right_eq_neg_left_of_integrable` and `stdOrthonormalBasis`
(used below); Tau Ceti `TauCeti.IsContinuityEquation` (used below),
`TauCeti.IsContinuityEquation.congr`, `TauCeti.isContinuityEquation_map`,
`TauCeti.isContinuityEquation_dirac`,
`TauCeti.IsContinuityEquation.intervalIntegral_integral_fderiv_eq_sub`,
`TauCeti.exists_isContinuityEquation_map_smul_fst_add_smul_snd` and its optimal-coupling form,
`TauCeti.timeDependentFlow`, `TauCeti.contDiff_timeDependentFlow`,
`TauCeti.hasDerivAt_fderiv_timeDependentFlow`, `TauCeti.hasDerivAt_dysonSeriesLeft_apply`,
`TauCeti.IsCoupling`,
`TauCeti.wassersteinEDist` (used below), `TauCeti.wassersteinEDist_le` and
`TauCeti.lintegral_Lp_lintegral_le`; DenoisingDiffusion 3.1 and 3.2 (the smoothed score and
Tweedie's formula); DiracScatteringAndNonlinearFourierTransform 1.4 (Liouville's formula);
OptimalTransport 8.7, 8.8 and 9.1 (the continuity equation, the Benamou–Brenier formula and
displacement interpolations); StochasticCalculus 9.4 and 10.2 (the Ornstein–Uhlenbeck process and
the forward equation of a diffusion).
-/

noncomputable section

open MeasureTheory Set Function Filter Topology TauCeti InnerProductSpace
open scoped NNReal ENNReal RealInnerProductSpace Gradient

namespace TauCetiRoadmap.FlowMatching

/-! ## Layer 1: flows of Lipschitz fields and the transport of measures -/

section Flows

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 1.1: `φ` is a flow of the time-dependent field `v` on `[a, b]` started at time `a`:
`φ a x = x`, and `t ↦ φ t x` is an integral curve of `v` on `[a, b]` for every `x`. The values of
`φ t` for `t ∉ [a, b]` are not constrained. -/
structure IsFlowOn (v : ℝ → E → E) (φ : ℝ → E → E) (a b : ℝ) : Prop where
  apply_left : ∀ x, φ a x = x
  isIntegralCurveOn : ∀ x, IsIntegralCurveOn (fun t ↦ φ t x) v (Icc a b)

/-- 1.1: a field that is continuous in time and `K`-Lipschitz in space on `[a, b]` has a flow on
`[a, b]`, which can be chosen jointly continuous on `ℝ × E`. -/
theorem exists_isFlowOn [CompleteSpace E] {v : ℝ → E → E} {K : ℝ≥0} {a b : ℝ}
    (hvc : ∀ x, ContinuousOn (fun t ↦ v t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (v t)) :
    ∃ φ : ℝ → E → E, IsFlowOn v φ a b ∧ Continuous (uncurry φ) :=
  sorry

/-- 1.1: the time maps of the flow of such a field are bijective. -/
theorem IsFlowOn.bijective [CompleteSpace E] {v φ : ℝ → E → E} {K : ℝ≥0} {a b : ℝ}
    (hvc : ∀ x, ContinuousOn (fun t ↦ v t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (v t)) (hφ : IsFlowOn v φ a b) {t : ℝ}
    (ht : t ∈ Icc a b) : Bijective (φ t) :=
  sorry

end Flows

section Liouville

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- 1.2: Liouville's formula. For a field that is `C¹` in space with jointly continuous spatial
derivative, the time maps of the flow are `C¹` and the determinant of their derivative is the
exponential of the integrated divergence along the trajectory. -/
theorem IsFlowOn.det_fderiv {v φ : ℝ → E → E} {K : ℝ≥0} {a b : ℝ}
    (hvc : ∀ x, ContinuousOn (fun t ↦ v t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (v t)) (hd : ∀ t ∈ Icc a b, Differentiable ℝ (v t))
    (hDv : ContinuousOn (fun q : ℝ × E ↦ fderiv ℝ (v q.1) q.2) (Icc a b ×ˢ univ))
    (hφ : IsFlowOn v φ a b) {t : ℝ} (ht : t ∈ Icc a b) :
    ContDiff ℝ 1 (φ t) ∧ ∀ x, (fderiv ℝ (φ t) x).det =
      Real.exp (∫ s in a..t, LinearMap.trace ℝ E (fderiv ℝ (v s) (φ s x) : E →ₗ[ℝ] E)) :=
  sorry

end Liouville

section Transport

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 1.3: the pushforwards of a finite measure of finite first moment by a flow of a Lipschitz
field solve the continuity equation with that field. -/
theorem IsFlowOn.isContinuityEquation_map {v φ : ℝ → E → E} {K : ℝ≥0} {a b : ℝ}
    (hv : Measurable (uncurry v)) (hvc : ∀ x, ContinuousOn (fun t ↦ v t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (v t)) (hφ : IsFlowOn v φ a b)
    (hφm : Measurable (uncurry φ)) (μ : Measure E) [IsFiniteMeasure μ]
    (hμ : ∫⁻ x, ‖x‖ₑ ∂μ < ∞) :
    IsContinuityEquation (fun t ↦ μ.map (φ t)) v a b :=
  sorry

/-- 1.4: a narrowly continuous solution of the continuity equation with a field that is
continuous in time and Lipschitz in space is the pushforward of its initial measure by the
flow. In particular such solutions are determined by their initial measure. -/
theorem eq_map_of_isContinuityEquation {ν : ℝ → FiniteMeasure E} {v φ : ℝ → E → E} {K : ℝ≥0}
    {a b : ℝ} (h : IsContinuityEquation (fun t ↦ (ν t : Measure E)) v a b)
    (hν : ContinuousOn ν (Icc a b)) (hvc : ∀ x, ContinuousOn (fun t ↦ v t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (v t)) (hφ : IsFlowOn v φ a b) {t : ℝ}
    (ht : t ∈ Icc a b) : (ν t : Measure E) = (ν a : Measure E).map (φ t) :=
  sorry

/-- 1.5: the density form of the transport (the instantaneous change of variables). If `q` is
`p` transported along the flow and divided by the Jacobian, then the pushforward of the measure
with density `p` has density `q`. -/
theorem IsFlowOn.map_withDensity {v φ : ℝ → E → E} {K : ℝ≥0} {a b : ℝ}
    (hvc : ∀ x, ContinuousOn (fun t ↦ v t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (v t)) (hd : ∀ t ∈ Icc a b, Differentiable ℝ (v t))
    (hDv : ContinuousOn (fun q : ℝ × E ↦ fderiv ℝ (v q.1) q.2) (Icc a b ×ˢ univ))
    (hφ : IsFlowOn v φ a b) {t : ℝ} (ht : t ∈ Icc a b) (μ : Measure E) [μ.IsAddHaarMeasure]
    {p q : E → ℝ≥0∞}
    (hq : ∀ x, q (φ t x) = p x * ENNReal.ofReal (Real.exp
      (-∫ s in a..t, LinearMap.trace ℝ E (fderiv ℝ (v s) (φ s x) : E →ₗ[ℝ] E)))) :
    (μ.withDensity p).map (φ t) = μ.withDensity q :=
  sorry

end Transport

/-! ## Layer 2: mixtures of solutions and the marginal velocity -/

section Mixtures

variable {Z : Type*} [MeasurableSpace Z] {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- 2.1: the mixture at time `t` of the conditional curves `μ z`, with mixing measure `ρ`. -/
def mixture (ρ : Measure Z) (μ : Z → ℝ → Measure E) (t : ℝ) : Measure E :=
  ρ.bind fun z ↦ μ z t

/-- 2.1: `w` is a marginal velocity on `(a, b)` of the conditional curves `μ z` with conditional
velocities `u z`: it is jointly measurable and, for almost every `t ∈ (a, b)`, the flux
`w t • mixture ρ μ t` is the `ρ`-mixture of the conditional fluxes `u z t • μ z t`. -/
structure IsMarginalVelocity (ρ : Measure Z) (μ : Z → ℝ → Measure E) (u : Z → ℝ → E → E)
    (w : ℝ → E → E) (a b : ℝ) : Prop where
  measurable : Measurable (uncurry w)
  setIntegral_eq : ∀ᵐ t ∂volume.restrict (Ioo a b), ∀ s : Set E, MeasurableSet s →
    ∫ x in s, w t x ∂mixture ρ μ t = ∫ z, (∫ x in s, u z t x ∂μ z t) ∂ρ

/-- 2.1: a marginal velocity exists when the conditional masses and conditional velocities are
integrable. -/
theorem exists_isMarginalVelocity {ρ : Measure Z} [SFinite ρ] {μ : Z → ℝ → Measure E}
    {u : Z → ℝ → E → E} {a b : ℝ} (hμ : Measurable (uncurry μ))
    (hu : Measurable fun q : Z × ℝ × E ↦ u q.1 q.2.1 q.2.2)
    (hmass : ∫⁻ z, (∫⁻ t in Ioo a b, μ z t univ) ∂ρ < ∞)
    (hint : ∫⁻ z, (∫⁻ t in Ioo a b, ∫⁻ x, ‖u z t x‖ₑ ∂μ z t) ∂ρ < ∞) :
    ∃ w : ℝ → E → E, IsMarginalVelocity ρ μ u w a b :=
  sorry

/-- 2.1 (Lipman, Chen, Ben-Hamu, Nickel and Le, Theorem 1): a mixture of solutions of the
continuity equation solves the continuity equation with every marginal velocity. -/
theorem IsMarginalVelocity.isContinuityEquation_mixture {ρ : Measure Z} [SFinite ρ]
    {μ : Z → ℝ → Measure E} {u : Z → ℝ → E → E} {w : ℝ → E → E} {a b : ℝ}
    (hμ : Measurable (uncurry μ)) (hu : Measurable fun q : Z × ℝ × E ↦ u q.1 q.2.1 q.2.2)
    (hmass : ∫⁻ z, (∫⁻ t in Ioo a b, μ z t univ) ∂ρ < ∞)
    (hint : ∫⁻ z, (∫⁻ t in Ioo a b, ∫⁻ x, ‖u z t x‖ₑ ∂μ z t) ∂ρ < ∞)
    (hce : ∀ᵐ z ∂ρ, IsContinuityEquation (μ z) (u z) a b)
    (hw : IsMarginalVelocity ρ μ u w a b) :
    IsContinuityEquation (mixture ρ μ) w a b :=
  sorry

end Mixtures

section Objectives

variable {Z : Type*} [MeasurableSpace Z] {E : Type*} [NormedAddCommGroup E]
  [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- 2.2 (Lipman, Chen, Ben-Hamu, Nickel and Le, Theorem 2): the conditional flow-matching
objective of a field `v` is its flow-matching objective plus the conditional objective of the
marginal velocity, with values in `[0, ∞]`. -/
theorem IsMarginalVelocity.lintegral_enorm_sub_sq {ρ : Measure Z} [SFinite ρ]
    {μ : Z → ℝ → Measure E} {u : Z → ℝ → E → E} {w : ℝ → E → E} {a b : ℝ}
    (hμ : Measurable (uncurry μ)) (hu : Measurable fun q : Z × ℝ × E ↦ u q.1 q.2.1 q.2.2)
    (hmass : ∫⁻ z, (∫⁻ t in Ioo a b, μ z t univ) ∂ρ < ∞)
    (hint : ∫⁻ z, (∫⁻ t in Ioo a b, ∫⁻ x, ‖u z t x‖ₑ ∂μ z t) ∂ρ < ∞)
    (hw : IsMarginalVelocity ρ μ u w a b) {v : ℝ → E → E} (hv : Measurable (uncurry v)) :
    ∫⁻ z, (∫⁻ t in Ioo a b, ∫⁻ x, ‖v t x - u z t x‖ₑ ^ 2 ∂μ z t) ∂ρ =
      (∫⁻ t in Ioo a b, ∫⁻ x, ‖v t x - w t x‖ₑ ^ 2 ∂mixture ρ μ t) +
        ∫⁻ z, (∫⁻ t in Ioo a b, ∫⁻ x, ‖w t x - u z t x‖ₑ ^ 2 ∂μ z t) ∂ρ :=
  sorry

end Objectives

/-! ## Layer 3: interpolant paths -/

section Interpolants

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 3.1: the interpolant `α t • x₁ + β t • x₀` of a pair `z = (x₀, x₁)`. -/
def interpolant (α β : ℝ → ℝ) (t : ℝ) (z : E × E) : E :=
  α t • z.2 + β t • z.1

/-- 3.1: the velocity `α' t • x₁ + β' t • x₀` of the interpolant of the pair `z = (x₀, x₁)`. -/
def interpolantVelocity (α β : ℝ → ℝ) (t : ℝ) (z : E × E) : E :=
  deriv α t • z.2 + deriv β t • z.1

/-- 3.1: `w` is a marginal velocity of the interpolant of the coupling `π`: a marginal velocity
of the moving Dirac masses `δ_{interpolant α β t z}` with velocities `interpolantVelocity α β t z`,
mixed by `π`. -/
def IsInterpolantVelocity (π : Measure (E × E)) (α β : ℝ → ℝ) (w : ℝ → E → E) (a b : ℝ) : Prop :=
  IsMarginalVelocity π (fun z t ↦ Measure.dirac (interpolant α β t z))
    (fun z t _ ↦ interpolantVelocity α β t z) w a b

/-- 3.1: the velocity–noise identity. If `n` is the conditional mean of the source point `x₀`
given the interpolant (a marginal velocity for the conditional "velocities" `x₀`), then
`(α'/α) x + (β' - α' β/α) n` is a marginal velocity of the interpolant wherever `α ≠ 0`. -/
theorem isInterpolantVelocity_of_noise {π : Measure (E × E)} [IsFiniteMeasure π]
    (hπ : ∫⁻ z, ‖z‖ₑ ∂π < ∞) {α β : ℝ → ℝ} (hα : Measurable α) (hβ : Measurable β)
    {n : ℝ → E → E} {a b : ℝ}
    (hn : IsMarginalVelocity π (fun z t ↦ Measure.dirac (interpolant α β t z))
      (fun z _ _ ↦ z.1) n a b)
    (h0 : ∀ t ∈ Ioo a b, α t ≠ 0) :
    IsInterpolantVelocity π α β
      (fun t x ↦ (deriv α t / α t) • x + (deriv β t - deriv α t * β t / α t) • n t x) a b :=
  sorry

/-- 3.2 (Liu, Gong and Liu, Theorem 3.3): if a marginal velocity of the interpolant is continuous
in time and Lipschitz in space on `[a, b]`, its flow transports the law of the interpolant at
time `a` to the law at every time of `[a, b]`. -/
theorem map_interpolant_eq_map_flow {π : Measure (E × E)} [IsFiniteMeasure π]
    (hπ : ∫⁻ z, ‖z‖ₑ ∂π < ∞) {α β : ℝ → ℝ} (hα : ContDiff ℝ 1 α) (hβ : ContDiff ℝ 1 β)
    {w φ : ℝ → E → E} {K : ℝ≥0} {a b : ℝ} (hw : IsInterpolantVelocity π α β w a b)
    (hwc : ∀ x, ContinuousOn (fun t ↦ w t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (w t)) (hφ : IsFlowOn w φ a b) {t : ℝ}
    (ht : t ∈ Icc a b) :
    π.map (interpolant α β t) = (π.map (interpolant α β a)).map (φ t) :=
  sorry

/-- 3.3 (Liu, Gong and Liu, Theorem 3.5): rectification does not increase convex transport
costs. For the linear interpolant with a Lipschitz marginal velocity, the coupling of `x` with
its image under the time-one flow has no larger `c`-cost than `π`, for every convex `c` whose
cost under `π` is integrable. -/
theorem integral_flow_sub_le {π : Measure (E × E)} [IsFiniteMeasure π]
    (hπ : ∫⁻ z, ‖z‖ₑ ∂π < ∞) {w φ : ℝ → E → E} {K : ℝ≥0}
    (hw : IsInterpolantVelocity π (fun t ↦ t) (fun t ↦ 1 - t) w 0 1)
    (hwc : ∀ x, ContinuousOn (fun t ↦ w t x) (Icc 0 1))
    (hK : ∀ t ∈ Icc (0 : ℝ) 1, LipschitzWith K (w t)) (hφ : IsFlowOn w φ 0 1) {c : E → ℝ}
    (hc : ConvexOn ℝ univ c) (hci : Integrable (fun z : E × E ↦ c (z.2 - z.1)) π) :
    ∫ x, c (φ 1 x - x) ∂π.fst ≤ ∫ z, c (z.2 - z.1) ∂π :=
  sorry

end Interpolants

/-! ## Layer 4: the probability-flow ODE -/

section ProbabilityFlow

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 4.1: the second-order part `Σ_{i,j} A_{ij} ∂ᵢ∂ⱼ ψ` of a diffusion generator with diffusion
matrix `A`, written as `Σⱼ D²ψ(x)[A eⱼ, eⱼ]` in the standard orthonormal basis. -/
def diffusionTerm (A : E →L[ℝ] E) (ψ : E → ℝ) (x : E) : ℝ :=
  ∑ j, fderiv ℝ (fderiv ℝ ψ) x (A (stdOrthonormalBasis ℝ E j)) (stdOrthonormalBasis ℝ E j)

/-- 4.1: the row divergence `Σⱼ ∂ⱼ (M eⱼ)` of an operator-valued field `M`. -/
def rowDivergence (M : E → E →L[ℝ] E) (x : E) : E :=
  ∑ j, fderiv ℝ (fun y ↦ M y (stdOrthonormalBasis ℝ E j)) x (stdOrthonormalBasis ℝ E j)

/-- 4.1 (Song, Sohl-Dickstein, Kingma, Kumar, Ermon and Poole, Appendix D.1): a curve of
measures with `C¹` densities `p t` that solves the Fokker–Planck equation with drift `f` and
diffusion matrix `A` in the sense of distributions solves the continuity equation with every
field `w` whose flux is `p w = p f - (1/2) rowDivergence (p A)`. -/
theorem isContinuityEquation_of_fokkerPlanck {p : ℝ → E → ℝ} {f w : ℝ → E → E}
    {A : ℝ → E → E →L[ℝ] E} {a b : ℝ} (hp0 : ∀ t x, 0 ≤ p t x)
    (hpm : Measurable (uncurry p)) (hfm : Measurable (uncurry f))
    (hAm : Measurable (uncurry A)) (hwm : Measurable (uncurry w))
    (hp1 : ∀ t ∈ Ioo a b, ContDiff ℝ 1 (p t)) (hA1 : ∀ t ∈ Ioo a b, ContDiff ℝ 1 (A t))
    (hmass : ∫⁻ t in Ioo a b, ∫⁻ x, ENNReal.ofReal (p t x) < ∞)
    (hf : ∫⁻ t in Ioo a b, ∫⁻ x, ‖f t x‖ₑ * ENNReal.ofReal (p t x) < ∞)
    (hA : ∫⁻ t in Ioo a b, ∫⁻ x, ‖A t x‖ₑ * ENNReal.ofReal (p t x) < ∞)
    (hdiv : ∫⁻ t in Ioo a b, ∫⁻ x, ‖rowDivergence (fun y ↦ p t y • A t y) x‖ₑ < ∞)
    (hFP : ∀ ζ : ℝ × E → ℝ, ContDiff ℝ (⊤ : ℕ∞) ζ → HasCompactSupport ζ →
      tsupport ζ ⊆ Ioo a b ×ˢ univ →
      ∫ t in Ioo a b, ∫ x, (fderiv ℝ ζ (t, x) (1, f t x) +
        1 / 2 * diffusionTerm (A t x) (fun y ↦ ζ (t, y)) x) * p t x = 0)
    (hw : ∀ t ∈ Ioo a b, ∀ x,
      p t x • w t x = p t x • f t x - (1 / 2 : ℝ) • rowDivergence (fun y ↦ p t y • A t y) x) :
    IsContinuityEquation (fun t ↦ volume.withDensity fun x ↦ ENNReal.ofReal (p t x)) w a b :=
  sorry

/-- 4.2: the probability-flow ODE has the same marginals. Under the hypotheses of 4.1, if the
curve of measures with densities `p t` is narrowly continuous on `[a, b]` and the field `w` is
continuous in time and Lipschitz in space there, the flow of `w` transports the measure at time
`a` to the measure at every time of `[a, b]`. -/
theorem eq_map_flow_of_fokkerPlanck {p : ℝ → E → ℝ} {f w φ : ℝ → E → E}
    {A : ℝ → E → E →L[ℝ] E} {ν : ℝ → FiniteMeasure E} {K : ℝ≥0} {a b : ℝ}
    (hp0 : ∀ t x, 0 ≤ p t x)
    (hpm : Measurable (uncurry p)) (hfm : Measurable (uncurry f))
    (hAm : Measurable (uncurry A)) (hwm : Measurable (uncurry w))
    (hp1 : ∀ t ∈ Ioo a b, ContDiff ℝ 1 (p t)) (hA1 : ∀ t ∈ Ioo a b, ContDiff ℝ 1 (A t))
    (hmass : ∫⁻ t in Ioo a b, ∫⁻ x, ENNReal.ofReal (p t x) < ∞)
    (hf : ∫⁻ t in Ioo a b, ∫⁻ x, ‖f t x‖ₑ * ENNReal.ofReal (p t x) < ∞)
    (hA : ∫⁻ t in Ioo a b, ∫⁻ x, ‖A t x‖ₑ * ENNReal.ofReal (p t x) < ∞)
    (hdiv : ∫⁻ t in Ioo a b, ∫⁻ x, ‖rowDivergence (fun y ↦ p t y • A t y) x‖ₑ < ∞)
    (hFP : ∀ ζ : ℝ × E → ℝ, ContDiff ℝ (⊤ : ℕ∞) ζ → HasCompactSupport ζ →
      tsupport ζ ⊆ Ioo a b ×ˢ univ →
      ∫ t in Ioo a b, ∫ x, (fderiv ℝ ζ (t, x) (1, f t x) +
        1 / 2 * diffusionTerm (A t x) (fun y ↦ ζ (t, y)) x) * p t x = 0)
    (hw : ∀ t ∈ Ioo a b, ∀ x,
      p t x • w t x = p t x • f t x - (1 / 2 : ℝ) • rowDivergence (fun y ↦ p t y • A t y) x)
    (hν : ∀ t, (ν t : Measure E) = volume.withDensity fun x ↦ ENNReal.ofReal (p t x))
    (hνc : ContinuousOn ν (Icc a b)) (hwc : ∀ x, ContinuousOn (fun t ↦ w t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (w t)) (hφ : IsFlowOn w φ a b) {t : ℝ}
    (ht : t ∈ Icc a b) : (ν t : Measure E) = (ν a : Measure E).map (φ t) :=
  sorry

end ProbabilityFlow

/-! ## Layer 5: sampling error -/

section SamplingError

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 5.1: two flows started at the same point drift apart by at most the integral of the
difference of their fields along the first trajectory, weighted by the exponential of the
Lipschitz constant of the second field. -/
theorem IsFlowOn.dist_le_integral {u w φ ψ : ℝ → E → E} {K : ℝ≥0} {a b : ℝ}
    (huc : ContinuousOn (uncurry u) (Icc a b ×ˢ univ))
    (hwc : ∀ x, ContinuousOn (fun t ↦ w t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (w t)) (hφ : IsFlowOn u φ a b)
    (hψ : IsFlowOn w ψ a b) {t : ℝ} (ht : t ∈ Icc a b) (x : E) :
    dist (φ t x) (ψ t x) ≤
      ∫ s in a..t, Real.exp (K * (t - s)) * ‖u s (φ s x) - w s (φ s x)‖ :=
  sorry

/-- 5.2 (Benton, Deligiannidis and Doucet, Theorem 1, for `p = 2`): the Wasserstein distance
between the time-`b` pushforwards of a measure by two flows is at most the time integral of the
`Lᵖ` distance of their fields along the first flow, weighted by the exponential of the Lipschitz
constant of the second field. -/
theorem wassersteinEDist_map_flow_le [MeasurableSpace E] [BorelSpace E]
    [SecondCountableTopology E] {u w φ ψ : ℝ → E → E} {K : ℝ≥0} {a b : ℝ}
    (huc : ContinuousOn (uncurry u) (Icc a b ×ˢ univ))
    (hwc : ∀ x, ContinuousOn (fun t ↦ w t x) (Icc a b))
    (hK : ∀ t ∈ Icc a b, LipschitzWith K (w t)) (hφ : IsFlowOn u φ a b)
    (hψ : IsFlowOn w ψ a b) (hφm : Measurable (uncurry φ)) (hab : a ≤ b) (μ : Measure E)
    [IsFiniteMeasure μ] {p : ℝ≥0∞} (hp : 1 ≤ p) (hp' : p ≠ ∞) :
    wassersteinEDist p (μ.map (φ b)) (μ.map (ψ b)) ≤
      ∫⁻ t in Ioo a b, ENNReal.ofReal (Real.exp (K * (b - t))) *
        (∫⁻ x, ‖u t x - w t x‖ₑ ^ p.toReal ∂μ.map (φ t)) ^ (1 / p.toReal) :=
  sorry

end SamplingError

end TauCetiRoadmap.FlowMatching

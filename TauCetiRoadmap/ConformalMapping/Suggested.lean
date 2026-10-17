import Mathlib
import TauCeti.Analysis.Complex.Conformal.Caratheodory
import TauCeti.Analysis.Complex.Conformal.BoundaryCorrespondence
import TauCeti.Analysis.Complex.Conformal.Jordan.Approach
import TauCeti.Analysis.Complex.Conformal.SchwarzChristoffel.Formula
import TauCeti.Analysis.Complex.Conformal.SchwarzChristoffel.PolygonalDomain

/-!
# Conformal mapping: representative native-provider consumers

**This file is not the roadmap and is not exhaustive.** The README is definitive. Its targets
remain broader than the examples here. The proved wrappers consume Tau Ceti L5/L6 results;
the final two signatures are owned targets with honest admissions.
The Jordan-domain provider proves the full homeomorphism of closures using the separate
extension-injectivity theorem in `Jordan/Approach.lean`.  The finite-index L6 wrapper preserves
the side, sector, and finite-limit nonvertex hypotheses of the polygonal-domain provider.
-/

namespace TauCetiRoadmap.ConformalMapping

open Bornology Complex Filter Metric Set Topology UpperHalfPlane TauCeti

/-- The bounded Jordan-domain L5 theorem: a conformal image of the disc has a continuous
extension to the closed disc and remains bijective on the open disc.  This is the native
Carathéodory provider's exact conclusion; injectivity on the closed disc is not asserted. -/
theorem L5_continuous_extension_and_interior_bijection {Ω : Set ℂ}
    (hΩo : IsOpen Ω) (hΩc : IsConnected Ω) (hΩb : IsBounded Ω)
    (hΩJ : TauCeti.IsJordanCurve (frontier Ω)) :
    ∃ g : ℂ → ℂ, ContinuousOn g (closedBall 0 1) ∧
      DifferentiableOn ℂ g (ball 0 1) ∧ BijOn g (ball 0 1) Ω := by
  exact TauCeti.exists_continuousOn_closedBall_bijOn_ball_of_isJordanCurve_frontier
    hΩo hΩc hΩb hΩJ

/-- The full Jordan-domain boundary correspondence, including injectivity on the closed disc.
This consumes the native theorem that derives closed-disc injectivity from Jordan approach regions.
-/
theorem L5_closed_disc_homeomorphism {Ω : Set ℂ}
    (hΩo : IsOpen Ω) (hΩc : IsConnected Ω) (hΩb : IsBounded Ω)
    (hΩJ : TauCeti.IsJordanCurve (frontier Ω)) :
    ∃ g : ℂ → ℂ, ContinuousOn g (closedBall 0 1) ∧
      DifferentiableOn ℂ g (ball 0 1) ∧ BijOn g (ball 0 1) Ω ∧
      ∃ e : closedBall (0 : ℂ) 1 ≃ₜ closure Ω,
        ∀ z : closedBall (0 : ℂ) 1, (e z : ℂ) = g z := by
  exact TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier
    hΩo hΩc hΩb hΩJ

/-- Generic closure correspondence for any bounded `U`.  The Jordan-domain L5 consumer above
obtains extension injectivity from the native `Jordan/Approach.lean` result. -/
noncomputable def L5_closure_homeomorph_of_injective_extension {U : Set ℂ} {f F : ℂ → ℂ}
    (hUb : IsBounded U) (hFc : ContinuousOn F (closure U)) (hFf : EqOn F f U)
    (hFi : InjOn F (closure U)) : closure U ≃ₜ closure (f '' U) :=
  TauCeti.closureHomeomorph hUb hFc hFf hFi

/-- Finite-index Schwarz--Christoffel formula, specialized to `Fin n` without changing the
native side, corner, derivative, or infinity hypotheses. It only specializes the index type;
it does not construct polygon local geometry. The normalization point lies in the
upper half-plane, hence is not one of the finite real prevertices. -/
theorem L6_fin_sc_formula (n : ℕ) (a e : Fin n → ℝ) (ha : Function.Injective a)
    (he : ∀ i, e i ∈ Ioo (-1 : ℝ) 1) (z₀ : UpperHalfPlane) {f : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f upperHalfPlaneSet)
    (hfn : ∀ z ∈ upperHalfPlaneSet, deriv f z ≠ 0)
    (hside : ∀ x : ℝ, (∀ i, a i ≠ x) → ∃ r > 0, ∃ q b : ℂ, b ≠ 0 ∧
      ContinuousOn f (Metric.ball (x : ℂ) r ∩ {z : ℂ | 0 ≤ z.im}) ∧
      InjOn f (Metric.ball (x : ℂ) r ∩ {z : ℂ | 0 ≤ z.im}) ∧
      (∀ z ∈ Metric.ball (x : ℂ) r, z.im = 0 → ((f z - q) / b).im = 0) ∧
      ∀ z ∈ Metric.ball (x : ℂ) r, 0 < z.im → 0 < ((f z - q) / b).im)
    (hcorner : ∀ i, ∃ r > 0, ∃ b : ℂ, b ≠ 0 ∧
      ContinuousOn f (Metric.ball ((a i : ℝ) : ℂ) r ∩ {z : ℂ | 0 ≤ z.im}) ∧
      InjOn f (Metric.ball ((a i : ℝ) : ℂ) r ∩ {z : ℂ | 0 ≤ z.im}) ∧
      (∀ z ∈ Metric.ball ((a i : ℝ) : ℂ) r, 0 < z.im →
        |((f z - f (a i : ℂ)) / b).arg| < (e i + 1) * Real.pi / 2) ∧
      ∀ z ∈ Metric.ball ((a i : ℝ) : ℂ) r, z.im = 0 → f z ≠ f (a i : ℂ) →
        |((f z - f (a i : ℂ)) / b).arg| = (e i + 1) * Real.pi / 2)
    {L : ℂ} (hinfty : Tendsto (fun z => z * logDeriv (deriv f) z)
      (cobounded ℂ ⊓ 𝓟 upperHalfPlaneSet) (𝓝 L)) :
    EqOn f (fun z => deriv f z₀ / schwarzChristoffelIntegrand a e z₀ *
      schwarzChristoffelPrimitive a e z₀ z + f z₀) upperHalfPlaneSet := by
  exact TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_boundary
    a e ha he z₀ hf hfn hside hcorner hinfty

/-- The excluded finite limit value cannot equal a prescribed finite vertex value. -/
theorem L6_finite_limit_not_vertex {n : ℕ} (a : Fin n → ℝ) {p : ℂ}
    {v : Fin n → ℂ} {f : ℂ → ℂ} (hfv : ∀ i, f (a i) = v i)
    (hpf : p ∉ f '' {z : ℂ | 0 ≤ z.im}) (i : Fin n) : p ≠ v i := by
  intro hpv
  apply hpf
  refine ⟨(a i : ℂ), by simp, ?_⟩
  rw [hfv i, hpv]

/-- A normalization point in the upper half-plane is distinct from every real finite prevertex. -/
theorem L6_normalization_point_not_prevertex {n : ℕ} (z₀ : UpperHalfPlane)
    (a : Fin n → ℝ) (i : Fin n) : (z₀ : ℂ) ≠ (a i : ℂ) := by
  intro h
  have hpos := z₀.im_pos
  have him : z₀.im = 0 := by simpa using congrArg Complex.im h
  rw [him] at hpos
  exact (lt_irrefl 0 hpos)

/-- Finite-index Schwarz--Christoffel representation for a conformal map onto a domain with
locally straight sides and sector corners.  The finite limit `p` at infinity is excluded from the
closed-upper-half-plane image, so it is not one of the finite vertex values. -/
theorem L6_fin_polygonal_domain_finite_limit (n : ℕ) (U : Set ℂ) (a e : Fin n → ℝ)
    (ha : Function.Injective a) (he : ∀ i, e i ∈ Ioo (-1 : ℝ) 1)
    (z₀ : UpperHalfPlane) {v : Fin n → ℂ} {p : ℂ} {f : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f upperHalfPlaneSet)
    (hfc : ContinuousOn f {z : ℂ | 0 ≤ z.im})
    (hfi : InjOn f {z : ℂ | 0 ≤ z.im})
    (hfU : f '' upperHalfPlaneSet = U) (hfv : ∀ i, f (a i) = v i)
    (hp : Tendsto f (cobounded ℂ ⊓ 𝓟 {z : ℂ | 0 ≤ z.im}) (𝓝 p))
    (hpf : p ∉ f '' {z : ℂ | 0 ≤ z.im})
    (hside : ∀ w ∈ frontier U, (∀ i, w ≠ v i) → ∃ ρ > 0, ∃ q b : ℂ, b ≠ 0 ∧
      ∀ z ∈ ball w ρ, (z ∈ U ↔ 0 < ((z - q) / b).im))
    (hcorner : ∀ i, ∃ ρ > 0, ∃ b : ℂ, b ≠ 0 ∧ ∀ z ∈ ball (v i) ρ, z ≠ v i →
      (z ∈ U ↔ |((z - v i) / b).arg| < (e i + 1) * Real.pi / 2)) :
    EqOn f (fun z => deriv f z₀ / schwarzChristoffelIntegrand a e z₀ *
      schwarzChristoffelPrimitive a e z₀ z + f z₀) upperHalfPlaneSet := by
  exact TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_domain
    a e ha he z₀ hf hfc hfi hfU hfv hp hpf hside hcorner

/-- The chosen-map closure correspondence: the extension agrees with the specified f.
This is an owned integration target over the native extension and injectivity providers. -/
theorem L5_chosen_map_closed_disc_homeomorphism {Ω : Set ℂ} {f : ℂ → ℂ}
    {c : ℂ} {r : ℝ} (hr : 0 < r) (hΩ : TauCeti.IsJordanDomain Ω)
    (hf : DifferentiableOn ℂ f (ball c r)) (hbij : BijOn f (ball c r) Ω) :
    ∃ F : ℂ → ℂ, ContinuousOn F (closedBall c r) ∧ EqOn F f (ball c r) ∧
      ∃ e : closedBall c r ≃ₜ closure Ω,
        ∀ z : closedBall c r, (e z : ℂ) = F z := by
  sorry

/-- Full ambient Jordan separation, with no local-line or boundary-regularity premise.
The two displayed components exhaust the complement, and the bounded one is the filled interior.
This is a new target; the native conditional-frontier and locally-straight results are inputs. -/
theorem L5_jordan_separation {C : Set ℂ} (hC : TauCeti.IsJordanCurve C) :
    ∃ a ∈ Cᶜ, ∃ b ∈ Cᶜ,
      connectedComponentIn Cᶜ a ≠ connectedComponentIn Cᶜ b ∧
      IsBounded (connectedComponentIn Cᶜ a) ∧
      ¬ IsBounded (connectedComponentIn Cᶜ b) ∧
      connectedComponentIn Cᶜ a = filledHull C \ C ∧
      IsOpen (connectedComponentIn Cᶜ a) ∧ IsConnected (connectedComponentIn Cᶜ a) ∧
      frontier (connectedComponentIn Cᶜ a) = C ∧
      frontier (connectedComponentIn Cᶜ b) = C ∧
      ∀ z ∈ Cᶜ, connectedComponentIn Cᶜ z = connectedComponentIn Cᶜ a ∨
        connectedComponentIn Cᶜ z = connectedComponentIn Cᶜ b := by
  sorry

end TauCetiRoadmap.ConformalMapping

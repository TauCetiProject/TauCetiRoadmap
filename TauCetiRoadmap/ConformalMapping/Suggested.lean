import Mathlib
import TauCeti.Analysis.Complex.Conformal.Jordan.Domain
import TauCeti.Analysis.Complex.Conformal.Hyperbolic.Distance
import TauCeti.Analysis.Complex.Conformal.SchwarzChristoffel.Primitive
import TauCeti.Analysis.Contour.PiecewiseC1On
import TauCeti.Analysis.Contour.Winding.Number.Basic

/-!
# Conformal mapping: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, so that the finished
roadmap is tested against exactly these statements.

The headline theorems of Layers 0–4 that the pinned Tau Ceti already proves are not restated:
Hurwitz's theorem for injective limits (`TauCeti.hurwitz_injOn`), Montel's criterion
(`TauCeti.isCompact_closure_range_iff_isLocallyBoundedOn`), the infinitesimal Schwarz–Pick
inequality (`TauCeti.norm_deriv_div_one_sub_norm_sq_le`), the Riemann mapping theorem
(`TauCeti.riemannMapping`), the reflection principle
(`TauCeti.exists_differentiableOn_eqOn_conj_of_symmetric`), the Carathéodory correspondence
(`TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`) and the
Schwarz–Christoffel theorem for bounded polygonal Jordan domains
(`TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`).

The continuous Jordan index theorem (§5.6) and continuous-boundary argument principle (§5.7)
use the real-body argument-lift definition `continuousIndex` below, on native functions and
intervals. The compactness criterion (§1.1) uses native continuous maps. All headline theorems
listed here are statable at the pins; none requires an unstated carrier. The integral winding
number is used only for piecewise-`C¹` contours, not for arbitrary continuous loops.
-/

namespace TauCetiRoadmap.ConformalMapping

open Bornology Complex Filter Metric Set Topology UpperHalfPlane TauCeti

/-! ## Layer 1: normal families -/

/-- A family of holomorphic maps into a proper complex normed space is compact in the
compact-open topology precisely when it is closed and bounded uniformly on each compact subset
of its open domain (Conway, VII.2.9). Ambient representatives impose holomorphy only on `Ω`. -/
theorem compact_holomorphic_family {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℂ E] [ProperSpace E] (Ω : TopologicalSpace.Opens ℂ)
    (S : Set C(Ω, E))
    (hS : ∀ f ∈ S, ∃ F : ℂ → E, DifferentiableOn ℂ F Ω ∧ ∀ z : Ω, f z = F z) :
    IsCompact S ↔ IsClosed S ∧
      ∀ K : Set ℂ, K ⊆ Ω → IsCompact K → ∃ M : ℝ,
        ∀ f ∈ S, ∀ z : Ω, (z : ℂ) ∈ K → ‖f z‖ ≤ M := by
  sorry

/-! ## Layer 2: Schwarz–Pick and Poincaré geometry -/

/-- **The Cayley comparison of the two hyperbolic metrics.** Mathlib's distance on the upper
half-plane is twice the disc hyperbolic distance `TauCeti.hyperbolicDist` of the Cayley images
`c z = (z − i)/(z + i)`: the disc distance `Real.artanh |z − w|/|1 − w̄ z|` carries the
infinitesimal metric `|dz|/(1 − |z|²)` and the half-plane distance carries `|dz|/Im z`, which is
twice its Cayley transport. For `z = i`, `w = 2i` both sides equal `log 2`. -/
theorem upperHalfPlane_dist_eq_two_mul_hyperbolicDist (z w : UpperHalfPlane) :
    dist z w = 2 * TauCeti.hyperbolicDist (((z : ℂ) - Complex.I) / ((z : ℂ) + Complex.I))
      (((w : ℂ) - Complex.I) / ((w : ℂ) + Complex.I)) := by
  sorry

/-! ## Layer 4: analytic continuation, reflection and removability -/

/-- **Removability of a finite-length arc.** Let `γ` be continuous and injective on `[a, b]`,
`a < b`, with finite variation (a rectifiable Jordan arc). A function continuous on an open
`V ⊆ ℂ` and holomorphic off the arc is holomorphic on `V`. The hypothesis is finite length of the
arc, not smoothness; the proof is Morera's theorem with a grid cover of the arc
(Besicovitch, Proc. London Math. Soc. (2) 32 (1931), the finite-length case). -/
theorem differentiableOn_of_continuousOn_of_differentiableOn_diff_rectifiable_arc
    {V : Set ℂ} {F : ℂ → ℂ} {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hγc : ContinuousOn γ (Icc a b)) (hγi : InjOn γ (Icc a b))
    (hγv : eVariationOn γ (Icc a b) ≠ ⊤)
    (hV : IsOpen V) (hFc : ContinuousOn F V)
    (hFd : DifferentiableOn ℂ F (V \ γ '' Icc a b)) :
    DifferentiableOn ℂ F V := by
  sorry

/-! ## Layer 5: Carathéodory correspondence, Jordan separation and boundary index -/

/-- **The closed-disc homeomorphism of a chosen Riemann map.** For a holomorphic bijection `f` of
the disc `ball c r`, `0 < r`, onto a Jordan domain `Ω`, the continuous extension `F` of this same
`f` to the closed disc exists and is a homeomorphism of `closedBall c r` onto `closure Ω`.
This assembles the pinned extension, boundary-injectivity and closure-homeomorphism providers for a
map fixed in advance rather than for the existentially chosen map of
`TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`
(Pommerenke, *Boundary Behaviour of Conformal Maps*, Thm 2.6). -/
theorem chosen_map_closed_disc_homeomorphism {Ω : Set ℂ} {f : ℂ → ℂ}
    {c : ℂ} {r : ℝ} (hr : 0 < r) (hΩ : TauCeti.IsJordanDomain Ω)
    (hf : DifferentiableOn ℂ f (ball c r)) (hbij : BijOn f (ball c r) Ω) :
    ∃ F : ℂ → ℂ, ContinuousOn F (closedBall c r) ∧ EqOn F f (ball c r) ∧
      ∃ e : closedBall c r ≃ₜ closure Ω,
        ∀ z : closedBall c r, (e z : ℂ) = F z := by
  sorry

/-- **The Jordan curve theorem in the plane.** The complement of a Jordan curve `C ⊆ ℂ` has
exactly two connected components, one bounded and one unbounded; the bounded one is
`filledHull C \ C`, it is open and connected, and both components have frontier `C`. No
smoothness, polygonality or locally straight point is assumed (Thomassen, Amer. Math. Monthly 99
(1992), Theorem 2.12, p. 122). -/
theorem jordan_separation {C : Set ℂ} (hC : TauCeti.IsJordanCurve C) :
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

/-- The integer argument increment of a continuous closed loop avoiding `w` on `[a,b]`.
Choose the integer realized by a continuous real argument lift; outside these hypotheses, or
if there is no such integer, return zero. On the stated domain the integer exists and is
independent of the lift, including for loops of infinite length. -/
noncomputable def continuousIndex (γ : ℝ → ℂ) (a b : ℝ) (w : ℂ) : ℤ := by
  classical
  exact if h : ∃ n : ℤ, a ≤ b ∧ ContinuousOn γ (Icc a b) ∧ γ a = γ b ∧
      w ∉ γ '' Icc a b ∧ ∃ θ : ℝ → ℝ, ContinuousOn θ (Icc a b) ∧
      (∀ t ∈ Icc a b, γ t - w = (‖γ t - w‖ : ℂ) * exp (Complex.I * (θ t : ℂ))) ∧
      θ b - θ a = 2 * Real.pi * (n : ℝ)
    then h.choose else 0

/-- Every continuous Jordan loop has one index sign on its bounded complementary component
and index zero outside its filled hull. No rectifiability or differentiability is assumed. -/
theorem continuous_jordan_index {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hc : ContinuousOn γ (Icc a b)) (hclosed : γ a = γ b)
    (hi : InjOn γ (Ico a b)) :
    TauCeti.IsJordanCurve (γ '' Icc a b) ∧
      ∃ σ : ℤ, (σ = 1 ∨ σ = -1) ∧
        (∀ w ∈ filledHull (γ '' Icc a b) \ γ '' Icc a b,
          continuousIndex γ a b w = σ) ∧
        ∀ w ∉ filledHull (γ '' Icc a b), continuousIndex γ a b w = 0 := by
  sorry

/-- For a function continuous on a closed Jordan domain and holomorphic inside, the index of
its image of the positively oriented boundary about an avoided value equals its interior zero
count with analytic multiplicities. The finitely supported sum includes every interior point. -/
theorem continuous_boundary_argument_principle {Ω : Set ℂ} {f : ℂ → ℂ}
    (hΩ : TauCeti.IsJordanDomain Ω) (hc : ContinuousOn f (closure Ω))
    (hd : DifferentiableOn ℂ f Ω) {γ : ℝ → ℂ}
    (hγ : ContinuousOn γ (Icc 0 1)) (hclosed : γ 0 = γ 1)
    (hi : InjOn γ (Ico 0 1)) (htrace : γ '' Icc 0 1 = frontier Ω)
    (hpositive : ∀ z ∈ Ω, continuousIndex γ 0 1 z = 1)
    {w : ℂ} (hw : w ∉ f '' frontier Ω) :
    continuousIndex (f ∘ γ) 0 1 w =
      ∑ᶠ z : Ω, (analyticOrderNatAt (fun x => f x - w) (z : ℂ) : ℤ) := by
  sorry

/-- **The Jordan index theorem for piecewise-`C¹` contours.** A closed piecewise-`C¹` curve
`γ` on `[a, b]`, `a < b`, injective on `[a, b)`, has a Jordan curve `C = γ '' [a, b]` as its trace,
and its winding number `TauCeti.Contour.windingNumber γ a b w` is one sign `σ ∈ {1, −1}` at every
point `w` of the bounded complementary component `filledHull C \ C` and `0` off `filledHull C`.
The sign depends on the parametrization and is a conclusion: the counterclockwise unit circle gives
`σ = 1`, its reversal `σ = −1`. This is the piecewise-`C¹` case of the continuous Jordan index
theorem `continuous_jordan_index`, through the integral comparison in README §5.5. -/
theorem jordan_index_of_isPiecewiseC1On {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hγ : TauCeti.Contour.IsPiecewiseC1On γ a b) (hclosed : γ a = γ b)
    (hinj : InjOn γ (Ico a b)) :
    TauCeti.IsJordanCurve (γ '' Icc a b) ∧
      ∃ σ : ℤ, (σ = 1 ∨ σ = -1) ∧
        (∀ w ∈ filledHull (γ '' Icc a b) \ γ '' Icc a b,
          TauCeti.Contour.windingNumber γ a b w = σ) ∧
        ∀ w ∉ filledHull (γ '' Icc a b), TauCeti.Contour.windingNumber γ a b w = 0 := by
  sorry

/-- **Darboux boundary injectivity for Jordan domains.** Let `Ω` be a Jordan domain and `f`
continuous on `closure Ω`, holomorphic on `Ω` and injective on `frontier Ω`. Then `f '' frontier Ω`
is a Jordan curve, `f` maps `Ω` bijectively onto the bounded complementary component of that
curve, and `f` restricts to a homeomorphism of `closure Ω` onto the closure of that component.
The continuous Jordan frontier is arbitrary; nothing is assumed about `f` on the boundary beyond
continuity and injectivity (Burckel, *An Introduction to Classical Complex Analysis I*, Ch. IX,
the Darboux–Picard theorem). -/
theorem darboux_boundary_injectivity {Ω : Set ℂ} {f : ℂ → ℂ} (hΩ : TauCeti.IsJordanDomain Ω)
    (hfc : ContinuousOn f (closure Ω)) (hfd : DifferentiableOn ℂ f Ω)
    (hfi : InjOn f (frontier Ω)) :
    TauCeti.IsJordanCurve (f '' frontier Ω) ∧
      BijOn f Ω (filledHull (f '' frontier Ω) \ f '' frontier Ω) ∧
      ∃ e : closure Ω ≃ₜ closure (filledHull (f '' frontier Ω) \ f '' frontier Ω),
        ∀ z : closure Ω, (e z : ℂ) = f z := by
  sorry

/-! ## Layer 6: Schwarz–Christoffel theory for polygonal Jordan domains -/

/-- **Schwarz–Christoffel necessity with source infinity at a finite vertex.** Let `f` be
holomorphic on the upper half-plane, continuous and injective on the closed half-plane, with
image `U` and vertex values `f (a i) = v i` at distinct real prevertices `a i` for the vertices
`i ≠ k`, and let `f` tend to the remaining vertex value `v k` at infinity in the closed
half-plane, `v k` not being a value of `f` there. Suppose every nonvertex frontier point of `U`
has a local half-plane model and every vertex `v i` a local sector model of opening
`(e i + 1) π`, `e i ∈ (−1, 1)`. Then on the upper half-plane `f` is an affine image of the
Schwarz–Christoffel primitive of the prevertices `a` and exponents `e` restricted to `i ≠ k`,
with constants read off at `z₀`, and the restricted exponents sum to `−2 − e k`
(Driscoll–Trefethen, *Schwarz–Christoffel Mapping*, Theorem 2.1, p. 10, equation (2.2)). -/
theorem eqOn_const_mul_schwarzChristoffelPrimitive_add_of_source_infinity_at_vertex
    {n : ℕ} {k : Fin n} (a : {i : Fin n // i ≠ k} → ℝ) (e : Fin n → ℝ)
    (ha : Function.Injective a) (he : ∀ i, e i ∈ Ioo (-1 : ℝ) 1) (z₀ : UpperHalfPlane)
    {U : Set ℂ} {v : Fin n → ℂ} {f : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f upperHalfPlaneSet)
    (hfc : ContinuousOn f {z : ℂ | 0 ≤ z.im})
    (hfi : InjOn f {z : ℂ | 0 ≤ z.im})
    (hfU : f '' upperHalfPlaneSet = U)
    (hfv : ∀ i : {i : Fin n // i ≠ k}, f (a i) = v i)
    (hk : Tendsto f (cobounded ℂ ⊓ 𝓟 {z : ℂ | 0 ≤ z.im}) (𝓝 (v k)))
    (hvk : v k ∉ f '' {z : ℂ | 0 ≤ z.im})
    (hside : ∀ w ∈ frontier U, (∀ i, w ≠ v i) → ∃ ρ > 0, ∃ q b : ℂ, b ≠ 0 ∧
      ∀ z ∈ ball w ρ, (z ∈ U ↔ 0 < ((z - q) / b).im))
    (hcorner : ∀ i, ∃ ρ > 0, ∃ b : ℂ, b ≠ 0 ∧ ∀ z ∈ ball (v i) ρ, z ≠ v i →
      (z ∈ U ↔ |((z - v i) / b).arg| < (e i + 1) * Real.pi / 2)) :
    EqOn f (fun z => deriv f z₀ / schwarzChristoffelIntegrand a (fun i => e i) z₀ *
        schwarzChristoffelPrimitive a (fun i => e i) z₀ z + f z₀) upperHalfPlaneSet ∧
      ∑ i : {i : Fin n // i ≠ k}, e i = -2 - e k := by
  sorry

end TauCetiRoadmap.ConformalMapping

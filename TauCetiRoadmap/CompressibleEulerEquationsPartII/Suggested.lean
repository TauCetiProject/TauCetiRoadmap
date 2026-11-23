module

public import TauCetiRoadmap.CompressibleEulerEquations.Suggested
public import TauCetiRoadmap.LorentzianGeometry.Suggested

/-!
# Compressible Euler equations, Part II: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap. The admitted proofs are targets, not claimed implementations; definitions below have
explicit bodies.

The carriers are those of the suppliers' target files: CompressibleEulerEquations for the
equations of state, classical solutions, the acoustical cone field and the time-parametrised
future domain of dependence `futureDomainOfDependence` in a subset of a half-space, and
LorentzianGeometry for Lorentzian form fields on subsets and their domains of dependence
`TimeOrientedLorentzianFieldOn.futureDomainOfDependenceIn`.

Stated here:

* acoustical functions (Conventions) and the characteristic boundary of a set (§2.2);
* the comparison of the two domains of dependence of data on an open regular set (§2.1);
* the eikonal description of the development of data inside a slab (§2.3);
* the plane-symmetric centered rarefaction wave of a polytropic gas as a classical solution with
  its acoustical function (§4.2).

Targets of the README with no Lean form here: the null-geodesic generators of the characteristic
boundary (§2.2) and the outgoing acoustical functions and acoustical coordinates built from null
geodesics (§§1.2–1.3), because the suppliers' target files have no geodesic of a `C¹` metric;
characteristic data sets, their compatibility conditions and their developments (Layer 3), whose
inner equations and jet conditions need the symbol calculus of CompressibleEulerEquations Layer 2
along a hypersurface, which its target file does not state; and centered null foliations (§4.1).
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.CompressibleEulerEquationsPartII

open Set Filter Topology
open TauCetiRoadmap.CompressibleEulerEquations TauCetiRoadmap.LorentzianGeometry
open scoped ContDiff Manifold

/-- Euclidean space `ℝⁿ`, the spatial carrier `E`. -/
local notation "𝔼" n:max => EuclideanSpace ℝ (Fin n)

variable {n : ℕ}

/-! ## Layer 1: acoustical functions -/

/-- An acoustical function on `W ⊆ ℝ × E` for the acoustical field `(c, v)` of `U` (Conventions):
`u` is `C¹` on `W`, its spatial gradient `∇u` is nonzero, and `∂_t u + v·∇u = c |∇u|`, that is,
`du` is future null for the acoustical metric. Derivatives are taken within `W`; `du (1, v)` is
`∂_t u + v·∇u`, and the norm of the restriction of `du` to `E` is `|∇u|`. -/
def IsAcousticalFunction (P : EquationOfState) (U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ)
    (W : Set (ℝ × 𝔼 n)) (u : ℝ × 𝔼 n → ℝ) : Prop :=
  ContDiffOn ℝ 1 u W ∧ ∀ p ∈ W,
    (fderivWithin ℝ u W p).comp (ContinuousLinearMap.inr ℝ ℝ (𝔼 n)) ≠ 0 ∧
      fderivWithin ℝ u W p (1, (P.acousticalCone U p).2) =
        (P.acousticalCone U p).1 * ‖(fderivWithin ℝ u W p).comp (ContinuousLinearMap.inr ℝ ℝ (𝔼 n))‖

/-! ## Layer 2: the characteristic boundary of a development -/

/-- The characteristic boundary of `D` after time `t₀` (§2.2): its frontier in `ℝ × E` within
`{t > t₀}`. -/
def characteristicBoundary (t₀ : ℝ) (D : Set (ℝ × 𝔼 n)) : Set (ℝ × 𝔼 n) :=
  frontier D ∩ {p | t₀ < p.1}

/-- **Comparison with horizons** (§2.1). Let `U` be a classical solution on the slab
`O = [t₀, t₀ + T) × E` with sound speed and velocity bounded on `[t₀, t₂] × E` for every
`t₂ < t₀ + T`, let `Ô` be open with `Ô ∩ H_{t₀} = O`, and let `𝔤` be the acoustical form of a `C¹`
field `(c̃, ṽ)` on `Ô`, `c̃ > 0`, extending the acoustical field of `U`, time-oriented by
`B̃ = ∂_t + ṽ`. For `S ⊆ E` open and regular (`interior (closure S) = S`), the development
`D⁺_O({t₀} × S)` and the domain of dependence `D⁺_Ô({t₀} × closure S)` of LorentzianGeometry §12.6
satisfy `D = interior Ď` after time `t₀`. -/
theorem futureDomainOfDependence_inter_eq_interior [NeZero n] (P : EquationOfState) {t₀ T : ℝ}
    (hT : 0 < T) {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ} (hU : P.IsSolution (Ico t₀ (t₀ + T) ×ˢ univ) U)
    (hbdd : ∀ t₂ < t₀ + T, ∃ C : ℝ, ∀ p ∈ Icc t₀ t₂ ×ˢ (univ : Set (𝔼 n)),
      |(P.acousticalCone U p).1| ≤ C ∧ ‖(P.acousticalCone U p).2‖ ≤ C)
    {Ô : Set (ℝ × 𝔼 n)} (hÔ : IsOpen Ô) (hÔO : Ô ∩ {p | t₀ ≤ p.1} = Ico t₀ (t₀ + T) ×ˢ univ)
    {c : ℝ × 𝔼 n → ℝ} {v : ℝ × 𝔼 n → 𝔼 n} (hc : ContDiffOn ℝ 1 c Ô) (hv : ContDiffOn ℝ 1 v Ô)
    (hc_pos : ∀ p ∈ Ô, 0 < c p)
    (hcv : ∀ p ∈ Ico t₀ (t₀ + T) ×ˢ (univ : Set (𝔼 n)), (c p, v p) = P.acousticalCone U p)
    (𝔤 : TimeOrientedLorentzianFieldOn (I := 𝓘(ℝ, ℝ × 𝔼 n)) Ô)
    (h𝔤 : ∀ p ∈ Ô, ∀ X Y : ℝ × 𝔼 n,
      𝔤.form p X Y = -(c p) ^ 2 * X.1 * Y.1 + inner ℝ (X.2 - X.1 • v p) (Y.2 - Y.1 • v p))
    (hB : ∀ p ∈ Ô, 𝔤.timeField p = ((1 : ℝ), v p))
    {S : Set (𝔼 n)} (hS : interior (closure S) = S) :
    futureDomainOfDependence (P.acousticalCone U) (Ico t₀ (t₀ + T) ×ˢ univ) ({t₀} ×ˢ S) ∩
        {p | t₀ < p.1} =
      interior (𝔤.futureDomainOfDependenceIn ({t₀} ×ˢ closure S)) ∩ {p | t₀ < p.1} := by
  sorry

/-- **Eikonal description of the characteristic boundary** (§2.3). Let `U` be a classical solution
on the slab `O₁ = [t₀, t₁) × E` with sound speed and velocity bounded on `[t₀, t₂] × E` for every
`t₂ < t₁`, and `u` a `C²` acoustical function on `O₁`. Then the development in `O₁` of the data on
`S = {u(t₀, ·) < 0}` is `{u < 0}`, and its characteristic boundary below `t₁` is `{u = 0}`. -/
theorem futureDomainOfDependence_eq_setOf_neg [NeZero n] (P : EquationOfState) {t₀ t₁ : ℝ}
    (ht : t₀ < t₁) {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ} (hU : P.IsSolution (Ico t₀ t₁ ×ˢ univ) U)
    (hbdd : ∀ t₂ < t₁, ∃ C : ℝ, ∀ p ∈ Icc t₀ t₂ ×ˢ (univ : Set (𝔼 n)),
      |(P.acousticalCone U p).1| ≤ C ∧ ‖(P.acousticalCone U p).2‖ ≤ C)
    {u : ℝ × 𝔼 n → ℝ} (hu₂ : ContDiffOn ℝ 2 u (Ico t₀ t₁ ×ˢ univ))
    (hu : IsAcousticalFunction P U (Ico t₀ t₁ ×ˢ univ) u) :
    futureDomainOfDependence (P.acousticalCone U) (Ico t₀ t₁ ×ˢ univ)
        ({t₀} ×ˢ {x | u (t₀, x) < 0}) = {p ∈ Ico t₀ t₁ ×ˢ univ | u p < 0} ∧
      characteristicBoundary t₀ {p ∈ Ico t₀ t₁ ×ˢ univ | u p < 0} ∩ {p | p.1 < t₁} =
        {p | p.1 ∈ Ioo t₀ t₁ ∧ u p = 0} := by
  sorry

/-! ## Layer 4: the plane-symmetric centered rarefaction wave -/

/-- The plane-symmetric centered rarefaction wave of the polytropic law `p = k₀ ρ^γ` connected to
the constant right state of sound speed `c_r` and velocity `v_r e₁` (§4.2): with
`w_r = c_r/(γ − 1) − v_r/2`, the sound speed is `c = ((γ − 1)/(γ + 1))(x¹/t + 2w_r)`, the
velocity `(2c/(γ − 1) − 2w_r) e₁`, the density `ρ = (c²/(k₀γ))^{1/(γ − 1)}` (so that
`c² = ∂_ρ p`), and the entropy the constant `s₀`. -/
def planeRarefaction [NeZero n] (k₀ γ c_r v_r s₀ : ℝ) (p : ℝ × 𝔼 n) : ℝ × 𝔼 n × ℝ :=
  let w_r := c_r / (γ - 1) - v_r / 2
  let c := ((γ - 1) / (γ + 1)) * (p.2 0 / p.1 + 2 * w_r)
  ((c ^ 2 / (k₀ * γ)) ^ (1 / (γ - 1)),
    (2 * c / (γ - 1) - 2 * w_r) • EuclideanSpace.single 0 1, s₀)

/-- **The plane-symmetric centered rarefaction wave** (§4.2). For the polytropic law
`p = k₀ ρ^γ`, `γ > 1`, a right state with `c_r > 0`, `λ_r = v_r + c_r` and
`0 < u* < λ_r + 2w_r`, the field `planeRarefaction` is a classical solution on the wedge
`{0 < t < t*, (λ_r − u*)t ≤ x¹ ≤ λ_r t}`, and `u′ = λ_r − x¹/t` is an acoustical function there. -/
theorem isSolution_planeRarefaction [NeZero n] (P : EquationOfState) {k₀ γ : ℝ} (hk₀ : 0 < k₀)
    (hγ : 1 < γ) (hstates : P.states = Ioi 0 ×ˢ univ)
    (hP : ∀ q ∈ P.states, P.pressure q = k₀ * q.1 ^ γ) {c_r v_r s₀ tstar ustar : ℝ}
    (hc_r : 0 < c_r) (htstar : 0 < tstar) (hustar : 0 < ustar)
    (hustar' : ustar < v_r + c_r + 2 * (c_r / (γ - 1) - v_r / 2)) :
    let W : Set (ℝ × 𝔼 n) := {p | 0 < p.1 ∧ p.1 < tstar ∧
      (v_r + c_r - ustar) * p.1 ≤ p.2 0 ∧ p.2 0 ≤ (v_r + c_r) * p.1}
    P.IsSolution W (planeRarefaction k₀ γ c_r v_r s₀) ∧
      IsAcousticalFunction P (planeRarefaction k₀ γ c_r v_r s₀) W
        (fun p => v_r + c_r - p.2 0 / p.1) := by
  sorry

end TauCetiRoadmap.CompressibleEulerEquationsPartII

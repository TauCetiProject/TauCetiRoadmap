module

public import Mathlib

/-!
# Compressible Euler equations, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need, each with a real body on a carrier that exists at the pins.

Carriers. Space is `EuclideanSpace ℝ (Fin n)` (written `𝔼 n` below) and spacetime `ℝ × 𝔼 n`. A
sound-cone field is a map `κ = (c, w) : ℝ × 𝔼 n → ℝ × 𝔼 n`. Equations of state, classical solutions
of the full Euler system, the acoustical cone field of a fluid field, and the time-parametrised
causal curves and future domains of dependence of a cone field are those of
CompressibleEulerEquations §§1.1, 1.3 and 3.1–3.3, restated here only because the pins have none.
For the acoustical form of a continuous field with `c > 0`, LorentzianGeometry §7.6 reduces its
domains of dependence in a subset to these time-parametrised ones, so the comparison of §2.1 is
stated with them on both sides.

Headline theorems stated here:
* existence of a `C²` acoustical function with prescribed initial values on a short time slab,
  uniqueness on a slab given the initial values, and the propagation equation for `κ`
  (§§1.2–1.3);
* the comparison of the domain of dependence of open data in a slab with the domain of dependence
  of the closed data in an open extension of the slab (§2.1);
* the eikonal description of the development of data inside a slab (§2.3);
* the plane-symmetric centered rarefaction wave of a polytropic gas as a classical solution with
  its acoustical function (§4.2).

Headline theorems not stated, and what each lacks at the pins:
* the construction of the outgoing acoustical function from the null geodesics issuing from
  `Σ_{t₀}` for as long as they do not cross (§1.2), the identification of the boundary of a domain
  of dependence with a Cauchy horizon (§2.1), and the achronal null-geodesic generators of the
  characteristic boundary (§2.2): the pins have the Christoffel symbols of a nondegenerate metric
  in linear coordinates (`TauCeti.Manifold.christoffelSecondKind`), hence the geodesic equation,
  but no geodesic flow with its domain of definition, and no chronological relation, edge or Cauchy
  horizon for a Lorentzian metric of class `C¹`, which these statements are about;
* the theory of characteristic data (Layer 3): its data sets are defined by the inner equation,
  built from the left kernel of the symbol of the Euler system along a null hypersurface, and by
  compatibility of every order, which compares formal jets of the Cauchy problem at the edge; the
  pins have neither, and its development, existence and Goursat theorems are about such data sets;
* centered rarefaction waves (§4.1), and the statement that the plane wave of §4.2 is one: the
  predicate of §4.1 is a chart of `[0, t*) × [0, u*] × (ℝ/2πℤ)^{n−1}` into the cylinder `𝔐/Λ_cyl`
  that is a `C^N` diffeomorphism for `t > 0` and collapses `{t = 0}` onto the edge, together with
  the extension of the solution to `t = 0` in the chart and the limit `κ′/t → 1`. The pins have
  no carrier for such singular charts, and encoding them on `Λ_cyl`-equivariant lifts would be a
  long ad hoc definition. For the plane wave, the conditions beyond `isSolution_planeRarefaction`
  are the computations of the Checks of README §4.2 (`κ′ = t`).
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.CompressibleEulerEquationsPartII

open Set Filter Topology
open scoped ContDiff

/-- Euclidean space `ℝⁿ`, the spatial carrier `E`. -/
local notation "𝔼" n:max => EuclideanSpace ℝ (Fin n)

/-! ## Conventions: the carriers of CompressibleEulerEquations -/

/-- An equation of state (CompressibleEulerEquations §1.1): an open set `states` of
density–entropy pairs `(ρ, s)` with `ρ > 0`, and a pressure law `P(ρ, s)`, smooth on `states`
with `∂_ρ P > 0` there. -/
structure EquationOfState where
  /-- The open set of admissible density–entropy pairs. -/
  states : Set (ℝ × ℝ)
  isOpen_states : IsOpen states
  states_subset : states ⊆ Ioi 0 ×ˢ univ
  /-- The pressure `P(ρ, s)`. -/
  pressure : ℝ × ℝ → ℝ
  contDiffOn_pressure : ContDiffOn ℝ ∞ pressure states
  deriv_pressure_pos : ∀ q ∈ states, 0 < deriv (fun ρ => pressure (ρ, q.2)) q.1

namespace EquationOfState

/-- The sound speed `c(ρ, s) = √(∂_ρ P(ρ, s))` (CompressibleEulerEquations §1.1). -/
def soundSpeed (P : EquationOfState) (q : ℝ × ℝ) : ℝ :=
  √(deriv (fun ρ => P.pressure (ρ, q.2)) q.1)

/-- Classical solution of the full compressible Euler system on `D ⊆ ℝ × E`
(CompressibleEulerEquations §1.3): `U = (ρ, v, s)` is `C¹` on `D` with `(ρ, s)` in `states`, and,
with `B = ∂_t + v·∇` (so that `fderivWithin ℝ U D q (1, v q)` is `(Bρ, Bv, Bs)` at `q`),
`Bρ = −ρ div v`, `⟪Bv, w⟫ = −ρ⁻¹ ∂_w (P(ρ, s))` for every `w ∈ E`, and `Bs = 0`. -/
def IsSolution (P : EquationOfState) {n : ℕ} (D : Set (ℝ × 𝔼 n))
    (U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ) : Prop :=
  ContDiffOn ℝ 1 U D ∧ (∀ q ∈ D, ((U q).1, (U q).2.2) ∈ P.states) ∧
    ∀ q ∈ D,
      (fderivWithin ℝ U D q (1, (U q).2.1)).1 =
          -(U q).1 * ∑ i, (fderivWithin ℝ U D q (0, EuclideanSpace.single i 1)).2.1 i ∧
        (∀ w : 𝔼 n, inner ℝ (fderivWithin ℝ U D q (1, (U q).2.1)).2.1 w =
          -((U q).1)⁻¹ * fderivWithin ℝ (fun r => P.pressure ((U r).1, (U r).2.2)) D q (0, w)) ∧
        (fderivWithin ℝ U D q (1, (U q).2.1)).2.2 = 0

/-- The acoustical cone field of a fluid field `U = (ρ, v, s)` (CompressibleEulerEquations
§§3.1–3.2): at each point, the sound speed `c(ρ, s)` and the velocity `v`. -/
def acousticalCone (P : EquationOfState) {n : ℕ} (U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ)
    (q : ℝ × 𝔼 n) : ℝ × 𝔼 n :=
  (P.soundSpeed ((U q).1, (U q).2.2), (U q).2.1)

end EquationOfState

variable {n : ℕ}

/-- A time-parametrised causal curve of the cone field `κ = (c, w)` in `D`
(CompressibleEulerEquations §3.2): an interval `J` (a single point allowed) and a map `x`, locally
Lipschitz on `J`, with `(t, x t) ∈ D` for `t ∈ J` and `|ẋ(t) − w(t, x(t))| ≤ c(t, x(t))` at almost
every `t ∈ J`. -/
def IsCausalCurve (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (D : Set (ℝ × 𝔼 n)) (J : Set ℝ) (x : ℝ → 𝔼 n) :
    Prop :=
  J.OrdConnected ∧ (∀ t ∈ J, (t, x t) ∈ D) ∧ LocallyLipschitzOn J x ∧
    ∀ᵐ t, t ∈ J → DifferentiableWithinAt ℝ x J t ∧
      ‖derivWithin x J t - (κ (t, x t)).2‖ ≤ (κ (t, x t)).1

/-- A past causal curve in `D` ending at `p` (CompressibleEulerEquations §3.3): a causal curve
whose interval has greatest element `t_p`, with `x(t_p) = x_p`. -/
def IsPastCausalCurve (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (D : Set (ℝ × 𝔼 n)) (p : ℝ × 𝔼 n) (J : Set ℝ)
    (x : ℝ → 𝔼 n) : Prop :=
  IsCausalCurve κ D J x ∧ IsGreatest J p.1 ∧ x p.1 = p.2

/-- Past-inextendibility in `D`, in the extension form of CompressibleEulerEquations §3.3 and
LorentzianGeometry §7.6: no past causal curve in `D` ending at `p`, on an interval containing
`J`, agrees with `x` on `J` unless its interval is `J`. -/
def IsPastInextendible (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (D : Set (ℝ × 𝔼 n)) (p : ℝ × 𝔼 n) (J : Set ℝ)
    (x : ℝ → 𝔼 n) : Prop :=
  ∀ (J' : Set ℝ) (y : ℝ → 𝔼 n), IsPastCausalCurve κ D p J' y → J ⊆ J' → EqOn y x J → J' = J

/-- The future domain of dependence `D⁺_D(S)` (CompressibleEulerEquations §3.3): the points
`p ∈ D` such that every past-inextendible past causal curve in `D` ending at `p` meets `S`. -/
def futureDomainOfDependence (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (D S : Set (ℝ × 𝔼 n)) :
    Set (ℝ × 𝔼 n) :=
  {p ∈ D | ∀ (J : Set ℝ) (x : ℝ → 𝔼 n), IsPastCausalCurve κ D p J x →
    IsPastInextendible κ D p J x → ∃ t ∈ J, (t, x t) ∈ S}

/-- An acoustical function on `W ⊆ ℝ × E` for the sound-cone field `κ = (c, v)` (Conventions):
`u` is `C¹` on `W`, its spatial gradient `∇u` is nonzero, and `∂_t u + v·∇u = c |∇u|`, that is,
`du` is future null for the acoustical metric of `(c, v)`. Derivatives are taken within `W`;
`du (1, v)` is `∂_t u + v·∇u`, and the norm of the restriction of `du` to `E` is `|∇u|`. -/
def IsAcousticalFunction (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (W : Set (ℝ × 𝔼 n)) (u : ℝ × 𝔼 n → ℝ) :
    Prop :=
  ContDiffOn ℝ 1 u W ∧ ∀ p ∈ W,
    (fderivWithin ℝ u W p).comp (ContinuousLinearMap.inr ℝ ℝ (𝔼 n)) ≠ 0 ∧
      fderivWithin ℝ u W p (1, (κ p).2) =
        (κ p).1 * ‖(fderivWithin ℝ u W p).comp (ContinuousLinearMap.inr ℝ ℝ (𝔼 n))‖

/-! ## Layer 1: the acoustical geometry of a solution -/

/-- **Existence of acoustical functions on a slab** (§1.2). Let `(c, v)` be a `C²` field with
`c > 0` on `O₁ = [t₀, t₁) × E` such that `c`, `v` and their first and second derivatives are
bounded on `[t₀, t₂] × E` for every `t₂ < t₁`, and let `u₀` be `C²` on `E` with bounded first and
second derivatives and `|∇u₀| ≥ δ > 0`. Then for some `τ ∈ (0, t₁ − t₀]` there is a `C²` acoustical
function `u` on `[t₀, t₀ + τ) × E` with `u(t₀, ·) = u₀`. -/
theorem exists_isAcousticalFunction_slab {c : ℝ × 𝔼 n → ℝ} {v : ℝ × 𝔼 n → 𝔼 n} {t₀ t₁ : ℝ}
    (ht : t₀ < t₁) (hc : ContDiffOn ℝ 2 c (Ico t₀ t₁ ×ˢ univ))
    (hv : ContDiffOn ℝ 2 v (Ico t₀ t₁ ×ˢ univ)) (hc_pos : ∀ p ∈ Ico t₀ t₁ ×ˢ univ, 0 < c p)
    (hbdd : ∀ t₂ < t₁, ∃ C : ℝ, ∀ p ∈ Icc t₀ t₂ ×ˢ (univ : Set (𝔼 n)),
      |c p| ≤ C ∧ ‖v p‖ ≤ C ∧
        ‖fderivWithin ℝ c (Ico t₀ t₁ ×ˢ univ) p‖ ≤ C ∧
        ‖fderivWithin ℝ v (Ico t₀ t₁ ×ˢ univ) p‖ ≤ C ∧
        ‖iteratedFDerivWithin ℝ 2 c (Ico t₀ t₁ ×ˢ univ) p‖ ≤ C ∧
        ‖iteratedFDerivWithin ℝ 2 v (Ico t₀ t₁ ×ˢ univ) p‖ ≤ C)
    {u₀ : 𝔼 n → ℝ} (hu₀ : ContDiff ℝ 2 u₀)
    (hu₀bdd : ∃ C : ℝ, ∀ x, ‖fderiv ℝ u₀ x‖ ≤ C ∧ ‖iteratedFDeriv ℝ 2 u₀ x‖ ≤ C)
    (hu₀low : ∃ δ > 0, ∀ x, δ ≤ ‖fderiv ℝ u₀ x‖) :
    ∃ τ ∈ Ioc 0 (t₁ - t₀), ∃ u : ℝ × 𝔼 n → ℝ,
      ContDiffOn ℝ 2 u (Ico t₀ (t₀ + τ) ×ˢ univ) ∧
        IsAcousticalFunction (fun p => (c p, v p)) (Ico t₀ (t₀ + τ) ×ˢ univ) u ∧
        ∀ x, u (t₀, x) = u₀ x := by
  sorry

/-- **Uniqueness of acoustical functions on a slab** (§1.2). Let `(c, v)` be a `C²` field with
`c > 0` on `O₁ = [t₀, t₁) × E`, with `c` and `|v|` bounded on `[t₀, t₂] × E` for every
`t₂ < t₁`. Two `C²` acoustical functions on `O₁` with the same values on `Σ_{t₀}` agree on
`O₁`. -/
theorem IsAcousticalFunction.eqOn_slab {c : ℝ × 𝔼 n → ℝ} {v : ℝ × 𝔼 n → 𝔼 n} {t₀ t₁ : ℝ}
    (hc : ContDiffOn ℝ 2 c (Ico t₀ t₁ ×ˢ univ)) (hv : ContDiffOn ℝ 2 v (Ico t₀ t₁ ×ˢ univ))
    (hc_pos : ∀ p ∈ Ico t₀ t₁ ×ˢ univ, 0 < c p)
    (hbdd : ∀ t₂ < t₁, ∃ C : ℝ, ∀ p ∈ Icc t₀ t₂ ×ˢ (univ : Set (𝔼 n)), |c p| ≤ C ∧ ‖v p‖ ≤ C)
    {u u' : ℝ × 𝔼 n → ℝ} (hu₂ : ContDiffOn ℝ 2 u (Ico t₀ t₁ ×ˢ univ))
    (hu'₂ : ContDiffOn ℝ 2 u' (Ico t₀ t₁ ×ˢ univ))
    (hu : IsAcousticalFunction (fun p => (c p, v p)) (Ico t₀ t₁ ×ˢ univ) u)
    (hu' : IsAcousticalFunction (fun p => (c p, v p)) (Ico t₀ t₁ ×ˢ univ) u')
    (h₀ : ∀ x, u (t₀, x) = u' (t₀, x)) :
    EqOn u u' (Ico t₀ t₁ ×ˢ univ) := by
  sorry

/-- **The propagation equation for `κ`** (§1.3). Let `(c, v)` be a `C²` field on an open set
`W ⊆ ℝ × E` and `u` a `C²` acoustical function on `W`. With `∇u` the spatial gradient,
`κ = 1/|∇u|`, `T̂ = κ ∇u`, `T = κ T̂` and `L = ∂_t + v − c T̂`, at every point of `W`
`L κ = T̂ʲ T(vʲ) − T(c)`. -/
theorem IsAcousticalFunction.transport_kappa {c : ℝ × 𝔼 n → ℝ} {v : ℝ × 𝔼 n → 𝔼 n}
    {W : Set (ℝ × 𝔼 n)} (hW : IsOpen W) (hc : ContDiffOn ℝ 2 c W) (hv : ContDiffOn ℝ 2 v W)
    {u : ℝ × 𝔼 n → ℝ} (hu₂ : ContDiffOn ℝ 2 u W)
    (hu : IsAcousticalFunction (fun p => (c p, v p)) W u) {p : ℝ × 𝔼 n} (hp : p ∈ W) :
    let grad : ℝ × 𝔼 n → 𝔼 n := fun q => gradient (fun x => u (q.1, x)) q.2
    let kappa : ℝ × 𝔼 n → ℝ := fun q => ‖grad q‖⁻¹
    let That : 𝔼 n := kappa p • grad p
    let T : ℝ × 𝔼 n := (0, kappa p • That)
    fderiv ℝ kappa p (1, v p - c p • That) = inner ℝ That (fderiv ℝ v p T) - fderiv ℝ c p T := by
  sorry

/-! ## Layer 2: the characteristic boundary of a development -/

/-- The characteristic boundary of `D` after time `t₀` (§2.2): its frontier in `ℝ × E` within
`{t > t₀}`. -/
def characteristicBoundary (t₀ : ℝ) (D : Set (ℝ × 𝔼 n)) : Set (ℝ × 𝔼 n) :=
  frontier D ∩ {p | t₀ < p.1}

/-- **Comparison of domains of dependence** (§2.1). Let `U` be a classical solution on the slab
`O = [t₀, t₀ + T) × E` with sound speed and velocity bounded on `[t₀, t₂] × E` for every
`t₂ < t₀ + T`, let `Ô` be open with `Ô ∩ H_{t₀} = O`, and let `(c̃, ṽ)` be a `C¹` field on `Ô`,
`c̃ > 0`, extending the acoustical field of `U`. For `S ⊆ E` open and regular
(`interior (closure S) = S`), the development `D⁺_O({t₀} × S)` and the domain of dependence
`Ď = D⁺_Ô({t₀} × closure S)` of the extended field (time-parametrised, to which
LorentzianGeometry §7.6 reduces its domain of dependence for the acoustical form) satisfy
`D = interior Ď` after time `t₀`. -/
theorem futureDomainOfDependence_inter_eq_interior [NeZero n] (P : EquationOfState) {t₀ T : ℝ}
    (hT : 0 < T) {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ} (hU : P.IsSolution (Ico t₀ (t₀ + T) ×ˢ univ) U)
    (hbdd : ∀ t₂ < t₀ + T, ∃ C : ℝ, ∀ p ∈ Icc t₀ t₂ ×ˢ (univ : Set (𝔼 n)),
      |(P.acousticalCone U p).1| ≤ C ∧ ‖(P.acousticalCone U p).2‖ ≤ C)
    {Ô : Set (ℝ × 𝔼 n)} (hÔ : IsOpen Ô) (hÔO : Ô ∩ {p | t₀ ≤ p.1} = Ico t₀ (t₀ + T) ×ˢ univ)
    {c : ℝ × 𝔼 n → ℝ} {v : ℝ × 𝔼 n → 𝔼 n} (hc : ContDiffOn ℝ 1 c Ô) (hv : ContDiffOn ℝ 1 v Ô)
    (hc_pos : ∀ p ∈ Ô, 0 < c p)
    (hcv : ∀ p ∈ Ico t₀ (t₀ + T) ×ˢ (univ : Set (𝔼 n)), (c p, v p) = P.acousticalCone U p)
    {S : Set (𝔼 n)} (hS : interior (closure S) = S) :
    futureDomainOfDependence (P.acousticalCone U) (Ico t₀ (t₀ + T) ×ˢ univ) ({t₀} ×ˢ S) ∩
        {p | t₀ < p.1} =
      interior (futureDomainOfDependence (fun p => (c p, v p)) Ô ({t₀} ×ˢ closure S)) ∩
        {p | t₀ < p.1} := by
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
    (hu : IsAcousticalFunction (P.acousticalCone U) (Ico t₀ t₁ ×ˢ univ) u) :
    futureDomainOfDependence (P.acousticalCone U) (Ico t₀ t₁ ×ˢ univ)
        ({t₀} ×ˢ {x | u (t₀, x) < 0}) = {p ∈ Ico t₀ t₁ ×ˢ univ | u p < 0} ∧
      characteristicBoundary t₀ {p ∈ Ico t₀ t₁ ×ˢ univ | u p < 0} ∩ {p | p.1 < t₁} =
        {p | p.1 ∈ Ioo t₀ t₁ ∧ u p = 0} := by
  sorry

/-! ## Layer 4: centered rarefaction waves -/

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
      IsAcousticalFunction (P.acousticalCone (planeRarefaction k₀ γ c_r v_r s₀)) W
        (fun p => v_r + c_r - p.2 0 / p.1) := by
  sorry

end TauCetiRoadmap.CompressibleEulerEquationsPartII

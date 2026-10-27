import TauCetiRoadmap.SymplecticGeometry.Suggested
import Mathlib.Topology.Instances.AddCircle.Real
import Mathlib.Tactic.Ring
import Mathlib.Algebra.Module.ZLattice.Basic

/-!
These suggested forms are aids, not the specification. The README is definitive;
this file is neither exhaustive nor a required implementation plan. The data below
state independence, involution and first-integral conditions explicitly.
-/
noncomputable section
open scoped Manifold ContDiff BigOperators
namespace TauCetiRoadmap.SymplecticGeometry
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- Complete integrability on a 2n-dimensional symplectic manifold. -/
structure IntegrableSystem [FiniteDimensional ℝ E]
    (σ : TauCeti.SmoothTwoForm I M) (Hamiltonian : M → ℝ) (n : ℕ) where
  symplectic : σ.IsSymplectic
  dimension : Module.finrank ℝ E = 2 * n
  integral : Fin n → M → ℝ
  smooth : ∀ i, ContMDiff I 𝓘(ℝ, ℝ) ∞ (integral i)
  smoothHamiltonian : ContMDiff I 𝓘(ℝ, ℝ) ∞ Hamiltonian
  involution : ∀ i j x, bracketValue σ (integral i) (integral j) x = 0
  firstIntegral : ∀ i x, bracketValue σ (integral i) Hamiltonian x = 0
  denseRegular : Dense {x : M | Function.Surjective
    (mfderiv I 𝓘(ℝ, Fin n → ℝ) (fun y i ↦ integral i y) x)}

/-- A regular common-level tangent space is exactly the kernel of the derivative. -/
def commonLevelTangent {n : ℕ} (f : Fin n → M → ℝ) (x : M) :
    Submodule ℝ (TangentSpace I x) :=
  LinearMap.ker (mfderiv I 𝓘(ℝ, Fin n → ℝ) (fun y i ↦ f i y) x).toLinearMap

/-- The maximal involutive regular level has a Lagrangian tangent space. -/
theorem regularLevel_lagrangian [FiniteDimensional ℝ E]
    {σ : TauCeti.SmoothTwoForm I M} {Hamiltonian : M → ℝ} {n : ℕ}
    (s : IntegrableSystem σ Hamiltonian n) (x : M)
    (hx : Function.Surjective
      (mfderiv I 𝓘(ℝ, Fin n → ℝ) (fun y i ↦ s.integral i y) x)) :
    (s.symplectic.isNondegenerate.symplecticFormAt x).IsLagrangian
      (commonLevelTangent s.integral x) := by
  sorry

/-- Ambient formula, with the conservation theorem restricted to the punctured phase space. -/
def planarCentralHamiltonian (mass : ℝ) (V : ℝ → ℝ)
    (z : EuclideanSpace ℝ (Fin 2) × EuclideanSpace ℝ (Fin 2)) : ℝ :=
  (z.2 0 ^ 2 + z.2 1 ^ 2) / (2 * mass) +
    V (Real.sqrt (z.1 0 ^ 2 + z.1 1 ^ 2))

/-- Momentum of the positive planar rotation generator. -/
def planarAngularMomentum (z : EuclideanSpace ℝ (Fin 2) × EuclideanSpace ℝ (Fin 2)) : ℝ :=
  z.1 0 * z.2 1 - z.1 1 * z.2 0

/-- The radial Hamiltonian after fixing angular momentum. -/
def radialHamiltonian (mass angularMomentum : ℝ) (V : ℝ → ℝ) (r p : ℝ) : ℝ :=
  p ^ 2 / (2 * mass) + angularMomentum ^ 2 / (2 * mass * r ^ 2) + V r
/-- Pointwise conservation only on the noncollision domain and at positive mass. -/
theorem centralForce_commutes (mass : ℝ) (hmass : 0 < mass) (V : ℝ → ℝ)
    (hV : ContDiffOn ℝ ∞ V (Set.Ioi 0))
    (z : EuclideanSpace ℝ (Fin 2) × EuclideanSpace ℝ (Fin 2)) (hq : z.1 ≠ 0) :
    bracketValue (TauCeti.stdSymplecticForm (V := EuclideanSpace ℝ (Fin 2))).constSmooth
      (planarCentralHamiltonian mass V) planarAngularMomentum z = 0 := by
  sorry

/-- Native additive scaling on the actual positive-period quotient carriers. -/
def positivePeriodScale (p q : ℝ) (hp : 0 < p) (hq : 0 < q) : AddCircle p ≃+ AddCircle q :=
  AddCircle.equivAddCircle p q (ne_of_gt hp) (ne_of_gt hq)

/-- Exact representative formula, before applying the I2.0 smooth atlas construction. -/
theorem positivePeriodScale_on_real (p q : ℝ) (hp : 0 < p) (hq : 0 < q) (t : ℝ) :
    positivePeriodScale p q hp hq (t : AddCircle p) = (((q/p)*t : ℝ) : AddCircle q) := by
  change (AddCircle.equivAddCircle p q _ _) (t : AddCircle p) = (((q/p)*t : ℝ) : AddCircle q)
  rw [AddCircle.equivAddCircle_apply_mk]
  congr 1
  ring

/-- The inverse scales its actual real representatives by p/q. -/
theorem positivePeriodScale_inverse_on_real (p q : ℝ) (hp : 0 < p) (hq : 0 < q) (t : ℝ) :
    (positivePeriodScale p q hp hq).symm (t : AddCircle q) = (((p/q)*t : ℝ) : AddCircle p) := by
  change (AddCircle.equivAddCircle p q _ _).symm (t : AddCircle q) = (((p/q)*t : ℝ) : AddCircle p)
  rw [AddCircle.equivAddCircle_symm_apply_mk]
  congr 1
  ring

abbrev AngleTorus (n : ℕ) := Fin n → AddCircle (2 * Real.pi)

/-- Positively oriented quotient charts, local inverses of the covering map
`ℝ → AddCircle (2 * Real.pi)`, with their product atlas; an I2 construction target. -/
@[instance_reducible] def angleChartedSpace (n : ℕ) : ChartedSpace (Fin n → ℝ) (AngleTorus n) := by
  sorry
local instance (n : ℕ) : ChartedSpace (Fin n → ℝ) (AngleTorus n) := angleChartedSpace n
local instance (n : ℕ) : IsManifold 𝓘(ℝ, Fin n → ℝ) ∞ (AngleTorus n) := by
  sorry

/-- Actions first, angles second; its form is sum dθ_i ∧ dI_i. -/
def actionAngleForm (n : ℕ) :
    TauCeti.SmoothTwoForm (𝓘(ℝ, Fin n → ℝ).prod 𝓘(ℝ, Fin n → ℝ))
      ((Fin n → ℝ) × AngleTorus n) := by
  sorry

/-- The actual local canonical formula pins the order and sign of action/angle arguments. -/
theorem actionAngleForm_inChart (n : ℕ)
    (z₀ : (Fin n → ℝ) × AngleTorus n)
    (w : (Fin n → ℝ) × (Fin n → ℝ))
    (hw : w ∈ (extChartAt (𝓘(ℝ, Fin n → ℝ).prod 𝓘(ℝ, Fin n → ℝ)) z₀).target)
    (v : Fin 2 → ((Fin n → ℝ) × (Fin n → ℝ))) :
    (actionAngleForm n).1.inChartAt z₀ w v =
      ∑ i, ((v 0).2 i * (v 1).1 i - (v 0).1 i * (v 1).2 i) := by
  sorry

/-- A local action-angle normal form on an open neighborhood saturated by selected fibers. -/
structure LocalActionAngle (σ : TauCeti.SmoothTwoForm I M) (n : ℕ)
    (f : M → (Fin n → ℝ)) where
  neighborhood : TopologicalSpace.Opens M
  actions : TopologicalSpace.Opens (Fin n → ℝ)
  chart : neighborhood ≃ₘ^∞⟮I, 𝓘(ℝ, Fin n → ℝ).prod 𝓘(ℝ, Fin n → ℝ)⟯
    (actions × AngleTorus n)
  integralsOfActions : (Fin n → ℝ) → (Fin n → ℝ)
  smoothIntegralsOfActions : ContDiff ℝ ∞ integralsOfActions
  regularIntegralsOfActions : ∀ a : actions,
    Function.Bijective (fderiv ℝ integralsOfActions a)
  factors : ∀ x : neighborhood, f x = integralsOfActions (chart x).1
  preserves : ∀ (x : neighborhood) (v w : TangentSpace I x),
    (actionAngleForm n).eval₂ ((chart x).1, (chart x).2)
      (mfderiv I (𝓘(ℝ, Fin n → ℝ).prod 𝓘(ℝ, Fin n → ℝ))
        (fun y : neighborhood ↦ ((chart y).1.1, (chart y).2)) x v)
      (mfderiv I (𝓘(ℝ, Fin n → ℝ).prod 𝓘(ℝ, Fin n → ℝ))
        (fun y : neighborhood ↦ ((chart y).1.1, (chart y).2)) x w) =
      σ.eval₂ x (mfderiv I I (fun y : neighborhood ↦ (y : M)) x v)
        (mfderiv I I (fun y : neighborhood ↦ (y : M)) x w)

/-- Period isotropy is a full real lattice, with Mathlib's actual vocabulary. -/
structure FullPeriodLattice (n : ℕ) where
  lattice : Submodule ℤ (Fin n → ℝ)
  discrete : DiscreteTopology lattice
  full : @IsZLattice ℝ _ (Fin n → ℝ) _ _ lattice discrete
end TauCetiRoadmap.SymplecticGeometry

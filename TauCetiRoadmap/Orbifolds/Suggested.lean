import Mathlib.CategoryTheory.Action
import Mathlib.Algebra.Group.Units.Equiv
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.RepresentationTheory.Invariants
import Mathlib.Topology.Constructions
import Mathlib.Data.Rat.Defs
import Mathlib.Geometry.Diffeology.Basic

/-!
These are suggested forms, not an exhaustive checklist. The README is the
definitive specification; these prototypes are aids, neither a required
implementation plan nor a substitute for its milestones.

These finite models use native action groupoids, orbit quotients and averaging.
The general smooth total-arrow/Morita carrier is supplied by LGP's targets;
no placeholder carrier or unspecified Prop field represents that construction here.
-/

noncomputable section

open CategoryTheory
open scoped BigOperators

universe u v w

namespace TauCetiRoadmap.Orbifolds

section RetainedActions
variable (G : Type u) [Group G] (X : Type v) [MulAction G X]

/-- The actual subgroup of stabilizer labels, with native automorphism multiplication. -/
def stabilizerAutEquiv (x : X) :
    MulAction.stabilizer G x ≃* Aut (CategoryTheory.ActionCategory.objEquiv G X x) := by
  let e : MulAction.stabilizer G x ≃* End (CategoryTheory.ActionCategory.objEquiv G X x) :=
    CategoryTheory.ActionCategory.stabilizerIsoEnd G x
  exact (toUnits (G := MulAction.stabilizer G x)).trans
    ((Units.mapEquiv e).trans (CategoryTheory.Aut.unitsEndEquivAut _))

/-- This comparison retains the literal acting element on the forward arrow. -/
@[simp] theorem stabilizerAutEquiv_hom_label (x : X) (g : MulAction.stabilizer G x) :
    ((stabilizerAutEquiv G X x g).asIso.hom).hom = (g : G) := rfl

/-- The inverse comparison recovers that same label from an automorphism. -/
@[simp] theorem stabilizerAutEquiv_symm_label (x : X)
    (a : Aut (CategoryTheory.ActionCategory.objEquiv G X x)) :
    ((stabilizerAutEquiv G X x).symm a : G) = a.asIso.hom.hom := rfl
end RetainedActions

section Reynolds
variable {k : Type u} [CommRing k]
variable {G : Type v} [Group G] [Fintype G] [Invertible (Fintype.card G : k)]
variable {V : Type w} [AddCommGroup V] [Module k V]

/-- The actual average is idempotent. -/
theorem reynolds_idempotent (ρ : Representation k G V) :
    (ρ.averageMap).comp (ρ.averageMap) = ρ.averageMap := by
  ext v
  exact ρ.averageMap_id (ρ.averageMap v) (ρ.averageMap_invariant v)

variable {W : Type w} [AddCommGroup W] [Module k W]

/-- O2: the naturality required for local cochain maps is an actual equation. -/
theorem reynolds_natural (ρ : Representation k G V) (σ : Representation k G W)
    (f : Representation.IntertwiningMap ρ σ) :
    f.toLinearMap.comp (ρ.averageMap) = (σ.averageMap).comp f.toLinearMap := by
  sorry

/-- O2: averaging a lift proves surjectivity on the native invariant submodules. -/
theorem invariant_lift (ρ : Representation k G V) (σ : Representation k G W)
    (f : Representation.IntertwiningMap ρ σ) (hf : Function.Surjective f)
    (w : σ.invariants) :
    ∃ v : ρ.invariants, f v.val = w.val := by
  sorry
end Reynolds

section RationalWeights

/-- O5: the full group order, including any ineffective kernel. -/
def finiteGroupWeight (G : Type u) [Group G] [Finite G] : ℚ := (Nat.card G : ℚ)⁻¹

/-- O5: a finite action model of the upstairs sum with the chart weight. -/
def weightedFiniteSum (G : Type u) [Group G] [Finite G] {X : Type v} [Fintype X] (f : X → ℚ) : ℚ :=
  finiteGroupWeight G * ∑ x, f x

/-- The finite scalar model for integrating a coefficient on [*/G], not on the space BG. -/
def pointGroupIntegral (G : Type u) [Group G] [Finite G] (a : ℚ) : ℚ := finiteGroupWeight G * a

@[simp] theorem pointGroupIntegral_one (G : Type u) [Group G] [Finite G] :
    pointGroupIntegral G 1 = (Nat.card G : ℚ)⁻¹ := by
  simp [pointGroupIntegral, finiteGroupWeight]

/-- Scaling an actual linear functional supplies the finite weight prototype. -/
def weightedFunctional (G : Type u) [Group G] [Finite G] {V : Type v} [AddCommGroup V] [Module ℚ V]
    (I : V →ₗ[ℚ] ℚ) : V →ₗ[ℚ] ℚ := finiteGroupWeight G • I

@[simp] theorem weightedFunctional_apply (G : Type u) [Group G] [Finite G]
    {V : Type v} [AddCommGroup V] [Module ℚ V] (I : V →ₗ[ℚ] ℚ) (v : V) :
    weightedFunctional G I v = finiteGroupWeight G * I v := rfl

/-- O5: explicit stabilizer weight of a chosen point. -/
def pointWeight (G : Type u) [Group G] [Finite G] (X : Type v) [MulAction G X] (x : X) : ℚ :=
  (Nat.card (MulAction.stabilizer G x) : ℚ)⁻¹

/-- Actual orbit-indexed finite sum; representative independence is a theorem below. -/
def orbitWeightedSum (G : Type u) [Group G] [Finite G] (X : Type v) [MulAction G X]
    [Fintype X] (f : X → ℚ) : ℚ := by
  classical
  letI := Fintype.ofFinite (MulAction.orbitRel.Quotient G X)
  exact ∑ q : MulAction.orbitRel.Quotient G X, pointWeight G X (Quotient.out q) * f (Quotient.out q)

/-- O5: finite orbit-stabilizer normalization behind the local weight formula. -/
theorem weightedFiniteSum_eq_orbitWeightedSum
    (G : Type u) [Group G] [Fintype G] (X : Type v) [MulAction G X] [Fintype X]
    (f : X → ℚ) (hf : ∀ g : G, ∀ x : X, f (g • x) = f x) :
    weightedFiniteSum G f = orbitWeightedSum G X f := by
  sorry

/-- O5: actual representative independence for invariant functions. -/
theorem pointWeight_mul_invariant_of_same_orbit
    (G : Type u) [Group G] [Fintype G] (X : Type v) [MulAction G X]
    (f : X → ℚ) (hf : ∀ g : G, ∀ x : X, f (g • x) = f x)
    (x y : X) (hxy : MulAction.orbitRel G X x y) :
    pointWeight G X x * f x = pointWeight G X y * f y := by
  sorry
end RationalWeights

end TauCetiRoadmap.Orbifolds

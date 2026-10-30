import Mathlib.Topology.Algebra.PontryaginDual
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.Algebra.Module.Basic

/-!
These signatures illustrate part of the programme. The README is definitive;
this file is neither an exhaustive checklist nor a replacement geometric carrier.
Native characters and homomorphisms below are actual maps. The geometric
stabilizer, coroot-period and flag dictionaries are specified in Q2A and S3P.
-/

namespace TauCetiRoadmap.GeometricQuantization.HomogeneousCharacters

noncomputable section Characters
variable {G H : Type*} [Group G] [Group H]
  [TopologicalSpace G] [TopologicalSpace H]

/-- Restriction along the actual stabilizer or covering homomorphism. -/
def restrictCharacter (i : H →ₜ* G) (χ : G →ₜ* Circle) : H →ₜ* Circle :=
  χ.comp i

@[simp] theorem restrictCharacter_apply (i : H →ₜ* G) (χ : G →ₜ* Circle) (h : H) :
    restrictCharacter i χ h = χ (i h) := rfl

/-- Fibrewise central descent tests the given character on the given kernel. -/
def characterKernel (χ : G →ₜ* Circle) : Subgroup G := χ.toMonoidHom.ker

@[simp] theorem mem_characterKernel (χ : G →ₜ* Circle) (g : G) :
    g ∈ characterKernel χ ↔ χ g = 1 := Iff.rfl

/-- The actual algebraic descended character. Continuity/smoothness of this
map is a separate quotient-topology comparison, not an arbitrary dictionary. -/
def descendCharacter (N : Subgroup G) [N.Normal] (χ : G →ₜ* Circle)
    (hN : N ≤ characterKernel χ) : G ⧸ N →* Circle :=
  QuotientGroup.lift N χ.toMonoidHom hN

@[simp] theorem descendCharacter_mk (N : Subgroup G) [N.Normal]
    (χ : G →ₜ* Circle) (hN : N ≤ characterKernel χ) (g : G) :
    descendCharacter N χ hN (QuotientGroup.mk g) = χ g := rfl

/-- Descent really pulls back to the supplied character. -/
theorem descendCharacter_comp (N : Subgroup G) [N.Normal]
    (χ : G →ₜ* Circle) (hN : N ≤ characterKernel χ) :
    (descendCharacter N χ hN).comp (QuotientGroup.mk' N) = χ.toMonoidHom := rfl
/-- Continuous descent uses the native quotient topology of the same group. -/
def descendContinuousCharacter (N : Subgroup G) [N.Normal] (χ : G →ₜ* Circle)
    (hN : N ≤ characterKernel χ) : (G ⧸ N) →ₜ* Circle where
  __ := descendCharacter N χ hN
  continuous_toFun := continuous_quot_lift _ χ.continuous

@[simp] theorem descendContinuousCharacter_mk (N : Subgroup G) [N.Normal]
    (χ : G →ₜ* Circle) (hN : N ≤ characterKernel χ) (g : G) :
    descendContinuousCharacter N χ hN (QuotientGroup.mk g) = χ g := rfl

end Characters

section Lattices
variable {Q Y : Type*} [AddCommGroup Q] [AddCommGroup Y]

/-- Restrict a specified integral character to the actual coroot inclusion. -/
def periodRestriction (j : Q →+ Y) : (Y →+ ℤ) →+ (Q →+ ℤ) where
  toFun χ := χ.comp j
  map_zero' := by ext q; rfl
  map_add' χ ψ := by ext q; rfl

@[simp] theorem periodRestriction_apply (j : Q →+ Y) (χ : Y →+ ℤ) (q : Q) :
    periodRestriction j χ q = χ (j q) := rfl

/-- Characters invisible on all supplied coroots; this is not yet an
identification with characters of a compact group. -/
def centralCharacterLattice (j : Q →+ Y) : AddSubgroup (Y →+ ℤ) :=
  (periodRestriction j).ker

@[simp] theorem mem_centralCharacterLattice (j : Q →+ Y) (χ : Y →+ ℤ) :
    χ ∈ centralCharacterLattice j ↔ ∀ q, χ (j q) = 0 := by
  change periodRestriction j χ = 0 ↔ _
  constructor
  · intro h q
    exact DFunLike.congr_fun h q
  · intro h
    ext q
    exact h q

/-- The finite-cover test consumes the actual integral inclusion and value,
not just a group-form name. -/
theorem ordinaryDegree_has_specifiedCharacter (j : Q →+ Y) (p : Q →+ ℤ) :
    p ∈ (periodRestriction j).range ↔ ∃ χ : Y →+ ℤ, χ.comp j = p := Iff.rfl
end Lattices

end TauCetiRoadmap.GeometricQuantization.HomogeneousCharacters

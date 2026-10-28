import Mathlib

/-!
Selected target signatures for README.md, which is definitive. This file is
not exhaustive. The theorem admissions are future proof targets. All characters,
products and finitely supported families use native Mathlib carriers.
-/

noncomputable section

open scoped DirectSum

namespace TauCetiRoadmap.RepresentationTheory.CompactGroups

universe u v

section FiniteCoordinates

variable {J : Type u} [DecidableEq J] (G : J → Type v)
  [∀ j, Group (G j)] [∀ j, TopologicalSpace (G j)]
  [∀ j, IsTopologicalGroup (G j)]

/-- Circle-valued continuous characters factor through finitely many coordinates,
even without compactness, commutativity or a countable index type. -/
theorem character_finite_coordinates (χ : PontryaginDual (∀ j, G j)) :
    ∃ F : Finset J, ∀ x : ∀ j, G j,
      χ x = ∏ j ∈ F, χ (Pi.mulSingle j (x j)) := by
  sorry

end FiniteCoordinates

section CompactAbelian

variable {J : Type u} [DecidableEq J] (G : J → Type v)
  [∀ j, CommGroup (G j)] [∀ j, TopologicalSpace (G j)]
  [∀ j, IsTopologicalGroup (G j)] [∀ j, CompactSpace (G j)] [∀ j, T2Space (G j)]

/-- The chosen topology on the direct sum is explicitly discrete.
The equation on its generators pins the isomorphism to coordinate evaluation. -/
theorem exists_productDualEquiv :
    letI : TopologicalSpace (Multiplicative (⨁ j, Additive (PontryaginDual (G j)))) := ⊥
    ∃ e : Multiplicative (⨁ j, Additive (PontryaginDual (G j))) ≃ₜ*
        PontryaginDual (∀ j, G j),
      ∀ (j : J) (χ : PontryaginDual (G j)) (x : ∀ j, G j),
        e (Multiplicative.ofAdd
          (DirectSum.of (fun k => Additive (PontryaginDual (G k))) j
            (Additive.ofMul χ))) x = χ (x j) := by
  sorry

end CompactAbelian

/-- Every character of an arbitrary torus has a unique finite integer multi-index. -/
theorem circleProduct_character {J : Type u} [DecidableEq J]
    (χ : PontryaginDual (J → Circle)) :
    ∃! n : J →₀ ℤ, ∀ z : J → Circle,
      χ z = ∏ j ∈ n.support, z j ^ n j := by
  sorry

end TauCetiRoadmap.RepresentationTheory.CompactGroups

import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.Tactic.Group

/-!
# Suggested checks for the ten-crossing elimination example

This file is not the roadmap and is not exhaustive; the README is definitive.
These are conditional algebraic checks, not a transcription of the unreadable
connector or a certification of the pictured knot's presentation.
-/

namespace WirtingerEliminationTargets

variable {G : Type*} [Group G]

def firstWord (x y z : G) : G := y * x⁻¹ * z * x * y⁻¹

def secondWord (x y z : G) : G := y * x⁻¹ * z⁻¹ * x * y⁻¹

theorem secondWord_eq_inverse (x y z : G) :
    secondWord x y z = (firstWord x y z)⁻¹ := by
  simp [firstWord, secondWord, mul_assoc]

/-- This is the product interpretation, not an authenticated source relation. -/
theorem product_reading_iff (x y z : G) :
    firstWord x y z * secondWord x y z = x * y * x⁻¹ ↔ y = 1 := by
  rw [secondWord_eq_inverse, mul_inv_cancel]
  constructor
  · intro h
    have h' := congrArg (fun a => x⁻¹ * a * x) h.symm
    simpa [mul_assoc] using h'
  · intro h
    simp [h]

/-- A relation with this product reading kills the designated meridian. -/
theorem product_reading_obstructs_meridian {A : Type*} [Group A]
    (x y z : G) (f : G →* A) (hy : f y ≠ 1) :
    firstWord x y z * secondWord x y z ≠ x * y * x⁻¹ := by
  intro h
  apply hy
  rw [(product_reading_iff x y z).mp h, map_one]

end WirtingerEliminationTargets

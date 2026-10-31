import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Tactic

/-!
# Three-meridian permutation certificate: suggested native forms

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These finite permutation calculations certify the two stated presentation
relations and the generated image. The identification with the actual pretzel,
its named table knot, its geometric meridians and the bridge upper bound remain
separate mandatory README targets. The finite assignment alone proves none of
those identifications. Existing torus, color-rank and Whitehead APIs are retained.
-/

namespace TauCetiRoadmap.GeometricTopology.NumericalFamilies

open Equiv

abbrev S4 := Perm (Fin 4)

/-- Images of the three meridians in the specified presentation order. -/
def a : S4 := swap 0 1

def b : S4 := swap 2 3

def c : S4 := swap 1 2

theorem meridian_images_are_transpositions : a.IsSwap ∧ b.IsSwap ∧ c.IsSwap := by
  unfold Perm.IsSwap
  decide +kernel

/-- First presentation relation, in native permutation multiplication order. -/
theorem first_relation :
    a * b * a⁻¹ = (b * c * b) * c * (b * c * b)⁻¹ := by
  decide +kernel

/-- Second presentation relation, with the two conjugations retained literally. -/
theorem second_relation :
    (b * a⁻¹)⁻¹ * a * (b * a⁻¹) = (a * c)⁻¹ * c * (a * c) := by
  decide +kernel

/-- All three adjacent transpositions occur, so their subgroup is the whole S₄. -/
theorem generated_image : Subgroup.closure ({a, b, c} : Set S4) = ⊤ := by
  have hsubset : Set.range (fun i : Fin 3 ↦ swap i.castSucc i.succ) ⊆
      ({a, b, c} : Set S4) := by
    rintro _ ⟨i, rfl⟩
    fin_cases i <;> simp [a, b, c]
  have hmono : Submonoid.closure
      (Set.range (fun i : Fin 3 ↦ swap i.castSucc i.succ)) ≤
      (Subgroup.closure ({a, b, c} : Set S4)).toSubmonoid :=
    Submonoid.closure_le.2 fun _ hx ↦ Subgroup.subset_closure (hsubset hx)
  rw [Perm.mclosure_swap_castSucc_succ 3] at hmono
  apply top_unique
  intro x _
  exact hmono (by trivial)

end TauCetiRoadmap.GeometricTopology.NumericalFamilies

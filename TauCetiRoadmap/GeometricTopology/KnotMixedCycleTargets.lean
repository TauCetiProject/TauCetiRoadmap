import Mathlib.GroupTheory.Perm.Closure
import Mathlib.GroupTheory.Perm.Cycle.Concrete

/-!
Suggested finite certificates for GT4's physical-page177 group labels.
The README remains definitive. These computations alone do not certify
that the source diagram satisfies its crossing relations.
-/

namespace TauCetiRoadmap.GeometricTopology.KnotMixedCycle

open Equiv

/-- Source letters 1,...,5 correspond to Fin 5 entries 0,...,4. -/
def a : Perm (Fin 5) := swap 3 4 * (swap 0 1 * swap 1 2)

def b : Perm (Fin 5) := swap 2 4 * (swap 0 1 * swap 1 3)

example : a ^ 3 = swap 3 4 := by decide +kernel
example : b ^ 3 = swap 2 4 := by decide +kernel

/-- The two legible labels generate S5 independently of the interior labels. -/
theorem closure_labels_eq_top :
    Subgroup.closure ({a, b} : Set (Perm (Fin 5))) = ⊤ := by
  let H := Subgroup.closure ({a, b} : Set (Perm (Fin 5)))
  have ha : a ∈ H := Subgroup.subset_closure (by simp)
  have hb : b ∈ H := Subgroup.subset_closure (by simp)
  have hab : a * b = ([0, 2, 3, 1, 4] : List (Fin 5)).formPerm := by
    decide +kernel
  have hcycle : (a * b).IsCycle := by
    rw [hab]
    exact List.isCycle_formPerm (by decide) (by decide)
  have hswap : (a ^ 3).IsSwap := by
    exact ⟨3, 4, by decide, by decide +kernel⟩
  have hsmall : Subgroup.closure ({a * b, a ^ 3} : Set (Perm (Fin 5))) = ⊤ :=
    Perm.closure_prime_cycle_swap (by decide) hcycle
      (by decide +kernel) hswap
  apply top_unique
  rw [← hsmall]
  exact (Subgroup.closure_le H).mpr (by
    intro p hp
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp
    rcases hp with rfl | rfl
    · exact H.mul_mem ha hb
    · exact H.pow_mem ha 3)

end TauCetiRoadmap.GeometricTopology.KnotMixedCycle

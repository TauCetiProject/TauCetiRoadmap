import Mathlib.GroupTheory.Perm.Closure
import Mathlib.GroupTheory.Perm.Cycle.Concrete

/-!
# Concrete permutation colorings for physical page177

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The native finite certificates concern the specified meridians and standard
braid-closure models. Their realized-diagram comparison and the literal source
picture's crossing/arc identification remain separate geometric targets.
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

/-- The ordinary positive conjugation crossing on ordered strand labels. -/
def cross {G : Type*} [Group G] (p : G × G) : G × G :=
  (p.1 * p.2 * p.1⁻¹, p.1)

theorem source_pair_relations :
    (cross^[5]) (a,b) = (a,b) ∧ (a*b)^2*a = b*(a*b)^2 := by
  decide +kernel

/-- The source's cubes generate only the permutations of letters 3,4,5. -/
theorem cubes_fix_first_two :
    (a^3) (0 : Fin 5) = 0 ∧ (b^3) (0 : Fin 5) = 0 ∧
    (a^3) (1 : Fin 5) = 1 ∧ (b^3) (1 : Fin 5) = 1 := by
  decide +kernel

def trefoilS4A : Perm (Fin 4) := ([0,1,2,3] : List (Fin 4)).formPerm

def trefoilS4B : Perm (Fin 4) := ([0,1,3,2] : List (Fin 4)).formPerm

theorem trefoil_s4_relations :
    (cross^[3]) (trefoilS4A,trefoilS4B) = (trefoilS4A,trefoilS4B) ∧
    trefoilS4A*trefoilS4B*trefoilS4A =
      trefoilS4B*trefoilS4A*trefoilS4B ∧
    trefoilS4A^2*trefoilS4B = swap 3 0 := by
  decide +kernel

/-- The four-cycle and its adjacent swap generate S4 by the native cycle theorem. -/
theorem trefoil_s4_generates :
    Subgroup.closure ({trefoilS4A,trefoilS4B} : Set (Perm (Fin 4))) = ⊤ := by
  let H := Subgroup.closure ({trefoilS4A,trefoilS4B} : Set (Perm (Fin 4)))
  have ha : trefoilS4A ∈ H := Subgroup.subset_closure (by simp)
  have hb : trefoilS4B ∈ H := Subgroup.subset_closure (by simp)
  have hc : trefoilS4A.IsCycle :=
    List.isCycle_formPerm (by decide) (by decide)
  have hs : trefoilS4A.support = Finset.univ := by decide +kernel
  have hsmall := Perm.closure_cycle_adjacent_swap hc hs (3 : Fin 4)
  apply top_unique
  rw [← hsmall]
  apply (Subgroup.closure_le H).mpr
  intro p hp
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp
  rcases hp with rfl | rfl
  · exact ha
  · have hswap : swap 3 (trefoilS4A 3) = trefoilS4A^2*trefoilS4B := by
      decide +kernel
    rw [hswap]
    exact H.mul_mem (H.pow_mem ha 2) hb

end TauCetiRoadmap.GeometricTopology.KnotMixedCycle

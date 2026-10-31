import TauCeti.GroupTheory.Perm.SwapFactors
import Mathlib.GroupTheory.Perm.Closure
import Mathlib.GroupTheory.Perm.Cycle.Concrete
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Algebra.Quandle

/- Suggested targets only. The README is definitive; this file is not exhaustive.
The graph is native SimpleGraph and labels use native permutations/IsSwap/closure.
The geometric bridge-coloring and actual trefoil realization remain separate targets. -/
noncomputable section
namespace TranspositionBridgeTargets
open Equiv

def swapGraph {N : ℕ} (S : Set (Perm (Fin N))) : SimpleGraph (Fin N) where
  Adj x y := x ≠ y ∧ swap x y ∈ S
  symm := by
    constructor
    intro x y h
    exact ⟨h.1.symm, by simpa only [swap_comm] using h.2⟩
  loopless := by constructor; intro x h; exact h.1 rfl

theorem reachable_iff_orbit {N : ℕ} (S : Set (Perm (Fin N)))
    (hS : ∀ g ∈ S, g.IsSwap) (x y : Fin N) :
    (swapGraph S).Reachable x y ↔ y ∈ MulAction.orbit (Subgroup.closure S) x := by sorry

/-- Preconnectedness retains the empty and singleton vertex cases. -/
theorem closure_top_iff_preconnected {N : ℕ} (S : Set (Perm (Fin N)))
    (hS : ∀ g ∈ S, g.IsSwap) :
    Subgroup.closure S = ⊤ ↔ (swapGraph S).Preconnected := by sorry

theorem closure_top_iff_connected {N : ℕ} (hN : 1 ≤ N)
    (S : Set (Perm (Fin N))) (hS : ∀ g ∈ S, g.IsSwap) :
    Subgroup.closure S = ⊤ ↔ (swapGraph S).Connected := by sorry

theorem edge_card {N : ℕ} (S : Set (Perm (Fin N)))
    (hS : ∀ g ∈ S, g.IsSwap) :
    Nat.card (swapGraph S).edgeSet = S.ncard := by sorry

theorem generating_swaps_card {N : ℕ} (S : Set (Perm (Fin N)))
    (hfin : S.Finite) (hS : ∀ g ∈ S, g.IsSwap) (hgen : Subgroup.closure S = ⊤) :
    N - 1 ≤ S.ncard := by sorry

theorem bridge_labels_bound {N b : ℕ} (labels : Fin b → Perm (Fin N))
    (hswap : ∀ i, (labels i).IsSwap)
    (hgen : Subgroup.closure (Set.range labels) = ⊤) : N - 1 ≤ b := by sorry

/-- Each factor pair of a genuine three-cycle has the same support-component relation. -/
theorem three_cycle_factor_orbits {N m : ℕ}
    (c a b : Fin m → Perm (Fin N))
    (hc : ∀ i, (c i).IsThreeCycle)
    (ha : ∀ i, (a i).IsSwap) (hb : ∀ i, (b i).IsSwap)
    (hprod : ∀ i, c i = a i * b i) :
    MulAction.orbitRel (Subgroup.closure (Set.range c)) (Fin N) =
      MulAction.orbitRel (Subgroup.closure (Set.range a ∪ Set.range b)) (Fin N) := by sorry

def trefoilS : Perm (Fin 3) := swap 0 1
def trefoilT : Perm (Fin 3) := swap 1 2
def trefoilU : Perm (Fin 3) := swap 0 2

theorem trefoil_relations :
    trefoilS * trefoilT * trefoilS⁻¹ = trefoilU ∧
    trefoilT * trefoilU * trefoilT⁻¹ = trefoilS ∧
    trefoilU * trefoilS * trefoilU⁻¹ = trefoilT ∧
    trefoilS * trefoilT * trefoilS = trefoilT * trefoilS * trefoilT := by decide +kernel

theorem trefoil_swaps : trefoilS.IsSwap ∧ trefoilT.IsSwap ∧ trefoilU.IsSwap := by
  unfold Perm.IsSwap
  decide +kernel

theorem trefoil_generates :
    Subgroup.closure ({trefoilS, trefoilT} : Set (Perm (Fin 3))) = ⊤ := by
  let H := Subgroup.closure ({trefoilS, trefoilT} : Set (Perm (Fin 3)))
  have hs : trefoilS ∈ H := Subgroup.subset_closure (by simp)
  have ht : trefoilT ∈ H := Subgroup.subset_closure (by simp)
  have hprod : trefoilS * trefoilT = ([0, 1, 2] : List (Fin 3)).formPerm := by decide +kernel
  have hcycle : (trefoilS * trefoilT).IsCycle := by
    rw [hprod]
    exact List.isCycle_formPerm (by decide) (by decide)
  have hsmall : Subgroup.closure ({trefoilS * trefoilT, trefoilS} : Set (Perm (Fin 3))) = ⊤ :=
    Perm.closure_prime_cycle_swap (by decide) hcycle (by decide +kernel) trefoil_swaps.1
  apply top_unique
  rw [← hsmall]
  exact (Subgroup.closure_le H).mpr (by
    intro p hp
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp
    rcases hp with rfl | rfl
    · exact H.mul_mem hs ht
    · exact hs)

def hurwitz (p : Perm (Fin 3) × Perm (Fin 3)) : Perm (Fin 3) × Perm (Fin 3) :=
  (p.1 * p.2 * p.1⁻¹, p.1)

theorem trefoil_hurwitz_three :
    (hurwitz^[3]) (trefoilS, trefoilT) = (trefoilS, trefoilT) := by decide +kernel

end TranspositionBridgeTargets

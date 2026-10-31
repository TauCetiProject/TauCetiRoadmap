import Mathlib

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
These are actual finite endpoint permutations and their native orbit quotient.
The geometric signed-box and pretzel-diagram comparisons remain README targets.
The general component-count theorem is the single intentional admission.
-/

namespace TauCetiRoadmap.GeometricTopology.PretzelPermutations
open Equiv

/-- n+1 boxes; false/true record top/bottom and left/right, respectively. -/
abbrev Ports (n : ℕ) := Fin (n + 1) × Bool × Bool

def twist (a : Fin (n + 1) → ℤ) : Perm (Ports n) where
  toFun p := (p.1, !p.2.1, p.2.2.xor (decide (Odd (a p.1))))
  invFun p := (p.1, !p.2.1, p.2.2.xor (decide (Odd (a p.1))))
  left_inv := by
    rintro ⟨i,t,s⟩
    by_cases h : Odd (a i) <;> simp [h]
  right_inv := by
    rintro ⟨i,t,s⟩
    by_cases h : Odd (a i) <;> simp [h]

/-- Right i joins left (i+1), at both levels, including the cyclic seam. -/
def caps (n : ℕ) : Perm (Ports n) where
  toFun p := if p.2.2 then (finRotate (n+1) p.1, p.2.1, false)
    else ((finRotate (n+1)).symm p.1, p.2.1, true)
  invFun p := if p.2.2 then (finRotate (n+1) p.1, p.2.1, false)
    else ((finRotate (n+1)).symm p.1, p.2.1, true)
  left_inv := by rintro ⟨i,t,s⟩; cases s <;> simp
  right_inv := by rintro ⟨i,t,s⟩; cases s <;> simp

theorem twist_involution (a : Fin (n + 1) → ℤ) : twist a * twist a = 1 := by
  apply Equiv.ext
  rintro ⟨i,t,s⟩
  by_cases h : Odd (a i) <;> simp [twist, h]

theorem caps_involution (n : ℕ) : caps n * caps n = 1 := by
  apply Equiv.ext
  rintro ⟨i,t,s⟩
  cases s <;> simp [caps]

theorem twist_no_fixed (a : Fin (n + 1) → ℤ) (p : Ports n) : twist a p ≠ p := by
  intro h
  have ht := congrArg (fun q : Ports n => q.2.1) h
  cases p.2.1 <;> simp [twist] at ht

theorem caps_no_fixed (n : ℕ) (p : Ports n) : caps n p ≠ p := by
  intro h
  have hs := congrArg (fun q : Ports n => q.2.2) h
  cases hside : p.2.2 <;> simp [caps, hside] at hs

def endpointGroup (a : Fin (n + 1) → ℤ) : Subgroup (Perm (Ports n)) :=
  Subgroup.closure {twist a, caps n}

abbrev Components (a : Fin (n + 1) → ℤ) :=
  MulAction.orbitRel.Quotient (endpointGroup a) (Ports n)

def evenCount (a : Fin (n + 1) → ℤ) : ℕ :=
  (Finset.univ.filter fun i => Even (a i)).card

theorem component_count (a : Fin (n + 1) → ℤ) :
    Nat.card (Components a) =
      if evenCount a = 0 then (if Odd (n + 1) then 1 else 2) else evenCount a := by
  sorry

theorem evenCount_reindex (a : Fin (n + 1) → ℤ) (π : Perm (Fin (n + 1))) :
    evenCount (a ∘ π) = evenCount a := by
  classical
  unfold evenCount
  apply Finset.card_bij (fun i _ => π i)
  · intro i hi
    simpa using hi
  · intro i hi j hj hij
    exact π.injective hij
  · intro j hj
    exact ⟨π.symm j, by simpa using hj, by simp⟩

theorem component_count_reindex (a : Fin (n + 1) → ℤ) (π : Perm (Fin (n + 1))) :
    Nat.card (Components (a ∘ π)) = Nat.card (Components a) := by
  rw [component_count, component_count, evenCount_reindex]

theorem component_count_one_box (a : Fin 1 → ℤ) : Nat.card (Components a) = 1 := by
  rw [component_count]
  have hcount : evenCount a = if Even (a 0) then 1 else 0 := by
    unfold evenCount
    have hu : (Finset.univ : Finset (Fin 1)) = {0} := by
      ext i
      have hi : i = 0 := Subsingleton.elim _ _
      simp [hi]
    rw [hu]
    by_cases h : Even (a 0) <;>
      simp only [Finset.filter_singleton, h, ite_true, ite_false,
        Finset.card_singleton, Finset.card_empty]
  rw [hcount]
  split <;> simp_all

end TauCetiRoadmap.GeometricTopology.PretzelPermutations

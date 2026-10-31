import Mathlib.GroupTheory.Perm.Closure
import Mathlib.GroupTheory.Perm.Cycle.Concrete
import Mathlib.Tactic

/-!
Suggested algebraic interfaces for the indexed cinquefoil-double family.
The README is definitive and this file is not exhaustive. These data and
certificates do not identify a clasp diagram or prove a geometric doubling.
-/

namespace TauCetiRoadmap.GeometricTopology.IndexedDoubling

open Equiv

def baseLetter (k : ℕ) (i : Fin 3) : Fin (2 * k + 3) :=
  i.castLE (by omega)

def newLetterA (k : ℕ) (j : Fin k) : Fin (2 * k + 3) :=
  ⟨2 * j.val + 3, by omega⟩

def newLetterB (k : ℕ) (j : Fin k) : Fin (2 * k + 3) :=
  ⟨2 * j.val + 4, by omega⟩

/-- Native permutation multiplication composes from right to left. -/
def cycleLabel (k : ℕ) : Fin (k + 1) → Perm (Fin (2 * k + 3)) :=
  Fin.cases
    (swap (baseLetter k 0) (baseLetter k 2) *
      swap (baseLetter k 0) (baseLetter k 1))
    (fun j => swap (baseLetter k 2) (newLetterB k j) *
      swap (baseLetter k 2) (newLetterA k j))

/-- Each block σ_i^5 of the realized positive braid has this meridional relation. -/
theorem adjacent_cinquefoil_relation (k : ℕ) (i : Fin k) :
    let s := cycleLabel k i.castSucc
    let t := cycleLabel k i.succ
    s * t * s * t * s = t * s * t * s * t := by
  sorry

def factorLabels (k : ℕ) : Set (Perm (Fin (2 * k + 3))) :=
  {swap (baseLetter k 0) (baseLetter k 1),
   swap (baseLetter k 0) (baseLetter k 2)} ∪
  {g | ∃ j : Fin k,
    g = swap (baseLetter k 2) (newLetterA k j) ∨
    g = swap (baseLetter k 2) (newLetterB k j)}

/-- The tree has precisely the two base edges and two new edges per summand. -/
theorem closure_factorLabels (k : ℕ) :
    Subgroup.closure (factorLabels k) = ⊤ := by
  sorry

def hurwitz {G : Type*} [Group G] (p : G × G) : G × G :=
  (p.1 * p.2 * p.1⁻¹, p.1)

theorem hurwitz_product {G : Type*} [Group G] (p : G × G) :
    (hurwitz p).1 * (hurwitz p).2 = p.1 * p.2 := by
  simp [hurwitz, mul_assoc]

def factorPair : Perm (Fin 3) × Perm (Fin 3) :=
  (swap 0 2, swap 0 1)

def threeCycle : Perm (Fin 3) := factorPair.1 * factorPair.2

/-- Two crossings (one full twist) reach all three ordered factorizations. -/
theorem full_twist_orbit : ∀ p : Perm (Fin 3) × Perm (Fin 3),
    (p.1.IsSwap ∧ p.2.IsSwap ∧ p.1 * p.2 = threeCycle) ↔
      ∃ j : Fin 3, (hurwitz^[2 * j.val]) factorPair = p := by
  unfold Equiv.Perm.IsSwap
  decide +kernel

theorem three_full_twists : (hurwitz^[6]) factorPair = factorPair := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.IndexedDoubling

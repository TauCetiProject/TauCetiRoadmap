import TauCeti.KnotTheory.GaussCode.PDCode.Basic
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
These are cardinalities of actual canonical native Gauss codes BEFORE planarity
filtering. The README separately owns geometric extraction, realization,
equivalence, outer faces and diagram bounds. No word-uniqueness theorem is assumed.
-/

noncomputable section
namespace TauCetiRoadmap.GeometricTopology.DowkerCount
open TauCeti

/-- The one-based odd encounter 2i+1 has zero-based index 2i. -/
def oddVisit {n : ℕ} (i : Fin n) : Fin (2*n) := ⟨2*i.val, by omega⟩

/-- Crossing names are canonical odd-encounter labels, not extra decorations. -/
def canonicalCodes (n : ℕ) :=
  {D : BasedOrientedGaussCode n //
    (∀ i : Fin n, D.visit (oddVisit i) = i) ∧
    ∀ v : Fin (2*n), (D.partner.val v).val % 2 ≠ v.val % 2}

/-- Matching permutation, odd-visit over bits, then native crossing-sign bits. -/
abbrev Coordinates (n : ℕ) :=
  Equiv.Perm (Fin n) × (Fin n → Bool) × (Fin n → Bool)

/-- The actual canonical native codes have all three independent coordinate families. -/
theorem coordinate_equiv (n : ℕ) : Nonempty (canonicalCodes n ≃ Coordinates n) := by
  sorry

theorem coordinates_card (n : ℕ) : Nat.card (Coordinates n) = n.factorial * 4^n := by
  simp only [Nat.card_eq_fintype_card, Fintype.card_prod, Fintype.card_perm,
    Fintype.card_fin, Fintype.card_fun, Fintype.card_bool]
  rw [← mul_pow]
  norm_num

theorem canonical_card (n : ℕ) : Nat.card (canonicalCodes n) = n.factorial * 4^n := by
  obtain ⟨e⟩ := coordinate_equiv n
  exact (Nat.card_congr e).trans (coordinates_card n)

/-- Alternation is cyclic; an even-length visit list is determined by its first bit. -/
def alternatingCodes (n : ℕ) :=
  {D : canonicalCodes n // ∃ first : Bool, ∀ v : Fin (2*n),
    D.val.over v = Bool.xor first (decide (v.val % 2 = 1))}

/-- At positive size the first over bit is genuine data, rather than an empty choice. -/
theorem alternating_equiv {n : ℕ} (hn : 0 < n) :
    Nonempty (alternatingCodes n ≃ Equiv.Perm (Fin n) × (Fin n → Bool) × Bool) := by
  sorry

theorem alternating_card {n : ℕ} (hn : 0 < n) :
    Nat.card (alternatingCodes n) = n.factorial * 2^(n+1) := by
  obtain ⟨e⟩ := alternating_equiv hn
  rw [Nat.card_congr e]
  simp [Nat.card_eq_fintype_card, Fintype.card_perm, pow_succ]

end TauCetiRoadmap.GeometricTopology.DowkerCount

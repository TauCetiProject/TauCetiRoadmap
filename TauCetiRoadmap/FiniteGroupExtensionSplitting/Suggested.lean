import Mathlib.GroupTheory.Complement
import Mathlib.GroupTheory.Sylow

/-!
# Splitting finite extensions: suggested interfaces

This file is not the roadmap and is not exhaustive. `README.md` is definitive;
these are suggested forms for selected targets, not a complete checklist.
Every `sorry` is a mathematical target.
-/

namespace TauCetiRoadmap.FiniteGroupExtensionSplitting

variable {G : Type*} [Group G] [Finite G]

theorem exists_isComplement'_of_coprime_index (N H K : Subgroup G)
    [N.Normal] [IsMulCommutative N]
    (hcop : Nat.Coprime H.index (Nat.card N))
    (hinf : N ⊓ K = ⊥) (hsup : N ⊔ K = H) :
    ∃ D : Subgroup G, Subgroup.IsComplement' N D := sorry

theorem exists_isComplement'_iff_sylow {p : ℕ} [Fact p.Prime]
    (N : Subgroup G) [N.Normal] [IsMulCommutative N]
    (hN : IsPGroup p N) (P : Sylow p G) :
    (∃ D : Subgroup G, Subgroup.IsComplement' N D) ↔
      ∃ K : Subgroup G, N ⊓ K = ⊥ ∧ N ⊔ K = (P : Subgroup G) := sorry

end TauCetiRoadmap.FiniteGroupExtensionSplitting

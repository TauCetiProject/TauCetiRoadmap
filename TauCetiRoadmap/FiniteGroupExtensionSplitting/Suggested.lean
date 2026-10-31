import Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree
import Mathlib.GroupTheory.GroupExtension.Defs
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

/-- Conjugation on a normal abelian subgroup, with the action made explicit. -/
abbrev conjugationAction (N : Subgroup G) [N.Normal] : MulDistribMulAction G N :=
  MulDistribMulAction.compHom N (MulAut.conjNormal (H := N))

/-- The crossed-projection criterion uses the native cocycle predicate. -/
theorem exists_complement_iff_crossedProjection (N : Subgroup G) [N.Normal]
    [IsMulCommutative N] :
    letI : CommGroup N := { (inferInstance : Group N) with
      mul_comm := fun a b => IsMulCommutative.is_comm.comm a b }
    letI := conjugationAction N
    (∃ D : Subgroup G, Subgroup.IsComplement' N D) ↔
      ∃ c : G → N, groupCohomology.IsMulCocycle₁ c ∧ ∀ n : N, c n = n := sorry

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

/-- External-action form; the internal form follows by restricting conjugation. -/
theorem exists_invariant_complement {A W : Type*} [Group A] [Finite A]
    [Group W] [Finite W] [MulDistribMulAction A W]
    {p q : ℕ} [Fact p.Prime] [Fact q.Prime] (hpq : p ≠ q)
    (hA : IsPGroup q A) (N : Subgroup W) [N.Normal] [IsMulCommutative N]
    (hN : IsPGroup p N) (hstable : ∀ (a : A) (n : W), n ∈ N → a • n ∈ N)
    (P : Sylow p W) (hlocal : ∃ K : Subgroup W, N ⊓ K = ⊥ ∧ N ⊔ K = (P : Subgroup W)) :
    ∃ D : Subgroup W, Subgroup.IsComplement' N D ∧
      ∀ (a : A) (d : W), d ∈ D → a • d ∈ D := sorry

end TauCetiRoadmap.FiniteGroupExtensionSplitting

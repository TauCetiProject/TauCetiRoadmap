module

import Mathlib
import TauCeti.GroupTheory.GroupExtension.FactorSetOfSection
import TauCeti.GroupTheory.GroupExtension.Cohomology

/-!
# FiniteGroupExtensionSplitting: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions needed to state them: the conjugation action of `G` on an abelian normal subgroup
`N`, the induced action of `G ⧸ N` on `N`, and the quotient extension `N → G → G ⧸ N` as a
`GroupExtension`.

Stated here: the dictionary between complements and normalized crossed maps (§1.3), the
comparison with the pinned extension cohomology (§2.6), Gaschütz's coprime-index splitting
theorem (§2.4), its Sylow form (§3.1) and the invariant-complement theorem (§3.2). The
comparison is stated for `G : Type` only, because the pinned `TauCeti.FactorSet.cohomologyClass`
is defined for `G M : Type`; every other statement is universe-polymorphic. Nothing of the
roadmap's headlines is left unstated.
-/

namespace TauCetiRoadmap.FiniteGroupExtensionSplitting

open Subgroup

/-! ## Layer 1: crossed projections -/

section Action

variable {G : Type*} [Group G]

/-- **The conjugation action** of `G` on a normal subgroup `N`: `g • n = g * n * g⁻¹`, the
evaluation action of `MulAut N` pulled back along `MulAut.conjNormal`. -/
abbrev conjugationAction (N : Subgroup G) [N.Normal] : MulDistribMulAction G N :=
  MulDistribMulAction.compHom N (MulAut.conjNormal (H := N))

/-- **The quotient action** of `G ⧸ N` on an abelian normal subgroup `N`: conjugation by any
representative, which is well defined because `N` acts trivially on itself by conjugation. -/
abbrev quotientConjugationAction (N : Subgroup G) [N.Normal] [IsMulCommutative N] :
    MulDistribMulAction (G ⧸ N) N :=
  MulDistribMulAction.compHom N (QuotientGroup.lift N (MulAut.conjNormal (H := N)) fun n hn => by
    rw [MonoidHom.mem_ker]
    refine MulEquiv.ext fun m => Subtype.ext ?_
    have h := congrArg Subtype.val (IsMulCommutative.is_comm.comm (⟨n, hn⟩ : N) m)
    simp only [Subgroup.coe_mul] at h
    change n * (m : G) * n⁻¹ = m
    rw [h, mul_inv_cancel_right])

/-- **The quotient extension** `N → G → G ⧸ N` of a normal subgroup, as a `GroupExtension`. -/
def quotientExtension (N : Subgroup G) [N.Normal] : GroupExtension N G (G ⧸ N) where
  inl := N.subtype
  rightHom := QuotientGroup.mk' N
  inl_injective := N.subtype_injective
  range_inl_eq_ker_rightHom := by rw [N.range_subtype, QuotientGroup.ker_mk']
  rightHom_surjective := QuotientGroup.mk'_surjective N

open scoped IsMulCommutative in
/-- The quotient extension of an abelian normal subgroup induces the quotient action: conjugating
`N` by `g ∈ G` inside `G` is the action of the coset of `g`. -/
theorem quotientExtension_inducesAction (N : Subgroup G) [N.Normal] [IsMulCommutative N] :
    letI := quotientConjugationAction N
    TauCeti.GroupExtension.InducesAction (quotientExtension N) := by
  let _ := quotientConjugationAction N
  refine (TauCeti.GroupExtension.inducesAction_iff_conjActOfSection_eq
    (quotientExtension N).surjInvRightHom).2 ?_
  refine MonoidHom.ext fun g => MulEquiv.ext fun m => Subtype.ext ?_
  conv_rhs => rw [← (quotientExtension N).surjInvRightHom.rightHom_section g]
  rw [TauCeti.GroupExtension.conjActOfSection_apply]
  exact (quotientExtension N).inl_conjAct_comm

end Action

section Crossed

variable {G : Type*} [Group G]

open scoped IsMulCommutative in
/-- **Complements are kernels of normalized crossed maps.** For an abelian normal subgroup `N`
of a group `G` (no finiteness is needed), `N` has a complement in `G` if and only if there is a
crossed homomorphism `c : G → N` for the conjugation action (`c (g * h) = g • c h * c g`) with
`c n = n` for every `n ∈ N`; the complement is `ker c` and `c` is the projection `g = n * d ↦ n`
along the complement. -/
theorem exists_complement_iff_crossedProjection (N : Subgroup G) [N.Normal]
    [IsMulCommutative N] :
    letI := conjugationAction N
    (∃ D : Subgroup G, N.IsComplement' D) ↔
      ∃ c : G → N, groupCohomology.IsMulCocycle₁ c ∧ ∀ n : N, c n = n := sorry

end Crossed

/-! ## Layer 2: transfer, coprime-index detection and the cohomological comparison -/

section Gaschutz

variable {G : Type*} [Group G]

/-- **Gaschütz's splitting theorem** (Gaschütz 1952, Satz 1, p. 99): an abelian normal subgroup
`N` of a finite group `G` that has a complement `K` in a subgroup `H ≥ N` whose index `[G : H]`
is coprime to `|N|` has a complement in `G`. No solvability, centrality of `N` or coprimality of
`|N|` with `[G : N]` is assumed. -/
theorem exists_isComplement'_of_coprime_index [Finite G] (N H K : Subgroup G)
    [N.Normal] [IsMulCommutative N]
    (hcop : Nat.Coprime H.index (Nat.card N))
    (hinf : N ⊓ K = ⊥) (hsup : N ⊔ K = H) :
    ∃ D : Subgroup G, N.IsComplement' D := sorry

end Gaschutz

section Cohomological

variable {G : Type} [Group G]

open scoped IsMulCommutative in
/-- **The cohomological comparison.** For an abelian normal subgroup `N` of a group `G` (no
finiteness is needed) and any normalized section `σ` of the quotient extension `N → G → G ⧸ N`,
`N` has a complement in `G` if and only if the class in `H²(G ⧸ N, N)` of the factor set of `σ`
vanishes. Stated for `G : Type` because the pinned `TauCeti.FactorSet.cohomologyClass` is. -/
theorem exists_complement_iff_cohomologyClass_eq_zero (N : Subgroup G) [N.Normal]
    [IsMulCommutative N] (σ : (quotientExtension N).Section) (hσ : σ 1 = 1) :
    letI := quotientConjugationAction N
    (∃ D : Subgroup G, N.IsComplement' D) ↔
      (TauCeti.GroupExtension.factorSet σ hσ
        (quotientExtension_inducesAction N)).cohomologyClass = 0 := sorry

end Cohomological

/-! ## Layer 3: Sylow detection and invariant complements -/

section Sylow

variable {G : Type*} [Group G]

/-- **Sylow detection** (Gaschütz 1952, 2. Reduktionssatz, p. 100): an abelian normal
`p`-subgroup `N` of a finite group `G` has a complement in `G` if and only if it has a complement
in a Sylow `p`-subgroup `P` (which contains `N`), the latter written as a local complement
`N ⊓ K = ⊥`, `N ⊔ K = P`. -/
theorem exists_isComplement'_iff_sylow [Finite G] {p : ℕ} [Fact p.Prime]
    (N : Subgroup G) [N.Normal] [IsMulCommutative N]
    (hN : IsPGroup p N) (P : Sylow p G) :
    (∃ D : Subgroup G, N.IsComplement' D) ↔
      ∃ K : Subgroup G, N ⊓ K = ⊥ ∧ N ⊔ K = (P : Subgroup G) := sorry

/-- **Invariant complements.** If a finite `q`-group `A` acts by automorphisms on a finite group
`W`, stabilises an abelian normal `p`-subgroup `N` of `W` with `p ≠ q`, and `N` has a complement
in a Sylow `p`-subgroup `P` of `W`, then `N` has an `A`-stable complement in `W`. No coprimality
of `|A|` and `|W|` is assumed. -/
theorem exists_invariant_complement {A W : Type*} [Group A] [Finite A]
    [Group W] [Finite W] [MulDistribMulAction A W]
    {p q : ℕ} [Fact p.Prime] [Fact q.Prime] (hpq : p ≠ q)
    (hA : IsPGroup q A) (N : Subgroup W) [N.Normal] [IsMulCommutative N]
    (hN : IsPGroup p N) (hstable : ∀ (a : A) (n : W), n ∈ N → a • n ∈ N)
    (P : Sylow p W) (hlocal : ∃ K : Subgroup W, N ⊓ K = ⊥ ∧ N ⊔ K = (P : Subgroup W)) :
    ∃ D : Subgroup W, N.IsComplement' D ∧
      ∀ (a : A) (d : W), d ∈ D → a • d ∈ D := sorry

end Sylow

end TauCetiRoadmap.FiniteGroupExtensionSplitting

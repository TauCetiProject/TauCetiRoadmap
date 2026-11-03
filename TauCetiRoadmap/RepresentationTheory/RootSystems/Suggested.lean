import Mathlib
import TauCeti.LinearAlgebra.RootSystem.Coxeter.Presentation
import TauCeti.LinearAlgebra.RootSystem.Inversions.Basic
import TauCeti.LinearAlgebra.RootSystem.RootLength

/-!
# Root systems: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the marked Coxeter presentation and
length formula, root-automorphism complements and the based diagram identification,
the invariant metric scale, greatest roots, and the type A Weyl-group identification.

The Weyl group of a G₂ system and the two-length theorem are pinned Tau Ceti and
Mathlib theorems, cited in the README's supplier contracts, so they are not stated here.
The componentwise metric parameterization needs the constructed family of
irreducible root subspaces and their restricted root pairings. The comparison of
full integral data with rational cylinder chambers needs scalar extension of an
arbitrary finite-free root datum, beyond the pinned dot-product base change.
Those constructions remain README targets; no substitute carrier is asserted here.
-/

namespace TauCetiRoadmap.RepresentationTheory.RootSystems

/- The native Dynkin family is also exposed under the name used by consumers. -/
export TauCeti (DynkinType)

namespace DynkinType
export _root_.TauCeti.DynkinType (A B C D E6 E7 E8 F4 G2 rank Valid IsLongSimpleRoot)
end DynkinType

open scoped Pointwise

/-! ## Layer 1: the marked Coxeter presentation -/

section Coxeter
variable {ι R M N : Type*} [CommRing R] [CharZero R] [IsDomain R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-- The Weyl group has the Coxeter presentation on the specified simple reflections. -/
theorem exists_marked_weylCoxeterSystem
    (P : RootPairing ι R M N) [Finite ι] [P.IsRootSystem]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base) :
    ∃ cs : CoxeterSystem (TauCeti.coxeterMatrixOfBase P b) P.weylGroup,
      ∀ i : b.support, cs.simple i = RootPairing.weylGroup.ofIdx P (i : ι) := sorry

/-- Coxeter length counts positive roots carried to negative roots, with the generators marked. -/
theorem length_eq_inversions
    (P : RootPairing ι R M N) [Finite ι] [P.IsRootSystem]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base)
    (cs : CoxeterSystem (TauCeti.coxeterMatrixOfBase P b) P.weylGroup)
    (hcs : ∀ i : b.support, cs.simple i = RootPairing.weylGroup.ofIdx P (i : ι))
    (w : P.weylGroup) :
    cs.length w = (TauCeti.inversions P b w).ncard := sorry
end Coxeter

/-! ## Layer 2: root automorphisms and the based complement -/

/-- The inverse image of the setwise simple-index stabilizer under the native index action. -/
noncomputable def basedAut {ι R M N : Type*} [CommRing R]
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (P : RootPairing ι R M N) (b : P.Base) : Subgroup P.Aut :=
  (MulAction.stabilizer (Equiv.Perm ι) (b.support : Set ι)).comap
    (RootPairing.Equiv.indexHom P)

/-- For finite spanning real systems the Weyl group complements the stabilizer of a base. -/
theorem weyl_based_complement {ι M N : Type*}
    [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]
    (P : RootPairing ι ℝ M N) [Finite ι] [P.IsRootSystem]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base) :
    P.weylGroup.IsComplement' (basedAut P b) := sorry

/-- Every permutation of the simple indices preserving Cartan entries extends to exactly one
based root-pairing automorphism, with that specified action on simple indices. -/
theorem existsUnique_basedAut_of_cartanMatrix {ι R M N : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (P : RootPairing ι R M N) [Finite ι] [P.IsRootSystem]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base)
    (σ : Equiv.Perm b.support)
    (hσ : ∀ i j, b.cartanMatrix (σ i) (σ j) = b.cartanMatrix i j) :
    ∃! g : basedAut P b, ∀ i : b.support,
      g.val.indexEquiv (i : ι) = ((σ i : b.support) : ι) := sorry

/-- The complement theorem for full finite-free integral root data retains the central lattice. -/
theorem full_datum_complement {ι X Y : Type*} [Finite ι]
    [AddCommGroup X] [AddCommGroup Y]
    [Module.Finite ℤ X] [Module.Free ℤ X] [Module.Finite ℤ Y] [Module.Free ℤ Y]
    (D : RootDatum ι X Y) [D.IsCrystallographic] [D.IsReduced] (b : D.Base) :
    D.weylGroup.IsComplement' (basedAut D b) := sorry

/-! ## Layer 3: invariant metrics and root lengths -/

/-- Two positive invariant forms on an irreducible spanning real root pairing differ by
one unique positive scalar. -/
theorem invariantMetric_unique_scale {ι M N : Type*} [Fintype ι]
    [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]
    (P : RootPairing ι ℝ M N) [P.IsRootSystem] [P.IsIrreducible]
    (B C : P.InvariantForm)
    (hB : B.form.toQuadraticMap.PosDef) (hC : C.form.toQuadraticMap.PosDef) :
    ∃! c : ℝ, 0 < c ∧ C.form = c • B.form := sorry

/-! ## Layer 4: coefficient reflections and the greatest root -/

/-- An irreducible finite reduced crystallographic root system has a unique greatest positive
root in the componentwise order of its integral simple-root coordinates. -/
theorem existsUnique_greatest_positive_root {ι R M N : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (P : RootPairing ι R M N) [Finite ι] [P.IsRootSystem]
    [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible] (b : P.Base) :
    ∃! θ : ι, b.IsPos θ ∧ ∀ j : ι, b.IsPos j → ∀ k : b.support,
      b.toWeightBasisInt.repr (P.rootSpanMem ℤ j) k ≤
        b.toWeightBasisInt.repr (P.rootSpanMem ℤ θ) k := sorry

/-! ## Layer 5: the type A Weyl group -/

/-- A system with a base of Cartan type Aₙ has Weyl group Sₙ₊₁; for n = 0 both sides are trivial. -/
theorem weylGroup_equiv_perm_of_typeA {ι R M N : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (P : RootPairing ι R M N) [Finite ι] [P.IsRootSystem]
    [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) {n : ℕ} (h : TauCeti.HasCartanType P b (.A n)) :
    Nonempty (P.weylGroup ≃* Equiv.Perm (Fin (n + 1))) := sorry

end TauCetiRoadmap.RepresentationTheory.RootSystems

import Mathlib
import TauCeti.GroupTheory.Coxeter.Geometric
import TauCeti.LinearAlgebra.RootSystem.Coxeter.Presentation
import TauCeti.LinearAlgebra.RootSystem.Inversions.Basic
import TauCeti.LinearAlgebra.RootSystem.FiniteType.Classification
import TauCeti.LinearAlgebra.RootSystem.HighestRoot
import TauCeti.LinearAlgebra.RootSystem.SimplyConnectedRootDatum.Rational
import TauCeti.LinearAlgebra.RootSystem.RootLength

/-!
# Root systems and Coxeter representations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: geometric root
signs, faithfulness and the integral realization of the geometric action, the
inversion length on the presented Weyl group, the rational classification, the
type A Weyl group over characteristic-zero domains, the root-string
characterization of the highest root, the Weyl/based complement with the based
diagram identification, and the invariant metric scale.

Tits' theorem, the marked Coxeter system on the Weyl group and its length formula,
base independence of the Cartan type, the highest root, the G₂ Weyl group and the
two-length theorem are pinned Tau Ceti and Mathlib theorems, cited in the README's
supplier contracts, so they are not stated here. The componentwise metric
parameterization needs the constructed family of irreducible root subspaces and
their restricted root pairings; it remains a README target, and no substitute
carrier is asserted here.

The native Dynkin declarations are also exported under the established namespace
used by CFSGStatement. These are aliases of the supplier's declarations.
-/

namespace TauCetiRoadmap.RepresentationTheory.RootSystems

export TauCeti (DynkinType)

namespace DynkinType
export _root_.TauCeti.DynkinType (A B C D E6 E7 E8 F4 G2 rank Valid IsLongSimpleRoot)
end DynkinType

open scoped Pointwise

/-! ## Layer 1: geometric roots and faithful representations -/

/-- A positive geometric vector has nonnegative coordinates and at least one positive coordinate. -/
def GeometricPositive {I : Type*} (v : I →₀ ℝ) : Prop :=
  (∀ i, 0 ≤ v i) ∧ ∃ i, 0 < v i

/-- An alternating word ending in the other generator sends the first simple root into
the nonnegative span of the two simple roots, before the finite braid length. -/
theorem rankTwo_nonnegative {I W : Type*} [Group W]
    {M : CoxeterMatrix I} (cs : CoxeterSystem M W) (i j : I) (k : ℕ)
    (hk : k < M i j ∨ M i j = 0) :
    ∃ a b : ℝ, 0 ≤ a ∧ 0 ≤ b ∧
      cs.geometricRepresentation (cs.wordProd (CoxeterSystem.alternatingWord i j k))
        (Finsupp.single i 1) = a • Finsupp.single i 1 + b • Finsupp.single j 1 := sorry

/-- The sign of the image of a simple root detects right descents, for every Coxeter
system, including infinite rank and infinite exponents (Humphreys, §5.4). -/
theorem geometric_sign_criterion {I W : Type*} [Group W]
    {M : CoxeterMatrix I} (cs : CoxeterSystem M W) (w : W) (i : I) :
    (GeometricPositive (cs.geometricRepresentation w (Finsupp.single i 1)) ↔
      ¬ cs.IsRightDescent w i) ∧
    (GeometricPositive (-cs.geometricRepresentation w (Finsupp.single i 1)) ↔
      cs.IsRightDescent w i) := sorry

/-- The standard geometric representation is faithful, without nondegeneracy or
finiteness assumptions (Humphreys, §5.4, Corollary, with finite-support extension). -/
theorem geometric_faithfulness {I W : Type*} [Group W]
    {M : CoxeterMatrix I} (cs : CoxeterSystem M W) :
    Function.Injective cs.geometricRepresentation := sorry

/-- An integral Gram matrix twice the standard geometric form gives a faithful
integral reflection representation, with coefficientwise scalar extension equal
to the standard real action. -/
theorem integral_geometric_realization {I W : Type*} [Group W]
    {M : CoxeterMatrix I} (cs : CoxeterSystem M W) (A : Matrix I I ℤ)
    (hA : ∀ i j, (A i j : ℝ) =
      2 * M.geometricForm (Finsupp.single i 1) (Finsupp.single j 1)) :
    ∃ ρ : Representation ℤ W (I →₀ ℤ), Function.Injective ρ ∧
      (∀ i x, ρ (cs.simple i) x =
        x - (x.sum fun j a => a * A i j) • Finsupp.single i 1) ∧
      (∀ w x, Finsupp.mapRange (fun a : ℤ => (a : ℝ)) (Int.cast_zero) (ρ w x) =
        cs.geometricRepresentation w
          (Finsupp.mapRange (fun a : ℤ => (a : ℝ)) (Int.cast_zero) x)) := sorry

/-! ## Layer 2: the marked Weyl presentation -/

/-- Length in the presented group equals the inversion count of its image in the
Weyl group under the marked presentation homomorphism. -/
theorem presentation_length_eq_inversions {ι R V U : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup V] [Module R V] [AddCommGroup U] [Module R U]
    (P : RootPairing ι R V U) [Finite ι] [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) (w : (TauCeti.coxeterMatrixOfBase P b).Group) :
    (TauCeti.coxeterMatrixOfBase P b).toCoxeterSystem.length w =
      (TauCeti.inversions P b (TauCeti.weylCoxeterHom P b w)).ncard := sorry

/-! ## Layer 3: classification and concrete Weyl groups -/

/-- Each nonempty irreducible finite reduced crystallographic rational root system
is isomorphic to the native rational model of exactly one valid Dynkin type. -/
theorem rational_classification {ι V U : Type*}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup U] [Module ℚ U]
    (P : RootPairing ι ℚ V U) [Finite ι] [Nonempty ι]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible] :
    ∃! t : TauCeti.DynkinType,
      ∃ ht : t.Valid, Nonempty (P.Equiv (t.rationalRootSystem ht)) := sorry

/-- A finite reduced crystallographic root pairing over a characteristic-zero domain
with a base of type Aₙ has Weyl group the symmetric group on n+1 letters, without a
spanning hypothesis; for n = 0 both groups are trivial. -/
theorem weylGroup_equiv_perm_of_typeA {ι R V U : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup V] [Module R V] [AddCommGroup U] [Module R U]
    (P : RootPairing ι R V U) [Finite ι]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base) {n : ℕ}
    (h : TauCeti.HasCartanType P b (.A n)) :
    Nonempty (P.weylGroup ≃* Equiv.Perm (Fin (n + 1))) := sorry

/-! ## Layer 4: coefficient reflections and the greatest root -/

/-- A positive root to which no simple root can be added within the root set is the
highest root. -/
theorem eq_highestRoot_of_forall_root_add_notMem {ι R V U : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup V] [Module R V] [AddCommGroup U] [Module R U]
    (P : RootPairing ι R V U) [Finite ι] [Nonempty ι]
    [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible] (b : P.Base) {i : ι}
    (hi : b.IsPos i) (h : ∀ k ∈ b.support, P.root i + P.root k ∉ Set.range P.root) :
    i = b.highestRoot := sorry

/-! ## Layer 5: root automorphisms and the based complement -/

/-- The inverse image of the setwise simple-index stabilizer under the native index action. -/
noncomputable def basedAut {ι R V U : Type*} [CommRing R]
    [AddCommGroup V] [Module R V] [AddCommGroup U] [Module R U]
    (P : RootPairing ι R V U) (b : P.Base) : Subgroup P.Aut :=
  (MulAction.stabilizer (Equiv.Perm ι) (b.support : Set ι)).comap
    (RootPairing.Equiv.indexHom P)

/-- The Weyl group complements the stabilizer of a base, for finite reduced
crystallographic pairings over a characteristic-zero domain; neither spanning nor
real coefficients is assumed, so root data are included. -/
theorem weyl_based_complement {ι R V U : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup V] [Module R V] [AddCommGroup U] [Module R U]
    (P : RootPairing ι R V U) [Finite ι]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base) :
    P.weylGroup.IsComplement' (basedAut P b) := sorry

/-- Every permutation of the simple indices preserving Cartan entries extends to exactly one
based root-pairing automorphism, with that specified action on simple indices. -/
theorem existsUnique_basedAut_of_cartanMatrix {ι R V U : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup V] [Module R V] [AddCommGroup U] [Module R U]
    (P : RootPairing ι R V U) [Finite ι] [P.IsRootSystem]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base)
    (σ : Equiv.Perm b.support)
    (hσ : ∀ i j, b.cartanMatrix (σ i) (σ j) = b.cartanMatrix i j) :
    ∃! g : basedAut P b, ∀ i : b.support,
      g.val.indexEquiv (i : ι) = ((σ i : b.support) : ι) := sorry

/-! ## Layer 6: invariant metrics and root lengths -/

/-- Two positive invariant forms on an irreducible spanning real root pairing differ by
one unique positive scalar. -/
theorem invariantMetric_unique_scale {ι V U : Type*} [Fintype ι]
    [AddCommGroup V] [Module ℝ V] [AddCommGroup U] [Module ℝ U]
    (P : RootPairing ι ℝ V U) [P.IsRootSystem] [P.IsIrreducible]
    (B C : P.InvariantForm)
    (hB : B.form.toQuadraticMap.PosDef) (hC : C.form.toQuadraticMap.PosDef) :
    ∃! c : ℝ, 0 < c ∧ C.form = c • B.form := sorry

end TauCetiRoadmap.RepresentationTheory.RootSystems

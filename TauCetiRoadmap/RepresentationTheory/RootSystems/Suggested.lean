import Mathlib
import TauCeti.GroupTheory.Coxeter.Geometric
import TauCeti.LinearAlgebra.RootSystem.Coxeter.Presentation
import TauCeti.LinearAlgebra.RootSystem.Inversions.Basic
import TauCeti.LinearAlgebra.RootSystem.FiniteType.Classification
import TauCeti.LinearAlgebra.RootSystem.SimplyConnectedRootDatum.Rational
import TauCeti.LinearAlgebra.RootSystem.RootLength

/-!
# Root systems and Coxeter representations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: geometric root
signs and faithfulness, integral realization of the geometric action, the marked
Weyl presentation and its length bridge, classification independent of the base,
and the type A Weyl group. All these headlines are statable at the pins; none
needs a missing carrier. The rational classification uses the native rational
models, with root indices `Fin t.numRoots` and coordinate indices `Fin t.rank`.
The general coefficient-ring classification is stated separately on native bases.

The native Dynkin declarations are also exported under the established namespace
used by CFSGStatement. These are aliases of the supplier's declarations.
-/

namespace TauCetiRoadmap.RepresentationTheory.RootSystems

export TauCeti (DynkinType)

namespace DynkinType
export TauCeti.DynkinType (A B C D E6 E7 E8 F4 G2 rank Valid IsLongSimpleRoot)
end DynkinType

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

/-- The canonical map sending each presented generator to its specified simple
root reflection is injective: the Coxeter relations are complete. -/
theorem weylCoxeterHom_injective {ι R V U : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup V] [Module R V] [AddCommGroup U] [Module R U]
    (P : RootPairing ι R V U) [Finite ι] [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) : Function.Injective (TauCeti.weylCoxeterHom P b) := sorry

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

/-- A nonempty irreducible finite reduced crystallographic root system has one
valid Dynkin type simultaneously for all its bases, given one base. -/
theorem classification_independent_base {ι R V U : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup V] [Module R V] [AddCommGroup U] [Module R U]
    (P : RootPairing ι R V U) [Finite ι] [Nonempty ι]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible]
    (b₀ : P.Base) :
    ∃! t : TauCeti.DynkinType, t.Valid ∧ ∀ b : P.Base, TauCeti.HasCartanType P b t := sorry

/-- Each nonempty irreducible finite reduced crystallographic rational root system
is isomorphic to the native rational model of exactly one valid Dynkin type. -/
theorem rational_classification {ι V U : Type*}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup U] [Module ℚ U]
    (P : RootPairing ι ℚ V U) [Finite ι] [Nonempty ι]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible] :
    ∃! t : TauCeti.DynkinType,
      ∃ ht : t.Valid, Nonempty (P.Equiv (t.rationalRootSystem ht)) := sorry

/-- A finite reduced crystallographic root pairing of type A and rank n has Weyl
group the symmetric group on n+1 letters, without a spanning hypothesis. -/
theorem weylGroup_equiv_perm_of_typeA {ι R V U : Type*}
    [CommRing R] [CharZero R] [IsDomain R]
    [AddCommGroup V] [Module R V] [AddCommGroup U] [Module R U]
    (P : RootPairing ι R V U) [Finite ι]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base) {n : ℕ} (hn : 1 ≤ n)
    (h : TauCeti.HasCartanType P b (.A n)) :
    Nonempty (P.weylGroup ≃* Equiv.Perm (Fin (n + 1))) := sorry

end TauCetiRoadmap.RepresentationTheory.RootSystems

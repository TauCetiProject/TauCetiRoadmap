import Mathlib
import TauCeti.CategoryTheory.GrothendieckGroup.Triangulated
import TauCeti.CategoryTheory.GrothendieckGroup.BoundedComplex

/-!
# General algebraic K-theory: headline theorem signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; these statements suggest Lean forms for its mathematical milestones.

The statements below cover Quillen's Theorem A and its dual (§1.4), Thomason's
classification of dense triangulated subcategories (§11.4), finite-domination
rectification (§12.6), and the Euler obstruction to returning from idempotent
completion (§12.7). Realized nerves, triangulated K₀, complexes, homotopies and
Karoubi envelopes use the pinned Mathlib and Tau Ceti carriers. Integer-indexed
cochain complexes express the finite-complex results by reindexing chain degrees.

The pins have exact categories and their algebraic K₀, but no exact-category
Q-construction or connective K-theory functor. Thus the plus/Q and S/Q comparisons,
exact additivity, resolution, dévissage and Serre localization have no signatures
here. Waldhausen/S carriers and their K-theory functor are also absent, preventing
statements of fibration, approximation, cofinality, products, transfers, relative
excision, projective-line splitting and the Nil/Fundamental Theorems. The Bass and
Frobenius nonconnective spectra, controlled-cone models and exact-category derived
models are absent as well. Their comparison, negative localization and vanishing,
idempotent obstruction, enhanced derived invariance and the Artin K₄ counterexample
therefore require those constructions. The finite-field calculation additionally
needs the ordinary higher K-groups; its Brauer comparison needs represented KU,
BU and Adams operations. No substitute K-groups or model predicates are introduced.
-/

noncomputable section
universe u v w u' v' w'
namespace TauCetiRoadmap.GeneralAlgebraicKTheory
open CategoryTheory CategoryTheory.Limits CategoryTheory.Idempotents
open scoped ContinuousMap

/-- Mathlib's realized nerve, the carrier of Quillen's Theorem A (§1.4). -/
abbrev classifyingSpace (C : Type u) [Category.{v} C] : TopCat.{max u v} :=
  SSet.toTop.obj (CategoryTheory.nerve C)
/-- The realized nerve map of a functor (§1.4). -/
abbrev classifyingSpaceMap {C D : Type u} [Category.{v} C] [Category.{v} D]
    (F : C ⥤ D) : C(classifyingSpace C, classifyingSpace D) :=
  (SSet.toTop.map (CategoryTheory.nerveMap F)).hom

/-- Quillen A: contractible under-comma realizations make the realized functor a
homotopy equivalence (§1.4; Quillen, Theorem A, pp.93–95). -/
theorem QuillenA {C D : Type u} [Category.{v} C] [Category.{v} D]
    (F : C ⥤ D) (h : ∀ d : D, ContractibleSpace (classifyingSpace (StructuredArrow d F))) :
    ∃ e : classifyingSpace C ≃ₕ classifyingSpace D,
      e.toFun = classifyingSpaceMap F := sorry

/-- The dual Quillen A criterion using over-comma categories (§1.4). -/
theorem QuillenA_dual {C D : Type u} [Category.{v} C] [Category.{v} D]
    (F : C ⥤ D) (h : ∀ d : D, ContractibleSpace (classifyingSpace (CostructuredArrow F d))) :
    ∃ e : classifyingSpace C ≃ₕ classifyingSpace D,
      e.toFun = classifyingSpaceMap F := sorry

section DenseSubcategories
variable {T : Type u} [Category.{v} T] [Preadditive T] [HasZeroObject T]
  [HasShift T ℤ] [∀ n : ℤ, (shiftFunctor T n).Additive]
  [Pretriangulated T] [IsTriangulated T] [EssentiallySmall.{w} T]

/-- Dense triangulated subcategory membership is detected by the image in K₀
(§11.4; Thomason, Theorem 2.1 and Corollary 2.3). -/
theorem DenseClasses.membership_iff (A : ObjectProperty T) [A.IsTriangulated]
    [A.IsClosedUnderIsomorphisms] [EssentiallySmall.{w} A.FullSubcategory]
    (hdense : A.retractClosure = ⊤) (X : T) :
    A X ↔ TauCeti.TriangulatedK0.of X ∈ (TauCeti.TriangulatedK0.map A.ι).range := sorry

/-- Every subgroup of triangulated K₀ determines a unique strictly full dense
triangulated subcategory (§11.4; Thomason, Theorem 2.1). -/
theorem DenseClasses.classification (H : AddSubgroup (TauCeti.TriangulatedK0 T)) :
    ∃! A : ObjectProperty T,
      A.IsTriangulated ∧ A.IsClosedUnderIsomorphisms ∧ A.retractClosure = ⊤ ∧
        ∀ X : T, A X ↔ TauCeti.TriangulatedK0.of X ∈ H := sorry

/-- Inclusion of a strictly full dense triangulated subcategory is injective on K₀
(§11.4; Thomason, Corollary 2.3). -/
theorem DenseClasses.map_injective (A : ObjectProperty T) [A.IsTriangulated]
    [A.IsClosedUnderIsomorphisms] [EssentiallySmall.{w} A.FullSubcategory]
    (hdense : A.retractClosure = ⊤) :
    Function.Injective (TauCeti.TriangulatedK0.map A.ι) := sorry
end DenseSubcategories

/-- Use finite biproducts to supply the binary biproducts required by split K₀. -/
local instance {C : Type*} [Category* C] [Preadditive C] [HasFiniteBiproducts C] :
    HasBinaryBiproducts C := hasBinaryBiproducts_of_finite_biproducts C

/-- The canonical extension of an additive functor to Karoubi envelopes is additive. -/
local instance {C D : Type*} [Category* C] [Category* D] [Preadditive C] [Preadditive D]
    (F : C ⥤ D) [F.Additive] : ((functorExtension₂ C D).obj F).Additive where
  map_add := by
    intro X Y f g
    ext
    exact F.map_add

section FiniteDomination
variable {A : Type u} {U : Type u'} [Category.{v} A] [Category.{v'} U]
  [Preadditive A] [Preadditive U]

/-- Finite domination by a complex with finite support over the source
additive category (§12.5). -/
structure FiniteChainDomination (F : A ⥤ U) [F.Additive] (V : CochainComplex U ℤ) where
  model : CochainComplex A ℤ
  support : Finset ℤ
  isZeroOutside : ∀ n, n ∉ support → IsZero (model.X n)
  toModel : V ⟶ (F.mapHomologicalComplex (ComplexShape.up ℤ)).obj model
  fromModel : (F.mapHomologicalComplex (ComplexShape.up ℤ)).obj model ⟶ V
  homotopy : Homotopy (toModel ≫ fromModel) (𝟙 V)

/-- A finitely dominated bounded complex has a finite model over the idempotent
completion of the dominating category (§12.6; Ranicki, Proposition 3.2). -/
theorem FiniteDomination.rectification [HasZeroObject A] [HasFiniteBiproducts A]
    [HasZeroObject U] [HasFiniteBiproducts U]
    (F : A ⥤ U) [F.Additive] [F.Full] [F.Faithful]
    (V : CochainComplex U ℤ) (t : Finset ℤ)
    (hV : ∀ n, n ∉ t → IsZero (V.X n)) (dom : FiniteChainDomination F V) :
    ∃ (E : CochainComplex (Karoubi A) ℤ) (s : Finset ℤ),
      (∀ n, n ∉ s → IsZero (E.X n)) ∧
      Nonempty (HomotopyEquiv
        (((toKaroubi U).mapHomologicalComplex (ComplexShape.up ℤ)).obj V)
        ((((functorExtension₂ A U).obj F).mapHomologicalComplex (ComplexShape.up ℤ)).obj E)) :=
  sorry
end FiniteDomination

/-- A bounded complex over the Karoubi envelope returns to the original additive
category exactly when its Euler class lies in the image of split K₀
(§12.7; Ranicki, Proposition 2.1). -/
theorem restrictedCompletion_eulerCriterion {A : Type u} [Category.{v} A] [Preadditive A]
    [HasZeroObject A] [HasFiniteBiproducts A]
    [EssentiallySmall.{w} A] [EssentiallySmall.{w'} (Karoubi A)]
    (K : CochainComplex (Karoubi A) ℤ) (s : Finset ℤ)
    (hs : ∀ n, n ∉ s → IsZero (K.X n)) :
    TauCeti.SplitK0.eulerChar K s ∈ (TauCeti.SplitK0.map (toKaroubi A)).range ↔
      ∃ (L : CochainComplex A ℤ) (t : Finset ℤ),
        (∀ n, n ∉ t → IsZero (L.X n)) ∧
        Nonempty (HomotopyEquiv K
          (((toKaroubi A).mapHomologicalComplex (ComplexShape.up ℤ)).obj L)) := sorry

end TauCetiRoadmap.GeneralAlgebraicKTheory

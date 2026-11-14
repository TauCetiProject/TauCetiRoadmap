import Mathlib

/-!
# Topos-theoretic bridges: target signatures

The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned
Mathlib and Tau Ceti, each with `sorry`, with only the definitions they need.

Headlines stated:
* README 1.1, `MoritaEquivalentCat`, the definition;
* README 1.2, `moritaEquivalentCat_iff_karoubi`;
* README 2.1, `IsBooleanTopos`, `isBooleanTopos_presheaf_iff_isGroupoid` and
  `isGroupoid_iff_of_moritaEquivalentCat`;
* README 2.2, `IsDeMorganTopos`, `isDeMorganTopos_presheaf_iff_rightOreCondition` and
  `rightOreCondition_iff_of_moritaEquivalentCat`;
* README 3.1, `exists_orderIso_ici_of_sheafEquiv`.

Not stated: README 3.1, the order isomorphism between the subtopoi of two equivalent topoi,
lacking GrothendieckTopoi's `Subtopos` (GrothendieckTopoi 4.1); README 4.1, the poset of classes
of quotients of a geometric theory, its isomorphism with the topologies finer than a classifying
one and its transfer along an equivalence of classifying topoi, lacking ClassifyingTopoi's
geometric theories, `CatStructure.IsModel`, `IsClassifyingSite` and `MoritaEquivalent`
(ClassifyingTopoi 1.1, 1.3, 2.1, 2.6).
-/

namespace TauCetiRoadmap.ToposTheoreticBridges

open CategoryTheory CategoryTheory.Idempotents CategoryTheory.Limits

universe u

/-! ## Layer 1: Morita equivalence of small categories -/

/-- Two small categories are Morita equivalent when their presheaf topoi are equivalent. -/
def MoritaEquivalentCat (C D : Type u) [SmallCategory C] [SmallCategory D] : Prop :=
  Nonempty ((Cᵒᵖ ⥤ Type u) ≌ (Dᵒᵖ ⥤ Type u))

/-- Two small categories are Morita equivalent exactly when their Karoubi envelopes are
equivalent (README 1.2). -/
theorem moritaEquivalentCat_iff_karoubi (C D : Type u) [SmallCategory C] [SmallCategory D] :
    MoritaEquivalentCat C D ↔ Nonempty (Karoubi C ≌ Karoubi D) := by
  sorry

/-! ## Layer 2: invariants of presheaf topoi -/

/-- A category whose subobjects form bounded lattices is Boolean when every subobject has a
complement (README 2.1). -/
def IsBooleanTopos (E : Type*) [Category E] [HasPullbacks E] [HasImages E]
    [HasBinaryCoproducts E] [HasInitial E] [InitialMonoClass E] : Prop :=
  ∀ (X : E) (A : Subobject X), ∃ B : Subobject X, IsCompl A B

/-- The presheaf topos of a small category is Boolean exactly when the category is a groupoid
(README 2.1). -/
theorem isBooleanTopos_presheaf_iff_isGroupoid (C : Type u) [SmallCategory C] :
    IsBooleanTopos (Cᵒᵖ ⥤ Type u) ↔ IsGroupoid C := by
  sorry

/-- Being a groupoid is invariant under Morita equivalence (README 2.1). -/
theorem isGroupoid_iff_of_moritaEquivalentCat {C D : Type u} [SmallCategory C] [SmallCategory D]
    (h : MoritaEquivalentCat C D) : IsGroupoid C ↔ IsGroupoid D := by
  sorry

/-- A category whose subobjects form bounded lattices is De Morgan when every subobject `A` has a
pseudocomplement `B`, the largest subobject disjoint from `A`, which has a pseudocomplement `B'`
with `B ⊔ B' = ⊤` (README 2.2). -/
def IsDeMorganTopos (E : Type*) [Category E] [HasPullbacks E] [HasImages E]
    [HasBinaryCoproducts E] [HasInitial E] [InitialMonoClass E] : Prop :=
  ∀ (X : E) (A : Subobject X), ∃ B B' : Subobject X,
    (∀ S : Subobject X, Disjoint S A ↔ S ≤ B) ∧ (∀ S : Subobject X, Disjoint S B ↔ S ≤ B') ∧
      B ⊔ B' = ⊤

/-- The presheaf topos of a small category is De Morgan exactly when the category satisfies the
right Ore condition (README 2.2). -/
theorem isDeMorganTopos_presheaf_iff_rightOreCondition (C : Type u) [SmallCategory C] :
    IsDeMorganTopos (Cᵒᵖ ⥤ Type u) ↔ GrothendieckTopology.RightOreCondition C := by
  sorry

/-- The right Ore condition is invariant under Morita equivalence (README 2.2). -/
theorem rightOreCondition_iff_of_moritaEquivalentCat {C D : Type u} [SmallCategory C]
    [SmallCategory D] (h : MoritaEquivalentCat C D) :
    GrothendieckTopology.RightOreCondition C ↔ GrothendieckTopology.RightOreCondition D := by
  sorry

/-! ## Layer 3: bridges between sites -/

/-- An equivalence `e` of the sheaf topoi of two small sites gives an order isomorphism `φ`
between the topologies finer than the two given ones, under which a sheaf `F` is a sheaf for
`J'` exactly when its image under `e` is a sheaf for `φ J'` (README 3.1). -/
theorem exists_orderIso_ici_of_sheafEquiv {C D : Type u} [SmallCategory C] [SmallCategory D]
    (J : GrothendieckTopology C) (K : GrothendieckTopology D)
    (e : Sheaf J (Type u) ≌ Sheaf K (Type u)) :
    ∃ φ : Set.Ici J ≃o Set.Ici K, ∀ (J' : Set.Ici J) (F : Sheaf J (Type u)),
      Presheaf.IsSheaf J'.1 F.obj ↔ Presheaf.IsSheaf (φ J').1 (e.functor.obj F).obj := by
  sorry

end TauCetiRoadmap.ToposTheoreticBridges

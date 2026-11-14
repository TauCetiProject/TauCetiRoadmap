/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib

/-!
# Prestable ∞-categories: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib, with the two definitions their statements need. Only the abelian layer
(Layer 1) has its carriers at the pins: Noetherian objects, Serre classes, Grothendieck abelian
categories, subobject lattices, Ind-objects and finitely presentable objects are Mathlib's. Stated
here: the Serre class of Noetherian objects and its middle-exact form (§1.1), localizing Serre
classes and kernels of exact colimit-preserving functors (§1.2), the three equivalent exhaustion
conditions, local Noetherianity, the Ind-description extending the inclusion and compact generation (§1.3).

Not statable at the pins (Layers 2–9). Every later headline needs a prestable ∞-category, whose
definition (§2.1, SAG Def. C.1.2.1) asks that the suspension functor of a pointed quasicategory
be fully faithful. Tau Ceti has limits and colimits in quasicategories (`SSet.slice.IsLimit`,
`SSet.coslice.IsColimit`), fully faithful functors (`SSet.IsFullyFaithful`), initial and terminal
vertices and `SSet.catInfty`, but neither library has the suspension functor of a pointed
quasicategory. In particular:
* the stable-envelope criterion (§2.3, SAG Cor. C.1.2.3, planned `isPrestable_iff_exists_stableEnvelope`)
  and additivity (§2.4, SAG Def. C.1.5.1 and the P_Σ statements) also need stable ∞-categories,
  the Spanier–Whitehead colimit in `SSet.catInfty` and P_Σ;
* connective parts of t-structures (§3.1, SAG Prop. C.1.2.9, planned `tfae_isConnectivePart`)
  need t-structures on stable quasicategories (Mathlib's `Triangulated.TStructure` lives on a
  triangulated 1-category);
* Grothendieck prestability, localizing subcategories and quotients (§4.1–§4.5, SAG
  Prop. C.1.4.1, Prop. C.2.3.8, planned `isLocalizing_iff_exists_leftExactLocalization`) need
  presentable quasicategories, spectrum objects and accessible localizations;
* Groth∞ and its filtered colimits, separated quotients and completions (§5.1–§5.4, SAG
  Thm. C.3.3.1, Prop. C.3.3.5, Prop. C.3.6.1, Prop. C.3.6.3, planned `isComplete_postnikovLimit`)
  need PrL inside the large `SSet.catInfty`;
* compact generation, amplitude, anticompleteness, almost compact objects and coherence
  (Layers 6–8, including the recognition theorem SAG Thm. C.6.7.1, planned
  `tfae_isAnticomplete_isCoherent`) need Ind-completion and compact objects of quasicategories,
  and the completion equivalence Groth∞^ch ≃ Groth∞^comp (§7.3, SAG Prop. C.5.9.2) also needs
  Groth∞^lex inside the large `SSet.catInfty`;
* locally Noetherian prestable ∞-categories (§9.1–§9.2, SAG Prop. C.6.9.8, planned
  `tfae_isLocallyNoetherianPrestable`) need the heart and Postnikov truncations of a prestable
  quasicategory.
-/

public section

namespace TauCetiRoadmap.InfinityCategoryTheory.PrestableInfinityCategories

open CategoryTheory Limits

universe v u u'

/-! ## Layer 1: Noetherian objects and locally Noetherian abelian categories -/

section Abelian

variable (A : Type u) [Category.{v} A] [Abelian A]

/-- README §1.1.1. In an abelian category the Noetherian objects form a Serre class: they contain zero and
are closed under subobjects, quotient objects and extensions. (SAG, Prop. C.6.8.2.) -/
theorem isNoetherianObject_isSerreClass : (isNoetherianObject (C := A)).IsSerreClass := by
  sorry

variable {A} in
/-- README §1.3.1. For an object `X` of a Grothendieck abelian category the following are equivalent: `X`
is the union of its Noetherian subobjects; `X` is a small filtered colimit of Noetherian objects;
some small coproduct of Noetherian objects maps epimorphically onto `X`. (SAG, Prop. C.6.8.4.) -/
theorem tfae_sSup_noetherianSubobjects_eq_top [IsGrothendieckAbelian.{v} A] (X : A) :
    List.TFAE
      [sSup {P : Subobject X | IsNoetherianObject (P : A)} = ⊤,
        ∃ (J : Type v) (_ : SmallCategory J) (_ : IsFiltered J) (F : J ⥤ A),
          (∀ j, IsNoetherianObject (F.obj j)) ∧ Nonempty (colimit F ≅ X),
        ∃ (ι : Type v) (Y : ι → A) (π : ∐ Y ⟶ X), Epi π ∧ ∀ i, IsNoetherianObject (Y i)] := by
  sorry

/-- README §1.3.1. A Grothendieck abelian category is locally Noetherian when every object receives an
epimorphism from a small coproduct of Noetherian objects. This is the third of the equivalent
conditions of SAG Prop. C.6.8.4, used in SAG Def. C.6.8.5. -/
def IsLocallyNoetherian [IsGrothendieckAbelian.{v} A] : Prop :=
  ∀ X : A, ∃ (ι : Type v) (Y : ι → A) (π : ∐ Y ⟶ X), Epi π ∧ ∀ i, IsNoetherianObject (Y i)

/-- README §1.3.2 (b). In a locally Noetherian Grothendieck abelian category the inclusion of the Noetherian
objects extends along `Ind.yoneda` to an equivalence from their Ind-objects. (SAG, Cor. C.6.8.8.) -/
theorem exists_ind_isNoetherianObject_equivalence [IsGrothendieckAbelian.{v} A]
    (hA : IsLocallyNoetherian A) :
    ∃ F : Ind (isNoetherianObject (C := A)).FullSubcategory ⥤ A,
      Nonempty (Ind.yoneda ⋙ F ≅ (isNoetherianObject (C := A)).ι) ∧ F.IsEquivalence := by
  sorry

/-- README §1.3.2 (c). A locally Noetherian Grothendieck abelian category is locally finitely presentable.
(SAG, Cor. C.6.8.9, first assertion.) -/
theorem isLocallyFinitelyPresentable_of_isLocallyNoetherian [IsGrothendieckAbelian.{v} A]
    (hA : IsLocallyNoetherian A) : IsLocallyFinitelyPresentable.{v} A := by
  sorry

/-- README §1.3.2 (a), (c). In a locally Noetherian Grothendieck abelian category an object is finitely
presentable (compact) exactly when it is Noetherian. The backward implication is SAG
Prop. C.6.8.7. (SAG, Cor. C.6.8.9, second assertion.) -/
theorem isFinitelyPresentable_iff_isNoetherianObject [IsGrothendieckAbelian.{v} A]
    (hA : IsLocallyNoetherian A) (X : A) :
    IsFinitelyPresentable.{v} X ↔ IsNoetherianObject X := by
  sorry

end Abelian

end TauCetiRoadmap.InfinityCategoryTheory.PrestableInfinityCategories

module

public import Mathlib

/-!
# Homotopy theory of small categories: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need, all with real bodies on
native carriers. The API around each target, the special cases and the Checks stay in the README.
The proof obligations of the groupoid, monoidal and symmetric structures of `TwoTerm` are
proved, since the headlines of 12.6 use them.

Classes of functors are `MorphismProperty Cat.{u, u}`, and a functor `F : A ⥤ B` between small
categories enters such a class as `F.toCatHom`. The minimal basic localizer `Winfty` is defined
intrinsically, as an intersection.

Headlines stated here (README target, Lean name):

* 0.1, `CategoryTheory.Adjunction.idempotent_tfae`,
  `Adjunction.isEquivalence_fixedLeftToFixedRight`, `Adjunction.nonempty_reflective_fixedLeft`,
  `Adjunction.nonempty_coreflective_fixedRight` (on `Adjunction.fixedLeft`,
  `Adjunction.fixedRight` and `Adjunction.fixedLeftToFixedRight`).
* 0.2, `Idempotents.additive_iff_toKaroubi_comp`,
  `Idempotents.full_whiskeringLeftToKaroubiAdditive`,
  `Idempotents.faithful_whiskeringLeftToKaroubiAdditive`,
  `Idempotents.isEquivalence_whiskeringLeftToKaroubiAdditive` (on
  `Idempotents.whiskeringLeftToKaroubiAdditive`).
* 0.3, `Monad.isEquivalence_comparison_iff`, `Comonad.isEquivalence_comparison_iff`,
  `Monad.reflectsIsomorphisms_of_monadicRightAdjoint`,
  `Comonad.reflectsIsomorphisms_of_comonadicLeftAdjoint`.
* 1.1, `isEquivalence_freeGroupoidLift_id`, `bijective_mapConnectedComponents_freeGroupoidOf`.
* 1.2, `W₁_iff`, `W₁_iff_isEquivalence`, `W₁_le_W₀` (on `W₀`, `W₁`).
* 1.4, `IsGroupoidFibration.range_mapAut_fiberInclusion`,
  `IsGroupoidFibration.mem_range_mapAut_iff`,
  `IsGroupoidFibration.mapConnectedComponents_eq_iff`,
  `IsGroupoidFibration.mapConnectedComponents_eq_mk_iff` (on `IsGroupoidFibration`).
* 2.1, `isBasicLocalizer_Winfty` (on `IsAspherical`, `IsAsphericalFunctor`, `IsBasicLocalizer`,
  `Winfty`).
* 2.2, `isBasicLocalizer_W₀`, `isBasicLocalizer_WNeg₁`, `isAspherical_W₁_iff` (on `WNeg₁`).
* 2.3, `mem_of_isRightAdjoint`, `mem_of_isLeftAdjoint`.
* 2.4, `mem_of_isAsphericalFunctor` (Theorem A for an arbitrary basic localizer).
* 2.5, `IsLocallyConstant`.
* 3.1, `nonempty_iAAdjunction` (on `iA`, `iAFunctor`, `iAStarFunctor`).
* 3.2, `presheafWeq`.
* 4.3, `isBasicLocalizer_homologyLocalizer` (on `homologyLocalizer`).
* 4.4, `Winfty_iff_isAsphericalFunctor_of_isLocallyConstant`, `eq_Winfty_of_isLocallyConstant`.
* 4.6, `isBasicLocalizer_W₁`.
* 5.1, `IsDwyerMap`, with `IsDwyerMap.of_isPushout` (the cobase change of a Dwyer map).
* 6.1, `IsWeakTestCategory`, `IsLocalTestCategory`, `IsTestCategory`, `IsStrictTestCategory` (on
  `iALocalized`).
* 6.4, `isStrictTestCategory_simplexCategory`.
* 7.1, `IsDirect.eq_id_of_endo`, `IsDirect.skeletal` (on `DirectRel`, `IsDirect`, `IsInverse`).
* 7.2, `isDirect_iff_nonempty_reedyStructure`, `IsDirect.of_reedyStructure` (on `IsDirect.rank`).
* 7.3, `nonempty_reedyStructure_nat_iff`.
* 7.4, `ReedyStructure.exists_directPart`, `ReedyStructure.exists_inversePart`.
* 8.1, `isDirect_iff_wellFoundedLT`, `exists_reedyStructure_card_Iio`.
* 8.4, `SemiSimplexCategory.exists_reedyStructure_len`.
* 9.1, `Presheaf.isNonsingular_iff_isThin`, `Presheaf.isNonsingular_iff_mono` (on
  `Presheaf.IsNonsingular`).
* 9.3, `isDiscreteFibration_elements` (on `Functor.IsDiscreteFibration`).
* 10.1, 10.2, `value`, `restrict`, `SatisfiesDer2`, `SatisfiesDer3` (definitions only).
* 11.1, 11.2, `IsCofibrationCategory`, `brown_factorization`.
* 12.1, `isUnit_skeleton` (on `IsGrCategory`).
* 12.6, `skeletonTwoTermMulEquiv`, `autUnitTwoTermMulEquiv` (on `IsStrictlyCommutative`, `TwoTerm`,
  `TwoTerm.Hom`, `TwoTerm.eqHom`, `TwoTerm.eqIso`, with the label identities `TwoTerm.comp_label`,
  `TwoTerm.eqIso_hom_label`, `TwoTerm.eqIso_inv_label`).

Not statable at the pins, with the carrier each lacks:

* 4.1, 4.2, 4.5, Thomason equivalences, `W∞ = W_N` and `Hot ≌ SSet[W⁻¹]`; 4.4, Theorem B in
  its nerve form; 5.2–5.4, the pushout comparison, excision and Thomason's model structure: they
  lack the simplicial weak equivalences and the Kan–Quillen model structure of
  GeneralizedCohomology G2 item 1.
* 6.4, `□_c` is a strict test category and `□` a test category that is not strict: they lack
  the cube categories of convention 8.
* 10.3, 10.4, homotopy exact squares, Kan extensions, pointed and stable derivators and the
  triangulated structure of Groth's Theorem 4.15: they lack Der1, Der4, homotopy exact and
  (co)Cartesian squares and stable derivators, which are not declared at the pins.
* 10.5, the derivator of a model category: it lacks a pseudofunctor `Cat.{w, w}ᵒᵖ ⥤ᵖ Cat`
  sending `J` to the localization of `J ⥤ M` at the levelwise weak equivalences.
* 12.2, Sính's classification and the `k`-invariant: they lack the `π₀`-module structure of `π₁`
  as a `Rep` and the 3-cocycle of the associator of a skeletal model.
* 12.3, 12.4, crossed modules, their gr-categories and extensions with non-abelian kernel: they
  lack SchemeAndStackFoundations §1.24's `CrossedModule`.
* 12.5, the `(π₀, π₁, ε)` classification of Picard groupoids and the passage to gr-categories;
  12.6, Deligne's equivalence over a point; 13.1–13.3, Picard stacks and Deligne's theorem over a
  site: they lack SchemeAndStackFoundations §3.4's `PicardGroupoid`, and Layer 13 also §1.18's
  `Stack.stackification`.
* 1.5, the Mayer–Vietoris sequence: it lacks the strict pullback of groupoids along a fibration as
  a groupoid (Mathlib's `CategoricalPullback` is the iso-comma).
-/

@[expose] public section

universe w v₁ u₁ v₂ u₂ v u

/-! ## Layer 0: categorical prerequisites

Stated for arbitrary categories, in the Mathlib namespaces they extend. -/

namespace CategoryTheory.Adjunction

variable {C : Type u₁} {D : Type u₂} [Category.{v₁} C] [Category.{v₂} D]
  {L : C ⥤ D} {R : D ⥤ C} (adj : L ⊣ R)

/-- **Layer 0.1.** For an adjunction `L ⊣ R` with unit `η` and counit `ε`, the four conditions
`ηR`, `Rε`, `εL` and `Lη` invertible are equivalent; an adjunction satisfying them is
*idempotent* (Borceux, *Handbook* 1, Proposition 3.4.1). -/
theorem idempotent_tfae :
    List.TFAE [∀ Y, IsIso (adj.unit.app (R.obj Y)), ∀ Y, IsIso (R.map (adj.counit.app Y)),
      ∀ X, IsIso (adj.counit.app (L.obj X)), ∀ X, IsIso (L.map (adj.unit.app X))] := by
  sorry

/-- **Layer 0.1.** The objects of `C` at which the unit of `L ⊣ R` is an isomorphism. -/
def fixedLeft : ObjectProperty C := fun X ↦ IsIso (adj.unit.app X)

/-- **Layer 0.1.** The objects of `D` at which the counit of `L ⊣ R` is an isomorphism. -/
def fixedRight : ObjectProperty D := fun Y ↦ IsIso (adj.counit.app Y)

/-- **Layer 0.1.** The restriction of `L` to the fixed objects: if the unit is invertible at `X`,
the counit is invertible at `L X`, by the triangle identity `L η_X ≫ ε_{L X} = 𝟙`. -/
def fixedLeftToFixedRight : adj.fixedLeft.FullSubcategory ⥤ adj.fixedRight.FullSubcategory :=
  adj.fixedRight.lift (adj.fixedLeft.ι ⋙ L) fun X ↦ by
    have : IsIso (adj.unit.app X.obj) := X.property
    have h : IsIso (L.map (adj.unit.app X.obj) ≫ adj.counit.app (L.obj X.obj)) := by
      rw [adj.left_triangle_components X.obj]
      exact IsIso.id _
    exact IsIso.of_isIso_comp_left (L.map (adj.unit.app X.obj)) (adj.counit.app (L.obj X.obj))

/-- **Layer 0.1.** For every adjunction, `L` restricts to an equivalence between the objects at
which the unit is an isomorphism and the objects at which the counit is an isomorphism. -/
theorem isEquivalence_fixedLeftToFixedRight : adj.fixedLeftToFixedRight.IsEquivalence := by
  sorry

/-- **Layer 0.1.** For an idempotent adjunction, the objects at which the unit is an isomorphism
form a reflective subcategory, with reflector `L ⋙ R`. -/
theorem nonempty_reflective_fixedLeft (h : ∀ X, adj.fixedRight (L.obj X)) :
    Nonempty (Reflective adj.fixedLeft.ι) := by
  sorry

/-- **Layer 0.1.** For an idempotent adjunction, the objects at which the counit is an
isomorphism form a coreflective subcategory, with coreflector `R ⋙ L`. -/
theorem nonempty_coreflective_fixedRight (h : ∀ Y, adj.fixedLeft (R.obj Y)) :
    Nonempty (Coreflective adj.fixedRight.ι) := by
  sorry

end CategoryTheory.Adjunction

namespace CategoryTheory.Idempotents

open Karoubi

variable {C D : Type*} [Category* C] [Category* D] [Preadditive C] [Preadditive D]

/-- **Layer 0.2.** A functor out of a Karoubi envelope is additive iff its restriction along
`toKaroubi` is. -/
theorem additive_iff_toKaroubi_comp (F : Karoubi C ⥤ D) :
    F.Additive ↔ (toKaroubi C ⋙ F).Additive := by
  sorry

variable (C D) in
/-- **Layer 0.2.** Precomposition with `toKaroubi C`, as a functor between categories of
additive functors. -/
def whiskeringLeftToKaroubiAdditive : (Karoubi C ⥤+ D) ⥤ (C ⥤+ D) :=
  (additiveFunctor C D).lift
    (AdditiveFunctor.forget _ _ ⋙ (Functor.whiskeringLeft C (Karoubi C) D).obj (toKaroubi C))
    (fun F ↦ inferInstanceAs (toKaroubi C ⋙ F.obj).Additive)

variable (C D) in
/-- **Layer 0.2.** Precomposition with `toKaroubi C` is full on additive functors. -/
theorem full_whiskeringLeftToKaroubiAdditive : (whiskeringLeftToKaroubiAdditive C D).Full := by
  sorry

variable (C D) in
/-- **Layer 0.2.** Precomposition with `toKaroubi C` is faithful on additive functors. -/
theorem faithful_whiskeringLeftToKaroubiAdditive :
    (whiskeringLeftToKaroubiAdditive C D).Faithful := by
  sorry

variable (C D) in
/-- **Layer 0.2.** When `D` is idempotent complete, additive functors `Karoubi C ⥤ D` are
equivalent to additive functors `C ⥤ D`, by restriction along `toKaroubi C`. -/
theorem isEquivalence_whiskeringLeftToKaroubiAdditive [IsIdempotentComplete D] :
    (whiskeringLeftToKaroubiAdditive C D).IsEquivalence := by
  sorry

end CategoryTheory.Idempotents

namespace CategoryTheory

open Limits

/-- **Layer 0.3. Beck's monadicity theorem** as a characterization: the comparison functor of
`F ⊣ G` is an equivalence iff `G` reflects isomorphisms and, for every `G`-split pair, the
coequalizer exists and is preserved by `G` (Mac Lane, VI.7, Theorem 1). -/
theorem Monad.isEquivalence_comparison_iff {C : Type u₁} {D : Type u₂} [Category.{v₁} C]
    [Category.{v₁} D] {F : C ⥤ D} {G : D ⥤ C} (adj : F ⊣ G) :
    (Monad.comparison adj).IsEquivalence ↔
      G.ReflectsIsomorphisms ∧ ∀ ⦃X Y : D⦄ (u v : X ⟶ Y), G.IsSplitPair u v →
        HasCoequalizer u v ∧ PreservesColimit (parallelPair u v) G := by
  sorry

/-- **Layer 0.3. Beck's comonadicity theorem** as a characterization, with `F`-cosplit pairs and
equalizers. -/
theorem Comonad.isEquivalence_comparison_iff {C : Type u₁} {D : Type u₂} [Category.{v₁} C]
    [Category.{v₁} D] {F : C ⥤ D} {G : D ⥤ C} (adj : F ⊣ G) :
    (Comonad.comparison adj).IsEquivalence ↔
      F.ReflectsIsomorphisms ∧ ∀ ⦃X Y : C⦄ (u v : X ⟶ Y), F.IsCosplitPair u v →
        HasEqualizer u v ∧ PreservesLimit (parallelPair u v) F := by
  sorry

/-- **Layer 0.3.** A monadic right adjoint reflects isomorphisms. -/
theorem Monad.reflectsIsomorphisms_of_monadicRightAdjoint {C : Type u₁} {D : Type u₂}
    [Category.{v₁} C] [Category.{v₁} D] (G : D ⥤ C) [MonadicRightAdjoint G] :
    G.ReflectsIsomorphisms := by
  sorry

/-- **Layer 0.3.** A comonadic left adjoint reflects isomorphisms. -/
theorem Comonad.reflectsIsomorphisms_of_comonadicLeftAdjoint {C : Type u₁} {D : Type u₂}
    [Category.{v₁} C] [Category.{v₁} D] (F : C ⥤ D) [ComonadicLeftAdjoint F] :
    F.ReflectsIsomorphisms := by
  sorry

end CategoryTheory

namespace TauCetiRoadmap.HomotopyTheoryOfCategories

open CategoryTheory CategoryTheory.Limits HomotopicalAlgebra Opposite MonoidalCategory

/-! ## Layer 1: the 1-truncated layer -/

section OneTruncated

/-- **Layer 1.1.** For a groupoid `G`, the functor `Π₁ G ⥤ G` extending the identity is an
equivalence: `Π₁ G ≌ G`. -/
theorem isEquivalence_freeGroupoidLift_id (G : Type u) [Groupoid.{v} G] :
    (FreeGroupoid.lift (𝟭 G)).IsEquivalence := by
  sorry

/-- **Layer 1.1.** The connected components of `Π₁ A` are those of `A`. -/
theorem bijective_mapConnectedComponents_freeGroupoidOf (A : Type u) [Category.{v} A] :
    Function.Bijective (FreeGroupoid.of A).mapConnectedComponents := by
  sorry

/-- **Layer 1.2.** `W₀`: the functors inducing a bijection on connected components. -/
def W₀ : MorphismProperty Cat.{u, u} :=
  fun _ _ F ↦ Function.Bijective F.toFunctor.mapConnectedComponents

/-- **Layer 1.2.** `W₁`: the functors inducing an equivalence of fundamental groupoids. -/
def W₁ : MorphismProperty Cat.{u, u} :=
  fun _ _ F ↦ (FreeGroupoid.map F.toFunctor).IsEquivalence

/-- **Layer 1.2.** `F ∈ W₁` iff `F ∈ W₀` and `F` induces bijections of the automorphism groups of
the fundamental groupoids at every object. -/
theorem W₁_iff {X Y : Cat.{u, u}} (F : X ⟶ Y) :
    W₁ F ↔ W₀ F ∧ ∀ a : X, Function.Bijective
      ((FreeGroupoid.map F.toFunctor).mapAut ((FreeGroupoid.of X).obj a)) := by
  sorry

/-- **Layer 1.2.** Between groupoids, `W₁` is the class of equivalences of categories. -/
theorem W₁_iff_isEquivalence {G H : Type u} [Groupoid.{u} G] [Groupoid.{u} H] (F : G ⥤ H) :
    W₁ F.toCatHom ↔ F.IsEquivalence := by
  sorry

/-- **Layer 1.2.** `W₁ ⊆ W₀`. -/
theorem W₁_le_W₀ : W₁.{u} ≤ W₀ := by
  sorry

/-- **Layer 1.4.** A fibration of groupoids: a star-surjective functor (Brown–Heath–Kamps 1983,
§2), every morphism out of `p x` lifting to a morphism out of `x`. -/
def IsGroupoidFibration {E B : Type u} [Groupoid.{v} E] [Groupoid.{v} B] (p : E ⥤ B) : Prop :=
  ∀ (x : E) (b : B) (g : p.obj x ⟶ b), ∃ (y : E) (φ : x ⟶ y), p.IsHomLift g φ

namespace IsGroupoidFibration

variable {E B : Type u} [Groupoid.{v} E] [Groupoid.{v} B] {p : E ⥤ B}

/-- **Layer 1.4.** Exactness at `Aut_E(x)` of the sequence of a fibration: the automorphisms of
`x` in the fibre `F` over `p x` are those sent to `𝟙` by `p`. -/
theorem range_mapAut_fiberInclusion (hp : IsGroupoidFibration p) (x : E) :
    ((Functor.Fiber.fiberInclusion (p := p) (S := p.obj x)).mapAut ⟨x, rfl⟩).range =
      (p.mapAut x).ker := by
  sorry

/-- **Layer 1.4.** Exactness at `Aut_B(p x)`: `g` lifts to an automorphism of `x` iff every lift
of `g` out of `x` ends in the component of `x` in the fibre over `p x`. -/
theorem mem_range_mapAut_iff (hp : IsGroupoidFibration p) (x : E) (g : Aut (p.obj x)) :
    g ∈ (p.mapAut x).range ↔ ∀ (y : p.Fiber (p.obj x)) (φ : x ⟶ y.1), p.IsHomLift g.hom φ →
      (Quotient.mk'' y : ConnectedComponents (p.Fiber (p.obj x))) = Quotient.mk'' ⟨x, rfl⟩ := by
  sorry

/-- **Layer 1.4.** Exactness at `π₀ F`: two objects of the fibre over `p x` lie in one component
of `E` iff one lies in the component of an endpoint of a lift, out of the other, of an
automorphism of `p x` (the fibres of `π₀ F → π₀ E` are the orbits of `Aut_B(p x)`). -/
theorem mapConnectedComponents_eq_iff (hp : IsGroupoidFibration p) (x : E)
    (y y' : p.Fiber (p.obj x)) :
    Functor.Fiber.fiberInclusion.mapConnectedComponents (Quotient.mk'' y) =
        Functor.Fiber.fiberInclusion.mapConnectedComponents (Quotient.mk'' y') ↔
      ∃ (g : p.obj x ⟶ p.obj x) (z : p.Fiber (p.obj x)) (φ : y.1 ⟶ z.1),
        p.IsHomLift g φ ∧
          (Quotient.mk'' z : ConnectedComponents (p.Fiber (p.obj x))) = Quotient.mk'' y' := by
  sorry

/-- **Layer 1.4.** Exactness at `π₀ E`: a component of `E` lies over the component of `p x` iff it
meets the fibre over `p x`. -/
theorem mapConnectedComponents_eq_mk_iff (hp : IsGroupoidFibration p) (x : E)
    (c : ConnectedComponents E) :
    p.mapConnectedComponents c = Quotient.mk'' (p.obj x) ↔
      c ∈ Set.range
        (Functor.Fiber.fiberInclusion (p := p) (S := p.obj x)).mapConnectedComponents := by
  sorry

end IsGroupoidFibration

end OneTruncated

/-! ## Layer 2: basic localizers and asphericity -/

section Localizer

/-- **Layer 2.1.** `A` is `W`-aspherical when `A ⥤ e` lies in `W`. -/
def IsAspherical (W : MorphismProperty Cat.{u, u}) (A : Type u) [SmallCategory A] : Prop :=
  W (Functor.star A : A ⥤ Discrete PUnit.{u + 1}).toCatHom

/-- **Layer 2.1.** `F` is `W`-aspherical when every slice `A/b` is `W`-aspherical. -/
def IsAsphericalFunctor (W : MorphismProperty Cat.{u, u}) {A B : Type u} [SmallCategory A]
    [SmallCategory B] (F : A ⥤ B) : Prop :=
  ∀ b : B, IsAspherical W (CostructuredArrow F b)

/-- **Layer 2.1.** A basic localizer (Cisinski 2004, 1.1.1 and Definition 1.1.3). -/
structure IsBasicLocalizer (W : MorphismProperty Cat.{u, u}) : Prop where
  /-- FS1: `W` contains the identities. -/
  containsIdentities : W.ContainsIdentities
  /-- FS2: `W` has two-out-of-three. -/
  twoOutOfThree : W.HasTwoOutOfThreeProperty
  /-- FS3: a retraction `r` of `i` with `r ≫ i` in `W` is in `W`. -/
  retract : ∀ {X Y : Cat.{u, u}} (i : X ⟶ Y) (r : Y ⟶ X), i ≫ r = 𝟙 X → W (r ≫ i) → W r
  /-- LF2: a small category with a terminal object is aspherical. -/
  aspherical_of_hasTerminal : ∀ (A : Type u) [SmallCategory A] [HasTerminal A],
    IsAspherical W A
  /-- LF3, the relative Theorem A. -/
  of_slices : ∀ {A B C : Type u} [SmallCategory A] [SmallCategory B] [SmallCategory C]
    (F : A ⥤ B) (G : B ⥤ C), (∀ c : C, W (CostructuredArrow.pre F G c).toCatHom) →
      W F.toCatHom

/-- **Layer 2.1.** The minimal basic localizer, as the intersection of all of them. -/
def Winfty : MorphismProperty Cat.{u, u} :=
  fun _ _ F ↦ ∀ W : MorphismProperty Cat.{u, u}, IsBasicLocalizer W → W F

/-- **Layer 2.1.** The intersection of all basic localizers is a basic localizer. -/
theorem isBasicLocalizer_Winfty : IsBasicLocalizer Winfty.{u} := by
  sorry

/-- **Layer 2.2.** `W₀` is a basic localizer (Cisinski 2004, proof of Proposition 2.3.4). -/
theorem isBasicLocalizer_W₀ : IsBasicLocalizer W₀.{u} := by
  sorry

/-- **Layer 2.2.** `W₋₁`: the functors `F : A ⥤ B` with `A` nonempty iff `B` is. -/
def WNeg₁ : MorphismProperty Cat.{u, u} :=
  fun X Y _ ↦ (Nonempty X ↔ Nonempty Y)

/-- **Layer 2.2.** `W₋₁` is a basic localizer. -/
theorem isBasicLocalizer_WNeg₁ : IsBasicLocalizer WNeg₁.{u} := by
  sorry

/-- **Layer 2.2.** A small category is `W₁`-aspherical iff its fundamental groupoid is equivalent
to the point. -/
theorem isAspherical_W₁_iff (A : Type u) [SmallCategory A] :
    IsAspherical W₁ A ↔ Nonempty (FreeGroupoid A ≌ Discrete PUnit.{u + 1}) := by
  sorry

/-- **Layer 2.3.** Functors with a right adjoint are in every basic localizer
(Cisinski 2004, Corollary 1.1.10). -/
theorem mem_of_isLeftAdjoint {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W)
    {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B) [F.IsLeftAdjoint] :
    W F.toCatHom := by
  sorry

/-- **Layer 2.3.** Functors with a left adjoint are in every basic localizer
(Cisinski 2004, Corollary 1.1.10). -/
theorem mem_of_isRightAdjoint {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W)
    {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B) [F.IsRightAdjoint] :
    W F.toCatHom := by
  sorry

/-- **Layer 2.4.** Quillen's Theorem A for an arbitrary basic localizer (Cisinski 2004,
Remark 1.1.4). -/
theorem mem_of_isAsphericalFunctor {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W)
    {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B)
    (hF : IsAsphericalFunctor W F) : W F.toCatHom := by
  sorry

/-- **Layer 2.5.** `W`-locally constant functors (Cisinski 2004, 2.3.1): every `A/b ⥤ A/b'` is
in `W`. -/
def IsLocallyConstant (W : MorphismProperty Cat.{u, u}) {A B : Type u} [SmallCategory A]
    [SmallCategory B] (F : A ⥤ B) : Prop :=
  ∀ ⦃b b' : B⦄ (g : b ⟶ b'), W (CostructuredArrow.map (S := F) g).toCatHom

end Localizer

/-! ## Layer 3: presheaves on a small category -/

section Presheaf

variable (A : Type u) [SmallCategory A]

/-- **Layer 3.1.** `i_A X = A/X`, the category `CostructuredArrow yoneda X`. -/
abbrev iA (X : Aᵒᵖ ⥤ Type u) : Type u := CostructuredArrow yoneda X

/-- **Layer 3.1.** `i_A : Â ⥤ Cat`, `X ↦ A/X`, functorial through `CostructuredArrow.map`. -/
def iAFunctor : (Aᵒᵖ ⥤ Type u) ⥤ Cat.{u, u} :=
  CostructuredArrow.functor yoneda

/-- **Layer 3.1.** `i_A^* : Cat ⥤ Â`, `C ↦ (a ↦ (Over a ⥤ C))`, with restriction along
`Over.map`. -/
def iAStarFunctor : Cat.{u, u} ⥤ (Aᵒᵖ ⥤ Type u) :=
  yoneda ⋙ (Functor.whiskeringLeft _ _ _).obj (Over.mapFunctor A).op

/-- **Layer 3.1.** `i_A` is left adjoint to `i_A^*`. -/
theorem nonempty_iAAdjunction : Nonempty (iAFunctor A ⊣ iAStarFunctor A) := by
  sorry

/-- **Layer 3.2.** The weak equivalences `W_Â = i_A⁻¹ W` of presheaves. -/
abbrev presheafWeq (W : MorphismProperty Cat.{u, u}) : MorphismProperty (Aᵒᵖ ⥤ Type u) :=
  W.inverseImage (iAFunctor A)

end Presheaf

/-! ## Layer 4: Thomason equivalences and the minimal localizer -/

section Thomason

/-- **Layer 4.3.** The functors whose nerve induces isomorphisms on simplicial homology with
coefficients in `M` in every degree. -/
def homologyLocalizer (M : AddCommGrpCat.{u}) : MorphismProperty Cat.{u, u} :=
  fun _ _ F ↦ ∀ n : ℕ, IsIso (SSet.homologyMap (nerveMap F.toFunctor) M n)

/-- **Layer 4.3.** For every abelian group `M`, the homological localizer of `M` is a basic
localizer. -/
theorem isBasicLocalizer_homologyLocalizer (M : AddCommGrpCat.{u}) :
    IsBasicLocalizer (homologyLocalizer M) := by
  sorry

/-- **Layer 4.4.** A `W∞`-locally constant functor is in `W∞` iff it is `W∞`-aspherical
(Cisinski 2004, Corollary 2.3.3). -/
theorem Winfty_iff_isAsphericalFunctor_of_isLocallyConstant {A B : Type u} [SmallCategory A]
    [SmallCategory B] (F : A ⥤ B) (hF : IsLocallyConstant Winfty F) :
    Winfty F.toCatHom ↔ IsAsphericalFunctor Winfty F := by
  sorry

/-- **Layer 4.4.** A basic localizer `W ⊆ W₀` in which every `W`-locally constant functor in `W`
is `W`-aspherical is `W∞` (Cisinski 2004, Theorem 2.3.6). -/
theorem eq_Winfty_of_isLocallyConstant {W : MorphismProperty Cat.{u, u}}
    (hW : IsBasicLocalizer W) (h₀ : W ≤ W₀)
    (h : ∀ {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B),
      IsLocallyConstant W F → W F.toCatHom → IsAsphericalFunctor W F) :
    W = Winfty := by
  sorry

end Thomason

/-- **Layer 4.6.** `W₁` is a basic localizer (Cisinski 2006, 9.2.1 and Corollary 9.2.15
for `n = 1`). -/
theorem isBasicLocalizer_W₁ : IsBasicLocalizer W₁.{u} := by
  sorry

/-! ## Layer 5: Thomason's model structure -/

section Dwyer

/-- **Layer 5.1.** A Dwyer map (Thomason 1980, Definition 4.1): `i` is injective on objects and
fully faithful with image a sieve, and some cosieve `V ⊇ i(A)` has `A ⥤ V` a left adjoint. -/
structure IsDwyerMap {A B : Type u} [Category.{v} A] [Category.{v} B] (i : A ⥤ B) : Prop where
  /-- `i` is injective on objects. -/
  injective : Function.Injective i.obj
  /-- `i` is full. -/
  full : i.Full
  /-- `i` is faithful. -/
  faithful : i.Faithful
  /-- The image of `i` is a sieve: an object with a morphism into it lies in it. -/
  sieve : ∀ ⦃b : B⦄ ⦃a : A⦄, (b ⟶ i.obj a) → ∃ a', i.obj a' = b
  /-- Some cosieve `V` containing the image has `A ⥤ V` a left adjoint. -/
  cosieve : ∃ (V : ObjectProperty B) (hV : ∀ a, V (i.obj a)),
    (∀ ⦃b b' : B⦄, (b ⟶ b') → V b → V b') ∧ (V.lift i hV).IsLeftAdjoint

/-- **Layer 5.1.** The cobase change of a Dwyer map along any functor is a Dwyer map (Thomason
1980, Proposition 4.3). -/
theorem IsDwyerMap.of_isPushout {A B C P : Cat.{u, u}} {i : A ⟶ B} {f : A ⟶ C} {g : B ⟶ P}
    {j : C ⟶ P} (h : IsPushout i f g j) (hi : IsDwyerMap i.toFunctor) :
    IsDwyerMap j.toFunctor := by
  sorry

end Dwyer

/-! ## Layer 6: test categories -/

section TestCategory

variable (A : Type u) [SmallCategory A]

/-- **Layer 6.1.** The functor `Â[W_Â⁻¹] ⥤ Cat[W⁻¹]` induced by `i_A`, which sends `W_Â` into
`W` by definition. -/
noncomputable def iALocalized (W : MorphismProperty Cat.{u, u}) :
    (presheafWeq A W).Localization ⥤ W.Localization :=
  Localization.Construction.lift (iAFunctor A ⋙ W.Q) fun _ _ _ hf ↦
    Localization.inverts W.Q W _ hf

/-- **Layer 6.1.** A weak test category (Maltsiniotis 2009, 2.3). Since `i_A ⊣ i_A^*`, asking
that `i_A^*` reflect and preserve weak equivalences and that the functor induced by `i_A` be an
equivalence makes the two induced functors quasi-inverse. -/
structure IsWeakTestCategory (W : MorphismProperty Cat.{u, u}) : Prop where
  /-- `W = (i_A^*)⁻¹ W_Â`. -/
  iAStar_mem_iff : ∀ ⦃C D : Cat.{u, u}⦄ (F : C ⟶ D),
    W F ↔ presheafWeq A W ((iAStarFunctor A).map F)
  /-- `i_A` induces an equivalence of localizations. -/
  isEquivalence : (iALocalized A W).IsEquivalence

/-- **Layer 6.1.** A local test category: every `A/a` is a weak test category. -/
def IsLocalTestCategory (W : MorphismProperty Cat.{u, u}) : Prop :=
  ∀ a : A, IsWeakTestCategory (Over a) W

/-- **Layer 6.1.** A test category: a weak test category that is a local test category. -/
def IsTestCategory (W : MorphismProperty Cat.{u, u}) : Prop :=
  IsWeakTestCategory A W ∧ IsLocalTestCategory A W

/-- **Layer 6.1.** A strict test category: a test category whose localization functor preserves
binary products. -/
def IsStrictTestCategory (W : MorphismProperty Cat.{u, u}) : Prop :=
  IsTestCategory A W ∧
    ∀ X Y : Aᵒᵖ ⥤ Type u, PreservesLimit (pair X Y) (presheafWeq A W).Q

/-- **Layer 6.4.** `Δ` is a strict test category (Maltsiniotis 2005, Proposition 1.6.13). -/
theorem isStrictTestCategory_simplexCategory :
    IsStrictTestCategory (AsSmall.{u} SimplexCategory) Winfty.{u} := by
  sorry

end TestCategory

end TauCetiRoadmap.HomotopyTheoryOfCategories

/-! ## Layer 7: direct and inverse categories -/

namespace CategoryTheory

open Opposite

/-- **Layer 7.1.** The relation on objects "there is a non-identity morphism `X ⟶ Y`". -/
def DirectRel (C : Type u) [Category.{v} C] (X Y : C) : Prop :=
  ∃ f : X ⟶ Y, ¬ MorphismProperty.identities C f

/-- **Layer 7.1.** A category is *direct* if there is no infinite descending chain of
non-identity morphisms `⋯ ⟶ X₂ ⟶ X₁ ⟶ X₀`, that is, `DirectRel C` is well-founded. -/
class IsDirect (C : Type u) [Category.{v} C] : Prop where
  /-- `DirectRel C` is well-founded. -/
  wellFounded : WellFounded (DirectRel C)

/-- **Layer 7.1.** A category is *inverse* if its opposite is direct. -/
class IsInverse (C : Type u) [Category.{v} C] : Prop where
  /-- The opposite category is direct. -/
  isDirect_op : IsDirect Cᵒᵖ

namespace IsDirect

variable {C : Type u} [Category.{v} C] [IsDirect C]

/-- **Layer 7.2.** The canonical degree of an object of a direct category: its rank for
`DirectRel C`. -/
noncomputable def rank (X : C) : Ordinal.{u} :=
  haveI : WellFounded (DirectRel C) := IsDirect.wellFounded
  WellFounded.rank (DirectRel C) X

/-- **Layer 7.1.** In a direct category every endomorphism is the identity. -/
theorem eq_id_of_endo {X : C} (f : X ⟶ X) : f = 𝟙 X := by
  sorry

/-- **Layer 7.1.** A direct category is skeletal. -/
theorem skeletal : Skeletal C := by
  sorry

end IsDirect

variable (C : Type u) [Category.{v} C]

/-- **Layer 7.2.** Direct categories are exactly those carrying a Reedy structure whose `W₁` is
the identities and whose `W₂` is everything, with ordinal degrees. -/
theorem isDirect_iff_nonempty_reedyStructure :
    IsDirect C ↔
      Nonempty (HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤
        Ordinal.{u}) := by
  sorry

/-- **Layer 7.2.** A direct Reedy structure with values in any well-ordered `α` makes `C` direct.
-/
theorem IsDirect.of_reedyStructure {α : Type w} [LinearOrder α] [OrderBot α] [SuccOrder α]
    [WellFoundedLT α]
    (r : HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤ α) :
    IsDirect C := by
  sorry

/-- **Layer 7.3.** A category has an `ℕ`-valued direct Reedy structure exactly when it is direct
with every rank finite. -/
theorem nonempty_reedyStructure_nat_iff :
    Nonempty (HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤ ℕ) ↔
      ∃ _ : IsDirect C, ∀ X : C, IsDirect.rank X < Ordinal.omega0 := by
  sorry

end CategoryTheory

namespace HomotopicalAlgebra.ReedyStructure

open CategoryTheory

variable {C : Type u} [Category.{v} C] {W₁ W₂ : MorphismProperty C}
  [W₁.IsMultiplicative] [W₂.IsMultiplicative]
  {α : Type w} [LinearOrder α] [OrderBot α] [SuccOrder α] [WellFoundedLT α]

/-- **Layer 7.4.** The degree-raising part of a Reedy structure is direct, with the same degree.
-/
theorem exists_directPart (r : ReedyStructure W₁ W₂ α) :
    ∃ r' : ReedyStructure (MorphismProperty.identities (WideSubcategory W₂)) ⊤ α,
      ∀ X, r'.deg X = r.deg X.obj := by
  sorry

/-- **Layer 7.4.** The degree-lowering part of a Reedy structure is inverse, with the same
degree. -/
theorem exists_inversePart (r : ReedyStructure W₁ W₂ α) :
    ∃ r' : ReedyStructure ⊤ (MorphismProperty.identities (WideSubcategory W₁)) α,
      ∀ X, r'.deg X = r.deg X.obj := by
  sorry

end HomotopicalAlgebra.ReedyStructure

/-! ## Layer 8: examples of direct and Reedy categories -/

namespace CategoryTheory

/-- **Layer 8.1.** A partial order is direct iff `<` is well-founded. -/
theorem isDirect_iff_wellFoundedLT (P : Type u) [PartialOrder P] :
    IsDirect P ↔ WellFoundedLT P := by
  sorry

/-- **Layer 8.1.** A partial order with finite lower sets has an `ℕ`-valued direct
Reedy structure with degree `x ↦ #{y | y < x}`. -/
theorem exists_reedyStructure_card_Iio (P : Type u) [PartialOrder P]
    [LocallyFiniteOrderBot P] :
    ∃ r : HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities P) ⊤ ℕ,
      ∀ x, r.deg x = (Finset.Iio x).card := by
  sorry

end CategoryTheory

namespace SemiSimplexCategory

open CategoryTheory

/-- **Layer 8.4.** The semi-simplex category has an `ℕ`-valued direct Reedy structure with
degree `len`; README 8.4 obtains it from the Reedy structure of the simplex category by
restriction to monomorphisms. -/
theorem exists_reedyStructure_len :
    ∃ r : HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities SemiSimplexCategory) ⊤ ℕ,
      ∀ n, r.deg n = n.len := by
  sorry

end SemiSimplexCategory

/-! ## Layer 9: non-singular presheaves on direct categories -/

namespace CategoryTheory

open Opposite

variable {C : Type u} [Category.{v} C]

/-- **Layer 9.1.** A presheaf is non-singular if, for every element `x ∈ X(c)`, the map
`(c' ⟶ c) → X(c')`, `u ↦ X(u)(x)`, is injective. -/
def Presheaf.IsNonsingular (X : Cᵒᵖ ⥤ Type w) : Prop :=
  ∀ ⦃c c' : C⦄ (x : X.obj (op c)) (u v : c' ⟶ c), X.map u.op x = X.map v.op x → u = v

/-- **Layer 9.1.** A presheaf is non-singular iff its category of elements is thin. -/
theorem Presheaf.isNonsingular_iff_isThin (X : Cᵒᵖ ⥤ Type w) :
    Presheaf.IsNonsingular X ↔ Quiver.IsThin X.Elements := by
  sorry

/-- **Layer 9.1.** A presheaf is non-singular iff every map from a representable classifying an
element is a monomorphism. -/
theorem Presheaf.isNonsingular_iff_mono {C : Type u} [SmallCategory C] (X : Cᵒᵖ ⥤ Type u) :
    Presheaf.IsNonsingular X ↔
      ∀ (c : C) (x : X.obj (op c)), Mono (yonedaEquiv.symm x) := by
  sorry

/-- **Layer 9.3.** A functor `p : E ⥤ C` is a discrete fibration if every morphism into `p.obj e`
lifts uniquely to a morphism into `e`. -/
def Functor.IsDiscreteFibration {E : Type*} [Category* E] (p : E ⥤ C) : Prop :=
  ∀ e : E, Function.Bijective
    (fun φ : (e' : E) × (e' ⟶ e) ↦ (⟨p.obj φ.1, p.map φ.2⟩ : (c : C) × (c ⟶ p.obj e)))

/-- **Layer 9.3.** The projection from the opposite of the category of elements of a presheaf is
a discrete fibration. -/
theorem isDiscreteFibration_elements (X : Cᵒᵖ ⥤ Type w) :
    (Functor.Elements.π X).leftOp.IsDiscreteFibration := by
  sorry

end CategoryTheory

namespace TauCetiRoadmap.HomotopyTheoryOfCategories

open CategoryTheory CategoryTheory.Limits HomotopicalAlgebra Opposite MonoidalCategory

/-! ## Layer 10: derivators -/

section Derivator

variable (D : Pseudofunctor (Cat.{w, w})ᵒᵖ Cat.{v₁, u₁})

/-- **Layer 10.1.** The value `D(J)` of a prederivator. -/
abbrev value (J : Type w) [SmallCategory J] : Cat.{v₁, u₁} := D.obj (op (Cat.of J))

/-- **Layer 10.1.** Restriction `F^* : D(K) ⥤ D(J)` along `F : J ⥤ K`. -/
abbrev restrict {J K : Type w} [SmallCategory J] [SmallCategory K] (F : J ⥤ K) :
    value D K ⟶ value D J :=
  D.map F.toCatHom.op

/-- **Layer 10.2.** Der2: isomorphisms are detected pointwise (Groth 2013, Definition 1.10). -/
def SatisfiesDer2 : Prop :=
  ∀ (J : Type w) [SmallCategory J] {X Y : value D J} (f : X ⟶ Y),
    (∀ j : J, IsIso ((restrict D (Functor.fromPUnit j :
      Discrete PUnit.{w + 1} ⥤ J)).toFunctor.map f)) → IsIso f

/-- **Layer 10.2.** Der3: every restriction has both adjoints (Groth 2013, Definition 1.10). -/
def SatisfiesDer3 : Prop :=
  ∀ {J K : Type w} [SmallCategory J] [SmallCategory K] (F : J ⥤ K),
    (restrict D F).toFunctor.IsLeftAdjoint ∧ (restrict D F).toFunctor.IsRightAdjoint

end Derivator

/-! ## Layer 11: cofibration categories -/

section CofibrationCategory

variable (C : Type u) [Category.{v} C] [CategoryWithCofibrations C]
  [CategoryWithWeakEquivalences C] [HasInitial C]

/-- **Layer 11.1.** Baues' axioms C1–C3 (Baues 1989, Chapter I, (1.1)). -/
class IsCofibrationCategory : Prop where
  /-- C1: isomorphisms are cofibrations. -/
  iso_cofibration : ∀ {X Y : C} (e : X ≅ Y), cofibrations C e.hom
  /-- C1: isomorphisms are weak equivalences. -/
  iso_weakEquivalence : ∀ {X Y : C} (e : X ≅ Y), weakEquivalences C e.hom
  /-- C1: weak equivalences have two-out-of-three. -/
  twoOutOfThree : (weakEquivalences C).HasTwoOutOfThreeProperty
  /-- C1: cofibrations compose. -/
  comp_cofibration : ∀ {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z),
    cofibrations C f → cofibrations C g → cofibrations C (f ≫ g)
  /-- C2: pushouts along cofibrations exist. -/
  hasPushout : ∀ {X Y Z : C} (i : X ⟶ Y) (f : X ⟶ Z), cofibrations C i → HasPushout i f
  /-- C2: the cobase change of a cofibration is a cofibration. -/
  cofibration_cobaseChange : ∀ {X Y Z P : C} {i : X ⟶ Y} {f : X ⟶ Z} {f' : Y ⟶ P}
    {i' : Z ⟶ P}, IsPushout i f f' i' → cofibrations C i → cofibrations C i'
  /-- C2: the cobase change of a trivial cofibration is a weak equivalence. -/
  weakEquivalence_cobaseChange : ∀ {X Y Z P : C} {i : X ⟶ Y} {f : X ⟶ Z} {f' : Y ⟶ P}
    {i' : Z ⟶ P}, IsPushout i f f' i' → cofibrations C i → weakEquivalences C i →
      weakEquivalences C i'
  /-- C2: along a cofibration, the map parallel to a weak equivalence is a weak equivalence. -/
  weakEquivalence_parallel : ∀ {X Y Z P : C} {i : X ⟶ Y} {f : X ⟶ Z} {f' : Y ⟶ P}
    {i' : Z ⟶ P}, IsPushout i f f' i' → cofibrations C i → weakEquivalences C f →
      weakEquivalences C f'
  /-- C3: every map factors as a cofibration followed by a weak equivalence. -/
  factorization : ∀ {X Y : C} (f : X ⟶ Y),
    ∃ (Z : C) (i : X ⟶ Z) (p : Z ⟶ Y), cofibrations C i ∧ weakEquivalences C p ∧ i ≫ p = f

/-- **Layer 11.2.** Brown's factorization lemma between cofibrant objects: `f = i ≫ r` with `i`
a cofibration and `r` a retraction of a trivial cofibration `j`. -/
theorem brown_factorization [IsCofibrationCategory C] {X Y : C}
    (hX : cofibrations C (initial.to X)) (hY : cofibrations C (initial.to Y)) (f : X ⟶ Y) :
    ∃ (Z : C) (i : X ⟶ Z) (r : Z ⟶ Y) (j : Y ⟶ Z),
      cofibrations C i ∧ cofibrations C j ∧ weakEquivalences C j ∧ j ≫ r = 𝟙 Y ∧
        i ≫ r = f := by
  sorry

end CofibrationCategory

/-! ## Layer 12: gr-categories, crossed modules and Picard groupoids -/

section GrCategory

/-- **Layer 12.1.** A gr-category: a monoidal groupoid whose objects are all tensor-invertible. -/
class IsGrCategory (C : Type u) [Groupoid.{v} C] [MonoidalCategory C] : Prop where
  /-- Every object has a tensor inverse up to isomorphism. -/
  exists_inverse : ∀ X : C, ∃ Y : C, Nonempty (X ⊗ Y ≅ 𝟙_ C)

/-- **Layer 12.1.** In a gr-category every element of `π₀ = Skeleton C` is a unit for
Mathlib's `Skeleton.instMonoid`, so `π₀` is a group. -/
theorem isUnit_skeleton (C : Type u) [Groupoid.{v} C] [MonoidalCategory C] [IsGrCategory C]
    (x : Skeleton C) : IsUnit x := by
  sorry

/-- **Layer 12.6.** Strict commutativity of a symmetric monoidal category (Deligne, SGA 4 XVIII,
§1.4): the symmetry of `X ⊗ X` is the identity. -/
def IsStrictlyCommutative (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [SymmetricCategory C] : Prop :=
  ∀ X : C, (β_ X X).hom = 𝟙 (X ⊗ X)

/-- **Layer 12.6.** `ch(d)`: objects the elements of `K⁰`, morphisms `x ⟶ y` the `k : K⁻¹`
with `x + d k = y`. -/
structure TwoTerm {K₁ K₀ : Type u} [AddCommGroup K₁] [AddCommGroup K₀] (d : K₁ →+ K₀) where
  /-- The underlying element of `K⁰`. -/
  val : K₀

namespace TwoTerm

variable {K₁ K₀ : Type u} [AddCommGroup K₁] [AddCommGroup K₀] {d : K₁ →+ K₀}

/-- **Layer 12.6.** A morphism `x ⟶ y` of `ch(d)`: a label `k : K⁻¹` with `x + d k = y`. -/
@[ext]
structure Hom (x y : TwoTerm d) where
  /-- The label in `K⁻¹`. -/
  label : K₁
  /-- The label carries `x` to `y`. -/
  w : x.val + d label = y.val

/-- **Layer 12.6.** The groupoid `ch(d)`: composition adds labels, inversion negates them. -/
instance : Groupoid.{u} (TwoTerm d) where
  Hom := Hom
  id x := ⟨0, by simp⟩
  comp f g := ⟨f.label + g.label, by rw [map_add, ← add_assoc, f.w, g.w]⟩
  id_comp f := Hom.ext (zero_add _)
  comp_id f := Hom.ext (add_zero _)
  assoc f g h := Hom.ext (add_assoc _ _ _)
  inv f := ⟨-f.label, by rw [map_neg, ← f.w]; abel⟩
  inv_comp f := Hom.ext (neg_add_cancel _)
  comp_inv f := Hom.ext (add_neg_cancel _)

/-- **Layer 12.6.** Labels add under composition (a proof obligation of the instances below). -/
@[simp]
theorem comp_label {x y z : TwoTerm d} (f : x ⟶ y) (g : y ⟶ z) :
    Hom.label (f ≫ g) = Hom.label f + Hom.label g :=
  rfl

/-- **Layer 12.6.** The morphism of `ch(d)` labelled `0` between objects with equal values. -/
def eqHom {x y : TwoTerm d} (h : x.val = y.val) : x ⟶ y :=
  (⟨0, by rw [map_zero, add_zero, h]⟩ : Hom x y)

/-- **Layer 12.6.** The isomorphism of `ch(d)` labelled `0` between objects with equal values. -/
def eqIso {x y : TwoTerm d} (h : x.val = y.val) : x ≅ y where
  hom := eqHom h
  inv := eqHom h.symm
  hom_inv_id := Hom.ext (add_zero (0 : K₁))
  inv_hom_id := Hom.ext (add_zero (0 : K₁))

/-- **Layer 12.6.** The isomorphisms `eqIso` are labelled `0` (a proof obligation of the
instances below). -/
@[simp]
theorem eqIso_hom_label {x y : TwoTerm d} (h : x.val = y.val) : Hom.label (eqIso h).hom = 0 :=
  rfl

/-- **Layer 12.6.** The inverses of the isomorphisms `eqIso` are labelled `0` (a proof
obligation of the instances below). -/
@[simp]
theorem eqIso_inv_label {x y : TwoTerm d} (h : x.val = y.val) : Hom.label (eqIso h).inv = 0 :=
  rfl

/-- **Layer 12.6.** The monoidal structure of `ch(d)`: tensor `+` on objects and on labels,
with `0`-labelled structure isomorphisms. -/
instance : MonoidalCategory (TwoTerm d) where
  tensorObj x y := ⟨x.val + y.val⟩
  whiskerLeft x _ _ f := (⟨Hom.label f, by
    change x.val + _ + d (Hom.label f) = x.val + _; rw [add_assoc, Hom.w f]⟩ : Hom _ _)
  whiskerRight f y := (⟨Hom.label f, by
    change _ + y.val + d (Hom.label f) = _ + y.val; rw [add_right_comm, Hom.w f]⟩ : Hom _ _)
  tensorHom f g := (⟨Hom.label f + Hom.label g, by
    change _ + _ + d (Hom.label f + Hom.label g) = _ + _
    rw [map_add, ← Hom.w f, ← Hom.w g]; abel⟩ : Hom _ _)
  tensorUnit := ⟨0⟩
  associator x y z := eqIso (add_assoc x.val y.val z.val)
  leftUnitor x := eqIso (zero_add x.val)
  rightUnitor x := eqIso (add_zero x.val)
  tensorHom_def f g := Hom.ext (by simp only [comp_label])
  id_tensorHom_id x y := Hom.ext (add_zero (0 : K₁))
  tensorHom_comp_tensorHom f₁ f₂ g₁ g₂ := Hom.ext (by simp only [comp_label]; abel)
  whiskerLeft_id x y := Hom.ext rfl
  id_whiskerRight x y := Hom.ext rfl
  associator_naturality f₁ f₂ f₃ := Hom.ext (by
    simp only [comp_label, eqIso_hom_label]; abel)
  leftUnitor_naturality f := Hom.ext (by simp only [comp_label, eqIso_hom_label]; abel)
  rightUnitor_naturality f := Hom.ext (by simp only [comp_label, eqIso_hom_label]; abel)
  pentagon w x y z := Hom.ext (by simp only [comp_label, eqIso_hom_label]; abel)
  triangle x y := Hom.ext (by simp only [comp_label, eqIso_hom_label]; abel)

/-- **Layer 12.6.** The symmetry of `ch(d)`, labelled `0`. -/
instance : SymmetricCategory (TwoTerm d) where
  braiding x y := eqIso (add_comm x.val y.val)
  braiding_naturality_right x y z f := Hom.ext (by
    simp only [comp_label, eqIso_hom_label]; abel)
  braiding_naturality_left f z := Hom.ext (by
    simp only [comp_label, eqIso_hom_label]; abel)
  hexagon_forward x y z := Hom.ext rfl
  hexagon_reverse x y z := Hom.ext rfl
  symmetry x y := Hom.ext (add_zero (0 : K₁))

end TwoTerm

variable {K₁ K₀ : Type u} [AddCommGroup K₁] [AddCommGroup K₀] (d : K₁ →+ K₀)

/-- **Layer 12.6.** `π₀ ch(d) = coker d`, as monoids. -/
theorem skeletonTwoTermMulEquiv :
    Nonempty (Skeleton (TwoTerm d) ≃* Multiplicative (K₀ ⧸ d.range)) := by
  sorry

/-- **Layer 12.6.** `π₁ ch(d) = ker d`, as groups. -/
theorem autUnitTwoTermMulEquiv : Nonempty (Aut (𝟙_ (TwoTerm d)) ≃* Multiplicative d.ker) := by
  sorry

end GrCategory

end TauCetiRoadmap.HomotopyTheoryOfCategories

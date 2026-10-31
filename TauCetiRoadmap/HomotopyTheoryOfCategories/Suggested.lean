import Mathlib

/-!
# Homotopy theory of small categories: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is permitted in this human-owned repository:
these are targets, not implementations.

Classes of functors are `MorphismProperty Cat.{u, u}`, and a functor `F : A ⥤ B` between small
categories enters such a class as `F.toCatHom`. The minimal localizer `Winfty` is defined
intrinsically as an intersection; its identification with the Thomason equivalences (functors
whose nerve is a simplicial weak equivalence) is Layer 4 of the README and is not prototyped
here, because the simplicial weak equivalences are supplied by the GeneralizedCohomology roadmap.

Layers 7–9 build on Mathlib's `HomotopicalAlgebra.ReedyStructure W₁ W₂ α` (degree `deg`, the
axioms `lt₁`, `lt₂`, `nonempty_unique`, the opposite structure `ReedyStructure.op`, the degree of
a morphism `ReedyStructure.degHom` and its lemmas, `ReedyStructure.skeletal`),
`SemiSimplexCategory`, `SSet.Nonsingular`, `SSet.N`, `WideSubcategory`, `Functor.Elements`,
`Subfunctor` and `WellFounded.rank`. Their declarations live in the namespaces Mathlib would use
(`CategoryTheory`, `HomotopicalAlgebra.ReedyStructure`, `SemiSimplexCategory`), so that dot
notation such as `r.directPart` works. Latching and matching objects and the Reedy model
structure are out of scope (see the README's scope boundary), and every structure here is a
Mathlib `ReedyStructure`.
-/

universe w v₁ u₁ v u

/-! ## Layer 0: categorical prerequisites

Stated for arbitrary categories, in the Mathlib namespaces they extend. -/

section CategoricalPrerequisites

universe v₂ u₂

namespace CategoryTheory.Adjunction

variable {C : Type u₁} {D : Type u₂} [Category.{v₁} C] [Category.{v₂} D]
  {L : C ⥤ D} {R : D ⥤ C} (adj : L ⊣ R)

/-- For an adjunction `L ⊣ R` with unit `η` and counit `ε`, the four conditions `ηR`, `Rε`,
`εL` and `Lη` invertible are equivalent. An adjunction satisfying them is *idempotent*. -/
theorem idempotent_tfae :
    List.TFAE [∀ Y, IsIso (adj.unit.app (R.obj Y)), ∀ Y, IsIso (R.map (adj.counit.app Y)),
      ∀ X, IsIso (adj.counit.app (L.obj X)), ∀ X, IsIso (L.map (adj.unit.app X))] := by
  sorry

/-- The objects of `C` at which the unit of `L ⊣ R` is an isomorphism. -/
def fixedLeft : ObjectProperty C := fun X ↦ IsIso (adj.unit.app X)

/-- The objects of `D` at which the counit of `L ⊣ R` is an isomorphism. -/
def fixedRight : ObjectProperty D := fun Y ↦ IsIso (adj.counit.app Y)

instance : adj.fixedLeft.IsClosedUnderIsomorphisms := by
  sorry

instance : adj.fixedRight.IsClosedUnderIsomorphisms := by
  sorry

variable {adj} in
lemma fixedRight_obj {X : C} (h : adj.fixedLeft X) : adj.fixedRight (L.obj X) := by
  sorry

variable {adj} in
lemma fixedLeft_obj {Y : D} (h : adj.fixedRight Y) : adj.fixedLeft (R.obj Y) := by
  sorry

lemma fixedRight_iff_exists {Y : D} :
    adj.fixedRight Y ↔ ∃ X, adj.fixedLeft X ∧ Nonempty (L.obj X ≅ Y) := by
  sorry

/-- The restriction of `L` to the fixed objects. -/
def fixedLeftToFixedRight : adj.fixedLeft.FullSubcategory ⥤ adj.fixedRight.FullSubcategory :=
  adj.fixedRight.lift (adj.fixedLeft.ι ⋙ L) fun X ↦ fixedRight_obj X.2

/-- The restriction of `R` to the fixed objects. -/
def fixedRightToFixedLeft : adj.fixedRight.FullSubcategory ⥤ adj.fixedLeft.FullSubcategory :=
  adj.fixedLeft.lift (adj.fixedRight.ι ⋙ R) fun Y ↦ fixedLeft_obj Y.2

/-- Any adjunction restricts to an equivalence between the objects at which the unit is an
isomorphism and the objects at which the counit is an isomorphism; its unit and counit are those
of the adjunction. -/
noncomputable def fixedEquiv :
    adj.fixedLeft.FullSubcategory ≌ adj.fixedRight.FullSubcategory := by
  sorry

/-- For an idempotent adjunction, the objects at which the unit is an isomorphism form a
reflective subcategory, with reflector `L ⋙ R`. -/
noncomputable abbrev fixedLeftReflective (h : ∀ X, adj.fixedRight (L.obj X)) :
    Reflective adj.fixedLeft.ι := by
  sorry

/-- For an idempotent adjunction, the objects at which the counit is an isomorphism form a
coreflective subcategory, with coreflector `R ⋙ L`. -/
noncomputable abbrev fixedRightCoreflective (h : ∀ Y, adj.fixedLeft (R.obj Y)) :
    Coreflective adj.fixedRight.ι := by
  sorry

/-- When the unit is an isomorphism (`L` fully faithful), the essential image of `L` is the
fixed subcategory `fixedRight`. -/
lemma essImage_eq_fixedRight [IsIso adj.unit] : L.essImage = adj.fixedRight := by
  sorry

end CategoryTheory.Adjunction

namespace CategoryTheory.Idempotents

open Karoubi

variable {C D : Type*} [Category* C] [Category* D] [Preadditive C] [Preadditive D]

theorem additive_iff_toKaroubi_comp (F : Karoubi C ⥤ D) :
    F.Additive ↔ (toKaroubi C ⋙ F).Additive := by
  sorry

variable (C D) in
/-- Precomposition with `toKaroubi C`, as a functor between categories of additive functors. -/
def whiskeringLeftToKaroubiAdditive : (Karoubi C ⥤+ D) ⥤ (C ⥤+ D) :=
  (additiveFunctor C D).lift
    (AdditiveFunctor.forget _ _ ⋙ (Functor.whiskeringLeft C (Karoubi C) D).obj (toKaroubi C))
    (fun F ↦ inferInstanceAs (toKaroubi C ⋙ F.obj).Additive)

instance : (whiskeringLeftToKaroubiAdditive C D).Full := by
  sorry

instance : (whiskeringLeftToKaroubiAdditive C D).Faithful := by
  sorry

variable (C D) in
/-- When `D` is idempotent complete, additive functors `C ⥤ D` are equivalent to additive
functors `Karoubi C ⥤ D`. -/
noncomputable def karoubiUniversalAdditive [IsIdempotentComplete D] :
    C ⥤+ D ≌ Karoubi C ⥤+ D := by
  sorry

end CategoryTheory.Idempotents

namespace CategoryTheory

open Limits

/-- **Beck's monadicity theorem** as a characterization: the comparison functor of `F ⊣ G` is an
equivalence iff `G` reflects isomorphisms and, for every `G`-split pair, the coequalizer exists
and is preserved by `G`. -/
theorem Monad.isEquivalence_comparison_iff {C : Type u₁} {D : Type u₂} [Category.{v₁} C]
    [Category.{v₁} D] {F : C ⥤ D} {G : D ⥤ C} (adj : F ⊣ G) :
    (Monad.comparison adj).IsEquivalence ↔
      G.ReflectsIsomorphisms ∧ ∀ ⦃X Y : D⦄ (u v : X ⟶ Y), G.IsSplitPair u v →
        HasCoequalizer u v ∧ PreservesColimit (parallelPair u v) G := by
  sorry

/-- **Beck's comonadicity theorem** as a characterization. -/
theorem Comonad.isEquivalence_comparison_iff {C : Type u₁} {D : Type u₂} [Category.{v₁} C]
    [Category.{v₁} D] {F : C ⥤ D} {G : D ⥤ C} (adj : F ⊣ G) :
    (Comonad.comparison adj).IsEquivalence ↔
      F.ReflectsIsomorphisms ∧ ∀ ⦃X Y : C⦄ (u v : X ⟶ Y), F.IsCosplitPair u v →
        HasEqualizer u v ∧ PreservesLimit (parallelPair u v) F := by
  sorry

instance (priority := 100) Monad.reflectsIsomorphisms_of_monadicRightAdjoint
    {C : Type u₁} {D : Type u₂} [Category.{v₁} C] [Category.{v₁} D] (G : D ⥤ C)
    [MonadicRightAdjoint G] : G.ReflectsIsomorphisms := by
  sorry

instance (priority := 100) Comonad.reflectsIsomorphisms_of_comonadicLeftAdjoint
    {C : Type u₁} {D : Type u₂} [Category.{v₁} C] [Category.{v₁} D] (F : C ⥤ D)
    [ComonadicLeftAdjoint F] : F.ReflectsIsomorphisms := by
  sorry

end CategoryTheory

end CategoricalPrerequisites

namespace TauCetiRoadmap.HomotopyTheoryOfCategories

open CategoryTheory CategoryTheory.Limits HomotopicalAlgebra Opposite MonoidalCategory

noncomputable section

/-! ## Layer 1: the 1-truncated layer -/

section OneTruncated

variable {A B : Type u} [SmallCategory A] [SmallCategory B]

/-! The fundamental groupoid `Π₁ A` of a category is Mathlib's `FreeGroupoid A`, the
localization at all morphisms (`(FreeGroupoid.of A).IsLocalization ⊤`), and `Π₁ F` is
`FreeGroupoid.map F`; no second carrier is introduced. -/

/-- `Π₁ G ≌ G` for a groupoid `G`. -/
def freeGroupoidEquivOfGroupoid (G : Type u) [Groupoid.{v} G] : FreeGroupoid G ≌ G := sorry

/-- Connected components of `Π₁ A` are those of `A`. -/
def connectedComponentsFreeGroupoidEquiv (A : Type u) [Category.{v} A] :
    ConnectedComponents (FreeGroupoid A) ≃ ConnectedComponents A := sorry

/-- `W₀`: functors inducing a bijection on connected components. -/
def W₀ : MorphismProperty Cat.{u, u} :=
  fun _ _ F => Function.Bijective F.toFunctor.mapConnectedComponents

/-- `W₁`: functors inducing an equivalence of fundamental groupoids. -/
def W₁ : MorphismProperty Cat.{u, u} :=
  fun _ _ F => (FreeGroupoid.map F.toFunctor).IsEquivalence

/-- `W₋₁`: functors `F : A ⥤ B` with `A` nonempty iff `B` is. -/
def WNeg₁ : MorphismProperty Cat.{u, u} :=
  fun X Y _ => (Nonempty X ↔ Nonempty Y)

/-- A fibration of groupoids: a star-surjective functor (Brown–Heath–Kamps 1983, §2). -/
def IsGroupoidFibration {E D : Type u} [Groupoid.{v} E] [Groupoid.{v} D] (p : E ⥤ D) : Prop :=
  ∀ (x : E) (d : D) (g : p.obj x ⟶ d),
    ∃ (y : E) (f : x ⟶ y) (h : p.obj y = d), p.map f = g ≫ eqToHom h.symm

end OneTruncated

/-! ## Layer 2: basic localizers -/

section Localizer

/-- `A` is `W`-aspherical when `A ⥤ e` lies in `W`. -/
def IsAspherical (W : MorphismProperty Cat.{u, u}) (A : Type u) [SmallCategory A] : Prop :=
  W (Functor.star A : A ⥤ Discrete PUnit.{u + 1}).toCatHom

/-- `F` is `W`-aspherical when every slice `A/b` is `W`-aspherical. -/
def IsAsphericalFunctor (W : MorphismProperty Cat.{u, u}) {A B : Type u} [SmallCategory A]
    [SmallCategory B] (F : A ⥤ B) : Prop :=
  ∀ b : B, IsAspherical W (CostructuredArrow F b)

/-- A basic localizer (Cisinski 2004, 1.1.1 and Definition 1.1.3). -/
structure IsBasicLocalizer (W : MorphismProperty Cat.{u, u}) : Prop where
  containsIdentities : W.ContainsIdentities
  twoOutOfThree : W.HasTwoOutOfThreeProperty
  /-- FS3. -/
  retract : ∀ {X Y : Cat.{u, u}} (i : X ⟶ Y) (r : Y ⟶ X), i ≫ r = 𝟙 X → W (r ≫ i) → W r
  /-- LF2. -/
  aspherical_of_hasTerminal : ∀ (A : Type u) [SmallCategory A] [HasTerminal A],
    IsAspherical W A
  /-- LF3, the relative Theorem A. -/
  of_slices : ∀ {A B C : Type u} [SmallCategory A] [SmallCategory B] [SmallCategory C]
    (F : A ⥤ B) (G : B ⥤ C), (∀ c : C, W (CostructuredArrow.pre F G c).toCatHom) →
      W F.toCatHom

/-- The minimal basic localizer, as the intersection of all of them. -/
def Winfty : MorphismProperty Cat.{u, u} :=
  fun _ _ F => ∀ W : MorphismProperty Cat.{u, u}, IsBasicLocalizer W → W F

theorem isBasicLocalizer_Winfty : IsBasicLocalizer Winfty.{u} := sorry

theorem Winfty_le {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W) : Winfty ≤ W :=
  sorry

theorem isBasicLocalizer_W₀ : IsBasicLocalizer W₀.{u} := sorry

theorem isBasicLocalizer_W₁ : IsBasicLocalizer W₁.{u} := sorry

theorem isBasicLocalizer_WNeg₁ : IsBasicLocalizer WNeg₁.{u} := sorry

theorem W₁_le_W₀ : W₁.{u} ≤ W₀ := sorry

/-- Quillen's Theorem A for an arbitrary basic localizer. -/
theorem mem_of_isAsphericalFunctor {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W)
    {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B)
    (hF : IsAsphericalFunctor W F) : W F.toCatHom := sorry

/-- Functors with a left or right adjoint are in every basic localizer
(Cisinski 2004, Corollary 1.1.10). -/
theorem mem_of_isRightAdjoint {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W)
    {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B) [F.IsRightAdjoint] :
    W F.toCatHom := sorry

theorem mem_of_isLeftAdjoint {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W)
    {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B) [F.IsLeftAdjoint] :
    W F.toCatHom := sorry

/-- `W`-locally constant functors (Cisinski 2004, 2.3.1). -/
def IsLocallyConstant (W : MorphismProperty Cat.{u, u}) {A B : Type u} [SmallCategory A]
    [SmallCategory B] (F : A ⥤ B) : Prop :=
  ∀ ⦃b b' : B⦄ (g : b ⟶ b'), W (CostructuredArrow.map (S := F) g).toCatHom

end Localizer

/-! ## Layer 3: presheaves -/

section Presheaf

variable (A : Type u) [SmallCategory A]

/-- `i_A X = A/X`. -/
abbrev iA (X : Aᵒᵖ ⥤ Type u) : Type u := CostructuredArrow yoneda X

/-- `i_A` as a functor to `Cat`. -/
def iAFunctor : (Aᵒᵖ ⥤ Type u) ⥤ Cat.{u, u} := sorry

/-- `i_A^* C = (a ↦ (A/a ⥤ C))`. -/
def iAStarFunctor : Cat.{u, u} ⥤ (Aᵒᵖ ⥤ Type u) := sorry

def iAAdjunction : iAFunctor A ⊣ iAStarFunctor A := sorry

/-- The weak equivalences `W_Â = i_A⁻¹ W` of presheaves. -/
abbrev presheafWeq (W : MorphismProperty Cat.{u, u}) : MorphismProperty (Aᵒᵖ ⥤ Type u) :=
  W.inverseImage (iAFunctor A)

theorem presheafWeq_isInvertedBy (W : MorphismProperty Cat.{u, u}) :
    (presheafWeq A W).IsInvertedBy (iAFunctor A ⋙ W.Q) := sorry

/-- The functor `Â[W_Â⁻¹] ⥤ Cat[W⁻¹]` induced by `i_A`. -/
def iALocalized (W : MorphismProperty Cat.{u, u}) :
    (presheafWeq A W).Localization ⥤ W.Localization :=
  Localization.Construction.lift _ (presheafWeq_isInvertedBy A W)

/-- A weak test category (Maltsiniotis 2009, 2.3). Since `i_A ⊣ i_A^*`, asking that `i_A^*`
reflect and preserve weak equivalences and that the functor induced by `i_A` be an equivalence
makes the two induced functors quasi-inverse. -/
structure IsWeakTestCategory (W : MorphismProperty Cat.{u, u}) : Prop where
  iAStar_mem_iff : ∀ ⦃C D : Cat.{u, u}⦄ (F : C ⟶ D),
    W F ↔ presheafWeq A W ((iAStarFunctor A).map F)
  isEquivalence : (iALocalized A W).IsEquivalence

/-- A local test category: every `A/a` is a weak test category. -/
def IsLocalTestCategory (W : MorphismProperty Cat.{u, u}) : Prop :=
  ∀ a : A, IsWeakTestCategory (Over a) W

def IsTestCategory (W : MorphismProperty Cat.{u, u}) : Prop :=
  IsWeakTestCategory A W ∧ IsLocalTestCategory A W

/-- A strict test category: a test category whose localization functor preserves binary
products. -/
def IsStrictTestCategory (W : MorphismProperty Cat.{u, u}) : Prop :=
  IsTestCategory A W ∧
    ∀ X Y : Aᵒᵖ ⥤ Type u, PreservesLimit (pair X Y) (presheafWeq A W).Q

/-- `Δ` is a strict test category (Maltsiniotis 2005, Proposition 1.6.13). -/
theorem isStrictTestCategory_simplexCategory :
    IsStrictTestCategory (AsSmall.{u} SimplexCategory) Winfty.{u} := sorry

end Presheaf

end

end TauCetiRoadmap.HomotopyTheoryOfCategories

section DirectCategories

open CategoryTheory Opposite


/-! ## Layer 7: direct and inverse categories -/

namespace CategoryTheory

/-- The relation on objects "there is a non-identity morphism `X ⟶ Y`". -/
def DirectRel (C : Type u) [Category.{v} C] (X Y : C) : Prop :=
  ∃ f : X ⟶ Y, ¬ MorphismProperty.identities C f

/-- A category is *direct* if there is no infinite descending chain of non-identity
morphisms `⋯ ⟶ X₂ ⟶ X₁ ⟶ X₀`, i.e. `DirectRel C` is well-founded. -/
class IsDirect (C : Type u) [Category.{v} C] : Prop where
  wellFounded : WellFounded (DirectRel C)

/-- A category is *inverse* if its opposite is direct. -/
class IsInverse (C : Type u) [Category.{v} C] : Prop where
  isDirect_op : IsDirect Cᵒᵖ

theorem isInverse_iff (C : Type u) [Category.{v} C] : IsInverse C ↔ IsDirect Cᵒᵖ :=
  ⟨fun h => h.isDirect_op, fun h => ⟨h⟩⟩

namespace IsDirect

variable {C : Type u} [Category.{v} C] [IsDirect C]

/-- The canonical degree of an object of a direct category: its rank for `DirectRel C`. -/
noncomputable def rank (X : C) : Ordinal.{u} :=
  haveI : WellFounded (DirectRel C) := IsDirect.wellFounded
  WellFounded.rank (DirectRel C) X

theorem rank_lt {X Y : C} (f : X ⟶ Y) (hf : ¬ MorphismProperty.identities C f) :
    rank X < rank Y :=
  haveI : WellFounded (DirectRel C) := IsDirect.wellFounded
  WellFounded.rank_lt_of_rel ⟨f, hf⟩

theorem eq_id_of_endo {X : C} (f : X ⟶ X) : f = 𝟙 X := by
  sorry

theorem skeletal : Skeletal C := by
  sorry

/-- The only factorization of `f` as an identity followed by an arbitrary morphism. -/
instance {X Y : C} (f : X ⟶ Y) :
    Unique ((MorphismProperty.identities C).MapFactorizationData ⊤ f) where
  default := ⟨X, 𝟙 X, f, by simp, .mk _, trivial⟩
  uniq := by
    rintro ⟨Z, i, p, fac, hi, hp⟩
    cases hi
    simp only [Category.id_comp] at fac
    subst fac
    rfl

/-- The canonical Reedy structure of a direct category: `W₁` the identities, `W₂` all
morphisms, degree `rank`. -/
noncomputable def reedyStructure :
    HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤ Ordinal.{u} where
  deg := rank
  lt₁ _ hf hf' := absurd hf hf'
  lt₂ f _ hf' := rank_lt f hf'
  nonempty_unique _ := ⟨inferInstance⟩

end IsDirect

variable (C : Type u) [Category.{v} C]

/-- Direct categories are exactly those carrying a Reedy structure whose `W₁` is the
identities and whose `W₂` is everything, for some well-ordered degree type. -/
theorem isDirect_iff_nonempty_reedyStructure :
    IsDirect C ↔
      Nonempty (HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤
        Ordinal.{u}) := by
  sorry

theorem IsDirect.of_reedyStructure {α : Type w} [LinearOrder α] [OrderBot α] [SuccOrder α]
    [WellFoundedLT α]
    (r : HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤ α) :
    IsDirect C := by
  sorry

/-- A direct category has an `ℕ`-valued degree exactly when every rank is finite. -/
theorem nonempty_reedyStructure_nat_iff :
    Nonempty (HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤ ℕ) ↔
      ∃ _ : IsDirect C, ∀ X : C, IsDirect.rank X < Ordinal.omega0 := by
  sorry

/-- A thin skeletal category all of whose morphisms are monomorphisms need not be direct:
the integers. -/
example : ¬ IsDirect ℤ := by
  sorry

end CategoryTheory

namespace HomotopicalAlgebra.ReedyStructure

variable {C : Type u} [Category.{v} C] {W₁ W₂ : MorphismProperty C}
  [W₁.IsMultiplicative] [W₂.IsMultiplicative]
  {α : Type w} [LinearOrder α] [OrderBot α] [SuccOrder α] [WellFoundedLT α]

/-- The degree-raising part of a Reedy structure is direct, with the same degree. -/
def directPart (r : ReedyStructure W₁ W₂ α) :
    ReedyStructure (MorphismProperty.identities (WideSubcategory W₂)) ⊤ α := by
  sorry

/-- The degree-lowering part of a Reedy structure is inverse, with the same degree. -/
def inversePart (r : ReedyStructure W₁ W₂ α) :
    ReedyStructure ⊤ (MorphismProperty.identities (WideSubcategory W₁)) α := by
  sorry

end HomotopicalAlgebra.ReedyStructure

/-! ## Layer 8: examples of direct and Reedy categories -/

namespace CategoryTheory

theorem isDirect_iff_wellFoundedLT (P : Type u) [PartialOrder P] :
    IsDirect P ↔ WellFoundedLT P := by
  sorry

/-- A partial order with finite lower sets is direct with `ℕ`-valued degree
`x ↦ #{y | y < x}`. -/
def reedyStructureOfLocallyFiniteOrderBot (P : Type u) [PartialOrder P]
    [LocallyFiniteOrderBot P] :
    HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities P) ⊤ ℕ where
  deg x := (Finset.Iio x).card
  lt₁ _ hf hf' := absurd hf hf'
  lt₂ f _ hf' := by sorry
  nonempty_unique _ := ⟨inferInstance⟩

end CategoryTheory

namespace SemiSimplexCategory

/-- The semi-simplex category is direct, with degree `len`. README 8.4 obtains this structure
from the Reedy structure of the simplex category by restriction to monomorphisms
(`ReedyStructure.directPart`), transported along the isomorphism of categories between
`SemiSimplexCategory` and the wide subcategory of monomorphisms of `SimplexCategory`. -/
def reedyStructure :
    HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities SemiSimplexCategory) ⊤ ℕ := by
  sorry

instance : IsDirect SemiSimplexCategory := by
  sorry

lemma len_le_of_hom {n m : SemiSimplexCategory} (f : n ⟶ m) : n.len ≤ m.len := by
  sorry

/-- A morphism of `SemiSimplexCategory` which is not an identity strictly increases `len`. -/
lemma len_lt_of_not_identities {n m : SemiSimplexCategory} (f : n ⟶ m)
    (hf : ¬ MorphismProperty.identities _ f) : n.len < m.len := by
  sorry

/-- In `SemiSimplexCategory`, every endomorphism is an identity (from `IsDirect.eq_id_of_endo`). -/
lemma eq_id_of_endo {n : SemiSimplexCategory} (f : n ⟶ n) : f = 𝟙 n := by
  sorry

end SemiSimplexCategory

/-- Semi-simplicial objects of a category. -/
abbrev SemiSimplicialObject (D : Type u) [Category.{v} D] :=
  SemiSimplexCategoryᵒᵖ ⥤ D

/-! ## Layer 9: non-singular presheaves on direct categories -/

namespace CategoryTheory

variable {C : Type u} [Category.{v} C]

/-- A presheaf is non-singular if every element `x ∈ X(c)` has injective "faces" map
`(c' ⟶ c) → X(c')`, `u ↦ X(u)(x)`; equivalently each `yoneda.obj c ⟶ X` classifying an
element is a monomorphism. -/
def Presheaf.IsNonsingular (X : Cᵒᵖ ⥤ Type w) : Prop :=
  ∀ ⦃c c' : C⦄ (x : X.obj (op c)) (u v : c' ⟶ c), X.map u.op x = X.map v.op x → u = v

theorem Presheaf.isNonsingular_iff_isThin (X : Cᵒᵖ ⥤ Type w) :
    Presheaf.IsNonsingular X ↔ Quiver.IsThin X.Elements := by
  sorry

theorem Presheaf.isNonsingular_iff_mono {C : Type u} [SmallCategory C] (X : Cᵒᵖ ⥤ Type u) :
    Presheaf.IsNonsingular X ↔
      ∀ (c : C) (x : X.obj (op c)), Mono (yonedaEquiv.symm x) := by
  sorry

/-- A presheaf with a morphism to a non-singular presheaf is non-singular; in particular every
subpresheaf of a non-singular presheaf is non-singular. -/
theorem Presheaf.IsNonsingular.of_hom {X Y : Cᵒᵖ ⥤ Type w} (f : X ⟶ Y)
    (hY : Presheaf.IsNonsingular Y) : Presheaf.IsNonsingular X := by
  sorry

/-- A functor `p : E ⥤ C` is a discrete fibration if every morphism into `p.obj e` lifts
uniquely to a morphism into `e`. -/
def Functor.IsDiscreteFibration {E : Type*} [Category* E] (p : E ⥤ C) : Prop :=
  ∀ e : E, Function.Bijective
    (fun φ : (e' : E) × (e' ⟶ e) => (⟨p.obj φ.1, p.map φ.2⟩ : (c : C) × (c ⟶ p.obj e)))

/-- Discrete fibrations over `C`, as a full subcategory of the slice of `Cat` over `C`. -/
def DiscreteFibration (C : Type u) [Category.{v} C] :=
  ObjectProperty.FullSubcategory
    (fun p : Over (Cat.of C) => Functor.IsDiscreteFibration p.hom.toFunctor)

end CategoryTheory

end DirectCategories

namespace TauCetiRoadmap.HomotopyTheoryOfCategories

open CategoryTheory CategoryTheory.Limits HomotopicalAlgebra Opposite MonoidalCategory

noncomputable section

/-! ## Layer 10: derivators -/

section Derivator

-- The type necessarily lives in `Type (max (w+1) (v₁+1) (u₁+1))`.
set_option linter.checkUnivs false in
/-- A prederivator: a pseudofunctor from `Catᵒᵖ` (1-cells reversed) to `Cat`. -/
abbrev Prederivator := Pseudofunctor (Cat.{w, w})ᵒᵖ Cat.{v₁, u₁}

variable (D : Pseudofunctor (Cat.{w, w})ᵒᵖ Cat.{v₁, u₁})

/-- The value `D(J)`. -/
abbrev value (J : Type w) [SmallCategory J] : Cat.{v₁, u₁} := D.obj (op (Cat.of J))

/-- Restriction `F^* : D(K) ⥤ D(J)` along `F : J ⥤ K`. -/
abbrev restrict {J K : Type w} [SmallCategory J] [SmallCategory K] (F : J ⥤ K) :
    value D K ⟶ value D J :=
  D.map F.toCatHom.op

/-- Der2: isomorphisms are detected pointwise (Groth 2013, Definition 1.10). -/
def SatisfiesDer2 : Prop :=
  ∀ (J : Type w) [SmallCategory J] {X Y : value D J} (f : X ⟶ Y),
    (∀ j : J, IsIso ((restrict D (Functor.fromPUnit j : Discrete PUnit.{w + 1} ⥤ J)).toFunctor.map f)) → IsIso f

/-- Der3: every restriction has both adjoints (Groth 2013, Definition 1.10). -/
def SatisfiesDer3 : Prop :=
  ∀ {J K : Type w} [SmallCategory J] [SmallCategory K] (F : J ⥤ K),
    (restrict D F).toFunctor.IsLeftAdjoint ∧ (restrict D F).toFunctor.IsRightAdjoint

end Derivator

/-! ## Layer 11: cofibration categories -/

section CofibrationCategory

variable (C : Type u) [Category.{v} C] [CategoryWithCofibrations C]
  [CategoryWithWeakEquivalences C] [HasInitial C]

/-- Baues' axioms C1–C3 (Baues 1989, Chapter I, (1.1)). -/
class IsCofibrationCategory : Prop where
  iso_cofibration : ∀ {X Y : C} (e : X ≅ Y), cofibrations C e.hom
  iso_weakEquivalence : ∀ {X Y : C} (e : X ≅ Y), weakEquivalences C e.hom
  twoOutOfThree : (weakEquivalences C).HasTwoOutOfThreeProperty
  comp_cofibration : ∀ {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z),
    cofibrations C f → cofibrations C g → cofibrations C (f ≫ g)
  hasPushout : ∀ {X Y Z : C} (i : X ⟶ Y) (f : X ⟶ Z), cofibrations C i → HasPushout i f
  cofibration_cobaseChange : ∀ {X Y Z P : C} {i : X ⟶ Y} {f : X ⟶ Z} {f' : Y ⟶ P}
    {i' : Z ⟶ P}, IsPushout i f f' i' → cofibrations C i → cofibrations C i'
  weakEquivalence_cobaseChange : ∀ {X Y Z P : C} {i : X ⟶ Y} {f : X ⟶ Z} {f' : Y ⟶ P}
    {i' : Z ⟶ P}, IsPushout i f f' i' → cofibrations C i → weakEquivalences C i →
      weakEquivalences C i'
  weakEquivalence_parallel : ∀ {X Y Z P : C} {i : X ⟶ Y} {f : X ⟶ Z} {f' : Y ⟶ P}
    {i' : Z ⟶ P}, IsPushout i f f' i' → cofibrations C i → weakEquivalences C f →
      weakEquivalences C f'
  factorization : ∀ {X Y : C} (f : X ⟶ Y),
    ∃ (Z : C) (i : X ⟶ Z) (p : Z ⟶ Y), cofibrations C i ∧ weakEquivalences C p ∧ i ≫ p = f

/-- Brown's factorization lemma between cofibrant objects. -/
theorem brown_factorization [IsCofibrationCategory C] {X Y : C}
    (hX : cofibrations C (initial.to X)) (hY : cofibrations C (initial.to Y)) (f : X ⟶ Y) :
    ∃ (Z : C) (i : X ⟶ Z) (r : Z ⟶ Y) (j : Y ⟶ Z),
      cofibrations C i ∧ cofibrations C j ∧ weakEquivalences C j ∧ j ≫ r = 𝟙 Y ∧
        i ≫ r = f := sorry

end CofibrationCategory

/-! ## Layer 12: gr-categories, crossed modules, Picard categories -/

section GrCategory

/-- A gr-category: a monoidal groupoid whose objects are all tensor-invertible. -/
class IsGrCategory (C : Type u) [Groupoid.{v} C] [MonoidalCategory C] : Prop where
  exists_inverse : ∀ X : C, ∃ Y : C, Nonempty (X ⊗ Y ≅ 𝟙_ C)

variable (C : Type u) [Groupoid.{v} C] [MonoidalCategory C]

/-- `π₀ C` is Mathlib's `Skeleton C`, the isomorphism classes of objects, with the monoid
structure `Skeleton.instMonoid` induced by `⊗`. In a gr-category every element is invertible;
the group structure adds only the inverse, so it agrees with Mathlib's monoid structure. -/
noncomputable instance [IsGrCategory C] : Group (Skeleton C) :=
  { (inferInstance : Monoid (Skeleton C)) with
    inv := sorry
    inv_mul_cancel := sorry }

theorem aut_unit_mul_comm (a b : Aut (𝟙_ C)) : a * b = b * a := sorry

/-- `π₁ = Aut(𝟙)` as a representation of `π₀` over `ℤ`. -/
def piOneRep [IsGrCategory C] : Rep (ULift.{u} ℤ) (Skeleton C) := sorry

/-- The `k`-invariant in `H³(π₀, π₁)`. -/
def kInvariant [IsGrCategory C] : groupCohomology (piOneRep C) 3 := sorry

/-- Strict commutativity of a symmetric monoidal category (Deligne, SGA 4 XVIII, §1.4). -/
def IsStrictlyCommutative [SymmetricCategory C] : Prop :=
  ∀ X : C, (β_ X X).hom = 𝟙 (X ⊗ X)

/-- A crossed module of groups. -/
structure CrossedModule (G : Type u) [Group G] where
  H : Type u
  [group : Group H]
  act : G →* MulAut H
  bdry : H →* G
  bdry_act : ∀ (g : G) (h : H), bdry (act g h) = g * bdry h * g⁻¹
  peiffer : ∀ h h' : H, act (bdry h) h' = h * h' * h⁻¹

attribute [instance] CrossedModule.group

/-- `ch(d)`: objects `K⁰`, morphisms `x ⟶ y` the `k : K⁻¹` with `x + d k = y`. -/
def TwoTerm {K₁ K₀ : Type u} [AddCommGroup K₁] [AddCommGroup K₀] (_d : K₁ →+ K₀) : Type u :=
  K₀

variable {K₁ K₀ : Type u} [AddCommGroup K₁] [AddCommGroup K₀] (d : K₁ →+ K₀)

instance : Groupoid.{u} (TwoTerm d) := sorry

instance : MonoidalCategory (TwoTerm d) := sorry

instance : SymmetricCategory (TwoTerm d) := sorry

theorem isGrCategory_twoTerm : IsGrCategory (TwoTerm d) := sorry

theorem isStrictlyCommutative_twoTerm : IsStrictlyCommutative (TwoTerm d) := sorry

end GrCategory

end

end TauCetiRoadmap.HomotopyTheoryOfCategories

module

public import Mathlib

/-!
# Locally presentable categories and algebraic theories: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, with only the definitions their statements
need. Every carrier of presentability is Mathlib's: `IsCardinalPresentable`,
`IsCardinalLocallyPresentable`, `IsLocallyPresentable`, `IsCardinalAccessibleCategory`,
`IsAccessibleCategory`, `Functor.IsCardinalAccessible`, `Functor.IsAccessible`,
`MorphismProperty.isLocal`, `CategoryTheory.Ind`, `IsSifted` and `ObjectProperty.limitsClosure`.

Headline theorems stated here:

* README 1.1, `hasLimitsOfSize_of_isCardinalLocallyPresentable`: a locally presentable category
  is complete.
* README 1.2, `isCardinalLocallyPresentable_iff_exists_reflective`: locally `κ`-presentable
  categories are the full reflective subcategories of presheaf categories closed under
  `κ`-filtered colimits.
* README 1.3, `isLocallyPresentable_iff_isAccessibleCategory_and_hasLimits`: locally presentable
  means accessible and complete.
* README 1.4, `isRightAdjoint_iff` and `isLeftAdjoint_iff`: the adjoint functor theorem between
  locally presentable categories.
* README 1.5, `isFinitelyAccessibleCategory_iff_exists_ind`: finitely accessible categories are
  the categories `Ind A` for small `A`.
* README 1.6, `isFinitelyPresentable_moduleCat_iff` and `isLocallyFinitelyPresentable_moduleCat`:
  the finitely presentable objects of `ModuleCat R` are the finitely presented modules, and
  `ModuleCat R` is locally finitely presentable.
* README 1.7, `isAccessibleCategory_iff_isIdempotentComplete` and
  `isAccessibleCategory_of_directed`: small accessible categories are those with split
  idempotents, and directed unions of accessible full subcategories are accessible.
* README 1.8, `isLocallyPresentable_and_op_iff`: `C` and `Cᵒᵖ` are both locally presentable
  exactly when `C` is equivalent to a small complete lattice.
* README 2.1, `isCardinalLocallyPresentable_iff_exists_isLocal`: locally `κ`-presentable
  categories are the small-orthogonality classes in presheaf categories, for maps between
  `κ`-presentable presheaves.
* README 3.1, `exists_isLocal_eq_cardinalContinuous` and
  `isCardinalLocallyPresentable_models`: the models of a small category in `Type w` preserving
  `κ`-small limits form a small-orthogonality class and a locally `κ`-presentable category.
* README 3.2, `isCardinalLocallyPresentable_iff_exists_models`: every locally `κ`-presentable
  category is the category of models of a small category with `κ`-small limits.
* README 3.3, `nonempty_isCardinalPresentable_models_equivalence`: the theory is recovered as the
  opposite of the `κ`-presentable models.
* README 3.4, `restrict_isRightAdjoint` and `exists_iso_restrict`: morphisms of theories induce
  `κ`-accessible right adjoints, and every such right adjoint between categories of models is
  induced by a morphism of theories.
* README 4.1, `isLocallyFinitelyPresentable_algebras`; README 4.2,
  `preservesColimitsOfShape_algebras_ι`; README 4.3, `exists_equivalence_algebras_iff`: algebras
  of a finite-product theory, their sifted colimits, and the recognition theorem for categories
  of algebras.
* README 4.4, `exists_isInitial_algebra_colimit_initialChain` and
  `hasInitial_algebra_of_isAccessible`: the colimit of the initial chain, when preserved, is the
  initial algebra, and accessible endofunctors of locally presentable categories have initial
  algebras.
* README 5.1, `isRightAdjoint_ι_dModels`: models of a small category with `D`-limits are
  reflective in the functor category and locally presentable.
* README 5.2, `envelope_universal`: the `D`-envelope of a small category.
* README 5.3, `exists_localization`: inverting a set of arrows inside the 2-category of
  categories with `D`-limits.
* README 5.5, `generates_iff_essSurj`: generation under `D`-limits (`Generates`) is detected by
  fully faithful `D`-functors.

The two restriction functors `restrict` and `restrictInverting` carry proofs that restriction
preserves the defining limits; nothing in this file is data built on `sorry`.

Not stated here: README 3.5, the syntactic essentially algebraic theories (sorts, total and
partial operations, equations) and their equivalence with small categories with `κ`-small
limits, and README 5.4, sound doctrines; neither is a headline of the Summary, and both are kept
in the README. Not stated: the comparison of README 5.5 between basic functors and generation
under `D`-limits (basic functors generate; conversely when `WalkingParallelPair` is among the
`D a`), lacking a 2-colimit of a transfinite chain in the 2-category of categories with
`D`-limits, on which the notion of a basic functor is built.

Conventions (README §Conventions): `κ`-small shapes are small categories `J` with
`HasCardinalLT (Arrow J) κ`; models are covariant functors `T ⥤ Type w`; a family of limit shapes
is `D : α → Type w` with `[∀ a, SmallCategory (D a)]`.
-/

public section

namespace TauCetiRoadmap.LocallyPresentableCategories

open CategoryTheory Limits Opposite

universe w v v' u u'

/-! ## Layer 0: `κ`-small shapes -/

/-- A functor preserves `κ`-small limits: limits of every shape `J : Type w` with fewer than `κ`
morphisms (README 0.1). -/
def PreservesCardinalSmallLimits {X : Type u} [Category.{v} X] {Y : Type u'} [Category.{v'} Y]
    (F : X ⥤ Y) (κ : Cardinal.{w}) : Prop :=
  ∀ (J : Type w) [SmallCategory J], HasCardinalLT (Arrow J) κ → PreservesLimitsOfShape J F

/-- A category has `κ`-small limits: limits of every shape `J : Type w` with fewer than `κ`
morphisms (README 0.1). -/
def HasCardinalSmallLimits (X : Type u) [Category.{v} X] (κ : Cardinal.{w}) : Prop :=
  ∀ (J : Type w) [SmallCategory J], HasCardinalLT (Arrow J) κ → HasLimitsOfShape J X

/-! ## Layer 1: locally presentable and accessible categories -/

/-- README 1.1. A locally `κ`-presentable category has all `w`-small limits (a consequence of
Adámek–Rosický, Theorem 1.46). -/
theorem hasLimitsOfSize_of_isCardinalLocallyPresentable (C : Type u) [Category.{v} C]
    (κ : Cardinal.{w}) [Fact κ.IsRegular] [IsCardinalLocallyPresentable C κ] :
    HasLimitsOfSize.{w, w} C := sorry

/-- README 1.2. A category is locally `κ`-presentable iff it is (equivalent to) a full reflective
subcategory of a presheaf category on a small category, closed under `κ`-filtered colimits
(Adámek–Rosický, Theorem 1.46). -/
theorem isCardinalLocallyPresentable_iff_exists_reflective (C : Type u) [Category.{v} C]
    (κ : Cardinal.{w}) [Fact κ.IsRegular] :
    IsCardinalLocallyPresentable C κ ↔
      ∃ (A : Type w) (_ : SmallCategory A) (G : C ⥤ (Aᵒᵖ ⥤ Type w)),
        G.Full ∧ G.Faithful ∧ G.IsRightAdjoint ∧ G.IsCardinalAccessible κ := sorry

/-- README 1.3. A category is locally presentable iff it is accessible and complete
(Adámek–Rosický, Corollary 2.47). -/
theorem isLocallyPresentable_iff_isAccessibleCategory_and_hasLimits (C : Type u)
    [Category.{v} C] :
    IsLocallyPresentable.{w} C ↔ IsAccessibleCategory.{w} C ∧ HasLimitsOfSize.{w, w} C := sorry

/-- README 1.4. Between locally presentable categories, a functor is a right adjoint iff it
preserves small limits and is accessible (Adámek–Rosický, Theorem 1.66). -/
theorem isRightAdjoint_iff {C : Type u} [Category.{v} C] {D : Type u'} [Category.{v'} D]
    [IsLocallyPresentable.{w} C] [IsLocallyPresentable.{w} D] (G : C ⥤ D) :
    G.IsRightAdjoint ↔ PreservesLimitsOfSize.{w, w} G ∧ G.IsAccessible.{w} := sorry

/-- README 1.4. Between locally presentable categories, a functor is a left adjoint iff it
preserves small colimits (the special adjoint functor theorem). -/
theorem isLeftAdjoint_iff {C : Type u} [Category.{v} C] {D : Type u'} [Category.{v'} D]
    [IsLocallyPresentable.{w} C] [IsLocallyPresentable.{w} D] (F : C ⥤ D) :
    F.IsLeftAdjoint ↔ PreservesColimitsOfSize.{w, w} F := sorry

/-- README 1.5. A category is finitely accessible iff it is equivalent to `Ind A` for a small
category `A` (Adámek–Rosický, Theorem 2.26, at `λ = ℵ₀`). -/
theorem isFinitelyAccessibleCategory_iff_exists_ind (C : Type u) [Category.{v} C] :
    IsFinitelyAccessibleCategory.{w} C ↔
      ∃ (A : Type w) (_ : SmallCategory A), Nonempty (C ≌ Ind A) := sorry

/-- README 1.6. A module is a finitely presentable object of `ModuleCat R` (its `Hom` functor
preserves filtered colimits) iff it is finitely presented (Lazard 1969, Appendice; EGA IV₃, proof
of Lemme 8.5.2.1). -/
theorem isFinitelyPresentable_moduleCat_iff (R : Type u) [Ring R] (M : ModuleCat.{u} R) :
    IsFinitelyPresentable.{u} M ↔ Module.FinitePresentation R M := sorry

/-- README 1.6. The category of modules over a ring is locally finitely presentable. -/
theorem isLocallyFinitelyPresentable_moduleCat (R : Type u) [Ring R] :
    IsLocallyFinitelyPresentable.{u} (ModuleCat.{u} R) := sorry

/-- README 1.7. A small category is accessible iff its idempotents split (Tendas 2022,
Theorem 3.7, at `V = Set`). -/
theorem isAccessibleCategory_iff_isIdempotentComplete (C : Type w) [SmallCategory C] :
    IsAccessibleCategory.{w} C ↔ IsIdempotentComplete C := sorry

/-- README 1.7. A directed union of accessible full subcategories along accessible inclusions is
accessible, and so are the inclusions of the pieces (Paré–Rosický 2013, Theorem 2.1). -/
theorem isAccessibleCategory_of_directed {C : Type u} [Category.{v} C] {ι : Type w} [Preorder ι]
    [IsDirectedOrder ι] (P : ι → ObjectProperty C) (hP : Monotone P)
    (hacc : ∀ i, IsAccessibleCategory.{w} (P i).FullSubcategory)
    (hincl : ∀ ⦃i j : ι⦄ (h : i ≤ j), (ObjectProperty.ιOfLE (hP h)).IsAccessible.{w})
    (hcover : ∀ X : C, ∃ i, P i X) :
    IsAccessibleCategory.{w} C ∧ ∀ i, (P i).ι.IsAccessible.{w} := sorry

/-- README 1.8. A category and its opposite are both locally presentable iff the category is
equivalent to a small complete lattice (Gabriel–Ulmer 1971, Satz 7.13: such a category is a
preorder). -/
theorem isLocallyPresentable_and_op_iff (C : Type u) [Category.{v} C] :
    IsLocallyPresentable.{w} C ∧ IsLocallyPresentable.{w} Cᵒᵖ ↔
      ∃ (L : Type w) (_ : CompleteLattice L), Nonempty (C ≌ L) := sorry

/-! ## Layer 2: orthogonality classes -/

/-- README 2.1. A category is locally `κ`-presentable iff it is equivalent to the full
subcategory of `W`-local presheaves on a small category, for a small class `W` of maps between
`κ`-presentable presheaves (Adámek–Rosický, Theorem 1.46; Kelly, Theorems 6.5 and 6.11). -/
theorem isCardinalLocallyPresentable_iff_exists_isLocal (C : Type u) [Category.{v} C]
    (κ : Cardinal.{w}) [Fact κ.IsRegular] :
    IsCardinalLocallyPresentable C κ ↔
      ∃ (A : Type w) (_ : SmallCategory A) (W : MorphismProperty (Aᵒᵖ ⥤ Type w))
        (_ : MorphismProperty.IsSmall.{w} W),
        (∀ ⦃X Y : Aᵒᵖ ⥤ Type w⦄ (f : X ⟶ Y), W f →
          IsCardinalPresentable X κ ∧ IsCardinalPresentable Y κ) ∧
        Nonempty (C ≌ W.isLocal.FullSubcategory) := sorry

/-! ## Layer 3: Gabriel–Ulmer duality -/

/-- The models of `T` in `Type w`: the functors `T ⥤ Type w` preserving `κ`-small limits. -/
def cardinalContinuous (T : Type w) [SmallCategory T] (κ : Cardinal.{w}) :
    ObjectProperty (T ⥤ Type w) :=
  fun F ↦ PreservesCardinalSmallLimits F κ

/-- The category `Mod_κ T` of models of `T`. -/
abbrev Models (T : Type w) [SmallCategory T] (κ : Cardinal.{w}) : Type (w + 1) :=
  (cardinalContinuous T κ).FullSubcategory

/-- README 3.1. The models of a small `T` form a small-orthogonality class in `T ⥤ Type w`, for
maps between `κ`-presentable functors (Kelly, Theorem 6.11). -/
theorem exists_isLocal_eq_cardinalContinuous (T : Type w) [SmallCategory T]
    (κ : Cardinal.{w}) [Fact κ.IsRegular] :
    ∃ (W : MorphismProperty (T ⥤ Type w)) (_ : MorphismProperty.IsSmall.{w} W),
      (∀ ⦃X Y : T ⥤ Type w⦄ (f : X ⟶ Y), W f →
        IsCardinalPresentable X κ ∧ IsCardinalPresentable Y κ) ∧
      W.isLocal = cardinalContinuous T κ := sorry

/-- README 3.1. The models of a small `T` form a locally `κ`-presentable category (Kelly,
Theorem 6.11, for any small `T`; Lack–Rosický, Theorem 5.4, for `T` with `κ`-small limits). -/
theorem isCardinalLocallyPresentable_models (T : Type w) [SmallCategory T]
    (κ : Cardinal.{w}) [Fact κ.IsRegular] :
    IsCardinalLocallyPresentable (Models T κ) κ := sorry

/-- README 3.2. Gabriel–Ulmer: a category is locally `κ`-presentable iff it is equivalent to the
models of a small category with `κ`-small limits (Lack–Rosický, Theorem 5.4; Adámek–Rosický,
Theorem 1.46). -/
theorem isCardinalLocallyPresentable_iff_exists_models (C : Type u) [Category.{v} C]
    (κ : Cardinal.{w}) [Fact κ.IsRegular] :
    IsCardinalLocallyPresentable C κ ↔
      ∃ (T : Type w) (_ : SmallCategory T),
        HasCardinalSmallLimits T κ ∧ Nonempty (C ≌ Models T κ) := sorry

/-- README 3.3. For `T` with `κ`-small limits, the `κ`-presentable models are the corepresentable
ones, and they form a category equivalent to `Tᵒᵖ`. -/
theorem nonempty_isCardinalPresentable_models_equivalence (T : Type w) [SmallCategory T]
    (κ : Cardinal.{w}) [Fact κ.IsRegular] (hT : HasCardinalSmallLimits T κ) :
    Nonempty ((isCardinalPresentable (Models T κ) κ).FullSubcategory ≌ Tᵒᵖ) := sorry

/-- The algebraic functor `G^* : Mod_κ T' ⥤ Mod_κ T`, restriction along a morphism of theories
`G : T ⥤ T'`. -/
def restrict {T T' : Type w} [SmallCategory T] [SmallCategory T'] {κ : Cardinal.{w}}
    (G : T ⥤ T') (hG : PreservesCardinalSmallLimits G κ) : Models T' κ ⥤ Models T κ :=
  (cardinalContinuous T κ).lift
    ((cardinalContinuous T' κ).ι ⋙ (Functor.whiskeringLeft T T' (Type w)).obj G)
    (fun M J _ hJ ↦ by
      have := hG J hJ
      have := M.property J hJ
      exact comp_preservesLimitsOfShape G M.obj)

/-- README 3.4. An algebraic functor is a `κ`-accessible right adjoint: its left adjoint is left
Kan extension followed by the reflection of Kelly, Theorem 6.11 (Lack–Rosický, §5.2, for `T` and
`T'` with `κ`-small limits). -/
theorem restrict_isRightAdjoint {T T' : Type w} [SmallCategory T] [SmallCategory T']
    {κ : Cardinal.{w}} [Fact κ.IsRegular] (G : T ⥤ T') (hG : PreservesCardinalSmallLimits G κ) :
    (restrict G hG).IsRightAdjoint ∧ (restrict G hG).IsCardinalAccessible κ := sorry

/-- README 3.4. Between categories of models of theories with `κ`-small limits, every
`κ`-accessible right adjoint is isomorphic to an algebraic functor. -/
theorem exists_iso_restrict {T T' : Type w} [SmallCategory T] [SmallCategory T']
    {κ : Cardinal.{w}} [Fact κ.IsRegular] (hT : HasCardinalSmallLimits T κ)
    (hT' : HasCardinalSmallLimits T' κ) (U : Models T' κ ⥤ Models T κ) [U.IsRightAdjoint]
    [U.IsCardinalAccessible κ] :
    ∃ (G : T ⥤ T') (hG : PreservesCardinalSmallLimits G κ), Nonempty (U ≅ restrict G hG) :=
  sorry

/-! ## Layer 4: algebraic theories -/

/-- The algebras of `T`: functors `T ⥤ Type w` preserving finite products. -/
def productPreserving (T : Type w) [SmallCategory T] : ObjectProperty (T ⥤ Type w) :=
  fun F ↦ PreservesFiniteProducts F

/-- The category `Alg T` of algebras of `T`. -/
abbrev Algebras (T : Type w) [SmallCategory T] : Type (w + 1) :=
  (productPreserving T).FullSubcategory

/-- README 4.1. The algebras of a small `T` form a locally finitely presentable category. -/
theorem isLocallyFinitelyPresentable_algebras (T : Type w) [SmallCategory T] :
    IsLocallyFinitelyPresentable.{w} (Algebras T) := sorry

/-- README 4.2. Sifted colimits of algebras are computed in `T ⥤ Type w` (Adámek–Rosický 2001,
sifted colimits commute with finite products in sets). -/
theorem preservesColimitsOfShape_algebras_ι (T : Type w) [SmallCategory T] (J : Type w)
    [SmallCategory J] [IsSifted J] :
    PreservesColimitsOfShape J (productPreserving T).ι := sorry

/-- An object is strongly finitely presentable when its corepresentable functor preserves sifted
colimits. -/
def IsStronglyFinitelyPresentable {K : Type u} [Category.{w} K] (X : K) : Prop :=
  ∀ (J : Type w) [SmallCategory J] [IsSifted J], PreservesColimitsOfShape J (coyoneda.obj (op X))

/-- README 4.3. A category is equivalent to the algebras of a small category with finite
products iff it is cocomplete and every object is a sifted colimit of objects of a small family
of strongly finitely presentable objects (Lack–Rosický, Theorem 3.1). -/
theorem exists_equivalence_algebras_iff (K : Type u) [Category.{w} K] :
    (∃ (T : Type w) (_ : SmallCategory T) (_ : HasFiniteProducts T),
        Nonempty (K ≌ Algebras T)) ↔
      HasColimitsOfSize.{w, w} K ∧
        ∃ (P : ObjectProperty K), ObjectProperty.Small.{w} P ∧
          (∀ X, P X → IsStronglyFinitelyPresentable X) ∧
          ∀ X, ∃ (J : Type w) (_ : SmallCategory J) (_ : IsSifted J), P.colimitsOfShape J X :=
  sorry

section InitialChain

variable {C : Type u} [Category.{v} C] [HasInitial C] (F : C ⥤ C)

/-- The objects `Fⁿ 0` of the initial chain of `F` (README 4.4). -/
noncomputable def initialChainObj : ℕ → C
  | 0 => ⊥_ C
  | n + 1 => F.obj (initialChainObj n)

/-- The maps `Fⁿ 0 ⟶ Fⁿ⁺¹ 0` of the initial chain: `initial.to` first, then `F.map` of the previous
map (README 4.4). -/
noncomputable def initialChainMap : (n : ℕ) → initialChainObj F n ⟶ initialChainObj F (n + 1)
  | 0 => initial.to _
  | n + 1 => F.map (initialChainMap n)

/-- The initial chain `0 ⟶ F 0 ⟶ F² 0 ⟶ ⋯` of an endofunctor (README 4.4). -/
noncomputable def initialChain : ℕ ⥤ C :=
  Functor.ofSequence (initialChainMap F)

/-- README 4.4. If `F` preserves the colimit of its initial chain, that colimit carries an initial
`F`-algebra structure (Adámek 1974, §I, p. 592, at the initial object). -/
theorem exists_isInitial_algebra_colimit_initialChain [HasColimit (initialChain F)]
    [PreservesColimit (initialChain F) F] :
    ∃ str : F.obj (colimit (initialChain F)) ⟶ colimit (initialChain F),
      Nonempty (IsInitial (Endofunctor.Algebra.mk (colimit (initialChain F)) str)) :=
  sorry

end InitialChain

/-- README 4.4. Every accessible endofunctor of a locally presentable category has an initial
algebra (Adámek 1974, §I, p. 592: the free-algebra construction over the initial object stops). -/
theorem hasInitial_algebra_of_isAccessible {C : Type u} [Category.{v} C]
    [IsLocallyPresentable.{w} C] (F : C ⥤ C) [F.IsAccessible.{w}] :
    HasInitial (Endofunctor.Algebra F) := sorry

/-! ## Layer 5: categories with `D`-limits -/

section DLimits

variable {α : Type w} (D : α → Type w) [∀ a, SmallCategory (D a)]

/-- A category has `D`-limits: limits of every shape `D a`. -/
def HasDLimits (X : Type u) [Category.{v} X] : Prop :=
  ∀ a, HasLimitsOfShape (D a) X

/-- A functor is a `D`-functor: it preserves limits of every shape `D a`. -/
def PreservesDLimits {X : Type u} [Category.{v} X] {Y : Type u'} [Category.{v'} Y]
    (F : X ⥤ Y) : Prop :=
  ∀ a, PreservesLimitsOfShape (D a) F

/-- The `D`-functors `X ⥤ Y`, as a property of objects of the functor category. -/
def dContinuous (X : Type u) [Category.{v} X] (Y : Type u') [Category.{v'} Y] :
    ObjectProperty (X ⥤ Y) :=
  fun F ↦ PreservesDLimits D F

/-- README 5.1. The models in `Type w` of a small `R` (its `D`-functors to `Type w`) form a
reflective, locally presentable subcategory of `R ⥤ Type w` (Kelly, Theorem 6.11). -/
theorem isRightAdjoint_ι_dModels (R : Type w) [SmallCategory R] :
    (dContinuous D R (Type w)).ι.IsRightAdjoint ∧
      IsLocallyPresentable.{w} (dContinuous D R (Type w)).FullSubcategory := sorry

/-- The `D`-envelope of a small `I`: the closure under `D`-limits, in `(I ⥤ Type w)ᵒᵖ`, of the
corepresentable functors. -/
def envelopeProp (I : Type w) [SmallCategory I] : ObjectProperty (I ⥤ Type w)ᵒᵖ :=
  (ObjectProperty.ofObj (fun i : I ↦ coyoneda.rightOp.obj i)).limitsClosure D

/-- The `D`-envelope `Ĩ` as a category. -/
abbrev Envelope (I : Type w) [SmallCategory I] : Type (w + 1) :=
  (envelopeProp D I).FullSubcategory

/-- The canonical functor `j : I ⥤ Ĩ`. -/
def Envelope.of (I : Type w) [SmallCategory I] : I ⥤ Envelope D I :=
  (envelopeProp D I).lift coyoneda.rightOp
    (fun i ↦ ObjectProperty.le_limitsClosure _ _ _ (ObjectProperty.ofObj_apply _ i))

/-- Restriction along `j : I ⥤ Ĩ`, from the `D`-functors `Ĩ ⥤ C` to all functors `I ⥤ C`. -/
def Envelope.restriction (I : Type w) [SmallCategory I] (C : Type u) [Category.{v} C] :
    (dContinuous D (Envelope D I) C).FullSubcategory ⥤ (I ⥤ C) :=
  (dContinuous D (Envelope D I) C).ι ⋙
    (Functor.whiskeringLeft I (Envelope D I) C).obj (Envelope.of D I)

/-- README 5.2. The `D`-envelope is essentially small, has `D`-limits, and restriction along
`j` is an equivalence from `D`-functors `Ĩ ⥤ C` to functors `I ⥤ C` for every `C` with
`D`-limits and `w`-small hom-sets (essential smallness by Mathlib's
`ObjectProperty.isEssentiallySmall_limitsClosure`; the universal property is Kelly, Theorem 5.35,
dualised). -/
theorem envelope_universal (I : Type w) [SmallCategory I] :
    EssentiallySmall.{w} (Envelope D I) ∧ HasDLimits D (Envelope D I) ∧
      ∀ (C : Type u) [Category.{w} C], HasDLimits D C →
        (Envelope.restriction D I C).IsEquivalence := sorry

/-- The `D`-functors `R ⥤ C` inverting every arrow of `S`. -/
def dContinuousInverting {R : Type w} [SmallCategory R] (S : MorphismProperty R)
    (C : Type u) [Category.{v} C] : ObjectProperty (R ⥤ C) :=
  fun F ↦ PreservesDLimits D F ∧ S.IsInvertedBy F

/-- Restriction along a `D`-functor `q : R ⥤ R'` inverting `S`, from `D`-functors `R' ⥤ C` to
`D`-functors `R ⥤ C` inverting `S`. -/
def restrictInverting {R R' : Type w} [SmallCategory R] [SmallCategory R']
    {S : MorphismProperty R} (q : R ⥤ R') (hq : PreservesDLimits D q) (hS : S.IsInvertedBy q)
    (C : Type u) [Category.{v} C] :
    (dContinuous D R' C).FullSubcategory ⥤ (dContinuousInverting D S C).FullSubcategory :=
  (dContinuousInverting D S C).lift
    ((dContinuous D R' C).ι ⋙ (Functor.whiskeringLeft R R' C).obj q)
    (fun F ↦ ⟨fun a ↦ by
      have := hq a
      have := F.property a
      exact comp_preservesLimitsOfShape q F.obj,
      fun _ _ f hf ↦ by
        have := hS f hf
        exact (inferInstance : IsIso (F.obj.map (q.map f)))⟩)

/-- README 5.3. Localisation in the 2-category of categories with `D`-limits: for a small `R`
and a set `S` of its arrows there is a small `R[S⁻¹]` with `D`-limits and a
`D`-functor `q : R ⥤ R[S⁻¹]` inverting `S`, such that restriction along `q` is an equivalence
onto the `D`-functors inverting `S`, into every category with `D`-limits (Kelly, Theorem 6.23,
dualised). -/
theorem exists_localization (R : Type w) [SmallCategory R] (S : MorphismProperty R) :
    ∃ (R' : Type w) (_ : SmallCategory R') (q : R ⥤ R') (hq : PreservesDLimits D q)
      (hS : S.IsInvertedBy q), HasDLimits D R' ∧
      ∀ (C : Type u) [Category.{w} C], HasDLimits D C →
        (restrictInverting D q hq hS C).IsEquivalence := sorry

/-- A functor `i : I → R` generates `R` under `D`-limits: the closure of its image under limits of
the shapes `D a` is all of `R` (README 5.5). -/
def Generates {R : Type u} [Category.{v} R] {I : Type w} (i : I → R) : Prop :=
  (ObjectProperty.ofObj i).limitsClosure D = ⊤

/-- README 5.5. In a category with `D`-limits, `i` generates iff every fully faithful `D`-functor
through whose essential image `i` passes is essentially surjective. -/
theorem generates_iff_essSurj {R : Type u} [Category.{v} R] (hR : HasDLimits D R) {I : Type w}
    (i : I → R) :
    Generates D i ↔
      ∀ (B : Type u) [Category.{v} B] (F : B ⥤ R) [F.Full] [F.Faithful], HasDLimits D B →
        PreservesDLimits D F → (∀ x, ∃ b, Nonempty (F.obj b ≅ i x)) → F.EssSurj := sorry

end DLimits

end TauCetiRoadmap.LocallyPresentableCategories

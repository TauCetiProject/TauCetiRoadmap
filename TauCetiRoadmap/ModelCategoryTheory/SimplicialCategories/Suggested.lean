module

public import Mathlib
public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence
public import TauCeti.AlgebraicTopology.SimplicialObject.Bisimplicial
public import TauCeti.AlgebraicTopology.SimplicialCategory.HomotopyCategory
public import TauCeti.CategoryTheory.Enriched.EnrichedCat
public import TauCeti.CategoryTheory.Enriched.NaturalTransformation

/-!
# Simplicial model categories, enriched diagrams and the Bergner model structure: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, with the few definitions their statements need.

The weak equivalences of simplicial sets are Tau Ceti's weak homotopy equivalences
`SSet.IsWeakHomotopyEquivalence`, as in Part KanQuillen; the cofibrations are the monomorphisms
and the fibrations Mathlib's scoped Kan fibrations. Nothing here uses the realization-based scoped
class `weakEquivalences SSet`. `IsWeaklySaturated`, `weakSaturation`, `IsCombinatorial` and
`IsLeftProper` are Part ModelCategories' definitions and `weakHomotopyEquivalences` is Part KanQuillen's, restated
with the same bodies for the statements below. A theorem asserting that a model structure exists
says that some term `M : ModelCategory A` has the prescribed classes.

The model structure on `Cat_S` is stated on Tau Ceti's category `CategoryTheory.EnrichedCat.category`
of `S`-enriched categories, with the `hS`-enriched homotopy category built from Mathlib's
`LocalizedMonoidal` and `TransportEnrichment`; Bergner's case S = simplicial sets is stated again
with Tau Ceti's `SimplicialHomotopyCategory`. The enriched diagram structures are stated for
S = A = simplicial sets on `SSetDiagram C`, a type synonym of `EnrichedFunctor SSet C SSet` whose
morphisms are Tau Ceti's enriched natural transformations `TauCeti.UnitGradedNatTrans`.

Not statable at the pins:
* the invertibility hypothesis and excellence (§5.6) for a general `S`, and with them the fibrant
  objects and fibrations of `Cat_S` for an excellent `S` (§5.8): they need the `S`-enriched
  categories `[1]_S` and `[1]^∼_S` for a general `S` (mapping objects `𝟙_S` and an initial object,
  with their composition laws), which are not in Mathlib or Tau Ceti; for S simplicial sets the
  invertibility hypothesis, the one nontrivial axiom of the excellence of simplicial sets (§5.7),
  and the fibrant objects and fibrations (§5.8) are stated below, with `[1]_S` and `[1]^∼_S` built
  as categories with discrete mapping simplicial sets;
* simplicial and enriched model categories (§1.3), the recognition theorem (§1.4), enriched
  Quillen equivalences (§5.9) and the enriched diagram structures (§6.1, §6.3) for general `S` and
  `A`: they need tensored and cotensored enriched categories, which are not in Mathlib or Tau Ceti
  (the case S = A = simplicial sets is stated below).

Statable but not stated, as they are not headlines: the Quillen adjunctions of restriction functors
(§3.1) and of realization (§4.4), with Part ModelCategories' `IsQuillenAdjunction` restated. §6.3 is
stated as an equivalence of localizations.
-/

public section

open CategoryTheory Limits HomotopicalAlgebra MorphismProperty Simplicial

namespace TauCetiRoadmap.ModelCategoryTheory.SimplicialCategories

/-! ## Layer 1: Monoidal and enriched model categories -/

section Bifunctor

universe v₁ v₂ v₃ u₁ u₂ u₃

variable {C₁ : Type u₁} {C₂ : Type u₂} {C₃ : Type u₃}
  [Category.{v₁} C₁] [Category.{v₂} C₂] [Category.{v₃} C₃]

/-- A bifunctor `F : C₁ ⥤ C₂ ⥤ C₃` is a left Quillen bifunctor for classes of cofibrations
`cof₁, cof₂, cof₃` and of weak equivalences `W₁, W₂, W₃` when it preserves small colimits in each
variable separately and the pushout-product of two cofibrations is a cofibration, which is a weak
equivalence when either factor is one. (HTT, Def. A.3.1.1.) -/
structure IsLeftQuillenBifunctor (F : C₁ ⥤ C₂ ⥤ C₃) (cof₁ W₁ : MorphismProperty C₁)
    (cof₂ W₂ : MorphismProperty C₂) (cof₃ W₃ : MorphismProperty C₃) : Prop where
  /-- `F` preserves small colimits in the second variable. -/
  preservesColimits_obj (X : C₁) : PreservesColimits (F.obj X)
  /-- `F` preserves small colimits in the first variable. -/
  preservesColimits_flip_obj (Y : C₂) : PreservesColimits (F.flip.obj Y)
  /-- The pushout-product of two cofibrations is a cofibration. -/
  cof_ι {X₁ Y₁ : C₁} {X₂ Y₂ : C₂} (f₁ : X₁ ⟶ Y₁) (f₂ : X₂ ⟶ Y₂) (h₁ : cof₁ f₁) (h₂ : cof₂ f₂)
    (sq : F.PushoutObjObj f₁ f₂) : cof₃ sq.ι
  /-- The pushout-product is a weak equivalence when the first factor is a trivial
  cofibration. -/
  W_ι_left {X₁ Y₁ : C₁} {X₂ Y₂ : C₂} (f₁ : X₁ ⟶ Y₁) (f₂ : X₂ ⟶ Y₂) (h₁ : cof₁ f₁) (w₁ : W₁ f₁)
    (h₂ : cof₂ f₂) (sq : F.PushoutObjObj f₁ f₂) : W₃ sq.ι
  /-- The pushout-product is a weak equivalence when the second factor is a trivial
  cofibration. -/
  W_ι_right {X₁ Y₁ : C₁} {X₂ Y₂ : C₂} (f₁ : X₁ ⟶ Y₁) (f₂ : X₂ ⟶ Y₂) (h₁ : cof₁ f₁)
    (h₂ : cof₂ f₂) (w₂ : W₂ f₂) (sq : F.PushoutObjObj f₁ f₂) : W₃ sq.ι

end Bifunctor

section SSet

universe u

/-- The weak homotopy equivalences, as a class of morphisms: Tau Ceti's
`SSet.IsWeakHomotopyEquivalence` (Kerodon, Definition 3.1.7.12). -/
def weakHomotopyEquivalences : MorphismProperty SSet.{u} :=
  fun _ _ f ↦ SSet.IsWeakHomotopyEquivalence f

/-- The Cartesian product of simplicial sets is a left Quillen bifunctor for the monomorphisms and
the weak homotopy equivalences. (HTT, Example A.3.1.4.) -/
theorem isLeftQuillenBifunctor_curriedTensor_sSet :
    IsLeftQuillenBifunctor (MonoidalCategory.curriedTensor SSet.{u})
      (monomorphisms _) weakHomotopyEquivalences (monomorphisms _) weakHomotopyEquivalences
      (monomorphisms _) weakHomotopyEquivalences := by
  sorry

end SSet

/-! ## Layer 2: Objectwise generation and the injective model structure -/

section Saturation

universe w v u

variable {C : Type u} [Category.{v} C]

/-- A class of morphisms is weakly saturated when it is stable under cobase change, under
transfinite composition indexed by well-ordered types in `Type w`, and under retracts.
(HTT, Def. A.1.2.2.) -/
def IsWeaklySaturated (S : MorphismProperty C) : Prop :=
  S.IsStableUnderCobaseChange ∧ S.IsStableUnderTransfiniteComposition.{w} ∧
    S.IsStableUnderRetracts

/-- The weakly saturated class generated by `S`: the intersection of all weakly saturated
classes containing `S`. (HTT, Rem. A.1.2.4.) -/
def weakSaturation (S : MorphismProperty C) : MorphismProperty C :=
  ⨅ (T : MorphismProperty C) (_ : S ≤ T) (_ : IsWeaklySaturated.{w} T), T

variable (C) in
/-- A model category is combinatorial when it is locally presentable and its cofibrations and
trivial cofibrations are generated, as weakly saturated classes, by small sets.
(HTT, Def. A.2.6.1.) -/
def IsCombinatorial [ModelCategory C] : Prop :=
  IsLocallyPresentable.{w} C ∧
    (∃ I : MorphismProperty C, I.IsSmall.{w} ∧ cofibrations C = weakSaturation.{w} I) ∧
    ∃ J : MorphismProperty C, J.IsSmall.{w} ∧ trivialCofibrations C = weakSaturation.{w} J

variable (C) [ModelCategory C] in
/-- A model category is left proper when weak equivalences are preserved by pushout along
cofibrations. (HTT, Def. A.2.4.1.) -/
def IsLeftProper : Prop :=
  ∀ ⦃A B A' B' : C⦄ (i : A ⟶ B) (j : A ⟶ A') (j' : B ⟶ B') (i' : A' ⟶ B'),
    IsPushout i j j' i' → Cofibration i → WeakEquivalence j → WeakEquivalence j'

end Saturation

section Diagrams

universe w u

variable {A : Type u} [Category.{w} A] (J : Type w) [SmallCategory J]

/-- In a locally presentable category, the maps of `J ⥤ A` that lie objectwise in the weakly
saturated class generated by a small set `S₀` form the weakly saturated class generated by a small
set of maps of `J ⥤ A`. (HTT, Lemma A.2.8.3.) -/
theorem exists_isSmall_weakSaturation_eq_functorCategory [IsLocallyPresentable.{w} A]
    (S₀ : MorphismProperty A) [S₀.IsSmall.{w}] :
    ∃ S : MorphismProperty (J ⥤ A), S.IsSmall.{w} ∧
      weakSaturation.{w} S = (weakSaturation.{w} S₀).functorCategory J := by
  sorry

/-- For a combinatorial model category `A` and a small category `J`, the functor category
`J ⥤ A` carries a combinatorial model structure whose weak equivalences and cofibrations are the
objectwise ones (the injective model structure). (HTT, Prop. A.2.8.2.) -/
theorem exists_injectiveModelCategory [ModelCategory A] (hA : IsCombinatorial.{w} A) :
    ∃ M : ModelCategory (J ⥤ A),
      @weakEquivalences (J ⥤ A) _ M.categoryWithWeakEquivalences =
          (weakEquivalences A).functorCategory J ∧
        @cofibrations (J ⥤ A) _ M.categoryWithCofibrations =
          (cofibrations A).functorCategory J ∧
        @IsCombinatorial.{w} (J ⥤ A) _ M := by
  sorry

end Diagrams

/-! ## Layer 4: Reedy diagrams, coends and realization -/

section Diagonal

universe u

/-- A map of bisimplicial sets that is a weak homotopy equivalence in every simplicial degree
induces a weak homotopy equivalence of diagonals. (Goerss–Jardine, Prop. IV.1.7.) -/
theorem isWeakHomotopyEquivalence_diag_map
    {X Y : SimplicialObject (SimplicialObject (Type u))} (f : X ⟶ Y)
    (hf : ∀ n, SSet.IsWeakHomotopyEquivalence (X := X.obj n) (Y := Y.obj n) (f.app n)) :
    SSet.IsWeakHomotopyEquivalence ((SimplicialObject.diag (Type u)).map f) := by
  sorry

end Diagonal

/-! ## Layer 5: The model structure on S-enriched categories -/

section EnrichedCat

universe u

variable (S : Type (u + 1)) [Category.{u} S] [MonoidalCategory S] [ModelCategory S]
  [(weakEquivalences S).IsMonoidal]

/-- The homotopy category `hS` of a monoidal model category `S` with the localized monoidal
structure. It needs the weak equivalences to be stable under tensoring with an object, which holds
when every object is cofibrant and the tensor product is a left Quillen bifunctor. -/
abbrev HomotopyMonoidal : Type (u + 1) :=
  LocalizedMonoidal (weakEquivalences S).Q (weakEquivalences S) (Iso.refl _)

/-- The `hS`-enriched homotopy category `hC` of an `S`-enriched category `C`: change of enrichment
along the monoidal localization functor `S ⥤ hS`. (HTT, Rem. A.1.4.3.) -/
abbrev EnrichedHomotopyCategory (C : Type u) [EnrichedCategory S C] : Type u :=
  TransportEnrichment
    (Localization.Monoidal.toMonoidalCategory (weakEquivalences S).Q (weakEquivalences S)
      (Iso.refl _)) C

variable {S} in
/-- An `S`-enriched functor is a weak equivalence when it is a weak equivalence of `S` on every
mapping object and every object of the target is isomorphic, in the underlying category of its
`hS`-enriched homotopy category, to an object in the image. (HTT, Def. A.3.2.1.) -/
def IsEnrichedWeakEquivalence {C D : Type u} [EnrichedCategory S C] [EnrichedCategory S D]
    (F : EnrichedFunctor S C D) : Prop :=
  (∀ X Y : C, weakEquivalences S (F.map X Y)) ∧
    ∀ Y : D, ∃ X : C, Nonempty
      (ForgetEnrichment.of (HomotopyMonoidal S) (show EnrichedHomotopyCategory S D from F.obj X) ≅
        ForgetEnrichment.of (HomotopyMonoidal S) (show EnrichedHomotopyCategory S D from Y))

/-- The weak equivalences of `Cat_S`, as a class of morphisms. -/
def enrichedWeakEquivalences : MorphismProperty (EnrichedCat.{u, u + 1, u} S) :=
  fun _ _ F ↦ IsEnrichedWeakEquivalence F

/-- The trivial fibrations of `Cat_S`: `S`-enriched functors that are surjective on objects and
trivial fibrations of `S` on every mapping object, the right lifting class of `C₀`.
(HTT, Prop. A.3.2.4, proof.) -/
def enrichedTrivialFibrations : MorphismProperty (EnrichedCat.{u, u + 1, u} S) :=
  fun C _ F ↦ Function.Surjective F.obj ∧ ∀ X Y : C, trivialFibrations S (F.map X Y)

/-- For a combinatorial monoidal model category `S` in which every object is cofibrant and weak
equivalences are stable under filtered colimits, the category `Cat_S` of small `S`-enriched
categories carries a left proper combinatorial model structure whose weak equivalences are those of
HTT, Def. A.3.2.1, and whose cofibrations are the maps with the left lifting property against the
functors surjective on objects and trivial fibrations on mapping objects. Closedness of the monoidal
structure on both sides follows from the colimit clause of the bifunctor condition and
presentability, and the monoidality of the weak equivalences from the other hypotheses.
(HTT, Prop. A.3.2.4.) -/
theorem exists_enrichedCatModelCategory (hS : IsCombinatorial.{u} S)
    (hT : IsLeftQuillenBifunctor (MonoidalCategory.curriedTensor S) (cofibrations S)
      (weakEquivalences S) (cofibrations S) (weakEquivalences S) (cofibrations S)
      (weakEquivalences S))
    (hcof : ∀ X : S, IsCofibrant X)
    [(weakEquivalences S).IsStableUnderFilteredColimits.{u, u}] :
    ∃ M : ModelCategory (EnrichedCat.{u, u + 1, u} S),
      @weakEquivalences _ _ M.categoryWithWeakEquivalences = enrichedWeakEquivalences S ∧
        @cofibrations _ _ M.categoryWithCofibrations = (enrichedTrivialFibrations S).llp ∧
        @IsCombinatorial.{u} _ _ M ∧ @IsLeftProper _ _ M := by
  sorry

end EnrichedCat

section Bergner

universe u

/-- A simplicial functor is a Dwyer–Kan equivalence when it is a weak homotopy equivalence on every
mapping simplicial set and essentially surjective on homotopy categories. These are the weak
equivalences of HTT, Def. A.3.2.1, for S simplicial sets. -/
def IsCombinatorialDwyerKanEquivalence {C D : Type u} [EnrichedCategory SSet.{u} C] [EnrichedCategory SSet.{u} D]
    (F : EnrichedFunctor SSet.{u} C D) : Prop :=
  (∀ X Y : C, SSet.IsWeakHomotopyEquivalence (F.map X Y)) ∧ F.mapHomotopyCategory.EssSurj

/-- The Dwyer–Kan equivalences, as a class of morphisms of simplicial categories. -/
def combinatorialDwyerKanEquivalences : MorphismProperty (EnrichedCat.{u, u + 1, u} SSet.{u}) :=
  fun _ _ F ↦ IsCombinatorialDwyerKanEquivalence F

/-- The trivial fibrations of Bergner's model structure: simplicial functors that are surjective on
objects and trivial Kan fibrations (right lifting against monomorphisms) on every mapping simplicial
set. Their left lifting class is the class of cofibrations. (HTT, Prop. A.3.2.4, proof.) -/
def bergnerTrivialFibrations : MorphismProperty (EnrichedCat.{u, u + 1, u} SSet.{u}) :=
  fun C _ F ↦ Function.Surjective F.obj ∧
    ∀ X Y : C, (monomorphisms SSet.{u}).rlp (F.map X Y)

/-- A simplicial category is locally Kan when every mapping simplicial set is a Kan complex.
(HTT, Def. A.3.2.9.) -/
def IsLocallyKan (C : EnrichedCat.{u, u + 1, u} SSet.{u}) : Prop :=
  ∀ X Y : C, SSet.KanComplex (X ⟶[SSet.{u}] Y)

/-- Bergner's model structure: the category of small simplicial categories carries a left proper
combinatorial model structure whose weak equivalences are the Dwyer–Kan equivalences and whose
cofibrations are the maps with the left lifting property against the functors surjective on objects
and trivial fibrations on mapping simplicial sets. (HTT, Prop. A.3.2.4 with Ex. A.3.2.18; for the
existence of the model structure, Bergner, Thm. 1.1.) -/
theorem exists_bergnerModelCategory :
    ∃ M : ModelCategory (EnrichedCat.{u, u + 1, u} SSet.{u}),
      @weakEquivalences _ _ M.categoryWithWeakEquivalences = combinatorialDwyerKanEquivalences ∧
        @cofibrations _ _ M.categoryWithCofibrations = bergnerTrivialFibrations.llp ∧
        @IsCombinatorial.{u} _ _ M ∧ @IsLeftProper _ _ M := by
  sorry

/-! ### Simplicial sets are excellent (§5.6–§5.7) -/

/-- The constant simplicial set on a type. -/
@[expose] noncomputable def constSSet : Type u ⥤ SSet.{u} := Functor.const SimplexCategoryᵒᵖ

/-- The constant functor is right adjoint to the colimit functor. -/
noncomputable instance : constSSet.{u}.IsRightAdjoint :=
  (colimConstAdj (J := SimplexCategoryᵒᵖ) (C := Type u)).isRightAdjoint

/-- The constant functor preserves finite products, hence is monoidal for the Cartesian monoidal
structures. -/
noncomputable instance : constSSet.{u}.Monoidal :=
  Functor.Monoidal.ofChosenFiniteProducts constSSet

/-- An ordinary category `D` as a simplicial category with discrete mapping simplicial sets: the
enrichment in types transported along the constant simplicial set functor. -/
@[expose] def DiscreteEnrichment (D : Type u) [Category.{u} D] : Type u :=
  TransportEnrichment constSSet.{u} D

/-- The simplicial enrichment of `DiscreteEnrichment D`, with `Map(X, Y)` the constant simplicial
set on `X ⟶ Y`. -/
noncomputable instance (D : Type u) [Category.{u} D] :
    EnrichedCategory SSet.{u} (DiscreteEnrichment D) :=
  @instEnrichedCategoryTransportEnrichment (Type u) _ _ D (enrichedCategoryTypeOfCategory D)
    SSet.{u} _ _ constSSet.{u} _

/-- The simplicial category `[1]_S` for S simplicial sets: objects `0` and `1`, with `Map(0, 1)`
and the endomorphism objects a point and `Map(1, 0)` empty. (HTT, the notation after
Rem. A.3.2.3, p. 876.) -/
@[expose] noncomputable def interval : EnrichedCat.{u, u + 1, u} SSet.{u} :=
  EnrichedCat.of SSet.{u} (DiscreteEnrichment (ULift.{u} (Fin 2)))

/-- The simplicial category `[1]^∼_S` for S simplicial sets: objects `0` and `1`, with every
mapping simplicial set a point. (HTT, Notation A.3.2.11.) -/
@[expose] noncomputable def invertibleInterval : EnrichedCat.{u, u + 1, u} SSet.{u} :=
  EnrichedCat.of SSet.{u} (DiscreteEnrichment (ULiftHom.{u} (Codiscrete (ULift.{u} (Fin 2)))))

/-- The simplicial functor `[1]_S ⟶ [1]^∼_S`, the identity on objects. -/
noncomputable def interval.toInvertible : interval.{u} ⟶ invertibleInterval.{u} where
  obj x := ULiftHom.objUp.{u, u} (Codiscrete.mk (x : ULift.{u} (Fin 2)))
  map _ _ := constSSet.map (TypeCat.ofHom fun _ ↦ ULift.up ⟨⟩)
  map_id _ := by
    ext n x
    exact Subsingleton.elim (α := ULift.{u} Unit) _ _
  map_comp _ _ _ := by
    ext n x
    exact Subsingleton.elim (α := ULift.{u} Unit) _ _

/-- The object 0 of `[1]_S`. -/
@[expose] def interval.zero : interval.{u} := ULift.up 0

/-- The object 1 of `[1]_S`. -/
@[expose] def interval.one : interval.{u} := ULift.up 1

/-- The morphism `0 ⟶ 1` of `[1]_S`, as a vertex of its mapping simplicial set. -/
noncomputable def interval.arrow :
    (interval.zero.{u} ⟶[SSet.{u}] interval.one.{u}) _⦋0⦌ :=
  homOfLE (show (ULift.up 0 : ULift.{u} (Fin 2)) ≤ ULift.up 1 from Fin.zero_le _)

/-- Simplicial sets satisfy the invertibility hypothesis, the one nontrivial axiom of
excellence: let `i : [1]_S ⟶ C` be a cofibration of simplicial categories classifying a morphism
`f` of `C` that is invertible in the homotopy category of `C`; then in a pushout of
`[1]_S ⟶ [1]^∼_S` along `i`, the map `C ⟶ C⟨f⁻¹⟩` is a Dwyer–Kan equivalence. Together with
§1.2.3 and the Kan–Quillen model structure this says that simplicial sets are an excellent model
category. (HTT, Def. A.3.2.12 and Ex. A.3.2.18; Dwyer–Kan, *Simplicial localizations of
categories*.) -/
theorem combinatorialDwyerKanEquivalences_of_isPushout_interval_toInvertible
    {C P : EnrichedCat.{u, u + 1, u} SSet.{u}} (i : interval.{u} ⟶ C)
    (hi : bergnerTrivialFibrations.llp i)
    (hf : IsIso (TauCeti.SimplicialHomotopyCategory.homMk
      ((i.map interval.zero interval.one).app (Opposite.op ⦋0⦌) interval.arrow)))
    {j : C ⟶ P} {k : invertibleInterval.{u} ⟶ P} (h : IsPushout i interval.toInvertible j k) :
    combinatorialDwyerKanEquivalences j := by
  sorry

/-- In Bergner's model structure a simplicial category is fibrant exactly when it is locally Kan.
(HTT, Thm. A.3.2.24 (1) with Ex. A.3.2.18.) -/
theorem isFibrant_iff_isLocallyKan [ModelCategory (EnrichedCat.{u, u + 1, u} SSet.{u})]
    (hW : weakEquivalences (EnrichedCat.{u, u + 1, u} SSet.{u}) = combinatorialDwyerKanEquivalences)
    (hC : cofibrations (EnrichedCat.{u, u + 1, u} SSet.{u}) = bergnerTrivialFibrations.llp)
    (C : EnrichedCat.{u, u + 1, u} SSet.{u}) : IsFibrant C ↔ IsLocallyKan C := by
  sorry

/-- A functor of ordinary categories is a quasi-fibration when every isomorphism `F.obj X ≅ Y` of
the target lifts to an isomorphism `X ≅ Y'` of the source mapped by `F` onto it, target included.
(HTT, Def. A.3.2.7.) -/
def IsQuasiFibration {C : Type*} {D : Type*} [Category C] [Category D] (F : C ⥤ D) : Prop :=
  ∀ (X : C) (Y : D) (e : F.obj X ≅ Y), ∃ (Y' : C) (e' : X ≅ Y'),
    CategoryTheory.Arrow.mk (F.map e'.hom) = CategoryTheory.Arrow.mk e.hom

open scoped SSet.modelCategoryQuillen in
/-- In Bergner's model structure a simplicial functor is a fibration exactly when it is a Kan
fibration on every mapping simplicial set and induces a quasi-fibration of homotopy categories.
(HTT, Thm. A.3.2.24 (2) with Rem. A.3.2.25 and Ex. A.3.2.18; Bergner, Thm. 1.1.) -/
theorem fibration_iff_isQuasiFibration
    [ModelCategory (EnrichedCat.{u, u + 1, u} SSet.{u})]
    (hW : weakEquivalences (EnrichedCat.{u, u + 1, u} SSet.{u}) = combinatorialDwyerKanEquivalences)
    (hC : cofibrations (EnrichedCat.{u, u + 1, u} SSet.{u}) = bergnerTrivialFibrations.llp)
    {C D : EnrichedCat.{u, u + 1, u} SSet.{u}} (F : C ⟶ D) :
    fibrations (EnrichedCat.{u, u + 1, u} SSet.{u}) F ↔
      (∀ X Y : C, fibrations SSet.{u} (F.map X Y)) ∧
        IsQuasiFibration (EnrichedFunctor.mapHomotopyCategory F) := by
  sorry

end Bergner

/-! ## Layer 6: Enriched diagram model structures -/

section EnrichedDiagrams

universe u

open TauCeti
open scoped SSet.modelCategoryQuillen

variable (C : Type u) [EnrichedCategory SSet.{u} C]

/-- The diagram category `SSet^C` of simplicial functors from a small simplicial category `C` to
simplicial sets: a type synonym of `EnrichedFunctor SSet C SSet`, whose morphisms are the enriched
natural transformations rather than Mathlib's transformations of underlying functors. -/
@[expose] def SSetDiagram : Type (u + 1) := EnrichedFunctor SSet.{u} C SSet.{u}

variable {C} in
/-- Left identity for enriched natural transformations of simplicial diagrams. -/
theorem unitComp_id_left {F G : EnrichedFunctor SSet.{u} C SSet.{u}}
    (α : UnitGradedNatTrans F G) : UnitGradedNatTrans.comp (UnitGradedNatTrans.id F) α = α := by
  refine GradedNatTrans.ext (funext fun X ↦ ?_)
  rw [UnitGradedNatTrans.comp_app, UnitGradedNatTrans.id_app, ForgetEnrichment.homOf_eId,
    Category.id_comp]
  rfl

variable {C} in
/-- Right identity for enriched natural transformations of simplicial diagrams. -/
theorem unitComp_id_right {F G : EnrichedFunctor SSet.{u} C SSet.{u}}
    (α : UnitGradedNatTrans F G) : UnitGradedNatTrans.comp α (UnitGradedNatTrans.id G) = α := by
  refine GradedNatTrans.ext (funext fun X ↦ ?_)
  rw [UnitGradedNatTrans.comp_app, UnitGradedNatTrans.id_app, ForgetEnrichment.homOf_eId,
    Category.comp_id]
  rfl

variable {C} in
/-- Associativity of composition of enriched natural transformations of simplicial diagrams. -/
theorem unitComp_assoc {F G H K : EnrichedFunctor SSet.{u} C SSet.{u}}
    (α : UnitGradedNatTrans F G) (β : UnitGradedNatTrans G H) (γ : UnitGradedNatTrans H K) :
    UnitGradedNatTrans.comp (UnitGradedNatTrans.comp α β) γ =
      UnitGradedNatTrans.comp α (UnitGradedNatTrans.comp β γ) := by
  refine GradedNatTrans.ext (funext fun X ↦ ?_)
  simp only [UnitGradedNatTrans.comp_app]
  exact congrArg _ (Category.assoc _ _ _)

/-- The enriched natural transformations `TauCeti.UnitGradedNatTrans`, with Tau Ceti's identities
and composition, as morphisms of `SSetDiagram C`. -/
noncomputable instance : Category.{u} (SSetDiagram C) where
  Hom F G := UnitGradedNatTrans (V := SSet.{u}) (C' := C) (D' := SSet.{u}) F G
  id F := UnitGradedNatTrans.id (V := SSet.{u}) (C' := C) (D' := SSet.{u}) F
  comp α β := UnitGradedNatTrans.comp α β
  id_comp α := unitComp_id_left α
  comp_id α := unitComp_id_right α
  assoc α β γ := unitComp_assoc α β γ

variable {C}

/-- The component at `X` of a map of `SSetDiagram C`, as a map of simplicial sets. -/
@[expose] noncomputable def SSetDiagram.app {F G : SSetDiagram C} (α : F ⟶ G) (X : C) :
    EnrichedFunctor.obj (F : EnrichedFunctor SSet.{u} C SSet.{u}) X ⟶
      EnrichedFunctor.obj (G : EnrichedFunctor SSet.{u} C SSet.{u}) X :=
  (eHomEquiv SSet.{u}).symm
    (GradedNatTrans.app (α : UnitGradedNatTrans (V := SSet.{u}) (C' := C) (D' := SSet.{u}) F G) X)

variable (C)

/-- The objectwise weak homotopy equivalences of `SSetDiagram C`. -/
def objectwiseWeakEquivalences : MorphismProperty (SSetDiagram C) :=
  fun _ _ α ↦ ∀ X, SSet.IsWeakHomotopyEquivalence (SSetDiagram.app α X)

/-- The objectwise Kan fibrations of `SSetDiagram C` (the projective fibrations). -/
def objectwiseFibrations : MorphismProperty (SSetDiagram C) :=
  fun _ _ α ↦ ∀ X, HomotopicalAlgebra.fibrations SSet.{u} (SSetDiagram.app α X)

/-- The objectwise monomorphisms of `SSetDiagram C` (the injective cofibrations). -/
def objectwiseMonomorphisms : MorphismProperty (SSetDiagram C) :=
  fun _ _ α ↦ ∀ X, Mono (SSetDiagram.app α X)

/-- The projective model structure on simplicial functors from a small simplicial category to
simplicial sets: objectwise weak homotopy equivalences and objectwise Kan fibrations; it is
combinatorial. (HTT, Prop. A.3.3.2, for S = A = simplicial sets.) -/
theorem exists_projectiveModelCategory_sSetDiagram :
    ∃ M : ModelCategory (SSetDiagram C),
      @weakEquivalences _ _ M.categoryWithWeakEquivalences = objectwiseWeakEquivalences C ∧
        @fibrations _ _ M.categoryWithFibrations = objectwiseFibrations C ∧
        @IsCombinatorial.{u} _ _ M := by
  sorry

/-- The injective model structure on simplicial functors from a small simplicial category to
simplicial sets: objectwise weak homotopy equivalences and objectwise monomorphisms; it is
combinatorial. (HTT, Prop. A.3.3.2, for S = A = simplicial sets.) -/
theorem exists_injectiveModelCategory_sSetDiagram :
    ∃ M : ModelCategory (SSetDiagram C),
      @weakEquivalences _ _ M.categoryWithWeakEquivalences = objectwiseWeakEquivalences C ∧
        @cofibrations _ _ M.categoryWithCofibrations = objectwiseMonomorphisms C ∧
        @IsCombinatorial.{u} _ _ M := by
  sorry

variable {C} {D : Type u} [EnrichedCategory SSet.{u} D]

/-- Precomposition of an enriched natural transformation with a simplicial functor. -/
@[expose] noncomputable def whiskerUnit (F : EnrichedFunctor SSet.{u} C D)
    {G G' : EnrichedFunctor SSet.{u} D SSet.{u}} (α : UnitGradedNatTrans G G') :
    UnitGradedNatTrans (F.comp SSet.{u} G) (F.comp SSet.{u} G') where
  app X := α.app (F.obj X)
  naturality X Y := by
    have h := (unitGradedNaturality_iff G G' (F.obj X) (F.obj Y) _ _).mp (α.naturality _ _)
    apply (unitGradedNaturality_iff (F.comp SSet.{u} G) (F.comp SSet.{u} G') X Y _ _).mpr
    simp only [EnrichedFunctor.comp_map]
    exact ((Category.assoc (obj := SSet.{u}) _ _ _).trans (congrArg (F.map X Y ≫ ·) h)).trans
      (Category.assoc (obj := SSet.{u}) _ _ _).symm

/-- Restriction of simplicial diagrams along a simplicial functor `F : C ⥤ D`. -/
@[expose] noncomputable def restriction (F : EnrichedFunctor SSet.{u} C D) :
    SSetDiagram D ⥤ SSetDiagram C where
  obj G := EnrichedFunctor.comp SSet.{u} F G
  map α := whiskerUnit F α
  map_id G := GradedNatTrans.ext (funext fun X ↦
    (UnitGradedNatTrans.id_app (G : EnrichedFunctor SSet.{u} D SSet.{u}) (F.obj X)).trans
      (UnitGradedNatTrans.id_app (F.comp SSet.{u} G) X).symm)
  map_comp α β := GradedNatTrans.ext (funext fun X ↦
    (UnitGradedNatTrans.comp_app α β (F.obj X)).trans
      (UnitGradedNatTrans.comp_app (whiskerUnit F α) (whiskerUnit F β) X).symm)

/-- Restriction along a simplicial functor preserves objectwise weak homotopy equivalences. -/
@[expose] noncomputable def restrictionLocalizerMorphism (F : EnrichedFunctor SSet.{u} C D) :
    LocalizerMorphism (objectwiseWeakEquivalences D) (objectwiseWeakEquivalences C) where
  functor := restriction F
  map _ _ _ hα := by
    intro X
    exact hα (F.obj X)

/-- Invariance of simplicial diagram categories: restriction along a Dwyer–Kan equivalence induces
an equivalence of homotopy categories, which is the content of both Quillen equivalences.
(HTT, Prop. A.3.3.8, for S = A = simplicial sets.) -/
theorem isLocalizedEquivalence_restriction (F : EnrichedFunctor SSet.{u} C D)
    (hF : IsCombinatorialDwyerKanEquivalence F) : (restrictionLocalizerMorphism F).IsLocalizedEquivalence := by
  sorry

end EnrichedDiagrams

end TauCetiRoadmap.ModelCategoryTheory.SimplicialCategories

/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.Cartesian
public import TauCeti.AlgebraicTopology.Quasicategory.FullSubcategory
public import TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful
public import TauCeti.AlgebraicTopology.Quasicategory.InitialVertex
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.Quasicategory.TerminalVertex
public import TauCeti.AlgebraicTopology.SimplicialSet.Coslice
public import TauCeti.AlgebraicTopology.SimplicialSet.Fiber
public import TauCeti.AlgebraicTopology.SimplicialSet.Join.StdSimplex
public import TauCeti.AlgebraicTopology.SimplicialSet.Slice

/-!
# Adjunctions, localizations and factorization systems: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, with the few definitions their statements need.
∞-categories are quasicategories, bundled as Mathlib's `SSet.QCat`, and an adjunction `f ⊣ g` is an
adjunction in Mathlib's bicategory `SSet.QCat.bicategory` (README §1.1). A colimit of `p : K ⟶ C` is an
initial vertex of the coslice (`SSet.coslice.IsColimit`), and a full subcategory on a predicate is
`SSet.fullEnhancedSubcategory`.

Stated: the preservation of colimits and limits by adjoints (§1.5, HTT Prop. 5.2.3.5), the
representability criterion for right adjoints (§1.6, HTT Prop. 5.2.4.2), sections through
fiberwise-initial objects as left adjoints (§1.6, HTT Prop. 5.2.4.3), Kan extension along an arbitrary
map as a left adjoint of restriction (§1.8, HTT Prop. 4.3.3.7, with HTT's Kan extensions along a map,
Def. 4.3.3.2, through the mapping cylinder), the definitions of reflective
localization, colocalization, localization functor and retract (§2.1), relative localizations and
reflective subcategories (§2.2), reflective subcategories as left adjoints of full inclusions (§2.3,
HTT Prop. 5.2.7.8), the characterization of localization functors (§2.3, HTT Prop. 5.2.7.4), the
localization `C[W⁻¹]` (§2.4, HA Def. 1.3.4.1), its existence (§2.4, HA Remark 1.3.4.2) and reflective
localizations as localizations (§2.4, HTT Prop. 5.2.7.12).

Headline not statable at the pins: Quillen left derived functors as absolute right Kan extensions
(§2.7, Nikolaus–Scholze Ex. A.10): the
  transformation `F(q)` would have to be an edge of a functor ∞-category between nerves, and neither
  library turns a natural transformation of functors into such an edge; Quillen functors are also not
  in Mathlib.
-/

public section

namespace TauCetiRoadmap.InfinityCategoryTheory.AdjunctionsAndLocalizations

open CategoryTheory Bicategory Limits MonoidalCategory MonoidalClosed CartesianMonoidalCategory
  Simplicial SSet Opposite

universe u

/-! ## Layer 1: Adjoint functors -/

/-- **Left adjoints preserve colimits.** If `f ⊣ g`, the image under `f` of a colimit cocone of a
diagram `p : K ⟶ C` is a colimit cocone of `p ≫ f`. (README §1.5.1; HTT, Prop. 5.2.3.5.) -/
theorem isColimit_map_of_adjunction {C D : QCat.{u}} {f : C ⟶ D} {g : D ⟶ C}
    (adj : Bicategory.Adjunction f g) {K : SSet.{u}} (p : K ⟶ C.obj)
    (c : (coslice p) _⦋0⦌) (hc : coslice.IsColimit p c) :
    coslice.IsColimit (p ≫ f.hom)
      ((coslice.map (𝟙 K) f.hom (Category.id_comp _)).app _ c) := by
  sorry

/-- **Right adjoints preserve limits.** If `f ⊣ g`, the image under `g` of a limit cone of a diagram
`p : K ⟶ D` is a limit cone of `p ≫ g`. (README §1.5.1; HTT, Prop. 5.2.3.5.) -/
theorem isLimit_map_of_adjunction {C D : QCat.{u}} {f : C ⟶ D} {g : D ⟶ C}
    (adj : Bicategory.Adjunction f g) {K : SSet.{u}} (p : K ⟶ D.obj)
    (c : (slice p) _⦋0⦌) (hc : slice.IsLimit p c) :
    slice.IsLimit (p ≫ g.hom)
      ((slice.map (𝟙 K) g.hom (Category.id_comp _)).app _ c) := by
  sorry

/-- **The representability criterion for right adjoints.** A functor `f : C ⟶ D` of ∞-categories
has a right adjoint exactly when, for every object `d` of `D`, the fiber product `C ×_D D_{/d}` has a
final object, that is, the right fibration `C ×_D D_{/d} ⟶ C` is representable. (README §1.6.1; HTT,
Prop. 5.2.4.2, with Prop. 4.4.4.5.) -/
theorem exists_rightAdjoint_iff {C D : QCat.{u}} (f : C ⟶ D) :
    (∃ g : D ⟶ C, Nonempty (Bicategory.Adjunction f g)) ↔
      ∀ d : D.obj _⦋0⦌, ∃ v : (pullback f.hom
        (slice.π (yonedaEquiv.symm d : Δ[0] ⟶ D.obj))) _⦋0⦌,
        (pullback f.hom (slice.π (yonedaEquiv.symm d : Δ[0] ⟶ D.obj))).IsTerminalVertex v := by
  sorry

/-- The vertex `(s d, d)` of the fiber `C ×_D {d}` of `p : C ⟶ D` over `d`, for a section `s` of
`p`. (README §1.6.2; HTT, Prop. 5.2.4.3, the objects `s(d)` of the fibers `C_d`.) -/
noncomputable def sectionFiberVertex {C D : SSet.{u}} (p : C ⟶ D) (s : D ⟶ C) (hs : s ≫ p = 𝟙 D)
    (d : D _⦋0⦌) : (pullback p (yonedaEquiv.symm d : Δ[0] ⟶ D)) _⦋0⦌ :=
  yonedaEquiv (pullback.lift (yonedaEquiv.symm d ≫ s) (𝟙 _)
    (by rw [Category.assoc, hs, Category.comp_id, Category.id_comp]))

/-- **A section through fiberwise-initial objects is a left adjoint.** If `p : C ⟶ D` is a Cartesian
fibration of ∞-categories with a section `s` such that `s(d)` is initial in the fiber `C_d` for every
object `d`, then `s ⊣ p`. (README §1.6.2; HTT, Prop. 5.2.4.3.) -/
theorem nonempty_adjunction_of_isInitialVertex {C D : QCat.{u}} (p : C ⟶ D)
    [CartesianFibration p.hom] (s : D ⟶ C) (hs : s.hom ≫ p.hom = 𝟙 D.obj)
    (hinit : ∀ d : D.obj _⦋0⦌,
      (pullback p.hom (yonedaEquiv.symm d : Δ[0] ⟶ D.obj)).IsInitialVertex
        (sectionFiberVertex p.hom s.hom hs d)) :
    Nonempty (Bicategory.Adjunction s p) := by
  sorry

/-! ### Definitions repeated from earlier Parts, for §1.8 -/

/-- A map `f : A ⟶ B` of simplicial sets is a categorical equivalence when, for every ∞-category `C`,
restriction along `f` induces an equivalence of homotopy categories `h Fun(B, C) ⥤ h Fun(A, C)`.
Part InfinityCategoryFoundations' definition (its §2.1.6), repeated with the same body. (HTT, Def. 1.1.5.14, in
the equivalent form of Kerodon, §4.5.4, Def. 4.5.4.1.) -/
def IsCategoricalEquivalence {A B : SSet.{u}} (f : A ⟶ B) : Prop :=
  ∀ (C : SSet.{u}) [C.Quasicategory],
    (hoFunctor.map ((MonoidalClosed.pre f).app C)).toFunctor.IsEquivalence

/-- The simplicial set `A_{/c} = A ×_C C_{/c}` of objects of a subcomplex `A ⊆ C` over a vertex
`c`. Part LimitsAndKanExtensions' definition (its §7.1.2), repeated with the same body. (HTT,
Def. 4.3.2.2, the diagram `C⁰_{/c}`.) -/
noncomputable abbrev subcomplexOver {C : SSet.{u}} (A : C.Subcomplex) (c : C _⦋0⦌) : SSet.{u} :=
  pullback A.ι (slice.π (const c : Δ[0] ⟶ C))

/-- The tautological cocone `A_{/c} ⋆ Δ[0] ⟶ C` with cone point `c`. Part LimitsAndKanExtensions'
definition (its §7.1.2), repeated with the same body. (HTT, Def. 4.3.2.2.) -/
noncomputable def subcomplexOverCocone {C : SSet.{u}} (A : C.Subcomplex) (c : C _⦋0⦌) :
    join (subcomplexOver A c) Δ[0] ⟶ C :=
  (slice.homEquiv (pullback.snd A.ι (slice.π (const c : Δ[0] ⟶ C)))).1

/-- `F : C ⟶ D` is a left Kan extension of its restriction to `A` at `c`. Part
LimitsAndKanExtensions' definition (its §7.1.2), repeated with the same body. (HTT, Def. 4.3.2.2.) -/
def IsLeftKanExtensionAt {C D : SSet.{u}} (A : C.Subcomplex) (F : C ⟶ D) (c : C _⦋0⦌) : Prop :=
  coslice.IsColimit (join.inl _ Δ[0] ≫ subcomplexOverCocone A c ≫ F)
    (yonedaEquiv ((coslice.homEquiv (p := join.inl _ Δ[0] ≫ subcomplexOverCocone A c ≫ F)
      (X := Δ[0])).symm ⟨subcomplexOverCocone A c ≫ F, rfl⟩))

/-- `F : C ⟶ D` is a left Kan extension of its restriction to `A`. Part LimitsAndKanExtensions'
definition (its §7.1.2), repeated with the same body. (HTT, Def. 4.3.2.2.) -/
def IsLeftKanExtension {C D : SSet.{u}} (A : C.Subcomplex) (F : C ⟶ D) : Prop :=
  ∀ c : C _⦋0⦌, IsLeftKanExtensionAt A F c

/-! ### Kan extensions along a map (§1.8) -/

/-- The inclusion `K ≅ K × {i} ⊆ K × Δ[1]` at the vertex `i` of `Δ[1]`, used to build the mapping
cylinder. Part LimitsAndKanExtensions owns this notion (its §7.1.3, HTT, Def. 4.3.3.1) but
states no Lean form; it is written in Lean here because this Part's headline needs it. -/
noncomputable def cylinderAt (K : SSet.{u}) (i : Fin 2) : K ⟶ K ⊗ Δ[1] :=
  lift (𝟙 K) (const (stdSimplex.obj₀Equiv.symm i))

/-- The mapping cylinder `M^op(δ) = (K × Δ[1]) ⊔_{K × {1}} K′` of `δ : K ⟶ K′`. Part
LimitsAndKanExtensions owns this notion (its §7.1.3, HTT, Def. 4.3.3.1) but states no Lean
form; it is written in Lean here because this Part's headline needs it. (README §1.8.2; HTT, Def.
4.3.3.1.) -/
noncomputable abbrev mappingCylinder {K K' : SSet.{u}} (δ : K ⟶ K') : SSet.{u} :=
  pushout (cylinderAt K 1) δ

/-- The projection `M^op(δ) ⟶ Δ[1]`, sending `K′` to the vertex `1`. Part LimitsAndKanExtensions
owns this notion (its §7.1.3, HTT, Def. 4.3.3.1) but states no Lean form; it is written in
Lean here because this Part's headline needs it. (README §1.8.2; HTT, Def. 4.3.3.1.) -/
noncomputable def mappingCylinder.π {K K' : SSet.{u}} (δ : K ⟶ K') : mappingCylinder δ ⟶ Δ[1] :=
  pushout.desc (snd K Δ[1]) (const (stdSimplex.obj₀Equiv.symm 1)) (by simp [cylinderAt])

/-- The inclusion of `K ≅ K × {0}` into the mapping cylinder. Part LimitsAndKanExtensions owns this
notion (its §7.1.3, HTT, Def. 4.3.3.1) but states no Lean form; it is written in Lean here
because this Part's headline needs it. (README §1.8.2; HTT, Def. 4.3.3.1.) -/
noncomputable def mappingCylinder.ι₀ {K K' : SSet.{u}} (δ : K ⟶ K') : K ⟶ mappingCylinder δ :=
  cylinderAt K 0 ≫ pushout.inl _ _

/-- The inclusion of `K′` into the mapping cylinder. Part LimitsAndKanExtensions owns this notion
(its §7.1.3, HTT, Def. 4.3.3.1) but states no Lean form; it is written in Lean here because
this Part's headline needs it. (README §1.8.2; HTT, Def. 4.3.3.1.) -/
noncomputable def mappingCylinder.ι₁ {K K' : SSet.{u}} (δ : K ⟶ K') : K' ⟶ mappingCylinder δ :=
  pushout.inr _ _

/-- A left extension `F : M^op(δ) ⟶ D` of `F|K` along `δ` is a *left Kan extension* when it factors
as a categorical equivalence `i : M^op(δ) ⟶ 𝒦` over `Δ[1]` into an ∞-category `𝒦`, followed by a map
`F′ : 𝒦 ⟶ D` that is a left Kan extension of its restriction to the fiber of `𝒦` over `0`. Part
LimitsAndKanExtensions owns this notion (its §7.1.4, HTT, Def. 4.3.3.2) but states no Lean
form; it is written in Lean here because this Part's headline needs it. (README §1.8.2; HTT, Def.
4.3.3.2.) -/
def IsLeftKanExtensionAlong {K K' D : SSet.{u}} (δ : K ⟶ K') (F : mappingCylinder δ ⟶ D) : Prop :=
  ∃ (𝒦 : SSet.{u}) (_ : 𝒦.Quasicategory) (π : 𝒦 ⟶ Δ[1]) (i : mappingCylinder δ ⟶ 𝒦)
    (F' : 𝒦 ⟶ D), i ≫ π = mappingCylinder.π δ ∧ IsCategoricalEquivalence i ∧ i ≫ F' = F ∧
      IsLeftKanExtension (fiber π (stdSimplex.obj₀Equiv.symm 0)) F'

/-- The functor ∞-category `Fun(K, D)`, as an object of `QCat`. (README §1.8.2; HTT, Prop. 1.2.7.3.) -/
def funQCat (K : SSet.{u}) (D : QCat.{u}) : QCat.{u} :=
  ⟨(ihom K).obj D.obj, by have := D.property; infer_instance⟩

/-- Restriction `δ^* : Fun(K′, D) ⟶ Fun(K, D)` along `δ : K ⟶ K′`. (README §1.8.2.) -/
def restrict {K K' : SSet.{u}} (δ : K ⟶ K') (D : QCat.{u}) : funQCat K' D ⟶ funQCat K D :=
  ObjectProperty.homMk ((MonoidalClosed.pre δ).app D.obj)

/-- **Kan extension along a map as a left adjoint of restriction.** For `δ : K ⟶ K′` and an
∞-category `D` such that every functor `K ⟶ D` has a left Kan extension along `δ`, restriction
`δ^* : Fun(K′, D) ⟶ Fun(K, D)` has a left adjoint. (README §1.8.2; HTT, Prop. 4.3.3.7, whose left
adjoint is a left Kan extension functor `δ_!`.) -/
theorem exists_leftAdjoint_restrict {K K' : SSet.{u}} (δ : K ⟶ K') (D : QCat.{u})
    (h : ∀ f : K ⟶ D.obj, ∃ F : mappingCylinder δ ⟶ D.obj,
      mappingCylinder.ι₀ δ ≫ F = f ∧ IsLeftKanExtensionAlong δ F) :
    ∃ L : funQCat K D ⟶ funQCat K' D, Nonempty (Bicategory.Adjunction L (restrict δ D)) := by
  sorry

/-! ## Layer 2: Localizations, factorization systems and derived functors -/

/-- An endofunctor `L` of an ∞-category `C` is a *localization functor* when it is equivalent to
`f ≫ g` for a reflective localization `f : C ⟶ D` with fully faithful right adjoint `g`.
(README §2.1.1; HTT, §5.2.7, p. 383, and Prop. 5.2.7.4 (1).) -/
def IsLocalizationFunctor {C : QCat.{u}} (L : C ⟶ C) : Prop :=
  ∃ (D : QCat.{u}) (f : C ⟶ D) (g : D ⟶ C), Nonempty (Bicategory.Adjunction f g) ∧
    IsFullyFaithful g.hom ∧ Nonempty (f ≫ g ≅ L)

/-- The full subcategory of an ∞-category `C` on the objects satisfying `P`, as an ∞-category.
(README §2.2.1; HTT, §1.2.11.) -/
def fullSubcategory (C : QCat.{u}) (P : C.obj _⦋0⦌ → Prop) : QCat.{u} :=
  ⟨(C.obj.fullEnhancedSubcategory P : SSet.{u}), by have := C.property; infer_instance⟩

/-- The inclusion of the full subcategory on `P` into `C`. (README §2.2.1; HTT, §1.2.11.) -/
def fullSubcategoryι (C : QCat.{u}) (P : C.obj _⦋0⦌ → Prop) : fullSubcategory C P ⟶ C :=
  ObjectProperty.homMk (C.obj.fullEnhancedSubcategory P).ι

/-- A cocone `v` under the vertex `c`, that is, a morphism out of `c`, exhibits its target as a
localization of `c` relative to the full subcategory on `P`: its target satisfies `P`, and `v` is an
initial vertex of the full subcategory of `C_{c/}` on the morphisms with target satisfying `P`.
(README §2.2.1; HTT, Def. 5.2.7.6, in the equivalent form of Remark 5.2.7.7.) -/
def IsSubcategoryLocalization {C : SSet.{u}} (P : C _⦋0⦌ → Prop) {c : C _⦋0⦌}
    (v : (coslice (yonedaEquiv.symm c : Δ[0] ⟶ C)) _⦋0⦌) : Prop :=
  ∃ hv : P ((coslice.π _).app _ v),
    ((coslice (yonedaEquiv.symm c : Δ[0] ⟶ C)).fullEnhancedSubcategory
      (fun w ↦ P ((coslice.π _).app _ w)) : SSet.{u}).IsInitialVertex
      ⟨v, (mem_fullEnhancedSubcategory_obj_zero_iff _ v).2 hv⟩

/-- The full subcategory on `P` is *reflective* when every object has a localization relative to it.
(README §2.2.1; HTT, Remark 5.2.7.9.) -/
def IsReflectiveSubcategory {C : SSet.{u}} (P : C _⦋0⦌ → Prop) : Prop :=
  ∀ c : C _⦋0⦌, ∃ v : (coslice (yonedaEquiv.symm c : Δ[0] ⟶ C)) _⦋0⦌,
    IsSubcategoryLocalization P v

/-- **Reflective subcategories are the left adjoints of full inclusions.** The inclusion of a full
subcategory has a left adjoint exactly when the subcategory is reflective. (README §2.3.1; HTT,
Prop. 5.2.7.8.) -/
theorem exists_leftAdjoint_fullSubcategoryι_iff (C : QCat.{u}) (P : C.obj _⦋0⦌ → Prop) :
    (∃ f : C ⟶ fullSubcategory C P,
        Nonempty (Bicategory.Adjunction f (fullSubcategoryι C P))) ↔
      IsReflectiveSubcategory P := by
  sorry

/-- The essential image of an endofunctor `L`: the objects equivalent to some `L y`.
(README §2.3.1; HTT, Prop. 5.2.7.4, the essential image `LC`.) -/
def essImage {C : QCat.{u}} (L : C ⟶ C) (x : C.obj _⦋0⦌) : Prop :=
  ∃ y : C.obj _⦋0⦌, ∃ e : C.obj.Edge (L.hom.app _ y) x, e.IsEquivalence

/-- An endofunctor `L`, viewed as a functor onto its essential image. (README §2.3.1; HTT,
Prop. 5.2.7.4 (2).) -/
def corestrict {C : QCat.{u}} (L : C ⟶ C) : C ⟶ fullSubcategory C (essImage L) :=
  ObjectProperty.homMk (Subcomplex.lift L.hom
    ((range_le_fullEnhancedSubcategory_iff _ _).2 fun y ↦ ⟨y, .id _, Edge.isEquivalence_id _⟩))

/-- **The characterization of localization functors.** For an endofunctor `L` of an ∞-category `C`
the following are equivalent: (1) `L` is a localization functor; (2) `L`, viewed as a functor onto its
essential image, is left adjoint to the inclusion; (3) there is a natural transformation
`α : 𝟙 C ⟶ L` whose two whiskerings by `L` (with components `α (L c)` and `L (α c)`) are invertible.
(README §2.3.1; HTT, Prop. 5.2.7.4.) -/
theorem isLocalizationFunctor_tfae {C : QCat.{u}} (L : C ⟶ C) :
    List.TFAE
      [IsLocalizationFunctor L,
        Nonempty (Bicategory.Adjunction (corestrict L) (fullSubcategoryι C (essImage L))),
        ∃ α : 𝟙 C ⟶ L, IsIso (Bicategory.whiskerLeft L α) ∧ IsIso (Bicategory.whiskerRight α L)] := by
  sorry

/-- A functor `f : C ⟶ D` of ∞-categories exhibits `D` as the localization `C[W⁻¹]` of `C` at a
collection `W` of edges: for every ∞-category `E`, precomposition with `f` is fully faithful, and a
functor `C ⟶ E` factors through `f` up to equivalence exactly when it carries every edge of `W` to an
equivalence. (README §2.4.1; HA, Def. 1.3.4.1.) -/
def IsLocalizationAt {C D : QCat.{u}} (f : C ⟶ D)
    (W : ∀ x y : C.obj _⦋0⦌, C.obj.Edge x y → Prop) : Prop :=
  ∀ E : QCat.{u}, IsFullyFaithful ((MonoidalClosed.pre f.hom).app E.obj) ∧
    ∀ F : C ⟶ E, (∃ G : D ⟶ E, Nonempty (f ≫ G ≅ F)) ↔
      ∀ (x y : C.obj _⦋0⦌) (e : C.obj.Edge x y), W x y e → (e.map F.hom).IsEquivalence

/-- **Existence of localizations.** Every ∞-category has a localization at every collection of edges.
(README §2.4.2; HA, Remark 1.3.4.2.) -/
theorem exists_isLocalizationAt (C : QCat.{u}) (W : ∀ x y : C.obj _⦋0⦌, C.obj.Edge x y → Prop) :
    ∃ (D : QCat.{u}) (f : C ⟶ D), IsLocalizationAt f W := by
  sorry

/-- **Reflective localizations are localizations.** For a localization functor `L` of `C`, the functor
`C ⟶ LC` onto the essential image exhibits `LC` as the localization of `C` at the morphisms that `L`
carries to equivalences. (README §2.4.4; HTT, Prop. 5.2.7.12; HA, Example 1.3.4.3.) -/
theorem isLocalizationAt_corestrict {C : QCat.{u}} {L : C ⟶ C} (hL : IsLocalizationFunctor L) :
    IsLocalizationAt (corestrict L) (fun _ _ e ↦ (e.map L.hom).IsEquivalence) := by
  sorry

end TauCetiRoadmap.InfinityCategoryTheory.AdjunctionsAndLocalizations

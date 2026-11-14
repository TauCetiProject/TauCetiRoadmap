/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.SimplicialSet.Join.Basic
public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence

/-!
# Presentable ∞-categories: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti where their carriers exist, with the few
definitions their statements need.

Stated below:
* §4.5: the pullback criterion for left exactness of a reflective localization (HTT, Prop. 6.2.1.1);
* §7.6: geometric realizations in an n-category with finite colimits exist and are computed over
  `N(Δ≤n)^op` (README §7.6, fourth assertion; HA, proof of Lemma 1.3.3.10, p. 103);
* §9.1: Quillen's model structure on product-preserving functors `C ⥤ SSet` (HTT, Prop. 5.5.9.1),
  without its simplicial enrichment;
* §9.3: the full faithfulness of `RG` and its essential image, the weakly product-preserving
  functors (HTT, Prop. 5.5.9.2), through localizations at the objectwise weak equivalences.

Not statable at the pins. Every other headline needs presentability, and presentability rests on
κ-compact objects, `Ind_κ` and accessibility (Parts PresheavesAndCompletions §6.1, AccessibleInfinityCategories
§4.1), which are defined through the Yoneda embedding into the ∞-category of spaces. That needs
`Ex^∞` and the rigidification `C[−]` on all simplicial sets, neither of which is at the pins. So
the presentation theorem (§1.6), representability and the adjoint functor theorem (§2.1–2.2), the
constructions of Layer 3, localization at a small set and its universal property (§4.3–4.4),
`Pr^L`, `Pr^R` and their limits (§5.1–5.2, §5.8), the presentability of `Pr^L_κ` (§5.5), compactly
assembled ∞-categories (§5.7), truncation functors and Postnikov towers (§6.2–6.4), `P_Σ` and
projectively generated ∞-categories (Layer 7) and the presentation by combinatorial simplicial
model categories (§8.1) are not stated. Local objects (§1.2) and left exact filtered colimits
(§6.5) and their left exactness in `Cat∞` (§6.8, SAG, Lemma 4.5.3.1) need the maps of mapping
spaces induced by composition, or the colimit functor `Fun(K, C) ⟶ C`, which are not at the pins
either. Bergner's comparison (§9.4, HTT, Cor. 5.5.9.3) needs `P_Σ` and the underlying ∞-category of
a simplicial model category, and is not stated.

Repeated definitions. `IsColimitDiagram`, `IsLimitDiagram`, `IsLeftExact`, the square shapes and
`IsPullbackSquare`, `HomotopicRelBoundary` and `IsNCategory` repeat the bodies of Part
InfinityCategoryFoundations (§1.2, §10.1), `IsReflectiveLocalization` that of Part AdjunctionsAndLocalizations
§2.1, and `weakHomotopyEquivalences` that of
ModelCategoryTheory, Part KanQuillen §3.1, since a roadmap file may not import another.
-/

public section

namespace TauCetiRoadmap.InfinityCategoryTheory.PresentableInfinityCategories

open CategoryTheory Limits MonoidalCategory CartesianMonoidalCategory Simplicial

universe u

/-! ## Layer 4: Localization at a small set of morphisms

The pullback criterion for left exact localizations is §4.5. -/

section LeftExact

open SSet

/-- A map `p̄ : Δ[0] ⋆ K ⟶ C` out of the left cone is a *limit diagram* when the cone it
determines over `p = p̄|K`, a vertex of the slice `C_{/p}`, is a limit cone in the sense of Tau
Ceti's `SSet.slice.IsLimit`; used for ∞-categories `C`. Part InfinityCategoryFoundations §1.2.4 owns it.
(README §4.5.1; HTT, Def. 1.2.13.4.) -/
def IsLimitDiagram {K C : SSet.{u}} (q : join Δ[0] K ⟶ C) : Prop :=
  slice.IsLimit (join.inr _ _ ≫ q)
    ((slice.objEquiv (p := join.inr _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- A functor `F : C ⟶ D` is *left exact* when it carries every limit diagram
`Δ[0] ⋆ K ⟶ C` with `K` finite (finitely many nondegenerate simplices) to a limit diagram. Used for
∞-categories `C` and `D` admitting finite limits. Part InfinityCategoryFoundations §1.2.4 owns it.
(README §4.5.1; HTT, Remark 5.3.2.10, with κ = ω.) -/
def IsLeftExact {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) [Finite K.N] (q : join Δ[0] K ⟶ C), IsLimitDiagram q → IsLimitDiagram (q ≫ F)

/-- The first coordinate of the cospan `Λ[2, 2]` inside the square: the vertices `0, 1, 2`
go to `1, 0, 1`. Part InfinityCategoryFoundations §1.2.4 owns it. (README §4.5.1; HTT, §4.4.2.) -/
noncomputable def cospanCoord₁ : (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (𝟙 _) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The second coordinate of the cospan `Λ[2, 2]` inside the square: the vertices
`0, 1, 2` go to `0, 1, 1`. Part InfinityCategoryFoundations §1.2.4 owns it. (README §4.5.1; HTT, §4.4.2.) -/
noncomputable def cospanCoord₂ : (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The square `Δ[1] × Δ[1]` read as a cone `Δ[0] ⋆ Λ[2, 2]`: the cone point goes to
`(0, 0)` and the cospan vertices to `(1, 0)`, `(0, 1)`, `(1, 1)`; this map is an isomorphism.
Part InfinityCategoryFoundations §1.2.4 owns it. (README §4.5.1; HTT, §4.4.2.) -/
noncomputable def coneShape : join Δ[0] (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] ⊗ Δ[1] :=
  lift (join.map (𝟙 _) cospanCoord₁ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))
    (join.map (𝟙 _) cospanCoord₂ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))

/-- A square is a pullback square when, read as a cone `Δ[0] ⋆ Λ[2, 2] ⟶ C` over its
cospan, it is a limit diagram; used for ∞-categories `C`. Part InfinityCategoryFoundations §1.2.4 owns it.
(README §4.5.1; HTT, §4.4.2, with Def. 1.2.13.4.) -/
def IsPullbackSquare {C : SSet.{u}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsLimitDiagram (coneShape ≫ s)

/-- A functor `f : C ⟶ D` of ∞-categories is a *reflective localization* when it has a fully
faithful right adjoint. Part AdjunctionsAndLocalizations §2.1.1 owns it. (README §4.5.1; HTT,
Def. 5.2.7.2, where it is called a localization.) -/
def IsReflectiveLocalization {C D : QCat.{u}} (f : C ⟶ D) : Prop :=
  ∃ g : D ⟶ C, Nonempty (Bicategory.Adjunction f g) ∧ IsFullyFaithful g.hom

/-- The pullback criterion: a reflective localization `L : 𝒳 ⟶ 𝒴`, with `𝒳` having finite limits, is
left exact exactly when the morphisms of `𝒳` that `L` inverts are stable under pullback. A pullback
square `s` has the cospan `(1, 0) ⟶ (1, 1) ⟵ (0, 1)`; its edge `(0, 0) ⟶ (1, 0)` is the pullback of
the edge `(0, 1) ⟶ (1, 1)`. (README §4.5.1; HTT, Prop. 6.2.1.1, p. 589.) -/
theorem isLeftExact_iff_isEquivalence_pullback {X Y : QCat.{u}} (L : X ⟶ Y)
    (hL : IsReflectiveLocalization L)
    (hX : ∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ X.obj),
      ∃ q : join Δ[0] K ⟶ X.obj, join.inr _ _ ≫ q = p ∧ IsLimitDiagram q) :
    IsLeftExact L.hom ↔ ∀ s : Δ[1] ⊗ Δ[1] ⟶ X.obj, IsPullbackSquare s →
      (SSet.Edge.mk' (SSet.yonedaEquiv
        (lift (𝟙 _) (SSet.const (stdSimplex.obj₀Equiv.symm 1)) ≫ s ≫ L.hom))).IsEquivalence →
      (SSet.Edge.mk' (SSet.yonedaEquiv
        (lift (𝟙 _) (SSet.const (stdSimplex.obj₀Equiv.symm 0)) ≫ s ≫ L.hom))).IsEquivalence := by
  sorry

end LeftExact

/-! ## Layer 7: `P_Σ` and projectively generated ∞-categories

Geometric realizations in n-categories are §7.6. -/

section NCategories

open SSet

/-- A map `p̄ : K ⋆ Δ[0] ⟶ C` out of the right cone is a *colimit diagram* when the cocone it
determines under `p = p̄|K` is a colimit cocone in the sense of Tau Ceti's
`SSet.coslice.IsColimit`; used for ∞-categories `C`. Part InfinityCategoryFoundations §1.2.4 owns it.
(README §7.6.1; HTT, Def. 1.2.13.4.) -/
def IsColimitDiagram {K C : SSet.{u}} (q : join K Δ[0] ⟶ C) : Prop :=
  coslice.IsColimit (join.inl _ _ ≫ q)
    ((coslice.objEquiv (p := join.inl _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- Two simplices `Δ[n] ⟶ C` are homotopic relative to `∂Δ[n]`: there is a map
`Δ[n] × Δ[1] ⟶ C` from one to the other, constant on the boundary, whose edge at every vertex is an
equivalence. Part InfinityCategoryFoundations §10.1.1 owns it. (README §7.6.1; HTT, §2.3.3 and Def. 2.3.4.1.) -/
def HomotopicRelBoundary {C : SSet.{u}} {n : ℕ} (f f' : Δ[n] ⟶ C) : Prop :=
  ∃ F : Δ[n] ⊗ Δ[1] ⟶ C,
    lift (𝟙 _) (SSet.const (SSet.stdSimplex.obj₀Equiv.symm 0)) ≫ F = f ∧
    lift (𝟙 _) (SSet.const (SSet.stdSimplex.obj₀Equiv.symm 1)) ≫ F = f' ∧
    (∂Δ[n]).ι ▷ Δ[1] ≫ F = fst _ _ ≫ (∂Δ[n]).ι ≫ f ∧
    ∀ b : Δ[n] _⦋0⦌,
      (SSet.Edge.mk' (SSet.yonedaEquiv (lift (SSet.const b) (𝟙 Δ[1]) ≫ F))).IsEquivalence

/-- An `n`-category, for an integer `n ≥ −1`: an ∞-category in which `n`-simplices homotopic
relative to their boundary are equal, and `m`-simplices with `m > n` agreeing on their boundary are
equal. Part InfinityCategoryFoundations §10.1.2 owns it. (README §7.6.1; HTT, Def. 2.3.4.1.) -/
structure IsNCategory (n : ℤ) (C : SSet.{u}) : Prop where
  neg_one_le : -1 ≤ n
  quasicategory : C.Quasicategory
  eq_of_homotopicRelBoundary (k : ℕ) (hk : (k : ℤ) = n) (f f' : Δ[k] ⟶ C) :
    HomotopicRelBoundary f f' → f = f'
  eq_of_boundary (m : ℕ) (hm : n < m) (f f' : Δ[m] ⟶ C) :
    (∂Δ[m]).ι ≫ f = (∂Δ[m]).ι ≫ f' → f = f'

/-- The simplicial set `N(Δ)^op`, the nerve of `Δᵒᵖ`, indexing simplicial objects, lifted to the
universe `u`. (README §7.6.1; HTT, Notation 6.1.2.12.) -/
noncomputable abbrev simplexOp : SSet.{u} :=
  SSet.uliftFunctor.{u, 0}.obj (nerve.{0, 0} SimplexCategoryᵒᵖ)

/-- The inclusion `N(Δ≤n)^op ⟶ N(Δ)^op`, lifted to the universe `u`.
(README §7.6.1; HA, Lemma 1.3.3.10.) -/
noncomputable abbrev truncatedSimplexOpι (n : ℕ) :
    SSet.uliftFunctor.{u, 0}.obj (nerve.{0, 0} (SimplexCategory.Truncated n)ᵒᵖ) ⟶ simplexOp.{u} :=
  SSet.uliftFunctor.map (nerveMap (SimplexCategory.Truncated.inclusion n).op)

/-- Geometric realizations in an n-category are finite colimits. Let `n ≥ 0` and let `C` be an
`n`-category with finite colimits. Every simplicial object `U : N(Δ)^op ⟶ C` has a geometric
realization, and a cocone under `U` is a colimit diagram exactly when its restriction to
`N(Δ≤n)^op` is one; equivalently, the canonical map from the colimit of `U|N(Δ≤n)^op` to `|U|` is an
equivalence. The README states it for ∞-categories equivalent to an n-category; that form follows
from this one by invariance of colimits under equivalence.
(README §7.6.1, fourth assertion; HA, proof of Lemma 1.3.3.10, p. 103.) -/
theorem isColimitDiagram_iff_truncated_of_isNCategory (n : ℕ) {C : SSet.{u}}
    (hC : IsNCategory n C)
    (hfin : ∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ C),
      ∃ q : join K Δ[0] ⟶ C, join.inl _ _ ≫ q = p ∧ IsColimitDiagram q)
    (U : simplexOp.{u} ⟶ C) :
    (∃ q : join simplexOp.{u} Δ[0] ⟶ C, join.inl _ _ ≫ q = U ∧ IsColimitDiagram q) ∧
      ∀ q : join simplexOp.{u} Δ[0] ⟶ C, join.inl _ _ ≫ q = U →
        (IsColimitDiagram q ↔ IsColimitDiagram (join.map (truncatedSimplexOpι n) (𝟙 _) ≫ q)) := by
  sorry

end NCategories

/-! ## Layer 9: Product-preserving simplicial functors and Bergner's comparison -/

section ProductPreserving

open HomotopicalAlgebra SSet.modelCategoryQuillen

/-- The weak homotopy equivalences, as a class of morphisms: Tau Ceti's
`SSet.IsWeakHomotopyEquivalence` (Kerodon, Definition 3.1.7.12). ModelCategoryTheory, Part
KanQuillen §3.1.1 owns it. (README Conventions, *Weak equivalences*; HTT, §A.2.7.) -/
def weakHomotopyEquivalences : MorphismProperty SSet.{u} :=
  fun _ _ f ↦ SSet.IsWeakHomotopyEquivalence f

variable (C : Type u) [SmallCategory C] [HasFiniteProducts C]

/-- The functors `C ⥤ SSet` preserving finite products, as a property of objects of `SSet^C`.
(README §9.1.1; HTT, Prop. 5.5.9.1, p. 534.) -/
def productPreservingFunctors : ObjectProperty (C ⥤ SSet.{u}) :=
  fun F ↦ PreservesFiniteProducts F

/-- The category `A` of functors `C ⥤ SSet` preserving finite products, a full subcategory of
`SSet^C`. (README §9.1.1; HTT, Prop. 5.5.9.1, p. 534.) -/
abbrev ProductPreserving : Type (u + 1) :=
  (productPreservingFunctors C).FullSubcategory

/-- The objectwise weak homotopy equivalences of the ordinary functor category `SSet^C`; not Part
SimplicialCategories' `objectwiseWeakEquivalences`, which lives on simplicial functors
`SSetDiagram C`. (README §9.1.1; HTT, Prop. 5.5.9.1.) -/
def functorObjectwiseWeakEquivalences : MorphismProperty (C ⥤ SSet.{u}) :=
  fun _ _ f ↦ ∀ c, weakHomotopyEquivalences (f.app c)

/-- The objectwise Kan fibrations of the ordinary functor category `SSet^C`; not Part
SimplicialCategories' `objectwiseFibrations`, which lives on simplicial functors `SSetDiagram C`.
(README §9.1.1; HTT, Prop. 5.5.9.1.) -/
def functorObjectwiseFibrations : MorphismProperty (C ⥤ SSet.{u}) :=
  fun _ _ f ↦ ∀ c, fibrations SSet.{u} (f.app c)

/-- Quillen's model structure on product-preserving functors: for a small category `C` with finite
products, the category `A` of functors `C ⥤ SSet` preserving finite products has a model
structure whose weak equivalences are the objectwise weak homotopy equivalences and whose
fibrations are the objectwise Kan fibrations. The README's model structure is also simplicial;
simplicial model categories have no carrier at the pins, so that clause is not stated.
(README §9.1.1; HTT, Prop. 5.5.9.1, p. 534.) -/
theorem exists_modelCategory_productPreserving :
    ∃ M : ModelCategory (ProductPreserving C),
      M.categoryWithWeakEquivalences.weakEquivalences =
          (functorObjectwiseWeakEquivalences C).inverseImage ((productPreservingFunctors C).ι) ∧
        M.categoryWithFibrations.fibrations =
          (functorObjectwiseFibrations C).inverseImage ((productPreservingFunctors C).ι) := by
  sorry

/-- A functor `F : C ⥤ SSet` preserves finite products up to weak homotopy equivalence: for every
finite family of objects of `C`, the comparison map from `F` of the product to the product of the
values is a weak homotopy equivalence. (README §9.3.1; HTT, Prop. 5.5.9.2, p. 535.) -/
def IsWeaklyProductPreserving (F : C ⥤ SSet.{u}) : Prop :=
  ∀ (J : Type) [Finite J] (c : J → C), weakHomotopyEquivalences (piComparison F c)

/-- The inclusion `G : A ⥤ SSet^C` as a morphism of localizers for the objectwise weak homotopy
equivalences. (README §9.3.1; HTT, Prop. 5.5.9.2.) -/
def productPreservingLocalizerMorphism :
    LocalizerMorphism
      ((functorObjectwiseWeakEquivalences C).inverseImage ((productPreservingFunctors C).ι))
      (functorObjectwiseWeakEquivalences C) where
  functor := (productPreservingFunctors C).ι
  map := fun _ _ _ h ↦ h

/-- Bergner's comparison on homotopy categories: the derived functor `RG : hA ⟶ h(SSet^C)` of the
inclusion, the functor induced on localizations at the objectwise weak homotopy equivalences, is
fully faithful, and its essential image consists of the functors preserving finite products up to
weak homotopy equivalence. (README §9.3.1; HTT, Prop. 5.5.9.2, p. 535.) -/
theorem nonempty_fullyFaithful_localizedFunctor_productPreserving {H₁ H₂ : Type*} [Category H₁]
    [Category H₂] (L₁ : ProductPreserving C ⥤ H₁) (L₂ : (C ⥤ SSet.{u}) ⥤ H₂)
    [L₁.IsLocalization
      ((functorObjectwiseWeakEquivalences C).inverseImage ((productPreservingFunctors C).ι))]
    [L₂.IsLocalization (functorObjectwiseWeakEquivalences C)] :
    Nonempty ((productPreservingLocalizerMorphism C).localizedFunctor L₁ L₂).FullyFaithful ∧
      ∀ X : H₂, ((productPreservingLocalizerMorphism C).localizedFunctor L₁ L₂).essImage X ↔
        ∃ F : C ⥤ SSet.{u}, IsWeaklyProductPreserving C F ∧ Nonempty (L₂.obj F ≅ X) := by
  sorry

end ProductPreserving

end TauCetiRoadmap.InfinityCategoryTheory.PresentableInfinityCategories

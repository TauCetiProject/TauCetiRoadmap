/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.Core
public import TauCeti.AlgebraicTopology.Quasicategory.FullSubcategory
public import TauCeti.AlgebraicTopology.Quasicategory.InitialVertex
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.Quasicategory.RightMappingSpace
public import TauCeti.AlgebraicTopology.Quasicategory.TerminalVertex
public import TauCeti.AlgebraicTopology.SimplicialNerve.Basic
public import TauCeti.AlgebraicTopology.SimplicialSet.AnodyneExtensions.LeftRight.Basic
public import TauCeti.AlgebraicTopology.SimplicialSet.Coslice
public import TauCeti.AlgebraicTopology.SimplicialSet.Fiber
public import TauCeti.AlgebraicTopology.SimplicialSet.Join.StdSimplex
public import TauCeti.AlgebraicTopology.SimplicialSet.KanComplex.HomotopyGroup
public import TauCeti.AlgebraicTopology.SimplicialSet.Slice
public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence
public import TauCeti.AlgebraicTopology.SimplicialSet.WeaklyContractible

/-!
# InfinityCategoryFoundations, straightening of right fibrations and the Joyal model structure: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, with `sorry` proofs, together with the simple definitions their
statements need: the limit and colimit vocabulary of Layer 1, categorical equivalences and categorical
fibrations, the covariant and contravariant classes over a base, pointwise equivalences, the ∞-category of
spaces with its universal fibrations and classifying maps, homotopy relative to the boundary, n-categories
and minimal inner fibrations.

Conventions of the file: a trivial fibration is a map in `(MorphismProperty.monomorphisms SSet).rlp`, a Kan
fibration a map in `SSet.modelCategoryQuillen.J.rlp`, and a contractible Kan complex is stated as a weakly
contractible one (`SSet.IsWeaklyContractible`), which is equivalent for Kan complexes. Categorical
equivalences are stated in Joyal's form (`IsCategoricalEquivalence`), which agrees with the definition of
README §2.1.6 through rigidification by README §9.7.2 (HTT, Prop. 2.2.5.8). A model structure is stated through its two weak factorization systems
rather than as a `HomotopicalAlgebra.ModelCategory` instance on a type synonym.

Not statable at the pins:
* rigidification `C[−]` of a simplicial set, its adjunction with the coherent nerve, its opposite and product
  comparisons and its values on horns (§2.1, §2.5, §7.1): there is no left Kan extension of
  `SimplicialThickening` to a functor out of simplicial sets; hence also the H-enriched homotopy category
  `hS`, the mapping objects `Map_S(x, y)`, fully faithful maps in HTT's sense, the agreement of the two
  homotopy categories and "categorical equivalence ⇔ fully faithful and essentially surjective" (§2.1, §2.6),
  the Bergner cofibrations of §6.1, straightening, unstraightening, the twisted realization and the
  straightening theorem (§7.1–§7.6), the universal fibration `Z₀ = Un_ε(ι)` of §7.7 (1)–(2), the mapping-space comparison, the
  comparison theorem and final objects through `hC` (§8.1, §8.2), the Quillen equivalence with the Bergner
  structure and `C[S × S′] ≃ C[S] × C[S′]` (§9.6), and the agreement of Joyal's form with HTT's definition
  (§9.7, HTT, Prop. 2.2.5.8);
* the left-homotopy form of HTT, Prop. 2.2.5.7 (§9.7): the Joyal structure is stated through weak
  factorization systems, with no model category instance and hence no left homotopies;
* the H-enriched homotopy categories of simplicial categories and their equivalences (§1.1),
  and the identification of HTT's equivalences of simplicial categories with Tau Ceti's Dwyer–Kan
  equivalences (§2.4): no homotopy category H of spaces as an enriching category;
* subcategories spanned by a subcategory of `hC` (§1.2): no carrier for a general subcategory of
  `SSet.hoFunctor.obj C`;
* the characterization of equivalences in a locally Kan simplicial category (§2.7) and of pointwise
  equivalences through mapping spaces (§7.4): no functor from a simplicial category to its homotopy category
  and no functoriality of `SSet.ihomOver` in the fibration at the pins;
* transport along left fibrations and the Kan-fibration criterion (§5.4), truncated morphisms (§10.7) and
  homotopy equivalences of fibers (§7.4): no homotopy category of spaces receiving a functor from
  `SSet.hoFunctor.obj S`, no homotopy fibers and no homotopy-equivalence predicate on Kan complexes;
* the simplicial enrichment of the covariant structure (§6.3) and the Quillen-adjunction form of base change:
  simplicial model categories are ModelCategoryTheory's and a roadmap file may not import another;
* the skeletal criterion for n-categories (§10.6) and truncated objects (§10.1): they need skeleta of maps,
  or mapping spaces `Map_C` through rigidification;
* the minimal-model clause of Prop. 2.3.4.18 (§10.6) and the k = −1, −2 cases: `IsTruncated` is ℕ-indexed.

`Kan`, `spaces` and the vocabulary of limits and colimits are this Part's; later Parts restate them with the
same bodies. `IsTruncated` repeats ModelCategoryTheory, Part KanQuillen's definition word for word.
-/

public section

universe u v

namespace TauCetiRoadmap.InfinityCategoryTheory.InfinityCategoryFoundations

open CategoryTheory Limits MonoidalCategory MonoidalClosed CartesianMonoidalCategory MorphismProperty
  Simplicial SSet Opposite

/-! ## Layer 1: Limits and colimits -/

section Diagrams

/-- README §1.2.3. A zero object: a vertex that is both initial and final; used for ∞-categories `C`.
(HTT, Def. 7.2.2.7, p. 743; HA, Def. 1.1.1.1, p. 17.) -/
def IsZeroObject {C : SSet.{u}} (x : C _⦋0⦌) : Prop :=
  C.IsInitialVertex x ∧ C.IsTerminalVertex x

/-- README §1.2.4. A map `p̄ : K ⋆ Δ[0] ⟶ C` out of the right cone is a *colimit diagram* when the cocone
it determines under `p = p̄|K`, a vertex of the coslice `C_{p/}`, is a colimit cocone in the sense of Tau
Ceti's `SSet.coslice.IsColimit`; used for ∞-categories `C`. (HTT, Def. 1.2.13.4.) -/
def IsColimitDiagram {K C : SSet.{u}} (q : join K Δ[0] ⟶ C) : Prop :=
  coslice.IsColimit (join.inl _ _ ≫ q)
    ((coslice.objEquiv (p := join.inl _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- README §1.2.4. A map `p̄ : Δ[0] ⋆ K ⟶ C` out of the left cone is a *limit diagram* when the cone it
determines over `p = p̄|K`, a vertex of the slice `C_{/p}`, is a limit cone in the sense of Tau Ceti's
`SSet.slice.IsLimit`; used for ∞-categories `C`. (HTT, Def. 1.2.13.4.) -/
def IsLimitDiagram {K C : SSet.{u}} (q : join Δ[0] K ⟶ C) : Prop :=
  slice.IsLimit (join.inr _ _ ≫ q)
    ((slice.objEquiv (p := join.inr _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- README §1.2.4. A functor `F : C ⟶ D` is *left exact* when it carries every limit diagram
`Δ[0] ⋆ K ⟶ C` with `K` finite (finitely many nondegenerate simplices) to a limit diagram. Used for
∞-categories `C` and `D` admitting finite limits. (HTT, Remark 5.3.2.10, with κ = ω.) -/
def IsLeftExact {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) [Finite K.N] (q : join Δ[0] K ⟶ C), IsLimitDiagram q → IsLimitDiagram (q ≫ F)

end Diagrams

section Squares

/-- README §1.2.4. The first coordinate of the span `Λ[2, 0]` inside the square: the vertices `0, 1, 2` go
to `0, 1, 0`. (HTT, §4.4.2.) -/
noncomputable def spanCoord₁ : (Λ[2, 0] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₀.isPushout.desc (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- README §1.2.4. The second coordinate of the span `Λ[2, 0]` inside the square: the vertices `0, 1, 2`
go to `0, 0, 1`. (HTT, §4.4.2.) -/
noncomputable def spanCoord₂ : (Λ[2, 0] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₀.isPushout.desc (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) (𝟙 _) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- README §1.2.4. The first coordinate of the cospan `Λ[2, 2]` inside the square: the vertices `0, 1, 2`
go to `1, 0, 1`. (HTT, §4.4.2.) -/
noncomputable def cospanCoord₁ : (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (𝟙 _) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- README §1.2.4. The second coordinate of the cospan `Λ[2, 2]` inside the square: the vertices
`0, 1, 2` go to `0, 1, 1`. (HTT, §4.4.2.) -/
noncomputable def cospanCoord₂ : (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- README §1.2.4. The square `Δ[1] × Δ[1]` read as a cocone `Λ[2, 0] ⋆ Δ[0]`: the span vertices go to
`(0, 0)`, `(1, 0)`, `(0, 1)` and the cone point to `(1, 1)`; this map is an isomorphism.
(HTT, §4.4.2.) -/
noncomputable def coconeShape : join (Λ[2, 0] : SSet.{u}) Δ[0] ⟶ Δ[1] ⊗ Δ[1] :=
  lift (join.map spanCoord₁ (𝟙 _) ≫ (join.stdSimplexIso 1 0).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 1))
    (join.map spanCoord₂ (𝟙 _) ≫ (join.stdSimplexIso 1 0).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 1))

/-- README §1.2.4. The square `Δ[1] × Δ[1]` read as a cone `Δ[0] ⋆ Λ[2, 2]`: the cone point goes to
`(0, 0)` and the cospan vertices to `(1, 0)`, `(0, 1)`, `(1, 1)`; this map is an isomorphism.
(HTT, §4.4.2.) -/
noncomputable def coneShape : join Δ[0] (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] ⊗ Δ[1] :=
  lift (join.map (𝟙 _) cospanCoord₁ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))
    (join.map (𝟙 _) cospanCoord₂ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))

/-- README §1.2.4. A square is a pushout square when, read as a cocone `Λ[2, 0] ⋆ Δ[0] ⟶ C` under its
span, it is a colimit diagram; used for ∞-categories `C`. (HTT, §4.4.2, with Def. 1.2.13.4.) -/
def IsPushoutSquare {C : SSet.{u}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsColimitDiagram (coconeShape ≫ s)

/-- README §1.2.4. A square is a pullback square when, read as a cone `Δ[0] ⋆ Λ[2, 2] ⟶ C` over its
cospan, it is a limit diagram; used for ∞-categories `C`. (HTT, §4.4.2, with Def. 1.2.13.4.) -/
def IsPullbackSquare {C : SSet.{u}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsLimitDiagram (coneShape ≫ s)

end Squares

/-! ## Layer 2: Homotopy categories, categorical equivalences and coherent nerves -/

/-- README §2.1.3. The homotopy category of the opposite is the opposite of the homotopy category,
naturally in the simplicial set. (HTT, §1.2.3 with Prop. 1.2.3.1, through the nerve adjunction.) -/
theorem nonempty_opFunctor_comp_hoFunctor_iso :
    Nonempty ((SSet.opFunctor : SSet.{u} ⥤ SSet.{u}) ⋙ SSet.hoFunctor ≅ SSet.hoFunctor ⋙ Cat.opFunctor) := by
  sorry

/-- README §2.1.6. A map `f : A ⟶ B` of simplicial sets is a categorical equivalence when, for every
∞-category `C`, restriction along `f` induces an equivalence of homotopy categories
`h Fun(B, C) ⥤ h Fun(A, C)`. This is Joyal's form (Kerodon, §4.5.4, Def. 4.5.4.1 with Prop. 4.5.4.8); it agrees with HTT's definition
through rigidification (HTT, Def. 1.1.5.14, p. 43, and Prop. 2.2.5.8, p. 112; README §9.7.2). -/
def IsCategoricalEquivalence {A B : SSet.{u}} (f : A ⟶ B) : Prop :=
  ∀ (C : SSet.{u}) [C.Quasicategory],
    (hoFunctor.map ((MonoidalClosed.pre f).app C)).toFunctor.IsEquivalence

/-- README §2.1.6. The class of categorical equivalences. (HTT, Def. 1.1.5.14.) -/
def categoricalEquivalences : MorphismProperty SSet.{u} :=
  fun _ _ f ↦ IsCategoricalEquivalence f

/-- README §2.2.1. A strict Segal simplicial set is the nerve of its homotopy category: the unit of the
adjunction between the homotopy category and the nerve is an isomorphism at `X`.
(HTT, Prop. 1.1.2.2.) -/
theorem isIso_nerveAdjunction_unit_app (X : SSet.{u}) [X.IsStrictSegal] :
    IsIso (nerveAdjunction.unit.app X) := by
  sorry

/-- README §2.6.1. The coherent nerve of a simplicial functor that is a Kan fibration on every mapping
simplicial set is an inner fibration; no fibrancy is assumed of the source or the target. (HTT, proof of
Prop. 1.1.5.10, as recorded in Remark 1.1.5.11.) -/
theorem innerFibration_simplicialNerveMap {C D : Type u} [Category.{v} C] [SimplicialCategory C]
    [Category.{v} D] [SimplicialCategory D] (F : EnrichedFunctor SSet.{v} C D)
    (hF : ∀ a b : C, SSet.modelCategoryQuillen.J.rlp (F.map a b)) :
    SSet.InnerFibration (simplicialNerveMap F) := by
  sorry

/-- README §2.6.2. The coherent nerve of a simplicial category whose mapping simplicial sets are discrete
is its nerve: Tau Ceti's comparison `SimplicialNerve.fromNerve` is an isomorphism.
(HTT, Example 1.1.5.8.) -/
theorem isIso_fromNerve_of_discrete (C : Type u) [Category.{v} C] [SimplicialCategory C]
    (hC : ∀ a b : C, ∃ ι : Type v,
      Nonempty ((a ⟶[SSet.{v}] b) ≅ (Functor.const SimplexCategoryᵒᵖ).obj ι)) :
    IsIso (SimplicialNerve.fromNerve C) := by
  sorry

/-! ## Layer 3: Left fibrations and left anodyne maps -/

/-- README §3.1.1. Left fibrations reflect equivalences: for a left fibration `q` out of an ∞-category,
an edge is an equivalence exactly when its image is. (HTT, Prop. 2.1.1.5.) -/
theorem isEquivalence_map_iff_of_leftFibration {X Y : SSet.{u}} [Quasicategory X] (q : X ⟶ Y)
    [LeftFibration q] {x₀ x₁ : X _⦋0⦌} (e : Edge x₀ x₁) :
    (e.map q).IsEquivalence ↔ e.IsEquivalence := by
  sorry

/-- README §3.1.2. Left fibrations lift equivalences with prescribed target: a commutative square from
the inclusion `Λ[1, 1] ⟶ Δ[1]` of the vertex `1` to a left fibration has a lift when its bottom edge is
an equivalence. (HTT, Prop. 2.1.1.6.) -/
theorem hasLift_of_isEquivalence_of_leftFibration {X Y : SSet.{u}} (q : X ⟶ Y) [LeftFibration q]
    {t : (Λ[1, 1] : SSet.{u}) ⟶ X} {b : Δ[1] ⟶ Y} (sq : CommSq t Λ[1, 1].ι q b)
    (hb : (Edge.mk' (yonedaEquiv b)).IsEquivalence) : sq.HasLift := by
  sorry

/-- README §3.2.1. Joyal's generators of the left anodyne maps, in lifting form: the inclusions
`(Δ[m] × {0}) ∪ (∂Δ[m] × Δ[1]) ⊆ Δ[m] × Δ[1]` have the left fibrations as their right lifting class, so
they generate the same weakly saturated class as the left horns. (HTT, Prop. 2.1.2.6.) -/
theorem rlp_unionProd_boundary_horn_eq_leftFibrations :
    (MorphismProperty.ofHoms fun m : ℕ ↦ (Subcomplex.unionProd ∂Δ[m] Λ[1, 0]).ι).rlp =
      leftFibrations.{u} := by
  sorry

/-- README §3.3.1. For a left fibration `p : X ⟶ S` and a left anodyne map `i : A ⟶ B` (left anodyne
maps are monomorphisms), the pullback-hom `X^B ⟶ X^A ×_{S^A} S^B` is a trivial fibration.
(HTT, Cor. 2.1.2.9, second assertion.) -/
theorem rlp_monomorphisms_pullbackObjObjπ_of_leftAnodyne {A B X S : SSet.{u}} (i : A ⟶ B)
    (hi : leftAnodyneExtensions i) (p : X ⟶ S) [LeftFibration p] :
    (monomorphisms SSet.{u}).rlp
      (Functor.PullbackObjObj.ofHasPullback MonoidalClosed.internalHom i p).π := by
  sorry

/-- README §3.3.2. Homotopy extension lifting property: `p` is a left fibration exactly when the
pullback-hom of the vertex inclusion `{0} ⟶ Δ[1]` and `p` is a trivial fibration. (HTT, Cor. 2.1.2.10.) -/
theorem leftFibration_iff_rlp_pullbackObjObjπ {X S : SSet.{u}} (p : X ⟶ S) :
    LeftFibration p ↔ (monomorphisms SSet.{u}).rlp
      (Functor.PullbackObjObj.ofHasPullback MonoidalClosed.internalHom
        (stdSimplex.{u}.δ (1 : Fin 2)) p).π := by
  sorry

/-- README §3.3.3. A section `s` of `p : X ⟶ S` admitting a homotopy `h` over `S` from `s ∘ p` to the
identity that is constant along the section is left anodyne. The constancy hypothesis `hc` is used by the
proof in HTT and cannot be dropped. (HTT, Prop. 2.1.2.11.) -/
theorem leftAnodyneExtensions_of_fiberwiseContraction {X S : SSet.{u}} (p : X ⟶ S) (s : S ⟶ X)
    (hs : s ≫ p = 𝟙 S) (h : X ⊗ Δ[1] ⟶ X)
    (hp : h ≫ p = CartesianMonoidalCategory.fst X Δ[1] ≫ p)
    (h₀ : SSet.ι₀ ≫ h = p ≫ s) (h₁ : SSet.ι₁ ≫ h = 𝟙 X)
    (hc : s ▷ Δ[1] ≫ h = CartesianMonoidalCategory.fst S Δ[1] ≫ s) :
    leftAnodyneExtensions s := by
  sorry

/-! ## Layer 4: Joins and slices -/

/-- README §4.1.1. Joyal's pushout-join lemma: for subcomplexes `A₀ ⊆ K` and `B₀ ⊆ L`, the pushout-join
`(A₀ ⋆ L) ∪ (K ⋆ B₀) ⊆ K ⋆ L` is inner anodyne when `A₀ ⊆ K` is right anodyne.
(HTT, Lemma 2.1.2.3.) -/
theorem innerAnodyneExtensions_unionJoin_ι_of_rightAnodyne {K L : SSet.{u}} (A₀ : K.Subcomplex)
    (B₀ : L.Subcomplex) (h : rightAnodyneExtensions A₀.ι) :
    innerAnodyneExtensions (A₀.unionJoin B₀).ι := by
  sorry

/-- README §4.1.1. The pushout-join `(A₀ ⋆ L) ∪ (K ⋆ B₀) ⊆ K ⋆ L` is inner anodyne when `B₀ ⊆ L` is left
anodyne. (HTT, Lemma 2.1.2.3.) -/
theorem innerAnodyneExtensions_unionJoin_ι_of_leftAnodyne {K L : SSet.{u}} (A₀ : K.Subcomplex)
    (B₀ : L.Subcomplex) (h : leftAnodyneExtensions B₀.ι) :
    innerAnodyneExtensions (A₀.unionJoin B₀).ι := by
  sorry

/-- README §4.1.1. The pushout-join `(A₀ ⋆ L) ∪ (K ⋆ B₀) ⊆ K ⋆ L` is left anodyne when `A₀ ⊆ K` is left
anodyne. (HTT, Lemma 2.1.2.4.) -/
theorem leftAnodyneExtensions_unionJoin_ι {K L : SSet.{u}} (A₀ : K.Subcomplex) (B₀ : L.Subcomplex)
    (h : leftAnodyneExtensions A₀.ι) : leftAnodyneExtensions (A₀.unionJoin B₀).ι := by
  sorry

/-- README §4.2.1. For maps `i : L ⟶ K`, `p : X ⟶ S` and `σ : K ⟶ X`, the map
`X_{σ/} ⟶ X_{i ≫ σ/} ×_{S_{i ≫ σ ≫ p/}} S_{σ ≫ p/}` which restricts a cocone under `σ` along `i` and
pushes it forward along `p`: the coslice form of Tau Ceti's `SSet.slice.restrictionMap`.
(HTT, Prop. 2.1.2.1.) -/
noncomputable def cosliceRestrictionMap {K L X S : SSet.{u}} (i : L ⟶ K) (p : X ⟶ S) (σ : K ⟶ X) :
    coslice σ ⟶ pullback (coslice.map (𝟙 L) p (by simp) : coslice (i ≫ σ) ⟶ coslice (i ≫ σ ≫ p))
      (coslice.map i (𝟙 S) (by simp) : coslice (σ ≫ p) ⟶ coslice (i ≫ σ ≫ p)) :=
  pullback.lift (coslice.map i (𝟙 X) (by simp)) (coslice.map (𝟙 K) p (by simp))
    (by rw [coslice.map_comp, coslice.map_comp]; simp)

/-- README §4.2.1. Joyal's theorem on coslices along an inner fibration: for a monomorphism `i : A ⟶ B`,
an inner fibration `q : X ⟶ S` and `σ : B ⟶ X`, the map `X_{σ/} ⟶ X_{σ|A/} ×_{S_{qσ|A/}} S_{qσ/}` is a
left fibration. (HTT, Prop. 2.1.2.1, first assertion.) -/
theorem leftFibration_cosliceRestrictionMap {A B X S : SSet.{u}} (i : A ⟶ B) [Mono i]
    (q : X ⟶ S) [InnerFibration q] (σ : B ⟶ X) :
    LeftFibration (cosliceRestrictionMap i q σ) := by
  sorry

/-- README §4.2.1. For a left fibration `q : X ⟶ S`, a monomorphism `i : A ⟶ B` and `σ : B ⟶ X`, the map
`X_{/σ} ⟶ X_{/σ|A} ×_{S_{/qσ|A}} S_{/qσ}` is a left fibration. (HTT, Prop. 2.1.2.1, second
assertion.) -/
theorem leftFibration_slice_restrictionMap {A B X S : SSet.{u}} (i : A ⟶ B) [Mono i]
    (q : X ⟶ S) [LeftFibration q] (σ : B ⟶ X) :
    LeftFibration (slice.restrictionMap i q σ) := by
  sorry

/-- README §4.3.1. For a quasicategory `C` and any diagram `p : K ⟶ C`, the coslice projection
`C_{p/} ⟶ C` is a left fibration. (HTT, Cor. 2.1.2.2.) -/
theorem leftFibration_coslice_π {K C : SSet.{u}} [Quasicategory C] (p : K ⟶ C) :
    LeftFibration (coslice.π p) := by
  sorry

/-- README §4.3.2. Restriction of coslices along a right anodyne map, for an inner fibration `π`, is a
trivial fibration. (HTT, Prop. 2.1.2.5, first case.) -/
theorem rlp_monomorphisms_cosliceRestrictionMap_of_rightAnodyne {A B S T : SSet.{u}} (i : A ⟶ B)
    (hi : rightAnodyneExtensions i) (π : S ⟶ T) [InnerFibration π] (p : B ⟶ S) :
    (monomorphisms SSet.{u}).rlp (cosliceRestrictionMap i π p) := by
  sorry

/-- README §4.3.2. Restriction of coslices along an anodyne map, for a left fibration `π`, is a trivial
fibration. (HTT, Prop. 2.1.2.5, second case.) -/
theorem rlp_monomorphisms_cosliceRestrictionMap_of_anodyne {A B S T : SSet.{u}} (i : A ⟶ B)
    (hi : anodyneExtensions i) (π : S ⟶ T) [LeftFibration π] (p : B ⟶ S) :
    (monomorphisms SSet.{u}).rlp (cosliceRestrictionMap i π p) := by
  sorry

/-! ## Layer 5: Kan complexes, mapping spaces, final objects and colimits -/

/-- README §5.1.1. A simplicial set is a Kan complex exactly when it is a quasicategory all of whose edges
are equivalences, that is, whose homotopy category is a groupoid. (HTT, Prop. 1.2.5.1, (1) ⇔ (4).) -/
theorem kanComplex_iff (C : SSet.{u}) :
    KanComplex C ↔ Quasicategory C ∧ ∀ ⦃x y : C _⦋0⦌⦄ (e : SSet.Edge x y), e.IsEquivalence := by
  sorry

/-- README §5.1.1. A simplicial set is a Kan complex exactly when its map to the point is a left
fibration, that is, when it has fillers for the horns `Λ[n, i]` with `i < n`.
(HTT, Prop. 1.2.5.1, (2) ⇔ (4).) -/
theorem kanComplex_iff_leftFibration (C : SSet.{u}) :
    KanComplex C ↔ LeftFibration (terminal.from C) := by
  sorry

/-- README §5.1.2. The core of a quasicategory is a Kan complex. (HTT, Prop. 1.2.5.3.) -/
theorem kanComplex_core (C : SSet.{u}) [Quasicategory C] : KanComplex (C.core : SSet.{u}) := by
  sorry

/-- README §5.2.2. The right mapping space `Hom^R_C(x, y)` of a quasicategory is a Kan complex.
(HTT, Prop. 1.2.2.3.) -/
theorem kanComplex_rightMappingSpace (C : SSet.{u}) [Quasicategory C] (x y : C _⦋0⦌) :
    KanComplex (C.rightMappingSpace x y : SSet.{u}) := by
  sorry

/-- README §5.3.1. A left fibration over a Kan complex is a Kan fibration. (HTT, Lemma 2.1.3.3.) -/
theorem rlp_J_of_leftFibration_of_kanComplex {X T : SSet.{u}} (p : X ⟶ T) [LeftFibration p]
    [KanComplex T] : SSet.modelCategoryQuillen.J.rlp p := by
  sorry

/-- README §5.3.2. A left fibration all of whose fibers are contractible is a trivial fibration.
(HTT, Lemma 2.1.3.4.) -/
theorem rlp_monomorphisms_of_leftFibration {X T : SSet.{u}} (p : X ⟶ T) [LeftFibration p]
    (hp : ∀ t : T _⦋0⦌, IsWeaklyContractible (SSet.fiber p t : SSet.{u})) :
    (monomorphisms SSet.{u}).rlp p := by
  sorry

/-- README §5.5.1. A vertex `y` is strongly final exactly when the slice projection `C_{/y} ⟶ C` is a
trivial fibration. (HTT, Def. 1.2.12.3, where the two forms are given as equivalent.) -/
theorem isTerminalVertex_iff_rlp_monomorphisms_slice_π (C : SSet.{u}) (y : C _⦋0⦌) :
    C.IsTerminalVertex y ↔ (monomorphisms SSet.{u}).rlp (slice.π (const y : Δ[0] ⟶ C)) := by
  sorry

/-- README §5.5.2. An object `y` of a quasicategory is strongly final exactly when every right mapping
space `Hom^R_C(x, y)` is contractible. (HTT, Prop. 1.2.12.4.) -/
theorem isTerminalVertex_iff_isWeaklyContractible (C : SSet.{u}) [Quasicategory C] (y : C _⦋0⦌) :
    SSet.IsTerminalVertex y ↔
      ∀ x : C _⦋0⦌, IsWeaklyContractible (C.rightMappingSpace x y : SSet.{u}) := by
  sorry

/-- README §5.5.3. The full subcategory of a quasicategory spanned by its strongly final objects is empty
or a contractible Kan complex. (HTT, Prop. 1.2.12.9.) -/
theorem rlp_monomorphisms_terminal_from_fullEnhancedSubcategory_isTerminalVertex (C : SSet.{u})
    [Quasicategory C] (h : ∃ y : C _⦋0⦌, SSet.IsTerminalVertex y) :
    (monomorphisms SSet.{u}).rlp
      (terminal.from (C.fullEnhancedSubcategory (fun y ↦ SSet.IsTerminalVertex y) : SSet.{u})) := by
  sorry

/-- README §5.5.4. Colimits are unique: the full subcategory of the coslice `C_{p/}` spanned by the
colimits of `p` is empty or a contractible Kan complex. (HTT, Prop. 1.2.12.9 applied to `C_{p/}ᵒᵖ`, as
recorded in Remark 1.2.13.5.) -/
theorem rlp_monomorphisms_terminal_from_colimits {K C : SSet.{u}} [Quasicategory C] (p : K ⟶ C)
    (h : ∃ c, coslice.IsColimit p c) :
    (monomorphisms SSet.{u}).rlp
      (terminal.from ((coslice p).fullEnhancedSubcategory (coslice.IsColimit p) : SSet.{u})) := by
  sorry

/-- README §5.5.5. Colimits in a full subcategory `C₀ ⊆ C` of a quasicategory are computed in `C`: a
cocone in `C₀` whose image in `C` is a colimit is a colimit in `C₀`. (HTT, Def. 1.2.13.4, with
Remark 1.2.13.7.) -/
theorem isColimit_of_isColimit_coslice_map_ι {K C : SSet.{u}} [Quasicategory C]
    (P : C _⦋0⦌ → Prop) (p : K ⟶ (C.fullEnhancedSubcategory P : SSet.{u})) (c : (coslice p) _⦋0⦌)
    (h : coslice.IsColimit (p ≫ (C.fullEnhancedSubcategory P).ι)
      ((coslice.map (𝟙 K) (C.fullEnhancedSubcategory P).ι (by simp)).app _ c)) :
    coslice.IsColimit p c := by
  sorry

/-- README §5.6.1. The inclusion of a final object of a quasicategory is right anodyne. (The statement
used in HTT, Prop. 4.4.4.5.) -/
theorem rightAnodyneExtensions_const_of_isTerminalVertex {C : SSet.{u}} [Quasicategory C]
    {x : C _⦋0⦌} (hx : C.IsTerminalVertex x) :
    rightAnodyneExtensions (const x : Δ[0] ⟶ C) := by
  sorry

/-- README §5.6.1. The inclusion of an initial object of a quasicategory is left anodyne. (The dual of the
statement used in HTT, Prop. 4.4.4.5.) -/
theorem leftAnodyneExtensions_const_of_isInitialVertex {C : SSet.{u}} [Quasicategory C]
    {x : C _⦋0⦌} (hx : C.IsInitialVertex x) :
    leftAnodyneExtensions (const x : Δ[0] ⟶ C) := by
  sorry

/-! ## Layer 6: The covariant and contravariant model structures -/

/-- README §6.1.1. Inner anodyne maps are categorical equivalences. (HTT, Lemma 2.2.5.2.) -/
theorem isCategoricalEquivalence_of_innerAnodyneExtensions {A B : SSet.{u}} (i : A ⟶ B)
    (hi : innerAnodyneExtensions i) : IsCategoricalEquivalence i := by
  sorry

section Cones

variable {S : SSet.{u}}

/-- README §6.2.1. The left cone `C◁(f) = S ⊔_X X◁` of a map `f : X ⟶ S`. (HTT, Def. 2.1.4.2.) -/
noncomputable abbrev leftCone (X : Over S) : SSet.{u} :=
  pushout X.hom (join.inr Δ[0] X.left)

/-- README §6.2.1. The map of left cones induced by a map over `S`. (HTT, Def. 2.1.4.2.) -/
noncomputable def leftConeMap {X Y : Over S} (f : X ⟶ Y) : leftCone X ⟶ leftCone Y :=
  pushout.map _ _ _ _ (𝟙 S) (join.map (𝟙 _) f.left) f.left (by simp) (join.inr_map _ _)

/-- README §6.2.1. The right cone `C▷(f) = S ⊔_X X▷` of a map `f : X ⟶ S`. (HTT, Def. 2.1.4.2.) -/
noncomputable abbrev rightCone (X : Over S) : SSet.{u} :=
  pushout X.hom (join.inl X.left Δ[0])

/-- README §6.2.1. The map of right cones induced by a map over `S`. (HTT, Def. 2.1.4.2.) -/
noncomputable def rightConeMap {X Y : Over S} (f : X ⟶ Y) : rightCone X ⟶ rightCone Y :=
  pushout.map _ _ _ _ (𝟙 S) (join.map f.left (𝟙 _)) f.left (by simp) (join.inl_map _ _)

/-- README §6.2.2. A map over `S` is a covariant equivalence when its map of left cones is a categorical
equivalence. (HTT, Def. 2.1.4.5.) -/
def IsCovariantEquivalence {X Y : Over S} (f : X ⟶ Y) : Prop :=
  IsCategoricalEquivalence (leftConeMap f)

variable (S) in
/-- README §6.2.2. The class of covariant equivalences over `S`. (HTT, Def. 2.1.4.5.) -/
def covariantEquivalences : MorphismProperty (Over S) :=
  fun _ _ f ↦ IsCovariantEquivalence f

variable (S) in
/-- README §6.2.2. The covariant fibrations over `S`: the right lifting class of the monomorphisms that
are covariant equivalences. (HTT, Def. 2.1.4.5.) -/
def covariantFibrations : MorphismProperty (Over S) :=
  (monomorphisms (Over S) ⊓ covariantEquivalences S).rlp

/-- README §6.4.1. A map `f` over `S` is a contravariant equivalence when `fᵒᵖ` is a covariant equivalence
over `Sᵒᵖ`. (HTT, Remark 2.1.4.12.) -/
def IsContravariantEquivalence {X Y : Over S} (f : X ⟶ Y) : Prop :=
  IsCovariantEquivalence ((Over.post SSet.opFunctor).map f)

variable (S) in
/-- README §6.4.1. The class of contravariant equivalences over `S`. (HTT, Remark 2.1.4.12.) -/
def contravariantEquivalences : MorphismProperty (Over S) :=
  fun _ _ f ↦ IsContravariantEquivalence f

variable (S) in
/-- README §6.4.1. The contravariant fibrations over `S`: the right lifting class of the monomorphisms
that are contravariant equivalences. (HTT, Remark 2.1.4.12.) -/
def contravariantFibrations : MorphismProperty (Over S) :=
  (monomorphisms (Over S) ⊓ contravariantEquivalences S).rlp

end Cones

/-- README §6.2.3. Left anodyne maps over `S` are covariant equivalences. (HTT, Lemma 2.1.4.6.) -/
theorem isCovariantEquivalence_of_leftAnodyneExtensions {S : SSet.{u}} {X Y : Over S} (f : X ⟶ Y)
    (hf : leftAnodyneExtensions f.left) : IsCovariantEquivalence f := by
  sorry

/-- README §6.2.3. Trivial fibrations over `S` are covariant equivalences. (HTT, proof of
Prop. 2.1.4.7.) -/
theorem isCovariantEquivalence_of_rlp_monomorphisms {S : SSet.{u}} {X Y : Over S} (f : X ⟶ Y)
    (hf : (monomorphisms SSet.{u}).rlp f.left) : IsCovariantEquivalence f := by
  sorry

/-- README §6.3.1. The covariant model structure, trivial cofibrations and fibrations: the monomorphisms
that are covariant equivalences and the covariant fibrations form a weak factorization system on
simplicial sets over `S`. (HTT, Prop. 2.1.4.7.) -/
theorem isWeakFactorizationSystem_covariantFibrations (S : SSet.{u}) :
    IsWeakFactorizationSystem (monomorphisms (Over S) ⊓ covariantEquivalences S)
      (covariantFibrations S) := by
  sorry

/-- README §6.3.1. The covariant model structure, trivial fibrations: the maps over `S` with the right
lifting property against all monomorphisms are the covariant fibrations that are covariant
equivalences. (HTT, Prop. 2.1.4.7.) -/
theorem rlp_monomorphisms_eq_covariantFibrations_inf (S : SSet.{u}) :
    (monomorphisms (Over S)).rlp = covariantFibrations S ⊓ covariantEquivalences S := by
  sorry

/-- README §6.3.1. Every covariant fibration is a left fibration. (HTT, Prop. 2.1.4.9 (2).) -/
theorem leftFibration_of_covariantFibrations {S : SSet.{u}} {X Y : Over S} (f : X ⟶ Y)
    (hf : covariantFibrations S f) : LeftFibration f.left := by
  sorry

/-- README §6.3.2. Composition with `j : S ⟶ S′` preserves covariant equivalences, so `j_! ⊣ j^*` is a
Quillen adjunction for the covariant structures. (HTT, Prop. 2.1.4.10.) -/
theorem isCovariantEquivalence_map {S S' : SSet.{u}} (j : S ⟶ S') {X Y : Over S} (f : X ⟶ Y)
    (hf : IsCovariantEquivalence f) : IsCovariantEquivalence ((Over.map j).map f) := by
  sorry

/-- README §6.4.1. A map over `S` is a contravariant equivalence exactly when its map of right cones is a
categorical equivalence. (HTT, Remark 2.1.4.12.) -/
theorem isContravariantEquivalence_iff {S : SSet.{u}} {X Y : Over S} (f : X ⟶ Y) :
    IsContravariantEquivalence f ↔ IsCategoricalEquivalence (rightConeMap f) := by
  sorry

/-- README §6.4.1. Right anodyne maps over `S` are contravariant equivalences. (HTT, Remark 2.1.4.12,
analogue of Prop. 2.1.4.9 (1).) -/
theorem isContravariantEquivalence_of_rightAnodyneExtensions {S : SSet.{u}} {X Y : Over S}
    (f : X ⟶ Y) (hf : rightAnodyneExtensions f.left) : IsContravariantEquivalence f := by
  sorry

/-- README §6.4.1. The contravariant model structure, trivial cofibrations and fibrations.
(HTT, Remark 2.1.4.12, with Prop. 2.1.4.7 over `Sᵒᵖ`.) -/
theorem isWeakFactorizationSystem_contravariantFibrations (S : SSet.{u}) :
    IsWeakFactorizationSystem (monomorphisms (Over S) ⊓ contravariantEquivalences S)
      (contravariantFibrations S) := by
  sorry

/-- README §6.4.1. The contravariant model structure, trivial fibrations. (HTT, Remark 2.1.4.12, with
Prop. 2.1.4.7 over `Sᵒᵖ`.) -/
theorem rlp_monomorphisms_eq_contravariantFibrations_inf (S : SSet.{u}) :
    (monomorphisms (Over S)).rlp = contravariantFibrations S ⊓ contravariantEquivalences S := by
  sorry

/-- README §6.4.1. Every contravariant fibration is a right fibration. (HTT, Remark 2.1.4.12, analogue of
Prop. 2.1.4.9 (2).) -/
theorem rightFibration_of_contravariantFibrations {S : SSet.{u}} {X Y : Over S} (f : X ⟶ Y)
    (hf : contravariantFibrations S f) : RightFibration f.left := by
  sorry

/-! ## Layer 7: Spaces, pointwise equivalences and classifying maps -/

/-- README §7.1.2. The simplicial category of small Kan complexes, the full simplicial subcategory of
simplicial sets, with the internal homs as mapping simplicial sets. (HTT, Def. 1.2.16.1.) -/
abbrev Kan : Type (u + 1) := ObjectProperty.FullSubcategory fun X : SSet.{u} ↦ X.KanComplex

/-- README §7.1.2. The ∞-category of spaces, the simplicial nerve of `Kan`, a large simplicial set.
(HTT, Def. 1.2.16.1.) -/
noncomputable abbrev spaces : SSet.{u + 1} := SimplicialNerve Kan.{u}

/-- README §7.1.2. The vertex `∗` of the ∞-category of spaces: the Kan complex `Δ[0]`.
(HTT, §3.3.2.) -/
noncomputable def spacesPoint : spaces.{u} _⦋0⦌ :=
  (SimplicialNerve.fromNerve Kan.{u}).app (op ⦋0⦌)
    (ComposableArrows.mk₀ ⟨Δ[0], kanComplex_of_isTerminal stdSimplex.isTerminalObj₀⟩)

/-- README §7.1.6. The universal left fibration `S_{∗/} ⟶ S`, the coslice projection under `∗`.
(HTT, §3.3.2, Cor. 3.3.2.8.) -/
noncomputable def universalLeftFibration : coslice (const spacesPoint.{u} : Δ[0] ⟶ spaces.{u}) ⟶
    spaces.{u} :=
  coslice.π _

/-- README §7.1.6. The universal right fibration, the opposite `(S_{∗/})ᵒᵖ ⟶ Sᵒᵖ` of the universal left
fibration; through Tau Ceti's `SSet.coslice.opSliceIso` it is the slice projection `(Sᵒᵖ)_{/∗} ⟶ Sᵒᵖ`.
Here `Sᵒᵖ` is the opposite simplicial set of `S`, isomorphic to the coherent nerve of `Kanᵒᵖ`.
(HTT, §3.3.2, Prop. 3.3.2.5 and Cor. 3.3.2.7.) -/
noncomputable def universalRightFibration :
    SSet.opFunctor.obj (coslice (const spacesPoint.{u} : Δ[0] ⟶ spaces.{u})) ⟶
      SSet.opFunctor.obj spaces.{u} :=
  SSet.opFunctor.map universalLeftFibration

/-- README §7.1.7. A map `f` over `S` is a pointwise equivalence when the induced map of fibers
`X_s ⟶ Y_s` (pullbacks along `s : Δ[0] ⟶ S`) is a weak homotopy equivalence at every vertex `s`; used
for right fibrations and for left fibrations. (HTT, Def. 2.2.3.2, in the weak-equivalence form.) -/
def IsPointwiseEquivalence {S : SSet.{u}} {X Y : Over S} (f : X ⟶ Y) : Prop :=
  ∀ s : S _⦋0⦌, SSet.IsWeakHomotopyEquivalence
    (pullback.map X.hom (const s : Δ[0] ⟶ S) Y.hom (const s) f.left (𝟙 _) (𝟙 _) (by simp) (by simp))

/-- README §7.1.8. A map `g : K ⟶ Sᵒᵖ` classifies `X ⟶ K` when `X` and the pullback of the universal
right fibration along `g` are joined by a finite zigzag of pointwise equivalences of right fibrations
over `K`. (HTT, §3.3.2, Prop. 3.3.2.5, unmarked form.) -/
def Classifies {K : SSet.{u + 1}} (X : Over K) (g : K ⟶ SSet.opFunctor.obj spaces.{u}) : Prop :=
  Relation.EqvGen (fun A B : Over K ↦
      RightFibration A.hom ∧ RightFibration B.hom ∧ ∃ f : A ⟶ B, IsPointwiseEquivalence f) X
    (Over.mk (pullback.fst g universalRightFibration))

/-- README §7.1.8. A map `g : K ⟶ S` classifies a left fibration `X ⟶ K` when `X` and the pullback of the
universal left fibration along `g` are joined by a finite zigzag of pointwise equivalences of left
fibrations over `K`. (HTT, §3.3.2, Cor. 3.3.2.8, unmarked form.) -/
def ClassifiesLeft {K : SSet.{u + 1}} (X : Over K) (g : K ⟶ spaces.{u}) : Prop :=
  Relation.EqvGen (fun A B : Over K ↦
      LeftFibration A.hom ∧ LeftFibration B.hom ∧ ∃ f : A ⟶ B, IsPointwiseEquivalence f) X
    (Over.mk (pullback.fst g universalLeftFibration))

/-- README §7.6.1. A map `X ⟶ S` is a right fibration exactly when it is fibrant in the contravariant
model structure over `S`. (HTT, Cor. 2.2.3.12.) -/
theorem rightFibration_iff_contravariantFibrations {S : SSet.{u}} (X : Over S) :
    RightFibration X.hom ↔
      contravariantFibrations S (Over.homMk X.hom : X ⟶ Over.mk (𝟙 S)) := by
  sorry

/-- README §7.6.1. A map `X ⟶ S` is a left fibration exactly when it is fibrant in the covariant model
structure over `S`. (HTT, Cor. 2.2.3.12, dual form.) -/
theorem leftFibration_iff_covariantFibrations {S : SSet.{u}} (X : Over S) :
    LeftFibration X.hom ↔ covariantFibrations S (Over.homMk X.hom : X ⟶ Over.mk (𝟙 S)) := by
  sorry

/-- README §7.6.1. A map between right fibrations over `S` is a contravariant equivalence exactly when it
is a pointwise equivalence. (HTT, Cor. 2.2.3.13.) -/
theorem isContravariantEquivalence_iff_isPointwiseEquivalence {S : SSet.{u}} {X Y : Over S}
    [RightFibration X.hom] [RightFibration Y.hom] (f : X ⟶ Y) :
    IsContravariantEquivalence f ↔ IsPointwiseEquivalence f := by
  sorry

/-- README §7.7.1 (3). Every small right fibration is classified by a map to `Sᵒᵖ`. The base and total
space live in `SSet.{u + 1}`, where maps to `Sᵒᵖ` live, and are `u`-small simplexwise.
(HTT, Props. 3.3.2.5 and 3.3.2.6, unmarked form.) -/
theorem exists_classifies {K X : SSet.{u + 1}} (q : X ⟶ K) [RightFibration q]
    (hK : ∀ n : SimplexCategoryᵒᵖ, Small.{u} (K.obj n))
    (hX : ∀ n : SimplexCategoryᵒᵖ, Small.{u} (X.obj n)) :
    ∃ g : K ⟶ SSet.opFunctor.obj spaces.{u}, Classifies (Over.mk q) g := by
  sorry

/-- README §7.7.1 (4). Every small left fibration is classified by a map to `S`. The base and total
space live in `SSet.{u + 1}` and are `u`-small simplexwise. (HTT, Cor. 3.3.2.8, unmarked form.) -/
theorem exists_classifiesLeft {K X : SSet.{u + 1}} (q : X ⟶ K) [LeftFibration q]
    (hK : ∀ n : SimplexCategoryᵒᵖ, Small.{u} (K.obj n))
    (hX : ∀ n : SimplexCategoryᵒᵖ, Small.{u} (X.obj n)) :
    ∃ g : K ⟶ spaces.{u}, ClassifiesLeft (Over.mk q) g := by
  sorry

/-- README §7.7.2 (5). Equivalent maps to `Sᵒᵖ` classify pointwise equivalent right fibrations: an
equivalence `h` of `Fun(K, Sᵒᵖ)` from `p` to `p′` gives a pointwise equivalence from the pullback of the
universal right fibration along `p′` to that along `p`. (The half of the uniqueness of classifying maps
used in the proof of HTT, Prop. 3.3.4.5.) -/
theorem exists_isPointwiseEquivalence_of_isEquivalence {K : SSet.{u + 1}}
    (p p' : K ⟶ SSet.opFunctor.obj spaces.{u}) (h : K ⊗ Δ[1] ⟶ SSet.opFunctor.obj spaces.{u})
    (h₀ : lift (𝟙 K) (const (stdSimplex.obj₀Equiv.symm 0)) ≫ h = p)
    (h₁ : lift (𝟙 K) (const (stdSimplex.obj₀Equiv.symm 1)) ≫ h = p')
    (he : (Edge.mk' (yonedaEquiv (MonoidalClosed.curry h))).IsEquivalence) :
    ∃ f : Over.mk (pullback.fst p' universalRightFibration) ⟶
        Over.mk (pullback.fst p universalRightFibration),
      IsPointwiseEquivalence f := by
  sorry

/-! ## Layer 8: Colimits in slices -/

/-- README §8.3.1. Colimits in a slice are detected in the underlying ∞-category: when `p₀`, the
composite of `p : K ⟶ C_{/q}` with the projection, has a colimit in `C`, an extension
`p̃ : K ⋆ Δ[0] ⟶ C_{/q}` of `p` is a colimit diagram exactly when its image in `C` is.
(HTT, Prop. 1.2.13.8 (2).) -/
theorem isColimitDiagram_iff_comp_slice_π {K T C : SSet.{u}} [Quasicategory C] (q : T ⟶ C)
    (r : join K Δ[0] ⟶ slice q)
    (h : ∃ c, coslice.IsColimit (join.inl K Δ[0] ≫ r ≫ slice.π q) c) :
    IsColimitDiagram r ↔ IsColimitDiagram (r ≫ slice.π q) := by
  sorry

/-- README §8.3.1. If the image of `p : K ⟶ C_{/q}` in `C` has a colimit, then `p` has a colimit in the
slice. (HTT, Prop. 1.2.13.8 (1).) -/
theorem exists_isColimitDiagram_slice {K T C : SSet.{u}} [Quasicategory C] (q : T ⟶ C)
    (p : K ⟶ slice q) (h : ∃ c, coslice.IsColimit (p ≫ slice.π q) c) :
    ∃ r : join K Δ[0] ⟶ slice q, join.inl K Δ[0] ≫ r = p ∧ IsColimitDiagram r := by
  sorry

/-! ## Layer 9: Inner anodyne maps and the Joyal model structure -/

/-- README §9.1.1. The inclusions `(Δ[m] × Λ[2, 1]) ∪ (∂Δ[m] × Δ[2]) ⊆ Δ[m] × Δ[2]` have the inner
fibrations as their right lifting class. (HTT, Prop. 2.3.2.1.) -/
theorem rlp_unionProd_boundary_horn_eq_innerFibrations :
    (MorphismProperty.ofHoms fun m : ℕ ↦ (Subcomplex.unionProd ∂Δ[m] Λ[2, 1]).ι).rlp =
      innerFibrations.{u} := by
  sorry

/-- README §9.2.1. A simplicial set is an ∞-category exactly when restriction
`Fun(Δ[2], C) ⟶ Fun(Λ[2, 1], C)` is a trivial fibration. (HTT, Cor. 2.3.2.2.) -/
theorem quasicategory_iff_rlp_pre_horn (C : SSet.{u}) :
    C.Quasicategory ↔
      (monomorphisms SSet.{u}).rlp ((MonoidalClosed.pre Λ[2, 1].ι).app C) := by
  sorry

/-- README §9.2.2. For an inner fibration `p` and an inner anodyne map `i`, the pullback-hom
`X^B ⟶ X^A ×_{S^A} S^B` is a trivial fibration. (HTT, Cor. 2.3.2.5, second half.) -/
theorem rlp_monomorphisms_pullbackObjObjπ_of_innerAnodyne {A B X S : SSet.{u}} (i : A ⟶ B)
    (hi : innerAnodyneExtensions i) (p : X ⟶ S) [InnerFibration p] :
    (monomorphisms SSet.{u}).rlp
      (Functor.PullbackObjObj.ofHasPullback MonoidalClosed.internalHom i p).π := by
  sorry

/-- README §9.3.1. Products with a fixed simplicial set preserve categorical equivalences.
(HTT, Cor. 2.2.5.4.) -/
theorem isCategoricalEquivalence_whiskerRight {A B : SSet.{u}} (f : A ⟶ B)
    (hf : IsCategoricalEquivalence f) (K : SSet.{u}) :
    IsCategoricalEquivalence (f ▷ K) := by
  sorry

/-- README §9.4.1. A categorical fibration is a map with the right lifting property against every
monomorphism that is a categorical equivalence: the fibrations of the Joyal model structure. The planned
Tau Ceti declaration is the predicate `SSet.CategoricalFibration` with this definition.
(HTT, §2.2.5, in the proof of Thm. 2.2.5.1.) -/
def categoricalFibrations : MorphismProperty SSet.{u} :=
  (monomorphisms SSet.{u} ⊓ categoricalEquivalences).rlp

/-- README §9.4.1. Every categorical fibration is an inner fibration. (HTT, §2.2.5, with
Lemma 2.2.5.2.) -/
theorem innerFibration_of_categoricalFibrations {X Y : SSet.{u}} (p : X ⟶ Y)
    (hp : categoricalFibrations p) : InnerFibration p := by
  sorry

/-- README §9.5.1. The Joyal model structure, trivial cofibrations and fibrations: the monomorphisms that
are categorical equivalences and the categorical fibrations form a weak factorization system.
(HTT, Thm. 2.2.5.1.) -/
theorem isWeakFactorizationSystem_categoricalFibrations :
    IsWeakFactorizationSystem (monomorphisms SSet.{u} ⊓ categoricalEquivalences)
      categoricalFibrations.{u} := by
  sorry

/-- README §9.5.1. The Joyal model structure, trivial fibrations: the maps with the right lifting
property against all monomorphisms are exactly the categorical fibrations that are categorical
equivalences. (HTT, Thm. 2.2.5.1.) -/
theorem rlp_monomorphisms_eq_categoricalFibrations_inf :
    (monomorphisms SSet.{u}).rlp = categoricalFibrations.{u} ⊓ categoricalEquivalences := by
  sorry

/-- README §9.5.2. Joyal's theorem: a simplicial set is fibrant in the Joyal model structure exactly when
it is an ∞-category. (HTT, Thm. 2.4.6.1.) -/
theorem quasicategory_iff_categoricalFibrations (C : SSet.{u}) :
    C.Quasicategory ↔ categoricalFibrations (terminal.from C) := by
  sorry

/-- README §9.5.3. The Joyal model structure is Cartesian: the pushout-product of monomorphisms is a
categorical equivalence when one of them is. (A consequence of HTT, Cor. 2.2.5.4, by the README route.) -/
theorem isCategoricalEquivalence_pushoutObjObjι {A B K L : SSet.{u}} (i : A ⟶ B) (j : K ⟶ L)
    [Mono i] [Mono j] (hi : IsCategoricalEquivalence i) :
    IsCategoricalEquivalence (Functor.PushoutObjObj.ofHasPushout (curriedTensor SSet.{u}) i j).ι := by
  sorry

/-- README §9.5.3. For an ∞-category `X` and a monomorphism `j : K ⟶ L`, restriction
`Fun(L, X) ⟶ Fun(K, X)` is a categorical fibration. (HTT, Cor. 2.2.5.4, as used in the proof of
Prop. 1.2.7.3.) -/
theorem categoricalFibrations_pre_app {K L : SSet.{u}} (j : K ⟶ L) [Mono j] (X : SSet.{u})
    [X.Quasicategory] : categoricalFibrations ((MonoidalClosed.pre j).app X) := by
  sorry

/-- README §9.5.3. For an ∞-category `X` and a monomorphism `j : K ⟶ L` that is a categorical
equivalence, restriction `Fun(L, X) ⟶ Fun(K, X)` is a trivial fibration. (HTT, Cor. 2.2.5.4, as used in
the proof of Prop. 1.2.7.3.) -/
theorem rlp_monomorphisms_pre_app {K L : SSet.{u}} (j : K ⟶ L) [Mono j]
    (hj : IsCategoricalEquivalence j) (X : SSet.{u}) [X.Quasicategory] :
    (monomorphisms SSet.{u}).rlp ((MonoidalClosed.pre j).app X) := by
  sorry

/-! ## Layer 10: Minimal models, n-categories and truncation -/

/-- README §10.1.1. Two simplices `Δ[n] ⟶ C` are homotopic relative to `∂Δ[n]`, in the explicit form: a
map `Δ[n] × Δ[1] ⟶ C` from one to the other, constant on the boundary, whose edge at every vertex is an
equivalence. This is the case `S = Δ[0]`, `A = ∂Δ[n]` of homotopy relative to a subcomplex.
(HTT, §2.3.3 and Def. 2.3.4.1.) -/
def HomotopicRelBoundary {C : SSet.{u}} {n : ℕ} (f f' : Δ[n] ⟶ C) : Prop :=
  ∃ F : Δ[n] ⊗ Δ[1] ⟶ C,
    lift (𝟙 _) (SSet.const (SSet.stdSimplex.obj₀Equiv.symm 0)) ≫ F = f ∧
    lift (𝟙 _) (SSet.const (SSet.stdSimplex.obj₀Equiv.symm 1)) ≫ F = f' ∧
    (∂Δ[n]).ι ▷ Δ[1] ≫ F = fst _ _ ≫ (∂Δ[n]).ι ≫ f ∧
    ∀ b : Δ[n] _⦋0⦌,
      (SSet.Edge.mk' (SSet.yonedaEquiv (lift (SSet.const b) (𝟙 Δ[1]) ≫ F))).IsEquivalence

/-- README §10.1.1. Two simplices `Δ[n] ⟶ X` are homotopic over `S` relative to `∂Δ[n]`, for
`p : X ⟶ S`, in the explicit form: a map `F : Δ[n] × Δ[1] ⟶ X` from one to the other over the
projection, constant on the boundary, whose edge at every vertex lies in a fiber of `p` and is an
equivalence of that fiber. Used for inner fibrations `p`. (HTT, §2.3.3.) -/
def HomotopicRelBoundaryOver {X S : SSet.{u}} (p : X ⟶ S) {n : ℕ} (f f' : Δ[n] ⟶ X) : Prop :=
  ∃ F : Δ[n] ⊗ Δ[1] ⟶ X,
    lift (𝟙 _) (SSet.const (SSet.stdSimplex.obj₀Equiv.symm 0)) ≫ F = f ∧
    lift (𝟙 _) (SSet.const (SSet.stdSimplex.obj₀Equiv.symm 1)) ≫ F = f' ∧
    (∂Δ[n]).ι ▷ Δ[1] ≫ F = fst _ _ ≫ (∂Δ[n]).ι ≫ f ∧
    F ≫ p = fst _ _ ≫ f ≫ p ∧
    ∀ b : Δ[n] _⦋0⦌, ∃ hb : Subcomplex.range (lift (SSet.const b) (𝟙 Δ[1]) ≫ F) ≤
        SSet.fiber p (p.app _ (f.app _ b)),
      (SSet.Edge.mk' (SSet.yonedaEquiv (Subcomplex.lift _ hb))).IsEquivalence

/-- README §10.1.2. An `n`-category, for an integer `n ≥ −1`: an ∞-category in which `n`-simplices
homotopic relative to their boundary are equal, and `m`-simplices with `m > n` agreeing on their boundary
are equal. No simplicial set is an `n`-category for `n < −1`. (HTT, Def. 2.3.4.1.) -/
structure IsNCategory (n : ℤ) (C : SSet.{u}) : Prop where
  neg_one_le : -1 ≤ n
  quasicategory : C.Quasicategory
  eq_of_homotopicRelBoundary (k : ℕ) (hk : (k : ℤ) = n) (f f' : Δ[k] ⟶ C) :
    HomotopicRelBoundary f f' → f = f'
  eq_of_boundary (m : ℕ) (hm : n < m) (f f' : Δ[m] ⟶ C) :
    (∂Δ[m]).ι ≫ f = (∂Δ[m]).ι ≫ f' → f = f'

/-- README §10.6.4. A Kan complex `X` is `n`-truncated when `π m X x` is trivial for every vertex `x` and
every `m > n`. This repeats ModelCategoryTheory, Part KanQuillen's definition (its §5.1.1), which owns it.
(HTT, Def. 2.3.4.15, for n ≥ 0.) -/
def IsTruncated (n : ℕ) (X : SSet.{u}) [KanComplex X] : Prop :=
  ∀ (m : ℕ), n < m → ∀ x : X _⦋0⦌, Subsingleton (KanComplex.π m X x)

/-- README §10.2.1. The relative form of Joyal's outer-horn lemma: for an inner fibration `p : C ⟶ D`
between ∞-categories, a horn `Λ[n + 2, 0] ⟶ C` over a simplex of `D` whose first edge is an equivalence
of `C` has a filler over that simplex. (The relative form of HTT, Prop. 1.2.4.3; HTT, Prop. 2.4.1.5 with
Remark 2.4.1.4, in the case of equivalences.) -/
theorem exists_fill_horn_zero_of_innerFibration {C D : SSet.{u}} [Quasicategory C] [Quasicategory D]
    (p : C ⟶ D) [InnerFibration p] (n : ℕ) (σ₀ : (Λ[n + 2, 0] : SSet.{u}) ⟶ C) (τ : Δ[n + 2] ⟶ D)
    (w : σ₀ ≫ p = Λ[n + 2, 0].ι ≫ τ)
    (he : (Edge.mk' (σ₀.app _ (horn.edge (n + 2) 0 0 1 (Fin.zero_le _) (by simp)))).IsEquivalence) :
    ∃ σ : Δ[n + 2] ⟶ C, σ₀ = Λ[n + 2, 0].ι ≫ σ ∧ σ ≫ p = τ := by
  sorry

/-- README §10.2.2. The prism form: for an inner fibration `p : X ⟶ S` and `σ : Δ[n] ⟶ S`, a map
`h₀ : (Δ[n] × {0}) ∪ (∂Δ[n] × Δ[1]) ⟶ X` over `σ ∘ pr` whose edge `h₀|{0} × Δ[1]` is an equivalence of the
fiber `X_{σ(0)}` extends to `Δ[n] × Δ[1]` over `σ ∘ pr`. For `n = 0` the edge hypothesis is vacuous, as
`{0} × Δ[1]` does not lie in the source. (HTT, Prop. 2.4.1.8, in the case of fiber equivalences.) -/
theorem exists_extension_unionProd_of_isEquivalence {X S : SSet.{u}} (p : X ⟶ S) [InnerFibration p]
    (n : ℕ) (σ : Δ[n] ⟶ S) (h₀ : ((∂Δ[n]).unionProd Λ[1, 0] : SSet.{u}) ⟶ X)
    (w : h₀ ≫ p = ((∂Δ[n]).unionProd Λ[1, 0]).ι ≫ fst _ _ ≫ σ)
    (he : ∀ e : Δ[1] ⟶ ((∂Δ[n]).unionProd Λ[1, 0] : SSet.{u}),
      e ≫ ((∂Δ[n]).unionProd Λ[1, 0]).ι =
          lift (SSet.const (stdSimplex.obj₀Equiv.symm 0)) (𝟙 Δ[1]) →
        ∃ hb : Subcomplex.range (e ≫ h₀) ≤ SSet.fiber p (σ.app _ (stdSimplex.obj₀Equiv.symm 0)),
          (Edge.mk' (yonedaEquiv (Subcomplex.lift _ hb))).IsEquivalence) :
    ∃ h : Δ[n] ⊗ Δ[1] ⟶ X, ((∂Δ[n]).unionProd Λ[1, 0]).ι ≫ h = h₀ ∧ h ≫ p = fst _ _ ≫ σ := by
  sorry

/-- README §10.2.3. The relative pointwise criterion: for an inner fibration `p : X ⟶ S` and a
monomorphism `i : A ⟶ B`, an edge `F : B × Δ[1] ⟶ X` of the fiber `Y` of the pullback-hom
`X^B ⟶ X^A ×_{S^A} S^B` over a vertex `w` is an equivalence of `Y` exactly when every edge
`F|{b} × Δ[1]` is an equivalence of the fiber of `p` containing it. (Joyal; HTT, Prop. 3.1.2.1 (2), over a
point, for `S = Δ[0]` and `A = ∅`; Kerodon, Thm. 4.4.4.4.) -/
theorem isEquivalence_fiber_pullbackObjObjπ_iff {A B X S : SSet.{u}} (i : A ⟶ B) [Mono i]
    (p : X ⟶ S) [InnerFibration p]
    (w : (Functor.PullbackObjObj.ofHasPullback MonoidalClosed.internalHom i p).pt _⦋0⦌)
    (F : B ⊗ Δ[1] ⟶ X)
    (hF : Subcomplex.range (MonoidalClosed.curry F) ≤
      SSet.fiber (Functor.PullbackObjObj.ofHasPullback MonoidalClosed.internalHom i p).π w) :
    (Edge.mk' (yonedaEquiv (Subcomplex.lift _ hF))).IsEquivalence ↔
      ∀ b : B _⦋0⦌, ∃ hb : Subcomplex.range (lift (SSet.const b) (𝟙 Δ[1]) ≫ F) ≤
          SSet.fiber p (yonedaEquiv
            ((lift (SSet.const b) (SSet.const (stdSimplex.obj₀Equiv.symm 0)) : Δ[0] ⟶ B ⊗ Δ[1]) ≫
              F ≫ p)),
        (Edge.mk' (yonedaEquiv (Subcomplex.lift _ hb))).IsEquivalence := by
  sorry

/-- README §10.2.4. Joyal's description of the categorical fibrations over an ∞-category: they are the
inner fibrations along which equivalences lift with prescribed source to equivalences.
(HTT, Cor. 2.4.6.5; Kerodon, Def. 4.5.6.5 and Prop. 4.5.6.1.) -/
theorem categoricalFibration_iff_innerFibration_and_exists_lift {C D : SSet.{u}} [Quasicategory D]
    (p : C ⟶ D) :
    categoricalFibrations p ↔ InnerFibration p ∧
      ∀ (t : (Λ[1, 0] : SSet.{u}) ⟶ C) (b : Δ[1] ⟶ D), t ≫ p = Λ[1, 0].ι ≫ b →
        (Edge.mk' (yonedaEquiv b)).IsEquivalence →
          ∃ l : Δ[1] ⟶ C, Λ[1, 0].ι ≫ l = t ∧ l ≫ p = b ∧
            (Edge.mk' (yonedaEquiv l)).IsEquivalence := by
  sorry

/-- README §10.3.1. An inner fibration `p : X ⟶ S` is minimal when any two simplices of `X` that are
homotopic over `S` relative to their boundary are equal. (HTT, Def. 2.3.3.1.) -/
def IsMinimalInnerFibration {X S : SSet.{u}} (p : X ⟶ S) : Prop :=
  InnerFibration p ∧ ∀ (n : ℕ) (f f' : Δ[n] ⟶ X), HomotopicRelBoundaryOver p f f' → f = f'

/-- README §10.4.1 and §10.5.2. Minimal models: an inner fibration `p : X ⟶ S` has a simplicial subset
`X₀ ⊆ X` with a retraction `r` over `S` such that `p|X₀` is a minimal inner fibration, `r` is homotopic
over `S` to the identity relative to `X₀` through fiber equivalences, and `X₀ ×_S T ⊆ X ×_S T` is a
categorical equivalence for every `T ⟶ S`. (HTT, Prop. 2.3.3.8.) -/
theorem exists_isMinimalInnerFibration {X S : SSet.{u}} (p : X ⟶ S) [InnerFibration p] :
    ∃ (X₀ : X.Subcomplex) (r : X ⟶ X₀), X₀.ι ≫ r = 𝟙 _ ∧ r ≫ X₀.ι ≫ p = p ∧
      IsMinimalInnerFibration (X₀.ι ≫ p) ∧
      (∃ h : X ⊗ Δ[1] ⟶ X,
        lift (𝟙 _) (SSet.const (SSet.stdSimplex.obj₀Equiv.symm 0)) ≫ h = 𝟙 X ∧
        lift (𝟙 _) (SSet.const (SSet.stdSimplex.obj₀Equiv.symm 1)) ≫ h = r ≫ X₀.ι ∧
        X₀.ι ▷ Δ[1] ≫ h = fst _ _ ≫ X₀.ι ∧ h ≫ p = fst _ _ ≫ p ∧
        ∀ x : X _⦋0⦌, ∃ hx : Subcomplex.range (lift (SSet.const x) (𝟙 Δ[1]) ≫ h) ≤
            SSet.fiber p (p.app _ x),
          (SSet.Edge.mk' (SSet.yonedaEquiv (Subcomplex.lift _ hx))).IsEquivalence) ∧
      ∀ (T : SSet.{u}) (g : T ⟶ S),
        IsCategoricalEquivalence (pullback.map (X₀.ι ≫ p) g p g X₀.ι (𝟙 T) (𝟙 S) (by simp) (by simp)) := by
  sorry

/-- README §10.5.1. Categorical equivalences after base change are tested over simplices: if the base
changes of `f : X ⟶ Y` over `Z` along every simplex of `Z` are categorical equivalences, so are its base
changes along every `T ⟶ Z`. (HTT, Prop. 3.2.2.8.) -/
theorem isCategoricalEquivalence_pullback_map_of_stdSimplex {X Y Z : SSet.{u}} (f : X ⟶ Y)
    (g : Y ⟶ Z)
    (h : ∀ (n : ℕ) (σ : Δ[n] ⟶ Z),
      IsCategoricalEquivalence (pullback.map (f ≫ g) σ g σ f (𝟙 _) (𝟙 _) (by simp) (by simp)))
    {T : SSet.{u}} (t : T ⟶ Z) :
    IsCategoricalEquivalence (pullback.map (f ≫ g) t g t f (𝟙 _) (𝟙 _) (by simp) (by simp)) := by
  sorry

/-- README §10.6.1. The 1-categories are the nerves: the unit `S ⟶ N(hS)` is an isomorphism, `S` is
isomorphic to the nerve of a small category, and `S` is a 1-category, are equivalent conditions.
(HTT, Prop. 2.3.4.5.) -/
theorem tfae_isIso_nerveAdjunction_unit_app (S : SSet.{u}) :
    List.TFAE [IsIso (nerveAdjunction.unit.app S),
      ∃ (D : Type u) (_ : SmallCategory D), Nonempty (S ≅ nerve D), IsNCategory 1 S] := by
  sorry

/-- README §10.6.3. Functor ∞-categories into an `n`-category are `n`-categories. (HTT, Cor. 2.3.4.8.) -/
theorem isNCategory_ihom {n : ℤ} {C : SSet.{u}} (hC : IsNCategory n C) (X : SSet.{u}) :
    IsNCategory n ((ihom X).obj C) := by
  sorry

/-- README §10.6.5. For `n ≥ 0`, an ∞-category is categorically equivalent to an `(n + 1)`-category
exactly when its mapping spaces `Hom^R_C(x, y)` are `n`-truncated. The minimal-model clause of HTT's
statement is not repeated here. The Kan instances on the mapping spaces are taken as an argument;
they always exist (`kanComplex_rightMappingSpace`). (HTT, Prop. 2.3.4.18, (2) ⇔ (3), for HTT's n ≥ 1.) -/
theorem exists_isNCategory_iff_isTruncated (n : ℕ) (C : SSet.{u}) [Quasicategory C]
    [∀ x y : C _⦋0⦌, KanComplex (C.rightMappingSpace x y : SSet.{u})] :
    (∃ (D : SSet.{u}) (f : C ⟶ D), IsNCategory ((n : ℤ) + 1) D ∧ IsCategoricalEquivalence f) ↔
      ∀ x y : C _⦋0⦌, IsTruncated n (C.rightMappingSpace x y : SSet.{u}) := by
  sorry

/-- README §10.8.1. A Kan complex `X` is `n`-truncated exactly when the map `X ⟶ X^{∂Δ[n + 2]}` given by
the constant maps is a weak homotopy equivalence. (HTT, Lemma 5.5.6.17, for k = n ≥ 0.) -/
theorem isTruncated_iff_isWeakHomotopyEquivalence (n : ℕ) (X : SSet.{u}) [KanComplex X] :
    IsTruncated n X ↔
      SSet.IsWeakHomotopyEquivalence (MonoidalClosed.curry (snd (∂Δ[n + 2] : SSet.{u}) X)) := by
  sorry

end TauCetiRoadmap.InfinityCategoryTheory.InfinityCategoryFoundations

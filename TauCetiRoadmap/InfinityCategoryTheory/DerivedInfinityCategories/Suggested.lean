/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.AlgebraicTopology.DGNerve.Basic
public import TauCeti.AlgebraicTopology.DGNerve.Quasicategory
public import TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence
public import TauCeti.AlgebraicTopology.Quasicategory.Core
public import TauCeti.AlgebraicTopology.Quasicategory.FullSubcategory
public import TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful
public import TauCeti.AlgebraicTopology.Quasicategory.InitialVertex
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.SimplicialSet.InternalHom
public import TauCeti.AlgebraicTopology.SimplicialSet.Join.StdSimplex
public import TauCeti.CategoryTheory.DG.FullSubcategory
public import TauCeti.Algebra.Homology.LinearHomComplex.Enrichment
public import TauCeti.Algebra.Homology.DerivedCategory.KInjective

/-!
# Derived ∞-categories of abelian categories: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, with the few definitions their statements need.

What is stated. The derived ∞-categories `D⁻(A)` and `D(A)` are differential graded nerves (Tau
Ceti's `TauCeti.dgNerve`) of full dg subcategories of cochain complexes. Stability (of the dg nerve
of complexes, of `D⁻(A)` and of `D(A)`, with mapping cones as cofibers) is stated with `IsStable`
and the zero-object predicate of Part StableInfinityCategories (§1.1) and the pushout and pullback
predicates of Part InfinityCategoryFoundations (§1.2), restated here with the same names and bodies. The comparisons with Mathlib's derived categories go through
homotopy categories. The localizations are stated with the predicate `IsLocalizationAt` of Part
AdjunctionsAndLocalizations (§2.4). The flagship description of functors out of `D⁻_{≥0}(A)` is stated
with Tau Ceti's colimit cocones (`SSet.coslice.IsColimit`, through Part InfinityCategoryFoundations'
`IsColimitDiagram`, restated here), functor quasicategories `(ihom X).obj C` with their vertices
`SSet.ihomObj₀Equiv`, full subcomplexes (`SSet.fullEnhancedSubcategory`) and categorical
equivalences (`SSet.QCat.IsCategoricalEquivalence`). There `D⁻_{≥0}(A)` and the nerve of the
projective objects are full subcomplexes of the dg nerve of cochain complexes; the second is the
nerve of `A_proj`, since the Hom complexes between projectives in degree zero are concentrated in
degree zero (HA, Remark 1.3.1.9). The 1-categorical inputs (Kan fibrations of simplicial abelian
groups, projective resolutions, right exact functors and projectives, Grothendieck abelian
categories, the injective model structure, fibrant complexes) are stated with Mathlib directly.

Not statable at the pins. The headline theorems among them are named first.
* The universal property of `D⁻(A)` (README §5.5.2, HA Thm. 1.3.3.2) and the recognition criterion
  for `D⁻` (§5.6.1, HA Prop. 1.3.3.7) need t-structures on stable quasicategories, with their
  hearts, left completeness and right t-exact functors; Mathlib's `Triangulated.TStructure` lives on
  triangulated 1-categories, and the triangulated structure on the homotopy category of a stable
  quasicategory is not in either library (see the next item).
* The triangulated comparison with Mathlib's homotopy category of complexes (§2.4.2, §2.4.3), part
  of the Mathlib comparison headline, needs the suspension functor of a stable quasicategory and
  the `HasShift`, `Preadditive` and `Pretriangulated` structures it induces on the homotopy
  category. For the same reason the equivalences of §4.5.2 and §6.5.3 are stated below as
  equivalences of categories only: the roadmap asks for them to commute with the shifts and to
  carry distinguished triangles to distinguished triangles, and neither library has the structure
  on the left-hand side to say so.
* The Dwyer–Kan theorem (§3.5.2, HA Thm. 1.3.4.20) needs simplicial model categories, which
  neither library has, and the coherent nerve of a locally Kan simplicial category as a
  quasicategory. The rest of Layer 3 (geometric realizations of simplicial categories, the
  comparison of bifibrant objects, underlying ∞-categories of combinatorial model categories) needs
  in addition simplicial categories in the Bergner model structure, combinatorial model categories
  and Quillen equivalences.
* Presentability of `D(A)` with its accessible, right complete t-structure compatible with filtered
  colimits (§6.8.1–§6.8.3, HA Prop. 1.3.5.21) needs presentable and accessible quasicategories and
  t-structures on stable quasicategories.
* The comparison map with the coherent nerve (§1.2, HA Prop. 1.3.1.17) needs the coherent nerve of
  `TauCeti.DGSimplicialCategory` as a quasicategory and the map `θ` as data.
* The mapping-complex lemmas (§4.3, HA Lemmas 1.3.2.20, 1.3.2.21) need the maps of Hom complexes
  induced by a chain map as chain maps, and §4.6.1 (HA Prop. 1.3.4.6) the inclusion
  `D⁻(A) ⊆ N_dg(Ch⁻(A))` between two full dg subcategories.
* The remaining t-structure statements (§4.5.1 apart from projective resolutions, §5.2, §5.3,
  §5.5.1, §5.5.3, §6.7, §6.8.4), `P_Σ` (§5.2.1) and the embedding of `D⁻(A)` into `D(A)` (§6.9)
  need t-structures on stable quasicategories, presentable quasicategories or the left adjoint as
  data, as above.
* The simplicial description of the connective part (§4.7, HA Props. 1.3.2.22, 1.3.2.23) needs
  Dwyer–Kan equivalences of simplicial categories and coherent nerves of their fibrant replacements.
-/

public section

namespace TauCetiRoadmap.InfinityCategoryTheory.DerivedInfinityCategories

open CategoryTheory Limits ZeroObject HomotopicalAlgebra SSet MonoidalClosed Simplicial

universe w v u

/-! ## Stability predicates (Parts InfinityCategoryFoundations §1.2 and StableInfinityCategories §1.1) -/

section Stability

open MonoidalCategory CartesianMonoidalCategory

/-- A map `p̄ : K ⋆ Δ[0] ⟶ C` out of the right cone is a *colimit diagram* when the cocone it
determines under `p = p̄|K` is a colimit cocone in the sense of Tau Ceti's `SSet.coslice.IsColimit`;
used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated here.
(HTT, Def. 1.2.13.4, p. 65.) -/
def IsColimitDiagram {K C : SSet.{w}} (q : join K Δ[0] ⟶ C) : Prop :=
  coslice.IsColimit (join.inl _ _ ≫ q)
    ((coslice.objEquiv (p := join.inl _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- A map `p̄ : Δ[0] ⋆ K ⟶ C` out of the left cone is a *limit diagram* when the cone it determines
over `p = p̄|K` is a limit cone in the sense of Tau Ceti's `SSet.slice.IsLimit`; used for
∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated here.
(HTT, Def. 1.2.13.4, p. 65.) -/
def IsLimitDiagram {K C : SSet.{w}} (q : join Δ[0] K ⟶ C) : Prop :=
  slice.IsLimit (join.inr _ _ ≫ q)
    ((slice.objEquiv (p := join.inr _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- The first coordinate of the span `Λ[2, 0]` inside the square: the vertices `0, 1, 2` go to
`0, 1, 0`. Owned by Part InfinityCategoryFoundations (§1.2.4). (HTT, §4.4.2, p. 313.) -/
noncomputable def spanCoord₁ : (Λ[2, 0] : SSet.{w}) ⟶ Δ[1] :=
  horn₂₀.isPushout.desc (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The second coordinate of the span `Λ[2, 0]` inside the square: the vertices `0, 1, 2` go to
`0, 0, 1`. Owned by Part InfinityCategoryFoundations (§1.2.4). (HTT, §4.4.2, p. 313.) -/
noncomputable def spanCoord₂ : (Λ[2, 0] : SSet.{w}) ⟶ Δ[1] :=
  horn₂₀.isPushout.desc (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) (𝟙 _) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The first coordinate of the cospan `Λ[2, 2]` inside the square: the vertices `0, 1, 2` go
to `1, 0, 1`. Owned by Part InfinityCategoryFoundations (§1.2.4). (HTT, §4.4.2, p. 313.) -/
noncomputable def cospanCoord₁ : (Λ[2, 2] : SSet.{w}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (𝟙 _) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The second coordinate of the cospan `Λ[2, 2]` inside the square: the vertices `0, 1, 2` go
to `0, 1, 1`. Owned by Part InfinityCategoryFoundations (§1.2.4). (HTT, §4.4.2, p. 313.) -/
noncomputable def cospanCoord₂ : (Λ[2, 2] : SSet.{w}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The square `Δ[1] × Δ[1]` read as a cocone `Λ[2, 0] ⋆ Δ[0]`: the span vertices go to
`(0, 0)`, `(1, 0)`, `(0, 1)` and the cone point to `(1, 1)`; this map is an isomorphism. Owned by
Part InfinityCategoryFoundations (§1.2.4). (HTT, §4.4.2, p. 313.) -/
noncomputable def coconeShape : join (Λ[2, 0] : SSet.{w}) Δ[0] ⟶ Δ[1] ⊗ Δ[1] :=
  lift (join.map spanCoord₁ (𝟙 _) ≫ (join.stdSimplexIso 1 0).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 1))
    (join.map spanCoord₂ (𝟙 _) ≫ (join.stdSimplexIso 1 0).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 1))

/-- The square `Δ[1] × Δ[1]` read as a cone `Δ[0] ⋆ Λ[2, 2]`: the cone point goes to `(0, 0)`
and the cospan vertices to `(1, 0)`, `(0, 1)`, `(1, 1)`; this map is an isomorphism. Owned by
Part InfinityCategoryFoundations (§1.2.4). (HTT, §4.4.2, p. 313.) -/
noncomputable def coneShape : join Δ[0] (Λ[2, 2] : SSet.{w}) ⟶ Δ[1] ⊗ Δ[1] :=
  lift (join.map (𝟙 _) cospanCoord₁ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))
    (join.map (𝟙 _) cospanCoord₂ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))

/-- A square is a pushout square when, read as a cocone `Λ[2, 0] ⋆ Δ[0] ⟶ C` under its span, it
is a colimit diagram; used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated
here. (HTT, §4.4.2, p. 313, with Def. 1.2.13.4.) -/
def IsPushoutSquare {C : SSet.{w}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsColimitDiagram (coconeShape ≫ s)

/-- A square is a pullback square when, read as a cone `Δ[0] ⋆ Λ[2, 2] ⟶ C` over its cospan, it
is a limit diagram; used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated
here. (HTT, §4.4.2, p. 313, with Def. 1.2.13.4.) -/
def IsPullbackSquare {C : SSet.{w}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsLimitDiagram (coneShape ≫ s)

/-- A zero object: a vertex that is both initial and final; used for ∞-categories `C`. Owned by
Part InfinityCategoryFoundations (§1.2.3) and restated here. (HTT, Def. 7.2.2.7, p. 743; HA, Def. 1.1.1.1, p. 17.) -/
def IsZeroObject {C : SSet.{w}} (x : C _⦋0⦌) : Prop :=
  C.IsInitialVertex x ∧ C.IsTerminalVertex x

/-- A pointed ∞-category: an ∞-category with a zero object. Owned by Part
StableInfinityCategories (§1.1.1) and restated here. (HA, Def. 1.1.1.1, p. 17.) -/
def IsPointed (C : SSet.{w}) : Prop := C.Quasicategory ∧ ∃ x : C _⦋0⦌, IsZeroObject x

/-- The vertex `(0, 1)` of a square, the corner that is a zero object in a triangle. Owned by
Part StableInfinityCategories (§1.1.2) and restated here. (HA, Def. 1.1.1.4, p. 18.) -/
noncomputable def corner {C : SSet.{w}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : C _⦋0⦌ :=
  yonedaEquiv (lift (SSet.stdSimplex.δ 1) (SSet.stdSimplex.δ 0) ≫ s)

/-- A stable ∞-category: an ∞-category with a zero object in which every edge has a fiber and a
cofiber, and a square with zero corner `(0, 1)` is a pullback exactly when it is a pushout.
In a cofiber sequence the edge is `Δ[1] × {0}`; in a fiber sequence it is `{1} × Δ[1]`.
Owned by Part StableInfinityCategories (§1.1.3) and restated here. (HA, Defs. 1.1.1.4, 1.1.1.6,
1.1.1.9, pp. 18–19.) -/
def IsStable (C : SSet.{w}) : Prop :=
  IsPointed C ∧
  (∀ e : Δ[1] ⟶ C, ∃ s : Δ[1] ⊗ Δ[1] ⟶ C, IsZeroObject (corner s) ∧ IsPullbackSquare s ∧
      lift (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (𝟙 _) ≫ s = e) ∧
  (∀ e : Δ[1] ⟶ C, ∃ s : Δ[1] ⊗ Δ[1] ⟶ C, IsZeroObject (corner s) ∧ IsPushoutSquare s ∧
      lift (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) ≫ s = e) ∧
  ∀ s : Δ[1] ⊗ Δ[1] ⟶ C, IsZeroObject (corner s) → (IsPullbackSquare s ↔ IsPushoutSquare s)

end Stability

/-! ## Layer 2: Chain complexes as a stable ∞-category -/

/-- **Kan fibrations of simplicial abelian groups** (§2.2.1). A map of simplicial abelian groups is a
Kan fibration of the underlying simplicial sets (the right lifting property against the horn
inclusions `SSet.modelCategoryQuillen.J`) exactly when the induced map of normalized Moore
complexes is surjective in every positive degree. (HA, Prop. 1.3.2.11.) -/
theorem rlp_J_iff_surjective_normalizedMooreComplex_map
    {X Y : SimplicialObject AddCommGrpCat.{w}} (f : X ⟶ Y) :
    SSet.modelCategoryQuillen.J.rlp (Functor.whiskerRight f (forget AddCommGrpCat)) ↔
      ∀ n : ℕ, 0 < n →
        Function.Surjective (((AlgebraicTopology.normalizedMooreComplex _).map f).f n).hom := by
  sorry

variable (R : Type v) [CommRing R]

section Additive

variable (A : Type u) [Category.{v} A] [Preadditive A] [HasFiniteBiproducts A] [HasBinaryBiproducts A]
  [Linear R A]

/-- **Stability of chain complexes** (§2.4.1). For an additive category `A`, the dg nerve
`N_dg(Ch(A))` is a stable ∞-category. (HA, Prop. 1.3.2.10.) -/
theorem isStable_dgNerve_cochainComplex :
    IsStable (TauCeti.dgNerve R (CochainComplex A ℤ)) := by
  sorry

open MonoidalCategory CartesianMonoidalCategory in
/-- **Mapping cones are cofibers** (§2.4.1). For a chain map `f : M ⟶ M'` in an additive category,
there is a pushout square in `N_dg(Ch(A))` with zero corner `(0, 1)`, whose edge `Δ[1] × {0}` is `f`
and whose final vertex `(1, 1)` is the mapping cone of `f`. (HA, Prop. 1.3.2.10, Remark 1.3.2.17.) -/
theorem exists_isPushoutSquare_mappingCone {M M' : CochainComplex A ℤ} (f : M ⟶ M') :
    ∃ s : Δ[1] ⊗ Δ[1] ⟶ TauCeti.dgNerve R (CochainComplex A ℤ),
      IsZeroObject (corner s) ∧ IsPushoutSquare s ∧
      ∃ z : TauCeti.dgCycles R M M',
        (z.1 : CochainComplex.HomComplex.Cochain M M' 0) = .ofHom f ∧
        lift (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) ≫ s =
          yonedaEquiv.symm (TauCeti.dgNerve.edgeMk R _ z).edge ∧
      yonedaEquiv (lift (SSet.stdSimplex.δ 0) (SSet.stdSimplex.δ 0) ≫ s) =
        (TauCeti.dgNerveEquiv R (CochainComplex A ℤ)).symm (CochainComplex.mappingCone f) := by
  sorry

end Additive

variable (A : Type u) [Category.{v} A] [Abelian A] [Linear R A]

/-! ## Layer 4: The right-bounded derived ∞-category -/

/-- HA's `Ch⁻(A)`: the cochain complexes whose terms vanish in all sufficiently large cochain
degrees. (§4.1.2; HA, Notation 1.3.2.6.) -/
def IsBoundedAbove (K : CochainComplex A ℤ) : Prop :=
  ∃ N : ℤ, ∀ n, N < n → IsZero (K.X n)

/-- A cochain complex is a bounded-above complex of projectives when every term is projective and
the terms vanish in all sufficiently large cochain degrees. In HA's homological grading these are
the complexes of projectives `P` with `P_n = 0` for `n` sufficiently negative, the objects of
`Ch⁻(A_proj)`. (§4.2.1; HA, Notation 1.3.2.6 and Def. 1.3.2.7.) -/
def IsBoundedAboveProjective (K : CochainComplex A ℤ) : Prop :=
  (∀ n, Projective (K.X n)) ∧ ∃ N : ℤ, ∀ n, N < n → IsZero (K.X n)

/-- The right-bounded derived ∞-category `D⁻(A)`: the differential graded nerve of the full dg
subcategory of cochain complexes on the bounded-above complexes of projectives. (§4.2.1; HA,
Def. 1.3.2.7.) -/
noncomputable abbrev derivedMinusInfty : SSet :=
  TauCeti.dgNerve R (TauCeti.DGFullSubcategory (IsBoundedAboveProjective A))

/-- **Stability of `D⁻(A)`** (§4.4.1). For an abelian category with enough projectives, `D⁻(A)` is a
stable ∞-category. (HA, Cor. 1.3.2.18.) -/
theorem isStable_derivedMinusInfty [EnoughProjectives A] :
    IsStable (derivedMinusInfty R A) := by
  sorry

/-- The objects of `D⁻_{≥0}(A)`: bounded-above complexes of projectives whose cohomology vanishes
in positive cochain degrees, that is, whose homology vanishes in negative HA degrees. (§4.5.1; HA,
Prop. 1.3.2.19.) -/
def IsConnectiveBoundedAboveProjective (K : CochainComplex A ℤ) : Prop :=
  IsBoundedAboveProjective A K ∧ ∀ n : ℤ, 0 < n → IsZero (K.homology n)

/-- **Projective resolutions** (§4.5.1, construction (∗)). For an abelian category with enough
projectives, every cochain complex `K` receives a chain map `f : P ⟶ K` from a complex of
projectives vanishing in positive cochain degrees that is an isomorphism on cohomology in all
nonpositive cochain degrees; if `K` is a connective bounded-above complex of projectives, `f` is a
homotopy equivalence. (HA, Prop. 1.3.2.19, proof.) -/
theorem exists_connective_projective_resolution [EnoughProjectives A] (K : CochainComplex A ℤ) :
    ∃ (P : CochainComplex A ℤ) (f : P ⟶ K), (∀ n, Projective (P.X n)) ∧
      (∀ n : ℤ, 0 < n → IsZero (P.X n)) ∧
      (∀ n : ℤ, n ≤ 0 → IsIso (HomologicalComplex.homologyMap f n)) ∧
      (IsConnectiveBoundedAboveProjective A K → ∃ e : HomotopyEquiv P K, e.hom = f) := by
  sorry

/-- For an abelian category with enough projectives, the homotopy category of `D⁻(A)` is equivalent
to Mathlib's bounded-above derived category. (§4.5.2; HA, Remark 1.3.2.9.) -/
theorem nonempty_homotopyCategory_derivedMinusInfty_equiv [EnoughProjectives A]
    [HasDerivedCategory.{w} A] :
    Nonempty ((derivedMinusInfty R A).HomotopyCategory ≌ DerivedCategory.Minus A) := by
  sorry

/-- A functor `f : C ⟶ D` of ∞-categories exhibits `D` as the localization `C[W⁻¹]` of `C` at a
collection `W` of edges: for every ∞-category `E`, precomposition with `f` is fully faithful, and a
functor `C ⟶ E` factors through `f` up to equivalence exactly when it carries every edge of `W` to an
equivalence. Part AdjunctionsAndLocalizations' `IsLocalizationAt` (§2.4.1), restated with the same
body. (HA, Def. 1.3.4.1.) -/
def IsLocalizationAt {C D : QCat.{w}} (f : C ⟶ D)
    (W : ∀ x y : C.obj _⦋0⦌, C.obj.Edge x y → Prop) : Prop :=
  ∀ E : QCat.{w}, IsFullyFaithful ((MonoidalClosed.pre f.hom).app E.obj) ∧
    ∀ F : C ⟶ E, (∃ G : D ⟶ E, Nonempty (f ≫ G ≅ F)) ↔
      ∀ (x y : C.obj _⦋0⦌) (e : C.obj.Edge x y), W x y e → (e.map F.hom).IsEquivalence

/-- **`D⁻(A)` inverts the quasi-isomorphisms** (§4.6.2). For an abelian category with enough
projectives, some functor from the nerve of bounded-above cochain complexes to `D⁻(A)` exhibits
`D⁻(A)` as the localization at the quasi-isomorphisms. (HA, Thm. 1.3.4.4.) -/
theorem exists_isLocalizationAt_quasiIso_derivedMinusInfty [EnoughProjectives A] :
    ∃ f : (⟨nerve (ObjectProperty.FullSubcategory (IsBoundedAbove A)), inferInstance⟩ :
        QCat.{max u v}) ⟶ ⟨derivedMinusInfty R A, inferInstance⟩,
      IsLocalizationAt f fun _ _ e ↦ QuasiIso ((ObjectProperty.ι _).map (nerve.homEquiv e)) := by
  sorry

/-! ## Layer 5: Universal properties of `D⁻(A)` -/

section RightExact

variable (B : Type*) [Category* B]

/-- Restriction of right exact functors `A ⥤ B` to the full subcategory `A_proj` of projective
objects. (§5.1.1; HA, Lemma 1.3.3.9.) -/
abbrev restrictToProjectives :
    ObjectProperty.FullSubcategory (fun F : A ⥤ B ↦ PreservesFiniteColimits F) ⥤
      (ObjectProperty.FullSubcategory (fun P : A ↦ Projective P) ⥤ B) :=
  ObjectProperty.ι _ ⋙ (Functor.whiskeringLeft _ _ B).obj (ObjectProperty.ι _)

/-- **Right exact functors and projectives** (§5.1.1), fullness. For an abelian category with enough
projectives and a category `B` with finite colimits, restriction of right exact functors to `A_proj`
is full. (HA, Lemma 1.3.3.9.) -/
theorem full_restrictToProjectives [EnoughProjectives A] [HasFiniteColimits B] :
    (restrictToProjectives A B).Full := by
  sorry

/-- **Right exact functors and projectives** (§5.1.1), faithfulness. (HA, Lemma 1.3.3.9.) -/
theorem faithful_restrictToProjectives [EnoughProjectives A] [HasFiniteColimits B] :
    (restrictToProjectives A B).Faithful := by
  sorry

/-- **Right exact functors and projectives** (§5.1.1), essential image. The functors `A_proj ⥤ B`
that come from right exact functors are exactly those preserving finite coproducts. (HA,
Lemma 1.3.3.9.) -/
theorem essImage_restrictToProjectives [EnoughProjectives A] [HasFiniteColimits B] :
    (restrictToProjectives A B).essImage = fun G ↦ Limits.PreservesFiniteCoproducts G := by
  sorry

end RightExact

section Ind

variable (A₀ : Type v) [SmallCategory A₀] [Abelian A₀] [EnoughProjectives A₀]

/-- **Ind-objects as product-preserving presheaves on projectives** (§5.1.2). For a small abelian
category with enough projectives, `Ind(A)` is equivalent to the category `A^∧` of presheaves of sets
on `A_proj` preserving finite products. (HA, Prop. 1.3.3.13.) -/
theorem nonempty_ind_equiv_finiteProductPreservingPresheaves :
    Nonempty (Ind A₀ ≌ ObjectProperty.FullSubcategory
      (fun F : (ObjectProperty.FullSubcategory (fun P : A₀ ↦ Projective P))ᵒᵖ ⥤ Type v ↦
        PreservesFiniteProducts F)) := by
  sorry

/-- For a small abelian category with enough projectives, the abelian category `Ind(A) ≃ A^∧` has
enough projectives. (§5.1.2; HA, Prop. 1.3.3.13.) -/
theorem enoughProjectives_ind : EnoughProjectives (Ind A₀) := by
  sorry

end Ind

/-- The simplicial set `N(Δ)^op`, the nerve of `Δᵒᵖ`, indexing simplicial objects (geometric
realizations, Part LimitsAndKanExtensions §9.4.2), lifted to the universe `w`. Restated with the same
body from Part PresentableInfinityCategories's `Suggested.lean` (§7.6.1). (§5.4.1; HTT, Notation 6.1.2.12.) -/
noncomputable abbrev simplexOp : SSet.{w} :=
  SSet.uliftFunctor.{w, 0}.obj (nerve.{0, 0} SimplexCategoryᵒᵖ)

/-- A simplicial set `C` admits geometric realizations of simplicial objects when every map
`N(Δ)ᵒᵖ ⟶ C` extends to a colimit diagram; used for quasicategories `C`. The notion of Part
LimitsAndKanExtensions §9.4.2, stated here. (§5.4.1; HTT, Notation 6.1.2.12.) -/
def HasGeometricRealizations (C : SSet.{w}) : Prop :=
  ∀ U : simplexOp.{w} ⟶ C, ∃ q : join simplexOp.{w} Δ[0] ⟶ C,
    join.inl _ _ ≫ q = U ∧ IsColimitDiagram q

/-- A map `F : C ⟶ D` preserves geometric realizations of simplicial objects when it carries every
colimit diagram indexed by `N(Δ)ᵒᵖ` to a colimit diagram. The notion of Part LimitsAndKanExtensions
§9.4.2, stated here. (§5.4.1; HA, Thm. 1.3.3.8.) -/
def PreservesGeometricRealizations {C D : SSet.{w}} (F : C ⟶ D) : Prop :=
  ∀ q : join simplexOp.{w} Δ[0] ⟶ C, IsColimitDiagram q → IsColimitDiagram (q ≫ F)

/-- A map `F : C ⟶ D` preserves finite coproducts when it carries every colimit diagram indexed by
a finite discrete simplicial set, the empty one included, to a colimit diagram; colimit diagrams are
those of Part InfinityCategoryFoundations §1.2.4, and the notion is stated here. Not Mathlib's
`Limits.PreservesFiniteCoproducts`, which is for functors of categories. (§5.4.1; HA, Thm. 1.3.3.8.) -/
def PreservesFiniteCoproductDiagrams {C D : SSet.{w}} (F : C ⟶ D) : Prop :=
  ∀ (n : ℕ) (q : join (SSet.uliftFunctor.{w, 0}.obj
      ((Functor.const SimplexCategoryᵒᵖ).obj (Fin n))) Δ[0] ⟶ C),
    IsColimitDiagram q → IsColimitDiagram (q ≫ F)

/-- A cochain complex is a projective object in degree zero when its degree-zero term is
projective and all other terms vanish. (§5.4.1; HA, Thm. 1.3.3.8.) -/
def IsProjectiveInDegreeZero (K : CochainComplex A ℤ) : Prop :=
  Projective (K.X 0) ∧ ∀ n : ℤ, n ≠ 0 → IsZero (K.X n)

/-- The connective part `D⁻_{≥0}(A)`, as the full subcomplex of the dg nerve of cochain complexes on
the connective bounded-above complexes of projectives. (§5.4.1; HA, Prop. 1.3.2.19.) -/
noncomputable def connectiveDerivedMinusInfty :
    (TauCeti.dgNerve R (CochainComplex A ℤ)).Subcomplex :=
  (TauCeti.dgNerve R (CochainComplex A ℤ)).fullEnhancedSubcategory fun x ↦
    IsConnectiveBoundedAboveProjective A (TauCeti.dgNerveEquiv R (CochainComplex A ℤ) x)

/-- The full subcomplex of the dg nerve of cochain complexes on the projective objects placed in
degree zero: the nerve `N(A_proj)`. (§5.4.1; HA, Remark 1.3.1.9 and Thm. 1.3.3.8.) -/
noncomputable def projectivesInDegreeZero :
    (TauCeti.dgNerve R (CochainComplex A ℤ)).Subcomplex :=
  (TauCeti.dgNerve R (CochainComplex A ℤ)).fullEnhancedSubcategory fun x ↦
    IsProjectiveInDegreeZero A (TauCeti.dgNerveEquiv R (CochainComplex A ℤ) x)

/-- The full subcategory `Fun'(D⁻_{≥0}(A), C)` of `Fun(D⁻_{≥0}(A), C)` on the functors preserving
geometric realizations of simplicial objects. (§5.4.1; HA, Thm. 1.3.3.8.) -/
noncomputable abbrev realizationPreservingFunctors (C : SSet.{max u v}) :
    ((ihom (connectiveDerivedMinusInfty R A : SSet.{max u v})).obj C).Subcomplex :=
  ((ihom (connectiveDerivedMinusInfty R A : SSet.{max u v})).obj C).fullEnhancedSubcategory
    fun F ↦ PreservesGeometricRealizations (ihomObj₀Equiv _ C F)

/-- **Functors out of the connective part** (§5.4.1, the flagship, first part). For an abelian
category with enough projectives and a quasicategory `C` with geometric realizations, `N(A_proj)` is
a full subcategory of `D⁻_{≥0}(A)`, and restriction is a categorical equivalence from the
realization-preserving functors `D⁻_{≥0}(A) ⟶ C` to all functors `N(A_proj) ⟶ C`. (HA,
Thm. 1.3.3.8 (1).) -/
theorem exists_isCategoricalEquivalence_restrict_projectivesInDegreeZero [EnoughProjectives A]
    (C : SSet.{max u v}) [C.Quasicategory] (hC : HasGeometricRealizations C) :
    ∃ h : projectivesInDegreeZero R A ≤ connectiveDerivedMinusInfty R A,
      QCat.IsCategoricalEquivalence
        (X := ⟨(realizationPreservingFunctors R A C : SSet.{max u v}), inferInstance⟩)
        (Y := ⟨(ihom (projectivesInDegreeZero R A : SSet.{max u v})).obj C, inferInstance⟩)
        (ObjectProperty.homMk
          ((realizationPreservingFunctors R A C).ι ≫ (pre (Subcomplex.homOfLE h)).app C)) := by
  sorry

/-- **Functors out of the connective part** (§5.4.1, the flagship, second part). A
realization-preserving functor `D⁻_{≥0}(A) ⟶ C` preserves finite coproducts exactly when its
restriction to `N(A_proj)` does. (HA, Thm. 1.3.3.8 (2).) -/
theorem preservesFiniteCoproducts_iff_restrict [EnoughProjectives A]
    (h : projectivesInDegreeZero R A ≤ connectiveDerivedMinusInfty R A)
    {C : SSet.{max u v}} [C.Quasicategory] (hC : HasGeometricRealizations C)
    (F : (connectiveDerivedMinusInfty R A : SSet.{max u v}) ⟶ C)
    (hF : PreservesGeometricRealizations F) :
    PreservesFiniteCoproductDiagrams F ↔
      PreservesFiniteCoproductDiagrams (Subcomplex.homOfLE h ≫ F) := by
  sorry

/-! ## Layer 6: The injective model structure and `D(A)` -/

/-- **Grothendieck abelian categories** (§6.1.1). An abelian category is Grothendieck abelian exactly
when it is locally presentable and its monomorphisms are stable under filtered colimits. (Manual,
comparing HA, Def. 1.3.5.1 with Mathlib's definition.) -/
theorem isGrothendieckAbelian_iff_isLocallyPresentable :
    IsGrothendieckAbelian.{v} A ↔ IsLocallyPresentable.{v} A ∧
      (MorphismProperty.monomorphisms A).IsStableUnderFilteredColimits.{v, v} := by
  sorry

/-- **The injective model structure** (§6.2.1). For a Grothendieck abelian category `A`, unbounded
cochain complexes in `A` carry a model structure whose cofibrations are the monomorphisms, whose
weak equivalences are the quasi-isomorphisms, and whose fibrations are the maps with the right
lifting property against monomorphic quasi-isomorphisms. It is combinatorial: the category is
locally presentable, and the cofibrations and the trivial cofibrations are the maps with the left
lifting property against everything lifting against a small set. It is left proper: a pushout of a
quasi-isomorphism along a monomorphism is a quasi-isomorphism. (HA, Prop. 1.3.5.3.) -/
theorem exists_modelCategory_injective [IsGrothendieckAbelian.{v} A] :
    (∃ M : ModelCategory (CochainComplex A ℤ),
      M.categoryWithCofibrations.cofibrations = MorphismProperty.monomorphisms _ ∧
      M.categoryWithWeakEquivalences.weakEquivalences =
        HomologicalComplex.quasiIso A (ComplexShape.up ℤ) ∧
      M.categoryWithFibrations.fibrations =
        (MorphismProperty.monomorphisms _ ⊓
          HomologicalComplex.quasiIso A (ComplexShape.up ℤ)).rlp) ∧
    IsLocallyPresentable.{v} (CochainComplex A ℤ) ∧
    (∃ I : MorphismProperty (CochainComplex A ℤ), I.IsSmall.{v} ∧
      I.rlp.llp = MorphismProperty.monomorphisms _) ∧
    (∃ J : MorphismProperty (CochainComplex A ℤ), J.IsSmall.{v} ∧
      J.rlp.llp = MorphismProperty.monomorphisms _ ⊓
        HomologicalComplex.quasiIso A (ComplexShape.up ℤ)) ∧
    ∀ ⦃K L M N : CochainComplex A ℤ⦄ (i : K ⟶ L) (f : K ⟶ M) (g : L ⟶ N) (j : M ⟶ N),
      IsPushout i f g j → Mono i → QuasiIso f → QuasiIso g := by
  sorry

/-- **K-injective resolutions** (§6.3.1). Every unbounded complex in a Grothendieck abelian category
has a K-injective resolution: factor the map to zero as a monomorphic quasi-isomorphism followed by
a fibration of the injective model structure. (HA, Props. 1.3.5.3 and 1.3.5.6.) -/
theorem hasKInjectiveResolutions_of_isGrothendieckAbelian [IsGrothendieckAbelian.{v} A] :
    TauCeti.HasKInjectiveResolutions A := by
  sorry

/-- A complex is injectively fibrant when its map to the zero complex has the right lifting property
against monomorphic quasi-isomorphisms: the fibrant objects of the injective model structure.
(§6.5.1; HA, Prop. 1.3.5.3 and Def. 1.3.5.8.) -/
def IsInjectivelyFibrant (K : CochainComplex A ℤ) : Prop :=
  (MorphismProperty.monomorphisms (CochainComplex A ℤ) ⊓
    HomologicalComplex.quasiIso A (ComplexShape.up ℤ)).rlp (0 : K ⟶ 0)

/-- The unbounded derived ∞-category `D(A)`: the differential graded nerve of the full dg
subcategory of cochain complexes on the injectively fibrant complexes. (§6.5.1; HA, Def. 1.3.5.8.) -/
noncomputable abbrev derivedInfty : SSet :=
  TauCeti.dgNerve R (TauCeti.DGFullSubcategory (IsInjectivelyFibrant A))

/-- **Stability of `D(A)`** (§6.5.2). For a Grothendieck abelian category, `D(A)` is a stable
∞-category. (HA, Prop. 1.3.5.9.) -/
theorem isStable_derivedInfty [IsGrothendieckAbelian.{v} A] :
    IsStable (derivedInfty R A) := by
  sorry

/-- For a Grothendieck abelian category, the homotopy category of `D(A)` is equivalent to Mathlib's
derived category. (§6.5.3; HA, Props. 1.3.5.14 and 1.3.5.15.) -/
theorem nonempty_homotopyCategory_derivedInfty_equiv [IsGrothendieckAbelian.{v} A]
    [HasDerivedCategory.{w} A] :
    Nonempty ((derivedInfty R A).HomotopyCategory ≌ DerivedCategory A) := by
  sorry

/-- **`D(A)` as the underlying ∞-category of the injective model structure** (§6.6.2). For a
Grothendieck abelian category, some functor from the nerve of cochain complexes to `D(A)` exhibits
`D(A)` as the localization at the quasi-isomorphisms. (HA, Prop. 1.3.5.15.) -/
theorem exists_isLocalizationAt_quasiIso_derivedInfty [IsGrothendieckAbelian.{v} A] :
    ∃ f : (⟨nerve (CochainComplex A ℤ), inferInstance⟩ : QCat.{max u v}) ⟶
        ⟨derivedInfty R A, inferInstance⟩,
      IsLocalizationAt f fun _ _ e ↦ QuasiIso (nerve.homEquiv e) := by
  sorry

/-- A cocone `v` under the vertex `c`, that is, a morphism out of `c`, exhibits its target as a
localization of `c` relative to the full subcategory on `P`: its target satisfies `P`, and `v` is an
initial vertex of the full subcategory of `C_{c/}` on the morphisms with target satisfying `P`.
Part AdjunctionsAndLocalizations' `IsSubcategoryLocalization` (§2.2.1), restated with the same body.
(HTT, Def. 5.2.7.6, in the equivalent form of Remark 5.2.7.7.) -/
def IsSubcategoryLocalization {C : SSet.{w}} (P : C _⦋0⦌ → Prop) {c : C _⦋0⦌}
    (v : (coslice (yonedaEquiv.symm c : Δ[0] ⟶ C)) _⦋0⦌) : Prop :=
  ∃ hv : P ((coslice.π _).app _ v),
    ((coslice (yonedaEquiv.symm c : Δ[0] ⟶ C)).fullEnhancedSubcategory
      (fun w ↦ P ((coslice.π _).app _ w)) : SSet.{w}).IsInitialVertex
      ⟨v, (mem_fullEnhancedSubcategory_obj_zero_iff _ v).2 hv⟩

/-- The full subcategory on `P` is *reflective* when every object has a localization relative to it.
Part AdjunctionsAndLocalizations' `IsReflectiveSubcategory` (§2.2.1), restated with the same body.
(HTT, Remark 5.2.7.9.) -/
def IsReflectiveSubcategory {C : SSet.{w}} (P : C _⦋0⦌ → Prop) : Prop :=
  ∀ c : C _⦋0⦌, ∃ v : (coslice (yonedaEquiv.symm c : Δ[0] ⟶ C)) _⦋0⦌,
    IsSubcategoryLocalization P v

/-- **`D(A)` is a reflective subcategory of `N_dg(Ch(A))`** (§6.6.1). For a Grothendieck abelian
category, every complex has a localization relative to the injectively fibrant complexes, so the
inclusion `D(A) ⊆ N_dg(Ch(A))` has a left adjoint (HTT, Prop. 5.2.7.8). (HA, Prop. 1.3.5.13.) -/
theorem isReflectiveSubcategory_isInjectivelyFibrant [IsGrothendieckAbelian.{v} A] :
    IsReflectiveSubcategory (C := TauCeti.dgNerve R (CochainComplex A ℤ))
      fun x ↦ IsInjectivelyFibrant A (TauCeti.dgNerveEquiv R (CochainComplex A ℤ) x) := by
  sorry

end TauCetiRoadmap.InfinityCategoryTheory.DerivedInfinityCategories

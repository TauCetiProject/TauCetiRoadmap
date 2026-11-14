/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.CatInfty
public import TauCeti.AlgebraicTopology.Quasicategory.FullSubcategory
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.SimplicialNerve.Basic
public import TauCeti.AlgebraicTopology.SimplicialSet.AnodyneExtensions.LeftRight.Basic
public import TauCeti.AlgebraicTopology.SimplicialSet.Fiber
public import TauCeti.AlgebraicTopology.SimplicialSet.InternalHom
public import TauCeti.AlgebraicTopology.SimplicialSet.Slice
public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence

/-!
# Limits and colimits, cofinality and Kan extensions in ∞-categories: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, with the few definitions their statements need. An
∞-category is a quasicategory (`SSet.Quasicategory`), a colimit of `p : K ⟶ C` is an initial vertex
of the coslice `C_{p/}` (`SSet.coslice.IsColimit`), a limit is a final vertex of the slice
(`SSet.slice.IsLimit`), and the full subcategory on a predicate is `SSet.fullEnhancedSubcategory`.

Stated: cofinality and its characterizations (colimits, right anodyne factorization, Theorem A, invariance under
categorical equivalence, cofinal right fibrations), semisimplicial indexing, cofinal maps from nerves, small limits
and colimits in the ∞-category of spaces, in `Cat∞` and in presheaf ∞-categories, pointwise colimits in functor
∞-categories, colimits in spaces through the classified left fibration (HTT, Proposition 3.3.4.5, (1) ⇔ (3)), and the
existence of left Kan extensions along full subcategories with the trivial fibration of HTT, Proposition 4.3.2.15.
Defined here as this Part's own: `sectionsRestrict`, `IsCofinal` (§2.1), `IsLeftKanExtensionAt`, `IsLeftKanExtension`
(§7.1) and `presheaf` (§8.1). Repeated from Part InfinityCategoryFoundations, with the same names and bodies:
`IsCategoricalEquivalence` (its §2.1), `Kan`, `spaces`, `spacesPoint`, `universalLeftFibration`,
`IsPointwiseEquivalence` and `ClassifiesLeft` (its §7.1). Evaluation at a vertex is Tau Ceti's `SSet.evalAt`.

Small diagrams in the large ∞-categories `spaces`, `SSet.catInfty` and `presheaf K`, which live in
`SSet.{u + 1}`, are diagrams `K : SSet.{u + 1}` with `u`-small sets of simplices.

Not statable at the pins:
* the comparison of homotopy colimits with ∞-categorical colimits (§3.2, HTT Thm. 4.2.4.1), the
  rectification of §3.1, and small limits and colimits in `N(A°)` for a general combinatorial
  simplicial model category (§3.3, HTT Cor. 4.2.4.8) need combinatorial simplicial model categories,
  their homotopy colimits and the injective structure on enriched diagrams, which are not in Mathlib
  or Tau Ceti; the identification `Cat∞ ≅ N((Set⁺_Δ)°)` (§3.8) needs the Cartesian model structure
  on marked simplicial sets.

Čech nerves (§9.4) and the limits of semisimplicial objects (§9.7) are targets of the README, not
headlines, and are not stated here.
-/

public section

open CategoryTheory Limits MonoidalCategory MonoidalClosed CartesianMonoidalCategory Simplicial
  SSet Opposite

universe u

namespace TauCetiRoadmap.InfinityCategoryTheory.LimitsAndKanExtensions

/-! ## Definitions repeated from Part InfinityCategoryFoundations -/

/-- A map `f : A ⟶ B` of simplicial sets is a categorical equivalence when, for every ∞-category `C`,
restriction along `f` induces an equivalence of homotopy categories `h Fun(B, C) ⥤ h Fun(A, C)`.
Part InfinityCategoryFoundations' definition (its §2.1.6), repeated with the same body. (HTT, Def. 1.1.5.14, in
the equivalent form of Kerodon, §4.5.4, Def. 4.5.4.1.) -/
def IsCategoricalEquivalence {A B : SSet.{u}} (f : A ⟶ B) : Prop :=
  ∀ (C : SSet.{u}) [C.Quasicategory],
    (hoFunctor.map ((MonoidalClosed.pre f).app C)).toFunctor.IsEquivalence

/-- The simplicial category of Kan complexes: the full subcategory of the simplicially enriched
category of simplicial sets, with the internal homs as mapping simplicial sets. Part
InfinityCategoryFoundations' definition (its §7.1.2), repeated with the same body. (HTT, Def. 1.2.16.1.) -/
abbrev Kan : Type (u + 1) := ObjectProperty.FullSubcategory fun X : SSet.{u} ↦ X.KanComplex

/-- The ∞-category of spaces `S`, the simplicial nerve of `Kan`, a large simplicial set. Part
InfinityCategoryFoundations' definition (its §7.1.2), repeated with the same body. (HTT, Def. 1.2.16.1.) -/
noncomputable abbrev spaces : SSet.{u + 1} := SimplicialNerve Kan.{u}

/-- The vertex `∗` of the ∞-category of spaces: the Kan complex `Δ[0]`. Part InfinityCategoryFoundations'
definition (its §7.1.2), repeated with the same body. (HTT, §3.3.2.) -/
noncomputable def spacesPoint : spaces.{u} _⦋0⦌ :=
  (SimplicialNerve.fromNerve Kan.{u}).app (op ⦋0⦌)
    (ComposableArrows.mk₀ ⟨Δ[0], kanComplex_of_isTerminal stdSimplex.isTerminalObj₀⟩)

/-- The universal left fibration `S_{∗/} ⟶ S`, the coslice projection under `∗`. Part
InfinityCategoryFoundations' definition (its §7.1.6), repeated with the same body. (HTT, §3.3.2, Cor. 3.3.2.8.) -/
noncomputable def universalLeftFibration : coslice (const spacesPoint.{u} : Δ[0] ⟶ spaces.{u}) ⟶
    spaces.{u} :=
  coslice.π _

/-- A map `f` over `S` is a pointwise equivalence when the induced map of fibers `X_s ⟶ Y_s` is a
weak homotopy equivalence at every vertex `s`. Part InfinityCategoryFoundations' definition (its §7.1.7),
repeated with the same body. (HTT, Def. 2.2.3.2, in the weak-equivalence form.) -/
def IsPointwiseEquivalence {S : SSet.{u}} {X Y : Over S} (f : X ⟶ Y) : Prop :=
  ∀ s : S _⦋0⦌, SSet.IsWeakHomotopyEquivalence
    (pullback.map X.hom (const s : Δ[0] ⟶ S) Y.hom (const s) f.left (𝟙 _) (𝟙 _) (by simp) (by simp))

/-- A map `g : K ⟶ S` classifies a left fibration `X ⟶ K` when `X` and the pullback of the
universal left fibration along `g` are joined by a finite zigzag of pointwise equivalences of left
fibrations over `K`. Part InfinityCategoryFoundations' definition (its §7.1.8), repeated with the same body.
(HTT, §3.3.2, Cor. 3.3.2.8, unmarked form.) -/
def ClassifiesLeft {K : SSet.{u + 1}} (X : Over K) (g : K ⟶ spaces.{u}) : Prop :=
  Relation.EqvGen (fun A B : Over K ↦
      LeftFibration A.hom ∧ LeftFibration B.hom ∧ ∃ f : A ⟶ B, IsPointwiseEquivalence f) X
    (Over.mk (pullback.fst g universalLeftFibration))

/-! ## Layer 2: cofinal maps -/

/-- Restriction of sections along `v : K ⟶ B`: a section of `p : E ⟶ B` over `B` restricts to a
map `K ⟶ E` over `v`. In simplices, a map `B ⊗ Δ[n] ⟶ E` over the projection goes to its
composite with `v ▷ Δ[n]`. (README §2.1.1; HTT, Def. 4.1.1.1, the map `Map_B(B, E) ⟶ Map_B(K, E)`.) -/
noncomputable def sectionsRestrict {K B E : SSet.{u}} (p : E ⟶ B) (v : K ⟶ B) :
    (SSet.ihomOver p (𝟙 B) : SSet.{u}) ⟶ (SSet.ihomOver p v : SSet.{u}) :=
  SSet.ihomOver.homEquiv.symm
    ⟨v ▷ _ ≫ (SSet.ihomOver.homEquiv (𝟙 (SSet.ihomOver p (𝟙 B) : SSet.{u}))).1, by
      rw [Category.assoc, (SSet.ihomOver.homEquiv (𝟙 _)).2, Category.comp_id, whiskerRight_fst]⟩

/-- A map `v : K ⟶ B` of simplicial sets is *cofinal* when, for every right fibration
`p : E ⟶ B`, restriction of sections `Map_B(B, E) ⟶ Map_B(K, E)` is a weak homotopy equivalence.
Both sides are Kan complexes, so this is a homotopy equivalence. (README §2.1.1; HTT, Def. 4.1.1.1.) -/
def IsCofinal {K B : SSet.{u}} (v : K ⟶ B) : Prop :=
  ∀ (E : SSet.{u}) (p : E ⟶ B) [SSet.RightFibration p],
    SSet.IsWeakHomotopyEquivalence (sectionsRestrict p v)

/-! ## Layer 3: limits and colimits in spaces and in `Cat∞` -/

/-- **Lemma L: the ∞-category of spaces has small limits.** Every diagram `g : K ⟶ S` indexed by a
small simplicial set has a limit. (README §3.7.1; HTT, Cor. 4.2.4.8, for `A = Set_Δ`.) -/
theorem exists_isLimit_spaces (K : SSet.{u + 1}) [∀ n : SimplexCategoryᵒᵖ, Small.{u} (K.obj n)]
    (g : K ⟶ spaces.{u}) : ∃ c, slice.IsLimit g c := by
  sorry

/-- **The ∞-category of spaces has small colimits.** (README §3.3.1; HTT, Cor. 4.2.4.8, for
`A = Set_Δ`.) -/
theorem exists_isColimit_spaces (K : SSet.{u + 1}) [∀ n : SimplexCategoryᵒᵖ, Small.{u} (K.obj n)]
    (g : K ⟶ spaces.{u}) : ∃ c, coslice.IsColimit g c := by
  sorry

/-- **`Cat∞` has small limits.** (README §3.8.1; HTT, §3.3.3, introduction, with Cor. 4.2.4.8.) -/
theorem exists_isLimit_catInfty (K : SSet.{u + 1}) [∀ n : SimplexCategoryᵒᵖ, Small.{u} (K.obj n)]
    (g : K ⟶ SSet.catInfty.{u}) : ∃ c, slice.IsLimit g c := by
  sorry

/-- **`Cat∞` has small colimits.** (README §3.8.1; HTT, §3.3.3, introduction, with Cor. 4.2.4.8.) -/
theorem exists_isColimit_catInfty (K : SSet.{u + 1})
    [∀ n : SimplexCategoryᵒᵖ, Small.{u} (K.obj n)] (g : K ⟶ SSet.catInfty.{u}) :
    ∃ c, coslice.IsColimit g c := by
  sorry

/-! ## Layer 4: cofinality detected by colimits, invariance and factorization -/

/-- **Cofinality through colimits.** A map `v : K' ⟶ K` is cofinal exactly when, for every
∞-category `C` and every diagram `p : K ⟶ C`, restricting a colimit cocone of `p` along `v` gives
a colimit cocone of `v ≫ p`. Test ∞-categories are in the universe of the diagram.
(README §4.3.1; HTT, Prop. 4.1.1.8, (1) ⇔ (3).) -/
theorem isCofinal_iff_forall_isColimit {K' K : SSet.{u}} (v : K' ⟶ K) :
    IsCofinal v ↔ ∀ (C : SSet.{u}) [C.Quasicategory] (p : K ⟶ C) (c : (coslice p) _⦋0⦌),
      coslice.IsColimit p c →
        coslice.IsColimit (v ≫ p)
          ((coslice.map (q := v ≫ p) v (𝟙 C) (by simp)).app (Opposite.op ⦋0⦌) c) := by
  sorry

/-- **Cofinality is invariant under categorical equivalence.** For a categorical equivalence
`q : K' ⟶ K''`, a map `p : K ⟶ K'` is cofinal exactly when `p ≫ q` is.
(README §4.4.1; HTT, Cor. 4.1.1.9.) -/
theorem isCofinal_comp_iff_of_isCategoricalEquivalence {K K' K'' : SSet.{u}} (p : K ⟶ K')
    (q : K' ⟶ K'') (hq : IsCategoricalEquivalence q) : IsCofinal (p ≫ q) ↔ IsCofinal p := by
  sorry

/-- **Cofinal right fibrations are trivial fibrations.** A right fibration is cofinal exactly when
it has the right lifting property against monomorphisms. (README §4.5.1; HTT, Cor. 4.1.1.11.) -/
theorem isCofinal_iff_rlp_monomorphisms {X K : SSet.{u}} (p : X ⟶ K) [SSet.RightFibration p] :
    IsCofinal p ↔ (MorphismProperty.monomorphisms SSet.{u}).rlp p := by
  sorry

/-- **Cofinal maps factor through right anodyne maps.** A map is cofinal exactly when it is a
right anodyne map followed by a trivial fibration. (README §4.5.2; HTT, Cor. 4.1.1.12.) -/
theorem isCofinal_iff_exists_rightAnodyne_trivialFibration {K' K : SSet.{u}} (v : K' ⟶ K) :
    IsCofinal v ↔ ∃ (X : SSet.{u}) (i : K' ⟶ X) (q : X ⟶ K),
      SSet.rightAnodyneExtensions i ∧ (MorphismProperty.monomorphisms SSet.{u}).rlp q ∧
        i ≫ q = v := by
  sorry

/-! ## Layer 5: Quillen's Theorem A -/

/-- **Quillen's Theorem A for ∞-categories.** A map `f : C ⟶ D` to an ∞-category is cofinal
exactly when, for every object `d` of `D`, the fiber product `C ×_D D_{d/}` is weakly
contractible. (README §5.4.2; HTT, Thm. 4.1.3.1.) -/
theorem isCofinal_iff_isWeaklyContractible {C D : SSet.{u}} [D.Quasicategory] (f : C ⟶ D) :
    IsCofinal f ↔
      ∀ d : D _⦋0⦌, IsWeaklyContractible (pullback f (coslice.π (const d : Δ[0] ⟶ D))) := by
  sorry

/-- **Semisimplicial indexing is cofinal.** The inclusion of the opposite of the semi-simplex
category into the opposite of the simplex category induces a cofinal map of nerves.
(README §5.5.1; HTT, Lemma 6.5.3.7.) -/
theorem isCofinal_nerveMap_toSimplexCategory_op :
    IsCofinal (nerveMap SemiSimplexCategory.toSimplexCategory.op) := by
  sorry

/-! ## Layer 6: nerve replacements -/

/-- **Every simplicial set receives a cofinal map from the nerve of its category of simplices.**
The category of simplices of `K` is the opposite of the category of elements of `K`.
(README §6.4.1; HTT, Prop. 4.2.3.14, the existence assertion.) -/
theorem exists_isCofinal_nerve_elements_op (K : SSet.{u}) :
    ∃ f : nerve (Functor.Elements K)ᵒᵖ ⟶ K, IsCofinal f := by
  sorry

/-- **Every simplicial set receives a cofinal map from the nerve of a partially ordered set.**
(README §6.4.2; HTT, Variant 4.2.3.15, the existence assertion.) -/
theorem exists_isCofinal_nerve_partialOrder (K : SSet.{u}) :
    ∃ (P : Type u) (_ : PartialOrder P) (f : nerve P ⟶ K), IsCofinal f := by
  sorry

/-! ## Layer 7: relative colimits and Kan extensions -/

/-- The simplicial set `A_{/c} = A ×_C C_{/c}` of objects of a subcomplex `A ⊆ C` over a vertex
`c`. (README §7.1.2; HTT, Def. 4.3.2.2, the diagram `C⁰_{/c}`.) -/
noncomputable abbrev subcomplexOver {C : SSet.{u}} (A : C.Subcomplex) (c : C _⦋0⦌) : SSet.{u} :=
  pullback A.ι (slice.π (const c : Δ[0] ⟶ C))

/-- The tautological cocone `A_{/c} ⋆ Δ[0] ⟶ C` with cone point `c`, corresponding to the
projection `A_{/c} ⟶ C_{/c}`. (README §7.1.2; HTT, Def. 4.3.2.2.) -/
noncomputable def subcomplexOverCocone {C : SSet.{u}} (A : C.Subcomplex) (c : C _⦋0⦌) :
    join (subcomplexOver A c) Δ[0] ⟶ C :=
  (slice.homEquiv (pullback.snd A.ι (slice.π (const c : Δ[0] ⟶ C)))).1

/-- A functor `F : C ⟶ D` is a *left Kan extension of its restriction to `A` at `c`* when the
image under `F` of the tautological cocone over `A_{/c}` is a colimit cocone in `D`. Used when `C`
is an ∞-category and `A` is a full subcategory. (README §7.1.2; HTT, Def. 4.3.2.2, for the map from `D` to a
point.) -/
def IsLeftKanExtensionAt {C D : SSet.{u}} (A : C.Subcomplex) (F : C ⟶ D) (c : C _⦋0⦌) : Prop :=
  coslice.IsColimit (join.inl _ Δ[0] ≫ subcomplexOverCocone A c ≫ F)
    (yonedaEquiv ((coslice.homEquiv (p := join.inl _ Δ[0] ≫ subcomplexOverCocone A c ≫ F)
      (X := Δ[0])).symm ⟨subcomplexOverCocone A c ≫ F, rfl⟩))

/-- A functor `F : C ⟶ D` is a *left Kan extension of its restriction to `A`* when it is one at
every object of `C`. (README §7.1.2; HTT, Def. 4.3.2.2, for the map from `D` to a point.) -/
def IsLeftKanExtension {C D : SSet.{u}} (A : C.Subcomplex) (F : C ⟶ D) : Prop :=
  ∀ c : C _⦋0⦌, IsLeftKanExtensionAt A F c

/-- **Existence of left Kan extensions.** A functor `F₀` on a full subcategory `C⁰ ⊆ C` admits a
left Kan extension to `C` exactly when, for every object `c` of `C`, the diagram
`C⁰_{/c} ⟶ C⁰ ⟶ D` has a colimit. (README §7.4.2; HTT, Lemma 4.3.2.13, for the map from `D` to a
point.) -/
theorem exists_isLeftKanExtension_iff {C D : SSet.{u}} [C.Quasicategory] [D.Quasicategory]
    (P : C _⦋0⦌ → Prop) (F₀ : (C.fullEnhancedSubcategory P : SSet.{u}) ⟶ D) :
    (∃ F : C ⟶ D, (C.fullEnhancedSubcategory P).ι ≫ F = F₀ ∧
        IsLeftKanExtension (C.fullEnhancedSubcategory P) F) ↔
      ∀ c : C _⦋0⦌, ∃ x, coslice.IsColimit
        (pullback.fst (C.fullEnhancedSubcategory P).ι (slice.π (const c : Δ[0] ⟶ C)) ≫ F₀) x := by
  sorry

/-- The full subcategory of `Fun(C, D)` spanned by the left Kan extensions of their restrictions
to `A`. (README §7.4.3; HTT, Prop. 4.3.2.15, the subcategory `K`.) -/
def leftKanExtensions {C : SSet.{u}} (A : C.Subcomplex) (D : SSet.{u}) :
    ((ihom C).obj D).Subcomplex :=
  ((ihom C).obj D).fullEnhancedSubcategory fun F ↦ IsLeftKanExtension A (ihomObj₀Equiv C D F)

/-- The full subcategory of `Fun(C⁰, D)` spanned by the functors `F₀` such that, for every object
`c` of `C`, the diagram `C⁰_{/c} ⟶ C⁰ ⟶ D` has a colimit. (README §7.4.3; HTT, Prop. 4.3.2.15, the
subcategory `K⁰`, for the map from `D` to a point.) -/
def pointwiseColimitFunctors {C : SSet.{u}} (P : C _⦋0⦌ → Prop) (D : SSet.{u}) :
    ((ihom (C.fullEnhancedSubcategory P : SSet.{u})).obj D).Subcomplex :=
  ((ihom (C.fullEnhancedSubcategory P : SSet.{u})).obj D).fullEnhancedSubcategory fun F₀ ↦
    ∀ c : C _⦋0⦌, ∃ x, coslice.IsColimit
      (pullback.fst (C.fullEnhancedSubcategory P).ι (slice.π (const c : Δ[0] ⟶ C)) ≫
        ihomObj₀Equiv _ D F₀) x

/-- **Left Kan extension is a trivial fibration.** For a full subcategory `C⁰ ⊆ C`, restriction
carries the left Kan extensions of their restrictions into the functors on `C⁰` with all pointwise
colimits, and the resulting map between these full subcategories is a trivial fibration.
(README §7.4.3; HTT, Prop. 4.3.2.15, for the map from `D` to a point.) -/
theorem exists_rlp_monomorphisms_leftKanExtensions_restrict {C D : SSet.{u}} [C.Quasicategory]
    [D.Quasicategory] (P : C _⦋0⦌ → Prop) :
    ∃ h : Subcomplex.range ((leftKanExtensions (C.fullEnhancedSubcategory P) D).ι ≫
        (pre (C.fullEnhancedSubcategory P).ι).app D) ≤ pointwiseColimitFunctors P D,
      (MorphismProperty.monomorphisms SSet.{u}).rlp (Subcomplex.lift _ h) := by
  sorry

/-! ## Layer 8: colimits in functor ∞-categories -/

/-- The ∞-category of presheaves `P(K) = Fun(K^op, S)` on a small simplicial set, a large
simplicial set. (README §8.1.1; HTT, Def. 5.1.0.1.) -/
noncomputable def presheaf (K : SSet.{u}) : SSet.{u + 1} :=
  (ihom (SSet.uliftFunctor.{u + 1, u}.obj (SSet.opFunctor.obj K))).obj spaces.{u}

/-- **Functor ∞-categories have pointwise colimits.** If an ∞-category `C` has `K`-indexed
colimits, so does `Fun(T, C)`. (README §8.2.3; HTT, Cor. 5.1.2.3, first assertion.) -/
theorem exists_isColimit_ihom {K T C : SSet.{u}} [C.Quasicategory]
    (hC : ∀ q : K ⟶ C, ∃ x, coslice.IsColimit q x) (p : K ⟶ (ihom T).obj C) :
    ∃ c, coslice.IsColimit p c := by
  sorry

/-- **Colimits in functor ∞-categories are computed pointwise.** If an ∞-category `C` has
`K`-indexed colimits, a cocone under `p : K ⟶ Fun(T, C)` is a colimit exactly when its evaluation
at every vertex of `T` is, evaluation being Tau Ceti's `SSet.evalAt`. (README §8.2.3; HTT, Cor. 5.1.2.3,
second assertion.) -/
theorem isColimit_iff_forall_isColimit_evalAt {K T C : SSet.{u}} [C.Quasicategory]
    (hC : ∀ q : K ⟶ C, ∃ x, coslice.IsColimit q x) (p : K ⟶ (ihom T).obj C)
    (c : (coslice p) _⦋0⦌) :
    coslice.IsColimit p c ↔ ∀ t : T _⦋0⦌, coslice.IsColimit (p ≫ SSet.evalAt t C)
      ((coslice.map (q := p ≫ SSet.evalAt t C) (𝟙 K) (SSet.evalAt t C) (by simp)).app
        (Opposite.op ⦋0⦌) c) := by
  sorry

/-- **Presheaf ∞-categories have small colimits.** (README §8.2.3; HTT, Cor. 5.1.2.4.) -/
theorem exists_isColimit_presheaf (S : SSet.{u}) (K : SSet.{u + 1})
    [∀ n : SimplexCategoryᵒᵖ, Small.{u} (K.obj n)] (g : K ⟶ presheaf S) :
    ∃ c, coslice.IsColimit g c := by
  sorry

/-- **Presheaf ∞-categories have small limits.** (README §8.2.3; HTT, Cor. 5.1.2.4.) -/
theorem exists_isLimit_presheaf (S : SSet.{u}) (K : SSet.{u + 1})
    [∀ n : SimplexCategoryᵒᵖ, Small.{u} (K.obj n)] (g : K ⟶ presheaf S) :
    ∃ c, slice.IsLimit g c := by
  sorry

/-- **Colimits in spaces through the classified left fibration.** Let `q : X ⟶ K ⋆ Δ[0]` be a left
fibration classified by `g : K ⋆ Δ[0] ⟶ S`. Then `g` is a colimit diagram exactly when the
inclusion `X ×_{K ⋆ Δ[0]} K ⟶ X` is a weak homotopy equivalence. (README §8.3.1; HTT, Prop. 3.3.4.5,
(1) ⇔ (3).) -/
theorem isColimit_iff_isWeakHomotopyEquivalence (K X : SSet.{u + 1})
    [∀ n : SimplexCategoryᵒᵖ, Small.{u} (K.obj n)] (q : X ⟶ join K Δ[0]) [SSet.LeftFibration q]
    (g : join K Δ[0] ⟶ spaces.{u}) (hg : ClassifiesLeft (Over.mk q) g) :
    coslice.IsColimit (join.inl K Δ[0] ≫ g)
        (yonedaEquiv ((coslice.homEquiv (p := join.inl K Δ[0] ≫ g) (X := Δ[0])).symm ⟨g, rfl⟩)) ↔
      SSet.IsWeakHomotopyEquivalence (pullback.fst q (join.inl K Δ[0])) := by
  sorry

/-! ## Layer 9: simplicial objects -/


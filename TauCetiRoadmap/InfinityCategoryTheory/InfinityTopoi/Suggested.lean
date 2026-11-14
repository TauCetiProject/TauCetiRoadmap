/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.Cartesian
public import TauCeti.AlgebraicTopology.Quasicategory.InitialVertex
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.Quasicategory.TerminalVertex
public import TauCeti.AlgebraicTopology.SimplicialSet.Join.StdSimplex
public import TauCeti.AlgebraicTopology.SimplicialSet.WeaklyContractible

/-!
# ∞-topoi, sheaves, connectivity and n-topoi: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the headline theorems of the
roadmap that can be written against the pinned Mathlib and Tau Ceti, with the few definitions they
need, in the order of the README. An ∞-category is a quasicategory, limits and colimits are Tau
Ceti's `SSet.slice.IsLimit` and `SSet.coslice.IsColimit`, and a square is a map out of
`Δ[1] ⊗ Δ[1]`.

Stated below:
* disjoint coproducts (§1.1.2);
* the codomain fibration `Fun(Δ[1], 𝒳) ⟶ 𝒳`: its Cartesian edges are the pullback squares, and it
  is a Cartesian fibration exactly when `𝒳` has pullbacks (§1.2.1);
* left exactness at an object, and left exactness as preservation of final objects together with
  left exactness at every object (§4.1.1);
* equivalence relations of sets are effective, and the effective epimorphisms of sets are the
  surjections (§7.7.1);
* group objects in group objects of a Cartesian monoidal category are commutative groups (§13.3.1);
* the order-theoretic core of HTT, Prop. 6.4.2.5: in a complete lattice colimits are universal
  exactly when the frame law holds (§18.2.1).

The covering topology of a locale (§18.3.1) is a README definition and is not declared here.

Not statable at the pins. Presentability rests on κ-compact objects and accessibility, defined
through the Yoneda embedding into the ∞-category of spaces `S`, which needs `Ex^∞` and the
rigidification `C[−]` on all simplicial sets; neither is at the pins. Every headline theorem of the
README concerns presentable ∞-categories, ∞-topoi or n-topoi, so none is stated here. The missing
carrier of each:
* Giraud's theorem (§4.4.1): presentable ∞-categories, presheaf ∞-categories `P(C)` and their
  accessible left exact localizations, and effective groupoid objects (Čech nerves, below);
* Rezk's characterization by object classifiers (§5.3.1): presentable ∞-categories and relatively
  κ-compact morphisms;
* sheaves form an ∞-topos (§8.3.1), Grothendieck topologies correspond to topological localizations
  (§8.4.1), and the universal property of sheaves (§9.1.1): `S`, `P(C)` and its localizations;
* `LTop` has small limits (§11.1.1) and `S` is final in `RTop` (§10.5.1): ∞-topoi, hence
  presentability, and `S`;
* effective epimorphisms are detected on 0-truncations (§14.1.1), the (n + 1)-connective and
  n-truncated factorization system (§14.7.1), delooping in an ∞-topos (§15.1.1) and the
  classification of Eilenberg–MacLane objects (§15.2.1): ∞-topoi and their truncation functors,
  which are constructed through presentability;
* descent for truncated morphisms (§17.2.1): presentable ∞-categories, and local classes, defined
  through the classifying functor `𝒳ᵒᵖ ⟶ Ĉat∞` of the Cartesian fibration `O_𝒳 ⟶ 𝒳`;
* locales are the 0-topoi (§18.3.2, with HTT, Prop. 6.4.2.5 at §18.2.1): presentable 0-categories
  and sheaves; the order-theoretic core of §18.2.1 is stated below;
* the characterization of n-topoi (§19.4.1) and localic reflection (§20.2.1): n-topoi, which are
  accessible left exact localizations of `P≤n−1(C)`.
The other statements of Layers 2–20 that involve presentability are recorded in the README only.
Statements that need no presentability are also missing a carrier:
* Cartesian transformations and the fat-join criterion (§1.4.1, §1.4.2): Tau Ceti has no fat join;
* groupoid objects, Čech nerves and effective groupoids (§3.1.1, §4.1.2, §4.2, §13.1–§13.5): the
  square from `U([n])` to `U(T)` and `U(T′)` is read off a functor of posets into `Δᵒᵖ`, and
  Mathlib has no isomorphism `nerve Cᵒᵖ ≅ (nerve C).op`; Čech nerves are right Kan extensions,
  which neither library has;
* gluing homotopy Cartesian squares of simplicial sets (§3.2.1): Mathlib has no homotopy pullback
  squares for the Kan–Quillen model structure;
* the extra-degeneracy lemma (§3.4.1): it needs colimits indexed by `N(Δ₊)ᵒᵖ` with a cone point,
  which is not the shape of `SSet.coslice.IsColimit`, and the category `Δ_∞`;
* group objects of `CommGrp(A)` (§13.3.1, second claim): Mathlib has no Cartesian monoidal
  structure on `CommGrp(A)`.

Repeated definitions. `IsColimitDiagram`, `IsLimitDiagram`, `IsLeftExact`, the square coordinates
and shapes, `IsPushoutSquare` and `IsPullbackSquare` are owned by Part InfinityCategoryFoundations (§1.2.4); they are
restated here with the same names and bodies, since roadmap files do not import each other.
Evaluation at a vertex is Tau Ceti's `SSet.evalAt`; at the vertex `1` of `Δ[1]` it is the
codomain fibration `O_C ⟶ C` of Conventions 3.
-/

public section

namespace TauCetiRoadmap.InfinityCategoryTheory.InfinityTopoi

open CategoryTheory Limits MonoidalCategory MonoidalClosed CartesianMonoidalCategory Simplicial

universe v u

/-! ## Repeated definitions: diagrams, squares and evaluation -/

section Squares

open SSet

/-- A map `p̄ : K ⋆ Δ[0] ⟶ C` out of the right cone is a *colimit diagram* when the cocone it
determines under `p = p̄|K` is a colimit cocone in the sense of Tau Ceti's `SSet.coslice.IsColimit`;
used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated here. (README §1.1.2,
via Part InfinityCategoryFoundations §1.2.4; HTT, Def. 1.2.13.4, p. 65.) -/
def IsColimitDiagram {K C : SSet.{u}} (q : join K Δ[0] ⟶ C) : Prop :=
  coslice.IsColimit (join.inl _ _ ≫ q)
    ((coslice.objEquiv (p := join.inl _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- A map `p̄ : Δ[0] ⋆ K ⟶ C` out of the left cone is a *limit diagram* when the cone it determines
over `p = p̄|K` is a limit cone in the sense of Tau Ceti's `SSet.slice.IsLimit`; used for
∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated here. (README §1.1.2, via Part
InfinityCategoryFoundations §1.2.4; HTT, Def. 1.2.13.4, p. 65.) -/
def IsLimitDiagram {K C : SSet.{u}} (q : join Δ[0] K ⟶ C) : Prop :=
  slice.IsLimit (join.inr _ _ ≫ q)
    ((slice.objEquiv (p := join.inr _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- A functor `F : C ⟶ D` is *left exact* when it preserves finite limits: it carries every limit
diagram `Δ[0] ⋆ K ⟶ C` with `K` finite (finitely many nondegenerate simplices) to a limit diagram.
Used for ∞-categories `C` and `D` admitting finite limits. Owned by Part InfinityCategoryFoundations (§1.2.4) and
restated here. (README §4.1.1, via Part InfinityCategoryFoundations §1.2.4; HTT, Remark 5.3.2.10.) -/
def IsLeftExact {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) [Finite K.N] (q : join Δ[0] K ⟶ C), IsLimitDiagram q → IsLimitDiagram (q ≫ F)

/-- The first coordinate of the span `Λ[2, 0]` inside the square: the vertices `0, 1, 2` go to
`0, 1, 0`. Owned by Part InfinityCategoryFoundations (§1.2.4). (README §1.1.2; HTT, §4.4.2, p. 313.) -/
noncomputable def spanCoord₁ : (Λ[2, 0] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₀.isPushout.desc (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The second coordinate of the span `Λ[2, 0]` inside the square: the vertices `0, 1, 2` go to
`0, 0, 1`. Owned by Part InfinityCategoryFoundations (§1.2.4). (README §1.1.2; HTT, §4.4.2, p. 313.) -/
noncomputable def spanCoord₂ : (Λ[2, 0] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₀.isPushout.desc (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) (𝟙 _) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The first coordinate of the cospan `Λ[2, 2]` inside the square: the vertices `0, 1, 2` go
to `1, 0, 1`. Owned by Part InfinityCategoryFoundations (§1.2.4). (README §1.1.2; HTT, §4.4.2, p. 313.) -/
noncomputable def cospanCoord₁ : (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (𝟙 _) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The second coordinate of the cospan `Λ[2, 2]` inside the square: the vertices `0, 1, 2` go
to `0, 1, 1`. Owned by Part InfinityCategoryFoundations (§1.2.4). (README §1.1.2; HTT, §4.4.2, p. 313.) -/
noncomputable def cospanCoord₂ : (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The square `Δ[1] × Δ[1]` read as a cocone `Λ[2, 0] ⋆ Δ[0]`: the span vertices go to
`(0, 0)`, `(1, 0)`, `(0, 1)` and the cone point to `(1, 1)`; this map is an isomorphism. Owned by
Part InfinityCategoryFoundations (§1.2.4). (README §1.1.2; HTT, §4.4.2, p. 313.) -/
noncomputable def coconeShape : join (Λ[2, 0] : SSet.{u}) Δ[0] ⟶ Δ[1] ⊗ Δ[1] :=
  lift (join.map spanCoord₁ (𝟙 _) ≫ (join.stdSimplexIso 1 0).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 1))
    (join.map spanCoord₂ (𝟙 _) ≫ (join.stdSimplexIso 1 0).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 1))

/-- The square `Δ[1] × Δ[1]` read as a cone `Δ[0] ⋆ Λ[2, 2]`: the cone point goes to `(0, 0)`
and the cospan vertices to `(1, 0)`, `(0, 1)`, `(1, 1)`; this map is an isomorphism. Owned by
Part InfinityCategoryFoundations (§1.2.4). (README §1.1.2; HTT, §4.4.2, p. 313.) -/
noncomputable def coneShape : join Δ[0] (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] ⊗ Δ[1] :=
  lift (join.map (𝟙 _) cospanCoord₁ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))
    (join.map (𝟙 _) cospanCoord₂ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))

/-- A square is a pushout square when, read as a cocone `Λ[2, 0] ⋆ Δ[0] ⟶ C` under its span, it
is a colimit diagram; used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated
here. (README §1.1.2; HTT, §4.4.2, p. 313, with Def. 1.2.13.4.) -/
def IsPushoutSquare {C : SSet.{u}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsColimitDiagram (coconeShape ≫ s)

/-- A square is a pullback square when, read as a cone `Δ[0] ⋆ Λ[2, 2] ⟶ C` over its cospan, it
is a limit diagram; used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated
here. (README §1.2.1; HTT, §4.4.2, p. 313, with Def. 1.2.13.4.) -/
def IsPullbackSquare {C : SSet.{u}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsLimitDiagram (coneShape ≫ s)

end Squares

/-! ## Layer 1: Universal colimits -/

section UniversalColimits

open SSet

/-- Coproducts in `C` are *disjoint* when every pushout square whose vertex `(0, 0)` is an initial
object, a square `∅ ⟶ X, ∅ ⟶ Y, X ⟶ X ⊔ Y, Y ⟶ X ⊔ Y`, is also a pullback square; used for
∞-categories `C` with finite coproducts. (README §1.1.2; HTT, §6.1.1, p. 552, the paragraph after
Prop. 6.1.1.4.) -/
def HasDisjointCoproducts (C : SSet.{u}) : Prop :=
  ∀ s : Δ[1] ⊗ Δ[1] ⟶ C,
    C.IsInitialVertex (SSet.yonedaEquiv (lift (SSet.stdSimplex.δ 1) (SSet.stdSimplex.δ 1) ≫ s)) →
      IsPushoutSquare s → IsPullbackSquare s

/-- **Cartesian edges of the codomain fibration.** For an ∞-category `𝒳`, an edge of
`O_𝒳 = Fun(Δ[1], 𝒳)` is Cartesian for evaluation at the vertex `1` exactly when the square of `𝒳`
it represents is a pullback square. The square has the source arrow as its edge `Δ[1] × {0}` and the
target arrow as its edge `Δ[1] × {1}`. (README §1.2.1; HTT, Lemma 6.1.1.1, p. 549.) -/
theorem isCartesian_evalAt_iff_isPullbackSquare (X : SSet.{u}) [X.Quasicategory]
    {f g : ((ihom Δ[1]).obj X) _⦋0⦌} (e : Edge f g) :
    e.IsCartesian (SSet.evalAt (SSet.stdSimplex.obj₀Equiv.symm 1) X) ↔
      IsPullbackSquare (MonoidalClosed.uncurry (SSet.yonedaEquiv.symm e.edge)) := by
  sorry

/-- **The codomain fibration is Cartesian exactly when pullbacks exist.** For an ∞-category `𝒳`,
evaluation `Fun(Δ[1], 𝒳) ⟶ 𝒳` at the vertex `1` is a Cartesian fibration exactly when every cospan
`Λ[2, 2] ⟶ 𝒳` is the restriction of a pullback square. (README §1.2.1; HTT, Lemma 6.1.1.1,
p. 549.) -/
theorem cartesianFibration_evalAt_iff (X : SSet.{u}) [X.Quasicategory] :
    CartesianFibration
        (SSet.evalAt (SSet.stdSimplex.obj₀Equiv.symm 1 : (Δ[1] : SSet.{u}) _⦋0⦌) X) ↔
      ∀ c : (Λ[2, 2] : SSet.{u}) ⟶ X,
        ∃ s : Δ[1] ⊗ Δ[1] ⟶ X, IsPullbackSquare s ∧ join.inr _ _ ≫ coneShape ≫ s = c := by
  sorry

end UniversalColimits

/-! ## Layer 4: Giraud's theorem -/

section LeftExactness

open SSet

/-- A functor `f : 𝒳 ⟶ 𝒴` is *left exact at* an object `z` of `𝒳` when it carries every pullback
square of `𝒳` with final corner `(1, 1)` at `z` to a pullback square of `𝒴`; used for ∞-categories
with finite limits. (README §4.1.1; HTT, Def. 6.1.4.1, p. 574.) -/
def IsLeftExactAt {X Y : SSet.{u}} (f : X ⟶ Y) (z : X _⦋0⦌) : Prop :=
  ∀ s : Δ[1] ⊗ Δ[1] ⟶ X,
    SSet.yonedaEquiv (lift (SSet.stdSimplex.δ 0) (SSet.stdSimplex.δ 0) ≫ s) = z →
      IsPullbackSquare s → IsPullbackSquare (s ≫ f)

/-! ## Layer 7: Effective epimorphisms -/

/-! ## Layer 13: Group objects -/

/-! ## Layer 18: Locales and 0-topoi -/


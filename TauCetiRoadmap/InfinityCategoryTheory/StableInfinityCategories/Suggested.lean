/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence
public import TauCeti.AlgebraicTopology.Quasicategory.FullSubcategory
public import TauCeti.AlgebraicTopology.Quasicategory.InitialVertex
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.Quasicategory.TerminalVertex
public import TauCeti.AlgebraicTopology.SimplicialSet.Join.StdSimplex
public import TauCeti.AlgebraicTopology.SimplicialSet.WeaklyContractible

/-!
# Stable ∞-categories, t-structures and spectra: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the headline theorems of the
roadmap that can be written against the pinned Mathlib and Tau Ceti, with the few definitions they
need, in the order of the README.

Stated below:
* zero objects, pointed and stable ∞-categories (§1.1), with pushout and pullback squares read
  through Tau Ceti's `SSet.coslice.IsColimit` and `SSet.slice.IsLimit`; the stability of opposites
  (§1.2), of functor ∞-categories (§2.1) and of products (§6.2); the pushout–pullback criterion
  (§2.2); exact functors and the finite-limit criterion (§2.3), and exactness into a product (§6.2);
* the comparison of Lurie's homological t-structures with Mathlib's `Triangulated.TStructure`
  (§3.1), and the abelian heart of a t-structure on a triangulated category (§3.3);
* the full faithfulness of the classical Dold–Kan functor for every additive category (§5.3);
* the loop criterion for stability (§7.5): a pointed ∞-category is stable exactly when it has
  finite limits and a loop functor is a categorical equivalence;
* the ∞-categorical Dold–Kan correspondence (§12.1), as the existence of a categorical equivalence.

Not statable at the pins:
* shifts, the triangulated homotopy category and Ext groups (§1.3–§1.8): suspension and loop
  functors exist as sections of trivial fibrations, which can be quantified over (as with
  `loopSquares` below) but not chosen, since neither library constructs them, so the
  `HasShift`, `Preadditive` and `Pretriangulated` structures on `SSet.hoFunctor.obj C` cannot be
  written without sorried data; the same holds for everything that
  uses the triangulated structure: t-structures on stable ∞-categories, truncation functors, π₀ and
  t-exact functors (§3.1–§3.5), the Milnor sequence (§6.1), ℤ-complexes and the chain complex of a
  filtered object (§4.1), and the spectral sequences (§12.2–§12.4);
* the comparison of Lurie's additive categories with Mathlib's (§1.4): the commutative monoid
  structure on Hom(X, Y) induced by the biproducts is not in Mathlib for categories that are not
  preadditive;
* the closure lemma for stable subcategories (§2.1), t-structures from localizations (§3.4) and
  colimits over truncated simplex categories (§4.2): they are phrased through shifts or t-structures,
  as above; Ind_κ and idempotent completions (§6.1): neither library has an Ind-completion;
* Cat∞^Ex with its limits and filtered colimits, and Verdier quotients (§6.2, §6.3): Tau Ceti's
  `SSet.catInfty` is not proved to be a quasicategory, and neither library has the localization
  C[W⁻¹] of a quasicategory;
* excisive functors, spectrum objects, stabilization, spectra and the sphere spectrum (Layer 7,
  §9.1–§9.3, Layer 10), except the loop criterion stated below: they need the finite pointed
  spaces, the finite-colimit closure of the point among pointed spaces, which is in neither library;
* completions of t-structures, accessible t-structures, the t-structure on spectra and
  compatibility with filtered colimits (Layers 8 and 11): they need t-structures on stable
  ∞-categories, as above, and presentability;
* the Tot tower and cosimplicial replacement (§12.1): they need right Kan extensions along
  `N(Δ≤n) ⊆ N(Δ)`, which neither library has.

The definitions `IsColimitDiagram`, `IsLimitDiagram`, `IsLeftExact`, the square coordinates and
shapes, `IsPushoutSquare` and `IsPullbackSquare` are owned by Part InfinityCategoryFoundations (§1.2), and
`simplicialObjects` by Part LimitsAndKanExtensions (§9.1); they are restated here with the same
names and bodies, since roadmap files do not import each other. Evaluation at a vertex is Tau
Ceti's `SSet.evalAt`.
-/

public section

namespace TauCetiRoadmap.InfinityCategoryTheory.StableInfinityCategories

open CategoryTheory Limits MonoidalCategory MonoidalClosed CartesianMonoidalCategory Simplicial

universe u

/-! ## Layer 1: Stable ∞-categories -/

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

/-- The first coordinate of the span `Λ[2, 0]` inside the square: the vertices `0, 1, 2` go to
`0, 1, 0`. Owned by Part InfinityCategoryFoundations (§1.2.4). (README, Conventions; HTT, §4.4.2, p. 313.) -/
noncomputable def spanCoord₁ : (Λ[2, 0] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₀.isPushout.desc (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The second coordinate of the span `Λ[2, 0]` inside the square: the vertices `0, 1, 2` go to
`0, 0, 1`. Owned by Part InfinityCategoryFoundations (§1.2.4). (README, Conventions; HTT, §4.4.2, p. 313.) -/
noncomputable def spanCoord₂ : (Λ[2, 0] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₀.isPushout.desc (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) (𝟙 _) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The first coordinate of the cospan `Λ[2, 2]` inside the square: the vertices `0, 1, 2` go
to `1, 0, 1`. Owned by Part InfinityCategoryFoundations (§1.2.4). (README, Conventions; HTT, §4.4.2, p. 313.) -/
noncomputable def cospanCoord₁ : (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (𝟙 _) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The second coordinate of the cospan `Λ[2, 2]` inside the square: the vertices `0, 1, 2` go
to `0, 1, 1`. Owned by Part InfinityCategoryFoundations (§1.2.4). (README, Conventions; HTT, §4.4.2, p. 313.) -/
noncomputable def cospanCoord₂ : (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] :=
  horn₂₂.isPushout.desc (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (by
    simp only [Category.comp_id, CosimplicialObject.δ, ← Functor.map_comp]; congr 1
    ext i; fin_cases i; rfl)

/-- The square `Δ[1] × Δ[1]` read as a cocone `Λ[2, 0] ⋆ Δ[0]`: the span vertices go to
`(0, 0)`, `(1, 0)`, `(0, 1)` and the cone point to `(1, 1)`; this map is an isomorphism. Owned by
Part InfinityCategoryFoundations (§1.2.4). (README, Conventions; HTT, §4.4.2, p. 313.) -/
noncomputable def coconeShape : join (Λ[2, 0] : SSet.{u}) Δ[0] ⟶ Δ[1] ⊗ Δ[1] :=
  lift (join.map spanCoord₁ (𝟙 _) ≫ (join.stdSimplexIso 1 0).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 1))
    (join.map spanCoord₂ (𝟙 _) ≫ (join.stdSimplexIso 1 0).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 1))

/-- The square `Δ[1] × Δ[1]` read as a cone `Δ[0] ⋆ Λ[2, 2]`: the cone point goes to `(0, 0)`
and the cospan vertices to `(1, 0)`, `(0, 1)`, `(1, 1)`; this map is an isomorphism. Owned by
Part InfinityCategoryFoundations (§1.2.4). (README, Conventions; HTT, §4.4.2, p. 313.) -/
noncomputable def coneShape : join Δ[0] (Λ[2, 2] : SSet.{u}) ⟶ Δ[1] ⊗ Δ[1] :=
  lift (join.map (𝟙 _) cospanCoord₁ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))
    (join.map (𝟙 _) cospanCoord₂ ≫ (join.stdSimplexIso 0 1).hom ≫
      SSet.stdSimplex.map (SimplexCategory.σ 0))

/-- A square is a pushout square when, read as a cocone `Λ[2, 0] ⋆ Δ[0] ⟶ C` under its span, it
is a colimit diagram; used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated
here. (README, Conventions and §1.1.2; HTT, §4.4.2, p. 313, with Def. 1.2.13.4.) -/
def IsPushoutSquare {C : SSet.{u}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsColimitDiagram (coconeShape ≫ s)

/-- A square is a pullback square when, read as a cone `Δ[0] ⋆ Λ[2, 2] ⟶ C` over its cospan, it
is a limit diagram; used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations (§1.2.4) and restated
here. (README, Conventions and §1.1.2; HTT, §4.4.2, p. 313, with Def. 1.2.13.4.) -/
def IsPullbackSquare {C : SSet.{u}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsLimitDiagram (coneShape ≫ s)

end Squares

section Stable

open SSet

/-- A zero object: a vertex that is both initial and final; used for ∞-categories `C`. Owned by
Part InfinityCategoryFoundations (§1.2.3) and restated here. (HTT, Def. 7.2.2.7, p. 743; HA, Def. 1.1.1.1, p. 17.) -/
def IsZeroObject {C : SSet.{u}} (x : C _⦋0⦌) : Prop :=
  C.IsInitialVertex x ∧ C.IsTerminalVertex x

/-- A pointed ∞-category: an ∞-category with a zero object. (README §1.1.1; HA, Def. 1.1.1.1,
p. 17.) -/
def IsPointed (C : SSet.{u}) : Prop := C.Quasicategory ∧ ∃ x : C _⦋0⦌, IsZeroObject x

/-- The vertex `(0, 1)` of a square, the corner that is a zero object in a triangle.
(README §1.1.2; HA, Def. 1.1.1.4, p. 18.) -/
noncomputable def corner {C : SSet.{u}} (s : Δ[1] ⊗ Δ[1] ⟶ C) : C _⦋0⦌ :=
  yonedaEquiv (lift (SSet.stdSimplex.δ 1) (SSet.stdSimplex.δ 0) ≫ s)

/-- A stable ∞-category: an ∞-category with a zero object in which every edge has a fiber and a
cofiber, and a square with zero corner `(0, 1)` is a pullback exactly when it is a pushout.
In a cofiber sequence the edge is `Δ[1] × {0}`; in a fiber sequence it is `{1} × Δ[1]`.
(README §1.1.3; HA, Defs. 1.1.1.4, 1.1.1.6, 1.1.1.9, pp. 18–19.) -/
def IsStable (C : SSet.{u}) : Prop :=
  IsPointed C ∧
  (∀ e : Δ[1] ⟶ C, ∃ s : Δ[1] ⊗ Δ[1] ⟶ C, IsZeroObject (corner s) ∧ IsPullbackSquare s ∧
      lift (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 1)) (𝟙 _) ≫ s = e) ∧
  (∀ e : Δ[1] ⟶ C, ∃ s : Δ[1] ⊗ Δ[1] ⟶ C, IsZeroObject (corner s) ∧ IsPushoutSquare s ∧
      lift (𝟙 _) (SSet.stdSimplex.map (SimplexCategory.const ⦋1⦌ ⦋1⦌ 0)) ≫ s = e) ∧
  ∀ s : Δ[1] ⊗ Δ[1] ⟶ C, IsZeroObject (corner s) → (IsPullbackSquare s ↔ IsPushoutSquare s)

/-- The opposite of a stable ∞-category is stable: passing to the opposite exchanges zero objects,
fiber and cofiber sequences. (README §1.2.1; HA, Rem. 1.1.1.13, p. 20.) -/
theorem isStable_op {C : SSet.{u}} (hC : IsStable C) : IsStable C.op := by
  sorry

end Stable

/-! ## Layer 2: Stability criteria and exact functors -/

section Criteria

open SSet

/-- If `C` is a stable ∞-category and `K` is a simplicial set, the functor ∞-category `Fun(K, C)`
is stable: zero objects, fibers and cofibers are computed pointwise. (README §2.1.1; HA,
Prop. 1.1.3.1, p. 30.) -/
theorem isStable_ihom {C : SSet.{u}} (hC : IsStable C) (K : SSet.{u}) :
    IsStable ((ihom K).obj C) := by
  sorry

/-- **The pushout–pullback criterion.** A pointed ∞-category is stable exactly when it has finite
colimits and finite limits (every diagram indexed by a simplicial set with finitely many
nondegenerate simplices extends to a colimit and to a limit diagram) and a square in it is a
pushout exactly when it is a pullback. (README §2.2.1; HA, Prop. 1.1.3.4, p. 31.) -/
theorem isStable_iff_of_isPointed {C : SSet.{u}} (hC : IsPointed C) :
    IsStable C ↔
      (∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ C),
          ∃ q : join K Δ[0] ⟶ C, join.inl _ _ ≫ q = p ∧ IsColimitDiagram q) ∧
      (∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ C),
          ∃ q : join Δ[0] K ⟶ C, join.inr _ _ ≫ q = p ∧ IsLimitDiagram q) ∧
      ∀ s : Δ[1] ⊗ Δ[1] ⟶ C, IsPushoutSquare s ↔ IsPullbackSquare s := by
  sorry

/-- A functor `F : C ⟶ D` is *left exact* when it preserves finite limits: it carries every limit
diagram `Δ[0] ⋆ K ⟶ C` with `K` finite (finitely many nondegenerate simplices) to a limit diagram.
Used for ∞-categories `C` and `D` admitting finite limits. Owned by Part InfinityCategoryFoundations (§1.2.4)
and restated here. (README §2.3.2, via Part InfinityCategoryFoundations §1.2.4; HTT, Rem. 5.3.2.10, p. 411.) -/
def IsLeftExact {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) [Finite K.N] (q : join Δ[0] K ⟶ C), IsLimitDiagram q → IsLimitDiagram (q ≫ F)

/-- A functor `F : C ⟶ D` is *right exact* when it preserves finite colimits: it carries every
colimit diagram `K ⋆ Δ[0] ⟶ C` with `K` finite to a colimit diagram. Used for ∞-categories `C`
and `D` admitting finite colimits. (README §2.3.2; HTT, Rem. 5.3.2.10, p. 411, dual form.) -/
def IsRightExact {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) [Finite K.N] (q : join K Δ[0] ⟶ C),
    IsColimitDiagram q → IsColimitDiagram (q ≫ F)

/-- A functor between stable ∞-categories is *exact* when it carries zero objects to zero objects
and fiber sequences (pullback squares with zero corner `(0, 1)`) to fiber sequences; used for
stable `C` and `D`. (README §2.3.1; HA, §1.1.4, opening definition, p. 33.) -/
def IsExact {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  (∀ x : C _⦋0⦌, IsZeroObject x → IsZeroObject (F.app _ x)) ∧
  ∀ s : Δ[1] ⊗ Δ[1] ⟶ C, IsZeroObject (corner s) → IsPullbackSquare s →
    IsPullbackSquare (s ≫ F)

/-- **The finite-limit criterion.** For a functor between stable ∞-categories, preserving finite
limits, preserving finite colimits and being exact are equivalent. (README §2.3.2; HA,
Prop. 1.1.4.1, p. 33.) -/
theorem isExact_tfae {C D : SSet.{u}} (hC : IsStable C) (hD : IsStable D) (F : C ⟶ D) :
    List.TFAE [IsLeftExact F, IsRightExact F, IsExact F] := by
  sorry

end Criteria

/-! ## Layer 3: t-structures on triangulated categories and hearts -/

section TStructure

open Pretriangulated Triangulated

variable (D : Type*) [Category* D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ]
  [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D]

/-- A t-structure on a triangulated category in Lurie's homological form: full subcategories
`D≥0` (`geZero`) and `D≤0` (`leZero`), closed under isomorphism, with `Hom(X, Y[−1]) = 0` for
`X ∈ D≥0` and `Y ∈ D≤0`, `D≥0[1] ⊆ D≥0`, `D≤0[−1] ⊆ D≤0`, and for every `A` a distinguished
triangle `X ⟶ A ⟶ Y ⟶ X[1]` with `X ∈ D≥0` and `Y ∈ D≤0[−1]`, that is `Y[1] ∈ D≤0`.
(README §3.1.1; HA, Def. 1.2.1.1, p. 37.) -/
structure HomologicalTStructure where
  /-- The objects of `D≥0`. -/
  geZero : ObjectProperty D
  /-- The objects of `D≤0`. -/
  leZero : ObjectProperty D
  geZero_isClosedUnderIsomorphisms : geZero.IsClosedUnderIsomorphisms
  leZero_isClosedUnderIsomorphisms : leZero.IsClosedUnderIsomorphisms
  zero ⦃X Y : D⦄ (f : X ⟶ Y⟦(-1 : ℤ)⟧) (hX : geZero X) (hY : leZero Y) : f = 0
  geZero_shift (X : D) (hX : geZero X) : geZero (X⟦(1 : ℤ)⟧)
  leZero_shift (X : D) (hX : leZero X) : leZero (X⟦(-1 : ℤ)⟧)
  exists_triangle (A : D) : ∃ (X Y : D) (_ : geZero X) (_ : leZero (Y⟦(1 : ℤ)⟧))
    (f : X ⟶ A) (g : A ⟶ Y) (h : Y ⟶ X⟦(1 : ℤ)⟧), Triangle.mk f g h ∈ distTriang D

/-- Lurie's homological t-structures are Mathlib's cohomological `Triangulated.TStructure` under
the dictionary `D≥0 = t.le 0` and `D≤0 = t.ge 0` of the Conventions. (README §3.1.1; HA,
Def. 1.2.1.1, Not. 1.2.1.2, p. 37.) -/
theorem exists_equiv_tStructure :
    ∃ e : HomologicalTStructure D ≃ TStructure D,
      ∀ P, (e P).le 0 = P.geZero ∧ (e P).ge 0 = P.leZero := by
  sorry

variable {D}

/-- In a triangulated category with a t-structure, every morphism of the heart is admissible in
the sense of Beilinson–Bernstein–Deligne: the cone of its image is an extension of a heart object
by the shift of a heart object. With the vanishing of negative maps between heart objects this is
the hypothesis of Mathlib's `Triangulated.AbelianSubcategory.abelian`, so the heart is abelian.
(README §3.3.1; BBD, Thm. 1.3.6; HA, Rem. 1.2.1.12, p. 40.) -/
theorem admissibleMorphism_ιHeart_eq_top [IsTriangulated D] (t : TStructure D)
    (H : Type*) [Category* H] [Preadditive H] [t.Heart H] :
    AbelianSubcategory.admissibleMorphism (t.ιHeart (H := H)) = ⊤ := by
  sorry

/-- A short complex in the heart of a t-structure is short exact exactly when its image in the
triangulated category extends to a distinguished triangle. (README §3.3.1; BBD, Thm. 1.3.6.) -/
theorem shortExact_iff_exists_distinguished [IsTriangulated D] (t : TStructure D)
    (H : Type*) [Category* H] [Preadditive H] [t.Heart H] (S : ShortComplex H) :
    S.ShortExact ↔ ∃ δ : t.ιHeart.obj S.X₃ ⟶ (t.ιHeart.obj S.X₁)⟦(1 : ℤ)⟧,
      Triangle.mk (t.ιHeart.map S.f) (t.ιHeart.map S.g) δ ∈ distTriang D := by
  sorry

/-- A functor from a triangulated category with a t-structure to its abelian heart whose
composite with the inclusion is the truncation `τ≤0 ∘ τ≥0` (Mathlib's `truncLE 0 ⋙ truncGE 0`,
HA's `π₀`) is homological. (README §3.3.1; BBD, Thm. 1.3.6.) -/
theorem isHomological_of_iso_truncLE_truncGE [IsTriangulated D] (t : TStructure D)
    (H : Type*) [Category* H] [Abelian H] [t.Heart H] (H₀ : D ⥤ H)
    (e : H₀ ⋙ t.ιHeart ≅ t.truncLE 0 ⋙ t.truncGE 0) : H₀.IsHomological := by
  sorry

end TStructure

/-! ## Layer 5: The Dold–Kan correspondence for additive categories -/

section DoldKan

/-- The Dold–Kan functor from nonnegatively graded chain complexes to simplicial objects is fully
faithful for every additive category, with no idempotent-completeness hypothesis. (README §5.3.2;
HA, Thm. 1.2.3.7, first assertion, p. 56.) -/
theorem full_faithful_Γ₀ (A : Type*) [Category* A] [Preadditive A] [HasFiniteCoproducts A] :
    (AlgebraicTopology.DoldKan.Γ₀ : ChainComplex A ℕ ⥤ SimplicialObject A).Full ∧
      (AlgebraicTopology.DoldKan.Γ₀ : ChainComplex A ℕ ⥤ SimplicialObject A).Faithful := by
  sorry

end DoldKan

/-! ## Layer 6: Products of stable ∞-categories -/

section Products

/-- A product of stable ∞-categories is stable. (README §6.2.2; HA, Prop. 1.1.4.3, p. 34.) -/
theorem isStable_pi {ι : Type u} (C : ι → SSet.{u}) (hC : ∀ i, IsStable (C i)) :
    IsStable (∏ᶜ C) := by
  sorry

/-- A functor from a stable ∞-category into a product of stable ∞-categories is exact exactly when
each component is. (README §6.2.2; HA, Prop. 1.1.4.3, p. 34.) -/
theorem isExact_lift_iff {ι : Type u} {D : SSet.{u}} {C : ι → SSet.{u}} (hD : IsStable D)
    (hC : ∀ i, IsStable (C i)) (F : ∀ i, D ⟶ C i) :
    IsExact (Pi.lift F) ↔ ∀ i, IsExact (F i) := by
  sorry

end Products

/-! ## Layer 7: Stabilization -/

section LoopCriterion

open SSet

/-- `M^Ω ⊆ Fun(Δ[1] × Δ[1], C)`: the full subcategory of pullback squares with zero objects at
`(0, 1)` and `(1, 0)`. (README §1.1.4; HA, §1.1.2, p. 24.) -/
noncomputable def loopSquares (C : SSet.{u}) : ((ihom (Δ[1] ⊗ Δ[1])).obj C).Subcomplex :=
  ((ihom (Δ[1] ⊗ Δ[1])).obj C).fullEnhancedSubcategory fun x =>
    IsPullbackSquare (lift (𝟙 _) (const x) ≫ (ihom.ev _).app C) ∧
      IsZeroObject (corner (lift (𝟙 _) (const x) ≫ (ihom.ev _).app C)) ∧
      IsZeroObject (yonedaEquiv (lift (SSet.stdSimplex.δ 0) (SSet.stdSimplex.δ 1) ≫
        (lift (𝟙 _) (const x) ≫ (ihom.ev _).app C)))

/-- **The loop criterion.** A pointed ∞-category is stable exactly when it has finite limits and a
loop functor, the composite of a section `σ : C ⟶ M^Ω` of evaluation at `(1, 1)` with evaluation at
`(0, 0)`, is a categorical equivalence. (README §7.5.3; HA, Cor. 1.4.2.27, (1) ⇔ (3), p. 149.) -/
theorem isStable_iff_exists_loop_isCategoricalEquivalence {C : SSet.{u}} [Quasicategory C]
    (h0 : ∃ x : C _⦋0⦌, IsZeroObject x) :
    IsStable C ↔
      (∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ C),
          ∃ q : join Δ[0] K ⟶ C, join.inr _ _ ≫ q = p ∧ IsLimitDiagram q) ∧
      ∃ σ : C ⟶ (loopSquares C : SSet.{u}),
        σ ≫ (loopSquares C).ι ≫
            SSet.evalAt (yonedaEquiv (lift (SSet.stdSimplex.δ 0) (SSet.stdSimplex.δ 0))) C = 𝟙 C ∧
        QCat.IsCategoricalEquivalence (X := ⟨C, ‹_›⟩) (Y := ⟨C, ‹_›⟩)
          (ObjectProperty.homMk (σ ≫ (loopSquares C).ι ≫
            SSet.evalAt (yonedaEquiv (lift (SSet.stdSimplex.δ 1) (SSet.stdSimplex.δ 1))) C)) := by
  sorry

end LoopCriterion

/-! ## Layer 12: The ∞-categorical Dold–Kan correspondence -/

section DoldKanInfinity

open SSet

/-- The ∞-category `Fun(N(Δ)^op, C)` of simplicial objects of `C`. Owned by Part
LimitsAndKanExtensions (§9.1.1) and restated here. (README §12.1.1, via Part LimitsAndKanExtensions
§9.1.1; HTT, Def. 6.1.2.2, p. 554.) -/
def simplicialObjects (C : SSet.{u}) : SSet.{u} :=
  (ihom (SSet.uliftFunctor.{u, 0}.obj (SSet.opFunctor.obj (nerve SimplexCategory)))).obj C

/-- **The ∞-categorical Dold–Kan correspondence**: for a stable ∞-category `C`, the ∞-category of
filtered objects `Fun(N(ℤ≥0), C)` and the ∞-category of simplicial objects `Fun(N(Δ)^op, C)` are
categorically equivalent. (README §12.1.1; HA, Thm. 1.2.4.1, p. 66.) -/
theorem exists_isCategoricalEquivalence_doldKan (C : SSet.{u}) [Quasicategory C]
    (hC : IsStable C) :
    ∃ f : (⟨(ihom (SSet.uliftFunctor.{u, 0}.obj (nerve ℕ))).obj C, inferInstance⟩ : QCat.{u}) ⟶
        ⟨simplicialObjects C, by unfold simplicialObjects; infer_instance⟩,
      QCat.IsCategoricalEquivalence f := by
  sorry

end DoldKanInfinity

end TauCetiRoadmap.InfinityCategoryTheory.StableInfinityCategories

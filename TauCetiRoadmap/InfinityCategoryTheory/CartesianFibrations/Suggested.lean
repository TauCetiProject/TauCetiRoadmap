/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.Cartesian
public import TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence
public import TauCeti.AlgebraicTopology.Quasicategory.Core
public import TauCeti.AlgebraicTopology.SimplicialSet.AnodyneExtensions.LeftRight.Basic
public import TauCeti.AlgebraicTopology.SimplicialSet.Marked.Anodyne
public import TauCeti.AlgebraicTopology.SimplicialSet.Op

/-!
# Cartesian fibrations and the Cartesian model structure: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems that are
statable against Mathlib and Tau Ceti, with the few definitions their statements need.

`IsCategoricalEquivalence`, `categoricalEquivalences` and `categoricalFibrations` are Part
InfinityCategoryFoundations' definitions (its §2.1 and §9.4), restated here with the same names and bodies. Categorical
equivalences are in Joyal's form (README, Conventions): for every ∞-category `C`, restriction
`h Fun(B, C) ⥤ h Fun(A, C)` is an equivalence of categories. This Part owns `Edge.IsCocartesian` and
`CocartesianFibration` (§1.1), `Edge.IsLocallyCartesian` (§1.6), `LocallyCartesianFibration` (§2.3),
`IsBifibration` (§4.2), `evalVertex`, `commaTarget` and `commaTargetSource` (§4.4), `markedCofibrations` (§5.1),
`natural` (§5.3), and `ihomPt`, `mapOver` and
`mapOverRestrict` (the mapping objects over a base of the Conventions and restriction between them, §7.5).

Stated: the edge criteria of Layer 1 (§1.2–1.4), nerves of Grothendieck fibrations, the fibration criteria and the
locally Cartesian criteria of Layer 2 (§2.1–2.3, §2.5, §2.6 first assertion), the prescribed-target form of
categorical fibrations over an ∞-category and the comparisons of §3.4, bifibrations and arrow ∞-categories (§4.2,
§4.4: HTT, Lemma 2.4.7.5 and Cors. 2.4.7.11–2.4.7.12), Cartesian fibrations as marked fibrant objects (§5.3), and
Layer 7: inner anodyne base change over any base (§7.1), base change over an ∞-category (§7.2), the fiberwise
criteria and Lemma F (§7.3), (co)Cartesian fibrations over ∞-categories and Kan complexes as categorical fibrations
(§7.4), and invariance of section spaces (§7.5).

Not statable at the pins (Mathlib and Tau Ceti):
* the mapping-space criteria (§1.7), HTT, Prop. 2.4.7.6 (§4.3), HTT, Cor. 3.3.1.6 (§7.3) and the
  homotopy-equivalence clauses of §7.3 and §7.5:
  they need homotopy equivalences of Kan complexes and homotopy Cartesian squares, not in Mathlib or Tau Ceti;
* the Cartesian and coCartesian model structures and everything stated through Cartesian equivalences (§5.5–5.9,
  clause (3) of HTT, Prop. 3.3.1.5): they need the marked mapping objects over `S` and model category instances on
  marked simplicial sets over `S`;
* mapping simplices and quasi-equivalences (Layer 6) and the functor fibrations of §7.6: the mapping simplex and the
  representing objects `Y'`, `Z'` are constructions, not simple definitions;
* statable but not stated here: the horn, coslice and prism criteria (§1.2, §1.5), the slice and initial-section
  statements (§2.2 second paragraph, §2.4, §2.7, §3.1), the edge description of HTT, Prop. 2.4.2.11 (§2.6), and the
  section bifibration of HTT, Prop. 2.4.7.10 (§4.4), of which Cor. 2.4.7.11 is the stated case. They are not
  headline statements of the README, or their statements need lifting conditions relative to slices or
  constructions of mapping objects, which are left to the formalization. Correspondences (§4.1) are a definition
  with no headline theorem. HTT, Cor. 2.4.4.5 (§2.5) is
  the case of `isCategoricalEquivalence_pullback_fst_of_quasicategory` with `T` an ∞-category.
-/

public section

open CategoryTheory Limits MorphismProperty MonoidalCategory MonoidalClosed CartesianMonoidalCategory Simplicial

universe u

namespace TauCetiRoadmap.InfinityCategoryTheory.CartesianFibrations

open SSet

/-! ## Repeated definitions (owned by Part InfinityCategoryFoundations) -/

/-- A map `f : A ⟶ B` of simplicial sets is a categorical equivalence when, for every ∞-category `C`, restriction
along `f` induces an equivalence of homotopy categories `h Fun(B, C) ⥤ h Fun(A, C)`. (README, Conventions; HTT,
Def. 1.1.5.14, in the equivalent form of Kerodon, §4.5.4, Def. 4.5.4.1 and Prop. 4.5.4.8. Part InfinityCategoryFoundations §2.1.6
owns this definition.) -/
def IsCategoricalEquivalence {A B : SSet.{u}} (f : A ⟶ B) : Prop :=
  ∀ (C : SSet.{u}) [C.Quasicategory],
    (hoFunctor.map ((MonoidalClosed.pre f).app C)).toFunctor.IsEquivalence

/-- The class of categorical equivalences. (README, Conventions; Part InfinityCategoryFoundations §2.1.6 owns this
definition.) -/
def categoricalEquivalences : MorphismProperty SSet.{u} :=
  fun _ _ f ↦ IsCategoricalEquivalence f

/-- The class of categorical fibrations: the maps with the right lifting property against every monomorphism that is
a categorical equivalence, the fibrations of the Joyal model structure. (README, Conventions;
HTT, §2.2.5, p. 108. Part InfinityCategoryFoundations §9.4.1 owns this definition.) -/
def categoricalFibrations : MorphismProperty SSet.{u} :=
  (monomorphisms SSet.{u} ⊓ categoricalEquivalences).rlp

/-! ## Layer 1: Cartesian and coCartesian edges -/

/-- An edge `f : x ⟶ y` of `X` is `p`-coCartesian for `p : X ⟶ S` when the opposite edge `y ⟶ x` of `Xᵒᵖ` is
`pᵒᵖ`-Cartesian. (README §1.1.1; HTT, Def. 2.4.2.1, p. 139, with §2.4.1, p. 136.) -/
def Edge.IsCocartesian {X S : SSet.{u}} {x y : X _⦋0⦌} (f : Edge x y) (p : X ⟶ S) : Prop :=
  (Edge.opEquiv f).IsCartesian (opFunctor.map p)

/-- A map `p : X ⟶ S` is a coCartesian fibration when `pᵒᵖ : Xᵒᵖ ⟶ Sᵒᵖ` is a Cartesian fibration. (README §1.1.1;
HTT, Def. 2.4.2.1, p. 139.) -/
abbrev CocartesianFibration {X S : SSet.{u}} (p : X ⟶ S) : Prop :=
  CartesianFibration (opFunctor.map p)

/-- Cancellation: for inner fibrations `p : X ⟶ S` and `q : S ⟶ Z` and an edge `f` with `p f` `q`-Cartesian, `f` is
`p`-Cartesian when it is `(p ≫ q)`-Cartesian. (README §1.2.1; HTT, Prop. 2.4.1.3 (3), converse half, p. 133.) -/
theorem Edge.isCartesian_of_isCartesian_comp {X S Z : SSet.{u}} (p : X ⟶ S) (q : S ⟶ Z) [InnerFibration p]
    [InnerFibration q] {x y : X _⦋0⦌} (f : Edge x y) (hpf : (f.map p).IsCartesian q)
    (hf : f.IsCartesian (p ≫ q)) : f.IsCartesian p := by
  sorry

/-- For an inner fibration of ∞-categories, a morphism is an equivalence exactly when it is Cartesian and its image
is an equivalence. (README §1.3.1; HTT, Prop. 2.4.1.5, p. 134.) -/
theorem Edge.isEquivalence_iff_isCartesian {C D : SSet.{u}} [C.Quasicategory] [D.Quasicategory]
    (p : C ⟶ D) [InnerFibration p] {x y : C _⦋0⦌} (f : Edge x y) :
    f.IsEquivalence ↔ f.IsCartesian p ∧ (f.map p).IsEquivalence := by
  sorry

/-- In a 2-simplex of an ∞-category with edges `f`, `g` and `h = g ∘ f`, over an inner fibration of ∞-categories, if
`g` is Cartesian then `f` is Cartesian exactly when `h` is. (README §1.4.1; HTT, Prop. 2.4.1.7, p. 135.) -/
theorem Edge.isCartesian_iff_of_compStruct {C D : SSet.{u}} [C.Quasicategory] [D.Quasicategory]
    (p : C ⟶ D) [InnerFibration p] {x₀ x₁ x₂ : C _⦋0⦌} {f : Edge x₀ x₁} {g : Edge x₁ x₂} {h : Edge x₀ x₂}
    (σ : Edge.CompStruct f g h) (hg : g.IsCartesian p) :
    f.IsCartesian p ↔ h.IsCartesian p := by
  sorry

/-- An edge `f : x ⟶ y` of `X` is locally `p`-Cartesian for `p : X ⟶ S` when the edge `(f, ι)` of the pullback
`X ×_S Δ[1]` along the edge `p f : Δ[1] ⟶ S` is Cartesian for the projection to `Δ[1]`. (README §1.6.1; HTT,
Def. 2.4.1.11, p. 138.) -/
def Edge.IsLocallyCartesian {X S : SSet.{u}} {x y : X _⦋0⦌} (f : Edge x y) (p : X ⟶ S) : Prop :=
  ∃ (x' y' : (pullback p (SSet.yonedaEquiv.symm (f.map p).edge)) _⦋0⦌) (f' : Edge x' y'),
    f'.edge = SSet.yonedaEquiv (pullback.lift (SSet.yonedaEquiv.symm f.edge) (𝟙 Δ[1])
      (by rw [Category.id_comp, Edge.map_edge, yonedaEquiv_symm_comp])) ∧
    f'.IsCartesian (pullback.snd p (SSet.yonedaEquiv.symm (f.map p).edge))

/-! ## Layer 2: Cartesian fibrations and fiberwise equivalences -/

/-- The nerve of a functor of categories is a Cartesian fibration exactly when the functor is a Grothendieck
fibration. (README §2.1.1; HTT, Rem. 2.4.2.2, p. 139.) -/
theorem cartesianFibration_nerveMap_iff {E B : Type u} [Category.{u} E] [Category.{u} B] (P : E ⥤ B) :
    CartesianFibration (nerveMap P) ↔ P.IsFibered := by
  sorry

/-- An inner fibration is a right fibration exactly when it is a Cartesian fibration all of whose edges are
Cartesian. (README §2.2.1; HTT, Prop. 2.4.2.4, p. 140.) -/
theorem rightFibration_iff_cartesianFibration {X S : SSet.{u}} (p : X ⟶ S) [InnerFibration p] :
    RightFibration p ↔
      CartesianFibration p ∧ ∀ (x y : X _⦋0⦌) (e : Edge x y), e.IsCartesian p := by
  sorry

/-- An inner fibration is a Cartesian fibration exactly when its pullbacks to simplices of dimension at most two are.
(README §2.3.2; HTT, Cor. 2.4.2.10, p. 143.) -/
theorem cartesianFibration_iff_pullback_stdSimplex {X S : SSet.{u}} (p : X ⟶ S) [InnerFibration p] :
    CartesianFibration p ↔
      ∀ (n : ℕ), n ≤ 2 → ∀ σ : Δ[n] ⟶ S, CartesianFibration (pullback.snd p σ) := by
  sorry

/-- A Cartesian fibration of ∞-categories is a categorical equivalence exactly when it is a trivial fibration.
(README §2.5.3; HTT, Cor. 2.4.4.6, p. 150.) -/
theorem isCategoricalEquivalence_iff_rlp_monomorphisms {C D : SSet.{u}} [C.Quasicategory]
    [D.Quasicategory] (p : C ⟶ D) [CartesianFibration p] :
    IsCategoricalEquivalence p ↔ (monomorphisms SSet.{u}).rlp p := by
  sorry

/-- A map `p : X ⟶ S` is a locally Cartesian fibration when it is an inner fibration whose pullback along every edge
`Δ[1] ⟶ S` is a Cartesian fibration. (README §2.3.1; HTT, Def. 2.4.2.6, p. 141.) -/
class LocallyCartesianFibration {X S : SSet.{u}} (p : X ⟶ S) : Prop extends InnerFibration p where
  /-- The pullback along every edge of `S` is a Cartesian fibration. -/
  cartesianFibration_pullback (σ : Δ[1] ⟶ S) : CartesianFibration (pullback.snd p σ)

/-- **Edge criterion.** Over a locally Cartesian fibration, an edge `f` is Cartesian exactly when, in every 2-simplex
with edges `g`, `f` and `h = f ∘ g`, the edge `g` is locally Cartesian exactly when `h` is. (README §2.3.2; HTT,
Lemma 2.4.2.7, p. 141.) -/
theorem Edge.isCartesian_iff_isLocallyCartesian_iff {X S : SSet.{u}} (p : X ⟶ S) [LocallyCartesianFibration p]
    {x' x : X _⦋0⦌} (f : Edge x' x) :
    f.IsCartesian p ↔
      ∀ (x'' : X _⦋0⦌) (g : Edge x'' x') (h : Edge x'' x), Edge.CompStruct g f h →
        (Edge.IsLocallyCartesian g p ↔ Edge.IsLocallyCartesian h p) := by
  sorry

/-- **Composite criterion.** A locally Cartesian fibration is a Cartesian fibration exactly when locally Cartesian
edges are closed under composition, exactly when every locally Cartesian edge is Cartesian. (README §2.3.2; HTT,
Prop. 2.4.2.8, p. 142.) -/
theorem tfae_cartesianFibration_of_locallyCartesianFibration {X S : SSet.{u}} (p : X ⟶ S)
    [LocallyCartesianFibration p] :
    List.TFAE
      [CartesianFibration p,
        ∀ (x₀ x₁ x₂ : X _⦋0⦌) (f : Edge x₀ x₁) (g : Edge x₁ x₂) (h : Edge x₀ x₂), Edge.CompStruct f g h →
          Edge.IsLocallyCartesian f p → Edge.IsLocallyCartesian g p → Edge.IsLocallyCartesian h p,
        ∀ (x y : X _⦋0⦌) (e : Edge x y), Edge.IsLocallyCartesian e p → e.IsCartesian p] := by
  sorry

/-- **Fiberwise criterion through locally Cartesian fibrations.** For maps of ∞-categories `p : C ⟶ D` and
`q : D ⟶ E` with `q` and `p ≫ q` locally Cartesian fibrations, if `p` carries locally `(p ≫ q)`-Cartesian edges to
locally `q`-Cartesian edges and induces a categorical equivalence on the fiber over every vertex of `E`, then `p` is a
categorical equivalence. (README §2.5.1; HTT, Cor. 2.4.4.4, p. 150.) -/
theorem isCategoricalEquivalence_of_fiber_of_locallyCartesianFibration {C D E : SSet.{u}} [C.Quasicategory]
    [D.Quasicategory] [E.Quasicategory] (p : C ⟶ D) (q : D ⟶ E) [LocallyCartesianFibration q]
    [LocallyCartesianFibration (p ≫ q)]
    (hp : ∀ (x y : C _⦋0⦌) (e : Edge x y), Edge.IsLocallyCartesian e (p ≫ q) → Edge.IsLocallyCartesian (e.map p) q)
    (hfib : ∀ z : Δ[0] ⟶ E,
      IsCategoricalEquivalence (pullback.map (p ≫ q) z q z p (𝟙 _) (𝟙 _) (by simp) (by simp))) :
    IsCategoricalEquivalence p := by
  sorry

/-- **Locally Cartesian fibrations over a locally Cartesian base.** For locally Cartesian fibrations `p : X ⟶ S` and
`q : Y ⟶ S` and an inner fibration `r : X ⟶ Y` over `S` carrying locally `p`-Cartesian edges to locally
`q`-Cartesian edges and inducing locally Cartesian fibrations on the fibers over the vertices of `S`, `r` is a
locally Cartesian fibration. (README §2.6.1; HTT, Prop. 2.4.2.11, p. 143, first assertion.) -/
theorem locallyCartesianFibration_of_fiber {X Y S : SSet.{u}} (p : X ⟶ S) (q : Y ⟶ S)
    [LocallyCartesianFibration p] [LocallyCartesianFibration q] (r : X ⟶ Y) [InnerFibration r] (w : r ≫ q = p)
    (hr : ∀ (x y : X _⦋0⦌) (e : Edge x y), Edge.IsLocallyCartesian e p → Edge.IsLocallyCartesian (e.map r) q)
    (hfib : ∀ s : Δ[0] ⟶ S,
      LocallyCartesianFibration
        (pullback.map p s q s r (𝟙 _) (𝟙 _) (by rw [Category.comp_id, w]) (by simp))) :
    LocallyCartesianFibration r := by
  sorry

/-! ## Layer 3: Categorical fibrations and the forms of categorical equivalence -/

/-- Over an ∞-category, the categorical fibrations are the inner fibrations along which every equivalence into the
image of a vertex lifts to an equivalence into that vertex. (README §3.3.1; HTT, Cor. 2.4.6.5, p. 155, applied to
`pᵒᵖ`.) -/
theorem categoricalFibration_iff_innerFibration_and_exists_lift_target {C D : SSet.{u}} [D.Quasicategory]
    (p : C ⟶ D) :
    categoricalFibrations p ↔
      InnerFibration p ∧
        ∀ (c₁ : C _⦋0⦌) {d₀ : D _⦋0⦌} (e : Edge d₀ (p.app _ c₁)), e.IsEquivalence →
          ∃ (c₀ : C _⦋0⦌) (e' : Edge c₀ c₁), e'.IsEquivalence ∧ p.app _ e'.edge = e.edge := by
  sorry

/-- Postcomposition with a categorical equivalence of ∞-categories is a categorical equivalence of functor
∞-categories. (README §3.4.1; HTT, Prop. 1.2.7.3 (2), p. 57.) -/
theorem isCategoricalEquivalence_ihom_map {C D : SSet.{u}} [C.Quasicategory] [D.Quasicategory]
    (f : C ⟶ D) (hf : IsCategoricalEquivalence f) (K : SSet.{u}) :
    IsCategoricalEquivalence ((ihom K).map f) := by
  sorry

/-- Restriction along a categorical equivalence is a categorical equivalence of functor ∞-categories.
(README §3.4.1; HTT, Prop. 1.2.7.3 (3), p. 57.) -/
theorem isCategoricalEquivalence_pre_app {K K' : SSet.{u}} (f : K ⟶ K')
    (hf : IsCategoricalEquivalence f) (C : SSet.{u}) [C.Quasicategory] :
    IsCategoricalEquivalence ((MonoidalClosed.pre f).app C) := by
  sorry

/-- For maps of ∞-categories, categorical equivalences are the equivalences in the bicategory of
quasicategories. (README §3.4.2; HTT, Prop. 2.2.5.7, p. 111, with §A.2.2, p. 830.) -/
theorem isCategoricalEquivalence_iff_qcat {C D : SSet.{u}} [hC : C.Quasicategory] [hD : D.Quasicategory]
    (f : C ⟶ D) :
    IsCategoricalEquivalence f ↔
      QCat.IsCategoricalEquivalence (X := ⟨C, hC⟩) (Y := ⟨D, hD⟩) (ObjectProperty.homMk f) := by
  sorry

/-! ## Layer 4: Bifibrations and arrow ∞-categories -/

/-- A map `p : X ⟶ S ⊗ T` is a bifibration when it is an inner fibration, every horn `Λ[n + 1, 0] ⟶ X` over a simplex
of `S ⊗ T` whose `T`-component sends the edge `0 ⟶ 1` to a degenerate edge has a filler, and every horn
`Λ[n + 1, n + 1] ⟶ X` over a simplex whose `S`-component sends the last edge to a degenerate edge has a filler. It is
covariant in `S` and contravariant in `T`. (README §4.2.1; HTT, Def. 2.4.7.2, p. 157.) -/
def IsBifibration {X S T : SSet.{u}} (p : X ⟶ S ⊗ T) : Prop :=
  InnerFibration p ∧
    (∀ (n : ℕ) (a : (Λ[n + 1, 0] : SSet.{u}) ⟶ X) (f : Δ[n + 1] ⟶ S ⊗ T),
      a ≫ p = Λ[n + 1, 0].ι ≫ f →
      (∃ t : T _⦋0⦌, (f ≫ snd S T).app _ (stdSimplex.edge (n + 1) 0 1 (Fin.zero_le _)) = T.σ 0 t) →
      ∃ l : Δ[n + 1] ⟶ X, Λ[n + 1, 0].ι ≫ l = a ∧ l ≫ p = f) ∧
    (∀ (n : ℕ) (a : (Λ[n + 1, Fin.last (n + 1)] : SSet.{u}) ⟶ X) (f : Δ[n + 1] ⟶ S ⊗ T),
      a ≫ p = Λ[n + 1, Fin.last (n + 1)].ι ≫ f →
      (∃ s : S _⦋0⦌,
        (f ≫ fst S T).app _
          (stdSimplex.edge (n + 1) (Fin.last n).castSucc (Fin.last (n + 1)) (Fin.castSucc_lt_last _).le) =
          S.σ 0 s) →
      ∃ l : Δ[n + 1] ⟶ X, Λ[n + 1, Fin.last (n + 1)].ι ≫ l = a ∧ l ≫ p = f)

/-- For a bifibration `p : X ⟶ S ⊗ T` with `S` an ∞-category, the composite `X ⟶ T` is a Cartesian fibration whose
Cartesian edges are those whose image in `S` is an equivalence. (README §4.2.2; HTT, Lemma 2.4.7.5, p. 158.) -/
theorem cartesianFibration_comp_snd_of_isBifibration {X S T : SSet.{u}} [S.Quasicategory] (p : X ⟶ S ⊗ T)
    (hp : IsBifibration p) :
    CartesianFibration (p ≫ snd S T) ∧
      ∀ (x y : X _⦋0⦌) (e : Edge x y), e.IsCartesian (p ≫ snd S T) ↔ (e.map (p ≫ fst S T)).IsEquivalence := by
  sorry

/-- For a simplicial set `C`, evaluation `Fun(Δ[1], C) ⟶ Fun({j}, C)` at the vertex `j` of `Δ[1]`, written as the
face `δ (1 - j) : Δ[0] ⟶ Δ[1]`, which omits the other vertex. (README §4.4.2; HTT, Notation 1.2.7.2, p. 57.) -/
noncomputable abbrev evalVertex (C : SSet.{u}) (j : Fin 2) : (ihom Δ[1]).obj C ⟶ (ihom Δ[0]).obj C :=
  (MonoidalClosed.pre (stdSimplex.δ j.rev : Δ[0] ⟶ Δ[1])).app C

/-- For an ∞-category `C`, evaluation at the endpoints, target first, `Fun(Δ[1], C) ⟶ Fun({1}, C) × Fun({0}, C)`, is a
bifibration. (README §4.4.1; HTT, Cor. 2.4.7.11, p. 161.) -/
theorem isBifibration_ihom_stdSimplex_one (C : SSet.{u}) [C.Quasicategory] :
    IsBifibration (lift (evalVertex C 1) (evalVertex C 0)) := by
  sorry

/-- For a map `f : C ⟶ D`, the comma object `Fun(Δ[1], D) ×_{Fun({1}, D)} C` of arrows of `D` with target in the
image of `f`. (README §4.4.2; HTT, Cor. 2.4.7.12, p. 161.) -/
noncomputable abbrev commaTarget {C D : SSet.{u}} (f : C ⟶ D) : SSet.{u} :=
  pullback (evalVertex D 1) (MonoidalClosed.curry (snd Δ[0] C ≫ f) : C ⟶ (ihom Δ[0]).obj D)

/-- The source projection `Fun(Δ[1], D) ×_{Fun({1}, D)} C ⟶ Fun({0}, D)`. (README §4.4.2; HTT, Cor. 2.4.7.12,
p. 161.) -/
noncomputable abbrev commaTargetSource {C D : SSet.{u}} (f : C ⟶ D) : commaTarget f ⟶ (ihom Δ[0]).obj D :=
  pullback.fst (evalVertex D 1) (MonoidalClosed.curry (snd Δ[0] C ≫ f)) ≫ evalVertex D 0

/-- For a functor `f : C ⟶ D` of ∞-categories, the source projection
`p : Fun(Δ[1], D) ×_{Fun({1}, D)} C ⟶ Fun({0}, D)` is a Cartesian fibration, and an edge is `p`-Cartesian exactly when
its image in `C` is an equivalence. (README §4.4.2; HTT, Cor. 2.4.7.12, p. 161.) -/
theorem cartesianFibration_commaTargetSource {C D : SSet.{u}} [C.Quasicategory] [D.Quasicategory] (f : C ⟶ D) :
    CartesianFibration (commaTargetSource f) ∧
      ∀ (x y : (commaTarget f) _⦋0⦌) (e : Edge x y),
        e.IsCartesian (commaTargetSource f) ↔
          (e.map (pullback.snd (evalVertex D 1) (MonoidalClosed.curry (snd Δ[0] C ≫ f)))).IsEquivalence := by
  sorry

/-! ## Layer 5: Marked simplicial sets -/

/-- A morphism of marked simplicial sets is a cofibration when its underlying map of simplicial sets is a
monomorphism. (README §5.1.1; HTT, Def. 3.1.2.2, p. 170.) -/
def markedCofibrations : MorphismProperty TauCeti.MarkedSSet.{u} :=
  fun _ _ f ↦ Mono (TauCeti.MarkedSSet.forget.map f)

/-- For `p : X ⟶ S`, the marked simplicial set `X^♮`: `X` with its `p`-Cartesian edges marked. (README §5.3.1;
HTT, Def. 3.1.1.8, p. 168.) -/
abbrev natural {X S : SSet.{u}} (p : X ⟶ S) : TauCeti.MarkedSSet.{u} :=
  TauCeti.MarkedSSet.ofEdges X
    {e | (Edge.mk (x₀ := X.δ 1 e) (x₁ := X.δ 0 e) e rfl rfl).IsCartesian p}

/-- A map of simplicial sets is a Cartesian fibration exactly when `X^♮ ⟶ S^♯` has the right lifting property
against every marked anodyne map. (README §5.3.2; HTT, Prop. 3.1.1.6, p. 167, in the form of Rem. 3.1.1.10,
p. 169.) -/
theorem cartesianFibration_iff_rlp_markedAnodyneExtensions {X S : SSet.{u}} (p : X ⟶ S) :
    CartesianFibration p ↔
      TauCeti.MarkedSSet.markedAnodyneExtensions.rlp
        (TauCeti.MarkedSSet.toSharp (X := natural p) p) := by
  sorry

/-! ## Layer 7: Base change, fiberwise criteria and categorical fibrations -/

/-- **Inner anodyne base change, any base.** For a Cartesian or coCartesian fibration `q : Y ⟶ B` and an inner
anodyne map `j : A ⟶ A'` over `B`, the induced map `Y_A ⟶ Y_{A'}` is a categorical equivalence (it is a
monomorphism, as a base change of one). (README §7.1.1; for `A' = B` the inner-anodyne half of HTT, Prop. 3.3.1.3,
p. 223.) -/
theorem isCategoricalEquivalence_pullback_map_of_innerAnodyne {Y B A A' : SSet.{u}} (q : Y ⟶ B)
    (hq : CartesianFibration q ∨ CocartesianFibration q) {a : A ⟶ B} {a' : A' ⟶ B} (j : A ⟶ A')
    (w : j ≫ a' = a) (hj : innerAnodyneExtensions j) :
    IsCategoricalEquivalence
      (pullback.map q a q a' (𝟙 Y) j (𝟙 B) (by simp) (by simp [w])) := by
  sorry

/-- **Base change over an ∞-category.** For a Cartesian or coCartesian fibration `p : X ⟶ S` over an ∞-category and
a categorical equivalence `g : T ⟶ T'` over `S`, the induced map `X_T ⟶ X_{T'}` is a categorical equivalence.
(README §7.2.1; HTT, Prop. 3.3.1.3, p. 223, over an ∞-category base.) -/
theorem isCategoricalEquivalence_pullback_map_of_quasicategory {X S T T' : SSet.{u}} [S.Quasicategory]
    (p : X ⟶ S) (hp : CartesianFibration p ∨ CocartesianFibration p) {t : T ⟶ S} {t' : T' ⟶ S}
    (g : T ⟶ T') (w : g ≫ t' = t) (hg : IsCategoricalEquivalence g) :
    IsCategoricalEquivalence
      (pullback.map p t p t' (𝟙 X) g (𝟙 S) (by simp) (by simp [w])) := by
  sorry

/-- Base change along a Cartesian or coCartesian fibration over an ∞-category carries categorical equivalences to
categorical equivalences: for a categorical equivalence `t : T ⟶ S`, the projection `X ×_S T ⟶ X` is one. (README
§7.2.1; HTT, Prop. 3.3.1.3, p. 223, over an ∞-category base.) -/
theorem isCategoricalEquivalence_pullback_fst_of_quasicategory {X S T : SSet.{u}} [S.Quasicategory]
    (p : X ⟶ S) (hp : CartesianFibration p ∨ CocartesianFibration p) (t : T ⟶ S)
    (ht : IsCategoricalEquivalence t) :
    IsCategoricalEquivalence (pullback.fst p t) := by
  sorry

/-- **Fiberwise criterion over any base** (coCartesian form). For coCartesian fibrations `p : K ⟶ C`, `q : K' ⟶ C`
and a map `F` over `C` carrying `p`-coCartesian edges to `q`-coCartesian edges and inducing a categorical
equivalence on the fiber over every vertex, the map `K ×_C C' ⟶ K' ×_C C'` is a categorical equivalence for every
`c : C' ⟶ C`. (README §7.3.1; dual of HTT, Prop. 3.3.1.5, (2) ⇒ (1), p. 225.) -/
theorem isCategoricalEquivalence_pullback_map_of_fiber {K K' C : SSet.{u}} (p : K ⟶ C) (q : K' ⟶ C)
    [CocartesianFibration p] [CocartesianFibration q] (F : K ⟶ K') (w : F ≫ q = p)
    (hF : ∀ (x y : K _⦋0⦌) (e : Edge x y), Edge.IsCocartesian e p → Edge.IsCocartesian (e.map F) q)
    (hfib : ∀ s : Δ[0] ⟶ C,
      IsCategoricalEquivalence
        (pullback.map p s q s F (𝟙 _) (𝟙 _) (by rw [Category.comp_id, w]) (by simp)))
    {C' : SSet.{u}} (c : C' ⟶ C) :
    IsCategoricalEquivalence
      (pullback.map p c q c F (𝟙 _) (𝟙 _) (by rw [Category.comp_id, w]) (by simp)) := by
  sorry

/-- The fiberwise criterion over any base: a map of Cartesian fibrations preserving Cartesian edges is a categorical
equivalence when it is one on every fiber. (README §7.3.1; HTT, Prop. 3.3.1.5, (2) ⇒ (1), p. 225.) -/
theorem isCategoricalEquivalence_of_fiber {X Y S : SSet.{u}} (p : X ⟶ S) (q : Y ⟶ S)
    [CartesianFibration p] [CartesianFibration q] (f : X ⟶ Y) (w : f ≫ q = p)
    (hf : ∀ (x y : X _⦋0⦌) (e : Edge x y), e.IsCartesian p → (e.map f).IsCartesian q)
    (hfib : ∀ s : Δ[0] ⟶ S,
      IsCategoricalEquivalence
        (pullback.map p s q s f (𝟙 _) (𝟙 _) (by rw [Category.comp_id, w]) (by simp))) :
    IsCategoricalEquivalence f := by
  sorry

/-- **Lemma F.** Over an ∞-category, a categorical equivalence between categorical fibrations is a categorical
equivalence on every fiber. (README §7.3.2; HTT, Prop. 3.3.1.5, (1) ⇒ (2), p. 225, for categorical
fibrations over an ∞-category.) -/
theorem isCategoricalEquivalence_fiber_of_categoricalFibration {X Y C : SSet.{u}}
    (p : X ⟶ C) (q : Y ⟶ C) (hp : categoricalFibrations p) (hq : categoricalFibrations q) (f : X ⟶ Y) (w : f ≫ q = p)
    (hf : IsCategoricalEquivalence f) (s : Δ[0] ⟶ C) :
    IsCategoricalEquivalence
      (pullback.map p s q s f (𝟙 _) (𝟙 _) (by rw [Category.comp_id, w]) (by simp)) := by
  sorry

/-- The fiberwise criterion over an ∞-category: a map of Cartesian fibrations preserving Cartesian edges is a
categorical equivalence exactly when it is one on every fiber. (README §7.3.3; HTT, Prop. 3.3.1.5, (1) ⇔ (2), p. 225,
over an ∞-category base.) -/
theorem isCategoricalEquivalence_iff_fiber_of_quasicategory {X Y S : SSet.{u}} [S.Quasicategory]
    (p : X ⟶ S) (q : Y ⟶ S) [CartesianFibration p] [CartesianFibration q] (f : X ⟶ Y) (w : f ≫ q = p)
    (hf : ∀ (x y : X _⦋0⦌) (e : Edge x y), e.IsCartesian p → (e.map f).IsCartesian q) :
    IsCategoricalEquivalence f ↔
      ∀ s : Δ[0] ⟶ S,
        IsCategoricalEquivalence
          (pullback.map p s q s f (𝟙 _) (𝟙 _) (by rw [Category.comp_id, w]) (by simp)) := by
  sorry

/-- **(Co)Cartesian fibrations over an ∞-category are categorical fibrations.** (README §7.4.1; HTT,
Prop. 3.3.1.7, p. 227, over an ∞-category base.) -/
theorem categoricalFibration_of_cartesianFibration_or_cocartesianFibration {X S : SSet.{u}} [S.Quasicategory]
    (p : X ⟶ S) (hp : CartesianFibration p ∨ CocartesianFibration p) :
    categoricalFibrations p := by
  sorry

/-- For an ∞-category `C` and any simplicial set `K`, the projection `C × K ⟶ K` is a categorical fibration, as a
pullback of the Cartesian fibration `C ⟶ Δ[0]`. (README §7.4.1; HTT, Prop. 3.3.1.7, p. 227, for product
projections.) -/
theorem categoricalFibration_snd (C K : SSet.{u}) [C.Quasicategory] :
    categoricalFibrations (snd C K) := by
  sorry

/-- Over a Kan complex, the Cartesian fibrations, the coCartesian fibrations and the categorical fibrations
coincide. (README §7.4.2; HTT, Prop. 3.3.1.8, p. 228.) -/
theorem tfae_cartesianFibration_categoricalFibrations {X S : SSet.{u}} [S.KanComplex] (p : X ⟶ S) :
    List.TFAE [CartesianFibration p, CocartesianFibration p, categoricalFibrations p] := by
  sorry

/-- The vertex of `Fun(A, X)` given by a map `a : A ⟶ X`. (README, Conventions, mapping objects over a base; HTT,
Notation 1.2.7.2, p. 57.) -/
def ihomPt {A X : SSet.{u}} (a : A ⟶ X) : Δ[0] ⟶ (ihom A).obj X :=
  curry (fst A Δ[0] ≫ a)

/-- For maps `a : A ⟶ X` and `n : N ⟶ X`, the mapping object `Map_X(A, N)` over `X`: the fiber of
`Fun(A, N) ⟶ Fun(A, X)` over the vertex `a`, whose `k`-simplices are the maps `A × Δ[k] ⟶ N` over `X`. (README,
Conventions, mapping objects over a base; HTT, Notation 1.2.7.2, p. 57.) -/
noncomputable abbrev mapOver {A N X : SSet.{u}} (a : A ⟶ X) (n : N ⟶ X) : SSet.{u} :=
  pullback ((ihom A).map n) (ihomPt a)

/-- For `f : A ⟶ B` over `X`, restriction `Map_X(B, N) ⟶ Map_X(A, N)` of mapping objects over `X`. (README §7.5.1.) -/
noncomputable def mapOverRestrict {A B N X : SSet.{u}} {a : A ⟶ X} {b : B ⟶ X} (f : A ⟶ B) (w : f ≫ b = a)
    (n : N ⟶ X) : mapOver b n ⟶ mapOver a n :=
  pullback.map _ _ _ _ ((MonoidalClosed.pre f).app N) (𝟙 Δ[0]) ((MonoidalClosed.pre f).app X)
    ((MonoidalClosed.pre f).naturality n).symm
    (by rw [Category.id_comp, ihomPt, ihomPt, curry_pre_app, ← w, whiskerRight_fst_assoc])

/-- **Invariance of sections under categorical equivalence.** For a categorical fibration `n : N ⟶ X` and a map
`f : A ⟶ B` over `X` that is a categorical equivalence, restriction `Map_X(B, N) ⟶ Map_X(A, N)` is a categorical
equivalence. (README §7.5.1.) -/
theorem isCategoricalEquivalence_mapOverRestrict {A B N X : SSet.{u}} {a : A ⟶ X} {b : B ⟶ X} (f : A ⟶ B)
    (w : f ≫ b = a) (n : N ⟶ X) (hn : categoricalFibrations n) (hf : IsCategoricalEquivalence f) :
    IsCategoricalEquivalence (mapOverRestrict f w n) := by
  sorry

/-- When `f : A ⟶ B` over `X` is a trivial fibration, restriction `Map_X(B, N) ⟶ Map_X(A, N)` is a categorical
equivalence for every map `n : N ⟶ X`. (README §7.5.1, step t.) -/
theorem isCategoricalEquivalence_mapOverRestrict_of_rlp {A B N X : SSet.{u}} {a : A ⟶ X} {b : B ⟶ X}
    (f : A ⟶ B) (w : f ≫ b = a) (n : N ⟶ X) (hf : (monomorphisms SSet.{u}).rlp f) :
    IsCategoricalEquivalence (mapOverRestrict f w n) := by
  sorry

end TauCetiRoadmap.InfinityCategoryTheory.CartesianFibrations

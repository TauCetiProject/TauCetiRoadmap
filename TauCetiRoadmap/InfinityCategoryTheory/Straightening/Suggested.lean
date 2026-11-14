module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.Cartesian
public import TauCeti.AlgebraicTopology.Quasicategory.CatInfty
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.SimplicialNerve.Basic

/-!
# Marked straightening and the ∞-category Cat∞: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems that are
statable against Mathlib and Tau Ceti, with the few definitions their statements need.

`IsCategoricalEquivalence` and `categoricalEquivalences` are Part InfinityCategoryFoundations' definitions (its §2.1, in the
Kerodon form of the README's Conventions), and `categoricalFibrations` is Part InfinityCategoryFoundations' §9.4 definition;
they are restated here with the same names and bodies, since a roadmap file cannot import another. `CatInfty.vertex`
is local to this file.

Stated: Cartesian fibrations over an arbitrary base as pullbacks along a categorical equivalence (§2.2, HTT,
Cor. 3.3.1.2), Cartesian fibrations are categorical fibrations (§2.3, HTT, Prop. 3.3.1.7), base change along a
Cartesian fibration (§2.4, HTT, Prop. 3.3.1.3), the fiberwise criterion (§2.4, HTT, Prop. 3.3.1.5, (1) ⇔ (2)), and
the generation of `Cat∞` by `Δ[0]` and `Δ[1]` (§3.4, Nikolaus–Scholze, Lemma A.17).

Not statable at the pins (Mathlib and Tau Ceti):
* the straightening theorem, its coCartesian form and invariance under change of base (§1.7, §1.8, §2.2, HTT,
  Thm. 3.2.0.1, Prop. 3.3.1.1) and the Joyal–Cartesian comparison (§2.3, HTT, Prop. 3.1.5.3): they need marked
  straightening, `C[S]` for a simplicial set `S`, and the Cartesian, Joyal and projective model structures;
* clause (3) of the fiberwise criterion (§2.4): it needs Cartesian equivalences of marked simplicial sets over `S`;
* classifying maps and limits and colimits in `Cat∞` (§2.5, §3.2, §3.3, HTT, Prop. 3.3.3.1, Cor. 3.3.3.2,
  Prop. 3.3.4.2, Cor. 3.3.4.3): they need the universal Cartesian fibration `Z ⟶ Cat∞ᵒᵖ`;
* descent of coCartesian fibrations (§3.4, Nikolaus–Scholze, Lemma A.16): it needs the diagram of pullbacks as a
  map into `Cat∞` and the slices of `Cat∞`;
* the fiberwise criterion for Kan extensions (§4.1, HTT, Prop. 4.3.3.10): it needs Kan extensions along a map
  (HTT, Def. 4.3.3.2);
* diagrams of left adjoints (§5.1, Liu–Zheng, Prop. 2.2.4) and fiberwise localization (§5.3, Nikolaus–Scholze,
  Prop. A.14): they need the functors and squares carried by edges and 2-simplices of `Cat∞`, localizations of
  ∞-categories and absolute right Kan extensions.
-/

public section

open CategoryTheory Limits MorphismProperty MonoidalCategory Simplicial

universe u

namespace TauCetiRoadmap.InfinityCategoryTheory.Straightening

open SSet

/-- A map `f : A ⟶ B` of simplicial sets is a categorical equivalence when, for every ∞-category `C`, restriction
along `f` induces an equivalence of homotopy categories `h Fun(B, C) ⥤ h Fun(A, C)`. Part InfinityCategoryFoundations' definition
(its §2.1.6), restated. (README, Conventions; HTT, Def. 1.1.5.14, in the equivalent form of Kerodon, §4.5.4, Def. 4.5.4.1.) -/
def IsCategoricalEquivalence {A B : SSet.{u}} (f : A ⟶ B) : Prop :=
  ∀ (C : SSet.{u}) [C.Quasicategory],
    (hoFunctor.map ((MonoidalClosed.pre f).app C)).toFunctor.IsEquivalence

/-- The class of categorical equivalences. Part InfinityCategoryFoundations' definition (its §2.1.6), restated. (README, Conventions; HTT,
Def. 1.1.5.14.) -/
def categoricalEquivalences : MorphismProperty SSet.{u} :=
  fun _ _ f ↦ IsCategoricalEquivalence f

/-- The categorical fibrations: maps with the right lifting property against every monomorphism that is a
categorical equivalence. Part InfinityCategoryFoundations' definition (its §9.4.1), restated. (README, Conventions; HTT, §2.2.5,
p. 108.) -/
def categoricalFibrations : MorphismProperty SSet.{u} :=
  (monomorphisms SSet.{u} ⊓ categoricalEquivalences).rlp

/-! ## Layer 2: Cartesian fibrations over arbitrary bases -/

/-- README §2.2.1. Along a categorical equivalence `j : S ⟶ T`, every Cartesian fibration `p : X ⟶ S` is equivalent, as a
Cartesian fibration over `S`, to the pullback of a Cartesian fibration over `T`: there is a map over `S` into the
pullback, carrying `p`-Cartesian edges to Cartesian edges, that is a categorical equivalence. (HTT, Cor. 3.3.1.2,
p. 223.) -/
theorem exists_cartesianFibration_of_isCategoricalEquivalence {X S T : SSet.{u}} (p : X ⟶ S)
    [CartesianFibration p] (j : S ⟶ T) (hj : IsCategoricalEquivalence j) :
    ∃ (Y : SSet.{u}) (q : Y ⟶ T) (f : X ⟶ pullback q j),
      CartesianFibration q ∧ f ≫ pullback.snd q j = p ∧
        (∀ (x y : X _⦋0⦌) (e : Edge x y), e.IsCartesian p → (e.map f).IsCartesian (pullback.snd q j)) ∧
        IsCategoricalEquivalence f := by
  sorry

/-- README §2.3.1. Every Cartesian fibration, over an arbitrary simplicial set, is a categorical fibration. (HTT,
Prop. 3.3.1.7, p. 227.) -/
theorem categoricalFibrations_of_cartesianFibration {X S : SSet.{u}} (p : X ⟶ S)
    [CartesianFibration p] :
    categoricalFibrations p := by
  sorry

/-- README §2.4.1. Base change along a Cartesian fibration, over an arbitrary simplicial set, preserves categorical
equivalences. (HTT, Prop. 3.3.1.3, p. 223.) -/
theorem isCategoricalEquivalence_pullback_fst {X S T : SSet.{u}} (p : X ⟶ S) [CartesianFibration p]
    (g : T ⟶ S) (hg : IsCategoricalEquivalence g) :
    IsCategoricalEquivalence (pullback.fst p g) := by
  sorry

/-- README §2.4.3. The fiberwise criterion over an arbitrary base: a map of Cartesian fibrations preserving Cartesian edges is
a categorical equivalence exactly when it is one on every fiber. (HTT, Prop. 3.3.1.5, (1) ⇔ (2), p. 225.) -/
theorem isCategoricalEquivalence_iff_fiber {X Y S : SSet.{u}} (p : X ⟶ S) (q : Y ⟶ S)
    [CartesianFibration p] [CartesianFibration q] (f : X ⟶ Y) (w : f ≫ q = p)
    (hf : ∀ (x y : X _⦋0⦌) (e : Edge x y), e.IsCartesian p → (e.map f).IsCartesian q) :
    IsCategoricalEquivalence f ↔
      ∀ s : Δ[0] ⟶ S,
        IsCategoricalEquivalence
          (pullback.map p s q s f (𝟙 _) (𝟙 _) (by rw [Category.comp_id, w]) (by simp)) := by
  sorry

/-! ## Layer 3: Generators of Cat∞ -/

/-- The vertex of `Cat∞` (Tau Ceti `SSet.catInfty`) given by a small ∞-category `A`. Local to this file. (README,
§3.4.2; HTT, Def. 3.0.0.1.) -/
noncomputable def CatInfty.vertex (A : SSet.{u}) [hA : A.Quasicategory] : catInfty.{u} _⦋0⦌ :=
  (SimplicialNerve.fromNerve CatInftyΔ.{u}).app _
    (nerveEquiv.symm (⟨CoreEnriched.of A, hA⟩ : CatInftyΔ.{u}))

/-- README §3.4.2. `Cat∞` is generated under small colimits by `Δ[0]` and `Δ[1]`: a property of vertices of `Cat∞` that is
invariant under equivalence, holds at `Δ[0]` and `Δ[1]`, and passes to colimits of small diagrams holds at every
vertex. (Nikolaus–Scholze, Lemma A.17, pp. 140–141.) -/
theorem CatInfty.colimit_induction (P : catInfty.{u} _⦋0⦌ → Prop)
    (hP : ∀ {x y : catInfty.{u} _⦋0⦌} (e : Edge x y), e.IsEquivalence → P x → P y)
    (h₀ : P (CatInfty.vertex Δ[0])) (h₁ : P (CatInfty.vertex Δ[1]))
    (hcolim : ∀ (K : SSet.{u + 1}), (∀ n, Small.{u} (K.obj n)) → ∀ (p : K ⟶ catInfty.{u})
      (c : (coslice p) _⦋0⦌), coslice.IsColimit p c → (∀ k : K _⦋0⦌, P (p.app _ k)) →
        P ((coslice.π p).app _ c))
    (x : catInfty.{u} _⦋0⦌) :
    P x := by
  sorry

end TauCetiRoadmap.InfinityCategoryTheory.Straightening

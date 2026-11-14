/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.Cartesian
public import TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence
public import TauCeti.AlgebraicTopology.Quasicategory.FullSubcategory
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.Quasicategory.LocallySmall
public import TauCeti.AlgebraicTopology.SimplicialSet.AnodyneExtensions.LeftRight.Basic
public import TauCeti.AlgebraicTopology.SimplicialSet.CardinalFiltered
public import TauCeti.AlgebraicTopology.SimplicialSet.Fiber
public import TauCeti.AlgebraicTopology.SimplicialSet.InternalHom
public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence
public import TauCeti.AlgebraicTopology.SimplicialSet.WeaklyContractible

/-!
# Accessible ∞-categories: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti when their carriers exist there, with the few definitions
their statements need. An ∞-category is a quasicategory (`SSet.Quasicategory`), a colimit of
`p : K ⟶ C` is an initial vertex of the coslice `C_{p/}` (`SSet.coslice.IsColimit`), and κ-small
means fewer than κ nondegenerate simplices, as in `SSet.IsCardinalFiltered`.

Stated: under-categories of categorical fibrations (§1.1, HTT Lemma 5.4.5.3); essentially κ-small
and essentially small ∞-categories (§3.1, HTT Def. 5.4.1.3) and the equivalence of conditions (3)
and (4) of HTT Prop. 5.4.1.2; Cartesian fibrations with small base and fibers (§3.3, HTT
Prop. 5.4.1.4); local smallness (§4.2, HTT Prop. 5.4.1.7 and Example 5.4.1.8); weakly cofinal
and κ-cofinal functors and their four lemmas (§6.4, HTT Def. 5.4.5.8, Example 5.4.5.9, Lemmas 5.4.6.4, 5.4.5.11, 5.4.5.12); κ-filtered colimits in
under-categories (§6.5, HTT Lemma 5.4.5.14). Defined here as this Part's own:
`IsEssentiallyCardinalSmall`, `IsEssentiallySmall` (§3.1), `IsWeaklyCofinal`, `IsCardinalCofinal`
(§6.4) and `HasCardinalFilteredColimits` (the README's "admits small κ-filtered colimits", used in
§6.5). Repeated with the same names and bodies: `IsCategoricalEquivalence` from Part InfinityCategoryFoundations
(its §2.1), and `sectionsRestrict` and `IsCofinal` from Part LimitsAndKanExtensions (its §2.1).
Diagrams are indexed by simplicial sets in the universe of the ∞-category they land in; "small"
means a `w`-small set of nondegenerate simplices, `w` the universe of the cardinals.

Not statable at the pins. Every other headline needs κ-compact objects, `Ind_κ`, accessible
∞-categories, the ∞-category of spaces with its corepresented functors, or categorical pullback
squares, none of which is in Mathlib or Tau Ceti (κ-compactness is defined through the
corepresented functor into spaces, `Ind_κ` through presheaves classifying κ-filtered right
fibrations, and categorical pullback squares are homotopy pullbacks for the Joyal model structure).
In detail:

* the categorical pullback statements of §§1.1–1.3 (HTT Lemmas 5.4.5.2, 5.4.5.4, 5.4.5.5, 5.4.5.7)
  need categorical pullback squares; the lemma inside the route of §1.3 (HTT Lemma 5.4.5.6) needs
  projective model structures and homotopy colimit diagrams of simplicial sets;
* Layer 2 (HTT Prop. 5.3.4.13, Cors. 5.3.4.14–5.3.4.15, Props. 5.3.4.17–5.3.4.18) needs κ-compact
  objects and presheaf ∞-categories;
* the remaining conditions of HTT Prop. 5.4.1.2 and Cor. 5.4.1.5 (§§3.1–3.2) need minimal models
  (condition (2)) and κ-compact objects of `Cat∞` and of spaces (condition (5)); the
  ω-compactness of finite simplicial sets in `Cat∞` (SAG, proof of Lemma 4.5.3.1) needs ω-compact
  objects of `Cat∞`;
* Layers 4–5 apart from §4.2 and the order-theoretic lemma (HTT Prop. 5.3.5.12, Lemma 5.4.2.4,
  Props. 5.4.3.4, 5.3.5.15, 5.4.2.2, 5.4.2.9, Rem. 5.4.2.13, Cor. 5.4.3.6, Props. 5.4.7.7, 5.4.7.4,
  Lemmas 5.4.7.5–5.4.7.6) need `Ind_κ`, κ-compact objects or accessible ∞-categories; the case κ < κ' of
  HTT Lemma 5.4.2.8 is Mathlib's, and its case κ = κ' is a boundary case left to the README;
* Layers 6–7 apart from §6.4 and HTT Lemma 5.4.5.14 (HTT Lemmas 5.4.4.1–5.4.4.2 and 5.4.5.13,
  Props. 5.4.4.3, 5.4.5.15, 5.4.6.6, Cors. 5.4.5.16, 5.4.6.7, Lemmas 5.4.6.1, 5.4.6.3, 5.4.6.5,
  5.4.7.2, Example 5.4.7.9, Prop. 5.4.7.10) need accessible ∞-categories, κ-compact objects,
  categorical pullback squares, or (Lemmas 5.4.4.1–5.4.4.2) coCartesian fibrations with their
  ∞-categories of sections;
* Layer 8 (HA Prop. 5.2.2.36, Cors. 5.2.2.37 and 5.2.2.39, HA Def. 4.8.1.1, HTT Def. 5.4.2.14,
  Props. 5.4.7.3 and 5.4.7.11, Lemma 5.4.7.15, Cor. 5.4.7.17) needs
  unstraightening of functors to `Cat∞`, relative limits, adjointable squares, subcategories of
  `SSet.catInfty` (which is not shown to be a quasicategory at the pins) and accessible
  ∞-categories.
-/

public section

open CategoryTheory Limits MonoidalCategory MonoidalClosed CartesianMonoidalCategory Simplicial
  SSet

universe w v u

namespace TauCetiRoadmap.InfinityCategoryTheory.AccessibleInfinityCategories

/-! ## Definitions repeated from earlier Parts -/

/-- A map `f : A ⟶ B` of simplicial sets is a categorical equivalence when, for every
∞-category `C`, restriction along `f` induces an equivalence of homotopy categories
`h Fun(B, C) ⥤ h Fun(A, C)`. Part InfinityCategoryFoundations' definition (its §2.1.6), repeated with the same body. (HTT, Def. 1.1.5.14, in
the equivalent form of Kerodon, §4.5.4, Def. 4.5.4.1.) -/
def IsCategoricalEquivalence {A B : SSet.{u}} (f : A ⟶ B) : Prop :=
  ∀ (C : SSet.{u}) [C.Quasicategory],
    (hoFunctor.map ((MonoidalClosed.pre f).app C)).toFunctor.IsEquivalence

/-- The class of categorical equivalences. Part InfinityCategoryFoundations' definition (its §2.1.6), repeated
with the same body. -/
def categoricalEquivalences : MorphismProperty SSet.{u} :=
  fun _ _ f ↦ IsCategoricalEquivalence f

open MorphismProperty in
/-- The categorical fibrations: maps with the right lifting property against every monomorphism that is a
categorical equivalence, the fibrations of the Joyal model structure. Part InfinityCategoryFoundations'
definition (its §9.4.1), repeated with the same body. (HTT, §2.2.5, p. 108.) -/
def categoricalFibrations : MorphismProperty SSet.{u} :=
  (monomorphisms SSet.{u} ⊓ categoricalEquivalences).rlp

/-- Restriction of sections along `v : K ⟶ B`: a section of `p : E ⟶ B` over `B` restricts to a
map `K ⟶ E` over `v`. Part LimitsAndKanExtensions' definition (its §2.1.1), repeated with the same
body. (HTT, Def. 4.1.1.1, the map `Map_B(B, E) ⟶ Map_B(K, E)`.) -/
noncomputable def sectionsRestrict {K B E : SSet.{u}} (p : E ⟶ B) (v : K ⟶ B) :
    (SSet.ihomOver p (𝟙 B) : SSet.{u}) ⟶ (SSet.ihomOver p v : SSet.{u}) :=
  SSet.ihomOver.homEquiv.symm
    ⟨v ▷ _ ≫ (SSet.ihomOver.homEquiv (𝟙 (SSet.ihomOver p (𝟙 B) : SSet.{u}))).1, by
      rw [Category.assoc, (SSet.ihomOver.homEquiv (𝟙 _)).2, Category.comp_id, whiskerRight_fst]⟩

/-- A map `v : K ⟶ B` of simplicial sets is *cofinal* when, for every right fibration
`p : E ⟶ B`, restriction of sections `Map_B(B, E) ⟶ Map_B(K, E)` is a weak homotopy equivalence.
Part LimitsAndKanExtensions' definition (its §2.1.1), repeated with the same body. (HTT,
Def. 4.1.1.1.) -/
def IsCofinal {K B : SSet.{u}} (v : K ⟶ B) : Prop :=
  ∀ (E : SSet.{u}) (p : E ⟶ B) [SSet.RightFibration p],
    SSet.IsWeakHomotopyEquivalence (sectionsRestrict p v)

/-! ## Layer 1: Colimits and compact objects in categorical pullbacks -/

/-- README §1.1.1. If `p : X ⟶ Y` is a categorical fibration of ∞-categories and `f : K ⟶ X` is a diagram,
the induced map of under-categories `X_{f/} ⟶ Y_{pf/}` is a categorical fibration. (HTT,
Lemma 5.4.5.3, p. 454.) -/
theorem categoricalFibration_coslice_map {K X Y : SSet.{u}} [X.Quasicategory] [Y.Quasicategory]
    (p : X ⟶ Y) (hp : categoricalFibrations p) (f : K ⟶ X) :
    categoricalFibrations (coslice.map (p := f) (q := f ≫ p) (𝟙 K) p (by simp)) := by
  sorry

/-! ## Layer 3: Essentially small ∞-categories -/

/-- README §3.1.1. An ∞-category `C` is *essentially κ-small* when some ∞-category `D` with fewer than `κ`
nondegenerate simplices admits a categorical equivalence `D → C`. The roadmap uses it for `κ`
uncountable regular, where it is condition (3) of HTT, Prop. 5.4.1.2, taken as the definition.
The cardinal lives in its own universe, so that a large ∞-category can be compared with a small
cardinal. (HTT, Def. 5.4.1.3, p. 439.) -/
def IsEssentiallyCardinalSmall (κ : Cardinal.{w}) (C : SSet.{u}) [C.Quasicategory] : Prop :=
  ∃ (D : SSet.{u}) (_ : D.Quasicategory) (f : D ⟶ C), HasCardinalLT D.N κ ∧
    QCat.IsCategoricalEquivalence (X := ⟨D, inferInstance⟩) (Y := ⟨C, inferInstance⟩)
      (ObjectProperty.homMk f)

/-- README §3.1.1. An ∞-category is *essentially small* (relative to the universe `w`) when it is
essentially κ-small for some uncountable regular cardinal `κ` in that universe. (HTT,
Def. 5.4.1.3, p. 439.) -/
def IsEssentiallySmall (C : SSet.{u}) [C.Quasicategory] : Prop :=
  ∃ κ : Cardinal.{w}, κ.IsRegular ∧ Cardinal.aleph0 < κ ∧ IsEssentiallyCardinalSmall κ C

/-- README §3.1.2, conditions (3) and (4). For κ uncountable regular, an ∞-category `C` is essentially
κ-small exactly when some κ-small simplicial set admits a categorical equivalence to `C`. (HTT,
Prop. 5.4.1.2, (3) ⇔ (4), p. 438.) -/
theorem isEssentiallyCardinalSmall_iff_exists_isCategoricalEquivalence {κ : Cardinal.{w}}
    (hκ : κ.IsRegular) (hκ₀ : Cardinal.aleph0 < κ) (C : SSet.{u}) [C.Quasicategory] :
    IsEssentiallyCardinalSmall κ C ↔
      ∃ (K : SSet.{u}) (f : K ⟶ C), HasCardinalLT K.N κ ∧ IsCategoricalEquivalence f := by
  sorry

/-- README §3.3.1. The total space of a Cartesian fibration whose base and fibers are essentially κ-small is
essentially κ-small. (HTT, Prop. 5.4.1.4, p. 439.) -/
theorem isEssentiallyCardinalSmall_of_cartesianFibration {κ : Cardinal.{w}} (hκ : κ.IsRegular)
    (hκ₀ : Cardinal.aleph0 < κ) {C D : SSet.{u}} [C.Quasicategory] [D.Quasicategory] (p : C ⟶ D)
    [CartesianFibration p] (hD : IsEssentiallyCardinalSmall κ D)
    (hfib : ∀ d : D _⦋0⦌, IsEssentiallyCardinalSmall κ (fiber p d : SSet.{u})) :
    IsEssentiallyCardinalSmall κ C := by
  sorry

/-! ## Layer 4: Local smallness -/

/-- README §4.2.1. An ∞-category is locally `u`-small, in Tau Ceti's sense that every right mapping space
has a `u`-small Kan model, exactly when every full subcategory spanned by a `u`-small set of
objects is essentially small. (HTT, Prop. 5.4.1.7, p. 441.) -/
theorem isLocallySmall_iff_forall_isEssentiallySmall (C : SSet.{v}) [C.Quasicategory] :
    IsLocallySmall.{u} C ↔ ∀ S : Set (C _⦋0⦌), Small.{u} S →
      IsEssentiallySmall.{u} (C.fullEnhancedSubcategory (· ∈ S) : SSet.{v}) := by
  sorry

/-- README §4.2.2. If `C` is locally small and `D` is essentially small, then `Fun(D, C)` is locally small.
(HTT, Example 5.4.1.8, p. 441.) -/
theorem isLocallySmall_ihom {C D : SSet.{v}} [C.Quasicategory] [D.Quasicategory]
    [IsLocallySmall.{u} C] (hD : IsEssentiallySmall.{u} D) :
    IsLocallySmall.{u} ((ihom D).obj C) := by
  sorry

/-! ## Layer 6: Weakly cofinal and κ-cofinal functors, under-categories -/

/-- README §6.4.1. A functor `f : I ⟶ J` is *weakly cofinal* when every object of `J` has a morphism to the
image of some object of `I`. Used for filtered ∞-categories `I` and `J`. (HTT, Def. 5.4.5.8,
p. 457.) -/
def IsWeaklyCofinal {I J : SSet.{u}} (f : I ⟶ J) : Prop :=
  ∀ j : J _⦋0⦌, ∃ i : I _⦋0⦌, Nonempty (Edge j (f.app _ i))

/-- README §6.4.1. A functor `f : I ⟶ J` is *κ-cofinal* when, for every diagram `p : K ⟶ I` indexed by a
κ-small weakly contractible simplicial set, the induced functor `I_{p/} ⟶ J_{fp/}` is weakly
cofinal. Used for filtered ∞-categories `I` and `J`. (HTT, Def. 5.4.5.8, p. 457.) -/
def IsCardinalCofinal (κ : Cardinal.{w}) {I J : SSet.{u}} (f : I ⟶ J) : Prop :=
  ∀ ⦃K : SSet.{u}⦄ (p : K ⟶ I), HasCardinalLT K.N κ → K.IsWeaklyContractible →
    IsWeaklyCofinal (coslice.map (p := p) (q := p ≫ f) (𝟙 K) f (by simp))

/-- README §6.4.2. For a τ-filtered ∞-category `I` and a τ-small diagram `p : K ⟶ I`, the projection
`I_{p/} ⟶ I` is τ-cofinal. (HTT, Example 5.4.5.9, p. 457.) -/
theorem isCardinalCofinal_coslice_π {τ : Cardinal.{w}} (hτ : τ.IsRegular) {K I : SSet.{u}}
    [I.Quasicategory] [I.IsCardinalFiltered τ] (p : K ⟶ I) (hK : HasCardinalLT K.N τ) :
    IsCardinalCofinal τ (coslice.π p) := by
  sorry

/-- README §6.4.3. For a κ-cofinal functor `f : I ⟶ J` between τ-filtered ∞-categories and a τ-small
diagram `p : K ⟶ I`, the induced functor `I_{p/} ⟶ J_{fp/}` is κ-cofinal. (HTT, Lemma 5.4.6.4,
p. 464.) -/
theorem IsCardinalCofinal.coslice_map {κ τ : Cardinal.{w}} (hκ : κ.IsRegular) (hτ : τ.IsRegular)
    {K I J : SSet.{u}} [I.Quasicategory] [J.Quasicategory] [I.IsCardinalFiltered τ]
    [J.IsCardinalFiltered τ] {f : I ⟶ J} (hf : IsCardinalCofinal κ f) (p : K ⟶ I)
    (hK : HasCardinalLT K.N τ) :
    IsCardinalCofinal κ (coslice.map (p := p) (q := p ≫ f) (𝟙 K) f (by simp)) := by
  sorry

/-- README §6.4.5. For a κ-cofinal functor `f : I ⟶ J` between τ-filtered ∞-categories and
a τ-small diagram `p : K ⟶ J`, the ∞-category `I_{p/} = I ×_J J_{p/}` is τ-filtered.
(HTT, Lemma 5.4.5.11 (1), p. 458, which assumes p κ-small; see the README.) -/
theorem IsCardinalCofinal.isCardinalFiltered_pullback {κ τ : Cardinal.{w}} (hκ : κ.IsRegular)
    (hτ : τ.IsRegular) {K I J : SSet.{u}} [I.Quasicategory] [J.Quasicategory]
    [I.IsCardinalFiltered τ] [J.IsCardinalFiltered τ] {f : I ⟶ J} (hf : IsCardinalCofinal κ f)
    (p : K ⟶ J) (hKτ : HasCardinalLT K.N τ) :
    (pullback f (coslice.π p)).IsCardinalFiltered τ := by
  sorry

/-- README §6.4.4. For a κ-cofinal functor `f : I ⟶ J` between τ-filtered ∞-categories and a κ-small
diagram `p : K ⟶ J`, the projection `I_{p/} = I ×_J J_{p/} ⟶ J_{p/}` is κ-cofinal. (HTT,
Lemma 5.4.5.11 (2), p. 458.) -/
theorem IsCardinalCofinal.pullback_snd {κ τ : Cardinal.{w}} (hκ : κ.IsRegular)
    (hτ : τ.IsRegular) {K I J : SSet.{u}} [I.Quasicategory] [J.Quasicategory]
    [I.IsCardinalFiltered τ] [J.IsCardinalFiltered τ] {f : I ⟶ J} (hf : IsCardinalCofinal κ f)
    (p : K ⟶ J) (hK : HasCardinalLT K.N κ) :
    IsCardinalCofinal κ (pullback.snd f (coslice.π p)) := by
  sorry

/-- README §6.4.6. A κ-cofinal functor between filtered ∞-categories is cofinal. (HTT, Lemma 5.4.5.12,
p. 459.) -/
theorem IsCardinalCofinal.isCofinal {κ : Cardinal.{w}} (hκ : κ.IsRegular) {I J : SSet.{u}}
    [I.Quasicategory] [J.Quasicategory] [I.IsCardinalFiltered Cardinal.aleph0.{w}]
    [J.IsCardinalFiltered Cardinal.aleph0.{w}] {f : I ⟶ J} (hf : IsCardinalCofinal κ f) :
    IsCofinal f := by
  sorry

/-- README §6.5.2. A simplicial set `C` *admits small κ-filtered colimits* when every diagram in `C` indexed
by a κ-filtered ∞-category with a `w`-small set of nondegenerate simplices has a colimit, `w` being
the universe of κ. `C` may be large (in a universe above `w`); used for ∞-categories `C` and
regular κ. (HTT, §5.3.1, after Def. 5.3.1.7, p. 400.) -/
def HasCardinalFilteredColimits (κ : Cardinal.{w}) (C : SSet.{u}) : Prop :=
  ∀ ⦃I : SSet.{u}⦄ [I.Quasicategory] [I.IsCardinalFiltered κ], Small.{w} I.N →
    ∀ (q : I ⟶ C), ∃ c : (coslice q) _⦋0⦌, coslice.IsColimit q c

/-- README §6.5.2. If an ∞-category `C` admits small τ-filtered colimits, so does the under-category `C_{p/}`
of every small diagram `p`. (HTT, Lemma 5.4.5.14, p. 460.) -/
theorem hasCardinalFilteredColimits_coslice {τ : Cardinal.{w}} (hτ : τ.IsRegular)
    {K C : SSet.{u}} [C.Quasicategory] (hC : HasCardinalFilteredColimits τ C) (p : K ⟶ C)
    (hK : Small.{w} K.N) :
    HasCardinalFilteredColimits τ (coslice p) := by
  sorry

end TauCetiRoadmap.InfinityCategoryTheory.AccessibleInfinityCategories

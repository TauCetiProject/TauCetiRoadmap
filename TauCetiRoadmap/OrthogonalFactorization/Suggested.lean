/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Targets — unique lifting and orthogonal factorization systems (`OrthogonalFactorization`)

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a milestone
nor the roadmap. Where a statement below and the README disagree, the README wins.

The file states the spine: the two single-square predicates and the codiagonal criterion (B), the
(co)limit stability of uniqueness (C), the orthogonal operators with their Galois theory and
closure properties (D), orthogonal pairs and factorization systems with uniqueness of
factorizations (E), the arrow reflection (F), the codiagonal generators and the generated system
(G), the cellular description (H), filtered-colimit stability of the right class (I), and the local
objects (J). Milestone A's two ambient closure lemmas are stated first, since they are the only
targets that mention no lifting at all.

Universe conventions follow the README: `cellular.{w}` carries the coproduct and
transfinite-composition universe, and presentability statements carry `κ : Cardinal.{w}`
explicitly.
-/

universe w w' v v' u u'

namespace CategoryTheory

open Category Limits MorphismProperty

/-! ## Milestone A — Two closure lemmas for arbitrary morphism properties -/

section MilestoneA

variable {C : Type u} [Category.{v} C]

/-- **A1.** The `Sigma.map` form of `IsStableUnderCoproductsOfShape`. -/
theorem MorphismProperty.sigmaMap_mem (W : MorphismProperty C) {J : Type w}
    [W.IsStableUnderCoproductsOfShape J] {X₁ X₂ : J → C} [HasCoproduct X₁] [HasCoproduct X₂]
    (f : ∀ j, X₁ j ⟶ X₂ j) (hf : ∀ j, W (f j)) :
    W (Limits.Sigma.map f) :=
  sorry

/-- **A1.** Cobase change alone gives stability under *finite* coproducts. -/
theorem MorphismProperty.isStableUnderCoproductsOfShape_of_finite (W : MorphismProperty C)
    [W.IsMultiplicative] [W.RespectsIso] [W.IsStableUnderCobaseChange]
    [HasFiniteCoproducts C] (J : Type w) [Finite J] :
    W.IsStableUnderCoproductsOfShape J :=
  sorry

/-- **A1.** Adding the filtered colimits over `Finset (Discrete α)` upgrades the previous lemma to
arbitrary coproducts. -/
theorem MorphismProperty.isStableUnderCoproductsOfShape_of_colimitsOfShape_finset
    (W : MorphismProperty C) [W.IsMultiplicative] [W.RespectsIso] [W.IsStableUnderCobaseChange]
    [HasFiniteCoproducts C] (α : Type w) [HasCoproducts.{w} C]
    [HasColimitsOfShape (Finset (Discrete α)) C]
    [W.IsStableUnderColimitsOfShape (Finset (Discrete α))] :
    W.IsStableUnderCoproductsOfShape α :=
  sorry

end MilestoneA

/-! ## Milestone B — Unique lifting for a single pair of morphisms -/

section MilestoneB

variable {C : Type u} [Category.{v} C] {A B X Y : C} (i : A ⟶ B) (p : X ⟶ Y)

/-- **B1.** Every commutative square from `i` to `p` has at most one filler. -/
class HasAtMostOneLiftingProperty : Prop where
  /-- The type of lifts of any square from `i` to `p` is a subsingleton. -/
  subsingleton_liftStruct :
    ∀ {f : A ⟶ X} {g : B ⟶ Y} (sq : CommSq f i p g), Subsingleton sq.LiftStruct

/-- **B1.** Every commutative square from `i` to `p` has exactly one filler. -/
class HasUniqueLiftingProperty : Prop extends HasLiftingProperty i p,
  HasAtMostOneLiftingProperty i p

variable {i p}

/-- **B1.** The workhorse form of `HasAtMostOneLiftingProperty`: two fillers of one square agree.
This, and not the `Subsingleton` field, is what downstream proofs use. -/
theorem CommSq.lift_eq_of_hasAtMostOneLiftingProperty [HasAtMostOneLiftingProperty i p]
    {f : A ⟶ X} {g : B ⟶ Y} (sq : CommSq f i p g) {l₁ l₂ : B ⟶ X}
    (h₁ : i ≫ l₁ = f) (h₁' : l₁ ≫ p = g) (h₂ : i ≫ l₂ = f) (h₂' : l₂ ≫ p = g) :
    l₁ = l₂ :=
  sorry

/-- **B1.** The unique lifting property unfolded as a `∃!` statement. -/
theorem hasUniqueLiftingProperty_iff :
    HasUniqueLiftingProperty i p ↔
      ∀ {f : A ⟶ X} {g : B ⟶ Y}, CommSq f i p g → ∃! l : B ⟶ X, i ≫ l = f ∧ l ≫ p = g :=
  sorry

/-- **B1.** Uniqueness against an epimorphism source is automatic. An instance: it fires constantly
downstream, in particular at the codiagonal generators of Milestone G. -/
instance HasAtMostOneLiftingProperty.of_epi [Epi i] : HasAtMostOneLiftingProperty i p :=
  sorry

/-- **B1.** Assembling the two halves. -/
theorem HasUniqueLiftingProperty.mk' [HasLiftingProperty i p] [HasAtMostOneLiftingProperty i p] :
    HasUniqueLiftingProperty i p :=
  sorry

/-- **B1.** A morphism with the ordinary lifting property against itself is an isomorphism: the
square with identity edges provides a two-sided inverse. This is the engine behind
`IsOrthogonalPair.inf_eq_isomorphisms` (D3). -/
theorem isIso_of_hasLiftingProperty_self {X Y : C} (f : X ⟶ Y) [HasLiftingProperty f f] :
    IsIso f :=
  sorry

/-- **B1.** Duality: unique lifting in `Cᵒᵖ` exchanges the two morphisms. -/
theorem HasUniqueLiftingProperty.op (h : HasUniqueLiftingProperty i p) :
    HasUniqueLiftingProperty p.op i.op :=
  sorry

/-- **B1.** Uniqueness is inherited by a retract of the arrow `i`. -/
theorem RetractArrow.hasAtMostOneLiftingProperty {A' B' : C} {i' : A' ⟶ B'}
    (h : RetractArrow i' i) [HasAtMostOneLiftingProperty i p] :
    HasAtMostOneLiftingProperty i' p :=
  sorry

variable (i p)

/-- **B2. The codiagonal criterion.** Lifts against `i` are unique exactly when the codiagonal of
`i` has the ordinary left lifting property against `p`. -/
theorem hasAtMostOneLiftingProperty_iff_codiagonal [HasPushout i i] :
    HasAtMostOneLiftingProperty i p ↔ HasLiftingProperty (pushout.codiagonal i) p :=
  sorry

/-- **B2. The diagonal criterion**, dual to the previous one. -/
theorem hasAtMostOneLiftingProperty_iff_diagonal [HasPullback p p] :
    HasAtMostOneLiftingProperty i p ↔ HasLiftingProperty i (pullback.diagonal p) :=
  sorry

/-- **B2.** The unique lifting property is the conjunction of two *ordinary* lifting properties.
This is what makes Mathlib's small object argument available to the orthogonal theory. -/
theorem hasUniqueLiftingProperty_iff_lifting_and_codiagonal [HasPushout i i] :
    HasUniqueLiftingProperty i p ↔
      HasLiftingProperty i p ∧ HasLiftingProperty (pushout.codiagonal i) p :=
  sorry

end MilestoneB

/-! ## Milestone C — Unique lifting and (co)limits

Existence of lifts is imported from Mathlib throughout; only uniqueness is proved here, except in
C2, where the ordinary statement is false. -/

section MilestoneC

variable {C : Type u} [Category.{v} C]

/-- **C1.** Uniqueness is inherited by a cobase change of `i`. -/
theorem IsPushout.hasAtMostOneLiftingProperty {A B A' B' X Y : C} {s : A ⟶ A'} {f : A ⟶ B}
    {g : A' ⟶ B'} {t : B ⟶ B'} (h : IsPushout s f g t) (p : X ⟶ Y)
    [HasAtMostOneLiftingProperty f p] :
    HasAtMostOneLiftingProperty g p :=
  sorry

/-- **C1.** Uniqueness is inherited by a base change of `p`. -/
theorem IsPullback.hasAtMostOneLiftingProperty {A B X Y X' Y' : C} {s : X' ⟶ X} {f : X' ⟶ Y'}
    {g : X ⟶ Y} {t : Y' ⟶ Y} (h : IsPullback s f g t) (i : A ⟶ B)
    [HasAtMostOneLiftingProperty i g] :
    HasAtMostOneLiftingProperty i f :=
  sorry

/-- **C1.** A product of maps inherits uniqueness against a fixed `i`. -/
instance {A B : C} (i : A ⟶ B) {J : Type w} {X₁ X₂ : J → C} [HasProduct X₁] [HasProduct X₂]
    (p : ∀ j, X₁ j ⟶ X₂ j) [∀ j, HasUniqueLiftingProperty i (p j)] :
    HasUniqueLiftingProperty i (Limits.Pi.map p) :=
  sorry

/-- **C2.** Unique lifting passes to a general `J`-shaped limit of morphisms. The
*ordinary*-lifting analogue of this statement is **false**; uniqueness is what repairs it, by
making the component lifts compatible with the transition maps, hence a cone. -/
theorem HasUniqueLiftingProperty.of_isLimit {A B : C} (i : A ⟶ B) {J : Type w} [Category.{w'} J]
    {F₁ F₂ : J ⥤ C} (φ : F₁ ⟶ F₂) {c₁ : Cone F₁} {c₂ : Cone F₂} (h₁ : IsLimit c₁)
    (h₂ : IsLimit c₂) (f : c₁.pt ⟶ c₂.pt) (hf : ∀ j, f ≫ c₂.π.app j = c₁.π.app j ≫ φ.app j)
    (hφ : ∀ j, HasUniqueLiftingProperty i (φ.app j)) :
    HasUniqueLiftingProperty i f :=
  sorry

/-- **C2.** The dual statement, for a `J`-shaped colimit and the left variable. -/
theorem HasUniqueLiftingProperty.of_isColimit {X Y : C} (p : X ⟶ Y) {J : Type w} [Category.{w'} J]
    {F₁ F₂ : J ⥤ C} (φ : F₁ ⟶ F₂) {c₁ : Cocone F₁} {c₂ : Cocone F₂} (h₁ : IsColimit c₁)
    (h₂ : IsColimit c₂) (f : c₁.pt ⟶ c₂.pt) (hf : ∀ j, c₁.ι.app j ≫ f = φ.app j ≫ c₂.ι.app j)
    (hφ : ∀ j, HasUniqueLiftingProperty (φ.app j) p) :
    HasUniqueLiftingProperty f p :=
  sorry

/-- **C3.** Unique lifting is stable under transfinite composition. The existence half is Mathlib's
`HasLiftingProperty.transfiniteComposition.hasLiftingProperty_ι_app_bot`; only the uniqueness half
is proved here, by transfinite induction comparing two lifts stage by stage. -/
theorem HasUniqueLiftingProperty.transfiniteComposition_ι_app_bot {X Y : C} (p : X ⟶ Y)
    {J : Type w} [LinearOrder J] [SuccOrder J] [OrderBot J] [WellFoundedLT J]
    {F : J ⥤ C} (c : Cocone F) (hc : IsColimit c)
    (hF : ∀ (j : J) (_ : ¬ IsMax j), HasUniqueLiftingProperty (F.map (homOfLE (Order.le_succ j))) p) :
    HasUniqueLiftingProperty (c.ι.app ⊥) p :=
  sorry

end MilestoneC

/-! ## Milestone D — The orthogonal classes of a morphism property -/

namespace MorphismProperty

section MilestoneD

variable {C : Type u} [Category.{v} C] (T : MorphismProperty C)

/-- **D1.** The maps with the *unique* left lifting property against every map of `T`. -/
def leftOrthogonal : MorphismProperty C := fun _ _ f ↦
  ∀ ⦃X Y : C⦄ (g : X ⟶ Y), T g → HasUniqueLiftingProperty f g

/-- **D1.** The maps with the *unique* right lifting property against every map of `T`. -/
def rightOrthogonal : MorphismProperty C := fun _ _ f ↦
  ∀ ⦃X Y : C⦄ (g : X ⟶ Y), T g → HasUniqueLiftingProperty g f

/-- **D1.** The two operators form an antitone Galois connection. -/
theorem le_leftOrthogonal_iff_le_rightOrthogonal (T' : MorphismProperty C) :
    T' ≤ T.leftOrthogonal ↔ T ≤ T'.rightOrthogonal :=
  sorry

/-- **D1.** The unit of the Galois connection. -/
theorem le_leftOrthogonal_rightOrthogonal : T ≤ T.rightOrthogonal.leftOrthogonal :=
  sorry

/-- **D1.** The first triple identity. -/
theorem rightOrthogonal_leftOrthogonal_rightOrthogonal :
    T.rightOrthogonal.leftOrthogonal.rightOrthogonal = T.rightOrthogonal :=
  sorry

/-- **D1.** A class squeezed between `T` and `T.rightOrthogonal.leftOrthogonal` has the same right
orthogonal as `T`. This makes H5's idempotence statements one line each. -/
theorem rightOrthogonal_eq_of_le_of_le_leftOrthogonal_rightOrthogonal {T' : MorphismProperty C}
    (h₁ : T ≤ T') (h₂ : T' ≤ T.rightOrthogonal.leftOrthogonal) :
    T'.rightOrthogonal = T.rightOrthogonal :=
  sorry

/-- **D1.** Comparison with the weak theory. -/
theorem leftOrthogonal_le_llp : T.leftOrthogonal ≤ T.llp := sorry

/-- **D1.** Comparison with the weak theory. -/
theorem rightOrthogonal_le_rlp : T.rightOrthogonal ≤ T.rlp := sorry

/-- **D1.** Membership in the right orthogonal of a family reduces to the unique right lifting
property against each generator. -/
theorem rightOrthogonal_ofHoms_iff {ι : Type*} {A B : ι → C} (f : ∀ i, A i ⟶ B i)
    {X Y : C} (p : X ⟶ Y) :
    (ofHoms f).rightOrthogonal p ↔ ∀ i, HasUniqueLiftingProperty (f i) p :=
  sorry

/-- **D1.** The orthogonals in the opposite category. -/
theorem op_leftOrthogonal : T.op.leftOrthogonal = T.rightOrthogonal.op := sorry

/-! ### D2 — Closure properties

Each is stated in bare form here; the `IsOrthogonalPair` instance form is the second half of the
target and is stated after D3. -/

instance leftOrthogonal_isMultiplicative : T.leftOrthogonal.IsMultiplicative := sorry

instance leftOrthogonal_respectsIso : T.leftOrthogonal.RespectsIso := sorry

instance leftOrthogonal_isStableUnderRetracts : T.leftOrthogonal.IsStableUnderRetracts := sorry

instance leftOrthogonal_isStableUnderCobaseChange :
    T.leftOrthogonal.IsStableUnderCobaseChange := sorry

instance rightOrthogonal_isStableUnderBaseChange :
    T.rightOrthogonal.IsStableUnderBaseChange := sorry

/-- **D2.** Right cancellation for the **right** class, and no other cancellation rule: neither
class has `HasTwoOutOfThreeProperty`. -/
instance rightOrthogonal_hasOfPostcompProperty :
    T.rightOrthogonal.HasOfPostcompProperty T.rightOrthogonal := sorry

/-- **D2.** Left cancellation for the **left** class. This single instance is what removes the
`retracts` from the cellular description in H3, and it is exactly what fails for `llp`. -/
instance leftOrthogonal_hasOfPrecompProperty :
    T.leftOrthogonal.HasOfPrecompProperty T.leftOrthogonal := sorry

/-- **D2.** The right class is stable under limits of **every** shape, with no filteredness
hypothesis: this is C2 applied pointwise. -/
instance rightOrthogonal_isStableUnderLimitsOfShape (J : Type w) [Category.{w'} J] :
    T.rightOrthogonal.IsStableUnderLimitsOfShape J := sorry

/-- **D2.** Dually for the left class and colimits. -/
instance leftOrthogonal_isStableUnderColimitsOfShape (J : Type w) [Category.{w'} J] :
    T.leftOrthogonal.IsStableUnderColimitsOfShape J := sorry

/-- **D2.** From C3. -/
instance leftOrthogonal_isStableUnderTransfiniteComposition :
    T.leftOrthogonal.IsStableUnderTransfiniteComposition.{w} := sorry

/-- **A2.** (stated here, since it needs D1's definition and D2's closure.) A colimit of objects under `X`, over a *connected* shape, has left-orthogonal structure
map as soon as every stage does. Connectedness is essential. -/
theorem leftOrthogonal_of_isColimit_under {X : C}
    {J : Type w} [Category.{w'} J] [IsConnected J] (F : J ⥤ Under X)
    (hF : ∀ j, T.leftOrthogonal (F.obj j).hom)
    (c : Cocone F) (hc : IsColimit c) :
    T.leftOrthogonal c.pt.hom :=
  sorry


/-! ### D3 — Orthogonal pairs -/

/-- **D3.** Two classes each of which is the unique orthogonal of the other; the *unique lifting
system* of [anel2009, Definition 1]. No factorization axiom.

Neither field is a `simp` lemma: in `B.leftOrthogonal = A` the argument `A` does not occur on the
left. Use them through an explicit `rw [← IsOrthogonalPair.left_eq]`. -/
class IsOrthogonalPair (A B : MorphismProperty C) : Prop where
  /-- The left class is the left orthogonal of the right class. -/
  left_eq : B.leftOrthogonal = A
  /-- The right class is the right orthogonal of the left class. -/
  right_eq : A.rightOrthogonal = B

/-- **D3.** The pair generated by any class ([anel2009, Lemma 2]). -/
instance rightOrthogonal_isOrthogonalPair :
    IsOrthogonalPair T.rightOrthogonal.leftOrthogonal T.rightOrthogonal :=
  sorry

/-- **D3.** **The two classes of an orthogonal pair meet exactly in the isomorphisms.** Every later
argument that turns a factorization into an isomorphism goes through this lemma. -/
theorem IsOrthogonalPair.inf_eq_isomorphisms (A B : MorphismProperty C) [IsOrthogonalPair A B] :
    A ⊓ B = isomorphisms C :=
  sorry

/-- **D2/D3.** The instance form of a closure property for an opaque orthogonal pair, where the
bare form cannot fire. Every item of D2 is stated twice in this way. -/
theorem IsOrthogonalPair.left_isStableUnderCobaseChange (A B : MorphismProperty C)
    [IsOrthogonalPair A B] : A.IsStableUnderCobaseChange :=
  sorry

end MilestoneD

/-! ## Milestone E — Orthogonal factorization systems -/

section MilestoneE

variable {C : Type u} [Category.{v} C] (L R : MorphismProperty C)

/-- **E1.** An orthogonal factorization system: each class is the unique orthogonal of the other,
and every morphism factors. -/
class IsOrthogonalFactorizationSystem : Prop where
  /-- The right class is the right orthogonal of the left class. -/
  rightOrthogonal : L.rightOrthogonal = R
  /-- The left class is the left orthogonal of the right class. -/
  leftOrthogonal : R.leftOrthogonal = L
  /-- Every morphism factors as a left map followed by a right map. -/
  hasFactorization : HasFactorization L R := by infer_instance

/-- **E1.** Forgetting uniqueness. A named theorem, never an instance: as an instance it loops
instance search through the Galois identities. -/
theorem IsOrthogonalFactorizationSystem.isWeakFactorizationSystem
    [IsOrthogonalFactorizationSystem L R] : IsWeakFactorizationSystem L R :=
  sorry

/-- **E1.** Adding uniqueness back: a weak factorization system whose left maps lift uniquely
against its right maps is an orthogonal factorization system. -/
theorem IsOrthogonalFactorizationSystem.of_isWeakFactorizationSystem [IsWeakFactorizationSystem L R]
    (h : ∀ {A B X Y : C} (i : A ⟶ B) (p : X ⟶ Y), L i → R p → HasUniqueLiftingProperty i p) :
    IsOrthogonalFactorizationSystem L R :=
  sorry

variable {L R}

/-- **E2.** The comparison square between two factorizations of one morphism. -/
theorem MapFactorizationData.commSq {X Y : C} {f : X ⟶ Y}
    (fac fac' : L.MapFactorizationData R f) : CommSq fac'.i fac.i fac'.p fac.p :=
  sorry

/-- **E2.** A comparison morphism between two factorizations is unique.

Note the hypothesis: the orthogonality inequality `L ≤ R.leftOrthogonal` alone. Neither
`HasFactorization` nor `IsOrthogonalFactorizationSystem` appears, which is what lets Milestone F
apply this before the system has been assembled. -/
theorem MapFactorizationData.hom_ext (hLR : L ≤ R.leftOrthogonal) {X Y : C} {f : X ⟶ Y}
    (fac fac' : L.MapFactorizationData R f) {l₁ l₂ : fac.Z ⟶ fac'.Z}
    (h₁ : fac.i ≫ l₁ = fac'.i) (h₁' : l₁ ≫ fac'.p = fac.p)
    (h₂ : fac.i ≫ l₂ = fac'.i) (h₂' : l₂ ≫ fac'.p = fac.p) :
    l₁ = l₂ :=
  sorry

/-- **E2. Uniqueness of factorizations.** Two factorizations of the same morphism differ by a
unique isomorphism of the intermediate object, compatible with both factors. -/
theorem MapFactorizationData.exists_iso (hLR : L ≤ R.leftOrthogonal) {X Y : C} {f : X ⟶ Y}
    (fac fac' : L.MapFactorizationData R f) :
    ∃ e : fac.Z ≅ fac'.Z, fac.i ≫ e.hom = fac'.i ∧ e.hom ≫ fac'.p = fac.p :=
  sorry

end MilestoneE

/-! ## Milestone F — The arrow reflection -/

section MilestoneF

variable {C : Type u} [Category.{v} C]

/-- **F1.** A morphism property reindexed as a property of the *objects* of `Arrow C`. Kept
distinct from Mathlib's `MorphismProperty.toSet`: `toSet` feeds the smallness API, `arrows` feeds
the `FullSubcategory` API. -/
def arrows (W : MorphismProperty C) : ObjectProperty (Arrow C) := fun f ↦ W f.hom

/-- **F1.** The bridge to `toSet`. -/
theorem mem_toSet_iff_arrows (W : MorphismProperty C) (f : Arrow C) :
    f ∈ W.toSet ↔ W.arrows f :=
  sorry

/-- **F1.** Closure of `W.arrows` under colimits *in `Arrow C`* is Mathlib's
`IsStableUnderColimitsOfShape` restated; the two agree because colimits in `Arrow C` are computed
componentwise, and this is the form F3 consumes. -/
instance arrows_isClosedUnderColimitsOfShape (W : MorphismProperty C) (J : Type w)
    [Category.{w'} J] [W.IsStableUnderColimitsOfShape J] [HasColimitsOfShape J C] :
    (W.arrows).IsClosedUnderColimitsOfShape J :=
  sorry

/-- **F2.** The reflector sending an arrow to the `R`-factor of a chosen factorization. -/
noncomputable def arrowReflection (L R : MorphismProperty C) [IsOrthogonalPair L R]
    [HasFactorization L R] : Arrow C ⥤ R.arrows.FullSubcategory :=
  sorry

/-- **F2.** The reflector is left adjoint to the inclusion. The hom-equivalence is built from E2
and fed to `Adjunction.mkOfHomEquiv`; it is not obtained from a limit-preservation criterion. -/
noncomputable def arrowReflectionAdjunction (L R : MorphismProperty C) [IsOrthogonalPair L R]
    [HasFactorization L R] : arrowReflection L R ⊣ R.arrows.ι :=
  sorry

/-- **F2.** Hence the `R`-arrows are a reflective subcategory of `Arrow C`, and are closed under
all limits of arrows for formal reasons. A `def`, instantiated by the caller at the pair at hand;
as an instance it loops. -/
@[instance_reducible] noncomputable def reflective_arrows_ι (L R : MorphismProperty C) [IsOrthogonalPair L R]
    [HasFactorization L R] : Reflective R.arrows.ι :=
  sorry

/-- **F2.** Dually, the `L`-arrows are coreflective. -/
@[instance_reducible] noncomputable def coreflective_arrows_ι (L R : MorphismProperty C) [IsOrthogonalPair L R]
    [HasFactorization L R] : Coreflective L.arrows.ι :=
  sorry

/-- **F3.** General `ObjectProperty` API, with no reference to arrows or lifting: a reflective
inclusion restricts to the objects of a property carried into itself by the reflector. Mathlib has
no such restriction lemma. -/
@[instance_reducible]
noncomputable def _root_.CategoryTheory.ObjectProperty.reflective_ιOfLE_inf
    {C : Type u} [Category.{v} C] {D E : ObjectProperty C}
    [D.IsClosedUnderIsomorphisms] [E.IsClosedUnderIsomorphisms] (adj : Reflective D.ι)
    (h : ∀ y : C, E y → E ((D.ι.obj (adj.L.obj y)))) :
    Reflective (ObjectProperty.ιOfLE (inf_le_right : D ⊓ E ≤ E)) :=
  sorry

/-- **F3.** The epimorphisms of any category have the of-precomp property relative to *every*
class, with no hypothesis. This is what discharges the hypothesis of the previous lemma. -/
instance epimorphisms_hasOfPrecompProperty (W : MorphismProperty C) :
    (epimorphisms C).HasOfPrecompProperty W :=
  sorry

/-- **F3.** For a quotient-like class `Q`, the arrows lying in both `R` and `Q` are reflective in,
and hence closed under the limits of, the `Q`-arrows. -/
theorem hasLimitsOfShape_arrows_inf (L R : MorphismProperty C) [IsOrthogonalPair L R]
    [HasFactorization L R] (Q : MorphismProperty C) [Q.RespectsIso]
    [Q.HasOfPrecompProperty L] (J : Type w) [Category.{w'} J]
    [HasLimitsOfShape J Q.arrows.FullSubcategory] :
    HasLimitsOfShape J (R ⊓ Q).arrows.FullSubcategory :=
  sorry

end MilestoneF

/-! ## Milestone G — Generation: codiagonals, presentability, and the small object argument -/

section MilestoneG

variable {C : Type u} [Category.{v} C]

/-- **G1.** The codiagonals of the generators, indexed by `I.toSet`. -/
noncomputable def codiagonalHomFamily [HasPushouts C] (I : MorphismProperty C) (i : I.toSet) :
    pushout (I.homFamily i) (I.homFamily i) ⟶ i.1.right :=
  pushout.codiagonal (I.homFamily i)

/-- **G1.** The class of codiagonals of `I`. -/
noncomputable def codiagonalGenerators [HasPushouts C] (I : MorphismProperty C) :
    MorphismProperty C :=
  ofHoms (codiagonalHomFamily I)

/-- **G1.** The generators augmented by their codiagonals. -/
noncomputable def orthogonalGenerators [HasPushouts C] (I : MorphismProperty C) :
    MorphismProperty C :=
  I ⊔ codiagonalGenerators I

/-- **G1.** Smallness is inherited, so the small object argument stays applicable. -/
instance orthogonalGenerators_isSmall [HasPushouts C] (I : MorphismProperty C) [I.IsSmall.{w}] :
    (orthogonalGenerators I).IsSmall.{w} :=
  sorry

/-- **G1. The headline of the milestone.** Unique right lifting against `I` is *ordinary* right
lifting against the augmented class. Immediate from B2 at each generator. -/
theorem rightOrthogonal_eq_rlp_orthogonalGenerators [HasPushouts C] (I : MorphismProperty C) :
    I.rightOrthogonal = (orthogonalGenerators I).rlp :=
  sorry

/-- **G2.** A pushout of a span of finitely presentable objects is finitely presentable. -/
theorem isFinitelyPresentable_pushout [LocallySmall.{w} C] {X Y Z : C} (f : X ⟶ Y) (g : X ⟶ Z)
    [HasPushout f g] (hX : IsFinitelyPresentable.{w} X) (hY : IsFinitelyPresentable.{w} Y)
    (hZ : IsFinitelyPresentable.{w} Z) :
    IsFinitelyPresentable.{w} (pushout f g) :=
  sorry

/-- **G2.** Presentable generator *sources* give the cardinal condition for the small object
argument. -/
theorem isCardinalForSmallObjectArgument_of_presentable_sources (I : MorphismProperty C)
    (κ : Cardinal.{w}) [Fact κ.IsRegular] [OrderBot κ.ord.ToType] [I.IsSmall.{w}]
    [LocallySmall.{w} C] [HasPushouts C] [HasCoproducts.{w} C] [HasIterationOfShape κ.ord.ToType C]
    (h : ∀ {A B : C} (i : A ⟶ B), I i → IsCardinalPresentable A κ) :
    IsCardinalForSmallObjectArgument I κ :=
  sorry

/-- **G2.** For the augmented class, presentability of **both** endpoints is required and
sufficient: the only new source is `B ⊔_A B`, a finite colimit on `A`, `B`, `B`.

Both hypotheses are stated in this `∀ {A B} (i : A ⟶ B), I i → …` form so that a concrete
generator family discharges them by `rintro` and nothing else. -/
theorem hasSmallObjectArgument_orthogonalGenerators (I : MorphismProperty C) (κ : Cardinal.{w})
    [Fact κ.IsRegular] [OrderBot κ.ord.ToType] [I.IsSmall.{w}] [LocallySmall.{w} C]
    [HasPushouts C] [HasCoproducts.{w} C] [HasIterationOfShape κ.ord.ToType C]
    (hsource : ∀ {A B : C} (i : A ⟶ B), I i → IsCardinalPresentable A κ)
    (htarget : ∀ {A B : C} (i : A ⟶ B), I i → IsCardinalPresentable B κ) :
    HasSmallObjectArgument.{w} (orthogonalGenerators I) :=
  sorry

/-- **G3.** The augmented generators lie in the left class: for `I` by reflexivity of the Galois
connection, for the codiagonals because each is a split epimorphism, so ordinary lifting against it
is automatically unique. -/
theorem orthogonalGenerators_le_leftOrthogonal_rightOrthogonal [HasPushouts C]
    (I : MorphismProperty C) :
    orthogonalGenerators I ≤ I.rightOrthogonal.leftOrthogonal :=
  sorry

/-- **G3.** The ordinary left class of the augmented generators **is** the unique left class.
Proved as an inequality of classes, by rewriting with Mathlib's cellular description and peeling
the four layers against D2 — never by a map-by-map argument on the output of the small object
argument. -/
theorem rlp_llp_orthogonalGenerators_eq_leftOrthogonal_rightOrthogonal [HasPushouts C]
    (I : MorphismProperty C) [HasSmallObjectArgument.{w} (orthogonalGenerators I)] :
    (orthogonalGenerators I).rlp.llp = I.rightOrthogonal.leftOrthogonal :=
  sorry

/-- **G3. The generated orthogonal factorization system.** -/
theorem generatedOrthogonalFactorizationSystem [HasPushouts C] (I : MorphismProperty C)
    [HasSmallObjectArgument.{w} (orthogonalGenerators I)] :
    IsOrthogonalFactorizationSystem I.rightOrthogonal.leftOrthogonal I.rightOrthogonal :=
  sorry

end MilestoneG

/-! ## Milestone H — The cellular description of the generated left class -/

section MilestoneH

variable {C : Type u} [Category.{v} C]

/-- **H1.** Transfinite compositions of pushouts of coproducts of `J`.

`J` is a **bare** class: for a generated orthogonal system one writes
`cellular (orthogonalGenerators I)` explicitly. Baking the augmentation in would make H4's
comparison `cellular (orthogonalGenerators I) = cellular I` unstatable. -/
@[pp_with_univ]
def cellular (J : MorphismProperty C) : MorphismProperty C :=
  transfiniteCompositions.{w} (coproducts.{w} J).pushouts

theorem le_cellular (J : MorphismProperty C) : J ≤ cellular.{w} J := sorry

theorem cellular_monotone : Monotone (cellular.{w} (C := C)) := sorry

instance cellular_respectsIso (J : MorphismProperty C) : (cellular.{w} J).RespectsIso := sorry

/-- **H2. The collapse criterion.** For an orthogonal pair `(L, R)`, any isomorphism-respecting
`K ≤ L` through which every morphism factors (with right factor in `R`) is already all of `L`.

Three steps: `f = i ≫ p` with `i ∈ K ≤ L`, so `p ∈ L` by **left cancellation** (D2); hence
`p ∈ L ⊓ R = isomorphisms` (D3); hence `f ∈ K`. The factorization hypothesis need not come from the
small object argument, so the criterion also shows that a class smaller than `cellular` exhausts
`L`. -/
theorem eq_of_hasFactorization_of_le {L R : MorphismProperty C} [IsOrthogonalPair L R]
    (K : MorphismProperty C) [K.RespectsIso] (hKL : K ≤ L)
    (h : ∀ {X Y : C} (f : X ⟶ Y), ∃ (Z : C) (i : X ⟶ Z) (p : Z ⟶ Y),
      i ≫ p = f ∧ K i ∧ R p) :
    K = L :=
  sorry

/-- **H3.** What Mathlib's description gives directly, with an outer `retracts`. -/
theorem leftOrthogonal_rightOrthogonal_eq_retracts_cellular [HasPushouts C]
    (I : MorphismProperty C) [HasSmallObjectArgument.{w} (orthogonalGenerators I)] :
    I.rightOrthogonal.leftOrthogonal = (cellular.{w} (orthogonalGenerators I)).retracts :=
  sorry

/-- **H3. The cellular description, without retracts.**

The improvement over `leftOrthogonal_rightOrthogonal_eq_retracts_cellular` comes from left
cancellation for the left class, which is false for `llp`. That failure is exactly why a
cofibrantly generated model category has cofibrations that are *retracts* of relative cell
complexes rather than relative cell complexes, and it is why this theorem has no `llp` analogue. -/
theorem leftOrthogonal_rightOrthogonal_eq_cellular [HasPushouts C] (I : MorphismProperty C)
    [HasSmallObjectArgument.{w} (orthogonalGenerators I)] :
    I.rightOrthogonal.leftOrthogonal = cellular.{w} (orthogonalGenerators I) :=
  sorry

/-- **H3.** The unaugmented cellular class lies in the left class, with no small object argument
and no hypothesis on `I`: the bare four-layer peel against D2. -/
theorem cellular_le_leftOrthogonal_rightOrthogonal (I : MorphismProperty C) :
    cellular.{w} I ≤ I.rightOrthogonal.leftOrthogonal :=
  sorry

/-- **H4.** For a family of epimorphisms, unique right lifting is ordinary right lifting, by
`HasAtMostOneLiftingProperty.of_epi`. -/
theorem rightOrthogonal_eq_rlp_of_epi (I : MorphismProperty C) (hI : I ≤ epimorphisms C) :
    I.rightOrthogonal = I.rlp :=
  sorry

/-- **H4. The cellular description with no codiagonals.** For a family of epimorphisms the left
class is the cellular class of the **unaugmented** generators. This needs neither `HasPushouts C`
nor a small object argument on the augmented class: the augmentation is never formed. -/
theorem leftOrthogonal_rightOrthogonal_eq_cellular_of_epi (I : MorphismProperty C)
    (hI : I ≤ epimorphisms C) [HasSmallObjectArgument.{w} I] :
    I.rightOrthogonal.leftOrthogonal = cellular.{w} I :=
  sorry

/-- **H5.** A codiagonal is always a split epimorphism — no hypothesis on `I` at all. -/
theorem codiagonalGenerators_le_epimorphisms [HasPushouts C] (I : MorphismProperty C) :
    codiagonalGenerators I ≤ epimorphisms C :=
  sorry

/-- **H5.** The augmentation changes neither orthogonal class, so running it twice changes
nothing. -/
theorem orthogonalGenerators_rightOrthogonal [HasPushouts C] (I : MorphismProperty C) :
    (orthogonalGenerators I).rightOrthogonal = I.rightOrthogonal :=
  sorry

/-- **H5. The left class generated by a family of epimorphisms consists of epimorphisms.** This
turns one computation at the generators into a property of every map of the left class, and in
particular of the unit of the reflection of Milestone F. -/
theorem leftOrthogonal_rightOrthogonal_le_epimorphisms [HasPushouts C] (I : MorphismProperty C)
    [HasSmallObjectArgument.{w} (orthogonalGenerators I)] (hI : I ≤ epimorphisms C) :
    I.rightOrthogonal.leftOrthogonal ≤ epimorphisms C :=
  sorry

end MilestoneH

/-! ## Milestone I — Filtered colimits in the right class -/

section MilestoneI

variable {C : Type u} [Category.{v} C]

/-- **I2.** The right class of a generated system is stable under `κ`-filtered colimits when the
generators have `κ`-presentable endpoints.

Both endpoint hypotheses are genuinely used, in both halves of the proof, and they are in exactly
the form G2 already asks a concrete generator family to discharge — so a consumer supplies them
once and gets the small object argument and this stability together. -/
theorem rightOrthogonal_isStableUnderColimitsOfShape_of_presentable (κ : Cardinal.{w})
    [Fact κ.IsRegular] [LocallySmall.{w} C] (I : MorphismProperty C)
    (J : Type u') [Category.{v'} J] [EssentiallySmall.{w} J] [IsCardinalFiltered J κ]
    (hsource : ∀ {A B : C} (i : A ⟶ B), I i → IsCardinalPresentable A κ)
    (htarget : ∀ {A B : C} (i : A ⟶ B), I i → IsCardinalPresentable B κ) :
    I.rightOrthogonal.IsStableUnderColimitsOfShape J :=
  sorry

end MilestoneI

/-! ## Milestone J — Local objects -/

section MilestoneJ

variable {C : Type u} [Category.{v} C] [HasTerminal C]

/-- **J1.** The objects whose terminal map lies in `R`: the object-level shadow of a factorization
system, and exactly the objects its reflection lands in. -/
def localObjects (R : MorphismProperty C) : ObjectProperty C := fun A ↦ R (terminal.from A)

instance localObjects_isStableUnderRetracts (R : MorphismProperty C) [R.IsStableUnderRetracts] :
    (localObjects R).IsStableUnderRetracts :=
  sorry

/-- **J1.** Limits of local objects are local. Nothing here is special to a right orthogonal class:
the diagram of terminal maps lies over the constant diagram at `⊤_ C`, whose limit is again
`⊤_ C`. -/
theorem localObjects_of_isLimit (R : MorphismProperty C) {J : Type w} [Category.{w'} J]
    [R.IsStableUnderLimitsOfShape J] {F : J ⥤ C} (c : Cone F) (hc : IsLimit c)
    (hF : ∀ j, localObjects R (F.obj j)) :
    localObjects R c.pt :=
  sorry

/-- **J1.** Colimits over a **connected** shape, in particular filtered colimits, of local objects
are local. -/
theorem localObjects_of_isColimit (R : MorphismProperty C) {J : Type w} [Category.{w'} J]
    [IsConnected J] [R.IsStableUnderColimitsOfShape J] {F : J ⥤ C} (c : Cocone F)
    (hc : IsColimit c) (hF : ∀ j, localObjects R (F.obj j)) :
    localObjects R c.pt :=
  sorry

/-- **J2. The projective-source mechanism.** A quotient of a local object is local, as soon as each
generator source factors along the epimorphism at hand.

Projectivity is taken **relative to `f`**, not absolutely: `CategoryTheory.Projective` is
projectivity against all epimorphisms and is too strong in the categories this is applied in, where
the epimorphisms strictly exceed the surjections. -/
theorem localObjects_rlp_of_epi_of_liftsAlong (I : MorphismProperty C) {A Q : C} (f : A ⟶ Q)
    [Epi f] (hA : localObjects I.rlp A)
    (hlift : ∀ {X Y : C} (i : X ⟶ Y), I i → ∀ u : X ⟶ Q, ∃ v : X ⟶ A, v ≫ f = u) :
    localObjects I.rlp Q :=
  sorry

/-- **J2.** Passing from `I.rlp` to `I.rightOrthogonal` costs `I ≤ epimorphisms C`, through H4. The
hypothesis is unavoidable: uniqueness of a lift over the quotient cannot be pulled back, since that
would need the generator *target* to be projective. -/
theorem localObjects_of_epi_of_projectiveSource (I : MorphismProperty C)
    (hI : I ≤ epimorphisms C) {A Q : C} (f : A ⟶ Q) [Epi f]
    (hA : localObjects I.rightOrthogonal A)
    (hlift : ∀ {X Y : C} (i : X ⟶ Y), I i → ∀ u : X ⟶ Q, ∃ v : X ⟶ A, v ≫ f = u) :
    localObjects I.rightOrthogonal Q :=
  sorry

/-- **J3. Summand selection**, first half: a map out of a local object with the left lifting
property against `R` is a split monomorphism. -/
theorem isSplitMono_of_hasLiftingProperty_terminal (R : MorphismProperty C) {A P : C} (s : A ⟶ P)
    (hA : localObjects R A) (hs : R.llp s) :
    IsSplitMono s :=
  sorry

/-- **J3.** Second half: if such a map is moreover an epimorphism it is an isomorphism, so its
target — and every retract of its target — is local. -/
theorem localObjects_of_llp_of_epi (R : MorphismProperty C) [R.RespectsIso] {A P : C} (s : A ⟶ P)
    [Epi s] (hA : localObjects R A) (hs : R.llp s) :
    localObjects R P :=
  sorry

end MilestoneJ

end MorphismProperty

end CategoryTheory

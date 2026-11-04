module

public import Mathlib

/-!
# Grothendieck topoi: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need, all with real bodies on
native carriers. The API around each target, the special cases and the Checks stay in the README.
The proof obligations of the category of geometric morphisms and of the canonical topology of a
frame are proved, since the headlines use both.

Three design choices are fixed here. `IsGrothendieckTopos` is a `Prop`: the site is not data.
A geometric morphism is named after its direct image, so `GeometricMorphism E F` has
`direct : E ⥤ F`. A 2-cell `f ⟶ g` is a natural transformation `f.direct ⟶ g.direct` (SGA 4
IV 3.2), the direction of Mathlib's `GrothendieckTopology.Point.Hom`.

Headlines stated here (README target, Lean name):

* 1.1, `IsGrothendieckTopos`.
* 1.2, `IsGrothendieckTopos.hasLimits`, `IsGrothendieckTopos.hasColimits`,
  `IsGrothendieckTopos.hasSubobjectClassifier`, `IsGrothendieckTopos.wellPowered`,
  `IsGrothendieckTopos.wellPowered_op`.
* 1.4, `isGrothendieckTopos_iff_giraudAxioms` (Giraud's theorem, on `GiraudAxioms` and
  `IsInternalEquivalenceRel`).
* 2.1, `GeometricMorphism` with `GeometricMorphism.id`, `GeometricMorphism.comp`,
  `GeometricMorphism.ofEquiv`, and the existence criterion
  `GeometricMorphism.exists_iff_preservesFiniteLimits_preservesColimits`.
* 2.2, the category of 2-cells (`GeometricMorphism.Hom`, `GeometricMorphism.homEquivInverse`).
* 2.3, `IsGrothendieckTopos.nonempty_geometricMorphism_type` and
  `GeometricMorphism.nonempty_unique_hom_to_type`.
* 2.4, `GeometricMorphism.ofContinuous` and `GeometricMorphism.exists_of_isCocontinuous`.
* 2.5, `nonempty_geometricMorphism_equiv_isFiltering` (Diaconescu's theorem, on `IsFiltering`).
* 3.1, `IsGrothendieckTopos.over` and `nonempty_sheafOverEquiv`.
* 3.2, `IsGrothendieckTopos.exists_etale`.
* 4.1, `Subtopos` and `GeometricMorphism.IsEmbedding`.
* 4.2, `exists_universalClosureOperator_equiv_subtopos` (on `UniversalClosureOperator` and
  `UniversalClosureOperator.IsSheaf`).
* 4.5, `GeometricMorphism.exists_surjection_embedding` (on `GeometricMorphism.IsSurjection`).
* 5.1, 5.4, `GeometricMorphism.IsConnected`, `GeometricMorphism.IsHyperconnected`,
  `GeometricMorphism.IsLocalic`.
* 5.5, `GeometricMorphism.exists_hyperconnected_localic`.
* 6.1, `nonempty_point_equivalence`.
* 6.2, `hasEnoughPoints_sheaf_iff` (on `HasEnoughPoints`).
* 6.4, `hasEnoughPoints_coherentTopology` (Deligne's theorem).
* 7.1, `Frame.grothendieckTopology`.
* 7.2, `GeometricMorphism.isLocalic_iff_nonempty_equiv_sheaf`.
* 7.4, `exists_sublocale_orderIso_subtopos`.
* 8.2, `IsFrameCoproduct`.
* 8.3, `CompleteLattice.WayBelow`, `CoreCompactSpace`, `LocallyCompactSpace.coreCompactSpace`.
* 8.4, `quasiSober_pi`, `quasiSober_prod`.
* 8.5, `isFrameCoproduct_opens_prod`, `not_isFrameCoproduct_opens_rat_prod`.

Not statable at the pins, with the carrier each lacks:

* 1.3, power objects: no predicate "`P` is a power object of `X`" is declared at the pins.
* 4.4, gluing: it lacks the open and closed inclusions of a subterminal object as geometric
  morphisms (3.3, 4.3), in terms of which the comparison of `E` with the glued topos is stated.
* 5.2, locally connected sites: they lack the class `IsLocallyConnectedSite` with its `π₀`.
* 6.3, change of site and coherent topoi: they lack AdicSpacesPartII's quasicompact and
  quasiseparated objects and algebraic topoi (R0.19.10), which are not declared at the pins.
* 8.1, fibre products of topoi: they lack the iso-comma (pseudo-pullback) of the categories of
  geometric morphisms and its universal property.
* 8.5, the topos-level form `Sh(S × T) ≃ Sh(S) × Sh(T)`: it lacks the product of topoi, the
  fibre product of 8.1 over `Type u`; the frame-level form is stated.

The constructions with no headline of their own (the bicategory of 2.2, the global sections
morphism of 2.3, the étale morphism of 3.2, the frame of subobjects of 1.2) are targets of the
README; the theorems above state their existence and universal properties without building them.
-/

@[expose] public section

universe u v₁ v₂ v₃ u₁ u₂ u₃

open CategoryTheory CategoryTheory.Limits

namespace TauCetiRoadmap.GrothendieckTopoi

/-! ## Layer 1: Grothendieck topoi and Giraud's theorem -/

/-- **Layer 1.1.** `E` is a Grothendieck topos: it is equivalent to the category of sheaves of
`u`-small types on some small site. The site is not part of the data. -/
def IsGrothendieckTopos (E : Type (u + 1)) [Category.{u} E] : Prop :=
  ∃ (C : Type u) (_ : SmallCategory C) (J : GrothendieckTopology C),
    Nonempty (E ≌ Sheaf J (Type u))

section Structure

variable {E : Type (u + 1)} [Category.{u} E]

/-- **Layer 1.2.** A Grothendieck topos has all `u`-small limits. -/
theorem IsGrothendieckTopos.hasLimits (hE : IsGrothendieckTopos E) : HasLimits E := sorry

/-- **Layer 1.2.** A Grothendieck topos has all `u`-small colimits. -/
theorem IsGrothendieckTopos.hasColimits (hE : IsGrothendieckTopos E) : HasColimits E := sorry

/-- **Layer 1.2.** A Grothendieck topos has a subobject classifier. -/
theorem IsGrothendieckTopos.hasSubobjectClassifier (hE : IsGrothendieckTopos E) :
    HasSubobjectClassifier E :=
  sorry

/-- **Layer 1.2.** A Grothendieck topos is well-powered: each object has a `u`-small set of
subobjects. -/
theorem IsGrothendieckTopos.wellPowered (hE : IsGrothendieckTopos E) : WellPowered.{u} E :=
  sorry

/-- **Layer 1.2.** A Grothendieck topos is well-copowered: a quotient of `X` is determined by its
kernel pair, a subobject of `X ⨯ X`. -/
theorem IsGrothendieckTopos.wellPowered_op (hE : IsGrothendieckTopos E) : WellPowered.{u} Eᵒᵖ :=
  sorry

end Structure

/-- **Layer 1.4.** `p₁ p₂ : R ⟶ X` is an internal equivalence relation: jointly monic, and
inducing an equivalence relation on `T ⟶ X` for every `T`. -/
structure IsInternalEquivalenceRel {E : Type u₁} [Category.{v₁} E] {R X : E}
    (p₁ p₂ : R ⟶ X) : Prop where
  /-- `p₁` and `p₂` are jointly monomorphic. -/
  jointly_mono : ∀ {T : E} (a b : T ⟶ R), a ≫ p₁ = b ≫ p₁ → a ≫ p₂ = b ≫ p₂ → a = b
  /-- The relation induced on `T ⟶ X` is an equivalence relation. -/
  equivalence : ∀ T : E,
    _root_.Equivalence (fun x y : T ⟶ X => ∃ r : T ⟶ R, r ≫ p₁ = x ∧ r ≫ p₂ = y)

/-- **Layer 1.4.** Giraud's axioms for a locally `u`-small category. -/
structure GiraudAxioms (E : Type (u + 1)) [Category.{u} E] : Prop where
  /-- Finite limits exist. -/
  hasFiniteLimits : HasFiniteLimits E
  /-- `u`-small coproducts exist. -/
  hasCoproducts : HasCoproducts.{u} E
  /-- `u`-small coproducts are disjoint. -/
  coproductDisjoint : ∀ {ι : Type u} (X : ι → E), CoproductDisjoint X
  /-- `u`-small coproducts are universal. -/
  coproduct_isUniversal : ∀ {ι : Type u} (X : ι → E) (c : Cofan X), IsColimit c →
    IsUniversalColimit c
  /-- Internal equivalence relations have universal coequalizers and are effective. -/
  effective : ∀ {R X : E} (p₁ p₂ : R ⟶ X), IsInternalEquivalenceRel p₁ p₂ →
    ∃ (Q : E) (q : X ⟶ Q) (w : p₁ ≫ q = p₂ ≫ q),
      Nonempty (IsColimit (Cofork.ofπ q w)) ∧ IsUniversalColimit (Cofork.ofπ q w) ∧
        IsPullback p₁ p₂ q q
  /-- There is a `u`-small separating family. -/
  separating : ∃ P : ObjectProperty E, ObjectProperty.Small.{u} P ∧ P.IsSeparating

/-- **Layer 1.4. Giraud's theorem** (SGA 4 IV 1.2; Elephant C2.2.8; Mac Lane–Moerdijk,
Appendix). -/
theorem isGrothendieckTopos_iff_giraudAxioms (E : Type (u + 1)) [Category.{u} E] :
    IsGrothendieckTopos E ↔ GiraudAxioms E :=
  sorry

/-! ## Layer 2: geometric morphisms and the 2-category of topoi -/

/-- **Layer 2.1.** A geometric morphism `E → F`: an adjunction `f^* ⊣ f_*` with `f_* : E ⥤ F`
and left exact inverse image. -/
structure GeometricMorphism (E : Type u₁) [Category.{v₁} E] (F : Type u₂) [Category.{v₂} F] where
  /-- The direct image `f_*`. -/
  direct : E ⥤ F
  /-- The inverse image `f^*`. -/
  inverse : F ⥤ E
  /-- The adjunction `f^* ⊣ f_*`. -/
  adj : inverse ⊣ direct
  /-- The inverse image preserves finite limits. -/
  preservesFiniteLimits_inverse : PreservesFiniteLimits inverse

namespace GeometricMorphism

attribute [instance] preservesFiniteLimits_inverse

variable {E : Type u₁} [Category.{v₁} E] {F : Type u₂} [Category.{v₂} F]
  {G : Type u₃} [Category.{v₃} G]

/-- **Layer 2.1.** The identity geometric morphism. -/
def id (E : Type u₁) [Category.{v₁} E] : GeometricMorphism E E where
  direct := 𝟭 E
  inverse := 𝟭 E
  adj := Adjunction.id
  preservesFiniteLimits_inverse := inferInstance

/-- **Layer 2.1.** Composition: direct images compose in the order of the morphisms. -/
def comp (f : GeometricMorphism E F) (g : GeometricMorphism F G) : GeometricMorphism E G where
  direct := f.direct ⋙ g.direct
  inverse := g.inverse ⋙ f.inverse
  adj := g.adj.comp f.adj
  preservesFiniteLimits_inverse := inferInstance

/-- **Layer 2.1.** The geometric morphism of an equivalence, with direct image `e.functor`. -/
def ofEquiv (e : E ≌ F) : GeometricMorphism E F where
  direct := e.functor
  inverse := e.inverse
  adj := e.symm.toAdjunction
  preservesFiniteLimits_inverse := inferInstance

/-- **Layer 2.2.** A 2-cell `f ⟶ g` is a natural transformation between direct images (SGA 4
IV 3.2). -/
@[ext]
structure Hom (f g : GeometricMorphism E F) where
  /-- The natural transformation of direct images. -/
  hom : f.direct ⟶ g.direct

/-- **Layer 2.2.** Geometric morphisms `E → F` and their 2-cells form a category. -/
instance : Category (GeometricMorphism E F) where
  Hom := Hom
  id f := ⟨𝟙 f.direct⟩
  comp α β := ⟨α.hom ≫ β.hom⟩
  id_comp _ := Hom.ext (Category.id_comp _)
  comp_id _ := Hom.ext (Category.comp_id _)
  assoc _ _ _ := Hom.ext (Category.assoc _ _ _)

/-- **Layer 2.2.** The same 2-cell, read on inverse images: the conjugate goes the other way. -/
noncomputable def homEquivInverse (f g : GeometricMorphism E F) :
    (f.direct ⟶ g.direct) ≃ (g.inverse ⟶ f.inverse) :=
  (conjugateEquiv f.adj g.adj).symm

end GeometricMorphism

/-- **Layer 2.1. Existence criterion.** Between Grothendieck topoi, a functor `F ⥤ E` is the
inverse image of a geometric morphism `E → F` if and only if it preserves finite limits and
`u`-small colimits. -/
theorem GeometricMorphism.exists_iff_preservesFiniteLimits_preservesColimits
    {E F : Type (u + 1)} [Category.{u} E] [Category.{u} F] (hE : IsGrothendieckTopos E)
    (hF : IsGrothendieckTopos F) (Φ : F ⥤ E) :
    (∃ f : GeometricMorphism E F, Nonempty (f.inverse ≅ Φ)) ↔
      PreservesFiniteLimits Φ ∧ PreservesColimitsOfSize.{u, u} Φ :=
  sorry

section Global

variable {E : Type (u + 1)} [Category.{u} E]

/-- **Layer 2.3.** Every Grothendieck topos has a geometric morphism to `Type u`. -/
theorem IsGrothendieckTopos.nonempty_geometricMorphism_type (hE : IsGrothendieckTopos E) :
    Nonempty (GeometricMorphism E (Type u)) :=
  sorry

/-- **Layer 2.3.** Any two geometric morphisms to `Type u` are isomorphic by a unique 2-cell. -/
theorem GeometricMorphism.nonempty_unique_hom_to_type (hE : IsGrothendieckTopos E)
    (f g : GeometricMorphism E (Type u)) : Nonempty (Unique (f ⟶ g)) :=
  sorry

end Global

section Sites

variable {C D : Type u} [SmallCategory C] [SmallCategory D]
  {J : GrothendieckTopology C} {K : GrothendieckTopology D}

/-- **Layer 2.4.** The geometric morphism of a continuous, representably flat functor of small
sites (SGA 4 IV 4.9). -/
noncomputable def GeometricMorphism.ofContinuous (G : C ⥤ D) [G.IsContinuous J K]
    [RepresentablyFlat G] :
    GeometricMorphism (Sheaf K (Type u)) (Sheaf J (Type u)) where
  direct := G.sheafPushforwardContinuous (Type u) J K
  inverse := G.sheafPullback (Type u) J K
  adj := G.sheafAdjunctionContinuous (Type u) J K
  preservesFiniteLimits_inverse :=
    Functor.SmallCategories.instPreservesFiniteLimitsSheafSheafPullbackOfRepresentablyFlat
      G (Type u) J K

/-- **Layer 2.4.** A cocontinuous functor of small sites gives a geometric morphism whose direct
image is `G.sheafPushforwardCocontinuous` (SGA 4 III 2.3). -/
theorem GeometricMorphism.exists_of_isCocontinuous (G : C ⥤ D) [G.IsCocontinuous J K]
    [∀ (F : Cᵒᵖ ⥤ Type u), G.op.HasPointwiseRightKanExtension F] :
    ∃ f : GeometricMorphism (Sheaf J (Type u)) (Sheaf K (Type u)),
      Nonempty (f.direct ≅ G.sheafPushforwardCocontinuous (Type u) J K) :=
  sorry

end Sites

section Diaconescu

variable {C : Type u} [SmallCategory C] (J : GrothendieckTopology C)
  {E : Type (u + 1)} [Category.{u} E] [HasFiniteLimits E]

/-- **Layer 2.5.** `A : C ⥤ E` is `J`-filtering: four families of maps are jointly epimorphic,
each written as "two maps out of the target that agree after every member are equal". -/
structure IsFiltering (A : C ⥤ E) : Prop where
  /-- The maps `A c ⟶ ⊤_ E` are jointly epimorphic. -/
  terminal : ∀ (Z : E) (a b : ⊤_ E ⟶ Z),
    (∀ c : C, terminal.from (A.obj c) ≫ a = terminal.from (A.obj c) ≫ b) → a = b
  /-- The maps `A e ⟶ A c ⨯ A d` induced by spans `c ← e → d` are jointly epimorphic. -/
  prod : ∀ (c d : C) (Z : E) (a b : A.obj c ⨯ A.obj d ⟶ Z),
    (∀ (e : C) (x : e ⟶ c) (y : e ⟶ d),
      prod.lift (A.map x) (A.map y) ≫ a = prod.lift (A.map x) (A.map y) ≫ b) → a = b
  /-- For `s t : c ⟶ d`, the maps `A e ⟶ equalizer (A.map s) (A.map t)` induced by the
  `w : e ⟶ c` with `w ≫ s = w ≫ t` are jointly epimorphic. -/
  equalizer : ∀ (c d : C) (s t : c ⟶ d) (Z : E) (a b : equalizer (A.map s) (A.map t) ⟶ Z),
    (∀ (e : C) (w : e ⟶ c) (h : w ≫ s = w ≫ t),
      equalizer.lift (A.map w) (by rw [← A.map_comp, ← A.map_comp, h]) ≫ a =
        equalizer.lift (A.map w) (by rw [← A.map_comp, ← A.map_comp, h]) ≫ b) → a = b
  /-- For a covering sieve `S` on `c`, the maps `A.map f`, `f ∈ S`, are jointly epimorphic. -/
  covering : ∀ (c : C) (S : Sieve c), S ∈ J c → ∀ (Z : E) (a b : A.obj c ⟶ Z),
    (∀ (d : C) (f : d ⟶ c), S.arrows f → A.map f ≫ a = A.map f ≫ b) → a = b

/-- **Layer 2.5. Diaconescu's theorem** (Mac Lane–Moerdijk VII.7–VII.9; Elephant
C2.3): geometric morphisms `E → Sh(C, J)` are the `J`-filtering functors `C ⥤ E`,
contravariantly on 2-cells. -/
theorem nonempty_geometricMorphism_equiv_isFiltering (hE : IsGrothendieckTopos E) :
    Nonempty (GeometricMorphism E (Sheaf J (Type u)) ≌
      (ObjectProperty.FullSubcategory (IsFiltering J (E := E)))ᵒᵖ) :=
  sorry

end Diaconescu

/-! ## Layer 3: induced topoi and étale morphisms -/

/-- **Layer 3.1.** A slice of a Grothendieck topos is a Grothendieck topos. -/
theorem IsGrothendieckTopos.over {E : Type (u + 1)} [Category.{u} E]
    (hE : IsGrothendieckTopos E) (X : E) : IsGrothendieckTopos (Over X) :=
  sorry

/-- **Layer 3.1.** Sheaves on `J.over c` are the slice over the sheafified representable of
`c` (SGA 4 III §5). -/
theorem nonempty_sheafOverEquiv {C : Type u} [SmallCategory C] (J : GrothendieckTopology C)
    (c : C) :
    Nonempty (Sheaf (J.over c) (Type u) ≌ Over ((presheafToSheaf J (Type u)).obj (yoneda.obj c))) :=
  sorry

/-- **Layer 3.2.** The étale geometric morphism `E/X → E`, with inverse image `Over.star X`. -/
theorem IsGrothendieckTopos.exists_etale {E : Type (u + 1)} [Category.{u} E]
    [HasBinaryProducts E] (hE : IsGrothendieckTopos E) (X : E) :
    ∃ f : GeometricMorphism (Over X) E, Nonempty (f.inverse ≅ Over.star X) :=
  sorry

/-! ## Layer 4: subtopoi -/

/-- **Layer 4.1.** A subtopos: a replete full subcategory whose inclusion has a left exact left
adjoint. -/
structure Subtopos (E : Type u₁) [Category.{v₁} E] where
  /-- The objects of the subtopos. -/
  P : ObjectProperty E
  /-- The subtopos is replete. -/
  isClosedUnderIsomorphisms : P.IsClosedUnderIsomorphisms
  /-- The inclusion has a left adjoint preserving finite limits. -/
  exists_reflector : ∃ (L : E ⥤ P.FullSubcategory) (_ : L ⊣ P.ι), PreservesFiniteLimits L

/-- **Layer 4.1.** `f` is an embedding: its direct image is fully faithful. -/
def GeometricMorphism.IsEmbedding {E : Type u₁} [Category.{v₁} E] {F : Type u₂}
    [Category.{v₂} F] (f : GeometricMorphism E F) : Prop :=
  f.direct.Full ∧ f.direct.Faithful

/-- **Layer 4.2.** A universal closure operator: a closure operator on each `Subobject X`,
stable under pullback. -/
structure UniversalClosureOperator (E : Type u₁) [Category.{v₁} E] [HasPullbacks E] where
  /-- The closure operator on the subobjects of `X`. -/
  cl : ∀ X : E, ClosureOperator (Subobject X)
  /-- Closure commutes with pullback. -/
  pullback_cl : ∀ {X Y : E} (f : Y ⟶ X) (A : Subobject X),
    (Subobject.pullback f).obj (cl X A) = cl Y ((Subobject.pullback f).obj A)

/-- **Layer 4.2.** `F` is a sheaf for `c`: maps into `F` extend uniquely along `c`-dense
monomorphisms. -/
def UniversalClosureOperator.IsSheaf {E : Type u₁} [Category.{v₁} E] [HasPullbacks E]
    (c : UniversalClosureOperator E) (F : E) : Prop :=
  ∀ {B : E} (A : Subobject B), c.cl B A = ⊤ →
    Function.Bijective (fun g : B ⟶ F => A.arrow ≫ g)

/-- **Layer 4.2.** Universal closure operators and subtopoi correspond, by taking sheaves, and
the correspondence reverses the order (Elephant A4.3–A4.4). -/
theorem exists_universalClosureOperator_equiv_subtopos {E : Type (u + 1)} [Category.{u} E]
    [HasPullbacks E] (hE : IsGrothendieckTopos E) :
    ∃ e : UniversalClosureOperator E ≃ Subtopos E, (∀ c, (e c).P = c.IsSheaf) ∧
      ∀ c c', (∀ (X : E) (A : Subobject X), c.cl X A ≤ c'.cl X A) ↔ (e c').P ≤ (e c).P :=
  sorry

/-- **Layer 4.5.** `f` is a surjection: its inverse image is faithful. -/
def GeometricMorphism.IsSurjection {E : Type u₁} [Category.{v₁} E] {F : Type u₂}
    [Category.{v₂} F] (f : GeometricMorphism E F) : Prop :=
  f.inverse.Faithful

/-- **Layer 4.5.** Every geometric morphism factors as a surjection followed by an embedding. -/
theorem GeometricMorphism.exists_surjection_embedding {E F : Type (u + 1)} [Category.{u} E]
    [Category.{u} F] (hE : IsGrothendieckTopos E) (hF : IsGrothendieckTopos F)
    (f : GeometricMorphism E F) :
    ∃ (M : Type (u + 1)) (_ : Category.{u} M) (s : GeometricMorphism E M)
      (i : GeometricMorphism M F), IsGrothendieckTopos M ∧ s.IsSurjection ∧ i.IsEmbedding ∧
        Nonempty (s.comp i ≅ f) :=
  sorry

/-! ## Layer 5: classes of geometric morphisms -/

namespace GeometricMorphism

variable {E : Type u₁} [Category.{v₁} E] {F : Type u₂} [Category.{v₂} F]

/-- **Layer 5.1.** `f` is connected: its inverse image is fully faithful. -/
def IsConnected (f : GeometricMorphism E F) : Prop := f.inverse.Full ∧ f.inverse.Faithful

/-- **Layer 5.4.** `f` is hyperconnected: connected, with essential image of `f^*` closed under
subobjects. -/
def IsHyperconnected (f : GeometricMorphism E F) : Prop :=
  f.IsConnected ∧ ∀ (X : F) {A : E} (m : A ⟶ f.inverse.obj X), Mono m →
    ∃ Y : F, Nonempty (A ≅ f.inverse.obj Y)

/-- **Layer 5.4.** `f` is localic: every object of `E` is a quotient of a subobject of some
`f^* X`. -/
def IsLocalic (f : GeometricMorphism E F) : Prop :=
  ∀ A : E, ∃ (X : F) (B : E) (m : B ⟶ f.inverse.obj X) (e : B ⟶ A), Mono m ∧ Epi e

end GeometricMorphism

/-- **Layer 5.5.** Every geometric morphism factors as a hyperconnected morphism followed by a
localic one (Elephant A4.6.5). -/
theorem GeometricMorphism.exists_hyperconnected_localic {E F : Type (u + 1)} [Category.{u} E]
    [Category.{u} F] (hE : IsGrothendieckTopos E) (hF : IsGrothendieckTopos F)
    (f : GeometricMorphism E F) :
    ∃ (M : Type (u + 1)) (_ : Category.{u} M) (h : GeometricMorphism E M)
      (l : GeometricMorphism M F), IsGrothendieckTopos M ∧ h.IsHyperconnected ∧ l.IsLocalic ∧
        Nonempty (h.comp l ≅ f) :=
  sorry

/-! ## Layer 6: points, fibre functors and coherent topoi -/

/-- **Layer 6.1.** Points of a site are the points of its topos, covariantly (SGA 4 IV 6.3). -/
theorem nonempty_point_equivalence {C : Type u} [SmallCategory C] (J : GrothendieckTopology C) :
    Nonempty (GrothendieckTopology.Point.{u} J ≌ GeometricMorphism (Type u) (Sheaf J (Type u))) :=
  sorry

/-- **Layer 6.2.** `E` has enough points: the inverse images of a `u`-small family of points
jointly reflect isomorphisms. -/
def HasEnoughPoints (E : Type (u + 1)) [Category.{u} E] : Prop :=
  ∃ (ι : Type u) (p : ι → GeometricMorphism (Type u) E),
    ∀ {A B : E} (φ : A ⟶ B), (∀ i, IsIso ((p i).inverse.map φ)) → IsIso φ

/-- **Layer 6.2.** The topos-level and site-level notions of enough points agree. -/
theorem hasEnoughPoints_sheaf_iff {C : Type u} [SmallCategory C] (J : GrothendieckTopology C) :
    HasEnoughPoints (Sheaf J (Type u)) ↔ GrothendieckTopology.HasEnoughPoints.{u} J :=
  sorry

/-- **Layer 6.4. Deligne's theorem** for the coherent topology (SGA 4 VI 9.0). -/
theorem hasEnoughPoints_coherentTopology (C : Type u) [SmallCategory C] [Precoherent C]
    [HasPullbacks C] : GrothendieckTopology.HasEnoughPoints.{u} (coherentTopology C) :=
  sorry

/-! ## Layer 7: locales and localic topoi -/

/-- **Layer 7.1.** The canonical site of a frame: a sieve on `U` covers when its members have
supremum `U`. -/
def Frame.grothendieckTopology (L : Type u) [Order.Frame L] : GrothendieckTopology L where
  sieves U := {S | sSup {V | ∃ h : V ≤ U, S.arrows (homOfLE h)} = U}
  top_mem' U := le_antisymm (sSup_le fun _ ⟨h, _⟩ => h) (le_sSup ⟨le_rfl, trivial⟩)
  pullback_stable' := by
    intro U W S f hS
    change sSup {V | ∃ h : V ≤ U, S.arrows (homOfLE h)} = U at hS
    change sSup {V | ∃ h : V ≤ W, S.arrows (homOfLE h ≫ f)} = W
    refine le_antisymm (sSup_le fun _ ⟨h, _⟩ => h) ?_
    calc W = W ⊓ sSup {V | ∃ h : V ≤ U, S.arrows (homOfLE h)} := by
          rw [hS, inf_eq_left.2 (leOfHom f)]
      _ = ⨆ V ∈ {V | ∃ h : V ≤ U, S.arrows (homOfLE h)}, W ⊓ V := inf_sSup_eq
      _ ≤ _ := by
        refine iSup₂_le fun V hV' => ?_
        obtain ⟨hV, hSV⟩ := hV'
        refine le_sSup ⟨inf_le_left, ?_⟩
        have h := S.downward_closed hSV (homOfLE (inf_le_right : W ⊓ V ≤ V))
        rwa [Subsingleton.elim (homOfLE inf_le_right ≫ homOfLE hV) (homOfLE inf_le_left ≫ f)] at h
  transitive' := by
    intro U S hS R hR
    change sSup {V | ∃ h : V ≤ U, S.arrows (homOfLE h)} = U at hS
    change sSup {V | ∃ h : V ≤ U, R.arrows (homOfLE h)} = U
    refine le_antisymm (sSup_le fun _ ⟨h, _⟩ => h) ?_
    calc U = sSup {V | ∃ h : V ≤ U, S.arrows (homOfLE h)} := hS.symm
      _ ≤ _ := sSup_le fun V ⟨hV, hSV⟩ => by
        have hRV : sSup {W | ∃ h : W ≤ V, R.arrows (homOfLE h ≫ homOfLE hV)} = V :=
          hR hSV
        calc V = _ := hRV.symm
          _ ≤ _ := by
            refine sSup_le fun W hW' => ?_
            obtain ⟨hW, hRW⟩ := hW'
            refine le_sSup ⟨hW.trans hV, ?_⟩
            rwa [Subsingleton.elim (homOfLE hW ≫ homOfLE hV) (homOfLE (hW.trans hV))] at hRW

/-- **Layer 7.2.** A Grothendieck topos is localic (its global sections morphism is localic)
exactly when it is the topos of sheaves on a frame (Elephant A4.6.2, C1.4; Mac Lane–Moerdijk
IX.5). -/
theorem GeometricMorphism.isLocalic_iff_nonempty_equiv_sheaf {E : Type (u + 1)} [Category.{u} E]
    (hE : IsGrothendieckTopos E) (f : GeometricMorphism E (Type u)) :
    f.IsLocalic ↔ ∃ (L : Type u) (_ : Order.Frame L),
      Nonempty (E ≌ Sheaf (Frame.grothendieckTopology L) (Type u)) :=
  sorry

/-- **Layer 7.4.** Sublocales of `L` are the subtopoi of `Sh(L)`, preserving the order. -/
theorem exists_sublocale_orderIso_subtopos (L : Type u) [Order.Frame L] :
    ∃ e : Sublocale L ≃ Subtopos (Sheaf (Frame.grothendieckTopology L) (Type u)),
      ∀ S T : Sublocale L, S ≤ T ↔ (e S).P ≤ (e T).P :=
  sorry

/-! ## Layer 8: fibre products of topoi, locales and spaces -/

/-- **Layer 8.2.** `i` and `j` exhibit `N` as the coproduct of the frames `L` and `M`. -/
structure IsFrameCoproduct {L M N : Type u} [Order.Frame L] [Order.Frame M] [Order.Frame N]
    (i : FrameHom L N) (j : FrameHom M N) : Prop where
  /-- The universal property, tested on frames in the same universe. -/
  existsUnique_lift : ∀ (P : Type u) [Order.Frame P] (f : FrameHom L P) (g : FrameHom M P),
    ∃! h : FrameHom N P, h.comp i = f ∧ h.comp j = g

/-- **Layer 8.3.** `a` is way below `b`: every nonempty directed set whose supremum is above `b`
has a member above `a`. -/
def CompleteLattice.WayBelow {L : Type*} [CompleteLattice L] (a b : L) : Prop :=
  ∀ s : Set L, s.Nonempty → DirectedOn (· ≤ ·) s → b ≤ sSup s → ∃ x ∈ s, a ≤ x

open TopologicalSpace in
/-- **Layer 8.3.** `X` is core-compact: every point of an open `U` lies in an open way below
`U`. -/
class CoreCompactSpace (X : Type*) [TopologicalSpace X] : Prop where
  /-- Every point of an open `U` lies in an open way below `U`. -/
  exists_wayBelow : ∀ (U : Opens X) (x : X), x ∈ U →
    ∃ V : Opens X, x ∈ V ∧ CompleteLattice.WayBelow V U

/-- **Layer 8.3.** A locally compact space is core-compact. -/
theorem LocallyCompactSpace.coreCompactSpace (X : Type*) [TopologicalSpace X]
    [LocallyCompactSpace X] : CoreCompactSpace X :=
  sorry

/-- **Layer 8.4.** An arbitrary product of quasi-sober spaces is quasi-sober. -/
theorem quasiSober_pi {ι : Type*} (X : ι → Type*) [∀ i, TopologicalSpace (X i)]
    [∀ i, QuasiSober (X i)] : QuasiSober (∀ i, X i) :=
  sorry

/-- **Layer 8.4.** A binary product of quasi-sober spaces is quasi-sober. -/
theorem quasiSober_prod (X Y : Type*) [TopologicalSpace X] [TopologicalSpace Y]
    [QuasiSober X] [QuasiSober Y] : QuasiSober (X × Y) :=
  sorry

open TopologicalSpace in
/-- **Layer 8.5.** For `S` core-compact, `Opens (S × T)` is the frame coproduct of `Opens S` and
`Opens T` (Isbell 1981, Theorem 1). -/
theorem isFrameCoproduct_opens_prod (S T : Type u) [TopologicalSpace S] [TopologicalSpace T]
    [CoreCompactSpace S] :
    IsFrameCoproduct (Opens.comap (⟨Prod.fst, continuous_fst⟩ : C(S × T, S)))
      (Opens.comap (⟨Prod.snd, continuous_snd⟩ : C(S × T, T))) :=
  sorry

open TopologicalSpace in
/-- **Layer 8.5.** `Opens (ℚ × ℚ)` is not the frame coproduct of two copies of `Opens ℚ`
(Stone Spaces, II 2.14). -/
theorem not_isFrameCoproduct_opens_rat_prod :
    ¬ IsFrameCoproduct (Opens.comap (⟨Prod.fst, continuous_fst⟩ : C(ℚ × ℚ, ℚ)))
      (Opens.comap (⟨Prod.snd, continuous_snd⟩ : C(ℚ × ℚ, ℚ))) :=
  sorry

end TauCetiRoadmap.GrothendieckTopoi

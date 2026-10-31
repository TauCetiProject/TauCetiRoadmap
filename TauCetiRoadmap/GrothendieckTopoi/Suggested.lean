import Mathlib.CategoryTheory.Adjunction.Mates
import Mathlib.CategoryTheory.Bicategory.Basic
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.CategoryTheory.Comma.Over.Pullback
import Mathlib.CategoryTheory.Generator.Basic
import Mathlib.CategoryTheory.Limits.Preserves.Finite
import Mathlib.CategoryTheory.Limits.Shapes.DisjointCoproduct
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Defs
import Mathlib.CategoryTheory.Limits.VanKampen
import Mathlib.CategoryTheory.ObjectProperty.ClosedUnderIsomorphisms
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.ObjectProperty.Small
import Mathlib.CategoryTheory.Sites.Coherent.Basic
import Mathlib.CategoryTheory.Sites.CoverLifting
import Mathlib.CategoryTheory.Sites.LeftExact
import Mathlib.CategoryTheory.Sites.Over
import Mathlib.CategoryTheory.Sites.Point.Category
import Mathlib.CategoryTheory.Sites.Point.Conservative
import Mathlib.CategoryTheory.Sites.Pullback
import Mathlib.CategoryTheory.Subobject.Classifier.Defs
import Mathlib.CategoryTheory.Subobject.Lattice
import Mathlib.Order.Closure
import Mathlib.Order.CompactlyGenerated.Basic
import Mathlib.Order.Sublocale
import Mathlib.Topology.Compactness.LocallyCompact
import Mathlib.Topology.Instances.Rat
import Mathlib.Topology.Perfect
import Mathlib.Topology.Sets.Opens
import Mathlib.Topology.Sober

/-!
# Grothendieck topoi: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is permitted in this human-owned repository:
these are targets, not implementations.

Three design choices are forced here. `IsGrothendieckTopos` is a `Prop`: the site is not data.
A geometric morphism is named after its direct image, so `GeometricMorphism E F` has
`direct : E ⥤ F`. A 2-cell `f ⟶ g` is a natural transformation `f.direct ⟶ g.direct` (SGA 4
IV 3.2), the direction of Mathlib's `GrothendieckTopology.Point.Hom`, so that the points of a site
form a category equivalent to, not opposite to, the geometric morphisms from `Type u`.
-/

universe u v₁ v₂ v₃ u₁ u₂ u₃

open CategoryTheory CategoryTheory.Limits

namespace TauCetiRoadmap.GrothendieckTopoi

/-! ## Layer 1: Grothendieck topoi and Giraud's theorem -/

/-- `E` is a Grothendieck topos: it is equivalent to the category of sheaves of `u`-small types
on some small site. The site is not part of the data. -/
def IsGrothendieckTopos (E : Type (u + 1)) [Category.{u} E] : Prop :=
  ∃ (C : Type u) (_ : SmallCategory C) (J : GrothendieckTopology C),
    Nonempty (E ≌ Sheaf J (Type u))

theorem isGrothendieckTopos_sheaf {C : Type u} [SmallCategory C] (J : GrothendieckTopology C) :
    IsGrothendieckTopos (Sheaf J (Type u)) :=
  sorry

theorem IsGrothendieckTopos.of_equivalence {E E' : Type (u + 1)} [Category.{u} E]
    [Category.{u} E'] (e : E ≌ E') (hE : IsGrothendieckTopos E) : IsGrothendieckTopos E' :=
  sorry

section Structure

variable {E : Type (u + 1)} [Category.{u} E]

theorem IsGrothendieckTopos.hasLimits (hE : IsGrothendieckTopos E) : HasLimits E := sorry

theorem IsGrothendieckTopos.hasColimits (hE : IsGrothendieckTopos E) : HasColimits E := sorry

theorem IsGrothendieckTopos.hasSubobjectClassifier (hE : IsGrothendieckTopos E) :
    HasSubobjectClassifier E :=
  sorry

/-- The subobjects of an object of a Grothendieck topos form a frame. -/
@[instance_reducible]
noncomputable def IsGrothendieckTopos.subobjectFrame (hE : IsGrothendieckTopos E) (X : E) :
    Order.Frame (Subobject X) :=
  sorry

end Structure

/-- `p₁ p₂ : R ⟶ X` is an internal equivalence relation: jointly monic, and inducing an
equivalence relation on `T ⟶ X` for every `T`. -/
structure IsInternalEquivalenceRel {E : Type u₁} [Category.{v₁} E] {R X : E}
    (p₁ p₂ : R ⟶ X) : Prop where
  jointly_mono : ∀ {T : E} (a b : T ⟶ R), a ≫ p₁ = b ≫ p₁ → a ≫ p₂ = b ≫ p₂ → a = b
  equivalence : ∀ T : E,
    _root_.Equivalence (fun x y : T ⟶ X => ∃ r : T ⟶ R, r ≫ p₁ = x ∧ r ≫ p₂ = y)

/-- Giraud's axioms for a locally `u`-small category. -/
structure GiraudAxioms (E : Type (u + 1)) [Category.{u} E] : Prop where
  hasFiniteLimits : HasFiniteLimits E
  hasCoproducts : HasCoproducts.{u} E
  coproductDisjoint : ∀ {ι : Type u} (X : ι → E), CoproductDisjoint X
  coproduct_isUniversal : ∀ {ι : Type u} (X : ι → E) (c : Cofan X), IsColimit c →
    IsUniversalColimit c
  effective : ∀ {R X : E} (p₁ p₂ : R ⟶ X), IsInternalEquivalenceRel p₁ p₂ →
    ∃ (Q : E) (q : X ⟶ Q) (w : p₁ ≫ q = p₂ ≫ q),
      Nonempty (IsColimit (Cofork.ofπ q w)) ∧ IsUniversalColimit (Cofork.ofπ q w) ∧
        IsPullback p₁ p₂ q q
  separating : ∃ P : ObjectProperty E, ObjectProperty.Small.{u} P ∧ P.IsSeparating

/-- Giraud's theorem (SGA 4 IV 1.2; Elephant C2.2.8; Mac Lane–Moerdijk, Appendix). -/
theorem isGrothendieckTopos_iff_giraudAxioms (E : Type (u + 1)) [Category.{u} E] :
    IsGrothendieckTopos E ↔ GiraudAxioms E :=
  sorry

/-! ## Layer 2: geometric morphisms -/

/-- A geometric morphism `E → F`: an adjunction `f^* ⊣ f_*` with `f_* : E ⥤ F` and left exact
inverse image. -/
structure GeometricMorphism (E : Type u₁) [Category.{v₁} E] (F : Type u₂) [Category.{v₂} F] where
  /-- The direct image `f_*`. -/
  direct : E ⥤ F
  /-- The inverse image `f^*`. -/
  inverse : F ⥤ E
  adj : inverse ⊣ direct
  preservesFiniteLimits_inverse : PreservesFiniteLimits inverse

namespace GeometricMorphism

attribute [instance] preservesFiniteLimits_inverse

variable {E : Type u₁} [Category.{v₁} E] {F : Type u₂} [Category.{v₂} F]
  {G : Type u₃} [Category.{v₃} G]

/-- The identity geometric morphism. -/
def id (E : Type u₁) [Category.{v₁} E] : GeometricMorphism E E where
  direct := 𝟭 E
  inverse := 𝟭 E
  adj := Adjunction.id
  preservesFiniteLimits_inverse := sorry

/-- Composition: direct images compose in the order of the morphisms. -/
def comp (f : GeometricMorphism E F) (g : GeometricMorphism F G) : GeometricMorphism E G where
  direct := f.direct ⋙ g.direct
  inverse := g.inverse ⋙ f.inverse
  adj := g.adj.comp f.adj
  preservesFiniteLimits_inverse := sorry

/-- The geometric morphism of an equivalence, with direct image `e.functor`. -/
def ofEquiv (e : E ≌ F) : GeometricMorphism E F where
  direct := e.functor
  inverse := e.inverse
  adj := e.symm.toAdjunction
  preservesFiniteLimits_inverse := sorry

/-- A 2-cell `f ⟶ g` is a natural transformation between direct images (SGA 4 IV 3.2). -/
@[ext]
structure Hom (f g : GeometricMorphism E F) where
  hom : f.direct ⟶ g.direct

instance : Category (GeometricMorphism E F) where
  Hom := Hom
  id f := ⟨𝟙 f.direct⟩
  comp α β := ⟨α.hom ≫ β.hom⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The same 2-cell, read on inverse images: the conjugate goes the other way. -/
noncomputable def homEquivInverse (f g : GeometricMorphism E F) :
    (f.direct ⟶ g.direct) ≃ (g.inverse ⟶ f.inverse) :=
  (conjugateEquiv f.adj g.adj).symm

/-- `f` is an embedding: its direct image is fully faithful. -/
def IsEmbedding (f : GeometricMorphism E F) : Prop := f.direct.Full ∧ f.direct.Faithful

/-- `f` is a surjection: its inverse image is faithful. -/
def IsSurjection (f : GeometricMorphism E F) : Prop := f.inverse.Faithful

/-- `f` is connected: its inverse image is fully faithful. -/
def IsConnected (f : GeometricMorphism E F) : Prop := f.inverse.Full ∧ f.inverse.Faithful

/-- `f` is hyperconnected: connected, with essential image of `f^*` closed under subobjects. -/
def IsHyperconnected (f : GeometricMorphism E F) : Prop :=
  f.IsConnected ∧ ∀ (X : F) {A : E} (m : A ⟶ f.inverse.obj X), Mono m →
    ∃ Y : F, Nonempty (A ≅ f.inverse.obj Y)

/-- `f` is localic: every object of `E` is a quotient of a subobject of some `f^* X`. -/
def IsLocalic (f : GeometricMorphism E F) : Prop :=
  ∀ A : E, ∃ (X : F) (B : E) (m : B ⟶ f.inverse.obj X) (e : B ⟶ A), Mono m ∧ Epi e

end GeometricMorphism

/-- Grothendieck topoi in universe `u`, the objects of the 2-category of Layer 2. -/
structure GrothendieckToposCat where
  carrier : Type (u + 1)
  [str : Category.{u} carrier]
  isGrothendieckTopos : IsGrothendieckTopos carrier

attribute [instance] GrothendieckToposCat.str

/-- 1-cells are geometric morphisms and 2-cells natural transformations of direct images. -/
@[instance_reducible]
noncomputable def GrothendieckToposCat.bicategory : Bicategory GrothendieckToposCat.{u} := sorry

section Global

variable {E : Type (u + 1)} [Category.{u} E]

/-- The global sections morphism `E → Type u`. -/
noncomputable def GeometricMorphism.global (hE : IsGrothendieckTopos E) :
    GeometricMorphism E (Type u) :=
  sorry

/-- Any two geometric morphisms to `Type u` are isomorphic by a unique 2-cell. -/
theorem GeometricMorphism.nonempty_unique_hom_to_type (hE : IsGrothendieckTopos E)
    (f g : GeometricMorphism E (Type u)) : Nonempty (Unique (f ⟶ g)) :=
  sorry

end Global

section Sites

variable {C D : Type u} [SmallCategory C] [SmallCategory D]
  {J : GrothendieckTopology C} {K : GrothendieckTopology D}

/-- The geometric morphism of a continuous, representably flat functor of small sites. -/
noncomputable def GeometricMorphism.ofContinuous (G : C ⥤ D) [G.IsContinuous J K]
    [RepresentablyFlat G] [(G.sheafPushforwardContinuous (Type u) J K).IsRightAdjoint] :
    GeometricMorphism (Sheaf K (Type u)) (Sheaf J (Type u)) where
  direct := G.sheafPushforwardContinuous (Type u) J K
  inverse := G.sheafPullback (Type u) J K
  adj := G.sheafAdjunctionContinuous (Type u) J K
  preservesFiniteLimits_inverse := sorry

/-- The geometric morphism of a cocontinuous functor (SGA 4 III 2.3): the inverse image is the
sheafification of restriction along `G.op`. -/
noncomputable def GeometricMorphism.ofCocontinuous (G : C ⥤ D) [G.IsCocontinuous J K]
    [∀ (F : Cᵒᵖ ⥤ Type u), G.op.HasPointwiseRightKanExtension F] :
    GeometricMorphism (Sheaf J (Type u)) (Sheaf K (Type u)) where
  direct := G.sheafPushforwardCocontinuous (Type u) J K
  inverse := sorry
  adj := sorry
  preservesFiniteLimits_inverse := sorry

/-- Points of a site are the points of its topos, covariantly (SGA 4 IV 6.3). -/
noncomputable def pointEquivalence (J : GrothendieckTopology C) :
    GrothendieckTopology.Point.{u} J ≌ GeometricMorphism (Type u) (Sheaf J (Type u)) :=
  sorry

end Sites

/-! ## Layer 3: induced topoi and étale morphisms -/

theorem IsGrothendieckTopos.over {E : Type (u + 1)} [Category.{u} E]
    (hE : IsGrothendieckTopos E) (X : E) : IsGrothendieckTopos (Over X) :=
  sorry

/-- Sheaves on `J.over c` are the slice over the sheafified representable of `c`. -/
noncomputable def overSheafEquiv {C : Type u} [SmallCategory C] (J : GrothendieckTopology C)
    (c : C) :
    Sheaf (J.over c) (Type u) ≌ Over ((presheafToSheaf J (Type u)).obj (yoneda.obj c)) :=
  sorry

/-- The étale geometric morphism `E/X → E`, with inverse image `Over.star X`. -/
noncomputable def GeometricMorphism.etale {E : Type (u + 1)} [Category.{u} E]
    [HasBinaryProducts E] (hE : IsGrothendieckTopos E) (X : E) :
    GeometricMorphism (Over X) E :=
  sorry

theorem GeometricMorphism.etale_inverse {E : Type (u + 1)} [Category.{u} E]
    [HasBinaryProducts E] (hE : IsGrothendieckTopos E) (X : E) :
    Nonempty ((GeometricMorphism.etale hE X).inverse ≅ Over.star X) :=
  sorry

/-! ## Layer 4: subtopoi -/

/-- A subtopos: a replete full subcategory whose inclusion has a left exact left adjoint. -/
structure Subtopos (E : Type u₁) [Category.{v₁} E] where
  P : ObjectProperty E
  isClosedUnderIsomorphisms : P.IsClosedUnderIsomorphisms
  exists_reflector : ∃ (L : E ⥤ P.FullSubcategory) (_ : L ⊣ P.ι), PreservesFiniteLimits L

/-- A universal closure operator: a closure operator on each `Subobject X`, stable under
pullback. -/
structure UniversalClosureOperator (E : Type u₁) [Category.{v₁} E] [HasPullbacks E] where
  cl : ∀ X : E, ClosureOperator (Subobject X)
  pullback_cl : ∀ {X Y : E} (f : Y ⟶ X) (A : Subobject X),
    (Subobject.pullback f).obj (cl X A) = cl Y ((Subobject.pullback f).obj A)

/-- `F` is a sheaf for `c`: maps into `F` extend uniquely along `c`-dense monomorphisms. -/
def UniversalClosureOperator.IsSheaf {E : Type u₁} [Category.{v₁} E] [HasPullbacks E]
    (c : UniversalClosureOperator E) (F : E) : Prop :=
  ∀ {B : E} (A : Subobject B), c.cl B A = ⊤ →
    Function.Bijective (fun g : B ⟶ F => A.arrow ≫ g)

/-- Universal closure operators and subtopoi correspond (order-reversingly; see `README.md`). -/
noncomputable def subtoposEquivUniversalClosureOperator {E : Type (u + 1)} [Category.{u} E]
    [HasPullbacks E] (hE : IsGrothendieckTopos E) :
    UniversalClosureOperator E ≃ Subtopos E :=
  sorry

/-- Every geometric morphism factors as a surjection followed by an embedding. -/
theorem GeometricMorphism.exists_surjection_embedding {E F : Type (u + 1)} [Category.{u} E]
    [Category.{u} F] (hE : IsGrothendieckTopos E) (hF : IsGrothendieckTopos F)
    (f : GeometricMorphism E F) :
    ∃ (M : Type (u + 1)) (_ : Category.{u} M) (s : GeometricMorphism E M)
      (i : GeometricMorphism M F), IsGrothendieckTopos M ∧ s.IsSurjection ∧ i.IsEmbedding ∧
        Nonempty (s.comp i ≅ f) :=
  sorry

/-! ## Layer 5: the hyperconnected–localic factorization -/

theorem GeometricMorphism.exists_hyperconnected_localic {E F : Type (u + 1)} [Category.{u} E]
    [Category.{u} F] (hE : IsGrothendieckTopos E) (hF : IsGrothendieckTopos F)
    (f : GeometricMorphism E F) :
    ∃ (M : Type (u + 1)) (_ : Category.{u} M) (h : GeometricMorphism E M)
      (l : GeometricMorphism M F), IsGrothendieckTopos M ∧ h.IsHyperconnected ∧ l.IsLocalic ∧
        Nonempty (h.comp l ≅ f) :=
  sorry

/-! ## Layer 6: points -/

/-- `E` has enough points: the inverse images of a `u`-small family of points jointly reflect
isomorphisms. -/
def HasEnoughPoints (E : Type (u + 1)) [Category.{u} E] : Prop :=
  ∃ (ι : Type u) (p : ι → GeometricMorphism (Type u) E),
    ∀ {A B : E} (φ : A ⟶ B), (∀ i, IsIso ((p i).inverse.map φ)) → IsIso φ

theorem hasEnoughPoints_sheaf_iff {C : Type u} [SmallCategory C] (J : GrothendieckTopology C) :
    HasEnoughPoints (Sheaf J (Type u)) ↔ GrothendieckTopology.HasEnoughPoints.{u} J :=
  sorry

/-- Deligne's theorem for the coherent topology (SGA 4 VI 9.0). -/
theorem hasEnoughPoints_coherentTopology (C : Type u) [SmallCategory C] [Precoherent C]
    [HasPullbacks C] : GrothendieckTopology.HasEnoughPoints.{u} (coherentTopology C) :=
  sorry

/-! ## Layer 7: locales and localic topoi -/

/-- The canonical site of a frame: a sieve on `U` covers when its members have supremum `U`. -/
def Frame.grothendieckTopology (L : Type u) [Order.Frame L] : GrothendieckTopology L where
  sieves U := {S | sSup {V | ∃ h : V ≤ U, S.arrows (homOfLE h)} = U}
  top_mem' := sorry
  pullback_stable' := sorry
  transitive' := sorry

/-- Sublocales of `L` are the subtopoi of `Sh(L)`, preserving order (see `README.md`). -/
noncomputable def sublocaleEquivSubtopos (L : Type u) [Order.Frame L] :
    Sublocale L ≃ Subtopos (Sheaf (Frame.grothendieckTopology L) (Type u)) :=
  sorry

/-! ## Layer 8: coproducts of frames, core-compact, scattered and sober spaces, products of spaces -/

/-- `i` and `j` exhibit `N` as the coproduct of the frames `L` and `M`. -/
structure IsFrameCoproduct {L M N : Type u} [Order.Frame L] [Order.Frame M] [Order.Frame N]
    (i : FrameHom L N) (j : FrameHom M N) : Prop where
  existsUnique_lift : ∀ (P : Type u) [Order.Frame P] (f : FrameHom L P) (g : FrameHom M P),
    ∃! h : FrameHom N P, h.comp i = f ∧ h.comp j = g

/-- `a` is way below `b`: every nonempty directed set whose supremum is above `b` has a member
above `a`. -/
def CompleteLattice.WayBelow {L : Type*} [CompleteLattice L] (a b : L) : Prop :=
  ∀ s : Set L, s.Nonempty → DirectedOn (· ≤ ·) s → b ≤ sSup s → ∃ x ∈ s, a ≤ x

theorem CompleteLattice.WayBelow.le {L : Type*} [CompleteLattice L] {a b : L}
    (h : CompleteLattice.WayBelow a b) : a ≤ b :=
  sorry

theorem CompleteLattice.wayBelow_self_iff {L : Type*} [CompleteLattice L] (a : L) :
    CompleteLattice.WayBelow a a ↔ IsCompactElement a :=
  sorry

open TopologicalSpace in
/-- `X` is core-compact: every point of an open `U` lies in an open way below `U`. -/
class CoreCompactSpace (X : Type*) [TopologicalSpace X] : Prop where
  exists_wayBelow : ∀ (U : Opens X) (x : X), x ∈ U →
    ∃ V : Opens X, x ∈ V ∧ CompleteLattice.WayBelow V U

instance (priority := 100) LocallyCompactSpace.coreCompactSpace (X : Type*) [TopologicalSpace X]
    [LocallyCompactSpace X] : CoreCompactSpace X :=
  sorry

theorem not_coreCompactSpace_rat : ¬ CoreCompactSpace ℚ :=
  sorry

/-- `X` is scattered: every nonempty subset has a relatively isolated point. -/
class ScatteredSpace (X : Type*) [TopologicalSpace X] : Prop where
  exists_isolated : ∀ A : Set X, A.Nonempty →
    ∃ x ∈ A, ∃ W : Set X, IsOpen W ∧ x ∈ W ∧ W ∩ A ⊆ {x}

theorem scatteredSpace_iff (X : Type*) [TopologicalSpace X] :
    ScatteredSpace X ↔ ∀ C : Set X, Preperfect C → C = ∅ :=
  sorry

instance (priority := 100) ScatteredSpace.t0Space (X : Type*) [TopologicalSpace X]
    [ScatteredSpace X] : T0Space X :=
  sorry

instance (priority := 100) ScatteredSpace.quasiSober (X : Type*) [TopologicalSpace X]
    [ScatteredSpace X] : QuasiSober X :=
  sorry

/-- An arbitrary product of quasi-sober spaces is quasi-sober. -/
instance quasiSober_pi {ι : Type*} (X : ι → Type*) [∀ i, TopologicalSpace (X i)]
    [∀ i, QuasiSober (X i)] : QuasiSober (∀ i, X i) :=
  sorry

instance quasiSober_prod (X Y : Type*) [TopologicalSpace X] [TopologicalSpace Y]
    [QuasiSober X] [QuasiSober Y] : QuasiSober (X × Y) :=
  sorry

open TopologicalSpace in
/-- For `S` core-compact, `Opens (S × T)` is the frame coproduct of `Opens S` and `Opens T`. -/
theorem isFrameCoproduct_opens_prod (S T : Type u) [TopologicalSpace S] [TopologicalSpace T]
    [CoreCompactSpace S] :
    IsFrameCoproduct (Opens.comap (⟨Prod.fst, continuous_fst⟩ : C(S × T, S)))
      (Opens.comap (⟨Prod.snd, continuous_snd⟩ : C(S × T, T))) :=
  sorry

open TopologicalSpace in
/-- `Opens (ℚ × ℚ)` is not the frame coproduct of two copies of `Opens ℚ`. -/
theorem not_isFrameCoproduct_opens_rat_prod :
    ¬ IsFrameCoproduct (Opens.comap (⟨Prod.fst, continuous_fst⟩ : C(ℚ × ℚ, ℚ)))
      (Opens.comap (⟨Prod.snd, continuous_snd⟩ : C(ℚ × ℚ, ℚ))) :=
  sorry

end TauCetiRoadmap.GrothendieckTopoi

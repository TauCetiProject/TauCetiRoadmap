module

public import Mathlib
public import TauCeti.Algebra.BrauerGroup.Group
public import TauCeti.Algebra.Module.PseudoCoherent.Basic
public import TauCeti.AlgebraicGeometry.AlgebraicSpace.Basic
public import TauCeti.AlgebraicGeometry.Chow.Basic
public import TauCeti.AlgebraicGeometry.Cohomology.Genus
public import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
public import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
public import TauCeti.AlgebraicGeometry.LineBundle.Class
public import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
public import TauCeti.AlgebraicGeometry.Modules.PseudoCoherent.Basic
public import TauCeti.AlgebraicGeometry.Morphisms.PureRelativeDimension
public import TauCeti.AlgebraicGeometry.Morphisms.Thickening
public import TauCeti.AlgebraicGeometry.Scheme.CodimensionOnePoint
public import TauCeti.AlgebraicGeometry.Scheme.Regular.Scheme
public import TauCeti.AlgebraicGeometry.VectorBundle.Degree
public import TauCeti.CategoryTheory.Limits.Replete
public import TauCeti.RingTheory.KrullDimension.FiniteType
public import TauCeti.RingTheory.Nagata
public import TauCeti.RingTheory.RegularLocalRing.GRing
public import TauCeti.RingTheory.RegularLocalRing.Locus

/-!
# Scheme, stack, cohomology and intersection foundations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with the few definitions they need.

Headline theorems that are not statable at the pins, and what each lacks:

* §0.12: the étale local ring at a geometric point is a strict henselization of the Zariski
  local ring (Stacks 04HX). Its recognition predicate is ModularCurves Layer 4D's
  `IsHenselization`, a roadmap declaration that this file does not import, and the pins have no
  ring map from the Zariski stalk to the fibre of the étale structure presheaf; the file states
  the consequences that need neither (henselian, with separably closed residue field).
* §2.10: full faithfulness of the étale-to-pro-étale comparison. Its statement needs the left
  adjoint `ν^*` composed with the universe lift of coefficients, both targets of README.md
  §2.10; the file states only that `ν` is a morphism of sites.
* §1.23: the Keel–Mori theorem (an algebraic stack of finite presentation with finite inertia
  has a coarse moduli space). The pins have no algebraic stack (a stack in groupoids with
  representable diagonal and a smooth atlas), no inertia stack and no coarse moduli space;
  their construction is specified in README.md §§1.18–1.23.
* §2.18: gluing of derived morphisms and of derived objects on an open basis (Stacks 0D66,
  0D6C). Derived restriction to an open needs `Scheme.Modules.restrictFunctor` to be additive and
  exact, which the pins do not provide.
* §2.19–§2.20: coherent Grothendieck duality (the right adjoint `f^!` of `Rf_*` on `D_qc` for
  proper `f`, and the dualizing complex). The pins have no derived pushforward of module
  sheaves on schemes between the categories `DQCoh`.
* §2.22: the Brauer class `Br_Az(X) → H²(X_ét, 𝔾_m)` of an Azumaya algebra on a scheme. The pins
  have Azumaya algebras over rings only (`IsAzumaya`) and no étale cohomology of `𝔾_m` on a
  scheme; the affine matrix-splitting theorems below are not this map.
* §3.6: the Picard torsors `Pic^d_{X/k}` of a smooth projective curve without a rational point,
  with `Pic(X) → Pic_{X/k}(k)` of cokernel in `Br(k)` (on a pointless real conic the degrees of
  line bundles are `2ℤ` and those of `Pic_{X/k}(ℝ)` are `ℤ`). The pins have the presheaf
  `TauCeti.AlgebraicGeometry.relativePicardPresheaf` but not its fppf sheafification, its degree
  decomposition or its representability.
* §4.4: Schlessinger's theorem. Its statement needs the Artinian coefficient category `C_Λ` with
  its fibre products along small extensions, the dual numbers as an object, the vector-space
  structure on tangent spaces and pro-representable hulls in `Ĉ_Λ`; none is at the pins, and
  together they are a long encoding rather than a few simple definitions.
* §4.9: the formal completion of a scheme along a closed subscheme as an adic thickening
  system, and the completion functor on finitely presented modules. The pins give the closed
  subschemes `V(I^{n+1})` but neither the thickening property of their inclusions nor the adic
  equation on their ideals; `grothendieck_existence` therefore quantifies over an adic system
  with closed immersions into `X` satisfying those equations.
* §5.7: `K_0(X) → G_0(X)` is bijective on a regular Noetherian scheme with the resolution
  property (Stacks, Lemma 36.37.4). The exact structures on finitely presented and on finite
  locally free module sheaves need their extension closure, which the pins do not prove.
* §5.8: Grothendieck–Riemann–Roch. The pins have no Chern character, Todd class or proper
  pushforward on `K_0` of a scheme.
* §5.10: the Hodge index theorem. The pins have no intersection pairing on the Picard group of
  a projective surface over a field; Tau Ceti's intersection matrices of numerical types are
  combinatorial data, not this pairing.
-/

@[expose] public section

namespace TauCetiRoadmap.SchemeAndStackFoundations

universe u

noncomputable section

/-! ## Layer 0: schemes and morphisms -/

section Layer0

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.TensorProduct ZeroObject

/-! ### §0.5 Pseudo-coherent modules -/

namespace PseudoCoherence

/-- Pseudo-coherence of a module, read on a bundled module: Tau Ceti's
`TauCeti.Huber.IsPseudoCoherentOver A M ⊤`, a resolution by finite free modules exact in every
degree. Stacks, Definition 15.66.1 (064Q) and Lemma 15.66.4 (064T). -/
abbrev IsPseudoCoherentModule (A : Type u) [CommRing A] (M : ModuleCat.{u} A) : Prop :=
  TauCeti.Huber.IsPseudoCoherentOver A M ⊤

/-- The affine criterion for Tau Ceti's pseudo-coherent module sheaves: a module sheaf is
pseudo-coherent exactly when it is quasi-coherent and its sections over every affine open are a
pseudo-coherent module. Stacks, §36.10 (08E4), Lemmas 36.10.1 (08E5) and 36.10.2 (08E7). -/
theorem isPseudoCoherent_iff_affineOpens {X : Scheme.{u}} (F : X.Modules) :
    F.IsPseudoCoherent ↔ F.IsQuasicoherent ∧
      ∀ U : X.affineOpens, IsPseudoCoherentModule Γ(X, U.1)
        (ModuleCat.of Γ(X, U.1) Γ(F, U.1)) := by
  sorry

end PseudoCoherence

/-! ### §0.8 Flatness over Dedekind bases -/

/-- A reduced scheme all of whose irreducible components dominate a Dedekind base is flat over
it; no purity of fibre dimension follows. Stacks, Lemma 15.22.11 (0AUW). -/
theorem flat_over_dedekind {X S : Scheme.{u}} (f : X ⟶ S) [IsReduced X] [IsIntegral S]
    (hS : ∀ U : S.affineOpens, Nonempty U.1 → IsDedekindDomain Γ(S, U.1))
    (hdom : ∀ Z ∈ irreducibleComponents X, Dense (f '' Z)) : Flat f := by
  sorry

/-! ### §0.10 Components of finite étale covers -/

/-- Over a locally Noetherian base, every connected component of the source of a finite étale
morphism is open and closed, and finite étale over the base. Stacks, Lemmas 59.64.4 (03RV) and
5.9.6 (04MF). -/
theorem unibranch_finite_components {X Y : Scheme.{u}} [IsLocallyNoetherian X]
    (p : Y ⟶ X) [IsFinite p] [Etale p] (y : Y) :
    IsClopen (connectedComponent y) ∧
      ∃ U : Y.Opens, (U : Set Y) = connectedComponent y ∧
        IsClosed (U : Set Y) ∧ IsFinite (U.ι ≫ p) ∧ Etale (U.ι ≫ p) := by
  sorry

/-! ### §0.12 Strict local rings of schemes -/

/-- The étale local ring of `S` at a geometric point `s : Spec Ω ⟶ S`, `Ω` separably closed: the
fibre at Mathlib's point `pointSmallEtale s` of the structure presheaf `U ↦ Γ(U, 𝒪_U)` of the
small étale site. Stacks, Definition 59.33.2 (03PS). -/
def Scheme.strictLocalRing {S : Scheme.{u}} {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (s : Spec (.of Ω) ⟶ S) : CommRingCat.{u} :=
  (Scheme.pointSmallEtale s).presheafFiber.obj
    ((Scheme.Etale.forget S ⋙ Over.forget S).op ⋙ Scheme.Γ)

/-- The étale local ring at a geometric point is a henselian local ring.
Stacks, Lemma 59.33.1 (04HX). -/
theorem Scheme.henselianLocalRing_strictLocalRing {S : Scheme.{u}} {Ω : Type u} [Field Ω]
    [IsSepClosed Ω] (s : Spec (.of Ω) ⟶ S) : HenselianLocalRing (Scheme.strictLocalRing s) := by
  sorry

attribute [instance] Scheme.henselianLocalRing_strictLocalRing

/-- The residue field of the étale local ring at a geometric point is separably closed, so the
ring is strictly henselian. Stacks, Lemma 59.33.1 (04HX) and Definition 59.32.6 (03QK). -/
theorem Scheme.isSepClosed_residueField_strictLocalRing {S : Scheme.{u}} {Ω : Type u} [Field Ω]
    [IsSepClosed Ω] (s : Spec (.of Ω) ⟶ S) :
    IsSepClosed (IsLocalRing.ResidueField (Scheme.strictLocalRing s)) := by
  sorry

/-! ### §0.20 Japanese and Nagata rings -/

/-- A complete Noetherian local domain is Japanese. Stacks, Lemma 10.162.8 (032W). -/
theorem Ring.IsJapanese.of_complete_local (A : Type u) [CommRing A] [IsDomain A]
    [IsLocalRing A] [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    TauCeti.Ring.IsJapanese A := by
  sorry

/-- A complete Noetherian local ring is Nagata. Stacks, Lemma 10.162.8 (032W). -/
theorem Ring.IsNagata.of_complete_local (A : Type u) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    TauCeti.Ring.IsNagata A := by
  sorry

/-! ### §0.21 J-2 rings and quasi-excellent rings -/

namespace Excellence

/-- J-2 rings: Noetherian, and every finite-type algebra has open regular locus (Tau Ceti's
`TauCeti.Excellence.regularLocus`, which need not be open). Stacks, Definition 15.48.1 (3). -/
def IsJ2 (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → IsOpen (TauCeti.Excellence.regularLocus B)

/-- Quasi-excellent rings: Tau Ceti's G-rings that are J-2. Stacks, Definition 15.53.1 (1); no
catenarity is required. -/
def IsQuasiExcellentRing (R : Type u) [CommRing R] : Prop :=
  TauCeti.Excellence.IsGRing R ∧ IsJ2 R

/-- Quasi-excellent rings are Nagata. Stacks, Lemma 15.53.5 (07QV). -/
theorem IsQuasiExcellentRing.isNagata (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : TauCeti.Ring.IsNagata R := by
  sorry

end Excellence

/-! ### §0.23a The étale-site functor and étale topological invariance -/

/-- The functor of small étale sites of a morphism `f : X ⟶ Y`: base change `V ↦ V ×_Y X`.
Stacks, Lemma 34.4.17 (021I). -/
def Scheme.Hom.etaleSite {X Y : Scheme.{u}} (f : X ⟶ Y) : Y.Etale ⥤ X.Etale := by
  letI : MorphismProperty.HasPullbacksAlong (@Etale : MorphismProperty Scheme.{u}) f :=
    ⟨fun _ _ => inferInstance⟩
  letI : MorphismProperty.IsStableUnderBaseChangeAlong
      (@Etale : MorphismProperty Scheme.{u}) f :=
    ⟨fun h hp => MorphismProperty.IsStableUnderBaseChange.of_isPullback h hp⟩
  exact MorphismProperty.Over.pullback @Etale ⊤ f

/-- Base change of étale schemes is continuous for the small étale topologies: it defines the
morphism of sites `X_ét → Y_ét`. Stacks, Lemma 34.4.17 (021I). -/
theorem Scheme.Hom.etaleSite_isContinuous {X Y : Scheme.{u}} (f : X ⟶ Y) :
    (Scheme.Hom.etaleSite f).IsContinuous (Scheme.smallEtaleTopology Y)
      (Scheme.smallEtaleTopology X) := by
  sorry

attribute [instance] Scheme.Hom.etaleSite_isContinuous

/-- Base change of étale schemes preserves finite limits. -/
theorem Scheme.Hom.etaleSite_preservesFiniteLimits {X Y : Scheme.{u}} (f : X ⟶ Y) :
    PreservesFiniteLimits (Scheme.Hom.etaleSite f) := by
  sorry

/-- Base change along a universal homeomorphism is fully faithful and essentially surjective.
Stacks, Theorem 59.45.2 (04DZ). -/
theorem Scheme.Hom.isEquivalence_etaleSite {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) :
    (Scheme.Hom.etaleSite f).IsEquivalence := by sorry

/-- A universal homeomorphism induces an equivalence with scheme base change as forward functor. -/
def universalHomeomorphismEtaleEquivalence {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) : Y.Etale ≌ X.Etale := by
  letI := Scheme.Hom.isEquivalence_etaleSite f hf
  exact (Scheme.Hom.etaleSite f).asEquivalence

/-- The forward functor of topological invariance is the étale-site functor, so its identity,
composition and base-change comparisons are those of `Scheme.Hom.etaleSite`. -/
theorem universalHomeomorphismEtaleEquivalence_functor {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) :
    (universalHomeomorphismEtaleEquivalence f hf).functor = Scheme.Hom.etaleSite f := by
  sorry

/-- The forward and inverse functors preserve covering sieves. -/
theorem universalHomeomorphismEtaleEquivalence_coverPreserving {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) :
    CoverPreserving (Scheme.smallEtaleTopology Y) (Scheme.smallEtaleTopology X)
      (universalHomeomorphismEtaleEquivalence f hf).functor ∧
    CoverPreserving (Scheme.smallEtaleTopology X) (Scheme.smallEtaleTopology Y)
      (universalHomeomorphismEtaleEquivalence f hf).inverse := by
  sorry

/-! ### §0.7a Linear Noether normalization for a prescribed affine presentation -/

section LinearNoetherNormalization

namespace LinearNormalization

/-- Linear Noether normalization in prescribed generators. Over an infinite field `k`, a nonzero
`k`-algebra `A` generated by the tuple `x` admits `d ≤ n` and a `d × n` matrix `C` over `k` such
that the linear combinations `y i = ∑ j, C i j • x j` are algebraically independent, the evaluation
map `k[T₁, …, T_d] → A`, `T_i ↦ y_i`, is module-finite, and `ringKrullDim A = d`. The algebra may
be reducible or nonreduced. Milne, Algebraic Geometry (v6.10), Theorem 2.45, Lemma 2.46 and
Remark 2.47, pp. 52–53; the dimension clause is
`TauCeti.ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial`. -/
theorem exists_linear_normalization {k A : Type*} [Field k] [Infinite k]
    [CommRing A] [Nontrivial A] [Algebra k A]
    {n : ℕ} (x : Fin n → A) (hx : Algebra.adjoin k (Set.range x) = ⊤) :
    ∃ (d : ℕ) (_ : d ≤ n) (C : Matrix (Fin d) (Fin n) k),
      let y : Fin d → A := fun i => ∑ j, C i j • x j
      AlgebraicIndependent k y ∧
        (MvPolynomial.aeval y : MvPolynomial (Fin d) k →ₐ[k] A).Finite ∧
        ringKrullDim A = (d : WithBot ℕ∞) := by
  sorry

end LinearNormalization

end LinearNoetherNormalization

end Layer0

/-! ## Layer 1: descent, algebraic spaces and stacks -/

section Layer1

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.Opposite _root_.AlgebraicGeometry
open TauCeti.AlgebraicGeometry (SchemePresheaf)
open TauCeti.AlgebraicGeometry.Spaces (IsAlgebraicSpace EtaleAtlas)

/-! ### §1.3–§1.10 Algebraic spaces -/

namespace Spaces

/-- The object property of being an algebraic space, for Tau Ceti's
`TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace` (an fppf sheaf with representable diagonal
and an étale atlas, Stacks, Definition 65.6.1 (025Y)). -/
def isAlgebraicSpace : ObjectProperty SchemePresheaf.{u} := fun F => IsAlgebraicSpace F

/-- The category of algebraic spaces. -/
abbrev AlgSpace : Type (u + 1) := (isAlgebraicSpace.{u}).FullSubcategory

/-- Fibre products of algebraic spaces are algebraic spaces. Stacks, Lemma 65.7.3 (02X2). -/
theorem isAlgebraicSpace_pullback {F G H : SchemePresheaf.{u}} (f : F ⟶ H) (g : G ⟶ H)
    (hF : IsAlgebraicSpace F) (hG : IsAlgebraicSpace G) (hH : IsAlgebraicSpace H) :
    IsAlgebraicSpace (pullback f g) := by
  sorry

/-- The fibre product in `AlgSpace`. -/
def AlgSpace.pullbackObj {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) : AlgSpace.{u} :=
  ⟨pullback (isAlgebraicSpace.ι.map f) (isAlgebraicSpace.ι.map g),
    isAlgebraicSpace_pullback _ _ F.property G.property H.property⟩

/-- The second projection of the fibre product. -/
def AlgSpace.pullbackSnd {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) :
    AlgSpace.pullbackObj f g ⟶ G :=
  ObjectProperty.homMk (pullback.snd (f.hom : F.obj ⟶ H.obj) (g.hom : G.obj ⟶ H.obj))

/-- A property of scheme morphisms, read on a square of étale atlases.
Stacks, Lemma 67.22.1 (03MJ) and Definition 67.22.2 (04RD). -/
def EtaleLocal (P : MorphismProperty Scheme.{u}) {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  ∃ (U V : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj) (b : yoneda.obj V ⟶ G.obj) (h : U ⟶ V),
    EtaleAtlas a ∧ MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) b ∧
      a ≫ isAlgebraicSpace.ι.map f = yoneda.map h ≫ b ∧ P h

/-- For `P` étale local on source and target and stable under base change, `P` passes to the
specified second projection of a fibre product. Stacks, §67.22 (03MJ, 04RD). -/
theorem EtaleLocal.baseChange (P : MorphismProperty Scheme.{u})
    [P.IsLocalAtSource Scheme.etalePrecoverage] [P.IsLocalAtTarget Scheme.etalePrecoverage]
    [P.IsStableUnderBaseChange] {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H)
    (hf : EtaleLocal P f) : EtaleLocal P (AlgSpace.pullbackSnd f g) := by
  sorry

end Spaces

/-! ### §1.13–§1.17 Group spaces, torsors and quotients -/

namespace Groups

open Spaces _root_.CategoryTheory.MonoidalCategory _root_.CategoryTheory.CartesianMonoidalCategory

noncomputable instance (A : SchemePresheaf.{u}) : CartesianMonoidalCategory (Over A) :=
  Over.cartesianMonoidalCategory A

/-- A group algebraic space over `S`: a group object of `Over h_S` whose underlying presheaf is
an algebraic space. Stacks, Definition 78.5.1 (043H). -/
structure GroupSpace (S : Scheme.{u}) where
  obj : Over (yoneda.obj S)
  isSpace : IsAlgebraicSpace obj.left
  [grp : GrpObj obj]

attribute [instance] GroupSpace.grp

/-- An action of a group space: Mathlib's `ModObj`. Stacks, Definition 78.8.1 (043Q). -/
abbrev Action {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) : Type _ :=
  ModObj G.obj X

/-- The action morphism `G × X → X`. -/
def act {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X] :
    G.obj ⊗ X ⟶ X := ModObj.smul (M := G.obj) (X := X)

/-- Freeness on `T`-points. Stacks, Definition 78.8.2. -/
def Action.IsFree {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] : Prop :=
  ∀ (T : Over (yoneda.obj S)) (g : T ⟶ G.obj) (x : T ⟶ X),
    lift g x ≫ act G X = x → g = toUnit T ≫ MonObj.one

/-- Free iff `(a, pr₂) : G × X → X × X` is a monomorphism. Stacks, Lemma 78.8.3 (06P9). -/
theorem Action.free_iff_mono {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] :
    Action.IsFree G X ↔ Mono (lift (act G X) (snd G.obj X)) := by
  sorry

/-- Torsors: algebraic spaces with a simply transitive action, fppf locally trivial.
Stacks, Definitions 78.9.1 and 78.9.3 (04TY). -/
structure IsTorsor {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] : Prop where
  isSpace : IsAlgebraicSpace P.left
  pseudo : IsIso (lift (act G P) (snd G.obj P))
  locallyTrivial : ∃ (ι : Type u) (Si : ι → Scheme.{u}) (f : ∀ i, Si i ⟶ S),
    Sieve.ofArrows Si f ∈ Scheme.fppfTopology S ∧
      ∀ i, ∃ σ : yoneda.obj (Si i) ⟶ P.left, σ ≫ P.hom = yoneda.map (f i)

/-- A torsor is trivial iff it has a section. -/
theorem Torsor.trivial_iff_section {S : Scheme.{u}} (G : GroupSpace S)
    (P : Over (yoneda.obj S)) [ModObj G.obj P] (h : IsTorsor G P) :
    Nonempty (G.obj ≅ P) ↔ ∃ σ : yoneda.obj S ⟶ P.left, σ ≫ P.hom = 𝟙 _ := by
  sorry

/-- An fppf sheaf with a pseudo-torsor action, trivial on an fppf cover, is an algebraic space
and a torsor. Stacks, Lemma 80.11.1 (04SK); Poonen, Theorem 6.5.10 (i). -/
theorem torsorRepresentability {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] (hP : Presheaf.IsSheaf Scheme.fppfTopology P.left)
    (hpseudo : IsIso (lift (act G P) (snd G.obj P)))
    (hloc : ∃ (ι : Type u) (Si : ι → Scheme.{u}) (f : ∀ i, Si i ⟶ S),
      Sieve.ofArrows Si f ∈ Scheme.fppfTopology S ∧
        ∀ i, ∃ σ : yoneda.obj (Si i) ⟶ P.left, σ ≫ P.hom = yoneda.map (f i)) :
    IsAlgebraicSpace P.left ∧ IsTorsor G P := by
  sorry

/-- Artin's bootstrap: an fppf sheaf with a flat, locally finitely presented, fppf-surjective
map from an algebraic space, representable by algebraic spaces, is an algebraic space.
Stacks, Theorem 80.10.1 (04S6). -/
theorem artinBootstrap (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    (U : SchemePresheaf.{u}) (hU : IsAlgebraicSpace U) (a : U ⟶ F)
    (ha : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F), IsAlgebraicSpace (pullback a y))
    (hflat : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F) (V : Scheme.{u})
      (b : yoneda.obj V ⟶ pullback a y), EtaleAtlas b →
        ∃ h : V ⟶ T, yoneda.map h = b ≫ pullback.snd a y ∧ Flat h ∧
          LocallyOfFinitePresentation h)
    (hsurj : Presheaf.IsLocallySurjective Scheme.fppfTopology a) :
    IsAlgebraicSpace F := by
  sorry

end Groups

/-! ### §1.24 Galois descent -/

namespace GaloisGerbs

open scoped _root_.TensorProduct
open Topology

/-- A semilinear action of `Gal(L/k)` on an `L`-algebra with open stabilizers of elements.
Milne, Algebraic Groups, A.64, pp. 580–581. -/
structure ContinuousSemilinearAction (k L A : Type u) [Field k] [Field L]
    [Algebra k L] [IsGalois k L] [CommRing A] [Algebra L A] where
  ρ : (L ≃ₐ[k] L) →* RingAut A
  semilinear : ∀ σ c a, ρ σ (c • a) = σ c • ρ σ a
  open_stabilizer : ∀ a : A, IsOpen {σ : L ≃ₐ[k] L | ρ σ a = a}

/-- Galois descent for affine schemes: a continuous semilinear action descends to the invariant
algebra, with an equivariant scalar-extension isomorphism. Milne, A.64. -/
theorem galois_descent_affine (k L A : Type u) [Field k] [Field L]
    [Algebra k L] [IsGalois k L] [CommRing A] [Algebra L A]
    (act : ContinuousSemilinearAction k L A) :
    ∃ (B : Type u) (_ : CommRing B) (_ : Algebra k B) (e : (L ⊗[k] B) ≃ₐ[L] A),
      ∀ σ c b, act.ρ σ (e (c ⊗ₜ[k] b)) = e (σ c ⊗ₜ[k] b) := by
  sorry

end GaloisGerbs

end Layer1

/-! ## Layer 2: sites and scheme cohomology -/

section Layer2

universe v w

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.TensorProduct

/-! ### §2.1 Sheaf functors of the small étale sites -/

section EtaleSheafFunctors

variable {X Y : Scheme.{u}} (f : X ⟶ Y) (A : Type w) [Category.{u} A]

/-- `f_*` on sheaves on the small étale sites: precomposition with base change. -/
abbrev Scheme.etalePushforward :
    Sheaf (Scheme.smallEtaleTopology X) A ⥤ Sheaf (Scheme.smallEtaleTopology Y) A :=
  (Scheme.Hom.etaleSite f).sheafPushforwardContinuous A (Scheme.smallEtaleTopology Y)
    (Scheme.smallEtaleTopology X)

/-- `f_*` has a left adjoint for coefficients with colimits of size `u` and sheafification on
`X_ét`; no Noetherian or separatedness hypothesis. Stacks, Lemma 34.4.17 (021I). -/
theorem Scheme.isRightAdjoint_etalePushforward [HasWeakSheafify (Scheme.smallEtaleTopology X) A]
    [HasColimitsOfSize.{u, u} A] : (Scheme.etalePushforward f A).IsRightAdjoint := by
  sorry

attribute [instance] Scheme.isRightAdjoint_etalePushforward

/-- `f^{-1}`: pullback of sheaves on the small étale sites, left adjoint to `f_*`. -/
abbrev Scheme.etalePullback [HasWeakSheafify (Scheme.smallEtaleTopology X) A]
    [HasColimitsOfSize.{u, u} A] :
    Sheaf (Scheme.smallEtaleTopology Y) A ⥤ Sheaf (Scheme.smallEtaleTopology X) A :=
  (Scheme.Hom.etaleSite f).sheafPullback A (Scheme.smallEtaleTopology Y)
    (Scheme.smallEtaleTopology X)

/-- `f^{-1}` is exact on Grothendieck abelian coefficients. -/
theorem Scheme.preservesFiniteLimits_etalePullback [Abelian A] [IsGrothendieckAbelian.{u} A]
    [HasSheafify (Scheme.smallEtaleTopology X) A] [HasColimitsOfSize.{u, u} A] :
    PreservesFiniteLimits (Scheme.etalePullback f A) := by
  sorry

end EtaleSheafFunctors

/-! ### §2.10 The étale and pro-étale sites -/

/-- The inclusion of the small étale site into the pro-étale site: étale morphisms are weakly
étale. -/
def Scheme.toProEt (X : Scheme.{u}) : X.Etale ⥤ X.ProEt :=
  MorphismProperty.Over.changeProp (Q := ⊤) (Q' := ⊤) X etale_le_weaklyEtale le_rfl

/-- The inclusion is continuous: it defines the morphism of sites `ν : X_proét → X_ét`.
Bhatt–Scholze 2014, §5.1. -/
theorem Scheme.toProEt_isContinuous (X : Scheme.{u}) :
    (Scheme.toProEt X).IsContinuous (Scheme.smallEtaleTopology X) (Scheme.ProEt.topology X) := by
  sorry

attribute [instance] Scheme.toProEt_isContinuous

/-! ### §2.5–§2.7 Vanishing theorems and local cohomology -/

namespace SiteCohomology

/-- Grothendieck vanishing on a Noetherian space of dimension `≤ d`.
Stacks, Proposition 20.20.7 (02UZ). -/
theorem noetherianSpace_vanishing {X : TopCat.{u}} [TopologicalSpace.NoetherianSpace X] (d : ℕ)
    (hd : topologicalKrullDim X ≤ d) (F : TopCat.Sheaf AddCommGrpCat.{u} X) (p : ℕ)
    (hp : d < p) : Subsingleton (Sheaf.H.{u} F p) := by
  sorry

end SiteCohomology

namespace QCoh

open TauCeti.AlgebraicGeometry

/-- Serre's criterion: a quasi-compact scheme on which `H¹` of every quasi-coherent module
vanishes is affine. Stacks, Lemmas 30.3.1, 30.3.2 and 30.3.4 (01XE). -/
theorem isAffine_of_H1_vanishing (X : Scheme.{u}) [CompactSpace X]
    (h : ∀ (I : X.Modules) [I.IsQuasicoherent], Subsingleton (Scheme.Modules.Cohomology I 1)) :
    IsAffine X := by
  sorry

end QCoh

namespace Supports

/-- Flat base change of local cohomology over Noetherian rings, as the existence of a `B`-linear
isomorphism; the natural comparison map is a target of README.md §2.7.
Stacks, Lemmas 47.10.3 and 47.9.7. -/
theorem nonempty_localCohomology_flat_baseChange (A B : Type u) [CommRing A] [CommRing B]
    [Algebra A B] [IsNoetherianRing A] [IsNoetherianRing B] [Module.Flat A B]
    (I : Ideal A) (M : ModuleCat.{u} A) (q : ℕ) :
    Nonempty ((B ⊗[A] (localCohomology I q).obj M) ≃ₗ[B]
      (localCohomology (I.map (algebraMap A B)) q).obj (ModuleCat.of B (B ⊗[A] M))) := by
  sorry

end Supports

/-! ### §2.11 and §2.16 Artin–Schreier and Tsen -/

namespace Etale

/-- The constant étale sheaf `ℤ/p`. -/
def constZMod (X : Scheme.{u}) (p : ℕ) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  (constantSheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}).obj
    (AddCommGrpCat.of (ULift.{u} (ZMod p)))

/-- On an affine scheme of characteristic `p`, `H^q(X_ét, ℤ/p) = 0` for `q ≥ 2`.
Stacks, Lemmas 59.63.1–59.63.6 (0A3J). -/
theorem artinSchreier_vanishing (p : ℕ) [Fact p.Prime] (X : Scheme.{u}) [IsAffine X]
    [CharP Γ(X, ⊤) p] (q : ℕ) (hq : 2 ≤ q) : Subsingleton ((constZMod X p).H q) := by
  sorry

/-- Tsen: the function field of a curve over an algebraically closed field has trivial Brauer
group. Stacks, Theorems 59.67.8 and 59.67.10 (0A2M). -/
theorem brauer_functionField_curve_trivial (k K : Type u) [Field k] [IsAlgClosed k] [Field K]
    [Algebra k K] (t : K) (ht : Transcendental k t)
    (halg : Algebra.IsAlgebraic (IntermediateField.adjoin k {t}) K)
    (x : BrauerGroup.{u, u} K) : x = 1 := by
  sorry

end Etale

/-! ### §2.12–§2.13 The Nisnevich topology and distinguished squares -/

namespace Nisnevich

/-- A family of étale maps is a Nisnevich covering if every point has a preimage with trivial
residue extension. Morel–Voevodsky, §3.1, Definition 1.2. -/
def IsNisnevichCovering {S : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}}
    (f : ∀ i, X i ⟶ S) : Prop :=
  (∀ i, Etale (f i)) ∧ ∀ s : S, ∃ i, ∃ x : X i, f i x = s ∧
    Function.Bijective (Scheme.Hom.residueFieldMap (f i) x).hom

/-- The Nisnevich precoverage. -/
def nisnevichPrecoverage : Precoverage Scheme.{u} where
  coverings S := {R | ∃ (ι : Type u) (X : ι → Scheme.{u}) (f : ∀ i, X i ⟶ S),
    R = Presieve.ofArrows X f ∧ IsNisnevichCovering f}

/-- The big Nisnevich topology. -/
def nisnevichTopology : GrothendieckTopology Scheme.{u} :=
  nisnevichPrecoverage.toGrothendieck

theorem zariskiTopology_le_nisnevichTopology :
    Scheme.zariskiTopology.{u} ≤ nisnevichTopology := by sorry

theorem nisnevichTopology_le_etaleTopology :
    nisnevichTopology.{u} ≤ Scheme.etaleTopology := by sorry

/-- An elementary distinguished square: an open immersion `j`, an étale `p`, and `p` an
isomorphism over the reduced complement of `j`. Morel–Voevodsky, §3.1, Definition 1.3. -/
structure ElementaryDistinguishedSquare (X : Scheme.{u}) where
  U : Scheme.{u}
  V : Scheme.{u}
  j : U ⟶ X
  p : V ⟶ X
  [isOpenImmersion : IsOpenImmersion j]
  [etale : Etale p]
  Z : X.IdealSheafData
  Z_support : (Z.support : Set X) = (Set.range j)ᶜ
  Z_reduced : IsReduced Z.subscheme
  isIso_baseChange : IsIso (pullback.fst Z.subschemeι p)

namespace ElementaryDistinguishedSquare

attribute [instance] isOpenImmersion etale

/-- Every Nisnevich sheaf sends an elementary distinguished square to a pullback square: the sheaf
condition for the covering `{j, p}`. Morel–Voevodsky, §3.1, Lemma 1.6 and Remark 1.7. -/
theorem isPullback_of_isSheaf {X : Scheme.{u}} (S : ElementaryDistinguishedSquare X)
    (F : Sheaf nisnevichTopology.{u} (Type u)) :
    IsPullback (F.obj.map S.j.op) (F.obj.map S.p.op) (F.obj.map (pullback.fst S.j S.p).op)
      (F.obj.map (pullback.snd S.j S.p).op) := by
  sorry

end ElementaryDistinguishedSquare

end Nisnevich

/-! ### §2.17 Replete topoi -/

namespace Proetale

/-- Repleteness (limits of towers of epimorphisms have epimorphic legs), Bhatt–Scholze 2014,
Definition 3.1.1: Tau Ceti's class `TauCeti.IsReplete`, under the name by which
EnhancedDerivedSheaves imports it. -/
abbrev IsReplete (T : Type w) [Category.{v} T] : Prop := TauCeti.IsReplete T

/-- The pro-étale topos is replete. Bhatt–Scholze 2014, Proposition 4.2.8. -/
theorem isReplete_proetale (X : Scheme.{u}) :
    IsReplete (Sheaf (Scheme.ProEt.topology X) (Type u)) := by
  sorry

end Proetale

/-! ### §2.18 Quasi-coherent derived categories -/

namespace Coherent

instance instHasDerivedCategoryModules (X : Scheme.{u}) : HasDerivedCategory X.Modules :=
  HasDerivedCategory.standard _

/-- `D_QCoh(O_X)`: complexes of `O_X`-modules with quasi-coherent cohomology sheaves.
Stacks, Section 36.3 (06YZ). -/
def DQCoh (X : Scheme.{u}) : Type (u + 1) :=
  ObjectProperty.FullSubcategory (fun K : DerivedCategory X.Modules =>
    ∀ n : ℤ, ((DerivedCategory.homologyFunctor X.Modules n).obj K).IsQuasicoherent)

instance (X : Scheme.{u}) : Category.{u + 1} (DQCoh X) := by
  unfold DQCoh; infer_instance

/-- For `X = Spec A`, `D(A)` and `D_QCoh(O_X)` are equivalent, for every model of the derived
category of `A`-modules. The equivalence induced by `M ↦ M~` is a target of README.md §2.18; its
statement needs exactness of Mathlib's `tilde.functor`, which the pins do not record.
Stacks, Lemma 36.3.5 (06Z0). -/
theorem DQCoh.nonempty_affineEquiv (A : CommRingCat.{u}) [HasDerivedCategory (ModuleCat.{u} A)] :
    Nonempty (DerivedCategory (ModuleCat.{u} A) ≌ DQCoh (Spec A)) := by
  sorry

end Coherent

/-! ### §2.22 Azumaya algebras -/

/-- An Azumaya algebra of constant positive degree `d` splits as `d × d` matrices over a
faithfully flat étale algebra. Grothendieck, Brauer I, Théorème 5.1(ii)–(iii), p. 210. -/
theorem _root_.IsAzumaya.exists_etale_matrix_splitting
    (A R : Type u) [CommRing A] [Ring R] [Algebra A R] [IsAzumaya A R]
    (d : ℕ) (hd : 0 < d)
    (hrank : Module.rankAtStalk (R := A) R = fun _ => d * d) :
    ∃ (B : Type u) (_ : CommRing B) (_ : Algebra A B),
      Algebra.Etale A B ∧ Module.FaithfullyFlat A B ∧
        Nonempty (TensorProduct A B R ≃ₐ[B] Matrix (Fin d) (Fin d) B) := by
  sorry

/-- A finite jointly surjective family of affine étale splitting charts gives a splitting over
the product algebra, which is étale and faithfully flat. Grothendieck, Brauer I, Théorème 5.1. -/
theorem _root_.IsAzumaya.etale_matrix_splitting_of_finite_cover
    (A R : Type u) [CommRing A] [Ring R] [Algebra A R]
    (d : ℕ) (ι : Type u) [Finite ι] (B : ι → Type u)
    [∀ i, CommRing (B i)] [∀ i, Algebra A (B i)] [∀ i, Algebra.Etale A (B i)]
    (hcover : ∀ p : PrimeSpectrum A, ∃ i, ∃ q : PrimeSpectrum (B i),
      q.asIdeal.comap (algebraMap A (B i)) = p.asIdeal)
    (hsplit : ∀ i, Nonempty (TensorProduct A (B i) R ≃ₐ[B i]
      Matrix (Fin d) (Fin d) (B i))) :
    Algebra.Etale A (∀ i, B i) ∧ Module.FaithfullyFlat A (∀ i, B i) ∧
      Nonempty (TensorProduct A (∀ i, B i) R ≃ₐ[∀ i, B i]
        Matrix (Fin d) (Fin d) (∀ i, B i)) := by
  sorry

namespace Brauer

/-- For finite projective algebras, Azumaya means positive rank in every fibre together with
`A ⊗ Aᵒᵖ ≅ End(A)`. Grothendieck, Brauer I, Théorème 5.1. -/
theorem isAzumaya_iff_positive_fibres_mulLeftRight (R A : Type u)
    [CommRing R] [Ring A] [Algebra R A] [Module.Finite R A] [Module.Projective R A] :
    IsAzumaya R A ↔
      (∀ p : PrimeSpectrum R,
        0 < Module.finrank p.asIdeal.ResidueField (TensorProduct R p.asIdeal.ResidueField A)) ∧
      Function.Bijective (AlgHom.mulLeftRight R A) := by
  sorry

end Brauer

end Layer2

/-! ## Layer 3: curves, divisors and Picard objects -/

section Layer3

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.CategoryTheory.MonoidalCategory

namespace Curve

open TauCeti.AlgebraicGeometry

variable (k : Type u) [Field k]

/-- `dim_k Hⁱ(X, M)` for Tau Ceti's `Scheme.Modules.Cohomology` (`0` if infinite-dimensional). -/
abbrev cohomologyDim (X : Scheme.{u}) [X.Over (Spec (.of k))] (M : X.Modules) (i : ℕ) : ℕ :=
  Module.finrank k (Scheme.Modules.Cohomology M i)

/-- The structure sheaf as a module over itself. -/
abbrev structureModule (X : Scheme.{u}) : X.Modules := _root_.SheafOfModules.unit X.ringCatSheaf

/-- A curve is affine and not proper, or proper and not affine. Stacks, Lemmas 0A27 and 0A26. -/
theorem isAffine_or_isProper (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X]
    [IsSeparated (X ↘ Spec (.of k))] [LocallyOfFiniteType (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X = 1) :
    (IsAffine X ∧ ¬ IsProper (X ↘ Spec (.of k))) ∨
      (¬ IsAffine X ∧ IsProper (X ↘ Spec (.of k))) := by
  sorry

/-- Base change along a field extension `k → K`. -/
abbrev baseChange (X : Scheme.{u}) [X.Over (Spec (.of k))] (K : Type u) [Field K]
    [Algebra k K] : Scheme.{u} :=
  pullback (X ↘ Spec (.of k)) (Spec.map (CommRingCat.ofHom (algebraMap k K)))

instance (X : Scheme.{u}) [X.Over (Spec (.of k))] (K : Type u) [Field K] [Algebra k K] :
    (baseChange k X K).Over (Spec (.of K)) := ⟨pullback.snd _ _⟩

/-- A proper curve with `H⁰(O) = k` keeps `H⁰ = K` and its genus after any field extension.
Stacks, Lemma 0BY9. -/
theorem genus_baseChange (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    [FiniteDimensional k (Scheme.Modules.Cohomology (InvertibleSheaf.trivial X).obj 1)]
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1)
    (K : Type u) [Field K] [Algebra k K]
    [FiniteDimensional K
      (Scheme.Modules.Cohomology (InvertibleSheaf.trivial (baseChange k X K)).obj 1)] :
    cohomologyDim K (baseChange k X K) (structureModule _) 0 = 1 ∧
      (baseChange k X K).genus K = X.genus k := by
  sorry

/-- Additivity of Tau Ceti's degree in short exact sequences of vector bundles of constant
rank, on every proper scheme of dimension at most one over `k` (reducible and nonreduced
included). Stacks, Lemma 33.44.3 (0AYS). -/
theorem vectorBundleDegree_add_of_shortExact (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X ≤ 1) {r₁ r₂ r₃ : ℕ}
    {E₁ : FiniteLocallyFreeSheaf.FixedRank X r₁} {E₂ : FiniteLocallyFreeSheaf.FixedRank X r₂}
    {E₃ : FiniteLocallyFreeSheaf.FixedRank X r₃} {f : E₁.obj.obj ⟶ E₂.obj.obj}
    {g : E₂.obj.obj ⟶ E₃.obj.obj} {w : f ≫ g = 0} (hS : (ShortComplex.mk f g w).ShortExact)
    (hr : r₂ = r₁ + r₃) :
    FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree k E₂ =
      FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree k E₁ +
        FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree k E₃ := by
  sorry

/-- Pullback multiplies degree by the function-field degree for nonconstant maps of
proper integral curves. A dominant `f` between proper integral curves is proper and
quasi-finite, hence finite, and Mathlib's rank `f.finrank (genericPoint Y)` of `f_* 𝒪_X` at the
generic point is `[K(X) : K(Y)]`. Stacks, Lemma 33.44.11 (0AYZ). -/
theorem vectorBundleDegree_pullback (X Y : Scheme.{u})
    [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] [IsIntegral X] [IsIntegral Y]
    [IsProper (X ↘ Spec (.of k))] [IsProper (Y ↘ Spec (.of k))]
    (hX : topologicalKrullDim X = 1) (hY : topologicalKrullDim Y = 1)
    (f : X ⟶ Y) [IsDominant f] (hf : f ≫ (Y ↘ Spec (.of k)) = (X ↘ Spec (.of k)))
    {r : ℕ} (E : FiniteLocallyFreeSheaf.FixedRank Y r) :
    FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree k
        ((FiniteLocallyFreeSheaf.FixedRank.pullback f).obj E) =
      f.finrank (genericPoint Y) * FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree k E := by
  sorry

/-- A proper geometrically integral scheme over `k` has `H⁰(X, O_X) = k`.
Stacks, Lemma 33.9.3 (0BUG), part (7). -/
theorem cohomologyDim_zero_structureModule (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))] :
    cohomologyDim k X (structureModule X) 0 = 1 := by
  sorry

/-- Riemann–Hurwitz for finite étale maps of smooth proper curves: `g_X − 1 = n (g_Y − 1)`.
Stacks, Lemmas 0C1C, 0C1D and 0C1F. -/
theorem genus_of_finite_etale {X Y : Scheme.{u}} [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [IsProper (Y ↘ Spec (.of k))] [Smooth (Y ↘ Spec (.of k))]
    (hXd : topologicalKrullDim X = 1) (hYd : topologicalKrullDim Y = 1)
    [FiniteDimensional k (Scheme.Modules.Cohomology (InvertibleSheaf.trivial X).obj 1)]
    [FiniteDimensional k (Scheme.Modules.Cohomology (InvertibleSheaf.trivial Y).obj 1)]
    (hX : cohomologyDim k X (structureModule X) 0 = 1)
    (hY : cohomologyDim k Y (structureModule Y) 0 = 1) (f : X ⟶ Y) [IsFinite f] [Etale f]
    (hf : f ≫ Y ↘ Spec (.of k) = X ↘ Spec (.of k))
    (n : ℕ) (hn : ∀ y : Y, f.finrank y = n) :
    (X.genus k : ℤ) - 1 = n * ((Y.genus k : ℤ) - 1) := by
  sorry

end Curve

namespace Picard

/-- On an affine scheme, the group of line-bundle classes is isomorphic to Mathlib's
`CommRing.Pic`, as groups; the natural isomorphism `M ↦ M~` is a target of README.md §3.4.
Stacks, Lemma 26.7.5 (01IB) with Lemma 15.119.2 (0B8I). -/
theorem nonempty_lineBundleClass_spec_mulEquiv_pic (R : Type u) [CommRing R] :
    Nonempty (TauCeti.AlgebraicGeometry.LineBundleClass (Spec (.of R)) ≃* CommRing.Pic R) := by
  sorry

end Picard

end Layer3

/-! ## Layer 4: deformations, formal schemes, models and alterations -/

section Layer4

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry

namespace Formal

/-! ### §4.1 Thickenings and the infinitesimal lifting criterion -/

open TauCeti.AlgebraicGeometry (IsThickening IsFirstOrderThickening)

/-- Lifts exist along affine first-order thickenings (Tau Ceti's `IsFirstOrderThickening`) over
the base.
Stacks, Definition 37.11.1 (02H0). -/
class FormallySmooth {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  exists_lift : ∀ {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S), g ≫ f = i ≫ h → ∃ l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h

/-- Unique lifts along affine first-order thickenings. Stacks, Definition 37.8.1 (02HG). -/
class FormallyEtale {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  existsUnique_lift : ∀ {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S), g ≫ f = i ≫ h → ∃! l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h

/-- Infinitesimal lifting criterion. Stacks, Lemma 37.11.7 (02H6). -/
theorem smooth_iff_formallySmooth {X S : Scheme.{u}} (f : X ⟶ S)
    [LocallyOfFinitePresentation f] : Smooth f ↔ FormallySmooth f := by
  sorry

/-- Stacks, Lemma 37.8.10 (02HM). -/
theorem etale_iff_formallyEtale {X S : Scheme.{u}} (f : X ⟶ S)
    [LocallyOfFinitePresentation f] : Etale f ↔ FormallyEtale f := by
  sorry

/-! ### §4.7–§4.10 Adic thickening systems, existence and algebraization -/

/-- An adic ring: complete and separated for a finitely generated ideal.
Stacks, Definition 15.37.1 (07E8). -/
structure AdicRing where
  carrier : Type u
  [commRing : CommRing carrier]
  ideal : Ideal carrier
  fg : ideal.FG
  [complete : IsAdicComplete ideal carrier]

attribute [instance] AdicRing.commRing AdicRing.complete

/-- The level maps `X 0 → X n` of a tower. -/
def levelMap (X : ℕ → Scheme.{u}) (ι : ∀ n, X n ⟶ X (n + 1)) : ∀ n, X 0 ⟶ X n
  | 0 => 𝟙 _
  | n + 1 => levelMap X ι n ≫ ι n

/-- A tower of thickenings in which `X n` is cut out in `X (n + 1)` by the `(n + 1)`-st power
of the ideal of `X 0`. Stacks, Definition 87.9.9 (0AIF). -/
structure AdicThickeningSystem where
  X : ℕ → Scheme.{u}
  ι : ∀ n, X n ⟶ X (n + 1)
  isThickening : ∀ n, IsThickening (ι n)
  adic : ∀ n, (ι n).ker = (levelMap X ι (n + 1)).ker ^ (n + 1)

/-- Coherent formal modules: finitely presented modules on the levels with compatible
restrictions. Stacks, §30.23. -/
structure Scheme.CoherentFormalModule (𝔛 : AdicThickeningSystem.{u}) where
  F : ∀ n, (𝔛.X n).Modules
  fp : ∀ n, (F n).IsFinitePresentation
  iso : ∀ n, (Scheme.Modules.pullback (𝔛.ι n)).obj (F (n + 1)) ≅ F n

/-- Grothendieck's existence theorem: over a complete Noetherian adic ring, every coherent formal
module on the completion of a proper scheme along its closed fibre is the completion of a
coherent module. The completion is an adic thickening system `𝔛` with closed immersions
`j n : 𝔛.X n → X` of ideal `I^{n+1}`, compatible with the transitions, so that `𝔛.X n` is
`V(I^{n+1})`. Stacks, Proposition 30.25.4 (088C) and Theorem 30.27.1 (088E). -/
theorem grothendieck_existence (A : AdicRing.{u}) [IsNoetherianRing A.carrier] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of A.carrier)) [IsProper f] (I : X.IdealSheafData)
    (hI : I.support = (Set.range (pullback.fst f (Spec.map (CommRingCat.ofHom
      (Ideal.Quotient.mk A.ideal)))) : Set X))
    (𝔛 : AdicThickeningSystem.{u}) (j : ∀ n, 𝔛.X n ⟶ X) [∀ n, IsClosedImmersion (j n)]
    (hj : ∀ n, (j n).ker = I ^ (n + 1)) (hjι : ∀ n, 𝔛.ι n ≫ j (n + 1) = j n)
    (𝓜 : Scheme.CoherentFormalModule 𝔛) :
    ∃ (M : X.Modules) (_ : M.IsFinitePresentation),
      ∃ e : ∀ n, (Scheme.Modules.pullback (j n)).obj M ≅ 𝓜.F n,
        ∀ n, (Scheme.Modules.pullback (𝔛.ι n)).map (e (n + 1)).hom ≫ (𝓜.iso n).hom =
          ((Scheme.Modules.pullbackComp (𝔛.ι n) (j (n + 1))).app M ≪≫
            (Scheme.Modules.pullbackCongr (hjι n)).app M).hom ≫ (e n).hom := by
  sorry

/-- The closed immersion `Spec (A/I^{n+1}) → Spec A`. -/
abbrev quotMap (A : AdicRing.{u}) (n : ℕ) :
    Spec (CommRingCat.of (A.carrier ⧸ A.ideal ^ (n + 1))) ⟶ Spec (CommRingCat.of A.carrier) :=
  Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk (A.ideal ^ (n + 1))))

/-- The closed immersion `Spec (A/I^{n+1}) → Spec (A/I^{n+2})`. -/
abbrev quotIncl (A : AdicRing.{u}) (n : ℕ) :
    Spec (CommRingCat.of (A.carrier ⧸ A.ideal ^ (n + 1))) ⟶
      Spec (CommRingCat.of (A.carrier ⧸ A.ideal ^ (n + 2))) :=
  Spec.map (CommRingCat.ofHom (Ideal.Quotient.factor
    (Ideal.pow_le_pow_right (by omega : n + 1 ≤ n + 2))))

/-- The transition `X_n → X_{n+1}` between the reductions of an `A`-scheme. -/
def levelIncl (A : AdicRing.{u}) {X : Scheme.{u}} (fX : X ⟶ Spec (CommRingCat.of A.carrier))
    (n : ℕ) : pullback fX (quotMap A n) ⟶ pullback fX (quotMap A (n + 1)) :=
  pullback.map fX (quotMap A n) fX (quotMap A (n + 1)) (𝟙 X) (quotIncl A n) (𝟙 _)
    (by simp) (by
      simp only [quotIncl, quotMap, Category.comp_id, ← Spec.map_comp, ← CommRingCat.ofHom_comp,
        Ideal.Quotient.factor_comp_mk])

/-- Algebraization of morphisms: a compatible family of morphisms between the reductions of a
proper `X` and a separated finite-type `Y` comes from a unique morphism.
Stacks, Lemmas 30.28.1 (0899), 30.28.2 (09ZT) and 30.28.3 (0A42). -/
theorem algebraize_hom (A : AdicRing.{u}) [IsNoetherianRing A.carrier]
    {X Y : Scheme.{u}} (fX : X ⟶ Spec (CommRingCat.of A.carrier))
    (fY : Y ⟶ Spec (CommRingCat.of A.carrier)) [IsProper fX] [IsSeparated fY]
    [LocallyOfFiniteType fY]
    (g : ∀ n, pullback fX (quotMap A n) ⟶ pullback fY (quotMap A n))
    (hg : ∀ n, g n ≫ pullback.snd fY (quotMap A n) = pullback.snd fX (quotMap A n))
    (hcompat : ∀ n, levelIncl A fX n ≫ g (n + 1) = g n ≫ levelIncl A fY n) :
    ∃! G : X ⟶ Y, ∃ h : G ≫ fY = fX, ∀ n,
      pullback.map fX (quotMap A n) fY (quotMap A n) G (𝟙 _) (𝟙 _)
        (by rw [Category.comp_id, h]) (by simp) = g n := by
  sorry

/-! ### §4.11–§4.17 Modifications, alterations, regularity and normal crossings -/

/-- Proper dominant morphisms finite over a nonempty open. Stacks, Definition 29.52.12 (0AB0). -/
class IsAlteration {S' S : Scheme.{u}} (f : S' ⟶ S) : Prop where
  isProper : IsProper f
  isDominant : IsDominant f
  generically_finite : ∃ U : S.Opens, (U : Set S).Nonempty ∧ IsFinite (f ∣_ U)

/-- The extension of function fields `K(S) → K(S')` of an alteration of integral schemes. -/
def IsAlteration.functionFieldMap {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
    [IsIntegral S'] [IsAlteration f] : S.functionField ⟶ S'.functionField :=
  S.presheaf.stalkSpecializes (show f (genericPoint S') ⤳ genericPoint S by
    have : IsDominant f := IsAlteration.isDominant
    have h := (genericPoint_spec S').image f.continuous
    rw [Set.image_univ, (Scheme.Hom.denseRange f).closure_range] at h
    exact h.specializes (Set.mem_univ _)) ≫
    f.stalkMap (genericPoint S')

/-- Generically étale: the function-field extension is separable. -/
def IsAlteration.IsGenericallyEtale {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
    [IsIntegral S'] [IsAlteration f] : Prop :=
  letI := (IsAlteration.functionFieldMap f).hom.toAlgebra
  Algebra.IsSeparable S.functionField S'.functionField

/-- Generic flatness. Stacks, Proposition 29.28.1 (052A). -/
theorem generic_flatness {X S : Scheme.{u}} (f : X ⟶ S) [IsIntegral S] [LocallyOfFiniteType f]
    [QuasiCompact f] : ∃ U : S.Opens, Dense (U : Set S) ∧ Flat (f ∣_ U) := by
  sorry

/-- Strict normal crossings data: finitely many components. de Jong 1996, 2.4. -/
structure SNCData (X : Scheme.{u}) where
  ι : Type u
  [fintype : Fintype ι]
  comp : ι → X.IdealSheafData

attribute [instance] SNCData.fintype

/-- The partial intersection `D_J`. -/
def SNCData.stratum {X : Scheme.{u}} (C : SNCData X) (J : Finset C.ι) : X.IdealSheafData :=
  ⨆ j ∈ J, C.comp j

/-- The divisor `∏ D_i`. -/
def SNCData.divisor {X : Scheme.{u}} (C : SNCData X) : X.IdealSheafData :=
  ∏ i, C.comp i

/-- Every nonempty partial intersection is regular of the expected codimension. -/
def SNCData.IsTransverse {X : Scheme.{u}} (C : SNCData X) : Prop :=
  ∀ J : Finset C.ι, J.Nonempty →
    TauCeti.AlgebraicGeometry.IsRegular (C.stratum J).subscheme ∧
    ∀ y : (C.stratum J).subscheme,
      ringKrullDim (X.presheaf.stalk ((C.stratum J).subschemeι y)) =
        ringKrullDim ((C.stratum J).subscheme.presheaf.stalk y) + (J.card : WithBot ℕ∞)

/-- Strict normal crossings divisors. de Jong 1996, 2.4. -/
def IsStrictNormalCrossings {X : Scheme.{u}} (D : X.IdealSheafData) : Prop :=
  ∃ C : SNCData X, D = C.divisor ∧
    (∀ x ∈ (D.support : Set X), IsRegularLocalRing (X.presheaf.stalk x)) ∧ C.IsTransverse

/-! ### §4.18–§4.20 de Jong's alterations -/

namespace DeJong

open scoped _root_.TensorProduct

/-- An integral variety acquires, after a finite field extension, a geometrically integral
reduced component altering it; no separability is required. de Jong 1996, 4.5, p. 66. -/
theorem curve_fibration_field_reduction (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) [IsIntegral X] [LocallyOfFiniteType f] [QuasiCompact f] :
    ∃ (k' : Type u) (_ : Field k') (_ : Algebra k k') (_ : Module.Finite k k'),
      let e := Spec.map (CommRingCat.ofHom (algebraMap k k'))
      ∃ (D : (pullback f e).IdealSheafData) (_ : IsIntegral D.subscheme),
        (D.support : Set (pullback f e : Scheme.{u})) ∈
          irreducibleComponents (pullback f e : Scheme.{u}) ∧
        GeometricallyIntegral (D.subschemeι ≫ pullback.snd f e) ∧
        IsAlteration (D.subschemeι ≫ pullback.fst f e) ∧
        (D.subschemeι ≫ pullback.snd f e) ≫ e =
          (D.subschemeι ≫ pullback.fst f e) ≫ f := by
  sorry

/-- de Jong's alteration theorem over a field: a regular proper compactification of an
alteration with strict normal crossings boundary containing the preimage of `Z`, generically
étale over a perfect field. de Jong 1996, Theorem 4.1 and Remark 4.2, p. 66. -/
theorem alteration_theorem (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of k)) [IsIntegral X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] (Z : X.IdealSheafData) (hZ : Z ≠ ⊥) :
    ∃ (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ)
      (Xbar₁ : Scheme.{u}) (j : X₁ ⟶ Xbar₁) (g : Xbar₁ ⟶ Spec (CommRingCat.of k))
      (B : Xbar₁.IdealSheafData),
      IsOpenImmersion j ∧ j ≫ g = φ ≫ f ∧ IsProper g ∧ TauCeti.AlgebraicGeometry.IsRegular Xbar₁ ∧
      IsStrictNormalCrossings B ∧
      (B.support : Set Xbar₁) = (Set.range j)ᶜ ∪ j '' (φ ⁻¹' (Z.support : Set X)) ∧
      ((PerfectField k) → IsAlteration.IsGenericallyEtale φ) := by
  sorry

/-- A trait: a complete discrete valuation ring. de Jong 1996, 2.12. -/
class IsTrait (R : Type u) [CommRing R] [IsDomain R] : Prop where
  isDVR : IsDiscreteValuationRing R
  complete : IsAdicComplete (IsLocalRing.maximalIdeal R) R

/-- An `S`-variety over a trait: integral, separated, flat and of finite type.
de Jong 1996, 2.15. -/
class IsSVariety {R : Type u} [CommRing R] {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R)) :
    Prop where
  isIntegral : IsIntegral X
  isSeparated : IsSeparated f
  flat : Flat f
  locallyOfFiniteType : LocallyOfFiniteType f
  quasiCompact : QuasiCompact f

/-- de Jong 2.16 (a)–(d): smooth generic fibre and special fibre the divisor of transverse
components whose strata are smooth over the residue field. -/
def SemistableConditions {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) : Prop :=
  Smooth (TauCeti.genericFiber R K f).hom ∧
    ∃ C : SNCData X, (TauCeti.specialFiberι R f).ker = C.divisor ∧ C.IsTransverse ∧
      ∀ J : Finset C.ι, J.Nonempty →
        ∃ g : (C.stratum J).subscheme ⟶ Spec (CommRingCat.of (IsLocalRing.ResidueField R)),
          Smooth g ∧ g ≫ Spec.map (CommRingCat.ofHom
            (algebraMap R (IsLocalRing.ResidueField R))) = (C.stratum J).subschemeι ≫ f

/-- Strictly semistable `S`-varieties. de Jong 1996, 2.16. -/
def IsStrictlySemistable {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) : Prop :=
  IsSVariety f ∧ SemistableConditions K f

/-- Strict semistable pairs with horizontal part `H`. de Jong 1996, 6.2–6.4. -/
def IsStrictSemistablePair {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) (H : SNCData X) : Prop :=
  IsStrictlySemistable K f ∧
    IsStrictNormalCrossings ((TauCeti.specialFiberι R f).ker * H.divisor) ∧
    ∀ J : Finset H.ι, J.Nonempty → SemistableConditions K ((H.stratum J).subschemeι ≫ f)

/-- The semistable alteration theorem over a trait, with proper compactification.
de Jong 1996, Theorem 6.5 and Diagram 6.6, p. 83. -/
theorem semistable_alteration_theorem (R : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [IsTrait R]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R)) [IsSVariety f]
    (Z : Set X) (hZclosed : IsClosed Z) (hZproper : Z ≠ Set.univ)
    (hZspecial : Set.range (TauCeti.specialFiberι R f) ⊆ Z) :
    ∃ (R₁ : Type u) (_ : CommRing R₁) (_ : IsDomain R₁)
      (_ : IsDiscreteValuationRing R₁) (_ : Algebra R R₁),
      Module.Finite R R₁ ∧ Function.Injective (algebraMap R R₁) ∧
      IsLocalHom (algebraMap R R₁) ∧ IsTrait R₁ ∧
      ∃ (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ)
        (f₁ : X₁ ⟶ Spec (CommRingCat.of R₁)) (Xbar₁ : Scheme.{u})
        (g : Xbar₁ ⟶ Spec (CommRingCat.of R₁)) (j : X₁ ⟶ Xbar₁) (H : SNCData Xbar₁),
        IsSVariety f₁ ∧ IsOpenImmersion j ∧ IsProper g ∧
        IsStrictSemistablePair (FractionRing R₁) g H ∧
        GeometricallyIrreducible (TauCeti.genericFiber R₁ (FractionRing R₁) g).hom ∧
        j ≫ g = f₁ ∧
        f₁ ≫ Spec.map (CommRingCat.ofHom (algebraMap R R₁)) = φ ≫ f ∧
        Set.range (TauCeti.specialFiberι R₁ g) ∪ (H.divisor.support : Set Xbar₁) =
          (Set.range j)ᶜ ∪ j '' (φ ⁻¹' Z) := by
  sorry

end DeJong

end Formal

end Layer4

/-! ## Layer 5: intersection theory and Riemann–Roch -/

section Layer5

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry

/-! ### §5.1 Chow groups of coproducts -/

namespace Chow

open TauCeti.AlgebraicGeometry.Chow (ChowGroup)

/-- Tau Ceti's Chow groups of a coproduct of locally Noetherian schemes are isomorphic to the
product of the Chow groups of the components, for any small family: cycles and locally finite
families of integral closed subschemes split along the open and closed components. The natural
isomorphism, restriction to the components, is a target of README.md §5.1.
Stacks, Definition 42.19.1 (02RW). -/
theorem nonempty_CH_coprod (I : Type u) (X : I → Scheme.{u}) [∀ i, IsLocallyNoetherian (X i)]
    [IsLocallyNoetherian (∐ X)] (k : ℤ) :
    Nonempty (ChowGroup (∐ X) k ≃+ ∀ i, ChowGroup (X i) k) := by
  sorry

end Chow

/-! ### §5.11 The Weil bound -/

/-- The Weil bound for a smooth proper geometrically integral curve over a finite field:
`|#X(𝔽_q) − (q + 1)| ≤ 2g√q`. Milne 2024, Chapter 11, Theorem 11.53 and Example 11.55. -/
theorem weil_bound (k : Type u) [Field k] [Finite k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    [FiniteDimensional k (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X).obj 1)] :
    |(Nat.card {x : Spec (.of k) ⟶ X // x ≫ X ↘ Spec (.of k) = 𝟙 _} : ℝ) -
        (Nat.card k + 1)| ≤
      2 * X.genus k * Real.sqrt (Nat.card k) := by
  sorry

end Layer5

end

end TauCetiRoadmap.SchemeAndStackFoundations

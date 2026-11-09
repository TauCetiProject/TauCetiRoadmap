import Mathlib
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.AlgebraicGeometry.Cohomology.Genus
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
import TauCeti.AlgebraicGeometry.Modules.Tilde.Basic
import TauCeti.AlgebraicGeometry.Morphisms.PureRelativeDimension

/-!
# Scheme, stack, cohomology and intersection foundations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with the few definitions they need.

Headline theorems that are not statable at the pins, and what each lacks:

* §2.18: gluing of derived morphisms and of derived objects on an open basis (Stacks 0D66,
  0D6C). Derived restriction to an open needs `Scheme.Modules.restrictFunctor` to be additive and
  exact, which the pins do not provide.
* §5.7: `K_0(X) → G_0(X)` is bijective on a regular Noetherian scheme with the resolution
  property (Stacks, Lemma 36.37.4). The exact structures on finitely presented and on finite
  locally free module sheaves need their extension closure, which the pins do not prove.
* §1.23: the Keel–Mori theorem (an algebraic stack of finite presentation with finite inertia
  has a coarse moduli space). The pins have no algebraic stack (a stack in groupoids with
  representable diagonal and a smooth atlas), no inertia stack and no coarse moduli space;
  their construction is specified in README.md §§1.18–1.23.
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
* §5.8: Grothendieck–Riemann–Roch. The pins have no Chern character, Todd class or proper
  pushforward on `K_0` of a scheme.
* §5.10: the Hodge index theorem. Tau Ceti's `LineBundleClass.intersectionNumber` pairs a
  line-bundle class with a scheme `C ⟶ S` over the field (the Euler-characteristic degree of the
  class restricted to `C`), and `LineBundleClass.IsAmple` is ampleness of a class; the pins have
  no pairing of two classes on `Pic(S)` of a projective surface `S` (§5.9's
  `deg(c_1(L) ∩ c_1(M) ∩ [S])`, or the Euler-characteristic form
  `χ(O_S) − χ(L⁻¹) − χ(M⁻¹) + χ(L⁻¹ ⊗ M⁻¹)` on `Scheme.Modules.eulerCharBelow k S _ 3`), no
  numerical equivalence and no `Num S`; the intersection matrices of numerical types are
  combinatorial data, not this pairing.
-/

universe u

namespace TauCetiRoadmap.SchemeAndStackFoundations

noncomputable section

/-! ## Layer 0: schemes and morphisms -/

section Layer0

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.TensorProduct ZeroObject

/-! ### §0.5 Pseudo-coherent modules -/

namespace PseudoCoherence

/-- A module with a resolution by finite free modules in nonnegative chain degrees.
Stacks, Definition 15.66.1 (064Q). Tau Ceti's `TauCeti.Huber.IsPseudoCoherentOver A M ⊤`. -/
def IsPseudoCoherentModule (A : Type u) [CommRing A] (M : ModuleCat.{u} A) : Prop :=
  ∃ P : ChainComplex (ModuleCat.{u} A) ℕ,
    (∀ n, Module.Free A (P.X n) ∧ Module.Finite A (P.X n)) ∧
    Nonempty (P.homology 0 ≅ M) ∧ ∀ n : ℕ, IsZero (P.homology (n + 1))

/-- Zariski-local resolutions of a module sheaf by finite free module sheaves.
Stacks, §36.10 (08E4). Tau Ceti's `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent`. -/
def IsPseudoCoherentSheaf {X : Scheme.{u}} (F : X.Modules) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧
    ∃ P : ChainComplex U.toScheme.Modules ℕ,
      (∀ n, ∃ r : ℕ, Nonempty (P.X n ≅
        (SheafOfModules.free (R := U.toScheme.ringCatSheaf) (ULift.{u} (Fin r))))) ∧
      Nonempty (P.homology 0 ≅ F.restrict U.ι) ∧
      ∀ n : ℕ, IsZero (P.homology (n + 1))

/-- The affine criterion needs quasi-coherence besides pseudo-coherent sections.
Stacks, Lemmas 36.10.1–36.10.2 (08E4). -/
theorem isPseudoCoherentSheaf_iff_affineOpens {X : Scheme.{u}} (F : X.Modules) :
    IsPseudoCoherentSheaf F ↔ F.IsQuasicoherent ∧
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

/-! ### §0.20 Japanese and Nagata rings -/

/-- A domain is Japanese (N-2) if its integral closure in every finite extension of its fraction
field is a finite module, inseparable extensions included. Stacks, Definition 10.161.1 (032F).
The body of Tau Ceti's `TauCeti.Ring.IsJapanese`. -/
def Ring.IsJapanese (R : Type u) [CommRing R] [IsDomain R] : Prop :=
  ∀ (L : Type u) [Field L] [Algebra R L] [Algebra (FractionRing R) L]
    [IsScalarTower R (FractionRing R) L] [FiniteDimensional (FractionRing R) L],
    Module.Finite R (integralClosure R L)

/-- A ring is Nagata if it is Noetherian and every quotient by a prime is Japanese.
Stacks, Definition 10.162.1 (032R). The fields of Tau Ceti's `TauCeti.Ring.IsNagata`. -/
def Ring.IsNagata (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ (p : Ideal R) [p.IsPrime], Ring.IsJapanese (R ⧸ p)

/-- A complete Noetherian local domain is Japanese. Stacks, Lemma 10.162.8 (032W). -/
theorem Ring.IsJapanese.of_complete_local (A : Type u) [CommRing A] [IsDomain A]
    [IsLocalRing A] [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    Ring.IsJapanese A := by
  sorry

/-- A complete Noetherian local ring is Nagata. Stacks, Lemma 10.162.8 (032W). -/
theorem Ring.IsNagata.of_complete_local (A : Type u) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    Ring.IsNagata A := by
  sorry

/-! ### §0.21 Regular maps, G-rings, J-2 rings and excellent rings -/

namespace Excellence

/-- Noetherian geometric regularity over a field, tested after finite purely inseparable
extensions. Stacks, Lemma 10.166.1 and Definition 10.166.2. The fields of Tau Ceti's
`TauCeti.Excellence.GeometricallyRegular`. -/
def GeometricallyRegular (k B : Type u) [Field k] [CommRing B] [Algebra k B] : Prop :=
  IsNoetherianRing B ∧
    ∀ (L : Type u) [Field L] [Algebra k L], Module.Finite k L →
      IsPurelyInseparable k L → IsRegularRing (L ⊗[k] B)

/-- Flat with geometrically regular fibres. Stacks, Definition 15.42.1. The fields of Tau Ceti's
`TauCeti.Excellence.RegularAlgebraMap`. -/
def RegularAlgebraMap (R B : Type u) [CommRing R] [CommRing B] [Algebra R B] : Prop :=
  Module.Flat R B ∧ ∀ p : PrimeSpectrum R,
    GeometricallyRegular p.asIdeal.ResidueField (p.asIdeal.Fiber B)

/-- The regular locus; it need not be open. Stacks, §15.48. Tau Ceti's
`TauCeti.Excellence.regularLocus`. -/
def regularLocus (R : Type u) [CommRing R] : Set (PrimeSpectrum R) :=
  {p | IsRegularLocalRing (Localization.AtPrime p.asIdeal)}

/-- G-rings: Noetherian, with regular formal fibres at every prime. Stacks, Definition 15.51.1.
The fields of Tau Ceti's `TauCeti.Excellence.IsGRing`. -/
def IsGRing (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ p : PrimeSpectrum R,
    RegularAlgebraMap (Localization.AtPrime p.asIdeal)
      (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal))
        (Localization.AtPrime p.asIdeal))

/-- J-2 rings: Noetherian, and every finite-type algebra has open regular locus.
Stacks, Definition 15.48.1 (3). -/
def IsJ2 (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → IsOpen (regularLocus B)

/-- Stacks, Definition 15.53.1 (1); no catenarity is required. -/
def IsQuasiExcellentRing (R : Type u) [CommRing R] : Prop := IsGRing R ∧ IsJ2 R

/-- Quasi-excellent rings are Nagata. Stacks, Lemma 15.53.5 (07QV). -/
theorem IsQuasiExcellentRing.isNagata (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : Ring.IsNagata R := by
  sorry

end Excellence

/-! ### §0.23a Étale topological invariance -/

/-- Base change on Mathlib's small étale categories. -/
def smallEtaleBaseChange {X Y : Scheme.{u}} (f : X ⟶ Y) : Y.Etale ⥤ X.Etale := by
  letI : MorphismProperty.HasPullbacksAlong (@Etale : MorphismProperty Scheme.{u}) f :=
    ⟨fun _ _ => inferInstance⟩
  letI : MorphismProperty.IsStableUnderBaseChangeAlong
      (@Etale : MorphismProperty Scheme.{u}) f :=
    ⟨fun h hp => MorphismProperty.IsStableUnderBaseChange.of_isPullback h hp⟩
  exact MorphismProperty.Over.pullback @Etale ⊤ f

/-- Base change along a universal homeomorphism is fully faithful and essentially surjective.
Stacks, Theorem 59.45.2 (04DZ). -/
theorem smallEtaleBaseChange_isEquivalence {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) :
    (smallEtaleBaseChange f).IsEquivalence := by sorry

/-- A universal homeomorphism induces an equivalence with scheme base change as forward functor. -/
def universalHomeomorphismEtaleEquivalence {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) : Y.Etale ≌ X.Etale := by
  letI := smallEtaleBaseChange_isEquivalence f hf
  exact (smallEtaleBaseChange f).asEquivalence

/-- The forward and inverse functors preserve covering sieves. -/
theorem universalHomeomorphismEtaleEquivalence_coverPreserving {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) :
    CoverPreserving (Scheme.smallEtaleTopology Y) (Scheme.smallEtaleTopology X)
      (universalHomeomorphismEtaleEquivalence f hf).functor ∧
    CoverPreserving (Scheme.smallEtaleTopology X) (Scheme.smallEtaleTopology Y)
      (universalHomeomorphismEtaleEquivalence f hf).inverse := by
  sorry

/-- Composition compatibility is the associativity comparison for scheme pullbacks. -/
theorem universalHomeomorphismEtaleEquivalence_comp {X Y Z : Scheme.{u}}
    (f : X ⟶ Y) (g : Y ⟶ Z)
    (hf : (topologically IsHomeomorph).universally f)
    (hg : (topologically IsHomeomorph).universally g)
    (hfg : (topologically IsHomeomorph).universally (f ≫ g)) :
    ∃ e : (universalHomeomorphismEtaleEquivalence (f ≫ g) hfg).functor ≅
        (universalHomeomorphismEtaleEquivalence g hg).functor ⋙
          (universalHomeomorphismEtaleEquivalence f hf).functor,
      ∀ V : Z.Etale,
        (e.hom.app V).left ≫ pullback.fst (pullback.snd V.hom g) f ≫
            pullback.fst V.hom g = pullback.fst V.hom (f ≫ g) ∧
        (e.hom.app V).left ≫ pullback.snd (pullback.snd V.hom g) f =
          pullback.snd V.hom (f ≫ g) := by sorry

/-- In a cartesian square the equivalence commutes with arbitrary base change. -/
theorem universalHomeomorphismEtaleEquivalence_baseChange {X Y Y' : Scheme.{u}}
    (f : X ⟶ Y) (g : Y' ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f)
    (hf' : (topologically IsHomeomorph).universally (pullback.snd f g)) :
    ∃ e : (universalHomeomorphismEtaleEquivalence f hf).functor ⋙
          smallEtaleBaseChange (pullback.fst f g) ≅
        smallEtaleBaseChange g ⋙
          (universalHomeomorphismEtaleEquivalence (pullback.snd f g) hf').functor,
      ∀ V : Y.Etale,
        (e.hom.app V).left ≫ pullback.fst (pullback.snd V.hom g) (pullback.snd f g) ≫
            pullback.fst V.hom g =
          pullback.fst (pullback.snd V.hom f) (pullback.fst f g) ≫ pullback.fst V.hom f ∧
        (e.hom.app V).left ≫ pullback.snd (pullback.snd V.hom g) (pullback.snd f g) =
          pullback.snd (pullback.snd V.hom f) (pullback.fst f g) := by sorry

end Layer0

/-! ## Layer 1: descent, algebraic spaces and stacks -/

section Layer1

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.Opposite _root_.AlgebraicGeometry

/-- Presheaves of sets on the big category of schemes; Tau Ceti's
`TauCeti.AlgebraicGeometry.SchemePresheaf`. -/
abbrev SchemePresheaf := Scheme.{u}ᵒᵖ ⥤ Type u

/-! ### §1.3–§1.10 Algebraic spaces -/

namespace Spaces

/-- The diagonal `F → F × F` is relatively representable by schemes; Tau Ceti's
`TauCeti.AlgebraicGeometry.Spaces.RepresentableDiagonal`. -/
def RepresentableDiagonal (F : SchemePresheaf.{u}) : Prop :=
  yoneda.relativelyRepresentable (prod.lift (𝟙 F) (𝟙 F))

/-- `a : h_U → F` is representable, and étale and surjective after every base change to a
scheme; the fields of Tau Ceti's `TauCeti.AlgebraicGeometry.Spaces.EtaleAtlas`. -/
def EtaleAtlas (F : SchemePresheaf.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F) : Prop :=
  MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
    MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a

/-- An algebraic space: an fppf sheaf with representable diagonal and an étale atlas.
Stacks, Definition 65.6.1 (025Y). The fields of Tau Ceti's
`TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace`. -/
def IsAlgebraicSpace (F : SchemePresheaf.{u}) : Prop :=
  Presheaf.IsSheaf Scheme.fppfTopology F ∧ RepresentableDiagonal F ∧
    ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ F), EtaleAtlas F U a

/-- The object property of being an algebraic space. -/
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
    EtaleAtlas F.obj U a ∧ MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) b ∧
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
      (b : yoneda.obj V ⟶ pullback a y), EtaleAtlas (pullback a y) V b →
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

/-! ### §2.5–§2.6 Vanishing theorems -/

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
vanishes is affine. Stacks, Lemma 30.3.1 (01XF); Lemma 30.3.2 (01XG) is the quasi-separated
form. -/
theorem isAffine_of_H1_vanishing (X : Scheme.{u}) [CompactSpace X]
    (h : ∀ (I : X.Modules) [I.IsQuasicoherent], Subsingleton (Scheme.Modules.Cohomology I 1)) :
    IsAffine X := by
  sorry

end QCoh

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
group. Stacks, Theorems 59.67.8 (03RC) and 59.67.10 (03RD). -/
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

/-- Limits of towers of epimorphisms have epimorphic legs. Bhatt–Scholze 2014, Definition
3.1.1. Tau Ceti's `TauCeti.IsReplete` with `TauCeti.IsReplete.epi_π_app`. -/
def IsReplete (T : Type w) [Category.{v} T] : Prop :=
  ∀ (F : ℕᵒᵖ ⥤ T) (_ : ∀ n : ℕ, Epi (F.map (homOfLE (Nat.le_succ n)).op))
    (c : Cone F) (_ : IsLimit c) (m : ℕ), Epi (c.π.app (Opposite.op m))

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

/-- The standard derived category of `A`-modules, the source of the derived `M ↦ M~`. -/
instance instHasDerivedCategoryModuleCat (A : CommRingCat.{u}) :
    HasDerivedCategory (ModuleCat.{u} A) :=
  HasDerivedCategory.standard _

/-- For `X = Spec A`, the derived functor of the exact functor `M ↦ M~` is fully faithful on
`D(A)` with essential image `D_QCoh(O_X)`, so it gives `D(A) ≌ D_QCoh(O_X)`.
Stacks, Lemma 36.3.5 (06Z0). -/
theorem DQCoh.affineEquiv (A : CommRingCat.{u}) :
    (tilde.functor A).mapDerivedCategory.Full ∧ (tilde.functor A).mapDerivedCategory.Faithful ∧
      ∀ K : DerivedCategory (Spec A).Modules, (tilde.functor A).mapDerivedCategory.essImage K ↔
        ∀ n : ℤ, ((DerivedCategory.homologyFunctor (Spec A).Modules n).obj K).IsQuasicoherent := by
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

/-- Locally free of constant rank `r`: every point has an open neighbourhood `U` on which `E`
restricts to the free module `O_U^r`. -/
def isFiniteLocallyFreeOfRank {X : Scheme.{u}} (E : X.Modules) (r : ℕ) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧
    Nonempty ((Scheme.Modules.restrictFunctor U.ι).obj E ≅ SheafOfModules.free (ULift.{u} (Fin r)))

/-- `deg E = χ(E) − r·χ(O_X)` for `E` locally free of rank `r`. Stacks, Definition 0AYR. -/
def vectorBundleDegree (X : Scheme.{u}) [X.Over (Spec (.of k))] (E : X.Modules) (r : ℕ) : ℤ :=
  Scheme.Modules.eulerCharBelow k X E 2 -
    r * Scheme.Modules.eulerCharBelow k X (structureModule X) 2

/-- Additivity in short exact sequences. Stacks, Lemma 0AYS. -/
theorem vectorBundleDegree_add_of_shortExact (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X ≤ 1)
    (S : ShortComplex X.Modules) (hS : S.ShortExact) (r₁ r₃ : ℕ)
    (h₁ : isFiniteLocallyFreeOfRank S.X₁ r₁) (h₃ : isFiniteLocallyFreeOfRank S.X₃ r₃) :
    vectorBundleDegree k X S.X₂ (r₁ + r₃) =
      vectorBundleDegree k X S.X₁ r₁ + vectorBundleDegree k X S.X₃ r₃ := by
  sorry

/-- Pullback multiplies degree by the function-field degree for nonconstant maps of
proper integral curves; `K(Y) → K(X)` is the algebra map compatible with `f` at the generic
points. Stacks, Lemma 33.44.11 (0AYZ). -/
theorem vectorBundleDegree_pullback (X Y : Scheme.{u})
    [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] [IsIntegral X] [IsIntegral Y]
    [IsProper (X ↘ Spec (.of k))] [IsProper (Y ↘ Spec (.of k))]
    (hX : topologicalKrullDim X = 1) (hY : topologicalKrullDim Y = 1)
    (f : X ⟶ Y) [IsDominant f] (hf : f ≫ (Y ↘ Spec (.of k)) = (X ↘ Spec (.of k)))
    [Algebra Y.functionField X.functionField]
    (hφ : Spec.map (CommRingCat.ofHom (algebraMap Y.functionField X.functionField)) ≫
      Y.fromSpecStalk (genericPoint Y) = X.fromSpecStalk (genericPoint X) ≫ f)
    (E : Y.Modules) (r : ℕ) (hE : isFiniteLocallyFreeOfRank E r) :
    vectorBundleDegree k X ((Scheme.Modules.pullback f).obj E) r =
      Module.finrank Y.functionField X.functionField * vectorBundleDegree k Y E r := by sorry

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

/-- `deg L > 2g − 2` forces `H¹(L) = 0` and `h⁰(L) = deg L + 1 − g`.
Stacks, Lemmas 0E3A, 0E3B, 0E3C and 0E3D. -/
theorem cohomologyDim_one_eq_zero_of_degree_gt (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    [FiniteDimensional k (Scheme.Modules.Cohomology (InvertibleSheaf.trivial X).obj 1)]
    (L : InvertibleSheaf X) (hL : 2 * (X.genus k : ℤ) - 2 < vectorBundleDegree k X L.obj 1) :
    cohomologyDim k X L.obj 1 = 0 ∧
      (cohomologyDim k X L.obj 0 : ℤ) = vectorBundleDegree k X L.obj 1 + 1 - X.genus k := by
  sorry

end Curve

namespace Picard

/-- On an affine scheme, line-bundle classes are Mathlib's `CommRing.Pic`: the group isomorphism
sends the class of `L` to the class of the invertible module `P` exactly when `L ≅ P~`. -/
theorem lineBundleClass_spec_equiv_pic (R : Type u) [CommRing R] :
    ∃ e : TauCeti.AlgebraicGeometry.LineBundleClass (Spec (.of R)) ≃* CommRing.Pic R,
      ∀ (L : TauCeti.AlgebraicGeometry.InvertibleSheaf (Spec (.of R))) (P : CommRing.Pic R),
        e (TauCeti.AlgebraicGeometry.LineBundleClass.mk L) = P ↔
          Nonempty (L.obj ≅ tilde (R := .of R) (ModuleCat.of R P)) := by
  sorry

end Picard

end Layer3

/-! ## Layer 4: deformations, formal schemes, models and alterations -/

section Layer4

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry

namespace Formal

/-! ### §4.1 Thickenings and the infinitesimal lifting criterion -/

/-- A thickening: a closed immersion surjective on points. Stacks, Definition 37.2.1 (04EX).
Tau Ceti's `TauCeti.AlgebraicGeometry.IsThickening`. -/
class IsThickening {Z X : Scheme.{u}} (i : Z ⟶ X) : Prop extends IsClosedImmersion i,
  Surjective i

/-- A first-order thickening: a closed immersion whose ideal squares to zero.
Stacks, Definition 37.2.1 (04EX). Tau Ceti's `TauCeti.AlgebraicGeometry.IsFirstOrderThickening`. -/
class IsFirstOrderThickening {Z X : Scheme.{u}} (i : Z ⟶ X) : Prop extends IsClosedImmersion i where
  ker_mul_self : i.ker * i.ker = ⊥

/-- Lifts exist along affine first-order thickenings over the base.
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

/-- Full faithfulness in Grothendieck's existence theorem: over a complete Noetherian adic ring,
for finitely presented modules `M`, `N` on a proper scheme `X`, every family of maps between their
restrictions to the levels `V(I^{n+1})` that is compatible with the transitions is the family of
restrictions of a unique map `M ⟶ N`. Stacks, Proposition 30.25.4 (088C) and Theorem 30.27.1
(088E). -/
theorem grothendieck_existence_fullyFaithful (A : AdicRing.{u}) [IsNoetherianRing A.carrier]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of A.carrier)) [IsProper f]
    (I : X.IdealSheafData)
    (hI : I.support = (Set.range (pullback.fst f (Spec.map (CommRingCat.ofHom
      (Ideal.Quotient.mk A.ideal)))) : Set X))
    (𝔛 : AdicThickeningSystem.{u}) (j : ∀ n, 𝔛.X n ⟶ X) [∀ n, IsClosedImmersion (j n)]
    (hj : ∀ n, (j n).ker = I ^ (n + 1)) (hjι : ∀ n, 𝔛.ι n ≫ j (n + 1) = j n)
    (M N : X.Modules) [M.IsFinitePresentation] [N.IsFinitePresentation]
    (g : ∀ n, (Scheme.Modules.pullback (j n)).obj M ⟶ (Scheme.Modules.pullback (j n)).obj N)
    (hg : ∀ n, (Scheme.Modules.pullback (𝔛.ι n)).map (g (n + 1)) ≫
        ((Scheme.Modules.pullbackComp (𝔛.ι n) (j (n + 1))).app N ≪≫
          (Scheme.Modules.pullbackCongr (hjι n)).app N).hom =
      ((Scheme.Modules.pullbackComp (𝔛.ι n) (j (n + 1))).app M ≪≫
          (Scheme.Modules.pullbackCongr (hjι n)).app M).hom ≫ g n) :
    ∃! G : M ⟶ N, ∀ n, (Scheme.Modules.pullback (j n)).map G = g n := by
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

/-- Regular schemes: locally Noetherian with regular local rings; the fields of Tau Ceti's
`TauCeti.AlgebraicGeometry.IsRegular`. -/
class IsRegular (X : Scheme.{u}) : Prop where
  isLocallyNoetherian : IsLocallyNoetherian X
  isRegularLocalRing : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)

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
    IsRegular (C.stratum J).subscheme ∧
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

/-- The local model `uv = a` over a DVR: either `a = 0` (a persistent node) or, after a unit
change of the first coordinate, `uv = πⁿ` with `n ≥ 1`. de Jong 1996, 2.23, pp. 61–62. -/
theorem node_local_structure_dvr (R : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] (π a : R) (hπ : Irreducible π)
    (ha : a ∈ IsLocalRing.maximalIdeal R) :
    let P := MvPolynomial (Fin 2) R
    let J : R → Ideal P := fun b =>
      Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C b}
    let A := fun b : R => P ⧸ J b
    (a = 0 ∧ Nonempty (A a ≃ₐ[R] A 0)) ∨
    (a ≠ 0 ∧ ∃ (n : ℕ) (ε : Rˣ), 0 < n ∧ a = (ε : R) * π ^ n ∧
      ∃ e : A a ≃ₐ[R] A (π ^ n),
        e (Ideal.Quotient.mk (J a) (MvPolynomial.X 0)) =
          algebraMap R (A (π ^ n)) (ε : R) *
            Ideal.Quotient.mk (J (π ^ n)) (MvPolynomial.X 0) ∧
        e (Ideal.Quotient.mk (J a) (MvPolynomial.X 1)) =
          Ideal.Quotient.mk (J (π ^ n)) (MvPolynomial.X 1)) := by
  sorry

/-- A scheme `X` with structure morphism `g : X ⟶ Spec R` is projective over `R` when for some
`n` it admits a closed immersion over `R` into projective `n`-space `ℙⁿ_R`, the homogeneous
spectrum of `R[T₀, …, Tₙ]` graded by total degree (Hartshorne, *Algebraic Geometry*, II.4,
p. 103). Over a field or a local ring this is projectivity in the sense of de Jong 1996. -/
def IsProjectiveOverSpec (R : Type u) [CommRing R] {X : Scheme.{u}}
    (g : X ⟶ Spec (CommRingCat.of R)) : Prop :=
  ∃ n : ℕ,
    letI : GradedAlgebra (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) R) :=
      MvPolynomial.gradedAlgebra
    ∃ i : X ⟶ Proj (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) R),
      IsClosedImmersion i ∧
        i ≫ Proj.toSpecZero _ ≫ Spec.map (CommRingCat.ofHom (algebraMap R _)) = g

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

/-- de Jong's alteration theorem over a field: a regular projective compactification of an
alteration with strict normal crossings boundary containing the preimage of `Z`, generically
étale over a perfect field. de Jong 1996, Theorem 4.1 and Remark 4.2, p. 66. -/
theorem alteration_theorem (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of k)) [IsIntegral X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] (Z : X.IdealSheafData) (hZ : Z ≠ ⊥) :
    ∃ (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ)
      (Xbar₁ : Scheme.{u}) (j : X₁ ⟶ Xbar₁) (g : Xbar₁ ⟶ Spec (CommRingCat.of k))
      (B : Xbar₁.IdealSheafData),
      IsOpenImmersion j ∧ j ≫ g = φ ≫ f ∧ IsProjectiveOverSpec k g ∧ IsRegular Xbar₁ ∧
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

/-- The semistable alteration theorem over a trait, with projective compactification.
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
        IsSVariety f₁ ∧ IsOpenImmersion j ∧ IsProjectiveOverSpec R₁ g ∧
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

namespace Chow

variable (κ : Type u) [Field κ]

/-- Cycles of dimension `k`: coefficients supported at points `x` with `Order.height x = k`,
the dimension of the closure of `x` in Mathlib's specialisation order.
Stacks, Definition 42.8.1 (02QR) and Lemma 42.7.5 (02QO). Tau Ceti's
`TauCeti.AlgebraicGeometry.Chow.cyclesOfDimension X k`. -/
def cyclesOfDimension (X : Scheme.{u}) [X.Over (Spec (.of κ))]
    [LocallyOfFiniteType (X ↘ Spec (.of κ))] (k : ℤ) : AddSubgroup (AlgebraicCycle X ℤ) :=
  Function.locallyFinsuppWithin.supported ℤ Set.univ
    {x : X | ∃ n : ℕ, k = (n : ℤ) ∧ Order.height x = n}

attribute [local instance] Classical.propDecidable

/-- Rational equivalence: the subgroup generated by the sums of principal divisors on a locally
finite family of integral closed subschemes of dimension `k + 1` (these sums already form a
subgroup). Stacks, Definition 42.19.1 (02RW). Tau Ceti's
`TauCeti.AlgebraicGeometry.Chow.RatEquiv X k`, whose families give `W j` dimension `k + 1` as the
height of its generic point. -/
def RatEquiv (X : Scheme.{u}) [X.Over (Spec (.of κ))]
    [LocallyOfFiniteType (X ↘ Spec (.of κ))] (k : ℤ) :
    AddSubgroup (cyclesOfDimension κ X k) :=
  AddSubgroup.closure {α | ∃ (J : Type u) (W : J → Scheme.{u}) (i : ∀ j, W j ⟶ X)
    (_ : ∀ j, IsIntegral (W j)) (_ : ∀ j, IsLocallyNoetherian (W j))
    (r : ∀ j, (W j).functionFieldˣ),
      (∀ j, IsClosedImmersion (i j)) ∧
      (∀ j, ∃ n : ℕ, k + 1 = (n : ℤ) ∧ topologicalKrullDim (W j) = n) ∧
      LocallyFinite (fun j => Set.range (i j)) ∧
      ∀ x : X, α.val x = ∑ᶠ j, ∑ᶠ w : W j,
        if (i j) w = x then (W j).ord (r j) w else 0}

/-- `CH_k(X)`: `k`-cycles modulo rational equivalence; Tau Ceti's
`TauCeti.AlgebraicGeometry.Chow.ChowGroup X k`. -/
def ChowGroup (X : Scheme.{u}) [X.Over (Spec (.of κ))]
    [LocallyOfFiniteType (X ↘ Spec (.of κ))] (k : ℤ) : Type u :=
  cyclesOfDimension κ X k ⧸ RatEquiv κ X k

instance (X : Scheme.{u}) [X.Over (Spec (.of κ))] [LocallyOfFiniteType (X ↘ Spec (.of κ))]
    (k : ℤ) : AddCommGroup (ChowGroup κ X k) :=
  inferInstanceAs (AddCommGroup (cyclesOfDimension κ X k ⧸ RatEquiv κ X k))

/-- A coproduct of schemes over `κ` lies over `κ` through the induced map. -/
instance coprodOver (I : Type u) (X : I → Scheme.{u}) [∀ i, (X i).Over (Spec (.of κ))] :
    (∐ X).Over (Spec (.of κ)) :=
  ⟨Sigma.desc fun i => X i ↘ Spec (.of κ)⟩

/-- A coproduct of schemes locally of finite type over `κ` is locally of finite type over `κ`,
since the property is local on the source. -/
instance coprod_locallyOfFiniteType (I : Type u) (X : I → Scheme.{u})
    [∀ i, (X i).Over (Spec (.of κ))] [∀ i, LocallyOfFiniteType (X i ↘ Spec (.of κ))] :
    LocallyOfFiniteType ((∐ X) ↘ Spec (.of κ)) :=
  haveI : IsZariskiLocalAtSource @LocallyOfFiniteType.{u} :=
    HasRingHomProperty.instIsZariskiLocalAtSource (Q := RingHom.FiniteType)
  show LocallyOfFiniteType (Sigma.desc fun i => X i ↘ Spec (.of κ)) from
    IsZariskiLocalAtSource.sigmaDesc fun _ => inferInstance

/-- Chow groups of a coproduct, for any small family: a `k`-cycle on `∐ X i` is rationally
equivalent to zero iff its restriction to every `X i` is. As the `k`-cycles on `∐ X i` are the
families of `k`-cycles on the `X i`, restriction identifies `CH_k(∐ X i)` with `∏ CH_k(X i)`.
Stacks, Definition 42.19.1 (02RW). -/
theorem CH_coprod (I : Type u) (X : I → Scheme.{u})
    [∀ i, (X i).Over (Spec (.of κ))]
    [∀ i, LocallyOfFiniteType (X i ↘ Spec (.of κ))] (k : ℤ)
    (α : cyclesOfDimension κ (∐ X) k) :
    α ∈ RatEquiv κ (∐ X) k ↔
      ∀ i, ∃ β ∈ RatEquiv κ (X i) k, ∀ x : X i, β.val x = α.val (Sigma.ι X i x) := by
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

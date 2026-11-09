import Mathlib
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.Algebra.Module.PseudoCoherent.Basic
import TauCeti.AlgebraicGeometry.AlgebraicSpace.Basic
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic
import TauCeti.AlgebraicGeometry.Cohomology.Genus
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.AlgebraicGeometry.LineBundle.Ample
import TauCeti.AlgebraicGeometry.Modules.PseudoCoherent.Basic
import TauCeti.AlgebraicGeometry.Modules.Tilde.Basic
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import TauCeti.AlgebraicGeometry.Morphisms.Thickening
import TauCeti.AlgebraicGeometry.Morphisms.UniversalHomeomorphism
import TauCeti.AlgebraicGeometry.Scheme.Regular.Scheme
import TauCeti.CategoryTheory.Limits.Replete
import TauCeti.RingTheory.Nagata
import TauCeti.RingTheory.RegularLocalRing.GRing
import TauCeti.RingTheory.RegularLocalRing.Locus
import TauCeti.RingTheory.UniversallyCatenary

/-!
# Scheme, stack, cohomology and intersection foundations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with the few definitions they need. Every other
target, API item and Check is specified in the README only.

Headline theorems already proved at the pins are cited in the README, not restated here: the
henselization of a pair with its universal property (Tau Ceti
`TauCeti.Henselization.existsUnique_lift`), base change for `Proj`
(`TauCeti/AlgebraicGeometry/ProjectiveSpectrum/BaseChange.lean`), the scheme Frobenius package
(`TauCeti/AlgebraicGeometry/Frobenius/`), and resolution of curves by normalization
(`TauCeti/AlgebraicGeometry/Normalization/`).

Headline theorems that are not statable at the pins, and what each lacks:

* §1.23, the Keel–Mori theorem (an algebraic stack of finite presentation with finite inertia
  has a coarse moduli space). The pins have no algebraic stack (a stack in groupoids with
  representable diagonal and a smooth atlas), no inertia stack and no coarse moduli space.
* §§2.19–2.20, coherent Grothendieck duality (the right adjoint `f^!` of `Rf_*` on `D_QCoh` for
  a proper morphism, and the dualising complex). The pins have no derived pushforward of module
  sheaves along a morphism of schemes.
* §2.22, the Brauer class `Br_Az(X) → H²(X_ét, 𝔾_m)` of an Azumaya algebra on a scheme. The pins
  have Azumaya algebras over rings (`IsAzumaya`) but none over a scheme, and no sheaf `𝔾_m` on
  the small étale site.
* §3.6, the Picard torsors `Pic^d_{X/k}` of a smooth projective curve without a rational point.
  The pins have the relative Picard fppf sheaf (`TauCeti.AlgebraicGeometry.relativePicardFppfSheaf`)
  but no scheme representing it and no decomposition by degree.
* §4.4, Schlessinger's theorem. Its statement needs the Artinian coefficient category `C_Λ`, its
  small extensions and pro-representable hulls in `Ĉ_Λ`; none is at the pins.
* §5.7, `K_0(X) → G_0(X)` is bijective on a regular Noetherian scheme with the resolution
  property. Tau Ceti's `TauCeti.ExactK0` needs exact structures on finite locally free and on
  finitely presented module sheaves; `TauCeti.ExactStructure.fullSubcategory` takes a proof that
  each subcategory is closed under extensions, and the pins supply neither proof.
* §5.8, Grothendieck–Riemann–Roch. The pins have no Chern character, no Todd class and no proper
  pushforward on `K_0` of a scheme.
-/

universe u v w

namespace TauCetiRoadmap.SchemeAndStackFoundations

noncomputable section

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry

/-! ## Layer 0: schemes and morphisms -/

section Layer0

namespace PseudoCoherence

/-- Pseudo-coherence of a bundled module: Tau Ceti's `TauCeti.Huber.IsPseudoCoherentOver A M ⊤`, a
resolution by finite free modules exact in every degree. Stacks, Definition 15.66.1 (064Q) and
Lemma 15.66.4 (064T). -/
abbrev IsPseudoCoherentModule (A : Type u) [CommRing A] (M : ModuleCat.{u} A) : Prop :=
  TauCeti.Huber.IsPseudoCoherentOver A M ⊤

/-- **The affine criterion for pseudo-coherence.** A module sheaf is pseudo-coherent (Tau Ceti's
`AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent`: locally a finite free resolution) iff it is
quasi-coherent and its sections over every affine open are a pseudo-coherent module. Stacks,
Lemmas 36.10.1 (08E5) and 36.10.2 (08E7). -/
theorem isPseudoCoherent_iff_affineOpens {X : Scheme.{u}} (F : X.Modules) :
    F.IsPseudoCoherent ↔ F.IsQuasicoherent ∧
      ∀ U : X.affineOpens, IsPseudoCoherentModule Γ(X, U.1)
        (ModuleCat.of Γ(X, U.1) Γ(F, U.1)) := by
  sorry

end PseudoCoherence

/-- A complete Noetherian local ring is Nagata (Tau Ceti's `TauCeti.Ring.IsNagata`); through the
Tau Ceti instance `TauCeti.Ring.IsNagata.isJapanese`, a complete Noetherian local domain is
therefore Japanese. Stacks, Lemma 10.162.8 (032W). -/
theorem Ring.IsNagata.of_complete_local (A : Type u) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    TauCeti.Ring.IsNagata A := by
  sorry

namespace Excellence

/-- A ring is **J-2** if it is Noetherian and every finite type algebra over it has open regular
locus (Tau Ceti's `TauCeti.Excellence.regularLocus`). Stacks, Definition 15.48.1 (07P7). -/
def IsJ2 (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → IsOpen (TauCeti.Excellence.regularLocus B)

/-- A ring is **quasi-excellent** if it is a G-ring (Tau Ceti's `TauCeti.Excellence.IsGRing`, which
includes Noetherianity) and J-2. Stacks, Definition 15.53.1 (07QT), part (1). -/
def IsQuasiExcellentRing (R : Type u) [CommRing R] : Prop :=
  TauCeti.Excellence.IsGRing R ∧ IsJ2 R

/-- A ring is **excellent** if it is quasi-excellent and universally catenary (Tau Ceti's
`TauCeti.Excellence.IsUniversallyCatenary`). Stacks, Definition 15.53.1 (07QT), part (2). -/
def IsExcellentRing (R : Type u) [CommRing R] : Prop :=
  IsQuasiExcellentRing R ∧ TauCeti.Excellence.IsUniversallyCatenary R

/-- A quasi-excellent ring is Nagata. Stacks, Lemma 15.53.5 (07QV). -/
theorem IsQuasiExcellentRing.isNagata {R : Type u} [CommRing R] (h : IsQuasiExcellentRing R) :
    TauCeti.Ring.IsNagata R := by
  sorry

/-- A complete Noetherian local ring is excellent. Stacks, Proposition 15.53.3 (07QW), case (2). -/
theorem isExcellentRing_of_isAdicComplete (A : Type u) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    IsExcellentRing A := by
  sorry

/-- A Dedekind domain of characteristic zero, `ℤ` among them, is excellent. Stacks,
Proposition 15.53.3 (07QW), cases (3) and (4). -/
theorem isExcellentRing_of_isDedekindDomain (R : Type u) [CommRing R] [IsDedekindDomain R]
    [CharZero R] : IsExcellentRing R := by
  sorry

/-- A finite type algebra over an excellent ring is excellent. Stacks, Lemma 15.53.2 (07QU); the
G-ring part is Proposition 15.51.10. -/
theorem IsExcellentRing.of_finiteType {R B : Type u} [CommRing R] [CommRing B] [Algebra R B]
    [Algebra.FiniteType R B] (h : IsExcellentRing R) : IsExcellentRing B := by
  sorry

end Excellence

/-- Base change `V ↦ V ×_Y X` from étale `Y`-schemes to étale `X`-schemes, on Mathlib's small
étale categories. -/
def smallEtaleBaseChange {X Y : Scheme.{u}} (f : X ⟶ Y) : Y.Etale ⥤ X.Etale := by
  letI : MorphismProperty.HasPullbacksAlong (@Etale : MorphismProperty Scheme.{u}) f :=
    ⟨fun _ _ => inferInstance⟩
  letI : MorphismProperty.IsStableUnderBaseChangeAlong
      (@Etale : MorphismProperty Scheme.{u}) f :=
    ⟨fun h hp => MorphismProperty.IsStableUnderBaseChange.of_isPullback h hp⟩
  exact MorphismProperty.Over.pullback @Etale ⊤ f

/-- **Topological invariance of the étale site.** Base change along a universal homeomorphism
(Tau Ceti's `TauCeti.AlgebraicGeometry.IsUniversalHomeomorphism`) is an equivalence between the
categories of étale schemes over the target and over the source. Stacks, Theorem 59.45.1 (0BTY)
for full faithfulness and Theorem 59.45.2 (04DZ). -/
theorem smallEtaleBaseChange_isEquivalence {X Y : Scheme.{u}} (f : X ⟶ Y)
    [TauCeti.AlgebraicGeometry.IsUniversalHomeomorphism f] :
    (smallEtaleBaseChange f).IsEquivalence := by
  sorry

end Layer0

/-! ## Layer 1: descent, algebraic spaces and stacks -/

section Layer1

namespace Groups

/-- **Artin's bootstrap theorem.** An fppf sheaf `F` on schemes that receives a morphism from an
algebraic space which is representable by algebraic spaces, flat and locally of finite
presentation (read on the étale atlases of its base changes) and fppf locally surjective is an
algebraic space. The carriers are Tau Ceti's `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace`
and `TauCeti.AlgebraicGeometry.Spaces.EtaleAtlas`. Stacks, Theorem 80.10.1 (04S6), condition
(3). -/
theorem artinBootstrap (F : TauCeti.AlgebraicGeometry.SchemePresheaf.{u})
    (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    (U : TauCeti.AlgebraicGeometry.SchemePresheaf.{u})
    (hU : TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace U) (a : U ⟶ F)
    (ha : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F),
      TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace (pullback a y))
    (hflat : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F) (V : Scheme.{u})
      (b : yoneda.obj V ⟶ pullback a y), TauCeti.AlgebraicGeometry.Spaces.EtaleAtlas b →
        ∃ h : V ⟶ T, yoneda.map h = b ≫ pullback.snd a y ∧ Flat h ∧
          LocallyOfFinitePresentation h)
    (hsurj : Presheaf.IsLocallySurjective Scheme.fppfTopology a) :
    TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace F := by
  sorry

end Groups

end Layer1

/-! ## Layer 2: sites and scheme cohomology -/

section Layer2

namespace SiteCohomology

/-- **Grothendieck vanishing.** On a Noetherian topological space of dimension at most `d`, the
cohomology of every abelian sheaf vanishes in degrees above `d`. Stacks, Proposition 20.20.7
(02UZ). -/
theorem noetherianSpace_vanishing {X : TopCat.{u}} [TopologicalSpace.NoetherianSpace X] (d : ℕ)
    (hd : topologicalKrullDim X ≤ d) (F : TopCat.Sheaf AddCommGrpCat.{u} X) (p : ℕ)
    (hp : d < p) : Subsingleton (Sheaf.H.{u} F p) := by
  sorry

end SiteCohomology

namespace QCoh

/-- **Serre's criterion.** A quasi-compact scheme on which the first cohomology of every
quasi-coherent module vanishes is affine. Stacks, Lemma 30.3.1 (01XF), whose hypothesis asks this
only for quasi-coherent ideal sheaves. -/
theorem isAffine_of_H1_vanishing (X : Scheme.{u}) [CompactSpace X]
    (h : ∀ (I : X.Modules) [I.IsQuasicoherent],
      Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology I 1)) :
    IsAffine X := by
  sorry

end QCoh

namespace Coherent

/-- The derived category of `A`-modules, in its standard model. -/
instance instHasDerivedCategoryModuleCat (A : CommRingCat.{u}) :
    HasDerivedCategory (ModuleCat.{u} A) :=
  HasDerivedCategory.standard _

/-- The derived category of `O_X`-modules, in its standard model. -/
instance instHasDerivedCategoryModules (X : Scheme.{u}) : HasDerivedCategory X.Modules :=
  HasDerivedCategory.standard _

/-- `D_QCoh(O_X)`: the complexes of `O_X`-modules whose cohomology sheaves are quasi-coherent.
Stacks, Section 36.3 (06YZ). -/
def DQCoh (X : Scheme.{u}) : ObjectProperty (DerivedCategory X.Modules) :=
  fun K => ∀ n : ℤ, ((DerivedCategory.homologyFunctor X.Modules n).obj K).IsQuasicoherent

/-- On `X = Spec A`, the derived functor of the exact functor `M ↦ M^~` is fully faithful from
`D(A)` with essential image `D_QCoh(O_X)`. Stacks, Lemma 36.3.5 (06Z0). -/
theorem tilde_mapDerivedCategory (A : CommRingCat.{u}) :
    (tilde.functor A).mapDerivedCategory.Full ∧ (tilde.functor A).mapDerivedCategory.Faithful ∧
      (tilde.functor A).mapDerivedCategory.essImage = DQCoh (Spec A) := by
  sorry

end Coherent

namespace Etale

/-- The constant sheaf `ℤ/p` on the small étale site. -/
def constZMod (X : Scheme.{u}) (p : ℕ) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  (constantSheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}).obj
    (AddCommGrpCat.of (ULift.{u} (ZMod p)))

/-- On an affine scheme of characteristic `p`, `H^q(X_ét, ℤ/p) = 0` for `q ≥ 2` (the
Artin–Schreier sequence). Stacks, Lemma 59.63.1 (0A3K), part (1). -/
theorem artinSchreier_vanishing (p : ℕ) [Fact p.Prime] (X : Scheme.{u}) [IsAffine X]
    (hX : (p : Γ(X, ⊤)) = 0) (q : ℕ) (hq : 2 ≤ q) : Subsingleton ((constZMod X p).H q) := by
  sorry

/-- **Tsen.** A field of transcendence degree one over an algebraically closed field has trivial
Brauer group. Stacks, Theorems 59.67.8 (03RC) and 59.67.10 (03RD), Lemmas 59.67.11 (03RF) and
59.67.12 (03RG). -/
theorem brauer_functionField_curve_trivial (k K : Type u) [Field k] [IsAlgClosed k] [Field K]
    [Algebra k K] (t : K) (ht : Transcendental k t)
    (halg : Algebra.IsAlgebraic (IntermediateField.adjoin k {t}) K)
    (x : BrauerGroup.{u, u} K) : x = 1 := by
  sorry

end Etale

namespace Proetale

/-- A category is **replete** if the limit of a tower of epimorphisms maps epimorphically onto the
bottom of the tower: Tau Ceti's `TauCeti.IsReplete`. Bhatt–Scholze 2014, Definition 3.1.1. -/
abbrev IsReplete (T : Type w) [Category.{v} T] : Prop :=
  TauCeti.IsReplete T

/-- The pro-étale topos of a scheme is replete. Bhatt–Scholze 2014, Proposition 4.2.8. -/
theorem isReplete_proetale (X : Scheme.{u}) :
    IsReplete (Sheaf (Scheme.ProEt.topology X) (Type u)) := by
  sorry

end Proetale

/-- An Azumaya algebra of constant degree `d` splits as `d × d` matrices over a faithfully flat
étale algebra. Grothendieck, Brauer I, Théorème 5.1(ii)–(iii), p. 210. -/
theorem _root_.IsAzumaya.exists_etale_matrix_splitting (A R : Type u) [CommRing A] [Ring R]
    [Algebra A R] [IsAzumaya A R] (d : ℕ) (hd : 0 < d)
    (hrank : Module.rankAtStalk (R := A) R = fun _ => d * d) :
    ∃ (B : Type u) (_ : CommRing B) (_ : Algebra A B),
      Algebra.Etale A B ∧ Module.FaithfullyFlat A B ∧
        Nonempty (TensorProduct A B R ≃ₐ[B] Matrix (Fin d) (Fin d) B) := by
  sorry

end Layer2

/-! ## Layer 4: deformations, formal schemes, models and alterations -/

section Layer4

namespace Formal

/-- A morphism is **formally smooth** if it has lifts along affine first-order thickenings
(Tau Ceti's `TauCeti.AlgebraicGeometry.IsFirstOrderThickening`) over the base. Stacks,
Definition 37.11.1 (02H0). -/
class FormallySmooth {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  exists_lift : ∀ {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T')
    [TauCeti.AlgebraicGeometry.IsFirstOrderThickening i] (g : T ⟶ X) (h : T' ⟶ S),
    g ≫ f = i ≫ h → ∃ l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h

/-- **Infinitesimal lifting criterion.** A morphism locally of finite presentation is smooth iff
it is formally smooth. Stacks, Lemma 37.11.7 (02H6). -/
theorem smooth_iff_formallySmooth {X S : Scheme.{u}} (f : X ⟶ S)
    [LocallyOfFinitePresentation f] : Smooth f ↔ FormallySmooth f := by
  sorry

/-- The closed immersion `Spec (A/I^{n+1}) → Spec A`. -/
abbrev quotMap {A : Type u} [CommRing A] (I : Ideal A) (n : ℕ) :
    Spec (.of (A ⧸ I ^ (n + 1))) ⟶ Spec (.of A) :=
  Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk (I ^ (n + 1))))

/-- The closed immersion `Spec (A/I^{n+1}) → Spec (A/I^{n+2})`. -/
abbrev quotIncl {A : Type u} [CommRing A] (I : Ideal A) (n : ℕ) :
    Spec (.of (A ⧸ I ^ (n + 1))) ⟶ Spec (.of (A ⧸ I ^ (n + 2))) :=
  Spec.map (CommRingCat.ofHom (Ideal.Quotient.factor
    (Ideal.pow_le_pow_right (by omega : n + 1 ≤ n + 2))))

/-- The transition `X_n → X_{n+1}` between the reductions `X_n = X ×_A A/I^{n+1}` of an
`A`-scheme. -/
def levelIncl {A : Type u} [CommRing A] (I : Ideal A) {X : Scheme.{u}}
    (f : X ⟶ Spec (.of A)) (n : ℕ) :
    pullback f (quotMap I n) ⟶ pullback f (quotMap I (n + 1)) :=
  pullback.map f (quotMap I n) f (quotMap I (n + 1)) (𝟙 X) (quotIncl I n) (𝟙 _) (by simp)
    (by
      rw [Category.comp_id, ← Spec.map_comp, ← CommRingCat.ofHom_comp,
        Ideal.Quotient.factor_comp_mk])

/-- A coherent formal module on the reductions of `f : X → Spec A`: finitely presented modules
`F_n` on `X_n` with isomorphisms `F_{n+1}|_{X_n} ≅ F_n`. Stacks, Section 30.23. -/
structure CoherentFormalModule {A : Type u} [CommRing A] (I : Ideal A) {X : Scheme.{u}}
    (f : X ⟶ Spec (.of A)) where
  /-- The module on the `n`-th reduction. -/
  F : ∀ n, (pullback f (quotMap I n)).Modules
  /-- Each level is finitely presented. -/
  fp : ∀ n, (F n).IsFinitePresentation
  /-- The restriction of each level to the previous reduction. -/
  iso : ∀ n, (Scheme.Modules.pullback (levelIncl I f n)).obj (F (n + 1)) ≅ F n

/-- **Grothendieck's existence theorem.** Over a Noetherian ring `A` complete for an ideal `I`,
every coherent formal module on the reductions of a proper `A`-scheme is the system of reductions
of a finitely presented module, compatibly with the transition isomorphisms. Stacks, Proposition
30.25.4 (088C) and Theorem 30.27.1 (088E). -/
theorem grothendieck_existence {A : Type u} [CommRing A] [IsNoetherianRing A] (I : Ideal A)
    [IsAdicComplete I A] {X : Scheme.{u}} (f : X ⟶ Spec (.of A)) [IsProper f]
    (𝓜 : CoherentFormalModule I f) :
    ∃ (M : X.Modules) (_ : M.IsFinitePresentation)
      (e : ∀ n, (Scheme.Modules.pullback (pullback.fst f (quotMap I n))).obj M ≅ 𝓜.F n),
      ∀ n, (Scheme.Modules.pullback (levelIncl I f n)).map (e (n + 1)).hom ≫ (𝓜.iso n).hom =
        ((Scheme.Modules.pullbackComp (levelIncl I f n)
            (pullback.fst f (quotMap I (n + 1)))).app M ≪≫
          (Scheme.Modules.pullbackCongr (by simp [levelIncl] :
            levelIncl I f n ≫ pullback.fst f (quotMap I (n + 1)) =
              pullback.fst f (quotMap I n))).app M).hom ≫ (e n).hom := by
  sorry

/-- **Algebraization of morphisms.** Over a Noetherian ring `A` complete for an ideal `I`, a
compatible family of morphisms over `A/I^{n+1}` between the reductions of a proper `X` and of a
separated `Y` of finite type comes from a unique morphism over `A`. Stacks, Lemmas 30.28.1 (0899)
and 30.28.3 (0A42). -/
theorem algebraize_hom {A : Type u} [CommRing A] [IsNoetherianRing A] (I : Ideal A)
    [IsAdicComplete I A] {X Y : Scheme.{u}} (fX : X ⟶ Spec (.of A))
    (fY : Y ⟶ Spec (.of A)) [IsProper fX] [IsSeparated fY] [LocallyOfFiniteType fY]
    [QuasiCompact fY]
    (g : ∀ n, pullback fX (quotMap I n) ⟶ pullback fY (quotMap I n))
    (hg : ∀ n, g n ≫ pullback.snd fY (quotMap I n) = pullback.snd fX (quotMap I n))
    (hcompat : ∀ n, levelIncl I fX n ≫ g (n + 1) = g n ≫ levelIncl I fY n) :
    ∃! G : X ⟶ Y, ∃ h : G ≫ fY = fX, ∀ n,
      pullback.map fX (quotMap I n) fY (quotMap I n) G (𝟙 _) (𝟙 _)
        (by rw [Category.comp_id, h]) (by simp) = g n := by
  sorry

/-- An **alteration**: a proper dominant morphism that is finite over a nonempty open of the
target. Stacks, Definition 29.52.12 (0AB0); de Jong 1996, 2.20. -/
class IsAlteration {S' S : Scheme.{u}} (f : S' ⟶ S) : Prop where
  isProper : IsProper f
  isDominant : IsDominant f
  generically_finite : ∃ U : S.Opens, (U : Set S).Nonempty ∧ IsFinite (f ∣_ U)

/-- A finite family of closed subschemes, the components of a divisor. de Jong 1996, 2.4. -/
structure SNCData (X : Scheme.{u}) where
  /-- The index type of the components. -/
  ι : Type u
  [fintype : Fintype ι]
  /-- The ideal sheaves of the components. -/
  comp : ι → X.IdealSheafData

attribute [instance] SNCData.fintype

/-- The partial intersection `D_J = ⋂_{j ∈ J} D_j`. -/
def SNCData.stratum {X : Scheme.{u}} (C : SNCData X) (J : Finset C.ι) : X.IdealSheafData :=
  ⨆ j ∈ J, C.comp j

/-- The divisor `∑ D_i`, as the product of the ideal sheaves. -/
def SNCData.divisor {X : Scheme.{u}} (C : SNCData X) : X.IdealSheafData :=
  ∏ i, C.comp i

/-- Every nonempty partial intersection is regular (Tau Ceti's
`TauCeti.AlgebraicGeometry.IsRegular`) of codimension the number of components met. -/
def SNCData.IsTransverse {X : Scheme.{u}} (C : SNCData X) : Prop :=
  ∀ J : Finset C.ι, J.Nonempty →
    TauCeti.AlgebraicGeometry.IsRegular (C.stratum J).subscheme ∧
    ∀ y : (C.stratum J).subscheme,
      ringKrullDim (X.presheaf.stalk ((C.stratum J).subschemeι y)) =
        ringKrullDim ((C.stratum J).subscheme.presheaf.stalk y) + (J.card : WithBot ℕ∞)

/-- A **strict normal crossings divisor**: the sum of the components of transverse data, with
regular local rings along its support. de Jong 1996, 2.4. -/
def IsStrictNormalCrossings {X : Scheme.{u}} (D : X.IdealSheafData) : Prop :=
  ∃ C : SNCData X, D = C.divisor ∧
    (∀ x ∈ (D.support : Set X), IsRegularLocalRing (X.presheaf.stalk x)) ∧ C.IsTransverse

namespace DeJong

/-- **de Jong's alteration theorem over a field.** An integral separated scheme of finite type
over a field has an alteration that is an open subscheme of a regular proper scheme, with strict
normal crossings boundary containing the preimage of a given proper closed subscheme; over a
perfect field the alteration is étale over a nonempty open. de Jong 1996, Theorem 4.1 and
Remark 4.2, p. 66. -/
theorem alteration_theorem (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) [IsIntegral X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] (Z : X.IdealSheafData) (hZ : Z ≠ ⊥) :
    ∃ (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ)
      (Xbar₁ : Scheme.{u}) (j : X₁ ⟶ Xbar₁) (g : Xbar₁ ⟶ Spec (.of k))
      (B : Xbar₁.IdealSheafData),
      IsOpenImmersion j ∧ j ≫ g = φ ≫ f ∧ IsProper g ∧
      TauCeti.AlgebraicGeometry.IsRegular Xbar₁ ∧ IsStrictNormalCrossings B ∧
      (B.support : Set Xbar₁) = (Set.range j)ᶜ ∪ j '' (φ ⁻¹' (Z.support : Set X)) ∧
      (PerfectField k → ∃ U : X.Opens, (U : Set X).Nonempty ∧ Etale (φ ∣_ U)) := by
  sorry

/-- A **trait**: a complete discrete valuation ring. de Jong 1996, 2.12. -/
class IsTrait (R : Type u) [CommRing R] [IsDomain R] : Prop where
  isDVR : IsDiscreteValuationRing R
  complete : IsAdicComplete (IsLocalRing.maximalIdeal R) R

/-- An **`S`-variety** over a trait: integral, separated, flat and of finite type.
de Jong 1996, 2.15. -/
class IsSVariety {R : Type u} [CommRing R] {X : Scheme.{u}} (f : X ⟶ Spec (.of R)) :
    Prop where
  isIntegral : IsIntegral X
  isSeparated : IsSeparated f
  flat : Flat f
  locallyOfFiniteType : LocallyOfFiniteType f
  quasiCompact : QuasiCompact f

/-- de Jong 2.16 (a)–(d): smooth generic fibre, and special fibre the divisor of transverse
components whose strata are smooth over the residue field. The fibres are Tau Ceti's
`TauCeti.genericFiber` and `TauCeti.specialFiberι`. -/
def SemistableConditions {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of R)) : Prop :=
  Smooth (TauCeti.genericFiber R K f).hom ∧
    ∃ C : SNCData X, (TauCeti.specialFiberι R f).ker = C.divisor ∧ C.IsTransverse ∧
      ∀ J : Finset C.ι, J.Nonempty →
        ∃ g : (C.stratum J).subscheme ⟶ Spec (.of (IsLocalRing.ResidueField R)),
          Smooth g ∧ g ≫ Spec.map (CommRingCat.ofHom
            (algebraMap R (IsLocalRing.ResidueField R))) = (C.stratum J).subschemeι ≫ f

/-- Strictly semistable `S`-varieties. de Jong 1996, 2.16. -/
def IsStrictlySemistable {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of R)) : Prop :=
  IsSVariety f ∧ SemistableConditions K f

/-- Strict semistable pairs with horizontal part `H`. de Jong 1996, 6.2–6.4. -/
def IsStrictSemistablePair {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of R)) (H : SNCData X) : Prop :=
  IsStrictlySemistable K f ∧
    IsStrictNormalCrossings ((TauCeti.specialFiberι R f).ker * H.divisor) ∧
    ∀ J : Finset H.ι, J.Nonempty → SemistableConditions K ((H.stratum J).subschemeι ≫ f)

/-- **The semistable alteration theorem** over a trait, with proper compactification. de Jong 1996,
Theorem 6.5 and Diagram 6.6, p. 83. -/
theorem semistable_alteration_theorem (R : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [IsTrait R]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of R)) [IsSVariety f]
    (Z : Set X) (hZclosed : IsClosed Z) (hZproper : Z ≠ Set.univ)
    (hZspecial : Set.range (TauCeti.specialFiberι R f) ⊆ Z) :
    ∃ (R₁ : Type u) (_ : CommRing R₁) (_ : IsDomain R₁)
      (_ : IsDiscreteValuationRing R₁) (_ : Algebra R R₁),
      Module.Finite R R₁ ∧ Function.Injective (algebraMap R R₁) ∧
      IsLocalHom (algebraMap R R₁) ∧ IsTrait R₁ ∧
      ∃ (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ)
        (f₁ : X₁ ⟶ Spec (.of R₁)) (Xbar₁ : Scheme.{u})
        (g : Xbar₁ ⟶ Spec (.of R₁)) (j : X₁ ⟶ Xbar₁) (H : SNCData Xbar₁),
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

open _root_.CategoryTheory.MonoidalCategory

namespace Surface

/-- The intersection number of two module sheaves on a scheme over `k`, through Euler
characteristics in degrees `0, 1, 2`: `(L · M) = χ(L ⊗ M) − χ(L) − χ(M) + χ(O_X)` (Tau Ceti's
`Scheme.Modules.eulerCharBelow`). On a projective surface and for invertible `L`, `M` this is the
intersection pairing of Hartshorne 1977, V, Theorem 1.1 (Exercise V.1.1 gives the same
bilinear form with duals). -/
def intersectionPairing (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    (L M : X.Modules) : ℤ :=
  Scheme.Modules.eulerCharBelow k X (L ⊗ M) 3 - Scheme.Modules.eulerCharBelow k X L 3 -
    Scheme.Modules.eulerCharBelow k X M 3 +
      Scheme.Modules.eulerCharBelow k X (SheafOfModules.unit X.ringCatSheaf) 3

/-- **The Hodge index theorem.** On a smooth proper geometrically integral surface over a field
with an ample line bundle `H` (Tau Ceti's `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`),
a line bundle orthogonal to `H` and not numerically trivial has negative self-intersection.
Hartshorne 1977, V, Theorem 1.9. -/
theorem hodge_index (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 2)
    (H D : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (hH : (TauCeti.AlgebraicGeometry.LineBundleClass.mk H).IsAmple)
    (hDH : intersectionPairing k X D.obj H.obj = 0)
    (hD : ∃ E : TauCeti.AlgebraicGeometry.InvertibleSheaf X,
      intersectionPairing k X D.obj E.obj ≠ 0) :
    intersectionPairing k X D.obj D.obj < 0 := by
  sorry

end Surface

/-- **The Weil bound** for a smooth proper geometrically integral curve over a finite field:
`|#X(𝔽_q) − (q + 1)| ≤ 2g√q`, with `g` Tau Ceti's `AlgebraicGeometry.Scheme.genus`. Milne 2024,
Chapter 11, Theorem 11.53 and Example 11.55. -/
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

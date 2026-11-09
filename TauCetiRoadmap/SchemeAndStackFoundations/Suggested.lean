import Mathlib
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.Algebra.Module.PseudoCoherent.Basic
import TauCeti.AlgebraicGeometry.AlgebraicSpace.Basic
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic
import TauCeti.AlgebraicGeometry.Cohomology.Genus
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Ample
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.LineBundle.Dual
import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import TauCeti.AlgebraicGeometry.Modules.PseudoCoherent.Basic
import TauCeti.AlgebraicGeometry.Morphisms.Dominant
import TauCeti.AlgebraicGeometry.Morphisms.Modification.Basic
import TauCeti.AlgebraicGeometry.Morphisms.Thickening
import TauCeti.AlgebraicGeometry.Scheme.Regular.Scheme
import TauCeti.AlgebraicGeometry.VectorBundle.Degree
import TauCeti.AlgebraicGeometry.VectorBundle.FixedRank
import TauCeti.CategoryTheory.Limits.Replete
import TauCeti.RingTheory.Nagata
import TauCeti.RingTheory.RegularLocalRing.GRing
import TauCeti.RingTheory.RegularLocalRing.Locus
import TauCeti.RingTheory.StrictHenselization.Algebra
import TauCeti.RingTheory.StrictHenselization.Henselian
import TauCeti.RingTheory.UniversallyCatenary

/-!
# Scheme, stack, cohomology and intersection foundations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions with real bodies that those statements need. Every carrier that exists at the pins is
used as it stands: Tau Ceti's pseudo-coherent modules and sheaves, strict henselization, Nagata
rings, G-rings, regular loci, universally catenary rings, algebraic spaces, replete categories,
thickenings, modifications, regular schemes, vector bundles of fixed rank with their degree, ample
line-bundle classes and Euler characteristics.

Headline theorems stated here, by layer: the affine criterion for pseudo-coherence, flatness over
Dedekind bases, finite étale components, the clauses of the strict henselization that the pinned
library lacks, complete local rings and quasi-excellent rings are Nagata, and topological invariance
of the small étale site (Layer 0); fibre products of algebraic spaces, the representability of
torsors, Artin's bootstrap theorem and Galois descent for affine schemes (Layer 1); Grothendieck
vanishing, Serre's affineness criterion, flat base change of local cohomology, Artin–Schreier
vanishing, Tsen's theorem, the Nisnevich sheaf condition on distinguished squares, repleteness of
the pro-étale topos, `D(A) ≃ D_QCoh(Spec A)` and the étale splitting of Azumaya algebras (Layer 2);
the curve theorems of Layer 3 (affine or proper, genus under field extension, `H⁰(O) = k`, the degree
of a pulled-back vector bundle, Riemann–Hurwitz for finite étale maps); the infinitesimal lifting
criteria, Grothendieck's existence theorem, algebraization of morphisms, generic flatness, resolution
of curves and de Jong's alteration theorems over a field and over a trait (Layer 4); and the Hodge
index theorem and the Weil bound (Layer 5).

Headline theorems already proved at the pins, and therefore cited by the README rather than stated
here: the henselization of a pair with its universal property
(`TauCeti.Henselization.existsUnique_lift`), the henselian, local and universal properties of the
strict henselization (`TauCeti.StrictHenselization`), base change of `Proj`
(`AlgebraicGeometry.Proj.isPullback_baseChange`), absolute, relative, iterated and finite-field
scheme Frobenius (`TauCeti/AlgebraicGeometry/Frobenius/`), normal schemes, codimension-one points and
ramification indices (`TauCeti/AlgebraicGeometry/Scheme/Normal.lean`,
`Morphisms/CodimensionOne/`, `Morphisms/RamificationIdx/`), additivity of the degree of vector
bundles (`vectorBundleDegree_add_of_shortExact`) and the vanishing of `H¹` of line bundles of large
degree (`TauCeti/AlgebraicGeometry/LineBundle/HighDegree.lean`).

Headline theorems that are not statable at the pins, with the missing carrier:
- the Keel–Mori theorem (Layer 1): algebraic stacks with finite inertia and coarse moduli spaces;
- coherent Grothendieck duality (Layer 2): the derived pushforward of a morphism of schemes on
  quasi-coherent complexes and its right adjoint `f^×`;
- the Brauer class of an Azumaya algebra over a scheme (Layer 2): sheaves of Azumaya algebras on a
  scheme and the class map to `H²(X_ét, 𝔾_m)`; the pinned `AlgebraicGeometry.Scheme.Gm` lives on
  the big fpqc site, and no class map is defined;
- the Picard torsors of a curve without a rational point (Layer 3): the representing Picard scheme
  and its degree components; the pins have the relative Picard fppf sheaf only;
- Schlessinger's theorem (Layer 4): the Artinian coefficient category `C_Λ` and functors on it;
- Grothendieck–Riemann–Roch (Layer 5): the Chern character, the Todd class and the K-theoretic
  pushforward on `K_0`.
-/

universe u v w

namespace TauCetiRoadmap.SchemeAndStackFoundations

noncomputable section

/-! ## Layer 0: schemes and morphisms -/

section Layer0

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.TensorProduct

/-! ### §0.5 Pseudo-coherent modules -/

namespace PseudoCoherence

/-- A module is pseudo-coherent when it has a resolution by finite free modules, exact in every
degree: Tau Ceti's `TauCeti.Huber.IsPseudoCoherentOver A M ⊤`, on a bundled module. Stacks,
Definition 15.66.1 (064Q). -/
abbrev IsPseudoCoherentModule (A : Type u) [CommRing A] (M : ModuleCat.{u} A) : Prop :=
  TauCeti.Huber.IsPseudoCoherentOver A M ⊤

/-- **The affine criterion for pseudo-coherence.** A module sheaf is pseudo-coherent (Tau Ceti's
`Scheme.Modules.IsPseudoCoherent`, local finite free resolutions) if and only if it is
quasi-coherent and its sections over every affine open are pseudo-coherent modules (Tau Ceti's
`TauCeti.Huber.IsPseudoCoherentOver … ⊤`). Stacks, Lemmas 36.10.1–36.10.2 (08E4). -/
theorem isPseudoCoherentSheaf_iff_affineOpens {X : Scheme.{u}} (F : X.Modules) :
    F.IsPseudoCoherent ↔ F.IsQuasicoherent ∧
      ∀ U : X.affineOpens, TauCeti.Huber.IsPseudoCoherentOver Γ(X, U.1) Γ(F, U.1) ⊤ := by
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

/-! ### §0.12a The strict henselization of a local ring

The carrier is Tau Ceti's `TauCeti.StrictHenselization.algebra R Ω`, the filtered colimit of the
étale `R`-algebras pointed into `Ω`; for `Ω` a separable closure of the residue field it is the
strict henselization, and the pinned library proves that it is henselian local with the universal
property. The two clauses below are what the pin lacks. -/

namespace StrictHenselization

open _root_.IsLocalRing

/-- The residue field of the strict henselization is separably closed. Stacks, Lemma 10.155.2
(04GP), (2). -/
@[stacks 04GP "(2), separably closed residue field"]
theorem isSepClosed_residueField (R : Type u) [CommRing R] [IsLocalRing R] (Ω : Type u) [Field Ω]
    [Algebra R Ω] [Algebra (ResidueField R) Ω] [IsScalarTower R (ResidueField R) Ω]
    [IsSepClosure (ResidueField R) Ω] :
    IsSepClosed (ResidueField (TauCeti.StrictHenselization.algebra R Ω)) := by
  sorry

/-- **Noetherianity.** A local ring is Noetherian if and only if its strict henselization is.
Stacks, Lemma 15.46.3 (06LJ), the equivalence (1) ⇔ (3). -/
@[stacks 06LJ "(1) iff (3)"]
theorem isNoetherianRing_algebra_iff (R : Type u) [CommRing R] [IsLocalRing R] (Ω : Type u)
    [Field Ω] [Algebra R Ω] [Algebra (ResidueField R) Ω] [IsScalarTower R (ResidueField R) Ω]
    [IsSepClosure (ResidueField R) Ω] :
    IsNoetherianRing R ↔ IsNoetherianRing (TauCeti.StrictHenselization.algebra R Ω) := by
  sorry

end StrictHenselization

/-! ### §0.20 Japanese and Nagata rings -/

/-- A complete Noetherian local domain is Japanese (Tau Ceti's `TauCeti.Ring.IsJapanese`):
its integral closure in every finite extension of its fraction field, inseparable extensions
included, is finite. Stacks, Lemma 10.162.8 (032W). -/
theorem Ring.IsJapanese.of_complete_local (A : Type u) [CommRing A] [IsDomain A]
    [IsLocalRing A] [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    TauCeti.Ring.IsJapanese A := by
  sorry

/-- A complete Noetherian local ring is Nagata (Tau Ceti's `TauCeti.Ring.IsNagata`).
Stacks, Lemma 10.162.8 (032W). -/
theorem Ring.IsNagata.of_complete_local (A : Type u) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    TauCeti.Ring.IsNagata A := by
  sorry

/-! ### §0.21 J-2 rings, quasi-excellent and excellent rings -/

namespace Excellence

/-- J-2 rings: Noetherian, and every finite-type algebra has open regular locus (Tau Ceti's
`TauCeti.Excellence.regularLocus`). Stacks, Definition 15.48.1 (3) (07P7). -/
def IsJ2 (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → IsOpen (TauCeti.Excellence.regularLocus B)

/-- Quasi-excellent rings: G-rings (Tau Ceti's `TauCeti.Excellence.IsGRing`) that are J-2.
Stacks, Definition 15.53.1 (1) (07QS); no catenarity is required. -/
def IsQuasiExcellentRing (R : Type u) [CommRing R] : Prop :=
  TauCeti.Excellence.IsGRing R ∧ IsJ2 R

/-- Excellent rings: quasi-excellent and universally catenary (Tau Ceti's
`TauCeti.Excellence.IsUniversallyCatenary`). Stacks, Definition 15.53.1 (2) (07QS). -/
def IsExcellentRing (R : Type u) [CommRing R] : Prop :=
  IsQuasiExcellentRing R ∧ TauCeti.Excellence.IsUniversallyCatenary R

/-- Quasi-excellent rings are Nagata. Stacks, Lemma 15.53.5 (07QV). -/
theorem IsQuasiExcellentRing.isNagata (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : TauCeti.Ring.IsNagata R := by
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

/-- **Topological invariance of the étale site.** Base change along a universal homeomorphism is
an equivalence of small étale categories. Stacks, Theorem 59.45.2 (04DZ). -/
theorem smallEtaleBaseChange_isEquivalence {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) :
    (smallEtaleBaseChange f).IsEquivalence := by
  sorry

end Layer0

/-! ## Layer 1: descent, algebraic spaces and stacks -/

section Layer1

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.Opposite _root_.AlgebraicGeometry
open TauCeti.AlgebraicGeometry (SchemePresheaf)
open TauCeti.AlgebraicGeometry.Spaces (IsAlgebraicSpace EtaleAtlas)

/-! ### §1.8 Fibre products of algebraic spaces -/

namespace Spaces

/-- Fibre products of algebraic spaces (Tau Ceti's `Spaces.IsAlgebraicSpace`) are algebraic
spaces. Stacks, Lemma 65.7.3 (02X2). -/
theorem isAlgebraicSpace_pullback {F G H : SchemePresheaf.{u}} (f : F ⟶ H) (g : G ⟶ H)
    (hF : IsAlgebraicSpace F) (hG : IsAlgebraicSpace G) (hH : IsAlgebraicSpace H) :
    IsAlgebraicSpace (pullback f g) := by
  sorry

end Spaces

/-! ### §1.13–§1.17 Group spaces, torsors and Artin's bootstrap -/

namespace Groups

open _root_.CategoryTheory.MonoidalCategory _root_.CategoryTheory.CartesianMonoidalCategory

noncomputable instance (A : SchemePresheaf.{u}) : CartesianMonoidalCategory (Over A) :=
  Over.cartesianMonoidalCategory A

/-- A group algebraic space over `S`: a group object of `Over h_S` whose underlying presheaf is
an algebraic space. Stacks, Definition 78.5.1 (043H). -/
structure GroupSpace (S : Scheme.{u}) where
  /-- The underlying object over `h_S`. -/
  obj : Over (yoneda.obj S)
  /-- The underlying presheaf is an algebraic space. -/
  isSpace : IsAlgebraicSpace obj.left
  /-- The group structure. -/
  [grp : GrpObj obj]

attribute [instance] GroupSpace.grp

/-- The action morphism `G × X → X` of an action of a group space, Mathlib's `ModObj`.
Stacks, Definition 78.8.1 (043Q). -/
def act {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X] :
    G.obj ⊗ X ⟶ X := ModObj.smul (M := G.obj) (X := X)

/-- Torsors: algebraic spaces with a simply transitive action, fppf locally trivial.
Stacks, Definitions 78.9.1 and 78.9.3 (04TY). -/
structure IsTorsor {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] : Prop where
  isSpace : IsAlgebraicSpace P.left
  pseudo : IsIso (lift (act G P) (snd G.obj P))
  locallyTrivial : ∃ (ι : Type u) (Si : ι → Scheme.{u}) (f : ∀ i, Si i ⟶ S),
    Sieve.ofArrows Si f ∈ Scheme.fppfTopology S ∧
      ∀ i, ∃ σ : yoneda.obj (Si i) ⟶ P.left, σ ≫ P.hom = yoneda.map (f i)

/-- **Representability of torsors.** An fppf sheaf with a pseudo-torsor action, trivial on an fppf
cover, is an algebraic space and a torsor. Stacks, Lemma 80.11.1 (04SK); Poonen, Theorem 6.5.10
(i). -/
theorem torsorRepresentability {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] (hP : Presheaf.IsSheaf Scheme.fppfTopology P.left)
    (hpseudo : IsIso (lift (act G P) (snd G.obj P)))
    (hloc : ∃ (ι : Type u) (Si : ι → Scheme.{u}) (f : ∀ i, Si i ⟶ S),
      Sieve.ofArrows Si f ∈ Scheme.fppfTopology S ∧
        ∀ i, ∃ σ : yoneda.obj (Si i) ⟶ P.left, σ ≫ P.hom = yoneda.map (f i)) :
    IsAlgebraicSpace P.left ∧ IsTorsor G P := by
  sorry

/-- **Artin's bootstrap theorem.** An fppf sheaf with a map from an algebraic space that is
representable by algebraic spaces, flat and locally of finite presentation on étale atlases, and
fppf-locally surjective, is an algebraic space. Stacks, Theorem 80.10.1 (04S6), condition (3). -/
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
  /-- The action by ring automorphisms. -/
  ρ : (L ≃ₐ[k] L) →* RingAut A
  semilinear : ∀ σ c a, ρ σ (c • a) = σ c • ρ σ a
  open_stabilizer : ∀ a : A, IsOpen {σ : L ≃ₐ[k] L | ρ σ a = a}

/-- **Galois descent for affine schemes.** A continuous semilinear action descends to the
invariant algebra, with an equivariant scalar-extension isomorphism. Milne, Algebraic Groups,
A.64. -/
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

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.TensorProduct

/-! ### §2.5–§2.7 Vanishing theorems and local cohomology -/

namespace SiteCohomology

/-- **Grothendieck vanishing** on a Noetherian space of dimension `≤ d`.
Stacks, Proposition 20.20.7 (02UZ). -/
theorem noetherianSpace_vanishing {X : TopCat.{u}} [TopologicalSpace.NoetherianSpace X] (d : ℕ)
    (hd : topologicalKrullDim X ≤ d) (F : TopCat.Sheaf AddCommGrpCat.{u} X) (p : ℕ)
    (hp : d < p) : Subsingleton (Sheaf.H.{u} F p) := by
  sorry

end SiteCohomology

namespace QCoh

/-- **Serre's criterion.** A quasi-compact scheme on which `H¹` of every quasi-coherent module
vanishes is affine. Stacks, Lemmas 30.3.1, 30.3.2 and 30.3.4 (01XE). -/
theorem isAffine_of_H1_vanishing (X : Scheme.{u}) [CompactSpace X]
    (h : ∀ (I : X.Modules) [I.IsQuasicoherent],
      Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology I 1)) :
    IsAffine X := by
  sorry

end QCoh

namespace Supports

/-- **Flat base change of local cohomology** over Noetherian rings: for `A → B` flat, the
`B`-modules `B ⊗_A H^q_I(M)` and `H^q_{IB}(B ⊗_A M)` are isomorphic. Stacks, Lemmas 47.10.3 and
47.9.7. -/
theorem nonempty_localCohomology_flatBaseChange (A B : Type u) [CommRing A] [CommRing B]
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

/-- **Tsen's theorem.** The function field of a curve over an algebraically closed field has
trivial Brauer group. Stacks, Theorems 59.67.8 and 59.67.10 (0A2M). -/
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

/-- Replete categories: limits of towers of epimorphisms have epimorphic projections; Tau Ceti's
`TauCeti.IsReplete`. Bhatt–Scholze 2014, Definition 3.1.1. -/
abbrev IsReplete (T : Type w) [Category.{v} T] : Prop := TauCeti.IsReplete T

/-- The pro-étale topos is replete (Tau Ceti's `TauCeti.IsReplete`). Bhatt–Scholze 2014,
Proposition 4.2.8 (the pro-étale site is locally weakly contractible) with Proposition 3.2.3 (1)
(a topos with enough weakly contractible objects is replete). -/
theorem isReplete_proetale (X : Scheme.{u}) :
    IsReplete (Sheaf (Scheme.ProEt.topology X) (Type u)) := by
  sorry

end Proetale

/-! ### §2.18 Quasi-coherent derived categories -/

namespace Coherent

/-- `D_QCoh(O_X)`: complexes of `O_X`-modules with quasi-coherent cohomology sheaves, inside a
given derived category of `X.Modules`. Stacks, Section 36.3 (06YZ). -/
def DQCoh (X : Scheme.{u}) [HasDerivedCategory.{w} X.Modules] : Type (u + 1) :=
  ObjectProperty.FullSubcategory (fun K : DerivedCategory X.Modules =>
    ∀ n : ℤ, ((DerivedCategory.homologyFunctor X.Modules n).obj K).IsQuasicoherent)

instance (X : Scheme.{u}) [HasDerivedCategory.{w} X.Modules] : Category.{w} (DQCoh X) := by
  unfold DQCoh; infer_instance

/-- For `X = Spec A`, `D(A)` is equivalent to `D_QCoh(O_X)`. Stacks, Lemma 36.3.5 (06Z0). -/
theorem DQCoh.nonempty_equivalence_affine (A : CommRingCat.{u})
    [HasDerivedCategory.{w} (ModuleCat.{u} A)] [HasDerivedCategory.{w} (Spec A).Modules] :
    Nonempty (DerivedCategory (ModuleCat.{u} A) ≌ DQCoh (Spec A)) := by
  sorry

end Coherent

/-! ### §2.22 Azumaya algebras -/

/-- An Azumaya algebra of constant positive degree `d` splits as `d × d` matrices over a
faithfully flat étale algebra. Grothendieck, Brauer I, Théorème 5.1(ii)–(iii), p. 210. -/
theorem IsAzumaya.exists_etale_matrix_splitting (A R : Type u) [CommRing A] [Ring R] [Algebra A R]
    [IsAzumaya A R] (d : ℕ) (hd : 0 < d)
    (hrank : Module.rankAtStalk (R := A) R = fun _ => d * d) :
    ∃ (B : Type u) (_ : CommRing B) (_ : Algebra A B),
      Algebra.Etale A B ∧ Module.FaithfullyFlat A B ∧
        Nonempty (TensorProduct A B R ≃ₐ[B] Matrix (Fin d) (Fin d) B) := by
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

/-- A proper geometrically integral scheme over `k` has `H⁰(X, O_X) = k`.
Stacks, Lemma 33.9.3 (0BUG), part (7). -/
theorem cohomologyDim_zero_structureModule (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))] :
    cohomologyDim k X (structureModule X) 0 = 1 := by
  sorry

/-- **Degree of a pulled-back vector bundle.** For a dominant `k`-morphism `f : X → Y` of proper
integral curves and a vector bundle `E` of constant rank on `Y` (Tau Ceti's
`FiniteLocallyFreeSheaf.FixedRank`, with its `vectorBundleDegree`), `deg f^*E = [K(X) : K(Y)] deg E`,
the function-field degree being taken along `Scheme.Hom.functionFieldMap f`.
Stacks, Lemma 33.44.11 (0AYZ). -/
theorem vectorBundleDegree_pullback (X Y : Scheme.{u})
    [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] [IsIntegral X] [IsIntegral Y]
    [IsProper (X ↘ Spec (.of k))] [IsProper (Y ↘ Spec (.of k))]
    (hX : topologicalKrullDim X = 1) (hY : topologicalKrullDim Y = 1)
    (f : X ⟶ Y) [IsDominant f] (hf : f ≫ (Y ↘ Spec (.of k)) = (X ↘ Spec (.of k)))
    [Algebra Y.functionField X.functionField]
    (halg : algebraMap Y.functionField X.functionField = f.functionFieldMap.hom)
    {r : ℕ} (E : FiniteLocallyFreeSheaf.FixedRank Y r) :
    FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree k
        ((FiniteLocallyFreeSheaf.FixedRank.pullback f).obj E) =
      Module.finrank Y.functionField X.functionField *
        FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree k E := by
  sorry

/-- **Riemann–Hurwitz for finite étale maps** of smooth proper curves: `g_X − 1 = n (g_Y − 1)`.
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

end Layer3

/-! ## Layer 4: deformations, formal schemes, models and alterations -/

section Layer4

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry

namespace Formal

open TauCeti.AlgebraicGeometry (IsFirstOrderThickening)

/-! ### §4.1 The infinitesimal lifting criterion -/

/-- Lifts exist along affine first-order thickenings (Tau Ceti's `IsFirstOrderThickening`) over
the base. Stacks, Definition 37.11.1 (02H0). -/
class FormallySmooth {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  exists_lift : ∀ {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S), g ≫ f = i ≫ h → ∃ l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h

/-- Unique lifts along affine first-order thickenings. Stacks, Definition 37.8.1 (02HG). -/
class FormallyEtale {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  existsUnique_lift : ∀ {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T')
    [IsFirstOrderThickening i] (g : T ⟶ X) (h : T' ⟶ S), g ≫ f = i ≫ h →
      ∃! l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h

/-- **The infinitesimal lifting criterion** for smoothness. Stacks, Lemma 37.11.7 (02H6). -/
theorem smooth_iff_formallySmooth {X S : Scheme.{u}} (f : X ⟶ S)
    [LocallyOfFinitePresentation f] : Smooth f ↔ FormallySmooth f := by
  sorry

/-- The infinitesimal lifting criterion for étaleness. Stacks, Lemma 37.8.10 (02HM). -/
theorem etale_iff_formallyEtale {X S : Scheme.{u}} (f : X ⟶ S)
    [LocallyOfFinitePresentation f] : Etale f ↔ FormallyEtale f := by
  sorry

/-! ### §4.7–§4.10 Existence and algebraization over a complete adic base -/

/-- An adic ring: complete and separated for a finitely generated ideal.
Stacks, Definition 15.37.1 (07E8). -/
structure AdicRing where
  /-- The underlying ring. -/
  carrier : Type u
  [commRing : CommRing carrier]
  /-- The ideal of definition. -/
  ideal : Ideal carrier
  fg : ideal.FG
  [complete : IsAdicComplete ideal carrier]

attribute [instance] AdicRing.commRing AdicRing.complete

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

/-- The transition `X_n → X_{n+1}` between the reductions `X_n = X ×_A A/I^{n+1}` of an
`A`-scheme. -/
def levelIncl (A : AdicRing.{u}) {X : Scheme.{u}} (fX : X ⟶ Spec (CommRingCat.of A.carrier))
    (n : ℕ) : pullback fX (quotMap A n) ⟶ pullback fX (quotMap A (n + 1)) :=
  pullback.map fX (quotMap A n) fX (quotMap A (n + 1)) (𝟙 X) (quotIncl A n) (𝟙 _)
    (by simp) (by
      simp only [Category.comp_id, quotIncl, quotMap, ← Spec.map_comp, ← CommRingCat.ofHom_comp]
      congr 2)

/-- **Grothendieck's existence theorem.** Over a Noetherian adic ring `A`, for `X` proper over
`A`, every compatible system of finitely presented (coherent) modules on the reductions
`X_n = X ×_A A/I^{n+1}` is the system of reductions of a coherent module on `X`. The compatibility
of the identifications is part of the statement. Stacks, Proposition 30.25.4 (088C) and Theorem
30.27.1 (088E). -/
theorem grothendieck_existence (A : AdicRing.{u}) [IsNoetherianRing A.carrier] {X : Scheme.{u}}
    (fX : X ⟶ Spec (CommRingCat.of A.carrier)) [IsProper fX]
    (F : ∀ n, (pullback fX (quotMap A n)).Modules) (hF : ∀ n, (F n).IsFinitePresentation)
    (e : ∀ n, (Scheme.Modules.pullback (levelIncl A fX n)).obj (F (n + 1)) ≅ F n) :
    ∃ (M : X.Modules) (_ : M.IsFinitePresentation)
      (φ : ∀ n, (Scheme.Modules.pullback (pullback.fst fX (quotMap A n))).obj M ≅ F n),
      ∀ n, ((Scheme.Modules.pullbackComp (levelIncl A fX n)
            (pullback.fst fX (quotMap A (n + 1)))).app M).symm ≪≫
          (Scheme.Modules.pullback (levelIncl A fX n)).mapIso (φ (n + 1)) ≪≫ e n =
        (Scheme.Modules.pullbackCongr (by simp [levelIncl] :
            levelIncl A fX n ≫ pullback.fst fX (quotMap A (n + 1)) =
              pullback.fst fX (quotMap A n))).app M ≪≫ φ n := by
  sorry

/-- **Algebraization of morphisms.** A compatible family of morphisms between the reductions of a
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

/-! ### §4.11–§4.17 Alterations, generic flatness, resolution of curves, normal crossings -/

/-- Alterations: proper dominant morphisms finite over a nonempty open of the target.
Stacks, Definition 29.52.12 (0AB0). -/
class IsAlteration {S' S : Scheme.{u}} (f : S' ⟶ S) : Prop extends IsProper f, IsDominant f where
  generically_finite : ∃ U : S.Opens, (U : Set S).Nonempty ∧ IsFinite (f ∣_ U)

/-- Generically étale: the function-field extension `K(S) → K(S')` of an alteration of integral
schemes (Tau Ceti's `Scheme.Hom.functionFieldMap`) is separable. -/
def IsAlteration.IsGenericallyEtale {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
    [IsIntegral S'] [IsAlteration f] : Prop :=
  letI := (Scheme.Hom.functionFieldMap f).hom.toAlgebra
  Algebra.IsSeparable S.functionField S'.functionField

/-- **Generic flatness** over an integral base, without a Noetherian hypothesis; Tau Ceti's
`AlgebraicGeometry.Scheme.Hom.exists_dense_open_flat` is the case of a locally Noetherian reduced base. Stacks, Proposition
29.28.1 (052A). -/
theorem generic_flatness {X S : Scheme.{u}} (f : X ⟶ S) [IsIntegral S] [LocallyOfFiniteType f]
    [QuasiCompact f] : ∃ U : S.Opens, Dense (U : Set S) ∧ Flat (f ∣_ U) := by
  sorry

/-- **Resolution of curves by normalization.** The normalization `Ỹ → Y` of a Noetherian integral
scheme of dimension at most one in its function field, when finite, is regular (Tau Ceti's
`IsRegular`) and a modification (Tau Ceti's `IsModification`). Stacks, Lemmas 33.41.1 (0C45) and
54.15.1 (0BI4). -/
theorem resolution_of_curves (Y : Scheme.{u}) [IsIntegral Y] [IsNoetherian Y]
    (hdim : topologicalKrullDim Y ≤ 1)
    [IsFinite (Y.fromSpecStalk (genericPoint Y)).fromNormalization] :
    TauCeti.AlgebraicGeometry.IsRegular (Y.fromSpecStalk (genericPoint Y)).normalization ∧
      TauCeti.AlgebraicGeometry.IsModification
        (Y.fromSpecStalk (genericPoint Y)).fromNormalization := by
  sorry

/-- Strict normal crossings data: finitely many components. de Jong 1996, 2.4. -/
structure SNCData (X : Scheme.{u}) where
  /-- The index type of the components. -/
  ι : Type u
  [fintype : Fintype ι]
  /-- The ideal sheaves of the components. -/
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

/-- A smooth generic fibre excludes the persistent node. de Jong 1996, 2.23. -/
theorem node_local_structure_dvr_nonzero_of_generic_smooth
    (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] (a : R)
    (hsmooth : Algebra.Smooth (FractionRing R) (FractionRing R ⊗[R]
      (MvPolynomial (Fin 2) R ⧸ Ideal.span
        {MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C a}))) :
    a ≠ 0 := by
  sorry

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

/-- **de Jong's alteration theorem over a field**: a regular proper compactification of an
alteration with strict normal crossings boundary containing the preimage of `Z`, generically
étale over a perfect field. de Jong 1996, Theorem 4.1 and Remark 4.2, p. 66. -/
theorem alteration_theorem (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of k)) [IsIntegral X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] (Z : X.IdealSheafData) (hZ : Z ≠ ⊥) :
    ∃ (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ)
      (Xbar₁ : Scheme.{u}) (j : X₁ ⟶ Xbar₁) (g : Xbar₁ ⟶ Spec (CommRingCat.of k))
      (B : Xbar₁.IdealSheafData),
      IsOpenImmersion j ∧ j ≫ g = φ ≫ f ∧ IsProper g ∧
      TauCeti.AlgebraicGeometry.IsRegular Xbar₁ ∧
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

/-- **de Jong's semistable alteration theorem** over a trait, with proper compactification.
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
open TauCeti.AlgebraicGeometry

/-! ### §5.10 The Hodge index theorem -/

namespace Surface

/-- The intersection pairing of two line bundles on a surface over `k`, through Euler
characteristics: `(L · M) = χ(O) − χ(L⁻¹) − χ(M⁻¹) + χ(L⁻¹ ⊗ M⁻¹)`, with `χ` Tau Ceti's
`Scheme.Modules.eulerCharBelow k X _ 3` (cohomology in degrees `0, 1, 2`) and `L⁻¹` Tau Ceti's
`InvertibleSheaf.dual`. Hartshorne 1977, V.1, Theorem 1.1 and Exercise 1.1. -/
def eulerPairing (k : Type u) [Field k] {X : Scheme.{u}} [X.Over (Spec (.of k))]
    (L M : InvertibleSheaf X) : ℤ :=
  Scheme.Modules.eulerCharBelow k X (InvertibleSheaf.trivial X).obj 3
    - Scheme.Modules.eulerCharBelow k X (InvertibleSheaf.dual L).obj 3
    - Scheme.Modules.eulerCharBelow k X (InvertibleSheaf.dual M).obj 3
    + Scheme.Modules.eulerCharBelow k X
        (InvertibleSheaf.dual (InvertibleSheaf.tensorProduct L M)).obj 3

/-- **The Hodge index theorem.** On a smooth proper geometrically integral surface over an
algebraically closed field, if `H` is ample (Tau Ceti's `LineBundleClass.IsAmple`) and
`D · H = 0`, then `D² ≤ 0`. Hartshorne 1977, V.1, Theorem 1.9. -/
theorem hodge_index (k : Type u) [Field k] [IsAlgClosed k] {X : Scheme.{u}}
    [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 2)
    (H D : InvertibleSheaf X) (hH : (LineBundleClass.mk H).IsAmple)
    (hDH : eulerPairing k D H = 0) : eulerPairing k D D ≤ 0 := by
  sorry

end Surface

/-! ### §5.11 The Weil bound -/

/-- **The Weil bound** for a smooth proper geometrically integral curve over a finite field:
`|#X(𝔽_q) − (q + 1)| ≤ 2g√q`. Milne 2024, Chapter 11, Theorem 11.53 and Example 11.55. -/
theorem weil_bound (k : Type u) [Field k] [Finite k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    [FiniteDimensional k (Scheme.Modules.Cohomology (InvertibleSheaf.trivial X).obj 1)] :
    |(Nat.card {x : Spec (.of k) ⟶ X // x ≫ X ↘ Spec (.of k) = 𝟙 _} : ℝ) -
        (Nat.card k + 1)| ≤
      2 * X.genus k * Real.sqrt (Nat.card k) := by
  sorry

end Layer5

end

end TauCetiRoadmap.SchemeAndStackFoundations

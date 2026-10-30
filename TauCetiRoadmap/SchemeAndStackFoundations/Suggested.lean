import Mathlib
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.AlgebraicGeometry.Cohomology.Genus
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
import TauCeti.AlgebraicGeometry.Morphisms.PureRelativeDimension
import TauCeti.AlgebraicGeometry.Scheme.CodimensionOnePoint

/-!
# Scheme, stack, cohomology and intersection foundations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with the few definitions they need.

Headline theorems that are not statable at the pins, and what each lacks:

* §0.29: the properties of absolute and relative Frobenius of a scheme (integral, a universal
  homeomorphism, an isomorphism for étale morphisms, finite locally free of rank `p^d` in smooth
  relative dimension `d`, base change). The pinned Mathlib has no Frobenius endomorphism of a
  scheme; a body for it needs locality of the `p`-power map on stalks.
* §2.18: gluing of derived morphisms and of derived objects on an open basis (Stacks 0D66,
  0D6C). Derived restriction to an open needs `Scheme.Modules.restrictFunctor` to be additive and
  exact, which the pins do not provide.
* §5.7: `K_0(X) → G_0(X)` is bijective on a regular Noetherian scheme with the resolution
  property (Stacks, Lemma 36.37.4). The exact structures on finitely presented and on finite
  locally free module sheaves need their extension closure, which the pins do not prove.
-/

universe u

namespace TauCetiRoadmap.SchemeAndStackFoundations

noncomputable section

/-! ## Layer 0: schemes and morphisms -/

section Layer0

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.TensorProduct ZeroObject

/-! ### §0.3 Proj and base change -/

namespace Proj

/-- `Proj` of a graded `R`-algebra commutes with base change along `R → R'`.
Stacks, Lemma 27.11.6 (01N2). -/
theorem isPullback_baseChange {R R' A : Type u} [CommRing R] [CommRing R'] [CommRing A]
    [Algebra R A] [Algebra R R'] (𝒜 : ℕ → Submodule R A) [GradedAlgebra 𝒜]
    [GradedAlgebra (fun d => (𝒜 d).baseChange R')] :
    ∃ (f : Proj (fun d => (𝒜 d).baseChange R') ⟶ Proj 𝒜)
      (g : Proj (fun d => (𝒜 d).baseChange R') ⟶ Spec (CommRingCat.of R')),
      IsPullback f g (Proj.toSpecZero 𝒜 ≫ Spec.map (CommRingCat.ofHom (algebraMap R (𝒜 0))))
        (Spec.map (CommRingCat.ofHom (algebraMap R R'))) := by
  sorry

end Proj

/-! ### §0.5 Pseudo-coherent modules -/

namespace PseudoCoherence

/-- A module with a resolution by finite free modules in nonnegative chain degrees.
Stacks, Definition 15.66.1 (064Q). -/
def IsPseudoCoherentModule (A : Type u) [CommRing A] (M : ModuleCat.{u} A) : Prop :=
  ∃ P : ChainComplex (ModuleCat.{u} A) ℕ,
    (∀ n, Module.Free A (P.X n) ∧ Module.Finite A (P.X n)) ∧
    Nonempty (P.homology 0 ≅ M) ∧ ∀ n : ℕ, IsZero (P.homology (n + 1))

/-- Zariski-local resolutions of a module sheaf by finite free module sheaves.
Stacks, §36.10 (08E4). -/
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

/-! ### §0.12 The henselization of a pair -/

namespace Henselization

variable {R : Type u} [CommRing R]

/-- The canonical map `R/I → B/IB`. -/
abbrev reducedMap (I : Ideal R) (B : CommAlgCat.{u} R) :
    R ⧸ I →+* B ⧸ I.map (algebraMap R B) :=
  Ideal.quotientMap (I.map (algebraMap R B)) (algebraMap R B) Ideal.le_comap_map

/-- Étale neighbourhoods of `(R, I)`: étale `R`-algebras `B` with `R/I ≅ B/IB`.
Stacks, Lemma 15.12.1, construction. -/
def IsNeighbourhood (I : Ideal R) : ObjectProperty (CommAlgCat.{u} R) :=
  fun B => Algebra.Etale R B ∧ Function.Bijective (reducedMap I B)

/-- The category of étale neighbourhoods of `(R, I)`. -/
abbrev Neighbourhood (I : Ideal R) := (IsNeighbourhood I).FullSubcategory

theorem neighbourhood_isFiltered (I : Ideal R) : IsFiltered (Neighbourhood I) := by sorry
attribute [instance] neighbourhood_isFiltered

theorem neighbourhood_essentiallySmall (I : Ideal R) :
    EssentiallySmall.{u} (Neighbourhood I) := by sorry
attribute [instance] neighbourhood_essentiallySmall

/-- The neighbourhood diagram on a small model. -/
noncomputable def diagram (I : Ideal R) :
    SmallModel.{u} (Neighbourhood I) ⥤ CommAlgCat.{u} R :=
  (equivSmallModel.{u} (Neighbourhood I)).inverse ⋙ (IsNeighbourhood I).ι

/-- The henselization `R^h` of the pair `(R, I)`: the colimit of its étale neighbourhoods. -/
noncomputable def algebra (I : Ideal R) : CommAlgCat.{u} R := colimit (diagram I)

/-- The extended ideal `I^h = I · R^h`. -/
noncomputable abbrev extended (I : Ideal R) : Ideal (algebra I) :=
  I.map (algebraMap R (algebra I))

/-- `(R^h, I^h)` is a henselian pair. Stacks, Lemma 15.12.1. -/
theorem henselian (I : Ideal R) : HenselianRing (algebra I) (extended I) := by sorry

/-- Universal property: every map from `R` to a henselian pair carrying `I` into the ideal
factors uniquely through `R^h`. Stacks, Lemma 15.12.1. -/
theorem existsUnique_lift (I : Ideal R) {S : Type u} [CommRing S]
    (J : Ideal S) [HenselianRing S J] (f : R →+* S) (hf : I ≤ J.comap f) :
    ∃! g : algebra I →+* S, g.comp (algebraMap R (algebra I)) = f := by sorry

/-- A henselian pair is its own henselization. -/
theorem fixed_of_henselian (I : Ideal R) [HenselianRing R I] :
    Nonempty (algebra I ≃ₐ[R] R) := by sorry

example (I : Ideal R) [HenselianRing R I] : Nonempty (algebra I ≃ₐ[R] R) :=
  fixed_of_henselian I

end Henselization

/-! ### §0.20 Japanese and Nagata rings -/

/-- A domain is Japanese (N-2) if its integral closure in every finite extension of its fraction
field is a finite module, inseparable extensions included. Stacks, Definition 10.161.1 (032F). -/
def Ring.IsJapanese (R : Type u) [CommRing R] [IsDomain R] : Prop :=
  ∀ (L : Type u) [Field L] [Algebra R L] [Algebra (FractionRing R) L]
    [IsScalarTower R (FractionRing R) L] [FiniteDimensional (FractionRing R) L],
    Module.Finite R (integralClosure R L)

/-- A ring is Nagata if it is Noetherian and every quotient by a prime is Japanese.
Stacks, Definition 10.162.1 (032R). -/
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
extensions. Stacks, Lemma 10.166.1 and Definition 10.166.2. -/
def GeometricallyRegular (k B : Type u) [Field k] [CommRing B] [Algebra k B] : Prop :=
  IsNoetherianRing B ∧
    ∀ (L : Type u) [Field L] [Algebra k L], Module.Finite k L →
      IsPurelyInseparable k L → IsRegularRing (L ⊗[k] B)

/-- Flat with geometrically regular fibres. Stacks, Definition 15.42.1. -/
def RegularAlgebraMap (R B : Type u) [CommRing R] [CommRing B] [Algebra R B] : Prop :=
  Module.Flat R B ∧ ∀ p : PrimeSpectrum R,
    GeometricallyRegular p.asIdeal.ResidueField (p.asIdeal.Fiber B)

/-- The regular locus; it need not be open. Stacks, §15.48. -/
def regularLocus (R : Type u) [CommRing R] : Set (PrimeSpectrum R) :=
  {p | IsRegularLocalRing (Localization.AtPrime p.asIdeal)}

/-- G-rings: Noetherian, with regular formal fibres at every prime. Stacks, Definition 15.51.1. -/
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

/-- Catenary rings: chains between two primes are bounded and all saturated chains between them
have one length. Stacks, Definition 10.105.1 (00NI). -/
def IsCatenary (R : Type u) [CommRing R] : Prop :=
  ∀ p q : PrimeSpectrum R, p ≤ q →
    (∃ n : ℕ, ∀ s : LTSeries (PrimeSpectrum R), s.head = p → s.last = q → s.length ≤ n) ∧
    ∀ s t : LTSeries (PrimeSpectrum R),
      s.head = p → s.last = q → t.head = p → t.last = q →
      (∀ i : Fin s.length, s (Fin.castSucc i) ⋖ s i.succ) →
      (∀ i : Fin t.length, t (Fin.castSucc i) ⋖ t i.succ) → s.length = t.length

/-- Quasi-excellent and universally catenary. Stacks, Definition 15.53.1 (2). -/
def IsExcellentRing (R : Type u) [CommRing R] : Prop :=
  IsQuasiExcellentRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → IsCatenary B

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

/-- The forward functor of topological invariance is scheme base change. -/
theorem universalHomeomorphismEtaleEquivalence_functor {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) :
    (universalHomeomorphismEtaleEquivalence f hf).functor = smallEtaleBaseChange f := by
  sorry

/-- The forward and inverse functors preserve covering sieves. -/
theorem universalHomeomorphismEtaleEquivalence_coverPreserving {X Y : Scheme.{u}} (f : X ⟶ Y)
    (hf : (topologically IsHomeomorph).universally f) :
    CoverPreserving (Scheme.smallEtaleTopology Y) (Scheme.smallEtaleTopology X)
      (universalHomeomorphismEtaleEquivalence f hf).functor ∧
    CoverPreserving (Scheme.smallEtaleTopology X) (Scheme.smallEtaleTopology Y)
      (universalHomeomorphismEtaleEquivalence f hf).inverse := by
  sorry

/-- Identity compatibility uses the canonical pullback comparison. -/
theorem universalHomeomorphismEtaleEquivalence_id (X : Scheme.{u})
    (hX : (topologically IsHomeomorph).universally (𝟙 X)) :
    ∃ e : (universalHomeomorphismEtaleEquivalence (𝟙 X) hX).functor ≅ 𝟭 X.Etale,
      ∀ V : X.Etale, (e.hom.app V).left = pullback.fst V.hom (𝟙 X) := by sorry

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

/-! ### §0.27 Flat base change of annihilators -/

namespace FlatAnnihilator

/-- For `R → S` flat and `M` finite, `Ann_S(S ⊗ M) = Ann_R(M) · S`. Stacks, Lemma 10.40.4. -/
theorem annihilator_flat_baseChange {R S M : Type u} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] [Module.Flat R S] [Module.Finite R M] :
    (Module.annihilator R M).map (algebraMap R S) =
      Module.annihilator S (S ⊗[R] M) := by
  sorry

/-- Flat base change preserves the annihilator of the unit pure tensor, for any module. -/
theorem element_annihilator_flat_baseChange {R S M : Type u}
    [CommRing R] [CommRing S] [Algebra R S] [AddCommGroup M] [Module R M]
    [Module.Flat R S] (m : M) :
    (Submodule.span R {m}).annihilator.map (algebraMap R S) =
      (Submodule.span S {(1 : S) ⊗ₜ[R] m}).annihilator := by sorry

section Nonflat
local instance : Algebra (ZMod 4) (ZMod 2) :=
  (ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2)).toAlgebra

end Nonflat

end FlatAnnihilator

/-! ### §0.29 Scheme Frobenius -/

namespace SchemeFrobenius

open AlgebraicGeometry CategoryTheory.Limits

/-- Intrinsic characteristic `p`: every local ring has characteristic `p`. -/
def SchemeCharP (X : Scheme.{u}) (p : ℕ) : Prop :=
  ∀ x : X, CharP (X.presheaf.stalk x) p

variable (p : ℕ) [Fact p.Prime]

/-- On affine schemes intrinsic characteristic means `p = 0`, including the zero ring. -/
theorem schemeCharP_spec_iff (A : Type u) [CommRing A] :
    SchemeCharP (Spec (CommRingCat.of A)) p ↔ (p : A) = 0 := sorry

/-- Intrinsic characteristic is equivalent to a unique prime-field structure map. -/
theorem schemeCharP_iff_structureMap (X : Scheme.{u}) :
    SchemeCharP X p ↔ ∃! f : X ⟶ Spec (CommRingCat.of (ULift.{u} (ZMod p))), True := sorry

/-- A scheme mapping to a characteristic-`p` scheme has characteristic `p`. -/
theorem schemeCharP_of_hom {X S : Scheme.{u}} (f : X ⟶ S) (hS : SchemeCharP S p) :
    SchemeCharP X p := by
  sorry

end SchemeFrobenius

/-! ### §0.30 Normal schemes, codimension-one points under finite morphisms, ramification -/

namespace NormalSchemes

open Order

/-- A scheme is **normal** if every local ring is an integrally closed domain.
Stacks, Definition 28.7.1 (033I). -/
@[stacks 033I]
class IsNormalScheme (X : Scheme.{u}) : Prop where
  isDomain_stalk : ∀ x : X, IsDomain (X.presheaf.stalk x)
  isIntegrallyClosed_stalk : ∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)

instance IsNormalScheme.isDomain_stalk' (X : Scheme.{u}) [IsNormalScheme X] (x : X) :
    IsDomain (X.presheaf.stalk x) :=
  IsNormalScheme.isDomain_stalk x

/-- A normal scheme is reduced. Stacks, Lemma 28.7.3 (033K). -/
@[stacks 033K]
theorem IsNormalScheme.isReduced (X : Scheme.{u}) [IsNormalScheme X] : IsReduced X := by
  sorry

/-- On a locally Noetherian normal scheme the stalk at a point of coheight one is a discrete
valuation ring. Stacks, Lemma 10.119.7 (00PD). -/
@[stacks 00PD "the codimension-one stalk"]
theorem IsNormalScheme.isDiscreteValuationRing_stalk (X : Scheme.{u}) [IsLocallyNoetherian X]
    [IsNormalScheme X] (x : X) (hx : coheight x = 1) :
    IsDiscreteValuationRing (X.presheaf.stalk x) := by
  sorry

variable {X Y : Scheme.{u}} (f : X ⟶ Y)

/-- A point over a point of coheight one under a finite dominant morphism of integral schemes has
coheight one (incomparability, with dominance). -/
theorem coheight_eq_one_of_coheight_apply_eq_one [IsFinite f] [IsDominant f] [IsIntegral X]
    [IsIntegral Y] (x : X) (hx : coheight (f x) = 1) : coheight x = 1 := by
  sorry

/-- The image of a point of coheight one under a finite dominant morphism of integral schemes,
with target locally of finite type over a field and Noetherian: the local dimension formula
`dim_x X = trdeg_k κ(x) + dim 𝒪_{X,x}` (Stacks, Lemma 33.20.3 (0A21)) on `X` and on `Y`, with
`dim X = dim Y` (Stacks, Lemma 29.45.9 (0ECG)) and `[κ(x) : κ(f x)] < ∞`. -/
theorem coheight_apply_eq_one (k : Type u) [Field k] (sY : Y ⟶ Spec (.of k))
    [LocallyOfFiniteType sY] [IsLocallyNoetherian Y] [TopologicalSpace.NoetherianSpace Y]
    [IsFinite f] [IsDominant f] [IsIntegral X] [IsIntegral Y]
    (x : X) (hx : coheight x = 1) : coheight (f x) = 1 := by
  sorry

/-- The image of a point of coheight one under a finite dominant morphism of integral schemes
with normal target has coheight one: going down (Stacks, Proposition 10.38.7 (00H8)). -/
theorem coheight_apply_eq_one_of_isNormalScheme [IsLocallyNoetherian Y] [IsNormalScheme Y]
    [IsFinite f] [IsDominant f] [IsIntegral X] [IsIntegral Y]
    (x : X) (hx : coheight x = 1) : coheight (f x) = 1 := by
  sorry

/-- The map on codimension-one points induced by `f`, given that `f` preserves coheight one
(supplied by `coheight_apply_eq_one` or `coheight_apply_eq_one_of_isNormalScheme`). -/
def codimensionOneMap (hf : ∀ x : X, coheight x = 1 → coheight (f x) = 1) :
    TauCeti.AlgebraicGeometry.CodimensionOnePoint X →
      TauCeti.AlgebraicGeometry.CodimensionOnePoint Y :=
  fun x => ⟨f x, hf x x.2⟩

/-- Every codimension-one point of the target of a finite dominant morphism of integral schemes is
the image of a codimension-one point. -/
theorem codimensionOneMap_surjective [IsFinite f] [IsDominant f] [IsIntegral X] [IsIntegral Y]
    (hf : ∀ x : X, coheight x = 1 → coheight (f x) = 1) :
    Function.Surjective (codimensionOneMap f hf) := by
  sorry

/-- The **ramification index of `f` at `x`**: the ramification index of the maximal ideal of
`𝒪_{X,x}` over `𝒪_{Y,f(x)}` along the stalk map. -/
def ramificationIdxAt (x : X) : ℕ :=
  letI := (f.stalkMap x).hom.toAlgebra
  (IsLocalRing.maximalIdeal (X.presheaf.stalk x)).ramificationIdx (Y.presheaf.stalk (f x))

/-- Ramification indices multiply in towers at points of coheight one. The stalk map of `f ≫ g`
at `x` is the composite of the stalk maps (`Scheme.Hom.stalkMap_comp`), and the extensions of
discrete valuation rings are torsion free, hence flat, as `Ideal.ramificationIdx_tower` requires. -/
theorem ramificationIdxAt_comp {Z : Scheme.{u}} (g : Y ⟶ Z) [IsFinite f] [IsDominant f]
    [IsFinite g] [IsDominant g] [IsIntegral X] [IsIntegral Y] [IsIntegral Z]
    [IsLocallyNoetherian X] [IsLocallyNoetherian Y] [IsLocallyNoetherian Z]
    [IsNormalScheme X] [IsNormalScheme Y] [IsNormalScheme Z]
    (x : X) (hx : coheight x = 1) :
    ramificationIdxAt (f ≫ g) x = ramificationIdxAt f x * ramificationIdxAt g (f x) := by
  sorry

/-- **Regular quotients of a regular local ring.** If `R ⧸ I` is a regular local ring, `I` is
generated by part of a minimal generating set of the maximal ideal. Stacks, Lemma 10.106.4
(00NR). -/
@[stacks 00NR]
theorem exists_regularSystem_of_quotient {R : Type u} [CommRing R]
    [IsRegularLocalRing R] (I : Ideal R) [IsRegularLocalRing (R ⧸ I)] :
    ∃ (d c : ℕ) (x : Fin d → R), c ≤ d ∧
      Ideal.span (Set.range x) = IsLocalRing.maximalIdeal R ∧
      (IsLocalRing.maximalIdeal R).spanFinrank = d ∧
      I = Ideal.span (x '' {i | (i : ℕ) < c}) := by
  sorry

end NormalSchemes

end Layer0

/-! ## Layer 1: descent, algebraic spaces and stacks -/

section Layer1

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.Opposite _root_.AlgebraicGeometry

/-- Presheaves of sets on the big category of schemes. -/
abbrev SchemePresheaf := Scheme.{u}ᵒᵖ ⥤ Type u

/-- `Cat`-valued pseudofunctors on schemes, the carriers of stacks. -/
abbrev SchPseudofunctor := Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u, u + 1}

/-! ### §1.3–§1.10 Algebraic spaces -/

namespace Spaces

/-- The diagonal `F → F × F` is relatively representable by schemes. -/
def RepresentableDiagonal (F : SchemePresheaf.{u}) : Prop :=
  yoneda.relativelyRepresentable (prod.lift (𝟙 F) (𝟙 F))

/-- `a : h_U → F` is representable, and étale and surjective after every base change to a
scheme. -/
def EtaleAtlas (F : SchemePresheaf.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F) : Prop :=
  MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
    MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a

/-- An algebraic space: an fppf sheaf with representable diagonal and an étale atlas.
Stacks, Definition 65.6.1 (025Y). -/
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

/-- The underlying category of the small étale site: algebraic spaces étale over `F`.
Stacks, Definition 66.18.1 (03ED). Its objects must be spaces, not schemes. -/
def smallEtale (F : AlgSpace.{u}) : Type (u + 1) :=
  ObjectProperty.FullSubcategory
    (fun (V : Over F) => EtaleLocal (@Etale : MorphismProperty Scheme.{u}) V.hom)

instance (F : AlgSpace.{u}) : Category.{u + 1} (smallEtale F) := by
  unfold smallEtale; infer_instance

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

/-- Invariant morphisms for a pre-relation `s, t : R → U`. -/
def IsInvariant {U R X : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X) : Prop :=
  s ≫ φ = t ≫ φ

/-- Categorical quotients in algebraic spaces. Stacks, Definition 83.4.1 (048J). -/
def IsCategoricalQuotient {U R X : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X) : Prop :=
  IsAlgebraicSpace X ∧ IsInvariant s t φ ∧
    ∀ (Y : SchemePresheaf.{u}), IsAlgebraicSpace Y → ∀ ψ : U ⟶ Y, IsInvariant s t ψ →
      ∃! χ : X ⟶ Y, φ ≫ χ = ψ

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

/-! ### §1.18 Stacks in groupoids -/

namespace Stacks

/-- A stack in groupoids over the big fppf site. Stacks, Definitions 8.4.1 (026F) and
8.5.1 (02ZI). -/
structure StackInGroupoids where
  toPseudofunctor : SchPseudofunctor.{u}
  isGroupoid : ∀ T : Scheme.{u}, IsGroupoid (toPseudofunctor.obj ⟨op T⟩)
  isStack : toPseudofunctor.IsStack Scheme.fppfTopology

/-! ### §1.20 Compatible valuative lifts -/

/-- A lift of a specified 2-commutative square, retaining the generic identification,
the base identification and their compatibility with the strong naturality constraint.
For a valuation ring this is the dotted-arrow datum of Stacks, Definition 101.39.1 (0CLA). -/
structure ValuativeLift {X Y : StackInGroupoids.{u}}
    (f : Pseudofunctor.StrongTrans X.toPseudofunctor Y.toPseudofunctor)
    {T S : Scheme.{u}} (j : T ⟶ S)
    (x : X.toPseudofunctor.obj ⟨op T⟩) (y : Y.toPseudofunctor.obj ⟨op S⟩)
    (γ : (Y.toPseudofunctor.map ⟨j.op⟩).toFunctor.obj y ≅
      (f.app ⟨op T⟩).toFunctor.obj x) where
  obj : X.toPseudofunctor.obj ⟨op S⟩
  genericIso : (X.toPseudofunctor.map ⟨j.op⟩).toFunctor.obj obj ≅ x
  baseIso : y ≅ (f.app ⟨op S⟩).toFunctor.obj obj
  compatibility :
    (Y.toPseudofunctor.map ⟨j.op⟩).toFunctor.mapIso baseIso ≪≫
      ((Cat.Hom.toNatIso (f.naturality ⟨j.op⟩)).app obj).symm ≪≫
      (f.app ⟨op T⟩).toFunctor.mapIso genericIso = γ

/-- Transport a lift along a chosen isomorphism of generic objects, carrying that
isomorphism into both the generic identification and the specified square.
Stacks, Definition 101.39.1 (0CLA). -/
def ValuativeLift.reidentify {X Y : StackInGroupoids.{u}}
    {f : Pseudofunctor.StrongTrans X.toPseudofunctor Y.toPseudofunctor}
    {T S : Scheme.{u}} {j : T ⟶ S}
    {x x' : X.toPseudofunctor.obj ⟨op T⟩} {y : Y.toPseudofunctor.obj ⟨op S⟩}
    {γ : (Y.toPseudofunctor.map ⟨j.op⟩).toFunctor.obj y ≅
      (f.app ⟨op T⟩).toFunctor.obj x}
    (L : ValuativeLift f j x y γ) (e : x ≅ x') :
    ValuativeLift f j x' y (γ ≪≫ (f.app ⟨op T⟩).toFunctor.mapIso e) where
  obj := L.obj
  genericIso := L.genericIso ≪≫ e
  baseIso := L.baseIso
  compatibility := by
    simpa only [Functor.mapIso_trans, Iso.trans_assoc] using
      congrArg (fun δ => δ ≪≫ (f.app ⟨op T⟩).toFunctor.mapIso e) L.compatibility

-- `stackDVR_representable`: proper scheme morphisms have lifts over the original ring,
-- agreeing with the discrete compatible-lift groupoid in §1.20.
example {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] : ValuativeCriterion f := by
  have h : ((ValuativeCriterion ⊓ @QuasiCompact ⊓ @QuasiSeparated ⊓
      @LocallyOfFiniteType) : MorphismProperty Scheme.{u}) f := by
    rw [← IsProper.eq_valuativeCriterion]
    infer_instance
  exact h.1.1.1

end Stacks

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

/-- Over an affine base, the cohomology of quasi-coherent modules on the source of a qcqs
morphism vanishes in a range depending only on the morphism. Stacks, Lemmas 30.4.1–30.4.6 (01XH). -/
theorem higherDirectImage_vanishing {X S : Scheme.{u}} (f : X ⟶ S) [QuasiCompact f]
    [QuasiSeparated f] [IsAffine S] :
    ∃ N : ℕ, ∀ (F : X.Modules) [F.IsQuasicoherent] (p : ℕ), N ≤ p →
      Subsingleton (Scheme.Modules.Cohomology F p) := by
  sorry

/-- Serre's criterion: a quasi-compact scheme on which `H¹` of every quasi-coherent module
vanishes is affine. Stacks, Lemmas 30.3.1, 30.3.2 and 30.3.4 (01XE). -/
theorem isAffine_of_H1_vanishing (X : Scheme.{u}) [CompactSpace X]
    (h : ∀ (I : X.Modules) [I.IsQuasicoherent], Subsingleton (Scheme.Modules.Cohomology I 1)) :
    IsAffine X := by
  sorry

end QCoh

namespace Supports

/-- Degree zero of the colimit-of-Ext local cohomology is the `I`-power torsion, for any
commutative ring. Stacks, Lemma 47.8.2 (0954). -/
theorem localCohomology_degreeZero (A : Type u) [CommRing A] (I : Ideal A)
    (M : ModuleCat.{u} A) :
    Nonempty ((localCohomology I 0).obj M ≃
      {m : M // ∃ n : ℕ, ∀ a ∈ I ^ n, a • m = 0}) := by
  sorry

/-- Flat base change of local cohomology over Noetherian rings. Stacks, Lemmas 47.10.3 and
47.9.7. -/
theorem localCohomology_flat_baseChange (A B : Type u) [CommRing A] [CommRing B]
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

/-- The cartesian square `U ×_X V → V, U`, `j`, `p`. -/
def toSquare {X : Scheme.{u}} (S : ElementaryDistinguishedSquare X) : Square Scheme.{u} :=
  { f₁₂ := pullback.fst S.j S.p, f₁₃ := pullback.snd S.j S.p, f₂₄ := S.j, f₃₄ := S.p,
    fac := pullback.condition }

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
3.1.1. -/
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

/-- For `X = Spec A`, `D(A) ≌ D_QCoh(O_X)`. Stacks, Lemma 36.3.5 (06Z0). -/
theorem DQCoh.affineEquiv (A : CommRingCat.{u}) :
    letI := HasDerivedCategory.standard (ModuleCat.{u} A)
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
proper integral curves. Stacks, Lemma 33.44.11 (0AYZ). -/
theorem vectorBundleDegree_pullback (X Y : Scheme.{u})
    [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))] [IsIntegral X] [IsIntegral Y]
    [IsProper (X ↘ Spec (.of k))] [IsProper (Y ↘ Spec (.of k))]
    (hX : topologicalKrullDim X = 1) (hY : topologicalKrullDim Y = 1)
    (f : X ⟶ Y) [IsDominant f] (hf : f ≫ (Y ↘ Spec (.of k)) = (X ↘ Spec (.of k)))
    (E : Y.Modules) (r : ℕ) (hE : isFiniteLocallyFreeOfRank E r) :
    let φ := Y.presheaf.stalkSpecializes
      (show f (genericPoint X) ⤳ genericPoint Y by
        have h := (genericPoint_spec X).image f.continuous
        rw [Set.image_univ, (Scheme.Hom.denseRange f).closure_range] at h
        exact h.specializes (Set.mem_univ _)) ≫ f.stalkMap (genericPoint X)
    letI := φ.hom.toAlgebra
    vectorBundleDegree k X ((Scheme.Modules.pullback f).obj E) r =
      Module.finrank Y.functionField X.functionField * vectorBundleDegree k Y E r := by sorry

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

/-- On an affine scheme, line-bundle classes are Mathlib's `CommRing.Pic`. -/
theorem lineBundleClass_spec_equiv_pic (R : Type u) [CommRing R] :
    Nonempty (TauCeti.AlgebraicGeometry.LineBundleClass (Spec (.of R)) ≃ CommRing.Pic R) := by
  sorry

end Picard

end Layer3

/-! ## Layer 4: deformations, formal schemes, models and alterations -/

section Layer4

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry

namespace Formal

/-! ### §4.1 Thickenings and the infinitesimal lifting criterion -/

/-- A thickening: a closed immersion surjective on points. Stacks, Definition 37.2.1 (04EX). -/
class IsThickening {Z X : Scheme.{u}} (i : Z ⟶ X) : Prop extends IsClosedImmersion i,
  Surjective i

/-- A first-order thickening: a closed immersion whose ideal squares to zero.
Stacks, Definition 37.2.1 (04EX). -/
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

/-- For a finitely generated ideal, vanishing of a module element on every principal open
of its complement is equivalent to annihilation by one power of the ideal. This gives the
affine degree-zero support comparison for strict transforms. Stacks, Lemma 47.9.1 (0A6R). -/
theorem strictTransform_supportComparison_affine (A : Type u) [CommRing A]
    (I : Ideal A) (hI : I.FG) (M : ModuleCat.{u} A) (m : M) :
    (∀ a ∈ I, ∃ n : ℕ, a ^ n • m = 0) ↔
      ∃ n : ℕ, ∀ a ∈ I ^ n, a • m = 0 := by
  sorry

/-- Proper morphisms that are isomorphisms over a dense open with dense preimage.
Stacks, Definition 29.52.11 (0AAZ). -/
class IsModification {S' S : Scheme.{u}} (f : S' ⟶ S) : Prop where
  isProper : IsProper f
  birational : ∃ U : S.Opens, Dense (U : Set S) ∧ Dense ((f ⁻¹ᵁ U : S'.Opens) : Set S') ∧
    IsIso (f ∣_ U)

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

/-- Regular schemes: locally Noetherian with regular local rings. -/
class IsRegular (X : Scheme.{u}) : Prop where
  isLocallyNoetherian : IsLocallyNoetherian X
  isRegularLocalRing : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)

/-- Resolution of curves by normalization: the normalization `Ỹ → Y` of `Y` in its function field
`Spec K(Y) → Y`, when finite (Nagata), is regular and a modification.
Stacks, Lemmas 33.41.1 (0C45) and 54.15.1 (0BI4). -/
theorem resolution_of_curves (Y : Scheme.{u}) [IsIntegral Y] [IsNoetherian Y]
    (hdim : topologicalKrullDim Y ≤ 1)
    [IsFinite (Y.fromSpecStalk (genericPoint Y)).fromNormalization] :
    IsRegular (Y.fromSpecStalk (genericPoint Y)).normalization ∧
      IsModification (Y.fromSpecStalk (genericPoint Y)).fromNormalization := by
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

/-- A smooth generic fibre excludes the persistent node. de Jong 1996, 2.23. -/
theorem node_local_structure_dvr_nonzero_of_generic_smooth
    (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] (a : R)
    (hsmooth : Algebra.Smooth (FractionRing R) (FractionRing R ⊗[R]
      (MvPolynomial (Fin 2) R ⧸ Ideal.span
        {MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C a}))) :
    a ≠ 0 := by
  sorry

/-- Substituting `u = sa`, `v = sb` into `uv = s³t` factors its equation by `s²`.
The residual chart `ab = st` has a singular origin of dimension three and embedding dimension
four, although the codimension-two component of thickness three has disappeared.
de Jong 1996, 3.4–3.6, pp. 63–65. -/
theorem nodal_codim_two_thickness_three_residual (k : Type u) [Field k] [IsAlgClosed k]
    [CharZero k] :
    let P := MvPolynomial (Fin 4) k
    let a : P := MvPolynomial.X 0
    let b : P := MvPolynomial.X 1
    let s : P := MvPolynomial.X 2
    let t : P := MvPolynomial.X 3
    let I : Ideal P := Ideal.span {a * b - s * t}
    let A := P ⧸ I
    let m : Ideal A := Ideal.span
      (Set.range fun i : Fin 4 => Ideal.Quotient.mk I (MvPolynomial.X i))
    (s * a) * (s * b) - s ^ 3 * t = s ^ 2 * (a * b - s * t) ∧
      ∃ hm : m.IsMaximal,
        letI : m.IsMaximal := hm
        let L := Localization.AtPrime m
        ringKrullDim L = 3 ∧
          Module.finrank (IsLocalRing.ResidueField L) (IsLocalRing.CotangentSpace L) = 4 ∧
          ¬ IsRegularLocalRing L := by
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

/-- de Jong's alteration theorem over a field: a regular proper compactification of an
alteration with strict normal crossings boundary containing the preimage of `Z`, generically
étale over a perfect field. de Jong 1996, Theorem 4.1 and Remark 4.2, p. 66. -/
theorem alteration_theorem (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of k)) [IsIntegral X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] (Z : X.IdealSheafData) (hZ : Z ≠ ⊥) :
    ∃ (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ)
      (Xbar₁ : Scheme.{u}) (j : X₁ ⟶ Xbar₁) (g : Xbar₁ ⟶ Spec (CommRingCat.of k))
      (B : Xbar₁.IdealSheafData),
      IsOpenImmersion j ∧ j ≫ g = φ ≫ f ∧ IsProper g ∧ IsRegular Xbar₁ ∧
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

namespace Chow

variable (κ : Type u) [Field κ]

/-- Cycles of dimension `k`: coefficients supported at points `x` with `Order.height x = k`,
the dimension of the closure of `x` in Mathlib's specialisation order.
Stacks, Definition 42.8.1 (02QR) and Lemma 42.7.5 (02QO). -/
def cyclesOfDimension (X : Scheme.{u}) [X.Over (Spec (.of κ))]
    [LocallyOfFiniteType (X ↘ Spec (.of κ))] (k : ℤ) : AddSubgroup (AlgebraicCycle X ℤ) :=
  Function.locallyFinsuppWithin.supported ℤ Set.univ
    {x : X | ∃ n : ℕ, k = (n : ℤ) ∧ Order.height x = n}

attribute [local instance] Classical.propDecidable

/-- Rational equivalence: the subgroup generated by the sums of principal divisors on a locally
finite family of integral closed subschemes of dimension `k + 1` (these sums already form a
subgroup). Stacks, Definition 42.19.1 (02RW). -/
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

/-- `CH_k(X)`: `k`-cycles modulo rational equivalence. -/
def ChowGroup (X : Scheme.{u}) [X.Over (Spec (.of κ))]
    [LocallyOfFiniteType (X ↘ Spec (.of κ))] (k : ℤ) : Type u :=
  cyclesOfDimension κ X k ⧸ RatEquiv κ X k

instance (X : Scheme.{u}) [X.Over (Spec (.of κ))] [LocallyOfFiniteType (X ↘ Spec (.of κ))]
    (k : ℤ) : AddCommGroup (ChowGroup κ X k) :=
  inferInstanceAs (AddCommGroup (cyclesOfDimension κ X k ⧸ RatEquiv κ X k))

/-- The class of a cycle. -/
def cycleClass (X : Scheme.{u}) [X.Over (Spec (.of κ))]
    [LocallyOfFiniteType (X ↘ Spec (.of κ))] (k : ℤ) :
    cyclesOfDimension κ X k →+ ChowGroup κ X k :=
  QuotientAddGroup.mk' _

/-- Chow groups of a coproduct are the product of the Chow groups, for any small family.
Stacks, Definition 42.19.1 (02RW). -/
theorem CH_coprod (I : Type u) (X : I → Scheme.{u})
    [∀ i, (X i).Over (Spec (.of κ))]
    [∀ i, LocallyOfFiniteType (X i ↘ Spec (.of κ))] (k : ℤ) :
    letI : (∐ X).Over (Spec (.of κ)) := ⟨Sigma.desc (fun i => X i ↘ Spec (.of κ))⟩
    letI : LocallyOfFiniteType ((∐ X) ↘ Spec (.of κ)) := by sorry
    Nonempty (ChowGroup κ (∐ X) k ≃+ ∀ i, ChowGroup κ (X i) k) := by
  sorry

end Chow

/-! ### §5.11 The Weil bound -/

/-- The Weil bound for a smooth proper geometrically integral curve over a finite field:
`|#X(𝔽_q) − (q + 1)| ≤ 2g√q`. Milne 2024, Chapter 11, Theorem 11.53 and Example 11.55. -/
theorem weil_bound (k : Type u) [Field k] [Fintype k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    [FiniteDimensional k (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X).obj 1)] :
    |(Nat.card {x : Spec (.of k) ⟶ X // x ≫ X ↘ Spec (.of k) = 𝟙 _} : ℝ) -
        (Fintype.card k + 1)| ≤
      2 * X.genus k * Real.sqrt (Fintype.card k) := by
  sorry

end Layer5

end

end TauCetiRoadmap.SchemeAndStackFoundations

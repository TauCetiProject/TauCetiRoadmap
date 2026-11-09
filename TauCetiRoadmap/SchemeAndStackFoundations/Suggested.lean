import Mathlib
import TauCetiRoadmap.AlgebraicVectorBundles.Suggested
import TauCeti.CategoryTheory.Exact.Abelian
import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.AlgebraicGeometry.Cohomology.Genus
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
import TauCeti.AlgebraicGeometry.Morphisms.PureRelativeDimension
import TauCeti.AlgebraicGeometry.Scheme.CodimensionOnePoint

/-!
# Scheme, stack, cohomology and intersection foundations

Key definitions and headline theorems of the roadmap on Mathlib's schemes and Tau Ceti's
carriers. The README is the specification and states every other target.
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

-- Finite free and zero modules and sheaves have finite free resolutions.
example (A : Type u) [CommRing A] (n : ℕ) :
    IsPseudoCoherentModule A (ModuleCat.of A (Fin n → A)) := by sorry
example (A : Type u) [CommRing A] : IsPseudoCoherentModule A (0 : ModuleCat.{u} A) := by
  sorry
example (X : Scheme.{u}) (n : ℕ) :
    IsPseudoCoherentSheaf (SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin n))) := by
  sorry
example (X : Scheme.{u}) : IsPseudoCoherentSheaf (0 : X.Modules) := by sorry
example (A : Type u) [CommRing A] (M : ModuleCat.{u} A)
    (hM : ¬ Module.FinitePresentation A M) : ¬ IsPseudoCoherentModule A M := by sorry
example (M : ModuleCat.{0} ℤ) : IsPseudoCoherentModule ℤ M ↔ Module.Finite ℤ M := by sorry

-- The residue module over the dual numbers has a periodic infinite free resolution.
example (k : Type u) [Field k] :
    let J : Ideal (Polynomial k) := Ideal.span {(Polynomial.X : Polynomial k) ^ 2}
    let A := Polynomial k ⧸ J
    let I : Ideal A := Ideal.span {Ideal.Quotient.mk J Polynomial.X}
    let M := ModuleCat.of A (A ⧸ I)
    IsPseudoCoherentModule A M ∧ ∀ n : ℕ, ¬ HasProjectiveDimensionLE M n := by sorry

-- A cyclic module over infinitely many variables need not be finitely presented.
example (k : Type u) [Field k] :
    let A := MvPolynomial ℕ k
    let I : Ideal A := Ideal.span (Set.range (MvPolynomial.X : ℕ → A))
    let M := ModuleCat.of A (A ⧸ I)
    Module.Finite A M ∧ ¬ Module.FinitePresentation A M ∧ ¬ IsPseudoCoherentModule A M := by
  sorry

-- Extension by zero from the generic point of a DVR: pseudo-coherent sections, not a
-- pseudo-coherent sheaf.
example (R K : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Field K] [Algebra R K] [IsFractionRing R K] :
    ∃ F : (Spec (.of R)).Modules, IsZero Γ(F, ⊤) ∧
      Nonempty ((Scheme.Modules.pullback (Spec.map (CommRingCat.ofHom (algebraMap R K)))).obj F ≅
        SheafOfModules.unit (Spec (.of K)).ringCatSheaf) ∧
      ¬ IsPseudoCoherentSheaf F ∧
      (∀ U : (Spec (.of R)).affineOpens,
        IsPseudoCoherentModule Γ(Spec (.of R), U.1)
          (ModuleCat.of Γ(Spec (.of R), U.1) Γ(F, U.1))) := by
  sorry

end PseudoCoherence

/-! ### §0.8 Flatness over Dedekind bases -/

/-- A reduced scheme all of whose irreducible components dominate a Dedekind base is flat over
it; no purity of fibre dimension follows. Stacks, Lemma 15.22.11 (0AUW). -/
theorem flat_over_dedekind {X S : Scheme.{u}} (f : X ⟶ S) [IsReduced X] [IsIntegral S]
    (hS : ∀ U : S.affineOpens, Nonempty U.1 → IsDedekindDomain Γ(S, U.1))
    (hdom : ∀ Z ∈ irreducibleComponents X, Dense (f '' Z)) : Flat f := by
  sorry

-- `S ⊔ 𝔸¹_S → S` over `S = Spec k[t]` is flat with dominating components but has fibres with
-- components of dimensions `0` and `1`.
example (k : Type u) [Field k] :
    let S := Spec (.of (Polynomial k))
    let A := Spec (.of (Polynomial (Polynomial k)))
    let f : S ⨿ A ⟶ S := coprod.desc (𝟙 S)
      (Spec.map (CommRingCat.ofHom (algebraMap (Polynomial k) (Polynomial (Polynomial k)))))
    IsReduced (S ⨿ A) ∧ Flat f ∧ LocallyOfFiniteType f ∧
      (∀ Z ∈ irreducibleComponents (S ⨿ A : Scheme.{u}), Dense (f '' Z)) ∧
      ∀ d : ℕ, ¬ TauCeti.AlgebraicGeometry.PureRelativeDimension d f := by
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

-- Without local Noetherianity: on `Spec` of the eventually constant `𝔽₂`-sequences, the point at
-- infinity is a closed connected component that is not open, and its inclusion is not étale.
example :
    ∃ A : Subring (ℕ → ZMod 2),
      (∀ a : ℕ → ZMod 2, a ∈ A ↔ ∃ c : ZMod 2, ∃ N : ℕ, ∀ n ≥ N, a n = c) ∧
      ∃ q : A →+* ZMod 2, Function.Surjective q ∧ ¬ (RingHom.ker q).FG ∧
        let X := Spec (.of A)
        let i := Spec.map (CommRingCat.ofHom q)
        IsFinite (𝟙 X) ∧ Etale (𝟙 X) ∧ IsClosedImmersion i ∧ ¬ Etale i ∧
        ¬ IsOpen (Set.range i) ∧
        ∀ z : Spec (.of (ZMod 2)), connectedComponent (i z) = Set.range i := by
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

-- Identity neighbourhoods and the zero-ideal henselization retain the base ring.
example (I : Ideal R) : IsNeighbourhood I (CommAlgCat.of R R) := by sorry
example : Nonempty (algebra (⊥ : Ideal R) ≃ₐ[R] R) := by sorry
example (I : Ideal R) [HenselianRing R I] : Nonempty (algebra I ≃ₐ[R] R) :=
  fixed_of_henselian I
example : Nonempty (algebra (⊥ : Ideal (ZMod 5)) ≃ₐ[ZMod 5] ZMod 5) := by sorry

-- `ℤ[1/2]` is a neighbourhood of `(ℤ, (5))`; `ℤ[1/5]` and `ℤ × ℤ` are not.
example : IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (2 : ℤ))) := by sorry
example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (5 : ℤ))) := by sorry
example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)}) (CommAlgCat.of ℤ (ℤ × ℤ)) := by sorry

-- The unit ideal has the zero ring as henselization.
example : Subsingleton (algebra (⊤ : Ideal R)) := by sorry

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

-- Fields are Japanese; a non-Noetherian ring is not Nagata.
example (k : Type u) [Field k] : Ring.IsJapanese k := by sorry
example : ¬ Ring.IsNagata (MvPolynomial ℕ ℚ) := by sorry

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

-- Fields and zero algebras are geometrically regular; nilpotents distinguish J-2 from regularity.
example (k : Type u) [Field k] : GeometricallyRegular k k := by sorry
example (k : Type u) [Field k] : GeometricallyRegular k (k ⧸ (⊤ : Ideal k)) := by sorry
example (k : Type u) [Field k] : ¬ GeometricallyRegular k (TrivSqZeroExt k k) := by sorry
example (R : Type u) [CommRing R] : RegularAlgebraMap R R := by sorry
example (R : Type u) [CommRing R] : RegularAlgebraMap R (R ⧸ (⊤ : Ideal R)) := by sorry
example (k : Type u) [Field k] : ¬ RegularAlgebraMap k (TrivSqZeroExt k k) := by sorry
example (k : Type u) [Field k] : regularLocus k = Set.univ := by sorry
example (k : Type u) [Field k] : regularLocus (k ⧸ (⊤ : Ideal k)) = ∅ := by sorry
example (k : Type u) [Field k] : regularLocus (TrivSqZeroExt k k) = ∅ := by sorry
example (k : Type u) [Field k] : IsJ2 k := by sorry
example (k : Type u) [Field k] : IsJ2 (k ⧸ (⊤ : Ideal k)) := by sorry
example (k : Type u) [Field k] : IsJ2 (TrivSqZeroExt k k) := by sorry
example (k : Type u) [Field k] : IsGRing k := by sorry
example (k : Type u) [Field k] : IsGRing (k ⧸ (⊤ : Ideal k)) := by sorry
example (k : Type u) [Field k] : IsExcellentRing k := by sorry
example (k : Type u) [Field k] : IsExcellentRing (k ⧸ (⊤ : Ideal k)) := by sorry
example (k : Type u) [Field k] : IsExcellentRing (TrivSqZeroExt k k) := by sorry
example (k : Type u) [Field k] : IsQuasiExcellentRing k := by sorry
example (k : Type u) [Field k] : IsQuasiExcellentRing (k ⧸ (⊤ : Ideal k)) := by sorry
example (k : Type u) [Field k] : IsQuasiExcellentRing (TrivSqZeroExt k k) := by sorry

example (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] : IsGRing R := by sorry

-- A purely inseparable extension is not geometrically regular.
example (k L : Type u) [Field k] [Field L] [Algebra k L] [Module.Finite k L]
    [IsPurelyInseparable k L] (h : ¬ Algebra.IsSeparable k L) :
    ¬ GeometricallyRegular k L := by sorry

-- `ℤ` and complete Noetherian local rings are excellent. Stacks, Proposition 15.53.3 (07QW).
example : IsExcellentRing ℤ := by sorry
example (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] : IsExcellentRing R := by sorry

-- Countably many polynomial variables violate the Noetherian clause of all four predicates.
example (k : Type u) [Field k] : ¬ IsGRing (MvPolynomial ℕ k) := by sorry
example (k : Type u) [Field k] : ¬ IsJ2 (MvPolynomial ℕ k) := by sorry
example (k : Type u) [Field k] : ¬ IsQuasiExcellentRing (MvPolynomial ℕ k) := by sorry
example (k : Type u) [Field k] : ¬ IsExcellentRing (MvPolynomial ℕ k) := by sorry

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

-- Elementwise nil kernels, without a common nilpotence exponent, preserve étale covers.
example (A : Type u) [CommRing A] (I : Ideal A) (hI : ∀ a ∈ I, IsNilpotent a) :
    let f := Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk I))
    (smallEtaleBaseChange f).IsEquivalence ∧
      CoverPreserving (Scheme.smallEtaleTopology (Spec (.of A)))
        (Scheme.smallEtaleTopology (Spec (.of (A ⧸ I)))) (smallEtaleBaseChange f) := by sorry

-- The cusp normalization gives an equivalence although it is not an isomorphism.
example (k : Type u) [Field k] :
    let A := Algebra.adjoin k ({Polynomial.X ^ 2, Polynomial.X ^ 3} : Set (Polynomial k))
    let f := Spec.map (CommRingCat.ofHom A.val.toRingHom)
    ¬ IsIso f ∧ (smallEtaleBaseChange f).IsEquivalence ∧
      CoverPreserving (Scheme.smallEtaleTopology (Spec (.of A)))
        (Scheme.smallEtaleTopology (Spec (.of (Polynomial k)))) (smallEtaleBaseChange f) := by sorry

-- The node has two points above its singularity, in contrast to the cusp.
example (k : Type u) [Field k] (h2 : (2 : k) ≠ 0) :
    let A := Algebra.adjoin k
      ({Polynomial.X ^ 2 - 1, Polynomial.X ^ 3 - Polynomial.X} : Set (Polynomial k))
    let f := Spec.map (CommRingCat.ofHom A.val.toRingHom)
    ¬ (topologically IsHomeomorph).universally f ∧
      ¬ (smallEtaleBaseChange f).IsEquivalence := by sorry

-- A separable quadratic field extension is only an ordinary homeomorphism.
example (p : ℕ) [Fact p.Prime] :
    let f := Spec.map (CommRingCat.ofHom (algebraMap (ZMod p) (GaloisField p 2)))
    IsHomeomorph f.base ∧ ¬ (smallEtaleBaseChange f).IsEquivalence := by sorry

-- Two successive base changes of a nil thickening preserve the site and its covers.
example (A : Type u) [CommRing A] (I : Ideal A) (hI : ∀ a ∈ I, IsNilpotent a)
    (Y Z : Scheme.{u}) (g : Y ⟶ Spec (.of A)) (h : Z ⟶ Y) :
    let f := Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk I))
    let f' := pullback.snd f g
    let f'' := pullback.snd f' h
    (smallEtaleBaseChange f').IsEquivalence ∧ (smallEtaleBaseChange f'').IsEquivalence ∧
      Nonempty (smallEtaleBaseChange f ⋙ smallEtaleBaseChange (pullback.fst f g) ⋙
          smallEtaleBaseChange (pullback.fst f' h) ≅
        smallEtaleBaseChange g ⋙ smallEtaleBaseChange h ⋙ smallEtaleBaseChange f'') ∧
      CoverPreserving (Scheme.smallEtaleTopology Z)
        (Scheme.smallEtaleTopology (pullback f' h)) (smallEtaleBaseChange f'') := by sorry

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

-- Arbitrary coefficients in the pure tensor have additional annihilators even for identity base change.
example : (Submodule.span ℤ {(0 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)}).annihilator = ⊤ ∧
    (Submodule.span ℤ {(1 : ℤ)}).annihilator = ⊥ := by sorry
example : (Submodule.span (ZMod 4) {(2 : ZMod 4) ⊗ₜ[ZMod 4] (1 : ZMod 4)}).annihilator =
    Ideal.span {(2 : ZMod 4)} ∧ (Submodule.span (ZMod 4) {(1 : ZMod 4)}).annihilator = ⊥ := by sorry

section Nonflat
local instance : Algebra (ZMod 4) (ZMod 2) :=
  (ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2)).toAlgebra

-- Without flatness the elementwise formula fails along `ℤ/4 → ℤ/2`.
example :
    (Submodule.span (ZMod 4) {(2 : ZMod 4)}).annihilator.map
      (algebraMap (ZMod 4) (ZMod 2)) = ⊥ ∧
    (Submodule.span (ZMod 2) {(1 : ZMod 2) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator = ⊤ := by
  sorry

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

/-- Absolute Frobenius fixes the space and raises structure-sheaf sections to `p`th powers. -/
def absoluteFrobenius (X : Scheme.{u}) (hX : SchemeCharP X p) : X ⟶ X :=
  Scheme.Hom.mk
    { base := 𝟙 X.toTopCat
      c :=
        { app := fun U => CommRingCat.ofHom
            { toFun := fun a => a ^ p
              map_one' := one_pow p
              map_mul' := fun a b => mul_pow a b p
              map_zero' := by sorry
              map_add' := by sorry }
          naturality := by sorry }
      prop := by sorry }

/-- Absolute Frobenius on an affine scheme is induced by ring Frobenius. -/
theorem absoluteFrobenius_spec (A : Type u) [CommRing A] [CharP A p]
    (hA : SchemeCharP (Spec (CommRingCat.of A)) p) :
    absoluteFrobenius p _ hA = Spec.map (CommRingCat.ofHom (frobenius A p)) := sorry

/-- Absolute Frobenius acts identically on the underlying space. -/
theorem absoluteFrobenius_base (X : Scheme.{u}) (hX : SchemeCharP X p) :
    (absoluteFrobenius p X hX).base = (𝟙 X : X ⟶ X).base := sorry

/-- Absolute Frobenius is natural for all morphisms between characteristic-`p` schemes. -/
theorem absoluteFrobenius_naturality {X Y : Scheme.{u}}
    (hX : SchemeCharP X p) (hY : SchemeCharP Y p) (f : X ⟶ Y) :
    absoluteFrobenius p X hX ≫ f = f ≫ absoluteFrobenius p Y hY := sorry

/-- Absolute Frobenius is integral without finiteness assumptions on the scheme. -/
theorem absoluteFrobenius_integral (X : Scheme.{u}) (hX : SchemeCharP X p) :
    IsIntegralHom (absoluteFrobenius p X hX) := sorry

/-- Absolute Frobenius is a universal homeomorphism on every characteristic-`p` scheme. -/
theorem absoluteFrobenius_universalHomeomorphism (X : Scheme.{u}) (hX : SchemeCharP X p) :
    (topologically IsHomeomorph).universally (absoluteFrobenius p X hX) := by
  sorry

/-- Over a perfect field, local finite type suffices for finite absolute Frobenius. -/
theorem absoluteFrobenius_finite (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) [LocallyOfFiniteType f]
    (hX : SchemeCharP X p) : IsFinite (absoluteFrobenius p X hX) := by
  sorry

/-- The relative twist is the scheme pullback along the absolute Frobenius of the base. -/
def schemeFrobeniusTwist {X S : Scheme.{u}} (f : X ⟶ S) (hS : SchemeCharP S p) :
    Scheme.{u} := pullback f (absoluteFrobenius p S hS)

/-- Relative Frobenius has projections equal to absolute Frobenius and the structure map. -/
def relativeFrobenius {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) :
    X ⟶ schemeFrobeniusTwist p f hS :=
  pullback.lift (absoluteFrobenius p X hX) f
    (absoluteFrobenius_naturality p hX hS f)

/-- The first projection factors absolute Frobenius through relative Frobenius. -/
theorem relativeFrobenius_fst {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) :
    relativeFrobenius p f hX hS ≫ pullback.fst f (absoluteFrobenius p S hS) =
      absoluteFrobenius p X hX := sorry

/-- The second projection makes relative Frobenius a morphism over the base. -/
theorem relativeFrobenius_snd {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) :
    relativeFrobenius p f hX hS ≫ pullback.snd f (absoluteFrobenius p S hS) = f := sorry

/-- The two projection identities uniquely characterize relative Frobenius. -/
theorem relativeFrobenius_unique {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p)
    (g : X ⟶ schemeFrobeniusTwist p f hS)
    (hfst : g ≫ pullback.fst f (absoluteFrobenius p S hS) = absoluteFrobenius p X hX)
    (hsnd : g ≫ pullback.snd f (absoluteFrobenius p S hS) = f) :
    g = relativeFrobenius p f hX hS := sorry

/-- Relative Frobenius is integral for an arbitrary morphism of characteristic-`p` schemes. -/
theorem relativeFrobenius_integral {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) :
    IsIntegralHom (relativeFrobenius p f hX hS) := sorry

/-- Relative Frobenius is a universal homeomorphism without a smoothness assumption. -/
theorem relativeFrobenius_universalHomeomorphism {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) :
    (topologically IsHomeomorph).universally (relativeFrobenius p f hX hS) := by
  sorry

/-- Relative Frobenius of an étale morphism is an isomorphism over every characteristic-`p` base. -/
theorem relativeFrobenius_etale_isIso {X S : Scheme.{u}} (f : X ⟶ S) [Etale f]
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) :
    IsIso (relativeFrobenius p f hX hS) := sorry

/-- For smooth pure relative dimension `d`, relative Frobenius is finite flat and its
direct-image algebra has affine-local bases of cardinality `p^d`. -/
theorem relativeFrobenius_smooth_rank {X S : Scheme.{u}} (f : X ⟶ S) (d : ℕ)
    [SmoothOfRelativeDimension d f] (hX : SchemeCharP X p) (hS : SchemeCharP S p) :
    let F := relativeFrobenius p f hX hS
    IsFinite F ∧ Flat F ∧ LocallyOfFinitePresentation F ∧
      ∀ y : schemeFrobeniusTwist p f hS,
        ∃ U : (schemeFrobeniusTwist p f hS).Opens, IsAffineOpen U ∧ y ∈ U ∧
          letI : Algebra Γ(schemeFrobeniusTwist p f hS, U) Γ(X, F ⁻¹ᵁ U) :=
            (F.app U).hom.toAlgebra
          Nonempty (Γ(X, F ⁻¹ᵁ U) ≃ₗ[Γ(schemeFrobeniusTwist p f hS, U)]
            (Fin (p ^ d) → Γ(schemeFrobeniusTwist p f hS, U))) := by
  sorry

/-- The relative twist commutes with every change of base. -/
def schemeFrobeniusTwistBaseChangeIso {X S S' : Scheme.{u}} (f : X ⟶ S) (g : S' ⟶ S)
    (hS : SchemeCharP S p) (hS' : SchemeCharP S' p) :
    schemeFrobeniusTwist p (pullback.snd f g) hS' ≅
      pullback (pullback.snd f (absoluteFrobenius p S hS)) g := by
  let FS := absoluteFrobenius p S hS
  let FS' := absoluteFrobenius p S' hS'
  let π := pullback.snd f g
  let πF := pullback.snd f FS
  exact
    { hom := pullback.lift
        (pullback.lift (pullback.fst π FS' ≫ pullback.fst f g)
          (pullback.snd π FS' ≫ g) (by sorry))
        (pullback.snd π FS') (by sorry)
      inv := pullback.lift
        (pullback.lift (pullback.fst πF g ≫ pullback.fst f FS)
          (pullback.snd πF g ≫ FS') (by sorry))
        (pullback.snd πF g) (by sorry)
      hom_inv_id := by sorry
      inv_hom_id := by sorry }

/-- The base-change comparison transports relative Frobenius, with both projections. -/
theorem relativeFrobenius_baseChange {X S S' : Scheme.{u}} (f : X ⟶ S) (g : S' ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) (hS' : SchemeCharP S' p) :
    let F' := relativeFrobenius p (pullback.snd f g)
      (schemeCharP_of_hom p (pullback.fst f g) hX) hS'
    let e := schemeFrobeniusTwistBaseChangeIso p f g hS hS'
    F' ≫ e.hom ≫ pullback.fst (pullback.snd f (absoluteFrobenius p S hS)) g =
        pullback.fst f g ≫ relativeFrobenius p f hX hS ∧
      F' ≫ e.hom ≫ pullback.snd (pullback.snd f (absoluteFrobenius p S hS)) g =
        pullback.snd f g := by
  sorry

/-- The `r`-fold absolute scheme Frobenius raises sections to `p^r` powers. -/
def iteratedSchemeFrobenius (X : Scheme.{u}) (hX : SchemeCharP X p) : ℕ → (X ⟶ X)
  | 0 => 𝟙 X
  | r + 1 => iteratedSchemeFrobenius X hX r ≫ absoluteFrobenius p X hX

/-- The zeroth absolute iterate is identity. -/
theorem iteratedSchemeFrobenius_zero (X : Scheme.{u}) (hX : SchemeCharP X p) :
    iteratedSchemeFrobenius p X hX 0 = 𝟙 X := sorry

/-- Successor iteration composes with absolute Frobenius. -/
theorem iteratedSchemeFrobenius_succ (X : Scheme.{u}) (hX : SchemeCharP X p) (r : ℕ) :
    iteratedSchemeFrobenius p X hX (r + 1) =
      iteratedSchemeFrobenius p X hX r ≫ absoluteFrobenius p X hX := sorry

/-- Addition of exponents is composition of the absolute iterates. -/
theorem iteratedSchemeFrobenius_add (X : Scheme.{u}) (hX : SchemeCharP X p) (r s : ℕ) :
    iteratedSchemeFrobenius p X hX (r + s) =
      iteratedSchemeFrobenius p X hX r ≫ iteratedSchemeFrobenius p X hX s := sorry

/-- The `r`-fold relative twist retains the pullback along the base's `r`-fold Frobenius. -/
def iteratedSchemeFrobeniusTwist {X S : Scheme.{u}} (f : X ⟶ S)
    (hS : SchemeCharP S p) (r : ℕ) : Scheme.{u} :=
  pullback f (iteratedSchemeFrobenius p S hS r)

/-- Iterated relative Frobenius factors the absolute iterate as a map over the base. -/
def iteratedRelativeFrobenius {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) (r : ℕ) :
    X ⟶ iteratedSchemeFrobeniusTwist p f hS r :=
  pullback.lift (iteratedSchemeFrobenius p X hX r) f (by sorry)

/-- The first projection of iterated relative Frobenius is the absolute iterate. -/
theorem iteratedRelativeFrobenius_fst {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) (r : ℕ) :
    iteratedRelativeFrobenius p f hX hS r ≫
      pullback.fst f (iteratedSchemeFrobenius p S hS r) =
        iteratedSchemeFrobenius p X hX r := sorry

/-- The second projection of iterated relative Frobenius is the structure map. -/
theorem iteratedRelativeFrobenius_snd {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) (r : ℕ) :
    iteratedRelativeFrobenius p f hX hS r ≫
      pullback.snd f (iteratedSchemeFrobenius p S hS r) = f := sorry

/-- The zeroth twist is canonically the original scheme. -/
def iteratedSchemeFrobeniusTwistZeroIso {X S : Scheme.{u}} (f : X ⟶ S)
    (hS : SchemeCharP S p) : iteratedSchemeFrobeniusTwist p f hS 0 ≅ X where
  hom := pullback.fst f (iteratedSchemeFrobenius p S hS 0)
  inv := pullback.lift (𝟙 X) f (by simp [iteratedSchemeFrobenius])
  hom_inv_id := by sorry
  inv_hom_id := by sorry

/-- Zeroth relative Frobenius becomes identity under the canonical comparison. -/
theorem iteratedRelativeFrobenius_zero {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) :
    iteratedRelativeFrobenius p f hX hS 0 ≫
      (iteratedSchemeFrobeniusTwistZeroIso p f hS).hom = 𝟙 X := by
  sorry

/-- Successive twists identify with the twist for the sum of the exponents. -/
def iteratedSchemeFrobeniusTwistAddIso {X S : Scheme.{u}} (f : X ⟶ S)
    (hS : SchemeCharP S p) (r s : ℕ) :
    iteratedSchemeFrobeniusTwist p
        (pullback.snd f (iteratedSchemeFrobenius p S hS r)) hS s ≅
      iteratedSchemeFrobeniusTwist p f hS (r + s) := by
  let Fr := iteratedSchemeFrobenius p S hS r
  let Fs := iteratedSchemeFrobenius p S hS s
  let Frs := iteratedSchemeFrobenius p S hS (r + s)
  let πr := pullback.snd f Fr
  exact
    { hom := pullback.lift (pullback.fst πr Fs ≫ pullback.fst f Fr)
        (pullback.snd πr Fs) (by sorry)
      inv := pullback.lift
        (pullback.lift (pullback.fst f Frs) (pullback.snd f Frs ≫ Fs) (by sorry))
        (pullback.snd f Frs) (by sorry)
      hom_inv_id := by sorry
      inv_hom_id := by sorry }

/-- Both projections characterize the addition comparison and enforce its coherence. -/
theorem iteratedSchemeFrobeniusTwistAddIso_projections {X S : Scheme.{u}} (f : X ⟶ S)
    (hS : SchemeCharP S p) (r s : ℕ) :
    let πr := pullback.snd f (iteratedSchemeFrobenius p S hS r)
    let e := iteratedSchemeFrobeniusTwistAddIso p f hS r s
    e.hom ≫ pullback.fst f (iteratedSchemeFrobenius p S hS (r + s)) =
        pullback.fst πr (iteratedSchemeFrobenius p S hS s) ≫
          pullback.fst f (iteratedSchemeFrobenius p S hS r) ∧
      e.hom ≫ pullback.snd f (iteratedSchemeFrobenius p S hS (r + s)) =
        pullback.snd πr (iteratedSchemeFrobenius p S hS s) := by
  sorry

/-- Relative iteration composes through the specified twist addition isomorphism. -/
theorem iteratedRelativeFrobenius_add {X S : Scheme.{u}} (f : X ⟶ S)
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) (r s : ℕ) :
    let πr := pullback.snd f (iteratedSchemeFrobenius p S hS r)
    iteratedRelativeFrobenius p f hX hS (r + s) =
      iteratedRelativeFrobenius p f hX hS r ≫
        iteratedRelativeFrobenius p πr (schemeCharP_of_hom p πr hS) hS s ≫
          (iteratedSchemeFrobeniusTwistAddIso p f hS r s).hom := by
  sorry

/-- For a finite field of order `p^a`, the `q`-power scheme map is the `a`-fold absolute map. -/
def qPowerFrobenius (k : Type u) [Field k] [Finite k] [CharP k p]
    {X : Scheme.{u}} (_f : X ⟶ Spec (CommRingCat.of k)) (hX : SchemeCharP X p)
    (a : ℕ) (_ha : Nat.card k = p ^ a) : X ⟶ X :=
  iteratedSchemeFrobenius p X hX a

/-- The finite-field scheme map agrees with the specified absolute iterate. -/
theorem qPowerFrobenius_eq_iterated (k : Type u) [Field k] [Finite k] [CharP k p]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of k)) (hX : SchemeCharP X p)
    (a : ℕ) (ha : Nat.card k = p ^ a) :
    qPowerFrobenius p k f hX a ha = iteratedSchemeFrobenius p X hX a := sorry

/-- The finite-field `q`-power scheme map is linear over the given field. -/
theorem qPowerFrobenius_over (k : Type u) [Field k] [Finite k] [CharP k p]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of k)) (hX : SchemeCharP X p)
    (a : ℕ) (ha : Nat.card k = p ^ a) :
    qPowerFrobenius p k f hX a ha ≫ f = f := sorry

-- Affine Frobenius includes nilpotents and commutes with localization.
example (A : Type u) [CommRing A] [CharP A p] (a : A)
    (hA : SchemeCharP (Spec (.of A)) p)
    (hL : SchemeCharP (Spec (.of (Localization.Away a))) p) :
    absoluteFrobenius p _ hA = Spec.map (CommRingCat.ofHom (frobenius A p)) ∧
      absoluteFrobenius p _ hL ≫ Spec.map (CommRingCat.ofHom (algebraMap A (Localization.Away a))) =
        Spec.map (CommRingCat.ofHom (algebraMap A (Localization.Away a))) ≫
          absoluteFrobenius p _ hA := by sorry

-- The dual-number nilpotent is killed; this Frobenius is not an isomorphism.
example :
    let I : Ideal (Polynomial (ZMod p)) := Ideal.span {Polynomial.X ^ 2}
    let A := Polynomial (ZMod p) ⧸ I
    letI : CharP A p := by sorry
    let ε : A := Ideal.Quotient.mk I Polynomial.X
    let X := Spec (.of A)
    ∃ hX : SchemeCharP X p,
      absoluteFrobenius p X hX = Spec.map (CommRingCat.ofHom (frobenius A p)) ∧
      ε ≠ 0 ∧ frobenius A p ε = 0 ∧ ¬ IsIso (absoluteFrobenius p X hX) := by sorry

-- The empty scheme has intrinsic characteristic p and identity Frobenius.
example : ∃ hX : SchemeCharP (∅ : Scheme.{u}) p,
    absoluteFrobenius p ∅ hX = 𝟙 _ := by sorry

-- A one-point space can have nonidentity Frobenius, and the first iterate need not be linear.
example :
    let k := GaloisField p 2
    let X := Spec (.of k)
    ∃ hX : SchemeCharP X p,
      (absoluteFrobenius p X hX).base = (𝟙 X : X ⟶ X).base ∧
      absoluteFrobenius p X hX ≠ 𝟙 X ∧
      absoluteFrobenius p X hX ≫ (𝟙 X) ≠ 𝟙 X ∧
      iteratedSchemeFrobenius p X hX 2 = 𝟙 X := by sorry

-- The affine-line relative algebra has the p monomials as a basis, rather than rank one.
example (k : Type u) [Field k] [CharP k p] :
    let X := Spec (.of (Polynomial k))
    let S := Spec (.of k)
    let f := Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))
    ∃ (hX : SchemeCharP X p) (hS : SchemeCharP S p),
      let T := schemeFrobeniusTwist p f hS
      let F := relativeFrobenius p f hX hS
      letI : Algebra Γ(T, ⊤) Γ(X, ⊤) := F.appTop.hom.toAlgebra
      IsFinite F ∧ Flat F ∧ LocallyOfFinitePresentation F ∧
        Nonempty (Γ(X, ⊤) ≃ₗ[Γ(T, ⊤)] (Fin p → Γ(T, ⊤))) ∧
        ¬ Nonempty (Γ(X, ⊤) ≃ₗ[Γ(T, ⊤)] Γ(T, ⊤)) := by sorry

-- The coordinate map on the relative affine line is t ↦ t^p, with the specified monomial basis.
example (k : Type u) [Field k] [CharP k p] :
    let X := Spec (.of (Polynomial k))
    let S := Spec (.of k)
    let f := Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))
    ∃ (hX : SchemeCharP X p) (hS : SchemeCharP S p),
      (∃ e : schemeFrobeniusTwist p f hS ≅ X,
        relativeFrobenius p f hX hS ≫ e.hom =
          Spec.map (CommRingCat.ofHom (Polynomial.expand k p).toRingHom)) ∧
      (letI : Algebra (Polynomial k) (Polynomial k) := (Polynomial.expand k p).toRingHom.toAlgebra
       letI : Module (Polynomial k) (Polynomial k) := Algebra.toModule
       ∃ b : Module.Basis (Fin p) (Polynomial k) (Polynomial k),
         ∀ i, b i = Polynomial.X ^ i.val) := by sorry

-- Smooth pure relative dimension d gives rank p^d on every point of the twist.
example {X S : Scheme.{u}} (f : X ⟶ S) (d : ℕ) [SmoothOfRelativeDimension d f]
    (hX : SchemeCharP X p) (hS : SchemeCharP S p) :
    let F := relativeFrobenius p f hX hS
    IsFinite F ∧ Flat F ∧ LocallyOfFinitePresentation F ∧ ∀ y, F.finrank y = p ^ d := by sorry

-- The affine-plane component has rank p²; a disjoint union need not have constant rank.
example (k : Type u) [Field k] [CharP k p] :
    let X := Spec (.of (MvPolynomial (Fin 2) k))
    let S := Spec (.of k)
    let f := Spec.map (CommRingCat.ofHom (algebraMap k (MvPolynomial (Fin 2) k)))
    ∃ (hX : SchemeCharP X p) (hS : SchemeCharP S p),
      let T := schemeFrobeniusTwist p f hS
      let F := relativeFrobenius p f hX hS
      letI : Algebra Γ(T, ⊤) Γ(X, ⊤) := F.appTop.hom.toAlgebra
      Nonempty (Γ(X, ⊤) ≃ₗ[Γ(T, ⊤)] (Fin (p ^ 2) → Γ(T, ⊤))) ∧ p ≠ p ^ 2 := by sorry

-- The two components have different ranks under the same relative Frobenius.
example (k : Type u) [Field k] [CharP k p] :
    let S := Spec (.of k)
    let A := Spec (.of (Polynomial k))
    let B := Spec (.of (MvPolynomial (Fin 2) k))
    let X := A ⨿ B
    let f := coprod.desc
      (Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k))))
      (Spec.map (CommRingCat.ofHom (algebraMap k (MvPolynomial (Fin 2) k))))
    ∃ (hX : SchemeCharP X p) (hS : SchemeCharP S p),
      let F := relativeFrobenius p f hX hS
      IsFinite F ∧ Flat F ∧
        (∀ x : A, F.finrank (F ((coprod.inl : A ⟶ X) x)) = p) ∧
        (∀ x : B, F.finrank (F ((coprod.inr : B ⟶ X) x)) = p ^ 2) ∧
        ¬ ∃ n, ∀ y, F.finrank y = n := by sorry

-- Étale relative Frobenius is invertible even over a nonperfect base.
example :
    let A := Polynomial (ZMod p)
    let X := Spec (.of A)
    ∃ hX : SchemeCharP X p, ¬ IsIso (absoluteFrobenius p X hX) ∧
      IsIso (relativeFrobenius p (𝟙 X) hX hX) := by sorry

-- Both zeroth maps are identity after the canonical zeroth-twist comparison.
example (X : Scheme.{u}) (hX : SchemeCharP X p) :
    iteratedSchemeFrobenius p X hX 0 = 𝟙 X ∧
      iteratedRelativeFrobenius p (𝟙 X) hX hX 0 ≫
        (iteratedSchemeFrobeniusTwistZeroIso p (𝟙 X) hX).hom = 𝟙 X := by sorry

-- Scalar extension of the F_q identity fixes F_{q²}; absolute q-Frobenius does not.
example (k L : Type u) [Field k] [Finite k] [Field L] [Finite L]
    [Algebra k L] [CharP k p] [CharP L p] (a : ℕ)
    (ha : Nat.card k = p ^ a) (hL : Nat.card L = (Nat.card k) ^ 2) :
    let S := Spec (.of k)
    let T := Spec (.of L)
    let g := Spec.map (CommRingCat.ofHom (algebraMap k L))
    ∃ (hS : SchemeCharP S p) (hT : SchemeCharP T p),
      let F := qPowerFrobenius p k (𝟙 S) hS a ha
      F = 𝟙 S ∧
        ∃ b : pullback (𝟙 S) g ⟶ pullback (𝟙 S) g,
          b = 𝟙 _ ∧ b ≫ pullback.snd (𝟙 S) g = pullback.snd (𝟙 S) g ∧
          b ≫ pullback.fst (𝟙 S) g = pullback.fst (𝟙 S) g ≫ F ∧
          iteratedSchemeFrobenius p T hT a ≠ 𝟙 T := by sorry

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

-- No map from the empty scheme is an atlas of a nonempty scheme; a constant presheaf is not a
-- space.
example (k : Type u) [Field k] (a : yoneda.obj Scheme.empty ⟶ yoneda.obj (Spec (.of k))) :
    ¬ EtaleAtlas (yoneda.obj (Spec (.of k))) Scheme.empty a := by sorry
example : ¬ IsAlgebraicSpace ((Functor.const Scheme.{u}ᵒᵖ).obj (ULift.{u} Bool)) := by sorry

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

/-- Composition with an étale `f : F → G`, `(U → F) ↦ (U → F → G)`: the functor
`smallEtale F ⥤ smallEtale G`, opposite in direction to base change.
Stacks, Lemma 66.18.11 (03LP). -/
def smallEtale_compose {F G : AlgSpace.{u}} (f : F ⟶ G)
    (hf : EtaleLocal (@Etale : MorphismProperty Scheme.{u}) f) : smallEtale F ⥤ smallEtale G :=
  ObjectProperty.lift
    (fun (V : Over G) => EtaleLocal (@Etale : MorphismProperty Scheme.{u}) V.hom)
    (ObjectProperty.ι
      (fun (V : Over F) => EtaleLocal (@Etale : MorphismProperty Scheme.{u}) V.hom) ⋙
      Over.map f)
    (by intro V; sorry)

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

-- A character of `Gal(ℚ̄/ℚ)` with non-open kernel gives a semilinear action on `ℚ̄[t, t⁻¹]` that
-- is not continuous.
example :
    ∃ χ : (AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ) →* ℤˣ,
      ¬ IsOpen (χ.ker : Set (AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ)) ∧
      ∃ ρ : (AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ) →*
          RingAut (LaurentPolynomial (AlgebraicClosure ℚ)),
        (∀ σ (c : AlgebraicClosure ℚ) a, ρ σ (c • a) = σ c • ρ σ a) ∧
        (∀ σ, ρ σ (LaurentPolynomial.T 1) = LaurentPolynomial.T (χ σ : ℤ)) ∧
        ¬ ∃ act : ContinuousSemilinearAction ℚ (AlgebraicClosure ℚ)
          (LaurentPolynomial (AlgebraicClosure ℚ)), act.ρ = ρ := by
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

-- `∐ₙ ℙⁿ_k → ∐ₙ Spec k` is qcqs over a base that is not affine, and no uniform bound holds on
-- its source: `Hⁿ(ℙⁿ_k, O(−n−1)) ≠ 0` on the `n`-th component.
attribute [local instance] MvPolynomial.gradedAlgebra in
example (k : Type u) [Field k] :
    let P : ℕ → Scheme.{u} := fun n => Proj (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k)
    let f : ∐ P ⟶ ∐ fun _ : ℕ => Spec (.of k) := Limits.Sigma.map fun n =>
      Proj.toSpecZero _ ≫ Spec.map (CommRingCat.ofHom (algebraMap k _))
    QuasiCompact f ∧ QuasiSeparated f ∧ ¬ IsAffine (∐ fun _ : ℕ => Spec (.of k)) ∧
      ¬ ∃ N : ℕ, ∀ (F : (∐ P).Modules) [F.IsQuasicoherent] (p : ℕ), N ≤ p →
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

-- A quadratic field extension is not a Nisnevich covering.
example (k K : Type u) [Field k] [Field K] [Algebra k K] (h : Module.finrank k K = 2) :
    ¬ IsNisnevichCovering
      (fun _ : PUnit.{u+1} ↦ Spec.map (CommRingCat.ofHom (algebraMap k K))) := by sorry

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

-- `Spec K ⊔ Spec L → Spec K` (`L/K` separable quadratic) has one preimage with trivial residue
-- extension over the point, yet is not distinguished with empty `U`.
example (K L : Type u) [Field K] [Field L] [Algebra K L] [Algebra.IsSeparable K L]
    (hL : Module.finrank K L = 2) :
    let p : Spec (CommRingCat.of K) ⨿ Spec (CommRingCat.of L) ⟶ Spec (CommRingCat.of K) :=
      coprod.desc (𝟙 _) (Spec.map (CommRingCat.ofHom (algebraMap K L)))
    (∀ x : Spec (CommRingCat.of K), ∃! y, p y = x ∧
        Function.Bijective (Scheme.Hom.residueFieldMap p y).hom) ∧
      ∀ S : ElementaryDistinguishedSquare (Spec (CommRingCat.of K)), IsEmpty S.U →
        ¬ Nonempty (S.V ≅ Spec (CommRingCat.of K) ⨿ Spec (CommRingCat.of L)) := by sorry

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

-- The small étale topos of `Spec ℚ` is not replete.
example : ¬ IsReplete (Sheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of ℚ))) Type) := by
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

local instance {X Y : Scheme.{u}} (f : X ⟶ Y) [IsOpenImmersion f] :
    (Scheme.Modules.restrictFunctor f).Additive := by sorry
local instance {X Y : Scheme.{u}} (f : X ⟶ Y) [IsOpenImmersion f] :
    PreservesFiniteLimits (Scheme.Modules.restrictFunctor f) := by sorry

/-- Restriction of derived module sheaves along an open immersion, induced by the exact
module-sheaf restriction functor. Stacks, §20.45 (0D65). -/
def derivedRestrict {X Y : Scheme.{u}} (f : X ⟶ Y) [IsOpenImmersion f] :
    DerivedCategory Y.Modules ⥤ DerivedCategory X.Modules :=
  (Scheme.Modules.restrictFunctor f).mapDerivedCategory

/-- Direct and successive restrictions on nested opens agree by localization of the canonical
module-sheaf comparison. Stacks, Situation 20.45.3 (0D67). -/
def derivedRestrictComp {X : Scheme.{u}} {U V W : X.Opens}
    (hVU : V ≤ U) (hWV : W ≤ V) :
    derivedRestrict (X.homOfLE (hWV.trans hVU)) ≅
      derivedRestrict (X.homOfLE hVU) ⋙ derivedRestrict (X.homOfLE hWV) := by
  let e := Scheme.Modules.restrictFunctorCongr
      (by simp : X.homOfLE (hWV.trans hVU) = X.homOfLE hWV ≫ X.homOfLE hVU) ≪≫
    Scheme.Modules.restrictFunctorComp (X.homOfLE hWV) (X.homOfLE hVU)
  exact { hom := e.hom.mapDerivedCategory
          inv := e.inv.mapDerivedCategory
          hom_inv_id := by sorry
          inv_hom_id := by sorry } ≪≫
    (Functor.mapDerivedCategoryCompIso (Scheme.Modules.restrictFunctor (X.homOfLE hVU))
      (Scheme.Modules.restrictFunctor (X.homOfLE hWV))).symm

/-- Direct restriction to an open agrees with restriction through a larger open, using the
canonical exact-functor comparison. Stacks, Situation 20.45.3 (0D67). -/
def derivedRestrictOpens {X : Scheme.{u}} {U V : X.Opens} (hVU : V ≤ U) :
    derivedRestrict V.ι ≅ derivedRestrict U.ι ⋙ derivedRestrict (X.homOfLE hVU) := by
  let e := Scheme.Modules.restrictFunctorCongr
      (by simp : V.ι = X.homOfLE hVU ≫ U.ι) ≪≫
    Scheme.Modules.restrictFunctorComp (X.homOfLE hVU) U.ι
  exact { hom := e.hom.mapDerivedCategory
          inv := e.inv.mapDerivedCategory
          hom_inv_id := by sorry
          inv_hom_id := by sorry } ≪≫
    (Functor.mapDerivedCategoryCompIso (Scheme.Modules.restrictFunctor U.ι)
      (Scheme.Modules.restrictFunctor (X.homOfLE hVU))).symm

/-- The presheaf of derived morphisms, with restriction induced by exact restriction of
module sheaves and its canonical composition comparisons. Stacks, Lemma 20.45.2 (0D66). -/
def derivedHomPresheaf {X : Scheme.{u}} (K L : DerivedCategory X.Modules) :
    TopCat.Presheaf (Type (u + 1)) X where
  obj U := (derivedRestrict (show X.Opens from U.unop).ι).obj K ⟶
    (derivedRestrict (show X.Opens from U.unop).ι).obj L
  map {U V} h := ↾fun α =>
    (derivedRestrictOpens (leOfHom h.unop)).hom.app K ≫
      (derivedRestrict (X.homOfLE (leOfHom h.unop))).map α ≫
      (derivedRestrictOpens (leOfHom h.unop)).inv.app L
  map_id := by sorry
  map_comp := by sorry

/-- Basis-local negative-Ext vanishing makes derived Hom a sheaf and gives the same
vanishing on every open. Stacks, Lemma 20.45.2(2) (0D66). -/
theorem derivedHom_isSheaf {X : Scheme.{u}} (B : Set X.Opens)
    (hB : TopologicalSpace.IsTopologicalBasis ((fun U : X.Opens => (U : Set X)) '' B))
    (K L : DerivedCategory X.Modules)
    (hneg : ∀ U ∈ B, ∀ i : ℤ, i < 0 →
      Subsingleton ((derivedRestrict U.ι).obj K ⟶ ((derivedRestrict U.ι).obj L)⟦i⟧)) :
    (derivedHomPresheaf K L).IsSheaf ∧
      ∀ (U : X.Opens) (i : ℤ), i < 0 →
        Subsingleton ((derivedRestrict U.ι).obj K ⟶ ((derivedRestrict U.ι).obj L)⟦i⟧) := by
  sorry

/-- Local derived objects on an open basis, with restriction isomorphisms satisfying
the cocycle condition. Stacks, Situation 20.45.3 (0D67). -/
structure DerivedGluingData (X : Scheme.{u}) (B : Set X.Opens) where
  obj : ∀ U : B, DerivedCategory U.val.toScheme.Modules
  transition : ∀ {U V : B} (hVU : V.val ≤ U.val),
    (derivedRestrict (X.homOfLE hVU)).obj (obj U) ≅ obj V
  cocycle : ∀ {U V W : B} (hVU : V.val ≤ U.val) (hWV : W.val ≤ V.val),
    transition (hWV.trans hVU) =
      (derivedRestrictComp hVU hWV).app (obj U) ≪≫
        (derivedRestrict (X.homOfLE hWV)).mapIso (transition hVU) ≪≫ transition hWV

/-- A global derived object with identifications realizing a given restriction cocycle.
Stacks, Theorem 20.45.8 (0D6C). -/
structure DerivedGluingSolution {X : Scheme.{u}} {B : Set X.Opens}
    (d : DerivedGluingData X B) where
  obj : DerivedCategory X.Modules
  iso : ∀ U : B, (derivedRestrict U.val.ι).obj obj ≅ d.obj U
  compatibility : ∀ {U V : B} (hVU : V.val ≤ U.val),
    iso V = (derivedRestrictOpens hVU).app obj ≪≫
      (derivedRestrict (X.homOfLE hVU)).mapIso (iso U) ≪≫ d.transition hVU

/-- An arbitrary open-basis cocycle with vanishing negative self-Ext has a global
solution, unique up to unique compatible isomorphism. Stacks, Theorem 20.45.8 (0D6C). -/
theorem derivedObject_gluing {X : Scheme.{u}} (B : Set X.Opens)
    (hB : TopologicalSpace.IsTopologicalBasis ((fun U : X.Opens => (U : Set X)) '' B))
    (d : DerivedGluingData X B)
    (hneg : ∀ (U : B) (i : ℤ), i < 0 → Subsingleton (d.obj U ⟶ (d.obj U)⟦i⟧)) :
    Nonempty (DerivedGluingSolution d) ∧
      ∀ a b : DerivedGluingSolution d, ∃! e : a.obj ≅ b.obj,
        ∀ U : B, (derivedRestrict U.val.ι).mapIso e ≪≫ b.iso U = a.iso U := by
  sorry

-- For unshifted structure modules the Hom presheaf is a sheaf, with sections the ring of functions.
example (X : Scheme.{u}) :
    let K := (DerivedCategory.singleFunctor X.Modules 0).obj (SheafOfModules.unit X.ringCatSheaf)
    (derivedHomPresheaf K K).IsSheaf ∧
      (∀ (U : X.Opens) (i : ℤ), i < 0 →
        Subsingleton ((derivedRestrict U.ι).obj K ⟶ ((derivedRestrict U.ι).obj K)⟦i⟧)) ∧
      ∀ U : X.Opens, Nonempty (((derivedRestrict U.ι).obj K ⟶
        (derivedRestrict U.ι).obj K) ≃ Γ(X, U)) := by
  sorry

/-- The restriction cocycle of a global derived object, using canonical restriction comparisons.
Stacks, Situation 20.45.3 (0D67). -/
def restrictedGluingData (X : Scheme.{u}) (B : Set X.Opens) (K : DerivedCategory X.Modules) :
    DerivedGluingData X B where
  obj U := (derivedRestrict U.val.ι).obj K
  transition h := ((derivedRestrictOpens h).app K).symm
  cocycle := by sorry

-- Basis refinement identifies the solutions by the unique compatible isomorphism.
example (X : Scheme.{u}) (K : DerivedCategory X.Modules) (B C : Set X.Opens)
    (hB : TopologicalSpace.IsTopologicalBasis ((fun U : X.Opens => (U : Set X)) '' B))
    (hC : TopologicalSpace.IsTopologicalBasis ((fun U : X.Opens => (U : Set X)) '' C))
    (hCB : C ⊆ B)
    (hneg : ∀ (U : B) (i : ℤ), i < 0 →
      Subsingleton ((derivedRestrict U.val.ι).obj K ⟶ ((derivedRestrict U.val.ι).obj K)⟦i⟧))
    (a : DerivedGluingSolution (restrictedGluingData X B K))
    (b : DerivedGluingSolution (restrictedGluingData X C K)) :
    ∃! e : a.obj ≅ b.obj, ∀ U : C,
      (derivedRestrict U.val.ι).mapIso e ≪≫ b.iso U = a.iso ⟨U.val, hCB U.property⟩ := by
  sorry

-- Shifted differential bundles on the projective line glue to the original global bundle.
attribute [local instance] MvPolynomial.gradedAlgebra in
example (k : Type u) [Field k] :
    let 𝒜 := MvPolynomial.homogeneousSubmodule (Fin 2) k
    let X := Proj 𝒜
    letI : X.Over (Spec (.of k)) :=
      ⟨Proj.toSpecZero 𝒜 ≫ Spec.map (CommRingCat.ofHom (algebraMap k (𝒜 0)))⟩
    let K := ((DerivedCategory.singleFunctor X.Modules 0).obj (X.relativeDifferentials k))⟦(1 : ℤ)⟧
    let R := Localization.Away (Polynomial.X : Polynomial k)
    let x : R := algebraMap (Polynomial k) R Polynomial.X
    let y : R := IsLocalization.Away.invSelf (Polynomial.X : Polynomial k)
    let B : Set X.Opens := {U | IsAffineOpen U}
    KaehlerDifferential.D k R y = -(y ^ 2) • KaehlerDifferential.D k R x ∧
      (∀ (U : B) (i : ℤ), i < 0 →
      Subsingleton ((derivedRestrict U.val.ι).obj K ⟶
        ((derivedRestrict U.val.ι).obj K)⟦i⟧)) ∧
      Nonempty (DerivedGluingSolution (restrictedGluingData X B K)) ∧
      ∀ a : DerivedGluingSolution (restrictedGluingData X B K), Nonempty (a.obj ≅ K) := by
  sorry

-- The componentwise affine basis on infinitely many projective lines has no finite subcover.
attribute [local instance] MvPolynomial.gradedAlgebra in
example (k : Type u) [Field k] :
    let 𝒜 := MvPolynomial.homogeneousSubmodule (Fin 2) k
    let P := Proj 𝒜
    let Xs := fun _ : ℕ => P
    let X := ∐ Xs
    letI : X.Over (Spec (.of k)) := ⟨Sigma.desc (fun _ =>
      Proj.toSpecZero 𝒜 ≫ Spec.map (CommRingCat.ofHom (algebraMap k (𝒜 0))))⟩
    let K := ((DerivedCategory.singleFunctor X.Modules 0).obj (X.relativeDifferentials k))⟦(1 : ℤ)⟧
    let R := Localization.Away (Polynomial.X : Polynomial k)
    let x : R := algebraMap (Polynomial k) R Polynomial.X
    let y : R := IsLocalization.Away.invSelf (Polynomial.X : Polynomial k)
    let B : Set X.Opens := {U | IsAffineOpen U ∧ ∃ n, (U : Set X) ⊆ Set.range (Sigma.ι Xs n)}
    KaehlerDifferential.D k R y = -(y ^ 2) • KaehlerDifferential.D k R x ∧
      ¬ CompactSpace X ∧
      (∀ (U : B) (i : ℤ), i < 0 →
        Subsingleton ((derivedRestrict U.val.ι).obj K ⟶
          ((derivedRestrict U.val.ι).obj K)⟦i⟧)) ∧
      Nonempty (DerivedGluingSolution (restrictedGluingData X B K)) ∧
      ∀ a : DerivedGluingSolution (restrictedGluingData X B K), Nonempty (a.obj ≅ K) := by
  sorry

-- Without negative-Ext vanishing, a nonzero global derived morphism can vanish on every affine.
attribute [local instance] MvPolynomial.gradedAlgebra in
example (k : Type u) [Field k] :
    let 𝒜 := MvPolynomial.homogeneousSubmodule (Fin 2) k
    let X := Proj 𝒜
    letI : X.Over (Spec (.of k)) :=
      ⟨Proj.toSpecZero 𝒜 ≫ Spec.map (CommRingCat.ofHom (algebraMap k (𝒜 0)))⟩
    let K := (DerivedCategory.singleFunctor X.Modules 0).obj (SheafOfModules.unit X.ringCatSheaf)
    let L := ((DerivedCategory.singleFunctor X.Modules 0).obj (X.relativeDifferentials k))⟦(1 : ℤ)⟧
    ∃ φ : K ⟶ L, φ ≠ 0 ∧
      (∀ U : X.Opens, IsAffineOpen U → (derivedRestrict U.ι).map φ = 0) ∧
      ¬ (∀ U : X.Opens, IsAffineOpen U → ∀ i : ℤ, i < 0 →
        Subsingleton ((derivedRestrict U.ι).obj K ⟶ ((derivedRestrict U.ι).obj L)⟦i⟧)) := by
  sorry

/-! ### §2.19 Coherent upper shriek and its Čech pasting comparisons -/

/-- Bounded-below complexes with quasi-coherent cohomology, in the ambient derived category.
Stacks, §36.3 (06YZ); the lower bound is global. -/
def DQCohPlus (X : Scheme.{u}) : Type (u + 1) :=
  ObjectProperty.FullSubcategory (fun K : DerivedCategory X.Modules =>
    (∀ n : ℤ, ((DerivedCategory.homologyFunctor X.Modules n).obj K).IsQuasicoherent) ∧
      ∃ c : ℤ, K.IsGE c)

instance (X : Scheme.{u}) : Category.{u + 1} (DQCohPlus X) := by
  unfold DQCohPlus; infer_instance

/-- Inclusion of bounded-below quasi-coherent complexes into the ambient derived category. -/
def DQCohPlus.toDerived (X : Scheme.{u}) :
    DQCohPlus X ⥤ DerivedCategory X.Modules := ObjectProperty.ι _

-- A bounded coherent coefficient can have nonzero negative self-Ext even for the identity.
example (X : Scheme.{u}) [IsAffine X] [IsNoetherian X] [Nonempty X] :
    let O := (DerivedCategory.singleFunctor X.Modules 0).obj (SheafOfModules.unit X.ringCatSheaf)
    let K := O ⊞ O⟦(1 : ℤ)⟧
    (∀ n : ℤ, ((DerivedCategory.homologyFunctor X.Modules n).obj K).IsQuasicoherent) ∧
      K.IsGE (-1) ∧ ∃ φ : K ⟶ K⟦(-1 : ℤ)⟧, φ ≠ 0 := by
  sorry

-- A nonidentity unipotent automorphism can restrict to the identity on every affine chart.
attribute [local instance] MvPolynomial.gradedAlgebra in
example (k : Type u) [Field k] :
    let 𝒜 := MvPolynomial.homogeneousSubmodule (Fin 2) k
    let X := Proj 𝒜
    letI : X.Over (Spec (.of k)) :=
      ⟨Proj.toSpecZero 𝒜 ≫ Spec.map (CommRingCat.ofHom (algebraMap k (𝒜 0)))⟩
    let O := (DerivedCategory.singleFunctor X.Modules 0).obj (SheafOfModules.unit X.ringCatSheaf)
    let L := ((DerivedCategory.singleFunctor X.Modules 0).obj (X.relativeDifferentials k))⟦(1 : ℤ)⟧
    let M := O ⊞ L
    ∃ (N : M ⟶ M) (e : M ≅ M), N ≠ 0 ∧ N ≫ N = 0 ∧
      e.hom = 𝟙 M + N ∧ e.inv = 𝟙 M - N ∧ e.hom ≠ 𝟙 M ∧
      ∀ U : X.Opens, IsAffineOpen U →
        (derivedRestrict U.ι).map e.hom = 𝟙 ((derivedRestrict U.ι).obj M) := by
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

-- The rank-zero matrix algebra satisfies the endomorphism criterion but is not Azumaya; over
-- `K × K`, the algebra `K` through the first projection is unfaithful and not Azumaya.
example (K : Type u) [Field K] :
    Function.Bijective (AlgHom.mulLeftRight K (Matrix (Fin 0) (Fin 0) K)) ∧
      ¬ IsAzumaya K (Matrix (Fin 0) (Fin 0) K) := by sorry
example (K : Type u) [Field K] :
    letI : Algebra (K × K) K := (RingHom.fst K K).toAlgebra
    ¬ FaithfulSMul (K × K) K ∧ ¬ IsAzumaya (K × K) K := by sorry

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

/-- AlgebraicVectorBundles' constant-rank predicate. -/
abbrev isFiniteLocallyFreeOfRank {X : Scheme.{u}} (E : X.Modules) (r : ℕ) : Prop :=
  TauCetiRoadmap.AlgebraicVectorBundles.isFiniteLocallyFreeOfRank X r E

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
      (show f (genericPoint X) ⤳ genericPoint Y by sorry) ≫ f.stalkMap (genericPoint X)
    letI := φ.hom.toAlgebra
    vectorBundleDegree k X ((Scheme.Modules.pullback f).obj E) r =
      Module.finrank Y.functionField X.functionField * vectorBundleDegree k Y E r := by sorry

-- The reduced line in a double line violates a fibre-length-one extension of the formula.
example : ∃ (X Y : Scheme.{u}) (_ : X.Over (Spec (.of k))) (_ : Y.Over (Spec (.of k)))
    (f : X ⟶ Y) (E : Y.Modules),
    IsProper (X ↘ Spec (.of k)) ∧ IsProper (Y ↘ Spec (.of k)) ∧
    topologicalKrullDim X = 1 ∧ topologicalKrullDim Y = 1 ∧
    IsReduced X ∧ ¬ IsReduced Y ∧ IsClosedImmersion f ∧ IsHomeomorph f.base ∧
    f ≫ (Y ↘ Spec (.of k)) = (X ↘ Spec (.of k)) ∧
    isFiniteLocallyFreeOfRank E 1 ∧ vectorBundleDegree k Y E 1 = 2 ∧
    vectorBundleDegree k X ((Scheme.Modules.pullback f).obj E) 1 = 1 := by sorry

/-- A proper geometrically integral scheme over `k` has `H⁰(X, O_X) = k`.
Stacks, Lemma 33.9.3 (0BUG), part (7). -/
theorem cohomologyDim_zero_structureModule (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))] :
    cohomologyDim k X (structureModule X) 0 = 1 := by
  sorry

-- On a curve of genus two, `deg O = 0` differs from `χ(O) = −1`.
example (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X = 1)
    [FiniteDimensional k (Scheme.Modules.Cohomology (InvertibleSheaf.trivial X).obj 1)]
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1) (hg : X.genus k = 2) :
    vectorBundleDegree k X (structureModule X) 1 ≠
      Scheme.Modules.eulerCharBelow k X (structureModule X) 2 := by
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

-- `Spec k → Spec k[x]/(x³)` is a thickening and not first-order.
example (k : Type u) [Field k] (B : CommRingCat.{u})
    (e : B ≅ CommRingCat.of (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ 3}))
    (J : Ideal B) (hJ : J = Ideal.span {e.inv (Ideal.Quotient.mk _ Polynomial.X)}) :
    IsThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) ∧
      ¬ IsFirstOrderThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) := by
  sorry

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

-- Thickening transitions alone need not satisfy the adic power equation.
example (k : Type u) [Field k] :
    let A := Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ 3}
    ∃ (X : ℕ → Scheme.{u}) (ι : ∀ n, X n ⟶ X (n + 1)),
      Nonempty (X 0 ≅ Spec (.of k)) ∧
      (∀ n, Nonempty (X (n + 1) ≅ Spec (.of A))) ∧
      (∀ n, IsThickening (ι n)) ∧ (∀ n, IsIso (ι (n + 1))) ∧
      (ι 1).ker ≠ (levelMap X ι 2).ker ^ 2 := by
  sorry

/-- The formal completion along `V(I)`: the system `V(I^{n+1})`.
Stacks, Lemma 87.14.2 (0AIZ) and Definition 87.14.3 (0AMC). -/
def Scheme.formalCompletion (X : Scheme.{u}) (I : X.IdealSheafData) :
    AdicThickeningSystem.{u} where
  X n := (I ^ (n + 1)).subscheme
  ι n := Scheme.IdealSheafData.inclusion (by sorry : I ^ (n + 2) ≤ I ^ (n + 1))
  isThickening _ := by sorry
  adic _ := by sorry

/-- The maps `V(I^{n+1}) → X`. -/
def Scheme.formalCompletion.toScheme (X : Scheme.{u}) (I : X.IdealSheafData) (n : ℕ) :
    (Scheme.formalCompletion X I).X n ⟶ X :=
  (I ^ (n + 1)).subschemeι

/-- Coherent formal modules: finitely presented modules on the levels with compatible
restrictions. Stacks, §30.23. -/
structure Scheme.CoherentFormalModule (𝔛 : AdicThickeningSystem.{u}) where
  F : ∀ n, (𝔛.X n).Modules
  fp : ∀ n, (F n).IsFinitePresentation
  iso : ∀ n, (Scheme.Modules.pullback (𝔛.ι n)).obj (F (n + 1)) ≅ F n

/-- The completion of a finitely presented module. Stacks, Equation (30.23.3.1) (0880). -/
def Scheme.completionFunctor (X : Scheme.{u}) (I : X.IdealSheafData)
    (M : X.Modules) (hM : M.IsFinitePresentation) :
    Scheme.CoherentFormalModule (Scheme.formalCompletion X I) where
  F n := (Scheme.Modules.pullback (Scheme.formalCompletion.toScheme X I n)).obj M
  fp _ := by sorry
  iso n :=
    (Scheme.Modules.pullbackComp ((Scheme.formalCompletion X I).ι n)
      (Scheme.formalCompletion.toScheme X I (n + 1))).app M ≪≫
    (Scheme.Modules.pullbackCongr (by sorry :
      (Scheme.formalCompletion X I).ι n ≫ Scheme.formalCompletion.toScheme X I (n + 1) =
        Scheme.formalCompletion.toScheme X I n)).app M

/-- Grothendieck's existence theorem: over a complete Noetherian adic ring, every coherent formal
module on the completion of a proper scheme along its closed fibre is the completion of a
coherent module. Stacks, Proposition 30.25.4 (088C) and Theorem 30.27.1 (088E). -/
theorem grothendieck_existence (A : AdicRing.{u}) [IsNoetherianRing A.carrier] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of A.carrier)) [IsProper f] (I : X.IdealSheafData)
    (hI : I.support = (Set.range (pullback.fst f (Spec.map (CommRingCat.ofHom
      (Ideal.Quotient.mk A.ideal)))) : Set X))
    (𝓜 : Scheme.CoherentFormalModule (Scheme.formalCompletion X I)) :
    ∃ (M : X.Modules) (hM : M.IsFinitePresentation),
      ∃ e : ∀ n, (Scheme.completionFunctor X I M hM).F n ≅ 𝓜.F n,
        ∀ n, (Scheme.Modules.pullback ((Scheme.formalCompletion X I).ι n)).map (e (n + 1)).hom ≫
          (𝓜.iso n).hom = ((Scheme.completionFunctor X I M hM).iso n).hom ≫ (e n).hom := by
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
    (by simp) (by sorry)

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

-- No `a ∈ k[[t]]` has `a ≡ 0 (mod t)` and `a ≡ 1 (mod t²)`: the maps `0` and `1` on the first
-- two reductions are not a compatible system.
example (k : Type u) [Field k] :
    ¬ ∃ a : PowerSeries k, a ∈ Ideal.span {(PowerSeries.X : PowerSeries k)} ∧
      a - 1 ∈ Ideal.span {(PowerSeries.X : PowerSeries k) ^ 2} := by
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
  S.presheaf.stalkSpecializes (show f (genericPoint S') ⤳ genericPoint S by sorry) ≫
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

-- `resolution_test_cusp`: the cusp `Y = Spec k[t², t³]` meets the hypotheses of
-- `resolution_of_curves` and is not regular; its normalization is `Spec k[t] → Y`, regular and a
-- modification.
example (k : Type u) [Field k] :
    let A := Algebra.adjoin k {(Polynomial.X : Polynomial k) ^ 2, Polynomial.X ^ 3}
    let Y := Spec (.of A)
    let ν := Y.fromSpecStalk (genericPoint Y)
    IsNoetherian Y ∧ topologicalKrullDim Y ≤ 1 ∧ IsFinite ν.fromNormalization ∧ ¬ IsRegular Y ∧
      (∃ e : ν.normalization ≅ Spec (.of (Polynomial k)),
        e.hom ≫ Spec.map (CommRingCat.ofHom A.val.toRingHom) = ν.fromNormalization) ∧
      IsRegular ν.normalization ∧ IsModification ν.fromNormalization := by
  intro A Y ν
  have : IsNoetherian Y := by
    classical
    have : Algebra.FiniteType k A :=
      (Subalgebra.fg_iff_finiteType _).mp ⟨{Polynomial.X ^ 2, Polynomial.X ^ 3}, by simp [A]⟩
    have := Algebra.FiniteType.isNoetherianRing k A
    infer_instance
  have hdim : topologicalKrullDim Y ≤ 1 := sorry
  have : IsFinite ν.fromNormalization := sorry
  exact ⟨‹_›, hdim, ‹_›, sorry, sorry, resolution_of_curves Y hdim⟩

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

-- `isTrait_powerSeries`: `k[[t]]` is a trait.
example (k : Type u) [Field k] : IsTrait (PowerSeries k) := by sorry

-- `not_isTrait_field`: a field is not a discrete valuation ring, hence not a trait.
example (k : Type u) [Field k] : ¬ IsTrait k := by sorry

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

-- `Spec 𝔽_p → Spec ℤ_p` is not flat, hence not an `S`-variety.
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSVariety (Spec.map (CommRingCat.ofHom (PadicInt.toZMod (p := p)))) := by
  sorry

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

-- On a DVR the closed point has height `0` and coheight `1`: the grading is by dimension.
example (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] (x : Spec (.of R))
    (hx : IsClosed ({x} : Set (Spec (.of R)))) : Order.height x = 0 ∧ Order.coheight x = 1 := by
  sorry

attribute [local instance] Classical.propDecidable

/-- Rational equivalence: sums of principal divisors on a locally finite family of integral
closed subschemes of dimension `k + 1`. Stacks, Definition 42.19.1 (02RW). -/
def RatEquiv (X : Scheme.{u}) [X.Over (Spec (.of κ))]
    [LocallyOfFiniteType (X ↘ Spec (.of κ))] (k : ℤ) :
    AddSubgroup (cyclesOfDimension κ X k) where
  carrier := {α | ∃ (J : Type u) (W : J → Scheme.{u}) (i : ∀ j, W j ⟶ X)
    (_ : ∀ j, IsIntegral (W j)) (_ : ∀ j, IsLocallyNoetherian (W j))
    (r : ∀ j, (W j).functionFieldˣ),
      (∀ j, IsClosedImmersion (i j)) ∧
      (∀ j, ∃ n : ℕ, k + 1 = (n : ℤ) ∧ topologicalKrullDim (W j) = n) ∧
      LocallyFinite (fun j => Set.range (i j)) ∧
      ∀ x : X, α.val x = ∑ᶠ j, ∑ᶠ w : W j,
        if (i j) w = x then (W j).ord (r j) w else 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry

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

-- `CH₀(Spec κ) ≅ ℤ`.
example : Nonempty (ChowGroup κ (Spec (.of κ)) 0 ≃+ ℤ) := by sorry

/-- Chow groups of a coproduct are the product of the Chow groups, for any small family.
Stacks, Definition 42.19.1 (02RW). -/
theorem CH_coprod (I : Type u) (X : I → Scheme.{u})
    [∀ i, (X i).Over (Spec (.of κ))]
    [∀ i, LocallyOfFiniteType (X i ↘ Spec (.of κ))] (k : ℤ) :
    letI : (∐ X).Over (Spec (.of κ)) := ⟨Sigma.desc (fun i => X i ↘ Spec (.of κ))⟩
    letI : LocallyOfFiniteType ((∐ X) ↘ Spec (.of κ)) := by sorry
    Nonempty (ChowGroup κ (∐ X) k ≃+ ∀ i, ChowGroup κ (X i) k) := by
  sorry

-- On `∐_n 𝔸¹_κ`, the locally finite zero-cycle with one origin per component is rationally
-- equivalent to zero.
example :
    let L := fun _ : ℕ => Spec (.of (Polynomial κ))
    let E := ∐ L
    letI : E.Over (Spec (.of κ)) :=
      ⟨Sigma.desc (fun _ => Spec.map (CommRingCat.ofHom (algebraMap κ (Polynomial κ))))⟩
    letI : LocallyOfFiniteType (E ↘ Spec (.of κ)) := by sorry
    let z : Spec (.of (Polynomial κ)) :=
      ⟨RingHom.ker (Polynomial.evalRingHom (0 : κ)), by sorry⟩
    (∃ α : cyclesOfDimension κ E 0,
      (∀ n x, α.val (Sigma.ι L n x) = if x = z then 1 else 0) ∧
      α ∈ RatEquiv κ E 0 ∧ cycleClass κ E 0 α = 0) ∧
      Subsingleton (ChowGroup κ E 0) := by
  sorry

-- Infinitely many copies of one integral scheme are not a locally finite family, although all
-- their principal divisors vanish.
example (W : Scheme.{u}) [IsIntegral W] [IsLocallyNoetherian W] [Nonempty W] :
    (∀ w : W, W.ord (1 : W.functionField) w = 0) ∧
      ¬ LocallyFinite (fun _ : ℕ => (Set.univ : Set W)) := by
  sorry

/-! ### §5.7 `K_0`, `G_0` and the resolution property -/

/-- Every finitely presented module is a quotient of a finite locally free one. -/
def HasResolutionProperty (X : Scheme.{u}) : Prop :=
  ∀ F : X.Modules, F.IsFinitePresentation →
    ∃ (E : X.Modules) (_ : E.IsLocallyFree) (_ : E.IsFiniteType) (q : E ⟶ F), Epi q

-- `resolutionProperty_affine`: on `Spec A` every finitely presented module is a quotient of a
-- finite free one.
example (A : Type u) [CommRing A] : HasResolutionProperty (Spec (.of A)) := by sorry

-- `resolutionProperty_empty`: the empty scheme has the resolution property.
example : HasResolutionProperty (∅ : Scheme.{u}) := by sorry

-- `resolutionProperty_quasiProjective`: on `ℙ¹_κ` every finitely presented module is a quotient
-- of some `O(−n)^m`.
attribute [local instance] MvPolynomial.gradedAlgebra in
example : HasResolutionProperty (Proj (MvPolynomial.homogeneousSubmodule (Fin 2) κ)) := by sorry

-- The affine plane with doubled origin has a coherent ideal not generated by any vector bundle.
example : ∃ X : Scheme.{u}, IsNoetherian X ∧ ¬ HasResolutionProperty X := by sorry

local instance (X : Scheme.{u}) :
    (show ObjectProperty X.Modules from SheafOfModules.isFinitePresentation X.ringCatSheaf).ContainsZero := by sorry
local instance (X : Scheme.{u}) :
    (show ObjectProperty X.Modules from SheafOfModules.isFinitePresentation X.ringCatSheaf).IsClosedUnderBinaryProducts := by sorry
local instance (X : Scheme.{u}) :
    (TauCetiRoadmap.AlgebraicVectorBundles.isFiniteLocallyFree X).ContainsZero := by sorry
local instance (X : Scheme.{u}) :
    (TauCetiRoadmap.AlgebraicVectorBundles.isFiniteLocallyFree X).IsClosedUnderBinaryProducts := by
  sorry

/-- The exact structure on finitely presented sheaves induced by ambient short exact sequences.
GrothendieckEulerForms Layer 2, specialized to the extension-closed sheaf subcategory. -/
def finitelyPresentedExact (X : Scheme.{u}) :
    TauCeti.ExactStructure
      (show ObjectProperty X.Modules from SheafOfModules.isFinitePresentation X.ringCatSheaf).FullSubcategory :=
  (TauCeti.ExactStructure.abelian X.Modules).fullSubcategory _ (by sorry)

/-- The exact structure on the owner's finite locally free sheaves induced by short exact
sequences. GrothendieckEulerForms Layer 2 and AlgebraicVectorBundles L0B. -/
def finiteLocallyFreeExact (X : Scheme.{u}) :
    TauCeti.ExactStructure (TauCetiRoadmap.AlgebraicVectorBundles.FiniteLocallyFreeSheaf X) :=
  (TauCeti.ExactStructure.abelian X.Modules).fullSubcategory _ (by sorry)

/-- The owner's exact Grothendieck group of finitely presented sheaves; on a Noetherian scheme
these are coherent sheaves. -/
abbrev G0 (X : Scheme.{u}) : Type (u + 1) := TauCeti.ExactK0 (finitelyPresentedExact X)

/-- The owner's exact Grothendieck group of finite locally free sheaves. -/
abbrev K0 (X : Scheme.{u}) : Type (u + 1) := TauCeti.ExactK0 (finiteLocallyFreeExact X)

/-- The determinant of a virtual finite locally free sheaf, induced by the owner's determinant
and the universal property of exact Grothendieck groups. Fulton 1998, §15.1. -/
def K0.det (X : Scheme.{u}) : K0 X →+ Additive (TauCeti.AlgebraicGeometry.LineBundleClass X) :=
  TauCeti.ExactK0.lift
    { obj := fun E => Additive.ofMul (TauCeti.AlgebraicGeometry.LineBundleClass.mk
        (TauCetiRoadmap.AlgebraicVectorBundles.determinantObj E))
      map_conflation := by sorry }

/-- The natural map from vector-bundle classes to coherent classes on a Noetherian scheme. -/
def K0.toG0 (X : Scheme.{u}) [IsNoetherian X] : K0 X →+ G0 X :=
  TauCeti.ExactK0.lift
    { obj := fun E => TauCeti.ExactK0.of
        (⟨E.obj, E.property.2⟩ :
          (show ObjectProperty X.Modules from SheafOfModules.isFinitePresentation X.ringCatSheaf).FullSubcategory)
      map_conflation := by sorry }

/-- A kernel class with nontrivial determinant detects failure of injectivity of `K_0 → G_0`.
Fulton 1998, §15.1. -/
theorem K0.toG0_not_injective_of_det (X : Scheme.{u}) [IsNoetherian X]
    (a : K0 X) (himage : K0.toG0 X a = 0) (hdet : K0.det X a ≠ 0) :
    ¬ Function.Injective (K0.toG0 X) := by
  intro hinj
  have ha : a = 0 := hinj (by simpa using himage)
  exact hdet (by simp [ha])

/-- On a regular Noetherian scheme with the resolution property, `K_0 → G_0` is bijective.
Stacks, Lemma 36.37.4; Fulton 1998, §15.1. -/
theorem K0.toG0_bijective (X : Scheme.{u}) [IsNoetherian X] (hX : HasResolutionProperty X)
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) :
    Function.Bijective (K0.toG0 X) := by
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

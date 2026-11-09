module

public import Mathlib
public import TauCeti.RingTheory.RegularLocalRing.GRing
public import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic

/-!
# Étale duality and perverse sheaves, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline
Cohen–Gabber theorems in equal and mixed characteristic, the partial algebraization
theorems, the local form of Gabber’s affine Lefschetz theorem, Gabber’s formula for the
cohomological dimension of the fraction field of a henselian quasi-excellent local domain
and Gabber’s cohomological-dimension bound against the pinned APIs. The three structures
only bundle native rings, ideals, localizations, completions and generic fibres needed by
those statements. The local affine Lefschetz theorem assumes Tau Ceti’s G-ring condition,
which makes the completion map regular; for a noetherian local ring that condition is
quasi-excellence (ILO I 5.3.1 and 5.5.1(ii)), but the proof only uses the regularity of
the completion map (ILO XV 1.2.5). The fraction-field formula uses the same condition as
quasi-excellence, and Tau Ceti’s cohomological dimension of the absolute Galois group.

These remaining headlines are not statable at the pins without their missing
geometric carriers and operations:

* Weak and prime-to-ell local uniformization need quasi-excellent schemes,
  alteration sites and strict-normal-crossings pairs.
* h-oriented cohomological descent and coherent hyper-base-change, including
  arbitrary noetherian scheme diagrams, need general oriented-product topoi,
  scheme-diagram sites and derived simplicial direct image.
* Gabber finiteness needs constructible étale derived categories and direct image
  over quasi-excellent bases.
* Dimension-function existence and transport need étale immediate specializations
  between geometric points of a scheme, and quasi-excellence, excellence and regular
  morphisms for schemes. The pins have the strict henselization of a local ring, G-rings
  and regular ring maps, but not these scheme-level notions.
* Gabber’s affine Lefschetz theorem over a quasi-excellent scheme (README §5.6) needs
  dimension functions, constructible étale sheaves with their higher direct images and
  the quasi-excellence predicate for schemes. Its strict-local trait step (README §5.5)
  is an intermediate step of the proof, not a headline. Its local form (README §5.7) is
  stated below.
* The top local class and higher transitions need geometric local support complexes,
  Tate twists and specialization maps.
* The pinned structure of putative and potential dualizing complexes (README §6.2),
  whose pinnings land in the integer Tate twists of EtaleCohomologyFoundations §F.0.3,
  its regular term pinned by the cycle-class morphism, its construction and uniqueness,
  Gabber biduality and excellent duality, and normalized local duality need the étale
  Tate twists, the local support functor, derived internal Hom and general-base
  exceptional inverse image.
* Gabber's pointwise perverse t-structures need the stalk and support functors of
  the étale category; an abstract t-structure is not that missing structure.
* Local Lefschetz needs local étale cohomology with supports and its hypersurface
  restriction map.
* Algebraic tilting of matched-open idempotents, étale cohomology and support
  complexes needs henselian perfectoid pairs, sharp quotients, matched opens and
  their derived étale sections. PreTilt alone supplies none of those hypotheses.

There are no weakened stand-ins for these headlines. Absolute purity is supplied
by LefschetzPencilsAndVanishingCycles §0.10, rather than stated again here.
Epp's elimination of wild ramification (README §1.3) is an intermediate theorem
of the mixed-characteristic Cohen–Gabber proof, not a headline, so it is not
stated here.
-/

@[expose] public section

open scoped TensorProduct

namespace TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII

/-! ## Layer 1: Cohen–Gabber structure and partial algebraization -/

universe u v

/-- A reduced equidimensional complete noetherian local ring of characteristic p > 0
admits a finite torsion-free power-series parametrization inducing the identity on its
residue field and having finite étale generic fibre (ILO IV 2.1.1; ILO14 line 2276). -/
theorem cohenGabber_equalCharacteristic
    (A : Type*) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [IsReduced A]
    (p : ℕ) [Fact p.Prime] [CharP A p] (d : ℕ)
    (hdim : ringKrullDim A = d)
    (hequi : ∀ q ∈ minimalPrimes A, ringKrullDim (A ⧸ q) = d) :
    ∃ _ : Algebra (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A,
      Function.Injective (algebraMap (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A) ∧
      (IsLocalRing.residue A).comp
          (algebraMap (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A) =
        MvPowerSeries.constantCoeff ∧
      Module.Finite (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A ∧
      Module.IsTorsionFree (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A ∧
      Algebra.Etale (FractionRing (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)))
        (FractionRing (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) ⊗[
          MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)] A) := by
  sorry


/-- A finite group of invertible order acting on a reduced complete equicharacteristic
local ring admits an equivariant finite generically étale parametrization, with the
induced residue-field action on coefficients and fixed variables. Equidimensionality
is not required (ILO IV 2.2.2; ILO14 line 2419). -/
theorem cohenGabber_equivariant
    (A : Type*) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [IsReduced A]
    (F : Type*) [Field F] [Algebra F A]
    (G : Type*) [Group G] [Finite G] (ρ : G →* RingAut A)
    (horder : IsUnit (Nat.card G : A)) (d : ℕ) (hdim : ringKrullDim A = d) :
    ∃ _ : Algebra (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A,
      Function.Injective (algebraMap (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A) ∧
      (IsLocalRing.residue A).comp
          (algebraMap (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A) =
        MvPowerSeries.constantCoeff ∧
      (∀ (g : G) (s : MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)),
        algebraMap (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A
          (MvPowerSeries.map (IsLocalRing.ResidueField.mapEquiv (ρ g)).toRingHom s) =
          ρ g (algebraMap (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A s)) ∧
      Module.Finite (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A ∧
      Algebra.Etale (FractionRing (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)))
        (FractionRing (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) ⊗[
          MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)] A) := by
  sorry

/-- Native ring data for the prime-to-ell mixed-characteristic Cohen–Gabber theorem:
a finite normal local extension, a complete DVR power-series parametrization etale
above the generic points of the p-fibre, and an ell-group action whose invariant
extension has degree prime to ell. The residue equivalence and every structural map
are retained (ILO IV 4.3.1; ILO14 line 2729). -/
structure MixedCohenGabberPresentation
    (A : Type u) [CommRing A] [IsDomain A] [IsLocalRing A] (p ℓ d : ℕ) where
  dimension : ringKrullDim A = d
  dimension_ge_two : 2 ≤ d
  B : Type u
  [ringB : CommRing B]
  [domainB : IsDomain B]
  [localB : IsLocalRing B]
  [noetherianB : IsNoetherianRing B]
  [completeB : IsAdicComplete (IsLocalRing.maximalIdeal B) B]
  [normalB : IsIntegrallyClosed B]
  [algebraAB : Algebra A B]
  finiteAB : Module.Finite A B
  injectiveAB : Function.Injective (algebraMap A B)
  localAB : IsLocalHom (algebraMap A B)
  V : Type u
  [ringV : CommRing V]
  [domainV : IsDomain V]
  [dvrV : IsDiscreteValuationRing V]
  [charZeroV : CharZero V]
  [completeV : IsAdicComplete (IsLocalRing.maximalIdeal V) V]
  [residueCharV : CharP (IsLocalRing.ResidueField V) p]
  f : MvPowerSeries (Fin (d - 1)) V →+* B
  finite_f : f.Finite
  injective_f : Function.Injective f
  local_f : IsLocalHom f
  residueEquiv : IsLocalRing.ResidueField V ≃+* IsLocalRing.ResidueField B
  residue_eq : (IsLocalRing.residue B).comp (f.comp MvPowerSeries.C) =
    residueEquiv.toRingHom.comp (IsLocalRing.residue V)
  etaleAtPFibre :
    letI := f.toAlgebra
    ∀ q : PrimeSpectrum B,
      Ideal.comap f q.asIdeal ∈
        (Ideal.span {(p : MvPowerSeries (Fin (d - 1)) V)}).minimalPrimes →
      Algebra.IsEtaleAt (MvPowerSeries (Fin (d - 1)) V) q.asIdeal
  H : Type u
  [groupH : Group H]
  [finiteH : Finite H]
  ellGroup : IsPGroup ℓ H
  [actionB : MulSemiringAction H B]
  [actionV : MulSemiringAction H V]
  fixesA : ∀ (g : H) (a : A), g • algebraMap A B a = algebraMap A B a
  equivariant : ∀ (g : H) (s : MvPowerSeries (Fin (d - 1)) V),
    f (MvPowerSeries.map (MulSemiringAction.toRingHom H V g) s) = g • f s
  invariantMap : A →+* FixedPoints.subring B H
  invariantMap_eq : (FixedPoints.subring B H).subtype.comp invariantMap = algebraMap A B
  invariantFinite : invariantMap.Finite
  invariantDegree :
    letI := invariantMap.toAlgebra
    Nat.Coprime
      (Module.finrank (FractionRing A) (FractionRing A ⊗[A] FixedPoints.subring B H)) ℓ

attribute [instance] MixedCohenGabberPresentation.ringB
  MixedCohenGabberPresentation.domainB MixedCohenGabberPresentation.localB
  MixedCohenGabberPresentation.noetherianB MixedCohenGabberPresentation.completeB
  MixedCohenGabberPresentation.normalB MixedCohenGabberPresentation.algebraAB
  MixedCohenGabberPresentation.ringV MixedCohenGabberPresentation.domainV
  MixedCohenGabberPresentation.dvrV MixedCohenGabberPresentation.charZeroV
  MixedCohenGabberPresentation.completeV MixedCohenGabberPresentation.residueCharV
  MixedCohenGabberPresentation.groupH MixedCohenGabberPresentation.finiteH
  MixedCohenGabberPresentation.actionB MixedCohenGabberPresentation.actionV

/-- The prime-to-ell mixed-characteristic Cohen–Gabber presentation exists for every
complete noetherian normal local domain of dimension at least two and every prime
ell different from the residue characteristic (ILO IV 4.3.1; ILO14 line 2729).
The p-dense etale condition is imposed on the parametrizing map itself, before
passing to invariants. -/
theorem cohenGabber_mixedCharacteristic
    (A : Type u) [CommRing A] [IsDomain A] [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [IsIntegrallyClosed A]
    [CharZero A] (p ℓ d : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField A) p]
    (hℓ : ℓ.Prime) (hne : ℓ ≠ p) (hd : 2 ≤ d) (hdim : ringKrullDim A = d) :
    Nonempty (MixedCohenGabberPresentation A p ℓ d) := by
  sorry

/-- A partial algebraization identifies the ring with the completion of a finite-type
algebra over a smaller complete local base, and identifies every specified ideal. -/
structure PartialAlgebraization (A : Type u) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    {ι : Type v} (I : ι → Ideal A) where
  B : Type u
  [ringB : CommRing B]
  [localB : IsLocalRing B]
  [noetherianB : IsNoetherianRing B]
  [completeB : IsAdicComplete (IsLocalRing.maximalIdeal B) B]
  lowerDimension : ringKrullDim B < ringKrullDim A
  C : Type u
  [ringC : CommRing C]
  [algebraBC : Algebra B C]
  [finiteTypeC : Algebra.FiniteType B C]
  n : Ideal C
  [maximalN : n.IsMaximal]
  liesOver : Ideal.comap (algebraMap B C) n = IsLocalRing.maximalIdeal B
  completionEquiv :
    AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime n))
      (Localization.AtPrime n) ≃+* A
  modelIdeals : ι → Ideal (Localization.AtPrime n)
  ideals_eq : ∀ i, Ideal.map
    (completionEquiv.toRingHom.comp
      (algebraMap (Localization.AtPrime n)
        (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime n))
          (Localization.AtPrime n)))) (modelIdeals i) = I i

attribute [instance] PartialAlgebraization.ringB PartialAlgebraization.localB
  PartialAlgebraization.noetherianB PartialAlgebraization.completeB
  PartialAlgebraization.ringC PartialAlgebraization.algebraBC
  PartialAlgebraization.finiteTypeC PartialAlgebraization.maximalN

/-- Every finite ideal family in a nonfield reduced complete equicharacteristic local ring
has a partial algebraization over a regular complete local base of dimension one less
(ILO V 2.1.2 and 3.1.4; ILO14 lines 2890, 2981). -/
theorem partialAlgebraization_equalCharacteristic
    (A : Type u) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [IsReduced A]
    (F : Type*) [Field F] [Algebra F A] (hpos : 0 < ringKrullDim A)
    {ι : Type v} [Finite ι] (I : ι → Ideal A) :
    ∃ P : PartialAlgebraization A I,
      IsRegularLocalRing P.B ∧ ringKrullDim P.B + 1 = ringKrullDim A := by
  sorry

/-- A finite injective local map from a local domain to a complete noetherian normal local
domain, with generic degree coprime to a specified natural number. The degree is the
dimension of its actual generic fibre. -/
structure PrimeToEllLocalExtension
    (A : Type u) [CommRing A] [IsDomain A] [IsLocalRing A] (ℓ : ℕ) where
  B : Type u
  [ringB : CommRing B]
  [domainB : IsDomain B]
  [localB : IsLocalRing B]
  [noetherianB : IsNoetherianRing B]
  [completeB : IsAdicComplete (IsLocalRing.maximalIdeal B) B]
  [normalB : IsIntegrallyClosed B]
  [algebraAB : Algebra A B]
  [localMap : IsLocalHom (algebraMap A B)]
  injective : Function.Injective (algebraMap A B)
  finite : Module.Finite A B
  primeToEll : Nat.Coprime
    (Module.finrank (FractionRing A) (FractionRing A ⊗[A] B)) ℓ

attribute [instance] PrimeToEllLocalExtension.ringB PrimeToEllLocalExtension.domainB
  PrimeToEllLocalExtension.localB PrimeToEllLocalExtension.noetherianB
  PrimeToEllLocalExtension.completeB PrimeToEllLocalExtension.normalB
  PrimeToEllLocalExtension.algebraAB PrimeToEllLocalExtension.localMap

/-- A complete normal mixed-characteristic local domain of dimension at least two has
one finite prime-to-ell extension over which every finite ideal family algebraizes over
a regular mixed-characteristic complete local base of dimension one less. The extension
is chosen before the family (ILO V 3.1.1–3.1.3; ILO14 line 2957). -/
theorem partialAlgebraization_mixedCharacteristic
    (A : Type u) [CommRing A] [IsDomain A] [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [IsIntegrallyClosed A]
    [CharZero A] (p ℓ : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField A) p]
    (hℓ : ℓ.Prime) (hne : ℓ ≠ p) (hdim : 2 ≤ ringKrullDim A) :
    ∃ E : PrimeToEllLocalExtension A ℓ,
      ∀ (r : ℕ) (I : Fin r → Ideal E.B), ∃ P : PartialAlgebraization E.B I,
        IsRegularLocalRing P.B ∧ CharZero P.B ∧
        CharP (IsLocalRing.ResidueField P.B) p ∧
        ringKrullDim P.B + 1 = ringKrullDim A := by
  sorry

/-! ## Layer 5: Dimension functions, affine Lefschetz and cohomological dimension -/

/-- Gabber’s affine Lefschetz theorem, local form: let A be a strictly henselian
noetherian local ring of Krull dimension d that is a G-ring, so that A → Â is regular
(for a noetherian local ring this is quasi-excellence, ILO I 5.3.1 and 5.5.1(ii),
ILO14 lines 667, 724). For every affine open U of Spec A and every n invertible in A, the
étale cohomology H^q(U, ℤ/n) vanishes for q > d (ILO XV Corollaire 1.2.4, with the
reduction 1.2.5 to the complete case; ILO14 lines 10362, 10365). -/
theorem affineLefschetz_strictlyLocal
    (A : Type u) [CommRing A] [HenselianLocalRing A]
    [IsSepClosed (IsLocalRing.ResidueField A)] [TauCeti.Excellence.IsGRing A]
    (d : ℕ) (hdim : ringKrullDim A = d) (n : ℕ) (hn : IsUnit (n : A))
    (U : (AlgebraicGeometry.Spec (CommRingCat.of A)).Opens)
    (hU : AlgebraicGeometry.IsAffineOpen U) (q : ℕ) (hq : d < q) :
    Subsingleton
      (((CategoryTheory.constantSheaf U.toScheme.smallEtaleTopology AddCommGrpCat.{u}).obj
        (AddCommGrpCat.of (ULift.{u} (ZMod n)))).H q) := by
  sorry

/-- On every open subscheme of a strictly henselian noetherian local scheme of
positive finite dimension d, every ell-primary torsion abelian étale sheaf has
vanishing cohomology in degrees at least 2d. Torsion is tested sectionwise on the
affine étale basis, without a uniform exponent (ILO XVIII-A 1.1; ILO14 line 16193). -/
theorem cohomologicalDimension_le_of_strictlyLocal
    (A : Type u) [CommRing A] [IsNoetherianRing A] [HenselianLocalRing A]
    [IsSepClosed (IsLocalRing.ResidueField A)]
    (d : ℕ) (hd : 0 < d) (hdim : ringKrullDim A = d)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : IsUnit (ℓ : A))
    (U : (AlgebraicGeometry.Spec (CommRingCat.of A)).Opens)
    (F : CategoryTheory.Sheaf U.toScheme.smallEtaleTopology AddCommGrpCat.{u})
    (htors : ∀ (V : U.toScheme.Etale), AlgebraicGeometry.IsAffine V.left →
      ∀ (s : F.obj.obj (Opposite.op V)), ∃ k : ℕ, ℓ ^ k • s = 0)
    (q : ℕ) (hq : 2 * d ≤ q) :
    Subsingleton (F.H q) := by
  sorry

/-- Gabber's formula for the cohomological dimension of a henselian fraction field: let A be
a henselian noetherian local domain of Krull dimension d that is a G-ring (for a noetherian
local ring, quasi-excellence), with fraction field K and residue field k, and ℓ a prime
invertible in A. If ℓ ≠ 2 or k is not formally real, then cd_ℓ(K) = d + cd_ℓ(k), the
ℓ-cohomological dimensions of the absolute Galois groups taken in ℕ∞, with coefficient modules
in the universe of A, the universe of both Galois groups. For A strictly henselian
this is cd_ℓ(K) = d, conjectured in SGA 4 X 3.1. The upper bound is ILO 0, Corollaire 8
(ILO14 line 396); the lower bound is SGA 4 X, Corollaire 2.4 (SGA4 line 1338). The hypothesis
on k is needed: for ℓ = 2 the henselization of ℝ[x, y]/(x² + y²) at the origin has
cd₂(K) = 1 while 1 + cd₂(ℝ) = ∞ (SGA 4 X 2.3). -/
theorem cohomologicalDimension_fractionRing_eq
    (A : Type u) [CommRing A] [IsDomain A] [HenselianLocalRing A]
    [TauCeti.Excellence.IsGRing A] (d : ℕ) (hdim : ringKrullDim A = d)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : IsUnit (ℓ : A))
    (hreal : ℓ ≠ 2 ∨ ¬ IsFormallyReal (IsLocalRing.ResidueField A)) :
    TauCeti.cohomologicalDimensionAt.{u} ℓ (Field.absoluteGaloisGroup (FractionRing A)) =
      (d : ℕ∞) + TauCeti.cohomologicalDimensionAt.{u} ℓ
        (Field.absoluteGaloisGroup (IsLocalRing.ResidueField A)) := by
  sorry

end TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII

module

public import Mathlib

/-!
# Schemes over commutative semirings: target signatures

This file contains suggested forms, not an exhaustive checklist; the README is definitive.
The generic prototypes use Mathlib's actual internal module and scalar-restriction carriers.
The semiring prototypes compare the equational flatness condition with the native tensor
functor and state the equality of the two concrete topologies.

Not prototyped: §G.2's stack theorem requires its coherent right-adjoint/Beck–Chevalley
hypothesis package; the comparison of categorical and congruence finite presentation
requires §G.0's semiring/internal-monoid equivalence; §4.2's scheme closure, §4.5's closed
subscheme classification and §5.0's change-of-context functor require the affine-atlas
scheme category of §4.1; §§5.3–5.4 require its ring instance and FunctorOfPoints; §6.4
requires the locally semiringed-space and geometric-scheme carriers. Their precise targets
and prerequisites are specified in the README. There are no admitted instances or
admitted data definitions in this file.
-/

public section

noncomputable section

open CategoryTheory Limits TensorProduct

universe u v

namespace TauCetiRoadmap.SemiringSchemes

/-! ## Layer G: Relative algebra and descent -/

namespace Relative

variable {C : Type u} [Category.{v} C] [MonoidalCategory C] [SymmetricCategory C]

/-- Affines relative to a symmetric monoidal base use Mathlib's internal commutative monoids. -/
abbrev Affine (C : Type u) [Category.{v} C] [MonoidalCategory C] [SymmetricCategory C] :=
  (CommMon C)ᵒᵖ

/-- Restriction of internal modules along the underlying monoid morphism. -/
abbrev restrictScalars {A B : CommMon C} (f : A ⟶ B) : Mod C B.X ⥤ Mod C A.X := by
  exact @Mod.comap C _ _ C _ _ A.X B.X A.mon B.mon f.hom.hom f.hom.isMonHom_hom

/-- With the full closed/cocomplete hypotheses, actual internal scalar restriction has a left adjoint. -/
theorem restriction_isRightAdjoint [MonoidalClosed C] [HasLimits C] [HasColimits C]
    {A B : CommMon C} (f : A ⟶ B) : (restrictScalars f).IsRightAdjoint := by
  sorry

/-- Scalar extension is the left adjoint of the existing restriction functor, when it exists. -/
noncomputable def extendScalars {A B : CommMon C} (f : A ⟶ B)
    [(restrictScalars f).IsRightAdjoint] : Mod C A.X ⥤ Mod C B.X :=
  Functor.leftAdjoint (restrictScalars f)

/-- The three TV conditions for an affine open, expressed through real categorical interfaces. -/
def IsZariskiOpen {A B : CommMon C} (f : A ⟶ B)
    [(restrictScalars f).IsRightAdjoint] : Prop :=
  PreservesFiniteLimits (extendScalars f) ∧ Epi f ∧
    IsFinitelyPresentable.{v} (Under.mk f)

end Relative

variable {R : Type u} [CommSemiring R]

/-! ## Layer 0: Categorical algebra of semirings and semimodules -/

theorem CommSemiRingCat.epi_iff_isEpi (A B : Type u) [CommSemiring A] [CommSemiring B]
    [Algebra A B] :
    Epi (CommSemiRingCat.ofHom (algebraMap A B)) ↔ Algebra.IsEpi A B := sorry

class Algebra.CongrFinitePresentation (A B : Type u) [CommSemiring A] [CommSemiring B]
    [Algebra A B] : Prop where
  out : ∃ (n : ℕ) (f : MvPolynomial (Fin n) A →ₐ[A] B)
      (s : Finset (MvPolynomial (Fin n) A × MvPolynomial (Fin n) A)),
    Function.Surjective f ∧ ringConGen (fun a b ↦ (a, b) ∈ s) = RingCon.ker f.toRingHom

/-! ## Layer 1: Congruences and ideals -/

/-- The Bourne congruence of an ideal. -/
def Ideal.toRingCon (I : Ideal R) : RingCon R :=
  ringConGen (fun a b => a ∈ I ∧ b = 0)

/-- The zero class of a congruence. -/
def RingCon.zeroIdeal (c : RingCon R) : Ideal R :=
  RingHom.ker (c.mk' : R →+* c.Quotient)

theorem Ideal.gc_toRingCon :
    GaloisConnection (Ideal.toRingCon (R := R)) RingCon.zeroIdeal := sorry

theorem RingCon.toRingCon_zeroIdeal_of_isAddUnit (c : RingCon R)
    (h : ∀ x : c.Quotient, IsAddUnit x) : Ideal.toRingCon (RingCon.zeroIdeal c) = c := sorry

theorem PrimeSpectrum.range_comap_mk' (c : RingCon R) :
    Set.range (PrimeSpectrum.comap (c.mk' : R →+* c.Quotient)) =
      {p | ∀ a b, c a b → (a ∈ p.asIdeal ↔ b ∈ p.asIdeal)} := sorry

/-! ## Layer 2: Flatness -/

class Module.LimitFlat (A M : Type*) [CommSemiring A] [AddCommMonoid M] [Module A M] :
    Prop where
  out : ∀ {m : ℕ} (r s : Fin m → A) (x : Fin m → M), ∑ i, r i • x i = ∑ i, s i • x i →
    ∃ (n : ℕ) (a : Fin m → Fin n → A) (y : Fin n → M),
      (∀ i, x i = ∑ j, a i j • y j) ∧ ∀ j, ∑ i, r i * a i j = ∑ i, s i * a i j

/-- The equational definition must match the tensor functor used by the site. -/
theorem Module.limitFlat_iff_preservesFiniteLimits (M : Type u) [AddCommMonoid M]
    [Module R M] :
    Module.LimitFlat R M ↔
      PreservesFiniteLimits (MonoidalCategory.tensorLeft (SemimoduleCat.of R M)) := by
  sorry

theorem Module.LimitFlat.flat (M : Type*) [AddCommMonoid M] [Module R M]
    [Module.LimitFlat R M] : Module.Flat R M := sorry

theorem Module.limitFlat_iff_flat {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M] :
    Module.LimitFlat A M ↔ Module.Flat A M := sorry

theorem IsLocalization.limitFlat (S : Type*) [CommSemiring S] [Algebra R S]
    (M : Submonoid R) [IsLocalization M S] : Module.LimitFlat R S := sorry

/-! ## Layer 3: The Zariski site of affine semiring schemes -/

def RingHom.IsZariskiOpen {A B : Type u} [CommSemiring A] [CommSemiring B]
    (f : A →+* B) : Prop :=
  letI := f.toAlgebra
  Module.LimitFlat A B ∧ Algebra.IsEpi A B ∧ Algebra.CongrFinitePresentation A B

/-- Zariski open morphisms are covered by principal localizations of the source. -/
theorem RingHom.IsZariskiOpen.exists_away_cover {A B : Type u} [CommSemiring A]
    [CommSemiring B] {f : A →+* B} (hf : RingHom.IsZariskiOpen f) :
    ∃ (n : ℕ) (g : Fin n → A), Ideal.span (Set.range (f ∘ g)) = ⊤ ∧
      ∀ i, Function.Bijective
        (IsLocalization.Away.map (Localization.Away (g i)) (Localization.Away (f (g i)))
          f (g i)) := sorry

/-- Extension along the family detects isomorphisms of native semimodules.
The universe of the test modules is the same `u` used by the affine site. -/
def JointlyConservative {ι : Type v} {A : CommSemiRingCat.{u}}
    {B : ι → CommSemiRingCat.{u}} (f : ∀ i, A ⟶ B i) : Prop :=
  ∀ (N P : SemimoduleCat.{u} A) (φ : N ⟶ P),
    (∀ i, letI := (f i).hom.toAlgebra
      Function.Bijective (φ.hom.lTensor (B i))) → Function.Bijective φ.hom

/-- The concrete TV precoverage: all members are affine opens, and a finite
subfamily detects isomorphisms after extension of scalars. -/
def zariskiPrecoverageTV : Precoverage CommSemiRingCat.{u}ᵒᵖ where
  coverings X := {S | ∃ (ι : Type u) (B : ι → CommSemiRingCat.{u}) (f : ∀ i, X.unop ⟶ B i),
    S = Presieve.ofArrows (fun i => Opposite.op (B i)) (fun i => (f i).op) ∧
      (∀ i, RingHom.IsZariskiOpen (f i).hom) ∧
      ∃ (n : ℕ) (j : Fin n → ι), JointlyConservative (fun k => f (j k))}

/-- Principal covers are localization families whose denominators generate the unit ideal. -/
def zariskiPrecoveragePrincipal : Precoverage CommSemiRingCat.{u}ᵒᵖ where
  coverings X := {S | ∃ (n : ℕ) (g : Fin n → X.unop),
    Ideal.span (Set.range g) = ⊤ ∧
      S = Presieve.ofArrows
        (fun i => Opposite.op (CommSemiRingCat.of (Localization.Away (g i))))
        (fun i => (CommSemiRingCat.ofHom
          (algebraMap X.unop (Localization.Away (g i)))).op)}

/-- The relative TV Zariski topology in its concrete semiring presentation. -/
def zariskiTopologyTV : GrothendieckTopology CommSemiRingCat.{u}ᵒᵖ :=
  zariskiPrecoverageTV.toGrothendieck

/-- The topology generated by principal localization covers. -/
def zariskiTopologyPrincipal : GrothendieckTopology CommSemiRingCat.{u}ᵒᵖ :=
  zariskiPrecoveragePrincipal.toGrothendieck

/-- The semiring specialization of the relative Zariski site has the expected principal basis. -/
theorem zariskiTopologyTV_eq_principal :
    zariskiTopologyTV.{u} = zariskiTopologyPrincipal.{u} := by
  sorry

end TauCetiRoadmap.SemiringSchemes

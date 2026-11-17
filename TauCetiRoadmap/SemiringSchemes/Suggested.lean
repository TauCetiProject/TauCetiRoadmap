module

public import Mathlib

/-!
# Schemes over commutative semirings: target signatures

This file contains suggested forms, not an exhaustive checklist; the README is definitive.
It states, against the pinned Mathlib, the algebraic carriers of Layers 0–3 and the headline
comparison of Zariski topologies. The scheme-level targets of Layers 4–6 rest on the generic
layer of §4.1, which has no carrier at the pins, and are not stated here.
-/

public section

noncomputable section

open CategoryTheory Limits TensorProduct

universe u

namespace TauCetiRoadmap.SemiringSchemes

variable {R : Type u} [CommSemiring R]

/-! ## Layer 0 -/

instance : HasColimits CommSemiRingCat.{u} := by
  sorry

instance : HasLimits (SemimoduleCat.{u} R) := by
  sorry

instance : HasColimits (SemimoduleCat.{u} R) := by
  sorry

theorem CommSemiRingCat.epi_iff_isEpi (A B : Type u) [CommSemiring A] [CommSemiring B]
    [Algebra A B] :
    Epi (CommSemiRingCat.ofHom (algebraMap A B)) ↔ Algebra.IsEpi A B := sorry

class Algebra.CongrFinitePresentation (A B : Type u) [CommSemiring A] [CommSemiring B]
    [Algebra A B] : Prop where
  out : ∃ (n : ℕ) (f : MvPolynomial (Fin n) A →ₐ[A] B)
      (s : Finset (MvPolynomial (Fin n) A × MvPolynomial (Fin n) A)),
    Function.Surjective f ∧ ringConGen (fun a b ↦ (a, b) ∈ s) = RingCon.ker f.toRingHom

/-! ## Layer 1 -/

/-- The Bourne congruence of an ideal. -/
def Ideal.toRingCon (I : Ideal R) : RingCon R where
  r a b := ∃ i ∈ I, ∃ j ∈ I, a + i = b + j
  iseqv := sorry
  add' := sorry
  mul' := sorry

/-- The zero class of a congruence. -/
def RingCon.zeroIdeal (c : RingCon R) : Ideal R where
  carrier := {a | c a 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem Ideal.gc_toRingCon :
    GaloisConnection (Ideal.toRingCon (R := R)) RingCon.zeroIdeal := sorry

theorem RingCon.toRingCon_zeroIdeal_of_isAddUnit (c : RingCon R)
    (h : ∀ x : c.Quotient, IsAddUnit x) : Ideal.toRingCon (RingCon.zeroIdeal c) = c := sorry

theorem PrimeSpectrum.range_comap_mk' (c : RingCon R) :
    Set.range (PrimeSpectrum.comap (c.mk' : R →+* c.Quotient)) =
      {p | ∀ a b, c a b → (a ∈ p.asIdeal ↔ b ∈ p.asIdeal)} := sorry

/-! ## Layer 2 -/

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

/-! ## Layer 3 -/

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

end TauCetiRoadmap.SemiringSchemes

import Mathlib

/-!
# Arithmetic Λ-rings and q-Witt vectors: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs.

The headline results, in README order, are:
* the big Witt ghost-image criterion (§1.2), stated below using its integral
  coordinate polynomials;
* big Witt construction (§1.3), the finite and inverse-limit big Witt power-series
  comparisons (§1.4a), étale Frobenius base change (§1.6), and finite-prime
  arithmetic fracture (§1.8);
* the integral special λ-ring/Witt-coalgebra equivalence (§2.1a), arithmetic
  Λ-perfection and perfect coverage (§§2.3–2.4);
* absolute q-Witt initiality, the Verschiebung resolution and Witt injectivity
  (§§3.2, 3.4, 3.7);
* relative q-Witt initiality and perfect-cover comparisons (§§4.3, 4.6);
* q-Witt étale base change and completion (§§5.1–5.3);
* the q-fixed cyclotomic completed coefficient Frobenius and its naturality
  under changes of arithmetic Λ-base and étale algebra (§§6.1–6.3);
* initial differential q-Witt systems, positive-degree Frobenius and differential
  base change (§§7.2, 7.5, 7.7);
* the unique framed coordinate automorphisms (§8.1), stated below on power series,
  and their complete difference calculus (§§8.2–8.4);
* framed Frobenius decomposition, framed cohomology, general-base prismatic
  specialization and iterated Frobenius décalage (§9.5a), the simultaneous prime-power
  induction, completed δ-compatible PD-presentation comparison and functorial smooth
  E∞ de Rham comparison (§§9.1, 9.5–9.7);
* smooth integer torsion-freeness and degreewise completion (§§10.1–10.2).

Apart from the two theorems stated below, these headlines are not statable at the
pins. The big Witt results need its functorial ring carrier. In particular, the
finite and inverse-limit power-series comparisons need the additive group of
coordinate big Witt vectors on arbitrary truncation sets; the pinned p-typical
Witt carriers do not provide it. The arithmetic results need the big Witt comonad
and its Λ-coalgebra carrier; the integral equivalence additionally needs the
supplied special λ-ring carrier. The prismatic specialization and iteration need
the bounded-prism, prismatic-cohomology and derived décalage carriers. Finite-prime
arithmetic fracture needs enhanced derived localization and completion diagrams.
The absolute and relative q-Witt results need the q-FV system categories and their
initial rings; the differential results, including the smooth torsion and completion
exports, need the differential q-Witt system and de Rham algebra carriers.
The completed coefficient Frobenius results, including their mixed-base naturality
and linearization squares, need arithmetic Λ-bases and their Adams twists as well
as derived completed scalar extension. The complete difference
calculus and framed cohomology results need the framed difference DGA and its
Frobenius; the induction and smooth comparison additionally need the differential
q-Witt algebra and enhanced E∞ algebra carriers. The PD-presentation comparison
additionally needs the δ-presentation and PD de Rham algebra carriers. These constructions are README
targets, with no substitute statements here.

The two definitions below only make the ghost-image criterion statable. Ghost
polynomials are evaluated on coordinate functions; only their restrictions to the
positive indices of a truncation set enter the theorem.
-/

namespace TauCetiRoadmap.QWittVectors

namespace BigWitt

open scoped BigOperators

/-! ## Layer 1: Big Witt rings and shared homological algebra -/

/-- A truncation set is a set of positive natural numbers closed under positive divisors.
The empty truncation set is allowed (Hesselholt, §1). Its positive-divisor
closure also makes S/n a truncation set for every positive n. -/
structure TruncationSet where
  carrier : Set ℕ
  positive : ∀ n ∈ carrier, 0 < n
  divisor_closed : ∀ {n d : ℕ}, n ∈ carrier → 0 < d → d ∣ n → d ∈ carrier

/-- The integral big Witt ghost polynomial of positive index `n`, evaluated on coordinates.
The defining divisor sum is used only at positive indices in the target theorems. -/
def ghostPolynomial {R : Type*} [CommRing R] (n : ℕ) (x : ℕ → R) : R :=
  ∑ d ∈ n.divisors, (d : R) * x d ^ (n / d)

/-- The Dwork ghost-image criterion, with independently specified prime Frobenius lifts.
The lifts need not commute (Hesselholt, Lemma 1.1). -/
theorem ghost_image {R : Type*} [CommRing R] (S : TruncationSet)
    (φ : ℕ → R →+* R)
    (hφ : ∀ p, p.Prime → p ∈ S.carrier → ∀ a : R,
      φ p a - a ^ p ∈ Ideal.span ({(p : R)} : Set R))
    (b : ℕ → R) :
    (∃ x : ℕ → R, ∀ n ∈ S.carrier, ghostPolynomial n x = b n) ↔
      ∀ p, p.Prime → ∀ n ∈ S.carrier, p ∣ n →
        b n - φ p (b (n / p)) ∈
          Ideal.span ({(p : R) ^ padicValNat p n} : Set R) := by
  sorry

end BigWitt

namespace QWitt

/-! ## Layer 8: Complete framed difference calculus -/

/-- An étale frame has a unique series-algebra automorphism reducing to the identity
and multiplying its chosen coordinate by one plus the series variable (Wagner §4.7).
Series-algebra linearity preserves every power of the series variable. -/
theorem framedGamma_existsUnique
    (A : Type*) (R : Type*) [CommRing A] [CommRing R] [Algebra A R]
    (r : ℕ) [Algebra (MvPolynomial (Fin r) A) R]
    [IsScalarTower A (MvPolynomial (Fin r) A) R]
    [Algebra.Etale (MvPolynomial (Fin r) A) R] (i : Fin r) :
    let t : Fin r → R := fun j =>
      algebraMap (MvPolynomial (Fin r) A) R (MvPolynomial.X j)
    ∃! γ : PowerSeries R ≃ₐ[PowerSeries A] PowerSeries R,
      (∀ f : PowerSeries R,
        PowerSeries.constantCoeff (γ f) = PowerSeries.constantCoeff f) ∧
      ∀ j : Fin r, γ (PowerSeries.C (t j)) =
        (if j = i then 1 + PowerSeries.X else 1) * PowerSeries.C (t j) := by
  sorry

end QWitt

end TauCetiRoadmap.QWittVectors

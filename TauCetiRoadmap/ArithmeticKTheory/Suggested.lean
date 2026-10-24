import Mathlib

/-!
# ArithmeticKTheory: target signatures

README.md is the roadmap; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: denominator
localization for arbitrary sets of Dedekind primes and the divided-Bernoulli
consequence of cyclotomic class-number regularity.
CyclotomicClassGroupsAndStickelberger §§3.1 and 5.1 supply unrestricted
divided-Bernoulli integrality and congruences and the finite criterion;
§5.4 supplies prime-power class-number stability. The all-index consequence
uses those unrestricted inputs, including indices divisible by the prime.

Quillen finite generation and ranks, Soulé localization, the odd and even
integral tables, Harris–Segal detection, higher wild-kernel divisibility, Bott
descent, K₄(ℤ) = 0, the totally real special-value order ratio, the integer
even-order formulas, the Vandiver K-group table and the Gaussian and golden
tame-kernel equivalences are not statable at the pins: their higher Quillen
K-group/spectrum carriers and comparison maps are missing. Hermitian finiteness
also lacks the required GW/L-spectrum carriers. The arithmetic finite CW
model in README §3.2 lacks the arithmetic bordification and quotient carriers.
Numerical rank or degree-slot
formulas do not state those theorems.
-/

noncomputable section

open IsDedekindDomain

namespace TauCetiRoadmap.ArithmeticKTheory

/-! ## Layer 1: S-integers and arithmetic functoriality -/

section SIntegers

variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  (S : Set (HeightOneSpectrum R)) (F : Type*) [Field F]
  [Algebra R F] [IsFractionRing R F]

/-- Elements of a Dedekind domain that become units in its ring of S-integers. -/
def sUnitSubmonoid : Submonoid R :=
  (IsUnit.submonoid (S.integer F)).comap (algebraMap R (S.integer F))

/-- For a Dedekind domain, its S-integers are a localization at M exactly when
M consists of elements invertible there and meets every prime in S; README §1.1. -/
theorem integer_isLocalization_iff (M : Submonoid R) :
    IsLocalization M (S.integer F) ↔
      M ≤ sUnitSubmonoid S F ∧ ∀ v ∈ S, ∃ m ∈ M, m ∈ v.asIdeal := by
  sorry

/-- Torsion of the class group suffices even when the set of inverted primes is infinite. -/
theorem integer_isLocalization_of_torsion_classGroup
    (htors : ∀ c : ClassGroup R, IsOfFinOrder c) :
    IsLocalization (sUnitSubmonoid S F) (S.integer F) := by
  sorry

end SIntegers

/-! ## Layer 7: Bernoulli numbers and regular primes -/

/-- If an odd prime does not divide the cyclotomic class number, it divides
no reduced numerator of B_(2k)/k for k >= 1; README §7.2. The class-number
hypothesis unfolds CyclotomicClassGroupsAndStickelberger §5.1's
IsRegularPrime predicate. -/
theorem regularPrime_dividedBernoulli_num (p : ℕ) (hp : p.Prime) (hodd : Odd p)
    (hreg : ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ))
    (k : ℕ) (hk : 1 ≤ k) :
    ¬ (p : ℤ) ∣ (bernoulli (2 * k) / (k : ℚ)).num := by
  sorry

end TauCetiRoadmap.ArithmeticKTheory

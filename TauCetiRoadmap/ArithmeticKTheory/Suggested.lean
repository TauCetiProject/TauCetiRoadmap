module

public import Mathlib

@[expose] public section

/-!
# ArithmeticKTheory: target signatures

README.md is the roadmap; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: denominator
localization for arbitrary sets of Dedekind primes, the divided-Bernoulli
consequence of cyclotomic class-number regularity, and the vanishing of the
fourth stable stem in its unstable form: π_(n+4)(Sⁿ) is trivial for n ≥ 6.
CyclotomicClassGroupsAndStickelberger §§3.1 and 5.1 supply unrestricted
divided-Bernoulli integrality and congruences and the finite criterion;
§5.4 supplies prime-power class-number stability. The all-index consequence
uses those unrestricted inputs, including indices divisible by the prime.

Quillen finite generation and ranks, Soulé localization, the odd and even
integral tables, Harris–Segal detection, higher wild-kernel divisibility, Bott
descent, K₄(ℤ) = 0, H₃(K(ℤ); ℤ) ≃ ℤ/2 in ordinary spectrum homology,
the totally real special-value order ratio, the integer even-order formulas,
the Vandiver K-group table and the Gaussian and golden tame-kernel equivalences are not statable at the pins: their higher Quillen
K-group/spectrum carriers and comparison maps are missing. Hermitian finiteness
also lacks the required GW/L-spectrum carriers. The arithmetic finite CW
model in README §3.2 lacks the arithmetic bordification and quotient carriers.
The Solomon–Tits theorem solomonTits, the dualizing-module theorem
projectiveArithmeticDuality and the Steinberg-homology finiteness theorems
projectiveSteinbergHomology_fg and curveSteinbergHomology_fg of README §3.2
lack the Tits building of a vector space and its Steinberg module: Mathlib
has group homology but no building.
Borel's finite-stage invariant-form comparison in README §3.4 lacks relative
Lie algebra cohomology and invariant differential forms on symmetric spaces:
Mathlib has only low-degree Lie algebra cochains.
Numerical rank or degree-slot
formulas do not state those theorems. The stable stems of README §7.5 lack
the reduced suspension of a sphere and its homeomorphism with the next
sphere, the stable forms of the fourth-stem vanishing lack homotopy groups of
spectra, and the low Adams–Novikov E₂-term lacks the Brown–Peterson Hopf
algebroid BP_*BP and the Ext of its comodules; the unstable form below is
stated on the unit spheres of real normed spaces and Mathlib's cubical
homotopy groups.
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

/-! ## Layer 7: Bernoulli numbers, regular primes, stable stems and conditional tables -/

/-- If an odd prime does not divide the cyclotomic class number, it divides
no reduced numerator of B_(2k)/k for k >= 1; README §7.2. The class-number
hypothesis unfolds CyclotomicClassGroupsAndStickelberger §5.1's
IsRegularPrime predicate. -/
theorem regularPrime_dividedBernoulli_num (p : ℕ) (hp : p.Prime) (hodd : Odd p)
    (hreg : ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ))
    (k : ℕ) (hk : 1 ≤ k) :
    ¬ (p : ℤ) ∣ (bernoulli (2 * k) / (k : ℚ)).num := by
  sorry

/-- The fourth stable stem vanishes, in its unstable form: for `n ≥ 6`, the homotopy group of
the unit sphere of an `(n + 1)`-dimensional real normed space, with cube directions indexed by a
finite type of cardinality `n + 4`, is trivial at every basepoint; README §7.5,
stableStemFour_eq_zero. -/
theorem subsingleton_homotopyGroup_sphere_add_four {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] {n : ℕ} (hE : Module.finrank ℝ E = n + 1) (hn : 6 ≤ n)
    {N : Type*} [Finite N] (hN : Nat.card N = n + 4) (x : Metric.sphere (0 : E) 1) :
    Subsingleton (HomotopyGroup N (Metric.sphere (0 : E) 1) x) := by
  sorry

end TauCetiRoadmap.ArithmeticKTheory

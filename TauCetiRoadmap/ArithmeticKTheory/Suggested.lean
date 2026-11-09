module

public import Mathlib

@[expose] public section

/-!
# ArithmeticKTheory: target signatures

README.md is the roadmap; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: denominator
localization for arbitrary sets of Dedekind primes, the Solomon–Tits theorem
in its homological form, and the divided-Bernoulli consequence of cyclotomic
class-number regularity.
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
The dualizing-module theorem projectiveArithmeticDuality and the
Steinberg-homology finiteness theorems projectiveSteinbergHomology_fg and
curveSteinbergHomology_fg of README §3.2 need the Steinberg module
St(P ⊗ F) as a representation of Aut(P): the pins have the homology of
`titsBuilding` but no action of the linear automorphism group on it, so
St(P ⊗ F) has no carrier as a representation and Mathlib's group homology
cannot be applied to it.
Borel's finite-stage invariant-form comparison in README §3.4 lacks relative
Lie algebra cohomology and invariant differential forms on symmetric spaces:
Mathlib has only low-degree Lie algebra cochains.
Numerical rank or degree-slot
formulas do not state those theorems. The odd-primary fourth stem of
README §7.5, π₄(S) ⊗ ℤ[1/2] = 0 for the sphere spectrum, lacks stable
homotopy groups of spectra: Tau Ceti's `TauCeti.SymmetricSpectrum` and its
sphere `TauCeti.SymmetricSequence.sphere` have no homotopy groups at the pin. The low
Adams–Novikov E₂-term lacks the Brown–Peterson Hopf algebroid BP_*BP and
the Ext of its comodules.
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

/-! ## Layer 3: finite generation, ranks and hermitian consequences -/

section TitsBuilding

universe u v

/-- The Tits building of a vector space `V` over a field `K`: the nerve of the poset of
nonzero proper subspaces of `V`, whose realization is their flag complex; README §3.2. -/
def titsBuilding (K : Type u) (V : Type v) [Field K] [AddCommGroup V] [Module K V] :
    SSet.{v} :=
  CategoryTheory.nerve {W : Submodule K V // W ≠ ⊥ ∧ W ≠ ⊤}

/-- Solomon–Tits, homological form; README §3.2. If `V` has dimension `m ≥ 2`, the map from
`titsBuilding K V` to a point induces an isomorphism on integral homology in every degree
`k ≠ m − 2`. Equivalently, the reduced integral homology of the building is concentrated in
degree `m − 2`: the building is nonempty, connected when `m ≥ 3`, and has no homology in
positive degrees other than `m − 2` (Putman–Studenmund, §1, p. 3; Kahn, §4.3.1, p. 17,
citing Quillen, Theorem 2, p. 180). -/
theorem solomonTits (K : Type u) (V : Type v) [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (hm : 2 ≤ Module.finrank K V) (k : ℕ)
    (hk : k ≠ Module.finrank K V - 2) :
    CategoryTheory.IsIso
      (SSet.homologyMap (CategoryTheory.Limits.terminal.from (titsBuilding K V))
        (AddCommGrpCat.of (ULift.{v} ℤ)) k) := by
  sorry

end TitsBuilding

/-! ## Layer 7: Bernoulli numbers, regular primes and conditional tables -/

/-- If a prime does not divide the cyclotomic class number, it divides
no reduced numerator of B_(2k)/k for k >= 1; README §7.2. The class-number
hypothesis unfolds CyclotomicClassGroupsAndStickelberger §5.1's
IsRegularPrime predicate. At p = 2 the hypothesis always holds and the
conclusion is von Staudt–Clausen's v₂(B_(2k)) = −1. -/
theorem regularPrime_dividedBernoulli_num (p : ℕ) (hp : p.Prime)
    (hreg : ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ))
    (k : ℕ) (hk : 1 ≤ k) :
    ¬ (p : ℤ) ∣ (bernoulli (2 * k) / (k : ℚ)).num := by
  sorry

end TauCetiRoadmap.ArithmeticKTheory

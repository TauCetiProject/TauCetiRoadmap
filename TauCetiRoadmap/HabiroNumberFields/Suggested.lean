import Mathlib

/-!
# HabiroNumberFields: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: cyclic-dilogarithm quasi-periodicity,
the phase-free value at one, the cyclic hypergeometric difference equation, and
the Kashaev–Mangazeev–Stroganov identity at every positive invertible order.

The finite Chern unit theorem and its regulator comparison lack the algebraic
K-theory and Bloch-group carriers. The integral local Coleman lattice
isomorphism and finite root-class generation also lack the completed local K₃
and Bloch carriers. The arithmetic Habiro comparison lacks the
cyclotomic completion and arithmetic Taylor carriers. Local freeness, effective
global descent, tensor equivalences, the Picard character, scalar base change
and multiplicative transfer lack the completed local K-theory, Chern root-line
and indexed-module carriers. The complex proof-route limits lack the analytic
Pochhammer and bilateral-series carriers. These headlines are not statable here.
Finite products have natural exponents; finite sums use total field division,
with nonsingularity imposed in the identity statements.
-/

namespace TauCetiRoadmap.HabiroNumberFields

open Finset

/-! ## Layer 1: cyclic dilogarithms and finite regulators -/

section CyclicDilog

variable {R : Type*} [CommRing R]

/-- The integral cyclic dilogarithm, including its empty-product extension at order zero. -/
def cyclicDilog (n : ℕ) (ζ x : R) : R :=
  ∏ k ∈ range n, (1 - ζ ^ k * x) ^ k

end CyclicDilog

section FiniteIdentities

variable {K : Type*} [Field K]

/-- Quasi-periodicity in a form that remains meaningful when a factor vanishes. -/
theorem cyclicDilog_quasiPeriodicity (n s : ℕ) (ζ x : K)
    (hn : 0 < n) (hζ : IsPrimitiveRoot ζ n) (hs : s ≤ n) :
    (1 - x ^ n) ^ s * cyclicDilog n ζ (ζ ^ s * x) =
      cyclicDilog n ζ x * (∏ k ∈ range s, (1 - ζ ^ k * x)) ^ n := by
  sorry

/-- The phase-free value of the integral cyclic dilogarithm at one. -/
theorem cyclicDilog_one_pow_twentyFour (n : ℕ) (ζ : K)
    (hn : 0 < n) (hζ : IsPrimitiveRoot ζ n) (hnK : (n : K) ≠ 0) :
    cyclicDilog n ζ 1 ^ 24 = (n : K) ^ (12 * n) := by
  sorry

/-- The total finite cyclic hypergeometric sum; identities below exclude its singular inputs. -/
def cyclicHypergeom (n : ℕ) (ζ x y z : K) : K :=
  ∑ k ∈ range n,
    ((∏ j ∈ range k, (1 - ζ ^ (j + 1) * y)) /
      (∏ j ∈ range k, (1 - ζ ^ (j + 1) * x))) * z ^ k

/-- The finite difference equation on the nonsingular cyclic hypersurface. -/
theorem cyclicHypergeom_shift (n : ℕ) (ζ x y z : K)
    (hn : 0 < n) (hζ : IsPrimitiveRoot ζ n)
    (hx : x ^ n ≠ 1) (hy : y ^ n ≠ 1)
    (hrel : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
    (1 - z) * cyclicHypergeom n ζ x y z =
      (x - ζ * y * z) * cyclicHypergeom n ζ x y (ζ * z) := by
  sorry

/-- The Kashaev–Mangazeev–Stroganov identity at every positive invertible order with every denominator cleared. -/
theorem kms (n : ℕ) (ζ x y z : K)
    (hn : 0 < n) (hnK : (n : K) ≠ 0)
    (hζ : IsPrimitiveRoot ζ n) (hx : x ≠ 0) (hy : y ≠ 0) (hz : z ≠ 0)
    (hX : x ^ n ≠ 1) (hY : y ^ n ≠ 1) (hXY : x ^ n ≠ y ^ n)
    (hrel : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
    cyclicHypergeom n ζ x y z ^ n *
        cyclicDilog n ζ x⁻¹ * cyclicDilog n ζ (ζ * y) * cyclicDilog n ζ (ζ / z) =
      (ζ * y) ^ (n * (n - 1) / 2) * cyclicDilog n ζ 1 *
        cyclicDilog n ζ (ζ * y / x) * cyclicDilog n ζ (x / (y * z)) := by
  sorry

end FiniteIdentities

end TauCetiRoadmap.HabiroNumberFields

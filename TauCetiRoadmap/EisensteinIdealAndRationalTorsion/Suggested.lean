import Mathlib

/-!
# EisensteinIdealAndRationalTorsion: representative target signatures

The roadmap is the accompanying README. This file records definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. It fixes the positive cuspidal index,
uses nonsingular points on elliptic Weierstrass curves for rational torsion, and uses the native
additive order, whose value zero means infinite order. The integral modular and Néron objects
and their comparisons are targets of the README. The order-thirteen and all-prime conclusions
retain explicit modular-curve and class-number hypotheses there.
-/

namespace TauCetiRoadmap.EisensteinIdealAndRationalTorsion

/-! ## Layer 0: Integral Eisenstein arithmetic -/

/-- At prime level `P`, the numerator of `(P - 1) / 12` in lowest terms. -/
def cuspidalIndex (P : ℕ) : ℕ :=
  (P - 1) / Nat.gcd (P - 1) 12

/-- The cuspidal index is positive at every prime level, including the genus-zero levels. -/
theorem cuspidalIndex_pos (P : ℕ) (hP : P.Prime) : 0 < cuspidalIndex P := by
  sorry

/-- The integer formula agrees with the positive numerator of the rational fraction. -/
theorem cuspidalIndex_num (P : ℕ) (hP : P.Prime) :
    cuspidalIndex P = (((P : ℚ) - 1) / 12).num.natAbs := by
  sorry

/-- Gcd reduction gives the exact factorization, without discarding the dyadic part. -/
theorem cuspidalIndex_dvd (P : ℕ) (hP : P.Prime) :
    cuspidalIndex P ∣ P - 1 ∧ P - 1 = cuspidalIndex P * Nat.gcd (P - 1) 12 := by
  sorry

/-- Exactly the five genus-zero prime levels have index one. -/
theorem cuspidalIndex_eq_one (P : ℕ) (hP : P.Prime) :
    cuspidalIndex P = 1 ↔ P = 2 ∨ P = 3 ∨ P = 5 ∨ P = 7 ∨ P = 13 := by
  sorry

example : cuspidalIndex 11 = 5 := by
  norm_num [cuspidalIndex, Nat.gcd]

example : cuspidalIndex 17 = 4 := by
  norm_num [cuspidalIndex, Nat.gcd]

/-! ## Layer 7: Cusp moduli and prime-torsion descent -/

/-- The positive-genus descent excludes a rational point of prime order outside the five
genus-zero levels. This includes order eleven. Mazur 1977, III §5, pp. 157–160. -/
theorem isogeny_iteration (P : ℕ) (hP : P.Prime)
    (hLevel : P ≠ 2 ∧ P ≠ 3 ∧ P ≠ 5 ∧ P ≠ 7 ∧ P ≠ 13)
    (W : WeierstrassCurve ℚ) [W.IsElliptic] (Q : W.toAffine.Point) :
    addOrderOf Q ≠ P := by
  sorry

/-! ## Layer 8: Level thirteen and all prime orders -/

/-- Each of the four allowed prime orders occurs on an elliptic curve over the rationals. -/
theorem occurring_small_primes (P : ℕ) (hP : P = 2 ∨ P = 3 ∨ P = 5 ∨ P = 7) :
    ∃ W : WeierstrassCurve ℚ, W.IsElliptic ∧ ∃ Q : W.toAffine.Point, addOrderOf Q = P := by
  sorry

/- The README specifies the full order H_P and ideals I_full/I; cuspidal and Shimura
subgroups C/Σ and their component retraction; ideal kernels, local Hecke completions and
ideal-supported abelian quotients; good auxiliary primes and η_l; winding element and maps,
quadratic modular unit, exceptional dyadic D and its embeddings; admissible integral kernels,
Néron cohomology and Sha comparisons; boundary level structures and formal immersion; and the
level-thirteen model and cusp hypotheses (§8.1), diamond-integer action, finite-flat π-kernel,
class-number hypothesis (§8.5), and conditional isogeny descent. The conditional theorems
order_thirteen_exclusion (§8.6), all_prime_torsion (§8.8), and the elliptic part of
residual_consumer_interface (§8.9) require those modular-curve carriers.
Their geometric carriers and comparisons are supplied by the README's named roadmap targets. -/

end TauCetiRoadmap.EisensteinIdealAndRationalTorsion

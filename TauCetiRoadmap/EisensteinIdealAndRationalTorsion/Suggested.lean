import Mathlib

/-!
# Eisenstein ideal and rational torsion: headline theorem signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`.

The statements below express the positive-genus prime-torsion exclusion (§7.8) and the
occurrence of the four permitted prime orders (§8.7). They use Mathlib's nonsingular
Weierstrass point group, its ellipticity hypothesis and its native additive order.

The pinned libraries have no algebraic modular curves or modular Jacobians with their
cusps and Hecke actions. Thus the integral Eisenstein index, cuspidal and Shimura subgroup
theorems, odd and dyadic multiplicity one, winding principality, Ogg's rational torsion
theorem, and the Eisenstein quotient's rational points and Tate–Shafarevich consequences
have no signatures here. The formal-immersion and squarefree cusp theorems of §7.9 also
need the integral modular curves, their relative smooth loci and Néron models.

The level-thirteen descent (§§8.2–8.6), all-prime classification (§8.8), and elliptic
invariant-vector consequence (§8.9) retain §8.1's explicit modular-curve, moduli-map and
cusp data and §8.5's cyclotomic class-number hypothesis. Although the class number is
statable in Mathlib, the geometric data require the missing `X₁(13)` and `J₁(13)`
constructions. These conditional results therefore have no signatures here either.
-/

namespace TauCetiRoadmap.EisensteinIdealAndRationalTorsion

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

end TauCetiRoadmap.EisensteinIdealAndRationalTorsion

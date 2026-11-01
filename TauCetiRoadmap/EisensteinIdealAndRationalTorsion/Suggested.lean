import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois

/-!
# Eisenstein ideal and rational torsion: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs: positive-genus prime-torsion exclusion,
the cyclotomic class number at 13, order-thirteen exclusion, occurrence and classification
of rational prime torsion, and the elliptic Galois-fixed torsion consequence.

The following headlines are not statable at the pins. Integral Hecke duality and the exact
Eisenstein index need the integral modular Hecke and differential constructions. Exact
cuspidal order, the Shimura subgroup and their integral intersection, the residual-constituent
criterion, odd and dyadic multiplicity one, Ogg's rational torsion theorem and quotient torsion
need modular Jacobians with their marked subgroups and Hecke actions. Integral homology
freeness and winding principality need modular homology and its Hecke/period comparisons.
Eisenstein quotient rank zero, its rational points and odd Tate–Shafarevich vanishing need
the constructed quotient and its arithmetic cohomology. Positive-genus X₀(P)(ℚ) finiteness
needs the algebraic modular curve. Formal immersion needs integral modular curves, relative
smooth loci and Néron quotient maps; general geometric Manin–Drinfeld torsion needs the
congruence modular curve, cusps and Jacobian. The level-thirteen model, norm-19 descent,
J₁(13) rank zero and cusp-only rational points need X₁(13), its Jacobian and diamond action.
These missing proof constructions do not prevent stating the elliptic conclusions below.
-/

namespace TauCetiRoadmap.EisensteinIdealAndRationalTorsion

open scoped WeierstrassCurve Classical

/-! ## Layer 7: Cusp moduli and prime-torsion descent -/

/-- The positive-genus descent excludes a rational point of prime order outside the five
genus-zero levels. This includes order eleven. Mazur 1977, III §5, pp. 157–160. -/
theorem isogeny_iteration (P : ℕ) (hP : P.Prime)
    (hLevel : P ≠ 2 ∧ P ≠ 3 ∧ P ≠ 5 ∧ P ≠ 7 ∧ P ≠ 13)
    (W : WeierstrassCurve ℚ) [W.IsElliptic] (Q : W.toAffine.Point) :
    addOrderOf Q ≠ P := by
  sorry

/-! ## Layer 8: Level thirteen and all prime orders -/

/-- The thirteenth cyclotomic field has class number one; in particular its
19-primary ideal class group vanishes. Mazur–Tate 1973, §4, p. 48. -/
theorem cyclotomic_thirteen_class_number :
    NumberField.classNumber (CyclotomicField 13 ℚ) = 1 := by
  sorry

/-- No elliptic curve over the rationals has a rational point of exact order thirteen.
Mazur–Tate 1973, §4, pp. 45–48. -/
theorem order_thirteen_exclusion (W : WeierstrassCurve ℚ) [W.IsElliptic]
    (Q : W.toAffine.Point) : addOrderOf Q ≠ 13 := by
  sorry

/-- Each of the four allowed prime orders occurs on an elliptic curve over the rationals. -/
theorem occurring_small_primes (P : ℕ) (hP : P = 2 ∨ P = 3 ∨ P = 5 ∨ P = 7) :
    ∃ W : WeierstrassCurve ℚ, W.IsElliptic ∧ ∃ Q : W.toAffine.Point, addOrderOf Q = P := by
  sorry

/-- Every prime order of a rational point on an elliptic curve is 2, 3, 5 or 7.
Mazur 1977, III §5, and Mazur–Tate 1973, §4. -/
theorem all_prime_torsion (P : ℕ) (hP : P.Prime)
    (W : WeierstrassCurve ℚ) [W.IsElliptic] (Q : W.toAffine.Point)
    (hOrder : addOrderOf Q = P) : P = 2 ∨ P = 3 ∨ P = 5 ∨ P = 7 := by
  sorry

/-- At every prime greater than seven, geometric prime torsion on an elliptic curve
has no nonzero vector fixed by every rational Galois automorphism. -/
theorem elliptic_fixed_torsion_zero (P : ℕ) (hP : P.Prime) (hLarge : 7 < P)
    (W : WeierstrassCurve ℚ) [W.IsElliptic]
    (Q : AddSubgroup.torsionBy ((W⁄(AlgebraicClosure ℚ)).toAffine.Point) (P : ℤ))
    (hFixed : ∀ σ : AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ,
      Multiplicative.toAdd (W.torsionGaloisAction (P : ℤ) σ) Q = Q) : Q = 0 := by
  sorry

end TauCetiRoadmap.EisensteinIdealAndRationalTorsion

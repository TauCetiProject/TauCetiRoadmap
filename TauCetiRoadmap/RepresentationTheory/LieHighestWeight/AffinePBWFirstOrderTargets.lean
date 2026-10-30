import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Data.Rat.Cast.Defs

/-!
# The affine Lie algebra: first-order PBW products

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
These native polynomial expressions illustrate the ordered/symmetric splitting
comparison. The Rees algebra, finite multiplication and PBW maps remain the
roadmap's construction targets; the admission below states their scalar identity.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeight.AffinePBW

open MvPolynomial

variable {R : Type*} [CommRing R]

/-- Ordered first-order product for [x,y]=y, in PBW order Y then X. -/
noncomputable def orderedFirstOrder (p q : MvPolynomial (Fin 2) R) : MvPolynomial (Fin 2) R :=
  pderiv 0 p * X 1 * pderiv 1 q

theorem generator_coefficients :
    orderedFirstOrder (X 0 : MvPolynomial (Fin 2) R) (X 1) = X 1 ∧
    orderedFirstOrder (X 1 : MvPolynomial (Fin 2) R) (X 0) = 0 := by
  simp [orderedFirstOrder, pderiv_X]

/-- First-order difference between symmetric and ordered PBW comparisons. -/
noncomputable def splittingCorrection (p : MvPolynomial (Fin 2) ℚ) : MvPolynomial (Fin 2) ℚ :=
  C (1 / 2 : ℚ) * X 1 * pderiv 0 (pderiv 1 p)

theorem symmetric_firstOrder (p q : MvPolynomial (Fin 2) ℚ) :
    orderedFirstOrder p q + splittingCorrection p * q + p * splittingCorrection q -
      splittingCorrection (p * q) =
    C (1 / 2 : ℚ) * X 1 * (pderiv 0 p * pderiv 1 q - pderiv 1 p * pderiv 0 q) := sorry

end TauCetiRoadmap.RepresentationTheory.LieHighestWeight.AffinePBW

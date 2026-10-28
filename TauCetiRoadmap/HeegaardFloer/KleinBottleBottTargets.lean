import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.QuotientGroup.Defs

/-!
# Klein-bottle Morse–Bott finite-complex calibration

This file is not the roadmap and is not exhaustive. `README.md`, M.7, is
definitive. The quotient below calibrates its finite chain complex; it does
not construct the smooth mapping torus, orientation line or geometric chain maps.
-/

namespace TauCetiRoadmap.HeegaardFloer.KleinBottleBott

/-- The sign-circle boundary is −2; its rank-one Bott shift changes it to +2.
The first coordinate is the minimum-circle edge, the second the maximum vertex. -/
def topBoundary : ℤ →+ ℤ × ℤ where
  toFun n := (0, 2 * n)
  map_zero' := by simp
  map_add' a b := by simp [mul_add]

/-- An explicit coordinate comparison for H₁ of the proposed finite complex. -/
theorem firstHomology_coordinates :
    ∃ e : ((ℤ × ℤ) ⧸ topBoundary.range) ≃+ (ℤ × ZMod 2),
      ∀ z : ℤ × ℤ,
        e (QuotientAddGroup.mk z) = (z.1, (z.2 : ZMod 2)) := by
  sorry

end TauCetiRoadmap.HeegaardFloer.KleinBottleBott

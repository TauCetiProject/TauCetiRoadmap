import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Group.Prod

/-!
# Abelian-cover homology coordinate calibration

This file is not the roadmap and is not exhaustive. `README.md`, N2, is
definitive. These integer maps calibrate the proposed geometric covering map;
they do not construct the cover, fundamental group or homology identifications.
-/

namespace TauCetiRoadmap.MorseNovikov.AbelianCoverHomology

/-- The generator of the length-two fiber projects to twice the fiber loop. -/
def doubling : ℤ →+ ℤ where
  toFun n := 2 * n
  map_zero' := by simp
  map_add' a b := by simp [mul_add]

/-- The section coordinate is zero and twice a fiber class vanishes modulo two. -/
def fiberMap : ℤ →+ ℤ × ZMod 2 :=
  (0 : ℤ →+ ℤ).prod ((Int.castAddHom (ZMod 2)).comp doubling)

theorem doubling_injective : Function.Injective doubling := by
  intro a b h
  change 2 * a = 2 * b at h
  exact mul_left_cancel₀ (by decide : (2 : ℤ) ≠ 0) h

theorem fiberMap_eq_zero : fiberMap = 0 := by
  apply AddMonoidHom.ext
  intro n
  apply Prod.ext
  · rfl
  · change ((2 * n : ℤ) : ZMod 2) = 0
    simp only [Int.cast_mul]
    rw [show ((2 : ℤ) : ZMod 2) = 0 by decide, zero_mul]

theorem fiberMap_not_injective : ¬ Function.Injective fiberMap := by
  intro h
  have heq : fiberMap 0 = fiberMap 1 := by rw [fiberMap_eq_zero]; rfl
  have hbad : (0 : ℤ) = 1 := h heq
  exact (by decide : (0 : ℤ) ≠ 1) hbad

end TauCetiRoadmap.MorseNovikov.AbelianCoverHomology

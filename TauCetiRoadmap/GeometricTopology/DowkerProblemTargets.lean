import TauCetiRoadmap.GeometricTopology.DowkerExerciseTargets
import TauCetiRoadmap.GeometricTopology.ReversedContinuedFractionTargets
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
The four admitted face-comparison/planarity/nonexistence statements are future
proof targets. The arrays use the native Gauss/PD carriers, and all displayed
projective evaluations below have proofs. No source word is silently repaired.
-/

namespace TauCetiRoadmap.GeometricTopology.DowkerProblem
open TauCeti
open TauCetiRoadmap.GeometricTopology.ReversedContinuedFraction
open TauCetiRoadmap.GeometricTopology.DowkerExercise

def problem42Partner : Equiv.Perm (Fin 14) where
  toFun := ![9, 4, 11, 10, 1, 8, 13, 12, 5, 0, 3, 2, 7, 6]
  invFun := ![9, 4, 11, 10, 1, 8, 13, 12, 5, 0, 3, 2, 7, 6]
  left_inv := by decide +kernel
  right_inv := by decide +kernel

def problem42 : BasedOrientedGaussCode 7 where
  visit := ![0, 2, 1, 5, 2, 4, 3, 6, 4, 0, 5, 1, 6, 3]
  «over» := ![false, true, false, true, false, true, false, true, false, true, false, true, false,
    true]
  sign := ![1, -1, 1, -1, 1, -1, -1]
  partner := PerfectMatching.mk problem42Partner (by decide +kernel) (by decide +kernel)
  visit_eq_iff := by decide +kernel
  over_partner := by decide +kernel

def problem44Partner : Equiv.Perm (Fin 16) where
  toFun := ![13, 6, 11, 14, 15, 8, 1, 10, 5, 12, 7, 2, 9, 0, 3, 4]
  invFun := ![13, 6, 11, 14, 15, 8, 1, 10, 5, 12, 7, 2, 9, 0, 3, 4]
  left_inv := by decide +kernel
  right_inv := by decide +kernel

def problem44 : BasedOrientedGaussCode 8 where
  visit := ![0, 3, 1, 7, 2, 4, 3, 5, 4, 6, 5, 1, 6, 0, 7, 2]
  «over» := ![false, true, false, false, true, true, false, true, false, true, false, true, false,
    true, true, false]
  sign := ![1, 1, -1, 1, -1, -1, -1, -1]
  partner := PerfectMatching.mk problem44Partner (by decide +kernel) (by decide +kernel)
  visit_eq_iff := by decide +kernel
  over_partner := by decide +kernel

theorem problem42_facePerm :
    ∀ h, problem42.toOrientedPDCode.toPDCode.facePerm h =
      (![20, 17, 7, 10, 21, 24, 22, 19, 4, 1, 15, 18, 25, 0, 26, 23, 12, 9, 27, 2, 5, 8, 6, 3,
    13, 16, 14, 11] : Fin 28 → Fin 28) h := by
  sorry

theorem problem42_planar_signs :
    planarSignSet problem42 = {problem42.sign, fun c => -problem42.sign c} := by
  sorry

theorem problem42_planar :
    problem42.toOrientedPDCode.toPDCode.faceCount = 9 ∧
      problem42.toOrientedPDCode.toPDCode.IsPlanar := by
  sorry

theorem problem44_no_planar_completion : planarSignSet problem44 = ∅ := by
  sorry

theorem problem46_values :
    value [2,-1,2,-3,2] = ((2 : ℚ) : WithTop ℚ) ∧
    value [3,3,-2,1,3,-2] = ((-69/38 : ℚ) : WithTop ℚ) ∧
    value [-2,-2,1,3,2] = ((31/14 : ℚ) : WithTop ℚ) := by
  decide +kernel

theorem problem46_canonical :
    value [2,-1,2,-3,2] = value [2] ∧
    value [3,3,-2,1,3,-2] = value [-3,-2,-4,-1,-1] ∧
    value [-2,-2,1,3,2] = value [2,1,4,2] := by
  decide +kernel

theorem problem46_zero_infinity :
    value [2,-1,2] = (0 : WithTop ℚ) ∧ value [2,-1,2,-3] = ⊤ := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.DowkerProblem

import TauCeti.KnotTheory.GaussCode.PDCode.Basic
import TauCeti.KnotTheory.PDCode.Planar
import Mathlib

/-!
# The source158 Dowker exercise

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The code has actual native visit, matching, over/under and sign fields. The
geometric realization and reference-knot comparison remain README requirements.
-/

namespace TauCetiRoadmap.GeometricTopology.DowkerExercise

open TauCeti

def partnerPerm : Equiv.Perm (Fin 14) where
  toFun := ![7,6,9,12,11,10,1,0,13,2,5,4,3,8]
  invFun := ![7,6,9,12,11,10,1,0,13,2,5,4,3,8]
  left_inv := by decide +kernel
  right_inv := by decide +kernel

def matching : PerfectMatching (Fin 14) :=
  PerfectMatching.mk partnerPerm (by decide +kernel) (by decide +kernel)

def code : BasedOrientedGaussCode 7 where
  visit := ![0,3,1,6,2,5,3,0,4,1,5,2,6,4]
  «over» := fun i => decide (i.val % 2 = 1)
  sign := fun _ => 1
  partner := matching
  visit_eq_iff := by decide +kernel
  over_partner := by decide +kernel

/-- Nine faces certify the sphere shadow; geometric realization is separate. -/
theorem planar_completion :
    code.toOrientedPDCode.toPDCode.faceCount = 9 ∧
      code.toOrientedPDCode.toPDCode.IsPlanar := by
  sorry

/-- Arc labels in the standard reference, converted to zero-based Fin14. -/
def referenceRows : Fin 7 → Fin 4 → Fin 14 :=
  ![![5,1,6,0], ![11,5,12,4], ![13,7,0,6], ![7,13,8,12],
    ![1,11,2,10], ![9,3,10,2], ![3,9,4,8]]

def exerciseRows : Fin 7 → Fin 4 → Fin 14 :=
  ![![0,8,1,7], ![2,10,3,9], ![4,12,5,11], ![6,2,7,1],
    ![8,0,9,13], ![10,6,11,5], ![12,4,13,3]]

def referenceCrossing : Fin 7 → Fin 7 := ![5,1,2,4,6,0,3]

/-- Cyclic arc-label rotation and the explicit crossing permutation match all slots. -/
theorem reference_relabel : ∀ c s,
    exerciseRows c s = referenceRows (referenceCrossing c) s + 5 := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.DowkerExercise

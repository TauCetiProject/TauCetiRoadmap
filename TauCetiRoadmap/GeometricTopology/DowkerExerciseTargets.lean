import TauCeti.KnotTheory.GaussCode.PDCode.Basic
import TauCeti.KnotTheory.PDCode.Planar
import Mathlib

/-!
# Signed Dowker source examples and planar encounter parity

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The code has actual native visit, matching, over/under and sign fields. The
geometric realization and reference-knot comparison remain README requirements.
-/

namespace TauCetiRoadmap.GeometricTopology.DowkerExercise

set_option linter.style.longLine false

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

/-- A necessary planar encounter condition; no such claim holds for arbitrary Gauss codes. -/
theorem planar_partner_parity {n : ℕ} (D : BasedOrientedGaussCode n)
    (h : D.toOrientedPDCode.toPDCode.IsPlanar) (i : Fin (2 * n)) :
    (D.partner.val i).val % 2 ≠ i.val % 2 := by
  sorry

/-- All rotation completions on the fixed visits and over/under data. -/
def planarSignSet {n : ℕ} (D : BasedOrientedGaussCode n) : Set (Fin n → ℤˣ) :=
  {s | ({ D with sign := s } : BasedOrientedGaussCode n).toOrientedPDCode.toPDCode.IsPlanar}


def code157Partner : Equiv.Perm (Fin 18) where
  toFun := ![13,6,11,16,9,14,1,12,17,4,15,2,7,0,5,10,3,8]
  invFun := ![13,6,11,16,9,14,1,12,17,4,15,2,7,0,5,10,3,8]
  left_inv := by decide +kernel
  right_inv := by decide +kernel

def code157 : BasedOrientedGaussCode 9 where
  visit := ![0,3,1,8,2,7,3,6,4,2,5,1,6,0,7,5,8,4]
  «over» := ![false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true]
  sign := ![1,-1,1,1,-1,1,1,-1,1]
  partner := PerfectMatching.mk code157Partner (by decide +kernel) (by decide +kernel)
  visit_eq_iff := by decide +kernel
  over_partner := by decide +kernel


def code158EightPartner : Equiv.Perm (Fin 16) where
  toFun := ![9,12,11,10,7,14,13,4,15,0,3,2,1,6,5,8]
  invFun := ![9,12,11,10,7,14,13,4,15,0,3,2,1,6,5,8]
  left_inv := by decide +kernel
  right_inv := by decide +kernel

def code158Eight : BasedOrientedGaussCode 8 where
  visit := ![0,6,1,5,2,7,3,2,4,0,5,1,6,3,7,4]
  «over» := ![false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true]
  sign := ![1,1,1,-1,1,1,1,-1]
  partner := PerfectMatching.mk code158EightPartner (by decide +kernel) (by decide +kernel)
  visit_eq_iff := by decide +kernel
  over_partner := by decide +kernel


def code159Partner : Equiv.Perm (Fin 16) where
  toFun := ![5,8,13,10,15,0,11,12,1,14,3,6,7,2,9,4]
  invFun := ![5,8,13,10,15,0,11,12,1,14,3,6,7,2,9,4]
  left_inv := by decide +kernel
  right_inv := by decide +kernel

def code159 : BasedOrientedGaussCode 8 where
  visit := ![0,4,1,5,2,0,3,6,4,7,5,3,6,1,7,2]
  «over» := ![false,true,true,true,false,true,true,false,false,true,false,false,true,false,false,true]
  sign := ![1,1,1,1,1,-1,1,1]
  partner := PerfectMatching.mk code159Partner (by decide +kernel) (by decide +kernel)
  visit_eq_iff := by decide +kernel
  over_partner := by decide +kernel


/-- The complete planar sign sets, rather than one unverified completion per word. -/
theorem source_planarSignSets :
    planarSignSet code157 = {code157.sign, fun c => -code157.sign c} ∧
    planarSignSet code158Eight = {code158Eight.sign, fun c => -code158Eight.sign c} ∧
    planarSignSet code = {code.sign, fun c => -code.sign c} ∧
    planarSignSet code159 = {code159.sign, fun c => -code159.sign c} := by
  sorry

/-- The remaining source rows have respectively n+2 faces. -/
theorem source_faceCounts :
    code157.toOrientedPDCode.toPDCode.faceCount = 11 ∧
    code158Eight.toOrientedPDCode.toPDCode.faceCount = 10 ∧
    code159.toOrientedPDCode.toPDCode.faceCount = 10 := by
  sorry

def parityOnlyPartner : Equiv.Perm (Fin 10) where
  toFun := ![3,6,9,0,7,8,1,4,5,2]
  invFun := ![3,6,9,0,7,8,1,4,5,2]
  left_inv := by decide +kernel
  right_inv := by decide +kernel

/-- Signed-even partner word (4,10,8,2,6); every crossing has opposite encounter parities. -/
def parityOnlyCode : BasedOrientedGaussCode 5 where
  visit := ![0,3,1,0,2,4,3,2,4,1]
  «over» := fun i => decide (i.val % 2 = 1)
  sign := fun _ => 1
  partner := PerfectMatching.mk parityOnlyPartner (by decide +kernel) (by decide +kernel)
  visit_eq_iff := by decide +kernel
  over_partner := by decide +kernel

theorem parityOnlyCode_partner_parity (i : Fin 10) :
    (parityOnlyCode.partner.val i).val % 2 ≠ i.val % 2 := by
  revert i
  decide +kernel

/-- Even the necessary odd/even encounter condition does not give a planar completion. -/
theorem parityOnlyCode_no_completion : planarSignSet parityOnlyCode = ∅ := by
  sorry

end TauCetiRoadmap.GeometricTopology.DowkerExercise

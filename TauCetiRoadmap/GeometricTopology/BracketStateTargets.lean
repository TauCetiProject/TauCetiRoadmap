import TauCeti.KnotTheory.PDCode.Trefoil
import TauCeti.KnotTheory.BraidWord.PDCode
import Mathlib.Tactic

/-!
# Bracket state histograms: suggested native targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These are native canonical models and exact finite-state targets. Identifying
these codes with the printed diagrams is a separate geometric/source comparison
required by the README; these statements do not authenticate the pictures.
The three theorem admissions are intentional specification targets.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.BracketStates

open TauCeti

/-- Number of `B` choices (`false`) in the actual native state. -/
def bCount {n : ℕ} (s : Fin n → Bool) : ℕ :=
  (Finset.univ.filter fun i ↦ s i = false).card

/-- The joint distribution of the number of `B` choices and actual state circles.
Crossing-free circles are included by native `PDCode.stateLoopCount`.
-/
def stateHistogram {n : ℕ} (D : PDCode n) (b l : ℕ) : ℕ :=
  (Finset.univ.filter fun s : Fin n → Bool ↦
    bCount s = b ∧ D.stateLoopCount s = l).card

/-- Mirroring the standard native right-handed trefoil. -/
def leftTrefoil : OrientedPDCode 3 := rightHandedTrefoilPDCode.mirror

/-- The explicit four-letter canonical braid, without a picture identification. -/
def figureEightWord : BraidWord 3 := [(0, 1), (1, -1), (0, 1), (1, -1)]

def figureEight : OrientedPDCode 4 := figureEightWord.closure

/-- All eight native states, grouped by number of `B` choices and circles. -/
theorem leftTrefoil_histogram (b l : ℕ) :
    stateHistogram leftTrefoil.toPDCode b l =
      match b, l with
      | 0, 3 => 1
      | 1, 2 => 3
      | 2, 1 => 3
      | 3, 2 => 1
      | _, _ => 0 := by
  sorry

/-- The raw bracket; the writhe correction is not part of this polynomial. -/
theorem leftTrefoil_bracket {R : Type*} [CommRing R] (a : Rˣ) :
    leftTrefoil.toPDCode.kauffmanBracket a =
      (a : R) ^ 7 - (a : R) ^ 3 - ((a⁻¹ : Rˣ) : R) ^ 5 := by
  simp only [leftTrefoil, OrientedPDCode.mirror_toPDCode,
    PDCode.kauffmanBracket_mirror, kauffmanBracket_rightHandedTrefoilPDCode,
    inv_inv]
  ring

/-- All sixteen native figure-eight states, including the extra three-loop
state in the middle `B`-degree. -/
theorem figureEight_histogram (b l : ℕ) :
    stateHistogram figureEight.toPDCode b l =
      match b, l with
      | 0, 3 => 1
      | 1, 2 => 4
      | 2, 1 => 5
      | 2, 3 => 1
      | 3, 2 => 4
      | 4, 3 => 1
      | _, _ => 0 := by
  sorry

/-- The raw figure-eight bracket in the same native unit convention. -/
theorem figureEight_bracket {R : Type*} [CommRing R] (a : Rˣ) :
    figureEight.toPDCode.kauffmanBracket a =
      (a : R) ^ 8 - (a : R) ^ 4 + 1 -
        ((a⁻¹ : Rˣ) : R) ^ 4 + ((a⁻¹ : Rˣ) : R) ^ 8 := by
  sorry

end TauCetiRoadmap.GeometricTopology.BracketStates

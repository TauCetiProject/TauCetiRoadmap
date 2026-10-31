import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic

/-!
Suggested forms are aids, not the specification; the README is definitive.
This is the recorded page22 cofactor with one independent uncertain entry.
It does not identify a knot diagram or supply its geometric presentation.
-/
noncomputable section
open scoped BigOperators
namespace TauCetiRoadmap.GeometricTopology.MarkedAlexanderMinor

def printedCofactor {R : Type*} [CommRing R] (t : R) : R :=
  t^2 - 5*t^3 + 10*t^4 - 13*t^5 + 10*t^6 - 5*t^7 + t^8

def partialMinor {R : Type*} [CommRing R] (t z : R) : Matrix (Fin 8) (Fin 8) R :=
  !![0, 0, 0, -1, t, 0, 0, 0;
     -1, 1-t, 0, 0, 0, 0, 0, 0;
     1-t, 0, t, -1, 0, 0, 0, 0;
     t, -1, 0, 1-t, 0, 0, 0, 0;
     0, t, -1, 0, 0, 0, 1-t, 0;
     0, 0, 1-t, 0, 0, t, -1, 0;
     0, 0, 0, 0, 1-t, 0, -1, t;
     0, 0, 0, 0, -1, t, z, 1-t]

/-- Parameter dependence is explicit; no entry is chosen to fit the printed answer. -/
theorem cofactor_formula {R : Type*} [CommRing R] (t z : R) :
    (partialMinor t z).det = printedCofactor t + z * (-2*t^4 + 3*t^5 - 2*t^6) := by
  sorry

/-- The omitted ninth entry in this row is recorded as zero. -/
theorem eighth_row_sum {R : Type*} [CommRing R] (t z : R) :
    (∑ j : Fin 8, partialMinor t z 7 j) = z := by
  simp [partialMinor, Fin.sum_univ_succ]
  ring

/-- A genuine zero-sum row matching the recorded entries forces the parameter. -/
theorem forced_entry {R : Type*} [CommRing R] (t z : R)
    (hrow : (∑ j : Fin 8, partialMinor t z 7 j) = 0) : z = 0 := by
  simpa only [eighth_row_sum] using hrow

/-- Its determinant specialization retains the uncertainty until the row is checked. -/
theorem at_neg_one (z : ℤ) : (partialMinor (-1 : ℤ) z).det = 45 - 7*z := by
  rw [cofactor_formula]
  norm_num [printedCofactor]
  ring

end TauCetiRoadmap.GeometricTopology.MarkedAlexanderMinor

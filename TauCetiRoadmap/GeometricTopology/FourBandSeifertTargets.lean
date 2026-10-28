import TauCeti.KnotTheory.SeifertMatrix.SEquivalence
import Mathlib

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
The literal problem67 matrix does not itself certify the pictured marked surface.
The geometric positive-push-off and basis comparison remains a README target.
-/

namespace TauCetiRoadmap.GeometricTopology.FourBandSeifert

open LaurentPolynomial

def matrix : Matrix (Fin 4) (Fin 4) ℤ :=
  !![2,1,0,0; 0,-5,1,0; 0,1,2,-1; 0,0,-2,-2]

def integralMatrix : TauCeti.KnotTheory.IntegralSquareMatrix := ⟨4, matrix⟩

theorem matrix_det : matrix.det = 64 := by decide +kernel

theorem symmetric_det : (matrix + matrix.transpose).det = 1089 := by decide +kernel

/-- The literal form in the native normalized Laurent Alexander API. -/
theorem alexander_eq :
    TauCeti.KnotTheory.alexander integralMatrix.2 =
      64 * T 2 - 272 * T 1 + 417 - 272 * T (-1) + 64 * T (-2) := by
  sorry

end TauCetiRoadmap.GeometricTopology.FourBandSeifert

import Mathlib.Analysis.InnerProductSpace.Projection.FiniteDimensional
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Convex.Hull
import Mathlib.Data.Fin.VecNotation

/-!
Suggested native projector and polygon signatures, not an exhaustive checklist.
README.md is definitive; the admitted statements are future mathematical targets.
-/

set_option autoImplicit false
noncomputable section

namespace TauCetiRoadmap.SymplecticGeometry.ConvexityToric.BottSamelson

abbrev V3 := EuclideanSpace ℂ (Fin 3)

/-- The real diagonal entries of the actual orthogonal projector. -/
def projectorDiagonal (U : Submodule ℂ V3) : Fin 3 → ℝ :=
  fun i => ((U.starProjection (EuclideanSpace.single i (1 : ℂ))) i).re

def moment (a b c : ℝ) (L₁ P L : Submodule ℂ V3) : Fin 3 → ℝ :=
  a • projectorDiagonal L₁ + b • projectorDiagonal P + c • projectorDiagonal L

/-- Coordinate plane fixed in the word121 incidence problem. -/
def initialPlane : Submodule ℂ V3 :=
  Submodule.span ℂ {EuclideanSpace.single 0 (1 : ℂ), EuclideanSpace.single 1 (1 : ℂ)}

/-- In the order of the eight fixed flags in T3.1. -/
def fixedMoment (a b c : ℝ) : Fin 8 → Fin 3 → ℝ :=
  ![![a+b+c,b,0], ![a+b,b+c,0], ![a+b+c,0,b], ![a+b,0,b+c],
    ![b+c,a+b,0], ![b,a+b+c,0], ![0,a+b+c,b], ![0,a+b,b+c]]

/-- This range uses actual subspaces, ranks and incidence, without a second flag carrier. -/
theorem incidence_moment_range (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    {x : Fin 3 → ℝ | ∃ L₁ P L : Submodule ℂ V3,
      Module.finrank ℂ L₁ = 1 ∧ Module.finrank ℂ P = 2 ∧ Module.finrank ℂ L = 1 ∧
      L₁ ≤ initialPlane ∧ L₁ ≤ P ∧ L ≤ P ∧ moment a b c L₁ P L = x} =
      convexHull ℝ (Set.range (fixedMoment a b c)) := by
  sorry

/-- All six inequalities are in the affine trace plane of the effective torus. -/
theorem fixedMoment_convexHull (a b c : ℝ)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    convexHull ℝ (Set.range (fixedMoment a b c)) =
      {x : Fin 3 → ℝ | x 0 + x 1 + x 2 = a + 2*b + c ∧
        (∀ i, 0 ≤ x i) ∧ x 0 ≤ a+b+c ∧ x 1 ≤ a+b+c ∧ x 2 ≤ b+c} := by
  sorry

end TauCetiRoadmap.SymplecticGeometry.ConvexityToric.BottSamelson

import Mathlib.Geometry.Convex.ConvexSpace.Defs
import Mathlib.Basic.Real.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Barycentric Hopf field: suggested flag-coordinate targets

This file is not the roadmap and is not exhaustive. `README.md`, C2.3a, is definitive.
These are the coefficient identities for the field on an actual standard simplex.
The roadmap separately constructs the tangent-star index comparison, the global section
and its smoothing on the specified smooth triangulation.
-/

open scoped BigOperators

namespace TauCetiRoadmap.CharacteristicClasses.BarycentricHopfField

variable {ι : Type*} [Fintype ι]

/-- The piecewise-linear height with the dimension of each original simplex at its barycentre. -/
def flagHeight (d : ι → ℝ) (t : Convexity.StdSimplex ℝ ι) : ℝ :=
  ∑ i, t.weights i * d i

/-- Coefficients of the tangent field on one barycentric flag simplex. -/
def flagVelocity (d : ι → ℝ) (t : Convexity.StdSimplex ℝ ι) (i : ι) : ℝ :=
  t.weights i * (d i - flagHeight d t)

/-- The velocity lies in the affine simplex's tangent hyperplane. -/
theorem sum_flagVelocity (d : ι → ℝ) (t : Convexity.StdSimplex ℝ ι) :
    ∑ i, flagVelocity d t i = 0 := by
  sorry

/-- Restriction to a face retains that face; the same formula therefore glues along flags. -/
theorem flagVelocity_eq_zero_of_coordinate_eq_zero (d : ι → ℝ)
    (t : Convexity.StdSimplex ℝ ι) (i : ι) (hi : t.weights i = 0) :
    flagVelocity d t i = 0 := by
  simp [flagVelocity, hi]

/-- The derivative of flag height along the velocity is its weighted variance. -/
theorem flagHeight_variance (d : ι → ℝ) (t : Convexity.StdSimplex ℝ ι) :
    ∑ i, d i * flagVelocity d t i =
      ∑ i, t.weights i * (d i - flagHeight d t) ^ 2 := by
  sorry

/-- Dimensions strictly increase in a flag, so its only zeroes are its vertices. -/
theorem flagVelocity_eq_zero_iff (d : ι → ℝ) (hd : Function.Injective d)
    (t : Convexity.StdSimplex ℝ ι) :
    flagVelocity d t = 0 ↔ ∃ i, t = Convexity.StdSimplex.single i := by
  sorry

end TauCetiRoadmap.CharacteristicClasses.BarycentricHopfField

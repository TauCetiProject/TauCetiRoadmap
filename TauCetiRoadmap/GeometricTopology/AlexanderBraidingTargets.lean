import Mathlib.Analysis.InnerProductSpace.TwoDim
import Mathlib.Analysis.Convex.Hull
import Mathlib.Tactic

/-!
# Local Alexander triangle: suggested native forms

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These are planar affine certificates, not an ambient isotopy or an algorithm
for constructing geometric braids. Those constructions consume the existing
geometric owners as specified in the README. The interior statement below is
one intentional target admission.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.AlexanderTriangle

attribute [local instance] Complex.finrank_real_complex_fact

/-- Replacing the edge by the other two sides reverses both angular signs. -/
theorem opposite_vertex_areas (a b : ℂ) :
    Complex.orientation.areaForm a (-a - b) = -Complex.orientation.areaForm a b ∧
      Complex.orientation.areaForm (-a - b) b = -Complex.orientation.areaForm a b := by
  simp only [Complex.areaForm, Complex.mul_im, Complex.conj_re, Complex.conj_im,
    Complex.sub_re, Complex.sub_im, Complex.neg_re, Complex.neg_im]
  constructor <;> ring

/-- Clockwise means negative in the standard complex-plane orientation. -/
theorem opposite_vertex_clockwise (a b : ℂ)
    (h : 0 < Complex.orientation.areaForm a b) :
    Complex.orientation.areaForm a (-a - b) < 0 ∧
      Complex.orientation.areaForm (-a - b) b < 0 := by
  rw [(opposite_vertex_areas a b).1, (opposite_vertex_areas a b).2]
  exact ⟨neg_neg_of_pos h, neg_neg_of_pos h⟩

/-- Exact positive barycentric coordinates of the projected axis point. -/
theorem origin_barycentric (a b : ℂ) :
    (0 : ℝ) < 1 / 3 ∧ (1 / 3 : ℝ) < 1 ∧
      (1 / 3 : ℝ) + 1 / 3 + 1 / 3 = 1 ∧
      (1 / 3 : ℝ) • a + (1 / 3 : ℝ) • b + (1 / 3 : ℝ) • (-a - b) = 0 := by
  refine ⟨by norm_num, by norm_num, by norm_num, ?_⟩
  simp [smul_sub, smul_neg]

/-- Positivity rules out collinearity, so the positive barycentric coordinates
place the axis in the actual two-dimensional interior, not merely the hull.
-/
theorem origin_mem_triangle_interior (a b : ℂ)
    (h : 0 < Complex.orientation.areaForm a b) :
    (0 : ℂ) ∈ interior (convexHull ℝ ({a, b, -a - b} : Set ℂ)) := by
  sorry

end TauCetiRoadmap.GeometricTopology.AlexanderTriangle

import Mathlib.Analysis.InnerProductSpace.Laplacian
import Mathlib.Analysis.Complex.Basic
import Mathlib.Tactic

/-!
# Planar Hodge conventions in coordinates

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These coefficient formulas are compared there with DG's generic forms and the
real Hodge star, its complex-linear extension and its formal adjoint.
-/

noncomputable section

namespace TauCetiRoadmap.ComplexKahlerGeometry.PlanarHodge

open scoped ContDiff

def partialX (u : ℂ → ℂ) (z : ℂ) : ℂ := fderiv ℝ u z 1
def partialY (u : ℂ → ℂ) (z : ℂ) : ℂ := fderiv ℝ u z Complex.I

/-- Coefficients of `*(P dx + Q dy)` in the ordered coframe `(dx,dy)`. -/
def starOneCoefficients (v : ℂ × ℂ) : ℂ × ℂ := (-v.2, v.1)

theorem starOneCoefficients_sq (v : ℂ × ℂ) :
    starOneCoefficients (starOneCoefficients v) = -v := by
  ext <;> simp [starOneCoefficients]

theorem star_dz : starOneCoefficients (1, Complex.I) =
    (-Complex.I) • (1, Complex.I) := by
  ext <;> simp [starOneCoefficients, smul_eq_mul]

theorem star_dbarz : starOneCoefficients (1, -Complex.I) =
    Complex.I • (1, -Complex.I) := by
  ext <;> simp [starOneCoefficients, smul_eq_mul]

def deltaOne (P Q : ℂ → ℂ) (z : ℂ) : ℂ := -(partialX P z + partialY Q z)
def curlOne (P Q : ℂ → ℂ) (z : ℂ) : ℂ := partialX Q z - partialY P z

/-- Coefficients of `δ(h dx∧dy)`. -/
def deltaTop (h : ℂ → ℂ) (z : ℂ) : ℂ × ℂ := (partialY h z, -partialX h z)

def hodgeZero (u : ℂ → ℂ) (z : ℂ) : ℂ := deltaOne (partialX u) (partialY u) z

def hodgeOne (P Q : ℂ → ℂ) (z : ℂ) : ℂ × ℂ :=
  (partialX (deltaOne P Q) z + partialY (curlOne P Q) z,
   partialY (deltaOne P Q) z - partialX (curlOne P Q) z)

theorem deltaOne_const (a b : ℂ) (z : ℂ) :
    deltaOne (fun _ => a) (fun _ => b) z = 0 := by
  simp [deltaOne, partialX, partialY]

/-- The scalar Hodge Laplacian has the opposite sign from the native Euclidean Laplacian. -/
theorem hodgeZero_eq_neg_laplacian (u : ℂ → ℂ) (hu : ContDiff ℝ ∞ u) (z : ℂ) :
    hodgeZero u z = -Laplacian.laplacian u z := by
  sorry

/-- Mixed partials cancel, leaving the same scalar operator on each one-form coefficient. -/
theorem hodgeOne_eq_coefficientwise (P Q : ℂ → ℂ)
    (hP : ContDiff ℝ ∞ P) (hQ : ContDiff ℝ ∞ Q) (z : ℂ) :
    hodgeOne P Q z = (-Laplacian.laplacian P z, -Laplacian.laplacian Q z) := by
  sorry

/-- Sign calibration on the squared Euclidean distance from the origin. -/
theorem hodgeZero_normSq (z : ℂ) :
    hodgeZero (fun w => ((w.re ^ 2 + w.im ^ 2 : ℝ) : ℂ)) z = -4 := by
  sorry

end TauCetiRoadmap.ComplexKahlerGeometry.PlanarHodge

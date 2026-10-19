import Mathlib.Analysis.InnerProductSpace.Laplacian
import Mathlib.Analysis.Calculus.BumpFunction.InnerProduct
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Geometry.Euclidean.Volume.Measure
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Tactic
import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Conformal

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms; the README is the definitive specification.
The Euclidean examples use the native Laplacian, gradient norm and normalized
Hausdorff measure. The manifold conformal operator, compactness and mass
comparisons are explicit README targets; no empty structures stand for them.
-/

noncomputable section

open MeasureTheory
open scoped Real ContDiff

namespace Yamabe

abbrev Euclidean (n : ℕ) := EuclideanSpace ℝ (Fin n)

def criticalExponent (n : ℕ) : ℝ := 2 * (n : ℝ) / ((n : ℝ) - 2)

def conformalCoefficient (n : ℕ) : ℝ := 4 * ((n : ℝ) - 1) / ((n : ℝ) - 2)

theorem conformalCoefficient_pos {n : ℕ} (hn : 3 ≤ n) :
    0 < conformalCoefficient n := by
  have h : (2 : ℝ) < n := by exact_mod_cast (show 2 < n by omega)
  unfold conformalCoefficient
  exact div_pos (mul_pos (by norm_num) (by linarith)) (by linarith)

/-- The bubble whose conformal metric is the unit-round pullback. -/
def bubble (n : ℕ) (t : ℝ) (b x : Euclidean n) : ℝ :=
  (2 * t / (t ^ 2 + ‖x - b‖ ^ 2)) ^ (((n : ℝ) - 2) / 2)

theorem bubble_pos (n : ℕ) {t : ℝ} (ht : 0 < t) (b x : Euclidean n) :
    0 < bubble n t b x := by
  unfold bubble
  apply Real.rpow_pos_of_pos
  positivity

/-- The native Euclidean Laplacian is div grad; the roadmap uses its negative. -/
theorem bubble_conformalLaplacian {n : ℕ} (hn : 3 ≤ n)
    {t : ℝ} (ht : 0 < t) (b x : Euclidean n) :
    -(conformalCoefficient n) * Laplacian.laplacian (bubble n t b) x =
      (n : ℝ) * ((n : ℝ) - 1) *
        (bubble n t b x) ^ (criticalExponent n - 1) := by
  sorry

/-- The n-dimensional area of Sⁿ, not its ambient Lebesgue measure. -/
def roundSphereVolume (n : ℕ) : ℝ :=
  ((Measure.euclideanHausdorffMeasure n : Measure (Euclidean (n + 1)))
    (Metric.sphere 0 1)).toReal

def sphereYamabeConstant (n : ℕ) : ℝ :=
  (n : ℝ) * ((n : ℝ) - 1) * (roundSphereVolume n) ^ (2 / (n : ℝ))

/-- The smooth compactly supported test domain contains nonzero functions. -/
theorem exists_smoothCompact_eq_one (n : ℕ) :
    ∃ u : Euclidean n → ℝ,
      ContDiff ℝ ∞ u ∧ HasCompactSupport u ∧ u 0 = 1 := by
  let f : ContDiffBump (0 : Euclidean n) := ⟨1, 2, by norm_num, by norm_num⟩
  exact ⟨f, f.contDiff, f.hasCompactSupport,
    f.one_of_mem_closedBall (by simpa using f.rIn_pos.le)⟩

/-- The sharp Euclidean Sobolev inequality on smooth compactly supported tests. -/
theorem sharpSobolev_smoothCompact {n : ℕ} (hn : 3 ≤ n)
    (u : Euclidean n → ℝ) (hu : ContDiff ℝ ∞ u) (hc : HasCompactSupport u) :
    sphereYamabeConstant n *
        (∫ x, |u x| ^ criticalExponent n) ^ (2 / criticalExponent n) ≤
      conformalCoefficient n * ∫ x, ‖fderiv ℝ u x‖ ^ 2 := by
  sorry

end Yamabe

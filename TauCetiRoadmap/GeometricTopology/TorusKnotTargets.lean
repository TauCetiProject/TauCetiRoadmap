import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.SpecialFunctions.Complex.Circle
import Mathlib.Geometry.Manifold.Instances.Sphere
import Mathlib.Tactic
import TauCeti.KnotTheory.SmoothCircle

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
These formulas and suggested targets specify realification, the torus-knot model, coordinate
interchange, mirroring, inversion, and the native sphere-valued smooth embedding.
Admitted geometric statements are library targets, not completed proofs.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.TorusKnots

open scoped Manifold ContDiff

/-- The Clifford-torus parametrization; coprimality is needed for injectivity. -/
def point (p q : ℤ) (u : Circle) : EuclideanSpace ℂ (Fin 2) :=
  !₂[(Real.sqrt 2 : ℂ)⁻¹ * (u : ℂ) ^ p,
     (Real.sqrt 2 : ℂ)⁻¹ * (u : ℂ) ^ q]

/-- Real coordinate order agreeing with the complex orientation and the native unknot. -/
def realify (z : EuclideanSpace ℂ (Fin 2)) : EuclideanSpace ℝ (Fin 4) :=
  !₂[(z 0).re, (z 0).im, (z 1).re, (z 1).im]

/-- This prescribed coordinate map is a real linear isometry equivalence. -/
theorem exists_realify_linearIsometryEquiv :
    ∃ e : EuclideanSpace ℂ (Fin 2) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 4),
      ∀ z, e z = realify z := by
  sorry

/-- Reflection of the last native real coordinate. -/
def conjSnd (z : EuclideanSpace ℂ (Fin 2)) : EuclideanSpace ℂ (Fin 2) :=
  !₂[z 0, star (z 1)]

theorem exists_conjSnd_linearIsometryEquiv :
    ∃ e : EuclideanSpace ℂ (Fin 2) ≃ₗᵢ[ℝ] EuclideanSpace ℂ (Fin 2),
      ∀ z, e z = conjSnd z := by
  sorry

/-- Rotate just the plane of the two imaginary coordinates through angle `πt`. -/
def imagRotation (t : ℝ) (z : EuclideanSpace ℂ (Fin 2)) : EuclideanSpace ℂ (Fin 2) :=
  !₂[((z 0).re : ℂ) +
       ((Real.cos (Real.pi * t) * (z 0).im - Real.sin (Real.pi * t) * (z 1).im : ℝ) : ℂ) * Complex.I,
     ((z 1).re : ℂ) +
       ((Real.sin (Real.pi * t) * (z 0).im + Real.cos (Real.pi * t) * (z 1).im : ℝ) : ℂ) * Complex.I]

/-- A unitary path from the identity to coordinate interchange. Its two eigenspaces
are the diagonal and anti-diagonal; the latter is multiplied by `exp (πit)`. -/
def swapPath (t : ℝ) (z : EuclideanSpace ℂ (Fin 2)) : EuclideanSpace ℂ (Fin 2) :=
  let e := Complex.exp (((Real.pi * t : ℝ) : ℂ) * Complex.I)
  !₂[((z 0 + z 1) + e * (z 0 - z 1)) / 2,
     ((z 0 + z 1) - e * (z 0 - z 1)) / 2]

theorem swapPath_zero (z : EuclideanSpace ℂ (Fin 2)) : swapPath 0 z = z := by
  ext i
  fin_cases i <;> simp [swapPath]

theorem swapPath_one_point (p q : ℤ) (u : Circle) :
    swapPath 1 (point p q u) = point q p u := by
  ext i
  fin_cases i <;> simp [swapPath, point, Complex.exp_pi_mul_I] <;> ring

theorem swapPath_one (z : EuclideanSpace ℂ (Fin 2)) : swapPath 1 z = !₂[z 1, z 0] := by
  ext i
  fin_cases i <;> simp [swapPath, Complex.exp_pi_mul_I] <;> ring

theorem point_neg (p q : ℤ) (u : Circle) : point (-p) (-q) u = point p q u⁻¹ := by
  ext i
  fin_cases i <;> simp [point, zpow_neg]

theorem conjSnd_point (p q : ℤ) (u : Circle) :
    conjSnd (point p q u) = point p (-q) u := by
  sorry

theorem imagRotation_zero (z : EuclideanSpace ℂ (Fin 2)) : imagRotation 0 z = z := by
  ext i
  fin_cases i <;> simp [imagRotation]

theorem imagRotation_one_point (p q : ℤ) (u : Circle) :
    imagRotation 1 (point p q u) = point p q u⁻¹ := by
  sorry

theorem imagRotation_one (z : EuclideanSpace ℂ (Fin 2)) :
    imagRotation 1 z = !₂[star (z 0), star (z 1)] := by
  sorry

theorem norm_imagRotation (t : ℝ) (z : EuclideanSpace ℂ (Fin 2)) :
    ‖imagRotation t z‖ = ‖z‖ := by
  sorry

theorem contDiff_imagRotation :
    ContDiff ℝ ∞ (fun tz : ℝ × EuclideanSpace ℂ (Fin 2) => imagRotation tz.1 tz.2) := by
  sorry

theorem imagRotation_neg_leftInverse (t : ℝ) :
    Function.LeftInverse (imagRotation (-t)) (imagRotation t) := by
  sorry

theorem imagRotation_neg_rightInverse (t : ℝ) (z : EuclideanSpace ℂ (Fin 2)) :
    imagRotation t (imagRotation (-t) z) = z := by
  simpa only [neg_neg] using imagRotation_neg_leftInverse (-t) z

/-- The normalization places the entire curve in the unit three-sphere. -/
theorem norm_point (p q : ℤ) (u : Circle) : ‖point p q u‖ = 1 := by
  sorry

/-- Bezout's identity proves injectivity, including the coprime zero-parameter cases. -/
theorem injective_point {p q : ℤ} (hpq : IsCoprime p q) :
    Function.Injective (point p q) := by
  sorry

theorem contMDiff_point (p q : ℤ) :
    ContMDiff (𝓡 1) 𝓘(ℝ, EuclideanSpace ℂ (Fin 2)) ∞ (point p q) := by
  sorry

/-- The immersion input needs only a nonzero winding pair, independently of injectivity. -/
theorem injective_mfderiv_point (p q : ℤ) (hne : p ≠ 0 ∨ q ≠ 0) (u : Circle) :
    Function.Injective (mfderiv (𝓡 1) 𝓘(ℝ, EuclideanSpace ℂ (Fin 2)) (point p q) u) := by
  sorry

/-- Joint smoothness is required to obtain a smooth ambient isotopy. -/
theorem contDiff_swapPath :
    ContDiff ℝ ∞ (fun tz : ℝ × EuclideanSpace ℂ (Fin 2) => swapPath tz.1 tz.2) := by
  sorry

theorem norm_swapPath (t : ℝ) (z : EuclideanSpace ℂ (Fin 2)) :
    ‖swapPath t z‖ = ‖z‖ := by
  sorry

theorem swapPath_neg_leftInverse (t : ℝ) :
    Function.LeftInverse (swapPath (-t)) (swapPath t) := by
  sorry

theorem swapPath_neg_rightInverse (t : ℝ) (z : EuclideanSpace ℂ (Fin 2)) :
    swapPath t (swapPath (-t) z) = z := by
  simpa only [neg_neg] using swapPath_neg_leftInverse (-t) z

/-- The actual native sphere-valued smooth embedding, with its complete pointwise comparison.
Its construction consumes the finite-dimensional immersion criterion owned by GT1. -/
theorem exists_native_torusKnot {p q : ℤ} (hpq : IsCoprime p q) :
    ∃ K : TauCeti.SmoothCircleEmbedding (𝓡 3)
        (Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1),
      ∀ u : Circle, (K u : EuclideanSpace ℝ (Fin 4)) = realify (point p q u) := by
  sorry

end TauCetiRoadmap.GeometricTopology.TorusKnots

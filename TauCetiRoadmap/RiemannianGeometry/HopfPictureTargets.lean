import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Circle
import Mathlib.Tactic

/-!
# Hopf orbit picture: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These statements use the actual Euclidean unit sphere, Circle scalar action,
and real derivative of the polynomial Hopf map. The stereographic and quotient
proofs, manifold charts and finite Pontryagin–Thom comparison remain targets.
-/

noncomputable section

namespace TauCetiRoadmap.RiemannianGeometry.HopfPicture

def diskLift (u : ℂ) : EuclideanSpace ℂ (Fin 2) :=
  !₂[2 * u / (1 + Complex.normSq u),
    Complex.I * ((Complex.normSq u - 1) / (1 + Complex.normSq u) : ℝ)]

def stereo (z : EuclideanSpace ℂ (Fin 2)) : EuclideanSpace ℝ (Fin 3) :=
  !₂[(z 0).re / (1 - (z 1).im), (z 0).im / (1 - (z 1).im),
    (z 1).re / (1 - (z 1).im)]

/-- Inverse stereography of the plane disk; its denominator is positive. -/
theorem diskLift_sphere_and_chart (u : ℂ) :
    diskLift u ∈ Metric.sphere (0 : EuclideanSpace ℂ (Fin 2)) 1 ∧
      stereo (diskLift u) = !₂[u.re, u.im, 0] := by
  sorry

/-- This is the fibre relation needed to identify the closed-disk quotient. -/
theorem diskLift_orbit_iff (u v : ℂ) (hu : ‖u‖ ≤ 1) (hv : ‖v‖ ≤ 1) :
    (∃ ζ : Circle, (ζ : ℂ) • diskLift u = diskLift v) ↔
      u = v ∨ (‖u‖ = 1 ∧ ‖v‖ = 1) := by
  sorry

/-- The disk supplies every orbit of the genuine unit sphere. -/
theorem diskLift_orbit_surjective (z : EuclideanSpace ℂ (Fin 2))
    (hz : z ∈ Metric.sphere (0 : EuclideanSpace ℂ (Fin 2)) 1) :
    ∃ u : ℂ, ‖u‖ ≤ 1 ∧ ∃ ζ : Circle, (ζ : ℂ) • diskLift u = z := by
  sorry

/-- R∘h for R(x,y,z)=(x,−y,−z); the axis fibre maps to north. -/
def hopfNorth (z : EuclideanSpace ℂ (Fin 2)) : EuclideanSpace ℝ (Fin 3) :=
  !₂[2 * (star (z 0) * z 1).re, -2 * (star (z 0) * z 1).im,
    Complex.normSq (z 1) - Complex.normSq (z 0)]

/-- Restrict this ambient derivative to sphere tangents and then the normal
plane of the regular fibre. The README owns that actual bundle comparison. -/
theorem axis_framing_derivative (ζ : Circle) :
    fderiv ℝ hopfNorth (!₂[0, (ζ : ℂ)]) (!₂[(ζ : ℂ) / 2, 0]) = !₂[1, 0, 0] ∧
    fderiv ℝ hopfNorth (!₂[0, (ζ : ℂ)]) (!₂[Complex.I * (ζ : ℂ) / 2, 0]) =
      !₂[0, 1, 0] := by
  sorry

end TauCetiRoadmap.RiemannianGeometry.HopfPicture

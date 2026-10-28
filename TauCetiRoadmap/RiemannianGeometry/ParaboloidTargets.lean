import Mathlib

/-!
# Selected coordinate targets for paraboloid geodesics

This file is not the roadmap and is not exhaustive. `README.md` R5a.3 is
the definitive specification. These real-coordinate targets illustrate its
integral and crossing statements. R5a and HopfRinow supply the induced-metric,
unit-speed and angular-lift comparisons with actual manifold geodesics.
The theorem admissions are future proof targets, not implemented results.
-/

noncomputable section

open Filter Set MeasureTheory
open scoped Topology

namespace TauCetiRoadmap.RiemannianGeometry.Paraboloid

def timeIntegrand (a s : ℝ) : ℝ :=
  s * Real.sqrt (1 + 4 * s ^ 2) / Real.sqrt (s ^ 2 - a ^ 2)

def angleIntegrand (a s : ℝ) : ℝ :=
  a * Real.sqrt (1 + 4 * s ^ 2) / (s * Real.sqrt (s ^ 2 - a ^ 2))

def timeIntegral (a R : ℝ) : ℝ := ∫ s in a..R, timeIntegrand a s

def angleIntegral (a R : ℝ) : ℝ := ∫ s in a..R, angleIntegrand a s

/-- The lower endpoint is integrable, despite the inverse-square-root singularity.
The totalized value of the integrand at that one point does not affect the integral. -/
theorem integral_estimates {a R : ℝ} (ha : 0 < a) (hR : a ≤ R) :
    IntervalIntegrable (timeIntegrand a) volume a R ∧
    IntervalIntegrable (angleIntegrand a) volume a R ∧
    R ^ 2 - a ^ 2 ≤ timeIntegral a R ∧
    2 * a * Real.log (R / a) ≤ angleIntegral a R := by
  sorry

/-- These are actual interval integrals, with their continuity and divergence claims. -/
theorem integral_monotonicity_and_limits {a : ℝ} (ha : 0 < a) :
    ContinuousOn (timeIntegral a) (Ici a) ∧
    ContinuousOn (angleIntegral a) (Ici a) ∧
    StrictMonoOn (timeIntegral a) (Ici a) ∧
    StrictMonoOn (angleIntegral a) (Ici a) ∧
    Tendsto (timeIntegral a) atTop atTop ∧
    Tendsto (angleIntegral a) atTop atTop := by
  sorry

def point (r θ : ℝ) : EuclideanSpace ℝ (Fin 3) :=
  WithLp.toLp 2 ![r * Real.cos θ, r * Real.sin θ, r ^ 2]

/-- The smooth radial geodesic equation excludes solutions that wait at the turn.
The unit-speed and momentum equations alone would allow spurious circular solutions.
The determinant below expresses transversality in the regular polar chart. -/
theorem geodesic_crossings {r θ : ℝ → ℝ} {a : ℝ} (ha : 0 < a)
    (hr : ContDiff ℝ 2 r) (hθ : ContDiff ℝ 2 θ)
    (hrpos : ∀ t, 0 < r t)
    (hmomentum : ∀ t, r t ^ 2 * deriv θ t = a)
    (hspeed : ∀ t, (1 + 4 * r t ^ 2) * deriv r t ^ 2 +
      r t ^ 2 * deriv θ t ^ 2 = 1)
    (hradial : ∀ t, (1 + 4 * r t ^ 2) * deriv (deriv r) t +
      4 * r t * deriv r t ^ 2 - r t * deriv θ t ^ 2 = 0) :
    ∃ (t₀ : ℝ) (τ : ℕ → ℝ), r t₀ = a ∧
      (∀ n, 0 < τ n) ∧ StrictMono τ ∧ Tendsto τ atTop atTop ∧
      StrictMono (fun n => r (t₀ + τ n)) ∧
      Tendsto (fun n => r (t₀ + τ n)) atTop atTop ∧
      ∀ n, point (r (t₀ + τ n)) (θ (t₀ + τ n)) =
          point (r (t₀ - τ n)) (θ (t₀ - τ n)) ∧
        deriv r (t₀ + τ n) * deriv θ (t₀ - τ n) -
          deriv r (t₀ - τ n) * deriv θ (t₀ + τ n) ≠ 0 := by
  sorry

end TauCetiRoadmap.RiemannianGeometry.Paraboloid

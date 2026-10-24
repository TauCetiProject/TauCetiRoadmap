import Mathlib

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms; the README is the definitive specification.
The coordinate flux below uses native Euclidean derivatives, Bochner integrals
and normalized Hausdorff area. The end, metric, weighted solver and positive
mass theorems require the full geometric constructions in the README.
-/

noncomputable section

open MeasureTheory Filter
open scoped Topology

namespace PositiveMass

abbrev Euclidean (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-- Chart coefficients, without introducing another geometric metric carrier. -/
abbrev MetricCoefficients (n : ℕ) := Euclidean n → Fin n → Fin n → ℝ

def coordinateFluxIntegrand (n : ℕ) (g : MetricCoefficients n)
    (r : ℝ) (x : Euclidean n) : ℝ :=
  ∑ j, (∑ i, (
    fderiv ℝ (fun y => g y i j) x (EuclideanSpace.basisFun (Fin n) ℝ i) -
      fderiv ℝ (fun y => g y i i) x (EuclideanSpace.basisFun (Fin n) ℝ j))) *
        (x j / r)

def normalizedCoordinateFlux (n : ℕ) (g : MetricCoefficients n) (r : ℝ) : ℝ :=
  (∫ x in Metric.sphere (0 : Euclidean n) r,
      coordinateFluxIntegrand n g r x
      ∂(Measure.euclideanHausdorffMeasure (n - 1))) /
    (2 * ((n : ℝ) - 1) *
      ((Measure.euclideanHausdorffMeasure (n - 1) : Measure (Euclidean n))
        (Metric.sphere (0 : Euclidean n) 1)).toReal)

def euclideanMetricCoefficients (n : ℕ) : MetricCoefficients n :=
  fun _ i j => if i = j then 1 else 0

theorem euclideanCoordinateFlux_eq_zero (n : ℕ) (r : ℝ) :
    normalizedCoordinateFlux n (euclideanMetricCoefficients n) r = 0 := by
  simp [normalizedCoordinateFlux, coordinateFluxIntegrand, euclideanMetricCoefficients]

/-- Algebraic cancellation of the ordinary ADM normalization factor. -/
theorem conformalFluxNormalization {n : ℕ} (hn : 3 ≤ n) (c : ℝ) :
    (4 * ((n : ℝ) - 1) * c) / (2 * ((n : ℝ) - 1)) = 2 * c := by
  have h : (n : ℝ) - 1 ≠ 0 := by
    have hn' : (3 : ℝ) ≤ n := by exact_mod_cast hn
    linarith
  field_simp
  ring

/-- The totalized formula is used only on sufficiently large coordinate spheres. -/
def conformalEuclideanCoefficients (n : ℕ) (c : ℝ) : MetricCoefficients n :=
  fun x i j => (1 + c / ‖x‖ ^ (n - 2)) ^ (4 / ((n : ℝ) - 2)) *
    euclideanMetricCoefficients n x i j

/-- A representative geometric normalization target, not a positive-mass proof. -/
theorem conformalEuclidean_mass {n : ℕ} (hn : 3 ≤ n) (c : ℝ) :
    Tendsto (normalizedCoordinateFlux n (conformalEuclideanCoefficients n c))
      atTop (𝓝 (2 * c)) := by
  sorry

end PositiveMass

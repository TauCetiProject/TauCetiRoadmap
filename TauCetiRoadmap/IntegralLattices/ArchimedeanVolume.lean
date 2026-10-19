import Mathlib
import TauCeti.Geometry.Manifold.Riemannian.Induced
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume

/-!
Suggested forms for IntegralLattices 7E, not an exhaustive specification.
The definitive README owns the sphere-density and SO-fibration constructions.
The Euclidean metric here is the pullback of the entrywise Euclidean metric
scaled by 1/sqrt(2); on skew tangent matrices it is -trace(XY)/2.
The earlier LieGroups smooth matrix-group construction must supply the actual
charted-space, smoothness and injective-differential arguments below. These
parameters do not assert that a smooth SO carrier is already implemented.
No Tamagawa measure, pinned gauge, strong approximation or mass is an input.
-/

namespace TauCetiRoadmap.IntegralLattices.Archimedean

open Bundle MeasureTheory Manifold
open scoped Manifold

noncomputable section

/-- Total round (j-1)-sphere area; its geometric interpretation requires j>=1. -/
def sphereArea (j : ℕ) : ℝ :=
  2 * Real.pi ^ ((j : ℝ) / 2) / Real.Gamma ((j : ℝ) / 2)

/-- Euclidean SO volume, with empty products at n=0 and n=1. -/
def orthogonalSkewBasisVolume (n : ℕ) : ℝ :=
  ∏ j ∈ Finset.Icc 2 n, sphereArea j

@[simp] theorem orthogonalSkewBasisVolume_zero : orthogonalSkewBasisVolume 0 = 1 := by
  simp [orthogonalSkewBasisVolume]

@[simp] theorem orthogonalSkewBasisVolume_one : orthogonalSkewBasisVolume 1 = 1 := by
  simp [orthogonalSkewBasisVolume]

theorem sphereArea_pos {j : ℕ} (hj : 1 ≤ j) : 0 < sphereArea j := by
  sorry

theorem orthogonalSkewBasisVolume_pos (n : ℕ) : 0 < orthogonalSkewBasisVolume n := by
  sorry

/-- The sphere quotient recurrence begins at rank two. -/
theorem orthogonalSkewBasisVolume_step {n : ℕ} (hn : 2 ≤ n) :
    orthogonalSkewBasisVolume n = sphereArea n * orthogonalSkewBasisVolume (n - 1) := by
  sorry

theorem orthogonalSkewBasisVolume_two : orthogonalSkewBasisVolume 2 = 2 * Real.pi := by
  sorry

theorem orthogonalSkewBasisVolume_three :
    orthogonalSkewBasisVolume 3 = 8 * Real.pi ^ 2 := by
  sorry

/-- Existing native matrix group, without a new carrier. -/
abbrev SO (n : ℕ) := Matrix.specialOrthogonalGroup (Fin n) ℝ
abbrev O (n : ℕ) := Matrix.orthogonalGroup (Fin n) ℝ

/-- Entrywise Frobenius coordinates divided by sqrt(2), not the operator norm. -/
def skewMetricCoordinates (n : ℕ) (A : Matrix (Fin n) (Fin n) ℝ) :
    EuclideanSpace ℝ (Fin n × Fin n) :=
  WithLp.toLp 2 (fun ij => A ij.1 ij.2 / Real.sqrt 2)

def soCoordinates (n : ℕ) (g : SO n) : EuclideanSpace ℝ (Fin n × Fin n) :=
  skewMetricCoordinates n (g : Matrix (Fin n) (Fin n) ℝ)

def oCoordinates (n : ℕ) (g : O n) : EuclideanSpace ℝ (Fin n × Fin n) :=
  skewMetricCoordinates n (g : Matrix (Fin n) (Fin n) ℝ)

/-- This fixes the skew-basis normalization against actual matrix multiplication. -/
theorem inner_skewMetricCoordinates (n : ℕ) (A B : Matrix (Fin n) (Fin n) ℝ)
    (hA : A.transpose = -A) (hB : B.transpose = -B) :
    inner ℝ (skewMetricCoordinates n A) (skewMetricCoordinates n B) =
      -Matrix.trace (A * B) / 2 := by
  sorry

section Geometry
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- The native Riemannian measure of the actual induced Euclidean metric. -/
def soEuclideanMeasure (n : ℕ) [ChartedSpace E (SO n)]
    [IsManifold 𝓘(ℝ, E) 1 (SO n)]
    [MeasurableSpace (SO n)] [BorelSpace (SO n)] [LindelofSpace (SO n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (soCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (soCoordinates n) g)) :
    Measure (SO n) :=
  let g := (TauCeti.inducedRiemannianMetric (n := 0) (soCoordinates n) hf hinj).toContinuousRiemannianMetric
  letI : RiemannianBundle (fun x : SO n => TangentSpace 𝓘(ℝ, E) x) :=
    ⟨g.toRiemannianMetric⟩
  letI : IsContinuousRiemannianBundle E (fun x : SO n => TangentSpace 𝓘(ℝ, E) x) :=
    inferInstance
  TauCeti.riemannianVolume 𝓘(ℝ, E) (SO n)

/-- The measure is induced from the normalized metric; its total mass is a theorem. -/
theorem soEuclideanMeasure_univ (n : ℕ) [ChartedSpace E (SO n)]
    [IsManifold 𝓘(ℝ, E) 1 (SO n)]
    [MeasurableSpace (SO n)] [BorelSpace (SO n)] [LindelofSpace (SO n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (soCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (soCoordinates n) g)) :
    soEuclideanMeasure n hf hinj Set.univ = ENNReal.ofReal (orthogonalSkewBasisVolume n) := by
  sorry

def oEuclideanMeasure (n : ℕ) [ChartedSpace E (O n)]
    [IsManifold 𝓘(ℝ, E) 1 (O n)]
    [MeasurableSpace (O n)] [BorelSpace (O n)] [LindelofSpace (O n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (oCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (oCoordinates n) g)) :
    Measure (O n) :=
  let g := (TauCeti.inducedRiemannianMetric (n := 0) (oCoordinates n) hf hinj).toContinuousRiemannianMetric
  letI : RiemannianBundle (fun x : O n => TangentSpace 𝓘(ℝ, E) x) :=
    ⟨g.toRiemannianMetric⟩
  letI : IsContinuousRiemannianBundle E (fun x : O n => TangentSpace 𝓘(ℝ, E) x) :=
    inferInstance
  TauCeti.riemannianVolume 𝓘(ℝ, E) (O n)

/-- O(0) is a point; the factor two applies only in positive rank. -/
theorem oEuclideanMeasure_univ (n : ℕ) [ChartedSpace E (O n)]
    [IsManifold 𝓘(ℝ, E) 1 (O n)]
    [MeasurableSpace (O n)] [BorelSpace (O n)] [LindelofSpace (O n)]
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, EuclideanSpace ℝ (Fin n × Fin n)) 1 (oCoordinates n))
    (hinj : ∀ g, Function.Injective (mvfderiv 𝓘(ℝ, E) (oCoordinates n) g)) :
    oEuclideanMeasure n hf hinj Set.univ =
      ENNReal.ofReal (if n = 0 then 1 else 2 * orthogonalSkewBasisVolume n) := by
  sorry
end Geometry
end
end TauCetiRoadmap.IntegralLattices.Archimedean

import Mathlib.Geometry.Manifold.VectorBundle.Riemannian
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Scalar
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity

/-!
These are suggested forms, not an exhaustive checklist. README.md is definitive.
Metrics retain the native smooth metric carrier. The actual surgery, bordism,
and index interfaces require the supplied constructions and are not replaced
by opaque proposition fields.
-/

noncomputable section
namespace TauCetiRoadmap.PositiveScalarCurvature
open Bundle Set
open scoped Manifold ContDiff

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]

abbrev SmoothMetric (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] :=
  Bundle.ContMDiffRiemannianMetric I ∞ E (TangentSpace I : M → Type _)

/-- P1: scalar curvature evaluated with this metric's actual native instances. -/
def metricScalarCurvature (g : SmoothMetric I M) : M → ℝ := by
  letI : RiemannianBundle (TangentSpace I : M → Type _) :=
    ⟨g.toRiemannianMetric⟩
  letI : IsContMDiffRiemannianBundle I ∞ E (TangentSpace I : M → Type _) :=
    inferInstance
  exact (CovariantDerivative.leviCivitaConnection I M).scalarCurvature

/-- P1: the positivity condition is an explicit scalar-curvature inequality. -/
abbrev PositiveScalarMetrics :=
  {g : SmoothMetric I M // ∀ x, 0 < metricScalarCurvature g x}

/-- P1: scalar curvature is smooth in the actual metric instance. -/
theorem contMDiff_metricScalarCurvature (g : SmoothMetric I M) :
    ContMDiff I 𝓘(ℝ, ℝ) ∞ (metricScalarCurvature g) := by
  sorry

/-- P1: the gap uses the curvature regularity target above. -/
theorem exists_uniform_scalar_gap [CompactSpace M] (g : SmoothMetric I M)
    (hpositive : ∀ x, 0 < metricScalarCurvature g x) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ x, ε ≤ metricScalarCurvature g x := by
  sorry

end TauCetiRoadmap.PositiveScalarCurvature

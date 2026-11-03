module
import Mathlib
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Scalar
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity

/-!
# Positive scalar curvature, surgery and bordism: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with only the definitions
needed to state them: `SmoothMetric` (Mathlib's smooth Riemannian metric on the tangent bundle),
`metricScalarCurvature` (Tau Ceti's scalar curvature of the Levi-Civita connection, in that
metric's own instances) and `PositiveScalarMetrics` (the subtype R⁺(M) of the README's P1).

Statable at the pins (P1), on every model with corners including the half-space models: the
smoothness of scalar curvature and the uniform positive lower bound of a PSC metric on a
compact manifold.

Not statable at the pins:
* the Gromov–Lawson surgery theorem (P3) lacks a carrier for framed sphere surgery on a smooth
  manifold and for the metric glued across it (GeometricTopology Layer 1 handle attachment);
* the bordism-invariance theorem (P4) lacks structured oriented and Spin bordisms
  (TangentialBordism Layers 2–3);
* the classification "a closed simply connected manifold of dimension at least five admits a
  PSC metric iff it is nonspin or Spin with α(M)=0" (P5) lacks Spin structures on manifolds,
  the real Clifford-linear Dirac index and the KO-valued α-invariant (SpinGeometry G4–G6,
  TangentialBordism §7.1);
* the Hitchin spheres (P6) lack homotopy spheres, Toda's unstable classes and the Adams
  e-invariant (HomotopySpheres Layers 2–3 and 6–8).
-/

noncomputable section
namespace TauCetiRoadmap.PositiveScalarCurvature
open Bundle Set
open scoped Manifold ContDiff

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- A smooth Riemannian metric on the tangent bundle of a smooth manifold modelled on a model
with corners; the carrier of the README's P1. -/
abbrev SmoothMetric (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] :=
  Bundle.ContMDiffRiemannianMetric I ∞ E (TangentSpace I : M → Type _)

/-- P1: the scalar curvature of `g`, the metric trace of the Ricci tensor of the Levi-Civita
connection of `g`, evaluated with `g`'s own `RiemannianBundle` and smoothness instances. -/
def metricScalarCurvature (g : SmoothMetric I M) : M → ℝ := by
  letI : RiemannianBundle (TangentSpace I : M → Type _) :=
    ⟨g.toRiemannianMetric⟩
  letI : IsContMDiffRiemannianBundle I ∞ E (TangentSpace I : M → Type _) :=
    inferInstance
  exact (CovariantDerivative.leviCivitaConnection I M).scalarCurvature

/-- P1: the space R⁺(M) of smooth metrics of positive scalar curvature, as the subtype of
`SmoothMetric I M` cut out by the pointwise inequality. -/
abbrev PositiveScalarMetrics :=
  {g : SmoothMetric I M // ∀ x, 0 < metricScalarCurvature g x}

/-- P1: the scalar curvature of a smooth metric is a smooth function, on every model with
corners (half-space models included), as the metric trace of the curvature of the smooth
Levi-Civita connection. -/
theorem contMDiff_metricScalarCurvature (g : SmoothMetric I M) :
    ContMDiff I 𝓘(ℝ, ℝ) ∞ (metricScalarCurvature g) := by
  sorry

/-- P1: on a compact manifold a metric of positive scalar curvature has a uniform positive
lower bound on its scalar curvature; compactness is necessary (a warped product on ℝ with
scalar curvature `1/(1+t²)` is positive with infimum zero). -/
theorem exists_uniform_scalar_gap [CompactSpace M] (g : SmoothMetric I M)
    (hpositive : ∀ x, 0 < metricScalarCurvature g x) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ x, ε ≤ metricScalarCurvature g x := by
  sorry

end TauCetiRoadmap.PositiveScalarCurvature

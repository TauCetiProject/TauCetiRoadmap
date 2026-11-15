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
metric's own instances) and `PositiveScalarMetrics` (the subtype R⁺(M) of the README's 1.2).

Statable at the pins: the smoothness of scalar curvature and the uniform positive lower bound of
a PSC metric on a compact manifold (Layer 1, on every model with corners including the half-space
models); the Myers–Steenrod theorem for a closed Riemannian manifold, on the isometry group of
its Riemannian distance (2.1); and Hitchin's theorem that the topological spheres of dimension
8j+1 and 8j+2, j ≥ 1, carry a smooth structure with no metric of positive scalar curvature (6.2).

Not statable at the pins:
* the Gromov–Lawson surgery theorem (3.2) lacks a carrier for framed sphere surgery on a smooth
  manifold and for the metric glued across it (GeometricTopology Layer 1 handle attachment);
* the bordism-invariance theorem (4.3) and the geometric PSC bordism groups (4.4) lack
  structured oriented and Spin bordisms (TangentialBordism Layers 2–3);
* the classification "a closed simply connected manifold of dimension at least five admits a
  PSC metric iff it is nonspin or Spin with α(M)=0" (5.2) and the vanishing of α on PSC
  manifolds (5.1) lack Spin structures on manifolds, the real Clifford-linear Dirac index and
  the KO-valued α-invariant (SpinGeometry G4–G6, TangentialBordism §7.1);
* the connection-metric theorem (2.2) lacks smooth principal bundles and their associated
  bundles (SmoothBundlesConnections B1);
* the α-detection of the Hitchin spheres, α(Σ_(8j+1))=ηb^j and α(Σ_(8j+2))=η²b^j, the unstable
  Moore-space and μ constructions (6.2, steps 1–3) lack the α-invariant, Toda's unstable
  classes, the Adams e-invariant and the almost-framed exact sequence (HomotopySpheres Layers
  2–3 and 6–8, §9A.1);
* the uniform invertibility of the Dirac family and the null index bundle (6.4) lack the real
  Clifford-linear Dirac realization (SpinGeometry G6.0).
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
with corners; the carrier of the README's 1.1. -/
abbrev SmoothMetric (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] :=
  Bundle.ContMDiffRiemannianMetric I ∞ E (TangentSpace I : M → Type _)

/-- 1.2: the scalar curvature of `g`, the metric trace of the Ricci tensor of the Levi-Civita
connection of `g`, evaluated with `g`'s own `RiemannianBundle` and smoothness instances. -/
def metricScalarCurvature (g : SmoothMetric I M) : M → ℝ := by
  letI : RiemannianBundle (TangentSpace I : M → Type _) :=
    ⟨g.toRiemannianMetric⟩
  letI : IsContMDiffRiemannianBundle I ∞ E (TangentSpace I : M → Type _) :=
    inferInstance
  exact (CovariantDerivative.leviCivitaConnection I M).scalarCurvature

/-- 1.2: the space R⁺(M) of smooth metrics of positive scalar curvature, as the subtype of
`SmoothMetric I M` cut out by the pointwise inequality. -/
abbrev PositiveScalarMetrics :=
  {g : SmoothMetric I M // ∀ x, 0 < metricScalarCurvature g x}

/-! ## Layer 1: Smooth metrics, positivity and families -/

/-- 1.2: the scalar curvature of a smooth metric is a smooth function, on every model with
corners (half-space models included), as the metric trace of the curvature of the smooth
Levi-Civita connection. -/
theorem contMDiff_metricScalarCurvature (g : SmoothMetric I M) :
    ContMDiff I 𝓘(ℝ, ℝ) ∞ (metricScalarCurvature g) := by
  sorry

/-- 1.2: on a compact manifold a metric of positive scalar curvature has a uniform positive
lower bound on its scalar curvature. Compactness is necessary: on `(0,∞) × S²` the warped
product `dr² + (r²/2) g_round` has scalar curvature `2/r²`, positive with infimum zero. -/
theorem exists_uniform_scalar_gap [CompactSpace M] (g : SmoothMetric I M)
    (hpositive : ∀ x, 0 < metricScalarCurvature g x) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ x, ε ≤ metricScalarCurvature g x := by
  sorry

/-! ## Layer 2: Positive fibres and bundle metrics -/

/-- 2.1, Myers–Steenrod for closed manifolds (Kobayashi, *Transformation Groups in Differential
Geometry*, Ch. II §1): the group `M ≃ᵢ M` of isometries of the Riemannian distance of a compact
boundaryless Riemannian manifold, with the topology induced from the compact-open topology of
`C(M, M)`, carries a smooth structure modelled on some `ℝ^d` making it a compact Lie group whose
evaluation action on `M` is smooth. For the round circle `d = 1` and the group is `O(2)`; for
three isolated points it is `S₃` with `d = 0`. -/
theorem compact_isometryEquiv_lieGroup
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    [EMetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [CompactSpace M]
    [RiemannianBundle (TangentSpace I : M → Type _)]
    [IsContMDiffRiemannianBundle I ∞ E (TangentSpace I : M → Type _)]
    [IsRiemannianManifold I M] :
    letI : TopologicalSpace (M ≃ᵢ M) := TopologicalSpace.induced
      (fun f : M ≃ᵢ M => (⟨f, f.continuous⟩ : C(M, M))) inferInstance
    ∃ d : ℕ, ∃ atlas : ChartedSpace (EuclideanSpace ℝ (Fin d)) (M ≃ᵢ M),
      letI := atlas
      IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin d)) ∞ (M ≃ᵢ M) ∧
      LieGroup 𝓘(ℝ, EuclideanSpace ℝ (Fin d)) ∞ (M ≃ᵢ M) ∧
      CompactSpace (M ≃ᵢ M) ∧
      ContMDiff ((𝓘(ℝ, EuclideanSpace ℝ (Fin d))).prod I) I ∞
        (fun p : (M ≃ᵢ M) × M => p.1 p.2) := by
  sorry

/-! ## Layer 6: Examples, metric dependence and exotic spheres -/

/-- 6.2, Hitchin (*Harmonic spinors*, §4, pp. 44–46): for every `j ≥ 1` and `d = 8j+1` or
`d = 8j+2`, the topological `d`-sphere (the unit sphere of `ℝ^(d+1)` with its subspace topology)
carries a smooth structure, modelled on `ℝ^d`, for which no smooth metric has positive scalar
curvature. The structure is exotic, since the standard one carries the round metric; at `j = 1`
these are the dimensions 9 and 10. -/
theorem exists_smooth_sphere_isEmpty_positiveScalarMetrics (j d : ℕ) (hj : 1 ≤ j)
    (hd : d = 8 * j + 1 ∨ d = 8 * j + 2) :
    ∃ atlas : ChartedSpace (EuclideanSpace ℝ (Fin d))
        (Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1),
      letI := atlas
      ∃ smooth : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin d)) ∞
          (Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1),
        letI := smooth
        IsEmpty (PositiveScalarMetrics
          (I := 𝓘(ℝ, EuclideanSpace ℝ (Fin d)))
          (M := Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1)) := by
  sorry

end TauCetiRoadmap.PositiveScalarCurvature

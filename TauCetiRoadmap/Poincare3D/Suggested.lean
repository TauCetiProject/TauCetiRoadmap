module

public import Mathlib

/-!
# Three-dimensional Poincaré: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; its P1--P15 sections specify every required layer and predecessor.
These signatures express the smooth and topological endpoints and the compatible
smoothing adapter against the pinned APIs. The admitted declarations are targets.

Surgery-flow existence (P7) requires the ordinary-flow, metric-surgery and
surgery-flow carriers developed in P2--P7. Finite extinction (P11) additionally
requires the filling-width and ancestry interfaces in P8--P10. Reconstruction
(P12) requires the actual finite-history and connected-sum assembly interfaces.
Those statements are specified in the README; their Lean prototypes require
these mathematical carriers and APIs.
-/

@[expose] public section

open scoped Manifold ContDiff
open Metric (sphere)

namespace TauCetiRoadmap.Poincare3D

/-- P13: the smooth three-dimensional Poincaré theorem, on the native sphere. -/
theorem poincare_3d_smooth {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M]
    [SimplyConnectedSpace M] [CompactSpace M] :
    Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-- P14: a compatible smooth atlas exists on the original topological carrier. -/
theorem smoothable_closed_three_manifold {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [CompactSpace M] :
    ∃ atlas : ChartedSpace (EuclideanSpace ℝ (Fin 3)) M,
      letI : ChartedSpace (EuclideanSpace ℝ (Fin 3)) M := atlas
      IsManifold (𝓡 3) ∞ M := by
  sorry

/-- P15: transport through the chosen compatible atlas preserves the exact topological target. -/
theorem poincare_3d_topological {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M]
    [SimplyConnectedSpace M] [CompactSpace M] :
    Nonempty (M ≃ₜ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  obtain ⟨atlas, hSmooth⟩ := smoothable_closed_three_manifold (M := M)
  let : ChartedSpace (EuclideanSpace ℝ (Fin 3)) M := atlas
  let : IsManifold (𝓡 3) ∞ M := hSmooth
  obtain ⟨e⟩ := poincare_3d_smooth (M := M)
  exact ⟨e.toHomeomorph⟩

end TauCetiRoadmap.Poincare3D

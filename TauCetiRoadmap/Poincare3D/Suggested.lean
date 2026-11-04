module

public import Mathlib

/-!
# Three-dimensional Poincaré: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the smooth and topological Poincaré theorems and
compatible smoothing against the pinned Mathlib and Tau Ceti APIs.

Not statable at the pins: existence of Ricci flow with surgery for every
normalized closed orientable initial metric (Morgan–Tian, Theorem 15.9 and
Corollary 15.10); finite extinction for simply connected initial data
(Theorem 18.1); and reconstruction as a connected sum of spherical spaceforms
and sphere bundles (Corollary 15.4). These require the time-dependent metric,
reduced-geometry and surgery-flow carriers specified in the README, together
with its filling-width, ancestry and finite-history assembly interfaces.
-/

@[expose] public section

open scoped Manifold ContDiff
open Metric (sphere)

namespace TauCetiRoadmap.Poincare3D

/-- Layer 13: the smooth three-dimensional Poincaré theorem, on the native sphere. -/
theorem poincare_3d_smooth {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M]
    [SimplyConnectedSpace M] [CompactSpace M] :
    Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-- Layer 14: a compatible smooth atlas exists on the original topological carrier. -/
theorem smoothable_closed_three_manifold {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [CompactSpace M] :
    ∃ atlas : ChartedSpace (EuclideanSpace ℝ (Fin 3)) M,
      letI : ChartedSpace (EuclideanSpace ℝ (Fin 3)) M := atlas
      IsManifold (𝓡 3) ∞ M := by
  sorry

/-- Layer 15: the compatible atlas transports the smooth theorem to the topological target. -/
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

import TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.Basic

/-!
# Affine graph recognition: suggested signature

This file is not the roadmap and is not exhaustive. `README.md` is definitive.
The affine types and graphs are the native ones. A nonnegative integral
position with no precarious vertex is an actual positive-additive function;
connectedness and the simple-graph restriction are explicit.
-/

namespace TauCetiRoadmap.ZigzagPreprojective

universe u

/-- Connected finite simple graphs with nonzero nonnegative null positions
are exactly the graphical members of the native affine ADE list. -/
theorem affine_graph_recognition {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hG : G.Connected) :
    (∃ a : V → ℕ, a ≠ 0 ∧
      ∀ i, (∑ j ∈ G.neighborFinset i, a j) = 2 * a i) ↔
    ∃! t : TauCeti.AffineDynkinType,
      t.Valid ∧ t.IsGraphical ∧ Nonempty (G ≃g t.graph) := by
  sorry

end TauCetiRoadmap.ZigzagPreprojective

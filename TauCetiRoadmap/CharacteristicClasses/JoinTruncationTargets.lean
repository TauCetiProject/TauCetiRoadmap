import Mathlib.Geometry.Convex.ConvexSpace.Defs
import Mathlib.Topology.Order.Basic
import Mathlib.Topology.Compactness.Compact
import Mathlib.Tactic

/-!
# Compact-domain finite-weight truncation: suggested target

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The actual native finitely supported simplex is used, with continuity of its
coordinate weights. The conclusion is uniform finite weight, not containment of
the original compact image in a finite join. The strong topology, label homotopy,
principal charts and CW classification remain the README's construction targets.
-/

namespace TauCetiRoadmap.CharacteristicClasses

/-- The compactness step in the general topological-group Milnor join proof. -/
theorem compact_simplex_weights_uniform_prefix
    {K : Type*} [TopologicalSpace K] [CompactSpace K]
    (f : K → Convexity.StdSimplex ℝ ℕ)
    (hcoord : ∀ i : ℕ, Continuous fun x : K => (f x).weights i) :
    ∃ N : ℕ, ∀ x : K, (1 / 2 : ℝ) < ∑ i ∈ Finset.range N, (f x).weights i := by
  sorry

end TauCetiRoadmap.CharacteristicClasses

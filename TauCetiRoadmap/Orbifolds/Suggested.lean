import Mathlib
import TauCeti.Topology.Triangulable.Basic

/-!
# Orbifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, those headline theorems of the roadmap that are statable at the pins, each with
`sorry`.

The headline theorems of the roadmap are:

* the Yang–Cairns triangulation theorem (§3.1): the orbit space of a smooth action of a compact
  Lie group on a second-countable Hausdorff manifold is triangulable. It is stated below, as
  `isTriangulable_orbitRel_quotient`.
* Linear charts with retained arrows (§2.1): near every object a proper étale Lie groupoid is the
  action groupoid of its finite isotropy group acting linearly on a ball. Not statable: the pins
  have no Lie groupoid carrier (a Lie groupoid structure on a native groupoid is LieGroupoidsPoisson
  §G0.2's target); Tau Ceti has the topological local model and Bochner linearization of finite
  group actions, which are supplier contracts of the README.
* The rational comparison `H*(|Γ|; ℚ) ≅ H*(BΓ; ℚ)` (§§4.4, 4.9b) and the orbifold de Rham theorem
  `H*(Ω_inv(Γ)) ≅ H*(BΓ; ℝ)` (§§4.5, 4.9b). Not statable: besides the Lie groupoid carrier, the
  coarse map `BΓ → |Γ|` and the complex of invariant forms exist at the pins only for action
  groupoids.
* Weighted integration with Stokes on collared domains, rational Poincaré duality and the
  normalization of the weighted fundamental class (§§5.1–5.4). Not statable: orientations and
  integrals of invariant forms on presentations, and collared domains, are absent at the pins.
* The simplicial Chern–Weil comparison (§4.8). Not statable: orbibundles and their represented
  bundles on `BΓ` are absent at the pins.
-/

noncomputable section

open scoped Manifold ContDiff

namespace TauCetiRoadmap.Orbifolds

/-! ## Layer 3: Coarse triangulation, finite covers and boundary models -/

/-- **Yang–Cairns** (§3.1; Yang, Bull. AMS 69 (1963), Theorem, p. 407). If a compact Lie group `K`
acts smoothly on a second-countable Hausdorff smooth manifold `M`, the orbit space `M/K` is
homeomorphic to the geometric realization of an abstract simplicial complex. No hypothesis on the
stabilizers is made. -/
theorem isTriangulable_orbitRel_quotient
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    (K : Type*) [Group K] [TopologicalSpace K] [ChartedSpace E' K] [LieGroup 𝓘(ℝ, E') ∞ K]
    [CompactSpace K]
    (M : Type*) [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ∞ M]
    [T2Space M] [SecondCountableTopology M]
    [MulAction K M] [ContMDiffSMul 𝓘(ℝ, E') 𝓘(ℝ, E) ∞ K M] :
    TauCeti.IsTriangulable.{0} (MulAction.orbitRel.Quotient K M) := by
  sorry

end TauCetiRoadmap.Orbifolds

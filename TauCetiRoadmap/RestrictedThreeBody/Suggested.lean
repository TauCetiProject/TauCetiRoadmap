import Mathlib

/-!
# Classical nonintegrability of the planar CR3BP: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The single summit is Poincaré's classical theorem: the planar circular restricted
three-body problem has no additional first integral that is jointly real-analytic in the state and
mass parameter near `μ = 0` and functionally independent of the Hamiltonian on the stated domain.

Only elementary objects expressible honestly against current Mathlib are pinned here. In
particular, this file does not invent placeholder predicates for jointly analytic parameter
families, analytic torus Fourier series, Delaunay coordinate charts, or the final theorem. Those
signatures should be added only after their domains and regularity hypotheses can be stated.

The fixed-mass meromorphic result, the spatial problem, differential Galois theory, and the
singular blow-up are intentionally outside this roadmap's dependency graph.
-/

namespace TauCetiRoadmap.RestrictedThreeBody

/-! ## The physical planar rotating-frame Hamiltonian -/

/-- A readable planar canonical state `(x,y,pₓ,pᵧ)`. A later mechanics API should provide its
equivalence with the standard four-dimensional real vector space. -/
structure PlanarState where
  x : ℝ
  y : ℝ
  px : ℝ
  py : ℝ

/-- The planar circular restricted three-body potential in the rotating frame, with masses `μ` and
`1-μ` at `(1-μ,0)` and `(-μ,0)`. Collision points are excluded by theorem hypotheses. -/
noncomputable def planarPotential (μ x y : ℝ) : ℝ :=
  μ / Real.sqrt ((x - 1 + μ) ^ 2 + y ^ 2) +
    (1 - μ) / Real.sqrt ((x + μ) ^ 2 + y ^ 2)

/-- The planar rotating-frame Hamiltonian, with `ω = dx ∧ dpₓ + dy ∧ dpᵧ` and
`q̇ = ∂H/∂p`, `ṗ = -∂H/∂q`. -/
noncomputable def planarHamiltonian (μ : ℝ) (s : PlanarState) : ℝ :=
  (s.px ^ 2 + s.py ^ 2) / 2 + (s.px * s.y - s.py * s.x) -
    planarPotential μ s.x s.y

/-- At the integrable endpoint `μ=0`, the planar potential is the one-primary Kepler potential.
This is an acceptance gate for the classical parameter family. -/
theorem planarPotential_zero (x y : ℝ) :
    planarPotential 0 x y = 1 / Real.sqrt (x ^ 2 + y ^ 2) := by
  sorry

/-- Rotation by `π` and `μ ↔ 1-μ` exchanges the primaries in the planar potential. This is a
convention check, not a fixed-mass nonintegrability claim. -/
theorem planarPotential_primaryExchange (μ x y : ℝ) :
    planarPotential (1 - μ) (-x) (-y) = planarPotential μ x y := by
  sorry

end TauCetiRoadmap.RestrictedThreeBody

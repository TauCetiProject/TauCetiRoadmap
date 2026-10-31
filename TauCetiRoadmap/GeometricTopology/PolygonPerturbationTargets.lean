import TauCeti.Topology.Homotopy.Isotopy.Basic
import Mathlib.Topology.MetricSpace.Contracting
import Mathlib.Analysis.Normed.Module.Basic

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
These representative native targets give the ambient perturbation floor for
polygonal-knot problems22–25. They do not replace the finite triangulation,
vertex interpolation, regular-projection or diagram-comparison constructions.
The two `sorry` proofs are future theorem targets.
-/

namespace TauCetiRoadmap.GeometricTopology.PolygonPerturbation

open unitInterval

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The ambient formula; the displacement is independent of time. -/
def perturb (u : E → E) (t : I) (x : E) : E := x + (t : ℝ) • u x

/-- Zero displacement gives an exact fixed point at every time. -/
theorem perturb_fixed (u : E → E) (t : I) (x : E) (hx : u x = 0) :
    perturb u t x = x := by
  simp [perturb, hx]

/-- The uniform bounds retain the actual lower bound, not just injectivity. -/
theorem perturb_distortion (u : E → E) (c : NNReal) (hu : LipschitzWith c u)
    (hc : c < 1) (t : I) (x y : E) :
    (1 - (c : ℝ)) * ‖x - y‖ ≤ ‖perturb u t x - perturb u t y‖ ∧
      ‖perturb u t x - perturb u t y‖ ≤ (1 + (c : ℝ)) * ‖x - y‖ := by
  sorry

/-- The native ambient-isotopy structure requires a homeomorphic TOTAL map.
Completeness supplies the inverse by contraction, uniformly in the time variable. -/
theorem exists_ambientIsotopy [CompleteSpace E] (u : E → E) (c : NNReal)
    (hu : LipschitzWith c u) (hc : c < 1) :
    ∃ Φ : TauCeti.AmbientIsotopy E,
      ∀ (t : I) (x : E), Φ.toContinuousMap (t, x) = perturb u t x := by
  sorry

end TauCetiRoadmap.GeometricTopology.PolygonPerturbation

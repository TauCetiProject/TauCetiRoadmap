import Mathlib

/-!
# Local rescaling for the shrinking-knot family

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These targets concern the actual Euclidean rescaling and derivatives. Realizing
the knotted long arc and closing it to the specified circle are separate geometric
targets, not hypotheses replaced by an abstract knot predicate here.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.ShrinkingKnot

open Topology
open scoped ContDiff

abbrev Space := EuclideanSpace ℝ (Fin 3)

def axis (s : ℝ) : Space := !₂[s, 0, 0]

/-- The limiting map retains its axis parameter instead of collapsing the whole arc. -/
def rescale (a : ℝ → Space) (t s : ℝ) : Space :=
  if t = 0 then axis s else t • a (s / t)

/-- A bounded displacement gives joint continuity through time zero, although
nonlinear long arcs do not converge in the first-derivative topology. -/
theorem rescale_family (a : ℝ → Space) (C : ℝ)
    (ha : ContDiff ℝ ∞ a) (he : IsEmbedding a) (hC : 0 ≤ C)
    (hbound : ∀ s, ‖a s - axis s‖ ≤ C) :
    ContinuousOn (fun p : ℝ × ℝ => rescale a p.1 p.2)
      (Set.Ici 0 ×ˢ (Set.univ : Set ℝ)) ∧
    (∀ t, 0 ≤ t → ContDiff ℝ ∞ (rescale a t) ∧ IsEmbedding (rescale a t)) ∧
    (∀ t, 0 ≤ t → ∀ s, ‖rescale a t s - axis s‖ ≤ t * C) := by
  sorry

/-- The bad derivative is attained in every shrinking interior interval. -/
theorem rescale_derivative_gap (a : ℝ → Space) (ha : ContDiff ℝ ∞ a)
    (hderiv : ∃ u ∈ Set.Ioo (-1 : ℝ) 1, deriv a u ≠ axis 1) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ t : ℝ, 0 < t →
      ∃ s : ℝ, |s| < t ∧ ‖deriv (rescale a t) s - axis 1‖ ≥ ε := by
  sorry

end TauCetiRoadmap.GeometricTopology.ShrinkingKnot

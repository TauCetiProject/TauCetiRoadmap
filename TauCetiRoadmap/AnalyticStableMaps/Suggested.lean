import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Topology.ContinuousMap.Algebra
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.PiProd
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Basic

/-!
The README is the definitive specification; this file is not an exhaustive checklist.
These declarations expose node-value matching on a fixed compact normalization model and
its integer expected dimension. Sobolev evaluation, bundle-fiber identifications, moving
nodes, surjective interpolation and the full stable-map/gluing constructions are specified
in the README. Node branches use the actual matching value of the base map to identify
bundle fibers; the fixed coefficient space below records that local linear model.
-/

noncomputable section

namespace TauCetiRoadmap.AnalyticStableMaps

variable {S E N : Type*} [TopologicalSpace S]
  [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- Difference of the two branch evaluations for a finite collection of specified nodes. -/
def nodeDifference [CompactSpace S] [Fintype N] (left right : N → S) :
    C(S, E) →L[ℝ] (N → E) :=
  ContinuousLinearMap.pi fun a =>
    ContinuousMap.evalCLM ℝ (left a) - ContinuousMap.evalCLM ℝ (right a)

/-- The genuine submodule of sections with equal values at the paired node branches. -/
def matchedSections [CompactSpace S] [Fintype N] (left right : N → S) :
    Submodule ℝ C(S, E) :=
  (nodeDifference left right).toLinearMap.ker

variable [CompactSpace S] [Fintype N]

@[simp] theorem nodeDifference_apply (left right : N → S) (u : C(S, E)) (a : N) :
    nodeDifference left right u a = u (left a) - u (right a) := rfl

@[simp] theorem mem_matchedSections (left right : N → S) (u : C(S, E)) :
    u ∈ matchedSections left right ↔ ∀ a, u (left a) = u (right a) := by
  change nodeDifference left right u = 0 ↔ _
  constructor
  · intro h a
    have ha := congrFun h a
    simpa only [nodeDifference_apply, Pi.zero_apply, sub_eq_zero] using ha
  · intro h
    funext a
    change u (left a) - u (right a) = 0
    exact sub_eq_zero.mpr (h a)

/-- Matching is a closed linear constraint on the fixed continuous-section model. -/
theorem isClosed_matchedSections (left right : N → S) :
    IsClosed (matchedSections (E := E) left right : Set C(S, E)) := by
  exact (nodeDifference (E := E) left right).isClosed_ker

/-- Integer virtual dimension, also for unstable pointed signatures or negative values. -/
def expectedDimension (targetComplexDimension genus marks : ℕ) (chernPairing : ℤ) : ℤ :=
  2 * (((targetComplexDimension : ℤ) - 3) * (1 - (genus : ℤ)) +
    chernPairing + (marks : ℤ))

end TauCetiRoadmap.AnalyticStableMaps

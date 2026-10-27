import Mathlib.Analysis.InnerProductSpace.StarOrder
import Mathlib.Analysis.InnerProductSpace.WeakOperatorTopology
import Mathlib.Analysis.Normed.Module.FiniteDimension

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

Endpoints of Jones's positive-contraction/projection-limit example (typed
physical page13). Infinite dimension is essential for the approximation theorem.
The admitted proofs are future targets; the README requires the finite-block
dilation and the actual net, as well as the ultraweak/SOT comparisons.
-/

noncomputable section

namespace TauCetiRoadmap.VonNeumannAlgebras.ProjectionClosure

open scoped InnerProductSpace

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [CompleteSpace H]

/-- Match a positive contraction's coefficients on a finite-dimensional subspace
by an actual orthogonal projection on the original infinite-dimensional space. -/
theorem exists_projection_matching_finite_coefficients
    (hH : ¬ FiniteDimensional ℂ H) (A : H →L[ℂ] H) (hA : 0 ≤ A) (hA' : A ≤ 1)
    (F : Submodule ℂ H) [FiniteDimensional ℂ F] :
    ∃ P : H →L[ℂ] H, IsStarProjection P ∧
      ∀ x ∈ F, ∀ y ∈ F, ⟪y, P x⟫_ℂ = ⟪y, A x⟫_ℂ := by
  sorry

/-- The closure is taken in Mathlib's WOT type copy, not in operator norm. -/
theorem wot_closure_projections (hH : ¬ FiniteDimensional ℂ H) :
    closure {A : H →WOT[ℂ] H | IsStarProjection A.toCLM} =
      {A : H →WOT[ℂ] H | 0 ≤ A.toCLM ∧ A.toCLM ≤ 1} := by
  sorry

/-- The boundary case: projections are already closed when H is finite
dimensional, including the zero Hilbert space. -/
theorem isClosed_projections_of_finiteDimensional [FiniteDimensional ℂ H] :
    IsClosed {A : H →WOT[ℂ] H | IsStarProjection A.toCLM} := by
  sorry

end TauCetiRoadmap.VonNeumannAlgebras.ProjectionClosure

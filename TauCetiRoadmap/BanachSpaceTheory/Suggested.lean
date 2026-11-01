/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.Normed.Module.Bases
import Mathlib.Analysis.Normed.Module.DoubleDual
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Topology.Sequences

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
Interfaces whose prerequisite API is not yet available are described there,
rather than encoded as empty proposition fields.
-/

noncomputable section
open Filter Topology

namespace BanachSpaceTheory

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- Weak sequential compactness needs no metrizability hypothesis. -/
theorem eberlein_smulian (K : Set E) :
    IsCompact (toWeakSpace ℝ E '' K) ↔ IsSeqCompact (toWeakSpace ℝ E '' K) := by
  sorry

/-- Analytic reflexivity uses the continuous bidual, over either scalar field. -/
theorem james {𝕜 X : Type*} [RCLike 𝕜] [NormedAddCommGroup X]
    [NormedSpace 𝕜 X] [CompleteSpace X] :
    Function.Surjective (NormedSpace.inclusionInDoubleDual 𝕜 X) ↔
      ∀ f : StrongDual 𝕜 X, ∃ x : X, ‖x‖ ≤ 1 ∧ ‖f x‖ = ‖f‖ := by
  sorry

/-- Approximation on compact subsets; finite rank refers to the algebraic range. -/
def HasApproximationProperty (E : Type*) [NormedAddCommGroup E] [NormedSpace ℝ E] :
    Prop :=
  ∀ K : Set E, IsCompact K → ∀ ε : ℝ, 0 < ε →
    ∃ T : E →L[ℝ] E, FiniteDimensional ℝ (LinearMap.range T.toLinearMap) ∧
      ∀ x ∈ K, ‖T x - x‖ < ε

namespace SchauderBasis

/-- Density is in the norm topology of the strong dual. -/
def IsShrinking (b : _root_.SchauderBasis ℝ E) : Prop :=
  (Submodule.span ℝ (Set.range b.coord)).topologicalClosure = ⊤

/-- Initial partial sums, not an unconditional `tsum`. -/
def IsBoundedlyComplete (b : _root_.SchauderBasis ℝ E) : Prop :=
  ∀ a : ℕ → ℝ,
    Bornology.IsBounded (Set.range (fun n ↦ ∑ i ∈ Finset.range n, a i • b i)) →
    ∃ x : E, Tendsto (fun n ↦ ∑ i ∈ Finset.range n, a i • b i) atTop (𝓝 x)

theorem reflexive_iff [CompleteSpace E] (b : _root_.SchauderBasis ℝ E) :
    Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ E) ↔
      IsShrinking b ∧ IsBoundedlyComplete b := by
  sorry

theorem approximationProperty [CompleteSpace E] (b : _root_.SchauderBasis ℝ E) :
    HasApproximationProperty E := by
  sorry

end SchauderBasis

-- Keep normed dual instances explicit so the finite-dimensional subspace norms
-- use the operator norm at both stages of the iterated dual.
local instance : NormedAddCommGroup (StrongDual ℝ E) := inferInstance
local instance : NormedSpace ℝ (StrongDual ℝ E) := inferInstance
local instance : NormedAddCommGroup (StrongDual ℝ (StrongDual ℝ E)) := inferInstance
local instance : NormedSpace ℝ (StrongDual ℝ (StrongDual ℝ E)) := inferInstance

/-- Pairings and the intersection with the original space are preserved exactly. -/
theorem local_reflexivity [CompleteSpace E]
    (F : Submodule ℝ (StrongDual ℝ (StrongDual ℝ E))) [FiniteDimensional ℝ F]
    (G : Submodule ℝ (StrongDual ℝ E)) [FiniteDimensional ℝ G]
    (ε : ℝ) (hε : 0 < ε) (hε' : ε < 1) :
    ∃ T : F →L[ℝ] E,
      (∀ x : F, (1 - ε) * ‖x‖ ≤ ‖T x‖ ∧ ‖T x‖ ≤ (1 + ε) * ‖x‖) ∧
      (∀ x : F, ∀ f : G, f.val (T x) = x.val f.val) ∧
      (∀ x : E, ∀ hx : NormedSpace.inclusionInDoubleDual ℝ E x ∈ F,
        T ⟨NormedSpace.inclusionInDoubleDual ℝ E x, hx⟩ = x) := by
  sorry

/-- Arbitrarily large almost Euclidean finite-dimensional subspaces. -/
theorem dvoretzky [CompleteSpace E] (hE : ¬ FiniteDimensional ℝ E)
    (n : ℕ) (ε : ℝ) (hε : 0 < ε) (hε' : ε < 1) :
    ∃ T : EuclideanSpace ℝ (Fin n) →L[ℝ] E,
      ∀ x, (1 - ε) * ‖x‖ ≤ ‖T x‖ ∧ ‖T x‖ ≤ (1 + ε) * ‖x‖ := by
  sorry

end BanachSpaceTheory

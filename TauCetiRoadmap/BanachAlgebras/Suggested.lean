/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.Normed.Algebra.UnitizationL1
import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Analysis.Normed.Operator.Basic
import Mathlib.RingTheory.Jacobson.Radical
import Mathlib.Topology.Algebra.Module.ClosedSubmodule
import Mathlib.Topology.ApproximateUnit
import Mathlib.Topology.Sequences

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
Interfaces requiring the completed tensor and Banach bimodule APIs are specified
there, rather than represented by empty proposition fields here.
-/

noncomputable section
open Filter Topology

namespace BanachAlgebras

section SeparatingSpace

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
  [NormedAddCommGroup F] [NormedSpace ℂ F]

/-- The vertical fibre at zero of the closure of the graph. -/
def separatingSpace (T : E →ₗ[ℂ] F) : Submodule ℂ F :=
  T.graph.topologicalClosure.comap (LinearMap.inr ℂ E F)

theorem isClosed_separatingSpace (T : E →ₗ[ℂ] F) :
    IsClosed (separatingSpace T : Set F) := by
  exact T.graph.isClosed_topologicalClosure.preimage
    (continuous_const.prodMk continuous_id)

theorem mem_separatingSpace_iff (T : E →ₗ[ℂ] F) (y : F) :
    y ∈ separatingSpace T ↔
      ∃ x : ℕ → E, Tendsto x atTop (𝓝 0) ∧ Tendsto (T ∘ x) atTop (𝓝 y) := by
  sorry

theorem continuous_iff_separatingSpace_eq_bot [CompleteSpace E] [CompleteSpace F]
    (T : E →ₗ[ℂ] F) : Continuous T ↔ separatingSpace T = ⊥ := by
  sorry

end SeparatingSpace

section AutomaticContinuity

variable {A B : Type*} [NormedRing A] [NormedAlgebra ℂ A] [CompleteSpace A]

/-- Surjectivity is essential for a general noncommutative target. -/
theorem continuous_of_surjective_of_semisimple [NormedRing B] [NormedAlgebra ℂ B]
    [CompleteSpace B] (φ : A →ₐ[ℂ] B) (hφ : Function.Surjective φ)
    (hB : Ring.jacobson B = ⊥) : Continuous φ := by
  sorry

theorem continuous_of_commutative_semisimple [NormedCommRing B] [NormedAlgebra ℂ B]
    [CompleteSpace B] (φ : A →ₐ[ℂ] B) (hB : Ring.jacobson B = ⊥) :
    Continuous φ := by
  sorry

/-- The unbounded input map has the ordinary noncommutative Leibniz identity. -/
theorem derivation_continuous (D : A →ₗ[ℂ] A)
    (hD : ∀ a b, D (a * b) = a * D b + D a * b)
    (hA : Ring.jacobson A = ⊥) : Continuous D := by
  sorry

end AutomaticContinuity

section Factorization

variable {A E : Type*} [NonUnitalNormedRing A] [NormedSpace ℂ A]
  [IsScalarTower ℂ A A] [SMulCommClass ℂ A A] [CompleteSpace A]
  [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/-- A bounded associative left action, without a unit or a contractivity assumption. -/
theorem cohen_hewitt (L : A →L[ℂ] E →L[ℂ] E)
    (hL : ∀ a b x, L (a * b) x = L a (L b x))
    (l : Filter A) [l.NeBot]
    (hl : ∀ a : A, Tendsto (fun e ↦ e * a) l (𝓝 a))
    (C : ℝ) (hC : 0 < C) (hbound : ∀ᶠ e in l, ‖e‖ ≤ C)
    (x : E)
    (hx : x ∈ (Submodule.span ℂ {y : E | ∃ a z, y = L a z}).topologicalClosure)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ a : A, ∃ y : E, ‖a‖ ≤ C ∧ L a y = x ∧ ‖y - x‖ < ε ∧
      y ∈ (Submodule.span ℂ (Set.range (fun b : A ↦ L b x))).topologicalClosure := by
  sorry

end Factorization

end BanachAlgebras

/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.VonNeumannAlgebra.Basic
import Mathlib.Analysis.InnerProductSpace.WeakOperatorTopology
import Mathlib.Analysis.InnerProductSpace.Positive
import Mathlib.Analysis.CStarAlgebra.GelfandNaimarkSegal
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
Interfaces whose prerequisite API is not yet available are described there,
rather than encoded as empty proposition fields.
-/

open scoped ENNReal NNReal

noncomputable section

namespace VonNeumannAlgebra

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- A nonzero concrete algebra has scalar center. -/
def IsFactor (M : VonNeumannAlgebra H) : Prop :=
  (1 : H →L[ℂ] H) ≠ 0 ∧
  ∀ x : H →L[ℂ] H, x ∈ M → x ∈ M.commutant →
    ∃ c : ℂ, x = c • (1 : H →L[ℂ] H)

/-- Initial-to-final Murray--von Neumann equivalence inside the algebra. -/
def ProjectionEquivalent (M : VonNeumannAlgebra H) (p q : H →L[ℂ] H) : Prop :=
  IsStarProjection p ∧ IsStarProjection q ∧ p ∈ M ∧ q ∈ M ∧
  ∃ v : H →L[ℂ] H, v ∈ M ∧ star v * v = p ∧ v * star v = q

/-- Subequivalence uses Mathlib's positive-operator order on the final projection. -/
def ProjectionSubequivalent (M : VonNeumannAlgebra H) (p q : H →L[ℂ] H) : Prop :=
  IsStarProjection p ∧ IsStarProjection q ∧ p ∈ M ∧ q ∈ M ∧
  ∃ v : H →L[ℂ] H, v ∈ M ∧ star v * v = p ∧ v * star v ≤ q

/-- Symmetry uses the adjoint of the implementing partial isometry. -/
theorem ProjectionEquivalent.symm {M : VonNeumannAlgebra H}
    {p q : H →L[ℂ] H} (h : ProjectionEquivalent M p q) :
    ProjectionEquivalent M q p := by
  sorry

/-- Antisymmetry is on equivalence classes, not on the actual projections. -/
theorem equivalent_of_subequivalent {M : VonNeumannAlgebra H}
    {p q : H →L[ℂ] H} (hpq : ProjectionSubequivalent M p q)
    (hqp : ProjectionSubequivalent M q p) : ProjectionEquivalent M p q := by
  sorry

/-- Bicommutant generation reuses the Mathlib centralizer vocabulary. -/
def generated (s : Set (H →L[ℂ] H)) :
    VonNeumannAlgebra H where
  toStarSubalgebra :=
    StarSubalgebra.centralizer ℂ (StarSubalgebra.centralizer ℂ s : Set (H →L[ℂ] H))
  centralizer_centralizer' := by
    sorry

/-- The existing weak operator wrapper is the topology in the bicommutant criterion. -/
theorem double_commutant_iff_isClosed_image_ofCLM
    (A : StarSubalgebra ℂ (H →L[ℂ] H)) :
    Set.centralizer (Set.centralizer (A : Set (H →L[ℂ] H))) = A ↔
      IsClosed (ContinuousLinearMapWOT.ofCLM '' (A : Set (H →L[ℂ] H))) := by
  sorry

/-- Cyclicity is closure of the orbit, without a separability restriction. -/
def IsCyclic (M : VonNeumannAlgebra H) (ξ : H) : Prop :=
  Dense (Set.range (fun x : M => (x : H →L[ℂ] H) ξ))

/-- A separating vector detects every element of the concrete algebra. -/
def IsSeparating (M : VonNeumannAlgebra H) (ξ : H) : Prop :=
  ∀ x : M, (x : H →L[ℂ] H) ξ = 0 → x = 0

theorem isCyclic_iff_isSeparating_commutant (M : VonNeumannAlgebra H) (ξ : H) :
    IsCyclic M ξ ↔ IsSeparating M.commutant ξ := by
  sorry

/-- Traciality is a property of an existing functional, not a new functional dialect. -/
def IsTracial (M : VonNeumannAlgebra H) (τ : M.toStarSubalgebra →L[ℂ] ℂ) : Prop :=
  ∀ x y : M.toStarSubalgebra, τ (x * y) = τ (y * x)

/-- The initial range dimension is replaced by the semifinite trace of this final projection. -/
theorem range_projection_mem_commutant {K : Type*} [NormedAddCommGroup K]
    [InnerProductSpace ℂ K] [CompleteSpace K]
    (M : VonNeumannAlgebra H) (π : M.toStarSubalgebra →⋆ₐ[ℂ] (K →L[ℂ] K))
    (u : H →L[ℂ] K) (huIsometry : Isometry u)
    (hu : ∀ x : M.toStarSubalgebra, u.comp (x : H →L[ℂ] H) = (π x).comp u) :
    ∀ x : M.toStarSubalgebra, Commute (u.comp u.adjoint) (π x) := by
  sorry

end VonNeumannAlgebra

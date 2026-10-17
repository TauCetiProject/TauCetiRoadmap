/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.VonNeumannAlgebra.Basic
import Mathlib.Analysis.CStarAlgebra.CompletelyPositiveMap
import Mathlib.Analysis.CStarAlgebra.PositiveLinearFunctional
import Mathlib.Analysis.CStarAlgebra.Projection
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.Star.NonUnitalSubalgebra
import Mathlib.RepresentationTheory.Invariants
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
The joint-action and matrix-witness prototypes below pin algebraic conventions.
Normality and the trace's faithful normal hypotheses use the predual/standard-form
constructions specified in the README, rather than empty `Prop` fields.
-/

noncomputable section
open scoped TensorProduct BigOperators CStarAlgebra ComplexOrder
namespace FactorRigidity

section Actions
variable (M N H : Type*) [CStarAlgebra M] [CStarAlgebra N]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Algebraic part of R1's normal correspondence; the two actions commute. -/
structure CommutingActions where
  left : M →⋆ₐ[ℂ] (H →L[ℂ] H)
  right : Nᵐᵒᵖ →⋆ₐ[ℂ] (H →L[ℂ] H)
  commute : ∀ x y, Commute (left x) (right y)

variable {M N H}

def CommutingActions.joint (A : CommutingActions M N H) :
    M ⊗[ℂ] Nᵐᵒᵖ →ₐ[ℂ] (H →L[ℂ] H) :=
  Algebra.TensorProduct.lift A.left.toAlgHom A.right.toAlgHom A.commute

@[simp] theorem CommutingActions.joint_tmul (A : CommutingActions M N H)
    (x : M) (y : Nᵐᵒᵖ) (ξ : H) :
    A.joint (x ⊗ₜ[ℂ] y) ξ = A.left x (A.right y ξ) := by
  simp [CommutingActions.joint, Algebra.TensorProduct.lift_tmul]

/-- This is weak containment of joint representations, not Popa intertwining. -/
def WeaklyContained {K : Type*} [NormedAddCommGroup K]
    [InnerProductSpace ℂ K] [CompleteSpace K]
    (A : CommutingActions M N H) (B : CommutingActions M N K) : Prop :=
  ∀ z : M ⊗[ℂ] Nᵐᵒᵖ, ‖A.joint z‖ ≤ ‖B.joint z‖

theorem weaklyContained_refl (A : CommutingActions M N H) :
    WeaklyContained A A := fun _ => le_rfl

end Actions

section Approximation
variable {M : Type*} [CStarAlgebra M] [PartialOrder M] [StarOrderedRing M]

/-- The tracial L² gauge on bounded elements, before GNS completion. -/
def traceTwoNorm (τ : M →L[ℂ] ℂ) (x : M) : ℝ :=
  Real.sqrt (τ (star x * x)).re

/-- R3's literal CP-map criterion; no undefined rigidity predicate is assumed. -/
def RelativePropertyT (τ : M →P[ℂ] ℂ) (B : StarSubalgebra ℂ M) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ (F : Finset M) (δ : ℝ), 0 < δ ∧
    ∀ φ : M →CP M,
      φ 1 ≤ 1 →
      (∀ x : M, 0 ≤ x → τ (φ x) ≤ τ x) →
      (∀ x ∈ F, traceTwoNorm (τ : M →L[ℂ] ℂ) (φ x - x) < δ) →
      ∀ b : B, ‖(b : M)‖ ≤ 1 → traceTwoNorm (τ : M →L[ℂ] ℂ) (φ b - b) < ε

/-- CP subunitality gives Schwarz, and trace domination controls its L² norm. -/
theorem cp_traceTwoNorm_le (τ : M →P[ℂ] ℂ) (φ : M →CP M)
    (hunit : φ 1 ≤ 1)
    (htrace : ∀ x : M, 0 ≤ x → τ (φ x) ≤ τ x) (x : M) :
    traceTwoNorm (τ : M →L[ℂ] ℂ) (φ x) ≤
      traceTwoNorm (τ : M →L[ℂ] ℂ) x := by
  sorry

end Approximation

section MatrixWitness
variable {M : Type*} [CStarAlgebra M]

/-- Matrix-corner implementation of R5. The normality condition on θ is a
predual target of the README; this is the algebraic part with actual entries.
`vq=v` and `vv*v=v` express right support and partial-isometry conditions. -/
structure MatrixIntertwiner (P : NonUnitalStarSubalgebra ℂ M)
    (Q : StarSubalgebra ℂ M) (n : ℕ) where
  f : M
  f_projection : IsStarProjection f
  f_mem : f ∈ P
  left_unit : ∀ x : P, f * (x : M) = x
  right_unit : ∀ x : P, (x : M) * f = x
  q : CStarMatrix (Fin n) (Fin n) M
  q_projection : IsStarProjection q
  q_entries : ∀ i j, q i j ∈ Q
  θ : P →⋆ₙₐ[ℂ] CStarMatrix (Fin n) (Fin n) M
  θ_unit : θ ⟨f, f_mem⟩ = q
  θ_entries : ∀ x i j, θ x i j ∈ Q
  v : Fin n → M
  nonzero : ∃ j, v j ≠ 0
  left_support : ∀ j, f * v j = v j
  partial_isometry : ∀ j, (∑ i, v i * star (v i)) * v j = v j
  right_support : ∀ j, ∑ i, v i * q i j = v j
  intertwines : ∀ x : P, ∀ j,
    (x : M) * v j = ∑ i, v i * θ x i j

/-- The nonunital ambient map is unital in the displayed q-corner. -/
theorem MatrixIntertwiner.map_right_corner
    {P : NonUnitalStarSubalgebra ℂ M} {Q : StarSubalgebra ℂ M} {n : ℕ}
    (W : MatrixIntertwiner P Q n) (x : P) : W.θ x * W.q = W.θ x := by
  rw [← W.θ_unit, ← map_mul]
  congr 1
  apply Subtype.ext
  exact W.right_unit x

theorem MatrixIntertwiner.map_left_corner
    {P : NonUnitalStarSubalgebra ℂ M} {Q : StarSubalgebra ℂ M} {n : ℕ}
    (W : MatrixIntertwiner P Q n) (x : P) : W.q * W.θ x = W.θ x := by
  rw [← W.θ_unit, ← map_mul]
  congr 1
  apply Subtype.ext
  exact W.left_unit x

/-- A witness necessarily has positive matrix size; the zero row is excluded. -/
theorem MatrixIntertwiner.size_pos
    {P : NonUnitalStarSubalgebra ℂ M} {Q : StarSubalgebra ℂ M} {n : ℕ}
    (W : MatrixIntertwiner P Q n) : 0 < n := by
  obtain ⟨j, _⟩ := W.nonzero
  exact Nat.zero_lt_of_lt j.isLt

end MatrixWitness

section Gap
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [CompleteSpace H] {Γ : Type*} [Group Γ]

/-- Gap is measured on the complement of the actual invariant submodule.
The native bounded representation and its unitarity match Dynamics D1. -/
def HasSpectralGap (ρ : ContRepresentation ℂ Γ H) : Prop :=
  TauCeti.ContRepresentation.IsUnitary ρ ∧
  ∃ (F : Finset Γ) (C : ℝ), 0 < C ∧
    ∀ ξ : H, ξ ∈ ρ.toRepresentation.invariantsᗮ →
      ‖ξ‖ ^ 2 ≤ C * ∑ g ∈ F, ‖ρ g ξ - ξ‖ ^ 2

end Gap
end FactorRigidity

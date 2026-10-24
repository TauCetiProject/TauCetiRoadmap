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
import Mathlib.Dynamics.Ergodic.Action.OfMinimal

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

/-- Additive homogeneous tracial weights use extended nonnegative values on the positive cone.
Values outside the positive cone do not enter any law. Normality and semifiniteness are
additional properties developed in the README's weight API. -/
def IsTracialWeight (M : VonNeumannAlgebra H) (T : (H →L[ℂ] H) → ℝ≥0∞) : Prop :=
  T 0 = 0 ∧
  (∀ a ∈ M, 0 ≤ a → ∀ b ∈ M, 0 ≤ b → T (a + b) = T a + T b) ∧
  (∀ r : ℝ≥0, ∀ a ∈ M, 0 ≤ a → T ((r : ℂ) • a) = (r : ℝ≥0∞) * T a) ∧
  (∀ x ∈ M, T (star x * x) = T (x * star x))

/-- The complex positive strip, with the sign convention fixed by the modular action. -/
def IsKMS (M : VonNeumannAlgebra H) (α : ℝ → (M.toStarSubalgebra ≃⋆ₐ[ℂ] M.toStarSubalgebra))
    (φ : M.toStarSubalgebra →L[ℂ] ℂ) : Prop :=
  (∀ t x, φ (α t x) = φ x) ∧
  ∀ x y : M.toStarSubalgebra, ∃ F : ℂ → ℂ,
    ContinuousOn F {z | 0 ≤ z.im ∧ z.im ≤ 1} ∧
    DifferentiableOn ℂ F {z | 0 < z.im ∧ z.im < 1} ∧
    (∃ C : ℝ, ∀ z : ℂ, 0 ≤ z.im → z.im ≤ 1 → ‖F z‖ ≤ C) ∧
    (∀ t : ℝ, F (t : ℂ) = φ (α t x * y)) ∧
    (∀ t : ℝ, F ((t : ℂ) + Complex.I) = φ (y * α t x))

/-- The initial range dimension is replaced by the semifinite trace of this final projection. -/
theorem range_projection_mem_commutant {K : Type*} [NormedAddCommGroup K]
    [InnerProductSpace ℂ K] [CompleteSpace K]
    (M : VonNeumannAlgebra H) (π : M.toStarSubalgebra →⋆ₐ[ℂ] (K →L[ℂ] K))
    (u : H →L[ℂ] K) (huIsometry : Isometry u)
    (hu : ∀ x : M.toStarSubalgebra, u.comp (x : H →L[ℂ] H) = (π x).comp u) :
    ∀ x : M.toStarSubalgebra, Commute (u.comp u.adjoint) (π x) := by
  sorry

/-- Left translation by a countable dense subgroup is Haar-ergodic, including
noncompact and nonmetrizable ambient groups. V8.DenseTranslations owns the L¹/L∞,
closed-stabilizer and restricted-Haar comparison; no finite-measure premise is added. -/
theorem ergodicSMul_dense_subgroup
    {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [T2Space G] [LocallyCompactSpace G] [MeasurableSpace G] [BorelSpace G]
    (μ : MeasureTheory.Measure G) [μ.IsHaarMeasure] [μ.Regular]
    (Γ : Subgroup G) [Countable Γ] (hd : Dense (Γ : Set G)) :
    ErgodicSMul Γ G μ := by
  sorry

end VonNeumannAlgebra

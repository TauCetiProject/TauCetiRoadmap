/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
import TauCeti.RepresentationTheory.Continuous.Integrated.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
Actions use `StarAlgEquiv`; `ContRepresentation` carries bounded operators,
so strong continuity in the group variable remains an explicit hypothesis.
The integrated form below is a vector integral, not a Bochner integral in B(H).
-/

noncomputable section
open MeasureTheory
open scoped ComplexOrder

namespace OperatorAlgebraDynamics

variable {A G H : Type*} [NonUnitalCStarAlgebra A]
  [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Point-norm continuity of an action gives joint continuity by isometry. -/
theorem continuous_action (α : G →* (A ≃⋆ₐ[ℂ] A))
    (hα : ∀ a, Continuous fun g => α g a) :
    Continuous fun p : G × A => α p.1 p.2 := by
  sorry

/-- The covariance identity is stated using composition of existing operators. -/
def IsCovariant (α : G →* (A ≃⋆ₐ[ℂ] A))
    (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (U : ContRepresentation ℂ G H) : Prop :=
  ∀ g a, (U g).comp (π a) = (π (α g a)).comp (U g)

variable [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] [T2Space G]

/-- The norm estimate does not require covariance, which is used for multiplicativity. -/
theorem exists_integratedOperator (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (U : ContRepresentation ℂ G H) (hU : TauCeti.ContRepresentation.IsUnitary U)
    (hcont : ∀ ξ, Continuous fun g => U g ξ)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) :
    ∃ T : H →L[ℂ] H,
      (∀ ξ, T ξ = ∫ g, π (f g) (U g ξ) ∂μ) ∧ ‖T‖ ≤ ∫ g, ‖f g‖ ∂μ := by
  sorry

/-- A named coefficient integrated operator with its actual vector integral. -/
def integratedOperator (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (U : ContRepresentation ℂ G H) (hU : TauCeti.ContRepresentation.IsUnitary U)
    (hcont : ∀ ξ, Continuous fun g => U g ξ)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) : H →L[ℂ] H :=
  (exists_integratedOperator π U hU hcont μ f hf).choose

theorem integratedOperator_apply (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (U : ContRepresentation ℂ G H) (hU : TauCeti.ContRepresentation.IsUnitary U)
    (hcont : ∀ ξ, Continuous fun g => U g ξ)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) (ξ : H) :
    integratedOperator π U hU hcont μ f hf ξ = ∫ g, π (f g) (U g ξ) ∂μ :=
  (exists_integratedOperator π U hU hcont μ f hf).choose_spec.1 ξ

section Scalar

variable {K : Type*} [AddGroup K] [TopologicalSpace K] [MeasurableSpace K]
  [R1Space K] [BorelSpace K]

/-- The scalar case consumes the existing native L1 integrated operator directly.
For a multiplicative group take K=Additive G and transport the tagging equivalences. -/
def scalarIntegrated (U : ContRepresentation ℂ (Multiplicative K) H)
    (hcont : ∀ ξ, Continuous fun k : K => U (Multiplicative.ofAdd k) ξ)
    (hbdd : ∃ C : ℝ, ∀ k, ‖U k‖ ≤ C)
    (μ : Measure K) [μ.InnerRegularCompactLTTop] :
    (K →₁[μ] ℂ) →L[ℂ] (H →L[ℂ] H) :=
  U.integratedOperatorL1 hcont hbdd μ

omit [CompleteSpace H] in
theorem scalarIntegrated_apply (U : ContRepresentation ℂ (Multiplicative K) H)
    (hcont : ∀ ξ, Continuous fun k : K => U (Multiplicative.ofAdd k) ξ)
    (hbdd : ∃ C : ℝ, ∀ k, ‖U k‖ ≤ C)
    (μ : Measure K) [μ.InnerRegularCompactLTTop] (f : K →₁[μ] ℂ) (ξ : H) :
    scalarIntegrated U hcont hbdd μ f ξ =
      ∫ k, f k • U (Multiplicative.ofAdd k) ξ ∂μ := rfl

end Scalar

section KMS

variable [PartialOrder A]

/-- Positive-temperature KMS states with the upper-strip convention.
The norm-one condition is on the existing positive continuous linear functional. -/
def IsKMS [StarOrderedRing A] (α : Multiplicative ℝ →* (A ≃⋆ₐ[ℂ] A)) (β : ℝ)
    (φ : A →P[ℂ] ℂ) : Prop :=
  0 < β ∧ ‖(φ : A →L[ℂ] ℂ)‖ = 1 ∧ ∀ a b : A,
    ∃ F : ℂ → ℂ,
      ContinuousOn F {z | 0 ≤ z.im ∧ z.im ≤ β} ∧
      DifferentiableOn ℂ F {z | 0 < z.im ∧ z.im < β} ∧
      Bornology.IsBounded (F '' {z | 0 ≤ z.im ∧ z.im ≤ β}) ∧
      (∀ t : ℝ, F t = φ (a * α (Multiplicative.ofAdd t) b)) ∧
      ∀ t : ℝ, F ((t : ℂ) + (β : ℂ) * Complex.I) =
        φ (α (Multiplicative.ofAdd t) b * a)

variable [StarOrderedRing A]

theorem kms_invariant (α : Multiplicative ℝ →* (A ≃⋆ₐ[ℂ] A))
    (hα : ∀ a, Continuous fun t : ℝ => α (Multiplicative.ofAdd t) a)
    {β : ℝ} {φ : A →P[ℂ] ℂ} (hφ : IsKMS α β φ) (t : ℝ) (a : A) :
    φ (α (Multiplicative.ofAdd t) a) = φ a := by
  sorry

/-- An actual entire continuation of the orbit gives the analytic KMS identity. -/
theorem kms_entire_identity (α : Multiplicative ℝ →* (A ≃⋆ₐ[ℂ] A))
    (hα : ∀ a, Continuous fun t : ℝ => α (Multiplicative.ofAdd t) a)
    {β : ℝ} {φ : A →P[ℂ] ℂ} (hφ : IsKMS α β φ)
    (a b : A) (F : ℂ → A) (hF : Differentiable ℂ F)
    (hreal : ∀ t : ℝ, F t = α (Multiplicative.ofAdd t) b) :
    φ (a * F ((β : ℂ) * Complex.I)) = φ (b * a) := by
  sorry

end KMS
end OperatorAlgebraDynamics

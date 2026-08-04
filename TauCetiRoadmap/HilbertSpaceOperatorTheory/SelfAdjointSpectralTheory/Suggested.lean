/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Closed operators and resolvents on `LinearPMap`: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

The representation decision runs through every signature: an unbounded operator is a Mathlib
`LinearPMap` (`H →ₗ.[𝕜] H`), and closedness, dense domain and self-adjointness are hypotheses
on it rather than fields of a parallel operator type.
-/

namespace TauCetiRoadmap.SelfAdjointSpectralTheory

open scoped InnerProductSpace ENNReal

/-! ## Part C -- closed operators on LinearPMap: graphs, constructions, form bounds -/

section ClosedOperators

variable {𝕜 : Type*} [RCLike 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]

/-- Perturbation of a partial map by an operator on its domain, the domain-aware
sum that keeps the carrier a `LinearPMap`.

Spec: D1. -/
def perturb (A : E →ₗ.[𝕜] E) (V : A.domain →ₗ[𝕜] E) : E →ₗ.[𝕜] E where
  domain := A.domain
  toFun := A.toFun + V

/-- Self-adjointness survives a bounded symmetric perturbation
(Kato--Rellich at relative bound zero). -/
theorem isSelfAdjoint_perturb_bounded {A : E →ₗ.[𝕜] E} (hA : IsSelfAdjoint A)
    {T : E →L[𝕜] E} (hT : IsSelfAdjoint T)
    (V : A.domain →ₗ[𝕜] E) (hV : ∀ x : A.domain, V x = T (x : E)) :
    IsSelfAdjoint (perturb A V) := sorry

/-! ### The form-bound vocabulary

Two predicates and the spectral bridges that produce them. -/

/-- Lower quadratic-form bound on a subspace. -/
def LowerFormBoundOn (A : E →L[𝕜] E) (U : Submodule 𝕜 E) (c : ℝ) : Prop :=
  ∀ x ∈ U, c * ‖x‖ ^ 2 ≤ RCLike.re ⟪A x, x⟫_𝕜

/-- Upper quadratic-form bound on a subspace. -/
def UpperFormBoundOn (A : E →L[𝕜] E) (U : Submodule 𝕜 E) (c : ℝ) : Prop :=
  ∀ x ∈ U, RCLike.re ⟪A x, x⟫_𝕜 ≤ c * ‖x‖ ^ 2

/-! #### Basic theory of the form bounds

The two directions in which a bound weakens, and the identification of the degenerate case
with Mathlib's `ContinuousLinearMap.IsPositive`. -/

/-- A lower form bound weakens as the constant decreases. -/
theorem LowerFormBoundOn.mono_const {A : E →L[𝕜] E} {U : Submodule 𝕜 E} {c c' : ℝ}
    (h : LowerFormBoundOn A U c) (hc : c' ≤ c) : LowerFormBoundOn A U c' := sorry

/-- A lower form bound restricts to a smaller subspace. -/
theorem LowerFormBoundOn.mono_subspace {A : E →L[𝕜] E} {U U' : Submodule 𝕜 E} {c : ℝ}
    (h : LowerFormBoundOn A U c) (hU : U' ≤ U) : LowerFormBoundOn A U' c := sorry

/-- An upper form bound weakens as the constant increases. -/
theorem UpperFormBoundOn.mono_const {A : E →L[𝕜] E} {U : Submodule 𝕜 E} {c c' : ℝ}
    (h : UpperFormBoundOn A U c) (hc : c ≤ c') : UpperFormBoundOn A U c' := sorry

/-- An upper form bound restricts to a smaller subspace. -/
theorem UpperFormBoundOn.mono_subspace {A : E →L[𝕜] E} {U U' : Submodule 𝕜 E} {c : ℝ}
    (h : UpperFormBoundOn A U c) (hU : U' ≤ U) : UpperFormBoundOn A U' c := sorry

/-- **The grounding to Mathlib.**  A positive operator is one with the zero lower form bound
on the whole space, so Mathlib's positivity API reaches anything stated with these. -/
theorem IsPositive.lowerFormBoundOn_top {A : E →L[𝕜] E} (hA : A.IsPositive) :
    LowerFormBoundOn A ⊤ 0 := sorry

/-- The converse, which is what makes `LowerFormBoundOn _ ⊤ 0` a generalization of Mathlib's
predicate. -/
theorem isPositive_of_lowerFormBoundOn_top {A : E →L[𝕜] E} (hsym : A.IsSymmetric)
    (h : LowerFormBoundOn A ⊤ 0) : A.IsPositive := sorry

section ComplexScalars

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]

/-- Restriction-spectrum lower bridge: a spectral half-line for the restriction
is a form bound on the subspace. -/
theorem lowerFormBoundOn_of_restriction_spectrum_subset_Ici
    {A : E →L[ℂ] E} (hA : A.IsSymmetric) {U : Submodule ℂ E}
    [U.HasOrthogonalProjection] (hU : ∀ x ∈ U, A x ∈ U) {c : ℝ}
    (hσ : spectrum ℝ (A.restrict hU) ⊆ Set.Ici c) :
    LowerFormBoundOn A U c := sorry

/-- Restriction-spectrum upper bridge, the mirror image. -/
theorem upperFormBoundOn_of_restriction_spectrum_subset_Iic
    {A : E →L[ℂ] E} (hA : A.IsSymmetric) {U : Submodule ℂ E}
    [U.HasOrthogonalProjection] (hU : ∀ x ∈ U, A x ∈ U) {c : ℝ}
    (hσ : spectrum ℝ (A.restrict hU) ⊆ Set.Iic c) :
    UpperFormBoundOn A U c := sorry

end ComplexScalars

end ClosedOperators


end TauCetiRoadmap.SelfAdjointSpectralTheory

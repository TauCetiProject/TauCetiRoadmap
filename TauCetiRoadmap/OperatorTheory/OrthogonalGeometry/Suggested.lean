/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Orthogonal geometry: Gram rigidity, coordinate isometries, and orthogonal series

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.
-/

namespace TauCetiRoadmap.OrthogonalGeometry

open Module (finrank)
open scoped InnerProductSpace

universe u v

variable {𝕜 : Type*} [RCLike 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
variable {d : ℕ}

/-! ## Coordinate isometries -/

/-- The coordinate isometry of an orthonormal family, `eⱼ ↦ vⱼ`.

Spec: D1. -/
noncomputable def familyIsometry {v : Fin d → E} (hv : Orthonormal 𝕜 v) :
    EuclideanSpace 𝕜 (Fin d) →ₗᵢ[𝕜] E := sorry

/-! ## Gram rigidity -/

/-- The isometric first isomorphism theorem: two maps out of a common module with equal
pullback inner products have canonically isometric ranges. -/
noncomputable def rangeEquivOfInnerEq {M : Type*} [AddCommGroup M] [Module 𝕜 M]
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]
    (S : M →ₗ[𝕜] E) (T : M →ₗ[𝕜] F)
    (h : ∀ x y, ⟪S x, S y⟫_𝕜 = ⟪T x, T y⟫_𝕜) :
    LinearMap.range S ≃ₗᵢ[𝕜] LinearMap.range T := sorry

/-- **Gram rigidity.** Two families with equal pairwise inner products are carried onto one
another by a linear isometry equivalence of the ambient space. -/
theorem exists_linearIsometryEquiv_map_eq_of_inner_eq [FiniteDimensional 𝕜 E]
    {ι : Type*} {φ ψ : ι → E} (h : ∀ i j, ⟪φ i, φ j⟫_𝕜 = ⟪ψ i, ψ j⟫_𝕜) :
    ∃ W : E ≃ₗᵢ[𝕜] E, ∀ i, W (φ i) = ψ i := sorry

/-! ## Orthogonal series -/

/-- A pairwise orthogonal family of vectors spans an orthogonal family of lines: the
vector-level constructor whose upstream counterpart requires unit vectors, and which the
singular expansion needs because `σᵢ • uᵢ` is not normalizable at `σᵢ = 0`. -/
theorem orthogonalFamily_of_pairwise_inner_eq_zero {ι : Type*} {f : ι → E}
    (hf : Pairwise fun i j => ⟪f i, f j⟫_𝕜 = 0) :
    OrthogonalFamily 𝕜 (fun i => (𝕜 ∙ f i : Submodule 𝕜 E))
      fun i => (𝕜 ∙ f i).subtypeₗᵢ := by
  sorry

end TauCetiRoadmap.OrthogonalGeometry

/-! ## Reducing subspaces

Both facts are about a Mathlib carrier and are written in that carrier's namespace, so that
each supports dot notation on the object it is about. -/

namespace Submodule

/-- A subspace admitting an orthogonal projection is complete when the ambient space is. -/
theorem isComplete_coe_of_hasOrthogonalProjection {𝕜 E : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E] (U : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] : IsComplete (U : Set E) := sorry

end Submodule

namespace ContinuousLinearMap

/-- Restricting a symmetric operator to an invariant subspace preserves symmetry. -/
theorem IsSymmetric.restrict_of_invariant {𝕜 E : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] {A : E →L[𝕜] E} (hA : A.IsSymmetric)
    {U : Submodule 𝕜 E} (hU : ∀ x ∈ U, A x ∈ U) : (A.restrict hU).IsSymmetric := sorry

end ContinuousLinearMap

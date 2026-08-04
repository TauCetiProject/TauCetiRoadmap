/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Principal angles and eigenvalue perturbation: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.
-/

namespace TauCetiRoadmap.MajorizationAndAngles

open Module (finrank)
open scoped InnerProductSpace

variable {𝕜 : Type*} [RCLike 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {n d : ℕ}

/-! ## Part B -- principal angles, aligned bases, and finite frames

Angles are singular values of the overlap operator, so nonnegativity, the `≤ 1`
bound, ordering and symmetry are inherited rather than re-proved by induction. -/

/-- The coordinate isometry of an orthonormal family, `eⱼ ↦ vⱼ`.

Spec: D1. -/
noncomputable def familyIsometry {v : Fin d → E} (hv : Orthonormal 𝕜 v) :
    EuclideanSpace 𝕜 (Fin d) →ₗᵢ[𝕜] E := sorry

/-- The overlap operator of two orthonormal families: the composite of one
coordinate isometry's adjoint with the other, with matrix `⟪uᵢ, vⱼ⟫`. -/
noncomputable def overlapOp {u v : Fin d → E} (hu : Orthonormal 𝕜 u)
    (hv : Orthonormal 𝕜 v) : EuclideanSpace 𝕜 (Fin d) →ₗ[𝕜] EuclideanSpace 𝕜 (Fin d) :=
  (familyIsometry hu).toLinearMap.adjoint ∘ₗ (familyIsometry hv).toLinearMap

/-- Principal-angle cosines: the singular values of the overlap operator.

Spec: D2. -/
noncomputable def cosPrincipalAngles {u v : Fin d → E} (hu : Orthonormal 𝕜 u)
    (hv : Orthonormal 𝕜 v) : ℕ →₀ ℝ :=
  (overlapOp hu hv).singularValues

/-- The squared Frobenius sine of the angle configuration. -/
noncomputable def sinThetaSq {u v : Fin d → E} (hu : Orthonormal 𝕜 u)
    (hv : Orthonormal 𝕜 v) : ℝ :=
  ∑ k : Fin d, (1 - cosPrincipalAngles hu hv (k : ℕ) ^ 2)

/-- **`‖sin Θ‖²_F = d − overlap`**: the squared Frobenius sine equals the
dimension minus the squared Frobenius norm of the overlap operator. -/
theorem sinThetaSq_eq_card_sub_sum_sq {u v : Fin d → E} (hu : Orthonormal 𝕜 u)
    (hv : Orthonormal 𝕜 v) :
    sinThetaSq hu hv = d - ∑ k : Fin d, cosPrincipalAngles hu hv (k : ℕ) ^ 2 := sorry

/-! ## Part D -- angle geometry and eigenvalue perturbation -/

/-- The cross projection `P_V P_U`, whose singular values are the principal cosines. -/
noncomputable def cosThetaMap (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : E →ₗ[𝕜] E :=
  ((V.starProjection : E →L[𝕜] E) : E →ₗ[𝕜] E) ∘ₗ
    ((U.starProjection : E →L[𝕜] E) : E →ₗ[𝕜] E)

/-- Principal-angle cosines of a pair of subspaces: the singular values of the cross
projection, sorted decreasingly and padded by zeros beyond the finite rank. -/
noncomputable def principalCosines (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : ℕ →₀ ℝ :=
  (cosThetaMap U V).singularValues

/-- The subspace-level principal cosines agree with the family-level ones on
spans: the theorem that makes the Part B definition well-named. -/
theorem principalCosines_span_eq_cosPrincipalAngles {u v : Fin d → E}
    (hu : Orthonormal 𝕜 u) (hv : Orthonormal 𝕜 v) :
    principalCosines (Submodule.span 𝕜 (Set.range u)) (Submodule.span 𝕜 (Set.range v))
      = cosPrincipalAngles hu hv := sorry

/-- **The von Neumann trace core**: for symmetric `T`, `S`, the trace of `T ∘ S`
is dominated by the sorted-eigenvalue pairing.  Proved from the rearrangement
inequality, not cited. -/
theorem sum_eigenvalues_mul_re_inner_self_le {T S : E →ₗ[𝕜] E}
    (hT : T.IsSymmetric) (hS : S.IsSymmetric) (hn : finrank 𝕜 E = n) :
    ∑ k, hT.eigenvalues hn k *
        RCLike.re ⟪hT.eigenvectorBasis hn k, S (hT.eigenvectorBasis hn k)⟫_𝕜
      ≤ ∑ i, hT.eigenvalues hn i * hS.eigenvalues hn i := sorry

/-- **Hoffman--Wielandt**: the squared Euclidean distance between the sorted
spectra of two symmetric operators is at most the squared Frobenius distance.

**Quantified over an arbitrary orthonormal basis `e`.**  Stating
the right-hand side against `hT.eigenvectorBasis` suffices to prove the inequality but is
not the invariant Frobenius statement a consumer wants.  This clean name belongs to the
arbitrary-basis version; an eigenbasis-specialized variant should be private, or qualified
`..._eigenvectorBasis` if it stays public. -/
theorem sum_sq_eigenvalues_sub_le_sum_sq_norm_apply {T S : E →ₗ[𝕜] E}
    (hT : T.IsSymmetric) (hS : S.IsSymmetric) (hn : finrank 𝕜 E = n)
    (e : OrthonormalBasis (Fin n) 𝕜 E) :
    ∑ i, (hT.eigenvalues hn i - hS.eigenvalues hn i) ^ 2
      ≤ ∑ k, ‖T (e k) - S (e k)‖ ^ 2 := sorry

/-- **Davis's eigenvalue-change lower bound**, through Birkhoff's theorem and the
permutation-orbit convex hull.

Writing `H = S − T` and reading it in `T`'s eigenbasis, `𝒞H` is the diagonal part and
`𝒞⊥H` the off-diagonal part. Under a `γ`-separated spectrum for `S` and `‖𝒞H‖_F ≤ γ/√2`,
the sorted spectra move by at least the excess of the diagonal energy over the
off-diagonal energy:

`∑ᵢ (λ'ᵢ − λᵢ)² ≥ ‖𝒞H‖²_F − ‖𝒞⊥H‖²_F`.

Below, `‖𝒞H‖²_F` is the first sum and `‖𝒞⊥H‖²_F` is written as the Pythagorean
complement `∑ᵢ λᵢ(S)² − ∑ᵢ (re ⟪vᵢ, S vᵢ⟫)²`, which avoids naming the off-diagonal
projection.

This is a **lower** bound — an upper bound on the
same left-hand side is Hoffman--Wielandt above, holds unconditionally, and uses neither
`γ` hypothesis. -/
theorem sum_sq_eigenvalues_sub_ge {T S : E →ₗ[𝕜] E}
    (hT : T.IsSymmetric) (hS : S.IsSymmetric) (hn : finrank 𝕜 E = n)
    {γ : ℝ} (hγ : 0 ≤ γ)
    (hsep : ∀ i j, i ≠ j → γ ≤ |hS.eigenvalues hn i - hS.eigenvalues hn j|)
    (hCH : ∑ i, (RCLike.re ⟪hT.eigenvectorBasis hn i, (S - T) (hT.eigenvectorBasis hn i)⟫_𝕜) ^ 2
            ≤ (γ / Real.sqrt 2) ^ 2) :
    (∑ i, (RCLike.re ⟪hT.eigenvectorBasis hn i, (S - T) (hT.eigenvectorBasis hn i)⟫_𝕜) ^ 2)
        - ((∑ i, (hS.eigenvalues hn i) ^ 2)
            - ∑ i, (RCLike.re ⟪hT.eigenvectorBasis hn i, S (hT.eigenvectorBasis hn i)⟫_𝕜) ^ 2)
      ≤ ∑ i, (hS.eigenvalues hn i - hT.eigenvalues hn i) ^ 2 := sorry

end TauCetiRoadmap.MajorizationAndAngles

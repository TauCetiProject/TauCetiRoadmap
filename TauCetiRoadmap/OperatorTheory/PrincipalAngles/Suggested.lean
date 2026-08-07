/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCetiRoadmap.OperatorTheory.OrthogonalGeometry.Suggested

/-!
# Principal angles, the projection gap, and spectral subspaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.
-/

namespace TauCetiRoadmap.PrincipalAngles

open Module (finrank)
open scoped InnerProductSpace

universe u v w

variable {𝕜 : Type*} [RCLike 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
variable {n d : ℕ}

/-! ## Part A -- principal angles, aligned bases, and finite frames

Angles are singular values of the overlap operator, so nonnegativity, the `≤ 1`
bound, ordering and symmetry are inherited rather than re-proved by induction. -/

/-- The overlap operator of two orthonormal families: the composite of one
coordinate isometry's adjoint with the other, with matrix `⟪uᵢ, vⱼ⟫`. -/
noncomputable def overlapOp {u v : Fin d → E} (hu : Orthonormal 𝕜 u)
    (hv : Orthonormal 𝕜 v) : EuclideanSpace 𝕜 (Fin d) →ₗ[𝕜] EuclideanSpace 𝕜 (Fin d) :=
  (OrthogonalGeometry.familyIsometry hu).toLinearMap.adjoint ∘ₗ
    (OrthogonalGeometry.familyIsometry hv).toLinearMap

/-- Principal-angle cosines: the singular values of the overlap operator.

Spec: D1. -/
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

/-! ## Part B -- angle geometry and eigenvalue perturbation -/

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


/-! ## The directed sine map

`sinThetaMap` is the object the Davis--Kahan estimates are stated in. It is owned here and
consumed by [`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md). -/

section SinThetaMap

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]

/-- The directed sine cross-projection `P_{Vᗮ} ∘ P_U`. -/
noncomputable def sinThetaMap (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : E →ₗ[𝕜] E :=
  ((Vᗮ.starProjection ∘L U.starProjection : E →L[𝕜] E) : E →ₗ[𝕜] E)

end SinThetaMap

section AngleGeometry

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
  [FiniteDimensional 𝕜 E]

/-- The one-sided double-angle map `2 P_{Uᗮ} P_V P_U`. -/
noncomputable def sinTwoAngleOperator (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : E →ₗ[𝕜] E :=
  (((2 : 𝕜) • (Uᗮ.starProjection ∘L V.starProjection ∘L U.starProjection) :
      E →L[𝕜] E) : E →ₗ[𝕜] E)

/-- Principal-angle sines: the singular values of the directed sine map. -/
noncomputable def principalSines (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : ℕ →₀ ℝ :=
  (sinThetaMap U V).singularValues

/-- Principal angles obtained by applying `arcsin` to the principal sines. -/
noncomputable def principalAngles (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : ℕ →₀ ℝ :=
  (principalSines U V).mapRange Real.arcsin Real.arcsin_zero

/-- Principal-angle tangents. -/
noncomputable def principalTangents (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : ℕ →₀ ℝ :=
  (principalAngles U V).mapRange Real.tan Real.tan_zero

/-- No principal angle is a quarter turn. -/
def AvoidsQuarterTurn (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : Prop :=
  ∀ i, principalAngles U V i ≠ Real.pi / 4

/-- A subspace avoids the quarter turn with itself. -/
theorem avoidsQuarterTurn_self (U : Submodule 𝕜 E) [U.HasOrthogonalProjection] :
    AvoidsQuarterTurn U U := by
  sorry

end AngleGeometry

/-! ## Part C -- the projection gap, spectral subspaces, and the separation predicates -/

section ProjectionGap

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]

/-- The sharp projector-gap identity: the gap between two subspaces is the maximum of the
two one-sided defects. An equality, with factor one and no equal-rank hypothesis.
Intended home: `Submodule`. -/
theorem norm_starProjection_sub_eq_max (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] :
    ‖(U.starProjection - V.starProjection : E →L[𝕜] E)‖ =
      max ‖(1 - V.starProjection) ∘L U.starProjection‖
          ‖(1 - U.starProjection) ∘L V.starProjection‖ := by
  sorry

end ProjectionGap

section SpectralVocabulary

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- The point spectrum of `A` carried by `U`.

Eigenvectors are Mathlib's `Module.End.HasEigenvector`. A local "eigenvector at a real
eigenvalue" predicate adds only the realness of `lam`, which the `lam : ℝ` binder here
already supplies. -/
def restrictedSpectrum (A : E →ₗ[𝕜] E) (U : Submodule 𝕜 E) : Set ℝ :=
  {lam | ∃ x, x ∈ U ∧ Module.End.HasEigenvector A (lam : 𝕜) x}

/-- **The membership characterization.**

The definition goes through `Module.End.HasEigenvector` so Mathlib's eigenspace API applies,
but proofs want `A x = lam • x`. This lemma is the intended sole conversion point, so that
the internal shape of `HasEigenvector` — which orders its conjuncts
`(mem_eigenspace, ne_zero)` — never becomes part of this definition's interface.

Together with the introduction rule below, this is the intended API of
`restrictedSpectrum`; `SpectrumIn` and the separation predicates are then stated over it. -/
theorem mem_restrictedSpectrum_iff {A : E →ₗ[𝕜] E} {U : Submodule 𝕜 E} {lam : ℝ} :
    lam ∈ restrictedSpectrum A U ↔ ∃ x ∈ U, x ≠ 0 ∧ A x = (lam : 𝕜) • x := by
  sorry

/-- The introduction rule: a nonzero eigenvector in `U` witnesses its eigenvalue. -/
theorem mem_restrictedSpectrum {A : E →ₗ[𝕜] E} {U : Submodule 𝕜 E} {lam : ℝ} {x : E}
    (hxU : x ∈ U) (hx0 : x ≠ 0) (hxEig : A x = (lam : 𝕜) • x) :
    lam ∈ restrictedSpectrum A U := by
  sorry

/-- Every eigenvalue of `A` carried by `U` lies in `Ω`. -/
def SpectrumIn (A : E →ₗ[𝕜] E) (U : Submodule 𝕜 E) (Ω : Set ℝ) : Prop :=
  restrictedSpectrum A U ⊆ Ω

/-- The canonical spectral subspace selected by a real set. -/
noncomputable def spectralSubspace (A : E →ₗ[𝕜] E) (Ω : Set ℝ) : Submodule 𝕜 E :=
  Submodule.span 𝕜 {x | ∃ lam ∈ Ω, Module.End.HasEigenvector A (lam : 𝕜) x}

/-- **The symmetric separation predicate**: two restricted spectra are at distance at least
`δ`. The weaker of the two primitives, with no ordering implied; it is what the `π/2`
theorems assume. -/
def SpectraSeparated (A : E →ₗ[𝕜] E) (U : Submodule 𝕜 E)
    (B : F →ₗ[𝕜] F) (V : Submodule 𝕜 F) (δ : ℝ) : Prop :=
  ∀ lam μ, lam ∈ restrictedSpectrum A U → μ ∈ restrictedSpectrum B V → δ ≤ |lam - μ|

/-- **The ordered separation predicate**: one restricted spectrum lies below the other with
margin `δ`. Strictly stronger than `SpectraSeparated`, and the hypothesis under which the
perturbation constants improve to one. -/
def OrderedGap (A : E →ₗ[𝕜] E) (U : Submodule 𝕜 E)
    (B : F →ₗ[𝕜] F) (V : Submodule 𝕜 F) (δ : ℝ) : Prop :=
  ∀ lam μ, lam ∈ restrictedSpectrum A U → μ ∈ restrictedSpectrum B V → lam + δ ≤ μ

/-- The conversion between the two primitives, and the reason both are named: a theorem
family stated against the weaker hypothesis applies to a caller holding the stronger one. -/
theorem SpectraSeparated.of_orderedGap {A : E →ₗ[𝕜] E} {U : Submodule 𝕜 E}
    {B : F →ₗ[𝕜] F} {V : Submodule 𝕜 F} {δ : ℝ} (hδ : 0 ≤ δ)
    (h : OrderedGap A U B V δ) : SpectraSeparated A U B V δ := by
  sorry

/-- Spectral inclusion on opposite sides of a cut gives ordered separation: the bridge that
turns a hypothesis a caller can check into the one the theorems consume. -/
theorem orderedGap_of_restrictedSpectrum_subset {A : E →ₗ[𝕜] E} {U : Submodule 𝕜 E}
    {B : F →ₗ[𝕜] F} {V : Submodule 𝕜 F} {a δ : ℝ}
    (hA : restrictedSpectrum A U ⊆ Set.Iic a)
    (hB : restrictedSpectrum B V ⊆ Set.Ici (a + δ)) :
    OrderedGap A U B V δ := by
  sorry

end SpectralVocabulary

/-- The spectral subspace selected by `Ω` carries only spectrum in `Ω`. A consumer of the
`sin Θ` theorems never supplies this as a hypothesis. -/
theorem spectrumIn_spectralSubspace {𝕜 : Type u} [RCLike 𝕜] {E : Type v}
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    (A : E →ₗ[𝕜] E) (Ω : Set ℝ) : SpectrumIn A (spectralSubspace A Ω) Ω := by
  sorry

end TauCetiRoadmap.PrincipalAngles

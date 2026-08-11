/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Polar decomposition, the functional calculus, and singular systems: target signatures

**`README.md` is the definitive and exhaustive roadmap specification.** This file gives
suggested Lean forms for selected labeled obligations. The roadmap is complete when the
obligations in `README.md` are complete. `sorry` records target signatures in this human-owned
roadmap library.

Carrier-level declarations use the corresponding Mathlib namespace. `LinearMap.operatorAbs` and
`ContinuousLinearMap.modulus` therefore support dot notation on their carriers.
-/

open Module (finrank)
open scoped InnerProductSpace

universe u v w

/-- Roadmap: PD-B01.

A partial isometry in a star monoid satisfies `u * star u * u = u`. -/
def IsPartialIsometry {R : Type*} [Monoid R] [StarMul R] (u : R) : Prop :=
  u * star u * u = u

namespace LinearMap

section PartialIsometry

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- Roadmap: PD-B02.

A rectangular linear map is a partial isometry when `u ∘ₗ u† ∘ₗ u = u`. -/
def IsPartialIsometry (u : E →ₗ[𝕜] F) : Prop :=
  u ∘ₗ u.adjoint ∘ₗ u = u

/-- Roadmap: PD-B03.

On endomorphisms, the `LinearMap` and star-monoid partial-isometry predicates agree. -/
theorem isPartialIsometry_iff_starMul {u : E →ₗ[𝕜] E} :
    u.IsPartialIsometry ↔ _root_.IsPartialIsometry u := by
  sorry

/-- Roadmap: PD-B09.

A rectangular finite-dimensional linear map is a partial isometry iff it preserves norms
on the orthogonal complement of its kernel. -/
theorem isPartialIsometry_iff_norm_map {u : E →ₗ[𝕜] F} :
    u.IsPartialIsometry ↔ ∀ x ∈ (LinearMap.ker u)ᗮ, ‖u x‖ = ‖x‖ := by
  sorry

end PartialIsometry

section FunctionalCalculus

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
variable {n : ℕ}

/-- Roadmap: PD-A11.

The finite `RCLike` self-adjoint functional calculus is the spectral sum over the sorted
orthonormal eigenbasis. -/
noncomputable def selfAdjointFunctionalCalculus
    {T : E →ₗ[𝕜] E} (hT : T.IsSymmetric) (f : ℝ → ℝ) : E →ₗ[𝕜] E :=
  ∑ i : Fin (finrank 𝕜 E),
    ((f (hT.eigenvalues rfl i) : ℝ) : 𝕜) •
      (InnerProductSpace.rankOne 𝕜 (hT.eigenvectorBasis rfl i)
        (hT.eigenvectorBasis rfl i)).toLinearMap

/-- Roadmap: PD-A17.

The finite calculus acts by `f λ` on every eigenvector with eigenvalue `λ`. -/
theorem selfAdjointFunctionalCalculus_apply_of_apply_eq_smul
    {T : E →ₗ[𝕜] E} (hT : T.IsSymmetric) (f : ℝ → ℝ)
    {x : E} {lam : ℝ} (hx : T x = (lam : 𝕜) • x) :
    selfAdjointFunctionalCalculus hT f x = ((f lam : ℝ) : 𝕜) • x := by
  sorry

/-- Roadmap: PD-A20.

The positive square root is the finite self-adjoint functional calculus at `Real.sqrt`. -/
noncomputable def IsPositive.sqrt {T : E →ₗ[𝕜] E} (hT : T.IsPositive) : E →ₗ[𝕜] E :=
  selfAdjointFunctionalCalculus hT.isSymmetric Real.sqrt

/-- Roadmap: PD-A28.

A positive endomorphism squaring to `T` equals the positive square root of `T`. -/
theorem sqrt_unique {T S : E →ₗ[𝕜] E} (hT : T.IsPositive) (hS : S.IsPositive)
    (h : S ∘ₗ S = T) : S = hT.sqrt := by
  sorry

/-- Roadmap: PD-A21.

The positive square root is positive. -/
theorem IsPositive.sqrt_isPositive {T : E →ₗ[𝕜] E} (hT : T.IsPositive) :
    hT.sqrt.IsPositive := by
  sorry

/-- Roadmap: PD-A29.

The finite-dimensional rectangular modulus is the positive square root of the source Gram
operator `A†A`. -/
noncomputable def operatorAbs (A : E →ₗ[𝕜] F) : E →ₗ[𝕜] E :=
  (LinearMap.isPositive_adjoint_comp_self A).sqrt

/-- Roadmap: PD-A30.

The finite-dimensional modulus is positive. -/
theorem isPositive_operatorAbs (A : E →ₗ[𝕜] F) : (operatorAbs A).IsPositive := by
  sorry

/-- Roadmap: PD-A31.

The finite-dimensional modulus squares to the source Gram operator. -/
theorem operatorAbs_sq (A : E →ₗ[𝕜] F) :
    operatorAbs A ∘ₗ operatorAbs A = A.adjoint ∘ₗ A := by
  sorry

/-- Roadmap: PD-A32.

The finite-dimensional modulus reproduces the pointwise norms of the original map. -/
@[simp] theorem norm_operatorAbs_apply (A : E →ₗ[𝕜] F) (x : E) :
    ‖operatorAbs A x‖ = ‖A x‖ := by
  sorry

/-- Roadmap: PD-A33.

The finite-dimensional modulus and the original rectangular map have the same kernel. -/
theorem ker_operatorAbs (A : E →ₗ[𝕜] F) : ker (operatorAbs A) = ker A := by
  sorry

/-- Roadmap: PD-A51.

Courant–Fischer expresses the `k`-th sorted eigenvalue as a sup–inf of the Rayleigh quotient
over `(k+1)`-dimensional subspaces. -/
theorem eigenvalues_eq_iSup_iInf_re_inner
    {T : E →ₗ[𝕜] E} (hT : T.IsSymmetric) (hn : finrank 𝕜 E = n) (k : Fin n) :
    hT.eigenvalues hn k =
      ⨆ V : {V : Submodule 𝕜 E // finrank 𝕜 V = (k : ℕ) + 1},
        ⨅ x : {x : E // x ∈ (V : Submodule 𝕜 E) ∧ ‖x‖ = 1},
          RCLike.re ⟪T (x : E), (x : E)⟫_𝕜 := by
  sorry

/-- Roadmap: PD-A53.

Weyl's perturbation inequality bounds each sorted eigenvalue displacement by the perturbation
operator norm. -/
theorem abs_eigenvalues_sub_le_opNorm
    {T S : E →ₗ[𝕜] E} (hT : T.IsSymmetric) (hS : S.IsSymmetric)
    (hn : finrank 𝕜 E = n) (k : Fin n) :
    |hT.eigenvalues hn k - hS.eigenvalues hn k| ≤
      ‖LinearMap.toContinuousLinearMap (T - S)‖ := by
  sorry

end FunctionalCalculus

section CalculusAgreement

variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [FiniteDimensional ℂ H] [CompleteSpace H]

/-- Roadmap: PD-A46.

Over finite-dimensional complex Hilbert spaces, the finite self-adjoint calculus agrees with
Mathlib's continuous functional calculus for continuous real-valued symbols. -/
theorem selfAdjointFunctionalCalculus_toContinuousLinearMap_eq_cfc
    {T : H →ₗ[ℂ] H} (hT : T.IsSymmetric) (f : ℝ → ℝ) (hf : Continuous f) :
    (selfAdjointFunctionalCalculus hT f).toContinuousLinearMap =
      cfc f T.toContinuousLinearMap := by
  sorry

/-- Roadmap: PD-A49.

For a finite-dimensional complex endomorphism, the transported finite modulus agrees with `CFC.abs`. -/
theorem operatorAbs_toContinuousLinearMap_eq_cfcAbs (A : H →ₗ[ℂ] H) :
    (operatorAbs A).toContinuousLinearMap = CFC.abs A.toContinuousLinearMap := by
  sorry

end CalculusAgreement

section SquarePolar

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]

/-- Roadmap: PD-B21.

Every finite-dimensional endomorphism has a unitary polar factorization `A = U ∘ₗ operatorAbs A`. -/
theorem exists_polar_decomposition_unitary (A : E →ₗ[𝕜] E) :
    ∃ U : E ≃ₗᵢ[𝕜] E, A = (U : E →ₗ[𝕜] E) ∘ₗ operatorAbs A := by
  sorry

end SquarePolar

section SingularSystem

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- Roadmap: PD-C08.

The singular-value sequence is invariant under adjoint. -/
@[simp] theorem singularValues_adjoint (A : E →ₗ[𝕜] F) :
    A.adjoint.singularValues = A.singularValues := by
  sorry

/-- Roadmap: PD-C09.

The right singular basis is the sorted orthonormal eigenbasis of `A†A`. -/
noncomputable def rightSingularBasis (A : E →ₗ[𝕜] F) :
    OrthonormalBasis (Fin (finrank 𝕜 E)) 𝕜 E :=
  A.isSymmetric_adjoint_comp_self.eigenvectorBasis rfl

/-- Roadmap: PD-C10.

The left singular vector is `σᵢ⁻¹ • A vᵢ`, using total field inversion. -/
noncomputable def leftSingularVector (A : E →ₗ[𝕜] F) (i : Fin (finrank 𝕜 E)) : F :=
  ((A.singularValues i : ℝ) : 𝕜)⁻¹ • A (rightSingularBasis A i)

/-- Roadmap: PD-C12.

The singular relation `A vᵢ = σᵢ • uᵢ` holds at every index. -/
theorem apply_rightSingularBasis_eq_smul_leftSingularVector
    (A : E →ₗ[𝕜] F) (i : Fin (finrank 𝕜 E)) :
    A (rightSingularBasis A i) =
      ((A.singularValues i : ℝ) : 𝕜) • leftSingularVector A i := by
  sorry

/-- Roadmap: PD-C17.

The map is the rank-one sum of its singular system. -/
theorem eq_sum_singularValue_rankOne (A : E →ₗ[𝕜] F) :
    A = ∑ i : Fin (finrank 𝕜 E),
      ((A.singularValues i : ℝ) : 𝕜) •
        (InnerProductSpace.rankOne 𝕜
          (leftSingularVector A i) (rightSingularBasis A i)).toLinearMap := by
  sorry

/-- Roadmap: PD-C18.

The nonzero left singular family extends to an orthonormal basis of the codomain. -/
theorem exists_orthonormalBasis_extending_leftSingularVector (A : E →ₗ[𝕜] F) :
    ∃ b : OrthonormalBasis (Fin (finrank 𝕜 F)) 𝕜 F,
      Set.range
          (fun i : {j : Fin (finrank 𝕜 E) // A.singularValues j ≠ 0} =>
            leftSingularVector A i.1) ⊆ Set.range b := by
  sorry

/-- Roadmap: PD-C19.

`IsMoorePenroseInverse A B` packages the four Penrose equations as named fields. -/
structure IsMoorePenroseInverse (A : E →ₗ[𝕜] F) (B : F →ₗ[𝕜] E) : Prop where
  /-- `B` is a generalized inverse of `A`. -/
  comp_comp_self : A ∘ₗ B ∘ₗ A = A
  /-- `A` is a generalized inverse of `B`. -/
  comp_comp_self' : B ∘ₗ A ∘ₗ B = B
  /-- The idempotent `A B` onto the range of `A` is self-adjoint. -/
  isSymmetric_comp : (A ∘ₗ B).IsSymmetric
  /-- The idempotent `B A` onto the range of `B` is self-adjoint. -/
  isSymmetric_comp' : (B ∘ₗ A).IsSymmetric

/-- Roadmap: PD-C20.

The Moore–Penrose inverse is reconstructed from the singular system. -/
noncomputable def moorePenroseInverse (A : E →ₗ[𝕜] F) : F →ₗ[𝕜] E :=
  ∑ i : Fin (finrank 𝕜 E),
    ((A.singularValues i ^ 2 : ℝ) : 𝕜)⁻¹ •
      (InnerProductSpace.rankOne 𝕜 (rightSingularBasis A i)
        (A (rightSingularBasis A i))).toLinearMap

/-- Roadmap: PD-C21.

The constructed Moore–Penrose inverse satisfies the four Penrose conditions. -/
theorem isMoorePenroseInverse_moorePenroseInverse (A : E →ₗ[𝕜] F) :
    IsMoorePenroseInverse A (moorePenroseInverse A) := by
  sorry

/-- Roadmap: PD-C23.

Every operator satisfying the Moore–Penrose predicate equals the constructed pseudoinverse. -/
theorem eq_moorePenroseInverse_of_isMoorePenroseInverse
    {A : E →ₗ[𝕜] F} {B : F →ₗ[𝕜] E} (h : IsMoorePenroseInverse A B) :
    B = moorePenroseInverse A := by
  sorry

/-- Roadmap: PD-C24.

The Moore–Penrose relation is compatible with adjoints. -/
theorem isMoorePenroseInverse_adjoint {A : E →ₗ[𝕜] F} {B : F →ₗ[𝕜] E} :
    IsMoorePenroseInverse A B ↔ IsMoorePenroseInverse A.adjoint B.adjoint := by
  sorry

end SingularSystem

section NearIsometry

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- Roadmap: PD-B43.

A real finite-dimensional near-isometry admits an isometry equivalence with sharp pointwise
error `δ`. -/
theorem exists_linearIsometryEquiv_norm_sub_apply_le
    (M : E →ₗ[ℝ] E) {δ : ℝ} (hδ : δ < 1)
    (hM : ∀ x : E, |⟪M x, M x⟫_ℝ - ⟪x, x⟫_ℝ| ≤ δ * ‖x‖ ^ 2) :
    ∃ W : E ≃ₗᵢ[ℝ] E, ∀ x : E, ‖M x - W x‖ ≤ δ * ‖x‖ := by
  sorry

end NearIsometry

end LinearMap

namespace ContinuousLinearMap

section RealContinuousFunctionalCalculus

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]

/-- Roadmap: PD-A10.

Every complete real Hilbert space carries the continuous functional calculus for bounded
self-adjoint operators. -/
instance instContinuousFunctionalCalculusRealIsSelfAdjoint :
    ContinuousFunctionalCalculus ℝ (E →L[ℝ] E) IsSelfAdjoint := by
  sorry

end RealContinuousFunctionalCalculus

section PartialIsometry

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]

/-- Roadmap: PD-B04.

A rectangular bounded operator is a partial isometry when `u ∘L u† ∘L u = u`. -/
def IsPartialIsometry (u : E →L[𝕜] F) : Prop :=
  u ∘L u.adjoint ∘L u = u

/-- Roadmap: PD-B10.

A rectangular bounded operator is a partial isometry iff it preserves norms on the
orthogonal complement of its kernel. -/
theorem isPartialIsometry_iff_norm_map {u : E →L[𝕜] F} :
    u.IsPartialIsometry ↔ ∀ x ∈ (LinearMap.ker u.toLinearMap)ᗮ, ‖u x‖ = ‖x‖ := by
  sorry

end PartialIsometry

section GramContraction

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]

/-- Roadmap: PD-B22.

A self-adjoint square root of `T†T` yields a two-sided contractive factor of `T`. -/
theorem exists_contraction_of_gram_eq {T : E →L[𝕜] F} {A : E →L[𝕜] E}
    (hA : IsSelfAdjoint A) (hgram : A ∘L A = T.adjoint ∘L T) :
    ∃ W : E →L[𝕜] F,
      ‖W‖ ≤ 1 ∧ ‖W.adjoint‖ ≤ 1 ∧ W ∘L A = T ∧ W.adjoint ∘L T = A := by
  sorry

end GramContraction

section RectangularModulus

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]

/-- Roadmap: PD-A36.

The complete-space rectangular modulus is the positive square root of `T†T` on the source space. -/
noncomputable def modulus (T : E →L[𝕜] F) : E →L[𝕜] E := by
  sorry

/-- Roadmap: PD-A37.

The complete-space modulus is positive. -/
theorem isPositive_modulus (T : E →L[𝕜] F) : (modulus T).IsPositive := by
  sorry

/-- Roadmap: PD-A38.

The complete-space modulus is self-adjoint. -/
theorem isSelfAdjoint_modulus (T : E →L[𝕜] F) : IsSelfAdjoint (modulus T) := by
  sorry

/-- Roadmap: PD-A39.

The complete-space modulus squares to the source Gram operator. -/
theorem modulus_sq (T : E →L[𝕜] F) :
    modulus T ∘L modulus T = T.adjoint ∘L T := by
  sorry

/-- Roadmap: PD-A40.

A positive symmetric square root of `T†T` equals the complete-space modulus. -/
theorem eq_modulus_of_isPositive_sq {T : E →L[𝕜] F} {A : E →L[𝕜] E}
    (hA : A.IsSymmetric) (hApos : A.IsPositive)
    (hgram : A ∘L A = T.adjoint ∘L T) : A = modulus T := by
  sorry

/-- Roadmap: PD-A41.

The complete-space modulus reproduces the pointwise norms of the original operator. -/
@[simp] theorem norm_modulus_apply (T : E →L[𝕜] F) (x : E) : ‖modulus T x‖ = ‖T x‖ := by
  sorry

/-- Roadmap: PD-B23.

The polar initial space is the closure of the range of the modulus. -/
noncomputable def polarInitial (M : E →L[𝕜] F) : Submodule 𝕜 E :=
  (LinearMap.range (modulus M).toLinearMap).topologicalClosure

/-- Roadmap: PD-B24.

The rectangular polar factor is the isometry determined on the initial space by `|M|x ↦ Mx`,
extended by zero on the orthogonal complement. -/
noncomputable def polarPartial (M : E →L[𝕜] F) : E →L[𝕜] F := by
  sorry

/-- Roadmap: PD-B25.

The rectangular polar factor is a bounded partial isometry. -/
theorem polarPartial_isPartialIsometry (M : E →L[𝕜] F) :
    (polarPartial M).IsPartialIsometry := by
  sorry

/-- Roadmap: PD-B26.

The rectangular polar factor satisfies `polarPartial M ∘L modulus M = M`. -/
theorem polarPartial_comp_modulus (M : E →L[𝕜] F) :
    polarPartial M ∘L modulus M = M := by
  sorry

/-- Roadmap: PD-B29.

The orthogonal complement of the polar initial space is the kernel of the original operator. -/
theorem polarInitial_orthogonal_eq_ker (M : E →L[𝕜] F) :
    (polarInitial M)ᗮ = LinearMap.ker M.toLinearMap := by
  sorry

end RectangularModulus

section ComplexModulusCFC

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]

/-- Roadmap: PD-A48.

Over complex Hilbert spaces, the complete-space modulus is `CFC.sqrt (T†T)`. -/
theorem modulus_eq_cfcSqrt (T : E →L[ℂ] F) :
    modulus T = CFC.sqrt (T.adjoint ∘L T) := by
  sorry

end ComplexModulusCFC

section FiniteModulusAgreement

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- Roadmap: PD-A47.

In finite dimension, the transported `LinearMap.operatorAbs` agrees with the bounded-operator
modulus. -/
theorem operatorAbs_toContinuousLinearMap_eq_modulus (A : E →ₗ[𝕜] F) :
    (LinearMap.operatorAbs A).toContinuousLinearMap =
      modulus A.toContinuousLinearMap := by
  sorry

end FiniteModulusAgreement

section SingularValueAccessor

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- Roadmap: PD-C01.

The bounded-operator singular-value accessor is `T.toLinearMap.singularValues`. -/
noncomputable def singularValues (T : E →L[𝕜] F) : ℕ →₀ ℝ :=
  T.toLinearMap.singularValues

/-- Roadmap: PD-C02.

The bounded-operator accessor agrees with `T.toLinearMap.singularValues`. -/
@[simp] theorem singularValues_toLinearMap (T : E →L[𝕜] F) :
    T.toLinearMap.singularValues = singularValues T := rfl

end SingularValueAccessor

end ContinuousLinearMap

namespace TauCetiRoadmap.PolarDecomposition

/-! ## Part B — the near-isometry factorization and Davis's intertwining unitary -/

section Intertwining

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {ι : Type*} [Fintype ι]

/-- Roadmap: PD-B46, PD-B47.

Davis's non-degeneracy condition yields a unitary intertwining the two complete orthogonal
projection families blockwise. -/
theorem exists_linearIsometryEquiv_comp_eq_comp
    {P P' : ι → E →ₗ[𝕜] E}
    (hP : ∀ j, (P j).IsSymmetric) (hP' : ∀ j, (P' j).IsSymmetric)
    (hPidem : ∀ j, P j ∘ₗ P j = P j) (hP'idem : ∀ j, P' j ∘ₗ P' j = P' j)
    (hPsum : ∑ j, P j = LinearMap.id) (hP'sum : ∑ j, P' j = LinearMap.id)
    (hnondeg : ∀ j, ∀ x ∈ LinearMap.range (P j), P' j x = 0 → x = 0) :
    ∃ U : E ≃ₗᵢ[𝕜] E,
      ∀ j, (U : E →ₗ[𝕜] E) ∘ₗ P j = P' j ∘ₗ (U : E →ₗ[𝕜] E) := by
  sorry

end Intertwining


end TauCetiRoadmap.PolarDecomposition

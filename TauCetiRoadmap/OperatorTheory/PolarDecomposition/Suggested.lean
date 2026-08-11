/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Polar decomposition, the functional calculus, and singular systems: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

Declarations that are facts about a Mathlib carrier are written in that carrier's
namespace, because the namespace is part of the proposal: `LinearMap.operatorAbs` and
`ContinuousLinearMap.modulus` are the carrier-level modulus constructions of `README.md`
Part A, each supporting dot notation on the object it is about. Everything else is written in this file's own
namespace, with its intended home named in the docstring.
-/

open Module (finrank)
open scoped InnerProductSpace

universe u v w

/-- A **partial isometry** in a star monoid: `u u⋆ u = u`. This abstraction covers
endomorphisms and C⋆-algebra elements. Rectangular maps require carrier-specific predicates
using typed composition, because taking the adjoint changes source and target. -/
def IsPartialIsometry {R : Type*} [Monoid R] [StarMul R] (u : R) : Prop :=
  u * star u * u = u

namespace LinearMap

section PartialIsometry

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- A rectangular linear map is a partial isometry when the typed equation
`u u† u = u` holds. This is the same equation as the star-monoid predicate, but it
cannot be expressed as multiplication in one carrier when source and target differ. -/
def IsPartialIsometry (u : E →ₗ[𝕜] F) : Prop :=
  u ∘ₗ u.adjoint ∘ₗ u = u

/-- On endomorphisms, the carrier-specific and star-monoid predicates agree. -/
theorem isPartialIsometry_iff_starMul {u : E →ₗ[𝕜] E} :
    u.IsPartialIsometry ↔ _root_.IsPartialIsometry u := by
  sorry

/-- Operator characterization: a partial isometry is exactly a map that is norm-preserving
on the orthogonal complement of its kernel (Conway VI.3.2).

Stated **rectangularly**, for `u : E →ₗ[𝕜] F`; the square case is the specialization.  The star-monoid proof does not reach here --
`star u` would be an `F →ₗ[𝕜] E` -- so the argument is the decomposition one: `u⋆ u` is the
orthogonal projection onto `(ker u)ᗮ`. -/
theorem isPartialIsometry_iff_norm_map {u : E →ₗ[𝕜] F} :
    u.IsPartialIsometry ↔ ∀ x ∈ (LinearMap.ker u)ᗮ, ‖u x‖ = ‖x‖ := by
  sorry

end PartialIsometry

section FunctionalCalculus

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
variable {n : ℕ}

/-- Apply a real function to the spectrum of a symmetric endomorphism: the finite `RCLike`
counterpart of the continuous functional calculus, which Mathlib registers only over `ℂ`. -/
noncomputable def selfAdjointFunctionalCalculus
    {T : E →ₗ[𝕜] E} (hT : T.IsSymmetric) (f : ℝ → ℝ) : E →ₗ[𝕜] E :=
  ∑ i : Fin (finrank 𝕜 E),
    ((f (hT.eigenvalues rfl i) : ℝ) : 𝕜) •
      (InnerProductSpace.rankOne 𝕜 (hT.eigenvectorBasis rfl i)
        (hT.eigenvectorBasis rfl i)).toLinearMap

/-- The calculus on an arbitrary eigenvector. Unlike the eigenbasis lemma this form is
stable on repeated eigenspaces, and it is what makes the commutant property available. -/
theorem selfAdjointFunctionalCalculus_apply_of_apply_eq_smul
    {T : E →ₗ[𝕜] E} (hT : T.IsSymmetric) (f : ℝ → ℝ)
    {x : E} {lam : ℝ} (hx : T x = (lam : 𝕜) • x) :
    selfAdjointFunctionalCalculus hT f x = ((f lam : ℝ) : 𝕜) • x := by
  sorry

/-- The positive square root: the calculus at `Real.sqrt`, by definition rather than by a
bridging lemma. -/
noncomputable def IsPositive.sqrt {T : E →ₗ[𝕜] E} (hT : T.IsPositive) : E →ₗ[𝕜] E :=
  selfAdjointFunctionalCalculus hT.isSymmetric Real.sqrt

/-- Uniqueness: any positive operator squaring to `T` is the square root
(Horn–Johnson 7.2.6). -/
theorem sqrt_unique {T S : E →ₗ[𝕜] E} (hT : T.IsPositive) (hS : S.IsPositive)
    (h : S ∘ₗ S = T) : S = hT.sqrt := by
  sorry

/-- The positive square root is positive. -/
theorem IsPositive.sqrt_isPositive {T : E →ₗ[𝕜] E} (hT : T.IsPositive) :
    hT.sqrt.IsPositive := by
  sorry

/-- **The finite-dimensional rectangular modulus** `|A| = (A†A)^(1/2)`, over `RCLike`.
The modulus acts on the source even when `A : E →ₗ[𝕜] F` is rectangular. -/
noncomputable def operatorAbs (A : E →ₗ[𝕜] F) : E →ₗ[𝕜] E :=
  (LinearMap.isPositive_adjoint_comp_self A).sqrt

/-- The finite-dimensional modulus is positive. -/
theorem isPositive_operatorAbs (A : E →ₗ[𝕜] F) : (operatorAbs A).IsPositive := by
  sorry

/-- The finite-dimensional modulus squares to the Gram operator. -/
theorem operatorAbs_sq (A : E →ₗ[𝕜] F) :
    operatorAbs A ∘ₗ operatorAbs A = A.adjoint ∘ₗ A := by
  sorry

/-- The polar norm identity `‖|A| x‖ = ‖A x‖`. -/
@[simp] theorem norm_operatorAbs_apply (A : E →ₗ[𝕜] F) (x : E) :
    ‖operatorAbs A x‖ = ‖A x‖ := by
  sorry

/-- The modulus has exactly the kernel of the original rectangular map. -/
theorem ker_operatorAbs (A : E →ₗ[𝕜] F) : ker (operatorAbs A) = ker A := by
  sorry

/-- Courant–Fischer min–max equality (Horn–Johnson 4.2.6). -/
theorem eigenvalues_eq_iSup_iInf_re_inner
    {T : E →ₗ[𝕜] E} (hT : T.IsSymmetric) (hn : finrank 𝕜 E = n) (k : Fin n) :
    hT.eigenvalues hn k =
      ⨆ V : {V : Submodule 𝕜 E // finrank 𝕜 V = (k : ℕ) + 1},
        ⨅ x : {x : E // x ∈ (V : Submodule 𝕜 E) ∧ ‖x‖ = 1},
          RCLike.re ⟪T (x : E), (x : E)⟫_𝕜 := by
  sorry

/-- Weyl's perturbation inequality: a symmetric perturbation moves each sorted eigenvalue
by at most the operator norm. -/
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

/-- **The two calculi agree.** Over `ℂ` the finite `RCLike` calculus computes the same
operator as Mathlib's continuous functional calculus, so a consumer may move between them
freely. -/
theorem selfAdjointFunctionalCalculus_toContinuousLinearMap_eq_cfc
    {T : H →ₗ[ℂ] H} (hT : T.IsSymmetric) (f : ℝ → ℝ) (hf : Continuous f) :
    (selfAdjointFunctionalCalculus hT f).toContinuousLinearMap =
      cfc f T.toContinuousLinearMap := by
  sorry

/-- In the finite-dimensional complex endomorphism case, `operatorAbs` transported to
bounded operators agrees with Mathlib's CFC absolute value. -/
theorem operatorAbs_toContinuousLinearMap_eq_cfcAbs (A : H →ₗ[ℂ] H) :
    (operatorAbs A).toContinuousLinearMap = CFC.abs A.toContinuousLinearMap := by
  sorry

end CalculusAgreement

section SquarePolar

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]

/-- Polar decomposition with a genuine unitary factor, available for every endomorphism of
a finite-dimensional space (Horn–Johnson 7.3.1; the factor is not unique when `A` is
singular). -/
theorem exists_polar_decomposition_unitary (A : E →ₗ[𝕜] E) :
    ∃ U : E ≃ₗᵢ[𝕜] E, A = (U : E →ₗ[𝕜] E) ∘ₗ operatorAbs A := by
  sorry

end SquarePolar

section SingularSystem

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- Adjoint invariance of the singular values. Both sequences vanish past the common rank,
so no relation between the two dimensions is required; the proof is the rectangular
spectral bridge between `A⋆A` and `AA⋆`. -/
@[simp] theorem singularValues_adjoint (A : E →ₗ[𝕜] F) :
    A.adjoint.singularValues = A.singularValues := by
  sorry

/-- The right singular basis: the sorted orthonormal eigenbasis of `A⋆A`. -/
noncomputable def rightSingularBasis (A : E →ₗ[𝕜] F) :
    OrthonormalBasis (Fin (finrank 𝕜 E)) 𝕜 E :=
  A.isSymmetric_adjoint_comp_self.eigenvectorBasis rfl

/-- The left singular vector `σᵢ⁻¹ • A vᵢ`, total through field inversion, so it is zero at
a zero singular value; orthonormality is asserted only on the subtype of indices with
nonzero singular value. -/
noncomputable def leftSingularVector (A : E →ₗ[𝕜] F) (i : Fin (finrank 𝕜 E)) : F :=
  ((A.singularValues i : ℝ) : 𝕜)⁻¹ • A (rightSingularBasis A i)

/-- The singular relation `A vᵢ = σᵢ • uᵢ`, including the zero case. -/
theorem apply_rightSingularBasis_eq_smul_leftSingularVector
    (A : E →ₗ[𝕜] F) (i : Fin (finrank 𝕜 E)) :
    A (rightSingularBasis A i) =
      ((A.singularValues i : ℝ) : 𝕜) • leftSingularVector A i := by
  sorry

/-- The intrinsic rank-one singular expansion of `A`. -/
theorem eq_sum_singularValue_rankOne (A : E →ₗ[𝕜] F) :
    A = ∑ i : Fin (finrank 𝕜 E),
      ((A.singularValues i : ℝ) : 𝕜) •
        (InnerProductSpace.rankOne 𝕜
          (leftSingularVector A i) (rightSingularBasis A i)).toLinearMap := by
  sorry

/-- The nonzero left singular family extends to an orthonormal basis of the codomain — the
statement downstream consumers need, and not automatic for a rectangular map. -/
theorem exists_orthonormalBasis_extending_leftSingularVector (A : E →ₗ[𝕜] F) :
    ∃ b : OrthonormalBasis (Fin (finrank 𝕜 F)) 𝕜 F,
      Set.range
          (fun i : {j : Fin (finrank 𝕜 E) // A.singularValues j ≠ 0} =>
            leftSingularVector A i.1) ⊆ Set.range b := by
  sorry

/-- **`B` is a Moore–Penrose inverse of `A`**: Penrose's four conditions, as a predicate
with named accessors. -/
structure IsMoorePenroseInverse (A : E →ₗ[𝕜] F) (B : F →ₗ[𝕜] E) : Prop where
  /-- `B` is a generalized inverse of `A`. -/
  comp_comp_self : A ∘ₗ B ∘ₗ A = A
  /-- `A` is a generalized inverse of `B`. -/
  comp_comp_self' : B ∘ₗ A ∘ₗ B = B
  /-- The idempotent `A B` onto the range of `A` is self-adjoint. -/
  isSymmetric_comp : (A ∘ₗ B).IsSymmetric
  /-- The idempotent `B A` onto the range of `B` is self-adjoint. -/
  isSymmetric_comp' : (B ∘ₗ A).IsSymmetric

/-- The Moore–Penrose inverse, reconstructed from the singular system; zero singular values
contribute zero through total field inversion. -/
noncomputable def moorePenroseInverse (A : E →ₗ[𝕜] F) : F →ₗ[𝕜] E :=
  ∑ i : Fin (finrank 𝕜 E),
    ((A.singularValues i ^ 2 : ℝ) : 𝕜)⁻¹ •
      (InnerProductSpace.rankOne 𝕜 (rightSingularBasis A i)
        (A (rightSingularBasis A i))).toLinearMap

/-- The construction satisfies the four conditions, so a Moore–Penrose inverse exists. -/
theorem isMoorePenroseInverse_moorePenroseInverse (A : E →ₗ[𝕜] F) :
    IsMoorePenroseInverse A (moorePenroseInverse A) := by
  sorry

/-- **The characterization** (Penrose 1955): anything satisfying the four conditions *is*
the constructed pseudoinverse, and uniqueness follows. -/
theorem eq_moorePenroseInverse_of_isMoorePenroseInverse
    {A : E →ₗ[𝕜] F} {B : F →ₗ[𝕜] E} (h : IsMoorePenroseInverse A B) :
    B = moorePenroseInverse A := by
  sorry

/-- The relation is compatible with adjoints. -/
theorem isMoorePenroseInverse_adjoint {A : E →ₗ[𝕜] F} {B : F →ₗ[𝕜] E} :
    IsMoorePenroseInverse A B ↔ IsMoorePenroseInverse A.adjoint B.adjoint := by
  sorry

end SingularSystem

section NearIsometry

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- **The near-isometry polar factorization.** A real map whose quadratic form is uniformly
`δ`-close to the identity factors as an isometry equivalence times the positive square root
of its Gram operator, and the square root is uniformly close to the identity — hence
`‖M − W‖ ≤ 2δ` for `δ ≤ 1/2`. -/
theorem exists_linearIsometryEquiv_norm_sub_le
    (M : E →ₗ[ℝ] E) {δ : ℝ} (hδ : 0 ≤ δ) (hδ1 : δ ≤ 1 / 2)
    (hM : ∀ x : E, |⟪M x, M x⟫_ℝ - ⟪x, x⟫_ℝ| ≤ δ * ‖x‖ ^ 2) :
    ∃ W : E ≃ₗᵢ[ℝ] E,
      ‖LinearMap.toContinuousLinearMap (M - (W : E →ₗ[ℝ] E))‖ ≤ 2 * δ := by
  sorry

end NearIsometry

end LinearMap

namespace ContinuousLinearMap

section RealContinuousFunctionalCalculus

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]

/-- The continuous functional calculus over `ℝ` for bounded self-adjoint operators on every
complete real Hilbert space. -/
instance instContinuousFunctionalCalculusRealIsSelfAdjoint :
    ContinuousFunctionalCalculus ℝ (E →L[ℝ] E) IsSelfAdjoint := by
  sorry

end RealContinuousFunctionalCalculus

section PartialIsometry

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]

/-- A rectangular bounded operator is a partial isometry when `u u† u = u`, expressed
with typed composition. -/
def IsPartialIsometry (u : E →L[𝕜] F) : Prop :=
  u ∘L u.adjoint ∘L u = u

/-- The geometric characterization of a rectangular bounded partial isometry. -/
theorem isPartialIsometry_iff_norm_map {u : E →L[𝕜] F} :
    u.IsPartialIsometry ↔ ∀ x ∈ (LinearMap.ker u.toLinearMap)ᗮ, ‖u x‖ = ‖x‖ := by
  sorry

end PartialIsometry

section GramContraction

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]

/-- **Scalar-generic polar factorization from a Gram square root.** If a
self-adjoint bounded operator `A` squares to the Gram operator `T†T`, then `T`
factors through `A` by a contraction whose adjoint is also contractive. The result is
dimension-free over every `RCLike` field. The bounded real and complex continuous functional
calculi supply the canonical square-root choice `A = modulus T`. -/
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

/-- **The canonical rectangular modulus** `|T| = (T†T)^(1/2)`, on a real or complex
Hilbert space of arbitrary dimension. The bounded real and complex continuous functional
calculi supply the square-root construction. -/
noncomputable def modulus (T : E →L[𝕜] F) : E →L[𝕜] E := by
  sorry

/-- The canonical modulus is positive. -/
theorem isPositive_modulus (T : E →L[𝕜] F) : (modulus T).IsPositive := by
  sorry

/-- The modulus is self-adjoint. -/
theorem isSelfAdjoint_modulus (T : E →L[𝕜] F) : IsSelfAdjoint (modulus T) := by
  sorry

/-- The modulus is the positive Gram square root. -/
theorem modulus_sq (T : E →L[𝕜] F) :
    modulus T ∘L modulus T = T.adjoint ∘L T := by
  sorry

/-- The modulus is the unique positive symmetric square root of the Gram operator. -/
theorem eq_modulus_of_isPositive_sq {T : E →L[𝕜] F} {A : E →L[𝕜] E}
    (hA : A.IsSymmetric) (hApos : A.IsPositive)
    (hgram : A ∘L A = T.adjoint ∘L T) : A = modulus T := by
  sorry

/-- The modulus reproduces the norms of the original operator pointwise. -/
@[simp] theorem norm_modulus_apply (T : E →L[𝕜] F) (x : E) : ‖modulus T x‖ = ‖T x‖ := by
  sorry

/-- The initial space of the rectangular polar decomposition: the closure of the range of
the modulus. -/
noncomputable def polarInitial (M : E →L[𝕜] F) : Submodule 𝕜 E :=
  (LinearMap.range (modulus M).toLinearMap).topologicalClosure

/-- The canonical polar partial isometry: isometric on the initial space and zero on its
orthogonal complement. -/
noncomputable def polarPartial (M : E →L[𝕜] F) : E →L[𝕜] F := by
  sorry

/-- The polar factor is a rectangular partial isometry. -/
theorem polarPartial_isPartialIsometry (M : E →L[𝕜] F) :
    (polarPartial M).IsPartialIsometry := by
  sorry

/-- The rectangular polar decomposition `M = W |M|`. -/
theorem polarPartial_comp_modulus (M : E →L[𝕜] F) :
    polarPartial M ∘L modulus M = M := by
  sorry

/-- The initial space is exactly the orthogonal complement of the kernel. -/
theorem polarInitial_orthogonal_eq_ker (M : E →L[𝕜] F) :
    (polarInitial M)ᗮ = LinearMap.ker M.toLinearMap := by
  sorry

end RectangularModulus

section ComplexModulusCFC

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]

/-- Over complex Hilbert spaces, the scalar-generic modulus is the CFC positive square root
of the Gram operator. -/
theorem modulus_eq_cfcSqrt (T : E →L[ℂ] F) :
    modulus T = CFC.sqrt (T.adjoint ∘L T) := by
  sorry

end ComplexModulusCFC

section FiniteModulusAgreement

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- The finite-dimensional linear-map modulus and the complete-space bounded-operator modulus
agree under the canonical coercions. -/
theorem operatorAbs_toContinuousLinearMap_eq_modulus (A : E →ₗ[𝕜] F) :
    (LinearMap.operatorAbs A).toContinuousLinearMap =
      modulus A.toContinuousLinearMap := by
  sorry

end FiniteModulusAgreement

section SingularValueAccessor

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- The singular values of a bounded operator: the accessor that keeps
`T.toLinearMap.singularValues` out of public statements about operator norms. It carries no
mathematical content of its own — every lemma about it should be a one-line delegation to
the `LinearMap` level — but it fixes the spelling that approximation numbers, Ky Fan norms
and Eckart–Young are stated in. -/
noncomputable def singularValues (T : E →L[𝕜] F) : ℕ →₀ ℝ :=
  T.toLinearMap.singularValues

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

/-- **Davis's intertwining unitary.** Two complete orthogonal families of projections whose
block polar factors are nondegenerate are conjugate by a single unitary. The nondegeneracy
hypothesis is stated in the form the construction uses: on the range of each `P j`, the
block map `P' j` is injective. -/
theorem exists_linearIsometryEquiv_comp_eq_comp
    {P P' : ι → E →ₗ[𝕜] E}
    (hP : ∀ j, (P j).IsSymmetric) (hP' : ∀ j, (P' j).IsSymmetric)
    (hPidem : ∀ j, P j ∘ₗ P j = P j) (hP'idem : ∀ j, P' j ∘ₗ P' j = P' j)
    (hPsum : ∑ j, P j = LinearMap.id) (hP'sum : ∑ j, P' j = LinearMap.id)
    (hnondeg : ∀ j, ∀ x ∈ LinearMap.range (P j), P' j x = 0 → x = 0) :
    ∃ U : E ≃ₗᵢ[𝕜] E, ∀ j, (U : E →ₗ[𝕜] E) ∘ₗ P j = P' j ∘ₗ (U : E →ₗ[𝕜] E) := by
  sorry

end Intertwining


end TauCetiRoadmap.PolarDecomposition

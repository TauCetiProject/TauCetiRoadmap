/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Hilbert-space operator foundations: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

Declarations that are facts about a Mathlib carrier are written in that carrier's
namespace, because the namespace is part of the proposal: `LinearMap.operatorAbs` and
`ContinuousLinearMap.modulus` are the two moduli of `README.md` Part A, each supporting dot
notation on the object it is about. Everything else is written in this file's own
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

end PartialIsometry

section FunctionalCalculus

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
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

/-- **The square modulus** `|A| = (A⋆A)^(1/2)`, over `RCLike` and in finite dimension.

`operatorAbs` is a deliberate placeholder: a bare `abs` collides with the lattice absolute
value denoted by `|·|`, `modulus` splits the name from its rectangular counterpart, and
`README.md` leaves the choice to review. The token appears nowhere else, so adopting the
settled name is one mechanical replacement.

The rectangular complex counterpart is `ContinuousLinearMap.modulus`, and
`operatorAbs_toContinuousLinearMap_eq_cfcAbs` proves the two agree where both apply. -/
noncomputable def operatorAbs (A : E →ₗ[𝕜] E) : E →ₗ[𝕜] E :=
  (LinearMap.isPositive_adjoint_comp_self A).sqrt

/-- The polar norm identity `‖|A| x‖ = ‖A x‖`, the seed of the isometry route to the polar
decomposition (Conway VI.3.9). -/
@[simp] theorem norm_operatorAbs_apply (A : E →ₗ[𝕜] E) (x : E) : ‖operatorAbs A x‖ = ‖A x‖ := by
  sorry

/-- `ker |A| = ker A`; with `range |A| = (ker A)ᗮ` this is what identifies the initial
space of the polar factor. -/
theorem ker_operatorAbs (A : E →ₗ[𝕜] E) : ker (operatorAbs A) = ker A := by
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
freely. This is a target, not a remark: without it a reader cannot tell whether the two
developments describe one object. -/
theorem selfAdjointFunctionalCalculus_toContinuousLinearMap_eq_cfc
    {T : H →ₗ[ℂ] H} (hT : T.IsSymmetric) (f : ℝ → ℝ) (hf : Continuous f) :
    (selfAdjointFunctionalCalculus hT f).toContinuousLinearMap =
      cfc f T.toContinuousLinearMap := by
  sorry

/-- The two moduli agree wherever both are defined: the `RCLike` construction, transported
across the `LinearMap ↔ ContinuousLinearMap` adjoint bridge, is `CFC.abs`. -/
theorem operatorAbs_toContinuousLinearMap_eq_cfcAbs (A : H →ₗ[ℂ] H) :
    (operatorAbs A).toContinuousLinearMap = CFC.abs A.toContinuousLinearMap := by
  sorry

end CalculusAgreement

section SquarePolar

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]

/-- Operator characterization: a partial isometry is exactly a map that is norm-preserving
on the orthogonal complement of its kernel (Conway VI.3.2). -/
theorem isPartialIsometry_iff_norm_map {u : E →ₗ[𝕜] E} :
    u.IsPartialIsometry ↔ ∀ x ∈ (LinearMap.ker u)ᗮ, ‖u x‖ = ‖x‖ := by
  sorry

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
with named accessors rather than four anonymous hypotheses. Packaging them is what lets the
uniqueness theorem below read as *the Moore–Penrose inverse is unique*, and gives the
relation somewhere to carry its own theory — symmetry under `A ↔ B`, transport along
adjoints, invariance under unitary conjugation. -/
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
the constructed pseudoinverse, and uniqueness follows. Without this converse the
construction is merely *a* generalized inverse; with it, the name is earned. -/
theorem eq_moorePenroseInverse_of_isMoorePenroseInverse
    {A : E →ₗ[𝕜] F} {B : F →ₗ[𝕜] E} (h : IsMoorePenroseInverse A B) :
    B = moorePenroseInverse A := by
  sorry

/-- The relation is compatible with adjoints. -/
theorem isMoorePenroseInverse_adjoint {A : E →ₗ[𝕜] F} {B : F →ₗ[𝕜] E} :
    IsMoorePenroseInverse A B ↔ IsMoorePenroseInverse A.adjoint B.adjoint := by
  sorry

end SingularSystem

section GramRigidity

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]

/-- Isometric first isomorphism theorem: two linear maps out of a common module with equal
pullback inner products have canonically isometric ranges, by `S x ↦ T x`. No finiteness is
assumed and the ambient spaces may differ. -/
noncomputable def rangeEquivOfInnerEq {M : Type*} [AddCommGroup M] [Module 𝕜 M]
    (S : M →ₗ[𝕜] E) (T : M →ₗ[𝕜] F)
    (h : ∀ x y, ⟪S x, S y⟫_𝕜 = ⟪T x, T y⟫_𝕜) :
    LinearMap.range S ≃ₗᵢ[𝕜] LinearMap.range T :=
  sorry

/-- Gram rigidity: families with equal pairwise inner products differ by a linear isometry
equivalence of the ambient space. -/
theorem exists_linearIsometryEquiv_map_eq_of_inner_eq {ι : Type*}
    [FiniteDimensional 𝕜 E] {φ ψ : ι → E}
    (h : ∀ i j, ⟪φ i, φ j⟫_𝕜 = ⟪ψ i, ψ j⟫_𝕜) :
    ∃ W : E ≃ₗᵢ[𝕜] E, ∀ i, W (φ i) = ψ i := by
  sorry

end GramRigidity

end LinearMap

namespace ContinuousLinearMap

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

section RectangularModulus

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]

/-- **The rectangular modulus** `|T| = (T⋆T)^(1/2)`, through Mathlib's continuous
functional calculus: complex and rectangular where `LinearMap.operatorAbs` is `RCLike` and
square, and defined on complete spaces of any dimension. -/
noncomputable def modulus (T : E →L[ℂ] F) : E →L[ℂ] E :=
  CFC.sqrt (T.adjoint ∘L T)

/-- The modulus reproduces the norms of the original operator pointwise. -/
@[simp] theorem norm_modulus_apply (T : E →L[ℂ] F) (x : E) : ‖modulus T x‖ = ‖T x‖ := by
  sorry

/-- The initial space of the rectangular polar decomposition: the closure of the range of
the modulus. -/
noncomputable def polarInitial (M : E →L[ℂ] F) : Submodule ℂ E :=
  (LinearMap.range (modulus M).toLinearMap).topologicalClosure

/-- The polar partial isometry of a bounded rectangular complex operator: isometric on the
initial space, zero on its orthogonal complement. -/
noncomputable def polarPartial (M : E →L[ℂ] F) : E →L[ℂ] F :=
  sorry

/-- The polar factor is a rectangular partial isometry. -/
theorem polarPartial_isPartialIsometry (M : E →L[ℂ] F) :
    (polarPartial M).IsPartialIsometry := by
  sorry

/-- The rectangular polar decomposition `M = W |M|` (Conway VI.3.9). -/
theorem polarPartial_comp_modulus (M : E →L[ℂ] F) :
    polarPartial M ∘L modulus M = M := by
  sorry

/-- The initial space is exactly the orthogonal complement of the kernel: the content of
the general decomposition, proved rather than taken as the definition. -/
theorem polarInitial_orthogonal_eq_ker (M : E →L[ℂ] F) :
    (polarInitial M)ᗮ = LinearMap.ker M.toLinearMap := by
  sorry

end RectangularModulus

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

namespace TauCetiRoadmap.HilbertSpaceOperatorFoundations

/-! ## Part B — the near-isometry factorization and Davis's intertwining unitary -/

section NearIsometry

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- **The near-isometry polar factorization.** A real map whose quadratic form is uniformly
`δ`-close to the identity factors as an isometry equivalence times the positive square root
of its Gram operator, and the square root is uniformly close to the identity — hence
`‖M − W‖ ≤ 2δ` for `δ ≤ 1/2`. This is the form a perturbation argument can use and the
exact decompositions cannot give. Intended home: `LinearMap`. -/
theorem exists_linearIsometryEquiv_norm_sub_le
    (M : E →ₗ[ℝ] E) {δ : ℝ} (hδ : 0 ≤ δ) (hδ1 : δ ≤ 1 / 2)
    (hM : ∀ x : E, |⟪M x, M x⟫_ℝ - ⟪x, x⟫_ℝ| ≤ δ * ‖x‖ ^ 2) :
    ∃ W : E ≃ₗᵢ[ℝ] E,
      ‖LinearMap.toContinuousLinearMap (M - (W : E →ₗ[ℝ] E))‖ ≤ 2 * δ := by
  sorry

end NearIsometry

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

/-! ## Part D — projection geometry, spectral subspaces, and the separation predicates -/

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

/-- A pairwise orthogonal family of vectors spans an orthogonal family of lines: the
vector-level constructor whose upstream counterpart requires unit vectors, and which the
singular expansion needs because `σᵢ • uᵢ` is not normalizable at `σᵢ = 0`. -/
theorem orthogonalFamily_of_pairwise_inner_eq_zero {ι : Type*} {f : ι → E}
    (hf : Pairwise fun i j => ⟪f i, f j⟫_𝕜 = 0) :
    OrthogonalFamily 𝕜 (fun i => (𝕜 ∙ f i : Submodule 𝕜 E))
      fun i => (𝕜 ∙ f i).subtypeₗᵢ := by
  sorry

end ProjectionGap

section SpectralVocabulary

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- A nonzero eigenvector of an operator at a real eigenvalue. -/
def IsEigenvectorAt (A : E →ₗ[𝕜] E) (lam : ℝ) (x : E) : Prop :=
  x ≠ 0 ∧ A x = (lam : 𝕜) • x

/-- The point spectrum of `A` carried by `U`. -/
def restrictedSpectrum (A : E →ₗ[𝕜] E) (U : Submodule 𝕜 E) : Set ℝ :=
  {lam | ∃ x, x ∈ U ∧ IsEigenvectorAt A lam x}

/-- Every eigenvalue of `A` carried by `U` lies in `Ω`. -/
def SpectrumIn (A : E →ₗ[𝕜] E) (U : Submodule 𝕜 E) (Ω : Set ℝ) : Prop :=
  restrictedSpectrum A U ⊆ Ω

/-- The canonical spectral subspace selected by a real set. -/
noncomputable def spectralSubspace (A : E →ₗ[𝕜] E) (Ω : Set ℝ) : Submodule 𝕜 E :=
  Submodule.span 𝕜 {x | ∃ lam ∈ Ω, IsEigenvectorAt A lam x}

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

end TauCetiRoadmap.HilbertSpaceOperatorFoundations

/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.InnerProductSpace.Gram.Rigidity
import TauCeti.Analysis.InnerProductSpace.InvariantSubspace
import TauCeti.Analysis.InnerProductSpace.OrthogonalFamily
import TauCeti.Analysis.InnerProductSpace.Projection.Completeness

/-!
# Orthogonal geometry: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti.

The roadmap's own headline theorems are stated below with `sorry`: the expansion of the inner
product of two linear combinations through the pairwise inner products (§1.1), for finite sums
over `Finset`s and for finitely supported coefficients, and Parseval's identity for a
pairwise-orthogonal family with a given sum, which assumes no completeness (§3.1). The
summability criterion of §3.1 is one term from Tau Ceti's `TauCeti.orthogonalFamily_span_singleton`
and Mathlib's `OrthogonalFamily.summable_iff_norm_sq_summable`, so it stays a target of
`README.md` and is not stated here. Every headline theorem is statable at the pins.

The theorems the roadmap builds on are theorems of the pinned Tau Ceti, under the names that the
supplier contracts of `README.md` give, so this file does not restate them and pins them by
`#check` at its end: ambient Gram rigidity (two families in a finite-dimensional inner-product
space with equal pairwise inner products are carried onto one another by a linear isometric
equivalence of the space) with the Gram-matrix characterization; the range isometry induced by
equal pullback inner products; reducing subspaces; completeness of a subspace admitting an
orthogonal projection in a complete space; and the orthogonal family of the lines spanned by
pairwise orthogonal vectors.

The file declares one definition, `familyIsometry`, a local copy of Tau Ceti's coordinate
isometry `Orthonormal.synthesisMapIsometry` for an orthonormal family indexed by `Fin d`, kept
under the name from which the acceptance file of the PrincipalAngles roadmap builds its overlap
operator; it is not a declaration to be added to Tau Ceti. It is built from Mathlib alone: Tau
Ceti's coordinate isometry lives in a module that imports Tau Ceti's operator square root, which
the acceptance file of the PolarDecomposition roadmap, imported beside this one, declares under
the same name.
-/

namespace TauCetiRoadmap.OrthogonalGeometry

open scoped InnerProductSpace ComplexConjugate

/-! ## Layer 1: Gram rigidity -/

/-- **Inner products of finite linear combinations** (§1.1). For finite sets `s` and `t`,
coefficients `a`, `b` and arbitrary families `φ`, `ψ` (dependent, repeated or zero vectors
allowed), `⟪∑ᵢ aᵢ φᵢ, ∑ⱼ bⱼ ψⱼ⟫ = ∑ᵢ ∑ⱼ conj(aᵢ) bⱼ ⟪φᵢ, ψⱼ⟫`: the coefficients of the left
combination are conjugated. -/
theorem inner_sum_smul_sum_smul {𝕜 E ι κ : Type*} [RCLike 𝕜] [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] (s : Finset ι) (t : Finset κ) (a : ι → 𝕜) (b : κ → 𝕜)
    (φ : ι → E) (ψ : κ → E) :
    ⟪∑ i ∈ s, a i • φ i, ∑ j ∈ t, b j • ψ j⟫_𝕜 =
      ∑ i ∈ s, ∑ j ∈ t, conj (a i) * b j * ⟪φ i, ψ j⟫_𝕜 := by
  sorry

/-- **Inner products of linear combinations with finitely supported coefficients** (§1.1). For
`a : ι →₀ 𝕜`, `b : κ →₀ 𝕜` and arbitrary families `φ`, `ψ`, the inner product of
`Finsupp.linearCombination 𝕜 φ a` with `Finsupp.linearCombination 𝕜 ψ b` is the double sum of
`conj(aᵢ) bⱼ ⟪φᵢ, ψⱼ⟫` over the supports. -/
theorem inner_linearCombination_linearCombination {𝕜 E ι κ : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] (a : ι →₀ 𝕜) (b : κ →₀ 𝕜) (φ : ι → E)
    (ψ : κ → E) :
    ⟪Finsupp.linearCombination 𝕜 φ a, Finsupp.linearCombination 𝕜 ψ b⟫_𝕜 =
      a.sum fun i α ↦ b.sum fun j β ↦ conj α * β * ⟪φ i, ψ j⟫_𝕜 := by
  sorry

/-! ## Layer 2: coordinate isometries -/

/-- The coordinate isometry `EuclideanSpace 𝕜 (Fin d) →ₗᵢ[𝕜] E`, `x ↦ ∑ⱼ xⱼ • vⱼ`, of an
orthonormal family `v : Fin d → E`: the linear map sending the standard basis vector `eⱼ` to
`vⱼ`, isometric because it carries the orthonormal standard basis to an orthonormal family. It
is a local copy of Tau Ceti's `Orthonormal.synthesisMapIsometry` for the index type `Fin d`, and
equal to it. -/
noncomputable def familyIsometry {𝕜 E : Type*} [RCLike 𝕜] [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {d : ℕ} {v : Fin d → E} (hv : Orthonormal 𝕜 v) :
    EuclideanSpace 𝕜 (Fin d) →ₗᵢ[𝕜] E :=
  ((EuclideanSpace.basisFun (Fin d) 𝕜).toBasis.constr 𝕜 v).isometryOfOrthonormal
    (v := (EuclideanSpace.basisFun (Fin d) 𝕜).toBasis)
    (by rw [OrthonormalBasis.coe_toBasis]; exact (EuclideanSpace.basisFun (Fin d) 𝕜).orthonormal)
    (by
      have h : ⇑((EuclideanSpace.basisFun (Fin d) 𝕜).toBasis.constr 𝕜 v) ∘
          ⇑(EuclideanSpace.basisFun (Fin d) 𝕜).toBasis = v :=
        funext fun j ↦ Module.Basis.constr_basis _ _ _ j
      rw [h]
      exact hv)

/-! ## Layer 3: orthogonal series -/

/-- **Parseval's identity for a pairwise-orthogonal family** (§3.1). If `v` is pairwise
orthogonal (zero vectors allowed, index type arbitrary) and `∑ᵢ vᵢ = x` as an unconditional sum,
then `∑ᵢ ‖vᵢ‖² = ‖x‖²`. No completeness of `E` is assumed: the sum is given. -/
theorem hasSum_norm_sq_of_pairwise_inner_eq_zero {𝕜 E ι : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] {v : ι → E}
    (hv : Pairwise fun i j ↦ ⟪v i, v j⟫_𝕜 = 0) {x : E} (hx : HasSum v x) :
    HasSum (fun i ↦ ‖v i‖ ^ 2) (‖x‖ ^ 2) := by
  sorry

end TauCetiRoadmap.OrthogonalGeometry

/-! Pinned library declarations named in the supplier contracts of `README.md`. -/

#check @TauCeti.rangeEquivOfInnerEq
#check @TauCeti.exists_linearIsometryEquiv_of_inner_eq
#check @TauCeti.gram_eq_iff_exists_linearIsometryEquiv
#check @Submodule.IsReducing
#check @Submodule.isComplete_coe_of_hasOrthogonalProjection
#check @TauCeti.orthogonalFamily_span_singleton

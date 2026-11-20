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

The headline theorems are theorems of the pinned Tau Ceti, under the names that the supplier
contracts of `README.md` give, so this file does not restate them and pins them by `#check` at
its end: ambient Gram rigidity (two families in a finite-dimensional inner-product space with
equal pairwise inner products are carried onto one another by a linear isometric equivalence of
the space) with the Gram-matrix characterization; the range isometry induced by equal pullback
inner products; reducing subspaces; completeness of a subspace admitting an orthogonal
projection in a complete space; and the orthogonal family of the lines spanned by pairwise
orthogonal vectors. Every headline theorem is statable at the pins.

The file declares one definition, `familyIsometry`, the coordinate isometry of an orthonormal
family indexed by `Fin d`, which the acceptance file of the PrincipalAngles roadmap builds its
overlap operator from. It is built from Mathlib alone: Tau Ceti's coordinate isometry
`Orthonormal.synthesisMapIsometry` lives in a module that imports Tau Ceti's operator square
root, which the acceptance file of the PolarDecomposition roadmap, imported beside this one,
declares under the same name.
-/

namespace TauCetiRoadmap.OrthogonalGeometry

/-- The coordinate isometry `EuclideanSpace 𝕜 (Fin d) →ₗᵢ[𝕜] E`, `x ↦ ∑ⱼ xⱼ • vⱼ`, of an
orthonormal family `v : Fin d → E`: the linear map sending the standard basis vector `eⱼ` to
`vⱼ`, isometric because it carries the orthonormal standard basis to an orthonormal family. It
agrees with Tau Ceti's `Orthonormal.synthesisMapIsometry` for the index type `Fin d`. -/
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

end TauCetiRoadmap.OrthogonalGeometry

/-! Pinned library declarations named in the supplier contracts of `README.md`. -/

#check @TauCeti.rangeEquivOfInnerEq
#check @TauCeti.exists_linearIsometryEquiv_of_inner_eq
#check @TauCeti.gram_eq_iff_exists_linearIsometryEquiv
#check @Submodule.IsReducing
#check @Submodule.isComplete_coe_of_hasOrthogonalProjection
#check @TauCeti.orthogonalFamily_span_singleton

/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.Convex.Majorization
import TauCeti.Analysis.InnerProductSpace.SchurHorn

/-!
# Majorization and unitarily invariant norms: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs.

The headline theorems are:

* transfer descent, and the monotonicity of every symmetric gauge under weak majorization
  (README §1.2);
* the forward Schur–Horn inequality: convex functions of the diagonal of a symmetric operator in
  any orthonormal basis are dominated by the same functions of its eigenvalues (§1.3);
* Ky Fan's maximum principle and the Ky Fan triangle inequality (§1.4);
* the orbit-hull characterization of Ky Fan domination, Fan dominance for every unitarily
  invariant seminorm on rectangular maps, and determination by singular values (§2.2);
* the representation of a unitarily invariant seminorm as a symmetric gauge of the singular
  values, and its invariance under the modulus (§2.3);
* the sharp comparison of unitarily invariant seminorms on orthogonal block sums (§2.4);
* the rank-sharp bound of the nuclear seminorm by the Frobenius seminorm (§2.5).

Every one of them is statable at the pins, and every one is a declaration of the pinned Tau Ceti
library, so none is stated again here. The first two items are pinned below by `#check`. The others
are `LinearMap.norm_sum_inner_le_kyFanSum`, `LinearMap.exists_orthonormal_sum_inner_eq_kyFanSum`,
`LinearMap.kyFanSum_add_le`, `LinearMap.mem_twoSidedUnitaryOrbitHull_iff_kyFanSum_le`,
`TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le`,
`TauCeti.UnitarilyInvariantSeminorm.map_eq_of_singularValues_eq`,
`TauCeti.UnitarilyInvariantSeminorm.map_eq_gauge_singularValues`,
`TauCeti.UnitarilyInvariantSeminorm.map_operatorAbs`,
`TauCeti.UnitarilyInvariantSeminorm.map_prodMap_withLpMap_le` and
`TauCeti.UnitarilyInvariantSeminorm.nuclear_apply_le_sqrt_finrank_range_mul_frobenius_apply`. Their
modules import the Tau Ceti modulus `TauCeti.Analysis.InnerProductSpace.Positive.SquareRoot`, whose
declarations (`LinearMap.IsPositive.sqrt` among them) are also declared by the acceptance file of
PolarDecomposition, which the acceptance files importing this one import as well; this file
therefore names them instead of importing them.

The roadmap's two targets that the library does not state, the progress step of the transfer
closure (§1.2) and the attainment of the Ky Fan bound by the singular pairs (§1.4), are steps rather
than headline theorems and live in the README only.

The acceptance files of PrincipalAngles, OperatorIdeals and SpectralSubspacePerturbation state
their estimates against the two declarations at the end of this file: the structure
`UnitarilyInvariantSeminorm`, the notion of `TauCeti.UnitarilyInvariantSeminorm` with Mathlib's
`unitary` groups in place of linear isometric equivalences, and the Frobenius value `frobenius`.
Both have real bodies on Mathlib carriers.
-/

namespace TauCetiRoadmap.Majorization

/-! Transfer descent and gauge monotonicity (README §1.2). -/

#check @TauCeti.IsSymmetricConvex.mem_of_prefixSum_le
#check @TauCeti.IsWeaklyMajorizedBy.apply_le

/-! The forward Schur–Horn inequality (README §1.3). -/

#check @LinearMap.IsSymmetric.sum_map_re_inner_apply_self_le_sum_map_eigenvalues

/-! The interface of README §2.1 and §2.5 used by the other OperatorTheory roadmaps. -/

/-- A seminorm on the linear maps `E →ₗ[𝕜] F` between finite-dimensional inner product spaces,
invariant under independent unitary changes of coordinates in the source and in the target:
`N (U ∘ A ∘ V) = N A` for every unitary `U` of `F` and `V` of `E`. Square operators are the case
`E = F`. This is the notion of `TauCeti.UnitarilyInvariantSeminorm`, with the unitaries taken in
Mathlib's `unitary` submonoids of the endomorphism star monoids. -/
structure UnitarilyInvariantSeminorm (𝕜 E F : Type*) [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
    extends Seminorm 𝕜 (E →ₗ[𝕜] F) where
  unitary_invariant' : ∀ (U : unitary (F →ₗ[𝕜] F)) (V : unitary (E →ₗ[𝕜] E)) (A),
    toFun ((U : F →ₗ[𝕜] F) ∘ₗ A ∘ₗ (V : E →ₗ[𝕜] E)) = toFun A

/-- A unitarily invariant seminorm is evaluated at a linear map through its underlying
seminorm. -/
instance {𝕜 E F : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F] :
    FunLike (UnitarilyInvariantSeminorm 𝕜 E F) (E →ₗ[𝕜] F) ℝ where
  coe N := N.toFun
  coe_injective := by
    rintro ⟨N, _⟩ ⟨M, _⟩ h
    congr
    exact Seminorm.ext (congrFun h)

/-- A unitarily invariant seminorm satisfies the seminorm axioms of its underlying seminorm. -/
instance {𝕜 E F : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F] :
    SeminormClass (UnitarilyInvariantSeminorm 𝕜 E F) 𝕜 (E →ₗ[𝕜] F) where
  map_zero N := N.map_zero'
  map_add_le_add N := N.add_le'
  map_neg_eq_map N := N.neg'
  map_smul_eq_mul N := N.smul'

/-- The Frobenius (Hilbert–Schmidt) value `‖A‖_F = (∑ᵢ ‖A bᵢ‖²)^(1/2)` of a linear map
`A : E →ₗ[𝕜] F`, computed in the standard orthonormal basis `(bᵢ)` of the source. It is the value
at `A` of `TauCeti.UnitarilyInvariantSeminorm.frobenius 𝕜 E F` (by
`TauCeti.UnitarilyInvariantSeminorm.frobenius_apply`); it does not depend on the orthonormal basis,
and it equals `(∑ᵢ σᵢ(A)²)^(1/2)` for the singular values `σᵢ(A)` of `A`
(`TauCeti.UnitarilyInvariantSeminorm.frobenius_apply_eq_sqrt_sum_sq_singularValues`, README §2.5). -/
noncomputable def frobenius {𝕜 E F : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]
    (A : E →ₗ[𝕜] F) : ℝ :=
  √(∑ i, ‖A (stdOrthonormalBasis 𝕜 E i)‖ ^ 2)

end TauCetiRoadmap.Majorization

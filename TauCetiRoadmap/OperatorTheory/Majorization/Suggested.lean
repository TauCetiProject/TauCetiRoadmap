/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCetiRoadmap.OperatorTheory.OrthogonalGeometry.Suggested
import TauCetiRoadmap.OperatorTheory.PolarDecomposition.Suggested

/-!
# Majorization and unitarily invariant norms: target signatures

**`README.md` is the definitive and exhaustive roadmap specification.** This file gives
suggested Lean forms for selected labeled obligations. The roadmap is complete when the
obligations in `README.md` are complete. `sorry` records target signatures in this human-owned
roadmap library.

-/

namespace TauCetiRoadmap.Majorization

open Module (finrank)
open scoped InnerProductSpace

variable {𝕜 : Type*} [RCLike 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
variable {n d : ℕ}

/-! ## Part A -- majorization, Schur-Horn, and Ky Fan sums

The vector layer lives in `Analysis/Convex` with no operator imports; the
operator layer pulls it back through singular values. -/

/-- Prefix sum of the first `k` coordinates, the vocabulary of weak majorization.

Roadmap: `MAJ-A01`. -/
def prefixSum (k : ℕ) (x : Fin n → ℝ) : ℝ :=
  ∑ i ∈ Finset.univ.filter (fun i : Fin n => (i : ℕ) < k), x i

/-- A symmetric convex set of real tuples: convex, permutation-invariant, and invariant
under changing the sign of one coordinate. Gauge sublevel sets are the motivating instances.
The sign symmetry is essential for descent under *weak* majorization, which may reduce the
total sum; Robin Hood transfers alone preserve it.

Roadmap: `MAJ-A05`. -/
structure IsSymmetricConvex (K : Set (Fin n → ℝ)) : Prop where
  convex : Convex ℝ K
  perm_mem : ∀ (σ : Equiv.Perm (Fin n)), ∀ x ∈ K, x ∘ σ ∈ K
  signFlip_mem : ∀ x ∈ K, ∀ i : Fin n,
    (fun j => if j = i then -x j else x j) ∈ K

/-- **Weak-majorization descent.** A symmetric convex set containing a nonnegative tuple
`y` contains every antitone nonnegative tuple whose prefix sums are bounded by those of `y`.
The nonnegativity of both tuples and coordinate-sign symmetry supply the downward solidity
that weak, rather than strong, majorization requires.

Roadmap: `MAJ-A15`. -/
theorem IsSymmetricConvex.mem_of_prefixSum_le {K : Set (Fin n → ℝ)}
    (hK : IsSymmetricConvex K) {y z : Fin n → ℝ} (hy : y ∈ K)
    (hy0 : ∀ i, 0 ≤ y i) (hz : Antitone z) (hz0 : ∀ i, 0 ≤ z i)
    (h : ∀ k, prefixSum k z ≤ prefixSum k y) : z ∈ K := sorry

/-- The Schur--Horn weight: squared moduli of the eigenbasis coefficients of an
orthonormal basis, a doubly stochastic matrix.

Roadmap: `MAJ-A18`. -/
noncomputable def schurWeight {T : E →ₗ[𝕜] E} (hT : T.IsSymmetric)
    (hn : finrank 𝕜 E = n) (e : OrthonormalBasis (Fin n) 𝕜 E) (i k : Fin n) : ℝ :=
  ‖⟪hT.eigenvectorBasis hn i, e k⟫_𝕜‖ ^ 2

/-- **Forward Schur--Horn, Karamata form**: convex functions of the diagonal are
dominated by convex functions of the spectrum.

Roadmap: `MAJ-A23`. -/
theorem convexOn_sum_re_inner_orthonormalBasis_self_le {T : E →ₗ[𝕜] E}
    (hT : T.IsSymmetric) (hn : finrank 𝕜 E = n) (e : OrthonormalBasis (Fin n) 𝕜 E)
    {φ : ℝ → ℝ} {s : Set ℝ} (hφ : ConvexOn ℝ s φ) (hmem : ∀ i, hT.eigenvalues hn i ∈ s)
    (hdiag : ∀ k, RCLike.re ⟪T (e k), e k⟫_𝕜 ∈ s) :
    ∑ k, φ (RCLike.re ⟪T (e k), e k⟫_𝕜) ≤ ∑ i, φ (hT.eigenvalues hn i) := sorry

/-- The Ky Fan `k`-sum of singular values.

Roadmap: `MAJ-A26`. -/
noncomputable def kyFanSum (k : ℕ) (A : E →ₗ[𝕜] F) : ℝ :=
  ∑ i ∈ Finset.range k, A.singularValues i

/-- The Ky Fan triangle inequality: `σ(A+B)` is weakly majorized by `σ(A)+σ(B)`,
so every Ky Fan norm satisfies the triangle inequality at once.

Roadmap: `MAJ-A31`. -/
theorem kyFanSum_add_le (k : ℕ) (A B : E →ₗ[𝕜] E) :
    kyFanSum k (A + B) ≤ kyFanSum k A + kyFanSum k B := sorry

/-! ## Part B -- unitarily invariant seminorms -/

/-- A seminorm on rectangular operators, invariant under independent unitary changes
of source and target coordinates. Square operators use `E = F`.

Roadmap: `MAJ-B01`. -/
structure UnitarilyInvariantSeminorm (𝕜 E F : Type*) [RCLike 𝕜]
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
    extends Seminorm 𝕜 (E →ₗ[𝕜] F) where
  unitary_invariant' : ∀ (U : unitary (F →ₗ[𝕜] F)) (V : unitary (E →ₗ[𝕜] E)) (A),
    toFun ((U : F →ₗ[𝕜] F) ∘ₗ A ∘ₗ (V : E →ₗ[𝕜] E)) = toFun A

-- Roadmap: `MAJ-B01`.
instance : FunLike (UnitarilyInvariantSeminorm 𝕜 E F) (E →ₗ[𝕜] F) ℝ where
  coe N := N.toFun
  coe_injective := by sorry

-- Roadmap: `MAJ-B01`.
instance : SeminormClass (UnitarilyInvariantSeminorm 𝕜 E F) 𝕜 (E →ₗ[𝕜] F) where
  map_zero N := N.map_zero'
  map_add_le_add N := N.add_le'
  map_neg_eq_map N := N.neg'
  map_smul_eq_mul N := N.smul'

/-- Equal singular-value sequences give equal values in every unitarily invariant seminorm.

Roadmap: `MAJ-B19`. -/
theorem UnitarilyInvariantSeminorm.eq_of_same_singularValues
    (N : UnitarilyInvariantSeminorm 𝕜 E F) {A B : E →ₗ[𝕜] F}
    (h : A.singularValues = B.singularValues) : N A = N B := sorry

/-- The modulus preserves every unitarily invariant seminorm on endomorphisms.

Roadmap: `MAJ-B46`. -/
theorem UnitarilyInvariantSeminorm.apply_operatorAbs
    (N : UnitarilyInvariantSeminorm 𝕜 E E) (A : E →ₗ[𝕜] E) :
    N (LinearMap.operatorAbs A) = N A := sorry

/-- **Rectangular Fan dominance**: Ky Fan domination of the singular values gives
domination in every rectangular unitarily invariant norm — one estimate yields
the operator, Frobenius, Ky Fan and nuclear norms at once.

Roadmap: `MAJ-B21`. -/
theorem UnitarilyInvariantSeminorm.apply_le_of_kyFanSum_le
    (N : UnitarilyInvariantSeminorm 𝕜 E F) {A B : E →ₗ[𝕜] F}
    (h : ∀ k, kyFanSum k A ≤ kyFanSum k B) :
    N.toFun A ≤ N.toFun B := sorry

/-- The Frobenius seminorm on rectangular operators. Its value is independent of the
orthonormal basis used for the sum of squared image norms. Square operators use `E = F`.

Roadmap: `MAJ-B31`. -/
noncomputable def frobenius : UnitarilyInvariantSeminorm 𝕜 E F := sorry

/-- The Frobenius seminorm through the standard orthonormal basis of the domain.

Roadmap: `MAJ-B34`. -/
theorem frobenius_apply (A : E →ₗ[𝕜] F) :
    frobenius A = Real.sqrt (∑ i, ‖A (stdOrthonormalBasis 𝕜 E i)‖ ^ 2) := by
  sorry

/-! ### The orthogonal block sum

The block-sum layer is **four** results, milestones in sequence rather than alternate
names for one statement.  The last is the consumer-facing one. -/

/-- The orthogonal block sum of two rectangular maps, on `WithLp 2` products.

Roadmap: `MAJ-B22`. -/
noncomputable def orthogonalBlockSum {E₁ E₂ F₁ F₂ : Type*}
    [NormedAddCommGroup E₁] [InnerProductSpace 𝕜 E₁]
    [NormedAddCommGroup E₂] [InnerProductSpace 𝕜 E₂]
    [NormedAddCommGroup F₁] [InnerProductSpace 𝕜 F₁]
    [NormedAddCommGroup F₂] [InnerProductSpace 𝕜 F₂]
    (A : E₁ →ₗ[𝕜] F₁) (B : E₂ →ₗ[𝕜] F₂) :
    WithLp 2 (E₁ × E₂) →ₗ[𝕜] WithLp 2 (F₁ × F₂) :=
  LinearMap.withLpMap 2 (A.prodMap B)

/-- Doubling repeats every singular value twice; the quotient `i / 2` is the interleaved
sorted order of the two copies.

Roadmap: `MAJ-B26`. -/
theorem singularValues_orthogonalBlockSum_self (A : E →ₗ[𝕜] F) (i : ℕ) :
    (orthogonalBlockSum A A).singularValues i = A.singularValues (i / 2) := sorry

/-- **The principal endpoint.**  Two simultaneous rectangular Ky Fan majorizations combine
sharply on the orthogonal block sum.  Not shortened to `blockSum_le`: the hypotheses are
specifically Ky Fan majorization.

Roadmap: `MAJ-B29`. -/
theorem orthogonalBlockSum_apply_le_of_kyFanSum_le
    {E₁ E₂ F₁ F₂ : Type*}
    [NormedAddCommGroup E₁] [InnerProductSpace 𝕜 E₁] [FiniteDimensional 𝕜 E₁]
    [NormedAddCommGroup E₂] [InnerProductSpace 𝕜 E₂] [FiniteDimensional 𝕜 E₂]
    [NormedAddCommGroup F₁] [InnerProductSpace 𝕜 F₁] [FiniteDimensional 𝕜 F₁]
    [NormedAddCommGroup F₂] [InnerProductSpace 𝕜 F₂] [FiniteDimensional 𝕜 F₂]
    (NB : UnitarilyInvariantSeminorm 𝕜
      (WithLp 2 (E₁ × E₂)) (WithLp 2 (F₁ × F₂)))
    {A C : E₁ →ₗ[𝕜] F₁} {B D : E₂ →ₗ[𝕜] F₂}
    (hA : ∀ k, ∑ i ∈ Finset.range k, A.singularValues i
            ≤ ∑ i ∈ Finset.range k, C.singularValues i)
    (hB : ∀ k, ∑ i ∈ Finset.range k, B.singularValues i
            ≤ ∑ i ∈ Finset.range k, D.singularValues i) :
    NB.toFun (orthogonalBlockSum A B) ≤ NB.toFun (orthogonalBlockSum C D) := sorry

end TauCetiRoadmap.Majorization

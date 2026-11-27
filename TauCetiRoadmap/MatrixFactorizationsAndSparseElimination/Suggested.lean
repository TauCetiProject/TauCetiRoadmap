module

public import Mathlib
public import TauCeti.Analysis.Normed.Ring.StableSequence
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.EckartYoung
public import TauCeti.LinearAlgebra.Matrix.Cholesky.Equiv

/-!
# Matrix factorizations and sparse elimination: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). Matrices are `Matrix (Fin m) (Fin n) 𝕜` over an `RCLike`
field `𝕜`, or over a field `K` where no norm enters. Indices are zero-based: the `k`th leading
block is `leadingBlock A k`, of size `k`, and the pivot of stage `k` of elimination is
`gaussPivot A k`, the `(k + 1)`st pivot in the one-based numbering of the sources. Matrix norms are
Mathlib's scoped instances, opened in the section of each statement: `Matrix.Norms.L2Operator`
(spectral norm), `Matrix.Norms.Operator` (the `ℓ∞` operator norm, the largest absolute row sum)
and `Matrix.Norms.Frobenius`. Singular values are Mathlib's `LinearMap.singularValues` of
`Matrix.toEuclideanLin A`, decreasing and zero-based. The eigenvalues of a Hermitian matrix are
Mathlib's `Matrix.IsHermitian.eigenvalues₀`, in decreasing order. A general spectrum is an
enumeration `α : Fin n → ℂ` of the roots of the characteristic polynomial with multiplicity
(`IsEigenvalueEnumeration`). The spectral radius of a complex matrix is Mathlib's
`spectralRadius ℂ A`, in `ℝ≥0∞`, and that of a real matrix is the one of `A.map (algebraMap ℝ ℂ)`.
Every use of `⁻¹` on a matrix carries a determinant or unit hypothesis.

`PerfectAndChordalGraphs` §1.1 owns `IsChordal` and `IsPerfectEliminationOrder`, and
`GaussianLinearModels` §1.1 owns `IsLeastSquares`; they appear here as verbatim local copies whose
docstrings name their owners.

Seven declarations are proved here: they close in one step from Mathlib or Tau Ceti, or from a
target of this file, and are Checks rather than targets (`l2OpNorm_eq_singularValues_zero`,
`spectralRadius_map_le_l2OpNorm`, `spectralRadius_map_le_linftyOpNorm`,
`isEigenvalueEnumeration_iff_map_univ`, `IsEigenvalueEnumeration.prod_eq_det_and_sum_eq_trace`,
`isLeastSquaresSolution_iff_isLeastSquares`, `le_filledGraph`).

Bold headlines of the README not stated here: the transport of the factorization of a matrix to
its conjugate transpose (§2.1), the matrix form of the reordering theorem and the equality of fill
counts (§7.3), and the identification of the reduced QR factor of a real matrix with the
transposed Tau Ceti Cholesky factor of `Aᵀ A` (§5.2), each one step from a stated target.
-/

@[expose] public section

noncomputable section

open Matrix
open scoped NNReal ENNReal ComplexOrder

namespace TauCetiRoadmap.MatrixFactorizationsAndSparseElimination

variable {𝕜 : Type*} [RCLike 𝕜]

/-! ## Layer 1: matrix conventions -/

/-! ### 1.1 Norms, singular values and condition numbers -/

section L2

open scoped Matrix.Norms.L2Operator

/-- Check of the conventions: the spectral norm is the largest singular value (Tau Ceti
`LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero`). -/
theorem l2OpNorm_eq_singularValues_zero {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) :
    ‖A‖ = A.toEuclideanLin.singularValues 0 := by
  rw [Matrix.l2_opNorm_def]
  exact LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero _

/-- 1.1: a real matrix and its complexification have the same spectral norm. -/
theorem l2OpNorm_map_ofReal {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℝ) :
    ‖A.map (algebraMap ℝ ℂ)‖ = ‖A‖ := by
  sorry

/-- 1.1: the spectral condition number of an invertible matrix of order `n + 1` is the ratio of
its largest and smallest singular values. -/
theorem conditionNumber_eq_singularValues_div {n : ℕ}
    (A : Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜) (hA : IsUnit A) :
    TauCeti.conditionNumber A =
      A.toEuclideanLin.singularValues 0 / A.toEuclideanLin.singularValues n := by
  sorry

/-- Check of the conventions: the spectral radius of a real matrix, taken over `ℂ`, is at most its
spectral norm. -/
theorem spectralRadius_map_le_l2OpNorm {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) :
    spectralRadius ℂ (A.map (algebraMap ℝ ℂ)) ≤ ‖A‖₊ := by
  have h := spectralRadius_le_nnnorm (𝕜 := ℂ) (A.map (algebraMap ℝ ℂ))
  have h2 : ‖A.map (algebraMap ℝ ℂ)‖₊ = ‖A‖₊ := Subtype.ext (l2OpNorm_map_ofReal A)
  rwa [h2] at h

end L2

section Linfty

open scoped Matrix.Norms.Operator

/-- Check of the conventions: the spectral radius of a real matrix, taken over `ℂ`, is at most its
`ℓ∞` operator norm, the largest absolute row sum. -/
theorem spectralRadius_map_le_linftyOpNorm {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) :
    spectralRadius ℂ (A.map (algebraMap ℝ ℂ)) ≤ ‖A‖₊ := by
  have h := spectralRadius_le_nnnorm (𝕜 := ℂ) (A.map (algebraMap ℝ ℂ))
  have h2 : ‖A.map (algebraMap ℝ ℂ)‖₊ = ‖A‖₊ := by
    rw [Matrix.linfty_opNNNorm_def, Matrix.linfty_opNNNorm_def]
    simp
  rwa [h2] at h

end Linfty

/-! ### 1.2 Spectra -/

/-- 1.2: `α` enumerates the eigenvalues of `A` with algebraic multiplicity: the multiset of its
values is the multiset of roots of the characteristic polynomial. -/
def IsEigenvalueEnumeration {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) (α : Fin n → ℂ) : Prop :=
  (List.ofFn α : Multiset ℂ) = A.charpoly.roots

/-- Check of the conventions: `IsEigenvalueEnumeration` is the matrix form of the enumeration
convention of `EigenvalueAndSingularValueInequalities` (Conventions), which writes the multiset of
values as `Multiset.map α univ.val` (Mathlib `Fin.univ_val_map`). -/
theorem isEigenvalueEnumeration_iff_map_univ {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ)
    (α : Fin n → ℂ) :
    IsEigenvalueEnumeration A α ↔ Multiset.map α Finset.univ.val = A.charpoly.roots := by
  rw [Fin.univ_val_map]
  rfl

/-- 1.2: every complex square matrix has an enumeration of its eigenvalues. -/
theorem exists_isEigenvalueEnumeration {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) :
    ∃ α, IsEigenvalueEnumeration A α := by
  sorry

/-- 1.2: the values of an enumeration are the spectrum. -/
theorem IsEigenvalueEnumeration.range_eq_spectrum {n : ℕ} {A : Matrix (Fin n) (Fin n) ℂ}
    {α : Fin n → ℂ} (h : IsEigenvalueEnumeration A α) :
    Set.range α = spectrum ℂ A := by
  sorry

/-- Check of the conventions: the product and the sum of an enumeration are the determinant and
the trace (Mathlib `Matrix.det_eq_prod_roots_charpoly`, `Matrix.trace_eq_sum_roots_charpoly`). -/
theorem IsEigenvalueEnumeration.prod_eq_det_and_sum_eq_trace {n : ℕ}
    {A : Matrix (Fin n) (Fin n) ℂ} {α : Fin n → ℂ} (h : IsEigenvalueEnumeration A α) :
    ∏ i, α i = A.det ∧ ∑ i, α i = A.trace := by
  have hp : (List.ofFn α : Multiset ℂ).prod = ∏ i, α i := by
    rw [Multiset.prod_coe, List.prod_ofFn]
  have hs : (List.ofFn α : Multiset ℂ).sum = ∑ i, α i := by
    rw [Multiset.sum_coe, List.sum_ofFn]
  refine ⟨?_, ?_⟩
  · rw [← hp, h, Matrix.det_eq_prod_roots_charpoly]
  · rw [← hs, h, Matrix.trace_eq_sum_roots_charpoly]

/-- 1.2: the spectral radius is the largest modulus in an enumeration (`0` for `n = 0`). -/
theorem IsEigenvalueEnumeration.spectralRadius_eq_iSup {n : ℕ} {A : Matrix (Fin n) (Fin n) ℂ}
    {α : Fin n → ℂ} (h : IsEigenvalueEnumeration A α) :
    spectralRadius ℂ A = ⨆ i, (‖α i‖₊ : ℝ≥0∞) := by
  sorry

/-- 1.2: the decreasing eigenvalues of a Hermitian matrix, read in `ℂ`, enumerate its
spectrum. -/
theorem isEigenvalueEnumeration_eigenvalues₀ {n : ℕ} {A : Matrix (Fin n) (Fin n) ℂ}
    (hA : A.IsHermitian) :
    IsEigenvalueEnumeration A
      (fun i ↦ (hA.eigenvalues₀ (Fin.cast (Fintype.card_fin n).symm i) : ℂ)) := by
  sorry

/-! ## Layer 2: LU factorization and elimination without pivoting -/

section LU

variable {K : Type*} [Field K]

/-- The leading principal block of order `k ≤ n`, the matrix `A(1:k, 1:k)` of the sources. -/
def leadingBlock {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (k : ℕ) (hk : k ≤ n) :
    Matrix (Fin k) (Fin k) K :=
  A.submatrix (Fin.castLE hk) (Fin.castLE hk)

/-- 2.1: `A = L U` with `L` unit lower triangular and `U` upper triangular. -/
def IsLU {n : ℕ} (A L U : Matrix (Fin n) (Fin n) K) : Prop :=
  L.IsLowerTriangular ∧ (∀ i, L i i = 1) ∧ U.IsUpperTriangular ∧ L * U = A

/-- 2.1: existence and uniqueness of the LU factorization. A square matrix has exactly one LU
factorization if and only if its proper leading principal blocks are nonsingular; the last block,
`A` itself, may be singular. -/
theorem existsUnique_isLU_iff {n : ℕ} (A : Matrix (Fin n) (Fin n) K) :
    (∃! LU : Matrix (Fin n) (Fin n) K × Matrix (Fin n) (Fin n) K, IsLU A LU.1 LU.2) ↔
      ∀ k (hk : k < n), (leadingBlock A k hk.le).det ≠ 0 := by
  sorry

/-- 2.1: for every LU factorization, each leading principal minor is the product of the
corresponding diagonal entries of `U`. -/
theorem IsLU.det_leadingBlock {n : ℕ} {A L U : Matrix (Fin n) (Fin n) K} (h : IsLU A L U)
    (k : ℕ) (hk : k ≤ n) :
    (leadingBlock A k hk).det = ∏ i : Fin k, U (Fin.castLE hk i) (Fin.castLE hk i) := by
  sorry

/-- 2.2: one stage of Gaussian elimination with pivot position `k`: each row below `k` loses the
multiple `A i k / A k k` of row `k`, in the columns from `k` on. A zero pivot leaves the matrix
unchanged, since `A i k / 0 = 0`. -/
def gaussStep {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (k : Fin n) : Matrix (Fin n) (Fin n) K :=
  fun i j ↦ if k < i ∧ k ≤ j then A i j - A i k / A k k * A k j else A i j

/-- 2.2: the reduced matrix after `k` stages of elimination without pivoting; `gaussReduced A 0`
is `A`, and the stages beyond `n` change nothing. -/
def gaussReduced {n : ℕ} (A : Matrix (Fin n) (Fin n) K) : ℕ → Matrix (Fin n) (Fin n) K
  | 0 => A
  | k + 1 => if hk : k < n then gaussStep (gaussReduced A k) ⟨k, hk⟩ else gaussReduced A k

/-- 2.2: the pivot of stage `k`. -/
def gaussPivot {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (k : Fin n) : K :=
  gaussReduced A k k k

/-- 2.2: the unit lower triangular matrix of the multipliers of elimination without pivoting. -/
def gaussLower {n : ℕ} (A : Matrix (Fin n) (Fin n) K) : Matrix (Fin n) (Fin n) K :=
  fun i j ↦ if j < i then gaussReduced A j i j / gaussPivot A j else if i = j then 1 else 0

/-- 2.2: elimination without pivoting meets no zero pivot in its first `n - 1` stages exactly when
the proper leading principal minors are nonzero. -/
theorem gaussPivot_ne_zero_iff {n : ℕ} (A : Matrix (Fin n) (Fin n) K) :
    (∀ k : Fin n, (k : ℕ) + 1 < n → gaussPivot A k ≠ 0) ↔
      ∀ k (hk : k < n), (leadingBlock A k hk.le).det ≠ 0 := by
  sorry

/-- 2.2: while the earlier pivots are nonzero, each leading principal minor is the product of the
pivots. -/
theorem det_leadingBlock_eq_prod_gaussPivot {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (k : ℕ)
    (hk : k ≤ n) (h : ∀ i : Fin n, (i : ℕ) + 1 < k → gaussPivot A i ≠ 0) :
    (leadingBlock A k hk).det = ∏ i : Fin k, gaussPivot A (Fin.castLE hk i) := by
  sorry

/-- 2.2: if elimination without pivoting runs to completion, its multipliers and its last reduced
matrix are an LU factorization. -/
theorem isLU_gaussLower_gaussReduced {n : ℕ} (A : Matrix (Fin n) (Fin n) K)
    (h : ∀ k : Fin n, (k : ℕ) + 1 < n → gaussPivot A k ≠ 0) :
    IsLU A (gaussLower A) (gaussReduced A n) := by
  sorry

/-- 2.2: the trailing part of the reduced matrix after `k` stages is the Schur complement of the
leading block of order `k`. -/
theorem gaussReduced_eq_schurComplement {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (k : ℕ)
    (hk : k ≤ n) (h : ∀ j (hj : j ≤ k), (leadingBlock A j (hj.trans hk)).det ≠ 0)
    (i j : Fin n) (hi : k ≤ i) (hj : k ≤ j) :
    gaussReduced A k i j =
      A i j - ∑ a : Fin k, ∑ b : Fin k,
        A i (Fin.castLE hk a) * (leadingBlock A k hk)⁻¹ a b * A (Fin.castLE hk b) j := by
  sorry

end LU

/-- 2.3: Mathlib's `LDLᴴ` decomposition of a positive definite matrix is an LU factorization with
`U = D Lᴴ`. -/
theorem PosDef.isLU_ldl {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜} (hA : A.PosDef) :
    IsLU A (LDL.lower hA) (LDL.diag hA * (LDL.lower hA)ᴴ) := by
  sorry

/-! ## Layer 3: partial pivoting -/

/-- 3.1: a run of Gaussian elimination with partial pivoting. `B k` is the matrix before stage
`k`; stage `k` interchanges rows `k` and `p k ≥ k`, where `p k` attains the largest modulus in
column `k` on and below the diagonal, and then performs `gaussStep` at `k`. -/
def IsPartialPivotRun {n : ℕ} (A : Matrix (Fin n) (Fin n) 𝕜) (p : Fin n → Fin n)
    (B : Fin (n + 1) → Matrix (Fin n) (Fin n) 𝕜) : Prop :=
  B 0 = A ∧ ∀ k : Fin n, k ≤ p k ∧
    (∀ i, k ≤ i → ‖B k.castSucc i k‖ ≤ ‖B k.castSucc (p k) k‖) ∧
    B k.succ = gaussStep ((B k.castSucc).submatrix (Equiv.swap k (p k)) id) k

/-- 3.1: the tie rule that takes the smallest row index among the candidates of largest
modulus; in particular it keeps the current row when that row is a candidate. -/
def IsSmallestPivotIndex {n : ℕ} (p : Fin n → Fin n)
    (B : Fin (n + 1) → Matrix (Fin n) (Fin n) 𝕜) : Prop :=
  ∀ k i, k ≤ i → i < p k → ‖B k.castSucc i k‖ < ‖B k.castSucc (p k) k‖

/-- 3.1: the product of the interchanges of the stages from `k` on, `s_k s_{k+1} ⋯ s_{n-1}` with
`s_i` the transposition of `i` and `p i`. Row `i` of `A.submatrix (pivotPerm p 0) id` is row
`pivotPerm p 0 i` of `A`: this is `P A`. -/
def pivotPerm {n : ℕ} (p : Fin n → Fin n) (k : ℕ) : Equiv.Perm (Fin n) :=
  ((List.ofFn fun i ↦ Equiv.swap i (p i)).drop k).prod

/-- 3.1: every square matrix has a run of partial pivoting with the smallest-index tie rule. -/
theorem exists_isPartialPivotRun {n : ℕ} (A : Matrix (Fin n) (Fin n) 𝕜) :
    ∃ p B, IsPartialPivotRun A p B ∧ IsSmallestPivotIndex p B := by
  sorry

/-- 3.1: partial pivoting performs the operations of elimination without pivoting applied to
`P A`: after `k` stages the two reduced matrices differ by the interchanges still to come. -/
theorem IsPartialPivotRun.gaussReduced_submatrix {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜}
    {p : Fin n → Fin n} {B : Fin (n + 1) → Matrix (Fin n) (Fin n) 𝕜}
    (h : IsPartialPivotRun A p B) (k : Fin (n + 1)) :
    gaussReduced (A.submatrix (pivotPerm p 0) id) k = (B k).submatrix (pivotPerm p k) id := by
  sorry

/-- 3.1: every run produces `P A = L U` with `U = B n` and the multipliers of `P A` bounded by
one, singular or not. -/
theorem IsPartialPivotRun.isLU {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜} {p : Fin n → Fin n}
    {B : Fin (n + 1) → Matrix (Fin n) (Fin n) 𝕜} (h : IsPartialPivotRun A p B) :
    IsLU (A.submatrix (pivotPerm p 0) id) (gaussLower (A.submatrix (pivotPerm p 0) id))
        (B (Fin.last n)) ∧
      ∀ i j, j < i → ‖gaussLower (A.submatrix (pivotPerm p 0) id) i j‖ ≤ 1 := by
  sorry

/-- 3.1: the computed `U` is nonsingular exactly when `A` is, and for nonsingular `A` every pivot
of the run is nonzero. -/
theorem IsPartialPivotRun.det_ne_zero_iff {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜}
    {p : Fin n → Fin n} {B : Fin (n + 1) → Matrix (Fin n) (Fin n) 𝕜}
    (h : IsPartialPivotRun A p B) :
    ((B (Fin.last n)).det ≠ 0 ↔ A.det ≠ 0) ∧
      (A.det ≠ 0 → ∀ k : Fin n, B k.castSucc (p k) k ≠ 0) := by
  sorry

/-- 3.1: every square matrix, singular or not, has `P A = L U` with `P` a permutation, `L` unit
lower triangular with multipliers of modulus at most one, and `U` upper triangular, nonsingular
exactly when `A` is. -/
theorem exists_isLU_submatrix_norm_le_one {n : ℕ} (A : Matrix (Fin n) (Fin n) 𝕜) :
    ∃ (σ : Equiv.Perm (Fin n)) (L U : Matrix (Fin n) (Fin n) 𝕜),
      IsLU (A.submatrix σ id) L U ∧ (∀ i j, j < i → ‖L i j‖ ≤ 1) ∧
        (U.det ≠ 0 ↔ A.det ≠ 0) := by
  sorry

/-! ## Layer 4: growth factors -/

/-- 4.1: the largest modulus of an entry, `0` for an empty matrix. -/
def entryMax {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) : ℝ≥0 :=
  Finset.univ.sup fun ij : Fin m × Fin n ↦ ‖A ij.1 ij.2‖₊

/-- 4.1: the growth factor of a sequence of reduced matrices of `A`: the largest modulus of an
entry of any of them, divided by that of `A`. It is the junk value `0` for `A = 0`, which every
statement excludes. -/
def growthFactor {n : ℕ} (A : Matrix (Fin n) (Fin n) 𝕜)
    (B : Fin (n + 1) → Matrix (Fin n) (Fin n) 𝕜) : ℝ≥0 :=
  (Finset.univ.sup fun k ↦ entryMax (B k)) / entryMax A

/-- 4.2: under partial pivoting the largest entry after `k` stages is at most
`2 ^ min k (n - 1)` times that of `A`, and the growth factor is at most `2 ^ (n - 1)`. -/
theorem IsPartialPivotRun.growthFactor_le_two_pow {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜}
    {p : Fin n → Fin n} {B : Fin (n + 1) → Matrix (Fin n) (Fin n) 𝕜}
    (h : IsPartialPivotRun A p B) :
    (∀ k : Fin (n + 1), entryMax (B k) ≤ 2 ^ min (k : ℕ) (n - 1) * entryMax A) ∧
      growthFactor A B ≤ 2 ^ (n - 1) := by
  sorry

/-- 4.2: the row bound for the computed `U` of partial pivoting, in terms of the permuted matrix
`P A` that is eliminated: `|u i j| ≤ 2 ^ i · max_{k ≤ i} |(P A) k j|` (zero-based `i`). -/
theorem IsPartialPivotRun.nnnorm_le_two_pow_mul {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜}
    {p : Fin n → Fin n} {B : Fin (n + 1) → Matrix (Fin n) (Fin n) 𝕜}
    (h : IsPartialPivotRun A p B) (i j : Fin n) :
    ‖B (Fin.last n) i j‖₊ ≤
      2 ^ (i : ℕ) * (Finset.univ.filter (· ≤ i)).sup fun k ↦ ‖A (pivotPerm p 0 k) j‖₊ := by
  sorry

/-- 4.3: Wilkinson's matrix: `1` on the diagonal and in the last column, `-1` below the diagonal,
`0` elsewhere. -/
def wilkinsonMatrix (n : ℕ) : Matrix (Fin n) (Fin n) ℝ :=
  fun i j ↦ if i = j ∨ (j : ℕ) + 1 = n then 1 else if j < i then -1 else 0

/-- 4.3: the bound `2 ^ (n - 1)` is attained. With the smallest-index tie rule, partial pivoting
on Wilkinson's matrix makes no interchange, the last column of `U` is `1, 2, 4, …, 2 ^ (n - 1)`,
and the growth factor is `2 ^ (n - 1)`. -/
theorem wilkinsonMatrix_growthFactor {n : ℕ} (hn : 0 < n) {p : Fin n → Fin n}
    {B : Fin (n + 1) → Matrix (Fin n) (Fin n) ℝ}
    (h : IsPartialPivotRun (wilkinsonMatrix n) p B) (hs : IsSmallestPivotIndex p B) :
    (∀ k, p k = k) ∧ (∀ i : Fin n, B (Fin.last n) i ⟨n - 1, by omega⟩ = 2 ^ (i : ℕ)) ∧
      growthFactor (wilkinsonMatrix n) B = 2 ^ (n - 1) := by
  sorry

/-- 4.4: a nonsingular matrix that is diagonally dominant by rows or by columns, in the weak
sense, has nonzero proper leading principal minors. -/
theorem det_leadingBlock_ne_zero_of_diagDominant {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜}
    (hA : A.det ≠ 0)
    (hdd : (∀ i, ∑ j ∈ Finset.univ.erase i, ‖A i j‖ ≤ ‖A i i‖) ∨
      (∀ j, ∑ i ∈ Finset.univ.erase j, ‖A i j‖ ≤ ‖A j j‖)) :
    ∀ k (hk : k < n), (leadingBlock A k hk.le).det ≠ 0 := by
  sorry

/-- 4.4: elimination without pivoting on a diagonally dominant matrix keeps the trailing part of
every reduced matrix dominant in the same sense, and the growth factor is at most `2`. A zero
pivot of a dominant matrix comes with a zero row or column of the trailing part, so no
nonsingularity is needed. -/
theorem growthFactor_le_two_of_diagDominant {n : ℕ} (A : Matrix (Fin n) (Fin n) 𝕜) :
    ((∀ i, ∑ j ∈ Finset.univ.erase i, ‖A i j‖ ≤ ‖A i i‖) →
        ∀ k : ℕ, ∀ i : Fin n, k ≤ i →
          ∑ j ∈ (Finset.univ.filter fun j : Fin n ↦ k ≤ j).erase i, ‖gaussReduced A k i j‖ ≤
            ‖gaussReduced A k i i‖) ∧
      ((∀ j, ∑ i ∈ Finset.univ.erase j, ‖A i j‖ ≤ ‖A j j‖) →
        ∀ k : ℕ, ∀ j : Fin n, k ≤ j →
          ∑ i ∈ (Finset.univ.filter fun i : Fin n ↦ k ≤ i).erase j, ‖gaussReduced A k i j‖ ≤
            ‖gaussReduced A k j j‖) ∧
      ((∀ i, ∑ j ∈ Finset.univ.erase i, ‖A i j‖ ≤ ‖A i i‖) ∨
          (∀ j, ∑ i ∈ Finset.univ.erase j, ‖A i j‖ ≤ ‖A j j‖) →
        growthFactor A (fun k ↦ gaussReduced A k) ≤ 2) := by
  sorry

/-- 4.4: for a matrix diagonally dominant by columns the multipliers have modulus at most one,
and partial pivoting with the smallest-index tie rule makes no interchange. -/
theorem noInterchange_of_diagDominant_cols {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜}
    (hcol : ∀ j, ∑ i ∈ Finset.univ.erase j, ‖A i j‖ ≤ ‖A j j‖) :
    (∀ i j, j < i → ‖gaussLower A i j‖ ≤ 1) ∧
      ∀ (p : Fin n → Fin n) (B : Fin (n + 1) → Matrix (Fin n) (Fin n) 𝕜),
        IsPartialPivotRun A p B → IsSmallestPivotIndex p B → ∀ k, p k = k := by
  sorry

/-- 4.5: the trailing block of order `n - k`. -/
def trailingBlock {R : Type*} {n : ℕ} (A : Matrix (Fin n) (Fin n) R) (k : ℕ) :
    Matrix (Fin (n - k)) (Fin (n - k)) R :=
  A.submatrix (fun i ↦ ⟨k + i, by omega⟩) (fun i ↦ ⟨k + i, by omega⟩)

/-- 4.5: elimination without pivoting on a positive definite matrix keeps every trailing block
positive definite, and the growth factor is `1`. -/
theorem growthFactor_eq_one_of_posDef {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜} (hA : A.PosDef)
    (hn : 0 < n) :
    (∀ k ≤ n, (trailingBlock (gaussReduced A k) k).PosDef) ∧
      growthFactor A (fun k ↦ gaussReduced A k) = 1 := by
  sorry

/-! ## Layer 5: Householder reflectors and QR factorization -/

/-- 5.1: the Householder reflector `I - 2 v vᴴ / (vᴴ v)`; it is `I` for `v = 0`. -/
def householder {m : ℕ} (v : Fin m → 𝕜) : Matrix (Fin m) (Fin m) 𝕜 :=
  1 - (2 / (star v ⬝ᵥ v)) • vecMulVec v (star v)

/-- 5.1: a Householder reflector is Hermitian, is its own inverse, and is unitary. -/
theorem householder_conjTranspose_and_mul_self {m : ℕ} (v : Fin m → 𝕜) :
    (householder v)ᴴ = householder v ∧ householder v * householder v = 1 ∧
      householder v ∈ unitary (Matrix (Fin m) (Fin m) 𝕜) := by
  sorry

/-- 5.1: for every vector `x` and index `i₀` some reflector maps `x` to a multiple `γ` of the
`i₀`th coordinate vector, with `|γ|² = ‖x‖²`. -/
theorem exists_householder_mulVec_eq {m : ℕ} (x : Fin m → 𝕜) (i₀ : Fin m) :
    ∃ (v : Fin m → 𝕜) (γ : 𝕜),
      householder v *ᵥ x = Pi.single i₀ γ ∧ ‖γ‖ ^ 2 = ∑ i, ‖x i‖ ^ 2 := by
  sorry

/-- 5.2: the full QR factorization: every matrix, of any shape and rank, is a unitary matrix
times an upper trapezoidal one. -/
theorem exists_unitary_mul_upperTrapezoidal {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) :
    ∃ Q ∈ unitary (Matrix (Fin m) (Fin m) 𝕜), ∃ R : Matrix (Fin m) (Fin n) 𝕜,
      (∀ (i : Fin m) (j : Fin n), (j : ℕ) < i → R i j = 0) ∧ A = Q * R := by
  sorry

/-- 5.2: a reduced QR factorization: `Q` has orthonormal columns and `R` is upper triangular. -/
def IsReducedQR {m n : ℕ} (A Q : Matrix (Fin m) (Fin n) 𝕜) (R : Matrix (Fin n) (Fin n) 𝕜) :
    Prop :=
  Qᴴ * Q = 1 ∧ R.IsUpperTriangular ∧ A = Q * R

/-- 5.2: for `n ≤ m` every `m × n` matrix has a reduced QR factorization. -/
theorem exists_isReducedQR {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) (hnm : n ≤ m) :
    ∃ Q R, IsReducedQR A Q R := by
  sorry

/-- 5.2: at full column rank the reduced QR factorization with positive real diagonal of `R` is
unique. -/
theorem existsUnique_isReducedQR {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜) (hA : A.rank = n) :
    ∃! QR : Matrix (Fin m) (Fin n) 𝕜 × Matrix (Fin n) (Fin n) 𝕜,
      IsReducedQR A QR.1 QR.2 ∧ ∀ i, 0 < RCLike.re (QR.2 i i) ∧ RCLike.im (QR.2 i i) = 0 := by
  sorry

/-- 5.2: in every reduced QR factorization `Rᴴ R = Aᴴ A`; at full column rank `R` is
nonsingular and the columns of `Q` span the range of `A`. -/
theorem IsReducedQR.gram_and_range {m n : ℕ} {A Q : Matrix (Fin m) (Fin n) 𝕜}
    {R : Matrix (Fin n) (Fin n) 𝕜} (h : IsReducedQR A Q R) :
    Rᴴ * R = Aᴴ * A ∧
      (A.rank = n → R.det ≠ 0 ∧
        LinearMap.range (Matrix.toEuclideanLin Q) = LinearMap.range (Matrix.toEuclideanLin A)) := by
  sorry

/-! ## Layer 6: linear least squares -/

/-- 6.1: `x` minimizes the Euclidean residual `‖b - A x‖`. For `𝕜 = ℝ` this is
`GaussianLinearModels`' `IsLeastSquares` of the linear map `Matrix.toEuclideanLin A`. -/
def IsLeastSquaresSolution {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜)
    (b : EuclideanSpace 𝕜 (Fin m)) (x : EuclideanSpace 𝕜 (Fin n)) : Prop :=
  ∀ y, ‖b - Matrix.toEuclideanLin A x‖ ≤ ‖b - Matrix.toEuclideanLin A y‖

/-- Local copy of `GaussianLinearModels` §1.1: `b` is a least-squares solution for the design `X`
and the observation `y`: it minimizes the residual norm `‖y - X b‖` over the parameter space. -/
def IsLeastSquares {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
    (X : E →ₗ[ℝ] F) (y : F) (b : E) : Prop :=
  ∀ b' : E, ‖y - X b‖ ≤ ‖y - X b'‖

/-- Check: over `ℝ` a least-squares solution is one in the sense of `GaussianLinearModels` §1.1
for the design `Matrix.toEuclideanLin A`. -/
theorem isLeastSquaresSolution_iff_isLeastSquares {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℝ)
    (b : EuclideanSpace ℝ (Fin m)) (x : EuclideanSpace ℝ (Fin n)) :
    IsLeastSquaresSolution A b x ↔ IsLeastSquares (Matrix.toEuclideanLin A) b x :=
  Iff.rfl

/-- 6.1: the characterizations of a least-squares solution over `ℝ` or `ℂ`: the normal equations,
orthogonality of the residual to the range, and `A x = P b` for the orthogonal projector `P` onto
the range. -/
theorem isLeastSquaresSolution_tfae {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜)
    (b : EuclideanSpace 𝕜 (Fin m)) (x : EuclideanSpace 𝕜 (Fin n)) :
    List.TFAE
      [IsLeastSquaresSolution A b x,
        Matrix.toEuclideanLin (Aᴴ * A) x = Matrix.toEuclideanLin Aᴴ b,
        ∀ y, inner 𝕜 (Matrix.toEuclideanLin A y) (b - Matrix.toEuclideanLin A x) = 0,
        Matrix.toEuclideanLin A x =
          (LinearMap.range (Matrix.toEuclideanLin A)).starProjection b] := by
  sorry

/-- 6.1: a least-squares solution exists; all of them have the same fitted value `A x`; and the
solution is unique exactly when `A` has full column rank. -/
theorem exists_isLeastSquaresSolution {m n : ℕ} (A : Matrix (Fin m) (Fin n) 𝕜)
    (b : EuclideanSpace 𝕜 (Fin m)) :
    (∃ x, IsLeastSquaresSolution A b x) ∧
      (∀ x y, IsLeastSquaresSolution A b x → IsLeastSquaresSolution A b y →
        Matrix.toEuclideanLin A x = Matrix.toEuclideanLin A y) ∧
      ((∀ x y, IsLeastSquaresSolution A b x → IsLeastSquaresSolution A b y → x = y) ↔
        A.rank = n) := by
  sorry

/-- 6.2: with a reduced QR factorization and nonsingular `R`, the least-squares solution is
`R⁻¹ Qᴴ b`. -/
theorem isLeastSquaresSolution_iff_of_isReducedQR {m n : ℕ} {A Q : Matrix (Fin m) (Fin n) 𝕜}
    {R : Matrix (Fin n) (Fin n) 𝕜} (h : IsReducedQR A Q R) (hR : R.det ≠ 0)
    (b : EuclideanSpace 𝕜 (Fin m)) (x : EuclideanSpace 𝕜 (Fin n)) :
    IsLeastSquaresSolution A b x ↔
      x = Matrix.toEuclideanLin R⁻¹ (Matrix.toEuclideanLin Qᴴ b) := by
  sorry

/-! ## Layer 7: sparse elimination -/

section Sparse

open SimpleGraph in
/-- Local copy of `PerfectAndChordalGraphs` §1.1: a graph is chordal when no cycle on at least
four vertices is an induced subgraph, that is, every cycle of length at least four has a
chord. -/
def IsChordal {V : Type*} (G : SimpleGraph V) : Prop :=
  ∀ n, 4 ≤ n → ¬(cycleGraph n).IsIndContained G

/-- Local copy of `PerfectAndChordalGraphs` §1.1: a bijection `σ : V ≃ Fin n` is a perfect
elimination ordering when, for every vertex `v`, the neighbours of `v` that come after `v` are
pairwise adjacent. -/
def IsPerfectEliminationOrder {V : Type*} {n : ℕ} (G : SimpleGraph V) (σ : V ≃ Fin n) : Prop :=
  ∀ v, G.IsClique {w | G.Adj v w ∧ σ v < σ w}

/-- 7.1: the graph of a square matrix: distinct `i`, `j` are adjacent when `A i j ≠ 0` or
`A j i ≠ 0`. -/
def matrixGraph {R : Type*} [Zero R] {n : ℕ} (A : Matrix (Fin n) (Fin n) R) :
    SimpleGraph (Fin n) :=
  SimpleGraph.fromRel fun i j ↦ A i j ≠ 0

/-- 7.1: elimination of a vertex `v`: its neighbours become pairwise adjacent and `v` becomes
isolated, so the vertex type is kept. -/
def eliminateVertex {V : Type*} (G : SimpleGraph V) (v : V) : SimpleGraph V where
  Adj i j := i ≠ j ∧ i ≠ v ∧ j ≠ v ∧ (G.Adj i j ∨ G.Adj i v ∧ G.Adj v j)
  symm := by
    constructor
    intro i j h
    obtain ⟨hij, hiv, hjv, h⟩ := h
    exact ⟨hij.symm, hjv, hiv, h.elim (fun h ↦ Or.inl h.symm)
      (fun h ↦ Or.inr ⟨h.2.symm, h.1.symm⟩)⟩
  loopless := ⟨fun _ h ↦ h.1 rfl⟩

/-- 7.1: the elimination graphs `G₀ = G`, `G_{k+1}` = `G_k` with vertex `k` eliminated. -/
def eliminationGraph {n : ℕ} (G : SimpleGraph (Fin n)) : ℕ → SimpleGraph (Fin n)
  | 0 => G
  | k + 1 => if hk : k < n then eliminateVertex (eliminationGraph G k) ⟨k, hk⟩
      else eliminationGraph G k

/-- 7.1: the filled graph: all edges of all elimination graphs. -/
def filledGraph {n : ℕ} (G : SimpleGraph (Fin n)) : SimpleGraph (Fin n) :=
  ⨆ k : Fin (n + 1), eliminationGraph G k

/-- Check: the filled graph contains the graph. -/
theorem le_filledGraph {n : ℕ} (G : SimpleGraph (Fin n)) : G ≤ filledGraph G :=
  le_iSup_of_le (0 : Fin (n + 1)) le_rfl

/-- 7.1: the fill path theorem of Rose, Tarjan and Lueker: `i` and `j` are adjacent in the filled
graph exactly when they are distinct and joined by a walk in `G` whose other vertices are all
smaller than both. -/
theorem filledGraph_adj_iff {n : ℕ} (G : SimpleGraph (Fin n)) (i j : Fin n) :
    (filledGraph G).Adj i j ↔
      i ≠ j ∧ ∃ w : G.Walk i j, ∀ v ∈ w.support, v = i ∨ v = j ∨ (v < i ∧ v < j) := by
  sorry

/-- 7.1: Parter's rule: the identity ordering is a perfect elimination ordering of the filled
graph; two larger neighbours of a vertex in the filled graph are adjacent. -/
theorem isPerfectEliminationOrder_filledGraph {n : ℕ} (G : SimpleGraph (Fin n)) :
    IsPerfectEliminationOrder (filledGraph G) (Equiv.refl (Fin n)) := by
  sorry

/-- 7.1: the filled graph is the least supergraph of `G` for which the identity ordering is a
perfect elimination ordering. -/
theorem filledGraph_le_of_isPerfectEliminationOrder {n : ℕ} {G H : SimpleGraph (Fin n)}
    (hGH : G ≤ H) (hH : IsPerfectEliminationOrder H (Equiv.refl (Fin n))) :
    filledGraph G ≤ H := by
  sorry

/-- 7.1: the filled graph is chordal (Parter's rule and the theorem of Fulkerson and Gross,
`PerfectAndChordalGraphs` §1.4). -/
theorem isChordal_filledGraph {n : ℕ} (G : SimpleGraph (Fin n)) : IsChordal (filledGraph G) := by
  sorry

/-- 7.2: the nonzero pattern of an LU factorization lies in the filled graph of the matrix,
when the proper leading principal minors are nonzero. -/
theorem IsLU.adj_filledGraph {K : Type*} [Field K] {n : ℕ} {A L U : Matrix (Fin n) (Fin n) K}
    (h : IsLU A L U) (hA : ∀ k (hk : k < n), (leadingBlock A k hk.le).det ≠ 0) {i j : Fin n}
    (hji : j < i) (hLU : L i j ≠ 0 ∨ U j i ≠ 0) :
    (filledGraph (matrixGraph A)).Adj i j := by
  sorry

/-- 7.2: a nonzero below the diagonal of the Tau Ceti Cholesky factor of a positive definite real
matrix is an edge of the filled graph. -/
theorem cholesky_ne_zero_adj_filledGraph {n : ℕ} (A : TauCeti.PosDefMatrix n) {i j : Fin n}
    (hji : j < i) (h : (TauCeti.cholesky A).1 i j ≠ 0) :
    (filledGraph (matrixGraph (A.1 : Matrix (Fin n) (Fin n) ℝ))).Adj i j := by
  sorry

/-- 7.2: the filled graph is attained: every graph is the graph of a positive definite matrix
whose Cholesky factor has a nonzero at every edge of the filled graph. -/
theorem exists_posDefMatrix_cholesky_pattern {n : ℕ} (G : SimpleGraph (Fin n)) :
    ∃ A : TauCeti.PosDefMatrix n, matrixGraph (A.1 : Matrix (Fin n) (Fin n) ℝ) = G ∧
      ∀ i j, j < i → ((TauCeti.cholesky A).1 i j ≠ 0 ↔ (filledGraph G).Adj i j) := by
  sorry

/-- 7.3: `i` is the parent of `j` in the elimination tree: the least neighbour of `j` in the
filled graph that is larger than `j`. A vertex with no larger neighbour is a root. -/
def IsEtreeParent {n : ℕ} (G : SimpleGraph (Fin n)) (j i : Fin n) : Prop :=
  j < i ∧ (filledGraph G).Adj j i ∧ ∀ i', j < i' → (filledGraph G).Adj j i' → i ≤ i'

/-- 7.3: Liu's theorem: an edge `{i, k}` of the filled graph with `i < k` makes `k` a proper
ancestor of `i` in the elimination tree; in particular every edge of `G` does. -/
theorem transGen_isEtreeParent_of_adj {n : ℕ} (G : SimpleGraph (Fin n)) {i k : Fin n}
    (hik : i < k) (h : (filledGraph G).Adj i k) :
    Relation.TransGen (IsEtreeParent G) i k := by
  sorry

/-- 7.3: the row subtree: the structure of row `k` of the factor, `{k}` together with the smaller
neighbours of `k` in the filled graph, is the union of the tree paths from the smaller neighbours
of `k` in `G` up to `k`. -/
theorem rowStructure_iff {n : ℕ} (G : SimpleGraph (Fin n)) (j k : Fin n) :
    (j = k ∨ (j < k ∧ (filledGraph G).Adj j k)) ↔
      (j = k ∨ ∃ i, i < k ∧ G.Adj i k ∧ Relation.ReflTransGen (IsEtreeParent G) i j ∧
        Relation.ReflTransGen (IsEtreeParent G) j k) := by
  sorry

/-- 7.3: equivalent reorderings: relabelling the vertices by a permutation `σ` that numbers every
vertex of the elimination tree before its parent (a topological ordering, for instance a
postordering) does not change the filled graph or the elimination tree up to the relabelling. -/
theorem filledGraph_map_of_isTopological {n : ℕ} (G : SimpleGraph (Fin n))
    (σ : Equiv.Perm (Fin n)) (hσ : ∀ i j, IsEtreeParent G j i → σ j < σ i) :
    filledGraph (G.map σ.toEmbedding) = (filledGraph G).map σ.toEmbedding ∧
      ∀ i j, IsEtreeParent (G.map σ.toEmbedding) (σ j) (σ i) ↔ IsEtreeParent G j i := by
  sorry

end Sparse

/-! ## Supplier names cited in the README -/

#check @Matrix.IsLowerTriangular
#check @Matrix.IsUpperTriangular
#check @Matrix.det_fromBlocks₁₁
#check @Matrix.PosDef.fromBlocks₁₁
#check @LDL.lower_conj_diag
#check @LinearMap.singularValues_antitone
#check @Fin.univ_val_map
#check @LinearMap.adjoint
#check @Submodule.starProjection
#check @ContinuousLinearMap.forall_norm_sub_apply_le_iff_adjoint_apply_sub_eq_zero
#check @Finset.exists_max_image
#check @SimpleGraph.Walk
#check @SimpleGraph.map
#check @TauCeti.one_le_conditionNumber
#check @TauCeti.cholesky_mul_transpose
#check @TauCeti.eq_cholesky_of_mul_transpose_self_eq

end TauCetiRoadmap.MatrixFactorizationsAndSparseElimination

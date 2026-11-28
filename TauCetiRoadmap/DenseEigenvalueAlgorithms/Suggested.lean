module

public import Mathlib
public import TauCeti.Analysis.Matrix.SingularValues
public import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.Frobenius
public import TauCeti.Analysis.InnerProductSpace.HermitianDilation.Basic
public import TauCeti.Analysis.InnerProductSpace.Projection.Gap

/-!
# Dense eigenvalue algorithms: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). Matrices are `Matrix (Fin m) (Fin n) 𝕜` over an `RCLike`
field `𝕜`, or over a field `K` where no norm enters. Indices are zero-based: `σ₁` and `λ₁` of the
sources are `singularValues 0` and `eigenvalues₀ 0`, the first column of a matrix is column `0`,
and the QR iteration is numbered from `0` (`B 0 = A`), so that the sources' `A_{i+1}`, `Q_i`,
`R_i`, `P_i = Q_1 ⋯ Q_i` and `U_i = R_i ⋯ R_1` are `B i`, `Q (i - 1)`, `R (i - 1)`,
`accumulatedQ Q i` and `accumulatedR R i`. Singular values are Mathlib's
`LinearMap.singularValues` of `Matrix.toEuclideanLin A`, decreasing and zero past the dimension.
Matrix norms are Mathlib's scoped instances, opened in the section of each statement. A phase
matrix is `diagonal s` with `‖s i‖ = 1` for every `i`. Every use of `⁻¹` on a matrix carries a
determinant hypothesis or one from which it is proved.

`MatrixFactorizationsAndSparseElimination` §1.2 owns `IsEigenvalueEnumeration`, §2.1 owns
`leadingBlock` and §5.1 owns `householder`; they appear here as verbatim local copies whose
docstrings name their owner.

Declarations proved here, as Checks (each closes in a few steps from Mathlib or from the
definitions): `IsRealSchurForm.charpoly_eq_prod`, `shiftedQRStep_eq_conjTranspose_mul_mul` and
`isQRIteration_iff_isShiftedQRIteration_zero`.

The `#check` lines at the end of the file pin the Mathlib and Tau Ceti declarations that the
README names in its routes and supplier contracts.

Bold headlines of the README not stated here: the upper Hessenberg shape of a real Schur form
(§1.2), the block eigenvectors of the Hermitian dilation (§2.2), the convergence of the column
flags of the QR algorithm through subspace iteration (§3.3), and the Schur form of the limit in
§4.1.
-/

@[expose] public section

noncomputable section

open Matrix Filter Topology Polynomial
open scoped ComplexOrder

namespace TauCetiRoadmap.DenseEigenvalueAlgorithms

/-! ## Copies of definitions owned by MatrixFactorizationsAndSparseElimination -/

/-- Local copy of `MatrixFactorizationsAndSparseElimination` §1.2 (`IsEigenvalueEnumeration`):
`α` enumerates the eigenvalues of `A` with algebraic multiplicity: the multiset of its values is
the multiset of roots of the characteristic polynomial. -/
def IsEigenvalueEnumeration {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) (α : Fin n → ℂ) : Prop :=
  (List.ofFn α : Multiset ℂ) = A.charpoly.roots

section CopiesField

variable {K : Type*} [Field K]

/-- Local copy of `MatrixFactorizationsAndSparseElimination` §2.1 (`leadingBlock`): the leading
principal block of order `k ≤ n`, the matrix `A(1:k, 1:k)` of the sources. -/
def leadingBlock {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (k : ℕ) (hk : k ≤ n) :
    Matrix (Fin k) (Fin k) K :=
  A.submatrix (Fin.castLE hk) (Fin.castLE hk)

end CopiesField

variable {𝕜 : Type*} [RCLike 𝕜]

/-- Local copy of `MatrixFactorizationsAndSparseElimination` §5.1 (`householder`): the
Householder reflector `I - 2 v vᴴ / (vᴴ v)`; it is `I` for `v = 0`. -/
def householder {m : ℕ} (v : Fin m → 𝕜) : Matrix (Fin m) (Fin m) 𝕜 :=
  1 - (2 / (star v ⬝ᵥ v)) • vecMulVec v (star v)

/-! ## Layer 1: real Schur forms -/

/-- 1.1: `T` is in real Schur form for the block map `b`: `b` is monotone, `T` is block upper
triangular for `b`, every block has order `1` or `2`, and every diagonal block of order `2` has a
characteristic polynomial without real roots. -/
def IsRealSchurForm {n k : ℕ} (T : Matrix (Fin n) (Fin n) ℝ) (b : Fin n → Fin k) : Prop :=
  Monotone b ∧ T.BlockTriangular b ∧ ∀ j : Fin k,
    Fintype.card {i // b i = j} = 1 ∨
      (Fintype.card {i // b i = j} = 2 ∧ ∀ x : ℝ, (T.toSquareBlock b j).charpoly.eval x ≠ 0)

/-- 1.1: a `2 × 2` real matrix has no real eigenvalue exactly when the discriminant
`(a - d)² + 4 b c` of its characteristic polynomial is negative. -/
theorem forall_charpoly_eval_ne_zero_iff (M : Matrix (Fin 2) (Fin 2) ℝ) :
    (∀ x : ℝ, M.charpoly.eval x ≠ 0) ↔ (M 0 0 - M 1 1) ^ 2 + 4 * M 0 1 * M 1 0 < 0 := by
  sorry

/-- Check of 1.1: the characteristic polynomial of a real Schur form is the product of those of
its diagonal blocks (Mathlib `Matrix.BlockTriangular.charpoly`). -/
theorem IsRealSchurForm.charpoly_eq_prod {n k : ℕ} {T : Matrix (Fin n) (Fin n) ℝ}
    {b : Fin n → Fin k} (h : IsRealSchurForm T b) :
    T.charpoly = ∏ j ∈ Finset.univ.image b, (T.toSquareBlock b j).charpoly :=
  h.2.1.charpoly

/-- 1.1: a real matrix whose eigenvalues are all real is orthogonally similar to an upper
triangular matrix with those eigenvalues on the diagonal, in any prescribed order. -/
theorem exists_orthogonal_isUpperTriangular_of_isEigenvalueEnumeration {n : ℕ}
    (A : Matrix (Fin n) (Fin n) ℝ) (eigs : Fin n → ℝ)
    (h : IsEigenvalueEnumeration (A.map (algebraMap ℝ ℂ)) fun i ↦ (eigs i : ℂ)) :
    ∃ Q ∈ Matrix.orthogonalGroup (Fin n) ℝ,
      (Qᵀ * A * Q).IsUpperTriangular ∧ ∀ i, (Qᵀ * A * Q) i i = eigs i := by
  sorry

/-- 1.2: the real Schur form with a prescribed order of the blocks. Given multisets `s j`, each a
real eigenvalue or a pair of complex conjugate nonreal eigenvalues, that add up to the spectrum
of `A`, some orthogonal `Q` brings `A` to real Schur form with diagonal block `j` having spectrum
`s j`. -/
theorem exists_orthogonal_isRealSchurForm {n k : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (s : Fin k → Multiset ℂ)
    (hs : ∀ j, (∃ r : ℝ, s j = {(r : ℂ)}) ∨ ∃ z : ℂ, z.im ≠ 0 ∧ s j = {z, star z})
    (hsum : ∑ j, s j = (A.map (algebraMap ℝ ℂ)).charpoly.roots) :
    ∃ Q ∈ Matrix.orthogonalGroup (Fin n) ℝ, ∃ b : Fin n → Fin k,
      IsRealSchurForm (Qᵀ * A * Q) b ∧
        ∀ j, (((Qᵀ * A * Q).toSquareBlock b j).map (algebraMap ℝ ℂ)).charpoly.roots = s j := by
  sorry

/-! ## Layer 2: the singular value decomposition -/

section SVD

variable {m n : ℕ}

/-- 2.1: the `m × n` rectangular diagonal matrix with diagonal `d 0, d 1, …`. -/
def rectDiagonal (d : ℕ → ℝ) : Matrix (Fin m) (Fin n) 𝕜 :=
  fun i j ↦ if i.val = j.val then (d i.val : 𝕜) else 0

/-- 2.1: the rectangular diagonal matrix of the singular values of `A`. -/
def singularValueDiagonal (A : Matrix (Fin m) (Fin n) 𝕜) : Matrix (Fin m) (Fin n) 𝕜 :=
  rectDiagonal fun i ↦ A.toEuclideanLin.singularValues i

/-- 2.1: a rectangular diagonal matrix with nonnegative entries, decreasing on the first
`min m n` indices, has these entries as its singular values. -/
theorem singularValues_rectDiagonal (d : ℕ → ℝ) (hd : ∀ i < min m n, 0 ≤ d i)
    (hanti : AntitoneOn d (Set.Iio (min m n))) (i : ℕ) (hi : i < min m n) :
    (rectDiagonal (𝕜 := 𝕜) (m := m) (n := n) d).toEuclideanLin.singularValues i = d i := by
  sorry

/-- 2.1: **the singular value decomposition** of a rectangular matrix, with unitary (over `ℝ`,
orthogonal) factors and the singular values in decreasing order on the diagonal. -/
theorem exists_unitary_conjTranspose_mul_eq_singularValueDiagonal
    (A : Matrix (Fin m) (Fin n) 𝕜) :
    ∃ U ∈ unitary (Matrix (Fin m) (Fin m) 𝕜), ∃ V ∈ unitary (Matrix (Fin n) (Fin n) 𝕜),
      Uᴴ * A * V = singularValueDiagonal A := by
  sorry

/-- 2.1: the diagonal of a singular value decomposition is determined by `A`: in every
factorization `Uᴴ A V = rectDiagonal d` with unitary `U`, `V` and `d` nonnegative and decreasing
on the first `min m n` indices, `d` lists the singular values. -/
theorem singularValues_eq_of_conjTranspose_mul_eq_rectDiagonal (A : Matrix (Fin m) (Fin n) 𝕜)
    {U : Matrix (Fin m) (Fin m) 𝕜} {V : Matrix (Fin n) (Fin n) 𝕜}
    (hU : U ∈ unitary (Matrix (Fin m) (Fin m) 𝕜)) (hV : V ∈ unitary (Matrix (Fin n) (Fin n) 𝕜))
    (d : ℕ → ℝ) (hd : ∀ i < min m n, 0 ≤ d i) (hanti : AntitoneOn d (Set.Iio (min m n)))
    (h : Uᴴ * A * V = rectDiagonal d) (i : ℕ) (hi : i < min m n) :
    A.toEuclideanLin.singularValues i = d i := by
  sorry

/-- 2.1: the squared singular values are the decreasing eigenvalues of `Aᴴ A` (all `n` of them)
and of `A Aᴴ` (all `m` of them), the eigenvalues past `min m n` being `0`. -/
theorem sq_singularValues_eq_eigenvalues₀ (A : Matrix (Fin m) (Fin n) 𝕜) :
    (∀ i : Fin n, A.toEuclideanLin.singularValues i ^ 2 =
      (isHermitian_conjTranspose_mul_self A).eigenvalues₀ (Fin.cast (Fintype.card_fin n).symm i))
    ∧ ∀ i : Fin m, A.toEuclideanLin.singularValues i ^ 2 =
      (isHermitian_mul_conjTranspose_self A).eigenvalues₀ (Fin.cast (Fintype.card_fin m).symm i) :=
  by sorry

/-- 2.1: the rank of `A` is the number of its nonzero singular values. -/
theorem rank_eq_card_support_singularValues (A : Matrix (Fin m) (Fin n) 𝕜) :
    A.rank = A.toEuclideanLin.singularValues.support.card := by
  sorry

section Frobenius

open scoped Matrix.Norms.Frobenius

/-- 2.1: the squared Frobenius norm is the sum of the squared singular values. -/
theorem frobenius_norm_sq_eq_sum_sq_singularValues (A : Matrix (Fin m) (Fin n) 𝕜) :
    ‖A‖ ^ 2 = ∑ i ∈ Finset.range (min m n), A.toEuclideanLin.singularValues i ^ 2 := by
  sorry

end Frobenius

/-- 2.1: the singular values of a Hermitian matrix are the absolute values of its eigenvalues,
as multisets. -/
theorem IsHermitian.singularValues_eq_abs_eigenvalues₀ {A : Matrix (Fin n) (Fin n) 𝕜}
    (hA : A.IsHermitian) :
    (Finset.univ.val.map fun i : Fin n ↦ A.toEuclideanLin.singularValues i) =
      Finset.univ.val.map fun i ↦ |hA.eigenvalues₀ i| := by
  sorry

/-- 2.2: the Hermitian dilation `[[0, Aᴴ], [A, 0]]` of a square matrix has characteristic
polynomial `∏ (X - σᵢ)(X + σᵢ)`, so its eigenvalues are `±σᵢ`. -/
theorem charpoly_fromBlocks_zero_conjTranspose (A : Matrix (Fin n) (Fin n) 𝕜) :
    (fromBlocks 0 Aᴴ A 0).charpoly =
      ∏ i : Fin n, (X - C (A.toEuclideanLin.singularValues i : 𝕜)) *
        (X + C (A.toEuclideanLin.singularValues i : 𝕜)) := by
  sorry

/-- 2.3: **interlacing under deletion of a column**: with the zero extension of singular values
past the dimension, `σᵢ₊₁(A) ≤ σᵢ(Â) ≤ σᵢ(A)` for every `i`, whatever the shape of `A`. -/
theorem singularValues_submatrix_interlace (A : Matrix (Fin m) (Fin (n + 1)) 𝕜)
    (e : Fin n ↪ Fin (n + 1)) (i : ℕ) :
    A.toEuclideanLin.singularValues (i + 1) ≤
        (A.submatrix id e).toEuclideanLin.singularValues i ∧
      (A.submatrix id e).toEuclideanLin.singularValues i ≤ A.toEuclideanLin.singularValues i := by
  sorry

/-- 2.3: interlacing under deletion of a row. -/
theorem singularValues_submatrix_rows_interlace (A : Matrix (Fin (m + 1)) (Fin n) 𝕜)
    (e : Fin m ↪ Fin (m + 1)) (i : ℕ) :
    A.toEuclideanLin.singularValues (i + 1) ≤
        (A.submatrix e id).toEuclideanLin.singularValues i ∧
      (A.submatrix e id).toEuclideanLin.singularValues i ≤ A.toEuclideanLin.singularValues i := by
  sorry

end SVD

/-! ## Layer 3: the QR algorithm -/

section QR

variable {n : ℕ}

/-- 3.1: an exact QR iteration, numbered from zero: `B 0 = A`, `B k = Q k * R k` with `Q k`
unitary and `R k` upper triangular, and `B (k + 1) = R k * Q k`. -/
def IsQRIteration (A : Matrix (Fin n) (Fin n) 𝕜) (B Q R : ℕ → Matrix (Fin n) (Fin n) 𝕜) :
    Prop :=
  B 0 = A ∧ ∀ k, Q k ∈ unitary (Matrix (Fin n) (Fin n) 𝕜) ∧ (R k).IsUpperTriangular ∧
    B k = Q k * R k ∧ B (k + 1) = R k * Q k

/-- 3.1: the accumulated unitary factor `Q 0 * Q 1 * ⋯ * Q (k - 1)`. -/
def accumulatedQ (Q : ℕ → Matrix (Fin n) (Fin n) 𝕜) : ℕ → Matrix (Fin n) (Fin n) 𝕜
  | 0 => 1
  | k + 1 => accumulatedQ Q k * Q k

/-- 3.1: the accumulated triangular factor `R (k - 1) * ⋯ * R 1 * R 0`. -/
def accumulatedR (R : ℕ → Matrix (Fin n) (Fin n) 𝕜) : ℕ → Matrix (Fin n) (Fin n) 𝕜
  | 0 => 1
  | k + 1 => R k * accumulatedR R k

/-- 3.1: the QR iteration is a sequence of unitary similarities, and the accumulated factors are a
QR factorization of the powers of `A`: `B k = Pₖᴴ A Pₖ` and `Aᵏ = Pₖ Uₖ`. -/
theorem IsQRIteration.accumulated {A : Matrix (Fin n) (Fin n) 𝕜}
    {B Q R : ℕ → Matrix (Fin n) (Fin n) 𝕜} (h : IsQRIteration A B Q R) (k : ℕ) :
    accumulatedQ Q k ∈ unitary (Matrix (Fin n) (Fin n) 𝕜) ∧
      (accumulatedR R k).IsUpperTriangular ∧
      B k = (accumulatedQ Q k)ᴴ * A * accumulatedQ Q k ∧
      A ^ k = accumulatedQ Q k * accumulatedR R k := by
  sorry

/-- 3.2: a nonsingular matrix has exactly one QR iteration whose triangular factors have positive
real diagonal. -/
theorem existsUnique_isQRIteration_pos (A : Matrix (Fin n) (Fin n) 𝕜) (hA : A.det ≠ 0) :
    ∃! BQR : (ℕ → Matrix (Fin n) (Fin n) 𝕜) × (ℕ → Matrix (Fin n) (Fin n) 𝕜) ×
        (ℕ → Matrix (Fin n) (Fin n) 𝕜),
      IsQRIteration A BQR.1 BQR.2.1 BQR.2.2 ∧
        ∀ k i, 0 < RCLike.re (BQR.2.2 k i i) ∧ RCLike.im (BQR.2.2 k i i) = 0 := by
  sorry

/-- 3.2: simultaneous iteration from the identity: `Q̂ 0 = 1` and `A Q̂ k = Q̂ (k + 1) R̂ (k + 1)`
with `Q̂ (k + 1)` unitary and `R̂ (k + 1)` upper triangular with positive real diagonal. -/
def IsSimultaneousIteration (A : Matrix (Fin n) (Fin n) 𝕜)
    (Qh Rh : ℕ → Matrix (Fin n) (Fin n) 𝕜) : Prop :=
  Qh 0 = 1 ∧ ∀ k, Qh (k + 1) ∈ unitary (Matrix (Fin n) (Fin n) 𝕜) ∧
    (Rh (k + 1)).IsUpperTriangular ∧
    (∀ i, 0 < RCLike.re (Rh (k + 1) i i) ∧ RCLike.im (Rh (k + 1) i i) = 0) ∧
    A * Qh k = Qh (k + 1) * Rh (k + 1)

/-- 3.2: the QR iteration normalized by positive real diagonals is simultaneous iteration:
`Pₖ = Q̂ₖ` and `Uₖ = R̂ₖ ⋯ R̂₁`. (`A = Q 0 * R 0` is nonsingular by the positivity of `R 0`.) -/
theorem IsQRIteration.eq_simultaneousIteration {A : Matrix (Fin n) (Fin n) 𝕜}
    {B Q R : ℕ → Matrix (Fin n) (Fin n) 𝕜} (h : IsQRIteration A B Q R)
    (hR : ∀ k i, 0 < RCLike.re (R k i i) ∧ RCLike.im (R k i i) = 0)
    {Qh Rh : ℕ → Matrix (Fin n) (Fin n) 𝕜} (hS : IsSimultaneousIteration A Qh Rh) (k : ℕ) :
    accumulatedQ Q k = Qh k ∧ accumulatedR R k = accumulatedR (fun j ↦ Rh (j + 1)) k := by
  sorry

/-- 3.2: two QR factorizations of the same nonsingular matrix differ by a phase matrix. -/
theorem exists_phase_of_mul_eq_mul {M Q₁ Q₂ R₁ R₂ : Matrix (Fin n) (Fin n) 𝕜} (hM : M.det ≠ 0)
    (hQ₁ : Q₁ ∈ unitary (Matrix (Fin n) (Fin n) 𝕜)) (hQ₂ : Q₂ ∈ unitary (Matrix (Fin n) (Fin n) 𝕜))
    (hR₁ : R₁.IsUpperTriangular) (hR₂ : R₂.IsUpperTriangular) (h₁ : M = Q₁ * R₁)
    (h₂ : M = Q₂ * R₂) :
    ∃ s : Fin n → 𝕜, (∀ i, ‖s i‖ = 1) ∧ Q₂ = Q₁ * diagonal s ∧ R₂ = (diagonal s)ᴴ * R₁ := by
  sorry

/-- 3.3: for nonsingular `A`, the first `j` columns of `Pₖ` span the image under `Aᵏ` of the first
`j` coordinate vectors. -/
theorem IsQRIteration.span_accumulatedQ_cols {A : Matrix (Fin n) (Fin n) 𝕜} (hA : A.det ≠ 0)
    {B Q R : ℕ → Matrix (Fin n) (Fin n) 𝕜} (h : IsQRIteration A B Q R) (k j : ℕ) (hj : j ≤ n) :
    Submodule.span 𝕜 (Set.range fun i : Fin j ↦
        (accumulatedQ Q k).toEuclideanLin (EuclideanSpace.single (Fin.castLE hj i) 1)) =
      (Submodule.span 𝕜 (Set.range fun i : Fin j ↦
        (EuclideanSpace.single (Fin.castLE hj i) (1 : 𝕜)))).map (A ^ k).toEuclideanLin := by
  sorry

end QR

/-! ## Layer 4: convergence of the unshifted QR algorithm -/

section Convergence

variable {n : ℕ}

/-- 4.1: **convergence of the unshifted QR algorithm.** Let `A = X D X⁻¹` with `D` diagonal, the
eigenvalues nonzero and of strictly decreasing moduli, and the proper leading minors of `X⁻¹`
nonzero, and let `X = U T` be a QR factorization. Then there are phases `s k` with
`S_kᴴ Q k S_{k+1} → 1` and `S_{k+1}ᴴ R k S_k → T D T⁻¹`, `S_kᴴ B k S_k → T D T⁻¹`. -/
theorem IsQRIteration.exists_tendsto_conjTranspose_mul {A : Matrix (Fin n) (Fin n) ℂ}
    {B Q R : ℕ → Matrix (Fin n) (Fin n) ℂ} (h : IsQRIteration A B Q R) (eigs : Fin n → ℂ)
    (hord : StrictAnti fun i ↦ ‖eigs i‖) (hne : ∀ i, eigs i ≠ 0)
    (X : Matrix (Fin n) (Fin n) ℂ) (hX : X.det ≠ 0) (hA : A = X * diagonal eigs * X⁻¹)
    (hLU : ∀ (k : ℕ) (hk : k < n), (leadingBlock X⁻¹ k hk.le).det ≠ 0)
    {U T : Matrix (Fin n) (Fin n) ℂ} (hU : U ∈ unitary (Matrix (Fin n) (Fin n) ℂ))
    (hT : T.IsUpperTriangular) (hUT : X = U * T) :
    ∃ s : ℕ → Fin n → ℂ, (∀ k i, ‖s k i‖ = 1) ∧
      Tendsto (fun k ↦ (diagonal (s k))ᴴ * Q k * diagonal (s (k + 1))) atTop (𝓝 1) ∧
      Tendsto (fun k ↦ (diagonal (s (k + 1)))ᴴ * R k * diagonal (s k)) atTop
        (𝓝 (T * diagonal eigs * T⁻¹)) ∧
      Tendsto (fun k ↦ (diagonal (s k))ᴴ * B k * diagonal (s k)) atTop
        (𝓝 (T * diagonal eigs * T⁻¹)) := by
  sorry

/-- 4.2: under the hypotheses of 4.1 the diagonal entries of the QR iterates converge to the
eigenvalues in order of decreasing modulus, and the entries below the diagonal tend to `0`. -/
theorem IsQRIteration.tendsto_diag_and_tendsto_below {A : Matrix (Fin n) (Fin n) ℂ}
    {B Q R : ℕ → Matrix (Fin n) (Fin n) ℂ} (h : IsQRIteration A B Q R) (eigs : Fin n → ℂ)
    (hord : StrictAnti fun i ↦ ‖eigs i‖) (hne : ∀ i, eigs i ≠ 0)
    (X : Matrix (Fin n) (Fin n) ℂ) (hX : X.det ≠ 0) (hA : A = X * diagonal eigs * X⁻¹)
    (hLU : ∀ (k : ℕ) (hk : k < n), (leadingBlock X⁻¹ k hk.le).det ≠ 0) :
    (∀ i, Tendsto (fun k ↦ B k i i) atTop (𝓝 (eigs i))) ∧
      ∀ i j, j < i → Tendsto (fun k ↦ B k i j) atTop (𝓝 0) := by
  sorry

section Symmetric

open scoped Matrix.Norms.L2Operator

/-- 4.3: **the real symmetric case with its rate.** If `A = Q₀ diag(λ) Q₀ᵀ` is real symmetric with
`|λ₀| > |λ₁| > ⋯` and the leading minors of the orthogonal `Q₀` are nonzero, then
`‖B k - diag(λ)‖ ≤ C cᵏ` and, after sign changes of its columns, `‖Pₖ - Q₀‖ ≤ C cᵏ`, where
`c = maxᵢ |λᵢ₊₁| / |λᵢ|`. -/
theorem IsQRIteration.norm_sub_diagonal_le_of_isSymm {A : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ}
    {B Q R : ℕ → Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ} (h : IsQRIteration A B Q R)
    (eigs : Fin (n + 1) → ℝ) (hord : StrictAnti fun i ↦ |eigs i|)
    (Q₀ : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ) (hQ₀ : Q₀ ∈ Matrix.orthogonalGroup (Fin (n + 1)) ℝ)
    (hA : A = Q₀ * diagonal eigs * Q₀ᵀ)
    (hminor : ∀ (k : ℕ) (hk : k ≤ n + 1), (leadingBlock Q₀ k hk).det ≠ 0)
    (c : ℝ) (hc : c = ⨆ i : Fin n, |eigs i.succ| / |eigs i.castSucc|) :
    ∃ C : ℝ, ∃ σ : ℕ → Fin (n + 1) → ℝ, (∀ k i, σ k i = 1 ∨ σ k i = -1) ∧ ∀ k,
      ‖B k - diagonal eigs‖ ≤ C * c ^ k ∧ ‖accumulatedQ Q k * diagonal (σ k) - Q₀‖ ≤ C * c ^ k := by
  sorry

end Symmetric

end Convergence

/-! ## Layer 5: Hessenberg form and shifted QR steps -/

section Hessenberg

variable {n : ℕ}

/-- 5.1: `M` is tridiagonal: it and its transpose are upper Hessenberg. -/
def IsTridiagonal {R : Type*} [Zero R] (M : Matrix (Fin n) (Fin n) R) : Prop :=
  M.IsUpperHessenberg ∧ Mᵀ.IsUpperHessenberg

/-- 5.1: **Hessenberg reduction.** `A` is unitarily similar to an upper Hessenberg matrix through
the product of `n - 2` (no factor for `n ≤ 2`) Householder reflectors, the `k`th acting on the
coordinates after `k`; if `A` is Hermitian, the reduced matrix is Hermitian tridiagonal. -/
theorem exists_householder_isUpperHessenberg (A : Matrix (Fin n) (Fin n) 𝕜) :
    ∃ v : Fin (n - 2) → Fin n → 𝕜, (∀ (k : Fin (n - 2)) (i : Fin n), i.val ≤ k.val → v k i = 0) ∧
      let Q := (List.ofFn fun k ↦ householder (v k)).prod
      Q ∈ unitary (Matrix (Fin n) (Fin n) 𝕜) ∧ (Qᴴ * A * Q).IsUpperHessenberg ∧
        (A.IsHermitian → (Qᴴ * A * Q).IsHermitian ∧ IsTridiagonal (Qᴴ * A * Q)) := by
  sorry

/-- 5.2: `H` is an unreduced upper Hessenberg matrix: upper Hessenberg with every subdiagonal
entry nonzero. -/
def IsUnreducedHessenberg {K : Type*} [Zero K] (H : Matrix (Fin n) (Fin n) K) : Prop :=
  H.IsUpperHessenberg ∧ ∀ i j : Fin n, i.val = j.val + 1 → H i j ≠ 0

/-- 5.2: every eigenvalue of an unreduced Hessenberg matrix has geometric multiplicity one:
`H - μ I` has rank at least `n - 1` for every `μ`. -/
theorem IsUnreducedHessenberg.le_rank_sub_smul {K : Type*} [Field K]
    {H : Matrix (Fin n) (Fin n) K} (hH : IsUnreducedHessenberg H) (μ : K) :
    n ≤ (H - μ • (1 : Matrix (Fin n) (Fin n) K)).rank + 1 := by
  sorry

/-- Check of 5.2: a shifted QR step `H' = R Q + k I` from `H - k I = Q R` with unitary `Q` is the
unitary similarity `Qᴴ H Q`. -/
theorem shiftedQRStep_eq_conjTranspose_mul_mul {H Q R : Matrix (Fin n) (Fin n) 𝕜} (k : 𝕜)
    (hQ : Q ∈ unitary (Matrix (Fin n) (Fin n) 𝕜)) (hQR : H - k • 1 = Q * R) :
    R * Q + k • 1 = Qᴴ * H * Q := by
  have hs : Qᴴ * Q = 1 := Unitary.star_mul_self_of_mem hQ
  have hR : R = Qᴴ * (H - k • 1) := by
    rw [hQR, ← Matrix.mul_assoc, hs, Matrix.one_mul]
  rw [hR, Matrix.mul_sub, Matrix.sub_mul, Matrix.mul_smul, Matrix.mul_one, Matrix.smul_mul, hs,
    sub_add_cancel]

/-- 5.2: a shifted QR step with nonsingular `H - k I` keeps upper Hessenberg form. -/
theorem IsUpperHessenberg.shiftedQRStep {H Q R : Matrix (Fin n) (Fin n) 𝕜}
    (hH : H.IsUpperHessenberg) (k : 𝕜) (hQ : Q ∈ unitary (Matrix (Fin n) (Fin n) 𝕜))
    (hR : R.IsUpperTriangular) (hQR : H - k • 1 = Q * R) (hk : (H - k • 1).det ≠ 0) :
    (R * Q + k • 1).IsUpperHessenberg := by
  sorry

/-- 5.2: if `H` is unreduced and `k` is not an eigenvalue, the shifted QR step is unreduced upper
Hessenberg, and Hermitian tridiagonal when `H` is Hermitian. -/
theorem IsUnreducedHessenberg.shiftedQRStep {H Q R : Matrix (Fin n) (Fin n) 𝕜}
    (hH : IsUnreducedHessenberg H) (k : 𝕜) (hQ : Q ∈ unitary (Matrix (Fin n) (Fin n) 𝕜))
    (hR : R.IsUpperTriangular) (hQR : H - k • 1 = Q * R) (hk : (H - k • 1).det ≠ 0) :
    IsUnreducedHessenberg (R * Q + k • 1) ∧
      (H.IsHermitian → (R * Q + k • 1).IsHermitian ∧ IsTridiagonal (R * Q + k • 1)) := by
  sorry

/-- 5.2: **deflation.** If `H` is unreduced of order `n + 1` and `k` is an eigenvalue, then for
every QR factorization of `H - k I` the step `H' = R Q + k I` is upper Hessenberg, its last row is
`(0, …, 0, k)`, and its leading block of order `n` is unreduced. -/
theorem IsUnreducedHessenberg.shiftedQRStep_of_det_eq_zero
    {H Q R : Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜} (hH : IsUnreducedHessenberg H) (k : 𝕜)
    (hQ : Q ∈ unitary (Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜)) (hR : R.IsUpperTriangular)
    (hQR : H - k • 1 = Q * R) (hk : (H - k • 1).det = 0) :
    (R * Q + k • 1).IsUpperHessenberg ∧
      (∀ j, (R * Q + k • 1) (Fin.last n) j = if j = Fin.last n then k else 0) ∧
      IsUnreducedHessenberg ((R * Q + k • 1).submatrix Fin.castSucc Fin.castSucc) := by
  sorry

/-- 5.3: the shifted QR iteration with shifts `k i`: `B 0 = A`, `B i - k i I = Q i R i` with
`Q i` unitary and `R i` upper triangular, and `B (i + 1) = R i Q i + k i I`. -/
def IsShiftedQRIteration (A : Matrix (Fin n) (Fin n) 𝕜) (k : ℕ → 𝕜)
    (B Q R : ℕ → Matrix (Fin n) (Fin n) 𝕜) : Prop :=
  B 0 = A ∧ ∀ i, Q i ∈ unitary (Matrix (Fin n) (Fin n) 𝕜) ∧ (R i).IsUpperTriangular ∧
    B i - k i • 1 = Q i * R i ∧ B (i + 1) = R i * Q i + k i • 1

/-- Check of 5.3: the unshifted iteration is the shifted one with zero shifts. -/
theorem isQRIteration_iff_isShiftedQRIteration_zero (A : Matrix (Fin n) (Fin n) 𝕜)
    (B Q R : ℕ → Matrix (Fin n) (Fin n) 𝕜) :
    IsQRIteration A B Q R ↔ IsShiftedQRIteration A 0 B Q R := by
  simp [IsQRIteration, IsShiftedQRIteration]

/-- 5.3: the accumulated factors of the shifted iteration: `B i = Pᵢᴴ A Pᵢ` and
`(A - k (i - 1) I) ⋯ (A - k 0 I) = Pᵢ Uᵢ`. -/
theorem IsShiftedQRIteration.accumulated {A : Matrix (Fin n) (Fin n) 𝕜} {k : ℕ → 𝕜}
    {B Q R : ℕ → Matrix (Fin n) (Fin n) 𝕜} (h : IsShiftedQRIteration A k B Q R) (i : ℕ) :
    B i = (accumulatedQ Q i)ᴴ * A * accumulatedQ Q i ∧
      accumulatedR (fun j ↦ A - k j • 1) i = accumulatedQ Q i * accumulatedR R i := by
  sorry

/-- 5.4: Wilkinson's shift for the trailing block `[[a, b], [b, c]]`: its eigenvalue nearest to
`c`, the smaller one in case of a tie. -/
def wilkinsonShift (a b c : ℝ) : ℝ :=
  c - (if 0 ≤ (a - c) / 2 then 1 else -1) * b ^ 2 /
    (|(a - c) / 2| + √(((a - c) / 2) ^ 2 + b ^ 2))

/-- 5.4: Wilkinson's shift `w` is an eigenvalue of `[[a, b], [b, c]]`, no farther from `c` than
the other eigenvalue `a + c - w`, and the smaller of the two when they are equally far. -/
theorem wilkinsonShift_spec (a b c : ℝ) :
    (wilkinsonShift a b c - a) * (wilkinsonShift a b c - c) = b ^ 2 ∧
      |c - wilkinsonShift a b c| ≤ |c - (a + c - wilkinsonShift a b c)| ∧
      (|c - wilkinsonShift a b c| = |c - (a + c - wilkinsonShift a b c)| →
        wilkinsonShift a b c ≤ a + c - wilkinsonShift a b c) := by
  sorry

/-- 5.4: **Wilkinson's theorem.** For a real symmetric unreduced Hessenberg (hence tridiagonal)
matrix, the shifted QR iteration with Wilkinson's shift drives the last subdiagonal entry to
`0`. -/
theorem IsShiftedQRIteration.tendsto_wilkinson {A : Matrix (Fin (n + 2)) (Fin (n + 2)) ℝ}
    (hA : A.IsSymm) (hU : IsUnreducedHessenberg A) {k : ℕ → ℝ}
    {B Q R : ℕ → Matrix (Fin (n + 2)) (Fin (n + 2)) ℝ} (h : IsShiftedQRIteration A k B Q R)
    (hk : ∀ i, k i = wilkinsonShift (B i (Fin.last n).castSucc (Fin.last n).castSucc)
      (B i (Fin.last (n + 1)) (Fin.last n).castSucc) (B i (Fin.last (n + 1)) (Fin.last (n + 1)))) :
    Tendsto (fun i ↦ B i (Fin.last (n + 1)) (Fin.last n).castSucc) atTop (𝓝 0) := by
  sorry

end Hessenberg

/-! ## Layer 6: Krylov matrices and the implicit Q theorem -/

section ImplicitQ

variable {n : ℕ}

/-- 6.1: the Krylov matrix `[x, A x, …, Aⁿ⁻¹ x]`. -/
def krylovMatrix (A : Matrix (Fin n) (Fin n) 𝕜) (x : Fin n → 𝕜) : Matrix (Fin n) (Fin n) 𝕜 :=
  Matrix.of fun i j ↦ (A ^ (j : ℕ) *ᵥ x) i

/-- 6.1: if `H = Qᴴ A Q` is upper Hessenberg for a unitary `Q` with first column `q₀`, then
`Qᴴ K(A, q₀) = K(H, e₀)`, which is upper triangular with `j`th diagonal entry
`h₁₀ h₂₁ ⋯ h_{j, j-1}`. -/
theorem conjTranspose_mul_krylovMatrix {A Q : Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜}
    (hQ : Q ∈ unitary (Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜))
    (hH : (Qᴴ * A * Q).IsUpperHessenberg) :
    Qᴴ * krylovMatrix A (fun i ↦ Q i 0) = krylovMatrix (Qᴴ * A * Q) (Pi.single 0 1) ∧
      (krylovMatrix (Qᴴ * A * Q) (Pi.single 0 1)).IsUpperTriangular ∧
      ∀ j, krylovMatrix (Qᴴ * A * Q) (Pi.single 0 1) j j =
        ∏ i : Fin (n + 1) with i.val < j.val, (Qᴴ * A * Q) (i + 1) i := by
  sorry

/-- 6.2: **the implicit Q theorem.** If `Qᴴ A Q` and `Uᴴ A U` are upper Hessenberg, the
subdiagonal entries `h_{i+1, i}` of `Qᴴ A Q` with `i + 2 < n + 1` are nonzero, and the first
columns agree up to a unimodular factor, then `U = Q S` for a phase matrix `S`, and
`Uᴴ A U = Sᴴ (Qᴴ A Q) S`. -/
theorem exists_phase_eq_mul_of_isUpperHessenberg {A Q U : Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜}
    (hQ : Q ∈ unitary (Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜))
    (hU : U ∈ unitary (Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜))
    (hH : (Qᴴ * A * Q).IsUpperHessenberg) (hK : (Uᴴ * A * U).IsUpperHessenberg)
    (hsub : ∀ i j : Fin (n + 1), i.val = j.val + 1 → i.val < n → (Qᴴ * A * Q) i j ≠ 0)
    (σ : 𝕜) (hσ : ‖σ‖ = 1) (hcol : ∀ i, U i 0 = σ * Q i 0) :
    ∃ s : Fin (n + 1) → 𝕜, (∀ i, ‖s i‖ = 1) ∧ U = Q * diagonal s ∧
      Uᴴ * A * U = (diagonal s)ᴴ * (Qᴴ * A * Q) * diagonal s := by
  sorry

/-- 6.3: **the implicitly shifted QR step.** If `H` is unreduced Hessenberg, `k` is any shift,
`H - k I = Q R`, and a unitary `U` has the first column of `Q` up to a unimodular factor with
`Uᴴ H U` upper Hessenberg, then `U = Q S` and `Uᴴ H U = Sᴴ (R Q + k I) S` for a phase matrix `S`.
At an eigenvalue shift the step is deflated, and only its last subdiagonal entry vanishes. -/
theorem exists_phase_eq_shiftedQRStep {H Q R U : Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜}
    (hH : IsUnreducedHessenberg H) (k : 𝕜) (hQ : Q ∈ unitary (Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜))
    (hR : R.IsUpperTriangular) (hQR : H - k • 1 = Q * R)
    (hU : U ∈ unitary (Matrix (Fin (n + 1)) (Fin (n + 1)) 𝕜))
    (hK : (Uᴴ * H * U).IsUpperHessenberg) (σ : 𝕜) (hσ : ‖σ‖ = 1)
    (hcol : ∀ i, U i 0 = σ * Q i 0) :
    ∃ s : Fin (n + 1) → 𝕜, (∀ i, ‖s i‖ = 1) ∧ U = Q * diagonal s ∧
      Uᴴ * H * U = (diagonal s)ᴴ * (R * Q + k • 1) * diagonal s := by
  sorry

end ImplicitQ

#check @LinearMap.singularValues
#check @Matrix.exists_unitary_mul_diagonal_mul_unitary
#check @Matrix.singularValues_toEuclideanLin_of_unitary_mul_diagonal_mul_unitary
#check @Matrix.exists_unitary_mul_mul_unitary_iff_singularValues_eq
#check @TauCeti.UnitarilyInvariantSeminorm.frobenius_apply_eq_sqrt_sum_sq_singularValues
#check @LinearMap.card_support_singularValues
#check @LinearMap.sq_singularValues_fin
#check @Matrix.BlockTriangular.charpoly
#check @Matrix.isUpperHessenberg_fin_iff
#check @Matrix.IsUpperHessenberg
#check @Matrix.IsUpperTriangular
#check @Matrix.toSquareBlock
#check @Matrix.charpoly
#check @Matrix.fromBlocks
#check @Matrix.rank
#check @Polynomial.roots
#check @Matrix.IsHermitian.eigenvalues₀
#check @Matrix.isHermitian_conjTranspose_mul_self
#check @Matrix.isHermitian_mul_conjTranspose_self
#check @LinearMap.singularValues_adjoint
#check @LinearMap.hermitianDilation
#check @Submodule.projectionGap

end TauCetiRoadmap.DenseEigenvalueAlgorithms

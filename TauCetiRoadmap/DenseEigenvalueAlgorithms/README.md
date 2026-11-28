# Roadmap: dense eigenvalue algorithms

**Summary.** This roadmap builds the exact theory behind the dense eigenvalue and singular value
algorithms of numerical linear algebra, before any rounding:
- the real Schur form: a real matrix is orthogonally similar to a block upper triangular matrix
  with diagonal blocks of order one (real eigenvalues) and two (pairs of nonreal conjugate
  eigenvalues), in any prescribed order of the blocks, and to an upper triangular matrix when its
  eigenvalues are real;
- the singular value decomposition of a rectangular real or complex matrix, the uniqueness of its
  diagonal, the singular values as square roots of the eigenvalues of `Aᴴ A` and `A Aᴴ`, the rank
  and the Frobenius norm, the singular values of a Hermitian matrix, the Hermitian dilation with
  eigenvalues `±σᵢ`, and the interlacing of singular values when a column or a row is deleted;
- the QR algorithm as an exact iteration of unitary similarities, whose accumulated factors are
  QR factorizations of the powers of `A`; with positive diagonals it is simultaneous iteration;
- convergence of the unshifted QR algorithm: for eigenvalues of distinct nonzero moduli and an
  eigenvector matrix whose inverse has an LU factorization, the iterates converge up to diagonal
  phases to an upper triangular matrix with the eigenvalues on the diagonal in order of
  decreasing modulus, and for real symmetric matrices to the diagonal of eigenvalues at the rate
  `cᵏ`, `c` the largest ratio of consecutive moduli;
- Hessenberg reduction by Householder reflectors, the shifted QR step on unreduced Hessenberg
  matrices with its deflation when the shift is an eigenvalue, the shifted iteration, Wilkinson's
  shift and Wilkinson's theorem that the last subdiagonal entry of a symmetric tridiagonal
  iteration tends to zero;
- Krylov matrices of Hessenberg reductions, the implicit Q theorem, and the implicitly shifted QR
  step that it justifies.

The roadmap is a synthesis of Horn and Johnson, Trefethen and Bau, Stoer and Bulirsch, Demmel and
Parlett (see [References](#references)); it follows none of them section by section. Headlines
that restate a source result cite a theorem, equation or section with its printed page;
corollaries and adaptations carry a proof route.

It rests on Mathlib's matrices, characteristic polynomials, block triangular matrices, Hessenberg
matrices and singular values, and on Tau Ceti's square singular value decomposition and the
classification of rectangular matrices up to two-sided unitary equivalence by their singular
values. The matrix factorization roadmap of the family, MatrixFactorizationsAndSparseElimination,
supplies the matrix conventions, the Householder reflectors and the QR factorization with its
uniqueness that every layer from 3 on uses.
[EigenvalueIterations](../EigenvalueIterations/README.md) supplies subspace iteration, which this
roadmap meets as the column flags of the QR algorithm, and
[RandomMatrices](../RandomMatrices/README.md) supplies Cauchy interlacing, from which singular
value interlacing follows. The complex Schur form with prescribed diagonal belongs to
[EigenvalueAndSingularValueInequalities](../EigenvalueAndSingularValueInequalities/README.md);
the effect of rounding on these algorithms is outside this roadmap.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test; the other headlines are targets of the
same standing, stated in prose.

Suggested home: `TauCeti/LinearAlgebra/Matrix/` for Layers 1–2 and
`TauCeti/LinearAlgebra/Matrix/Eigenvalue/` for Layers 3–6.

## How to read the build

Layers 1 and 2 are normal forms. Layer 1 is the real counterpart of Schur's triangularization.
Layer 2 is the rectangular singular value decomposition, built from Tau Ceti's square one and its
orbit classification; its interlacing results (§2.3) come from Cauchy interlacing for `Aᴴ A`.

Layers 3–6 are the QR algorithm. Layer 3 treats it as an exact sequence of similarities and links
it to powers of `A`, to simultaneous iteration and to subspace iteration. Layer 4 proves
convergence without shifts, from the QR factorization of `Aᵏ` and the LU factorization of the
inverse eigenvector matrix. Layer 5 adds the structure that makes the algorithm practical:
Hessenberg reduction, shifted steps, deflation, and Wilkinson's shift. Layer 6 proves the
uniqueness theorem behind implicit shifts.

The dependencies inside the layers: §1.2 uses §1.1; §2.2 and §2.3 use §2.1; §3.2 uses §3.1 and
the QR uniqueness of MatrixFactorizationsAndSparseElimination §5.2; §3.3 uses §3.1; §4.1 uses
§§3.1–3.2; §4.2 uses §4.1; §4.3 uses §3.1; §5.1 uses the reflectors of
MatrixFactorizationsAndSparseElimination §5.1; §5.3 uses §5.2; §5.4 uses §§5.2–5.3; §6.2 uses
§6.1; §6.3 uses §5.2 and §6.2.

## Conventions

The matrix conventions are those of MatrixFactorizationsAndSparseElimination (Conventions and
Layer 1), which owns them for the numerical-analysis roadmaps; this roadmap introduces no
competing definition.

- **Matrices and scalars.** Matrices are `Matrix (Fin m) (Fin n) 𝕜` over an `RCLike` field `𝕜`
  (`ℝ` or `ℂ`), or over an arbitrary field `K` where no norm or adjoint enters (§5.2, rank bound).
  Over `ℝ`, `unitary` is the orthogonal group `Matrix.orthogonalGroup`, so one statement over `𝕜`
  covers the real orthogonal and the complex unitary case. Vectors that are measured are
  `EuclideanSpace 𝕜 (Fin n)` and act through `Matrix.toEuclideanLin`.
- **Zero-based indexing.** Indices start at `0`: the sources' `σ₁`, `λ₁`, first column `q₁` and
  entry `h_{21}` are index `0`, column `0` and `H 1 0` here. Statements that need a first or a last
  index are written for order `n + 1` (or `n + 2`).
- **Singular values and Hermitian eigenvalues.** The singular values of `A` are Mathlib's
  `LinearMap.singularValues` of `Matrix.toEuclideanLin A`, decreasing, indexed from `0`, and `0`
  past the rank; the eigenvalues of a Hermitian matrix are Mathlib's
  `Matrix.IsHermitian.eigenvalues₀`, in decreasing order. A spectrum with multiplicity is an
  enumeration whose values are the roots of the characteristic polynomial
  (`IsEigenvalueEnumeration`, a verbatim copy of MatrixFactorizationsAndSparseElimination §1.2);
  for a real matrix it is the enumeration of `A.map (algebraMap ℝ ℂ)`.
- **Matrix norms.** There is no default matrix norm. A statement with a norm opens one of
  Mathlib's scoped instances (`Matrix.Norms.L2Operator` for the spectral norm in §4.3,
  `Matrix.Norms.Frobenius` in §2.1). Limits of matrices are in Mathlib's product topology on
  matrices, which every matrix norm induces.
- **Inverses.** `A⁻¹` is Mathlib's inverse, `0` at a singular matrix; every statement containing
  `⁻¹` carries a hypothesis that makes it genuine (`X.det ≠ 0` in §4.1, from which `T` is
  nonsingular as well).
- **Hessenberg matrices.** Upper Hessenberg is Mathlib's `Matrix.IsUpperHessenberg`: entries with
  row index more than one below the column index vanish. `IsUnreducedHessenberg H` adds that every
  subdiagonal entry `H (j + 1) j` is nonzero, and `IsTridiagonal M` says that `M` and `Mᵀ` are
  upper Hessenberg. For `n ≤ 1` every matrix is unreduced Hessenberg.
- **Phases.** A phase matrix is a diagonal unitary matrix, `diagonal s` with `‖s i‖ = 1`; over `ℝ`
  the phases are signs. QR factorizations of a nonsingular matrix are unique up to a phase matrix
  (§3.2), and every statement about the QR algorithm either fixes the phases (positive diagonals,
  §3.2) or is invariant under them.
- **The QR iteration** is numbered from `0`. `IsQRIteration A B Q R` says `B 0 = A`,
  `B k = Q k * R k` with `Q k` unitary and `R k` upper triangular, and `B (k + 1) = R k * Q k`;
  the factorizations are arbitrary QR factorizations, not a particular algorithm.
  `IsShiftedQRIteration A k B Q R` is the same with `B i - k i • 1 = Q i * R i` and
  `B (i + 1) = R i * Q i + k i • 1`. The sources' `A_{i+1}`, `Q_i`, `R_i`, `P_i = Q_1 ⋯ Q_i` and
  `U_i = R_i ⋯ R_1` are `B i`, `Q (i - 1)`, `R (i - 1)`, `accumulatedQ Q i` and
  `accumulatedR R i`.
- **Block structure.** A block map `b : Fin n → Fin k` assigns each index to a block;
  Mathlib's `Matrix.BlockTriangular` with a monotone `b` is block upper triangularity, and
  `Matrix.toSquareBlock` extracts the diagonal block of `b`.

## Layer 1: real Schur forms

### 1.1 Real triangularization and real 2 × 2 blocks

- **Real spectrum** (`exists_orthogonal_isUpperTriangular_of_isEigenvalueEnumeration`). A real
  square matrix whose eigenvalues are all real is orthogonally similar to an upper triangular
  matrix with its eigenvalues on the diagonal in any prescribed order [HJ, Theorem 2.3.1, p. 79,
  last sentence]. Route: induction on `n`; a real eigenvalue has a real unit
  eigenvector, which is the first column of a real orthogonal matrix, and the trailing block has
  the remaining eigenvalues.
- **Nonreal 2 × 2 blocks** (`forall_charpoly_eval_ne_zero_iff`). A real `2 × 2` matrix
  `[[a, b], [c, d]]` has no real eigenvalue exactly when `(a − d)² + 4 b c < 0`. Route: the
  characteristic polynomial is `x² − (a + d) x + (a d − b c)`, whose discriminant is
  `(a − d)² + 4 b c`.
- `IsRealSchurForm T b` says that `b` is monotone, `T` is block upper triangular for `b`, every
  block has one or two indices, and every block of two indices has a characteristic polynomial
  without real roots.
- **Block spectra** (`IsRealSchurForm.charpoly_eq_prod`), a proved Check: the characteristic
  polynomial of a real Schur form is the product of those of its diagonal blocks, one step from
  Mathlib's `Matrix.BlockTriangular.charpoly`.

**Checks.**
- The rotation `[[0, −1], [1, 0]]` has eigenvalues `±i`, discriminant `−4`, and is its own real
  Schur form with one block; it has no real triangularization, so the real-spectrum hypothesis of
  the first headline cannot be dropped.
- `[[1, 2], [3, 4]]` has discriminant `9 + 24 = 33 > 0` and real eigenvalues `(5 ± √33)/2`;
  `[[1, −2], [3, 4]]` has discriminant `9 − 24 = −15` and eigenvalues `(5 ± i√15)/2`. Of the `81`
  matrices with entries in `{−1, 0, 1}`, exactly `14` have no real eigenvalue, and they are those
  with negative discriminant.
- Negative control for the strict inequality: `[[1, 1], [0, 1]]` has discriminant `0` and the
  real double eigenvalue `1`, so the criterion cannot be weakened to `≤ 0`.

*Needs:* Mathlib `Matrix.BlockTriangular.charpoly`, `Matrix.charpoly` and the quadratic
discriminant; the conventions of MatrixFactorizationsAndSparseElimination §1.2.

### 1.2 The real Schur form with prescribed block order

- **Real Schur form** (`exists_orthogonal_isRealSchurForm`). Let `A` be real of order `n` and let
  `s 0, …, s (k − 1)` be multisets of complex numbers, each either a single real number or a pair
  `{z, z̄}` with `z` nonreal, whose sum is the spectrum of `A` with multiplicity. Then there are an
  orthogonal `Q` and a block map `b` such that `Qᵀ A Q` is in real Schur form for `b` and its
  diagonal block `j` has spectrum `s j` [HJ, Theorem 2.3.4, p. 82, with the order of the blocks
  on pp. 82–83; D, Theorem 4.3, p. 147, without the order]. Route: induction on `n`, deflating by
  a real unit eigenvector for a real `s 0`, and for `s 0 = {z, z̄}` by an orthonormal basis of the
  real plane spanned by the real and imaginary parts of an eigenvector for `z`, which is invariant
  and carries the eigenvalues `z, z̄`.
- The real Schur form is upper Hessenberg, and its blocks of order two are the only places with a
  nonzero subdiagonal entry. Route: block triangularity with blocks of at most two consecutive
  indices.

**Checks.**
- `n = 0`: `k = 0`, the empty family of multisets, and every `Q` works.
- For `A = [[0, −1], [1, 0]] ⊕ [3]` and the order `({3}, {i, −i})`, a permutation matrix gives the
  form `[3] ⊕ [[0, −1], [1, 0]]`: block `0` is `{3}` and block `1` is `{i, −i}`.
- Negative control: the multisets `{i}`, `{−i}` for the rotation satisfy the sum condition but
  not the shape condition; no real matrix block has spectrum `{i}`.

*Needs:* 1.1.

## Layer 2: the singular value decomposition

### 2.1 The factorization and its diagonal

`rectDiagonal d` is the `m × n` matrix with `d i` at position `(i, i)` and `0` elsewhere, and
`singularValueDiagonal A` is `rectDiagonal` of the singular values of `A`.

- **Singular values of a diagonal** (`singularValues_rectDiagonal`). If `d` is nonnegative and
  decreasing on the first `min m n` indices, the singular values of `rectDiagonal d` are
  `d 0, …, d (min m n − 1)`. Route: `(rectDiagonal d)ᴴ rectDiagonal d` is the diagonal matrix of
  the `d i ^ 2` padded by zeros, and Mathlib's singular values are the square roots of its
  eigenvalues in decreasing order.
- **The singular value decomposition**
  (`exists_unitary_conjTranspose_mul_eq_singularValueDiagonal`). For every `m × n` matrix `A`
  there are unitary `U`, `V` (orthogonal when `𝕜 = ℝ`) with `Uᴴ A V` the rectangular diagonal
  of the singular values of `A` [HJ, Theorem 7.3.5, p. 414, including the real case on p. 415;
  TB, Theorem 4.1, p. 29; D, Theorem 3.2, p. 109, for `m ≥ n`]. Route: Tau Ceti's orbit theorem
  `Matrix.exists_unitary_mul_mul_unitary_iff_singularValues_eq` applied to `A` and
  `singularValueDiagonal A`, whose singular values agree by the previous headline.
- **Uniqueness of the diagonal** (`singularValues_eq_of_conjTranspose_mul_eq_rectDiagonal`). If
  `Uᴴ A V = rectDiagonal d` with `U`, `V` unitary and `d` nonnegative and decreasing on the first
  `min m n` indices, then `d i` is the `i`th singular value of `A` for `i < min m n` [HJ,
  Theorem 7.3.5, p. 414]. Route: unitary factors do not change singular values (Tau Ceti), and
  the first headline. For square matrices this is Tau Ceti's
  `Matrix.singularValues_toEuclideanLin_of_unitary_mul_diagonal_mul_unitary`.
- **Gram eigenvalues** (`sq_singularValues_eq_eigenvalues₀`). `σᵢ²` is the `i`th eigenvalue of
  `Aᴴ A` for `i < n` and of `A Aᴴ` for `i < m`, both in decreasing order; past `min m n` both sides
  are `0` [HJ, Theorem 7.3.5, p. 414, for `A Aᴴ`; TB, Theorem 5.4, p. 34]. Route: Mathlib's
  characterization of the singular values through `T† T` (`LinearMap.sq_singularValues_fin`) and
  the identification of `toEuclideanLin (Aᴴ A)` with `(toEuclideanLin A)† (toEuclideanLin A)`;
  for `A Aᴴ`, the same applied to `Aᴴ`, which has the same singular values.
- **Rank** (`rank_eq_card_support_singularValues`). The rank of `A` is the number of its nonzero
  singular values [TB, Theorem 5.1, p. 33]. Route: Mathlib's
  `LinearMap.card_support_singularValues` and the equality of `A.rank` with the dimension of the
  range of `toEuclideanLin A`.
- **Frobenius norm** (`frobenius_norm_sq_eq_sum_sq_singularValues`).
  `‖A‖_F² = σ₀² + ⋯ + σ_{min m n − 1}²` [TB, Theorem 5.3, p. 34]. Route: Tau Ceti's
  `TauCeti.UnitarilyInvariantSeminorm.frobenius_apply_eq_sqrt_sum_sq_singularValues` and the
  identification of Mathlib's Frobenius norm of `A` with that seminorm of `toEuclideanLin A`. The
  companion identity `‖A‖₂ = σ₀` is MatrixFactorizationsAndSparseElimination §1.1.
- **Hermitian matrices** (`IsHermitian.singularValues_eq_abs_eigenvalues₀`). The singular values
  of a Hermitian matrix are the absolute values of its eigenvalues, as multisets
  [TB, Theorem 5.5, p. 34]. Route: `Aᴴ A = A²` has eigenvalues `λᵢ²`, and the previous Gram
  headline.

**Checks.**
- `diag(1, −3)` has eigenvalues `1, −3` in decreasing order and singular values `3, 1`: the
  multiset of absolute values matches, the decreasing order does not.
- Negative controls for the uniqueness headline: `I · diag(1, 2) · I` has a diagonal that is not
  decreasing, and the singular values are `2, 1`; `diag(−1, 0)` has a negative entry, and the
  singular values are `1, 0`.
- `A = [[1, 2], [2, 4], [0, 0]]` (`3 × 2`, rank `1`): singular values `5, 0`; `Aᴴ A` has
  eigenvalues `25, 0` and `A Aᴴ` has `25, 0, 0`; `‖A‖_F² = 1 + 4 + 4 + 16 = 25 = 5² + 0²`, and one
  singular value is nonzero.
- `A = [[1, 0, 1]]` (`1 × 3`): `σ₀ = √2`; `Aᴴ A` has eigenvalues `2, 0, 0`, padded past
  `min m n = 1`, and `A Aᴴ = [2]`; `‖A‖_F² = 2`.

*Needs:* Mathlib `LinearMap.singularValues`, `Matrix.IsHermitian.eigenvalues₀`, the Frobenius
norm; Tau Ceti's orbit classification and Frobenius seminorm (see
[From Tau Ceti](#from-tau-ceti)).

### 2.2 The Hermitian dilation

- **Dilation spectrum** (`charpoly_fromBlocks_zero_conjTranspose`). For a square `A` of order
  `n`, the Hermitian matrix `[[0, Aᴴ], [A, 0]]` of order `2n` has characteristic polynomial
  `∏ (X − σᵢ)(X + σᵢ)`, so its eigenvalues are `±σ₀, …, ±σ_{n−1}` [TB, (31.2)–(31.3), p. 235].
  Route: for `x ≠ 0` the Schur complement gives `det(x² I − A Aᴴ)` as the determinant of
  `x I − [[0, Aᴴ], [A, 0]]`, both sides are polynomials, and the eigenvalues of `A Aᴴ` are the
  `σᵢ²` (§2.1).
- **Eigenvectors of the dilation.** If `Uᴴ A V = Σ` is a singular value decomposition, then
  `[[0, Aᴴ], [A, 0]] [[V, V], [U, −U]] = [[V, V], [U, −U]] diag(Σ, −Σ)`, and the columns of
  `[[V, V], [U, −U]] / √2` are orthonormal [TB, (31.3), p. 235]. Route: `A V = U Σ` and
  `Aᴴ U = V Σ`. The matrix is the matrix form of Tau Ceti's operator dilation
  `LinearMap.hermitianDilation`.

**Checks.**
- `A = [[1, 2], [0, 0]]` has singular values `√5, 0`, and its dilation has eigenvalues
  `−√5, 0, 0, √5`; the zero singular value contributes a double eigenvalue `0`.
- For the same `A` and `x = 1`, `det(I − H) = −4 = (1 − 5)(1 − 0)`.

*Needs:* 2.1; Mathlib `Matrix.fromBlocks` and the Schur complement determinant; Tau Ceti
`LinearMap.hermitianDilation`.

### 2.3 Interlacing under deletion of a column or a row

- **Column deletion** (`singularValues_submatrix_interlace`). If `Â` is `A` with one column
  deleted, then `σᵢ₊₁(A) ≤ σᵢ(Â) ≤ σᵢ(A)` for every `i ≥ 0`. With singular values `0` past the
  dimension this one statement covers both cases of the source, `m ≥ n` and `m < n`
  [HJ, Theorem 7.3.9, p. 419]. Route: `Âᴴ Â` is a principal submatrix of order `n − 1` of `Aᴴ A`;
  Cauchy interlacing (RandomMatrices §1.2) and the Gram headline of §2.1 give the inequalities
  for `i < n − 1`, and past that index both sides are `0` or the left side is.
- **Row deletion** (`singularValues_submatrix_rows_interlace`). The same inequalities hold when a
  row is deleted [HJ, Theorem 7.3.9, p. 419, last sentence]. Route: transposition, since `A` and
  `Aᴴ` have the same singular values (Tau Ceti `LinearMap.singularValues_adjoint`).

**Checks.**
- `A = diag(3, 4)`: deleting the second column leaves `[[3], [0]]` with singular value `3`, which
  lies between `σ₁(A) = 3` and `σ₀(A) = 4`; deleting the first leaves `4`. A rule keeping `σ₀`
  unchanged would fail for the second deletion.
- A wide matrix, `A = [[1, 1, 0], [0, 1, 1]]` with `σ = (√3, 1)`: deleting column `0` (or `2`)
  leaves singular values `1.618…, 0.618…` (`√((3 ± √5)/2)`), and deleting column `1` leaves
  `1, 1`; both satisfy `σᵢ₊₁(A) ≤ σᵢ(Â) ≤ σᵢ(A)` with `σ₂(A) = 0`.

*Needs:* 2.1; RandomMatrices §1.2; Tau Ceti `LinearMap.singularValues_adjoint`.

## Layer 3: the QR algorithm as an exact iteration

### 3.1 Similarities and powers

`accumulatedQ Q k = Q 0 ⋯ Q (k − 1)` and `accumulatedR R k = R (k − 1) ⋯ R 0`, both `1` for
`k = 0`.

- **Accumulation** (`IsQRIteration.accumulated`). For every QR iteration, `Pₖ = accumulatedQ Q k`
  is unitary, `Uₖ = accumulatedR R k` is upper triangular, `B k = Pₖᴴ A Pₖ` and `Aᵏ = Pₖ Uₖ`
  [SB, Theorem (6.6.4.4), p. 418; TB, Theorem 28.3, p. 216; D, Lemma 4.3, p. 160]. Route:
  `B (k + 1) = Q kᴴ B k Q k` and `A Pₖ = Pₖ₊₁ R k` by induction; neither needs `A` nonsingular.
- **Zero shifts** (`isQRIteration_iff_isShiftedQRIteration_zero`), a proved Check: the unshifted
  iteration is the shifted iteration of §5.3 with all shifts `0`.

**Checks.**
- The singular `A = [[1, 1], [1, 1]]`: `Q 0 = [[1, −1], [1, 1]]/√2`, `R 0 = [[√2, √2], [0, 0]]`,
  `B 1 = R 0 Q 0 = diag(2, 0) = Q 0ᴴ A Q 0`. Both `Q 1 = I`, `R 1 = diag(2, 0)` and
  `Q 1 = diag(1, −1)`, `R 1 = diag(2, 0)` are QR factorizations of `B 1`, and in the first,
  `P₂ U₂ = Q 0 R 1 R 0 = [[2, 2], [2, 2]] = A²`; nonsingularity is not needed.

*Needs:* Mathlib `unitary`, `Matrix.IsUpperTriangular`.

### 3.2 Normalization and simultaneous iteration

- **Phases of QR factorizations** (`exists_phase_of_mul_eq_mul`). Two QR factorizations
  `Q₁ R₁ = Q₂ R₂` of a nonsingular matrix differ by a phase matrix: `Q₂ = Q₁ S` and
  `R₂ = Sᴴ R₁` [SB, p. 418, where `Q S`, `Sᴴ R` is shown to be again a QR factorization, and
  p. 423, for the uniqueness up to phases]. Route: `Q₁ᴴ Q₂ = R₁ R₂⁻¹` is unitary and upper
  triangular, hence diagonal.
- **The normalized iteration** (`existsUnique_isQRIteration_pos`). A nonsingular matrix has
  exactly one QR iteration whose triangular factors have positive real diagonals. Route: each
  `B k` is nonsingular, and MatrixFactorizationsAndSparseElimination §5.2 gives exactly one QR
  factorization with positive real diagonal at full rank.
- `IsSimultaneousIteration A Q̂ R̂` says `Q̂ 0 = 1` and `A Q̂ k = Q̂ (k + 1) R̂ (k + 1)` with
  `Q̂ (k + 1)` unitary and `R̂ (k + 1)` upper triangular with positive real diagonal.
- **QR algorithm and simultaneous iteration** (`IsQRIteration.eq_simultaneousIteration`). For a
  QR iteration with positive real diagonals, `Pₖ = Q̂ₖ` and
  `Uₖ = R̂ₖ ⋯ R̂₁` for every `k` [TB, Theorems 28.2–28.3, pp. 215–216, without a normalization;
  SB, (6.6.4.5)–(6.6.4.6), p. 418]. Route: both `Pₖ Uₖ` and `Q̂ₖ (R̂ₖ ⋯ R̂₁)` are QR factorizations
  of `Aᵏ` with positive real diagonal (§3.1), and that factorization is unique
  (MatrixFactorizationsAndSparseElimination §5.2). No separate nonsingularity hypothesis is
  needed: `A = Q 0 R 0` with `R 0` of positive diagonal is nonsingular.

**Checks.**
- `A = [[2, 1], [1, 2]]`: the QR factorization with positive diagonal is
  `Q 0 = [[2, −1], [1, 2]]/√5`, `R 0 = [[5, 4], [0, 3]]/√5`, and `B 1 = [[14, 3], [3, 6]]/5`; the
  first step of simultaneous iteration factors `A · I` and gives `Q̂ 1 = Q 0`, `R̂ 1 = R 0`.
- Negative control for the normalization: `Q 0 diag(1, −1)` and `diag(1, −1) R 0` also factor
  `A`, and with them `P₁ ≠ Q̂ 1`.

*Needs:* 3.1; MatrixFactorizationsAndSparseElimination §5.2.

### 3.3 Column flags and subspace iteration

- **Column flags** (`IsQRIteration.span_accumulatedQ_cols`). For nonsingular `A`, the first `j`
  columns of `Pₖ` span `Aᵏ` applied to the span of the first `j` coordinate vectors, for every
  `j ≤ n` [SB, (6.6.4.6), p. 418; TB, p. 215]. Route: `Aᵏ = Pₖ Uₖ` with `Uₖ` upper triangular and
  nonsingular, so the leading block of `Uₖ` of order `j` is nonsingular.
- **Convergence of the flags.** Let `A` be complex and nonsingular. If, at a level `α > 0`,
  exactly `j` eigenvalues of `A`, counted with algebraic multiplicity, have modulus at least `α`,
  the others have modulus smaller than `r α`, and the span of the first `j`
  coordinate vectors meets the subdominant invariant subspace only in `0`, then the gap between
  the span of the first `j` columns of `Pₖ` and the dominant invariant subspace is `O(rᵏ)`. Route:
  the column flags headline and the subspace iteration theorem of
  [EigenvalueIterations](../EigenvalueIterations/README.md) §1.3, with `W` the coordinate span
  [D, Theorem 4.8 and its proof, p. 158].

**Checks.**
- For `A = diag(3, 2, 1)` every coordinate span `span(e₀, …, e_{j−1})` is invariant, so the
  column flags of `Pₖ` are those spans for every `k`, and the gap of the second headline is `0`.
- Negative control for nonsingularity: for `A = diag(0, 1)` and `j = 1`, `A e₀ = 0`, so the image
  of the first coordinate line under `A` is `0`, while the first column of `P₁` spans a line.

*Needs:* 3.1; [EigenvalueIterations](../EigenvalueIterations/README.md) §§1.1, 1.3; Tau Ceti
`Submodule.projectionGap`.

## Layer 4: convergence of the unshifted QR algorithm

### 4.1 The general case

- **Convergence up to phases** (`IsQRIteration.exists_tendsto_conjTranspose_mul`). Let
  `A = X D X⁻¹` with `D = diag(λ₀, …, λ_{n−1})`, `|λ₀| > |λ₁| > ⋯ > |λ_{n−1}| > 0`, let the
  leading principal minors of `X⁻¹` of orders `1, …, n − 1` be nonzero (equivalently, `X⁻¹` has
  an LU factorization), and let `X = U T` be a QR factorization. Then there are phase matrices
  `Sₖ` with `Sₖᴴ Q k Sₖ₊₁ → I`, `Sₖ₊₁ᴴ R k Sₖ → T D T⁻¹` and `Sₖᴴ B k Sₖ → T D T⁻¹`
  [SB, Theorem (6.6.4.12), pp. 421–423; the statement allows `λₙ = 0`, the proof on p. 422 adds
  `λₙ ≠ 0`, and so does this headline]. Route: the proof of the source: `Aᵏ = X Dᵏ L D⁻ᵏ Dᵏ R_Y`
  with `X⁻¹ = L R_Y`; `Dᵏ L D⁻ᵏ → I` because `L` is unit lower triangular and the moduli decrease;
  so `Aᵏ = U (I + Eₖ) T Dᵏ R_Y` with `Eₖ → 0`, and the uniqueness of QR up to phases (§3.2)
  compares this with `Aᵏ = Pₖ Uₖ` (§3.1).
- **The limit is a Schur form.** `T D T⁻¹ = Uᴴ A U` is upper triangular with diagonal
  `λ₀, …, λ_{n−1}`. Route: `A = U T D T⁻¹ Uᴴ`, and products and inverses of upper triangular
  matrices are upper triangular.

**Checks.**
- `A = [[1, 2], [3, 0]]` has eigenvalues `3, −2` with eigenvectors `(1, 1)` and `(2, −3)`;
  `X = [[1, 2], [1, −3]]`, `X⁻¹ = [[3, 2], [1, −1]]/5` with `(X⁻¹) 0 0 = 3/5 ≠ 0`. Then
  `U = [[1, 1], [1, −1]]/√2`, `Uᴴ A U = [[3, 1], [0, −2]]`, and with positive diagonals
  `B 40 = [[3, −1], [0, −2]]` to six digits: the limit up to the phase matrix `diag(1, −1)`. The
  ratio `|B k 1 0| / (2/3)ᵏ` is `4.190, 4.167, 4.1667` at `k = 10, 20, 40`.

*Needs:* 3.1, 3.2; MatrixFactorizationsAndSparseElimination §2.1 (leading blocks).

### 4.2 Diagonal and subdiagonal entries

- **Eigenvalues appear in order** (`IsQRIteration.tendsto_diag_and_tendsto_below`). Under the
  hypotheses of §4.1, `B k i i → λᵢ` and `B k i j → 0` for `j < i` [SB, Theorem (6.6.4.12),
  p. 421; D, Theorem 4.8, p. 158, for orthogonal iteration]. Route: conjugation by a phase
  matrix does not change the diagonal and changes the other entries only by unimodular factors;
  §4.1 and the Schur form of the limit.

**Checks.**
- Negative control for the LU hypothesis: `A = [[−2, 1], [0, 3]]` has eigenvalues `3, −2` in
  decreasing modulus with `X = [[1, 1], [5, 0]]`, and `(X⁻¹) 0 0 = 0`. Since `A` is upper
  triangular, `Q k = I`, `R k = A` is a QR iteration (and with positive diagonals
  `B k = [[−2, ±1], [0, 3]]`), so the diagonal stays `−2, 3`, not in the order of decreasing
  modulus.
- Negative control for `X` nonsingular: at order `1` the leading-minor hypothesis is empty, and
  `X = 0` gives `A = X D X⁻¹ = 0` through the junk inverse, so `B k = 0` does not tend to
  `λ₀ ≠ 0`.

*Needs:* 4.1.

### 4.3 The real symmetric case

- **Diagonal limit with rate** (`IsQRIteration.norm_sub_diagonal_le_of_isSymm`). Let
  `A = Q₀ diag(λ) Q₀ᵀ` be real symmetric with `Q₀` orthogonal, `|λ₀| > |λ₁| > ⋯ > |λₙ|`, and all
  leading principal minors of `Q₀` nonzero, and let `c = maxᵢ |λᵢ₊₁| / |λᵢ|`. Then for every QR
  iteration there are a constant `C` and sign matrices `Σₖ` with `‖B k − diag(λ)‖₂ ≤ C cᵏ` and
  `‖Pₖ Σₖ − Q₀‖₂ ≤ C cᵏ` [TB, Theorem 28.4, p. 218]. The smallest eigenvalue may be `0`. Route:
  for a symmetric `A` the inverse eigenvector matrix is `Q₀ᵀ`, whose leading minors are those of
  `Q₀`; the rate follows the factorization of §4.1 with `‖Dᵏ L D⁻ᵏ − I‖ ≤ C cᵏ`, and the
  diagonal limit needs no phases because `Sₖᴴ diag(λ) Sₖ = diag(λ)`.

**Checks.**
- `A = [[2, 1], [1, 2]]`, `λ = (3, 1)`, `Q₀ = [[1, 1], [1, −1]]/√2`, `c = 1/3`. With positive
  diagonals, `Pₖ` has first column `(cos θₖ, sin θₖ)` with `tan θₖ = (3ᵏ − 1)/(3ᵏ + 1)`, so
  `B k 1 0 = cos 2θₖ = 2 · 3ᵏ/(9ᵏ + 1)` and `B k 0 0 = 3 − 2/(9ᵏ + 1)`: the off-diagonal error is
  of order `cᵏ` and the diagonal error of order `c²ᵏ`. Numerically `‖B k − diag(3, 1)‖₂` is
  `0.632, 0.221, 0.00823` at `k = 1, 2, 5`, against `cᵏ = 0.333, 0.111, 0.00412`. A rate `c²ᵏ`
  for the whole matrix would be false.
- The singular `A = [[1, 1], [1, 1]]`, `λ = (2, 0)`, same `Q₀`, `c = 0`: `B k = diag(2, 0)` for
  every `k ≥ 1` (§3.1 Check; the QR factors of `diag(2, 0)` are sign matrices), and `Pₖ` is `Q₀`
  up to the signs of its columns, so the bound `C · 0ᵏ` holds with `C = 2`, the value needed at
  `k = 0`.
- Order `1`: the supremum defining `c` is over an empty index set and has the junk value `0`;
  the statement still holds, since `B k = A = diag(λ₀)` and `Pₖ` and `Q₀` are `±1`.

*Needs:* 4.1; Mathlib `Matrix.Norms.L2Operator`.

## Layer 5: Hessenberg form and shifted QR steps

### 5.1 Hessenberg reduction

- **Householder reduction** (`exists_householder_isUpperHessenberg`). Every `A` of order `n` is
  unitarily similar to an upper Hessenberg matrix by `Q = H₀ H₁ ⋯ H_{n−3}`, a product of
  `max(n − 2, 0)` Householder reflectors, the `k`th of which leaves the coordinates `0, …, k`
  fixed; if `A` is Hermitian, `Qᴴ A Q` is Hermitian tridiagonal [TB, Algorithm 26.1, p. 198;
  D, Algorithm 4.6, p. 165; SB, §6.5.1, p. 388, for the Hermitian case, and §6.5.4, p. 402].
  Route: the
  `k`th reflector maps the entries `k + 1, …, n − 1` of column `k` to a multiple of `e_{k+1}`
  (MatrixFactorizationsAndSparseElimination §5.1), and reflectors acting on coordinates after `k`
  do not disturb the first `k` columns.

**Checks.**
- `n = 0, 1, 2`: no reflector; every matrix of order at most `2` is upper Hessenberg. A count
  of `n − 2` reflectors read in `ℤ` would be `−1` at `n = 1`.
- `A = [[1, 3, 4], [3, 1, 0], [4, 0, 1]]`, `n = 3`: one reflector, `v = (0, 8, 4)`, maps the
  column entries `(3, 4)` to `(−5, 0)`, and `Qᴴ A Q = [[1, −5, 0], [−5, 1, 0], [0, 0, 1]]`, which is
  tridiagonal.

*Needs:* MatrixFactorizationsAndSparseElimination §5.1; Mathlib `Matrix.IsUpperHessenberg`.

### 5.2 The shifted QR step

- **Similarity** (`shiftedQRStep_eq_conjTranspose_mul_mul`), a proved Check: if `H − k I = Q R`
  with `Q` unitary, then `R Q + k I = Qᴴ H Q`.
- **Hessenberg form is preserved** (`IsUpperHessenberg.shiftedQRStep`). If `H` is upper
  Hessenberg and `H − k I` is nonsingular, every shifted QR step is upper Hessenberg
  [SB, p. 425; D, Proposition 4.5, p. 165]. Route: `R Q + k I = R H R⁻¹` is a product of upper
  triangular and Hessenberg matrices.
- **Geometric multiplicity one** (`IsUnreducedHessenberg.le_rank_sub_smul`). For an unreduced
  Hessenberg `H` over any field and every `μ`, `H − μ I` has rank at least `n − 1`
  [SB, proof of Theorem (6.6.5.5), p. 429]. Route: the first `n − 1` columns of `H − μ I` are
  independent, since their subdiagonal entries are nonzero.
- **Unreduced steps** (`IsUnreducedHessenberg.shiftedQRStep`). If `H` is unreduced and `k` is not
  an eigenvalue, the step is unreduced Hessenberg, and Hermitian tridiagonal when `H` is
  Hermitian [SB, Theorem (6.6.5.5), p. 428, and p. 425]. Route: `R` is nonsingular and the
  subdiagonal of `R H R⁻¹` is `r_{j+1, j+1} h_{j+1, j} / r_{jj}`.
- **Deflation** (`IsUnreducedHessenberg.shiftedQRStep_of_det_eq_zero`). If `H` is unreduced of
  order `n + 1` and `k` is an eigenvalue, then for every QR factorization `H − k I = Q R` the step
  `H' = R Q + k I` is upper Hessenberg, its last row is `(0, …, 0, k)`, and its leading block of
  order `n` is unreduced [SB, Theorem (6.6.5.5) and its proof, pp. 428–429]. Route: the rank bound
  above makes the leading block of `R` of order `n` nonsingular and the last row of `R` zero;
  then `Q` is Hessenberg with nonzero subdiagonal in the first `n` columns, so `R Q` is Hessenberg
  with zero last row. The statement is for every factorization, although `Q` is not unique.

**Checks.**
- `H = [[2, 1, 0, 1], [1, 3, 1, 0], [0, 2, 1, 4], [0, 0, 1, −2]]` and `k = 1`: `det(H − I) = 0`,
  and the step has subdiagonal `(3/2, ±2√26/9, 0)` and last row `(0, 0, 0, 1)`.
- The same `H` with the shift `0` (`det H = −24`): the step has subdiagonal
  `(1.342, 0.674, 3.500)`, all nonzero, and zeros below it.
- Negative control for the nonsingularity of `H − k I` in the second headline:
  `H = [[0, 1, 0], [0, 0, 1], [0, 0, 1]]` is upper Hessenberg and singular, and `k = 0`. With `Q`
  the permutation matrix with columns `e₂, e₀, e₁` and `R = [[0, 0, 1], [0, 1, 0], [0, 0, 1]]`,
  `H = Q R`, but `R Q = [[1, 0, 0], [0, 0, 1], [1, 0, 0]]` has entry `(2, 0)` equal to `1` and is
  not upper Hessenberg.
- Negative control: `[[1, 1, 0], [0, 2, 1], [0, 1, 3]]` is Hessenberg but not unreduced; with the
  eigenvalue shift `1` the step has last row `(0, −0.5, 1.5)`, no deflation.

*Needs:* Mathlib `Matrix.IsUpperHessenberg`, `Matrix.rank`, `Matrix.IsUpperTriangular`.

### 5.3 The shifted iteration

- **Accumulation with shifts** (`IsShiftedQRIteration.accumulated`). For every shifted QR
  iteration, `B i = Pᵢᴴ A Pᵢ` and `(A − k_{i−1} I) ⋯ (A − k₀ I) = Pᵢ Uᵢ`
  [SB, (6.6.5.2)–(6.6.5.3), p. 428]. Route: as in §3.1, with `B j − k j I = Q j R j`; the factors
  `A − k j I` commute.

**Checks.**
- `A = [[2, 1], [1, 2]]` with shifts `k 0 = 1/2`, `k 1 = 2`:
  `(A − 2 I)(A − I/2) = [[1, 3/2], [3/2, 1]]`, which equals `P₂ U₂`, and `B 2 = P₂ᴴ A P₂`.
- With all shifts `0` the identities are those of §3.1 (the proved Check of §3.1).

*Needs:* 3.1, 5.2.

### 5.4 Wilkinson's shift and Wilkinson's theorem

`wilkinsonShift a b c = c − sgn(δ) b² / (|δ| + √(δ² + b²))`, with `δ = (a − c)/2` and
`sgn(0) = 1`.

- **The shift** (`wilkinsonShift_spec`). Wilkinson's shift is the eigenvalue of `[[a, b], [b, c]]`
  nearest to `c`, and the smaller eigenvalue when both are equally near [P, §8.9, p. 163, in the QL
  orientation; SB, (6.6.5.7b), p. 430]. Route: direct computation; the other root is
  `a + c − w`.
- **Wilkinson's theorem** (`IsShiftedQRIteration.tendsto_wilkinson`). For a real symmetric
  unreduced tridiagonal matrix of order at least `2` (in Lean: symmetric and unreduced upper
  Hessenberg, which forces tridiagonal), the shifted QR iteration with Wilkinson's
  shift of the trailing `2 × 2` block of each iterate has last subdiagonal entry tending to `0`
  [P, Theorem 8.10.1, p. 166, for the QL algorithm; D, Theorem 5.8, p. 214; SB,
  (6.6.5.8), p. 430]. Route: the QR algorithm on `T` is the QL algorithm on `J T J`, `J` the
  reversal permutation; Parlett's proof bounds the next value of the relevant off-diagonal entry
  through the residual of the shifted inverse iteration (P, Lemma 8.9.1, p. 163) and shows that the
  product of the last two off-diagonal entries decreases geometrically. If a shift is an
  eigenvalue, the step deflates (§5.2) and the entry stays `0`.

**Checks.**
- `(a, b, c) = (1, 2, 1)`: eigenvalues `−1, 3`, both at distance `2` from `c`; the shift is `−1`.
  `(3, 1, 0)`: shift `−0.3028`; `(2, 0, 2)`: shift `2`.
- In each of these cases the shift is a root of `(x − a)(x − c) − b²`, at least as near to `c` as
  the other root `a + c − w`, and the smaller one on the tie `(1, 2, 1)`.
- The tridiagonal matrix of order `3` with zero diagonal and unit off-diagonal (eigenvalues
  `−√2, 0, √2`; a tie at the first step, shift `−1`): the last subdiagonal entry after steps
  `1, 2, 3, 4` is `0.7071, 0.0304, 4.48 · 10⁻⁷, 4.35 · 10⁻²²` in absolute value, and the shifts
  tend to `−√2`.
- Negative control: with the Rayleigh shift `k = a_{nn}`, `[[0, 1], [1, 0]]` is a fixed point of
  the iteration, and the subdiagonal entry stays `1`.

*Needs:* 5.2, 5.3.

## Layer 6: Krylov matrices and the implicit Q theorem

### 6.1 Krylov matrices of a Hessenberg reduction

`krylovMatrix A x` is the matrix with columns `x, A x, …, A^{n−1} x`.

- **Krylov form of a reduction** (`conjTranspose_mul_krylovMatrix`). If `Q` is unitary with first
  column `q₀` and `H = Qᴴ A Q` is upper Hessenberg, then `Qᴴ K(A, q₀) = K(H, e₀)`, which is upper
  triangular with `j`th diagonal entry `h₁₀ h₂₁ ⋯ h_{j, j−1}`. Hence `K(A, q₀) = Q K(H, e₀)` is a QR
  factorization of the Krylov matrix [TB, (33.6)–(33.7), p. 253]. Route: `Qᴴ Aʲ q₀ = Hʲ e₀`, and
  `Hʲ e₀` vanishes below entry `j` by induction, with entry `j` the product of the subdiagonal.

**Checks.**
- `A = [[1, 2, 0], [3, 4, 5], [0, 6, 7]]`, already Hessenberg, `Q = I`: `K(A, e₀)` has columns
  `e₀`, `(1, 3, 0)`, `(7, 15, 18)`, upper triangular with diagonal `1, 3, 18 = h₁₀ h₂₁`.
- Negative control for the Hessenberg hypothesis: `A = [[1, 0, 1], [0, 1, 0], [1, 0, 1]]` and
  `Q = I` give the columns `e₀`, `(1, 0, 1)`, `(2, 0, 2)`, not upper triangular.

*Needs:* Mathlib `Matrix.IsUpperHessenberg`.

### 6.2 The implicit Q theorem

- **Implicit Q** (`exists_phase_eq_mul_of_isUpperHessenberg`). Let `Q` and `U` be unitary with
  `Qᴴ A Q` and `Uᴴ A U` upper Hessenberg, let the subdiagonal entries `h_{i, i−1}` of `Qᴴ A Q` be
  nonzero for `1 ≤ i ≤ n − 1` (zero-based, order `n + 1`; the last one may vanish), and let the
  first column of `U` be a unimodular multiple of that of `Q`. Then `U = Q S` for a phase matrix
  `S`, and `Uᴴ A U = Sᴴ (Qᴴ A Q) S` [SB, Theorem (6.6.5.1), pp. 426–427; D, Theorem 4.9, p. 167,
  real and with every subdiagonal entry nonzero; P, Theorem 7.2.1, p. 121, real symmetric
  tridiagonal]. Route: `W = Uᴴ Q` satisfies `K W = W H` with `K = Uᴴ A U`; comparing columns
  shows inductively that `W` is upper triangular, and a unitary upper triangular matrix is
  diagonal.

**Checks.**
- Negative control for the index range:
  `H = [[1, 1, 0, 0], [1, 2, 1, 0], [0, 0, 3, 1], [0, 0, 1, 4]]` has `h₂₁ = 0` (zero-based row
  `2`, inside the range). With `Q = I` and `U` the rotation by `0.3` of the coordinates `2, 3`,
  `U` has first column `e₀` and `Uᴴ H U` is upper
  Hessenberg (its lower right block is `[[3.652, 1.108], [1.108, 3.348]]`), but `U` is not a
  phase matrix. With only the last subdiagonal entry zero the theorem still holds: the last
  column is determined up to a phase by orthogonality.

*Needs:* Mathlib `unitary`, `Matrix.IsUpperHessenberg`.

### 6.3 The implicitly shifted QR step

- **Implicit shift** (`exists_phase_eq_shiftedQRStep`). Let `H` be unreduced Hessenberg, `k`
  any shift, `H − k I = Q R` with `Q` unitary and `R` upper triangular, and let `U` be unitary
  with first column a unimodular multiple of that of `Q` and `Uᴴ H U` upper Hessenberg. Then
  `U = Q S` and `Uᴴ H U = Sᴴ (R Q + k I) S` for a phase matrix `S` [SB, p. 433, for `k` not an
  eigenvalue]. Route: `R Q + k I = Qᴴ H Q` (§5.2); if `k` is not an eigenvalue it is unreduced
  Hessenberg, and if `k` is an eigenvalue it is Hessenberg with every subdiagonal entry but the
  last nonzero (deflation, §5.2); in both cases §6.2 applies.

**Checks.**
- At an eigenvalue shift: for the `4 × 4` matrix `H` of the deflation Check of §5.2 and `k = 1`,
  `R Q + I` has subdiagonal `(1.5, ±1.133, 0)`; only the last entry vanishes, so the hypothesis of
  §6.2 holds and the step is determined up to phases by the first column of `Q`.

*Needs:* 5.2, 6.2.

## Downstream consumers

- Backward error analysis of matrix algorithms consumes the Hessenberg reduction (§5.1), the
  shifted QR iteration (§§5.2–5.3) and the QR algorithm for symmetric tridiagonal matrices
  (§§3.1, 5.4), adding rounding to each, and the singular values (§2.1) for the eigenvalue
  consequence through Weyl's inequality.
- Krylov subspace methods for eigenvalues consume the Krylov matrix of a Hessenberg reduction
  (§6.1), the implicit Q theorem (§6.2) and the singular value decomposition (§2.1) for the
  Arnoldi relation and Golub–Kahan bidiagonalization.
- Low-rank and randomized approximation, regularization of ill-posed problems and model
  reduction consume the singular value decomposition, its uniqueness and the Gram eigenvalues
  (§2.1), and interlacing (§2.3).

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above. It owns the real Schur forms, the rectangular singular value
decomposition with the facts of §§2.1–2.2 in matrix form, interlacing of singular values under
deletion of a column or a row, the QR algorithm as an exact iteration with its link to powers,
simultaneous iteration and column flags, the convergence of the unshifted QR algorithm, Hessenberg
reduction, the shifted QR step with deflation and the shifted iteration, Wilkinson's shift and
Wilkinson's convergence theorem, Krylov matrices of Hessenberg reductions, and the implicit Q
theorem with the implicit shift.

Inputs, not restated:
- Mathlib: matrices, characteristic polynomials and their roots, `Matrix.BlockTriangular` with
  `Matrix.BlockTriangular.charpoly`, `Matrix.IsUpperHessenberg`, `Matrix.IsUpperTriangular`, the
  unitary and orthogonal groups, singular values and Hermitian eigenvalues, the scoped matrix
  norms.
- Tau Ceti: the square singular value decomposition, the invariance of singular values under
  unitary factors and the two-sided unitary orbit classification, the Frobenius seminorm through
  singular values, the operator Hermitian dilation, and `LinearMap.singularValues_adjoint`.
- MatrixFactorizationsAndSparseElimination: the conventions (Layer 1), enumerations of spectra
  (§1.2), leading blocks (§2.1), Householder reflectors (§5.1) and the QR factorization with its
  uniqueness (§5.2); the definitions are copied verbatim.
- [EigenvalueIterations](../EigenvalueIterations/README.md) §1.3: subspace iteration, for the
  convergence of the column flags (§3.3).
- [RandomMatrices](../RandomMatrices/README.md) §1.2: Cauchy interlacing, for §2.3.

Left to other roadmaps:
- the complex Schur triangularization with prescribed diagonal
  ([EigenvalueAndSingularValueInequalities](../EigenvalueAndSingularValueInequalities/README.md)
  §2.2), and the spectral theorems for normal and Hermitian matrices (Tau Ceti and Mathlib);
- the perturbation of singular values: Weyl's bound `|σᵢ(A) − σᵢ(B)| ≤ ‖A − B‖₂` (Tau Ceti) and
  Mirsky's inequality in every unitarily invariant norm
  ([SpectralSteepestDescent](../SpectralSteepestDescent/README.md) §2.1);
- power iteration, inverse iteration and Rayleigh quotient iteration
  ([EigenvalueIterations](../EigenvalueIterations/README.md) §§1.2, 2.1–3.3);
- the Lanczos process as the Stieltjes procedure of the spectral measure and the
  Kaniel–Paige–Saad bound for Ritz values (KrylovMethodsAndOrthogonalPolynomials §§2.1, 5.1);
- the Bauer–Fike theorem and the perturbation of simple eigenvalues
  (ConditioningAndPerturbation, Layers 3–4);
- the KAK decomposition of real reductive groups, whose case GL(n, ℝ) is the singular value
  decomposition of an invertible real matrix
  ([RepresentationTheory/LieGroups](../RepresentationTheory/LieGroups/README.md) §9.5).

Outside this roadmap: the Arnoldi relation, Golub–Kahan bidiagonalization, and every effect of
rounding, including the backward stability of Hessenberg reduction and of the QR algorithm. All
statements here are in exact arithmetic.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap).

## Exact supplier contracts

### From Mathlib

- `Matrix.BlockTriangular`, `Matrix.toSquareBlock`, `Matrix.BlockTriangular.charpoly`;
  `Matrix.IsUpperTriangular`, `Matrix.IsUpperHessenberg` with `Matrix.isUpperHessenberg_fin_iff`.
- `unitary`, `Matrix.orthogonalGroup`, `Matrix.charpoly`, `Polynomial.roots`, `Matrix.rank`,
  `Matrix.fromBlocks`.
- `LinearMap.singularValues` with `LinearMap.sq_singularValues_fin` and
  `LinearMap.card_support_singularValues`; `Matrix.IsHermitian.eigenvalues₀`,
  `Matrix.isHermitian_conjTranspose_mul_self`, `Matrix.isHermitian_mul_conjTranspose_self`.
- The scoped norms `Matrix.Norms.L2Operator` and `Matrix.Norms.Frobenius`.

### From Tau Ceti

- `Matrix.exists_unitary_mul_diagonal_mul_unitary` (square singular value decomposition),
  `Matrix.singularValues_toEuclideanLin_of_unitary_mul_diagonal_mul_unitary` (its diagonal is the
  singular values) and `Matrix.exists_unitary_mul_mul_unitary_iff_singularValues_eq` (two-sided
  unitary orbits of rectangular matrices are classified by singular values)
  (`TauCeti/Analysis/Matrix/SingularValues.lean`).
- `TauCeti.UnitarilyInvariantSeminorm.frobenius_apply_eq_sqrt_sum_sq_singularValues`
  (`TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Frobenius.lean`).
- `LinearMap.singularValues_adjoint` (`TauCeti/Analysis/InnerProductSpace/SingularValues.lean`)
  and `LinearMap.hermitianDilation`
  (`TauCeti/Analysis/InnerProductSpace/HermitianDilation/Basic.lean`).
- `Submodule.projectionGap` (`TauCeti/Analysis/InnerProductSpace/Projection/Gap.lean`), the gap
  in which §3.3 measures convergence.

### From MatrixFactorizationsAndSparseElimination

MatrixFactorizationsAndSparseElimination supplies:
- Conventions and Layer 1: the matrix conventions, and the spectral norm as the largest singular
  value (§1.1);
- §1.2: the enumeration predicate of a spectrum, copied as `IsEigenvalueEnumeration`;
- §2.1: the leading principal block, copied as `leadingBlock`;
- §5.1: the Householder reflector, copied as `householder`, with its unitarity and the
  reflector that maps a vector to a multiple of a coordinate vector;
- §5.2: the reduced QR factorization and its uniqueness at full rank with positive real diagonal
  of `R`.

### From [EigenvalueIterations](../EigenvalueIterations/README.md)

- §1.1: the dominant and subdominant subspaces of an operator at a level `α`.
- §1.3: subspace iteration, for an operator `T` on a finite-dimensional complex inner product
  space: for `α > 0`, `r` with every eigenvalue of modulus below `α` of modulus
  below `r α`, and `W` of the dimension of the dominant subspace meeting the subdominant one only
  in `0`, the gap between `Tᵏ W` and the dominant subspace is `O(rᵏ)`.

### From [RandomMatrices](../RandomMatrices/README.md)

- §1.2: Cauchy interlacing for principal submatrices of Hermitian matrices, in Mathlib's
  decreasing order of `Matrix.IsHermitian.eigenvalues₀`.

## Beyond this roadmap

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **The rate of Wilkinson's theorem**: asymptotic cubic convergence for almost all matrices
  [D, Theorem 5.8, p. 214] and Parlett's asymptotic rate under convergence of the next two
  off-diagonal entries [P, Theorem 8.11.1, p. 169]; no cited source proves a rate valid for every
  unreduced matrix, and Parlett (§8.11, p. 168) notes that mere quadratic convergence has not
  been excluded.
- **Rates of the individual subdiagonal entries** of the unshifted iteration,
  `|a_{i, i−1}| = O(|λᵢ / λᵢ₋₁|ᵏ)`.
- **The Francis double shift** for real nonsymmetric Hessenberg matrices with complex conjugate
  shifts [SB, p. 433], and local quadratic convergence with the Rayleigh shift.
- **The cyclic Jacobi method** with its quadratic convergence per sweep.
- **Commuting families**: simultaneous real Schur forms [HJ, Theorem 2.3.6, p. 83].

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 92a6dba, module `NASC/EigenvalueMethods.lean`, proves the following without `sorry`,
with the same recursive accumulated factors (stated over any monoid):
- §3.1: the unitarity of `Pₖ` and `A Pₖ = Pₖ B k`
  (NASC.IsQRIteration.conjTranspose_accumulatedQ_mul_self_and_mul_eq), `B k = Pₖᴴ A Pₖ`
  (NASC.IsQRIteration.eq_conjTranspose_mul_mul), `A Pₖ = Pₖ₊₁ R k`
  (NASC.IsQRIteration.mul_accumulatedQ_eq) and `Aᵏ = Pₖ Uₖ`
  (NASC.IsQRIteration.pow_eq_mul_accumulatedR); the upper triangularity of `Uₖ` is not proved
  there.

The same module states the rectangular singular value decomposition, the convergence of the
unshifted QR algorithm, the unitary Hessenberg reduction and the unreduced shifted step with
`sorry`, and `NASC/Conditioning.lean` states the column-deletion interlacing with `sorry`. Its
modules are a cited source, not the specification.

## References

- [D] J. W. Demmel, *Applied Numerical Linear Algebra*, SIAM, 1997, §§3.2, 4.2, 4.4, 5.3.
- [HJ] R. A. Horn, C. R. Johnson, *Matrix Analysis*, Cambridge University Press, 1985, §§2.3,
  7.3.
- [P] B. N. Parlett, *The Symmetric Eigenvalue Problem*, SIAM Classics in Applied Mathematics,
  1998, §§7.2, 8.9–8.11.
- [SB] J. Stoer, R. Bulirsch, *Introduction to Numerical Analysis*, 3rd ed., Springer, 2002,
  §§6.5.1, 6.5.4, 6.6.4–6.6.5.
- [TB] L. N. Trefethen, D. Bau, *Numerical Linear Algebra*, SIAM, 1997, Lectures 4–5, 26, 28,
  31, 33.

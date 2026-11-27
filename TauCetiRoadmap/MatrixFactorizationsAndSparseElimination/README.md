# Roadmap: matrix factorizations and sparse elimination

**Summary.** This roadmap builds the exact theory behind the direct methods of numerical linear
algebra, before any rounding:
- the matrix conventions shared by the numerical-analysis roadmaps: which matrix norms are used,
  singular values and eigenvalues numbered from zero in decreasing order, eigenvalues of a general
  matrix counted with multiplicity, and the spectral radius of a real matrix read over the complex
  numbers;
- the LU factorization: when it exists and is unique, Gaussian elimination as an algorithm whose
  pivots are ratios of leading principal minors, and its intermediate matrices as Schur
  complements;
- Gaussian elimination with partial pivoting, which factors a row permutation of every square
  matrix, singular or not, with multipliers of modulus at most one;
- growth factors: the bound `2^(n−1)` for partial pivoting and the matrix that attains it, the
  bound `2` for diagonally dominant matrices, and growth `1` for positive definite ones;
- Householder reflectors and the QR factorization of a matrix of any shape, its uniqueness at full
  column rank, and its link with the Cholesky factor of `Aᴴ A`;
- linear least squares over the real or complex numbers, and its solution through QR;
- sparse elimination: the graph of a matrix, elimination graphs and fill, the fill-path theorem,
  the filled graph as a chordal graph with the natural ordering as perfect elimination ordering,
  the elimination tree, row subtrees, and the reorderings that change neither.

The roadmap is a synthesis of Higham, Golub and Van Loan, Trefethen and Bau, Stoer and Bulirsch,
Björck's monograph on least squares, Horn and Johnson, and the survey of sparse direct methods by
Davis, Rajamanickam and Sid-Lakhdar (see [References](#references)); it follows none of them
section by section. Headlines that restate a source result cite a theorem, equation or section
with its printed page; corollaries and adaptations carry a proof route.

It rests on Mathlib's matrices, Schur complements, `LDLᴴ` decomposition, spectra and singular
values, and on Tau Ceti's condition number and real Cholesky factorization.
[GaussianLinearModels](../GaussianLinearModels/README.md) supplies least squares for real designs
of any rank, of which Layer 6 is the complex matrix form;
[PerfectAndChordalGraphs](../PerfectAndChordalGraphs/README.md) supplies chordal graphs and perfect
elimination orderings, which Layer 7 meets as filled graphs; and
[IterativeMethodsForLinearSystems](../IterativeMethodsForLinearSystems/README.md) fixes the same
complex spectral radius that Layer 1 makes the family convention; and
[EigenvalueAndSingularValueInequalities](../EigenvalueAndSingularValueInequalities/README.md)
enumerates the eigenvalues of an operator as Layer 1 does for matrices, and owns the positive
definite completions of chordal patterns that border Layer 7. The perturbation theory of linear
systems and the effect of rounding on these algorithms are left to other roadmaps.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test; the other headlines are targets of the
same standing, stated in prose.

Suggested home: `TauCeti/LinearAlgebra/Matrix/` for Layers 1–6 and
`TauCeti/Combinatorics/SimpleGraph/` with `TauCeti/LinearAlgebra/Matrix/` for Layer 7.

## How to read the build

Layer 1 fixes the conventions and proves the facts that make them usable; the other numerical
roadmaps of the family copy them. Layer 2 is exact elimination without pivoting over any field.
Layer 3 adds row interchanges over `ℝ` or `ℂ` and reduces partial pivoting to Layer 2 applied to
`P A`. Layer 4 bounds the entries of the reduced matrices of Layers 2 and 3. Layer 5 is
independent of Layers 2–4; Layer 6 uses only Layer 5 and the conventions. Layer 7 uses the
elimination of Layer 2 for its matrix statements (§7.2) and is otherwise pure graph theory.

The dependencies inside the layers: §2.2 uses §2.1; §3.1 uses §2.2; §4.2 and §4.3 use §3.1; §4.4
uses §2.2, and its last headline also §3.1; §4.5 uses §2.2; §5.2 uses §5.1; §6.2 uses §5.2 and
§6.1; §7.2 uses §2.1, §2.2 and §7.1; §7.3 uses §7.1.

## Conventions

These conventions are owned here and copied verbatim by the other numerical-analysis roadmaps.

- **Matrices and scalars.** Matrices are `Matrix (Fin m) (Fin n) 𝕜` over an `RCLike` field `𝕜`
  (`ℝ` or `ℂ`), or over an arbitrary field where no norm enters (Layer 2). Vectors that are
  measured are `EuclideanSpace 𝕜 (Fin n)` and act through `Matrix.toEuclideanLin`.
- **Zero-based indexing.** Indices start at `0`. The sources' `σ₁`, `λ₁`, `u₁₁` and first pivot
  carry index `0` here, and the leading principal block of order `k`, `A(1:k, 1:k)` in the
  sources, is `leadingBlock A k`. A bound stated in the sources with `2^(i−1)` for row `i`
  therefore reads `2^i` here.
- **Matrix norms.** There is no default matrix norm. Each statement opens one of Mathlib's scoped
  instances: `Matrix.Norms.L2Operator` (the spectral norm, the operator norm between Euclidean
  spaces), `Matrix.Norms.Operator` (the `ℓ∞` operator norm, the largest absolute row sum) or
  `Matrix.Norms.Frobenius`. Mathlib's entrywise sup norm is not used as a matrix norm; the largest
  modulus of an entry, where it enters (Layer 4), is the explicit `entryMax`.
- **Singular values and Hermitian eigenvalues.** The singular values of `A` are Mathlib's
  `LinearMap.singularValues` of `Matrix.toEuclideanLin A`, a decreasing sequence indexed from `0`
  that vanishes beyond the rank. The eigenvalues of a Hermitian matrix are Mathlib's
  `Matrix.IsHermitian.eigenvalues₀`, in decreasing order.
- **Spectra.** A spectrum with multiplicity is an enumeration `α : Fin n → ℂ` whose multiset of
  values is the multiset of roots of the characteristic polynomial (`IsEigenvalueEnumeration`).
  No order is imposed on a general spectrum. This is the matrix form of the enumeration of
  EigenvalueAndSingularValueInequalities (Conventions), which writes the multiset of values as
  `Multiset.map α univ.val`; the proved Check `isEigenvalueEnumeration_iff_map_univ` identifies
  the two forms.
- **Spectral radius.** The spectral radius of a complex square matrix is Mathlib's
  `spectralRadius ℂ A`, valued in `ℝ≥0∞`; it is the largest modulus of an eigenvalue, and `0` for
  `n = 0`. The spectral radius of a real matrix is that of `A.map (algebraMap ℝ ℂ)`. The real
  spectral radius, a supremum over real eigenvalues only, is not used: it is `0` for `2` times a
  rotation by a right angle, whose eigenvalues are `±2i`. This is the convention of
  IterativeMethodsForLinearSystems (Conventions).
- **Condition number.** `κ(A) = ‖A‖ ‖A⁻¹‖` is Tau Ceti's `TauCeti.conditionNumber`, with the norm in
  force; it is `0` at a non-invertible matrix, so every statement about it assumes `IsUnit A`.
- **Inverses.** `A⁻¹` is Mathlib's inverse, `0` at a singular matrix. Every statement containing
  `⁻¹` carries a hypothesis that makes the inverse genuine: `IsUnit A`, `A.det ≠ 0`, or nonzero
  leading principal minors from which it is proved.
- **Order.** The entrywise order on real matrices is the Pi order `≤`. Entrywise strict positivity
  is written as a statement about every entry, never as the strict Pi order, which only asks for
  one strict entry.
- **Triangular matrices.** Lower and upper triangular are Mathlib's `Matrix.IsLowerTriangular` and
  `Matrix.IsUpperTriangular`; "unit lower triangular" adds ones on the diagonal. An `m × n` matrix
  is upper trapezoidal when its entries with column index below row index vanish.

## Layer 1: matrix conventions

### 1.1 Norms, singular values and condition numbers

- **The spectral norm is the largest singular value** (`l2OpNorm_eq_singularValues_zero`), a
  proved Check: one step from the Eckart–Young identification in Tau Ceti [TB, Theorem 5.3,
  p. 34].
- **Complexification keeps the spectral norm** (`l2OpNorm_map_ofReal`). For real `A`,
  `‖A.map (algebraMap ℝ ℂ)‖ = ‖A‖` in the spectral norm. Route: `(A x)` for complex `x = u + i v`
  has squared norm `‖A u‖² + ‖A v‖²`, so the complex operator norm is at most the real one, and
  real vectors give the reverse inequality.
- **Condition number from singular values** (`conditionNumber_eq_singularValues_div`). For an
  invertible matrix of order `n + 1`, `κ(A) = σ₀ / σₙ` in the spectral norm
  [TB, (12.16), p. 94]. Route: the singular values of `A⁻¹` are the reciprocals of those of `A` in
  reverse order, and `‖A⁻¹‖` is the largest of them.
- **Spectral radius below a matrix norm** (`spectralRadius_map_le_l2OpNorm`,
  `spectralRadius_map_le_linftyOpNorm`), proved Checks: one step from Mathlib's bound of the
  spectral radius by the norm in a Banach algebra [HJ, Theorem 5.6.9, p. 297; TB, Exercise 3.2,
  p. 24], with `l2OpNorm_map_ofReal` for the spectral norm and an equality of row sums for the
  `ℓ∞` operator norm.

**Checks.**
- `A = [[3, 0], [4, 0]]`: spectral norm `5`, `ℓ∞` operator norm `4`, Frobenius norm `5`, largest
  entry `4`. The three norms are distinct instances, and the entrywise sup norm differs from all
  of them on `[[1, 1], [1, 1]]`, where it is `1` and the spectral norm is `2`.
- `κ(diag(1, 1/2)) = 2` and the singular values are `1, 1/2`; for the singular matrix
  `diag(1, 0)` Tau Ceti's `κ` is `0`, which is why the headline assumes `IsUnit A`.
- Negative control for the spectral radius: `[[0, −2], [2, 0]]` has eigenvalues `±2i`, complex
  spectral radius `2` equal to its spectral norm, and no real eigenvalue.

### 1.2 Spectra

- **Enumerations exist** (`exists_isEigenvalueEnumeration`): a complex square matrix of order `n`
  has `n` eigenvalues counted with algebraic multiplicity [TB, Theorem 24.2, p. 184]. Route: the
  characteristic polynomial is monic of degree `n` and splits over `ℂ`.
- **The values are the spectrum** (`IsEigenvalueEnumeration.range_eq_spectrum`)
  [TB, Theorem 24.1, p. 183]. Route: `λ` is a root of the characteristic polynomial exactly when
  `λ - A` is singular.
- **The operator form** (`isEigenvalueEnumeration_iff_map_univ`), a proved Check: the multiset
  `Multiset.map α univ.val` of EigenvalueAndSingularValueInequalities (Conventions) is the
  multiset of `List.ofFn α`, so the two conventions agree; one step from Mathlib's
  `Fin.univ_val_map`.
- **Determinant and trace** (`IsEigenvalueEnumeration.prod_eq_det_and_sum_eq_trace`), a proved
  Check: the product of an enumeration is `det A` and its sum is `trace A` [TB, (24.8), p. 186];
  one step from Mathlib's expressions of determinant and trace by the roots of the characteristic
  polynomial.
- **Spectral radius from an enumeration** (`IsEigenvalueEnumeration.spectralRadius_eq_iSup`):
  `ρ(A) = max_i |α i|`, and `0` for `n = 0`. Route: `IsEigenvalueEnumeration.range_eq_spectrum`
  and the definition of the spectral radius as a supremum over the spectrum.
- **Hermitian matrices** (`isEigenvalueEnumeration_eigenvalues₀`): the decreasing eigenvalues of a
  Hermitian matrix, read in `ℂ`, enumerate its spectrum. Route: the spectral theorem gives a
  unitary diagonalization, so the characteristic polynomial is `∏ (X − λᵢ)`.

**Checks.**
- `A = [[2, i], [−i, 2]]` is Hermitian with eigenvalues `3, 1` in decreasing order; their product
  `3` and sum `4` are `det A` and `trace A`.
- `A = [[0, 1], [0, 0]]`: the only enumeration is `(0, 0)`, the spectrum is `{0}`, and
  `ρ(A) = 0` although `A ≠ 0`; an enumeration by distinct eigenvalues would have one value only.
- For `n = 0` the empty enumeration is the only one and the spectral radius is `0`.

## Layer 2: LU factorization and elimination without pivoting

### 2.1 Existence and uniqueness

`leadingBlock A k hk` is the leading principal block of order `k ≤ n`, and `IsLU A L U` says that
`L` is unit lower triangular, `U` is upper triangular and `L * U = A`.

- **Existence and uniqueness** (`existsUnique_isLU_iff`). Over any field, a square matrix has
  exactly one LU factorization if and only if its leading principal blocks of orders `0, …, n − 1`
  are nonsingular; `A` itself may be singular [H, Theorem 9.1, p. 171; GVL, Theorem 3.2.1, p. 97].
  Route: induction on `n` with the bordered factorization; if some proper leading block is
  singular, either no factorization exists or a zero diagonal entry of `U` lets a column of `L`
  vary.
- **Leading minors** (`IsLU.det_leadingBlock`). For every LU factorization the leading minor of
  order `k` is `u₀₀ ⋯ u_(k−1)(k−1)` [H, (9.1), p. 172]. Route: the leading block of `L U` is the
  product of the leading blocks, and `L` is unit triangular.
- **Conjugate transposes.** If `A = L U` with nonsingular proper leading blocks and `D` is the
  diagonal of `U`, and `A` is nonsingular, then `Aᴴ = (D⁻¹ U)ᴴ (Dᴴ Lᴴ)` is the LU factorization
  of `Aᴴ`. Route: one step from `existsUnique_isLU_iff`, since `Aᴴ` has the conjugate leading
  minors and `D` is nonsingular.

**Checks.**
- `[[2, 1], [4, 5]] = [[1, 0], [2, 1]] · [[2, 1], [0, 3]]`, and the leading minors `2` and `6`
  are `2` and `2 · 3`.
- Singular `A` is allowed: `[[1, 1], [1, 1]] = [[1, 0], [1, 1]] · [[1, 1], [0, 0]]`, unique.
- Negative controls: `[[0, 0], [0, 0]]` has the factorizations `L = [[1, 0], [l, 1]]`, `U = 0`
  for every `l`, so existence without the minor condition does not give uniqueness; and
  `[[0, 1], [1, 0]]` has no LU factorization.
- An exhaustive search over the fields with two and three elements, orders `1` to `3`, finds a
  unique factorization exactly when the minor condition holds.

### 2.2 Gaussian elimination

`gaussStep A k` subtracts from each row `i > k` the multiple `A i k / A k k` of row `k`, in the
columns `j ≥ k`; a zero pivot leaves the matrix unchanged, because Mathlib's `x / 0` is `0`.
`gaussReduced A k` is the matrix after `k` stages, `gaussPivot A k` the pivot of stage `k`, and
`gaussLower A` the unit lower triangular matrix of the multipliers.

- **Pivots and minors** (`gaussPivot_ne_zero_iff`, `det_leadingBlock_eq_prod_gaussPivot`).
  Elimination meets no zero pivot in its first `n − 1` stages exactly when the proper leading
  minors are nonzero; and while the earlier pivots are nonzero, the leading minor of order `k` is
  the product of the first `k` pivots [GVL, Theorem 3.2.1 and its proof, pp. 97–98;
  TB, Lecture 20, p. 147]. Route: the stages before `k` multiply the leading block of order `k`
  by unit lower triangular matrices.
- **Elimination computes the factorization** (`isLU_gaussLower_gaussReduced`). If the first
  `n − 1` pivots are nonzero, `A = gaussLower A * gaussReduced A n` [TB, Lecture 20, p. 147;
  SB, §4.1, p. 195]. Route: each stage is a left multiplication by a Gauss transform whose
  inverse puts the multipliers in column `k`.
- **Reduced matrices are Schur complements** (`gaussReduced_eq_schurComplement`). After `k`
  stages, with nonsingular leading blocks of orders up to `k`, the trailing part of the reduced
  matrix is `A₂₂ − A₂₁ A₁₁⁻¹ A₁₂` for the leading block `A₁₁` of order `k`. Route: induction on
  `k`, with the quotient formula for Schur complements; Mathlib's `Matrix.det_fromBlocks₁₁`
  gives the determinant identity of the previous headline as a corollary.

**Checks.**
- `[[1, 2], [3, 4]]`: one stage gives the pivot `−2 = 4 − 3 · 2`, the Schur complement.
- `[[1, 1, 1], [1, 2, 1], [1, 1, 2]]` reduces to `U = [[1, 1, 1], [0, 1, 0], [0, 0, 1]]`
  with multipliers `l₁₀ = l₂₀ = 1` and `l₂₁ = 0`.
- Negative control: `[[0, 1], [1, 1]]` has zero first pivot; `gaussStep` leaves it unchanged, the
  result is not upper triangular, and the hypothesis of `isLU_gaussLower_gaussReduced` fails.

### 2.3 Positive definite matrices

- **The `LDLᴴ` decomposition is an LU factorization** (`PosDef.isLU_ldl`). For positive definite
  `A`, Mathlib's `LDL.lower` and `LDL.diag` satisfy `IsLU A L (D Lᴴ)` [B, Theorem 1.2.1, p. 9;
  SB, (4.3.3), p. 205]. Route: `L` is unit lower triangular and `L D Lᴴ = A` in Mathlib; `D Lᴴ` is
  upper triangular.
- For real positive definite `A` the Cholesky factor `G` of Tau Ceti, `A = G Gᵀ` with positive
  diagonal, is `L D^(1/2)` with `L` and `D` from the previous headline [GVL, Theorem 4.2.5,
  p. 143]; this is a consequence of the uniqueness in Tau Ceti and is not a separate target.

**Checks.**
- `[[4, 2], [2, 3]] = [[1, 0], [1/2, 1]] · [[4, 2], [0, 2]]`, with `D = diag(4, 2)` and Cholesky
  factor `[[2, 0], [1, √2]]`.
- Negative control: the indefinite `[[1, 2], [2, 1]]` has the LU factorization with `U` diagonal
  `1, −3`, which is not `D Lᴴ` for a positive `D`.

## Layer 3: partial pivoting

### 3.1 Elimination with row interchanges

`IsPartialPivotRun A p B` describes a run: `B 0 = A`, and stage `k` interchanges rows `k` and
`p k ≥ k`, where `p k` attains the largest modulus in column `k` on or below the diagonal, and
then applies `gaussStep` at `k`. `IsSmallestPivotIndex p B` is the tie rule that takes the
smallest row index of largest modulus. `pivotPerm p k` is the product of the interchanges of the
stages from `k` on, and `A.submatrix (pivotPerm p 0) id` is `P A`.

- **Runs exist** (`exists_isPartialPivotRun`), with the smallest-index tie rule. Route: recursion
  on the stage, choosing `p k` by `Finset.exists_max_image`.
- **Partial pivoting is elimination of `P A`** (`IsPartialPivotRun.gaussReduced_submatrix`).
  After `k` stages the reduced matrix of `P A` without pivoting is `B k` with its rows permuted
  by the interchanges still to come [H, §9.1, p. 173; TB, (21.7), p. 160; GVL, Theorem 3.4.1,
  p. 113]. Route: induction on `k`; the interchanges of the stages after `k` touch only rows below
  `k`, and `gaussStep` at `k` commutes with permutations of those rows.
- **The factorization** (`IsPartialPivotRun.isLU`). Every run gives `P A = L U` with
  `L = gaussLower (P A)`, `U = B n`, and multipliers of modulus at most one, for singular `A` as
  well [GVL, Theorem 3.4.1, p. 113; SB, (4.1.9), p. 195]. Route: the previous headline at `k = n`,
  and at a zero pivot the whole column below it is zero, so the stage changes nothing.
- **Nonsingularity** (`IsPartialPivotRun.det_ne_zero_iff`). `det U ≠ 0` exactly when
  `det A ≠ 0`, and for nonsingular `A` every pivot is nonzero. Route: `det (P A) = ± det A` and
  `det L = 1`.
- **Every matrix has a pivoted LU factorization** (`exists_isLU_submatrix_norm_le_one`): a
  permutation `σ`, unit lower triangular `L` with entries of modulus at most one and upper
  triangular `U` with `A.submatrix σ id = L U`, and `U` nonsingular exactly when `A` is
  [TB, (21.7), p. 160]. Route: the three previous headlines.

**Checks.**
- `[[0, 1], [1, 1]]`: `p 0 = 1`, `P A = [[1, 1], [0, 1]]`, `L = I`.
- `[[1, 2], [3, 4]]`: `p 0 = 1`, the multiplier is `1/3`, `U = [[3, 4], [0, 2/3]]`.
- Singular `A = [[0, 0], [0, 1]]`: the first pivot is `0`, the column below it is zero, no stage
  changes anything, and `U = A`.
- Negative control for the order of the product in `pivotPerm`: for `n = 3` and
  `p = (1, 2, 2)` the rows of `P A` are the rows `1, 2, 0` of `A`, as `s₀ s₁ s₂` gives; the
  reversed product `s₂ s₁ s₀` would give `2, 0, 1`.
- In 20,000 random runs of orders up to `6`, with the smallest-index and with random tie rules,
  the reduced matrices of `P A` agree with the permuted `B k` and `P A = L U` holds.

## Layer 4: growth factors

### 4.1 Definitions

`entryMax A` is the largest modulus of an entry, in `ℝ≥0`, and `0` for an empty matrix.
`growthFactor A B` divides the largest `entryMax (B k)` over the stages by `entryMax A`; for
`A = 0` it is the junk value `0`. The growth factor of elimination without pivoting is
`growthFactor A (fun k ↦ gaussReduced A k)` [H, §9.3, p. 177].

**Checks.**
- `entryMax [[1, −3], [2, 0]] = 3`.
- For `A = [[1, 1], [−1, 1]]` without pivoting the reduced matrix is `[[1, 1], [0, 2]]` and the
  growth factor is `2`.
- Negative control for the maximum over all stages: without pivoting,
  `A = [[1, 1, 1], [1, 0, 0], [1, 0, −1]]` has after one stage the trailing part
  `[[−1, −1], [−1, −2]]` and finally `U = [[1, 1, 1], [0, −1, −1], [0, 0, −1]]`. The growth
  factor is `2`; read from `A` and `U` alone it would be `1`.

### 4.2 Partial pivoting

- **The exponential bound** (`IsPartialPivotRun.growthFactor_le_two_pow`). After `k` stages the
  largest entry is at most `2^min(k, n−1)` times that of `A`, and the growth factor is at most
  `2^(n−1)` [H, §9.3, p. 177; TB, Lecture 22, p. 165]. Route: a stage adds to each entry at most
  the modulus of the pivot row's entry, since the multipliers have modulus at most one; the last
  stage has no rows below the pivot.
- **The row bound** (`IsPartialPivotRun.nnnorm_le_two_pow_mul`). With zero-based `i`,
  `|u_ij| ≤ 2^i max_{k ≤ i} |(P A)_kj|` [H, p. 177, stated with `2^(i−1)` for one-based `i`].
  Route: row `i` of `U` is row `i` of `P A` minus multiples of earlier rows of `U`, by induction on
  `i`.

**Checks.**
- For `n = 1` the growth factor is `1` for every nonzero `A`, and `2^0 = 1`.
- Negative control for pivoting: without interchanges `[[1/100, 1], [1, 1]]` produces the entry
  `1 − 100 = −99` and the growth factor `99`.
- 20,000 random runs: the stage bound and the row bound hold; Wilkinson's matrix of §4.3 attains
  both.

### 4.3 Wilkinson's matrix

`wilkinsonMatrix n` has `1` on the diagonal and in the last column, `−1` below the diagonal, and
`0` elsewhere.

- **The bound is attained** (`wilkinsonMatrix_growthFactor`). For `n ≥ 1`, partial pivoting with
  the smallest-index tie rule makes no interchange, the last column of `U` is
  `1, 2, 4, …, 2^(n−1)`, and the growth factor is `2^(n−1)` [H, §9.3, p. 177; TB, (22.4),
  pp. 165–166]. Route: by induction on the stage, every column below the diagonal holds `−1`s
  and the pivot `1`, so every candidate ties; adding row `k` to the rows below doubles the last
  column.

**Checks.**
- `n = 4`: the last column of `U` is `1, 2, 4, 8` and the growth factor is `8`.
- Negative control: with the largest-index tie rule the run on `n = 3` interchanges rows `0` and
  `2` and the growth factor is `2`, not `4`; for `n ≥ 3` the tie rule is needed.

### 4.4 Diagonal dominance

Diagonal dominance by rows is `∑_{j ≠ i} |a_ij| ≤ |a_ii|` for every `i`, written in
`Suggested.lean` as a sum over `Finset.univ.erase i`; by columns, the same for the transpose. It
is weak: equality is allowed.

- **Nonzero minors** (`det_leadingBlock_ne_zero_of_diagDominant`). A nonsingular matrix,
  diagonally dominant by rows or by columns, has nonzero proper leading principal minors
  [H, Theorem 9.8, p. 181]. Route: by the next headline the trailing part of every reduced matrix
  stays dominant, so a zero pivot comes with a zero row or column of the trailing part and makes
  `A` singular; hence the first `n − 1` pivots are nonzero, and §2.2 gives the minors.
- **Growth at most two** (`growthFactor_le_two_of_diagDominant`). Elimination without pivoting
  keeps the trailing part of every reduced matrix dominant in the same sense, and the growth
  factor is at most `2` [H, Theorem 9.8, p. 181; GVL, proof of Theorem 3.4.3, p. 120]. No
  nonsingularity is needed: a zero pivot of a dominant trailing part comes with a zero row or
  column, and the stage then changes nothing. Route: the Schur complement step preserves
  dominance; by rows, `|b_ij| ≤ |a_ij| + |a_ik| |a_kj| / |a_kk|` summed over `j` stays below the
  diagonal; the entries of row `i` of all reduced matrices are bounded by `2 max |a|`.
- **No interchanges for column dominance** (`noInterchange_of_diagDominant_cols`). For a matrix
  diagonally dominant by columns the multipliers have modulus at most one, and partial pivoting
  with the smallest-index tie rule makes no interchange [H, Theorem 9.8, p. 181; GVL,
  Theorem 3.4.3, p. 120, for strict dominance of `Aᵀ`]. Route: the pivot dominates its column in
  every reduced matrix, by the previous headline.

**Checks.**
- `[[1, 0], [2, 3]]` is dominant by rows, not by columns; `L = [[1, 0], [2, 1]]` has a multiplier
  `2`, so the column hypothesis of the last headline cannot be replaced by the row one.
- `[[1, 1], [−1, 1]]` is dominant by rows and by columns and attains the growth factor `2`.
- Negative control for the first headline: `[[0, 0], [1, 1]]` is dominant by rows, singular, and
  has no LU factorization; [H, Theorem 9.8] omits the nonsingularity of `A`.
- An exhaustive search over the 80,294 matrices of orders `2` and `3` with entries in
  `{−2, …, 2}` that are dominant by rows or by columns, 17,894 of them singular, finds no failure
  of dominance of the trailing parts, of the growth bound, or of the column pivot property; a
  random search over 176,429 nonsingular real and 20,000 complex examples confirms the minors and
  the growth bound.

### 4.5 Positive definite matrices

`trailingBlock A k` is the trailing principal block of order `n − k`.

- **Growth one** (`growthFactor_eq_one_of_posDef`). For positive definite `A` of order `n ≥ 1`
  every trailing block of every reduced matrix is positive definite and the growth factor is `1`.
  Route: the trailing block after `k` stages is a Schur complement (§2.2), positive definite by
  Mathlib's `Matrix.PosDef.fromBlocks₁₁`; the largest entry of a positive definite matrix lies on
  the diagonal [B, Theorem 1.2.4, p. 10], and the diagonal entries do not increase, since
  a_ii − |a_ik|² / a_kk ≤ a_ii.

**Checks.**
- `[[4, 2], [2, 3]]`: the reduced matrix is `[[4, 2], [0, 2]]`, growth factor `1`.
- `n = 0`: the growth factor is the junk `0`, which is why the headline assumes `n ≥ 1`.
- Negative control: the indefinite symmetric `[[1, 2], [2, 1]]` gives the entry `−3` and growth
  factor `3/2`.

## Layer 5: Householder reflectors and QR factorization

### 5.1 Householder reflectors

`householder v` is `I − 2 v vᴴ / (vᴴ v)`, and `I` for `v = 0` by the junk value of `2 / 0`.

- **Reflectors are unitary Hermitian involutions** (`householder_conjTranspose_and_mul_self`):
  `Hᴴ = H`, `H H = I`, and `H` is unitary [GVL, §5.1.2, p. 209; B, (2.2.1)–(2.2.3), p. 46;
  SB, §4.7, pp. 224–225]. Route: expand `(I − τ v vᴴ)²` with `τ = 2 / vᴴ v` real; the first two
  give `Hᴴ H = I`.
- **Reflectors introduce zeros** (`exists_householder_mulVec_eq`): for every `x` and index `i₀`
  some reflector maps `x` to `γ e_{i₀}` with `|γ| = ‖x‖₂` [TB, Lecture 10, pp. 71–72;
  B, (2.2.6)–(2.2.7), p. 47, complex case; SB, (4.7.5), p. 226]. Route: `γ = −e^{iθ} ‖x‖` with
  `θ` the argument of `x i₀` (any phase when `x i₀ = 0`), and `v = x − γ e_{i₀}`; `x = 0` takes
  `v = 0`.

**Checks.**
- `x = (3, 4)`, `i₀ = 0`: `v = (8, 4)`, `H x = (−5, 0)`.
- `householder 0 = I`.
- Negative control: over `ℂ` the real choice `γ = −‖x‖` without the phase fails for
  `x = (i, 1)`: with `v = x + ‖x‖ e₀`, `H x = (−1/√2 − i, −i/√2)` has a nonzero second entry.

### 5.2 QR factorization

`IsReducedQR A Q R` says that `Qᴴ Q = I`, `R` is upper triangular and `A = Q R`, for `Q` of size
`m × n` and `R` of order `n`.

- **Full QR** (`exists_unitary_mul_upperTrapezoidal`). Every `m × n` matrix, of any shape and
  rank, is a unitary matrix times an upper trapezoidal one [TB, Theorem 7.1, p. 51, for `m ≥ n`;
  GVL, §5.2.1, p. 224; SB, (4.7.7), p. 228]. Route: `min(m, n)` Householder steps (§5.1), each
  zeroing a column below the diagonal; the statement for `m < n` is the same algorithm.
- **Reduced QR** (`exists_isReducedQR`): for `n ≤ m`. Route: the first `n` columns of the full
  factorization.
- **Uniqueness** (`existsUnique_isReducedQR`). At rank `n` the reduced QR factorization with
  positive real diagonal of `R` is unique [TB, Theorem 7.2, p. 52; GVL, Theorem 5.2.2, p. 230;
  B, Theorem 2.2.2, p. 52]. Route: `Rᴴ R = Aᴴ A` is the Cholesky factorization of a positive
  definite matrix, unique with positive diagonal, and `Q = A R⁻¹`.
- **Gram matrix and range** (`IsReducedQR.gram_and_range`). Every reduced QR factorization has
  `Rᴴ R = Aᴴ A`; at rank `n`, `R` is nonsingular and the columns of `Q` span the range of `A`
  [GVL, Theorem 5.2.1, p. 229; B, Theorem 2.2.2, p. 52]. Route: `Qᴴ Q = I`; at rank `n`,
  `det(Rᴴ R) = det(Aᴴ A) ≠ 0`, and `Q = A R⁻¹` gives the equality of ranges.
- **The real case and Tau Ceti's Cholesky factor.** For real `A` of rank `n` the unique `R` of
  positive diagonal is the transpose of the Tau Ceti Cholesky factor of `Aᵀ A`
  [GVL, Theorem 5.2.2, p. 230; B, (1.2.9), p. 10]. Route: one step from
  `IsReducedQR.gram_and_range` and the uniqueness of the Cholesky factor in Tau Ceti.

**Checks.**
- `[[3], [4]] = [[3/5], [4/5]] · [[5]]`.
- At rank below `n` uniqueness fails: `0 = Q · 0` for every `Q` with orthonormal columns.
- Negative control for the diagonal condition: `−Q` and `−R` give another factorization of
  `[[3], [4]]`; over `ℂ`, `e^{iθ} Q` and `e^{−iθ} R` too, so positivity of the real part alone
  without a real diagonal would not give uniqueness.

## Layer 6: linear least squares

### 6.1 Least-squares solutions

`IsLeastSquaresSolution A b x` says that `x` minimizes `‖b − A x‖₂`. For `𝕜 = ℝ` it is the
predicate of [GaussianLinearModels](../GaussianLinearModels/README.md) §1.1 for the design
`Matrix.toEuclideanLin A` (`isLeastSquaresSolution_iff_isLeastSquares`, a proved Check by
definitional unfolding).

- **Characterizations** (`isLeastSquaresSolution_tfae`). Over `ℝ` or `ℂ` the following are
  equivalent: `x` is a least-squares solution; the normal equations `Aᴴ A x = Aᴴ b`; the residual
  is orthogonal to the range of `A`; and `A x = P b` for the orthogonal projector `P` onto the
  range [B, Theorem 1.1.8, p. 7; SB, Theorem (4.8.1.3), p. 233; TB, Theorem 11.1, p. 80]. Route:
  Mathlib's characterization of nearest points of a closed subspace by orthogonality of the
  residual, and `⟪A y, r⟫ = ⟪y, Aᴴ r⟫`.
- **Existence and uniqueness** (`exists_isLeastSquaresSolution`). A solution exists, all solutions
  have the same fitted value `A x`, and the solution is unique exactly when `A` has rank `n`
  [SB, Theorem (4.8.1.3), p. 233, for existence and the fitted value; B, p. 7, after
  Theorem 1.1.8, for the solution set `x + ker A`]. Route: `P b` lies in the range; two solutions
  differ by an element of the kernel.

For real scalars each of these targets is one step from GaussianLinearModels §1.1 applied to
the design `Matrix.toEuclideanLin A`, through `isLeastSquaresSolution_iff_isLeastSquares`; they
are owned here for complex scalars and stated over `RCLike` so that one statement serves both.

**Checks.**
- `A = [[1], [1]]`, `b = (1, 3)`: the solution is `x = 2`, residual `(−1, 1)`.
- Negative control for the conjugate transpose: `A = [[1], [i]]`, `b = (1, 0)`. Then
  `Aᴴ A = 2` and the solution is `1/2`; the plain transpose gives `Aᵀ A = 0` and normal equations
  without a unique solution.
- `A = 0`: every `x` is a solution, the fitted value is `0`, and uniqueness holds only for
  `n = 0`.

### 6.2 Solution by QR

- **The QR solution** (`isLeastSquaresSolution_iff_of_isReducedQR`). If `A = Q R` is a reduced
  QR factorization with `det R ≠ 0`, the least-squares solution is `x = R⁻¹ Qᴴ b`
  [B, Theorem 2.2.5, p. 56, real case; TB, Algorithm 11.2, p. 83]. Route: substitute `A = Q R`
  in the normal equations; `Qᴴ Q = I` reduces them to `Rᴴ R x = Rᴴ Qᴴ b`, and `Rᴴ` is
  invertible.

**Checks.**
- `A = [[3], [4]]`, `b = (1, 0)`: `Q = (3/5, 4/5)`, `R = 5`, `x = 3/25`.
- Negative control: without `det R ≠ 0` the formula picks `0` (Mathlib's `R⁻¹ = 0`) while every
  `x` is a solution when `A = 0`.

## Layer 7: sparse elimination

### 7.1 Elimination graphs and the filled graph

`matrixGraph A` joins distinct `i` and `j` when `A i j ≠ 0` or `A j i ≠ 0`.
`eliminateVertex G v` makes the neighbours of `v` pairwise adjacent and isolates `v`, keeping the
vertex type; `eliminationGraph G k` eliminates the vertices `0, …, k − 1` in turn; and
`filledGraph G` is the union of the elimination graphs [SB, §4.12, pp. 274–277, with the
elimination rule (4.12.3), p. 277; DRS, p. 395]. `le_filledGraph` is a proved Check. The
definitions `IsChordal` and `IsPerfectEliminationOrder` are those of
[PerfectAndChordalGraphs](../PerfectAndChordalGraphs/README.md) §1.1.

- **The fill-path theorem** (`filledGraph_adj_iff`). `i` and `j` are adjacent in the filled graph
  exactly when they are distinct and joined by a walk in `G` whose other vertices are smaller than
  both [DRS, §4.1, p. 397, the path lemma of Rose, Tarjan and Lueker]. Route: induction on the
  number of eliminated vertices; eliminating `v` shortcuts walks through `v`.
- **Parter's rule** (`isPerfectEliminationOrder_filledGraph`). The natural order is a perfect
  elimination ordering of the filled graph: two larger neighbours of a vertex are adjacent
  [DRS, p. 396]. Route: when the vertex is eliminated both are its neighbours.
- **Minimality** (`filledGraph_le_of_isPerfectEliminationOrder`). The filled graph is the least
  supergraph of `G` for which the natural order is a perfect elimination ordering. Route:
  induction on `k`, `eliminationGraph G k ≤ H`, since the larger neighbours of `k` in `H` form a
  clique.
- **The filled graph is chordal** (`isChordal_filledGraph`) [DRS, p. 395]. Route: Parter's rule
  and the theorem of Fulkerson and Gross, PerfectAndChordalGraphs §1.4.

**Checks.**
- The star with centre `0` and leaves `1, 2, 3` fills completely: the filled graph is complete.
  Numbered with the centre last, it does not fill at all.
- The path `a – b – c` numbered `b, a, c` fills the edge `{a, c}`; numbered `a, b, c` it does
  not fill.
- On 3,000 random graphs of up to `9` vertices the fill-path description, Parter's rule and the
  minimality agree with direct elimination.

### 7.2 Fill of factorizations

- **LU fill lies in the filled graph** (`IsLU.adj_filledGraph`). If the proper leading minors of
  `A` are nonzero and `A = L U`, a nonzero `L i j` or `U j i` with `j < i` is an edge of the filled
  graph of `matrixGraph A` [SB, (4.12.2), p. 276; DRS, p. 395]. Route: by §2.2, `L` and `U` come
  from elimination; a stage can create a nonzero only where elimination creates an edge.
- **Cholesky fill** (`cholesky_ne_zero_adj_filledGraph`). The same for the Tau Ceti Cholesky
  factor of a real positive definite matrix. Route: the Cholesky factor is `L D^(1/2)` (§2.3).
- **The filled graph is attained** (`exists_posDefMatrix_cholesky_pattern`). Every graph is the
  graph of a positive definite matrix whose Cholesky factor has a nonzero exactly at the edges of
  the filled graph below the diagonal. Route: `n I − Adj(G)` is a nonsingular M-matrix; its
  Schur complements have nonpositive off-diagonal entries, and an entry created by elimination is
  a sum of terms of one sign, so no cancellation occurs.

**Checks.**
- The star `4 I − Adj` with centre `0` has Cholesky factor nonzero in every lower entry, the
  complete filled graph.
- Negative control for the minor hypothesis: `A = 0` has `L = [[1, 0], [1, 1]]`, `U = 0` and an
  empty graph.
- Cancellation: `[[1, 1, 1], [1, 2, 1], [1, 1, 2]]` has filled graph complete but `l₂₁ = 0`; the
  pattern inclusion is not an equality for every matrix, which is why the attained pattern is a
  separate headline.
- On 3,000 random graphs the M-matrix has Cholesky pattern exactly the filled graph, and random
  nonsymmetric values on the symmetrized graph give LU patterns inside it.

### 7.3 The elimination tree

`IsEtreeParent G j i` says that `i` is the parent of `j`: the least neighbour of `j` in the filled
graph that is larger than `j` [DRS, §4.1, p. 397]. A vertex without larger neighbours is a root.

- **Liu's theorem** (`transGen_isEtreeParent_of_adj`). An edge `{i, k}` of the filled graph with
  `i < k` makes `k` a proper ancestor of `i` [DRS, §4.1, p. 397]. Route: induction on `k − i`
  with Parter's rule: `k` and the parent of `i` are larger neighbours of `i`, hence adjacent.
- **Row subtrees** (`rowStructure_iff`). The structure of row `k` of the factor, `k` together with
  the smaller neighbours of `k` in the filled graph, is the union of the tree paths from the
  smaller neighbours of `k` in `G` up to `k` [DRS, §4.2.1, p. 399]. Route: the fill-path theorem
  and Liu's theorem.
- **Equivalent reorderings** (`filledGraph_map_of_isTopological`). Relabelling by a permutation
  that numbers every vertex before its parent, for instance a postordering of the tree, leaves the
  filled graph and the tree unchanged up to the relabelling [DRS, §4.1, p. 398, for
  postorderings]. Route: by the fill-path theorem, it suffices that the relabelling keeps, for
  every edge of the filled graph, the order of its endpoints and of the interior vertices of the
  walks; by Liu's theorem all of them lie in subtrees whose order the relabelling keeps.
- **Matrix form and fill counts.** For a symmetric positive definite matrix and a topological
  reordering of its elimination tree, the reordered matrix has the reordered Cholesky pattern,
  and the number of nonzeros of the factor is unchanged. Route: one step from the previous
  headline and §7.2.

**Checks.**
- Path `0 – 1 – 2`: the tree is the path, every vertex has the next as parent.
- Star with centre `0`, centre first: the filled graph is complete and the tree is the path
  `0 → 1 → 2 → 3`.
- Negative control for the reordering: the path `0 – 1 – 2` does not fill, and `0` is the child
  of `1`. The permutation exchanging `0` and `1` numbers that child after its parent; it turns the
  path into the star with centre `0` numbered first, whose filled graph has the edge `{1, 2}`,
  absent from the relabelled filled graph.
- 30,000 random reorderings by topological orders and postorders of random trees keep the filled
  graph and the parents.

## Downstream consumers

- Backward error analysis of matrix algorithms consumes the LU factorization and its existence
  criterion (§2.1), elimination (§2.2), partial pivoting (§3.1), growth factors (Layer 4), the
  Householder reflectors and QR (Layer 5) and the Cholesky link (§§2.3, 5.2), adding rounding to
  each.
- Dense eigenvalue algorithms consume the conventions (Layer 1), the reflectors (§5.1) and the QR
  factorization (§5.2).
- Krylov subspace methods, finite difference schemes and stationary iterations consume the
  spectral radius convention and the spectral bounds of Layer 1.
- Matrix functions and regularization of ill-posed problems consume the singular value and
  eigenvalue conventions (Layer 1) and least squares (Layer 6).

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above. It owns the family's matrix conventions of Layer 1, the LU
factorization and exact Gaussian elimination with and without partial pivoting, growth factors,
Householder reflectors and QR factorization, linear least squares over `ℝ` and `ℂ` in matrix
form, and the elimination theory of sparse symmetric patterns: elimination graphs, fill, the
filled graph and the elimination tree.

Inputs, not restated:
- Mathlib: matrices, determinants, Schur complements, the `LDLᴴ` decomposition, the scoped matrix
  norms, the spectral radius and Gelfand's bound, singular values, Hermitian eigenvalues, the
  strict-dominance invertibility theorems, orthogonal projections and adjoints, simple graphs.
- Tau Ceti: the condition number, the real Cholesky factorization and its uniqueness, and the
  identification of the operator norm with the largest singular value.
- GaussianLinearModels §1.1: least squares for real designs of any rank, of which Layer 6 is the
  complex matrix form; its least-squares predicate is copied verbatim.
- PerfectAndChordalGraphs §§1.1, 1.4: chordal graphs and perfect elimination orderings, copied
  verbatim, and the theorem of Fulkerson and Gross.
- IterativeMethodsForLinearSystems (Conventions): the complex spectral radius of a real matrix,
  adopted here as the family convention without a competing definition.
- EigenvalueAndSingularValueInequalities (Conventions): the enumeration of the eigenvalues of an
  operator, of which `IsEigenvalueEnumeration` is the matrix form.

Left to other roadmaps:
- the perturbation theory of linear systems and the distance to singularity, backward errors,
  and the inclusion of eigenvalues (ConditioningAndPerturbation, Layers 1–3);
- the Moore–Penrose inverse and minimum norm solutions (Tau Ceti and GaussianLinearModels §1.1);
- positive definite completions of chordal patterns
  ([EigenvalueAndSingularValueInequalities](../EigenvalueAndSingularValueInequalities/README.md)
  Layer 7);
- regular splittings, M-matrices as such and irreducible diagonal dominance
  (RegularSplittingsAndMMatrices, Layers 2–3);
- rounding errors of every algorithm here.

## Exact supplier contracts

### From Mathlib

- Matrices `Matrix (Fin m) (Fin n) 𝕜`, `Matrix.toEuclideanLin`, `Matrix.det_fromBlocks₁₁`,
  `Matrix.PosDef.fromBlocks₁₁`, `Matrix.IsLowerTriangular`, `Matrix.IsUpperTriangular`.
- `LDL.lower`, `LDL.diag`, `LDL.lower_conj_diag` (`L D Lᴴ = A` for positive definite `A`).
- The scoped norms `Matrix.Norms.L2Operator`, `Matrix.Norms.Operator`, `Matrix.Norms.Frobenius`,
  with `Matrix.l2_opNorm_def` and `Matrix.linfty_opNNNorm_def`.
- `spectralRadius` and `spectralRadius_le_nnnorm`; `Matrix.det_eq_prod_roots_charpoly`,
  `Matrix.trace_eq_sum_roots_charpoly`, `Fin.univ_val_map`.
- `LinearMap.singularValues`, decreasing (`LinearMap.singularValues_antitone`);
  `Matrix.IsHermitian.eigenvalues₀`.
- `Submodule.starProjection`, `LinearMap.adjoint`,
  `ContinuousLinearMap.forall_norm_sub_apply_le_iff_adjoint_apply_sub_eq_zero`.
- `SimpleGraph.fromRel`, `SimpleGraph.Walk`, `SimpleGraph.map`, `Relation.TransGen`,
  `Relation.ReflTransGen`.

### From Tau Ceti

- `TauCeti.conditionNumber` (`0` at non-units) and `TauCeti.one_le_conditionNumber`.
- `TauCeti.PosDefMatrix`, `TauCeti.cholesky`, `TauCeti.cholesky_mul_transpose` and
  `TauCeti.eq_cholesky_of_mul_transpose_self_eq` (uniqueness with positive diagonal).
- `LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero`.

### From [GaussianLinearModels](../GaussianLinearModels/README.md)

- §1.1: the least-squares predicate for a real design, copied as `IsLeastSquares`, with the
  normal equations, the projection characterization, existence, uniqueness for injective
  designs and the common fitted value, for every rank.

### From [PerfectAndChordalGraphs](../PerfectAndChordalGraphs/README.md)

- §1.1: `IsChordal` and `IsPerfectEliminationOrder`, copied verbatim.
- §1.4: a finite graph is chordal exactly when it has a perfect elimination ordering.

### From [IterativeMethodsForLinearSystems](../IterativeMethodsForLinearSystems/README.md)

- Conventions: the spectral radius of a real matrix is that of its complexification, in `ℝ≥0∞`.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Fill-reducing orderings**: minimum degree [SB, (4.12.4), p. 277], nested dissection and its
  optimality for grid graphs, the NP-hardness of minimum fill.
- **Symbolic factorization**: column counts, supernodes, the multifrontal method and the
  assembly tree, nonsymmetric patterns with partial pivoting and the column elimination tree.
- **Other pivoting strategies**: complete pivoting and Wilkinson's subexponential growth bound,
  rook pivoting, threshold pivoting.
- **Givens rotations, Gram–Schmidt and block Householder representations** (`W Yᵀ`, compact
  `W Y`), and QR with column pivoting for rank-deficient problems.
- **Band, tridiagonal and block LU**, and symmetric indefinite factorizations (Bunch–Kaufman).

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 8efdbf7, module `NASC/DirectMethods.lean`, proves the following without `sorry`,
with a pair form of the LU predicate and without the conventions of Layer 1:
- §2.1: the leading minors of an LU factorization (NASC.IsLU.det_leading).
- §4.2: the bound `2^k` on the entries before stage `k`, for the stages `k ≤ n − 1`, which is the
  first conjunct of the exponential bound without the final matrix and the growth factor
  (NASC.IsPartialPivotElimination.norm_entry_le_two_pow).
- §6.1: the normal equations over `ℝ` or `ℂ` (NASC.minimizesLeastSquares_iff_normalEquation).
- §6.2: the QR solution (NASC.minimizesLeastSquares_iff_of_thinQR).

The same module states the existence and uniqueness of LU, the pivoted factorization, full and
thin QR, and the fill-path theorem with `sorry`. Its modules are a cited source, not the
specification.

## References

- [B] Å. Björck, *Numerical Methods for Least Squares Problems*, 2nd ed., SIAM, 2024,
  §§1.1–1.2, 2.2.
- [DRS] T. A. Davis, S. Rajamanickam, W. M. Sid-Lakhdar, A survey of direct methods for sparse
  linear systems, *Acta Numerica* 25 (2016), 383–566, §4.
- [GVL] G. H. Golub, C. F. Van Loan, *Matrix Computations*, 3rd ed., Johns Hopkins University
  Press, 1996, §§3.2, 3.4, 4.2, 5.1–5.2.
- [H] N. J. Higham, *Accuracy and Stability of Numerical Algorithms*, SIAM, 1996, Chapter 9.
- [HJ] R. A. Horn, C. R. Johnson, *Matrix Analysis*, Cambridge University Press, 1985, §5.6.
- [SB] J. Stoer, R. Bulirsch, *Introduction to Numerical Analysis*, 3rd ed., Springer, 2002,
  §§4.1, 4.3, 4.7, 4.8, 4.12.
- [TB] L. N. Trefethen, D. Bau, *Numerical Linear Algebra*, SIAM, 1997, Lectures 5, 7, 10–12,
  20–22, 24.

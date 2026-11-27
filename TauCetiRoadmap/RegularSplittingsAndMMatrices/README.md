# Roadmap: regular splittings, M-matrices and the convergence of splittings

**Summary.** This roadmap develops the comparison theory of stationary iterations
`x_(k+1) = M⁻¹ N x_k + M⁻¹ b` for a splitting `A = M − N` of a square matrix: the part of the
theory that rests on nonnegative matrices, on diagonal dominance with irreducibility, and on
splittings of Hermitian matrices. Matrices are finite and square, of any size including zero. The
spectral radius of a real matrix is taken over the complex numbers, and nonnegativity of a real
matrix means that every entry is nonnegative.

- *Regular splittings.* If `M` is invertible, `M⁻¹ ≥ 0` and `N ≥ 0`, then `ρ(M⁻¹ N) < 1` if and
  only if `A` is invertible with `A⁻¹ ≥ 0`, and then `ρ(M⁻¹ N) = τ/(1 + τ)` with `τ = ρ(A⁻¹ N)`.
  For a matrix with nonpositive off-diagonal entries and nonnegative inverse (a nonsingular
  M-matrix) the Jacobi matrix and the SOR matrices with `0 < ω ≤ 1` have spectral radius below one.
- *Stein and Rosenberg.* If `A` is real with positive diagonal and nonpositive off-diagonal
  entries, the spectral radii `ρ_J` of the Jacobi matrix and `ρ_G` of the Gauss–Seidel matrix
  satisfy exactly one of `ρ_J = ρ_G = 0`, `0 < ρ_G < ρ_J < 1`, `ρ_J = ρ_G = 1`,
  `1 < ρ_J < ρ_G`.
- *Irreducible diagonal dominance.* A complex matrix whose matrix of moduli is irreducible, whose
  rows are weakly diagonally dominant and one of whose rows is strictly dominant is invertible
  (Taussky); for such a matrix, for its transpose, and for a matrix strictly dominant by columns,
  the Jacobi and the Gauss–Seidel matrices have spectral radius below one.
- *Hermitian splittings.* If `A = M − N` with `M` invertible and `Mᴴ + N` positive definite, then
  `ρ(M⁻¹ N) < 1` if and only if `A` is positive definite (Householder and John, with the converse).
  For positive definite `A`, the Jacobi matrix has spectral radius below one exactly when `2D − A`
  is positive definite.

The roadmap builds on IterativeMethodsForLinearSystems (the Jacobi and SOR matrices, the
criterion `G^k → 0` if and only if `ρ(G) < 1`, strict dominance by rows, Kahan, Ostrowski–Reich),
on Tau Ceti's Perron–Frobenius theorems and on Mathlib's Gershgorin theorem and irreducible
matrices. Layer 1 compares spectral radii of nonnegative matrices; Layer 2 treats
regular splittings, M-matrices and Stein–Rosenberg on top of it; Layers 3 (irreducible diagonal
dominance) and 4 (Hermitian splittings) use no other layer.

## Conventions

- **Matrices.** `ι` is a finite index type, possibly empty, and `n` is its number of elements.
  Matrices are Mathlib's `Matrix ι ι 𝕜`; vectors are `ι → 𝕜`. `X ≥ 0` for a real matrix means
  `X i j ≥ 0` for all `i, j`, written entrywise in Lean; the Loewner order is not used.
- **Inverses.** `X⁻¹` is Mathlib's inverse, equal to `0` when `X` is singular. Every statement
  that uses an inverse assumes what makes the matrix invertible, or is true at the junk value.
- **Spectral radius.** `ρ(X)` is Mathlib's `spectralRadius ℂ X` in `[0, ∞]`, the largest modulus
  of an eigenvalue, and `0` for `n = 0`; for a real `X` it is `spectralRadius ℂ (X.map (↑))`, as in
  the Perron–Frobenius files of Tau Ceti.
- **Irreducible.** Mathlib's `Matrix.IsIrreducible`: nonnegative real entries, and for all
  `i, j` a path of positive length from `i` to `j` along positive entries. The empty matrix is
  irreducible; a `1 × 1` matrix is irreducible iff its entry is positive; for `n ≥ 2` this is the
  usual notion. A complex matrix is used through its matrix of moduli `‖A i j‖`.
- **Splittings.** For an order on `ι`, `A = D + L + U` with `D` the diagonal part, `L` the
  strictly lower and `U` the strictly upper part. The definitions `jacobiMatrix A = I − D⁻¹ A`,
  `strictLowerPart`, `strictUpperPart` and
  `sorMatrix A ω = (D + ω L)⁻¹ ((1 − ω) D − ω U)` are copied verbatim from
  IterativeMethodsForLinearSystems §2.1; `sorMatrix A 1` is the Gauss–Seidel matrix. If a diagonal
  entry of `A` is zero, `D⁻¹ = 0` and `jacobiMatrix A = I`.

## Layer 1: nonnegative matrices and the spectral radius

### 1.1 Comparison of spectral radii

Prove `spectralRadius_le_spectralRadius_of_norm_le`: if `A` is complex, `B` is real and
`‖A i j‖ ≤ B i j` for all `i, j`, then `ρ(A) ≤ ρ(B)`.

Route: `B ≥ 0` follows from the hypothesis. By `spectralRadius_eq_of_unital`, `ρ(A)` is the
supremum of `‖μ‖` over the spectrum, so it suffices to bound one eigenvalue. If `μ` is in the
spectrum, `Matrix.mem_spectrum_iff_exists_mulVec_eq_smul` gives `z ≠ 0` with `A z = μ z`. The
vector `u = (‖z i‖)_i` is nonnegative and nonzero, and the triangle inequality in row `i` gives
`‖μ‖ u i = ‖∑_j A i j z j‖ ≤ ∑_j B i j u j`, that is `‖μ‖ u ≤ B u` entrywise. The
Collatz–Wielandt bound `Matrix.ofReal_le_spectralRadius_of_smul_le_mulVec` turns this into
`‖μ‖ ≤ ρ(B)`. For `n = 0` both
sides are `0`.

**Checks.**
- `A = [[1, 1], [−1, 1]]` has eigenvalues `1 ± i` and `ρ(A) = √2`; the matrix of moduli is the
  all-ones matrix, with `ρ = 2`.

*Needs:* Tau Ceti `Matrix.ofReal_le_spectralRadius_of_smul_le_mulVec`,
`Matrix.mem_spectrum_iff_exists_mulVec_eq_smul`; Mathlib `spectralRadius_eq_of_unital`. (Saad,
Theorem 1.28, p. 29, for real `0 ≤ A ≤ B`; the statement for complex `A` dominated by `B` is
proved here.)

### 1.2 Strict comparison for irreducible matrices

Prove `spectralRadius_lt_spectralRadius_of_le_of_ne`: if `B` is irreducible, `0 ≤ A ≤ B` and
`A ≠ B`, then `ρ(A) < ρ(B)`.

Route: `A ≠ B` forces `n ≥ 1`. `Bᵀ` is irreducible (`Matrix.IsIrreducible.transpose`), so
`Matrix.IsIrreducible.exists_mulVec_eq_smul` gives `r > 0` and `y` with all `y i > 0` and
`Bᵀ y = r y`; by `Matrix.spectralRadius_eq_of_mulVec_eq_smul` and `Matrix.spectralRadius_transpose`
(the map to `ℂ` commutes with transposition), `ρ(B) = r`. By
`Matrix.exists_mulVec_eq_smul_of_nonneg`, `ρ(A) = s` for some `s ≥ 0` with an eigenvector
`x ≥ 0`, `x ≠ 0`, `A x = s x`. Then `s (y · x) = y · A x ≤ y · B x = r (y · x)` and `y · x > 0`,
so `s ≤ r`. If `s = r`, then `y · (B − A) x = 0` with `y > 0` and `(B − A) x ≥ 0`, so
`B x = A x = r x`; by `Matrix.IsIrreducible.pos_of_mulVec_eq_smul` every `x i > 0`, and
`(B − A) x = 0` with `B − A ≥ 0` gives `B = A`, a contradiction. So `s < r`.

**Checks.**
- Irreducibility is needed: `B = I` (size two) is reducible, `A = diag(1, 0)` satisfies
  `0 ≤ A ≤ B`, `A ≠ B`, and `ρ(A) = ρ(B) = 1`.
- Nonnegativity of `A` is needed: `B = [[0, 1], [1, 0]]` is irreducible, `A = −B ≤ B`, `A ≠ B`,
  and `ρ(A) = ρ(B) = 1`.

*Needs:* Tau Ceti `Matrix.IsIrreducible.exists_mulVec_eq_smul`,
`Matrix.IsIrreducible.pos_of_mulVec_eq_smul`, `Matrix.spectralRadius_eq_of_mulVec_eq_smul`,
`Matrix.exists_mulVec_eq_smul_of_nonneg`; Mathlib `Matrix.IsIrreducible.transpose`,
`Matrix.spectralRadius_transpose`. (Proved here.)

### 1.3 The Neumann series criterion

Prove `spectralRadius_map_lt_one_iff`: for `B ≥ 0`, `ρ(B) < 1` if and only if `I − B` is
invertible and `(I − B)⁻¹ ≥ 0`. (Saad, Theorem 1.29, pp. 29–30.)

Route: if `ρ(B) < 1`, then `B^k → 0` (IterativeMethodsForLinearSystems §1.2,
`tendsto_pow_atTop_nhds_zero_iff_spectralRadius_map_lt_one`). From
`(I − B) S_K = I − B^K` with `S_K = ∑_(k<K) B^k`, the matrix `I − B^K` is invertible for large
`K`, so `det (I − B) ≠ 0`, and `S_K = (I − B)⁻¹ (I − B^K) → (I − B)⁻¹`; each `S_K ≥ 0`, and the set
of nonnegative matrices is closed, so `(I − B)⁻¹ ≥ 0`. Conversely, for `n ≥ 1`
`Matrix.exists_mulVec_eq_smul_of_nonneg` gives `ρ(B) = r ≥ 0` with `B u = r u`, `u ≥ 0`, `u ≠ 0`.
Then `(I − B) u = (1 − r) u`; invertibility excludes `r = 1`, and `u = (1 − r) (I − B)⁻¹ u` with
`(I − B)⁻¹ u ≥ 0` and some `u i > 0` gives `1 − r > 0`. For `n = 0` both sides hold.

**Checks.**
- `B = [[0, 1/2], [1/2, 0]]`: `ρ(B) = 1/2` and `(I − B)⁻¹ = [[4/3, 2/3], [2/3, 4/3]]`.
- Nonnegativity of `B` is needed: for `B = [[−2]]`, `(I − B)⁻¹ = [[1/3]] ≥ 0` while `ρ(B) = 2`.

*Needs:* IterativeMethodsForLinearSystems §1.2; Tau Ceti `Matrix.exists_mulVec_eq_smul_of_nonneg`;
Mathlib `Matrix.isUnit_iff_isUnit_det`, `Matrix.det_mul`. (Saad, Theorem 1.29, pp. 29–30.)

### Examples

- The all-ones matrix of size `n ≥ 1` has `ρ = n`; replacing one entry by `0` lowers it (1.2).

### Dependencies

1.1 uses Tau Ceti and Mathlib; 1.2 Tau Ceti; 1.3 IterativeMethodsForLinearSystems §1.2 and Tau Ceti.

## Layer 2: regular splittings

A splitting `A = M − N` is *regular* if `M` is invertible, `M⁻¹ ≥ 0` and `N ≥ 0` (Saad,
Definition 4.3, p. 118). The iteration matrix is `G = M⁻¹ N`; it is nonnegative.

### 2.1 Convergence of regular splittings

Prove `spectralRadius_inv_mul_lt_one_iff`: for a regular splitting, `ρ(M⁻¹ N) < 1` if and only
if `A` is invertible and `A⁻¹ ≥ 0`. (Saad, Theorem 4.4, p. 118.)

Route: `A = M (I − G)`. If `ρ(G) < 1`, 1.3 makes `I − G` invertible with `(I − G)⁻¹ ≥ 0`, so `A`
is invertible and `A⁻¹ = (I − G)⁻¹ M⁻¹ ≥ 0`. Conversely, `I − G = M⁻¹ A` is invertible and
`A⁻¹ N = (I − G)⁻¹ G`. For `n ≥ 1`, `Matrix.exists_mulVec_eq_smul_of_nonneg` gives `ρ(G) = g ≥ 0`
with `G x = g x`, `x ≥ 0`, `x ≠ 0`; then `g ≠ 1` and `A⁻¹ N x = (g/(1 − g)) x`. The left side is
nonnegative and some `x i > 0`, so `g/(1 − g) ≥ 0`, which with `g ≥ 0`, `g ≠ 1` forces `g < 1`.

**Checks.**
- Each hypothesis is needed (size one): `M = [[0]]`, `N = [[1]]` gives `M⁻¹ N = 0` and
  `A⁻¹ = [[−1]]`; `M = [[−1]]`, `N = 0` gives `ρ = 0` and `A⁻¹ = [[−1]]`; `M = [[1]]`,
  `N = [[−2]]` gives `A⁻¹ = [[1/3]]` and `ρ(M⁻¹ N) = 2`.

*Needs:* 1.3; Tau Ceti `Matrix.exists_mulVec_eq_smul_of_nonneg`. (Saad, Theorem 4.4, p. 118.)

### 2.2 The rate of a regular splitting

Prove `spectralRadius_inv_mul_eq`: for a regular splitting of an invertible `A` with `A⁻¹ ≥ 0`,
`ρ(M⁻¹ N) = τ/(1 + τ)` where `τ = ρ(A⁻¹ N)`. In particular `ρ(M⁻¹ N) < 1`, and of two regular
splittings `A = M₁ − N₁ = M₂ − N₂` with `N₁ ≤ N₂`, the spectral radius of the first is at most
that of the second, since `0 ≤ A⁻¹ N₁ ≤ A⁻¹ N₂`, 1.1 applies and `t ↦ t/(1 + t)` is increasing.
(Proved here.)

Route: by 2.1, `g = ρ(G) < 1`, so every eigenvalue `λ` of `G` has `|λ| ≤ g < 1`. As in 2.1,
`T = A⁻¹ N = (I − G)⁻¹ G` and `T x = (g/(1 − g)) x` for a nonnegative eigenvector `x` of `G`, so
`τ ≥ g/(1 − g)`. Conversely, `I + T = (I − G)⁻¹` is invertible, `G = T (I + T)⁻¹`, and if
`T z = μ z` with `z ≠ 0` then `1 + μ ≠ 0` and `G z = (μ/(1 + μ)) z`, so `λ = μ/(1 + μ)` is an
eigenvalue of `G` and `μ = λ/(1 − λ)`. Hence `|μ| ≤ |λ|/(1 − |λ|) ≤ g/(1 − g)`, as `t ↦ t/(1 − t)`
is increasing on `[0, 1)`. So `τ = g/(1 − g)` and `g = τ/(1 + τ)`. The spectrum of a matrix is
finite (`Matrix.finite_spectrum`), so both spectral radii are attained, and the identity holds in
`[0, ∞]`, where `τ` is finite.

**Checks.**
- `A = [[2, −1], [−1, 2]]`, `A⁻¹ = [[2/3, 1/3], [1/3, 2/3]]`. The Jacobi splitting `M = 2I`,
  `N = [[0, 1], [1, 0]]` has `ρ(M⁻¹ N) = 1/2`, `ρ(A⁻¹ N) = 1`, and `1/(1 + 1) = 1/2`. The
  Gauss–Seidel splitting `M = [[2, 0], [−1, 2]]`, `N = [[0, 1], [0, 0]]` has
  `M⁻¹ N = [[0, 1/2], [0, 1/4]]`, `ρ = 1/4`, `ρ(A⁻¹ N) = 1/3`, and `(1/3)/(4/3) = 1/4`.
- `M` invertible is needed: `A = [[1, −1], [−1, 2]]` has `A⁻¹ = [[2, 1], [1, 1]]`, and
  `N = [[0, 3], [2, 0]]` gives the singular `M = [[1, 2], [1, 2]]`, so `M⁻¹ N = 0`, while
  `A⁻¹ N = [[2, 6], [2, 3]]` has spectral radius `6` and `6/7 ≠ 0`.

*Needs:* 2.1; Tau Ceti `Matrix.exists_mulVec_eq_smul_of_nonneg`,
`Matrix.mem_spectrum_iff_exists_mulVec_eq_smul`; Mathlib `Matrix.finite_spectrum`,
`spectralRadius_eq_of_unital`. (Proved here.)

### 2.3 Nonsingular M-matrices

Prove `spectralRadius_jacobiMatrix_lt_one_and_sorMatrix_lt_one`: if `A` is real with
`A i j ≤ 0` for `i ≠ j`, invertible, with `A⁻¹ ≥ 0`, then `ρ(jacobiMatrix A) < 1` and
`ρ(sorMatrix A ω) < 1` for `0 < ω ≤ 1`. The diagonal of such an `A` is positive and its Jacobi
part is Saad, Theorem 1.32, p. 31; the SOR part is proved here.

Route: with `C = A⁻¹`, `a_ii c_ii = 1 − ∑_(k ≠ i) a_ik c_ki ≥ 1`, so `a_ii > 0` (Saad's argument).
The Jacobi splitting `M = D`, `N = D − A` is regular, as `D⁻¹` is diagonal and positive and `N`
has zero diagonal and entries `−a_ij ≥ 0`; `M⁻¹ N = jacobiMatrix A`, and 2.1 applies. For
`0 < ω ≤ 1` put `M_ω = (D + ω L)/ω` and `N_ω = ((1 − ω) D − ω U)/ω`. Then `A = M_ω − N_ω` and
`M_ω⁻¹ N_ω = sorMatrix A ω`. `M_ω = (D/ω)(I − K)` with `K = −ω D⁻¹ L ≥ 0` strictly lower triangular,
so `K^n = 0` and `M_ω⁻¹ = (∑_(k<n) K^k)(ω D⁻¹) ≥ 0`; `N_ω` has diagonal `((1 − ω)/ω) a_ii ≥ 0`,
entries `−a_ij ≥ 0` above the diagonal and `0` below it. The splitting is regular and 2.1 applies.

**Checks.**
- The sign condition is needed: `A = (1/2) [[1, −1, 1], [1, 1, −1], [−1, 1, 1]]` is the inverse of
  `[[1, 1, 0], [0, 1, 1], [1, 0, 1]] ≥ 0`; its Jacobi matrix `[[0, 1, −1], [−1, 0, 1], [1, −1, 0]]`
  has spectral radius `√3`, and its Gauss–Seidel matrix `[[0, 1, −1], [0, −1, 2], [0, 2, −3]]` has
  spectral radius `2 + √5`.
- The range of `ω` cannot be dropped: for `A = [[1]]`, `sorMatrix A 2 = [[−1]]` and
  `sorMatrix A 0 = [[1]]`, both of spectral radius `1`.

*Needs:* 2.1; Mathlib `Matrix.det_of_isLowerTriangular`, `Matrix.inv_eq_left_inv`. (Saad,
Theorem 1.32, p. 31, for the diagonal and the Jacobi matrix; the SOR part is proved here.)

### 2.4 The Stein–Rosenberg theorem

Prove `stein_rosenberg`: if `A` is real with `a_ii > 0` and `a_ij ≤ 0` for `i ≠ j`, then
`ρ_J = ρ(jacobiMatrix A)` and `ρ_G = ρ(sorMatrix A 1)` satisfy one of the disjoint cases
`ρ_J = ρ_G = 0`; `0 < ρ_G < ρ_J < 1`; `ρ_J = ρ_G = 1`; `1 < ρ_J < ρ_G`. No irreducibility is
assumed. (Proved here; the theorem is due to Stein and Rosenberg.)

Route. `B = jacobiMatrix A = L' + U'` with `L' = −D⁻¹ L ≥ 0`, `U' = −D⁻¹ U ≥ 0`, and
`H = sorMatrix A 1 = (I − L')⁻¹ U' ≥ 0`; `r = ρ(B)`, `h = ρ(H)`; `ρ(c X) = c ρ(X)` for `c ≥ 0`.

1. *Key equivalence.* For `σ > 0`, `h < σ` if and only if `ρ(L' + U'/σ) < 1`. Indeed
   `I − (L' + U'/σ) = (I − L') − U'/σ` is a regular splitting (`(I − L')⁻¹ = ∑_(k<n) L'^k ≥ 0`)
   with iteration matrix `H/σ`; apply 2.1 and then 1.3.
2. *Eigenvectors of `H`.* If `H x = μ x` with `μ > 0`, then `(L' + U'/μ) x = x`.
3. *Positivity.* If `n ≥ 1` and `B` is irreducible, then `h > 0`. Take a path of positive length
   from an index `i` to itself along positive entries of `B`, of length `m`, with weight
   `w > 0`; `B` has zero diagonal, so the path has `k ≥ 1` upward steps (entries of `U'`) and at
   least one downward step. Then `((L' + U'/σ)^m) i i ≥ w σ^(−k)`, so
   `ρ((L' + U'/σ)^m) ≥ w σ^(−k)` (`Matrix.ofReal_le_spectralRadius_of_smul_le_mulVec` at `e_i`)
   and `ρ(X^m) = ρ(X)^m` (`spectrum.map_pow`). So `ρ(L' + U'/σ) ≥ 1` for small `σ > 0`, and
   step 1 gives `h ≥ σ > 0`.
4. *Irreducible case,* `B` irreducible with `n ≥ 2`. Then `r > 0`
   (`Matrix.IsIrreducible.exists_mulVec_eq_smul`), `L' ≠ 0`, `U' ≠ 0`, and for every `σ > 0` the
   matrix `L' + U'/σ` is irreducible.
   - If `r < 1`: `L' + U'/r ≤ B/r` with `L' + U'/r ≠ B/r`, so `ρ(L' + U'/r) < 1` by 1.2, and
     `h < r` by step 1; with step 3, `0 < h < r < 1`.
   - If `r = 1`: step 1 at `σ = 1` gives `h ≥ 1`. If `h > 1`, take a nonnegative eigenvector of
     `H` for `h` (`Matrix.exists_mulVec_eq_smul_of_nonneg`); by step 2 it is a nonnegative
     eigenvector of the irreducible `L' + U'/h` for `1`, hence positive
     (`Matrix.IsIrreducible.pos_of_mulVec_eq_smul`), so `ρ(L' + U'/h) = 1`
     (`Matrix.spectralRadius_eq_of_mulVec_eq_smul`); but `L' + U'/h ≤ B`, `≠ B`, so 1.2 gives
     `ρ(L' + U'/h) < 1`. Hence `h = 1`.
   - If `r > 1`: for `1 ≤ σ < r`, `L' + U'/σ ≥ B/σ`, so `ρ(L' + U'/σ) ≥ r/σ > 1` by 1.1 and
     `h ≥ σ` by step 1; thus `h ≥ r`. If `h = r`, step 2 and the argument of the previous case give
     `ρ(L' + U'/r) = 1`, while `L' + U'/r ≥ B/r`, `≠ B/r`, gives `ρ(L' + U'/r) > 1` by 1.2.
     Hence `h > r`.
5. *Reduction to classes.* Let the classes of `B` be the classes of mutual reachability along
   positive entries. A class is a single index (with `B i i = 0`) or has at least two indices,
   and then the principal submatrix `B_K` is irreducible. For `λ ≠ 0` the matrix `λ L' + U'` has
   the off-diagonal zero pattern of `B`, so after a simultaneous permutation listing the classes
   in an order compatible with reachability, `λ I − λ L' − U'` is block triangular with diagonal
   blocks `λ I − λ L'_K − U'_K`, where `L'_K`, `U'_K` are the strictly lower and upper parts of
   `B_K` in the order inherited from `ι`. As `det (I − L') = 1`, `λ ≠ 0` is an eigenvalue of `H`
   if and only if `det (λ I − λ L' − U') = 0`, if and only if it is an eigenvalue of the
   Gauss–Seidel matrix `H_K` of some class; likewise for `B` and the `B_K`. So `h = max_K h_K`
   and `r = max_K r_K`, with singletons contributing `0` to both.
6. *Conclusion.* Steps 1–4 hold for every nonnegative matrix with zero diagonal written as the
   sum of its strictly lower and strictly upper parts, so step 4 applies to each `B_K` with at
   least two indices: `0 < h_K < r_K < 1`, `h_K = r_K = 1` or `1 < r_K < h_K`. If every class
   is a singleton, `r = h = 0`. If `0 < r < 1`, every `h_K < r_K ≤ r` or `h_K = 0`, and some
   `h_K > 0`, so `0 < h < r < 1`. If `r = 1`, the classes with `r_K = 1` have `h_K = 1` and the
   others `h_K < 1`, so `h = 1`. If `r > 1`, a class with `r_K = r` has `h_K > r`, so `h ≥ h_K > r`.

**Checks.**
- `A = [[1, −1/2], [−1/2, 1]]`: `ρ_J = 1/2`, `ρ_G = 1/4`. `A = [[1, −1], [−1, 1]]`:
  `ρ_J = ρ_G = 1`. `A = [[1, −2], [−2, 1]]`: `ρ_J = 2`, `ρ_G = 4`. `A = [[1, −1], [0, 1]]`:
  `ρ_J = ρ_G = 0`.
- A reducible case: `A = [[1, −1/2, −1, 0], [−1/2, 1, 0, −1], [0, 0, 1, −2], [0, 0, −2, 1]]`
  has Jacobi matrix with classes `{1, 2}` (spectral radius `1/2`) and `{3, 4}` (spectral radius
  `2`); `ρ_J = 2` and `ρ_G = 4`, the fourth case.
- The positive diagonal is needed: for `A = [[0, −1], [−1, 0]]`, `D⁻¹ = 0` gives
  `jacobiMatrix A = I` with `ρ_J = 1`, and `D + L` is singular, so `sorMatrix A 1 = 0`.
- The sign condition is needed: `A = [[1, 2, −2], [1, 1, 1], [2, 2, 1]]` has
  `(jacobiMatrix A)³ = 0`, so `ρ_J = 0`, while `sorMatrix A 1` has eigenvalues `0, 2, 2`.

*Needs:* 1.1, 1.2, 1.3, 2.1; Tau Ceti `Matrix.IsIrreducible.exists_mulVec_eq_smul`,
`Matrix.IsIrreducible.pos_of_mulVec_eq_smul`, `Matrix.spectralRadius_eq_of_mulVec_eq_smul`,
`Matrix.exists_mulVec_eq_smul_of_nonneg`, `Matrix.ofReal_le_spectralRadius_of_smul_le_mulVec`;
Mathlib `Matrix.pow_apply_pos_iff_nonempty_path`, `spectrum.map_pow`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.BlockTriangular.det`,
`Matrix.det_of_isLowerTriangular`. (Proved here; the theorem is due to Stein and Rosenberg.)

### Examples

- `[[2, −1, 0], [−1, 2, −1], [0, −1, 2]]` is a nonsingular M-matrix (2.3), in the second case of
  2.4 with `ρ_J = √2/2`, `ρ_G = 1/2`.

### Dependencies

2.1 uses 1.3; 2.2 uses 2.1 (and 1.1); 2.3 uses 2.1; 2.4 uses 1.1, 1.2, 1.3, 2.1; 2.1, 2.2 and 2.4
use Tau Ceti.

## Layer 3: irreducible diagonal dominance

### 3.1 Taussky's theorem

Define `IsIrreduciblyDiagDominant A`, for a matrix over a normed field: the real matrix
`‖A i j‖` is irreducible, `∑_(j ≠ i) ‖A i j‖ ≤ ‖A i i‖` for every `i`, and the inequality is
strict for some `i` (Auzinger and Melenk, Definition 5.4, p. 35, by rows; Saad, Definition 4.5,
p. 119, by columns). Prove `det_ne_zero_of_isIrreduciblyDiagDominant`: such a matrix has nonzero
determinant. (Auzinger and Melenk, Theorem 5.4, p. 36, by rows; Saad, Corollary 4.8, p. 121, by
columns, which is the statement for the transpose.)

Route: suppose `A x = 0` with `x ≠ 0`, scaled so that `max_i ‖x i‖ = 1`. Let `S` be the set of
indices with `‖x i‖ = 1`. If `S` is everything, row `i` of `A x = 0` gives
`‖A i i‖ ≤ ∑_(j ≠ i) ‖A i j‖` for every `i`, against the strict row. Otherwise a path along
nonzero entries from a point of `S` to a point outside `S` leaves `S` along an entry `A i k ≠ 0`
with `i ∈ S`, `‖x k‖ < 1`; then `‖A i i‖ ≤ ∑_(j ≠ i) ‖A i j‖ ‖x j‖ < ∑_(j ≠ i) ‖A i j‖`, against
weak dominance of row `i`. So `A` is injective and `det A ≠ 0`.

**Checks.**
- `[[2, −1, 0], [−1, 2, −1], [0, −1, 2]]` satisfies the definition, with determinant `4`.
- Irreducibility is needed: `[[1, 1, 0], [1, 1, 0], [0, 0, 2]]` is weakly dominant, strict in row
  three, reducible and singular. The strict row is needed: `[[1, 1], [1, 1]]`. Weak dominance of
  every row is needed: `[[2, 1], [4, 2]]` is irreducible, strict in row one and singular.
- For `n = 1` the definition says `A 0 0 ≠ 0`; for `n = 0` it fails (no strict row).

*Needs:* Mathlib `Matrix.IsIrreducible`, `Matrix.exists_mulVec_eq_zero_iff`. (Saad, Corollary
4.8, p. 121; Auzinger and Melenk, Theorem 5.4, p. 36.)

### 3.2 Jacobi and Gauss–Seidel under diagonal dominance

Prove `spectralRadius_jacobiMatrix_lt_one_and_sorMatrix_one_lt_one`: if a complex `A` or its
transpose is irreducibly diagonally dominant, or `A` is strictly diagonally dominant by columns
(`∑_(j ≠ i) ‖A j i‖ < ‖A i i‖` for every `i`), then `ρ(jacobiMatrix A) < 1` and
`ρ(sorMatrix A 1) < 1`. (Saad, Theorem 4.9, p. 121, stated with column sums; Auzinger and
Melenk, Theorem 5.5, p. 37, with row sums.) Strict dominance by rows is
IterativeMethodsForLinearSystems §2.2 and is not restated.

Route: the diagonal entries are nonzero: under strict dominance directly, and under weak
dominance a zero diagonal entry makes its row (or column) zero, which irreducibility forbids
(`Matrix.IsIrreducible.exists_pos` for `n ≥ 2`, the strict row for `n = 1`). So `D` and `D + L`
are invertible. Let `|λ| ≥ 1`. Then `λ I − jacobiMatrix A = D⁻¹ (λ D + L + U)` and
`λ I − sorMatrix A 1 = (D + L)⁻¹ (λ (D + L) + U)`. Both right-hand factors have the zero pattern of
`A` and inherit its dominance (rows or columns, weak or strict, with the same strict lines), as
`|λ| ‖a_ii‖` dominates `|λ|` times the off-diagonal entries scaled by `λ` plus the others. By 3.1
(for the matrix or its transpose, `Matrix.det_transpose`) or `det_ne_zero_of_sum_col_lt_diag` they
are invertible, so `λ` is not an eigenvalue; the spectrum is finite.

**Checks.**
- `[[2, −1, 0], [−1, 2, −1], [0, −1, 2]]`: `ρ_J = √2/2`, `ρ_G = 1/2`.
- `A = [[2, 3], [1, 4]]` is strictly dominant by columns, not by rows: its Jacobi matrix
  `[[0, −3/2], [−1/4, 0]]` has `ρ = √6/4`, and `sorMatrix A 1 = [[0, −3/2], [0, 3/8]]`.
- Weak dominance without a strict row is not enough: `A = [[1, 1], [1, 1]]` has Jacobi eigenvalues
  `±1` and `sorMatrix A 1 = [[0, −1], [0, 1]]`.

*Needs:* 3.1; Mathlib `det_ne_zero_of_sum_col_lt_diag`, `Matrix.det_transpose`,
`Matrix.IsIrreducible.exists_pos`, `Matrix.mem_spectrum_iff_isRoot_charpoly`,
`Matrix.finite_spectrum`. (Saad, Theorem 4.9, p. 121; Auzinger and Melenk, Theorem 5.5, p. 37.)

### Examples

- The second difference matrix of size `n ≥ 1` (`2` on the diagonal, `−1` next to it) is
  irreducibly diagonally dominant, its first and last rows being strict; 3.1 and 3.2 apply.

### Dependencies

3.2 uses 3.1. The layer uses Mathlib only.

## Layer 4: splittings of Hermitian matrices

### 4.1 The Householder–John theorem

Prove `spectralRadius_inv_mul_lt_one_iff_posDef`: if `A = M − N` with complex `M` invertible and
`Mᴴ + N` positive definite, then `ρ(M⁻¹ N) < 1` if and only if `A` is positive definite. The
direction from positive definite `A` is Fawzi's Theorem 4.12, p. 33 (real matrices); the converse
is proved here. Positive definiteness is Mathlib's `Matrix.PosDef`, which includes Hermitian.

Route: `Mᴴ + N = Mᴴ + M − A` is Hermitian, so `A` is Hermitian. Put `Q = M⁻¹ A` and
`G = M⁻¹ N = I − Q`. Expanding, `A − Gᴴ A G = Qᴴ A + A Q − Qᴴ A Q = Qᴴ (Mᴴ + N) Q`, using
`M Q = A` and `A = Aᴴ`. If `A` is positive definite, `Q` is invertible, so `P = A − Gᴴ A G` is
positive definite; for `G x = λ x`, `x ≠ 0`, `xᴴ P x = (1 − |λ|²) xᴴ A x` with both forms
positive, so `|λ| < 1`, and the spectrum is finite. Conversely, if `ρ(G) < 1` then `1` is not an
eigenvalue, so `Q = I − G` and `A = M Q` are invertible and `P` is positive definite;
`G^k → 0` (IterativeMethodsForLinearSystems §1.2) and the telescoping identity
`A − (Gᴴ)^K A G^K = ∑_(k<K) (Gᴴ)^k P G^k` give `xᴴ A x ≥ xᴴ P x > 0` for `x ≠ 0` in the limit.

**Checks.**
- Gauss–Seidel splittings: `A = [[2, 1], [1, 2]]`, `M = [[2, 0], [1, 2]]`, `Mᴴ + N = 2I`,
  `ρ(M⁻¹ N) = 1/4`; `A = [[1, 2], [2, 1]]` (eigenvalues `3, −1`), `Mᴴ + N = I`, `ρ(M⁻¹ N) = 4`.
- `M` invertible is needed: `M = 0`, `A = −I`, `N = I` give `Mᴴ + N = I`, `M⁻¹ N = 0`, and `A` is
  not positive definite.

*Needs:* IterativeMethodsForLinearSystems §1.2; Mathlib `Matrix.PosDef.conjTranspose_mul_mul_same`,
`Matrix.PosDef.isUnit`, `Matrix.finite_spectrum`; Tau Ceti
`Matrix.mem_spectrum_iff_exists_mulVec_eq_smul`. (Fawzi, Theorem 4.12, p. 33, one direction.)

### 4.2 Jacobi for positive definite matrices

Prove `spectralRadius_jacobiMatrix_lt_one_iff_posDef`: for positive definite complex `A`,
`ρ(jacobiMatrix A) < 1` if and only if `2 D − A` is positive definite. (Auzinger and Melenk,
Theorem 5.2, p. 32, real symmetric case at `ω = 1`; Fawzi, Corollary 4.13, p. 33, one direction.)

Route: the diagonal of `A` is real and positive (`Matrix.PosDef.diag_pos`). The Jacobi splitting
`M = D`, `N = D − A` has `Mᴴ + N = 2D − A`, so the direction from `2D − A` is 4.1. Conversely,
with `S = D^(−1/2) A D^(−1/2)` Hermitian positive definite, `jacobiMatrix A` is similar to
`I − S`, whose eigenvalues are `1 − s` for the eigenvalues `s > 0` of `S`. If all `|1 − s| < 1`,
then `s < 2`, so `2I − S` is positive definite and so is `2D − A = D^(1/2) (2I − S) D^(1/2)`.

**Checks.**
- `A = [[2, 1], [1, 2]]`: `2D − A = [[2, −1], [−1, 2]]` is positive definite, `ρ_J = 1/2`. Size
  three, `1` on the diagonal, `4/5` elsewhere: `A` has eigenvalues `13/5, 1/5, 1/5`, `2D − A` has
  eigenvalue `−3/5`, the Jacobi matrix has eigenvalue `−8/5`.
- `A` positive definite is needed: size three, `1` on the diagonal, `−1/2` elsewhere, `A` has
  eigenvalues `0, 3/2, 3/2`, `2D − A` has `2, 1/2, 1/2`, the Jacobi matrix has eigenvalue `1`.

*Needs:* 4.1; Mathlib `Matrix.PosDef.diag_pos`, `Matrix.IsHermitian.eigenvalues`,
`Matrix.PosDef.conjTranspose_mul_mul_same`. (Auzinger and Melenk, Theorem 5.2, p. 32.)

### Examples

- For `A = [[2, 1], [1, 2]]` the Jacobi and Gauss–Seidel splittings satisfy 4.1.

### Dependencies

4.2 uses 4.1. 4.1 uses IterativeMethodsForLinearSystems §1.2 and Mathlib.

## Scope and ownership

This roadmap owns the targets stated above: the comparisons 1.1 and 1.2, the criterion 1.3,
regular splittings with their rate, nonsingular M-matrices, the Stein–Rosenberg theorem,
irreducible diagonal dominance with Taussky's theorem and its consequences for Jacobi and
Gauss–Seidel, and the Householder–John theorem with its converse and the Jacobi criterion.

Already in the libraries and therefore not targets: Gelfand's formula (Mathlib); Gershgorin's
theorem and invertibility under strict dominance by rows or columns (Mathlib
`eigenvalue_mem_ball`, `det_ne_zero_of_sum_row_lt_diag`, `det_ne_zero_of_sum_col_lt_diag`);
irreducible matrices (Mathlib); the Perron–Frobenius theorems and the Collatz–Wielandt lower
bound (Tau Ceti).

Stated by IterativeMethodsForLinearSystems and used here, not restated: `G^k → 0` if and only if
`ρ(G) < 1` (§1.2), the iteration matrices (§2.1, copied verbatim), strict dominance by rows
(§2.2), Kahan's bound (§2.3) and the theorem of Ostrowski and Reich (§2.4). That roadmap places
regular splittings, M-matrices, irreducible dominance, the Stein–Rosenberg theorem and dominance
by columns outside its scope. LinearSystemsAndControl §5.4 owns the Stein equation for Schur
stable real matrices; for real matrices the converse half of 4.1 could be read off the
uniqueness of solutions stated there, but 4.1 is over `ℂ` and its route proves the sum it needs.

Not treated here: Young's theory of consistently ordered matrices and the optimal SOR parameter;
symmetric SOR and block iterations; strict comparison of regular splittings; weak regular and
nonnegative splittings; the Frobenius normal form as an object.

## Exact supplier contracts

### From Mathlib

- `Analysis/Normed/Algebra/Spectrum.lean`: `spectralRadius_eq_of_unital`.
  `Analysis/Normed/Algebra/GelfandFormula.lean`: `spectrum.map_pow` (complex Banach algebra,
  nontrivial).
- `Analysis/Matrix/Spectrum.lean`: `Matrix.spectralRadius_transpose`,
  `Matrix.IsHermitian.eigenvalues`. `LinearAlgebra/Matrix/Charpoly/Eigs.lean`:
  `Matrix.mem_spectrum_iff_isRoot_charpoly`. `LinearAlgebra/Eigenspace/Minpoly.lean`:
  `Matrix.finite_spectrum` (field).
- `LinearAlgebra/Matrix/Irreducible/Defs.lean`: `Matrix.IsIrreducible` (nonnegative entries,
  strongly connected by paths of positive length), `Matrix.IsIrreducible.transpose`,
  `Matrix.IsIrreducible.exists_pos` (`[Nontrivial n]`: every row has a positive entry),
  `Matrix.pow_apply_pos_iff_nonempty_path` (nonnegative entries).
- `LinearAlgebra/Matrix/Gershgorin.lean`: `det_ne_zero_of_sum_col_lt_diag` (normed field).
- `LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.isUnit_iff_isUnit_det`,
  `Matrix.inv_eq_left_inv`. `LinearAlgebra/Matrix/Determinant/Basic.lean`: `Matrix.det_mul`,
  `Matrix.det_transpose`. `LinearAlgebra/Matrix/Block.lean`: `Matrix.det_of_isLowerTriangular`
  (linear order on indices), `Matrix.BlockTriangular.det`. `LinearAlgebra/Matrix/ToLinearEquiv.lean`:
  `Matrix.exists_mulVec_eq_zero_iff` (a nonzero kernel vector iff `det = 0`).
- `LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef` (Hermitian and positive),
  `Matrix.PosDef.isUnit`, `Matrix.PosDef.diag_pos`, `Matrix.PosDef.conjTranspose_mul_mul_same`
  (congruence by an injective matrix).

### From Tau Ceti

- `LinearAlgebra/Matrix/PerronFrobenius/Positive.lean`:
  `Matrix.spectralRadius_eq_of_mulVec_eq_smul` (`[Nonempty n]`, `A ≥ 0`, an eigenvector with
  positive entries for `r`: `ρ(A) = r`).
- `LinearAlgebra/Matrix/PerronFrobenius/Nonnegative.lean`:
  `Matrix.exists_mulVec_eq_smul_of_nonneg` (`[Nonempty n]`, `A ≥ 0`: `ρ(A) = r ≥ 0` with a
  nonnegative nonzero eigenvector), `Matrix.ofReal_le_spectralRadius_of_smul_le_mulVec`
  (`A ≥ 0`, `y ≥ 0`, `y ≠ 0`, `t y ≤ A y`: `t ≤ ρ(A)`).
- `LinearAlgebra/Matrix/PerronFrobenius/Irreducible.lean`:
  `Matrix.IsIrreducible.exists_mulVec_eq_smul` (`[Nonempty n]`: an eigenvalue `r > 0` with a
  positive eigenvector), `Matrix.IsIrreducible.pos_of_mulVec_eq_smul` (a nonnegative nonzero
  eigenvector of an irreducible matrix is positive).
- `LinearAlgebra/Eigenspace/Matrix.lean`: `Matrix.mem_spectrum_iff_exists_mulVec_eq_smul`
  (field). `Suggested.lean` imports no Tau Ceti module.

### From TauCetiRoadmap.IterativeMethodsForLinearSystems

- §1.2 `tendsto_pow_atTop_nhds_zero_iff_spectralRadius_lt_one` (complex `G`: `G^k → 0` if and
  only if `ρ(G) < 1`) and `tendsto_pow_atTop_nhds_zero_iff_spectralRadius_map_lt_one` (real `G`),
  used in 1.3 and 4.1; §2.1 `jacobiMatrix`, `strictLowerPart`, `strictUpperPart`, `sorMatrix`.

## References

- Yousef Saad, *Iterative Methods for Sparse Linear Systems*, second edition, SIAM, 2003, the
  version on the author's page at the University of Minnesota, printed page numbers: Theorems
  1.28, 1.29 (pp. 29–30), 1.32 (p. 31); Definition 4.3, Theorem 4.4 (p. 118); Definition 4.5
  (p. 119); Corollary 4.8, Theorem 4.9 (p. 121).
- W. Auzinger and J. M. Melenk, *Iterative Solution of Large Linear Systems*, lecture notes,
  TU Wien, 2023, on the TU Wien course page: Theorem 5.2 (p. 32), Definition 5.4 (p. 35),
  Theorems 5.4 (p. 36) and 5.5 (p. 37).
- H. Fawzi, *Numerical Analysis*, Mathematical Tripos Part II, Lecture 16, Michaelmas 2021, on the
  author's DAMTP page: Theorem 4.12 (the Householder–John theorem), Corollary 4.13, p. 33.
- P. Stein and R. L. Rosenberg, *On the solution of linear simultaneous equations by iteration*,
  J. London Math. Soc. 23 (1948), 111–118, doi:10.1112/jlms/s1-23.2.111 (the origin of 2.4,
  which is proved here).

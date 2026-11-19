# Roadmap: iterative methods for linear systems

**Summary.** This roadmap develops the convergence theory of the classical iterative methods for
a square linear system `A x = b` over the real or complex numbers: stationary iterations
`x_(k+1) = G x_k + c` and the splittings of Jacobi, Gauss–Seidel and successive over-relaxation
(SOR); Chebyshev polynomials on an interval and the Chebyshev iteration built from them; and the
two Krylov-space methods defined by an optimality property, conjugate gradients and minimal
residuals (GMRES). Every iterate is a mathematical object, a term of a sequence given by a
recurrence or a minimiser over an affine Krylov space; no procedure, operation count or rounding
is a target. Matrices are finite and square, of any size including zero, and the spectral radius
of a real matrix is that of the same matrix over the complex numbers.

The headline theorems are these.

- *Spectral radius.* The powers of a complex square matrix `G` tend to zero if and only if its
  spectral radius is less than one, and the same holds for a real matrix with its complex
  spectral radius. The iterates of `x ↦ G x + c` converge for every `c` and every starting
  vector if and only if the powers of `G` tend to zero, and then they tend to `(I − G)⁻¹ c`.
- *Over-relaxation.* If `A` is Hermitian positive definite of size at least one, the SOR iterates
  with real parameter `ω` converge to `A⁻¹ b` for every `b` and every starting vector if and only
  if `0 < ω < 2` (Ostrowski and Reich). For any complex `A` of size at least one with nonzero
  diagonal entries and every real `ω`, the SOR iteration matrix has spectral radius at least
  `|ω − 1|` (Kahan).
- *Conjugate gradients.* Let `A` be Hermitian with all eigenvalues in `[α, β]`, `0 < α ≤ β`, and
  `κ = β/α`. The `k`-th conjugate gradient iterate, the point of `x₀ + K_k(A, b − A x₀)` closest
  to `A⁻¹ b` in the energy norm, has error at most `2 ((√κ − 1)/(√κ + 1))^k` times the initial
  error in that norm; for positive definite `A` it equals `A⁻¹ b` as soon as `k` reaches the
  dimension of the largest Krylov space of the initial residual.
- *Minimal residuals.* For a normal complex matrix, the residual of the `k`-th minimal residual
  iterate is at most `M` times the initial residual, for every polynomial `p` of degree at most
  `k` with `p(0) = 1` and `|p| ≤ M` on the spectrum.

The roadmap builds on Mathlib's spectral radius and Gelfand's formula, which give the first
headline; on Mathlib's spectral theorem for Hermitian matrices and Tau Ceti's spectral theorem
for normal matrices, through which a polynomial in the matrix is bounded by its values on the
spectrum; on Mathlib's Chebyshev polynomials and their extremal property, which give the min–max
theorem on an interval; and on Gershgorin's theorem in Mathlib, which makes a strictly
diagonally dominant matrix invertible.

## How to read the build

Layer 1 below treats stationary iterations and the spectral radius. Layer 2 defines the Jacobi
and SOR iterations and proves their convergence under strict diagonal dominance, Kahan's bound
and the theorem of Ostrowski and Reich; it uses the iterates and the convergence criterion of
Layer 1. Layer 3 depends on no other layer: the Chebyshev residual polynomial of an interval, its
min–max property and closed-form bound, and the error of Chebyshev iteration. Layer 4 defines
Krylov spaces and the conjugate gradient iterates and proves their characterizations, finite
termination and the convergence bound, which uses Layer 3. Layer 5 treats minimal residual
iterates on the Krylov spaces and energy norm of Layers 3 and 4.

## Conventions

- **Matrices and vectors.** `ι` is a finite index type, possibly empty, and `𝕜` is `ℝ` or `ℂ`
  (an `RCLike` field). Matrices are Mathlib's `Matrix ι ι 𝕜`, vectors are `ι → 𝕜`, and `A *ᵥ v`
  is the matrix–vector product. Vectors and matrices carry the product topology, so convergence
  is convergence of every entry. `n` denotes the number of indices.
- **Inverses.** `A⁻¹` is Mathlib's inverse, equal to `0` when `A` is singular. Every statement
  that uses `A⁻¹ b` assumes something that makes `A` invertible.
- **Spectral radius.** `ρ(G)` is Mathlib's `spectralRadius ℂ G`, an element of `[0, ∞]`; for a
  complex square matrix it is the largest modulus of an eigenvalue, and `0` for `n = 0`. For a
  real matrix `G` the spectral radius is that of `G.map (↑)` over `ℂ`. The real spectral radius
  `spectralRadius ℝ G`, a supremum over real eigenvalues only, is not used: it is `0` for a
  rotation by a right angle scaled by `2`, whose powers do not tend to zero.
- **Splitting.** For an order on `ι`, `A = D + L + U` with `D` the diagonal part, `L` the strictly
  lower and `U` the strictly upper triangular part. The source writes `A = D − E − F`, so
  `E = −L` and `F = −U`. Gauss–Seidel and SOR depend on the order of `ι`.
- **Norms.** The energy norm of `v` for a matrix `W` is `‖v‖_W = √(Re (v* W v))`; for positive
  definite `W` it is a norm, for `W = I` it is the Euclidean norm, and for a matrix that is not
  positive semidefinite the square root of a negative number is `0` by convention. Errors are
  `e = x − A⁻¹ b` and residuals `r = b − A x`.
- **Relaxation parameter.** `ω` is real, and `ω • M` is the real multiple of a matrix over `𝕜`.
- **Polynomials.** A polynomial `p` with coefficients in `𝕜`, or in `ℝ` for the Chebyshev
  polynomials, is evaluated at a matrix by Mathlib's `aeval`. "Degree at most `k`" is
  `p.natDegree ≤ k`. `T_k` is Mathlib's Chebyshev polynomial of the first kind
  `Polynomial.Chebyshev.T ℝ k`.
- **Krylov spaces.** `K_k(A, r)` is the span of `r, A r, …, A^(k−1) r`; `K_0 = 0`. The grade of
  `r` is the dimension of `K_n(A, r)`.

## Layer 1: stationary iterations and the spectral radius

### 1.1 Stationary iterates

Define `stationaryIterate G c x₀ : ℕ → ι → 𝕜` by `x 0 = x₀` and `x (k + 1) = G *ᵥ x k + c`.

- The error with respect to a fixed point `x*` of `x ↦ G x + c` satisfies `x k − x* = G^k (x₀ − x*)`.
- `x k = G^k x₀ + (I + G + ⋯ + G^(k−1)) c`.

**Checks.**
- For `n = 1`, `G = 1/2`, `c = 1`, `x₀ = 0`: the iterates are `0, 1, 3/2, 7/4, …`, tending to
  `2 = (1 − 1/2)⁻¹ · 1`.

*Needs:* Mathlib `Matrix.mulVec`, `Matrix.mulVec_mulVec`. (Proved here.)

### 1.2 Powers and the spectral radius

Prove `tendsto_pow_atTop_nhds_zero_iff_spectralRadius_lt_one`: for a complex square matrix `G`,
`G^k → 0` if and only if `ρ(G) < 1` (Saad, Theorem 1.10, p. 20). Prove
`tendsto_pow_atTop_nhds_zero_iff_spectralRadius_map_lt_one`: for a real square matrix `G`,
`G^k → 0` if and only if the spectral radius of `G.map (↑) : Matrix ι ι ℂ` is less than one.

Route: give the complex matrices the row-sum operator norm, under which they form a complete
normed algebra whose topology is the product topology. If `ρ(G) < 1`, Gelfand's formula gives
`‖G^k‖^(1/k) → ρ(G)`, so `‖G^k‖ ≤ q^k` for some `q < 1` and all large `k`. Conversely, an
eigenvalue `λ` with eigenvector `v` gives `G^k v = λ^k v`, so `G^k → 0` forces `|λ| < 1`; the
spectrum is finite, so `ρ(G) < 1`. The real case follows because taking the map `ℝ → ℂ` entrywise
commutes with powers (Mathlib's `Matrix.map_pow`), is continuous, and has the entrywise real part
as a continuous left inverse, so `G^k → 0` over `ℝ` if and only if `(G.map (↑))^k → 0` over `ℂ`.

**Checks.**
- `G = [[0, −2], [2, 0]]` (real): `G² = −4 I`, so the powers do not tend to zero; the complex
  eigenvalues are `±2i` and the complex spectral radius is `2`. `G` has no real eigenvalue, so a
  definition through real eigenvalues would give `0` and the real statement would fail.
- `G = [[1/2, 1], [0, 1/2]]` is not diagonalizable and has row-sum norm `3/2`, yet `ρ(G) = 1/2`
  and `G^k = [[2^(−k), k 2^(1−k)], [0, 2^(−k)]] → 0`; the upper right entries for `k = 1, 2, 3`
  are `1, 1, 3/4`. A criterion through a norm below one would miss it.
- `n = 0`: the only matrix is `0`, its powers are `0`, and `ρ = 0 < 1`.

*Needs:* Mathlib `spectralRadius`, `spectralRadius_eq_of_unital`, `spectrum.gelfand_formula`,
`Matrix.linftyOpNormedAlgebra`, `Matrix.linfty_opNorm_mulVec`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Module.End.hasEigenvalue_iff_mem_spectrum`,
`Matrix.map_pow`, `Continuous.matrix_map`. (Saad, Theorem 1.10, p. 20, for complex matrices; the
real case is proved here.)

### 1.3 Convergence of stationary iterations

Prove `forall_exists_tendsto_stationaryIterate_iff`: for `G : Matrix ι ι 𝕜`, the iterates of
`x ↦ G x + c` converge for every `c` and every `x₀` if and only if `G^k → 0`. Prove
`tendsto_stationaryIterate`: if `G^k → 0`, then `I − G` is invertible and the iterates tend to
`(I − G)⁻¹ c` from every `x₀`. With 1.2 this is the criterion `ρ(G) < 1` (Saad, Theorem 4.1,
p. 115, and Theorem 1.11, p. 21).

Route: with `x₀ = 0` the iterates are the partial sums of `∑ G^i c`; if they converge for every
`c`, the terms `G^i c` tend to zero for every `c`, so `G^i → 0`. Conversely, if `G^k → 0`, some
power has row-sum norm below `1/2`, the series `∑ G^i` converges to `(I − G)⁻¹`, and 1.1 gives
the limit.

**Checks.**
- `G = I`, `c = 0`: every iterate equals `x₀`, so the iterates converge for every `x₀`, yet
  `ρ(G) = 1`; with `c = e₁` they are `x₀ + k e₁` and diverge. The quantifier over `c` is needed.
- `n = 1`, `G = 1/2`, `c = 1`: the limit is `2`, as in the Check of 1.1.

*Needs:* 1.1; Mathlib `Matrix.linftyOpNormedAlgebra`, `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`,
`Matrix.isUnit_iff_isUnit_det`. (Saad, Theorem 4.1, p. 115, and Theorem 1.11, p. 21.)

### Examples

- The non-diagonalizable `G` of the second Check of 1.2 gives a convergent iteration with
  row-sum norm above one.

### Dependencies

1.1 uses only Mathlib. 1.2 uses Mathlib's spectral radius and Gelfand's formula. 1.3 uses 1.1.

## Layer 2: Jacobi, Gauss–Seidel and successive over-relaxation

### 2.1 Splittings and iteration matrices

Define, for `A : Matrix ι ι 𝕜`:

- `jacobiMatrix A = I − D⁻¹ A` and `jacobiIterate A b x₀`, the stationary iterates of
  `x ↦ jacobiMatrix A x + D⁻¹ b`;
- for an order on `ι`, `strictLowerPart A = L` and `strictUpperPart A = U`;
- for real `ω`, `sorMatrix A ω = (D + ω L)⁻¹ ((1 − ω) D − ω U)` and `sorIterate A ω b x₀`, the
  stationary iterates of `x ↦ sorMatrix A ω x + ω (D + ω L)⁻¹ b`. The value `ω = 1` is
  Gauss–Seidel.

These are the iterations (4.5), (4.8) and (4.12) of Saad, pp. 106–107, with `E = −L`, `F = −U`.

- If the diagonal entries of `A` are nonzero and `ω ≠ 0`, the fixed points of the Jacobi and SOR
  maps are exactly the solutions of `A x = b`.
- If the diagonal entries of `A` are nonzero, `D + ω L` is invertible for every `ω`, and
  `det (sorMatrix A ω) = (1 − ω)^n`.

**Checks.**
- `A = [[2, 1], [1, 2]]`: `jacobiMatrix A = [[0, −1/2], [−1/2, 0]]` with spectral radius `1/2`,
  and `sorMatrix A 1 = [[0, −1/2], [0, 1/4]]` with spectral radius `1/4`.
- With `ω = 0` the SOR matrix is `D⁻¹ D = I` (for nonzero diagonal) and the SOR map leaves every
  vector fixed: its fixed points are not the solutions.
- A matrix with a zero diagonal entry, `A = [[0, 1], [1, 0]]`: `D + ω L = [[0, 0], [ω, 0]]` is
  singular, Mathlib's inverse is `0`, and `sorMatrix A ω = 0` for every `ω`.

*Needs:* 1.1; Mathlib `Matrix.diagonal`, `Matrix.diag`, `Matrix.inv`, `Matrix.IsLowerTriangular`,
`Matrix.det_of_isLowerTriangular`. (Proved here.)

### 2.2 Strict diagonal dominance

Say that `A` is strictly diagonally dominant by rows if `∑_(j ≠ i) |A i j| < |A i i|` for every
`i`. For such `A`, prove `tendsto_jacobiIterate_of_sum_row_lt_diag` and
`tendsto_sorIterate_one_of_sum_row_lt_diag`: the Jacobi and the Gauss–Seidel iterates converge to
`A⁻¹ b` for every `b` and every `x₀` (Saad, Theorem 4.9, p. 121). `A` is invertible by
Gershgorin's theorem, which Mathlib provides.

Route: in the maximum norm, `‖jacobiMatrix A v‖ ≤ q ‖v‖` with
`q = max_i ∑_(j ≠ i) |A i j| / |A i i| < 1`. For Gauss–Seidel, if `w = sorMatrix A 1 v` and `i`
is an index where `|w i|` is largest, row `i` of `(D + L) w = −U v` gives
`|w i| (|A i i| − ∑_(j<i) |A i j|) ≤ ∑_(j>i) |A i j| ‖v‖`, so `‖w‖ ≤ q' ‖v‖` with
`q' = max_i ∑_(j>i) |A i j| / (|A i i| − ∑_(j<i) |A i j|) < 1`. In both cases the powers tend to
zero, and 1.3 gives the limit, which is the solution by 2.1.

**Checks.**
- `A = [[2, 1], [1, 2]]` is strictly dominant; the iteration matrices of the Check of 2.1 have
  spectral radii `1/2` and `1/4`.
- Strictness is needed: `A = [[1, 1], [1, 1]]` is dominant with equality and singular, and
  `jacobiMatrix A = [[0, −1], [−1, 0]]` has eigenvalues `±1`.
- Dominance is sufficient, not necessary, and the two methods are independent:
  `A = [[1, 2, −2], [1, 1, 1], [2, 2, 1]]` has `(jacobiMatrix A)³ = 0`, so Jacobi converges, while
  `sorMatrix A 1` has eigenvalues `0, 2, 2` and Gauss–Seidel diverges.
- Positive definiteness does not replace dominance for Jacobi: the matrix with `1` on the
  diagonal and `4/5` elsewhere, of size three, has eigenvalues `13/5, 1/5, 1/5` and is positive
  definite, but its Jacobi matrix has eigenvalue `−8/5`; its Gauss–Seidel matrix has spectral
  radius about `0.716`, as 2.4 predicts.

*Needs:* 1.3, 2.1; Mathlib `det_ne_zero_of_sum_row_lt_diag`, `eigenvalue_mem_ball`,
`Matrix.linfty_opNorm_def`. (Saad, Theorem 4.9, p. 121. Saad's Definition 4.5 states dominance
with sums over a column, while the proof of Theorem 4.9 uses sums over a row; the statement here
is the row form that the proof establishes.)

### 2.3 Kahan's bound

Prove `ofReal_abs_sub_one_le_spectralRadius_sorMatrix`: for complex `A` with `n ≥ 1` and every
diagonal entry nonzero, and every real `ω`, `ρ(sorMatrix A ω) ≥ |ω − 1|`. The bound is due to
Kahan. (Proved here.)

Route: by 2.1, `det (sorMatrix A ω) = (1 − ω)^n`. The determinant is the product of the `n`
eigenvalues counted with multiplicity, so some eigenvalue has modulus at least `|1 − ω|`.

**Checks.**
- `ω = 0`: `sorMatrix A 0 = I` and the bound `1 ≤ ρ = 1` is an equality.
- `A = [[2, 1], [1, 2]]`, `ω = 3/2`: `ρ(sorMatrix A ω) = 1/2 = |ω − 1|`; at
  `ω = 8 − 4√3 ≈ 1.0718` the spectral radius is `7 − 4√3 ≈ 0.0718 = ω − 1`, the least value over
  all `ω`. The bound is attained.
- The nonzero diagonal is needed: for `A = [[0, 1], [1, 0]]` the SOR matrix is `0` (Check of
  2.1), so `ρ = 0 < 1 = |ω − 1|` at `ω = 0` and `ω = 2`.
- `n = 0` is excluded: then `ρ = 0` while `|ω − 1|` may be positive.

*Needs:* 2.1; Mathlib `spectralRadius_eq_of_unital`, `Matrix.det_eq_prod_roots_charpoly`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.det_of_isLowerTriangular`. (Proved here.)

### 2.4 The theorem of Ostrowski and Reich

Prove `forall_tendsto_sorIterate_iff`: if `A : Matrix ι ι 𝕜` is positive definite (Mathlib's
`Matrix.PosDef`, which includes Hermitian) and `n ≥ 1`, then for real `ω` the SOR iterates
converge to `A⁻¹ b` for every `b` and every `x₀` if and only if `0 < ω < 2`. The direction from
`0 < ω < 2` to convergence is Saad, Theorem 4.10, p. 122, stated there, without proof, for real
symmetric matrices with positive diagonal as an equivalence with positive definiteness at a fixed
`ω` in `(0, 2)`, of which this is the direction from positive definiteness to convergence; the
route below proves the Hermitian case directly. The theorem is due to
Reich for `ω = 1` and to Ostrowski in general.

Route: write `M = (D + ω L)/ω`, so that `G = sorMatrix A ω = I − M⁻¹ A` and, as `U = L*`,
`A − G* A G = (M⁻¹ A)* ((2/ω − 1) D) (M⁻¹ A)`. For `0 < ω < 2` the middle factor is positive
definite, so `‖G v‖_A < ‖v‖_A` for `v ≠ 0`; by compactness of the unit sphere `G` contracts the
energy norm by a factor below one, its powers tend to zero, and 1.3 and 2.1 give convergence to
`A⁻¹ b`. Conversely, convergence for every `b` and `x₀` makes the errors `G^k e₀` tend to zero for
every `e₀`, so `G^k → 0` and `det (G)^k = det (G^k) → 0`; with `det G = (1 − ω)^n` from 2.1 and
`n ≥ 1` this forces `|1 − ω| < 1`. This direction needs neither eigenvalues nor `ℂ`.

**Checks.**
- `A = [[2, 1], [1, 2]]`: the spectral radius of `sorMatrix A ω` is about `0.711` at `ω = 1/2`,
  `1/4` at `ω = 1`, `1/2` at `ω = 3/2` and `9/10` at `ω = 19/10`, all below one, while at `ω = 2`
  the determinant of `sorMatrix A ω` is `(1 − 2)² = 1`, so its powers do not tend to zero.
- Positive definiteness is needed: `A = [[1, 2], [2, 1]]` is Hermitian with positive diagonal and
  eigenvalues `3, −1`; its Gauss–Seidel matrix has spectral radius `4` and its SOR matrix at
  `ω = 1/2` spectral radius about `1.866`.
- `n ≥ 1` is needed: for `n = 0` every sequence converges and the right side fails for `ω = 3`.

*Needs:* 1.3, 2.1; Mathlib `Matrix.PosDef`, `Matrix.PosDef.re_dotProduct_pos`,
`Matrix.PosDef.isUnit`, `Matrix.det_pow`, `IsCompact.exists_isMaxOn`. (Saad, Theorem 4.10,
p. 122, for the direction from `0 < ω < 2`; the converse is proved here.)

### Examples

- For `A = [[2, 1], [1, 2]]`, Jacobi and Gauss–Seidel both converge (2.2), the Gauss–Seidel rate
  being the square of the Jacobi rate, and SOR converges exactly for `0 < ω < 2` (2.4).

### Dependencies

2.1 uses 1.1. 2.2 uses 1.3 and 2.1. 2.3 uses 2.1. 2.4 uses 1.3 and 2.1. Nothing in this layer
uses Layer 1's spectral radius criterion 1.2.

## Layer 3: Chebyshev polynomials on an interval and Chebyshev iteration

### 3.1 The Chebyshev residual polynomial

For real `α < β` and `k : ℕ` define `chebyshevResidual α β k : ℝ[X]`, the polynomial
`t ↦ T_k((β + α − 2t)/(β − α)) / T_k((β + α)/(β − α))`. Write `μ = (β + α)/(β − α)`.

Prove `chebyshevResidual_spec`: for `0 < α < β`, the polynomial has degree at most `k`, value `1`
at `0`, and absolute value at most `1/T_k(μ)` on `[α, β]` (Saad, §12.3.2, p. 397).

Route: `t ↦ (β + α − 2t)/(β − α)` maps `[α, β]` onto `[−1, 1]` and `0` to `μ > 1`; `|T_k| ≤ 1` on
`[−1, 1]` and `T_k(μ) ≥ 1`.

**Checks.**
- `[α, β] = [1, 3]`, `k = 1`: `μ = 2`, `T_1(2) = 2`, and the polynomial is `1 − t/2`, with largest
  absolute value `1/2` on `[1, 3]`.
- `[1, 3]`, `k = 2`: `T_2(2) = 7` and the polynomial is `(2 (2 − t)² − 1)/7`; it takes the values
  `1/7, −1/7, 1/7` at `t = 1, 2, 3` and `1` at `t = 0`. Dividing by `T_k(1) = 1` instead of
  `T_k(μ)` would give the value `7` at `0`.
- `α = β`: the definition divides by zero; Lean's convention makes `μ = 0`, and for odd `k` the
  polynomial is `0`. The statement assumes `α < β`.

*Needs:* Mathlib `Polynomial.Chebyshev.T`, `Polynomial.Chebyshev.abs_eval_T_real_le_one`,
`Polynomial.Chebyshev.one_le_eval_T_real`. (Saad, §12.3.2, p. 397.)

### 3.2 The min–max property

Prove `exists_inv_eval_T_le_abs_eval`: for `0 < α < β`, every real polynomial `p` of degree at
most `k` with `p(0) = 1` satisfies `|p(t)| ≥ 1/T_k(μ)` at some `t ∈ [α, β]`. With 3.1, `1/T_k(μ)`
is the least value of `max_[α, β] |p|` over such `p`, attained by the Chebyshev residual
polynomial (Saad, Theorem 6.25, p. 209, with `γ = 0`). The case of a point `γ < α` in place of
`0` is this one for the interval `[α − γ, β − γ]`, after the change of variable `t ↦ t + γ`.

Route: let `c` be the largest value of `|p|` on `[α, β]`; `c > 0`, since a polynomial vanishing
on an interval is `0`, while `p(0) = 1`. Then `P(s) = p(((β + α) − (β − α) s)/2) / c` has degree at
most `k` and `|P| ≤ 1` on `[−1, 1]`, and Mathlib's extremal property of `T_k` (iterated
derivatives of order zero at points `≥ 1`) gives `P(μ) ≤ T_k(μ)`. As `P(μ) = p(0)/c = 1/c`, this
is `c ≥ 1/T_k(μ)`.

**Checks.**
- `[1, 3]`, `k = 1`: `p(t) = 1 + c t` has `max(|1 + c|, |1 + 3c|) ≥ 1/2`, with equality only at
  `c = −1/2`.
- `k = 0`: `p = 1` and `T_0 = 1`; both sides are `1`.

*Needs:* 3.1; Mathlib `Polynomial.Chebyshev.eval_iterate_derivative_le_of_forall_abs_le_one`,
`IsCompact.exists_isMaxOn`. (Saad, Theorem 6.25, p. 209.)

### 3.3 The closed-form bound

For `0 < α < β` and `κ = β/α`, prove `1/T_k(μ) ≤ 2 ((√κ − 1)/(√κ + 1))^k` (Saad, the derivation
of (6.128), pp. 214–215).

Route: `μ = (κ + 1)/(κ − 1) ≥ 1`, `T_k(μ) = cosh(k arcosh μ)`, and
`exp(arcosh μ) = μ + √(μ² − 1) = (√κ + 1)/(√κ − 1)`; then `cosh y ≥ exp(y)/2`.

**Checks.**
- `[1, 3]`, `k = 2`: `1/7 ≈ 0.142857 ≤ 14 − 8√3 ≈ 0.143594`; the bound is nearly sharp.
- `[1, 2]`, `k = 1`: `1/T_1(3) = 1/3 ≤ 2 (3 − 2√2) ≈ 0.3431`.

*Needs:* 3.1; Mathlib `Polynomial.Chebyshev.T_real_cosh`, `Real.cosh_arcosh`. (Saad, pp. 214–215.)

### 3.4 The energy norm and Chebyshev iteration

Define `energyNorm W v = √(Re (v* W v))`, and for `A`, `b`, `α`, `β`, `k`, `x₀` define
`chebyshevIterate A b α β k x₀ = x₀ + q(A) (b − A x₀)`, where `q` is the quotient of
`1 − chebyshevResidual α β k` by `t`; the division is exact because the residual polynomial has
value `1` at `0` (3.1). The error of the Chebyshev iterate is `p(A) e₀`, with `p` the Chebyshev
residual polynomial; this is Chebyshev iteration, the polynomial acceleration of Saad, §12.3.2,
pp. 397–399, written by its polynomial rather than by its three-term recurrence.

Prove `energyNorm_chebyshevIterate_sub_le`: if `A` is Hermitian with every eigenvalue in
`[α, β]`, `0 < α < β`, then the error of the Chebyshev iterate is at most `1/T_k(μ)` times the
initial error, in the energy norm of `A` and in the Euclidean norm.

Route: by the spectral theorem, `‖p(A) v‖_W ≤ max_i |p(λ_i)| ‖v‖_W` for `W = A` and `W = I`, and
`|p(λ_i)| ≤ 1/T_k(μ)` by 3.1. With 3.3, the factor is at most `2 ((√κ − 1)/(√κ + 1))^k`.

**Checks.**
- `energyNorm` of `(1, 1)` for `W = diag(1, 2)` is `√3`, and for `W = I` it is `√2`.
- `A = diag(1, 3)`, `[α, β] = [1, 3]`, `k = 1`: `q = 1/2`, so the iterate is `x₀ + r₀/2`. For
  `b = (1, 1)`, `x₀ = 0` the errors are `e₀ = (−1, −1/3)` and `e₁ = (−1/2, 1/6)`, and both norms
  are halved: the bound `1/T_1(2) = 1/2` is attained.

*Needs:* 3.1; Mathlib `Matrix.IsHermitian.eigenvalues`, `Matrix.IsHermitian.spectral_theorem`,
`Matrix.IsHermitian.mulVec_eigenvectorBasis`, `Polynomial.aeval`, `Polynomial.divByMonic`,
`Polynomial.modByMonic_X`, `Polynomial.modByMonic_add_div`. (Proved here.)

### Examples

- On `[1, 3]` the residual polynomials of degrees one and two are `1 − t/2` and
  `(2 (2 − t)² − 1)/7`, with maxima `1/2` and `1/7` (3.1), no polynomial with value `1` at `0`
  does better (3.2), and the closed form gives `0.5359` and `0.1436` (3.3).

### Dependencies

3.1 uses only Mathlib. 3.2 and 3.3 use 3.1. 3.4 uses 3.1 and Mathlib's spectral theorem.

## Layer 4: Krylov spaces and conjugate gradients

### 4.1 Krylov spaces

Define `krylov A r k`, the span of `A^i r` for `i < k`. Prove:

- `K_k(A, r)` is the set of `q(A) r` for polynomials `q` of degree less than `k`, and increases
  with `k`.
- If `K_(m+1)(A, r) = K_m(A, r)` then `K_k(A, r) = K_m(A, r)` for all `k ≥ m`, and this space is
  invariant under `A`. Hence the dimension of `K_k(A, r)` is `min(k, g)`, where `g ≤ n` is the
  grade of `r` (Saad, Propositions 6.1 and 6.2, p. 158).
- If `A` is invertible, `A⁻¹ r ∈ K_g(A, r)`.

**Checks.**
- `K_0(A, r) = 0` and `K_k(A, 0) = 0`; the grade of `0` is `0`.
- For `A = I` and `r ≠ 0`, `K_k = span {r}` for every `k ≥ 1` and the grade is `1`.
- The grade is at most the degree of the minimal polynomial of `A`, and at most the number of
  distinct eigenvalues of a Hermitian `A`.

*Needs:* Mathlib `Submodule.span`, `Module.finrank`, `Matrix.aeval_self_charpoly`.
(Saad, Propositions 6.1 and 6.2, p. 158.)

### 4.2 Conjugate gradient iterates

Define `IsCGIterate A b x₀ k x`: `x − x₀ ∈ K_k(A, b − A x₀)` and `‖x − A⁻¹ b‖_A ≤ ‖y − A⁻¹ b‖_A`
for every `y` with `y − x₀ ∈ K_k(A, b − A x₀)`. The iterates of the conjugate gradient method of
Hestenes and Stiefel are these minimisers (Saad, Proposition 5.2, p. 137, and Lemma 6.28,
p. 214); the definition here is the minimisation property, not the recurrence.

For positive definite `A`, prove `existsUnique_isCGIterate`: the `k`-th iterate exists and is
unique; and `isCGIterate_iff`: a point `x` with `x − x₀ ∈ K_k` is the `k`-th iterate if and only
if `v* (b − A x) = 0` for every `v ∈ K_k` (Saad, Proposition 5.2, p. 137).

Route: on the subspace `K_k`, `y ↦ ‖x₀ + y − A⁻¹ b‖_A²` is a positive definite quadratic
function; its unique minimiser is the `A`-orthogonal projection, characterized by
`A`-orthogonality of the error to `K_k`, which is orthogonality of the residual.

**Checks.**
- `A = diag(1, 2)`, `b = (1, 1)`, `x₀ = 0`: `A⁻¹ b = (1, 1/2)` and `K_1 = span {(1, 1)}`. The first
  iterate is `(2/3, 2/3)`, with residual `(1/3, −1/3)` orthogonal to `(1, 1)`. Minimising the
  Euclidean norm of the error instead would give `(3/4, 3/4)`.
- `k = 0`: the only candidate is `x₀`.

*Needs:* 3.4, 4.1; Mathlib `Matrix.PosDef`, `Matrix.PosDef.re_dotProduct_pos`,
`Matrix.PosDef.isUnit`, `Submodule.exists_norm_eq_iInf_of_complete_subspace`. (Saad,
Proposition 5.2, p. 137.)

### 4.3 Orthogonality and conjugacy

For positive definite `A` and a sequence `x` with `IsCGIterate A b x₀ k (x k)` for every `k`, prove
`star_residual_dotProduct_residual_eq_zero`: the residuals `b − A x i` and `b − A x j` are
orthogonal for `i ≠ j`; and `star_step_dotProduct_mulVec_step_eq_zero`: the steps
`x (i + 1) − x i` and `x (j + 1) − x j` are `A`-conjugate for `i ≠ j` (Saad, Proposition 6.20,
p. 198, stated for the residuals and the search directions of the Lanczos form of the method, of
which the steps are multiples; Shewchuk, §8, equation (44), p. 30, for the residuals).

Route: for `i < j`, the residual `b − A x i` lies in `K_(i+1) ⊆ K_j` and is orthogonal to `K_j`
by 4.2 at `j`. For the steps, `A (x (j + 1) − x j)` is the difference of the residuals at `j` and
`j + 1`, both orthogonal to `K_j ∋ x (i + 1) − x i`.

**Checks.**
- In the example of 4.2, `r₀ = (1, 1)` and `r₁ = (1/3, −1/3)` are orthogonal; `x₂ = (1, 1/2)`,
  and the steps `(2/3, 2/3)` and `(1/3, −1/6)` satisfy `(2/3)(1/3)·1 + (2/3)(−1/6)·2 = 0`.

*Needs:* 4.1, 4.2. (Saad, Proposition 6.20, p. 198; Shewchuk, §8, p. 30.)

### 4.4 Polynomial optimality and finite termination

For positive definite `A`, prove `IsCGIterate.polynomial_optimal`: the error of the `k`-th
iterate is `p(A) e₀` for some `p` of degree at most `k` with `p(0) = 1`, and its energy norm is at
most `‖p(A) e₀‖_A` for every such `p` (Saad, Lemma 6.28, p. 214). Prove
`IsCGIterate.eq_of_finrank_le`: if `k` is at least the grade of `r₀ = b − A x₀`, the `k`-th iterate
is `A⁻¹ b`. In particular this holds for `k ≥ n` and for `k` at least the number of distinct
eigenvalues of `A` (Shewchuk, §9.1, p. 34).

Route: `x − x₀ = q(A) r₀ = q(A) A (A⁻¹ b − x₀)` for some `q` of degree below `k` by 4.1, so the
error is `(I − A q(A)) e₀`, and every such polynomial arises. For termination, `e₀ = −A⁻¹ r₀` lies
in `K_g` by 4.1, so the minimum is `0`.

**Checks.**
- `A = I`: the grade of `r₀ ≠ 0` is `1`, and the first iterate is `x₀ + r₀ = b`.
- `x₀ = A⁻¹ b`: `r₀ = 0`, the grade is `0`, and every iterate is `x₀`.
- In the example of 4.2 the grade is `2` and `x₂ = A⁻¹ b`.

*Needs:* 4.1, 4.2; Mathlib `Polynomial.aeval`, `Matrix.PosDef.isUnit`. (Saad, Lemma 6.28, p. 214;
Shewchuk, §9.1, p. 34; the statement through the grade is proved here.)

### 4.5 The convergence bound

Prove `IsCGIterate.energyNorm_sub_le`: if `A` is Hermitian with every eigenvalue in `[α, β]`,
`0 < α ≤ β`, and `κ = β/α`, then the `k`-th iterate satisfies
`‖x − A⁻¹ b‖_A ≤ 2 ((√κ − 1)/(√κ + 1))^k ‖x₀ − A⁻¹ b‖_A` (Saad, Theorem 6.29 and (6.128),
pp. 214–215; Shewchuk, §9.2, equation (52), p. 36).

Route: the hypotheses make `A` positive definite. For `α < β`, apply 4.4 with the Chebyshev
residual polynomial of `[α, β]` and bound `‖p(A) e₀‖_A` as in 3.4, then use 3.3. For `α = β`,
`A = α I`, the first iterate is `A⁻¹ b`, and the bound reads `0` for `k ≥ 1` and `2 ‖e₀‖_A` for
`k = 0`.

**Checks.**
- In the example of 4.2, `κ = 2`: `‖e₀‖_A² = 3/2` and `‖e₁‖_A² = 1/6`, so the squares have ratio
  `1/9` and the norms ratio `1/3`, below `2 (3 − 2√2) ≈ 0.3431`; here `1/3 = 1/T_1(3)` is the
  exact Chebyshev factor.
- `κ = 1`: the factor is `2 · 0^k`, which is `2` for `k = 0` and `0` for `k ≥ 1`.

*Needs:* 3.1, 3.3, 3.4, 4.4; Mathlib `Matrix.IsHermitian.posDef_iff_eigenvalues_pos`. (Saad,
Theorem 6.29, pp. 214–215; Shewchuk, §9.2, p. 36.)

### Examples

- For `A = diag(1, 2)`, `b = (1, 1)`, `x₀ = 0` the iterates are `0`, `(2/3, 2/3)` and `(1, 1/2)`:
  orthogonal residuals, conjugate steps (4.3), termination at the grade `2` (4.4), and a first
  step that meets the Chebyshev factor `1/3` (4.5).

### Dependencies

4.1 uses only Mathlib. 4.2 uses 3.4 and 4.1. 4.3 uses 4.1 and 4.2. 4.4 uses 4.1 and 4.2. 4.5 uses
3.1, 3.3, 3.4 and 4.4.

## Layer 5: minimal residuals

### 5.1 Minimal residual iterates

Define `IsGMRESIterate A b x₀ k x`: `x − x₀ ∈ K_k(A, b − A x₀)` and the Euclidean norm of
`b − A x` is at most that of `b − A y` for every `y` with `y − x₀ ∈ K_k(A, b − A x₀)`. The
iterates of GMRES, due to Saad and Schultz, are these minimisers (Saad, Proposition 5.3, p. 137,
and Lemma 6.31, p. 216).

Prove `exists_isGMRESIterate`: for every square `A`, singular or not, a `k`-th iterate exists
(Saad notes after the proof of Proposition 5.3, p. 138, that `A` need not be nonsingular). Prove
`IsGMRESIterate.polynomial_optimal`: the residual of a `k`-th iterate is `p(A) r₀` for some `p` of
degree at most `k` with `p(0) = 1`, and its Euclidean norm is at most `‖p(A) r₀‖` for every such
`p` (Saad, Lemma 6.31, p. 216).

Route: the residuals of points of `x₀ + K_k` form the affine space `r₀ − A K_k`; the nearest point
to `0` is given by the orthogonal projection onto the subspace `A K_k`. The polynomial form is
that of 4.4.

**Checks.**
- `A = [[0, 1], [1, 0]]`, `b = (1, 0)`, `x₀ = 0`: the first iterate is `0` with residual of norm
  `1` (no progress), and the second is `(0, 1) = A⁻¹ b`.
- For singular `A` iterates exist but need not be unique: for `A = 0`, `b ≠ 0` and `k ≥ 1`, every
  point of `x₀ + K_k = x₀ + span {b}` has residual `b` and is an iterate.

*Needs:* 3.4, 4.1; Mathlib `Submodule.exists_norm_eq_iInf_of_complete_subspace`,
`Matrix.toEuclideanLin`. (Saad, Proposition 5.3, p. 137, and Lemma 6.31, p. 216.)

### 5.2 The bound for normal matrices

Prove `IsGMRESIterate.energyNorm_one_residual_le`: for a normal complex matrix `A`, a `k`-th
iterate `x`, and a complex polynomial `p` of degree at most `k` with `p(0) = 1` and `|p(z)| ≤ M`
for every eigenvalue `z` of `A`, the residual satisfies `‖b − A x‖ ≤ M ‖b − A x₀‖` (Saad,
Proposition 6.32, p. 216, where for a normal matrix the eigenvector matrix is unitary and its
condition number is `1`).

Route: by Tau Ceti's spectral theorem for normal matrices `A = U Λ U*` with `U` unitary, so
`‖p(A) r₀‖ ≤ max_z |p(z)| ‖r₀‖`; then 5.1.

**Checks.**
- In the example of 5.1, `A` is normal with eigenvalues `±1`; `p(t) = 1 + c t` has
  `max(|1 + c|, |1 − c|) ≥ 1`, so `M = 1` is the best bound at `k = 1`, and it is attained.
- Normality is needed: `A = [[1, 10], [0, 1]]`, `b = (0, 1)`, `x₀ = 0` has spectrum `{1}`, where
  `p(t) = 1 − t` vanishes, so the bound would give `0` at `k = 1`; the first iterate has residual
  norm `√(100/101) ≈ 0.995`.

*Needs:* 5.1; Tau Ceti `Matrix.exists_mem_unitaryGroup_star_mul_mul_eq_diagonal`; Mathlib
`IsStarNormal`, `Matrix.mem_spectrum_iff_isRoot_charpoly`. (Saad, Proposition 6.32, p. 216.)

### 5.3 Finite termination

Prove `IsGMRESIterate.mulVec_eq_of_finrank_le`: for invertible `A`, if `k` is at least the grade
of `r₀`, every `k`-th iterate solves `A x = b` (compare Saad, Proposition 6.10, p. 179).

Route: `A⁻¹ r₀ ∈ K_g` by 4.1, so `x₀ + A⁻¹ r₀ = A⁻¹ b` is a candidate with residual `0`.

**Checks.**
- Invertibility is needed: `A = diag(1, 0)`, `b = (0, 1)`, `x₀ = 0` gives residual norm `1` for
  every `k`. The system need not be inconsistent for this: `A = [[0, 1], [0, 0]]`, `b = (1, 0)`,
  `x₀ = 0` has the solution `(0, 1)`, but `A b = 0`, so the grade of `r₀ = b` is `1`, every
  `K_k` with `k ≥ 1` is `span {b}`, and every residual equals `b`.

*Needs:* 4.1, 5.1. (Proved here; Saad, Proposition 6.10, p. 179, is the corresponding statement
about the Arnoldi recurrence.)

### Examples

- The two matrices of the Checks of 5.2 separate the normal case, where the eigenvalues govern
  the residuals, from a non-normal matrix with a single eigenvalue, where a polynomial of degree
  one vanishes on the spectrum but the residual only drops from `1` to about `0.995`.

### Dependencies

5.1 uses 3.4 and 4.1. 5.2 uses 5.1 and Tau Ceti. 5.3 uses 4.1 and 5.1.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: stationary iterates and the
spectral radius criterion for matrices; the Jacobi and SOR iterations with convergence under
strict diagonal dominance, Kahan's bound and the theorem of Ostrowski and Reich; the Chebyshev
residual polynomial of an interval, its min–max property and closed-form bound, the energy norm
and Chebyshev iteration; Krylov spaces, conjugate gradient and minimal residual iterates with
their characterizations, orthogonality, termination and bounds.

Already in the libraries and therefore not targets:

- The spectral radius in a normed algebra and Gelfand's formula (`spectralRadius`,
  `spectrum.gelfand_formula`), used in 1.2.
- Gershgorin's theorem and the invertibility of a strictly diagonally dominant matrix
  (`eigenvalue_mem_ball`, `det_ne_zero_of_sum_row_lt_diag`), used in 2.2.
- Chebyshev polynomials on `[−1, 1]` and beyond, with their extremal properties: the largest
  leading coefficient and the largest values of iterated derivatives at points `≥ 1` among
  polynomials bounded by one on `[−1, 1]`
  (`Polynomial.Chebyshev.leadingCoeff_le_of_forall_abs_le_one`,
  `Polynomial.Chebyshev.eval_iterate_derivative_le_of_forall_abs_le_one`), and their values
  through `cos` and `cosh`. 3.2 is the consequence of the second at order zero for an interval
  and a normalization at a point outside it.
- The spectral theorem for Hermitian matrices, positive definiteness and the positivity of the
  eigenvalues of a positive definite matrix (Mathlib), and the spectral theorem for normal
  matrices (Tau Ceti).

This roadmap owns the equivalence of 1.2 between `G^k → 0` and the complex spectral radius being
less than one, for complex and for real matrices. LinearSystemsAndControl (an open roadmap, not
on main) defines Schur stable real matrices in its 5.1, every complex eigenvalue of modulus less
than one; the equivalence of Schur stability with `A ^ k → 0` is the real case of 1.2 read
through that predicate, the spectrum of a matrix being finite, and that roadmap cites 1.2 for it.
This roadmap does not depend on that one.

No roadmap on main owns an object of this roadmap. The closest is ClassicalArithmeticCompletion
§6.40, which uses the Chebyshev constants of `[−1, 1]`, the least sup norm of a monic
polynomial; that normalization by the leading coefficient is a different extremal problem from
the normalization at a point in 3.2, and neither roadmap restates the other's.

Not treated here: gradient methods for quadratic functions, including steepest descent; the
Newton–Schulz iteration for polar factors and matrix inverses; preconditioning.

Outside the scope: the Arnoldi and Lanczos recurrences and the conjugate gradient recurrence as
procedures, and the equality of their outputs with the minimisers defined here; operation counts
and rounding errors; regular splittings, M-matrices, irreducible diagonal dominance and the
Stein–Rosenberg theorem; diagonal dominance by columns; Young's theory of consistently ordered
matrices and the optimal SOR parameter; symmetric SOR; the GMRES bound for diagonalizable
non-normal matrices through the condition number of the eigenvector matrix and the bounds on
ellipses; restarted and truncated Krylov methods; biorthogonal methods (BiCG, QMR); multigrid;
iterations for eigenvalues.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Normed/Algebra/Spectrum.lean`: `spectralRadius 𝕜 a`, the supremum of `‖k‖₊`
  over the quasispectrum, in `ℝ≥0∞`; `spectralRadius_eq_of_unital` (in a unital algebra, the
  supremum over the spectrum). `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean`:
  `spectrum.gelfand_formula` (in a complex Banach algebra, `‖a^n‖₊^(1/n) → spectralRadius ℂ a`).
- `Mathlib/Analysis/Matrix/Normed.lean`: `Matrix.linftyOpNormedAlgebra` (the row-sum operator
  norm makes square matrices a normed algebra; a definition, not a global instance),
  `Matrix.linfty_opNorm_def` (the norm is the largest row sum of norms of entries),
  `Matrix.linfty_opNorm_mulVec` (`‖A *ᵥ v‖ ≤ ‖A‖ ‖v‖` with the maximum norm on vectors).
- `Mathlib/Analysis/SpecificLimits/Normed.lean`: `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`
  (in a normed ring, `‖x‖ < 1` gives `x^n → 0`).
- `Mathlib/Topology/Instances/Matrix.lean`: `Continuous.matrix_map`.
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean`: `Matrix.det_eq_prod_roots_charpoly` (over an
  algebraically closed field the determinant is the product of the roots of the characteristic
  polynomial with multiplicity), `Matrix.mem_spectrum_iff_isRoot_charpoly`.
  `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`: `Module.End.hasEigenvalue_iff_mem_spectrum`
  (in finite dimension, eigenvalues are the points of the spectrum).
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.aeval_self_charpoly`
  (Cayley–Hamilton).
- `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: `Matrix.det_pow`.
  `Mathlib/LinearAlgebra/Matrix/Block.lean`: `Matrix.IsLowerTriangular`,
  `Matrix.det_of_isLowerTriangular` (for an order on the indices, the determinant of a lower
  triangular matrix is the product of its diagonal entries).
  `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.inv` (junk value `0` for a
  singular matrix), `Matrix.isUnit_iff_isUnit_det`. `Mathlib/Data/Matrix/Mul.lean`:
  `Matrix.mulVec`, `Matrix.mulVec_mulVec`. `Mathlib/Data/Matrix/Basic.lean`: `Matrix.map_pow`
  (`(M ^ a).map f = (M.map f) ^ a` for a ring map `f`). `Mathlib/Data/Matrix/Diagonal.lean`:
  `Matrix.diagonal`, `Matrix.diag`.
- `Mathlib/LinearAlgebra/Matrix/Gershgorin.lean`: `eigenvalue_mem_ball` (every eigenvalue lies in
  a closed disc about a diagonal entry with radius the off-diagonal row sum),
  `det_ne_zero_of_sum_row_lt_diag` (strict row dominance gives a nonzero determinant), over a
  normed field.
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef` (Hermitian and `x* A x > 0` for
  `x ≠ 0`), `Matrix.PosDef.isUnit`. `Mathlib/Analysis/Matrix/PosDef.lean`:
  `Matrix.PosDef.re_dotProduct_pos` (`0 < Re (x* A x)` for `x ≠ 0`),
  `Matrix.IsHermitian.posDef_iff_eigenvalues_pos`.
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues` (real eigenvalues of a
  Hermitian matrix indexed by `ι`), `Matrix.IsHermitian.mulVec_eigenvectorBasis` (the vectors of
  an orthonormal eigenbasis are eigenvectors), `Matrix.IsHermitian.spectral_theorem` (unitary
  diagonalization).
- `Mathlib/RingTheory/Polynomial/Chebyshev.lean`: `Polynomial.Chebyshev.T`, indexed by `ℤ`.
  `Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/RootsExtrema.lean`:
  `Polynomial.Chebyshev.abs_eval_T_real_le_one` (`|T_n(x)| ≤ 1` for `|x| ≤ 1`),
  `Polynomial.Chebyshev.one_le_eval_T_real` (`T_n(x) ≥ 1` for `x ≥ 1`).
  `Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Basic.lean`:
  `Polynomial.Chebyshev.T_real_cosh` (`T_n(cosh θ) = cosh(n θ)`).
  `Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Extremal.lean`:
  `Polynomial.Chebyshev.eval_iterate_derivative_le_of_forall_abs_le_one` (if `P` has degree at
  most `n` and `|P| ≤ 1` on `[−1, 1]`, then for `x ≥ 1` the `k`-th derivative of `P` at `x` is at
  most that of `T_n`; used with `k = 0`).
  `Mathlib/Analysis/SpecialFunctions/Arcosh.lean`: `Real.cosh_arcosh` (`cosh (arcosh x) = x` for
  `x ≥ 1`).
- `Mathlib/Algebra/Polynomial/AlgebraMap.lean`: `Polynomial.aeval`.
  `Mathlib/Algebra/Polynomial/Div.lean`: `Polynomial.divByMonic`, `Polynomial.modByMonic_X`
  (`p %ₘ X = C (p.eval 0)`), `Polynomial.modByMonic_add_div`.
- `Mathlib/LinearAlgebra/Span/Defs.lean`: `Submodule.span`.
  `Mathlib/LinearAlgebra/Dimension/Finrank.lean`: `Module.finrank`.
  `Mathlib/Analysis/InnerProductSpace/Projection/Minimal.lean`:
  `Submodule.exists_norm_eq_iInf_of_complete_subspace` (a complete subspace of an inner product
  space has a nearest point to every vector).
  `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `Matrix.toEuclideanLin` (a matrix as a linear
  map of Euclidean spaces).
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMaxOn` (a function continuous on a
  nonempty compact set attains its greatest value).
- `Mathlib/Algebra/Star/SelfAdjoint.lean`: `IsStarNormal` (`A* A = A A*`).

### From Tau Ceti

- `TauCeti/Analysis/Matrix/Normal.lean`: `Matrix.exists_mem_unitaryGroup_star_mul_mul_eq_diagonal`
  (for a complex square matrix `A` with `IsStarNormal A` there are a unitary `U` and `d` with
  `star U * A * U = diagonal d`), used in 5.2. No other declaration of Tau Ceti is used, and
  `Suggested.lean` imports none.

## References

- Yousef Saad, *Iterative Methods for Sparse Linear Systems*, second edition, SIAM, 2003; the
  version distributed on the author's page at the University of Minnesota. Page numbers are the
  printed ones of that version.
- Jonathan Richard Shewchuk, *An Introduction to the Conjugate Gradient Method Without the
  Agonizing Pain*, Edition 1¼, School of Computer Science, Carnegie Mellon University, August 4,
  1994; available from the author's page.
- Attributions made in prose without a locator: Israel Gelfand (the spectral radius formula,
  1941); Edgar Reich (convergence of Gauss–Seidel for positive definite matrices, 1949); Alexander
  Ostrowski (convergence of SOR for `0 < ω < 2`, 1954); William Kahan (the bound
  `ρ ≥ |ω − 1|`, 1958); Magnus Hestenes and Eduard Stiefel (conjugate gradients, 1952); Gene Golub
  and Richard Varga (Chebyshev semi-iterative methods, 1961); Yousef Saad and Martin Schultz
  (GMRES, 1986).

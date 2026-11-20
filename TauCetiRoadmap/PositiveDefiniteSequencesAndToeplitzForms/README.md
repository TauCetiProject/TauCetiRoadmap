# Roadmap: positive-definite sequences and Toeplitz forms

**Summary.** A sequence `φ` on the integers is positive definite when every finite sum
`∑ cᵢ conj(cⱼ) φ(nᵢ − nⱼ)` is a nonnegative real number. Equivalently, every Toeplitz matrix
`(φ(j − k))` built from it is positive semidefinite. Herglotz's theorem, already in Tau Ceti, says
that these sequences are exactly the moment sequences `k ↦ ∫ zᵏ dμ(z)` of finite positive measures
on the unit circle. This roadmap develops the finite side of that picture: criteria that turn
positivity of a matrix or of a trigonometric polynomial into determinant or Fourier conditions,
and the solution of the truncated moment problem on the circle. Matrices are positive definite or
semidefinite in Mathlib's sense, which includes being Hermitian.

The headline theorems are these.

- *Sylvester's criterion.* A Hermitian matrix is positive definite if and only if all its leading
  principal minors are positive. It is positive semidefinite if and only if all its principal
  minors, not only the leading ones, are nonnegative.
- *Group matrices on a finite abelian group.* The matrix `(f(x − y))` indexed by the group is
  positive definite exactly when each Fourier coefficient of `f`, one for every character, is
  real and positive.
- *The Fejér–Riesz theorem.* A trigonometric polynomial of degree at most `n` that is nonnegative
  on the unit circle, and not identically zero there, is `|q|²` on the circle for exactly one
  polynomial `q` of degree at most `n` with no zero in the open unit disc and `q(0) > 0`.
- *The Carathéodory–Fejér theorem.* The Toeplitz matrix `(φ(j − k))` of size `N` is positive
  semidefinite if and only if the values `φ(k)` with `|k| < N` are moments `∑ w_z zᵏ` of positive
  weights at `r` distinct points of the circle, where `r` is the rank of the matrix. When the
  matrix is not positive definite, at most one finite measure on the circle has these moments.

Along the way the roadmap shows that a sequence is positive definite exactly when each of its
Toeplitz matrices is positive semidefinite, that all of them are positive definite exactly when the
sequence is conjugate-symmetric with positive Toeplitz determinants, and that a positive-definite
sequence with one singular Toeplitz matrix is the moment sequence of a measure with finitely many
atoms.

The roadmap builds on Mathlib's positive definite matrices, characters of finite abelian groups
and complex polynomials, and on Tau Ceti's positive-definite functions on abelian groups, with
its Herglotz theorem for the integers. It sits next to OperatorTheory's Toeplitz-operator
roadmap, which studies Toeplitz matrices as operators on Hardy space with the same entry
convention.

Layer 1 below proves Sylvester's criterion and its semidefinite form. Layer 2 treats finite
abelian groups. Layer 3 defines Toeplitz sections and moment sequences and uses Layer 1. Layer 4
proves the Fejér–Riesz theorem. Layer 5 solves the truncated trigonometric moment problem and
uses Layer 3.

## Conventions

- **Positivity of matrices.** For `𝕜` real or complex (`RCLike 𝕜`), `Matrix.PosSemidef A` says that
  `A` is Hermitian and `xᴴ A x ≥ 0` for every vector `x`; `Matrix.PosDef A` says that `A` is
  Hermitian and `xᴴ A x > 0` for every nonzero `x`. Both include the Hermitian condition, so no
  theorem below states it separately for a matrix that is assumed positive. Inequalities in `𝕜`
  and in `ℂ` use Mathlib's partial order of the `ComplexOrder` scope, in which `0 ≤ z` means that
  `z` is real and nonnegative and `0 < z` that it is real and positive. The empty matrix is
  positive definite and its determinant is `1`.
- **Minors.** For `A : Matrix (Fin n) (Fin n) 𝕜` and `k ≤ n`, the leading principal submatrix of
  size `k` is `A.submatrix (Fin.castLE hk) (Fin.castLE hk)`, its first `k` rows and columns; for a
  finite index type `ι` and `s : Finset ι`, the principal minor on `s` is Tau Ceti's
  `Matrix.principalMinor A s`, the determinant of `A.submatrix (Subtype.val : s → ι) Subtype.val`.
  The leading minor of size `0` and the principal minor on `∅` are `1`.
- **Positive-definite functions.** On an additive commutative group `G`, a function `f : G → ℂ` is
  positive definite in Tau Ceti's sense `TauCeti.IsPositiveDefiniteSub f`: for every finite family
  of points `vᵢ` and scalars `cᵢ`, `∑ᵢ ∑ⱼ cᵢ · conj(cⱼ) · f(vᵢ − vⱼ)` is real and nonnegative. Tau
  Ceti proves that this is the positive semidefiniteness of the matrix `(f(a − b))` indexed by `G`
  (`TauCeti.isPositiveDefiniteSub_iff_posSemidef`) and that it forces `f(−a) = conj(f(a))`
  (`TauCeti.IsPositiveDefiniteSub.map_neg`). Conjugate symmetry is therefore a consequence, never a
  hypothesis. The zero function is positive definite.
- **Characters and Fourier coefficients.** On a finite abelian group `G` the characters are
  Mathlib's `AddChar G ℂ`. The Fourier coefficient of `f` at `ψ` is the unnormalised sum
  `∑ₓ conj(ψ(x)) f(x)`. A positive normalising factor such as `1/|G|` does not change any sign
  condition below. Replacing `conj(ψ(x))` by `ψ(x)` replaces the coefficient at `ψ` by the
  coefficient at the character `conj ∘ ψ`, so the conditions "for every character" are the same
  under either convention. The group matrix `(f(x − y))` indexed by `G` is Mathlib's
  `Matrix.circulant f`, whose entry in row `x` and column `y` is `f(x − y)`.
- **Toeplitz sections and moments.** For `φ : ℤ → ℂ` and `n : ℕ`, the Toeplitz section
  `toeplitzSection φ n` is the `n × n` matrix with entry `φ(j − k)` in row `j` and column `k`
  (`j, k < n`). The other common convention, entry `φ(k − j)`, gives the transpose, which has the
  same positivity, rank and determinant. The unit circle is Mathlib's `Circle`, with its Borel
  structure. The moment sequence of a measure `μ` on it is `circleMoment μ k = ∫ zᵏ dμ(z)` for
  `k : ℤ`, the convention of Tau Ceti's Herglotz theorem; for a finite measure,
  `∑ⱼ ∑ₖ cⱼ conj(cₖ) circleMoment μ (j − k) = ∫ |∑ⱼ cⱼ zʲ|² dμ(z)`, since `z⁻¹ = conj z` on the
  circle.
- **Atomic representations.** A finite set `s` of points of the circle with weights `w : Circle → ℝ`
  that are positive on `s` represents `φ` on a set of indices when `φ(k) = ∑_{z ∈ s} w(z) zᵏ` for
  those `k`. It is the moment sequence of the measure `∑_{z ∈ s} w(z) δ_z`.
- **Trigonometric polynomials.** A trigonometric polynomial of degree at most `n` is
  `p(z) = ∑_{|k| ≤ n} a(k) zᵏ` on the circle, with `a : ℤ → ℂ` and the sum over
  `Finset.Icc (−n) n`; values of `a` outside that range play no role. A polynomial `q` is a Mathlib
  `Polynomial ℂ`, its degree `q.natDegree` (`0` for the zero polynomial), and `q(0)` is
  `q.coeff 0`.

## Layer 1: determinant criteria for positivity

### 1.1 Sylvester's criterion

Prove `posDef_iff_forall_det_leadingMinor_pos`: for `𝕜` real or complex and a Hermitian
`A : Matrix (Fin n) (Fin n) 𝕜`, `A` is positive definite if and only if the leading principal
minor of every size `k ≤ n` is positive (Lu, Theorem 3.17, p. 77, for real symmetric matrices;
the Hermitian case over `𝕜` is proved here by the route below).

Route: the forward direction holds because a leading principal submatrix of a positive definite
matrix is positive definite (`Matrix.PosDef.submatrix` with the injective map `Fin.castLE`) and a
positive definite matrix has positive determinant (`Matrix.PosDef.det_pos`). For the converse,
induct on `n`. Write `A` in block form with the leading block `A'` of size `n − 1`, the column
`b` and the corner entry `d`. By induction `A'` is positive definite, hence invertible, and
`det A = det A' · (d − bᴴ A'⁻¹ b)` (`Matrix.det_fromBlocks₁₁`). So the Schur complement
`d − bᴴ A'⁻¹ b` is real and positive, and `A` is congruent, by an invertible block unitriangular
matrix, to the block diagonal matrix with blocks `A'` and that complement. Congruence by an
invertible matrix preserves positive definiteness (`Matrix.IsUnit.posDef_star_left_conjugate_iff`).

**Checks.**
- `[[2, 1], [1, 1]]` has leading minors `1, 2, 1` and is positive definite; `[[1, 2], [2, 1]]` has
  leading minors `1, 1, −3` and the eigenvalue `−1`.
- Over `ℂ`, `[[2, i], [−i, 1]]` is Hermitian with leading minors `1, 2, 1` and eigenvalues
  `(3 ± √5)/2`, both positive.
- The Hermitian hypothesis is needed: `[[1, 2], [0, 1]]` has leading minors `1, 1, 1` and is not
  Hermitian, so it is not positive definite in Mathlib's sense.
- For `n = 0` the only leading minor is the empty one, `1`, and the empty matrix is positive
  definite.

*Needs:* Mathlib `Matrix.PosDef`, `Matrix.PosDef.submatrix`, `Matrix.PosDef.det_pos`,
`Matrix.det_fromBlocks₁₁`, `Matrix.IsUnit.posDef_star_left_conjugate_iff`, `Fin.castLE`.

### 1.2 Principal minors and semidefiniteness

Prove `posSemidef_iff_forall_principalMinor_nonneg`: for `𝕜` real or complex, a finite index
type `ι` and a Hermitian `A : Matrix ι ι 𝕜`, `A` is positive semidefinite if and only if the
principal minor `Matrix.principalMinor A s` on every subset `s` of `ι` is nonnegative. (Proved
here; the criterion is classical.)

Route: the forward direction holds because principal submatrices of a positive semidefinite matrix
are positive semidefinite (`Matrix.PosSemidef.submatrix`) with nonnegative determinant
(`Matrix.PosSemidef.det_nonneg`). For the converse, fix `t > 0`. For every `s`, the determinant of
the principal submatrix of `A + t · 1` on `s` is `∑_{k} t^(|s| − k) E_k`, where `E_k` is the sum of
the principal minors of size `k` of that submatrix (`Matrix.coeff_det_one_add_X_smul_eq_sum_minors`
after scaling by `t`). Every `E_k` is nonnegative and `E_0 = 1`, so the determinant is at least
`t^|s| > 0`. Reindex `ι` by `Fin (card ι)`; the leading minors of `A + t · 1` are among these
determinants, so `A + t · 1` is positive definite by 1.1. Letting `t` tend to `0`, `xᴴ A x` is a
limit of positive numbers.

**Checks.**
- Leading minors do not suffice: `diag(0, −1)` is Hermitian with leading minors `1, 0, 0`, all
  nonnegative, and is not positive semidefinite; its principal minor on the second index is `−1`.
- The Toeplitz matrix `[[0, 0, 1], [0, 0, 0], [1, 0, 0]]` has leading minors `1, 0, 0, 0` and
  eigenvalues `−1, 0, 1`; its principal minor on the first and third indices is `−1`.
- The Hermitian hypothesis is needed: `[[0, 1], [0, 0]]` has principal minors `1, 0, 0, 0` and is
  not Hermitian.
- `diag(0, 1)` is positive semidefinite and not positive definite: its principal minors are
  `1, 0, 1, 0`, and its leading minor of size `1` is `0`, so 1.1 fails for it as it should.
- On the empty index type the only principal minor is `1` and the empty matrix is positive
  semidefinite.

*Needs:* 1.1; Mathlib `Matrix.PosSemidef`, `Matrix.PosSemidef.submatrix`,
`Matrix.PosSemidef.det_nonneg`, `Matrix.coeff_det_one_add_X_smul_eq_sum_minors`; Tau Ceti
`Matrix.principalMinor`.

### Examples

The `2 × 2` matrices above over `ℝ` and `ℂ`, `diag(0, −1)`, `diag(0, 1)`, and the Toeplitz matrix
of size `3` with ones in the two corners.

### Dependencies

Mathlib `Matrix.PosDef`, `Matrix.PosSemidef`, `Matrix.PosDef.submatrix`,
`Matrix.PosSemidef.submatrix`, `Matrix.PosDef.det_pos`, `Matrix.PosSemidef.det_nonneg`,
`Matrix.det_fromBlocks₁₁`, `Matrix.IsUnit.posDef_star_left_conjugate_iff`,
`Matrix.coeff_det_one_add_X_smul_eq_sum_minors`, `Fin.castLE`; Tau Ceti `Matrix.principalMinor`.
No other layer.

## Layer 2: group matrices on finite abelian groups

Throughout this layer `G` is a finite additive commutative group (`[AddCommGroup G] [Fintype G]`);
it has at least one element. For `f : G → ℂ` write `f̂(ψ) = ∑ₓ conj(ψ(x)) f(x)` for its Fourier
coefficient at a character `ψ : AddChar G ℂ`.

### 2.1 Positive definite group matrices

Prove `posDef_circulant_iff_forall_sum_conj_mul_pos`: the group matrix `Matrix.circulant f`, with
entry `f(x − y)` in row `x` and column `y`, is positive definite if and only if `f̂(ψ)` is real and
positive for every character `ψ`. (Proved here.)

Route: for every character `ψ`, `(circulant f *ᵥ ψ)(x) = ∑_u f(u) ψ(x − u) = f̂(ψ) ψ(x)`, so `ψ` is
an eigenvector with eigenvalue `f̂(ψ)`. The characters are pairwise orthogonal for the inner
product `∑ₓ conj(u(x)) v(x)` and form a basis of `G → ℂ` (`AddChar.wInner_cWeight_eq_boole`,
`AddChar.complexBasis`). Hence the matrix is unitarily similar to the diagonal matrix of the
`f̂(ψ)`, and a matrix unitarily similar to a diagonal matrix is positive definite exactly when the
diagonal entries are real and positive.

The semidefinite counterpart is not a target: `f` is positive definite in Tau Ceti's sense exactly
when every `f̂(ψ)` is real and nonnegative. That is Bochner's theorem on the discrete group `G`,
`TauCeti.isPositiveDefiniteSub_iff_exists_pontryaginMeasureTransform_eq`, read through Fourier
inversion on `G`: the representing measure on the finite dual group has mass `f̂(ψ)/|G|` at `ψ`.
It also follows from the eigenvectors above and `TauCeti.isPositiveDefiniteSub_iff_posSemidef`.

**Checks.**
- On the trivial group the only character is trivial, its coefficient is `f(0)`, and the `1 × 1`
  matrix `[f(0)]` is positive definite exactly when `f(0)` is real and positive.
- On `ℤ/3`, `f = (1, i, −i)` satisfies `f(−x) = conj(f(x))` and `|f(x)| ≤ f(0)`, but its
  coefficients are `1 + 2 sin(2πa/3)` for `a = 0, 1, 2`, that is `1`, `1 + √3` and `1 − √3 < 0`; so
  its matrix is not even positive semidefinite.
- On `ℤ/3`, `f = (1, −1/2, −1/2)` has coefficients `0, 3/2, 3/2`: it is positive definite as a
  function, but its matrix is not positive definite, since the constant vector lies in the kernel.
- On `ℤ/4`, `f = (2, 1, 0, 1)` has coefficients `4, 2, 0, 2`; its matrix has eigenvalues
  `4, 2, 2, 0`, so it is positive semidefinite and singular, with kernel spanned by the character
  `x ↦ (−1)ˣ`.
- `f = δ₀`, the indicator of `0`, has all coefficients `1` and matrix the identity.

*Needs:* Mathlib `Matrix.circulant`, `AddChar`, `AddChar.wInner_cWeight_eq_boole`,
`AddChar.complexBasis`, `Matrix.PosDef`.

### Examples

The functions `(1, i, −i)` and `(1, −1/2, −1/2)` on `ℤ/3`, `(2, 1, 0, 1)` on `ℤ/4`, and `δ₀` on
`ℤ/2 × ℤ/2`, with their coefficients and the eigenvalues of their matrices.

### Dependencies

Mathlib `Matrix.circulant`, `AddChar`, `AddChar.wInner_cWeight_eq_boole`, `AddChar.complexBasis`,
`Matrix.PosDef`. No other layer.

## Layer 3: Toeplitz sections of positive-definite sequences

### 3.1 Toeplitz sections

Define `toeplitzSection φ n` for `φ : ℤ → ℂ` and `n : ℕ` as in the Conventions. Prove
`isPositiveDefiniteSub_iff_forall_posSemidef_toeplitzSection`: `φ` is positive definite if and
only if `toeplitzSection φ n` is positive semidefinite for every `n`. (Proved here.)

Route: each section is the principal submatrix of the matrix `(φ(a − b))` indexed by `ℤ` on
`{0, …, n − 1}`, so the forward direction is `TauCeti.isPositiveDefiniteSub_iff_posSemidef` with
`Matrix.PosSemidef.submatrix`. Conversely, a finite family of points `vᵢ` in `ℤ` and scalars `cᵢ`
can be translated so that every `vᵢ` lies in `{0, …, n − 1}` for some `n`, since `φ(vᵢ − vⱼ)` does
not change. Adding the scalars of equal points turns the sum into `xᴴ T x` for the section `T` of
size `n` and a vector `x`.

**Checks.**
- `φ = δ₀` has every section equal to the identity.
- No fixed number of sections suffices: the symmetric sequence with `φ(0) = 1`,
  `φ(±1) = φ(±2) = 0.9` and `φ(k) = 0` otherwise has sections of sizes `1`, `2` and `3` positive
  definite, with smallest eigenvalues `1`, `0.1`, `0.1`, while the section of size `4` has the
  eigenvalue `−0.405…`.
- The section of size `0` is the empty matrix for every `φ`.

*Needs:* Mathlib `Matrix.of`, `Matrix.PosSemidef.submatrix`; Tau Ceti
`TauCeti.isPositiveDefiniteSub_iff_posSemidef`.

### 3.2 Positive definite sections of a moment sequence

Define `circleMoment μ` for a measure `μ` on `Circle` as in the Conventions. Prove
`posDef_toeplitzSection_circleMoment_iff`: for a finite measure `μ` on the circle and `n : ℕ`,
the section of size `n` of its moment sequence is positive definite if and only if every finite set
`s` of points with `μ(sᶜ) = 0` has at least `n` points. (Proved here.)

Route: for a vector `c`, write `Q(c) = ∑_{j,k < n} c_j conj(c_k) φ(j − k)` for the form of the
section, which is Mathlib's `star x ⬝ᵥ T *ᵥ x` at the conjugate vector `x = conj c`. By the
identity of the Conventions, `Q(c) = ∫ |p_c|² dμ` with `p_c(z) = ∑_{j < n} c_j zʲ`. If a set `s`
of fewer than `n` points carries `μ`, the polynomial `∏_{z ∈ s} (X − z)` has degree less than `n`
and vanishes on `s`, so its coefficient vector `c` is nonzero with `Q(c) = 0`. Conversely, if
`Q(c) = 0` for some `c ≠ 0`, then `|p_c|²` vanishes `μ`-almost everywhere, and the nonzero
polynomial `p_c` of degree less than `n` has fewer than `n` roots (`Polynomial.card_roots'`); the
complement of its root set is `μ`-null.

**Checks.**
- `μ = δ₁` has moments `φ ≡ 1`; its sections are the all-ones matrices, of rank `1`, positive
  definite exactly for `n ≤ 1`.
- `μ = (δ₁ + δ₋₁)/2` has moments `1` at even and `0` at odd `k`; its sections of sizes `1` and `2`
  are identity matrices, and that of size `3`, `[[1, 0, 1], [0, 1, 0], [1, 0, 1]]`, is singular.
- Normalised arc length has moments `δ₀`, so every section is the identity; no finite set carries
  it.
- The zero measure has zero moments, and only its section of size `0` is positive definite.
- Finiteness is needed: for `μ = ∞ · δ₁` no `zᵏ` is integrable, so by Mathlib's convention every
  moment is `0` and the section of size `1` is not positive definite, while every finite set that
  carries `μ` contains `1`.

*Needs:* 3.1; Mathlib `MeasureTheory.integral`, `MeasureTheory.IsFiniteMeasure`,
`Polynomial.card_roots'`, `Circle.coe_zpow`.

### 3.3 Toeplitz determinants

Prove `forall_posDef_toeplitzSection_iff`: every section of `φ` is positive definite if and only if
`φ(−k) = conj(φ(k))` for every `k` and every Toeplitz determinant `det (toeplitzSection φ n)` is
real and positive. (Proved here from 1.1.)

Route: positive definite sections are Hermitian, which is the conjugate symmetry of `φ`, and have
positive determinant. Conversely, conjugate symmetry makes each section Hermitian, and the leading
principal submatrices of the section of size `n` are the sections of sizes `k ≤ n`; apply 1.1.

**Checks.**
- The Hermitian condition is needed: `φ(0) = 1`, `φ(−1) = 1/2` and `φ(k) = 0` otherwise give
  triangular sections with ones on the diagonal, so every Toeplitz determinant is `1`, and no
  section of size at least `2` is Hermitian.
- For `μ = (δ₁ + δ₋₁)/2` the determinants of sizes `0, 1, 2, 3, 4` are `1, 1, 1, 0, 0`.
- Nonnegative leading minors do not give semidefiniteness even for a Toeplitz section: the
  sequence with `φ(±2) = 1` and `φ(k) = 0` otherwise has section of size `3` with leading minors
  `1, 0, 0, 0` and eigenvalue `−1` (the Check of 1.2).

*Needs:* 1.1, 3.1; Mathlib `Matrix.PosDef.det_pos`, `Matrix.IsHermitian`.

### 3.4 Singular sections and finitely many atoms

Prove `exists_finset_of_not_posDef_toeplitzSection`: if `φ` is positive definite and its section of
size `n + 1` is not positive definite, then there are a set `s` of at most `n` points of the circle
and weights `w` positive on `s` with `φ(k) = ∑_{z ∈ s} w(z) zᵏ` for every `k : ℤ`; moreover the
section of every size `m` has rank `min m |s|`. (Proved here, from Tau Ceti's Herglotz theorem.)

Route: Herglotz's theorem (`TauCeti.exists_isFiniteMeasure_integral_zpow_eq`) gives a finite
measure `μ` on the circle with moments `φ`. By 3.2 some set of at most `n` points carries `μ`;
discard its points of mass `0` and let `w(z) = μ{z}`. The section of size `m` is `Vᴴ D V`, where
`D` is the diagonal matrix of the weights and `V` the `|s| × m` matrix with entry `conj(z)ʲ` in row
`z` and column `j`; the square Vandermonde minors of `V` are nonzero because the points are
distinct (`Matrix.det_vandermonde`), so `V` has rank `min m |s|`. With `D = Eᴴ E` for the diagonal
matrix `E` of the square roots of the weights, `Vᴴ D V = (E V)ᴴ (E V)` has the rank of `E V`
(`Matrix.rank_conjTranspose_mul_self`), which is that of `V`.

**Checks.**
- For `φ ≡ 1` (the moments of `δ₁`) the section of size `2` is singular, `s = {1}` and the ranks are
  `0, 1, 1, …`; for `(δ₁ + δ₋₁)/2` the ranks of sizes `0, …, 4` are `0, 1, 2, 2, 2`.
- Positive definiteness of `φ` is needed: `φ = −δ₀` has the section `[−1]` of size `1`, not
  positive definite, and is not of the form `∑_{z ∈ s} w(z) zᵏ` with positive weights, whose value
  at `0` is nonnegative.
- `φ = δ₀` has all sections positive definite, so the hypothesis never holds for it.

*Needs:* 3.2; Tau Ceti `TauCeti.exists_isFiniteMeasure_integral_zpow_eq`; Mathlib
`Matrix.det_vandermonde`, `Matrix.rank`, `Matrix.rank_conjTranspose_mul_self`.

### Examples

The moment sequences of `δ₁`, `(δ₁ + δ₋₁)/2`, normalised arc length and the zero measure, with their
Toeplitz sections, determinants and ranks; the sequence `(1, 0.9, 0.9)` whose first three sections
are positive definite and whose fourth is not.

### Dependencies

Layer 1. Mathlib `Matrix.of`, `Matrix.PosSemidef.submatrix`, `Matrix.PosDef.det_pos`,
`Matrix.IsHermitian`, `MeasureTheory.integral`, `MeasureTheory.IsFiniteMeasure`,
`Polynomial.card_roots'`, `Circle.coe_zpow`, `Matrix.det_vandermonde`, `Matrix.rank`,
`Matrix.rank_conjTranspose_mul_self`; Tau Ceti `TauCeti.isPositiveDefiniteSub_iff_posSemidef`,
`TauCeti.exists_isFiniteMeasure_integral_zpow_eq`.

## Layer 4: the Fejér–Riesz theorem

### 4.1 Factorization of nonnegative trigonometric polynomials

Prove `existsUnique_polynomial_fejerRiesz`: let `p(z) = ∑_{|k| ≤ n} a(k) zᵏ` be real and
nonnegative at every point of the circle and nonzero at some point. Then exactly one polynomial `q`
has degree at most `n`, no zero in the open unit disc, `q(0)` real and positive, and
`p(z) = |q(z)|²` at every point `z` of the circle (Dritschel–Rovnyak, the Fejér–Riesz theorem in
§1, p. 2, for existence with no zero in the open disc; the remark after the proof of Theorem 2.1,
p. 7, for uniqueness under `q(0) ≥ 0`, stated there for operator coefficients and here in the
scalar case).

Route (the one the source indicates): since `p` is real on the circle, `a(−k) = conj(a(k))` for
`|k| ≤ n`, by orthogonality of the powers `zᵏ` on the circle. The polynomial `zⁿ p(z)` of degree at
most `2n` has its nonzero roots in pairs `ζ` and `1/conj(ζ)`, and a root on the circle has even
multiplicity because `p ≥ 0` does not change sign there. Let `q` be a constant times the product of
`X − ζ` over the roots of modulus greater than `1` and over half of the roots on the circle, counted
with multiplicity (`Polynomial.Splits.eq_prod_roots`, `IsAlgClosed.splits`); the constant is fixed
by comparing `|q|²` with `p` at one point where `p ≠ 0`, and its phase by `q(0) > 0`. For
uniqueness, `|q|² = p` on the circle and the absence of zeros in the open disc determine the roots
of `q` with their multiplicities, and then the constant.

**Checks.**
- `2 + z + z⁻¹ = |1 + z|²` on the circle; the outer factor is `q = 1 + z`, whose root `−1` lies on
  the circle, which the statement allows.
- `5 + 2z + 2z⁻¹ = |2 + z|² = |1 + 2z|²`; only `2 + z` qualifies, since `1 + 2z` vanishes at
  `−1/2`, and `−(2 + z)` is excluded by `q(0) > 0`.
- Degree `0`: a constant `c > 0` gives `q = √c`. The degree of `q` can be smaller than `n`: with
  `n = 1` and `a = δ₀`, `q = 1`.
- The hypothesis that `p` is somewhere nonzero is needed: for `p = 0` the only `q` with
  `|q|² = 0` on the circle is `0`, which vanishes in the disc and has `q(0) = 0`.
- Nonnegativity is needed: `z + z⁻¹ = 2 cos θ` takes negative values, so it is not `|q|²`.

*Needs:* Mathlib `Polynomial`, `Polynomial.roots`, `Polynomial.Splits.eq_prod_roots`,
`IsAlgClosed.splits`, `IsAlgClosed.card_roots_eq_natDegree`, `Circle`, `Circle.coe_zpow`.

### Examples

`2 + z + z⁻¹`, `5 + 2z + 2z⁻¹`, `(2 + z + z⁻¹)²` with `q = (1 + z)²`, and a positive constant.

### Dependencies

Mathlib `Polynomial`, `Polynomial.roots`, `Polynomial.Splits.eq_prod_roots`, `IsAlgClosed.splits`,
`IsAlgClosed.card_roots_eq_natDegree`, `Circle`, `Circle.coe_zpow`. No other layer.

## Layer 5: the truncated trigonometric moment problem

### 5.1 The Carathéodory–Fejér decomposition

Prove `posSemidef_toeplitzSection_iff_exists_finset`: for `φ : ℤ → ℂ` and `N : ℕ`, the section of
size `N` is positive semidefinite if and only if there are a set `s` of points of the circle with
exactly as many points as the rank of the section, and weights `w` positive on `s`, with
`φ(k) = ∑_{z ∈ s} w(z) zᵏ` for every `|k| < N` (Yang–Xie, Theorem 1, p. 4, with its proof on
pp. 4–5; the result is Carathéodory and Fejér's of 1911, as that paper attributes it).

Route (Yang–Xie, pp. 4–5): an atomic representation makes the section `Vᴴ D V` as in 3.4, which is
positive semidefinite (of rank `min N |s|`). Conversely, let `r` be the rank. If `r < N`, write the
section as `W Wᴴ` with `W` of size `N × r`; the Toeplitz structure says that the rows `2, …, N` of
`W` and the rows `1, …, N − 1` have the same Gram matrix, so they differ by a unitary `r × r` matrix
`U` (two matrices `A`, `B` of the same size with `A Aᴴ = B Bᴴ` satisfy `A = B U` for a unitary `U`).
Then `φ(k) = w₁ Uᵏ w₁ᴴ` with `w₁` the first row, and diagonalising `U` gives `r` points of the
circle with positive weights, distinct because the rank is `r`. If `r = N`, pick a point `ζ` and let
`p = 1/(aᴴ T⁻¹ a)` for `a = (ζʲ)`; subtracting `p a aᴴ` leaves a positive semidefinite Toeplitz
section of rank `N − 1` (a Schur complement of the block matrix with blocks `1/p`, `aᴴ`, `a`, `T`,
`Matrix.PosDef.fromBlocks₁₁` and `Matrix.PosDef.fromBlocks₂₂`), which the first case decomposes, and
`ζ` is distinct from its points because the rank is `N`.

**Checks.**
- `N = 0`: the empty section has rank `0` and the empty set represents nothing, as required.
- `N = 1`: the section `[φ(0)]` is positive semidefinite exactly when `φ(0) ≥ 0`; if `φ(0) > 0`, one
  point of weight `φ(0)`, anywhere on the circle, represents it.
- `N = 2`, `φ = δ₀`: the identity of rank `2` is represented by `{1, −1}` with weights `1/2`, and
  also by `{i, −i}`; one point never suffices, since a section with one atom has rank at most `1`.
- `N = 3`, `φ(k) = (1 + (−1)ᵏ)/2`: the section has rank `2`, and `{1, −1}` with weights `1/2` is
  the representation.

*Needs:* 3.1, 3.4 (its Vandermonde rank computation); Mathlib `Matrix.rank`,
`Matrix.IsHermitian.spectral_theorem`, `Matrix.PosDef.fromBlocks₁₁`, `Matrix.PosDef.fromBlocks₂₂`,
`Matrix.det_vandermonde`.

### 5.2 The Carathéodory–Toeplitz theorem

Prove `posSemidef_toeplitzSection_iff_exists_measure`: the section of size `N` of `φ` is positive
semidefinite if and only if some finite measure `μ` on the circle has `circleMoment μ k = φ(k)` for
every `|k| < N`. In particular every positive semidefinite section is a section of a
positive-definite sequence on `ℤ`, the moment sequence of such a `μ`. (Proved here from 5.1.)

Route: a representation of 5.1 is the measure `∑_{z ∈ s} w(z) δ_z`. Conversely the quadratic form
of the section of the moments of `μ` is `∫ |p_c|² dμ ≥ 0`, as in 3.2.

**Checks.**
- `N = 1`, `φ(0) = 1`: `δ_ζ` for every `ζ` and normalised arc length all have the moment `1`, so
  the measure is not unique when the section is positive definite.
- `N = 2`, `φ(0) = 1`, `φ(±1) = 2`: the section `[[1, 2], [2, 1]]` has the eigenvalue `−1`, and no
  measure of mass `1` has a first moment of modulus `2`.

*Needs:* 5.1, 3.2 (its quadratic-form identity); Mathlib `MeasureTheory.Measure.dirac`; for the
sentence on positive-definite sequences, Tau Ceti
`TauCeti.isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq`.

### 5.3 Uniqueness for singular sections

Prove `measure_eq_of_not_posDef_toeplitzSection`: if the section of size `N` of `φ` is not positive
definite, then any two finite measures on the circle with moments `φ(k)` for `|k| < N` are equal.
(Proved here; Yang–Xie, Theorem 1, p. 4, state the uniqueness of the atomic decomposition in this
case.)

Route: both measures have the given section, which is not positive definite, so some nonzero `c`
has `∫ |p_c|² dμ = ∫ |p_c|² dν = 0`, with `p_c` of degree less than `N`, as in 3.2. Both measures
are carried by the set `Z` of roots of `p_c`, which has fewer than `N` points. Their masses at the
points of `Z` solve the linear system `∑_{z ∈ Z} m(z) zᵏ = φ(k)` for `0 ≤ k < |Z|`, whose
Vandermonde matrix is invertible (`Matrix.det_vandermonde`), so the masses agree.

**Checks.**
- `N = 3`, `φ(k) = (1 + (−1)ᵏ)/2`: the only representing measure is `(δ₁ + δ₋₁)/2`.
- `N = 1`, `φ(0) = 0`: the only finite measure of mass `0` is the zero measure.
- The hypothesis is needed: for `N = 1` and `φ(0) = 1` the section is positive definite and the
  measures of the Check of 5.2 differ.
- If the section is not positive semidefinite, no measure has these moments (5.2), and the
  statement holds vacuously.

*Needs:* 3.2; Mathlib `Matrix.det_vandermonde`, `Polynomial.card_roots'`,
`MeasureTheory.Measure.ext`.

### Examples

The sections of `δ₀` of sizes `1` and `2` with their many representations; the section of size `3`
of the moments of `(δ₁ + δ₋₁)/2` with its unique one; the indefinite section `[[1, 2], [2, 1]]`.

### Dependencies

Layer 3. Mathlib `Matrix.rank`, `Matrix.IsHermitian.spectral_theorem`,
`Matrix.PosDef.fromBlocks₁₁`, `Matrix.PosDef.fromBlocks₂₂`, `Matrix.det_vandermonde`,
`MeasureTheory.Measure.dirac`, `MeasureTheory.Measure.ext`, `Polynomial.card_roots'`; Tau Ceti
`TauCeti.isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq`.

## Scope and ownership

This roadmap owns the targets stated above: Sylvester's criterion and the principal-minor criterion
for semidefiniteness (Layer 1); the coefficient criterion for positive definite group matrices
on finite abelian groups (Layer 2); Toeplitz sections, their positivity, Toeplitz determinants and
the finitely atomic case (Layer 3); the Fejér–Riesz theorem with uniqueness of the outer factor
(Layer 4); the Carathéodory–Fejér decomposition, the Carathéodory–Toeplitz theorem and uniqueness
for singular sections (Layer 5).

Already in the libraries and therefore not targets:

- Mathlib's positive definite and semidefinite matrices with their submatrix, determinant, Schur
  complement and congruence lemmas cited above, and the Schur product theorem
  (`Matrix.PosSemidef.hadamard`, `Matrix.PosDef.hadamard`): the entrywise product of positive
  semidefinite matrices is positive semidefinite.
- Tau Ceti's positive-definite functions on additive commutative groups
  (`TauCeti.IsPositiveDefiniteSub`), their matrix form, conjugate symmetry and closure under sums
  and products; that every character is positive definite (`PontryaginDual.isPositiveDefiniteSub`).
- Tau Ceti's Herglotz theorem for `ℤ` (`TauCeti.exists_isFiniteMeasure_integral_zpow_eq` and the
  characterization `TauCeti.isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq`),
  which 3.4 consumes, and Bochner's theorem on discrete abelian groups
  (`TauCeti.isPositiveDefiniteSub_iff_exists_pontryaginMeasureTransform_eq`). For a finite group
  the latter, read through Fourier inversion, is the statement that `f` is positive definite
  exactly when its Fourier coefficients are real and nonnegative; it is therefore not a target
  (see 2.1). The strict form, positive definiteness of the group matrix, is not in the libraries
  and is 2.1.
- Tau Ceti's principal minors (`Matrix.principalMinor`, in
  `TauCeti/LinearAlgebra/Matrix/Minor.lean`), in which 1.2 is stated.
- Tau Ceti's Herglotz representation of holomorphic functions with nonnegative real part on the
  unit disc (`TauCeti.exists_isFiniteMeasure_eq_herglotzTransform_add`, in
  `TauCeti/Analysis/Complex/Herglotz.lean`); nothing here restates it. The Schur product theorem
  is in `Mathlib/Analysis/Matrix/Order.lean`, Bochner's theorem on discrete abelian groups in
  `TauCeti/Analysis/Bochner/DiscreteGroup.lean`, and the positive definiteness of characters in
  `TauCeti/Analysis/PositiveDefinite/AdditiveCharacter.lean`.

Left to other roadmaps:

- Completed/OneParameterSemigroups, Part C, owns continuous positive-definite functions on
  finite-dimensional spaces, Bochner's theorem there and the Berg–Christensen–Ressel theorem.
  FactorRigidity, 4.1, owns positive-definite functions on general groups, the GNS construction
  and Schoenberg's theorem. Nothing here restates them.
- OperatorTheory/ToeplitzOperators owns Toeplitz operators on Hardy space, their symbols, the
  Brown–Halmos theorem and the stability of finite sections (its Layers 2–5). The sections here are
  finite matrices of a sequence, studied for positivity; the two share the entry convention
  "`(i, j)` holds the coefficient of index `i − j`", and nothing is restated.
- SamplingAndDiscreteFourierAnalysis, 2.1 and 2.2, diagonalizes circulant matrices on `ℤ/N` by the
  discrete Fourier transform and computes their eigenvalues. For `G = ℤ/N` the matrix of 2.1 here
  is such a circulant matrix; 2.1 here is a statement about positivity on every finite abelian
  group, and this roadmap does not depend on that one.
- SchattenClassesAndSchurMultipliers treats Schur multipliers, including Toeplitz symbols on `ℝⁿ`
  (its Layer 9); KernelsAndSpectralMethods treats kernel mean embeddings and characteristic
  kernels (its Layers 7 and 8). Neither subject is treated here.

Outside the scope: the Hamburger and Stieltjes moment problems and Hankel matrices; Szegő's limit
theorems, orthogonal polynomials on the unit circle and their recurrence coefficients; the Schur
algorithm and Nevanlinna–Pick interpolation; Fejér–Riesz factorization with matrix or operator
coefficients and in several variables; positive-definite functions on nonabelian groups.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef` (Hermitian and
  `0 ≤ ∑ᵢ ∑ⱼ star xᵢ Mᵢⱼ xⱼ` for every finitely supported `x`); `Matrix.PosDef` (Hermitian and the
  same sum positive for `x ≠ 0`); `Matrix.PosSemidef.submatrix` (any reindexing map);
  `Matrix.PosDef.submatrix` (an injective map); `Matrix.PosDef.det_pos`;
  `Matrix.IsUnit.posDef_star_left_conjugate_iff` (for a unit `U`, `star U * A * U` is positive
  definite exactly when `A` is); `Matrix.PosDef.fromBlocks₁₁` (for `A` positive definite and
  invertible, `fromBlocks A B Bᴴ D` is positive semidefinite exactly when `D − Bᴴ A⁻¹ B` is);
  `Matrix.PosDef.fromBlocks₂₂` (the same with the roles of the diagonal blocks exchanged).
- `Mathlib/Analysis/Matrix/PosDef.lean`: `Matrix.PosSemidef.det_nonneg` (over `RCLike 𝕜`).
- `Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`: `Matrix.det_fromBlocks₁₁`
  (`det (fromBlocks A B C D) = det A * det (D − C ⅟A B)` for invertible `A`).
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`:
  `Matrix.coeff_det_one_add_X_smul_eq_sum_minors` (the coefficient of `Xᵏ` in `det (1 + X M)` is
  the sum of the principal minors of size `k`).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.spectral_theorem`.
  `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank`, `Matrix.rank_conjTranspose_mul_self`
  (`rank (Aᴴ A) = rank A` over a star-ordered field).
  `Mathlib/LinearAlgebra/Vandermonde.lean`: `Matrix.det_vandermonde`
  (`det (vandermonde v) = ∏ᵢ ∏_{j > i} (v j − v i)`). Lean core: `Fin.castLE` (the embedding of
  `Fin k` into `Fin n` for `k ≤ n` that keeps values).
- `Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean`: `AddChar.wInner_cWeight_eq_boole`
  (distinct characters are orthogonal, each has norm `1` for the normalised inner product).
  `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean`: `AddChar.complexBasis` (for
  finite `α`, the characters form a basis of `α → ℂ`).
- `Mathlib/Analysis/Complex/Circle.lean`: `Circle`, `Circle.coe_zpow`. Measure theory:
  `MeasureTheory.integral` (`0` for a nonintegrable function), `MeasureTheory.IsFiniteMeasure`,
  `MeasureTheory.Measure.dirac`, `MeasureTheory.Measure.ext`.
- Polynomials: `Polynomial.roots`, `Polynomial.card_roots'`
  (`Mathlib/Algebra/Polynomial/Roots.lean`: at most `natDegree` roots with multiplicity);
  `Polynomial.Splits.eq_prod_roots` (`Mathlib/Algebra/Polynomial/Splits.lean`);
  `IsAlgClosed.splits`, `IsAlgClosed.card_roots_eq_natDegree`
  (`Mathlib/FieldTheory/IsAlgClosed/Basic.lean`).
- `Mathlib/LinearAlgebra/Matrix/Circulant.lean`: `Matrix.circulant` (`circulant f x y = f (x − y)`).

### From Tau Ceti

- `TauCeti/Analysis/PositiveDefinite/AddGroup.lean`: `TauCeti.IsPositiveDefiniteSub F` (every
  `∑ᵢ ∑ⱼ cᵢ conj(cⱼ) F(vᵢ − vⱼ)` over a finite family is real and nonnegative);
  `TauCeti.isPositiveDefiniteSub_iff_posSemidef` (equivalently the matrix `(F(a − b))` indexed by
  the whole group is positive semidefinite); `TauCeti.IsPositiveDefiniteSub.map_neg`
  (`F(−a) = conj(F(a))`).
- `TauCeti/Analysis/Bochner/Herglotz.lean`: `TauCeti.exists_isFiniteMeasure_integral_zpow_eq` (a
  positive-definite `φ : ℤ → ℂ` has a finite measure `μ` on `Circle` with
  `φ n = ∫ z ^ n dμ` for every `n : ℤ`);
  `TauCeti.isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq` (the converse too),
  used in 5.2.
- `TauCeti/LinearAlgebra/Matrix/Minor.lean`: `Matrix.principalMinor A s` (the determinant of the
  submatrix of `A` on the rows and columns indexed by the finite set `s`).
- `TauCeti/Analysis/Bochner/DiscreteGroup.lean`:
  `TauCeti.isPositiveDefiniteSub_iff_exists_pontryaginMeasureTransform_eq` (Bochner's theorem on
  a discrete abelian group), cited in 2.1 and in the scope section above.

## References

- Jun Lu, *Numerical Matrix Decomposition*, arXiv:2107.02579, version 7 (December 2024),
  Theorem 3.17 (Sylvester's criterion for real symmetric matrices), p. 77.
- Michael A. Dritschel and James Rovnyak, *The operator Fejér–Riesz theorem*, arXiv:0903.3639,
  version 1 (March 2009), published in *A Glimpse at Hilbert Space Operators*, Birkhäuser, 2010:
  §1, p. 2 (the classical Fejér–Riesz theorem); Theorem 2.1, p. 4, and the remark on uniqueness,
  p. 7.
- Zai Yang and Lihua Xie, *Frequency-selective Vandermonde decomposition of Toeplitz matrices with
  applications*, arXiv:1605.02431, version 3 (July 2017): Theorem 1, p. 4, and its proof, pp. 4–5.
- The theorems of Fejér (1916) and F. Riesz (1916) and of Carathéodory and Fejér (1911) are named as
  the two papers above attribute them; Herglotz's theorem (1911) as Tau Ceti's file attributes it.
  Sylvester's criterion, the principal-minor criterion and the Carathéodory–Toeplitz theorem carry
  their customary names; each is proved in the layers above from the cited statements.

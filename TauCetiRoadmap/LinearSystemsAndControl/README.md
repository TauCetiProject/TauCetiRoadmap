# Roadmap: linear systems and control

**Summary.** This roadmap develops the structural theory of finite-dimensional linear
time-invariant control systems: the discrete-time system `x(k+1) = A x(k) + B u(k)` and the
continuous-time system `x' = A x + B u`, with state matrix `A` of size `n × n`, input matrix `B`
of size `n × m` and output matrix `C` of size `p × n`. The algebraic part (controllability,
observability, feedback and the characteristic polynomial) is stated over an arbitrary field, with
no restriction on the sizes: there may be no states, no inputs or no outputs. The analytic part
(the continuous-time system, stability and the Lyapunov and Stein equations) is stated for real
matrices, with eigenvalues taken in the complex numbers. Every target is a theorem about matrices,
subspaces, polynomials and solutions of differential equations; no design procedure is specified.

The headline theorems are these.

- *The Kalman and Hautus criteria.* The pair `(A, B)` is controllable, meaning that the columns
  of `B, AB, A²B, …` span the state space, if and only if `[B, AB, …, A^(n−1)B]` has rank `n`,
  if and only if `[μI − A, B]` has rank `n` for every `μ` in an algebraically closed field
  containing the entries.
- *The pole-shifting theorem.* Over any field, `(A, B)` is controllable if and only if every monic
  polynomial of degree `n` is the characteristic polynomial of `A + BF` for some `m × n` matrix `F`.
  For a controllable pair with one input, the feedback that assigns a given polynomial is
  unique, and Ackermann's formula gives it.
- *Steering.* For real matrices and any time `T > 0`, `(A, B)` is controllable if and only if
  every state can be steered to every state at time `T` by a continuous input, if and only if the
  controllability Gramian `∫₀ᵀ exp(sA) B Bᵀ exp(sAᵀ) ds` is positive definite.
- *Lyapunov's theorem.* A real matrix `A` has all its eigenvalues in the open left half-plane if
  and only if for every positive definite `Q` the equation `AᵀP + PA = −Q` has a positive definite
  solution `P`; the solution is then unique and equals `∫₀^∞ exp(tAᵀ) Q exp(tA) dt`. When
  `(A, C)` is observable, the eigenvalues of `A` lie in the open left half-plane if and only if
  the equation with `Q = CᵀC` has a positive definite solution. For the Stein equation
  `AᵀPA − P = −Q` and the open unit disc the first statement holds again, the unique solution
  being `∑ (Aᵀ)^k Q A^k`.

The roadmap builds on Mathlib's linear algebra of matrices (rank, the characteristic polynomial
and the Cayley–Hamilton theorem, positive definite matrices, the matrix exponential) and on Tau
Ceti's linear differential equations with a continuous forcing term and its invariance of the rank
under extension of the field. The Sylvester equations of the operator-theory roadmaps concern
self-adjoint operators, whereas the Lyapunov equation here has an arbitrary real `A`. Linear-quadratic
optimal control, the Riccati equations and the Kalman filter, which use the notions defined here,
are not treated here.

## How to read the build

Layer 1 below defines the reachable subspace and controllability over a field and proves the
Kalman rank condition, the description of the states reachable by the discrete-time system, the
invariance of controllability under feedback and change of coordinates, the Hautus test and the
Kalman decomposition. Layer 2 defines observability and proves its duality with controllability;
it depends on Layer 1. Layer 3 proves Ackermann's formula and the pole-shifting theorem; it
depends on Layer 1. Layer 4 treats the continuous-time system over the reals: the controllability
Gramian and steering; it depends on Layer 1. Layer 5 treats Hurwitz and Schur stable matrices,
the Lyapunov and Stein equations and stabilizability; its sections 5.1, 5.2 and 5.4 depend on no
other layer, 5.3 depends on Layers 1 and 2, and 5.5 on Layers 1 and 3. Within a layer the sections are
in build order.

## Conventions

- **Systems.** `K` is a field; `n`, `m`, `p` are finite types with decidable equality (states,
  inputs, outputs), any of which may be empty, and `N = Fintype.card n`. States are vectors
  `x : n → K`, and a matrix acts on them by `A *ᵥ x`. The data are `A : Matrix n n K`,
  `B : Matrix n m K` and `C : Matrix p n K`. A single input is a vector `b : n → K`, viewed as the
  matrix `replicateCol Unit b` with one column. Sizes "`n × m`" in prose mean these types.
- **Feedback.** The state feedback `u = F x` with `F : Matrix m n K` gives the closed-loop matrix
  `A + B * F`; for one input `u = f ⬝ᵥ x` gives `A + vecMulVec b f`, where `vecMulVec b f` is the
  matrix with entries `b i * f j`. Sources that write `u = −K x` and `A − B K` state the same
  theorems, since every statement quantifies over all feedback matrices.
- **Eigenvalues of real matrices.** For `A : Matrix n n ℝ`, the eigenvalues are the elements of
  `spectrum ℂ (A.map (algebraMap ℝ ℂ))`, the roots in `ℂ` of the characteristic polynomial
  (Mathlib `Matrix.mem_spectrum_iff_isRoot_charpoly`). Real eigenvalues alone do not suffice:
  the Checks of 1.5 and 5.1 give real matrices whose behaviour is decided by eigenvalues off the
  real line.
- **Transposes.** Real matrices use the transpose `Aᵀ`; Mathlib's `Matrix.PosDef` and
  `Matrix.PosSemidef` include symmetry. Complex systems, whose statements would use the conjugate
  transpose, are not treated.
- **Exponentials and integrals.** The matrix exponential is Mathlib's `NormedSpace.exp`, which
  needs only the product topology on matrices. Mathlib puts no global norm on `Matrix n n ℝ`, so
  matrix-valued integrals are written entrywise, `Matrix.of fun i j => ∫ …`. Infinite sums of
  matrices are `tsum` in the product topology.
- **Junk values.** No statement uses the inverse of a matrix that may be singular (Ackermann's
  formula is stated without inverses), an interval integral with reversed bounds (the times are
  positive), an improper integral without integrability (the integral formula of 5.2 assumes a
  Hurwitz matrix) or a `tsum` without summability (the series of 5.4 assumes a Schur stable
  matrix). The Checks of 4.1, 5.2 and 5.4 show what goes wrong without these hypotheses.

## Layer 1: controllability over a field

### 1.1 The reachable subspace and the controllability matrix

Define `reachableSubspace`, with `reachableSubspace A B : Submodule K (n → K)`, as the supremum over `k : ℕ` of the ranges of
`A ^ k * B`, that is, the span of all columns of `B, AB, A²B, …`; it is the smallest
`A`-invariant subspace containing the columns of `B`. Define `IsControllable`: `IsControllable A B` means that the
reachable subspace is the whole space `⊤`. Define the controllability matrix
`ctrbMatrix`, with `ctrbMatrix A B : Matrix n (Fin N × m) K`, whose column `(k, j)` is column `j` of `A ^ k * B`; it
is `[B, AB, …, A^(N−1)B]` with the columns grouped by power (Sontag, Definition 3.3.1 and
Lemma 3.3.2, p. 92).

**Checks.**
- For the double integrator `A = [[0, 1], [0, 0]]` and `b = e₂`, the controllability matrix is
  `[[0, 1], [1, 0]]`, of rank `2`, and the pair is controllable. With `b = e₁` instead,
  `A b = 0`, the controllability matrix is `[[1, 0], [0, 0]]`, and the reachable subspace is the
  line spanned by `e₁`.
- For `A` the `2 × 2` identity and `b = e₁` the reachable subspace is the line spanned by `e₁`:
  a definition that adds the range of `A` to that of `B` would give the whole plane.
- With no states every pair is controllable; with states but no inputs the reachable subspace is
  `0` and no pair is controllable.

*Needs:* Mathlib `Matrix.mulVecLin`, `LinearMap.range`. (Definitions.)

### 1.2 The Kalman rank condition

Prove that the column space of `ctrbMatrix A B` is `reachableSubspace A B`, that is, that the
powers `A ^ k` with `k ≥ N` add nothing, and deduce `isControllable_iff_rank_ctrbMatrix`:
`(A, B)` is controllable if and only if `(ctrbMatrix A B).rank = N` (Sontag, Theorem 2, p. 88,
and Lemma 3.3.2, p. 92; Åström–Murray, Theorem 7.1, p. 7-4, for real continuous-time systems).

Route: by the Cayley–Hamilton theorem `A ^ N` is a linear combination of `A ^ j` for `j < N`,
since the characteristic polynomial is monic of degree `N`; by induction so is every `A ^ k`, and
each column of `A ^ k * B` lies in the span of the columns of `A ^ j * B` with `j < N`. The rank of
a matrix is the dimension of its column space, and a subspace of `n → K` of dimension `N` is the
whole space.

**Checks.**
- The bound `N` cannot be lowered: for the double integrator with `b = e₂`, the columns of
  `A ^ j b` with `j < 1` span only the line of `e₂`, while `A b = e₁` completes a basis.
- For `N = 1`, `A = [a]` and `B = [b₁, …, b_m]`, the pair is controllable exactly when some
  `bⱼ ≠ 0`, whatever `a` is.

*Needs:* 1.1; Mathlib `Matrix.aeval_self_charpoly`, `Matrix.charpoly_monic`,
`Matrix.charpoly_natDegree_eq_dim`, `Matrix.rank`, `Submodule.eq_top_of_finrank_eq`.
(Proved here.)

### 1.3 The discrete-time system

Define `discreteState`, with `discreteState A B x₀ u : ℕ → n → K`, by `discreteState A B x₀ u 0 = x₀` and
`discreteState A B x₀ u (k + 1) = A *ᵥ discreteState A B x₀ u k + B *ᵥ u k`, the state of the
discrete-time system with initial state `x₀` and input sequence `u : ℕ → m → K`.

- `setOf_discreteState_zero`: for every `k`, the set of states reached from `0` at time `k` is the
  span of the columns of `A ^ j * B` for `j < k`.
- `isControllable_iff_forall_exists_discreteState`: `(A, B)` is controllable if and only if for
  every `x₀` and `x₁` some input sequence gives `discreteState A B x₀ u N = x₁`.

(Sontag, Corollary 3.2.10 (a) and Theorem 2, p. 88.)

Route: by induction, `discreteState A B x₀ u k = A ^ k x₀ + ∑_{i<k} A ^ (k−1−i) B u(i)`, and the
inputs at different times are independent, which gives the first statement. For the second, `x₁`
is reached from `x₀` at time `N` exactly when `x₁ − A ^ N x₀` is reached from `0`, and by 1.2 the
states reached from `0` at time `N` form the reachable subspace.

**Checks.**
- For the double integrator with `b = e₂`, starting from `0` with inputs `u₀, u₁`, the states
  are `(0, u₀)` at time `1` and `(u₀, u₁)` at time `2`: one step reaches only a line, two steps
  reach the plane.
- At time `0` only the state `0` is reached from `0`, and the supremum over the empty index type
  `Fin 0` is the zero subspace.
- With `B = 0`, the only state reached from `x₀` at time `N` is `A ^ N x₀`.

*Needs:* 1.1, 1.2; Mathlib `Matrix.mulVecLin`. (Proved here.)

### 1.4 Invariance under feedback and change of coordinates

- `reachableSubspace_add_mul`: for every `F : Matrix m n K`,
  `reachableSubspace (A + B * F) B = reachableSubspace A B` (Sontag, Lemma/Exercise 5.1.8, p. 185).
- `isControllable_units_conj_iff`: for an invertible `P : Matrix n n K`, an invertible
  `G : Matrix m m K` and any `F`, the pair `(P (A + B F) P⁻¹, P B G)` is controllable if and only
  if `(A, B)` is (Sontag, Lemma/Exercise 5.1.2, p. 184, for the change of state coordinates; the
  change of input coordinates and the combination are proved here).

Route: by induction on `k`, every column of `(A + B F) ^ k B` is a combination of columns of
`A ^ j B` with `j ≤ k`, since `(A + B F) v = A v + B (F v)`; this gives one inclusion, and the
other follows by applying it to `A + B F` and `−F`. For the second statement,
`(P A' P⁻¹) ^ k P B G = P A' ^ k B G`, right multiplication by the invertible `G` does not change
a column space, and `P` maps the reachable subspace of `(A', B)` onto that of
`(P A' P⁻¹, P B G)`.

**Checks.**
- Feedback cannot move an uncontrollable eigenvalue: for `A = diag(1, 2)` and `b = e₁`, the
  characteristic polynomial of `A + b f` is `(X − 1 − f₁)(X − 2)` for every `f = (f₁, f₂)`.
- The input change must be invertible: with `G = 0` no pair with states is controllable.
- For the double integrator with `b = e₂` and `f = (−a, −c)`, `A + b f = [[0, 1], [−a, −c]]` is
  controllable for every `a`, `c`.

*Needs:* 1.1; Mathlib `Matrix.mulVecLin`. (Proved here, apart from the cited exercises.)

### 1.5 The Hautus test

Prove `isControllable_iff_forall_rank_fromCols`: for an algebraically closed field `L` with an
algebra map from `K`, `(A, B)` is controllable if and only if for every `μ : L` the `N × (N + m)`
matrix `fromCols (μ • 1 − A') B'` has rank `N`, where `A'` and `B'` are `A` and `B` with entries
mapped into `L` (Sontag, Lemma 3.3.7, p. 94). For `μ` that is not an eigenvalue of `A'` the rank
condition holds automatically, so only the eigenvalues matter.

Route: the rank of the controllability matrix is unchanged by mapping the entries to `L`, so
controllability may be tested over `L`. If the rank of `[μI − A', B']` is less than `N`, a nonzero
row vector `w` satisfies `w A' = μ w` and `w B' = 0`, so `w A' ^ k B' = 0` for all `k` and the pair
is not controllable. Conversely, if the pair is not controllable, the Kalman decomposition of 1.6
has a second block `A₂₂` of positive size `s`; a left eigenvector of `A₂₂` over `L`, padded with zeros, is a
left eigenvector of `P⁻¹ A' P` orthogonal to `P⁻¹ B'`, and the rank drops at its eigenvalue.

**Checks.**
- For `A` the `2 × 2` identity and `b = (1, 1)`, the pair is not controllable (`A b = b`), and at
  `μ = 1` the matrix `[0, b]` has rank `1`.
- For `A = diag(1, 2)` and `b = (1, 1)` the pair is controllable, and at `μ = 1` the matrix
  `[[0, 0, 1], [0, −1, 1]]` has rank `2`.
- The field must be algebraically closed: for the real `3 × 3` matrix `A` with blocks
  `[[0, 1], [−1, 0]]` and `[1]` and `b = e₃`, the pair is not controllable, yet `[μI − A, b]` has
  rank `3` for every real `μ`; at `μ = i` the rank is `2`.

*Needs:* 1.2, 1.6; Tau Ceti `Matrix.rank_map`; Mathlib `Matrix.fromCols`,
`Module.End.exists_eigenvalue`, `Matrix.rank_transpose`. (Proved here, after Sontag.)

### 1.6 The Kalman controllability decomposition

Prove `exists_kalmanDecomposition`: there are `r`, `s`, a bijection `e : Fin r ⊕ Fin s ≃ n`, an
invertible `P : Matrix n n K` and blocks `A₁₁`, `A₁₂`, `A₂₂`, `B₁` such that `r` is the dimension
of the reachable subspace, `P⁻¹ A P` reindexed by `e` is `fromBlocks A₁₁ A₁₂ 0 A₂₂`, `P⁻¹ B`
reindexed by `e` is `fromRows B₁ 0`, and `(A₁₁, B₁)` is controllable (Sontag, Lemma 3.3.3 and
Lemma/Exercise 3.3.4, p. 93). The characteristic polynomial of `A` is then the product of those of
`A₁₁` and `A₂₂` (Mathlib `Matrix.charpoly_fromBlocks_zero₂₁` with
`Matrix.charpoly_units_conj` and `Matrix.charpoly_reindex`).

Route: take as the first `r` columns of `P` a basis of the reachable subspace and complete it to a
basis of `n → K`. The reachable subspace is `A`-invariant and contains the columns of `B`, which
gives the zero blocks. The reachable subspace of `(A₁₁, B₁)` is the image under `P⁻¹` of that of
`(A, B)`, restricted to the first block, hence all of `Fin r → K`.

**Checks.**
- For `A = diag(1, 2)` and `b = e₁`: `r = 1`, `s = 1`, `P = 1`, `A₁₁ = [1]`, `A₁₂ = [0]`,
  `A₂₂ = [2]` and `B₁ = [1]`.
- A controllable pair has `s = 0`; a pair with no inputs has `r = 0`.

*Needs:* 1.1, 1.4; Mathlib `Module.Basis.extend`, `Matrix.fromBlocks`,
`Matrix.fromRows`, `Matrix.reindex`, `Matrix.charpoly_fromBlocks_zero₂₁`,
`Matrix.charpoly_units_conj`, `Matrix.charpoly_reindex`. (Proved here, after Sontag.)

### Examples

The double integrator with each choice of input vector; the diagonal matrix `diag(1, 2)` with the
input `e₁` (uncontrollable) and `(1, 1)` (controllable); the real `3 × 3` matrix whose
uncontrollable eigenvalues are `±i`.

### Dependencies

Mathlib `Matrix.mulVecLin`, `LinearMap.range`, `Matrix.aeval_self_charpoly`,
`Matrix.charpoly_monic`, `Matrix.charpoly_natDegree_eq_dim`, `Matrix.rank`,
`Submodule.eq_top_of_finrank_eq`, `Matrix.fromCols`, `Module.End.exists_eigenvalue`,
`Matrix.rank_transpose`, `Module.Basis.extend`, `Matrix.fromBlocks`, `Matrix.fromRows`,
`Matrix.reindex`, `Matrix.charpoly_fromBlocks_zero₂₁`, `Matrix.charpoly_units_conj`,
`Matrix.charpoly_reindex`; Tau Ceti `Matrix.rank_map`. No other layer.

## Layer 2: observability and duality

### 2.1 The unobservable subspace

Define `unobservableSubspace`, with `unobservableSubspace A C : Submodule K (n → K)`, as the intersection over `k : ℕ` of the
kernels of `C * A ^ k`: the initial states whose free output `C A ^ k x` vanishes at every time.
Define `IsObservable`: `IsObservable A C` means that this subspace is `0` (Sontag, Theorem 23 and
Corollary 6.2.4, p. 271, where observability is characterized by the triviality of this kernel).

**Checks.**
- For the double integrator `A = [[0, 1], [0, 0]]` and `C = [1, 0]`, the outputs are `x₁` and
  `x₂`, and the pair is observable. With `C = [0, 1]`, `C A = 0` and the unobservable subspace is
  the line spanned by `e₁`.
- With no outputs the unobservable subspace is the whole space; with no states every pair is
  observable.

*Needs:* Mathlib `Matrix.mulVecLin`, `LinearMap.ker`. (Definitions.)

### 2.2 Duality

- `isObservable_iff_isControllable_transpose`: `(A, C)` is observable if and only if `(Aᵀ, Cᵀ)`
  is controllable (Sontag, Theorems 23 and 24, p. 271; Åström–Murray, Theorem 8.1, p. 8-3, for the
  rank form for real continuous-time systems).
- `isObservable_iff_injective`: `(A, C)` is observable if and only if the map sending `x` to the
  `N` outputs `C A ^ k x`, `k < N`, is injective (Sontag, Corollary 6.2.4, p. 271).

Route: by Cayley–Hamilton, as in 1.2, the unobservable subspace is the kernel of the stacked
matrix with blocks `C A ^ k`, `k < N`, which proves the second statement. That matrix is the
transpose of `ctrbMatrix Aᵀ Cᵀ` up to the order of the indices, because `(C A ^ k)ᵀ = (Aᵀ) ^ k Cᵀ`;
a matrix and its transpose have the same rank, and the kernel of a matrix with `N` columns is `0`
exactly when its rank is `N`. The argument works over every field. Over every field each of the
two subspaces is the annihilator of the other for the dot product; over the reals they are
moreover complementary, but over `𝔽₂` they need not be: for `A = 0` and `C = [1, 1]` both are
the line spanned by `(1, 1)`.

**Checks.**
- The transpose of `A` matters: for the double integrator and `C = [1, 0]`, the pair `(A, C)` is
  observable and `(Aᵀ, Cᵀ)` is controllable, but `(A, Cᵀ)` is not controllable, since
  `A e₁ = 0`.
- For `C = [0, 1]`, `Aᵀ e₂ = 0`, so `(Aᵀ, Cᵀ)` is not controllable, matching the unobservable
  line of 2.1.

*Needs:* 1.1, 1.2, 2.1; Mathlib `Matrix.rank`, `Matrix.rank_transpose`, `Matrix.transpose_pow`.
(Proved here, after Sontag.)

### Examples

The double integrator with the outputs `x₁` (observable) and `x₂` (not observable).

### Dependencies

Layer 1 (1.1, 1.2); Mathlib `Matrix.mulVecLin`, `LinearMap.ker`, `Matrix.rank`,
`Matrix.rank_transpose`, `Matrix.transpose_pow`.

## Layer 3: feedback and the characteristic polynomial

### 3.1 Ackermann's formula

Prove `charpoly_add_vecMulVec_ackermann`. Let `b, q : n → K` satisfy `q ⬝ᵥ A ^ j b = 0` for
`j + 1 < N` and `q ⬝ᵥ A ^ (N − 1) b = 1`. Then for every monic `χ` of degree `N` the row
`f = −(q ᵥ* χ(A))` satisfies `charpoly (A + vecMulVec b f) = χ` (Sontag, Exercise 5.1.12,
p. 188, which writes `q` as the last row of the inverse of `[b, Ab, …, A^(N−1)b]`).

The hypothesis on `q` already forces `(A, b)` to be controllable: if the vectors `A ^ j b`,
`j < N`, were dependent, `A ^ (N − 1) b` would lie in the span of the earlier ones and
`q ⬝ᵥ A ^ (N − 1) b` would vanish. Conversely, for a controllable single-input pair such a `q`
exists, the last element of the basis dual to `b, A b, …, A ^ (N − 1) b`.

Route: write `Ã = A + vecMulVec b f`. The hypothesis gives `q Ã ^ j = q A ^ j` for `j < N` and
`q Ã ^ N = q A ^ N + f`, so `q χ(Ã) = q χ(A) + f = 0`. The rows `q A ^ j`, `j < N`, are linearly
independent (pair them with the vectors `A ^ i b`, `i < N`: the pairings vanish when `i + j < N − 1`
and equal `1` when `i + j = N − 1`, a triangular system), and Cayley–Hamilton gives `q χ̃(Ã) = 0`
for the characteristic polynomial `χ̃` of `Ã`. The polynomial `χ − χ̃` has degree less than `N`
and `q (χ − χ̃)(Ã) = 0`, so it is zero.

**Checks.**
- For the double integrator and `b = e₂`, `q = (1, 0)`. For `χ = X² + 3X + 2`,
  `χ(A) = [[2, 3], [0, 2]]`, `f = (−2, −3)` and `A + b f = [[0, 1], [−2, −3]]`, whose
  characteristic polynomial is `X² + 3X + 2`. With the sign of `f` reversed the characteristic
  polynomial is `X² − 3X − 2`.
- For `N = 0` the only monic polynomial of degree `0` is `1`, the characteristic polynomial of the
  empty matrix, and the hypothesis on `q` is empty.
- Over `𝔽₂`, for the double integrator with `b = e₂` and the irreducible `χ = X² + X + 1`, the
  formula gives `f = (1, 1)` and `A + b f = [[0, 1], [1, 1]]`, whose characteristic polynomial is
  `X² + X + 1`.

*Needs:* Mathlib `Matrix.aeval_self_charpoly`, `Matrix.charpoly_monic`,
`Matrix.charpoly_natDegree_eq_dim`, `Polynomial.aeval`, `Matrix.vecMulVec`. (Proved here.)

### 3.2 Pole placement with one input

Prove `existsUnique_charpoly_add_vecMulVec`: if `(A, b)` is controllable, then for every monic `χ`
of degree `N` there is exactly one row `f` with `charpoly (A + vecMulVec b f) = χ` (Sontag, proof
of Theorem 13, pp. 186–187, and Proposition 5.1.7, p. 185; Åström–Murray, Theorem 7.3, p. 7-15,
for existence over the reals).

Route: existence is 3.1 with the `q` dual to the basis `b, A b, …, A ^ (N − 1) b`. For uniqueness,
the route of 3.1 shows `q χ̃(A) + f = 0` for every `f`, where `χ̃` is the characteristic
polynomial of `A + vecMulVec b f`; so `f = −(q ᵥ* χ̃(A))` is determined by `χ̃`.

**Checks.**
- Uniqueness needs one input: for `N = 1`, `A = [0]` and `B = [1, 1]`, every `F = (f₁, f₂)` with
  `f₁ + f₂ = c` gives the characteristic polynomial `X − c`.
- Existence needs controllability: over `ℚ`, for `A = diag(1, 2)` and `b = e₁`, no `f` gives
  `X²`, since `X − 2` divides every characteristic polynomial of `A + b f` (1.4). Over `𝔽₂`,
  where `2 = 0`, the same pair does reach `X²` (with `f = (1, 0)`) but not `X² + X + 1`.

*Needs:* 1.1, 1.2, 3.1; Mathlib `Module.Basis.dualBasis`. (Proved here.)

### 3.3 The pole-shifting theorem

Prove `isControllable_iff_forall_exists_charpoly`: over any field, `(A, B)` is controllable if and
only if for every monic `χ` of degree `N` there is `F : Matrix m n K` with
`charpoly (A + B * F) = χ` (Sontag, Theorem 13, p. 186).

Route: if `(A, B)` is not controllable, write it in the form of 1.6 with `s ≥ 1`. For every `F`,
`A + B F` is then block upper triangular after the same change of coordinates, with lower diagonal
block `A₂₂`, so the characteristic polynomial of `A₂₂`, of positive degree, divides it; it cannot
divide both `X ^ N` and `X ^ N + 1`. If `(A, B)` is controllable, choose `v` with `B v ≠ 0` and
build linearly independent vectors `x₁ = B v`, `x_{i+1} ∈ A xᵢ + range B` for as long as possible;
the span of a maximal such sequence is `A`-invariant and contains the range of `B`, so it is the
whole space and the sequence has `N` terms. The feedback `F₁` sending `xᵢ` to an input that
realizes the step from `xᵢ` to `x_{i+1}` makes `(A + B F₁, B v)` controllable with one input
(Heymann's lemma), and 3.2 applied to that pair gives `f`, with `F = F₁ + v f`.

**Checks.**
- Over `𝔽₂` and `𝔽₃`, for every pair with `N ≤ 2` and `m ≤ 2` (and every pair over `𝔽₂` with
  `N = 3` and `m ≤ 2`), the set of characteristic polynomials of `A + B F` is the set of all
  monic polynomials of degree `N` exactly when the pair is controllable; the finite fields need no
  extra hypothesis.
- For `A = diag(1, 2)` and `b = e₁` the characteristic polynomials of `A + b f` are exactly the
  `(X − c)(X − 2)` with `c ∈ K`.

*Needs:* 1.1, 1.2, 1.4, 1.6, 3.2; Mathlib `Matrix.charpoly_fromBlocks_zero₂₁`,
`Matrix.charpoly_units_conj`, `Matrix.charpoly_reindex`, `Polynomial.Monic`. (Proved here, after
Sontag.)

### Examples

The double integrator over `ℚ` and over `𝔽₂`; the pair `(diag(1, 2), e₁)`, whose uncontrollable
eigenvalue `2` survives every feedback.

### Dependencies

Layer 1 (1.1, 1.2, 1.4, 1.6); Mathlib `Matrix.aeval_self_charpoly`, `Matrix.charpoly_monic`,
`Matrix.charpoly_natDegree_eq_dim`, `Polynomial.aeval`, `Matrix.vecMulVec`,
`Module.Basis.dualBasis`, `Matrix.charpoly_fromBlocks_zero₂₁`, `Matrix.charpoly_units_conj`,
`Matrix.charpoly_reindex`, `Polynomial.Monic`.

## Layer 4: the continuous-time system

### 4.1 The controllability Gramian

Define `ctrbGramian`, with `ctrbGramian A B t : Matrix n n ℝ`, entrywise as
`∫ s in 0..t, (exp (s • A) * B * Bᵀ * exp (s • Aᵀ)) i j`. Prove `posDef_ctrbGramian_iff`: for
`t > 0`, the Gramian is positive definite if and only if `(A, B)` is controllable (Sontag,
Theorem 5, p. 109, with `σ = 0`, `τ = t` and the substitution `s ↦ t − s`, together with
Theorem 3, p. 89).

Route: the Gramian is symmetric, since `exp (s • Aᵀ) = (exp (s • A))ᵀ`, and
`vᵀ W(t) v = ∫₀ᵗ ‖Bᵀ exp (s • Aᵀ) v‖² ds`. This vanishes exactly when the continuous function
`s ↦ vᵀ exp (s • A) B` vanishes on `[0, t]`. Differentiating `k` times and letting `s → 0` gives
`vᵀ A ^ k B = 0` for every `k`, that is, `v` is orthogonal to the reachable subspace; conversely
such `v` makes the function vanish, by the power series of the exponential.

**Checks.**
- For the double integrator with `b = e₂`, `exp (s • A) b = (s, 1)` and
  `W(t) = [[t³/3, t²/2], [t²/2, t]]`, with determinant `t⁴/12 > 0` for `t > 0`.
- At `t = 0` the Gramian is `0`, which is not positive definite: the hypothesis `t > 0` is
  needed even for controllable pairs.
- For `A = diag(1, 2)` and `b = e₁`, `W(t) = diag((e^(2t) − 1)/2, 0)`, which is singular.

*Needs:* 1.1; Mathlib `NormedSpace.exp`, `Matrix.exp_transpose`, `hasDerivAt_exp_smul_const`
(under a local norm instance on matrices), `NormedSpace.exp_eq_tsum`,
`intervalIntegral.integral_pos_iff_support_of_nonneg_ae`, `Matrix.PosDef`. (Proved here, after
Sontag.)

### 4.2 Steering

Prove `isControllable_iff_forall_exists_steer`: for `T > 0`, `(A, B)` is controllable if and only
if for all `x₀`, `x₁` there are a continuous input `u : ℝ → m → ℝ` and a function
`x : ℝ → n → ℝ` with `x 0 = x₀`, `x T = x₁` and `HasDerivAt x (A *ᵥ x s + B *ᵥ u s) s` for every
`s` (Sontag, Theorem 3, p. 89, and Theorem 5 with formula (3.23), p. 109, which allow
essentially bounded measurable inputs; the input built below is continuous, and the converse holds
for every continuous input).

Route: if the pair is controllable, put `v = W(T)⁻¹ (x₁ − exp (T • A) x₀)` and
`u(s) = Bᵀ exp ((T − s) • Aᵀ) v`, which is continuous. The solution with `x 0 = x₀` exists by Tau
Ceti `ContinuousLinearMap.existsUnique_hasDerivAt_add`, and by variation of constants
`x T = exp (T • A) x₀ + W(T) v = x₁`. If the pair is not controllable, pick `w ≠ 0` orthogonal to
the reachable subspace; for every solution, `s ↦ wᵀ exp ((T − s) • A) x(s)` has derivative `0`, so
`wᵀ x(T) = wᵀ exp (T • A) x₀` and not every `x₁` is reached.

**Checks.**
- For the double integrator with `b = e₂`, `T = 1`, `x₀ = (1, 0)` and `x₁ = 0`:
  `W(1)⁻¹ = [[12, −6], [−6, 4]]`, `v = (−12, 6)` and `u(s) = 12 s − 6`. The state at time `s` is
  `(1 − 3 s² + 2 s³, 6 s² − 6 s)`, which is `0` at `s = 1`.
- The input must be allowed to vary: with constant inputs the double integrator from `(1, 0)`
  reaches only `(1 + c/2, c)` at `T = 1`, never `0`.

*Needs:* 1.1, 4.1; Tau Ceti `ContinuousLinearMap.existsUnique_hasDerivAt_add`; Mathlib
`NormedSpace.exp`, `hasDerivAt_exp_smul_const`, `Matrix.exp_add_of_commute`,
`Matrix.PosDef.isUnit`. (Proved here, after Sontag.)

### Examples

The double integrator steered from `(1, 0)` to rest in unit time; the pair `(diag(1, 2), e₁)`
with its singular Gramian.

### Dependencies

Layer 1 (1.1); Tau Ceti `ContinuousLinearMap.existsUnique_hasDerivAt_add`; Mathlib
`NormedSpace.exp`, `Matrix.exp_transpose`, `Matrix.exp_add_of_commute`,
`hasDerivAt_exp_smul_const`, `NormedSpace.exp_eq_tsum`,
`intervalIntegral.integral_pos_iff_support_of_nonneg_ae`, `Matrix.PosDef`,
`Matrix.PosDef.isUnit`.

## Layer 5: stability, the Lyapunov and Stein equations, stabilizability

### 5.1 Hurwitz and Schur stable matrices

Define `IsHurwitz`: for `A : Matrix n n ℝ`, `IsHurwitz A` means that every `μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ))` has
`μ.re < 0`. Define `IsSchurStable`: `IsSchurStable A` means that every such `μ` has `‖μ‖ < 1` (Sontag, Definition C.5.2,
p. 492, where Schur stable matrices are called convergent).

- `isHurwitz_iff_tendsto_exp`: `A` is Hurwitz if and only if `exp (t • A) → 0` as `t → ∞`.
- `isSchurStable_iff_tendsto_pow`: `A` is Schur stable if and only if `A ^ k → 0` as `k → ∞`.

(Sontag, Proposition C.5.1, p. 491; Åström–Murray, Theorem 5.1, p. 5-13, for the first
statement.)

Route: if `A v = μ v` with `v ≠ 0` complex, then `exp (t • A) v = e^(t μ) v` and `A ^ k v = μ ^ k v`,
which do not tend to `0` when `re μ ≥ 0` or `‖μ‖ ≥ 1`. Conversely, write the complexified `A` as
`S + N` with `S` semisimple, `N` nilpotent and `S N = N S` (Jordan–Chevalley); then
`exp (t • A) = exp (t • S) exp (t • N)`, where `exp (t • S)` decays like `e^(−α t)` for some
`α > 0` and `exp (t • N)` is a polynomial in `t`. For powers, Gelfand's formula gives
`‖A ^ k‖ ≤ ρ ^ k` for large `k` and any `ρ` between the spectral radius and `1`.

**Checks.**
- `[[0, 1], [−2, −3]]` has eigenvalues `−1` and `−2` and is Hurwitz.
- The rotation generator `[[0, 1], [−1, 0]]` has eigenvalues `±i`, so it is not Hurwitz, and
  `exp (t • A)` is a rotation, which does not tend to `0`. Its real spectrum is empty: a definition
  using real eigenvalues only would call it Hurwitz.
- The Jordan block `J = [[−1, 1], [0, −1]]` is Hurwitz, and
  `exp (t • J) = e^(−t) [[1, t], [0, 1]] → 0`.
- `[[0, 2], [0, 0]]` is Schur stable, with square `0`, although its operator norm for the
  Euclidean norm is `2`: Schur stability is not a bound `‖A‖ < 1` on the norm.
- With no states every matrix is Hurwitz and Schur stable.

*Needs:* Mathlib `spectrum`, `Matrix.mem_spectrum_iff_isRoot_charpoly`, `NormedSpace.exp`,
`NormedSpace.exp_eq_tsum`, `Matrix.exp_add_of_commute`, `Module.End.exists_isNilpotent_isSemisimple`,
`spectrum.gelfand_formula`, `Module.End.exists_eigenvalue`. (Proved here, after Sontag.)

### 5.2 The Lyapunov equation

- `isHurwitz_iff_forall_posDef_exists_posDef`: `A` is Hurwitz if and only if for every positive
  definite `Q` there is a positive definite `P` with `Aᵀ P + P A = −Q`.
- `isHurwitz_iff_exists_posDef`: `A` is Hurwitz if and only if some positive definite `P` makes
  `−(Aᵀ P + P A)` positive definite.
- `lyapunov_eq_iff`: if `A` is Hurwitz, then for all `P` and `Q`, `Aᵀ P + P A = −Q` holds if and
  only if `P` is the entrywise integral `∫₀^∞ exp (t • Aᵀ) Q exp (t • A) dt`; in particular the
  equation has exactly one solution for every `Q`.

(Sontag, Theorem 18, p. 231, items 1 to 3, and Lemma 5.7.18 with its integral formula, p. 230;
Sontag writes `Aᵀ P + P A = Q` with `Q` negative definite.)

Route: for Hurwitz `A`, the integrand decays exponentially by 5.1, so the integral exists, and
`Aᵀ P + P A` is the integral of the derivative of `exp (t • Aᵀ) Q exp (t • A)`, which equals
`0 − Q`. Uniqueness: if `Aᵀ D + D A = 0`, then `exp (t • Aᵀ) D exp (t • A)` is constant and tends
to `0`, so `D = 0`. For positive definite `Q` the integrand is positive definite at every `t`. If
`P` and `−(Aᵀ P + P A)` are positive definite and `A v = μ v` with `v ≠ 0` complex, then
`2 re μ (v* P v) = v* (Aᵀ P + P A) v < 0` with `v* P v > 0`, so `re μ < 0`.

**Checks.**
- For `A = [[0, 1], [−2, −3]]` and `Q = 1`, the solution is `P = [[5/4, 1/4], [1/4, 1/4]]`, with
  determinant `1/4 > 0`.
- For `A = [1]` the equation `2P = −Q` has the solution `P = −Q/2`, which is not positive
  definite; for `A = [0]` and `Q = [1]` it has no solution.
- `lyapunov_eq_iff` needs the Hurwitz hypothesis: for the rotation generator
  `A = [[0, 1], [−1, 0]]`, `Aᵀ + A = 0`, so `P = 1` and `P = 0` both solve the equation with
  `Q = 0`, while the integral formula gives only `0`.

*Needs:* 5.1; Mathlib `NormedSpace.exp`, `Matrix.exp_transpose`, `hasDerivAt_exp_smul_const`,
`MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`, `Matrix.PosDef`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`. (Proved here, after Sontag.)

### 5.3 The Lyapunov equation with an observable output

Prove `isHurwitz_iff_exists_posDef_of_isObservable`: if `(A, C)` is observable, then `A` is
Hurwitz if and only if `Aᵀ P + P A = −(Cᵀ C)` has a positive definite solution (Sontag,
Exercise 5.7.9, p. 227, for the direction from a solution to stability; the other direction is
proved here).

Route: if `A` is Hurwitz, the solution of 5.2 with `Q = Cᵀ C` satisfies
`vᵀ P v = ∫₀^∞ ‖C exp (t • A) v‖² dt`, which vanishes only if `C exp (t • A) v = 0` for all `t`,
hence `C A ^ k v = 0` for all `k` and `v = 0` by observability. Conversely, if `P` is a positive
definite solution and `A v = μ v` with `v ≠ 0` complex, then `2 re μ (v* P v) = −‖C v‖²`, and
`C v ≠ 0` by observability (the dual Hautus test, through 2.2 and 1.5), so `re μ < 0`.

**Checks.**
- For `A = [[0, 1], [−2, −3]]` and `C = [1, 0]` (observable), the solution is
  `P = [[11/12, 1/4], [1/4, 1/12]]`, with determinant `1/72 > 0`.
- Both directions need observability: for `A = [−1]` and `C = [0]` the only solution is `P = 0`
  although `A` is Hurwitz; for `A = [0]` and `C = [0]`, `P = [1]` is a positive definite solution
  although `A` is not Hurwitz.

*Needs:* 1.5, 2.2, 5.1, 5.2; Mathlib `Matrix.PosDef`. (Proved here, after Sontag.)

### 5.4 The Stein equation

- `isSchurStable_iff_forall_posDef_exists_posDef`: `A` is Schur stable if and only if for every
  positive definite `Q` there is a positive definite `P` with `Aᵀ P A − P = −Q` (Sontag,
  Lemma/Exercise 5.7.19, p. 231, items 1 and 2).
- `stein_eq_iff`: if `A` is Schur stable, then for all `P` and `Q`, `Aᵀ P A − P = −Q` holds if and
  only if `P = ∑ₖ (Aᵀ) ^ k Q A ^ k`; in particular the equation has exactly one solution. (The
  uniqueness is item 2 of Sontag's Lemma/Exercise 5.7.19; the series formula is proved here.)

Route: by 5.1 the series converges absolutely; its sum `S` satisfies `Aᵀ S A = S − Q` by shifting
the index. If `Aᵀ D A = D`, then `D = (Aᵀ) ^ k D A ^ k → 0`. For positive definite `Q` the first
term of the series is positive definite and the others are positive semidefinite. Conversely, if
`A v = μ v` with `v ≠ 0` complex and `P`, `Q` are positive definite, then
`(‖μ‖² − 1) v* P v = −v* Q v < 0`, so `‖μ‖ < 1`.

**Checks.**
- For `A = [1/2]` the solution is `P = 4Q/3 = ∑ₖ (1/4) ^ k Q`.
- For the nilpotent `A = [[0, 1], [0, 0]]` and `Q = 1` the series stops after two terms:
  `P = 1 + Aᵀ A = diag(1, 2)`, and `Aᵀ P A − P = −1`.
- For `A = [2]` the solution is `P = −Q/3`, not positive definite; for `A = [1]` and `Q = [1]`
  there is no solution, and the series diverges, with `tsum` equal to `0` by Mathlib's
  convention.

*Needs:* 5.1; Mathlib `tsum`, `HasSum`, `Matrix.PosDef`, `Matrix.PosSemidef`. (Proved here,
after Sontag.)

### 5.5 Stabilizability

Prove `exists_isHurwitz_add_mul_iff`: some `F : Matrix m n ℝ` makes `A + B F` Hurwitz if and only
if `[μI − A, B]` has rank `N` for every complex `μ` with `re μ ≥ 0` (Sontag, Proposition 5.5.6,
items 3 and 4, p. 213, with Exercise 5.5.7, p. 215, and Lemma/Exercise 3.3.10, p. 95).

Route: by 1.6 and 1.4, the eigenvalues of `A + B F` are those of `A₁₁ + B₁ F₁` together with those
of `A₂₂`, which no feedback changes. By the argument of 1.5, the `μ` at which the rank drops are
exactly the eigenvalues of `A₂₂`. If they all have negative real part, 3.3 applied to the
controllable pair `(A₁₁, B₁)` and the polynomial `(X + 1) ^ r` gives `F₁`, and `F = (F₁, 0)` in
the coordinates of 1.6 makes `A + B F` Hurwitz.

**Checks.**
- For `A = diag(−1, 1)` and `b = e₁`, the unstable eigenvalue `1` is uncontrollable: at `μ = 1`
  the matrix `[[2, 0, 1], [0, 0, 0]]` has rank `1`, and no feedback stabilizes. With `b = e₂` the
  pair is not controllable, but its uncontrollable eigenvalue `−1` is stable, the rank is `2` for
  every `μ` with `re μ ≥ 0`, and `f = (0, −2)` gives `A + b f = diag(−1, −1)`.
- A controllable pair satisfies the rank condition at every `μ` by 1.5 and is stabilizable.

*Needs:* 1.4, 1.5, 1.6, 3.3, 5.1; Mathlib `Matrix.charpoly_fromBlocks_zero₂₁`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`. (Proved here, after Sontag.)

### Examples

The matrices `[[0, 1], [−2, −3]]` (Hurwitz, with its Lyapunov solutions for `Q = 1` and for
`Q = Cᵀ C`), the rotation generator (not Hurwitz, with non-unique solutions), the nilpotent
`2 × 2` matrix with its finite Stein series, and `diag(−1, 1)` with each input vector.

### Dependencies

Layers 1 (1.4, 1.5, 1.6), 2 (2.2) and 3 (3.3), as stated in 5.3 and 5.5; Mathlib `spectrum`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `NormedSpace.exp`, `NormedSpace.exp_eq_tsum`,
`Matrix.exp_add_of_commute`, `Matrix.exp_transpose`, `hasDerivAt_exp_smul_const`,
`Module.End.exists_isNilpotent_isSemisimple`, `Module.End.exists_eigenvalue`,
`spectrum.gelfand_formula`, `MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`, `tsum`,
`HasSum`, `Matrix.PosDef`, `Matrix.PosSemidef`, `Matrix.charpoly_fromBlocks_zero₂₁`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: the reachable subspace,
controllability and the controllability matrix with the Kalman rank condition, the states of the
discrete-time system, the invariance under feedback and change of coordinates, the Hautus test and
the Kalman decomposition; the unobservable subspace, observability and duality; Ackermann's
formula, pole placement with one input and the pole-shifting theorem; the controllability Gramian
and steering of the continuous-time system; Hurwitz and Schur stable matrices, the Lyapunov and
Stein equations and stabilizability.

Already in the libraries and therefore not targets:

- The Cayley–Hamilton theorem (`Matrix.aeval_self_charpoly`), the characteristic polynomial of a
  block triangular matrix (`Matrix.charpoly_fromBlocks_zero₂₁`), its invariance under conjugation
  and reindexing, the rank of the transpose (`Matrix.rank_transpose`), and the eigenvalues of a
  matrix as the roots of its characteristic polynomial (`Matrix.mem_spectrum_iff_isRoot_charpoly`),
  in Mathlib.
- The matrix exponential with its behaviour under transposition and for commuting matrices
  (`Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean`) and its derivative
  (`hasDerivAt_exp_smul_const`), in Mathlib; the identity `det (exp A) = exp (trace A)`, in Tau
  Ceti (`TauCeti/Analysis/Normed/Algebra/MatrixExponential.lean`).
- The invariance of the rank under a homomorphism of fields applied to the entries
  (`Matrix.rank_map`) and, over star-ordered fields, the complementarity of the common kernel of a
  finite family of matrices and the sum of the ranges of their conjugate transposes
  (`Matrix.isCompl_iInf_ker_mulVecLin_iSup_range_mulVecLin_conjTranspose`), in Tau Ceti
  (`TauCeti/LinearAlgebra/Matrix/Rank.lean`). Over the reals, applied to the family `C * A ^ k`
  with `k < N` and combined with the reduction of 1.2, the latter makes the unobservable subspace
  of `(A, C)` a complement of the reachable subspace of `(Aᵀ, Cᵀ)`; 2.2 states only the
  equivalence of the two conditions, which holds over every field.
- Existence and uniqueness for `x' = B x + f` with a bounded operator `B` and continuous `f`
  (`ContinuousLinearMap.existsUnique_hasDerivAt_add`, `TauCeti/Analysis/ODE/Inhomogeneous.lean`),
  in Tau Ceti.
- For a symmetric operator on a finite-dimensional real inner product space, the flow
  `exp (t T)` and its stable set, which is the negative spectral subspace
  (`LinearMap.IsSymmetric.stableSet_flow_eq_negativeSpectralSubspace`,
  `TauCeti/Analysis/ODE/Linear.lean`), with exponential bounds in
  `TauCeti/Analysis/ODE/ExponentialDichotomy.lean`, in Tau Ceti. Section 5.1 treats arbitrary,
  not necessarily symmetric, real matrices.
- The Sylvester operator `X ↦ A X − X B` on bounded operators (`ContinuousLinearMap.sylvester`)
  and the bound `(α + β) ‖X‖ ≤ ‖A X + X B‖` when the real parts of the quadratic forms of `A`
  and `B` are bounded below by `α` and `β`, with no symmetry assumed
  (`ContinuousLinearMap.add_mul_norm_le_norm_comp_add_comp`,
  `TauCeti/Analysis/InnerProductSpace/Sylvester.lean`), in Tau Ceti. Applied to `−Aᵀ` and `−A`
  it bounds solutions of the Lyapunov equation when the form of `−A` is coercive; it does not
  characterize Hurwitz matrices, and Section 5.2 does not use it.

Left to other roadmaps:

- OperatorTheory/SpectralSubspacePerturbation owns Sylvester equations `A X − X B = C` for
  self-adjoint operators, with Rosenblum's theorem and the norm bounds of its Part B (including
  its bound for `A X + X B = Y` when the forms of `A` and `B` are bounded below). The Lyapunov
  equation of 5.2 has an arbitrary real `A`, need not be self-adjoint, and its theorems are
  stability theorems; none of them is stated there, and none of that roadmap's statements is
  restated here.

Not treated here: linear-quadratic optimal control, the Riccati difference and differential
equations, the algebraic Riccati equation, the Kalman filter and the Kalman–Bucy filter; time-varying
systems and their Gramians; observers and output feedback; realization theory, transfer functions
and minimality; the Brunovsky and controller canonical forms as objects of their own; the
controllability indices and the feedback classification of pairs; genericity of controllable
pairs; Routh–Hurwitz tests; complex systems with conjugate transposes; detectability, which is
stabilizability of the transposed pair; nonlinear systems and their linearization.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: `Matrix.mulVecLin` (the linear map `x ↦ A *ᵥ x`).
  `Mathlib/Data/Matrix/Mul.lean`: `Matrix.vecMulVec` (`vecMulVec b f` has entries `b i * f j`).
  `Mathlib/LinearAlgebra/Matrix/RowCol.lean`: `Matrix.replicateCol`.
  `Mathlib/Data/Matrix/Basic.lean`: `Matrix.transpose_pow` (`(M ^ k)ᵀ = Mᵀ ^ k`).
- `Mathlib/Data/Matrix/Block.lean`: `Matrix.fromBlocks`.
  `Mathlib/Data/Matrix/ColumnRowPartitioned.lean`: `Matrix.fromRows`, `Matrix.fromCols`.
  `Mathlib/LinearAlgebra/Matrix/Defs.lean`: `Matrix.reindex`.
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank` (the `finrank` of the range of
  `Matrix.mulVecLin`) and `Matrix.rank_transpose` (over a field, `Aᵀ.rank = A.rank`).
- `Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean`: `Submodule.eq_top_of_finrank_eq` (a
  subspace of a finite-dimensional space whose dimension is that of the space is `⊤`).
  `Mathlib/LinearAlgebra/Basis/VectorSpace.lean`: `Module.Basis.extend` (a linearly independent
  family extends to a basis). `Mathlib/LinearAlgebra/Dual/Basis.lean`: `Module.Basis.dualBasis`.
  `LinearMap.range` and `LinearMap.ker` of linear maps.
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.aeval_self_charpoly`
  (Cayley–Hamilton, `aeval M M.charpoly = 0`, over any commutative ring),
  `Matrix.charpoly_units_conj` (`(M N M⁻¹).charpoly = N.charpoly` for a unit `M`),
  `Matrix.charpoly_reindex`, `Matrix.charpoly_fromBlocks_zero₂₁`
  (`(fromBlocks M₁₁ M₁₂ 0 M₂₂).charpoly = M₁₁.charpoly * M₂₂.charpoly`).
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`: `Matrix.charpoly_monic`,
  `Matrix.charpoly_natDegree_eq_dim` (degree `Fintype.card n` over a nontrivial ring).
  `Mathlib/Algebra/Polynomial/AlgebraMap.lean`: `Polynomial.aeval`; `Polynomial.Monic`.
- `Mathlib/Algebra/Algebra/Spectrum/Basic.lean`: `spectrum`.
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean`: `Matrix.mem_spectrum_iff_isRoot_charpoly`
  (over a field, `r ∈ spectrum K A ↔ A.charpoly.IsRoot r`).
  `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean`: `Module.End.exists_eigenvalue` (an
  endomorphism of a nonzero finite-dimensional space over an algebraically closed field has an
  eigenvalue). `Mathlib/LinearAlgebra/JordanChevalley.lean`:
  `Module.End.exists_isNilpotent_isSemisimple` (over a perfect field, an endomorphism of a
  finite-dimensional space is the sum of a commuting nilpotent and semisimple pair).
- `Mathlib/Analysis/Normed/Algebra/Exponential.lean`: `NormedSpace.exp` (for a topological ring,
  the sum of the exponential series when the ring is a `ℚ`-algebra) and `NormedSpace.exp_eq_tsum`.
  `Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean`: `Matrix.exp_transpose`
  (`exp Aᵀ = (exp A)ᵀ`) and `Matrix.exp_add_of_commute` (for commuting `A`, `B`,
  `exp (A + B) = exp A * exp B`). `Mathlib/Analysis/SpecialFunctions/Exponential.lean`:
  `hasDerivAt_exp_smul_const` (the derivative of `u ↦ exp (u • x)` at `t` is `exp (t • x) * x` in
  a complete normed algebra; used with a local norm instance on matrices).
- `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean`: `spectrum.gelfand_formula`
  (`‖a ^ n‖₊ ^ (1 / n) → spectralRadius ℂ a` in a complex Banach algebra).
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`:
  `intervalIntegral.integral_pos_iff_support_of_nonneg_ae`.
  `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean`:
  `MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto` (the integral over `(a, ∞)` of an
  integrable derivative is the limit at infinity minus the value at `a`).
- `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean`: `HasSum` and `tsum` (which is `0` for a
  family that is not summable).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef` and `Matrix.PosSemidef` (both
  include `IsHermitian`, which is symmetry over `ℝ`), and `Matrix.PosDef.isUnit` (a positive
  definite matrix over a field is invertible).

### From Tau Ceti

- `TauCeti/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank_map` (for a homomorphism of fields
  `φ : K →+* L`, `(A.map φ).rank = A.rank`), used in 1.5.
- `TauCeti/Analysis/ODE/Inhomogeneous.lean`: `ContinuousLinearMap.existsUnique_hasDerivAt_add`
  (for a bounded operator `B` on a real Banach space, a continuous `f`, a point `x` and a time
  `t₀`, there is exactly one `u` with `u t₀ = x` and `HasDerivAt u (B (u t) + f t) t` for all
  `t`), used in 4.2 with the operator `x ↦ A *ᵥ x` on `n → ℝ`.

No roadmap is a supplier.

## References

- Eduardo D. Sontag, *Mathematical Control Theory: Deterministic Finite Dimensional Systems*,
  second edition, Texts in Applied Mathematics 6, Springer, 1998; the PDF posted on the author's
  web site, whose page numbers are those of the printed book, was used for every locator above.
  The items Sontag labels Lemma/Exercise or Exercise are stated there without proof (the preface
  to the first edition says so of the Lemma/Exercises); this applies to the citations of
  Lemma/Exercises 3.3.4, 3.3.10, 5.1.2, 5.1.8 and 5.7.19 and of Exercises 5.1.12 (Ackermann's
  formula), 5.5.7 (the rank test for stabilizability) and 5.7.9, for which the routes above are
  the roadmap's own.
- Karl Johan Åström and Richard M. Murray, *Feedback Systems: An Introduction for Scientists and
  Engineers*, second edition, electronic version v3.1.5 of 24 July 2020, available from the
  authors' site; page numbers are of the form chapter-page.
- Attributions made in prose without a locator: Rudolf E. Kalman (the rank condition and the
  decomposition, around 1960); Malo L. J. Hautus (the eigenvalue test, 1969); W. Murray Wonham
  (the pole-shifting theorem for several inputs, 1967); Michael Heymann (the reduction to one
  input, 1968); Jürgen Ackermann (the formula for one input, 1972); Aleksandr M. Lyapunov (the
  matrix equation, 1892).

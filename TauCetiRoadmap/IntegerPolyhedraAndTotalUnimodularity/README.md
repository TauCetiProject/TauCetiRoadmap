# Roadmap: integer polyhedra and total unimodularity

**Summary.** A linear program with integer data usually has fractional optimal solutions, and
then it says little about the integer program it relaxes. A matrix is totally unimodular when
every square submatrix has determinant `0`, `1` or `−1`. For such a matrix the fractions never
appear: every vertex of a polyhedron cut out by the matrix and an integer right-hand side is an
integer point. Vertices are extreme points in the sense of convex geometry: points of the
polyhedron that are not the midpoint of two other points of it. The polyhedra have finitely many
constraints and variables; the classes of totally unimodular matrices and Ghouila-Houri's
theorem allow arbitrary index sets. No linear-programming duality is used or stated.

The main results are these.

- *Integrality of vertices.* If `A` is totally unimodular and `b` is an integer vector, every
  vertex of `{x | A x ≤ b}` is an integer vector. If moreover a linear function attains its
  maximum on this polyhedron, it attains it at an integer point.
- *The Hoffman–Kruskal theorem.* An integer matrix `A` is totally unimodular if and only if, for
  every integer vector `b`, every vertex of `{x | x ≥ 0, A x ≤ b}` is an integer vector. The sign
  condition `x ≥ 0` cannot be dropped: `{x | 2 x₁ ≤ b}` in the plane has no vertex at all,
  although the matrix `(2 0)` is not totally unimodular.
- *Ghouila-Houri's characterisation.* An integer matrix is totally unimodular if and only if every
  finite set of its rows can be given signs so that the signed sum of these rows has all entries
  in `{0, 1, −1}`.
- *Classes of examples.* A matrix with entries `0`, `±1` and at most one `1` and one `−1` in each
  column is totally unimodular; the incidence matrices of directed multigraphs are of this kind.
  A simple graph is bipartite exactly when its vertex–edge incidence matrix is totally
  unimodular, and for a finite bipartite graph the nonnegative edge vectors with sum at most `1`
  (exactly `1`) at every vertex form the convex hull of the matchings (perfect matchings).

The roadmap uses Mathlib's totally unimodular matrices and their closure properties, Mathlib's
extreme points, compactness and Krein–Milman theorem, and Mathlib's incidence matrices of simple
graphs. TensorProductCombinatorics counts the lattice points of the polyhedra `{x ≥ 0 | A x = b}`
for matrices of full row rank whose maximal minors are `0` or `±1`, under a positivity condition;
the polyhedron is taken from there. The integrality theorems for flows, Kőnig's theorem and
Egerváry's theorem are developed by flow methods in GraphConnectivityAndFlows and
MinimumCostFlowsAndWeightedBipartiteMatching and are not restated.

Layer 1 characterises vertices by their tight constraints and proves the two integrality results.
Layer 2 proves the equality form for matrices of full row rank and the two characterisations.
Layer 3 treats the classes of examples, and Layer 4 the matching and perfect matching polytopes.

## Conventions

- **Matrices.** Matrices are Mathlib's `Matrix m n R`. Total unimodularity is Mathlib's
  `Matrix.IsTotallyUnimodular`, stated for integer matrices `A : Matrix m n ℤ`: every square
  submatrix `A.submatrix f g` with `f : Fin k → m`, `g : Fin k → n` injective has determinant in
  the range of `SignType.cast`, that is in `{0, 1, −1}`. The empty submatrix (`k = 0`) has
  determinant `1`. Matrices with no rows or no columns are totally unimodular.
- **Polyhedra.** In Layer 1, 2.1 and 2.2, `m` and `n` are finite types and polyhedra live in `n → ℝ`
  with the coordinatewise order; `A x` is `A.map ((↑) : ℤ → ℝ) *ᵥ x`, and an integer vector `b`
  enters as `fun i => (b i : ℝ)`. The polyhedra used are `{x | A x ≤ b}`, `{x | 0 ≤ x, A x ≤ b}`
  and, for a matrix with rows `Fin r`, `realFibre A b = {x | x ≥ 0, A x = b}` (copied from
  TensorProductCombinatorics §1.5, where the sums are written out). They are written out in each
  statement; no other polyhedron object is defined.
- **Vertices and integrality.** A vertex of a set `P` is a point of Mathlib's
  `Set.extremePoints ℝ P`. A vector `x : n → ℝ` is integral when `∀ j, ∃ k : ℤ, x j = k`.
  A polyhedron without vertices, empty or not, satisfies every statement "every vertex is
  integral" vacuously; the Checks of 1.2 and 2.2 show where this matters.
- **Rows `i` tight at `z`.** For `z` with `A z ≤ b`, row `i` is tight when `(A z) i = b i`.
- **Graphs.** Simple graphs are Mathlib's `SimpleGraph V`, with incidence matrix
  `G.incMatrix R : Matrix V (Sym2 V) R`, whose entry at `(v, e)` is `1` exactly when `e` is an
  edge containing `v`; columns of non-edges are zero. Bipartite is Mathlib's `G.IsBipartite`,
  that is `G.Colorable 2`. Matchings and perfect matchings are Mathlib's
  `SimpleGraph.Subgraph.IsMatching` and `SimpleGraph.Subgraph.IsPerfectMatching`. A directed
  multigraph is an arrow family `Q : V → V → Type*`, as in Tau Ceti's network library; loops and
  parallel arrows are allowed.

## Layer 1: vertices of polyhedra and integrality

### 1.1 The vertex criterion

Prove `mem_extremePoints_iff_forall_tight`: for a real matrix `A : Matrix m n ℝ` with `m`, `n`
finite, a vector `b` and a point `z` with `A z ≤ b`, the point `z` is a vertex of
`{x | A x ≤ b}` if and only if every `c : n → ℝ` with `(A c) i = 0` for all rows `i` tight at `z`
is zero; equivalently the tight rows have rank `|n|` (Schrijver, Theorem 2.2, p. 26).

Route. If some `c ≠ 0` is annihilated by the tight rows, the finitely many other rows have
positive slack, so for small `δ > 0` both `z + δ c` and `z − δ c` lie in the polyhedron, and `z`
is their midpoint. Conversely, if `z` lies in the open segment between two points `x ≠ y` of the
polyhedron, every tight row `a` satisfies `a x ≤ a z` and `a y ≤ a z` with `a z` a proper convex
combination of the two, so `a (x − z) = 0`, and `c = x − z ≠ 0` is annihilated.

**Checks.**
- With no rows the polyhedron is all of `n → ℝ`; it has a vertex exactly when `n` is empty, and
  the criterion agrees: the condition on `c` is then vacuous, and `c = 0` is forced exactly when
  `n` is empty.
- The hypothesis `A z ≤ b` is needed: with no columns and one row with `b = −1` the polyhedron is
  empty, while `c = 0` is the only direction, so the condition on `c` holds.
- In the plane with rows `−x₁ ≤ 0`, `−x₂ ≤ 0`, `x₁ + x₂ ≤ 1`, the point `(0, 0)` has the two
  independent tight rows `−e₁`, `−e₂` and is a vertex; `(1/2, 1/2)` has the single tight row
  `(1, 1)`, which annihilates `c = (1, −1)`, and it is the midpoint of `(1, 0)` and `(0, 1)`.

*Needs:* Mathlib `Set.extremePoints`, `mem_extremePoints_iff_forall_segment`, `Matrix.mulVec`.

### 1.2 Integrality of vertices

Prove `integral_of_mem_extremePoints`: if `A : Matrix m n ℤ` is totally unimodular and
`b : m → ℤ`, every vertex of `{x | A x ≤ b}` is integral (Schrijver, Theorem 8.1, p. 134).

Route. By 1.1 the rows tight at a vertex `z` have rank `|n|`, so some `|n|` of them form a
nonsingular square submatrix `A'`, and `A' z = b'` for the corresponding part `b'` of `b`. Its
determinant is `±1` by total unimodularity, so `A'⁻¹ = det(A')⁻¹ · adj(A')` is an integer matrix
(Mathlib `Matrix.inv_def`, `Matrix.adjugate`), and `z = A'⁻¹ b'` is integral. When `n` is empty
the unique point is trivially integral.

**Checks.**
- `A = (1 1; 1 −1)` has determinant `−2` and is not totally unimodular: with `x ≥ 0` added
  (rows `−e₁`, `−e₂`) and `b = (1, 0, 0, 0)` the polyhedron `{x ≥ 0, x₁ + x₂ ≤ 1, x₁ − x₂ ≤ 0}`
  has the vertices `(0, 0)`, `(0, 1)` and `(1/2, 1/2)`.
- Integrality of `b` is needed: for `A = (1)` and `b = 1/2` the half-line `x ≤ 1/2` has the
  vertex `1/2`.
- For every totally unimodular matrix with entries `0`, `±1` of size `2 × 2`, `2 × 3`, `3 × 2`
  or `3 × 3` and every `b` in `{−2, …, 2}^m`, all vertices, enumerated through the criterion of
  1.1 with exact rational arithmetic, are integral (11350 matrices).

*Needs:* 1.1; Mathlib `Matrix.IsTotallyUnimodular`, `Matrix.rank`, `Matrix.inv_def`,
`Matrix.adjugate`.

### 1.3 Integral optima

Prove `exists_integral_isMaxOn`: if `A : Matrix m n ℤ` is totally unimodular, `b : m → ℤ`,
`c : n → ℝ`, and `x ↦ c ⬝ᵥ x` attains its maximum on `P = {x | A x ≤ b}` at some `x₀ ∈ P`, then
it attains it at some integral `x ∈ P` (Schrijver, Corollary 8.1a and its proof, pp. 134–135,
where the maximum is assumed finite; here it is assumed attained, and the theorem that a linear
function bounded above on a nonempty polyhedron attains its maximum is not used).

Route. Choose integer vectors `d' ≤ x₀ ≤ d''` (floors and ceilings) and put
`Q = P ∩ {d' ≤ x ≤ d''}`. It is cut out by `A` stacked with the rows `−eⱼ` and `eⱼ`, a totally
unimodular matrix by Mathlib's `Matrix.IsTotallyUnimodular.fromRows_unitlike`, with an integer
right-hand side. `Q` is closed and bounded, hence compact, and contains `x₀`, so `c ⬝ᵥ ·` attains
a maximum `μ ≥ c ⬝ᵥ x₀` on `Q` (`IsCompact.exists_isMaxOn`). The set `F` of maximisers in `Q` is
compact, nonempty, and an extreme subset of `Q` (a linear function at its maximum on an open
segment is at its maximum at both ends), so it has an extreme point
(`IsCompact.extremePoints_nonempty`), which is a vertex of `Q`
(`IsExtreme.extremePoints_subset_extremePoints`) and so integral by 1.2. This point lies in `P`
and its value is at least `c ⬝ᵥ x₀`, the maximum on `P`.

**Checks.**
- Total unimodularity is needed: for `A = (2)`, `b = 1` and `c = 1` the maximum `1/2` over
  `x ≤ 1/2` is attained only at `1/2`, and integer points of `P` have value at most `0`.
- Attainment is needed for the statement to say anything: for `A = (1 −1)`, `b = 0` and
  `c = (1, 0)` the function `x₁` is unbounded above on `{x₁ ≤ x₂}`.
- The hypothesis `x₀ ∈ P` is needed besides `IsMaxOn`, which holds vacuously on an empty set:
  the totally unimodular rows `x ≤ −1` and `−x ≤ 0` cut out `P = ∅`, and no point of `P` exists.
- A maximiser need not be integral, only some maximiser: for `A` the rows `±e₁`, `±e₂` with
  `b = (1, 0, 1, 0)` (the unit square) and `c = (1, 0)`, the point `(1, 1/2)` is a maximiser.

*Needs:* 1.2; Mathlib `Matrix.IsTotallyUnimodular.fromRows_unitlike`, `IsCompact.exists_isMaxOn`,
`IsCompact.extremePoints_nonempty`, `IsExtreme.extremePoints_subset_extremePoints`,
`Metric.isCompact_of_isClosed_isBounded`.

### Examples

- The orthant `{x ≥ 0}` in `ℝ²`, the case with no rows of `A` in 2.2, has the single vertex
  `(0, 0)`; the half-plane `{x₁ + x₂ ≤ 1}` has none.
- The unit cube `{0 ≤ x ≤ 1}` is cut out by the rows `±eⱼ`, a totally unimodular matrix, and 1.2
  puts its vertices in `{0, 1}ⁿ`; by 1.1 each of these `2ⁿ` points is one, its `n` tight rows
  being independent.

### Dependencies

1.1 uses only Mathlib. 1.2 uses 1.1. 1.3 uses 1.2.

## Layer 2: characterisations of total unimodularity

### 2.1 Unimodular matrices and the equality form

The polyhedron `realFibre A b = {x | ∀ j, 0 ≤ x j, ∀ i, ∑ j, (A i j : ℝ) * x j = b i}` of an
integer matrix `A : Matrix (Fin r) ι ℤ` and `b : Fin r → ℝ` is copied verbatim from
TensorProductCombinatorics §1.5. Prove `forall_det_mem_iff_forall_extremePoints_realFibre`: if
`A` has real rank `r`, then all its `r × r` column minors `(A.submatrix id e).det`, `e` injective,
lie in `{0, 1, −1}` if and only if for every `b : Fin r → ℤ` every vertex of `realFibre A b` is
integral (Schrijver, Theorem 8.2, pp. 136–137, after Veinott and Dantzig).

Route. Write `realFibre A b` as `{x | D x ≤ f}` with `D` the rows `−eⱼ`, `A` and `−A`. *Only if:*
at a vertex `x` with support `J`, the tight rows are those of `±A` and the `−eⱼ` for `j ∉ J`, so by
1.1 the columns of `A` in `J` are linearly independent. Since `A` has rank `r` they extend to `r`
columns `e` with `(A.submatrix id e).det ≠ 0`, hence `±1`; on these columns `x` solves
`A_e x_e = b`, and the adjugate formula of 1.2 makes it integral. *If:* let `B` be the submatrix
on `r` columns `e` with `det B ≠ 0`. For an integer vector `v`, `B⁻¹ v` has rational entries, so
some integer vector `u` has `z = u + B⁻¹ v ≥ 0`. Put `b = B z = B u + v`, an integer vector, and
let `x` be `z` on the columns `e` and `0` elsewhere. Then `x ∈ realFibre A b`, and the tight rows
contain `A` and the `−eⱼ` off `e`, which by `det B ≠ 0` leave only `c = 0`; by 1.1 `x` is a vertex,
so `z` and `B⁻¹ v = z − u` are integral. Taking `v` the unit vectors, `B⁻¹` is an integer matrix,
so `det B · det B⁻¹ = 1` with both factors integers, and `det B = ±1`.

**Checks.**
- The rank hypothesis is needed for "only if": `A = (2 0; 2 0)` has rank `1 < 2`, its only
  `2 × 2` minors are `0`, and for `b = (1, 1)` the polyhedron `{(1/2, t) | t ≥ 0}` has the vertex
  `(1/2, 0)`.
- `r = 0`: the only minor is the empty one, of determinant `1`, and `realFibre A b` is the
  orthant, with the single vertex `0`.
- `A = (1 2)`: the minors are `1` and `2`, and `b = 1` gives the vertex `(0, 1/2)` of the segment
  `{x ≥ 0, x₁ + 2 x₂ = 1}`.
- On all `4452` integer matrices with entries in `{−1, 0, 1, 2}` of sizes `1 × 1`, `1 × 2`,
  `1 × 3`, `2 × 1`, `2 × 2` and `2 × 3` (`4123` of full row rank) and `b` in `{−2, …, 2}^r`, the
  two sides agree for full row rank; without full row rank every `r × r` minor is `0`, so the
  minor condition holds and integrality implies it in every case.

*Needs:* 1.1, 1.2 (the adjugate step); Mathlib `Matrix.rank`, `Matrix.submatrix`, `Matrix.det`,
`Matrix.inv_def`; the copy of TensorProductCombinatorics §1.5 `realFibre`.

### 2.2 The Hoffman–Kruskal theorem

Prove `isTotallyUnimodular_iff_forall_extremePoints`: for `A : Matrix m n ℤ` with `m`, `n` finite,
`A.IsTotallyUnimodular` holds if and only if for every `b : m → ℤ` every vertex of
`{x | 0 ≤ x ∧ A x ≤ b}` is integral (Schrijver, Corollary 8.2a, p. 137, stated there for integer
polyhedra in the sense of optimisation; its proof establishes and uses the vertex form, which is
the form stated here).

Route. *Only if:* the polyhedron is `{x | D x ≤ (b, 0)}` with `D` the matrix `A` stacked with the
rows `−eⱼ`, totally unimodular by Mathlib's `Matrix.IsTotallyUnimodular.fromRows_unitlike`; apply
1.2. *If:* let `B` be a nonsingular square submatrix of `A` on rows `R` and columns `C`. For an
integer vector `v` on `R`, choose an integer vector `u` with `z = u + B⁻¹ v ≥ 0`, let `x` be `z`
on `C` and `0` elsewhere, and let `b` be `B z = B u + v` on `R` and, on the other rows, any
integers at least the corresponding entries of `A x`. Then `x` lies in the polyhedron, and the
rows tight at `x` include the rows `R` of `A` and the rows `−eⱼ`, `j ∉ C`; a direction `c`
annihilated by them vanishes off `C` and satisfies `B c_C = 0`, so `c = 0`. By 1.1 `x` is a
vertex, hence integral, and as in 2.1 `B⁻¹` is integral and `det B = ±1`. (Schrijver argues
through 2.1 applied to `(I A)`; the direct argument is the same.)

**Checks.**
- The quantifier over all `b` is needed: `A = (1 1; 1 −1)` is not totally unimodular, and for
  `b = (0, 0)` the polyhedron is `{0}`, integral, while `b = (1, 0)` gives the vertex `(1/2, 1/2)`
  (Check of 1.2).
- The sign condition `x ≥ 0` is needed for "if": `A = (1 2; 0 1)` is not totally unimodular (it
  has the entry `2`), but it is invertible with determinant `1`, so `{x | A x ≤ b}` has the single
  vertex `A⁻¹ b = (b₁ − 2 b₂, b₂)`, integral for every integer `b`. With `x ≥ 0` and `b = (1, 1)`
  the vertex `(0, 1/2)` appears from the rows `x₁ + 2 x₂ ≤ 1` and `x₁ ≥ 0`.
- `A = (2 0)`: `{x | 2 x₁ ≤ b}` has no vertex for any `b`, while `{x ≥ 0, 2 x₁ ≤ 1}` has the
  vertex `(1/2, 0)`.
- Degenerate shapes: with no rows the polyhedron is the orthant, with the vertex `0`; with no
  columns it is the single point of `ℝ⁰` or empty (when some `b i < 0`). In both cases both sides
  hold. A zero row only requires `0 ≤ b i`, and a zero column `j` forces `x j = 0` at every vertex;
  neither decides the two sides, since `(2 0; 0 0)` has both and is not totally unimodular.
- On all `8612` matrices with entries in `{−1, 0, 1, 2}` of sizes up to `2 × 3` and `3 × 2`, with
  `b` in `{−2, …, 2}^m`, and on all `19683` matrices of size `3 × 3` with entries in `{−1, 0, 1}`
  with `b` in `{−1, 0, 1}³`, total unimodularity and integrality of all vertices agree.

*Needs:* 1.1, 1.2; Mathlib `Matrix.IsTotallyUnimodular.fromRows_unitlike`, `Matrix.inv_def`.

### 2.3 Ghouila-Houri's characterisation

Prove `isTotallyUnimodular_iff_forall_finset_signs`: for `A : Matrix m n ℤ` (any index types),
`A.IsTotallyUnimodular` holds if and only if for every finite set `R` of rows there are signs
`ε i ∈ {1, −1}` (`i ∈ R`) with `∑ i ∈ R, ε i * A i j ∈ {0, 1, −1}` for every column `j`. The
characterisation is Ghouila-Houri's; no source with a proof was opened, and the route below
is complete. (Proved here.)

Route. *Only if:* the submatrix on the rows `R` has entries `0`, `±1`, so it has only finitely many
distinct columns; keep one column of each kind, giving a totally unimodular matrix `M` with rows `R`
and finitely many columns (Mathlib `Matrix.IsTotallyUnimodular.submatrix`). Let `d = 1ᵀ M`. The
polytope of `y : R → ℝ` with `0 ≤ y ≤ 1` and `⌊d/2⌋ ≤ yᵀ M ≤ ⌈d/2⌉` columnwise contains `y = 1/2`
and is compact. Its constraint matrix consists of `Mᵀ`, `−Mᵀ` and the rows `±eᵢ`, with integer
right-hand side. It is totally unimodular: a square submatrix containing both the row of a column of
`M` and its negative has determinant `0`, and any other one becomes, after changing the signs of
some of its rows, a square submatrix of `Mᵀ` stacked with the unit rows `±eᵢ` (Mathlib
`Matrix.transpose_isTotallyUnimodular_iff`, `Matrix.IsTotallyUnimodular.fromRows_unitlike`). So the
polytope has a vertex (`IsCompact.extremePoints_nonempty`), integral by 1.2, that is `y ∈ {0, 1}^R`.
Put `ε = 1 − 2 y`. Then `εᵀ M = d − 2 yᵀ M`, which is `0` in a column where `d` is even and `±1`
where `d` is odd; extend `ε` to all rows arbitrarily. *If:* taking `R = {i}`, every entry is in
`{0, ±1}`. Suppose all square submatrices of order less than `k` have determinant in `{0, ±1}`, and
let `B` be a nonsingular `k × k` submatrix with `k ≥ 2`. Its adjugate `B̃ = det(B) · B⁻¹` has
entries `0`, `±1`, being minors of order `k − 1`. Let `ρ` be the first row of `B̃`, so
`ρ B = det(B) e₁ᵀ`, and let `K ≠ ∅` be its support. Sign the rows of `A` in `K` by hypothesis and
let `z` be the signs on `K` and `0` elsewhere, restricted to the rows of `B`; then `z B` has entries
in `{0, ±1}`. For each column `j`, `(z B) j − (ρ B) j = ∑ i ∈ K, (z i − ρ i) B i j` with
`z i − ρ i ∈ {0, ±2}`, so `(z B) j` is even for `j ≠ 1`, hence `0`. Since `z ≠ 0` and `B` is
nonsingular, `z B = ±e₁ᵀ`, so `z = ±e₁ᵀ B⁻¹ = ±ρ / det B`; comparing a coordinate in `K`, where `z`
and `ρ` are `±1`, gives `det B = ±1`.

**Checks.**
- The incidence matrix of the triangle, rows `(1, 1, 0)`, `(0, 1, 1)`, `(1, 0, 1)`, has
  determinant `2`; for `R` all three rows, each of the `8` signings gives some column the signed
  sum `2` or `−2`, since the three columns would need `ε₁ = −ε₂`, `ε₂ = −ε₃` and `ε₁ = −ε₃`.
- `R = ∅` imposes nothing (the empty sum is `0`); a single row containing an entry `2` fails for
  `R` that row.
- The condition agrees with total unimodularity on all `8612` matrices with entries in
  `{−1, 0, 1, 2}` of sizes `1 × 1`, `1 × 2`, `1 × 3`, `2 × 1`, `2 × 2`, `2 × 3`, `3 × 1` and
  `3 × 2`, on all `19683` matrices of size `3 × 3` with entries in `{−1, 0, 1}`, and on the
  `75921` matrices of size `3 × 4` with entries in `{−1, 0, 1}` whose position in the
  lexicographic order (entries ordered `−1 < 0 < 1`, read row by row, positions counted from
  `0`) is a multiple of `7`.

*Needs:* 1.2; Mathlib `Matrix.IsTotallyUnimodular.submatrix`, `Matrix.isTotallyUnimodular_iff`,
`Matrix.transpose_isTotallyUnimodular_iff`, `Matrix.IsTotallyUnimodular.fromRows_unitlike`,
`IsCompact.extremePoints_nonempty`, `Matrix.adjugate`, `Matrix.adjugate_mul`.

### Examples

- The row form of 2.3 for the transpose is the column form: by Mathlib's
  `Matrix.transpose_isTotallyUnimodular_iff`, a matrix is totally unimodular exactly when every
  finite set of columns can be signed with signed sum in `{0, ±1}`.
- For `A` with rows `Fin r`, the matrix `(I A)` has real rank `r`, and its `r × r` minors are, up
  to sign, the square minors of `A` (including the empty one). So 2.1 applied to `(I A)` says that
  `A` is totally unimodular exactly when every vertex of `{(s, x) ≥ 0 | s + A x = b}` is integral
  for every integral `b`; Mathlib's `Matrix.one_fromCols_isTotallyUnimodular_iff` is the matrix
  side of this.

### Dependencies

2.1 uses 1.1 and 1.2. 2.2 uses 1.1 and 1.2. 2.3 uses 1.2. No target of this layer uses another.

## Layer 3: classes of totally unimodular matrices

### 3.1 At most one `1` and one `−1` in each column

Prove `isTotallyUnimodular_of_forall_col`: a matrix `A : Matrix m n ℤ` with entries in
`{0, 1, −1}`, at most one entry `1` and at most one entry `−1` in each column is totally
unimodular (Schrijver, Theorem 8.4 and its proof, pp. 143–144; the proof treats exactly this
class, of which incidence matrices of directed graphs are the case with both entries present).

Route. By induction on the order `k` of a square submatrix `B`. If a column of `B` is zero,
`det B = 0`. If a column has exactly one nonzero entry, expand along it (Mathlib
`Matrix.det_succ_column`); the cofactor is a square submatrix of order `k − 1`. Otherwise every
column of `B` has one `1` and one `−1`, the rows of `B` sum to zero, and `det B = 0`.

**Checks.**
- Two entries `1` in a column break it: rows `(1, 1, 0)`, `(0, 1, 1)`, `(1, 0, 1)` give
  determinant `2`; with all signs reversed (two entries `−1` per column), `−2`.
- An entry `2` breaks it already for the `1 × 1` minor.
- A column of length `k` in this class is zero, a single `±1`, or one `1` and one `−1`: `k² + k + 1`
  choices. Every square submatrix of a matrix of the class is in the class, and all `3`, `49`,
  `2197` and `194481` square matrices of the class of orders `1` to `4` have determinant in
  `{0, ±1}`; so in particular all `234549` matrices of the class of sizes `2 × 2`, `3 × 3`,
  `3 × 4`, `4 × 3` and `4 × 4` are totally unimodular.

*Needs:* Mathlib `Matrix.IsTotallyUnimodular`, `Matrix.det_succ_column`,
`Matrix.det_eq_zero_of_column_eq_zero`, `Matrix.exists_vecMul_eq_zero_iff`.

### 3.2 Incidence matrices of bipartite graphs

Prove `isTotallyUnimodular_incMatrix_iff`: a simple graph `G` on any vertex type is bipartite if
and only if `G.incMatrix ℤ` is totally unimodular (Schrijver, Theorem 8.3, p. 139, for finite
graphs; the vertex type here may be infinite).

Route. *If bipartite:* multiply the rows of the vertices of one colour by `−1`. Every edge
column then has one `1` and one `−1`, other columns are zero, so the result is totally unimodular
by 3.1, and each minor of `G.incMatrix ℤ` is `±` the corresponding minor of the result.
*If totally unimodular:* if `G` is not bipartite, Mathlib's
`SimpleGraph.two_colorable_iff_forall_loop_even` gives a closed walk of odd length; take one of
least odd length `k`, at `v₀, …, v_(k−1)`. Its vertices are distinct, since a repeated vertex
splits it into two shorter closed walks whose lengths add to `k`, one of them odd; and `k ≥ 3`,
since a simple graph has no loops. The edges `eᵢ = s(vᵢ, vᵢ₊₁)` (indices mod `k`) are then
distinct, and the submatrix on the rows `vᵢ` and the columns `eᵢ` has entry `1` exactly at
`(vᵢ, eᵢ)` and `(vᵢ₊₁, eᵢ)`. It is the identity plus a cyclic permutation matrix of odd order, of
determinant `1 + (−1)^(k+1) = 2`, so `G.incMatrix ℤ` is not totally unimodular. (The parity
splitting of a shortest odd closed walk is proved here; Schrijver uses the existence of an odd
circuit without proof.)

**Checks.**
- The triangle has incidence determinant `2`, the five-cycle also `2`.
- Coefficients matter: over `ZMod 3` every minor of the triangle's incidence matrix lies in
  `{0, 1, −1}` (its determinant `2` is `−1` there), although the triangle is not bipartite; the
  theorem is stated over `ℤ`.
- On all `1099` labelled simple graphs on one to five vertices, total unimodularity of the
  incidence matrix agrees with bipartiteness.

*Needs:* 3.1; Mathlib `SimpleGraph.incMatrix`, `SimpleGraph.incMatrix_apply`,
`SimpleGraph.IsBipartite`, `SimpleGraph.two_colorable_iff_forall_loop_even`,
`SimpleGraph.Walk`, `Matrix.det_permute'`.

### Examples

- The complete bipartite graph on two plus two vertices: its `4 × 4` incidence matrix has rank `3`
  (the two colour classes have equal row sums), all its minors are in `{0, ±1}`, and the full
  determinant is `0`.
- By 2.2 and 3.2, for a finite bipartite graph and integer `b`, the vertices of the set of edge
  vectors `x ≥ 0` whose sum over the edges at each vertex `v` is at most `b v` are integral; for
  `b = 1` this is the starting point of Layer 4.
- *Directed multigraphs.* For an arrow family `Q` on a type `V` with decidable equality, the
  vertex–arrow incidence matrix, indexed by `V` and the arrows `Σ x y, Q x y`, has in the column
  of an arrow from `x` to `y` the entry `1` at `x` minus `1` at `y`: `+1` where the arrow leaves,
  `−1` where it enters (the sign convention of Schrijver's (44), p. 143, which has no loops), and
  a zero column for a loop. Each column is zero or `e_x − e_y` with `x ≠ y`, so 3.1 makes it
  totally unimodular, with loops, parallel arrows and any number of vertices (Schrijver, Theorem
  8.4, p. 144, for finite directed graphs without loops). Applied to an arrow assignment with
  finitely many arrows it gives outgoing minus incoming, the negative of the excess used by
  GraphConnectivityAndFlows and Tau Ceti's network library. All `511` nonempty sets of arrows on
  the vertices `0, 1, 2`, each of the nine ordered pairs (the three loops included) used at most
  once, give totally unimodular incidence matrices.
- *Interval matrices.* If the columns carry a linear order and every row is the indicator of an
  order-connected set of columns (Mathlib `Set.OrdConnected`: an interval, possibly empty), the
  matrix is totally unimodular, for any index types and with repeated rows allowed (Schrijver,
  Corollary 8.4c, p. 146, for finite matrices). This
  follows from the target
  `intervalMatrix_totallyUnimodular` of TensorProductCombinatorics §2.6, whose matrix for `N`
  has rows `Fin (N − 1)` and, in the column of `(i, j)` with `i < j < N`, the indicator of
  `i ≤ k < j`; its transpose has as rows exactly the nonempty intervals of `Fin (N − 1)`. In a
  `t × t` submatrix, order the columns increasingly (this changes the determinant by a sign,
  Mathlib `Matrix.det_permute'`); a zero row gives determinant `0`
  (`Matrix.det_eq_zero_of_row_eq_zero`), and every other row is the
  indicator of positions `p, …, q` of `Fin t`, the row `(p, q + 1)` of the transpose of the matrix
  for `N = t + 1`. So the reordered submatrix is a submatrix of that transpose, and Mathlib's
  `Matrix.IsTotallyUnimodular.transpose` and `Matrix.IsTotallyUnimodular.submatrix` apply. The
  interval condition is needed: the rows `(1, 0, 1)`, `(1, 1, 0)`, `(0, 1, 1)` give determinant
  `2`. All `35523` matrices whose rows are indicators of intervals (the empty one included) of
  sizes `3 × 3`, `4 × 3`, `3 × 4`, `4 × 4` and `5 × 3` are totally unimodular.

### Dependencies

3.1 uses only Mathlib. 3.2 uses 3.1. The interval-matrix Example uses TensorProductCombinatorics
§2.6.

## Layer 4: matching polytopes of bipartite graphs

In this layer `V` is finite, `G` is a simple graph on `V`, and edge vectors are functions
`x : G.edgeSet → ℝ`; the sum at a vertex `v` is `∑ e : G.edgeSet, G.incMatrix ℝ v e * x e`, the
sum of `x` over the edges at `v`. The indicator vector of a subgraph `M` is
`Set.indicator {e | (e : Sym2 V) ∈ M.edgeSet} 1`.

### 4.1 The matching polytope

Prove `setOf_incMatrix_le_one_eq_convexHull`: if `G` is bipartite, the set of `x ≥ 0` with sum at
most `1` at every vertex equals the convex hull of the indicator vectors of the matchings of `G`
(Schrijver, Corollary 8.3d, p. 142).

Route. The indicator vector of a matching lies in the set, which is convex, so the hull is
contained in it. Conversely, the set `Q` is closed and bounded (`x e ≤ 1` from the sum at an end
of `e`), hence compact, and by Mathlib's `closure_convexHull_extremePoints` it is the closure of
the convex hull of its vertices. It is cut out by `G.incMatrix ℤ` restricted to the edge columns,
totally unimodular by 3.2 and Mathlib's `Matrix.IsTotallyUnimodular.submatrix`, stacked with the
rows `−eⱼ` (`Matrix.IsTotallyUnimodular.fromRows_unitlike`), so by 1.2 its vertices are integral.
An integral point of `Q` takes values in `{0, 1}`, and its support `S` is a set of pairwise
disjoint edges; the subgraph with the ends of `S` as vertices and `S` as edges is a matching with
this indicator vector. The vertices of `Q` therefore lie in the finite set of matching vectors,
whose convex hull is closed (`Set.Finite.isClosed_convexHull`), so `Q` is contained in it.

**Checks.**
- Bipartiteness is needed: on the triangle `x = (1/2, 1/2, 1/2)` has sum `1` at every vertex, but
  every matching has at most one edge, so every point of the hull has coordinate sum at most `1`,
  against `3/2`. The set has the vertex `(1/2, 1/2, 1/2)` besides the four matching vectors.
- On all `427` bipartite graphs on one to five labelled vertices (`1`, `2`, `7`, `41` and `376`
  of them), the vertices of `Q`, enumerated exactly, are the indicator vectors of the matchings.
- The empty graph on `V`: both sides are the single point of `ℝ^∅`, the indicator of the empty
  matching.

*Needs:* 1.2, 3.2; Mathlib `SimpleGraph.Subgraph.IsMatching`, `closure_convexHull_extremePoints`,
`Set.Finite.isClosed_convexHull`, `Matrix.IsTotallyUnimodular.submatrix`,
`Matrix.IsTotallyUnimodular.fromRows_unitlike`, `Metric.isCompact_of_isClosed_isBounded`.

### 4.2 The perfect matching polytope

Prove `setOf_incMatrix_eq_one_eq_convexHull`: if `G` is bipartite, the set of `x ≥ 0` with sum
exactly `1` at every vertex equals the convex hull of the indicator vectors of the perfect
matchings of `G` (Schrijver, Corollary 8.3e, p. 142).

Route. The set `Q'` is the part of the set `Q` of 4.1 where every vertex constraint is tight; it
is an extreme subset of `Q` (if a proper convex combination of two points of `Q` has sum `1` at
`v`, so do both points), so its vertices are vertices of `Q`
(`IsExtreme.extremePoints_subset_extremePoints`) and integral, that is matching vectors whose
matching covers every vertex: perfect matchings. As in 4.1, `Q'` is compact and convex, equal to
the closure of the convex hull of its vertices, which lies in the closed hull of the finitely many
perfect matching vectors; the reverse inclusion holds because these vectors lie in `Q'`. When `Q'`
is empty both sides are empty. (4.2 also follows from the statement of 4.1: in a convex
combination of matching vectors equal to a point of `Q'`, every matching of positive weight has
sum `1` at every vertex, so it is perfect. It also follows from Mathlib's Birkhoff theorem: with
colour classes `L` and `R`, every edge has one end in each, so the total of a point of `Q'` over
the edges is both `|L|` and `|R|`; after a bijection `R ≃ L` the point is a doubly stochastic
`L × L` matrix vanishing off the edges, and in a convex combination of permutation matrices for it
(`exists_eq_sum_perm_of_mem_doublyStochastic`) every permutation matrix of positive weight vanishes
off the edges too and is the indicator of a perfect matching. Both derivations need several
steps, and the route above is the one through total unimodularity, which 4.1 needs anyway.)

**Checks.**
- An isolated vertex makes both sides empty: its sum is `0`, and no perfect matching exists.
- On the triangle the set is the single point `(1/2, 1/2, 1/2)`, while the triangle has no perfect
  matching: bipartiteness is needed.
- For the complete bipartite graph with `n` vertices on each side, edge vectors are `n × n`
  matrices and the set is that of doubly stochastic matrices; 4.2 is then Birkhoff's theorem,
  Mathlib's `doublyStochastic_eq_convexHull_permMatrix`.
- On the `427` bipartite graphs of the Check of 4.1 the vertices of `Q'` are the perfect matching
  vectors.

*Needs:* 4.1 (its route), 1.2, 3.2; Mathlib `SimpleGraph.Subgraph.IsPerfectMatching`,
`IsExtreme.extremePoints_subset_extremePoints`, `closure_convexHull_extremePoints`,
`Set.Finite.isClosed_convexHull`.

### Examples

- A path with three edges `ab`, `bc`, `cd`: the matching polytope has the five matching vectors
  `0`, `e_ab`, `e_bc`, `e_cd`, `e_ab + e_cd` as vertices, and the perfect matching polytope is
  the single point `e_ab + e_cd`.

### Dependencies

4.1 uses 1.2 and 3.2. 4.2 uses 1.2, 3.2 and the route of 4.1.

## Scope and ownership

This roadmap owns the vertex criterion for polyhedra `{x | A x ≤ b}`, integrality of vertices and
of attained optima for totally unimodular matrices, the equality form for unimodular matrices of
full row rank, the Hoffman–Kruskal theorem in vertex form, Ghouila-Houri's characterisation, total
unimodularity of the matrices with at most one `1` and one `−1` in each column, the
characterisation of bipartite graphs by their incidence matrices, and the matching and perfect
matching polytopes of bipartite graphs, all stated above. The incidence matrices of directed
multigraphs and the interval matrices are Examples of Layer 3, not targets.

Already in the libraries, and consumed rather than restated:

- Mathlib's `Matrix.IsTotallyUnimodular` with its API: total unimodularity of submatrices (with
  repeated rows and columns allowed), of transposes and reindexings, of matrices without rows or
  columns, and of a matrix stacked with rows having at most one nonzero entry `±1`, in particular
  with an identity matrix or zero rows. Mathlib proves no integrality theorem for these matrices.
- Mathlib's Birkhoff theorem `doublyStochastic_eq_convexHull_permMatrix` and
  `extremePoints_doublyStochastic`: over the reals it is the case of 4.2 for complete bipartite
  graphs with equal sides.
- Tau Ceti's `TauCeti.IsConvexPolyhedron` is the general predicate for solution sets of finitely
  many affine inequalities; every polyhedron above is one. The statements here need the explicit
  matrix form, so the predicate is not used.

Left to other roadmaps:

- TensorProductCombinatorics §1.5 defines `realFibre`, copied verbatim into `Suggested.lean`, and
  uses integrality of basic feasible solutions for matrices with unit maximal minors in its routes
  (positivity of the vector partition function, the vertices of a generic chamber); 2.1 above states
  this integrality as a theorem, together with its converse. Its §2.6 owns the total
  unimodularity of its type-A interval matrix (`intervalMatrix_totallyUnimodular`); the
  interval-matrix Example of Layer 3 derives every interval matrix from it and states no target.
- GraphConnectivityAndFlows owns max-flow/min-cut with integrality (Layer 3, flows, §3.1),
  bounded circulations with integrality and rounding (Layer 8, §8.2 and §8.7) and the multiset
  capacitated Kőnig theorem (Layer 6, §6.7), proved there by flow methods. The flow integrality
  that Schrijver derives from the incidence matrices of directed graphs (Corollaries 8.4a–b) and
  Kőnig's matching theorem (Corollary 8.3a) are not restated here.
- MatchingTheory owns Kőnig's edge cover theorem (its 1.3; Schrijver's Corollary 8.3b), which is
  not restated here.
- MinimumCostFlowsAndWeightedBipartiteMatching owns integrality of least-cost flows (1.4),
  transportation integrality (2.1) and Egerváry's theorem (2.2), proved there by flow methods
  without total unimodularity; the first part of Schrijver's Corollary 8.3c (weighted matchings)
  is a case of Egerváry's theorem, and neither part of 8.3c is restated here.
- MatchingTheory lists weighted matchings and the matching polytope outside its scope; Layer 4
  above states the bipartite matching and perfect matching polytopes. ApproximationGuarantees 2.2
  states half-integrality of the vertices of the fractional vertex cover polyhedron of an
  arbitrary graph; integrality for finite bipartite graphs, which follows from 2.2 and 3.2 above
  applied to the negated transpose of the incidence matrix restricted to the edge columns, is not
  stated as a target here.
- ConvexAnalysisAndDuality owns the Minkowski–Weyl theorem (§1.3), Farkas' lemma (§1.4) and
  linear-programming duality (§5.3). The dual integrality of Schrijver's Corollary 8.1b, the
  characterisation through both sides of the duality equation, and every statement phrased through
  the convex hull of the integer points of an unbounded polyhedron need these and are not treated
  here; this roadmap does not depend on that one.

Not treated here: total dual integrality and the Edmonds–Giles theorem, network matrices,
Seymour's decomposition, the two-commodity flow theorems of Hu and of Rothschild and Whinston,
multicommodity flows, and the theorem that a linear function bounded above on a nonempty
polyhedron attains its maximum (for programs over `{x ≥ 0 | A x = b}` this attainment is part of
ConvexAnalysisAndDuality §5.3).

Outside the scope: every procedure (recognition of totally unimodular matrices, the simplex
method, matching algorithms) and running times.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/Determinant/TotallyUnimodular.lean`: `Matrix.IsTotallyUnimodular`
  (every square submatrix on injective row and column maps has determinant in the range of
  `SignType.cast`); `Matrix.isTotallyUnimodular_iff` (the same with arbitrary maps);
  `Matrix.IsTotallyUnimodular.apply` (entries in `{0, ±1}`); `Matrix.IsTotallyUnimodular.submatrix`
  (any row and column maps); `Matrix.transpose_isTotallyUnimodular_iff`;
  `Matrix.IsTotallyUnimodular.fromRows_unitlike` (for `[DecidableEq n]`, stacking rows each equal
  to `Pi.single j s` with `s` a sign, under `Nonempty n`); `Matrix.emptyRows_isTotallyUnimodular`;
  `Matrix.one_fromCols_isTotallyUnimodular_iff`.
- `Mathlib/Analysis/Convex/Extreme.lean`: `Set.extremePoints`,
  `mem_extremePoints_iff_forall_segment`, `IsExtreme`,
  `IsExtreme.extremePoints_subset_extremePoints`.
- `Mathlib/Analysis/Convex/KreinMilman.lean`: `IsCompact.extremePoints_nonempty` and
  `closure_convexHull_extremePoints` (for a compact, respectively compact convex, set in a
  Hausdorff locally convex real space, here `ι → ℝ` with `ι` finite).
- `Set.Finite.isClosed_convexHull` (a finite set has closed convex hull over `ℝ`);
  `IsCompact.exists_isMaxOn`; `Metric.isCompact_of_isClosed_isBounded`.
- Matrix algebra: `Matrix.mulVec`, `Matrix.rank`, `Matrix.det`, `Matrix.inv_def`,
  `Matrix.adjugate`, `Matrix.adjugate_mul`, `Matrix.det_mul`, `Matrix.det_transpose`,
  `Matrix.det_permute'`, `Matrix.det_succ_column`, `Matrix.det_eq_zero_of_column_eq_zero`,
  `Matrix.exists_vecMul_eq_zero_iff`.
- `Mathlib/Combinatorics/SimpleGraph/IncMatrix.lean`: `SimpleGraph.incMatrix` (for
  `[DecidableEq V] [DecidableRel G.Adj]`), `SimpleGraph.incMatrix_apply` (the indicator of the
  incidence set). `Mathlib/Combinatorics/SimpleGraph/Bipartite.lean`: `SimpleGraph.IsBipartite`
  (`G.Colorable 2`). `Mathlib/Combinatorics/SimpleGraph/Coloring/Constructions.lean`:
  `SimpleGraph.two_colorable_iff_forall_loop_even`. `SimpleGraph.Walk`.
- `Mathlib/Combinatorics/SimpleGraph/Matching.lean`: `SimpleGraph.Subgraph.IsMatching` (every
  vertex of the subgraph has exactly one neighbour in it), `SimpleGraph.Subgraph.IsPerfectMatching`
  (a spanning matching). `SimpleGraph.fintypeEdgeSet`.
- `Set.indicator`; `Set.OrdConnected`, `Matrix.IsTotallyUnimodular.transpose` and
  `Matrix.det_eq_zero_of_row_eq_zero` (in the interval-matrix Example of Layer 3);
  `exists_eq_sum_perm_of_mem_doublyStochastic` (in the remark of 4.2).
- Named in the scope section and the remark of 4.2, not used by a route:
  `Mathlib/Analysis/Convex/Birkhoff.lean`,
  `doublyStochastic_eq_convexHull_permMatrix`, `extremePoints_doublyStochastic`.

### From Tau Ceti

- Named in the scope section and the conventions, not used by a route:
  `TauCeti/Analysis/Convex/Polyhedron/Basic.lean`, `TauCeti.IsConvexPolyhedron`; the arrow
  families `Q : V → V → Type*` of `TauCeti/Combinatorics/Network/Basic.lean`, whose convention
  the directed-multigraph Example of Layer 3 follows.

### From TauCetiRoadmap.TensorProductCombinatorics

- §1.5: `realFibre`, copied verbatim (the definition and its `variable` line).
- §2.6: `intervalMatrix_totallyUnimodular` (total unimodularity of `intervalMatrix N`), used by
  the interval-matrix Example of Layer 3 only; no target or route of this roadmap uses a
  statement of that roadmap.

## References

- Alexander Schrijver, *A Course in Combinatorial Optimization*, lecture notes, version of
  March 23, 2017, on the author's page (`homepages.cwi.nl/~lex/files/dict.pdf`): §2.2 with
  Theorem 2.2, pp. 25–26; §8.1, pp. 132–133; §8.2 with Theorem 8.1 (p. 134), Corollary 8.1a
  (pp. 134–135), Theorem 8.2 (pp. 136–137) and Corollary 8.2a (pp. 137–138); §8.3 with
  Theorem 8.3 (p. 139) and Corollaries 8.3d–e (p. 142); §8.4 with the incidence matrix (44)
  (p. 143), Theorem 8.4 (p. 144) and Corollary 8.4c (p. 146).
- The Hoffman–Kruskal theorem (1956) and the proof of Veinott and Dantzig (1968) are attributed as
  in Schrijver's notes; Ghouila-Houri's characterisation is attributed by name only. The original
  papers were not consulted, and for Ghouila-Houri's theorem the route of 2.3 is complete.

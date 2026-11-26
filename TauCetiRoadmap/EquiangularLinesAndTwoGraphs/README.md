# Roadmap: equiangular lines and two-graphs

**Summary.** A set of lines through the origin is equiangular when any two of them make the same
angle `arccos α`. For lines in a real space, with a unit vector chosen on each line, the Gram matrix
is `I + α S` for the Seidel matrix `S` of a graph on the lines: zero diagonal, `−1` for adjacent and
`1` for nonadjacent pairs. Changing the signs of the vectors changes the graph by Seidel switching,
whose invariant is the two-graph, the set of triples spanning an odd number of edges. This roadmap
develops that dictionary and the classical bounds it yields, for finitely many vectors in real or
complex inner product spaces and for graphs.

- *Lines and Seidel matrices.* For `n` equiangular unit vectors of a real space, with angle
  `α > 0` and spanning a subspace of dimension `r`, every Seidel eigenvalue of the sign graph is
  at least `−1/α`, and `−1/α` has multiplicity `n − r`. Conversely, if `θ < 0` and `S − θ I` is
  positive semidefinite for the Seidel matrix of a graph on `n` vertices, with `θ` of multiplicity
  `m`, there are `n` unit vectors spanning `ℝ^(n − m)` with inner products `−S_ij/θ`.
- *Two-graphs and switching.* The odd triples of a graph form a two-graph, every two-graph arises
  so, and two graphs give the same two-graph exactly when they are switching equivalent. The
  two-graph is regular, every pair in the same number of odd triples, exactly when the Seidel
  matrix has at most two distinct eigenvalues.
- *The absolute and relative bounds.* An equiangular family of `n` unit vectors with angle
  `α < 1` in a real space of dimension `d` has `n ≤ d(d + 1)/2`, and in a complex one `n ≤ d²`.
  If `n` unit vectors of a real or complex space of dimension `d` have all mutual inner products
  of absolute value at most `α`, and `d α² < 1`, then `n ≤ d(1 − α²)/(1 − d α²)`. Equality in the
  real absolute bound with `d ≥ 2` forces `α² = 1/(d + 2)`; equality in the real relative bound
  with `α > 0` forces the Seidel matrix to have only the eigenvalues `(n − d)/(α d)` and `−1/α`,
  with multiplicities `d` and `n − d`, both odd integers when `d + 1 < n ≠ 2d`.
- *Neumann's theorem.* If `n > 2d` equiangular unit vectors with angle `α` lie in a real space of
  dimension `d`, then `1/α` is an odd integer.

The roadmap builds on Mathlib's adjacency and Gram matrices, its spectral theorem for Hermitian
matrices and its rank-one operators. It uses none of the neighbouring roadmaps:
StronglyRegularAndMooreGraphs states a different absolute bound, for strongly regular graphs;
LinearAlgebraMethodInCombinatorics bounds two-distance sets, which is weaker on equiangular
lines; SpectralGraphBounds treats the adjacency spectrum.

Layer 1 below defines Seidel matrices and switching, Layer 2 two-graphs and regular two-graphs,
Layer 3 the passage between lines and Seidel matrices, Layer 4 the absolute and relative bounds,
and Layer 5 the consequences of equality and Neumann's theorem. Layers 2 and 3 use Layer 1, and
Layer 5 uses Layers 1, 3 and 4.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V`; matrices indexed by its vertices need
  `[Fintype V]`, `[DecidableEq V]` and `[DecidableRel G.Adj]`, and `n = Fintype.card V`. The
  adjacency matrix is Mathlib's `G.adjMatrix R`, and `J` is the all-one matrix.
- **The Seidel matrix.** `seidelMatrix R G` has `0` on the diagonal, `-1` for adjacent and `1` for
  distinct nonadjacent vertices; it equals `J − I − 2A`. Its eigenvalues are called the Seidel
  eigenvalues of `G`.
- **Switching.** For `U : Set V`, `switch G U` keeps adjacency inside `U` and inside its
  complement and interchanges adjacency and nonadjacency between them. Two graphs are switching
  equivalent when one is a switch of the other; the classes are switching classes. Switching with
  respect to `U` and with respect to its complement give the same graph.
- **Two-graphs.** A set `Δ` of three-element finsets of `V` is a two-graph, `IsTwoGraph Δ`, when
  every four-element finset of `V` contains an even number of members of `Δ`; the members are the
  coherent triples. `oddTriples G` is the set of triples of distinct vertices of `G` spanning one
  or three edges. `IsRegularTwoGraph Δ a` says that every pair of distinct points lies in exactly
  `a` members of `Δ`; on at most one point it holds for every `a`. It is meant for finite `V`:
  `Set.ncard` is `0` on an infinite set.
- **Lines.** A system of `n` lines through the origin is given by a family `x : ι → E` of unit
  vectors, one on each line, with `ι` a finite type of `n` elements; `-x i` spans the same line.
  The family is equiangular with angle `α`, `IsEquiangular 𝕜 x α`, when `‖x i‖ = 1` for every `i`
  and `‖⟪x i, x j⟫_𝕜‖ = α` for `i ≠ j`, over `𝕜 = ℝ` or `ℂ` (Mathlib's `RCLike`). Then `α ≤ 1`
  as soon as there are two vectors, and the lines are distinct exactly when `α < 1`. A family with
  `α = 1` is allowed: it consists of the multiples `c • x 0` with `‖c‖ = 1`, that is, of the
  vectors `±x 0` over `ℝ`. Nothing is assumed of `α` when `n ≤ 1`.
- **The sign graph.** For a family in a real inner product space, `signGraph x` joins `i ≠ j`
  when `⟪x i, x j⟫ < 0`. When no inner product between distinct members vanishes, replacing
  `x i` by `-x i` for `i ∈ U` replaces the sign graph by its switch with respect to `U`.
- **Dimensions and multiplicities.** `d = Module.finrank 𝕜 E`, which Mathlib sets to `0` for an
  infinite-dimensional space. The bounds 4.1–4.3 and Neumann's theorem 5.3 carry
  `[FiniteDimensional 𝕜 E]`. The others do not need it: 3.1 concerns the span of finitely many
  vectors, 3.2 lives in `EuclideanSpace`, in 5.2 the hypothesis `d ≥ 2` forces finite dimension, and
  in 5.1 the equality with `d = 0` forces `n = 0`, where every claim holds. The multiplicity of a
  real number `θ` as an eigenvalue of a real square matrix `S` is the dimension of the eigenspace of
  `θ` for `Matrix.toLin' S`, which is `0` when `θ` is not an eigenvalue; for the symmetric Seidel
  matrix it equals the number of indices at which Mathlib's enumeration
  `Matrix.IsHermitian.eigenvalues` takes the value `θ`; the statements do not use that enumeration.
- **Quotients** are Lean's real division, with `t / 0 = 0` and `0⁻¹ = 0`; every statement that
  divides by `α`, `d` or `1 − d α²` carries a hypothesis making the divisor nonzero, or is true at
  the junk value, as its Checks record.

## Layer 1: Seidel matrices and switching

### 1.1 The Seidel matrix

Define `seidelMatrix R G` for a ring `R`, as in the Conventions. Its basic theory, proved here:

- It equals `J − I − 2 G.adjMatrix R`, it is symmetric with zero diagonal, and its entries off
  the diagonal are units with square `1`.
- The Seidel matrix of the complement `Gᶜ` is `−seidelMatrix R G`, so complementary graphs have
  opposite Seidel eigenvalues.
- If `G` is `k`-regular with adjacency eigenvalues `k` (on the all-one vector) and `θ` (on vectors
  orthogonal to it), its Seidel eigenvalues are `n − 1 − 2k` and the numbers `−1 − 2θ`
  (Brouwer–Haemers, §1.8.2, p. 23).

**Checks.**
- The pentagon `C₅` is `2`-regular with adjacency eigenvalues `2`, `(−1 + √5)/2` twice and
  `(−1 − √5)/2` twice, so its Seidel eigenvalues are `0`, `−√5` twice and `√5` twice.
- For `C₅` with an isolated sixth vertex, `S² = 5I`; for the path on three vertices,
  `S² = S + 2I`, with eigenvalues `2` once and `−1` twice. The graph is not regular in either case.
- The zero diagonal matters: with `J − 2A` in place of `J − I − 2A` the trace would be `n`, not
  `0`, and the complement would not negate the matrix.

*Needs:* Mathlib `SimpleGraph.adjMatrix`, `Matrix.of`. (Proved here.)

### 1.2 Switching

Define `switch G U` as in the Conventions, with its decidable adjacency
`instDecidableRelSwitch`. Prove `seidelMatrix_switch`: for a finite vertex type and a ring `R`,
the Seidel matrix of `switch G U` is `D S D`, where `S = seidelMatrix R G` and `D` is the diagonal
matrix with `-1` at the vertices of `U` and `1` elsewhere (Brouwer–Haemers, §1.8.2, pp. 23–24).

Route: entrywise; the entry `(u, v)` of `D S D` is `S u v` multiplied by `-1` exactly when one and
only one of `u`, `v` lies in `U`, which is the change of adjacency made by switching. Since
`D D = 1`, the two matrices are similar, so switching equivalent graphs have the same characteristic
polynomial of the Seidel matrix (Mathlib `Matrix.charpoly_units_conj`) and the same Seidel spectrum
with multiplicities.

**Checks.**
- Switching the edgeless graph on four vertices with respect to one vertex gives the star `K₁,₃`;
  switching it with respect to two vertices gives the four-cycle.
- Switching with respect to `U` and with respect to its complement give the same graph, and every
  switching class on `n ≥ 1` labelled vertices has exactly `2^(n − 1)` members.
- For the edgeless graph on four vertices and `U = {u}`, `D (J − I) D` has `−1` off the diagonal
  exactly in the row and the column of `u`: the Seidel matrix of the star `K₁,₃`.

*Needs:* 1.1; Mathlib `Matrix.diagonal`, `Matrix.charpoly_units_conj`. (Proved here, following
the cited text.)

### Examples

The pentagon and the pentagon with an isolated vertex; the path on three vertices; the edgeless
and complete graphs, with Seidel matrices `J − I` and `I − J`; all graphs on at most six vertices
as in the Checks.

### Dependencies

Mathlib `SimpleGraph.adjMatrix`, `Matrix.of`, `Matrix.diagonal`, `Matrix.charpoly_units_conj`. No
other layer.

## Layer 2: two-graphs

### 2.1 The two-graph of a graph

Define `IsTwoGraph` and `oddTriples` as in the Conventions. Prove `isTwoGraph_oddTriples`: for
every graph `G` (on any type with decidable equality), `oddTriples G` is a two-graph
(Brouwer–Haemers, §10.2, pp. 148–149).

Route: the members of `oddTriples G` have three elements. In a four-element set, each of the six
pairs lies in exactly two of the four triples, so the numbers of edges spanned by the four
triples add up to twice the number of edges of the set, an even number; hence an even number of
these triples span an odd number of edges.

**Checks.**
- On a four-element set the number of odd triples is `0`, `2` or `4`: the edgeless graph and
  `K₁,₃` give `0`, a single edge gives `2`, and the complete graph gives `4`.
- The number of two-graphs on `n` labelled points is `1, 1, 1, 2, 8, 64` for `n = 0, …, 5`
  (counted among all sets of triples), which is `2^C(n − 1, 2)` for `n ≥ 1`; up to isomorphism
  there are `1, 1, 1, 2, 3, 7, 16` two-graphs on `n ≤ 6` points, the values tabulated in
  Brouwer–Haemers, p. 149.

*Needs:* Mathlib `Finset.card_eq_three`, `Set.ncard`. (Proved here.)

### 2.2 Two-graphs and switching classes

Prove `oddTriples_eq_oddTriples_iff`: two graphs `G`, `H` on the same vertex type have the same
odd triples if and only if `H = switch G U` for some set `U`. Prove `exists_oddTriples_eq`: every
two-graph `Δ` on `V` is `oddTriples G` for some graph `G`. Together they say that `oddTriples` is
a bijection from switching classes of graphs on `V` to two-graphs on `V` (Brouwer–Haemers, §10.2,
pp. 148–149).

Route: a triple contains either no pair or exactly two pairs separated by `U`, so switching does
not change the parity of the number of edges in a triple. Conversely, if `G` and `H` have the same
odd triples and `V` has a point `ω`, let `U` be the set of `v ≠ ω` at which `G.Adj ω v` and
`H.Adj ω v` differ; then `switch G U` and `H` agree on every pair containing `ω`, they have the
same odd triples, and the parity of the triple `{ω, x, y}` then decides the pair `{x, y}`. For
`exists_oddTriples_eq`, pick `ω`, make it isolated, and join `x ≠ y` distinct from `ω` when
`{ω, x, y} ∈ Δ`; the four-point condition applied to `{ω, x, y, z}` shows that a triple avoiding
`ω` is coherent exactly when it spans one or three edges. An empty `V` has only the empty
two-graph and the empty graph.

**Checks.**
- For `1 ≤ n ≤ 6` labelled vertices the `2^C(n, 2)` graphs fall into exactly `2^C(n − 1, 2)`
  classes with equal odd triples, each class is a full switching class, and for `n ≤ 5` every
  two-graph is the two-graph of a graph.
- On four vertices there are three switching classes up to isomorphism (the classes of the
  edgeless graph, of a single edge and of the complete graph), as drawn in Brouwer–Haemers,
  §1.8.2, p. 23.

*Needs:* 1.2, 2.1. (Proved here, following the cited text.)

### 2.3 Regular two-graphs and the square of the Seidel matrix

Define `IsRegularTwoGraph` as in the Conventions. Prove `isRegularTwoGraph_oddTriples_iff`: for
a graph `G` on `n` vertices and `a : ℕ`, the two-graph `oddTriples G` is regular of degree `a` if
and only if the integer Seidel matrix satisfies `S² = (n − 1) I + (n − 2 − 2a) S`. No hypothesis
on `n` is needed.

Route (proved here; Brouwer–Haemers characterise regular two-graphs through their descendants,
Theorem 10.3.1, p. 150, and this route is direct): the diagonal entries of `S²` are `n − 1`. For
`x ≠ y` and a third vertex `z`, the product `S_xy S_xz S_zy` is `(−1)` to the number of edges
among `x`, `y`, `z`, so it is `−1` exactly for the odd triples. Since `S_xy² = 1`,
`S_xy (S²)_xy = (n − 2) − 2 a(x, y)`, where `a(x, y)` is the number of odd triples containing `x`
and `y`. So the identity holds exactly when `a(x, y) = a` for all `x ≠ y`.

**Checks.**
- The pentagon with an isolated vertex: `S² = 5I = 5I + (6 − 2 − 2 · 2) S`, so its two-graph is
  regular of degree `2`.
- The 28 lines of 4.1 below give a regular two-graph of degree `10`: `S² = 27I + 6S`.
- On two points the two-graph is regular only of degree `0`, and `S² = I = I + (0 − 2a) S` holds
  only for `a = 0`; on at most one point both sides hold for every `a`.

*Needs:* 1.1, 2.1. (Proved here.)

### 2.4 Regular two-graphs have two Seidel eigenvalues

Prove `exists_isRegularTwoGraph_iff`: the two-graph of `G` is regular (of some degree) if and
only if there are real numbers `ρ₁`, `ρ₂` with `(S − ρ₁ I)(S − ρ₂ I) = 0` for the real Seidel
matrix `S`, that is, when `S` has at most two distinct eigenvalues; for `n ≥ 2` it then has
exactly two, with `ρ₁ + ρ₂ = n − 2 − 2a` and `ρ₁ ρ₂ = −(n − 1)` (Brouwer–Haemers, Theorem
10.3.1, (i) and (ii), p. 150, and the remark after the proof of Proposition 10.1.1, p. 148).

Route: if the two-graph is regular of degree `a`, take for `ρ₁`, `ρ₂` the roots of
`t² − (n − 2 − 2a) t − (n − 1)`, which are real (its discriminant is at least `4(n − 1)` for
`n ≥ 1`; for `n = 0` the matrix is empty), and use 2.3. Conversely, the relation gives
`S² = (ρ₁ + ρ₂) S − ρ₁ ρ₂ I`; comparing off-diagonal entries with the formula of the route of 2.3
gives `a(x, y) = (n − 2 − ρ₁ − ρ₂)/2` for all `x ≠ y`. For `n ≥ 2`, `S` is not a multiple of `I`,
so it has exactly two eigenvalues.

**Checks.**
- Of the `32768` graphs on six labelled vertices exactly `448` have a regular two-graph: `14` of
  the `1024` two-graphs, namely the empty and the complete ones and the twelve labelled copies of
  the two-graph of the pentagon with an isolated vertex, whose Seidel eigenvalues are `±√5`.
- On four and on five vertices only the empty and the complete two-graphs are regular; the single
  edge on four vertices gives a non-regular two-graph (the edge lies in two odd triples, the
  pair of the two other vertices in none).

*Needs:* 2.3. (Proved here; the statement is the cited theorem.)

### Examples

The two-graphs on at most six points; the pentagon with an isolated vertex (the regular two-graph
on six points); the 28 lines of 4.1 (a regular two-graph on 28 points of degree `10`).

### Dependencies

Layer 1 (1.1 for 2.3 and 2.4, 1.2 for 2.2). Mathlib `Finset.card_eq_three`, `Set.ncard`,
`Matrix.of`.

## Layer 3: equiangular systems and their Seidel matrices

### 3.1 From lines to Seidel matrices

Define `IsEquiangular` and `signGraph` (with its classical decidable adjacency
`instDecidableRelSignGraph`) as in the Conventions. Prove `gram_eq_and_finrank_eigenspace`: for
an equiangular family `x` of `n` unit vectors with angle `α > 0` in a real inner product space,

- the Gram matrix `Matrix.gram ℝ x` is `I + α S`, with `S` the real Seidel matrix of the sign
  graph;
- `S + α⁻¹ I` is positive semidefinite, so every eigenvalue of `S` is at least `−1/α`;
- the multiplicity of `−1/α` is `n − r`, where `r` is the dimension of the span of the `x i`.

So when the vectors are linearly dependent, `−1/α` is the least Seidel eigenvalue and its
multiplicity is `n` minus the dimension they span (Brouwer–Haemers, §10.6.1, p. 156, there for
`0 < α < 1` in `ℝ^d`; here `α = 1` is allowed). The space need not be finite-dimensional.

Route: the diagonal of the Gram matrix is `1`, and off it `⟪x i, x j⟫ = ±α` is `−α` exactly when
`i` and `j` are adjacent in the sign graph. Then `S + α⁻¹ I = α⁻¹ G` is positive semidefinite by
Mathlib `Matrix.posSemidef_gram` and `Matrix.PosSemidef.smul`, and the eigenspace of `−1/α` is the
kernel of `G`. Writing `G = Fᴴ F` in an orthonormal basis of the span (Mathlib
`Matrix.gram_eq_conjTranspose_mul`), `G c = 0` exactly when `∑ c i • x i = 0`, so the kernel has
dimension `n − r` by rank–nullity. By the Conventions, changing the signs of the `x i` in `U`
replaces the sign graph by its switch, so the Seidel matrix of an equiangular system is defined up
to switching, and 1.2 shows that its spectrum is not.

**Checks.**
- The six diagonals of the icosahedron, spanned by the vectors `(0, ±1, φ)`, `(±1, φ, 0)`,
  `(φ, 0, ±1)` with `φ = (1 + √5)/2`, are equiangular with `α = 1/√5`; the Seidel matrix of their
  sign graph satisfies `S² = 5I`, with eigenvalues `−√5` and `√5`, each of multiplicity `3`, and
  the Gram matrix has rank `3`. Any five of the six lines give `−√5` with multiplicity `5 − 3 = 2`.
- The hypothesis `α > 0` is needed: an orthonormal basis of `ℝ²` is equiangular with `α = 0`, its
  sign graph is edgeless, and `S + 0⁻¹ I = J − I` has the eigenvalue `−1`.
- With `α = 1`, the vectors `e₁`, `−e₁`, `e₁` of `ℝ¹` have Seidel eigenvalues `2` and `−1`
  (twice), and `−1` has multiplicity `3 − 1 = 2`, as stated.

*Needs:* 1.1; Mathlib `Matrix.gram`, `Matrix.posSemidef_gram`, `Matrix.PosSemidef.smul`,
`Matrix.gram_eq_conjTranspose_mul`, `Module.End.eigenspace`, `Matrix.toLin'`,
`LinearMap.finrank_range_add_finrank_ker`, `Submodule.span`. (Proved here, following the cited
text.)

### 3.2 From Seidel matrices to lines

Prove `exists_equiangular_of_posSemidef`: let `G` be a graph on `n` vertices with real Seidel
matrix `S`, let `θ < 0` be such that `S − θ I` is positive semidefinite, and let `m` be the
multiplicity of `θ`. Then there are `n` unit vectors of `ℝ^(n − m)` (Mathlib `EuclideanSpace`)
spanning it, with `⟪x i, x j⟫ = −θ⁻¹ S i j` for `i ≠ j`: an equiangular family with angle `−1/θ`
whose sign graph is `G`. Taking for `θ` the least Seidel eigenvalue gives the converse of 3.1
(Brouwer–Haemers, §10.6.1, p. 156).

Route: `A = S − θ I` is positive semidefinite of rank `n − m`, since its kernel is the eigenspace
of `θ`. By the spectral theorem (Mathlib `Matrix.IsHermitian.spectral_theorem`,
`Matrix.PosSemidef.eigenvalues_nonneg`, `Matrix.IsHermitian.rank_eq_card_non_zero_eigs`), `A` is
the Gram matrix of `n` vectors `y i` of `ℝ^(n − m)` that span it. Its diagonal is `−θ`, so the
vectors `x i = (−θ)^(−1/2) y i` are unit vectors with Gram matrix `I − θ⁻¹ S`.

**Checks.**
- The hypothesis `θ < 0` is needed: on one vertex `S = 0`, so `θ = 0` satisfies the
  semidefiniteness, has multiplicity `1`, and there is no unit vector in `ℝ⁰`.
- The pentagon has least Seidel eigenvalue `−√5` of multiplicity `2`: five equiangular lines in
  `ℝ³` with `α = 1/√5`, five of the six diagonals of the icosahedron. The pentagon with an
  isolated vertex gives all six.
- The path on three vertices has least Seidel eigenvalue `−1`, of multiplicity `2`: three unit
  vectors of `ℝ¹`, so `α = 1` and the lines coincide. Every graph on at least two vertices has
  least Seidel eigenvalue at most `−1`, since `S` has a principal `2 × 2` submatrix with
  eigenvalue `−1`; distinct lines arise exactly when it is below `−1`.
- If `θ` is not an eigenvalue, `m = 0` and the vectors form a basis of `ℝⁿ`.

*Needs:* 1.1; Mathlib `Matrix.IsHermitian.spectral_theorem`,
`Matrix.PosSemidef.eigenvalues_nonneg`, `Matrix.IsHermitian.rank_eq_card_non_zero_eigs`,
`Matrix.gram`, `EuclideanSpace`, `finrank_euclideanSpace`, `Module.End.eigenspace`,
`LinearMap.finrank_range_add_finrank_ker`. (Proved here, following the cited text.)

### Examples

The icosahedron and its subsystems; the pentagon and the pentagon with an isolated vertex; the
path on three vertices; orthonormal bases.

### Dependencies

Layer 1 (1.1). Mathlib `Matrix.gram`, `Matrix.posSemidef_gram`, `Matrix.PosSemidef.smul`,
`Matrix.gram_eq_conjTranspose_mul`, `Matrix.IsHermitian.spectral_theorem`,
`Matrix.PosSemidef.eigenvalues_nonneg`, `Matrix.IsHermitian.rank_eq_card_non_zero_eigs`,
`Module.End.eigenspace`, `Matrix.toLin'`, `LinearMap.finrank_range_add_finrank_ker`,
`EuclideanSpace`, `finrank_euclideanSpace`.

## Layer 4: the absolute and relative bounds

The three bounds use the rank-one projections `Xᵢ = InnerProductSpace.rankOne 𝕜 (x i) (x i)` onto
the lines, which are self-adjoint, satisfy `Xᵢ² = Xᵢ` and `tr Xᵢ = 1` for a unit vector, and
`tr (Xᵢ Xⱼ) = |⟪x i, x j⟫|²` (in coordinates, Tau Ceti's `TauCeti.rankOneHermitianProjector` with
`TauCeti.trace_rankOneHermitianProjector`).

### 4.1 The absolute bound

Prove `two_mul_card_le_of_isEquiangular`: if `x` is an equiangular family of `n` unit vectors
with angle `α < 1` in a real inner product space of finite dimension `d`, then
`2n ≤ d(d + 1)` (the absolute bound, attributed by Brouwer–Haemers to Gerzon; Brouwer–Haemers,
Theorem 10.6.1, p. 157).

Route: for `n ≤ 1` the bound holds since a unit vector forces `d ≥ 1`. For `n ≥ 2`, `0 ≤ α < 1`.
The `Xᵢ` are linearly independent in the real space of self-adjoint operators on `E`, of dimension
`d(d + 1)/2`: in an orthonormal basis these are the symmetric matrices, with basis the `E_ii` and
the `E_ij + E_ji` for `i < j`. Independence: if `∑ cᵢ Xᵢ = 0`, taking the trace of
the product with `Xⱼ` gives `cⱼ (1 − α²) + α² ∑ cᵢ = 0` for every `j`, so all `cⱼ` are equal, and
`∑ cᵢ = tr (∑ cᵢ Xᵢ) = 0` then forces `cⱼ = 0`.

**Checks.**
- Equality: three lines at `60°` in `ℝ²` (`α = 1/2`), the six diagonals of the icosahedron in
  `ℝ³` (`α = 1/√5`), and the 28 lines in `ℝ⁷` spanned by the vectors of `ℝ⁸` with two coordinates
  `3` and six coordinates `−1`, which lie in the hyperplane of coordinate sum zero, have norm
  squared `24` and mutual inner products `±8` (`α = 1/3`).
- The hypothesis `α < 1` is needed: `e₁`, `−e₁`, `e₁` in `ℝ¹` give `2 · 3 = 6 > 1 · 2`.
- `[FiniteDimensional ℝ E]` is needed: an orthonormal pair in an infinite-dimensional space has
  `α = 0` and `finrank = 0`, and `4 ≤ 0` fails.
- The unit vectors on `n` equiangular lines form a two-distance set (distances `√(2 ∓ 2α)`), so
  the two-distance bound gives only `n ≤ (d + 1)(d + 2)/2`: `6`, `10` and `36` against `3`, `6`
  and `28` for `d = 2, 3, 7`.

*Needs:* Mathlib `InnerProductSpace.rankOne`, `LinearMap.trace`, `LinearMap.IsSymmetric`,
`Module.finrank`, `real_inner_self_eq_norm_sq`, `abs_real_inner_le_norm`. (Proved here,
following the cited proof.)

### 4.2 The absolute bound over the complex numbers

Prove `card_le_sq_of_isEquiangular`: if `x` is an equiangular family of `n` unit vectors with
angle `α < 1` in a complex inner product space of finite dimension `d`, then `n ≤ d²`
(Brouwer–Haemers, Proposition 10.6.2, p. 157).

Route: as in 4.1, in the real space of self-adjoint operators on `E`, of real dimension `d²`: in an
orthonormal basis these are the Hermitian matrices, with real basis the `E_ii`, the `E_ij + E_ji`
and the `i (E_ij − E_ji)` for `i < j`; here `tr (Xᵢ Xⱼ) = |⟪x i, x j⟫|²`.

**Checks.**
- Equality for `d = 2`: the vectors `(1, 0)` and `(1/√3, √(2/3) ωᵏ)`, `k = 0, 1, 2`, with
  `ω = e^(2πi/3)`, are four unit vectors of `ℂ²` with `|⟪x i, x j⟫|² = 1/3` for `i ≠ j`.
- The hypotheses `α < 1` and `[FiniteDimensional ℂ E]` are needed, by the examples of 4.1 read
  over `ℂ`.

*Needs:* as 4.1, over `ℂ`. (Proved here, following the cited text.)

### 4.3 The relative bound

Prove `card_le_relativeBound`: over `𝕜 = ℝ` or `ℂ`, if `x` is a family of `n` unit vectors in an
inner product space of finite dimension `d` with `‖⟪x i, x j⟫‖ ≤ α` for `i ≠ j`, and `d α² < 1`,
then `n ≤ d(1 − α²)/(1 − d α²)` (the relative or special bound; Brouwer–Haemers, Proposition
10.6.3, p. 157, there for `n > 1`; the statement here includes `n ≤ 1`). The family need not be
equiangular.

Route: let `Y = ∑ Xᵢ − (n/d) I` (for `d ≥ 1`; if `d = 0` there is no unit vector and `n = 0`).
Then `0 ≤ tr Y² = ∑_(i,j) |⟪x i, x j⟫|² − n²/d ≤ n + n(n − 1) α² − n²/d`, using `α ≥ 0` when
`n ≥ 2`. Hence `n(1 − d α²) ≤ d(1 − α²)` for `n ≥ 1`, and dividing by `1 − d α² > 0` gives the
bound; for `n = 0` the right side is nonnegative since `α² < 1/d ≤ 1`.

**Checks.**
- Equality: an orthonormal basis (`α = 0`, `n = d`); three lines at `60°` in `ℝ²`
  (`2 · (3/4)/(1/2) = 3`); the icosahedron (`3 · (4/5)/(2/5) = 6`); the 28 lines
  (`7 · (8/9)/(2/9) = 28`); the four vectors of `ℂ²` of 4.2 (`2 · (2/3)/(1/3) = 4`); for `d ≥ 2`,
  the regular simplex of `d + 1` unit vectors in `ℝ^d` with inner products `−1/d`. Strict: any
  five of the six diagonals of the icosahedron.
- The hypothesis `d α² < 1` is needed: `e₁`, `−e₁` in `ℝ¹` with `α = 1` give the junk value
  `1 · 0 / 0 = 0 < 2`.
- `[FiniteDimensional 𝕜 E]` is needed: an orthonormal pair in an infinite-dimensional space gives
  `2 ≤ 0 · 1 / 1 = 0`.

*Needs:* Mathlib `InnerProductSpace.rankOne`, `LinearMap.trace`, `LinearMap.IsSymmetric`,
`Module.finrank`. (Proved here, following the cited proof.)

### Examples

Orthonormal bases; lines at `60°` in the plane; the icosahedron; the 28 lines in `ℝ⁷`; the four
equiangular lines of `ℂ²`; regular simplices.

### Dependencies

Mathlib `InnerProductSpace.rankOne`, `LinearMap.trace`, `LinearMap.IsSymmetric`,
`Module.finrank`, `real_inner_self_eq_norm_sq`, `abs_real_inner_le_norm`; Tau Ceti
`TauCeti.rankOneHermitianProjector`, `TauCeti.trace_rankOneHermitianProjector` for a route in
coordinates. No other layer.

## Layer 5: equality and integrality

### 5.1 Equality in the relative bound

Prove `seidelMatrix_of_card_eq_relativeBound`: let `x` be an equiangular family of `n` unit
vectors with angle `α > 0` in a real inner product space of dimension `d`, with `d α² < 1` and
`n(1 − d α²) = d(1 − α²)`, and let `S` be the Seidel matrix of its sign graph and
`ρ = (n − d)/(α d)`. Then

- `(S − ρ I)(S + α⁻¹ I) = 0`;
- `ρ` has multiplicity `d` and `−1/α` has multiplicity `n − d`;
- if `d + 1 < n` and `n ≠ 2d`, then `ρ` and `−1/α` are odd integers

(Brouwer–Haemers, Proposition 10.6.4, p. 158, under the hypothesis that `I` is a combination of
the `Xᵢ`; the passage from equality in 4.3 to that hypothesis is remarked there, p. 157, without
proof, and is proved here).

Route: if `d = 0` then `n = 0` and everything holds. Otherwise the chain of 4.3 is an equality,
so `tr Y² = 0` and `Y = 0`: `∑ Xᵢ = (n/d) I`. Let `F : ℝⁿ → E` send the `i`-th basis vector to
`x i`; then `F F* = (n/d) I` and `G = F* F` is the Gram matrix, so `F` is onto, `G` has the
eigenvalue `n/d` with multiplicity `d` and `0` with multiplicity `n − d`, and
`G² = (n/d) G`. Since `G = I + α S` (3.1), this is the first claim, and the multiplicities follow.
For the last claim, `d ≥ 2` (for `d = 1` the equality forces `n = 1`) and `n − d ≥ 2`. The
characteristic polynomial of the integer matrix `S` is `(t − ρ)^d (t + 1/α)^(n − d)`. Every root
of the minimal polynomial `p` of `ρ` over `ℚ` is a root of the characteristic polynomial with the
same multiplicity, since `p` is separable and the power of `p` dividing the characteristic
polynomial has a cofactor prime to `p`. So if `ρ` is irrational, its conjugate over `ℚ` is `−1/α`
with the same multiplicity, and `n = 2d`.
Otherwise `ρ` is a rational root of a monic integer polynomial, hence an integer, and
`d ρ − (n − d)/α = tr S = 0` makes `1/α` rational, hence an integer as well. Each eigenvalue `θ`
has multiplicity at least two, so it has an eigenvector orthogonal to the all-one vector, which is
an eigenvector of the adjacency matrix of the sign graph with eigenvalue `−(1 + θ)/2`, an integer;
so `θ` is odd.

**Checks.**
- The 28 lines: `ρ = 21/(7/3) = 9` with multiplicity `7` and `−3` with multiplicity `21`;
  `(S − 9I)(S + 3I) = 0`.
- The icosahedron: `n = 2d`, and `ρ = √5`, `−√5` are not integers, so `n ≠ 2d` is needed.
- The regular simplex in `ℝ²` (three lines at `60°`, `n = d + 1`): the Seidel eigenvalues are `1`
  (twice) and `−2` (once), and `−2` is even, so `d + 1 < n` is needed. In `ℝ³` the simplex gives
  `1` and `−3`.
- The hypothesis `α > 0` is needed: an orthonormal basis of `ℝ²` has `n = d` and `S = J − I`, and
  `(J − I)(J − I) = I ≠ 0`.
- The hypothesis `d α² < 1` is needed: `e₁`, `−e₁`, `e₁` in `ℝ¹` with `α = 1` satisfy the
  equality, and the eigenvalue `ρ = 2` is even although `3 > 2` and `3 ≠ 2`; the empty family in
  `ℝ¹` with `α = 1` satisfies it too, and the multiplicity `d = 1` of `ρ` fails.

*Needs:* 3.1, 4.3 (its route); Mathlib `Matrix.charpoly_monic`, `Matrix.IsHermitian.charpoly_eq`,
`isInteger_of_is_root_of_monic`, `minpoly`, `minpoly.dvd`, `Irreducible.separable`,
`Polynomial.rootMultiplicity`, `SimpleGraph.adjMatrix`. (Proved here, following the cited proof for
the spectrum and the integrality.)

### 5.2 Equality in the absolute bound

Prove `add_two_mul_sq_eq_one`: if an equiangular family of `n` unit vectors with angle `α < 1` in
a real inner product space of dimension `d ≥ 2` has `2n = d(d + 1)`, then `(d + 2) α² = 1`.

Route (proved here, from Brouwer–Haemers, p. 157, the remark before Proposition 10.6.4, and the
first part of that proposition, p. 158): by 4.1 the `n = d(d + 1)/2` operators `Xᵢ` are linearly
independent, so they span the self-adjoint operators and `I = ∑ cᵢ Xᵢ`. Taking traces of the
products with `Xⱼ` gives `cⱼ (1 − α²) + α² ∑ cᵢ = 1`, so all `cⱼ` are equal, and `∑ cᵢ = tr I = d`
gives `cⱼ = d/n`; hence `d(1 − α²) = n(1 − d α²)`. With `2n = d(d + 1)` this is
`(d − 1)(d + 2) α² = d − 1`, and `d ≥ 2` gives the claim. With 5.3: if moreover `d ≥ 4`, then
`n > 2d`, so `√(d + 2)` is an odd integer; the first such dimensions are `7`, `23`, `47`, `79`.

**Checks.**
- `d = 2`: three lines at `60°`, `4 · 1/4 = 1`; `d = 3`: the icosahedron, `5 · 1/5 = 1`; `d = 7`:
  the 28 lines, `9 · 1/9 = 1`.
- The hypothesis `d ≥ 2` is needed: in `ℝ¹` a single unit vector has `2 · 1 = 1 · 2` and is
  equiangular for every `α`, for instance `α = 1/2`, with `3 · 1/4 ≠ 1`.
- The hypothesis `α < 1` is needed: three copies of `e₁` in `ℝ²` have `2 · 3 = 2 · 3` and
  `α = 1`, with `4 · 1 ≠ 1`.

*Needs:* 4.1 (its route); Mathlib `InnerProductSpace.rankOne`, `LinearMap.trace`. (Proved here.)

### 5.3 Neumann's theorem

Prove `exists_odd_mul_eq_one`: if an equiangular family of `n` unit vectors with angle `α` in a
real inner product space of finite dimension `d` has `n > 2d`, then `m α = 1` for an odd natural
number `m` (Brouwer–Haemers, Theorem 10.6.4a, p. 158, attributed there to P. M. Neumann, there for
`0 < α < 1`). No hypothesis on `α` is needed.

Route: a unit vector exists, so `d ≥ 1` and `n ≥ 3`; hence `0 ≤ α ≤ 1`, and `α ≠ 0` because an
orthonormal family has at most `d` members. By 3.1, `θ = −1/α` is a Seidel eigenvalue of the sign
graph with multiplicity at least `n − d > n/2`. Since the Seidel matrix is symmetric, this is also
the multiplicity of `θ` as a root of the characteristic polynomial, a monic integer polynomial of
degree `n`. Every conjugate of `θ` over `ℚ` is a root of the same multiplicity, because the
minimal polynomial of `θ` is separable and its power dividing the characteristic polynomial has a
cofactor prime to it; so `θ` has no other conjugate and is rational, hence an integer. As
`n − d ≥ 2`, `θ` has an eigenvector orthogonal to the all-one vector, on which the adjacency
matrix of the sign graph acts by `(1/α − 1)/2`, an integer, so `1/α` is odd.

**Checks.**
- The 28 lines: `28 > 14` and `1/α = 3`. The three vectors `e₁`, `−e₁`, `e₁` of `ℝ¹`: `3 > 2`
  and `1/α = 1`.
- The bound `n > 2d` cannot be weakened to `n ≥ 2d`: the icosahedron has `n = 6 = 2d` and
  `1/α = √5`.
- `[FiniteDimensional ℝ E]` is needed: an orthonormal pair in an infinite-dimensional space has
  `2 > 2 · 0` and `α = 0`.
- On two to seven vertices exactly five switching classes have a least Seidel eigenvalue of
  multiplicity above `n/2`: the classes of the edgeless graphs on three to seven vertices, with
  eigenvalue `−1` (coincident lines, `1/α = 1`). On one vertex the eigenvalue `0` of `S = 0` has
  multiplicity `1 > 1/2` and is even; it gives no lines, since `θ = 0` is excluded in 3.2.

*Needs:* 3.1; Mathlib `Matrix.charpoly_monic`, `Matrix.IsHermitian.charpoly_eq`, `minpoly`,
`minpoly.dvd`, `Irreducible.separable`, `Polynomial.rootMultiplicity`,
`isInteger_of_is_root_of_monic`, `SimpleGraph.adjMatrix`, `abs_real_inner_le_norm`,
`Orthonormal.linearIndependent`, `LinearIndependent.fintype_card_le_finrank`,
`Submodule.finrank_le`. (Proved here, following the cited proof.)

### Examples

The 28 lines in `ℝ⁷` and the icosahedron; regular simplices; orthonormal bases.

### Dependencies

Layer 3 (3.1, for 5.1 and 5.3), Layer 4 (the routes of 4.1 and 4.3, for 5.2 and 5.1), Layer 1
(1.1). Mathlib `Matrix.charpoly_monic`, `Matrix.IsHermitian.charpoly_eq`, `minpoly`, `minpoly.dvd`,
`Irreducible.separable`, `Polynomial.rootMultiplicity`, `isInteger_of_is_root_of_monic`,
`SimpleGraph.adjMatrix`, `InnerProductSpace.rankOne`, `LinearMap.trace`,
`Orthonormal.linearIndependent`, `LinearIndependent.fintype_card_le_finrank`,
`Submodule.finrank_le`.

## Scope and ownership

This roadmap owns the targets stated above: the Seidel matrix of a graph and Seidel switching;
two-graphs, their bijection with switching classes, and the characterisation of regular
two-graphs by the square of the Seidel matrix and by two Seidel eigenvalues; the correspondence
between equiangular systems of lines and Seidel matrices; the absolute bound over `ℝ` and `ℂ`; the
relative bound; the consequences of equality in the real absolute and relative bounds; and
Neumann's theorem.

Already in the libraries and used above without restatement: Mathlib's adjacency matrices, Gram
matrices and their positive semidefiniteness (`Matrix.posSemidef_gram`), the spectral theorem for
Hermitian matrices, rank-one operators, the rational root theorem
(`isInteger_of_is_root_of_monic`) and the invariance of the characteristic polynomial under
conjugation; Tau Ceti's rank-one Hermitian projector `TauCeti.rankOneHermitianProjector`, which is
the matrix of the projection onto a line used in Layer 4. Neither library has Seidel matrices,
two-graphs, switching or equiangular lines.

Neighbouring roadmaps; this roadmap depends on none of them:

- StronglyRegularAndMooreGraphs, Layer 1 (1.5), states Seidel's absolute bound for primitive
  strongly regular graphs: the number of vertices is at most `f(f + 3)/2` for the multiplicity
  `f` of a restricted eigenvalue. That bound is about a graph and the dimension of an eigenspace,
  by a two-distance set on a sphere; 4.1 above bounds an equiangular family by the dimension of
  its space, `d(d + 1)/2`. Neither statement is used for the other. The regular two-graphs of 2.3
  and 2.4 are related to strongly regular graphs through their descendants (Brouwer–Haemers,
  Theorem 10.3.1, (iii)); that relation is not stated here.
- LinearAlgebraMethodInCombinatorics, Layer 3 (3.1), states Blokhuis's bound
  `(d + 1)(d + 2)/2` for two-distance sets in `ℝ^d`. Unit vectors on equiangular lines form such a
  set, so it gives a weaker bound than 4.1 (the last Check of 4.1); it lists equiangular lines as
  not treated there.
- SpectralGraphBounds defines the sorted adjacency eigenvalues of a graph and bounds graph
  invariants by them; the statements above concern the Seidel matrix, a different matrix, and use
  eigenspace dimensions rather than its sorted list.
- SpectralQuantumWalks, EquitableOperatorReduction and DiscreteQuantumWalks treat adjacency
  spectra, equitable partitions and quantum walks; none states anything about Seidel matrices,
  two-graphs or equiangular lines. The gauge switching of SpectralQuantumWalks is conjugation of a
  Hermitian walk matrix by a diagonal unitary, an invariance of quantum walks, not Seidel switching
  of a graph.

Outside the scope: the descendants of a two-graph and their strong regularity; the
classification of two-graphs with least Seidel eigenvalue at least `−3`; the maximal number of
equiangular lines with angle `arccos(1/3)` in each dimension; constructions
of large equiangular systems (de Caen) and asymptotic bounds; the existence of `d²` equiangular
lines in `ℂ^d` in general; bounds for sets with several angles or distances (Delsarte, Goethals
and Seidel); and every procedure for enumerating or recognising two-graphs.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`: `SimpleGraph.adjMatrix` (entry `1` for
  adjacent and `0` for nonadjacent vertices).
- `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean`: `Matrix.gram` (entries `⟪v i, v j⟫`),
  `Matrix.posSemidef_gram` (a Gram matrix is positive semidefinite),
  `Matrix.gram_eq_conjTranspose_mul` (in an orthonormal basis, `gram 𝕜 v = mᴴ * m`).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef`, `Matrix.PosSemidef.smul`.
  `Mathlib/Analysis/Matrix/PosDef.lean`: `Matrix.PosSemidef.eigenvalues_nonneg`.
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.spectral_theorem`,
  `Matrix.IsHermitian.charpoly_eq` (the characteristic polynomial is `∏ (X − eigenvalues i)`),
  `Matrix.IsHermitian.rank_eq_card_non_zero_eigs`, `Matrix.IsHermitian.eigenvalues`.
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.charpoly_units_conj` (conjugation by
  a unit does not change the characteristic polynomial).
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`: `Matrix.charpoly_monic`.
- `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: `Matrix.toLin'`.
  `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`: `Module.End.eigenspace`.
  `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean`: `LinearMap.finrank_range_add_finrank_ker`
  (rank–nullity).
- `Mathlib/Analysis/InnerProductSpace/LinearMap.lean`: `InnerProductSpace.rankOne`
  (`rankOne 𝕜 x y z = ⟪y, z⟫ • x`). `Mathlib/LinearAlgebra/Trace.lean`: `LinearMap.trace`.
  `Mathlib/Analysis/InnerProductSpace/Symmetric.lean`: `LinearMap.IsSymmetric` (self-adjoint
  operators).
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace`, `finrank_euclideanSpace`.
  `Mathlib/Analysis/InnerProductSpace/Basic.lean`: `real_inner_self_eq_norm_sq`,
  `abs_real_inner_le_norm` (Cauchy–Schwarz). `Orthonormal.linearIndependent`,
  `LinearIndependent.fintype_card_le_finrank`, `Submodule.finrank_le` (a linearly independent
  family, and a subspace, have at most the dimension of the space).
- `Mathlib/RingTheory/Polynomial/RationalRoot.lean`: `isInteger_of_is_root_of_monic` (a root in
  the fraction field of a monic polynomial over a unique factorisation domain lies in the domain).
  `Mathlib/FieldTheory/Minpoly/Basic.lean`, `Mathlib/FieldTheory/Minpoly/Field.lean`: `minpoly`,
  `minpoly.dvd`. `Mathlib/FieldTheory/Separable.lean`: `Irreducible.separable` (in characteristic
  zero). `Mathlib/Algebra/Polynomial/Div.lean`: `Polynomial.rootMultiplicity`.
- `Matrix.of`, `Matrix.diagonal`, `Module.finrank`, `Submodule.span`, `Set.ncard`,
  `Finset.card_eq_three`.

### From Tau Ceti

- `TauCeti/LinearAlgebra/Projectivization/HermitianProjector.lean`:
  `TauCeti.rankOneHermitianProjector` (the matrix `x x* / (x* x)`, the orthogonal projector onto
  the line of `x` when `x* x ≠ 0`) and `TauCeti.trace_rankOneHermitianProjector` (its trace is
  `1`), for a route of Layer 4 in coordinates.

## References

- Andries E. Brouwer and Willem H. Haemers, *Spectra of Graphs*, the authors' version posted by
  the first author (`homepages.cwi.nl/~aeb/math/ipm/ipm.pdf`, PDF of 4 May 2025). Locators are
  to the numbered results and printed page numbers of that file: §1.8.2,
  pp. 23–24; Proposition 10.1.1, p. 147; §10.2 with the table of two-graphs, pp. 148–149;
  Theorem 10.3.1, p. 150; §10.6.1, p. 156; Theorem 10.6.1, Propositions 10.6.2 and 10.6.3, p. 157;
  Proposition 10.6.4 and Theorem 10.6.4a, p. 158.
- The absolute bound is attributed by Brouwer–Haemers to M. Gerzon and Theorem 10.6.4a to
  P. M. Neumann, both with a reference to P. W. H. Lemmens and J. J. Seidel, Equiangular lines,
  *Journal of Algebra* 24 (1973), 494–512.

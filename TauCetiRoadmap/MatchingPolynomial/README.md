# Roadmap: the matching polynomial

**Summary.** Count the matchings of a finite graph by size: `m_k` is the number of sets of `k`
edges no two of which share a vertex. The matching polynomial packages these numbers as
`μ(G, x) = Σ_k (−1)^k m_k x^(n − 2k)`, where `n` is the number of vertices. It is a cousin of the
characteristic polynomial of the adjacency matrix, and for graphs without cycles the two coincide.
This roadmap develops the algebraic theory of `μ` for finite simple graphs: its deletion
recursions, its relation to the characteristic polynomial, Godsil's path tree, and the location of
its roots. Every statement about the matching polynomial concerns a graph on a finite vertex
type, which may be empty.

The headline theorems are these.

- *Forests.* The characteristic polynomial `det(xI − A)` of the adjacency matrix equals `μ(G, x)`
  if and only if the graph has no cycle. For every graph, the characteristic polynomials of the
  `2^|E|` adjacency matrices with signed edges average to `μ(G, x)` (Godsil and Gutman).
- *Godsil's path tree.* The path tree of `G` at a vertex `u` has one vertex for each path of `G`
  that starts at `u`, two paths being adjacent when one extends the other by an edge. For every
  graph, `μ(G − u) · μ(T) = μ(G) · μ(T − u)`, where `T` is the path tree and `T − u` deletes its
  root; if `G` is connected, `μ(G)` divides `μ(T)`.
- *Heilmann and Lieb.* All roots of `μ(G, x)` are real, and the roots of `μ(G − v, x)` interlace
  them for every vertex `v`.
- *The root bound.* If every vertex has degree at most `d` and `d ≥ 2`, every root of `μ(G, x)`
  has absolute value at most `2√(d − 1)`. For `d = 1` this fails: a single edge has roots `±1`.

The roadmap builds on Mathlib's matchings of simple graphs, its adjacency matrices and
characteristic polynomials, and its theory of real symmetric matrices, whose characteristic
polynomials split over the reals. Cauchy interlacing for principal submatrices, which the
interlacing theorem uses for trees, is planned by the roadmap RandomMatrices. Maximum matchings and
eigenvalue bounds for the adjacency matrices of general graphs are not treated here.

Layer 1 below defines `μ` and proves the vertex and edge recursions. Layer 2 relates `μ` to
characteristic polynomials: the signed average and the forest theorem. Layer 3 defines the path
tree and proves Godsil's identity and divisibility; it uses Layer 1. Layer 4 proves
real-rootedness, interlacing and the root bound from Layers 1, 2 and 3.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V`; the matching polynomial is defined for
  `[Finite V]`, and `n` is `Nat.card V`. Statements that use degrees, neighbour sets, adjacency
  matrices or path trees assume `[Fintype V]`, `[DecidableEq V]` and `[DecidableRel G.Adj]` as
  their Lean form shows.
- **Matchings.** A matching is a subgraph `M : G.Subgraph` with Mathlib's `M.IsMatching`: every
  vertex of `M.verts` has exactly one neighbour in `M`. Its vertex set is then the set of matched
  vertices, so matchings correspond one to one with sets of pairwise disjoint edges of `G`
  (Mathlib's `SimpleGraph.Subgraph.IsMatching.injOn_edgeSet`). Its size is `M.edgeSet.ncard`.
- **Sign and degree.** `μ(G, x) = Σ_(0 ≤ k ≤ n/2) (−1)^k m_k x^(n − 2k)`, an element of `ℤ[X]`,
  monic of degree `n`, with `m_0 = 1`. The sign makes `μ(K₂) = x² − 1`, with real roots; the
  unsigned convention `x² + 1` has none. On the empty vertex type `μ = 1`.
- **Deleting vertices and edges.** `G − S` for a set `S` of vertices is `G.induce Sᶜ`, a graph on
  the subtype of the complement; `G − uv` for an edge is `G.deleteEdges {s(u, v)}`, on the same
  vertex type.
- **Characteristic polynomial.** Mathlib's `Matrix.charpoly A` is `det(X·I − A)`, monic. The
  adjacency matrix is `G.adjMatrix ℤ`.
- **Roots.** Real-rootedness of `p : ℤ[X]` is `Polynomial.Splits` of its image in `ℝ[X]`. Sorted
  roots are the real roots with multiplicity, `(p.map (Int.castRingHom ℝ)).roots`, sorted in
  nonincreasing order; indices start at `0` in Lean and at `1` in prose.

## Layer 1: the matching polynomial and its recursions

### 1.1 The matching polynomial

Define `matchingCount G k`, the `Set.ncard` of the set of subgraphs `M` of `G` with `M.IsMatching`
and `M.edgeSet.ncard = k`, and, for `[Finite V]`, `matchingPolynomial G`, the sum over
`0 ≤ k ≤ n/2` of `(−1)^k (matchingCount G k) X^(n − 2k)` (Godsil, *Algebraic matching theory*, §1,
p. 2; Marcus–Spielman–Srivastava, §3, p. 5). The range `k ≤ n/2` keeps `n − 2k` free of
natural-number truncation, and `m_k = 0` for larger `k`.

API, each proved here:

- `μ(G)` is monic of degree `n`; for `n ≥ 2` its coefficient of `x^(n − 1)` is `0` and that of
  `x^(n − 2)` is `−|E|`; only powers `x^j` with `j ≡ n (mod 2)` occur.
- For `n` even, the constant coefficient is `(−1)^(n/2)` times the number of perfect matchings
  (Mathlib's `SimpleGraph.Subgraph.IsPerfectMatching`).
- `μ` is multiplicative on disjoint unions: for graphs `G` on `V` and `H` on `W`, the matching
  polynomial of `G ⊕g H` (Mathlib's `SimpleGraph.sum`) is `μ(G) μ(H)` (Godsil, Theorem 2.1 (a),
  p. 3; Spielman, Lemma 26.4.1, p. 26-4).
- The derivative of `μ(G)` is `Σ_v μ(G − v)` (Godsil, Theorem 2.1 (d), p. 3).

**Checks.**
- The empty vertex type: `μ = 1`. One vertex: `x`. One edge: `x² − 1`. Three isolated vertices:
  `x³`.
- The path on four vertices: `x⁴ − 3x² + 1` (Godsil, p. 2); the 4-cycle: `x⁴ − 4x² + 2`; the
  triangle and the star `K_(1,3)`: `x³ − 3x` and `x⁴ − 3x²`; `K₄`: `x⁴ − 6x² + 3`; the 5-cycle:
  `x⁵ − 5x³ + 5x`.
- The Petersen graph: `m_k = 1, 15, 75, 145, 90, 6` for `k = 0, …, 5`, so
  `μ = x¹⁰ − 15x⁸ + 75x⁶ − 145x⁴ + 90x² − 6`, and it has six perfect matchings.
- A plausible wrong count that takes all subgraphs with `k` edges instead of matchings gives
  `3` for `k = 2` on the triangle; the triangle has no matching with two edges.
- One edge `ab`: `m₀ = 1` and `m₁ = 1`, because a matching has no unmatched vertex in its vertex
  set. A count of subgraphs whose edges are pairwise disjoint, with any vertex set, would give
  `m₀ = 4` (the vertex sets `∅`, `{a}`, `{b}` and `{a, b}` with no edge) instead of `1`.

*Needs:* Mathlib `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.Subgraph.IsMatching.injOn_edgeSet`,
`SimpleGraph.Subgraph.IsPerfectMatching`, `SimpleGraph.sum`, `Set.ncard`, `Polynomial.derivative`.

### 1.2 The deletion recursions

- `matchingPolynomial_eq_X_mul_sub_sum`: for every vertex `v`,
  `μ(G) = x μ(G − v) − Σ_(w ~ v) μ(G − v − w)` (Godsil, Theorem 2.1 (c), p. 3).
- `matchingPolynomial_eq_deleteEdges_sub`: for every edge `uv`,
  `μ(G) = μ(G − uv) − μ(G − u − v)` (Godsil, Theorem 2.1 (b), p. 3).

Route: a matching either misses `v` or contains exactly one edge `vw`; it either avoids the edge
`uv` or contains it. In each case the remaining edges form a matching of the smaller graph, with
one fewer vertex or two fewer vertices, and the powers of `x` and the signs match. The graphs
`G − v` and `G − v − w` live on subtypes; their matchings are those of `G` that avoid the deleted
vertices, transported along `SimpleGraph.Embedding.induce`.

**Checks.**
- The vertex recursion at an end of the path on four vertices:
  `x (x³ − 2x) − (x² − 1) = x⁴ − 3x² + 1`.
- The edge recursion on the triangle: deleting an edge leaves the path on three vertices, and
  `(x³ − 2x) − x = x³ − 3x`.
- Both recursions were verified at every vertex and every edge of every graph with at most seven
  vertices (all 1253 up to isomorphism), together with the derivative identity of 1.1.

*Needs:* 1.1; Mathlib `SimpleGraph.induce`, `SimpleGraph.Embedding.induce`,
`SimpleGraph.deleteEdges`, `SimpleGraph.neighborFinset`.

### Examples

Paths, cycles, stars, complete graphs on at most four vertices, the Petersen graph and the empty
vertex type, with their matching numbers `m_k` and matching polynomials.

### Dependencies

Mathlib `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.Subgraph.IsMatching.injOn_edgeSet`,
`SimpleGraph.Subgraph.IsPerfectMatching`, `SimpleGraph.sum`, `SimpleGraph.induce`, `SimpleGraph.Embedding.induce`,
`SimpleGraph.deleteEdges`, `SimpleGraph.neighborFinset`, `Set.ncard`, `Polynomial.derivative`.
No other layer.

## Layer 2: the characteristic polynomial

### 2.1 Signed adjacency matrices

Define `signedAdjMatrix G s` for a signing `s : G.edgeSet → ℤˣ` of the edges: its entry at `(i, j)`
is `s` of the edge `ij` when `i` and `j` are adjacent, and `0` otherwise. It is symmetric.

Prove `sum_charpoly_signedAdjMatrix`: the sum over all `2^|E|` signings of the characteristic
polynomials of the signed adjacency matrices is `2^|E| μ(G)`; that is, the characteristic
polynomial of a uniformly random signing has expectation `μ(G)` (Godsil and Gutman;
Marcus–Spielman–Srivastava, Theorem 3.6, p. 6, proved in Appendix A, p. 16; Spielman, Lemma 26.3.1,
pp. 26-2 to 26-3).

Route: expand `det(xI − A_s)` by Mathlib's `Matrix.det_apply` as a sum over permutations. A
permutation that moves some point `i` to a non-neighbour of `i` contributes `0` for every `s`. A
permutation with a cycle of length at least `3` along edges uses each edge of that cycle once, so
the average over `s` of its term vanishes. What remains are the involutions whose transpositions
are edges, that is, the matchings; a transposition `(i j)` contributes `s_(ij)² = 1` and the sign
`−1`.

**Checks.**
- The triangle: a signing with sign product `ε` has characteristic polynomial `x³ − 3x − 2ε`; the
  eight signings average to `x³ − 3x = μ`, while the unsigned matrix gives `x³ − 3x − 2`.
- A graph without edges has one signing, and both sides are `xⁿ`.
- Verified on every graph with at most seven vertices and at most eight edges (396 graphs).

*Needs:* 1.1; Mathlib `Matrix.charpoly`, `Matrix.det_apply`, `SimpleGraph.mem_edgeSet`,
`UnitsInt.fintype`.

### 2.2 Forests

Prove `charpoly_adjMatrix_eq_matchingPolynomial_iff`: `(G.adjMatrix ℤ).charpoly = μ(G)` if and
only if `G` is acyclic in Mathlib's sense, `G.IsAcyclic` (Godsil, §1, p. 2, citing Godsil and
Gutman; Spielman, Theorem 26.3.2, p. 26-3, for trees).

Route: in the permutation expansion of `det(xI − A)`, a permutation contributes only if every one
of its cycles of length at least `3` runs along a cycle of `G`. For a forest there is none, and the
involutions along edges give `μ` as in 2.1. Conversely, if `G` has a cycle and `g` is the shortest
length of one, the coefficient of `x^(n − g)` in `det(xI − A)` is the coefficient in `μ` minus
`2c`, where `c ≥ 1` is the number of cycles of length `g`: a permutation of `g` points that
contributes is either an involution along a matching or a cyclic rotation of a `g`-cycle in one of
its two directions, each contributing `−1`. (Proved here.)

**Checks.**
- The triangle: `det(xI − A) = x³ − 3x − 2 ≠ x³ − 3x`. The 4-cycle: `x⁴ − 4x² ≠ x⁴ − 4x² + 2`,
  the difference `2 = 2c` with `c = 1`. `K₄`: `x⁴ − 6x² − 8x − 3 ≠ x⁴ − 6x² + 3`. The Petersen
  graph, with no cycle shorter than `5`, has `det(xI − A)` and `μ` equal in the coefficients of
  `x¹⁰`, `x⁸` and `x⁶` and different from `x⁵` on, where `det(xI − A)` has `−24x⁵`.
- The path on four vertices and the star `K_(1,3)`: equality, `x⁴ − 3x² + 1` and `x⁴ − 3x²`.
- Over all 1253 graphs with at most seven vertices, equality holds for exactly the 80 forests.

*Needs:* 1.1; Mathlib `Matrix.charpoly`, `Matrix.det_apply`, `SimpleGraph.adjMatrix`,
`SimpleGraph.IsAcyclic`.

### Examples

The triangle with its eight signings, the 4-cycle, `K₄`, paths, stars and the Petersen graph,
comparing `det(xI − A)` with `μ`.

### Dependencies

Layer 1 (1.1). Mathlib `Matrix.charpoly`, `Matrix.det_apply`, `SimpleGraph.adjMatrix`,
`SimpleGraph.IsAcyclic`, `SimpleGraph.mem_edgeSet`, `UnitsInt.fintype`.

## Layer 3: the path tree

### 3.1 The path tree

Define `pathTree G u`, a simple graph on the type `Σ w, G.Path u w` of paths of `G` starting at
`u` (Mathlib's `SimpleGraph.Path`): two paths are adjacent when one is the other extended by a
single edge, `q = p.concat h` with Mathlib's `SimpleGraph.Walk.concat`, symmetrized by
`SimpleGraph.fromRel`. Define `pathTreeRoot G u`, the path of length zero at `u`. This is Godsil's
path tree `T(G, u)`, in which two paths are adjacent when one is a maximal proper subpath of the
other (Godsil, §2, p. 3; Marcus–Spielman–Srivastava, Definition 3.3, p. 5). On a finite vertex
type it is finite, by Mathlib's `SimpleGraph.Path.instFintype`.

- `pathTree_isTree`: `pathTree G u` is a tree in Mathlib's sense, `SimpleGraph.IsTree`. (Proved
  here: every path is joined to the root through its prefixes, and every path other than the root
  has exactly one neighbour of smaller length, its prefix.)
- Every vertex of the path tree ending at `w` has degree at most the degree of `w` in `G`: its
  prefix and its one-edge extensions, which end at distinct neighbours of `w`. (Proved here.)
- If `G` is a tree, `pathTree G u` is isomorphic to `G` by sending a path to its end (Spielman,
  §26.5, p. 26-5). (Proved here from Mathlib's `SimpleGraph.isAcyclic_iff_subsingleton_path`.)
- Deleting the root leaves the disjoint union, over the neighbours `w` of `u`, of the path trees of
  `G − u` at `w` (Spielman, §26.5, p. 26-5). (Proved here.)

**Checks.**
- The triangle at a vertex: the paths `a`, `ab`, `ac`, `abc`, `acb` form a path on five vertices.
- The 4-cycle at a vertex: seven paths; `K₄` at a vertex: sixteen paths, `1 + 3 + 6 + 6`.
- The graph on one vertex: the path tree is a single vertex.

*Needs:* Mathlib `SimpleGraph.Path`, `SimpleGraph.Walk.concat`, `SimpleGraph.fromRel`,
`SimpleGraph.IsTree`, `SimpleGraph.Path.instFintype`, `SimpleGraph.isAcyclic_iff_subsingleton_path`.

### 3.2 Godsil's identity and divisibility

- `matchingPolynomial_induce_mul_pathTree`: for every graph on a finite vertex type and every vertex
  `u`, `μ(G − u) μ(T) = μ(G) μ(T − u)`, where `T = pathTree G u` and `T − u` deletes
  `pathTreeRoot G u` (Godsil, Theorem 2.2, p. 3, as the equality `μ(G − u)/μ(G) = μ(T − u)/μ(T)`;
  Spielman, Theorem 26.5.1, p. 26-5).
- `matchingPolynomial_dvd_pathTree`: if `G` is connected, `μ(G)` divides `μ(pathTree G u)` in
  `ℤ[X]` (Godsil, Theorem 2.2, p. 3; Marcus–Spielman–Srivastava, Theorem 3.4, p. 5; Spielman,
  Theorem 26.5.2, p. 26-5).

Route: induction on the number of vertices, following Spielman's proof of Theorem 26.5.1,
pp. 26-5 to 26-6. A tree is its own path tree (3.1). Otherwise expand `μ(G)/μ(G − u)` by the
vertex recursion of 1.2 and use, for each neighbour `w` of `u`, the identity for `G − u` at `w`
and the decomposition of `T − u` in 3.1. For divisibility, connectedness puts every component of
`G − u` next to some neighbour `w` of `u`, so by induction and multiplicativity (1.1) `μ(G − u)`
divides `μ(T − u)`, and the identity gives `μ(T) = μ(G) · μ(T − u)/μ(G − u)`; the quotient lies in
`ℤ[X]` because `μ(G − u)` is monic.

**Checks.**
- The triangle: `μ(T) = x⁵ − 4x³ + 3x = (x³ − 3x)(x² − 1)`. The 4-cycle:
  `μ(T) = x⁷ − 6x⁵ + 10x³ − 4x = (x⁴ − 4x² + 2)(x³ − 2x)`. For `K₄` the quotient is
  `x¹² − 9x¹⁰ + 30x⁸ − 46x⁶ + 33x⁴ − 9x²`.
- Connectedness is needed for divisibility: for one isolated vertex `u` and one disjoint edge,
  `T` is a single vertex and `μ(T) = x` is not divisible by `μ(G) = x³ − x`; the identity still
  holds, `(x² − 1) · x = (x³ − x) · 1`.
- The identity at every vertex of every graph with at most six vertices, and divisibility for
  every connected one, were verified (1167 pairs of a graph and a vertex; path trees of up to 326
  vertices).

*Needs:* 3.1, 1.1, 1.2; Mathlib `SimpleGraph.Connected`, `SimpleGraph.induce`,
`Polynomial.Monic`.

### Examples

The path trees of the triangle, the 4-cycle and `K₄` with their matching polynomials and the
quotients by `μ(G)`, and the disconnected graph of the Check above.

### Dependencies

Layers 1 and 2 are not needed for 3.1; 3.2 uses 1.1 and 1.2. Mathlib `SimpleGraph.Path`,
`SimpleGraph.Walk.concat`, `SimpleGraph.fromRel`, `SimpleGraph.IsTree`,
`SimpleGraph.Path.instFintype`, `SimpleGraph.isAcyclic_iff_subsingleton_path`, `SimpleGraph.Connected`,
`SimpleGraph.induce`, `Polynomial.Monic`.

## Layer 4: the roots

### 4.1 Real roots and interlacing

Define `sortedRealRoots p` for `p : ℤ[X]`, the real roots of `p` with multiplicity in nonincreasing
order, `Multiset.sort (· ≥ ·)` of `(p.map (Int.castRingHom ℝ)).roots`.

- `splits_matchingPolynomial`: for every graph on a finite vertex type, `μ(G)` splits over `ℝ`
  (Heilmann and Lieb; Marcus–Spielman–Srivastava, Theorem 3.1, p. 5; Godsil, remark after
  Theorem 2.2, p. 3).
- `sortedRealRoots_interlace`: for every vertex `v`, if `α₁ ≥ ⋯ ≥ αₙ` are the sorted real roots
  of `μ(G)` and `β₁ ≥ ⋯ ≥ β_(n−1)` those of `μ(G − v)` (by `splits_matchingPolynomial` and the
  degrees of 1.1 there are exactly `n` and `n − 1` of them), then `α_(i+1) ≤ βᵢ ≤ αᵢ` for
  `1 ≤ i ≤ n − 1` (Godsil, remark after Theorem 2.2, p. 3, which states
  that between any two zeros of `μ(G)` lies a zero of `μ(G − v)`; the form with multiplicities
  is the one stated here, and is proved here).

Route: it suffices to treat the component of `v`, by multiplicativity (1.1), since sorted root
lists of a product merge and interlacing is preserved under multiplying both polynomials by the
same real-rooted factor. For connected `G` let `T = pathTree G v`. By 3.1 and 2.2, `μ(T)` and
`μ(T − v)` are the characteristic polynomials of the adjacency matrix of `T` and of its principal
submatrix without the root; they split over `ℝ` by Mathlib's `Matrix.IsHermitian.splits_charpoly`,
their sorted roots are the sorted eigenvalues (`Matrix.IsHermitian.sort_roots_charpoly_eq_eigenvalues₀`),
and those interlace by Cauchy interlacing (RandomMatrices §1.2). By 3.2,
`μ(T) = μ(G) q` and `μ(T − v) = μ(G − v) q` for one polynomial `q`, so `μ(G)` splits, and
deleting the roots of `q` from both sorted lists preserves interlacing. (Proved here.)

**Checks.**
- The path `a b c`: `μ = x³ − 2x` with roots `√2, 0, −√2`. Deleting `b` gives `x²`, roots
  `0, 0`; deleting `a` gives `x² − 1`, roots `1, −1`. Both interlace.
- Three disjoint edges: `μ = (x² − 1)³` and, deleting a vertex, `x(x² − 1)²`; the sorted lists
  `1, 1, 1, −1, −1, −1` and `1, 1, 0, −1, −1` interlace with equalities, so the inequalities are
  not strict.
- `K₄`: roots `±√(3 ± √6)`, approximately `±2.334` and `±0.742`.
- Real-rootedness and interlacing at every vertex were verified with exact real root isolation for
  all graphs with one to seven vertices.

*Needs:* 1.1, 2.2, 3.1, 3.2; RandomMatrices §1.2; Mathlib `Matrix.IsHermitian.splits_charpoly`,
`Matrix.IsHermitian.sort_roots_charpoly_eq_eigenvalues₀`, `SimpleGraph.isHermitian_adjMatrix`,
`Matrix.charpoly_map`, `Polynomial.Splits`, `Polynomial.splits_iff_card_roots`, `Multiset.sort`.

### 4.2 The root bound

Prove `abs_le_of_isRoot_matchingPolynomial`: if `2 ≤ d` and every vertex of `G` has degree at most
`d`, every real root `x` of `μ(G)` satisfies `|x| ≤ 2√(d − 1)` (Heilmann and Lieb;
Marcus–Spielman–Srivastava, Theorem 3.2, p. 5, stated there for every maximum degree `d`; the
hypothesis `d ≥ 2` is added here, see the first Check). By
4.1 every complex root is real, so this bounds all roots.

Route: it suffices to treat the component of the root, by multiplicativity (1.1). For connected
`G` and any vertex `u`, a root of `μ(G)` is a root of `μ(T)` for `T = pathTree G u` (3.2), hence an
eigenvalue of the adjacency matrix of the tree `T` (2.2, Mathlib's
`Matrix.mem_spectrum_iff_isRoot_charpoly`), whose degrees are at most `d` (3.1). For a tree with
degrees at most `d ≥ 2`, root it and form `D A D⁻¹`, where `A` is the adjacency matrix and `D` the
diagonal matrix with entry `√(d − 1)^h` at a vertex of height `h`. Each row of the conjugated matrix has at most one
entry `√(d − 1)` (towards the root) and at most `d − 1` entries `1/√(d − 1)`, except the root row,
with at most `d` entries `1/√(d − 1)`; so every row sum is at most `2√(d − 1)`, using
`d/√(d − 1) ≤ 2√(d − 1)` for `d ≥ 2`. Gershgorin's theorem (Mathlib's `eigenvalue_mem_ball`) bounds
every eigenvalue by the largest row sum (Spielman, Lemma 26.2.1 and Theorem 26.2.2, pp. 26-1 to
26-2). (Proved here, following the cited route.)

**Checks.**
- The hypothesis `d ≥ 2` is needed: a single edge has every degree at most `1` and roots `±1`,
  while `2√(1 − 1) = 0`.
- The Petersen graph, `d = 3`: the largest root is about `2.6314 ≤ 2√2 ≈ 2.8284`. `K₄`, `d = 3`:
  `2.334 ≤ 2.828`. Paths and cycles, `d = 2`: the roots lie in `[−2, 2]`; the 5-cycle has largest
  root `√((5 + √5)/2) ≈ 1.902`.
- Over all graphs with at most seven vertices and maximum degree `Δ ≥ 2`, the largest ratio of
  the largest absolute root to `2√(Δ − 1)` is about `0.975`.
- The row-sum bound and the eigenvalue bound were verified on random trees with up to thirty
  vertices and maximum degree at least `2`.

*Needs:* 1.1, 2.2, 3.1, 3.2, 4.1; Mathlib `eigenvalue_mem_ball`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `SimpleGraph.degree`, `Real.sqrt`.

### Examples

The path on three vertices and three disjoint edges for interlacing, `K₄`, the 5-cycle and the
Petersen graph for the root bound, and the single edge for the case `d = 1`.

### Dependencies

Layers 1, 2 and 3. RandomMatrices §1.2. Mathlib `Matrix.IsHermitian.splits_charpoly`,
`Matrix.IsHermitian.sort_roots_charpoly_eq_eigenvalues₀`, `SimpleGraph.isHermitian_adjMatrix`,
`Matrix.charpoly_map`, `Matrix.mem_spectrum_iff_isRoot_charpoly`, `eigenvalue_mem_ball`,
`Polynomial.Splits`, `Polynomial.splits_iff_card_roots`, `Multiset.sort`, `SimpleGraph.degree`,
`Real.sqrt`.

## Scope and ownership

This roadmap owns the targets stated above: the matching polynomial with its counts `m_k`, its
multiplicativity, derivative and deletion recursions; the Godsil–Gutman average over signed
adjacency matrices and the characterization of forests by `det(xI − A) = μ`; the path tree with
Godsil's identity and divisibility; real-rootedness, interlacing under vertex deletion and the
root bound `2√(d − 1)`.

Already in the libraries and therefore not targets:

- Mathlib's matchings and perfect matchings of simple graphs, adjacency matrices with their
  symmetry, characteristic polynomials and their splitting for Hermitian matrices, the sorted
  eigenvalues of a Hermitian matrix as the sorted roots of its characteristic polynomial,
  Gershgorin's theorem, the finiteness of the paths between two vertices, and the uniqueness of
  paths in an acyclic graph. Neither library defines the matching polynomial, the number of
  matchings of a given size, signed adjacency matrices or the path tree.
- RandomMatrices §1.2 (on main) owns Cauchy interlacing for principal submatrices; 4.1 uses it and
  does not restate it.

Neighbouring roadmaps, not on main, are not suppliers and state none of the targets above:

- MatchingTheory (a roadmap not on main) treats maximum matchings of
  a finite graph: the matching number, Berge's theorem, the Tutte–Berge formula, the Gallai–Edmonds
  decomposition and Petersen's theorem. It counts no matchings by size and lists the matching
  polynomial outside its scope. The multiplicity of `0` as a root of `μ` equals the number of
  vertices missed by a maximum matching; that statement is not made here, and nothing of that
  roadmap is used. This roadmap does not depend on that one.
- SpectralGraphBounds (a roadmap not on main) bounds the adjacency
  eigenvalues of general graphs by degrees, colourings and independent sets, and proves the
  Alon–Boppana lower bound for `λ₂`. The bound of 4.2 above is an upper bound on the roots of `μ`;
  its route bounds the eigenvalues of a tree by row sums and states no eigenvalue bound for
  general graphs. This roadmap does not depend on that one.
- TuttePolynomialAndArrangements (a roadmap not on main) treats the
  Tutte, chromatic and flow polynomials, which obey deletion–contraction; the matching polynomial
  obeys the different recursions of 1.2. This roadmap does not depend on that one.

Outside the scope: the multivariate and weighted forms of the Heilmann–Lieb theorem (edge weights,
vertex activities and the half-plane property); the Heilmann–Lieb identity
`μ(G − u) μ(G − v) − μ(G) μ(G − u − v) = Σ_P μ(G − P)²` over paths from `u` to `v`; multiplicities
of roots and the Gallai–Edmonds theory of essential vertices; interlacing families, 2-lifts and the
existence of Ramanujan graphs; the universal cover and the bound by its spectral radius; the
monomer–dimer model, its free energy and its asymptotics; independence polynomials and their
roots; and every procedure for computing or approximating `μ`.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Matching.lean`: `SimpleGraph.Subgraph.IsMatching` (every
  vertex of `M.verts` has a unique neighbour in `M`); `SimpleGraph.Subgraph.IsMatching.injOn_edgeSet`
  (a matching is determined by its edge set); `SimpleGraph.Subgraph.IsPerfectMatching` (a
  matching whose vertex set is everything).
- `Mathlib/Combinatorics/SimpleGraph/Subgraph.lean`: `SimpleGraph.Subgraph`, with `Finite G.Subgraph`
  for `[Finite V]`, so the sets counted by `matchingCount` are finite.
- `Mathlib/Combinatorics/SimpleGraph/Maps.lean`: `SimpleGraph.induce` (the graph induced on a set,
  on its subtype); `SimpleGraph.Embedding.induce` (the embedding of an induced graph).
  `Mathlib/Combinatorics/SimpleGraph/DeleteEdges.lean`: `SimpleGraph.deleteEdges`.
  `Mathlib/Combinatorics/SimpleGraph/Sum.lean`: `SimpleGraph.sum`, written `G ⊕g H`, the disjoint
  union on `V ⊕ W`. `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel`
  (`(fromRel r).Adj a b ↔ a ≠ b ∧ (r a b ∨ r b a)`), `SimpleGraph.mem_edgeSet`
  (`s(v, w) ∈ G.edgeSet ↔ G.Adj v w`).
- `Mathlib/Combinatorics/SimpleGraph/Finite.lean`: `SimpleGraph.neighborFinset`,
  `SimpleGraph.degree` (for a `Fintype` instance on the neighbour set).
- `Mathlib/Combinatorics/SimpleGraph/Paths.lean`: `SimpleGraph.Path` (the subtype of walks with
  `IsPath`), `SimpleGraph.Path.nil`. `Mathlib/Combinatorics/SimpleGraph/Walk/Operations.lean`:
  `SimpleGraph.Walk.concat` (a walk extended by one edge at its end).
  `Mathlib/Combinatorics/SimpleGraph/Walk/Counting.lean`: `SimpleGraph.Path.instFintype` (for
  `[DecidableEq V] [Fintype V] [DecidableRel G.Adj]`, finitely many paths between two vertices).
- `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean`: `SimpleGraph.IsAcyclic` (no walk is a cycle);
  `SimpleGraph.IsTree` (connected and acyclic); `SimpleGraph.isAcyclic_iff_subsingleton_path`.
  `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.Connected`.
- `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`: `SimpleGraph.adjMatrix`.
  `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`: `SimpleGraph.isHermitian_adjMatrix`.
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.charpoly` (`det` of `X·I − A`),
  `Matrix.charpoly_map` (the characteristic polynomial commutes with a ring map of the entries).
  `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: `Matrix.det_apply` (the Leibniz expansion).
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean`: `Matrix.mem_spectrum_iff_isRoot_charpoly`
  (over a field, `r ∈ spectrum K A ↔ IsRoot A.charpoly r`).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.splits_charpoly` (the
  characteristic polynomial of a Hermitian matrix over `ℝ` or `ℂ` splits);
  `Matrix.IsHermitian.sort_roots_charpoly_eq_eigenvalues₀` (its roots, sorted in nonincreasing
  order, are the sorted eigenvalues).
- `Mathlib/LinearAlgebra/Matrix/Gershgorin.lean`: `eigenvalue_mem_ball` (every eigenvalue lies in
  a closed disc centred at a diagonal entry with radius the sum of the norms of the other entries
  of its row).
- `Mathlib/Algebra/Polynomial/Splits.lean`: `Polynomial.Splits` (a product of constants and monic
  linear factors); `Polynomial.splits_iff_card_roots` (over a domain, splitting iff the number of
  roots with multiplicity is the degree).
- `Mathlib/Algebra/GroupWithZero/Units/Fintype.lean`: `UnitsInt.fintype` (`ℤˣ` is finite).
- Basic Mathlib: `Set.ncard`, `Nat.card`, `Polynomial.derivative`, `Polynomial.Monic`,
  `Polynomial.roots`, `Multiset.sort`, `Real.sqrt`.

### From TauCetiRoadmap.RandomMatrices

- §1.2 (on main): Cauchy interlacing for `Matrix.IsHermitian.eigenvalues₀`. Used in 4.1 in the
  form: if `A` is a real symmetric matrix indexed by a type with `n` elements and `B` is its
  principal submatrix on a subtype with `n − 1` elements, then
  `λ_(i+1)(A) ≤ λᵢ(B) ≤ λᵢ(A)` for `1 ≤ i ≤ n − 1`.

## References

- C. D. Godsil, Algebraic matching theory, *Electronic Journal of Combinatorics* 2 (1995), #R8,
  open on the journal's site (`combinatorics.org`): §1, p. 2; §2 with Theorem 2.1 and Theorem 2.2
  and the remark after it, p. 3. Pages are those of the journal's PDF.
- Adam W. Marcus, Daniel A. Spielman and Nikhil Srivastava, Interlacing families I: bipartite
  Ramanujan graphs of all degrees, arXiv:1304.4132v2 (2014), published in *Annals of
  Mathematics* 182 (2015): §3 with Theorems 3.1 and 3.2, Definition 3.3 and Theorem 3.4, p. 5;
  Theorem 3.6, p. 6; Appendix A, p. 16. Locators are to the arXiv version 2.
- Daniel A. Spielman, *Spectral Graph Theory*, Lecture 26, Matching polynomials of graphs,
  lecture notes of 5 December 2018 (Yale, `cs.yale.edu/homes/spielman/561/lect26-18.pdf`):
  Lemma 26.2.1, p. 26-1; Theorem 26.2.2, p. 26-2; Lemma 26.3.1, pp. 26-2 to 26-3; Theorem 26.3.2,
  p. 26-3; Lemma 26.4.1, p. 26-4; §26.5 with Theorems 26.5.1 and 26.5.2, pp. 26-5 to 26-6.
- The papers of Heilmann and Lieb (*Communications in Mathematical Physics* 25, 1972), of Godsil
  and Gutman (*On the theory of the matching polynomial*, *Journal of Graph Theory* 5, 1981, for
  the forest theorem of 2.2; *On the matching polynomial of a graph*, Colloquia Mathematica
  Societatis János Bolyai 25, 1981, for the signed average of 2.1) and of Godsil (*Matchings and
  walks in graphs*, *Journal of Graph Theory* 5, 1981, for the path tree) are named as the sources
  above attribute the results; they were not opened, and no locator into them
  is given.

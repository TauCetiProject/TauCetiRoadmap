# Roadmap: spectral graph bounds

**Summary.** The adjacency matrix of a finite simple graph is a real symmetric matrix, so it has
real eigenvalues `λ₁ ≥ λ₂ ≥ ⋯ ≥ λₙ`, listed with multiplicity. Many combinatorial invariants of
the graph are bounded by these numbers: the degrees, the chromatic number, the independence
number, the number of edges between two sets of vertices and, in the other direction, how small
the second eigenvalue of a regular graph can be. This roadmap proves the classical bounds of this
kind for finite simple graphs. Every statement is an inequality between eigenvalues and graph
invariants; bounds whose usual form divides by an eigenvalue or by a degree are multiplied out,
so that they also hold for graphs without edges.

The headline theorems are these.

- *The largest eigenvalue.* For a graph on a nonempty vertex set, the average degree is at most
  `λ₁`, with equality exactly when the graph is regular, and `λ₁` is at most the maximum degree.
  Every eigenvalue has absolute value at most `λ₁`, and `λ₁` does not increase when edges are
  deleted.
- *Colourings and independent sets.* Wilf's bound says that a graph can be properly coloured with
  `1 + ⌊λ₁⌋` colours. Hoffman's bound says that if a graph is properly coloured with `k` colours,
  then `λ₁ + (k − 1) λₙ ≤ 0`; for a graph with at least one edge, `λₙ` is negative and this reads
  `χ ≥ 1 − λ₁/λₙ`. Hoffman's ratio bound says that a `d`-regular graph on `n` vertices with
  `d ≥ 1` has no independent set with more than `n(−λₙ)/(d − λₙ)` vertices, and that every
  vertex outside an independent set attaining it has exactly `−λₙ` neighbours in the set. The
  Petersen graph attains the ratio bound with 4 vertices.
- *The expander mixing lemma.* In a `d`-regular graph on `n` vertices whose eigenvalues
  `λ₂, …, λₙ` all have absolute value at most `β`, the number of ordered adjacent pairs from a set
  of `s` vertices to a set of `t` vertices differs from `dst/n` by at most
  `β √(st(1 − s/n)(1 − t/n))`.
- *The Alon–Boppana bound.* If every vertex of a connected graph has degree at least `k ≥ 3` and
  its diameter `D` is at least 4, then `λ₂ > 2√(k − 1) cos(π/(⌊D/2⌋ + 1))`, and an explicit lower
  bound of the same kind holds for each `λₘ` with `2 ≤ m` and `4(m − 1) ≤ D`; this is Quenell's
  theorem. Consequently, for `d ≥ 3` and `ε > 0`, every `d`-regular graph with enough
  vertices has `λ₂ ≥ 2√(d − 1) − ε`.

The roadmap builds on Mathlib's adjacency matrices and its eigenvalues of Hermitian matrices,
listed in nonincreasing order, and on Tau Ceti's Courant–Fischer min–max theorem, which turns
statements about eigenvalues into statements about the quadratic form `xᵀAx`. Cauchy interlacing
for principal submatrices is planned by the roadmap RandomMatrices, and its uses here cite it.

Layer 1 below defines the sorted adjacency eigenvalues and proves the bounds on `λ₁` and the
multiplicity of the degree in a regular graph. Layer 2 bounds the chromatic number and Layer 3
the independence number; both use Layer 1. Layer 4 proves the expander mixing lemma from Layer 1.
Layer 5 proves Quenell's bound and the Alon–Boppana bound; it uses Layer 1.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V` with `[Fintype V]`, `[DecidableEq V]` and
  `[DecidableRel G.Adj]`; `n = Fintype.card V`. Degrees are `SimpleGraph.degree`, the maximum
  degree is `SimpleGraph.maxDegree`, regularity of degree `d` is `G.IsRegularOfDegree d`, the
  number of edges is `#G.edgeFinset`, the chromatic number is the least `k` with `G.Colorable k`,
  the independence number is `SimpleGraph.indepNum` and an independent set is
  `SimpleGraph.IsIndepSet`. Statements about colourings are made for every `k` with
  `G.Colorable k`, which avoids the `ℕ∞`-valued `SimpleGraph.chromaticNumber`.
- **Eigenvalues.** The adjacency matrix is `G.adjMatrix ℝ`. Its eigenvalues are Mathlib's
  `Matrix.IsHermitian.eigenvalues₀`, a function on `Fin n` that is antitone
  (`Matrix.IsHermitian.eigenvalues₀_antitone`). In the prose they are `λ₁ ≥ ⋯ ≥ λₙ`, numbered
  from 1; in Lean the index `i : Fin n` carries `λ_(i+1)`, so index `0` is `λ₁` and index `n − 1`
  is `λₙ`. Mathlib's `Matrix.IsHermitian.eigenvalues`, indexed by the vertices through an
  arbitrary equivalence, is not used to state the results, since its value at a given index is
  not the `i`-th largest.
- **Extreme eigenvalues.** On a nonempty vertex type, `λ₁` and `λₙ` are `largestEigenvalue G` and
  `smallestEigenvalue G`. On one vertex both are `0`.
- **Edges between sets.** For finite sets `S`, `T` of vertices, `e(S, T)` is the number of ordered
  pairs `(u, v)` with `u ∈ S`, `v ∈ T` and `u ~ v`, which is the cardinality of Mathlib's
  `G.interedges S T`. An edge inside `S ∩ T` is counted twice, and `e(V, V) = 2|E|`.
- **Diameter and distance.** The distance is `SimpleGraph.dist` and the diameter is
  `SimpleGraph.diam`, which is `0` for a graph that is not connected; a hypothesis `4 ≤ G.diam`
  therefore includes connectedness.
- **Division and square roots.** Every bound is stated in a form that does not divide by an
  eigenvalue or a degree. Square roots are `Real.sqrt`, and `√(k − 1)` is taken of the real
  number `(k : ℝ) − 1`.

## Layer 1: the adjacency spectrum

### 1.1 Sorted adjacency eigenvalues

Define `adjEigenvalues G : Fin n → ℝ` as Mathlib's `Matrix.IsHermitian.eigenvalues₀` of
`G.adjMatrix ℝ`, which is Hermitian by `SimpleGraph.isHermitian_adjMatrix`. On a nonempty vertex
type define `largestEigenvalue G` as its value at index `0` and `smallestEigenvalue G` as its
value at index `n − 1`.

API, each proved here:

- The eigenvalues sum to `0` and their squares sum to `2|E|`: the trace of `A` is `0` and the
  trace of `A²` is the sum of the degrees (Brouwer–Haemers, Proposition 1.3.1, p. 4). Proof from
  Mathlib's `Matrix.IsHermitian.trace_eq_sum_eigenvalues`, `SimpleGraph.trace_adjMatrix`,
  `SimpleGraph.adjMatrix_mul_self_apply_self` and `SimpleGraph.sum_degrees_eq_twice_card_edges`.
- All eigenvalues are `0` if and only if the graph has no edge (Brouwer–Haemers, Proposition
  1.3.2, p. 5); otherwise `λₙ < 0 < λ₁`. Both follow from the two sums above.
- Rayleigh bounds: `λₙ ‖x‖² ≤ xᵀAx ≤ λ₁ ‖x‖²` for every real vector `x`, and equality on either
  side forces `Ax = λ₁ x`, respectively `Ax = λₙ x`. Proof from the expansion of the quadratic
  form in an orthonormal eigenbasis, Tau Ceti's
  `LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`, applied to
  `Matrix.toEuclideanLin A`; by definition `Matrix.IsHermitian.eigenvalues₀` is the sorted
  eigenvalue list of that operator.
- Interlacing for induced subgraphs: if `H` is the subgraph induced on a set `W` of `m` vertices,
  then `λᵢ(G) ≥ λᵢ(H) ≥ λ_(n−m+i)(G)` for `1 ≤ i ≤ m` (Brouwer–Haemers, Proposition 3.2.1 (i),
  p. 37). This is Cauchy interlacing (RandomMatrices 1.2) applied to the principal submatrix
  `(G.adjMatrix ℝ).submatrix e e` for the embedding `e` of `SimpleGraph.Embedding.induce W`,
  which is `H.adjMatrix ℝ` by Mathlib's `SimpleGraph.Embedding.submatrix_adjMatrix`.

**Checks.**
- The complete graph `Kₙ`, `n ≥ 2`, has eigenvalues `n − 1` once and `−1` with multiplicity
  `n − 1`; on one vertex the only eigenvalue is `0`, so there `λ₁ = λₙ = 0`.
- The star `K_(1,4)` has eigenvalues `2, 0, 0, 0, −2`: the value at index `0` is `2`, while a
  nondecreasing listing would put `−2` there. Mathlib's vertex-indexed `eigenvalues` assigns the
  five values to the vertices through an arbitrary equivalence, so the centre of the star need not
  receive `2`.
- The 5-cycle has eigenvalues `2`, `(√5 − 1)/2` twice and `−(√5 + 1)/2` twice; they sum to `0`
  and their squares sum to `10 = 2|E|`.
- The Petersen graph has eigenvalues `3`, `1` five times and `−2` four times.
- The graph with no edges has all eigenvalues `0`.

*Needs:* Mathlib `SimpleGraph.adjMatrix`, `SimpleGraph.isHermitian_adjMatrix`,
`Matrix.IsHermitian.eigenvalues₀`, `Matrix.IsHermitian.eigenvalues₀_antitone`,
`Matrix.IsHermitian.trace_eq_sum_eigenvalues`, `SimpleGraph.trace_adjMatrix`,
`SimpleGraph.adjMatrix_mul_self_apply_self`, `SimpleGraph.sum_degrees_eq_twice_card_edges`,
`SimpleGraph.Embedding.induce`, `SimpleGraph.Embedding.submatrix_adjMatrix`; Tau Ceti
`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`; RandomMatrices 1.2
(Cauchy interlacing). (Proved here, except as cited.)

### 1.2 Degrees and the largest eigenvalue

On a nonempty vertex type:

- `two_mul_card_edgeFinset_le`: `2|E| ≤ n λ₁`, that is, the average degree is at most `λ₁`.
- `card_mul_largestEigenvalue_eq_iff`: `n λ₁ = 2|E|` if and only if `G` is regular.
- `largestEigenvalue_le_maxDegree`: `λ₁ ≤ Δ`, the maximum degree.

(Brouwer–Haemers, Proposition 3.1.2, p. 33, for connected graphs, and the remark after its proof,
p. 34, for all graphs.)

Route: the Rayleigh bound of 1.1 at the all-ones vector `𝟙` gives `2|E| = 𝟙ᵀA𝟙 ≤ λ₁ n`, and
equality forces `A𝟙 = λ₁ 𝟙`, which says that every degree is `λ₁`; conversely a `d`-regular graph
has `A𝟙 = d𝟙`, so `d ≤ λ₁`, and `λ₁ ≤ Δ = d`. For the upper bound, Gershgorin's theorem
(Mathlib's `eigenvalue_mem_ball`) puts every eigenvalue in a disc of radius `deg v` about `0`
for some vertex `v`.

**Checks.**
- The star `K_(1,4)`: average degree `8/5`, `λ₁ = 2`, `Δ = 4`.
- A triangle together with an isolated vertex has `λ₁ = Δ = 2` and is not regular, so equality in
  the upper bound does not characterize regular graphs; its average degree `3/2` is below `λ₁`,
  as the second statement requires.
- A `d`-regular graph has `λ₁ = d`: the Petersen graph has `λ₁ = 3`.

*Needs:* 1.1; Mathlib `SimpleGraph.adjMatrix_mulVec_const_apply`, `SimpleGraph.maxDegree`,
`SimpleGraph.degree_le_maxDegree`, `eigenvalue_mem_ball`,
`Matrix.IsHermitian.eigenvalues_mem_spectrum_real`. (Proved here, following the cited route.)

### 1.3 Perron–Frobenius bounds

On a nonempty vertex type:

- `abs_adjEigenvalues_le`: every eigenvalue satisfies `|λᵢ| ≤ λ₁`.
- `largestEigenvalue_mono`: if `H ≤ G` are graphs on the same vertex type, then
  `λ₁(H) ≤ λ₁(G)`.

(Brouwer–Haemers, Proposition 3.1.1, p. 33, from the Perron–Frobenius theorem; for adjacency
matrices the statement also follows from the Rayleigh bounds alone.)

Route: for a unit vector `x` let `|x|` be its entrywise absolute value. Since the entries of the
adjacency matrices are `0` or `1`, `|xᵀAx| ≤ |x|ᵀA|x| ≤ λ₁`. Taking `x` a unit eigenvector for
`λᵢ` gives the first statement. For the second, take `x` a unit eigenvector of `H` for `λ₁(H)`;
then `λ₁(H) = xᵀA_H x ≤ |x|ᵀA_H|x| ≤ |x|ᵀA_G|x| ≤ λ₁(G)`.

**Checks.**
- The star `K_(1,4)` has `λₙ = −2 = −λ₁`, so the first bound is attained; the 5-cycle has
  `|λₙ| = (√5 + 1)/2 < 2 = λ₁`.
- Deleting an edge of `K₄` lowers `λ₁` from `3` to `(1 + √17)/2 ≈ 2.56`.
- The monotonicity holds only for `λ₁`: deleting an edge of the triangle gives the path on three
  vertices, and the second eigenvalue rises from `−1` to `0`.

*Needs:* 1.1. (Proved here, following the cited route.)

### 1.4 Regular graphs

Prove `card_adjEigenvalues_eq_degree`: in a `d`-regular graph the number of indices `i` with
`λᵢ = d` equals the number of connected components (Brouwer–Haemers, Proposition 1.3.8, p. 7).

Route: for a `d`-regular graph `G.lapMatrix ℝ = d − G.adjMatrix ℝ`, with `d` the scalar matrix
(`SimpleGraph.IsRegularOfDegree.degMatrix_eq`), so the eigenspace of `A` for `d` is the kernel of
the Laplacian, whose dimension is the number of components by Mathlib's
`SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`. The number of indices at
which the sorted eigenvalue list takes a value is the dimension of the eigenspace of that value,
by Mathlib's `LinearMap.IsSymmetric.card_filter_eigenvalues_eq` applied to
`Matrix.toEuclideanLin A`.

**Checks.**
- The disjoint union of two copies of `K₄` is 3-regular with eigenvalues `3, 3` and `−1` six
  times: two components, so `λ₂ = 3`.
- The Petersen graph is connected and `3` occurs once.
- For `d = 0` every eigenvalue is `0` and every vertex is a component, so both counts are `n`.

*Needs:* 1.1; Mathlib `SimpleGraph.lapMatrix`, `SimpleGraph.IsRegularOfDegree.degMatrix_eq`,
`SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`,
`LinearMap.IsSymmetric.card_filter_eigenvalues_eq`. (Proved here.)

### Examples

Complete graphs, the star `K_(1,4)`, the 5-cycle, the Petersen graph, `K₄` with one edge deleted,
the triangle and the path on three vertices, a triangle with an isolated vertex, and two disjoint
copies of `K₄`, with the spectra given in the Checks.

### Dependencies

Mathlib `SimpleGraph.adjMatrix`, `SimpleGraph.isHermitian_adjMatrix`,
`Matrix.IsHermitian.eigenvalues₀`, `Matrix.IsHermitian.eigenvalues₀_antitone`,
`Matrix.IsHermitian.trace_eq_sum_eigenvalues`, `Matrix.IsHermitian.eigenvalues_mem_spectrum_real`,
`SimpleGraph.trace_adjMatrix`, `SimpleGraph.adjMatrix_mul_self_apply_self`,
`SimpleGraph.adjMatrix_mulVec_const_apply`, `SimpleGraph.sum_degrees_eq_twice_card_edges`,
`SimpleGraph.maxDegree`, `SimpleGraph.degree_le_maxDegree`, `eigenvalue_mem_ball`,
`SimpleGraph.Embedding.induce`, `SimpleGraph.Embedding.submatrix_adjMatrix`,
`SimpleGraph.lapMatrix`, `SimpleGraph.IsRegularOfDegree.degMatrix_eq`,
`SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`,
`LinearMap.IsSymmetric.card_filter_eigenvalues_eq`; Tau Ceti
`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`; RandomMatrices 1.2. No
other layer.

## Layer 2: the chromatic number

### 2.1 Wilf's bound

Prove `colorable_floor_largestEigenvalue_add_one`: on a nonempty vertex type, `G` is
`(⌊λ₁⌋ + 1)`-colourable, that is, `χ(G) ≤ 1 + λ₁` (Wilf, 1967; Brouwer–Haemers, Proposition
3.6.1, p. 40, stated for connected graphs; the proof of the inequality there does not use
connectedness). Since `χ(G)` is an integer, the floor loses nothing.

Route: induction on `n`. By 1.2 some vertex `v` has degree at most the average degree, hence at
most `⌊λ₁(G)⌋`. The graph induced on the other vertices has largest eigenvalue at most `λ₁(G)` by
the interlacing of 1.1 (or by the Rayleigh bound applied to a vector extended by `0`), so by
induction it is `(⌊λ₁(G)⌋ + 1)`-colourable, and a colour not used on the neighbours of `v` is
left for `v`. On one vertex `λ₁ = 0` and one colour suffices.

**Checks.**
- Complete graphs and odd cycles attain the bound: `χ(Kₙ) = n = 1 + λ₁` and
  `χ(C₂ₘ₊₁) = 3 = 1 + 2`.
- The star `K_(1,4)` has `1 + ⌊λ₁⌋ = 3`, while `χ = 2` and `Δ + 1 = 5`.
- The Petersen graph has `1 + λ₁ = 4` and `χ = 3`.

*Needs:* 1.1, 1.2; Mathlib `SimpleGraph.Colorable`, `SimpleGraph.induce`,
`SimpleGraph.Embedding.induce`. (Proved here, following the cited route.)

### 2.2 Hoffman's bound

- `largestEigenvalue_add_sum_le_zero`: if `G` is `k`-colourable and `k ≤ n`, then `λ₁` plus the
  sum of the `k − 1` smallest eigenvalues, `λ₁ + λ_(n−k+2) + ⋯ + λₙ`, is at most `0`; in Lean the
  sum runs over the indices `i` with `n < i + k` (Brouwer–Haemers, Proposition 3.6.3 (i), p. 40,
  for `k = χ(G)`; the route gives every `k` from `χ(G)` to `n`).
- `largestEigenvalue_add_mul_smallestEigenvalue_nonpos`: if `G` is `k`-colourable, then
  `λ₁ + (k − 1) λₙ ≤ 0`. For a graph with an edge, `λₙ < 0` by 1.1, and this is Hoffman's bound
  `χ(G) ≥ 1 − λ₁/λₙ` (Hoffman, 1970; Brouwer–Haemers, Theorem 3.6.2, p. 40). For a graph without
  edges both sides are `0`.

Route for the first statement: let `u` be a unit eigenvector for `λ₁` and let `xⱼ` be `u` restricted
to the `j`-th colour class; keep the `m ≤ k` nonzero ones, and let `S` be the `n × m` matrix with
columns `xⱼ/‖xⱼ‖`, which has orthonormal columns. The `m × m` matrix `B = SᵀAS` has zero diagonal,
because each class is independent, and has the eigenvalue `λ₁` with eigenvector `(‖xⱼ‖)ⱼ`. The
eigenvalues of `B` interlace those of `A`: complete `S` to an orthogonal matrix `Q`; then `B` is a
principal submatrix of `QᵀAQ`, which has the eigenvalues of `A` (its eigenbasis is the image
under `Qᵀ` of one of `A`), and Cauchy interlacing (RandomMatrices 1.2) applies
(Brouwer–Haemers, Theorem 2.5.1, p. 26). The `m − 1` eigenvalues of `B`
other than one copy of `λ₁` are then at least `λ_(n−m+2), …, λₙ`, so
`0 = tr B ≥ λ₁ + λ_(n−m+2) + ⋯ + λₙ`. Finally the statement for `m` implies the statement for every
`k` with `m ≤ k ≤ n`: since the eigenvalues sum to `0`, the statement for `k` says
`λ₂ + ⋯ + λ_(n−k+1) ≥ 0`, and shortening this sum from its small end keeps it nonnegative.

Route for the second statement: apply the first to `min(k, n)`, using that every graph is
`n`-colourable, and bound each of the `min(k, n) − 1` eigenvalues below by `λₙ ≤ 0`.

**Checks.**
- The complete tripartite graph `K_(2,2,2)` has eigenvalues `4`, `0` three times and `−2` twice:
  `1 − λ₁/λₙ = 3 = χ`, so Hoffman's bound is attained.
- The 5-cycle gives `1 − λ₁/λₙ = 1 + 4/(1 + √5) = √5 ≈ 2.24`, so `χ ≥ 3`, and `χ = 3`.
- `K₄` with one edge deleted has `χ = 3` and eigenvalues `(1 + √17)/2`, `0`, `−1`,
  `(1 − √17)/2`: the first statement holds with equality, `λ₁ + λ₃ + λ₄ = 0`, while
  `λ₁ + 2λ₄ ≈ −0.56`, so the first statement is the sharper one.
- The hypothesis `k ≤ n` is needed in the first statement: for `K₂` and `k = 3` every index
  satisfies `n < i + k`, and the left side is `λ₁ + λ₁ + λ₂ = 1`.

*Needs:* 1.1; Mathlib `SimpleGraph.Colorable`, `SimpleGraph.Coloring`,
`Orthonormal.exists_orthonormalBasis_extension`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`; RandomMatrices 1.2 (Cauchy interlacing).
(Proved here, following the cited route.)

### Examples

Complete and complete multipartite graphs, odd cycles, the star `K_(1,4)`, `K₄` with an edge
deleted, `K₂` and the Petersen graph, with the values in the Checks.

### Dependencies

1.1, 1.2; Mathlib `SimpleGraph.Colorable`, `SimpleGraph.Coloring`, `SimpleGraph.induce`,
`SimpleGraph.Embedding.induce`, `Orthonormal.exists_orthonormalBasis_extension`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`; RandomMatrices 1.2.

## Layer 3: the independence number

### 3.1 Cvetković's inertia bound

Prove `indepNum_le_card_nonneg` and `indepNum_le_card_nonpos`: the independence number is at
most the number of indices `i` with `λᵢ ≥ 0`, and at most the number with `λᵢ ≤ 0` (Cvetković,
1971; Brouwer–Haemers, Theorem 3.5.1, p. 39). No hypothesis on the graph is needed; on the empty
vertex type all three numbers are `0`.

Route: an independent set of size `α` gives a principal submatrix of `A` equal to the zero matrix
of size `α`. By interlacing (1.1), `λ_α(G) ≥ 0` and `λ_(n−α+1)(G) ≤ 0`, so the `α` largest
eigenvalues are nonnegative and the `α` smallest are nonpositive.

**Checks.**
- The Petersen graph has six nonnegative and four nonpositive eigenvalues, so `α ≤ 4`, and
  `α = 4`.
- The star `K_(1,4)` has `α = 4` and four nonnegative and four nonpositive eigenvalues, so both
  bounds are attained. Counting only the positive eigenvalues would give `α ≤ 1`, which is false;
  the zero eigenvalues must be counted.
- `Kₙ` has one nonnegative eigenvalue and `α = 1`.

*Needs:* 1.1 (interlacing); Mathlib `SimpleGraph.indepNum`, `SimpleGraph.IsIndepSet`. (Proved
here, following the cited route.)

### 3.2 Hoffman's ratio bound

Let `G` be `d`-regular on a nonempty vertex type.

- `indepNum_mul_le`: `α (d − λₙ) ≤ n (−λₙ)`. For `d ≥ 1` this is `α ≤ n(−λₙ)/(d − λₙ)`
  (Hoffman, unpublished, as Brouwer–Haemers attribute it; Brouwer–Haemers, Theorem 3.5.2, p. 39,
  for nonzero degree). For `d = 0` both sides are `0`.
- `card_neighbor_inter_eq_of_eq`: if an independent set `S` satisfies
  `|S| (d − λₙ) = n (−λₙ)`, every vertex outside `S` has exactly `−λₙ` neighbours in `S`
  (Brouwer–Haemers, Theorem 3.5.2, p. 39).

Route: for an independent set `S` of size `s`, put `x = 𝟙_S − (s/n) 𝟙`. Then `‖x‖² = s(n − s)/n`
and, since `S` spans no edge and every degree is `d`, `xᵀAx = −s²d/n`. The Rayleigh bound
`xᵀAx ≥ λₙ ‖x‖²` of 1.1 rearranges to `s (d − λₙ) ≤ n (−λₙ)`. Under equality with `s ≥ 1`, `x` is
an eigenvector for `λₙ` by the equality clause of 1.1, and reading `Ax = λₙ x` at a vertex
outside `S` gives the count of its neighbours in `S`. If `s = 0`, equality forces `λₙ = 0`, so
`d = 0` and no vertex has a neighbour.

**Checks.**
- The Petersen graph: `10 · 2 / (3 + 2) = 4 = α`, and each of the six vertices outside an
  independent set of size 4 has exactly 2 neighbours in it.
- The Kneser graph on the 3-element subsets of a 7-element set, two subsets adjacent when
  disjoint, is 4-regular on 35 vertices with smallest eigenvalue `−3`: the bound is
  `35 · 3 / 7 = 15`, attained by the 15 subsets containing a fixed element.
- `K_(3,3)`: `6 · 3 / (3 + 3) = 3 = α`. The 5-cycle: `5(1 + √5)/(5 + √5) = √5 ≈ 2.24`, so
  `α ≤ 2`, and `α = 2`.
- Regularity is needed: for the star `K_(1,4)` with `d` replaced by the maximum degree `4`,
  `α (4 − λₙ) = 24` exceeds `n (−λₙ) = 10`.

*Needs:* 1.1 (Rayleigh bounds with their equality clause); Mathlib `SimpleGraph.indepNum`,
`SimpleGraph.IsIndepSet`, `SimpleGraph.IsIndepSet.card_le_indepNum`,
`SimpleGraph.IsRegularOfDegree`, `SimpleGraph.dotProduct_mulVec_adjMatrix`. (Proved here,
following the cited route.)

### Examples

The Petersen graph, the Kneser graph on the 3-subsets of a 7-set, `K_(3,3)`, the 5-cycle,
complete graphs and the star `K_(1,4)`.

### Dependencies

1.1; Mathlib `SimpleGraph.indepNum`, `SimpleGraph.IsIndepSet`,
`SimpleGraph.IsIndepSet.card_le_indepNum`, `SimpleGraph.IsRegularOfDegree`,
`SimpleGraph.dotProduct_mulVec_adjMatrix`. No other layer.

## Layer 4: edge distribution in regular graphs

### 4.1 The expander mixing lemma

Prove `abs_card_interedges_sub_le`: let `G` be `d`-regular and let `β` be a real number with
`|λᵢ| ≤ β` for every `i ≥ 2`. For all sets `S`, `T` of `s` and `t` vertices,

    |e(S, T) − d s t / n| ≤ β √(s t (1 − s/n) (1 − t/n)),

(Alon and Chung, 1988; Brouwer–Haemers, Proposition 4.3.2, pp. 68–69). For `n ≥ 2` the
hypothesis forces `β ≥ 0`, and the bound implies `|e(S, T) − dst/n| ≤ β √(st)`. On at most one
vertex the hypothesis on `β` is empty, `β` may be negative, and both sides are `0`.

The hypothesis bounds every eigenvalue except the one at index `1`, by index and not by value.
For a disconnected `d`-regular graph the value `d` occurs more than once (1.4), and a bound on the
eigenvalues different from `d` alone does not suffice (Check below).

Route: by 1.2, `λ₁ = d` with eigenvector `𝟙`. Choose an orthonormal eigenbasis of `A` whose first
vector is `𝟙/√n`; its eigenvalues, listed in nonincreasing order, are `λ₁, …, λₙ` (Tau Ceti's
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`). Write `𝟙_S = (s/n)𝟙 + x` and
`𝟙_T = (t/n)𝟙 + y` with `x, y ⊥ 𝟙`. Then `e(S, T) = 𝟙_Sᵀ A 𝟙_T = dst/n + xᵀAy`, and expanding
`x` and `y` in the remaining basis vectors gives `|xᵀAy| ≤ β ‖x‖ ‖y‖` by Cauchy–Schwarz, with
`‖x‖² = s(n − s)/n` and `‖y‖² = t(n − t)/n`.

**Checks.**
- In the Petersen graph (`d = 3`, `β = 2`) take `S = T` an independent set of size 4:
  `|0 − 3 · 16/10| = 4.8` and `2 √(16 · 0.6 · 0.6) = 4.8`, so the bound is attained.
- In `Kₙ` with `n ≥ 2`, `β = 1`; for `S = T` one vertex,
  `|0 − (n − 1)/n| = (n − 1)/n = √((1 − 1/n)²)`, again with equality.
- Two disjoint copies of `K₄`: the eigenvalues other than the value `3` are all `−1`, but with
  `β = 1` and `S = T` one copy of `K₄` the left side is `|12 − 3 · 16/8| = 6` and the right side
  `1 · √(16 · ¼) = 2`. Here `λ₂ = 3`, so the hypothesis forces `β ≥ 3`, and with `β = 3` the
  bound is `6`, attained.

*Needs:* 1.2; Mathlib `SimpleGraph.interedges`,
`SimpleGraph.dotProduct_mulVec_adjMatrix`, `SimpleGraph.IsRegularOfDegree`,
`Matrix.IsHermitian.eigenvectorBasis`, `Matrix.IsHermitian.mulVec_eigenvectorBasis`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`. (Proved here, following the cited route.)

### Examples

The Petersen graph, complete graphs and two disjoint copies of `K₄`, with the values in the
Checks.

### Dependencies

1.2; Mathlib `SimpleGraph.interedges`, `SimpleGraph.dotProduct_mulVec_adjMatrix`,
`SimpleGraph.IsRegularOfDegree`, `Matrix.IsHermitian.eigenvectorBasis`,
`Matrix.IsHermitian.mulVec_eigenvectorBasis`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`.

## Layer 5: the second eigenvalue and the diameter

### 5.1 Quenell's bound

Prove `lt_adjEigenvalues_of_le_diam`: let every vertex of `G` have degree at least `k ≥ 3`, let
`D = G.diam`, and let `2 ≤ m` with `4(m − 1) ≤ D`. Then

    λₘ > 2 √(k − 1) cos(π / (r + 1)),   r = ⌊D / (2(m − 1))⌋.

In Lean `m − 1` is the index `i` with `1 ≤ i` and `4 i ≤ G.diam`, and `r` is the natural-number
quotient `G.diam / (2 i)` (Quenell, Theorem 6.2, pp. 458–459). The case `m = 2` reads
`λ₂ > 2√(k − 1) cos(π/(⌊D/2⌋ + 1))` for `D ≥ 4`. Since `G.diam` is `0` for a graph that is not
connected, the hypothesis includes connectedness, as in the source, where the graph is connected.

Route, in three steps.

- *Disjoint test functions.* If `B₁, …, Bₘ` are sets of vertices, pairwise disjoint and with no
  edge between two of them, and `μ` bounds from below the largest eigenvalue of each induced
  graph `G[Bⱼ]`, then `λₘ(G) ≥ μ` (Quenell, Theorem 6.1, p. 456, stated there for balls; its
  proof uses only that the sets are disjoint with no edge between two of them). Extend a top
  eigenvector of each `G[Bⱼ]` by `0`: the `m` vectors are orthogonal, `xⱼᵀ A xₗ = 0` for
  `j ≠ l`, and every vector of their span has Rayleigh quotient at least `μ`; Tau Ceti's
  min–max theorem `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` gives `λₘ ≥ μ`.
- *Balls.* If every vertex has degree at least `k ≥ 3`, the ball `B(x₀, ρ)` of radius `ρ ≥ 1` has
  largest eigenvalue greater than `2√(k − 1) cos(π/(ρ + 2))` (Quenell, Theorem 5.2, p. 454). The
  test function is `f(x) = σ(dist(x₀, x))`, where `σ(0) = 1`, `σ(1) = λ/k` and
  `(k − 1) σ(j + 1) = λ σ(j) − σ(j − 1)` for `j ≥ 1`, for the value `λ` in `(0, 2√(k − 1))` at
  which `ρ + 1` is the first zero of `σ`, read as a function of a real variable. Writing `σ` as a
  damped sine shows that `λ > 2√(k − 1) cos(π/(ρ + 2))` (Quenell, Lemmas 4.1 and 4.2, p. 450),
  and `σ` decreases on `0, 1, …, ρ + 1` when `k ≥ 3` (Quenell, Lemma 4.3, p. 451). Monotonicity
  and the degree bound give `A f ≥ λ f` entrywise on the ball, so the Rayleigh quotient of `f` is
  at least `λ`.
- *Packing.* On a shortest path of length `D`, the vertices at positions `0, 2r, …, 2r(m − 1)`
  are pairwise at distance at least `2r`, so the balls of radius `r − 1` about them are disjoint
  with no edge between them; `r ≥ 2` because `4(m − 1) ≤ D`. The two previous steps with
  `ρ = r − 1` give the bound.

**Checks.**
- The 4-dimensional cube is 4-regular with diameter 4 and `λ₂ = 2`; the bound for `m = 2` is
  `2√3 cos(π/3) = √3 ≈ 1.73`.
- The prism over the 10-cycle (two 10-cycles joined by a perfect matching) is 3-regular with
  diameter 6 and `λ₂ = 1 + 2cos(π/5) ≈ 2.62`; the bound for `m = 2` is `2√2 cos(π/4) = 2`.
- As `D` grows, `2√(k − 1) cos(π/(⌊D/2⌋ + 1))` does not decrease and tends to `2√(k − 1)`.

*Needs:* 1.1; Mathlib `SimpleGraph.diam`, `SimpleGraph.dist`, `SimpleGraph.induce`,
`Real.cos`, `Real.sqrt`; Tau Ceti `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`.
(Proved here, following the cited route.)

### 5.2 The Alon–Boppana bound

Prove `alon_boppana`: for every `d ≥ 3` and `ε > 0` there is `N` such that every `d`-regular graph
on `n ≥ N` vertices has `λ₂ ≥ 2√(d − 1) − ε` (Alon, 1986, as Brouwer–Haemers attribute it;
Brouwer–Haemers, Proposition 4.1.1, p. 67, states it with the rate `1 − O(log(d − 1)/log n)` for
the ratio `λ₂/(2√(d − 1))`, for `d ≥ 3`). The vertex type in the Lean statement is `Fin n`. The
hypothesis `d ≥ 3` is the source's, and the route uses it through 5.1. For `d ≤ 2` the
conclusion also holds, and that case is not stated here: a 2-regular graph is a disjoint union of
cycles, the `n`-cycle has `λ₂ = 2 cos(2π/n)`, and for `d ≤ 1` the right side is `−ε` (the square
root of a negative real is `0`) while `λ₂ ≥ 0` once `n ≥ 4`.

Route: if `G` is not connected, `λ₁ = d` by 1.2 and `d` occurs at least twice by 1.4, so `λ₂ = d`,
and `d ≥ 2√(d − 1)` because `d − 2√(d − 1) = (√(d − 1) − 1)²`. If `G` is connected of diameter `D`,
counting the vertices at each distance from a fixed vertex gives
`n ≤ 1 + d (1 + (d − 1) + ⋯ + (d − 1)^(D − 1))`, so `D` tends to infinity with `n`; once `D ≥ 4`,
5.1 with `m = 2` gives `λ₂ > 2√(d − 1) cos(π/(⌊D/2⌋ + 1))`, which exceeds `2√(d − 1) − ε` for `D`
large.

**Checks.**
- The complete graph `K_(d+1)` has `λ₂ = −1`, so no bound of this form holds for all
  `d`-regular graphs; `N` depends on `d` and `ε`.
- The vertex count above is attained by the Petersen graph: `d = 3`, `D = 2` and
  `1 + 3 (1 + 2) = 10` vertices.
- Two disjoint copies of `K₄` have `λ₂ = 3 ≥ 2√2 ≈ 2.83`.

*Needs:* 1.2, 1.4, 5.1; Mathlib `SimpleGraph.diam`, `SimpleGraph.dist`,
`SimpleGraph.Connected`, `SimpleGraph.IsRegularOfDegree`. (Proved here, following the cited
route.)

### Examples

The 4-dimensional cube, the prism over the 10-cycle, complete graphs, the Petersen graph and two
disjoint copies of `K₄`.

### Dependencies

1.1, 1.2, 1.4; Mathlib `SimpleGraph.diam`, `SimpleGraph.dist`, `SimpleGraph.Connected`,
`SimpleGraph.induce`, `SimpleGraph.IsRegularOfDegree`, `Real.cos`, `Real.sqrt`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`.

## Scope and ownership

This roadmap owns the targets stated above: the sorted adjacency eigenvalues with their trace
identities, Rayleigh bounds and the interlacing statement for induced subgraphs; the bounds on
`λ₁` by the average and the maximum degree with the characterization of equality in the first;
the Perron–Frobenius bounds `|λᵢ| ≤ λ₁` and monotonicity of `λ₁`; the multiplicity of the degree
in a regular graph; Wilf's bound; Hoffman's inequality and Hoffman's bound for the chromatic
number; Cvetković's inertia bound; Hoffman's ratio bound with its equality clause; the expander
mixing lemma; Quenell's bound and the Alon–Boppana bound.

Already in the libraries and therefore not targets:

- Mathlib's adjacency and Laplacian matrices with their symmetry, the positive semidefiniteness
  of the Laplacian (`SimpleGraph.posSemidef_lapMatrix`), the identification of its kernel with the
  locally constant vectors and of the kernel's dimension with the number of components
  (`SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`), the eigenvalue `d` of a
  `d`-regular graph (`SimpleGraph.IsRegularOfDegree.mem_spectrum_adjMatrix`), walk counts as
  entries of powers of the adjacency matrix (`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`),
  Gershgorin's theorem (`eigenvalue_mem_ball`), and the sorted eigenvalues of Hermitian matrices.
- Tau Ceti's Courant–Fischer min–max theorem, Weyl's inequalities and Loewner monotonicity
  (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`), rank interlacing
  (`Matrix.IsHermitian.eigenvalues₀_le_of_rank_sub_le`), and the Perron–Frobenius theorem for
  nonnegative, positive and irreducible matrices (`TauCeti/LinearAlgebra/Matrix/PerronFrobenius/`).
  The bounds of 1.2 and 1.3 are proved above from Rayleigh quotients and Gershgorin's theorem.
  Tau Ceti's Perron–Frobenius statements `Matrix.norm_le_of_mulVec_le_smul`, applied with the
  all-ones vector, and `Matrix.exists_mulVec_eq_smul_of_nonneg` give other routes to `λ₁ ≤ Δ` and
  `|λᵢ| ≤ λ₁`; neither library states these bounds for the sorted adjacency eigenvalues.

Left to other roadmaps on main:

- RandomMatrices 1.2 (on main) owns Cauchy interlacing for principal submatrices of Hermitian
  matrices and the min–max form of `Matrix.IsHermitian.eigenvalues₀`. This roadmap uses
  interlacing in 1.1, 2.2 and 3.1 and does not restate it; 2.2 reduces interlacing for a
  compression `SᵀAS` with orthonormal columns to that case.
- GeometricTopology 4.4.5 (on main) owns the weighted matrix-tree identity; spanning trees are
  not counted here.

Neighbouring open roadmaps, not on main, are not treated here and are not suppliers:

- GraphColouring (an open roadmap, not on main) states in its 1.1 the degeneracy bound, that
  `χ(G)` is at most one more than the largest minimum degree of an induced subgraph, and the
  bound `χ ≤ Δ + 1`, and in its 2.1 Brooks' theorem. Wilf's bound in 2.1 above is a different
  statement, a bound by the largest eigenvalue; its route repeats the induction on a vertex of
  small degree and takes the degree bound from 1.2. The equality case of Wilf's bound, which
  rests on Brooks' theorem, is not stated here. This roadmap does not depend on that one.
- LinearAlgebraMethodInCombinatorics (an open roadmap, not on main) proves the Graham–Pollak
  theorem in its 4.2 by a rank argument; Cvetković's bound in 3.1 above is a different
  statement, about independent sets. This roadmap does not depend on that one.
- MarkovChainMixing (an open roadmap, not on main) treats the spectral gap and Cheeger's
  inequality of reversible Markov chains in its Layers 2 and 3, and KernelsAndSpectralMethods (an
  open roadmap of another author, not on main) treats weighted and normalized graph Laplacians,
  their spectral gap and the Cheeger inequality for graphs. No Laplacian eigenvalue bound, no
  Cheeger inequality and no Markov chain is stated here, and this roadmap depends on neither.
- SpectralQuantumWalks (an open roadmap of another author, not on main) treats continuous-time
  quantum walks on graphs: the unitary evolution of a Hermitian matrix, spectral projectors,
  state transfer and mixing. It states none of the eigenvalue bounds above, and this roadmap does
  not depend on it.

Outside the scope: eigenvalues of the Laplacian, normalized Laplacian and signless Laplacian, the
Cheeger inequality and vertex expansion; Hoffman's other inequalities between eigenvalues and the
chromatic number (Brouwer–Haemers, Proposition 3.6.3 (ii) and (iii)); the ratio bound for graphs
that are not regular and for weighted adjacency matrices; the Lovász theta function and the
Shannon capacity; the equality cases of Wilf's bound and of the upper bound `λ₁ ≤ Δ`; strongly
regular and distance-regular graphs; Serre's theorem on the number of large eigenvalues,
Friedman's theorem on random regular graphs and constructions of Ramanujan graphs; the
sensitivity theorem; and every procedure for computing eigenvalues.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`: `SimpleGraph.adjMatrix` (entry `1` at
  adjacent pairs and `0` elsewhere); `SimpleGraph.trace_adjMatrix` (trace `0`);
  `SimpleGraph.adjMatrix_mul_self_apply_self` (`(A * A) i i = degree i`);
  `SimpleGraph.adjMatrix_mulVec_const_apply` (`(A *ᵥ const a) v = degree v * a`);
  `SimpleGraph.dotProduct_mulVec_adjMatrix` (`x ⬝ᵥ A *ᵥ y` is the sum of `x i * y j` over
  adjacent pairs); `SimpleGraph.Embedding.submatrix_adjMatrix` (for an embedding `f : G ↪g H`,
  `(H.adjMatrix α).submatrix f f = G.adjMatrix α`).
- `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`: `SimpleGraph.isHermitian_adjMatrix`;
  `SimpleGraph.lapMatrix` (`degMatrix − adjMatrix`); `SimpleGraph.IsRegularOfDegree.degMatrix_eq`
  (for a `d`-regular graph the degree matrix is the scalar matrix `d`);
  `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` (the number of components
  equals the dimension of the kernel of the real Laplacian).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues₀` (for
  `[DecidableEq n]`, the eigenvalues of a Hermitian matrix as a function on
  `Fin (Fintype.card n)`, defined as the sorted eigenvalues of `Matrix.toEuclideanLin A`);
  `Matrix.IsHermitian.eigenvalues₀_antitone`; `Matrix.IsHermitian.trace_eq_sum_eigenvalues`;
  `Matrix.IsHermitian.eigenvalues_mem_spectrum_real`; `Matrix.IsHermitian.eigenvectorBasis` and
  `Matrix.IsHermitian.mulVec_eigenvectorBasis` (an orthonormal eigenbasis).
  `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `Orthonormal.exists_orthonormalBasis_extension`
  (an orthonormal family extends to an orthonormal basis).
  `Mathlib/Analysis/InnerProductSpace/Spectrum.lean`:
  `LinearMap.IsSymmetric.card_filter_eigenvalues_eq` (the number of indices at which the sorted
  eigenvalue list of a symmetric operator equals `μ` is the dimension of the eigenspace of `μ`).
- `Mathlib/LinearAlgebra/Matrix/Gershgorin.lean`: `eigenvalue_mem_ball` (every eigenvalue lies in
  a closed disc centred at a diagonal entry `A k k` of radius `∑_(j ≠ k) ‖A k j‖`).
- `Mathlib/Combinatorics/SimpleGraph/Finite.lean` and `DegreeSum.lean`: `SimpleGraph.degree`,
  `SimpleGraph.maxDegree`, `SimpleGraph.degree_le_maxDegree`, `SimpleGraph.IsRegularOfDegree`,
  `SimpleGraph.edgeFinset`, `SimpleGraph.sum_degrees_eq_twice_card_edges`.
- `Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean`: `SimpleGraph.Colorable`,
  `SimpleGraph.Coloring`. `Mathlib/Combinatorics/SimpleGraph/Clique.lean`:
  `SimpleGraph.IsIndepSet`, `SimpleGraph.indepNum` (the supremum in `ℕ` of the sizes of
  independent sets), `SimpleGraph.IsIndepSet.card_le_indepNum`.
- `Mathlib/Combinatorics/SimpleGraph/Density.lean`: `SimpleGraph.interedges` (the pairs in
  `s ×ˢ t` that are adjacent). `Mathlib/Combinatorics/SimpleGraph/Diam.lean`: `SimpleGraph.diam`
  (the diameter as a natural number, `0` for a graph that is not connected).
  `Mathlib/Combinatorics/SimpleGraph/Metric.lean`: `SimpleGraph.dist`.
  `Mathlib/Combinatorics/SimpleGraph/Maps.lean`: `SimpleGraph.induce`,
  `SimpleGraph.Embedding.induce`. `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`:
  `SimpleGraph.Connected`.

### From Tau Ceti

- `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`:
  `LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq` (for a symmetric operator
  on a space of dimension `n`, `re ⟪T x, x⟫` is the sum of the sorted eigenvalues times the squared
  coordinates of `x` in the eigenbasis);
  `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` (the `k`-th largest eigenvalue is the
  supremum over subspaces of dimension `k + 1` of the infimum of `re ⟪T x, x⟫` over their unit
  vectors); `LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis` (an antitone list of eigenvalues
  of an orthonormal eigenbasis is the sorted eigenvalue list).

### From TauCetiRoadmap.RandomMatrices

- Section 1.2 (on main): Cauchy interlacing for `Matrix.IsHermitian.eigenvalues₀`. Used in the
  form: if `A` is Hermitian of size `n` and `B = A.submatrix e e` for an embedding `e` of a type
  with `m` elements, then `λᵢ(A) ≥ λᵢ(B) ≥ λ_(n−m+i)(A)` for `1 ≤ i ≤ m`. That section states it
  as a target, transferring Tau Ceti's Courant–Fischer theorem to `eigenvalues₀` under
  `Matrix.toEuclideanLin`.

## References

- Andries E. Brouwer and Willem H. Haemers, *Spectra of Graphs*, monograph version of
  1 February 2011, posted by the first author (`win.tue.nl/~aeb/2WF02/spectra.pdf`); published by
  Springer, Universitext, 2012. Locators are to the numbered results and the printed page numbers
  of that file: Propositions 1.3.1, 1.3.2 and 1.3.8; Theorem 2.5.1; Propositions 3.1.1, 3.1.2
  and 3.2.1; Theorems 3.5.1 and 3.5.2; Proposition 3.6.1, Theorem 3.6.2 and Proposition 3.6.3;
  Proposition 4.1.1; Proposition 4.3.2.
- Gregory T. Quenell, Eigenvalue comparisons in graph theory, *Pacific Journal of Mathematics*
  176 (1996), no. 2, 443–461 (open on `msp.org`): Lemmas 4.1–4.3, Theorems 5.2, 6.1 and 6.2.
- The papers of Wilf (1967), Hoffman (1970), Cvetković (1971), Alon (1986) and Alon and Chung
  (1988) are named as Brouwer–Haemers attribute the results; no locator into them is given.

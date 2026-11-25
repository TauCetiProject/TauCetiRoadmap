# Roadmap: Laplacian eigenvalues of graphs

**Summary.** The Laplacian `L = D − A` of a finite simple graph on `n` vertices, degree matrix
minus adjacency matrix, is positive semidefinite. This roadmap lists its eigenvalues with
multiplicity in decreasing order, `ν₁ ≥ ν₂ ≥ ⋯ ≥ νₙ = 0`, and proves the classical theorems that tie
them to the structure of the graph. The second smallest one, `νₙ₋₁`, is the algebraic
connectivity `a(G)`. No connectedness is assumed unless it is stated.

The headline theorems are these.

- *Complements and edges.* The Laplacian eigenvalues of the complement are `0` and the numbers
  `n − νᵢ` for `i < n`. Adding `r` edges lowers no eigenvalue and raises none above the eigenvalue
  of the original graph `r` places before it.
- *Algebraic connectivity (Fiedler).* For edge-disjoint graphs on one vertex set,
  `a(G ∪ H) ≥ a(G) + a(H)`; and if deleting a set `S` of vertices disconnects the graph, then
  `a(G) ≤ |S|`.
- *The largest eigenvalue.* For a graph with at least one edge and maximum degree `Δ`,
  `Δ + 1 ≤ ν₁` (Grone and Merris), and `ν₁ ≤ d(x) + d(y)` for some edge `xy` (Anderson and
  Morley).
- *Degrees.* For every set `Z` of `m` vertices, `h + Σ_{z ∈ Z} d(z) ≤ ν₁ + ⋯ + νₘ`, where `h`
  counts the components of the subgraph induced on `Z` that have an edge leaving `Z`; for a
  connected graph and `1 ≤ m ≤ n − 1` this is Grone's bound by the `m` largest degrees plus one.
  The Grone–Merris inequality, proved by Bai, bounds the same sums from above by the conjugate
  degree sequence: `ν₁ + ⋯ + νₜ ≤ Σ_{j ≤ t} #{x : d(x) ≥ j}` for every `t`.
- *Nodal domains.* If `Lψ = θψ` with `θ > 0` and `t ≤ 0`, the subgraph induced on
  `{ψ ≥ t}` has at most as many components as there are eigenvalues below `θ` (Fiedler); the
  positive and negative parts of any eigenvector together have at most as many components as
  there are eigenvalues at most `θ`; and on a connected graph `ψ` has at most one more weak nodal
  domain than there are eigenvalues below `θ` (Davies, Leydold and Stadler).
- *Effective resistance.* On a connected graph the sum of the effective resistances over ordered
  pairs of vertices is `2n Σ 1/νᵢ`, over the nonzero eigenvalues (the Kirchhoff index formula).
- *The dual Cheeger inequality.* With `σ(G)` the least value of `xᵀ(D + A)x / xᵀDx` and `β(G)` the
  bipartiteness ratio of Trevisan, `σ/2 ≤ β ≤ √(2σ)`.

The roadmap builds on Mathlib's graph Laplacian and on Tau Ceti's min-max theory of eigenvalues.
Effective resistance is that of the roadmap ElectricalNetworksAndRandomWalks.

Layer 1 defines the sorted eigenvalues and counts the zero ones, and Layer 2 treats complements
and added edges. Layers 3 to 8 take up the remaining themes in the order listed, except the
Grone–Merris inequality, which is Layer 9.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V` with `[Fintype V]`, `[DecidableEq V]` and
  `[DecidableRel G.Adj]`; `n = Fintype.card V`. Degrees are `SimpleGraph.degree`, the maximum
  degree is `SimpleGraph.maxDegree`, the complement is `Gᶜ`, the union of two graphs on `V` is
  `G ⊔ H`, edge-disjointness is `Disjoint G H`, and the subgraph induced on a set `S` is
  `G.induce S`, a graph on the subtype of `S`. The empty vertex type is allowed throughout.
- **Laplacian and eigenvalues.** The Laplacian is `G.lapMatrix ℝ`. Its eigenvalues are Mathlib's
  `Matrix.IsHermitian.eigenvalues₀`, a function on `Fin n` that is antitone. In the prose they are
  `ν₁ ≥ ⋯ ≥ νₙ`, numbered from 1; in Lean the index `i : Fin n` carries `ν_(i+1)`, so index `0`
  is the largest and index `n − 1` the smallest, which is `0`. Every theorem below is stated in
  this one decreasing convention. Brouwer–Haemers write `μ₁ ≤ ⋯ ≤ μₙ` in increasing order in
  Chapter 1 and in §3.9, and `ν₁ ≥ ⋯ ≥ νₙ` in §3.10 and §3.11, so that `μ_k = ν_(n+1−k)`; their
  `μ₂` is `νₙ₋₁`, at Lean index `n − 2`, and their `μₙ` is `ν₁`, at Lean index `0`.
- **Algebraic connectivity.** `algebraicConnectivity G` is the eigenvalue at index `n − 2` when
  `n ≥ 2`, and `0` when `n ≤ 1`.
- **Counting components.** Numbers of connected components of induced subgraphs are `Nat.card`
  of `SimpleGraph.ConnectedComponent`; an empty vertex set has none. Mathlib's
  `SimpleGraph.Connected` requires a nonempty vertex type, so the graph on the empty set is not
  connected.
- **Infima.** The two quantities of Layer 8 are infima in `ℝ` over sets that are empty exactly when
  the graph has no edge; then both are `0`.

## Layer 1: the Laplacian spectrum

### 1.1 Sorted Laplacian eigenvalues

Define `lapEigenvalues G : Fin n → ℝ` as `Matrix.IsHermitian.eigenvalues₀` of `G.lapMatrix ℝ`,
which is Hermitian by `SimpleGraph.isHermitian_lapMatrix`; on a nonempty vertex type define
`largestLapEigenvalue G` as its value at index `0`; and define `algebraicConnectivity G` as above.
The device is the one SpectralGraphBounds 1.1 applies to `G.adjMatrix ℝ`, here applied to the
Laplacian. The eigenvalues are nonnegative by Mathlib's `SimpleGraph.posSemidef_lapMatrix` and
Tau Ceti's `Matrix.PosSemidef.eigenvalues₀_nonneg`, and the one at index `n − 1` is `0` because
the all-ones vector is in the kernel (`SimpleGraph.lapMatrix_mulVec_one_eq_zero`).

**Checks.**
- `Kₙ`, `n ≥ 2`, has eigenvalues `n` with multiplicity `n − 1` and `0` once (Brouwer–Haemers
  §1.4.1), so `a(Kₙ) = n`. On one vertex the only eigenvalue is `0` and `a = 0` by convention.
- The path on three vertices has eigenvalues `3, 1, 0`, so `a = 1`; the star `K_(1,4)` has
  `5, 1, 1, 1, 0`. The value at index `0` is the largest: an increasing listing would put `0`
  there.
- The 5-cycle has eigenvalues `(5 + √5)/2` twice, `(5 − √5)/2` twice and `0`.
- The graph without edges has all eigenvalues `0`. The edge `K₂` together with an isolated vertex
  has eigenvalues `2, 0, 0` and `a = 0`; by 1.2, for `n ≥ 2`, `a = 0` exactly when the graph is
  not connected.

*Needs:* Mathlib `SimpleGraph.lapMatrix`, `SimpleGraph.isHermitian_lapMatrix`,
`SimpleGraph.posSemidef_lapMatrix`, `SimpleGraph.lapMatrix_mulVec_one_eq_zero`,
`Matrix.IsHermitian.eigenvalues₀`, `Matrix.IsHermitian.eigenvalues₀_antitone`; Tau Ceti
`Matrix.PosSemidef.eigenvalues₀_nonneg`.

### 1.2 The zero eigenvalue

Prove `card_lapEigenvalues_eq_zero`: the number of indices `i` with `νᵢ = 0` equals the number of
connected components of `G` (Brouwer–Haemers, Proposition 1.3.7). In particular, for `n ≥ 2`,
`a(G) > 0` exactly when `G` is connected.

Route: by Tau Ceti's `Matrix.IsHermitian.rank_eq_card_non_zero_eigenvalues₀` the number of
nonzero sorted eigenvalues is the rank of `L`, so the number of zero ones is `n − rank L`, the
dimension of the kernel of `Matrix.toLin' L` (rank–nullity). Mathlib's
`SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` identifies that dimension
with the number of components.

**Checks.**
- `K₂` with an isolated vertex: eigenvalues `2, 0, 0` and two components.
- The graph without edges on `n` vertices: `n` zero eigenvalues and `n` components.
- On the empty vertex type both counts are `0`.

*Needs:* 1.1; Mathlib `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`,
`LinearMap.finrank_range_add_finrank_ker`, `Matrix.rank`; Tau Ceti
`Matrix.IsHermitian.rank_eq_card_non_zero_eigenvalues₀`. (Proved here.)

### Examples

Complete graphs, the path on three vertices, the star `K_(1,4)`, the 5-cycle, the graph without
edges, and `K₂` with an isolated vertex, with the spectra given in the Checks.

### Dependencies

Mathlib `SimpleGraph.lapMatrix`, `SimpleGraph.isHermitian_lapMatrix`,
`SimpleGraph.posSemidef_lapMatrix`, `SimpleGraph.lapMatrix_mulVec_one_eq_zero`,
`SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`,
`Matrix.IsHermitian.eigenvalues₀`, `Matrix.IsHermitian.eigenvalues₀_antitone`,
`LinearMap.finrank_range_add_finrank_ker`, `Matrix.rank`; Tau Ceti
`Matrix.PosSemidef.eigenvalues₀_nonneg`, `Matrix.IsHermitian.rank_eq_card_non_zero_eigenvalues₀`.
No other layer.

## Layer 2: complements and added edges

### 2.1 The complement

Prove `lapEigenvalues_compl`: if `i + j + 2 = n`, the eigenvalue of `Gᶜ` at index `i` is `n`
minus the eigenvalue of `G` at index `j`. In the prose numbering, the eigenvalues of `Gᶜ` are
`n − νₙ₋₁ ≥ ⋯ ≥ n − ν₁ ≥ 0`. (Brouwer–Haemers, §1.3.2, p. 14, an unnumbered statement with its
argument.) The remaining eigenvalue of `Gᶜ`, at index `n − 1`, is `0` by 1.1. Consequently
`ν₁ ≤ n` for every graph, with equality exactly when `Gᶜ` is disconnected (Brouwer–Haemers, §3.9,
p. 57), by 1.2 applied to `Gᶜ`.

Route: the degree and adjacency matrices are additive over the edge-disjoint union `G ⊔ Gᶜ = ⊤`,
and Mathlib's `SimpleGraph.lapMatrix_top` gives `L(⊤) = n·I − J`, so `L(Gᶜ) = n·I − J − L(G)`.
The orthogonal complement of the all-ones vector is invariant under `L(G)`; an orthonormal
eigenbasis of `L(G)` on it, together with `𝟙/√n`, is an orthonormal eigenbasis of both matrices,
with eigenvalues `νᵢ ↦ n − νᵢ` on the first part and `0` on `𝟙/√n`. Each `n − νᵢ` is an
eigenvalue of the positive semidefinite `L(Gᶜ)`, hence nonnegative, so the list
`n − νₙ₋₁, …, n − ν₁, 0` is antitone. Applying to it Tau Ceti's
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis` gives the statement. For `n ≤ 1` there are
no indices with `i + j + 2 = n`.

**Checks.**
- The path `0 − 1 − 2` has eigenvalues `3, 1, 0`; its complement, the edge `{0, 2}` with the
  isolated vertex `1`, has `2, 0, 0`, and indeed `2 = 3 − 1` (`i = 0`, `j = 1`) and
  `0 = 3 − 3` (`i = 1`, `j = 0`).
- The star `K_(1,4)` has `ν₁ = 5 = n`, and its complement `K₄` plus an isolated vertex is
  disconnected; the 5-cycle has `ν₁ = (5 + √5)/2 < 5` and is self-complementary.
- The index condition cannot be `i + j + 1 = n`: for `K₂`, whose eigenvalues are `2, 0`, that
  would give the eigenvalue `0` of the complement at index `0` as `2 − 0`.

*Needs:* 1.1, 1.2; Mathlib `SimpleGraph.lapMatrix_top`,
`SimpleGraph.lapMatrix_mulVec_one_eq_zero`, `SimpleGraph.posSemidef_lapMatrix`,
`Matrix.IsHermitian.eigenvectorBasis`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`. (Proved here, following the cited
argument.)

### 2.2 Adding edges

For graphs `G ≤ H` on `V`:

- `lapEigenvalues_le_of_le`: every eigenvalue of `G` is at most the eigenvalue of `H` at the same
  index.
- `lapEigenvalues_le_of_le_of_add_le`: if `r` is the number of edges of `H` not in `G` and
  `i + r ≤ k`, then the eigenvalue of `H` at index `k` is at most the eigenvalue of `G` at
  index `i`.

For one added edge these are the interlacing `ν_(i+1)(H) ≤ νᵢ(G) ≤ νᵢ(H)` of Brouwer–Haemers,
Proposition 3.2.1 (ii) and its proof (p. 45), which removes a column of the incidence matrix; the
form with `r` edges is proved here by the matrix route below (Brouwer–Haemers, Theorem 2.8.1,
p. 36, for the Courant–Weyl inequalities it uses).

Route: `G ⊔ (H \ G) = H` with `G` and `H \ G` edge-disjoint, so `L(H) = L(G) + L(H \ G)`, and
`L(H \ G)` is positive semidefinite, so the quadratic form of `L(G)` is at most that of `L(H)`
and Tau Ceti's Loewner monotonicity of sorted eigenvalues,
`LinearMap.IsSymmetric.eigenvalue_mono`, gives the first statement (equivalently, the lower Weyl
inequality `Matrix.IsHermitian.le_eigenvalues₀_add` with the smallest eigenvalue of `L(H \ G)`,
which is nonnegative). `L(H \ G)` is the sum of the `r` rank-one Laplacians of
its edges, so its rank is at most `r` (Tau Ceti's `Matrix.rank_add_le`), and its rank interlacing
`Matrix.IsHermitian.eigenvalues₀_le_of_rank_sub_le` gives the second.

**Checks.**
- Adding the edge `{0, 2}` to the path `0 − 1 − 2` gives the triangle: the eigenvalues go from
  `3, 1, 0` to `3, 3, 0`, and `ν₂(K₃) = 3 ≤ ν₁(P₃) = 3`, `ν₂(P₃) = 1 ≤ 3`.
- The count `r` cannot be lowered: from the graph without edges on three vertices (eigenvalues
  `0, 0, 0`) two added edges give the path, and with `i = 0`, `k = 1` the second statement would
  claim `1 ≤ 0`; with `r = 2` it only compares index `2` of the path with index `0`, `0 ≤ 0`.
- An exhaustive computation confirms both statements: every graph on at most five vertices with
  every subgraph, and every graph on six vertices with every subgraph lacking at most three of
  its edges.

*Needs:* 1.1; Mathlib `SimpleGraph.posSemidef_lapMatrix`, `SimpleGraph.edgeFinset`,
`Matrix.rank`; Tau Ceti `LinearMap.IsSymmetric.eigenvalue_mono`, `Matrix.rank_add_le`,
`Matrix.IsHermitian.le_eigenvalues₀_add`,
`Matrix.IsHermitian.eigenvalues₀_le_of_rank_sub_le`, `Matrix.PosSemidef.eigenvalues₀_nonneg`.
(Proved here.)

### Examples

The path on three vertices and its complement, the triangle, the star `K_(1,4)`, the 5-cycle and
`K₂`, with the spectra in the Checks.

### Dependencies

1.1, 1.2; Mathlib `SimpleGraph.lapMatrix_top`,
`SimpleGraph.lapMatrix_mulVec_one_eq_zero`, `Matrix.IsHermitian.eigenvectorBasis`,
`SimpleGraph.posSemidef_lapMatrix`, `SimpleGraph.edgeFinset`, `Matrix.rank`; Tau Ceti
`Matrix.rank_add_le`, `LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`,
`LinearMap.IsSymmetric.eigenvalue_mono`, `Matrix.IsHermitian.le_eigenvalues₀_add`,
`Matrix.IsHermitian.eigenvalues₀_le_of_rank_sub_le`, `Matrix.PosSemidef.eigenvalues₀_nonneg`.

## Layer 3: algebraic connectivity

The common tool is the variational form of `a(G)` for `n ≥ 2`: it is the least value of
`xᵀLx` over unit vectors `x` orthogonal to the all-ones vector `𝟙`. This follows from Tau Ceti's
Courant–Fischer theorem `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`, because `𝟙` is
an eigenvector for the smallest eigenvalue `0` and its orthogonal complement is invariant; it is
a step of the routes below, not a target.

### 3.1 Superadditivity

Prove `algebraicConnectivity_add_le_sup`: if `G` and `H` are edge-disjoint graphs on `V`, then
`a(G) + a(H) ≤ a(G ⊔ H)` (Fiedler; Brouwer–Haemers, Proposition 1.7.1, p. 22).

Route: edge-disjointness gives `L(G ⊔ H) = L(G) + L(H)`; for a unit `x ⊥ 𝟙`,
`xᵀL(G ⊔ H)x = xᵀL(G)x + xᵀL(H)x ≥ a(G) + a(H)`, and the variational form concludes. For
`n ≤ 1` all three values are `0`.

**Checks.**
- `K₄` is the union of the 4-cycle (`a = 2`) and its two diagonals (`a = 0`): `4 ≥ 2 + 0`.
- Edge-disjointness is needed: for `G = H = K₂`, `G ⊔ H = K₂` and `a(G) + a(H) = 4 > 2`.
- An exhaustive computation over all graphs with at most six vertices and all splittings of
  their edge sets into two parts confirms the statement.

*Needs:* 1.1; Mathlib `SimpleGraph.lapMatrix`, `SimpleGraph.lapMatrix_mulVec_one_eq_zero`; Tau
Ceti `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`. (Proved here, following the
cited route.)

### 3.2 Vertex cuts

Prove `algebraicConnectivity_le_card`: if `D` is a set of vertices such that the subgraph induced
on its complement is not connected, then `a(G) ≤ |D|` (Fiedler; Brouwer–Haemers, Proposition
1.7.2, p. 22). Brouwer–Haemers assume that the induced subgraph is disconnected; the statement
here also admits an empty complement, which Mathlib counts as not connected.

Route (Brouwer–Haemers): if the complement of `D` is empty, then `a(G) ≤ ν₁ ≤ n = |D|` by 2.1
(for `n ≥ 2`; otherwise `a = 0`). Otherwise it has two components `C₁`, `C₂` at least. Adding all
edges between `D` and its complement gives `H ≥ G` with `a(G) ≤ a(H)` by 2.2. The vector equal to
`|C₂|` on `C₁`, to `−|C₁|` on `C₂` and to `0` elsewhere is orthogonal to `𝟙` and satisfies
`L(H)u = |D| u`, so the variational form gives `a(H) ≤ |D|`.

**Checks.**
- The path `0 − 1 − 2` with `D = {1}`: `a = 1 = |D|`. The star `K_(1,4)` with `D` its centre:
  `a = 1 = |D|`.
- The hypothesis is needed: `Kₙ` with `D = ∅` has `a = n > 0`. For `Kₙ` the only admissible `D`
  is the whole vertex set, and `a = n = |D|`.
- An exhaustive computation over all graphs with at most seven vertices and all vertex sets `D`
  confirms the statement.

*Needs:* 1.1, 2.1, 2.2; Mathlib `SimpleGraph.induce`, `SimpleGraph.Connected`,
`SimpleGraph.ConnectedComponent`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`. (Proved here, following the cited
route.)

### Examples

`K₄`, the 4-cycle, `K₂`, the path on three vertices, the star `K_(1,4)` and complete graphs, with
the values in the Checks.

### Dependencies

1.1, 2.1, 2.2; Mathlib `SimpleGraph.lapMatrix`, `SimpleGraph.lapMatrix_mulVec_one_eq_zero`,
`SimpleGraph.induce`, `SimpleGraph.Connected`, `SimpleGraph.ConnectedComponent`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`.

## Layer 4: the largest eigenvalue

### 4.1 The Anderson–Morley bound

Prove `exists_adj_largestLapEigenvalue_le`: a graph with at least one edge has an edge `xy` with
`ν₁ ≤ d(x) + d(y)` (Anderson and Morley; Brouwer–Haemers, Corollary 3.9.2, p. 58). Equivalently
`ν₁` is at most the maximum of `d(x) + d(y)` over the edges.

Route (proved here, by a route different from the one of Brouwer–Haemers, which passes through
the line graph and Perron–Frobenius theory): let `x` be a unit eigenvector for `ν₁` and `|x|` its
entrywise absolute value. Then
`ν₁ = Σ_{uv ∈ E} (x_u − x_v)² ≤ Σ_{uv ∈ E} (|x_u| + |x_v|)² = |x|ᵀ Q |x|`, where `Q = D + A`,
so `ν₁` is at most the largest eigenvalue of `Q`. Mathlib's `SimpleGraph.incMatrix_mul_transpose`
writes `Q = M Mᵀ` with `M` the unsigned incidence matrix (rows the vertices, columns `Sym2 V`), and
`M Mᵀ` and `Mᵀ M` have the same nonzero eigenvalues (`Matrix.charpoly_mul_comm'`). The row of
`Mᵀ M` at an edge `e = xy` has diagonal entry `2` and off-diagonal entries `1` at the
`d(x) + d(y) − 2` other edges meeting `e`; the row at a non-edge is `0`. By Gershgorin's theorem
(`eigenvalue_mem_ball`) a positive eigenvalue of `Mᵀ M` lies in the disc about `2` of radius
`d(x) + d(y) − 2` for some edge `xy`, so it is at most `d(x) + d(y)`. The largest eigenvalue of
`Q` is positive when there is an edge.

**Checks.**
- The star `K_(1,4)`: `ν₁ = 5` and every edge has `d(x) + d(y) = 5`, so equality holds. The
  5-cycle: `ν₁ = (5 + √5)/2 ≈ 3.62 < 4`.
- The hypothesis is needed: a graph without edges has no edge to choose, so the statement is false
  there although `ν₁ = 0`.

*Needs:* 1.1; Mathlib `SimpleGraph.incMatrix`, `SimpleGraph.incMatrix_mul_transpose`,
`SimpleGraph.incMatrix_transpose_mul_diag`, `SimpleGraph.lapMatrix_toLinearMap₂'`,
`Matrix.charpoly_mul_comm'`, `eigenvalue_mem_ball`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`. (Proved here.)

### 4.2 The lower bound by the maximum degree

Prove `maxDegree_add_one_le`: a graph with at least one edge has `Δ + 1 ≤ ν₁` (Grone and Merris;
Brouwer–Haemers, Proposition 3.9.3, p. 58).

Route (Brouwer–Haemers compare `G` with its subgraph `K_(1,Δ)`; this is the same comparison
on quadratic forms): let `c` have degree `Δ` and let `x` be `Δ` at `c`, `−1` at each neighbour
of `c` and `0` elsewhere. For the star `S` formed by the edges at `c`, `L(S)x = (Δ + 1)x`, and
`xᵀL(G)x ≥ xᵀL(S)x = (Δ + 1)‖x‖²` because `L(G) − L(S)` is the Laplacian of the remaining edges,
which is positive semidefinite. The variational form of the largest eigenvalue then gives
`ν₁ ≥ Δ + 1`.

**Checks.**
- The star `K_(1,4)`: `ν₁ = 5 = Δ + 1`. The 5-cycle: `(5 + √5)/2 ≥ 3`. The path on four
  vertices: `ν₁ = 2 + √2 ≥ 3`.
- The hypothesis is needed: on one vertex `ν₁ = 0 < 1 = Δ + 1`.

*Needs:* 1.1; Mathlib `SimpleGraph.maxDegree`, `SimpleGraph.exists_maximal_degree_vertex`,
`SimpleGraph.posSemidef_lapMatrix`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`. (Proved here, following the cited
route.)

### Examples

The star `K_(1,4)`, the 5-cycle, the path on four vertices and the one-vertex graph, with the
values in the Checks.

### Dependencies

1.1; Mathlib `SimpleGraph.incMatrix`, `SimpleGraph.incMatrix_mul_transpose`,
`SimpleGraph.incMatrix_transpose_mul_diag`, `SimpleGraph.lapMatrix_toLinearMap₂'`,
`Matrix.charpoly_mul_comm'`, `eigenvalue_mem_ball`, `SimpleGraph.maxDegree`,
`SimpleGraph.exists_maximal_degree_vertex`, `SimpleGraph.posSemidef_lapMatrix`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`.

## Layer 5: degrees

### 5.1 Grone's degree bound

Prove `card_add_sum_degree_le`: for every set `Z` of vertices, with `m = |Z|`,
`h + Σ_{z ∈ Z} d(z) ≤ ν₁ + ⋯ + νₘ`, where `h` is the number of components of `G.induce Z` that
contain a vertex adjacent to a vertex outside `Z`. Those are exactly the components of the induced
subgraph that are not components of `G`. This is the stronger statement proved in the second
proof of Brouwer–Haemers, Proposition 3.10.1 (pp. 58–59); for connected `G` and
`1 ≤ m ≤ n − 1`, taking for `Z` the `m` vertices of largest degree gives `h ≥ 1` and Grone's
bound `1 + d₁ + ⋯ + dₘ ≤ ν₁ + ⋯ + νₘ`, the statement of that proposition. With `h` dropped this
is Schur's inequality for the diagonal of `L` (Brouwer–Haemers, Theorem 2.6.1, p. 35).

Route (the second proof of Brouwer–Haemers; their first proof, by interlacing for a quotient
matrix, is not used). The spectrum of a disjoint union is the union of the spectra, and the sum
of the `m` largest eigenvalues of the union is at least the sum over the components `C` of the
`|Z ∩ C|` largest eigenvalues of `C`; a component `C` contained in `Z` contributes
`Σ_{z ∈ C} d(z) = tr L(C)`, and a component disjoint from `Z` contributes `0`. So it suffices to
treat a connected `G` with `Z` and its complement nonempty, where every component of
`G.induce Z` counts in `h` (a path from it to a vertex outside `Z` leaves it along an edge to a
vertex outside `Z`). The reduction is needed: the principal submatrix of `L` on `Z` is
positive definite exactly when no component of `G` lies inside `Z`. Write
`L = [[B, −C], [−Cᵀ, E]]` in the blocks of `Z` and its complement. Then `B = L_Z + D_Z`, with
`L_Z` the Laplacian of `G.induce Z` and `D_Z` the diagonal matrix of the numbers of neighbours
outside `Z`, is nonsingular (Brouwer–Haemers, Lemma 2.10.1 (iii): no component of `G.induce Z`
has all its row sums zero), hence positive definite as a principal submatrix of `L`, and its
inverse is entrywise nonnegative (a Neumann series). Factor `L = M Mᵀ` with
`M = [[P, 0], [Q, R]]` square, `P Pᵀ = B`, `P Qᵀ = −C` and `R Rᵀ = E − Cᵀ B⁻¹ C`, which is
positive semidefinite as a Schur complement. The eigenvalues of `M Mᵀ` and `Mᵀ M` agree
(`Matrix.charpoly_mul_comm`), and the leading `m × m` block of `Mᵀ M` is `Pᵀ P + Qᵀ Q`, whose
trace is `Σ_{z ∈ Z} d(z) + tr(B⁻¹ C Cᵀ)`. The Ky Fan trace inequality (Tau Ceti
`LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` on the first `m` standard
basis vectors) bounds this trace by `ν₁ + ⋯ + νₘ`. Finally
`C Cᵀ ≥ D_Z` entrywise and `B⁻¹ ≥ 0`, so `tr(B⁻¹ C Cᵀ) ≥ tr(B⁻¹ D_Z)`; every vector `u` in the
kernel of `L_Z` satisfies `B⁻¹ D_Z u = u`, so `B⁻¹ D_Z` has the eigenvalue `1` with multiplicity at
least `h` (the indicator vectors of the components of `G.induce Z`). It has the same
characteristic polynomial as the positive semidefinite `D_Z^(1/2) B⁻¹ D_Z^(1/2)`
(`Matrix.charpoly_mul_comm` with the factors `B⁻¹ D_Z^(1/2)` and `D_Z^(1/2)`), so all its
eigenvalues are real and nonnegative; it need not be similar to that matrix, since `D_Z` is
singular when a vertex of `Z` has no neighbour outside `Z`. Its trace, the sum of its
eigenvalues with algebraic multiplicity, is therefore at least `h`.

**Checks.**
- The path `0 − 1 − 2` (eigenvalues `3, 1, 0`): `Z = {1}` gives `h = 1` and `1 + 2 = 3 ≤ 3`,
  equality; `Z = {0}` gives `1 + 1 = 2 ≤ 3`; `Z` the whole set gives `h = 0` and `4 = 4`.
- `h` cannot be the number of all components of `G.induce Z`: for a connected graph with an edge
  and `Z` the whole vertex set that would claim `1 + 2|E| ≤ 2|E|`.
- `K₂` with an isolated vertex `v`, `Z = {v}`: `h = 0`, and `0 ≤ 2`.
- An exhaustive computation over all graphs with at most seven vertices and all sets `Z`
  confirms the statement.

*Needs:* 1.1; Mathlib `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`,
`Matrix.charpoly_mul_comm`, `Matrix.PosDef`, `Matrix.PosSemidef`; Tau Ceti
`LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`. (Proved here, following the
cited route.)

### Examples

The path on three vertices and `K₂` with an isolated vertex, with the values in the Checks.

### Dependencies

1.1; Mathlib `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`, `Matrix.charpoly_mul_comm`,
`Matrix.PosDef`, `Matrix.PosSemidef`; Tau Ceti
`LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`.

## Layer 6: nodal domains

Throughout, `ψ : V → ℝ` satisfies `Lψ = θψ` (`G.lapMatrix ℝ *ᵥ ψ = θ • ψ`) for a real `θ`. The
vector `ψ = 0` is allowed; every statement below holds for it.

### 6.1 Fiedler's nodal domain theorem

Prove `card_connectedComponent_induce_le`: if `θ > 0` and `t ≤ 0`, then the subgraph induced on
`{v | t ≤ ψ v}` has at most as many components as there are indices `i` with `νᵢ < θ`. If `θ` is
the eigenvalue `μ_k` with `k ≥ 2` in the increasing numbering, that count is at most `k − 1`,
which is the theorem as Spielman states it for connected weighted graphs and `t ≤ 0` (Spielman,
*Spectral and Algebraic Graph Theory*, Theorem 24.5.1, p. 202, attributed to Fiedler). Spielman's
proof treats `t = 0` and says the general case needs more work. The statement here is wider than
the source: it covers `t < 0`, graphs that are not connected, and repeated eigenvalues, with the
count of eigenvalues below `θ` in place of `k − 1`; the route below proves it in that
generality.

Route (proved here; it follows Spielman's block argument and replaces its use of
Perron–Frobenius theory by a strict inequality). Let `W = {ψ ≥ t}` have components
`W₁, …, W_c`, let `Bⱼ` be the principal submatrix of `L` on `Wⱼ`, and let `y` be `ψ` outside `W`,
so `y < t` there. There are no edges between distinct `Wⱼ`.
1. If `Wⱼ` has no edge leaving `W`, it is a component of `G` and `Bⱼ` is its Laplacian, with the
   eigenvalue `0 < θ` (eigenvector `𝟙`).
2. Otherwise let `z = ψ − t ≥ 0` on `Wⱼ`. Since `L𝟙 = 0`, the rows of `Lψ = θψ` at `Wⱼ` give
   `(Bⱼ z)_u = θ ψ_u + Σ (ψ_w − t)`, the sum over the neighbours `w ∉ W` of `u`, each term
   negative. As `θt ≤ 0`, `(Bⱼ z)_u ≤ θ z_u` for every `u ∈ Wⱼ`, strictly at a vertex `u` with a
   neighbour outside `W`. Hence `z ≠ 0` (at that `u` the right side is negative when `z = 0`),
   and `zᵀBⱼ z ≤ θ zᵀz` because `z ≥ 0`. If the smallest eigenvalue of `Bⱼ` were at least `θ`,
   equality would make `z` an eigenvector, `Bⱼ z = θ z`, contradicting the strict coordinate. So
   `Bⱼ` has an eigenvalue below `θ`.
3. The eigenvectors so obtained, extended by `0`, have disjoint supports with no edges between
   them, so they span a `c`-dimensional space on which `xᵀLx < θ‖x‖²` for `x ≠ 0`. By
   Courant–Fischer at least `c` eigenvalues of `L` are below `θ`.

**Checks.**
- The star with centre `3` and leaves `0, 1, 2` (eigenvalues `4, 1, 1, 0`) and `ψ = (−2, 1, 1, 0)`,
  `θ = 1`: `{ψ ≥ 0} = {1, 2, 3}` is connected, `1 ≤ 1`. With `t = 1/2 > 0` the set `{1, 2}` has two
  components, more than the one eigenvalue below `1`: the hypothesis `t ≤ 0` is needed.
- `θ > 0` is needed: on a connected graph `ψ = 𝟙` with `θ = 0` gives one component and no
  eigenvalue below `0`.
- An exhaustive computation over all graphs with at most seven vertices confirms the statement:
  for every eigenvalue, the combinations of a basis of its eigenspace with coefficients in
  `{−1, 0, 1}` (eigenspaces of dimension at most four; for larger ones every `±bᵢ ± bⱼ`), with
  exact rational bases for the integer eigenvalues, and every threshold `t ≤ 0`.

*Needs:* 1.1; Mathlib `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`,
`SimpleGraph.lapMatrix_mulVec_one_eq_zero`, `SimpleGraph.lapMatrix_mulVec_apply`,
`Matrix.PosSemidef`; Tau Ceti `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`,
`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`. (Proved here.)

### 6.2 The strong nodal domain theorem

The strong nodal domains of `ψ` are the maximal connected vertex sets on which `ψ` has one strict
sign; they are the components of the subgraphs induced on `{ψ > 0}` and on `{ψ < 0}`. Prove
`card_strongNodalDomains_le`: their number is at most the number of indices `i` with `νᵢ ≤ θ`
(Davies, Leydold and Stadler, Theorem 2, the strong part: at most `k̄` strong domains, `k̄` the
largest index of an eigenvalue equal to `θ` in the increasing numbering). Davies, Leydold and
Stadler assume a connected graph throughout; the statement here does not, since the proof below
does not use connectedness.

Route (Davies–Leydold–Stadler, proof of Theorem 2 and Lemma 1, with `H = L`). Let `D₁, …, D_k'`
be the strong domains and `gⱼ` the restriction of `ψ` to `Dⱼ`; they have disjoint supports.
If `k'` exceeded the number `m` of eigenvalues `≤ θ`, some nonzero `g = Σ αⱼ gⱼ` would be
orthogonal to the eigenvectors of those `m` eigenvalues, so `gᵀLg > θ‖g‖²` by the expansion in an
eigenbasis. But `gᵀLg = θ‖g‖² + R` with
`R = ½ Σ_{x ~ y} (α(x) − α(y))² ψ(x)ψ(y)`, where `α` is `αⱼ` on the support of `gⱼ` and `0`
elsewhere; adjacent vertices with `ψ(x)ψ(y) > 0` lie in one domain, so every nonzero term has
`ψ(x)ψ(y) < 0` and `R ≤ 0`.

**Checks.**
- The star `K_(1,4)` with centre value `0` and leaf values `1, 1, −1, −1` (`θ = 1`; eigenvalues
  `5, 1, 1, 1, 0`) has four strong domains, the leaves, and four eigenvalues at most `1`, so the
  bound is attained; it exceeds by two the bound `#{ν < θ} + 1 = 2` that holds for weak domains in
  6.3 (Davies–Leydold–Stadler, §4).
- `K₂` with an isolated vertex, `ψ = (1, −1, 0)`, `θ = 2`: two strong domains, three
  eigenvalues at most `2`.

*Needs:* 1.1; Mathlib `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`,
`SimpleGraph.lapMatrix_toLinearMap₂'`; Tau Ceti
`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`. (Proved here, following
the cited route.)

### 6.3 The weak nodal domain theorem

Define `IsWeakNodalDomain G ψ D`: `D` is maximal among the vertex sets that induce a connected
subgraph and on which `ψ(x)ψ(y) ≥ 0` for all `x, y` (Davies–Leydold–Stadler, Definition 1). Prove
`ncard_weakNodalDomains_le`: on a connected graph, `ψ` has at most `1 + #{i | νᵢ < θ}` weak nodal
domains (Davies–Leydold–Stadler, Theorem 2, the weak part: at most `k̲` weak domains, `k̲` the
smallest index of an eigenvalue equal to `θ` in the increasing numbering). If `θ` is not an
eigenvalue then `ψ = 0`, whose only weak domain is the whole vertex set.

Route (Davies–Leydold–Stadler, Lemmas 1 and 2 and the end of the proof of Theorem 2). For
`ψ ≠ 0` on a connected graph every weak domain contains a vertex where `ψ ≠ 0`, and two weak
domains meet only where `ψ = 0`, so the restrictions `gⱼ` of `ψ` to the domains are nonzero with
disjoint supports. If there were `k' ≥ m + 2` domains, with `m = #{i | νᵢ < θ}`, some nonzero
combination `g` would be orthogonal to the eigenvectors of the eigenvalues below `θ` and to `ψ`;
then `gᵀLg ≥ θ‖g‖²` by the eigenbasis expansion and `gᵀLg ≤ θ‖g‖²` by the remainder computation of
6.2, so `g` is an eigenvector for `θ` and `R = 0`. Lemma 2 then shows that adjacent domains carry
equal coefficients wherever one is nonzero, connectedness propagates this to all domains, so `g`
is a multiple of `ψ`, and orthogonality to `ψ` forces `g = 0`.

**Checks.**
- The star `K_(1,4)` with the vector of 6.2 has two weak domains, the centre with the two
  positive leaves and the centre with the two negative ones, and `#{ν < 1} + 1 = 2`.
- The path on `n` vertices: the eigenvector of the `k`-th smallest eigenvalue, which is simple,
  has exactly `k` weak domains (Davies–Leydold–Stadler, §4), so the bound is attained; for
  `n = 3`, `ψ = (1, 0, −1)`, `θ = 1`, the domains are `{0, 1}` and `{1, 2}`.
- Connectedness is needed: two disjoint copies of `K₂` (eigenvalues `2, 2, 0, 0`) with
  `ψ = (1, −1, 1, −1)`, `θ = 2`, have four one-vertex weak domains, more than `2 + 1`.
- The computation of 6.1 confirms 6.2 on all graphs and 6.3 on all connected graphs with at
  most seven vertices.

*Needs:* 1.1, 6.2 (its remainder computation); Mathlib `SimpleGraph.induce`,
`SimpleGraph.Connected`, `Maximal`, `Set.ncard`; Tau Ceti
`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`. (Proved here, following
the cited route.)

### Examples

Stars, paths, `K₂` with an isolated vertex and two disjoint copies of `K₂`, with the vectors in
the Checks.

### Dependencies

1.1; Mathlib `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`, `SimpleGraph.Connected`,
`SimpleGraph.lapMatrix_mulVec_one_eq_zero`, `SimpleGraph.lapMatrix_mulVec_apply`,
`SimpleGraph.lapMatrix_toLinearMap₂'`, `Matrix.PosSemidef`, `Maximal`, `Set.ncard`; Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`,
`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`.

## Layer 7: the Kirchhoff index

### 7.1 Effective resistances and the spectrum

The structure `Network` and the definitions `Network.weight`, `Network.laplacian`,
`Network.groundedLaplacian`, `Network.voltage` and `Network.effResistance` are copied verbatim
from ElectricalNetworksAndRandomWalks 1.1 and 2.1: the effective resistance `R(a ↔ z)` is the
diagonal entry at `a` of the inverse of the Laplacian with the row and column of `z` deleted, `0`
when `a = z`, and `0` on a disconnected network (the inverse of a singular matrix is `0`). Define
`unitNetwork G`, the network with conductance `1` on the edges of `G` and `0` elsewhere; its
Laplacian is `G.lapMatrix ℝ`.

Prove `sum_effResistance_eq`: on a connected graph,
`Σ_a Σ_z R(a ↔ z) = 2n Σ 1/νᵢ`, the last sum over the indices `i` with `i + 1 < n`, which by 1.2
are exactly the nonzero eigenvalues. Summed over unordered pairs this is the Kirchhoff index
formula `Kf(G) = n Σ_{i ≥ 2} 1/μᵢ`.

Route (proved here). Spielman (§12.1, p. 112) defines the effective resistance as
`(δ_a − δ_z)ᵀ L⁺ (δ_a − δ_z)` and writes the pseudoinverse as `L⁺ = Σ_{νᵢ ≠ 0} ψᵢψᵢᵀ/νᵢ` in an
orthonormal eigenbasis (Claim 11.8.2, p. 110). The two definitions agree: for `a ≠ z` the voltage
`v` of ElectricalNetworksAndRandomWalks 2.1 vanishes at `z` and satisfies `(Lv)_x = δ_a(x)` for
`x ≠ z`; since the entries of `Lv` sum to `0`, `Lv = δ_a − δ_z`, so `v − L⁺(δ_a − δ_z)` is
constant by 1.2, and `R(a ↔ z) = v(a) − v(z) = (δ_a − δ_z)ᵀ L⁺ (δ_a − δ_z)`. Summing over ordered
pairs, `Σ_a Σ_z (L⁺_aa + L⁺_zz − 2L⁺_az) = 2n tr L⁺ − 2·𝟙ᵀL⁺𝟙 = 2n tr L⁺`, because `L⁺𝟙 = 0`, and
`tr L⁺ = Σ_{νᵢ ≠ 0} 1/νᵢ`.

**Checks.**
- `Kₙ`: `R = 2/n` between distinct vertices, so the left side is `n(n − 1)·2/n = 2(n − 1)`, and
  the right side is `2n·(n − 1)/n`.
- The path `0 − 1 − 2`: resistances `1, 1, 2`, ordered sum `8`; eigenvalues `3, 1`, and
  `2·3·(1/3 + 1) = 8`.
- On one vertex both sides are `0`.
- Connectedness is needed: for `K₂` with an isolated vertex every grounded Laplacian is singular,
  so the left side is `0`, while the right side is `2·3·(1/2 + 0⁻¹) = 3`, with `0⁻¹ = 0` for the
  zero eigenvalue at index `1`.
- An exact rational computation over all connected graphs with at most seven vertices, with the
  grounded-inverse definition on the left and `Σ 1/νᵢ = tr (L + J/n)⁻¹ − 1` on the right,
  confirms the statement.

*Needs:* 1.1, 1.2; ElectricalNetworksAndRandomWalks 1.1 and 2.1 (the copied definitions, and the
remark of its scope section that the Laplacian of unit conductances is `G.lapMatrix ℝ`); Mathlib
`Matrix.IsHermitian.eigenvectorBasis`, `Matrix.mul_nonsing_inv`,
`Matrix.nonsing_inv_apply_not_isUnit`; Tau Ceti
`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`. (Proved here.)

### Examples

Complete graphs, the path on three vertices, one vertex, and `K₂` with an isolated vertex, with
the values in the Checks.

### Dependencies

1.1, 1.2; ElectricalNetworksAndRandomWalks 1.1 and 2.1; Mathlib
`Matrix.IsHermitian.eigenvectorBasis`, `Matrix.mul_nonsing_inv`,
`Matrix.nonsing_inv_apply_not_isUnit`; Tau Ceti
`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`.

## Layer 8: the dual Cheeger inequality

### 8.1 The signless bottom and the bipartiteness ratio

Define `signlessBottom G`, the infimum `σ(G)` of `xᵀ(D + A)x / xᵀDx` over the real vectors with
`xᵀDx > 0`, where `D = G.degMatrix ℝ` and `A = G.adjMatrix ℝ`; and `bipartitenessRatio G`, the
infimum `β(G)` over the vectors `y` with entries in `{−1, 0, 1}` and `Σ_v d(v)|y(v)| > 0` of
`Σ_{uv ∈ E} |y(u) + y(v)| / Σ_v d(v)|y(v)|` (Trevisan, *Lecture Notes on Graph Partitioning,
Expanders and Spectral Methods*, §6.1, p. 29, where the minimum is over `y ≠ 0` for a graph
whose normalized Laplacian is defined; requiring `Σ_v d(v)|y(v)| > 0` instead admits isolated
vertices and is this roadmap's adaptation). The sum over edges is half the sum over ordered
adjacent pairs. Since `xᵀ(D + A)x = Σ_{uv ∈ E} (x(u) + x(v))²`, both quotients are
nonnegative. Writing `y` as a set `S = {y ≠ 0}` split into `{y = 1}` and `{y = −1}`, the
numerator counts twice each edge inside one part and once each edge leaving `S`.

For a graph without isolated vertices `σ(G)` is `2 − λ`, with `λ` the largest eigenvalue of the
normalized Laplacian `I − D^(−1/2) A D^(−1/2)`; the definition here uses only `D` and `A`, so
isolated vertices are allowed (they contribute to neither side of either quotient). Without
edges both index sets are empty and both quantities are `0`.

**Checks.**
- `K₃`: `σ = 1/2` (the eigenvalues of `I + A/2` are `2, 1/2, 1/2`) and `β = 1/3`, attained at
  `y = (1, 1, −1)`.
- The 5-cycle: `σ = (3 − √5)/4 ≈ 0.191` and `β = 1/5`, attained at `y = (−1, −1, 1, −1, 1)`.
  `K₄`: `σ = 2/3`, `β = 1/3`.
- A bipartite graph with an edge, such as `K₂` or the 4-cycle, has `σ = β = 0`. A graph with an
  edge has `σ = 0` exactly when some component with an edge is bipartite; a graph without edges
  has the junk value `σ = 0`.
- `K₂` with an isolated vertex: `σ = β = 0`. A plausible wrong denominator `Σ_v |y(v)|` would give
  `β(K₂ + K₁) = 0` as well but `β(K₃) = 2/3`; the degree-weighted one gives `1/3`.

*Needs:* Mathlib `SimpleGraph.degMatrix`, `SimpleGraph.adjMatrix`,
`SimpleGraph.dotProduct_mulVec_degMatrix`, `SimpleGraph.dotProduct_mulVec_adjMatrix`, `iInf`.

### 8.2 The dual Cheeger inequality

Prove `signlessBottom_div_two_le_bipartitenessRatio`: `σ(G)/2 ≤ β(G) ≤ √(2σ(G))` (Trevisan,
lecture notes §6.1 and Lemma 6.1, pp. 28–31; for regular graphs Trevisan, "Max Cut and the
Smallest Eigenvalue", arXiv:0806.1978, Lemma 3 and inequality (8) of §5). No hypothesis is
needed: without edges both sides are `0`.

Route. Lower bound (Trevisan, notes §6.1): an admissible `y` is admissible for `σ`, with
`yᵀDy = Σ d(v)|y(v)|` and `Σ_{uv ∈ E}(y(u) + y(v))² ≤ 2 Σ_{uv ∈ E}|y(u) + y(v)|` because
`|y(u) + y(v)| ≤ 2`; so `σ ≤ 2β(y)` for every `y`. Upper bound (Trevisan, Lemma 6.1 and its
proof): for `x` with `xᵀDx > 0`, scaled so that `max |x(v)| = 1`, choose `t ∈ (0, 1]` with `t²`
uniform and let `y_t(v)` be the sign of `x(v)` where `|x(v)| ≥ t` and `0` elsewhere. Then
`E Σ d(v)|y_t(v)| = Σ d(v)x(v)²`, and for each edge
`E|y_t(u) + y_t(v)| ≤ |x(u) + x(v)|(|x(u)| + |x(v)|)`; Cauchy–Schwarz and
`Σ_{uv ∈ E}(|x(u)| + |x(v)|)² ≤ 2 Σ d(v)x(v)²` give
`E Σ_E |y_t(u) + y_t(v)| ≤ √(2 xᵀ(D + A)x / xᵀDx) · E Σ d(v)|y_t(v)|`. The notes then pick a `t`
with ratio at most the ratio of expectations, which needs the denominator positive for every `t`;
with isolated vertices it can vanish, but then the numerator vanishes too (every edge has both
ends of positive degree, hence `y_t = 0` on it), and the denominator is positive with positive
probability because its expectation is `xᵀDx > 0`, so such a `t` exists among those with positive
denominator. The threshold vectors are finitely many, so the expectation is a finite weighted sum
over the intervals between consecutive values of `x(v)²`. Taking the infimum over `x` gives
`β ≤ √(2σ)`.

**Checks.**
- `K₃`: `1/4 ≤ 1/3 ≤ 1`. The 5-cycle: `0.0955 ≤ 0.2 ≤ 0.618`. `K₄`: `1/3 ≤ 1/3 ≤ 1.155`, so the
  lower bound is attained.
- An exhaustive computation over all graphs with at most six vertices and an edge, with `β`
  computed exactly over all `3ⁿ` vectors, confirms both inequalities.

*Needs:* 8.1; Mathlib `Real.sqrt`, `Finset.sum_mul_sq_le_sq_mul_sq`, `iInf`, `ciInf_le`,
`le_ciInf`. (Proved here, following the cited route.)

### Examples

`K₂`, `K₃`, `K₄`, the 4-cycle, the 5-cycle and `K₂` with an isolated vertex, with the values in
the Checks.

### Dependencies

Mathlib `SimpleGraph.degMatrix`, `SimpleGraph.adjMatrix`,
`SimpleGraph.dotProduct_mulVec_degMatrix`, `SimpleGraph.dotProduct_mulVec_adjMatrix`, `iInf`,
`ciInf_le`, `le_ciInf`, `Real.sqrt`, `Finset.sum_mul_sq_le_sq_mul_sq`. No other layer.

## Layer 9: the Grone–Merris inequality

### 9.1 Bai's theorem

Prove `sum_lapEigenvalues_le_sum_card_le_degree`: for every `t`,
`ν₁ + ⋯ + νₜ ≤ Σ_{j=1}^{t} #{x | d(x) ≥ j}`, the right side being the sum of the first `t` terms of
the conjugate of the degree sequence (Grone and Merris conjectured it, Bai proved it;
Brouwer–Haemers, Theorem 3.11.2, pp. 60–63, with Lemmas 3.11.3 and 3.11.4 and the complete proof).
For `t ≥ n` both sides equal `2|E|`, since every degree is below `n`. For `t = 1` it says that
`ν₁` is at most the number of vertices that are not isolated, which is 2.1 applied to the
subgraph induced on them.

Route (Brouwer–Haemers' proof of Theorem 3.11.2, in their steps; write `d*_t` for the right side).
- Ky Fan's inequality `Σ_{i ≤ t} νᵢ(A + B) ≤ Σ_{i ≤ t} νᵢ(A) + Σ_{i ≤ t} νᵢ(B)` (Brouwer–Haemers,
  Theorem 2.8.2) follows from Tau Ceti's Ky Fan trace inequality
  `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` applied to `t` orthonormal
  eigenvectors of the `t` largest eigenvalues of `A + B`.
- Step 1: in a counterexample with `t` minimal and then with fewest edges, two vertices of degree
  at most `t` are not adjacent; removing such an edge lowers `d*_t` by `2` and the eigenvalue sum
  by at most `2`, by Ky Fan with the Laplacian of one edge (eigenvalues `2, 0, …`).
- Step 2: joining all nonadjacent pairs of vertices of degree at least `t` keeps `d*_t` and does not
  lower the eigenvalue sum (2.2); the result is a split graph whose clique has size
  `c = #{x | d(x) ≥ t}`.
- Step 3: a split graph with clique size `c` has `ν_(c+1) ≤ c ≤ ν_(c−1)`, by 2.2 against the clique
  and against the complete split graph.
- Step 4: by 2.1, the `m`-th inequality for `G` is the `(n − 1 − m)`-th for `Gᶜ`, and the
  complement of a split graph is split.
- Lemma 3.11.3 (Steps 5 and 6): if `ν_c > c`, or `ν_c = c` exceeds the largest degree `δ` in the
  coclique, then the `c`-th inequality holds; the proof writes the span `W` of the top `c`
  eigenvectors as the column space of `[[I], [X]]` and needs `X ≤ 0`. That form exists because
  `ν_(c+1) ≤ δ < ν_c`: Brouwer–Haemers get `ν_(c+1) ≤ δ` by interlacing, and Courant–Fischer gives
  it directly, since the coclique has no inner edges and the quadratic form of `L` on the
  `(n − c)`-dimensional space `U` of vectors supported on it is `Σ d(v) x(v)² ≤ δ‖x‖²`; every
  `(c + 1)`-dimensional subspace meets `U`, so the supremum of the Courant–Fischer theorem at
  Lean index `c` is at most `δ`. The same bound against `ν_c` gives `W ∩ U = 0`.
- Lemma 3.11.4: `X ≤ 0` when `ν_c > δ`. Let `A` be the clique–coclique adjacency matrix,
  `A(α) = αA + (1 − α)J` and `L(α) = αL + (1 − α)L(J)` for `0 ≤ α ≤ 1`, the Laplacian of the
  split graph weighted by `A(α)`; `L(J)` has spectrum `n^c, c^(n−c−1), 0`. The gap persists: `W`
  is orthogonal to `𝟙`, where the form of `L(J)` is at least `c`, so Courant–Fischer gives
  `ν_c(α) ≥ αν_c + (1 − α)c`; the coclique block of `L(α)` is diagonal with largest entry
  `δ(α) = αδ + (1 − α)c`, so `ν_(c+1)(α) ≤ δ(α)` as above; and `ν_c(α) − δ(α) ≥ α(ν_c − δ) > 0`
  for `α > 0`, while `ν_c(0) = n > c = δ(0)`. Let `γ(α) = ν_c(α) − ν_(c+1)(α) > 0` and `P(α)`
  the orthogonal projection on the top-`c` eigenspace `W(α)`. If `‖L(β) − L(α)‖ ≤ γ(α)/2`, Weyl's
  perturbation bound `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm` keeps
  `ν_c(α) − ν_(c+1)(β)` and `ν_c(β) − ν_(c+1)(α)` at least `γ(α)/2`, and Tau Ceti's Davis–Kahan
  bound `Submodule.projectionGap_le_norm_sub_div`, applied to `W(α)` and `W(β)` (forms at least
  `ν_c` on them and at most `ν_(c+1)` on their orthogonal complements) and `g = γ(α)/2`, gives
  `‖P(α) − P(β)‖ ≤ 2|α − β|‖L − L(J)‖/γ(α)`; so `P` is continuous. As `W(α)` and the coclique
  space are complementary, so are their orthogonal complements, so the clique block `P₁₁(α)` of
  `P(α)` is invertible and `X(α) = P₂₁(α)P₁₁(α)⁻¹` is continuous (`continuousAt_matrix_inv`).
  Finally `X(0) = −Jᵀ/(n − c) < 0`, and the fixed-point identity
  `X(cI + D) = −X(J − A)X + EX − Aᵀ` (for `A(α)` and its `D`, `E`) shows that `X ≤ 0` forces
  `X < 0` when `A(α) > 0`, that is for `α < 1`. So the set of `α < 1` with `X(α) ≤ 0` contains
  `0`, is closed, and is open (on it `X < 0`); it is all of `[0, 1)`, which is connected, and
  `X(1) ≤ 0` by continuity.
The steps combine as in Brouwer–Haemers: minimality gives `ν_t > c` and then `c > t`, `ν_c < c`,
and Step 4 transfers the case to the complement, where Lemma 3.11.3 gives the contradiction.

**Checks.**
- The star `K_(1,3)` (eigenvalues `4, 1, 1, 0`; degrees `3, 1, 1, 1`; conjugate sequence
  `4, 1, 1`) has equality for every `t`, as every threshold graph does (Brouwer–Haemers,
  Proposition 3.11.1).
- The path on four vertices: eigenvalues `2 + √2, 2, 2 − √2, 0`, conjugate sequence `4, 2`; the
  sums give `3.41 ≤ 4`, `5.41 ≤ 6`, `6 ≤ 6`.
- The conjugate sequence cannot be replaced by the degree sequence: for `K_(1,3)` the largest degree
  `3` is below `ν₁ = 4`; by 5.1 the degree sums bound the eigenvalue sums from below.
- An exhaustive computation over all graphs with at most seven vertices and every `t` confirms
  the statement.

*Needs:* 1.1, 2.1, 2.2; Mathlib `SimpleGraph.degree`, `continuousAt_matrix_inv`; Tau Ceti
`LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`,
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`,
`Submodule.projectionGap_le_norm_sub_div`, `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`.
(Proved here, following the cited proof.)

### Examples

The star `K_(1,3)` and the path on four vertices, with the values in the Checks.

### Dependencies

1.1, 2.1, 2.2; Mathlib `SimpleGraph.degree`, `continuousAt_matrix_inv`; Tau Ceti
`LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`,
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`,
`Submodule.projectionGap_le_norm_sub_div`, `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`.

## Scope and ownership

This roadmap owns the targets stated above: the sorted Laplacian eigenvalues of a simple graph,
the count of zero eigenvalues, the complement formula, monotonicity and interlacing under added
edges, Fiedler's superadditivity and vertex-cut bound for the algebraic connectivity, the
Anderson–Morley and Grone–Merris bounds on the largest eigenvalue, Grone's degree bound in the
form of Brouwer–Haemers' second proof, Fiedler's nodal domain theorem and the strong and weak
nodal domain theorems of Davies, Leydold and Stadler for the Laplacian, the Kirchhoff index
formula, the signless dual Cheeger inequality, and the Grone–Merris inequality.

Already in the libraries and therefore not targets: Mathlib's Laplacian with its symmetry,
positive semidefiniteness, quadratic form, vanishing determinant
(`SimpleGraph.det_lapMatrix_eq_zero`) and the dimension of its kernel; sorted Hermitian
eigenvalues; Gershgorin's theorem; and
Tau Ceti's Courant–Fischer theorem, the Loewner monotonicity of sorted eigenvalues
(`LinearMap.IsSymmetric.eigenvalue_mono`, which with the decomposition `L(H) = L(G) + L(H \ G)`
gives the first form of 2.2), Weyl's inequalities, rank interlacing, the Ky Fan trace
inequality, the Schur–Horn theorem
(`LinearMap.IsSymmetric.exists_orthonormalBasis_re_inner_apply_self_eq_iff`, whose application
to the diagonal of `L` is 5.1 without the term `h`) and the Davis–Kahan bound.

Owned by other roadmaps:

- ElectricalNetworksAndRandomWalks 1.1 and 2.1 own networks and effective resistance; 7.1 copies
  their definitions verbatim and does not restate any of their theorems. Its scope section lists
  spectral bounds on effective resistance as outside it.
- GeometricTopology 4.4.5 (the integral Conway polynomial) owns the weighted matrix-tree
  identity, and DirectedMatrixTreeAndBEST owns the directed matrix-tree theorem; neither is a
  supplier. The product formula for the number of spanning trees
  through the Laplacian eigenvalues is not stated here.

Boundaries with neighbouring roadmaps, none of which is a supplier:

- SpectralGraphBounds owns bounds on adjacency eigenvalues and lists Laplacian eigenvalues as
  outside its scope. Its 1.4 counts the eigenvalue `d` of a `d`-regular adjacency matrix; 1.2
  above counts the eigenvalue `0` of the Laplacian of every graph, which for regular graphs is the
  same count, through `L = dI − A`. Its enumeration device is used here for a different matrix.
  This roadmap does not depend on that one.
- KernelsAndSpectralMethods owns weighted graphs and their combinatorial, normalized and
  random-walk Laplacians (its Layer 1, weighted graphs and their Laplacians, 1.1–1.4), including
  the dimension of their kernels (1.3) and the spectrum of the normalized Laplacian in `[0, 2]`,
  with the eigenvalue `2` exactly when a component is bipartite (1.4); the normalized Fiedler
  value with its bounds (2.1); and the Cheeger inequality for the normalized Laplacian (Layer 3,
  conductance and the Cheeger inequality, 3.2). The algebraic connectivity here is the second
  smallest eigenvalue of the unnormalized `G.lapMatrix ℝ`, a different number, and 1.2 counts
  sorted eigenvalues of that matrix, which 1.3 there does not. For a graph on a nonempty vertex
  set without isolated vertices `σ(G)` of Layer 8 is `2` minus the largest eigenvalue of the
  normalized Laplacian, so the Check of 8.1 that a graph with an edge has `σ = 0` exactly when
  some component with an edge is bipartite is the signless form of its 1.4; it is a Check here,
  not a target. The dual Cheeger inequality of Layer 8 is stated with `D` and `A` alone; that
  roadmap neither states it nor lists it. This roadmap does not depend on that one.
- EquitableOperatorReduction owns equitable partitions, quotient matrices and interlacing for
  orthogonal compressions, which contains quotient interlacing; 5.1 uses the second proof of
  Brouwer–Haemers, which needs no quotient matrix. This roadmap does not depend on that one.
- MarkovChainMixing owns the spectral gap, the absolute spectral gap (its Layer 2, spectral
  theory, 2.2 and 2.4) and Cheeger's inequality between the spectral gap and the bottleneck ratio
  (its Layer 3, the bottleneck ratio, 3.2) for Markov chains; none is stated here. The dual Cheeger
  inequality of Layer 8 bounds the bottom of the signless spectrum, not the spectral gap, by a
  combinatorial ratio; that roadmap states no such bound.

Outside the scope: weighted graphs, the normalized and signless Laplacian spectra as such,
multigraphs; higher-order Cheeger inequalities; equality cases of 4.1, 4.2, 5.1 and 9.1; the
lower bound `νₘ ≥ dₘ − m + 2` of Brouwer and Haemers; the Brouwer conjecture; Laplacians of
simplicial complexes; spectral sparsification and Loewner-order approximation of Laplacians; and
every procedure for computing eigenvalues or cuts.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`: `SimpleGraph.degMatrix` (the diagonal
  matrix of degrees); `SimpleGraph.lapMatrix` (`degMatrix − adjMatrix`);
  `SimpleGraph.isHermitian_lapMatrix`; `SimpleGraph.posSemidef_lapMatrix` (over a linearly ordered
  field); `SimpleGraph.lapMatrix_mulVec_one_eq_zero` (`L *ᵥ 1 = 0`);
  `SimpleGraph.lapMatrix_mulVec_apply` (`(L *ᵥ x) v = deg v · x v − Σ_{u ~ v} x u`);
  `SimpleGraph.lapMatrix_top` (`L(⊤) = n − of 1`); `SimpleGraph.lapMatrix_toLinearMap₂'`
  (`xᵀLx = (Σ_i Σ_j [i ~ j](x i − x j)²)/2`); `SimpleGraph.dotProduct_mulVec_degMatrix`;
  `SimpleGraph.det_lapMatrix_eq_zero`;
  `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` (the number of components
  is the dimension of the kernel of `toLin' (G.lapMatrix ℝ)`).
- `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`: `SimpleGraph.adjMatrix`,
  `SimpleGraph.dotProduct_mulVec_adjMatrix`.
- `Mathlib/Combinatorics/SimpleGraph/IncMatrix.lean`: `SimpleGraph.incMatrix` (rows `V`, columns
  `Sym2 V`, entry `1` when the vertex lies on the edge); `SimpleGraph.incMatrix_mul_transpose`
  (for a locally finite graph `M Mᵀ` has the degrees on the diagonal and the adjacency matrix off
  it, so it is `D + A`, the signless Laplacian);
  `SimpleGraph.incMatrix_transpose_mul_diag` (the diagonal of `Mᵀ M` is `2` on edges and `0` off
  them).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues₀` (sorted
  nonincreasingly on `Fin (Fintype.card n)`, the sorted eigenvalues of `Matrix.toEuclideanLin A`);
  `Matrix.IsHermitian.eigenvalues₀_antitone`; `Matrix.IsHermitian.eigenvectorBasis`.
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.charpoly_mul_comm` (square) and
  `Matrix.charpoly_mul_comm'` (`X^n · charpoly (A * B) = X^m · charpoly (B * A)` for `A` of size
  `m × n`).
- `Mathlib/LinearAlgebra/Matrix/Gershgorin.lean`: `eigenvalue_mem_ball` (every eigenvalue lies in
  a disc about a diagonal entry of radius the off-diagonal row sum of absolute values).
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank`.
  `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean` (rank–nullity):
  `LinearMap.finrank_range_add_finrank_ker`.
- `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.mul_nonsing_inv` (`A * A⁻¹ = 1`
  for invertible `A`), `Matrix.nonsing_inv_apply_not_isUnit` (`A⁻¹ = 0` for singular `A`).
  `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef`, `Matrix.PosSemidef`.
- `Mathlib/Combinatorics/SimpleGraph/Maps.lean`: `SimpleGraph.induce`.
  `Mathlib/Combinatorics/SimpleGraph/Finite.lean`: `SimpleGraph.edgeFinset`,
  `SimpleGraph.degree`, `SimpleGraph.maxDegree`, `SimpleGraph.exists_maximal_degree_vertex`.
  `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.Connected`,
  `SimpleGraph.ConnectedComponent`. `Mathlib/Order/Defs/Unbundled.lean`: `Maximal`.
  `Mathlib/Data/Set/Card.lean`: `Set.ncard`.
- `Mathlib/Order/ConditionallyCompleteLattice/Indexed.lean`: `ciInf_le`, `le_ciInf` (for
  bounded-below, respectively nonempty, families).
  `Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`: `Finset.sum_mul_sq_le_sq_mul_sq`
  (Cauchy–Schwarz for finite sums). `Real.sqrt`.
- `Mathlib/Topology/Instances/Matrix.lean`: `continuousAt_matrix_inv` (matrix inversion is
  continuous at a matrix where `Ring.inverse` is continuous at the determinant, as at a matrix
  with nonzero determinant over `ℝ`).

### From Tau Ceti

- `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`:
  `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` (the `k`-th largest eigenvalue of a
  symmetric operator is the supremum over `(k + 1)`-dimensional subspaces of the infimum of the
  quadratic form on their unit vectors);
  `LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq` (the quadratic form in an
  orthonormal eigenbasis); `LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis` (an antitone list
  of eigenvalues of an orthonormal eigenbasis is the sorted eigenvalue list);
  `LinearMap.IsSymmetric.eigenvalue_mono` (if the quadratic form of `T` is at most that of `S`,
  every sorted eigenvalue of `T` is at most the one of `S` at the same index).
- `TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean`: `Matrix.IsHermitian.le_eigenvalues₀_add`
  (for `k + n ≤ i + j + 1`, `λᵢ(A) + λⱼ(B) ≤ λₖ(A + B)`);
  `Matrix.IsHermitian.eigenvalues₀_le_of_rank_sub_le` (if `rank (A − B) ≤ r` and `i + r ≤ k`, then
  `λₖ(A) ≤ λᵢ(B)`); `Matrix.IsHermitian.rank_eq_card_non_zero_eigenvalues₀`;
  `Matrix.PosSemidef.eigenvalues₀_nonneg`; `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`
  (Weyl's perturbation bound `|λᵢ(A) − λᵢ(B)| ≤ ‖A − B‖` in the Euclidean operator norm).
- `TauCeti/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank_add_le` (over a field,
  `rank (A + B) ≤ rank A + rank B`).
- `TauCeti/Analysis/InnerProductSpace/KyFan.lean`:
  `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` (for an orthonormal family of
  `k` vectors, the sum of the quadratic form over it is at most the sum of the `k` largest
  eigenvalues).
- `TauCeti/Analysis/InnerProductSpace/SchurHorn.lean`:
  `LinearMap.IsSymmetric.exists_orthonormalBasis_re_inner_apply_self_eq_iff` (the Schur–Horn
  theorem in majorization form), named in the scope section.
- `TauCeti/Analysis/InnerProductSpace/Projection/SinTheta.lean`:
  `Submodule.projectionGap_le_norm_sub_div` (for an `A`-invariant subspace `U` and a
  `B`-invariant subspace `V`, `B` symmetric, whose quadratic forms are separated by `g > 0` in both
  orientations, `‖P_U − P_V‖ ≤ ‖B − A‖ / g`).

### From TauCetiRoadmap.ElectricalNetworksAndRandomWalks

- Section 1.1: the structure `Network` (fields `cond`, `symm`, `nonneg`) and `Network.weight`,
  copied verbatim.
- Section 2.1: `Network.laplacian` (`diagonal weight − of cond`), `Network.groundedLaplacian` (the
  submatrix off `z`), `Network.voltage` (the column of `a` of the inverse grounded Laplacian,
  extended by `0` at `z`, and `0` when `a = z`) and `Network.effResistance` (its value at `a`),
  copied verbatim; and the remark of its scope section that for unit conductances on a simple
  graph the Laplacian of 2.1 is `G.lapMatrix ℝ`. No theorem of that roadmap is used.

## References

- Andries E. Brouwer and Willem H. Haemers, *Spectra of Graphs*, the authors' PDF on the first
  author's page (`homepages.cwi.nl/~aeb/math/ipm/ipm.pdf`); published by Springer, Universitext,
  2012. Locators are to the numbered results and the printed pages of that file: §1.3.2 (p. 14),
  §1.4.1, Proposition 1.3.7, Propositions 1.7.1 and 1.7.2 (p. 22), Theorem 2.6.1 (p. 35),
  Theorems 2.8.1 and 2.8.2 (p. 36), Lemma 2.10.1, Proposition 3.2.1 (p. 45), §3.9 (p. 57),
  Corollary 3.9.2 and Proposition 3.9.3 (p. 58), Proposition 3.10.1 (pp. 58–59), Proposition
  3.11.1, Theorem 3.11.2 with Lemmas 3.11.3 and 3.11.4 (pp. 60–63).
- Daniel A. Spielman, *Spectral and Algebraic Graph Theory*, incomplete draft dated April 2, 2025,
  on the author's Yale page (`cs-www.cs.yale.edu/homes/spielman/sagt/`): Claim 11.8.2 (p. 110),
  §12.1 (p. 112), Theorem 24.5.1 (p. 202).
- E. Brian Davies, Josef Leydold and Peter F. Stadler, "Discrete Nodal Domain Theorems",
  arXiv:math/0009120v1: Definition 1, Theorem 2, Lemmas 1 and 2, §4.
- Luca Trevisan, *Lecture Notes on Graph Partitioning, Expanders and Spectral Methods* (2017), on
  the author's page (`lucatrevisan.github.io/books/expanders-2016.pdf`): §6.1, Lemma 6.1 (pp.
  28–31).
- Luca Trevisan, "Max Cut and the Smallest Eigenvalue", arXiv:0806.1978: Lemmas 2 and 3, and
  inequality (8) of §5.
- The work of Fiedler, Anderson and Morley, Grone and Merris, Grone, and Bai is named as the
  sources above attribute it; no locator into it is given.

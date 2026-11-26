# Roadmap: Laplacian spectra and spanning trees

**Summary.** The Laplacian `L = D - A` of a finite simple graph on `n` vertices factors as `L = BBᵀ`
through the oriented incidence matrix `B`, whose nonsingular maximal minors are the spanning trees,
and has eigenvalues `ν₁ ≥ ⋯ ≥ νₙ = 0`; the second smallest, `ν_{n-1}`, is the algebraic
connectivity. This roadmap builds the incidence calculus of simple graphs and the algebraic theory
of spanning trees that rests on it, and proves the results on the Laplacian eigenvalues that tie
them to connectivity, degrees, cuts, minors and metric graphs, on top of the classical spectral
theory of the Laplacian that other roadmaps own. Its headline theorems are these.

- *Incidence.* `B` has rank `n - c`, with `c` the number of components; its kernel, the cycle
  space, has dimension `m - n + c`; its row space, the cut space, is the orthogonal complement of
  the cycle space.
- *The rooted-forest theorem.* For edge weights `w` and every set `R` of vertices, the principal
  minor of the weighted Laplacian `L_w` off `R` is the total weight of the spanning forests in
  which every component contains exactly one vertex of `R`.
- *Temperley's formula and the eigenvalue form.* A graph on `n ≥ 1` vertices with `N` spanning
  trees has `N = det(L + J/n²)` and `nN = ν₁ ⋯ ν_{n-1}`.
- *Kirchhoff's formulas.* In a network with conductances, the effective resistance between
  distinct vertices `a`, `z` is the weight of the two-component spanning forests separating `a`
  from `z` divided by the weight of the spanning trees; a spanning tree drawn with probability
  proportional to its weight contains the edge `az` with probability `c(a, z) R(a ↔ z)`; and in a
  tree with unit conductances resistance is distance.
- *The critical group.* The group `(ℤⁿ ∩ 𝟙^⊥)/Lℤⁿ` of a graph on a nonempty vertex set has order
  `N` and is infinite exactly when the graph is disconnected; it is presented by the reduced
  Laplacian, and for a connected graph it is the discriminant group of the cut lattice and of the
  flow lattice.
- *The distance matrix of a tree.* For a tree on `n ≥ 2` vertices the distance matrix has
  determinant `(-1)^{n-1}(n - 1)2^{n-2}` (Graham–Pollak) and inverse `-½L + ττᵀ/(2(n - 1))` with
  `τ = 2 - deg` (Graham–Lovász), and it has one positive and `n - 1` negative eigenvalues.
- *Fiedler's bounds.* For `n ≥ 2`, the algebraic connectivity satisfies `ν_{n-1} ≤ nδ/(n - 1)`
  with `δ` the minimum degree, `ν_{n-1} ≤ κ` for a graph that is not complete, with `κ` the vertex
  connectivity, and `ν_{n-1} ≥ 2κ'(1 - cos(π/n))` with `κ'` the edge connectivity. Over
  orthonormal families of `k ≤ n - 1` vectors orthogonal to the all-ones vector, the least
  Laplacian energy is `ν_{n-1} + ⋯ + ν_{n-k}`.
- *The normalized Laplacian.* For a weighted graph without loops, the eigenvalue `2` of
  `𝓛 = D^{-1/2} L D^{-1/2}` has multiplicity the number of bipartite components with at least two
  vertices of the graph of positive weights; for a simple graph without isolated vertices on
  `n ≥ 2` vertices, `tr 𝓛 = n`, the spectral gap `λ₁` equals `n/(n - 1)` exactly for `Kₙ` and is
  at most `1` otherwise, and the largest eigenvalue is at least `n/(n - 1)`.
- *Cuts.* Every vertex set `S` has between `ν_{n-1}|S|(n - |S|)/n` and `ν₁|S|(n - |S|)/n` edges
  leaving it; hence every cut has at most `nν₁/4` edges and every bisection at least
  `nν_{n-1}/4`.
- *The largest eigenvalue.* In general `ν₁` is at most the largest eigenvalue `q₁` of the
  signless Laplacian `D + A`, with equality for a connected graph exactly when it is bipartite.
  For a connected graph with `n ≥ 2` and maximum degree `Δ`: `ν₁ = Δ + 1` exactly when some vertex
  is adjacent to all others; `ν₁` equals the largest `d(x) + d(y)` over the edges exactly when the
  graph is bipartite with constant degree on each side; `ν₁ = 2Δ` exactly when the graph is
  bipartite and regular.
- *Threshold graphs.* A graph whose adjacency is a threshold condition `w(x) + w(y) > t` on
  vertex weights is one in which every nonempty vertex set has a vertex isolated or dominating
  in it (Chvátal–Hammer), and its Laplacian eigenvalues are its conjugate degrees,
  `νⱼ = #{x : d(x) ≥ j}`.
- *Nodal domains.* For a generalized Laplacian `M` of `G` (symmetric, negative on edges, zero at
  other distinct pairs) and `Mf = θf`, `f` has at most `#{λ ≤ θ}` strong and at most
  `#{λ < θ} + c` weak nodal domains.
- *The Colin de Verdière invariant.* `μ(G)`, the largest corank of a generalized Laplacian of
  `G` with one negative eigenvalue and the strong Arnold property, takes the value `n - 1` on
  `Kₙ` and `1` on an edgeless graph with `n ≥ 2`, is the maximum over the parts of a disjoint
  union when one of them has an edge, is monotone under minors, and is at most `1` exactly on
  disjoint unions of paths.
- *Equilateral metric graphs.* On the metric graph with unit edges of a graph without isolated
  vertices, a number `λ ≥ 0` that is not of the form `(πj)²` is an eigenvalue of the standard
  (Kirchhoff) Laplacian with the multiplicity that `1 - cos √λ` has for the normalized
  Laplacian; the exceptional eigenvalues `(πj)²` have multiplicities fixed by the cycle rank and
  bipartiteness; and the eigenvalue count obeys Weyl's law `N(Λ) = |E|√Λ/π + O(1)`.

The roadmap builds on [GraphSpectra](../GraphSpectra/README.md) for the signless Laplacian, the
quadratic forms, the variational formula for the algebraic connectivity, the Laplacian spectrum of
the path, line graphs and the degree bounds for the index; on
[LaplacianEigenvaluesOfGraphs](../LaplacianEigenvaluesOfGraphs/README.md) for the sorted Laplacian
eigenvalues, the complement formula, Fiedler's vertex-cut bound, the bounds
`Δ + 1 ≤ ν₁ ≤ max(d(x) + d(y))` and the unit network of a graph; on
[ElectricalNetworksAndRandomWalks](../ElectricalNetworksAndRandomWalks/README.md), whose networks
and effective resistance receive here their spanning-tree formulas; on
[KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) for weighted graphs, the
normalized Laplacian and its spectral gap; on [RandomMatrices](../RandomMatrices/README.md) for the
min–max formulas of sorted eigenvalues; and on Tau Ceti's orientations, Serre-graph incidence
boundary, Cauchy–Binet, cokernel orders, Ky Fan, Perron–Frobenius and connectivity invariants.

## How to read the build

- **Spanning trees (Layers 1–5).** Layer 1 sets up the oriented incidence matrix of an
  orientation, `L = BBᵀ`, the bridge to Tau Ceti's incidence boundary, the rank of `B` and the
  cycle and cut spaces. Layer 2 proves the matrix-tree theorems: the rooted-forest theorem for
  real edge weights and every root set, Temperley's formula and the eigenvalue form. Layer 3
  applies Layer 2 to the networks of ElectricalNetworksAndRandomWalks: Kirchhoff's formula for
  effective resistance, the edge probabilities of a random spanning tree and resistance in a
  tree. Layer 4, the critical group, uses Layers 1 and 2. Layer 5, the distance matrix of a tree,
  rests only on Mathlib's Laplacian and trees.
- **Eigenvalue bounds (Layers 6–10).** Layer 6 proves Fiedler's bounds by the minimum degree and
  the two connectivities, the energy minimization for sums of small eigenvalues, and the bridge
  `fiedlerValue = ν_{n-1}/k` between the algebraic connectivity and the normalized spectral gap of
  a weight with constant degree `k`. Layer 7 treats the normalized Laplacian: the multiplicity of
  `2` for weighted graphs, and the trace and the extreme eigenvalues of a simple graph. Layer 8
  bounds cuts by `ν_{n-1}` and `ν₁`, Layer 9 compares `ν₁` with `q₁` and proves the equality cases
  for `ν₁`, and Layer 10 computes the spectra of threshold graphs. These layers rest on
  LaplacianEigenvaluesOfGraphs, GraphSpectra and KernelsAndSpectralMethods, not on Layers 1–5;
  the case `Kₙ` of 7.2 may use 6.4.
- **Generalizations (Layers 11–12).** Layer 11 defines generalized Laplacians and proves the nodal
  domain theorem for them (11.1), defines the strong Arnold hypothesis and the Colin de Verdière
  invariant with its values (11.2), and defines minors of simple graphs by branch sets, with their
  basic API, and proves the minor monotonicity of the invariant (11.3). Layer 12 describes the
  standard Laplacian of a metric graph through its eigenfunctions and compares the equilateral case
  with the normalized Laplacian. Both are independent of the earlier layers.

Each section rests only on the sections and roadmaps named in its *Needs:* line.

## Conventions

- **Graphs.** `G : SimpleGraph V` with `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`;
  `n = Fintype.card V`, `m = #G.edgeFinset`, `c` the number of connected components. Statements
  hold for every finite `V`, including the empty type, unless a hypothesis such as `Nonempty V`
  or `2 ≤ n` is written. Mathlib's `G.Connected` requires a nonempty vertex type. `δ` and `Δ`
  are the minimum and the maximum degree, except in Layer 5, where `Δ` is the distance matrix of
  a tree. `N` is the number of spanning trees; in Lean statements `N` is a network, and in Layer
  12 `N(Λ)` is the eigenvalue count.
- **Laplacian eigenvalues.** `lapEigenvalues G i`, `i : Fin n`, is Mathlib's
  `Matrix.IsHermitian.eigenvalues₀` of `G.lapMatrix ℝ`, the enumeration of
  LaplacianEigenvaluesOfGraphs 1.1, in nonincreasing order: `lapEigenvalues G i = ν_{i+1}` with
  `ν₁ ≥ ⋯ ≥ νₙ = 0`, as in [BH, §§3.10–3.11, pp. 51–53]. `largestLapEigenvalue G` is `ν₁`, on a
  nonempty vertex type, and `algebraicConnectivity G` is `ν_{n-1}`, the value at index `n - 2`,
  for `n ≥ 2` and `0` for `n ≤ 1` (LaplacianEigenvaluesOfGraphs 1.1). Where a source numbers the
  eigenvalues upwards, `0 = μ₁ ≤ ⋯ ≤ μₙ`, its `μ_k` is `ν_{n+1-k}`, at the Lean index `n - k`,
  and its `μ₂`, the algebraic connectivity, is `ν_{n-1}`. The letter `μ` is used here only for
  the Colin de Verdière invariant `μ(G)`.
- **Connectivity.** `κ = G.vertexConnectivity.toNat` and `κ' = G.edgeConnectivity.toNat`, Tau
  Ceti's `SimpleGraph.vertexConnectivity` and `SimpleGraph.edgeConnectivity` in `ℕ∞`. On a
  finite vertex type `κ` is finite (`SimpleGraph.vertexConnectivity_ne_top`), and `κ'` is finite
  once `n ≥ 2` (`SimpleGraph.edgeConnectivity_eq_top_iff`). The vertex connectivity of `Kₙ` is
  `n - 1` (`SimpleGraph.vertexConnectivity_top`).
- **Orientations.** An orientation is `O : TauCeti.DoubledQuiver.Orientation G` with
  `[Fintype O.carrier]`; a chosen dart `d` runs from `d.fst` to `d.snd` and lies over the edge
  `d.edge`. The oriented incidence matrix `B = orientedIncMatrix G O R` has column
  `e_{d.fst} - e_{d.snd}`, as in [Ba, introduction to Chapter 2, p. 13]. [GR, §8.3, p. 167] and
  Tau Ceti's incidence boundary use `e_{d.snd} - e_{d.fst}`, that is `-B`.
- **Edge sets.** Spanning trees and rooted forests are finite sets `F ⊆ G.edgeFinset`, read as the
  spanning subgraph `fromEdgeSet F`. A multigraph enters only through integer weights.
- **Weights.** Edge weights are `w : Sym2 V → ℝ`, read only on edges. The weighted graph is the
  matrix `G.weightMatrix w` (`w s(x, y)` on edges, `0` elsewhere), to which the `degree`,
  `laplacian`, `normalizedLaplacian` and `fiedlerValue` of KernelsAndSpectralMethods apply;
  `L_w` denotes `laplacian (G.weightMatrix w)`. The matrix-tree identities hold for all real
  weights.
- **Networks and resistance.** A network is the `Network V` of ElectricalNetworksAndRandomWalks
  1.1: symmetric nonnegative conductances, loops allowed, with graph `N.graph` (the pairs `x ≠ y`
  with positive conductance) and edge conductance `N.edgeCond`. The effective resistance
  `N.effResistance a z` is that of its 2.1: the entry at `a` of the column `a` of the inverse of
  the Laplacian grounded at `z`; it is `0` for `a = z`, and `0` on a disconnected network, where
  the grounded Laplacian is singular and Mathlib's inverse is `0`. The unit network of `G` is
  `unitNetwork G` of LaplacianEigenvaluesOfGraphs 7.1. Spanning trees and forests of a network
  are those of `N.graph`, weighted by `N.edgeCond`.
- **Cuts.** For `S : Finset V` the edges leaving `S` are counted as `#(G.interedges S Sᶜ)`, the
  ordered pairs `(x, y)` with `x ∈ S`, `y ∉ S` and `x ~ y` (Mathlib's `SimpleGraph.interedges`);
  each crossing edge is counted once.
- **Signless Laplacian.** `signlessLapEigenvalues G i = q_{i+1}`, the eigenvalues of `D + A` in
  nonincreasing order, so `q₁` is the value at index `0` (GraphSpectra 1.1).
- **Normalized Laplacian.** For a simple graph it is `normalizedLaplacian (G.adjMatrix ℝ)`
  (KernelsAndSpectralMethods 1.1), with `0⁻¹ = 0` at isolated vertices and increasing eigenvalues
  `0 = λ₀ ≤ λ₁ ≤ ⋯ ≤ λ_{n-1}`; its spectral gap `λ₁` is `fiedlerValue (G.adjMatrix ℝ)`. The
  multiplicity of an eigenvalue is `Module.finrank ℝ` of the eigenspace of its `Matrix.toLin'`.
  For a weight matrix `W` it is `normalizedLaplacian W`, and `positiveGraph W` is the simple graph
  of the pairs `x ≠ y` with `W x y > 0`; it drops loops and pairs of weight `0`.
- **Generalized Laplacians.** A real symmetric matrix `M` with `M x y < 0` on edges and
  `M x y = 0` at distinct nonadjacent pairs; the diagonal is arbitrary. Multiplicities of its
  eigenvalues are counted with Mathlib's unordered `Matrix.IsHermitian.eigenvalues`.
- **Minors.** `G.IsMinor H` says that `H` is a minor of `G`, by branch sets (11.3). A definition
  of a minor as a contraction of a subgraph, proposed for Mathlib, is prior art for 11.3.
- **Metric graphs.** An orientation `O` of `G` and lengths `ℓ : O.carrier → ℝ`; the oriented edge
  `e` from `e.fst` to `e.snd` is the interval `[0, ℓ e]`, and an edge function is a real function
  on `ℝ` vanishing off `[0, ℓ e]`. The equilateral metric graph has `ℓ = 1`.

## Layer 1: the oriented incidence matrix

### 1.1 Incidence and the Laplacian

Definitions: `orientedIncMatrix G O R : Matrix V O.carrier R` over a ring `R`. Basic API, not
separate targets: an orientation has `m` darts, through the bijection of chosen darts with edges;
a sum over chosen darts of a function of the edge is the sum over the edges; each column of `B`
sums to `0` and has two nonzero entries; `Bᵀ𝟙 = 0`.

- **`L = BBᵀ`** (`orientedIncMatrix_mul_transpose`), over any commutative ring [Ba, introduction
  to Chapter 4, p. 49, where `L = QQᵀ`].
- **Bridge to Tau Ceti** (`incidenceBoundary_eq_neg_mulVec`). For `c : O.carrier → R`, Tau
  Ceti's `TauCeti.SerreGraph.incidenceBoundary` of `SimpleGraph.toSerreGraph G` applied to `c`
  is `-(Bc)`.
- **Cut vectors** (`transpose_orientedIncMatrix_mulVec_indicator`). `Bᵀ𝟙_S` is `1` on a chosen
  dart leaving `S`, `-1` on one entering `S` and `0` otherwise.

**Suggested proof:** entrywise, `(BBᵀ)_{xy} = ∑_d B_{xd} B_{yd}`; the dart over `xy` contributes
`-1` off the diagonal and every dart at `x` contributes `1` on it. The bridge and the cut vectors
are entrywise computations from the definitions; their Lean statements are sanity checks of the
definitions.

**Checks.**
- `K₂` with the dart `0 → 1`: `B = (1, -1)ᵀ`, `BBᵀ = [[1, -1], [-1, 1]] = L`.
- `P₃` (`0 - 1 - 2`) with darts `0 → 1`, `1 → 2` and `S = {0, 1}`: `Bᵀ𝟙_S = (0, 1)`; the dart
  `1 → 2` leaves `S`.
- Negative control: Tau Ceti's boundary is `-B`, not `B`; on `K₂` it sends the dart `0 → 1` to
  `e₁ - e₀`.

*Needs:* Mathlib's `SimpleGraph.lapMatrix`; Tau Ceti orientations and incidence boundary.

### 1.2 Rank, cycle space and cut space

- **The rank of `B`** (`rank_orientedIncMatrix`) is `n - c` [Ba, Theorem 2.3, p. 14].
- **The dimension of the cycle space.** `dim ker B + n = m + c`, by rank–nullity from the rank of
  `B` and the count of darts (1.1). Not a separate target.
- **The cut space** (`mem_range_transpose_orientedIncMatrix_iff`). `im Bᵀ = (ker B)^⊥`, and the
  cut vectors `Bᵀ𝟙_S` lie in it [GR, Theorem 14.1.1, p. 308, for the cut space and its
  dimension; §14.2, p. 310, for the flow space as its orthogonal complement].

**Suggested proof:** over `ℝ`, `ker Bᵀ = ker BBᵀ = ker L`, whose dimension is `c` by Mathlib's
`SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`; `im Aᵀ = (ker A)^⊥` for a
real matrix is `ContinuousLinearMap.orthogonal_range` for the Euclidean adjoint.

**Checks.**
- `P₃`: rank `2 = 3 - 1`. Two disjoint copies of `K₂`: rank `2 = 4 - 2`.
- `C₄` with darts `0 → 1 → 2 → 3 → 0`: `dim ker B = 4 - 4 + 1 = 1`, spanned by `(1, 1, 1, 1)`.
- Negative control: the cut vector of `S = {0}` on `C₄` is `(1, 0, 0, -1)`, orthogonal to
  `(1, 1, 1, 1)`; the vector `(1, 0, 0, 0)` is not orthogonal to it and is not a cut vector.

*Needs:* 1.1; Mathlib's Laplacian kernel.

## Layer 2: the matrix-tree theorems

### 2.1 Weights, spanning trees and rooted forests

Definitions: `spanningTrees G` (edge sets `F ⊆ E` with `fromEdgeSet F` a tree);
`numSpanningTrees G`; `rootedForests G R` for `R : Finset V` (acyclic edge sets in which every
vertex is joined to exactly one vertex of `R`); `forestWeight w F = ∏_{e ∈ F} w e`;
`weightMatrix G w`. Basic API, not separate targets: membership in `spanningTrees` and
`rootedForests`; for nonnegative weights `G.weightMatrix w` is a weighted graph in the sense of
KernelsAndSpectralMethods 1.1; unit weights give `G.lapMatrix ℝ` (KernelsAndSpectralMethods 1.1
for the adjacency matrix); spanning trees have `n - 1` edges (Mathlib's
`SimpleGraph.IsTree.card_edgeFinset`); a tree is its only spanning tree; `numSpanningTrees` is
invariant under isomorphism and monotone under adding edges.

- **`L_w = B diag(w) Bᵀ`** (`orientedIncMatrix_mul_diagonal_mul_transpose`), and hence
  **positive semidefiniteness** for nonnegative weights (`posSemidef_laplacian_weightMatrix`).
- **Single roots** (`rootedForests_singleton`). The forests rooted at `{q}` are the spanning trees.
- **Existence** (`numSpanningTrees_pos_iff`). A graph on a nonempty vertex type has a spanning tree
  if and only if it is connected (Mathlib's `SimpleGraph.Connected.exists_isTree_le`).

The Lean statements of the first two bullets are sanity checks of the definitions.

**Suggested proof:** `L_w = B diag(w) Bᵀ` is entrywise as in 1.1, and
`xᵀ B diag(w) Bᵀ x = ∑_d w(d)(Bᵀx)_d² ≥ 0`. A forest rooted at `{q}` joins every vertex to `q`, so
it is connected and acyclic. A spanning tree of `G` is a tree `T ≤ G`, and conversely the edge set
of such a `T` lies in `spanningTrees G`.

**Checks.**
- `K₃`: `N = 3`; `C₄`: `N = 4`; `K₄`: `N = 16`. `Kₙ` for `n = 1, …, 5`: `1, 1, 3, 16, 125`,
  Cayley's numbers `n^{n-2}` of
  [SpanningTreesAndShortestPaths](../SpanningTreesAndShortestPaths/README.md), 5.2.
- `P₃` (`0 - 1 - 2`) and `R = {0, 2}`: the rooted forests are `{01}` and `{12}`. For `R = V` the
  only rooted forest is `∅`; for `R = ∅` and `n ≥ 1` there is none.
- Negative control: the edgeless graph on two vertices has `N = 0` and is not connected; the
  forests rooted at `{0}` are none, while `∅` is an acyclic edge set.

*Needs:* 1.1; KernelsAndSpectralMethods 1.1; Mathlib's trees.

### 2.2 The rooted-forest theorem

- **The rooted-forest theorem** (`det_submatrix_laplacian_weightMatrix`). For every `R ⊆ V`,
  `det L_w[V ∖ R] = ∑_{F rooted at R} ∏_{e ∈ F} w e` [Ba, Theorem 4.7, p. 52, the case of unit
  weights and `R` nonempty and proper]. For `R = V` both sides are `1` (the empty determinant and
  the empty forest); for `R = ∅` and `n ≥ 1` both are `0`.
- **Minors of `B`.** For `R ⊆ V` and a set `F` of `n - |R|` edges, the square submatrix of `B` on
  the rows off `R` and the columns over `F` has determinant `±1` if `F` is a forest rooted at
  `R`, and `0` otherwise [Ba, proof of Theorem 4.7, p. 52]. A route step, stated in prose.

**Suggested proof:** `L_w[V ∖ R] = B_R diag(w) B_Rᵀ`, with `B_R` the rows of `B` off `R`. Expand
the determinant over `(n - |R|)`-sets of edges by Tau Ceti's Cauchy–Binet formula
(`Matrix.det_mul_transpose_eq_sum_plucker_sq`, applied to `B_R diag(√w)` for nonnegative
weights, and by polynomial identity in the weights for real ones), and evaluate the squared
minors by the minor lemma. The minor lemma: if `F` is not a rooted forest, some component of
`fromEdgeSet F` meets `R` twice or not at all, or contains a cycle; the rows of a component
without a root sum to `0` on its columns, and a cycle gives a dependent set of columns. If `F` is
a rooted forest, a vertex off `R` of degree `1` in `F` gives a row with one nonzero entry, and
expansion along it reduces `F` by one edge. A second route reduces the theorem to the
principal-cofactor identity of [GeometricTopology](../GeometricTopology/README.md), 4.4.5: identify
the vertices of `R` to one vertex `r`, adding the weights of parallel edges and dropping edges
inside `R`; the cofactor at `r` is `det L_w[V ∖ R]`, and the spanning trees of the quotient are
the forests rooted at `R`.

**Checks.**
- `K₃`: `R = {2}`, the minor `det [[2, -1], [-1, 2]] = 3 = N`.
- `P₃` with weights `a = w(01)`, `b = w(12)` and `R = {0, 2}`: `L_w[{1}] = a + b`, the weights of
  the forests `{01}` and `{12}`.
- `P₃` with `R = {1}` and weights `a`, `b`: `det [[a, 0], [0, b]] = ab`, the single spanning tree.
- Negative control: `R = ∅` on `K₂`: `det L = 0`, and no forest is rooted at `∅`; the empty
  forest would contribute `1` if roots were not required.

*Needs:* 1.1, 2.1; Tau Ceti Cauchy–Binet; GeometricTopology 4.4.5 for the second route.

### 2.3 Temperley's formula and the eigenvalue form

- **Temperley's formula** (`det_lapMatrix_add_smul_of_one`). For `n ≥ 1`, `N = det(L + J/n²)`
  [BH, Proposition 1.3.4, pp. 5–6]; [Bi, Proposition 6.4, p. 39].
- **The eigenvalue form** (`card_mul_numSpanningTrees`). For `n ≥ 1`, `nN = ν₁ ⋯ ν_{n-1}`, the
  empty product for `n = 1` being `1` [CRS, Corollary 7.2.3, pp. 190–191]; for a weighted
  connected graph [Sp, Theorem 13.4.1, p. 124].
- **Multigraphs.** For a loopless multigraph with edge multiplicities `k_e`, the same identities
  hold for the weighted Laplacian with weights `k_e`, where `∏_{e ∈ T} k_e` counts the spanning
  trees of the multigraph lying over `T` [BH, Proposition 1.3.4, pp. 5–6]. This is 2.2 at integer
  weights and is not a separate target.

**Suggested proof:** for the eigenvalue form, the coefficient of `X` in the characteristic
polynomial of `L` is, by Mathlib's `Matrix.charpoly_coeff_eq_sum_minors`, `(-1)^{n-1}` times the
sum of the `n` principal minors of order `n - 1`, each equal to `N` by 2.1–2.2 with `|R| = 1`;
by `Matrix.IsHermitian.charpoly_eq` it is also `(-1)^{n-1}` times the elementary symmetric
function `e_{n-1}(ν₁, …, νₙ) = ν₁ ⋯ ν_{n-1}`, since `νₙ = 0`. For Temperley, `L` and `J` commute,
`J` vanishes on `𝟙^⊥` and `L𝟙 = 0`, so the eigenvalues of `L + J/n²` are `ν₁, …, ν_{n-1}, 1/n`;
`Matrix.IsHermitian.det_eq_prod_eigenvalues` and the eigenvalue form finish.

**Checks.**
- `K₃`: `det(L + J/9) = (1/3) · 3 · 3 = 3`; `nN = 9 = 3 · 3`.
- `C₄`: `ν = 4, 2, 2, 0`, `(4 · 2 · 2)/4 = 4`. `K₄`: `(4 · 4 · 4)/4 = 16`.
- `K₁`: `N = 1`; Temperley gives `det(0 + 1) = 1`, and the product is empty.
- Negative control: the edgeless graph on two vertices has `N = 0` and `det(L + J/4) = 0`. With
  `J/n` in place of `J/n²`, `K₂` would give `det [[3/2, -1/2], [-1/2, 3/2]] = 2 ≠ 1`.

*Needs:* 2.1, 2.2; LaplacianEigenvaluesOfGraphs 1.1; Mathlib's principal-minor expansion of the
characteristic polynomial and spectral theorem.

## Layer 3: spanning trees and effective resistance

Definitions: none; the networks, their graph, Laplacian, grounded Laplacian, voltage and
effective resistance are those of ElectricalNetworksAndRandomWalks 1.1 and 2.1, and
`unitNetwork` that of LaplacianEigenvaluesOfGraphs 7.1, copied verbatim into `Suggested.lean`.

### 3.1 Kirchhoff's formula

- **Networks as weighted graphs** (`laplacian_eq_laplacian_weightMatrix`). The Laplacian of a
  network is `laplacian (N.graph.weightMatrix N.edgeCond)`; loops enter neither side. So Layer 2
  applies to the Laplacian of a network. A sanity check of the copied definitions.
- **Kirchhoff's formula** (`effResistance_eq_sum_rootedForests_div`). For `a ≠ z`,
  `R(a ↔ z) = (∑_{F rooted at {a, z}} ∏_{e ∈ F} c(e)) / ∑_T ∏_{e ∈ T} c(e)`: the weight of the
  spanning forests with two components, one containing `a` and the other `z`, over the weight of
  the spanning trees [Ba, (10.3), p. 133, with Theorem 4.7, p. 52]. On a disconnected network both
  sides are `0`, so no connectivity is assumed.

**Suggested proof:** the diagonal of a loop cancels in `diag(c(x)) - (c(x, y))`, and off the
diagonal both matrices are `-c(x, y)` on the pairs of positive conductance and `0` elsewhere. By
Cramer's rule (Mathlib's `Matrix.inv_def` and `Matrix.adjugate`) the entry at `a` of the column
`a` of the inverse of the grounded Laplacian `L[V ∖ {z}]` is `det L[V ∖ {a, z}] / det L[V ∖ {z}]`;
apply 2.2 with `R = {a, z}` and `R = {z}` and 2.1. If the network is disconnected,
`det L[V ∖ {z}] = 0`, the inverse is `0` by `Matrix.nonsing_inv_apply_not_isUnit`, and the right
side divides by `0`.

**Checks.**
- `K₂` with conductance `c`: the only forest rooted at `{0, 1}` is `∅` and the only tree has
  weight `c`, so `R = 1/c`.
- Unit `K₃`: two forests rooted at `{a, z}` (the third vertex joined to `a` or to `z`) and three
  trees, so `R = 2/3`, one unit resistor in parallel with two in series.
- Unit `C₄` with vertices `a, b, c, d` in cyclic order: the forests rooted at `{a, b}` are
  `{bc, cd}`, `{cd, da}` and `{bc, da}`, so `R(a ↔ b) = 3/4`; four forests are rooted at
  `{a, c}`, so `R(a ↔ c) = 1`.
- Negative control: `a ≠ z` is needed: for `a = z` the forests rooted at `{a}` are the spanning
  trees and the right side is `1` on a connected network, while `R(a ↔ a) = 0`.
- Negative control: on `K₂` (vertices `0`, `1`) plus an isolated vertex `w`, `R(0 ↔ w) = 0`,
  there is no spanning tree, and one forest, `{01}`, is rooted at `{0, w}`; the right side is
  `1/0 = 0`, so the formula holds, while the cleared form `R · ∑_T = ∑_F` would read `0 = 1`.

*Needs:* 2.1, 2.2; ElectricalNetworksAndRandomWalks 1.1 and 2.1 (copied definitions).

### 3.2 Random spanning trees

- **Edge probabilities** (`sum_forestWeight_mem_div`). A spanning tree chosen with probability
  proportional to its weight contains the pair `az` with probability `c(a, z) R(a ↔ z)`
  [Sp, Theorem 13.5.1, p. 126]. No hypothesis is needed: for `a = z`, for non-adjacent `a`, `z`
  and on a disconnected network both sides are `0`.

**Suggested proof:** for an edge `az`, `T ↦ T ∖ {az}` is a bijection from the spanning trees
through `az` onto the forests rooted at `{a, z}`, which divides the weight by `c(a, z)`; apply
3.1.

**Checks.**
- Unit `K₃`: each edge lies in `2` of the `3` trees, and `2/3 = 1 · R`.
- Unit `C₄`: each edge lies in `3` of the `4` trees, and `3/4 = R(a ↔ b)`. Summing over the four
  edges gives `3 = n - 1`, Foster's theorem of ElectricalNetworksAndRandomWalks 3.3.
- Negative control: for the non-adjacent pair `a`, `c` of `C₄`, no tree contains `s(a, c)` and
  `c(a, c) = 0`, while `R(a ↔ c) = 1`; the formula with `R` alone would give `1`.

*Needs:* 3.1.

### 3.3 Trees

- **Resistance in a tree is distance** (`SimpleGraph.IsTree.effResistance_unitNetwork`). In the
  unit network of a tree, `R(x ↔ y) = dist(x, y)` [Ba, Corollary 4.10, p. 53, which gives
  `det L(i, j | i, j) = dist(i, j)` for a tree, with (10.3), p. 133].

**Suggested proof:** the forests of a tree rooted at `{x, y}` are the tree minus one edge of the
path from `x` to `y` (Mathlib's `SimpleGraph.IsTree.existsUnique_path`), and the tree is its only
spanning tree; apply 3.1.

**Checks.**
- Unit `P₃`: `R(0 ↔ 2) = 2 = dist(0, 2)`; `R(0 ↔ 1) = 1`.
- Unit `K_{1,3}`: two leaves are at resistance `2`.
- Negative control: `C₄` is not a tree, and `R(a ↔ c) = 1 ≠ 2 = dist(a, c)`.

*Needs:* 3.1; LaplacianEigenvaluesOfGraphs 7.1 (copied definition); Mathlib's trees and
`SimpleGraph.dist`.

## Layer 4: the critical group

### 4.1 The critical group and its order

Definitions: `sumZeroLattice V = {z ∈ ℤⱽ : ∑ z = 0}`; `criticalGroup G`, the quotient of
`sumZeroLattice V` by the image of `L` over `ℤ`; `reducedLapMatrix G q`, `L` with row and column
`q` deleted. Basic API, not separate targets: the image of `L` lies in `sumZeroLattice V`; the
critical group is invariant under graph isomorphism, and that of a tree is trivial.

- **The reduced Laplacian** (`nonempty_criticalGroup_addEquiv_reduced`). For every `q`,
  `K(G) ≅ ℤ^{V∖{q}} / L[V∖{q}] ℤ^{V∖{q}}`.
- **The order** (`nat_card_criticalGroup`). For `n ≥ 1`, `|K(G)| = N`, with `Nat.card = 0` for an
  infinite group [GR, Theorem 14.13.3 and the count after it, p. 329, for connected graphs]. With
  2.1, the group is finite if and only if `G` is connected; not a separate target.

**Suggested proof:** restriction to `V ∖ {q}` is an isomorphism of `sumZeroLattice V` onto
`ℤ^{V∖{q}}`, and `L e_q = -∑_{y ≠ q} L e_y`, which gives the presentation. For the order, Tau
Ceti's `Matrix.card_quotient_range_mulVecLin_eq_card_quotient_span_det` gives `|det L[V∖{q}]|`
when the determinant is nonzero, and `det L[V∖{q}] = N` by 2.1–2.2; when `G` is disconnected the
determinant is `0`, the reduced Laplacian has a nonzero kernel over `ℚ`, and the cokernel is
infinite.

**Checks.**
- `K₂`: trivial; `K₃`: `ℤ/3`; `C₄`: `ℤ/4`; `K₄`: the reduced Laplacian
  `[[3, -1, -1], [-1, 3, -1], [-1, -1, 3]]` has Smith form `diag(1, 4, 4)`, so `(ℤ/4)²` of
  order `16`.
- `K₁`: `sumZeroLattice V` is `0`, the group is trivial, and `N = 1`.
- Negative control: the edgeless graph on two vertices has `L = 0`, critical group `≅ ℤ`
  (infinite) and `N = 0`. On the empty type `sumZeroLattice V = 0` gives order `1`, while
  `N = 0` (the empty graph is not connected), which is why `Nonempty V` is assumed.

*Needs:* 2.1, 2.2; Tau Ceti cokernel orders; Mathlib Smith normal form
(`Module.Basis.SmithNormalForm`).

### 4.2 Cut and flow lattices

Definitions: for an orientation, `integerPoints`, `cutLattice G O = Bᵀℤⱽ` and
`flowLattice G O = ker B ∩ ℤ^O` inside `ℚ^O`;
`dualLattice Λ = {x ∈ span_ℚ Λ : x ⬝ y ∈ ℤ for y ∈ Λ}`, Mathlib's
`LinearMap.BilinForm.dualSubmodule` of the dot product cut down to `span_ℚ Λ`. Basic API, not
separate targets: `Λ ≤ dualLattice Λ` for an integral lattice; the flow lattice is Tau Ceti's
`TauCeti.SerreGraph.cycleLattice` through the bridge of 1.1.

- **Lattice descriptions** (`nonempty_criticalGroup_addEquiv_dual`). For connected `G`,
  `K(G) ≅ C*/C ≅ F*/F` for the cut lattice `C` and the flow lattice `F` [GR, §14.8, pp. 319–320,
  for `C*/C ≅ F*/F`; §14.7, pp. 317–319, for their orders `N`]. [GR, §14.13, p. 329] leaves the
  isomorphism with the critical group as an exercise; the route below is the proof.

**Suggested proof:** `Bᵀ` maps `ℤⱽ` onto `C`, and `x ↦ Bᵀ L⁺ x` (with `L⁺` the inverse of `L` on
`𝟙^⊥`) maps `sumZeroLattice V` onto `C*`, sending the image of `L` onto `C`; so `K(G) ≅ C*/C`.
The orthogonal projections onto the cut and the cycle space map `ℤ^O` onto `C*` and `F*`, with
kernels `F` and `C` [GR, Theorem 14.8.1, p. 320], which gives `C*/C ≅ ℤ^O/(C ⊕ F) ≅ F*/F`.

**Checks.**
- `K₃` with darts `0 → 1`, `1 → 2`, `0 → 2`: `C` has rank `2` and the Gram determinant of a
  basis is `3`; `F = ℤ(1, 1, -1)` with `(1, 1, -1) ⬝ (1, 1, -1) = 3`, so `F*/F ≅ ℤ/3`.
- `C₄`: `F = ℤ(1, 1, 1, 1)`, `F*/F ≅ ℤ/4`.
- Negative control: `F*` is taken inside `span_ℚ F`; the dual of `F` inside all of `ℚ^O` would
  contain the rational orthogonal complement of `F`, and the quotient by `F` would be infinite.

*Needs:* 1.1, 1.2, 4.1; Mathlib dual lattices.

## Layer 5: the distance matrix of a tree

### 5.1 The Laplacian and the distance matrix

Definitions: `distMatrix G`, the matrix of `SimpleGraph.dist`; `treeDegreeVec G = (2 - d(x))_x`.
Basic API: `isHermitian_distMatrix`, which names the eigenvalues; zero diagonal; for a tree,
`𝟙ᵀτ = 2` [Ba, Lemma 9.6, p. 120], and every vertex other than a root `r` has exactly one
neighbour closer to `r`.

- **`LΔ = τ𝟙ᵀ - 2I`** (`IsTree.lapMatrix_mul_distMatrix`) [Ba, Lemma 9.8, p. 121].
- **`Δτ = (n - 1)𝟙`** (`IsTree.distMatrix_mulVec_treeDegreeVec`) [Ba, Lemma 9.7, p. 120].

**Suggested proof:** column `r` of `Δ` is `x ↦ dist(x, r)`; at `x ≠ r` one neighbour is closer to
`r` and `d(x) - 1` are farther, so `(LΔ)_{xr} = 2 - d(x)`; at `x = r` every neighbour is farther,
giving `-d(r) = τ_r - 2`. For `Δτ` at `x`, count each edge `yz` by its end nearer to `x`: every
vertex `y ≠ x` is the farther end of exactly one edge, so
`∑_y d(y) dist(x, y) = 2∑_y dist(x, y) - (n - 1)`, and
`(Δτ)_x = 2∑_y dist(x, y) - ∑_y d(y) dist(x, y) = n - 1`.

**Checks.**
- `P₃`: `Δ = [[0, 1, 2], [1, 0, 1], [2, 1, 0]]`, `τ = (1, 0, 1)`, `Δτ = (2, 2, 2)`.
- `K_{1,3}`: `τ = -1` at the centre and `1` at the leaves, `𝟙ᵀτ = 2`, `Δτ = 3 · 𝟙`.
- Negative control: `C₄` is not a tree; `τ = 0` and `Δτ = 0 ≠ 3 · 𝟙`.

*Needs:* Mathlib's `SimpleGraph.lapMatrix`, `SimpleGraph.dist` and trees.

### 5.2 Inverse, determinant and inertia

- **Graham–Lovász** (`IsTree.inv_distMatrix`). For `n ≥ 2`, `Δ⁻¹ = -½L + ττᵀ/(2(n - 1))`
  [Ba, Theorem 9.9, p. 122].
- **Graham–Pollak** (`IsTree.det_distMatrix`). `det Δ = (-1)^{n-1}(n - 1)2^{n-2}`
  [Ba, Theorem 9.2, p. 116]; both sides are `0` for `n = 1`.
- **Inertia** (`IsTree.inertia_distMatrix`). For `n ≥ 2`, `Δ` has one positive and `n - 1`
  negative eigenvalues [Ba, Lemma 9.15, p. 125].

**Suggested proof:** for the inverse, multiply by `Δ` and use 5.1 and `𝟙ᵀτ = 2`. For the
determinant with `n ≥ 3`, take a leaf `x` with neighbour `y`; subtracting row and column `y` from
row and column `x` turns `Δ` into the bordered matrix `[[-2, 𝟙ᵀ], [𝟙, Δ']]`, `Δ'` the distance
matrix of the tree with `x` removed; by the Schur complement (`Matrix.det_fromBlocks₁₁`) and the
inverse for that tree (`𝟙ᵀΔ'⁻¹𝟙 = 2/(n - 2)`), `det Δ = det Δ' · (-2 - 2/(n - 2))`. For the
inertia, `Δ` is invertible, and by the inverse formula `Δ⁻¹` is negative semidefinite on `τ^⊥`
(since `L` is positive semidefinite), so `Δ` has at most one positive eigenvalue; the trace of `Δ`
is `0`, so it has at least one. ([Ba] argues by induction and interlacing instead.)

**Checks.**
- `P₃`: `det = 4 = (-1)² · 2 · 2`; eigenvalues `1 + √3`, `-2` and `1 - √3`: one positive and two
  negative.
- `K₂`: `Δ = Δ⁻¹ = [[0, 1], [1, 0]]` and `-½L + ½ττᵀ = [[0, 1], [1, 0]]`.
- `K_{1,3}`: `det = -12 = (-1)³ · 3 · 4`.
- Negative control: `C₄` is not a tree; its distance matrix is the circulant `(0, 1, 2, 1)` with
  eigenvalues `4, 0, -2, -2` and determinant `0 ≠ -12`.

*Needs:* 5.1; Mathlib Schur complements and the spectral theorem.

## Layer 6: Fiedler's bounds and sums of small eigenvalues

### 6.1 Fiedler's upper bounds

- **Upper bounds** (`algebraicConnectivity_le`). For `n ≥ 2`, `ν_{n-1} ≤ nδ/(n - 1)`
  [CRS, Remarks 7.1.4, (7.6), p. 186]; [Ba, Corollary 8.17, p. 111, for connected graphs]; and if
  `G ≠ Kₙ` then `ν_{n-1} ≤ κ` [CRS, Corollary 7.4.6, p. 198]; [NP, Remark 2.7.4, p. 91]. With Tau
  Ceti's `SimpleGraph.vertexConnectivity_le_edgeConnectivity` and
  `SimpleGraph.edgeConnectivity_le_minDegree` this gives the chain `ν_{n-1} ≤ κ ≤ κ' ≤ δ`.

**Suggested proof:** for the first bound take the Rayleigh quotient of `u = e_x - 𝟙/n` at a vertex
`x` of minimum degree (Mathlib's `SimpleGraph.exists_minimal_degree_vertex`): `u ⊥ 𝟙`,
`uᵀLu = d(x)` and `‖u‖² = (n - 1)/n`, and the variational formula for `ν_{n-1}` (GraphSpectra
1.5) gives `ν_{n-1} ≤ d(x)n/(n - 1)`. For the second write `k = κ`. If `k + 2 ≤ n`, the graph is
not `(k + 1)`-vertex-connected (`SimpleGraph.isVertexConnected_iff_le_vertexConnectivity`), so by
`SimpleGraph.isVertexConnected_iff` a set `S` of fewer than `k + 1` vertices leaves `G - S` not
preconnected; Fiedler's vertex-cut bound (LaplacianEigenvaluesOfGraphs 3.2) gives
`ν_{n-1} ≤ |S| ≤ k`. Otherwise `k = n - 1`; two nonadjacent vertices `x, y` exist since `G ≠ Kₙ`,
and `S = V ∖ {x, y}` has `n - 2 ≤ k` vertices and separates them.

**Checks.**
- `ν_{n-1}(P₃) = 1 = κ(P₃)`; `ν_{n-1}(C₄) = 2 = κ(C₄)`; `ν_{n-1}(K_{1,3}) = 1 = κ`;
  `ν_{n-1}(K_{2,3}) = 2 = min(2, 3)` [NP, Example 2.7.5(a), p. 92].
- `ν_{n-1}(P₃) = 1 ≤ 3 · 1/2`; `ν_{n-1}(K₃) = 3 = 3 · 2/2`, equality in the first bound.
- Negative control: for `K₄`, `ν_{n-1} = 4 > κ = 3`; the hypothesis `G ≠ Kₙ` cannot be dropped.
- `algebraicConnectivity` of a one-vertex graph is the junk value `0`.

*Needs:* GraphSpectra 1.5; LaplacianEigenvaluesOfGraphs 1.1 and 3.2; Tau Ceti connectivity.

### 6.2 Fiedler's lower bound

- **Lower bound** (`two_mul_edgeConnectivity_mul_le_algebraicConnectivity`). For `n ≥ 2`,
  `ν_{n-1} ≥ 2κ'(1 - cos(π/n))` [CRS, Remarks 7.4.8, p. 199]. [NP, Remark 2.7.6, p. 92] prints
  `2π` in place of `π`, which is false for paths. Equality holds for the path `Pₙ`.

**Suggested proof:** let `f ⊥ 𝟙` be a unit eigenvector for `ν_{n-1}` and number the vertices so
that `f₁ ≤ ⋯ ≤ fₙ`. For an edge `ij` with `i < j`, `(f_j - f_i)² ≥ ∑_{i ≤ k < j}(f_{k+1} - f_k)²`
since all gaps are nonnegative. Each gap `(k, k + 1)` is crossed by the cut `{1, …, k}`, which
has at least `κ'` edges: deleting them separates the cut, so this is Mathlib's
`SimpleGraph.IsEdgeConnected` with Tau Ceti's `SimpleGraph.isEdgeConnected_iff_le_edgeConnectivity`.
Hence `ν_{n-1} = ∑_{ij ∈ E}(f_i - f_j)² ≥ κ' ∑_k (f_{k+1} - f_k)² ≥ κ' ν_{n-1}(Pₙ)`, the last step
by the variational formula (GraphSpectra 1.5) for the path, and `ν_{n-1}(Pₙ) = 2(1 - cos(π/n))`
by the Laplacian spectrum of the path (GraphSpectra 2.2). The quadratic forms are GraphSpectra
1.1.

**Checks.**
- `ν_{n-1}(C₄) = 2 ≥ 2 · 2 · (1 - cos(π/4)) ≈ 1.17`.
- `ν_{n-1}(P₄) = 2 - √2 = 2(1 - cos(π/4))`, equality.
- Negative control: with `2π` in place of `π`, the bound for `P₄` would read
  `2(1 - cos(π/2)) = 2 > 2 - √2`, which is false.

*Needs:* GraphSpectra 1.1, 1.5 and 2.2; LaplacianEigenvaluesOfGraphs 1.1; Tau Ceti connectivity.

### 6.3 Energy minimization

- **Energy minimization** (`isLeast_sum_quadForm_lapMatrix`). For `k + 1 ≤ n`, over orthonormal
  `x₁, …, x_k ⊥ 𝟙` the least value of `∑ᵢ xᵢᵀLxᵢ` is `ν_{n-1} + ⋯ + ν_{n-k}` (the Lean indices
  `n - 2, …, n - 1 - k`), attained by orthonormal eigenvectors of `ν_{n-1}, …, ν_{n-k}`
  [Sp, Theorem 3.2.1, p. 32]; [GR, Theorem 13.4.1, p. 287]. The sources assume `G` connected; the
  statement holds for every graph, since `𝟙` is always an eigenvector for `νₙ = 0`.
- **Representations.** Equivalently, over `ρ : V → ℝᵏ` with `∑ₓ ρ(x) = 0` and orthonormal
  coordinate columns, the least energy `∑_{xy ∈ E} ‖ρ(x) - ρ(y)‖²` is `ν_{n-1} + ⋯ + ν_{n-k}`
  [GR, Theorem 13.4.1, p. 287], by the edge-sum form of the quadratic form (GraphSpectra 1.1). Not
  a separate target.

**Suggested proof:** Tau Ceti's Ky Fan principle
`LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` for `-L` and the orthonormal
family `n^{-1/2}𝟙, x₁, …, x_k`, whose first member contributes `0`; equality at eigenvectors.

**Checks.**
- `P₃`, `k = 2`: `ν₂ + ν₁ = 1 + 3 = 4 = tr L`.
- `K₃`, `k = 1`: the least value is `3`, at every unit vector orthogonal to `𝟙`.
- Negative control: without the constraint `x ⊥ 𝟙`, the least value for `k = 1` would be `0`, at
  `𝟙/√n`.

*Needs:* GraphSpectra 1.1; LaplacianEigenvaluesOfGraphs 1.1; Tau Ceti Ky Fan.

### 6.4 The spectral gap of a weight with constant degree

- **The bridge** (`fiedlerValue_eq_algebraicConnectivity_div`). If a weight matrix `W` has
  constant degree `k > 0` and Laplacian `G.lapMatrix ℝ` (for example `W = G.adjMatrix ℝ` for
  `k`-regular `G`), and `n ≥ 2`, then the normalized spectral gap `fiedlerValue W` of
  KernelsAndSpectralMethods 2.1 is `ν_{n-1}/k`. Regular-graph statements pass between the two
  Laplacians through it.

**Suggested proof:** with constant degrees, the constraint `∑ dᵢ gᵢ = 0` is `g ⊥ 𝟙` and the
denominator `∑ dᵢ gᵢ²` is `k‖g‖²`; so the infimum is `1/k` times the infimum of the Rayleigh
quotient of `L` on `𝟙^⊥`, which is `ν_{n-1}` by the variational formula (GraphSpectra 1.5).

**Checks.**
- `K₃` is `2`-regular with `ν_{n-1} = 3`, and `fiedlerValue = 3/2`; `C₄` has `ν_{n-1} = 2` and
  `fiedlerValue = 1`; the Petersen graph has `ν_{n-1} = 2` and `fiedlerValue = 2/3`.
- Negative control: `P₃` is not regular; `fiedlerValue = 1` while `ν_{n-1}` divided by the
  average degree `4/3` is `3/4`.

*Needs:* GraphSpectra 1.5; LaplacianEigenvaluesOfGraphs 1.1; KernelsAndSpectralMethods 1.1 and
2.1.

## Layer 7: the normalized Laplacian

### 7.1 The multiplicity of the eigenvalue 2

- **Weighted graphs** (`finrank_eigenspace_two_normalizedLaplacian`). Let `W` be a weighted graph
  in the sense of KernelsAndSpectralMethods 1.1 (symmetric, nonnegative) without loops,
  `W x x = 0`. The eigenvalue `2` of `𝓛 = normalizedLaplacian W` has multiplicity equal to the
  number of bipartite components of `positiveGraph W` with at least two vertices. No degree
  hypothesis is needed: without loops a vertex of degree `0` is an isolated vertex of
  `positiveGraph W`, where `𝓛` has a zero row and column, and it counts on neither side; a pair
  with weight `0` is not an edge of `positiveGraph W`. KernelsAndSpectralMethods 1.4 owns the
  existence form ("`2` is an eigenvalue iff some component is bipartite", with positive degrees).
  For simple graphs, [CRS, Corollary 7.7.4, pp. 214–215] states that `G` is bipartite exactly when
  `2` is an eigenvalue with the multiplicity of `0`, and its proof shows that `2` is simple on a
  connected bipartite graph; the count over components is [Ch, Lemma 1.7(v)–(vi), pp. 6–7]. The
  weighted count is an adaptation, with the route below.
- **The simple-graph case.** For `W = G.adjMatrix ℝ`, which has no loops and positive graph `G`,
  the multiplicity of `2` is the number of bipartite components of `G` with at least two
  vertices; without isolated vertices, the number of bipartite components. Not a separate target.

**Suggested proof:** let `P` be the set of vertices of positive degree; `𝓛` vanishes off `P × P`,
so the `2`-eigenvectors vanish off `P`. On `P`, `2I - 𝓛 = D^{-1/2}(D + W)D^{-1/2}` and, without
loops, `uᵀ(D + W)u = ½ ∑_{x,y} W x y (u x + u y)²`, so the kernel of `D + W` consists of the `u`
with `u x = -u y` whenever `W x y > 0`: on a component of `positiveGraph W` inside `P` such a `u`
vanishes unless the component is bipartite, and is then a multiple of the signed indicator of
its `2`-colouring. Conjugation by the invertible `D^{-1/2}` on `P` preserves the dimension of the
kernel.

**Checks.**
- Weighted `P₃` with weights `2` on `01` and `5` on `12`: `𝓛` has eigenvalues `0, 1, 2`, and the
  positive graph `P₃` is one bipartite component, multiplicity `1`.
- `P₃` with weight `2` on `01` and `0` on `12`: the positive graph is `K₂ + K₁`, `𝓛` has
  eigenvalues `0, 0, 2`, multiplicity `1`. Negative control: counting every bipartite component,
  the isolated vertex included, would give `2`.
- Negative control for the loop hypothesis: `W = [[1, 1], [1, 0]]`, an edge with a loop at `0`,
  has `𝓛` eigenvalues `0, 3/2`, while its positive graph `K₂` is one bipartite component.
- Simple graphs: multiplicity `1` for `K₂`, `P₃` and `C₄`; `2` for two disjoint copies of `K₂`;
  `0` for `K₃`.

*Needs:* KernelsAndSpectralMethods 1.1–1.4; GraphSpectra 1.1 (the kernel of `Q = D + A`, the
case of unit weights).

### 7.2 Trace and extreme eigenvalues

- **Normalized Laplacian bounds** (`normalizedLaplacian_bounds`). For `n ≥ 2` and no isolated
  vertices: `tr 𝓛 = n`; `λ₁ = n/(n - 1)` iff `G = Kₙ`; `λ₁ ≤ 1` if `G ≠ Kₙ`; the largest
  eigenvalue is at least `n/(n - 1)` [Ch, Lemma 1.7(i)–(iii), pp. 6–7]; [CRS, Theorem 7.7.2,
  pp. 213–214]. KernelsAndSpectralMethods 2.1 owns `λ₁ ≤ n/(n - 1)`.

**Suggested proof:** the diagonal of `𝓛` is `1`. For nonadjacent `s ≠ t`, the vector
`g = e_s/d_s - e_t/d_t` has `∑ dᵢ gᵢ = 0` and Rayleigh quotient
`(1/d_s + 1/d_t)/(1/d_s + 1/d_t) = 1`, which bounds `λ₁` by the definition of `fiedlerValue`
(KernelsAndSpectralMethods 2.1). For `Kₙ`, `𝓛 = (n/(n - 1))(I - J/n)`, computed directly, or by 6.4,
since `Kₙ` is `(n - 1)`-regular with `ν_{n-1} = n`. The eigenvalue `0` occurs
(KernelsAndSpectralMethods 1.3), and the other `n - 1` eigenvalues sum to `n`, so the largest is at
least their mean.

**Checks.**
- `K₃`: `tr 𝓛 = 3`, `λ₁ = 3/2 = n/(n - 1)`.
- `P₃`: `λ₁ = 1`, `λ₂ = 2 ≥ 3/2`; `C₄`: `λ₁ = 1`.
- Negative control: `K₁ + K₂` has an isolated vertex and `tr 𝓛 = 2 ≠ 3`, so the trace identity
  needs the hypothesis.

*Needs:* KernelsAndSpectralMethods 1.1–1.3 and 2.1; 6.4 for the alternative route at `Kₙ`.

## Layer 8: Laplacian bounds on cuts

### 8.1 Cut bounds

- **Cut bounds** (`cut_bounds`). On a nonempty vertex type, for every `S ⊆ V`,
  `ν_{n-1}|S|(n - |S|)/n ≤ #(G.interedges S Sᶜ) ≤ ν₁|S|(n - |S|)/n` [CRS, Theorem 7.5.1, p. 200];
  [Mo, Lemma 4.1, p. 123].
- **Maximum cut and bisection.** Every cut has at most `nν₁/4` edges [CRS, Corollary 7.5.2,
  p. 200]; [GR, Lemma 13.7.4, p. 293], and if `2|S| = n` then `S` is crossed by at least
  `nν_{n-1}/4` edges [CRS, Corollary 7.5.3, p. 200, for `n` even]; [Mo, Corollary 4.2, p. 124].
  Corollaries of the cut bounds by `|S|(n - |S|) ≤ n²/4`, with equality at `|S| = n/2`, and
  `ν₁ ≥ 0`; not separate targets.

**Suggested proof:** for `S = ∅` and `S = V` all three sides vanish. Otherwise the vector
`u = 𝟙_S - (|S|/n)𝟙` is orthogonal to `𝟙`, with `uᵀLu = 𝟙_Sᵀ L 𝟙_S`, which is the number of
edges leaving `S` by Mathlib's `SimpleGraph.lapMatrix_mulVec_apply'`, and `‖u‖² = |S|(n - |S|)/n`;
compare its Rayleigh quotient with `ν_{n-1}` (GraphSpectra 1.5) and with `ν₁`
([RandomMatrices](../RandomMatrices/README.md) 1.2 for `G.lapMatrix ℝ` at the index `0`).

**Checks.**
- `C₄` with `S` two adjacent vertices: two crossing edges, bounds `2 · 2 · 2/4 = 2` and
  `4 · 2 · 2/4 = 4`; with `S` two opposite vertices, four crossing edges, equality in the upper
  bound. The maximum cut `4 = 4 · 4/4` and the bisection width `2 = 4 · 2/4` are attained.
- `K₃`, `S = {x}`: two crossing edges `= 3 · 1 · 2/3`, equality in both bounds since
  `ν_{n-1} = ν₁`.
- `K₂`, `S = {0}`: `#(G.interedges S Sᶜ) = 1`; a count over both orders of each crossing pair
  would give `2` and violate the upper bound `2 · 1 · 1/2 = 1`.
- Negative control: the lower bound with `ν₁` in place of `ν_{n-1}` fails for `P₃`, `S = {0}`:
  one crossing edge `< 3 · 1 · 2/3`.

*Needs:* GraphSpectra 1.5; LaplacianEigenvaluesOfGraphs 1.1; RandomMatrices 1.2.

## Layer 9: the largest Laplacian eigenvalue

### 9.1 Comparison with the signless Laplacian

- **`ν₁ ≤ q₁`** (`largestLapEigenvalue_le_signlessLapEigenvalues`). For connected `G`, equality
  holds if and only if `G` is bipartite [BH, Proposition 3.9.1(i), p. 50].

**Suggested proof:** for a unit eigenvector `u` of `L` for `ν₁`,
`ν₁ = ∑_{xy ∈ E}(u_x - u_y)² ≤ ∑_{xy ∈ E}(|u_x| + |u_y|)² = |u|ᵀQ|u| ≤ q₁`, by the quadratic forms
of GraphSpectra 1.1 and the max–min formula of RandomMatrices 1.2. For bipartite `G`, `L` and `Q`
are similar (GraphSpectra 1.1, sign conjugation). If `G` is connected and `ν₁ = q₁`, then `|u|`
is an eigenvector of `Q` for `q₁`; `Q` is nonnegative and irreducible, so `|u| > 0` everywhere
by Tau Ceti's Perron–Frobenius theorem
(`Matrix.IsIrreducible.exists_pos_eq_smul_of_mulVec_eq_smul`); equality on every edge forces
`u_x u_y < 0`, and the sign of `u` is a proper `2`-colouring.

**Checks.**
- `C₄`: `ν₁ = q₁ = 4`, bipartite.
- `K₃`: `ν₁ = 3 < q₁ = 4`, not bipartite.
- Negative control for connectivity: `C₄ + K₃` has `ν₁ = q₁ = 4` but is not bipartite.

*Needs:* GraphSpectra 1.1; LaplacianEigenvaluesOfGraphs 1.1; RandomMatrices 1.2; Tau Ceti
Perron–Frobenius.

### 9.2 Equality cases

Definitions: `maxEdgeDegreeSum G = max_{xy ∈ E}(d(x) + d(y))`, and `0` without edges;
`IsBipartiteSemiregular G`, a proper `2`-colouring with constant degree on each colour class.
Basic API, not separate targets: `maxEdgeDegreeSum` is at most twice `maxDegree`; it is positive
exactly when `G` has an edge; a regular bipartite graph is bipartite semiregular; both notions
are invariant under graph isomorphism.

- **Equality cases** (`largestLapEigenvalue_eq_iff`). For connected `G` with `n ≥ 2`:
  - `ν₁ = Δ + 1` iff `Δ = n - 1` [BH, Proposition 3.9.3, p. 51];
  - `ν₁ = max(d(x) + d(y))` iff `G` is bipartite semiregular [BH, Corollary 3.9.2, p. 51, where
    the equality case reads "bipartite regular or semiregular"];
  - `ν₁ = 2Δ` iff `G` is bipartite and regular, a corollary of the second case with the route
    below.

  The inequalities themselves are LaplacianEigenvaluesOfGraphs 4.1 and 4.2 [Ba, Theorem 4.12,
  p. 54; Corollary 4.14, p. 55].

**Suggested proof:**
- First case. If `Δ = n - 1`, a vertex adjacent to all others is isolated in `Gᶜ`, so `Gᶜ` is
  disconnected and `ν₁ = n` (LaplacianEigenvaluesOfGraphs 2.1 with 1.2). Conversely let `c` have
  degree `Δ` and `x` be `Δ` at `c`, `-1` at its neighbours and `0` elsewhere. Then `‖x‖² = Δ(Δ + 1)`
  and `xᵀLx = Δ(Δ + 1)² + e`, with `e` the number of edges from a neighbour of `c` to a vertex
  outside the closed neighbourhood of `c` (GraphSpectra 1.1). If `Δ < n - 1`, connectivity gives
  `e ≥ 1`, and `ν₁ ≥ xᵀLx/‖x‖² > Δ + 1` (RandomMatrices 1.2).
- Second case. `Q = UUᵀ` and `UᵀU = 2I + A(L(G))` have the same nonzero spectrum (GraphSpectra
  1.1 and 2.5), so `q₁ = 2 + θ₁(L(G))`, and the line graph `L(G)` has maximum degree
  `max(d(x) + d(y)) - 2`. The index of a graph is at most its maximum degree, with equality for a
  connected graph exactly when it is regular (GraphSpectra 3.3). The line graph of a connected
  graph is connected (two edges are joined through a path between their ends; a route step
  stated in prose). So `ν₁ ≤ q₁ ≤ max(d(x) + d(y))`, and equality forces `ν₁ = q₁`, hence
  bipartiteness (9.1), and a regular line graph, that is a constant `d(x) + d(y)` on the edges;
  along a path the degrees then alternate, which is semiregularity. Conversely, for a
  semiregular bipartite graph with degrees `a` and `b` the line graph is `(a + b - 2)`-regular,
  so `ν₁ = q₁ = a + b` (9.1).
- Third case. `ν₁ ≤ max(d(x) + d(y)) ≤ 2Δ`; equality forces semiregularity and an edge between
  two vertices of degree `Δ`, so both classes have degree `Δ`.

**Checks.**
- `K_{1,3}`: spectrum `0, 1, 1, 4`; `ν₁ = 4 = Δ + 1` with `Δ = n - 1`; also
  `4 = max(d(x) + d(y))`, bipartite semiregular.
- `C₄`: `ν₁ = 4 = 2Δ = max(d(x) + d(y))`, regular and bipartite.
- `P₃`: `ν₁ = 3 = Δ + 1 = max(d(x) + d(y))`; bipartite semiregular with classes `{1}` and
  `{0, 2}`. `P₄`: `ν₁ = 2 + √2`, strictly between `Δ + 1 = 3` and `max(d(x) + d(y)) = 4`; `P₄` is
  bipartite but not semiregular.
- `K₃`: `ν₁ = 3 = Δ + 1` with `Δ = n - 1`, and `ν₁ < 4 = 2Δ`.
- Negative controls for connectivity: `K_{1,3} + K₂` has `ν₁ = 4 = Δ + 1` but `Δ = 3 < n - 1`;
  `P₃ + K₂` has `ν₁ = 3 = max(d(x) + d(y))` but is not bipartite semiregular (the centre of `P₃`
  and one end of `K₂` share a colour class).

*Needs:* 9.1; LaplacianEigenvaluesOfGraphs 1.1, 1.2, 2.1, 4.1 and 4.2; GraphSpectra 1.1, 2.5 and
3.3; RandomMatrices 1.2; Mathlib's `SimpleGraph.lineGraph`.

## Layer 10: threshold graphs

### 10.1 Conjugate degrees and threshold graphs

Definitions: `conjDegree G i = #{x | d(x) ≥ i}`, the conjugate degree sequence `d*`;
`IsThreshold G`: there are weights `w : V → ℝ` and `t : ℝ` with `x ~ y ↔ w x + w y > t` for
distinct `x, y` (Chvátal–Hammer). Basic API, not separate targets: `conjDegree G 0 = n` and
`conjDegree G i = 0` for `i ≥ n`; `conjDegree` is antitone in `i`; threshold graphs are closed
under complement, under induced subgraphs, under graph isomorphism and under adding an isolated
or a dominating vertex.

- **Conjugate degrees** (`sum_conjDegree`). `∑_{i=1}^n d*ᵢ = 2m`.
- **Threshold graphs** (`isThreshold_iff`). `G` is threshold iff every nonempty vertex set
  contains a vertex that is isolated or dominating in the induced subgraph. [BH, §3.11.1, p. 53]
  defines threshold graphs as those built from `K₀` by adding isolated vertices and taking
  complements, which is the recursive side; the equivalence with the weights is due to Chvátal
  and Hammer, and the route below is its proof.

**Suggested proof:** for `sum_conjDegree`, double counting of the pairs `(x, i)` with
`1 ≤ i ≤ d(x)`, and `d(x) ≤ n - 1`. For `isThreshold_iff`, forward: in `S` a vertex of largest
weight is dominating in `G[S]` or a vertex of smallest weight is isolated in it, by the threshold
condition on those two. Converse: remove such vertices one at a time and assign weights
inductively, an isolated vertex a weight below all previous ones and a dominating vertex one
above, with `t` adjusted by the same induction.

**Checks.**
- `P₄`: degrees `1, 2, 2, 1`, `d* = (4, 2, 0, 0)`, sum `6 = 2m`.
- `K_{1,3}` is threshold (weights `1` at the centre and `0` at the leaves, `t = 1/2`); `Kₙ` and
  edgeless graphs are threshold.
- Negative control: `P₄` is not threshold (no vertex is isolated or dominating in `P₄`).
- Negative control: `C₄` is not threshold: with weights, `0 ~ 1` and `2 ~ 3` give
  `w₀ + w₁ + w₂ + w₃ > 2t`, while the nonadjacent pairs `0, 2` and `1, 3` give
  `w₀ + w₁ + w₂ + w₃ ≤ 2t`. Likewise `2K₂`.

*Needs:* Mathlib's degrees and induced subgraphs.

### 10.2 Spectra of threshold graphs

- **Spectra** (`IsThreshold.lapEigenvalues_eq`). `νⱼ = d*ⱼ` for all `j` [BH, Proposition 3.11.1,
  p. 53].

**Suggested proof:** induction on `isThreshold_iff`: adding an isolated vertex appends `0` to both
lists (GraphSpectra 1.7 for the disjoint union with `K₁`); adding a dominating vertex is the
complement of adding an isolated vertex to the complement, and the complement formula
(LaplacianEigenvaluesOfGraphs 2.1) maps `ν` and `d*` alike.

**Checks.**
- `K_{1,3}`: `d* = (4, 1, 1, 0) = ν`.
- `K₃`: `d* = (3, 3, 0) = ν`. Threshold graph `K₁ ∨ (K₁ + K₂)` (a vertex joined to `K₁ + K₂`):
  degrees `3, 1, 2, 2`, `d* = (4, 3, 1, 0) = ν`.
- Negative control: `P₄` is not threshold, and `ν₁ = 2 + √2 ≠ d*₁ = 4`.

*Needs:* 10.1; LaplacianEigenvaluesOfGraphs 1.1 and 2.1; GraphSpectra 1.7.

## Layer 11: generalized Laplacians, nodal domains and the Colin de Verdière invariant

### 11.1 Generalized Laplacians and nodal domains

Definitions:
- `IsGeneralizedLaplacian G M`: `M` real symmetric, negative on edges, zero at distinct
  nonadjacent pairs; [NP, Definition 3.3.1, p. 122] calls these weighted Laplace matrices.
  `isGeneralizedLaplacian_lapMatrix` is a sanity check. Basic API, not separate targets: `L`,
  `L + diag(p)`, `-A + diag(p)` and the weighted Laplacians of positive edge weights on `G` are
  generalized Laplacians; the class is closed under adding diagonal matrices and positive
  scaling; for connected `G` the least eigenvalue of a generalized Laplacian is simple with a
  positive eigenvector [NP, Proposition 3.3.2, p. 122] (Tau Ceti's Perron–Frobenius theorem for
  the irreducible nonnegative matrix `cI - M`); `M` is block diagonal over the components of `G`.
- `strongNodalDomainCount G f`, for `f : V → ℝ`: the number of components of the subgraphs
  induced on `{f > 0}` and on `{f < 0}`, the strong nodal domains of [NP, Definition 3.2.1,
  p. 117] (maximal connected sets on which `f` has one strict sign).
- `weakNodalDomainCount G f`: the number of components of the subgraph induced on `{f ≥ 0}` that
  contain a vertex with `f > 0`, plus the number of components of that induced on `{f ≤ 0}` that
  contain a vertex with `f < 0`; this is `N^≥(f) + N^≤(f)` of [BH, §5.3, p. 86]. On a connected
  graph and for `f ≠ 0` these components are the weak nodal domains of [NP, Definition 3.2.3,
  p. 118] (maximal connected sets on which `f(x)f(y) ≥ 0`), by [NP, Proposition 3.2.4(a),
  p. 118].

Targets:
- **The nodal domain theorem for generalized Laplacians**
  (`IsGeneralizedLaplacian.nodalDomainCount_le`). Let `M` be a generalized Laplacian of `G`, with
  eigenvalues `λ₁ ≤ ⋯ ≤ λₙ`, and `Mf = θf`. Then `f` has at most `#{i | λᵢ ≤ θ}` strong nodal
  domains and at most `#{i | λᵢ < θ} + c` weak nodal domains, `c` the number of components of
  `G`. For `θ = λ_k` of multiplicity `r` and `k` the least index of `θ`, the bounds read
  `k + r - 1` and `k + c - 1` [BH, Proposition 5.3.1(i), (iii), p. 86, with Remark (ii), p. 87,
  applied to `-M`]; [NP, Theorem 3.3.5, p. 124, for connected graphs] (Davies, Gladwell, Leydold
  and Stadler). For `f = 0` both counts are `0`.
- **The Laplacian case.** For `M = L` the strong bound is LaplacianEigenvaluesOfGraphs 6.2, and
  on a connected graph the weak bound is its 6.3, whose domains are those counted here; not
  restated.

**Suggested proof:** `M` and `f` split over the components of `G`, and on a component where `f`
vanishes both counts are `0`, so it suffices to treat a connected `G` and `f ≠ 0` and to add the
bounds over components. Then follow [NP, proof of Theorem 3.3.5, pp. 125–128], with an
orthonormal eigenbasis `f₁, …, fₙ` of `M` that contains `f`: the restrictions `g_j` of `f` to the
`ℓ` domains are nonzero with disjoint supports, so some nonzero `g = ∑ p_j g_j` is orthogonal to
`f₁, …, f_{ℓ-1}` and has `gᵀMg ≥ λ_ℓ‖g‖²` (RandomMatrices 1.2). The Duval–Reiner identity
[NP, Lemma 3.3.4, pp. 122–124], `gᵀMg = θ‖g‖² - ∑_{xy ∈ E} M x y f(x) f(y)(p(x) - p(y))²`, a
route step stated in prose, gives `gᵀMg ≤ θ‖g‖²`, because an edge with `f(x)f(y) > 0` lies in
one domain and every other term is `≥ 0`. Hence `λ_ℓ ≤ θ`, which for strong domains is the bound.
For weak domains suppose `ℓ ≥ #{λ < θ} + 2`; then `λ_ℓ = θ`, `g` is a `θ`-eigenvector and every
term of the sum vanishes, so adjacent domains carry equal coefficients, `g` is a multiple of `f`,
and `g ⊥ f` forces `g = 0`.

**Checks.**
- On `K_{1,4}` with centre `0` and leaves `1, …, 4`, `f = (0, 1, 1, -1, -1)` has `4` strong
  nodal domains (the leaves) and `2` weak ones (the centre with the positive leaves, the centre
  with the negative ones). On `P₃`, `f = (1, 0, -1)` has `2` of each. The zero vector has `0` of
  each.
- The bound attained: `K_{1,4}` with `M = L` and the vector above, `θ = 1` (eigenvalues
  `0, 1, 1, 1, 5`): `4` strong domains and `#{λ ≤ 1} = 4`; `2` weak domains and
  `#{λ < 1} + 1 = 2`.
- Negative control for `weakNodalDomainCount`: on `K₂ + K₁` with `f = (1, -1, 0)`, the components
  of `{f ≥ 0}` are `{0}` and `{2}`, and those of `{f ≤ 0}` are `{1}` and `{2}`; the count is `2`,
  while a count of all four components would be `4`. Negative control for
  `strongNodalDomainCount`: on `K₂`, `f = (1, -1)` has `2` strong domains, while the subgraph
  induced on `{f ≠ 0}` has one component.
- Negative control: the weak bound needs `+ c`: two disjoint copies of `K₂` with `M = L`,
  `f = (1, -1, 1, -1)`, `θ = 2` (eigenvalues `0, 0, 2, 2`) has `4` weak domains, more than
  `#{λ < 2} + 1 = 3` and equal to `#{λ < 2} + c = 4`. The strong bound needs `≤ θ`: on `K_{1,4}`
  above, `4 > #{λ < 1} + 1 = 2`.
- Negative control: `A` itself is not a generalized Laplacian (positive on edges), but `-A` is;
  and strict negativity on edges is needed: on `K₂` the zero matrix has the eigenvector
  `f = (1, -1)` for `θ = 0` with `2` weak domains, more than `#{λ < 0} + c = 1`.

*Needs:* RandomMatrices 1.2; LaplacianEigenvaluesOfGraphs 1.1; Tau Ceti Perron–Frobenius.

### 11.2 The Colin de Verdière invariant

Definitions:
- `HasStrongArnold G M`: the only symmetric `X` with zero diagonal, zero on the edges of `G` and
  `MX = 0` is `X = 0` [BH, §7.3, p. 102]; [NP, Definition 4.4.1, (M2), p. 168].
- `colinDeVerdiereMatrices G`: generalized Laplacians of `G` with exactly one negative
  eigenvalue, of multiplicity one, satisfying the strong Arnold hypothesis [NP, Definition 4.4.1,
  p. 168].
- `colinDeVerdiere G`: the largest corank `n - rank M` over these matrices, `0` on the empty
  vertex type [BH, §7.3, p. 102]; [NP, Definition 4.4.3, p. 169].

Basic API, not separate targets: invariance under isomorphism; `colinDeVerdiereMatrices G` is
nonempty for `n ≥ 1` (a nonsingular matrix satisfies the strong Arnold hypothesis trivially;
shift `-A` by a constant `c` on each component: on exactly one component `c` lies strictly
between its second largest adjacency eigenvalue and its Perron value, which is simple on a
connected graph (any `c < 0` on a single vertex), and on the others `c` exceeds the Perron value;
then `-A + c` is nonsingular with exactly one negative eigenvalue); `μ(G) ≤ n - 1`.

- **Complete and edgeless graphs** (`colinDeVerdiere_top_bot`). `μ(Kₙ) = n - 1` (take `M = -J`),
  and `μ = 1` for an edgeless graph on `n ≥ 2` vertices [BH, §7.3, p. 102].
- **Disjoint unions** (`colinDeVerdiere_sum`). If `G` or `H` has an edge,
  `μ(G + H) = max(μ(G), μ(H))` [BH, §7.3, p. 102].
- **Components.** For a graph with an edge, `μ(G)` is the maximum of `μ` over its components
  [NP, Exercise 4.4.3, pp. 172–173]. A route step stated in prose.
- **The star `K_{1,3}`.** `μ(K_{1,3}) = 2`. A target stated in prose.

**Suggested proof:** for `Kₙ`, `-J` has eigenvalues `-n` and `0`, corank `n - 1`, and the strong
Arnold hypothesis holds since there are no nonadjacent pairs; `μ ≤ n - 1` because a matrix of
corank `n` is `0`. For the edgeless graph the generalized Laplacians are diagonal, and one with
one negative entry satisfies the hypothesis exactly when it has at most one `0` [NP, Exercise
4.4.1, p. 172]. For
components follow [NP, Exercise 4.4.3, pp. 172–173]: a Colin de Verdière matrix is block diagonal
over the components; for kernel vectors `f`, `g` of two different blocks, `X = fgᵀ + gfᵀ` has
`MX = 0`, so the strong Arnold hypothesis leaves a nonzero kernel in one block only; that block is
a Colin de Verdière matrix of its component, unless it is positive semidefinite, when its kernel
has dimension `1` by Perron–Frobenius and a component with an edge has `μ ≥ 1`. The disjoint
union `G + H` then follows by applying the component formula to `G + H`, `G` and `H`, with
`μ = 1` for an edgeless part on at least two vertices. For `K_{1,3}` with centre
`0`, `M = [[c, -𝟙ᵀ], [-𝟙, 0]]` has corank `2` and one negative eigenvalue; a symmetric `X` with
the required zeros is supported on the pairs of leaves, and `MX = 0` says that its columns sum to
`0` over the leaves, which forces `X = 0`. The upper bound: corank `3` would make `M = -vvᵀ`,
nonzero at every pair of leaves.

**Checks.**
- `μ(K₁) = 0`, `μ(K₂) = 1`, `μ(K₃) = 2`, `μ(K₄) = 3`; `μ(2K₁) = 1`.
- The shift of the basic API on `K₃` (adjacency eigenvalues `2, -1, -1`): `c = 0` gives `-A` with
  eigenvalues `-2, 1, 1`, one negative. Negative control: `c = -2`, below the Perron value but
  not above the second eigenvalue, gives `-4, -1, -1`, three negative.
- Negative control: for `K₂` the matrix `M = [[0, -1], [-1, 0]]` has eigenvalues `-1, 1` and
  corank `0`, while `-J` has eigenvalues `-2, 0` and corank `1`, so `μ(K₂) ≥ 1`.
- Negative control: for `2K₁`, `M = diag(-1, 0)` has corank `1`; `diag(-1, 0, 0)` for `3K₁`
  fails the strong Arnold hypothesis (take `X` with `X₂₃ = X₃₂ = 1`), which is why `μ(3K₁) = 1`.
  Without an edge in either part, `μ(K₁ + K₁) = 1 > 0 = max(μ(K₁), μ(K₁))`.
- On the empty type, `colinDeVerdiereMatrices` is empty and `colinDeVerdiere = 0`.

*Needs:* 11.1; Tau Ceti Perron–Frobenius.

### 11.3 Minors

Definitions: `MinorModel G H`: branch sets `B_w ⊆ V`, `w ∈ W`, pairwise disjoint, each
inducing a connected (so nonempty) subgraph of `G`, with an edge of `G` between `B_w` and
`B_{w'}` whenever `w ~ w'` in `H`; `G.IsMinor H` is `Nonempty (MinorModel G H)`, and says that
`H` is a minor of `G`. The sources define a minor as a graph obtained by a sequence of edge
deletions, edge contractions and deletions of isolated vertices [BH, §7.2, p. 102]; [NP,
Definition 1.1.25 (c), p. 11]; the second bullet below identifies the two on finite graphs.

- **Subgraphs and transitivity** (`IsMinor.of_injective`, `IsMinor.trans`). An injective
  homomorphism `H →g G` makes `H` a minor of `G`; in particular every subgraph of `G`, and every
  graph isomorphic to `G`, is a minor of `G`. A minor of a minor of `G` is a minor of `G`.
- **Minors in steps.** For finite `V`, `G.IsMinor H` holds exactly when a graph isomorphic to `H`
  is obtained from `G` by finitely many steps, each the deletion of an edge, the deletion of an
  isolated vertex or the contraction of an edge [BH, §7.2, p. 102]; [NP, Definition 1.1.25 (c),
  p. 11]. A target stated in prose.
- **Two minor facts.** `K₃` is a minor of `G` if and only if `G` has a cycle, and `K_{1,3}` is a
  minor of `G` if and only if some vertex has degree at least `3`. Targets stated in prose.
- **Minor monotonicity** (`IsMinor.colinDeVerdiere_le`) [BH, Theorem 7.3.1, p. 102];
  [NP, Theorem 4.4.8, p. 172].
- **Linear forests** (`colinDeVerdiere_le_one_iff`). `μ(G) ≤ 1` iff `G` is a disjoint union of
  paths, that is, a forest with maximum degree at most `2` [BH, Theorem 7.3.2(i), p. 103];
  [NP, Exercises 4.4.2 and 4.4.4, pp. 172–173].

**Suggested proof:** for an injective homomorphism `f`, the branch sets are the singletons `{f w}`.
For transitivity, the branch set of a vertex `u` of the third graph is the union of the branch sets
in `G` of the vertices of its branch set in `H`; it is connected because that branch set is
connected in `H` and adjacent vertices of `H` have branch sets joined by an edge of `G`. For the
steps, each step gives a minor model (singletons for a deletion, the pair `{x, y}` for the
contraction of `xy`), so a sequence gives one by transitivity. Conversely, given a model, delete
every edge except those of a spanning tree of each `G[B_w]` and one chosen edge between `B_w` and
`B_{w'}` for each edge `ww'` of `H`; delete the vertices outside the branch sets, now isolated;
contract the tree edges one at a time. The result is isomorphic to `H`. For the minor facts, a cycle
`v₁ ⋯ v_k` has the branch sets `{v₁}`, `{v₂}` and `{v₃, …, v_k}` of a `K₃` minor, and conversely the
three connected branch sets of a `K₃` minor, joined pairwise by edges, contain a cycle through the
three joining edges. A vertex of degree at least `3` is the centre of a `K_{1,3}` subgraph;
conversely, a graph of maximum degree at most `2` is a disjoint union of paths and cycles, where a
connected vertex set has at most two edges leaving it, while the branch set of the centre of a
`K_{1,3}` minor needs three. For monotonicity follow [NP, §4.8, pp. 187–194]: deletion of an
isolated vertex, deletion of an edge and contraction of an edge are treated separately, and in each
a Colin de Verdière matrix of the minor is perturbed, using the strong Arnold hypothesis as a
transversality condition (Mathlib's implicit function theorem), into one of the graph with at least
the same corank. For linear forests, a generalized Laplacian of a path is tridiagonal with nonzero
off-diagonal, so its kernel has dimension at most `1`; then disjoint unions (11.2). Conversely a
graph that is not a linear forest has `K₃` or `K_{1,3}` as a minor, and `μ(K₃) = μ(K_{1,3}) = 2`
(11.2).

**Checks.**
- `K_{1,3}` is a subgraph, hence a minor, of `K₄`; `K₃` is a minor of `C₅` (contract two edges).
- Transitivity: `C₅` is a subgraph of the Petersen graph (its outer cycle), so `K₃` is a minor of
  the Petersen graph; the model has the branch sets `{v₁}`, `{v₂}`, `{v₃, v₄, v₅}` on that cycle.
- Negative control for `IsMinor.of_injective`: the `2`-colouring of `C₆` is a homomorphism
  `C₆ →g K₂`, not injective, and `C₆` is no minor of `K₂`, which has fewer vertices.
- `μ(Pₙ) = 1` for `n ≥ 2`; `μ(C₄) ≥ μ(K₃) = 2`, through the `K₃` minor.
- Negative control: `K₃` is not a minor of any tree, and `K_{1,3}` is not a minor of `C₅`.

*Needs:* 11.2; Mathlib `SimpleGraph.Hom`, `SimpleGraph.induce`, `SimpleGraph.Connected` and
the implicit function theorem.

## Layer 12: equilateral metric graphs

### 12.1 Standard eigenfunctions

Definitions (for an orientation `O` of `G` and lengths `ℓ : O.carrier → ℝ`):
- `IsStandardEigenfunction G O ℓ λ u` for `u : O.carrier → ℝ → ℝ`: each `u e` is `C²` on
  `[0, ℓ e]`, solves `-u'' = λu` there (derivatives within the interval, Mathlib's `derivWithin`
  and `ContDiffOn`), vanishes off it; the endpoint values agree at each vertex (continuity), and
  at each vertex the sum of outgoing derivatives vanishes: `u'(0)` at the tail of `e`,
  `-u'(ℓ e)` at its head (Kirchhoff).
- `standardEigenspace G O ℓ λ`, the span of the standard eigenfunctions;
  `standardMultiplicity G O ℓ λ`, its dimension; `standardCount G O ℓ Λ`, the dimension of the sum
  of the eigenspaces for `λ ≤ Λ`.

These describe the eigenvalues and eigenfunctions of the self-adjoint standard Laplacian of
[Ku, Chapters 3–4] without constructing the operator; the identification with the operator is in
"Beyond this roadmap".

- **Basic facts** (`standardEigenspace_basic`). For positive lengths: the standard
  eigenfunctions form a subspace, finite-dimensional of dimension at most `2|E|`; there are no
  negative eigenvalues; for `G` without isolated vertices the multiplicity of `0` is the number
  of components [Ku, Lemma 24.2, p. 586].
- **Orientation and isometry invariance.** `standardMultiplicity` does not depend on `O`:
  reversing `e` replaces `u e` by `t ↦ u e (ℓ e - t)`, a linear isomorphism of eigenspaces; and it
  is invariant under graph isomorphisms carrying lengths. Targets stated in prose.

**Suggested proof:** on each edge `u e = a cos(kt) + b sin(kt)` (or `a + bt` at `λ = 0`), so the
eigenfunctions are cut out of a space of dimension `2|E|` by linear conditions; integration by
parts gives `λ ∑ₑ ∫ u² = ∑ₑ ∫ u'²` using continuity and Kirchhoff, so `λ ≥ 0`, and at `λ = 0` the
eigenfunctions are the functions constant on components.

**Checks.**
- `K₂` (one unit edge, Neumann at both ends): eigenvalues `(πj)²`, each simple.
- `K₃` (a circle of length `3`): eigenvalues `(2πj/3)²`, double for `j ≥ 1`.
- Negative control: an isolated vertex has no edges, so it contributes nothing to the metric
  graph; on `K₂ + K₁` the multiplicity of `0` is `1`, not the `2` components, which is why the
  last conjunct assumes no isolated vertices.

*Needs:* Tau Ceti orientations; Mathlib's calculus.

### 12.2 Generic eigenvalues

- **Discrete and metric spectra** (`standardMultiplicity_eq_finrank_eigenspace`). Let `G` have no
  isolated vertices and `ℓ = 1`. For `λ ≥ 0` not of the form `(πj)²`, `j ∈ ℤ`, the multiplicity of
  `λ` for the standard Laplacian equals the multiplicity of `1 - cos √λ` for the normalized
  Laplacian `𝓛` of KernelsAndSpectralMethods [Ku, Theorem 24.1, p. 584].

**Suggested proof:** for `sin k ≠ 0`, with `k = √λ`, an eigenfunction is determined by its vertex
values `ψ` via `u e(t) = (ψ(tail) sin(k(1 - t)) + ψ(head) sin(kt))/sin k`; Kirchhoff at `x` reads
`cos k · d(x)ψ(x) = ∑_{y ~ x} ψ(y)`, that is `(I - D⁻¹A)ψ = (1 - cos k)ψ`, and `D^{1/2}ψ` is an
eigenvector of `𝓛` [Ku, proof of Theorem 24.1, pp. 584–586]. The map `u ↦ ψ` is a linear
isomorphism.

**Checks.**
- `P₃` (an interval of length `2`): eigenvalues `(πj/2)²`; for odd `j`, `1 - cos(πj/2) = 1`, the
  simple eigenvalue `1` of `𝓛(P₃)`.
- `K₃`: at `λ = (2π/3)²`, `1 - cos(2π/3) = 3/2`, the double eigenvalue of `𝓛(K₃)`.
- Negative control: at the excluded point `λ = π²` on `K₃`, `1 - cos π = 2` is not an
  eigenvalue of `𝓛(K₃)`, and `π²` is not an eigenvalue of the metric graph either, while at
  `λ = (2π)²` the metric multiplicity is `2` and `1 - cos 2π = 0` has multiplicity `1`.

*Needs:* 12.1; KernelsAndSpectralMethods 1.1.

### 12.3 Exceptional eigenvalues

- **Exceptional eigenvalues** (`standardMultiplicity_exceptional`). Let `G` be connected with
  `n ≥ 2`, `ℓ = 1`, and cycle rank `β₁ = |E| - n + 1`. For `m ≥ 1`, `(2πm)²` has multiplicity
  `β₁ + 1`; for `m ≥ 0`, `((2m + 1)π)²` has multiplicity `β₁ + 1` if `G` is bipartite and `β₁ - 1`
  otherwise [Ku, Lemma 24.4, p. 587; Lemma 24.5, p. 589; Theorem 24.6(4), (6), p. 590].

**Suggested proof:** [Ku, pp. 587–589]: eigenfunctions with vertex values `0` are combinations of
`± sin(πmt)` supported on cycles; a spanning tree (Mathlib's
`SimpleGraph.Connected.exists_isTree_le`, with `n - 1` edges by
`SimpleGraph.IsTree.card_edgeFinset`) and its `β₁` chords give the count; the constant-modulus
eigenfunction (`cos(πmt)` with signs) exists for all `G` at even `m` and for bipartite `G` at
odd `m`.

**Checks.**
- `K₂`: `β₁ = 0`, bipartite; `π²` and `(2π)²` both have multiplicity `1 = β₁ + 1`.
- `K₃`: `β₁ = 1`; `(2π)²` has multiplicity `2 = β₁ + 1`, and `π²` multiplicity `0 = β₁ - 1`.
- `C₄`: `β₁ = 1`, bipartite; `π²` has multiplicity `2`.
- Negative control: `K₁` has no edges and the multiplicity of `(2π)²` is `0`, while the formula
  would give `1`; the hypothesis `n ≥ 2` is needed.

*Needs:* 12.1; Mathlib's spanning trees.

### 12.4 Weyl's law

- **Weyl's law on equilateral graphs** (`exists_abs_standardCount_sub_le`). For `G` without
  isolated vertices, `|N(Λ) - |E|√Λ/π| ≤ C` for all `Λ ≥ 0`, equivalently
  `λⱼ = (π/|E|)²j² + O(j)` with the total length `|E|` [Ku, Theorem 4.6, p. 77, for the
  Schrödinger operator, of which the standard Laplacian is the case without potential].

**Suggested proof:** by components; on a connected component, [Ku, Theorem 24.6(5), p. 590]:
each interval `((mπ)², ((m + 1)π)²)` contains `n - 2` or `n - 1` eigenvalues as `G` is or is not
bipartite (by 12.2 and the eigenvalues of `𝓛` in `(0, 2)`), and the exceptional points add the
multiplicities of 12.3; per period `2π` in `k` the count is `2|E|`.

**Checks.**
- `K₃`: `N(Λ) = 1 + 2⌊3√Λ/(2π)⌋`, within `2` of `3√Λ/π`.
- `K₂`: `N(Λ) = 1 + ⌊√Λ/π⌋`, within `1` of `√Λ/π`.
- Negative control: the total length is `|E|`, not `n`: for `K₃` with `n√Λ/π` in place of
  `|E|√Λ/π` the counts agree only because `n = |E| = 3`; for `K₂` the count `1 + ⌊√Λ/π⌋` is not
  within a constant of `2√Λ/π`.

*Needs:* 12.2, 12.3.

## Downstream consumers

Later roadmaps cite this one by section:
- expander graphs: Fiedler's bounds and the spectral gap of a weight with constant degree
  (Layer 6);
- line systems and switching: the eigenvalue form of the matrix-tree theorem (2.3).

## Scope and ownership

The roadmap is complete when Tau Ceti proves every target above. `Suggested.lean` states the
headlines that carry a Lean name, each with every conclusion the README attaches to it; it is not
an exhaustive acceptance test, and the other headlines are targets of the same standing, stated
in prose.

Owned here:
- the oriented incidence matrix of an orientation of a simple graph, `L = BBᵀ`, the bridge to
  Tau Ceti's incidence boundary, cut vectors, the rank of `B`, the cycle and cut spaces (Layer 1);
- spanning trees and rooted spanning forests as edge sets, their weights, the weighted adjacency
  matrix of edge weights, the minors of `B`, the rooted-forest theorem for every root set,
  Temperley's formula and the eigenvalue form of the matrix-tree theorem (Layer 2);
- the spanning-tree formulas for effective resistance: Kirchhoff's formula, the edge
  probabilities of a weighted random spanning tree, and resistance in a tree (Layer 3);
- the critical group, the reduced Laplacian, the cut and flow lattices of an orientation and
  their duals (Layer 4);
- the distance matrix of a tree (Layer 5);
- Fiedler's upper bounds by the minimum degree and the vertex connectivity, Fiedler's lower
  bound by the edge connectivity, the energy minimization for `ν_{n-1} + ⋯ + ν_{n-k}`, and the
  spectral gap of a weight with constant degree in terms of `ν_{n-1}` (Layer 6);
- the multiplicity of the normalized eigenvalue `2` for weighted graphs without loops, and the
  trace and extreme-eigenvalue bounds of the normalized Laplacian of a simple graph (Layer 7);
- the spectral cut bounds, the maximum-cut bound and the bisection bound (Layer 8);
- the comparison of `ν₁` with `q₁` with its equality case, the edge-degree sum, bipartite
  semiregularity and the three equality cases for `ν₁` (Layer 9);
- conjugate degrees, threshold graphs, the Chvátal–Hammer characterization and the Laplacian
  spectrum of threshold graphs (Layer 10);
- generalized Laplacians, strong and weak nodal domain counts and the nodal domain theorem for
  generalized Laplacians, the strong Arnold hypothesis, the Colin de Verdière invariant, its
  values on complete, edgeless and disjoint-union graphs and on `K_{1,3}`, minors of simple graphs
  by branch sets with their basic API (subgraphs, transitivity, the reduction to single
  deletions and contractions), the two minor facts, the minor monotonicity of the invariant and
  the characterization of `μ ≤ 1` (Layer 11);
- metric graphs with positive edge lengths, the eigenspaces of the standard Laplacian, the
  correspondence between generic eigenvalues on an equilateral metric graph and the normalized
  Laplacian, the exceptional eigenvalues, and Weyl's law on equilateral graphs (Layer 12).

Boundary in one sentence: a statement whose proof goes through the incidence matrix or the
spanning trees or forests of a simple graph, a statement about the eigenvalues of the
combinatorial Laplacian of a simple graph that LaplacianEigenvaluesOfGraphs and GraphSpectra do
not state, about the normalized Laplacian of the adjacency matrix of a simple graph, about
generalized Laplacians in connection with nodal domains or the Colin de Verdière invariant, or
about the standard Laplacian of an equilateral metric graph, is here; a statement about effective
resistance that does not mention spanning trees, about hitting times or mixing, or about a
weighted matrix that never mentions a graph's edges is elsewhere, and the normalized Laplacian of
a weighted graph is consumed, except for the multiplicity of its eigenvalue `2` (7.1).

Already in the libraries and therefore not targets: Mathlib's Laplacian, its kernel, its
determinant `0`, the unsigned incidence matrix, trees and spanning trees as subgraphs, and the
principal-minor expansion of the characteristic polynomial; Tau Ceti's incidence boundary of a
Serre graph, its integral cycle lattice, Cauchy–Binet and cokernel orders, and the vertex and
edge connectivity of simple graphs. Tau Ceti also formalizes the dimension formula of the cycle
space of a Serre graph and the total unimodularity of matrices with at most one `1` and one `-1`
in each column; 1.2 and 2.2 do not need them.

Consumed, not restated (see the supplier contracts for the hypotheses):
- [GraphSpectra](../GraphSpectra/README.md) 1.1, 1.5, 1.7, 2.2, 2.5 and 3.3: the signless Laplacian
  and its enumeration, the quadratic forms, `Q = UUᵀ`, sign conjugation and the kernel of `Q`, the
  variational formula for the algebraic connectivity, spectra of disjoint unions, the Laplacian
  spectrum of the path, the line-graph identity and the degree bounds for the index of a connected
  graph.
- [LaplacianEigenvaluesOfGraphs](../LaplacianEigenvaluesOfGraphs/README.md) 1.1, 1.2, 2.1, 3.2, 4.1,
  4.2, 6.2, 6.3 and 7.1: the sorted Laplacian eigenvalues with `ν₁` and the algebraic connectivity,
  the zero eigenvalues, the complement formula, Fiedler's vertex-cut bound, `ν₁ ≤ max(d(x) + d(y))`
  and `Δ + 1 ≤ ν₁`, the strong and weak nodal domain theorems for `L`, and the unit network of a
  graph. Its equality cases of 4.1 and 4.2 are outside its scope and are 9.2 here; it does not state
  the product formula of 2.3. Its Kirchhoff index formula (7.1) is a different statement from
  Kirchhoff's formula of 3.1.
- [KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) 1.1–1.4 and 2.1: weighted
  graphs, their degrees, Laplacians and positive graph, the normalized Laplacian with its kernel and
  its spectrum in `[0, 2]` with the existence of the eigenvalue `2`, and the normalized spectral gap
  `fiedlerValue` with `λ₁ ≤ n/(n - 1)`. The multiplicity of `2`, for weighted graphs, is 7.1 here.
- [ElectricalNetworksAndRandomWalks](../ElectricalNetworksAndRandomWalks/README.md) 1.1 and 2.1:
  networks, voltages and effective resistance; its 3.3 (Foster) is quoted in a Check. It leaves the
  spanning-tree expression of effective resistance and random spanning trees to other roadmaps;
  Layer 3 states them for its networks.
- [RandomMatrices](../RandomMatrices/README.md) 1.2: the min–max and max–min formulas for
  `Matrix.IsHermitian.eigenvalues₀`, which apply to `G.lapMatrix ℝ` at every index.
- [GeometricTopology](../GeometricTopology/README.md) 4.4.5: the weighted matrix-tree identity for
  symmetric weights (every principal cofactor of `diag(row sums) - W` is the weighted
  spanning-tree sum); it is the case `|R| = 1` of the rooted-forest theorem, whose other cases it
  does not state, and it serves the second route of 2.2.

Boundaries with neighbouring roadmaps, none of which is a supplier:
- [SpanningTreesAndShortestPaths](../SpanningTreesAndShortestPaths/README.md) owns the Prüfer
  correspondence and Cayley's formula `n^{n-2}` (5.1, 5.2), with spanning trees and forests as
  subgraphs; it leaves the matrix-tree identity to GeometricTopology and random spanning trees
  outside its scope. Here spanning trees are edge sets, and Cayley's numbers appear only in the
  Checks of 2.1.
- [MarkovChainMixing](../MarkovChainMixing/README.md) owns the spectral mixing bounds of
  reversible chains (2.3) and the Dirichlet form and spectral gap (2.4); for the lazy simple
  random walk on a regular graph they give mixing bounds in terms of `ν_{n-1}` through 6.4.
- [RandomGraphs](../RandomGraphs/README.md) has no Laplacian statement.
- DirectedMatrixTreeAndBEST, 2.1–2.3, owns the directed matrix-tree theorem in its principal-minor
  and adjugate forms and its specialization to symmetric weights; that every cofactor of `L`,
  diagonal or not, equals `N` is that specialization at `0`–`1` weights and is not restated. It
  leaves forests rooted at several vertices outside its scope.
- IntegerPolyhedraAndTotalUnimodularity, 3.1, states the total unimodularity of matrices with at
  most one `1` and one `-1` in each column; the route of 2.2 uses the sharper minor lemma for `B`
  instead.
- SpectralSparsification owns spectral approximation of Laplacians and leverage-score sampling;
  it uses Foster's theorem, not the spanning-tree formulas of Layer 3.
- HittingAndCoverTimes owns mean hitting times and their first-step equations.
- [LinearAlgebraMethodInCombinatorics](../LinearAlgebraMethodInCombinatorics/README.md), 4.2, owns
  the Graham–Pollak theorem on biclique decompositions of `Kₙ`; the Graham–Pollak determinant of
  5.2 is a different statement.
- [TropicalAndBerkovichArithmetic](../TropicalAndBerkovichArithmetic/README.md), 3.4 and 3.5, owns
  divisors, chip firing and Jacobians of metric graphs and of their finite models; on a simple
  graph with unit lengths its finite-model degree-zero Picard group is the critical group of
  Layer 4, whose order and lattice descriptions are not stated there.
- [FreeGroupsAndLimitGroups](../FreeGroupsAndLimitGroups/README.md), 2.2a, owns finite cycle
  spaces and independent cycles of graphs; SurfaceTopology owns the cellular homology of its
  Layer 7. This roadmap keeps the real and integral linear algebra of `B` that Layers 2 and 4 use.
- SurfaceTopology owns planarity and Wagner's theorem (Layer 10); neither is used here, and
  minors of simple graphs are defined and developed here (11.3).
- [GraphConnectivityAndFlows](../GraphConnectivityAndFlows/README.md) owns vertex and edge
  connectivity of multigraphs (1.5) and the Whitney inequalities (6.1); the simple-graph
  invariants used here are the Tau Ceti declarations listed below.

Outside the scope: the all-minors matrix-tree theorem for non-principal minors; the
deletion–contraction recurrence for spanning-tree counts; Wilson's algorithm and other sampling
procedures; directed graphs; infinite graphs; and Laplacians of simplicial complexes.

## Exact supplier contracts

### From Mathlib

- The Laplacian: `SimpleGraph.lapMatrix`,
  `SimpleGraph.posSemidef_lapMatrix`, `SimpleGraph.lapMatrix_toLinearMap₂'`
  (`xᵀLx = (∑ᵢ ∑ⱼ [i ~ j](xᵢ - xⱼ)²)/2`), `SimpleGraph.lapMatrix_mulVec_one_eq_zero`,
  `SimpleGraph.lapMatrix_mulVec_apply'` (the row of `Lx` at `v` as a sum over the neighbours),
  `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`; used in 1.2, 2.3, 5.1,
  6.1–6.3 and 8.1.
- Trees: `SimpleGraph.IsTree`, `SimpleGraph.IsAcyclic`, `SimpleGraph.IsTree.card_edgeFinset`,
  `SimpleGraph.Connected.exists_isTree_le`, `SimpleGraph.IsTree.existsUnique_path`; used in
  Layers 2, 3, 5, 11 and 12.
- `SimpleGraph.dist` (3.3, 5.1), `SimpleGraph.interedges` (8.1), `SimpleGraph.IsEdgeConnected`
  (6.2), `SimpleGraph.lineGraph` (9.2), `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`,
  `SimpleGraph.IsBipartite`, `SimpleGraph.Coloring`, `SimpleGraph.sum` (`⊕g`),
  `SimpleGraph.minDegree`, `SimpleGraph.maxDegree`, `SimpleGraph.IsRegularOfDegree`,
  `SimpleGraph.exists_minimal_degree_vertex`.
- Matrices: `Matrix.inv_def`, `Matrix.adjugate`, `Matrix.nonsing_inv_apply_not_isUnit` (3.1);
  `Matrix.det_fromBlocks₁₁` (5.2); `Matrix.charpoly_coeff_eq_sum_minors`,
  `Matrix.IsHermitian.charpoly_eq`, `Matrix.IsHermitian.det_eq_prod_eigenvalues` (2.3);
  `LinearMap.BilinForm.dualSubmodule`, `Module.Basis.SmithNormalForm` (Layer 4);
  `Matrix.PosSemidef`, `Matrix.IsHermitian.eigenvalues₀` (sorted nonincreasingly),
  `Matrix.IsHermitian.eigenvalues` (unordered); `ContinuousLinearMap.orthogonal_range` (1.2).
- `derivWithin`, `ContDiffOn`, `Module.End.eigenspace`, `Module.finrank`, `Matrix.toLin'`
  (Layers 7 and 12).

### From Tau Ceti

- `TauCeti.DoubledQuiver.Orientation`: a set of darts with exactly one dart over every edge; used
  in Layers 1, 4 and 12.
- `TauCeti.SerreGraph.incidenceBoundary`, sending a dart to `e_tgt - e_src`, and the integral
  cycle lattice `TauCeti.SerreGraph.cycleLattice`; a simple graph enters through
  `SimpleGraph.toSerreGraph`, whose darts are the darts of the graph; used in 1.1 and 4.2.
- `Matrix.det_mul_transpose_eq_sum_plucker_sq`, Cauchy–Binet for `AAᵀ`; used in 2.2.
- `Matrix.card_quotient_range_mulVecLin_eq_card_quotient_span_det`, the order of the cokernel of a
  square integer matrix with nonzero determinant; used in 4.1.
- `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` (Courant–Fischer), through
  RandomMatrices 1.2; used in 8.1, 9.1, 9.2 and 11.1.
- `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` (Ky Fan: for an
  orthonormal family of `k` vectors, the sum of the quadratic form is at most the sum of the `k`
  largest eigenvalues); used in 6.3.
- `Matrix.IsIrreducible.exists_pos_eq_smul_of_mulVec_eq_smul` (Perron–Frobenius for irreducible
  nonnegative matrices); used in 9.1 and 11.1–11.2.
- Connectivity: `SimpleGraph.vertexConnectivity`, `SimpleGraph.edgeConnectivity`,
  `SimpleGraph.isVertexConnected_iff` (`k`-connected iff at least `k + 1` vertices and
  preconnected after deleting fewer than `k`),
  `SimpleGraph.isVertexConnected_iff_le_vertexConnectivity`,
  `SimpleGraph.vertexConnectivity_ne_top`, `SimpleGraph.vertexConnectivity_top`,
  `SimpleGraph.edgeConnectivity_eq_top_iff`, `SimpleGraph.vertexConnectivity_le_edgeConnectivity`,
  `SimpleGraph.isEdgeConnected_iff_le_edgeConnectivity`,
  `SimpleGraph.edgeConnectivity_le_minDegree`; used in 6.1 and 6.2.

### From GraphSpectra

- [GraphSpectra](../GraphSpectra/README.md) 1.1: the signless Laplacian `signlessLapMatrix` and its
  enumeration `signlessLapEigenvalues`, copied verbatim into `Suggested.lean`; the quadratic forms
  of `L` and `Q`, `Q = UUᵀ`, the kernel of `Q` and the sign conjugation of `L` into `Q` for a proper
  `2`-colouring. Used in 6.2, 6.3, 7.1, 9.1 and 9.2.
- 1.5: the variational formula for `ν_{n-1}`, for `n ≥ 2`, over nonzero `u` with `∑ u = 0`. Used
  in 6.1, 6.2, 6.4 and 8.1.
- 1.7: spectra of disjoint unions. Used in 10.2.
- 2.2: the Laplacian spectrum of the path, `2 - 2cos(πj/n)`, `j = 0, …, n - 1`. Used in 6.2.
- 2.5: `UᵀU = 2I + A(L(G))` over any semiring. Used in 9.2.
- 3.3: for connected `G`, the index equals the maximum degree iff `G` is regular. Used in 9.2.

### From LaplacianEigenvaluesOfGraphs

- [LaplacianEigenvaluesOfGraphs](../LaplacianEigenvaluesOfGraphs/README.md) 1.1: `lapEigenvalues`,
  `largestLapEigenvalue` (on `[Nonempty V]`) and `algebraicConnectivity`, copied verbatim into
  `Suggested.lean`. Used in Layers 2, 6, 8, 9, 10 and 11.
- 1.2: the eigenvalue `0` has multiplicity the number of components. Used in 9.2.
- 2.1: the complement formula, for `i + j + 2 = n`. Used in 9.2 and 10.2.
- 3.2: Fiedler's vertex-cut bound, for `D` whose complement induces a graph that is not
  connected. Used in 6.1.
- 4.1 and 4.2: `ν₁ ≤ max(d(x) + d(y))` and `Δ + 1 ≤ ν₁`, for a graph with an edge on a nonempty
  vertex type. Used in 9.2.
- 6.2 and 6.3: the strong nodal domain theorem for `L`, and the weak one on a connected graph.
  Cited in 11.1 as the case `M = L`.
- 7.1: `unitNetwork`, the network with conductance `1` on the edges of a graph, copied verbatim.
  Used in 3.3.

### From KernelsAndSpectralMethods

- [KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) 1.1: `IsWeightedGraph`,
  `degree`, `laplacian`, `normalizedLaplacian` and `positiveGraph`, copied verbatim; the Laplacian
  of the adjacency matrix of a simple graph is `G.lapMatrix ℝ`. Used in Layers 2, 3, 6, 7 and 12.
- 1.2: `isHermitian_normalizedLaplacian`, copied verbatim; the quadratic form. 1.3–1.4: the
  kernel of `𝓛` and its spectrum in `[0, 2]`, with positive degrees. Used in Layer 7.
- 2.1: `fiedlerValue`, copied verbatim, with `λ₁ ≤ n/(n - 1)` for a weighted graph with positive
  degrees and `n ≥ 2`. Used in 6.4 and 7.2.

### From ElectricalNetworksAndRandomWalks

- [ElectricalNetworksAndRandomWalks](../ElectricalNetworksAndRandomWalks/README.md) 1.1: `Network`,
  `Network.weight`, `Network.graph`, `Network.edgeCond`; 2.1: `Network.laplacian`,
  `Network.groundedLaplacian`, `Network.voltage`, `Network.effResistance`, with `R(a ↔ a) = 0` and
  `R = 0` on a disconnected network. Copied verbatim into `Suggested.lean` and used in Layer 3; 3.3
  (Foster) is quoted in a Check of 3.2.

### From RandomMatrices and GeometricTopology

- [RandomMatrices](../RandomMatrices/README.md) 1.2: the min–max and max–min formulas for
  `Matrix.IsHermitian.eigenvalues₀`. Used in 8.1, 9.1, 9.2 and 11.1.
- [GeometricTopology](../GeometricTopology/README.md) 4.4.5: every principal cofactor of
  `diag(row sums) - W`, for symmetric zero-diagonal weights `W` on a finite nonempty vertex set
  over a commutative ring, is the weighted sum over spanning trees. Used in the second route of
  2.2.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Planarity and the Colin de Verdière invariant.** `μ(G) ≤ 2` iff `G` is outerplanar,
  `μ(G) ≤ 3` iff `G` is planar, `μ(G) ≤ 4` iff `G` has a linkless embedding in `ℝ³`, and the
  bounds for graphs on surfaces [BH, Theorem 7.3.2(ii)–(vii), p. 103]; van der Holst's proof that
  planar graphs have `μ ≤ 3` [BH, Proposition 7.3.3, p. 103]; [NP, Theorem 4.5.1, p. 173].
  Planarity and Wagner's theorem are SurfaceTopology, Layer 10; the further ingredients are van
  der Holst's lemma on planar graphs, the computations `μ(K₅) = μ(K_{3,3}) = 4`, outerplanarity,
  and, for `μ ≤ 4`, the Robertson–Seymour–Thomas theory of linkless embeddings.
- **Weyl's law for arbitrary edge lengths.** For a compact metric graph of total length
  `ℓ = ∑ₑ ℓ e`, `λⱼ = (π/ℓ)²j² + O(j)` [Ku, Theorem 4.6, p. 77]. Its proof compares the standard
  Laplacian with the decoupled Dirichlet Laplacian through a finite-rank resolvent difference,
  which needs the standard Laplacian as a self-adjoint operator on `L²` of the metric graph with
  compact resolvent and the identification of its eigenvalues with `standardMultiplicity`.

## References

- [Ba] R. B. Bapat, *Graphs and Matrices*, 2nd ed., Universitext, Springer, 2014: introduction to
  Chapter 2, p. 13; Theorem 2.3, p. 14; introduction to Chapter 4, p. 49; Theorem 4.7, p. 52;
  Corollary 4.10, p. 53; Theorem 4.12, p. 54; Corollary 4.14, p. 55; Corollary 8.17, p. 111;
  Theorem 9.2, p. 116; Lemmas 9.6–9.7, p. 120; Lemma 9.8, p. 121; Theorem 9.9, p. 122;
  Lemma 9.15, p. 125; (10.3), p. 133.
- [BH] A. E. Brouwer, W. H. Haemers, *Spectra of Graphs*, Universitext, Springer, 2012: Proposition
  1.3.4, pp. 5–6; Proposition 3.9.1, p. 50; Corollary 3.9.2 and Proposition 3.9.3, p. 51;
  §§3.10–3.11, pp. 51–53, with §3.11.1 and Proposition 3.11.1, p. 53; §5.3, Proposition 5.3.1,
  p. 86, and Remark (ii), p. 87; §7.2, p. 102; §7.3, p. 102, Theorem 7.3.1, p. 102, Theorem 7.3.2
  and Proposition 7.3.3, p. 103.
- [Bi] N. Biggs, *Algebraic Graph Theory*, 2nd ed., Cambridge Mathematical Library, Cambridge
  University Press, 1993: Proposition 6.4, p. 39.
- [Ch] F. R. K. Chung, *Spectral Graph Theory*, CBMS Regional Conference Series in Mathematics
  92, American Mathematical Society, 1997: Lemma 1.7, pp. 6–7.
- [CRS] D. Cvetković, P. Rowlinson, S. Simić, *An Introduction to the Theory of Graph Spectra*,
  LMS Student Texts 75, Cambridge University Press, 2010: Remarks 7.1.4, p. 186; Corollary 7.2.3,
  pp. 190–191; Corollary 7.4.6, p. 198; Remarks 7.4.8, p. 199; Theorem 7.5.1 and Corollaries
  7.5.2–7.5.3, p. 200; Theorem 7.7.2, pp. 213–214; Corollary 7.7.4, pp. 214–215.
- [GR] C. Godsil, G. Royle, *Algebraic Graph Theory*, Graduate Texts in Mathematics 207,
  Springer, 2001: §8.3, p. 167; Theorem 13.4.1, p. 287; Lemma 13.7.4, p. 293; Theorem 14.1.1,
  p. 308; §14.2, p. 310; §14.7, pp. 317–319; §14.8 and Theorem 14.8.1, pp. 319–320; §14.13 and
  Theorem 14.13.3, p. 329.
- [Ku] P. Kurasov, *Spectral Geometry of Graphs*, Operator Theory: Advances and Applications 293,
  Birkhäuser, 2024: Theorem 4.6, p. 77; Theorem 24.1, p. 584, with its proof, pp. 584–586;
  Lemma 24.2, p. 586; Lemma 24.4, p. 587; Lemma 24.5, p. 589; Theorem 24.6, p. 590.
- [Mo] B. Mohar, *Graph Laplacians*, Chapter 4 of L. W. Beineke, R. J. Wilson (eds.), *Topics in
  Algebraic Graph Theory*, Encyclopedia of Mathematics and its Applications 102, Cambridge
  University Press, 2005: Lemma 4.1, p. 123; Corollary 4.2, p. 124.
- [NP] K. Naderi, K. Pankrashkin, *Introduction to Spectral Graph Theory*, Compact Textbooks in
  Mathematics, Birkhäuser, 2025: Definition 1.1.25 (c), p. 11; Remark 2.7.4, p. 91; Example 2.7.5
  and Remark 2.7.6, p. 92; Definition 3.2.1, p. 117; Definition 3.2.3 and Proposition 3.2.4, p. 118;
  Definition 3.3.1 and Proposition 3.3.2, p. 122; Lemma 3.3.4, pp. 122–124; Theorem 3.3.5, p. 124,
  with its proof, pp. 125–128; Definition 4.4.1, p. 168; Definition 4.4.3, p. 169; Theorem 4.4.8,
  p. 172; Exercises 4.4.1–4.4.4, pp. 172–173; Theorem 4.5.1, p. 173; §4.8, pp. 187–194.
- [Sp] D. A. Spielman, *Spectral and Algebraic Graph Theory*, author manuscript, 2025:
  Theorem 3.2.1, p. 32; Theorem 13.4.1, p. 124; Theorem 13.5.1, p. 126.
- Attributions without a cited locator, whose proofs are the routes above: V. Chvátal and
  P. L. Hammer (threshold graphs, 10.1); E. B. Davies, G. M. L. Gladwell, J. Leydold and
  P. F. Stadler (discrete nodal domain theorems, 11.1); M. Fiedler (Layer 6).

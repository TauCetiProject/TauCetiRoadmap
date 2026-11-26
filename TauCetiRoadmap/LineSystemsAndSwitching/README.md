# Roadmap: line systems and switching

**Summary.** A finite simple graph is not determined by its spectrum, and this roadmap develops the
part of spectral graph theory that asks how much of a graph its spectrum does see. Two tools carry
it. The first reads a graph as a system of lines: when the least adjacency eigenvalue is at least
`-2`, the matrix `A + 2I` is the Gram matrix of vectors of squared length `2`, and the theorem of
Cameron, Goethals, Seidel and Shult places these vectors in one of the root systems `A_n`, `D_n`,
`E₈`; dually, a connected graph has index `θ₁ ≤ 2` exactly when it lies inside one of Smith's
graphs, the affine Dynkin diagrams. The second is switching, which changes a graph while keeping
a spectrum: Godsil–McKay switching produces cospectral mates with cospectral complements, and
Seidel switching relates regular two-graphs to strongly regular graphs.

The headline theorems are:
- Smith's classification: a connected graph has `θ₁ < 2` exactly when it is a simply-laced Dynkin
  diagram `A_n`, `D_n`, `E₆`, `E₇`, `E₈`, and `θ₁ = 2` exactly when it is the graph of one
  graphical affine type, a cycle, a tree `D̃_n`, or `Ẽ₆`, `Ẽ₇`, `Ẽ₈`; the index of a Dynkin
  diagram is `2 cos(π/h)` for its Coxeter number `h`;
- the Gram classification: an integral positive semidefinite matrix with diagonal `2` and a
  connected diagram is the Gram matrix of a spanning family in the root lattice of exactly one
  simply-laced Dynkin type;
- the theorem of Cameron, Goethals, Seidel and Shult: a connected graph with least eigenvalue at
  least `-2` is a generalized line graph or is represented in `E₈`, and then it has at most `36`
  vertices and maximum degree at most `28`;
- Godsil–McKay switching preserves the spectrum and the spectrum of the complement;
- complete graphs, regular complete bipartite graphs, cycles, disjoint unions of complete graphs
  and connected graphs with `θ₁ < 2` are determined by their spectrum, and for regular graphs the
  adjacency, Laplacian and signless Laplacian notions agree;
- for a graph switching equivalent neither to the complete nor to the empty graph, the two-graph
  is regular of degree `k` exactly when a descendant is strongly regular with `k = 2μ`, and such a
  graph, if regular, has a regular two-graph exactly when it is strongly regular with `k - n/2`
  as an eigenvalue;
- an equiangular family of `n` unit vectors spanning a space of dimension `d < n`, whose Seidel
  matrix has exactly two eigenvalues, meets the relative bound with equality,
  `n(1 - dα²) = d(1 - α²)`.

The roadmap builds on the spectral vocabulary of [GraphSpectra](../GraphSpectra/README.md) (spectra,
Perron–Frobenius, the monotonicity of the index, line graphs and the spectra of the standard
graphs). It takes the Seidel matrix, Seidel switching, two-graphs and equiangular families from
EquiangularLinesAndTwoGraphs, which also owns the bounds on equiangular lines and the consequences
of equality in them. It rests on Tau Ceti's recognition of Dynkin and affine Dynkin diagrams through
the form `2I - A`, on the affine recognition theorem of
[ZigzagPreprojective](../ZigzagPreprojective/README.md), 0.1, on the classification of root systems
of [RootSystems](../RepresentationTheory/RootSystems/README.md), §3.1, and on the root lattices of
[IntegralLattices](../IntegralLattices/README.md). Strong regularity is read off the spectrum
through StronglyRegularGraphsAndDesigns, Layer 1.

## How to read the build

Layer 1 treats small cospectral pairs, Seidel-cospectral regular graphs and Godsil–McKay
switching. Layer 2 proves the spectral form of Smith's theorem and computes the index of a Dynkin
diagram. Layer 3 builds the coordinate root systems and root representations, proves the Gram
classification and the theorem of Cameron, Goethals, Seidel and Shult. Layer 4 treats cocktail
party graphs, generalized line graphs and the exceptional graphs. Layer 5 treats graphs
determined by their spectrum, and Layer 6 the descendants of a two-graph, regular two-graphs and
strongly regular graphs, and the converse of the equality case of the relative bound. Layers 1,
2, 3 and 6 can start at once; Layer 4 uses Layer 3, and Layer 5 uses Layers 1 and 2.

## Conventions

- A graph is `G : SimpleGraph V` with `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`, and
  `n = Fintype.card V`. Statements hold for every finite `V`, the empty type included, unless a
  hypothesis is written.
- `A = G.adjMatrix R` and `L = G.lapMatrix R` are Mathlib's, and the signless Laplacian
  `Q = D + A` is GraphSpectra's `signlessLapMatrix` (1.2). `J` is the all-ones matrix. The matrix
  `2I - A` is Tau Ceti's `SimpleGraph.graphCartanMatrix`.
- `adjEigenvalues G i`, for `i : Fin n`, is `θ_{i+1}` in nonincreasing order, so index `0`
  carries the largest eigenvalue, and the index is `largestEigenvalue G = θ₁`, under
  `Nonempty V`: the definitions of SpectralGraphBounds 1.1, copied as GraphSpectra copies them.
  Spectra are GraphSpectra's multisets `adjSpectrum`, `lapSpectrum` and `signlessLapSpectrum`
  (1.2); no statement here uses an indexed Laplacian eigenvalue.
- The Seidel matrix `S = J - I - 2A` (`seidelMatrix`), Seidel switching with respect to a set
  `U : Set V` (`switch`), the odd triples of a graph (`oddTriples`), regularity of a two-graph of
  degree `a` (`IsRegularTwoGraph`), equiangular families (`IsEquiangular`) and the sign graph of
  a family (`signGraph`) are those of EquiangularLinesAndTwoGraphs 1.1, 1.2, 2.1, 2.3 and 3.1:
  `S` is `0` on the diagonal, `-1` at adjacent and `1` at distinct nonadjacent pairs, and
  switching interchanges adjacency and nonadjacency between `U` and its complement. "Switching
  equivalent to the complete graph" means that some `switch G U` is `⊤`.
- `T(a, b, c)` is the tree formed by one vertex joined to an end of each of three disjoint paths
  with `a`, `b` and `c` vertices; it has `a + b + c + 1` vertices and is Tau Ceti's diagram of
  `TauCeti.starCartanMatrix`.
- Dynkin types are Tau Ceti's `TauCeti.DynkinType`, with `Valid` and `IsSimplyLaced`, and
  `TauCeti.diagramGraph` of a Cartan matrix is its diagram; affine types are
  `TauCeti.AffineDynkinType`, with `Valid`, `IsGraphical` (excluding `Ã₁`, whose diagram is a
  double edge), `nodes` and `graph`.
- The coordinate root systems are sets of vectors in `Fin N → ℚ` with the dot product. A root
  representation maps vertices to roots with dot products `2`, `1`, `0` at equal, adjacent and
  distinct nonadjacent pairs.
- "Determined by its spectrum" quantifies over graphs on `Fin n`, which represent every finite
  graph of order `n` up to isomorphism.

## Layer 1: cospectral graphs and Godsil–McKay switching

Sources: [BH, Figure 1.1, p. 7; §1.8.2, p. 15; §1.8.3, p. 16]; [Bi, 2f, p. 12]; [GM].

### 1.1 Small cospectral pairs

Definitions:
- `cospectralSixFst` and `cospectralSixSnd` on `Fin 6`: the first is a vertex joined to all
  others with the two further edges `12` and `34`; the second is `K₄` minus the edge `23`, with
  pendant edges `24` and `35`.

Worked examples (finite computations, stated in `Suggested.lean` as sanity checks of the
definitions, not as headlines):
- **The smallest cospectral pair** (`adjSpectrum_star_eq_adjSpectrum_sum_cycle`). `K_{1,4}` and
  `K₁ ⊔ C₄` both have spectrum `2, 0³, -2` and are not isomorphic [BH, Figure 1.1, p. 7].
  **Suggested proof:** the spectra of complete bipartite graphs and cycles (GraphSpectra 2.6) and
  of disjoint unions (GraphSpectra 1.7); non-isomorphism by the degree sequences.
- **A connected cospectral pair on six vertices** (`cospectralSix`). Both graphs are connected,
  both have characteristic polynomial `t⁶ - 7t⁴ - 4t³ + 7t² + 4t - 1`, and they are not
  isomorphic, since only the first has a vertex of degree `5` [Bi, 2f, p. 12]. **Suggested
  proof:** `decide` on the integral characteristic polynomial and on the degrees.

**Checks.**
- The complements of `K_{1,4}` and `K₁ ⊔ C₄` are not cospectral: the complement of `K_{1,4}` is
  `K₄ ⊔ K₁`, with four triangles, and that of `K₁ ⊔ C₄` is two triangles sharing a vertex, with
  two (GraphSpectra 1.3 counts triangles from the spectrum). So this pair does not arise from
  Godsil–McKay switching (1.3).
- `cospectralSixFst` has degrees `5, 2, 2, 2, 2, 1` and `cospectralSixSnd` has `3, 3, 3, 3, 1, 1`;
  both have `7` edges, as the coefficient `-7` of `t⁴` requires.

*Needs:* GraphSpectra 1.2, 1.7, 2.6.

### 1.2 Seidel-cospectral regular graphs

- **Seidel-cospectral regular graphs** (`adjSpectrum_eq_of_charpoly_seidelMatrix_eq`). Two
  `k`-regular graphs whose real Seidel matrices have the same characteristic polynomial are
  cospectral [BH, §1.8.2, p. 15]. **Suggested proof:** the Seidel spectrum of a `k`-regular graph
  is `n - 1 - 2k` together with `-1 - 2θ` for the adjacency eigenvalues `θ` other than one copy of
  `k` (EquiangularLinesAndTwoGraphs 1.1, stated there in prose); equal characteristic polynomials
  have equal degree, so `n` agrees; remove `n - 1 - 2k` and invert `θ ↦ -1 - 2θ`.

**Checks.**
- The equal degree is needed: the edgeless graph on four vertices and `C₄` are switching
  equivalent, hence Seidel-cospectral, with adjacency spectra `0⁴` and `2, 0², -2`.
- The formula on the Petersen graph (`n = 10`, `k = 3`, other eigenvalues `1⁵, (-2)⁴`): the
  Seidel eigenvalues are `10 - 1 - 6 = 3`, `-1 - 2 = -3` five times and `-1 + 4 = 3` four times,
  that is `3⁵, (-3)⁵`.

*Needs:* EquiangularLinesAndTwoGraphs 1.1; GraphSpectra 1.2.

### 1.3 Godsil–McKay switching

Definitions:
- `GodsilMcKayPartition G ι`: a map `cell : V → Option ι` whose cells `X_i = cell⁻¹(some i)` are
  nonempty, with `Y = cell⁻¹ none`, such that the partition of `⋃ X_i` is equitable in the induced
  subgraph and every `y ∈ Y` has `0`, `|X_i|/2` or `|X_i|` neighbours in each `X_i`.
- `Flips` and `switch` (in the namespace `GodsilMcKayPartition`): for every `y ∈ Y` and every `i`
  with `y` adjacent to exactly half of `X_i`, the adjacency between `y` and `X_i` is
  complemented.
- `conjMatrix`: the block-diagonal matrix with blocks `(2/|X_i|) J - I` on the
  `X_i` and `I` on `Y`.

Basic API:
- `P.switch` agrees with `G` inside `⋃ X_i` and inside `Y`, and differs from it exactly at the
  pairs `{y, x}` with `y ∈ Y`, `x ∈ X_i` and `y` adjacent to exactly half of `X_i`.
- The cells of `P` form a Godsil–McKay partition of `P.switch`, and switching it returns `G`.

Targets:
- **The conjugating matrix** (`conjMatrix_conj`). `conjMatrix` is symmetric,
  squares to `I`, fixes `J`, and conjugates `A(G)` to `A(P.switch)` [BH, §1.8.3, p. 16]; [GM].
  **Suggested proof:** each block of `A` between two cells `X_i`, `X_j` has constant row and
  column sums by equitability, and so commutes with the blocks `(2/m)J - I`. A column of the block
  between `X_i` and `y ∈ Y` is `0`, all ones, or has exactly half its entries `1`, and
  `(2/m)J - I` fixes the first two and complements the third.
- **Godsil–McKay switching preserves the spectrum and the spectrum of the complement**
  (`adjSpectrum_switch`, `adjSpectrum_compl_switch`)
  [BH, §1.8.3, p. 16]; [GM]. **Suggested proof:** `conjMatrix_conj`; since `conjMatrix` is
  orthogonal and fixes `J`, it also conjugates `J - I - A(G)` to `J - I - A(P.switch)`.

**Checks.**
- On `Fin 7` with `X₁ = {0, 1, 2, 3}` and `Y = {4, 5, 6}`: let `G` have edges
  `04, 05, 06, 14, 25, 36`, the tree `T(2, 2, 2)`. Each `y ∈ Y` sees exactly two vertices of `X₁`,
  and `X₁` is independent, so the partition qualifies. The switched graph has edges
  `15, 16, 24, 26, 34, 35`, which is `C₆ ⊔ K₁`. Both have spectrum `2, 1², 0, (-1)², -2`, and their
  complements are cospectral.
- The cell sizes matter: on the same example, `conjMatrix` has the block `(1/2) J - I` on `X₁`,
  and `(1/2 J - I)² = I` because `J² = 4J`; with `(2/3) J - I` the square is not `I`.
- The condition on `Y` matters: on `Fin 4` with the single edge `03`, `X₁ = {0, 1, 2}` and
  `Y = {3}`, the vertex `3` sees one vertex of three, which is neither none, half nor all of `X₁`;
  complementing its adjacency to `X₁` gives `K_{1,2} ⊔ K₁`, with spectrum `±√2, 0, 0`, against
  `±1, 0, 0` for `K₂ ⊔ 2K₁`.

*Needs:* GraphSpectra 1.2, 3.8 (the complement).

## Layer 2: graphs with index at most two

Sources: [BH, Theorem 3.1.3, pp. 34–35; §3.1.1, p. 35; proof of Proposition 14.4.6,
pp. 208–209]; [CRS, Theorem 3.11.1, p. 92]; [Sm].

A connected graph with `θ₁ < 2` is a Dynkin diagram of type `A`, `D` or `E`, and one with
`θ₁ = 2` is the graph of a graphical affine type: a cycle `Ã_n` (`n ≥ 2`), a tree `D̃_n`
(`n ≥ 4`), or `Ẽ₆ = T(2, 2, 2)`, `Ẽ₇ = T(1, 3, 3)`, `Ẽ₈ = T(1, 2, 5)`. Tau Ceti and
ZigzagPreprojective classify these graphs through the form `2I - A`; this layer translates
between that form and the index.

### 2.1 The index and the form `2I - A`

- **The index and positive (semi)definiteness** (`largestEigenvalue_lt_two_iff_posDef`,
  `largestEigenvalue_le_two_iff_posSemidef`). For every graph on a nonempty vertex type, `θ₁ < 2`
  exactly when the real matrix `2I - A` is positive definite, and `θ₁ ≤ 2` exactly when it is
  positive semidefinite [BH, proof of Theorem 3.1.3, p. 34]. **Suggested proof:** the eigenvalues
  of `2I - A` are `2 - θ_i`, and `θ₁` is the largest of the `θ_i`.
- Positive definiteness of `2I - A` over `ℝ` and over `ℚ` agree (stated in prose). **Suggested
  proof:** the real form restricts to the rational one; conversely, a rational positive definite
  symmetric matrix has a rational factorization `LDLᵀ` with `L` unitriangular and `D` diagonal
  with positive entries (Gaussian elimination without pivoting), which stays one over `ℝ`.

**Checks.**
- `K₃`: `θ₁ = 2`, and `2I - A` has the null vector `(1, 1, 1)`: semidefinite, not definite.
- `P₃`: `θ₁ = √2 < 2`, and `2I - A` has leading minors `2, 3, 4`.
- `K₄`: `θ₁ = 3 > 2`, and `(1, 1, 1, 1)` gives `2·4 - 2·6 = -4 < 0`.

*Needs:* GraphSpectra 1.2; Mathlib `Matrix.IsHermitian.eigenvalues₀`.

### 2.2 Smith's theorem

- **Smith, part one** (`Connected.largestEigenvalue_lt_two_iff`). A connected graph has `θ₁ < 2`
  exactly when it is isomorphic to the diagram of a valid simply-laced Dynkin type [BH, Theorem
  3.1.3, p. 34]; [Sm]. **Suggested proof:** 2.1 and Tau Ceti's
  `SimpleGraph.posDef_graphCartanMatrix_iff`.
- **`θ₁ = 2` is a natural null vector** (`Connected.largestEigenvalue_eq_two_iff_exists_nat`). A
  connected graph has `θ₁ = 2` exactly when there is a nonzero `a : V → ℕ` with
  `Σ_{j ∼ i} a_j = 2a_i` for all `i`. **Suggested proof:** if `θ₁ = 2`, the eigenvalue `2` is
  simple with a positive eigenvector (GraphSpectra 3.2); the eigenspace is the kernel of the
  rational matrix `2I - A`, of dimension one, so it is spanned by a rational vector, which after
  a sign change and clearing denominators is a positive integral eigenvector. Conversely, a
  nonzero nonnegative eigenvector belongs to `θ₁` (GraphSpectra 3.2).
- **Smith, part two** (`Connected.largestEigenvalue_eq_two_iff`). A connected graph has `θ₁ = 2`
  exactly when it is the graph of exactly one valid graphical affine type [BH, Theorem 3.1.3,
  p. 34]; [CRS, Theorem 3.11.1, p. 92]. **Suggested proof:** the previous target and the affine
  recognition theorem of ZigzagPreprojective 0.1: a connected finite graph carries a nonzero
  natural function `a` with `Σ_{j ∼ i} a_j = 2a_i` exactly when it is the graph of a unique valid
  graphical affine type.

**Checks.**
- `θ₁(K_{1,4}) = 2`; `K_{1,4}` is `D̃₄`, with null vector `2` at the centre and `1` at the leaves.
- The null vector of `Ẽ₈ = T(1, 2, 5)` is its vector of marks: `6` at the centre, `3` on the arm
  of one vertex, `4, 2` on the arm of two, and `5, 4, 3, 2, 1` on the arm of five.
- The connectivity hypothesis is needed in part two: `C₃ ⊔ C₄` has `θ₁ = 2` and the positive
  null vector `(1, …, 1)`, but it is disconnected, so it is the graph of no affine type.
- `C₅ = Ã₄` has `θ₁ = 2` with null vector `(1, …, 1)`, and `P₅ = A₅` has `θ₁ = √3 < 2`.

*Needs:* 2.1; GraphSpectra 3.2; ZigzagPreprojective 0.1; Tau Ceti
`SimpleGraph.posDef_graphCartanMatrix_iff`.

### 2.3 Subgraphs and supergraphs of Smith graphs

- **Graphs with `θ₁ ≤ 2` lie in Smith graphs**
  (`Connected.exists_embedding_of_largestEigenvalue_le_two`). A connected graph with `θ₁ ≤ 2` is
  an induced subgraph of the graph of a valid graphical affine type [BH, Theorem 3.1.3, p. 34].
  **Suggested proof:** for `θ₁ = 2` take the identity (2.2). For `θ₁ < 2` the graph is a Dynkin
  diagram (2.2), and `TauCeti.AffineDynkinType.bourbakiGraphEmbedding` embeds the diagram of the
  finite type of an affine type into its graph; `A_n` for `n ≥ 2` lies in the cycle `Ã_n`, and
  `A₁`, a single vertex, in the triangle `Ã₂`.
- **Graphs with `θ₁ > 2` contain Smith graphs**
  (`Connected.exists_isContained_of_two_lt_largestEigenvalue`). A connected graph with `θ₁ > 2`
  contains, as a subgraph with fewer vertices or fewer edges, the graph of a valid graphical
  affine type [BH, Theorem 3.1.3, p. 35]. **Suggested proof:** by 2.2 the graph is not the
  diagram of a simply-laced type, and the diagrams of the other valid types are paths, which have
  `θ₁ < 2`; so Tau Ceti's
  `SimpleGraph.Connected.exists_isContained_affineDynkinType_of_not_exists_dynkinType_iso` gives a
  copy of an affine graph. A copy with as many vertices and edges as the graph is an isomorphism,
  which would give `θ₁ = 2` (2.2); so the copy misses a vertex or an edge.

**Checks.**
- `T(1, 2, 6)` has `θ₁ ≈ 2.0066 > 2` and contains `T(1, 2, 5)`, with one vertex fewer.
- `K₄` has `θ₁ = 3` and contains the triangle `Ã₂`, with one vertex fewer, and the `4`-cycle
  `Ã₃`, with two edges fewer.
- `P₃` (`θ₁ = √2`) is an induced subgraph of `C₄` but not of `C₃`.

*Needs:* 2.2; Tau Ceti `TauCeti.AffineDynkinType.bourbakiGraphEmbedding`,
`SimpleGraph.Connected.exists_isContained_affineDynkinType_of_not_exists_dynkinType_iso`.

### 2.4 The Coxeter number and the index of a Dynkin diagram

Definitions:
- `coxeterNumber t` for `t : DynkinType`: `n + 1`, `2n`, `2n`, `2n - 2`, `12`, `18`, `30`, `12`,
  `6` for `A_n`, `B_n`, `C_n`, `D_n`, `E₆`, `E₇`, `E₈`, `F₄`, `G₂`.

Targets:
- **The index of a Dynkin diagram** (`largestEigenvalue_diagramGraph`). For a valid
  simply-laced `t`, `θ₁ = 2 cos(π/h)` with `h = coxeterNumber t` [BH, §3.1.1, p. 35]; [BH, proof
  of Proposition 14.4.6, p. 208]. **Suggested proof:** `A_n` is the path `P_n`
  (`TauCeti.DynkinType.diagramGraph_cartanMatrix_A`), whose spectrum is GraphSpectra 2.6. `D_n` is
  `T(1, 1, n - 3)` (`TauCeti.starHasCartanType_D`), with eigenvalues `0` and
  `2 cos((2j - 1)π/(2n - 2))`, `j = 1, …, n - 1`, from the eigenvectors symmetric and
  antisymmetric in the two leaves. `E₆`, `E₇`, `E₈` are `T(1, 2, 2)`, `T(1, 2, 3)`, `T(1, 2, 4)`
  (`TauCeti.starHasCartanType_E6`, `TauCeti.starHasCartanType_E7`,
  `TauCeti.starHasCartanType_E8`); factor the characteristic polynomial and compare with the
  minimal polynomial of `2 cos(π/h)`.

API around the classification (prose):
- the connected graphs with `θ₁ < 2` on `n` vertices: `P_n` for `n ≥ 1`, `T(1, 1, n - 3)` for
  `n ≥ 4`, and `T(1, 2, n - 4)` for `n = 6, 7, 8`;
- the connected graphs with `θ₁ = 2` on `n + 1` vertices: `C_{n+1}` for `n ≥ 2`, `D̃_n` for
  `n ≥ 4`, and `T(2, 2, 2)`, `T(1, 3, 3)`, `T(1, 2, 5)`;
- `θ₁ ≤ 2` for a disconnected graph is the conjunction over its components (GraphSpectra 1.7);
- the number of roots `TauCeti.DynkinType.numRoots t` is `t.rank * coxeterNumber t` for every
  Dynkin type, by cases on the type.

**Checks.**
- `θ₁(P_n) = 2 cos(π/(n + 1))`, so `θ₁(P₁) = 0`, `θ₁(P₂) = 1`, `θ₁(P₃) = √2`.
- `θ₁(K_{1,3}) = √3 = 2 cos(π/6)`, and `D₄` has `h = 6`. `E₆` and `D₇` both have `h = 12`, with
  `θ₁ = 2 cos(π/12)`, on different numbers of vertices.
- The Coxeter number of `B_n` is `2n`, not the dual Coxeter number `2n - 1`: with `2n` the root
  count `2n²` of `B_n` is `rank · h`; with `2n - 1` it would be `2n² - n`.
- `E₈`: `8 · 30 = 240`; `E₇`: `7 · 18 = 126`; `E₆`: `6 · 12 = 72`.

*Needs:* GraphSpectra 2.6; Tau Ceti `TauCeti.DynkinType.diagramGraph_cartanMatrix_A`,
`TauCeti.starHasCartanType_D`, `TauCeti.starHasCartanType_E6`, `TauCeti.starHasCartanType_E7`,
`TauCeti.starHasCartanType_E8`, `TauCeti.DynkinType.numRoots`.

## Layer 3: Gram representations, root systems and root lattices

Sources: [BH, §8.2, p. 105; §8.3.2, pp. 108–109; §8.3.3, pp. 109–111;
Theorem 8.4.1, pp. 111–112]; [CGSS]; [CRS, Definition 3.4.1, p. 60, Theorems 3.4.2 and 3.4.3,
pp. 61–62]; [Wi].

### 3.1 The coordinate root systems

Definitions:
- `rootsA n ⊆ Fin (n + 1) → ℚ`: the vectors `e_i - e_j`, `i ≠ j`.
- `rootsD n ⊆ Fin n → ℚ`: the vectors `±e_i ± e_j`, `i ≠ j`.
- `rootsE8 ⊆ Fin 8 → ℚ`: `rootsD 8` together with the vectors `½(±1, …, ±1)` with an even number
  of minus signs.

Targets:
- **Root counts** (`ncard_roots`): `|A_n| = n(n + 1)`, `|D_n| = 2n(n - 1)`, `|E₈| = 240`
  [BH, §8.3.3, pp. 109–110]. **Suggested proof:** count ordered pairs `i ≠ j` and signs, each
  vector arising from two of them in `D_n`; `|E₈| = 112 + 128`. It agrees with Tau Ceti's count
  `TauCeti.DynkinType.representationNumber_rootLattice_two` through the coordinate models below.

Basic API (prose):
- every element of the three sets has squared norm `2`, and the sets are closed under negation and
  under the reflections `s_r(v) = v - (v ⬝ r) r` in their own elements; the dot product of two
  distinct non-opposite roots lies in `{-1, 0, 1}`;
- the inclusions `A_{n-1} ⊆ D_n` in `ℚ^n`, `D_n ⊆ D_{n+1}`, `D₈ ⊆ E₈`, and the copies of
  `E₆ ⊆ E₇ ⊆ E₈` as the roots orthogonal to suitable root subsystems;
- **the coordinate models**: the `ℤ`-span of `rootsA n` is the zero-sum lattice
  `TauCeti.IntegralLattice.zeroSumLattice`, isometric to the root lattice of type `A_n`
  (`TauCeti.IntegralLattice.typeAIsometryZeroSumLattice`, `TauCeti.DynkinType.rootLattice_A`);
  for `n ≥ 2` that of `rootsD n` is `TauCeti.IntegralLattice.checkerboardLattice` (at `n = 1`
  the set is empty and spans `0`, while the checkerboard lattice is `2ℤ`), isometric to the
  root lattice of type `D_n` for `n ≥ 4` (`TauCeti.DynkinType.rootLatticeIsometryCheckerboard`);
  that of `rootsE8` is `D₈⁺`, isometric to the root lattice of type `E₈`
  (`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`, `TauCeti.DynkinType.rootLattice_E8`). In each
  case the norm-`2` vectors of the span are exactly the set, and they correspond to the roots of
  the type (`TauCeti.DynkinType.rootLatticeRootEquiv`).

**Checks.**
- `|A₃| = 12 = |D₃|`, matching `A₃ = D₃`; `|D₄| = 24`, `|D₈| = 112`.
- `n = 0, 1`: `rootsA 0`, `rootsD 0` and `rootsD 1` are empty, as `0 · 1 = 0` and `2 · 1 · 0 = 0`
  predict.
- The parity condition matters: all `2⁸ = 256` sign vectors `½(±1, …, ±1)` would give `368`
  vectors, and the half vector with one minus sign has dot product `3/2` with `½(1, …, 1)`, not
  an integer.

*Needs:* Tau Ceti's root lattices (IntegralLattices, native rows 0G and 1K).

### 3.2 The Euclidean representation and root representations

Definitions:
- `RootRepresentation G Φ`: a map `V → Fin N → ℚ` into `Φ` with dot products `2`, `1`, `0` at
  equal, adjacent and distinct nonadjacent pairs.

Targets:
- **The Euclidean representation** (`forall_neg_two_le_adjEigenvalues_iff`). All
  adjacency eigenvalues are at least `-2` exactly when `A + 2I` is positive semidefinite, and
  exactly when `A + 2I` is the Gram matrix of a family of vectors in `ℝ^r` with
  `r = rank(A + 2I)` [BH, §8.2, p. 105]. **Suggested proof:** the eigenvalues of `A + 2I` are
  `θ_i + 2`; factor a positive semidefinite matrix as `BᵀB` through its spectral decomposition,
  keeping the rows of the nonzero eigenvalues; the converse is `Matrix.posSemidef_gram`.

Basic API (prose): a root representation forces all eigenvalues to be at least `-2`, since
`A + 2I` is the Gram matrix of the representing vectors; it is injective, transports along graph
isomorphisms and restricts to induced subgraphs.

**Checks.**
- `C₄ = L(C₄)`, with colour classes `{0, 2}`, `{1, 3}`: the vectors
  `e₀ - e₁, e₂ - e₁, e₂ - e₃, e₀ - e₃` in `A₃` have dot products `1` around the cycle and `0` across
  it. The cyclic choice `e₀ - e₁, e₁ - e₂, e₂ - e₃, e₃ - e₀` fails: consecutive dot products are
  `-1`.
- The Petersen graph has least eigenvalue `-2` and a root representation in `E₈`; `A + 2I` has
  rank `6`.
- `K_{1,5}` has least eigenvalue `-√5 < -2`, so it has no root representation.

*Needs:* GraphSpectra 1.2; Mathlib `Matrix.posSemidef_gram`.

### 3.3 The Gram classification

- **The Gram classification** (`exists_dynkinType_gram`). Let `M` be an integral symmetric
  positive semidefinite `ι × ι` matrix, `ι` nonempty, with diagonal `2` and connected diagram
  `TauCeti.diagramGraph M`. Then for exactly one valid simply-laced Dynkin type `t`, of rank `r`,
  there are integral vectors `f i ∈ ℤ^r` spanning `ℤ^r` with `f iᵀ C_t f j = M i j`, where `C_t`
  is the Cartan matrix of `t` [BH, §8.3.3, pp. 109–111]; [CRS, Theorem 3.4.3, p. 62]; [Wi].
  **Suggested proof:** the `ℤ`-module `ℤ^ι` modulo the radical of `M` is a positive definite even
  lattice `Λ` generated by the images of the basis vectors, of norm `2`. Its norm-`2` vectors are
  finitely many and form a reduced crystallographic root system (each reflection
  `v ↦ v - (v, r) r` preserves `Λ`), irreducible because the generators form a connected graph and
  lie in one component, and simply-laced because all roots have norm `2`. A base exists
  (`RootPairing.nonempty_base`) and is a `ℤ`-basis of `Λ`, since
  every root is an integral combination of the base and the roots generate `Λ` [BH, §8.3.2,
  pp. 108–109]. Its Gram matrix
  is its Cartan matrix, and `TauCeti.existsUnique_dynkinType` (RootSystems §3.1) gives the type
  `t`; the coordinates of the generators in the base are the `f i`. For uniqueness, any such `f`
  identifies `Λ` with the root lattice of `t`, whose norm-`2` vectors are the roots of `t`
  (`TauCeti.DynkinType.rootLatticeRootEquiv`), so `t` is the type of the root system of `Λ`.

**Checks.**
- `M = A(K₃) + 2I` has determinant `4` and rank `3`: type `A₃`, of determinant `4`, with `f` the
  representation `e₀ - e₁, e₀ - e₂, e₀ - e₃` in coordinates.
- `M = A(C₄) + 2I` is singular of rank `3`, and `C₄` gives the lattice `A₃` (the vectors of 3.2
  span the zero-sum lattice of rank `3`); the radical is spanned by `(1, -1, 1, -1)`.
- `M = A(K_{1,4}) + 2I` gives the lattice of rank `4` and determinant `4`: type `D₄`, not `A₄`,
  whose determinant is `5`. The Petersen graph gives the lattice of rank `6` and determinant `3`:
  type `E₆`, not `A₆` (determinant `7`) or `D₆` (determinant `4`).
- The connectivity hypothesis is needed: `M = 2I` on two indices is the Gram matrix of `A₁ ⊕ A₁`,
  of no single type. Positive semidefiniteness is needed: `A(K_{1,5}) + 2I` has the eigenvalue
  `2 - √5 < 0`, so it is the Gram matrix of no family of vectors.

*Needs:* 3.1; RootSystems §3.1; IntegralLattices, native rows 0G and 1K; Mathlib
`RootPairing.nonempty_base`; Tau Ceti `TauCeti.existsUnique_dynkinType`,
`TauCeti.IsFiniteType.existsUnique_dynkinType`, `TauCeti.DynkinType.rootLatticeRootEquiv`.

### 3.4 The theorem of Cameron, Goethals, Seidel and Shult

- **Cameron, Goethals, Seidel and Shult** (`Connected.exists_rootRepresentation`). A
  connected graph with all adjacency eigenvalues at least `-2` has a root representation in some
  `A_n`, in some `D_n`, or in `E₈` [BH, Theorem 8.4.1(i), p. 111]; [CGSS]. **Suggested proof:**
  for `V` empty there is nothing to prove. Otherwise `M = A + 2I` is integral, symmetric, positive
  semidefinite (3.2) with diagonal `2`, and its diagram is `G`, which is connected. By 3.3 the
  vertices map to norm-`2` vectors of the root lattice of a type `A_n`, `D_n`, `E₆`, `E₇` or `E₈`
  with Gram matrix `M`. Through the coordinate models of 3.1 these are elements of `rootsA n`,
  `rootsD n` or `rootsE8`, with `E₆` and `E₇` inside `E₈`.

**Checks.**
- `K₃ = L(K_{1,3})` is represented in `A₃` by `e₀ - e₁, e₀ - e₂, e₀ - e₃`.
- The Petersen graph is the line graph of no graph and is represented in `E₈`, not in any `A_n`.
- `K_{1,4}` (least eigenvalue `-2`) is represented in `D₄` by `e₁ + e₂` at the centre and
  `e₁ ± e₃`, `e₂ ± e₄` at the leaves, and in no `A_n`, since it contains `K_{1,3}` and so is not a
  line graph (4.3).
- The bound `-2` is needed, by the last Check of 3.2.

*Needs:* 3.1, 3.2, 3.3.

## Layer 4: generalized line graphs and exceptional graphs

Sources: [CRS, p. 6; Definition 1.2.3, pp. 8–9; Definition 3.4.1, p. 60; Theorems 3.4.4–3.4.6,
p. 62; §6.4, p. 171];
[BH, Theorem 8.4.1, pp. 111–112]; [GR, §12.1, pp. 265–266].

### 4.1 Cocktail party graphs

Definitions:
- `cocktailPartyGraph m` on `Fin m × Fin 2`: an abbreviation for Mathlib's
  `SimpleGraph.completeEquipartiteGraph m 2`, so `p ∼ q` when `p.1 ≠ q.1`; this is the complete
  multipartite graph `K_{m×2}` [CRS, p. 6]. No second carrier is introduced.

Not a separate target: the spectrum of `CP(m)` for `m ≥ 1` is `2m - 2` once, `0` with
multiplicity `m` and `-2` with multiplicity `m - 1` [CRS, §6.4, p. 171]; it is the case `r = m`,
`t = 2` of the complete equipartite spectrum of GraphSpectra 2.6.

Basic API (prose): `cocktailPartyGraph m` is `(2m - 2)`-regular and is isomorphic to the
complement of the perfect matching on `2m` vertices, and to the petal graph at a vertex of 4.2,
whose petal index is `Bool`.

**Checks.**
- `CP(1)`: two isolated vertices, spectrum `0, 0`; the formula gives `0` and `0¹`, with no `-2`.
- `CP(2) = C₄` with spectrum `2, 0², -2`, and `CP(3)` is the octahedron `L(K₄)` with spectrum
  `4, 0³, (-2)²`.
- Negative control for the argument order: `completeEquipartiteGraph 2 3` is `K_{3,3}`, with
  spectrum `3, 0⁴, -3`, not the spectrum `4, 0³, (-2)²` of `CP(3) = completeEquipartiteGraph 3 2`.

*Needs:* GraphSpectra 2.6.

### 4.2 Generalized line graphs

Definitions:
- `generalizedLineGraph H a` on `H.edgeSet ⊕ Σ x, Fin (a x) × Bool`, through
  `GeneralizedLineGraphRel`: edges are adjacent as in `H.lineGraph`; the petal vertex `⟨x, i, b⟩`
  is adjacent to the edges of `H` at `x` and to the petal vertices `⟨x, j, b'⟩` with `j ≠ i`. Thus
  the petal vertices at `x` form `cocktailPartyGraph (a x)`. This is the line graph, with
  adjacency "exactly one common vertex", of the multigraph `Ĥ` obtained by attaching `a_x`
  petals (pairs of parallel pendant edges) at each `x` [CRS, Definition 1.2.3, pp. 8–9];
  [GR, §12.1, pp. 265–266].
- `glgIncidence H a`: the signed vertex–edge incidence matrix of `Ĥ`, with `+1` at both ends of an
  edge of `H`, `+1` at `x` for each petal edge, and `±1` at the outer end of a petal according to
  the `Bool` index.

Targets:
- **The incidence identity** (`glgIncidence_transpose_mul`): `CᵀC = A(L(H; a)) + 2I` over `ℤ`.
  Hence `θ_min(L(H; a)) ≥ -2` (3.2). **Suggested proof:** entrywise count; for `a = 0` this is
  the identity `UᵀU = 2I + A(L(H))` of GraphSpectra 2.5.
- **Two special cases** (`nonempty_iso_generalizedLineGraph`): `a = 0` gives `H.lineGraph`, and
  the one-vertex graph with `a = m` gives `cocktailPartyGraph m`, the line graph of a blossom of
  `m` petals [CRS, p. 8]. **Suggested proof:** for `a = 0` there are no petal vertices, and the
  one-vertex graph has no edges.

Basic API (prose): the generalized line graph is transported by isomorphisms of `H` and by
permutations of the petals, and its degree at an edge `xy` is
`deg x + deg y - 2 + 2a_x + 2a_y`, at a petal vertex at `x` it is `deg x + 2a_x - 2`.

**Checks.**
- `L(H; a)` for `H` a single edge `xy` with `a_x = 1`, `a_y = 0` has three vertices: the edge and
  the two vertices of one petal at `x`, which are adjacent to the edge and not to each other. It
  is `P₃`, with least eigenvalue `-√2`.
- The petal vertices of one petal are not adjacent: with them adjacent, `L(K₁; 1)` would be `K₂`
  instead of `CP(1) = 2K₁`, and the identity `CᵀC = A + 2I` would fail at that pair, where the two
  columns have dot product `1 - 1 = 0`.
- The degree formulas on `L(K₃; a)` with `a = (1, 0, 0)`: the edges `01` and `02` have degree
  `2 + 2 - 2 + 2 = 4`, the edge `12` has degree `2`, and the two petal vertices have degree
  `2 + 2 - 2 = 2`.

*Needs:* 3.2, 4.1; GraphSpectra 2.5.

### 4.3 Representations in `A_n` and `D_n`

- **Representations in `A_n` are line graphs of bipartite graphs**
  (`nonempty_rootRepresentation_rootsA_iff`). `G` has a root representation in `A_n`
  exactly when it is isomorphic to the line graph of a bipartite graph on `n + 1` vertices
  [CRS, Theorem 3.4.4, p. 62]. **Suggested proof:** a vertex `e_i - e_j` gives the edge `ij`; dot
  products `≥ 0` force every coordinate to occur with only one sign, which splits the coordinates
  into the two colour classes.
- **Representations in `D_n` are generalized line graphs**
  (`exists_rootRepresentation_rootsD_iff`) [CRS, Theorem 3.4.5, p. 62]. **Suggested
  proof:** for the forward direction, the vectors `e_i + e_j` and `e_i - e_j` with the same
  support are the petals at the coordinate used with both signs; vectors `±(e_i + e_j)` with
  distinct supports form the line graph part, after a normalization of signs by coordinate. The
  backward direction is `glgIncidence` with one coordinate per vertex of `Ĥ`.

**Checks.**
- `K_{1,3}` is not a line graph, so it has no root representation in any `A_n`; it is the
  generalized line graph `L(P₃; (1, 0, 0))`, the edge `xy` of the path `x y z` being adjacent to
  the edge `yz` and to the two vertices of a petal at `x`, so it has one in some `D_n`. Likewise
  `K_{1,4} = L(K₂; (1, 1))`.
- `K₃` is represented in `A₃` (3.4) and is `L(K_{1,3})`; `K_{1,3}` is bipartite on `4` vertices.

*Needs:* 3.1, 3.2, 4.2.

### 4.4 Exceptional graphs

- **The exceptional graphs are bounded**
  (`RootRepresentation.card_le_and_degree_le`). A graph with a root representation in
  `E₈` has at most `36` vertices and maximum degree at most `28` [BH, Theorem 8.4.1(iii),
  p. 112]. **Suggested proof:** the matrices `P_x = x xᵀ` lie in the `36`-dimensional space of
  symmetric `8 × 8` matrices, and their trace Gram matrix is `((x ⬝ y)²) = 4I + A`, which is
  positive definite because `θ_min ≥ -2`; so they are linearly independent. For the degree, the
  `56` roots `s` of `E₈` with `x ⬝ s = 1` fall into `28` pairs `s, x - s` with dot product `-1`,
  and a representation uses at most one root of each pair.
- **Generalized line graphs and exceptional graphs**
  (`Connected.isGeneralizedLineGraph_or_rootRepresentation_E8`). A connected graph
  with all eigenvalues at least `-2` is a generalized line graph or is represented in `E₈`
  [BH, Theorem 8.4.1(i), p. 111]; [CRS, Theorem 3.4.6, p. 62]. **Suggested proof:** 3.4, with the
  `A_n` case absorbed into the `D_n` case through `A_n ⊆ D_{n+1}` (3.1), then 4.3.

**Checks.**
- Both bounds are attained [BH, p. 112, where the remark after the proof assigns them to part
  (ii), a misprint for (iii)]: join each vertex `i` of `K₈` to the vertices `jk` of `L(K₈)` with
  `i ∉ {j, k}`. The resulting graph has `8 + 28 = 36` vertices, least eigenvalue
  `-2`, and degree `28` at the vertices of `K₈`. The representation given there,
  `i ↦ ½(e₁ + ⋯ + e₈) - e_i` and `jk ↦ e_j + e_k`, uses half vectors with one minus sign, which
  lie outside `rootsE8`; negating the first coordinate of every vector gives a representation in
  `rootsE8` with the same dot products.
- The Schläfli graph (`27` vertices, `16`-regular, least eigenvalue `-2`) is another exceptional
  graph.

*Needs:* 3.1, 3.4, 4.3.

### 4.5 Regular generalized line graphs

- **Regular generalized line graphs**
  (`Connected.isLineGraph_or_cocktailParty_of_isRegularOfDegree`). A connected regular
  generalized line graph is a line graph or a cocktail party graph [BH, Theorem 8.4.1(ii),
  p. 112]. **Suggested proof:** if some `a_x > 0`, compare the degree of a petal vertex at `x`
  with that of an edge `xy`: regularity forces `deg y + 2a_y = 0` for every neighbour `y` of `x`,
  so `x` has no neighbours, and connectedness makes `G` a single cocktail party graph.

**Checks.**
- `L(K₄) = CP(3)`, an example of both kinds.
- The connectivity hypothesis is needed: `K₇ ⊔ CP(4)` is a `6`-regular generalized line graph
  (`K₇ = L(K_{1,7})`) that is neither a line graph nor a cocktail party graph.

*Needs:* 4.1, 4.2.

## Layer 5: graphs determined by their spectrum

Sources: [BH, Proposition 14.4.1, p. 206; Corollary 14.4.2 and Lemma 14.4.3, p. 207;
Propositions 14.4.4–14.4.6, p. 208; Proposition 14.4.7, p. 209]; [vDH].

### 5.1 Spectral determination and spectral recognition

Definitions:
- `IsDeterminedByAdjSpectrum G`, `IsDeterminedByLapSpectrum G`,
  `IsDeterminedBySignlessLapSpectrum G`: every graph on `Fin n` with the same spectrum for the
  matrix in question is isomorphic to `G`.

Targets:
- **The number of edges** (`card_edgeFinset_eq_of_adjSpectrum_eq`): the adjacency spectrum
  determines the number of edges [BH, Lemma 14.4.3(ii), p. 207]. **Suggested proof:**
  `Σ θ_i² = tr A² = 2m` (SpectralGraphBounds 1.1).
- **Regularity and the degree** (`IsRegularOfDegree.of_spectrum_eq`): each of the three spectra
  recognizes whether a graph is `k`-regular [BH, Lemma 14.4.3(iii), p. 207, and Proposition
  14.4.1, p. 206]. **Suggested proof:** for `A`, a graph on a nonempty vertex type is regular
  exactly when `n θ₁ = 2m` (SpectralGraphBounds 1.2), and then its degree is `θ₁`; `n`, `θ₁` and
  `2m = Σ θ_i²` (SpectralGraphBounds 1.1) are read off the spectrum. For `L` and `Q`, the
  spectrum gives `n`, `tr L = tr Q = Σ d_i` and `tr L² = tr Q² = Σ d_i² + Σ d_i`, and
  `(Σ d_i)² ≤ n Σ d_i²` with equality exactly for equal degrees, the degree then being
  `Σ d_i / n`.

Further spectral recognition (prose): the three spectra determine the number of vertices and
of edges (`tr L = tr Q = 2m`, GraphSpectra 1.3); the adjacency spectrum determines the number of
closed walks of each length (`Σ θ_iʰ = tr Aʰ`, Tau Ceti's
`Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`, and Mathlib's
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`) and hence bipartiteness (no closed walk of odd
length); the Laplacian spectrum determines the number of components (the multiplicity of `0`,
Mathlib's `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`) and the number
of spanning trees (`n N = ν₁ ⋯ ν_{n-1}`, LaplacianSpectraAndSpanningTrees 2.3)
[BH, Lemma 14.4.3, p. 207].

Basic API (prose): each predicate is invariant under isomorphism of `G`.

**Checks.**
- `K_{1,4}` and `K₁ ⊔ C₄` (1.1): `Σ θ_i² = 4 + 4 = 8 = 2m`, four edges each; `n θ₁ = 10 > 8`, so
  neither is regular.
- The closed walks of length `4` number `2m + 4 Σ_v C(deg v, 2) + 8·#C₄`: `6 + 8 = 14` for `P₄`
  (degrees `1, 2, 2, 1`) and `6 + 12 = 18` for `K_{1,3}`.
- The choice of matrix matters: `4K₁` and `K_{1,3}` are switching equivalent, so they have the
  same Seidel spectrum `3, (-1)³`, but only the first is regular. The Seidel matrix is
  `-2(A - ½J) - I`, and `β = -1/2` is in the range `-1 < β < 0` of [BH, Proposition 14.4.1,
  p. 206] where regularity need not be recognized.

*Needs:* GraphSpectra 1.2, 1.3; SpectralGraphBounds 1.1, 1.2; LaplacianSpectraAndSpanningTrees
2.3; Tau Ceti `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`; Mathlib
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk` and
`SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`.

### 5.2 Regular graphs

- **For regular graphs the three notions agree, and agree for the complement**
  (`IsRegularOfDegree.isDeterminedBySpectrum_iff`) [BH, Corollary 14.4.2, p. 207].
  **Suggested proof:** regularity and the degree are recognized (5.1); for a `k`-regular graph
  `L = kI - A` and `Q = kI + A`, and the spectrum of the complement is `n - 1 - k` together with
  `-1 - θ` for the other `θ` (GraphSpectra 3.8).

**Checks.**
- `C₄`: adjacency spectrum `2, 0², -2`, Laplacian spectrum `0, 2², 4` (the values `2 - θ`),
  signless Laplacian spectrum `4, 2², 0` (the values `2 + θ`), and the complement `2K₂` has
  spectrum `1, 1, -1, -1`: `n - 1 - k = 1` and `-1 - θ` for `θ = 0, 0, -2`.
- Regularity is needed: `K_{1,4}` is not determined by its adjacency spectrum (5.4), while its
  complement `K₄ ⊔ K₁` is (5.3).

*Needs:* 5.1; GraphSpectra 3.8.

### 5.3 Graphs determined by their spectrum

- **Complete graphs, regular complete bipartite graphs and cycles**
  (`isDeterminedByAdjSpectrum_top`, `isDeterminedByAdjSpectrum_completeBipartiteGraph`,
  `isDeterminedByAdjSpectrum_cycleGraph` for `n ≥ 3`). With 5.2, `K_n`, `K_{m,m}`, `C_n` and their
  complements are determined by their spectra for `A`, `L` and `Q` [BH, Proposition 14.4.4,
  p. 208]. **Suggested proof:** `K_n` has the maximal number of edges. A graph cospectral with
  `K_{m,m}` is regular and bipartite with `2m` vertices and `m²` edges, hence `m`-regular
  bipartite on `m + m` vertices, which is `K_{m,m}`. A graph cospectral with `C_n` is `2`-regular,
  hence a disjoint union of cycles, and the multiplicity of the eigenvalue `2` of a `2`-regular
  graph is its number of components (GraphSpectra 3.2), which is `1`.
- **Disjoint unions of complete graphs**
  (`isDeterminedByAdjSpectrum_of_isCompleteMultipartite_compl`). If `Gᶜ` is complete
  multipartite, `G` is determined by its adjacency spectrum [BH, Proposition 14.4.5, p. 208].
  **Suggested proof:** a cospectral graph has spectrum `m_i - 1` together with `(-1)^{n - k}`, so
  `A + I` is positive semidefinite of rank `k` with unit diagonal and entries `0`, `1`; it is the
  Gram matrix of unit vectors that coincide or are orthogonal, which makes the graph a union of
  cliques of sizes `m_i`.

**Checks.**
- The `2`-regular graphs on `6` vertices are `C₆`, with spectrum `2, 1², (-1)², -2`, and `2C₃`,
  with spectrum `2², (-1)⁴`: the multiplicity of `2` separates them.
- Regularity matters for `K_{m,m}`: the complete bipartite graph `K_{1,4}` is not determined by
  its spectrum (5.4).

*Needs:* 5.1, 5.2; GraphSpectra 2.6, 3.2.

### 5.4 Counterexamples

Worked examples (stated in `Suggested.lean` as sanity checks of the definitions of 5.1, not as
headlines):
- **`K_{1,4}`** (`not_isDeterminedByAdjSpectrum_star`): `K_{1,4}` is complete multipartite but
  not determined by its adjacency spectrum, by 1.1 [BH, after Proposition 14.4.5, p. 208].
- **A Laplacian cospectral pair** (`lapSpectrum_complete_sum_matching`): `K₅ ⊔ 5K₂` and the
  Petersen graph together with five isolated vertices have the same Laplacian spectrum
  `0⁶, 2⁵, 5⁴`, so `K₅ ⊔ 5K₂` is not determined by its Laplacian spectrum [BH, after Proposition
  14.4.5, p. 208]; [vDH]. **Suggested proof:** the Laplacian spectra of `K₅`, `K₂`, the Petersen
  graph and `K₁` (GraphSpectra 2.6 and 1.7); non-isomorphism by the degree sequences.

**Checks.**
- Both graphs of the Laplacian pair have `15` vertices and `15` edges; `K₅ ⊔ 5K₂` has degrees
  `4⁵, 1¹⁰` and the other `3¹⁰, 0⁵`.
- The pair is not adjacency cospectral, as it cannot be: `K₅ ⊔ 5K₂` is a disjoint union of
  complete graphs (5.3).

*Needs:* 1.1, 5.3; GraphSpectra 1.7, 2.4, 2.6.

### 5.5 Graphs with index below two

- **Dynkin diagrams of the same rank have distinct spectra**
  (`adjSpectrum_diagramGraph_injective`) [BH, proof of Proposition 14.4.6, pp. 208–209].
  **Suggested proof:** equal spectra give equal index, hence equal Coxeter numbers by 2.4, since
  `h ↦ 2 cos(π/h)` is injective on `h ≥ 1`. At equal rank `n` the Coxeter numbers `n + 1` of
  `A_n`, `2n - 2` of `D_n` (`n ≥ 4`) and `12`, `18`, `30` of `E₆`, `E₇`, `E₈` are distinct.
- **Connected graphs with index below `2`**
  (`Connected.isDeterminedByAdjSpectrum_of_largestEigenvalue_lt_two`). Every
  connected graph with `θ₁ < 2`, in particular every nonempty path, is determined by its
  adjacency spectrum [BH, Proposition 14.4.6, p. 208]. **Suggested proof:** a cospectral graph
  `Δ` has `θ₁ < 2`, so no cycle (cycles have index `2`, and a copy has at most the index of the
  graph, GraphSpectra 3.4), and `n - 1` edges (5.1), hence is a tree; by 2.2 it is a Dynkin
  diagram of rank `n`; conclude by the previous target.

**Checks.**
- At rank `n = 4`: `A₄` has `h = 5`, `θ₁ = 2 cos(π/5) ≈ 1.618`, and `D₄` has `h = 6`,
  `θ₁ = √3 ≈ 1.732`.
- The hypothesis "connected" is needed: `D₆ ⊔ P₄` and `P₉ ⊔ P₁` are cospectral [BH, Proposition
  14.4.7(i), p. 209].
- The bound is strict: `K_{1,4}` has `θ₁ = 2`, is connected, and is not determined by its
  spectrum (5.4).

*Needs:* 2.2, 2.4, 5.1; GraphSpectra 3.4.

## Layer 6: regular two-graphs, strongly regular graphs and the relative bound

Sources: [BH, Theorem 10.3.1, p. 154; Proposition 10.6.4, p. 163]; [GR, Theorem 11.6.1,
pp. 256–258; Theorem 11.7.1, pp. 258–259].

A two-graph is regular of degree `a` when every pair of points lies in exactly `a` coherent
triples (EquiangularLinesAndTwoGraphs 2.3), and it is regular exactly when the Seidel matrix is
annihilated by a monic quadratic (EquiangularLinesAndTwoGraphs 2.4). This layer relates regular
two-graphs to strongly regular graphs, in Mathlib's `SimpleGraph.IsSRGWith`. The switching
classes of the complete and the empty graph are the trivial regular two-graphs, and 6.2 and 6.3
exclude them.

### 6.1 The descendant

Definitions:
- `descendant G x`: the graph on the vertices other than `x` induced by the switch of `G` with
  respect to the neighbourhood of `x`, in which `x` is isolated [BH, Theorem 10.3.1, p. 154];
  [GR, §11.6, p. 256].

Basic API (prose):
- the descendants at `x` of switching equivalent graphs are equal, so the descendant is an
  invariant of the two-graph and the vertex (EquiangularLinesAndTwoGraphs 2.2);
- the Seidel matrix of the switch isolating `x` is `[[0, 1ᵀ], [1, S']]`, with `S'` the Seidel
  matrix of the descendant;
- `G` is switching equivalent to the complete graph exactly when its descendant at some, equally
  at every, vertex is complete, and to the empty graph exactly when it is empty.

**Checks.**
- The Petersen graph: the descendant at a vertex is the `3 × 3` grid `K₃ □ K₃`.
- `C₅ ⊔ K₁`: the descendant at the isolated vertex is `C₅`.
- `C₄` with `x = 0`: all four edges join `{1, 3}` to `{0, 2}`, so switching on `{1, 3}` removes
  them all and the descendant is the empty graph on `{1, 2, 3}`; indeed `C₄` is switching
  equivalent to the empty graph (1.2), a trivial class.

*Needs:* EquiangularLinesAndTwoGraphs 1.2, 2.2.

### 6.2 Regular two-graphs and their descendants

- **Regular two-graphs and their descendants**
  (`isRegularTwoGraph_oddTriples_iff_isSRGWith`). If `G` is switching equivalent
  neither to the complete nor to the empty graph, then for every vertex `x` and every `k`, the
  two-graph of `G` is regular of degree `k` exactly when the descendant at `x` is strongly regular
  on `n - 1` vertices with degree `k` and `k = 2μ` [BH, Theorem 10.3.1, (ii)–(iii), p. 154];
  [GR, Theorem 11.6.1, pp. 256–258]. **Suggested proof:** the two-graph is that of the switch
  isolating `x`, so a triple `{x, y, z}` is coherent exactly when `yz` is an edge of the
  descendant `D` at `x`: the coherent triples through `x` and `y` number `deg_D y`. For distinct
  vertices `y`, `z` of `D`, the triples `{y, z, w}` with `w ≠ x` are coherent when `w` is
  adjacent in `D` to exactly one of `y`, `z` (if `yz` is not an edge) or to both or neither (if it
  is). So if `D` is `k`-regular, the coherent triples through `y`, `z` number `2(k - μ_{yz})` at a
  nonadjacent pair and `1 + (n - 3) - 2(k - 1 - λ_{yz}) = n - 2k + 2λ_{yz}` at an adjacent pair,
  with `λ_{yz}`, `μ_{yz}` the numbers of common neighbours. Regularity of degree `k` is thus
  `D` `k`-regular with `μ = k/2` and `λ = (3k - n)/2`. Conversely, for `D` strongly regular with
  `k = 2μ`, `k > 0` because the class is not that of the empty graph, and the parameter relation
  `k(k - λ - 1) = (n - 2 - k)μ` of Mathlib's `SimpleGraph.IsSRGWith` gives `λ = (3k - n)/2`.

**Checks.**
- The Petersen graph: Seidel spectrum `3⁵, (-3)⁵`, two-graph regular of degree `4`; the
  descendant is `IsSRGWith 9 4 1 2`, with `4 = 2 · 2`.
- `C₅ ⊔ K₁`: two-graph regular of degree `2`; the descendant `C₅` is `IsSRGWith 5 2 0 1`.
- The complement of `L(K₈)` has Seidel spectrum `9⁷, (-3)²¹`; its descendant is the complement of
  the Schläfli graph, `IsSRGWith 27 10 1 5`, with `10 = 2 · 5`.
- The trivial classes are excluded for a reason: the two-graph of `K₅` is regular of degree `3`,
  and its descendant `K₄` is strongly regular of degree `3`, which is odd, so `k = 2μ` fails.

*Needs:* 6.1; EquiangularLinesAndTwoGraphs 2.1, 2.3; Mathlib `SimpleGraph.IsSRGWith`.

### 6.3 Regular graphs in regular two-graphs

- **Regular graphs in regular two-graphs**
  (`IsRegularOfDegree.exists_isRegularTwoGraph_oddTriples_iff`). A `k`-regular graph
  that is switching equivalent neither to the complete nor to the empty graph has a regular
  two-graph exactly when it is strongly regular and `k - n/2` is an adjacency eigenvalue [GR,
  Theorem 11.7.1, p. 258]. **Suggested proof:** by EquiangularLinesAndTwoGraphs 2.4 the two-graph
  is regular exactly when the real Seidel matrix has at most two eigenvalues. Its Seidel spectrum
  is `n - 1 - 2k` together with `-1 - 2θ` for the restricted eigenvalues `θ` (the eigenvalues on
  vectors orthogonal to the all-one vector; EquiangularLinesAndTwoGraphs 1.1). The graph is
  neither complete nor edgeless, so it has at least two restricted eigenvalues, and by
  StronglyRegularGraphsAndDesigns 1.3 exactly two exactly when it is strongly regular. So at most
  two Seidel values means: strongly regular, and `n - 1 - 2k = -1 - 2θ` for a restricted `θ`, that
  is `θ = k - n/2`. Since `n > 0`, `k - n/2 ≠ k`, and an eigenvalue other than `k` is restricted,
  because its eigenvectors are orthogonal to the all-one vector. This route needs no connectivity,
  unlike [GR, p. 259], which treats the disconnected case separately.

**Checks.**
- The Petersen graph: `IsSRGWith 10 3 0 1`, and `k - n/2 = -2` is an eigenvalue.
- The `3 × 3` grid `K₃ □ K₃`, `IsSRGWith 9 4 1 2`, is strongly regular but `k - n/2 = -1/2` is not
  an eigenvalue, and its Seidel spectrum has the three values `-3, 0, 3`.
- The trivial classes are excluded: `K₅` has a regular two-graph, but `k - n/2 = 3/2` is not an
  eigenvalue.
- The complement of `L(K₈)`, `IsSRGWith 28 15 6 10`, has `k - n/2 = 1` as an eigenvalue and a
  regular two-graph (Seidel spectrum `9⁷, (-3)²¹`).

*Needs:* EquiangularLinesAndTwoGraphs 1.1, 2.4; StronglyRegularGraphsAndDesigns 1.3 (its
definition of restricted eigenvalues is used in the route only, so it is not copied).

### 6.4 Two Seidel eigenvalues give equality in the relative bound

- **The converse of the equality case of the relative bound**
  (`card_mul_eq_of_ncard_eigenvalues_seidelMatrix_eq_two`). Let `x` be an equiangular family
  (EquiangularLinesAndTwoGraphs 3.1) of `n` unit vectors with angle `α` that spans a real inner
  product space of dimension `d < n`, and suppose the Seidel matrix `S` of its sign graph has
  exactly two distinct eigenvalues. Then `n(1 - dα²) = d(1 - α²)`. With `0 < α` and `dα² < 1`
  this is the converse of EquiangularLinesAndTwoGraphs 5.1; [BH, Proposition 10.6.4, p. 163]
  proves the forward direction, and the converse is an adaptation of its proof.
  **Suggested proof:** `n ≥ 2` and `d ≥ 1`, since a unit vector is nonzero; `α > 0`, since an
  orthonormal family has `n ≤ d`. The Gram matrix `I + αS` (EquiangularLinesAndTwoGraphs 3.1)
  has rank `d < n`, so `-1/α` is one eigenvalue of `S`, of multiplicity `n - d`, and the other,
  `ρ`, has multiplicity `d`. From `tr S = 0`, `ρ = (n - d)/(dα)`, so the nonzero eigenvalue of the
  Gram matrix is `n/d` with multiplicity `d`. Comparing `tr (I + αS)² = n + n(n - 1)α²` with
  `d (n/d)²` gives `n - d = dα²(n - 1)`, which is the equality.

**Checks.**
- The six diagonals of the icosahedron in `ℝ³` (`α = 1/√5`, Seidel eigenvalues `±√5`) give
  `6 · 2/5 = 3 · 4/5`; the 28 lines in `ℝ⁷` (`α = 1/3`, eigenvalues `9`, `-3`) give
  `28 · 2/9 = 7 · 8/9`; the regular simplex of `d + 1` vectors in `ℝ^d` (`α = 1/d`, eigenvalues
  `1`, `-d`) gives `(d + 1)(d - 1)/d = d(1 - 1/d²)`.
- The case `d = 1`: the vectors `e₁, e₁, e₁` of `ℝ¹` (`α = 1`, Seidel eigenvalues `2`, `-1`) give
  `3 · 0 = 1 · 0`; here `dα² = 1`, which is why `dα² < 1` is not a conclusion.
- Negative controls: the six icosahedral lines in a hyperplane of `ℝ⁴` have two Seidel
  eigenvalues and `6 > 4`, but do not span, and `6 · 1/5 ≠ 4 · 4/5`; two unit vectors at `60°` in
  `ℝ²` span, with Seidel eigenvalues `±1`, but `n = d` and `2 · 1/2 ≠ 2 · 3/4`; five of the six
  icosahedral lines span `ℝ³` with `5 > 3`, but have the three Seidel eigenvalues `-√5, 0, √5`,
  and `5 · 2/5 ≠ 3 · 4/5`.

*Needs:* EquiangularLinesAndTwoGraphs 3.1.

## Downstream consumers

No roadmap consumes the statements of this one. The neighbouring roadmaps that leave its material
here are listed under Scope and ownership.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every target above. `Suggested.lean` states the
headlines that carry a Lean name, each with every conclusion the README attaches to it, and the
four worked examples of 1.1 and 5.4 as sanity checks of the definitions; it is not an exhaustive
acceptance test, and the other headlines are targets of the same standing, stated in prose.

Owned here:
- the cospectral examples, the Godsil–McKay partition, its switched graph and its conjugating
  matrix, and the cospectrality of Seidel-cospectral regular graphs;
- the spectral form of Smith's classification (the index against `2I - A`), the Coxeter number of
  a Dynkin type and the index of a Dynkin diagram;
- the coordinate root systems `A_n`, `D_n`, `E₈` as sets of rational vectors, root
  representations of graphs, the Gram classification of connected lattices generated by norm-`2`
  vectors, and the theorem of Cameron, Goethals, Seidel and Shult;
- generalized line graphs, their signed incidence matrix, and the bounds on exceptional graphs
  (the cocktail party graph is Mathlib's `SimpleGraph.completeEquipartiteGraph m 2`, and its
  spectrum is GraphSpectra 2.6);
- spectral determination for the adjacency matrix, the Laplacian and the signless Laplacian;
- the descendant of a graph at a vertex, the correspondence between regular two-graphs and
  strongly regular graphs, and the converse of the equality case of the relative bound.

The boundary with EquiangularLinesAndTwoGraphs, section by section:
- 1.1 (the Seidel matrix; the Seidel spectrum of a regular graph, in prose there): definition
  copied; the regular spectrum is used in 1.2 and 6.3.
- 1.2 (switching, and the conjugation of the Seidel matrix by switching): `switch` and its
  instance copied and used in 6.1–6.3; the conjugation is used only through 2.2 there.
- 2.1 (two-graphs and the odd triples of a graph): `oddTriples` copied and used in 6.2 and 6.3;
  the predicate of two-graphs is not used.
- 2.2 (two-graphs correspond to switching classes): used in the basic API of 6.1.
- 2.3 (regular two-graphs, and regularity of degree `a` as `S² = (n - 1)I + (n - 2 - 2a)S`):
  `IsRegularTwoGraph` copied and used in 6.2 and 6.3; the matrix identity is not used.
- 2.4 (regular two-graphs have two Seidel eigenvalues): used in 6.3.
- 3.1 (equiangular families, the sign graph, the Gram matrix `I + αS` and the multiplicity
  `n - r` of `-1/α`): definitions copied, and the theorem used, in 6.4.
- 3.2 (from Seidel matrices to lines), Layer 4 (the absolute and relative bounds), 5.2 (equality
  in the absolute bound) and 5.3 (Neumann's theorem): not used.
- 5.1 (equality in the relative bound implies two Seidel eigenvalues): not used; 6.4 here is its
  converse.
- The descendants of a two-graph and their strong regularity, which that roadmap places outside
  its scope, are 6.1–6.3 here.

Consumed from other roadmaps, not restated (see the supplier contracts):
- [GraphSpectra](../GraphSpectra/README.md) 1.2, 2.4 (definitions copied), 1.3, 1.7, 2.5, 2.6, 3.2,
  3.4, 3.8.
- [SpectralGraphBounds](../SpectralGraphBounds/README.md) 1.1,
  [LaplacianEigenvaluesOfGraphs](../LaplacianEigenvaluesOfGraphs/README.md) 1.1 and
  [TopologicalCombinatorics](../TopologicalCombinatorics/README.md) 3.1: the sorted eigenvalues, the
  index and the Kneser graph, copied as GraphSpectra copies them; SpectralGraphBounds 1.2.
- StronglyRegularGraphsAndDesigns 1.3; LaplacianSpectraAndSpanningTrees 2.3.
- [ZigzagPreprojective](../ZigzagPreprojective/README.md) 0.1,
  [RootSystems](../RepresentationTheory/RootSystems/README.md) §3.1 and
  [IntegralLattices](../IntegralLattices/README.md), native rows 0G and 1K: RootSystems §3.1
  and IntegralLattices are formalized in Tau Ceti and consumed through Tau Ceti;
  ZigzagPreprojective 0.1 states its recognition theorem as a target, consumed in 2.2.

Neighbouring roadmaps, not used here:
- [StronglyRegularAndMooreGraphs](../StronglyRegularAndMooreGraphs/README.md): the spectrum of a
  strongly regular graph (1.2); 6.3 reads strong regularity off the restricted eigenvalues through
  StronglyRegularGraphsAndDesigns 1.3 instead.
- CharacteristicPolynomialsAndStarComplements, which places cospectral graphs and switching
  outside its scope.
- SphericalCodesAndKissingNumbers: the minimal vectors of `E₈` as a spherical code (1.2).
- The spectrum of the line graph of a non-regular graph, which GraphSpectra leaves to a later
  roadmap, is not stated here either.

Already in the libraries and therefore not targets: the recognition of Dynkin diagrams through a
positive definite `2I - A`, the identification of their diagrams with paths and the trees
`T(a, b, c)`, the containment of an affine diagram in every connected graph that is not a Dynkin
diagram, the classification of root systems by Dynkin type, and the root lattices with their
roots and coordinate models (Tau Ceti); the existence of a base of a root system (Mathlib). The
affine recognition theorem is not among them: it is a target of ZigzagPreprojective 0.1, which
2.2 consumes.

Outside the scope: Schwenk's theorem that almost all trees have a cospectral mate [BH, Theorem
14.2.2, p. 201]; [CRS, §4.2, p. 122]; [Go, Chapter 4, Theorem 6.1, p. 65]; [Sch], which needs
random trees and the limit theory of branch counting; the classification of the cospectral pairs
of graphs with `θ₁ < 2` [BH, Proposition 14.4.7, p. 209]; the girth of a regular graph from its
spectrum [BH, Lemma 14.4.3(iv), p. 207]; the enumeration of the exceptional graphs; and the
graphs with least eigenvalue greater than `-2`.

Boundary in one sentence: how much of a graph its spectrum determines, through line systems and
switching; the Seidel matrix and equiangular lines themselves are EquiangularLinesAndTwoGraphs'.

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.adjMatrix`, `SimpleGraph.lapMatrix`, `SimpleGraph.lineGraph`,
  `SimpleGraph.IsBipartite`, `SimpleGraph.IsCompleteMultipartite`, `completeBipartiteGraph`,
  `SimpleGraph.pathGraph`, `SimpleGraph.cycleGraph`, the disjoint sum `G ⊕g H` and the box product
  `G □ H`.
- `SimpleGraph.completeEquipartiteGraph`, the carrier of the cocktail party graph (4.1).
- `SimpleGraph.IsSRGWith`, with natural parameters (Layer 6).
- `SimpleGraph.adjMatrix_pow_apply_eq_card_walk` and
  `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` (5.1).
- `Matrix.charpoly`, `Matrix.posSemidef_gram`, `Matrix.IsHermitian.eigenvalues₀` and the spectral
  theorem (Layers 1–3).
- `RootPairing.nonempty_base`: a reduced crystallographic finite root system has a base (3.3).

### From Tau Ceti

- `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`: `tr Bʰ = Σ λ_iʰ` for a Hermitian `B`
  (5.1).
- `SimpleGraph.graphCartanMatrix`, the matrix `2I - A`, and
  `SimpleGraph.posDef_graphCartanMatrix_iff`: a connected graph has positive definite rational
  `2I - A` exactly when it is the diagram of a valid simply-laced Dynkin type (2.2).
- `SimpleGraph.Connected.exists_isContained_affineDynkinType_of_not_exists_dynkinType_iso`: a
  connected finite graph that is the diagram of no valid Dynkin type contains the graph of a valid
  graphical affine type (2.3).
- `TauCeti.DynkinType` with `rank`, `Valid`, `IsSimplyLaced`, `cartanMatrix` and
  `TauCeti.diagramGraph`; `TauCeti.AffineDynkinType` with `graph`, `nodes`, `Valid`,
  `IsGraphical` and the deletion embedding `TauCeti.AffineDynkinType.bourbakiGraphEmbedding`
  (2.3).
- The dictionary: `TauCeti.DynkinType.diagramGraph_cartanMatrix_A` (the diagram of `A_n` is
  `pathGraph n`), and `TauCeti.starHasCartanType_D`, `TauCeti.starHasCartanType_E6`,
  `TauCeti.starHasCartanType_E7`, `TauCeti.starHasCartanType_E8` (the trees `T(1, 1, n - 3)`,
  `T(1, 2, 2)`, `T(1, 2, 3)`, `T(1, 2, 4)` with `TauCeti.starCartanMatrix` are the diagrams of
  `D_n`, `E₆`, `E₇`, `E₈`) (2.4).
- `TauCeti.existsUnique_dynkinType` and `TauCeti.IsFiniteType.existsUnique_dynkinType`: a base of
  an irreducible reduced crystallographic finite root system, and a connected finite-type Cartan
  matrix, have exactly one valid Dynkin type (3.3).
- `TauCeti.DynkinType.numRoots`, `TauCeti.DynkinType.rootLattice`,
  `TauCeti.DynkinType.rootLatticeRootEquiv` and
  `TauCeti.DynkinType.representationNumber_rootLattice_two` (the norm-`2` vectors of the root
  lattice of a valid simply-laced type are its roots, `numRoots` of them), and the coordinate
  models `TauCeti.IntegralLattice.zeroSumLattice`,
  `TauCeti.IntegralLattice.typeAIsometryZeroSumLattice`, `TauCeti.DynkinType.rootLattice_A`,
  `TauCeti.IntegralLattice.checkerboardLattice`,
  `TauCeti.DynkinType.rootLatticeIsometryCheckerboard`,
  `TauCeti.IntegralLattice.typeE₈IsometryD8Plus` and `TauCeti.DynkinType.rootLattice_E8` (3.1,
  3.3, 3.4).

### From roadmaps on main

- [ZigzagPreprojective](../ZigzagPreprojective/README.md), 0.1: a connected finite graph has a
  nonzero natural function `a` with `Σ_{j ∼ i} a_j = 2a_i` exactly when it is isomorphic to the
  graph of a unique valid graphical affine type, a target there; used in 2.2.
- [RootSystems](../RepresentationTheory/RootSystems/README.md), §3.1: a nonempty irreducible
  finite reduced crystallographic root system has exactly one valid Dynkin type, independent of
  the base; used in 3.3 through Tau Ceti.
- [IntegralLattices](../IntegralLattices/README.md), native rows 0G and 1K: the ADE root lattices,
  positive definite and even with norm-`2` vectors spanning the carrier, and their coordinate
  models (zero-sum, checkerboard, `D₈⁺ ≅ E₈`); used in 3.1, 3.3 and 3.4 through Tau Ceti.

### From GraphSpectra

- [GraphSpectra](../GraphSpectra/README.md) 1.2: `adjSpectrum`, `lapSpectrum`,
  `signlessLapSpectrum`, the signless Laplacian (copied), used throughout.
- 1.3: the trace identities, used in 1.1 and 5.1.
- 1.7: disjoint unions and isomorphism invariance of spectra, used in 1.1, 2.4 and 5.4.
- 2.4: the Petersen graph (copied), used in 5.4.
- 2.5: the incidence identity of line graphs, the case `a = 0` of 4.2.
- 2.6: the multiset spectra of complete, complete bipartite and complete equipartite graphs,
  cycles, paths and the Petersen graph, used in 1.1, 2.4, 4.1, 5.3 and 5.4.
- 3.2: Perron–Frobenius for connected graphs (`θ₁` simple with a positive eigenvector, nonnegative
  eigenvectors belong to `θ₁`), used in 2.2 and 5.3.
- 3.4: monotonicity of the index under copies, used in 5.5.
- 3.8: the spectrum of the complement of a regular graph, used in 1.3 and 5.2.

### From SpectralGraphBounds, LaplacianEigenvaluesOfGraphs and TopologicalCombinatorics

- [SpectralGraphBounds](../SpectralGraphBounds/README.md) 1.1: `adjEigenvalues` and
  `largestEigenvalue` (copied), used throughout; the trace identity `Σ θ_i² = 2|E|`, used in 5.1.
- SpectralGraphBounds 1.2: on a nonempty vertex type, `n λ₁ = 2|E|` exactly when the graph is
  regular; used in 5.1.
- [LaplacianEigenvaluesOfGraphs](../LaplacianEigenvaluesOfGraphs/README.md) 1.1: `lapEigenvalues`
  (copied), through `lapSpectrum`.
- [TopologicalCombinatorics](../TopologicalCombinatorics/README.md) 3.1: `kneserGraphOf` and
  `kneserGraph` (copied), through the Petersen graph.

### From EquiangularLinesAndTwoGraphs

- 1.1: `seidelMatrix` (copied), and the Seidel spectrum of a `k`-regular graph, `n - 1 - 2k`
  together with `-1 - 2θ` for the adjacency eigenvalues on vectors orthogonal to the all-one
  vector; used in 1.2 and 6.3.
- 1.2: `switch` and `instDecidableRelSwitch` (copied); used in 6.1–6.3.
- 2.1: `oddTriples` (copied); used in 6.2 and 6.3.
- 2.2: two graphs have the same two-graph exactly when one is a switch of the other; used in 6.1.
- 2.3: `IsRegularTwoGraph` (copied); used in 6.2 and 6.3.
- 2.4: the two-graph of `G` is regular exactly when `(S - ρ₁I)(S - ρ₂I) = 0` for some real `ρ₁`,
  `ρ₂`; used in 6.3.
- 3.1: `IsEquiangular`, `signGraph` and `instDecidableRelSignGraph` (copied), and: for an
  equiangular family of `n` unit vectors with angle `α > 0` spanning a subspace of dimension `r`,
  the Gram matrix is `I + αS`, every eigenvalue of `S` is at least `-1/α`, and `-1/α` has
  multiplicity `n - r`; used in 6.4.

### From StronglyRegularGraphsAndDesigns

- 1.3: a `k`-regular graph that is neither complete nor edgeless is strongly regular exactly when
  it has exactly two restricted eigenvalues; used in 6.3.

### From LaplacianSpectraAndSpanningTrees

- 2.3: `n N = ν₁ ⋯ ν_{n-1}` for the number `N` of spanning trees; used in 5.1.

## References

- [BH] A. E. Brouwer, W. H. Haemers, *Spectra of Graphs*, Universitext, Springer, 2012;
  Figure 1.1 and §1.3.7, p. 7; §1.8, pp. 15–16; Theorem 3.1.3 and §3.1.1, pp. 34–35;
  §§8.2–8.4, pp. 105–112; Theorem 10.3.1, p. 154; Proposition 10.6.4, p. 163; Theorem 14.2.2,
  p. 201; §14.4, pp. 206–209.
- [Bi] N. Biggs, *Algebraic Graph Theory*, 2nd ed., Cambridge University Press, 1993; 2f, p. 12.
- [CGSS] P. J. Cameron, J.-M. Goethals, J. J. Seidel, E. E. Shult, Line graphs, root systems,
  and elliptic geometry, *J. Algebra* 43 (1976), 305–327.
- [CRS] D. Cvetković, P. Rowlinson, S. Simić, *An Introduction to the Theory of Graph Spectra*,
  London Mathematical Society Student Texts 75, Cambridge University Press, 2010; Definition 1.2.3,
  pp. 8–9; §3.4, pp. 60–62; Theorem 3.11.1, p. 92; §4.2, p. 122.
- [GM] C. D. Godsil, B. D. McKay, Constructing cospectral graphs, *Aequationes Math.* 25 (1982),
  257–268.
- [Go] C. D. Godsil, *Algebraic Combinatorics*, Chapman and Hall, 1993; Chapter 4, §6,
  Theorem 6.1, p. 65.
- [GR] C. Godsil, G. Royle, *Algebraic Graph Theory*, Graduate Texts in Mathematics 207,
  Springer, 2001; §11.6, pp. 256–258; §11.7, pp. 258–259; §12.1, pp. 265–266.
- [Sch] A. J. Schwenk, Almost all trees are cospectral, in F. Harary (ed.), *New Directions in
  the Theory of Graphs*, Academic Press, 1973, 275–307.
- [Sm] J. H. Smith, Some properties of the spectrum of a graph, in *Combinatorial Structures and
  their Applications*, Gordon and Breach, 1970, 403–406.
- [vDH] E. R. van Dam, W. H. Haemers, Which graphs are determined by their spectrum?,
  *Linear Algebra Appl.* 373 (2003), 241–272.
- [Wi] E. Witt, Spiegelungsgruppen und Aufzählung halbeinfacher Liescher Ringe,
  *Abh. Math. Sem. Univ. Hamburg* 14 (1941), 289–322.

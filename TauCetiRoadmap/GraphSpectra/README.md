# Roadmap: graph spectra

**Summary.** The adjacency matrix `A`, the Laplacian `L = D - A` and the signless Laplacian
`Q = D + A` of a finite simple graph are real symmetric matrices, and their spectra record much of
the graph: walks and triangles, components and bipartite components, regularity, the diameter,
and bounds on degrees, edges and cliques. This roadmap gives the three spectra a common
vocabulary, with eigenvalue enumerations `θ₁ ≥ ⋯ ≥ θₙ` of `A`, `ν₁ ≥ ⋯ ≥ νₙ` of `L` and
`q₁ ≥ ⋯ ≥ qₙ` of `Q`, and proves the classical theorems about them that no other roadmap or Tau
Ceti module states. Among them:
- `UUᵀ = Q` and `UᵀU = 2I + A(L(G))` for the unsigned incidence matrix `U`, the nullity of `Q` as
  the number of bipartite components, and the sign conjugation of `L` into `Q` for a bipartite
  graph;
- the variational formula for the algebraic connectivity `ν_{n-1}`, the irreducibility of the
  adjacency matrix of a connected graph and the Perron–Frobenius theorem for connected graphs;
- a connected graph of diameter `d` has at least `d + 1` distinct eigenvalues of each matrix, and
  one with exactly two distinct eigenvalues is complete;
- the spectrum of a matrix `∑ θᵢ Eᵢ` with complete orthogonal idempotents `Eᵢ`, each `θᵢ`
  counted `rank Eᵢ = tr Eᵢ` times, and from it the multiset spectra of complete, complete
  bipartite and complete equipartite graphs, cycles, paths, hypercubes, Hamming, Johnson, Kneser
  and Petersen graphs;
- the Laplacian spectrum of the path and the adjacency spectra of line graphs of regular graphs;
- the derivative of the characteristic polynomial and its recursion at a pendant vertex, and the
  comparison of a graph with a spanning subgraph beyond the index, on which the grafting of
  pendant paths rests;
- the extremes of the index `θ₁` over connected graphs and trees, the bounds of Stanley, Hong,
  Wilf, Nikiforov, Nosal and Hofmeister, Hoffman's polynomial `J = h(A)` of a connected regular
  graph, and the adjacency spectrum of the complement of a regular graph;
- walk counts from main angles, and the number of main eigenvalues, which is `1` exactly for
  regular graphs and at most the number of orbits of the automorphism group.

The roadmap rests on Mathlib's adjacency and Laplacian matrices and its spectral theorem, and on Tau
Ceti's Perron–Frobenius and Courant–Fischer theorems. It consumes the adjacency bounds of
SpectralGraphBounds (sorted eigenvalues, Rayleigh bounds, `|θᵢ| ≤ θ₁ ≤ k_max`, induced interlacing),
the Laplacian theory of LaplacianEigenvaluesOfGraphs (zero eigenvalues and components, the
complement), the bipartiteness criteria of PeriodicNonnegativeMatrices, the primitive idempotents of
the Johnson scheme in AssociationSchemes and the Kneser graph of TopologicalCombinatorics. Later
roadmaps on Laplacian spectra and spanning trees, characteristic polynomials and star complements,
strongly regular and distance-regular graphs, Cayley graphs, expanders, line systems and colourings
build on it and cite it by section.

## How to read the build

Layer 1 is the vocabulary and its basic API: the signless Laplacian, quadratic forms, edge
decompositions and the unsigned incidence matrix; the three enumerations, spectra and
characteristic polynomials, with the derivative and the pendant-vertex recursion; traces and walk
counts; row sums; the variational formula for the
algebraic connectivity; irreducibility; disjoint unions, isomorphisms and components; the
multiset spectrum of a decomposition into orthogonal idempotents. Every later layer uses it.

Layer 2 defines the Hamming, Johnson and Petersen graphs and gives them, with the Kneser graph,
their basic API, together with the degrees of complete multipartite graphs, the Laplacian
spectrum of the path, the spectra of line graphs and the multiset spectra of the standard
graphs. It needs Layer 1, and for the multiset spectra of the Johnson and Kneser graphs the
primitive idempotents of AssociationSchemes 5.1.

Layer 3 is Perron–Frobenius theory and the index: distinct eigenvalues and the diameter,
Perron–Frobenius for connected graphs (3.2), on which the rest of the layer rests, degree bounds,
monotonicity and extremes of the index, the clique bounds, Hoffman's polynomial, bipartiteness of
regular graphs, the complement, and main eigenvalues.

## Conventions

- **Graphs.** `G : SimpleGraph V` with `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`. Every
  statement holds for every finite `V`, including the empty type, unless a hypothesis such as
  `Nonempty V`, `Nontrivial V` or `2 ≤ Fintype.card V` is written. Write `n = Fintype.card V`
  and `m = #G.edgeFinset`.
- **Matrices.** `A = G.adjMatrix R`, `D = G.degMatrix R`, `L = G.lapMatrix R = D - A` (Mathlib),
  `Q = G.signlessLapMatrix R = D + A`. Spectral statements are over `ℝ`; algebraic identities
  (traces, characteristic polynomials, quadratic forms, products) are over the most general ring
  their proofs allow. Vectors are functions `V → ℝ`, and quadratic forms are written
  `u ⬝ᵥ (M *ᵥ u)`; Euclidean space appears only where an orthogonal projection is needed (3.9).
- **Eigenvalues.** The three enumerations are Mathlib's `Matrix.IsHermitian.eigenvalues₀`,
  indexed by `i : Fin (Fintype.card V)` in nonincreasing order, so that index `0` carries the
  largest eigenvalue: `adjEigenvalues G i = θ_{i+1}`, `lapEigenvalues G i = ν_{i+1}` and
  `signlessLapEigenvalues G i = q_{i+1}`, with `θ₁ ≥ ⋯ ≥ θₙ`, `ν₁ ≥ ⋯ ≥ νₙ` and `q₁ ≥ ⋯ ≥ qₙ`.
  `adjEigenvalues`, with `largestEigenvalue G = θ₁` and `smallestEigenvalue G = θₙ` on a
  nonempty vertex type, are the definitions of SpectralGraphBounds 1.1, and `lapEigenvalues`,
  with `algebraicConnectivity G` (`ν_{n-1}` for `n ≥ 2`, `0` for `n ≤ 1`), those of
  LaplacianEigenvaluesOfGraphs 1.1; `Suggested.lean` carries verbatim copies of these
  definitions, so the theorems of those roadmaps apply here as stated. `signlessLapEigenvalues` is
  defined here in the same convention. Brouwer–Haemers number the Laplacian eigenvalues upwards,
  `μ₁ ≤ ⋯ ≤ μₙ`, in Chapter 1, so their `μ_k` is `ν_{n+1-k}` and their `μ₂` is `ν_{n-1}`. The
  spectra `adjSpectrum`, `lapSpectrum`, `signlessLapSpectrum` are multisets of cardinality `n`;
  multiplicity is `Multiset.count`.
- **Edge sums.** A sum over edges is `∑ e ∈ G.edgeFinset, Sym2.lift ⟨f, hf⟩ e` for a symmetric
  `f`. The edge matrices `edgeLapMatrix R e` and `edgeSignlessLapMatrix R e` are defined for every
  `e : Sym2 V` and are the zero matrix on a diagonal `e`, which is never an edge.
- **Standard graphs.** `⊤ : SimpleGraph V` is `K_n`; `pathGraph n` is `Pₙ`; `cycleGraph n` is
  `Cₙ`; `completeEquipartiteGraph r t` is `K_{r×t}` (`r` parts of size `t`);
  `hypercube d = hammingGraph d Bool`. The Johnson graph `johnsonGraph α k` and the Kneser graph
  of TopologicalCombinatorics 3.1 live on the coerced set `{s : Finset α | s.card = k}`, which is
  the subtype `{s : Finset α // s.card = k}` of AssociationSchemes 5.1 up to unfolding set
  membership; `petersenGraph` is the Kneser graph on the `2`-subsets of `Fin 5`.
- **Junk values.** `SimpleGraph.diam` is `0` for a disconnected graph; the diameter bound assumes
  connectivity. `G.cliqueNum` is at least `1` on a nonempty vertex type, so `1/ω` is never `1/0`
  there. Main angles divide by `√n`, which is `0` only for the empty type, where every sum is
  empty. Natural subtraction appears only where it cannot truncate (`k * n / 2 - n` for `k ≥ 2`,
  `C(n, j + 1) - C(n, j)` for `j < k ≤ n/2`, `n - k - (j + 1)` for `2k ≤ n`) or where truncation
  is the intended value (`2 * k - 2` for `k ≤ 1`, the degree of an edgeless line graph).

## Layer 1: vocabulary and basic API

The definitions are `signlessLapMatrix`, `signlessLapEigenvalues`, `adjSpectrum`,
`lapSpectrum`, `signlessLapSpectrum`, `unsignedIncMatrix`, `edgeLapMatrix` and
`edgeSignlessLapMatrix`; the enumerations of `A` and `L` are those of SpectralGraphBounds 1.1 and
LaplacianEigenvaluesOfGraphs 1.1 (Conventions). The symmetry of `Q` over `ℝ`
(`isHermitian_signlessLapMatrix`) is proved with the definitions, since `signlessLapEigenvalues`
needs it. The entries of `Q` are sanity checks of the definition (`signlessLapMatrix_apply_self`,
`signlessLapMatrix_apply_of_ne`, `isSymm_signlessLapMatrix`, `signlessLapMatrix_mulVec_one`):
`Q_{ii} = d(i)`, `Q_{ij} = A_{ij}` for `i ≠ j`, `Q` is symmetric over any ring, and `Q𝟙 = 2d`.

*Depends on:* Mathlib; Tau Ceti Courant–Fischer; RandomMatrices 1.2 (min–max for
`eigenvalues₀`); SpectralGraphBounds 1.1 and LaplacianEigenvaluesOfGraphs 1.1 (sorted
eigenvalues).

### 1.1 Quadratic forms, edge decompositions and incidence

- **Quadratic forms** (`dotProduct_mulVec_adjMatrix_self`, `dotProduct_mulVec_lapMatrix_self`,
  `dotProduct_mulVec_signlessLapMatrix_self`, `posSemidef_signlessLapMatrix`). Over any
  commutative ring, `uᵀAu = 2∑_{xy∈E} u_x u_y`, `uᵀLu = ∑_{xy∈E}(u_x - u_y)²` and
  `uᵀQu = ∑_{xy∈E}(u_x + u_y)²`; `Q` is positive semidefinite over `ℝ` [BH, §1.1, p. 1].
  Mathlib has `SimpleGraph.posSemidef_lapMatrix` and the Laplacian form over a field
  (`SimpleGraph.lapMatrix_toLinearMap₂'`).
- **Edge decompositions** (`edgeLapMatrix`, `edgeSignlessLapMatrix`, `edgeLapMatrix_mk`,
  `edgeSignlessLapMatrix_mk`, `lapMatrix_eq_sum_edgeLapMatrix`,
  `signlessLapMatrix_eq_sum_edgeSignlessLapMatrix`, `posSemidef_edgeLapMatrix`). For `x ≠ y`,
  `L_{xy} = bbᵀ` with `b = e_x - e_y` and `Q_{xy} = bbᵀ` with `b = e_x + e_y`; `L = ∑_e L_e`,
  `Q = ∑_e Q_e` over the edges; and for every `e : Sym2 V` both edge matrices are positive
  semidefinite.
- **Unsigned incidence** (`unsignedIncMatrix_mul_transpose`). For `U = G.unsignedIncMatrix R`
  (Mathlib's `incMatrix` with columns restricted to the edges), `UUᵀ = Q` over any semiring
  [BH, §1.1, p. 1; Ba, introduction to Chapter 7, p. 87].
- **The kernel of `Q`** (`signlessLapMatrix_mulVec_eq_zero_iff`, `finrank_ker_signlessLapMatrix`).
  `Qu = 0` if and only if `u_x + u_y = 0` along every edge; the nullity of `Q` is the number of
  connected components whose induced graph is bipartite, isolated vertices included [CRS,
  Theorem 7.8.1 and Corollary 7.8.2, p. 217; BH, Proposition 1.3.9, p. 7].
- **Sign conjugation** (`signDiagonal_mul_lapMatrix_mul_signDiagonal`). For a proper colouring
  `c : G.Coloring Bool` with sign matrix `S = diag(±1)`, `SLS = Q` over any commutative ring
  [BH, proof of Proposition 1.3.10, p. 8; Ba, Lemma 7.7, p. 93].

Hence `L` and `Q` of a bipartite graph are similar and, by 1.2, cospectral [CRS, Proposition
7.8.4, p. 217]; this corollary is stated in prose only.

If `G` is `k`-regular, `L = kI - A` and `Q = kI + A` over any ring [BH, §1.3.1, p. 4]; this
unfolds `degMatrix` and is not a separate target.

**Suggested proof:** expand `uᵀDu ± uᵀAu` and pair the two darts of each edge, as in Mathlib's
`SimpleGraph.lapMatrix_toLinearMap₂'`; the edge decompositions are the same computation
entrywise. `UUᵀ = Q` is Mathlib's `SimpleGraph.incMatrix_mul_transpose`, since the columns of
non-edges vanish. For the kernel of `Q`, `uᵀQu = 0` forces `u_x = -u_y` along every edge, so on a
component `u` is determined by one value and is nonzero only if the component has a proper
`2`-colouring; the kernel is the direct sum of these one-dimensional pieces.

**Checks.**
- On `P₃` (`0 ~ 1 ~ 2`): `Q = [[1,1,0],[1,2,1],[0,1,1]]`, and `u = (1,-1,1)` has `uᵀQu = 0`.
- On `K₃`: `uᵀQu = (u₀+u₁)² + (u₁+u₂)² + (u₀+u₂)²` vanishes only at `u = 0`, so `Q(K₃)` is
  positive definite. Negative control: `Q` is not always singular, unlike `L`.
- `edgeLapMatrix ℝ s(0, 1)` on `Fin 2` is `[[1,-1],[-1,1]] = L(K₂)`, and
  `edgeSignlessLapMatrix ℝ s(0, 1) = [[1,1],[1,1]] = Q(K₂)`. Negative control: without the
  diagonal clause, the entry formula at `e = s(0, 0)` would give the matrix with a single `1` at
  `(0, 0)`, which is not `bbᵀ` for `b = e_0 - e_0 = 0`.
- Nullity of `Q`: `0` for `K₃`, `1` for `P₃`, `n` for the edgeless graph on `n` vertices, `1`
  for `K₂ ⊕g K₃`.
- `K₂`, `S = diag(1, -1)`: `SLS = [[1, 1], [1, 1]] = Q`. Negative control: `K₃` has `L`-spectrum
  `0, 3, 3` and `Q`-spectrum `4, 1, 1`, so no sign conjugation exists without a `2`-colouring.

*Needs:* Mathlib `adjMatrix`, `degMatrix`, `lapMatrix`, `incMatrix`, `Matrix.PosSemidef`.

### 1.2 Eigenvalues, spectra and characteristic polynomials

- **Membership** (`mem_adjSpectrum_iff`, `mem_lapSpectrum_iff`, `mem_signlessLapSpectrum_iff`).
  `θ ∈ G.adjSpectrum ↔ θ ∈ spectrum ℝ (G.adjMatrix ℝ)`, and likewise for `L` and `Q`.
- **Characteristic polynomial** (`charpoly_adjMatrix_eq_prod`, `adjSpectrum_eq_roots`).
  `χ_A = ∏_{θ ∈ adjSpectrum} (X - θ)`, and the adjacency spectrum is the root multiset of the
  integer characteristic polynomial mapped to `ℝ`.
- **Multiplicity** (`count_adjSpectrum`). `count θ = dim ker(A - θI)`.
- **Regular graphs** (`IsRegularOfDegree.lapEigenvalues_eq`). If `G` is `k`-regular,
  `ν_{i+1} = k - θ_{n-i}` at the reversed index `i.rev` and `q_{i+1} = k + θ_{i+1}` at the same
  index [BH, §1.3.1, p. 4].
- **Derivative of a characteristic polynomial** (`Matrix.derivative_charpoly`). For any square
  matrix `M` over a commutative ring, `χ_M' = ∑_v χ_{M[V∖v]}`, the sum of the characteristic
  polynomials of the principal submatrices of order `n - 1` [CRS, Theorem 2.3.1, p. 35; B,
  Additional result 2d, p. 11].
- **Pendant vertex** (`charpoly_adjMatrix_of_leaf`). If `v` has degree `1` and neighbour `u`,
  then over any commutative ring `χ_G = Xχ_{G-v} - χ_{G-u-v}`, where `G - v` and `G - u - v`
  are the graphs induced on `{v}ᶜ` and `{u, v}ᶜ` [CRS, Theorem 2.2.1, p. 30; B, Additional
  result 2a, p. 11].
- **Sparse expansion.** For a square matrix `M` over a commutative ring indexed by `Fin (k + 2)`
  whose row `0` and column `0` vanish beyond their first two entries,
  `det M = M₀₀ det M[≥1] - M₀₁ M₁₀ det M[≥2]`, where `M[≥i]` deletes the rows and columns below
  `i`.

The sign `qᵢ ≥ 0` [BH, §1.3, p. 4] is a sanity check of the definition
(`signlessLapEigenvalues_nonneg`): it is Tau Ceti's `Matrix.PosSemidef.eigenvalues₀_nonneg` at
`posSemidef_signlessLapMatrix` (1.1). For graphs the derivative reads `χ_G' = ∑_v χ_{G-v}`,
since the principal submatrix at `V ∖ v` is the adjacency matrix of `G - v`
(`SimpleGraph.Embedding.submatrix_adjMatrix`); this form is not a separate target.

The monotonicity of the enumerations is Mathlib's `Matrix.IsHermitian.eigenvalues₀_antitone`,
each spectrum has `n` elements by `simp`, the algebraic connectivity is `ν_{n-1}` for `n ≥ 2` by
definition, and `νᵢ ≥ 0`, `νₙ = 0` on a nonempty vertex type are LaplacianEigenvaluesOfGraphs
1.1. That each of the three spectra is the root multiset of the real characteristic polynomial of
its matrix is `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues₀`. These are not separate
targets.

**Suggested proof:** `Matrix.IsHermitian.charpoly_eq` and
`Matrix.IsHermitian.roots_charpoly_eq_eigenvalues₀` give the characteristic polynomial; for
`adjSpectrum_eq_roots`, the characteristic polynomial commutes with `Int.castRingHom ℝ`
(`Matrix.charpoly_map`). The multiplicity is the algebraic multiplicity of a diagonalizable
matrix. For regular graphs, `L = kI - A` (1.1) reverses the order of the eigenvalues of `A`, hence
the index `i.rev`, while `Q = kI + A` keeps it. For the derivative, expand `det(XI - M)` by
Leibniz (`Matrix.det_apply'`) and differentiate each product
(`Polynomial.derivative_prod_finset`); the sum regroups as the sum over `v` of the determinants
of `XI - M` with column `v` replaced by `e_v`, and each of these is block triangular
(`Matrix.twoBlockTriangular_det`) with diagonal blocks `1` and `XI - M[V∖v]` [CRS, proof of
Theorem 2.3.1, p. 35]. The sparse expansion is `Matrix.det_succ_row_zero` followed by
`Matrix.det_succ_column_zero` on the one surviving minor. For the pendant vertex, reindex `V` as
`Fin (k + 2)` with `v ↦ 0` and `u ↦ 1` and apply the sparse expansion to `XI - A`.

**Checks.**
- `K₂`: `adjSpectrum = {1, -1}`, `lapSpectrum = {2, 0}`, `signlessLapSpectrum = {2, 0}`;
  `χ_A = X² - 1`.
- `K₁`: all three spectra are `{0}`. The empty type: all spectra are `0`, the empty multiset.
- `P₃`: `θ = √2, 0, -√2` and `ν = 3, 1, 0` at indices `0, 1, 2`; the algebraic connectivity is
  the value `1` at index `n - 2 = 1`.
- `signlessLapEigenvalues` of `K_{1,3}` is `4, 1, 1, 0`, and of `P₃` it is `3, 1, 0`, equal to `ν`
  since both graphs are bipartite (1.1). Negative control: an increasing order would put `0` at
  index `0`, where `signlessLapEigenvalues` of `K_{1,3}` has `4`.
- `K₄` (3-regular): `θ = 3, -1, -1, -1` and `ν = 4, 4, 4, 0`, which is `3 - θ` read at the
  reversed index (`ν₁ = 3 - θ₄`, `ν₄ = 3 - θ₁`); `q = 6, 2, 2, 2 = 3 + θ` index by index.
  Negative control: pairing `ν_{i+1}` with `k - θ_{i+1}` at the same index gives `3 - 3 = 0`
  against `ν₁ = 4`.
- `count_adjSpectrum` on `C₄` at `θ = 0`: `2`, the nullity of `A(C₄)`.
- Derivative: `K₂`: `(X² - 1)' = 2X = X + X`; `K₃`: `(X³ - 3X - 2)' = 3X² - 3 = 3(X² - 1)`;
  `M = [[a]]`: `(X - a)' = 1`, the characteristic polynomial of the empty matrix.
- Pendant vertex: `P₃` with leaf `0` and neighbour `1`: `X³ - 2X = X(X² - 1) - X`. Negative
  control: at the centre `v` of `P₃`, which has degree `2`, with a leaf `u` as neighbour,
  `X · X² - X = X³ - X ≠ X³ - 2X`; hence degree `1`.

*Needs:* 1.1; Mathlib `Analysis/Matrix/Spectrum.lean`, `Matrix.det_apply'`,
`Polynomial.derivative_prod_finset`, `Matrix.twoBlockTriangular_det`, `Matrix.det_succ_row_zero`,
`Matrix.det_succ_column_zero`, `SimpleGraph.induce`; SpectralGraphBounds 1.1;
LaplacianEigenvaluesOfGraphs 1.1.

### 1.3 Trace identities

- **Triangles** (`sum_cube_adjSpectrum`). `∑ θᵢ³ = 6t` with `t = #G.cliqueFinset 3`
  [BH, Proposition 1.3.1, p. 4; B, 2h, pp. 12–13].
- **Laplacian traces** (`sum_lapSpectrum`). `∑ νᵢ = ∑ qᵢ = 2m` [BH, §1.3, p. 4].

Over any semiring, `tr Aʰ` is the number of closed walks of length `h` [BH, Proposition 1.3.1,
p. 4; B, Lemma 2.5, p. 9], Mathlib's `SimpleGraph.adjMatrix_pow_apply_eq_card_walk` summed over
the diagonal; it is not a separate target. The spectral form `∑ θᵢʰ = tr Aʰ` is Tau Ceti's
`Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`; `∑ θᵢ = 0` and `∑ θᵢ² = 2m` are
SpectralGraphBounds 1.1, and the count of homomorphisms from the `k`-cycle as `∑ θᵢᵏ` is
QuasirandomGraphs 4.1.

**Suggested proof:** Mathlib's `SimpleGraph.adjMatrix_pow_apply_eq_card_walk` on the diagonal; a
closed walk of length 3 is a triangle with a start and a direction (`3 · 2 = 6` per triangle).
For the Laplacians, the trace is `∑ d(v) = 2m` (Mathlib's
`SimpleGraph.sum_degrees_eq_twice_card_edges`).

**Checks.**
- `K₃`: `8 - 1 - 1 = 6 = 6·1`. `K₄`: `27 - 3 = 24 = 6·4`.
- `C₄`: eigenvalues `2, 0, 0, -2`, `∑ θ³ = 0`, no triangles.
- `K₂`: `∑ ν = 2 + 0 = 2 = 2m`.
- Negative control: `tr A³` counts each triangle `6` times, not `3`; on `K₃` the closed walks of
  length `3` are the `6` walks `0→1→2→0`, `0→2→1→0` and their rotations.

*Needs:* 1.2; Tau Ceti `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`.

### 1.4 Row sums and degrees

- **Degree bound for the Laplacians** (`lapEigenvalues_le_two_mul_maxDegree`). `νᵢ ≤ 2k_max`
  and `qᵢ ≤ 2k_max`. The adjacency bound `|θᵢ| ≤ θ₁ ≤ k_max` is SpectralGraphBounds 1.2–1.3.

Both bounds are the weak forms of `ν₁ ≤ q₁ ≤ max_{x∼y}(d(x) + d(y))` on a graph with an edge
[BH, Proposition 3.9.1(i)–(ii), p. 50, and Corollary 3.9.2, p. 51]; the Laplacian half of that
sharper bound, the Anderson–Morley bound, is LaplacianEigenvaluesOfGraphs 4.1, which gives
`νᵢ ≤ ν₁ ≤ 2k_max` at once. The disc argument below proves both weak bounds without it.

`G` is `k`-regular if and only if `A𝟙 = k𝟙` [BH, §1.3.1, p. 4]: both sides say `d(x) = k` at
every `x`, by `SimpleGraph.adjMatrix_mulVec_const_apply`; this is not a separate target.

**Suggested proof:** the bounds are Gershgorin's discs (Mathlib's
`eigenvalue_mem_ball`): for `L` and for `Q` the disc of row `x` has centre `d(x)` and radius
`d(x)`.

**Checks.**
- `K_{1,3}`: `A𝟙 = (3,1,1,1)`, not constant. `C₅`: `A𝟙 = 2·𝟙`.
- `K₂`: `ν₁ = q₁ = 2 = 2k_max`, so both bounds are attained.
- `K_{1,3}`: `q = 4, 1, 1, 0`, and `4 ≤ 6`. Negative control: the bound `k_max` that holds for `θ`
  fails for `ν`: `ν₁(K₂) = 2 > 1 = k_max`.

*Needs:* 1.2.

### 1.5 The variational formula for the algebraic connectivity

- **The variational formula** (`isLeast_algebraicConnectivity`). For `n ≥ 2`, the algebraic
  connectivity `ν_{n-1}` is the least value of `uᵀLu/uᵀu` over nonzero `u` with `∑ u_x = 0`
  [BH, §1.7, p. 13, where it is `μ₂`].

The min–max and max–min forms of Courant–Fischer for `A`, `L` and `Q`, whose enumerations are all
nonincreasing, are RandomMatrices 1.2 applied to `G.adjMatrix ℝ`, `G.lapMatrix ℝ` and
`G.signlessLapMatrix ℝ`. LaplacianEigenvaluesOfGraphs uses the variational formula as a step of
its Layer 3 routes and does not state it. The count of zero Laplacian eigenvalues as the number
of components, and "for `n ≥ 2`, `G` is connected if and only if its algebraic connectivity is
positive", are LaplacianEigenvaluesOfGraphs 1.2.

**Suggested proof:** `𝟙` spans a kernel vector for `νₙ = 0`, and by RandomMatrices 1.2 for
`G.lapMatrix ℝ` at the index `n - 2` the Rayleigh quotient on `𝟙^⊥` has minimum the next
eigenvalue; state it for a positive semidefinite symmetric matrix and a nonzero kernel vector,
and specialize.

**Checks.**
- `P₃`, `u = (1, 0, -1)`: `∑ u = 0`, `uᵀLu = 2`, `uᵀu = 2`, quotient `1`, the algebraic
  connectivity of `P₃`.
- `K_n`: every `u ⊥ 𝟙` has `uᵀLu = n uᵀu`, so the algebraic connectivity is `n`.
- Negative control: on `K₁` the set of the formula is empty; the hypothesis `2 ≤ n` is needed.
  Negative control: without `∑ u_x = 0`, `u = 𝟙` gives the quotient `0`, below the algebraic
  connectivity `2` of `K₂`.

*Needs:* 1.1, 1.2; RandomMatrices 1.2; LaplacianEigenvaluesOfGraphs 1.1.

### 1.6 Irreducibility

- **Irreducibility** (`isIrreducible_adjMatrix_iff`). On a vertex type with at least two
  elements, `G.adjMatrix ℝ` is irreducible (Mathlib's `Matrix.IsIrreducible`) if and only if `G`
  is connected [BH, §3.1, p. 33; CRS, §1.3, p. 15].

That `(Aʰ)_{xy} > 0` if and only if there is a walk of length `h` from `x` to `y`
[BH, Proposition 1.3.1, p. 4] is `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`; it is not a
separate target.

**Suggested proof:** use `Matrix.isIrreducible_iff_exists_pow_pos`, and note that with two vertices
in a connected graph every vertex lies on an edge, so `x` reaches `x` by a walk of length `2`.

**Checks.**
- `K₂`: `A = [[0,1],[1,0]]` is irreducible; `A² = I`.
- Negative control: on `K₁`, `A = [0]` is not irreducible, since Mathlib's definition asks for a
  path of positive length from each vertex to itself, while `K₁` is connected; hence
  `Nontrivial V`.
- `2K₁`: `A = 0` is reducible and the graph is disconnected.

*Needs:* Mathlib `Matrix.IsIrreducible`, walk counting.

### 1.7 Disjoint unions, isomorphisms and components

- **Disjoint unions** (`adjSpectrum_sum`, `charpoly_adjMatrix_sum`). Each spectrum of `G ⊕g H` is
  the multiset sum of the spectra; over any commutative ring the characteristic polynomial of `A`
  is the product [BH, Proposition 1.3.6, p. 7].
- **Isomorphism invariance** (`Iso.adjSpectrum_eq`, `Iso.charpoly_adjMatrix_eq`). Isomorphic
  graphs have the same three spectra and, over any commutative ring, the same characteristic
  polynomial of `A`.
- **Components** (`adjSpectrum_eq_sum_connectedComponent`). Each spectrum of `G` is the sum over
  connected components `c` of the spectrum of `G.induce c.supp` [BH, Proposition 1.3.6, p. 7].

**Suggested proof:** the matrices of `G ⊕g H` are block diagonal (`Matrix.fromBlocks` after
`Equiv.sumCongr`), and `Matrix.charpoly_fromBlocks_zero₁₂`; for an isomorphism use
`SimpleGraph.Iso.reindex_adjMatrix` and `Matrix.charpoly_reindex`. For components, reindex `V` as
`Σ c, c.supp` and iterate the block decomposition.

**Checks.**
- `K₂ ⊕g K₁`: `adjSpectrum = {1, -1, 0}`, `χ = (X² - 1)·X`.
- `K₃ ⊕g K₃`: `lapSpectrum = {0, 0, 3, 3, 3, 3}`.
- `pathGraph 2 ≃g ⊤ : SimpleGraph (Fin 2)`: both adjacency spectra `{1, -1}`. Negative control:
  `K_{1,4}` and `C₄ ⊕g K₁` have the same adjacency spectrum `2, 0³, -2` and are not isomorphic,
  so the converse of isomorphism invariance fails [BH, §1.3.7, p. 7].

*Needs:* 1.2; Mathlib `SimpleGraph.sum`, `SimpleGraph.Iso.reindex_adjMatrix`, `ConnectedComponent`.

### 1.8 Spectra from spectral decompositions

AssociationSchemes 5.1 gives eigenvalues together with primitive idempotents, and 2.6 builds such
systems from explicit eigenvectors. This section turns such a decomposition into a multiset
spectrum (the spectral decomposition of an adjacency matrix is [B, 2j, p. 13]).

- **Spectrum from orthogonal idempotents** (`Matrix.map_eigenvalues₀_eq_sum_replicate_rank`).
  Let `M` be a Hermitian matrix over `ℝ` or `ℂ` and let `E : ι → Matrix V V 𝕜` be a finite indexed
  collection with `CompleteOrthogonalIdempotents E` (each `Eᵢ` idempotent, `EᵢEⱼ = 0` for `i ≠ j`,
  `∑ Eᵢ = I`), with `M = ∑ θᵢ Eᵢ` for reals `θᵢ`. Then the eigenvalue multiset of `M`, read from
  `eigenvalues₀`, is `∑ᵢ replicate (rank Eᵢ) θᵢ`; `rank Eᵢ = tr Eᵢ`; and if the `θᵢ` are distinct,
  the multiplicity of `θᵢ` is `rank Eᵢ`. Neither distinctness nor symmetry of the `Eᵢ` is needed
  for the first two conclusions.
- **For the adjacency matrix** (`adjSpectrum_eq_sum_replicate_rank`). If `G.adjMatrix 𝕜 = ∑ θᵢ Eᵢ`
  in the same sense, then `G.adjSpectrum = ∑ᵢ replicate (rank Eᵢ) θᵢ`, and for distinct `θᵢ`,
  `G.adjSpectrum.count θᵢ = rank Eᵢ`.

**Suggested proof:** `V` is the direct sum of the ranges of the `Eᵢ` (from `∑ Eᵢ = I` and
`EᵢEⱼ = δᵢⱼ Eᵢ`), and `M` acts on the range of `Eᵢ` as `θᵢ`. A basis adapted to the sum conjugates
`M` to a diagonal matrix with `θᵢ` repeated `rank Eᵢ` times, so the characteristic polynomial is
`∏ᵢ (X - θᵢ)^{rank Eᵢ}`, and `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues₀` identifies the
multisets. An idempotent is diagonalizable with eigenvalues `0` and `1`, so its trace is its
rank. For the adjacency matrix over `ℂ`, the characteristic polynomial is the image of the real
one (`Matrix.charpoly_map`).

**Checks.**
- `K₂`: `A = 1 · E₊ - 1 · E₋` with `E± = (I ± A)/2`, idempotents of rank and trace `1`;
  spectrum `{1, -1}`.
- Repeated values: on `Fin 6`, `M = 1.5 E₁ - 2 E₂ + 1.5 E₃` with `E₁, E₂, E₃` the coordinate
  projections onto `{0, 1}`, `{2}` and `{3, 4, 5}` has spectrum `1.5⁵, -2`, the multiset sum.
  With `N` the matrix unit at `(0, 3)`, the oblique idempotents `E₁ - N`, `E₂`, `E₃ + N` are
  again complete and orthogonal, not symmetric, with the same `M`, the same spectrum and traces
  `2, 1, 3`.
- Negative control: completeness `∑ Eᵢ = I` is needed. The zero matrix on two vertices is
  `0 · E` for the single idempotent `E = diag(1, 0)`, of rank `1`, but `E ≠ I`; the formula gives
  `{0}`, while the spectrum is `{0, 0}`.
- Negative control: with `θ = (1.5, -2, 1.5)` above, the count of `1.5` is `5`, not
  `rank E₁ = 2`, so the injectivity hypothesis of the last conclusion is needed.

*Needs:* 1.2; Mathlib `CompleteOrthogonalIdempotents`, `Matrix.rank`, `Matrix.trace`,
`Matrix.IsHermitian.eigenvalues₀`.

## Layer 2: standard graphs and line graphs

AssociationSchemes 5.1 gives the eigenvalues and primitive idempotents of the Johnson scheme,
whose classes `1` and `k` are the Johnson and Kneser graphs, and DelsarteTheoryOfCodesAndDesigns
2.1 those of the Hamming scheme; neither fixes the spectrum as a multiset with multiplicities.
This layer gives the standard graphs their basic API, computes the Laplacian spectrum of the path
and the spectra of line graphs, and derives by 1.8 the multiset spectra (2.6), from explicit
eigenvectors [BH, §1.4, pp. 8–10] and from those idempotents.

The definitions are `hammingGraph`, `hypercube`, `johnsonGraph` and `petersenGraph`, with their
`DecidableRel` instances; the Kneser graph is the local copy of TopologicalCombinatorics 3.1.
That `hammingGraph d Q` relates `x` and `y` exactly when `hammingDist x y = 1` holds by
definition.

*Depends on:* 1; AssociationSchemes 5.1 (for 2.6); TopologicalCombinatorics 3.1.

### 2.1 Complete multipartite graphs

- **Degrees** (`degree_completeMultipartiteGraph`). In Mathlib's `completeMultipartiteGraph P`, a
  vertex of part `i` has degree `n - |Pᵢ|`. Mathlib has the equal-part case
  (`SimpleGraph.degree_completeEquipartiteGraph`).

**Suggested proof:** the non-neighbours of `x` are exactly the vertices of its own part.

**Checks.** `K_{2,2,2}`: every vertex has degree `6 - 2 = 4`. `K_{1,3}`: degrees `3` and `1`.
`K_{1,2,3}`: degrees `5`, `4, 4` and `3, 3, 3`. Negative control: the degree is not `n - 1 - |Pᵢ|`
(which would count `x` itself twice): on `K_{1,3}` the centre has degree `3 = 4 - 1`.

*Needs:* Mathlib `completeMultipartiteGraph`.

### 2.2 The Laplacian of the path

- **The path** (`lapSpectrum_pathGraph`). `L(Pₙ)` has eigenvalues `2 - 2cos(πj/n)`,
  `j = 0, …, n-1` [BH, §1.4.4, p. 9].

**Suggested proof:** the vectors `x ↦ cos(πj(2x+1)/(2n))` are eigenvectors, nonzero and pairwise
orthogonal for `j = 0, …, n-1` (distinct eigenvalues), so they exhaust the spectrum.

**Checks.**
- `P₀`: the empty multiset. `P₁`: `{0}`. `P₃`: `0, 1, 3`. `P₄`: `0, 2 - √2, 2, 2 + √2`.
- Negative control: the adjacency formula shifted, `2 - 2cos(πj/(n+1))` for `j = 1, …, n`, gives
  `2 - √2, 2, 2 + √2` on `P₃` and misses the eigenvalue `0`.

*Needs:* 1.2.

### 2.3 Hamming graphs and the hypercube

- **Basic API** (`hammingGraph_isRegularOfDegree`, `hammingGraph_connected`,
  `hammingGraph_dist`, `nonempty_iso_hammingGraph_succ`, `hypercube_isBipartite`). `H(d, q)` is
  regular of degree `d(q-1)`, is connected for nonempty `Q`, its graph distance is the Hamming
  distance, `H(d+1, q) ≅ H(d, q) □ K_q`, and the hypercube is bipartite [BH, §12.4.1, p. 178].

**Suggested proof:** the neighbours of `x` change one coordinate to one of `q - 1` other values.
For the distance, changing the differing coordinates one at a time is a walk of length
`hammingDist x y`, and each edge changes the Hamming distance by at most `1`. The isomorphism
splits off the last coordinate. Colour the hypercube by the parity of the
number of `true` coordinates.

**Checks.**
- `H(1, q) = K_q`; `H(2, 3)` is `K₃ □ K₃`, 4-regular on 9 vertices.
- `hammingGraph_dist` on `Q₃`: `(0,0,0)` and `(1,1,1)` are at distance `3`.
- `H(0, q)` has one vertex and degree `0 = 0·(q - 1)`. Negative control: for empty `Q` and
  `d ≥ 1` the vertex type is empty, which Mathlib's `Connected` excludes; hence `Nonempty Q`.

*Needs:* Mathlib `hammingDist`, `SimpleGraph.boxProd`.

### 2.4 Johnson, Kneser and Petersen graphs

- **Johnson graphs** (`johnsonGraph_isRegularOfDegree`, `johnsonGraph_dist`,
  `nonempty_iso_johnsonGraph_one`). `J(n, k)` is regular of degree `k(n - k)`, the distance of
  two `k`-sets is `k - |s ∩ t|`, and `J(n, 1) ≅ Kₙ` [BH, §12.4.2, p. 179].
- **Kneser graphs** (`kneserGraph_two_eq_compl`). `K(n, 2)` is the complement of `J(n, 2)`. The
  regularity of `K(n, k)` of degree `C(n-k, k)` for `k ≥ 1` and `K(n, 1) ≅ Kₙ` are
  TopologicalCombinatorics 3.1.

That the Petersen graph has 10 vertices, is 3-regular and has 15 edges [BH, §1.4.5, p. 10] is
a sanity check of the definition (`petersenGraph_card`).

**Suggested proof:** count the neighbours of `s`: choose the element of `s` to drop and the
element of `sᶜ` to add. For the distance, exchanging one element of `s ∖ t` for one of `t ∖ s` is
an edge, and each edge changes `|s ∩ t|` by at most `1`. Two distinct `2`-sets meet in one point
or are disjoint. The Petersen counts are a finite computation, or the regularity of the
complement of `J(5, 2)`.

**Checks.**
- `J(4, 2)` is 4-regular on 6 vertices (the octahedron); `K(4, 2)` is `3K₂`.
- `johnsonGraph_dist` in `J(5, 2)`: `{0, 1}` and `{2, 3}` are at distance `2`, and they are
  adjacent in the Petersen graph `K(5, 2)`.
- `K(5, 2)`: degree `10 - 1 - 6 = 3` as the complement of the 6-regular `J(5, 2)`.
- Negative control: `J(n, 0)` has one vertex, and `johnsonGraph_dist` gives `0 - 0 = 0`; the
  formula `k - |s ∩ t|` would be wrong as `|s ∖ t| + |t ∖ s|`, which is twice it.

*Needs:* the definitions above; TopologicalCombinatorics 3.1.

### 2.5 Line graphs

- **Incidence identity** (`transpose_mul_unsignedIncMatrix`). For the unsigned incidence matrix
  `U` of 1.1, `UᵀU = 2I + A(L(G))`, over any semiring [BH, §1.4.5, p. 9; Ba, introduction to
  Chapter 7, p. 87].
- **Least eigenvalue** (`neg_two_le_adjEigenvalues_lineGraph`). Every eigenvalue of a line graph
  is at least `-2` [BH, §1.4.5, p. 9].
- **Regularity** (`IsRegularOfDegree.lineGraph`). The line graph of a `k`-regular graph is
  `(2k - 2)`-regular [BH, Corollary 1.4.2, p. 10].
- **Regular graphs** (`adjSpectrum_lineGraph_of_isRegular`). If `G` is `k`-regular with `k ≥ 2`,
  the spectrum of `L(G)` is `θᵢ + k - 2` (`i = 1, …, n`) together with `-2` of multiplicity
  `kn/2 - n` [BH, Corollary 1.4.2, p. 10; B, Theorem 3.8, p. 19].
- **`J(n, 2)` as a line graph** (`nonempty_iso_johnsonGraph_two_lineGraph`). `J(n, 2) ≅ L(Kₙ)`
  [BH, §12.4.2, p. 179, and §1.4.5, p. 10].

**Suggested proof:** entrywise count for `UᵀU`; it is a Gram matrix, so positive semidefinite.
For regular `G`, `UUᵀ = Q = kI + A` (1.1), and `Matrix.charpoly_mul_comm'` gives
`χ_{UᵀU} = X^{m-n} χ_{UUᵀ}` with `m = kn/2 ≥ n`. An edge of `L(G)` at `xy` is an edge at `x` or
at `y` other than `xy`, `2(k - 1)` choices. A `2`-subset of `α` is an edge of `Kₙ`, and two
`2`-subsets share one point exactly when the edges are adjacent in the line graph.

**Checks.**
- `L(K₃) = K₃`: `k = 2`, `m - n = 0`; spectrum `2, -1, -1` unchanged.
- `L(K₄) = K_{2,2,2}`: `3 + 1 = 4`, `-1 + 1 = 0` three times, and `-2` twice: `4, 0³, (-2)²`.
- `L(K₅) = J(5, 2)`: `6, 1⁴, (-2)⁵`.
- `L(K_{1,3}) = K₃` (not regular): least eigenvalue `-1 ≥ -2`.
- Negative control: `L(P₃) = K₂` with `P₃` not regular; the regular formula with `k = 2` would
  give `√2, 0, -√2` and no `-2`, not `±1`.

*Needs:* 1.1, 1.2; Mathlib `SimpleGraph.lineGraph`, `incMatrix`, `Matrix.charpoly_mul_comm'`.

### 2.6 Multiset spectra of the standard graphs

Each spectrum below is obtained by 1.8 from a complete system of orthogonal idempotents, built
from explicit eigenvectors or taken from AssociationSchemes 5.1; the targets are the multisets,
with multiplicities.

- **Complete graphs** (`adjSpectrum_top`). For `n ≥ 1`, `Kₙ` has spectrum `n - 1, (-1)^{n-1}`
  [BH, §1.4.1, p. 8].
- **Cycles** (`adjSpectrum_cycleGraph`). For `n ≥ 3`, `Cₙ` has spectrum `2cos(2πj/n)`,
  `j = 0, …, n - 1` [BH, §1.4.3, p. 9].
- **Paths** (`adjSpectrum_pathGraph`). `Pₙ` has spectrum `2cos(πj/(n + 1))`, `j = 1, …, n`
  [BH, §1.4.4, p. 9; CRS, §2.6, p. 47].
- **Complete bipartite graphs** (`adjSpectrum_completeBipartiteGraph`). For `a, b ≥ 1`, `K_{a,b}`
  has spectrum `√(ab), -√(ab)` and `0` with multiplicity `a + b - 2` [BH, §1.4.2, p. 8].
- **Complete equipartite graphs** (`adjSpectrum_completeEquipartiteGraph`). For `r, t ≥ 1`,
  `K_{r×t}` (Mathlib's `completeEquipartiteGraph r t`) has spectrum `t(r - 1)`, `0` with
  multiplicity `r(t - 1)` and `-t` with multiplicity `r - 1`.
- **Hamming graphs** (`adjSpectrum_hammingGraph`). For nonempty `Q` with `q` elements, `H(d, q)`
  has the eigenvalue `d(q - 1) - qi` with multiplicity `C(d, i)(q - 1)^i`, `i = 0, …, d`
  [BH, §1.4.6, p. 10, and §12.4.1, p. 178].
- **Johnson graphs** (`adjSpectrum_johnsonGraph`). For `2k ≤ n`, `J(n, k)` has the eigenvalue
  `(k - j)(n - k - j) - j` with multiplicity `C(n, j) - C(n, j - 1)`, `j = 0, …, k`, the
  multiplicity at `j = 0` being `1` [BH, §12.4.2, p. 179].
- **Kneser graphs** (`adjSpectrum_kneserGraph`). For `1 ≤ k` and `2k ≤ n`, the Kneser graph of
  TopologicalCombinatorics 3.1 has the eigenvalue `(-1)^j C(n - k - j, k - j)` with the same
  multiplicities (from AssociationSchemes 5.1; [BH, §12.4.2, p. 179] defines `K(n, k)`).

Two special cases carry names of their own because other roadmaps cite them; they are
corollaries of the two headlines above, not further work:
- **Hypercubes** (`adjSpectrum_hypercube`). `Q_d` has the eigenvalue `d - 2i` with multiplicity
  `C(d, i)`, `i = 0, …, d` [BH, §1.4.6, p. 10]: the Hamming formula at `Q = Bool`.
- **The Petersen graph** (`adjSpectrum_petersenGraph`). Its spectrum is `3, 1⁵, (-2)⁴`
  [BH, §1.4.5, p. 10]: the Kneser formula at `(n, k) = (5, 2)`.

**Suggested proof:** in each case write `A = ∑ θᵢ Eᵢ` with complete orthogonal idempotents
`Eᵢ`, and 1.8 turns this into the multiset once the ranks are known. For `Kₙ`:
`A = (n - 1) · J/n + (-1)(I - J/n)`, ranks `1` and `n - 1`. For cycles, the rank-one projections
`u_j u_jᴴ/n` onto the characters `u_j(x) = ζ^{jx}`, `ζ = e^{2πi/n}`, one per `j`, with eigenvalue
`ζ^j + ζ^{-j} = 2cos(2πj/n)` [BH, §1.4.3, pp. 8–9]; 1.8 needs no distinctness, so coinciding
values at `j` and `n - j` are added. For paths, the rank-one projections onto
`x ↦ sin(πj(x + 1)/(n + 1))`, an eigenvector with eigenvalue `2cos(πj/(n + 1))` by the
addition formula, since the sine vanishes at `x = -1` and `x = n` [BH, §1.4.4, p. 9]; the `n`
eigenvalues are distinct, so the projections are orthogonal. For `K_{a,b}` with parts `X` and
`Y`, the rank-one projections onto `√b 𝟙_X ± √a 𝟙_Y`, with eigenvalues `±√(ab)`, and the
projection onto their complement, the vectors with sum zero on each part, which `A` maps to `0`. For
`K_{r×t}`, `A = J - B` with `B` the block-diagonal matrix of the `r` all-ones blocks of size `t`:
the projections `J/n`, `B/t - J/n` and `I - B/t`, of ranks `1`, `r - 1` and `r(t - 1)`, carry the
eigenvalues `t(r - 1)`, `-t` and `0`. For `H(d, q)`: `H(d + 1, q) ≅ H(d, q) □ K_q` (2.3), and
`A(G □ H) = A(G) ⊗ I + I ⊗ A(H)` entrywise from the definition of `SimpleGraph.boxProd` [BH, §1.4.6,
p. 10], so Kronecker products of idempotents of the factors are complete orthogonal idempotents of
the product, with the sums of the eigenvalues; for `H(d, q)` the products of `J/q` and `I - J/q`
with `i` factors `I - J/q`, grouped by `i`, have total rank `C(d, i)(q - 1)^i` and eigenvalue
`(d - i)(q - 1) - i = d(q - 1) - qi`. For the Johnson and Kneser graphs, the primitive idempotents
`E_j` of AssociationSchemes 5.1, whose eigenvalues on classes `1` and `k` are its Eberlein values
`(k - j)(n - k - j) - j` and `(-1)^j C(n - k - j, k - j)`, and whose ranks `C(n, j) - C(n, j - 1)`
are the differences of the traces `tr(E_0 + ⋯ + E_j) = C(n, j)` given there; a general `α` with `n`
elements is reached through `α ≃ Fin n` and 1.7. The Petersen graph is `K(5, 2)`.
**Checks.**
- `K₄ = K_{4×1}`: `3, (-1)³` from both formulas; `C₄ = K_{2,2} = K_{2×2} = Q₂`: `2, 0, 0, -2`
  from all four.
- `J(5, 2)`: `6, 1⁴, (-2)⁵` (`j = 0, 1, 2`, multiplicities `1, 5 - 1, 10 - 5`); `K(5, 2)`:
  `3, (-2)⁴, 1⁵`, the Petersen spectrum. `K(6, 3)` (`n = 2k`): `1, (-1)⁵, 1⁹, (-1)⁵`, where the
  eigenvalues coincide in pairs and the multiplicities add up.
- Negative controls: `cycleGraph 2` is `K₂`, with spectrum `±1`, while the cycle formula gives
  `±2`; hence `n ≥ 3`. On the empty type `⊤` has spectrum `0`, while the formula has one element
  `-1`; hence `Nonempty V`. `K(n, 0)` is a single vertex with spectrum `{0}`, while the formula
  gives `{C(n, 0)} = {1}`; hence `1 ≤ k`. `J(4, 3) ≅ K₄` has spectrum `3, (-1)³`, while the
  Johnson formula gives the six values `3, (-1)³, (-3)²`; hence `2k ≤ n`. `K_{0,1}` is a single
  vertex with spectrum `{0}`, while the bipartite formula gives `±0`, two elements; hence
  `a, b ≥ 1`.

*Needs:* 1.7, 1.8, 2.3, 2.4; AssociationSchemes 5.1; Mathlib `SimpleGraph.boxProd`.

## Layer 3: Perron–Frobenius and the index

The bounds `2m ≤ nθ₁` with equality exactly for regular graphs, `θ₁ ≤ k_max`, `|θᵢ| ≤ θ₁`, the
monotonicity of `θ₁` under deleting edges on one vertex type and the multiplicity of `k` in a
`k`-regular graph are SpectralGraphBounds 1.2–1.4. The bipartiteness criteria "for a connected
graph with a positive eigenvector for `r`, `-r` is an eigenvalue" and "the spectrum is symmetric
about `0`" are PeriodicNonnegativeMatrices 3.2 and 3.3. This layer applies them as stated, since its
enumeration is that of SpectralGraphBounds 1.1 (Conventions).

*Depends on:* 1, 2; Tau Ceti Perron–Frobenius; SpectralGraphBounds 1.1–1.4;
PeriodicNonnegativeMatrices 3.2; LaplacianEigenvaluesOfGraphs 2.1.

### 3.1 Distinct eigenvalues

- **Diameter bound** (`diam_add_one_le_card_adjSpectrum`). A connected graph of diameter `d` has
  at least `d + 1` distinct eigenvalues of `A`, of `L` and of `Q` [BH, Proposition 1.3.3, p. 5;
  B, Corollary 2.7, p. 10].
- **One distinct eigenvalue** (`card_lapSpectrum_toFinset_eq_one_iff`). On a nonempty vertex
  type, `L` has exactly one distinct eigenvalue if and only if `G` has no edges, and likewise `Q`
  [BH, Proposition 1.3.2, p. 5, and introduction to Chapter 15, p. 221]. For `A` this is
  SpectralGraphBounds 1.1 with `∑ θᵢ = 0`.
- **Two distinct eigenvalues** (`Connected.eq_top_of_card_adjSpectrum_toFinset_eq_two`). A
  connected graph with exactly two distinct eigenvalues of `A`, of `L` or of `Q` is complete
  [BH, introduction to Chapter 15, p. 221; CRS, Exercise 4.2, p. 133].

**Suggested proof:** state the diameter bound for a symmetric matrix `M` whose off-diagonal
entries are `a ≠ 0` on edges and `0` elsewhere: for `x, y` at distance `h ≤ d`,
`(Mʰ)_{xy} = aʰ(Aʰ)_{xy} ≠ 0` and `(Mʲ)_{xy} = 0` for `j < h`, so `I, M, …, M^d` are linearly
independent, while the minimal polynomial of a symmetric matrix has one simple root per distinct
eigenvalue; `A`, `L` and `Q` have `a = 1, -1, 1`. A symmetric matrix with a single eigenvalue `c`
is `cI`, so its off-diagonal entries vanish. Two distinct eigenvalues force diameter `1`.

**Checks.**
- `Kₙ`: diameter `1`, two distinct eigenvalues. `C₅`: diameter `2`, three.
- `Pₙ`: diameter `n - 1`, `n` distinct eigenvalues (equality).
- Negative control: `2K₂` has `diam = 0` by Mathlib's convention and two distinct eigenvalues
  `±1`, and it is not complete; both statements need connectivity.
- `K₁`: one distinct eigenvalue, no edges. Negative control: on the empty type every spectrum is
  empty, with no distinct eigenvalue, while `G = ⊥`; hence `Nonempty V`.

*Needs:* 1.2; Mathlib `SimpleGraph.diam`, `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`.

### 3.2 Perron–Frobenius for graphs

- **Connected graphs** (`Connected.perronFrobenius`). If `G` is connected, `θ₁` is a simple
  eigenvalue with a positive eigenvector [BH, Proposition 3.1.1, p. 33, and Theorem 2.2.1, p. 22;
  CRS, Theorem 1.3.6, p. 15].
- **Nonnegative eigenvectors** (`Connected.eigenvalue_eq_of_nonneg`). If `G` is connected, every
  nonzero nonnegative eigenvector belongs to `θ₁` and is positive [BH, Theorem 2.2.1(iv), p. 22].
- **Regular graphs** (`IsRegularOfDegree.largestEigenvalue_eq`). A `k`-regular graph on a nonempty
  vertex type has `θ₁ = k` [BH, Proposition 1.3.8, p. 7].

**Suggested proof:** for `n ≥ 2`, 1.6 and Tau Ceti's `Matrix.IsIrreducible.exists_mulVec_eq_smul`,
`Matrix.IsIrreducible.rootMultiplicity_charpoly_eq_one` and
`Matrix.IsIrreducible.exists_pos_eq_smul_of_mulVec_eq_smul`; the eigenvalue of the positive
eigenvector is the spectral radius (`Matrix.spectralRadius_eq_of_mulVec_eq_smul`), which is `θ₁`.
An eigenvector for another eigenvalue is orthogonal to the positive one, so it cannot be nonzero
and nonnegative. `K₁` is checked directly. For regular graphs, `A𝟙 = k𝟙` (1.4) and
SpectralGraphBounds 1.2 give `k ≤ θ₁ ≤ k_max = k`.

**Checks.**
- `K_{1,3}`: `θ₁ = √3` with eigenvector `(√3, 1, 1, 1)`.
- Negative control: `2K₂` has `θ₁ = 1` of multiplicity `2`, and the nonnegative eigenvector
  `(1, 1, 0, 0)` is not positive; both need connectivity.
- Petersen: `θ₁ = 3`, simple.

*Needs:* 1.2, 1.4, 1.6; Tau Ceti Perron–Frobenius; SpectralGraphBounds 1.2.

### 3.3 Degree bounds for connected graphs

- **Connected graphs** (`Connected.largestEigenvalue_lt_maxDegree`). If `G` is connected,
  `θ₁ = k_max` if and only if `G` is regular; if `G` is connected and not regular,
  `k_min < k̄ < θ₁ < k_max` with `k̄ = 2m/n` [CRS, Theorem 3.2.1, p. 55; BH, Proposition 3.1.2,
  p. 33].

**Suggested proof:** `k̄ ≤ θ₁` with equality only for regular graphs is SpectralGraphBounds 1.2,
and `k_min < k̄` for a non-regular graph is an average. For the upper bound, evaluate `Av = θ₁v`
at a vertex where the positive Perron vector (3.2) is maximal and propagate equality along edges.

**Checks.**
- `P₄`: `k_min = 1 < k̄ = 1.5 < θ₁ = 1.618… < k_max = 2`.
- `K_{1,3}`: `1 < 1.5 < √3 < 3`.
- Negative control: `K₃ ⊕g K₂` is not regular and has `θ₁ = 2 = k_max`; connectivity is needed.

*Needs:* 3.2; SpectralGraphBounds 1.2.

### 3.4 Monotonicity and extremes of the index

- **Monotonicity** (`Copy.largestEigenvalue_le`). If `H` is a subgraph of `G` (a `Copy H G`, not
  necessarily induced, on a possibly smaller vertex type), `θ₁(H) ≤ θ₁(G)`; if `G` is connected
  and `H` has fewer vertices or fewer edges than `G`, the inequality is strict [CRS, Propositions
  1.3.9–1.3.10, p. 17; BH, Proposition 3.1.1, p. 33]. On one vertex type the weak inequality is
  SpectralGraphBounds 1.3.
- **Spanning subgraphs** (`eval_charpoly_adjMatrix_le`, `Connected.eval_charpoly_adjMatrix_lt`).
  On a nonempty vertex type, if `H ≤ G` then `χ_H(x) ≥ χ_G(x)` for every real `x ≥ θ₁(G)`; if
  moreover `G` is connected and `H < G` (a proper spanning subgraph), then `χ_H(x) > χ_G(x)` for
  every real `x ≥ θ₁(G)` [CRS, Lemma 8.1.19, pp. 237–238].
- **Extremes for connected graphs** (`Connected.largestEigenvalue_bounds`). A connected graph on
  `n` vertices has `2cos(π/(n+1)) ≤ θ₁ ≤ n - 1`, with equality on the left only for `Pₙ` and on
  the right only for `Kₙ` [St, (2.1), p. 28].
- **Grafting pendant paths.** Let `G(k, l)` be obtained from a connected graph `G` with at least
  two vertices by attaching pendant paths with `k` and `l` edges at the same vertex. If
  `k ≥ l ≥ 1`, then `θ₁(G(k, l)) > θ₁(G(k + 1, l - 1))` [CRS, Theorem 8.1.20, p. 238; St,
  Lemma 1.29(i), p. 20].
- **Trees: the lower bound** (`IsTree.le_largestEigenvalue`). A tree on `n` vertices has
  `θ₁ ≥ 2cos(π/(n+1))`, with equality only for the path `Pₙ` [St, Theorem 2.67, p. 71; CRS,
  Theorem 8.1.17, p. 236].
- **Trees: the upper bound** (`IsTree.largestEigenvalue_le`). A tree on `n` vertices has
  `θ₁ ≤ √(n - 1)`, with equality only for the star `K_{1,n-1}` [St, (2.59), p. 53; CRS, Theorem
  8.1.17, p. 236].

**Suggested proof:** for monotonicity, take the Perron vector of `H` extended by zero as a test
vector in the Rayleigh bound of SpectralGraphBounds 1.1; strictness from 3.2 (a nonnegative vector
with Rayleigh quotient `θ₁(G)` is a positive eigenvector, which forces all vertices and edges). For
spanning subgraphs [CRS, proof of Lemma 8.1.19, pp. 237–238], induct on `n` for the weak inequality,
over all graphs: by the derivative formula of 1.2, `(χ_H - χ_G)' = ∑_v (χ_{H-v} - χ_{G-v})`, which
is nonnegative for `x ≥ θ₁(G)` by induction, since `H - v ≤ G - v` and `θ₁(G - v) ≤ θ₁(G)` by
monotonicity (for `n = 1`, `H = G`). At `x = θ₁(G)`, `χ_G(x) = 0` and `χ_H(x) ≥ 0`, since every root
of `χ_H` is at most `θ₁(H) ≤ θ₁(G)`; so `χ_H - χ_G` is nonnegative on `[θ₁(G), ∞)`. For connected
`G` and `H < G`, strict monotonicity gives `θ₁(H) < θ₁(G)`, so `χ_H(x) > 0 = χ_G(x)` at `x = θ₁(G)`,
and the difference is positive from there on. For grafting [CRS, proof of Theorem 8.1.20, pp.
238–239], the pendant-vertex recursion of 1.2 at the end of a pendant path, with isomorphism
invariance (1.7), gives `χ_{G(k,l)} = Xχ_{G(k,l-1)} - χ_{G(k,l-2)}`, which reduces the difference
`χ_{G(k+1,l-1)} - χ_{G(k,l)}` to `χ_H - χ_{G(k-l,0)}` with `H` a proper spanning subgraph of
`G(k - l, 0)`; by the spanning-subgraph inequality this is positive from `θ₁(G(k - l, 0))` on. Since
`θ₁(G(k - l, 0)) < θ₁(G(k, l))` by strict monotonicity, `χ_{G(k+1,l-1)} > χ_{G(k,l)} ≥ 0` on
`[θ₁(G(k, l)), ∞)`, so every root of `χ_{G(k+1,l-1)}` lies below `θ₁(G(k, l))`. For the lower bound
on trees [St, proof of Theorem 2.67, p. 71]: root a tree that is not a path at a leaf and take a
deepest vertex `w` of degree at least `3`. Each branch at `w` away from the root is a pendant path,
and the rest of the tree, which contains the root and `w`, is a connected graph with at least two
vertices; grafting one pendant path at `w` onto another, `l` times, strictly lowers `θ₁`, keeps a
tree on `n` vertices and lowers `∑_x max(d(x) - 2, 0)`, so repetition ends at `Pₙ`; the index of
`Pₙ` is `2cos(π/(n+1))`, the largest value of its spectrum (2.6). For connected graphs, a spanning
tree and monotonicity give the lower bound, and strictness gives equality only when `G` is itself a
tree, hence `Pₙ`. The upper bounds: `θ₁ ≤ k_max ≤ n - 1`, with equality only for `Kₙ` by strictness;
for trees, Hong's bound (3.5, which does not use this section) with `m = n - 1`.

**Checks.**
- `P₄`: `θ₁ = 2cos(π/5) = 1.618…` (equality on the left); `K₄`: `θ₁ = 3`.
- `K_{1,3}`: `θ₁ = √3 = √(n-1)`; `P₄` is a tree with `1.618… < √3`.
- Spanning subgraphs: `P₃ ⊃ K₂ ⊕g K₁` with `χ_H - χ_G = (X³ - X) - (X³ - 2X) = X`, positive
  from `θ₁ = √2` on; `K₃ ⊃ P₃` with difference `X + 2`. Negative control: `2K₂ ⊃ K₂ ⊕g 2K₁`
  with `θ₁ = 1`, where both polynomials vanish at `x = 1`; strictness needs connectivity.
  Negative control: at `x = -1 < θ₁(P₃)`, `χ_{K₂ ⊕g K₁}(-1) = 0 < 1 = χ_{P₃}(-1)`; hence
  `x ≥ θ₁(G)`.
- Grafting with `G = K₂`: `G(1, 1) = K_{1,3}` with `θ₁ = √3 = 1.732…` and `G(2, 0) = P₄` with
  `θ₁ = 1.618…`. Negative control: with `G = K₁`, `G(1, 1)` and `G(2, 0)` are both `P₃`, with
  the same `θ₁ = √2`; hence at least two vertices.
- The trees on `5` vertices: `P₅` with `θ₁ = √3 = 2cos(π/6)` (equality), the tree with degrees
  `3, 2, 1, 1, 1` with `θ₁ = √(2 + √2) = 1.848…`, and `K_{1,4}` with `θ₁ = 2`. Negative control:
  the forest `2K₂ ⊕g K₁` on `5` vertices has `θ₁ = 1 < √3`; hence a tree.
- Negative control: `K₃ ⊕g K₁` contains `K₃` missing a vertex with the same index `2`;
  strictness needs connectivity of `G`.

*Needs:* 1.2 (the derivative and the pendant vertex), 1.7, 2.6 (the path), 3.2, 3.5 (Hong's
bound); SpectralGraphBounds 1.1–1.3; Mathlib `SimpleGraph.Copy`, `IsTree`.

### 3.5 Index, edges and cliques

With `m` edges and clique number `ω = G.cliqueNum`, on a nonempty vertex type:
- **Motzkin–Straus** (`dotProduct_mulVec_adjMatrix_le_cliqueNum`). Every nonnegative `v` has
  `vᵀAv = ∑_{xy∈E} 2v_xv_y ≤ (1 - 1/ω)(∑v_x)²`, and the maximum of `vᵀAv` over the simplex
  `v ≥ 0`, `∑v_x = 1` is `1 - 1/ω` [CRS, Lemma 3.10.4, p. 89].
- **Stanley** (`largestEigenvalue_le_stanley`). `θ₁ ≤ (√(8m+1) - 1)/2`, with equality if and only
  if `G` is a complete graph on some set of vertices together with isolated vertices [CRS, Remark
  8.1.27, p. 241; St, Corollary 2.21, p. 45].
- **Hong** (`Connected.largestEigenvalue_le_hong`). If `G` is connected, `θ₁ ≤ √(2m - n + 1)`,
  with equality if and only if `G` is `K_{1,n-1}` or `Kₙ` [CRS, Theorem 8.1.26, p. 241;
  St, Corollary 2.22, p. 45].
- **Wilf and Nikiforov** (`largestEigenvalue_le_cliqueNum`). `θ₁ ≤ (1 - 1/ω)n` [St, Corollary
  2.6, p. 32] and `θ₁² ≤ 2(1 - 1/ω)m` [CRS, Theorem 3.10.5, p. 90].
- **Nosal** (`CliqueFree.largestEigenvalue_le_sqrt`). A triangle-free graph has `θ₁ ≤ √m`
  [St, Theorem 2.38, p. 55].
- **Hofmeister** (`sqrt_sum_sq_degree_le_largestEigenvalue`). `θ₁ ≥ √(∑_x d(x)²/n)`
  [St, (2.4), pp. 31–32; CRS, Theorem 8.1.25, p. 240].

**Suggested proof:** for Motzkin–Straus, the uniform vector on a largest clique attains `1 - 1/ω`;
for the upper bound, induct on `n`: a maximizer on the face `v_x = 0` is one for `G - x`, and a
maximizer with all entries positive has equal partial derivatives (Lagrange), so for non-adjacent
`x, y` the mass of `v_x` can be moved to `y` without changing `vᵀAv`, reaching that face, while for
complete `G` Cauchy–Schwarz gives `(∑v_x)² - ∑v_x² ≤ (1 - 1/n)(∑v_x)²` [CRS, proof of Lemma 3.10.4,
p. 89]. The other bounds are Rayleigh-quotient arguments with a unit eigenvector `v` for `θ₁`, which
can be taken nonnegative. Stanley and Hong bound `θ₁²v_x² = ((Av)_x)²` by Cauchy–Schwarz over the
neighbourhood of `x` and sum over `x`, using `∑θᵢ² = 2m` (SpectralGraphBounds 1.1); Wilf and
Nikiforov apply Motzkin–Straus to `v`, with `(∑v_x)² ≤ n`, and to the vector `(v_x²)`, after
Cauchy–Schwarz over the `2m` ordered adjacent pairs,
`θ₁² = (∑_{xy∈E} 2v_xv_y)² ≤ 2m ∑_{xy∈E} 2v_x²v_y²`; Nosal bounds `θ₁²v_x = ∑_{y∼x}∑_{z∼y} v_z`
using that the neighbourhood of `x` is independent; Hofmeister is the Rayleigh quotient of `A²` at
`𝟙`, `𝟙ᵀA²𝟙 = ∑ d(x)²`.

**Checks.**
- Motzkin–Straus on `C₅` (`ω = 2`): the uniform vector gives `vᵀAv = 10/25 = 0.4 ≤ 1/2`, and
  `v = (1/2, 1/2, 0, 0, 0)` on an edge gives `1/2`, the maximum. On `K₃`, `v = 𝟙/3` gives
  `2/3 = 1 - 1/3`. Negative control: on `K₂ ⊕g K₁`, `v = (1, 1, -2)` has `vᵀAv = 2` and
  `(1 - 1/2)(∑v_x)² = 0`; hence `v ≥ 0`.
- `K₄`: `m = 6`, `(√49 - 1)/2 = 3 = θ₁` (Stanley equality); Hong `√(12 - 4 + 1) = 3` (equality).
- `K_{1,3}`: Hong `√(6 - 4 + 1) = √3 = θ₁` (equality); Stanley `(√25 - 1)/2 = 2 > √3`.
- `C₅`: `ω = 2`, Wilf `(1/2)·5 = 2.5 ≥ 2`; Nosal `√5 ≥ 2`.
- `K₃`: Nikiforov `4 ≤ 2·(2/3)·3 = 4` (equality).
- Negative control: `C₄ ⊕g K₁` is disconnected with `θ₁ = 2`, `m = 4`, `n = 5`, and
  `√(2m - n + 1) = 2`: Hong's equality holds although `G` is neither `K_{1,4}` nor `K₅`;
  connectivity is needed for the equality case.
- Negative control: Nosal fails for `K₃`, with `θ₁ = 2 > √3`; hence triangle-freeness.

*Needs:* 1.2, 3.2; SpectralGraphBounds 1.1; Mathlib `SimpleGraph.cliqueNum`, `CliqueFree`.

### 3.6 Regularity

- **Hoffman's criterion** (`Connected.isRegular_iff_exists_aeval_eq_of_one`). A connected graph is
  regular if and only if the all-ones matrix `J` is a polynomial in `A` [BH, Proposition 3.3.2,
  p. 38; B, Proposition 3.2, p. 15].
- **The Hoffman polynomial** (`Connected.ones_eq_aeval_hoffmanPolynomial`). For a connected
  `k`-regular graph, `J = n ∏_{θ ≠ k} (A - θI)/(k - θ)` over the distinct eigenvalues other than
  `k` [B, Corollary 3.3, p. 15].

Regularity through `A𝟙 = k𝟙` is 1.4, and through `nθ₁ = 2m` (equivalently `∑θᵢ² = nθ₁`) is
SpectralGraphBounds 1.2.

**Suggested proof:** `J` commutes with `A` if and only if `G` is regular; for connected regular
`G`, `𝟙` spans the `k`-eigenspace (3.2), and the Lagrange polynomial at `k` maps `A` to the
projection `n⁻¹J`. Both sides of the Hoffman polynomial agree on `𝟙` and on each eigenvector for
`θ ≠ k`.

**Checks.**
- `K₃`: `J = A + I`, and the product formula gives `3(A + I)/3`.
- `C₄`: distinct eigenvalues `2, 0, -2`, so `J = 4·A(A + 2I)/(2·4) = A(A + 2I)/2`; on `𝟙` both
  sides give `4·𝟙`.
- Negative control: `2K₂` is regular and disconnected, and `J` is not a polynomial in `A`, since
  every polynomial in `A` vanishes between the two components; hence connectivity.

*Needs:* 1.4, 3.2.

### 3.7 Bipartiteness of regular graphs

- **Regular graphs** (`Connected.isBipartite_iff_smallestEigenvalue_eq`). A connected `k`-regular
  graph is bipartite if and only if `θₙ = -k` [CRS, Theorem 3.2.4, p. 56; BH, Proposition 3.4.1,
  p. 38].

**Suggested proof:** PeriodicNonnegativeMatrices 3.2 with the Perron pair `(k, 𝟙)`: `G` is
bipartite if and only if `-k` is an eigenvalue; since `|θᵢ| ≤ θ₁ = k` (SpectralGraphBounds 1.3,
3.2), `-k` is an eigenvalue exactly when `θₙ = -k`.

**Checks.**
- `C₄`: `θ₄ = -2`, bipartite. `C₅`: `θ₅ = -1.618…`, not bipartite.
- Negative control: `C₄ ⊕g K₃` is 2-regular with `θₙ = -2` and contains a triangle; connectivity
  is needed.

*Needs:* 3.2; PeriodicNonnegativeMatrices 3.2; SpectralGraphBounds 1.3.

### 3.8 The complement

- **Laplacian of the complement** (`lapMatrix_compl`). Over any commutative ring,
  `L(Ḡ) = nI - J - L(G)` [BH, §1.3.2, p. 4]. The Laplacian spectrum of `Ḡ` is
  LaplacianEigenvaluesOfGraphs 2.1.
- **Regular graphs** (`IsRegularOfDegree.adjSpectrum_compl`). If `G` is `k`-regular on a nonempty
  vertex type, the adjacency spectrum of `Ḡ` is `n - k - 1` together with `-1 - θ` for the
  spectrum of `G` with one copy of `k` removed [BH, §1.3.2, p. 4; B, 3a, p. 20].

**Suggested proof:** Mathlib's `SimpleGraph.compl_adjMatrix_eq_adjMatrix_compl` with degrees
`n - 1 - d(x)`, and `SimpleGraph.lapMatrix_top`. For the regular case, `A(Ḡ) = J - I - A` and `J`
is a rank-one perturbation along the eigenvector `𝟙` of `A`: removing the eigenvalue `k` of `A`
and inserting `n - 1 - k`; the other eigenvectors can be chosen orthogonal to `𝟙`.

**Checks.**
- `P₃`: `L(Ḡ) = 3I - J - L(P₃)`, the Laplacian of `K₂ ⊕g K₁`.
- `Kₙ`: `Ḡ = ⊥` with spectrum `0ⁿ`; from the regular formula `n - (n-1) - 1 = 0` and
  `-1 - (-1) = 0`.
- Petersen as `(J(5,2))ᶜ` (2.4, 2.6): `J(5,2)` is 6-regular with spectrum `6, 1⁴, (-2)⁵`, so the
  Petersen graph has `3`, `-2` four times and `1` five times: `3, 1⁵, (-2)⁴`.
- Negative control: for the non-regular `P₃`, `Ḡ = K₂ ⊕g K₁` has adjacency spectrum `1, 0, -1`,
  while the formula with the maximum degree `2` gives `0, -1 + √2 = 0.41…, -1 - 0`; the adjacency
  formula needs regularity.

*Needs:* 1.2, 3.2.

### 3.9 Main eigenvalues

The definitions are `adjEigenspace θ`, the `θ`-eigenspace in `EuclideanSpace ℝ V`; `onesVec`;
`IsMainEigenvalue θ` (the eigenspace is not orthogonal to `𝟙`); `mainAngle θ = ‖P_θ𝟙‖/√n` with
`P_θ` the orthogonal projection (Mathlib's `Submodule.starProjection`);
`adjEigenspaceProjection θ`, the matrix `∑ vᵢvᵢᵀ` over the vectors `vᵢ` of Mathlib's orthonormal
eigenvector basis with eigenvalue `θ`; and `walkCount h = 𝟙ᵀAʰ𝟙`, counted as walks.
- **The eigenspace projection** (`toEuclideanLin_adjEigenspaceProjection`).
  `adjEigenspaceProjection θ` is the matrix of `P_θ`; in particular it does not depend on the
  choice of eigenvector basis.
- **Walk counts** (`walkCount_eq_sum_mainAngle`). `N_h = n ∑_θ β_θ² θʰ` over the distinct
  eigenvalues; only main eigenvalues contribute [CRS, Theorem 1.3.5, p. 15].
- **Counting main eigenvalues** (`card_mainEigenvalue`). On a nonempty vertex type, `G` is regular
  if and only if it has exactly one main eigenvalue, and the number of main eigenvalues is at most
  the number of orbits of the automorphism group [CRS, Corollaries 3.9.10 and 3.9.12,
  pp. 86–87].

**Suggested proof:** the eigenvectors of eigenvalue `θ` in the orthonormal basis span the
eigenspace, so `∑ vᵢvᵢᵀ` is the orthogonal projection onto it. Expand `𝟙` in an eigenbasis for
the walk counts. A single main eigenvalue `θ` puts `𝟙` in its eigenspace, so `A𝟙 = θ𝟙` and `G` is
regular (1.4); conversely `𝟙` is an eigenvector of a regular graph. For orbits, an
automorphism commutes with `A`, hence with every `P_θ`, and fixes `𝟙`, so the main eigenvectors
`P_θ𝟙` are fixed by every automorphism and constant on orbits; distinct eigenvalues
give orthogonal, hence independent, vectors in the space of orbit-constant vectors.

**Checks.**
- `K_{1,3}`: main eigenvalues `±√3` (two), not `0`; two orbits; not regular.
- `K₁`: `N_h = [h = 0]`, and the formula gives `1·1²·0ʰ`, which is `1` at `h = 0` and `0`
  after.
- `C₄`: one main eigenvalue `2`, `β = 1`; `N_h = 4·2ʰ`.
- Negative control: `P₃` has main eigenvalues `±√2`, two of them, and is not regular; the main
  angle of `0` is `0`, since its eigenvector `(1, 0, -1)` is orthogonal to `𝟙`.

*Needs:* 1.2, 1.4; Mathlib `Submodule.starProjection`.

## Downstream consumers

Later roadmaps of algebraic and spectral graph theory cite this one by section:
- Laplacian spectra and spanning trees: the quadratic forms, edge decompositions and incidence
  of 1.1 and 2.5, the enumerations of 1.2, the variational formula of 1.5, the components of
  1.7, the path of 2.2 and the degree bounds of 3.3.
- Characteristic polynomials, graph operations and star complements: the integer characteristic
  polynomial, its derivative and the pendant-vertex recursion of 1.2, disjoint unions of 1.7,
  Hamming graphs of 2.3, the multiset spectra of 2.6, the complement of 3.8 and main angles of 3.9.
- Distance-regular graphs, codes and polygons, and strongly regular graphs and designs: the
  Hamming, Johnson and Kneser graphs of 2.3–2.4 and their spectra in 2.6.
- Graph symmetry and Cayley graphs: the eigenspace projections and orbit bound of 3.9.
- Cocliques, colourings and theta: the Kneser and Petersen graphs of 2.4 and the index bounds of
  Layer 3.
- Line systems and switching: the spectra of 1.7 and 2.6 and the monotonicity of 3.4.
- Expander graphs: the Perron–Frobenius theory of 3.2 and the index bounds of 3.3–3.5.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every target above. `Suggested.lean` states the
headlines that carry a Lean name, each with every conclusion the README attaches to it; it is not
an exhaustive acceptance test, and the other headlines are targets of the same standing, stated
in prose.

Owned here:
- the vocabulary of Layer 1 and its basic API: the signless Laplacian and its enumeration, the
  three spectra, the edge matrices and the unsigned incidence matrix, with `UUᵀ = Q`,
  `UᵀU = 2I + A(L(G))`, the kernel and nullity of `Q`, and sign conjugation;
- the derivative of the characteristic polynomial of a square matrix, the pendant-vertex
  recursion and the sparse expansion of a determinant (1.2), and the comparison of the
  characteristic polynomials of a graph and a spanning subgraph beyond the index (3.4);
- the variational formula for the algebraic connectivity;
- irreducibility of the adjacency matrix of a connected graph and Perron–Frobenius for connected
  graphs;
- the multiset spectrum of a decomposition into complete orthogonal idempotents (1.8);
- the Hamming, Johnson and Petersen graphs and the basic API of these and of the Kneser graph,
  the degrees of complete multipartite graphs, the Laplacian spectrum of the path and line
  graphs;
- the multiset spectra, with multiplicities, of complete, complete bipartite and complete
  equipartite graphs, cycles, paths, Hamming graphs and hypercubes, Johnson, Kneser and Petersen
  graphs (2.6);
- the distinct-eigenvalue theorems, the degree, monotonicity, extreme and clique bounds on the
  index, Hoffman's polynomial, the regular bipartiteness criterion, the adjacency spectrum of the
  complement of a regular graph, the eigenspace projections, main angles, walk counts and the
  number of main eigenvalues.

Consumed, not restated (see the supplier contracts for the hypotheses):
- RandomMatrices 1.2: min–max and max–min for `eigenvalues₀`.
- SpectralGraphBounds 1.1–1.4: the sorted adjacency eigenvalues `adjEigenvalues` with
  `largestEigenvalue` and `smallestEigenvalue` (the adjacency vocabulary here), `∑θᵢ = 0`,
  `∑θᵢ² = 2m`, the edgeless case, Rayleigh bounds, induced interlacing, `2m ≤ nθ₁` with its
  equality case, `θ₁ ≤ k_max`, `|θᵢ| ≤ θ₁`, edge monotonicity of `θ₁`, the multiplicity of `k` in
  a regular graph.
- LaplacianEigenvaluesOfGraphs 1.1, 1.2 and 2.1: the sorted Laplacian eigenvalues
  `lapEigenvalues` and `algebraicConnectivity` (the Laplacian vocabulary here), their signs and
  the zero eigenvalue, the component count and "connected iff the algebraic connectivity is
  positive", the Laplacian spectrum of the complement.
- PeriodicNonnegativeMatrices 3.2 and 3.3: the bipartiteness criteria.
- QuasirandomGraphs 4.1: `∑θᵢᵏ` as a count of homomorphisms from the `k`-cycle.
- TopologicalCombinatorics 3.1: the Kneser graph, `K(n, 1) ≅ Kₙ` and its regularity.
- AssociationSchemes 5.1: the eigenvalues and primitive idempotents of the Johnson scheme, from
  which 2.6 derives the multiset spectra of the Johnson and Kneser graphs.

The boundary with SpectralQuantumWalks, Layers 1 and 7, is this: it owns the spectral projectors
of Hermitian matrices and the eigenvalues and spectral projectors of the standard families, and
2.6 here owns the multiset spectra with their multiplicities, derived through 1.8 from explicit
eigenvectors; 2.6 does not use its statements.

Not owned here, and owned by later roadmaps: the coefficients of the characteristic polynomial and
the vertex-deletion identities beyond those of 1.2 and 3.4, divisibility of characteristic
polynomials by equitable quotients, spectra of graph products and joins, energy and star
complements; the matrix-tree theorems, the oriented incidence matrix and further results on
`ν_{n-1}` and `ν₁`; cospectrality, generalized line graphs and root systems; vertex- and
edge-transitivity and Cayley graphs of nonabelian groups; expansion; cores, fractional and vector
colourings. Owned by other open roadmaps and not used here: equitable partitions and their quotient
matrices (EquitableOperatorReduction), the spectra of strongly regular graphs
(StronglyRegularAndMooreGraphs), the Hamming scheme (DelsarteTheoryOfCodesAndDesigns), the signed
adjacency matrix and the matching polynomial (MatchingPolynomial, 2.1 for the signed adjacency
matrix), effective resistance and random walks (ElectricalNetworksAndRandomWalks), the Seidel matrix
and switching (EquiangularLinesAndTwoGraphs), colourings (GraphColouring), the theta function
(LovaszThetaFunction) and the Tutte polynomial (TuttePolynomialAndArrangements).

Boundary in one sentence: a statement about the spectrum of `A`, `L` or `Q` of a general finite
simple graph, or of a graph defined here, is here unless one of the roadmaps listed above states
it.

## Exact supplier contracts

### From Mathlib

Mathlib has no spectral statement about a `SimpleGraph` beyond the eigenvalue `k` of a
`k`-regular graph (`SimpleGraph.IsRegularOfDegree.mem_spectrum_adjMatrix`); it supplies the
matrices and general matrix theory:
- graph matrices: `adjMatrix`, `degMatrix`, `lapMatrix`, `incMatrix`, with
  `SimpleGraph.incMatrix_mul_transpose` (the entries of `UUᵀ`, columns indexed by `Sym2 V`),
  `SimpleGraph.lapMatrix_toLinearMap₂'` (the Laplacian quadratic form over a field of
  characteristic zero), `SimpleGraph.posSemidef_lapMatrix`,
  `SimpleGraph.adjMatrix_mulVec_const_apply`, `SimpleGraph.compl_adjMatrix_eq_adjMatrix_compl`,
  `SimpleGraph.lapMatrix_top`, `SimpleGraph.Iso.reindex_adjMatrix`, walk counting by powers of
  `A` (`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`),
  `SimpleGraph.sum_degrees_eq_twice_card_edges`; used in Layers 1–3;
- graph constructions: `SimpleGraph.boxProd`, `SimpleGraph.lineGraph`, `SimpleGraph.sum`,
  `completeMultipartiteGraph`, `SimpleGraph.completeEquipartiteGraph` with
  `SimpleGraph.degree_completeEquipartiteGraph`, `hammingDist`, `SimpleGraph.Copy`,
  `SimpleGraph.diam`, `SimpleGraph.cliqueNum`; used in Layers 2–3;
- spectral theory: `Matrix.IsHermitian.eigenvalues₀` (decreasing,
  `Matrix.IsHermitian.eigenvalues₀_antitone`), `Matrix.IsHermitian.charpoly_eq`,
  `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues₀`, `eigenvalue_mem_ball` (Gershgorin),
  `Matrix.isIrreducible_iff_exists_pow_pos`; used in 1.2, 1.4, 1.6, 1.8;
- idempotents: `CompleteOrthogonalIdempotents` (each member idempotent, distinct members with
  product `0`, sum `1`), `Matrix.rank`, `Matrix.trace`; used in 1.8;
- characteristic polynomials and blocks: `Matrix.charpoly_map`, `Matrix.charpoly_reindex`,
  `Matrix.charpoly_fromBlocks_zero₁₂`, `Matrix.charpoly_mul_comm'`, `Matrix.fromBlocks`,
  `Equiv.sumCongr`; used in 1.2, 1.7, 2.5;
- determinants and vertex deletion: `Matrix.det_apply'` (the Leibniz expansion),
  `Polynomial.derivative_prod_finset`, `Matrix.twoBlockTriangular_det`,
  `Matrix.det_succ_row_zero`, `Matrix.det_succ_column_zero`, `SimpleGraph.induce`,
  `SimpleGraph.Embedding.submatrix_adjMatrix`; used in 1.2 and 3.4;
- `Submodule.starProjection` (the orthogonal projection onto a subspace); used in 3.9.

### From Tau Ceti

Tau Ceti has no statement about graph spectra; it supplies general matrix theory:
- `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`: `tr Aʰ = ∑ λᵢʰ` for Hermitian `A`; used
  in 1.3.
- `Matrix.PosSemidef.eigenvalues₀_nonneg`: the eigenvalues of a positive semidefinite matrix are
  nonnegative; used in 1.2.
- Courant–Fischer for a symmetric operator on a finite-dimensional inner product space,
  `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`, stated with unit vectors and
  `re ⟪T x, x⟫`; RandomMatrices 1.2 transfers it to `eigenvalues₀`. Used in 1.5.
- Perron–Frobenius for irreducible nonnegative matrices:
  `Matrix.IsIrreducible.exists_mulVec_eq_smul` (a positive eigenvector for the spectral radius),
  `Matrix.IsIrreducible.rootMultiplicity_charpoly_eq_one` (the Perron root is simple),
  `Matrix.IsIrreducible.exists_pos_eq_smul_of_mulVec_eq_smul`, and
  `Matrix.spectralRadius_eq_of_mulVec_eq_smul`; used in 3.2.

### From RandomMatrices

[RandomMatrices](../RandomMatrices/README.md) 1.2: the min–max and max–min formulas for
`Matrix.IsHermitian.eigenvalues₀` of a Hermitian matrix, transferred from Tau Ceti's
Courant–Fischer under `Matrix.toEuclideanLin`. Used in 1.5, at `G.lapMatrix ℝ` and the index
`n - 2`.

### From SpectralGraphBounds

The roadmap SpectralGraphBounds, whose sorted adjacency eigenvalues `adjEigenvalues` (Mathlib's
`eigenvalues₀` of `G.adjMatrix ℝ`, index `0` the largest) and whose `largestEigenvalue` and
`smallestEigenvalue` (1.1) are copied verbatim in `Suggested.lean` and are the adjacency
enumeration of this roadmap, on a nonempty vertex type where stated:
- 1.1: the three definitions, used in every layer; `∑θᵢ = 0`, `∑θᵢ² = 2m`; all eigenvalues are
  `0` iff `G` has no edge; the Rayleigh bounds `θₙ‖x‖² ≤ xᵀAx ≤ θ₁‖x‖²` with equality only at
  eigenvectors; induced interlacing. Cited in 1.3; used in 3.1, 3.4, 3.5.
- 1.2: `2m ≤ nθ₁`, with equality iff `G` is regular; `θ₁ ≤ k_max`. Used in 3.2, 3.3, 3.6.
- 1.3: `|θᵢ| ≤ θ₁`; `θ₁(H) ≤ θ₁(G)` for `H ≤ G` on one vertex type. Used in 3.4, 3.7.
- 1.4: in a `k`-regular graph the multiplicity of the eigenvalue `k` is the number of
  components. Cited in the introduction to Layer 3; not a dependency.

### From LaplacianEigenvaluesOfGraphs

The roadmap LaplacianEigenvaluesOfGraphs, with its decreasing enumeration of the eigenvalues of
`G.lapMatrix ℝ` and its algebraic connectivity, the value at index `n - 2` (`0` for `n ≤ 1`),
both copied verbatim in `Suggested.lean` and the Laplacian enumeration of this roadmap:
- 1.1: the enumeration is nonnegative and its value at index `n - 1` is `0` on a nonempty vertex
  type. Used in 1.2.
- 1.2: the number of indices with eigenvalue `0` is the number of components; for `n ≥ 2`, the
  algebraic connectivity is positive iff `G` is connected. Cited in 1.5; not a dependency.
- 2.1: for `i + j + 2 = n`, the eigenvalue of `Gᶜ` at index `i` is `n` minus that of `G` at index
  `j`. Used in 3.8.
- 4.1, the Anderson–Morley bound: a graph with an edge has an edge `xy` with
  `ν₁ ≤ d(x) + d(y)`. Cited in 1.4; not a dependency.

### From PeriodicNonnegativeMatrices

The roadmap PeriodicNonnegativeMatrices, for `G : SimpleGraph V` with Mathlib's instances:
- 3.2, the spectral criterion: for connected `G`, a positive `x` and `Ax = r x`, `G` is
  bipartite iff `-r ∈ spectrum ℝ (G.adjMatrix ℝ)`. Used in 3.7 with `(r, x) = (k, 𝟙)`.
- 3.3, the symmetric-spectrum criterion: `G` is bipartite iff every `μ` and `-μ` have the same
  root multiplicity in the characteristic polynomial of `G.adjMatrix ℝ`. Cited in the
  introduction to Layer 3; not a dependency.

### From AssociationSchemes

The roadmap AssociationSchemes, 5.1 (the eigenmatrix of the Johnson scheme), for `2k ≤ n`: the
Johnson scheme on the `k`-subsets of `Fin n`, with class `k - |A ∩ B|`, has primitive idempotents
`E_0, …, E_k` (complete orthogonal idempotents in its Bose–Mesner algebra, 1.2 there) with the
Eberlein value `∑_{h ≤ i} (-1)^h C(j, h) C(k - j, i - h) C(n - k - j, i - h)` as eigenvalue
of class `i` on `E_j`, and `tr(E_0 + ⋯ + E_j) = C(n, j)`. Class `1` is the Johnson graph and
class `k` the Kneser graph on `Fin n`; a general `α` with `n` elements is reached through an
equivalence `α ≃ Fin n` and 1.7. Used in 2.6.

### From TopologicalCombinatorics

The roadmap TopologicalCombinatorics, 3.1: its Kneser graph on `{s : Finset α | s.card = k}`
(copied verbatim in `Suggested.lean`), `K(n, 1) ≅ Kₙ`, and regularity of degree `C(n-k, k)` for
`k ≥ 1`. Used in 2.4 and 2.6.

### From QuasirandomGraphs

The roadmap QuasirandomGraphs, 4.1: for `k ≥ 2`, the number of homomorphisms from the `k`-cycle to
`G` is `∑ θᵢᵏ`. Cited in 1.3; not a dependency of any target.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **The matrix-tree theorem and spanning trees.** `N = ν₁⋯ν_{n-1}/n` [BH, Proposition 1.3.4,
  p. 5]
  and the oriented incidence matrix: a roadmap on Laplacian spectra and spanning trees.
- **Cartesian and Kronecker products.** The spectrum of `G □ H` as sums and of `G ⊗ H` as
  products of eigenvalues [BH, §§1.4.6–1.4.7, p. 10] in multiset form, beyond the Hamming graphs
  of 2.6.
- **Line graphs of non-regular graphs.** The spectrum of `L(G)` from the positive signless
  Laplacian eigenvalues [BH, Proposition 1.4.1, p. 9] and the characterization of graphs with
  least eigenvalue `-2`: a roadmap on line systems.
- **Distance-regular graphs.** Equality in the diameter bound of 3.1 and the spectrum from the
  intersection array [BH, §12.2, p. 178].
- **Graphs with few eigenvalues.** Regular graphs with three or four distinct eigenvalues and
  graphs with three Laplacian eigenvalues [BH, Chapter 15, pp. 221–224].

## References

- [B] N. Biggs, *Algebraic Graph Theory*, 2nd ed., Cambridge Mathematical Library, Cambridge
  University Press, 1993: Lemma 2.5, Corollary 2.7, pp. 9–10; Additional results 2a, 2d,
  p. 11; Additional results 2h, 2j,
  pp. 12–13; Proposition 3.2 and Corollary 3.3, p. 15; Theorem 3.8, p. 19; Additional result 3a,
  p. 20.
- [Ba] R. B. Bapat, *Graphs and Matrices*, 2nd ed., Universitext, Springer, 2014: introduction to
  Chapter 7, p. 87; Lemma 7.7, p. 93.
- [BH] A. E. Brouwer, W. H. Haemers, *Spectra of Graphs*, Universitext, Springer, 2012:
  §§1.1–1.4, 1.7, pp. 1–13; Theorem 2.2.1, p. 22; §§3.1–3.4, pp. 33–38; Proposition 3.9.1 and
  Corollary 3.9.2, pp. 50–51;
  §§12.2–12.4.2, pp. 178–179; Chapter 15, pp. 221–224.
- [CRS] D. Cvetković, P. Rowlinson, S. Simić, *An Introduction to the Theory of Graph Spectra*, LMS
  Student Texts 75, Cambridge University Press, 2010: §1.3, Theorems 1.3.5–1.3.6, pp. 15–17; Theorem
  2.2.1, p. 30; Theorem 2.3.1, p. 35; §2.6, p. 47; Theorems 3.2.1, 3.2.4, pp. 55–56; §3.9,
  Corollaries 3.9.10, 3.9.12, pp. 86–87; Lemma 3.10.4, p. 89; Theorem 3.10.5, p. 90; Exercise 4.2,
  p. 133; Theorem 7.8.1, Corollary 7.8.2 and Proposition 7.8.4, p. 217; Theorem 8.1.17, Lemma
  8.1.19, Theorems 8.1.20, 8.1.25–8.1.26 and Remark 8.1.27, pp. 236–241.
- [St] Z. Stanić, *Inequalities for Graph Eigenvalues*, LMS Lecture Note Series 423, Cambridge
  University Press, 2015: Lemma 1.29, p. 20; (2.1), p. 28; (2.4) and Corollary 2.6, pp. 31–32;
  Corollaries 2.21, 2.22, p. 45; (2.59), p. 53; Theorem 2.38, p. 55; Theorem 2.67, p. 71.

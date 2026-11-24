# Roadmap: characteristic polynomials and star complements

**Summary.** The characteristic polynomial `p_G(t) = det(tI - A)` of the adjacency matrix of a
finite simple graph is a generating function for its elementary subgraphs, the subgraphs whose
components are single edges and cycles; it obeys simple recurrences under the deletion of a
vertex, and it behaves predictably under graph operations and under passing to the complement.
The eigenspaces of `A` are equally structured: a suitable set of vertices, a star set, carries
each eigenspace as a graph over its coordinates, and the rest of the graph, the star complement,
controls the whole. This roadmap develops this structural part of the adjacency spectrum for
graphs on a finite vertex type, which may be empty.

The headline theorems are these.
- *Harary and Sachs.* The determinant of `A` is `(-1)^n` times the sum of `(-1)^{c(F)} 2^{z(F)}`
  over the spanning elementary subgraphs `F`, where `c(F)` counts their components and `z(F)`
  their cycles; the coefficient of `t^{n-j}` in `p_G` is the same sum over the elementary
  subgraphs on `j` vertices. For `n ≥ 3` the coefficients of `t^{n-1}`, `t^{n-2}` and `t^{n-3}`
  are `0`, minus the number of edges and minus twice the number of triangles.
- *Vertex deletion.* With the derivative `p_G' = Σ_v p_{G-v}` and the leaf recursion
  `p_G = t p_{G-v} - p_{G-u-v}` of GraphSpectra 1.2, an isolated vertex `v` gives
  `p_G = t p_{G-v}`.
- *Forests.* For a forest with matching number `ν`, the eigenvalue `0` has multiplicity `n - 2ν`,
  and `det A` is `(-1)^{n/2}` if the forest has a perfect matching and `0` otherwise.
- *Operations and complements.* The adjacency spectrum of the tensor product `G × H` is the
  multiset of products `θη`, and the Laplacian spectrum of the join of two nonempty graphs is read
  off those of the factors. The characteristic polynomial of the complement is determined by the
  spectrum and the main angles, and the generating function of the walk counts is a quotient of
  the characteristic polynomials of `G` and its complement.
- *Energy.* The energy `E = Σ|θᵢ|` satisfies `2√m ≤ E ≤ √(2mn)` and
  `E ≥ √(2m + n(n-1)|det A|^{2/n})`, and a rational energy is an even integer.
- *Tight interlacing and star complements.* If the eigenvalues of a compression `SᵀAS` with
  orthonormal columns interlace those of `A` tightly, then `AS = S(SᵀAS)`. Every eigenvalue `θ`
  has a star set `X`, with `|X|` the multiplicity of `θ` and `θ` not an eigenvalue of `G - X`;
  the graph is determined by its star complement and the edges leaving `X`, and for
  `θ ∉ {-1, 0}` a star complement with `t` vertices forces `n ≤ t(t+1)/2`, unless `θ = 1` and `G`
  is `K₂` or `2K₂` (Bell and Rowlinson).
- *Sensitivity.* Huang's signing of the hypercube `Q_d` squares to `dI` and has the eigenvalues
  `±√d`, each with multiplicity `2^{d-1}`; with Huang's theorem of DecisionTreeComplexity 5.1,
  every induced subgraph of `Q_d` on `2^{d-1} + 1` vertices has maximum degree at least `√d`.

The roadmap builds on GraphSpectra for the spectra as root multisets of characteristic
polynomials, disjoint unions, the hypercube, the spectral decomposition of 1.8 there,
Perron–Frobenius, main angles and walk counts. MatchingPolynomial supplies the matching polynomial
and the theorem that it is the characteristic polynomial exactly for forests, MatchingTheory the
matching number and TuttePolynomialAndArrangements the component count of an edge set.
GraphSpectra 1.2 supplies the derivative of the characteristic polynomial and the leaf recursion,
DecisionTreeComplexity Huang's theorem on induced subgraphs of the cube, and SpectralGraphBounds
the trace identities `Σθᵢ = 0` and `Σθᵢ² = 2m`.

## How to read the build
Layer 1 is the combinatorial calculus of the characteristic polynomial: elementary edge sets and
their component and cycle counts (1.1), Harary's determinant formula and Sachs's coefficient theorem
(1.2), and the isolated-vertex case of vertex deletion (1.3), which is independent of 1.1–1.2 and
adds to the vertex-deletion identities of GraphSpectra 1.2. Layer 2 proves the nullity of forests
from the lowest term of the matching polynomial and computes the determinant of a forest from
Harary's formula.

Layer 3 is independent of Layers 1 and 2 and rests on GraphSpectra, Layers 1 and 3: the spectra
of tensor products and joins (3.1), the characteristic polynomial of the complement through main
angles and the walk generating function (3.2), and energy (3.3).

Layer 4 is independent of Layers 1–3. It names the interlacing patterns (4.1), proves that tight
interlacing forces invariance of the compressed subspace (4.2), develops star sets and star
complements (4.3), and gives Huang's signing of the hypercube with its spectrum and the graph form
of Huang's theorem on induced subgraphs of the cube, which DecisionTreeComplexity 5.1 owns (4.4).

## Conventions

- **Graphs.** `G : SimpleGraph V` with `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`, and
  `n = Fintype.card V`, `m = #G.edgeFinset`. Every statement holds for the empty vertex type unless
  a hypothesis excludes it; the characteristic polynomial of the graph on the empty type is `1`,
  and so is its determinant.
- **Coefficients.** The characteristic polynomial is `(G.adjMatrix R).charpoly` over a commutative
  ring `R`, monic, and `a_j` denotes the coefficient of `t^{n-j}`; the statements of Layer 1 hold
  over every commutative ring, with the integers `(-1)^c 2^z` cast into `R`. The matching
  polynomial is in `ℤ[X]`. Roots are taken after `Polynomial.map (Int.castRingHom ℝ)`.
- **Spectra.** Spectral statements are over `ℝ`. `adjSpectrum` and `lapSpectrum` are the multisets
  of GraphSpectra, Layer 1, of cardinality `n`, built on the sorted eigenvalues `adjEigenvalues`
  of SpectralGraphBounds 1.1 and `lapEigenvalues` of LaplacianEigenvaluesOfGraphs 1.1, both
  nonincreasing with index `0` the largest; `Suggested.lean` carries verbatim copies of these
  definitions. Multiplicity is `Multiset.count`. Laplacian eigenvalues are written
  `ν₁ ≥ ⋯ ≥ νₙ = 0`, as in GraphSpectra and [CRS, §7.1, p. 184].
- **Vertex deletion.** `G - v` is `G.induce ({v}ᶜ : Set V)` and `G - u - v` is
  `G.induce ({u, v}ᶜ : Set V)`; for `X : Finset V`, `G - X` is `G.induce (↑Xᶜ : Set V)`.
- **Edge sets.** Spanning subgraphs are edge sets `F : Finset (Sym2 V)` with `F ⊆ G.edgeFinset`.
  The number of components `c(F)` of `(V, F)`, isolated vertices included, is
  `numComponents (F : Set (Sym2 V))`, the component count of TuttePolynomialAndArrangements 4.1,
  copied verbatim in `Suggested.lean`.
- **Matchings.** A matching is a subgraph `M : G.Subgraph` with Mathlib's `M.IsMatching`, as in
  MatchingPolynomial and MatchingTheory. The matching number `matchingNumber G` is valued in
  `ℕ∞` (MatchingTheory 1.1); on a finite vertex type it is finite, and identities that involve it
  are stated in `ℕ∞` as sums, without subtraction. `matchingCount`, `matchingPolynomial` and
  `matchingNumber` are verbatim copies of the owners' definitions.
- **Interlacing.** `Interlaces η θ` for `η : Fin m → ℝ`, `θ : Fin n → ℝ` (both nonincreasing)
  means `m ≤ n` and `θ_i ≥ η_i ≥ θ_{n-m+i}`; `IsTightInterlacing` adds a `k ≤ m` with `η_i = θ_i`
  for `i < k` and `η_i = θ_{n-m+i}` for `i ≥ k` (zero-based), as in [BH, §2.5, p. 26].
- **Graph operations.** The tensor product `tensorProd G H` (also called the Kronecker, direct or
  categorical product; `G ⊗ H` in [BH]) and the join `join G H` are defined here; `hypercube d`
  is GraphSpectra's `hammingGraph d Bool` (2.3 there).
- **Junk values.** Main angles divide by `√n`, which is `0` only for the empty type, where every
  sum is empty. `x ^ (2 / n)` in the energy bound is `Real.rpow`, applied to `|det A| ≥ 0`; on the
  empty type `2 / n = 0` and `det A = 1`, and the term `n(n-1)|det A|^{2/n}` is `0`. The
  inverse `(θI - C)⁻¹` of 4.3 is Mathlib's `Matrix.inv`, the zero matrix on a singular argument;
  every statement that uses it either assumes or concludes that `θ` is not an eigenvalue of `C`.

## Layer 1: the characteristic polynomial

### 1.1 Elementary edge sets

Definitions, for `F : Finset (Sym2 V)`:
- `edgeDegree F x`, the number of edges of `F` at `x`, and `edgeSupport F`, the vertices of
  positive degree.
- `IsElementary G F`: `F ⊆ E(G)`, every vertex has `F`-degree at most `2`, and both ends of an
  edge at a vertex of degree `1` have degree `1`. Equivalently, every nontrivial component of
  `(V, F)` is a single edge or a cycle [B, Definition 7.1, p. 44; CRS, p. 36]. A `Decidable`
  instance makes the sums of 1.2 `Finset` sums.
- `elemComponents F = c(F) - (n - #edgeSupport F)`, the number of nontrivial components, and
  `elemCycles F = elemComponents F - (#edgeSupport F - #F)`, the number of cycle components: a
  single-edge component has two vertices and one edge, and a cycle as many edges as vertices.

Targets:
- **Counting** (`IsElementary.card_le_card_edgeSupport`). For elementary `F` with support `S`:
  `#F ≤ #S ≤ 2#F`, and the number `#S - #F` of single-edge components is at most the number of
  nontrivial components.
- **Meaning of the counts.** For elementary `F`, `elemComponents F` is the number of components of
  `(V, F)` with an edge and `elemCycles F` the number of those that are cycles.

**Suggested proof:** each nontrivial component `K` has `|E(K)| = |V(K)| - 1` (a single edge) or
`|E(K)| = |V(K)|` (a cycle), since all degrees are `1` or `2` and the neighbour of a vertex of
degree `1` has degree `1`; sum over components.

**Checks.**
- `F = ∅`: `S = ∅`, `elemComponents = n - n = 0`, `elemCycles = 0`.
- A perfect matching of `C₄`: `#F = 2`, `#S = 4`, two components, no cycles.
- The triangle `K₃` as `F`: `#F = #S = 3`, one component, one cycle.
- Negative control: the path `P₃` as `F` is not elementary (its end has degree `1` and its middle
  vertex degree `2`); for it the formulas would give `1 - (3 - 2) = 0` cycles and one "single
  edge", which is wrong.

*Needs:* TuttePolynomialAndArrangements 4.1 (`numComponents`); Mathlib `SimpleGraph.fromEdgeSet`.

### 1.2 Harary's determinant formula and Sachs's coefficient theorem

- **Harary** (`det_adjMatrix`). `det A = (-1)^n ∑ (-1)^{c(F)} 2^{z(F)}` over the elementary `F`
  with `edgeSupport F = univ`, where `c(F)` and `z(F)` are `elemComponents F` and `elemCycles F`
  [CRS, Theorem 2.3.2, p. 36; B, Proposition 7.2, pp. 44–45, with `(-1)^{n - c(F)}`].
- **Sachs** (`coeff_charpoly_adjMatrix`). For `j ≤ n`, `a_j = ∑ (-1)^{c(F)} 2^{z(F)}` over the
  elementary `F` with `j` covered vertices [CRS, Corollary 2.3.3, p. 36; B, Proposition 7.3,
  pp. 45–46].
- **First coefficients** (`coeff_charpoly_adjMatrix_sub_one_two_three`). For `n ≥ 3`, `a₁ = 0`,
  `a₂ = -m` and `a₃ = -2t` with `t = #G.cliqueFinset 3` [B, Proposition 2.3, p. 8].
- **Small principal minors.** The principal minors of `A` of orders `1`, `2` and `3` are `0`;
  `-1` on an edge and `0` otherwise; `2` on a triangle and `0` otherwise.

**Suggested proof:** for Harary, expand by Leibniz (Mathlib's `Matrix.det_apply'`): a
permutation `π` contributes only if `x ~ π(x)` for all `x`; it is then fixed-point-free, its
cycles are edges (2-cycles) or graph cycles of length `≥ 3`, each graph cycle arising from two
permutations (its two orientations), and its sign is `(-1)^{n - c(F)}` [CRS, proof of Theorem
2.3.2, p. 36]. For Sachs, `Matrix.charpoly_coeff_eq_sum_minors` writes `a_j` as `(-1)^j` times
the sum of the `j × j` principal minors; the principal submatrix on a set `U` of vertices is the
adjacency matrix of `G.induce U` (Mathlib's `SimpleGraph.Embedding.submatrix_adjMatrix`), to which
Harary applies, and an elementary set on `j` vertices spans exactly one induced subgraph on `j`
vertices. The first coefficients need only the small principal minors, proved by reindexing the
minor to `Fin 1`, `Fin 2` and `Fin 3`.

**Checks.**
- `K₃`: `p = t³ - 3t - 2`; `a₂ = -3` (three edges), `a₃ = -2` (one triangle, `c = 1`, `z = 1`);
  `det A = 2 = (-1)³ · (-2)`.
- `C₄`: `p = t⁴ - 4t²`; `a₄` sums two perfect matchings (`+1` each, `c = 2`, `z = 0`) and the
  4-cycle (`-2`): `0`.
- `K₄`: `det A = -3`, from three perfect matchings (`+1` each) and three 4-cycles (`-2` each)
  [B, p. 45].
- `K₂`: `a₂ = -1`; `j = 0`: `a₀ = 1` from `F = ∅`.
- Negative control: `a₃ = -2t` needs `n ≥ 3`: for `K₂` the index `n - 3` truncates to `0`, and
  `a₂ = -1 ≠ -2 · 0`.

*Needs:* 1.1; Mathlib `Matrix.charpoly_coeff_eq_sum_minors`, `Matrix.det_apply'`,
`SimpleGraph.Embedding.submatrix_adjMatrix`, `SimpleGraph.cliqueFinset`.

### 1.3 Vertex deletion

The derivative of the characteristic polynomial of a square matrix over a commutative ring,
`χ_M' = ∑_v χ_{M[V∖v]}` [CRS, Theorem 2.3.1, p. 35], the pendant-vertex recursion
`p_G = t p_{G-v} - p_{G-u-v}` for a vertex `v` of degree `1` with neighbour `u` [B, Additional
result 2a, p. 11], and the sparse expansion of a determinant on its route are GraphSpectra 1.2.
For graphs the derivative reads `p_G' = ∑_v p_{G-v}`, since the principal submatrix at `V ∖ v`
is the adjacency matrix of `G - v` (`SimpleGraph.Embedding.submatrix_adjMatrix`); this is not a
separate target.

- **An isolated vertex** (`charpoly_adjMatrix_of_degree_eq_zero`). If `v` has degree `0`,
  `p_G = t p_{G-v}` over any commutative ring.

**Suggested proof:** the matrix `tI - A` is block triangular for the predicate `· = v`
(`Matrix.twoBlockTriangular_det`), with the block `t` at `v` and the block `tI - A(G - v)`.

**Checks.**
- `K₂ ⊕g K₁` at the isolated vertex: `t³ - t = t (t² - 1)`.
- `K₁`: `t = t · 1`, with the characteristic polynomial `1` of the empty graph.
- Negative control: the degree must be `0`; at a vertex of `K₂`, `t · t = t² ≠ t² - 1`.

*Needs:* GraphSpectra 1.2; Mathlib `Matrix.twoBlockTriangular_det`, `SimpleGraph.induce`.

## Layer 2: nullity and determinant of forests

### 2.1 The lowest term of the matching polynomial

- **Lowest term** (`natTrailingDegree_matchingPolynomial`). The least power of `t` occurring in
  the matching polynomial `μ(G)` (MatchingPolynomial 1.1) is `t^{n - 2ν}`, stated as
  `natTrailingDegree μ(G) + 2ν = n` in `ℕ∞`.

**Suggested proof:** the coefficient of `t^{n-2k}` is `(-1)^k m_k`; it is nonzero for `k = ν`,
because a maximum matching exists on a finite vertex type and its size is `ν`, and `m_k = 0` for
`k > ν`; `2ν ≤ n` (MatchingTheory 1.1).

**Checks.**
- `P₃`: `μ = t³ - 2t`, `ν = 1`, lowest term `t¹`.
- `C₄`: `μ = t⁴ - 4t² + 2`, `ν = 2`, lowest term `t⁰`.
- The empty vertex type: `μ = 1`, `ν = 0`.

*Needs:* MatchingPolynomial 1.1; MatchingTheory 1.1.

### 2.2 Forests

- **Nullity of a forest** (`IsAcyclic.count_zero_adjSpectrum`). For a forest, the multiplicity
  of `0` in `adjSpectrum` is `n - 2ν`, stated as `count 0 + 2ν = n` in `ℕ∞`.
- **Perfect matchings of a forest.** A forest has at most one perfect matching.
- **The determinant of a forest** (`IsAcyclic.det_adjMatrix`). For a forest,
  `det A = (-1)^{n/2}` if the forest has a perfect matching and `det A = 0` otherwise; in
  particular a tree has a nonsingular adjacency matrix if and only if it has a perfect matching
  [Ba, Lemma 3.32, p. 42].

**Suggested proof:** for the nullity, the characteristic polynomial of a forest is its matching
polynomial (MatchingPolynomial 2.2); the multiplicity of the root `0` is the trailing degree
(`Polynomial.rootMultiplicity_eq_natTrailingDegree'`), unchanged by the injective cast to `ℝ`
(`Polynomial.eq_rootMultiplicity_map`), and GraphSpectra 1.2 identifies the root multiset of the
cast integer characteristic polynomial with the adjacency spectrum; conclude by 2.1. Uniqueness of
a perfect matching: induction on `n`, matching a leaf to its neighbour, which every perfect
matching must do [Ba, proof of Lemma 3.32, p. 42]. For the determinant, the spanning elementary
sets of a forest in Harary's formula (1.2) have no cycles, so they are its perfect matchings, each
contributing `(-1)^n (-1)^{n/2}` with `n` even, and there is at most one.

**Checks.**
- `P₃`: `ν = 1`, spectrum `√2, 0, -√2`: `count 0 = 1 = 3 - 2`, `det A = 0`.
- `K_{1,3}`: `ν = 1`, `count 0 = 2 = 4 - 2`. `P₄`: `ν = 2`, `det A = 1 = (-1)²`. `K₂`:
  `det A = -1 = (-1)¹`.
- The empty vertex type: the empty subgraph is a perfect matching and `det A = 1 = (-1)⁰`.
- Negative control: `C₄` has `ν = 2` and `n - 2ν = 0`, but `0` is an eigenvalue of multiplicity
  `2`; the forest hypothesis is needed. `C₄` also has two perfect matchings and `det A = 0`.

*Needs:* 1.2, 2.1; MatchingPolynomial 2.2; MatchingTheory 1.1; GraphSpectra 1.2; Mathlib
`Polynomial.rootMultiplicity_eq_natTrailingDegree'`, `Polynomial.eq_rootMultiplicity_map`,
`SimpleGraph.IsAcyclic`, `SimpleGraph.IsTree`, `SimpleGraph.Subgraph.IsPerfectMatching`.

## Layer 3: graph operations, the complement and energy

The spectra of disjoint unions and of the complement of a regular graph are GraphSpectra 1.7 and
3.8, and main angles, main eigenvalues and walk counts are GraphSpectra 3.9. The adjacency matrix
of a Cartesian product is `A(G □ H) = A(G) ⊗ I + I ⊗ A(H)`, entrywise from the definition of
`SimpleGraph.boxProd` [BH, §1.4.6, p. 10]; GraphSpectra 2.6 uses it for the Hamming graphs, and
the multiset spectrum of a general Cartesian product is beyond this roadmap.

*Depends on:* GraphSpectra, Layer 1, 3.2 and 3.9, and 2.6 for the Checks; SpectralGraphBounds 1.1.

### 3.1 Tensor products and joins

- **The tensor product** (`tensorProd`, a `DecidableRel` instance, `degree_tensorProd`):
  `(x, y) ~ (x', y')` when `x ~ x'` and `y ~ y'`, by definition; degrees multiply. Its adjacency
  matrix over any commutative ring is `A_G ⊗ A_H` (`adjMatrix_tensorProd`, a sanity check of the
  definition) [BH, §1.4.7, p. 10].
- **Its spectrum** (`adjSpectrum_tensorProd`). The adjacency spectrum of `G × H` is the multiset
  of pairwise products [BH, §1.4.7, p. 10].
- **The join** (`join`, a `DecidableRel` instance, `lapSpectrum_join`). `G ∨ H` is `G ⊕g H` with
  all edges between the two sides. For `n₁, n₂ ≥ 1` its Laplacian spectrum is `0`, `n₁ + n₂`,
  `νᵢ(G) + n₂` for `i ≤ n₁ - 1` and `νⱼ(H) + n₁` for `j ≤ n₂ - 1`, that is, every Laplacian
  eigenvalue of each side but one `0`, shifted by the order of the other side [CRS, Theorem
  7.1.9, p. 188, where the printed formula lacks the factor `x` of the eigenvalue `0`].

The complete bipartite graph `K_{a,b}` is `join ⊥ ⊥` and `L(⊥) = 0`, so for `a, b ≥ 1` its
Laplacian spectrum is `0, a^{b-1}, b^{a-1}, a + b` [BH, §1.4.2, p. 8]; this is not a separate
target.

**Suggested proof:** for the tensor product, write `A_G = ∑ θᵢ Eᵢ` and `A_H = ∑ ηⱼ Fⱼ` with
complete orthogonal idempotents (the eigenspace projections of GraphSpectra 3.9). The Kronecker
products `Eᵢ ⊗ Fⱼ` are complete orthogonal idempotents with `A_G ⊗ A_H = ∑ θᵢηⱼ Eᵢ ⊗ Fⱼ`, and
their ranks, equal to their traces, are the products of ranks (`Matrix.trace_kronecker`);
GraphSpectra 1.8 gives the multiset. For the join, choose orthonormal eigenbases of `L_G` and
`L_H` that contain `𝟙/√n₁` and `𝟙/√n₂`. The other basis vectors, extended by `0`, are orthogonal
to `𝟙` on their side, and `L(G ∨ H) = L_G ⊕ L_H + [[n₂I, -J], [-J, n₁I]]` maps them to `ν + n₂`
and `ν + n₁` times themselves; `𝟙` and `n₂𝟙_V - n₁𝟙_W` complete the basis with eigenvalues `0`
and `n₁ + n₂`. GraphSpectra 1.8 (the matrix form, applied to the rank-one projections onto this
basis) gives the multiset.

**Checks.**
- `K₂ × K₂ = 2K₂`: products `1, -1, -1, 1`. `K₃ × K₂ = C₆`: `±2, ±1, ±1`, the cycle spectrum of
  GraphSpectra 2.6.
- `K₃ × K₂`: degrees `2 · 1 = 2`, so `C₆` is 2-regular.
- `K₁ ∨ K₁ = K₂`: `0, 2`. `K_{1,3}`: `0, 1, 1, 4`. `K_{2,3}`: `0, 2², 3, 5`.
- `P₃ ∨ K₂` (`ν(P₃) = 3, 1, 0`, `ν(K₂) = 2, 0`): `5, 5, 5, 3, 0`.
- Negative control: `lapSpectrum_join` needs both sides nonempty; for `n₂ = 0`, `G ∨ H = G` and
  the formula would list `n₁` as a Laplacian eigenvalue of an arbitrary `G`.

*Needs:* GraphSpectra 1.8, 3.9, and 2.6 for the Checks; LaplacianEigenvaluesOfGraphs 1.1; Mathlib
`Matrix.kronecker`, `Matrix.trace_kronecker`, `completeBipartiteGraph`, `SimpleGraph.sum`.

### 3.2 Main angles and the complement

With `β_θ = mainAngle θ` and `N_h = walkCount h` (GraphSpectra 3.9):
- **The complement** (`eval_charpoly_compl`). For real `t` with `t + 1 + θ ≠ 0` on the spectrum,
  `p_{Ḡ}(t) = (-1)ⁿ p_G(-t-1)(1 - n∑_θ β_θ²/(t+1+θ))`, the sum over the distinct eigenvalues; so
  the spectrum of `Ḡ` is determined by the spectrum and the main angles [CRS, Proposition 2.1.3,
  p. 25].
- **The walk generating function** (`hasSum_walkCount_mul_pow`). For real `t ≠ 0` with `|tθ| < 1`
  on the spectrum, `∑_h N_h tʰ = t⁻¹((-1)ⁿ p_{Ḡ}(-(t+1)/t)/p_G(1/t) - 1)` [CRS, (2.14), p. 29].

**Suggested proof:** for the complement, `A(Ḡ) = J - I - A` and the matrix determinant lemma
(Mathlib's `Matrix.det_add_replicateCol_mul_replicateRow`) with
`𝟙ᵀ((t + 1)I + A)⁻¹𝟙 = n∑β²/(t+1+θ)`, by expanding `𝟙` in the eigenspace projections as for the
walk counts of GraphSpectra 3.9. The generating function is `𝟙ᵀ(I - tA)⁻¹𝟙 = n∑β²/(1 - tθ)`,
a geometric series by `N_h = n∑β²θʰ` (GraphSpectra 3.9), rewritten with the complement formula
at `-(t+1)/t` [CRS, p. 28].

**Checks.**
- `K₁`: `N_h = [h = 0]`; the generating function is `1`, and the formula gives
  `t⁻¹((t + 1) - 1) = 1`.
- `C₄`: the only main eigenvalue is `2`, with `β = 1`, and
  `p_G(-t-1)(1 - 4/(t+3)) = (t+1)²(t-1)(t+3)·(t-1)/(t+3) = (t² - 1)²`, the characteristic
  polynomial of `Ḡ = 2K₂`.
- `P₃`, `t = 0.37`: `p_{Ḡ}(t) = t³ - t = -0.319…`; main angles `β² = (3 ± 2√2)/6` at `±√2`
  and `0` at `0`, and the right side is `-0.319…` as well.
- Negative control: with all eigenvalues weighted equally, `β² = 1/n`, the formula on `P₃` at
  `t = 0.37` gives `-3.799…`, not `-0.319…`; the main angles are needed.

*Needs:* GraphSpectra 1.2, 3.9; Mathlib `Matrix.det_add_replicateCol_mul_replicateRow`.

### 3.3 Energy

Definition: `energy G = ∑|θᵢ|`.
- **Bounds** (`energy_bounds`). `2√m ≤ E ≤ √(2mn)` and
  `E ≥ √(2m + n(n-1)|det A|^{2/n})` [BH, Exercise 3.10, p. 65; CRS, Proposition 9.2.2, p. 270, for
  `E ≤ √(2mn)`]. [St, Theorem 8.14, p. 244] prints `4m` in place of `2m` in the last bound, which
  fails on `K₂`.
- **Integrality** (`energy_eq_two_mul_of_rat`). If `E` is rational, it is an even integer
  [Ba, Theorem 3.27, p. 40].

**Suggested proof:** `∑θᵢ = 0` and `∑θᵢ² = 2m` (SpectralGraphBounds 1.1) give
`E² = ∑θᵢ² + ∑_{i≠j}|θᵢθⱼ| ≥ 2m + |∑_{i≠j}θᵢθⱼ| = 2m + |0 - 2m| = 4m`. The upper bound is
Cauchy–Schwarz (`Finset.sum_mul_sq_le_sq_mul_sq`): `E² ≤ n∑θᵢ² = 2mn`. For the determinant bound,
AM–GM (`Real.geom_mean_le_arith_mean_weighted`) on the `n(n-1)` terms `|θᵢθⱼ|`, `i ≠ j`, whose
product is `|det A|^{2(n-1)}` (`Matrix.IsHermitian.det_eq_prod_eigenvalues`); for `n ≤ 1` the
factor `n(n-1)` is `0` and the bound is `√(2m) ≤ 2√m ≤ E`. For integrality,
`E` is twice the sum of the positive eigenvalues; each is a root of the monic integer
characteristic polynomial (GraphSpectra 1.2), hence integral over `ℤ` (`IsIntegral`), so their
sum is (`IsIntegral.add`), and a rational number integral over `ℤ` is an integer
(`IsIntegrallyClosed.isIntegral_iff`).

**Checks.**
- `K₂`: `E = 2 = 2√1 = √(2·1·2)`. `K₃`: `E = 4`.
- `P₃`: `E = 2√2`, irrational.
- `K_{1,3}`: `E = 2√3 = 2√m` (equality), `√24 ≥ 2√3`.
- `C₄`: `E = 4 = 2√4`, `det A = 0`, and the determinant bound reads `√8 ≤ 4`.
- Negative control: the printed `√(4m + n(n-1)|det A|^{2/n})` fails on `K₂`: `√6 > 2`.
- The empty vertex type: `E = m = n = 0` and `det A = 1`; the bounds read `0 ≤ 0 ≤ √0` and
  `√(0 + 0 · (-1) · 1) = 0 ≤ 0`, with `2/0 = 0` in `ℝ`, so no hypothesis is needed.

*Needs:* GraphSpectra 1.2; SpectralGraphBounds 1.1.

## Layer 4: tight interlacing, star complements and sensitivity

Cauchy interlacing and the min–max form for `eigenvalues₀` are RandomMatrices 1.2, and
interlacing for induced subgraphs is SpectralGraphBounds 1.1; this layer adds the tight case for
compressions, star complements, and Huang's signing of the hypercube.

*Depends on:* GraphSpectra 1.2, 2.3 and 3.2; DecisionTreeComplexity 5.1; Tau Ceti
Courant–Fischer.

### 4.1 Interlacing predicates

- **Definitions** (`Interlaces`, `IsTightInterlacing`; Conventions). They name the conclusions of
  the interlacing theorems that the roadmaps cited above state as inequalities.

**Checks.**
- `{1, -1}` interlaces `{√2, 0, -√2}` (`P₂ ⊂ P₃`), and `{1, -1}` interlaces `{2, -1, -1}`
  (`K₂ ⊂ K₃`).
- The one-term list `{2}` interlaces `{2, -1, -1}` tightly (`k = 1`), and `{4/3}` interlaces
  `{√2, 0, -√2}` but not tightly.
- Negative control: `{0, 0}` does not interlace `{1, -1}`; with `m = n` interlacing forces
  equality.

### 4.2 Compressions and tight interlacing

- **Equality on an eigenvector span.** Let `T` be a symmetric operator on a finite-dimensional
  real inner product space, with an orthonormal eigenbasis, and let `x ≠ 0` lie in the span of
  basis vectors whose eigenvalues are at most `c`. If `⟪Tx, x⟫ = c‖x‖²`, then `Tx = cx`; likewise
  with "at least `c`".
- **Tight interlacing** (`Matrix.IsHermitian.mul_eq_of_isTightInterlacing`). If `S` has
  orthonormal columns (`SᵀS = I`) and the eigenvalues of `B = SᵀAS` interlace those of `A`
  tightly, then `AS = SB` [BH, Theorem 2.5.1 (iv), pp. 26–27].

**Suggested proof:** the equality statement follows from Tau Ceti's expansion
`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`: `c‖x‖² - ⟪Tx, x⟫` is a sum
of nonnegative terms `(c - λᵢ)|xᵢ|²`, which all vanish. For tight interlacing [BH, proof of
Theorem 2.5.1, p. 27], let `u₁, …` be orthonormal eigenvectors of `A` and `v₁, …, v_m` of `B`. For
`i ≤ k`, where `ηᵢ = θᵢ`, induct on `i`: the vector `Svᵢ` is orthogonal to `u₁, …, u_{i-1}`
(chosen among the eigenvectors `Sv₁, …, Sv_{i-1}` already found, completed to an eigenbasis), so
`θᵢ‖vᵢ‖² ≥ (Svᵢ)ᵀA(Svᵢ) = vᵢᵀBvᵢ = ηᵢ‖vᵢ‖²` with equality, and the equality statement makes `Svᵢ`
an `ηᵢ`-eigenvector of `A`. The indices `i > k`, where `ηᵢ = θ_{n-m+i}`, are the same argument
for `-A` and `-B`. Then `ASvᵢ = ηᵢSvᵢ = SBvᵢ` for every `i`, and the `vᵢ` form a basis.

**Checks.**
- `A = A(K₃)`, `S = 𝟙/√3`: `SᵀAS = 2 = θ₁`, tight, and `AS = 2S`.
- `A = A(C₄)` with `S` the two columns `𝟙/2` and `(1, -1, 1, -1)/2`: `SᵀAS = diag(2, -2)`, which
  interlaces `2, 0, 0, -2` tightly with `k = 1`, and `AS = S diag(2, -2)`.
- Negative control: `A = A(P₃)`, `S = 𝟙/√3`: `SᵀAS = 4/3`, not tight (`√2 > 4/3 > -√2`), and
  `AS = (1, 2, 1)/√3 ≠ (4/3)S`.

*Needs:* 4.1; Tau Ceti `LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`;
Mathlib `Matrix.isHermitian_conjTranspose_mul_mul`, `Matrix.IsHermitian.eigenvalues₀`.

### 4.3 Star sets and star complements

Definitions: `adjBlock X Y`, the block of `A` with rows `X` and columns `Y`; `IsStarSet θ X`:
`|X|` is the multiplicity of `θ` and `θ` is not an eigenvalue of `G - X` (the induced graph on
`Xᶜ`, the **star complement**). This is condition (iii) of [CRS, Proposition 5.1.1, pp. 136–137].
Write `A_X = adjBlock X X`, `B = adjBlock X Xᶜ` and `C = adjBlock Xᶜ Xᶜ`; [CRS] writes the
transpose `Bᵀ` for the lower-left block.
- **Existence** (`exists_isStarSet`). Every real `θ` has a star set; for `θ` not an eigenvalue it
  is `∅` [CRS, §5.1, pp. 136–137].
- **The star-complement identity** (`isStarSet_iff`). `X` is a star set for `θ` if and only if `θ`
  is not an eigenvalue of `C` and `θI - A_X = B(θI - C)⁻¹Bᵀ` [CRS, Theorem 5.1.7, p. 140].
- **The eigenspace** (`IsStarSet.mulVec_eq_smul_iff`). For a star set, the `θ`-eigenspace is
  `{(x, (θI - C)⁻¹Bᵀx) : x ∈ ℝ^X}` [CRS, Theorem 5.1.7, p. 140].
- **Reconstruction** (`adj_eq_of_isStarSet`). Two graphs on `V` with a common star set `X` for `θ`,
  the same graph on `Xᶜ` and the same edges between `X` and `Xᶜ` are equal [CRS, p. 141, the
  Reconstruction Theorem].
- **The bound** (`card_le_of_isStarSet`). If `θ ∉ {-1, 0}` and the star complement has `t`
  vertices, then `n ≤ t(t+1)/2`, unless `θ = 1` and `G` is `K₂` or `2K₂`
  [CRS, Theorem 5.3.1, p. 150].

**Suggested proof:** existence: the orthogonal projections `Pe_x` of the standard basis vectors
onto the `θ`-eigenspace span it, so some `X` indexes a basis of them; then `ℝ^V` is the direct
sum of the eigenspace and the coordinates outside `X`, so no `θ`-eigenvector vanishes on `X`, and
`θ` is not an eigenvalue of `C` [CRS, proof of Proposition 5.1.1, p. 137]. The identity is the
Schur complement of `θI - C` in `θI - A`: Mathlib's `Matrix.det_fromBlocks₂₂` and
`Matrix.fromBlocks_eq_of_invertible₂₂` give `rank(θI - A) = |Xᶜ| + rank(θI - A_X - B(θI - C)⁻¹Bᵀ)`
when `θI - C` is invertible, and the multiplicity of `θ` is the nullity of `θI - A`
(GraphSpectra 1.2). The eigenspace is the kernel of `θI - A` read through the same block
elimination. Reconstruction: by the identity, `A_X = θI - B(θI - C)⁻¹Bᵀ` is determined by `B` and
`C`. The bound [CRS, proof of Theorem 5.3.1, pp. 150–151]: let `s_u` be the columns of
`(Bᵀ | C - θI)`; the identity gives `⟨s_u, s_v⟩ = θ, -1, 0` for `u = v`, `u ~ v` and otherwise, in
the inner product `⟨x, y⟩ = xᵀ(θI - C)⁻¹y` on `ℝ^t`. The `n` quadratic forms `x ↦ ⟨s_u, x⟩²` are
linearly independent in the `t(t+1)/2`-dimensional space of quadratic forms on `ℝ^t`. For connected
`G`, a dependence `∑αᵤ⟨s_u, x⟩² = 0` evaluated at `x = s_i`, and polarized at `(s_i, w*)` with
`w*` the restriction to `Xᶜ` of the positive Perron vector (GraphSpectra 3.2), gives
`(θ²I + A)α = 0` and `(θI - A)(αᵤwᵤ)ᵤ = 0`; as `θ² ≠ -θ`, these eigenvectors for different
eigenvalues are orthogonal, `∑αᵤ²wᵤ = 0`, so `α = 0`, unless `θ` is the index, where `t = n - 1`
and only `K₂` fails. Components contribute independent forms, which leaves `rK₂` with `r ≤ 2`.

**Checks.**
- `K₂`, `θ = 1`, `X = {0}`: `C = [0]`, `θ - A_X = 1 = B·1·Bᵀ` with `B = [1]`. The bound fails
  (`2 > 1`): this is the `K₂` exception.
- `K₃`, `θ = -1` (multiplicity 2), `X = {0, 1}`: `C = [0]`, `θI - A_X = -J₂ = B(-1)Bᵀ` with
  `B = (1, 1)ᵀ`. Here `θ = -1`, outside the bound's range.
- `C₄`, `θ = 0` (multiplicity 2), `X = {0, 1}`: `G - X = K₂` has no eigenvalue `0`.
- `θ = 1/2`, not an eigenvalue of `K₂`: `X = ∅` is a star set, and the bound reads `4 ≤ 6`.
- Negative control: `2K₂`, `θ = 1` (multiplicity 2), `t = 2`: `4 > 3`, the second exception.
- Negative control: in `K₃` with `θ = -1` (multiplicity `2`), `X = {0}` is not a star set: its
  size is `1`, and `G - {0} = K₂` has the eigenvalue `-1`, so `θI - C` is singular and the
  identity fails as well.

*Needs:* GraphSpectra 1.2, 3.2; Mathlib `Matrix.det_fromBlocks₂₂`,
`Matrix.fromBlocks_eq_of_invertible₂₂`, `Submodule.starProjection`.

### 4.4 The sensitivity theorem

Definition: `hypercubeSigning d`, a signed adjacency matrix of `Q_d`, whose entry for the edge
from `x` flipping coordinate `i` is `(-1)^{#{j < i : x_j = 1}}`. Huang defines a signing of the
same pattern by the block recursion `A_d = [[A_{d-1}, I], [I, -A_{d-1}]]` [H, Lemma 2.2, p. 4;
N–P, Exercise 2.4.6, pp. 80–81].
- **Pattern** (`abs_hypercubeSigning`). `|B_{xy}| = A_{xy}` with `A` the adjacency matrix of
  `hypercube d`.
- **Square** (`hypercubeSigning_mul_self`). `B² = dI` [H, Lemma 2.2, p. 4].
- **Spectrum** (`hypercubeSigning_spectrum`). For `d ≥ 1`, `B` is symmetric with eigenvalues
  `±√d`, each of multiplicity `2^{d-1}` [H, Lemma 2.2, p. 4].
- **Sensitivity, graph form** (`sqrt_le_maxDegree_induce_hypercube`). For `d ≥ 1`, every induced
  subgraph of `Q_d` on `2^{d-1} + 1` vertices has maximum degree at least `√d` [H, Theorem 1.1,
  p. 1; N–P, Exercise 2.4.6, pp. 80–81]. This is Huang's theorem of DecisionTreeComplexity 5.1,
  which owns it, translated to `hypercube d` and `SimpleGraph.maxDegree`.

**Suggested proof:** `B` is symmetric, since flipping coordinate `i` leaves the coordinates below
`i` unchanged. For `B² = dI`, the two paths between vertices at distance 2 that differ in
coordinates `i < k` have opposite signs, since flipping `i` changes the sign attached to `k`, and
each vertex has `d` neighbours. The eigenvalues are `±√d` by `B² = dI`, and `tr B = 0` gives the
multiplicities. For the graph form, apply DecisionTreeComplexity 5.1 to `s`: for `d ≥ 1`,
`2^d < 2(2^{d-1} + 1)`, so some `x ∈ s` has `√d ≤ #{i | x^i ∈ s}`. The vertices `x^i` are the
neighbours of `x` in `hypercube d` (Hamming distance `1`, one for each `i`), so that count is the
degree of `x` in the induced subgraph, which is at most `SimpleGraph.maxDegree`. Huang's own proof
[H, proof of Theorem 1.1, pp. 4–5] uses Cauchy interlacing (RandomMatrices 1.2) for `B` and its
principal submatrix on `s`, and his row-sum bound [H, Lemma 2.3, p. 4]; DecisionTreeComplexity
5.1 replaces the interlacing by a dimension count. Mathlib's `Archive/Sensitivity.lean`, which is
outside the library, proves the theorem for its own model of the cube.

**Checks.**
- `d = 1`: `B = [[0, 1], [1, 0]]`, `B² = I`; two vertices of `Q₁` induce `K₂`, degree `1 ≥ 1`.
- `d = 2`: the signs around the square are `+, +, +, -`; three vertices of `C₄` induce `P₃`,
  degree `2 ≥ √2`.
- `d = 3`: `B` has eigenvalues `±√3`, four each; `d = 0`: `B = [0]` and `B² = 0·I`.
- Negative control: the unsigned `A(Q₂) = A(C₄)` has `A² ≠ 2I` (the entry between opposite
  vertices is `2`); the signs are needed.
- Negative control: the `2^{d-1}` even-weight vertices of `Q_d` are independent (degree `0`); the
  size `2^{d-1} + 1` cannot be lowered.

*Needs:* GraphSpectra 2.3; DecisionTreeComplexity 5.1; Mathlib `SimpleGraph.maxDegree`,
`hammingDist`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every target above. `Suggested.lean` states the
headlines that carry a Lean name, each with every conclusion the README attaches to it; it is not
an exhaustive acceptance test, and the other headlines (the meaning of the counts in 1.1, the
small principal minors of 1.2, the perfect matchings of a forest in 2.2 and the equality
statement of 4.2) are targets of the same standing, stated in prose.

Owned here:
- edge degrees and supports of edge sets, elementary edge sets with their component and cycle
  counts, Harary's determinant formula, Sachs's coefficient theorem and the first three
  coefficients, and the principal minors of orders `1`, `2` and `3` of an adjacency matrix;
- the isolated-vertex recurrence;
- the lowest term of the matching polynomial, the nullity and the determinant of a forest, the
  uniqueness of its perfect matching and the criterion for nonsingular trees;
- the tensor product and the join of graphs, the adjacency spectrum of a tensor product, the
  Laplacian spectra of joins and of complete bipartite graphs;
- the characteristic polynomial of the complement through main angles and the walk generating
  function;
- the energy of a graph, its bounds and its integrality;
- the interlacing predicates, equality on an eigenvector span, tight interlacing for compressions,
  star sets, star complements and the Bell–Rowlinson bound, Huang's signing of the hypercube with
  its pattern, square and spectrum, and the translation of Huang's theorem to the maximum degree
  of an induced subgraph of `hypercube d`.

Consumed, not restated (see the supplier contracts for the hypotheses):
- GraphSpectra 1.2, 1.7, 1.8, 2.3, 2.6 (in Checks), 3.2 and 3.9: spectra and characteristic
  polynomials, the derivative of the characteristic polynomial, the leaf recurrence and the
  sparse expansion, disjoint unions, spectra from orthogonal idempotents, the hypercube,
  Perron–Frobenius, main angles and walk counts; 1.7 and 3.8 are cited in the introduction to
  Layer 3.
- DecisionTreeComplexity 5.1: Huang's theorem on induced subgraphs of the cube.
- MatchingPolynomial 1.1 and 2.2; MatchingTheory 1.1; TuttePolynomialAndArrangements 4.1.
- SpectralGraphBounds 1.1 and LaplacianEigenvaluesOfGraphs 1.1: the sorted eigenvalues, the trace
  identities and induced interlacing.
- [RandomMatrices](../RandomMatrices/README.md) 1.2: Cauchy interlacing, cited in the
  introduction to Layer 4 and in 4.4.

Owned by other roadmaps and not used here: equitable partitions, their quotient matrices and
compressions (EquitableOperatorReduction), and spectral projectors, Kronecker sums of Cartesian
products and continuous-time quantum walks (SpectralQuantumWalks). The chromatic polynomial is
TuttePolynomialAndArrangements 4.2, and the recurrences, roots and signed adjacency matrices of the
matching polynomial are MatchingPolynomial's.

Outside the scope: characteristic polynomials of multigraphs and their deletion–contraction
recurrence, cospectral graphs and switching, and every procedure for computing a polynomial or a
spectrum.

Boundary in one sentence: a statement about the characteristic polynomial of a finite simple
graph as a combinatorial generating function, about the spectrum of a tensor product, a join or
a complement in terms of the factors, about energy, or about tight compressions, star sets and
star complements of a graph's adjacency matrix, is here unless one of the roadmaps listed above
states it.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`: `Matrix.charpoly_coeff_eq_sum_minors` (for
  `k ≤ n`, the coefficient of `t^{n-k}` in `M.charpoly` is `(-1)^k` times the sum of the
  principal minors of order `k`). Used in 1.2.
- Determinants: `Matrix.det_apply'` (the Leibniz expansion), used in 1.2;
  `Matrix.twoBlockTriangular_det` (the determinant of a block triangular matrix), used in 1.3.
- Polynomials: `Polynomial.rootMultiplicity_eq_natTrailingDegree'` (the multiplicity of the root `0`
  is the trailing degree) and `Polynomial.eq_rootMultiplicity_map` (an injective ring map preserves
  root multiplicities) (2.2).
- `Matrix.kronecker` and `Matrix.trace_kronecker` (3.1);
  `Matrix.det_add_replicateCol_mul_replicateRow` (the matrix determinant lemma, 3.2);
  `Matrix.det_fromBlocks₂₂` and `Matrix.fromBlocks_eq_of_invertible₂₂` (Schur complements, 4.3).
- Analysis and algebra for 3.3: `Finset.sum_mul_sq_le_sq_mul_sq` (Cauchy–Schwarz),
  `Real.geom_mean_le_arith_mean_weighted` (AM–GM), `Real.rpow`,
  `Matrix.IsHermitian.det_eq_prod_eigenvalues`, `IsIntegral`, `IsIntegral.add` and
  `IsIntegrallyClosed.isIntegral_iff`.
- Spectral theory: `Matrix.IsHermitian.eigenvalues₀` (nonincreasing) and
  `Matrix.isHermitian_conjTranspose_mul_mul` (a compression of a Hermitian matrix is Hermitian),
  used in 4.2; `eigenvalue_mem_ball` (Gershgorin), used in Huang's route in 4.4;
  `Submodule.starProjection`, in the definition of main angles and in 4.3.
- Graphs: `SimpleGraph.adjMatrix`, `SimpleGraph.lapMatrix`, `SimpleGraph.fromEdgeSet`,
  `SimpleGraph.induce`, `SimpleGraph.Embedding.submatrix_adjMatrix`, `SimpleGraph.cliqueFinset`,
  `SimpleGraph.sum` (written `G ⊕g H`), `completeBipartiteGraph`, `SimpleGraph.boxProd`,
  `SimpleGraph.maxDegree`, `hammingDist`, `SimpleGraph.IsAcyclic`, `SimpleGraph.IsTree`,
  `SimpleGraph.Subgraph.IsMatching` and `SimpleGraph.Subgraph.IsPerfectMatching`.

### From Tau Ceti

- `LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq`
  (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`): the quadratic form of a symmetric
  operator in its eigenbasis is `∑ λᵢ|xᵢ|²`. Used in 4.2.

### From GraphSpectra

`Suggested.lean` carries verbatim copies of the definitions used, in sections labelled with their
sections there: `adjSpectrum`, `lapSpectrum` and the `DecidableRel` instances for `⊕g` and
`completeBipartiteGraph` (Layer 1), `hammingGraph`, `hypercube` and its instance (2.3),
`adjEigenspace`, `onesVec`, `mainAngle` and `walkCount` (3.9).
- 1.2: the adjacency spectrum is the root multiset of the integer characteristic polynomial cast to
  `ℝ`, and `count θ` is the dimension of the `θ`-eigenspace. Used in 2.2, 3.3 and 4.3.
- 1.2: for a square matrix `M` over a commutative ring, `χ_M' = ∑_v χ_{M[V∖v]}`; for a vertex
  `v` of degree `1` with neighbour `u`, `p_G = t p_{G-v} - p_{G-u-v}` over any commutative ring,
  with `G - v` and `G - u - v` the induced graphs on `{v}ᶜ` and `{u, v}ᶜ`; the sparse expansion
  of a determinant. Cited in 1.3.
- 1.7: spectra and characteristic polynomials of disjoint unions. Cited in the introduction to
  Layer 3.
- 1.8: for a Hermitian `M = ∑ θᵢEᵢ` with complete orthogonal idempotents `Eᵢ` over `ℝ` or `ℂ`, the
  eigenvalue multiset is `∑ replicate (rank Eᵢ) θᵢ`, and `rank Eᵢ = tr Eᵢ`. Used in 3.1.
- 2.3: the Hamming graphs and the hypercube. Used in 4.4.
- 2.6: the multiset adjacency spectra of the standard families, among them `Cₙ` for `n ≥ 3`.
  Used in the Checks of 3.1.
- 3.8: for a `k`-regular graph on a nonempty vertex type, the adjacency spectrum of the
  complement is `n - k - 1` together with `-1 - θ` for the spectrum of `G` with one copy of `k`
  removed. Cited in the introduction to Layer 3.
- 3.2: a connected graph has a positive eigenvector for `θ₁`. Used in 4.3.
- 3.9: the eigenspace projections and `N_h = n ∑_θ β_θ² θʰ`. Used in 3.1 and 3.2.

### From MatchingPolynomial

- 1.1: the count `matchingCount G k` of matchings with `k` edges and the
  matching polynomial `matchingPolynomial G = Σ_{k ≤ n/2} (-1)^k m_k t^{n-2k}` in `ℤ[X]`, for
  `[Finite V]` with `n = Nat.card V`. Used in 2.1.
- 2.2: for a graph on a finite vertex type, `(G.adjMatrix ℤ).charpoly = matchingPolynomial G`
  if and only if `G.IsAcyclic`. Used in 2.2, in the direction from forests.

### From MatchingTheory

- 1.1: the matching number `matchingNumber G`, the supremum in `ℕ∞` of
  `M.edgeSet.encard` over the matchings `M`; on a finite vertex type a maximum matching exists, its
  size is `matchingNumber G`, and `2ν ≤ n` with equality if and only if `G` has a perfect
  matching. Used in 2.1 and 2.2.

### From TuttePolynomialAndArrangements

- 4.1: `numComponents A`, the number of connected components of
  `SimpleGraph.fromEdgeSet A` on all of `V`. Used in 1.1.

### From SpectralGraphBounds

- 1.1: the sorted adjacency eigenvalues `adjEigenvalues` (the definition under
  `adjSpectrum`), `∑θᵢ = 0` and `∑θᵢ² = 2m`, and interlacing for induced subgraphs. Used in 3.3
  and cited in the introduction to Layer 4.

### From LaplacianEigenvaluesOfGraphs

- 1.1: the sorted Laplacian eigenvalues `lapEigenvalues` (the definition under
  `lapSpectrum`), nonnegative with `0` at index `n - 1` on a nonempty vertex type, and `L𝟙 = 0`.
  Used in 3.1.

### From RandomMatrices

[RandomMatrices](../RandomMatrices/README.md) 1.2: Cauchy interlacing for a principal submatrix
of a Hermitian matrix on `m` of its `n` indices, `λᵢ(A) ≥ λᵢ(B) ≥ λ_{n-m+i}(A)` for
`Matrix.IsHermitian.eigenvalues₀`. Cited in the introduction to Layer 4 and in 4.4 (Huang's own
route); not a dependency.

### From DecisionTreeComplexity

DecisionTreeComplexity 5.1 (Huang's theorem on induced subgraphs of the cube): for every `n`, a
set `H` of points of `Fin n → Bool` with `2ⁿ < 2|H|` contains a point `x` with
`√n ≤ #{i | x^i ∈ H}`, where `x^i` is `x` with coordinate `i` flipped. Used in 4.4.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Equitable compressions.** For a cell map equitable for a square matrix `A`, the characteristic
  polynomial of the normalized compression `EᵀAE` divides that of `A` [CRS, Theorem 3.9.5, p. 85],
  and for symmetric `A`, tight interlacing of that compression forces equitability [BH, Corollary
  2.5.4, p. 27]; both rest on the equitable partitions of EquitableOperatorReduction.
- **Cartesian products.** The multiset spectrum of `G □ H` as the sums `θ + η` [BH, §1.4.6,
  p. 10].
- **Star complements of special eigenvalues.** The bound for non-main eigenvalues,
  `n ≤ (t - 1)(t + 2)/2` for `t > 2` [CRS, Theorem 5.3.2, p. 152], and the strongly regular graphs
  with a star complement `K_{1,s}` [CRS, §5.2, p. 150].

## References

- [B] N. Biggs, *Algebraic Graph Theory*, 2nd ed., Cambridge Mathematical Library, Cambridge
  University Press, 1993: Proposition 2.3, p. 8; Additional result 2a, p. 11;
  Definition 7.1, Propositions 7.2 and 7.3, pp. 44–46.
- [Ba] R. B. Bapat, *Graphs and Matrices*, 2nd ed., Universitext, Springer, 2014: Theorem 3.27,
  p. 40; Lemma 3.32 and its proof, p. 42.
- [BH] A. E. Brouwer, W. H. Haemers, *Spectra of Graphs*, Universitext, Springer, 2012:
  §1.4.2, p. 8; §§1.4.6–1.4.7, p. 10; §2.5, Theorem 2.5.1, Corollary 2.5.4, pp. 26–27;
  Exercise 3.10, p. 65.
- [CRS] D. Cvetković, P. Rowlinson, S. Simić, *An Introduction to the Theory of Graph Spectra*,
  LMS Student Texts 75, Cambridge University Press, 2010: Proposition 2.1.3, p. 25; (2.14),
  pp. 28–29; Theorem 2.3.1, p. 35; Theorem 2.3.2, Corollary 2.3.3, p. 36; Theorem 3.9.5, p. 85;
  §5.1, Proposition 5.1.1, Theorem 5.1.7, pp. 136–141; §5.2, Theorems 5.3.1–5.3.2, pp. 150–152;
  §7.1, Theorem 7.1.9, pp. 184–188; Proposition 9.2.2, p. 270.
- [H] H. Huang, Induced subgraphs of hypercubes and a proof of the sensitivity conjecture,
  *Ann. of Math.* 190 (2019), 949–955; arXiv:1907.00847, whose pages are cited: Theorem 1.1,
  p. 1; Lemmas 2.2 and 2.3 and the proof of Theorem 1.1, pp. 4–5.
- [N–P] K. Naderi, K. Pankrashkin, *Introduction to Spectral Graph Theory*, Compact Textbooks in
  Mathematics, Birkhäuser, 2025: Exercise 2.4.6, pp. 80–81.
- [St] Z. Stanić, *Inequalities for Graph Eigenvalues*, LMS Lecture Note Series 423, Cambridge
  University Press, 2015: Theorem 8.14, p. 244.

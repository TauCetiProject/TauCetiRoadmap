# Roadmap: graph symmetry and Cayley graphs

**Summary.** The automorphism group of a finite simple graph acts on its vertices, edges, arcs and
longer non-backtracking walks, and the transitivity of these actions organizes the group-theoretic
side of algebraic graph theory. This roadmap builds the theory of vertex-, edge-, arc- and
`s`-arc-transitive graphs and of Cayley graphs of arbitrary groups. Its headline theorems are these.

- Automorphisms are the permutations commuting with the adjacency matrix; they permute each
  eigenspace, and if every eigenvalue is simple the automorphism group is an elementary abelian
  `2`-group.
- A graph is walk-regular exactly when every spectral projection has constant diagonal, exactly
  when all vertex-deleted subgraphs have the same characteristic polynomial; vertex-transitive
  graphs are walk-regular.
- Sabidussi's theorem: a graph on a nonempty vertex set is a Cayley graph exactly when its
  automorphism group contains a subgroup acting regularly. Every finite vertex-transitive graph
  on a nonempty vertex set is a retract of a Cayley graph, and the Petersen graph, with
  automorphism group of order `120`, is vertex-transitive and not a Cayley graph.
- In a Cayley graph of a finite commutative group every character `ψ` is an eigenvector with
  eigenvalue `∑_{s ∈ S} ψ(s)`. For an arbitrary finite group the characteristic polynomial is the
  product, over a complete family of irreducible complex representations `ρ`, of the
  characteristic polynomial of `∑_{s ∈ S} ρ(s)` raised to the power `dim ρ`; for a connection set
  closed under conjugation the eigenvalues are `(dim ρ)⁻¹ ∑_{s ∈ S} χ_ρ(s)` with multiplicity
  `(dim ρ)²`.
- A connected vertex-transitive `k`-regular graph has edge connectivity `k` on at least two
  vertices, vertex connectivity at least `2(k + 1)/3` on at least three vertices, a matching
  missing any prescribed vertex when the order is odd, every edge in a maximum matching, and a
  cycle of length at least `√(3n)` on `n ≥ 3` vertices.
- A finite `s`-arc-transitive graph of minimum degree at least `3` has girth at least `2s - 2`,
  and Tutte's theorem bounds `s ≤ 5` for connected cubic graphs.
- Whitney's theorems: connected graphs with isomorphic line graphs are isomorphic apart from
  `K₃` and `K_{1,3}`, and apart from four small graphs every automorphism of the line graph comes
  from exactly one automorphism of the graph.
- Frucht's theorem: every finite group is the automorphism group of a finite cubic graph; and
  almost all graphs, labelled or up to isomorphism, have no nontrivial automorphism.

The roadmap rests on GraphSpectra, which supplies the adjacency spectrum, the spectral projections
and the Petersen, Johnson and Hamming graphs; on SpectralGraphBounds (the sorted adjacency
eigenvalues) and TopologicalCombinatorics (the Kneser graphs); on Mathlib's Cayley graphs, line
graphs, matchings and spectral theorem; on Tau Ceti's character theory of finite groups (complete
families of irreducible representations, central characters, the Wedderburn decomposition of the
group algebra), specified by [CharacterTheory](../RepresentationTheory/CharacterTheory/README.md);
and on Tau Ceti's edge and vertex connectivity, the implementation of
[GraphConnectivityAndFlows](../GraphConnectivityAndFlows/README.md). Later roadmaps on cocliques
and colourings and on expanders cite it by section.

## How to read the build

Layer 1 is the foundation: the three notions of transitivity, automorphisms and the adjacency
matrix, and the transitivity of Kneser graphs. Every later
layer uses it.

Layer 2 treats walk-regular graphs through the spectral decomposition of the powers of `A` and
the vertex-deleted characteristic polynomials. Layer 3 treats Cayley graphs and regular actions,
up to Sabidussi's theorem; Layer 4 the retraction of a vertex-transitive graph onto a Cayley graph
and the Petersen graph; Layer 5 Cayley spectra, first for commutative groups through characters
and then for arbitrary finite groups through irreducible representations. Layer 6 proves the
connectivity, matching and cycle theorems for vertex-transitive graphs, Layer 7 the `s`-arc
theory and Tutte's theorem, Layer 8 Whitney's line-graph theorems, and Layer 9 Frucht's theorem
and the asymmetry of almost all graphs.

Layers 2, 3, 6, 8 and 9 rest on Layer 1 alone; Layers 4 and 5 use Layer 3; Layer 7 uses Layers 1
and 4. A closing section describes Weiss's theorem as a roadmap for a roadmap.

## Conventions

- **Graphs.** `G : SimpleGraph V` with `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`
  wherever a count, a matrix or a degree appears. The definitions of transitivity make sense for
  every `V` and are stated without finiteness. Every statement holds for every finite `V`,
  including the empty type, unless a hypothesis such as `Nonempty V`, `Nontrivial V` or
  `3 ≤ Fintype.card V` is written.
- **Automorphisms.** The automorphism group is Mathlib's `G ≃g G`, a group acting on `V` by
  evaluation through `RelIso.applyMulAction`. No new type of automorphisms is introduced. A group
  `Γ` acting on `V` acts by automorphisms when it preserves adjacency; the action is regular when
  it is `MulAction.IsPretransitive` and `IsCancelSMul`.
- **Transitivity.** `IsVertexTransitive G` is `MulAction.IsPretransitive (G ≃g G) V`.
  `IsEdgeTransitive G` asks for every two edges `e, e'` an automorphism `φ` with
  `Sym2.map φ e = e'`. `IsArcTransitive G` quantifies over Mathlib's darts. An `s`-arc is a map
  `Fin (s + 1) → V` with consecutive values adjacent and `a i ≠ a (i + 2)` [GR, §4.1, p. 59]; it
  may repeat vertices. `IsSArcTransitive G s` asks the automorphism group to be transitive on
  `s`-arcs, and is vacuous when there are none. All five are defined here; the sixth notion of
  this roadmap, `IsWalkRegular`, is defined in 2.1.
- **Cayley graphs.** For a group `Γ` and `S : Set Γ`, the Cayley graph is Mathlib's
  `SimpleGraph.mulCayley S`, which symmetrizes `S` and ignores `1`. When `S⁻¹ = S` and `1 ∉ S`,
  `x` and `y` are adjacent exactly when `x⁻¹ * y ∈ S`, and left multiplication acts by
  automorphisms. This is the convention of [KS, Ch. 7] and the left-right mirror of [GR, §3.1,
  pp. 34–35], where `x ∼ y` when `y x⁻¹ ∈ C` and right multiplication acts; the two graphs are
  isomorphic through `x ↦ x⁻¹`. On an additive group the Cayley graph is
  `SimpleGraph.addCayley S`, with `x ∼ y` when `-x + y ∈ S`; `mulCayley` on a ring such as
  `ZMod n` uses its multiplication and is a different graph. Theorems take a symmetric `S`
  avoiding `1` where the degree, the adjacency criterion or the adjacency matrix is involved, and
  arbitrary `S` otherwise.
- **Girth.** The girth is Mathlib's `SimpleGraph.egirth`, valued in `ℕ∞` and `⊤` for a graph
  without cycles.
- **Spectra.** The sorted eigenvalues `adjEigenvalues G`, nonincreasing with index `0` the
  largest, are those of SpectralGraphBounds 1.1; the spectrum `adjSpectrum G`, a multiset of
  reals, is that of GraphSpectra 1.2, and `adjEigenspaceProjection G θ`, the spectral projection
  `P_θ` (the zero matrix when `θ` is not an eigenvalue), is that of GraphSpectra 3.9.
  `Suggested.lean` carries verbatim copies of these definitions, so the theorems of those
  roadmaps apply here as stated. Statements valid over a ring are made there: the vertex-deleted
  characteristic polynomials of Layer 2 are over `ℤ`, and the Cayley spectra of Layer 5 are
  characteristic polynomials over `ℂ`, which need neither unitarity nor a choice of basis.
- **Representations.** A complete family of irreducible complex representations of a finite
  group `Γ` is `ρ i : Representation ℂ Γ (W i)`, each `Representation.IsIrreducible`, pairwise
  inequivalent (no `Representation.Equiv` between distinct members), with
  `Nat.card ι = Nat.card (ConjClasses Γ)`; these are the hypotheses of Tau Ceti's
  `TauCeti.ClassFunction.exists_nonempty_equiv`, by which every irreducible representation is
  equivalent to a member of the family. The block of `S` at `ρ` is `∑_{s ∈ S} ρ s`, an
  endomorphism of `W i`.
- **Characters of commutative groups.** For a finite commutative group `A` the characters are
  Mathlib's `AddChar A ℂ`, viewed as vectors `A → ℂ`; they form a basis
  (`AddChar.complexBasis`).
- **Counts of graphs.** Labelled graphs on `n` vertices are `SimpleGraph (Fin n)`, a finite type
  of cardinality `2^(n choose 2)`. Isomorphism classes are the quotient by `isoSetoid (Fin n)`.

## Layer 1: automorphisms and transitivity

### 1.1 Vertex-, edge- and arc-transitivity

Definitions: `IsVertexTransitive`, `IsEdgeTransitive`, `IsArcTransitive`, as in the Conventions
[GR, §3.2, p. 35]. Supply their defining lemmas (for vertex-transitivity: for all `x, y` some
automorphism maps `x` to `y`), introduction lemmas from a transitive subgroup of `G ≃g G`, and
transport of all three notions along isomorphisms `G ≃g G'`.

- **Arc-transitivity implies the other two**
  (`IsArcTransitive.isVertexTransitive_and_isEdgeTransitive`). An arc-transitive graph without
  isolated vertices is vertex- and edge-transitive [GR, §3.2, pp. 35–36].
- **Edge-transitive graphs that are not vertex-transitive**
  (`IsEdgeTransitive.exists_orbit_bipartition`). If `G` is edge-transitive, has no isolated
  vertex and is not vertex-transitive, then there is a proper `2`-colouring whose colour classes
  are exactly the orbits of the automorphism group [GR, Lemma 3.2.1, p. 36].
- **Half-arc-transitive graphs have even degree** (`even_degree_of_not_isArcTransitive`). If `G`
  is finite, vertex- and edge-transitive but not arc-transitive, every degree is even [GR,
  Lemma 3.2.2, p. 36].
- **Vertex-transitive graphs are regular.** A finite vertex-transitive graph is regular: Tau
  Ceti's `SimpleGraph.degree_eq_of_pretransitive`, applied to the action of `G ≃g G`; on the
  empty type every degree is vacuously `0`. This is a corollary of the library, not a target.

**Suggested proof:** for the first item, a dart at `x` and a dart at `y` give an automorphism
carrying `x` to `y`, and the two darts of each edge give edge-transitivity. For the second, each
vertex lies on an edge `{x, y}`; edge-transitivity puts one end of every edge in the orbit of `x`
and the other in the orbit of `y`, and these orbits differ since `G` is not vertex-transitive.
For the third, the automorphism group has two orbits on darts, swapped by reversal, and each
vertex is the tail of equally many darts of each orbit.

**Checks.**
- `K_{1,3}` is edge-transitive and neither vertex- nor arc-transitive; its orbits `{centre}` and
  `{leaves}` are the colour classes.
- Negative control: `K₂` with an isolated vertex added is edge-transitive and not
  vertex-transitive. Its automorphism group has the two orbits `{ends of the edge}` and
  `{isolated vertex}`, and the edge lies inside one orbit, so the orbits are not colour classes:
  the hypothesis "no isolated vertex" of `exists_orbit_bipartition` cannot be dropped.
- `C₄` is vertex-transitive and `P₃` is not (the middle vertex has degree `2`, the ends `1`).
- `2K₃`, two disjoint triangles, is vertex-transitive and disconnected: transitivity does not
  imply connectivity.
- Negative control: `C₅` is vertex-, edge- and arc-transitive with degree `2`: even degree does
  not imply failure of arc-transitivity.

*Needs:* Mathlib `RelIso.applyMulAction`, `SimpleGraph.Iso.degree_eq`; Tau Ceti
`SimpleGraph.degree_eq_of_pretransitive`.

### 1.2 Automorphisms and the adjacency matrix

- **The matrix criterion** (`permMatrix_mul_adjMatrix_comm_iff`). Over a nontrivial semiring, a
  permutation `σ` of `V` commutes with `A` (as `σ.permMatrix R`) exactly when it preserves
  adjacency [B, Proposition 15.2, p. 116; BH, §1.6, p. 12]. The forward half of the automorphism
  case is Mathlib's `SimpleGraph.Iso.reindex_adjMatrix`.
- **Eigenspaces are invariant** (`adjMatrix_mulVec_comp_symm`). For an automorphism `φ` and a
  `θ`-eigenvector `f`, `f ∘ φ⁻¹` is a `θ`-eigenvector [BH, §1.6, p. 12]. Supply the resulting
  linear action of `G ≃g G` on each eigenspace.
- **Simple spectrum** (`mul_self_eq_one_of_injective_adjEigenvalues`,
  `commute_of_injective_adjEigenvalues`). If every adjacency eigenvalue is simple, every
  automorphism squares to the identity and any two commute, so the automorphism group is an
  elementary abelian `2`-group [BH, Corollary 1.6.1, p. 13; B, Theorem 15.4, p. 117; CRS-I,
  Theorem 3.8.4, p. 82].

Orbit partitions are recorded here and are not targets. For a subgroup `H` of `G ≃g G`, `A` maps
functions constant on the `H`-orbits to functions constant on the `H`-orbits, and the number of
neighbours that a vertex has in a given `H`-orbit is the same for all vertices of one `H`-orbit:
the orbits of `H` form an equitable partition [CRS-I, §3.9, p. 84; GR, §9.3, p. 196], and the two
facts are the two sides of [CRS-I, Theorem 3.9.4, pp. 84–85]. Equitable partitions, their quotient
matrices and automorphism-orbit partitions as a case of them belong to
EquitableOperatorReduction (its Layers 1 and 5); this roadmap does not use it, and no statement
here rests on the two facts. Both follow from one step: `y ↦ h⁻¹ y` is a bijection from the
neighbours of `h x` to those of `x` that preserves each `H`-orbit.

Two consequences are quoted and are not targets here. By GraphSpectra 3.9 the number of main
eigenvalues is at most the number of orbits of the automorphism group. The matrix of `A` on the
orbit-constant vectors, in the basis of orbit indicators, is the quotient matrix of the orbit
partition, and its characteristic polynomial divides that of `A` [CRS-I, Theorem 3.9.5, p. 85];
that divisibility belongs to a roadmap on characteristic polynomials.

**Suggested proof:** Mathlib's `σ.permMatrix R` has entry `1` at `(x, y)` exactly when
`y = σ x`, so the `(x, y)` entry of `P_σ A` is `A_{σ x, y}` and that of `A P_σ` is
`A_{x, σ⁻¹ y}`; compare entries, using `0 ≠ 1` for the converse. For eigenspaces, `P_φ f = f ∘ φ`,
so `f ∘ φ⁻¹` is `P_{φ⁻¹} f`, and `P_{φ⁻¹}` commutes with `A` by the criterion applied to the
automorphism `φ⁻¹`. For a simple spectrum, an automorphism preserves each one-dimensional real
eigenspace and is orthogonal, so it acts on it by `±1`; its square fixes an eigenbasis. A group
of exponent `2` is abelian.

**Checks.**
- `permMatrix_mul_adjMatrix_comm_iff` on `P₃` with the transposition of the two ends: both sides
  hold. With the transposition of an end and the middle: both sides fail.
- `K₂`: the automorphism group has order `2`, the spectrum `1, -1` is simple, and the swap
  squares to the identity.
- Negative control: `C₄` is vertex-transitive with eigenvalue `0` of multiplicity `2`; its
  rotation has order `4`. Simplicity of the spectrum cannot be dropped.
- Orbit partitions on `K_{1,3}` with `H` the full group: the centre has `3` neighbours in the
  orbit of leaves and `0` in its own; every leaf has `1` neighbour in the orbit of the centre and
  `0` in its own.
- Negative control: the partition of `P₃` into `{end}` and `{middle, other end}` is not an orbit
  partition and is not equitable: the middle vertex has one neighbour in the cell `{end}`, the
  other end has none.

*Needs:* 1.1; SpectralGraphBounds 1.1; GraphSpectra 3.9; Mathlib `Equiv.Perm.permMatrix`,
`MulAction.orbit`.

### 1.3 Kneser graphs

Definition: `kneserGraphIsoOfEquiv k e`, the isomorphism of Kneser graphs induced by an
equivalence `e : α ≃ β` of ground types. The Kneser graph `kneserGraph α k`, on the `k`-subsets
of `α`, is TopologicalCombinatorics 3.1; the Petersen graph `petersenGraph` is
`kneserGraph (Fin 5) 2` (GraphSpectra 2.4).

- **Kneser graphs are vertex-transitive** (`isVertexTransitive_kneserGraph`). For every ground
  type `α` and every `k`, the permutations of `α`, acting through `kneserGraphIsoOfEquiv`, are
  transitive on the vertices of `kneserGraph α k`; in particular the Petersen graph is
  vertex-transitive.

Supply also: that `kneserGraphIsoOfEquiv` maps the identity and composition of permutations to
the identity and composition of automorphisms; the vertex-transitivity of the Johnson graphs of
GraphSpectra 2.4 and of the Hamming graphs of GraphSpectra 2.3 (through permutations of the
coordinates and coordinatewise permutations of the alphabet); and the arc-transitivity of the
Hamming graphs and of the Kneser graphs. These are targets of the same standing, stated in prose.

**Suggested proof:** two `k`-subsets of `α` are carried to each other by a permutation
(Mathlib's `Equiv.Perm.exists_map_finset_eq`).

**Checks.**
- `kneserGraph (Fin 4) 2` is a perfect matching on six vertices, vertex-transitive and
  disconnected.
- Negative control: `kneserGraph (Fin 3) 2` has no edges and is vertex-transitive; transitivity
  needs no hypothesis on `|α|` or `k`, and no edge.
- The Petersen graph has `120` automorphisms, all from `Sym(5)` (4.2), and is vertex- and
  arc-transitive.

*Needs:* 1.1; TopologicalCombinatorics 3.1; GraphSpectra 2.3 and 2.4.

## Layer 2: walk-regular graphs

### 2.1 Walk counts and spectral projections

Definition: `IsWalkRegular G`: for every `h ≥ 0` the number of closed walks of length `h` at `x`
(Mathlib's `SimpleGraph.finsetWalkLength h x x`) does not depend on `x` [CRS-E, §4.1, p. 79;
G, Chapter 5, §3, p. 81].

- **Walk counts** (`isWalkRegular_iff_adjMatrix_pow`). Over a commutative semiring of
  characteristic zero, `G` is walk-regular exactly when every power `Aʰ` has constant diagonal.
  Route: `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`. A sanity check of the definition, proved
  in `Suggested.lean`; not a target.
- **Spectral decomposition** (`adjMatrix_pow_eq_sum_adjEigenspaceProjection`). For every
  `h ≥ 0`, `Aʰ = ∑_θ θʰ P_θ` over the distinct eigenvalues `θ` (the elements of
  `(adjSpectrum G).toFinset`); at `h = 0` the projections sum to the identity [CRS-E, (4.2.4),
  p. 81; B, 2j, p. 13].
- **Spectral projections** (`isWalkRegular_iff_adjEigenspaceProjection`). `G` is walk-regular
  exactly when every spectral projection `P_θ` has constant diagonal [CRS-E, §4.2, (4.2.5),
  p. 81, where `(P_θ)_{xx}` is the square of the angle at `x`; G, Chapter 5, Exercise 4, p. 88].

**Suggested proof:** for the decomposition, Mathlib's `Matrix.IsHermitian.spectral_theorem`
writes `A = U D Uᵀ` with the orthonormal eigenvector basis as columns of `U`, so
`Aʰ = U Dʰ Uᵀ = ∑ᵢ λᵢʰ vᵢvᵢᵀ`; group the indices by eigenvalue and use the definition of
`adjEigenspaceProjection`. For the characterization, the diagonal entry `(Aʰ)_{xx}` is
`∑_θ θʰ (P_θ)_{xx}`; the Vandermonde matrix of the distinct eigenvalues is invertible, so the
diagonals of the powers determine those of the projections and conversely.

**Checks.**
- `C₅` is walk-regular; `(Aʰ)_{xx}` is the number of closed walks of length `h`, `2` at `h = 2`,
  `0` at `h = 3` and `6` at `h = 4`.
- Decomposition on `K₂`: `P_{±1} = ½ [[1, ±1], [±1, 1]]`; `P₁ + P₋₁ = I` and `P₁ - P₋₁ = A`.
- Negative control: `P₃` is not walk-regular: closed walks of length `2` number `1` at an end
  and `2` at the middle; the projection onto the `0`-eigenspace, spanned by `(1, 0, -1)/√2`, has
  diagonal `(½, 0, ½)`, not constant.

*Needs:* 1.1; GraphSpectra 1.2 and 3.9; Mathlib `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`,
`Matrix.IsHermitian.spectral_theorem`, `Matrix.IsHermitian.eigenvectorBasis`.

### 2.2 Vertex-deleted subgraphs

- **The vertex-deleted characteristic polynomial** (`eval_charpoly_submatrix_compl`). For every
  vertex `x` and real `t` that is not an eigenvalue,
  `p_{Γ - x}(t) = p_Γ(t) ∑_θ (P_θ)_{xx} / (t - θ)`, the sum over the distinct eigenvalues, where
  `p_{Γ - x}` is the characteristic polynomial of the principal submatrix of `A` on `V ∖ {x}`
  [CRS-E, §4.2, (4.2.7)–(4.2.8), pp. 82–83].
- **Vertex-deleted subgraphs** (`isWalkRegular_iff_charpoly_submatrix`). `G` is walk-regular
  exactly when all the vertex-deleted characteristic polynomials over `ℤ` coincide; this is the
  definition of walk-regularity in [G, Chapter 5, §3, p. 81].

**Suggested proof:** Cramer's rule gives `((tI - A)⁻¹)_{xx} = p_{Γ-x}(t) / p_Γ(t)`, through
Mathlib's `Matrix.adjugate_fin_succ_eq_det_submatrix` after reindexing `V` to `Fin n` with `x`
first (`Matrix.adjugate_submatrix_equiv_self`); the spectral decomposition of 2.1 gives
`(tI - A)⁻¹ = ∑_θ P_θ / (t - θ)`. For the characterization, the polynomials agree for `x` and `y`
exactly when the rational functions `∑_θ (P_θ)_{xx} / (t - θ)` and `∑_θ (P_θ)_{yy} / (t - θ)`
agree, that is, when the diagonals of the `P_θ` agree; transfer from `ℝ` to `ℤ` by injectivity of
the cast of polynomials (`Matrix.charpoly_map`).

**Checks.**
- `P₃`: `p_{P₃ - end}(t) = t² - 1` and `p_{P₃ - middle}(t) = t²`, consistent with `P₃` not being
  walk-regular.
- `eval_charpoly_submatrix_compl` on `K₂`: `p_{K₁}(t) = t`, `p_{K₂}(t) = t² - 1`, and
  `(t² - 1)(½/(t - 1) + ½/(t + 1)) = t`.
- On a single vertex: `p_Γ(t) = t`, the deleted matrix is empty with characteristic polynomial
  `1`, and `t · (1/t) = 1` for `t ≠ 0`.
- Negative control: dropping the hypothesis `t ∉ adjSpectrum G` fails at `t = 1` on `K₂`: the
  left side is `p_{K₁}(1) = 1`, while the right side has the factor `p_{K₂}(1) = 0`.

*Needs:* 2.1; Mathlib `Matrix.charpoly`, `Matrix.submatrix`,
`Matrix.adjugate_fin_succ_eq_det_submatrix`, `Matrix.adjugate_submatrix_equiv_self`,
`Matrix.charpoly_map`.

### 2.3 Vertex-transitive and regular graphs

- **Vertex-transitive implies walk-regular** (`IsVertexTransitive.isWalkRegular`) [G, Chapter 5,
  §3, p. 81].
- **Walk-regular implies regular** (`IsWalkRegular.exists_isRegularOfDegree`) [G, Chapter 5,
  §3, p. 81; BH, §15.1, p. 222]. Supply also that every vertex of a walk-regular graph lies in
  the same number of triangles (`h = 3`).

**Suggested proof:** an automorphism `φ` maps closed walks at `x` bijectively onto closed walks
at `φ x` of the same length (Mathlib's `SimpleGraph.Walk.map`). For regularity, take `h = 2`,
where `(A²)_{xx}` is the degree of `x`.

**Checks.**
- The cycles, complete graphs, the Petersen graph and `Q₃` are vertex-transitive, hence
  walk-regular.
- Negative control: the Chang graph obtained from `L(K₈)` by switching with respect to the four
  edges of a perfect matching of `K₈` is strongly regular with parameters `(28, 12, 6, 4)`, hence
  walk-regular, and is not vertex-transitive: walk-regularity is strictly weaker.

*Needs:* 1.1, 2.1.

## Layer 3: Cayley graphs and regular actions

### 3.1 Cayley graphs

- **Adjacency.** For `S⁻¹ = S` and `1 ∉ S`, `(mulCayley S).Adj x y` iff `x⁻¹ * y ∈ S`. Route:
  Mathlib's `SimpleGraph.mulCayley_adj`, with `(x⁻¹ * y)⁻¹ = y⁻¹ * x`. A target stated in prose.
- **Regularity** (`isRegularOfDegree_mulCayley`). For a finite group and a symmetric
  `S : Finset Γ` avoiding `1`, the Cayley graph is `|S|`-regular [BH, §6.3, p. 94; §1.4.9, p. 11
  for commutative groups].
- **Connectivity** (`connected_mulCayley_iff`). For every `S`, the Cayley graph is connected iff
  `Subgroup.closure S = ⊤` [GR, Lemma 3.7.4, p. 49; BH, §6.3, p. 94].

**Suggested proof:** `s ↦ x * s` is a bijection from `S` to the neighbours of `x`. Along a walk
from `1` each step multiplies by an element of `S ∪ S⁻¹`, so every vertex reachable from `1`
lies in the closure; conversely, by induction on the closure, using that left multiplication by
`a` maps a walk from `1` to `b` onto a walk from `a` to `a * b`.

**Checks.**
- `addCayley {1}` on `ZMod 5` is `C₅`, `2`-regular and connected; `addCayley {2, 3}` on `ZMod 5`
  is also a `5`-cycle (the pentagram), and `x ↦ 2x` is an isomorphism from the first.
- Negative control: `mulCayley {1}` on `ZMod 5`, which uses the ring multiplication, has no
  edges; the additive Cayley graph is `addCayley`.
- Negative control: `addCayley {2}` on `ZMod 4` (with `2 = -2`) is a perfect matching on four
  vertices: `1`-regular and disconnected, and the subgroup generated by `2` is proper.
- Negative control: `0 ∈ S` is ignored by the graph, so `|S|`-regularity fails; for
  `S = {0, 1, -1}` in `ZMod 5` the degree of `addCayley S` is `2`, not `3`.
- The symmetric group `Sym(3)` with `S` its three transpositions gives `K_{3,3}`; with `S` the two
  `3`-cycles it gives `2K₃`, disconnected, since the `3`-cycles generate `Alt(3)`.

*Needs:* Mathlib `SimpleGraph.mulCayley`, `SimpleGraph.mulCayley_adj`, `SimpleGraph.addCayley`.

### 3.2 The left regular action and Sabidussi's theorem

Definitions: `mulLeftIso S g`, left multiplication by `g` as an automorphism of `mulCayley S`;
`mulLeftHom S`, the homomorphism `Γ →* (mulCayley S ≃g mulCayley S)`; `cayleySet Γ G v`, the set
`{g | g • v ∼ v}` for an action of `Γ` on the vertices of `G`. Supply the evaluation lemma
`mulLeftHom S g x = g * x`.

- **The left regular action** (`existsUnique_mulLeftHom_apply_eq`). Left multiplication is a
  homomorphism into the automorphism group whose action on vertices is regular: for all `x, y`
  exactly one `g` maps `x` to `y` [GR, Theorem 3.1.2, p. 35; Lemma 3.7.1, p. 48]. In particular
  Cayley graphs are vertex-transitive. A sanity check of the definition of `mulLeftHom`, proved
  in `Suggested.lean`; not a target (the regular action is used inside `exists_iso_mulCayley_iff`).
- **Sabidussi's theorem** (`nonempty_iso_mulCayley_of_regular`). Let `Γ` act on `V` by
  automorphisms of `G`, regularly, and fix `v : V`. Then `S = cayleySet Γ G v` is symmetric,
  avoids `1`, and `g ↦ g • v` is an isomorphism `mulCayley S ≃g G` [GR, Lemma 3.7.2, p. 48;
  BW, Alspach, Theorem 2.2, p. 158].
- **Recognition** (`exists_iso_mulCayley_iff`). A graph on a nonempty vertex type is isomorphic
  to a Cayley graph of some group in the same universe exactly when its automorphism group has a
  subgroup acting regularly on the vertices [BW, Alspach, Theorem 2.2, p. 158]. The hypothesis
  `Nonempty V` is needed: on the empty type the trivial subgroup acts regularly, while a group is
  never empty.

**Suggested proof:** for `g ↦ g • v`, freeness gives injectivity and transitivity surjectivity;
`g • v ∼ h • v` iff `v ∼ (g⁻¹ h) • v` iff `g⁻¹ h ∈ S`, since the action preserves adjacency in both
directions (apply it with `g⁻¹`). For recognition, for a Cayley graph conjugate `mulLeftHom` by
the isomorphism and take its range; conversely apply `nonempty_iso_mulCayley_of_regular` to the
subgroup.

**Checks.**
- Sabidussi on `C₄` with `ZMod 4` acting by rotation and `v = 0`: `S = {1, 3}` and the
  isomorphism is `g ↦ g`.
- Negative control: the dihedral group of order `8` acting on `C₄` is transitive but not free,
  and `{g | g • 0 ∼ 0}` has four elements; its Cayley graph is `4`-regular on `8` vertices and
  is not `C₄`. Freeness cannot be dropped.
- `mulLeftHom S` is injective on a nontrivial group: `g * 1 = g`.

*Needs:* 3.1; Mathlib `SimpleGraph.mulCayley_adj_mul_iff_right`, `IsCancelSMul`,
`MulAction.IsPretransitive`.

### 3.3 Normal Cayley graphs, circulants and products

- **Normal Cayley graphs** (`mulCayley_adj_mul_right_iff`). If `S` is closed under conjugation,
  right multiplications are automorphisms as well, so `Γ × Γ` acts by `(g, h) · x = g x h⁻¹`.
- **Circulants** (`circulantGraph_eq_addCayley`). On an additive commutative group,
  `circulantGraph s = addCayley s`; with Mathlib's `SimpleGraph.cycleGraph_eq_circulantGraph`,
  `cycleGraph (n + 1)` is the Cayley graph of `ZMod (n + 1)` with respect to `{1}`. The equation
  compares two Mathlib definitions; it is a sanity check, proved in `Suggested.lean`, not a
  target.

Supply also: the Cayley graph of `Γ₁ × Γ₂` with respect to `S₁ × {1} ∪ {1} × S₂` is the box
product (Mathlib's `SimpleGraph.boxProd`) of the two Cayley graphs; the hypercube of
GraphSpectra 2.3 is isomorphic to the Cayley graph of `Fin d → ZMod 2` with respect to the
standard basis vectors; and the complete graph on `Γ` is `mulCayley {1}ᶜ` (Mathlib's
`SimpleGraph.mulCayley_compl_singleton_one`). These are targets stated in prose.

**Suggested proof:** `(x g)⁻¹ (y g) = g⁻¹ (x⁻¹ y) g`. For circulants, `y - x ∈ s` iff
`-x + y ∈ s` in a commutative group; compare the two `fromRel` definitions.

**Checks.**
- `Q₈` with `S = {±i, ±j}`: `S` is closed under conjugation and the graph is `K_{4,4}`.
- Negative control: in `Sym(3)` the set `{(1 2), (1 2 3), (1 3 2)}` is symmetric but not closed
  under conjugation; right multiplication by `(1 3)` maps the edge `1 ∼ (1 2)` to the pair
  `(1 3), (1 2)(1 3)`, whose quotient `(1 3)(1 2)(1 3) = (2 3)` is not in `S`.
- `cycleGraph 5 = addCayley {1}` on `ZMod 5`.

*Needs:* 3.1; Mathlib `SimpleGraph.circulantGraph`, `SimpleGraph.cycleGraph_eq_circulantGraph`.

## Layer 4: vertex-transitive graphs and Cayley graphs

### 4.1 Retractions onto Cayley graphs

- **Retraction onto a Cayley graph** (`exists_retraction_mulCayley`). A finite vertex-transitive
  graph `G` on a nonempty vertex type admits a finite group `Γ`, a symmetric `S ⊆ Γ ∖ {1}` and
  graph homomorphisms `f : G →g mulCayley S`, `r : mulCayley S →g G` with `r ∘ f = id` [GR,
  Theorem 3.9.1, p. 51]. In the language of graph homomorphisms, `G` is a retract of
  `mulCayley S`. Godsil–Royle state it for connected graphs; the route uses only a base vertex
  and vertex-transitivity, and finiteness of `V` only to make `Γ` finite. `Nonempty V` is needed:
  on the empty type there is no map `r` from the nonempty Cayley graph.

**Suggested proof:** take `Γ = G ≃g G`, a base vertex `v`, and `S = cayleySet (G ≃g G) G v`; then
`g` and `h` are adjacent in `mulCayley S` exactly when `g v ∼ h v`, so `r g = g v` is a
homomorphism, and `f x`, an automorphism chosen to carry `v` to `x`, is a homomorphism with
`r (f x) = x`.

**Checks.**
- Retraction for `C₅`: `Γ` is the dihedral group of order `10`, `S` consists of the four
  elements moving `0` to `1` or to `4`, and the Cayley graph is `4`-regular on `10` vertices;
  `r` collapses each coset of the stabilizer (of order `2`) to a vertex.
- The Petersen graph: the stabilizer of a vertex has order `12`, so `|S| = 12 · 3 = 36`, and the
  Cayley graph of the proof is `36`-regular on `120` vertices.
- Negative control: in the proof, `f` needs an automorphism carrying `v` to each vertex; for
  `P₃`, which is not vertex-transitive, no automorphism carries an end to the middle.
- `2K₃`, vertex-transitive and disconnected: `|Γ| = 72`, the stabilizer of `v` has order `12`,
  `|S| = 2 · 12 = 24`, and the same construction gives a retraction.

*Needs:* 1.1, 3.1, 3.2.

### 4.2 The Petersen graph

- **Independent sets of the Petersen graph.** An independent set of four vertices of the
  Petersen graph consists of the four `2`-subsets of `Fin 5` containing a common point. Route:
  four pairwise intersecting `2`-subsets of a `5`-set without a common point would lie in a
  triangle `{ab, bc, ca}`, which has only three members. It is the case `n = 5`, `k = 2` of the
  uniqueness of the extremal Erdős–Ko–Rado families, AssociationSchemes 5.2; the direct
  argument suffices here. A target stated in prose.
- **Its automorphism group** (`card_aut_petersenGraph`). The automorphism group of the Petersen
  graph has order `120`, and `σ ↦ kneserGraphIsoOfEquiv 2 σ` is a bijection from `Sym(5)` onto it
  [GR, §4.4, pp. 64–65].
- **The Petersen graph is not a Cayley graph** (`not_exists_iso_mulCayley_petersenGraph`) [GR,
  Lemma 3.1.3, p. 35; BW, Alspach, pp. 160–161].

**Suggested proof:** injectivity, because distinct points of `Fin 5` have distinct stars;
surjectivity, because by the first item an automorphism permutes the five stars (the maximum
independent sets), and the permutation of `Fin 5` it induces gives the automorphism back. For the
last item, a group of order `10` has an element `g` of order `2` (Cauchy's theorem, Mathlib's
`exists_prime_orderOf_dvd_card'`), and left multiplication by `g`, carried to the Petersen graph,
is an automorphism of order `2` without fixed points. By the previous item it is induced by an
involution `σ` of `Fin 5`, and the `2`-subset `{a, σ a}` for a point `a` moved by `σ` is fixed: a
contradiction.

**Checks.**
- The Petersen graph has `10` vertices, degree `3`, girth `5`; `120 = 10 · 3 · 2 · 2`, the number
  of its `3`-arcs.
- It has exactly five independent sets of size `4`, the stars of the five points.
- Negative control: the cube `Q₃` (8 vertices, degree `3`) is a Cayley graph of `(ZMod 2)³`;
  vertex-transitivity alone does not distinguish it from the Petersen graph.
- Negative control: in `ZMod 10` with `S = {±1, 5}` the graph `addCayley S` is cubic on `10`
  vertices but contains the `4`-cycle `0, 1, 6, 5`, so it is not the Petersen graph.

*Needs:* 1.3, 3.2; GraphSpectra 2.4; Mathlib `exists_prime_orderOf_dvd_card'`.

## Layer 5: Cayley spectra

### 5.1 Commutative groups

- **Characters are eigenvectors** (`adjMatrix_addCayley_mulVec_addChar`). Let `A` be a finite
  commutative group, `S : Finset A` with `-S = S` and `0 ∉ S`. For every character
  `ψ : AddChar A ℂ`, the vector `ψ` is an eigenvector of the adjacency matrix of `addCayley S`
  with eigenvalue `∑_{s ∈ S} ψ(s)`, and the characteristic polynomial is
  `∏_ψ (X - ∑_{s ∈ S} ψ(s))` over all characters [BH, §1.4.9, p. 11; KS, Corollary 7.14, p. 193].

**Suggested proof:** by 3.1 the neighbours of `x` are the `x + s`, `s ∈ S`, so
`(Aψ)(x) = ∑_{s ∈ S} ψ(x + s) = ψ(x) ∑_{s ∈ S} ψ(s)`. The characters form a basis
(`AddChar.complexBasis`), so `A` is diagonal in that basis, with the stated eigenvalues.

**Checks.**
- `ZMod 5` with `S = {±1}`: the eigenvalues `ζʲ + ζ⁻ʲ = 2 cos(2πj/5)` are the spectrum of `C₅`.
- `ZMod 2 × ZMod 2` with `S = {(1, 0), (0, 1)}` (the graph `C₄`): the four characters give
  `2, 0, 0, -2`.
- `ZMod 8` with `S = {±1, 4}`: the character `x ↦ iˣ` (`a = 2`) gives `i + i⁻¹ + i⁴ = 1`.
- Negative control: for the non-symmetric `S = {1}` in `ZMod 5` the character `x ↦ ζˣ` would give
  the non-real value `ζ`, while `addCayley {1}` is `C₅` with eigenvalue `2 cos(2π/5)` at that
  character; the hypothesis `-S = S` is needed.

*Needs:* 3.1; Mathlib `AddChar`, `AddChar.complexBasis`, `SimpleGraph.addCayley`.

### 5.2 The block decomposition

- **The block decomposition** (`charpoly_adjMatrix_mulCayley`). Let `Γ` be finite, `S⁻¹ = S`,
  `1 ∉ S`, and let `ρ i` be a complete family of irreducible complex representations. Then
  `charpoly A(Cay(Γ, S)) = ∏ᵢ charpoly(Mᵢ)^{dim ρᵢ}` with `Mᵢ = ∑_{s ∈ S} ρᵢ(s)`, and the
  adjacency spectrum, cast to `ℂ`, is the multiset sum of the root multisets of the
  `charpoly(Mᵢ)`, each repeated `dim ρᵢ` times [KS, Proposition 7.1, p. 185]. When the `ρᵢ` are
  unitary the `Mᵢ` are self-adjoint and their spectra are real.

Supply also: the trivial representation contributes the eigenvalue `|S|`; a one-dimensional `χ`
contributes `∑_{s ∈ S} χ(s)`; the multiplicity of `|S|` is the index of the subgroup generated by
`S`, the number of connected components (consistent with 3.1).

**Suggested proof:** identify functions on `Γ` with `ℂ[Γ]`; the adjacency operator is right
multiplication by `∑_{s ∈ S} s⁻¹ = ∑_{s ∈ S} s`. The Fourier map `f ↦ (∑_g f(g) ρᵢ(g))ᵢ` is an
algebra isomorphism from `ℂ[Γ]` onto `∏ᵢ End(Wᵢ)` (CharacterTheory, 3.6, for a complete family;
its existence as a Wedderburn presentation is CharacterTheory, 2.1, and Tau Ceti's
`TauCeti.exists_algEquiv_pi_matrix`). It carries right multiplication by `∑_{s ∈ S} s` to right
multiplication by `Mᵢ` on each `End(Wᵢ)`, which is `dim Wᵢ` copies of the transpose of `Mᵢ`.
Similar operators have equal characteristic polynomials.

**Checks.**
- `Sym(3)` with its three transpositions (`K_{3,3}`): the trivial block is `3`, the sign block is
  `-3`, and the two-dimensional block is `0`, with multiplicity `2 · 2 = 4`. The spectrum
  `3, -3, 0⁴` is that of `K_{3,3}`.
- Negative control: `Sym(3)` with `S = {(1 2), (1 2 3), (1 3 2)}`, symmetric but not closed under
  conjugation: the trivial block is `3`, the sign block `-1 + 1 + 1 = 1`, and the two-dimensional
  block `ρ((1 2)) - 1` is not scalar, with eigenvalues `0` and `-2`, each repeated twice. The
  spectrum `3, 1, 0², (-2)²` is that of the triangular prism `K₃ □ K₂`.
- `ZMod 8` with `S = {2, 6}`: the eigenvalue `2` has multiplicity `2`, the index of `⟨2⟩`, and
  the graph has two components.

*Needs:* 3.1; CharacterTheory 2.1 and 3.6; Mathlib `Representation.IsIrreducible`,
`Representation.Equiv`, `LinearMap.charpoly`; Tau Ceti `TauCeti.exists_algEquiv_pi_matrix`,
`TauCeti.ClassFunction.exists_nonempty_equiv`.

### 5.3 Normal connection sets

- **Normal connection sets** (`charpoly_adjMatrix_mulCayley_of_conj`). If `S` is closed under
  conjugation, the adjacency eigenvalues are `(dim ρ)⁻¹ ∑_{s ∈ S} χ_ρ(s)` with multiplicity
  `(dim ρ)²` [KS, Proposition 7.4, p. 188; BH, Proposition 6.3.1, p. 95].

**Suggested proof:** `∑_{s ∈ S} s` is central in `ℂ[Γ]`, so it acts on each irreducible as a
scalar (Tau Ceti's `TauCeti.Representation.asAlgebraHom_center`, CharacterTheory 4.3, or Schur's
lemma in Mathlib's form
`Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed`), and taking
traces (`TauCeti.Representation.trace_asAlgebraHom_center`) identifies the scalar as
`(dim ρ)⁻¹ ∑_{s ∈ S} χ_ρ(s)`; then apply 5.2.

**Checks.**
- `Sym(3)` with its three transpositions: the two-dimensional block is the scalar
  `3 · χ(transposition) / 2 = 0` with multiplicity `2² = 4`.
- `Sym(3)` with its two `3`-cycles (`2K₃`): the blocks are `2`, `2` and `2 · χ(3-cycle) / 2 = -1`
  with multiplicity `4`; the spectrum `2², (-1)⁴` is that of `2K₃`.
- The quaternion group `Q₈` with `S = {±i, ±j}`: one-dimensional blocks `4, 0, 0, -4` and the
  two-dimensional block `4 · 0 / 2 = 0` with multiplicity `4`; the spectrum `4, -4, 0⁶` is that
  of `K_{4,4}`.
- Negative control: for the non-normal `S = {(1 2), (1 2 3), (1 3 2)}` of 5.2 the scalar formula
  at the two-dimensional representation gives `(0 - 1 - 1)/2 = -1`, which is not an eigenvalue of
  the prism (spectrum `3, 1, 0², (-2)²`); closure under conjugation is needed.

*Needs:* 5.2; CharacterTheory 4.3; Tau Ceti `TauCeti.Representation.asAlgebraHom_center`,
`TauCeti.Representation.trace_asAlgebraHom_center`.

## Layer 6: connectivity, matchings and cycles of vertex-transitive graphs

Edge and vertex connectivity are Tau Ceti's `SimpleGraph.edgeConnectivity` and
`SimpleGraph.vertexConnectivity`, valued in `ℕ∞`, the implementation of
[GraphConnectivityAndFlows](../GraphConnectivityAndFlows/README.md). The edge connectivity of a
graph on at most one vertex is `⊤`.

### 6.1 Edge and vertex connectivity

- **Edge connectivity** (`edgeConnectivity_eq_of_isVertexTransitive`). A connected
  vertex-transitive `k`-regular graph on at least two vertices has edge connectivity `k` [GR,
  Lemma 3.3.3, p. 38]. `Nontrivial V` is required, since a single vertex has edge connectivity
  `⊤`.
- **Vertex connectivity** (`two_mul_succ_le_three_mul_vertexConnectivity`). A connected
  vertex-transitive `k`-regular graph on at least three vertices has `3 κ ≥ 2 (k + 1)` for its
  vertex connectivity `κ` [GR, Theorem 3.4.2, p. 40].

**Suggested proof:** for the edge connectivity, the edge atoms of `G` (minimal sets `A` with
`|∂A|` equal to the edge connectivity and `|A| ≤ n/2`) are pairwise disjoint or equal [GR, §3.3,
p. 38], hence blocks of imprimitivity; an atom of size `a ≥ 2` induces an `ℓ`-regular subgraph
with `ℓ ≤ a - 1`, so `|∂A| = a (k - ℓ) ≥ k`. The upper bound is Tau Ceti's
`SimpleGraph.edgeConnectivity_le_minDegree`. For the vertex connectivity, follow the theory of
fragments and atoms [GR, Lemma 3.4.3, Theorem 3.4.4 and Corollary 3.4.5, pp. 40–42]: for a
noncomplete graph, an atom `A` meets each of its images in all of `A` or not at all, so it is a
block of imprimitivity and induces a vertex-transitive subgraph; the neighbourhood `N(A)` is a
union of images of `A`, and counting the neighbours of a vertex of `A` inside and outside `A`
gives `κ = |N(A)| ≥ 2 (k + 1) / 3`. The complete graphs `Kₙ`, `n ≥ 3`, have `κ = n - 1 ≥ 2n/3` by
Tau Ceti's `SimpleGraph.vertexConnectivity_top`.

**Checks.**
- `Cₙ`, `n ≥ 3`: edge connectivity `2`, vertex connectivity `2`, and `3 · 2 ≥ 2 · 3`.
- `K₄`: `κ' = κ = 3`, and `3 · 3 ≥ 2 · 4`. The Petersen graph: `κ' = κ = 3`.
- Negative control: `K₂` has `κ = 1`, and `3 · 1 < 2 · 2`; the hypothesis `3 ≤ Fintype.card V`
  cannot be dropped.
- Negative control: the path `P₄` is connected, not vertex-transitive, and has edge
  connectivity `1` while its maximum degree is `2`.
- The `5`-regular graph of [GR, Figure 3.4, p. 40] attains `κ = 4 = 2 (5 + 1) / 3`.

*Needs:* 1.1; Tau Ceti `SimpleGraph.edgeConnectivity_le_minDegree`,
`SimpleGraph.vertexConnectivity_top`, `SimpleGraph.vertexConnectivity_le_edgeConnectivity`.

### 6.2 Matchings

- **Odd order** (`exists_isMatching_verts_eq_compl_singleton`). In a connected vertex-transitive
  graph with an odd number of vertices, every vertex `v` is missed by a matching covering all the
  other vertices [GR, §3.5, p. 43, the remark before Theorem 3.5.1].
- **Every edge in a maximum matching** (`exists_maximum_matching_mem_edgeSet`). In a connected
  vertex-transitive graph every edge lies in a maximum matching [GR, Theorem 3.5.1, p. 43].

The even case, a perfect matching in a connected vertex-transitive graph of even order, is
MatchingTheory 5.2 and is not restated.

**Suggested proof:** [GR, Lemmas 3.5.2–3.5.3, pp. 43–44] on alternating paths: if some vertex
is missed by a maximum matching, vertex-transitivity puts every vertex in that situation, and
the lemmas then give a maximum matching missing exactly one vertex; for odd order a maximum
matching misses at least one vertex, and transitivity moves the missed vertex to `v`. The
Gallai–Edmonds structure is not needed.

**Checks.**
- `C₅`: deleting any vertex leaves `P₄`, which has a perfect matching.
- The Petersen graph has a perfect matching; every edge lies in one of its six perfect
  matchings.
- Negative control: `K_{1,2} = P₃` has odd order and is connected, not vertex-transitive, and the
  middle vertex is not missed by any matching covering both ends.
- Negative control: `3K₃` is vertex-transitive on `9` vertices and disconnected; deleting a
  vertex leaves `K₂` and two triangles, which have no perfect matching. Connectivity is needed.

*Needs:* 1.1; Mathlib `SimpleGraph.Subgraph.IsMatching`.

### 6.3 Long cycles

- **Long cycles** (`exists_isCycle_three_mul_card_le_length_sq`). A connected vertex-transitive
  graph on `n ≥ 3` vertices has a cycle of length `ℓ` with `ℓ² ≥ 3n` [GR, Theorem 3.6.3, p. 47,
  after Babai].

**Suggested proof:** for degree `2` the graph is `Cₙ`. Otherwise it is `3`-connected by 6.1;
two longest cycles in a `3`-connected graph share at least three vertices [GR, Ch. 3,
Exercise 19, p. 55], and a set meeting all its images under a transitive group in at least three
points has at least `√(3n)` elements [GR, Lemma 3.6.2, p. 46].

**Checks.**
- `Cₙ`, `n ≥ 3`: the cycle has length `n`, and `n² ≥ 3n`.
- The Petersen graph has `9`-cycles but no Hamiltonian cycle; `9² = 81 ≥ 30`.
- Negative control: `K₁` and `K₂` are connected and vertex-transitive and have no cycle; the
  hypothesis `3 ≤ Fintype.card V` cannot be dropped.

*Needs:* 6.1; Mathlib `SimpleGraph.Walk.IsCycle`.

## Layer 7: `s`-arcs and Tutte's theorem

### 7.1 `s`-arcs

Definitions: `IsSArc G s a` and `IsSArcTransitive G s`, as in the Conventions, with their defining
lemmas.

- **Small `s`** (`isSArcTransitive_zero_iff_and_one_iff`). `0`-arc-transitivity is
  vertex-transitivity, and `1`-arc-transitivity is arc-transitivity [GR, §4.1, p. 59].
- **Monotonicity** (`IsSArcTransitive.of_succ`). If every vertex has degree at least `2`, an
  `(s + 1)`-arc-transitive graph is `s`-arc-transitive. [GR, §4.1, p. 59] states this without
  the degree condition, which is needed (Checks).

Supply also the bridge between `s`-arcs and Mathlib walks of length `s` that do not backtrack
(through `SimpleGraph.Walk.getVert`), the action of `G ≃g G` on `s`-arcs, and the shunting
digraph of `s`-arcs, strongly connected for a connected graph of minimum degree `2` that is not a
cycle [GR, Theorem 4.2.2, p. 62]. These are targets stated in prose.

**Suggested proof:** every `s`-arc extends to an `(s + 1)`-arc, by a neighbour of its last
vertex other than the one before it, and an automorphism mapping the extensions maps the arcs.

**Checks.**
- `IsSArc` at `s = 0` holds for every map `Fin 1 → V`; at `s = 1` it is adjacency of the two
  values.
- `K₄` is `2`-arc-transitive (`24 = 4 · 3 · 2` `2`-arcs, `|Sym(4)| = 24`) and not
  `3`-arc-transitive.
- The cube `Q₃` is `2`-arc-transitive and not `3`-arc-transitive: a `3`-arc may close a `4`-cycle
  or not [GR, §4.1, p. 60].
- Negative control: `K_{1,3}` is `2`-arc-transitive (its six `2`-arcs leaf–centre–leaf are
  permuted regularly by `Sym(3)`) but not `1`-arc-transitive; `of_succ` needs the
  minimum-degree hypothesis.

*Needs:* 1.1; Mathlib `SimpleGraph.Walk.getVert`.

### 7.2 The girth bound and Tutte's theorem

- **Girth** (`IsSArcTransitive.le_egirth`). A finite `s`-arc-transitive graph of minimum degree at
  least `3` has `2s - 2 ≤ egirth` [GR, Lemma 4.1.3, p. 60; B, Proposition 17.2, pp. 131–132].
- **Tutte's theorem** (`le_five_of_isSArcTransitive`). A finite connected cubic
  `s`-arc-transitive graph has `s ≤ 5` [B, Theorem 18.6, p. 143; GR, Theorem 4.3.3, p. 64; BW,
  Praeger, Theorem 2.3, p. 182].
- **The Petersen graph is `3`-arc-transitive** (`isSArcTransitive_petersenGraph_three`) [GR,
  Ch. 4, Exercise 5, p. 75; B, p. 133].

**Suggested proof:** for the girth, first `s < g` for the girth `g`, comparing an `s`-arc on a
`g`-cycle with one that leaves it (degree at least `3` supplies the branch); then map an `s`-arc
on a shortest cycle to an `s`-arc leaving it at its last vertex, which produces a cycle of length
at most `2 (g - s + 1)`. For Tutte's theorem, Biggs's group-theoretic proof [B, Ch. 18]: a cubic
graph that is `s`-arc-transitive with `s` maximal is `s`-arc-regular, the automorphism group is
generated by the stabilizers of two adjacent vertices, and the analysis of these two stabilizers
and their intersection forces `s ≤ 5`. For the Petersen graph, by 4.2, `Sym(5)` acts on the `120`
`3`-arcs freely, hence regularly.

**Checks.**
- `K₄` is `2`-arc-transitive with girth `3 ≥ 2 · 2 - 2`.
- The Petersen graph is `3`-arc-transitive and not `4`-arc-transitive, with girth `5 ≥ 4`.
- The Heawood graph is `4`-arc-transitive (`336 = 14 · 3 · 2³` automorphisms and `4`-arcs) with
  girth `6 = 2 · 4 - 2`; Tutte's `8`-cage is `5`-arc-transitive (`1440 = 30 · 3 · 2⁴`) with girth
  `8 = 2 · 5 - 2`. Both attain the girth bound and the second attains Tutte's bound (for the
  `8`-cage, [GR, §4.7, pp. 71–74]).
- Negative control: `Cₙ` is `s`-arc-transitive for every `s`: Tutte's theorem and the girth bound
  need degree `3`.

*Needs:* 7.1, 4.2; Mathlib `SimpleGraph.egirth`.

## Layer 8: line graphs and Whitney's theorems

Definitions: `pawGraph` (a triangle with a pendant edge) and `diamondGraph` (`K₄` minus an edge),
both on `Fin 4`; `lineGraphAutHom G : (G ≃g G) →* (G.lineGraph ≃g G.lineGraph)`, the bundled
form of Mathlib's `SimpleGraph.Iso.lineGraph`, with its evaluation lemma: the image of `φ` maps
an edge `e` to `Sym2.map φ e`.

### 8.1 Whitney's isomorphism theorem

- **Whitney's isomorphism theorem** (`nonempty_iso_of_lineGraph_iso`). Finite connected graphs
  with isomorphic line graphs are isomorphic, unless one is `K₃` and the other `K_{1,3}`
  [KK, Theorem 5.2.8, p. 95].

**Suggested proof:** recover the vertices of `G` as the maximal cliques of `L(G)` coming from
stars, distinguished from triangles by the odd-triangle criterion; the exceptions are the small
graphs in which a triangle and a star have the same line graph.

**Checks.**
- `L(K₃) ≅ L(K_{1,3}) ≅ K₃`, while `K₃` and `K_{1,3}` are not isomorphic.
- `L(paw)` is the diamond and `L(K₄)` is the octahedron `K_{2,2,2}`.
- Negative control: `K₁` and `2K₁` have isomorphic (empty) line graphs and are not isomorphic;
  connectivity is needed.

*Needs:* Mathlib `SimpleGraph.lineGraph`, `SimpleGraph.Iso.lineGraph`.

### 8.2 Whitney's automorphism theorem

- **Whitney's automorphism theorem** (`bijective_lineGraphAutHom`). For a finite connected graph
  not isomorphic to `K₂`, `K₄`, the diamond or the paw, `lineGraphAutHom G` is bijective, so
  `Aut G ≃* Aut L(G)` [KK, Corollary 7.1.5 and Theorem 7.1.6, p. 138].

Supply also: the degree of the edge `xy` in `L(G)` is `d(x) + d(y) - 2`; `L(Kₙ)` is isomorphic to
the Johnson graph `J(n, 2)` of GraphSpectra 2.4; `L(K_{1,n}) ≅ Kₙ`; `L(Cₙ) ≅ Cₙ` for `n ≥ 3`;
`lineGraphAutHom` is injective for connected `G` with at least three vertices. These are targets
stated in prose.

**Suggested proof:** surjectivity from 8.1 applied to `G` and itself, with the maximal-clique
reconstruction made equivariant; injectivity because, on at least three vertices, a vertex is
determined by the set of edges at it.

**Checks.**
- `K₂`: `L(K₂)` is a single vertex, and `lineGraphAutHom` is not injective (`2` automorphisms
  onto `1`).
- `K₄`: the octahedron has `48` automorphisms, while `|Aut K₄| = 24`; the map is not surjective.
- The paw: `L(paw)` is the diamond, with `4` automorphisms, while the paw has `2`.
- The diamond: `4` automorphisms, and its line graph, the wheel on five vertices, has `8`.
- `K_{1,3}`: `Aut ≅ Sym(3) ≅ Aut K₃`, and the map is bijective; the star is not an exception for
  the automorphism theorem.

*Needs:* 8.1; GraphSpectra 2.4.

## Layer 9: Frucht's theorem and asymmetry

### 9.1 Frucht's theorem

- **Frucht's theorem** (`exists_cubic_aut_mulEquiv`). For every finite group `Γ` there is a
  finite graph in the same universe, every vertex of which has exactly three neighbours, with
  automorphism group isomorphic to `Γ` [B, p. 117; BW, Cameron, p. 142, after Theorem 5.1].

Supply also: every finite group is the automorphism group of a finite graph, without the degree
condition, by the same construction with paths in place of gadgets [KK, Theorem 7.4.1, p. 148;
BW, Cameron, Theorem 5.1, p. 142]. A target stated in prose.

**Suggested proof:** Frucht's construction: start from the coloured Cayley digraph of `Γ` with
respect to a generating set, and replace each coloured arc by an asymmetric cubic gadget that
encodes its colour and direction; then show every automorphism preserves the gadgets.

**Checks.**
- The trivial group: an asymmetric cubic graph exists (the Frucht graph, `12` vertices).
- Negative control: `K₂` has automorphism group `ZMod 2` but is not cubic; a cubic witness for
  `ZMod 2` needs more vertices.

*Needs:* 3.1; Mathlib `SimpleGraph.Iso`.

### 9.2 Asymmetry

Definition: `isoSetoid V`, isomorphism of graphs on a fixed vertex type, with its defining lemma.

- **Asymmetry of labelled graphs** (`tendsto_card_nontrivialAut_div_card`). The proportion of
  graphs on `Fin n` with a nontrivial automorphism tends to `0` [BW, Cameron, Theorem 3.1,
  p. 140].
- **Asymmetry of isomorphism classes** (`tendsto_card_nontrivialAut_div_card_isoClasses`). The
  proportion of isomorphism classes on `n` vertices containing a graph with a nontrivial
  automorphism tends to `0` [BW, Cameron, Theorem 3.1, p. 140].

**Suggested proof:** for a permutation `σ` moving `m` points, the graphs fixed by `σ` number
`2^{c(σ)}` with `c(σ)` the number of cycles of `σ` on unordered pairs, at most
`(n choose 2) - m (n - 2)/4`; sum over `σ`. For classes, the number of classes is asymptotic to
`2^{(n choose 2)}/n!` (orbit counting with the previous bound), and the asymmetric graphs are
spread over classes of size `n!`.

**Checks.**
- On `Fin 0` and `Fin 1` the labelled ratio is `0` (the only graph has only the trivial
  automorphism); on `Fin n` for `2 ≤ n ≤ 5` every graph has a nontrivial automorphism and the
  ratio is `1`.
- On `Fin 6` there are `8` asymmetric graphs up to isomorphism, so `8 · 720 = 5760` labelled
  asymmetric graphs, and the ratio is `(32768 - 5760) / 32768 = 211/256`.
- `Nat.card (Quotient (isoSetoid (Fin 4))) = 11`, all with a nontrivial automorphism.
- Negative control: the ratios are not monotone in `n` from the start (`0, 0, 1, 1, 1, 1,
  211/256`); only the limit is claimed.

*Needs:* Mathlib `Fintype (SimpleGraph V)`, `Quotient`.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Weiss's theorem.** A finite connected `s`-arc-transitive graph of minimum degree at least `3`
  has `s ≤ 7` and `s ≠ 6` [BW, Praeger, Theorem 6.2 and the paragraph after it, p. 190; R. Weiss,
  *The nonexistence of 8-transitive graphs*, Combinatorica 1 (1981), 309–311]. The proof uses the
  classification of the finite doubly transitive permutation groups, which rests on the
  classification of the finite simple groups. A roadmap for it would start from the statement of
  [CFSGStatement](../CFSGStatement/README.md), derive the list of finite `2`-transitive groups
  from it, and then follow Weiss's local analysis of vertex stabilizers. The generalized polygons
  attaining `s = 7` belong to a roadmap on distance-regular graphs and polygons.
- **Divisibility by the orbit quotient.** The characteristic polynomial of the quotient matrix of
  an equitable partition, in particular of an orbit partition, divides that of `A` [CRS-I,
  Theorem 3.9.5, p. 85]: a roadmap on characteristic polynomials built on the equitable
  partitions of EquitableOperatorReduction.

## Downstream consumers

Later roadmaps of algebraic and spectral graph theory cite this one by section:
- Cocliques, colourings and theta: vertex- and edge-transitivity of 1.1, the transitivity of the
  Kneser and Petersen graphs of 1.3, and the retraction of 4.1.
- Expander graphs: the regularity and connectivity of Cayley graphs of 3.1.

The roadmap on distance-regular graphs, codes and polygons defines distance transitivity directly
by automorphisms and uses nothing from this one.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every target above. `Suggested.lean` states the
headlines that carry a Lean name, each with every conclusion the README attaches to it; it is not
an exhaustive acceptance test, and the other headlines are targets of the same standing, stated
in prose. Three declarations of `Suggested.lean` are sanity checks of the definitions, proved
there and not targets: `isWalkRegular_iff_adjMatrix_pow` (2.1), `existsUnique_mulLeftHom_apply_eq`
(3.2) and `circulantGraph_eq_addCayley` (3.3).

Owned here:
- vertex-, edge- and arc-transitivity and `s`-arc-transitivity, with their basic theory and the
  transitivity of the Kneser, Johnson and Hamming graphs;
- the matrix criterion for automorphisms and eigenspace invariance;
- automorphisms of graphs with simple spectrum;
- walk-regular graphs, the spectral decomposition of the powers of `A` in terms of the
  projections of GraphSpectra 3.9, and the spectral characterizations of walk-regularity;
- Cayley graphs of arbitrary groups: regularity, connectivity, the regular left action,
  Sabidussi's theorem, normal Cayley graphs, and circulants as abelian Cayley graphs;
- retractions of vertex-transitive graphs onto Cayley graphs, the automorphism group of the
  Petersen graph and its failure to be a Cayley graph;
- Cayley-graph spectra: the character eigenvectors of Cayley graphs of finite commutative groups,
  and the block decomposition for arbitrary finite groups;
- edge and vertex connectivity, matchings of odd order and long cycles of vertex-transitive
  graphs;
- `s`-arcs, the girth bound and Tutte's theorem for cubic graphs;
- Whitney's line-graph isomorphism and automorphism theorems;
- Frucht's theorem and the asymmetry of almost all graphs.

Consumed, not restated (see the supplier contracts):
- GraphSpectra 1.2, 2.3, 2.4 and 3.9: the adjacency spectrum, the Hamming and Johnson graphs,
  the Petersen graph, the spectral projections and the orbit bound on main eigenvalues.
- SpectralGraphBounds 1.1: the sorted adjacency eigenvalues.
- TopologicalCombinatorics 3.1: the Kneser graphs.
- [CharacterTheory](../RepresentationTheory/CharacterTheory/README.md) 2.1, 3.6 and 4.3: the
  Wedderburn decomposition and central characters, through their Tau Ceti implementation, and
  the Fourier map as an algebra isomorphism, as the statement of its 3.6.
- [GraphConnectivityAndFlows](../GraphConnectivityAndFlows/README.md): edge and vertex
  connectivity, through their Tau Ceti implementation.

Not owned here, and not used:
- equitable partitions, their quotient matrices and automorphism-orbit partitions as equitable
  partitions: EquitableOperatorReduction, Layers 1 and 5. 1.2 records the orbit case in prose,
  with its locators, and states nothing that rests on it;
- the perfect matching of a connected vertex-transitive graph of even order: MatchingTheory 5.2;
  6.2 here owns the odd-order statement and the maximum-matching statement;
- the theta function of vertex-transitive graphs: LovaszThetaFunction 4.2, which states its
  hypothesis as `∀ v w, ∃ φ : G ≃g G, φ v = w`, the defining lemma of `IsVertexTransitive`;
- the uniqueness of the extremal Erdős–Ko–Rado families: AssociationSchemes 5.2; 4.2 here proves
  the case of the Petersen graph directly;
- the arc-transitivity and character eigenvectors of Paley graphs: PaleyGraphsAndCharacterSums
  1.4 and 2.1;
- character diagonalizations in the setting of quantum walks: SpectralQuantumWalks, Layer 7. The
  boundary is this: 5.1 here owns the eigenvector statement and the characteristic polynomial of
  the Cayley graph of a finite commutative group as a `SimpleGraph`, proved from its definition,
  and does not use that roadmap;
- circulant matrices and their Fourier diagonalization as a tool for positive definite sequences:
  PositiveDefiniteSequencesAndToeplitzForms 2.1, where it is a route step;
- random walks on finite groups and their analysis by characters: RandomWalksOnFiniteGroups;
  Cayley graphs of infinite groups and their spectral radius: KestenAmenabilityAndSpectralRadius;
  explicit expander and Ramanujan Cayley graphs: ExpanderConstructions and RamanujanGraphs;
  non-backtracking walks and the Ihara zeta function: IharaZetaFunction; the spectra of strongly
  regular graphs: StronglyRegularAndMooreGraphs;
- automorphism groups of Serre graphs and of trees: Tau Ceti and
  [FreeGroupsAndLimitGroups](../FreeGroupsAndLimitGroups/README.md).

Boundary in one sentence: everything about the automorphism group of a finite simple graph and
about Cayley graphs as graphs is here; spectral facts that need no group are GraphSpectra's;
expansion belongs to the expander roadmaps.

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.Iso`: `G ≃g G` is a group, acting on `V` by `RelIso.applyMulAction`;
  `SimpleGraph.Iso.degree_eq`; `SimpleGraph.Iso.reindex_adjMatrix`. Used in Layer 1.
- `SimpleGraph.adjMatrix_pow_apply_eq_card_walk` and `SimpleGraph.finsetWalkLength`. Used in
  Layer 2.
- `MulAction.IsPretransitive`, `IsCancelSMul` (a free action) and `MulAction.orbit`. Used in
  Layers 1 and 3.
- `Equiv.Perm.permMatrix` and `Equiv.Perm.exists_map_finset_eq`. Used in 1.2 and 1.3.
- `Matrix.IsHermitian.spectral_theorem`, `Matrix.IsHermitian.eigenvectorBasis`,
  `Matrix.adjugate_fin_succ_eq_det_submatrix`, `Matrix.adjugate_submatrix_equiv_self`,
  `Matrix.charpoly_map`. Used in Layer 2.
- `SimpleGraph.mulCayley` with `SimpleGraph.mulCayley_adj`,
  `SimpleGraph.mulCayley_adj_mul_iff_right` (left multiplication preserves adjacency) and
  `SimpleGraph.mulCayley_compl_singleton_one`; its additive version `SimpleGraph.addCayley`;
  `SimpleGraph.circulantGraph` and `SimpleGraph.cycleGraph_eq_circulantGraph`;
  `SimpleGraph.boxProd`. Used in Layers 3–5.
- `AddChar` and `AddChar.complexBasis`. Used in 5.1.
- `Representation.IsIrreducible`, `Representation.Equiv`, Schur's lemma
  `Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed`, and
  `LinearMap.charpoly`. Used in 5.2 and 5.3.
- `exists_prime_orderOf_dvd_card'` (Cauchy's theorem). Used in 4.2.
- `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.Walk.IsCycle`, `SimpleGraph.Walk.getVert`,
  `SimpleGraph.egirth`. Used in Layers 6 and 7.
- `SimpleGraph.lineGraph` and `SimpleGraph.Iso.lineGraph`. Used in Layer 8.

### From Tau Ceti

- `SimpleGraph.degree_eq_of_pretransitive`: a pretransitive adjacency-preserving action on a
  locally finite graph gives equal degrees. Used in 1.1.
- `SimpleGraph.edgeConnectivity` with `SimpleGraph.edgeConnectivity_le_minDegree` (on a
  nontrivial vertex type), and `SimpleGraph.vertexConnectivity` with
  `SimpleGraph.vertexConnectivity_top` (the complete graph has vertex connectivity `|V| - 1`)
  and `SimpleGraph.vertexConnectivity_le_edgeConnectivity`. Both numbers are `ℕ∞`-valued. Used in
  Layer 6.
- `TauCeti.ClassFunction.exists_nonempty_equiv`: for a complete family of irreducible
  representations in the form of the Conventions, every irreducible representation is equivalent
  to a member. Used in 5.2.
- `TauCeti.exists_algEquiv_pi_matrix`: over an algebraically closed field of characteristic not
  dividing `|Γ|`, the group algebra is a finite product of matrix algebras. Used in 5.2.
- `TauCeti.Representation.asAlgebraHom_center`: a central element of the group algebra acts on an
  irreducible representation as the scalar its central character records, and
  `TauCeti.Representation.trace_asAlgebraHom_center`: the trace of that action is the central
  character times the degree. Used in 5.3.

### From GraphSpectra

The roadmap GraphSpectra, whose definitions used here are copied verbatim in `Suggested.lean`:
- 1.2: `adjSpectrum`, the adjacency spectrum as a multiset of reals. Used in Layers 2 and 5.
- 2.3 and 2.4: the Hamming and Johnson graphs, and `petersenGraph`, the Kneser graph
  `K(5, 2)`. Used in 1.3, 4.2, 7.2 and 8.2.
- 3.9: `adjEigenspaceProjection G θ`, the matrix `∑ vᵢvᵢᵀ` over the vectors of Mathlib's
  orthonormal eigenvector basis with eigenvalue `θ`, which is the orthogonal projection onto the
  `θ`-eigenspace; and the bound of the number of main eigenvalues by the number of orbits of the
  automorphism group. Used in 1.2 and Layer 2.

### From SpectralGraphBounds

The roadmap SpectralGraphBounds, 1.1: the sorted adjacency eigenvalues `adjEigenvalues G`, the
`eigenvalues₀` of the real adjacency matrix, nonincreasing with index `0` the largest, copied
verbatim in `Suggested.lean`. Used in 1.2.

### From TopologicalCombinatorics

The roadmap TopologicalCombinatorics, 3.1: the Kneser graph `kneserGraph α k` on
`{s : Finset α | s.card = k}`, two `k`-subsets adjacent when distinct and disjoint, copied
verbatim in `Suggested.lean`. Used in 1.3, 4.2 and 7.2.

### From CharacterTheory

[CharacterTheory](../RepresentationTheory/CharacterTheory/README.md): 2.1, the Wedderburn
decomposition of the group algebra; 3.6, the Fourier map `f ↦ (∑_g f(g) ρᵢ(g))ᵢ` as an algebra
isomorphism onto `∏ᵢ End(Vᵢ)` for a complete family; 4.3, central characters. Used in 5.2 and
5.3: 2.1 and 4.3 through the Tau Ceti declarations listed above, 3.6 as the statement of that
section.

### From GraphConnectivityAndFlows

[GraphConnectivityAndFlows](../GraphConnectivityAndFlows/README.md): edge and vertex
connectivity and Menger's theorem, consumed through their Tau Ceti implementation listed above.
Used in Layer 6.

## References

- [B] N. Biggs, *Algebraic Graph Theory*, 2nd ed., Cambridge Mathematical Library, Cambridge
  University Press, 1993: Additional result 2j, p. 13; Proposition 15.2, p. 116; Theorem 15.4
  and the remark on Frucht's theorem, p. 117; Proposition 17.2, pp. 131–132; §17, p. 133;
  Chapter 18, Theorem 18.6, p. 143.
- [BH] A. E. Brouwer, W. H. Haemers, *Spectra of Graphs*, Universitext, Springer, 2012: §1.4.9,
  p. 11; §1.6, p. 12, Corollary 1.6.1, p. 13; §6.3, p. 94, Proposition 6.3.1, p. 95; §15.1,
  p. 222.
- [BW] L. W. Beineke, R. J. Wilson (eds.), *Topics in Algebraic Graph Theory*, Encyclopedia of
  Mathematics and its Applications 102, Cambridge University Press, 2004: P. J. Cameron,
  *Automorphisms of graphs*, Theorem 3.1, p. 140, and Theorem 5.1, p. 142; B. Alspach, *Cayley
  graphs*, Theorem 2.2, p. 158, and pp. 160–161; C. E. Praeger, *Finite symmetric graphs*,
  Theorem 2.3, p. 182, and Theorem 6.2, p. 190.
- [CRS-E] D. Cvetković, P. Rowlinson, S. Simić, *Eigenspaces of Graphs*, Encyclopedia of
  Mathematics and its Applications 66, Cambridge University Press, 1997: §4.1, p. 79; §4.2,
  (4.2.4)–(4.2.5), p. 81, (4.2.7), p. 82, (4.2.8), p. 83.
- [CRS-I] D. Cvetković, P. Rowlinson, S. Simić, *An Introduction to the Theory of Graph Spectra*,
  London Mathematical Society Student Texts 75, Cambridge University Press, 2010: Theorem 3.8.4,
  p. 82; §3.9, p. 84, Theorem 3.9.4, pp. 84–85, Theorem 3.9.5, p. 85.
- [G] C. D. Godsil, *Algebraic Combinatorics*, Chapman and Hall, 1993: Chapter 5, §3, p. 81;
  Chapter 5, Exercise 4, p. 88.
- [GR] C. Godsil, G. Royle, *Algebraic Graph Theory*, Graduate Texts in Mathematics 207, Springer,
  2001: §3.1, pp. 34–35, Theorem 3.1.2 and Lemma 3.1.3, p. 35; §3.2, p. 35, Lemmas 3.2.1–3.2.2,
  p. 36; §3.3 and Lemma 3.3.3, p. 38; Theorem 3.4.2 and Figure 3.4, p. 40, Lemma 3.4.3,
  Theorem 3.4.4 and Corollary 3.4.5, pp. 40–42; Theorem 3.5.1 and Lemma 3.5.2, p. 43, Lemma 3.5.3,
  p. 44; Lemma 3.6.2, p. 46, Theorem 3.6.3, p. 47; Lemmas 3.7.1–3.7.2, p. 48; Lemma 3.7.4, p. 49;
  Theorem 3.9.1, p. 51; Chapter 3, Exercise 19, p. 55; §4.1, pp. 59–60, Lemma 4.1.3, p. 60;
  Theorem 4.2.2, p. 62; Theorem 4.3.3, p. 64; §4.4, pp. 64–65; §4.7, pp. 71–74; Chapter 4,
  Exercise 5, p. 75; §9.3, p. 196.
- [KK] U. Knauer, K. Knauer, *Algebraic Graph Theory: Morphisms, Monoids and Matrices*, 2nd ed.,
  De Gruyter, 2019: Theorem 5.2.8, p. 95; Corollary 7.1.5 and Theorem 7.1.6, p. 138;
  Theorem 7.4.1, p. 148.
- [KS] M. Krebs, A. Shaheen, *Expander Families and Cayley Graphs: A Beginner's Guide*, Oxford
  University Press, 2011: Chapter 7, Proposition 7.1, p. 185, Proposition 7.4, p. 188, §7.4,
  p. 192, Corollary 7.14, p. 193.
- G. Sabidussi, *On a class of fixed-point-free graphs*, Proc. Amer. Math. Soc. 9 (1958),
  800–804.
- W. T. Tutte, *A family of cubical graphs*, Proc. Cambridge Philos. Soc. 43 (1947), 459–474.
- H. Whitney, *Congruent graphs and the connectivity of graphs*, Amer. J. Math. 54 (1932),
  150–168.
- R. Frucht, *Graphs of degree three with a given abstract group*, Canad. J. Math. 1 (1949),
  365–378.
- P. Erdős, A. Rényi, *Asymmetric graphs*, Acta Math. Acad. Sci. Hungar. 14 (1963), 295–315.
- L. Babai, *Long cycles in vertex-transitive graphs*, J. Graph Theory 3 (1979), 301–304.

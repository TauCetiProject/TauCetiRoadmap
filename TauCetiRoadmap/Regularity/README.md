# Roadmap: graph regularity, finite weak regularity, and arity-3 hypergraph complexes

**Summary.** A regularity lemma cuts a large finite structure into boundedly many pieces between
which it looks random. A counting lemma then predicts how often a small pattern occurs from the
sizes of the pieces and the densities between them. This roadmap is the finite, combinatorial
regularity tower for graphs and for colorings of triples, with no analytic prerequisites.
Throughout, the vertex set V is finite, vertex partitions are partitions of all of V, densities are
zero on an empty support, and copies are labelled: they are counted as injective maps, without
dividing by automorphisms.

For graphs, the tower consists of weak regularity after Frieze and Kannan (for ε > 0, every finite
graph has a partition into at most 4^⌈1/ε²⌉ parts whose densities predict the number of edges
between any two vertex sets to within ε|V|²), Szemerédi's lemma relative to a seed partition, and
strong regularity, whose coarse densities predict the labelled induced copies of every graph on
three vertices to within (15τ + 3√ε)|V|³ + 6m|V|², for fine uniformity τ and coarse cells of at
most m vertices. For
colorings of the triples the objects are triadic complexes. A triadic complex consists of vertex
cells, a coloring of the ordered distinct pairs, and polyads. A polyad is three cells together with
three pair colors. A coloring of the triples is top-regular over a polyad when its relative
densities do not change on unions of boundedly many subpolyads that carry a fixed fraction of the
polyad.

The headline theorem is the strong arity-3 regular approximation theorem. Fix a finite palette, an
error ε > 0, a positive error schedule F, a rank schedule R ≥ 1 and a number t₀ of cells. There is
a bound B such that every coloring H of the triples of a set with at least B elements has two
companions. The first is a coloring H′ that disagrees with H on at most ε|V|³/6 triples. The
second is a triadic complex C of complexity at most B with the following properties. Its vertex
cells form an equipartition into at least t₀ cells, and its polyads decompose the
injective triples. Its pair coloring is regular at F of its number of cells plus pair colors. H′ is
top-regular over all its polyads except an ε-proportion, at tolerance F(complexity) and rank
R(complexity). The second headline composes this with induced counting. At explicit counting
parameters depending on ε and on the number k of pattern vertices, the labelled induced copies in
H of a fixed colored pattern on k vertices agree with the prediction to within ε|V|^k. The
prediction is computed from the cell sizes, the pair-color densities and the relative densities
of H′.

The roadmap builds on Mathlib's Szemerédi regularity lemma, its uniformity predicates and its
equipartitions. Dense graph limits (graphons, the analytic cut norm, analytic weak regularity and
the homomorphism densities of finite graphs) are a separate analytic theory, the roadmap
DenseGraphLimits; comparison theorems here identify the finite energy and cut discrepancy with
their graphon counterparts. The roadmap Exchangeability owns exchangeable arrays and their
representation theorems, which are not targets here, and CoboundaryExpansion uses the graded
hypergraph complexes. Layers 0 to 4 below are the graph tower and Layers 5 to 9 the arity-3 tower.

## How to read the build

Layers 0 to 4 use only Mathlib and the layers before them. Layer 0 fixes the carriers: uniform
hypergraphs (§0.1), colorings of triples and colored patterns with their labelled induced copies
(§0.2), and the homomorphism densities of uniform hypergraphs (§0.3). Layer 1 defines block
densities and the size-weighted energy of graphs and uniform hypergraphs, with the refinement
identities that drive every energy increment. Layer 2 proves Szemerédi's lemma relative to a seed
partition, Layer 3 the finite Frieze–Kannan theorem, and Layer 4 strong graph regularity with the
induced counting of three-vertex graphs.

The arity-3 tower runs: the lower skeleton (Layer 5) → polyads and relative densities (Layer 6) →
top regularity (Layer 7) → the strong approximation (Layer 8) → induced counting (Layer 9). Layers
5 to 7 use Layer 0 and no graph layer. Layer 8 uses Layers 5 to 7, and its proof route uses
Layer 2 and Mathlib's Szemerédi lemma. Layer 9 uses Layers 0 and 5 to 8. The comparisons with
dense graph limits (§1.4, §3.3 and the last bullet of §0.3) need DenseGraphLimits and are inputs to
no proof of this roadmap. Each *Needs:* line lists the inputs of its statement and of its route, so
that a target proved by another route is not blocked behind an unrelated one. A target that the
pinned Tau Ceti realises ends with a line *In Tau Ceti:* naming the declarations.

## Conventions

1. **Graphs.** Mathlib's `SimpleGraph V` with `[Fintype V]` and `[DecidableEq V]`; a matrix or
   kernel view is an adapter, not a replacement for the graph type. Edge densities are Mathlib's
   `SimpleGraph.edgeDensity` over ordered pairs, `d(A, B) = #{(a, b) ∈ A × B | a ~ b} / (|A| |B|)`,
   also for `A = B`, where the denominator is `|A|²` and not `|A|(|A| − 1)`.
2. **Partitions.** `Finpartition (univ : Finset V)`, with Mathlib's `Finpartition.IsEquipartition`,
   `Finpartition.equitabilise` and `Finpartition.IsUniform`. The order `P ≤ Q` means that `P`
   refines `Q`. Parts are nonempty, so a partition of `V` has at most `|V|` parts.
3. **Hypergraphs and counting.** An `r`-uniform hypergraph `TauCeti.UniformHypergraph r V` has
   unordered finite edges of size `r`. Counts use ordered injective tuples. Pair colors are defined
   on the ordered distinct pairs `{p : V × V // p.1 ≠ p.2}`, and polyad supports consist of
   injective triples `Fin 3 → V`. Densities are zero when the denominator is zero; identities
   asserting total density one assume nonempty support. Homomorphism densities divide by `|V|^k`
   and injective densities by the falling factorial `(|V|)_k`, Mathlib's `Nat.descFactorial`.
4. **Complexes.** A triadic complex `TauCeti.TriadicComplex3 V` bundles vertex cells, a pair palette
   `Fin m` that the complex chooses, a coherent coloring of the ordered distinct pairs and a finite
   family of polyads. Its complexity is the computed sum of the numbers of vertex cells, pair colors
   and polyads, so a bound on the complexity bounds each of them. No top palette is attached to a
   triadic complex; it enters only through a coloring. Graded complexes
   `TauCeti.HypergraphComplex r V` are indexed by face cardinality, not simplicial dimension: a
   triple has level 3 and dimension 2.
5. **Colors.** `TauCeti.Colored3Graph κ₃ V` is a total coloring of the unordered triples, hence
   symmetric. The lower palette is separate. Relative densities and top regularity are indexed by
   color. A nonedge is one of the palette values, so induced counting controls absence as well as
   presence.
6. **Schedules.** The local error is a function `F : ℕ → ℝ` with positive values. Lower-skeleton
   regularity uses `F` at the number of vertex cells plus the number of pair colors, and top
   regularity uses `F C.complexity`. The rank is a function `R : ℕ → ℕ` with `1 ≤ R n`, chosen
   before regularization and evaluated at `C.complexity`. A constant rank is a special case. Every
   schedule is chosen before the complexity bound it determines and is evaluated only at the
   complex that is returned.
7. **Endpoint.** The roadmap ends at regularity together with induced counting for fixed finite
   colored three-uniform patterns. Induced removal, arithmetic applications and representation
   theorems for exchangeable arrays are not targets of this roadmap.
8. **Pair regularity and the route budget.** Lower-skeleton regularity
   (`TauCeti.PairSkeleton3.IsPairColorRegular`) is coordinatewise. The density of each pair color is
   controlled separately, on all large enough subsets of every ordered pair of cells, a cell paired
   with itself included. Under a coordinatewise predicate the error along one route is uniform in
   the cell volume rather than weighted by mass. So the per-route error budget
   `TauCeti.routeBudget3` divides the available error by the largest possible number of pair-color
   routes over one placement, `max(1, m^(k choose 2))` for `m` pair colors and `k` pattern vertices.
   The predicate and the divisor are a matched pair. With the coordinatewise predicate and no
   divisor, the per-route errors do not add up to the global error. The divisor could be dropped
   only under an aggregate predicate controlling the palette as a whole.
9. **Rank.** Top regularity at rank `r` is tested on unions of at most `r` subpolyads. A subpolyad
   selects arbitrary subgraphs of the three pair graphs of its polyad, as in Rödl–Schacht
   (*Regularity Lemmas*, Definition 15) and Nagle–Rödl–Schacht (Definition 9), not only vertex
   boxes. The approximation theorem of §8.2 accepts every rank schedule `R ≥ 1`. The induced
   counting of §9.4 needs rank one only (§9.2), so every such schedule serves it.
10. **Names.** Tau Ceti's declarations used here live in the namespaces `TauCeti`, `SimpleGraph`,
    `Finpartition` and `TauCeti.DenseGraphLimits`. The graph targets of Layers 1 to 4 belong under
    `TauCeti/Combinatorics/Regularity/` and the hypergraph targets of Layers 0 and 5 to 9 under
    `TauCeti/Combinatorics/Hypergraph/`. The acceptance file `Suggested.lean` states the headline
    theorems in `TauCetiRoadmap.Regularity`.

## Layer 0: finite colored graph and 3-uniform vocabulary

This layer fixes the finite carriers of Conventions 3 and 5 and the homomorphism densities of
uniform hypergraphs.

### 0.1 Uniform hypergraphs

An `r`-uniform hypergraph on a type `V` is a finite set of `r`-element subsets of `V`, its edges
(`TauCeti.UniformHypergraph r V`). The empty hypergraph has no edges, and for finite `V` the
complete one has every `r`-element subset as an edge. For finite `V` with `n = |V|`, the edge
density of `H` is `|E(H)| / (n choose r)`, which is `0` when `n < r`. A graph `G` on `V` is the
`2`-uniform hypergraph `G.toUniformHypergraph` whose edges are the pairs `{u, v}` with `u ~ v`.
Mathlib's `Hypergraph` is a set-based carrier with no uniformity, finiteness, density or counting
API. The bridge to it sends `H` to the Mathlib hypergraph whose vertex set is all of `V` and whose
edges are the edges of `H` read as sets. The finite representation is the public one: every layer
states its densities and counts over it.

- The number of edges is at most `n choose r`, with equality for the complete hypergraph.
- The edge density lies in `[0, 1]`. It is `0` for the empty hypergraph, `1` for the complete one
  when `r ≤ n`, and `0` for every `r`-uniform hypergraph when `n < r`.
- The bridge has the whole host as vertex set, and a finite set is an edge of the bridge exactly
  when it is an edge of `H`.

*Needs:* Mathlib `Hypergraph`, `Finset.powersetCard`, `Nat.choose`, `SimpleGraph`.

**Checks.**
- For `r = 3` and `n = 4`, the complete hypergraph has `4` edges and density `1`, and the
  hypergraph with edges `{0, 1, 2}` and `{0, 1, 3}` has density `1/2`. Normalizing by the number
  `(4)_3 = 24` of ordered triples instead of `4 choose 3 = 4` would give the complete hypergraph
  density `1/6`.

*In Tau Ceti:* `TauCeti.UniformHypergraph`, `TauCeti.UniformHypergraph.empty`,
`TauCeti.UniformHypergraph.complete`, `TauCeti.UniformHypergraph.edgeDensity`,
`TauCeti.UniformHypergraph.card_edges_le`, `TauCeti.UniformHypergraph.card_edges_complete`,
`TauCeti.UniformHypergraph.edgeDensity_nonneg`, `TauCeti.UniformHypergraph.edgeDensity_le_one`,
`TauCeti.UniformHypergraph.edgeDensity_empty`, `TauCeti.UniformHypergraph.edgeDensity_complete`,
`TauCeti.UniformHypergraph.edgeDensity_eq_zero_of_card_lt`,
`TauCeti.UniformHypergraph.toHypergraph`, `TauCeti.UniformHypergraph.toHypergraph_vertexSet`,
`TauCeti.UniformHypergraph.toHypergraph_edgeSet`,
`TauCeti.UniformHypergraph.coe_mem_toHypergraph_edgeSet`, `SimpleGraph.toUniformHypergraph`,
`SimpleGraph.mem_toUniformHypergraph_edges`.

### 0.2 Colorings of triples and colored patterns

A coloring of the triples of `V` with palette `κ` assigns a color to every three-element subset of
`V` (`TauCeti.Colored3Graph κ V`, Convention 5). A finite colored 3-pattern with palette `κ` is a
number `k` of labelled vertices together with a coloring of the triples of `Fin k`
(`TauCeti.FiniteColored3Pattern κ`); its color on `i < j < l` is its triple color. An embedding
`f : Fin k ↪ V` is a labelled induced copy of a pattern `F₀` in `H` when the pullback of `H` along
`f` is the coloring of `F₀`: `f` carries every triple of `F₀` to a triple of `H` of the same
color, so the nonedge colors are matched as well as the edge colors. The labelled induced copy
count `inducedCopyCount H F₀` is the number of these embeddings, without dividing by
automorphisms.

- Pulling back along the identity changes nothing, and pulling back along a composite of
  embeddings is the composite of the pullbacks.
- For finite `V` with `n = |V|`, the induced copy count is at most `(n)_k`, and it is `0` when
  `n < k`.
- A pattern with fewer than three vertices has no triple, so every injection is an induced copy and
  the count is `(n)_k`.
- A constant coloring of color `c` has `(n)_k` induced copies of the constant pattern of color `c`
  on `k` vertices, and none of a pattern that uses another color.

*Needs:* Mathlib `Set.powersetCard`, `Nat.descFactorial`.

**Checks.**
- Color the triple `{0, 1, 2}` of `V = {0, 1, 2, 3}` red and the other three triples blue. The
  pattern on three vertices with its triple red has `3! = 6` labelled induced copies; a count
  dividing by automorphisms would give `1`. The pattern on four vertices with all four triples blue
  has no induced copy, since every bijection carries some triple onto `{0, 1, 2}`. A count asking
  only that the red triples of the pattern go to red triples would accept all `24` bijections.

*In Tau Ceti:* `TauCeti.Colored3Graph`, `TauCeti.Colored3Graph.comap`,
`TauCeti.Colored3Graph.comap_refl`, `TauCeti.Colored3Graph.comap_comap`,
`TauCeti.FiniteColored3Pattern`, `TauCeti.FiniteColored3Pattern.tripleColor`,
`TauCeti.Colored3Graph.IsInducedCopy`, `TauCeti.Colored3Graph.inducedCopyCount`,
`TauCeti.Colored3Graph.inducedCopyCount_le`,
`TauCeti.Colored3Graph.inducedCopyCount_eq_zero_of_card_lt`,
`TauCeti.Colored3Graph.inducedCopyCount_of_lt_three`, `TauCeti.Colored3Graph.inducedCopyCount_const`,
`TauCeti.Colored3Graph.inducedCopyCount_const_eq_zero`.

### 0.3 Homomorphism and injective densities of uniform hypergraphs

Let `F` be an `r`-uniform hypergraph on a finite type `U` with `k = |U|`, and `H` an `r`-uniform
hypergraph on `V` with `n = |V|`, both `TauCeti.UniformHypergraph`. A homomorphism `F → H` is a
map `f : U → V` sending every edge `e` of `F` onto an edge `f(e)` of `H`. Since the edges of `H`
have `r` elements, `f` is injective on every edge of `F`. Define the following four quantities,
as Lovász and Szegedy do for graphs (*Limits of dense graph sequences*, §1 and §2.4):

- the homomorphism count `hom(F, H)`, the number of homomorphisms;
- the injective count `inj(F, H)`, the number of injective homomorphisms, which are the labelled
  copies of `F` in `H` (they preserve edges and need not be induced);
- the homomorphism density `t(F, H) = hom(F, H) / n^k`;
- the injective density `t₀(F, H) = inj(F, H) / (n)_k`, which is zero when `n < k`.

For `r = 2` these are the homomorphism densities of graphs (DenseGraphLimits, Layer 9a). A graph
homomorphism is exactly a homomorphism of the associated `2`-uniform hypergraphs, because adjacent
vertices are distinct.

- Both densities lie in `[0, 1]`: `hom(F, H) ≤ n^k` and `inj(F, H) ≤ (n)_k`, and
  `inj(F, H) ≤ hom(F, H)`.
- If `F` has no edges, then `hom(F, H) = n^k` and `inj(F, H) = (n)_k`. So `t(F, H) = 1` for
  `n ≥ 1`, and `t₀(F, H) = 1` for `n ≥ k`.
- Suppose `n ≥ k`. In the complete `r`-uniform hypergraph `TauCeti.UniformHypergraph.complete r V`
  every injective map is a homomorphism, so `t₀(F, H) = 1`. If `F` has an edge, both densities
  vanish in the empty hypergraph `TauCeti.UniformHypergraph.empty r V`.
- Both counts are monotone in the host: if every edge of `H` is an edge of `H'`, then
  `hom(F, H) ≤ hom(F, H')` and `inj(F, H) ≤ inj(F, H')`. Both counts are invariant under relabelling
  the vertices of `F` or of `H` along an equivalence.
- For the pattern with a single edge `U` (so `k = r`), `inj(F, H) = hom(F, H) = r! · |E(H)|`. Its
  injective density is the edge density of §0.1, `|E(H)| / (n choose r)`, both sides being zero for
  `n < r`.
- For graphs `F` on `U` and `G` on `V`, the densities of `F.toUniformHypergraph` in
  `G.toUniformHypergraph` are `TauCeti.DenseGraphLimits.homDensityFin F G` and
  `TauCeti.DenseGraphLimits.injHomDensity F G`.

*Needs:* §0.1; DenseGraphLimits `TauCeti.DenseGraphLimits.homDensityFin`,
`TauCeti.DenseGraphLimits.injHomDensity`; Mathlib `Nat.descFactorial`, `SimpleGraph.Hom`.

**Checks.**
- The pattern with one triple on three vertices, in a 3-uniform host with `m` edges on `n`
  vertices: `hom = inj = 6m`, so `t₀ = m / (n choose 3)` is the edge density and `t = 6m / n³`. On
  six vertices with four edges, `t₀ = 1/5` and `t = 1/9`. Normalizing the injective count by
  `n choose 3` instead of `(n)_3` would give `6/5`, outside `[0, 1]`.
- Let `H` be the complete 3-uniform hypergraph on `{0, 1, 2, 3}` minus the edge `{1, 2, 3}`, and
  `F` the pattern with edges `{0, 1, 2}` and `{0, 1, 3}` on four vertices. Then `inj(F, H) = 12`,
  so `t₀ = 1/2`, and `hom(F, H) = 30`, so `t = 15/128`. The 18 non-injective homomorphisms send the
  two vertices outside the shared pair to one vertex; a homomorphism count that required
  injectivity would give 12. In the complete hypergraph on four vertices, `inj = 24` (`t₀ = 1`) and
  `hom = 48` (`t = 3/16`).
- For `r = 2`, the path `a – b – c` and `F = K₂`: `hom = inj = 4`, `t = 4/9`, and
  `t₀ = 4/6 = 2/3`, the edge density `2 / (3 choose 2)` of the path.
- The edgeless pattern on four vertices in a host with three vertices: `t = 81/81 = 1`, while
  `t₀ = 0` by the zero-denominator convention, since `(3)_4 = 0` and there is no injective map. A
  definition taking the injective density of an edgeless pattern to be `1` outright would give `1`
  here.

### Examples

- The triangle in itself: `hom(K₃, K₃) = inj(K₃, K₃) = 6`, so `t = 6/27 = 2/9` and `t₀ = 6/6 = 1`.
- The 4-cycle `C₄` and `F = K₂`: `hom(K₂, C₄) = inj(K₂, C₄) = 8`, so `t = 8/16 = 1/2` and
  `t₀ = 8/12 = 2/3`, the edge density of `C₄`.
- On `n ≥ r` vertices the complete `r`-uniform hypergraph has edge density `1` and the empty one
  `0`. For `r > n` every `r`-uniform hypergraph on `V` is empty and its edge density is `0`, since
  `n choose r = 0`.

### Dependencies

Mathlib's `Hypergraph`, finite powersets and falling factorial; for the comparison at `r = 2` in
§0.3, the graph homomorphism densities of DenseGraphLimits Layer 9a. No other layer of this
roadmap.

## Layer 1: partitions, block densities, refinement, energy

This layer defines the densities of a partition and the size-weighted energy whose increments
drive Layers 2 to 4, for graphs and for uniform hypergraphs. Mathlib's unweighted
`Finpartition.energy` and its `SzemerediRegularity.increment` boost are a proof template, not an
input: that energy is not monotone under arbitrary refinement, so the boost does not transport to
the size-weighted energy.

### 1.1 Block densities of uniform hypergraphs

For an `r`-uniform hypergraph `H` on `V` and a finite set `s` of vertices, the block density of `H`
in `s` is the number of edges of `H` contained in `s`, divided by `|s| choose r`; it is `0` when
`|s| < r`.

- The block density lies in `[0, 1]` and is `0` when `|s| < r`.
- It is `0` for the empty hypergraph, and `1` for the complete one when `r ≤ |s|`.
- On the whole vertex set it is the edge density of §0.1.

*Needs:* §0.1.

*In Tau Ceti:* `TauCeti.UniformHypergraph.blockDensity`,
`TauCeti.UniformHypergraph.blockDensity_nonneg`, `TauCeti.UniformHypergraph.blockDensity_le_one`,
`TauCeti.UniformHypergraph.blockDensity_eq_zero_of_card_lt`,
`TauCeti.UniformHypergraph.blockDensity_empty`, `TauCeti.UniformHypergraph.blockDensity_complete`,
`TauCeti.UniformHypergraph.blockDensity_univ`.

### 1.2 The size-weighted energy of a graph partition

Let `G` be a graph on a finite `V` with `n = |V|`, and `P` a partition of `V`. The size-weighted
energy of `P` is

```text
weightedEnergy G P = ∑ A, B ∈ P, (|A| |B| / n²) · d(A, B)²,
```

summed over all ordered pairs of parts, the diagonal blocks `A = B` included, with `d(A, A)` over
`|A|²` (Convention 1). For a refinement `Q ≤ P`, the parent `π(B)` of a part `B` of `Q` is the part
of `P` containing it. Put `w(B, D) = |B| |D| / n²` and `Δ(B, D) = d(B, D) − d(π(B), π(D))` for
parts `B`, `D` of `Q`.

- The energy lies in `[0, 1]`. It is the mean square of the block-average step function,
  `(1/n²) ∑ x, y ∈ V, d(P(x), P(y))²`, where `P(x)` is the part containing `x`.
- Refinement defect identity: for `Q ≤ P`,
  `∑ B, D ∈ Q, w(B, D) Δ(B, D)² = weightedEnergy G Q − weightedEnergy G P`. Neither equitability nor
  regularity is assumed, and on the empty host both sides vanish.
- Monotonicity: if `Q ≤ P`, then `weightedEnergy G P ≤ weightedEnergy G Q`.
- Absolute deviation: if `Q ≤ P` and `weightedEnergy G Q − weightedEnergy G P ≤ ε`, then
  `∑ B, D ∈ Q, w(B, D) |Δ(B, D)| ≤ √ε`.

*Route.* A coarse density is the size-weighted average of the fine densities below it. Expanding
the square gives the identity, and weighted Cauchy–Schwarz, with weights summing to at most one,
gives the `√ε` bound. *Needs:* Mathlib `SimpleGraph.edgeDensity`, `Finpartition`.

**Checks.**
- Let `G = K_{2,1}` with parts `A = {a₁, a₂}` and `B = {b}`, edges `a₁b` and `a₂b`, and let
  `P = {A, B}`. The size-weighted energy is `2 · (2/9) · 1² = 4/9`; the diagonal blocks contribute
  `0`, since `d(A, A) = 0/4` over the ordered pairs of `A`. The refinement into singletons also has
  weighted energy `4/9`, at least that of `P` as monotonicity requires. Mathlib's unweighted
  `Finpartition.energy` drops from `1/2` to `4/9` under the same refinement: it averages over the
  ordered pairs of distinct parts without size weights, and it is not monotone under arbitrary
  refinement.

*In Tau Ceti:* `SimpleGraph.weightedEnergy`, `SimpleGraph.weightedEnergy_nonneg`,
`SimpleGraph.weightedEnergy_le_one`, `SimpleGraph.weightedEnergy_eq_sum_part`,
`Finpartition.refinementParent`, `SimpleGraph.weightedDensityDeviation_sq`,
`SimpleGraph.weightedEnergy_mono_of_refines`, `SimpleGraph.weightedDensityDeviation_abs_le`.

### 1.3 The size-weighted energy of a uniform hypergraph

Let `H` be an `r`-uniform hypergraph on a finite `V` with `n = |V|`. For sets `A₀, …, A_(r−1)` of
vertices, the box density of `H` is the proportion of the tuples `x` with `x_i ∈ A_i` for every `i`
whose entries form an edge of `H`; it is `0` when some `A_i` is empty. The size-weighted energy of
a partition `P` of `V` is the sum, over all `r`-tuples `(A_0, …, A_(r−1))` of parts of `P`, repeated
parts included, of `(∏ |A_i| / n^r) · boxDensity(A)²`. For a tuple `x ∈ V^r` write `d_P(x)` for the
box density of the parts of `P` through its entries.

- The energy lies in `[0, 1]` and is the mean square of `d_P` over the `n^r` tuples.
- Refinement defect identity: for `Q ≤ P`, `(1/n^r) ∑ x ∈ V^r, (d_Q(x) − d_P(x))²` is the energy
  of `Q` minus the energy of `P`. So the energy is monotone under refinement.
- If the energy gap from `P` to `Q ≤ P` is at most `ε`, then
  `∑ x ∈ V^r, |d_Q(x) − d_P(x)| ≤ √ε · n^r`.
- For a graph `G`, the box density of `G.toUniformHypergraph` on `(A₀, A₁)` is `d(A₀, A₁)`, and its
  energy is the graph energy of §1.2.

*Needs:* §0.1; §1.2 for the comparison with graphs.

*In Tau Ceti:* `TauCeti.UniformHypergraph.boxDensity`, `TauCeti.UniformHypergraph.weightedEnergy`,
`TauCeti.UniformHypergraph.weightedEnergy_nonneg`, `TauCeti.UniformHypergraph.weightedEnergy_le_one`,
`TauCeti.UniformHypergraph.weightedEnergy_eq_sum_part`,
`TauCeti.UniformHypergraph.weightedDensityDeviation_sq`,
`TauCeti.UniformHypergraph.weightedEnergy_mono_of_refines`,
`TauCeti.UniformHypergraph.sum_abs_boxDensity_part_sub_le`,
`SimpleGraph.boxDensity_toUniformHypergraph`, `SimpleGraph.weightedEnergy_toUniformHypergraph`.

### 1.4 Comparison with the graphon partition energy

Let `G` be a graph on `Fin m` with `m > 0` and `P` a partition of its vertices. Then the
size-weighted energy of `P` is the partition energy `TauCeti.DenseGraphLimits.graphonPartitionEnergy`
of the graphon `TauCeti.DenseGraphLimits.finiteGraphGraphon G` over the partition
`P.cellPartition` of the unit interval whose parts are the unions of the equal vertex subintervals
over each part of `P`. There is no normalization mismatch: `edgeDensity A B` counts ordered
adjacent pairs in `A × B`, matching the graphon integral and the weights `|A| |B| / m²`, diagonal
blocks included. A graph on a nonempty finite `V` is transported along `V ≃ Fin m`; the energy of
the empty host is degenerate on both sides. This comparison serves DenseGraphLimits and is an input
to no proof of this roadmap. *Needs:* §1.2; DenseGraphLimits
`TauCeti.DenseGraphLimits.finiteGraphGraphon`, `TauCeti.DenseGraphLimits.graphonPartitionEnergy`;
Tau Ceti `Finpartition.cellPartition`.

*In Tau Ceti:* `SimpleGraph.graphonPartitionEnergy_finiteGraphGraphon`,
`SimpleGraph.graphonPartitionEnergy_finiteGraphGraphon_comap_symm`.

### Examples

- For the triangle `K₃` and the partition into one part, `d(V, V) = 6/9`, so the energy is `4/9`.
  The partition into singletons has energy `6/9 = 2/3`, the proportion of ordered adjacent pairs.
  The gap `2/9` is the weighted square deviation: the six adjacent pairs contribute
  `6 · (1/9)(1/3)²` and the three diagonal pairs `3 · (1/9)(2/3)²`. The weighted absolute
  deviation is `4/9 ≤ √(2/9)`.
- For the complete 3-uniform hypergraph on three vertices and the partition into one part, `6` of
  the `27` tuples of `V³` have distinct entries, so the box density is `2/9` and the energy is
  `4/81`.

### Dependencies

Mathlib's edge densities and partitions; §0.1 for §§1.1 and 1.3; DenseGraphLimits for §1.4.

## Layer 2: Szemerédi graph regularity bridge

Mathlib's `szemeredi_regularity` takes no seed and relates its output to nothing, and the seed
cannot be recovered afterwards. Uniformity does not pass to refinements, so a regular partition
cannot be refined after the fact, and the common refinement with the seed loses equitability. This
layer runs the energy induction from an equipartition that almost refines the seed; Mathlib's
`SzemerediRegularity.increment` supplies the analytic step of each round.

### 2.1 Almost-refinement

Let `P` and `P₀` be partitions of a finite set `s` and `δ ∈ ℝ`. Then `P` almost refines `P₀` up to
`δ` when every part `A` of `P₀` contains a family of parts of `P`, each of them contained in `A`,
whose union misses at most `δ |A|` elements of `A`. The containment of each selected part in its
parent cell is part of the definition: the bound is per cell, not a global exceptional mass.

- Equivalently, for every part `A` of `P₀`, the parts of `P` contained in `A` cover all but at most
  `δ |A|` elements of `A`.
- Almost-refinement is monotone in `δ`, and an exact refinement `P ≤ P₀` almost refines `P₀` up to
  every `δ ≥ 0`.
- Exact refinement transports almost-refinement: if `Q ≤ P` and `P` almost refines `P₀` up to
  `δ`, then so does `Q`.

*Needs:* Mathlib `Finpartition`.

**Checks.**
- Let `s = {1, …, 10}`, `P₀ = {{1}, {2, …, 10}}` and `P = {{1, 2}, {3, …, 10}}`. No part of `P`
  lies in `{1}`, so `P` almost refines `P₀` only up to `δ ≥ 1`. A global notion counting the
  elements outside the parts of `P` that lie in a part of `P₀` would find two of ten, and accept
  `δ = 1/5` while the cell `{1}` is lost.

*In Tau Ceti:* `Finpartition.AlmostRefines`, `Finpartition.almostRefines_iff`,
`Finpartition.AlmostRefines.mono`, `Finpartition.almostRefines_of_le`,
`Finpartition.AlmostRefines.mono_left`.

### 2.2 An initial equitable partition almost refining the seed

If `P` is an equipartition of `s` into `k` parts, `0 < n ≤ |s|` and `2k ≤ δ n`, then some
equipartition of `s` into exactly `n` parts almost refines `P` up to `δ`. This is where
divisibility forces the `δ` of almost-refinement: `Finpartition.equitabilise` leaves at most
`|s| / n` elements of each part of `P` uncovered. *Needs:* §2.1; Mathlib
`Finpartition.equitabilise`.

*In Tau Ceti:* `Finpartition.IsEquipartition.exists_equipartition_card_eq_almostRefines`.

### 2.3 Szemerédi regularity relative to a seed

The seeded run of the energy induction: let `G` be a graph on a finite `V`, and `P₁` an
equipartition with at least `7` parts and `100 ≤ 4^#P₁ · ε⁵`. Put
`s = stepBound^[⌊4/ε⁵⌋] (#P₁)`, Mathlib's `SzemerediRegularity.stepBound` iterated. If
`s · 16^s ≤ |V|`, then some `ε`-uniform equipartition refines `P₁` and has at most
`stepBound^[⌊4/ε⁵⌋ + 1] (#P₁)` parts.

The theorem: for every equipartition `P₀` of the vertices of a finite graph `G` and every `ε > 0`,
there is an `ε`-uniform equipartition `P` that almost refines `P₀` up to `ε` and has at most
`refiningRegularityBound ε #P₀` parts, where `refiningRegularityBound ε l` is Mathlib's bound
`SzemerediRegularity.bound ε ⌈2l/ε⌉` and depends only on `ε` and `l`. No large-host hypothesis is
needed: on a host with at most that many vertices the partition into singletons serves. So all but
an `ε`-proportion of the pairs of distinct parts are uniform, the number of parts is bounded
independently of the graph, and the seed is almost refined: this is the input that strong
regularity (Layer 4) iterates on.

*Route.* On a larger host, take an equipartition with `SzemerediRegularity.initialBound ε ⌈2 #P₀ / ε⌉`
parts almost refining `P₀` up to `ε` (§2.2), run the seeded induction from it, and transport
almost-refinement along the exact refinement (§2.1). *Needs:* §§2.1–2.2; Mathlib
`szemeredi_regularity`, `SzemerediRegularity.increment`, `SzemerediRegularity.bound`,
`SzemerediRegularity.initialBound`, `SzemerediRegularity.stepBound`, `Finpartition.IsUniform`.

*In Tau Ceti:* `SimpleGraph.szemeredi_regularity_le`, `TauCeti.refiningRegularityBound`,
`SimpleGraph.exists_regular_equipartition_almost_refining`.

### Examples

- On a host with at most `refiningRegularityBound ε #P₀` vertices the partition into singletons is
  an `ε`-uniform equipartition for every `ε > 0`, refines `P₀` exactly, and has at most that many
  parts.
- For the empty graph every pair of nonempty sets has density `0`, so every equipartition is
  `ε`-uniform for every `ε > 0`, and the seed `P₀` is its own regular almost-refinement.

### Dependencies

Mathlib's Szemerédi regularity lemma, its energy increment, uniformity and equitabilisation. No
earlier layer: the size-weighted energy of Layer 1 is not used by the seeded induction, which runs
on Mathlib's energy.

## Layer 3: finite weak regularity

### 3.1 Stepped counts and the cut discrepancy

Let `G` be a graph on a finite `V` with `n = |V|`, and `P` a partition of `V`. For sets `A`, `B` of
vertices, the stepped count is the number of edges from `A` to `B` predicted by `P`,

```text
steppedCount G P A B = ∑ C, D ∈ P, d(C, D) · |A ∩ C| · |B ∩ D|.
```

The cut discrepancy of `P` is the largest deviation, over all pairs `(A, B)` of vertex sets,
between the number `e(A, B)` of ordered pairs `(a, b) ∈ A × B` with `a ~ b` and the stepped count.
It is count-scaled: it lies between `0` and `n²`. The normalized analytic cut norm is compared in
§3.3.

- The stepped count is symmetric in `A` and `B`, vanishes when a side is empty, and lies between
  `0` and `|A| |B|`. It equals `e(A, B)` when `A` and `B` are unions of parts. For the partition
  into singletons it is `e(A, B)`, and for the partition into one part it is `d(V, V) |A| |B|`.
- The cut discrepancy is at most `c` exactly when every rectangle deviation `|e(A, B) −
  steppedCount G P A B|` is at most `c`. It is `0` for the partition into singletons.

*Needs:* Mathlib `SimpleGraph.interedges`, `SimpleGraph.edgeDensity`, `Finpartition`.

*In Tau Ceti:* `SimpleGraph.steppedCount`, `SimpleGraph.steppedCount_comm`,
`SimpleGraph.steppedCount_empty_left`, `SimpleGraph.steppedCount_nonneg`,
`SimpleGraph.steppedCount_le_card_mul_card`, `SimpleGraph.steppedCount_eq_card_interedges`,
`SimpleGraph.steppedCount_bot`, `SimpleGraph.steppedCount_top`, `SimpleGraph.cutDiscrepancy`,
`SimpleGraph.cutDiscrepancy_le_iff`, `SimpleGraph.cutDiscrepancy_nonneg`,
`SimpleGraph.cutDiscrepancy_le_card_sq`, `SimpleGraph.cutDiscrepancy_bot`.

### 3.2 The finite Frieze–Kannan theorem

For every finite graph `G` and every `ε > 0` there is a partition `P` of `V` into at most
`4^⌈1/ε²⌉` parts such that, for all sets `A` and `B` of vertices,
`|e(A, B) − steppedCount G P A B| ≤ ε |V|²` (Frieze–Kannan, *Quick approximation to matrices and
applications*). Equivalently, the cut discrepancy of `P` is at most `ε |V|²`. In the refining form,
every partition `P₀` is refined by a partition with at most `4^⌈1/ε²⌉ · #P₀` parts and cut
discrepancy at most `ε |V|²`. The layer has no graphon import and no analytic prerequisite.

*Route.* If the cut discrepancy of `P` exceeds `ε |V|²`, cutting the parts of `P` along a
witnessing rectangle gives a refinement with at most four times as many parts and energy more than
`ε²` larger (§1.2). The energy lies in `[0, 1]`, so at most `⌈1/ε²⌉` cuts occur. *Needs:* §3.1,
§1.2.

*In Tau Ceti:* `SimpleGraph.frieze_kannan`, `SimpleGraph.frieze_kannan_cutDiscrepancy`,
`SimpleGraph.frieze_kannan_refining`, `SimpleGraph.exists_refinement_weightedEnergy_add_sq_lt`.

### 3.3 Comparison with the graphon cut norm

Let `G` be a graph on `Fin m` with `m > 0` and `P` a partition of its vertices. The block-average
step graphon `TauCeti.DenseGraphLimits.stepGraphonAvg` of `finiteGraphGraphon G` over
`P.cellPartition` takes, at points of the subintervals of the vertices `i` and `j`, the value
`d(P(i), P(j))`: it is the step graphon of the partition. The cut norm of `finiteGraphGraphon G`
minus this step graphon is the cut discrepancy of `P` divided by `m²`. So the `SimpleGraph`
specialization of §3.2 is the analytic Frieze–Kannan statement of DenseGraphLimits up to the
scaling `|V|²`; the two theorems are independent formulations, neither derived from the other, and
this comparison is an input to no proof of this roadmap. *Needs:* §3.1; DenseGraphLimits
`TauCeti.DenseGraphLimits.finiteGraphGraphon`, `TauCeti.DenseGraphLimits.stepGraphonAvg`,
`TauCeti.DenseGraphLimits.cutNorm`; Tau Ceti `Finpartition.cellPartition`.

*In Tau Ceti:* `SimpleGraph.stepGraphonAvg_finiteGraphGraphon_cellPartition_apply`,
`SimpleGraph.cutNorm_finiteGraphGraphon_sub_stepGraphonAvg`.

### Examples

- For the 4-cycle, the complete bipartite graph between `{1, 2}` and `{3, 4}`, the cut discrepancy
  of the bipartition is `0`. For the partition into one part it is `2 = |V|²/8`, attained at the
  rectangle `({1, 2}, {3, 4})`. The cut discrepancy is count-scaled; the normalized graphon cut norm
  of the same difference is `1/8`.
- For the partition into singletons the stepped count is the true count on every rectangle, so the
  cut discrepancy is `0`.

### Dependencies

Layer 1 (the size-weighted energy and the refinement parent); Mathlib's edge counts; DenseGraphLimits
for §3.3 only.

## Layer 4: strong graph regularity

The goal of this layer is a pair of nested coarse and fine equipartitions with controlled energy
increment and complexity, and a counting lemma that uses them.

### 4.1 Exact refining regular equipartitions

For every equipartition `P` of the vertices of a finite graph and every `δ > 0`, there is a
`δ`-uniform equipartition `Q ≤ P` with at most `nestedRefinementBound δ #P` parts. The bound is
Szemerédi's bound started from `initialBound δ 0 · #P` parts; it depends only on `δ` and `#P`, and
is at least `#P`. On a small host the partition into singletons serves.

With a minimum number of parts: for every equipartition `P₀`, every `ε > 0` and every `l ≤ |V|`,
there is an `ε`-uniform equipartition almost refining `P₀` up to `ε` with at least `l` parts and at
most `nestedRefinementBound ε (max l₀ ⌈2 l₀ / ε⌉)` parts, where `l₀ = max l #P₀`.

*Route.* Split every part of `P` into `initialBound δ 0` parts of almost equal size and run the
seeded induction of §2.3 below this refinement. For the second statement, refine exactly an
equipartition into `max l₀ ⌈2 l₀ / ε⌉` parts almost refining `P₀` (§2.2), and transport
almost-refinement (§2.1). *Needs:* §§2.1–2.3; Mathlib `szemeredi_regularity`,
`SzemerediRegularity.initialBound`.

*In Tau Ceti:* `TauCeti.nestedRefinementBound`, `TauCeti.le_nestedRefinementBound`,
`SimpleGraph.exists_regular_exact_refining_equipartition`,
`SimpleGraph.exists_regular_almostRefines_le_card`.

### 4.2 Strong regularity witnesses

Let `ε ∈ ℝ`, `F : ℕ → ℝ` and `l₀ ∈ ℕ`. A strong regularity witness for a graph `G` at `(ε, F, l₀)`
is a pair of partitions `Q ≤ P` with: `P` and `Q` equipartitions; `P` `ε`-uniform; `Q` uniform at
`F(#P)`; `weightedEnergy G Q − weightedEnergy G P ≤ ε`; and
`#Q ≤ strongGraphRegularityBound ε F l₀`. The bound is `⌊1/ε⌋ + 1` rounds of a one-round bound
started from `nestedRefinementBound ε (max l₀ ⌈2 l₀ / ε⌉)`; it is at least `l₀` and does not depend
on the graph.

Strong graph regularity (Tao, *Szemerédi's regularity lemma revisited*; Zhao, ch. 2): let `ε > 0`,
let `F` be positive, let `P₀` be an equipartition of the vertices of a finite graph `G`, and let
`l ≤ |V|`. Then there is a strong regularity witness `(P, Q)` at `(ε, F, max l #P₀)` whose coarse
partition `P` almost refines `P₀` up to `ε` and has at least `l` parts.

*Route.* Start from the second statement of §4.1 with at least `l` parts, refine exactly at `min(ε, F(#P))` by §4.1, and
replace the coarse partition by the fine one while the energy gap exceeds `ε`. The energy lies in
`[0, 1]`, so this stops within `⌊1/ε⌋ + 1` rounds, and almost-refinement is transported along each
exact refinement (§2.1). *Needs:* §1.2, §§2.1 and 2.3, §4.1.

*In Tau Ceti:* `TauCeti.strongGraphRegularityBound`, `TauCeti.le_strongGraphRegularityBound`,
`SimpleGraph.StrongRegular`, `SimpleGraph.exists_strong_regular`.

### 4.3 Induced counting of three-vertex graphs

For a graph `J` on `Fin 3`, the labelled induced count `inducedGraphCount3 J G` is the number of
injective maps `g : Fin 3 → V` such that `g(i) ~ g(j)` in `G` exactly when `i ~ j` in `J`, without
dividing by automorphisms; it is the number of graph embeddings `J ↪g G`. For a partition `P` and
an assignment `φ` of the three vertices to parts of `P`, put `d_ij = d(φ(i), φ(j))` and
`f_ij(d) = d` when `J.Adj i j` and `1 − d` otherwise. The coarse prediction
`coarseInducedGraphEstimate J G P` is the sum, over injective assignments `φ` (three distinct
parts), of `∏ i, |φ(i)|` times `∏ i < j, f_ij(d_ij)`. It predicts all induced patterns, not only
triangles or edge-preserving homomorphisms.

Let `(P, Q)` be a strong regularity witness at `(ε, F, l₀)` with `τ = F(#P) > 0`, and suppose every
part of `P` has at most `m` vertices. Then, for every graph `J` on `Fin 3`,

```text
|inducedGraphCount3 J G − coarseInducedGraphEstimate J G P| ≤ (15τ + 3√ε) n³ + 6m n²,
```

with `n = |V|`. Only the refinement, the equitability and uniformity of `Q` and the energy gap are
used; the other conditions of a witness serve existence and complexity control.

- Rectangle discrepancy: if `(s, t)` is `τ`-uniform, then for `s' ⊆ s` and `t' ⊆ t`,
  `|e(s', t') − d(s, t) |s'| |t'|| ≤ τ |s| |t|`; the same bound holds for test functions on `s` and
  on `t` with values in `[0, 1]`.
- Three cells: if `A₀`, `A₁`, `A₂` are pairwise `τ`-uniform, the number of `g` with `g(i) ∈ A_i`
  and the adjacency pattern of `J` is within `3τ ∏ |A_i|` of `∏ |A_i| · ∏ i < j, f_ij(d(A_i, A_j))`.
- Bad pairs: Mathlib's `Finpartition.IsEquipartition.sum_nonUniforms_lt` bounds the mass of the
  non-uniform pairs of parts of `Q` by `4τ n²`, so the three pairs of an assignment cost at most
  `12τ n³`. With the `3τ n³` of the uniform triples this gives `15τ n³`.
- Energy transfer: define the stepped prediction `T_R(J)` like the coarse prediction but summed over
  all assignments, repeated parts included. For `Q ≤ P` with energy gap at most `ε`,
  `|T_Q(J) − T_P(J)| ≤ 3√ε n³`, with no equitability or regularity assumed and including `ε = 0`.
- Repeated cells: if every part has at most `m` vertices, all but at most `3m n²` labelled induced
  copies have their vertices in three distinct parts, and the stepped prediction exceeds the coarse
  one by at most `3m n²`. Refinement bounds the parts of `Q` by `m` too.

*Route.* Compare the count with the coarse prediction of `Q` (three cells, bad pairs, repeated
cells), pass to `T_Q(J)`, then to `T_P(J)` by the energy transfer, and back to the coarse
prediction of `P`. The empty host is handled directly. This statement and its route use only this
roadmap and Mathlib. *Needs:* §1.2, §4.2; Mathlib `SimpleGraph.IsUniform`,
`Finpartition.IsEquipartition.sum_nonUniforms_lt`.

*In Tau Ceti:* `SimpleGraph.inducedGraphCount3`, `SimpleGraph.inducedGraphCount3_eq_card_embedding`,
`SimpleGraph.coarseInducedGraphEstimate`, `SimpleGraph.IsUniform.abs_card_interedges_sub_le`,
`SimpleGraph.IsUniform.abs_sum_sum_mul_sub_le`, `SimpleGraph.abs_card_induced_fin_three_sub_le`,
`SimpleGraph.steppedInducedGraphCount3`, `SimpleGraph.abs_steppedInducedGraphCount3_sub_le`,
`SimpleGraph.inducedGraphCount3_le_sum_card_induced_add`,
`SimpleGraph.steppedInducedGraphCount3_le_coarseInducedGraphEstimate_add`,
`SimpleGraph.StrongRegular.inducedGraphCount3_estimate`.

### Examples

- On three-vertex hosts, `inducedGraphCount3` is `0` for the edgeless pattern in the triangle, `6`
  for the triangle in itself, and `2` for one edge plus an isolated vertex in itself. With the
  partition into singletons, the coarse prediction equals the induced count on every host. For the
  edgeless pattern it uses the three nonedge factors `1 − d`; for the triangle, the three edge
  densities.
- For the empty graph, every equipartition `P` with at most `l₀` parts gives the witness `(P, P)`
  at `(ε, F, l₀)` for `ε > 0` and positive `F`: every density vanishes, so every pair is uniform and
  the energy gap is `0`.

### Dependencies

Layers 1 and 2 (energy, almost-refinement, seeded regularity); Mathlib's uniformity and its
bad-pair bound for equipartitions.

## Layer 5: hypergraph complexes and the lower skeleton

The goal of this layer is the cell and pair-color data over which arity-3 regularity is measured.

### 5.1 Graded hypergraph complexes

A hypergraph complex of rank `r` on `V` (`TauCeti.HypergraphComplex r V`) consists, for each
`k ≤ r`, of a finite set of `k`-element subsets of `V`, the faces at level `k`, such that every
subset of a face is a face at the level of its cardinality, and the empty set is a face at level
`0`. The level is face cardinality, not dimension (Convention 4). Forgetting the empty face and the
grading gives Mathlib's `PreAbstractSimplicialComplex` whose faces are the nonempty faces. A Mathlib
complex with finitely many faces gives a hypergraph complex of rank `r` by keeping the faces of
cardinality at most `r` and adjoining the empty face. An injection `f : U ↪ V` is a copy of a
complex `C` on `U` in a complex `D` on `V` when it carries every face of `C` to a face of `D`;
nonfaces need not be preserved. The labelled copy count of `C` in `D` is the number of copies,
without quotienting by automorphisms.

- Level `0` is `{∅}`. A set is a face of the forgetful image exactly when it is a nonempty face.
- Round trips: forgetting and then adjoining the empty face recovers the hypergraph complex;
  adjoining and then forgetting recovers a finite Mathlib complex whose faces have at most `r`
  elements.
- The labelled copy count is at most `(|V|)_|U|`, equal to it when every injection is a copy, and
  `0` when `|V| < |U|` or when `C` has a face larger than the rank of `D`.

*Needs:* Mathlib `PreAbstractSimplicialComplex`, `Nat.descFactorial`.

*In Tau Ceti:* `TauCeti.HypergraphComplex`, `TauCeti.HypergraphComplex.faces_zero`,
`TauCeti.HypergraphComplex.toPreAbstractSimplicialComplex`,
`TauCeti.HypergraphComplex.mem_toPreAbstractSimplicialComplex`,
`TauCeti.HypergraphComplex.ofPreAbstractSimplicialComplex`,
`TauCeti.HypergraphComplex.mem_faces_ofPreAbstractSimplicialComplex`,
`TauCeti.HypergraphComplex.toPreAbstractSimplicialComplex_ofPreAbstractSimplicialComplex`,
`TauCeti.HypergraphComplex.ofPreAbstractSimplicialComplex_toPreAbstractSimplicialComplex`,
`TauCeti.HypergraphComplex.IsCopy`, `TauCeti.HypergraphComplex.labelledCopyCount`,
`TauCeti.HypergraphComplex.labelledCopyCount_le_descFactorial`,
`TauCeti.HypergraphComplex.labelledCopyCount_eq_descFactorial`,
`TauCeti.HypergraphComplex.labelledCopyCount_eq_zero_of_card_lt`,
`TauCeti.HypergraphComplex.labelledCopyCount_eq_zero_of_rank_lt`.

### 5.2 Pair-color systems and pair-color densities

A pair-color system on `V` with palette `κ` (`TauCeti.PairColorSystem κ V`) is a coloring of the
ordered distinct pairs together with an involution `rev` of `κ` such that the color of `(v, u)` is
`rev` of the color of `(u, v)`. The total color of `(u, v)` is the color of the pair for `u ≠ v`
and `none` on the diagonal; reversing the pair applies `rev`. Routes are indexed by the canonical
orientation `i < j`, the reverse color being recovered by `rev`. From a raw directed coloring `c`,
the coherent system with palette `κ × κ` colors `(u, v)` by `(c(u, v), c(v, u))` and reverses by
exchanging the coordinates; the palette size is squared. The pair-color density of a color `c` on
finite sets `(s, t)` is the number of ordered distinct pairs in `s × t` of color `c`, divided by the
number of ordered distinct pairs in `s × t`, and `0` when there is none.

- The pair-color density lies in `[0, 1]`.
- The densities over the palette sum to `1` when `s × t` contains an ordered distinct pair. Nonempty
  sets do not suffice: a singleton paired with itself has no distinct pair.
- The density of `rev c` on `(t, s)` is the density of `c` on `(s, t)`.
- The density is `0` on an empty side and on a singleton paired with itself.

*Needs:* Mathlib `Function.Involutive`.

**Checks.**
- A singleton cell paired with itself has no distinct pair, so every pair-color density on it is
  `0` and the densities sum to `0`. A density normalized by `|s| |t|` would sum to `0` here too but
  would give the edge color of a graph on a two-element cell paired with itself density `2/4`
  instead of `1`.

*In Tau Ceti:* `TauCeti.PairColorSystem`, `TauCeti.PairColorSystem.colorOfPair`,
`TauCeti.PairColorSystem.colorOfPair_swap`, `TauCeti.PairColorSystem.ofRaw`,
`TauCeti.pairColorDensity`, `TauCeti.pairColorDensity_nonneg`, `TauCeti.pairColorDensity_le_one`,
`TauCeti.sum_pairColorDensity`, `TauCeti.pairColorDensity_swap`,
`TauCeti.pairColorDensity_singleton_self`.

### 5.3 Lower skeletons and pair-color regularity

A lower skeleton (`TauCeti.PairSkeleton3 κ V`) is a partition of `V` into vertex cells together
with a pair-color system. A pair `(s, t)` of vertex sets is `ε`-regular for the pair-color system
when, for every color `c` and all `s' ⊆ s`, `t' ⊆ t` with `|s'| ≥ ε |s|` and `|t'| ≥ ε |t|`, the
density of `c` on `(s', t')` is within `ε` of its density on `(s, t)`. Each color is controlled
separately (Convention 8). The skeleton is `ε`-pair-color regular when every ordered pair of its
cells `(A, B)`, the pairs `(A, A)` included, is `ε`-regular, the test sets ranging over the subsets
of the cells. For a schedule `F` and a finite palette, the skeleton is lower-skeleton regular for
`F` when it is pair-color regular at `F(#cells + |κ|)` (Convention 6).

- Pair-color regularity is monotone in `ε` and holds for `ε ≥ 1`; a regular pair is regular in the
  reverse order. The skeleton whose cells are the singletons is `ε`-regular for every `ε > 0`.
- The arity-2 specialization: for a graph `G`, color the ordered distinct pairs by adjacency, with
  `rev` the identity. If the skeleton with cells `P` and this coloring is `ε`-pair-color regular,
  then `P` is `ε'`-uniform for `G` in Szemerédi's sense for every `ε' > ε`, with no non-uniform pair
  of distinct cells. Conversely, an `ε`-uniform pair of disjoint sets is `ε`-regular for both
  colors. The lower skeleton also tests a cell paired with itself, which Szemerédi's uniformity does
  not.

*Needs:* §5.2; Mathlib `Finpartition`, `SimpleGraph.IsUniform`, `Finpartition.IsUniform`.

*In Tau Ceti:* `TauCeti.PairSkeleton3`, `TauCeti.PairColorSystem.IsRegularPair`,
`TauCeti.PairColorSystem.IsRegularPair.symm`, `TauCeti.PairSkeleton3.IsPairColorRegular`,
`TauCeti.PairSkeleton3.IsPairColorRegular.mono`,
`TauCeti.PairSkeleton3.isPairColorRegular_of_one_le`,
`TauCeti.PairSkeleton3.isPairColorRegular_bot`, `TauCeti.PairSkeleton3.LowerSkeletonRegular`,
`SimpleGraph.toPairColorSystem`, `TauCeti.PairSkeleton3.IsPairColorRegular.isUniform`,
`SimpleGraph.IsUniform.isRegularPair_ofGraph`.

### Examples

- On `V = {0, 1}` with the raw directed coloring `c(0, 1) = a`, `c(1, 0) = b`, the coherent system
  colors `(0, 1)` by `(a, b)` and `(1, 0)` by `(b, a)`.
- For a graph `G` and two disjoint sets, the density of the edge color is Mathlib's edge density
  and that of the nonedge color is one minus it.
- Every complex on three labelled vertices has `6` labelled copies in the filled triangle, the
  complex of all subsets of `Fin 3`: copies preserve faces but need not preserve nonfaces.

### Dependencies

Mathlib's partitions, simplicial complexes and graph uniformity. No earlier layer of this roadmap:
the comparison with graph uniformity uses Mathlib's `SimpleGraph.IsUniform` directly.

## Layer 6: polyads, subpolyads, and relative density

The goal of this layer is the local supports on which top-level densities and regularity are
tested.

### 6.1 Polyads

Over a lower skeleton `S`, a polyad (`TauCeti.Polyad3 S`) is three vertex cells `c₀`, `c₁`, `c₂` of
`S` together with three pair colors `k₀₁`, `k₀₂`, `k₁₂` for the canonically oriented role pairs. Its
support is computed, not chosen: the injective triples `x` with `x_i ∈ c_i` and total color
`some k_ij` on `(x_i, x_j)` for `i < j`. Its pair graph on roles `i < j` is the set of ordered
distinct pairs `(u, v)` with `u ∈ c_i`, `v ∈ c_j` and color `k_ij`. The face key
`faceKey k₀₁ k₀₂ k₁₂ = ![k₁₂, k₀₂, k₀₁]` translates role-pair keys to keys indexed by the omitted
coordinate. For distinct cells, a matching unordered triple has one role assignment; repeated-cell
assignments are accounted for in Layer 9.

- A polyad is determined by its cells and colors; polyads have decidable equality and form a finite
  type, with at most `t³ m³` polyads for `t` cells and `m` pair colors.
- The support of a polyad has at most `|c₀| |c₁| |c₂|` triples.
- Distinct polyads have disjoint supports, and every injective triple lies in the support of the
  polyad of its own cells and colors.

*Needs:* §5.3.

*In Tau Ceti:* `TauCeti.Polyad3`, `TauCeti.polyadSupport`, `TauCeti.Polyad3.support`,
`TauCeti.Polyad3.ext_data`, `TauCeti.card_polyad3_le`, `TauCeti.Polyad3.card_support_le`,
`TauCeti.faceKey`, `TauCeti.Polyad3.ofData`, `TauCeti.Polyad3.pairSupport₀₁`,
`TauCeti.Polyad3.pairSupport₀₂`, `TauCeti.Polyad3.pairSupport₁₂`, `TauCeti.Polyad3.ofTriple`,
`TauCeti.Polyad3.mem_support_iff_eq_ofTriple`, `TauCeti.Polyad3.pairwise_disjoint_support`.

### 6.2 Subpolyads

A subpolyad of a polyad `P` (`TauCeti.Subpolyad3 P`) selects arbitrary subsets of the three pair
graphs of `P`, in the form of Rödl–Schacht and Nagle–Rödl–Schacht. Its support is computed: the
triples of `P` whose three coordinate pairs lie in the selected pair sets. The vertex restriction
of `P` to sets `a₀`, `a₁`, `a₂` intersects each pair graph with the corresponding vertex rectangle;
its support consists exactly of the triples of `P` with `x_i ∈ a_i`, and the sets `a_i` need not
lie in the cells.

- The support of a subpolyad lies in the support of `P` and grows with the selected pair sets.
- A subpolyad is determined by its three pair sets; subpolyads have decidable equality and form a
  finite type.

*Needs:* §6.1.

*In Tau Ceti:* `TauCeti.Subpolyad3`, `TauCeti.subpolyadSupport`, `TauCeti.Subpolyad3.support`,
`TauCeti.Subpolyad3.support_subset`, `TauCeti.Subpolyad3.support_mono`,
`TauCeti.Subpolyad3.ext_data`, `TauCeti.Subpolyad3.ofSubcells`,
`TauCeti.Subpolyad3.mem_ofSubcells_support`.

### 6.3 Relative densities

For a coloring `H` of the triples, a color `c` and a finite set of injective triples, the relative
density of `c` on the set is the proportion of its triples whose underlying unordered triple has
color `c`, and `0` on the empty set. The relative density of `c` over a polyad `P` is the relative
density on its support.

- Relative densities lie in `[0, 1]`, sum to `1` over the palette on a nonempty support, and are
  `0` on an empty support.
- For a constant coloring of color `c₀`, the relative density on a nonempty support is `1` for `c₀`
  and `0` for every other color.
- The same laws hold over a polyad, by specialization.

*Needs:* §0.2, §6.1.

*In Tau Ceti:* `TauCeti.Colored3Graph.relDensityOn`, `TauCeti.Colored3Graph.relDensityOn_nonneg`,
`TauCeti.Colored3Graph.relDensityOn_le_one`, `TauCeti.Colored3Graph.sum_relDensityOn`,
`TauCeti.Colored3Graph.relDensityOn_empty`, `TauCeti.Colored3Graph.relDensityOn_const_self`,
`TauCeti.Colored3Graph.relDensityOn_const_of_ne`, `TauCeti.Colored3Graph.relativeDensity`,
`TauCeti.Colored3Graph.relativeDensity_nonneg`, `TauCeti.Colored3Graph.relativeDensity_le_one`,
`TauCeti.Colored3Graph.sum_relativeDensity`,
`TauCeti.Colored3Graph.relativeDensity_of_support_eq_empty`.

### Examples

- Take `V = {0, …, 5}` with cells `{0, 1}`, `{2, 3}`, `{4, 5}`, one pair color, and color a triple
  red when it contains `0`. The polyad on the three cells has `8` triples in its support. The
  subpolyad selecting the pairs `(0, 2)`, `(0, 3)`, `(1, 2)` of its pair graph on roles `0, 1` and
  all pairs of the other two has `6` triples, `4` of them red, so the relative density of red on it
  is `2/3`. It is not a vertex restriction: no rectangle `a₀ × a₁` consists of these three pairs.
- With one vertex cell `V` and one pair color, the single polyad has as support all `(n)_3`
  injective triples, and the relative density of a color `c` is `6 N_c / (n)_3`, where `N_c` is the
  number of triples of color `c`.

### Dependencies

Layer 5 (the lower skeleton) and §0.2 (colorings of triples).

## Layer 7: top regularity over polyads

The goal of this layer is the counting-ready top-regularity condition.

### 7.1 Top regularity over a polyad

For a family `Q₁, …, Q_r` of subpolyads of a polyad `P`, its union support is the union of their
supports. A coloring `H` is `(δ, r)`-top-regular over `P` when, for every color `c` and every
family of `r` subpolyads whose union support has at least `δ |P.support|` triples, the relative
density of `c` on the union support is within `δ` of the relative density of `c` over `P`. Members
of the family may repeat, so this tests unions of at most `r` subpolyads (Convention 9). The
condition is color-indexed: every color of the palette is tested.

- Top regularity is monotone: it passes to every lower rank and every larger `δ`, and it holds for
  `δ ≥ 1`. A constant coloring is top-regular over every polyad at every rank and every `δ > 0`.
- The rank-`r` test applies to families of at most `r` subpolyads indexed by any finite type; at
  rank one it is the test on single subpolyads.
- Rank one at `δ` gives rank `r` at `ε > 0` whenever `2^r δ ≤ ε²`.

The induced counting of Layer 9 uses this condition at rank one (§9.2). *Needs:* §§6.2–6.3.

**Checks.**
- On the polyad of the example of Layer 6, with palette {red, blue, green}, color a triple blue
  when it contains `0` and green otherwise. Red has relative density `0` on every subpolyad, so a
  condition testing a single color would accept this coloring. The vertex restriction to `{0}`,
  `{2, 3}`, `{4, 5}` carries half of the support with blue density `1`, against `1/2` over the
  polyad, so the coloring is not `(δ, 1)`-top-regular for `δ < 1/2`.

*In Tau Ceti:* `TauCeti.Subpolyad3.unionSupport`, `TauCeti.Colored3Graph.IsTopRegularOverPolyad`,
`TauCeti.Colored3Graph.IsTopRegularOverPolyad.abs_relDensityOn_sub_le`,
`TauCeti.Colored3Graph.IsTopRegularOverPolyad.of_rank_le`,
`TauCeti.Colored3Graph.IsTopRegularOverPolyad.mono`,
`TauCeti.Colored3Graph.isTopRegularOverPolyad_of_one_le`,
`TauCeti.Colored3Graph.isTopRegularOverPolyad_one_iff`,
`TauCeti.Colored3Graph.isTopRegularOverPolyad_const`,
`TauCeti.Colored3Graph.IsTopRegularOverPolyad.of_rank_one`.

### 7.2 Vertex-box regularity and the comparison at arity two

A coloring `H` is `ε`-vertex-box-regular over a polyad `P` when, for every color and all subsets
`a_i` of its cells whose vertex restriction keeps at least an `ε`-fraction of the support, the
relative density on the restriction is within `ε` of the relative density over `P`. It is weaker
than top regularity: top regularity at a positive rank implies vertex-box regularity with the same
parameter, a vertex restriction being a single subpolyad. Vertex-box regularity is used only for
comparisons.

At arity two, a pair `(s, t)` is `ε`-vertex-box-regular for a pair-color system when every box
`s' × t'` carrying at least an `ε`-fraction of the ordered distinct pairs of `s × t` has every color
density within `ε` of that on `(s, t)`.

- An `ε`-regular pair of sets that are equal or disjoint (§5.3) is `ε`-vertex-box-regular.
- A `δ`-vertex-box-regular pair of disjoint sets is `ε`-regular when `0 ≤ ε` and `δ ≤ ε²`.
- A set `s` paired with itself is `ε`-regular when it is `δ`-vertex-box-regular, `2δ ≤ ε²` and
  `ε |s| ≥ 2`. Some size condition is needed: once `ε |s| ≤ 1`, the box `{u} × {u}` passes the
  thresholds of pair regularity but carries no distinct pair.

*Needs:* §7.1, §5.3.

*In Tau Ceti:* `TauCeti.Colored3Graph.IsVertexBoxRegularOverPolyad`,
`TauCeti.Colored3Graph.IsVertexBoxRegularOverPolyad.mono`,
`TauCeti.Colored3Graph.IsTopRegularOverPolyad.isVertexBoxRegularOverPolyad`,
`TauCeti.PairColorSystem.IsVertexBoxRegularPair`,
`TauCeti.PairColorSystem.IsRegularPair.isVertexBoxRegularPair`,
`TauCeti.PairColorSystem.IsVertexBoxRegularPair.isRegularPair_of_disjoint`,
`TauCeti.PairColorSystem.IsVertexBoxRegularPair.isRegularPair_self`.

### 7.3 Slicing, inheritance and refinement of the skeleton

Let `H` be `(δ, r)`-top-regular over a polyad `P` with `r ≥ 1`, and let `P'` be a polyad, over any
lower skeleton, whose three pair graphs lie in those of `P`.

- Inheritance: if `|P'.support| ≥ δ |P.support|`, every color has relative density over `P'` within
  `δ` of its relative density over `P`.
- Slicing: if `|P'.support| ≥ α |P.support|` with `α > 0`, then `H` is
  `(max(2δ, δ/α), r)`-top-regular over `P'`.
- Refinement of the skeleton: let a skeleton `T` refine `S`, in that its cells refine those of `S`
  and a palette map `f` carries its pair colors to those of `S`. Every polyad `Q` of `T` has a parent
  polyad over `S`, its cells' parents with the `f`-images of its colors, whose pair graphs contain
  those of `Q`. The supports of the polyads of `T` with a given parent `P` partition the support of
  `P`. So, by slicing, the children of `P` over which `H` fails to be `(max(2δ, δ/α), r)`-top-regular
  either have a parent over which `H` fails to be `(δ, r)`-top-regular, or carry less than an
  `α`-fraction of the support of `P`. Summed over a polyad decomposition, this is the exceptional
  mass bound of §8.1.

*Needs:* §7.1, §6.1; Mathlib `Finpartition`.

*In Tau Ceti:* `TauCeti.Colored3Graph.IsTopRegularOverPolyad.abs_relativeDensity_sub_le`,
`TauCeti.Colored3Graph.IsTopRegularOverPolyad.of_pairSupport_subset`, `TauCeti.Polyad3.coarsen`,
`TauCeti.Polyad3.pairSupport₀₁_subset_coarsen`, `TauCeti.Polyad3.pairSupport₀₂_subset_coarsen`,
`TauCeti.Polyad3.pairSupport₁₂_subset_coarsen`, `TauCeti.Polyad3.sum_card_support_coarsen`.

### Examples

- The worked example below computes the threshold `δ ≥ 1/2` of `(δ, 1)`-top regularity over one
  polyad.
- A cell `A` with `2 ≤ |A|` and `ε |A| ≤ 1`, paired with itself: the box `{u} × {u}` passes the size
  thresholds of pair regularity but has no distinct pair, so pair regularity on `(A, A)` fails as
  soon as some color has positive density on `(A, A)`; vertex-box regularity, which measures boxes
  by their distinct pairs, does not test this box.

### Dependencies

Layer 6 (polyads, subpolyads, relative densities) and Layer 5 (pair-color regularity, for §7.2).

## Layer 8: strong arity-3 regular approximation

The goal of this layer is to approximate a coloring of the triples by one that is regular over a
triadic complex of bounded complexity, with the schedules chosen first.

### 8.1 Triadic complexes and strong regular approximations

A triadic complex on a finite `V` (`TauCeti.TriadicComplex3 V`) chooses a number `m` of pair
colors, a lower skeleton over the palette `Fin m`, and a finite set of polyads over that skeleton,
the selected polyads. Its complexity `C.complexity` is the number of vertex cells plus `m` plus the
number of selected polyads. Its graded complex of rank `3` has the empty set at level `0`, all
singletons at level `1`, all two-element sets at level `2` (the pair coloring is total), and at
level `3` the unordered triples underlying the supports of the selected polyads. No top palette is
attached to a triadic complex (Convention 4).

- The complexity bounds the number of vertex cells, the number of pair colors and the number of
  selected polyads; with `t` cells and `m` pair colors it is at most `t + m + t³ m³`.
- The levels `1`, `2` and `3` of the graded complex are as stated; level `0` is `{∅}` (§5.1).

*In Tau Ceti:* `TauCeti.TriadicComplex3`, `TauCeti.TriadicComplex3.complexity`,
`TauCeti.TriadicComplex3.card_parts_le_complexity`,
`TauCeti.TriadicComplex3.pairColorCount_le_complexity`,
`TauCeti.TriadicComplex3.card_polyads_le_complexity`, `TauCeti.TriadicComplex3.complexity_le`,
`TauCeti.TriadicComplex3.topFaces`, `TauCeti.TriadicComplex3.toHypergraphComplex`,
`TauCeti.TriadicComplex3.faces_one`, `TauCeti.TriadicComplex3.faces_two`,
`TauCeti.TriadicComplex3.faces_three`.

The selected polyads of `C` decompose the injective triples when every injective triple lies in the
support of a selected polyad; the polyad is then unique (§6.1), and the selected supports contain
`(n)_3 = n(n − 1)(n − 2)` triples in total. The vertex cells of `C` are controlled at `t₀` when they
form an equipartition into at least `t₀` cells; each cell then has at most `n / t₀ + 1` vertices
for `t₀ > 0`, and control at `t₀` gives control at every smaller floor.

*In Tau Ceti:* `TauCeti.TriadicComplex3.IsPolyadDecomposition`,
`TauCeti.TriadicComplex3.IsPolyadDecomposition.existsUnique`,
`TauCeti.TriadicComplex3.IsPolyadDecomposition.sum_card_support`,
`TauCeti.TriadicComplex3.VertexCellsControlled`,
`TauCeti.TriadicComplex3.VertexCellsControlled.mono`,
`TauCeti.TriadicComplex3.VertexCellsControlled.card_le`.

The edit discrepancy of colorings `H`, `H'` of the triples is six times the number of triples on
which they disagree, divided by `|V|³`, and `H` approximates `H'` within `ε` when it is at most `ε`.
It is symmetric, zero on the diagonal, and satisfies the triangle inequality; so approximation is
symmetric, monotone in `ε`, and approximations within `ε` and `δ` compose to one within `ε + δ`.

*In Tau Ceti:* `TauCeti.Colored3Graph.editDiscrepancy3`,
`TauCeti.Colored3Graph.editDiscrepancy3_comm`, `TauCeti.Colored3Graph.editDiscrepancy3_self`,
`TauCeti.Colored3Graph.editDiscrepancy3_triangle`, `TauCeti.Colored3Graph.Approximates3`,
`TauCeti.Colored3Graph.Approximates3.symm`, `TauCeti.Colored3Graph.Approximates3.mono`,
`TauCeti.Colored3Graph.Approximates3.trans`.

The exceptional polyad mass of `H` over `C` at `(η, r)` is the proportion of the total selected
support carried by the selected polyads over which `H` is not `(η, r)`-top-regular, and `0` when
the total is `0`. `H` is `(η, r)`-top-regular over most polyads of `C` up to `ε` when this mass is
at most `ε`.

- The mass lies in `[0, 1]`, vanishes when `H` is top-regular over every selected polyad, and
  decreases as `η` grows and `r` drops. A constant coloring is top-regular over most polyads at
  every `η > 0` and `ε ≥ 0`.
- Refinement (§7.3 summed): let `C` and `D` be polyad decompositions, the cells of `D` refining
  those of `C` and a palette map carrying the pair colors of `D` to those of `C`, with at most `M`
  polyads of `D` over each polyad of `C`. For `α > 0` and `r ≥ 1`, the mass over `D` at
  `(max(2δ, δ/α), r)` is at most the mass over `C` at `(δ, r)` plus `α M`. With `M = t³ m³` for the
  `t` cells and `m` pair colors of `D`, top regularity over most polyads passes from `C` to `D` at
  `(max(2δ, δ/α), r)`, up to `ε + α t³ m³`.
- Edits: suppose `H` is `(δ, r)`-top-regular over most polyads of `C` up to `ε₀` and approximates
  `H'` within `α`. For `ε > 0` and `η > 0` with `δ + η + η/ε ≤ ε`, `H'` is `(ε, r)`-top-regular over
  most polyads of `C` up to `ε₀ + α |V|³ / (η Σ)`, where `Σ` is the total selected support.

*In Tau Ceti:* `TauCeti.Colored3Graph.exceptionalPolyadMass`,
`TauCeti.Colored3Graph.exceptionalPolyadMass_nonneg`,
`TauCeti.Colored3Graph.exceptionalPolyadMass_le_one`,
`TauCeti.Colored3Graph.exceptionalPolyadMass_eq_zero`,
`TauCeti.Colored3Graph.exceptionalPolyadMass_le_exceptionalPolyadMass`,
`TauCeti.Colored3Graph.TopRegularOverMostPolyads`,
`TauCeti.Colored3Graph.TopRegularOverMostPolyads.mono`,
`TauCeti.Colored3Graph.topRegularOverMostPolyads_const`,
`TauCeti.Colored3Graph.exceptionalPolyadMass_coarsen_le`,
`TauCeti.Colored3Graph.TopRegularOverMostPolyads.of_refinement`,
`TauCeti.Colored3Graph.TopRegularOverMostPolyads.of_approximates3`.

Define `IsStrongRegularApproximation3 H H' C ε F R b`, for colorings
`H H' : TauCeti.Colored3Graph κ₃ V`, a triadic complex `C : TauCeti.TriadicComplex3 V`, an error
`ε : ℝ`, an error schedule `F : ℕ → ℝ`, a rank schedule `R : ℕ → ℕ` and a bound `b : ℕ`, as the
conjunction of five conditions:

1. `H.Approximates3 H' ε`: six times the number of unordered triples on which `H` and `H'` disagree,
   divided by `|V|³`, is at most `ε`;
2. `C.IsPolyadDecomposition`: every injective triple lies in the support of a selected polyad,
   which is unique because distinct polyads over one skeleton have disjoint supports;
3. `C.skeleton.LowerSkeletonRegular F`: the lower skeleton is pair-color regular at `F` evaluated at
   the number of vertex cells plus the number of pair colors (§5.3, Convention 8);
4. `H'.TopRegularOverMostPolyads C (F C.complexity) ε (R C.complexity)`: the selected polyads over
   which `H'` is not top-regular at tolerance `F C.complexity` and rank `R C.complexity` carry at
   most an `ε`-proportion of the total selected support;
5. `C.complexity ≤ b`.

The approximant `H'` is explicit. Top regularity is asked of `H'`, not of `H`, and the top
tolerance `F C.complexity` is a parameter separate from the exceptional-mass bound `ε`. The
complexity bound is written as an inequality, not as a separate predicate. This is the conclusion
of the regular approximation lemma of Rödl–Schacht (*Regular Partitions of Hypergraphs: Regularity
Lemmas*, Theorem 14) with the explicit approximant, rank-`r` subpolyad tests and the lower error
schedule evaluated at the complexity of the pairs partition (Terry, *Growth of regular partitions
4*, Definition 2.15 and Theorem 2.19; the latter evaluates the pair error at the number of pair
classes).

- Monotonicity: a strong regular approximation at `(ε, F, R, b)` is one at `(ε', F', R', b')`
  whenever `ε ≤ ε'`, `F ≤ F'` and `R' ≤ R` pointwise, and `b ≤ b'`. Lower-skeleton regularity
  weakens as the parameter grows, and the exceptional mass decreases as the tolerance grows and the
  rank drops.
- Edit transfer: if `(H', C)` is a strong regular approximation of `H` at `(ε, F, R, b)` and `H₀`
  differs from `H` in edit discrepancy by at most `δ`, then `(H', C)` is a strong regular
  approximation of `H₀` at `(ε + δ, F, R, b)`, by the triangle inequality for the edit discrepancy.
- The number of vertex cells, the number of pair colors and the number of selected polyads are each
  at most `b`. With `t` cells and `m` pair colors there are at most `t³ m³` polyads.
- Under condition 2 the selected supports contain `(n)_3 = n(n − 1)(n − 2)` injective triples in
  total, so the exceptional polyads of condition 4 carry at most `ε · (n)_3` of them.

*Needs:* the triadic complexes, edit discrepancy, polyad decompositions and exceptional mass above;
§5.3 for lower-skeleton regularity and its monotonicity; §7.1.

**Checks.**
- Let `H` be constant, `H' = H`, and let `C` have an equipartition into `t` cells, one pair color
  and all `t³` polyads, so that `C.complexity = t + 1 + t³`. Suppose `F > 0`, `R ≥ 1`, `ε ≥ 0` and
  `b ≥ t + 1 + t³`. Conditions 1, 2, 4 and 5 hold: a constant coloring is top-regular over every
  polyad at every positive tolerance. Write `f = F(t + 1)` and suppose `f < 1`. Condition 3 holds
  exactly when every cell has one vertex or more than `1/f` vertices. Take a cell `A` with
  `2 ≤ |A| ≤ 1/f`, paired with itself, and the subsets `{v}` and `{v}` of it. They are large enough
  to be tested, contain no distinct pair, and so have density `0`, against density `1` on `(A, A)`.
  A lower-skeleton predicate testing only pairs of distinct cells would accept every partition here.
  A complexity counting only the cells would give `t` and leave the palette and the polyads
  unbounded.

### 8.2 The strong regular approximation theorem

Prove `exists_strong_regular_approximation3` (Rödl–Schacht, *Regular Partitions of Hypergraphs:
Regularity Lemmas*, Theorem 14 and, for a partition of the triples into several classes, Lemma 25
for the edited approximation; Theorem 17 for the order of the schedules). Fix a finite top palette
`κ₃`, an error `ε > 0`, an error schedule `F` with `F n > 0` for all `n`, a rank schedule `R` with
`R n ≥ 1` for all `n`, and a number `t₀`. Then there is a natural number `B` such that, for every
finite `V` with `|V| ≥ B` and every coloring `H : TauCeti.Colored3Graph κ₃ V`, there are a coloring
`H'` and a triadic complex `C` with the following two properties. First,
`C.VertexCellsControlled t₀` holds: the vertex cells form an equipartition into at least `t₀`
cells. Second, `IsStrongRegularApproximation3 H H' C ε F R B` holds. The bound depends on `κ₃`
(through its size, by relabelling), `ε`, `F`, `R` and `t₀`, and not on `V` or `H`. Call it
the arity-three regularity bound.

*Pinned choices.* The complex chooses its finite pair palette. Its complexity counts vertex cells,
pair colors and polyads. The top tolerance `F C.complexity` is separate from the exceptional-mass
bound `ε`, and top regularity is at rank `R C.complexity`. The quantifiers come in a fixed order:
first the error and the two schedules; then the complexity bound; then, for a host above the bound,
a complex at which the schedules are evaluated. The cells returned are equitable and at least `t₀`
in number. This schedule order is that of Rödl–Schacht, Theorem 17, where the rank is a function
of the lower complexity data; that theorem alone is not the edited approximation statement. The
scalar complexity bounds each component. Constructing a scalar majorant of the source's
tuple-indexed schedule is part of the proof. Pairs inside one cell are tested like all others: the
lower skeleton is regular on a cell paired with itself, and the triples meeting a cell twice lie in
selected polyads.

*Route.* Rödl–Schacht, Theorem 14 and Lemma 25, supply the edited approximation. Their regularity
is at rank one. It is bridged to the rank-`r` subpolyad-union tests by choosing the rank-one
discrepancy small enough for the loss over unions of at most `r` subpolyads, as in §7.1
(`TauCeti.Colored3Graph.IsTopRegularOverPolyad.of_rank_one`): rank one at `δ` gives rank `r` at
`ε'` when `2^r δ ≤ ε'²`. The top half of the iteration is Tau Ceti's
`TauCeti.Colored3Graph.exists_topRegularOverMostPolyads`. It refines the pair palette of a lower
skeleton, keeping the vertex cells and with a host-independent bound on the palette, until a
coloring is top-regular over most polyads; its potential is the polyad energy
`TauCeti.Colored3Graph.polyadEnergy` (`polyadEnergy_mono_of_refines`,
`polyadDensityDeviation_abs_le`). The lower skeleton is regularized by Mathlib's
`szemeredi_regularity` and by §2.3 (`SimpleGraph.exists_regular_equipartition_almost_refining`),
applied to the pair-color classes. Both leave a small proportion of irregular pairs of distinct
cells, and neither tests a cell with itself. The pair coloring belongs to the complex, not to the
host, so it is then changed on those cell pairs and inside each cell until every color is regular
on every pair of cells. A single color fixed by the reversal does this: it is regular on two
distinct cells, and on a cell with itself once the cell has more than `1/f` vertices, `f` the
parameter of condition 3 (§8.1, Checks). Rödl–Schacht likewise change the pair classes on few
pairs to make them regular on all pairs of distinct cells (Lemma 25 at `k = 2`). The polyads over
the changed cell pairs carry a small proportion of the triples once the cells are numerous, and
are charged to the exceptional mass. Top regularity passes to refinements and survives edits by the
refinement and edit bullets of §8.1. The source's divisibility conditions are discharged by padding
and rebalancing, and the resulting edit and regularity errors are included in the parameter budget;
they are not hypotheses of the theorem. *Needs:* §8.1, §0.2; for the route §7.1 and §8.1 (rank
one to rank `r`, refinement, edits), §2.3, Tau Ceti
`TauCeti.Colored3Graph.exists_topRegularOverMostPolyads`, `TauCeti.Colored3Graph.polyadEnergy`;
Mathlib `szemeredi_regularity`.

**Checks.**
- Suppose `t₀ ≥ 1`. Then no version without a large-host hypothesis holds, since the empty host
  already fails, and when `κ₃` is nonempty every admissible bound satisfies `B ≥ t₀`. A set with
  fewer than `t₀` elements has no partition into `t₀` nonempty cells, so
  `C.VertexCellsControlled t₀` fails for every complex on it.
- Suppose `F n ≥ 1` for all `n` and `t₀ ≥ 1`. Then the two regularity conditions hold for every
  complex, and `B = t₀³ + t₀ + 1` suffices. Take `H' = H`, an equipartition into `t₀` cells, one
  pair color and all `t₀³` polyads, of complexity `t₀³ + t₀ + 1`. The bound is cubic in `t₀` because
  the complexity counts the polyads; a complexity counting only the cells would give `t₀`.

### Examples

- The graph shadow. For a graph `G` on `V` and an equipartition `P`, color the ordered distinct
  pairs by edge and nonedge. Suppose the lower skeleton with cells `P` and these two colors is
  `ε`-regular. Then any two distinct cells form an `ε'`-uniform pair for every `ε' > ε`, so `P` is
  `ε'`-uniform for `G` in Szemerédi's sense with no exceptional pair (§5.3). Conversely, an
  `ε`-uniform pair of distinct cells is `ε`-regular for both colors. The lower skeleton also tests a
  cell paired with itself, which Szemerédi's uniformity does not. The complexity plays the role of
  the number of fine parts in strong graph regularity (§4.2).
- With one vertex cell `V` and one pair color, the single polyad has as support all `(n)_3`
  injective triples. The complex has complexity `3`, and its lower skeleton is regular at
  `0 < f < 1` exactly when `n = 1` or `n > 1/f`.
- The graded complex of a triadic complex has the empty set at level 0, all singletons at level 1
  and all two-element sets at level 2, since the pair coloring is total. At level 3 it has the
  underlying triples of the selected supports: all triples when the polyads decompose the injective
  triples.

### Dependencies

Layers 5 to 7 (lower skeleton, polyads, top regularity) and §0.2 (colorings of triples); for the
route of §8.2, §2.3, Tau Ceti's top regularization and polyad energy, and Mathlib's Szemerédi
regularity lemma. Layers 1, 3 and 4 are not used.

## Layer 9: induced counting

For a fixed colored 3-pattern `F₀` on `k` vertices, the prediction from a strong regular
approximation `(H', C)` is `H'.expectedInducedCount C F₀` (§9.1). It sums over placements `φ` of
the pattern vertices into cells and routes `ψ` of pair colors. Each term is the falling-factorial
injection count of `φ`, times the pair-color densities of `ψ` over the canonical pairs `i < j`,
times the relative densities in `H'` of the pattern colors over the induced polyads of the triples
`i < j < l`. The goal of this layer is
`|inducedCopyCount H F₀ − expectedInducedCount H' C F₀| ≤ ε · |V|^k`.

### 9.1 Placements, routes and the prediction

Fix a triadic complex `C` with `m` pair colors and a pattern `F₀` on `k` vertices, with its
labelled induced copy count from §0.2. A placement `φ` assigns to each pattern vertex a vertex cell
of `C`; distinct pattern vertices may share a cell, and `φ` is transversal when its cells are
pairwise distinct. A route `ψ` over `φ` assigns a pair color of `C` to each canonical pair `i < j`
such that, for every triple `i < j < l`, the polyad with cells `φ(i)`, `φ(j)`, `φ(l)` and colors
`ψ(i, j)`, `ψ(i, l)`, `ψ(j, l)` is a selected polyad of `C`, the polyad of the triple. The placed
induced copies are the labelled induced copies `f` of `F₀` in `H` with `f(i) ∈ φ(i)` and total pair
color `ψ(i, j)` on `(f(i), f(j))` for every `i < j`; the placed count counts them.

The injection count of `φ` is the number of injections `f : Fin k ↪ V` with `f(i) ∈ φ(i)` for every
`i`. Writing `m_A` for the number of pattern vertices assigned to the cell `A`,

```text
placementInjectionCount φ = ∏ A ∈ C.skeleton.vertexPart.parts, (|A|)_(m_A).
```

Here `(a)_b = Nat.descFactorial a b`. It is zero if a cell is too small for its assigned vertices;
an unused cell contributes one. At a transversal placement it equals `∏ i, |φ(i)|`, and it is at
most that product for every placement. The local prediction is

```text
expectedInducedCountAt H' C F₀ φ ψ
  = placementInjectionCount φ
    × ∏_{i<j} pairColorDensity C.skeleton.pairColors (ψ(i, j)) (φ i) (φ j)
    × ∏_{i<j<l} relativeDensity H' (F₀.pattern {i, j, l}) (ψ.polyad(i, j, l)).
```

All factors are cast before multiplication. Each unordered pattern triple occurs once, through its
increasing ordering. The global prediction `expectedInducedCount H' C F₀` sums the local prediction
over all placements and routes. The lower-route prediction, the size product `∏ i, |φ(i)|` times the
pair-color densities of `ψ`, is an upper envelope of the local prediction, not an alternative
definition of the injection factor.

- Placements and routes form finite types, and a placement has at most `m^(k choose 2)` routes.
- The placed count is at most the injection count, and the local prediction is nonnegative and at
  most the lower-route prediction.

*Needs:* §0.2, §5.2, §6.1, §6.3, §8.1.

*In Tau Ceti:* `TauCeti.PatternPlacement3`, `TauCeti.PatternPlacement3.Transversal`,
`TauCeti.PairColorPlacement3`, `TauCeti.PairColorPlacement3.polyad`,
`TauCeti.PairColorPlacement3.card_le_pairColorCount_pow`,
`TauCeti.Colored3Graph.placedInducedCopyCount`,
`TauCeti.Colored3Graph.placedInducedCopyCount_le_placementInjectionCount`,
`TauCeti.placementInjectionCount`, `TauCeti.placementInjectionCount_eq_prod_descFactorial`,
`TauCeti.placementInjectionCount_eq_prod_of_transversal`, `TauCeti.placementInjectionCount_le_prod`,
`TauCeti.Colored3Graph.expectedInducedCountAt`, `TauCeti.Colored3Graph.expectedInducedCountAt_nonneg`,
`TauCeti.Colored3Graph.expectedInducedCount`, `TauCeti.expectedLowerRouteCountAt`,
`TauCeti.Colored3Graph.expectedInducedCountAt_le_expectedLowerRouteCountAt`.

### 9.2 Local counting

The counting parameters are host-independent and do not depend on the top palette. For `k` pattern
vertices and an error `ε`:

- `TauCeti.inducedCountingParameter3 k ε = (ε/6) / max(1, k³)`, for the edit discrepancy and the
  exceptional mass;
- `TauCeti.inducedCountingSchedule3 k ε n = (ε/12) / (max(1, k³) · max(1, n^(k choose 2)))`, the
  error schedule;
- `TauCeti.diagonalControl3 k ε = ⌈24 (k choose 2) / ε⌉`, the number of vertex cells;
- `TauCeti.routeBudget3 C k ε = ε / max(1, m^(k choose 2))` for a complex with `m` pair colors, the
  per-route budget of Convention 8.

The first, second and fourth are positive for `ε > 0`; the third is positive for `ε > 0` and
`k ≥ 2`, and is `0` for `k ≤ 1`. The schedule is antitone in `n`. Their charges: for `ε ≥ 0`,
`k³ · inducedCountingParameter3 k ε ≤ ε/6`; `m^(k choose 2) · routeBudget3 C k ε ≤ ε`, so the
per-route budgets times the cell-size products, summed over all placements and routes, are at most
`ε |V|^k`; and at every `n ≥ m`, `(k choose j) · inducedCountingSchedule3 k ε n` is at most
`routeBudget3 C k (ε/12)` for `1 ≤ j ≤ 3`, while
`m^(k choose 2) · (k choose 2) · inducedCountingSchedule3 k ε n ≤ ε/12`, the slack of the predicted
lower routes. These calibrations hold for every complex, with no hypothesis on a regularity bound.

*In Tau Ceti:* `TauCeti.inducedCountingParameter3`, `TauCeti.inducedCountingSchedule3`,
`TauCeti.diagonalControl3`, `TauCeti.routeBudget3`, `TauCeti.inducedCountingParameter3_pos`,
`TauCeti.inducedCountingSchedule3_pos`, `TauCeti.routeBudget3_pos`,
`TauCeti.inducedCountingSchedule3_antitone`, `TauCeti.inducedCountingParameter3_charge`,
`TauCeti.routeBudget3_charge`, `TauCeti.sum_routeBudget3_mul_prod_card_le`,
`TauCeti.choose_mul_inducedCountingSchedule3_le_routeBudget3`,
`TauCeti.pairColorCount_pow_mul_choose_two_mul_inducedCountingSchedule3_le`.

For a placement `φ` and a route `ψ`, the lower-route count is the number of maps `g` with
`g(i) ∈ φ(i)` and total pair color `ψ(i, j)` on `(g(i), g(j))` for every `i < j`; such maps are
injective. Lower-route counting: at a transversal placement into a triadic complex whose lower
skeleton is `ε`-pair-color regular, the lower-route count differs from the lower-route prediction by
at most `(k choose 2) · ε · ∏ i, |φ(i)|`, for every route and with no lower bound on the pair-color
densities. The placed count is at most the lower-route count.

*In Tau Ceti:* `TauCeti.lowerRouteCountAt`,
`TauCeti.abs_lowerRouteCountAt_sub_expectedLowerRouteCountAt_le`,
`TauCeti.Colored3Graph.placedInducedCopyCount_le_lowerRouteCountAt`.

A route is sparse at floor `ρ` when one of its pair-color densities is below `ρ`. Along a sparse
route, the lower-route count and its prediction are both at most `ρ ∏ i, |φ(i)|`, and the placed
count differs from the local prediction by at most `ρ ∏ i, |φ(i)|`, with neither regularity nor
transversality assumed. Sparse routes form a local branch, not a global error charge.

*In Tau Ceti:* `TauCeti.PairColorPlacement3.IsSparseRoute`,
`TauCeti.lowerRouteCountAt_le_of_sparseRoute`, `TauCeti.expectedLowerRouteCountAt_le_of_sparseRoute`,
`TauCeti.Colored3Graph.placed_induced_counting3_of_sparseRoute`.

A route `ψ` is `(η, r)`-top-regular for `H` when `H` is `(η, r)`-top-regular over the polyad of
every triple `i < j < l`; it is then so at every lower rank. Local counting: let `φ` be
transversal, let the lower skeleton be `ε`-pair-color regular, and let `ψ` be `(η, 1)`-top-regular
for `H`. Then the placed count of `F₀` in `H` differs from the local prediction by at most
`((k choose 2) ε + (k choose 3) η) ∏ i, |φ(i)|`, with no lower bound on the pair or triple
densities. At the counting schedule: if the lower skeleton is lower-skeleton regular for
`inducedCountingSchedule3 k ε` with `ε ≥ 0`, and `ψ` is top-regular at tolerance
`inducedCountingSchedule3 k ε C.complexity` and some rank `r ≥ 1`, the error is at most
`routeBudget3 C k (ε/6) · ∏ i, |φ(i)|`. Local counting is stated for the approximant; the edit to
the original coloring is made after global summation (§9.3).

The pair-regularity strength used by route counting and the output error of counting are separate
parameters: route counting runs at the value of the schedule at the lower complexity, which is at
least the number of pair colors, and pays `(k choose 2) + (k choose 3)` scheduled errors per route
within `routeBudget3 C k (ε/6)` by the calibrations above. The top rank required by local counting
is one, for every pattern and every error. So every rank schedule `R` with `R n ≥ 1` meets the
demand of local counting at every complex, and the rank schedule is a free parameter of §8.2 and
§9.4 (Convention 9).

*Needs:* §9.1, §5.3, §7.1, §8.1.

*In Tau Ceti:* `TauCeti.PairColorPlacement3.IsTopRegularRoute`,
`TauCeti.PairColorPlacement3.IsTopRegularRoute.of_rank_le`,
`TauCeti.Colored3Graph.abs_placedInducedCopyCount_sub_expectedInducedCountAt_le`,
`TauCeti.Colored3Graph.abs_placedInducedCopyCount_sub_expectedInducedCountAt_le_routeBudget3`.

### 9.3 Globally excluded contributions

Let `μ` be the exceptional polyad mass of `H` over `C` at `(η, r)` and `n = |V|`.

- Actual exceptional routes: at most `(k choose 3) · μ · n^k` embeddings `f : Fin k ↪ V` send some
  increasing triple `i < j < l` into the support of a selected polyad over which `H` is not
  `(η, r)`-top-regular. Every labelled copy routed through an exceptional polyad is such an
  embedding.
- Predicted exceptional routes: the exceptional predicted mass sums the local predictions over the
  transversal placements and their routes that are not `(η, r)`-top-regular for `H`. If the lower
  skeleton is `ε`-pair-color regular with `ε ≥ 0`, it is at most
  `((k choose 3) μ + m^(k choose 2) (k choose 2) ε) · n^k`: the first term is the mass of the maps
  realizing these routes, the second pays the lower-route counting error once for each route of
  each transversal placement. At the counting parameters, with the lower skeleton regular for the
  schedule and `μ ≤ inducedCountingParameter3 k ε`, it is at most `(ε/3) · n^k`.
- Repeated cells: the nontransversal predicted mass sums the local predictions over the
  nontransversal placements and all their routes. If `ε > 0` and the vertex cells form an
  equipartition into at least `diagonalControl3 k ε` cells, the number of embeddings putting two
  pattern vertices in a common cell plus the nontransversal predicted mass is at most
  `(ε/6) · n^k`.
- Edit transfer: for colorings `H`, `H'`,
  `|inducedCopyCount H F₀ − inducedCopyCount H' F₀| ≤ (k choose 3) · editDiscrepancy3 H H' · n^k`;
  within the counting parameter this is at most `(ε/6) · n^k`.

The predicted exceptional-route term is transversal; the predicted repeated-cell term is assigned
to the diagonal estimate. *Needs:* §9.1, §9.2, §8.1.

*In Tau Ceti:* `TauCeti.Colored3Graph.exceptional_route_mass_le`,
`TauCeti.Colored3Graph.exceptionalPredictedMass3`,
`TauCeti.Colored3Graph.exceptional_route_prediction_mass_le`,
`TauCeti.Colored3Graph.exceptional_route_prediction_mass_le_countingSchedule`,
`TauCeti.Colored3Graph.nontransversalPredictedMass3`,
`TauCeti.Colored3Graph.nontransversal_actual_and_predicted_mass_le`,
`TauCeti.Colored3Graph.inducedCopyCount_edit_transfer`,
`TauCeti.Colored3Graph.Approximates3.inducedCopyCount_sub_le`,
`TauCeti.Colored3Graph.Approximates3.inducedCopyCount_sub_le_countingParameter`.

### 9.4 Assembly: counting from a strong regular approximation

Fix a finite top palette `κ₃`, a pattern `F₀ : TauCeti.FiniteColored3Pattern κ₃` on `k = F₀.k`
vertices, a triadic complex `C` on a finite `V` with `m` pair colors, and colorings `H`, `H'` of
the triples of `V`. For `(η, r)`, write `μ` for the exceptional polyad mass of `H` over `C` at
`(η, r)` (§8.1).

Fibration: if the selected polyads of `C` decompose the injective triples, every labelled induced
copy of `F₀` in `H` realizes exactly one placement and one route, so `inducedCopyCount H F₀` is the
sum of the placed counts over all placements and routes; the global prediction is by definition
the sum of the local predictions.

Error decomposition: over a polyad decomposition and for every `(η, r)`, the difference between the
induced count of `F₀` in `H` and the prediction of `H` is at most the sum of three parts: the local
errors along the `(η, r)`-top-regular routes of transversal placements; the exceptional routes,
with at most `(k choose 3) · μ · |V|^k` actual copies plus the exceptional predicted mass; and the
nontransversal placements, with the embeddings putting two pattern vertices in a common cell plus
the nontransversal predicted mass. Consequently, let `ε ≥ 0`, `δ > 0` and `e ≥ 0`, let the lower
skeleton be `ε`-pair-color regular with `m` pair colors and the vertex cells an equipartition into
at least `diagonalControl3 k δ` cells, and let `H'` be a coloring whose placed counts along the
`(η, r)`-top-regular routes of transversal placements are within `e ∏ i, |φ(i)|` of their
predictions. Then `|inducedCopyCount H F₀ − expectedInducedCount H' C F₀|` is at most
`((k choose 3) d + m^(k choose 2) e + 2 (k choose 3) μ' + m^(k choose 2) (k choose 2) ε + δ/6) · |V|^k`,
where `d` is the edit discrepancy of `H` and `H'` and `μ'` the exceptional polyad mass of `H'`.

*In Tau Ceti:* `TauCeti.Colored3Graph.inducedCopyCount_eq_sum_placedInducedCopyCount`,
`TauCeti.Colored3Graph.expectedInducedCount_def`,
`TauCeti.Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le`,
`TauCeti.Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le_of_placed_le`.

Let `ε > 0` and take the counting parameters of §9.2. State the counting estimate over a strong
regular approximation. Suppose that the vertex cells of
`C` form an equipartition into at least `diagonalControl3 k ε` cells. Suppose that `(H', C)` is a
strong regular approximation of `H` (§8.1) at
`(inducedCountingParameter3 k ε, inducedCountingSchedule3 k ε, R, b)`, for some rank schedule
`R ≥ 1` and some `b`. Then
`|inducedCopyCount H F₀ − expectedInducedCount H' C F₀| ≤ ε · |V|^k`. The sources count copies of
a pattern from both sides in the dense case, where every density of the complex is large compared
with its regularity (Rödl–Schacht, *Regular Partitions of Hypergraphs: Counting Lemmas*, Theorems
10 and 13). Without that assumption they count cliques from both sides (Nagle–Rödl–Schacht,
Theorem 12) and copies of a general pattern from below (Nagle–Rödl–Schacht, Corollary 15). The
two-sided count of the induced copies of a colored pattern, summed over a polyad decomposition and
carried across an edit, is the statement here.
*Route.* Unfold §8.1 and apply the error decomposition above at tolerance
`inducedCountingSchedule3 k ε C.complexity` and rank `R C.complexity ≥ 1`, with the local counting
of §9.2. The complexity bound is not used. The error splits into six charges, each at most
`(ε/6) |V|^k`:

1. local counting along the top-regular routes of transversal placements, at the per-route budget
   (§9.2);
2. the actual copies through exceptional polyads (§9.3);
3. the predicted mass of exceptional routes (§9.3);
4. the pair-counting error inside that prediction, the slack of §9.2;
5. the actual and predicted copies of placements meeting a cell twice (§9.3);
6. the transfer from `H'` to `H` across the edit (§9.3).

*In Tau Ceti:* `TauCeti.Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le_of_topRegular`,
with conditions 1 to 4 of §8.1 as separate hypotheses.

State `exists_strong_regular_approximation3_counting`. For every rank schedule `R ≥ 1` there is a
bound `B`, independent of the host, with the following property. Every coloring `H` of the triples
of a finite `V` with `|V| ≥ B` has a strong regular approximation `(H', C)` at
`(inducedCountingParameter3 k ε, inducedCountingSchedule3 k ε, R, B)` with at least
`diagonalControl3 k ε` equitable vertex cells, and with
`|inducedCopyCount H F₀ − expectedInducedCount H' C F₀| ≤ ε · |V|^k`. The bound can be taken to be
an arity-three regularity bound of §8.2 at error `inducedCountingParameter3 k ε`, schedule
`inducedCountingSchedule3 k ε`, rank schedule `R` and `t₀ = diagonalControl3 k ε`, so the
large-host hypothesis is exactly that bound. *Route.* Apply §8.2 at these parameters, which is
possible since the first two are positive, and then the counting estimate above. `Suggested.lean`
carries out this derivation from the statement of §8.2, so the endpoint is proved once §8.2 is.
*Needs:* §§9.1–9.3 and §8.1 for the counting estimate; §8.2 for the composed endpoint.

**Checks.**
- One vertex cell, one pair color, `k = 3` and `n ≥ 3`. The prediction for the pattern with its
  triple colored `c` is `(n)_3 · 1 · 6N_c/(n)_3 = 6N_c`, where `N_c` is the number of triples of
  color `c`; this is exactly the induced count. On seven vertices with 19 triples of color `c`, both
  are 114. The plain size product `n³` in place of the injection count `(n)_3` would give `931/5`.
- Top regularity cannot be dropped. Split `n = 2tm` vertices into `t ≥ diagonalControl3 4 ε` cells
  of size `2m`, and let `X` take `m` vertices from each cell. Color a triple red when it lies in `X`
  and blue otherwise, and take `H' = H`, one pair color and all polyads. For `m` large the
  conditions on the cells, the polyads, the lower skeleton and the edit hold. Let the pattern have
  four vertices and all four triples red. It has `(n/2)_4` labelled induced copies, about
  `n⁴/16`. Every relative density of red over a polyad is at most `1/8`, so the prediction is at
  most `(n)_4/8⁴`, about `n⁴/4096`. The difference is about `(255/4096) n⁴`, more than `ε n⁴` for
  `ε ≤ 1/17` and `n` large. What fails is condition 4. Over a polyad of three distinct cells, the
  vertex box on `X` carries an eighth of the support with red density `1`, against `1/8` over the
  whole polyad. These polyads carry all but a proportion `O(1/t)` of the support.

### Examples

- Two labelled vertices placed in a cell with two elements have `(2)_2 = 2` injections, not
  `2² = 4`. Three vertices placed in such a cell have `(2)_3 = 0`. An unused cell contributes the
  factor `(|A|)_0 = 1`.
- For `k = 3` and `ε = 1/10`: `inducedCountingParameter3 3 (1/10) = 1/1620`,
  `inducedCountingSchedule3 3 (1/10) n = 1/(3240 n³)` for `n ≥ 1`, and
  `diagonalControl3 3 (1/10) = 720`. With `m = 2` pair colors a placement has at most
  `2³ = 8` routes, and the route budget `TauCeti.routeBudget3 C 3 ε = ε/8` sums to at most `ε`
  over them.

### Dependencies

§0.2 (patterns and induced copies), Layer 5 (pair-color densities and regularity), Layer 6
(polyads and relative densities), Layer 7 (top regularity) and §8.1 (triadic complexes, edits,
exceptional mass); §8.2 for the composed endpoint of §9.4. Layers 1 to 4 are not used.

## Worked examples

This example runs through Layers 5 to 7 on one small coloring.

- **Polyads.** Take `V = {0, …, 5}` with cells `{0, 1}`, `{2, 3}`, `{4, 5}` and one pair color,
  and color a triple red when it contains `0`. The polyad on the three cells has 8 triples in its
  support and relative density of red `1/2`. Its vertex restriction to `{0}`, `{2, 3}`, `{4, 5}`
  carries half of the support and has relative density `1`. So the coloring is `(δ, 1)`-top-regular
  over this polyad exactly when `δ ≥ 1/2`.

## Downstream consumers

- [CoboundaryExpansion](../CoboundaryExpansion/README.md) Layer 2 specializes the graded complexes
  `HypergraphComplex r V` it cites from Layer 5 of this roadmap (§5.1).

## Provenance

This section is secondary to the specification above. It concerns the Lean library
[`regularity-lemmata` at commit `315ef979f55f31cc43cd791302519d9a34cc2dc0`](https://github.com/cameronfreer/regularity-lemmata/tree/315ef979f55f31cc43cd791302519d9a34cc2dc0),
also named by the protected tag
[`tauceti-roadmap-pin-2`](https://github.com/cameronfreer/regularity-lemmata/tree/tauceti-roadmap-pin-2).
It is a source reference, not a Lake dependency: the Tau Ceti development is held to the
statements of this roadmap, not to the source's organization or names.

| Layer | Source declarations or modules | Relation to the specified mathematics |
|---|---|---|
| 1 | `energy`, `energy_mono`, `energy_le_one` in `Partition/Energy.lean` | Size-weighted energy for directed relations on a finite host; it specializes to graphs. `MathlibEnergyCounterexample` in `Graph/Bridge.lean` separates it from the off-diagonal energy. |
| 2 | `exists_regular_refinement_and_almostRefining_equipartition` in `Graph/Bridge.lean` | A regular exact refinement and a separate almost-refining equipartition; the latter is not asserted regular, so this is not the simultaneous conclusion specified here. |
| 3 | `steppedCount`, `cutDiscrepancy`, `frieze_kannan`, `frieze_kannan_refining`, `frieze_kannan_cutDiscrepancy` in `Graph/{CutNorm,FriezeKannan}.lean` | Directed-relation versions of the finite weak-regularity statements, including a seeded form. |
| 4 | `StrongWitness`, `exists_strongWitness`, `exists_familyRegular_refinement`; `Relational/GraphCounting.lean` | A witness without equitability or coarse regularity, a simultaneous-family theorem, and binary-palette counting: related forms, not the strong regularity statement or its counting bound. |
| 5–8 | `exists_goodPolyadColoring`, its refining form, `exists_goodColoring`, `exists_triadic_regular_approximation` in `Hypergraph/` | Regularization and Boolean approximation precursors; the differences in arity, coloring and rank are described below. |
| 9 | Binary-palette transversal counting; `sum_nontransversal_weight_le` in `Relational/DiagonalGate.lean` | A model for separating local counting from diagonal terms. The latter bounds any real weight dominated by the cell-triple volume by `3m|s|²`; it does not define the predictions or prove the arity-three counting theorem. |

The partition conventions differ. The source's `AlmostRefines` bounds a global exceptional mass by
`ε|s|`, whereas this roadmap requires a bound `δ|A|` in each parent cell. Its `IsRegularPartition`
bounds the mass of bad pairs, whereas Mathlib's `Finpartition.IsUniform` bounds the number of bad
cell pairs. Its two-partition theorem bounds the regular exact refinement by
`regularityBound ⌈1/ε⁵⌉ #P₀.parts`, and that bound does not also bound a partition with the
simultaneous regularity, equitability and almost-refinement specified here.

The source's hypergraph regularization applies to a coloring of `j`-sets and a decidable observable
on ordered `(j+1)`-tuples, normalized by `|V|^(j+1)`; the triadic case is `j = 2`. The seeded form
preserves a `ColoringRefines` projection. Permutation invariance is a hypothesis of the
badness-closure lemma, not of regularization itself. The deletion cleanup and approximation theorem
concern `UniformHypergraph 3` with factor-six edit normalization. They use a Boolean observable,
unordered pair colors, no vertex partition, and rank one in the approximation theorem. The local
rank-`r` subtriad tests are comparable with top regularity over polyads, not with the scheduled-rank
theorem of §8.2. The regularization recurrence has the form `K ↦ K·2^O(K^(j+1))`, giving
`K ↦ K·2^O(K³)` for triples.

The source snapshot
[`8e24d2db2c11ee6ae9e61ad2d70a6c01c4303c90`](https://github.com/cameronfreer/regularity-lemmata/tree/8e24d2db2c11ee6ae9e61ad2d70a6c01c4303c90)
provides simultaneous-family strong witnesses in
[`Graph/FamilyStrong.lean`](https://github.com/cameronfreer/regularity-lemmata/blob/8e24d2db2c11ee6ae9e61ad2d70a6c01c4303c90/RegularityLemmata/Graph/FamilyStrong.lean).
Its equitable family-regularity theorem does not provide seeded per-parent almost-refinement, and
its strong witnesses do not provide equitable strong regularity. Its triadic edited approximation
is a Boolean rank-one precursor, not the theorem of §8.2. Neither snapshot is a dependency or an
expansion of this roadmap's scope.

The [`graphon` library](https://github.com/cameronfreer/graphon) is a source for the parallel
analytic theory; neither library is an input to the finite proofs. The finite development draws on
[`cameronfreer/regularity-lemmata`](https://github.com/cameronfreer/regularity-lemmata), and the
analytic parallel on [`cameronfreer/graphon`](https://github.com/cameronfreer/graphon).

## Scope and ownership

**This roadmap owns** Layers 0 to 9 above: the finite carriers and the homomorphism densities of
uniform hypergraphs, with their agreement with the graph densities (Layer 0); block densities and
the size-weighted energies with their refinement identities (Layer 1); Szemerédi regularity relative
to a seed (Layer 2); finite weak regularity (Layer 3); strong graph regularity and the induced
counting of three-vertex graphs (Layer 4); graded hypergraph complexes, pair-color systems and the
lower skeleton (Layer 5); polyads, subpolyads and relative densities (Layer 6); top regularity over
polyads (Layer 7); triadic complexes, strong regular approximations and the strong arity-3 regular
approximation theorem (Layer 8); and induced counting with its composition with §8.2 (Layer 9). It
also owns the comparisons of its energy and cut discrepancy with the graphon partition energy and
cut norm of DenseGraphLimits (§1.4, §3.3). The Tau Ceti declarations that realise its items at the
pin are named in the layers.

**Owned elsewhere.**

- *Dense graph limits*: graphons, the analytic cut norm, cut distance, compactness, analytic
  Frieze–Kannan and sampling, and the graph homomorphism densities `homDensityFin` and
  `injHomDensity` (its Layer 9a), are
  [DenseGraphLimits](../../Completed/DenseGraphLimits/README.md). Its Layer 9a leaves to this
  roadmap the alignment of this roadmap's densities with those two, which §0.3 makes for uniform
  hypergraphs at `r = 2`. The finite theory here and the analytic theory are independent
  formulations, neither derived from the other; DenseGraphLimits' cut norm, step graphons and
  partition energy meet the finite theory only in the comparison theorems of §1.4 and §3.3, which
  are proved after both.
- *Exchangeability*: sequence exchangeability, de Finetti, exchangeable arrays and the
  Aldous–Hoover representation are [Exchangeability](../../Completed/Exchangeability/README.md)
  (Layer 8 for arrays). This roadmap exports deterministic finite regularity inputs that those
  statements consume.
- *Finite graphs and Szemerédi regularity*: `SimpleGraph`, graph maps and copy counting,
  `Finpartition`, equipartitions, the Szemerédi regularity lemma and triangle removal are Mathlib's.

Induced removal, arithmetic applications and the packaging of a single induced removal theorem as an
endpoint are not targets of this roadmap, which ends at counting.

## Exact supplier contracts

### From Mathlib

- *Graphs and densities*: `SimpleGraph`, `SimpleGraph.Hom`, `SimpleGraph.interedges` and
  `SimpleGraph.edgeDensity` (`Mathlib/Combinatorics/SimpleGraph/Density.lean`; ordered pairs,
  denominator `|A| |B|`, also on the diagonal). `SimpleGraph.Copy`, `SimpleGraph.IsContained`,
  `SimpleGraph.Free`, `SimpleGraph.copyCount` and `SimpleGraph.labelledCopyCount`
  (`Mathlib/Combinatorics/SimpleGraph/Copy.lean`; the host comes first in the copy counts).
  `SimpleGraph.triangleRemovalBound` (`Mathlib/Combinatorics/SimpleGraph/Triangle/Removal.lean`).
- *Partitions and uniformity*: `Finpartition` (`Mathlib/Order/Partition/Finpartition.lean`),
  `Finpartition.IsEquipartition` (`Mathlib/Order/Partition/Equipartition.lean`),
  `Finpartition.equitabilise` and `Finpartition.exists_equipartition_card_eq`
  (`Mathlib/Combinatorics/SimpleGraph/Regularity/Equitabilise.lean`), `SimpleGraph.IsUniform`
  (strict deviation `< ε` on subsets of relative size at least `ε`), `Finpartition.IsUniform` (at
  most `ε · #P(#P − 1)` non-uniform ordered pairs of distinct parts), `Finpartition.nonUniforms`,
  `SimpleGraph.nonuniformWitness` and `Finpartition.IsEquipartition.sum_nonUniforms_lt`
  (`Mathlib/Combinatorics/SimpleGraph/Regularity/Uniform.lean`).
- *Szemerédi regularity*: `szemeredi_regularity` (for `0 < ε` and `l ≤ |V|`, an `ε`-uniform
  equipartition with between `l` and `SzemerediRegularity.bound ε l` parts;
  `Mathlib/Combinatorics/SimpleGraph/Regularity/Lemma.lean`), and the energy-increment machinery
  `SzemerediRegularity.increment` with `SzemerediRegularity.increment_isEquipartition`,
  `SzemerediRegularity.card_increment`, `SzemerediRegularity.energy_increment`,
  `SzemerediRegularity.stepBound`, `SzemerediRegularity.initialBound` and
  `Finpartition.energy_le_one`. The unweighted `Finpartition.energy`
  (`Mathlib/Combinatorics/SimpleGraph/Regularity/Energy.lean`) is a point of comparison, not an
  input: it sums over ordered pairs of distinct parts and divides by `#P²`.
- *Counting and hypergraph carriers*: `Nat.descFactorial`, `Nat.choose`, `Finset.powersetCard`,
  `Set.powersetCard`; `Hypergraph` (`Mathlib/Combinatorics/Hypergraph/Basic.lean`), a set-based
  undirected carrier with no uniformity, finiteness, density or counting API;
  `PreAbstractSimplicialComplex` (`Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`), a
  downward-closed family of nonempty finite faces.

### From Tau Ceti

Paths are under `TauCeti/`. The declarations realising this roadmap's own items are named in the
layers above. Besides them, the roadmap consumes:

- *Graph densities* (`Combinatorics/DenseGraphLimits/HomDensity/Finite.lean`, owned by
  DenseGraphLimits): `TauCeti.DenseGraphLimits.homDensityFin F G = |Hom(F, G)| / |V(G)|^|V(F)|`
  and `TauCeti.DenseGraphLimits.injHomDensity F G = |Inj(F, G)| / (|V(G)|)_|V(F)|`, with
  `injHomDensity_eq_labelledCopyCount_div`.
- *Graphons for the comparisons* (`Combinatorics/DenseGraphLimits/`, owned by DenseGraphLimits, and
  `MeasureTheory/Constructions/UnitInterval/CellPartition.lean`):
  `TauCeti.DenseGraphLimits.finiteGraphGraphon` (the graphon of a graph on `Fin m`, constant on the
  products of the `m` equal subintervals), `TauCeti.DenseGraphLimits.stepGraphonAvg` (block averages
  over a measurable partition), `TauCeti.DenseGraphLimits.graphonPartitionEnergy`,
  `TauCeti.DenseGraphLimits.cutNorm`, and `Finpartition.cellPartition` (the partition of the unit
  interval grouping the vertex subintervals by the parts of a partition of `Fin m`).
- *Top regularization and polyad energy*, for the route of §8.2
  (`Combinatorics/Hypergraph/Polyad/Energy.lean`, `Combinatorics/Hypergraph/Triadic/TopRegularization.lean`):
  `TauCeti.Colored3Graph.polyadEnergy` with `polyadEnergy_mono_of_refines` and
  `polyadDensityDeviation_abs_le`; `TauCeti.Colored3Graph.exists_topRegularOverMostPolyads` (for
  `0 < η`, `0 < ε` and a rank `r`, a refinement of the pair palette of a lower skeleton, with the
  same cells and at most `topRegularRefinementBound` pair colors, over all but an `ε`-proportion of
  whose polyads the coloring is `(η, r)`-top-regular).

## References

- E. Szemerédi, *Regular partitions of graphs* (1978).
- A. Frieze, R. Kannan, *Quick approximation to matrices and applications*, Combinatorica 19 (1999).
- L. Lovász, B. Szegedy, *Szemerédi's Lemma for the Analyst*, GAFA 17 (2007).
- T. Tao, *Szemerédi's regularity lemma revisited*, Contrib. Discrete Math. 1 (2006): the
  strong-regularity (energy-gap stopping) iteration of §4.2.
- Y. Zhao, *Graph Theory and Additive Combinatorics* (2023), ch. 2: graph regularity, counting, and
  the strong-regularity exposition.
- V. Rödl, M. Schacht, *Regular Partitions of Hypergraphs: Regularity Lemmas*, Combin. Probab.
  Comput. 16(6) (2007), 833–885 (Definition 15 for Convention 9; Theorems 14 and 17 and Lemma 25
  for §8.1–§8.2). The companion *Regular Partitions of Hypergraphs: Counting Lemmas* is ibid.,
  887–901 (Theorems 10 and 13 for §9.4). B. Nagle, V. Rödl, M. Schacht, *The counting lemma for
  regular k-uniform hypergraphs*, Random Struct. Alg. 28 (2006), 113–179 (Definition 9 for
  Convention 9; Theorem 12 and Corollary 15 for §9.4). For all three papers the numbers are those
  of the authors' versions on Schacht's web page, which number their statements consecutively; the
  counting paper cites Theorems 14 and 17 of the regularity paper as Theorems 2.13 and 2.16.
- C. Terry, *Growth of regular partitions 4: strong regularity and the pairs partition*
  ([arXiv:2404.02030v3](https://arxiv.org/abs/2404.02030v3)): the pairs partition over all ordered
  pairs of cells, a cell paired with itself included (Definition 2.15, p. 9); the pair error
  evaluated at the number of pair classes (Theorem 2.19, p. 10); sub-triads, with three component
  bigraphs, one per role pair (p. 49).
- L. Lovász, B. Szegedy, *Limits of dense graph sequences*, J. Combin. Theory Ser. B 96 (2006)
  ([arXiv:math/0408173v2](https://arxiv.org/abs/math/0408173v2)): homomorphism and injective
  homomorphism densities of graphs (§1 and §2.4), for §0.3.
- W. T. Gowers, *Hypergraph regularity and the multidimensional Szemerédi theorem*, Ann. of Math.
  166 (2007); T. Tao, *A variant of the hypergraph removal lemma*, JCTA 113 (2006).
- D. Conlon, J. Fox, *Graph removal lemmas* (survey, 2013).
- Y. Dillies, B. Mehta, *Formalising Szemerédi's Regularity Lemma in Lean*, ITP 2022
  ([doi:10.4230/LIPIcs.ITP.2022.9](https://doi.org/10.4230/LIPIcs.ITP.2022.9)): the Mathlib
  regularity and triangle-removal development consumed here.

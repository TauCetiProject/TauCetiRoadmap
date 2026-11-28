# Roadmap: graph reconstruction

**Summary.** Can a finite graph be recovered from its subgraphs obtained by deleting one vertex, or
one edge? This roadmap treats both questions for simple graphs on a fixed finite vertex set. Two
graphs `G` and `H` on the same vertex set are hypomorphic when, for every vertex `v`, the graphs
`G − v` and `H − v` are isomorphic; they are edge-hypomorphic when some bijection from the edges of
`G` onto the edges of `H` makes every `G − e` isomorphic to the corresponding `H − e′`. A graph is
reconstructible (edge-reconstructible) when every graph hypomorphic (edge-hypomorphic) to it is
isomorphic to it. Copies of a graph `F` in `G` are counted as subgraphs isomorphic to `F` and as
injective homomorphisms; `aut(G)` is the number of automorphisms.

The main results are these.

- **Kelly's lemma.** Hypomorphic graphs contain the same number of copies of every graph with
  fewer vertices; edge-hypomorphic graphs contain the same number of copies of every graph with
  fewer edges.
- **Recognizable parameters and regular graphs.** On at least three vertices, hypomorphic graphs
  have the same number of edges and the same degree at every vertex, and one is connected exactly
  when the other is; every regular graph on at least three vertices is reconstructible. Three
  vertices are needed: deleting either vertex of `K₂` or of `2K₁` leaves `K₁`.
- **Nash-Williams' lemma.** If `H` is edge-hypomorphic but not isomorphic to `G`, and `F` is a
  spanning subgraph of `G`, the number of permutations carrying exactly the edges of `F` from `G`
  into `G`, minus the same count into `H`, is `(−1)^(e(G) − e(F)) · aut(G)`.
- **Lovász's and Müller's theorems.** A graph with `n` vertices and `m` edges is
  edge-reconstructible if `4m > n(n − 1)`, if `2^m > 2 · n!`, or if `m > n log₂ n`. The
  graphs with two and with three edges that are edge-hypomorphic and not isomorphic show that
  some lower bound on `m` is needed.

The roadmap builds on Mathlib's copy counts of simple graphs and on two Tau Ceti files: the
Möbius function of the lattice of graphs on a fixed vertex set, which drives the inclusion–exclusion
in Nash-Williams' lemma, and the identification of labelled copy counts with injective
homomorphisms. It uses nothing from other roadmaps.

Layer 1 treats vertex deletion: Kelly's lemma, the parameters hypomorphic graphs share, and regular
graphs. Layer 2 treats edge deletion: Kelly's lemma for edges, Nash-Williams' lemma, his two
criteria, and the theorems of Lovász and Müller derived from them.

## Conventions

- **Vertices and graphs.** `V` is a finite type with decidable equality, `n = Fintype.card V`, and
  all graphs are `SimpleGraph V`. The number of edges is `e(G) = G.edgeSet.ncard` (it equals
  `#G.edgeFinset` when `G.Adj` is decidable), and `aut(G) = Nat.card (G ≃g G)`, which is at least
  `1`. The empty vertex type is allowed; there every statement below is about the single graph
  on no vertices.
- **Deleted subgraphs.** `G − v` is `G.induce {v}ᶜ`, a graph on the subtype of the other `n − 1`
  vertices. `G − e` is `G.deleteEdges {e}`, a graph on `V` itself: deleting an edge keeps every
  vertex, so isolated vertices are seen by every edge-deleted subgraph.
- **Copies.** `G.copyCount F` (Mathlib; host first) is the number of subgraphs of `G`, vertex set
  and edge set, isomorphic to `F`; isolated vertices of `F` count, and `G.copyCount ⊥ = 1` for the
  edgeless graph `⊥` on `V`. `G.labelledCopyCount F` is the number of `SimpleGraph.Copy F G`, the
  injective homomorphisms from `F` to `G` (Tau Ceti
  `SimpleGraph.card_injective_hom_eq_labelledCopyCount`).
  For `F` on `V` itself an injective self-map of `V` is a permutation, so
  `G.labelledCopyCount F` is the number of permutations `σ` with `F ≤ G.comap σ`; this is the
  number `|F → G|` of Bondy and Murty.
- **Hypomorphism.** `IsHypomorphic G H` says that `G − v` and `H − v` are isomorphic for every
  `v`: the two decks are matched by the identity of `V`. `IsReconstructible G` says that every `H`
  on `V` with `IsHypomorphic G H` is isomorphic to `G`. Because it quantifies over all graphs on
  `V`, it is the same as asking this of every `H` whose deck, the multiset of isomorphism classes
  of the `H − v`, equals that of `G`: if `G − v ≅ H − τ v` for a permutation `τ`, the graph
  `H.comap τ` is isomorphic to `H` (through `τ`) and hypomorphic to `G` in the sense above.
- **Edge hypomorphism.** `IsEdgeHypomorphic G H` says that some map `θ : Sym2 V → Sym2 V` is a
  bijection from the edges of `G` onto the edges of `H` (`Set.BijOn`) with `G − e ≅ H − θ e` for
  every edge `e` of `G`. This is equality of the multisets of isomorphism classes of edge-deleted
  subgraphs; it forces `e(G) = e(H)`. `IsEdgeReconstructible G` says that every `H` on `V` with
  `IsEdgeHypomorphic G H` is isomorphic to `G`. Both graphs live on `V`, so the number of vertices
  is fixed: a graph with no edges is edge-reconstructible (the only `H` is the edgeless one).
- **Arrow counts.** `arrowCount G H F` is the number of permutations `σ` of `V` with
  `G ⊓ H.comap σ = F`: the edges `uv` of `G` with `σ u σ v` an edge of `H` are exactly the edges of
  `F`. This is Bondy and Murty's `|G → H|_F`, where `σ(G) ∩ H = σ(F)`. It is `0` unless `F ≤ G`;
  `arrowCount G H G = H.labelledCopyCount G` and `arrowCount G G G = aut(G)`.
- **Numbers.** Lovász's condition is stated as `n * (n − 1) < 4 * m` in `ℕ`. Since `n(n − 1)` is
  even it says `C(n, 2) < 2m`, that is `m > ½ C(n, 2)`, and it is equivalent to
  `m > n * (n − 1) / 4` with natural-number division. Müller's condition is stated as
  `2 * n.factorial < 2 ^ m`; it is equivalent to `m ≥ 1` and `n! < 2^(m − 1)`, and fails for
  `m = 0`. The third condition compares real numbers: `(n : ℝ) * Real.logb 2 n < (m : ℝ)`, with
  both counts cast to `ℝ`; for `n ≤ 1` its left side is `0` and `m = 0`, so it never holds there.
  In the sign `(−1) ^ (e(G) − e(F))` the exponent is a natural-number difference with `F ≤ G`, so
  no truncation occurs.

**Checks.**

- For `G = K₃` and `F` the path on three vertices, `G.copyCount F = 3` and
  `G.labelledCopyCount F = 6`, while `F` occurs `0` times as an induced subgraph: the counts of
  Kelly's lemma are of all subgraphs, not of induced ones.
- For `G = P₃ ⊔ K₁` (edges `01`, `12` on `{0, 1, 2, 3}`) and `H = 2K₂` (edges `01`, `23`), the
  counts `(arrowCount G G F, arrowCount G H F)` are `(10, 8)` for `F = ⊥`, `(6, 8)` for each single
  edge and `(2, 0)` for `F = G`, with `aut(G) = 2`. Gardner's notes (pp. 9–10) give the same
  values for Bondy and Murty's Figure 2.13.
- `arrowCount G H G = H.labelledCopyCount G` and `arrowCount G G G = aut(G)` hold for every pair
  of graphs on at most four vertices taken one from each isomorphism class.

## Layer 1: hypomorphic graphs and Kelly's lemma

### 1.0 Definitions

Define `IsHypomorphic` and `IsReconstructible` as in the Conventions.

**Checks.**

- Deleting either vertex of `K₂` or of the edgeless `2K₁` leaves `K₁`, so `IsHypomorphic K₂ 2K₁`
  holds, while `K₂` has an edge and `2K₁` has none. Among all graphs on `n ≤ 6` vertices, with the
  identity labelling, this is the only hypomorphic pair that is not isomorphic.

### 1.1 Kelly's lemma

Prove `kelly_lemma`: for graphs `G`, `H` on `V` and any graph `F` on a finite type `W`,

- `(n − |W|) · G.copyCount F = ∑_v (G − v).copyCount F`, and the same identity for
  `labelledCopyCount`, with no hypothesis (natural-number subtraction: for `|W| ≥ n` the factor is
  `0`, and no graph on `n − 1` vertices contains a copy of a graph with `n` or more vertices);
- if `G` and `H` are hypomorphic and `|W| < n`, then `G.copyCount F = H.copyCount F` and
  `G.labelledCopyCount F = H.labelledCopyCount F`.

Bondy–Murty, Lemma 2.20, for subgraph counts with `v(F) < v(G)` (as reproduced in Gardner's notes,
p. 4, with its proof on slide 3 of Gardner's slides); Kelly (1957), p. 961, the counting argument
before Lemma 1, and Lemma 1, pp. 961–962, in his setting of trees. The labelled clauses and the
identity for `|W| ≥ n` are proved here by the same route.

Route. A copy of `F` in `G`, as a subgraph with vertex set `S` (`|S| = |W|`), lies in `G − v`
exactly when `v ∉ S`; subgraphs of `G − v` are the subgraphs of `G` avoiding `v`, pushed along the
inclusion `SimpleGraph.Copy.induce`, and this matches isomorphism to `F`. Hence each copy is
counted by `n − |W|` of the `n` vertex-deleted subgraphs. For labelled copies, an injective
homomorphism `F → G − v` composed with the inclusion (`SimpleGraph.Copy.comp`) is an injective
homomorphism `F → G` whose image avoids `v`, and every such homomorphism arises once; each is
counted `n − |W|` times. If `|W| > n` there is no copy in `G` or in any `G − v`. Both counts are
invariant under an isomorphism of the host graph (compose with `SimpleGraph.Iso.toCopy` for
labelled copies; transport subgraphs along the isomorphism for unlabelled ones), so
hypomorphism makes the right sides for `G` and `H` equal, and `n − |W| > 0` gives the conclusion.

**Checks.**

- The identity, labelled and unlabelled, holds for all 5368 pairs of a graph on `n ≤ 5` vertices
  (every labelled graph for `n ≤ 4`, one per isomorphism class for `n = 5`) and an isomorphism
  class `F` with `|W| ≤ min(n + 1, 5)`.
- `|W| < n` is needed: `K₂` and `2K₁` are hypomorphic, and for `F = K₂` (`|W| = 2 = n`) the copy
  counts are `1` and `0`, the labelled ones `2` and `0`.

*Needs:* Mathlib `SimpleGraph.copyCount`, `SimpleGraph.labelledCopyCount`,
`SimpleGraph.Copy.induce`, `SimpleGraph.Copy.comp`, `SimpleGraph.Iso.toCopy`.

### 1.2 Recognizable parameters

Prove `isHypomorphic_parameters`: if `3 ≤ n` and `G`, `H` are hypomorphic, then
`e(G) = e(H)`, `G.degree v = H.degree v` for every vertex `v`, and `G.Connected ↔ H.Connected`.

Bondy–Murty, Corollary 2.22, for the number of edges and the degree sequence (as reproduced in
Gardner's notes, p. 5; proof on slide 5 of Gardner's slides); Kelly (1957), Lemma 2, p. 962, for
the degree at each vertex, in his setting of trees. Connectedness is proved here.

Route. *Edges and degrees.* Deleting `v` removes exactly the `deg v` edges at `v`:
`e(G − v) = e(G) − deg_G v` (Mathlib `SimpleGraph.card_edgeFinset_induce_compl_singleton` and
`SimpleGraph.card_edgeFinset_deleteIncidenceSet`). Summing over `v` and using `∑ deg = 2 e(G)`
(Mathlib `SimpleGraph.sum_degrees_eq_twice_card_edges`) gives `(n − 2) e(G) = ∑_v e(G − v)`.
Isomorphic graphs have
the same number of edges (`SimpleGraph.Iso.card_edgeFinset_eq`), so the right side is the same for
`G` and `H`, and `n − 2 ≥ 1` gives `e(G) = e(H)`; then `deg_G v = e(G) − e(G − v) = deg_H v`.
*Connectedness.* For `n ≥ 3`, `G` is connected exactly when at least two of the graphs `G − v`
are connected. If `G` is connected, it has a spanning tree
(`SimpleGraph.Connected.exists_isTree_le`), the tree has two distinct leaves `u ≠ w`
(`SimpleGraph.IsTree.exists_ne_and_degree_eq_one`), and deleting a leaf leaves the tree connected
(`SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one`), so `G − u` and `G − w`
are connected (they contain the connected spanning graphs `T − u`, `T − w`;
`SimpleGraph.Connected.mono`). Conversely, let
`G − u` and `G − w` be connected with `u ≠ w`. Every vertex other than `u` is joined to `w` by a
walk inside `G − u`. Since `n ≥ 3` there is a third vertex `x`; `u` is joined to `x` inside `G − w`,
and `x` is joined to `w` inside `G − u`; so every vertex is joined to `w` in `G`, and `V` is
nonempty. The number of connected cards is the same for `G` and `H`
(`SimpleGraph.Iso.connected_iff`).

**Checks.**

- On `3 ≤ n ≤ 6` vertices, every graph and every graph hypomorphic to it (identity labelling)
  have the same number of edges, the same degree at every vertex and the same connectedness;
  `deg v = e(G) − e(G − v)` and `(n − 2) e(G) = ∑_v e(G − v)` hold for every graph on
  `2 ≤ n ≤ 6` vertices; for `3 ≤ n ≤ 6`, `G` is connected exactly when at least two of its
  vertex-deleted subgraphs are.
- `3 ≤ n` is needed for every clause: on two vertices `K₂` and `2K₁` are hypomorphic, with `1` and
  `0` edges, degrees `1` and `0`, and `K₂` connected while `2K₁` is not (all four cards `K₁` are
  connected).

*Needs:* Mathlib `SimpleGraph.card_edgeFinset_induce_compl_singleton`,
`SimpleGraph.card_edgeFinset_deleteIncidenceSet`, `SimpleGraph.sum_degrees_eq_twice_card_edges`,
`SimpleGraph.Iso.card_edgeFinset_eq`, `SimpleGraph.Connected.exists_isTree_le`,
`SimpleGraph.IsTree.exists_ne_and_degree_eq_one`,
`SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one`, `SimpleGraph.Connected.mono`,
`SimpleGraph.Iso.connected_iff`.

### 1.3 Regular graphs

Prove `isReconstructible_of_isRegularOfDegree`: if `3 ≤ n` and `G` is `r`-regular
(`G.IsRegularOfDegree r`), then `G` is reconstructible. Bondy and Murty state this as an exercise
(Exercise 2.7.5, as reproduced in Gardner's notes, p. 4); the proof is written here.

Route. Let `H` be hypomorphic to `G`. By 1.2, `H.degree v = G.degree v = r` for every `v`, so `H`
is `r`-regular. Fix a vertex `v` and an isomorphism `ψ : G − v ≃g H − v`. In `G − v` a vertex `x`
has degree `r − 1` if `x` is adjacent to `v` in `G` and `r` otherwise; the same holds in `H − v`.
An isomorphism preserves degrees (`SimpleGraph.Iso.mapNeighborSet`). If `r ≥ 1` the two degrees
differ, so `x` is adjacent to `v` in `G` exactly when `ψ x` is adjacent to `v` in `H`; if `r = 0`
no vertex is adjacent to `v` in either graph. Extending `ψ` by `v ↦ v` therefore gives a bijection
of `V` that preserves adjacency, an isomorphism `G ≃g H`.

**Checks.**

- On `3 ≤ n ≤ 6` vertices, each of the 196 labelled regular graphs is isomorphic to every graph
  hypomorphic to it; for `3 ≤ n ≤ 5`, in `G − v` the degree of a vertex is `r − 1` exactly at the
  neighbours of `v` and `r` elsewhere.
- `3 ≤ n` is needed: `K₂` is `1`-regular and `2K₁` is hypomorphic to it.

*Needs:* 1.2; Mathlib `SimpleGraph.IsRegularOfDegree`, `SimpleGraph.Iso.mapNeighborSet`.

### Examples

- The cycle `C₄` is `2`-regular, so by 1.3 it is reconstructible.
- A graph on at least three vertices with a vertex of degree `n − 1` is connected, so by 1.2 every
  graph hypomorphic to it is connected.

### Dependencies

1.0 is definitions. 1.1 needs 1.0. 1.2 needs 1.0. 1.3 needs 1.2.

## Layer 2: edge reconstruction

### 2.0 Definitions

Define `IsEdgeHypomorphic`, `IsEdgeReconstructible` and `arrowCount` as in the Conventions.

**Checks.**

- On `n ≤ 6` vertices exactly two pairs of non-isomorphic edge-hypomorphic graphs occur for each
  `n = 4, 5, 6`, none for `n ≤ 3`: `P₃ ⊔ K₁` and `2K₂` (two edges; for `n = 4` the edge-deleted
  subgraphs are two copies of `K₂ ⊔ 2K₁` on both sides), and `K₁,₃` and `K₃ ⊔ K₁` (three edges;
  deleting any edge leaves `P₃ ⊔ K₁`), with isolated vertices added for `n = 5, 6`.
- The bijection matters: on five vertices, `G = P₄ ⊔ K₁` (edges `01`, `03`, `12`) and
  `H = P₃ ⊔ K₂` (edges `03`, `04`, `12`) have the same set of edge-deleted subgraphs up to
  isomorphism, `2K₂ ⊔ K₁` and `P₃ ⊔ 2K₁`, but `G` has the first once and `H` twice; they are not
  edge-hypomorphic, and not isomorphic (degree sequences `(2, 2, 1, 1, 0)` and
  `(2, 1, 1, 1, 1)`). A definition asking only that every `G − e` be isomorphic to some `H − e′`
  and conversely would call them hypomorphic.

### 2.1 Kelly's lemma for edges

Prove `kelly_lemma_edge`: for graphs `G`, `H` on `V` and any graph `F` on a finite type `W`,

- `(e(G) − e(F)) · G.copyCount F = ∑_{e ∈ E(G)} (G − e).copyCount F`, and the same identity for
  `labelledCopyCount`, with no hypothesis (for `e(F) ≥ e(G)` both sides are `0`);
- if `G` and `H` are edge-hypomorphic and `e(F) < e(G)`, then `G.copyCount F = H.copyCount F` and
  `G.labelledCopyCount F = H.labelledCopyCount F`.

Bondy–Murty, Lemma 2.24, for subgraph counts with `e(F) < e(G)` (as reproduced in Gardner's notes,
p. 6; its proof is their Exercise 2.7.13(a)); the proof is written here.

Route. A copy of `F` in `G` has exactly `e(F)` edges, and it is a subgraph of `G − e` exactly when
`e` is not one of them: the subgraphs of `G − e` are the subgraphs of `G` without the edge `e`,
with the same vertex sets. So each copy is counted by `e(G) − e(F)` of the edge-deleted subgraphs.
An injective homomorphism `F → G` maps the `e(F)` edges of `F` injectively to edges of `G`
(`SimpleGraph.Copy.mapEdgeSet`), and it is a homomorphism into `G − e` exactly when `e` is not one
of those images; each is counted `e(G) − e(F)` times. If `e(F) > e(G)` there is no copy. For
edge-hypomorphic graphs, `θ` is a bijection of the edge sets, so `e(H) = e(G)` and the sums for `G`
and `H` agree term by term after reindexing by `θ`, using the invariance of both counts under an
isomorphism of the host (as in 1.1); `e(G) − e(F) > 0` gives the conclusion.

**Checks.**

- The identity, labelled and unlabelled, holds for all 3093 pairs of a graph on `n ≤ 5` vertices
  (every labelled graph for `n ≤ 4`, one per class for `n = 5`) and a class `F` on at most `n`
  vertices.
- `e(F) < e(G)` is needed: for the edge-hypomorphic pair `G = P₃ ⊔ K₁`, `H = 2K₂` and `F = G`,
  `G.copyCount F = 1` and `H.copyCount F = 0`.

*Needs:* Mathlib `SimpleGraph.copyCount`, `SimpleGraph.labelledCopyCount`,
`SimpleGraph.Copy.mapEdgeSet`, `SimpleGraph.Iso.toCopy`, `Set.BijOn`.

### 2.2 Nash-Williams' lemma

Prove `nash_williams_lemma`: if `F ≤ G`, `G` and `H` are edge-hypomorphic and `G` and `H` are not
isomorphic (`IsEmpty (G ≃g H)`), then, in `ℤ`,

    arrowCount G G F − arrowCount G H F = (−1) ^ (e(G) − e(F)) * aut(G).

Bondy–Murty, Lemma 2.26 (as reproduced in Gardner's notes, p. 11, with the proof on slides 10–12
of Gardner's slides); the lemma is due to Nash-Williams (1978).

Route. *The sum over intermediate graphs.* For `F ≤ G` and any `H` on `V`,
`H.labelledCopyCount F = ∑_{F ≤ X ≤ G} arrowCount G H X`: by the Conventions the left side counts
the permutations `σ` with `F ≤ H.comap σ` (Tau Ceti `SimpleGraph.card_injective_hom_eq_sum_map_le`,
with `SimpleGraph.map_le_iff_le_comap`, and `Function.Embedding.equivOfFiniteSelfEmbedding`
for the passage from embeddings `V ↪ V` to permutations), and each such `σ` is counted once, at
`X = G ⊓ H.comap σ`, which satisfies `F ≤ X ≤ G`; conversely `G ⊓ H.comap σ = X ≥ F` gives
`F ≤ H.comap σ`.
*Inversion.* Write `f(X) = arrowCount G H X` and `g(X) = H.labelledCopyCount X` for `X ≤ G`, so
that `g(X) = ∑_{X ≤ Y ≤ G} f(Y)`. Exchanging the order of summation,

    ∑_{F ≤ X ≤ G} (−1)^(e(X) − e(F)) g(X) = ∑_{F ≤ Y ≤ G} f(Y) ∑_{F ≤ X ≤ Y} (−1)^(e(X) − e(F)),

and the inner sum is `1` if `Y = F` and `0` otherwise (Tau Ceti
`SimpleGraph.sum_neg_one_pow_ncard_edgeSet_sub_left`), so
`f(F) = ∑_{F ≤ X ≤ G} (−1)^(e(X) − e(F)) H.labelledCopyCount X`. The same holds with `G` in place
of `H`, and subtracting,

    arrowCount G G F − arrowCount G H F
      = ∑_{F ≤ X ≤ G} (−1)^(e(X) − e(F)) (G.labelledCopyCount X − H.labelledCopyCount X).

*The terms.* For `X < G`, `e(X) < e(G)` (a proper subset of a finite edge set), so the labelled
clause of 2.1, applied to `X` as a graph on `V`, makes the term `0`. For `X = G`,
`G.labelledCopyCount G = aut(G)` and `H.labelledCopyCount G = 0`: for a permutation `σ`,
`H.comap σ` is isomorphic to `H` (`SimpleGraph.Iso.comap`), so `e(H.comap σ) = e(H) = e(G)`, and
`G ≤ H.comap σ` then forces `G = H.comap σ`, which would make `σ` an isomorphism `G ≃g H`; with
`G` in place of `H` the permutations counted are exactly the automorphisms of `G`. With
`e(X) − e(F) = e(G) − e(F)` at `X = G` this is the claim.

**Checks.**

- The identity holds for all 72 triples `(G, H, F)` with `(G, H)` an ordered non-isomorphic
  edge-hypomorphic pair on `n ≤ 6` vertices and `F ≤ G`; in the example of the Conventions,
  `10 − 8 = 2`, `6 − 8 = −2`, `2 − 0 = 2`, with `aut(G) = 2` and `e(G) = 2`. For `G = K₁,₃` and
  `H = K₃ ⊔ K₁` (`aut(G) = 6`) the differences are `−6, 6, −6, 6` for `e(F) = 0, 1, 2, 3`.
- The sign is `(−1)^(e(G) − e(F))`, not `(−1)^e(F)`: for `G = K₁,₃` and `F = ⊥` the difference is
  `0 − 6 = −6`, while `(−1)^0 · 6 = 6`.
- The intermediate-sum identity holds for every graph `G` on at most four vertices, every `F ≤ G`
  and every `H` taken one from each isomorphism class.
- Each hypothesis is needed. Without `F ≤ G`: for `G = P₃ ⊔ K₁`, `H = 2K₂` and `F` the single edge
  `23`, both counts are `0`, while the right side is `−2`. Without non-isomorphism: `H = G` makes
  the left side `0`. Without edge hypomorphism: for `G` edgeless on three vertices, `H` a single
  edge and `F = ⊥`, the left side is `6 − 6 = 0`, while `(−1)^0 · aut(G) = 6`.

*Needs:* 2.1; Tau Ceti `SimpleGraph.sum_neg_one_pow_ncard_edgeSet_sub_left`,
`SimpleGraph.card_injective_hom_eq_labelledCopyCount`,
`SimpleGraph.card_injective_hom_eq_sum_map_le`; Mathlib `SimpleGraph.map_le_iff_le_comap`,
`SimpleGraph.Iso.comap`, `Function.Embedding.equivOfFiniteSelfEmbedding`.

### 2.3 Nash-Williams' criteria

Prove `isEdgeReconstructible_of_criteria`: let `F ≤ G`. Then `G` is edge-reconstructible if

- (i) `arrowCount G H F = arrowCount G G F` for every `H` edge-hypomorphic to `G`, or
- (ii) `2 · G.labelledCopyCount F < 2 ^ (e(G) − e(F)) · aut(G)`.

Bondy–Murty, Theorem 2.27 (as reproduced in Gardner's notes, p. 11, with the proof on slides 13–16
of Gardner's slides), where (ii) reads `|F → G| < 2^(e(G) − e(F) − 1) aut(G)`; the form here is
multiplied by `2`, and for `F = G` both forms are false, so nothing changes.

Route. Let `H` be edge-hypomorphic to `G` and suppose `G` and `H` are not isomorphic.
(i) By 2.2 the difference `arrowCount G G F − arrowCount G H F` is `± aut(G) ≠ 0`, against the
hypothesis.
(ii) Let `k = e(G) − e(F)`. If `k = 0` then `F = G`, and (ii) reads `2 aut(G) < aut(G)`, which is
false; so `k ≥ 1`. By the intermediate-sum identity of 2.2 with `H := G`,
`G.labelledCopyCount F = ∑_{F ≤ X ≤ G} arrowCount G G X`. For each `X` in this interval with
`e(G) − e(X)` even, 2.2 applied to `X` gives `arrowCount G G X = aut(G) + arrowCount G H X ≥
aut(G)`. The graphs `X` with `F ≤ X ≤ G` correspond to the subsets of the `k` edges of `G` not in
`F`, and exactly half of these `2^k` subsets, `2^(k − 1)`, have even size (toggle one fixed edge).
Hence `G.labelledCopyCount F ≥ 2^(k − 1) aut(G)`, that is `2 · G.labelledCopyCount F ≥ 2^k aut(G)`,
against (ii). In both cases `G ≅ H`.

**Checks.**

- On `n ≤ 4` vertices, every pair `(G, F ≤ G)` satisfying (i) (159 pairs, one `G` per class) or
  (ii) (76 pairs) has `G` edge-reconstructible.
- For the pair `G = P₃ ⊔ K₁`, `H = 2K₂`, neither criterion holds for any `F ≤ G`: (i) fails since
  the counts differ (`10, 8`; `6, 8`; `2, 0`), and (ii) fails, e.g. for `F = G`,
  `2 · 2 < 1 · 2` is false and for `F = ⊥`, `2 · 24 < 4 · 2` is false.

*Needs:* 2.2.

### 2.4 Lovász's and Müller's theorems

Prove `isEdgeReconstructible_of_many_edges`: a graph `G` with `m = e(G)` edges is
edge-reconstructible if

- `n * (n − 1) < 4 * m` (Lovász), or
- `2 * n! < 2 ^ m` (Müller), or
- `(n : ℝ) * logb 2 n < m`.

Bondy–Murty, Corollary 2.28 (as reproduced in Gardner's notes, p. 12, in the forms `m > ½ C(n, 2)`
and `2^(m − 1) > n!`; its proof is their Exercise 2.7.8, from Theorem 2.27 with `F` edgeless). The
results are due to Lovász (1972) and Müller (1977); the bound `m > n log₂ n` is the one in the
title of Müller's paper. The proofs are written here.

Route. Take `F = ⊥`, the edgeless graph on `V`.
*Lovász.* Let `H` be edge-hypomorphic to `G`, so `e(H) = m`, and let `σ` be a permutation. The
graph `X = H.comap σ` is isomorphic to `H` (`SimpleGraph.Iso.comap`), so `e(X) = m`. The union
`G ⊔ X` has at most `C(n, 2)` edges (`SimpleGraph.card_edgeFinset_le_card_choose_two`), so
`e(G ⊓ X) = e(G) + e(X) − e(G ⊔ X) ≥ 2m − C(n, 2) > 0`, since `n(n − 1) = 2 C(n, 2)`
(`Nat.choose_two_right`) and `n(n − 1) < 4m`; hence `G ⊓ X ≠ ⊥`. So `arrowCount G H ⊥ = 0`
for every such `H`, in particular for `H = G`, and criterion (i) of 2.3 applies.
*Müller.* `G.labelledCopyCount ⊥ = n!`: every permutation `σ` satisfies `⊥ ≤ G.comap σ`
(Tau Ceti `SimpleGraph.card_injective_hom_eq_labelledCopyCount` and
`SimpleGraph.card_injective_hom_eq_sum_map_le`, Mathlib `Fintype.card_embedding_eq`,
`Nat.descFactorial_self`). With `e(⊥) = 0` and `aut(G) ≥ 1`,
`2 · n! < 2^m ≤ 2^m · aut(G)`, and criterion (ii) of 2.3 applies.
*Logarithmic form.* If `n ≤ 1` then `m = 0` and the left side is `0`, so the hypothesis fails. If
`n ≥ 2`, then `2^m > 2^(n logb 2 n) = n^n` as real numbers (`Real.rpow_logb`), hence as natural
numbers, and `n^n ≥ 2 · n!` because `n! = 1 · 2 ⋯ n ≤ n^(n − 1)` and `n ≥ 2`; so Müller's
condition holds.

**Checks.**

- `n(n − 1) < 4m`, `m > n(n − 1)/4` (natural division) and `C(n, 2) < 2m` agree for all `n < 80`,
  `m < 3200`; `2 · n! < 2^m` agrees with `m ≥ 1 ∧ n! < 2^(m − 1)` for all `n < 25`, `m < 120`.
- None of the non-isomorphic edge-hypomorphic pairs of 2.0 (`m = 2, 3`, `n = 4, 5, 6`) meets any of
  the three conditions; e.g. for `n = 4` the conditions need `m ≥ 4`, `m ≥ 6` and `m ≥ 9`.
- The logarithmic condition is not vacuous: for `n = 7` it holds for `m = 20, 21` (`2^20 > 7^7`),
  and the least `m` with `2^m > n^n` satisfies `2 · n! < 2^m` for all `2 ≤ n < 40`.
- On `n ≤ 5` vertices every graph meeting the first or second condition is edge-reconstructible,
  and for `n ≤ 4` every graph `H` with `m` edges has `arrowCount G H ⊥ = 0` when `n(n − 1) < 4m`.

*Needs:* 2.3; Tau Ceti `SimpleGraph.card_injective_hom_eq_labelledCopyCount`,
`SimpleGraph.card_injective_hom_eq_sum_map_le`; Mathlib
`SimpleGraph.Iso.comap`, `SimpleGraph.card_edgeFinset_le_card_choose_two`, `Nat.choose_two_right`,
`Fintype.card_embedding_eq`, `Nat.descFactorial_self`, `Real.rpow_logb`.

### Examples

- The graphs with one edge are edge-reconstructible: an edge-hypomorphic `H` also has exactly one
  edge, and any two graphs on `V` with one edge each are isomorphic. With two or three edges the
  pairs of 2.0 show that this fails, so the bound `m ≥ 4` of the edge reconstruction conjecture
  cannot be lowered.
- `K₄` (`n = 4`, `m = 6`) and `C₄` (`m = 4`) satisfy Lovász's condition; `K₄` also satisfies
  Müller's (`2 · 24 < 64`).

### Dependencies

2.0 is definitions. 2.1 needs 2.0. 2.2 needs 2.1. 2.3 needs 2.2. 2.4 needs 2.3. Layer 2 does not
need Layer 1.

## Scope and ownership

This roadmap owns vertex and edge hypomorphism of graphs on a fixed finite vertex set, Kelly's
lemma in both forms, the parameters shared by hypomorphic graphs (number of edges, degrees,
connectedness), the reconstructibility of regular graphs, Nash-Williams' lemma and his two
criteria, and the theorems of Lovász and Müller.

- Already in the libraries and cited, not restated: the copy counts and their basic lemmas
  (Mathlib `Combinatorics/SimpleGraph/Copy.lean`); the identification of labelled copy counts with
  injective homomorphisms and the embedding sum (Tau Ceti
  `Combinatorics/SimpleGraph/Counting.lean`); the Möbius function of the lattice of graphs on a
  fixed vertex set (Tau Ceti `Combinatorics/SimpleGraph/Moebius.lean`), which is Bondy and Murty's
  Theorem 2.25 for spanning subgraphs.
- DenseGraphLimits (completed) counts injective homomorphisms through Mathlib's labelled copy
  count, and Regularity counts labelled induced copies with a count of its own; no statement of
  theirs is used here, and none of theirs is restated.
- Kelly's lemma, Nash-Williams' lemma and the theorems of Lovász and Müller are among the classical
  results that the preprint *Unconditional Edge Reconstruction of Simple Graphs of Linear Density*
  (Google Research, 2026; repository google-research/google-research, folder
  `cogentic_research_papers/edge_reconstruction`) recalls in its introduction; nothing here rests on
  it, and none of its results is stated.
- Public Lean developments on graph reconstruction exist. The file `ReconstructionConjecture.lean`
  of the repository google-deepmind/formal-conjectures states the vertex and edge reconstruction
  conjectures and the theorems of Lovász and Müller, and points to an outside registry. The
  repository SamuelSchlesinger/reconstruction-conjecture develops Kelly's lemma for induced
  copies, the number of edges, the degrees and connectedness of hypomorphic graphs, regular
  graphs and further vertex-reconstruction results. Both match decks through a bijection of
  vertices (formal-conjectures also of edges); no definition or statement here is taken from
  them.

Not treated: the reconstruction of disconnected graphs; Kelly's theorem that trees on at least
three vertices are reconstructible; Greenwell's theorem relating edge-deleted and vertex-deleted
subgraphs, and the implication from vertex to edge reconstruction; line graphs and Whitney's
theorem; reconstruction of the characteristic and chromatic polynomials; results on almost all
graphs; infinite graphs. The reconstruction conjecture (every graph on at least three vertices is
reconstructible) and the edge reconstruction conjecture (every graph with at least four edges is
edge-reconstructible) are open problems and are not targets.

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.copyCount (G : SimpleGraph V) (H : SimpleGraph W) : ℕ` (`[Fintype V]`): the number
  of subgraphs of `G` isomorphic to `H`; `SimpleGraph.labelledCopyCount` (`[Fintype V]
  [Fintype W]`): `Fintype.card (Copy H G)`; `SimpleGraph.copyCount_bot`;
  `SimpleGraph.Copy.induce`, `SimpleGraph.Copy.comp`, `SimpleGraph.Copy.mapEdgeSet`,
  `SimpleGraph.Iso.toCopy` (`Mathlib/Combinatorics/SimpleGraph/Copy.lean`) (Conventions, 1.1,
  2.1).
- `SimpleGraph.induce`, `SimpleGraph.comap`, `SimpleGraph.map_le_iff_le_comap` (for an embedding
  `f : V ↪ W`, `G.map f ≤ G' ↔ G ≤ G'.comap f`), `SimpleGraph.Iso.comap` (for `f : V ≃ W`,
  `G.comap f ≃g G`), `SimpleGraph.Iso.mapNeighborSet` (`Maps.lean`) (Conventions, 1.3, 2.2,
  2.4); `SimpleGraph.deleteEdges` (`DeleteEdges.lean`).
- `SimpleGraph.card_edgeFinset_induce_compl_singleton` and
  `SimpleGraph.card_edgeFinset_deleteIncidenceSet` (`[Fintype V] [DecidableEq V]
  [DecidableRel G.Adj]`): `G − x` has `#G.edgeFinset − G.degree x` edges (`DeleteEdges.lean`)
  (1.2); `SimpleGraph.sum_degrees_eq_twice_card_edges` (`DegreeSum.lean`) (1.2).
- `SimpleGraph.card_edgeFinset_le_card_choose_two`, `SimpleGraph.Iso.card_edgeFinset_eq`,
  `SimpleGraph.IsRegularOfDegree` (`[G.LocallyFinite]`) (`Finite.lean`) (1.2, 1.3, 2.4).
- `SimpleGraph.Connected.exists_isTree_le`, `SimpleGraph.IsTree.exists_ne_and_degree_eq_one`
  (`[Nontrivial V] [Finite G.edgeSet] [G.LocallyFinite]`: a finite tree with two vertices has two
  distinct leaves), `SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one`
  (`Acyclic.lean`), `SimpleGraph.Iso.connected_iff` (`Connectivity/Connected.lean`) (1.2).
- `SimpleGraph.Connected.mono` (`Connectivity/Connected.lean`) (1.2);
  `Function.Embedding.equivOfFiniteSelfEmbedding` (`Data/Fintype/EquivFin.lean`) (2.2);
  `Fintype.card_embedding_eq`, `Nat.descFactorial_self`, `Nat.choose_two_right`,
  `Real.rpow_logb`, `Set.BijOn` (2.1, 2.4).

### From Tau Ceti

- `SimpleGraph.sum_neg_one_pow_ncard_edgeSet_sub_left (F H : SimpleGraph V)`
  (`[Fintype V] [DecidableEq V] [Ring R]`, and decidability of `F ≤ G ∧ G ≤ H` and of `F = H`):
  `∑ G with F ≤ G ∧ G ≤ H,
  (-1 : R) ^ (G.edgeSet.ncard - F.edgeSet.ncard) = if F = H then 1 else 0`
  (`TauCeti/Combinatorics/SimpleGraph/Moebius.lean`) (2.2).
- `SimpleGraph.card_injective_hom_eq_labelledCopyCount (F : SimpleGraph V) (G : SimpleGraph W)`
  (`[Fintype V] [Fintype W]`): the injective homomorphisms `F → G` number
  `G.labelledCopyCount F`; `SimpleGraph.card_injective_hom_eq_sum_map_le`: they are counted by the
  embeddings `f : V ↪ W` with `F.map f ≤ G` (`TauCeti/Combinatorics/SimpleGraph/Counting.lean`)
  (Conventions, 2.2, 2.4).

## References

- J. A. Bondy, U. S. R. Murty, *Graph Theory*, Graduate Texts in Mathematics 244, Springer, 2008,
  §2.7: Lemma 2.20, Corollary 2.22, Lemma 2.24, Theorem 2.25, Lemma 2.26, Theorem 2.27,
  Corollary 2.28, Figure 2.13, Exercises 2.7.5 and 2.7.8, cited as reproduced in R. Gardner's
  open course notes, *Section 2.7. Graph Reconstruction* (East Tennessee State University, revised
  2020), faculty.etsu.edu/gardnerr/5340/notes-Bondy-Murty-GT/Bondy-Murty-GT-2-7.pdf, and the
  accompanying slides *2.7. Graph Reconstruction—Proofs of Theorems* (2020),
  faculty.etsu.edu/gardnerr/5340/Beamer-Bondy-Murty-GT/Proofs-BM-GT-2-7.pdf.
- P. J. Kelly, *A congruence theorem for trees*, Pacific J. Math. 7 (1957) 961–968.
- L. Lovász, *A note on the line reconstruction problem*, J. Combin. Theory Ser. B 13 (1972)
  309–310 (attribution).
- V. Müller, *The edge reconstruction hypothesis is true for graphs with more than n·log₂n edges*,
  J. Combin. Theory Ser. B 22 (1977) 281–283 (attribution).
- C. St. J. A. Nash-Williams, *The reconstruction problem*, in L. W. Beineke, R. J. Wilson (eds.),
  *Selected Topics in Graph Theory*, Academic Press, 1978, 205–236 (attribution).

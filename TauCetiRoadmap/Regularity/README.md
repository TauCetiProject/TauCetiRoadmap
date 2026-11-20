# Roadmap: graph regularity, finite weak regularity, and arity-3 hypergraph complexes

**Summary.** A regularity lemma cuts a large finite structure into boundedly many pieces between
which it looks random. A counting lemma then predicts how often a small pattern occurs from the
sizes of the pieces and the densities between them. This roadmap is the finite, combinatorial
regularity tower for graphs and for colorings of triples, with no analytic prerequisites.
Throughout, the vertex set V is finite, vertex partitions are partitions of all of V, densities are
zero on an empty support, and copies are labelled: they are counted as injective maps, without
dividing by automorphisms.

For colorings of the triples the objects are triadic complexes. A triadic complex consists of
vertex cells, a coloring of the ordered distinct pairs, and polyads. A polyad is three cells
together with three pair colors. A coloring of the triples is top-regular over a polyad when its
relative densities do not change on unions of boundedly many subpolyads that carry a fixed fraction
of the polyad. For graphs, the tower consists of weak regularity after Frieze and Kannan,
Szemerédi's lemma relative to a seed, and strong regularity with the induced counting of graphs on
three vertices.

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

Tau Ceti's regularity library, built on Mathlib's Szemerédi regularity lemma, contains the finite
carriers, the graph tower, the arity-3 vocabulary and the induced counting lemma over a regular
triadic complex; this roadmap's theorems are stated over it. Dense graph limits (graphons, the
analytic cut norm, analytic weak regularity and the homomorphism densities of finite graphs) are a
separate analytic theory, the roadmap DenseGraphLimits; the library's comparison theorems identify
the finite energy and cut discrepancy with their graphon counterparts. The roadmap Exchangeability
owns exchangeable arrays and their representation theorems, which are not targets here, and
CoboundaryExpansion uses the graded hypergraph complexes.

The specification has three layers, numbered 0, 8 and 9 below. Layer 0 defines homomorphism
densities of uniform hypergraphs. Layer 8 proves the strong regular approximation theorem. Layer 9
composes it with induced counting.

## How to read the build

The layers keep the numbers under which other roadmaps cite them. The material numbered 1 to 7
(partitions and energy, the seeded Szemerédi lemma, finite Frieze–Kannan, strong graph regularity,
the lower skeleton, polyads and top regularity), the vocabulary of Layers 0 and 8 and §§9.1–9.3
(placements and the prediction, local counting, the excluded contributions) form no layer here:
Scope and ownership says where each of them is. §0.1 uses no other layer: it needs the uniform
hypergraphs of Convention 3 and, for the comparison at `r = 2`, the graph densities of
DenseGraphLimits. §8.1 bundles the conclusion of the approximation theorem, and §8.2 proves it.
§9.4 needs §8.1 for the counting estimate over a strong regular approximation and §8.2 for the
composed endpoint. Each *Needs:* line lists the inputs of its statement and of its route, so
that a target proved by another route is not blocked behind an unrelated one.

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
   counting of §9.4 needs rank one only, so every such schedule serves it.
10. **Names.** Tau Ceti's declarations used here live in the namespaces `TauCeti`, `SimpleGraph`,
    `Finpartition` and `TauCeti.DenseGraphLimits`. The targets of Layers 0, 8 and 9 belong under
    `TauCeti/Combinatorics/Hypergraph/`. The acceptance file `Suggested.lean` states the headline
    theorems in `TauCetiRoadmap.Regularity`.

## Layer 0: finite colored graph and 3-uniform vocabulary

This layer adds homomorphism densities of uniform hypergraphs to the carriers of Conventions 3
and 5.

### 0.1 Homomorphism and injective densities of uniform hypergraphs

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
  injective density is the edge density `TauCeti.UniformHypergraph.edgeDensity H`,
  `|E(H)| / (n choose r)`, both sides being zero for `n < r`.
- For graphs `F` on `U` and `G` on `V`, the densities of `F.toUniformHypergraph` in
  `G.toUniformHypergraph` (Tau Ceti's `SimpleGraph.toUniformHypergraph`) are
  `TauCeti.DenseGraphLimits.homDensityFin F G` and `TauCeti.DenseGraphLimits.injHomDensity F G`.

*Needs:* Tau Ceti `TauCeti.UniformHypergraph`, `TauCeti.UniformHypergraph.edgeDensity`,
`TauCeti.UniformHypergraph.complete`, `TauCeti.UniformHypergraph.empty`,
`SimpleGraph.toUniformHypergraph`, `TauCeti.DenseGraphLimits.homDensityFin`,
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

Tau Ceti's uniform hypergraphs, their edge densities and the graph-to-hypergraph map; the graph
homomorphism densities of DenseGraphLimits Layer 9a for the comparison at `r = 2`; Mathlib's
falling factorial. No other layer of this roadmap.

## Layer 8: strong arity-3 regular approximation

The goal of this layer is to approximate a coloring of the triples by one that is regular over a
triadic complex of bounded complexity, with the schedules chosen first.

### 8.1 Strong regular approximations

Define `IsStrongRegularApproximation3 H H' C ε F R b`, for colorings
`H H' : TauCeti.Colored3Graph κ₃ V`, a triadic complex `C : TauCeti.TriadicComplex3 V`, an error
`ε : ℝ`, an error schedule `F : ℕ → ℝ`, a rank schedule `R : ℕ → ℕ` and a bound `b : ℕ`, as the
conjunction of five conditions:

1. `H.Approximates3 H' ε`: six times the number of unordered triples on which `H` and `H'` disagree,
   divided by `|V|³`, is at most `ε` (`TauCeti.Colored3Graph.editDiscrepancy3`);
2. `C.IsPolyadDecomposition`: every injective triple lies in the support of a selected polyad,
   which is unique because distinct polyads over one skeleton have disjoint supports;
3. `C.skeleton.LowerSkeletonRegular F`: the lower skeleton is pair-color regular at `F` evaluated at
   the number of vertex cells plus the number of pair colors (Convention 8);
4. `H'.TopRegularOverMostPolyads C (F C.complexity) ε (R C.complexity)`: the selected polyads over
   which `H'` is not top-regular at tolerance `F C.complexity` and rank `R C.complexity` carry at
   most an `ε`-proportion of the total selected support
   (`TauCeti.Colored3Graph.exceptionalPolyadMass`);
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

*Needs:* Tau Ceti `TauCeti.Colored3Graph.Approximates3`,
`TauCeti.TriadicComplex3.IsPolyadDecomposition`, `TauCeti.PairSkeleton3.LowerSkeletonRegular`,
`TauCeti.Colored3Graph.TopRegularOverMostPolyads`, `TauCeti.TriadicComplex3.complexity`, and for the
bullets `TauCeti.Colored3Graph.Approximates3.mono`, `TauCeti.Colored3Graph.Approximates3.trans`,
`TauCeti.PairSkeleton3.IsPairColorRegular.mono`,
`TauCeti.Colored3Graph.TopRegularOverMostPolyads.mono`, `TauCeti.TriadicComplex3.complexity_le`,
`TauCeti.TriadicComplex3.IsPolyadDecomposition.sum_card_support`.

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
discrepancy small enough for the loss over unions of at most `r` subpolyads, as in Tau Ceti's
`TauCeti.Colored3Graph.IsTopRegularOverPolyad.of_rank_one`: rank one at `δ` gives rank `r` at `ε'`
when `2^r δ ≤ ε'²`. The top half of the iteration is Tau Ceti's
`TauCeti.Colored3Graph.exists_topRegularOverMostPolyads`. It refines the pair palette of a lower
skeleton, keeping the vertex cells and with a host-independent bound on the palette, until a
coloring is top-regular over most polyads; its potential is the polyad energy
`TauCeti.Colored3Graph.polyadEnergy` (`polyadEnergy_mono_of_refines`,
`polyadDensityDeviation_abs_le`). The lower skeleton is regularized by Mathlib's
`szemeredi_regularity` and Tau Ceti's `SimpleGraph.exists_regular_equipartition_almost_refining`,
applied to the pair-color classes. Both leave a small proportion of irregular pairs of distinct
cells, and neither tests a cell with itself. The pair coloring belongs to the complex, not to the
host, so it is then changed on those cell pairs and inside each cell until every color is regular
on every pair of cells. A single color fixed by the reversal does this: it is regular on two
distinct cells, and on a cell with itself once the cell has more than `1/f` vertices, `f` the
parameter of condition 3 (§8.1, Checks). Rödl–Schacht likewise change the pair classes on few
pairs to make them regular on all pairs of distinct cells (Lemma 25 at `k = 2`). The polyads over
the changed cell pairs carry a small proportion of the triples once the cells are numerous, and
are charged to the exceptional mass. Top regularity passes to refinements by
`TauCeti.Colored3Graph.TopRegularOverMostPolyads.of_refinement` and survives edits by
`TauCeti.Colored3Graph.TopRegularOverMostPolyads.of_approximates3`. The source's divisibility
conditions are discharged by padding and rebalancing, and the resulting edit and regularity errors
are included in the parameter budget; they are not hypotheses of the theorem. *Needs:* §8.1; Tau
Ceti `TauCeti.TriadicComplex3`, `TauCeti.TriadicComplex3.VertexCellsControlled`,
`TauCeti.Colored3Graph`, and for the route `TauCeti.Colored3Graph.exists_topRegularOverMostPolyads`,
`TauCeti.Colored3Graph.polyadEnergy`, `TauCeti.Colored3Graph.IsTopRegularOverPolyad.of_rank_one`,
`TauCeti.Colored3Graph.TopRegularOverMostPolyads.of_refinement`,
`TauCeti.Colored3Graph.TopRegularOverMostPolyads.of_approximates3`,
`SimpleGraph.exists_regular_equipartition_almost_refining`; Mathlib `szemeredi_regularity`.

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
  pairs by edge and nonedge (Tau Ceti's `SimpleGraph.toPairColorSystem`). Suppose the lower skeleton
  with cells `P` and these two colors is `ε`-regular. Then any two distinct cells form an
  `ε'`-uniform pair for every `ε' > ε`, so `P` is `ε'`-uniform for `G` in Szemerédi's sense with no
  exceptional pair (`TauCeti.PairSkeleton3.IsPairColorRegular.isUniform`). Conversely, an
  `ε`-uniform pair of distinct cells is `ε`-regular for both colors
  (`SimpleGraph.IsUniform.isRegularPair_ofGraph`). The lower skeleton also tests a cell paired with
  itself, which Szemerédi's uniformity does not. The complexity plays the role of the number of
  fine parts in strong graph regularity, `SimpleGraph.StrongRegular`.
- With one vertex cell `V` and one pair color, the single polyad has as support all `(n)_3`
  injective triples. The complex has complexity `3`, and its lower skeleton is regular at
  `0 < f < 1` exactly when `n = 1` or `n > 1/f`.

### Dependencies

Tau Ceti's triadic complexes, lower-skeleton and top regularity, edit discrepancy, top
regularization and polyad energy; Mathlib's Szemerédi regularity lemma. Layer 0 is not used.

## Layer 9: induced counting

For a fixed colored 3-pattern `F₀` on `k` vertices, the prediction from a strong regular
approximation `(H', C)` is `H'.expectedInducedCount C F₀`
(`TauCeti.Colored3Graph.expectedInducedCount`). It sums over placements `φ` of the pattern vertices
into cells and routes `ψ` of pair colors. Each term is the falling-factorial injection count of `φ`,
times the pair-color densities of `ψ` over the canonical pairs `i < j`, times the relative densities
in `H'` of the pattern colors over the induced polyads of the triples `i < j < l`. The goal of this
layer is `|inducedCopyCount H F₀ − expectedInducedCount H' C F₀| ≤ ε · |V|^k`.

### 9.4 Assembly: counting from a strong regular approximation

Fix a finite top palette `κ₃`, a pattern `F₀ : TauCeti.FiniteColored3Pattern κ₃` on `k = F₀.k`
vertices and `ε > 0`. The counting parameters are host-independent and do not depend on the top
palette:

- `TauCeti.inducedCountingParameter3 k ε = (ε/6) / max(1, k³)`, for the edit discrepancy and the
  exceptional mass;
- `TauCeti.inducedCountingSchedule3 k ε n = (ε/12) / (max(1, k³) · max(1, n^(k choose 2)))`, the
  error schedule;
- `TauCeti.diagonalControl3 k ε = ⌈24 (k choose 2) / ε⌉`, the number of vertex cells.

The first two are positive for `ε > 0`. The third is positive for `ε > 0` and `k ≥ 2`, and is `0`
for `k ≤ 1`.

State the counting estimate over a strong regular approximation, which is Tau Ceti's counting
lemma over a regular triadic complex with its hypotheses bundled by §8.1. Suppose that the vertex
cells of `C` form an equipartition into at least `diagonalControl3 k ε` cells. Suppose that
`(H', C)` is a strong regular approximation of `H` (§8.1) at
`(inducedCountingParameter3 k ε, inducedCountingSchedule3 k ε, R, b)`, for some rank schedule
`R ≥ 1` and some `b`. Then
`|inducedCopyCount H F₀ − expectedInducedCount H' C F₀| ≤ ε · |V|^k`. The sources count copies of
a pattern from both sides in the dense case, where every density of the complex is large compared
with its regularity (Rödl–Schacht, *Regular Partitions of Hypergraphs: Counting Lemmas*, Theorems
10 and 13). Without that assumption they count cliques from both sides (Nagle–Rödl–Schacht,
Theorem 12) and copies of a general pattern from below (Nagle–Rödl–Schacht, Corollary 15). The
two-sided count of the induced copies of a colored pattern, summed over a polyad decomposition and
carried across an edit, is the statement of the library lemma.
*Route.* Unfold §8.1 and apply Tau Ceti's counting lemma over a regular triadic complex,
`TauCeti.Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le_of_topRegular`, at rank
`R C.complexity ≥ 1`. The complexity bound is not used. That lemma splits the error into six
charges, each at most `(ε/6) |V|^k`:

1. local counting along the top-regular routes of transversal placements, at the per-route budget;
2. the actual copies through exceptional polyads;
3. the predicted mass of exceptional routes;
4. the pair-counting error inside that prediction;
5. the actual and predicted copies of placements meeting a cell twice;
6. the transfer from `H'` to `H` across the edit.

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
*Needs:* §8.1 for the counting estimate; §8.2 for the composed endpoint; Tau Ceti
`TauCeti.Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le_of_topRegular`,
`TauCeti.inducedCountingParameter3`, `TauCeti.inducedCountingParameter3_pos`,
`TauCeti.inducedCountingSchedule3`, `TauCeti.inducedCountingSchedule3_pos`,
`TauCeti.diagonalControl3`, `TauCeti.Colored3Graph.expectedInducedCount`,
`TauCeti.Colored3Graph.inducedCopyCount`, `TauCeti.FiniteColored3Pattern`.

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

§9.4 needs §8.1 and §8.2 and Tau Ceti's induced counting lemma over a regular triadic complex with
its counting parameters. Layer 0 is not used.

## Worked examples

These examples run through the library notions the layers rest on, with the conventions above.

- **Energy.** Let `G = K_{2,1}` with parts `A = {a₁, a₂}` and `B = {b}`, edges `a₁b` and `a₂b`,
  and let `P = {A, B}`. The size-weighted energy `SimpleGraph.weightedEnergy G P` is
  `2 · (2/9) · 1² = 4/9`; the diagonal blocks contribute `0`, since `d(A, A) = 0/4` over the
  ordered pairs of `A`. The refinement into singletons also has weighted energy `4/9`, as it must
  by monotonicity. Mathlib's unweighted `Finpartition.energy` drops from `1/2` to `4/9` under the
  same refinement: it averages over the ordered pairs of distinct parts without size weights, and
  it is not monotone under arbitrary refinement.
- **Cut discrepancy.** For the 4-cycle with sides `{1, 2}` and `{3, 4}`, the cut discrepancy
  `SimpleGraph.cutDiscrepancy` of the bipartition is `0`. For the partition into one part it is
  `2 = |V|²/8`, attained at the rectangle `({1, 2}, {3, 4})`. The cut discrepancy is count-scaled;
  the normalized graphon cut norm of the same difference is `1/8`.
- **Induced three-vertex counts.** On three-vertex hosts, `SimpleGraph.inducedGraphCount3` is `0`
  for the edgeless pattern in the triangle, `6` for the triangle in itself, and `2` for one edge
  plus an isolated vertex in itself. With the partition into singletons, the coarse prediction
  `SimpleGraph.coarseInducedGraphEstimate` equals the induced count on every three-vertex host. For
  the edgeless pattern it uses the three nonedge factors `1 − d`; for the triangle, the three
  edge densities.
- **Polyads.** Take `V = {0, …, 5}` with cells `{0, 1}`, `{2, 3}`, `{4, 5}` and one pair color,
  and color a triple red when it contains `0`. The polyad on the three cells has 8 triples in its
  support and relative density of red `1/2`. Its vertex restriction to `{0}`, `{2, 3}`, `{4, 5}`
  carries half of the support and has relative density `1`. So the coloring is `(δ, 1)`-top-regular
  over this polyad exactly when `δ ≥ 1/2`.
- **Pair colors.** A singleton cell paired with itself has no distinct pair, so every pair-color
  density on it is `0` and the densities sum to `0`. The summation law needs a nonempty set of
  distinct pairs, not merely nonempty cells.
- **Faces of a triadic complex.** The graded complex of a triadic complex has the empty set at
  level 0, all singletons at level 1 and all two-element sets at level 2, since the pair coloring is
  total. At level 3 it has the underlying triples of the selected supports: all triples when the
  polyads decompose the injective triples.

## Downstream consumers

- [CoboundaryExpansion](../CoboundaryExpansion/README.md) Layer 2 specializes the graded complexes
  `HypergraphComplex r V` it cites from Layer 5 of this roadmap. They are Tau Ceti's
  `TauCeti.HypergraphComplex` (Scope and ownership).

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

**This roadmap owns** the homomorphism and injective densities of uniform hypergraphs and their
agreement with the graph densities (§0.1); strong regular approximations (§8.1); the strong
arity-3 regular approximation theorem (§8.2); and induced counting from a strong regular
approximation, with its composition with §8.2 (§9.4).

**Specified here and in the Tau Ceti library at the pin.** The rest of the material this roadmap
specifies is Tau Ceti's at the pin and is consumed by name: the finite graph regularity tower, the
arity-3 vocabulary, the induced counting lemma over a regular triadic complex and the comparisons
with dense graph limits. Other roadmaps cite it by the numbers below, which resolve as follows
(modules under `TauCeti/Combinatorics/`; declarations and their statements in the supplier
contracts).

| Section | Content | At the pin |
|---|---|---|
| Layer 0 | uniform hypergraphs with edge and block densities and the bridge to Mathlib's `Hypergraph`; total colorings of triples; finite colored patterns and labelled induced copy counts; graph homomorphism and injective densities | `Hypergraph/Basic.lean`, `Hypergraph/Colored/Basic.lean`, `Hypergraph/Colored/Counting.lean`; the graph densities are DenseGraphLimits' `TauCeti.DenseGraphLimits.homDensityFin` and `TauCeti.DenseGraphLimits.injHomDensity` (`DenseGraphLimits/HomDensity/Finite.lean`) |
| Layer 1 | block densities; the size-weighted energy, diagonal blocks included; the refinement parent; the exact weighted-square identity, the `√ε` absolute-deviation bound and refinement monotonicity; the hypergraph analogue | `Regularity/Partition/Energy.lean`, `Hypergraph/Energy.lean`, `Hypergraph/Basic.lean` |
| Layer 2 | almost-refinement with containment in the parent cell; the initial equitable partition; the seeded run of the energy induction; the refining regularity bound and theorem | `Regularity/Partition/AlmostRefines.lean`, `Regularity/Graph/SeededRegularity.lean` |
| Layer 3 | stepped counts, the count-scaled cut discrepancy and its elimination lemma, finite Frieze–Kannan with its supremum and refining forms | `Regularity/Graph/CutDiscrepancy.lean`, `Regularity/Graph/FriezeKannan.lean`; the bound is `4^⌈1/ε²⌉` |
| Layer 4 | nested refinement bound and exact refining regular equipartitions; strong regularity witnesses, their existence and bound; labelled induced three-vertex counts, the coarse prediction and the counting estimate, with its proof dependencies | `Regularity/Graph/SeededRegularity.lean`, `Regularity/Graph/StrongRegularity.lean`, `Regularity/Graph/InducedCount.lean`, `Regularity/Graph/SteppedInducedCount.lean`, `Regularity/Graph/Counting.lean`, `SimpleGraph/Regularity/Uniform.lean`; the estimate's error is `(15τ + 3√ε)|V|³ + 6m|V|²` for `τ = F #P` and coarse parts of at most `m` vertices |
| Layer 5 | graded hypergraph complexes with both conversions and round trips; labelled copies of a complex; pair-color systems with involutive reversal, the option-valued color and the raw-coloring construction; pair-color densities and their laws; lower skeletons, pair-color regularity and lower-skeleton regularity; the comparison with graph uniformity | `Hypergraph/Complex/Basic.lean`, `Hypergraph/Complex/Counting.lean`, `Hypergraph/PairColor/{Basic,Density,Regular,Graph}.lean` |
| Layer 6 | polyads with computed supports, extensionality, finiteness and the enumeration bound; the face-key dictionary; pair graphs; subpolyads, their supports and the vertex-subcell constructor; relative densities and their laws | `Hypergraph/Polyad/{Basic,Subpolyad,Density}.lean`, `Hypergraph/Colored/Density.lean`; the vertex-subcell constructor accepts vertex sets not contained in the cells |
| Layer 7 | unions of subpolyads; top regularity over a polyad at rank `r`; vertex-box regularity and its comparison at arity 2; slicing, rank and exceptional-mass lemmas | `Hypergraph/Polyad/{TopRegular,Rank}.lean`, `Hypergraph/PairColor/VertexBox.lean`, `Hypergraph/Triadic/Slicing.lean` |
| Layer 8 (vocabulary) | triadic complexes, complexity and the bridge to graded complexes with its four level equations; edit discrepancy and approximation; polyad decompositions; exceptional mass and top regularity over most polyads; controlled vertex cells | `Hypergraph/Triadic/Basic.lean`, `Hypergraph/Colored/EditDiscrepancy.lean`; a polyad decomposition is stated as a covering, disjointness being automatic |
| §9.1 | pattern placements and transversality; pair-color routes and their polyads; finiteness; placed counts; the injection count with its falling-factorial, transversal and size-product identities; the local and global predictions | `Hypergraph/Triadic/Placement.lean`, `Hypergraph/Colored/Counting.lean` |
| §9.2 | the counting parameters and route budget with their positivity and charges; lower-route counts and predictions; sparse routes; lower-route and placed counting | `Hypergraph/Triadic/{CountingParameters,SparseCounting,PlacedCounting,InducedCounting}.lean`; local counting holds at rank one, with no lower bound on the densities (below) |
| §9.3 | actual and predicted exceptional routes, nontransversal mass, edit transfer | `Hypergraph/Triadic/{Basic,ExceptionalPrediction,Nontransversal}.lean`, `Hypergraph/Colored/Stability.lean`; the edit-transfer and exceptional-route bounds carry the factor `k choose 3` |
| §9.4 (part) | the fibration identities for actual and predicted counts; the error decomposition and its arithmetic; the counting lemma over a regular triadic complex | `Hypergraph/Triadic/{Placement,ErrorDecomposition,InducedCounting}.lean` |
| comparisons | step graphon of a partition, cut discrepancy against the graphon cut norm, partition energy against graphon partition energy (any nonempty finite host by relabelling) | `Regularity/Graphon/Energy.lean`, `Regularity/Graphon/CutDiscrepancy.lean` |

The local counting of §9.2 determines what §9.4 asks of the rank and of the densities. Placed
counting holds at rank one
(`TauCeti.Colored3Graph.abs_placedInducedCopyCount_sub_expectedInducedCountAt_le`) and, at the
counting schedule, at every rank `r ≥ 1`
(`TauCeti.Colored3Graph.abs_placedInducedCopyCount_sub_expectedInducedCountAt_le_routeBudget3`), so
Convention 9 and §9.4 accept every rank schedule `R ≥ 1`. Lower-route counting holds for every
route at a transversal placement, with error `(k choose 2) · ε` times the cell-size product under
`ε`-regularity and no lower bound on the pair-color densities
(`TauCeti.abs_lowerRouteCountAt_sub_expectedLowerRouteCountAt_le`); the sparse-route bounds are
separate lemmas. The prediction along the routes that are not top-regular is bounded by
`TauCeti.Colored3Graph.exceptional_route_prediction_mass_le`, whose second term is the lower-route
counting error summed over all routes of all transversal placements. The counting parameters do
not depend on the top palette.

**Owned elsewhere.**

- *Dense graph limits*: graphons, the analytic cut norm, cut distance, compactness, analytic
  Frieze–Kannan and sampling, and the graph homomorphism densities `homDensityFin` and
  `injHomDensity` (its Layer 9a), are
  [DenseGraphLimits](../../Completed/DenseGraphLimits/README.md). Its Layer 9a leaves to this
  roadmap the alignment of this roadmap's densities with those two, which §0.1 makes for uniform
  hypergraphs at `r = 2`. The finite theory here and the analytic theory are independent
  formulations, neither derived from the other; DenseGraphLimits' cut norm, step graphons and
  partition energy meet the finite theory only in the comparison theorems above, which are proved
  after both.
- *Exchangeability*: sequence exchangeability, de Finetti, exchangeable arrays and the
  Aldous–Hoover representation are [Exchangeability](../../Completed/Exchangeability/README.md)
  (Layer 8 for arrays).
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
  `SzemerediRegularity.card_increment`, `SzemerediRegularity.energy_increment` and
  `Finpartition.energy_le_one`. The unweighted `Finpartition.energy`
  (`Mathlib/Combinatorics/SimpleGraph/Regularity/Energy.lean`) is a point of comparison, not an
  input: it sums over ordered pairs of distinct parts and divides by `#P²`.
- *Counting and hypergraph carriers*: `Nat.descFactorial`, `Nat.choose`, `Finset.powersetCard`,
  `Set.powersetCard`; `Hypergraph` (`Mathlib/Combinatorics/Hypergraph/Basic.lean`), a set-based
  undirected carrier with no uniformity, finiteness, density or counting API;
  `PreAbstractSimplicialComplex` (`Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`), a
  downward-closed family of nonempty finite faces.

### From Tau Ceti

Paths are under `TauCeti/Combinatorics/`. All the declarations below are proved at the pin.

- *Uniform hypergraphs* (`Hypergraph/Basic.lean`): `TauCeti.UniformHypergraph` (finset of
  `r`-element edges), `UniformHypergraph.toHypergraph` with `toHypergraph_vertexSet` (the whole
  host) and `toHypergraph_edgeSet` (the coerced edges), `UniformHypergraph.empty`,
  `UniformHypergraph.complete`, `UniformHypergraph.edgeDensity` (`|E| / (|V| choose r)`, with
  `edgeDensity_empty`, `edgeDensity_complete` for `r ≤ |V|` and `edgeDensity_eq_zero_of_card_lt`),
  `UniformHypergraph.blockDensity`, `SimpleGraph.toUniformHypergraph`.
- *Graph densities* (`DenseGraphLimits/HomDensity/Finite.lean`, owned by DenseGraphLimits):
  `TauCeti.DenseGraphLimits.homDensityFin F G = |Hom(F, G)| / |V(G)|^|V(F)|` and
  `TauCeti.DenseGraphLimits.injHomDensity F G = |Inj(F, G)| / (|V(G)|)_|V(F)|`, with
  `injHomDensity_eq_labelledCopyCount_div`.
- *Colorings, patterns, edits* (`Hypergraph/Colored/`): `TauCeti.Colored3Graph` (a coloring of
  `Set.powersetCard V 3`); `TauCeti.FiniteColored3Pattern` with `tripleColor`;
  `Colored3Graph.inducedCopyCount` (embeddings `Fin k ↪ V` preserving every triple color);
  `Colored3Graph.relDensityOn` with `relDensityOn_nonneg`, `relDensityOn_le_one`, `sum_relDensityOn`
  (nonempty support) and `relDensityOn_empty`; `Colored3Graph.editDiscrepancy3` (six times the
  disagreeing triples over `|V|³`), `Colored3Graph.Approximates3` with `Approximates3.mono`,
  `Approximates3.symm`, `Approximates3.trans`; `Colored3Graph.inducedCopyCount_edit_transfer`
  (`|ΔinducedCopyCount| ≤ (k choose 3) · editDiscrepancy3 · |V|^k`).
- *Energy* (`Regularity/Partition/Energy.lean`, `Hypergraph/Energy.lean`):
  `SimpleGraph.weightedEnergy` (`∑ A, B ∈ P, (|A||B|/|V|²) d(A, B)²`) with
  `weightedEnergy_eq_sum_part`; `SimpleGraph.weightedDensityDeviation_sq` (for `Q ≤ P`, the weighted
  squared deviation of fine from parent densities is the energy gap);
  `SimpleGraph.weightedDensityDeviation_abs_le` (an energy gap at most `ε` bounds the weighted
  absolute deviation by `√ε`); `SimpleGraph.weightedEnergy_mono_of_refines`;
  `Finpartition.refinementParent` (`TauCeti/Order/Partition/Finpartition.lean`);
  `UniformHypergraph.weightedEnergy` with its `weightedDensityDeviation_sq` and
  `weightedEnergy_mono_of_refines`, and `SimpleGraph.weightedEnergy_toUniformHypergraph`.
- *Seeded regularity* (`Regularity/Partition/AlmostRefines.lean`,
  `Regularity/Graph/SeededRegularity.lean`): `Finpartition.AlmostRefines` (each part `A` of `P₀` is
  covered up to `δ|A|` by parts of `P` contained in `A`), `AlmostRefines.mono_left` (exact
  refinement keeps almost-refinement),
  `Finpartition.IsEquipartition.exists_equipartition_card_eq_almostRefines`,
  `SimpleGraph.szemeredi_regularity_le`, `TauCeti.refiningRegularityBound`,
  `SimpleGraph.exists_regular_equipartition_almost_refining` (for an equipartition `P₀` and `0 < ε`,
  an `ε`-uniform equipartition almost refining `P₀` up to `ε` with at most
  `refiningRegularityBound ε #P₀` parts), `TauCeti.nestedRefinementBound`,
  `SimpleGraph.exists_regular_exact_refining_equipartition` (for an equipartition `P` and `0 < δ`, a
  `δ`-uniform equipartition `Q ≤ P` with at most `nestedRefinementBound δ #P` parts).
- *Weak regularity* (`Regularity/Graph/{CutDiscrepancy,FriezeKannan}.lean`):
  `SimpleGraph.steppedCount`, `SimpleGraph.cutDiscrepancy`, `SimpleGraph.cutDiscrepancy_le_iff`,
  `SimpleGraph.frieze_kannan` (for `0 < ε`, at most `4^⌈1/ε²⌉` parts and every rectangle deviation
  at most `ε|V|²`), `SimpleGraph.frieze_kannan_cutDiscrepancy`,
  `SimpleGraph.frieze_kannan_refining`.
- *Strong graph regularity*
  (`Regularity/Graph/{StrongRegularity,InducedCount,SteppedInducedCount,Counting}.lean`):
  `TauCeti.strongGraphRegularityBound`; `SimpleGraph.StrongRegular` (fields `refines`, `equitP`,
  `equitQ`, `regP`, `regQ` at `F #P`, `energyClose` at most `ε`, `boundedFine`);
  `SimpleGraph.exists_strong_regular` (for an equipartition `P₀`, `l ≤ |V|`, `0 < ε` and `F > 0`, a
  witness with bound parameter `max l #P₀` whose coarse partition almost refines `P₀` up to `ε` and
  has at least `l` parts); `SimpleGraph.inducedGraphCount3`;
  `SimpleGraph.coarseInducedGraphEstimate`; `SimpleGraph.StrongRegular.inducedGraphCount3_estimate`
  (with `τ = F #P > 0` and coarse parts of size at most `m`, the error is at most
  `(15τ + 3√ε)|V|³ + 6m|V|²`); `SimpleGraph.steppedInducedGraphCount3`,
  `SimpleGraph.abs_steppedInducedGraphCount3_sub_le` (`3√ε|V|³` across the energy gap),
  `SimpleGraph.abs_card_induced_fin_three_sub_le` (three pairwise `ε`-uniform cells: the induced
  count is within `3ε` times the volume of its density prediction),
  `SimpleGraph.inducedGraphCount3_le_sum_card_induced_add`; and, in
  `TauCeti/Combinatorics/SimpleGraph/Regularity/Uniform.lean`,
  `SimpleGraph.IsUniform.abs_card_interedges_sub_le` (an `ε`-uniform pair has rectangle count
  discrepancy at most `ε|A||B|`) and `SimpleGraph.IsUniform.abs_sum_sum_mul_sub_le` (the same for
  test functions with values in `[0, 1]`).
- *Graded complexes* (`Hypergraph/Complex/`): `TauCeti.HypergraphComplex` (levels of faces of
  cardinality at most `r`, downward closed, with the empty face), `HypergraphComplex.faces_zero`,
  `HypergraphComplex.toPreAbstractSimplicialComplex`,
  `HypergraphComplex.ofPreAbstractSimplicialComplex`,
  `HypergraphComplex.mem_toPreAbstractSimplicialComplex`, the round trips
  `HypergraphComplex.toPreAbstractSimplicialComplex_ofPreAbstractSimplicialComplex` and
  `HypergraphComplex.ofPreAbstractSimplicialComplex_toPreAbstractSimplicialComplex`,
  `HypergraphComplex.labelledCopyCount`.
- *Pair colors and the lower skeleton* (`Hypergraph/PairColor/`): `TauCeti.PairColorSystem` (fields
  `color`, `rev`, `rev_involutive`, `color_rev`), `PairColorSystem.colorOfPair`,
  `PairColorSystem.colorOfPair_swap`, `PairColorSystem.ofRaw`, `TauCeti.pairColorDensity` with
  `pairColorDensity_nonneg`, `pairColorDensity_le_one`, `sum_pairColorDensity` (nonempty
  distinct-pair support) and `pairColorDensity_swap`; `PairColorSystem.IsRegularPair`;
  `TauCeti.PairSkeleton3`, `PairSkeleton3.IsPairColorRegular` (every ordered pair of cells, a cell
  with itself included), `PairSkeleton3.IsPairColorRegular.mono`,
  `PairSkeleton3.LowerSkeletonRegular`; `SimpleGraph.toPairColorSystem`,
  `PairSkeleton3.IsPairColorRegular.isUniform`, `SimpleGraph.IsUniform.isRegularPair_ofGraph`;
  `PairColorSystem.IsVertexBoxRegularPair`,
  `PairColorSystem.IsVertexBoxRegularPair.isRegularPair_of_disjoint`,
  `PairColorSystem.IsRegularPair.isVertexBoxRegularPair`.
- *Polyads and top regularity* (`Hypergraph/Polyad/`): `TauCeti.Polyad3`, `TauCeti.polyadSupport`,
  `Polyad3.support`, `Polyad3.ext_data`, `TauCeti.card_polyad3_le`, `TauCeti.faceKey`,
  `Polyad3.ofData`, `Polyad3.pairSupport₀₁`, `Polyad3.pairSupport₀₂`, `Polyad3.pairSupport₁₂`,
  `Polyad3.pairwise_disjoint_support`; `TauCeti.Subpolyad3`, `TauCeti.subpolyadSupport`,
  `Subpolyad3.ext_data`, `Subpolyad3.ofSubcells`, `Subpolyad3.mem_ofSubcells_support`,
  `Subpolyad3.unionSupport`; `Colored3Graph.relativeDensity` with `sum_relativeDensity`;
  `Colored3Graph.IsTopRegularOverPolyad` (every color and every family of `r` subpolyads whose
  union carries at least a `δ`-fraction of the support: relative density within `δ`), with
  `of_rank_le`, `mono`, `of_pairSupport_subset` (slicing), `of_rank_one`,
  `isVertexBoxRegularOverPolyad`; `Colored3Graph.IsVertexBoxRegularOverPolyad`;
  `Colored3Graph.polyadEnergy` with `polyadEnergy_mono_of_refines` and
  `polyadDensityDeviation_abs_le`.
- *Triadic complexes* (`Hypergraph/Triadic/Basic.lean`, `…/Slicing.lean`, `…/EditStability.lean`,
  `…/TopRegularization.lean`): `TauCeti.TriadicComplex3`, `TriadicComplex3.complexity` with
  `complexity_le`, `TriadicComplex3.topFaces`, `TriadicComplex3.toHypergraphComplex` with
  `faces_one`, `faces_two` and `faces_three`; `TriadicComplex3.IsPolyadDecomposition` with
  `IsPolyadDecomposition.sum_card_support`; `TriadicComplex3.VertexCellsControlled`;
  `Colored3Graph.exceptionalPolyadMass`, `Colored3Graph.TopRegularOverMostPolyads` with
  `TopRegularOverMostPolyads.mono`, `TopRegularOverMostPolyads.of_refinement` and
  `TopRegularOverMostPolyads.of_approximates3`; `Colored3Graph.exceptionalPolyadMass_coarsen_le`;
  `Colored3Graph.exists_topRegularOverMostPolyads` (for `0 < η`, `0 < ε` and a rank `r`, a
  refinement of the pair palette of a lower skeleton, with the same cells and at most
  `topRegularRefinementBound` pair colors, over all but an `ε`-proportion of whose polyads the
  coloring is `(η, r)`-top-regular).
- *Placements and counting* (`Hypergraph/Triadic/`): `TauCeti.PatternPlacement3`,
  `PatternPlacement3.Transversal`, `TauCeti.PairColorPlacement3`, `PairColorPlacement3.polyad`,
  `PairColorPlacement3.IsTopRegularRoute`, `PairColorPlacement3.IsSparseRoute`;
  `TauCeti.placementInjectionCount` with `placementInjectionCount_eq_prod_descFactorial`,
  `placementInjectionCount_eq_prod_of_transversal` and `placementInjectionCount_le_prod`;
  `Colored3Graph.placedInducedCopyCount`, `Colored3Graph.expectedInducedCountAt`,
  `Colored3Graph.expectedInducedCount`,
  `Colored3Graph.inducedCopyCount_eq_sum_placedInducedCopyCount` (under a polyad decomposition);
  `TauCeti.lowerRouteCountAt`, `TauCeti.expectedLowerRouteCountAt`,
  `TauCeti.lowerRouteCountAt_le_of_sparseRoute`,
  `TauCeti.expectedLowerRouteCountAt_le_of_sparseRoute`,
  `TauCeti.abs_lowerRouteCountAt_sub_expectedLowerRouteCountAt_le`,
  `Colored3Graph.placedInducedCopyCount_le_lowerRouteCountAt`,
  `Colored3Graph.expectedInducedCountAt_le_expectedLowerRouteCountAt`,
  `Colored3Graph.expectedInducedCountAt_nonneg`,
  `Colored3Graph.placed_induced_counting3_of_sparseRoute`,
  `Colored3Graph.abs_placedInducedCopyCount_sub_expectedInducedCountAt_le`,
  `Colored3Graph.abs_placedInducedCopyCount_sub_expectedInducedCountAt_le_routeBudget3`;
  `TauCeti.inducedCountingParameter3`, `TauCeti.inducedCountingSchedule3`, `TauCeti.routeBudget3`
  (`ε / max(1, m^(k choose 2))`), `TauCeti.diagonalControl3` (`⌈24 (k choose 2)/ε⌉`), with
  `inducedCountingParameter3_pos`, `inducedCountingSchedule3_pos`,
  `inducedCountingParameter3_charge` and `routeBudget3_charge`;
  `Colored3Graph.exceptional_route_mass_le`, `Colored3Graph.exceptionalPredictedMass3`,
  `Colored3Graph.exceptional_route_prediction_mass_le`,
  `Colored3Graph.nontransversalPredictedMass3`,
  `Colored3Graph.nontransversal_actual_and_predicted_mass_le`;
  `Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le`,
  `Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le_of_placed_le`,
  `Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le_of_topRegular` (for a polyad
  decomposition `C`, `0 < ε`, `H` approximating `H'` within `inducedCountingParameter3 k ε`, a lower
  skeleton regular for `inducedCountingSchedule3 k ε`, `H'` top-regular over most polyads at
  tolerance `inducedCountingSchedule3 k ε C.complexity`, exceptional proportion
  `inducedCountingParameter3 k ε` and a rank `r ≥ 1`, and at least `diagonalControl3 k ε` equitable
  cells: `|inducedCopyCount H F − expectedInducedCount H' C F| ≤ ε|V|^k`).
- *Comparisons with dense graph limits* (`Regularity/Graphon/`):
  `SimpleGraph.stepGraphonAvg_finiteGraphGraphon_cellPartition_apply` (the block-average step
  graphon of `finiteGraphGraphon G` over the lifted partition `P.cellPartition` takes the value
  `d(P.part i, P.part j)` on the cells of `i` and `j`),
  `SimpleGraph.cutNorm_finiteGraphGraphon_sub_stepGraphonAvg` (the cut norm of the difference is
  `cutDiscrepancy G P / m²`), `SimpleGraph.graphonPartitionEnergy_finiteGraphGraphon` and
  `SimpleGraph.graphonPartitionEnergy_finiteGraphGraphon_comap_symm` (the weighted energy is the
  graphon partition energy, on `Fin m` with `0 < m` and on any finite host relabelled along
  `V ≃ Fin m`).

## References

- E. Szemerédi, *Regular partitions of graphs* (1978).
- A. Frieze, R. Kannan, *Quick approximation to matrices and applications*, Combinatorica 19 (1999).
- L. Lovász, B. Szegedy, *Szemerédi's Lemma for the Analyst*, GAFA 17 (2007).
- T. Tao, *Szemerédi's regularity lemma revisited*, Contrib. Discrete Math. 1 (2006): the
  strong-regularity (energy-gap stopping) iteration of strong graph regularity.
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
  homomorphism densities of graphs (§1 and §2.4), for §0.1.
- W. T. Gowers, *Hypergraph regularity and the multidimensional Szemerédi theorem*, Ann. of Math.
  166 (2007); T. Tao, *A variant of the hypergraph removal lemma*, JCTA 113 (2006).
- D. Conlon, J. Fox, *Graph removal lemmas* (survey, 2013).
- Y. Dillies, B. Mehta, *Formalising Szemerédi's Regularity Lemma in Lean*, ITP 2022
  ([doi:10.4230/LIPIcs.ITP.2022.9](https://doi.org/10.4230/LIPIcs.ITP.2022.9)): the Mathlib
  regularity and triangle-removal development consumed here.

# Roadmap: graph regularity, finite weak regularity, and arity-3 hypergraph complexes

This roadmap consumes Mathlib's finite-graph **regularity** ecosystem — `SimpleGraph`, edge densities,
`Finpartition` / `IsEquipartition` / `equitabilise`, the Szemerédi regularity lemma
(`szemeredi_regularity`), triangle counting/removal, and graph copy-counting (`SimpleGraph.Copy`). The
**dense graph limits** roadmap (graphons, the analytic cut norm, cut distance, analytic Frieze–Kannan,
compactness, sampling) is a separate analytic development. This roadmap develops the **finite
combinatorial regularity tower** — finite weak (Frieze–Kannan) regularity, **strong graph
regularity**, and **arity-3 hypergraph-complex regularity and counting** — with no analytic
prerequisites. It also specifies finite-facing comparison results with the dense graph limits API
(see *Interfaces exported to other roadmaps*).

The final theorem is an **arity-3 strong hypergraph regularity and regular-approximation theorem**,
tailored for induced counting. It regularizes a *hierarchy*, not only the top triples:

1. the **lower skeleton** — vertex cells, ordered pair-color systems, pair densities, pair
   cut-regularity, and their sub-cell restrictions;
2. the **top layer** — triads/polyads, relative top densities *over polyads*, top-type regularity,
   and exceptional-polyad control;
3. the **strong interface** — a bounded-complexity regular approximation whose lower skeleton is
   itself regular enough for **induced** counting of fixed finite colored 3-patterns.

This is deliberately stronger than a weak 3-uniform lemma that only regularizes triple edges. The
deliverable is not a single theorem but a reusable library: finite partition APIs, weighted block
energy, a graph-regularity bridge, finite weak (Frieze–Kannan) regularity, strong graph regularity,
hypergraph complexes, polyads, relative densities, regularity over polyads, the strong approximation,
and counting/embedding lemmas.

**Suggested home:** `TauCeti/Combinatorics/Regularity/{Partition,Graph,Strong}/` and
`TauCeti/Combinatorics/Hypergraph/{Basic,Complex,Regularity,Counting}/`. Graphons are **not** homed
here: they belong to the independent `TauCeti/Combinatorics/DenseGraphLimits/` development.

## Conventions

These conventions bind all layers and their public interfaces.

1. **Graphs.** Use Mathlib's `SimpleGraph V` with `[Fintype V]`. A matrix or kernel view is an
   adapter, not a replacement for the graph type.
2. **Partitions.** Use `Finpartition (univ : Finset V)`, `IsEquipartition`, `equitabilise`, and
   `IsUniform`. The order `P ≤ Q` means that `P` refines `Q`.
3. **Hypergraphs and counting.** `UniformHypergraph r V` has unordered finite edges of size `r`.
   Counts use ordered injective tuples. Pair colors are defined on
   `{p : V × V // p.1 ≠ p.2}`, and polyad supports consist of injective triples.
   Densities are zero when the denominator is zero; identities asserting total density one
   assume nonempty support.
4. **Complexes.** Bundle faces, cells, pair colors, and polyads. The complexity is the computed
   sum of the number of vertex cells, pair colors, and polyads, so a bound on complexity bounds
   each of these quantities.
5. **Colors.** `Colored3Graph κ₃ V` is a total coloring of unordered triples, hence symmetric.
   The lower palette `κ₂` is separate. Relative densities and top regularity are indexed by
   color. A nonedge is one of the palette values, so induced counting controls absence as well
   as presence.
6. **Schedules.** The local error is a function `F : ℕ → ℝ`. Lower-skeleton regularity uses
   `F (#vertex-cells + #pair-colors)`, and top regularity uses `F C.complexity`.
   The rank is a function `R : ℕ → ℕ`, chosen before regularization and evaluated at
   `C.complexity`. A constant rank is a special case, not the counting interface.
7. **Endpoint.** Prove regularity together with induced counting for fixed finite colored
   three-uniform patterns. Induced removal, arithmetic applications, and exchangeable-array
   representations are consumers outside this roadmap.

**Acceptance policy.** Everything here must land in `TauCeti/` `sorry`-free and axiom-clean
(`TauCeti/AGENTS.md`). The roadmap states the goals with `sorry` (allowed in this human-owned roadmap
library); the code repo discharges them. Following the roadmap-writing guide, `Suggested.lean` contains
only definitions whose bodies state a real condition and theorem targets whose propositions are already
expressible; a condition whose API does not yet exist is described here and added to `Suggested.lean`
only once its mathematical content can be expressed — never as `def _ : Prop := sorry`.

## Mathlib dependencies (consume)

Reuse these by name; do not rebuild them. (**Entry points checked** against the pinned toolchain;
some prose paths below are abbreviated.)

- **Szemerédi regularity:** `szemeredi_regularity (hε : 0 < ε) (hl : l ≤ card α) : ∃ P : Finpartition (univ : Finset α), P.IsEquipartition ∧ l ≤ #P.parts ∧ #P.parts ≤ SzemerediRegularity.bound ε l ∧ P.IsUniform G ε` (`Combinatorics/SimpleGraph/Regularity/Lemma.lean`).
- **Uniformity / energy:** `SimpleGraph.IsUniform`, `Finpartition.IsUniform`, `Finpartition.nonUniforms`, `SimpleGraph.nonuniformWitness` (`Regularity/Uniform.lean`); `Finpartition.energy` and the `SzemerediRegularity.increment` / `chunk` energy-boost machinery (`Regularity/{Energy,Chunk,Increment}.lean`).
- **Partitions:** `Finpartition` (`Order/Partition/Finpartition.lean`), `Finpartition.IsEquipartition` (`(parts).EquitableOn card`, `Order/Partition/Equipartition.lean`), and `Finpartition.equitabilise` / `Finpartition.exists_equipartition_card_eq` (both in `Combinatorics/SimpleGraph/Regularity/Equitabilise.lean`). **`P ≤ Q` = `P` refines `Q`.**
- **Densities and copies:** `SimpleGraph.edgeDensity` (`SimpleGraph/Density.lean`); `SimpleGraph.Copy`, `IsContained` (`⊑`), `Free`, `copyCount`, `labelledCopyCount` (`SimpleGraph/Copy.lean`); triangle counting/removal and `triangleRemovalBound` (`SimpleGraph/Triangle/`).
- **Building blocks:** `Nat.descFactorial` (falling factorial), `Finset.powersetCard`, `Nat.choose`.
- **Hypergraphs:** `Hypergraph` ([`Mathlib/Combinatorics/Hypergraph/Basic.lean`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Combinatorics/Hypergraph/Basic.lean)) is a set-based undirected carrier — `vertexSet : Set α` and `edgeSet : Set (Set α)`, with `Adj`, `EAdj`, `map`, `IsIsolated`, `IsLoop`, `IsTrivial`/`trivialOn`, `IsComplete`/`completeOn`, and a bottom element. It carries **no uniformity predicate and no finiteness, density, or counting API**, which is what Layers 5–9 consume throughout. The hypergraph objects here are therefore finite computational representations in their own right, bridged to the Mathlib carrier by `UniformHypergraph.toHypergraph` (Layer 0) rather than replaced by it.
- **Simplicial complexes:** `PreAbstractSimplicialComplex`
  (`AlgebraicTopology/SimplicialComplex/Basic.lean`) is a downward-closed family of nonempty finite
  faces. Layer 5 supplies the finite bounded grading and the empty face, with conversions in both
  directions and membership and round-trip theorems.

## Cross-roadmap dependencies

| Area | Owner | This roadmap's role |
|---|---|---|
| `SimpleGraph`, graph maps/counting, `Finpartition`, Szemerédi regularity | **Mathlib** | consume directly; add thin Tau Ceti-facing wrappers only where they remove friction |
| Graphons, analytic cut norm / Frieze–Kannan, cut distance, graphon sampling | **Dense graph limits roadmap** | independent parallel theory; consume its public API only in the comparison results specified here |
| Sequence exchangeability, de Finetti, exchangeable arrays / Aldous–Hoover | **Exchangeability roadmap** | background/consumer only; **not** the peak |
| Finite weak regularity (`steppedCount`, `cutDiscrepancy`, finite Frieze–Kannan) | **this roadmap** | build (Layer 3) |
| Strong graph regularity | **this roadmap** | build (Layer 4) |
| Hypergraph complexes, polyads, strong hypergraph regularity, induced counting | **this roadmap** | build (Layers 5–9) |

The dense graph limits roadmap covers graphons, the analytic cut norm, cut distance, analytic
Frieze–Kannan, and sampling. This roadmap's Layer 3 develops **finite weak regularity** —
`steppedCount`, the count-scaled `cutDiscrepancy`, and a directly proved finite Frieze–Kannan
theorem — as its own layer, with no graphon imports: the finite and analytic theorems are
**independent formulations, neither derived from the other**. The finite-facing comparison adapters
owned here are downstream interfaces, not inputs to either proof (see *Interfaces exported to other
roadmaps*). `Suggested.lean` imports only Mathlib and pins the Layer-3 targets directly.

## The build, in layers

Each layer lists what it **consumes**, what it **builds**, and its **acceptance gate**.

### Layer 0 — finite colored graph and 3-uniform vocabulary

- **Consume.** `SimpleGraph`, `SimpleGraph.Copy` / `copyCount`, `Nat.descFactorial`, `Finset.powersetCard`.
- **Build.** `UniformHypergraph r V`, its edge density, the total unordered coloring
  `Colored3Graph κ₃ V`, and the colored and hypergraph copy-counting API. Define plain-graph hom and
  injective densities from `SimpleGraph.Copy` and `Nat.descFactorial`.
- **Bridge to Mathlib's carrier.** `UniformHypergraph.toHypergraph : UniformHypergraph r V → Hypergraph V`,
  with `toHypergraph_vertexSet` and `toHypergraph_edgeSet` proving the two carriers agree. The finite
  representation stays the public one: `Hypergraph` has no uniformity, finiteness, density, or
  counting API, and every layer above states its densities and counts over the finite form.
- **Gate.** `K₂`, a triangle, the complete and empty `r`-uniform hypergraphs; hom densities normalized by powers, injective densities by the falling factorial `(n)_k`.

### Layer 1 — partitions, block densities, refinement, energy
- **Consume.** `Finpartition`, `equitabilise`, `edgeDensity`. Mathlib's `SzemerediRegularity.increment` boost machinery is an **alignment point / proof template**, not a consumed theorem: it is stated for Mathlib's unweighted `Finpartition.energy`, and this layer's `weightedEnergy` is the size-weighted energy, so the boost does not transport. This layer builds its own energy increment.
- **Build.** `UniformHypergraph.blockDensity`; the **size-weighted** graph energy `weightedEnergy` (the `L²` norm of the block-average step function, casts before division, **including** the diagonal blocks `i = j`) and its refinement-monotonicity `weightedEnergy_mono_of_refines`; the hypergraph-level analogue. **Not** Mathlib's unweighted `Finpartition.energy`, an `offDiag`-based average that is *not* Jensen-monotone under arbitrary refinement (it is monotone only inside the `increment` argument). The comparison with the analytic `graphonPartitionEnergy` is specified in the separate interoperability results below.
- **Gate.** `weightedEnergy` agrees with the block-average `L²` on graphs; the diagonal and repeated-part conventions are explicit.

### Layer 2 — Szemerédi graph regularity bridge
- **Consume.** Mathlib's exported `SzemerediRegularity` machinery: `increment` (a `bind` of
  per-part chunks, so it exactly refines its input), `increment_isEquipartition`, `card_increment`,
  `energy_increment`, and `Finpartition.energy_le_one`. These supply the analytic content.
- **Build.** The seed-aware construction. `szemeredi_regularity` itself takes no seed and relates
  its output to nothing, and the seed cannot be recovered afterwards: uniformity is not hereditary,
  so post-refining a regular partition is invalid, and common refinement with `P₀` loses
  equitability. So this layer builds: an **initial equitable partition almost-refining `P₀`** (where
  divisibility forces `AlmostRefines`' `δ` and `refiningRegularityBound`), and a
  **seed-aware run of the energy induction** over the consumed increment. Also `AlmostRefines`,
  including containment of each selected cell in its parent cell, and
  `exists_regular_equipartition_almost_refining`, which starts from an equipartition `P₀`, assumes
  the host is large enough, and returns a regular equipartition almost-refining `P₀` with complexity
  bounded by `refiningRegularityBound`. Exact refinement transports almost-refinement, so the
  iteration preserves it. Both build items are constructed here: Mathlib's `increment` supplies the
  analytic step of each round, and the seed-aware run of the induction over it is Tau Ceti's.
- **Gate.** Yields "all but ε-mass of pairs regular, boundedly many parts, almost-refining an equipartition `P₀`" — the input strong regularity iterates on.

### Layer 3 — finite weak regularity
- **Consume.** Layer 1's finite energy and partition machinery.
- **Build.** `steppedCount` (the count predicted by the partition-stepped graph on a test rectangle:
  each cell pair contributes its density times the trace masses `|A ∩ C|·|B ∩ D|`); the finite
  `cutDiscrepancy` (the maximum rectangle deviation between true and stepped counts, with its
  elimination lemma `cutDiscrepancy_le_iff`) — **count-scaled**, with the analytic normalized cut norm treated in the comparison results; and a **direct finite Frieze–Kannan theorem**
  `frieze_kannan`: for every `ε > 0` a partition with at most `4^(⌈1/ε²⌉+1)` parts whose stepped
  prediction is within `ε·|V|²` of the true count on **every** rectangle, with the supremum-form
  corollary `frieze_kannan_cutDiscrepancy` derived from it.
- **Gate.** Uniform `ε·|V|²` rectangle discrepancy with the explicit single-exponential bound — and
  **no graphon imports or analytic prerequisites** anywhere in the layer.

### Layer 4 — strong graph regularity

**Goal.** Construct nested coarse and fine equipartitions with controlled energy increment and
complexity, and expose a counting lemma that uses them.

**Consume.** Layers 1–2 (`weightedEnergy`, the almost-refining bridge) and `IsUniform`.

**Build.**

- `nestedRefinementBound` and `exists_regular_exact_refining_equipartition`, producing an exact
  refining regular equipartition from an equipartition;
- `StrongRegular`, consisting of equipartitions `Q ≤ P`, regularity of `P` at `ε`, regularity of `Q`
  at `F (#P.parts)`, energy increment at most `ε`, and a bound
  `#Q.parts ≤ strongGraphRegularityBound ε F l₀`;
- `exists_strong_regular`, starting from an equipartition `P₀`, with a requested minimum complexity
  and an almost-refinement conclusion;
- `StrongRegular.inducedGraphCount3_estimate`, with the following count, prediction, and bound.

For `J : SimpleGraph (Fin 3)`, count labeled **induced injections** into `G`, without dividing by
automorphisms. For an injective assignment `φ` of the three vertices to parts of `P`, let
`dᵢⱼ = edgeDensity G (φ i) (φ j)`. Its contribution to `coarseInducedGraphEstimate3 J G P` is
`∏ᵢ |φ i|` times the product, over `i < j`, of `dᵢⱼ` when `J.Adj i j` and `1-dᵢⱼ` otherwise.
Sum over these distinct-cell assignments only. Thus this estimate predicts all induced patterns,
not just triangles or edge-preserving homomorphisms.

Write `n = |V|`, `τ = F #P.parts`, and suppose every coarse cell has size at most `m`.
For `0 ≤ ε`, `0 < τ ≤ 1`, and any threshold `η > 0`, the counting target is

```text
|inducedGraphCount3 J G - coarseInducedGraphEstimate3 J G P|
  ≤ (16τ + 3η + 3ε/η) n³ + 6m n².
```

**Proof dependencies.** Establish the following estimates in this layer. A `τ`-uniform pair has
rectangle count discrepancy at most `τ |A||B|`; the same inequality holds for tests with values
in `[0,1]` by finite summation over their level sets. Telescoping the three factors therefore
bounds the induced count on a triple of regular fine cells by `3τ` times its volume. Mathlib's
`Finpartition.IsEquipartition.sum_nonUniforms_lt` bounds the bad fine-pair mass by `4τ n²`;
the three possible pairs contribute at most `12τ n³`. The constant `16` bounds their sum.
Include all cell assignments temporarily when comparing fine and coarse predictions. Refinement
and the weighted-energy identity give mean squared density difference at most `ε`, and
`|x| ≤ η + x²/η` gives mean absolute difference at most `η + ε/η`. Telescoping contributes
`3(η + ε/η)n³`. Finally, discard repeated-cell assignments on the fine actual side and the
coarse predicted side, each at cost at most `3mn²`; fine cells have size at most `m` by refinement.
The empty host is handled directly.

The estimate consumes `refines`, `equitQ`, `regQ`, and `energyClose`. The remaining fields of
`StrongRegular` are needed for existence and complexity control, not for this counting step.
This statement and proof route use only this roadmap and Mathlib; no external library import or
witness adapter is a prerequisite.

**Gate.** Prove the displayed estimate for every graph on `Fin 3`, and specialize it to the triangle
and the edgeless pattern. Verify that the latter uses three nonedge-density factors.

### Layer 5 — hypergraph complexes and the lower skeleton

**Goal.** Define the cell and pair-color data over which arity-3 regularity is measured.

**Consume.** `Finpartition` and Layer 1.

**Build.**

- `HypergraphComplex r V`, with finite levels of faces of cardinality at most `r`, downward
  closure, and the empty face. The level index is face cardinality, not simplicial dimension:
  triples have level 3 and dimension 2. Its `toPreAbstractSimplicialComplex` forgets the empty
  face and grading. The converse takes a Mathlib complex whose face cardinalities are bounded by
  `r` on a finite host and adjoins the empty face. Membership and both round-trip identities
  specify the correspondence;
- `PairColorSystem κ₂ V` on ordered distinct pairs, carrying an **involutive palette reversal**
  `rev` and the coherence law `color_rev`, together with `colorOfPair`, `colorOfPair_swap`, and
  `pairColorDensity`. Routes are then indexed by **canonical orientation** (`i < j`), the reverse
  color being recovered by `rev`;
- `pairColorDensity_nonneg`, `pairColorDensity_le_one`, `sum_pairColorDensity`, and
  `pairColorDensity_swap`. The summation law requires a nonempty set of distinct pairs, not
  merely nonempty cells. The same singleton in both roles is a zero-denominator example;
- `PairColorSystem.ofRaw`, inducing a coherent coloring on `κ₂ × κ₂` from a raw directed one, at a
  squared palette cardinality;
- `PairSkeleton3 κ₂ V`, bundling a vertex partition and pair-color system;
- skeleton-relative `IsPairColorRegular S ε`, quantified over cells of `S.vertexPart` and their
  subcells;
- `LowerSkeletonRegular S F`, evaluated at
  `#S.vertexPart.parts + #κ₂`.

**Gate.** Relate the arity-2 specialization to the graph layer and define labeled copies of a fixed
complex.

### Layer 6 — polyads, subpolyads, and relative density

**Goal.** Define the local supports on which top-level densities and regularity are tested.

**Consume.** Layer 5.

**Build.**

- `Polyad3 S`, determined by three vertex cells and three pair colors, with the **computed**
  `polyadSupport` and `Polyad3.support` giving the corresponding role-ordered injective triples;
- data extensionality (`Polyad3.ext_data`), `DecidableEq`, `Fintype`, and the enumeration bound
  `card_polyad3_le` — the finiteness `TriadicComplex3.polyads : Finset (Polyad3 _)` requires;
- `faceKey`, the named index-reversed dictionary `![k₁₂, k₀₂, k₀₁]` translating role-pair keys to
  the omitted-coordinate keys a `polyadBlock`-style API uses;
- `Polyad3.ofData` and the pair graphs `pairSupport₀₁`, `pairSupport₀₂`, and `pairSupport₁₂`;
- `Subpolyad3 P` in the Rödl–Schacht/NRS form, selecting arbitrary subgraphs of those three pair
  graphs, with the computed `subpolyadSupport`, its own extensionality and finiteness, and
  `Subpolyad3.ofSubcells` as the vertex-subcell constructor characterized by
  `mem_ofSubcells_support`;
- `relDensityOn` and the color-indexed `relativeDensity`, read through the underlying unordered
  triple; nonnegativity, the upper bound one, the sum over all colors on nonempty support, and
  the empty-support value zero. Export the same laws for `relativeDensity` by specialization.

For distinct cells, a matching unordered triple has one role assignment. Repeated-cell assignments
are accounted for in Layer 9.

**Gate.** Compute a relative triple density over a polyad and one of its subpolyads.

### Layer 7 — top regularity over polyads

**Goal.** State the counting-ready top-regularity condition.

**Consume.** Layer 6.

**Build.**

- `unionSupport` for a family of subpolyads;
- `IsTopRegularOverPolyad H P δ r`, the NRS `(δ, r)` condition tested against unions of at most
  `r` subpolyads;
- `IsVertexBoxRegularOverPolyad`, the weaker vertex-subcell condition used for comparison results;
- slicing, inheritance, and exceptional-mass lemmas.

The induced-counting theorem uses `IsTopRegularOverPolyad`; its required rank is selected in
Layer 9.

**Gate.** Compare the vertex-box condition at arity 2 with pair regularity, and verify that the rank
condition is color-indexed.

### Layer 8 — strong arity-3 regular approximation

**Goal.** Approximate a colored 3-graph by one that is regular over a bounded triadic complex.

**Consume.** Layers 5–7.

**Build.**

- `TriadicComplex3 V`, which chooses its pair palette and carries a lower skeleton and polyads;
- the computed complexity `C.complexity` and the bridge `C.toHypergraphComplex`, with its four
  characteristic equations: level 0 is `{∅}`, level 1 is all singleton subsets of the host,
  level 2 is all two-element subsets (the pair coloring is total), and level 3 is the set of
  underlying unordered triples in the selected polyad supports. No top palette parameter is
  attached to `TriadicComplex3 V`; it enters only through a coloring or a predicate on one;
- `editDiscrepancy3 H H'` and `Approximates3 H H' ε` for an explicit approximant `H'`;
- `IsPolyadDecomposition`, `exceptionalPolyadMass`, and
  `TopRegularOverMostPolyads H' C η ε r`;
- `VertexCellsControlled C t₀` and `ComplexityBounded C b`;
- `regularityBound3 q₃ ε F R t₀`, for a rank schedule `R : ℕ → ℕ` with `1 ≤ R n`;
- `IsStrongRegularApproximation3 H H' C ε F R t₀` and the existence theorem
  `exists_strong_regular_approximation3`.

**Pinned choices.** The complex chooses the finite pair palette. Its complexity counts vertex cells,
pair colors, and polyads. The top-regularity parameter `F C.complexity` is separate from the
exceptional-mass bound. Top regularity is at rank `R C.complexity`. The complexity bound depends on
the top palette, both schedules, and the requested vertex floor. The theorem returns equitable
vertex cells satisfying that floor. The order is: choose the error and rank schedules; obtain a
complexity bound; for a host above that bound, obtain a complex and evaluate the schedules there.
This follows Rödl–Schacht I, Theorem 2.3, where the rank is a function of lower-complexity data.
The scalar complexity here bounds each component; constructing the corresponding majorant of the
source's tuple-indexed schedule is part of the Layer 8 proof.

**Gate.** Compare the two-dimensional shadow of these definitions with Layer 4's graph API.

### Layer 9 — induced counting

**Goal.** For a fixed colored 3-pattern `F₀` on `k` vertices, define an intrinsic prediction from a
strong regular approximation `(H', C)` and prove

`|inducedCopyCount H F₀ - expectedInducedCount H' C F₀| ≤ ε · |V|^k`.

**Consume.** Layer 8.

#### 9A. Placements, routes, and the prediction

Build `FiniteColored3Pattern`, `Colored3Graph.inducedCopyCount`, and:

- `PatternPlacement3`, assigning pattern vertices to vertex cells, with the predicate
  `PatternPlacement3.Transversal`;
- `PairColorPlacement3`, assigning one pair color to each canonical pair `i < j` and identifying
  the induced polyad of every pattern triple;
- `placedInducedCopyCount`;
- `expectedInducedCountAt` and its sum `expectedInducedCount`.

Define `placementInjectionCount φ` as the number of injective maps respecting the assigned cells.
If `m_A = #{i : φ.vertexCell i = A}`, prove

```text
placementInjectionCount φ = ∏ A ∈ C.skeleton.vertexPart.parts, (|A|)_{m_A}.
```

Here `(a)_b = Nat.descFactorial a b`. It is zero if a cell is too small for its assigned vertices;
an unused cell contributes one. At a transversal placement it equals `∏ᵢ |φ.vertexCell i|`.
Check the repeated-cell case explicitly: two labeled vertices assigned to a two-element cell
have two eligible injections, not four independent choices.
For every placement, the exact prediction is

```text
expectedInducedCountAt H' C F₀ φ ψ
  = placementInjectionCount φ
    × ∏_{i<j} pairColorDensity C.skeleton.pairColors (ψ.pairColor(i,j)) (φ i) (φ j)
    × ∏_{i<j<l} relativeDensity H' (F₀.pattern {i,j,l}) (ψ.polyad(i,j,l)).
```

All factors are cast before multiplication. Each unordered pattern triple occurs once, through
its increasing ordering. The definitions in `Suggested.lean` implement this formula and the
placed actual count; the falling-factorial and transversal identities are proof targets. The
plain size product in `expectedLowerRouteCountAt` is an upper envelope, not an alternative
definition of the injection factor. The global prediction sums this exact local prediction.

#### 9B. Local counting

Define the host-independent calibration data `inducedCountingParameter3`,
`inducedCountingSchedule3`, `exceptionalPredictionSlack3`, `inducedCountingRankSchedule3`, and
`diagonalControl3`, together with their positivity, charge, and calibration lemmas.

Define `routeBudget3` by dividing the available error by the maximum number of routes over one
placement. The lower-skeleton contribution is organized through:

- the concrete counts `lowerRouteCountAt` and `expectedLowerRouteCountAt`;
- the sparse/dense split `IsSparseRoute`, with self-bounds for sparse routes;
- `pairRouteRegularityThreshold3`, the pair-regularity strength used for dense-route counting;
- `requiredTopCountingRank3`, the pattern- and error-dependent top rank;
- `lowerRoute_counting3` and `placed_induced_counting3_of_denseRoute`;
- calibration lemmas relating the global schedule and rank to the local requirements.

The resulting theorem `placed_induced_counting3` applies to a transversal placement and a
top-regular route. Its other hypothesis is lower-skeleton regularity; the schedule provides rank
adequacy through `requiredTopCountingRank3_le_inducedCountingRankSchedule3`. It counts
in `H'`; the edit to `H` is performed after global summation.

**Pinned choices.** Pair-regularity input strength and counting output error are separate
parameters. Sparse routes form a local branch rather than a global error charge. The top rank
schedule depends on the pattern and error and is evaluated at the complex's complexity. Its
calibration holds for every complex, without a hypothesis involving `regularityBound3`
(see *Two pinned interfaces*).

#### 9C. Globally excluded contributions

- `exceptional_route_mass_le` bounds the actual contribution of routes through exceptional
  polyads.
- `exceptionalPredictedMass3` and `exceptional_route_prediction_mass_le` bound their predicted
  contribution among transversal placements.
- `nontransversalPredictedMass3` and `nontransversal_actual_and_predicted_mass_le` bound the actual
  and predicted repeated-cell contributions under
  `VertexCellsControlled C (diagonalControl3 k ε)`.
- `inducedCopyCount_edit_transfer` bounds the global change from the count in `H'` to the count in
  `H`.

The predicted exceptional-route term is transversal; the predicted repeated-cell term is assigned
to the diagonal estimate.

#### 9D. Assembly

Provide finite instances for placements and routes and prove the exact identities
`inducedCopyCount_eq_sum_placed` and `expectedInducedCount_eq_sum`. The global error is divided as
follows:

| Charge | Controlling target |
|---|---|
| Local placed counting | `placed_induced_counting3` and `routeBudget3` |
| Actual exceptional routes | `exceptional_route_mass_le` |
| Predicted exceptional mass | `exceptional_route_prediction_mass_le` |
| Predicted lower-route slack | `exceptionalPredictionSlack3_charge` |
| Actual and predicted nontransversal mass | `nontransversal_actual_and_predicted_mass_le` |
| Transfer from `H'` to `H` | `inducedCopyCount_edit_transfer` |

The parameter, schedule, slack, rank, and diagonal floor make every row at most
`(ε / 6) · |V|^k`. The arithmetic combination is `sixCharge_assembly`; the endpoint is
`induced_counting_from_strong_regular_complex3`. The composed endpoint
`exists_strong_regular_approximation3_counting` instantiates Layer 8 with these schedules and returns
the approximant, controlled cells, regularity, and the counting estimate together. Its large-host
hypothesis is precisely the resulting `regularityBound3`.

**Gate.** Work out the prediction and counting bound for one fixed colored 3-pattern.

## Worked examples (acceptance gates)

Independent of implementation: the block-average energy equals the `L²` of the step function; the
refining bridge yields a bounded, almost-refining regular equipartition; the finite Frieze–Kannan
theorem bounds the rectangle discrepancy of a small concrete graph at the pinned scale; strong
regularity produces a coarse/fine pair with the pinned properties; a 3-uniform worked example runs
vertex cells → pair cells → triad → relative triple density → subpolyad density; and at least one
fixed colored 3-pattern is counted from a regular triadic complex.

**Computed-value backstops.** `t(K₂, ·)` edge densities on small graphs; the empty and complete
`r`-uniform hypergraph densities (`0` and `1`, with the `r > card V` convention giving `0`); a triangle
count in a concrete 3-uniform example.

## Ordering

Layers 0–4 depend only on the listed Mathlib APIs and establish the finite graph-regularity
substrate. The arity-3 tower (5–9) then proceeds: skeleton (5) →
polyads/densities (6) → top regularity (7) → the strong approximation (8) → induced counting (9).
Layers 4 and 8 attract duplicate work, so **register an Intention and `claim` the specific target**
before a substantial push (see *Coordinating work* in the repository README).

## Interfaces exported to other roadmaps

This roadmap exports finite regularity and counting interfaces to consumer roadmaps — deterministic
regularity inputs for exchangeable-array statements and removal-style / arithmetic hooks. These are
**downstream consumers, not local endpoints**. The finite sampling lemmas here supply deterministic
regularity inputs for random-array statements; the exchangeability roadmap owns the representation
theorem and the API those inputs feed.

**Required interoperability results.** This roadmap owns the following comparisons with the public
DenseGraphLimits API. They are proved after their finite and analytic prerequisites; neither proof
of regularity depends on them. Prove: a
`stepGraphonOfFinpartition`
compatibility; identification of the finite `cutDiscrepancy`'s `SimpleGraph` specialization with the
analytic Frieze–Kannan statement (minding the scaling — `cutDiscrepancy` is count-scaled by `|V|²`,
the graphon cut norm is normalized); the energy comparison `graphonPartitionEnergy_finiteGraphGraphon`
— for `G : SimpleGraph (Fin m)` with `0 < m`, `weightedEnergy G P` equals `graphonPartitionEnergy` of
`finiteGraphGraphon G` at the measurable partition of `I` whose parts are the unions of the equal
vertex subintervals over each `P`-part (no normalization mismatch: Mathlib's `edgeDensity A B` counts
ordered adjacent pairs on `A × B`, matching the graphon integral and the `|A||B|/m²` weights, diagonal
blocks included; generic **nonempty** finite `V` transports along `V ≃ Fin (Fintype.card V)`, and the
empty graph's energy is degenerate on both sides); and name alignment of the Layer-0 hom/injective
densities with the graphon roadmap's `homDensityFin` / `injHomDensity`. Completion of these comparison results is required separately from the finite-layer gates.

## Non-goals

- This roadmap does **not** own dense graph limit theory (graphons, the analytic cut norm / cut
  distance, compactness, analytic Frieze–Kannan); those live in the dense graph limits roadmap. It
  **does** own the finite weak-regularity theory (`steppedCount`, `cutDiscrepancy`, the finite
  Frieze–Kannan theorem); finite–analytic comparisons are required comparison results here,
  not inputs to the finite regularity tower.
- It does **not** own exchangeability or representation theorems for exchangeable arrays; it exports
  deterministic finite regularity inputs those roadmaps consume.
- It does **not** culminate in arithmetic applications, and does **not** package a one-off induced
  removal theorem as its endpoint. Consumer roadmaps own induced removal and arithmetic
  applications; this roadmap ends at counting.

## Two pinned interfaces

Two choices bind several layers at once. They are stated here rather than in API docstrings, so that
declarations state contracts and this section states the commitment behind them.

**The pair-regularity predicate and the route divisor are a matched pair.** `IsPairColorRegular` is
**coordinatewise**: each palette color's density is controlled separately, in contrast to an
aggregate predicate that controls the palette as a whole. `routeBudget3` therefore carries the
route-count divisor, because per-route errors under a coordinatewise predicate are uniform in cell
volume rather than mass-weighted. The two are adopted together and Layer 9's counting is stated
against the pair: a coordinatewise predicate without the divisor does not bound the per-route error,
and the divisor is dispensable only under an aggregate predicate.

**The rank is a schedule.** For pattern size `k` and accuracy `ε`, define

```text
R(n) = max(1, max_{0 ≤ ℓ ≤ n}
  requiredTopCountingRank3 k ((ε/12) / max(1, ℓ^choose(k,2)))).
```

This is `inducedCountingRankSchedule3 k ε n`. Since `C.pairColorCount ≤ C.complexity`, its value
at `C.complexity` dominates the local demand at the route budget. Take the term
`ℓ = C.pairColorCount` in the finite maximum. Layer 8 accepts the entire schedule before producing
its complexity bound. Prove the local counting theorem, its required-rank bound, and the
finite-maximum domination separately; then compose regularity and counting as in Layer 9D.


## Prior formalization

The following comparison is secondary to the mathematical specification above. It concerns
[`regularity-lemmata` at commit `315ef979f55f31cc43cd791302519d9a34cc2dc0`](https://github.com/cameronfreer/regularity-lemmata/tree/315ef979f55f31cc43cd791302519d9a34cc2dc0),
also named by the protected tag
[`tauceti-roadmap-pin-2`](https://github.com/cameronfreer/regularity-lemmata/tree/tauceti-roadmap-pin-2).
This is a source reference, not a Lake dependency. The Tau Ceti implementation must satisfy the
statements in this roadmap independently of the source library's organization or names.

| Layer | Source declarations or modules | Relation to the specified mathematics |
|---|---|---|
| 1 | `energy`, `energy_mono`, `energy_le_one` in `Partition/Energy.lean` | Size-weighted energy for directed relations on a finite host; specializes to graphs. `MathlibEnergyCounterexample` in `Graph/Bridge.lean` separates it from off-diagonal energy. |
| 2 | `exists_regular_refinement_and_almostRefining_equipartition` in `Graph/Bridge.lean` | A regular exact refinement and a separate almost-refining equipartition; the latter is not asserted regular. This does not give the simultaneous conclusion required here. |
| 3 | `steppedCount`, `cutDiscrepancy`, `frieze_kannan`, `frieze_kannan_refining`, `frieze_kannan_cutDiscrepancy` in `Graph/{CutNorm,FriezeKannan}.lean` | Directed-relation versions of the finite weak-regularity statements, including a seeded form. |
| 4 | `StrongWitness`, `exists_strongWitness`, `exists_familyRegular_refinement`; `Relational/GraphCounting.lean` | A witness without equitability or coarse regularity, a simultaneous-family theorem, and binary-palette counting. They are related forms, not the Layer 4 statement or its stated counting bound. |
| 5–8 | `exists_goodPolyadColoring`, its refining form, `exists_goodColoring`, `exists_triadic_regular_approximation` in `Hypergraph/` | Regularization and Boolean approximation precursors; the differences in arity, coloring, and rank are described below. |
| 9 | Binary-palette transversal counting; `sum_nontransversal_weight_le` in `Relational/DiagonalGate.lean` | A model for separating local counting from diagonal terms. The latter bounds any real weight dominated by the cell-triple volume by `3m|s|²`; it does not define the predictions or prove the arity-three counting theorem here. |

The partition conventions require separate attention. The source's `AlmostRefines` bounds a
global exceptional mass by `ε|s|`, whereas this roadmap requires a bound `δ|A|` in each parent
cell. Its `IsRegularPartition` bounds bad-pair mass, whereas Mathlib's `Finpartition.IsUniform`
bounds the number of bad cell pairs. Its two-partition theorem bounds the regular exact
refinement by `regularityBound ⌈1/ε⁵⌉ #P₀.parts`; that bound does not also bound a partition
satisfying this roadmap's simultaneous regularity, equitability, and almost-refinement conclusion.

The source hypergraph regularization applies to a coloring of `j`-sets and a decidable observable
on ordered `(j+1)`-tuples, normalized by `|V|^{j+1}`; the triadic case is `j = 2`. The seeded
form preserves a `ColoringRefines` projection. Permutation invariance is a hypothesis of the
badness-closure lemma, not of regularization itself. The deletion cleanup and approximation
theorem concern `UniformHypergraph 3` with factor-six edit normalization. They use a Boolean
observable, unordered pair colors, no vertex partition, and rank one in the approximation theorem.
The local rank-`r` subtriad tests provide a comparison with Layer 7, not the complete scheduled-rank
theorem of Layer 8. The regularization recurrence has the form
`K ↦ K·2^{O(K^{j+1})}`, giving `K ↦ K·2^{O(K³)}` for triples.

The [`graphon` library](https://github.com/cameronfreer/graphon) is a source for the parallel
analytic theory. The finite-facing comparisons specified above are proved in Tau Ceti after
their finite and analytic prerequisites; neither library is an input to the finite proof.

## References

- E. Szemerédi, *Regular partitions of graphs* (1978).
- A. Frieze, R. Kannan, *Quick approximation to matrices and applications*, Combinatorica 19 (1999).
- L. Lovász, B. Szegedy, *Szemerédi's Lemma for the Analyst*, GAFA 17 (2007).
- T. Tao, *Szemerédi's regularity lemma revisited*, Contrib. Discrete Math. 1 (2006) — the
  strong-regularity (energy-gap stopping) iteration Layer 4 follows.
- Y. Zhao, *Graph Theory and Additive Combinatorics* (2023), ch. 2 — graph regularity, counting, and
  the strong-regularity exposition.
- V. Rödl, M. Schacht, *Regular Partitions of Hypergraphs: Regularity Lemmas*, Combin. Probab.
  Comput. 16(6) (2007), 833–885 (the companion *Regular Partitions of Hypergraphs: Counting
  Lemmas* is ibid., 887–901); B. Nagle, V. Rödl, M. Schacht, *The counting lemma for regular
  k-uniform hypergraphs*, Random Struct. Alg. 28 (2006), 113–179.
- C. Terry, *Growth of regular partitions 4: strong regularity and the pairs partition*
  ([arXiv:2404.02030](https://arxiv.org/abs/2404.02030)) — the subtriad test surface (three
  component bigraphs, one per role pair) and the lower error schedule evaluated at the
  pairs-partition complexity (Layers 5, 7, and 9).
- W. T. Gowers, *Hypergraph regularity and the multidimensional Szemerédi theorem*, Ann. of Math. 166
  (2007); T. Tao, *A variant of the hypergraph removal lemma*, JCTA 113 (2006).
- D. Conlon, J. Fox, *Graph removal lemmas* (survey, 2013).
- Y. Dillies, B. Mehta, *Formalising Szemerédi's Regularity Lemma in Lean*, ITP 2022
  ([doi:10.4230/LIPIcs.ITP.2022.9](https://doi.org/10.4230/LIPIcs.ITP.2022.9)) — the Mathlib regularity
  / triangle-removal development this roadmap consumes.

## Acknowledgements

The finite development draws on the prior Lean library
[`cameronfreer/regularity-lemmata`](https://github.com/cameronfreer/regularity-lemmata); the analytic
parallel is [`cameronfreer/graphon`](https://github.com/cameronfreer/graphon). See *Prior
formalization*.

## Completion checklist

- The finite development uses Mathlib's `SimpleGraph`, `Finpartition`, `IsEquipartition`, and
  `IsUniform`; `weightedEnergy` is the size-weighted refinement-monotone energy.
- Layer 2 includes an equipartition hypothesis, a large-host hypothesis, a complexity bound, and the
  containment clause in `AlmostRefines`.
- Layer 4 explicitly connects almost-refinement to exact nesting and bounds complexity in terms of
  the starting complexity. Its counting gate is the labeled induced three-vertex estimate, with
  the coarse prediction and separate fine-regularity, energy-gap, and repeated-cell errors.
- Pair regularity is relative to cells of `PairSkeleton3`, and its schedule is evaluated at the
  lower complexity including the pair palette.
- `Polyad3` is determined by cells and pair colors; `Subpolyad3` selects arbitrary subgraphs of the
  three parent pair graphs.
- Top regularity is color-indexed and uses the rank-`r` subpolyad condition. The vertex-box condition
  is used only for comparison results.
- `TriadicComplex3` chooses its pair palette, has computed complexity, and carries a polyad
  decomposition. The approximation theorem returns an explicit approximant and controlled vertex
  cells. Its uncolored face levels and its bridge to Mathlib's nonempty complexes are specified.
- Density summation uses a positive distinct-pair denominator or nonempty triple support.
- The local prediction uses the falling-factorial injection count and the pair- and top-density
  factors, with one canonical orientation per pattern pair and triple. The global and discarded
  predictions are explicit sums of this formula.
- Local counting is transversal, takes only its local regularity hypotheses at the scheduled rank,
  and is stated
  for the approximant `H'` at the per-route budget.
- Actual exceptional routes, predicted exceptional routes, repeated-cell placements, and the global
  edit transfer are all represented in the six-charge assembly.
- The final counting error has scale `|V|^k`; the global parameter, local schedule, output slack,
  rank schedule, and diagonal floor are explicit and calibrated. Rank adequacy follows from a
  finite maximum, without a regularity-bound hypothesis; existence and counting compose at the
  displayed large-host threshold.
- `Suggested.lean` uses `sorry` only for data definitions and theorem proofs, and every layer has a
  concrete acceptance example.

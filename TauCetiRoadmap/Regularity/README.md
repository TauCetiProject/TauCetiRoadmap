# Roadmap: graph regularity, finite weak regularity, and arity-3 hypergraph complexes

Mathlib already carries a finite-graph **regularity** ecosystem — `SimpleGraph`, edge densities,
`Finpartition` / `IsEquipartition` / `equitabilise`, the Szemerédi regularity lemma
(`szemeredi_regularity`), triangle counting/removal, and graph copy-counting (`SimpleGraph.Copy`). The
**dense graph limits** roadmap (graphons, the analytic cut norm, cut distance, analytic Frieze–Kannan,
compactness, sampling) is an **independent parallel analytic development**, owned separately. This
roadmap builds the **finite combinatorial regularity tower** — finite weak (Frieze–Kannan)
regularity, **strong graph regularity**, and **arity-3 hypergraph-complex regularity and counting** —
the material Mathlib lacks, with **no analytic prerequisites**: nothing here waits on the graphon
roadmap, and any finite–analytic comparison is owned by a downstream consumer (see *Interfaces
exported to other roadmaps*).

The local summit is an **arity-3 strong hypergraph regularity / regular-approximation package**,
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

## Conventions (pinned up front)

These conventions bind all layers and their public interfaces.

1. **Graphs use Mathlib's `SimpleGraph`.** Do not introduce a private finite-graph object as the main
   type. A weighted matrix/kernel view, where needed, is an adapter from `SimpleGraph V` with
   `[Fintype V]`, never the public graph API. *Why:* a standard notion said in a private dialect drifts
   from Mathlib and grows a redundant theory of lemmas Mathlib already proves.
2. **Partitions use Mathlib's vocabulary.** `Finpartition (univ : Finset V)`, `IsEquipartition`,
   `equitabilise`, `IsUniform`; **`P ≤ Q` means `P` refines `Q`** (the finer partition is `≤`). *Why:*
   the whole regularity stack is stated in these terms; reusing them lets the roadmap consume
   Mathlib's `SzemerediRegularity` machinery — `increment`, its equitability and cardinality
   lemmas, and the energy gain — as the analytic engine for Layer 2 (see Layer 2).
3. **Hypergraphs are unordered, with ordered views for counting.** `UniformHypergraph r V` carries
   `edges : Finset (Finset V)`; counting/density statements use **ordered injective-tuple** views.
   Edge density is `0` when `Fintype.card V < r` (`Nat.choose` is then `0` and `_ / 0 = 0`); substantive
   density/counting lemmas carry `r ≤ Fintype.card V`. Ordered pairs/triples are **distinct/injective**
   (no diagonals) — the pair-color carrier colors `{p : V × V // p.1 ≠ p.2}` and polyad supports are
   injective triples, so the lower and top layers agree on excluding loops. *Why:* unordered edges are
   the honest object; injective ordered tuples are the right shape for coordinate projections and
   induced counting. The zero-denominator and distinct-pair conventions apply throughout.
4. **Complexes are real objects, not "a partition plus side predicates".** A `HypergraphComplex` /
   `PairSkeleton3` / `TriadicComplex3` carries faces/cells/pair-colors/polyads as fields, and
   `complexity` is a **computed** structural measure of them (vertex cells + pair colors + polyads),
   never a free stored number. *Why:* a regularity proof encoded as scattered predicates has no
   reusable API; and a stored complexity could be set to `0`, so `ComplexityBounded` and
   `F C.complexity` would control nothing.
5. **Top relations are colored/typed, via a total unordered coloring.** `Colored3Graph κ₃ V` is a
   **total** coloring of **unordered** triples (`{s : Finset V // s.card = 3} → κ₃`), symmetric by
   construction. Pair colors use a **separate** palette `κ₂` (so the roadmap never forces lower and
   upper colors to coincide). Relative densities and top regularity are **color-indexed** (per-color,
   not one Boolean density). A distinguished non-edge/complement, if a milestone needs one, is one of
   the palette values — not a structurally distinguished field in v1. *Why:* induced counting must
   control both the presence *and* the absence of top relations; a Boolean edge-only API cannot.
6. **Error hierarchies are explicit functions `F : ℕ → ℝ`.** Never informal "sufficiently small". The
   argument at which `F` is evaluated is pinned in each statement (`LowerSkeletonRegular` uses
   `F (#vertex-cells + #pair-colors)` — the **lower complexity**, since pair-level counting strength
   must depend on the pair-palette size, matching the published architecture's lower error at the
   pairs complexity `ℓ`; `TopRegularOverMostPolyads` uses `F C.complexity`). *Why:* strong regularity
   is about a coarse/fine hierarchy where the fine error depends on the coarse complexity; leaving
   that implicit hides the load-bearing choice.
7. **Counting is part of the endpoint.** The strong regularity theorem alone is not enough; the
   local goal is regularity **plus** induced counting/embedding for fixed finite colored patterns.
8. **No downstream application peak.** Induced removal, arithmetic applications, and exchangeable-array
   representations are *consumers*. This roadmap exports interfaces for them but does not culminate in
   one. *Why:* a roadmap that peaks at an application invites unbounded scope and hides the reusable
   library that is the actual deliverable.

**Status bar.** Everything here must land in `TauCeti/` `sorry`-free and axiom-clean
(`TauCeti/AGENTS.md`). The roadmap states the goals with `sorry` (allowed in this human-owned roadmap
library); the code repo discharges them. Following the roadmap-writing guide, `Suggested.lean` contains
only definitions whose bodies state a real condition and theorem targets whose propositions are already
expressible; a condition whose API does not yet exist is described here and added to `Suggested.lean`
only once it can be stated honestly — **never** as `def _ : Prop := sorry`.

## What Mathlib already has (consume)

Reuse these by name; do not rebuild them. (**Entry points checked** against the pinned toolchain;
some prose paths below are abbreviated.)

- **Szemerédi regularity:** `szemeredi_regularity (hε : 0 < ε) (hl : l ≤ card α) : ∃ P : Finpartition (univ : Finset α), P.IsEquipartition ∧ l ≤ #P.parts ∧ #P.parts ≤ SzemerediRegularity.bound ε l ∧ P.IsUniform G ε` (`Combinatorics/SimpleGraph/Regularity/Lemma.lean`).
- **Uniformity / energy:** `SimpleGraph.IsUniform`, `Finpartition.IsUniform`, `Finpartition.nonUniforms`, `SimpleGraph.nonuniformWitness` (`Regularity/Uniform.lean`); `Finpartition.energy` and the `SzemerediRegularity.increment` / `chunk` energy-boost machinery (`Regularity/{Energy,Chunk,Increment}.lean`).
- **Partitions:** `Finpartition` (`Order/Partition/Finpartition.lean`), `Finpartition.IsEquipartition` (`(parts).EquitableOn card`, `Order/Partition/Equipartition.lean`), and `Finpartition.equitabilise` / `Finpartition.exists_equipartition_card_eq` (both in `Combinatorics/SimpleGraph/Regularity/Equitabilise.lean`). **`P ≤ Q` = `P` refines `Q`.**
- **Densities and copies:** `SimpleGraph.edgeDensity` (`SimpleGraph/Density.lean`); `SimpleGraph.Copy`, `IsContained` (`⊑`), `Free`, `copyCount`, `labelledCopyCount` (`SimpleGraph/Copy.lean`); triangle counting/removal and `triangleRemovalBound` (`SimpleGraph/Triangle/`).
- **Building blocks:** `Nat.descFactorial` (falling factorial), `Finset.powersetCard`, `Nat.choose`.
- **Hypergraphs:** `Hypergraph` ([`Mathlib/Combinatorics/Hypergraph/Basic.lean`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Combinatorics/Hypergraph/Basic.lean)) is a set-based undirected carrier — `vertexSet : Set α` and `edgeSet : Set (Set α)`, with `Adj`, `EAdj`, `map`, `IsIsolated`, `IsLoop`, `IsTrivial`/`trivialOn`, `IsComplete`/`completeOn`, and a bottom element. It carries **no uniformity predicate and no finiteness, density, or counting API**, which is what Layers 5–9 consume throughout. The hypergraph objects here are therefore finite computational representations in their own right, bridged to the Mathlib carrier by `UniformHypergraph.toHypergraph` (Layer 0) rather than replaced by it.

## Cross-roadmap dependencies

| Area | Owner | This roadmap's role |
|---|---|---|
| `SimpleGraph`, graph maps/counting, `Finpartition`, Szemerédi regularity | **Mathlib** | consume directly; add thin Tau Ceti-facing wrappers only where they remove friction |
| Graphons, analytic cut norm / Frieze–Kannan, cut distance, graphon sampling | **Dense graph limits roadmap** | **independent parallel theory**; comparison adapters, where wanted, are owned downstream |
| Sequence exchangeability, de Finetti, exchangeable arrays / Aldous–Hoover | **Exchangeability roadmap** | background/consumer only; **not** the peak |
| Finite weak regularity (`steppedCount`, `cutDiscrepancy`, finite Frieze–Kannan) | **this roadmap** | build (Layer 3) |
| Strong graph regularity | **this roadmap** | build (Layer 4) |
| Hypergraph complexes, polyads, strong hypergraph regularity, induced counting | **this roadmap** | build (Layers 5–9) |

The dense graph limits roadmap covers graphons, the analytic cut norm, cut distance, analytic
Frieze–Kannan, and sampling. This roadmap's Layer 3 develops **finite weak regularity** —
`steppedCount`, the count-scaled `cutDiscrepancy`, and a directly proved finite Frieze–Kannan
theorem — as its own layer, with no graphon imports: the finite and analytic theorems are
**independent formulations, neither derived from the other**. Consumer roadmaps own any comparison
adapters they require (see *Interfaces exported to other roadmaps*). `Suggested.lean` imports only Mathlib and
pins the Layer-3 targets directly.

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
- **Build.** `UniformHypergraph.blockDensity`; the **size-weighted** graph energy `weightedEnergy` (the `L²` norm of the block-average step function, casts before division, **including** the diagonal blocks `i = j`) and its refinement-monotonicity `weightedEnergy_mono_of_refines`; the hypergraph-level analogue. **Not** Mathlib's unweighted `Finpartition.energy`, an `offDiag`-based average that is *not* Jensen-monotone under arbitrary refinement (it is monotone only inside the `increment` argument). (Comparison with the dense graph limits roadmap's analytic `graphonPartitionEnergy` is a downstream-owned comparison, not a deliverable here — see *Interfaces exported to other roadmaps*.)
- **Gate.** `weightedEnergy` agrees with the block-average `L²` on graphs; the diagonal and repeated-part conventions are explicit.

**Prior formalization ([`regularity-lemmata`](https://github.com/cameronfreer/regularity-lemmata)).**
The energy layer is proved there in greater generality — `energy` (mass-weighted, diagonal-included,
ℝ-valued) with `energy_mono` and `energy_le_one` (`Partition/Energy.lean`) — for a **directed relation
`R : α → α → Prop` on an arbitrary `Finset` host**, not just `SimpleGraph` over `univ`; the
directedness is load-bearing downstream (its binary relational palettes). A TauCeti `weightedEnergy`
can specialize it.

### Layer 2 — Szemerédi graph regularity bridge
- **Consume.** Mathlib's exported `SzemerediRegularity` machinery: `increment` (a `bind` of
  per-part chunks, so it exactly refines its input), `increment_isEquipartition`, `card_increment`,
  `energy_increment`, and `Finpartition.energy_le_one`. These supply the analytic content.
  (An implementation may prove its core ladder in greater generality — e.g. mass-weighted, directed —
  and bridge to Mathlib separately; see the prior-formalization note below.)
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

**Prior formalization.** `regularity-lemmata` proves the *two-partition* intermediate
`exists_regular_refinement_and_almostRefining_equipartition` (`Graph/Bridge.lean`, with `_of_bound_le`
and `_ceil` corollaries): a regular **exact** refinement `Q ≤ P₀` with the bound
`regularityBound ⌈1/ε⁵⌉ #P₀.parts`, plus a *separate* equipartition `E` (roughly `⌈B/ε⌉` parts)
almost-refining both — with `E` **not itself regular**. The self-regular version is exactly this
layer's target and is not proved there. The intermediate is proved from the library's **own**
mass-weighted directed energy-increment theorem (`exists_regular_refinement`); the bridge to Mathlib's
`szemeredi_regularity` is a *separate* result in the same file. Shape deviations to reconcile: its
`AlmostRefines` is a **global** normalized exceptional mass (`≤ ε·|s|`, built from the per-parent
count form `AlmostRefinesAt`), which does not imply this roadmap's per-part `δ·|A|` clause; and its
partition regularity is the mass-weighted `IsRegularPartition` (normalized bad **mass** `≤ ε`), not
Mathlib's `Finpartition.IsUniform` pinned here. That library also exports the seeded weak-regularity
shape this layer needs at Layer 3 (`frieze_kannan_refining`), and an exact-refining finite-family
summit (`exists_familyRegular_refinement`). This roadmap's `refiningRegularityBound` — bounding a
partition that is simultaneously regular, equitable, and almost-refining — has no counterpart there;
its value is established at this layer.

### Layer 3 — finite weak regularity
- **Consume.** Layer 1's finite energy and partition machinery.
- **Build.** `steppedCount` (the count predicted by the partition-stepped graph on a test rectangle:
  each cell pair contributes its density times the trace masses `|A ∩ C|·|B ∩ D|`); the finite
  `cutDiscrepancy` (the maximum rectangle deviation between true and stepped counts, with its
  elimination lemma `cutDiscrepancy_le_iff`) — **count-scaled**, deliberately not normalized, and
  deliberately *not* called a "cut norm": the analytic cut norm is the graphon roadmap's object, and
  the two are independent formulations; and a **direct finite Frieze–Kannan theorem**
  `frieze_kannan`: for every `ε > 0` a partition with at most `4^(⌈1/ε²⌉+1)` parts whose stepped
  prediction is within `ε·|V|²` of the true count on **every** rectangle, with the supremum-form
  corollary `frieze_kannan_cutDiscrepancy` derived from it.
- **Gate.** Uniform `ε·|V|²` rectangle discrepancy with the explicit single-exponential bound — and
  **no graphon imports or analytic prerequisites** anywhere in the layer.

**Prior formalization.** The layer is proved in `regularity-lemmata`
(`Graph/{CutNorm,FriezeKannan}.lean`): `steppedCount`, `cutDiscrepancy` with `cutDiscrepancy_le_iff`,
the rectangle-quantified `frieze_kannan` with the explicit `4^(⌈1/ε²⌉+1)` bound, and the corollary
`frieze_kannan_cutDiscrepancy` — proved directly by energy increment, with **no analytic
prerequisites** (evidence the finite layer stands alone). Stated there for directed relations; the
`Suggested.lean` targets are its `SimpleGraph` specialization.

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
- a counting lemma whose hypotheses include `StrongRegular`.

**Gate.** Prove at least one counting result from `StrongRegular`.

**Prior formalization.** `regularity-lemmata` proves the related directed-relation theorem
`exists_strongWitness` and a binary-palette counting chain in `Graph/Strong.lean` and
`Relational/GraphCounting.lean`. Its witness omits the equipartition and coarse-regularity fields
required here.

### Layer 5 — hypergraph complexes and the lower skeleton

**Goal.** Define the cell and pair-color data over which arity-3 regularity is measured.

**Consume.** `Finpartition` and Layer 1.

**Build.**

- `HypergraphComplex`, with faces of the prescribed size and downward closure;
- `PairColorSystem κ₂ V` on ordered distinct pairs, carrying an **involutive palette reversal**
  `rev` and the coherence law `color_rev`, together with `colorOfPair`, `colorOfPair_swap`, and
  `pairColorDensity`. Routes are then indexed by **canonical orientation** (`i < j`), the reverse
  color being recovered by `rev`;
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
  triple.

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

- `TriadicComplex3 κ₃ V`, which chooses its pair palette and carries a lower skeleton and polyads;
- the computed complexity `C.complexity` and the bridge `C.toHypergraphComplex`;
- `editDiscrepancy3 H H'` and `Approximates3 H H' ε` for an explicit approximant `H'`;
- `IsPolyadDecomposition`, `exceptionalPolyadMass`, and
  `TopRegularOverMostPolyads H' C η ε r`;
- `VertexCellsControlled C t₀` and `ComplexityBounded C b`;
- `regularityBound3 q₃ ε F r t₀`;
- `IsStrongRegularApproximation3 H H' C ε F r t₀` and the existence theorem
  `exists_strong_regular_approximation3`.

**Pinned choices.** The complex chooses the finite pair palette. Its complexity counts vertex cells,
pair colors, and polyads. The top-regularity parameter `F C.complexity` is separate from the
exceptional-mass bound. The complexity bound depends on the top palette, rank, and requested vertex
floor. The theorem returns equitable vertex cells satisfying that floor.

**Gate.** Compare the two-dimensional shadow of these definitions with Layer 4's graph API.

**Prior formalization (Layers 5–8).** `regularity-lemmata/Hypergraph` proves Boolean precursors
`exists_goodColoring` and `exists_triadic_regular_approximation`. `exists_goodPolyadColoring` and its
seeded form are arity-generic: they regularize a coloring of `j`-sets against an arbitrary decidable
observable on ordered `(j+1)`-tuples, normalized by `|V|^{j+1}`, and the triadic statements are the
`j = 2` instance. Permutation invariance of the
observable is a hypothesis on the badness-closure lemma alone, so orientation coherence is not
forced by the regularization step — it is forced from Layer 6 on, where polyad support reads
coordinate pairs at both orientations.

Genericity stops at the regularization. The deletion cleanup and the approximation summit
`exists_triadic_regular_approximation` are stated for `UniformHypergraph 3` and use the factor-six
ordered edit normalization, so they are arity-three. The deviations to reconcile are otherwise ones
of shape: a single Boolean observable rather than color-indexed relative densities, unordered pair
colors, no vertex partition, and a single disc atom (`r = 1`) in the summit rather than the bounded
unions this roadmap's rank-`r` tests quantify over.
This roadmap uses ordered pair colors, an equitable vertex partition, and a total colored top
relation; the library's rank-`r` subtriad tests and factor-six edit normalization provide the
corresponding local models. The proved complexity bound is obtained from an iterated recurrence of
shape `K ↦ K·2^{O(K^{j+1})}`, which at arity three is `K ↦ K·2^{O(K³)}`.

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

The local prediction is the product of the cell-size factor, one pair-color density for each
canonical pair, and one relative top-color density for each pattern triple. The top densities are
taken in `H'`.

#### 9B. Local counting

Define the host-independent calibration data `inducedCountingParameter3`,
`inducedCountingSchedule3`, `exceptionalPredictionSlack3`, `inducedCountingRank3`, and
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
top-regular route. Its other hypotheses are lower-skeleton regularity and rank adequacy. It counts
in `H'`; the edit to `H` is performed after global summation.

**Pinned choices.** Pair-regularity input strength and counting output error are separate
parameters. Sparse routes form a local branch rather than a global error charge. The top rank depends
on the pattern and error, and is **fixed in advance**; its calibration against
`inducedCountingRank3` is stated for complexity-bounded complexes (see *Two pinned interfaces*).

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
`induced_counting_from_strong_regular_complex3`.

**Gate.** Work out the prediction and counting bound for one fixed colored 3-pattern.

**Prior formalization.** The binary-palette counting development in `regularity-lemmata` supplies
the transversal-first architecture and the diagonal-cell estimate. It is a blueprint rather than a
statement-level implementation of this layer.

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

Layers 0–1 (substrate) and the graph-regularity endpoint (Layers 2–4) first — they are honestly pinnable against
the pinned Mathlib APIs and give visible checkpoints. The arity-3 tower (5–9) follows: skeleton (5) →
polyads/densities (6) → top regularity (7) → the strong approximation (8) → induced counting (9).
Layers 4 and 8 attract duplicate work, so **register an Intention and `claim` the specific target**
before a substantial push (see *Coordinating work* in the repository README).

## Interfaces exported to other roadmaps

This roadmap exports finite regularity and counting interfaces owned by consumer roadmaps —
deterministic regularity inputs for exchangeable-array statements and removal-style / arithmetic
hooks. These are **downstream consumers, not local endpoints**. The finite sampling lemmas here
supply deterministic regularity inputs for random-array statements; the exchangeability roadmap owns
the representation theorem and the API those inputs feed.

**Interoperability adapters (owned downstream; not gating any layer).** This roadmap does not
specify finite–analytic comparison maps: a consumer roadmap that requires such a map owns it as a
named milestone there, and no layer or acceptance gate here depends on one. The finite and analytic
developments are compared only by adapters a consumer owns: a `stepGraphonOfFinpartition`
compatibility; identification of the finite `cutDiscrepancy`'s `SimpleGraph` specialization with the
analytic Frieze–Kannan statement (minding the scaling — `cutDiscrepancy` is count-scaled by `|V|²`,
the graphon cut norm is normalized); the energy comparison `graphonPartitionEnergy_finiteGraphGraphon`
— for `G : SimpleGraph (Fin m)` with `0 < m`, `weightedEnergy G P` equals `graphonPartitionEnergy` of
`finiteGraphGraphon G` at the measurable partition of `I` whose parts are the unions of the equal
vertex subintervals over each `P`-part (no normalization mismatch: Mathlib's `edgeDensity A B` counts
ordered adjacent pairs on `A × B`, matching the graphon integral and the `|A||B|/m²` weights, diagonal
blocks included; generic **nonempty** finite `V` transports along `V ≃ Fin (Fintype.card V)`, and the
empty graph's energy is degenerate on both sides); and name alignment of the Layer-0 hom/injective
densities with the graphon roadmap's `homDensityFin` / `injHomDensity`. None of these is a layer
dependency or an acceptance gate.

## Non-goals

- This roadmap does **not** own dense graph limit theory (graphons, the analytic cut norm / cut
  distance, compactness, analytic Frieze–Kannan); those live in the dense graph limits roadmap. It
  **does** own the finite weak-regularity theory (`steppedCount`, `cutDiscrepancy`, the finite
  Frieze–Kannan theorem); finite–analytic comparisons are owned by downstream consumers, not
  deliverables here.
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

**The calibration is fixed-rank.** `regularityBound3`, `inducedCountingRank3`, and the error
schedules are chosen jointly so that `requiredTopCountingRank3_le_inducedCountingRank3` holds for
every complex satisfying the stated complexity bound. The rank is fixed in advance rather than
evaluated at the complexity, and it must dominate a demand that grows as the route budget shrinks
with the palette; since Layer 8's complexity is the computed sum
`#cells + pairColorCount + #polyads`, the palette that demand can reach is itself bounded by
`regularityBound3`. Choosing these three together so the domination holds is Layer 9's calibration
work.


## Prior formalization

[`cameronfreer/regularity-lemmata`](https://github.com/cameronfreer/regularity-lemmata) is a public
Lean 4 library of finite regularity, counting, and approximation infrastructure — `sorry`-free with
no custom axioms (CI-enforced by its `scripts/check.sh`). Its partition/graph layers are developed
for **directed relations on an arbitrary `Finset` host** (subsuming `SimpleGraph`); its hypergraph
development is Boolean and unordered, and its regularization layer is stated at arbitrary arity. The
declaration-level claims in this section and the per-layer notes were checked at commit
[`315ef979f55f31cc43cd791302519d9a34cc2dc0`](https://github.com/cameronfreer/regularity-lemmata/tree/315ef979f55f31cc43cd791302519d9a34cc2dc0),
which the protected tag
[`tauceti-roadmap-pin-2`](https://github.com/cameronfreer/regularity-lemmata/tree/tauceti-roadmap-pin-2)
also names. Much of Layers 1–4, and Boolean
precursors of Layers 5–8, are proved there; the per-layer *Prior formalization* notes above record the shape
deviations a TauCeti implementation must reconcile.

Summary map, with each row's exact
relationship to the targets here condensed from the per-layer notes:

| Roadmap layer | Proved there (representative names) | Relationship to the targets here |
|---|---|---|
| 1 | `energy`, `energy_mono`, `energy_le_one` (`Partition/Energy.lean`); `MathlibEnergyCounterexample` (`Graph/Bridge.lean`) | more general (mass-weighted, directed, arbitrary `Finset` host); `weightedEnergy` can specialize it. The counterexample is a six-vertex instance on which Mathlib's off-diagonal `Finpartition.energy` **drops** under refinement while the mass-weighted energy does not — the concrete reason Layer 1 treats the `increment` boost as an alignment point rather than a consume |
| 2 | `AlmostRefinesAt` / `exceptionalMass` / `AlmostRefines`; `IsRegularPartition`; `exists_regular_refinement_and_almostRefining_equipartition` (+ `_of_bound_le`, `_ceil`); the separate Mathlib `szemeredi_regularity` bridge (`Graph/Bridge.lean`) | two-partition intermediate (exact refinement + a separate, non-regular almost-refining equipartition); the self-regular target here is not proved there |
| 3 | `steppedCount`, `cutDiscrepancy`, `cutDiscrepancy_le_iff`, `frieze_kannan`, `frieze_kannan_refining`, `frieze_kannan_cutDiscrepancy` (`Graph/{CutNorm,FriezeKannan}.lean`) | same statement shapes for directed relations; the targets here are its `SimpleGraph` specialization. `frieze_kannan_refining` is the seeded form — from an arbitrary starting partition, an output refining it — which is what a layered construction consumes; `frieze_kannan` is its `⊤`-seed corollary |
| 4 | `ErrorSchedule`, `StrongWitness`, `exists_strongWitness` (`Graph/Strong.lean`); `exists_familyRegular_refinement` (`Graph/FamilyRefinement.lean`); the binary-palette strong-witness counting chain and graph bridges (`Relational/GraphCounting.lean`) as the closest counting analogue | precursor witness (no equipartition or coarse-regularity fields; complexity bound in the conclusion); its counting chain is binary-palette and does not discharge this layer's counting gate. `exists_familyRegular_refinement` regularizes a finite family simultaneously against an arbitrary seed with **exact** refinement and no equitability — the simultaneous-family primitive Layer 4's lower skeleton needs, without the equipartition |
| 5–8 (precursor) | `IsLocalDiscRegular`, `ColoringRefines`, `exists_goodPolyadColoring` / `exists_goodPolyadColoring_refining` (`Hypergraph/PolyadIncrement.lean`), `exists_goodColoring` / `exists_goodColoring_refining`, `exists_triadic_regular_approximation` (`Hypergraph/*.lean`) | Boolean, unordered-pair, no-vertex-partition precursor by a deliberately different route (see the Layers 5–8 note). The regularization is stated for a coloring of `j`-sets against an arbitrary decidable observable on ordered `(j+1)`-tuples, and in seeded form preserving a `ColoringRefines` projection; the triadic statements are its `j = 2` instance |
| 9 (blueprint) | transversal counting plus the diagonal-cell gate and pattern-local union bounds (its binary-palette counting phase); `sum_nontransversal_weight_le` (`Relational/DiagonalGate.lean`) | architectural blueprint (transversal-first + diagonal gate), not a statement-level match. `sum_nontransversal_weight_le` supplies the mathematical core of the diagonal gate — any real weight dominated by the cell-triple volume on nontransversal triples is bounded by `3m|s|²`, one-sided and requiring no nonnegativity — but not this roadmap's expected-count definitions |
| Convention 5 (validation) | the complete two-way binary palette (`Bool × Bool` per symbol, both directions, loops via vertex profiles) with kernel-`decide` falsification examples — a proved arity-2 validation of "control presence *and* absence" | proved arity-2 validation of the convention, not a migration source |

[`cameronfreer/graphon`](https://github.com/cameronfreer/graphon) is the **parallel analytic
development** (graphons, analytic cut norm, step approximation) that `regularity-lemmata`'s cut-norm
file cites as its analytic counterpart, with comparison adapters owned by consumers on both sides —
an analytic parallel of this roadmap, not a supplier.

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

## Reviewer checklist

- The finite development uses Mathlib's `SimpleGraph`, `Finpartition`, `IsEquipartition`, and
  `IsUniform`; `weightedEnergy` is the size-weighted refinement-monotone energy.
- Layer 2 includes an equipartition hypothesis, a large-host hypothesis, a complexity bound, and the
  containment clause in `AlmostRefines`.
- Layer 4 explicitly connects almost-refinement to exact nesting and bounds complexity in terms of
  the starting complexity.
- Pair regularity is relative to cells of `PairSkeleton3`, and its schedule is evaluated at the
  lower complexity including the pair palette.
- `Polyad3` is determined by cells and pair colors; `Subpolyad3` selects arbitrary subgraphs of the
  three parent pair graphs.
- Top regularity is color-indexed and uses the rank-`r` subpolyad condition. The vertex-box condition
  is used only for comparison results.
- `TriadicComplex3` chooses its pair palette, has computed complexity, and carries a genuine polyad
  decomposition. The approximation theorem returns an explicit approximant and controlled vertex
  cells.
- The local prediction is the product of cell-size, pair-density, and top-density factors, with one
  canonical orientation per pattern pair.
- Local counting is transversal, takes only its local regularity and rank hypotheses, and is stated
  for the approximant `H'` at the per-route budget.
- Actual exceptional routes, predicted exceptional routes, repeated-cell placements, and the global
  edit transfer are all represented in the six-charge assembly.
- The final counting error has scale `|V|^k`; the global parameter, local schedule, output slack,
  required rank, and diagonal floor are explicit and calibrated.
- `Suggested.lean` uses `sorry` only for data definitions and theorem proofs, and every layer has a
  concrete acceptance example.

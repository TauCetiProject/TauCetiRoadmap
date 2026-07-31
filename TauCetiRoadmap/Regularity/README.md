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

Decided now so contributors don't oscillate between incompatible designs.

1. **Graphs use Mathlib's `SimpleGraph`.** Do not introduce a private finite-graph object as the main
   type. A weighted matrix/kernel view, where needed, is an adapter from `SimpleGraph V` with
   `[Fintype V]`, never the public graph API. *Why:* a standard notion said in a private dialect drifts
   from Mathlib and grows a redundant theory of lemmas Mathlib already proves.
2. **Partitions use Mathlib's vocabulary.** `Finpartition (univ : Finset V)`, `IsEquipartition`,
   `equitabilise`, `IsUniform`; **`P ≤ Q` means `P` refines `Q`** (the finer partition is `≤`). *Why:*
   the whole regularity stack is stated in these terms; reusing them lets the roadmap consume
   `szemeredi_regularity` directly (Mathlib's `increment` machinery is a proof template, not a
   consume — see Layer 1).
3. **Hypergraphs are unordered, with ordered views for counting.** `UniformHypergraph r V` carries
   `edges : Finset (Finset V)`; counting/density statements use **ordered injective-tuple** views.
   Edge density is `0` when `Fintype.card V < r` (`Nat.choose` is then `0` and `_ / 0 = 0`); substantive
   density/counting lemmas carry `r ≤ Fintype.card V`. Ordered pairs/triples are **distinct/injective**
   (no diagonals) — the pair-color carrier colors `{p : V × V // p.1 ≠ p.2}` and polyad supports are
   injective triples, so the lower and top layers agree on excluding loops. *Why:* unordered edges are
   the honest object; injective ordered tuples are the right shape for coordinate projections and
   induced counting, and pinning the zero-denominator / distinct-pair conventions avoids a hidden
   `Nat`-division trap and a lower/top loop mismatch.
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
- **Building blocks:** `Nat.descFactorial` (falling factorial), `Finset.powersetCard`, `Nat.choose`. **No hypergraph carrier is available at the repository's pinned Mathlib revision** (`9caeba1`). Mathlib master has since gained a general set-based undirected `Hypergraph` API ([`Mathlib/Combinatorics/Hypergraph/Basic.lean`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Combinatorics/Hypergraph/Basic.lean), landed 2026-06) — a bare carrier (vertex set plus set-valued edges) with none of the finite uniform density/counting API this roadmap needs. The hypergraph objects here are therefore built as deliberately finite computational representations, with an explicit migration boundary owed once the pin catches up (see Layer 0).

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
**independent formulations, neither derived from the other**, and may later be compared by
consumer-owned adapters (see *Interfaces exported to other roadmaps*). `Suggested.lean` imports only Mathlib and
pins the Layer-3 targets directly.

## The build, in layers

Each layer lists what it **consumes**, what it **builds**, and its **acceptance gate**.

### Layer 0 — finite colored graph and 3-uniform vocabulary
- **Consume.** `SimpleGraph`, `SimpleGraph.Copy` / `copyCount`, `Nat.descFactorial`, `Finset.powersetCard`.
- **Build.** `UniformHypergraph r V` and `UniformHypergraph.edgeDensity`; the total unordered top-coloring carrier `Colored3Graph κ₃ V`; colored / hypergraph copy-counts and densities Mathlib lacks. Plain-graph hom/injective densities are built here from `Copy` / `descFactorial` (name alignment with the dense graph limits roadmap's `homDensityFin` / `injHomDensity` is a downstream-owned comparison, not a dependency — see *Interfaces exported to other roadmaps*). **Migration boundary (owed by this layer):** `UniformHypergraph` is a deliberately finite computational representation, not permanent public vocabulary. Once the Tau Ceti pin includes Mathlib's set-based `Hypergraph` carrier, this layer owes the bridge `UniformHypergraph.toHypergraph` together with an agreement statement (the image is the `r`-uniform hypergraph on vertex set `univ` with the same edges), and the choice of which representation is public API is made then, against Mathlib's carrier — never by silently canonizing the private one. Recheck Mathlib's active hypergraph development immediately before implementing this layer.
- **Gate.** `K₂`, a triangle, the complete and empty `r`-uniform hypergraphs; hom densities normalized by powers, injective densities by the falling factorial `(n)_k`.

### Layer 1 — partitions, block densities, refinement, energy
- **Consume.** `Finpartition`, `equitabilise`, `edgeDensity`. Mathlib's `SzemerediRegularity.increment` boost machinery is an **alignment point / proof template**, not a consumed theorem: it is stated for Mathlib's unweighted `Finpartition.energy`, and no comparison lemma transporting its boost to `weightedEnergy` is pinned (if one is added later, this becomes a real consume).
- **Build.** `UniformHypergraph.blockDensity`; the **size-weighted** graph energy `weightedEnergy` (the `L²` norm of the block-average step function, casts before division, **including** the diagonal blocks `i = j`) and its refinement-monotonicity `weightedEnergy_mono_of_refines`; the hypergraph-level analogue. **Not** Mathlib's unweighted `Finpartition.energy`, an `offDiag`-based average that is *not* Jensen-monotone under arbitrary refinement (it is monotone only inside the `increment` argument). (Comparison with the dense graph limits roadmap's analytic `graphonPartitionEnergy` is a downstream-owned comparison, not a deliverable here — see *Interfaces exported to other roadmaps*.)
- **Gate.** `weightedEnergy` agrees with the block-average `L²` on graphs; the diagonal and repeated-part conventions are explicit.

**Prior formalization ([`regularity-lemmata`](https://github.com/cameronfreer/regularity-lemmata)).**
The energy layer is proved there in greater generality — `energy` (mass-weighted, diagonal-included,
ℝ-valued) with `energy_mono` and `energy_le_one` (`Partition/Energy.lean`) — for a **directed relation
`R : α → α → Prop` on an arbitrary `Finset` host**, not just `SimpleGraph` over `univ`; the
directedness is load-bearing downstream (its binary relational palettes). A TauCeti `weightedEnergy`
can specialize it.

### Layer 2 — Szemerédi graph regularity bridge
- **Consume.** `szemeredi_regularity` — bridge to it, don't duplicate the `SimpleGraph` statement.
  (An implementation may prove its core ladder in greater generality — e.g. mass-weighted, directed —
  and bridge to Mathlib separately; see the prior-formalization note below.)
- **Build.** `AlmostRefines` (with the essential containment clause) and `exists_regular_equipartition_almost_refining`: a regular equipartition **almost-refining** a given equipartition `P₀` with the `V`-independent complexity bound `refiningRegularityBound`. Exact refinement does not survive equitabilisation (equitabilise only almost-refines), so the target is the almost-refinement wrapper. **Soundness hypotheses are required:** `P₀` an equipartition and `V` large enough — else a singleton `P₀`-part cannot be covered up to `ε·|A|` by contained cells of a bounded equipartition, and the statement is false. The bound is a complexity guarantee, not a claim that the discrete partition is excluded (Mathlib's SRL may itself use it for small `V`).
- **Gate.** Yields "all but ε-mass of pairs regular, boundedly many parts, almost-refining an equipartition `P₀`" — the input strong regularity iterates on.

**Prior formalization.** `regularity-lemmata` proves the *two-partition* intermediate
`exists_regular_refinement_and_almostRefining_equipartition` (`Graph/Bridge.lean`, with `_of_bound_le`
and `_ceil` corollaries): a regular **exact** refinement `Q ≤ P₀` with the bound
`regularityBound ⌈1/ε⁵⌉ #P₀.parts`, plus a *separate* equipartition `E` (roughly `⌈B/ε⌉` parts)
almost-refining both — with `E` **not itself regular**; the self-regular version, exactly this
layer's target, is that library's explicitly deferred endpoint. It is proved from the library's **own**
mass-weighted directed energy-increment theorem (`exists_regular_refinement`); the bridge to Mathlib's
`szemeredi_regularity` is a *separate* result in the same file. Shape deviations to reconcile: its
`AlmostRefines` is a **global** normalized exceptional mass (`≤ ε·|s|`, built from the per-parent
count form `AlmostRefinesAt`), which does not imply this roadmap's per-part `δ·|A|` clause; and its
partition regularity is the mass-weighted `IsRegularPartition` (normalized bad **mass** `≤ ε`), not
Mathlib's `Finpartition.IsUniform` pinned here. This roadmap's `refiningRegularityBound` — bounding a
partition that is simultaneously regular, equitable, and almost-refining — remains open.

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
- **Consume.** Layers 1–2 (`weightedEnergy`, the almost-refining bridge), `IsUniform`.
- **Build.** First the **named Layer 2 → Layer 4 bridge**: `exists_regular_exact_refining_equipartition` (with its bound `nestedRefinementBound`) — nested equitabilisation producing an **exact** refining regular equipartition from an equipartition. Layer 2's output only *almost*-refines, while `StrongRegular` iterates on exact `Q ≤ P` nesting; without this named cleanup step the two layers do not actually connect (Mathlib's `increment` subdivides within parts and is the proof template here, not a consumed theorem). Then `StrongRegular` — a coarse `P` and fine `Q` (`Q ≤ P`), both equipartitions, `P` `ε`-uniform, `Q` `F(#P.parts)`-uniform, `weightedEnergy Q − weightedEnergy P ≤ ε`, **and** a complexity bound `#Q.parts ≤ strongGraphRegularityBound ε F l₀` in terms of the **starting complexity** `l₀` (essential: it prevents the discrete partition from being the universal large-graph witness; and a bound in `ε, F` alone cannot dominate an arbitrary starting partition) — and the **compositional** `exists_strong_regular`: against a starting equipartition `P₀` and a requested minimum complexity `l`, with the coarse partition almost-refining `P₀` and `l ≤ #P.parts` (the parameters counting applications need). Plus a counting lemma consuming `StrongRegular`.
- **Gate.** The roadmap demands at least one counting lemma that consumes `StrongRegular`, not merely the existence theorem.

**Prior formalization.** `regularity-lemmata` proves `exists_strongWitness` (`Graph/Strong.lean`): a
`StrongWitness` against an **arbitrary starting partition `P₀`** (now mirrored by
`exists_strong_regular`'s `P₀`/`l` parameters, in almost-refinement form), for directed relations,
with error schedules bundled with their positivity (`ErrorSchedule` — a nicer API than a bare `F`
plus `hF`). Shape deviations: the witness has **no equipartition fields and no
coarse-partition regularity** — only the fine partition is regular, at the schedule's tolerance for
the coarse complexity — so `regP` has no proved counterpart; and the complexity bound lives in the
**theorem conclusion** (both coarse and fine bounded by iterated `monoStepBound`,
host-independently), not as a structure field. On the counting gate: a closely related analogue is
proved — its binary-palette strong-witness counting chain and graph bridges
(`Relational/GraphCounting.lean`: edge, path, triangle, and induced three-vertex counts) consume a
`BinaryPaletteStrongWitness`, not this `StrongRegular` — so the gate itself stays open.

### Layer 5 — hypergraph complexes; vertex cells and pair-color systems
- **Consume.** `Finpartition`, Layer 1.
- **Build.** `HypergraphComplex` (faces / `face_card` / `down_closed` — consumed by Layer 8's `TriadicComplex3.toHypergraphComplex` bridge, so the generic object is not ornamental); the `PairColorSystem κ₂ V` — a coloring of ordered **distinct** vertex pairs (`{p : V × V // p.1 ≠ p.2} → κ₂`; diagonals excluded, matching the injective top supports), with the total `colorOfPair : V → V → Option κ₂` view; `pairColorDensity` (over distinct pairs, `_ / 0 = 0` when none); the lower skeleton `PairSkeleton3 κ₂ V`; a **skeleton-relative** `IsPairColorRegular S ε` (quantifying over ordered pairs of actual vertex cells `A, B ∈ S.vertexPart.parts` and large sub-cells `A' ⊆ A`, `B' ⊆ B` — not arbitrary finsets, so pair regularity is genuinely tied to the skeleton); and `LowerSkeletonRegular` (with `F` at the **lower complexity** `#vertex-cells + #pair-colors` — the cell count alone is too weak, since pair-level counting strength must depend on the pair-palette size). The whole lower-skeleton regularity API is built here so Layer 8 consumes real defs — no jump from "pair-color system" to "lower skeleton regular".
- **Gate.** `r = 2` interfaces coherently with the graph layer (the bare down-closed complex does not by itself reconstruct the partition/cell machinery; the colored/cell object is what specializes); labeled copies of a fixed complex are definable.

### Layer 6 — triads, polyads, subpolyads, relative densities
- **Consume.** Layer 5.
- **Build.** `Polyad3 S` **over a lower skeleton `S`** — three vertex cells (each a part of `S.vertexPart`), the three pair colors on the coordinate pairs, and the support of role-ordered injective triples pinned by `mem_support_iff` to those cells *and* pair colors (so a polyad is determined by cells + lower pair colors, **not** an arbitrary support finset), with the constructor `Polyad3.ofData` (the polyad determined by given cells and colors) and the three **pair graphs** `Polyad3.pairSupport₀₁/₀₂/₁₂`; `Subpolyad3 P` in the counting-ready **Rödl–Schacht/NRS form** — arbitrary **subgraphs of the parent's three pair graphs**, support pinned to the parent tuples whose coordinate pairs land in the selected subgraphs — with the vertex-subcell restriction `Subpolyad3.ofSubcells` only a constructor, not the general test; `relDensityOn` / the **color-indexed** `relativeDensity` (reading the top color through the *underlying unordered triple*, so ordering never affects the color). Since `mem_support_iff` pins the support exactly, it contains **every** matching role-ordered tuple: for **distinct** cells each unordered triple admits at most one matching role-assignment (no overcounting); when cells repeat, several orderings can match, and de-duplication is the **counting layer's** job, not a thinning of the support.
- **Gate.** The 3-uniform worked example computes a relative triple density over a triad and over a subpolyad.

### Layer 7 — top-layer regularity over polyads
- **Consume.** Layer 6.
- **Build.** `IsTopRegularOverPolyad H P δ r` — the **`(δ, r)` NRS-rank form**: for every top color and every union of at most `r` subpolyads (`unionSupport` — arbitrary subgraphs of the parent pair graphs, *not* just vertex boxes) carrying a `δ`-fraction of the parent support, relative-density stability. `r = 1` is the disc-regular form ("disc-regular" is descriptive shorthand from the hypergraph-regularity literature — NRS themselves write `(δ, r)`-regular, so this is their `(δ, 1)`-regular case); the rank the counting theorem needs is pinned by pattern size in Layer 9 (`inducedCountingRank3`). The honest **weaker** predicate `IsVertexBoxRegularOverPolyad` (shrink the three cells, keep the full pair graphs) is kept as an intermediate target and for the `r = 2` shadow gate — it is **not** the predicate the induced-counting theorem consumes: vertex-box discrepancy alone is generally not counting-ready strength. Plus the most-polyads / exceptional-mass and slicing/inheritance targets.
- **Gate.** The `r = 2` shadow of the vertex-box form matches pair regularity; per-color quantification is present; the counting theorem consumes the rank form, never the vertex-box form.

### Layer 8 — strong arity-3 regular approximation
- **Consume.** Layers 5–7.
- **Build.** `TriadicComplex3 κ₃ V` — it **chooses** its lower pair palette (`pairColorCount : ℕ`, `skeleton : PairSkeleton3 (Fin pairColorCount) V`) and carries `polyads : Finset (Polyad3 skeleton)`, with `complexity` **computed** from the structure (vertex cells + pair colors + polyads — never a free stored field, which could be `0` and control nothing); an **explicit approximant** `H' : Colored3Graph κ₃ V` with `editDiscrepancy3 H H'` (unordered color disagreements at the ordered `6/|V|³` normalization — a real definition, not a target) and `Approximates3` (the clause tying `H'` to `H`); `IsPolyadDecomposition` (polyad supports pairwise disjoint and covering the injective triples — so the mass below is not vacuous); `exceptionalPolyadMass` and `TopRegularOverMostPolyads H' C η ε r` (top regularity of the **approximant** `H'` **relative to** `C`'s polyad decomposition, at NRS rank `r`, with the local parameter `η = F C.complexity` and the exceptional-mass bound `ε` as **separate** arguments); `ComplexityBounded`; `regularityBound3 q₃ ε F r t₀` (**depends on the top palette size** `q₃`, the rank, **and the vertex floor `t₀`** — the theorem demands both `t₀ ≤ #vertex-cells ≤ C.complexity` and `C.complexity ≤ regularityBound3 …`, so a `t₀`-independent bound would make the statement false for large `t₀`, mirroring Layer 4's starting complexity); `VertexCellsControlled C t₀` (the vertex partition is an **equipartition** with at least `t₀` cells — the diagonal-gate input Layer 9 consumes; without it the promised transversal-to-global route has a hidden bridge); `TriadicComplex3.toHypergraphComplex` (the bridge keeping the generic Layer-5 complex consumed rather than ornamental); `IsStrongRegularApproximation3 H H' C ε F r t₀` (approximation ∧ decomposition ∧ lower-skeleton regular ∧ top-over-most-polyads-for-`H'` ∧ complexity — all real; the approximation and decomposition clauses are essential, else the rest is satisfiable by data unrelated to `H`); and `exists_strong_regular_approximation3` (for every requested rank `r` and vertex floor `t₀`, under the large-host hypothesis `regularityBound3 … r t₀ ≤ |V|`: existential over **both** the approximant `H'` and `TriadicComplex3 κ₃ V`, so the pair palette is chosen, not an arbitrary fixed `κ₂`, with `VertexCellsControlled C t₀` in the conclusion).
- **Gate.** The two-dimensional shadow of the arity-3 definitions is compared with Layer 4's graph strong-regularity API; the roadmap does **not** claim the arity-3 objects literally specialize to a generic `r = 2` theorem in v1.

**Prior formalization (Layers 5–8).** `regularity-lemmata` reaches two proved arity-3 endpoints by a
deliberately different route (`Hypergraph/*.lean`): the weak endpoint `exists_goodColoring` (every
3-uniform hypergraph admits a pair coloring with at most `triadBound δ` colors and bad-triad mass
`≤ δ`) and the edited endpoint `exists_triadic_regular_approximation` (a deletion-only subgraph within
`δ·|V|³` ordered edits under which **every** key is locally disc-regular). Divergences a TauCeti
implementation must reconcile: its pair carrier is **unordered** 2-sets (`RSet 2 V → Fin K`) vs the
ordered distinct pairs pinned here; it has **no vertex partition** (compatibility with an equitable
vertex partition is its explicitly deferred strengthening) vs `PairSkeleton3`'s bundled `vertexPart`;
its top layer is **Boolean** `UniformHypergraph 3` vs the total colored `Colored3Graph κ₃` (colored
arity-3 counting is its deferred item); and its test surfaces now **align by design** with Layer 7:
its `IsDiscRegularAt` is the `r = 1` disc form and `IsPolyadRegularAt … r` the rank-`r` form of
`IsTopRegularOverPolyad` (this roadmap's subpolyads select arbitrary subgraphs of the parent pair
graphs precisely to match that counting-ready shape). Its proved permutation closure
(`isBadTriad_comp_perm_iff` — orientation-invariant badness and cleanup) supplies the
permutation-invariance discipline the counting layer's de-duplication will need (it is not itself
repeated-cell de-duplication). On `editDiscrepancy3`, its Boolean edit calculus is the specialization
precedent: unordered symmetric-difference edit count with the **proved** factor-6 ordered identity,
normalized by `|V|³` under `x/0 = 0` — the colored `editDiscrepancy3 H H'` counts unordered color
disagreements between the original and the **explicit approximant** at the same ordered `6/|V|³`
normalization, and its edited endpoint's deletion-only subgraph is the Boolean specialization
precedent for this explicit-approximant architecture (the full shapes still differ). Bound
caution for `regularityBound3`: the proved `triadRegularityBound` iterates a `cutBound` recurrence of
shape `K ↦ K·2^{O(K³)}` per round — **not** a single exponential.

### Layer 9 — induced counting and embedding
- **Consume.** Layer 8.
- **Build.** `FiniteColored3Pattern` (on `k` vertices); `Colored3Graph.inducedCopyCount` (labeled injective, color-matching copies); the **placement layer** — `PatternPlacement3` (pattern vertices → vertex cells; cells may repeat) with `PatternPlacement3.Transversal` (distinct assigned cells), and `PairColorPlacement3`: **one pair color per canonically oriented pattern pair `i < j`** — never both orientations, whose joint correlation `IsPairColorRegular` does not control (reverse colors could always equal forward colors, so a route demanding opposite colors has actual count zero against a positive product of marginals; one oriented bigraph per role pair is also the primary-source triad shape) — with every pattern triple's induced polyad (via `Polyad3.ofData`, `i < j < l`) one of `C`'s polyads; `placedInducedCopyCount`; `expectedInducedCountAt H' C F₀ φ ψ` — the intrinsic per-placement prediction, whose **shape is pinned** so it cannot hide the counting theorem: (i) the injection/cell-size factor from the assigned cells (falling-factorial-corrected when cells repeat), (ii) times the `pairColorDensity` of `ψ`'s color for each canonically oriented pattern pair, (iii) times the relative density in the **approximant** `H'` of the required top color over the polyad `ψ` induces, per pattern triple (each unordered triple entering once — the six ordered representatives identified here, not in the support), and **never defined through `inducedCopyCount`**; `expectedInducedCount H' C F₀` = the sum of `expectedInducedCountAt` over all placements and routes; `inducedCountingParameter3 q₃ k ε` (+ its positivity — the **global** edit/exceptional mass bound) and the genuine **schedule** `inducedCountingSchedule3 q₃ k ε : ℕ → ℝ` (+ `inducedCountingSchedule3_pos`, required to instantiate the regular-approximation theorem's `hF` — the **local** strengths, a function of the complexity, not a constant: pair-level counting strength must depend on the pair-partition complexity; the global parameter and the local schedule are deliberately separate); the **charge-pinning inequalities** `inducedCountingParameter3_charge` (`k³·parameter ≤ ε/6` — closing the edit, actual-discarded, and predicted-mass charges) and `exceptionalPredictionSlack3_charge` (`k³·ℓ^(k choose 2)·2·slack(ℓ) ≤ ε/6` — the route-count factor included, so every global charge visibly fits its fraction of the final `ε`; the discarded side's slack is the **output** function `exceptionalPredictionSlack3`, deliberately separate from the input schedule and tied to it only through the threshold calibration `inducedCountingSchedule3_le_exceptionalPredictionThreshold` — never the schedule in as strength and out as slack); the NRS rank `inducedCountingRank3 q₃ k ε` with `1 ≤` it pinned (`one_le_inducedCountingRank3` — at rank `0` the test is vacuous on nonempty polyads); the diagonal floor `diagonalControl3 k ε` with its charge **pinned as a theorem, not prose** — `nontransversalPredictedMass3` / `nontransversal_actual_and_predicted_mass_le`: under `VertexCellsControlled` at the floor, the **sum of both sides omitted by transversal counting** (actual repeated-cell tuples + predicted nontransversal mass) is at most `ε/6·|V|^k`; the **per-route budget** `routeBudget3 C k ε = ε / max 1 (q₂^(k choose 2))` — a placement admits up to `q₂^(k choose 2)` routes, so a bare per-route `ε` would sum to `ε·q₂^(k choose 2)·|V|^k`, not the claimed global bound; the route-level control — `PairColorPlacement3.polyad` (the polyad a route induces at a pattern triple) and `PairColorPlacement3.IsTopRegularRoute` (every induced polyad is one over which `H'` is `(η, r)`-top-regular — the strong approximation controls only **most** polyads, so a route through an exceptional polyad has no counting control); the **placed local counting theorem** `placed_induced_counting3` (the real counting lemma: at a **transversal** placement with a **top-regular route**, the placed count **in the approximant `H'`** within `routeBudget3 C k (ε/6)·∏ᵢ|cellᵢ|` of the per-placement prediction — budgeted **at the `ε/6` placed-counting charge**, since allocating the full `ε` to step 1 would already exhaust the global budget before the other steps; counting locally in `H` would be false, since a small global edit discrepancy can concentrate inside one placement); the discarded routes bounded on **both** sides — **actual** mass by the named union bound `exceptional_route_mass_le` (tuples meeting an exceptional polyad's support number at most `k³·exceptionalPolyadMass·|V|^k`) and **predicted** mass by `exceptionalPredictedMass3` / `exceptional_route_prediction_mass_le`, which runs **through the lower-route bridge**: input regularity at the threshold `pairRouteRegularityThreshold3 k ρ δ`, conclusion slack the separate output pair `δ + ρ` per route (sparse route predictions self-bound at the floor; dense ones tie to their polyads' actual supports within `δ`) times the **route-count factor** `q₂^(k choose 2)` (`expectedInducedCount` sums predictions over *all* routes, so the absolute-difference argument must bound the predicted contribution of discarded routes too — neither side a hidden bridge), with a **separate `εmass`** (the global theorem supplies it at `inducedCountingParameter3` — a single shared `ε` could not be instantiated without an unpinned comparison) and the global instantiation `ρ = δ = exceptionalPredictionSlack3 … ℓ` at the lower complexity `ℓ` (the evaluation point the skeleton's regularity actually supplies), calibrated by `inducedCountingSchedule3_le_exceptionalPredictionThreshold`; the named **edit-transfer lemma** `inducedCopyCount_edit_transfer` (`|H`-count `− H'`-count`| ≤ k³·editDiscrepancy3·|V|^k` — the only, and inherently global, place the `H`/`H'` difference enters); and the global `induced_counting_from_strong_regular_complex3` — under `VertexCellsControlled C (diagonalControl3 F₀.k ε)` an approximation `(H', C)` at that parameter, schedule, rank, and floor predicts the induced copy count of a fixed pattern **in the original `H`** within `ε·|V|^{F₀.k}` (the **pattern-size** scale, not `|V|³`), the final `ε` splitting into **six explicit `ε/6` charges** across four steps — placed counting; actual discarded mass; predicted discarded mass; predicted lower-route slack; the diagonal gate (actual + predicted, combined); the edit transfer — each closed by a pinned target (`routeBudget3` at `ε/6`, the two charge inequalities, `nontransversal_actual_and_predicted_mass_le`).
- **Build (the lower-route counting bridge).** The regularity-to-counting step inside placed counting is a named sublayer, not an implicit derivation: `lowerRouteCountAt` / `expectedLowerRouteCountAt` — the actual and predicted counts constrained by cells and lower pair colors only, both **concrete definitions**, at the placement scale `∏ᵢ|cellᵢ|` (deliberately distinct from the triad-support scale `k³·mass·|V|^k` of `exceptional_route_mass_le`; the two meet only in the global assembly); the sparse/dense split `IsSparseRoute ρ` (some route pair color has density below `ρ` between its cells) — sparse routes **self-bound** with no counting lemma (`lowerRouteCountAt_le_of_sparseRoute`, `expectedLowerRouteCountAt_le_of_sparseRoute`, assembled in `placed_induced_counting3_of_sparseRoute`): an easy local case, deliberately **neither a seventh global charge nor folded into Layer 8's exceptional polyads** (near-empty pair support is not top-irregularity, and conflating them would obscure the mass bookkeeping); the **input-strength threshold** `pairRouteRegularityThreshold3 k ρ δ` — the pair-regularity strength sufficient for dense counting at floor `ρ` with output error `δ`, deliberately **decoupling input strength from output slack** so the target does not bake in a linear regularity-to-counting modulus (a linear `δ/C(k)`-shaped conversion, as in classical triangle counting against regular pairs, and a power-loss `(δ/C(k))⁴`-shaped one both instantiate it) — the dense counting theorem gives the threshold its mathematical meaning (it must genuinely suffice for dense counting), `pairRouteRegularityThreshold3_pos` makes it admissible to the approximation theorem, and the **calibration theorems** `inducedCountingSchedule3_le_pairRouteRegularityThreshold3` / `inducedCountingSchedule3_top_le_routeBudget3` ensure the chosen schedule is strong enough to supply it at the route-budgeted `ε/6` charge, half for the lower-count error and half for the top slack; the dense theorems `lowerRoute_counting3` (threshold regularity + dense route ⇒ lower-route count within `δ·∏ᵢ|cellᵢ|`) and `placed_induced_counting3_of_denseRoute` (lower-route control + route-local top regularity ⇒ placed counting at `δ + k³·η`, with the explicit parameter inequalities `δ ≤ ρ` and `k³·η ≤ δ` — the scaled form the calibration actually supplies, sound even at degenerate pattern sizes — and a genuine **rank requirement** `requiredTopCountingRank3 F₀.k δ ≤ r` with `one_le_requiredTopCountingRank3`: NRS choose their integer rank after the pattern and density parameters, so a bare `1 ≤ r` would assert `k`-vertex counting at rank `1` and make the pattern-dependent `inducedCountingRank3` ornamental. The rank calibration `requiredTopCountingRank3_le_inducedCountingRank3` is deliberately pinned at the complexity-dependent route budget: it is where the complexity-independence of the global rank is decided — if the required rank grows as the budget shrinks, `inducedCountingRank3` must absorb the complexity bound's fixed point or become a rank schedule `ℕ → ℕ` mirroring the NRS regularity lemma's `r : ℕ → ℕ`, and the pinned target makes that decision visible rather than silent); the refinement pins `placedInducedCopyCount_le_lowerRouteCountAt`, `expectedInducedCountAt_le_expectedLowerRouteCountAt`, `expectedInducedCountAt_nonneg`; and the glue `IsPairColorRegular.mono`. `placed_induced_counting3` itself now takes only its **local contract** — transversality, lower-skeleton regularity at the schedule, route-local top regularity — never the full `IsStrongRegularApproximation3` bundle: the original `H`, edit bound, exceptional mass, and complexity control are global data the local lemma does not consume (the global theorem extracts the local hypotheses from `hreg`).
- **Build (assembly discipline).** The global theorem's bookkeeping is exposed as named targets, not proof-internal steps: `Fintype` instances for the placement structures; the **fibration identity** `inducedCopyCount_eq_sum_placed` (under `IsPolyadDecomposition`, the approximant's induced copy count is exactly the sum of placed counts over all placements and routes — each copy determines its placement and route, with the polyad membership automatic under the decomposition) and its predicted mirror `expectedInducedCount_eq_sum`; and the **proved** arithmetic assembly `sixCharge_assembly` (six contributions each within `ε/6·N` sum to `ε·N`) — the six-charge arithmetic is machine-checked, leaving only the six charge bounds and the split itself as deep targets.
- **Gate.** At least one concrete small-pattern count (a triangle for graphs, one fixed 3-uniform colored pattern).

**Prior formalization (blueprint).** The binary-palette counting phase of `regularity-lemmata` is the
architectural blueprint: counting is proved first for **transversal** embeddings (distinct coarse
cells), and the nontransversal mass is controlled by an explicit **diagonal-cell gate** (an initial
equipartition bounding coarse cell sizes, with a derived diagonal error term) — the load-bearing step
before any removal statement. This layer now pins that architecture: `placed_induced_counting3` is
the local statement, `VertexCellsControlled` at `diagonalControl3` is the gate, and the global
theorem is their assembly — with pattern-local union bounds (only the colors the pattern actually
mentions) and derived, not guessed, error constants as the implementation discipline.

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
today's Mathlib and give visible checkpoints. The arity-3 tower (5–9) follows: skeleton (5) →
polyads/densities (6) → top regularity (7) → the strong approximation (8) → induced counting (9).
Layers 4 and 8 attract duplicate work, so **register an Intention and `claim` the specific target**
before a substantial push (see *Coordinating work* in the repository README).

## Interfaces exported to other roadmaps

This roadmap exports finite regularity and counting interfaces that later roadmaps may consume —
deterministic regularity inputs for exchangeable-array statements and removal-style / arithmetic
hooks. These are **downstream consumers, not local endpoints**. In particular, once the
exchangeable-array API exists, the finite sampling lemmas here should provide deterministic
regularity inputs for random-array statements; this roadmap does not own the representation theorem.

**Interoperability adapters (owned downstream; not gating any layer).** This roadmap does not
specify finite–analytic comparison maps: a consumer roadmap that requires such a map owns it as a
named milestone there, and no layer or acceptance gate here depends on one. The finite and analytic
developments may later be compared by adapters, owned by whichever side finds them useful: a `stepGraphonOfFinpartition`
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
  deterministic finite regularity inputs those roadmaps may consume.
- It does **not** culminate in arithmetic applications, and does **not** package a one-off induced
  removal theorem as its endpoint; those belong after the counting layer or in a consumer roadmap.

## Prior formalization (secondary — reviewers judge the mathematics, not this map)

[`cameronfreer/regularity-lemmata`](https://github.com/cameronfreer/regularity-lemmata) is a public
Lean 4 library of finite regularity, counting, and approximation infrastructure — `sorry`-free with
no custom axioms (CI-enforced by its `scripts/check.sh`). Its partition/graph layers are developed
for **directed relations on an arbitrary `Finset` host** (subsuming `SimpleGraph`); its hypergraph
development is Boolean and unordered. The declaration-level claims in this section and the
per-layer notes were checked at commit
[`a18f98c96770967bc9f3ab5a81fdf642d9f68b99`](https://github.com/cameronfreer/regularity-lemmata/tree/a18f98c96770967bc9f3ab5a81fdf642d9f68b99),
which the protected tag
[`tauceti-roadmap-pin-1`](https://github.com/cameronfreer/regularity-lemmata/tree/tauceti-roadmap-pin-1)
also names (the full SHA is authoritative; later commits may move things). Much of Layers 1–4, and Boolean
precursors of Layers 5–8, are proved there; the per-layer *Prior formalization* notes above record the shape
deviations a TauCeti implementation must reconcile. Summary map, with each row's exact
relationship to the targets here condensed from the per-layer notes:

| Roadmap layer | Proved there (representative names) | Relationship to the targets here |
|---|---|---|
| 1 | `energy`, `energy_mono`, `energy_le_one` (`Partition/Energy.lean`) | more general (mass-weighted, directed, arbitrary `Finset` host); `weightedEnergy` can specialize it |
| 2 | `AlmostRefinesAt` / `exceptionalMass` / `AlmostRefines`; `IsRegularPartition`; `exists_regular_refinement_and_almostRefining_equipartition` (+ `_of_bound_le`, `_ceil`); the separate Mathlib `szemeredi_regularity` bridge (`Graph/Bridge.lean`) | two-partition intermediate (exact refinement + a separate, non-regular almost-refining equipartition); the self-regular target here is its explicitly deferred endpoint |
| 3 | `steppedCount`, `cutDiscrepancy`, `cutDiscrepancy_le_iff`, `frieze_kannan`, `frieze_kannan_cutDiscrepancy` (`Graph/{CutNorm,FriezeKannan}.lean`) | same statement shapes for directed relations; the targets here are its `SimpleGraph` specialization |
| 4 | `ErrorSchedule`, `StrongWitness`, `exists_strongWitness` (`Graph/Strong.lean`); the binary-palette strong-witness counting chain and graph bridges (`Relational/GraphCounting.lean`) as the closest counting analogue | precursor witness (no equipartition or coarse-regularity fields; complexity bound in the conclusion); the counting gate stays open |
| 5–8 (precursor) | `IsLocalDiscRegular`, `exists_goodColoring`, `exists_triadic_regular_approximation` (`Hypergraph/*.lean`) | Boolean, unordered-pair, no-vertex-partition precursor by a deliberately different route (see the Layers 5–8 note) |
| 9 (blueprint) | transversal counting plus the diagonal-cell gate and pattern-local union bounds (its binary-palette counting phase) | architectural blueprint (transversal-first + diagonal gate), not a statement-level match |
| Convention 5 (validation) | the complete two-way binary palette (`Bool × Bool` per symbol, both directions, loops via vertex profiles) with kernel-`decide` falsification examples — a proved arity-2 validation of "control presence *and* absence" | proved arity-2 validation of the convention, not a migration source |

[`cameronfreer/graphon`](https://github.com/cameronfreer/graphon) is the **parallel analytic
development** (graphons, analytic cut norm, step approximation) that `regularity-lemmata`'s cut-norm
file cites as its analytic counterpart, with comparison adapters deferred on both sides — an analytic
parallel of this roadmap, not a supplier.

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

- Does every later object have a construction layer before it is used (e.g. `PairSkeleton3` before
  `IsPairColorRegular` / `LowerSkeletonRegular`; `Polyad3` before `TriadicComplex3`)?
- Is pair regularity **skeleton-relative** — `IsPairColorRegular S ε` quantifying over ordered pairs
  of actual vertex cells `A, B ∈ S.vertexPart.parts` and their sub-cells, not arbitrary finsets?
- Is the independence boundary respected — the finite objects named `steppedCount` /
  `cutDiscrepancy` (never "the canonical finite cut norm"), **no graphon imports or analytic
  prerequisites** in any layer, and every finite–analytic comparison confined to the
  *Interoperability adapters* paragraph with a downstream owner?
- Does the roadmap use `SimpleGraph`, `Finpartition (univ)`, `IsUniform`, and the Mathlib regularity
  vocabulary (with `[DecidableRel G.Adj]`), and the size-weighted `weightedEnergy` rather than
  overclaiming Mathlib's unweighted `Finpartition.energy` as refinement-monotone?
- Is the Layer-2 bridge nontrivial — an *equipartition* `P₀`, a large-`V` hypothesis, a complexity
  bound, and an `AlmostRefines` with a real containment clause (so the discrete partition is not a
  vacuous witness)?
- Does `StrongRegular` carry a complexity bound **in terms of the starting complexity `l₀`** (not
  just uniformity + energy, which the discrete partition satisfies), and is the Layer 2 → Layer 4
  connection a **named target** (`exists_regular_exact_refining_equipartition`) rather than a hidden
  jump from almost-refinement to the exact `Q ≤ P` nesting? Is `exists_strong_regular`
  compositional (starting equipartition `P₀`, minimum complexity `l`, almost-refinement conclusion)?
- Are hypergraph complexes, cells, polyads, subpolyads, and relative densities **real targets**, not
  hidden inside the main theorem? Does `Polyad3` depend on a lower skeleton and store its three pair
  colors (so it is a polyad over the skeleton, not an arbitrary triple-support)? Does `Subpolyad3`
  select **arbitrary subgraphs of the parent's three pair graphs** (the Rödl–Schacht/NRS subtriad —
  vertex-subcell restriction only a constructor), and is top regularity the **rank-`r`**
  `IsTopRegularOverPolyad` over unions of subpolyads — with the weaker
  `IsVertexBoxRegularOverPolyad` never consumed by the counting theorem? Are polyad supports
  **injective** (no diagonals) and role-ordered, with the support pinned by `mem_support_iff` (so
  repeated-cell orderings are de-duplicated in the counting layer, not by thinning the support)?
- Does `TriadicComplex3` **choose** its lower pair palette (`pairColorCount`), and does the regular-approximation theorem
  quantify existentially over it rather than accepting an arbitrary fixed `κ₂`? Does it also
  quantify an **explicit approximant** `H'` — so `editDiscrepancy3 H H'` compares two colorings that
  both exist — with top regularity tested on `H'` and counting transferred back to `H` through the
  edit bound? Is `C.complexity` a **computed** measure of the structure (vertex cells + pair colors
  + polyads), not a free stored field? Does `IsStrongRegularApproximation3` include a real
  `IsPolyadDecomposition` (disjoint + covering) so `exceptionalPolyadMass` is not vacuous, split top
  regularity into a local parameter `F C.complexity`, a rank `r`, and an exceptional-mass bound `ε`,
  and use a `regularityBound3` depending on the top palette size, the rank, **and the vertex floor
  `t₀`** (a `t₀`-independent bound makes the statement false for `t₀` above it)? Does the theorem's
  conclusion carry `VertexCellsControlled C t₀` (equitable vertex cells, a complexity floor) — the
  diagonal-gate input the global counting theorem consumes?
- Are top relations a **total unordered** coloring with a **separate** pair palette `κ₂` / top palette
  `κ₃`, are pair colors on **distinct** ordered pairs (no diagonal), and are relative densities / top
  regularity **color-indexed**? Is `expectedInducedCount` **intrinsically specified** — a sum over
  placements (`PatternPlacement3`, `PairColorPlacement3`) of a pinned product of cell-size,
  pair-color-density, and top-color-relative-density factors, **never** defined through
  `inducedCopyCount` — with pair colors assigned to **one canonical orientation per pattern pair**
  (never both marginals, whose joint correlation pair regularity does not control)? Does induced
  counting run through the placed local theorem (`placed_induced_counting3`) at **transversal**
  placements with **top-regular routes** (`IsTopRegularRoute` — the strong approximation controls
  only most polyads, so unrestricted routes would claim control over exceptional polyads), counting
  **in the approximant `H'`** (never per-placement in `H`), and at the **per-route budget at the
  `ε/6` charge** (`routeBudget3 _ _ (ε/6)` — a bare per-route `ε` cannot sum over the
  `q₂^(k choose 2)` routes per placement to any fraction of the global bound, and the full `ε`
  in step 1 leaves nothing for the other charges)? Are the discarded routes bounded on **both**
  sides — actual (`exceptional_route_mass_le`) and predicted
  (`exceptional_route_prediction_mass_le`, run through the lower-route bridge — input regularity
  at the threshold, output slack the separate `(ρ, δ)` pair, never the schedule in as strength
  and out as slack — with a **separate** `εmass`, the instantiation at the **lower complexity**
  the skeleton's regularity actually supplies, and the **route-count factor** in the slack)? Do
  the **charge-pinning inequalities** (`inducedCountingParameter3_charge`,
  `exceptionalPredictionSlack3_charge`) show every global charge fits its `ε/6` fraction? Does the
  chain use the named global edit transfer (`inducedCopyCount_edit_transfer`), the diagonal floor
  (`VertexCellsControlled` at `diagonalControl3 F₀.k ε`) with its charge **pinned as a theorem**
  (`nontransversal_actual_and_predicted_mass_le`, covering both the actual and the predicted side
  omitted by transversal counting), the pattern-size error scale `|V|^{F₀.k}`
  (not `|V|³`), a genuine **schedule** `inducedCountingSchedule3` separate from the global
  parameter `inducedCountingParameter3` (never the counting error `ε` itself as the regularity
  strength, never a constant schedule, and positive everywhere —
  `inducedCountingSchedule3_pos`, needed for the regular-approximation theorem's `hF`), and a rank pinned `≥ 1`
  (`one_le_inducedCountingRank3` — rank `0` is vacuous)?
- Is the regularity-to-counting bridge **named** — the concrete lower-route counts, the
  sparse/dense split at the per-route budget (sparse self-bounds; never a seventh global charge,
  never folded into the exceptional polyads), the input-strength threshold
  `pairRouteRegularityThreshold3` — its meaning fixed by the dense counting theorem, its
  admissibility by positivity, and the schedule's adequacy by calibration — decoupling input
  strength from output slack, and the
  dense conversion's explicit parameter inequalities (`δ ≤ ρ`, the scaled `k³·η ≤ δ`) and its
  genuine rank requirement (`requiredTopCountingRank3 … ≤ r` with its `≥ 1` pin and its
  calibration against `inducedCountingRank3` — never a bare `1 ≤ r`)? Does
  `placed_induced_counting3` take only its local contract (transversality, lower-skeleton
  regularity at the schedule, route-local top regularity) — never the full approximation bundle?
  Are the fibration identity, its predicted mirror, and the proved six-charge arithmetic assembly
  explicit targets rather than proof-internal steps?
- Are error hierarchies explicit `F : ℕ → ℝ` with the evaluation argument pinned (the lower
  complexity `#vertex-cells + #pair-colors` for `LowerSkeletonRegular`; `C.complexity` for
  `TopRegularOverMostPolyads`), and is the `card V < r ⇒ density 0` convention pinned?
- Does `Suggested.lean` avoid `def _ : Prop := sorry` and contentless `Prop` fields, using `sorry` only
  for data-def bodies and theorem proofs?
- Does each layer have at least one acceptance example, and is v1 bounded at strong hypergraph
  regularity **plus counting**, with applications left as consumers?

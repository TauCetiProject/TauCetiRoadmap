# Roadmap: graph regularity, strong regularity, and arity-3 hypergraph complexes

Mathlib already carries a finite-graph **regularity** ecosystem — `SimpleGraph`, edge densities,
`Finpartition` / `IsEquipartition` / `equitabilise`, the Szemerédi regularity lemma
(`szemeredi_regularity`), triangle counting/removal, and graph copy-counting (`SimpleGraph.Copy`). The
**dense graph limits** roadmap (graphons, the analytic cut norm, cut distance, analytic Frieze–Kannan,
compactness, sampling) is an **independent parallel analytic development**, owned separately. This
roadmap builds the **finite combinatorial regularity tower** — finite weak (Frieze–Kannan)
regularity, **strong graph regularity**, and **arity-3 hypergraph-complex regularity and counting** —
the material Mathlib lacks, with **no analytic prerequisites**: nothing here waits on the graphon
roadmap, and any finite–analytic comparison is an optional downstream adapter (see *Interfaces
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
   `szemeredi_regularity` and its `increment` machinery directly.
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
   `F #vertex-cells`; `TopRegularOverMostPolyads` uses `F C.complexity`). *Why:* strong regularity is
   about a coarse/fine hierarchy where the fine error depends on the coarse complexity; leaving that
   implicit hides the load-bearing choice.
7. **Counting is part of the summit.** The strong regularity theorem alone is not the endpoint; the
   local summit is regularity **plus** induced counting/embedding for fixed finite colored patterns.
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
- **Building blocks:** `Nat.descFactorial` (falling factorial), `Finset.powersetCard`, `Nat.choose`. **No hypergraph type exists in Mathlib** — the hypergraph objects here are built from scratch.

## Cross-roadmap dependencies

| Area | Owner | This roadmap's role |
|---|---|---|
| `SimpleGraph`, graph maps/counting, `Finpartition`, Szemerédi regularity | **Mathlib** | consume directly; add thin Tau Ceti-facing wrappers only where they remove friction |
| Graphons, analytic cut norm / Frieze–Kannan, cut distance, graphon sampling | **Dense graph limits roadmap** | **independent parallel theory**; optional interoperability adapters later |
| Sequence exchangeability, de Finetti, exchangeable arrays / Aldous–Hoover | **Exchangeability roadmap** | background/consumer only; **not** the peak |
| Finite weak regularity (`steppedCount`, `cutDiscrepancy`, finite Frieze–Kannan) | **this roadmap** | build (Layer 3) |
| Strong graph regularity | **this roadmap** | build (Layer 4) |
| Hypergraph complexes, polyads, strong hypergraph regularity, induced counting | **this roadmap** | build (Layers 5–9) |

The dense graph limits roadmap covers graphons, the analytic cut norm, cut distance, analytic
Frieze–Kannan, and sampling. This roadmap's Layer 3 develops **finite weak regularity** —
`steppedCount`, the count-scaled `cutDiscrepancy`, and a directly proved finite Frieze–Kannan
theorem — as its own layer, with no graphon imports: the finite and analytic theorems are
**independent formulations, neither derived from the other**, and may later be compared by optional
adapters (see *Interfaces exported to other roadmaps*). `Suggested.lean` imports only Mathlib and
pins the Layer-3 targets directly.

## The build, in layers

Each layer lists what it **consumes**, what it **builds**, and its **acceptance gate**.

### Layer 0 — finite colored graph and 3-uniform vocabulary
- **Consume.** `SimpleGraph`, `SimpleGraph.Copy` / `copyCount`, `Nat.descFactorial`, `Finset.powersetCard`.
- **Build.** `UniformHypergraph r V` and `UniformHypergraph.edgeDensity`; the total unordered top-coloring carrier `Colored3Graph κ₃ V`; colored / hypergraph copy-counts and densities Mathlib lacks. Plain-graph hom/injective densities are built here from `Copy` / `descFactorial` (name alignment with the dense graph limits roadmap's `homDensityFin` / `injHomDensity` is optional interoperability, not a dependency — see *Interfaces exported to other roadmaps*).
- **Gate.** `K₂`, a triangle, the complete and empty `r`-uniform hypergraphs; hom densities normalized by powers, injective densities by the falling factorial `(n)_k`.

### Layer 1 — partitions, block densities, refinement, energy
- **Consume.** `Finpartition`, `equitabilise`, `edgeDensity`, and the `SzemerediRegularity.increment` boost machinery.
- **Build.** `UniformHypergraph.blockDensity`; the **size-weighted** graph energy `weightedEnergy` (the `L²` norm of the block-average step function, casts before division, **including** the diagonal blocks `i = j`) and its refinement-monotonicity `weightedEnergy_mono_of_refines`; the hypergraph-level analogue. **Not** Mathlib's unweighted `Finpartition.energy`, an `offDiag`-based average that is *not* Jensen-monotone under arbitrary refinement (it is monotone only inside the `increment` argument). (Comparison with the dense graph limits roadmap's analytic `graphonPartitionEnergy` is optional interoperability, not a deliverable — see *Interfaces exported to other roadmaps*.)
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
layer's target, is that library's explicitly deferred summit. It is proved from the library's **own**
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
- **Consume.** Layers 1–2 (`weightedEnergy`, the refining bridge), `IsUniform`.
- **Build.** `StrongRegular` — a coarse `P` and fine `Q` (`Q ≤ P`), both equipartitions, `P` `ε`-uniform, `Q` `F(#P.parts)`-uniform, `weightedEnergy Q − weightedEnergy P ≤ ε`, **and** a complexity bound `#Q.parts ≤ strongGraphRegularityBound ε F` (essential: it prevents the discrete partition from being the universal large-graph witness) — and `exists_strong_regular`. Plus a counting lemma consuming `StrongRegular`.
- **Gate.** The roadmap demands at least one counting lemma that consumes `StrongRegular`, not merely the existence theorem.

**Prior formalization.** `regularity-lemmata` proves `exists_strongWitness` (`Graph/Strong.lean`): a
`StrongWitness` against an **arbitrary starting partition `P₀`** (a feature `StrongRegular` lacks),
for directed relations, with error schedules bundled with their positivity (`ErrorSchedule` — a nicer
API than a bare `F` plus `hF`). Shape deviations: the witness has **no equipartition fields and no
coarse-partition regularity** — only the fine partition is regular, at the schedule's tolerance for
the coarse complexity — so `regP` has no proved counterpart; and the complexity bound lives in the
**theorem conclusion** (both coarse and fine bounded by iterated `monoStepBound`,
host-independently), not as a structure field. On the counting gate: a closely related analogue is
proved — its binary-palette strong-witness counting chain and graph bridges
(`Relational/GraphCounting.lean`: edge, path, triangle, and induced three-vertex counts) consume a
`BinaryPaletteStrongWitness`, not this `StrongRegular` — so the gate itself stays open.

### Layer 5 — hypergraph complexes; vertex cells and pair-color systems
- **Consume.** `Finpartition`, Layer 1.
- **Build.** `HypergraphComplex` (faces / `face_card` / `down_closed`); the `PairColorSystem κ₂ V` — a coloring of ordered **distinct** vertex pairs (`{p : V × V // p.1 ≠ p.2} → κ₂`; diagonals excluded, matching the injective top supports), with the total `colorOfPair : V → V → Option κ₂` view; `pairColorDensity` (over distinct pairs, `_ / 0 = 0` when none); the lower skeleton `PairSkeleton3 κ₂ V`; a **skeleton-relative** `IsPairColorRegular S ε` (quantifying over ordered pairs of actual vertex cells `A, B ∈ S.vertexPart.parts` and large sub-cells `A' ⊆ A`, `B' ⊆ B` — not arbitrary finsets, so pair regularity is genuinely tied to the skeleton); and `LowerSkeletonRegular` (with `F` at `#vertex-cells`). The whole lower-skeleton regularity API is built here so Layer 8 consumes real defs — no jump from "pair-color system" to "lower skeleton regular".
- **Gate.** `r = 2` interfaces coherently with the graph layer (the bare down-closed complex does not by itself reconstruct the partition/cell machinery; the colored/cell object is what specializes); labeled copies of a fixed complex are definable.

### Layer 6 — triads, polyads, subpolyads, relative densities
- **Consume.** Layer 5.
- **Build.** `Polyad3 S` **over a lower skeleton `S`** — three vertex cells (each a part of `S.vertexPart`), the three pair colors on the coordinate pairs, and the support of role-ordered injective triples pinned by `mem_support_iff` to those cells *and* pair colors (so a polyad is determined by cells + lower pair colors, **not** an arbitrary support finset); `Subpolyad3 P` as a genuine **lower-skeleton restriction** (sub-cells `⊆ P`'s cells, support = `P.support` restricted to them); `relDensityOn` / the **color-indexed** `relativeDensity` (reading the top color through the *underlying unordered triple*, so ordering never affects the color). Since `mem_support_iff` pins the support exactly, it contains **every** matching role-ordered tuple: for **distinct** cells each unordered triple admits at most one matching role-assignment (no overcounting); when cells repeat, several orderings can match, and de-duplication is the **counting layer's** job, not a thinning of the support.
- **Gate.** The 3-uniform worked example computes a relative triple density over a triad and over a subpolyad.

### Layer 7 — top-layer regularity over polyads
- **Consume.** Layer 6.
- **Build.** `IsTopRegularOverPolyad` — for every top color and every large enough **subpolyad** (lower-skeleton restriction, *not* an arbitrary triple-subset), relative-density stability. Plus the most-polyads / exceptional-mass and slicing/inheritance targets.
- **Gate.** The `r = 2` shadow of top regularity matches pair regularity; per-color quantification is present.

### Layer 8 — strong arity-3 regular approximation (summit)
- **Consume.** Layers 5–7.
- **Build.** `TriadicComplex3 κ₃ V` — it **chooses** its lower pair palette (`pairColorCount : ℕ`, `skeleton : PairSkeleton3 (Fin pairColorCount) V`) and carries `polyads : Finset (Polyad3 skeleton)`, with `complexity` **computed** from the structure (vertex cells + pair colors + polyads — never a free stored field, which could be `0` and control nothing); an **explicit approximant** `H' : Colored3Graph κ₃ V` with `editDiscrepancy3 H H'` (unordered color disagreements at the ordered `6/|V|³` normalization — a real definition, not a target) and `Approximates3` (the clause tying `H'` to `H`); `IsPolyadDecomposition` (polyad supports pairwise disjoint and covering the injective triples — so the mass below is not vacuous); `exceptionalPolyadMass` and `TopRegularOverMostPolyads H' C η ε` (top regularity of the **approximant** `H'` **relative to** `C`'s polyad decomposition, with the local parameter `η = F C.complexity` and the exceptional-mass bound `ε` as **separate** arguments); `ComplexityBounded`; `regularityBound3 q₃ ε F` (**depends on the top palette size** `q₃`); `IsStrongRegularApproximation3 H H' C` (approximation ∧ decomposition ∧ lower-skeleton regular ∧ top-over-most-polyads-for-`H'` ∧ complexity — all real; the approximation and decomposition clauses are essential, else the rest is satisfiable by data unrelated to `H`); and `exists_strong_regular_approximation3` (existential over **both** the approximant `H'` and `TriadicComplex3 κ₃ V`, so the pair palette is chosen, not an arbitrary fixed `κ₂`).
- **Gate.** The two-dimensional shadow of the arity-3 definitions is compared with Layer 4's graph strong-regularity API; the roadmap does **not** claim the arity-3 objects literally specialize to a generic `r = 2` theorem in v1.

**Prior formalization (Layers 5–8).** `regularity-lemmata` reaches two proved arity-3 summits by a
deliberately different route (`Hypergraph/*.lean`): the weak summit `exists_goodColoring` (every
3-uniform hypergraph admits a pair coloring with at most `triadBound δ` colors and bad-triad mass
`≤ δ`) and the edited summit `exists_triadic_regular_approximation` (a deletion-only subgraph within
`δ·|V|³` ordered edits under which **every** key is locally disc-regular). Divergences a TauCeti
implementation must reconcile: its pair carrier is **unordered** 2-sets (`RSet 2 V → Fin K`) vs the
ordered distinct pairs pinned here; it has **no vertex partition** (compatibility with an equitable
vertex partition is its explicitly deferred strengthening) vs `PairSkeleton3`'s bundled `vertexPart`;
its top layer is **Boolean** `UniformHypergraph 3` vs the total colored `Colored3Graph κ₃` (colored
arity-3 counting is its deferred item); and its regularity notion is parent-relative local disc
regularity (`IsLocalDiscRegular`) vs subpolyad density stability. Its proved permutation closure
(`isBadTriad_comp_perm_iff` — orientation-invariant badness and cleanup) supplies the
permutation-invariance discipline the counting layer's de-duplication will need (it is not itself
repeated-cell de-duplication). On `editDiscrepancy3`, its Boolean edit calculus is the specialization
precedent: unordered symmetric-difference edit count with the **proved** factor-6 ordered identity,
normalized by `|V|³` under `x/0 = 0` — the colored `editDiscrepancy3 H H'` counts unordered color
disagreements between the original and the **explicit approximant** at the same ordered `6/|V|³`
normalization, and its edited summit's deletion-only subgraph is the Boolean specialization
precedent for this explicit-approximant architecture (the full shapes still differ). Bound
caution for `regularityBound3`: the proved `triadRegularityBound` iterates a `cutBound` recurrence of
shape `K ↦ K·2^{O(K³)}` per round — **not** a single exponential.

### Layer 9 — induced counting and embedding
- **Consume.** Layer 8.
- **Build.** `FiniteColored3Pattern` (on `k` vertices); `Colored3Graph.inducedCopyCount`; `expectedInducedCount H' C F₀` (needs the **approximant** `H'` — for the realized top colors — and `C` — for the polyad densities); `inducedCountingParameter3 q₃ k ε` (+ its positivity) — the **`V`-independent** regularity strength that counting needs, as a function of palette size, pattern size, and target error (the counting error and the regularity parameter cannot be the same `ε`); and `induced_counting_from_strong_regular_complex3` — an approximation `(H', C)` at that parameter predicts the induced copy count of a fixed pattern **in the original `H`** within `ε·|V|^{F₀.k}` (the **pattern-size** scale, not `|V|³`): counting is performed on the regular `H'` and transferred back to `H` through the edit bound. The clean local statement sums over part-respecting **placements** into the polyads; the global theorem is assembled from it (the placed version is the finer target).
- **Gate.** At least one concrete small-pattern count (a triangle for graphs, one fixed 3-uniform colored pattern).

**Prior formalization (blueprint).** The binary-palette counting phase of `regularity-lemmata` is the
architectural blueprint: counting is proved first for **transversal** embeddings (distinct coarse
cells), and the nontransversal mass is controlled by an explicit **diagonal-cell gate** (an initial
equipartition bounding coarse cell sizes, with a derived diagonal error term) — the load-bearing step
before any removal statement. The placed/part-respecting local statement here should anticipate the
same transversal/global split, with pattern-local union bounds (only the palette colors the pattern
actually mentions) and derived, not guessed, error constants.

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

Layers 0–1 (substrate) and the graph-regularity summit 2–4 first — they are honestly pinnable against
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

**Optional interoperability (not gating any layer).** The finite and analytic developments may later
be compared by adapters, owned by whichever side finds them useful: a `stepGraphonOfFinpartition`
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
  Frieze–Kannan theorem); finite–analytic comparisons are optional downstream adapters, not
  deliverables.
- It does **not** own exchangeability or representation theorems for exchangeable arrays; it exports
  deterministic finite regularity inputs those roadmaps may consume.
- It does **not** culminate in arithmetic applications, and does **not** package a one-off induced
  removal theorem as its summit; those belong after the counting layer or in a consumer roadmap.

## Prior formalization (secondary — reviewers judge the mathematics, not this map)

[`cameronfreer/regularity-lemmata`](https://github.com/cameronfreer/regularity-lemmata) is a public
Lean 4 library of finite regularity, counting, and approximation infrastructure — `sorry`-free with
no custom axioms (CI-enforced by its `scripts/check.sh`). Its partition/graph layers are developed
for **directed relations on an arbitrary `Finset` host** (subsuming `SimpleGraph`); its hypergraph
development is Boolean and unordered. Much of Layers 1–4, and Boolean precursors of
Layers 5–8, are proved there; the per-layer *Prior formalization* notes above record the shape
deviations a TauCeti implementation must reconcile. Summary map:

| Roadmap layer | Proved there (representative names) |
|---|---|
| 1 | `energy`, `energy_mono`, `energy_le_one` (`Partition/Energy.lean`) |
| 2 | `AlmostRefinesAt` / `exceptionalMass` / `AlmostRefines`; `IsRegularPartition`; `exists_regular_refinement_and_almostRefining_equipartition` (+ `_of_bound_le`, `_ceil`); the separate Mathlib `szemeredi_regularity` bridge (`Graph/Bridge.lean`) |
| 3 | `steppedCount`, `cutDiscrepancy`, `cutDiscrepancy_le_iff`, `frieze_kannan`, `frieze_kannan_cutDiscrepancy` (`Graph/{CutNorm,FriezeKannan}.lean`) |
| 4 | `ErrorSchedule`, `StrongWitness`, `exists_strongWitness` (`Graph/Strong.lean`); the binary-palette strong-witness counting chain and graph bridges (`Relational/GraphCounting.lean`) as the closest counting analogue |
| 5–8 (precursor) | `IsLocalDiscRegular`, `exists_goodColoring`, `exists_triadic_regular_approximation` (`Hypergraph/*.lean`) |
| 9 (blueprint) | transversal counting plus the diagonal-cell gate and pattern-local union bounds (its binary-palette counting phase) |
| Convention 5 (validation) | the complete two-way binary palette (`Bool × Bool` per symbol, both directions, loops via vertex profiles) with kernel-`decide` falsification examples — a proved arity-2 validation of "control presence *and* absence" |

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
- V. Rödl, M. Schacht, *Regular partitions of hypergraphs* (2007); B. Nagle, V. Rödl, M. Schacht,
  *The counting lemma for regular k-uniform hypergraphs*, Random Struct. Alg. 28 (2006).
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
  prerequisites** in any layer, and all finite–analytic comparisons confined to the *Optional
  interoperability* paragraph?
- Does the roadmap use `SimpleGraph`, `Finpartition (univ)`, `IsUniform`, and the Mathlib regularity
  vocabulary (with `[DecidableRel G.Adj]`), and the size-weighted `weightedEnergy` rather than
  overclaiming Mathlib's unweighted `Finpartition.energy` as refinement-monotone?
- Is the Layer-2 bridge nontrivial — an *equipartition* `P₀`, a large-`V` hypothesis, a complexity
  bound, and an `AlmostRefines` with a real containment clause (so the discrete partition is not a
  vacuous witness)?
- Does `StrongRegular` carry a complexity bound (not just uniformity + energy, which the discrete
  partition satisfies)?
- Are hypergraph complexes, cells, polyads, subpolyads, and relative densities **real targets**, not
  hidden inside the summit theorem? Does `Polyad3` depend on a lower skeleton and store its three pair
  colors (so it is a polyad over the skeleton, not an arbitrary triple-support)? Is `Subpolyad3` a
  genuine lower-skeleton restriction (sub-cells), and is top regularity tested against **subpolyads**,
  not arbitrary triple-subsets? Are polyad supports **injective** (no diagonals) and role-ordered,
  with the support pinned by `mem_support_iff` (so repeated-cell orderings are de-duplicated in the
  counting layer, not by thinning the support)?
- Does `TriadicComplex3` **choose** its lower pair palette (`pairColorCount`), and does the summit
  quantify existentially over it rather than accepting an arbitrary fixed `κ₂`? Does the summit also
  quantify an **explicit approximant** `H'` — so `editDiscrepancy3 H H'` compares two colorings that
  both exist — with top regularity tested on `H'` and counting transferred back to `H` through the
  edit bound? Is `C.complexity` a **computed** measure of the structure (vertex cells + pair colors
  + polyads), not a free stored field? Does `IsStrongRegularApproximation3` include a real
  `IsPolyadDecomposition` (disjoint + covering) so `exceptionalPolyadMass` is not vacuous, split top
  regularity into a local parameter `F C.complexity` and an exceptional-mass bound `ε`, and use a
  `regularityBound3` depending on the top palette size?
- Are top relations a **total unordered** coloring with a **separate** pair palette `κ₂` / top palette
  `κ₃`, are pair colors on **distinct** ordered pairs (no diagonal), and are relative densities / top
  regularity **color-indexed**? Does induced counting use `expectedInducedCount H' C F₀` (predicted
  from the approximant, transferred to the original `H` through the edit bound), the pattern-size
  error scale `|V|^{F₀.k}` (not `|V|³`), and a **`V`-independent regularity parameter**
  `inducedCountingParameter3 q₃ k ε` (never the counting error `ε` itself as the regularity strength)?
- Are error hierarchies explicit `F : ℕ → ℝ` with the evaluation argument pinned (`#vertex-cells`,
  `C.complexity`), and is the `card V < r ⇒ density 0` convention pinned?
- Does `Suggested.lean` avoid `def _ : Prop := sorry` and contentless `Prop` fields, using `sorry` only
  for data-def bodies and theorem proofs?
- Does each layer have at least one acceptance example, and is v1 bounded at strong hypergraph
  regularity **plus counting**, with applications left as consumers?

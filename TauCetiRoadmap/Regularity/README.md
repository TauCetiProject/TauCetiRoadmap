# Roadmap: graph regularity, strong regularity, and arity-3 hypergraph complexes

Mathlib already carries a finite-graph **regularity** ecosystem — `SimpleGraph`, edge densities,
`Finpartition` / `IsEquipartition` / `equitabilise`, the Szemerédi regularity lemma
(`szemeredi_regularity`), triangle counting/removal, and graph copy-counting (`SimpleGraph.Copy`). The
**dense graph limits** roadmap (graphons, cut norm, cut distance, Frieze–Kannan weak regularity,
compactness, sampling) is being developed separately. This roadmap builds the **finite combinatorial
regularity tower** that connects those two developments to **strong graph regularity** and to
**arity-3 hypergraph-complex regularity and counting** — the material Mathlib lacks.

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
energy, a graph-regularity bridge, strong graph regularity, hypergraph complexes, polyads, relative
densities, regularity over polyads, the strong approximation, and counting/embedding lemmas.

**Suggested home:** `TauCeti/Combinatorics/Regularity/{Partition,Graph,Strong}/` and
`TauCeti/Combinatorics/Hypergraph/{Basic,Complex,Regularity,Counting}/`. Graphons are **not** homed
here: they are consumed from `TauCeti/Combinatorics/DenseGraphLimits/`.

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
   `PairSkeleton3` / `TriadicComplex3` carries faces/cells/pair-colors/polyads/complexity as fields.
   *Why:* a regularity proof encoded as scattered predicates has no reusable API; the theory the
   roadmap asks for lives on these objects.
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

Reuse these by name; do not rebuild them.

- **Szemerédi regularity:** `szemeredi_regularity (hε : 0 < ε) (hl : l ≤ card α) : ∃ P : Finpartition (univ : Finset α), P.IsEquipartition ∧ l ≤ #P.parts ∧ #P.parts ≤ SzemerediRegularity.bound ε l ∧ P.IsUniform G ε` (`Combinatorics/SimpleGraph/Regularity/Lemma.lean`).
- **Uniformity / energy:** `SimpleGraph.IsUniform`, `Finpartition.IsUniform`, `Finpartition.nonUniforms`, `SimpleGraph.nonuniformWitness` (`Regularity/Uniform.lean`); `Finpartition.energy` and the `SzemerediRegularity.increment` / `chunk` energy-boost machinery (`Regularity/{Energy,Chunk,Increment}.lean`).
- **Partitions:** `Finpartition`, `Finpartition.IsEquipartition` (`(parts).EquitableOn card`), `Finpartition.equitabilise`, `Finpartition.exists_equipartition_card_eq` (`Order/Partition/{Finpartition,Equipartition}.lean`, `Regularity/Equitabilise.lean`). **`P ≤ Q` = `P` refines `Q`.**
- **Densities and copies:** `SimpleGraph.edgeDensity` (`SimpleGraph/Density.lean`); `SimpleGraph.Copy`, `IsContained` (`⊑`), `Free`, `copyCount`, `labelledCopyCount` (`SimpleGraph/Copy.lean`); triangle counting/removal and `triangleRemovalBound` (`SimpleGraph/Triangle/`).
- **Building blocks:** `Nat.descFactorial` (falling factorial), `Finset.powersetCard`, `Nat.choose`. **No hypergraph type exists in Mathlib** — the hypergraph objects here are built from scratch.

## Cross-roadmap dependencies

| Area | Owner | This roadmap's role |
|---|---|---|
| `SimpleGraph`, graph maps/counting, `Finpartition`, Szemerédi regularity | **Mathlib** | consume directly; add thin Tau Ceti-facing wrappers only where they remove friction |
| Graphons, cut norm, cut distance, Frieze–Kannan, graphon sampling | **Dense graph limits roadmap** | **consume** via finite adapters (Layer 3); never redefine |
| Sequence exchangeability, de Finetti, exchangeable arrays / Aldous–Hoover | **Exchangeability roadmap** | background/consumer only; **not** the peak |
| Strong graph regularity | **this roadmap** | build (Layer 4) |
| Hypergraph complexes, polyads, strong hypergraph regularity, induced counting | **this roadmap** | build (Layers 5–9) |

The dense graph limits roadmap already covers graphons, cut norm, cut distance, Frieze–Kannan, and
sampling, and distinguishes Mathlib's strong Szemerédi lemma from Frieze–Kannan weak regularity. This
roadmap **consumes** those results and proves finite adapters/corollaries only where needed; it does
not claim that graphon/FK development as one of its own layers. Because the dense graph limits roadmap
is still in review, the Layer-3 adapters live in prose below and are pinned in `Suggested.lean` only
once it lands upstream (they will refactor onto its canonical objects — a milestone flagged as
in-flight, per the guide). `Suggested.lean` therefore imports only Mathlib.

## The build, in layers

Each layer lists what it **consumes**, what it **builds**, and its **acceptance gate**.

### Layer 0 — finite colored graph and 3-uniform vocabulary
- **Consume.** `SimpleGraph`, `SimpleGraph.Copy` / `copyCount`, `Nat.descFactorial`, `Finset.powersetCard`.
- **Build.** `UniformHypergraph r V` and `UniformHypergraph.edgeDensity`; the total unordered top-coloring carrier `Colored3Graph κ₃ V`; colored / hypergraph copy-counts and densities Mathlib lacks. Plain-graph hom/injective densities are built here from `Copy` / `descFactorial` and will **refactor onto the dense graph limits roadmap's `homDensityFin` / `injHomDensity` once it merges** (a README-only cross-reference for now, since the base is graphon-free).
- **Gate.** `K₂`, a triangle, the complete and empty `r`-uniform hypergraphs; hom densities normalized by powers, injective densities by the falling factorial `(n)_k`.

### Layer 1 — partitions, block densities, refinement, energy
- **Consume.** `Finpartition`, `equitabilise`, `edgeDensity`, and the `SzemerediRegularity.increment` boost machinery.
- **Build.** `UniformHypergraph.blockDensity`; the **size-weighted** graph energy `weightedEnergy` (the `L²` norm of the block-average step function, casts before division, **including** the diagonal blocks `i = j`) and its refinement-monotonicity `weightedEnergy_mono_of_refines`; the hypergraph-level analogue. **Not** Mathlib's unweighted `Finpartition.energy`, an `offDiag`-based average that is *not* Jensen-monotone under arbitrary refinement (it is monotone only inside the `increment` argument).
- **Gate.** `weightedEnergy` agrees with the block-average `L²` on graphs; the diagonal and repeated-part conventions are explicit.

### Layer 2 — Szemerédi graph regularity bridge
- **Consume.** `szemeredi_regularity` (do **not** reprove).
- **Build.** `AlmostRefines` (with the essential containment clause) and `exists_regular_equipartition_almost_refining`: a regular equipartition **almost-refining** a given equipartition `P₀` with the `V`-independent complexity bound `refiningRegularityBound`. Exact refinement does not survive equitabilisation (equitabilise only almost-refines), so the target is the almost-refinement wrapper. **Soundness hypotheses are required:** `P₀` an equipartition and `V` large enough — else a singleton `P₀`-part cannot be covered up to `ε·|A|` by contained cells of a bounded equipartition, and the statement is false. The bound is a complexity guarantee, not a claim that the discrete partition is excluded (Mathlib's SRL may itself use it for small `V`).
- **Gate.** Yields "all but ε-mass of pairs regular, boundedly many parts, almost-refining an equipartition `P₀`" — the input strong regularity iterates on.

### Layer 3 — weak regularity / graphon handoff
- **Consume.** The dense graph limits roadmap (graphons, cut norm, `stepGraphon`, `weak_regularity_frieze_kannan`).
- **Build.** Finite adapters only: a `stepGraphonOfFinpartition` compatibility and a finite Frieze–Kannan corollary **derived from** that roadmap. In v1 these are **prose** here (not pinned in `Suggested.lean`, which imports only Mathlib); pinned once the dense graph limits roadmap lands upstream.
- **Gate.** No private finite cut norm survives — the canonical one is the graphon roadmap's.

### Layer 4 — strong graph regularity
- **Consume.** Layers 1–2 (`weightedEnergy`, the refining bridge), `IsUniform`.
- **Build.** `StrongRegular` — a coarse `P` and fine `Q` (`Q ≤ P`), both equipartitions, `P` `ε`-uniform, `Q` `F(#P.parts)`-uniform, `weightedEnergy Q − weightedEnergy P ≤ ε`, **and** a complexity bound `#Q.parts ≤ strongGraphRegularityBound ε F` (essential: it prevents the discrete partition from being the universal large-graph witness) — and `exists_strong_regular`. Plus a counting lemma consuming `StrongRegular`.
- **Gate.** The roadmap demands at least one counting lemma that consumes `StrongRegular`, not merely the existence theorem.

### Layer 5 — hypergraph complexes; vertex cells and pair-color systems
- **Consume.** `Finpartition`, Layer 1.
- **Build.** `HypergraphComplex` (faces / `face_card` / `down_closed`); the `PairColorSystem κ₂ V` — a coloring of ordered **distinct** vertex pairs (`{p : V × V // p.1 ≠ p.2} → κ₂`; diagonals excluded, matching the injective top supports), with the total `colorOfPair : V → V → Option κ₂` view; `pairColorDensity` (over distinct pairs, `_ / 0 = 0` when none); the lower skeleton `PairSkeleton3 κ₂ V`; a **skeleton-relative** `IsPairColorRegular S ε` (quantifying over ordered pairs of actual vertex cells `A, B ∈ S.vertexPart.parts` and large sub-cells `A' ⊆ A`, `B' ⊆ B` — not arbitrary finsets, so pair regularity is genuinely tied to the skeleton); and `LowerSkeletonRegular` (with `F` at `#vertex-cells`). The whole lower-skeleton regularity API is built here so Layer 8 consumes real defs — no jump from "pair-color system" to "lower skeleton regular".
- **Gate.** `r = 2` interfaces coherently with the graph layer (the bare down-closed complex does not by itself reconstruct the partition/cell machinery; the colored/cell object is what specializes); labeled copies of a fixed complex are definable.

### Layer 6 — triads, polyads, subpolyads, relative densities
- **Consume.** Layer 5.
- **Build.** `Polyad3 S` **over a lower skeleton `S`** — three vertex cells (each a part of `S.vertexPart`), the three pair colors on the coordinate pairs, and the support of role-ordered injective triples pinned by `mem_support_iff` to those cells *and* pair colors (so a polyad is determined by cells + lower pair colors, **not** an arbitrary support finset); `Subpolyad3 P` as a genuine **lower-skeleton restriction** (sub-cells `⊆ P`'s cells, support = `P.support` restricted to them); `relDensityOn` / the **color-indexed** `relativeDensity` (reading the top color through the *underlying unordered triple*, so ordering never affects the color). Normalization to one representative per role-assignment remains a later invariant.
- **Gate.** The 3-uniform worked example computes a relative triple density over a triad and over a subpolyad.

### Layer 7 — top-layer regularity over polyads
- **Consume.** Layer 6.
- **Build.** `IsTopRegularOverPolyad` — for every top color and every large enough **subpolyad** (lower-skeleton restriction, *not* an arbitrary triple-subset), relative-density stability. Plus the most-polyads / exceptional-mass and slicing/inheritance targets.
- **Gate.** The `r = 2` shadow of top regularity matches pair regularity; per-color quantification is present.

### Layer 8 — strong arity-3 regular approximation (summit)
- **Consume.** Layers 5–7.
- **Build.** `TriadicComplex3 κ₃ V` — it **chooses** its lower pair palette (`pairColorCount : ℕ`, `skeleton : PairSkeleton3 (Fin pairColorCount) V`), carries `polyads : Finset (Polyad3 skeleton)` and a `complexity`; `editDiscrepancy3` and `Approximates3` (the clause tying `C` to `H`); `IsPolyadDecomposition` (polyad supports pairwise disjoint and covering the injective triples — so the mass below is not vacuous); `exceptionalPolyadMass` and `TopRegularOverMostPolyads H C η ε` (top regularity of the original `H` **relative to** `C`'s polyad decomposition, with the local parameter `η = F C.complexity` and the exceptional-mass bound `ε` as **separate** arguments); `ComplexityBounded`; `regularityBound3 q₃ ε F` (**depends on the top palette size** `q₃`); `IsStrongRegularApproximation3` (approximation ∧ decomposition ∧ lower-skeleton regular ∧ top-over-most-polyads ∧ complexity — all real; the approximation and decomposition clauses are essential, else the rest is satisfiable by a complex unrelated to `H`); and `exists_strong_regular_approximation3` (existential over `TriadicComplex3 κ₃ V`, so the pair palette is chosen, not an arbitrary fixed `κ₂`).
- **Gate.** The two-dimensional shadow of the arity-3 definitions is compared with Layer 4's graph strong-regularity API; the roadmap does **not** claim the arity-3 objects literally specialize to a generic `r = 2` theorem in v1.

### Layer 9 — induced counting and embedding
- **Consume.** Layer 8.
- **Build.** `FiniteColored3Pattern` (on `k` vertices); `Colored3Graph.inducedCopyCount`; `expectedInducedCount H C F₀` (needs **both** `H` — for the realized top colors — and `C` — for the polyad densities); and `induced_counting_from_strong_regular_complex3` — the induced copy count of a fixed pattern is within `ε·|V|^{F₀.k}` (the **pattern-size** scale, not `|V|³`) of the count predicted by a strong regular approximation. The clean local statement sums over part-respecting **placements** into the polyads; the global theorem is assembled from it (the placed version is the finer target).
- **Gate.** At least one concrete small-pattern count (a triangle for graphs, one fixed 3-uniform colored pattern).

## Worked examples (acceptance gates)

Independent of implementation: the block-average energy equals the `L²` of the step function; the
refining bridge yields a bounded, almost-refining regular equipartition; strong regularity produces a
coarse/fine pair with the pinned properties; a 3-uniform worked example runs vertex cells → pair cells →
triad → relative triple density → subpolyad density; and at least one fixed colored 3-pattern is counted
from a regular triadic complex.

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

This roadmap exports finite regularity and counting interfaces that later roadmaps may consume — finite
step-graphon adapters, deterministic regularity inputs for exchangeable-array statements, and
removal-style / arithmetic hooks. These are **downstream consumers, not local endpoints**. In
particular, once the exchangeable-array API exists, the finite sampling lemmas here should provide
deterministic regularity inputs for random-array statements; this roadmap does not own the
representation theorem.

## Non-goals

- This roadmap does **not** own dense graph limit theory (graphons, cut norm/distance, compactness,
  Frieze–Kannan); those live in the dense graph limits roadmap and are consumed here through explicit
  adapters.
- It does **not** own exchangeability or representation theorems for exchangeable arrays; it exports
  deterministic finite regularity inputs those roadmaps may consume.
- It does **not** culminate in arithmetic applications, and does **not** package a one-off induced
  removal theorem as its summit; those belong after the counting layer or in a consumer roadmap.

## References

- E. Szemerédi, *Regular partitions of graphs* (1978).
- A. Frieze, R. Kannan, *Quick approximation to matrices and applications*, Combinatorica 19 (1999).
- L. Lovász, B. Szegedy, *Szemerédi's Lemma for the Analyst*, GAFA 17 (2007).
- V. Rödl, M. Schacht, *Regular partitions of hypergraphs* (2007); B. Nagle, V. Rödl, M. Schacht,
  *The counting lemma for regular k-uniform hypergraphs*, Random Struct. Alg. 28 (2006).
- W. T. Gowers, *Hypergraph regularity and the multidimensional Szemerédi theorem*, Ann. of Math. 166
  (2007); T. Tao, *A variant of the hypergraph removal lemma*, JCTA 113 (2006).
- D. Conlon, J. Fox, *Graph removal lemmas* (survey, 2013).
- Y. Dillies, B. Mehta, *Formalising Szemerédi's Regularity Lemma in Lean*, ITP 2022
  ([doi:10.4230/LIPIcs.ITP.2022.9](https://doi.org/10.4230/LIPIcs.ITP.2022.9)) — the Mathlib regularity
  / triangle-removal development this roadmap consumes.

## Reviewer checklist

- Does every later object have a construction layer before it is used (e.g. `PairSkeleton3` before
  `IsPairColorRegular` / `LowerSkeletonRegular`; `Polyad3` before `TriadicComplex3`)?
- Is pair regularity **skeleton-relative** — `IsPairColorRegular S ε` quantifying over ordered pairs
  of actual vertex cells `A, B ∈ S.vertexPart.parts` and their sub-cells, not arbitrary finsets?
- Are graphons, cut norm, cut distance, and Frieze–Kannan **consumed** from the dense graph limits
  roadmap rather than redefined here?
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
  not arbitrary triple-subsets? Are polyad supports **injective** (no diagonals) and role-ordered
  (normalization to one representative per role-assignment flagged as a later invariant)?
- Does `TriadicComplex3` **choose** its lower pair palette (`pairColorCount`), and does the summit
  quantify existentially over it rather than accepting an arbitrary fixed `κ₂`? Does
  `IsStrongRegularApproximation3` include a real `IsPolyadDecomposition` (disjoint + covering) so
  `exceptionalPolyadMass` is not vacuous, split top regularity into a local parameter `F C.complexity`
  and an exceptional-mass bound `ε`, and use a `regularityBound3` depending on the top palette size?
- Are top relations a **total unordered** coloring with a **separate** pair palette `κ₂` / top palette
  `κ₃`, are pair colors on **distinct** ordered pairs (no diagonal), and are relative densities / top
  regularity **color-indexed**? Does induced counting use `expectedInducedCount H C F₀` and the
  pattern-size error scale `|V|^{F₀.k}` (not `|V|³`)?
- Are error hierarchies explicit `F : ℕ → ℝ` with the evaluation argument pinned (`#vertex-cells`,
  `C.complexity`), and is the `card V < r ⇒ density 0` convention pinned?
- Does `Suggested.lean` avoid `def _ : Prop := sorry` and contentless `Prop` fields, using `sorry` only
  for data-def bodies and theorem proofs?
- Does each layer have at least one acceptance example, and is v1 bounded at strong hypergraph
  regularity **plus counting**, with applications left as consumers?

# Roadmap: dense graph limits and graphons

Mathlib already carries a substantial **finite-graph** ecosystem — `SimpleGraph`, `Sym2`, the
graph-homomorphism API (`SimpleGraph.Hom`) and copy-counting, Szemerédi regularity, triangle
counting/removal, Turán density, measurable
simple graphs, and the binomial random graph `G(V, p)` — together with the measure-theoretic stack
(probability measures, `AEEqFun`, product/pi measures, conditional expectation, weak convergence,
`StandardBorelSpace`). What it lacks is the **dense graph limit** theory tying them together: no
graphon, no homomorphism density `t(F, W)`, no cut norm or cut distance, no weak regularity, no
graphon space, no counting/inverse-counting lemmas. We build that theory here, after Part 3 of
Lovász, *Large Networks and Graph Limits* (LNGL), culminating in the equivalence of cut-distance
convergence with convergence of all homomorphism densities — and **connecting graphons and cut
distance to Mathlib's existing finite-graph ecosystem** (regularity, Turán, random graphs) rather
than rebuilding it.

The spine is `Graphon → homDensity → cutNorm → cutDist → GraphonSpace → counting → regularity →
compactness → separation → convergence`. The named theorems (weak regularity, the counting
lemma, compactness, separation) are milestones inside the fuller development, not the whole of
it; each object gets its complete basic API.

**Suggested home:** `TauCeti/Combinatorics/DenseGraphLimits/`.

## Conventions (pinned up front)

Decided now so contributors don't oscillate between incompatible designs. The rationale for the two
load-bearing choices — coupling-primary `cutDist` (#2) and the strict carrier (#1) — is spelled out
in *Why these two choices* below.

1. **Carrier — strict measurable function, quotient on top.** A graphon is an honest
   `W : Ω → Ω → ℝ` on a probability space `(Ω, μ)`, symmetric / measurable / `[0,1]`-valued
   *everywhere*, built on a symmetric kernel that is a pointwise `ℝ`-module (so a difference
   `U − W` is a literal kernel — what the cut norm acts on). Raw graphons are **strict
   representatives**; a.e. equality is *not* raw equality — Layer 3 proves the observables are
   a.e.-invariant. The public quotient is by `δ□ = 0` in `GraphonSpace`, which in particular
   identifies a.e.-equal representatives. The explicit `AEEqFun` view is a named deliverable (Layer 3),
   built where the a.e. picture is first required — the conditional-expectation arguments of the
   compactness layer (Layer 4), not Layers 1–2. Rule: **construction may be representative-based;
   every user-facing theorem must be quotient-stable.**
2. **Cut distance — coupling-primary.** `cutDist` is the infimum, over couplings of the two
   carriers, of the cut norm of the overlaid difference; the triangle inequality holds on
   **arbitrary probability carriers** (Janson, Lemma 6.5). Agreement with the classical
   measure-preserving-map infimum is a **named milestone** (Layer 5), proved over standard Borel
   carriers — atoms allowed — not a definitional commitment.
3. **Finite graphs — simple, `Sym2` edges.** `SimpleGraph V` with `[Fintype V]`; edges via
   `SimpleGraph.edgeFinset` / `Sym2`; density normalized `t(F, W_G) = hom(F,G)/|V(G)|^{|V(F)|}`.
   The **injective** density `t₀(F, G)` divides the *ordered injective* hom count by the **falling
   factorial `(n)_k = n.descFactorial |V(F)|`** (Mathlib `Nat.descFactorial`), **not** `Nat.choose n k`
   — the wrong denominator biases the sampling estimator by `k!` (`E[t₀] = k!·t` instead of `t`).
   Weighted graphs enter only as the technically convenient dense subset for the
   characterization layer, never as the primary object.
4. **Carrier generality.** Core definitions, the `cutDist` pseudometric and its quotient, and the
   separation theorem over an arbitrary probability space (Janson, Lemma 6.5 and Thm 8.10);
   conditioning and sampling over `StandardBorelSpace`; compactness over atomless standard
   Borel (`≅ (I, volume)` via the mod-null transport), with explicit transport. Flagship results get
   a general statement and an `I = [0,1]` corollary.
5. **Vocabulary.** Neutral namespace `DenseGraphLimits.{Kernel, Graphon, HomDensity, CutNorm,
   CutMetric, GraphonSpace, StepGraphon, Sampling}`; reuse Mathlib names wherever they exist. **Do
   not name a predicate for a one-line bound or measurability condition** — write it inline
   (`∀ x y, |K x y| ≤ C`, `Measurable (Function.uncurry W)`, `∀ x y, W x y ∈ Set.Icc 0 1`); reserve
   *named objects* for concepts with a real API, and pick the right kind: `Graphon` / `SymmKernel`
   are **structures**, `IsCoupling` is a **named `Prop`** (deliberately not a structure or typeclass —
   a coupling of given marginals is not canonical), `GraphonSpace` is a **quotient type**, and the
   measurable `Finpartition` adapter is a thin wrapper.

**Why these two choices** (the two that most shape the API; the others are local):

- *Coupling-primary `cutDist` (#2).* Cut distance has two equivalent forms — the **coupling** form
  (infimum, over couplings of the two carriers, of the cut norm of the overlaid difference) and the
  classical **measure-preserving-map** form (infimum, over m.p. maps into a common carrier, of the
  pulled-back difference). We pin the coupling form as primary because it is **cross-carrier by
  construction, with symmetry a direct swap-coupling theorem** (`cutDist_comm`, via the coupling
  swap): it is well-defined for graphons on *arbitrary* probability spaces, needs no common carrier
  and no standard-Borel/atomless hypothesis even to be *stated*, and its triangle inequality holds
  on arbitrary carriers (Janson, Lemma 6.5 — step-function approximation reduces the coupling
  gluing to the finite case, so no disintegration is needed). The map form is not more general — it
  **equals** the coupling form over standard Borel carriers, atoms allowed (Layer 5,
  `cutDist_eq_cutDistPullback`) — so making it primary would only bake a common carrier and Borel
  hypotheses into the basic object,
  crippling the cross-carrier API that the compactness, separation, and convergence layers rest on.
- *Strict carrier (#1).* We carry a graphon as an honest everywhere-defined `W : Ω → Ω → ℝ` and take
  the a.e./weak-isomorphism identification **once**, at `GraphonSpace`, rather than as an `AEEqFun`
  class from the start. The strict kernel is a **pointwise `ℝ`-module**, so `U − W` and `c • W` are
  *literal* kernels — exactly the objects the cut norm acts on and the counting-lemma differences
  need — whereas an `AEEqFun` carrier turns each into an a.e. class and forces a.e. bookkeeping
  through Layers 1–2. Construction and finite/small-graph computation stay representative-based and
  concrete; the `AEEqFun` view is delivered only where it is first needed — the conditional-expectation
  / martingale arguments of compactness — as the named Layer-3 bridge. So the a.e. picture enters in
  exactly one place instead of pervading the whole development.

**Status bar.** Everything here must land in `TauCeti/` `sorry`-free and with no axioms beyond
`propext`, `Classical.choice`, `Quot.sound` (`TauCeti/AGENTS.md`). The roadmap states the goals
with `sorry`; the code repo discharges them.

## What Mathlib already has (consume)

Reuse these by name; do not rebuild them. (**Entry points checked** against the pinned toolchain;
some prose paths below are abbreviated.)

- **Finite graphs and their extremal theory:** `SimpleGraph`, `SimpleGraph.edgeFinset`
  (`Combinatorics/SimpleGraph/Finite`), `SimpleGraph.Hom` (`…/Maps`), `Sym2`; **triangle** counting
  and removal `SimpleGraph.triangle_counting` / `SimpleGraph.triangle_removal` (+ `triangleRemovalBound`)
  (`…/Triangle/*`); **Turán** `SimpleGraph.turanGraph` / `IsTuranMaximal` / `turanDensity`
  (`…/Extremal/*`).
- **Partition-refinement infrastructure (reusable):** `Finpartition.equitabilise`
  (`…/Regularity/Equitabilise`) and the `Finpartition` API. Mathlib's `Finpartition.energy`
  (`…/Regularity/Energy`) and the finite energy-**increment** machinery (`…/Regularity/Increment`)
  are the **finite edge-density energy** — a **proof template / alignment point, not the graphon
  energy input**. The analytic kernel energy `‖E[W|P⊗P]‖²` is *built here* (`graphonPartitionEnergy`),
  not consumed.
- **Szemerédi regularity — related ecosystem, *not* a Frieze–Kannan input:**
  `szemeredi_regularity` with `SimpleGraph.IsUniform` (`…/Regularity/*`) is Mathlib's
  *strong* (tower-bound) regularity lemma — a comparison point for the analytic weak-regularity
  target, which is a **distinct theorem built separately** (Layer 2). Do not route it into the
  Frieze–Kannan target. The finite regularity *tower* above it — strong graph regularity and
  arity-3 hypergraph-complex regularity — is likewise out of scope here: it is the subject of the
  companion **graph-regularity roadmap** (developed in parallel, in review), which *consumes* this
  roadmap's `cutNorm`, `stepGraphon`, and `weak_regularity_frieze_kannan` through finite adapters
  and never redefines them — so those names and shapes are load-bearing beyond this roadmap.
- **Measurable / random graphs:** `MeasurableSpace (SimpleGraph V)` + `SimpleGraph.measurable_iff_adj`
  (`MeasureTheory/Constructions/SimpleGraph`); the binomial random graph `SimpleGraph.binomialRandom`
  / `G(V, p)` with `p : I` (`Probability/Combinatorics/BinomialRandomGraph/Defs`).
- **Measure / probability:** `MeasureTheory.Measure`, `IsProbabilityMeasure`, `Measure.prod`,
  `Measure.pi` (`Measure.pi_eq`, `Measure.pi_pi`) and the cylinder/π-system facts `generateFrom_pi`,
  `generateFrom_squareCylinders`; `MeasureTheory.AEEqFun` (with `AEEqFun.compMeasurePreserving`),
  `Lp` (`Lp.compMeasurePreserving`); `MeasureTheory.condExp` and martingale convergence;
  `MeasureTheory.MeasurePreserving`; `StandardBorelSpace`, `PolishSpace`
  (`PolishSpace.Equiv.measurableEquiv`), `NoAtoms` (`MeasureTheory/Measure/Typeclasses/NoAtoms`),
  `MeasureTheory/Constructions/UnitInterval` (`I` has `IsProbabilityMeasure` + `NoAtoms`).
- **Weak convergence of measures:** `MeasureTheory.ProbabilityMeasure` / `FiniteMeasure`,
  `LevyProkhorovMetric` (`levyProkhorovDist`), `Prokhorov` (tightness ↔ relative compactness),
  `Portmanteau`, `IsTightMeasureSet` — for the sampling and array laws (Layer 9).
- **Kernels / disintegration** (coupling and gluing *ingredients*, not the gluing lemma itself):
  `Kernel.compProd` (`⊗ₖ`), `Measure.compProd` (`⊗ₘ`), and `condKernel`
  (`Probability/Kernel/Composition/*`, `…/Disintegration/StandardBorel`).
- **Partitions:** `Finpartition` and `Equipartition`; the measurable-partition pattern
  `Finpartition (Subtype MeasurableSet)` used by `MeasureTheory/Measure/PreVariation`. Use these for
  weak regularity — a thin measurable adapter only if the subtype pattern is too awkward — not a
  private `Partition`.
- **Topology of the target:** conditionally-complete-lattice / `iInf` API for the cut-norm and
  cut-distance infima; `Metric` / `PseudoMetric` / `UniformSpace` for `GraphonSpace`.

### Reusable infrastructure to build here

Absent from Mathlib and built as prerequisites (each a strong upstream candidate once its API is
stable):

- the **measure-preserving map from `(I, volume)`** onto any standard Borel probability space —
  atoms allowed (Janson, Thm A.9; input to Layer 5) — and the **measure-preserving mod-null
  equivalence** with `(I, volume)` in the atomless case — Mathlib has the measurable equivalence
  (`PolishSpace.measurableEquivOfNotCountable`), not
  these measure-preserving refinements (inputs to Layers 4–5);
- reusable **conditional-expectation / dyadic-martingale `L¹`-convergence** lemmas (Layer 4);
- a thin **measurable `Finpartition` adapter**, only if the subtype pattern is too awkward (Layer 2);
- **`AEEqFun`** ergonomics exercised by the Layer-3 view.

## What is missing (build here)

Everything graphon-specific: the `Graphon` object and its symmetric-kernel algebra,
`homDensity`, `cutNorm` (seminorm + set form), the coupling `cutDist` and its gluing triangle,
`GraphonSpace`, the counting lemma (both directions), step approximation / weak regularity,
total boundedness / completeness / compactness, inverse counting / separation, and the
convergence equivalence. None of it is upstream.

---

## The build, in layers

As each layer makes the next layer's *types* expressible, state its milestones (with `sorry`,
in `Suggested.lean` or embedded here). Each layer is required work; later layers may be built
later, but none is skippable.

### Layer 0 — finite-graph and measure scaffolding
The elementary lemmas the later layers stand on: `Sym2`-indexed finite products for edge
densities, curry/uncurry lemmas for product and `Measure.pi`, and the standard-Borel plumbing.
Reconcile every name with Mathlib and drop any wrapper that merely duplicates an existing
predicate.

### Layer 1 — core objects and their basic API
The symmetric-kernel `ℝ`-module and the `Graphon` on top of it; `homDensity` with its full basic
theory (`t(F, W) ∈ [0,1]`, the constant-graphon value `p^{e(F)}`, the explicit small-graph
integrals, multiplicativity over disjoint unions, finite-graph compatibility
`t(F, W_G) = hom(F,G)/|V(G)|^{|V(F)|}`); `cutNorm` with its seminorm laws, the `L¹` bound, and
the equivalent set form `sup_{S,T} |∫_{S×T} W|`; the **coupling-primary, cross-carrier**
`cutDist (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)` (with `IsCoupling` and `overlayDiff`) and its
**triangle inequality on arbitrary probability carriers** (Janson, Lemma 6.5; so `cutDist` is a
pseudometric with no carrier hypotheses); and the fixed-carrier quotient `GraphonSpace Ω μ` (a
genuine metric quotient over any probability carrier, for the same reason). The canonical public
compact space is `GraphonSpaceI`, the
unit-interval version; cross-carrier equality is `cutDist U W = 0`, not a quotient bundling all
carriers.

*Acceptance:* the constant graphon; a one-edge graph; triangle density; a finite graph as a step
graphon.

### Layer 2 — counting, regularity, total boundedness
The **forward counting lemma** `|t(F,U) − t(F,W)| ≤ e(F) · ‖U − W‖□` (in `Suggested.lean` the prefactor
is `(F.edgeFinset.card : ℝ)`) and its **coupling / cut-distance form** `counting_lemma_coupling` (the
cross-carrier engine); the descent of `t(F, ·)` to `GraphonSpace` (`homDensityOnSpace`); the
**Frieze–Kannan weak regularity lemma** (`weak_regularity_frieze_kannan`, complexity `4^{⌈1/ε²⌉}`),
over a measurable `Finpartition` (the `Finpartition (Subtype MeasurableSet)` pattern, a thin adapter
only if needed). **`equitabilise` / `Finpartition` are reusable infrastructure**, but Mathlib's
`Finpartition.energy` is the *finite* edge-density energy — a **proof template / alignment point, not
a consumed theorem**. **Layer 2's public API is block-average based** — `stepGraphonAvg` and finite rectangle averages. So
**build the `graphonPartitionEnergy`** as the `l2sq` norm² of the block-average step graphon
`stepGraphonAvg` (`graphonPartitionEnergy_eq`), with the **L²-Pythagoras increment**
`E_Q = E_P + ‖E[W|Q⊗Q] − E[W|P⊗P]‖₂²` (`graphonPartitionEnergy_increment`) stated in this
block-average language and the `[0,1]` bounds (`_mono`/`_nonneg` fall out of the increment) — the
bounded monotone potential the FK iteration runs on. **Layer 3** later relates this to the general
AE / conditional-expectation interface. Mathlib's Szemerédi
regularity (`szemeredi_regularity`) is the *strong* (tower-bound) lemma —
a related comparison point, **not** an input to and **not** the source of weak regularity. The
weak-regularity output is a step graphon — specifically the block-averaged `stepGraphonAvg`
(`= E[W|P⊗P]`, whose energy the increment tracks); `stepGraphon` is the general
constant-on-rectangles object. On zero-measure rectangles `stepGraphonAvg` uses Mathlib's
**set-average / measure-average** convention (`⨍ z in S, … ∂μ`), so it stays a strict `[0,1]`-valued
representative; observable statements are independent of this null-set convention (Layer 3). Then
density of step graphons in `δ□` and total boundedness of `(GraphonSpace, δ□)`.

*Acceptance:* the counting lemma specialized to `K₂`, `K₃`; weak regularity producing a step graphon
(the block-averaged `stepGraphonAvg`; see also `stepGraphon` / `stepGraphon_apply` in `Suggested.lean`);
`t(F, ·)` descending to `GraphonSpace`.

### Layer 3 — the AE / `AEEqFun` view
A round-trip between the strict carrier and Mathlib's `AEEqFun`: a map `toAEEqFun :
Graphon Ω μ → ((Ω × Ω) →ₘ[μ ⊗ μ] ℝ)` (consuming `AEEqFun.compMeasurePreserving` /
`Lp.compMeasurePreserving`) and a measurable-representative section back, with the named invariance
theorems `homDensity_congr_ae`, `cutNorm_congr_ae`, and `cutDist_eq_zero_of_aeEq` proving the
observables factor through the a.e. class. This is where the a.e. picture enters — explicitly, in one
place — so the conditional-expectation and martingale arguments of Layer 4 run in the AE world and
transport back to the strict object. Built here as the prerequisite for Layer 4; Layers 1–2 use only
the strict carrier.

### Layer 4 — completeness and compactness
Completeness and compactness of `GraphonSpace` over atomless standard Borel — the
**Lovász–Szegedy compactness theorem**. The two analytic inputs are a measure-preserving
**realignment** of cut-distance-Cauchy sequences (Birkhoff–von Neumann / Rokhlin) and a dyadic
**conditional-expectation + martingale `L¹`-Cauchy** approximation; Mathlib's `condExp` and
martingale convergence are the engine. Pinned: `instance : CompactSpace GraphonSpaceI` and
`CompleteSpace GraphonSpaceI` (the latter by `inferInstance` from compactness of the metric space).

### Layer 5 — coupling and map cut distance agree
`cutDist` (coupling form) `=` the classical measure-preserving-map infimum, over standard Borel
carriers — **atoms allowed**: every standard Borel probability space receives a measure-preserving
map from `(I, volume)` (Janson, Thm A.9), so any coupling — itself standard Borel — is realized by
a pair of such maps. The proof rests on that map (`exists_measurePreserving_from_unitInterval`,
build it here); the stronger **atomless mod-null equivalence** (`exists_mpModNull_equiv_unitInterval`)
is also built here, as the transport the compactness realignment (Layer 4) runs on. Independent of
the spine, so it runs in parallel; it
does not block the other layers. Pinned: the map form `cutDistPullback` (the infimum over
measure-preserving maps from `(I, volume)` to both carriers) and the equivalence
`cutDist_eq_cutDistPullback`.

### Layer 6 — separation and convergence equivalence (the analytic summit)
**Layer 6a — separation / inverse counting.** `δ□(U, W) = 0 ⟺ ∀ F, t(F,U) = t(F,W)`; hence the moment
map `W ↦ (t(F,W))_F` is injective on `GraphonSpace`. **Both directions are cross-carrier and need no
standard-Borel / atomless hypothesis.** The **forward** direction
(`forall_homDensity_eq_of_cutDist_eq_zero`, matching
the coupling-primary public equality `cutDist U W = 0`) is the easy counting direction via
`counting_lemma_coupling`, with the same-carrier statement a corollary
(`forall_homDensity_eq_of_cutDistSame_eq_zero`). The **converse** — the **inverse counting lemma**
(LNGL Thm 11.3 on `[0,1]`; Janson, Thm 8.10, for arbitrary carriers, after the Borgs–Chayes–Lovász
uniqueness theorem), the genuinely hard self-contained analytic/algebraic core — is pinned
**cross-carrier and carrier-free** (`cutDist_eq_zero_of_forall_homDensity_eq_cross`; the proof route
reduces to `(I, volume)` representatives via the representation-on-`[0,1]` target
`exists_graphon_unitInterval_cutDist_eq_zero` — Janson, Thm 7.1, every graphon is at cut distance
zero from one on `(I, volume)` — but the statement carries no hypotheses), with the
same-carrier form its specialization (`cutDist_eq_zero_of_forall_homDensity_eq`). The assembled —
likewise hypothesis-free — cross-carrier separation iff is
`cutDist_eq_zero_iff_forall_homDensity_eq_cross`; the quotient-level form is
`graphonSpace_ext_homDensity` (`U = W ↔ ∀ F, …` on `GraphonSpaceI`).

**Layer 6b — convergence equivalence.** On the canonical fixed carrier `GraphonSpaceI`, a sequence
converges in `δ□` iff all `t(F, ·)` converge — `δ□(Wₙ, W) → 0 ⟺ ∀ F, t(F,Wₙ) → t(F,W)` — using
counting (Layer 2) + compactness (Layer 4) + separation (6a). **Pinned** as
`tendsto_graphonSpace_iff_forall_homDensity` (with `continuous_homDensityOnSpace` for the forward
direction); the proof remains Layer-4-gated.

### Layer 7 — applications and validation
Named extremal consequences as acceptance tests (**Goodman**, **Mantel**, **Sidorenko-`C₄`**),
the W-random sampling-expectation lemma `E[t(F, G(n,W))] → t(F,W)`, and concrete rational density
checks. These keep the definitions honest and give visible checkpoints before the deeper layers
close.

### Layer 8a — quantum graphs and reflection positivity
The gluing algebra behind the representability theorem, **built here** (connection matrices are not
in Mathlib). A `k`-**labeled graph** `LabeledGraph k` is a finite simple graph with an ordered
`k`-tuple of *distinct* labeled vertices (labels injective); `LabeledGraph.glue` glues two of them by
identifying corresponding labels, and the result is **again a `k`-labeled graph** — the identified
vertices keep their labels — so gluing iterates and the gluing algebra (associativity/commutativity
up to `≃g`, Lovász–Szegedy's product `F₁F₂`) is expressible; `forgetLabels` returns the underlying
unlabeled graph. For a graph parameter `f : GraphParam` — a real parameter of finite
simple graphs, with isomorphism invariance imposed separately as `IsIsoInvariant` (agreement along
`≃g`) — and a finite family `A : ι → LabeledGraph k`, `connectionMatrix f A` is the `ι × ι` matrix
with entry `f` on the unlabeled gluing `((A i).glue (A j)).forgetLabels`, a finite principal block of
the full connection matrix `M(f, k)`. `f` is
**reflection-positive** (`IsReflectionPositive`) when every such finite connection matrix is positive
semidefinite — stated over `Fin n`-indexed families (the roadmap's `Fin`-representative convention;
any finite `ι` reindexes with PSD preserved), not as one infinite matrix. Together with
`IsMultiplicative` (over disjoint unions, `⊕g` reindexed to `Fin (n₁ + n₂)` along `finSumFinEquiv`)
and `IsNormalized` (`f(K₁) = 1` on `⊥ : SimpleGraph (Fin 1)`), these are the structural hypotheses of
the characterization — each **defined outright** (a `Prop` with a real body, never `Prop := sorry`,
which would assert nothing).

### Layer 8b — Lovász–Szegedy representability
`lovasz_szegedy_representability`: a graph parameter equals `t(·, W)` for a graphon `W` on the
canonical carrier `(I, volume)` **iff** it is isomorphism-invariant, multiplicative, normalized, and
reflection-positive — the moment problem for graphs (Lovász–Szegedy, *Limits of dense graph
sequences*, Thm 2.2; there iso-invariance is baked into the notion of graph parameter, made explicit
here because `GraphParam` is representation-sensitive). Explicit `[0,1]`-boundedness is **not** a
hypothesis — it follows from the representation (`t(F, W) ∈ [0,1]`), pinned as the derived corollary
`graphParam_mem_Icc_of_representability_axioms`. Stating the
existential over `(I, volume)` — every graphon is representable there — keeps the statement on the
roadmap's canonical `GraphonSpaceI` carrier rather than an abstract existential space.

**The proof spine, pinned** — saying the gluing algebra's laws are "expressible" does not make
their theory a target, so the route from the Layer-8a predicates to the summit is itself a chain of
named targets, with no jump: reflection positivity → `graphParamMobius_nonneg` (`f† ≥ 0`: the
fully-labelled connection matrices are PSD, and the Möbius transform is a congruence by an
invertible `0/1` matrix, so the transformed diagonal is nonnegative) and
`graphParamMobius_sum_eq_one` (`∑ f† = 1`: the double sum telescopes to `f` of the edgeless graph
`= f(K₁)^n = 1`) → the random graph law `paramExchangeableLaw` (`L_f`, an `ExchangeableGraphLaw`
with level-`n` masses `f†` — a random object with **no representing graphon in sight yet**) →
`paramExchangeableLaw_upperMass` (`upperMass L_f F = f F`, Möbius inversion) →
`isDissociated_paramExchangeableLaw` (multiplicativity makes disjoint label windows independent) →
Layer 9's extremality `exists_graphon_of_isDissociated` gives `L_f = sampleExchangeableLaw W` →
the sampling anchor `upperMass_sampleExchangeableLaw` closes `f F = t(F, W)`. **What Layer 8b
consumes from Layer 9 is the graph-law representation/extremality infrastructure only — not the
graphon-sampling concentration theorems**: at the point the spine runs no representing graphon
exists, so the classical random-graphs-plus-convergent-subsequence route would additionally need
an `f†`-specific variance or simultaneous-selection lemma; the extremality route needs none.
Sequenced after Layer 9's graph-law layer accordingly — see *Ordering*.

### Layer 9 — sampling and the graph-law representation
The `W`-random graph law `sampleGraph W n` (a probability measure on `SimpleGraph (Fin n)`, on the
measurable-graph σ-algebra `MeasurableSpace (SimpleGraph V)`), with the **compatibility target**
`sampleGraph (Graphon.const p) n = G(Fin n, p)` recovering Mathlib's `binomialRandom`. The sampling
estimators: the finite-graph hom density `homDensityFin` and the **injective hom density**
`injHomDensity` (`t₀`, ordered injective count over the falling factorial `(n)_k` — see Conventions),
with the hom-vs-injective **closeness bound** `|t(F,·) − t₀(F,·)| ≤ C(k,2)/n` and the **unbiasedness
anchor** `E_{G(n,W)}[t₀(F,·)] = t(F,W)` that pins the `(n)_k` normalization. Both finite estimators
have a natural consumer: the companion graph-regularity roadmap may align its plain-graph densities
with `homDensityFin` / `injHomDensity` — optional interoperability on its side, not a dependency in
either direction.

**The joint sampling architecture.** `sampleGraph W n` is a *marginal* law for each `n`; an
almost-sure convergence claim across `n` is unstateable for the marginal family alone. The pinned
joint object is `infiniteSampleLaw W` — the law of the infinite `W`-random graph on **one**
probability space (i.i.d. `μ`-positions, one uniform per unordered pair) — with the finite-marginal
identification `infiniteSampleLaw_map_restrictFin`: `G(n, W)` for every `n` is the level-`n`
restriction (`restrictFin`) of this single object. (Mathlib's `MeasurableSpace (SimpleGraph V)`,
comapped from `Adj`, covers `V = ℕ`, so no new σ-algebra is needed.) The two convergence modes are
then **deliberately distinct**, with distinct proof routes, and neither consumes the other:

* **in probability** — `sampleGraph_cutDist_tendsto_inProbability`, the second sampling lemma
  `δ□(G(n,W), W) → 0` (LNGL Lemma 10.16), a statement about the marginals alone, via the two-stage
  first-sampling-lemma decomposition: point sampling (the analytic Azuma step on the weighted
  sampled graphon) plus Bernoulli edge rounding (a finite union bound over cuts);
* **almost surely** — `infiniteSampleLaw_ae_tendsto_cutDist`, on the joint space, via
  per-coordinate concentration (`sampleGraph_injHomDensity_concentration`, the McDiarmid/Azuma
  bound of LNGL Prop 11.32 shape, with tails summable in `n`), Borel–Cantelli per fixed `F`, a
  countable intersection over `Σ n, SimpleGraph (Fin n)`, and the Layer-6b convergence equivalence
  upgrading pointwise hom-density convergence to cut-distance convergence. The almost-sure proof
  does **not** run through the two-stage cut-distance lemma.

(The `LevyProkhorovMetric` / `Portmanteau` / `IsTightMeasureSet` weak-convergence stack, previously
cited for these targets, does not by itself supply this specification and is no longer load-bearing
here.)

**The graph-law representation (Diaconis–Janson).** The layer's endpoint, pinned: an
`ExchangeableGraphLaw` is a family of probability laws on `SimpleGraph (Fin k)` consistent under
restriction along **every** label injection (which subsumes relabeling invariance);
`sampleExchangeableLaw W` packages the sampling laws (consistency `sampleGraph_map_comap`); the
observable is `upperMass` — `P(F ≤ ·)` — with the sampling anchor
`upperMass_sampleExchangeableLaw : P(F ≤ G(k,W)) = t(F,W)`. A law is **dissociated**
(`IsDissociated`) when disjoint label windows are independent; sampling laws are dissociated
(`isDissociated_sampleExchangeableLaw`), and the **extremality** target
`exists_graphon_of_isDissociated` says they are the only ones — the extreme points of the
exchangeable simplex, and the Layer-8b spine's key input. The infinite form
(`InfiniteExchangeableGraphLaw`, permutation-invariant laws on `SimpleGraph ℕ`) is reached by the
compactness extension `exchangeableGraphLawEquivInfinite`, and the summit is
`graphonMixtureLawEquiv : ProbabilityMeasure GraphonSpaceI ≃ InfiniteExchangeableGraphLaw` (with
the Borel structure of the cut metric on `GraphonSpaceI`, the Dirac anchor
`graphonMixtureLawEquiv_dirac` sending `δ_{⟦W⟧}` to the infinite `W`-sampling law, **and the
general mixture-coordinate law `graphonMixtureLawEquiv_upperMass`**: for *every* mixing measure
`P`, `upperMass F = ∫ t(F,·) dP` on the quotient — upper masses determine each finite marginal by
Möbius inversion, so the correspondence is pinned beyond its Dirac fibers, not an arbitrary
`Equiv`): every
exchangeable law on infinite graphs is a graphon mixture, **uniquely — on the graphon quotient,
never among raw kernel representatives** (kernels at cut distance zero give the same mixture). The
explicit joint sampler is identified with the abstract extension by
`infiniteSampleLaw_eq_extension` (`infiniteSampleLaw W` **is** the compactness extension of
`sampleExchangeableLaw W`) — certifying the sampler's exchangeability and welding the sampling,
graph-law, and mixture subsections into one architecture.
This is the **Diaconis–Janson graphon-mixture representation**, a graph-level Aldous–Hoover
*consequence*; the roadmap deliberately does not call it "Aldous–Hoover".

**Cross-roadmap boundary (exchangeable arrays).** The array-level Aldous–Hoover representation is
the Exchangeability roadmap's Layer 8 — an **independent parallel theory**: nothing here consumes
it (the prior formalization proves the graph-level correspondence by compactness extension plus
the mixture representation, with no array-level input), and nothing there consumes this layer. The
two developments are joined by one **documented future interface** — proposed identifier
`graphLawArrayLawEquiv`, equating exchangeable graph laws with the laws of symmetric, irreflexive,
jointly exchangeable Boolean arrays — which becomes a Lean pin once the Exchangeability roadmap's
array API exists (per the roadmap guide, a condition whose API does not yet exist is described
here rather than `sorry`-pinned).

### Upstream to Mathlib
Several prerequisites are reusable beyond graphons and are upstream candidates, once the API has
stabilized here (premature upstreaming churns against Mathlib review). Deferred, not dropped;
initial inventory:
- the **measure-preserving map from `(I, volume)`** onto any standard Borel probability space, and
  the **measure-preserving mod-null equivalence** with `(I, volume)` in the atomless case (Layer 5);
- reusable **conditional-expectation / dyadic-martingale `L¹`-convergence** lemmas (Layer 4);
- **finite product / `Measure.pi` curry–uncurry** lemmas (Layer 0);
- **`AEEqFun`** ergonomics exercised by the Layer 3 view.
No upstreaming is scheduled before Layers 1–4 are complete in `TauCeti/`.

---

## Suggested signatures

The compiled `sorry`-signatures live in [`Suggested.lean`](./Suggested.lean) (imported by the root
`TauCetiRoadmap.lean`, so CI type-checks them). They pin the types — in particular that the cut
norm acts on *kernels* (so `U − W` is well-typed), that `cutDist` is coupling-primary and
cross-carrier, and that the constant-graphon and sampling targets share the `unitInterval` (`p : I`)
convention with `SimpleGraph.binomialRandom`. Compiled there: `SymmKernel` / `Graphon`, `cutNorm`
(+ the seminorm laws `cutNorm_nonneg` / `_zero` / `_neg` / `_add_le` / `_smul`),
`homDensity`, `Graphon.const` + `homDensity_const = (p : ℝ) ^ e(F)`, `IsCoupling` / `overlayDiff` /
`isCoupling_prod` / cross-carrier `cutDist` + `cutDist_triangle` (+ `cutDist_nonneg` / `_comm` /
`_self`, `cutDistSame_self`), `GraphonSpace` (a `Quotient` over an
arbitrary probability carrier — `cutDist_triangle` needs no more), the counting lemma, the Layer-2 step objects `stepGraphon` +
`stepGraphon_apply` and the averaging `stepGraphonAvg` + `stepGraphonAvg_apply`, the
AE-invariance trio, the `(I, volume)` transport targets (`exists_measurePreserving_from_unitInterval`
— atoms allowed — the atomless mod-null equivalence, and the representation-on-`[0,1]` reduction
`exists_graphon_unitInterval_cutDist_eq_zero`), **separation 6a: the cross-carrier forward
`forall_homDensity_eq_of_cutDist_eq_zero` (via `counting_lemma_coupling` +
`isProbabilityMeasure_of_isCoupling`), its same-carrier corollary
`forall_homDensity_eq_of_cutDistSame_eq_zero`, the carrier-free cross-carrier converse
`cutDist_eq_zero_of_forall_homDensity_eq_cross` with its same-carrier specialization
`cutDist_eq_zero_of_forall_homDensity_eq`, and the separation iff
`cutDist_eq_zero_iff_forall_homDensity_eq_cross`**
(all over `SimpleGraph (Fin n)`, all with no carrier hypotheses), `sampleGraph` + the `G(V,p)` compatibility, the **Layer-9 injective
density** `homDensityFin` / `injHomDensity` (the `(n)_k = descFactorial` denominator) with the
closeness bound and the `injHomDensity_integral_sampleGraph` unbiasedness anchor, the set-form /
signed cut norm (`cutNormSet` + `cutNorm_eq_cutNormSet`, `cutNormSigned` + the factor-4 sandwich), the
L⁰→strict representative `exists_graphon_repr`, the **analytic energy stack** (`l2sq` + `l2sq_nonneg`,
`graphonPartitionEnergy` + `graphonPartitionEnergy_eq`, the L²-Pythagoras
`graphonPartitionEnergy_increment`, and the `_mono` / `_nonneg` / `_le_one` corollaries),
`GraphonSpaceI`, the `MetricSpace (GraphonSpace Ω μ)` instance (+ `dist_graphonSpace_mk_mk` computing
it as `cutDist`), and the descent `homDensityOnSpace` (+ `homDensityOnSpace_mk`); and the **endpoint
milestones** — Frieze–Kannan `weak_regularity_frieze_kannan`, compactness/completeness
(`CompactSpace` / `CompleteSpace GraphonSpaceI`), the coupling↔map `cutDistPullback` +
`cutDist_eq_cutDistPullback`, the Layer-6b convergence equivalence
`tendsto_graphonSpace_iff_forall_homDensity` (+ `continuous_homDensityOnSpace`), finite-graph
compatibility `finiteGraphGraphon` + `homDensity_finiteGraphGraphon` (with `0 < m`), and the
quotient-level separation `graphonSpace_ext_homDensity`; and the **Layer-8 representability** targets
`LabeledGraph` (injective labels) + the label-retaining `LabeledGraph.glue` (so gluing iterates) +
`forgetLabels`, the graph parameter `GraphParam` with
`IsIsoInvariant`, the finite `connectionMatrix` (+ the entry law `connectionMatrix_apply`), its
`IsReflectionPositive` (finite principal blocks PSD) / `IsMultiplicative` / `IsNormalized` predicates, the four-condition iff
`lovasz_szegedy_representability` (over the canonical `(I, volume)` carrier), and its derived range
corollary `graphParam_mem_Icc_of_representability_axioms`; the **Layer-9 sampling/graph-law**
targets — `restrictFin`, `infiniteSampleLaw` (+ its probability instance, the finite-marginal
identification `infiniteSampleLaw_map_restrictFin`, and the extension identification
`infiniteSampleLaw_eq_extension`), the concentration bound
`sampleGraph_injHomDensity_concentration`, the two convergence modes
`sampleGraph_cutDist_tendsto_inProbability` / `infiniteSampleLaw_ae_tendsto_cutDist`,
`ExchangeableGraphLaw` / `sampleExchangeableLaw` (+ `sampleGraph_map_comap`), `upperMass`
(+ `upperMass_sampleExchangeableLaw`), `IsDissociated`
(+ `isDissociated_sampleExchangeableLaw` and the extremality `exists_graphon_of_isDissociated`),
`InfiniteExchangeableGraphLaw` + `exchangeableGraphLawEquivInfinite`, the Borel instances on
`GraphonSpaceI`, and the representation summit `graphonMixtureLawEquiv` (+ `_dirac` and the
mixture-coordinate law `_upperMass`); and the **Layer-8b spine** `graphParamMobius`
(+ `graphParamMobius_nonneg` / `graphParamMobius_sum_eq_one`), `paramExchangeableLaw`
(+ `paramExchangeableLaw_upperMass`, `isDissociated_paramExchangeableLaw`). Described in prose
rather than pinned (to
avoid a premature API choice): only the weak-regularity `Finpartition` **adapter** shape, the exact
mod-null transport bundle, and the exchangeable-graph-law ↔ Boolean-array interface
`graphLawArrayLawEquiv` (awaiting the Exchangeability roadmap's array API). An `IsCoupling` *structure/class* is **deliberately not** introduced — a
coupling of given marginals is not canonical, so typeclass resolution would pick an arbitrary one; the
`Prop` + `isProbabilityMeasure_of_isCoupling` is the right pattern.

## Worked examples (acceptance gates)

Non-negotiable, independent of implementation: the constant-graphon value `p^{e(F)}`;
finite-graph compatibility `t(F, W_G) = hom(F,G)/|V(G)|^{|V(F)|}`; the cut-norm set/test-function
equivalence; the counting lemma; weak regularity; `cutDist` a pseudometric; compactness;
separation; `E[t(F, G(n,W))] → t(F,W)`; and at least Goodman, Mantel, and Sidorenko-`C₄`.

**Computed-value backstops** (cheap numeric checks the implementation must reproduce, a correctness
floor the headline theorems don't give): `t(K₂, W_{K₄}) = 3/4` (edge density of `K₄`),
`t(K₃, W_{C₅}) = 0` (`C₅` is triangle-free), and the Erdős–Rényi numerics `t(F, W_p) = p^{e(F)}`
(e.g. `t(K₃, W_{1/2}) = 1/8`). Here `W_{G}` is `finiteGraphGraphon G` (a step graphon of the finite
graph `G`).

A milestone is **done** when the result descends to the intended quotient and passes its gates —
not when the file merely compiles.

## Ordering

Layers 0–2 and 7 first — they validate the pipeline and give visible checkpoints. The AE view
(Layer 3) lands next, as the prerequisite for the analytic layers. Then Layer 6a (separation) as the
highest-leverage self-contained summit, with Layer 4 (compactness) alongside it. Layer 5
(coupling↔map) runs in parallel, gated on the measure-preserving mod-null equivalence, and must not
block the others. The representability summit's real build order is
**Layer 8a → Layer 9's graph-law representation/extremality → Layer 8b**: the 8b spine consumes
`ExchangeableGraphLaw`, `upperMass`, `IsDissociated`, and `exists_graphon_of_isDissociated`, so
the graph-law layer of Layer 9 precedes 8b (Layer 9's sampling-convergence targets are independent
of 8b and can land in parallel; 8a is independent and can land any time after Layer 0). The
Mathlib upstreaming follows.

Layers 4–6 are independent and likely to attract duplicate work, so **register an Intention and
`claim` the specific target** before a substantial push (see *Coordinating work* in the repository
README).

## Provenance (secondary — reviewers judge the mathematics, not this map)

Two independent Lean formalizations of this theory exist; the roadmap draws on both, migrating
the already-formalized parts and treating the open parts as goals to be discharged in `TauCeti/`.

- [`math-commons/graphons`](https://github.com/math-commons/graphons) — `sorry`-free, with four
  audited classical axioms; broad packaged theory (`GraphonSpace`, the extremal consequences,
  sampling, the axiomatic characterization), coupling `cutDist`, strict carrier. The four axioms
  are the discharge tickets for the deeper layers:

  | Axiom | Layer |
  |---|---|
  | `cutNorm_alignment_unit`, `dyadic_l1Cauchy_approx_unit` | 4 (compactness) |
  | `cutDist_eq_zero_of_homDensity_eq` | 6 (separation) |
  | `lovasz_szegedy_representability` | 8 (representability) |

- [`cameronfreer/graphon`](https://github.com/cameronfreer/graphon) — **no custom axioms and now
  `sorry`-free** (CI-enforced; the three sorries previously listed here are closed:
  `exists_common_extension` (Rokhlin) is proved, and the algebraic-determination campaign —
  issue #70 — closed 2026-07-02 via the Cai–Govorov descent); blueprint and dependency graph;
  `AEEqFun` carrier, measure-preserving-map `cutDist`. Declaration-level claims in this roadmap are
  checked at commit
  [`6eccca5`](https://github.com/cameronfreer/graphon/tree/6eccca5bbe5c9df46d7129bf59575b8b9b1d6699)
  (the pinned migration source; later commits may move things). Supplies proof routes for Layers 3–6
  on the canonical carrier (compactness in `Compactness.lean`; the inverse counting lemma —
  qualitative and quantitative — in `InverseCounting.lean`), the connection-matrix
  algebra and determination substrate of Layer 8a (`Lovasz.lean`, `MatrixDetermination.lean`,
  `CaiGovorov.lean`), and — since 2026-07 — the Layer-9 sampling and graph-law stack: the first
  sampling lemma (proved 2026-07-08, `SamplingLemma.lean`, via the two-stage point-sampling +
  rounding decomposition of `SamplingConcentration.lean`), the explicit one-space infinite sampler
  with its finite-marginal identification (`InfiniteSampler.lean`), almost-sure sampling
  convergence (`AlmostSureSampling.lean`), exchangeable graph laws with the finite↔infinite
  equivalence (`ExchangeableGraphLaw.lean`, `InfiniteLaw.lean`, `InfiniteExchangeability.lean`),
  the graphon-mixture representation `infiniteMixtureLawEquiv`
  (`InfiniteRepresentation.lean`), and the dissociated-law extremality
  `isDissociated_iff_exists_sampleExchangeableLaw` (`MixtureExtremality.lean`).

Already-formalized on the canonical carrier and therefore migration-first: Layers 0–7 and 9 (the
library is parameterized over a fixed standard-Borel carrier, so what remains discharge work is
primarily this roadmap's **coupling-based cross-carrier generality** for Layers 1, 5, and 6 — the
Janson statements over arbitrary probability carriers). The
open discharge-target is Layer 8b (representability), whose spine consumes the Layer-9 graph-law
infrastructure — see *Ordering*.

An early community pointer in this direction: in the October 2021 Lean Zulip thread on the
Dillies–Mehta Szemerédi-regularity formalization (see References), Mauricio Collares flagged the
sequel — "one application of SzRL is to show that the 'space of graphons with the cut norm is
compact'", pointing to §5 of Lovász–Szegedy's *Szemerédi's Lemma for the Analyst*
([message](https://leanprover.zulipchat.com/#narrow/channel/113488-general/topic/Szemer.C3.A9di.20Regularity.20Lemma/near/258448218);
[public archive](https://leanprover-community.github.io/archive/stream/113488-general/topic/Szemer.C3.A9di.20Regularity.20Lemma.html#258448218)).
That regularity development is now Mathlib's `Combinatorics/SimpleGraph/Regularity` (with the
triangle counting/removal lemmas), consumed above rather than rebuilt; the compactness it flagged
is Layer 4's `CompactSpace GraphonSpaceI`.

## References

- L. Lovász, *Large Networks and Graph Limits* (2012), Part 3 (§7.1, §8.2, §9.2, Ch. 11, Ch. 13).
- L. Lovász, B. Szegedy, *Limits of dense graph sequences*, JCTB 96 (2006), 933–957
  ([arXiv:math/0408173](https://arxiv.org/abs/math/0408173)) — the graphon limit object and the
  representability characterization (Thm 2.2: normalized + multiplicative + reflection-positive,
  Layer 8b).
- C. Borgs, J. Chayes, L. Lovász, V. Sós, K. Vesztergombi, *Convergent sequences of dense graphs
  I–II*.
- L. Lovász, B. Szegedy, *Szemerédi's Lemma for the Analyst*, GAFA 17 (2007), 252–270 — weak
  regularity and the compactness of the graphon space (Layers 2 and 4).
- P. Diaconis, S. Janson, *Graph limits and exchangeable random graphs*, Rend. Mat. Appl. (7) 28
  (2008), 33–61 ([arXiv:0712.2749](https://arxiv.org/abs/0712.2749)) — the exchangeable graph law ↔
  graphon mixture correspondence and the dissociated/extreme-point characterization (Layer 9).
- S. Janson, *Graphons, cut norm and distance, couplings and rearrangements*, NYJM Monographs 4
  (2013) ([arXiv:1009.2376](https://arxiv.org/abs/1009.2376)) — the general-carrier statements:
  the coupling triangle inequality on arbitrary probability spaces (Lemma 6.5), the coupling↔map
  equivalence and its atomless caveats (Thm 6.9, Remark 6.10), the representation of every graphon
  on `[0,1]` (Lemma 7.3, Thm 7.1), the carrier-free separation
  (Thm 8.10), and the measure-preserving map from `[0,1]` onto any Borel probability space
  (Thm A.9).
- Y. Dillies, B. Mehta, *Formalising Szemerédi's Regularity Lemma in Lean*, ITP 2022
  ([doi:10.4230/LIPIcs.ITP.2022.9](https://doi.org/10.4230/LIPIcs.ITP.2022.9)) — the Mathlib
  regularity / triangle-removal development this roadmap consumes.

## Acknowledgements

The mathematics and proof routes draw on two prior Lean developments,
[`math-commons/graphons`](https://github.com/math-commons/graphons) and
[`cameronfreer/graphon`](https://github.com/cameronfreer/graphon); see Provenance.

## Reviewer checklist

- Does every named object have a basic API, not just a headline theorem?
- Are all non-Mathlib objects listed under "build here"?
- Do the cited Mathlib paths resolve on the pinned toolchain?
- Are one-line hypotheses written inline rather than wrapped in a predicate?
- Are strict-carrier, AE, and quotient-level statements kept distinct?
- Is `cutDist` coupling-primary and cross-carrier, with map/pullback only a compatibility milestone?
- Is the Layer-6a separation **carrier-free in both directions** — the forward via
  `counting_lemma_coupling`, the converse cross-carrier with no standard-Borel / atomless hypotheses
  (Janson, Thm 8.10) — over `SimpleGraph (Fin n)`
  representatives (no universe-restricted `{V : Type}`)?
- Are the same-carrier 6a statements **specializations** of the cross-carrier ones (never the other
  way around), and is the coupling↔map equivalence stated over standard Borel with **atoms allowed**
  (no `NoAtoms`)?
- Does Layer 2 **build** the analytic `graphonPartitionEnergy` rather than claim Mathlib's finite
  `Finpartition.energy` as the input (it's a proof template only)?
- Is Layer 2's public API **block-average based** (`stepGraphonAvg`), with the AE / conditional-expectation
  interface introduced only at Layer 3?
- Are the **endpoint milestones** pinned as targets — FK weak regularity, `CompactSpace`/`CompleteSpace
  GraphonSpaceI`, `cutDistPullback` ↔ `cutDist`, the Layer-6b convergence equivalence, finite-graph
  compatibility (with `0 < m`), and quotient-level separation?
- Is Layer 8 pinned as a real target here — injective-label `LabeledGraph`, the label-retaining
  `LabeledGraph.glue` (with `forgetLabels` for the unlabeled graph), the
  finite `connectionMatrix` / `IsReflectionPositive` (finite principal blocks PSD over `Fin n` families,
  not one infinite matrix), and `lovasz_szegedy_representability` (with `IsIsoInvariant` among its
  hypotheses, over the canonical `(I, volume)` carrier, and the `[0,1]` range a **derived corollary**,
  never a hypothesis) — rather than deferred to an external
  reflection-positivity development?
- Do the structural predicates (`IsIsoInvariant` / `IsMultiplicative` / `IsNormalized` /
  `IsReflectionPositive`) carry real bodies — never `def … : Prop := sorry`, which asserts nothing?
- Is `IsCoupling` a named `Prop` (not a structure/typeclass), matching the vocabulary and docstring?
- Is the injective density `t₀` normalized by the falling factorial `(n)_k`, **never** `Nat.choose n k`?
- Is Layer 9's sampling architecture **joint** — `infiniteSampleLaw` with the finite-marginal
  identification and the extension identification `infiniteSampleLaw_eq_extension` — with the two
  convergence modes kept distinct (in probability on the marginals, via the two-stage
  point-sampling + rounding decomposition; almost surely on the joint space, via per-coordinate
  concentration + Borel–Cantelli + the Layer-6b equivalence — never through the two-stage
  cut-distance lemma)?
- Is the graph-law representation pinned **beyond its Dirac fibers** — the mixture-coordinate law
  `graphonMixtureLawEquiv_upperMass` (`upperMass F = ∫ t(F,·) dP` for every mixing measure) — with
  uniqueness on the graphon quotient, the wording "Diaconis–Janson graphon-mixture representation /
  graph-level Aldous–Hoover consequence" (never bare "Aldous–Hoover"), and the array-level theory
  kept an independent parallel development joined only by the documented `graphLawArrayLawEquiv`
  interface?
- Does the Layer-8b spine run through named targets (`graphParamMobius` with positivity and total
  mass, `paramExchangeableLaw`, upper-mass inversion, dissociativity, Layer 9's extremality) and
  consume only Layer 9's graph-law representation/extremality infrastructure — never the
  graphon-sampling concentration theorems?
- Do the computed-value backstops hold (`t(K₂, W_{K₄}) = 3/4`, `t(K₃, W_{C₅}) = 0`, `t(F, W_p) = p^{e(F)}`)?
- Are the source repositories confined to Provenance?

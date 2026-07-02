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

Decided now so contributors don't oscillate between incompatible designs. Extended rationale for
the carrier and cut-distance choices is in two design notes in the
[`math-commons/graphons`](https://github.com/math-commons/graphons/tree/main/docs) repo.

1. **Carrier — strict measurable function, quotient on top.** A graphon is an honest
   `W : Ω → Ω → ℝ` on a probability space `(Ω, μ)`, symmetric / measurable / `[0,1]`-valued
   *everywhere*, built on a symmetric kernel that is a pointwise `ℝ`-module (so a difference
   `U − W` is a literal kernel — what the cut norm acts on). The a.e. / weak-isomorphism
   identification is taken **once**, at `GraphonSpace`. The explicit `AEEqFun` view is a named
   deliverable (Layer 3), built where the a.e. picture is first required — the
   conditional-expectation arguments of Layer 4. Rule: **construction may be
   representative-based; every user-facing theorem must be quotient-stable.**
2. **Cut distance — coupling-primary.** `cutDist` is the infimum, over couplings of the two
   carriers, of the cut norm of the overlaid difference; the triangle inequality is the gluing
   lemma. Agreement with the classical measure-preserving-map infimum is a **named milestone**
   (Layer 5), proved under atomless standard-Borel hypotheses, not a definitional commitment.
3. **Finite graphs — simple, `Sym2` edges.** `SimpleGraph V` with `[Fintype V]`; edges via
   `SimpleGraph.edgeFinset` / `Sym2`; density normalized `t(F, W_G) = hom(F,G)/|V(G)|^{|V(F)|}`.
   The **injective** density `t₀(F, G)` divides the *ordered injective* hom count by the **falling
   factorial `(n)_k = n.descFactorial |V(F)|`** (Mathlib `Nat.descFactorial`), **not** `Nat.choose n k`
   — the wrong denominator biases the sampling estimator by `k!` (`E[t₀] = k!·t` instead of `t`).
   Weighted graphs enter only as the technically convenient dense subset for the
   characterization layer, never as the primary object.
4. **Carrier generality.** Core definitions over an arbitrary probability space; conditioning
   and sampling over `StandardBorelSpace`; compactness and separation over atomless standard
   Borel (`≅ (I, volume)` via the mod-null transport), with explicit transport. Flagship results get
   a general statement and an `I = [0,1]` corollary.
5. **Vocabulary.** Neutral namespace `DenseGraphLimits.{Kernel, Graphon, HomDensity, CutNorm,
   CutMetric, GraphonSpace, StepGraphon, Sampling}`; reuse Mathlib names wherever they exist. **Do
   not name a predicate for a one-line bound or measurability condition** — write it inline
   (`∀ x y, |K x y| ≤ C`, `Measurable (Function.uncurry W)`, `∀ x y, W x y ∈ Set.Icc 0 1`); reserve
   structures for concepts with a real API (`Graphon`, `SymmKernel`, `IsCoupling`, `GraphonSpace`,
   the `Finpartition` adapter).

**Status bar.** Everything here must land in `TauCeti/` `sorry`-free and with no axioms beyond
`propext`, `Classical.choice`, `Quot.sound` (`TauCeti/AGENTS.md`). The roadmap states the goals
with `sorry`; the code repo discharges them.

## What Mathlib already has (consume)

Reuse these by name; do not rebuild them. (Paths checked against the pinned toolchain.)

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
  Frieze–Kannan target.
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

- the **measure-preserving mod-null equivalence** of an atomless standard Borel probability space
  with `(I, volume)` — Mathlib has the measurable equivalence (`PolishSpace.measurableEquivOfNotCountable`), not
  this measure-preserving refinement (input to Layer 5);
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
in `Targets.lean` or embedded here). Each layer is required work; later layers may be built
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
`cutDist (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)` (with `IsCoupling` and `overlay`) and its
**gluing-lemma triangle inequality** under standard-Borel hypotheses (so `cutDist` is a
pseudometric); and the fixed-carrier quotient `GraphonSpace Ω μ` over a standard Borel carrier (where
`cutDist = 0` is a genuine equivalence). The canonical public compact space is `GraphonSpaceI`, the
unit-interval version; cross-carrier equality is `cutDist U W = 0`, not a quotient bundling all
carriers.

*Acceptance:* the constant graphon; a one-edge graph; triangle density; a finite graph as a step
graphon.

### Layer 2 — counting, regularity, total boundedness
The **forward counting lemma** `|t(F,U) − t(F,W)| ≤ e(F) · ‖U − W‖□` (in `Targets.lean` the prefactor
is `(F.edgeFinset.card : ℝ)`) and its **coupling / cut-distance form** `counting_lemma_coupling` (the
cross-carrier engine); the descent of `t(F, ·)` to `GraphonSpace` (`homDensityOnSpace`); the
**Frieze–Kannan weak regularity lemma** with the standard complexity bound `4^{⌈1/ε²⌉}`, over a
measurable `Finpartition` (the `Finpartition (Subtype MeasurableSet)` pattern, a thin adapter only if
needed). **`equitabilise` / `Finpartition` are reusable infrastructure**, but Mathlib's
`Finpartition.energy` is the *finite* edge-density energy — a **proof template / alignment point, not
a consumed theorem**. So **build the analytic `graphonPartitionEnergy`** `‖E[W|P⊗P]‖²_{L²(μ⊗μ)}` (the
conditional-expectation kernel energy) with its refinement monotonicity and `[0,1]` bounds
(`_mono` / `_nonneg` / `_le_one` — the bounded monotone potential the iteration runs on); the
*quantitative* L²-Pythagoras increment `E_Q = E_P + ‖E[W|Q⊗Q] − E[W|P⊗P]‖₂²` is the deferred FK
driver. Mathlib's Szemerédi regularity (`szemeredi_regularity`) is the *strong* (tower-bound) lemma —
a related comparison point, **not** an input to and **not** the source of weak regularity. The
weak-regularity output is a `stepGraphon` (Layer-2 target). Then density of step graphons in `δ□` and
total boundedness of `(GraphonSpace, δ□)`.

*Acceptance:* the counting lemma specialized to `K₂`, `K₃`; weak regularity producing a `stepGraphon`
(see `stepGraphon` / `stepGraphon_apply` in `Targets.lean`); `t(F, ·)` descending to `GraphonSpace`.

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
martingale convergence are the engine.

### Layer 5 — coupling and map cut distance agree
`cutDist` (coupling form) `=` the classical measure-preserving-map infimum, under atomless
standard-Borel hypotheses. The proof rests on the **measure-preserving mod-null equivalence** with
`(I, volume)` identified above (build it here). Independent of the spine, so it runs in parallel; it
does not block the other layers.

### Layer 6 — separation and convergence equivalence (the analytic summit)
**Layer 6a — separation / inverse counting.** `δ□(U, W) = 0 ⟺ ∀ F, t(F,U) = t(F,W)`; hence the moment
map `W ↦ (t(F,W))_F` is injective on `GraphonSpace`. The **forward** direction is **cross-carrier and
needs no standard-Borel / atomless hypothesis** (`forall_homDensity_eq_of_cutDist_eq_zero`, matching
the coupling-primary public equality `cutDist U W = 0`): it is the easy counting direction via
`counting_lemma_coupling`, and the same-carrier statement is a corollary
(`forall_homDensity_eq_of_cutDistSame_eq_zero`). The **converse** — the **inverse counting lemma**
(LNGL Thm 11.3), the genuinely hard self-contained analytic/algebraic core — is pinned same-carrier
under atomless standard Borel (`[StandardBorelSpace][NoAtoms]`); its cross-carrier form follows by
transport (future).

**Layer 6b — convergence equivalence.** On the canonical fixed carrier `GraphonSpaceI`, a sequence
converges in `δ□` iff all `t(F, ·)` converge — `δ□(Wₙ, W) → 0 ⟺ ∀ F, t(F,Wₙ) → t(F,W)` — using
counting (Layer 2) + compactness (Layer 4) + separation (6a). Now that `GraphonSpaceI` and the
`MetricSpace (GraphonSpace Ω μ)` instance are pinned, this is *statable*; it is still left unpinned
this round (its proof is Layer-4-gated).

### Layer 7 — applications and validation
Named extremal consequences as acceptance tests (**Goodman**, **Mantel**, **Sidorenko-`C₄`**),
the W-random sampling-expectation lemma `E[t(F, G(n,W))] → t(F,W)`, and concrete rational density
checks. These keep the definitions honest and give visible checkpoints before the deeper layers
close.

### Layer 8 — Lovász–Szegedy representability
A graph parameter equals `t(·, W)` for some graphon iff it is multiplicative, normalized,
reflection-positive, and `[0,1]`-bounded (LNGL Thm 5.54 / the moment problem for graphs). Best
proved in coordination with a reflection-positivity development rather than re-derived here; it
is sequenced late because it depends on that material, and it is required work.

### Layer 9 — sampling and exchangeable arrays
The `W`-random graph law `sampleGraph W n` (a probability measure on `SimpleGraph (Fin n)`, on the
measurable-graph σ-algebra `MeasurableSpace (SimpleGraph V)`), with the **compatibility target**
`sampleGraph (Graphon.const p) n = G(Fin n, p)` recovering Mathlib's `binomialRandom`. The sampling
estimators: the finite-graph hom density `homDensityFin` and the **injective hom density**
`injHomDensity` (`t₀`, ordered injective count over the falling factorial `(n)_k` — see Conventions),
with the hom-vs-injective **closeness bound** `|t(F,·) − t₀(F,·)| ≤ C(k,2)/n` and the **unbiasedness
anchor** `E_{G(n,W)}[t₀(F,·)] = t(F,W)` that pins the `(n)_k` normalization. Then the
almost-sure first sampling lemma and the second sampling lemma `δ□(G(n,W), W) → 0` (LNGL Lemma 10.16),
via the weak-convergence stack (`LevyProkhorovMetric` / `Portmanteau` / `IsTightMeasureSet`); then the
exchangeable-arrays / Aldous–Hoover representation connecting graphons to infinite exchangeable random
graphs. The long-horizon endpoint.

### Upstream to Mathlib
Several prerequisites are reusable beyond graphons and are upstream candidates, once the API has
stabilized here (premature upstreaming churns against Mathlib review). Deferred, not dropped;
initial inventory:
- the **measure-preserving mod-null equivalence** of an atomless standard Borel space with
  `(I, volume)` (Layer 5);
- reusable **conditional-expectation / dyadic-martingale `L¹`-convergence** lemmas (Layer 4);
- **finite product / `Measure.pi` curry–uncurry** lemmas (Layer 0);
- **`AEEqFun`** ergonomics exercised by the Layer 3 view.
No upstreaming is scheduled before Layers 1–4 are complete in `TauCeti/`.

---

## Target signatures

The compiled `sorry`-signatures live in [`Targets.lean`](./Targets.lean) (imported by the root
`TauCetiRoadmap.lean`, so CI type-checks them). They pin the types — in particular that the cut
norm acts on *kernels* (so `U − W` is well-typed), that `cutDist` is coupling-primary and
cross-carrier, and that the constant-graphon and sampling targets share the `unitInterval` (`p : I`)
convention with `SimpleGraph.binomialRandom`. Compiled there: `SymmKernel` / `Graphon`, `cutNorm`,
`homDensity`, `Graphon.const` + `homDensity_const = (p : ℝ) ^ e(F)`, `IsCoupling` / `overlay` /
cross-carrier `cutDist` + `cutDist_triangle`, `GraphonSpace` (a `Quotient` over a standard Borel
carrier), the counting lemma, the Layer-2 step object `stepGraphon` + `stepGraphon_apply`, the
AE-invariance trio, the mod-null transport target, **separation 6a: the cross-carrier forward
`forall_homDensity_eq_of_cutDist_eq_zero` (via `counting_lemma_coupling` +
`isProbabilityMeasure_of_isCoupling`), its same-carrier corollary
`forall_homDensity_eq_of_cutDistSame_eq_zero`, and the hypothesized converse
`cutDist_eq_zero_of_forall_homDensity_eq`** (all over `SimpleGraph (Fin n)`),
`sampleGraph` + the `G(V,p)` compatibility, and the **Layer-9 injective density** `homDensityFin` /
`injHomDensity` (the `(n)_k = descFactorial` denominator) with the closeness bound and the
`injHomDensity_integral_sampleGraph` unbiasedness anchor, the set-form / signed cut norm
(`cutNormSet` + `cutNorm_eq_cutNormSet`, `cutNormSigned` + the factor-4 sandwich), and the L⁰→strict
representative `exists_graphon_repr`, the analytic `graphonPartitionEnergy` (`_mono` / `_nonneg` /
`_le_one`), `GraphonSpaceI`, the `MetricSpace (GraphonSpace Ω μ)` instance, and the descent
`homDensityOnSpace` (+ `homDensityOnSpace_mk`). Described in prose rather than pinned (to avoid a
premature API choice): the weak-regularity `Finpartition` adapter, the Layer-6b convergence
equivalence *proof* (its statement is now expressible via the pinned metric), the quantitative
L²-Pythagoras energy increment, and the `stepGraphonAvg` / `IsCoupling`-structure ergonomics.

## Worked examples (acceptance gates)

Non-negotiable, independent of implementation: the constant-graphon value `p^{e(F)}`;
finite-graph compatibility `t(F, W_G) = hom(F,G)/|V(G)|^{|V(F)|}`; the cut-norm set/test-function
equivalence; the counting lemma; weak regularity; `cutDist` a pseudometric; compactness;
separation; `E[t(F, G(n,W))] → t(F,W)`; and at least Goodman, Mantel, and Sidorenko-`C₄`.

**Computed-value backstops** (cheap numeric checks the implementation must reproduce, a correctness
floor the headline theorems don't give): `t(K₂, W_{K₄}) = 3/4` (edge density of `K₄`),
`t(K₃, W_{C₅}) = 0` (`C₅` is triangle-free), and the Erdős–Rényi numerics `t(F, W_p) = p^{e(F)}`
(e.g. `t(K₃, W_{1/2}) = 1/8`). Here `W_{G}` is the `stepGraphon` of the finite graph `G`.

A milestone is **done** when the result descends to the intended quotient and passes its gates —
not when the file merely compiles.

## Ordering

Layers 0–2 and 7 first — they validate the pipeline and give visible checkpoints. The AE view
(Layer 3) lands next, as the prerequisite for the analytic layers. Then Layer 6a (separation) as the
highest-leverage self-contained summit, with Layer 4 (compactness) alongside it. Layer 5
(coupling↔map) runs in parallel, gated on the measure-preserving mod-null equivalence, and must not
block the others. Representability (Layer 8), sampling / exchangeable arrays (Layer 9), and
the Mathlib upstreaming follow.

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

- [`cameronfreer/graphon`](https://github.com/cameronfreer/graphon) — no custom axioms, three
  `sorry`s (`exists_common_extension` (Rokhlin), algebraic determination, the determination
  theorem); blueprint and dependency graph; `AEEqFun` carrier, measure-preserving-map `cutDist`;
  active spectral / determination work (issue #70). Supplies the proof routes for Layers 3, 5, 6
  and the blueprint dependency spine. In particular `exists_common_extension` is the Layer-5
  measure-preserving input, and issue #70 is the Layer-6 inverse-counting route.

Already-formalized (modulo the above) and therefore migration-first: Layers 0–2 and 7. Open and
therefore discharge-targets: Layers 4, 5, 6, 8 (and 9).

## References

- L. Lovász, *Large Networks and Graph Limits* (2012), Part 3 (§7.1, §8.2, §9.2, Ch. 11, Ch. 13).
- C. Borgs, J. Chayes, L. Lovász, V. Sós, K. Vesztergombi, *Convergent sequences of dense graphs
  I–II*.

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
- Is the Layer-6a separation split into a forward and a hypothesized converse, over
  `SimpleGraph (Fin n)` representatives (no universe-restricted `{V : Type}`)?
- Is the 6a **forward cross-carrier** (`cutDist μ₁ μ₂ U W = 0`, via `counting_lemma_coupling`) with
  **no standard-Borel / atomless hypothesis** (those belong only on the converse), same-carrier a corollary?
- Does Layer 2 **build** the analytic `graphonPartitionEnergy` rather than claim Mathlib's finite
  `Finpartition.energy` as the input (it's a proof template only)?
- Is the injective density `t₀` normalized by the falling factorial `(n)_k`, **never** `Nat.choose n k`?
- Do the computed-value backstops hold (`t(K₂, W_{K₄}) = 3/4`, `t(K₃, W_{C₅}) = 0`, `t(F, W_p) = p^{e(F)}`)?
- Are the source repositories confined to Provenance?

# Roadmap: graphons and dense graph limits (Lovász)

Mathlib has `SimpleGraph`, `Sym2`, homomorphism counts, probability measures, `AEEqFun`,
product/pi measures, conditional expectation, and `StandardBorelSpace`, but **no theory of
dense graph limits**: no graphon, no homomorphism density `t(F, W)`, no cut norm or cut
distance, no weak regularity, no graphon space, no counting/inverse-counting lemmas. We build
that theory here, after Part 3 of Lovász, *Large Networks and Graph Limits* (LNGL), culminating
in the equivalence of cut-distance convergence with convergence of all homomorphism densities.

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
   Weighted graphs enter only as the technically convenient dense subset for the
   characterization layer, never as the primary object.
4. **Carrier generality.** Core definitions over an arbitrary probability space; conditioning
   and sampling over `StandardBorelSpace`; compactness and separation over atomless standard
   Borel (`≅ ([0,1], vol)`), with explicit transport. Flagship results get a general statement
   and a `[0,1]` corollary.
5. **Vocabulary.** Neutral namespace `DenseGraphLimits.{Kernel, Graphon, HomDensity, CutNorm,
   CutMetric, GraphonSpace, StepGraphon, Sampling}`; reuse Mathlib names wherever they exist.

**Status bar.** Everything here must land in `TauCeti/` `sorry`-free and with no axioms beyond
`propext`, `Classical.choice`, `Quot.sound` (`TauCeti/AGENTS.md`). The roadmap states the goals
with `sorry`; the code repo discharges them.

## What Mathlib already has (consume)

- **Finite graphs:** `Combinatorics/SimpleGraph/*` (`SimpleGraph`, `edgeFinset`, `Hom`), `Sym2`.
- **Measure / probability:** `MeasureTheory.Measure`, `IsProbabilityMeasure`, `Measure.prod`,
  `Measure.pi`, `MeasureTheory.AEEqFun`, `Lp`; `MeasureTheory.condExp` (conditional
  expectation) and martingale convergence; `MeasureTheory.MeasurePreserving`; `MeasurableSpace`,
  `StandardBorelSpace`, `PolishSpace`, `MeasureTheory.Measure.NoAtoms`.
- **Topology of the target:** conditionally-complete-lattice / `iInf` API for the cut-norm and
  cut-distance infima; `Metric` / `PseudoMetric` / `UniformSpace` for `GraphonSpace`.
- **The one missing piece of infrastructure (build as a prerequisite).** The
  **measure-preserving** isomorphism of an atomless standard Borel probability space with
  `([0,1], vol)`. Mathlib has the measurable equivalence (`PolishSpace.measurableEquiv`) but not
  the measure-preserving refinement; it is the input to Layer 5, so building it is part of this
  roadmap (Layer 5), and a strong upstream candidate.

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
the equivalent set form `sup_{S,T} |∫_{S×T} W|`; the coupling `cutDist` with the **gluing-lemma
triangle inequality** (so `cutDist` is a pseudometric); and the quotient `GraphonSpace`.

### Layer 2 — counting, regularity, total boundedness
The **forward counting lemma** `|t(F,U) − t(F,W)| ≤ e(F) · ‖U − W‖□` and its cut-distance form;
descent of `t(F, ·)` to `GraphonSpace`; the **Frieze–Kannan weak regularity lemma** with the
standard complexity bound `4^{⌈1/ε²⌉}`; density of step graphons in `δ□`; and total boundedness
of `(GraphonSpace, δ□)`.

### Layer 3 — the L⁰ / `AEEqFun` view
A round-trip between the strict carrier and Mathlib's `AEEqFun`: a map
`Graphon Ω μ → ((Ω × Ω) →ₘ[μ ⊗ μ] ℝ)` and a measurable-representative section back, with
`homDensity`, `cutNorm`, and `cutDist` proved to factor through the a.e. class. This is where the
a.e. picture enters — explicitly, in one place — so the conditional-expectation and martingale
arguments of Layer 4 run in `L⁰` and transport back to the strict object. Built here as the
prerequisite for Layer 4; Layers 1–2 use only the strict carrier.

### Layer 4 — completeness and compactness
Completeness and compactness of `GraphonSpace` over atomless standard Borel — the
**Lovász–Szegedy compactness theorem**. The two analytic inputs are a measure-preserving
**realignment** of cut-distance-Cauchy sequences (Birkhoff–von Neumann / Rokhlin) and a dyadic
**conditional-expectation + martingale `L¹`-Cauchy** approximation; Mathlib's `condExp` and
martingale convergence are the engine.

### Layer 5 — coupling and map cut distance agree
`cutDist` (coupling form) `=` the classical measure-preserving-map infimum, under atomless
standard-Borel hypotheses. The proof rests on the measure-preserving `[0,1]`-isomorphism
identified above (build it here). Independent of the spine, so it runs in parallel; it does not
block the other layers.

### Layer 6 — separation / inverse counting (the summit)
`δ□(U, W) = 0 ⟺ ∀ F, t(F,U) = t(F,W)`; hence the moment map `W ↦ (t(F,W))_F` is injective on
`GraphonSpace`; hence the **convergence equivalence** `δ□(Wₙ, W) → 0 ⟺ ∀ F, t(F,Wₙ) → t(F,W)`.
The forward direction is Layer 2; the converse is the **inverse counting lemma** (LNGL Thm 11.3),
the genuinely hard, self-contained analytic/algebraic core.

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
The almost-sure first sampling lemma and the second sampling lemma `δ□(G(n,W), W) → 0`
(LNGL Lemma 10.16), then the exchangeable-arrays / Aldous–Hoover representation connecting
graphons to infinite exchangeable random graphs. The long-horizon endpoint.

### Upstream to Mathlib
Several prerequisites are reusable beyond graphons and are upstream candidates, once the API has
stabilized here (premature upstreaming churns against Mathlib review). Deferred, not dropped;
initial inventory:
- the **measure-preserving** isomorphism of an atomless standard Borel space with `([0,1], vol)`
  (Layer 5);
- reusable **conditional-expectation / dyadic-martingale `L¹`-convergence** lemmas (Layer 4);
- **finite product / `Measure.pi` curry–uncurry** lemmas (Layer 0);
- **`AEEqFun`** ergonomics exercised by the Layer 3 view.
No upstreaming is scheduled before Layers 1–4 are complete in `TauCeti/`.

---

## Prototype target signatures

Indicative signatures; exact hypotheses settle during implementation. The point is to pin the
types — in particular that the cut norm acts on *kernels*, so a difference `U − W` is well-typed.

```lean
import Mathlib

open MeasureTheory

namespace TauCetiRoadmap.DenseGraphLimits

variable {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]

/-- Layer 1. A symmetric, measurable, bounded `ℝ`-kernel: the additive group / `ℝ`-module that
carries differences, so the cut norm has something to act on. -/
structure SymmKernel (Ω : Type*) [MeasurableSpace Ω] (μ : Measure Ω) where
  toFun : Ω → Ω → ℝ
  symm' : ∀ x y, toFun x y = toFun y x
  meas' : Measurable (Function.uncurry toFun)
  bdd'  : ∃ C, ∀ x y, |toFun x y| ≤ C

instance : AddCommGroup (SymmKernel Ω μ) := sorry
instance : Module ℝ (SymmKernel Ω μ) := sorry   -- so `U - W` and `c • W` are kernels

/-- Layer 1. A graphon: a `[0,1]`-valued symmetric kernel. -/
structure Graphon (Ω : Type*) [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    extends SymmKernel Ω μ where
  mem01' : ∀ x y, toFun x y ∈ Set.Icc (0:ℝ) 1

/-- Layer 1. Cut norm — on kernels (hence applies to `U - W`). -/
noncomputable def cutNorm (K : SymmKernel Ω μ) : ℝ := sorry

/-- Layer 1. Homomorphism density `t(F, W)`, edges via `Sym2`. -/
noncomputable def homDensity {V : Type*} [Fintype V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (W : Graphon Ω μ) : ℝ := sorry

/-- Layer 1. Erdős–Rényi sanity value (acceptance gate), for the constant-`p` graphon. -/
example {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (p : ℝ) (hp : p ∈ Set.Icc (0:ℝ) 1) (W : Graphon Ω μ) :
    homDensity μ F W = p ^ F.edgeFinset.card := sorry

/-- Layer 2. Counting lemma — the argument to `cutNorm` is the *kernel* `U - W`. -/
example {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj] (U W : Graphon Ω μ) :
    |homDensity μ F U - homDensity μ F W|
      ≤ F.edgeFinset.card * cutNorm μ (U.toSymmKernel - W.toSymmKernel) := sorry

/-- Layer 3. The L⁰ view: observables factor through the a.e. class. -/
noncomputable def toAEEqFun (W : Graphon Ω μ) : (Ω × Ω) →ₘ[μ.prod μ] ℝ := sorry

example {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj] (U W : Graphon Ω μ)
    (h : toAEEqFun μ U = toAEEqFun μ W) : homDensity μ F U = homDensity μ F W := sorry

/-- Layer 5 prerequisite (the missing Mathlib input). An atomless standard Borel probability
space is *measure-preservingly* isomorphic to `([0,1], vol)`. Mathlib has the measurable
equivalence; this is the measure-preserving refinement. -/
example [StandardBorelSpace Ω] [NoAtoms μ] :
    ∃ f : Ω → ℝ, MeasurePreserving f μ (volume.restrict (Set.Icc (0:ℝ) 1)) := sorry

/-- Layer 6. Separation / inverse counting — the summit. -/
example [StandardBorelSpace Ω] (U W : Graphon Ω μ) :
    cutDist μ U W = 0 ↔
      ∀ {V : Type} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj],
        homDensity μ F U = homDensity μ F W := sorry

end TauCetiRoadmap.DenseGraphLimits
```

## Worked examples (acceptance gates)

Non-negotiable, independent of implementation: the constant-graphon value `p^{e(F)}`;
finite-graph compatibility `t(F, W_G) = hom(F,G)/|V(G)|^{|V(F)|}`; the cut-norm set/test-function
equivalence; the counting lemma; weak regularity; `cutDist` a pseudometric; compactness;
separation; `E[t(F, G(n,W))] → t(F,W)`; and at least Goodman, Mantel, and Sidorenko-`C₄`. A
milestone is **done** when the result descends to the intended quotient and passes its gates —
not when the file merely compiles.

## Ordering

Layers 0–2 and 7 first — they validate the pipeline and give visible checkpoints. The L⁰ view
(Layer 3) lands next, as the prerequisite for the analytic layers. Then Layer 6 (separation) as
the highest-leverage self-contained summit, with Layer 4 (compactness) alongside it. Layer 5
(coupling↔map) runs in parallel, gated on the measure-preserving `[0,1]`-isomorphism, and must
not block the others. Representability (Layer 8), sampling / exchangeable arrays (Layer 9), and
the Mathlib upstreaming follow.

Layers 4, 5, and 6 are independent and can be tackled concurrently, so **register an intention
and `claim` the specific layer** before a substantial push (see *Coordinating work* in the
repository README) — both people and automated workers respect claims, which avoids duplicate
target work.

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

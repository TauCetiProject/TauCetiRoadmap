# Roadmap: the four colour theorem

The goal of **FourColorTheorem** is a Lean 4 formalisation of the four colour theorem for
planar maps, mirroring the structure of the successful
[Coq proof of G. Gonthier](https://github.com/rocq-community/fourcolor) (the `fourcolor`
library) and following its division of labour. The centrepiece is the *combinatorial* theorem
for finite hypermaps,

```lean
theorem four_color_hypermap
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : Planar G → Bridgefree G → FourColorable G
```

and, on top of it, the two classic plane statements that the Coq proof derives from it. The
three carve-out `Prop`s (`Reducibility`, `DischargeForkConsistent`, `AllReducedParts`) are
**explicit hypotheses** of every summit theorem, never axioms:

```lean
theorem four_color_finite
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (m : PlanarMap) : FiniteSimpleMap m → ColorableWith 4 m

theorem four_color
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (m : PlanarMap) : SimpleMap m → ColorableWith 4 m
```

The three mirror `four_color_hypermap`, `four_color_finite`, and `four_color` in the Coq
repository's `combinatorial4ct.v` and `fourcolor.v`.

Cohen's advice — and Gonthier's practice, distilled in
[*A computer-checked proof of the Four Color Theorem*](https://inria.hal.science/hal-04034866/document) —
is that the four colour theorem is not a single theorem but a large, mostly ordinary graph
theory, in which just a few isolated claims are established by large computations. This roadmap
reproduces that shape. Almost everything is ordinary mathematics and should be proved in Lean
directly. A small, sharply delimited set of *proofs by reflection* — the reducibility check of
633 configurations and the discharge-fork computation — cannot be carried out that way in Lean:
Coq proves them by running the reflected programs inside the proof (`vm_compute` and the
`exact <: isT` steps), whereas Lean's kernel exposes no transparent equivalent of a
definitional `Eval vm_compute`. For those statements this roadmap provides **carve-out
hypotheses**, named `Prop`s that the consumer may assume, and threads them explicitly so that
the surrounding mathematics — the whole of the kinetic and discharge argument — is still proved
down to those hypotheses rather than swallowed into the statement.

This roadmap also takes the opportunity to build the supporting theories as reusable Mathlib-
and Tau Ceti-flavoured libraries: a combinatorial-theory of hypermaps, the C-reducibility
criterion and the Kempe theory it rests on, a discharge argument, and the plane-discretisation
that turns a real-plane map into a finite hypermap. These are the reusable payoffs the theorem
is embedded in.

Suggested home in Tau Ceti: `TauCeti/Combinatorics/FourColor/`.

## Provenance and licence

The mathematics follows [`rocq-community/fourcolor`](https://github.com/rocq-community/fourcolor),
G. Gonthier's Coq proof, distributed under the CeCILL-B licence. This roadmap does **not** ask
for a line-by-line port of that code, and no CeCILL-B source is to be copied verbatim into Tau
Ceti. Tau Ceti's licence is much more permissive, but blending the two texts is unnecessary:
the roadmap specifies the mathematics intrinsically, in Mathlib's vocabulary, and a fresh proof
that happens to agree with the Coq proof's structure needs no copying at all. Anyone who does
want to adapt specific Coq text must first obtain Gonthier's/the maintainers' agreement and
satisfy CeCILL-B, per the repository rule on integrating existing work. The file-by-file
map of the Coq development to this roadmap's lanes is given at the bottom, as secondary
provenance, and must not be read as prescribing Lean file layout or Lean naming.

## What Mathlib already has (consume)

- **Simple graphs, walks, connectivity, colourings.** `Mathlib/Combinatorics/SimpleGraph/*`
  supplies `SimpleGraph`, walks, connectivity, and the colouring API:
  `SimpleGraph.Coloring α`, `SimpleGraph.Colorable n`, `chromaticNumber`. This is the 
  terminology a planar map's dual is expected to connect to, but note that the four colour
  theorem runs most naturally in the *hypermap* category below, not directly as a vertex
  colouring of a simple graph.
- **Finite permutations and cycles.** `Mathlib/Data/Fin`, `Mathlib/GroupTheory/Perm/*`,
  `Mathlib/Data/Fintype/*`, `Equiv.Perm`, `Equiv.Perm.IsCycle`. The three dart permutations
  of a hypermap are built from these.
- **Euler characteristic of surfaces.** `Mathlib/Topology/EulerCharacteristic/*` and the
  `ℤ`-valued Euler characteristic of finite complexes. The Coq proof's `genus` is a natural
  candidate to be expressed with these, but a bespoke `Hypermap.genus` in `ℕ` (as in Coq)
  may be cleaner and is what this roadmap pins.
- **Real numbers and plane topology.** `Mathlib/Data/Real/*`, `ℝ`, and
  `Mathlib/Analysis/...` supply the real line and plane that the `real`/`realplane` substrate
  of the Coq proof axiomatized. We use Mathlib's `ℝ` directly rather than re-axiomatizing a
  setoid of reals.
- **Decidable equality and `Fintype`.** The `decide_colorable` algorithm (portable into Lean
  as a constructive exhaustive search over the finite dart type) uses `Fintype` and decidable
  equality pervasively.

Suggestions: search Zulip and open Mathlib PRs for hypermaps, combinatorial maps, planar
graphs, and reducibility before fixing the API. Rida-Hamadani's work on combinatorial maps and
planar graphs (a `CombinatorialMap` and a `IsPlanar` predicate) may evolve; Tau Ceti adopts
Mathlib's shape when it lands and refactors, but never waits and never pushes work to Mathlib.
A hypermap theory built here that Mathlib later takes over is deleted and replaced by Mathlib's,
which is the standing rule.

## Standing conventions

- **A hypermap is a finite type of darts with three permutations.** The Coq proof represents a
  hypermap as a finite type `Dart` together with three permutations `e = edge`, `n = node`,
  `f = face` on it whose pairwise composites are mutual inverses (`e ∘ n ∘ f = id` and its two
  siblings). Equivalently, a graph encoded as a permutation `σ` (edges), `α` (faces) with
  `α`-cycles the faces and `α ∘ σ` the vertices, following the classical "rotation system"
  description; the Coq three-permutation form, with `e`, `n`, `f` mutually inverse, is what
  supports all the symmetries (dual, mirror, `permN`, `permF`). Pin the Coq three-permutation
  form.
  A **dart** is a directed edge (an oriented half-edge). The **face** of a dart is the
  `f`-orbit it generates; the **node** and **edge** are the `n`- and `e`-orbits.
- **Adjacency of faces** is captured extensionally: two darts are in the same face if they are
  `f`-connected, and two faces are adjacent if an edge link joins them.
- **Colouring.** A `Coloring k` of a hypermap is `k : Dart → Color` (four colours `0 1 2 3`,
  an enumerated `Color` type) that is constant on each `f`-face and assigns different values to
  the two darts of each edge. `FourColorable G : Prop := ∃ k, Coloring k`. This is a *map*
  colouring of regions, matching the Coq `coloring`.
- **Planarity.** `Planar G` is `Hypermap.genus G = 0`, via Euler's formula; the roadmap also
  builds the Jordan/Möbius-path characterization (`Jordan G`) and proves the two agree (the
  Coq `jordan.v` equivalence), since the discharge and embedding arguments use both. A map is
  **bridgeless** when no edge link is a loop (`Bridgefree G`), **plain** when no node has a
  loop, **precubic/cubic** when every node has degree `≤ 3` / exactly `3`, **pentagonal** when
  every face has arity `5` (ring arity in range `3..6`), and **connected** when the dart type
  is `glink`-connected.
- **Minimal counterexample.** `MinimalCounterExample G` is the conjunction: `G` is a planar,
  bridgeless, plain, precubic hypermap, it is not four-colourable, and every smaller such
  hypermap *is* four-colourable. The main body of the proof shows such a `G` must be connected
  (`patch`), cubic (`coloring`), and pentagonal (`birkhoff`), and that it can carry neither an
  embeddable reducible configuration nor a hub of the discharge analysis.
- **Carve-out hypotheses are explicit.** Every corpus-level reflection result is a named
  hypothesis threaded through the mathematical statements, exactly as the Coq proof threads
  `red_check : reducibility` through the presentation lemmas to `unavoidability` and then
  `four_color_hypermap`. No reflection claim is silently buried; the surrounding deduction
  still has to be *proved*.
- **Do not re-encode `native_decide` as a tolerated axiom blanket.** We do not assume the
  theorem `four_color_hypermap` or `unavoidability`. We assume only the handful of concrete,
  compiled, finite claims (reducibility of the 633 configurations, the discharged-fork bound)
  that the mathematics genuinely reduces to, each stated explicitly below, and we prove every
  general statement on top of them.

## The carve-outs (proofs by reflection)

The Coq development computes several quantities by reflection, in the sense of evaluating
compiled programs inside proof scripts. Three of them are the carve-outs below; each is
listed here with the precise `Prop` that must be assumed. Each is a closed, finite, decidable
statement — the kind that
`native_decide` could in principle discharge — but they are enormous and kernel-hostile, so the
roadmap makes them hypotheses rather than targets to prove.

The formal body of the theorem is written *parametrized* over these assumptions and must not
depend on which of them is later discharged by `native_decide`, a certificate-verified
computation, or future kernel support. That orthogonality is itself part of the work: a
contribution that hard-codes one discharging method into the middle of the argument is not
acceptable.

### Proof-by-reflection claim 1 — reducibility of the 633 configurations

The Coq `reducibility.v` collates, into the single lemma `the_reducibility : reducibility`,
the claim that every one of the 633 configurations in `the_configs` passes the `check_reducible`
test. Each `check_reducible` call is a boolean program evaluated by `vm_compute` in the
`CheckReducible` tactic; the thousands of lines of `jobMMMtoNNN.v` / `taskMMMtoNNN.v` exist
only so that Coq can run these evaluations without exceeding proof-term limits, and are a pure
artifact of how Coq is made to execute them. Lean has no counterpart to throttling execution by
splitting files, and no transparent definitional execution of a program of that size.

The claim to assume, at its natural granularity, is the conjunction over indices:

```lean
def Reducibility : Prop :=
  ∀ i, i < the_configs.length → cfreducible (the_configs[i])
```

Lean-side we do **not** store the 633 configurations as per-configuration computed lemmas (the
Coq job/task files). We store `the_configs` as ordinary data (Layer D below), and assume
`Reducibility` as a single hypothesis. Optionally a contributor may, for a *minority* of
configurations, discharge the corresponding member of the conjunction directly with
`native_decide`; that is welcome and strictly stronger than assuming the whole `Reducibility`,
but the general proof must go through as if only `Reducibility` were available.

### Proof-by-reflection claim 2 — the discharge-fork bound

The discharge step in `present.v` uses a precomputed `the_drule_fork = Eval vm_compute in
the_drule_fork_template`, a table of `DruleFork` values, together with the inequality it encodes
(`dbound1_eq`, `dbound1P` confining the hub arity of a minimal counterexample). The finitely
many rows of the fork, and the bound they certify, are a second compiled quantity.

The clean carve-out folds the fork into the one inequality the main theorem actually consumes.
The discharge charge `dscore` and the bound are real mathematics (Layer B);
only the *finite table lookup* and the verification that the fork's rows meet the bound are
computed. So the carve-out is the *verified table*:

```lean
def DischargeForkConsistent : Prop :=
  ∀ n, 5 ≤ n → n ≤ 11 → hub_arity_bound n ≤ the_fork_row n
```

where `the_fork_row : Fin 12 → ℕ` is a fixed closed table, and `hub_arity_bound` is the
discharge-derived upper bound on the arity of a hub in a minimal counterexample. Assumed. The
rows themselves are ordinary data; only the "this table meets the derived bound" conjunction of
finitely many arithmetic equations is computed and hence assumed.

### Proof-by-reflection claim 3 — the reducibility leaves of the presentation

Within each `presentN.v`, the `Reducible` tactic closes a branch by proving, by computation,
that the relevant part of the *reduced* redpart contains the configuration: Coq's `Reducible`
is `apply succeed_by_reducibility; exact <: isT`, which evaluates `redpart the_quiz_tree p`
(itself built from `cfquiz_tree` computed by `vm_compute`). In Lean the equivalent obligation
is a decidable boolean `ReducedPart p : Prop := (redpart (cfquizTree the_configs) p = true)`.

We do **not** assume all of them wholesale a priori; each `Reducible`/`Hubcap` leaf is a fixed
small part `p`, and these are precisely the statements an implementer may discharge one-at-a-time
with `native_decide`. But because the whole set is large and the roadmap must not depend on a
specific discharging method, it provides the uniform carve-out

```lean
def AllReducedParts : Prop :=
  ∀ p, p ∈ the_presentation_parts → ReducedPart p
```

`the_presentation_parts` is the finite list of the parts that the presentation scripts reduce.
Assumed; a contributor may refute any row, replace any row by a `native_decide` proof, or leave
the hypothesis in place. The presentation *logic* — that each `Pcase`/`Hubcap`/`Similar` step's
conclusion follows from such red-parts and forced-parts — is ordinary mathematics and is proved.

These three collapse, and no more. In particular `decide_colorable : {FourColorable G} +
{¬ FourColorable G}` is *not* a reflection carve-out: though it is a search, it is a
constructive, structural recursion over the finite dart type that ports cleanly into Lean as an
ordinary computation (see Layer B), and the roadmap requires it proved.

---

## The build, in layers

The ordering is the dependency order. As each layer makes the next layer's *types* expressible,
its milestones go into `Suggested.lean` (with `sorry`), and the corpus-level carve-outs from
above are threaded there as explicit hypotheses of the summit theorem statements (with `sorry`
bodies) so the summit statements elaborate. `Suggested.lean` is read as suggested forms only,
never as an exhaustive checklist.

### Layer A: combinatorial hypermaps and their geometry
- **The `Hypermap` structure**: a finite dart type with three mutually-inverse permutations
  `edge`, `node`, `face`; the `cancel3` relation; `edgeK/nodeK/faceK` and injectivity; the
  `cedge/cnode/cface` connectivity relations and their symmetry/translation lemmas; the
  `glink`/`clink` relations; `connected`, `dart_card`.
- **Symmetries**: `permN`, `permF`, `mirror`, `dual`, and the preservation of connectivity,
  genus and planarity by each. The `dual` of a colored map and the relation between a map and
  its dual's colourings.
- **Euler + genus + planarity**: `Euler_lhs`, `Euler_rhs`, `genus`, `planar`; Euler's formula
  for hypermaps; the Jordan/Möbius-path characterization `Jordan G`; the equivalence
  `Planar G ↔ Jordan G` (the Coq `jordan.v` theorem, which is where the `Walkup` transform's
  three variants are put to work). This is a substantial and reusable body.
- **The `Walkup` construction** `WalkupE`, `WalkupN`, `WalkupF` (`walkup.v`): removing a dart
  from the domain and its effect on genus, planarity, and the Jordan property. These are the
  workhorse of the Euler↔Jordan equivalence and later of the coloring/contract arguments.
- **Colourings**: `Color` (four colours), `Coloring k`, `FourColorable G`; colouring
  invariants (`coloring_inj`, `coloring_cface`, adjacency); the **map coloring** definition
  via `Coloring`.
- Completion: the `Hypermap` structure elaborates, `genus`/`planar`/`Jordan`, the Euler–Jordan
  equivalence and the `Walkup` lemmas (genus/planar/Jordan preservation) are proved, and
  `FourColorable` is defined and usable.

### Layer B: decidability, the minimal counterexample, colouring theory
- **`decide_colorable : {FourColorable G} + {¬ FourColorable G}`** — the constructive
  exhaustive search (Coq `coloring.v`), a structural recursion over the dart enumeration that
  builds a colouring suffix by suffix. Proved, not assumed.
- **`MinimalCounterExample G`**: the conjunction pinned above; immediately, that it is **cubic**
  (`minimal_counter_example_is_cubic`), and later (Layer C) connected and pentagonal.
- **Contract colourings, ring traces and valid contracts** (`cc_coloring`, `cc_colorable`,
  `ring_trace`, `cc_ring_trace`, `valid_contract`): the scaffolding that turns a reducible
  configuration into a local recolouring of a minimal counterexample. The definitions of
  `embeddable`, `sparse`, `triad`, `C_reducible`, `D_reducible`.
- **Kempe theory** (`kempe.v`): Kempe chains; the Kempe-closure of colourings; that a
  contract-colouring extends across a Kempe recolor sequence into the closure of the ring-trace
  colourings. This is the mathematical engine of C-reducibility.
- Completion: the decidability result is proved; `MinimalCounterExample`, contract colourings,
  ring traces, and `C_reducible` are defined; the Kempe lemmas behind `C_reducible` are proved.

### Layer C: configurations and reducibility
- **The construction programs** `cprog`, `cpstep`, `cpmap`, `cpring`, and the `cpcolor`/
  `cpcolor1`/`cpcolor0`/`cpcolor` colouring machinery (`cfmap.v`, `cfcolor.v`): building the
  finite maps and colouring trees described by a program, with their correctness lemmas
  (`cpcolor_proper`, `ctree_mem_cpcolor`).
- **Colouring trees** `ctree`, `kempetree` (`ctree.v`, `kempetree.v`, `initctree/gtree/
  ctreerestrict/gtreerestrict` equivalents): the tree of colourings of a ring and its Kempe
  co-closure, with `ctree_disjoint` as the reducibility witness.
- **`configurations.v` data**: the 633 configurations of Robertson–Sanders–Seymour–Thomas, as
  closed data in `the_configs`, each with its `cprog` and a `cfcontract` (a valid contraction
  completing each D-reducible configuration to C-reducibility). Where the Coq data are explicit
  (`cf000`, `Config`-, `SeqConfig`-valued), Lean store them as data with a decidable equality.
  No reducibility proof is attached to a configuration here; that is the carve-out.
- **`cfreducible.v`**: `check_reducible`, `cfreducible`, `reducible_in_range`, and the
  *statement* `Reducibility` (carve-out 1). The `CheckReducible`/`CatReducible` tactics of Coq
  are replaced by the assumption that the conjunction of boolean checks is `true`:
  **no `check_reducible` computation is a target**; the `check_reducible_valid` soundness lemma
  (that `check_reducible`'s boolean → `cfreducible`) *is* a target, because it is the honest
  mathematics relating the computed boolean to the semantic `C_reducible`.
- Completion: the configuration data lives in `the_configs`; `check_reducible_valid` is proved;
  `Reducibility` (carve-out 1) is stated as the assumed corpus-level claim.

### Layer D: the unavoidability framework — parts, discharge, hubcaps
- **Parts and exact fitting** (`part.v`, RedPart): `Part`, `pcons_`, `rot_part`, `fitp`, and
  `exact_fitp` — a configuration "fits" a hub when it embeds exactly around it; `redpart`
  (the red-part of a part, computed from the quiz tree).
- **Quizzes** (`quiz.v`, `quiztree.v`): `quiz`, `quiz_tree`, `cfquiz_tree` — the decision tree
  used to decide whether a configuration fits. `cfquiz_tree` is a computable function; the
  roadmap treats it as such (a plain recursive definition), and the huge evaluation is replaced
  by the `ReducedPart`/`AllReducedParts` carve-out (claim 3) rather than by a precomputed tree.
- **Discharge** (`discharge.v`): the `dscore` (discharge charge) over the faces of a minimal
  counterexample, `posz_dscore`, and the **`hub_arity_bound` derivation**: the discharge
  inequation forcing the hub-face arity into the range `5..11` unless a hubcap charge applies.
  This is the discharge inequality that is a theorem (not a carve-out); the `exclude5..11`
  presentation lemmas rule each value of that range out individually.
- **Hubcaps** (`hubcap.v`): `hubcap`, `hubcap_fit`, `hubcap_cover`; the `Hubcap`/`Similar`
  step of a presentation is the ordinary mathematics that combines a hubcap with a red-part
  bound; the finite fork table `the_fork_row` and `DischargeForkConsistent` (carve-out 2).
- **Presentations** (`present.v`, `present5..11.v`): the seven `exclude5`…`exclude11` lemmas —
  that no minimal counterexample has a hub of arity `5..11` — each a finite case analysis whose
  leaves are closed by `Reducible` (carve-out 3) or `Hubcap` (carve-out 2). The presentation
  script's split/symmetry logic (`Pcase`, `Similar`) is real deduction and is proved; only the
  leaves are assumed.
- Completion: `excludeN` for each `n ∈ 5..11` is proved *given* the carve-out hypotheses and the
  discharge inequality; `all_excluded_arity : ∀ n, 5 ≤ n → n ≤ 11 → ¬ ∃ hub of arity n in a
  minimal counterexample` is assembled.

### Layer E: unavoidability and the combinatorial theorem
- **`unavoidability.v`**: the theorem
  `unavoidability (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
  (G : Hypermap) (hG : MinimalCounterExample G) : False`, proved from the `exclude5..11`
  lemmas, the discharge inequality, and carve-outs 1–3, each passed as an explicit hypothesis
  (no axioms). This is the mathematical heart: every 5..11-hub of the discharge is either
  reducible or capped, so no minimal counterexample survives.
- **`combinatorial4ct.v`**: the summit
  `four_color_hypermap (G : Hypermap) : Planar G → Bridgefree G → FourColorable G`
  by minimal-counterexample contradiction: given `unavoidability Reducibility`, show any planar
  bridgeless map is four-colourable by first passing to the precubic `cube G` (Layer E1, the
  `cube_colorable` step), then inducting on the dart count; in the induction, split the
  induction step with `decide_colorable` (Layer B) so that a non-colourable map of that size
  satisfies `MinimalCounterExample` (its "minimal" conjunct is exactly the induction
  hypothesis), and close the branch with `unavoidability`.
- **The `cube` construction** (`cube.v`): a cubic, plain hypermap `cube G` whose planarity and
  bridgelessness match `G`'s and whose four-colourability implies `G`'s
  (`cube_colorable`), used to downgrade a general map to the precubic setting of
  `minimal_counter_example`.
- Completion: `four_color_hypermap` elaborates and is proved, with `unavoidability` taking the
  three carve-out `Prop`s (`Reducibility`, `DischargeForkConsistent`, `AllReducedParts`) as
  explicit hypotheses (no axioms), exactly modelling how the Coq theorem is stated relative to
  reflection.

### Layer F: from the plane to the combinatorial theorem
This lane turns a real-plane map into a finite hypermap and closes the Coq pass from
`four_color_hypermap` to `four_color_finite` (`discretize.v`, `grid.v`, `gridmap.v`,
`matte.v`, `approx.v`) then to arbitrary maps (`finitize.v`). It is a genuinely distinct body
of real analysis and plane topology; it must contact Mathlib's `ℝ`, but the matte/grid
discretisation machinery is bespoke and large. It is in scope — the roadmap's headline is the
official theorem — and is split into two contiguous milestones.

#### F.1 — The plane substrate (port of `real`/`realplane`)
Because Mathlib already has `ℝ` and the topology of the plane, this is *not* a re-axiomatization
of the reals: use Mathlib's `ℝ`, `point ℝ`, open/connected sets, and the Jordan curve theorem
(Mathlib has a Jordan curve theorem via `IsJordanCurve`, `Mathlib/Topology/JordanCurve/*`).
Define:
- `map`: a plane map `m : point → ℝ → Prop` (the relation "`z` is in region `r`) with the region
  relation symmetric, reflexive, and transitively-closed; a **`simple_map`** is a map whose
  regions are open and connected, plain, and pairwise disjoint up to boundaries; a
  **`finite_simple_map`** has finitely many regions.
- `colorable_with n m`: an `n`-coloring of the regions, `Region → Fin n` assigning distinct
  colours to adjacent regions (`ColorableWith`, `Fin n`-valued).
- The **Jordan curve theorem** instance Mathlib needs for the discretization: a simple closed
  curve separates the plane into two components, each homeomorphic to a disc up to the curve.
  Contact Mathlib's existing Jordan theorems; do not rebuild them.
- Completion: `simple_map`, `finite_simple_map`, `colorable_with`, and the plane-lemma API that
  `F`-2's discretization consumes, stated and proved against Mathlib's plane topology.

#### F.2 — Discretization, mattes, grid, and the compactness extension
- **`grid.v` / `gridmap.v`**: the scaled grid and gridmap — building hypermaps out of finite
  unions of grid (scaled) rectangles; `scaled_rect`, `scaled_matte`, and the hypermap of a
  matte approximation.
- **`matte.v` / `approx.v`**: matte approximations of a plane region by unions of scaled
  rectangles; `smatte`, `proper_smatte`, `mr_proper`, `mr_cover` (transversals hitting every
  region); interpolation (`smatte_interpolated`) that connects the sampled rectangles inside a
  connected region.
- **`discretize.v`**: `discretize_to_hypermap` — from a `finite_simple_map m0` and a proper
  covering transversal, build a finite planar bridgeless hypermap whose four-colourability
  lifts to `colorable_with 4 m0`; the five-step construction (enumerate regions and
  adjacencies, cover border points by rectangles, approximate, interpolate mattes, build the
  gridmap hypermap). Its conclusion `∃ G, Planar G ∧ Bridgefree G ∧ (FourColorable G →
  ColorableWith 4 m0)` then feeds   `four_color_hypermap` to obtain
  `four_color_finite (red : Reducibility) (fork : DischargeForkConsistent)
  (parts : AllReducedParts) (m0 : PlanarMap) : FiniteSimpleMap m0 → ColorableWith 4 m0`.
- **`finitize.v`**: the compactness extension from finite to arbitrary maps —
  `four_color (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
  (m0 : PlanarMap) : SimpleMap m0 → ColorableWith 4 m0`. This is the lexicographically-minimal
  chain of colourings of the nested `pmap n m0` (the restriction of `m0` to the first `n` grid
  points), a compactness argument exploiting planarity to keep maps countable; it uses no full
  choice. Port the argument; Mathlib's `ℝ` and countability make this cleaner than Coq's.
- Completion: `four_color_finite` and `four_color` are stated and proved, the ladder
  `four_color_hypermap` → `four_color_finite` → `four_color` closed.

---

## The carve-out statement, once more

To state the summit Lean-side without naming a discharging method, `Suggested.lean` threads the
three carve-out `Prop`s as **explicit hypotheses** of the summit theorems — never as `axiom`s.
There are no axioms in this roadmap: a contributor proves the surrounding mathematics down to
these named `Prop`s and takes them as ordinary arguments.

```lean
theorem unavoidability
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) (hG : MinimalCounterExample G) : False

theorem four_color_hypermap
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : Planar G → Bridgefree G → FourColorable G

theorem four_color_finite
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (m : PlanarMap) : FiniteSimpleMap m → ColorableWith 4 m

theorem four_color
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (m : PlanarMap) : SimpleMap m → ColorableWith 4 m
```

`unavoidability`, `four_color_hypermap`, `four_color_finite`, and `four_color` are then stated
and proved with these hypotheses in scope, exactly as the Coq `four_color_hypermap` is proved
from `the_reducibility`. Any contributor who replaces one of these hypotheses with a `theorem`
(by `native_decide` or a verified certificate) — or a smaller, stronger fact — strictly
strengthens the result; nothing in the body changes. Review must confirm that no *other*
reflection use is smuggled in — that the only kernel-visible assumptions of the main theorems
are the three carve-out `Prop`s passed in explicitly (plus `propext`, `Classical.choice`,
`Quot.sound` as usual), and that no `native_decide` appears inside the mathematical deduction.

`Suggested.lean` threads the three carve-outs as explicit hypotheses of the summit theorem
statements so that the assumptions are explicit and localised, not global and not axiomatic.

---

## The work items

`A`–`F` may proceed only roughly in the layer order: `A` opens, then `B` and `C` can advance in
parallel on top of it; `D` needs `C` (configurations) and `B` (minimal counterexample); `E`
needs `D`; `F` is independent of `B`–`E`'s internals but needs `A` (hypermaps) and Mathlib's
plane topology, and consumes `four_color_hypermap` at the end. The dependency identifiers in
the table are not a demand that each lane land as one pull request; split freely wherever a
reviewer can inspect a definition in one sitting.

| Item | Depends on | Concrete result | Completion evidence |
| --- | --- | --- | --- |
| A0: `Hypermap` and Euler/genus/planarity | Mathlib (perm, fintype) | `Hypermap`, `genus`, `planar`, Euler's formula | `planar`/`genus` usable; Euler proved for hypermaps |
| A1: the Jordan characterization and `Walkup` | A0 | `Jordan G`, `Planar ↔ Jordan`, `WalkupE/N/F` preservation | `Planar↔Jordan` proved; `planar_WalkupE` etc. proved |
| A2: colourings | A0 | `Color`, `Coloring`, `FourColorable`, invariants | `Coloring` API + `coloring_inj/cface` proved |
| B0: `decide_colorable` | A2 | `{FourColorable G} + {¬ FourColorable G}` | decidability proved (constructive search) |
| B1: minimal counterexample + ring/contract machinery | A2, B0 | `MinimalCounterExample`, `cc_ring_trace`, `valid_contract`, `C_reducible` | all definitions usable; cubic proven |
| B2: Kempe theory | B1 | Kempe closure; `C_reducible` engine | Kempe recolor lemmas proved |
| C0: programs and colouring trees | A2, B2 | `cprog/cpstep/cpmap/cpcolor`, `ctree`, `kempetree` | `cpcolor_proper`, `ctree_mem_cpcolor` proved |
| C1: configuration data | C0 | `the_configs` (633) with `cprog`/`cfcontract` | closed data, decidable equality, `nth` access |
| C2: reducibility + carve-out 1 | C1 | `check_reducible`, `check_reducible_valid`, `Reducibility` | `check_reducible_valid` proved; `Reducibility` assumed |
| D0: parts and quizzes | C0, C2 | `Part`, `fitp`, `redpart`, `cfquiz_tree` | fitp/redpart API usable |
| D1: discharge and hub_arity_bound | B1, D0 | `dscore`, `hub_arity_bound` derivation | discharge inequation proved (not assumed) |
| D2: hubcaps + carve-out 2 | D1 | `hubcap`, `the_fork_row`, `DischargeForkConsistent` (assumed) | `hubcap_fit/cover` proved; fork table consistent as hypothesis |
| D3: presentations (exclude5..11) + carve-out 3 | D0, D2 | `excludeN` (given hypotheses), `AllReducedParts` (assumed) | `exclude5`..`exclude11` proved; parts list closed |
| E0: unavoidability | D3 | `unavoidability : Reducibility → ∀ G, ¬ MinimalCounterExample G` | proved |
| E1: `cube` + `four_color_hypermap` | E0, B0 | cubic reduction; `four_color_hypermap` | summit combinatorial theorem proved |
| F1: plane substrate | Mathlib topology | `simple_map`, `finite_simple_map`, `colorable_with` | plane-map API usable |
| F2: grid/matte/discretize | A0, F1 | `discretize_to_hypermap`, `four_color_finite` | `four_color_finite` proved |
| F3: compactness extension | F2 | `finitize` chain; `four_color` | `four_color` proved |

`B0` and `C1` are the two largest genuinely *finitary* computational pieces that are still
required as theorems (search and data), and reviewers should be careful to keep them honest —
`decide_colorable` must be an algorithm, not a hidden `native_decide`; `the_configs` must be
closed data with no `Classical.choose`.

## Worked acceptance tests

- `decide_colorable` returns the right answers on a handful of small concrete hypermaps: the
  `K4` (four-colourable) and the `K5`-necklace / wheel `W5` (not four-colourable as a map when
  it triangulates).
- Euler's formula: a planar hypermap built from the `cube` construction has `genus 0`; a
  `K3,3`-style hypermap has nonzero genus and is `¬ Planar`.
- `four_color_hypermap` discharges on an explicit small planar bridgeless hypermap (e.g. the
  icosahedron or a minimal triangulation of the sphere) by producing a `FourColorable` witness
  that actually colours the dart type.
- With `Reducibility`, `DischargeForkConsistent`, `AllReducedParts` passed as explicit
  hypotheses, `four_color_hypermap` and `unavoidability` type-check with `sorry`-free bodies
  (modulo those three arguments), and `Lean.#print axioms four_color_hypermap` reports only the
  standard kernel axioms (`propext`, `Classical.choice`, `Quot.sound`) — no carve-out axioms.

## Existing work and provenance

The source development is G. Gonthier's Coq proof in
[`rocq-community/fourcolor`](https://github.com/rocq-community/fourcolor), documented in
- G. Gonthier, [*Formal Proof — The Four-Color Theorem*](https://www.ams.org/notices/200811/tx081101382p.pdf),
  Notices of the AMS, Nov 2008;
- G. Gonthier, G. Huet, D. Jérome et al.,
  [*A computer-checked proof of the Four Color Theorem*](https://inria.hal.science/hal-04034866/document);
- N. Robertson, D. P. Sanders, P. D. Seymour, R. Thomas, *The four-colour theorem*, J.
  Combin. Theory Ser. B **70** (1997).

Its mathematical content (the hypermap account of planarity, Euler's formula, the Jordan
characterization, Kempe chains, C-reducibility via ring traces, the discharge/unavoidability
analysis, and the matte/grid discretization of the plane) is what this roadmap states
intrinsically. The file-by-file correspondence, for coordination and review only:

| This roadmap | Coq `proof/` files (provenance, not prescription) |
| --- | --- |
| Layer A | `hypermap.v`, `walkup.v`, `jordan.v`, `geometry.v`, `color.v`, `chromogram.v`, `coloring.v` (part) |
| Layer B | `coloring.v`, `kempe.v`, `contract.v`, `snip.v`, `revsnip.v`, `sew.v`, `patch.v` |
| Layer C | `cfmap.v`, `cfcolor.v`, `ctree.v`, `kempetree.v`, `init{ctree,gtree}.v`,
  `{ctree,gtree}restrict.v`, `cfcontract.v`, `configurations.v`, `cfreducible.v` |
| Layer D | `part.v`, `redpart.v`, `quiz.v`, `quiztree.v`, `discharge.v`, `hubcap.v`,
  `present.v`, `present5.v`–`present11.v` |
| Layer E | `unavoidability.v`, `reducibility.v`, `cube.v`, `combinatorial4ct.v`,
  `fourcolor.v` |
| Layer F | `real.v`, `realprop.v`, `realsyntax.v`, `realcategorical.v`, `dedekind.v`,
  `realplane.v`, `grid.v`, `gridmap.v`, `matte.v`, `approx.v`, `discretize.v`,
  `finitize.v` |

The `jobMMMtoNNN.v` and `taskMMMtoNNN.v` files are pure reflection-execution artifacts (the
roads that let Coq `vm_compute` the reducibility results piecemeal); they have **no
mathematical content to port** and this roadmap does not mirror them. The Coq `real.v` family
axiomatizes the classical reals; Lean uses Mathlib's `ℝ` instead, which is strictly stronger and
needs no axiom, so the reals are consumed, not ported. Coordinating with `rocq-community` and
the maintainers is expected before adapting any concrete Coq text; the licence note at the top
of this document governs copying.

This roadmap's phrase "the official four colour theorem" means the pair `four_color_finite` and
`four_color` above — the theorem `simple_map m → colorable_with 4 m` in the Coq sense,
which is the theorem the Coq `fourcolor.v` proves.

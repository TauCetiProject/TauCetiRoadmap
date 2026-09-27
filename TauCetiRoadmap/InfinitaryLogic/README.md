# Roadmap: infinitary syntax, back-and-forth, and Scott analysis

Infinitary logic is the natural home of the model theory of countable structures, and it is missing
from Mathlib. Mathlib has finitary first-order logic — `FirstOrder.Language`, `Term`,
`BoundedFormula`, `Structure`, satisfaction, and the back-and-forth infrastructure for finitely
generated partial isomorphisms (`PartialEquiv`, `FGEquiv`, `IsExtensionPair`) — but its formula-level
`iInf`/`iSup` are restricted to `[Finite β]`, so there is no Lω₁ω or L∞ω, no Scott analysis, and no
Karp characterization. Mathlib does supply the ambient stack this rests on: ordinals and `ω₁`
(`Ordinal.omega 1`), ordinal recursion (`Ordinal.limitRecOn`, `Order.IsSuccLimit`), and the partial-
isomorphism API.

The summit is **Scott's isomorphism theorem** for countable relational languages: every countable
structure is pinned, up to isomorphism among countable structures, by a single Lω₁ω sentence, and its
Scott rank is below `ω₁`. **Karp's theorem** (L∞ω-equivalence ⟺ potential isomorphism) is the
supporting milestone on the way there.

This roadmap is deliberately scoped to that spine. Admissible sets / Barwise compactness, the
invariant descriptive set theory of countable structures (López–Escobar, Silver / G₀ / Glimm–Effros,
Morley counting), Ehrenfeucht–Mostowski stretching / Erdős–Rado / Morley–Hanf, many-sorted model
theory, and Lκλ are **out of scope here** — see [Out of scope](#out-of-scope-for-this-roadmap).

A Lean formalization exists at
[`cameronfreer/infinitary-logic`](https://github.com/cameronfreer/infinitary-logic) and is a
migration source, proof-script reference, and API-warning map. The migration source and design
evidence are not the specification; each milestone below is grounded in current Mathlib imports or
in a separately named object built earlier in the roadmap.

Suggested homes:

```text
TauCeti/ModelTheory/Infinitary/      -- Lω₁ω and L∞ω syntax, semantics, operations
TauCeti/ModelTheory/BackAndForth/    -- EF games, potential isomorphism, Karp
TauCeti/ModelTheory/Scott/           -- internal stabilization, Scott formulas, Scott sentences, Scott rank
```

## Coordination

Where this roadmap overlaps active Mathlib or student-project work, contributors should follow the
repository process in the root README — checking the relevant Zulip threads, Mathlib PRs, and public
project trackers, and asking the named contributors before starting parallel work.

* **Infinitary syntax.** This roadmap uses the fixed-carrier syntax `BoundedFormulaInf L ι α n`,
  with `BoundedFormulaω` as the definitional `ι := ℕ` specialization and `IndexCoding`/`reindex`
  for carrier transport. The design was suggested on the Zulip discussion
  [ModelTheory: API for infinitary formulas of L_{∞,ω}](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/ModelTheory.3A.20API.20for.20infinitary.20formulas.20of.20L_.7B.E2.88.9E.2C.CF.89.7D).
  The open Mathlib PR
  [mathlib4#42758](https://github.com/leanprover-community/mathlib4/pull/42758) proposes the
  syntax and semantics: `BoundedFormulaInf` in the `FirstOrder.Language` namespace, the
  `BoundedFormulaω` abbreviation (with `Formulaω` and `Sentenceω` defined through it), the derived
  connectives (`verum`, `not`, `ex`) with `alls`/`exs`, `Realize` with its simp lemmas, and the
  finitary embedding `BoundedFormula.toInf` with `realize_toInf`. Follow its names and shapes.
  The codings, transport, and quantifier rank of Beat 2 and Beat 3 (`IndexCoding`, `iInfAlong`,
  `reindex`, `qrank`) are not yet in a Mathlib PR; the migration source's Mathlib fork contains
  them (see Migration source), and Tau Ceti should follow those shapes. Everything else in
  Layer 0 — the carrier-generic operations, `freeVarSupport`, and their general realization laws —
  is Tau Ceti work. Build all of it here now; if Mathlib later supplies the corresponding API,
  replace the local definitions with imports and adapt to Mathlib's names.
* Cantor–Bendixson / perfect-kernel / ordinal-stabilization infrastructure (the Zulip
  [Cantor-Bendixson analysis](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/Cantor-Bendixson.20analysis)
  thread; not in the pinned Mathlib): this roadmap does not claim the general theory. The
  Scott-analysis layers state only the internal-stabilization dependency they need; if Mathlib later supplies the general stabilization API, replace the local statement with
  imports.

## The end goal (v1)

For a countable relational language `L` and a countable structure `M`, prove **Scott's isomorphism
theorem**: `M` has an Lω₁ω sentence true in exactly the countable structures isomorphic to `M`, and
its Scott rank is below `ω₁`.

```lean
-- the shape we are building toward, once the definitions land in TauCeti:
-- theorem scott_isomorphism
--     {L : FirstOrder.Language} [L.IsRelational] [Countable (Σ n, L.Relations n)]
--     (M : Type) [L.Structure M] [Countable M] :
--     ∃ σ : L.Sentenceω,
--       M ⊨ σ ∧
--       ∀ (N : Type) [L.Structure N] [Countable N], (N ⊨ σ ↔ Nonempty (M ≃[L] N))
--
-- theorem internalScottRank_lt_omega_one
--     {L : FirstOrder.Language} (M : Type) [L.Structure M] [Countable M] :
--     internalScottRank L M < ω₁
```

The relational restriction is the honest v1 generality: the atomic diagram of a tuple is then
determined by equality and relation facts, which is what the back-and-forth analysis needs. Languages
with function and constant symbols are out of scope here (a separate roadmap PR; see
[Out of scope](#out-of-scope-for-this-roadmap)). The countability hypotheses are kept as separate,
explicit instance arguments (`[L.IsRelational]`, `[Countable (Σ n, L.Relations n)]`, `[Countable M]`),
never bundled into a single class.

## The library spine

The deliverable is a reusable infinitary-logic spine, not a proof script for one theorem. The spine is:

1. infinitary syntax and semantics — the fixed-carrier `BoundedFormulaInf L ι α n`, with Lω₁ω as the
   definitional `ι := ℕ` specialization `BoundedFormulaω`, the carrier-coding/transport algebra
   (`IndexCoding`, coded connectives, `reindex`), the finitary embedding, and the substitution /
   relabel / recursion API every later theorem inherits;
2. back-and-forth systems and EF games at finite and ordinal length, potential isomorphism, and Karp's
   theorem;
3. internal stabilization: the back-and-forth refinement of a countable structure's own tuples
   stabilizes below `ω₁`;
4. Scott rank, canonical Scott formulas, and Scott sentences.

Each item is worth building for its own sake. Scott's theorem is the summit; Karp is the supporting
milestone.

## Standing hypotheses

Spell hypotheses out; do not bundle them. Pin the conventions below once, up front, so implementors do
not improvise.

* **Languages.** The core is relational languages. Carry `[L.IsRelational]`, `[Countable M]`, and
  `[Countable (Σ n, L.Relations n)]` as separate, explicit instance hypotheses, and only where a
  statement needs them — there is no bundled `CountableLanguage` class. `[L.IsRelational]` is
  load-bearing (it makes a tuple's atomic diagram a matter of equality and relations) and so must
  appear in the Lean statements, not only the prose. The general Karp theorem `karp_theorem_at`
  needs no countability: it holds for structures of any cardinality (see the `ℵ₁` dense linear
  orders in the worked examples). Countability enters with its isomorphism corollary
  `countable_potentialIso_iff_iso` (`[Countable M]`, `[Countable N]`) and with the Scott layers,
  whose canonical formulas conjoin over the elements of `M` and over the atomic formulas of `L`.
  Function and constant symbols are out of scope here (a separate roadmap PR).
* **`ω₁`.** Use `Ordinal.omega 1`, with the scoped notation `ω₁` from
  `Mathlib/SetTheory/Cardinal/Aleph.lean` (`ω_` is `Ordinal.omega`; `ω₁` is `ω_ 1`, "the first
  uncountable ordinal"). Do not introduce a bespoke `CountableOrdinal := {α // α < ω₁}` subtype; carry
  `α < ω₁` as an explicit hypothesis, the way Mathlib carries explicit bounds rather than a `Bounded`
  predicate.
* **Infinitary syntax — ONE fixed-carrier inductive, not an extension of `BoundedFormula`.**
  `BoundedFormulaInf L ι α n` is a new inductive over `FirstOrder.Language` whose
  branching carrier `ι : Type uι` is a parameter of the whole formula: `iSup`/`iInf` take
  `φs : ι → BoundedFormulaInf L ι α n`, so the type lives in `Type (max u v u' uι)` — no `+ 1`
  universe bump. Pin the shapes exactly: **Lω₁ω is the definitional specialization**
  `BoundedFormulaω := BoundedFormulaInf L ℕ` (an `abbrev`, not a second inductive), at exactly the
  finitary `BoundedFormula` universe; arbitrary families at other carriers enter through **coded
  connectives** `iInfAlong`/`iSupAlong` along an `IndexCoding ι κ` (an injection with a decoder,
  left-inverse on encoded values — `Encodable` is the codomain-`ℕ` case), and whole formulas
  transport between carriers by `reindex` with functoriality and realization-preservation laws. The
  finitary `BoundedFormula` maps in via the carrier-generic `toInf`, with realization
  compatibility. One `Realize` recursion serves every carrier.
* **Carriers (Karp).** Karp's *backward* direction indexes conjunctions by structure elements, so
  the headline statement is at a **common carrier**: `karp_theorem_at` takes codings
  `IndexCoding M κ` and `IndexCoding N κ` of both structures into one carrier `κ` and concludes
  potential isomorphism ↔ agreement on `κ`-carried sentences (`InfEquivAt`), with `κ := M ⊕ N` the
  canonical instance. Full L∞ω-equivalence quantifies over carriers OUTSIDE the syntax
  (`InfEquivW := ∀ κ : Type w, InfEquivAt L κ M N`); it is implied by any single coded carrier.
* **Countability comes from the structure, not from a universal code language.** The Scott
  argument counts pairs of tuples of the one countable structure `M` under analysis
  (`Σ n, (Fin n → M) × (Fin n → M)` is countable), and its canonical formulas conjoin over elements
  of `M`. No countable formula language that depends only on `L` can capture back-and-forth
  equivalence for every countable structure: agreement on such a family would give Scott sentences
  of uniformly bounded complexity, and Scott complexity is unbounded already for linear orders.
  In particular, formulas whose conjunctions and disjunctions are finite lists are equivalent to
  first-order formulas, so agreement on them does not imply `BFEquiv` (see the Layer 2 API
  warning).
* **Scott rank.** Ship one rank convention, defined inside the structure from finite tuples:
  `orbitRank a` is the least `α` such that every tuple `b` of `M` with `BFEquiv α n a b` has
  `BFEquiv γ n a b` at **every** level `γ` (for countable `M`: the level-`α` class of `a` is its
  automorphism orbit), and
  `internalScottRank M = SR(M) = sup_a (orbitRank a + 1)` over tuples of every length, valued in
  `Ordinal.{w}` for `M : Type w`. Keep the all-levels condition: a per-tuple one-step condition
  ("`BFEquiv α n a b` implies `BFEquiv (α + 1) n a b`") is not equivalent. In `K₂ ⊔ K₃`, every
  vertex is `BFEquiv 1` to a vertex `a` of `K₂`, so the one-step condition holds for `a` at `0`, yet a
  vertex of `K₃` is `BFEquiv 1` but not `BFEquiv 2` to `a`, so `orbitRank a = 2`. External rank and
  Scott-height conventions, which compare against other countable structures, are not targets of
  this roadmap.
* **Scott is unconditional.** State Scott's theorem and the rank bound without a counting
  hypothesis: internal stabilization (Layer 2) is proved, not assumed.
* **Names are target shapes.** The declaration names below are intended shapes, not final namespace
  commitments; audit them against Mathlib conventions before implementation.

## What Mathlib already has (consume)

* **First-order logic:** `FirstOrder.Language`, `Structure` (`Mathlib/ModelTheory/Basic.lean`);
  `Term`, `BoundedFormula`, `Formula`, `Sentence`, `Theory` (`Mathlib/ModelTheory/Syntax.lean`);
  satisfaction `BoundedFormula.Realize`, `Sentence.Realize`, `Theory.Model`
  (`Mathlib/ModelTheory/Semantics.lean`); `Substructure` (`Substructures.lean`); elementary maps
  (`ElementaryMaps.lean`); `Language.card` (`Basic.lean`).
* **Back-and-forth and countable generation:** `PartialEquiv` (`M ≃ₚ[L] N`), `FGEquiv`, and
  `IsExtensionPair` (`Mathlib/ModelTheory/PartialEquiv.lean`), including `embedding_from_cg` /
  `equiv_between_cg` (an equivalence between countably generated structures from an extension pair —
  the `S = Set.univ` back-and-forth dovetailing, with `Order.sequenceOfCofinals` as its reusable
  engine);
  the countably-generated-structure API `Structure.CG`, `Structure.cg_of_countable`,
  `Structure.cg_iff_countable` (with its function-symbol-countability hypothesis;
  `Mathlib/ModelTheory/FinitelyGenerated.lean`); `DirectLimit`
  (`DirectLimit.lean`); Fraïssé theory (`Fraisse.lean`).
* **Ordinals and cardinals:** `Ordinal.omega0` (`SetTheory/Ordinal/Basic.lean`), `Ordinal.limitRecOn`
  (`SetTheory/Ordinal/Arithmetic.lean`), `Order.IsSuccLimit` (`Order/SuccPred/Limit.lean`);
  `ω₁ = Ordinal.omega 1` and `Cardinal.aleph0` (`SetTheory/Cardinal/Aleph.lean`, `Defs.lean`).
* **`Encodable`:** `Encodable` (`Mathlib/Logic/Encodable/Basic.lean`) is the codomain-`ℕ` instance
  of the carrier codings (`IndexCoding.ofEncodable`).
* **Combinatorics:** `SimpleGraph` (`Combinatorics/SimpleGraph/Basic.lean`) for the graph worked
  example.

Consume these directly rather than re-proving Mathlib's first-order, ordinal, or partial-isomorphism
infrastructure.

## What is missing (build here)

* Lω₁ω and L∞ω syntax and semantics (Mathlib's formula `iInf`/`iSup` require `[Finite β]`);
* back-and-forth at finite and ordinal length, potential isomorphism, and Karp's theorem;
* internal stabilization of the back-and-forth refinement;
* Scott rank, canonical Scott formulas, and Scott sentences.

Every item above is a target in some layer below; nothing is left as a gap to be wished into existence.

## Migration source

A Lean formalization of this theory exists at
[`cameronfreer/infinitary-logic`](https://github.com/cameronfreer/infinitary-logic); use checkpoint
[`a739107`](https://github.com/cameronfreer/infinitary-logic/tree/a739107bdbcdfc8c228f3d80ed28b32c6b5e430a)
for proof scripts and the map below. It runs on the fixed-carrier syntax, which it imports from a
Mathlib fork pinned at
[`cameronfreer/mathlib4@4038001`](https://github.com/cameronfreer/mathlib4/tree/4038001c613926e4d3f3791977380be96a19c192/Mathlib/ModelTheory/Infinitary).
Neither source is the specification; the map is "where to look", not "what is correct".

* Layer 0: the fork's five modules `Mathlib/ModelTheory/Infinitary/{Syntax, Semantics, IndexCoding,
  Reindex, QuantifierRank}.lean` (the first two are the content of mathlib4#42758), and
  `InfinitaryLogic/Lomega1omega/Operations.lean` for substitution, relabeling, and `castLE`, which
  exist there only at carrier `ℕ` and with special-case realization lemmas.
* Layer 1: `InfinitaryLogic/Scott/BackAndForth.lean` (`BFEquiv` and its laws);
  `InfinitaryLogic/ModelTheory/NullaryTags.lean` (the nullary-relation regressions);
  `InfinitaryLogic/Karp/PotentialIso.lean`, `Karp/CarrierTheorem.lean` (`karp_theorem_at`), and
  `Karp/CountableCorollary.lean`. The source's `PotentialIso` is the tuple presentation, a
  structure requiring `[L.IsRelational]`; this roadmap's `PotentialIso` is the `FGEquiv`
  presentation, related to it by `potentialIso_iff_exists_isTupleBFSystem`. Its ω-round strategy
  object is a family of unrelated finite-length strategies, not the coherent strategy of Layer 1.
* Layer 2: `InfinitaryLogic/Scott/Sentence.lean` (`SelfStabilizesCompletely`,
  `exists_complete_self_stabilization`).
* Layer 3: `InfinitaryLogic/Scott/AtomicDiagram.lean` and `Scott/Formula.lean`
  (`realize_scottFormula_iff_BFEquiv`, with the tuple in free variables rather than bound
  positions); `Scott/OrbitRank.lean` (`orbitRank`, `internalScottRank`, with no comparison to
  other rank conventions) and `scripts/check_orbit_rank_regressions.lean` (the `K₂ ⊔ K₃`
  regression). The source's Scott sentence (`Scott/Sentence.lean`, `Scott/RefinementCount.lean`)
  is indexed by an externally defined ordinal and proved through an internal-to-external transfer;
  this roadmap's Scott sentence is indexed by internal stabilization instead, so that part is new
  work. `Scott/Code.lean` is marked legacy and off-path in the source and is not a migration
  target.

Credit `cameronfreer/infinitary-logic` in each ported or adapted file, and record when a Tau Ceti file
intentionally diverges from this source API.

---

## The build, in layers

The ordering below is the dependency order: no layer depends on a later one. As each layer makes the
next layer's *types* expressible in `TauCeti/`, state its milestones in `Suggested.lean` with `sorry`
(or, for shapes whose machinery is not yet grounded, in fenced code blocks here). Each layer is a full
development — object API, milestone theorems, and acceptance examples — not a single theorem.

| Layer | Consumes | Builds | Acceptance check (compiles without later layers) |
|---|---|---|---|
| L0 | Mathlib `FirstOrder.Language`, `Term`, `BoundedFormula`, `Encodable` | the fixed-carrier syntax + ω abbrev, `Realize`, `IndexCoding` + `iInfAlong`/`iSupAlong` + `reindex`, `toInf`, substitution/relabel/recursion API | `realize_toInf` on a finitary `φ` |
| L1 | L0; Mathlib `FGEquiv`, `IsExtensionPair`, and the countably-generated-structure API | `BFEquiv`, `PotentialIso`, tuple systems, Karp, `countable_potentialIso_iff_iso` | two empty structures differing on a nullary relation are not `BFEquiv 0` |
| L2 | L0, L1; Mathlib `Countable`, `Ordinal.omega` | `SelfStabilizesCompletely`, upward propagation, `exists_complete_self_stabilization` | every pure set self-stabilizes completely at `0` |
| L3 | L1, L2 | `atomicDiagram`, `scottFormula`, `realize_scottFormula_iff_bfEquiv`, `scottSentenceAt`, `scottSentence`, `scott_isomorphism`, `internalScottRank`, `internalScottRank_lt_omega_one` | the Scott sentence of a fixed finite structure |

### Layer 0: infinitary syntax and semantics

Suggested home:

```text
TauCeti/ModelTheory/Infinitary/Syntax.lean
TauCeti/ModelTheory/Infinitary/Semantics.lean
TauCeti/ModelTheory/Infinitary/Operations.lean
```

This layer has the largest blast radius — every later theorem inherits its binding, substitution, and
recursion choices — so build it as a real development, not a bare inductive. It divides into three
beats, each a coherent reviewable unit:

**Beat 1 — syntax and semantics.**

* `BoundedFormulaInf L ι α n`, ONE inductive whose `iSup`/`iInf` branch over the fixed carrier
  `ι : Type uι` (`φs : ι → BoundedFormulaInf L ι α n`), in `Type (max u v u' uι)`; the definitional
  specializations `BoundedFormulaω := BoundedFormulaInf L ℕ`, `FormulaInf`/`SentenceInf`,
  `Formulaω`/`Sentenceω`;
* recursion and induction principles suitable for structural operations; tuple-indexed recursive
  constructions use bound-variable positions (`BoundedFormulaInf L ι Empty n`);
* the derived connectives (`not`, `and`, `or`, `ex`, `iff`, `⊤`/`⊥`) by De Morgan, matching
  Mathlib's `BoundedFormula` conventions, plus `alls`/`exs`;
* `Realize`, ONE recursion for every carrier, with simp lemmas for every connective and quantifier —
  each a single statement generic in `ι` and `uι`;
* the finitary embedding `toInf : L.BoundedFormula α n → BoundedFormulaInf L ι α n`, carrier-generic
  (finitary formulas have no infinitary nodes, so one embedding serves all carriers; its
  `ι := ℕ` case is the abbreviation `BoundedFormula.toOmega`), with realization compatibility
  (`realize_toInf`).

**Beat 2 — carrier codings and transport.**

* `IndexCoding ι κ` — encode, decode, decode-encode — with identity, forward composition (`trans`),
  `ofEncodable` (the `Encodable` case) and `ofEncodableWith (e : Encodable ι)` (so an explicit
  encoding does not require a global instance), `ofEquiv`, and the `pad` laws that centralize
  decoder analysis;
* the coded connectives `iInfAlong`/`iSupAlong` (an `ι`-family expressed at carrier `κ` with
  semantically neutral padding) and their realization lemmas;
* whole-formula transport `reindex` with functor laws (`reindex_id`, `reindex_trans`), the
  equivalence round trip (`reindexEquiv`), realization preservation (`realize_reindex`), and
  `reindex_toInf` naturality;
* the uniform companion `BoundedFormulaInf.toOmega` with `BoundedFormulaInf.realize_toOmega`: it
  recodes a whole formula into `ℕ` when its carrier is encodable. Keep it distinct from the
  finitary embedding `BoundedFormula.toOmega` of Beat 1; the two names live in different
  namespaces, so always write them qualified.

**Beat 3 — derived APIs.**

* **substitution, relabeling, `castLE`, and the free-variable support** as named API (not buried),
  each defined once for every carrier `ι` rather than only at `ℕ`, and each with its **general**
  realization law: `realize_subst`; `realize_relabel` for an arbitrary relabeling
  `g : α → β ⊕ Fin n`, not only special cases; `realize_castLE` for arbitrary `m ≤ n`; and for the
  support `freeVarSupport`, the law `realize_congr_freeVarSupport` that realization depends only on
  the valuation on the support. The support is finite for finitary formulas and countable for
  ℕ-carried `iSup`/`iInf`, so use a set/`support` formulation, not a `Finset`. The derived
  connectives `and`, `or`, and `iff` are likewise defined at every carrier;
* quantifier rank, valued in the carrier's ordinal universe, with the exact transport milestone
  `qrank_reindex` along `reindex`, stated with `Ordinal.lift`.

Two further APIs are not targets of this roadmap, because nothing on the path to the Scott summit
uses them: a formula-sensitive countability predicate (bounding the branch families one formula
uses, with recoding of countable formulas into `BoundedFormulaω`), and language-map compatibility
(`LHom.onBoundedFormulaInf` with a naturality law for `reindex`). Both were built experimentally in
the migration source and left out after audits of their consumers found none; they are not
defective, just unnecessary here.

Key milestones:

```lean
BoundedFormulaInf.Realize
BoundedFormulaInf.rec       -- the recursion/induction principle
BoundedFormulaInf.realize_iSup   -- one statement, generic in the carrier
BoundedFormulaInf.realize_iInf
IndexCoding
IndexCoding.ofEncodableWith
BoundedFormulaInf.iInfAlong
BoundedFormulaInf.realize_iInfAlong
BoundedFormulaInf.reindex
BoundedFormulaInf.realize_reindex
BoundedFormulaInf.toOmega
BoundedFormulaInf.realize_toOmega
subst
realize_subst
relabel
realize_relabel
castLE
realize_castLE
freeVarSupport
realize_congr_freeVarSupport
qrank_reindex
toInf
realize_toInf
```

**Acceptance example:** `realize_toInf` for a single finitary `φ` — compiles once Beat 1 exists,
before any coding, back-and-forth, or Scott machinery.

⚠ **API warning.** Do not model the infinitary connectives by extending Mathlib's finitary
`BoundedFormula`; it is the wrong object (its `iInf`/`iSup` need `[Finite β]`). The natural Lean
object is the fixed-carrier inductive, related to the finitary one only by the embedding `toInf`.

⚠ **API warning.** Keep the carrier constructors and the codings distinct: `iSup`/`iInf` over the
fixed carrier are the kernel-level constructors; `iInfAlong`/`iSupAlong` along an `IndexCoding` are
derived. Do not bake an encoding choice into the constructors, and do not special-case `Encodable` —
it is one family of codings among several (`ofEquiv`, sum injections, subtype inclusions).

⚠ **Universe discipline.** `BoundedFormulaInf L ι α n : Type (max u v u' uι)`, with `ι := ℕ` at
exactly the finitary `BoundedFormula` universe. A formula's carrier is part of its type, so
statements ranging over "all sentences at carrier `κ`" fix `κ` (and its universe) explicitly, and
cross-carrier operations go through `IndexCoding` and `reindex`. Membership of a formula in a
"fragment" is presentation-sensitive (the SAME mathematical disjunction can be written at different
carriers), although `reindex` preserves semantics; the coded connectives are how index families of
other sizes are expressed at a fixed carrier.

### Layer 1: back-and-forth, potential isomorphism, and Karp's theorem

Suggested home:

```text
TauCeti/ModelTheory/BackAndForth/Game.lean
TauCeti/ModelTheory/BackAndForth/PotentialIso.lean
TauCeti/ModelTheory/BackAndForth/Karp.lean
```

Build on Mathlib's `PartialEquiv` / `FGEquiv` / `IsExtensionPair`:

* `BFEquiv α n a b`, the ordinal-indexed back-and-forth equivalence of tuples `a : Fin n → M` and
  `b : Fin n → N`, by `limitRecOn`, with the recursion pinned exactly:
  * at `0`, `SameAtomicType a b`: agreement on every `AtomicIdx L n`, meaning equalities between
    positions and relation symbols applied to positions, **nullary relation symbols included**;
  * at a successor, `BFEquiv α n a b` **and** the forth clause (every `m : M` has some `m' : N`
    with `BFEquiv α (n + 1) (snoc a m) (snoc b m')`) **and** the symmetric back clause;
  * at a limit, `BFEquiv β n a b` for every `β` below.

  Retaining the previous level at successors is part of the definition. Without it, the successor
  condition would be vacuous on empty structures, whose atomic types can still differ through
  nullary relations. The laws `BFEquiv.succ` and `BFEquiv.limit`, monotonicity and symmetry are
  targets, not assumptions. Include the regression that two empty structures differing on a
  nullary relation are not `BFEquiv` at any level;
* the finite EF game and the ω-round game, and the coherent-strategy object, with the quantifier-swap
  obstruction between `BFEquiv ω` and a coherent ω-strategy stated explicitly. A strategy for the
  ω-round game is a single function on finite play histories, or equivalently a family of
  finite-round strategies with an explicit compatibility condition between lengths. A family that
  chooses an unrelated strategy for each finite length is not a coherent strategy: by classical
  choice such a family follows from `BFEquiv k` at every finite `k`, so it says nothing beyond
  `BFEquiv ω`;
* potential isomorphism as an explicit **back-and-forth system**: a nonempty set `S` of `FGEquiv`s
  closed under two-sided extension *within `S`*, with its basic API — `potentialIso_of_equiv`
  (restrict an isomorphism to finitely generated substructures), symmetry (`PotentialIso.symm`,
  flip the system), transitivity (`PotentialIso.trans`, compose systems) — and the one-way
  compatibility bridge `potentialIso_of_isExtensionPair` from Mathlib's global `IsExtensionPair`
  (the `S = Set.univ` case), which keeps its two extension hypotheses and its explicit initial
  partial equivalence;
* the **tuple presentation** `IsTupleBFSystem`: a set of pairs of equal-length tuples containing
  the empty pair, preserving atomic type, and closed under forth and back extension. The named
  adaptation target `potentialIso_iff_exists_isTupleBFSystem` shows that, for a relational
  language, the two presentations determine each other, since a finitely generated substructure
  is then the finite set of its generators. Karp's theorem and the Scott sentence (Layer 3) are
  most naturally proved with tuple systems, while `PotentialIso` stays in Mathlib's `FGEquiv`
  vocabulary; this bridge lets each side use its natural form;
* the **countable-generation bridge** from `[Countable M]` to Mathlib's `Structure.CG`, so
  `equiv_between_cg` / `embedding_from_cg` apply: this is Mathlib's `Structure.cg_of_countable`, so
  consume it rather than restating it. Note that `Structure.cg_iff_countable` additionally needs
  countable function symbols (free for relational `L`, so do not state the iff unguarded);
* `InfEquivAt L κ M N`, L∞ω-elementary equivalence at a fixed carrier `κ` (agreement on all
  `κ`-carried sentences), with `InfEquivW` (external quantification over all carriers in the
  structure universe) as the full notion and `InfEquivAt.of_reindex` transporting agreement along
  codings.

Karp's theorem and its corollaries:

```lean
SameAtomicType
BFEquiv
BFEquiv.succ            -- previous level ∧ forth ∧ back
BFEquiv.limit
BFEquiv.monotone
potentialIso_of_equiv   -- an isomorphism is a potential isomorphism
PotentialIso.symm       -- symmetry: flip the system
PotentialIso.trans      -- transitivity: compose the systems
IsTupleBFSystem
potentialIso_iff_exists_isTupleBFSystem  -- relational L: FGEquiv systems ↔ tuple systems
potentialIso_iff_BFEquiv_all
karp_theorem_at         -- codings of M and N into a common carrier κ:
                        --   potential isomorphism ↔ InfEquivAt κ  (headline)
karp_theorem            -- the packaged corollary: potential isomorphism ↔ InfEquivW,
                        --   via the canonical carrier M ⊕ N and its two sum codings
potentialIso_of_isExtensionPair  -- one-way bridge from Mathlib's global extension property (S = univ)
countable_potentialIso_iff_iso   -- on countable structures, potential iso ↔ isomorphism
```

**Acceptance example:** two empty structures that differ on a nullary relation are not `BFEquiv 0`
— compiles on Layer 0 + Mathlib, before the Karp summit.

⚠ **API warning.** Do **not** define potential isomorphism by Mathlib's `IsExtensionPair`: that
property quantifies over *all* finitely generated partial equivalences (the
ultrahomogeneity-flavored condition) and is strictly stronger than the existence of *some*
back-and-forth system. Counterexample: `(ℕ, <)` is isomorphic to itself, yet the one-point partial
equivalence `1 ↦ 0` extends to nothing whose domain contains `0`, so `IsExtensionPair (ℕ,<) (ℕ,<)`
fails — an `IsExtensionPair`-based definition would make both `karp_theorem` and
`countable_potentialIso_iff_iso` false. `IsExtensionPair` enters only through the one-way
`S = Set.univ` bridge; `equiv_between_cg` is the proof template whose `S`-relative dovetailing
(via its engine `Order.sequenceOfCofinals`) the countable corollary actually needs.

⚠ **API warning.** State Karp at a **common carrier**, not per-universe: the backward direction
builds its separating conjunctions indexed by structure elements, which the fixed-carrier syntax
expresses as `iInfAlong` at any carrier `κ` equipped with codings `IndexCoding M κ` and
`IndexCoding N κ`. Keep `karp_theorem_at` (arbitrary common carrier) as the headline — the choice
`κ := M ⊕ N` is a canonical instance, not a mathematical requirement — and derive the
`InfEquivW` packaging as a corollary. The carrier is an explicit argument, and agreement at one
coded carrier already yields agreement at all.

### Layer 2: internal stabilization

Suggested home:

```text
TauCeti/ModelTheory/Scott/Stabilization.lean
```

This is the "connect to ground" layer for the Scott summit. Fix one countable structure `M` and
compare tuples of `M` with tuples of `M`. Build:

* `SelfStabilizesCompletely M α`: for every `n` and all `a a' : Fin n → M`,
  `BFEquiv α n a a' ↔ BFEquiv (succ α) n a a'`. This is one-step stabilization, simultaneously
  for every tuple length;
* upward propagation `SelfStabilizesCompletely.bfEquiv_of_le`: stabilization at `α` makes
  `BFEquiv α` imply `BFEquiv β` for every `β ≥ α`, by transfinite induction (the successor step
  applies stabilization inside `M` to the forth and back clauses);
* `exists_complete_self_stabilization`: for countable `M` there is `α < ω₁` at which
  `SelfStabilizesCompletely M α` holds. The relation "`BFEquiv α` between tuples of `M`" is
  antitone in `α` and lives on the countable set `Σ n, (Fin n → M) × (Fin n → M)`. If it changed at
  uncountably many successor stages below `ω₁`, choosing a pair lost at each such stage would give
  uncountably many distinct elements of that countable set. This needs only `[Countable M]`: no
  relational hypothesis and no countable language;
* the least internal stabilization ordinal `selfStabilizationOrdinal M`, written `s(M)`, with
  `selfStabilizationOrdinal_spec`: for countable `M`, `s(M) < ω₁` and `M` stabilizes at `s(M)`.

Key milestones:

```lean
SelfStabilizesCompletely
SelfStabilizesCompletely.bfEquiv_of_le
exists_complete_self_stabilization
selfStabilizationOrdinal
selfStabilizationOrdinal_spec
```

**Acceptance example:** every pure set (the empty language) self-stabilizes completely at `0`,
since two tuples with the same equality pattern are related by a permutation — compiles on
Layers 0–1, before any Scott formula.

⚠ **API warning.** The stabilization is **internal**: both tuples lie in `M`. Tuples of a varying
external structure `N` do not form one countable set merely because each `N` is countable, so do
not claim external refinement counting from the cardinality of `M`. The comparison with other
structures enters through the Scott sentence in Layer 3, whose models carry a back-and-forth
system.

⚠ **API warning.** Do not route this layer through a countable formula-code type that depends only
on `L`. Codes whose conjunctions and disjunctions are finite lists are equivalent to first-order
formulas, and agreement on them does not imply `BFEquiv`. Take unary predicates `P_i` (`i ∈ ℕ`),
let `M` be `Finset ℕ` with `P_i(s) ↔ i ∈ s`, and let `N` add one element satisfying every `P_i`.
Every finite reduct of `M` is isomorphic to the matching reduct of `N`, so the two structures agree
on all first-order sentences, yet `N ⊨ ∃ x, ⋀ᵢ P_i(x)` and `M` does not; `BFEquiv 1` fails on the
empty tuples. No richer countable family depending only on `L` repairs this (see Standing
hypotheses). A countable fragment chosen for a particular structure is a different interface.

### Layer 3: Scott rank, canonical formulas, and Scott's theorem (v1 summit)

Suggested home:

```text
TauCeti/ModelTheory/Scott/Formula.lean
TauCeti/ModelTheory/Scott/Rank.lean
TauCeti/ModelTheory/Scott/Sentence.lean
```

Build, consuming Layer 2's internal stabilization:

* the atomic diagram `atomicDiagram a`: over every `AtomicIdx L n`, the atomic formula if it holds
  of `a` and its negation otherwise — a countable conjunction because `L`'s relations are countable;
* the canonical Scott formulas `scottFormula a α : BoundedFormulaω L Empty n` (written `θ^M_{α,a}`),
  for a countable `M`, with the tuple in bound positions, by ordinal recursion mirroring `BFEquiv`:
  the atomic diagram at `0`; at a successor, the previous formula, the forth clause
  `⋀_{c ∈ M} ∃ y, θ^M_{β, a c}`, and the back clause `∀ y, ⋁_{c ∈ M} θ^M_{β, a c}`; at a limit
  `β < ω₁`, the conjunction of the earlier stages. Every index family (atomic indices, elements of
  `M`, ordinals below `β`) is coded into the fixed carrier `ℕ` with `IndexCoding.ofEncodableWith`;
  limits `≥ ω₁` never arise and may be sent to `⊤`;
* the characteristic theorem `realize_scottFormula_iff_bfEquiv`: for **every** structure `N`, of any
  cardinality and in any universe, and every `α < ω₁`, a tuple `b` of `N` satisfies `θ^M_{α,a}`
  exactly when `BFEquiv α n a b`. That `a` satisfies its own formula is the special case `b = a`;
* the Scott sentence at a level, `scottSentenceAt M α`: the formula `θ^M_{α,∅}` of the empty tuple,
  together with, for every `n` and every `a : Fin n → M`, the universal closure of
  `θ^M_{α,a} → θ^M_{α+1,a}`. Specify it for an arbitrary internally stabilizing `α < ω₁` and prove,
  in this order:
  * `realize_scottSentenceAt_self`: `M` satisfies it, since stabilization turns `BFEquiv α` between
    tuples of `M` into `BFEquiv (α + 1)`;
  * `isTupleBFSystem_of_realize_scottSentenceAt`: in **any** model `N`, the pairs related by
    `BFEquiv α` form a tuple back-and-forth system (the implications supply the forth and back
    steps). This needs neither stabilization nor countability of `N`; with
    `potentialIso_iff_exists_isTupleBFSystem` it makes every model potentially isomorphic to `M`;
  * `realize_scottSentenceAt_iff`: for countable `N`, satisfaction is equivalent to
    `Nonempty (M ≃[L] N)`, by `countable_potentialIso_iff_iso` forward and invariance of
    satisfaction under isomorphism backward;
* the named Scott sentence `scottSentence M := scottSentenceAt M (selfStabilizationOrdinal M)`,
  choosing the least internal stabilization ordinal (Layer 2), and the unconditional Scott
  isomorphism theorem `scott_isomorphism` — no counting hypothesis, because internal stabilization
  is proved in Layer 2. The choice of ordinal is separate from the construction, so any other
  stabilizing `α < ω₁` gives an equally valid Scott sentence;
* the rank convention of the Standing hypotheses: `orbitStable`, `orbitRank`, and
  `internalScottRank`, with its comparison to Layer 2's `s(M)`, after aligning universes (both in
  `Ordinal.{w}`):
  * `selfStabilizationOrdinal_eq_iSup_orbitRank`: `s(M) = sup_a orbitRank a`, because simultaneous
    internal stabilization is the same as stabilization of every tuple's back-and-forth class;
  * `selfStabilizationOrdinal_le_internalScottRank` and
    `internalScottRank_le_succ_selfStabilizationOrdinal`: `s(M) ≤ SR(M) ≤ s(M) + 1`;
  * `internalScottRank_lt_omega_one`: `SR(M) < ω₁` for countable `M`, from `s(M) < ω₁`;
  * numerical checks: every pure set, finite or infinite, has `SR = 1`
    (`internalScottRank_pureSet`), and `K₂ ⊔ K₃`, which is not homogeneous, has `SR = 3`
    (`internalScottRank_completeGraph_two_sum_three`): a vertex has orbit rank `2`, and every
    tuple's class is its orbit at level `2`.

Key milestones:

```lean
atomicDiagram
scottFormula
realize_scottFormula_iff_bfEquiv
scottSentenceAt
realize_scottSentenceAt_self
isTupleBFSystem_of_realize_scottSentenceAt
realize_scottSentenceAt_iff
scottSentence
scott_isomorphism
orbitStable
orbitRank
internalScottRank
selfStabilizationOrdinal_eq_iSup_orbitRank
selfStabilizationOrdinal_le_internalScottRank
internalScottRank_le_succ_selfStabilizationOrdinal
internalScottRank_lt_omega_one
internalScottRank_pureSet
internalScottRank_completeGraph_two_sum_three
```

**Acceptance example:** the Scott sentence of a fixed finite structure (finite Scott rank) — the
smallest end-to-end instance of the summit, once Layer 3 exists, using no later layers.

## Worked examples

Discharge these alongside the layers; they check that the API describes real structures, not just the
final theorems.

* A finite structure has finite Scott rank, in any countable relational language. If the language
  is also **finite**, a finite structure's Scott sentence is equivalent to a first-order sentence.
  The first-order claim needs the finite language. With countably many unary predicates `P_i`, the
  one-element structure in which every `P_i` is false has no first-order Scott sentence, even among
  countable structures: a first-order sentence mentions only finitely many `P_i`, and making an
  unmentioned `P_j` true gives a non-isomorphic model of it. Its infinitary Scott sentence ("there
  is exactly one element, and every `P_i` is empty") has finite quantifier rank but an infinite
  conjunction. Include this example as a regression check.
* A pure-equality set of size `n`, and a countably infinite pure-equality set, both of Scott rank
  `1` (`internalScottRank_pureSet`).
* The dense linear order without endpoints: ℵ₀-categorical, with its Scott sentence and rank.
* Equivalence relations with `k` classes and with countably many classes of prescribed sizes.
* Simple graphs, including the random graph (ℵ₀-categorical) and a rigid example.
* The classic Lω₁ω sentence whose countable models are exactly the well-orders of `ℕ` of a fixed order
  type — a property with no first-order axiomatization.
* First-order elementary equivalence is strictly weaker than `L∞ω`-equivalence: e.g. `(ℤ, <)` and
  `(ℤ + ℤ, <)` (one versus two `ℤ`-blocks) are countable, elementarily equivalent, and non-isomorphic —
  hence, on countable structures, not `L∞ω`-equivalent.
* The countable corollary of Karp: on countable structures, `L∞ω`-equivalence, potential isomorphism,
  and isomorphism all coincide. The strictness lives above `ℵ₀`: two non-isomorphic dense linear orders
  without endpoints of size `ℵ₁` are potentially isomorphic by the order back-and-forth — hence
  `L∞ω`-equivalent — but not isomorphic, since Karp delivers a potential isomorphism, which need not be
  an isomorphism for uncountable structures.

## Out of scope for this roadmap

The following topics are not targets of this roadmap; they belong to separate roadmaps.

* Model existence and downward Löwenheim–Skolem for countable Lω₁ω fragments.
* Admissible sets and Barwise compactness.
* Ehrenfeucht–Mostowski stretching, partition calculus (Ramsey / Erdős–Rado), and Morley–Hanf.
* Invariant descriptive set theory of countable structures: structure coding, satisfaction and
  isomorphism Borelness, López–Escobar, the Silver / G₀ / Glimm–Effros dichotomies, and Morley counting.
* Many-sorted model theory; other infinitary logics Lκλ; effective Scott analysis.
* External Scott-rank and Scott-height conventions, which compare a structure against other
  countable structures, and their comparisons with `internalScottRank`.

Relationalization of functions/constants is deliberately separate: it depends on the relational Scott
spine and should get its own roadmap PR rather than expanding this one.

## Ordering

Layer 0 first: everything needs the infinitary syntax and semantics. Layer 1 (the back-and-forth
recursion, potential isomorphism, and Karp) follows. Layer 2 (internal stabilization) needs only the
back-and-forth recursion from Layer 1, so it can proceed in parallel with the Karp development.
Layer 3 (Scott formulas, the Scott sentence, the Scott isomorphism theorem, and Scott rank) is the
summit, consuming Layers 1 and 2.

## References

* Dana Scott, "Logic with denumerably long formulas and finite strings of quantifiers", in *The Theory
  of Models*, 1965.
* Carol Karp, "Finite-quantifier equivalence", in *The Theory of Models*, 1965.
* H. Jerome Keisler, *Model Theory for Infinitary Logic*, North-Holland, 1971.
* David Marker, *Lectures on Infinitary Model Theory*, Cambridge University Press, 2016.
* Wilfrid Hodges, *Model Theory*, Cambridge University Press, 1993.
* `cameronfreer/infinitary-logic`, Lean 4 formalization of infinitary logic and Scott analysis.

## Acknowledgements

This roadmap uses Cameron Freer's `infinitary-logic` formalization as its primary migration source;
its Lean target signatures were prototyped with the `lean4-skills` tooling and `lean-lsp-mcp`. Ported
files should preserve source attribution and document any substantial API changes made during
migration to Tau Ceti.

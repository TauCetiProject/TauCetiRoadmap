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
TauCeti/ModelTheory/Scott/           -- coded formulas, Scott rank, canonical formulas, Scott sentences
```

## Coordination

Where this roadmap overlaps active Mathlib or student-project work, contributors should follow the
repository process in the root README — checking the relevant Zulip threads, Mathlib PRs, and public
project trackers, and asking the named contributors before starting parallel work.

* **Infinitary syntax.** This roadmap uses the fixed-carrier syntax `BoundedFormulaInf L ι α n`,
  with `BoundedFormulaω` as the definitional `ι := ℕ` specialization and `IndexCoding`/`reindex`
  for carrier transport. The design was suggested on the Zulip discussion
  [ModelTheory: API for infinitary formulas of L_{∞,ω}](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/ModelTheory.3A.20API.20for.20infinitary.20formulas.20of.20L_.7B.E2.88.9E.2C.CF.89.7D)
  and validated against the main downstream consumers in
  [`infinitary-logic` #43](https://github.com/cameronfreer/infinitary-logic/pull/43). Build the
  fixed-carrier API here; if Mathlib later supplies the corresponding API, replace the local
  definitions with imports and adapt to Mathlib's names.
* Cantor–Bendixson / perfect-kernel / ordinal-stabilization infrastructure (the Zulip
  [Cantor-Bendixson analysis](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/Cantor-Bendixson.20analysis)
  thread; not in the pinned Mathlib): this roadmap does not claim the general theory. The
  Scott-analysis layers state only the Scott-specific refinement-stabilization dependency they
  need; if Mathlib later supplies the general stabilization API, replace the local statement with
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
-- theorem scottRank_lt_omega1
--     {L : FirstOrder.Language} [L.IsRelational] [Countable (Σ n, L.Relations n)]
--     (M : Type) [L.Structure M] [Countable M] :
--     scottRank L M < ω₁
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
3. the countable coded-formula proxy and refinement counting that make Scott's theorem unconditional;
4. Scott rank, canonical Scott formulas, and Scott sentences.

Each item is worth building for its own sake. Scott's theorem is the summit; Karp is the supporting
milestone.

## Standing hypotheses

Spell hypotheses out; do not bundle them. Pin the conventions below once, up front, so implementors do
not improvise.

* **Languages.** The core is countable relational languages. Carry `[L.IsRelational]`,
  `[Countable M]`, and `[Countable (Σ n, L.Relations n)]` as separate, explicit instance hypotheses on
  every Scott/Karp/Scott-rank statement — there is no bundled `CountableLanguage` class.
  `[L.IsRelational]` is load-bearing (it makes a tuple's atomic diagram a matter of equality and
  relations) and so must appear in the Lean statements, not only the prose. Function and constant
  symbols are out of scope here (a separate roadmap PR).
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
* **Countability via the coded proxy.** Raw infinitary syntax is uncountable (branching is a
  function `ι → …`). The chosen route for every countability argument is the countable coded-formula
  type `FormulaCode` with `Countable (FormulaCode L n)`, proven to capture back-and-forth
  equivalence (`BFEquiv ↔ agreement on codes`). This is what makes "countably many refinements /
  Scott formulas" a theorem rather than a leap. Distinguish this from Layer 0's *formula-sensitive*
  size predicate (an `IsCountable` on individual formulas, counting the branch families a formula
  actually uses): that predicate bounds ONE formula and does **not** supersede `FormulaCode` — the
  Scott argument needs countably many refinement *classes*, which no per-formula predicate
  delivers.
* **Scott rank.** Ship one rank convention (the back-and-forth/Scott rank), and state its relation to
  Scott height once, rather than maintaining two parallel notions.
* **Scott is unconditional.** State Scott's theorem and `scottRank_lt_omega1` without a counting
  hypothesis: the refinement-countability bridge (Layer 2) is proved, not assumed.
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
* **`Encodable` and `Cardinal`:** `Encodable` (`Mathlib/Logic/Encodable/Basic.lean`) is the
  codomain-`ℕ` instance of the carrier codings (`IndexCoding.ofEncodable`); `Cardinal` for the
  formula-size predicate.
* **Combinatorics:** `SimpleGraph` (`Combinatorics/SimpleGraph/Basic.lean`) for the graph worked
  example.

Consume these directly rather than re-proving Mathlib's first-order, ordinal, or partial-isomorphism
infrastructure.

## What is missing (build here)

* Lω₁ω and L∞ω syntax and semantics (Mathlib's formula `iInf`/`iSup` require `[Finite β]`);
* back-and-forth at finite and ordinal length, potential isomorphism, and Karp's theorem;
* the countable coded-formula proxy and refinement counting;
* Scott rank, canonical Scott formulas, and Scott sentences.

Every item above is a target in some layer below; nothing is left as a gap to be wished into existence.

## Migration source

A Lean formalization of this theory exists at
[`cameronfreer/infinitary-logic`](https://github.com/cameronfreer/infinitary-logic); use production
checkpoint
[`06bd522`](https://github.com/cameronfreer/infinitary-logic/tree/06bd522586f97ccf3503b7f47f250943b33a7f99)
for proof scripts and the declaration map below. Its syntax predates the fixed-carrier design, so
its Layer 0 type signatures should not be copied; Layer 0 follows the shapes specified in this
roadmap (validated in
[`infinitary-logic` #43](https://github.com/cameronfreer/infinitary-logic/pull/43)). Neither source
is the specification; the map is "where to look", not "what is correct".

* Layer 0: `InfinitaryLogic/Lomega1omega/` and `InfinitaryLogic/Linf/`.
* Layer 1: `InfinitaryLogic/Karp/` and `InfinitaryLogic/Scott/BackAndForth.lean`.
* Layer 2: `InfinitaryLogic/Scott/Code.lean` and `InfinitaryLogic/Scott/RefinementCount.lean`.
* Layer 3: `InfinitaryLogic/Scott/` (`Formula.lean`, `Sentence.lean`, `Rank.lean`, `AtomicDiagram.lean`).

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
| L0 | Mathlib `FirstOrder.Language`, `Term`, `BoundedFormula`, `Encodable`, `Cardinal` | the fixed-carrier syntax + ω abbrev, `Realize`, `IndexCoding` + `iInfAlong`/`iSupAlong` + `reindex`, `toInf`, substitution/relabel/recursion API | `realize_toInf` on a finitary `φ` |
| L1 | L0; Mathlib `FGEquiv`, `IsExtensionPair`, and the countably-generated-structure API | `BFEquiv`, `PotentialIso`, Karp, `countable_potentialIso_iff_iso`, the countability bridges | `Countable M → Structure.CG L M` |
| L2 | L0, L1; `Encodable` | `FormulaCode`, `Countable (FormulaCode L n)`, the codes bridge, `refinement_countable`, refinement stabilization | the `Countable (FormulaCode L n)` instance |
| L3 | L1, L2 | `scottFormula`, `scottRank`, `scottRank_lt_omega1`, `scottSentence`, `scott_isomorphism` | the Scott sentence of a finite structure |

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
  (finitary formulas have no infinitary nodes, so one embedding serves all carriers; `toLω` is the
  `ι := ℕ` case), with realization compatibility (`realize_toInf`).

**Beat 2 — carrier codings and transport.**

* `IndexCoding ι κ` — encode, decode, decode-encode — with identity, forward composition (`trans`),
  `ofEncodable` (the `Encodable` case), `ofEquiv`, and the `pad` laws that centralize decoder
  analysis;
* the coded connectives `iInfAlong`/`iSupAlong` (an `ι`-family expressed at carrier `κ` with
  semantically neutral padding) and their realization lemmas;
* whole-formula transport `reindex` with functor laws (`reindex_id`, `reindex_trans`), the
  equivalence round trip (`reindexEquiv`), realization preservation (`realize_reindex`), and
  `reindex_toInf` naturality;
* the uniform companion `toOmega` with `realize_toOmega`: `toOmega` uniformly recodes a formula
  when the whole carrier is encodable; `ofCountable` (Beat 3) is the proof-directed alternative
  that also handles countable formulas at uncountable carriers.

**Beat 3 — derived APIs.**

* **substitution, relabeling, `castLE`, and the free-variable support** as named API (not buried) —
  the support is finite for finitary formulas and countable for ℕ-carried `iSup`/`iInf`, so use a
  set/`support` formulation, not a `Finset`;
* quantifier rank, valued in the carrier's ordinal universe, with the exact transport milestone
  `qrank_reindex` along `reindex`, stated with `Ordinal.lift`;
* **countable-fragment recovery**: countability belongs to formulas, not to their ambient carriers.
  `indexBound` and `IsCountable` bound the branch families ONE formula actually uses — a formula
  can be countable even when its ambient carrier is uncountable — with `isCountable_toInf`
  (finitary embeddings have index bound zero at every carrier), `ofCountable` recoding a countable
  formula into `BoundedFormulaω`, `realize_ofCountable` (the recoding preserves realization), and
  `ofCountable_proof_irrel` (the result is independent of the supplied proof of `IsCountable`).
  These bound individual
  formulas and are NOT the Layer 2 counting route (see Standing hypotheses). Include
  `IndexCoding.ofEncodableWith (e : Encodable ι)`, so an explicit encoding does not require a
  global instance;
* language-map compatibility: `LHom.onBoundedFormulaInf`, with the naturality law
  `onBoundedFormulaInf_reindex`;
* the **language-size bridge**, pinned in `Suggested.lean` as
  `card_le_aleph0_iff_countable_relations` (for relational `L`,
  `L.card ≤ ℵ₀ ↔ Countable (Σ n, L.Relations n)`), relating the countability instance carried by
  the Scott/Karp statements to Mathlib's single cardinal bound.

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
toOmega
realize_toOmega
subst
relabel
castLE
freeVarSupport
qrank_reindex
indexBound
IsCountable
isCountable_toInf
ofCountable
realize_ofCountable
ofCountable_proof_irrel
LHom.onBoundedFormulaInf
onBoundedFormulaInf_reindex
toInf
realize_toInf
card_le_aleph0_iff_countable_relations
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
carriers), although `reindex` preserves semantics; the coded connectives and Layer 2's `FormulaCode`
are how countable fragments are actually delimited.

### Layer 1: back-and-forth, potential isomorphism, and Karp's theorem

Suggested home:

```text
TauCeti/ModelTheory/BackAndForth/Game.lean
TauCeti/ModelTheory/BackAndForth/PotentialIso.lean
TauCeti/ModelTheory/BackAndForth/Karp.lean
```

Build on Mathlib's `PartialEquiv` / `FGEquiv` / `IsExtensionPair`:

* `BFEquiv α a b`, the ordinal-indexed back-and-forth equivalence of tuples, by `limitRecOn` (atomic
  type at `0`; forth-and-back at successors; agreement below at limits), with monotonicity and
  symmetry — the recursion itself is a target, not assumed;
* the finite EF game and the ω-round game, and the coherent-strategy object, with the quantifier-swap
  obstruction between `BFEquiv ω` and a coherent ω-strategy stated explicitly;
* potential isomorphism as an explicit **back-and-forth system**: a nonempty set `S` of `FGEquiv`s
  closed under two-sided extension *within `S`*, with its basic API — `potentialIso_of_equiv`
  (restrict an isomorphism to finitely generated substructures), symmetry (`PotentialIso.symm`,
  flip the system), transitivity (`PotentialIso.trans`, compose systems) — and the one-way
  compatibility bridge `potentialIso_of_isExtensionPair` from Mathlib's global `IsExtensionPair`
  (the `S = Set.univ` case);
* the **countable-generation bridge** from `[Countable M]` to Mathlib's `Structure.CG`, so
  `equiv_between_cg` / `embedding_from_cg` apply — cite `Structure.cg_of_countable` as the ready-made
  bridge, and note `Structure.cg_iff_countable` additionally needs countable function symbols (free for
  relational `L`, so do not state the iff unguarded);
* `InfEquivAt L κ M N`, L∞ω-elementary equivalence at a fixed carrier `κ` (agreement on all
  `κ`-carried sentences), with `InfEquivW` (external quantification over all carriers in the
  structure universe) as the full notion and `InfEquivAt.of_reindex` transporting agreement along
  codings.

Karp's theorem and its corollaries:

```lean
potentialIso_of_equiv   -- an isomorphism is a potential isomorphism
PotentialIso.symm       -- symmetry: flip the system
PotentialIso.trans      -- transitivity: compose the systems
potentialIso_iff_BFEquiv_all
karp_theorem_at         -- codings of M and N into a common carrier κ:
                        --   potential isomorphism ↔ InfEquivAt κ  (headline)
karp_theorem            -- the packaged corollary: potential isomorphism ↔ InfEquivW,
                        --   via the canonical carrier M ⊕ N and its two sum codings
potentialIso_of_isExtensionPair  -- one-way bridge from Mathlib's global extension property (S = univ)
cg_of_countable_structure   -- [Countable M] → Structure.CG L M (bridge to equiv_between_cg)
countable_potentialIso_iff_iso   -- on countable structures, potential iso ↔ isomorphism
```

**Acceptance example:** the countable-generation bridge `[Countable M] → Structure.CG L M` — compiles
on Layer 0 + Mathlib, before the Karp summit.

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

### Layer 2: the coded-formula proxy and refinement counting

Suggested home:

```text
TauCeti/ModelTheory/Scott/Code.lean
TauCeti/ModelTheory/Scott/Refinement.lean
```

This is the "connect to ground" layer: raw `BoundedFormulaω` is uncountable (its `iSup`/`iInf` branch
on `ℕ → _`), so the countability arguments Scott analysis needs cannot run on it directly. The chosen
route is the coded proxy. Build:

* `FormulaCode L n`, a countable coded proxy / fragment for the Scott-refinement formulas — not all of
  raw Lω₁ω syntax (which is uncountable), but enough to capture `BFEquiv` — using explicit
  list-branching instead of `ℕ → _`, with `Countable (FormulaCode L n)` and the interpretation
  `FormulaCode.toFormulaω`;
* the bridge `BFEquiv ↔ agreement on codes` (`agree_codes_implies_BFEquiv` and its converse), so the
  coded world captures back-and-forth equivalence;
* refinement-set countability `refinement_countable`, and the Scott-specific refinement-stabilization
  lemma (the back-and-forth refinement sequence stabilizes at some ordinal `< ω₁`). State only this
  Scott-specific dependency, not the general Cantor–Bendixson / ordinal-stabilization theory (see
  Coordination).

Key milestones:

```lean
FormulaCode
FormulaCode.instCountable
FormulaCode.toFormulaω
agree_codes_iff_BFEquiv
refinement_countable
refinement_stabilizes_below_omega1
```

**Acceptance example:** the `Countable (FormulaCode L n)` instance — compiles on Layers 0–1, before the
refinement-stabilization lemma and the Scott summit.

⚠ **API warning.** Do not run countability through raw `BoundedFormulaω`: it is uncountable. The coded
proxy is the route; the bridge from codes to back-and-forth equivalence is a theorem to prove, not an
assumption to carry. Layer 0's per-formula `IsCountable` predicate does **not** replace this layer: it
bounds one formula's branch families, while Scott needs countably many refinement classes — a claim
about a SET of formulas that only the coded proxy delivers.

### Layer 3: Scott rank, canonical formulas, and Scott's theorem (v1 summit)

Suggested home:

```text
TauCeti/ModelTheory/Scott/Formula.lean
TauCeti/ModelTheory/Scott/Rank.lean
TauCeti/ModelTheory/Scott/Sentence.lean
```

Build, consuming Layer 2's refinement counting and stabilization:

* the canonical Scott formulas `scottFormula α a` by ordinal recursion, with the `< ω₁` guard and the
  atomic / successor / limit cases;
* `scottRank` and `scottHeight`, their interoperability, and `scottRank_lt_omega1` (from the
  refinement-stabilization lemma);
* `scottSentence M`, the conjunction characterizing `M` among countable structures;
* the unconditional Scott isomorphism theorem — no counting hypothesis, because the refinement bridge
  is proved in Layer 2.

Key milestones:

```lean
scottFormula
scottFormula_realize_self
scottRank
scottHeight
scottRank_lt_omega1
scottSentence
scott_isomorphism
```

**Acceptance example:** the Scott sentence of a fixed finite structure (finite Scott rank) — the
smallest end-to-end instance of the summit, once Layer 3 exists, using no later layers.

## Worked examples

Discharge these alongside the layers; they check that the API describes real structures, not just the
final theorems.

* Finite structures have a Scott sentence of finite rank, and the Scott sentence of a finite structure
  is (equivalent to) a first-order sentence.
* A pure-equality set of size `n`, and a countably infinite pure-equality set, with their Scott ranks.
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

Relationalization of functions/constants is deliberately separate: it depends on the relational Scott
spine and should get its own roadmap PR rather than expanding this one.

## Ordering

Layer 0 first: everything needs the infinitary syntax and semantics. Layer 1 (back-and-forth and Karp)
and Layer 2 (the coded-formula proxy and refinement counting) follow; Layer 2 is the critical path to
an unconditional Scott theorem, and can proceed in parallel with Layer 1. Layer 3 (Scott rank,
formulas, and the Scott isomorphism theorem) is the summit, consuming Layers 1 and 2.

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

# Roadmap: counting countable models: Morley's theorem and the Vaught toolkit

How many countable models can a sentence of Lω₁ω have? Morley's theorem answers: at most ℵ₁, or
there is a perfect set of pairwise non-isomorphic countable models, and then there are continuum
many. Vaught's conjecture says that the first alternative can be sharpened to "at most ℵ₀". The
conjecture is open; this roadmap states it precisely, proves its standard reformulations, and
builds the library around it: the back-and-forth stratification of a model class, isolating
ranks, the bounded-rank dichotomy, scattered (thin) sentences and their equivalent descriptions,
and minimally uncountable sentences.

The summit is **Morley's theorem** for a countable relational language `L` and a sentence
`φ : L.Sentenceω`, in its witnessed form:

```math
\#\{\text{countable models of }\varphi\}/{\cong}\ \le\ \aleph_1
\quad\text{or}\quad
\varphi\ \text{has a perfect set of pairwise non-isomorphic countable models,}
```

with the cardinal form "at most ℵ₁ or exactly 2^ℵ₀" as a corollary. Neither form assumes or
refutes the continuum hypothesis. Its supporting milestone is the **bounded-rank dichotomy**: if
the models of `φ` have Scott height bounded below ω₁, there are at most ℵ₀ countable models or a
perfect set of pairwise non-isomorphic ones.

The roadmap is downstream of four others. The parent [InfinitaryLogic](../InfinitaryLogic/README.md)
roadmap supplies the infinitary syntax, back-and-forth equivalence and Scott analysis. Three
sibling roadmaps supply the descriptive set theory: **[CountableStructureSpaces](../CountableStructureSpaces/README.md)** ([#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316)) (the coded space
of structures, model classes, Borelness of back-and-forth equivalence, Scott height, López–Escobar,
uniform back-and-forth separation), **[BorelEquivalenceRelations](../BorelEquivalenceRelations/README.md)** ([#1317](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1317)) (perfect and Cantor antichains,
Silver's theorem and its cardinality form), and **[InfinitaryModelExistence](../InfinitaryModelExistence/README.md)** ([#1315](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1315)) (fragments,
fragment types, Morleyization, the action of language maps on formulas, the small presentation of
a countable language). Every
statement consumed from them is quoted exactly in [Dependencies](#dependencies-on-other-roadmaps).

Suggested homes:

```text
TauCeti/ModelTheory/Counting/Classes.lean          -- Layer 0: classes of countable models, tiers
TauCeti/ModelTheory/Counting/Stratification.lean   -- Layer 1: back-and-forth levels, isolation
TauCeti/ModelTheory/Counting/BoundedRank.lean      -- Layer 2: the bounded-rank dichotomy
TauCeti/ModelTheory/Counting/Morley.lean           -- Layer 3: Morley's theorem
TauCeti/ModelTheory/Counting/Scattered/            -- Layer 4: scattered classes, thinness criteria
TauCeti/ModelTheory/Counting/Vaught.lean           -- Layer 5: Vaught's conjecture
TauCeti/ModelTheory/RowAssembly/                   -- Layer 6: row assemblies, rank-ω witness
```

## Scope

| Layer | Builds | Consumes |
| --- | --- | --- |
| 0 | Classes of countable models across the carriers `ℕ` and `Fin n`; the count `countableModelCount φ`; perfect sets of non-isomorphic models; the finite-carrier dichotomy; transport between presentations of a language | Mathlib; CountableStructureSpaces (code spaces, model classes, isomorphism); BorelEquivalenceRelations (Silver); InfinitaryModelExistence (language maps, small presentation) |
| 1 | Back-and-forth levels on codes; isolating ranks; the stratification bound; level-by-level transfer tools | 0; parent Layers 1–3; CountableStructureSpaces (Borelness, Scott height) |
| 2 | The bounded-rank dichotomy, witnessed and cardinal | 0, 1; BorelEquivalenceRelations |
| 3 | Morley's theorem, witnessed and cardinal | 0–2; BorelEquivalenceRelations |
| 4 | Back-and-forth scattered classes; uniform separation; concentration; sentence and fragment spectra; Morleyization transport; rank analyses | 0–3; CountableStructureSpaces (boundedness, López–Escobar); InfinitaryModelExistence (fragments, Morleyization) |
| 5 | The perfect-set, cardinal and first-order Vaught conjectures as precise `Prop`s, their proved reformulations with the right hypotheses, minimally uncountable sentences, and the Harnik–Makkai reduction to minimal counterexamples | 0–4 |
| 6 | A countable structure of internal Scott rank exactly ω whose level-ω class meets continuum many isomorphism classes; internal Scott rank is not isolating | parent Layers 1–3; 0–1; CountableStructureSpaces (Scott height, S5) |

**Out of scope here**, each a separate future roadmap: a proof or refutation of Vaught's conjecture;
Vaught's conjecture for special classes of sentences or theories (for example ω-stable theories);
the uncountable models of counterexamples and their spectra; the topological Vaught conjecture for
general Polish group actions; the bound "at most ℵ₁ classes or a perfect set of inequivalent points"
for arbitrary analytic equivalence relations. Also out of scope for this and the four sibling
roadmaps: admissible sets, Barwise compactness and Nadel's bound; Scott processes; Lκλ for κ > ω₁
beyond L∞ω; many-sorted logic; transfer of Karp theory, back-and-forth analysis and Scott ranks
across the graph translation of function and constant symbols, which must reuse
InfinitaryModelExistence's translation and its semantic API (that roadmap's Layer 6); effective
Scott analysis; the general Harrington–Kechris–Louveau dichotomy and Gandy–Harrington topology; the
coanalytic form of Silver's theorem. The descriptive dichotomies themselves belong to
BorelEquivalenceRelations; the space of structures, López–Escobar and external Scott height to
CountableStructureSpaces; fragments, model existence and Morleyization to InfinitaryModelExistence;
Ehrenfeucht–Mostowski models, Hanf numbers, small models and complete sentences to
[HanfNumbers](../HanfNumbers/README.md)
([#1319](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1319)).

## Standing conventions

1. **Languages.** `L : FirstOrder.Language.{u, v}` is relational. Carry `[L.IsRelational]` and
   `[Countable (Σ l, L.Relations l)]` as separate instance arguments, only where used; there is
   no bundled countable-language class (the parent's convention, matching the unbundled
   hypotheses discussed in [Mathlib #42189](https://github.com/leanprover-community/mathlib4/pull/42189)).
   Statements about one sentence are universe-polymorphic in `L`. The conjecture-level `Prop`s of
   Layer 5 quantify over `L : Language.{0, 0}`, because a countable language can always be
   presented in universe 0, and over structures on `ℕ` and on each `Fin n`. The transport from
   presentations in other universes is a named result (Layer 0, Layer 5).
2. **Codes and carriers.** Countable structures are handled through codes in the
   CountableStructureSpaces roadmap's space `StructureSpaceOn L α` of relational `L`-structures on
   a countable carrier `α`. Only two kinds of carrier occur: `ℕ` (the infinite tier) and `Fin n`
   (the finite tiers). `StructureSpace L` abbreviates `StructureSpaceOn L ℕ`. A code `c` is read as
   a structure by `c.toStructure`, a definition supplied explicitly, never an instance, because
   one carrier carries many codes.
3. **Countable means at most countable.** The countable models of `φ` include the finite ones and
   the empty structure. "Countably infinite" is the tier `ℕ`. Vaught's conjecture is stated for
   all countable models; Layer 5 proves it equivalent to the statement for countably infinite
   models, using the sentence `infiniteSentence L`.
4. **Counting.** The isomorphism classes of countable models are
   `CountableModelClasses φ := Quotient (isoSetoidOn ℕ φ) ⊕ Σ n, Quotient (isoSetoidOn (Fin n) φ)`,
   and the count is its cardinality `countableModelCount φ : Cardinal.{v}`. Models in arbitrary
   universes enter only through `classOf`, which Layer 0 proves to be a bijection on isomorphism
   classes in every universe. No statement counts a proper class of structures directly.
5. **Levels.** Back-and-forth levels on codes are `Ordinal.{0}` below `ω₁ = Ordinal.omega 1`,
   with no lift and no offset. `bfEquivSetoid α` (S4) is the parent roadmap's `BFEquiv α 0` between
   the empty tuples of the decoded structures. Countable ordinals are carried as explicit
   hypotheses `α < Ordinal.omega 1`, never as a subtype.
6. **Ranks are parameters.** Counting arguments consume an abstract **isolating rank** (Layer 1):
   an isomorphism-invariant map from codes to countable ordinals such that back-and-forth
   equivalence at the rank of `c` decides isomorphism with `c`. The external Scott height of
   CountableStructureSpaces is the canonical instance. The parent roadmap's `internalScottRank`
   is not an isolating rank (Layer 6 proves this), but a bound on it bounds an isolating rank by
   the comparison theorem consumed from CountableStructureSpaces.
7. **Perfect sets.** "Perfect" is Mathlib's `Perfect` for the product topology on codes. A perfect
   set of pairwise non-isomorphic models is a nonempty perfect set of codes of models, no two of
   which are isomorphic (`Set.Pairwise`). Thinness is the absence of such a set.
8. **No continuum hypothesis.** No statement assumes CH or its negation, except where the
   hypothesis `ℵ₁ = 𝔠` or `ℵ₁ < 𝔠` is an explicit argument (Layer 5).
9. **Silver and López–Escobar are consumed, never reproved.** Silver's theorem and its
   cardinality form enter only through the statements quoted from BorelEquivalenceRelations.
   Every perfect-set conclusion here consumes the witnessed form (E1): the relative Silver theorem
   for a Borel subset, whose second alternative is a continuous Cantor family of pairwise
   inequivalent points, turned into a perfect set by (E0). The cardinality form (E2) is used only
   for the second proofs of the cardinal forms, never to produce a perfect set;
   López–Escobar and uniform back-and-forth separation only through those quoted from
  CountableStructureSpaces.
10. **Names are target shapes.** The declaration names below are intended shapes, audited against
    Mathlib conventions at implementation time.

## What exists (consume)

### Mathlib

* Descriptive set theory: `PolishSpace`, `StandardBorelSpace`, `MeasurableSet.standardBorel`
  (a Borel subset of a standard Borel space is standard Borel), `MeasurableSet.isClopenable` (a
  Borel subset of a Polish space is clopen in a finer Polish topology with the same Borel sets),
  `MeasureTheory.AnalyticSet`, `MeasurableSet.analyticSet`, `AnalyticSet.measurablySeparable`
  (Lusin separation), `analyticSet_range_of_polishSpace`
  (`Mathlib/MeasureTheory/Constructions/Polish/Basic.lean`); `Descriptive.tree`
  (`Mathlib/SetTheory/Descriptive/Tree.lean`).
* Perfect sets: `Perfect` (`Mathlib/Topology/Perfect.lean`), `Perfect.exists_nat_bool_injection`
  and `IsClosed.exists_nat_bool_injection_of_not_countable`
  (`Mathlib/Topology/MetricSpace/Perfect.lean`).
* Cardinals and ordinals: `Cardinal.continuum` (`𝔠`), `Cardinal.aleph` (`ℵ₁ = Cardinal.aleph 1`),
  `Cardinal.aleph_one_le_continuum`, `Cardinal.aleph_one_le_iff` (`ℵ₁ ≤ c ↔ ℵ₀ < c`),
  `Cardinal.mk_le_aleph0_iff`; `Ordinal.omega 1`, `Cardinal.countable_Iio_of_lt_omega_one`,
  `Ordinal.iSup_lt_omega_one`, `Cardinal.isSuccLimit_omega`.
* Model theory: `FirstOrder.Language`, `Structure`, `Language.Equiv` (between structures in
  different universes), `IsRelational`; `Setoid.comap`, `Quotient`, `Equiv.Perm`.

### Tau Ceti and the parent roadmap

The parent [InfinitaryLogic](../InfinitaryLogic/README.md) roadmap is implemented in Tau Ceti
(Scott's theorem in [Tau Ceti #18977](https://github.com/TauCetiProject/TauCeti/pull/18977); the
modules `TauCeti/ModelTheory/Infinitary/`, `BackAndForth/` and `Scott/`, namespace `TauCeti`, are
newer than this repository's Tau Ceti pin, so `Suggested.lean` imports the parent's prototype
instead). This roadmap consumes:

* the syntax `BoundedFormulaInf`, `BoundedFormulaω`, `Sentenceω`, the coded connectives
  `iInfAlong`/`iSupAlong`, `IndexCoding.ofEncodableWith`, and realization, with its invariance under
  isomorphism (`StrongHomClass.realize_boundedFormulaInf` and `realize_sentenceInf`,
  [Tau Ceti #18035](https://github.com/TauCetiProject/TauCeti/pull/18035));
* `BFEquiv` with `BFEquiv.succ`, `BFEquiv.limit`, monotonicity, reflexivity, symmetry,
  transitivity, re-indexing of both tuples along a map `Fin m → Fin n`, and invariance under
  isomorphism (`TauCeti.BFEquiv`, `BFEquiv.refl`, `BFEquiv.symm`, `BFEquiv.trans`, `BFEquiv.comp`,
  `FirstOrder.Language.Equiv.bfEquiv`);
* `countable_potentialIso_iff_iso` and `potentialIso_iff_bfEquiv_all`;
* the Scott formulas `scottFormula a α` with `realize_scottFormula_iff_bfEquiv`, so that for
  `α < ω₁` the class `{d | bfEquivSetoid α c d}` is the model class of the sentence
  `scottFormula (Fin.elim0) α` of the structure decoded from `c`;
* `SelfStabilizesCompletely`, `selfStabilizationOrdinal`, `orbitRank`, `internalScottRank` and
  `internalScottRank_lt_omega_one`.

Free-variable support ([Tau Ceti #17547](https://github.com/TauCetiProject/TauCeti/pull/17547))
and the random-graph worked example
([Tau Ceti #18726](https://github.com/TauCetiProject/TauCeti/pull/18726)) are not needed here.
`exs` (existential closure, `TauCeti/ModelTheory/Infinitary/Syntax.lean`) is a parent-roadmap
target; `Suggested.lean` carries it as a stand-in because the parent prototype lacks it.

### Dependencies on other roadmaps

Each item is the exact statement consumed. Where a sibling roadmap names the object differently,
use its name; the mathematics below is what is required. Each supplier owns its interface.
`Suggested.lean` reproduces the suppliers' current proposed definitions, and the theorems it
applies, as marked stand-ins, each block recording its owner and the owner's revision it was
checked against; BorelEquivalenceRelations' perfect-set vocabulary is written out inline instead.
These copies are prototype scaffolding, not authorization to implement a parallel API in Tau Ceti:
Tau Ceti implements the owners' declarations and this roadmap imports them.

**From [CountableStructureSpaces](../CountableStructureSpaces/README.md)** ([#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316)).

* **(S1) Code spaces.** For a carrier `α`, the coding space `StructureSpaceOn L α` (one bit for each
  relation symbol `R` of arity `l` and tuple `Fin l → α`), with the product topology and product
  σ-algebra, Polish and standard Borel for countable `α` and countably many relation symbols;
  `StructureSpace L := StructureSpaceOn L ℕ`; the decoding `StructureSpaceOn.toStructure` and
  encoding `ofStructure`, mutually inverse for relational `L`; the transport `encodeVia e` along a
  bijection `e : M ≃ α` with `nonempty_equiv_encodeVia`; and `mk_structureSpaceOn_le_continuum`.
* **(S2) Model classes.** `modelsOf φ : Set (StructureSpaceOn L α)` for `φ : L.Sentenceω`, with
  `measurableSet_modelsOf` (countable `α`), `isomorphismInvariant_modelsOf`, and
  `standardBorelSpace_modelsOf`.
* **(S3) Isomorphism and the logic action.**
  `structureIsoSetoidOn L α : Setoid (StructureSpaceOn L α)` (the decoded structures are
  isomorphic), on every carrier `α : Type w`, and the abbreviation
  `structureIsoSetoid L := structureIsoSetoidOn L ℕ`; the action of `Equiv.Perm α` on
  `StructureSpaceOn L α`, with `orbitRel_iff_nonempty_equiv`, `structureIsoSetoidOn_eq_orbitRel`
  (isomorphism is the orbit relation, on every carrier) and `structureIsoSetoid_eq_orbitRel`;
  `ActionInvariant`, `IsomorphismInvariant`, `actionInvariant_iff_isomorphismInvariant`, and
  `analyticSet_iUnion_smul` (the saturation of an analytic class is analytic).
* **(S4) Back-and-forth levels on codes.** `bfEquivSetoid β : Setoid (StructureSpace L)`, the
  parent's `BFEquiv β 0` between the empty tuples of the decoded structures, for `β : Ordinal.{0}`;
  `measurableSet_bfEquivSetoid` (Borel for `β < ω₁`); `structureIsoSetoid_le_bfEquivSetoid`.
* **(S5) Scott height.** `scottHeight M` with `scottHeight_lt_omega_one` (countable `M`),
  `scottHeight_congr` (invariance under isomorphism),
  `nonempty_equiv_of_bfEquiv_of_scottHeight_le` (for countable `M`, `N` in one universe,
  `scottHeight M ≤ β` and `BFEquiv β 0 Fin.elim0 Fin.elim0` give `Nonempty (M ≃[L] N)`), and
  `scottHeight_le_internalScottRank_add_omega0`.
* **(S6) López–Escobar, separation form.** `exists_sentence_separating`: for analytic `A`, `B` with
  `B` action invariant and `Disjoint A B`, some `θ` has `A ⊆ modelsOf θ` and
  `Disjoint B (modelsOf θ)`.
* **(S7) Uniform back-and-forth separation.** `exists_uniform_bfSeparation`: an analytic set of
  pairs of codes containing no isomorphic pair is separated at one level `β < ω₁`
  (that roadmap proves it from the forced back-and-forth tree and the boundedness theorem).

**From [BorelEquivalenceRelations](../BorelEquivalenceRelations/README.md)** ([#1317](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1317)).

* **(E0) Perfect-set vocabulary.** For a topological space `X`, a setoid `E` and `A : Set X`:
  `HasPerfectAntichainOn E A` (a nonempty perfect subset of `A` of pairwise `E`-inequivalent
  points), `HasCantorAntichainOn E A` (a continuous map of Cantor space into `A` with
  `E`-inequivalent values at distinct points), `IsThinOn E A`; with
  `hasCantorAntichainOn_iff_hasPerfectAntichainOn` (Polish `X`),
  `HasCantorAntichainOn.continuum_le_mk_quotient`, `HasCantorAntichainOn.mono_relation`,
  `hasCantorAntichainOn_image_iff` (transport along a measurable embedding preserving and
  reflecting the relations), and `exists_countable_exceptions_of_splits`.
* **(E1) Silver's theorem, relative to a Borel subset.**
  `countable_or_hasCantorAntichainOn_of_measurableSet`: for a Polish `X`, a Borel `A`, a setoid `R`
  on `X` and a Borel setoid `F` on `A` coarser than `R`, `Quotient F` is countable or
  `HasCantorAntichainOn R A`. Every use of Silver's theorem here is on a Borel subset (a model
  class), so this is the only form consumed.
* **(E2) The cardinality form of Silver's theorem.** `mk_quotient_le_aleph0_or_eq_continuum`: on a
  standard Borel space, a Borel equivalence relation has `≤ ℵ₀` or exactly `𝔠` classes.

**From [InfinitaryModelExistence](../InfinitaryModelExistence/README.md)** ([#1315](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1315)).

* **(M0) Language maps (its Layer 0.1).** `onBoundedFormulaInf g`, the action of a language map
  `g : L →ᴸ L'` (Mathlib's `LHom`, languages in any universes) on infinitary formulas at every
  carrier, and `realize_onBoundedFormulaInf` (realization is preserved when `g.IsExpansionOn M`),
  the infinitary form of Mathlib's `LHom.realize_onBoundedFormula`.
* **(M1) Fragments and theories.** `Fragment L` (a set `toSet` of Lω₁ω formulas with bound
  variables, closed under the components of implications, universal quantifiers and countable
  conjunctions and disjunctions), `Fragment.generated S`, `Fragment.generated_countable` (a
  countable set generates a countable fragment); `Theoryω.conjunction T hT`, the countable
  conjunction of a countable theory, with `realize_conjunction_iff`.
* **(M2) Fragment types.** `fragmentType F M a`, the members of `F` of arity `n` realized by
  `a : Fin n → M`; the slice `Fragment.slice F n` and the realized truth assignment
  `F.slice n → Prop`, transported along isomorphisms.
* **(M3) Morleyization.** For a set `Φ` of formulas: the language `morleyize L Φ` (the relation
  symbols of `L` and one `n`-ary symbol for each member of `Φ` of arity `n`), the inclusion
  `lhomMorleyize Φ`, the canonical expansion `morleyExpansion Φ M`, in which the symbol of `φ`
  holds of `a` exactly when `φ` does; the relational and countable instances of `morleyize`; and
  `nonempty_morleyEquiv_iff` (canonical expansions are isomorphic iff the bases are).
* **(M4) The small presentation (its Layer 0.3).** `smallPresentation L : Language.{0, 0}` for `L`
  with countably many function and relation symbols, `smallPresentationEquiv L : L ≃ᴸ
  smallPresentation L`, and `realize_smallPresentation`.

## The build, in layers

The ordering is the dependency order. Each layer is a full development: object API, milestone
theorems and acceptance checks.

| Layer | Acceptance check (compiles without later layers) |
| --- | --- |
| 0 | "exactly one element" with countably many unary predicates: `countableModelCount = 𝔠`, with a perfect set on `Fin 1` and no models on `ℕ` |
| 1 | the stratification bound applied to a set of codes meeting one isomorphism class |
| 2 | equivalence relations with all classes infinite: internal Scott rank `1` throughout and exactly `ℵ₀` countable models |
| 3 | equivalence relations: an explicit perfect set of pairwise non-isomorphic models |
| 4 | a concentrated class is back-and-forth scattered, hence thin |
| 5 | `VaughtConjecture.cardinal` and the CH and ¬CH reformulations |
| 6 | the internal Scott rank is not an isolating rank |

### Layer 0: classes of countable models

Build:

* **Restricted isomorphism.** `isoSetoidOn α φ := (structureIsoSetoidOn L α).comap Subtype.val` on
  the codes on `α` of models of `φ`, with the membership lemma reducing it to the ambient relation.
* **The classes and the count.** `CountableModelClasses φ` and `countableModelCount φ` as pinned in
  the conventions; the summand decomposition
  `countableModelCount φ = #(Quotient (isoSetoidOn ℕ φ)) + Cardinal.sum f` with
  `f n = #(Quotient (isoSetoidOn (Fin n) φ))`;
  the bounds "the finite tiers contribute at most `ℵ₀ · b` when each contributes at most `b`";
  monotonicity (if every countable model of `φ` is a model of `ψ`, the inclusion of classes is
  injective, so `countableModelCount φ ≤ countableModelCount ψ`).
* **Bridges to models in any universe.** `classOf φ hM` for a countable `M : Type w` satisfying
  `φ`: transport `M` to `Fin n` if it has `n` elements and to `ℕ` otherwise. Prove
  `classOf_eq_classOf_iff` (for `M : Type w`, `N : Type w'`, equal classes iff
  `Nonempty (M ≃[L] N)`), `classOf_surjective` (every class is the class of a model in every
  universe `w`), and the tier lemmas (`classOf` lands in the `ℕ` summand exactly for infinite
  `M`, and in summand `n` exactly when `M` has `n` elements), using (S1)'s `encodeVia` and
  `encodeVia_mem_modelsOf` (a transported code of a model is a code of a model).
* **Upper bound.** `countableModelCount_le_continuum`, from (S1)'s
  `mk_structureSpaceOn_le_continuum` and the summand bounds.
* **Isomorphism on a finite carrier.** On `Fin n`, (S3)'s `structureIsoSetoidOn L (Fin n)` is the
  orbit relation of the finite group `Equiv.Perm (Fin n)`, so its graph is a finite union of graphs
  of continuous maps: `measurableSet_structureIsoSetoidOn_fin`.
* **Perfect sets of non-isomorphic models.** `HasPerfectSetOfNonisoModelsOn α φ :=
  HasPerfectAntichainOn (structureIsoSetoidOn L α) (modelsOf φ)` (E0) and
  `HasPerfectlyManyCountableModels φ` (a perfect set at the tier `ℕ` or at some `Fin n`). With (E0),
  a perfect set gives `𝔠 ≤ #(Quotient (isoSetoidOn α φ))`, hence
  `HasPerfectlyManyCountableModels.countableModelCount_eq : countableModelCount φ = 𝔠`.
* **The finite-tier dichotomy.** `countable_or_hasPerfectSetOfNonisoModelsOn_fin`: (E1), relative
  form, on the Borel set `modelsOf φ` of codes on `Fin n`, with `R` and `F` both isomorphism (Borel
  by `measurableSet_structureIsoSetoidOn_fin`). Its second alternative is a continuous Cantor family
  of pairwise non-isomorphic models on `Fin n`, which (E0)'s
  `hasCantorAntichainOn_iff_hasPerfectAntichainOn` turns into
  `HasPerfectSetOfNonisoModelsOn (Fin n) φ`.
  No stratification is needed on a finite carrier.
* **Infinitude.** `infiniteSentence L`, the countable conjunction over `n` of "there are `n`
  pairwise distinct elements", with `realize_infiniteSentence_iff : ... ↔ Infinite M`. Then
  `φ.and (infiniteSentence L)` has the same models on `ℕ` as `φ` and none on any `Fin n`.

* **Transport between presentations.** Consuming (M0) (`onBoundedFormulaInf`,
  `realize_onBoundedFormulaInf`): for a language equivalence `e : L ≃ᴸ L'` of relational languages,
  the induced homeomorphism of code spaces on every carrier, preserving isomorphism and sending
  `modelsOf φ` onto `modelsOf (onBoundedFormulaInf e.toLHom φ)`; hence
  `lift_countableModelCount_onBoundedFormulaInf` (equality after `Cardinal.lift`) and
  `hasPerfectlyManyCountableModels_onBoundedFormulaInf_iff`. Applied to (M4)'s
  `smallPresentationEquiv L` for countable relational `L` (whose function symbols are countable, as
  there are none), they move every count and perfect set to `Language.{0, 0}`. Carriers in other
  universes are handled by `classOf`.

**Acceptance check.** Take the language with countably many unary predicates `P_i` (`i ∈ ℕ`) and
no other symbols, and `φ := ∃ x ∀ y, y = x`. A code on `Fin 1` is one bit for each `P_i`, so the
codes on `Fin 1` are the points of `ℕ → Bool`; every one is a model; the only permutation of
`Fin 1` is the identity, so isomorphism is equality. The whole code space is therefore a perfect set
of pairwise non-isomorphic models: `HasPerfectSetOfNonisoModelsOn (Fin 1) φ`, so continuum many
pairwise non-isomorphic one-element structures. There are no models on `ℕ` or on `Fin n` for
`n ≠ 1` (the empty structure fails `∃ x`), and `countableModelCount φ = 𝔠`. Every isolating rank is
vacuously bounded on the (empty) models on `ℕ`, so the bounded-rank dichotomy of Layer 2 applies,
and its perfect alternative holds only at the tier `Fin 1`; likewise Morley's theorem. This is why
the finite tiers are part of `HasPerfectlyManyCountableModels`.

⚠ **API warning.** Do not count only the models on `ℕ` and call the result "the number of countable
models": the example above has continuum many countable models and none on `ℕ`. Conversely, do
not drop the finite tiers from Vaught's conjecture without the reduction through
`infiniteSentence` (Layer 5).

### Layer 1: back-and-forth stratification and isolating ranks

Build:

* **Levels on models.** The restriction `bfEquivSetoidOn φ β` of (S4)'s `bfEquivSetoid β` to the
  models of `φ` on `ℕ`; monotonicity in `β`; the projection of isomorphism classes onto level-`β`
  classes (well defined by `structureIsoSetoid_le_bfEquivSetoid`) and its surjectivity, so
  `#(Quotient (bfEquivSetoidOn φ β)) ≤ #(Quotient (isoSetoidOn ℕ φ))`. For `β < ω₁`,
  `bfEquivSetoidOn φ β` has Borel graph (S4 restricted to the Borel set `modelsOf φ`).
* **Scott sentences cut out levels.** For `α < ω₁`, `modelsOf (scottSentenceAtLevel c α) =
  {d | bfEquivSetoid α c d}`, where `scottSentenceAtLevel c α` is the parent's
  `scottFormula Fin.elim0 α` of the structure decoded from `c`, read as a sentence. Every level
  class is therefore a sentence cut.
* **Isolating ranks.** `IsIsolatingRank ρ` for `ρ : StructureSpace L → Ordinal.{0}`, with exactly
  three fields: invariance under isomorphism, values below `ω₁`, and isolation
  (`bfEquivSetoid (ρ c) c d` implies `c ≈ d`). API: `isolates_of_le` (isolation at every level at or
  above `ρ c`); the lift to isomorphism classes with values below `ω₁`; `of_le` (an invariant map
  below `ω₁` lying above an isolating rank is one, so the contract does not determine the rank and
  no least isolating rank is asserted); `exists_unbounded_of_not_countable` (on a set meeting
  uncountably many classes, every isolating rank lies below one that is unbounded there);
  `exists_bound_of_countable` (countably many classes give a bound).
* **The instance.** `isIsolatingRank_scottHeight`: `c ↦ scottHeight ℕ` of the decoded structure is
  an isolating rank (S5). In (S5)'s convention the Scott height of `M : Type w` lies in
  `Ordinal.{w}` and external stabilization quantifies over all countable `N : Type`, finite ones
  included; for codes on `ℕ` it lies in `Ordinal.{0}`, as the contract requires. Hence
  `exists_isIsolatingRank`.
* **Countable-ordinal bookkeeping.** For `r : X → Ordinal.{0}` with values below `ω₁` and countable
  fibres: `#X ≤ ℵ₁`; `#X = ℵ₁` when `X` is uncountable; and a subset of `X` is countable iff `r` is
  bounded below `ω₁` on it. These are pure cardinal arithmetic over `Ordinal.iSup_lt_omega_one`
  and regularity of `ℵ₁`.
* **The stratification bound.** For an isolating rank `ρ` and a set `K` of codes, the classes of `K`
  of rank `α` inject into the level-`α` quotient of `K` (two codes of rank `α` that are
  `bfEquivSetoid α` are isomorphic). Hence the relativized bound: if every level `α < ω₁` of `K` has
  at most `ℵ₁` classes then `K` meets at most `ℵ₁` isomorphism classes, and
  `mk_isoClasses_le_aleph_one_of_countable_levels` for countable levels. The sentence form: if every
  `bfEquivSetoidOn φ α` with `α < ω₁` has countably many classes, then
  `#(Quotient (isoSetoidOn ℕ φ)) ≤ ℵ₁`. With the Scott-height instance this is the stratification of
  the models of `φ` on `ℕ` by Scott height: the stratum of height `α` injects into the level-`α`
  quotient, and there are `ℵ₁` strata.
* **Level-by-level transfer.** For a set `C` of models and every arity `n`, the depth-`α` relation
  on `n`-tuples of members (`bfTupleSetoid φ C α n`), and:
  * *successor*: `(α + 1)`-equivalence of tuples is `α`-equivalence together with equality of the
    depth-`α` extension spectrum (the set of level-`α` classes of one-point extensions); so
    countably many `α`-classes and countably many realized extension spectra give countably many
    `(α + 1)`-classes, and likewise with `ℵ₁` for `ℵ₀`;
  * *isolation*: `Setoid.IsolatedBy E R` for a countable family `E` (every point is pinned, up to
    `R`, by its class under some `E i`), with `Setoid.countable_quotient_of_isolatedBy` and the
    general cardinal transfer; at a limit `λ < ω₁`, pointwise isolation from the levels below `λ`
    carries countability through `λ`;
  * *assembly*: `BFSmall φ C`, the three local conditions (countably many level-0 classes of
    `n`-tuples, countably many realized extension spectra at every `α < ω₁`, and pointwise
    isolation at limits), gives countably many classes at every level and arity, hence at most
    `ℵ₁` isomorphism classes represented in `C`.

  Level `0` is a hypothesis in `BFSmall`, not a consequence of a countable language: the atomic
  type of a tuple is a subset of a countable set of atoms and can take continuum many values.
  At a limit `λ`, countably many classes at every level below `λ` do not by themselves bound the
  classes at `λ`: a level-`λ` class is a coherent family of lower classes, and a countable product
  of countable sets can have the size of the continuum. Isolation is the hypothesis that closes this
  gap.

**Acceptance check.** For a set `K` meeting a single isomorphism class, every level of `K` has one
class and the stratification bound gives `≤ ℵ₁` (indeed `1`).

⚠ **API warning.** Isolation is one-sided: `bfEquivSetoid (ρ c) c d` decides isomorphism with `c`,
not with `d`. The injection of the rank-`α` classes into the level-`α` quotient uses the rank of
both codes, which agree because both have rank `α`. Do not state isolation symmetrically.

### Layer 2: the bounded-rank dichotomy

For an isolating rank `ρ` bounded on `modelsOf φ` by `β < ω₁`, isomorphism on `modelsOf φ` equals
`bfEquivSetoidOn φ β` (forward by `structureIsoSetoid_le_bfEquivSetoid`; backward by monotonicity
down to `ρ c` and isolation), hence has Borel graph. Build:

* `countableModelCount_le_aleph0_or_hasPerfectlyMany_of_bounded`: for the tier `ℕ`, (E1), relative
  form, on the Borel set of models on `ℕ` with `R = F` = isomorphism, whose second alternative (a
  continuous Cantor family of pairwise non-isomorphic models) becomes a perfect set by (E0); for
  each `Fin n`, the finite-tier dichotomy of Layer 0; then the summand bounds. A perfect set may
  appear at a finite tier only (Layer 0 acceptance check).
* `countableModelCount_le_aleph0_or_eq_continuum_of_bounded`: the cardinal form, by
  `HasPerfectlyManyCountableModels.countableModelCount_eq`; the cardinality form (E2) applied to
  the same relations is an alternative proof and is stated as `..._of_bounded'`.
* The textbook form with external Scott height: if `scottHeight M ≤ β < ω₁` for every countable
  model `M : Type` of `φ`, the same two conclusions.
* The internal form: if `internalScottRank` of every model on `ℕ` is at most `β < ω₁`, the same
  conclusions, via (S5)'s comparison (the external height is then at most `β + ω < ω₁`).
* The converse direction, for sentences: if `φ` has countably many countable models then every
  isolating rank is bounded on `modelsOf φ` (`exists_bound_of_countable`).

**Acceptance check.** Let `φ` say that `E` is an equivalence relation all of whose classes are
infinite. Every countable model is homogeneous (a finite partial isomorphism extends to an
automorphism permuting the classes), so every tuple has orbit rank `0` and every model has
`internalScottRank = 1`. The countable models are the empty structure and, for each
`k ∈ {1, 2, …, ℵ₀}`, the structure on `ℕ` with `k` infinite classes; so
`countableModelCount φ = ℵ₀`, the first alternative.

### Layer 3: Morley's theorem

Build:

* **One level.** `countable_bfClasses_or_hasPerfectSet`: for `α < ω₁`, (E1), relative form, on the
  Borel set `modelsOf φ` with `F = bfEquivSetoidOn φ α` and `R` = isomorphism (which refines `F`),
  followed by (E0)'s passage from a Cantor antichain to a perfect set, gives countably many
  level-`α` classes or a perfect set of pairwise non-isomorphic models on `ℕ`. This
  is the only point at which Silver enters the tier `ℕ`; Layer 4 quotes it.
* **The tier `ℕ`.** `#(Quotient (isoSetoidOn ℕ φ)) ≤ ℵ₁ ∨ HasPerfectSetOfNonisoModelsOn ℕ φ`: with
  no perfect set every level is countable, and the stratification bound applies. Split on the
  conclusion, not on a cardinal.
* **The summit.** `morley_countableModelCount_le_aleph_one_or_hasPerfectlyMany`, combining the
  tier `ℕ` with the finite-tier dichotomy (each perfect alternative comes from (E1)'s Cantor family,
  at whichever tier it occurs); and `morley_countableModelCount`, the cardinal form,
  obtained from it with `countableModelCount_le_continuum` and
  `HasPerfectlyManyCountableModels.countableModelCount_eq`, without (E2). The route through (E2)
  (each level `≤ ℵ₀` or `= 𝔠`; if some level has `𝔠` classes so does isomorphism) is a second proof
  of the cardinal form and is also built, as `morley_countableModelCount'`, since it uses only the
  cardinal dichotomy.
* **Thin sentences.** `IsThinOnNatModels φ` (no perfect set of pairwise non-isomorphic models on
  `ℕ`); a thin sentence has at most `ℵ₁` models on `ℕ`, and countably many classes at every level;
  fewer than `𝔠` models on `ℕ` implies thin.

**Acceptance check.** For `φ` saying that `E` is an equivalence relation, give the explicit perfect
set: split `ℕ` into an infinite reservoir and disjoint blocks `B_k` of size `k + 2`; for
`z : ℕ → Bool` let `f z` make `B_k` one class when `z k = true` and split it into singletons
otherwise, with the reservoir all singletons. Each bit of the code of `f z` depends on finitely many
bits of `z`, so `f` is continuous; the class sizes at least `2` occurring in `f z` are
`{k + 2 | z k = true}`, so distinct `z` give non-isomorphic models. By (E0) the range is a perfect
set of pairwise non-isomorphic models: Morley's second alternative holds with this witness, with no
use of CH.

⚠ **API warning.** The cardinal form "`≤ ℵ₁` or `= 𝔠`" does not determine which alternative holds:
under CH, `ℵ₁ = 𝔠`. The witnessed form does; prove and export both, and derive the cardinal form
from the witnessed one.

### Layer 4: scattered classes and thinness criteria

All statements are about an arbitrary set `K` of codes on `ℕ` unless they say otherwise; no
analyticity, Borelness or invariance of `K` is assumed where none is stated.

**4a. Back-and-forth scatteredness.**

* `BFScattered K`: for every `α < ω₁`, `K` meets countably many `bfEquivSetoid α`-classes (classes
  of the restricted relation, not codes). `BFScattered.mono`.
* `not_hasCantorAntichainOn_of_bfScattered`: `K` carries no Cantor antichain for isomorphism (the
  range of one is analytic, (S7) finds one level separating it, and the class map at that level
  would inject Cantor space into a countable set). With countably many relation symbols, `K` is
  thin (`IsThinOn`, by E0).
* The observation adapter: maps `obs α` on `K` with countably many realized values at each level,
  equal values implying `bfEquivSetoid α`, give `BFScattered K`.

**4b. Counting a scattered class.** For an isolating rank `ρ` and `BFScattered K`: each rank fibre
of the classes of `K` is countable; `K` meets at most `ℵ₁` classes; exactly `ℵ₁` when uncountably
many; and countably many iff `ρ` is bounded below `ω₁` on `K`
(`IsIsolatingRank.countable_isoClasses_iff_bounded`). Hence boundedness on a scattered class is
the same for all isolating ranks. Also the code form of the isolating level: a set meeting
countably many classes (the set itself may be uncountable) has one level `γ < ω₁` at which
`bfEquivSetoid γ` decides isomorphism within it.

**4c. Thin sentences are exactly the scattered ones.**
`bfScattered_modelsOf_iff_isThinOnNatModels`: thin implies scattered by the one-level step of
Layer 3; scattered implies thin by 4a. Corollary: fewer than `𝔠` models on `ℕ` implies scattered.

**4d. Concentration.** `ConcentratedAtBFLevels C`: at each level `α < ω₁` some centre `k` (possibly
outside `C`, depending on `α`) has all but countably many classes of `C` in its level-`α` class.
Prove: monotonicity; countably many classes imply concentrated; concentrated implies
`BFScattered` (hence thin); **saturation**: if `B` and `C \ B` are analytic and `B` is closed under
isomorphism within `C`, then from some `α < ω₁` on, `bfEquivSetoid`-equivalent members of `C` lie on
the same side of `B` (by S7), and conversely saturation at a single level implies that invariance;
and **one side is small**: for concentrated `C` and such a `B` (or `B = C ∩ D` with `D` Borel and
`C` analytic), `B` or `C \ B` meets only countably many classes.

**4e. Sentence spectra and Borel observables.** `sentenceTheory θ c : ℕ → Bool`, the truth sequence
of a countable list of sentences, measurable and isomorphism invariant. Build:

* *relative López–Escobar*: for a standard Borel `X`, a Borel `f : X → StructureSpace L` and a
  Borel `U ⊆ X` with `x ∈ U ↔ y ∈ U` whenever `f x ≈ f y`, some sentence `θ` has
  `f x ∈ modelsOf θ ↔ x ∈ U` for all `x` (saturate the images of `U` and `Uᶜ` under the logic
  action, analytic by (S3)'s `analyticSet_iUnion_smul`, and apply S6);
* *Cantor recovery*: for a Borel `f : (ℕ → Bool) → StructureSpace L` with pairwise non-isomorphic
  values, countably many sentences `θ n` satisfy `f x ∈ modelsOf (θ n) ↔ x n = true`;
* `isThin_iff_countable_sentenceSpectra`: for Borel `C`, thin iff every list `θ` has countably many
  realized truth sequences on `C` (in one direction, (E1), relative form, on `C` for the Borel
  kernel of `sentenceTheory θ`, which isomorphism refines: its Cantor-family alternative is a Cantor
  antichain for isomorphism and contradicts thinness; Cantor recovery in the other); the sentence
  form for `modelsOf φ`;
* *single-sentence splits*: if a presentation `classOf : C → Q` of the classes, with truth read
  through it, has for each sentence a truth side with countably many points of `Q`, then `C` is
  thin (no surjectivity, measurability or σ-algebra on `Q` assumed; the countable-exceptions step
  is (E0)'s `exists_countable_exceptions_of_splits`);
* *Borel observables*: an isomorphism-invariant Borel map from a standard Borel family into Cantor
  space (or any countably separated measurable space) is a truth sequence of countably many
  sentences; on a Borel class a Borel complete invariant exists iff a complete countable list of
  sentences exists; and a thin Borel class with a Borel complete invariant has countably many
  classes.

**4f. Fragment spectra.** For a countable fragment `F` (M1) and arity `n`, with (M2)'s slice
`Fragment.slice F n` and realized truth assignment: the coded type `F.pointedType c a`, the realized
truth assignment of `a` in the decoded structure, jointly measurable in the code and the tuple,
and transported along isomorphisms of codes by (M2); the spectrum `F.typeSpectrum n C`, the types
realized by `n`-tuples of members of `C`, counted across `C`;
spectrum equivalence ("same realized `F`-types at arity `n`") has Borel graph and is refined by
isomorphism. Prove, for Borel `C`, thin iff every countable fragment has a countable spectrum at
every arity ((E1), relative form, for spectrum equivalence in one direction, its Cantor-family
alternative being a Cantor antichain for isomorphism; in the other, the arity-0 spectrum of
`Fragment.generated` of the range of a list `θ` determines its truth sequences). This is the
classical definition of a scattered sentence.

**4g. Morleyization transport.** For a countable set `Φ` of formulas (M3): by (M3)'s instances
`morleyize L Φ` is relational with countably many relation symbols when `L` is, and by (M3)'s
`nonempty_morleyEquiv_iff` canonical expansions are isomorphic exactly when the base structures are.
The targets, all stated in `Suggested.lean` against (M3)'s objects:

* `morleyCode Φ : StructureSpace L → StructureSpace (morleyize L Φ)`, the expansion code: base bits
  copied (`morleyCode_inl`), the bit of the symbol of `φ` at `v` the truth of `φ` at `v` in the
  decoded structure (`morleyCode_inr_eq_true_iff`);
* `morleyBase`, reading off the base bits, with `morleyBase_morleyCode` and `morleyCode_injective`;
* `toStructure_morleyCode`, decoding agreement: `toStructure (morleyCode Φ c)` is (M3)'s
  `morleyExpansion Φ` of `toStructure c`;
* `measurableEmbedding_morleyCode`: Borel because satisfaction is Borel in the code, injective,
  hence a measurable embedding by Lusin–Souslin (countably many relation symbols, `Φ` countable);
* `structureIsoSetoid_morleyCode_iff`: expansion codes are isomorphic exactly when the base codes
  are, which is `nonempty_morleyEquiv_iff` after decoding agreement;
* `range_morleyCode`: the range is the set of codes whose new bits agree with the truth of their
  formulas in the decoded base code;
* `hasCantorAntichainOn_image_morleyCode_iff`: by (E0)'s `hasCantorAntichainOn_image_iff` with the
  two previous items, a class of base codes carries a Cantor antichain, or is thin, exactly when its
  image does.

**4h. Rank analyses of thinness.** `ThinRankAnalysis r A`, the evidence for the standard route to
thinness (a rank below `ω₁`, countable fixed-rank antichains, and a bound on the rank over a
continuously embedded Cantor subcopy of any Cantor antichain), with `no_cantorAntichain` and
`isThinOn` derived from it, not stored in it. The tail lemma: if for every list `θ` some threshold
`b < ω₁` makes the spectrum of `θ` on `{c ∈ C | b ≤ r c}` countable, then `r` is bounded below `ω₁`
on the range of every Borel `f : (ℕ → Bool) → StructureSpace L` into `C` with pairwise
non-isomorphic values.

**Acceptance check.** A concentrated class is back-and-forth scattered (4d), hence thin (4a), with
no analyticity hypothesis.

⚠ **API warning.** Thinness of an arbitrary class does not give a complete countable list of
sentences: countable sentence spectra quantify over each list separately, and a thin Borel class
with uncountably many classes has no Borel complete invariant (4e). Keep the two quantifier orders
apart.

### Layer 5: Vaught's conjecture

**Per-sentence predicates** (universe-polymorphic in `L`):

* `HasVaughtDichotomy φ := countableModelCount φ ≤ ℵ₀ ∨ HasPerfectlyManyCountableModels φ`;
* `HasVaughtCount φ := countableModelCount φ ≤ ℵ₀ ∨ countableModelCount φ = 𝔠`.

**The conjectures.** Each quantifies over relational `L : Language.{0, 0}` with
`[Countable (Σ l, L.Relations l)]`, because a countable language can always be presented in
universe `0`, and counts all at-most-countable models: those on `ℕ` and, explicitly, those on each
`Fin n`. They are statements, not targets.

| Name | Statement | A counterexample is | Status |
| --- | --- | --- | --- |
| `VaughtConjecture` (perfect-set form; equivalent to Steel's "strong" form and, by Layer 4c, to the "absolute" form of Baldwin, Friedman, Koerwien and Laskowski) | every `φ` has `HasVaughtDichotomy φ` | a sentence with exactly `ℵ₁` countable models and no perfect set of pairwise non-isomorphic ones; no hypothesis on `𝔠` | the conjecture this roadmap calls Vaught's conjecture |
| `CardinalVaughtConjecture` (Vaught's form) | every `φ` has `HasVaughtCount φ` | a sentence with exactly `ℵ₁` countable models, together with `ℵ₁ < 𝔠` | true under CH by Morley's theorem; CH does not settle `VaughtConjecture` |
| `FirstOrderVaughtConjecture` (Vaught's original setting) | every complete first-order `T` in such an `L` has countably many models on `ℕ` up to isomorphism, or a perfect set of pairwise non-isomorphic ones | a complete theory with uncountably many models on `ℕ` and no perfect set | implied by `VaughtConjecture`; the converse is not claimed |

Prove, with exactly the hypotheses shown:

* `not_hasVaughtDichotomy_iff`: `¬ HasVaughtDichotomy φ ↔ countableModelCount φ = ℵ₁ ∧
  ¬ HasPerfectlyManyCountableModels φ` (no CH hypothesis; from the witnessed Morley theorem);
* `not_hasVaughtCount_iff`: `¬ HasVaughtCount φ ↔ countableModelCount φ = ℵ₁ ∧ ℵ₁ < 𝔠` (from the
  cardinal Morley theorem and `ℵ₁ ≤ 𝔠`);
* `VaughtConjecture.cardinal : VaughtConjecture → CardinalVaughtConjecture`;
* `cardinalVaughtConjecture_of_aleph_one_eq_continuum : ℵ₁ = 𝔠 → CardinalVaughtConjecture`;
* `cardinalVaughtConjecture_iff_vaughtConjecture`: if `ℵ₁ < 𝔠`, then
  `CardinalVaughtConjecture ↔ VaughtConjecture`;
* the infinite-model reduction `hasVaughtDichotomy_and_infiniteSentence_iff`:
  `HasVaughtDichotomy (φ.and (infiniteSentence L))` iff the models of `φ` on `ℕ` are countably many
  or contain a perfect set of pairwise non-isomorphic ones; the finite tiers always satisfy the
  dichotomy (Layer 0), so `VaughtConjecture` is equivalent, with no hypothesis, to its statement for
  models on `ℕ`;
* the scattered reformulation `vaughtConjecture_iff_bfScattered`, **unconditionally**:
  `VaughtConjecture` iff every sentence whose models on `ℕ` are back-and-forth scattered has
  countably many models on `ℕ`; and `cardinalVaughtConjecture_iff_bfScattered`, the same with
  `CardinalVaughtConjecture`, **under `ℵ₁ < 𝔠`** (by the previous equivalence; under CH the
  cardinal form holds while the scattered statement remains open);
* the rank form, unconditionally: `VaughtConjecture` iff for every isolating rank (equivalently,
  for the Scott height) every thin sentence has the rank bounded below `ω₁` on its models on `ℕ`;
* the counterexample profile (no CH hypothesis): a counterexample to `HasVaughtDichotomy` has thin
  models on `ℕ`, countably many classes at every level, every isolating rank unbounded below `ω₁` on
  its models on `ℕ` with countable fibres, and countably many finite models;
* the first-order version: `modelsOfTheory T`, `FirstOrderVaughtConjecture`, and
  `VaughtConjecture.firstOrder`. A first-order theory in a countable relational language is a
  countable set of sentences (Mathlib's `Countable (Σ n, L.BoundedFormula α n)` under
  `[Countable L.Symbols]`), so (M1)'s `Theoryω.conjunction` of their embeddings `toInf`, with
  `infiniteSentence L`, has the models of `T` on `ℕ` as its models; completeness is not used in the
  implication. The two conjectures are distinct definitions: no target identifies them, and the
  converse implication is not a target. `FirstOrderVaughtConjecture` is stated for countable
  relational vocabularies. Reducing languages with function or constant symbols to it means
  transferring the count of countable models across InfinitaryModelExistence's graph translation;
  that transfer is outside this series of roadmaps and must reuse that roadmap's translation and
  its semantic API;
* universes: `vaughtConjecture_iff_forall_universe`, the conjecture over `Language.{0, 0}` equals
  the conjecture over countable relational languages in any universe, by the transport results of
  Layer 0 ((M4)'s `smallPresentationEquiv`, `lift_countableModelCount_onBoundedFormulaInf`,
  `hasPerfectlyManyCountableModels_onBoundedFormulaInf_iff`); carriers in other universes are
  covered by `classOf`. The same transport is stated for `FirstOrderVaughtConjecture`.

**Minimally uncountable sentences.** For a set `K` of codes:

* `MinimallyUncountableOn K`: `K` meets uncountably many classes, and for every sentence `θ` one of
  `K ∩ modelsOf θ`, `K \ modelsOf θ` meets only countably many (cuts range over sentences, not
  arbitrary invariant sets); `Sentenceω.MinimallyUncountable φ` for `K = modelsOf φ`, with the
  literal form through `φ.and θ` and `φ.and θ.not`.
* `BoundedRankOn ρ K`, `UnboundedRankOn ρ K` for an arbitrary `ρ`, with monotonicity, the empty
  class, and countable unions (regularity of `ℵ₁`); `MinimallyUnboundedOn ρ K` (unbounded, and every
  sentence cut has a side on which `ρ` is bounded).
* The generic engine: for a smallness predicate closed under subsets and countable unions, if `K`
  is not small, every sentence cut has a small side, and `K` meets countably many classes at level
  `α < ω₁`, then some level-`α` class of a member of `K` is not small and its complement in `K` is.
  Instances: "meets countably many classes" and "`ρ` bounded".
* Every cut by a level class has a small side (level classes are sentence cuts, Layer 1).
* Thinness from sentence cuts: if every sentence cut of `K` has a side meeting countably many
  classes, `K` is thin (4e, single-sentence splits); so a minimally uncountable class is thin.
* `minimallyUncountableOn_modelsOf_iff`: the models of `φ` are minimally uncountable iff they are
  concentrated and meet uncountably many classes; and, for every isolating rank `ρ`, iff they are
  back-and-forth scattered and `φ` is minimally unbounded for `ρ` (Montalbán's minimally unbounded
  sentences). On a scattered class, minimal unboundedness does not depend on the isolating rank.
* `not_vaughtConjecture_of_minimallyUncountableOn`: a minimally uncountable sentence refutes
  `VaughtConjecture`.

**Minimal counterexamples (Harnik–Makkai; Steel).** New work, following the route of Montalbán,
Part 2, Ch. XII §2 (Lemmas XII.5–XII.6 and Theorem XII.7), restated in the `BFEquiv` convention of
the parent roadmap. In order:

1. **Level classes are sentences.** Layer 1's `modelsOf_scottSentenceAtLevel`
   (Montalbán's Lemma XII.5, with `bfEquivSetoid β` in place of his `≡_β`; the hierarchies differ,
   but the statement holds for either).
2. **Saturation of a sentence.** `exists_bfLevel_saturated_modelsOf`: for every sentence `θ` there
   is `β₀ < ω₁` such that for every `β ≥ β₀`, `bfEquivSetoid β`-equivalent codes agree on `θ`.
   Proof: (S7) applied to the Borel, hence analytic, set of pairs in `modelsOf θ × (modelsOf θ)ᶜ`,
   which contains no isomorphic pair; then monotonicity. This replaces Montalbán's appeal to the
   quantifier complexity `Π^in_α` of `θ`, so no quantifier-rank preservation theorem is needed.
3. **The limit model.** `exists_limit_of_bfEquiv_chain`: for codes `c i` on `ℕ` and a monotone
   `α : ℕ → Ordinal.{0}` with `bfEquivSetoid (α i + ω) (c i) (c (i + 1))` for all `i`, there is a
   code `d` with `bfEquivSetoid (α i) d (c i)` for all `i`. Construction: build injective tuples
   `a_s` of length `n_s` in `c s` such that the first `n_s` entries `b_s` of `a_{s+1}` satisfy
   `BFEquiv (α s + 1) (c s, a_s) (c (s+1), b_s)` (the link at `s`): `c s` and `c (s+1)` are
   equivalent at `α s + 1 + n_s < α s + ω` (`BFEquiv.limit`, monotonicity), and `n_s` forth steps
   give `b_s`. Schedule each pair `(j, m)`, `m` an element of `c j`, at its own stage `k > j`. At
   that stage, push `m` up the links `j, …, k − 1`, restricted to the first `n_j` entries by
   `BFEquiv.comp`, each link one forth step from `α s + 1` to `α s ≥ α j`. This gives `m_k` in `c k`
   with `BFEquiv (α j) (c j, snoc a_j m) (c k, snoc (b_{k−1} restricted to n_j) m_k)`. Put
   `a_k := snoc b_{k−1} m_k`, or `a_k := b_{k−1}` if `m_k` already occurs in `b_{k−1}`. The
   positions exhaust `ℕ`, since every `c j` is infinite and an element outside `a_j` is matched at a
   position `≥ n_j`. The limit code `d` reads each relation bit on positions from any long enough
   `a_k`, consistently because links preserve atomic types. Then prove by induction on `γ`, for all
   `i` with `γ ≤ α i`, that `(c i, a_i)` and the first `n_i` positions of `d` are `BFEquiv γ`.
   Forth: the induction hypothesis at a later `k`, restricted by `BFEquiv.comp`, and the back clause
   of the chain bound `(c i, a_i) ~ (c k, a_k restricted to n_i)` at level `α i + 1` (transitivity
   of links, monotonicity of `α`). Back: the match of the given element at level `α i` and the
   induction hypothesis at its stage. Ordinal offsets: link `s` needs `α s + 1 + n_s` with `n_s`
   unbounded, so `α s + ω` is a uniform offset that suffices. It is proved directly in the
   one-element convention, not translated from Montalbán's `≡_{α_i + 3}`, whose `≡_β` moves blocks.
   The conclusion is at `α i` with no offset.
4. **The splitting tree.** Let `modelsOf Θ` be back-and-forth scattered and meet uncountably many
   isomorphism classes, and suppose no `Θ.and θ` has minimally uncountable models. Call a set
   *large* if it meets uncountably many isomorphism classes. Put `α_0 :=` the saturation level of
   `Θ`. Since `modelsOf Θ` meets countably many level-`α_0` classes and is large, the class `C_∅` of
   some `A_∅ ∈ modelsOf Θ` is large, and `C_∅ ⊆ modelsOf Θ` by saturation. Build codes `A_σ` (`σ`
   a finite binary word) and an increasing sequence `α_i < ω₁` with `α_{i+1} ≥ α_i + ω` such that
   each class `C_σ := {d | bfEquivSetoid α_|σ| A_σ d}` is large and contained in `modelsOf Θ`, and
   `A_{σ0}`, `A_{σ1}` are `bfEquivSetoid α_|σ|`-equivalent to `A_σ` but not
   `bfEquivSetoid α_{|σ|+1}`-equivalent to each other. At length `n`, for each of the `2^n`
   words `σ`: `C_σ` is the model set of `Θ.and (scottSentenceAtLevel A_σ α_n)`; by assumption some
   sentence `φ_σ` splits it into two large sides. Take one `α_{n+1} < ω₁` at least `α_n + ω` and
   the saturation levels of all `φ_σ` with `|σ| = n`, so that for each such `σ` both sides are
   unions of level-`α_{n+1}` classes; each side has countably many such
   classes (scatteredness) and is large, so one of its classes is large; take `A_{σ0}`, `A_{σ1}`
   there.
5. **The reduction.** `exists_minimallyUncountableOn_and_of_bfScattered`: under the hypotheses of
   step 4 some `Θ.and θ` has minimally uncountable models. Otherwise, for each `X : ℕ → Bool`, step
   3 applied to `A_{X↾1}, A_{X↾2}, …` with levels `α_0, α_1, …` (consecutive codes are equivalent at
   `α_{i+1} ≥ α_i + ω`) gives a code `A_X` with `bfEquivSetoid α_i A_X A_{X↾(i+1)}` for all `i`.
   Each `A_X` lies in `C_∅ ⊆ modelsOf Θ`. If `X`, `Y` first differ at `i`, then
   `A_X ~ A_{X↾(i+2)} ~ A_{X↾(i+1)}` and likewise for `Y` at level `α_{i+1}`, while `A_{X↾(i+1)}`
   and `A_{Y↾(i+1)}` are inequivalent at `α_{i+1}`; so `A_X`, `A_Y` are inequivalent at
   `β := sup_i α_i < ω₁`. That gives continuum many level-`β` classes in `modelsOf Θ`, contradicting
   scatteredness. No continuity of `X ↦ A_X` is needed, and no CH: the contradiction is with
   scatteredness, not with a cardinal bound.
6. **Consequences.** `vaughtConjecture_iff_forall_not_minimallyUncountableOn` (with Layer 4c and the
   infinite-model reduction): `VaughtConjecture` holds iff no sentence has minimally uncountable
   models. Every counterexample has a minimally uncountable strengthening. The two forms of
   "countably many models on `ℕ`" used here, through `isoSetoidOn ℕ φ` and through the image of
   `modelsOf φ` in the quotient by `structureIsoSetoid L`, agree by
   `countable_quotient_isoSetoidOn_iff`; and `not_vaughtConjecture_of_minimallyUncountableOn`
   passes through `φ.and (infiniteSentence L)`, which has the same models on `ℕ` and no finite
   models, since the finite tiers of `φ` can carry a perfect set.

**Acceptance check.** `VaughtConjecture.cardinal`,
`cardinalVaughtConjecture_of_aleph_one_eq_continuum`, `not_hasVaughtCount_iff` and
`cardinalVaughtConjecture_iff_vaughtConjecture` compile from Layers 0 and 3 alone.

⚠ **API warning.** Under CH the cardinal conjecture is a theorem (by Morley), so it is not the
statement to call Vaught's conjecture. Do not define `VaughtConjecture` by the cardinal count, and
do not use the cardinal form in any reformulation stated without `ℵ₁ < 𝔠`.

### Layer 6: a structure of internal Scott rank ω whose level-ω class is large

This layer exists to exercise Layers 1–4: it shows that the parent roadmap's internal Scott rank is
not an isolating rank, that the Scott height of CountableStructureSpaces can exceed the internal
rank, and that a single back-and-forth class at a limit level can meet continuum many isomorphism
classes. It builds only what that needs.

**The witness.** Fix `U = ℕ`, the empty component language, default component `B_* = ℕ`, components
`B u = Fin (u + 1)`, and allowed sets `A n = {u | u ≤ n}`. The *rows* are the nondecreasing finite
words `p` over `ℕ` with `p[i] ≤ i`. The relational language `lang ℕ` has `row` (unary), `own`
(binary), and `lab τ` (unary) for each nonempty word `τ` over `ℕ`; the base structure `M` has the
rows and, for each row `p` and label `τ`, a fiber `Fin (last τ + 1)` if `τ` is a prefix of `p` and
`ℕ` otherwise, with `row`, `own(x, p)` and `lab τ` interpreted as membership. For `z : ℕ → Bool` the
path `π_z (2n) = n`, `π_z (2n + 1) = n + (z n : ℕ)` is allowed, nondecreasing, and injective in `z`;
the companion `N_z` adds one row following `π_z` (its fiber at a prefix of `π_z` of length `k` is
`Fin (π_z (k - 1) + 1)`, and `ℕ` elsewhere). `M` and every `N_z` are countably infinite.

**Targets and conventions.**

* `internalScottRank M = ω`, in the parent's convention `SR(M) = sup_a (orbitRank a + 1)` with
  `orbitRank` the least orbit-stable level. Proof route: *upper bound*, every tuple `a` of `M` is
  pinned up to automorphism at a finite level (append the owner rows of `a`, at cost `|a|` levels;
  the rows of the extended tuple are pinned up to fiberwise isomorphism at level `r + 2` where `r`
  bounds their lengths, because `ℕ ≡_k Fin (u + 1)` holds exactly for `k ≤ u + 1`; adjust the fiber
  isomorphisms on the finitely many occupied fibers, where components are pure sets of orbit rank
  `0`), so every orbit rank is finite; *lower bound*, for each `k` the rows `[0, 1, …, k]` and
  `[0, 1, …, k, k]` differ only in the fiber at the label `[0, …, k, k]`, which is `Fin (k + 1)`
  against `ℕ`; they are `BFEquiv k` (back-and-forth assembly along the transposition of the two
  rows) and not automorphic (an automorphism would restrict to an isomorphism `Fin (k + 1) ≅ ℕ`), so
  the orbit rank of `[0, …, k]` is greater than `k`.
* `BFEquiv ω` between `N_z` and `M` (empty tuples): for each `m`, `N_z ≡_m M` by the back-and-forth
  assembly along the Hilbert-hotel bijection of rows that shifts the tail prefixes of `π_z` from
  length `2m` on, because the components along `π_z` from position `2m` on are `≡_m ℕ`; then
  `BFEquiv.limit`.
* `N_z` is not isomorphic to `M`, and `N_z`, `N_{z'}` are not isomorphic for `z ≠ z'`: an
  isomorphism sends rows to rows and fibers onto fibers with the same label, and the path row has a
  fiber `Fin (u + 1)` at labels where every finite row, or the other path row, has `ℕ`.
* `ω < scottHeight M`, in the convention of (S5) (external stabilization against all countable
  structures in `Type`, values in `Ordinal.{0}` for `M : Type`): otherwise
  `nonempty_equiv_of_bfEquiv_of_scottHeight_le` at level `ω` would make `N_z ≅ M`. With (S5)'s
  comparison, `scottHeight M ≤ ω + ω`. The exact value is not a target.

All four are packaged as `exists_internalScottRank_omega_with_large_bfClass`.

**Consequences for the counting interfaces.**

* `not_isIsolatingRank_internalScottRank`: transport `M` and one `N_z` to codes on `ℕ`; they are
  `bfEquivSetoid ω`-equivalent and not isomorphic, while the internal rank of `M` is `ω`.
* Every isolating rank `ρ` satisfies `ω < ρ (code of M)` (otherwise `isolates_of_le` at level `ω`).
* The `bfEquivSetoid ω`-class of the code of `M` meets `𝔠` isomorphism classes: the one-sidedness of
  isolation in Layer 1 is necessary, and countably many classes at the levels below a limit do not
  bound the classes at the limit for an arbitrary class of codes.

The general row-assembly API is built only as far as these proofs use it: the assembled language
and carrier over rows and labelled fibers; isomorphism assembly and restriction; back-and-forth
assembly at the same level for tuples matched along a fixed row bijection; pointed restriction of
back-and-forth equivalence to a fiber with its owner row retained; and the owner-row step. The
parent roadmap's own internal-Scott-rank examples (pure sets, `K₂ ⊔ K₃`, dense linear orders) are
not repeated.

## Worked examples

Discharge these alongside the layers.

* **Pure sets.** In the empty language, `countableModelCount ⊤ = ℵ₀` (one class for each finite
  size and one for `ℕ`); `countableModelCount (infiniteSentence L) = 1`.
* **One element, many predicates** (Layer 0 acceptance): continuum many pairwise non-isomorphic
  one-element structures, a perfect set at the tier `Fin 1`, and no models on `ℕ`. Morley's theorem
  and the bounded-rank dichotomy are witnessed here only through a finite tier
  (`hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates`).
* **Equivalence relations with infinite classes** (Layer 2 acceptance): internal Scott rank `1`,
  exactly `ℵ₀` models.
* **Equivalence relations** (Layer 3 acceptance): an explicit perfect set;
  `countableModelCount = 𝔠`.
* **Ehrenfeucht's example, relationally.** With a binary `<` and unary `P_n` (`n ∈ ℕ`): `<` is a
  dense linear order without endpoints, each `P_n` holds of exactly one element `c_n`, and
  `c_n < c_{n+1}`. Exactly three countable models: the `c_n` cofinal, bounded with a least upper
  bound, bounded without one. So `countableModelCount = 3`, and every isolating rank is bounded on
  its models.
* **Internal rank versus isolation** (Layer 6 acceptance).
* **Thin from concentration.** A set meeting countably many classes is concentrated, scattered and
  thin; the models of a minimally uncountable sentence are concentrated.
* **Vaught under CH.** Under `ℵ₁ = 𝔠`, every sentence has `HasVaughtCount` (Layer 5), while
  `HasVaughtDichotomy` remains a statement about perfect sets.

## Completion criteria

Each definition comes with its rewriting, monotonicity and transport API and the stated examples.
The headline theorems are assembled from the layers, without extra hypotheses asserting Borelness,
thinness, isolation, a dichotomy or CH. The following chains must be visible in the exported
results:

* code spaces → classes and `classOf` bridges → `countableModelCount`, with the finite tiers;
* `BFEquiv` → `bfEquivSetoid` and its Borelness → isolating ranks → the stratification bound;
* bounded isolating rank → Borel isomorphism → Silver → the bounded-rank dichotomy, witnessed and
  cardinal;
* per-level Silver → countable levels or a perfect set → stratification → Morley, witnessed, and
  the cardinal form as a corollary;
* back-and-forth trees → analytic boundedness → uniform separation → scattered implies thin, and
  thin implies scattered by per-level Silver;
* Morley → `not_hasVaughtDichotomy_iff`, the CH and ¬CH reformulations, and the scattered and rank
  forms of `VaughtConjecture`;
* saturation of sentences → limit model → splitting tree → minimal counterexamples →
  `vaughtConjecture_iff_forall_not_minimallyUncountableOn`;
* the rank-`ω` witness → internal Scott rank is not isolating.

A theorem proved for a private code space, a private isomorphism relation, or a private
back-and-forth relation does not discharge its target.

## Coordination

* **Parent roadmap.** The infinitary syntax, back-and-forth and Scott analysis are the
  InfinitaryLogic roadmap's, implemented in Tau Ceti under `TauCeti/ModelTheory/` (Scott's theorem:
  [Tau Ceti #18977](https://github.com/TauCetiProject/TauCeti/pull/18977)). Use those declarations;
  in particular use `TauCeti.scottFormula` and `realize_scottFormula_iff_bfEquiv` for level classes
  rather than a second Scott-formula construction.
* **Sibling roadmaps.** The statements consumed from CountableStructureSpaces,
  BorelEquivalenceRelations and InfinitaryModelExistence are listed in
  [Dependencies](#dependencies-on-other-roadmaps). This roadmap owns: the classes of countable
  models and their count, the finite-carrier isomorphism and dichotomy, the stratification,
  isolating ranks and both dichotomies of Layers 2–3, everything about scattered, concentrated and
  minimally uncountable classes, sentence and fragment spectra of coded classes, the coded
  Morleyization transport, Vaught's conjecture and its reformulations, and row assemblies.
* **Mathlib.** No open Mathlib pull request covers Silver's theorem, López–Escobar, Morley's
  theorem or Vaught's conjecture (searched for those terms and for "Borel equivalence relation",
  "space of structures" and "Scott rank"). The infinitary syntax is
  [Mathlib #42758](https://github.com/leanprover-community/mathlib4/pull/42758), whose names the
  parent follows; [Mathlib #42189](https://github.com/leanprover-community/mathlib4/pull/42189)
  relates the bundled and unbundled countable-language hypotheses, and its unbundled form is the one
  used here. If Mathlib later supplies any object here, adopt its name and shape and delete the
  local one.

## Provenance

A Lean formalization of most of this material exists in
[`cameronfreer/infinitary-logic`](https://github.com/cameronfreer/infinitary-logic) at checkpoint
[`518a366`](https://github.com/cameronfreer/infinitary-logic/tree/518a366cba97b1ae8c4dc64a297a396939bc3e0b)
(Apache-2.0, sorry-free, axioms `propext`, `Classical.choice`, `Quot.sound`). It is Cameron Freer's
repository; credit `cameronfreer/infinitary-logic` in ported files. The map below says where to
look, not what is correct; the targets above differ from it where noted.

Paths are relative to `InfinitaryLogic/` at that checkpoint.

| Layer | Source | Differences from the target |
| --- | --- | --- |
| 0 | `Descriptive/FiniteCarrier.lean` (`isoSetoidOn`, `AllCodedIsoClasses`, `codeModel`, `iso_iff_orbit`, `counting_fin_models_dichotomy`); `Descriptive/StructureIsoSetoid.lean` (`HasPerfectSetOfPairwiseNonisomorphicNatModels`, `IsThinOnNatModels`) | The source's bridges are for models in `Type`; the target's `classOf` works in every universe. `CountableModelClasses` is the source's `AllCodedIsoClasses` |
| 1 | `ModelTheory/MorleyCounting.lean` (`bfEquivSetoid`, `bfProj`, `mk_isoSetoid_subtype_le_aleph_one`); `Descriptive/ScatteredCounting.lean` (`IsIsolatingRank`, `codeStabilizationOrdinal`); `OrdinalCountability.lean`; `ModelTheory/BFExtensionSpectrum.lean`, `BFLimitIsolation.lean`, `BFSmallCounting.lean`; `Descriptive/MinimallyUncountable.lean` (`modelsOf_scottSentenceAt`) | The source stratifies by `scottHeight` directly and instantiates the contract with `stabilizationOrdinal`; the target stratifies by any isolating rank and instantiates it with the external Scott height of CountableStructureSpaces. The source's `scottSentenceAt` is the parent's `scottFormula Fin.elim0 α` |
| 2 | `Descriptive/CountingDichotomy.lean` (`counting_coded_models_dichotomy`), `ModelTheory/CountingCountable.lean`, `ModelTheory/CountingModels.lean` | The source proves only the cardinal form, through the hypothesis `SilverBurgessDichotomy` discharged elsewhere; the witnessed form is new work. `morley_counting_dichotomy` in `CountingModels.lean` is a placeholder returning `True` and is not a migration target |
| 3 | `ModelTheory/MorleyCounting.lean` (`morley_counting`), `Conditional/MorleyPerfect.lean` (`morley_counting_or_perfect`, `morley_counting_or_perfect_cardinal`) | The source's `morley_counting` takes the dichotomy as an argument; the target's theorems take none. The directory name `Conditional/` is historical: these files are proved |
| 4 | `Descriptive/BFScattered.lean`, `BFScatteredSentence.lean`, `Conditional/BFScatteredSilver.lean`, `Descriptive/BFConcentration.lean`, `ScatteredCounting.lean`; `Descriptive/SentenceRecovery.lean`, `SentenceSplits.lean`, `SentenceObservables.lean`, `ObservableConstancy.lean`, `Conditional/SentenceSpectrum.lean`; `Descriptive/FragmentSpectrum.lean`, `RealizedSpectrum.lean`, `Conditional/FragmentSpectrumThin.lean`; `Descriptive/MorleyizationCode.lean`, `MorleyizationThin.lean`; `Descriptive/RankedThinness.lean`, `FragmentTail.lean` | The source states its recovery theorems at `Language.{0, 0}` and transports them through a chosen small presentation (`Descriptive/SmallVocabulary*.lean`); the target states them for every universe of `L` and consumes López–Escobar at that generality from CountableStructureSpaces, so the transport is not a migration target here |
| 5 | `Descriptive/MinimallyUncountable.lean`, `MinimallyUncountableThin.lean`, `MinimallyUnbounded.lean`, `Conditional/MinimallyUncountableHeadline.lean` | The source proves the minimality characterizations (concentrated, scattered and minimally unbounded) and the first half of Montalbán's Lemma XII.8. Its headline module states that it does not formalize the limit-model lemma or the reduction to minimal counterexamples (which it cites as Lemmas XII.6 and XII.7) or the club half of Lemma XII.8; the saturation step, the limit model, the splitting tree and the reduction are new work here. The source has no statement of Vaught's conjecture: the three conjectures and their reformulations are new work. The transport results of Layer 0 (built on InfinitaryModelExistence's language maps and small presentation) are new work; the source's `Descriptive/SmallVocabulary*.lean` transports codes and lifts formulas from the small presentation but provides no lowering of formulas |
| 6 | `ModelTheory/FiberAssembly.lean`, `FiberIsoAssembly.lean`, `FiberBFAssembly.lean`, `FiberBFRestriction.lean`, `FiberOwnerRows.lean`, `FiberPrefixDetection.lean`, `FiberProfileBound.lean`, `FiberProfilePerm.lean`, `FiberIsoCarrying.lean`, `FiberOrbitBound.lean`, `FiberTwoRow.lean`, `FiberExactRank.lean`, `FiberExactOmega.lean`, `FiberCompanion.lean`, `FiberCompanionShift.lean`, `FiberCompanionEquiv.lean`, `FiberCompanionIso.lean`, `FiberCantorFamily.lean` | The source's `cantorFamily` gives `β`-equivalence for every `β < ω`; the target states level `ω`, the bound `ω < scottHeight`, and the failure of isolation. The source's general exact-rank, profile-bound and prefix-detection lemmas are migrated only as far as the witness uses them |

The source modules `ModelTheory/CountableCompanion.lean`, `ScottCompletion.lean` and
`ArbitraryStabilization.lean` (small models, complete sentences, categoricity) belong to the
HanfNumbers roadmap; `Descriptive/BFTree.lean`, `BFSeparation.lean`, `QueryCode.lean`,
`SmallVocabulary*.lean`, `IsomorphismBorel.lean`, `InvariantSeparation.lean` and the López–Escobar
modules to CountableStructureSpaces; `Descriptive/PerfectAntichain.lean` and
`Conditional/SilverAntichain.lean` to BorelEquivalenceRelations. They are not migration targets
here.

## References

* M. Morley, "The number of countable models", *J. Symbolic Logic* 35 (1970), 14–18.
* J. H. Silver, "Counting the number of equivalence classes of Borel and coanalytic equivalence
  relations", *Ann. Math. Logic* 18 (1980), 1–28.
* R. L. Vaught, "Denumerable models of complete theories", in *Infinitistic Methods*, Warsaw, 1961,
  303–321: the origin of the conjecture, for complete first-order theories.
* J. R. Steel, "On Vaught's conjecture", in *Cabal Seminar 76–77*, Lecture Notes in Mathematics
  689, Springer, 1978, 193–208: the perfect-set ("strong") form and minimal counterexamples.
* J. Baldwin, S. Friedman, M. Koerwien and M. C. Laskowski, "Three red herrings around Vaught's
  conjecture", *Trans. Amer. Math. Soc.* 368 (2016), 3673–3694: the "absolute" form; their
  Lemma 3.4 (as cited by Andrews et al., below) identifies Morley's scattered sentences with those
  lacking perfectly many models.
* U. Andrews, I. Goldbring, S. Hachtman, H. J. Keisler and D. Marker, [Scattered sentences have few
  separable randomizations](https://people.math.wisc.edu/~hkeisler/scatteredfew13.pdf): §1–§2 state
  the three forms (Vaught's, the absolute form "if `φ` is scattered then countably many", and
  Steel's strong form "uncountably many implies perfectly many"), note that the cardinal form is
  trivial under CH and equivalent to the others when CH fails, and record (their Fact 2.2, citing
  Baldwin et al., Lemma 3.4) that scattered means not perfectly many. This matches Layers 4c and 5.
* V. Harnik and M. Makkai, "A tree argument in infinitary model theory", *Proc. Amer. Math. Soc.* 67
  (1977), 309–314: minimal counterexamples.
* E. G. K. Lopez-Escobar, "An interpolation theorem for denumerably long formulas", *Fund. Math.* 57
  (1965), 253–272.
* D. Marker, *Lectures on Infinitary Model Theory*, Cambridge University Press, 2016: the chapters
  "The space of countable models" (pp. 29–38) and "Vaught counterexamples" (pp. 83–96): scattered sentences and their equivalent forms (Layers 4c,
  4e, 4f), Borel fragment types, and López–Escobar's theorem.
* H. Becker and A. S. Kechris, *The Descriptive Set Theory of Polish Group Actions*, LMS Lecture
  Note Series 232, Cambridge University Press, 1996, chapter "Model theory and the Vaught
  conjecture" (pp. 82–97).
* S. Gao, *Invariant Descriptive Set Theory*, CRC Press, 2009: Borel complete invariants and
  separating families (4e), invariant separation (S6), and López–Escobar's theorem.
* A. S. Kechris, *Classical Descriptive Set Theory*, Graduate Texts in Mathematics 156, Springer,
  1995, §31, "Analytic well-founded relations" (the boundedness theorem behind S7).
* A. Montalbán, *Computable Structure Theory: Beyond the Arithmetic*, Part 2,
  [draft](https://math.berkeley.edu/~antonio/CSTpart2.pdf), Chapter XII: §XII.1 (Morley's theorem
  via Silver; scattered and unbounded sentences, Definition XII.1) and §XII.2 (Definition XII.4,
  minimally unbounded sentences; Lemma XII.5, level classes are sentences; Lemma XII.6, the limit
  model, with hypothesis `≡_{α_i + 3}` in its block-move convention; Theorem XII.7, the reduction to
  a minimally unbounded counterexample; Lemma XII.8, the club lemma). Checked against that PDF. The
  source notes that Lemma XII.8 as stated omits the per-level countability hypothesis its proof
  uses; the targets here carry it.
* `cameronfreer/infinitary-logic`, Lean 4 formalization, checkpoint `518a366`.

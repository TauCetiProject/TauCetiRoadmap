# Roadmap: counting countable models: Morley's theorem and the Vaught toolkit

**Summary.** How many countable models can a sentence φ of the infinitary logic Lω₁ω have? This
roadmap proves Morley's answer for φ in a relational language L, states Vaught's conjecture with its
standard reformulations, and builds the descriptive set theory of countable models around them. Countable
models are coded by their relations on ℕ or on {0, …, n − 1}, the codes of models of φ form a Borel
set in a compact space of codes, and the number of countable models of φ is the number of their
isomorphism classes, finite models and the empty structure included. A set of codes is *thin* when it contains no nonempty perfect set of
pairwise non-isomorphic codes, and *back-and-forth scattered* when, for every countable ordinal α,
it meets only countably many classes of back-and-forth equivalence at level α.

The headline theorems assume that L has countably many relation symbols.

- **Morley's theorem.** φ has at most ℵ₁ countable models up to isomorphism, or there is a nonempty
  perfect set of codes of pairwise non-isomorphic countable models, and then it has exactly 2^ℵ₀.
  The continuum hypothesis is neither assumed nor refuted, and the perfect set may sit on a finite
  carrier only.
- **The bounded-rank dichotomy.** If an isolating rank, for instance the Scott height, is bounded by
  a countable ordinal on the codes of the countably infinite models of φ, then φ has at most ℵ₀
  countable models or such a perfect set. An isolating rank assigns to each code a countable ordinal,
  invariantly under isomorphism, such that back-and-forth equivalence at the rank of a code decides
  isomorphism with it.
- **Thin is scattered** (Baldwin, Friedman, Koerwien and Laskowski). The codes of the countably
  infinite models of φ are thin exactly when they are back-and-forth scattered.
- **Vaught's conjecture**, that Morley's bound ℵ₁ can be sharpened to ℵ₀, is stated, not proved. It
  is equivalent to its restriction to countably infinite models, to "every sentence with scattered
  countably infinite models has countably many of them", and, by the Harnik–Makkai argument, to the
  absence of sentences with *minimally uncountable* models: uncountably many classes, every sentence
  leaving countably many on one side. Its cardinal form holds under the continuum hypothesis and is
  equivalent to it when ℵ₁ < 2^ℵ₀.

Four roadmaps place it in Tau Ceti: the completed
[InfinitaryLogic](../../Completed/InfinitaryLogic/README.md) supplies the infinitary syntax,
back-and-forth equivalence and the Scott analysis;
[CountableStructureSpaces](../CountableStructureSpaces/README.md) the space of codes, model classes,
López–Escobar and uniform back-and-forth separation;
[BorelEquivalenceRelations](../BorelEquivalenceRelations/README.md) perfect and Cantor antichains and
Silver's theorem, the only dichotomy used; and
[InfinitaryModelExistence](../InfinitaryModelExistence/README.md) language maps, fragments and their
types, Morleyization and the small presentation of a countable language.

The layers below: Layer 0 counts the classes tier by tier and settles each finite carrier; Layer 1
fixes the back-and-forth stratification and isolating ranks; Layers 2 and 3 prove the bounded-rank
dichotomy and Morley's theorem; Layer 4 characterizes thin classes by scatteredness, concentration,
sentences, fragments and Morleyization; Layer 5 states Vaught's conjecture, proves its
reformulations and reduces it to minimal counterexamples; Layer 6 builds a structure whose
back-and-forth class at level ω meets continuum many isomorphism classes, so that the internal Scott
rank is not an isolating rank.

## How to read the build

Each layer is a full development of its objects, with the theorems the later layers need, its
Checks, its examples and its dependencies. Layer 1 records the stratification through which every
later layer counts. Every *Needs:* line lists what its statement and its route use, item by item,
so that a target proved by another route is not blocked behind an unrelated one. The results are linked in these chains:

- the space of codes, the classes of countable models and the class map, then the count, finite
  tiers included (Layer 0);
- back-and-forth equivalence, its levels on codes and their Borelness, isolating ranks, the
  stratification bound (Layer 1);
- a bounded isolating rank, Borel isomorphism, Silver's theorem, the bounded-rank dichotomy in its
  witnessed and cardinal forms (Layer 2);
- Silver's theorem level by level, countable levels or a perfect set, the stratification, Morley's
  theorem in its witnessed form and the cardinal form as a corollary (Layer 3);
- back-and-forth trees, analytic boundedness, uniform separation, scattered implies thin; thin
  implies scattered by Silver's theorem level by level (Layer 4);
- Morley's theorem, the counterexample characterizations, the forms of Vaught's conjecture under
  CH and under ℵ₁ < 2^ℵ₀, the scattered and rank forms (Layer 5);
- saturation of sentences, the limit model, the splitting tree, minimal counterexamples (Layer 5);
- the rank-ω witness, and the failure of isolation for the internal Scott rank (Layer 6).

Suggested homes in Tau Ceti: `TauCeti/ModelTheory/Counting/` for Layers 0–5 (Layer 2 in
`BoundedRank.lean`, Layer 3 in `Morley.lean`, Layer 4 under `Scattered/`, Layer 5 in
`Vaught.lean`) and `TauCeti/ModelTheory/RowAssembly/` for Layer 6.

## Conventions

1. **Languages.** `L : FirstOrder.Language.{u, v}` is relational, `[L.IsRelational]`. Countability
   is carried as the separate instance argument `[Countable (Σ l, L.Relations l)]`, only where
   used; there is no bundled countable-language class, as in the parent InfinitaryLogic roadmap.
   Tau Ceti's code-space and counting results take the per-arity form
   `[∀ n, Countable (L.Relations n)]`. The two forms are equivalent (`Sigma.mk n` is injective, and
   a countable union of countable types is countable), so statements here keep the Σ form and pass
   to the per-arity form where they apply a Tau Ceti result. "Countably many relation symbols"
   below means this hypothesis. Statements about one sentence are universe-polymorphic in `L`. The
   conjectures of Layer 5 quantify over `L : Language.{0, 0}`, because a countable language can
   always be presented in universe 0, and over structures on `ℕ` and on each `Fin n`; §5.6 proves
   the transport from presentations in other universes.
2. **Codes and carriers.** Countable structures are handled through codes in Tau Ceti's space
   `TauCeti.RelationalConfiguration L α` of relational `L`-structures on a carrier `α`, one bit for
   each atom (a relation symbol with a tuple of the carrier), with the product topology and the
   product σ-algebra; it is compact and Hausdorff, and Polish and standard Borel for countable `α`
   and countably many relation symbols. Only two kinds of carrier occur: `ℕ` (the infinite tier)
   and `Fin n` (the finite tiers); codes on `ℕ` are written `RelationalConfiguration L ℕ`, with no
   abbreviation. A code `c` is read as a structure by `c.toStructure`, a definition supplied
   explicitly, never an instance, because one carrier carries many codes. Isomorphism of codes on
   `α` is `isoSetoid L α`, the isomorphism of the decoded structures, and `modelsOf φ` is the set
   of codes of models of `φ`.
3. **Countable means at most countable.** The countable models of `φ` include the finite ones and
   the empty structure. "Countably infinite" is the tier `ℕ`. Vaught's conjecture is stated for all
   countable models; §5.3 proves it equivalent to the statement for countably infinite models,
   using the sentence `L.infiniteSentence`.
4. **Counting.** The isomorphism classes of countable models are Tau Ceti's
   `TauCeti.CountableModelClasses φ`, the sum of `Quotient (isoSetoidOn ℕ φ)` and of
   `Σ n, Quotient (isoSetoidOn (Fin n) φ)`, where `isoSetoidOn α φ` is isomorphism restricted to
   `modelsOf φ` on `α`; the count is its cardinality `TauCeti.countableModelCount φ : Cardinal.{v}`.
   Models in arbitrary universes enter only through the class map `TauCeti.classOf`, a bijection on
   isomorphism classes in every universe. No statement counts a proper class of structures directly.
5. **Classes met by a set.** For a set `K` of codes on `ℕ`, "`K` meets countably many isomorphism
   classes" is `Countable (Quotient ((isoSetoid L ℕ).comap (Subtype.val : K → _)))`, equivalently
   the image of `K` in `Quotient (isoSetoid L ℕ)` is countable (Tau Ceti's
   `Setoid.countable_quotient_comap_val_iff`; the two quotients are in bijection by Mathlib's
   `Setoid.comapQuotientEquiv`). The same reading applies to back-and-forth levels.
6. **Levels.** Back-and-forth levels on codes are `Ordinal.{0}` below `ω₁ = Ordinal.omega 1`, with
   no lift and no offset. `bfEquivSetoid L ℕ α` is `TauCeti.BFEquiv α 0` between the empty tuples
   of the decoded structures, in the one-element-per-move convention of the parent roadmap; Tau
   Ceti allows levels in any ordinal universe, and this roadmap uses `Ordinal.{0}`. Countable
   ordinals are carried as explicit hypotheses `α < Ordinal.omega 1`, never as a subtype.
7. **Ranks are parameters.** Counting arguments consume an abstract isolating rank (§1.2). The
   Scott height `TauCeti.scottHeight` is the canonical instance. The internal Scott rank
   `TauCeti.internalScottRank` is not an isolating rank (§6.4), but a bound on it bounds the Scott
   height (§2.2).
8. **Perfect sets.** "Perfect" is Mathlib's `Perfect` for the product topology on codes. A perfect
   set of pairwise non-isomorphic models is a nonempty perfect set of codes of models, no two of
   which are isomorphic, Tau Ceti's `Setoid.HasPerfectAntichainOn`. A set is thin
   (`Setoid.IsThinOn`) when it contains no such set. A Cantor antichain
   (`Setoid.HasCantorAntichainOn`) is a continuous map of Cantor space `ℕ → Bool` into the set with
   pairwise non-isomorphic values; on a Polish code space the two notions agree.
9. **No continuum hypothesis.** No statement assumes CH or its negation, except where the
   hypothesis `ℵ₁ = 𝔠` or `ℵ₁ < 𝔠` is an explicit argument (Layer 5).
10. **Silver and López–Escobar are consumed, never reproved.** Silver's theorem enters only through
    BorelEquivalenceRelations' forms of it. Every perfect-set conclusion here consumes the relative
    form, `Setoid.countable_or_hasCantorAntichainOn_of_measurableSet`, whose second alternative is
    a continuous Cantor family of pairwise inequivalent points, turned into a perfect set by
    `Setoid.hasCantorAntichainOn_iff_hasPerfectAntichainOn`. The cardinality form
    `Setoid.mk_quotient_le_aleph0_or_eq_continuum` is used only for second proofs of the cardinal
    forms, never to produce a perfect set. López–Escobar and uniform back-and-forth separation
    enter only through CountableStructureSpaces' statements of them.
11. **Statements.** Every target is stated on the supplier carriers: the code spaces, isomorphism
    and back-and-forth relations named above, never a private copy; a theorem proved for a private
    code space or a private isomorphism or back-and-forth relation does not discharge its target.
    The headline theorems are assembled from the layers, without hypotheses asserting Borelness,
    thinness, isolation, a dichotomy or CH. Lean names in code font are declarations of
    `Suggested.lean` (namespace `TauCetiRoadmap.CountableModelCounting`) or supplier declarations
    listed under the supplier contracts; a target without a declaration there is described in prose.

## Layer 0: classes of countable models

This layer works with Tau Ceti's classes of countable models: `TauCeti.CountableModelClasses φ`,
`TauCeti.countableModelCount φ` with its summand decomposition
`TauCeti.countableModelCount_eq_add_sum` and the bound `TauCeti.countableModelCount_le_add_aleph0_mul`
(the finite tiers contribute at most `ℵ₀ · b` when each contributes at most `b`), the monotonicity
`TauCeti.countableModelCount_le_of_subset`, the class map `TauCeti.classOf` with
`TauCeti.classOf_eq_classOf_iff`, `TauCeti.classOf_surjective` and the tier lemmas
`TauCeti.exists_classOf_eq_inl_iff` and `TauCeti.exists_classOf_eq_inr_iff`, the upper bound
`TauCeti.countableModelCount_le_continuum` (countably many relation symbols), the Borel isomorphism
relation on a finite carrier `TauCeti.RelationalConfiguration.measurableSet_setOf_isoSetoid`,
`TauCeti.HasPerfectlyManyCountableModels φ` (a perfect set of pairwise non-isomorphic models at
the tier `ℕ` or at some `Fin n`) with `TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq`,
and the transport of the count and of perfect sets along a language equivalence,
`FirstOrder.Language.LEquiv.lift_countableModelCount_onBoundedFormulaInf` and
`FirstOrder.Language.LEquiv.hasPerfectlyManyCountableModels_onBoundedFormulaInf_iff`. It adds
perfect sets at one carrier, the dichotomy on each finite carrier and the passage to infinite models.

### 0.1 Perfect sets of non-isomorphic models at one carrier

Define `HasPerfectSetOfNonisoModelsOn α φ`, for a carrier `α : Type` and `φ : L.Sentenceω`, as
`(isoSetoid L α).HasPerfectAntichainOn (modelsOf φ)`: the codes on `α` of models of `φ` contain a
nonempty perfect set of pairwise non-isomorphic codes. Its API:

- `TauCeti.HasPerfectlyManyCountableModels φ` holds exactly when `HasPerfectSetOfNonisoModelsOn ℕ φ`
  holds or `HasPerfectSetOfNonisoModelsOn (Fin n) φ` holds for some `n`; the two sides unfold to
  the same proposition (`TauCeti.hasPerfectlyManyCountableModels_iff`).
- If every model of `φ` on `α` is a model of `ψ`, a perfect set for `φ` on `α` is one for `ψ`
  (`Setoid.HasPerfectAntichainOn.mono`).
- A perfect set on `α` gives `𝔠 ≤ #(Quotient (isoSetoidOn α φ))`. With countably many relation
  symbols and `α` countable the code space is Polish, and `Setoid.HasPerfectAntichainOn.hasCantorAntichainOn`
  with `Setoid.HasCantorAntichainOn.continuum_le_mk_quotient_comap` gives it; in general a nonempty
  perfect subset of the compact Hausdorff code space has at least `𝔠` points.
- Hence, with countably many relation symbols, a perfect set at any tier gives
  `countableModelCount φ = 𝔠` (`TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq`).

*Needs:* Tau Ceti `TauCeti.RelationalConfiguration.isoSetoid`, `TauCeti.RelationalConfiguration.modelsOf`,
`TauCeti.RelationalConfiguration.isoSetoidOn`, `Setoid.HasPerfectAntichainOn`,
`Setoid.HasPerfectAntichainOn.mono`, `Setoid.HasPerfectAntichainOn.hasCantorAntichainOn`,
`Setoid.HasCantorAntichainOn.continuum_le_mk_quotient_comap`,
`TauCeti.hasPerfectlyManyCountableModels_iff`,
`TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq`; Mathlib `Perfect`.

**Checks.**

- It holds for `∃ x ∀ y, y = x` with countably many unary predicates at `Fin 1`: the codes on
  `Fin 1` are the points of `ℕ → Bool`, every one is a model, and the only permutation of `Fin 1`
  is the identity, so isomorphism is equality and the whole code space is a perfect set of
  pairwise non-isomorphic models.
- It fails for `⊤` in the empty language at `ℕ`: there is exactly one code, and a single point is
  not perfect.
- At `Fin 0`, for `⊤`: it holds with infinitely many nullary relation symbols (countably many),
  since the codes are then the points of `ℕ → Bool` and isomorphism is equality; it fails with
  none, since there is then exactly one code. A definition counting only nonempty carriers would
  miss the first case.

### 0.2 The finite tiers

Prove `countable_or_hasPerfectSetOfNonisoModelsOn_fin`: if `L` has countably many relation
symbols, then for every `φ : L.Sentenceω` and every `n`, the models of `φ` on `Fin n` fall into
countably many isomorphism classes, `Countable (Quotient (isoSetoidOn (Fin n) φ))`, or
`HasPerfectSetOfNonisoModelsOn (Fin n) φ`.

*Route.* Apply the relative form of Silver's theorem,
`Setoid.countable_or_hasCantorAntichainOn_of_measurableSet`, on the Borel set `modelsOf φ` of the
Polish space of codes on `Fin n`, with `R` isomorphism and `F` its restriction
`isoSetoidOn (Fin n) φ`. The graph of `F` is Borel: on a finite carrier isomorphism is the orbit
relation of the finite group `Equiv.Perm (Fin n)`, a finite union of graphs of continuous maps
(`TauCeti.RelationalConfiguration.measurableSet_setOf_isoSetoid`). The second alternative is a
continuous Cantor family of pairwise non-isomorphic models on `Fin n`, which
`Setoid.hasCantorAntichainOn_iff_hasPerfectAntichainOn` turns into
`HasPerfectSetOfNonisoModelsOn (Fin n) φ`. No stratification is needed on a finite carrier.
*Needs:* §0.1; Tau Ceti `Setoid.countable_or_hasCantorAntichainOn_of_measurableSet`,
`Setoid.hasCantorAntichainOn_iff_hasPerfectAntichainOn`,
`TauCeti.RelationalConfiguration.measurableSet_setOf_isoSetoid`,
`TauCeti.RelationalConfiguration.measurableSet_modelsOf`.

**Checks.**

- For `∃ x ∀ y, y = x` with countably many unary predicates, the first alternative holds at every
  `Fin n` with `n ≠ 1` (no models) and the second at `Fin 1`.

### 0.3 Infinite models

`L.infiniteSentence` is Tau Ceti's `FirstOrder.Language.infiniteSentence`, the countable
conjunction over `n` of Mathlib's `Sentence.cardGe L n` ("there are `n` pairwise distinct
elements"), realized exactly in the infinite structures
(`FirstOrder.Language.realize_infiniteSentence_iff`). Prove, for every relational `L` and every
`φ`, that `φ ⊓ L.infiniteSentence` has the same codes of models on `ℕ` as `φ` and no model on any
`Fin n`; hence its count is `#(Quotient (isoSetoidOn ℕ φ))` and it has perfectly many countable
models exactly when `HasPerfectSetOfNonisoModelsOn ℕ φ`.
*Needs:* §0.1; Tau Ceti `FirstOrder.Language.infiniteSentence`,
`FirstOrder.Language.realize_infiniteSentence_iff`, `TauCeti.RelationalConfiguration.mem_modelsOf`,
`TauCeti.countableModelCount_eq_add_sum`.

**Checks.**

- In the empty language, `⊤` has `ℵ₀` countable models (one for each finite size and one on `ℕ`),
  and `⊤ ⊓ L.infiniteSentence` has exactly one. A sentence saying only "nonempty" would leave the
  finite sizes `1, 2, …` in place.

### Examples

Take the language with countably many unary predicates `P_i` (`i ∈ ℕ`) and no other symbols, and
`φ := ∃ x ∀ y, y = x`. By the first Check of §0.1, `HasPerfectSetOfNonisoModelsOn (Fin 1) φ`: there
are continuum many pairwise non-isomorphic one-element structures. There are no models on `ℕ` or
on `Fin n` for `n ≠ 1` (the empty structure fails `∃ x`), and `countableModelCount φ = 𝔠`. With
unary `P_r` (`r ∈ ℝ`) instead, the codes on `Fin 1` are the points of `ℝ → Bool`, isomorphism is
again equality, and the same sentence has `2^𝔠` pairwise non-isomorphic one-element models: the
upper bound `𝔠` needs countably many relation symbols. Every isolating rank is vacuously bounded
on the (empty) set of models on `ℕ`, so the bounded-rank dichotomy of Layer 2 applies, and its
perfect alternative holds only at the tier `Fin 1`; likewise Morley's theorem. This is why the
finite tiers are part of `TauCeti.HasPerfectlyManyCountableModels`.

**API warning.** Do not count only the models on `ℕ` and call the result "the number of countable
models": the example above has continuum many countable models and none on `ℕ`. Conversely, do
not drop the finite tiers from Vaught's conjecture without the reduction through
`L.infiniteSentence` (§5.3).

### Dependencies

Mathlib perfect sets and cardinals; Tau Ceti's code spaces, model classes, classes of countable
models and the antichain vocabulary and relative Silver theorem of BorelEquivalenceRelations, all
named above. Nothing of Layers 1–6 is used.

## Layer 1: back-and-forth stratification and isolating ranks

This layer fixes the back-and-forth stratification and the isolating ranks through which Layers 2–6
count: the objects are Tau Ceti's, and each section names them and the facts about them that the
later layers use, with their hypotheses.

### 1.1 Levels on models and level sentences

The level-`β` relation on the models of `φ` on `ℕ` is `bfEquivSetoidOn ℕ φ β`
(`TauCeti.RelationalConfiguration.bfEquivSetoidOn`), the restriction of `bfEquivSetoid L ℕ β` to
`modelsOf φ`; in the prose below `bfEquivSetoid β` abbreviates `bfEquivSetoid L ℕ β`. The facts
used are: it is antitone in `β` (`TauCeti.RelationalConfiguration.bfEquivSetoidOn_anti`);
isomorphism refines it (`TauCeti.RelationalConfiguration.isoSetoidOn_le_bfEquivSetoidOn`), so the
isomorphism classes project onto the level-`β` classes and
`#(Quotient (bfEquivSetoidOn ℕ φ β)) ≤ #(Quotient (isoSetoidOn ℕ φ))`
(`TauCeti.RelationalConfiguration.mk_quotient_bfEquivSetoidOn_le`); for `β < ω₁` and countably many
relation symbols its graph is Borel (`TauCeti.RelationalConfiguration.measurableSet_setOf_bfEquivSetoidOn`);
and isomorphism is equivalence at every level
(`TauCeti.RelationalConfiguration.isoSetoid_iff_forall_bfEquivSetoid`).

Level classes are sentence cuts: with countably many relation symbols and `α < ω₁`,
`modelsOf (c.scottSentenceAtLevel α) = {d | bfEquivSetoid L ℕ α c d}`
(`TauCeti.RelationalConfiguration.modelsOf_scottSentenceAtLevel`), where `c.scottSentenceAtLevel α`
is the parent's Scott formula `TauCeti.scottFormula Fin.elim0 α` of the structure decoded from `c`,
read as a sentence. Level classes are always taken through these declarations, never through a
second Scott-formula construction.
*Needs:* Tau Ceti `TauCeti.RelationalConfiguration.bfEquivSetoid`, the declarations named above,
`TauCeti.scottFormula`, `TauCeti.realize_scottFormula_iff_bfEquiv`.

**Checks.**

- With uncountably many relation symbols level classes need not be sentence cuts. For unary `P_r`,
  `r ∈ ℝ`, the level-1 class of the code with every `P_r` empty is that code alone (an element
  satisfying some `P_r` has no partner), while a sentence mentions only countably many symbols and
  keeps its truth value when an unmentioned `P_s` is made true at one element.

### 1.2 Isolating ranks

An isolating rank is Tau Ceti's `TauCeti.IsIsolatingRank ρ` for
`ρ : RelationalConfiguration L ℕ → Ordinal.{0}`, with exactly three fields: invariance under
isomorphism, values below `ω₁`, and isolation (`bfEquivSetoid (ρ c) c d` implies that `c` and `d`
are isomorphic). The facts used are:

- isolation at every level at or above `ρ c` (`TauCeti.IsIsolatingRank.isolates_of_le`);
- the induced rank on the isomorphism classes met by a set, with values below `ω₁`
  (`TauCeti.rankOnIsoClasses`, `TauCeti.rankOnIsoClasses_lt_omega_one`);
- an invariant map below `ω₁` lying above an isolating rank is one (`TauCeti.IsIsolatingRank.of_le`),
  so the contract does not determine the rank and no least isolating rank is asserted;
- on a set meeting uncountably many classes, every isolating rank lies below one that is unbounded
  below `ω₁` there (`TauCeti.IsIsolatingRank.exists_unbounded_of_not_countable`);
- a set meeting countably many classes has every invariant map into the countable ordinals bounded
  below `ω₁` on it (`TauCeti.exists_rank_bound_of_countable_isoClasses`; isolation is not needed);
- on a set where `ρ` is at most `α`, isomorphism equals `bfEquivSetoid α`
  (`TauCeti.IsIsolatingRank.comap_isoSetoid_eq_bfEquivSetoid`).

The instance is the Scott height: `c ↦ scottHeight ℕ` of the decoded structure is an isolating rank
(`TauCeti.isIsolatingRank_scottHeight`), hence `TauCeti.exists_isIsolatingRank`; neither needs
countability of `L`. In Tau Ceti's convention the Scott height of `M : Type w` lies in
`Ordinal.{w}` and external stabilization quantifies over all countable `N : Type`, finite ones
included; for codes on `ℕ` it lies in `Ordinal.{0}`, as the contract requires.
*Needs:* §1.1; Tau Ceti the declarations named above, `TauCeti.scottHeight`,
`TauCeti.scottHeight_lt_omega_one`, `TauCeti.nonempty_equiv_of_bfEquiv_of_scottHeight_le`.

**API warning.** Isolation is one-sided: `bfEquivSetoid (ρ c) c d` decides isomorphism with `c`,
not with `d`. The injection of the rank-`α` classes into the level-`α` quotient (§1.3) uses the rank
of both codes, which agree because both have rank `α`. Do not state isolation symmetrically.

### 1.3 The stratification bound

For an isolating rank `ρ` and a set `K` of codes, the classes met by `K` of rank `α` inject into the
level-`α` quotient of `K` (`TauCeti.IsIsolatingRank.exists_injective_rank_fiber`: two codes of rank
`α` that are `bfEquivSetoid α`-equivalent are isomorphic). Hence: if every level `α < ω₁` of `K` has
at most `ℵ₁` classes then `K` meets at most `ℵ₁` isomorphism classes
(`TauCeti.IsIsolatingRank.mk_isoClasses_le_aleph_one`); and if every level has countably many,
`TauCeti.mk_isoClasses_le_aleph_one_of_countable_levels`, for every relational `L`. Neither needs
`K` Borel or invariant. For `K = modelsOf φ`, whose restricted relations are `isoSetoidOn ℕ φ` and
`bfEquivSetoidOn ℕ φ α`, this is the sentence form: if every `bfEquivSetoidOn ℕ φ α` with
`α < ω₁` has countably many classes, then `#(Quotient (isoSetoidOn ℕ φ)) ≤ ℵ₁`. With the Scott
height it is the stratification of the models of `φ` on `ℕ` by Scott height: the stratum of height
`α` injects into the level-`α` quotient, and there are `ℵ₁` strata.

The cardinal arithmetic is the countable-ordinal bookkeeping for a map `r : X → Ordinal.{0}` with
values below `ω₁` and countable fibres: `#X ≤ ℵ₁` (`TauCeti.mk_le_aleph_one_of_countable_preimage`);
`#X = ℵ₁` when `X` is uncountable (`TauCeti.mk_eq_aleph_one_of_countable_preimage`); a subset of
`X` is countable iff `r` is bounded below `ω₁` on it (`TauCeti.countable_iff_exists_lt_omega_one_forall_lt`,
with `Set.Countable.exists_lt_omega_one_forall_lt`).
*Needs:* §1.2; Tau Ceti the declarations named above.

### 1.4 Level-by-level transfer

For a family of structures and every arity `n`, the depth-`α` relation on pointed `n`-tuples is
Tau Ceti's `TauCeti.bfTupleSetoid`, and the transfer tools are:

- *successor*: `(α + 1)`-equivalence of tuples is `α`-equivalence together with equality of the
  depth-`α` extension spectrum, the set of level-`α` classes of one-point extensions
  (`TauCeti.bfTupleSetoid_add_one_iff`, with `TauCeti.bfExtensionSpectra` the realized spectra); so
  countably many `α`-classes and countably many realized spectra give countably many
  `(α + 1)`-classes (`TauCeti.countable_quotient_bfTupleSetoid_add_one`), and likewise with any
  infinite cardinal such as `ℵ₁` for `ℵ₀` (`TauCeti.mk_quotient_bfTupleSetoid_add_one_le_of_le`);
- *isolation*: `R.IsolatedBy E` (`Setoid.IsolatedBy`) for a family `E` of relations: every point is
  pinned, up to `R`, by its class under some `E i`; with countably many `E i` of countably many
  classes, `R` has countably many classes (`Setoid.IsolatedBy.countable_quotient`), and the
  general cardinal transfer `Setoid.IsolatedBy.lift_mk_quotient_le`; at a limit `λ < ω₁`, pointwise
  isolation by the levels below `λ` carries countability through `λ`;
- *assembly*: `TauCeti.BFSmall`, the three local conditions (countably many level-`0` classes of
  `n`-tuples, countably many realized extension spectra at every `α < ω₁`, and pointwise isolation
  at limits), gives countably many classes at every level below `ω₁` and every arity
  (`TauCeti.BFSmall.countable_quotient`), hence at most `ℵ₁` isomorphism classes for a set of codes
  whose decoded structures satisfy it (`TauCeti.BFSmall.mk_isoClasses_le_aleph_one`).

`TauCeti.BFSmall` and `TauCeti.bfTupleSetoid` are indexed by a family of structures; on codes they
apply to the structures decoded from a set of codes.
*Needs:* §1.3; Tau Ceti the declarations named above.

**Checks.**

- Level `0` is a hypothesis in `TauCeti.BFSmall`, not a consequence of a countable language. With
  unary `P_i` (`i ∈ ℕ`), the family of all codes on `ℕ` realizes continuum many level-`0` classes of
  `1`-tuples, one for each set of predicates an element can satisfy.
- At a limit, countably many classes at every level below it do not bound the classes at the limit:
  a level-`λ` class is a coherent family of lower classes, and a countable product of countable sets
  can have the size of the continuum. In the language of one binary `E`, take the equivalence
  relations on `ℕ` with, for each `k` in a set `S ⊆ ℕ`, one class of size `k + 2`, and singletons
  otherwise. In a finite relational language there are finitely many classes of tuples at each
  finite level (by the successor step, from finitely many atomic types), so these codes meet finitely
  many classes at every finite level; but "some class has exactly `k + 2` elements" is first-order,
  so distinct `S` give inequivalent codes at level `ω`, and there are continuum many. Isolation is
  the hypothesis that closes this gap.

### Examples

For a nonempty set `K` meeting a single isomorphism class, every level of `K` has one class, since
isomorphism refines every level, and the stratification bound gives at most `ℵ₁` classes, indeed
`1`.

### Dependencies

Layer 0's conventions; Tau Ceti's back-and-forth equivalence, Scott analysis and code-space
material named above. Nothing of Layers 2–6 is used.

## Layer 2: the bounded-rank dichotomy

### 2.1 The dichotomy for a bounded isolating rank

Let `L` have countably many relation symbols, let `ρ` be an isolating rank, `φ : L.Sentenceω` and
`β < ω₁` with `ρ c ≤ β` for every code `c` on `ℕ` of a model of `φ`. Prove
`countableModelCount_le_aleph0_or_hasPerfectlyMany_of_bounded`: `countableModelCount φ ≤ ℵ₀` or
`TauCeti.HasPerfectlyManyCountableModels φ`; and the cardinal form
`countableModelCount_le_aleph0_or_eq_continuum_of_bounded`: `countableModelCount φ ≤ ℵ₀` or
`countableModelCount φ = 𝔠`.

*Route.* Isomorphism on `modelsOf φ` equals `bfEquivSetoidOn ℕ φ β`
(`TauCeti.IsIsolatingRank.comap_isoSetoid_eq_bfEquivSetoid`: forward because isomorphism refines
every level, backward by monotonicity down to `ρ c` and isolation), hence has Borel graph (for the
Scott rank in place of `ρ`, Montalbán, Part 2, Theorem XI.3, (2)⇒(1), p. 207). For the tier `ℕ`,
apply the relative form of Silver's theorem on the Borel set of models on `ℕ` with `R` and `F`
both isomorphism; its second alternative, a continuous Cantor family of pairwise non-isomorphic
models, becomes a perfect set. For each `Fin n` use §0.2, then combine the tiers with
`TauCeti.countableModelCount_le_add_aleph0_mul`. A perfect set may appear at a finite tier only
(Layer 0, Examples). The cardinal form follows from the witnessed one by
`TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq`; a second proof applies the
cardinality form `Setoid.mk_quotient_le_aleph0_or_eq_continuum` to the same relations on the
standard Borel model classes.
*Needs:* §0.1, §0.2, §1.1, §1.2; Tau Ceti `TauCeti.IsIsolatingRank.comap_isoSetoid_eq_bfEquivSetoid`,
`TauCeti.RelationalConfiguration.measurableSet_setOf_bfEquivSetoidOn`,
`Setoid.countable_or_hasCantorAntichainOn_of_measurableSet`,
`Setoid.hasCantorAntichainOn_iff_hasPerfectAntichainOn`, `TauCeti.countableModelCount_le_add_aleph0_mul`,
`TauCeti.HasPerfectlyManyCountableModels.of_nat`, `TauCeti.HasPerfectlyManyCountableModels.of_fin`,
`TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq`, and for the second proof
`Setoid.mk_quotient_le_aleph0_or_eq_continuum`, `TauCeti.RelationalConfiguration.standardBorelSpace_modelsOf`.

**Checks.**

- For `∃ x ∀ y, y = x` with countably many unary predicates every rank is vacuously bounded on the
  models on `ℕ`, the count is `𝔠`, and only the perfect alternative holds, through `Fin 1`. A
  version of the theorem looking at the tier `ℕ` alone would claim at most `ℵ₀` models here.

### 2.2 Scott height and internal Scott rank

The textbook form: with countably many relation symbols, if `scottHeight M ≤ β` for some `β < ω₁`
and every countable model `M : Type` of `φ`, then both conclusions of §2.1 hold; apply §2.1 to the
Scott height (`TauCeti.isIsolatingRank_scottHeight`), each code on `ℕ` of a model decoding to a
countable model in `Type`.

Prove `countableModelCount_le_aleph0_or_hasPerfectlyMany_of_internalScottRank_le`: with countably
many relation symbols, if `β < ω₁` bounds the internal Scott rank of the structure decoded from
every code on `ℕ` of a model of `φ`, then `countableModelCount φ ≤ ℵ₀` or
`TauCeti.HasPerfectlyManyCountableModels φ`, and so also the cardinal form. By
`TauCeti.scottHeight_le_internalScottRank_add_omega0` the Scott height is then at most `β + ω < ω₁`.
*Needs:* §2.1; Tau Ceti `TauCeti.isIsolatingRank_scottHeight`, `TauCeti.internalScottRank`,
`TauCeti.scottHeight_le_internalScottRank_add_omega0`.

### 2.3 The converse

Prove, for every relational `L` and with no countability: if `countableModelCount φ ≤ ℵ₀`, every
isolating rank is bounded below `ω₁` on the codes on `ℕ` of models of `φ`. The classes of models on
`ℕ` inject into `TauCeti.CountableModelClasses φ`
(`TauCeti.mk_quotient_isoSetoidOn_nat_le_countableModelCount`), and
`TauCeti.exists_rank_bound_of_countable_isoClasses` bounds the rank.
*Needs:* §1.2; Tau Ceti `TauCeti.mk_quotient_isoSetoidOn_nat_le_countableModelCount`,
`TauCeti.exists_rank_bound_of_countable_isoClasses`.

### Examples

Let `φ` say that `E` is an equivalence relation all of whose classes are infinite. Every countable
model is homogeneous: two tuples with the same atomic type are carried to each other by an
automorphism permuting the classes and the elements inside them. So every tuple has orbit rank `0`
and every model has internal Scott rank `1`, the empty structure included (its empty tuple has
orbit rank `0`). The countable models are the empty structure and, for each
`k ∈ {1, 2, …, ℵ₀}`, the structure on `ℕ` with `k` infinite classes; so `countableModelCount φ = ℵ₀`,
the first alternative, as §2.2 with `β = 1` predicts.

### Dependencies

Layers 0–1; Tau Ceti's relative Silver theorem, cardinality form and perfect-set transfer from
BorelEquivalenceRelations.

## Layer 3: Morley's theorem

Throughout this layer `L` has countably many relation symbols, except in the last API item of §3.4.

### 3.1 One level

Prove `countable_bfClasses_or_hasPerfectSet`: for `φ : L.Sentenceω` and `β < ω₁`, the models of `φ`
on `ℕ` fall into countably many classes of `bfEquivSetoidOn ℕ φ β`, or
`HasPerfectSetOfNonisoModelsOn ℕ φ`.

*Route.* The relative form of Silver's theorem on the Borel set `modelsOf φ`, with
`F = bfEquivSetoidOn ℕ φ β` (Borel by `TauCeti.RelationalConfiguration.measurableSet_setOf_bfEquivSetoidOn`)
and `R` isomorphism, which refines `F`; then the passage from a Cantor antichain to a perfect set.
This is the only point at which Silver's theorem enters the tier `ℕ`; §4.2 quotes it.
*Needs:* §0.1, §1.1; Tau Ceti `Setoid.countable_or_hasCantorAntichainOn_of_measurableSet`,
`Setoid.hasCantorAntichainOn_iff_hasPerfectAntichainOn`,
`TauCeti.RelationalConfiguration.isoSetoid_le_bfEquivSetoid`.

### 3.2 The tier ℕ

Prove that `#(Quotient (isoSetoidOn ℕ φ)) ≤ ℵ₁` or `HasPerfectSetOfNonisoModelsOn ℕ φ`. With no
perfect set every level is countable by §3.1, and the stratification bound of §1.3 applies. Split
on the conclusion of §3.1, not on a cardinal.
*Needs:* §1.3, §3.1.

### 3.3 Morley's theorem

Prove `morley_countableModelCount_le_aleph_one_or_hasPerfectlyMany`: for `φ : L.Sentenceω`,
`countableModelCount φ ≤ ℵ₁` or `TauCeti.HasPerfectlyManyCountableModels φ` (Morley 1970;
Montalbán, Part 2, §XII.1, p. 216, proves the cardinal form for models on `ℕ` by the route of
§3.1–§3.2). Combine §3.2 with §0.2 on each finite tier and
`TauCeti.countableModelCount_le_add_aleph0_mul`; each perfect alternative comes from Silver's
Cantor family at whichever tier it occurs. Prove the cardinal form
`morley_countableModelCount`: `countableModelCount φ ≤ ℵ₁` or `countableModelCount φ = 𝔠`, from the
witnessed form with `TauCeti.countableModelCount_le_continuum` and
`TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq`, without the cardinality form of
Silver's theorem. A second proof applies the cardinality form to the same relations: each level
has at most `ℵ₀` or exactly `𝔠` classes, and if some level has `𝔠` classes so does isomorphism.
No form of the continuum hypothesis is used.
*Needs:* §0.2, §3.2; Tau Ceti `TauCeti.countableModelCount_le_add_aleph0_mul`,
`TauCeti.countableModelCount_le_continuum`, `TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq`,
and for the second proof `Setoid.mk_quotient_le_aleph0_or_eq_continuum`.

**API warning.** The cardinal form "`≤ ℵ₁` or `= 𝔠`" does not determine which alternative holds:
under CH, `ℵ₁ = 𝔠`. The witnessed form does; prove and export both, and derive the cardinal form
from the witnessed one.

### 3.4 Thin sentences

Define `IsThinOnNatModels φ` as `(isoSetoid L ℕ).IsThinOn (modelsOf φ)`: the models of `φ` on `ℕ`
contain no perfect set of pairwise non-isomorphic ones, that is, `HasPerfectSetOfNonisoModelsOn ℕ φ`
fails. Its API: a thin sentence has at most `ℵ₁` models on `ℕ` up to isomorphism (§3.2) and
countably many classes at every level `β < ω₁` (§3.1); and, for every relational `L`, fewer than
`𝔠` isomorphism classes of models on `ℕ` imply thin (§0.1).
*Needs:* §0.1, §3.1, §3.2; Tau Ceti `Setoid.IsThinOn`.

**Checks.**

- `∃ x ∀ y, y = x` with countably many unary predicates is thin, since it has no models on `ℕ`,
  although it has a perfect set of pairwise non-isomorphic countable models (at `Fin 1`): thinness
  speaks of the tier `ℕ` only.
- "`E` is an equivalence relation" is not thin: the Examples below give a perfect set.
- "`E` is an equivalence relation with all classes infinite" is thin: its models on `ℕ` fall into
  `ℵ₀` isomorphism classes (Layer 2, Examples), while a perfect set of pairwise non-isomorphic models
  would give `𝔠`.

### Examples

For `φ` saying that `E` is an equivalence relation, an explicit perfect set: split `ℕ` into an
infinite reservoir and disjoint blocks `B_k` of size `k + 2`; for `z : ℕ → Bool` let `f z` make
`B_k` one class when `z k = true` and split it into singletons otherwise, with the reservoir all
singletons. Each bit of the code of `f z` depends on at most one bit of `z`, so `f` is continuous;
the class sizes at least `2` occurring in `f z` are `{k + 2 | z k = true}`, so distinct `z` give
non-isomorphic models. The range of `f` is the continuous injective image of Cantor space, hence a
perfect set of pairwise non-isomorphic models: Morley's second alternative holds with this witness,
with no use of CH, and `countableModelCount φ = 𝔠`.

### Dependencies

Layers 0–1; Tau Ceti's relative Silver theorem and cardinality form.

## Layer 4: scattered classes and thinness criteria

All statements are about an arbitrary set `K` of codes on `ℕ` unless they say otherwise; no
analyticity, Borelness or invariance of `K` is assumed where none is stated.

### 4.1 Scattered sets carry no Cantor antichain

Back-and-forth scatteredness is Tau Ceti's `TauCeti.BFScattered K`: for every `α < ω₁`, `K` meets
countably many `bfEquivSetoid α`-classes (classes of the restricted relation, not codes;
`TauCeti.bfScattered_iff_countable_image`). The facts used are monotonicity
(`TauCeti.BFScattered.mono`), that a set meeting countably many isomorphism classes is scattered
(`TauCeti.BFScattered.of_countable_isoClasses`), and the observation adapter
`TauCeti.bfScattered_of_observation`: maps `obs α` on `K` with countably many realized values at
each level `α < ω₁`, equal values implying `bfEquivSetoid α`, give `TauCeti.BFScattered K`.

Prove `not_hasCantorAntichainOn_of_bfScattered`: with countably many relation symbols, a scattered
`K` carries no Cantor antichain for isomorphism, and so is thin
(`Setoid.isThinOn_iff_not_hasCantorAntichainOn` on the Polish code space).

*Route.* For a Cantor antichain `f` in `K`, the set of pairs `(f x, f y)` with `x ≠ y` is analytic
(a continuous image of an open subset of the square of Cantor space) and contains no isomorphic
pair; uniform back-and-forth separation (CountableStructureSpaces §4.4) finds one level `β < ω₁` at
which no such pair is equivalent, so `x ↦` the level-`β` class of `f x` injects Cantor space into
the countably many level-`β` classes met by `K`.
*Needs:* Tau Ceti `TauCeti.BFScattered`, `Setoid.isThinOn_iff_not_hasCantorAntichainOn`, Mathlib
`MeasureTheory.AnalyticSet`; CountableStructureSpaces §4.4 `exists_uniform_bfSeparation`.

Counting a scattered set uses Tau Ceti's results for an isolating rank `ρ` and a scattered `K`:
each rank fibre of the classes met by `K` is countable
(`TauCeti.IsIsolatingRank.countable_rankOnIsoClasses_preimage`); `K` meets at most `ℵ₁` classes,
and exactly `ℵ₁` when uncountably many (`TauCeti.IsIsolatingRank.mk_isoClasses_eq_aleph_one`); `K`
meets countably many iff `ρ` is bounded below `ω₁` on `K`
(`TauCeti.IsIsolatingRank.countable_isoClasses_iff_bounded`), so boundedness on a scattered set is
the same for all isolating ranks (`TauCeti.IsIsolatingRank.exists_rank_bound_iff`). The code form of
the isolating level: a set meeting countably many classes (the set itself may be uncountable) has
one level `γ < ω₁` at which `bfEquivSetoid γ` decides isomorphism within it
(`TauCeti.IsIsolatingRank.exists_comap_isoSetoid_eq_bfEquivSetoid`).

### 4.2 Thin sentences are exactly the scattered ones

Prove `bfScattered_modelsOf_iff_isThinOnNatModels`: with countably many relation symbols,
`TauCeti.BFScattered (modelsOf φ)` iff `IsThinOnNatModels φ`. Thin implies scattered by the one-level
step §3.1; scattered implies thin by §4.1. This is Theorem 3.3, (a)⇔(b), of Baldwin, Friedman,
Koerwien and Laskowski. Corollary: fewer than `𝔠` models on `ℕ` up to isomorphism imply scattered.
*Needs:* §3.1, §3.4, §4.1.

**Checks.**

- `∃ x ∀ y, y = x` with countably many unary predicates has no models on `ℕ`: both sides hold,
  although the sentence has perfectly many countable models. A version over all countable models
  would fail here.
- "`E` is an equivalence relation" fails both sides: the family of Layer 3, Examples, is a perfect
  set, and its members are pairwise inequivalent at level `ω` (§4.3, Checks), so the models on `ℕ`
  meet `𝔠` classes at level `ω`.

### 4.3 Concentration

Define `ConcentratedAtBFLevels C`: at each level `α < ω₁` some centre `k` (possibly outside `C`, and
depending on `α`) has all but countably many of the isomorphism classes met by `C` in its level-`α`
class, that is, the codes of `C` not `bfEquivSetoid α`-equivalent to `k` meet countably many
isomorphism classes. Prove:

- monotonicity: subsets of concentrated sets are concentrated;
- a set meeting countably many isomorphism classes is concentrated;
- `ConcentratedAtBFLevels.bfScattered`: a concentrated set is back-and-forth scattered (at level `α`
  it meets the level-`α` class of the centre and, through its countably many other isomorphism
  classes, countably many more); hence, with countably many relation symbols, thin (§4.1);
- **saturation**: if `B ⊆ C`, `B` and `C \ B` are analytic and `B` is closed under isomorphism within
  `C`, then from some `α < ω₁` on, `bfEquivSetoid α`-equivalent members of `C` lie on the same side
  of `B` (uniform separation applied to `B ×ˢ (C \ B)`, then monotonicity); conversely saturation at
  a single level implies that invariance;
- **one side is small**: for concentrated `C` and such a `B`, `B` or `C \ B` meets only countably
  many isomorphism classes. The analyticity hypothesis holds when `C` is analytic and `B = C ∩ D`
  for a Borel `D`.

*Needs:* §4.1; Tau Ceti `TauCeti.BFScattered`, `TauCeti.RelationalConfiguration.bfEquivSetoid`;
CountableStructureSpaces §4.4 `exists_uniform_bfSeparation`.

**Checks.**

- `∅` is concentrated, with any centre.
- A set meeting countably many isomorphism classes is concentrated, with any code as centre at
  every level.
- The models on `ℕ` of "`E` is an equivalence relation" are not concentrated. In the family `f` of
  Layer 3, Examples, "some class has exactly `k + 2` elements" is a first-order sentence of
  quantifier depth `k + 3`, true in `f z` exactly when `z k = true`; so `f z` and `f z′` are not
  `bfEquivSetoid (k + 3)`-equivalent when `z k ≠ z′ k`. At level `ω` a centre is therefore
  equivalent to at most one `f z`, and the codes outside its level-`ω` class meet `𝔠` isomorphism
  classes. A definition asking only that some level class be uncountable would accept this set.

### 4.4 Sentence spectra and Borel observables

Define `sentenceTheory θ c : ℕ → Bool`, for `θ : ℕ → L.Sentenceω` and a code `c` on `ℕ`, the truth
sequence of the list `θ` at `c`. It is measurable in `c` (each coordinate is the indicator of
`modelsOf (θ n)`, Borel by `TauCeti.RelationalConfiguration.measurableSet_modelsOf`) and invariant
under isomorphism (`FirstOrder.Language.Equiv.mem_modelsOf_iff`).

**Checks.**

- `θ n = ⊤` for every `n` gives the constant sequence `true` at every code.
- With unary `P_n` (`n ∈ ℕ`) and `θ n = ∃ x, P_n x`, the code in which `P_0` holds only at `0` and
  every other `P_n` is empty gives `true` exactly at `n = 0`. A truth sequence read off the bits of
  the code rather than the decoded structure would depend on where `P_0` holds.
- Isomorphic codes give equal sequences.

Prove:

- *relative López–Escobar*: with countably many relation symbols, for a standard Borel `X`, a Borel
  `f : X → RelationalConfiguration L ℕ` and a Borel `U ⊆ X` with `x ∈ U ↔ y ∈ U` whenever `f x` and
  `f y` are isomorphic, some sentence `θ` has `f x ∈ modelsOf θ ↔ x ∈ U` for all `x`. Route: the
  images of `U` and of `X \ U` are analytic in the Polish code space; saturate the second under the
  logic action (analytic by `TauCeti.RelationalConfiguration.analyticSet_iUnion_smul`), which keeps
  it disjoint from the first, and apply López–Escobar in separation form (CountableStructureSpaces
  §6.1);
- *Cantor recovery*: for `f : (ℕ → Bool) → RelationalConfiguration L ℕ` with pairwise
  non-isomorphic values, Borel when `L` has countably many relation symbols and continuous for
  every relational `L`, countably many sentences `θ n` satisfy `f x ∈ modelsOf (θ n) ↔ x n = true`.
  The Borel case is relative López–Escobar with `U = {x | x n = true}`. In the continuous case the
  image of `{x | x n = true}` is compact and the saturation of the image of `{x | x n = false}` is
  analytic for every language (CountableStructureSpaces §1.2), and López–Escobar in separation form
  applies;
- `isThin_iff_countable_sentenceSpectra`: with countably many relation symbols, a Borel `C` is thin
  for isomorphism iff every list `θ` has countably many realized truth sequences
  `sentenceTheory θ '' C`. No isomorphism invariance of `C` is assumed. In one direction, apply the
  relative form of Silver's theorem on `C` to the Borel kernel of `sentenceTheory θ`, which
  isomorphism refines: its Cantor-family alternative is a Cantor antichain for isomorphism and
  contradicts thinness. In the other, Cantor recovery turns a Cantor antichain into a list with
  continuum many truth sequences. The sentence form: with countably many relation symbols,
  `IsThinOnNatModels φ` iff every list has countably many truth sequences on `modelsOf φ`;
- *single-sentence splits*: for every relational `L`, a set `C` and a presentation `q : C → Q` of the
  classes met by `C` (`q c = q d` exactly when `c` and `d` are isomorphic; no surjectivity,
  measurability or σ-algebra on `Q` assumed), if for every sentence one of its truth sides in `C`
  has countably many points under `q`, then `C` carries no Cantor antichain for isomorphism, and,
  with countably many relation symbols, `C` is thin. Route: for a Cantor antichain, the sentences of
  continuous Cantor recovery have countable sides, so by `TauCeti.exists_countable_exceptions_of_splits`
  they are simultaneously constant off a countable set of classes, while the antichain has
  continuum many classes with pairwise distinct truth sequences;
- *Borel observables*, with countably many relation symbols: for a standard Borel `X` and a Borel
  `f : X → RelationalConfiguration L ℕ`, every Borel map `h` from `X` into Cantor space with
  `h x = h y` whenever `f x` and `f y` are isomorphic is `x ↦ sentenceTheory θ (f x)` for some list
  `θ`, and into any countably separated measurable space it has the same fibres as such a map; on a
  Borel set of codes a Borel complete invariant exists iff a complete countable list of sentences
  exists; and a thin Borel set of codes with a Borel complete invariant meets countably many
  isomorphism classes.

*Needs:* Tau Ceti `TauCeti.RelationalConfiguration.measurableSet_modelsOf`,
`FirstOrder.Language.Equiv.mem_modelsOf_iff`, `TauCeti.RelationalConfiguration.analyticSet_iUnion_smul`,
`Setoid.countable_or_hasCantorAntichainOn_of_measurableSet`, `TauCeti.exists_countable_exceptions_of_splits`;
Mathlib `MeasurableSet.analyticSet_image`, `MeasureTheory.AnalyticSet.image_of_continuous`;
CountableStructureSpaces §1.2 (saturation of analytic sets for every language) and §6.1
`exists_sentence_separating`.

**API warning.** Thinness of an arbitrary class does not give a complete countable list of
sentences: countable sentence spectra quantify over each list separately, and a thin Borel class
meeting uncountably many classes has no Borel complete invariant. Keep the two quantifier orders
apart.

### 4.5 Fragment spectra

For a countable fragment `F` (`FirstOrder.Language.Fragment L`, InfinitaryModelExistence §1.2) and an
arity `n`, with InfinitaryModelExistence's slice `Fragment.slice F n` and realized truth assignment
`F.slice n → Prop` (its §4.1): define the coded type of a tuple `a : Fin n → ℕ` at a code `c`, the
realized truth assignment of `a` in the decoded structure, measurable in `c` for each `a` and
transported along isomorphisms of codes; the type spectrum of a set `C` at arity `n`, the set of
coded types realized by `n`-tuples of members of `C`; and spectrum equivalence of codes (the same
realized `F`-types at arity `n`), which has Borel graph and is refined by isomorphism. Prove, with
countably many relation symbols and for Borel `C`: `C` is thin iff for every countable fragment `F`
and every arity `n` the type spectrum of `C` is countable. In one direction apply the relative form
of Silver's theorem to spectrum equivalence, its Cantor-family alternative being a Cantor antichain
for isomorphism, and note that each class contributes the countably many types of one countable
model; in the other, the arity-`0` spectrum of `Fragment.generated` of the range of a list `θ`
determines its truth sequences (§4.4). This is the classical definition of a scattered sentence
(Baldwin, Friedman, Koerwien and Laskowski, Lemma 3.4; Marker, "Vaught counterexamples").
*Needs:* §4.4; Tau Ceti `FirstOrder.Language.Fragment`, `FirstOrder.Language.Fragment.generated`,
`FirstOrder.Language.Fragment.generated_countable`, `Setoid.countable_or_hasCantorAntichainOn_of_measurableSet`;
InfinitaryModelExistence §4.1 `fragmentType`, `Fragment.slice`.

### 4.6 Morleyization transport

For a countable set `Φ : Set (Σ n, L.BoundedFormulaω Empty n)` of formulas, Tau Ceti's
Morleyization `L.morleyize Φ` (the relation symbols of `L` and one `n`-ary symbol for each member of
`Φ` of arity `n`) is relational when `L` is (`FirstOrder.Language.isRelational_morleyize`) and has
countably many relation symbols when `L` does (`FirstOrder.Language.countable_relations_morleyize`),
and canonical expansions are isomorphic exactly when the base structures are
(`FirstOrder.Language.nonempty_morleyEquiv_iff`). Define, for relational `L`:

- `morleyCode Φ : RelationalConfiguration L ℕ → RelationalConfiguration (L.morleyize Φ) ℕ`, the
  expansion code, the code (`TauCeti.RelationalConfiguration.ofStructure`) of the canonical
  expansion `FirstOrder.Language.morleyExpansion Φ` of the decoded structure: base bits are copied,
  and the bit of the symbol of `φ` at `v` is the truth of `φ` at `v` in the decoded structure;
- `morleyBase Φ`, reading off the base bits, the reduct
  `(FirstOrder.Language.lhomMorleyize Φ).reductConfiguration`; it is a left inverse of
  `morleyCode Φ`, which is therefore injective.

**Checks.**

- For `Φ = ∅`, `L.morleyize ∅` has only the symbols of `L`, and `morleyCode ∅` and `morleyBase ∅`
  are mutually inverse relabellings.
- For `Φ = {⟨1, ⊤⟩}`, the bit of the new unary symbol is `true` at every element in every code
  `morleyCode Φ c`.
- Two codes of `L.morleyize Φ` that differ only in that bit have the same `morleyBase`, so
  `morleyBase` is not injective, and `morleyCode` is not surjective.

Prove:

- decoding agreement: `(morleyCode Φ c).toStructure` is `FirstOrder.Language.morleyExpansion Φ` of
  `c.toStructure`;
- `measurableEmbedding_morleyCode`: with countably many relation symbols and `Φ` countable,
  `morleyCode Φ` is a measurable embedding: Borel because satisfaction is Borel in the code,
  injective, hence an embedding by Lusin–Souslin (`Measurable.measurableEmbedding`);
- expansion codes are isomorphic exactly when the base codes are, which is
  `FirstOrder.Language.nonempty_morleyEquiv_iff` after decoding agreement;
- `range_morleyCode`: the range of `morleyCode Φ` is the set of codes whose new bits agree with the
  truth of their formulas in the structure decoded from their base code;
- `hasCantorAntichainOn_image_morleyCode_iff`: with countably many relation symbols and `Φ`
  countable, a set of base codes carries a Cantor antichain for isomorphism exactly when its image
  under `morleyCode Φ` does (`Setoid.hasCantorAntichainOn_image_iff` with the two previous items),
  and likewise it is thin exactly when its image is (`Setoid.isThinOn_image_iff`).

*Needs:* Tau Ceti `FirstOrder.Language.morleyize`, `FirstOrder.Language.lhomMorleyize`,
`FirstOrder.Language.morleyExpansion`, `FirstOrder.Language.isRelational_morleyize`,
`FirstOrder.Language.countable_relations_morleyize`, `FirstOrder.Language.nonempty_morleyEquiv_iff`,
`FirstOrder.Language.LHom.reductConfiguration`, `FirstOrder.Language.LHom.toStructure_reductConfiguration`,
`TauCeti.RelationalConfiguration.ofStructure`, `TauCeti.RelationalConfiguration.toStructure_ofStructure`,
`Setoid.hasCantorAntichainOn_image_iff`, `Setoid.isThinOn_image_iff`; Mathlib
`Measurable.measurableEmbedding`.

### 4.7 Rank analyses of thinness

A *rank analysis of thinness* for `r : RelationalConfiguration L ℕ → Ordinal.{0}` on a set `A` of
codes is the evidence for the standard route to thinness: `r c < ω₁` for `c ∈ A`; for each `γ`,
every set of pairwise non-isomorphic codes of `A` of rank `γ` is countable; and for every Cantor
antichain `f` for isomorphism in `A`, a continuous injection `g` of Cantor space into itself with
`r` bounded below `ω₁` on the range of `f ∘ g`. Prove that `A` then carries no Cantor antichain
(the subcopy `f ∘ g` would lie in countably many rank strata, each meeting countably many of its
pairwise non-isomorphic values) and so, with countably many relation symbols, is thin; these
conclusions are theorems about the analysis, not fields of it.

The tail lemma: with countably many relation symbols, if `r c < ω₁` for every `c ∈ C` and for every
list `θ` some threshold `b < ω₁` makes the spectrum `sentenceTheory θ '' {c ∈ C | b ≤ r c}`
countable, then `r` is bounded below `ω₁` on the range of every Borel
`f : (ℕ → Bool) → RelationalConfiguration L ℕ` into `C` with pairwise non-isomorphic values. Route:
Cantor recovery gives a list whose truth sequences on the range of `f` are pairwise distinct, so
only countably many `x` have `b ≤ r (f x)`.
*Needs:* §4.4.

### Examples

In a countable relational language, a concentrated set of codes is back-and-forth scattered (§4.3),
hence thin (§4.1), with no analyticity hypothesis. A set meeting countably many classes is
concentrated, scattered and thin.

### Dependencies

Layers 1 and 3 (§3.1, §3.4); Tau Ceti's code spaces, back-and-forth levels, antichain vocabulary,
relative Silver theorem, fragments and Morleyization; CountableStructureSpaces §1.2, §4.4 and §6.1
for saturation, uniform separation and López–Escobar; InfinitaryModelExistence §4.1 for fragment
types.

## Layer 5: Vaught's conjecture

### 5.1 The Vaught dichotomy for one sentence

Define, for every relational `L` (universe-polymorphic) and `φ : L.Sentenceω`:

- `HasVaughtDichotomy φ`: `countableModelCount φ ≤ ℵ₀` or `TauCeti.HasPerfectlyManyCountableModels φ`;
- `HasVaughtCount φ`: `countableModelCount φ ≤ ℵ₀` or `countableModelCount φ = 𝔠`.

With countably many relation symbols the first implies the second, by
`TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq`.
*Needs:* Layer 0.

**Checks.**

- `∃ x ∀ y, y = x` with countably many unary predicates satisfies both, with count `𝔠`; its
  dichotomy holds only through the perfect set at `Fin 1`.
- `⊤` in the empty language (pure sets) satisfies both, with count `ℵ₀`, and so does Ehrenfeucht's
  example (Worked examples), with count `3`.
- Without countably many relation symbols the first does not imply the second: with unary `P_r`
  (`r ∈ ℝ`), `∃ x ∀ y, y = x` has a perfect set at `Fin 1` and count `2^𝔠` (Layer 0, Examples), so
  `HasVaughtDichotomy` holds and `HasVaughtCount` fails.

### 5.2 The conjectures

Each conjecture quantifies over relational `L : Language.{0, 0}` with
`[Countable (Σ l, L.Relations l)]`, because a countable language can always be presented in
universe `0` (§5.6), and counts all at-most-countable models: those on `ℕ` and, explicitly, those on
each `Fin n`. They are statements, not targets.

- `VaughtConjecture`, the perfect-set form: every `φ` has `HasVaughtDichotomy φ`. It is equivalent
  to Steel's "strong" form and, by §4.2, to the "absolute" form of Baldwin, Friedman, Koerwien and
  Laskowski. A counterexample is a sentence with exactly `ℵ₁` countable models and no perfect set of
  pairwise non-isomorphic ones (§5.3); no hypothesis on `𝔠` is involved. This is the conjecture this
  roadmap calls Vaught's conjecture.
- `CardinalVaughtConjecture`, Vaught's form: every `φ` has `HasVaughtCount φ`. A counterexample is a
  sentence with exactly `ℵ₁` countable models, together with `ℵ₁ < 𝔠`. It holds under CH by
  Morley's theorem (§5.3), while under CH the perfect-set form remains open.
- `FirstOrderVaughtConjecture`, Vaught's original setting (§5.5): every complete first-order theory
  in such an `L` has countably many models on `ℕ` up to isomorphism, or a perfect set of pairwise
  non-isomorphic ones. A counterexample is a complete theory with uncountably many models on `ℕ` and
  no perfect set. It is implied by `VaughtConjecture`; the converse is not claimed.

**API warning.** Under CH the cardinal conjecture is a theorem (by Morley), so it is not the
statement to call Vaught's conjecture. Do not define `VaughtConjecture` by the cardinal count, and do
not use the cardinal form in any reformulation stated without `ℵ₁ < 𝔠`.

### 5.3 Reformulations through Morley's theorem

Prove, for `L` with countably many relation symbols and with exactly the further hypotheses shown:

- `not_hasVaughtDichotomy_iff`: `¬ HasVaughtDichotomy φ` iff `countableModelCount φ = ℵ₁` and
  `¬ TauCeti.HasPerfectlyManyCountableModels φ` (no CH hypothesis; from the witnessed Morley
  theorem);
- `not_hasVaughtCount_iff`: `¬ HasVaughtCount φ` iff `countableModelCount φ = ℵ₁` and `ℵ₁ < 𝔠`
  (from the cardinal Morley theorem and `ℵ₁ ≤ 𝔠`);
- the perfect-set form implies the cardinal form, `VaughtConjecture → CardinalVaughtConjecture`
  (by `TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq`);
- `cardinalVaughtConjecture_of_aleph_one_eq_continuum`: `ℵ₁ = 𝔠` implies `CardinalVaughtConjecture`
  (a count at most `ℵ₁` is at most `ℵ₀` or equal to `ℵ₁ = 𝔠`; for one sentence, Andrews,
  Goldbring, Hachtman, Keisler and Marker, §1, p. 1);
- `cardinalVaughtConjecture_iff_vaughtConjecture`: if `ℵ₁ < 𝔠`, then `CardinalVaughtConjecture` iff
  `VaughtConjecture` (a count of `𝔠 > ℵ₁` forces the perfect alternative of the witnessed Morley
  theorem; Andrews, Goldbring, Hachtman, Keisler and Marker, §1, p. 1, state it for one sentence
  with the absolute form of §5.2 in place of the perfect-set form).

The infinite-model reduction needs no countability: prove `hasVaughtDichotomy_and_infiniteSentence_iff`,
for every relational `L`: `HasVaughtDichotomy (φ ⊓ L.infiniteSentence)` iff the models of `φ` on `ℕ`
fall into countably many isomorphism classes or `HasPerfectSetOfNonisoModelsOn ℕ φ` (§0.3). Prove
`vaughtConjecture_iff_nat`: `VaughtConjecture` is equivalent, with no hypothesis, to its statement
for models on `ℕ`, that every `φ` over every relational `L : Language.{0, 0}` with countably many
relation symbols has countably many models on `ℕ` up to isomorphism or
`HasPerfectSetOfNonisoModelsOn ℕ φ`. Forward, apply `VaughtConjecture` to `φ ⊓ L.infiniteSentence`
and the infinite-model reduction. Backward, a perfect set on `ℕ` is a perfect set at a tier;
otherwise §0.2 settles every finite tier in the countable language, giving a perfect set at some
`Fin n` or countably many models on every tier, and then `countableModelCount φ ≤ ℵ₀` by
`TauCeti.countableModelCount_le_aleph0_iff`.
*Needs:* §0.2, §0.3, §3.3, §5.1, §5.2; Tau Ceti `TauCeti.countableModelCount_le_aleph0_iff`,
`TauCeti.HasPerfectlyManyCountableModels.of_nat`, `TauCeti.HasPerfectlyManyCountableModels.of_fin`;
Mathlib `Cardinal.aleph_one_le_continuum`, `Cardinal.aleph_one_le_iff`.

### 5.4 The scattered and rank forms, and the counterexample profile

Prove, unconditionally:

- `vaughtConjecture_iff_bfScattered`: `VaughtConjecture` iff every sentence (over every relational
  `L : Language.{0, 0}` with countably many relation symbols) whose models on `ℕ` are back-and-forth
  scattered has countably many models on `ℕ` up to isomorphism; by §4.2 and the infinite-model
  reduction;
- `cardinalVaughtConjecture_iff_bfScattered`: the same with `CardinalVaughtConjecture`, **under
  `ℵ₁ < 𝔠`**, by the previous equivalence and §5.3; under CH the cardinal form holds while the
  scattered statement remains open;
- `vaughtConjecture_iff_forall_isIsolatingRank_bounded`: `VaughtConjecture` iff for every isolating
  rank `ρ` every thin sentence has `ρ` bounded below `ω₁` on its models on `ℕ`; equivalently for the
  Scott height alone. Route: §4.2, `TauCeti.exists_rank_bound_of_countable_isoClasses` and
  `TauCeti.IsIsolatingRank.countable_isoClasses_iff_bounded`.

The counterexample profile, with countably many relation symbols and no CH hypothesis: a sentence
`φ` with `¬ HasVaughtDichotomy φ` has thin models on `ℕ`, countably many classes at every level
`β < ω₁` (§3.1), every isolating rank unbounded below `ω₁` on its models on `ℕ` (§2.1) with
countable rank fibres on the isomorphism classes
(`TauCeti.IsIsolatingRank.countable_rankOnIsoClasses_preimage`), and countably many finite models up
to isomorphism (§0.2).
*Needs:* §2.1, §3.1, §4.1, §4.2, §5.3; Tau Ceti `TauCeti.exists_rank_bound_of_countable_isoClasses`,
`TauCeti.IsIsolatingRank.countable_isoClasses_iff_bounded`,
`TauCeti.IsIsolatingRank.countable_rankOnIsoClasses_preimage`, `TauCeti.isIsolatingRank_scottHeight`.

### 5.5 The first-order conjecture

Define `modelsOfTheory T`, for a first-order theory `T : L.Theory` of a relational `L`, as the set of
codes on `ℕ` whose decoded structure is a model of `T`, and `FirstOrderVaughtConjecture` as in §5.2:
for relational `L : Language.{0, 0}` with countably many relation symbols and complete `T`, the codes
of `modelsOfTheory T` meet countably many isomorphism classes or contain a perfect set of pairwise
non-isomorphic codes.

**Checks.**

- `T = ∅` gives every code on `ℕ`.
- `T = {∃ x ∀ y, y = x}` gives `∅`.
- In the language of one unary `P`, `T = {∀ x, P x}` gives exactly one code, the one with `P` true
  everywhere.

Prove `VaughtConjecture.firstOrder`: `VaughtConjecture` implies `FirstOrderVaughtConjecture`. A
first-order theory in a countable relational language is a countable set of sentences (Mathlib's
countability of `Σ n, L.BoundedFormula α n` for countably many symbols), so the countable conjunction
`FirstOrder.Language.Theoryω.conjunction` of their embeddings `FirstOrder.Language.BoundedFormula.toInf`,
together with `L.infiniteSentence`, is a sentence whose models on `ℕ` are those of `T` and which has
no finite models; completeness is not used in the implication. The two conjectures are distinct
definitions: no target identifies them, and the converse implication is not a target.
`FirstOrderVaughtConjecture` is stated for countable relational vocabularies. Reducing languages
with function or constant symbols to it means transferring the count of countable models across
InfinitaryModelExistence's graph translation (its Layer 6); that transfer is outside this roadmap
and the roadmaps it builds on, and must reuse that roadmap's translation and its semantic API.
*Needs:* §0.3, §5.3; Tau Ceti `FirstOrder.Language.Theoryω.conjunction`,
`FirstOrder.Language.Theoryω.realize_conjunction_iff`, `FirstOrder.Language.BoundedFormula.toInf`;
Mathlib `FirstOrder.Language.Theory.Model`, `FirstOrder.Language.Theory.IsComplete`.

### 5.6 Universes

Prove `vaughtConjecture_iff_forall_universe`: the conjecture over `Language.{0, 0}` is equivalent to
`HasVaughtDichotomy φ` for every sentence of every relational `L : FirstOrder.Language.{u, v}` with
countably many relation symbols, for any universes `u`, `v`. Route: move a countable relational
language to `Language.{0, 0}` along `FirstOrder.Language.smallPresentationEquiv`, and a language in
universe `0` up to `u`, `v` along the equivalence with its symbols lifted, transporting the count
(`FirstOrder.Language.LEquiv.lift_countableModelCount_onBoundedFormulaInf`) and perfect sets
(`FirstOrder.Language.LEquiv.hasPerfectlyManyCountableModels_onBoundedFormulaInf_iff`); Tau Ceti's
`TauCeti.exists_language_zero_countableModelCount` packages the first direction. Carriers in other
universes are covered by `TauCeti.classOf`. Prove the same transport for
`FirstOrderVaughtConjecture`.
*Needs:* §5.2; Tau Ceti `FirstOrder.Language.smallPresentation`,
`FirstOrder.Language.smallPresentationEquiv`, `FirstOrder.Language.realize_smallPresentation`,
`FirstOrder.Language.LEquiv.onConfiguration`, `FirstOrder.Language.LEquiv.isoSetoid_onConfiguration_iff`,
`FirstOrder.Language.LEquiv.image_onConfiguration_modelsOf`,
`FirstOrder.Language.LEquiv.lift_countableModelCount_onBoundedFormulaInf`,
`FirstOrder.Language.LEquiv.hasPerfectlyManyCountableModels_onBoundedFormulaInf_iff`,
`TauCeti.exists_language_zero_countableModelCount`, `FirstOrder.Language.LHom.onBoundedFormulaInf`.

### 5.7 Minimally uncountable classes

For a set `K` of codes on `ℕ`, define `MinimallyUncountableOn K`: `K` meets uncountably many
isomorphism classes, and for every sentence `θ` one of `K ∩ modelsOf θ` and `K \ modelsOf θ` meets
only countably many (cuts range over sentences, not arbitrary invariant sets). For `K = modelsOf φ`
the two sides are `modelsOf (φ ⊓ θ)` and `modelsOf (φ ⊓ ∼θ)`.

**Checks.**

- `∅` fails: it meets no class.
- The models on `ℕ` of "`E` is an equivalence relation" fail: "some class has exactly `2` elements"
  leaves `𝔠` classes on each side (the codes `f z` of Layer 3, Examples, with `z 0 = true`,
  respectively `z 0 = false`).
- The codes on `ℕ` of well-orders fail: "there is a last element" leaves `ℵ₁` classes on each side
  (the countably infinite successor ordinals and the countable limit ordinals).

For an arbitrary `ρ : RelationalConfiguration L ℕ → Ordinal.{0}`, boundedness of `ρ` below `ω₁` on a
set (`∃ β < ω₁, ∀ c ∈ K, ρ c < β`, the strict bound of
`TauCeti.IsIsolatingRank.countable_isoClasses_iff_bounded`) is monotone, holds on the empty set, and
is closed under countable unions (regularity of `ℵ₁`). Define `MinimallyUnboundedOn ρ K`: `ρ` is not
bounded below `ω₁` on `K`, and for every sentence `θ` it is bounded below `ω₁` on `K ∩ modelsOf θ` or
on `K \ modelsOf θ`.

**Checks.**

- `∅` fails: `β = 0` bounds `ρ` on it.
- For an isolating rank `ρ`, a set inside the isomorphism class of `c` fails: `ρ c + 1` bounds `ρ` on
  it.
- Without an isolating rank it can hold on a single isomorphism class. With one unary `P`, let `K`
  be the isomorphism class of the code in which `P` is the even numbers (`𝔠` codes, all those with
  `P` infinite and coinfinite; `K = modelsOf σ` for its Scott sentence `σ`), and let `ρ` take values
  cofinal in `ω₁` on `K` (possible as `K` has at least `ℵ₁` members; no CH is used). Then `ρ` is
  unbounded on `K`, and every `modelsOf θ` contains `K` or misses it, so one side of each sentence
  cut is empty and `β = 0` bounds `ρ` there. As `K` meets one class, it is not minimally
  uncountable: `minimallyUncountableOn_modelsOf_iff_minimallyUnboundedOn` needs `ρ` isolating.

Prove:

- the generic engine: for a smallness predicate on sets of codes closed under subsets and countable
  unions, if `K` is not small, every cut of `K` by a level-`α` class has a small side, and `K` meets
  countably many level-`α` classes for some `α < ω₁`, then some level-`α` class of a member of `K`
  meets `K` in a set that is not small and has small complement in `K`. Instances: "meets countably
  many isomorphism classes" and "`ρ` is bounded below `ω₁`";
- with countably many relation symbols, level classes are sentence cuts (§1.1), so a `K` all of
  whose sentence cuts have a small side has the same property for cuts by level classes, and the
  engine applies;
- thinness from sentence cuts: if every sentence cut of `K` has a side meeting countably many
  classes, `K` carries no Cantor antichain for isomorphism, and, with countably many relation
  symbols, is thin (§4.4, single-sentence splits); so a minimally uncountable set carries no Cantor
  antichain, and is thin in a countable language;
- `minimallyUncountableOn_modelsOf_iff`: with countably many relation symbols, the models of `φ` are
  minimally uncountable iff they are concentrated (§4.3) and meet uncountably many classes;
- `minimallyUncountableOn_modelsOf_iff_minimallyUnboundedOn`: with countably many relation symbols
  and for every isolating rank `ρ`, the models of `φ` are minimally uncountable iff they are
  back-and-forth scattered and `ρ` is minimally unbounded on them (Montalbán's minimally unbounded
  sentences). On a scattered class, countably many classes is the same as `ρ` bounded, on every
  subclass (§4.1), so minimal unboundedness does not depend on the isolating rank;
- `not_vaughtConjecture_of_minimallyUncountableOn`: for `L : Language.{0, 0}` with countably many
  relation symbols, a sentence with minimally uncountable models refutes `VaughtConjecture`. It
  passes through `φ ⊓ L.infiniteSentence`, which has the same models on `ℕ`, thin and meeting
  uncountably many classes, and no finite models, since the finite tiers of `φ` can carry a perfect
  set.

*Needs:* §0.3, §1.1, §4.1–§4.4, §5.3; Tau Ceti `TauCeti.IsIsolatingRank.countable_isoClasses_iff_bounded`,
`TauCeti.RelationalConfiguration.modelsOf_scottSentenceAtLevel`, `Setoid.countable_quotient_comap_val_iff`.

### 5.8 Saturation and the limit model

The three inputs of §5.9, in the back-and-forth convention of the parent roadmap (cf. Montalbán,
Part 2, Lemmas XII.5–XII.6, pp. 218–219):

1. **Level classes are sentences.** With countably many relation symbols, §1.1's
   `TauCeti.RelationalConfiguration.modelsOf_scottSentenceAtLevel` (Montalbán's Lemma XII.5, with
   `bfEquivSetoid β` in place of his `≡_β`; the hierarchies differ, but the statement holds for
   either).
2. **Saturation of a sentence.** Prove `exists_bfLevel_saturated_modelsOf`: with countably many
   relation symbols, for every sentence `θ` there is `β₀ < ω₁` such that for every `β ≥ β₀`,
   `bfEquivSetoid β`-equivalent codes agree on `θ`. Route: uniform separation (CountableStructureSpaces
   §4.4) applied to the Borel, hence analytic, set `modelsOf θ ×ˢ (modelsOf θ)ᶜ`, which contains no
   isomorphic pair; then monotonicity. This replaces Montalbán's appeal to the quantifier complexity
   of `θ`, so no quantifier-rank preservation theorem is needed.
   *Needs:* §1.1; Tau Ceti `TauCeti.RelationalConfiguration.measurableSet_modelsOf`,
   `TauCeti.BFEquiv.mono`; CountableStructureSpaces §4.4 `exists_uniform_bfSeparation`.
3. **The limit model.** For codes `c i` on `ℕ` and a monotone `α : ℕ → Ordinal.{0}` with
   `bfEquivSetoid (α i + ω) (c i) (c (i + 1))` for all `i`, there is a code `d` with
   `bfEquivSetoid (α i) d (c i)` for all `i`: Tau Ceti's
   `TauCeti.RelationalConfiguration.exists_limit_of_bfEquiv_chain`. It is proved in the
   one-element-per-move convention, with the uniform offset `ω` in the hypothesis and no offset in
   the conclusion; it is not translated from Montalbán's Lemma XII.6, whose hypothesis `≡_{α_i + 3}`
   is stated in a convention in which `≡_β` moves blocks.

### 5.9 Minimal counterexamples

The reduction of Harnik and Makkai, as used by Steel (cf. Montalbán, Part 2, Theorem XII.7,
pp. 219–220):

1. **The splitting tree.** Let `L` have countably many relation symbols, let `modelsOf Θ` be
   back-and-forth scattered and meet uncountably many isomorphism classes, and suppose no `Θ ⊓ θ` has
   minimally uncountable models. Call a set *large* if it meets uncountably many isomorphism classes.
   Put `α_0 :=` the saturation level of `Θ` (§5.8). Since `modelsOf Θ` meets countably many
   level-`α_0` classes and is large, the class `C_∅` of some `A_∅ ∈ modelsOf Θ` is large, and
   `C_∅ ⊆ modelsOf Θ` by saturation. Build codes `A_σ` (`σ` a finite binary word) and an increasing
   sequence `α_i < ω₁` with `α_{i+1} ≥ α_i + ω` such that each class
   `C_σ := {d | bfEquivSetoid α_|σ| A_σ d}` is large and contained in `modelsOf Θ`, and `A_{σ0}`,
   `A_{σ1}` are `bfEquivSetoid α_|σ|`-equivalent to `A_σ` but not `bfEquivSetoid α_{|σ|+1}`-equivalent
   to each other. At length `n`, for each of the `2^n` words `σ`: `C_σ` is the model set of
   `Θ ⊓ A_σ.scottSentenceAtLevel α_n`; by assumption some sentence `φ_σ` splits it into two large
   sides. Take one `α_{n+1} < ω₁` at least `α_n + ω` and the saturation levels of all `φ_σ` with
   `|σ| = n`, so that for each such `σ` both sides are unions of level-`α_{n+1}` classes; each side
   meets countably many such classes (scatteredness) and is large, so one of its classes is large;
   take `A_{σ0}`, `A_{σ1}` there.
2. **The reduction.** Prove `exists_minimallyUncountableOn_and_of_bfScattered`: with countably many
   relation symbols, if `modelsOf Θ` is back-and-forth scattered and meets uncountably many
   isomorphism classes, some `Θ ⊓ θ` has minimally uncountable models (Montalbán, Theorem XII.7,
   pp. 219–220, for scattered unbounded sentences, which is this statement by §4.1 and
   `minimallyUncountableOn_modelsOf_iff_minimallyUnboundedOn`; Montalbán, p. 218, attributes to
   Harnik and Makkai that a counterexample yields a minimally unbounded one). Route: otherwise, for
   each `X : ℕ → Bool`, the limit model (§5.8) applied to `A_{X↾1}, A_{X↾2}, …` with levels
   `α_0, α_1, …` (consecutive codes are equivalent at `α_{i+1} ≥ α_i + ω`) gives a code `A_X` with
   `bfEquivSetoid α_i A_X A_{X↾(i+1)}` for all `i`. Each `A_X` lies in `C_∅ ⊆ modelsOf Θ`. If `X`
   and `Y` first differ at `i`, then `A_X ~ A_{X↾(i+2)} ~ A_{X↾(i+1)}` and likewise for `Y` at level
   `α_{i+1}`, while `A_{X↾(i+1)}` and `A_{Y↾(i+1)}` are inequivalent at `α_{i+1}`; so `A_X` and
   `A_Y` are inequivalent at `β := sup_i α_i < ω₁`. That gives continuum many level-`β` classes met
   by `modelsOf Θ`, contradicting scatteredness. No continuity of `X ↦ A_X` is needed, and no CH:
   the contradiction is with scatteredness, not with a cardinal bound.
   *Needs:* §1.1, §4.1, §5.7, §5.8; Tau Ceti `TauCeti.RelationalConfiguration.scottSentenceAtLevel`,
   `TauCeti.RelationalConfiguration.exists_limit_of_bfEquiv_chain`.
3. **Consequences.** Prove `vaughtConjecture_iff_forall_not_minimallyUncountableOn` (with §5.4 and the
   infinite-model reduction): `VaughtConjecture` holds iff no sentence over any relational
   `L : Language.{0, 0}` with countably many relation symbols has minimally uncountable models.
   Every counterexample has a minimally uncountable strengthening `φ ⊓ θ`. The two readings of
   "countably many models on `ℕ`" used here, through `isoSetoidOn ℕ φ` and through the image of
   `modelsOf φ` in `Quotient (isoSetoid L ℕ)`, agree by Convention 5;
   `not_vaughtConjecture_of_minimallyUncountableOn` passes through `φ ⊓ L.infiniteSentence` (§5.7).
   *Needs:* §5.4, §5.7, the reduction above.

### Examples

The implication `VaughtConjecture → CardinalVaughtConjecture`,
`cardinalVaughtConjecture_of_aleph_one_eq_continuum`, `not_hasVaughtCount_iff` and
`cardinalVaughtConjecture_iff_vaughtConjecture` use Layers 0 and 3 alone. Under `ℵ₁ = 𝔠` every
sentence of a countable relational language satisfies `HasVaughtCount`, while `HasVaughtDichotomy`
remains a statement about perfect sets.

### Dependencies

Layers 0–4; Tau Ceti's limit model, small presentation, language-equivalence transport and
infinitary theories; CountableStructureSpaces §4.4 for saturation.

## Layer 6: a structure of internal Scott rank ω whose level-ω class is large

This layer exercises Layers 1–4: it shows that the parent roadmap's internal Scott rank is not an
isolating rank, that the Scott height can exceed the internal rank, and that a single back-and-forth
class at a limit level can meet continuum many isomorphism classes. It builds only what that needs.

### 6.1 Invariance of the internal Scott rank

Prove `Language.Equiv.internalScottRank_eq`: for relational `L`, `M` and `N` in one universe and
`e : M ≃[L] N`, the internal Scott ranks of `M` and `N` are equal; orbit ranks are carried along `e`
by `FirstOrder.Language.Equiv.bfEquiv`. It is the counterpart of Tau Ceti's
`FirstOrder.Language.Equiv.scottHeight_eq`; the rank of `M : Type w` lies in `Ordinal.{w}`, so both
structures lie in one universe.
*Needs:* Tau Ceti `TauCeti.internalScottRank`, `TauCeti.orbitRank`, `FirstOrder.Language.Equiv.bfEquiv`.

### 6.2 Row assemblies

The general row-assembly API, built only as far as §6.3 uses it. For a type `U` of row letters and a
component language `Lc : Language.{0, 0}`, `RowAssembly.Label U` is the type of nonempty words over
`U`; `RowAssembly.Sym U Lc` the relation symbols: `row` (unary), `own` (binary), `lab τ` (unary)
for each label `τ`, and the constructors `lift` and `lift0` lifting the relations of `Lc` (the
nullary ones read at the owner row); and `RowAssembly.lang U Lc` the relational language with these
symbols. The API: the assembled carrier over rows and labelled fibers; isomorphism assembly and
restriction; back-and-forth assembly at the same level for tuples matched along a fixed row
bijection; pointed restriction of back-and-forth equivalence to a fiber with its owner row
retained; and the owner-row step. The parent roadmap's own internal-Scott-rank examples (pure sets,
`K₂ ⊔ K₃`, dense linear orders) are not repeated.
*Needs:* Tau Ceti `TauCeti.BFEquiv` and its API (`TauCeti.BFEquiv.add_one`, `TauCeti.BFEquiv.limit`,
`TauCeti.BFEquiv.mono`, `TauCeti.BFEquiv.comp`); Mathlib `FirstOrder.Language.IsRelational`.

### 6.3 The witness

Fix `U = ℕ`, the empty component language, default component `B_* = ℕ`, components
`B u = Fin (u + 1)`, and allowed sets `A n = {u | u ≤ n}`. The *rows* are the nondecreasing finite
words `p` over `ℕ` with `p[i] ≤ i`. The language is `RowAssembly.lang ℕ Language.empty`, whose
`lift` and `lift0` constructors give no symbols, the empty language having none. The base
structure `M` has the rows and, for each row `p` and label `τ`, a fiber `Fin (last τ + 1)` if `τ` is
a prefix of `p` and `ℕ` otherwise, with `row`, `own(x, p)` and `lab τ` interpreted as membership.
For `z : ℕ → Bool` the path `π_z (2n) = n`, `π_z (2n + 1) = n + (z n : ℕ)` is allowed, nondecreasing,
and injective in `z`; the companion `N_z` adds one row following `π_z` (its fiber at a prefix of
`π_z` of length `k` is `Fin (π_z (k - 1) + 1)`, and `ℕ` elsewhere). `M` and every `N_z` are
countably infinite. Prove, in the parent's convention `SR(M) = sup_a (orbitRank a + 1)` with
`orbitRank` the least orbit-stable level:

- the internal Scott rank of `M` is `ω`. *Upper bound*: every tuple `a` of `M` is pinned up to
  automorphism at a finite level (append the owner rows of `a`, at cost `|a|` levels; the rows of the
  extended tuple are pinned up to fiberwise isomorphism at level `r + 2` where `r` bounds their
  lengths, because `ℕ ≡_k Fin (u + 1)` holds exactly for `k ≤ u + 1`; adjust the fiber isomorphisms
  on the finitely many occupied fibers, where components are pure sets of orbit rank `0`), so every
  orbit rank is finite. *Lower bound*: for each `k` the rows `[0, 1, …, k]` and `[0, 1, …, k, k]`
  differ only in the fiber at the label `[0, …, k, k]`, which is `Fin (k + 1)` against `ℕ`; they are
  `BFEquiv k` (back-and-forth assembly along the transposition of the two rows) and not automorphic
  (an automorphism would restrict to an isomorphism `Fin (k + 1) ≅ ℕ`), so the orbit rank of
  `[0, …, k]` is greater than `k`;
- `BFEquiv ω` between `N_z` and `M` (empty tuples): for each `m`, `N_z ≡_m M` by the back-and-forth
  assembly along the Hilbert-hotel bijection of rows that shifts the tail prefixes of `π_z` from
  length `2m` on, because the components along `π_z` from position `2m` on are `≡_m ℕ`; then
  `TauCeti.BFEquiv.limit`;
- `N_z` is not isomorphic to `M`, and `N_z`, `N_{z'}` are not isomorphic for `z ≠ z'`: an
  isomorphism sends rows to rows and fibers onto fibers with the same label, and the path row has a
  fiber `Fin (u + 1)` at labels where every finite row, or the other path row, has `ℕ`;
- `ω < scottHeight M`, in Tau Ceti's convention (external stabilization against all countable
  structures in `Type`, values in `Ordinal.{0}` for `M : Type`): otherwise
  `TauCeti.nonempty_equiv_of_bfEquiv_of_scottHeight_le` at level `ω` would make `N_z ≅ M`. With
  `TauCeti.scottHeight_le_internalScottRank_add_omega0`, `scottHeight M ≤ ω + ω`. The exact value is
  not a target.

All four are packaged as `RowAssembly.exists_internalScottRank_omega_with_large_bfClass`: there are a countable
structure `M` of the language `RowAssembly.lang ℕ Language.empty` with internal Scott rank `ω` and
`ω < scottHeight M`, and countable structures `N z` (`z : ℕ → Bool`), each `BFEquiv ω` to `M` at the
empty tuples, none isomorphic to `M`, and pairwise non-isomorphic.
*Needs:* §6.1, §6.2; Tau Ceti `TauCeti.internalScottRank`, `TauCeti.orbitRank`, `TauCeti.scottHeight`,
`TauCeti.BFEquiv.limit`, `TauCeti.nonempty_equiv_of_bfEquiv_of_scottHeight_le`,
`TauCeti.scottHeight_le_internalScottRank_add_omega0`.

### 6.4 Consequences for the counting interfaces

- `RowAssembly.not_isIsolatingRank_internalScottRank`: the internal Scott rank of the decoded structure, read on
  codes on `ℕ` of `RowAssembly.lang ℕ Language.empty`, is not an isolating rank. Transport `M` and one
  `N_z` to codes on `ℕ` (`Equiv.encodeVia`); they are `bfEquivSetoid ω`-equivalent and not
  isomorphic, while the internal rank of the code of `M` is `ω`, the rank of `M`, by §6.1.
- Every isolating rank `ρ` satisfies `ω < ρ` at the code of `M` (otherwise
  `TauCeti.IsIsolatingRank.isolates_of_le` at level `ω`).
- The `bfEquivSetoid ω`-class of the code of `M` meets `𝔠` isomorphism classes, although it is a
  single class at every level up to `ω`: the one-sidedness of isolation in §1.2 is necessary
  (isolation holds at the rank of the code of `M`, which exceeds `ω`, not at that of the other
  codes), and a single class at every level up to a limit does not bound the isomorphism classes of
  an arbitrary set of codes (compare §1.4, Checks).

*Needs:* §6.1, §6.3; Tau Ceti `Equiv.encodeVia`, `Equiv.nonempty_equiv_encodeVia`,
`TauCeti.IsIsolatingRank`, `TauCeti.IsIsolatingRank.isolates_of_le`,
`TauCeti.RelationalConfiguration.bfEquivSetoid_apply`, `TauCeti.RelationalConfiguration.isoSetoid_apply`.

### Examples

The internal rank versus isolation: the code of `M` has internal Scott rank `ω`, every isolating
rank exceeds `ω` there, and its level-`ω` class contains the codes of the continuum many pairwise
non-isomorphic `N_z`.

### Dependencies

Layers 1–2 (the isolating-rank contract and the internal Scott rank of §2.2); Tau Ceti's
back-and-forth equivalence, Scott height and internal Scott rank, and code transport.

## Worked examples

- **Pure sets.** In the empty language, `countableModelCount ⊤ = ℵ₀` (one class for each finite
  size and one for `ℕ`); `countableModelCount L.infiniteSentence = 1`.
- **One element, many predicates** (Layer 0, Examples): continuum many pairwise non-isomorphic
  one-element structures, a perfect set at the tier `Fin 1`, and no models on `ℕ`. Morley's theorem
  and the bounded-rank dichotomy are witnessed here only through a finite tier.
- **Equivalence relations with infinite classes** (Layer 2, Examples): internal Scott rank `1`,
  exactly `ℵ₀` models.
- **Equivalence relations** (Layer 3, Examples): an explicit perfect set; `countableModelCount = 𝔠`.
- **Ehrenfeucht's example, relationally.** With a binary `<` and unary `P_n` (`n ∈ ℕ`): `<` is a
  dense linear order without endpoints, each `P_n` holds of exactly one element `c_n`, and
  `c_n < c_{n+1}`. Exactly three countable models: the `c_n` cofinal, bounded with a least upper
  bound, bounded without one. So `countableModelCount = 3`, and every isolating rank is bounded on
  its models.
- **Internal rank versus isolation** (Layer 6, Examples).
- **Thin from concentration.** A set meeting countably many classes is concentrated, scattered and
  thin; the models of a minimally uncountable sentence are concentrated.
- **Vaught under CH.** Under `ℵ₁ = 𝔠`, every sentence of a countable relational language has
  `HasVaughtCount` (§5.3), while `HasVaughtDichotomy` remains a statement about perfect sets.

## Provenance

A Lean formalization of most of this material exists in
[`cameronfreer/infinitary-logic`](https://github.com/cameronfreer/infinitary-logic) at commit
[`518a366`](https://github.com/cameronfreer/infinitary-logic/tree/518a366cba97b1ae8c4dc64a297a396939bc3e0b)
(Apache-2.0, sorry-free, axioms `propext`, `Classical.choice`, `Quot.sound`). It is Cameron Freer's
repository; credit `cameronfreer/infinitary-logic` in ported files. The map below says where to
look, not what is correct; the targets above differ from it where noted. Paths are relative to
`InfinitaryLogic/` at that commit.

| Layer | Source | Differences from the target |
| --- | --- | --- |
| 0 | `Descriptive/FiniteCarrier.lean` (`isoSetoidOn`, `AllCodedIsoClasses`, `codeModel`, `iso_iff_orbit`, `counting_fin_models_dichotomy`); `Descriptive/StructureIsoSetoid.lean` (`HasPerfectSetOfPairwiseNonisomorphicNatModels`, `IsThinOnNatModels`) | The source's bridges are for models in `Type`; Tau Ceti's `TauCeti.classOf` works in every universe. `TauCeti.CountableModelClasses` is the source's `AllCodedIsoClasses` |
| 1 | `ModelTheory/MorleyCounting.lean` (`bfEquivSetoid`, `bfProj`, `mk_isoSetoid_subtype_le_aleph_one`); `Descriptive/ScatteredCounting.lean` (`IsIsolatingRank`, `codeStabilizationOrdinal`); `OrdinalCountability.lean`; `ModelTheory/BFExtensionSpectrum.lean`, `BFLimitIsolation.lean`, `BFSmallCounting.lean`; `Descriptive/MinimallyUncountable.lean` (`modelsOf_scottSentenceAt`) | The source stratifies by `scottHeight` directly and instantiates the contract with `stabilizationOrdinal`; the target stratifies by any isolating rank and instantiates it with Tau Ceti's external Scott height. The source's `scottSentenceAt` is Tau Ceti's `scottFormula Fin.elim0 α`, read on codes as `TauCeti.RelationalConfiguration.scottSentenceAtLevel` |
| 2 | `Descriptive/CountingDichotomy.lean` (`counting_coded_models_dichotomy`), `ModelTheory/CountingCountable.lean`, `ModelTheory/CountingModels.lean` | The source proves only the cardinal form, through the hypothesis `SilverBurgessDichotomy` discharged elsewhere; the witnessed form is new. `morley_counting_dichotomy` in `CountingModels.lean` returns `True` and is not ported |
| 3 | `ModelTheory/MorleyCounting.lean` (`morley_counting`), `Conditional/MorleyPerfect.lean` (`morley_counting_or_perfect`, `morley_counting_or_perfect_cardinal`) | The source's `morley_counting` takes the dichotomy as an argument; the target's theorems take none. The directory name `Conditional/` is historical: these files are proved |
| 4 | `Descriptive/BFScattered.lean`, `BFScatteredSentence.lean`, `Conditional/BFScatteredSilver.lean`, `Descriptive/BFConcentration.lean`, `ScatteredCounting.lean`; `Descriptive/SentenceRecovery.lean`, `SentenceSplits.lean`, `SentenceObservables.lean`, `ObservableConstancy.lean`, `Conditional/SentenceSpectrum.lean`; `Descriptive/FragmentSpectrum.lean`, `RealizedSpectrum.lean`, `Conditional/FragmentSpectrumThin.lean`; `Descriptive/MorleyizationCode.lean`, `MorleyizationThin.lean`; `Descriptive/RankedThinness.lean`, `FragmentTail.lean` | The source states its recovery theorems at `Language.{0, 0}` and transports them through a chosen small presentation (`Descriptive/SmallVocabulary*.lean`); the target states them for every universe of `L` and consumes López–Escobar at that generality from CountableStructureSpaces, so the transport is not ported here |
| 5 | `Descriptive/MinimallyUncountable.lean`, `MinimallyUncountableThin.lean`, `MinimallyUnbounded.lean`, `Conditional/MinimallyUncountableHeadline.lean` | The source proves the minimality characterizations (concentrated, scattered and minimally unbounded) and the first half of Montalbán's Lemma XII.8. Its headline module states that it does not formalize the limit-model lemma or the reduction to minimal counterexamples (which it cites as Lemmas XII.6 and XII.7) or the club half of Lemma XII.8; the saturation step, the limit model, the splitting tree and the reduction are new here. The source has no statement of Vaught's conjecture: the three conjectures and their reformulations are new. The transport results along language equivalences (built on InfinitaryModelExistence's language maps and small presentation) are new; the source's `Descriptive/SmallVocabulary*.lean` transports codes and lifts formulas from the small presentation but provides no lowering of formulas |
| 6 | `ModelTheory/FiberAssembly.lean`, `FiberIsoAssembly.lean`, `FiberBFAssembly.lean`, `FiberBFRestriction.lean`, `FiberOwnerRows.lean`, `FiberPrefixDetection.lean`, `FiberProfileBound.lean`, `FiberProfilePerm.lean`, `FiberIsoCarrying.lean`, `FiberOrbitBound.lean`, `FiberTwoRow.lean`, `FiberExactRank.lean`, `FiberExactOmega.lean`, `FiberCompanion.lean`, `FiberCompanionShift.lean`, `FiberCompanionEquiv.lean`, `FiberCompanionIso.lean`, `FiberCantorFamily.lean` | The source's `cantorFamily` gives `β`-equivalence for every `β < ω`; the target states level `ω`, the bound `ω < scottHeight`, and the failure of isolation. The source's general exact-rank, profile-bound and prefix-detection lemmas are ported only as far as the witness uses them |

The source modules `ModelTheory/CountableCompanion.lean`, `ScottCompletion.lean` and
`ArbitraryStabilization.lean` (small models, complete sentences, categoricity) are outside this
roadmap; `Descriptive/BFTree.lean`, `BFSeparation.lean`, `QueryCode.lean`, `SmallVocabulary*.lean`,
`IsomorphismBorel.lean`, `InvariantSeparation.lean` and the López–Escobar modules belong to
CountableStructureSpaces; `Descriptive/PerfectAntichain.lean` and `Conditional/SilverAntichain.lean`
to BorelEquivalenceRelations. They are not ported here.

## Scope and ownership

**This roadmap owns** the classes of countable models and their count, with the finite tiers; the
finite-carrier isomorphism relation and the finite-tier dichotomy; the back-and-forth stratification
and isolating ranks; both dichotomies of Layers 2–3; everything about scattered, concentrated and
minimally uncountable classes; sentence and fragment spectra of coded classes; the coded
Morleyization transport; Vaught's conjecture and its reformulations; and row assemblies.

**Already in the library.** Tau Ceti implements, at the pin of this repository, the following parts
of what this roadmap owns, which the layers above use by name and do not plan again (the exact
declarations are under the supplier contracts): of Layer 0, the restricted isomorphism, the classes
and the count with their summand decomposition, bounds and monotonicity, the class map with its
bridges and tier lemmas, the upper bound `𝔠`, the Borel isomorphism relation on a finite carrier,
`TauCeti.HasPerfectlyManyCountableModels` with its count, `L.infiniteSentence`, and the transport
between presentations of a language; all of Layer 1 (levels on models, level sentences, isolating
ranks and the Scott-height instance, the countable-ordinal bookkeeping, the stratification bound,
level-by-level transfer); of Layer 4, back-and-forth scatteredness with its monotonicity and
observation adapter, the counting of a scattered set and the code form of the isolating level; and
of Layer 5, the limit model.

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap uses it and builds no
second carrier.

- *The infinitary syntax, back-and-forth equivalence, potential isomorphism, the Scott formulas, the
  internal stabilization notions and the internal Scott rank*: the completed InfinitaryLogic
  roadmap, implemented in Tau Ceti.
- *The space of codes, model classes, isomorphism and the logic action, back-and-forth levels on
  codes, the external Scott height, López–Escobar and uniform back-and-forth separation*:
  [CountableStructureSpaces](../CountableStructureSpaces/README.md) Layers 0–2, §4.1–§4.2, §4.4,
  Layer 5 and §6.1. Of these, its statement that model classes are isomorphism invariant (Layer 2),
  uniform back-and-forth separation (§4.4), the saturation of analytic sets for every language
  (§1.2) and López–Escobar in separation form (§6.1) are consumed as its targets; the rest is in Tau
  Ceti.
- *Perfect and Cantor antichains, thinness, countable splits, and Silver's theorem in its relative
  and cardinality forms*: [BorelEquivalenceRelations](../BorelEquivalenceRelations/README.md) §0.5
  and §4.2–§4.3, implemented in Tau Ceti. The descriptive dichotomies themselves belong there.
- *Language maps, fragments and countable theories, fragment types, Morleyization and the small
  presentation of a countable language*: [InfinitaryModelExistence](../InfinitaryModelExistence/README.md)
  §0.1, §0.3, §1.1–§1.2, §4.1 and Layer 5. Of these, fragment types and slices (§4.1) are consumed as
  its targets; the rest is in Tau Ceti. Transfer of Karp theory, back-and-forth analysis and Scott
  ranks across its graph translation (its Layer 6) must reuse that translation and its semantic API.

**Not in this roadmap.** A proof or refutation of Vaught's conjecture; Vaught's conjecture for
special classes of sentences or theories (for example ω-stable theories); the uncountable models of
counterexamples and their spectra; the topological Vaught conjecture for general Polish group
actions; the bound "at most ℵ₁ classes or a perfect set of inequivalent points" for arbitrary
analytic equivalence relations. Also outside this roadmap and the three sibling roadmaps it builds
on: admissible sets, Barwise compactness and Nadel's bound; Scott processes; `Lκλ` for `κ > ω₁`
beyond `L∞ω`; many-sorted logic; transfer of Karp theory, back-and-forth analysis and Scott ranks
across the graph translation of function and constant symbols; effective Scott analysis; the
general Harrington–Kechris–Louveau dichotomy and the Gandy–Harrington topology; the coanalytic form
of Silver's theorem; Ehrenfeucht–Mostowski models, Hanf numbers, small models and complete
sentences.

## Exact supplier contracts

### From Mathlib

- Descriptive set theory: `PolishSpace`, `StandardBorelSpace`, `MeasurableSet.standardBorel` (a Borel
  subset of a standard Borel space is standard Borel), `MeasurableSet.isClopenable` (a Borel subset
  of a Polish space is clopen in a finer Polish topology with the same Borel sets),
  `MeasureTheory.AnalyticSet`, `MeasurableSet.analyticSet`, `MeasurableSet.analyticSet_image` (the
  image of a Borel set of a standard Borel space under a measurable map is analytic),
  `MeasureTheory.AnalyticSet.image_of_continuous`, `MeasureTheory.AnalyticSet.measurablySeparable`
  (Lusin separation), `MeasureTheory.analyticSet_range_of_polishSpace`
  (`Mathlib/MeasureTheory/Constructions/Polish/Basic.lean`), `Measurable.measurableEmbedding` (a
  measurable injection from a standard Borel space into a countably separated space is a measurable
  embedding: Lusin–Souslin), `MeasurableEmbedding`; `Descriptive.tree`
  (`Mathlib/SetTheory/Descriptive/Tree.lean`).
- Perfect sets: `Perfect` (`Mathlib/Topology/Perfect.lean`), `Perfect.exists_nat_bool_injection` and
  `IsClosed.exists_nat_bool_injection_of_not_countable` (`Mathlib/Topology/MetricSpace/Perfect.lean`).
- Cardinals and ordinals: `Cardinal.continuum` (`𝔠`), `Cardinal.aleph` (`ℵ₁ = Cardinal.aleph 1`),
  `Cardinal.aleph_one_le_continuum`, `Cardinal.aleph_one_le_iff` (`ℵ₁ ≤ c ↔ ℵ₀ < c`),
  `Cardinal.mk_le_aleph0_iff`, `Cardinal.mk_le_of_injective`; `Ordinal.omega` (`ω₁ = Ordinal.omega 1`),
  `Cardinal.countable_Iio_of_lt_omega_one`, `Ordinal.iSup_lt_omega_one`, `Cardinal.isSuccLimit_omega`.
- Model theory and relations: `FirstOrder.Language`, `FirstOrder.Language.Structure`,
  `FirstOrder.Language.Equiv` (between structures in different universes),
  `FirstOrder.Language.IsRelational`, `FirstOrder.Language.LHom` with
  `FirstOrder.Language.LHom.IsExpansionOn` and `FirstOrder.Language.LHom.realize_onBoundedFormula`,
  `FirstOrder.Language.LEquiv`, `FirstOrder.Language.Sentence.cardGe`,
  `FirstOrder.Language.Theory.Model`, `FirstOrder.Language.Theory.IsComplete`; `Setoid.comap`,
  `Setoid.comapQuotientEquiv`, `Quotient`, `Equiv.Perm`, `MulAction.IsInvariantBlock`.

### From Tau Ceti

Paths are under `TauCeti/`. Each item is assumed exactly as stated.

- *Infinitary syntax and semantics* (the parent InfinitaryLogic roadmap; `ModelTheory/Infinitary/`):
  `FirstOrder.Language.BoundedFormulaInf`, `FirstOrder.Language.BoundedFormulaω`,
  `FirstOrder.Language.Sentenceω`, the coded connectives
  `FirstOrder.Language.BoundedFormulaInf.iInfAlong` and `FirstOrder.Language.BoundedFormulaInf.iSupAlong`
  with `TauCeti.IndexCoding.ofEncodableWith`, the finitary embedding
  `FirstOrder.Language.BoundedFormula.toInf`, realization `FirstOrder.Language.SentenceInf.Realize`,
  and its invariance under isomorphism (`FirstOrder.Language.StrongHomClass.realize_boundedFormulaInf`,
  `FirstOrder.Language.StrongHomClass.realize_sentenceInf`).
- *Back-and-forth and Scott analysis* (`ModelTheory/BackAndForth/`, `ModelTheory/Scott/`):
  `TauCeti.BFEquiv` (one element per move; defined for relational `L`), with `TauCeti.BFEquiv.add_one`
  (the successor step), `TauCeti.BFEquiv.limit`, `TauCeti.BFEquiv.mono`, `TauCeti.BFEquiv.refl`,
  `TauCeti.BFEquiv.symm`, `TauCeti.BFEquiv.trans`, `TauCeti.BFEquiv.comp` (re-indexing both tuples
  along `Fin m → Fin n`), `FirstOrder.Language.Equiv.bfEquiv` (invariance under isomorphism);
  `TauCeti.countable_potentialIso_iff_iso` and `TauCeti.potentialIso_iff_bfEquiv_all`; the Scott
  formulas `TauCeti.scottFormula a α` with `TauCeti.realize_scottFormula_iff_bfEquiv` (countably many
  relation symbols, `α < ω₁`); `TauCeti.SelfStabilizesCompletely`, `TauCeti.selfStabilizationOrdinal`,
  `TauCeti.orbitRank`, `TauCeti.internalScottRank` (the supremum over tuples of orbit rank plus one)
  and `TauCeti.internalScottRank_lt_omega_one`; the Scott height `TauCeti.scottHeight M`, the least
  `β` with `TauCeti.StabilizesCompletely M β` (every `BFEquiv β` between a tuple of `M` and a tuple of
  a countable `N : Type`, finite ones included, is a `BFEquiv (β + 1)`), in `Ordinal.{w}` for
  `M : Type w`, with `TauCeti.scottHeight_lt_omega_one` (countable `M`),
  `FirstOrder.Language.Equiv.scottHeight_eq` (one universe),
  `TauCeti.nonempty_equiv_of_bfEquiv_of_scottHeight_le` (for countable `M : Type w` and `N : Type w'`,
  `scottHeight M ≤ β` and `BFEquiv β 0 Fin.elim0 Fin.elim0` give `Nonempty (M ≃[L] N)`) and
  `TauCeti.scottHeight_le_internalScottRank_add_omega0`.
- *Code spaces* (CountableStructureSpaces' Layers 0–2 and §4.1; `ModelTheory/RelationalConfiguration/`):
  `TauCeti.RelationalConfiguration L α`, compact Hausdorff, Polish and standard Borel for countable
  `α` and countably many relation symbols of each arity; `TauCeti.RelationalConfiguration.toStructure`
  and `TauCeti.RelationalConfiguration.ofStructure`, mutually inverse for relational `L`
  (`TauCeti.RelationalConfiguration.ofStructure_toStructure`,
  `TauCeti.RelationalConfiguration.toStructure_ofStructure`); the transport `Equiv.encodeVia e` along
  a bijection `e : M ≃ α` with `Equiv.nonempty_equiv_encodeVia` and `Equiv.realize_encodeVia`;
  `TauCeti.RelationalConfiguration.mk_le_continuum`; the model classes
  `TauCeti.RelationalConfiguration.modelsOf` with `TauCeti.RelationalConfiguration.mem_modelsOf`,
  `TauCeti.RelationalConfiguration.measurableSet_modelsOf` (countable carrier and index type, any
  relational `L`), `TauCeti.RelationalConfiguration.standardBorelSpace_modelsOf` and
  `FirstOrder.Language.Equiv.mem_modelsOf_iff` (invariance across carriers); isomorphism
  `TauCeti.RelationalConfiguration.isoSetoid L α` with `TauCeti.RelationalConfiguration.isoSetoid_apply`,
  the action `TauCeti.RelationalConfiguration.instMulActionPerm` of `Equiv.Perm α`,
  `TauCeti.RelationalConfiguration.isoSetoid_eq_orbitRel`,
  `TauCeti.RelationalConfiguration.isoSetoid_iff_exists_perm_smul_eq`,
  `TauCeti.RelationalConfiguration.IsomorphismInvariant` with
  `TauCeti.RelationalConfiguration.isomorphismInvariant_iff_isInvariantBlock`,
  `TauCeti.RelationalConfiguration.analyticSet_iUnion_smul` (countably many relation symbols of each
  arity, countable carrier), `TauCeti.RelationalConfiguration.measurableSet_setOf_isoSetoid` (finite
  carrier); back-and-forth levels `TauCeti.RelationalConfiguration.bfEquivSetoid L α β` with
  `TauCeti.RelationalConfiguration.bfEquivSetoid_apply`,
  `TauCeti.RelationalConfiguration.measurableSet_setOf_bfEquivSetoid` (`β < ω₁`, countable carrier,
  countably many relation symbols of each arity), `TauCeti.RelationalConfiguration.isoSetoid_le_bfEquivSetoid`,
  `TauCeti.RelationalConfiguration.isoSetoid_iff_forall_bfEquivSetoid`; language maps on codes
  `FirstOrder.Language.LHom.reductConfiguration` with
  `FirstOrder.Language.LHom.toStructure_reductConfiguration`,
  `FirstOrder.Language.LEquiv.onConfiguration` with
  `FirstOrder.Language.LEquiv.isoSetoid_onConfiguration_iff` and
  `FirstOrder.Language.LEquiv.image_onConfiguration_modelsOf`.
- *Antichains and Silver's theorem* (BorelEquivalenceRelations §0.5 and §4.2–§4.3;
  `SetTheory/Descriptive/`, `Data/Set/Countable.lean`): `Setoid.HasPerfectAntichainOn`,
  `Setoid.HasCantorAntichainOn`, `Setoid.IsThinOn`, with `Setoid.HasPerfectAntichainOn.mono`,
  `Setoid.HasPerfectAntichainOn.hasCantorAntichainOn` and
  `Setoid.hasCantorAntichainOn_iff_hasPerfectAntichainOn` (completely metrizable ambient space),
  `Setoid.isThinOn_iff_not_hasCantorAntichainOn` (the same),
  `Setoid.HasCantorAntichainOn.continuum_le_mk_quotient`,
  `Setoid.HasCantorAntichainOn.continuum_le_mk_quotient_comap`,
  `Setoid.HasCantorAntichainOn.mono_relation`, `Setoid.hasCantorAntichainOn_image_iff` and
  `Setoid.isThinOn_image_iff` (transport along a measurable embedding of Polish spaces preserving and
  reflecting the relations), and `TauCeti.exists_countable_exceptions_of_splits`; the relative form of
  Silver's theorem `Setoid.countable_or_hasCantorAntichainOn_of_measurableSet` (for a Polish `X`, a
  Borel `A`, a setoid `R` on `X` and a Borel setoid `F` on `A` coarser than `R`, `Quotient F` is
  countable or `R.HasCantorAntichainOn A`) and the cardinality form
  `Setoid.mk_quotient_le_aleph0_or_eq_continuum` (on a standard Borel space, a Borel equivalence
  relation has at most `ℵ₀` or exactly `𝔠` classes); `Setoid.exists_invariant_measurableSet_separating`
  (`SetTheory/Descriptive/InvariantSeparation.lean`, the invariant Borel separating set behind
  López–Escobar in separation form).
- *Language maps, theories, small presentation and Morleyization* (InfinitaryModelExistence §0.1,
  §0.3, §1.1–§1.2 and Layer 5; `ModelTheory/Infinitary/`, `ModelTheory/ModelExistence/`):
  `FirstOrder.Language.LHom.onBoundedFormulaInf` and `FirstOrder.Language.LHom.realize_onBoundedFormulaInf`
  (realization is preserved when `g.IsExpansionOn M`); `FirstOrder.Language.Fragment`,
  `FirstOrder.Language.Fragment.generated`, `FirstOrder.Language.Fragment.generated_countable`;
  `FirstOrder.Language.Theoryω.conjunction` with `FirstOrder.Language.Theoryω.realize_conjunction_iff`;
  `FirstOrder.Language.smallPresentation`, `FirstOrder.Language.smallPresentationEquiv` and
  `FirstOrder.Language.realize_smallPresentation` (countably many function and relation symbols);
  `FirstOrder.Language.morleyize`, `FirstOrder.Language.lhomMorleyize`,
  `FirstOrder.Language.morleyExpansion`, `FirstOrder.Language.isRelational_morleyize`,
  `FirstOrder.Language.countable_relations_morleyize` (for countable `Φ`) and
  `FirstOrder.Language.nonempty_morleyEquiv_iff`. Tau Ceti's `FirstOrder.Language.infinitaryType` is
  the full Lω₁ω type, not the fragment-relative one of §4.5.
- *Counting* (this roadmap's Layers 0, 1, 4 and 5; `ModelTheory/Counting/`,
  `ModelTheory/RelationalConfiguration/LevelSentence.lean`, `ModelTheory/RelationalConfiguration/BackAndForth.lean`,
  `ModelTheory/BackAndForth/ExtensionSpectrum.lean`, `ModelTheory/Infinitary/Infinite.lean`,
  `SetTheory/Cardinal/AlephOne.lean`, `Data/Setoid/`): `TauCeti.RelationalConfiguration.isoSetoidOn`
  with `TauCeti.RelationalConfiguration.isoSetoidOn_apply`, `TauCeti.CountableModelClasses`,
  `TauCeti.countableModelCount` with `TauCeti.countableModelCount_eq_add_sum`,
  `TauCeti.countableModelCount_le_add_aleph0_mul`, `TauCeti.countableModelCount_le_aleph0_iff`,
  `TauCeti.countableModelCount_le_of_subset` (inclusion of the model classes on `ℕ` and on each
  `Fin n`), `TauCeti.mk_quotient_isoSetoidOn_nat_le_countableModelCount` and
  `TauCeti.countableModelCount_le_continuum` (countably many relation symbols of each arity);
  `TauCeti.classOf` with `TauCeti.classOf_eq_classOf_iff` (for `M : Type w`, `N : Type w'`, equal
  classes iff `Nonempty (M ≃[L] N)`), `TauCeti.classOf_surjective` (every class is the class of a
  model in every universe) and the tier lemmas `TauCeti.exists_classOf_eq_inl_iff` (exactly for
  infinite `M`) and `TauCeti.exists_classOf_eq_inr_iff` (exactly when `M` has `n` elements);
  `TauCeti.HasPerfectlyManyCountableModels` with `TauCeti.hasPerfectlyManyCountableModels_iff`,
  `TauCeti.HasPerfectlyManyCountableModels.of_nat`, `TauCeti.HasPerfectlyManyCountableModels.of_fin`
  and `TauCeti.HasPerfectlyManyCountableModels.countableModelCount_eq` (countably many relation
  symbols of each arity); `FirstOrder.Language.infiniteSentence` with
  `FirstOrder.Language.realize_infiniteSentence_iff`;
  `FirstOrder.Language.LEquiv.lift_countableModelCount_onBoundedFormulaInf` (equality after
  `Cardinal.lift`), `FirstOrder.Language.LEquiv.hasPerfectlyManyCountableModels_onBoundedFormulaInf_iff`
  and `TauCeti.exists_language_zero_countableModelCount`;
  `TauCeti.RelationalConfiguration.bfEquivSetoidOn` with
  `TauCeti.RelationalConfiguration.bfEquivSetoidOn_anti`,
  `TauCeti.RelationalConfiguration.isoSetoidOn_le_bfEquivSetoidOn`,
  `TauCeti.RelationalConfiguration.mk_quotient_bfEquivSetoidOn_le` and
  `TauCeti.RelationalConfiguration.measurableSet_setOf_bfEquivSetoidOn`;
  `TauCeti.RelationalConfiguration.scottSentenceAtLevel` with
  `TauCeti.RelationalConfiguration.modelsOf_scottSentenceAtLevel`; `TauCeti.IsIsolatingRank` with
  `TauCeti.IsIsolatingRank.isolates_of_le`, `TauCeti.IsIsolatingRank.of_le`,
  `TauCeti.IsIsolatingRank.exists_unbounded_of_not_countable`,
  `TauCeti.IsIsolatingRank.comap_isoSetoid_eq_bfEquivSetoid`,
  `TauCeti.IsIsolatingRank.exists_injective_rank_fiber`,
  `TauCeti.IsIsolatingRank.mk_isoClasses_le_aleph_one`,
  `TauCeti.IsIsolatingRank.exists_comap_isoSetoid_eq_bfEquivSetoid`, `TauCeti.rankOnIsoClasses`,
  `TauCeti.rankOnIsoClasses_lt_omega_one`, `TauCeti.exists_rank_bound_of_countable_isoClasses` (any
  invariant map below `ω₁`), `TauCeti.isIsolatingRank_scottHeight` and `TauCeti.exists_isIsolatingRank`
  (no countability of `L`), `TauCeti.mk_isoClasses_le_aleph_one_of_countable_levels` (no
  countability of `L`); the countable-ordinal bookkeeping `TauCeti.mk_le_aleph_one_of_countable_preimage`,
  `TauCeti.mk_eq_aleph_one_of_countable_preimage`, `TauCeti.countable_iff_exists_lt_omega_one_forall_lt`
  and `Set.Countable.exists_lt_omega_one_forall_lt`; `Setoid.IsolatedBy` with
  `Setoid.IsolatedBy.countable_quotient` and `Setoid.IsolatedBy.lift_mk_quotient_le`;
  `Setoid.countable_quotient_comap_val_iff`; the level-by-level transfer `TauCeti.bfTupleSetoid`,
  `TauCeti.bfExtensionSpectra`, `TauCeti.bfTupleSetoid_add_one_iff`,
  `TauCeti.countable_quotient_bfTupleSetoid_add_one`, `TauCeti.mk_quotient_bfTupleSetoid_add_one_le_of_le`,
  `TauCeti.BFSmall`, `TauCeti.BFSmall.countable_quotient` and `TauCeti.BFSmall.mk_isoClasses_le_aleph_one`;
  `TauCeti.BFScattered` with `TauCeti.bfScattered_iff_countable_image`, `TauCeti.BFScattered.mono`,
  `TauCeti.BFScattered.of_countable_isoClasses` and `TauCeti.bfScattered_of_observation`;
  `TauCeti.IsIsolatingRank.countable_rankOnIsoClasses_preimage`,
  `TauCeti.IsIsolatingRank.countable_isoClasses_iff_bounded`,
  `TauCeti.IsIsolatingRank.mk_isoClasses_eq_aleph_one` and `TauCeti.IsIsolatingRank.exists_rank_bound_iff`;
  and the limit model `TauCeti.RelationalConfiguration.exists_limit_of_bfEquiv_chain` (levels in any
  ordinal universe).

Tau Ceti states its counting results for the quotient of isomorphism restricted to a set `K` of
codes, `Quotient ((isoSetoid L ℕ).comap Subtype.val)`; Convention 5 relates it to the image of `K`.
Tau Ceti assumes countably many relation symbols of each arity where this roadmap assumes
`[Countable (Σ l, L.Relations l)]`; the two are equivalent (Convention 1).

### From TauCetiRoadmap.CountableStructureSpaces

Statements consumed as that roadmap's targets, exactly as stated there:

- Layer 2: `isomorphismInvariant_modelsOf`, codes isomorphic to a code of a model are codes of
  models (it follows from Tau Ceti's `FirstOrder.Language.Equiv.mem_modelsOf_iff`).
- §1.2: for every language, the saturation of an analytic set of codes under the logic action is
  analytic (Tau Ceti's `TauCeti.RelationalConfiguration.analyticSet_iUnion_smul` is the case of
  countably many relation symbols); used by continuous Cantor recovery in §4.4.
- §4.4: `exists_uniform_bfSeparation`, an analytic set of pairs of codes containing no isomorphic pair
  is separated at one level `β < ω₁`; used in §4.1, §4.3 and §5.8.
- §6.1: `exists_sentence_separating`, López–Escobar in separation form: for every relational `L` and
  analytic `A`, `B` with `B` action invariant and `A`, `B` disjoint, some sentence `θ` has
  `A ⊆ modelsOf θ` and `modelsOf θ` disjoint from `B`; used in §4.4.

### From TauCetiRoadmap.InfinitaryModelExistence

- §4.1: `fragmentType F M a`, the members of the fragment `F` of arity `n` realized by
  `a : Fin n → M`; the slice `Fragment.slice F n` and the realized truth assignment `F.slice n → Prop`,
  transported along isomorphisms. Used in §4.5.

### From TauCetiRoadmap.BorelEquivalenceRelations

Its consumer interface (§4.3) is in Tau Ceti and is listed above under From Tau Ceti; nothing else of
that roadmap is consumed.

## References

- M. Morley, "The number of countable models", *J. Symbolic Logic* 35 (1970), 14–18.
- J. H. Silver, "Counting the number of equivalence classes of Borel and coanalytic equivalence
  relations", *Ann. Math. Logic* 18 (1980), 1–28.
- R. L. Vaught, "Denumerable models of complete theories", in *Infinitistic Methods*, Warsaw, 1961,
  303–321: the origin of the conjecture, for complete first-order theories.
- J. R. Steel, "On Vaught's conjecture", in *Cabal Seminar 76–77*, Lecture Notes in Mathematics 689,
  Springer, 1978, 193–208: the perfect-set ("strong") form and minimal counterexamples.
- J. Baldwin, S. Friedman, M. Koerwien and M. C. Laskowski, "Three red herrings around Vaught's
  conjecture", *Trans. Amer. Math. Soc.* 368 (2016), 3673–3694: the "absolute" form. Their Theorem
  3.3 and Lemma 3.4 relate Morley's scattered sentences to those lacking perfectly many models:
  Theorem 3.3, (a)⇔(b), says that a sentence has no perfect set of countable models iff it has
  countably many `α`-equivalence classes of models for each countable `α` (§4.2), and Lemma 3.4 that
  such a sentence realizes countably many `F`-types for every countable fragment `F` containing it
  (§4.5). Page numbers refer to the
  [preprint of 17 September 2014](https://www.math.umd.edu/~laskow/Pubs/redherringsaug2814.pdf) on
  Laskowski's page: Theorem 3.3 on p. 12, Lemma 3.4 on p. 13.
- U. Andrews, I. Goldbring, S. Hachtman, H. J. Keisler and D. Marker,
  [Scattered sentences have few separable randomizations](https://people.math.wisc.edu/~hkeisler/scatteredfew13.pdf):
  §1–§2 state the three forms (Vaught's, the absolute form "if `φ` is scattered then countably many",
  and Steel's strong form "uncountably many implies perfectly many"), note that the cardinal form is
  trivial under CH and equivalent to the others when CH fails, and record (their Fact 2.2, citing
  Baldwin et al., Lemma 3.4) that scattered means not perfectly many. This matches §4.2, §4.5 and
  Layer 5.
- V. Harnik and M. Makkai, "A tree argument in infinitary model theory", *Proc. Amer. Math. Soc.* 67
  (1977), 309–314: minimal counterexamples.
- E. G. K. Lopez-Escobar, "An interpolation theorem for denumerably long formulas", *Fund. Math.* 57
  (1965), 253–272.
- D. Marker, *Lectures on Infinitary Model Theory*, Cambridge University Press, 2016: the chapters "The
  space of countable models" (pp. 29–38) and "Vaught counterexamples" (pp. 83–96): scattered
  sentences and their equivalent forms (§4.2, §4.4, §4.5), Borel fragment types, and López–Escobar's
  theorem.
- H. Becker and A. S. Kechris, *The Descriptive Set Theory of Polish Group Actions*, LMS Lecture Note
  Series 232, Cambridge University Press, 1996, chapter "Model theory and the Vaught conjecture"
  (pp. 82–97).
- S. Gao, *Invariant Descriptive Set Theory*, CRC Press, 2009: Borel complete invariants and
  separating families (§4.4), invariant separation, and López–Escobar's theorem.
- A. S. Kechris, *Classical Descriptive Set Theory*, Graduate Texts in Mathematics 156, Springer,
  1995, §31, "Analytic well-founded relations" (the boundedness theorem behind uniform separation).
- A. Montalbán, *Computable Structure Theory: Beyond the Arithmetic*, Part 2,
  [draft](https://math.berkeley.edu/~antonio/CSTpart2.pdf), Theorem XI.3 (p. 207: a bound on the Scott
  rank makes isomorphism Borel, §2.1) and Chapter XII: §XII.1 (Morley's theorem via
  Silver; scattered and unbounded sentences, Definition XII.1) and §XII.2 (Definition XII.4,
  minimally unbounded sentences; Lemma XII.5, level classes are sentences; Lemma XII.6, the limit
  model, with hypothesis `≡_{α_i + 3}` in its block-move convention; Theorem XII.7, pp. 219–220, the
  reduction to a minimally unbounded counterexample; Lemma XII.8, the club lemma), cited from the
  draft compiled on 22 April 2025. Lemma XII.8 (p. 220) assumes only that `Θ` is minimally unbounded,
  but its proof (p. 221) uses that the models of `Θ` have countably many `≡_β`-classes; the targets
  here assume back-and-forth scatteredness.
- `cameronfreer/infinitary-logic`, Lean 4 formalization, commit `518a366`.

<!--tauceti-status:v1 {"roadmap":"InfinitaryLogic","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"1810b7fabae160c3638aef4a092a858f25ee8a5f9beb47e70d6e78464813370c","roadmap":"InfinitaryLogic","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: InfinitaryLogic

This file documents the status of the InfinitaryLogic roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is complete: Scott's isomorphism theorem is proved with no counting hypothesis, all four layers have every milestone the README names, and every worked example is now in. The summit has also gone past v1, since it now covers countable languages with function symbols, not only relational ones.

### Named results

- **Scott's isomorphism theorem** — in a countable language, every countable structure has an Lω₁ω sentence that holds in a countable structure exactly when that structure is isomorphic to it ([`scott_isomorphism`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Scott/Isomorphism.html#TauCeti.scott_isomorphism)). Function symbols are handled by passing to the relational graph language and translating the Scott sentence back (TauCeti#28109).
- **Karp's theorem** — relational structures of any cardinality are potentially isomorphic exactly when they are L∞ω-equivalent ([`karp_theorem`](https://taucetiproject.org/docs/TauCeti/ModelTheory/BackAndForth/Karp.html#TauCeti.karp_theorem)). For countable structures this becomes isomorphism exactly when they agree on Lω₁ω sentences ([`countable_infEquivAt_nat_iff_iso`](https://taucetiproject.org/docs/TauCeti/ModelTheory/BackAndForth/Karp.html#TauCeti.countable_infEquivAt_nat_iff_iso)).
- **The characteristic property of Scott formulas** — in a structure of any cardinality, a tuple satisfies the level-α Scott formula of a tuple from a countable structure exactly when the two are back-and-forth equivalent at level α ([`realize_scottFormula_iff_bfEquiv`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Scott/Formula.html#TauCeti.realize_scottFormula_iff_bfEquiv)).
- **Countable Scott rank** — the internal Scott rank of a countable structure is below ω₁ ([`internalScottRank_lt_omega_one`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Scott/Rank.html#TauCeti.internalScottRank_lt_omega_one)), and its stabilization ordinal is the supremum of the orbit ranks ([`selfStabilizationOrdinal_eq_iSup_orbitRank`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Scott/Rank.html#TauCeti.selfStabilizationOrdinal_eq_iSup_orbitRank)).
- **Well-order types are Lω₁ω-definable but not first-order axiomatizable** — every countable order has an [Lω₁ω sentence](https://taucetiproject.org/docs/TauCeti/ModelTheory/Scott/WellOrder.html#TauCeti.exists_sentenceω_realize_iff_nonempty_orderIso) true in exactly the countable orders isomorphic to it, while for an infinite well-order [no first-order theory](https://taucetiproject.org/docs/TauCeti/ModelTheory/Order.html#TauCeti.not_exists_theory_model_iff_nonempty_orderIso) has exactly its copies as countable models.

### Notable definitions and infrastructure

- **The fixed-carrier infinitary syntax** [`BoundedFormulaInf`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Syntax.html#FirstOrder.Language.BoundedFormulaInf), with Lω₁ω as carrier ℕ. Carrier codings and [`reindex`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Reindex.html#FirstOrder.Language.BoundedFormulaInf.reindex) let conjunctions over a structure's elements be written at any coded carrier, which is how Karp and the Scott formulas are stated.
- **Ordinal back-and-forth equivalence** [`BFEquiv`](https://taucetiproject.org/docs/TauCeti/ModelTheory/BackAndForth/Equivalence.html#TauCeti.BFEquiv) and [`PotentialIso`](https://taucetiproject.org/docs/TauCeti/ModelTheory/BackAndForth/PotentialIso.html#TauCeti.PotentialIso). In countable relational structures, tuples equivalent at every level are [exactly those in one automorphism orbit](https://taucetiproject.org/docs/TauCeti/ModelTheory/BackAndForth/AllLevels.html#TauCeti.bfEquiv_all_iff_exists_equiv_comp_eq), and potentially isomorphic countably generated structures are [isomorphic](https://taucetiproject.org/docs/TauCeti/ModelTheory/BackAndForth/Countable.html#TauCeti.PotentialIso.nonempty_equiv_of_cg).
- **The graph language**: each function symbol becomes a relation for its graph, and structures are [isomorphic exactly when their graph expansions are](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/GraphTranslation/Language.html#FirstOrder.Language.nonempty_equiv_graphExpansion_iff). This is what carries relational results to languages with function symbols.

### Roadmap coverage

All four layers are done: the infinitary syntax with its free-variable support (Layer 0), back-and-forth, potential isomorphism and Karp (Layer 1), internal stabilization below ω₁ (Layer 2), and Scott formulas, sentences, rank and the isomorphism theorem (Layer 3). Every worked example is present: finite structures and the unary-predicates regression, pure sets, dense linear orders at ℵ₀ and ℵ₁, equivalence relations, the Rado graph and a rigid graph, ℤ versus ℤ + ℤ (now also as finite Ehrenfeucht–Fraïssé games Duplicator wins without a coherent infinite strategy), and the fixed well-order type.

## The frontier

- **Alignment with Mathlib's infinitary syntax** — the README asks the local syntax to follow the names and shapes of the open mathlib4#42758 and to be replaced by imports if Mathlib takes it up. The supplied material does not show whether that has happened.
- **Relationalization beyond the Scott theorem** — the README reserved function and constant symbols for a separate roadmap. Scott's isomorphism theorem already reaches them through the graph language; whether Karp's theorem and the Scott-rank results should be carried across the same way is not settled here.
- **Out-of-scope successors** — López–Escobar, Barwise compactness, model existence, and external Scott-rank conventions belong to other roadmaps.

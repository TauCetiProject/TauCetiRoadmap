<!--tauceti-status:v1 {"roadmap":"CountableModelCounting","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe","ts":"2026-11-09T11:59:37+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"the bounded-rank dichotomy itself, witnessed and cardinal, and its Scott-height and internal-rank forms","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"sentence spectra and relative Lopez-Escobar (4e), fragment spectra (4f), thin-rank analyses (4h)","state":"partial"},{"id":"Layer 5","remaining":"scattered and rank forms, first-order conjecture, minimally uncountable sentences, saturation and splitting tree","state":"partial"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"6679eb81015c624a166960c00c5c97fe71457c4216c4fdcc728eea03a28e5e63","roadmap":"CountableModelCounting","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe"}-->
# Status: CountableModelCounting

This file documents the status of the CountableModelCounting roadmap up until `d92acc5` (2026-11-09T11:59:37+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is reached. Morley's theorem is proved in both its witnessed and cardinal forms, on top of a complete counting layer and a complete stratification layer. The bounded-rank dichotomy, the scattered-class criteria and the Vaught layer are partial. The rank-ω witness of Layer 6 has not begun.

### Named results

- **Morley's theorem** — a sentence of Lω₁ω in a countable relational language has at most ℵ₁ countable models up to isomorphism, finite ones included, or a perfect set of pairwise non-isomorphic ones, and so has at most ℵ₁ or exactly 𝔠. CH is not assumed. It is `morley_countableModelCount_le_aleph_one_or_hasPerfectlyMany`, with the cardinal corollary `morley_countableModelCount`. The proof routes Silver's theorem through scattered sets rather than through the bounded-rank dichotomy.
- **The stratification bound** — if every countable back-and-forth level of a class of codes has countably many classes, the class meets at most ℵ₁ isomorphism classes ([`mk_isoClasses_le_aleph_one_of_countable_levels`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Stratification.html#TauCeti.mk_isoClasses_le_aleph_one_of_countable_levels)).
- **Anatomy of a Vaught counterexample** — a sentence fails the perfect-set dichotomy exactly when it has ℵ₁ countable models and no perfect set of them ([`not_hasVaughtDichotomy_iff`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Vaught.html#TauCeti.not_hasVaughtDichotomy_iff)).
- **The CH and ¬CH reformulations** — CH proves the cardinal Vaught conjecture ([`cardinalVaughtConjecture_of_aleph_one_eq_continuum`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Vaught.html#TauCeti.cardinalVaughtConjecture_of_aleph_one_eq_continuum)). Under ℵ₁ < 𝔠 the cardinal and perfect-set conjectures are equivalent ([`cardinalVaughtConjecture_iff_vaughtConjecture`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Vaught.html#TauCeti.cardinalVaughtConjecture_iff_vaughtConjecture)).
- **The limit of a back-and-forth chain** — codes that are pairwise equivalent at levels αᵢ + ω along a chain have a single limit code equivalent to each at level αᵢ. This is step 3 of the Harnik–Makkai reduction ([`exists_limit_of_bfEquiv_chain`](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/BackAndForth.html#TauCeti.RelationalConfiguration.exists_limit_of_bfEquiv_chain)).

### Notable definitions and infrastructure

- **The count of countable models** ([`countableModelCount`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Classes.html#TauCeti.countableModelCount)) counts the models on ℕ and on every `Fin n`. It is tied to models in every universe by `classOf`, and invariant under language equivalence, which moves every sentence to a [presentation in universe 0](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/LanguageEquiv.html#TauCeti.exists_language_zero_countableModelCount). That is what lets the conjecture-level statements quantify over `Language.{0, 0}`.
- **Isolating ranks** ([`IsIsolatingRank`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Stratification.html#TauCeti.IsIsolatingRank)) are the abstract rank interface that every counting argument consumes. The external Scott height is [the canonical instance](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Stratification.html#TauCeti.isIsolatingRank_scottHeight).
- **Back-and-forth scattered sets** ([`BFScattered`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Scattered/Basic.html#TauCeti.BFScattered)) have countably many classes at every countable level. They are shown to be thin, and thin model classes are shown to be scattered. This equivalence is the bridge from Morley's theorem to the scattered reformulation of Vaught's conjecture.

### Roadmap coverage

Layers 0, 1 and 3 are done. That covers the classes and count with finite tiers, the language transport and the worked examples. It also covers back-and-forth levels, level sentences, isolating ranks, countable-ordinal bookkeeping, the stratification bound and `BFSmall`. Finally it covers Morley's theorem, one-level Silver and thin sentences. Layer 2 is partial: a bounded isolating rank makes isomorphism Borel, but the dichotomy itself is not stated. Layer 4 is partial. Done are scatteredness, its thinness and counting consequences, thin iff scattered, concentration and Morleyization transport. Sentence spectra and relative López–Escobar (4e), fragment spectra (4f) and rank analyses (4h) are absent. Layer 5 is partial. The conjectures and their CH, ¬CH and infinite-model reformulations are done, as are steps 1 and 3 of Harnik–Makkai. The scattered and rank forms, the first-order conjecture, the universe transport of the conjecture, minimally uncountable sentences and the splitting tree remain. Layer 6 is untouched.

## The frontier

- **The bounded-rank dichotomy** — the Borel-isomorphism step is in place, so what remains is applying Silver at the tier ℕ, combining with the finite tiers, and deriving the cardinal, external and internal Scott-rank forms.
- **The scattered and rank forms of Vaught's conjecture** — `vaughtConjecture_iff_bfScattered` and the rank form should now follow from thin iff scattered and the counting lemmas for scattered classes. The first-order conjecture and `vaughtConjecture_iff_forall_universe` are also within reach of the existing transport.
- **Saturation and the splitting tree** — `exists_bfLevel_saturated_modelsOf` (from uniform separation) and step 4 of Harnik–Makkai. With the limit model already proved, they lead to `vaughtConjecture_iff_forall_not_minimallyUncountableOn`. Minimally uncountable sentences themselves are not yet defined.
- **Sentence and fragment spectra** — Layer 4e–4f: relative López–Escobar, Cantor recovery, and thinness via countable spectra. Layer 4h's thin-rank analyses are also open.
- **The rank-ω witness** — the row-assembly construction and `not_isIsolatingRank_internalScottRank`. This is self-contained, and nothing for it exists yet.

<!--tauceti-status:v1 {"roadmap":"CountableModelCounting","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f","ts":"2026-11-18T04:36:49Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"4e beyond the truth sequence (relative Lopez-Escobar, Cantor recovery, sentence spectra, Borel observables), fragment spectra (4f), rank analyses (4h)","state":"partial"},{"id":"Layer 5","remaining":"minimally uncountable and minimally unbounded sentences, sentence saturation, the splitting tree and the Harnik-Makkai reduction","state":"partial"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"0ba48afd1d3e77327e387d03fed69db5f5069c72829eeda9137d6ab9d8349191","roadmap":"CountableModelCounting","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f"}-->
# Status: CountableModelCounting

This file documents the status of the CountableModelCounting roadmap up until `bf5b062` (2026-11-18T04:36:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is reached: Morley's theorem is proved in witnessed and cardinal form, and Layers 0 through 3, including the bounded-rank dichotomy, are now complete. The scattered-class lane and the Vaught layer are partial, with sentence and fragment spectra and minimally uncountable sentences still missing. The rank-ω witness of Layer 6 has not begun.

### Named results

- **Morley's theorem** — a sentence of Lω₁ω in a countable relational language has at most ℵ₁ countable models up to isomorphism, finite ones included, or a perfect set of pairwise non-isomorphic ones, with no use of CH ([`morley_countableModelCount_le_aleph_one_or_hasPerfectlyMany`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Morley.html#TauCeti.morley_countableModelCount_le_aleph_one_or_hasPerfectlyMany); cardinal form [`morley_countableModelCount`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Morley.html#TauCeti.morley_countableModelCount)).
- **The bounded-rank dichotomy** — if an isolating rank, such as the Scott height or the internal Scott rank, is bounded below ω₁ on the models of φ, then φ has at most ℵ₀ countable models or a perfect set of them ([`countableModelCount_le_aleph0_or_hasPerfectlyMany_of_bounded`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/BoundedRank.html#TauCeti.countableModelCount_le_aleph0_or_hasPerfectlyMany_of_bounded)); conversely, countably many models bound every isolating rank.
- **Thin sentences are exactly the scattered ones** — with countably many relation symbols, a sentence has no perfect set of non-isomorphic models on ℕ iff its models meet countably many back-and-forth classes at every countable level ([`bfScattered_modelsOf_iff_isThinOnNatModels`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Scattered/Thin.html#TauCeti.bfScattered_modelsOf_iff_isThinOnNatModels)).
- **The scattered and rank forms of Vaught's conjecture** — unconditionally, the conjecture holds iff every sentence with scattered models on ℕ has countably many of them ([`vaughtConjecture_iff_bfScattered`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Scattered/Vaught.html#TauCeti.vaughtConjecture_iff_bfScattered)), iff every isolating rank is bounded on thin sentences ([`vaughtConjecture_iff_bounded_isolatingRank`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Scattered/Vaught.html#TauCeti.vaughtConjecture_iff_bounded_isolatingRank)).
- **Anatomy of a Vaught counterexample** — a sentence fails the perfect-set dichotomy exactly when it has ℵ₁ countable models and no perfect set of them ([`not_hasVaughtDichotomy_iff`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Vaught.html#TauCeti.not_hasVaughtDichotomy_iff)).

### Notable definitions and infrastructure

- **The count of countable models** ([`countableModelCount`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Classes.html#TauCeti.countableModelCount)) counts models on ℕ and on every `Fin n`, and is invariant under language equivalence, so the conjectures can quantify over languages in universe 0.
- **Isolating ranks** ([`IsIsolatingRank`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Counting/Stratification.html#TauCeti.IsIsolatingRank)) are the abstract rank interface every counting argument consumes; the Scott height is the canonical instance, and boundedness on a scattered class does not depend on the choice.
- **Boundedness of tree ranks** — the [Lusin–Sierpiński/Kunen–Martin theorem](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/Tree.html#MeasureTheory.AnalyticSet.exists_treeRank_lt_omega_one) and the [uniform back-and-forth separation](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/Separation.html#TauCeti.RelationalConfiguration.exists_uniform_bfSeparation) it yields: a single countable level separates the two sides of an analytic split. This drives both scattered-implies-thin and the saturation of analytic cuts.

### Roadmap coverage

Layers 0, 1, 2 and 3 are done: classes and counts with finite tiers, back-and-forth levels and the stratification bound, the bounded-rank dichotomy in all its forms with the equivalence-relation acceptance check, and Morley's theorem with thin sentences. Layer 4 is partial: scatteredness, its counting consequences, thin iff scattered, concentration and Morleyization transport are done, but of 4e only the truth sequence exists; relative López–Escobar, Cantor recovery, sentence spectra and Borel observables are absent, as are fragment spectra (4f) and rank analyses (4h). Layer 5 is partial: the conjectures, the CH and ¬CH reformulations, the infinite-model reduction, the scattered and rank forms, the counterexample profile, the first-order conjecture with universe transport, and Harnik–Makkai steps 1 and 3 are in place, together with rank boundedness and the generic large-class engine. Minimally uncountable and minimally unbounded sentences, sentence-level saturation, the splitting tree and the reduction remain. Layer 6 is untouched.

## The frontier

- **Minimally uncountable sentences** — define `MinimallyUncountableOn` and `MinimallyUnboundedOn` and prove their characterisations via concentration and scatteredness; the large-class engine and rank boundedness they need are now in place.
- **Saturation of a sentence** — `exists_bfLevel_saturated_modelsOf`, Harnik–Makkai step 2, should follow directly from the existing [saturation of analytic splits](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/Separation.html#TauCeti.RelationalConfiguration.exists_bfLevel_saturated_of_analyticSet).
- **The splitting tree and the Harnik–Makkai reduction** — steps 4 to 6, ending in `vaughtConjecture_iff_forall_not_minimallyUncountableOn`; the limit of a back-and-forth chain (step 3) is already proved, and the rest waits on the two items above.
- **Sentence and fragment spectra** — Layer 4e beyond the truth sequence (relative López–Escobar, Cantor recovery, thin iff countable sentence spectra, single-sentence splits), then 4f and the rank analyses of 4h.
- **The rank-ω witness** — the row-assembly construction and the proof that internal Scott rank is not isolating; self-contained, and nothing for it exists yet.

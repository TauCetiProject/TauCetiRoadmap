<!--tauceti-status:v1 {"roadmap":"BorelEquivalenceRelations","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"73ecc27eaaa1ede6e2f99d39f0a8e3c1ab31ee7b7de6260ca6ca4f111b36d0a3","roadmap":"BorelEquivalenceRelations","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: BorelEquivalenceRelations

This file documents the status of the BorelEquivalenceRelations roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. Both summits, the G₀ dichotomy and Silver's theorem in all its forms, are proved. So are the two theorems the README and `Suggested.lean` still list as open: the perfect set theorem for analytic sets and the smoothness of closed equivalence relations. All eight worked examples, including the Vitali relation, now have counterparts in the source. What remains is outside the roadmap's own targets.

### Named results

- **The Kechris–Solecki–Todorcevic G₀ dichotomy** ([`SimpleGraph.g0_dichotomy`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/GZeroDichotomy.html#SimpleGraph.g0_dichotomy)) — a simple graph on a Polish space with analytic edge relation has either a measurable coloring by ℕ or a continuous homomorphism from G₀, and never both. An [oriented form](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/GZeroDichotomy.html#TauCeti.g0_dichotomy_oriented) covers arbitrary analytic relations.
- **Silver's theorem** (`Setoid.silver_dichotomy`) — a Borel equivalence relation on a Polish space has either countably many classes or a continuous Cantor antichain. The library also has the standard Borel, cardinality (at most ℵ₀ or exactly 𝔠 classes), relative and reducibility forms, assembled by Miller's [category route](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/Silver.html#Setoid.hasCantorAntichainOn_range_of_forall_gSGraph_adj).
- **The perfect set theorem for analytic sets** ([`MeasureTheory.AnalyticSet.exists_nat_bool_injection_of_not_countable`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/PerfectSet.html#MeasureTheory.AnalyticSet.exists_nat_bool_injection_of_not_countable)) — an uncountable analytic subset of a Hausdorff space contains a continuous injective image of Cantor space. It is derived from Silver's theorem, and it gives such a set [exactly 𝔠 points](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/PerfectSet.html#MeasureTheory.AnalyticSet.mk_eq_continuum_of_not_countable).
- **Closed equivalence relations are smooth** ([`Setoid.isSmooth_of_isClosed`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/ClosedEquivalence.html#Setoid.isSmooth_of_isClosed)) — on a Polish space, a closed relation has a Borel classification by Cantor space. The proof uses invariant Lusin separation.
- **E₀ and the Vitali relation are not smooth** ([`TauCeti.not_isSmooth_eZero`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/EZero.html#TauCeti.not_isSmooth_eZero), [`TauCeti.not_isSmooth_vitaliRel`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/Vitali.html#TauCeti.not_isSmooth_vitaliRel)) — both follow from generic ergodicity, which is proved in general for [topologically transitive countable group actions](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/GenericErgodicity.html#MulAction.isMeagre_or_mem_residual_of_orbitRel_invariant). The library also has the [easy half of Glimm–Effros](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/EZero.html#TauCeti.not_isSmooth_of_borelReducible_eZero): anything above E₀ is non-smooth.

### Notable definitions and infrastructure

- **Cantor antichains** ([`Setoid.HasCantorAntichainOn`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/Antichain.html#Setoid.HasCantorAntichainOn)) — this is the witness vocabulary shared by every dichotomy here. It agrees with perfect antichains on Polish spaces and yields exactly 𝔠 classes. CountableModelCounting consumes this interface.
- **Miller's ideals** ([`SetRel.IsSmallFamily`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/SmallFamily/Basic.html#SetRel.IsSmallFamily)) — these are σ-ideals of families of assignments. They stay non-small under amalgamation, vertex shrinking and witness extension, which are the moves of the fusion that proves the G₀ dichotomy.
- **Borel reducibility and smoothness** ([`Setoid.BorelReducible`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/BorelReducibility.html#Setoid.BorelReducible)) — smoothness is characterised as [countable separation of the quotient](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/BorelReducibility.html#Setoid.isSmooth_iff_countablySeparated). This is the bridge that the closed-relation theorem and both non-smoothness proofs cross.

### Roadmap coverage

Layers 0 through 5 are all done. Layer 0 is the Cantor-space, Gδ, analytic-set, Borel-graph and perfect-set infrastructure. Layer 1 is Kuratowski–Ulam, Mycielski, Baire-measurable maps and the graphs G_S with Miller's lemma. Layer 2 is colorings, the Kechris–Solecki–Todorcevic lemma, invariant separation and Miller's ideals. Layer 3 is the G₀ dichotomy. Layer 4 is Silver in every listed form, and since the analytic perfect set theorem landed it is complete. Layer 5 is reducibility, smoothness and E₀, and since `isSmooth_of_isClosed` landed it is complete too. The rewritten README still describes those two theorems, and worked examples 3, 5 and 8, as missing. All of them are now in the source without `sorry`.

## The frontier

- **README and `Suggested.lean`** — the two remaining `sorry` statements are now Tau Ceti theorems with the same signatures. The "missing at the pin" list can be retired.
- **Handover to Mathlib** — Kuratowski–Ulam, the Gδ-subspace theorems and the Borel graph theorem are built here under the names of pending Mathlib proposals. They should give way to Mathlib's declarations when those land.
- **Downstream use** — the Layer 4 interface is ready for CountableModelCounting. The converse half of Glimm–Effros, the coanalytic form of Silver and Burgess's theorem are assigned to other roadmaps.

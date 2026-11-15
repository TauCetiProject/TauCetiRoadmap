<!--tauceti-status:v1 {"roadmap":"BorelEquivalenceRelations","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"444ed232022799d5c3ec650caf5e22ac1f247e862496f455a8bc15668fcb1e86","roadmap":"BorelEquivalenceRelations","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c"}-->
# Status: BorelEquivalenceRelations

This file documents the status of the BorelEquivalenceRelations roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Both summits are proved. The G₀ dichotomy and Silver's theorem, in all four of its forms, are in the library, along with the Borel-reducibility layer around E₀. Every layer's milestones are in the source without `sorry`. What remains is the Vitali-relation worked example and the eventual handover of a few shims to Mathlib.

### Named results

- **The Kechris–Solecki–Todorcevic G₀ dichotomy** ([`SimpleGraph.g0_dichotomy`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/GZeroDichotomy.html#SimpleGraph.g0_dichotomy)) — a simple graph on a Polish space with analytic edge relation has a measurable coloring by ℕ or a continuous homomorphism from G₀, and exactly one of the two. The [oriented form](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/GZeroDichotomy.html#TauCeti.g0_dichotomy_oriented) covers arbitrary analytic relations, with loops and asymmetry allowed.
- **Silver's theorem** (`Setoid.silver_dichotomy`) — a Borel equivalence relation on a Polish space has countably many classes or a continuous Cantor antichain. It is also proved in standard Borel, cardinality (at most ℵ₀ or exactly 𝔠 classes), relative and reducibility forms. It is assembled by Miller's [category route](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/Silver.html#Setoid.hasCantorAntichainOn_range_of_forall_gSGraph_adj) from the G₀ dichotomy, Kuratowski–Ulam and Mycielski.
- **The Kuratowski–Ulam theorem** ([`BaireMeasurableSet.eventually_eventually_left_iff_mem_residual`](https://taucetiproject.org/docs/TauCeti/Topology/Baire/KuratowskiUlam.html#BaireMeasurableSet.eventually_eventually_left_iff_mem_residual)) — a set with the Baire property in a product is comeagre exactly when comeagrely many of its sections are. It is stated in the shapes of the Mathlib proposal, with the meagre-sections forms that Silver uses.
- **E₀ is not smooth** ([`TauCeti.not_isSmooth_eZero`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/EZero.html#TauCeti.not_isSmooth_eZero)) — proved from [generic ergodicity](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/EZero.html#TauCeti.isMeagre_or_mem_residual_of_eZero_invariant). This gives the [easy half of Glimm–Effros](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/EZero.html#TauCeti.not_isSmooth_of_borelReducible_eZero): anything above E₀ is non-smooth.
- **The perfect set theorem for Borel sets** ([`MeasurableSet.exists_nat_bool_injection_of_not_countable`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Constructions/Polish/Perfect.html#MeasurableSet.exists_nat_bool_injection_of_not_countable)) — an uncountable Borel subset of a Polish space contains a continuous injective image of Cantor space. The analytic version is derived from Silver's theorem, as the roadmap intends.

### Notable definitions and infrastructure

- **Miller's ideals** ([`SetRel.IsSmallFamily`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/SmallFamily/Basic.html#SetRel.IsSmallFamily)) — a family of assignments is small when countably many Borel independent sets capture it. These families form a σ-ideal, stay non-small under [amalgamation across a fresh edge](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/SmallFamily/Basic.html#SetRel.not_isSmallFamily_comb_cross), and survive vertex shrinking and witness extension, which are the moves of the fusion proving the G₀ dichotomy.
- **Cantor antichains** ([`Setoid.HasCantorAntichainOn`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/Antichain.html#Setoid.HasCantorAntichainOn)) — the witness vocabulary shared by every dichotomy here. It agrees with perfect antichains on Polish spaces, transports along measurable embeddings, and yields exactly 𝔠 classes. This is the interface CountableModelCounting consumes.
- **Borel reducibility and smoothness** ([`Setoid.BorelReducible`](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/BorelReducibility.html#Setoid.BorelReducible)) — smoothness is characterised as [countable separation of the quotient](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/BorelReducibility.html#Setoid.isSmooth_iff_countablySeparated). Closed relations are smooth through invariant Lusin separation. The [trichotomy](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/NormalForms.html#Setoid.borelReducibility_trichotomy) places every Borel equivalence relation at equality on some `Fin n`, at equality on ℕ, or above equality on Cantor space.

### Roadmap coverage

Layers 0 through 5 are all done. Layer 0 covers the Cantor-space instances and word cylinders, Gδ subspaces, analytic-set closure and saturation, the Borel graph theorem, the perfect set theorem, antichains and countable splits. Layer 1 covers Kuratowski–Ulam, Mycielski, continuity of Baire-measurable maps on comeagre sets, and the graphs G_S with Miller's lemma. Layer 2 covers colorings, the Kechris–Solecki–Todorcevic lemma, invariant separation and Miller's ideals. Layer 3 is the G₀ dichotomy, oriented and symmetric, with its acceptance checks. Layer 4 is Silver in every listed form, plus the analytic perfect set theorem. Layer 5 is reducibility, smoothness, closed relations, the reducibility order and E₀. Among the worked examples, the Vitali relation (example 5) has no counterpart in the examples files.

## The frontier

- **The Vitali relation** — show that `x - y ∈ ℚ` on ℝ is Borel with countable classes, generically ergodic and not smooth, and so has 𝔠 classes by Silver. No examples file covers it yet. The argument is the one already carried out for E₀, with rational translations in place of coordinate flips.
- **Handover to Mathlib** — Kuratowski–Ulam, the Gδ-subspace theorems and the Borel graph theorem are built here under the names of their pending Mathlib proposals. They should be replaced by Mathlib's declarations when those land.
- **Downstream use** — the Layer 4 interface is ready for CountableModelCounting to consume. The converse half of Glimm–Effros, the coanalytic form of Silver and Burgess's theorem are explicitly assigned to other roadmaps.

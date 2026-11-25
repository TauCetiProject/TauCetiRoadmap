<!--tauceti-status:v1 {"roadmap":"CountableStructureSpacesPartII","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833","ts":"2026-11-25T15:07:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"1.3: Borel model classes of first-order theories, agreement with reconstructStructure, and Borel completeness absorbing function-symbol classes","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"borelComplete_linearOrderClass, borelComplete_treeClass, and the cover-graph reduction of 3.5(b) reflecting isomorphism","state":"partial"},{"id":"Layer 4","remaining":"4.2: universalLanguage and exists_equivariant_measurableEmbedding_universal","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"2313ead52f79ef05ecf1924a27b5fdc8cf9280e1f7dc44bdeb8c81bf1e890c5a","roadmap":"CountableStructureSpacesPartII","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833"}-->
# Status: CountableStructureSpacesPartII

This file documents the status of the CountableStructureSpacesPartII roadmap up until `522d48f` (2026-11-25T15:07:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations (Layer 0) and the Borel completeness of countable graphs (Layer 2) are done, and Borel completeness itself is defined with its transfer laws. Linear orders and trees, function symbols and Borel S∞-spaces are partial; the universal embedding, the characterisations of Layer 5 and the consequences in Layer 6 have not begun.

### Named results

- **Countable graphs are Borel complete** — isomorphism on every invariant Borel class of countable structures, in any countable relational language, Borel reduces by one continuous map to isomorphism of simple graphs on ℕ, the graph case of Friedman–Stanley's first theorem ([borelComplete_graphClass](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/GraphClass.html#TauCeti.RelationalConfiguration.borelComplete_graphClass)).
- **The incidence-graph criterion** — two codes are isomorphic exactly when their coloured incidence graphs are isomorphic by a colour-preserving map ([isoSetoid_iff_exists_iso_incidenceGraph](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/IncidenceGraph.html#TauCeti.RelationalConfiguration.isoSetoid_iff_exists_iso_incidenceGraph)); [clique tags](https://taucetiproject.org/docs/TauCeti/Combinatorics/SimpleGraph/Clique/Tag.html#SimpleGraph.nonempty_iso_cliqueTag_iff) then remove the colours from triangle-free graphs.
- **The coloured Cantor theorem for ℚ** — colouring rationals by the 2-adic valuation of the denominator, every permutation of the colours is induced by an order automorphism of ℚ ([Rat.exists_orderIso_multiplicity_den_eq](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/DenominatorColouring.html#Rat.exists_orderIso_multiplicity_den_eq)).
- **The unravelling lemma** — two graph codes, simple or not, are isomorphic exactly when some order automorphism of the lexicographic order on finite sequences of rationals matches their colourings ([isoSetoid_iff_exists_orderIso_unravelColor](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/Unravelling.html#TauCeti.RelationalConfiguration.isoSetoid_iff_exists_orderIso_unravelColor)), the core of the coming linear-order reduction.
- **Set reducibility is strictly weaker than Borel reducibility** — the graph of E₀ set-reduces to the diagonal of Cantor space although E₀ is not smooth ([not_forall_borelReducible_of_borelReducible_setOf](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/EZero.html#TauCeti.not_forall_borelReducible_of_borelReducible_setOf)).

### Notable definitions and infrastructure

- [BorelComplete](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/BorelComplete.html#TauCeti.RelationalConfiguration.BorelComplete), stated for languages in universe 0 and shown to [reach every universe](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/BorelComplete.html#TauCeti.RelationalConfiguration.BorelComplete.borelReducible), built on [isomorphism restricted to a class](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/ClassIso.html#TauCeti.RelationalConfiguration.classIso) and its restriction and corestriction laws; every later reduction is produced through these.
- The [functional coding space](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/Functional/Coding.html#TauCeti.FunctionalConfiguration), Polish with a continuous logic action, whose graph-code map is a [measurable embedding](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/Functional/ClassIso.html#TauCeti.FunctionalConfiguration.measurableEmbedding_graphCode) onto a Gδ set that is not closed when there is a function symbol.
- The coded [linear orders](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/OrderClass.html#TauCeti.RelationalConfiguration.linearOrderClass) and [trees](https://taucetiproject.org/docs/TauCeti/ModelTheory/RelationalConfiguration/OrderClass.html#TauCeti.RelationalConfiguration.treeClass), invariant and Borel, the first closed and the second not, with the coded linear orders meeting uncountably many isomorphism types.

### Roadmap coverage

Layers 0 and 2 are done. Layer 1 is done for relabelling and the definition of Borel completeness (1.1, 1.2); in 1.3 the functional coding space and the bireducibility with graph codes are proved, but not the Borel model classes of first-order theories, the agreement with the reconstruction, or the theorem that Borel complete classes absorb classes with function symbols. Layer 3 has 3.1 and 3.2 done and the classes of 3.3–3.4 defined; the two Borel completeness theorems are missing, and of 3.5 the two presentations of trees are proved while the cover-graph map is proved measurable and isomorphism-preserving but not reflecting. Layer 4 has the Borel σ-algebra on permutations, restriction of jointly measurable actions, and [equivariant injections as reductions](https://taucetiproject.org/docs/TauCeti/SetTheory/Descriptive/BorelAction.html#TauCeti.borelReducible_orbitRel) from 4.1, but no universal embedding. Layers 5 and 6 are untouched.

## The frontier

- **Linear orders are Borel complete** — build the continuous map placing copies of ω with coloured finite tails along the unravelled order and combine it with the unravelling lemma and the graph theorem; nothing upstream is missing.
- **Trees are Borel complete** — the tagged-tree map of 3.4, using the same unravelling; afterwards 3.5 needs reflection of isomorphism by the cover-graph map and Borel completeness of marked trees.
- **The ordinal computation of 6.1** — the interval lemma, its sum form, and back-and-forth equivalence of ω^γ·δ and ω^γ·ε at level γ; independent of Layers 1–5 and can start now.
- **The universal embedding** — define the universal language and embed every Borel S∞-space equivariantly into its codes; this is the prerequisite for all of Layer 5.
- **Function symbols** — prove that first-order model classes are invariant Borel in the functional space and that Borel complete relational classes absorb them, closing 1.3.

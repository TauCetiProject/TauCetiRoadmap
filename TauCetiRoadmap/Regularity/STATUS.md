<!--tauceti-status:v1 {"roadmap":"Regularity","to_sha":"3895f92441d8563ba581d11c807798e2492250d7","ts":"2026-11-11T16:19:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"ComplexityBounded, regularityBound3, IsStrongRegularApproximation3, exists_strong_regular_approximation3 and the graph-shadow gate","state":"partial"},{"id":"Layer 9","remaining":"the composed endpoint with Layer 8 and a worked fixed colored pattern","state":"partial"}],"readme_sha":"2c256222d15d1e8e30ff6f1a1e0940c9deb8420f61c5c1498ac20368f6d27ba1","roadmap":"Regularity","to_sha":"3895f92441d8563ba581d11c807798e2492250d7"}-->
# Status: Regularity

This file documents the status of the Regularity roadmap up until `3895f92` (2026-11-11T16:19:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The graph-regularity tower (Layers 0–4) and the arity-3 vocabulary through top regularity (Layers 5–7) are done. The arity-3 induced counting lemma over a regular triadic complex is proved. What is missing is the strong arity-3 regular approximation (Layer 8) that should feed it. Its main ingredients exist, but the theorem has not been stated.

### Named results

- **The arity-3 induced counting lemma** — if a coloring of the triples is close in edit distance to one that is regular over a triadic complex, its labelled induced copies of any fixed colored 3-pattern on `k` vertices are within `ε|V|^k` of the prediction from cell sizes, pair-color densities and relative top densities ([`abs_inducedCopyCount_sub_expectedInducedCount_le_of_topRegular`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/Triadic/InducedCounting.html#TauCeti.Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le_of_topRegular)). Rank-one top regularity suffices.
- **Strong top regularization** — every lower skeleton has a pair-palette refinement and a further refinement with small polyad energy gap, over which the coloring is top-regular, at scheduled tolerance and rank, outside a small proportion of triples ([`exists_strong_topRegularOverMostPolyads`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/Triadic/StrongTopRegularization.html#TauCeti.Colored3Graph.exists_strong_topRegularOverMostPolyads)). This is the top-layer half of the Layer 8 approximation.
- **Strong graph regularity with induced counting** — nested equipartitions with a uniform coarse level, a fine level uniform at a scheduled scale and a small energy gap ([`exists_strong_regular`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graph/StrongRegularity.html#SimpleGraph.exists_strong_regular)), whose coarse densities predict induced copies of every three-vertex graph to within `(15τ + 3√ε)|V|³ + 6m|V|²` ([`inducedGraphCount3_estimate`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graph/StrongRegularity.html#SimpleGraph.StrongRegular.inducedGraphCount3_estimate)).
- **Finite Frieze–Kannan weak regularity** — every finite graph has a partition into at most `4^⌈1/ε²⌉` parts whose stepped prediction matches the edge count on every rectangle to within `ε|V|²` ([`frieze_kannan`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graph/FriezeKannan.html#SimpleGraph.frieze_kannan)).
- **Seeded Szemerédi regularity** — every equipartition is almost refined, cell by cell, by an ε-uniform equipartition of bounded complexity ([`exists_regular_equipartition_almost_refining`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graph/SeededRegularity.html#SimpleGraph.exists_regular_equipartition_almost_refining)), the input that strong regularity iterates.

### Notable definitions and infrastructure

- **The induced-count prediction** — [`expectedInducedCount`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/Triadic/Placement.html#TauCeti.Colored3Graph.expectedInducedCount) sums, over placements of the pattern into cells and routes of pair colors, the falling-factorial injection count times pair and relative top densities. It is the quantity the counting lemma compares against.
- **Polyad energy** — [`polyadEnergy`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/Polyad/Energy/Basic.html#TauCeti.Colored3Graph.polyadEnergy) is monotone under refinement of the lower skeleton and gains under resolved irregularity witnesses. That is what makes top regularization terminate.
- **Triadic complexes** — [`TriadicComplex3`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/Triadic/Basic.html#TauCeti.TriadicComplex3) bundles vertex cells, a pair palette and selected polyads, with computed complexity and exceptional polyad mass. Both the counting lemma and top regularization are stated over it.

### Roadmap coverage

**Done:** Layers 0–7. This includes the hypergraph hom and injective densities, the hypergraph energy, labelled copies of a complex, the Layer 4 counting estimate with its triangle and edgeless specializations, and the arity-2 vertex-box comparison. **Partial:** Layer 8 has top regularization, a pair-color regularity lemma with an equitable form, regular recoloring, quasirandom splitting, divisible padding and stability under vertex moves, recolorings and edits. It lacks `ComplexityBounded`, `regularityBound3`, `IsStrongRegularApproximation3` and `exists_strong_regular_approximation3`. Layer 9 has the counting lemma over a regular complex with all six charges, under its own names rather than the README's. It lacks the composed endpoint with Layer 8 and a worked fixed pattern. **Comparisons:** the energy comparison, [the cut-discrepancy/cut-norm identity](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graphon/CutDiscrepancy.html#SimpleGraph.cutNorm_finiteGraphGraphon_sub_stepGraphonAvg) and the [hom-density alignment](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/HomDensity.html#SimpleGraph.homDensity_toUniformHypergraph) are proved. The step-graphon compatibility appears through block averages over the lifted cell partition, not under the name `stepGraphonOfFinpartition`.

## The frontier

- **The strong arity-3 approximation** — define `ComplexityBounded`, `regularityBound3` and `IsStrongRegularApproximation3`, then prove `exists_strong_regular_approximation3`. This means combining strong top regularization with the lower-skeleton regularity, cleanup, splitting and padding along the Rödl–Schacht edited-approximation route. It is the roadmap's hardest remaining step.
- **The composed counting endpoint** — `exists_strong_regular_approximation3_counting`, instantiating Layer 8 at the counting schedules so that the counting lemma applies. This waits only on the approximation theorem.
- **A worked colored pattern** — the Layer 9 gate asks for the prediction and the counting bound for one fixed colored 3-pattern. Nothing blocks it.
- **The Layer 8 gate** — compare the two-dimensional shadow of triadic complexes with Layer 4's graph API.

<!--tauceti-status:v1 {"roadmap":"Regularity","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"graph hom densities normalized by powers and injective densities by the falling factorial","state":"partial"},{"id":"Layer 1","remaining":"the hypergraph-level analogue of weighted energy","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"StrongRegular.inducedGraphCount3_estimate and its triangle and edgeless specializations","state":"partial"},{"id":"Layer 5","remaining":"labelled copies of a fixed hypergraph complex","state":"partial"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"arity-2 comparison of vertex-box and pair regularity","state":"partial"},{"id":"Layer 8","remaining":"ComplexityBounded, regularityBound3, IsStrongRegularApproximation3 and exists_strong_regular_approximation3","state":"partial"},{"id":"Layer 9","remaining":"placements, the expected induced count, local counting and the six-charge assembly","state":"partial"}],"readme_sha":"2c256222d15d1e8e30ff6f1a1e0940c9deb8420f61c5c1498ac20368f6d27ba1","roadmap":"Regularity","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd"}-->
# Status: Regularity

This file documents the status of the Regularity roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The graph-regularity tower is nearly complete. The seeded Szemerédi bridge (Layer 2) and finite Frieze–Kannan (Layer 3) are done. Strong graph regularity (Layer 4) is proved but still lacks its induced counting estimate. On the arity-3 side, the vocabulary is in place up to triadic complexes. No hypergraph regularity or counting theorem has been proved yet.

### Named results

- **Finite Frieze–Kannan weak regularity** — every finite graph has a partition into at most `4^⌈1/ε²⌉` parts whose stepped prediction matches the edge count on every rectangle to within `ε|V|²` ([`frieze_kannan`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graph/FriezeKannan.html#SimpleGraph.frieze_kannan)). It is proved directly from the size-weighted energy, with no graphon imports.
- **Strong graph regularity** — from any equipartition it gives nested equipartitions `Q ≤ P`: `P` is ε-uniform and almost refines the seed, `Q` is uniform at scale `F #P.parts`, the energy gap is at most ε, and the complexity is bounded independently of the graph ([`exists_strong_regular`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graph/StrongRegularity.html#SimpleGraph.exists_strong_regular)).
- **Seeded Szemerédi regularity** — every equipartition is almost refined, within ε in each cell, by an ε-uniform equipartition of bounded complexity ([`exists_regular_equipartition_almost_refining`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graph/SeededRegularity.html#SimpleGraph.exists_regular_equipartition_almost_refining)). This is the input that strong regularity iterates.
- **Induced counting for three uniform cells** — for pairwise ε-uniform cells, the number of labelled induced copies of any graph on three vertices is close to the product of the corresponding edge and nonedge densities ([`abs_card_induced_fin_three_sub_le`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graph/Counting.html#SimpleGraph.abs_card_induced_fin_three_sub_le)). This is the fine-regularity term of the Layer 4 estimate.
- **Finite energy equals graphon energy** — the size-weighted energy of a partition of a graph on `Fin m` equals the partition energy of its graphon over the lifted interval partition ([`graphonPartitionEnergy_finiteGraphGraphon`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graphon/Energy.html#SimpleGraph.graphonPartitionEnergy_finiteGraphGraphon)). This is the first of the required dense-graph-limits comparisons.

### Notable definitions and infrastructure

- **Cut discrepancy** — [`cutDiscrepancy`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Regularity/Graph/CutDiscrepancy.html#SimpleGraph.cutDiscrepancy) is the largest rectangle deviation between true and stepped edge counts, scaled by counts. It is the quantity weak regularity controls, and the one a later comparison will match against the analytic cut norm.
- **Triadic complexes** — [`TriadicComplex3`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/Triadic/Basic.html#TauCeti.TriadicComplex3) bundles a chosen pair palette, a lower skeleton and selected polyads. It has a computed complexity, a bridge to hypergraph complexes, polyad decompositions, and the exceptional-mass predicate [`TopRegularOverMostPolyads`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/Triadic/Basic.html#TauCeti.Colored3Graph.TopRegularOverMostPolyads). Together these are the language the strong arity-3 approximation is stated in.
- **Top regularity over a polyad** — [`IsTopRegularOverPolyad`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/Polyad/TopRegular.html#TauCeti.Colored3Graph.IsTopRegularOverPolyad) is the rank-r test against unions of subpolyads. It now has a [slicing lemma](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hypergraph/Polyad/TopRegular.html#TauCeti.Colored3Graph.IsTopRegularOverPolyad.of_pairSupport_subset) and density inheritance to sub-polyads.

### Roadmap coverage

**Done:** Layers 2, 3 and 6. Layer 3 has `steppedCount`, `cutDiscrepancy`, `frieze_kannan` with its supremum and refining forms, and a worked example.

**Done except for named items:**
- Layer 0 lacks the hom and injective density API.
- Layer 1 lacks the hypergraph-level energy.
- Layer 4 has `StrongRegular` and `exists_strong_regular`, but `inducedGraphCount3_estimate` has not been assembled.
- Layer 5 lacks labelled copies of a fixed complex.
- Layer 7 has slicing and inheritance, but not the arity-2 comparison of vertex-box and pair regularity.

**Partial:**
- Layer 8 has triadic complexes, complexity, polyad decompositions, exceptional mass and controlled vertex cells. It does not have `ComplexityBounded`, `regularityBound3`, or the approximation theorem.
- Layer 9 still has only patterns and `inducedCopyCount`.

**Comparisons:** of the dense-graph-limits comparisons, only the energy comparison is proved.

## The frontier

- **The Layer 4 counting estimate** — assemble `StrongRegular.inducedGraphCount3_estimate` from the three-cell counting lemma, the `3√ε|V|³` energy-transfer bound and the repeated-cell bounds, all of which exist. Then prove the specializations required by the gate.
- **The strong arity-3 approximation (Layer 8)** — define `regularityBound3`, `ComplexityBounded` and `IsStrongRegularApproximation3`, then prove `exists_strong_regular_approximation3` along the Rödl–Schacht edited-approximation route. This is the roadmap's hardest step, and its definitions are now largely available.
- **Remaining dense-graph-limits comparisons** — the `stepGraphonOfFinpartition` compatibility, identifying `cutDiscrepancy` with the analytic Frieze–Kannan statement (with the `|V|²` scaling taken into account), and aligning names with `homDensityFin` / `injHomDensity`.
- **Small Layer 0/1/5/7 gaps** — hom and injective densities, a hypergraph block energy, labelled copies of a fixed complex, and the arity-2 vertex-box comparison.
- **Induced counting (Layer 9)** — placements, the falling-factorial injection count, the expected induced count and the six-charge assembly. This waits on Layer 8.

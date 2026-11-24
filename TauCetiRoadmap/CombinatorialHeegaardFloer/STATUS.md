<!--tauceti-status:v1 {"roadmap":"CombinatorialHeegaardFloer","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the bigraded structure theorem and bigraded cones, in the API the grid complexes use","state":"partial"},{"id":"Layer 2","remaining":"the link in S3 presented by a grid, its invariance under grid moves, Cromwell's theorem, the grid determinant as Alexander polynomial","state":"partial"},{"id":"Layer 3","remaining":"assembled grid-move invariance of G-hat, Maslov-graded invariance, 3.8-3.11, existence of sign assignments, filtered invariance","state":"partial"},{"id":"Layer 4","remaining":"blow-up invariance of lattice homology, the four models and their comparisons, the correction-term identity","state":"partial"},{"id":"Layer 5","remaining":"d squared = 0 for the hat differential, the nice-move calculus, HF-hat_st and its invariance, integer coefficients","state":"partial"}],"readme_sha":"405dcab49b750d21256f36c4cbf8b8bd602000ed00bab2dcf317afae6e56bd2a","roadmap":"CombinatorialHeegaardFloer","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: CombinatorialHeegaardFloer

This file documents the status of the CombinatorialHeegaardFloer roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 3 has reached its first summit. The Milnor conjecture is proved for grid knots, and `GH⁻` and τ are invariants of grid knots in characteristic two. Every layer is partial. `GĤ` invariance, the filtered theory, integer coefficients and the link with knots in `S³` are still open.

### Named results

- **The Milnor conjecture for grid knots.** For coprime `P` and `Q`, the knot of the standard `(P, Q)` torus grid [has unknotting number `(P−1)(Q−1)/2`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/TorusLink/Milnor.html#TauCeti.GridLink.unknottingNumber_toGridLink_torusLink). Here `u` is the unknotting number of the grid link, measured in its crossing-change graph.
- **The unknotting bound `|τ| ≤ u`.** Over any field of characteristic two, [τ of a grid knot is bounded by its unknotting number](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/CrossingChange/Tau.html#TauCeti.GridLink.IsKnot.natAbs_tau_le_unknottingNumber). The bound comes from the [crossing change inequality](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/CrossingChange/Tau.html#TauCeti.GridDiagram.IsKnot.abs_tau_swapColumns_sub_tau_le_one), which is now proved without extra hypotheses.
- **Grid-move invariance of `GH⁻`.** Knot grids related by grid moves have [isomorphic unblocked grid homology as Alexander-graded `K[U]`-modules](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Homology/Invariance.html#TauCeti.GridDiagram.IsKnot.unblockedHomologyIsomorphic_of_movesTo), for every commutative ring `K` of characteristic two.
- **The Euler characteristic of grid homology.** The graded Euler characteristic of fully blocked homology [is the normalized grid determinant](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Homology/EulerCharacteristic.html#TauCeti.OddComponentGridDiagram.gradedHomologyEulerChar_eq_smul_T_mul_det_weightMatrix).
- **The structure theorem for graded `k[X]`-modules.** A finitely generated graded `k[X]`-module over a field, with `X` of nonzero degree, [is an internal direct sum of homogeneous free towers and cyclic torsion summands](https://taucetiproject.org/docs/TauCeti/Algebra/Module/GradedModule/CyclicDecomposition.html#TauCeti.InternalGrading.exists_isInternal_span_singleton).

### Notable definitions and infrastructure

- [τ of a grid knot](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Move/Tau.html#TauCeti.GridLink.IsKnot.tau) and the [unknotting number](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/CrossingChange/UnknottingNumber.html#TauCeti.GridLink.unknottingNumber) of a grid link are both defined on the quotient of grid diagrams by grid moves. That is why the Milnor conjecture can be stated without first building knots in `S³`.
- [Filtered chain homotopy equivalences](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/SquareZero/Filtered.html#LinearMap.FilteredHomotopyEquiv) of square-zero endomorphisms form an equivalence relation. They restrict to filtration levels and preserve the homology of the associated graded. Filtered invariance will be stated in these terms; cyclic permutations already give [such equivalences](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Filtered/CyclicPermutation.html#TauCeti.OddComponentGridDiagram.relabelRowsFilteredHomotopyEquiv).
- The [Gauss code of a knot grid](https://taucetiproject.org/docs/TauCeti/KnotTheory/GaussCode/Grid.html#TauCeti.GridDiagram.IsKnot.gaussCode) reads off the planar diagram with crossing signs. It can be converted to an oriented PD code, which is the starting point for identifying grid knots with knots in `S³`.

### Roadmap coverage

**Layer 3** (Lane G) is partial.
- **Done:** §3.7 is done for grid links: `|τ| ≤ u`, the torus-knot values of τ, and the Milnor conjecture.
- **§3.5:** `GH⁻` invariance is done in its Alexander-graded form. The Maslov grading is not covered. `GĤ` has commutation, cyclic-permutation and both corner `X`-stabilization invariances, but no assembled grid-move theorem. The stabilization formula for `GH̃` is known only as a [dimension count](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Homology/PartiallyBlocked.html#TauCeti.GridDiagram.IsKnot.finrank_fullyBlockedHomology).
- **§§3.4, 3.6, 3.8:** §3.4 has the determinant formula but not `Δ_K`. §3.6 has τ but not the multivariable link form. §3.8 has only the reflection and rotation symmetries.
- **Not started:** §§3.9–3.11.
- **§3.12:** there is a signed differential, but sign assignments are not yet shown to exist.
- **§3.13:** the filtered complex is invariant under cyclic permutations only.

**Layer 1** (Lane ALG) is partial. It has the singly graded structure theorem, a five lemma for differential groups, and filtered chain homotopy equivalences. The bigraded refinement of the structure theorem was not found in the source.

**Layer 2** (Lane K) is partial, but only just: knot grids have Gauss codes. The presented link in `S³`, its invariance under grid moves, and Cromwell's theorem are absent.

**Layer 4** (Lane L) is partial. Lattice homology is defined over `𝔽₂[U]` and `R[U]`, with blow-ups of the graph, but there is no blow-up invariance or model comparison.

**Layer 5** (Lane H) is partial. It has nice diagrams and the [hat differential](https://taucetiproject.org/docs/TauCeti/LowDimTopology/Heegaard/HatDifferential.html#TauCeti.HeegaardRegionSystem.hatDifferential), but no proof that it squares to zero.

## The frontier

- **Grid-move invariance of `GĤ`.** Commutation, cyclic permutation and both corner `X`-stabilizations are proved for `GĤ`. They remain to be combined, as for `GH⁻`, through the reduction of all stabilizations to two corner types. Maslov-graded invariance of `GH⁻` is the analogous step.
- **The link between grid diagrams and knots in `S³` (Cromwell's theorem).** The diagram a grid presents must be shown to change by Reidemeister moves under grid moves, and Cromwell's theorem must be proved. Only then is the Milnor conjecture here a statement about the classical unknotting number.
- **Filtered invariance (§3.13).** Filtered homotopy equivalences are still needed for commutations and stabilizations.
- **Sign assignments (§3.12).** Sign assignments must be shown to exist for every grid size and to be unique up to gauge.
- **The hat complex and blow-up invariance.** Layer 5 needs `∂² = 0` for the hat differential before `HF̂_st` exists; Layer 4 needs lattice homology of a blow-up isomorphic to the original.

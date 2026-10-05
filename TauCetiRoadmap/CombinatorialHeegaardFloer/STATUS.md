<!--tauceti-status:v1 {"roadmap":"CombinatorialHeegaardFloer","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane G","remaining":"commutation invariance (pentagon chain map, hexagon homotopy), tau on GridLink, the structure theorem, and G.7-G.13","state":"partial"},{"id":"Lane ALG","remaining":"structure theorem for finitely generated bigraded F[U]-modules; filtered chain complexes","state":"partial"},{"id":"Lane K","remaining":"Cromwell's theorem and matching the grid determinant with the Alexander polynomial","state":"untouched"},{"id":"Lane L","remaining":"Z[U] lattice homology, Neumann-move invariance, the E8 computation","state":"partial"},{"id":"Lane H","remaining":"the chain complex, the nice-move calculus, and HF-hat_st with its invariance","state":"partial"}],"readme_sha":"b0a06bcbcbf2b463727d6e497c50aa531a405f2ca476e0d9cf87078126864a9d","roadmap":"CombinatorialHeegaardFloer","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: CombinatorialHeegaardFloer

This file documents the status of the CombinatorialHeegaardFloer roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane G has grid homology in all three flavours over `𝔽₂`, with `∂² = 0`, `GH⁻` as an `𝔽[U]`-module, and τ defined on knot grids and computed on torus knots. Invariance holds under stabilization and cyclic permutation, but not yet under commutation, so τ is not yet a knot invariant. The Milnor conjecture and everything after it have not started. Lanes L, ALG and H are partial, and Lane K has not begun.

### Named results

- **`∂² = 0` for the grid complexes.** The unblocked grid differential over `𝔽₂[V₀, …, V_{n-1}]` [squares to zero](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Differential/Square/Zero.html#TauCeti.GridDiagram.unblockedDifferential_comp_self_eq_zero), and the blocked theories follow by specialization.
- **Stabilization invariance of `GH⁻`.** The `X`-stabilization map [is bijective on unblocked grid homology](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Stabilization/Homology.html#TauCeti.GridDiagram.stabilizeXHomologyMap_bijective). A half-turn symmetry gives the same result for [the opposite corner](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Stabilization/NorthEast.html#TauCeti.GridDiagram.stabilizeXSuccHomologyMap_bijective), and [every stabilization reduces to one of these two](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Move/Stabilization.html#TauCeti.GridDiagram.IsStabilization.exists_commutationMovesTo) modulo cyclic permutations and commutations.
- **τ of torus knot grids.** On the standard grid of the `(p+1, q+1)` torus knot, [`2τ = −pq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/TorusLink/Tau.html#TauCeti.GridDiagram.two_mul_tau_torusLink), so `τ = −3` on the `T(3,4)` grid. This is the acceptance check `τ(T_{3,4}) = 3` up to an orientation sign that has not been reconciled, and it is still a statement about one grid.
- **The Euler characteristic of grid homology.** The graded Euler characteristic of fully blocked grid homology [is the normalized grid determinant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/EulerCharacteristic.html#TauCeti.OddComponentGridDiagram.gradedHomologyEulerChar_eq_smul_T_mul_det_weightMatrix). This is G.4, with the Alexander-polynomial identification left to Lane K.
- **The `U`-tower in lattice homology.** In every negative-definite plumbing, a minimal-weight lattice point gives a cycle [no nonzero multiple of which is a boundary](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/Tower.html#TauCeti.PlumbingGraph.exists_injective_latticeHomologyCycleMap).

### Notable definitions and infrastructure

- `GridLink` defines a link as grid diagrams modulo commutation and (de)stabilization, so invariance can be proved without waiting on Cromwell's theorem. Its [component count](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Move/Components.html#TauCeti.GridLink.componentCount) is already a well-defined invariant.
- [τ of a knot grid](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/Tau.html#TauCeti.GridDiagram.IsKnot.tau) is minus the top non-torsion Alexander degree of `GH⁻`. Comparison lemmas transfer it along [graded semilinear isomorphisms](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/Tau.html#TauCeti.GridDiagram.IsKnot.tau_eq_of_semilinearMap), and bound it along [maps inverse up to a power of `U`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/Tau.html#TauCeti.GridDiagram.IsKnot.tau_le_tau_sub_of_comp_eq_X_pow_smul), which is the shape the crossing-change argument of G.7 needs.
- [Every `V_i` acts identically on homology](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/XHomotopy/Complex.html#TauCeti.GridDiagram.IsKnot.homologyMap_X_smul_eq) of a knot grid, which makes `GH⁻` an `𝔽[U]`-module and τ meaningful.

### Roadmap coverage

**Lane G** is partial. G.1–G.4 are done, with G.4 in its grid-determinant form. G.5 is done for stabilization and cyclic permutation, but not for commutation. The pentagon map is defined and several overlapping configurations of its chain-map identity are handled, but the identity is not proved, and there is no hexagon homotopy. G.6 has τ and its torus-knot values, but not the structure theorem, and τ is not lifted to `GridLink`. G.7–G.13 are untouched.

**Lane ALG** is partial. It has mapping-cone lemmas, a graded Nakayama lemma, matching-based exactness criteria, and bounded torsion for graded `k[X]`-modules. It has neither the structure theorem nor filtered complexes.

**Lane L** is partial, all over `𝔽₂[U]`. It has the complex, blow-ups, the weight filtration, the tower and spin^c orbits.

**Lane H** is partial, within H.1. It has generators, domains, periodic domains, weak admissibility and a Maslov index.

**Lane K** has not started.

## The frontier

- **Commutation invariance.** Finish the remaining overlapping rectangle–pentagon pairings so that the pentagon map is a chain map. Then build the hexagon-counting homotopy showing that it is a quasi-isomorphism.
- **τ as a knot invariant.** Once commutation is done, combine it with stabilization and cyclic-permutation invariance to lift τ through `GridLink.lift`. The torus-knot values then become statements about knots, once the sign convention is settled against `τ(T_{3,4}) = 3`.
- **`|τ(K)| ≤ u(K)` and the Milnor conjecture.** The crossing-change maps of G.7 are not defined. The comparison lemma for maps inverse up to `U^k` is ready to receive them.
- **Grid homology of the trefoil.** The first acceptance check is still open: `GĤ` of the `5 × 5` trefoil with its bigradings, by evaluation.
- **Lattice homology of `E₈`, and Neumann invariance.** Nonvanishing is known but the rank is not. Invariance needs the blow-up results carried up to homology.

<!--tauceti-status:v1 {"roadmap":"CombinatorialHeegaardFloer","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba","ts":"2026-10-23T04:01:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane G","remaining":"the commutation homotopy equation, tau on grid links, crossing-change maps, and G.7-G.13","state":"partial"},{"id":"Lane ALG","remaining":"a bigraded form of the structure theorem if needed; filtered chain complexes","state":"partial"},{"id":"Lane K","remaining":"Cromwell's theorem and matching the grid determinant with the Alexander polynomial","state":"untouched"},{"id":"Lane L","remaining":"Neumann-move invariance and the E8 computation","state":"partial"},{"id":"Lane H","remaining":"d squared is zero for the hat differential, the nice-move calculus, and HF-hat_st with its invariance","state":"partial"}],"readme_sha":"b0a06bcbcbf2b463727d6e497c50aa531a405f2ca476e0d9cf87078126864a9d","roadmap":"CombinatorialHeegaardFloer","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
# Status: CombinatorialHeegaardFloer

This file documents the status of the CombinatorialHeegaardFloer roadmap up until `bfcff79` (2026-10-23T04:01:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane G has grid homology in all three flavours over `𝔽₂`, τ on knot grids, invariance under stabilization and cyclic permutation, and now a commutation map that is a chain map. The commutation homotopy equation is the one step left before τ is an invariant of grid links. The Milnor conjecture has its unknotting number but no crossing-change maps. Lanes ALG, L and H are partial, and Lane K has not begun.

### Named results

- **`∂² = 0` for the grid complexes** — the unblocked grid differential over `𝔽₂[V₀, …, V_{n-1}]` [squares to zero](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Differential/Square/Zero.html#TauCeti.GridDiagram.unblockedDifferential_comp_self_eq_zero), and the blocked theories follow by specialization.
- **Stabilization invariance of `GH⁻`** — the `X`-stabilization map [is bijective on unblocked grid homology](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Stabilization/Homology.html#TauCeti.GridDiagram.stabilizeXHomologyMap_bijective), and [every stabilization reduces to one of two corners](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Move/Stabilization.html#TauCeti.GridDiagram.IsStabilization.exists_commutationMovesTo) modulo cyclic permutations and commutations.
- **The commutation chain map** — counting empty pentagons on either side of two exchanged columns [intertwines the unblocked differentials](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Commutation/InitialPentagon/Overlap/Residual/Assembly.html#TauCeti.GridDiagram.commutationMap_comp_unblockedDifferential), giving a bigrading-preserving [map on `GH⁻`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Homology/Commutation/Basic.html#TauCeti.GridDiagram.unblockedHomologyCommutationMap).
- **The structure theorem for graded `k[X]`-modules** — a finitely generated graded `k[X]`-module over a field, with `X` of nonzero degree, [is an internal direct sum of homogeneous cyclic submodules](https://taucetiproject.org/docs/TauCeti/Algebra/Module/GradedModule/CyclicDecomposition.html#TauCeti.InternalGrading.exists_isInternal_span_singleton). This is the "tower plus torsion" home of τ, singly graded.
- **τ of torus knot grids** — on the standard grid of the `(p+1, q+1)` torus knot, [`2τ = −pq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/TorusLink/Tau.html#TauCeti.GridDiagram.two_mul_tau_torusLink). This is the check `τ(T_{3,4}) = 3` up to an unreconciled orientation sign, and still a statement about one grid.

### Notable definitions and infrastructure

- [τ of a knot grid](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/Tau.html#TauCeti.GridDiagram.IsKnot.tau) is minus the top non-torsion Alexander degree of `GH⁻`, meaningful because every `V_i` acts identically on homology. It is unchanged by cyclic permutation, stabilization and [the diagonal reflection](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Homology/Transpose.html#TauCeti.GridDiagram.IsKnot.tau_transpose), and the reflection reduces row commutations to column ones.
- The [unknotting number of a grid link](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/CrossingChange/UnknottingNumber.html#TauCeti.GridLink.unknottingNumber) is its distance to the unknot, where a crossing change exchanges two adjacent interleaving rows or columns. This states the left side of the Milnor conjecture inside the grid theory, with no wait on Cromwell's theorem.
- The [hat differential](https://taucetiproject.org/docs/TauCeti/LowDimTopology/Heegaard/HatDifferential.html#TauCeti.HeegaardRegionSystem.hatDifferential) of a pointed Heegaard diagram counts nonnegative index-one domains avoiding the basepoints. On [nice diagrams](https://taucetiproject.org/docs/TauCeti/LowDimTopology/Heegaard/Nice.html#TauCeti.HeegaardRegionSystem.IsNice) these move one or two points, the shape Lane H's bigon-and-square counts need.

### Roadmap coverage

**Lane G** is partial. G.1–G.4 are done, G.4 in its grid-determinant form and computed on the trefoil. G.5 is done for stabilization and cyclic permutation; for commutation the chain map is proved but the homotopy equation is not, and fully blocked homology is shown to double in dimension under stabilization. G.6 has τ and its torus-knot values, and the structure theorem now exists in singly graded form, but τ is not lifted to grid links. G.7 has the unknotting number but no crossing-change maps. G.8–G.13 are untouched. **Lane ALG** is partial: mapping-cone lemmas, graded Nakayama, internal gradings on homology, and the graded structure theorem, but no filtered complexes. **Lane L** is partial: the lattice complex over `𝔽₂[U]` and over `R[U]` with signs, blow-ups, the `U`-tower, and nonvanishing for `E₈`, but no Neumann invariance and no `E₈` rank. **Lane H** is partial: H.1 is in place and H.2 has nice diagrams and the hat differential, computed on lens spaces and `S¹ × S²`. **Lane K** has not started.

## The frontier

- **The commutation homotopy equation.** `∂H + H∂ = 1 + ΨΦ` is [reduced to one residual family](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Commutation/Homotopy/Mixed/Side.html#TauCeti.GridDiagram.unblockedDifferential_commutationHomotopy_add_eq_iff_sum_residual_eq_zero) of unpaired hexagon composites; showing their total weight is zero makes commutation a quasi-isomorphism.
- **τ as a knot invariant.** With commutation done, lift τ through the grid-link quotient, and settle the sign convention against `τ(T_{3,4}) = 3`.
- **`|τ(K)| ≤ u(K)` and the Milnor conjecture.** The crossing-change maps on `GH⁻` are not defined. The comparison lemma for maps inverse up to `U^k` is ready for them, and the trefoil already has unknotting number at most one.
- **`HF̂_st` of a nice diagram.** Prove the hat differential squares to zero on nice weakly admissible diagrams, then build the nice-move calculus and the stable invariant; the lens space and `S¹ × S²` chain complexes are already computed.
- **Lattice homology of `E₈`, and Neumann invariance.** Nonvanishing is known but the rank is not. Invariance needs the blow-up projection lemmas carried up to homology.

<!--tauceti-status:v1 {"roadmap":"CombinatorialHeegaardFloer","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057","ts":"2026-09-30T00:20:29Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane G","remaining":"stabilization and commutation invariance (G.5), the bigraded F[U] structure theorem and tau (G.6), and G.7-G.13","state":"partial"},{"id":"Lane ALG","remaining":"structure theorem for finitely generated bigraded F[U]-modules; filtered chain complexes","state":"partial"},{"id":"Lane K","remaining":"Cromwell's theorem and matching the grid determinant with the Alexander polynomial","state":"untouched"},{"id":"Lane L","remaining":"Z[U] lattice homology, Neumann-move invariance, the E8 computation","state":"partial"},{"id":"Lane H","remaining":"the chain complex, the nice-move calculus, and HF-hat_st with its invariance","state":"partial"}],"readme_sha":"b0a06bcbcbf2b463727d6e497c50aa531a405f2ca476e0d9cf87078126864a9d","roadmap":"CombinatorialHeegaardFloer","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057"}-->
# Status: CombinatorialHeegaardFloer

This file documents the status of the CombinatorialHeegaardFloer roadmap up until `dec7a58` (2026-09-30T00:20:29Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane G now has grid homology in all three flavours over `𝔽₂`, with `∂² = 0` proved, `GH⁻` of a knot as an `𝔽[U]`-module, and the grid determinant as its Euler characteristic. Invariance is partly built, and τ, the Milnor conjecture and everything after them have not started. Lanes L, ALG and H are partial, and Lane K has not begun.

### Named results

- **`∂² = 0` for the grid complexes.** The unblocked grid differential over `𝔽₂[V₀, …, V_{n-1}]` [squares to zero](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Differential/Square/Zero.html#TauCeti.GridDiagram.unblockedDifferential_comp_self_eq_zero). The proof works through the book's case analysis of juxtaposed empty rectangles, and the fully blocked and simply blocked cases follow from it by specialization.
- **The variables act as one `U`.** On a knot grid, `X`-marking homotopies show that [every `V_i` acts identically on homology](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/XHomotopy/Complex.html#TauCeti.GridDiagram.IsKnot.homologyMap_X_smul_eq). This makes `GH⁻` [an `𝔽[U]`-module](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/Unblocked.html#TauCeti.GridDiagram.IsKnot.unblockedHomologyModule) with an Alexander grading in which `U` has degree `-1`.
- **The Euler characteristic of grid homology.** The graded Euler characteristic of fully blocked grid homology [is the normalized grid determinant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/EulerCharacteristic.html#TauCeti.OddComponentGridDiagram.gradedHomologyEulerChar_eq_smul_T_mul_det_weightMatrix). This is milestone G.4 on homology. Identifying the determinant with the Alexander polynomial is left to Lane K.
- **The `U`-tower in lattice homology.** In every negative-definite plumbing, a minimal-weight lattice point gives a cycle [no nonzero multiple of which is a boundary](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/Tower.html#TauCeti.PlumbingGraph.exists_injective_latticeHomologyCycleMap). The one-vertex case is computed exactly: it is [free of rank one](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/OneVertex.html#TauCeti.coefficientEquivOneVertexPlumbingLatticeHomology).

### Notable definitions and infrastructure

- [`GridLink`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Move.html#TauCeti.GridLink) defines a link as grid diagrams modulo commutation and (de)stabilization. Invariance theorems can therefore target it without waiting on Cromwell's theorem.
- For stabilization, the complex of an `X`-stabilization is [a mapping cone](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Stabilization/Cone.html#TauCeti.GridDiagram.unblockedComplexStabilizeXIsoHomotopyCofiber). The cone yields the [stabilization chain map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Stabilization/Map.html#TauCeti.GridDiagram.stabilizeXMap), which is [a quasi-isomorphism provided one component `H_I^N` of an `X`-homotopy is](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Stabilization/Map.html#TauCeti.GridDiagram.quasiIso_stabilizeXMap).
- For commutation, the [pentagon map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Commutation/Pentagon.html#TauCeti.GridDiagram.pentagonMap) is defined. Its chain-map identity is [reduced to the overlapping domains](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Commutation/Disjoint/Reduction.html#TauCeti.GridDiagram.pentagonMap_unblockedDifferential_single_eq_iff_overlap), since the disjoint ones are already shown to cancel.

### Roadmap coverage

**Lane G** is partial:

- G.1–G.4 are done. G.4 is done in its grid-determinant form.
- G.5 is partial. Stabilization is reduced to one quasi-isomorphism hypothesis, and commutation lacks the overlapping cases of its chain-map identity and any hexagon homotopy.
- G.6 is partial. It has `GH⁻` as an `𝔽[U]`-module, the specialization long exact sequence, and a [top non-torsion degree](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Module/GradedModule/NonTorsionDegree.html#TauCeti.InternalGrading.supNonTorsionDegree) for graded `k[X]`-modules. It lacks the structure theorem and τ.
- G.7–G.13 are untouched.
- No homology has been computed beyond size two.

**Lane ALG** is partial. It has the stabilization quotient of Poincaré series, mapping-cone and polynomial-extension lemmas, two-out-of-three for quasi-isomorphisms, and a graded Nakayama lemma. It has neither the structure theorem nor filtered complexes.

**Lane L** is partial, all over `𝔽₂[U]`. It has the complex, both blow-ups, the weight filtration, the tower and spin^c orbits. Némethi's `ℤ[U]` theory and Neumann invariance are untouched.

**Lane H** is partial, within its first milestone. It has generators of Heegaard intersection data. The source also has domains, periodic domains, weak admissibility and a combinatorial Maslov index over abstract region data. It has no differential, no nice moves and no `HF̂_st`.

**Lane K** has not started.

## The frontier

- **Stabilization invariance.** What remains is to show that `H_I^N` is a quasi-isomorphism. The graded Nakayama lemma ([quasi-isomorphisms are detected modulo the variables](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/ReductionModVariables.html#LinearMap.homologyMap_bijective_of_mapRange_constantCoeff)) reduces this to a fully blocked statement. The remaining stabilization types then have to be handled or reduced to this one.
- **Commutation invariance.** The overlapping rectangle–pentagon configurations still have to be paired by recuts. After that the pentagon map needs a hexagon-counting homotopy inverse.
- **τ.** This needs the structure theorem for finitely generated bigraded `𝔽[U]`-modules. It also needs invariance, so that the top non-torsion degree of `GH⁻` is a knot invariant rather than a grid invariant. The Milnor conjecture waits on both.
- **Grid homology of the trefoil.** Now that `∂² = 0` holds, `GĤ` of the `5 × 5` trefoil is well-defined. It remains the first acceptance criterion and needs rectangle counts that evaluate. So far only the `3 × 3` unknot's differential has been worked out.
- **Lattice homology of `E₈`, and Neumann invariance.** Nonvanishing is known but the rank is not. Invariance needs the blow-up results carried from the lattice up to homology.

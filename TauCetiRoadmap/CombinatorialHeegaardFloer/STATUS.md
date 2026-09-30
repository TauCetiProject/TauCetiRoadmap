<!--tauceti-status:v1 {"roadmap":"CombinatorialHeegaardFloer","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9","ts":"2026-09-30T18:26:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane G","remaining":"the reduced stabilization bijection and commutation invariance (G.5), tau and the structure theorem (G.6), and G.7-G.13","state":"partial"},{"id":"Lane ALG","remaining":"structure theorem for finitely generated bigraded F[U]-modules; filtered chain complexes","state":"partial"},{"id":"Lane K","remaining":"Cromwell's theorem and matching the grid determinant with the Alexander polynomial","state":"untouched"},{"id":"Lane L","remaining":"Z[U] lattice homology, Neumann-move invariance, the E8 computation","state":"partial"},{"id":"Lane H","remaining":"the chain complex, the nice-move calculus, and HF-hat_st with its invariance","state":"partial"}],"readme_sha":"b0a06bcbcbf2b463727d6e497c50aa531a405f2ca476e0d9cf87078126864a9d","roadmap":"CombinatorialHeegaardFloer","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9"}-->
# Status: CombinatorialHeegaardFloer

This file documents the status of the CombinatorialHeegaardFloer roadmap up until `0d3161a` (2026-09-30T18:26:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane G has grid homology in all three flavours over `𝔽₂`. It has `∂² = 0`, `GH⁻` of a knot grid as an `𝔽[U]`-module, the grid determinant as Euler characteristic, and the top non-torsion degree of torus knot grids. Invariance is reduced but not proved, so τ, the Milnor conjecture and everything after them have not started. Lanes L, ALG and H are partial, and Lane K has not begun.

### Named results

- **`∂² = 0` for the grid complexes.** The unblocked grid differential over `𝔽₂[V₀, …, V_{n-1}]` [squares to zero](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Differential/Square/Zero.html#TauCeti.GridDiagram.unblockedDifferential_comp_self_eq_zero). The proof runs through the book's case analysis of juxtaposed empty rectangles. The blocked theories follow by specialization.
- **The variables act as one `U`.** On a knot grid, [every `V_i` acts identically on homology](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/XHomotopy/Complex.html#TauCeti.GridDiagram.IsKnot.homologyMap_X_smul_eq). This makes `GH⁻` [an `𝔽[U]`-module](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/Unblocked.html#TauCeti.GridDiagram.IsKnot.unblockedHomologyModule) with an Alexander grading.
- **The Euler characteristic of grid homology.** The graded Euler characteristic of fully blocked grid homology [is the normalized grid determinant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/EulerCharacteristic.html#TauCeti.OddComponentGridDiagram.gradedHomologyEulerChar_eq_smul_T_mul_det_weightMatrix). This is milestone G.4, with the Alexander-polynomial identification left to Lane K.
- **The top non-torsion degree of torus knot grids.** On the standard grid of the `(p+1, q+1)` torus knot, `GH⁻` [has maximal non-torsion Alexander degree `p q / 2`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/TorusLink/Homology.html#TauCeti.GridDiagram.two_mul_supNonTorsionDegree_torusLink), which is the Seifert genus, with `3` for `T(3,4)`. This is the grid-level content of `τ(T_{3,4}) = 3`. It is not yet a statement about the knot.
- **The `U`-tower in lattice homology.** In every negative-definite plumbing, a minimal-weight lattice point gives a cycle [no nonzero multiple of which is a boundary](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/Tower.html#TauCeti.PlumbingGraph.exists_injective_latticeHomologyCycleMap). The one-vertex case is [free of rank one](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/OneVertex.html#TauCeti.coefficientEquivOneVertexPlumbingLatticeHomology).

### Notable definitions and infrastructure

- [`GridLink`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Move.html#TauCeti.GridLink) defines a link as grid diagrams modulo commutation and (de)stabilization. Invariance theorems can target it without waiting on Cromwell's theorem.
- For stabilization, the complex of an `X`-stabilization is [a mapping cone](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Stabilization/Cone.html#TauCeti.GridDiagram.unblockedComplexStabilizeXIsoHomotopyCofiber). The resulting [stabilization map is a quasi-isomorphism whenever a reduced fully blocked comparison is bijective on homology](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Stabilization/Reduction.html#TauCeti.GridDiagram.quasiIso_stabilizeXMap_of_bijective).
- The [top non-torsion degree](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Module/GradedModule/NonTorsionDegree.html#TauCeti.InternalGrading.supNonTorsionDegree) of a graded `k[X]`-module is the shape τ will take. It is usable today without the structure theorem.

### Roadmap coverage

**Lane G** is partial:

- G.1–G.4 are done, with G.4 in its grid-determinant form.
- G.5 is partial:
  - `X`-stabilization reduces to one finite-dimensional bijectivity statement over `𝔽₂`.
  - Commutation has the pentagon map, but its chain-map identity still lacks some overlapping cases, and no hexagon homotopy exists.
- G.6 is partial. It has `GH⁻` as an `𝔽[U]`-module, the specialization exact sequence, the top non-torsion degree, and non-torsionness for torus knot grids. It lacks the structure theorem and a definition of τ.
- G.7–G.13 are untouched. The torus-knot degree computation is G.7's input, but only at the grid level.

**Lane ALG** is partial. It has mapping-cone and polynomial-extension lemmas, two-out-of-three for quasi-isomorphisms, and a graded Nakayama lemma with reduction modulo the variables. It has neither the structure theorem nor filtered complexes.

**Lane L** is partial, all over `𝔽₂[U]`. It has the complex, blow-ups, the weight filtration, the tower and spin^c orbits. Némethi's `ℤ[U]` theory and Neumann invariance are untouched.

**Lane H** is partial, within H.1. It has generators, domains, periodic domains, weak admissibility and a combinatorial Maslov index. It has no differential, no nice moves and no `HF̂_st`.

**Lane K** has not started.

## The frontier

- **Stabilization invariance.** Prove that the reduced comparison of `H_I^N` is bijective on fully blocked homology. This is now finite combinatorics over `𝔽₂`. Then handle the other stabilization types or reduce them to this one.
- **Commutation invariance.** The remaining overlapping rectangle–pentagon configurations still need recuts to finish the chain-map identity. The pentagon map then needs a hexagon-counting homotopy inverse.
- **τ and `τ(T_{3,4}) = 3`.** Define τ as minus the top non-torsion degree of `GH⁻`, and prove it is a knot invariant by lifting through `GridLink`. The torus-knot degree computation then gives the acceptance check almost immediately. This waits on both invariance targets above. The structure theorem is only needed for the finer tower-plus-torsion statements.
- **Grid homology of the trefoil.** `GĤ` of the `5 × 5` trefoil with its bigradings is still the first acceptance criterion, and it needs rectangle counts that evaluate.
- **Lattice homology of `E₈`, and Neumann invariance.** Nonvanishing is known but the rank is not. Invariance needs the blow-up results carried up to homology.

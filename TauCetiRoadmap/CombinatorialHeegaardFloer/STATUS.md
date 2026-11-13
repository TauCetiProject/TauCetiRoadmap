<!--tauceti-status:v1 {"roadmap":"CombinatorialHeegaardFloer","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7","ts":"2026-11-08T16:58:25+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane G","remaining":"|tau| at most u and the Milnor conjecture, stabilization invariance of G-hat, G.8-G.11, existence of sign assignments, filtered invariance for G.13","state":"partial"},{"id":"Lane ALG","remaining":"filtered chain complexes and filtered homotopy equivalence","state":"partial"},{"id":"Lane K","remaining":"Cromwell's theorem and matching the grid determinant with the Alexander polynomial","state":"untouched"},{"id":"Lane L","remaining":"Neumann-move invariance, the E8 computation, d-invariants","state":"partial"},{"id":"Lane H","remaining":"d squared = 0 for the hat differential, the nice-move calculus, HF-hat_st with its invariance, Z signs","state":"partial"}],"readme_sha":"12e78b13444f098503608f25be4fd1892541f919e380a69bfa90ad93cc442be6","roadmap":"CombinatorialHeegaardFloer","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7"}-->
# Status: CombinatorialHeegaardFloer

This file documents the status of the CombinatorialHeegaardFloer roadmap up until `a4fcb57` (2026-11-08T16:58:25+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane G is complete through invariance for knots. `GH⁻` and τ are now invariants of grid knots in characteristic two, and the torus-knot values of τ are known. The Milnor conjecture has its upper bound on unknotting numbers but not the lower bound `|τ| ≤ u`. Lanes ALG, L and H are partial, and Lane K has not begun.

### Named results

- **Grid-move invariance of `GH⁻`** — knot grids related by grid moves have [isomorphic unblocked grid homology as Alexander-graded `K[U]`-modules](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Homology/Invariance.html#TauCeti.GridDiagram.IsKnot.unblockedHomologyIsomorphic_of_movesTo), for every commutative ring `K` of characteristic two.
- **τ of torus knots** — the knot of the standard `(p+1, q+1)` torus grid has [`2τ = −pq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Move/Tau.html#TauCeti.GridLink.two_mul_tau_toGridLink_torusLink) as a grid knot. That grid presents the mirror of the positive torus knot, so this is `τ(T_{3,4}) = 3` after mirroring.
- **The upper bound of the Milnor conjecture** — the coprime `(P, Q)` torus knot [has unknotting number at most `(P−1)(Q−1)/2`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/TorusLink/UnknottingNumber.html#TauCeti.GridLink.unknottingNumber_toGridLink_torusLink_le), proved by removing full twists one crossing change at a time.
- **The structure theorem for graded `k[X]`-modules** — a finitely generated graded `k[X]`-module over a field, with `X` of nonzero degree, [is an internal direct sum of homogeneous free towers and cyclic torsion summands](https://taucetiproject.org/docs/TauCeti/Algebra/Module/GradedModule/CyclicDecomposition.html#TauCeti.InternalGrading.exists_isInternal_span_singleton).
- **The Euler characteristic of grid homology** — the graded Euler characteristic of fully blocked homology [is the normalized grid determinant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/EulerCharacteristic.html#TauCeti.OddComponentGridDiagram.gradedHomologyEulerChar_eq_smul_T_mul_det_weightMatrix). On a figure-eight grid it evaluates to [`(1 − t⁻¹)⁵(−t + 3 − t⁻¹)`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/FigureEight.html#TauCeti.OddComponentGridDiagram.gradedHomologyEulerChar_figureEight), the Alexander polynomial times the five stabilization factors.

### Notable definitions and infrastructure

- [τ of a grid knot](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Move/Tau.html#TauCeti.GridLink.IsKnot.tau) is computed on any diagram that presents the knot. Together with the [unknotting number](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/CrossingChange/UnknottingNumber.html#TauCeti.GridLink.unknottingNumber) of a grid link, this puts both sides of `|τ| ≤ u` on the same object.
- [The crossing change inequality for τ](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/CrossingChange/Tau.html#TauCeti.GridDiagram.IsKnot.tau_swapColumns_mem_Icc_of_homotopy) bounds the change in τ across one crossing change. It is proved only on the assumption that the composite of the two crossing-change maps is homotopic to a power of `U`, so it is the bound `|τ| ≤ u` with its one homotopy input still missing.
- The [Alexander filtration](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Filtered/Alexander.html#TauCeti.OddComponentGridDiagram.alexanderFiltration) of `GC⁻` carries a filtered differential that squares to zero and whose associated graded complex is `GC⁻`.

### Roadmap coverage

**Lane G** is partial. G.1–G.5 are done for knots, though the Maslov grading on `GH⁻` and the multivariable link form of invariance are not covered. Commutation is also bijective on fully blocked and simply blocked homology, but `GĤ` is not yet invariant under stabilization. G.6 is done for knots. G.7 has τ on grid knots, the torus-knot τ values and the unknotting upper bound, but not `|τ| ≤ u`. G.12 has a [signed differential squaring to zero](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/SignAssignment/Differential.html#TauCeti.GridDiagram.signedUnblockedDifferential_comp_self_eq_zero) but no proof that sign assignments exist. G.13 has the filtered complex but no filtered invariance. G.8–G.11 are untouched. **Lane ALG** is partial: it has the structure theorem, mapping-cone lemmas and a graded Nakayama lemma, but no general theory of filtered complexes and filtered homotopy equivalence. **Lane L** is partial: lattice homology exists over `𝔽₂[U]` and `R[U]`, with blow-ups, spin^c orbits and the one-vertex computation, but there is no Neumann-move invariance and no `E₈` computation. **Lane H** is partial: H.1 is essentially in place, and H.2 has [nice diagrams](https://taucetiproject.org/docs/TauCeti/LowDimTopology/Heegaard/Nice.html#TauCeti.HeegaardRegionSystem.IsNice) and the hat differential, but it does not have `∂² = 0`. **Lane K** has not started.

## The frontier

- **`|τ(K)| ≤ u(K)`.** The crossing-change homotopy equation has been reduced to unpaired composites, and those have been shown to be pentagon partners. What remains is to cancel them and close the equation, which would discharge the hypothesis of the crossing change inequality.
- **The Milnor conjecture.** Once the bound holds, the existing upper bound and the torus-knot τ values give `u(T_{P,Q}) = (P−1)(Q−1)/2` for every coprime pair, with `T_{2,3}` and `T_{3,4}` as instances. Mirroring must be tracked, since the standard grids present negative torus knots.
- **`GĤ` and the genus bound.** The simply blocked stabilization comparison is defined but not shown to be bijective. With that, `GĤ` becomes a knot invariant, which opens G.8 and the oracle checks.
- **Filtered invariance (G.13).** The filtered complex exists. Its invariance as a filtered quasi-isomorphism type needs Lane ALG's filtered homotopy equivalences, which do not exist yet.
- **Lattice homology of `E₈`, and the hat complex.** The rank of `E₈` lattice homology and Neumann invariance are open in Lane L. In Lane H, `∂² = 0` for the hat differential on nice diagrams is the gate to `HF̂_st`.

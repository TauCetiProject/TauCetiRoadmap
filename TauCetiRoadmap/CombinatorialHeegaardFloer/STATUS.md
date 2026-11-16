<!--tauceti-status:v1 {"roadmap":"CombinatorialHeegaardFloer","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane G","remaining":"|tau| at most u and the Milnor conjecture, the other stabilization placements and grid-move invariance for G-hat, G.8-G.11, sign assignments, filtered invariance","state":"partial"},{"id":"Lane ALG","remaining":"filtered chain complexes and filtered homotopy equivalence","state":"partial"},{"id":"Lane K","remaining":"Cromwell's theorem and matching the grid determinant with the Alexander polynomial","state":"untouched"},{"id":"Lane L","remaining":"Neumann-move invariance, the E8 computation, d-invariants","state":"partial"},{"id":"Lane H","remaining":"d squared = 0 for the hat differential, the nice-move calculus, HF-hat_st with its invariance, Z signs","state":"partial"}],"readme_sha":"12e78b13444f098503608f25be4fd1892541f919e380a69bfa90ad93cc442be6","roadmap":"CombinatorialHeegaardFloer","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: CombinatorialHeegaardFloer

This file documents the status of the CombinatorialHeegaardFloer roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane G is complete through invariance for knots. `GH⁻` and τ are invariants of grid knots in characteristic two, and the torus-knot values of τ are known. The Milnor conjecture has its upper bound on unknotting numbers but not the lower bound `|τ| ≤ u`. Lanes ALG, L and H are partial, and Lane K has not begun.

### Named results

- **Grid-move invariance of `GH⁻`** — knot grids related by grid moves have [isomorphic unblocked grid homology as Alexander-graded `K[U]`-modules](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Homology/Invariance.html#TauCeti.GridDiagram.IsKnot.unblockedHomologyIsomorphic_of_movesTo), for every commutative ring `K` of characteristic two.
- **τ of torus knots** — the knot of the standard `(p+1, q+1)` torus grid has [`2τ = −pq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Move/Tau.html#TauCeti.GridLink.two_mul_tau_toGridLink_torusLink). That grid presents the mirror of the positive torus knot, so this is `τ(T_{3,4}) = 3` after mirroring.
- **The upper bound of the Milnor conjecture** — the coprime `(P, Q)` torus knot [has unknotting number at most `(P−1)(Q−1)/2`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/TorusLink/UnknottingNumber.html#TauCeti.GridLink.unknottingNumber_toGridLink_torusLink_le), proved by removing full twists one crossing change at a time.
- **The structure theorem for graded `k[X]`-modules** — a finitely generated graded `k[X]`-module over a field, with `X` of nonzero degree, [is an internal direct sum of homogeneous free towers and cyclic torsion summands](https://taucetiproject.org/docs/TauCeti/Algebra/Module/GradedModule/CyclicDecomposition.html#TauCeti.InternalGrading.exists_isInternal_span_singleton).
- **The Euler characteristic of grid homology** — the graded Euler characteristic of fully blocked homology [is the normalized grid determinant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology/EulerCharacteristic.html#TauCeti.OddComponentGridDiagram.gradedHomologyEulerChar_eq_smul_T_mul_det_weightMatrix), and on a figure-eight grid it is [`(1 − t⁻¹)⁵(−t + 3 − t⁻¹)`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/FigureEight.html#TauCeti.OddComponentGridDiagram.gradedHomologyEulerChar_figureEight), the Alexander polynomial times five stabilization factors.

### Notable definitions and infrastructure

- [τ of a grid knot](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Move/Tau.html#TauCeti.GridLink.IsKnot.tau) is computed on any diagram that presents the knot. With the [unknotting number](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/CrossingChange/UnknottingNumber.html#TauCeti.GridLink.unknottingNumber) of a grid link, both sides of `|τ| ≤ u` live on the same object.
- [The crossing change inequality for τ](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/CrossingChange/Tau.html#TauCeti.GridDiagram.IsKnot.tau_swapColumns_mem_Icc_of_homotopy) bounds the change in τ across one crossing change, on the assumption that the round-trip composite is homotopic to a power of `U`. It is `|τ| ≤ u` with that one homotopy input missing.
- The [Alexander filtration levels](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Filtered/Complex.html#TauCeti.OddComponentGridDiagram.alexanderFiltrationComplex) of `GC⁻` are Maslov-graded chain complexes, nested by monomorphisms inside the total filtered complex, with an exhaustive and separated filtration. This is the object whose filtered quasi-isomorphism type G.13 asks about.

### Roadmap coverage

**Lane G** is partial. G.1–G.6 are done for knots, though the Maslov grading on `GH⁻` and the multivariable link form of invariance are not covered. For `GĤ`, commutation is bijective and the south-west `X`-stabilization is [bijective on the hat homology](https://taucetiproject.org/docs/TauCeti/KnotTheory/Grid/Stabilization/SimplyBlocked/Homology.html#TauCeti.GridDiagram.oneVariableSpecializationStabilizeXHomologyMap_bijective) and preserves its bigraded Poincaré series, but the other stabilization placements, and hence a grid-move invariance theorem, are missing. G.7 has τ on grid knots, the torus-knot values and the unknotting upper bound, but not `|τ| ≤ u`. G.12 has a signed differential squaring to zero but no existence of sign assignments. G.13 has the filtered complex but no filtered invariance. G.8–G.11 are untouched. **Lane ALG** is partial: the structure theorem, mapping-cone lemmas, a graded Nakayama lemma and a five lemma for short exact sequences of differential groups, but no theory of filtered complexes or filtered homotopy equivalence. **Lane L** is partial: lattice homology over `𝔽₂[U]` and `R[U]`, blow-ups, spin^c orbits and the one-vertex computation, with no Neumann-move invariance and no `E₈` computation. **Lane H** is partial: H.1 is essentially in place, and H.2 has nice diagrams and the hat differential but not `∂² = 0`. **Lane K** has not started.

## The frontier

- **`|τ(K)| ≤ u(K)`.** The crossing-change homotopy equation has been reduced to unpaired composites, and the terminal-initial terms now match their partners. The remaining terms must cancel and the equation be assembled, which discharges the hypothesis of the crossing change inequality.
- **The Milnor conjecture.** With that bound, the existing upper bound and torus-knot τ values give `u(T_{P,Q}) = (P−1)(Q−1)/2` for coprime `P, Q`. Mirroring must be tracked, since the standard grids present negative torus knots.
- **Invariance of `GĤ` and the genus bound.** The remaining stabilization placements for the hat theory, then a grid-move invariance theorem. That opens G.8 and the oracle checks.
- **Filtered invariance (G.13).** The filtered complex is in place; its invariance needs Lane ALG's filtered homotopy equivalences, which do not exist yet.
- **`E₈` lattice homology and the hat complex.** Lane L needs the `E₈` rank and Neumann invariance. In Lane H, `∂² = 0` for the hat differential on nice diagrams is the prerequisite for `HF̂_st`.

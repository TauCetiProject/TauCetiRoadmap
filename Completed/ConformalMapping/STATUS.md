<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the argument principle for integer cycles; finite zero sets and multiplicity transport in the form of 0.2","state":"partial"},{"id":"Layer 1","remaining":"compact iff closed and locally bounded in C(Ω, ℂ); closedness of normalized univalent families","state":"partial"},{"id":"Layer 2","remaining":"the Cayley comparison of half-plane and disc distances with transported metric and geodesics","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"straightening charts for real-analytic arcs, reflection through them, removability of a rectifiable arc","state":"partial"},{"id":"Layer 5","remaining":"index of a continuous loop, general Jordan index theorem, continuous-boundary argument principle, Darboux injectivity, analytic-arc extension","state":"partial"},{"id":"Layer 6","remaining":"polygon orientation and turning data, source infinity at a finite vertex, bounded disc formula, unbounded affine stabilizer","state":"partial"}],"readme_sha":"1ff78f1dd2bd6341c9c4369ab43ba234f47af70867a73509384332bf3c87d1c1","roadmap":"ConformalMapping","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The central theorem of every layer is proved. The README asks for more, and its remaining end theorems (the Jordan index theorem for an arbitrary Jordan curve, Darboux boundary injectivity, and source infinity at a finite vertex) are not proved. Only Layer 3 meets the specification in full.

### Named results

- **The Riemann mapping theorem**: every nonempty, simply connected, proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc, with normalized and uniqueness forms ([`riemannMapping`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)).

- **The Jordan curve theorem**: the complement of any plane Jordan curve has exactly two components, a connected inside `filledHull C \ C` and an unbounded outside, each with the curve as frontier ([`natCard_connectedComponents_compl_eq_two`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/PlaneSeparation/Inside.html#TauCeti.IsJordanCurve.natCard_connectedComponents_compl_eq_two)). Conversely, a bounded open set with Jordan frontier is that inside ([`eq_filledHull_sdiff_of_isOpen_of_isBounded`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/PlaneSeparation/Inside.html#TauCeti.IsJordanCurve.eq_filledHull_sdiff_of_isOpen_of_isBounded)).

- **Carathéodory's boundary correspondence**: a Riemann map of a bounded Jordan domain extends to a homeomorphism from the closed disc onto the closure of the domain ([`exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)).

- **The Schwarz–Christoffel theorem**: a bounded domain whose boundary is a polygonal Jordan curve, reentrant corners allowed, is the image of the upper half-plane under an affine image of the Schwarz–Christoffel primitive, and three prevertices fix the map ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier)).

- **Schwarz–Christoffel with several ends**: the same holds for a simply connected unbounded polygonal domain whose ends are sectors, half-strips or half-strip exteriors, and the turning exponents then sum to −2 ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_ends`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/MultipleEnds/PolygonalDomain.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_ends)).

### Notable definitions and infrastructure

- **The pre-Schwarzian derivative `f''/f'`** drives every Schwarz–Christoffel proof. [Its rigidity](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/PreSchwarzian.html#TauCeti.exists_eqOn_const_mul_add_iff_logDeriv_deriv_eqOn) says maps with the same pre-Schwarzian differ by an affine change; it [inherits reflection symmetry](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Reflection/LogDeriv.html#TauCeti.logDeriv_deriv_conj_eq_conj_logDeriv_deriv_of_isOpen_of_forall_im_ne_zero) across straight edges, and its residues at corners and ends fix the exponents.

- **Univalence criteria for the converse direction.** The Noshiro–Warschawski criterion gives [univalence of the primitive when the absolute exponents total at most one](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Univalence.html#TauCeti.injOn_schwarzChristoffelPrimitive_of_sum_abs_le_one). Beyond that, [a side-intersection criterion](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Polygon/EdgeIntersection/Criterion.html#TauCeti.schwarzChristoffelCompactifiedBoundary_injective_of_edge_intersections) reduces simplicity of the boundary chain to how its sides meet.

- **The Jordan index theorem for absolutely continuous curves.** In the contour library, a simple closed absolutely continuous curve has a sign `±1` equal to its winding number at every inside point, and winding number 0 outside. This is the rectifiable half of the README's §5.6.

### Roadmap coverage

Layer 3 is done. Layers 0, 1, 2 and 4 have their classical theorems but not the README's owned additions: Layer 0 lacks the argument principle for integer cycles and the finite zero counts and multiplicity transport §5.7 consumes; Layer 1 lacks the compactness criterion as closed plus locally bounded in `C(↥Ω, ℂ)` and closedness of normalized univalent families; Layer 2 lacks the Cayley comparison `dist_ℍ = 2·hyperbolicDist`; Layer 4 has charted reflection and removability but no straightening chart built from an analytic arc and no removability of a rectifiable arc. Layer 5 has the Jordan curve theorem and the Carathéodory correspondence, but its winding-number side stops at the absolutely continuous Jordan index: the index of a continuous loop, the general Jordan index theorem, the continuous-boundary argument principle and Darboux injectivity are absent. Layer 6 has the bounded, sector-end and half-strip-end formulas with uniqueness, but lacks orientation and turning data for a simple Mathlib `Polygon`, source infinity at a finite vertex, the bounded disc formula and the affine-stabilizer statement for unbounded maps.

## The frontier

- **The index of a continuous loop.** A degree for loops in the circle with homotopy invariance exists, as does an argument lift for continuous curves; what remains is the index in `ℂ` itself, its comparison with the contour winding number, and a proximity criterion for continuous loops.

- **The Jordan index theorem and Darboux injectivity.** Once that index exists, the route of §§5.6–5.8 runs through Riemann maps and interior circles, and needs the degree of a circle homeomorphism to be ±1.

- **Source infinity at a finite vertex.** An inversion covariance for the primitive exists, but its limit at infinity is not identified with the vertex, and the restricted exponent sum `−2 − eₖ` is not stated.

- **The Cayley comparison and the cycle-level argument principle.** Both are short adapters over the one-point Cayley identity and the cycle residue theorem.

- **Rectifiable-arc removability and analytic straightening charts.** The Morera grid argument of §4.3 and the chart construction of §4.1 have no partial work yet; reflection across analytic boundary arcs (§5.10) waits on the charts.

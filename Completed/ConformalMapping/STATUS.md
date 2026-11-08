<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7","ts":"2026-11-08T16:58:25+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","state":"done"},{"id":"L6","remaining":"a checkable univalence criterion for the converse direction with arbitrary nonconvex exponent data","state":"done"}],"readme_sha":"72051c0bf42cdc61e7e565d93737d1147e5fe2ee3e7ffd36d9c89d51095287d1","roadmap":"ConformalMapping","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `a4fcb57` (2026-11-08T16:58:25+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer's milestone is proved: the Riemann mapping theorem, the plane Jordan curve theorem with Carathéodory's correspondence for Jordan domains, and Schwarz–Christoffel for bounded polygons and for polygonal domains with any finite number of ends. What remains is outside the layer milestones. The converse direction of Schwarz–Christoffel has no general univalence criterion, and the general prime-end theorem, a deferred follow-on, has not been proved.

### Named results

- **The Riemann mapping theorem** — every nonempty, simply connected, proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc. Normalized and uniqueness forms are included ([`riemannMapping`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)).

- **The Jordan curve theorem** — the complement of a plane Jordan curve has exactly two connected components: a connected inside `filledHull C \ C` and an unbounded outside, each with the curve as frontier ([`natCard_connectedComponents_compl_eq_two`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/PlaneSeparation/Inside.html#TauCeti.IsJordanCurve.natCard_connectedComponents_compl_eq_two)). There is a Riemann-sphere form as well.

- **Carathéodory's boundary correspondence** — a Riemann map of a bounded Jordan domain extends to a homeomorphism from the closed disc onto the closure of the domain ([`exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)). Continuous extension holds exactly when the boundary is locally connected, and the outside of a Jordan curve has a matching exterior form.

- **The Schwarz–Christoffel theorem** — a bounded domain with a polygonal Jordan-curve boundary, with reentrant corners allowed, is the image of the upper half-plane under an affine image of the Schwarz–Christoffel primitive. Three prevertices determine the map ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier)).

- **Schwarz–Christoffel with several ends** — the same holds for a simply connected unbounded domain bounded by segments and rays which, far out, splits into disjoint sector, half-strip or half-strip-exterior ends, and the turning exponents then sum to −2 ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_ends`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/MultipleEnds/PolygonalDomain.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_ends)).

### Notable definitions and infrastructure

- **The pre-Schwarzian derivative `f''/f'`** drives every Schwarz–Christoffel proof. [Its rigidity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/PreSchwarzian.html#TauCeti.exists_eqOn_const_mul_add_iff_logDeriv_deriv_eqOn) says that two maps with the same pre-Schwarzian agree up to an affine change, and its residues at corners and ends fix the exponents.

- **Prime ends and their compactification.** A [prime end](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/PrimeEnd/Basic.html#TauCeti.PrimeEnd) is a class of null chains of crosscuts, and each one has an impression in the boundary. Adjoining the prime ends to a domain gives [the prime-end compactification](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/PrimeEnd/Compactification.html#TauCeti.PrimeEndCompactification), which for the disc is the closed disc. The prime ends of a Jordan domain are already known to be the points of the circle.

- **Radial limits.** A length–area argument along rays shows that [a conformal map onto a region of finite area has radial limits almost everywhere](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/RadialLimit.html#TauCeti.ae_exists_tendsto_circleMap_of_injOn_of_volume_image_ne_top). This is the measure-theoretic boundary input that the topological Carathéodory theory does without.

### Roadmap coverage

All seven layers are done. L0 has Rouché, Hurwitz, Morera and the open-mapping degree; L1 has Montel and Vitali. L2 has Schwarz–Pick and Poincaré-disc geometry, and L3 the Riemann mapping theorem. L4 has reflection across lines, analytic arcs and circles, Painlevé removability and monodromy. L5 is now done: alongside the Jordan-domain correspondence, it has the two-component Jordan curve theorem with connected inside and frontier statements. L6 covers bounded polygons and any finite number of ends, with angle sums, disc forms and prevertex uniqueness. Its converse direction, deciding when given exponent data yields a univalent map, is settled only for convex data, for data with a small total turning, and for data whose simplicity has been certified.

## The frontier

- **The prime-end theorem beyond Jordan domains.** Carathéodory's prime-end theorem would make a Riemann map extend to a homeomorphism from the closed disc onto the prime-end compactification of any bounded simply connected domain. So far the compactification is known to be compact and Hausdorff only for the disc itself, and the correspondence is known only for Jordan domains.

- **Univalence for general exponent data.** The converse of Schwarz–Christoffel still lacks a checkable criterion that the boundary chain is simple for arbitrary nonconvex data.

- **Mathlib reconciliation.** If Mathlib's Riemann mapping theorem lands, the roadmap calls for deleting the local one and re-proving L0–L2 from Mathlib's lemmas. The supplied material does not show that this has happened.

<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"9fc5d5a87d00cb696e606ccdae66420cc837c05e","ts":"2026-10-19T21:24:00Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","remaining":"a general Jordan curve has exactly two complementary components (connected inside); known only for curves with a straight piece","state":"partial"},{"id":"L6","remaining":"existence for several vertices at infinity beyond the strip, and a general univalence criterion for the converse","state":"done"}],"readme_sha":"f7cf48b5b4ddf0ca37533fb7496b9cefb6183c3ae2cc3ff562bb73e8d63d5465","roadmap":"ConformalMapping","to_sha":"9fc5d5a87d00cb696e606ccdae66420cc837c05e"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `9fc5d5a` (2026-10-19T21:24:00Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The central theorems are proved: the Riemann mapping theorem, Carathéodory's correspondence for Jordan domains, and Schwarz–Christoffel for bounded polygons and for polygons with one vertex at infinity of any kind. Two things are still partial. Schwarz–Christoffel with several vertices at infinity exists only for a strip. The Jordan-curve topology that the revised roadmap places under L5 has separation but not, in general, exactly two complementary components. Prime ends have barely begun.

### Named results

- **The Riemann mapping theorem** — every nonempty, simply connected, proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc, with normalized and uniqueness forms ([`riemannMapping`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)).

- **Carathéodory's boundary correspondence** — a Riemann map of a bounded Jordan domain extends to a homeomorphism from the closed disc onto the closure of the domain ([`exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)). The continuity half holds exactly when the boundary is locally connected ([`exists_continuousOn_closedBall_eqOn_iff_locallyConnectedSpace_frontier`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Caratheodory.html#TauCeti.exists_continuousOn_closedBall_eqOn_iff_locallyConnectedSpace_frontier)).

- **The Schwarz–Christoffel theorem** — a bounded domain whose boundary is a polygonal Jordan curve, reentrant corners allowed, is the image of the upper half-plane under an affine image of the Schwarz–Christoffel primitive. Three fixed prevertices make it unique ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier)).

- **Schwarz–Christoffel with a vertex at infinity** — the same holds for an unbounded polygonal domain whose boundary is a Jordan curve through infinity. Far out the domain may be a sector of opening below 2π ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty)), a half-strip, or the exterior of a half-strip ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_of_halfStripExterior`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_of_halfStripExterior)). In this setting two prevertices determine the map.

- **The Schwarz reflection principle** — a holomorphic function that is real on a symmetric piece of the real axis continues by conjugation. There are line, analytic-arc and circle variants ([`differentiableOn_schwarzReflection_of_symmetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric)).

### Notable definitions and infrastructure

- **The pre-Schwarzian derivative `f''/f'`** drives every Schwarz–Christoffel proof. [Its rigidity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/PreSchwarzian.html#TauCeti.exists_eqOn_const_mul_add_iff_logDeriv_deriv_eqOn) says that maps with equal pre-Schwarzians agree up to an affine change. Its residue at each kind of corner or end then fixes the exponents.

- **The Jordan separation theorem.** [A Jordan curve disconnects the plane](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/PlaneSeparation/JordanCurve.html#TauCeti.IsJordanCurve.not_isPreconnected_compl), and [each complementary component has the whole curve as its frontier](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/PlaneSeparation/JordanCurve.html#TauCeti.IsJordanCurve.frontier_connectedComponentIn). Both come by way of Janiszewski's theorems, and they supply the plane topology that the boundary theory consumes.

- **The spherical Schwarz–Christoffel boundary.** [This boundary map](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/SphericalExtension.html#TauCeti.schwarzChristoffelSphereBoundary) sends logarithmic prevertices to infinity. With it, covering and degree arguments apply to primitives with any number of ends, and a single boundary value with exactly one parameter forces univalence.

### Roadmap coverage

L0–L4 are done. They cover Rouché, Hurwitz, Morera and the argument principle; Montel and Vitali; Schwarz–Pick and Poincaré-disc geometry; the Riemann mapping theorem; and reflection, removability and monodromy. L5 is partial. Carathéodory's theorem for Jordan domains is proved, but the revised roadmap also asks that a general planar Jordan curve have exactly two complementary components with a connected inside. So far that is shown only for curves with a straight piece. Prime ends are an explicitly deferred follow-on. L6 is done for bounded polygons and for one vertex at infinity of any opening, with angle sums, disc forms and prevertex uniqueness. Several vertices at infinity are covered only for the strip, and the converse direction has univalence criteria but no general one for nonconvex data.

## The frontier

- **Several vertices at infinity.** The existence theorem for polygonal domains with more than one end is missing. The map side (spherical boundary, covering, degree-one criteria) and the domain side ([matching accesses to infinity with ends](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Unbounded/EndMatching.html#TauCeti.exists_injective_end_of_inverted_coordinate_eq_zero)) are both in place. Only the strip is done so far.

- **The Jordan curve theorem in full.** Separation and frontier equal to the curve are proved. What remains is that the inside of an arbitrary Jordan curve is connected, so that there are exactly two components. Today this is proved only for curves that are straight somewhere.

- **Univalence for general exponent data.** The converse still lacks a checkable criterion that the boundary chain is simple for arbitrary nonconvex data. What exists covers small total turning, vertex-height checks, or one boundary value with a unique parameter.

- **Prime ends.** Correspondence beyond Jordan domains needs its own theory. So far only crosscuts and their basic API exist.

- **Mathlib reconciliation.** If Mathlib's Riemann mapping theorem lands, the roadmap calls for deleting the local one and re-proving L0–L2 from Mathlib's lemmas. The supplied material does not show that this has happened.

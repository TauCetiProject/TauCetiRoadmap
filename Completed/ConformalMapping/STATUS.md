<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","remaining":"a plane Jordan curve has exactly two complementary components with connected inside; known only for curves with a straight piece","state":"partial"},{"id":"L6","remaining":"existence for several vertices at infinity beyond the strip, and a general univalence criterion for the converse","state":"done"}],"readme_sha":"f7cf48b5b4ddf0ca37533fb7496b9cefb6183c3ae2cc3ff562bb73e8d63d5465","roadmap":"ConformalMapping","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The central theorems are proved: the Riemann mapping theorem, Carathéodory's correspondence for Jordan domains, and Schwarz–Christoffel for bounded polygons and for polygons with one vertex at infinity of any kind. Two things remain partial. Schwarz–Christoffel with several vertices at infinity is proved only for a strip. The Jordan-curve topology that the roadmap places under L5 is not yet stated for plane Jordan curves in its two-component form. Prime ends, a deferred follow-on, now have a definition and the Jordan-domain case.

### Named results

- **The Riemann mapping theorem**: every nonempty, simply connected, proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc. Normalized and uniqueness forms are included ([`riemannMapping`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)).

- **Carathéodory's boundary correspondence**: a Riemann map of a bounded Jordan domain extends to a homeomorphism from the closed disc onto the closure of the domain ([`exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)). The continuity half holds exactly when the boundary is locally connected ([`exists_continuousOn_closedBall_eqOn_iff_locallyConnectedSpace_frontier`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Caratheodory.html#TauCeti.exists_continuousOn_closedBall_eqOn_iff_locallyConnectedSpace_frontier)).

- **The Schwarz–Christoffel theorem**: a bounded domain whose boundary is a polygonal Jordan curve, with reentrant corners allowed, is the image of the upper half-plane under an affine image of the Schwarz–Christoffel primitive, and three fixed prevertices make the map unique ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier)).

- **Schwarz–Christoffel with a vertex at infinity**: the same holds for an unbounded polygonal Jordan domain on the Riemann sphere. Far out, the domain may be a sector ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty)), a half-strip, or the exterior of a half-strip. Two prevertices then determine the map.

- **The Schwarz reflection principle**: a holomorphic function that is real on a symmetric piece of the real axis continues by conjugation, with line, analytic-arc and circle variants ([`differentiableOn_schwarzReflection_of_symmetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric)).

### Notable definitions and infrastructure

- **The pre-Schwarzian derivative `f''/f'`** drives every Schwarz–Christoffel proof. [Its rigidity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/PreSchwarzian.html#TauCeti.exists_eqOn_const_mul_add_iff_logDeriv_deriv_eqOn) says that maps with equal pre-Schwarzians agree up to an affine change. Its residues at corners and ends then fix the exponents.

- **Prime ends.** A [prime end](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/PrimeEnd/Basic.html#TauCeti.PrimeEnd) is a class of null chains of crosscuts. The disc's prime ends are the points of the circle, maps injective on the closure transport them, and so [a Jordan domain's prime ends are the points of the circle](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/PrimeEnd/JordanDomain.html#TauCeti.exists_bijective_primeEnd_map_unitDiscPrimeEnd_of_isJordanCurve_frontier). This rests on [a crosscut of a simply connected domain having exactly two sides](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/PrimeEnd/Crosscut/TwoSides.html#Path.IsCrosscut.natCard_connectedComponents_sdiff_range_eq_two).

- **Plane separation.** [A Jordan curve disconnects the plane](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/PlaneSeparation/JordanCurve.html#TauCeti.IsJordanCurve.not_isPreconnected_compl), and it also disconnects the Riemann sphere. [Each complementary component has the whole curve as its frontier](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/PlaneSeparation/JordanCurve.html#TauCeti.IsJordanCurve.frontier_connectedComponentIn). Separately, the library has [the Jordan–Brouwer theorem](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/JordanBrouwer.html#TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two), which says an embedded sphere of codimension one has a complement with exactly two path components.

### Roadmap coverage

L0–L4 are done: Rouché, Hurwitz, Morera and the argument principle; Montel and Vitali; Schwarz–Pick and Poincaré-disc geometry; the Riemann mapping theorem; reflection, removability and monodromy. L5 is partial. Carathéodory's theorem for Jordan domains is proved. The roadmap also asks that a plane Jordan curve have exactly two complementary components, with an open, bounded, connected inside `filledHull C \ C`. In that form it is proved only for curves with a straight piece. L6 is marked done. It covers bounded polygons and one vertex at infinity of any opening, with angle sums, disc forms and prevertex uniqueness. Several vertices at infinity are covered only for the strip, and the converse direction has no general univalence criterion for nonconvex data.

## The frontier

- **The Jordan curve theorem in the roadmap's form.** The plane statement still needs a connected inside, and so exactly two components, for an arbitrary Jordan curve. The general Jordan–Brouwer theorem already gives two path components. What remains looks like a transfer from the sphere to `IsJordanCurve` and `filledHull`, rather than new topology.

- **Several vertices at infinity.** The existence theorem for polygonal domains with more than one end is missing. The map side (spherical boundary, covering, degree-one criteria) and the domain side (matching ends to zeros of the inverted coordinate, local end models) are in place. Only the strip is done.

- **The prime-end theorem beyond Jordan domains.** Carathéodory's theorem for prime ends says that a Riemann map induces a bijection from the circle to the prime ends of any bounded simply connected domain. So far it is known only where the map already extends homeomorphically.

- **Univalence for general exponent data.** The converse still lacks a checkable criterion that the boundary chain is simple for arbitrary nonconvex data.

- **Mathlib reconciliation.** If Mathlib's Riemann mapping theorem lands, the roadmap calls for deleting the local one and re-proving L0–L2 from Mathlib's lemmas. The supplied material does not show that this has happened.

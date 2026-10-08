<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","state":"done"},{"id":"L6","remaining":"ends at infinity with parallel sides or several vertices at infinity, and a general univalence criterion for the converse beyond convex, small-turning or certified data","state":"done"}],"readme_sha":"70c388a36b87d95e4d590ef4ba48555eee71e7d957857aa0bfb76ae16a468e84","roadmap":"ConformalMapping","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All seven layers have their central theorems. These are the Riemann mapping summit, Carathéodory's correspondence for Jordan domains, and the Schwarz–Christoffel theorem, which now covers bounded polygons and polygons with one vertex at infinity that opens as a sector. Beyond the stated milestones, three things remain open: ends with parallel sides, a general univalence criterion for the converse, and prime ends.

### Named results

- **The Riemann mapping theorem** — every nonempty, simply connected, proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc, with normalized and uniqueness forms ([`riemannMapping`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)).

- **Carathéodory's boundary correspondence** — a Riemann map of a bounded Jordan domain extends to a homeomorphism between the closed disc and the closure of the domain ([`exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)).

- **The Schwarz–Christoffel theorem** — a bounded simply connected domain whose frontier is a polygonal Jordan curve, possibly with reentrant corners, is the image of the upper half-plane under an affine image of the Schwarz–Christoffel primitive. The prevertices go to the vertices, and they are unique once three are fixed ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier)).

- **Schwarz–Christoffel with a vertex at infinity** — the same conclusion holds for an unbounded polygonal domain whose frontier is a Jordan curve through infinity on the Riemann sphere and which far out looks like a sector of opening `βπ` with `0 < β < 2`. Its finite exponents sum to `β − 1` ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty)).

- **The Schwarz reflection principle** — a holomorphic function that is real on a symmetric piece of the real axis continues by conjugation. There are also line, analytic-arc and circle variants ([`differentiableOn_schwarzReflection_of_symmetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric)).

### Notable definitions and infrastructure

- **The pre-Schwarzian derivative `f''/f'`** drives every Schwarz–Christoffel proof. [Its rigidity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/PreSchwarzian.html#TauCeti.exists_eqOn_const_mul_add_iff_logDeriv_deriv_eqOn) says that maps with equal pre-Schwarzians agree up to an affine change. Together with reflection across edges and the residues at corners, this yields the [Schwarz–Christoffel formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PolygonalDomain.html#TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_domain).

- **[The boundary correspondence between two conformal maps onto a Jordan domain](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/CrossRatio.html#TauCeti.exists_sub_I_div_add_I_eq_unitDiscStandardAutomorphismFormula_of_tendsto)** is a Möbius transformation. As a result, boundary cross-ratios are conformal invariants, and three boundary values determine the map. This is the source of prevertex uniqueness.

- **Holomorphic square roots.** [A plane domain is simply connected exactly when every nonvanishing holomorphic function on it has a holomorphic square root](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.isSimplyConnected_iff_hasHolomorphicSquareRoots). The Riemann mapping proof now runs on that property, and domains without holes are shown to have it.

### Roadmap coverage

L0–L4 are done. They cover the local-mapping theorems (Rouché, Hurwitz, Morera, the argument principle), Montel and Vitali, Schwarz–Pick and Poincaré-disc geometry, the Riemann mapping theorem, and reflection, removability and monodromy. L5 is done at its stated Jordan-domain generality, and prime ends were explicitly deferred. L6 is done for bounded polygons: it has the forward theorem and formula, the angle sum, the disc form, and uniqueness of prevertices. It also covers polygons with one vertex at infinity whose end is a proper sector. The converse is proved unconditionally for convex polygons and when the absolute turning exponents sum to at most one. Otherwise it needs a simple boundary or finite vertex-height checks.

## The frontier

- **Ends with parallel sides.** The domain-side theorem at infinity needs the end to be a sector of opening strictly between 0 and 2π, so half-strips and strips, where the total exponent is −1, are excluded. On the map side, the logarithmic case is understood: the outer edges [lie on horizontal lines π apart](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Infinity/Parallel.html#TauCeti.disjoint_schwarzChristoffelBoundary_outer_images_of_sum_eq_neg_one), and the boundary is simple under edge-intersection checks. Several vertices at infinity are not handled.

- **Univalence for general exponent data.** For total exponent at least −1, the primitive is [a bijection onto any simply connected region containing its image and avoiding its boundary values](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Infinity/Covering.html#TauCeti.bijOn_schwarzChristoffelPrimitive_of_subset_of_neg_one_le_sum). Still missing is a checkable criterion for arbitrary nonconvex data that goes beyond small total turning or explicit vertex-height checks.

- **Prime ends.** Boundary correspondence beyond Jordan domains needs its own definitions and theory. This is a follow-on target, not unfinished L5 work.

- **Mathlib reconciliation.** If Mathlib's Riemann mapping theorem lands, the roadmap calls for deleting the local one and re-proving the L0–L2 prerequisites from Mathlib's lemmas. The supplied material does not show this has happened.

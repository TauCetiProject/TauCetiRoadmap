<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"b8db0474eb2d3d0831a82689f429f61a3129b234","ts":"2026-10-08T05:52:52Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","state":"done"},{"id":"L6","remaining":"existence for ends of opening 2 pi, several vertices at infinity, and a general univalence criterion for the converse","state":"done"}],"readme_sha":"70c388a36b87d95e4d590ef4ba48555eee71e7d957857aa0bfb76ae16a468e84","roadmap":"ConformalMapping","to_sha":"b8db0474eb2d3d0831a82689f429f61a3129b234"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `b8db047` (2026-10-08T05:52:52Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All seven layers have their central theorems: the Riemann mapping theorem, Carathéodory's correspondence for Jordan domains, and the Schwarz–Christoffel theorem. Schwarz–Christoffel now covers bounded polygons and polygons with one vertex at infinity whose end is a proper sector or a half-strip. Still open are ends of opening 2π, several vertices at infinity, a general univalence criterion for the converse, and prime ends, of which only crosscuts exist so far.

### Named results

- **The Riemann mapping theorem** — every nonempty, simply connected, proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc, with normalized and uniqueness forms ([`riemannMapping`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)).

- **Carathéodory's boundary correspondence** — a Riemann map of a bounded Jordan domain extends to a homeomorphism between the closed disc and the closure of the domain ([`exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)).

- **The Schwarz–Christoffel theorem** — a bounded simply connected domain bounded by a polygonal Jordan curve, possibly with reentrant corners, is the image of the upper half-plane under an affine image of the Schwarz–Christoffel primitive. The prevertices go to the vertices, and they are unique once three are fixed ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier)).

- **Schwarz–Christoffel with a vertex at infinity** — the same conclusion holds for an unbounded polygonal domain whose frontier is a Jordan curve through infinity on the Riemann sphere, if far out the domain is either a sector of opening `βπ` with `0 < β < 2` ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty)) or a half-strip ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_of_halfStrip`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_of_halfStrip)). The finite exponents then sum to `β − 1` or to `−1`, respectively.

- **The Schwarz reflection principle** — a holomorphic function that is real on a symmetric piece of the real axis continues by conjugation. There are also line, analytic-arc and circle variants ([`differentiableOn_schwarzReflection_of_symmetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric)).

### Notable definitions and infrastructure

- **The pre-Schwarzian derivative `f''/f'`** drives every Schwarz–Christoffel proof. [Its rigidity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/PreSchwarzian.html#TauCeti.exists_eqOn_const_mul_add_iff_logDeriv_deriv_eqOn) says maps with equal pre-Schwarzians agree up to an affine change. Its asymptotics at each kind of end then fix the formula, for example [at an end of opening 2π](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/HalfStripExterior.html#TauCeti.tendsto_mul_logDeriv_deriv_upperHalfPlaneSet_of_halfStripExterior).

- **[The boundary correspondence between two conformal maps onto a Jordan domain](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/CrossRatio.html#TauCeti.exists_sub_I_div_add_I_eq_unitDiscStandardAutomorphismFormula_of_tendsto)** is a Möbius transformation. As a result, three boundary values determine the map, and this is where prevertex uniqueness comes from.

- **Holomorphic square roots.** [A plane domain is simply connected exactly when every nonvanishing holomorphic function on it has a holomorphic square root](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.isSimplyConnected_iff_hasHolomorphicSquareRoots). The Riemann mapping proof runs on that property.

### Roadmap coverage

L0–L4 are done. They cover Rouché, Hurwitz, Morera and the argument principle; Montel and Vitali; Schwarz–Pick and Poincaré-disc geometry; the Riemann mapping theorem; and reflection, removability and monodromy. L5 is done at its stated Jordan-domain generality, and prime ends are an explicitly deferred follow-on. L6 is done for bounded polygons, with the forward theorem, the angle sum, the disc form and uniqueness of prevertices. It also covers one vertex at infinity with a sector or half-strip end. For the converse, the primitive is [a bijection onto the region its boundary encloses whenever that boundary is simple and proper](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Infinity/SimpleBoundary.html#TauCeti.bijOn_schwarzChristoffelPrimitive_of_simple_boundary_of_neg_one_le_sum), for total exponent from −1 to 1. Simplicity is proved unconditionally only for convex data and for small total turning.

## The frontier

- **Ends of opening 2π.** When the end is the exterior of a half-strip, [the formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PolygonalDomain.html#TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_halfStripExterior_polygonal_domain) is proved for a map that is given. The existence theorem for such domains, analogous to the sector and half-strip cases, is missing.

- **Several vertices at infinity.** Strips and polygons with more than one end are not handled. The map-side groundwork is in place: [at a finite prevertex of total exponent −1 the primitive escapes to infinity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/LogarithmicEnd.html#TauCeti.tendsto_schwarzChristoffelPrimitive_cobounded_of_prevertex_sum_eq_neg_one) with a logarithmic singularity.

- **Univalence for general exponent data.** What is still needed is a checkable criterion that the boundary chain is simple for arbitrary nonconvex data, going beyond small total turning or explicit vertex-height checks.

- **Prime ends.** Correspondence beyond Jordan domains needs its own theory. So far only [crosscuts](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/PrimeEnd/Crosscut.html#Path.IsCrosscut) and their basic API exist.

- **Mathlib reconciliation.** If Mathlib's Riemann mapping theorem lands, the roadmap calls for deleting the local one and re-proving the L0–L2 prerequisites from Mathlib's lemmas. The supplied material does not show this has happened.

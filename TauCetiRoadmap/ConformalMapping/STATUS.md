<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057","ts":"2026-09-30T00:20:29Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","state":"done"},{"id":"L6","remaining":"polygons with a vertex at infinity, and a general univalence criterion for the converse beyond convex or certified polygons","state":"done"}],"readme_sha":"70c388a36b87d95e4d590ef4ba48555eee71e7d957857aa0bfb76ae16a468e84","roadmap":"ConformalMapping","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `dec7a58` (2026-09-30T00:20:29Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All seven layers now have their central theorems: the Riemann mapping summit, Carathéodory's correspondence for Jordan domains, and now the Schwarz–Christoffel theorem for bounded polygonal Jordan domains. What remains is either outside the stated milestones (prime ends, unbounded polygons, a general univalence criterion for the converse) or bookkeeping against Mathlib's own Riemann mapping work.

### Named results

- **The Riemann mapping theorem** — every nonempty, simply connected, proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc, with normalized and uniqueness forms ([`riemannMapping`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)).

- **Carathéodory's boundary correspondence** — a Riemann map of a bounded Jordan domain extends to a homeomorphism between the closed disc and the closure of the domain ([`exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)).

- **The Schwarz–Christoffel theorem** — a bounded simply connected domain with a polygonal Jordan-curve frontier, whose corners may be reentrant, is the image of the upper half-plane under an affine image of the Schwarz–Christoffel primitive, with prevertices sent to vertices ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier)).

- **The Schwarz reflection principle** — a holomorphic function that is real on a symmetric piece of the real axis continues by conjugation, with line, analytic-arc and circle variants ([`differentiableOn_schwarzReflection_of_symmetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric)).

- **The monodromy theorem** — continuation of a germ throughout a simply connected domain yields a single global holomorphic function ([`continuesInside_iff_exists_analyticOnNhd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/GlobalBranch.html#TauCeti.continuesInside_iff_exists_analyticOnNhd)).

### Notable definitions and infrastructure

- **The pre-Schwarzian derivative `f''/f'`** drives the Schwarz–Christoffel proof. [Its rigidity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/PreSchwarzian.html#TauCeti.exists_eqOn_const_mul_add_iff_logDeriv_deriv_eqOn) says that equal pre-Schwarzians means maps equal up to an affine change, and this turns reflection across edges and corner residues into the [Schwarz–Christoffel formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PolygonalDomain.html#TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_domain).

- **[The Schwarz–Christoffel polygon](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Polygon/Basic.html#TauCeti.schwarzChristoffelPolygon)** packages the boundary values at the prevertices and at infinity as a closed edge chain. This is where the univalence criteria for the converse direction are stated.

- **[The étalé space of holomorphic germs](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/HolomorphicSheaf.html#TauCeti.holomorphicSheaf)** turns analytic continuation into path lifting.

### Roadmap coverage

L0–L4 are done: the local-mapping theorems (Rouché, Hurwitz, Morera, the argument principle), Montel and Vitali, Schwarz–Pick and Poincaré-disc geometry, the Riemann mapping theorem, and reflection, removability and monodromy. L5 is done at its stated Jordan-domain generality; prime ends were explicitly deferred. L6 is done for bounded polygons. The forward theorem and formula are proved. The converse is proved unconditionally for convex polygons, and for nonconvex ones under a simple-boundary hypothesis or finite vertex-height checks. Polygons with a vertex at infinity are not covered by the forward theorem.

## The frontier

- **Unbounded polygons.** Extend the forward Schwarz–Christoffel theorem to polygonal domains with a vertex at infinity. The primitive already has a vertex at infinity and unbounded boundary edges, but the domain-side theorem assumes boundedness.

- **Univalence for general exponent data.** Find a checkable criterion that makes the Schwarz–Christoffel primitive univalent for arbitrary nonconvex data. Today the converse needs either simplicity of the boundary or explicit vertex-separation and height checks.

- **Uniqueness of Schwarz–Christoffel parameters.** Prevertices can be normalized to put one at `0` and another at distance `1`, but no uniqueness statement for the resulting parameters has been established.

- **Prime ends.** Boundary correspondence beyond Jordan domains needs its own definitions and theory. This is a follow-on target, not unfinished L5 work.

- **Mathlib reconciliation.** If Mathlib's Riemann mapping theorem lands, the roadmap calls for deleting the local one and re-proving the L0–L2 prerequisites from Mathlib's lemmas. The supplied material does not show this has happened.

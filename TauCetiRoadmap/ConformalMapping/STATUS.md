<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57","ts":"2026-09-27T20:34:44+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","state":"done"},{"id":"L6","state":"done"}],"readme_sha":"70c388a36b87d95e4d590ef4ba48555eee71e7d957857aa0bfb76ae16a468e84","roadmap":"ConformalMapping","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `b1ab119` (2026-09-27T20:34:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Riemann mapping theorem and the stated milestones L0–L6 are established, including Schwarz–Christoffel maps onto bounded polygonal Jordan domains. Prime-end correspondence lies beyond the stated boundary milestone; reconciliation with the Mathlib Riemann mapping work remains unresolved in the supplied history.

### Named results

- **[The Riemann mapping theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)** — every nonempty simply connected proper open subset of `ℂ` has a holomorphic bijection onto the unit disc.

- **[Carathéodory’s boundary correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)** — for a bounded Jordan domain, a Riemann map extends to a homeomorphism of closures.

- **[The Schwarz–Christoffel theorem for bounded polygonal Jordan domains](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier)** — an affine image of a Schwarz–Christoffel primitive maps the upper half-plane bijectively onto the domain.

- **[The Schwarz–Christoffel formula for polygonal domains](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PolygonalDomain.html#TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_domain)** — a conformal map with the specified half-plane boundary and corner-sector behavior is an affine image of the primitive.

- **[The monodromy theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/GlobalBranch.html#TauCeti.continuesInside_iff_exists_analyticOnNhd)** — analytic continuation throughout a simply connected domain yields a global holomorphic function.

### Notable definitions and infrastructure

- **[The Schwarz–Christoffel integrand](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Integrand.html#TauCeti.schwarzChristoffelIntegrand)** and **[normalized primitive](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Primitive.html#TauCeti.schwarzChristoffelPrimitive)** turn prevertices and exponents into the explicit holomorphic map used by the polygon theorems.

- **[The compactified Schwarz–Christoffel boundary map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Compactification.html#TauCeti.schwarzChristoffelCompactifiedBoundary_injective_iff)** records the value at infinity and lets boundary simplicity control the primitive’s global image.

### Roadmap coverage

L0–L3 are done: local mapping, normal families, disc geometry, and the Riemann mapping theorem. L4 reflection and monodromy and L5 Jordan-domain boundary correspondence are done. L6 is done at the roadmap’s polygon-mapping milestone: global bijections and a converse formula cover bounded polygonal Jordan domains under their stated boundary and corner hypotheses, beyond the convex case. Prime ends are outside L5’s stated scope.

## The frontier

- **Prime-end boundary correspondence.** Develop definitions and a boundary-extension theorem beyond Jordan domains if that follow-on target is taken up; the present boundary theorem assumes a Jordan curve.

- **Mathlib reconciliation.** Determine whether the Mathlib Riemann mapping work described in the roadmap has landed, then refactor the local theorem and its consumers if it has; the supplied material does not settle that dependency.

<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b","ts":"2026-09-29T08:26:13+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","state":"done"},{"id":"L6","remaining":"global injectivity and polygon image of the primitive; realization of prescribed polygons","state":"partial"}],"readme_sha":"70c388a36b87d95e4d590ef4ba48555eee71e7d957857aa0bfb76ae16a468e84","roadmap":"ConformalMapping","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `163ce80` (2026-09-29T08:26:13+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Riemann mapping summit and L0–L5 are established, including Jordan-domain boundary correspondence. L6 has a developed Schwarz–Christoffel local and boundary theory, but no global theorem mapping onto a prescribed polygon.

### Named results

- **[The Riemann mapping theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)** — every nonempty simply connected proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc, with normalized and uniqueness forms.

- **[Carathéodory’s Jordan-domain boundary correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)** — a Riemann map of a bounded Jordan domain extends to a homeomorphism of closures; a [closed upper-half-plane form](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/UpperHalfPlane.html#TauCeti.exists_continuousOn_bijOn_upperHalfPlaneSet_of_isJordanCurve_frontier) is also available.

- **[The Schwarz reflection principle](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric)** — a holomorphic function real on a symmetric real boundary continues by conjugation, with line, analytic-arc and circle variants.

- **[The monodromy theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/GlobalBranch.html#TauCeti.continuesInside_iff_exists_analyticOnNhd)** — continuation from one germ throughout a simply connected domain produces a global holomorphic function.

- **[The Schwarz–Christoffel differential equation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Converse.html#TauCeti.exists_eqOn_const_mul_schwarzChristoffelPrimitive_add_iff)** — for a holomorphic map with nonvanishing derivative on the upper half-plane, the prescribed partial-fraction pre-Schwarzian is equivalent to being a nonzero affine transform of the normalized primitive.

### Notable definitions and infrastructure

- **[The Schwarz–Christoffel integrand](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Integrand.html#TauCeti.schwarzChristoffelIntegrand) and [normalized primitive](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Primitive.html#TauCeti.schwarzChristoffelPrimitive)** encode prevertices and turning exponents in a locally conformal upper-half-plane map.

- **[The canonical boundary map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Boundary.html#TauCeti.schwarzChristoffelBoundary)** records prevertex values and straight boundary edges; the [boundary density](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Edge.html#TauCeti.schwarzChristoffelDensity) supplies their real speed away from prevertices.

- **[The étalé space of holomorphic germs](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/HolomorphicSheaf.html#TauCeti.holomorphicSheaf)** makes analytic continuation along paths accessible through continuous lifts.

### Roadmap coverage

L0–L4 are done: local-mapping theorems, Montel and Vitali, Schwarz–Pick and Poincaré geometry, the Riemann mapping theorem, and reflection, removability and monodromy. L5 is done at the roadmap’s Jordan-domain generality; prime ends are a separate follow-on. L6 is partial: its primitive, boundary edges, angle and corner asymptotics, and pre-Schwarzian characterization are present, while global polygon mapping and realization of prescribed polygons remain unproved in the supplied evidence.

## The frontier

- **Global Schwarz–Christoffel polygon map.** Prove that the primitive is globally injective and that its image is the polygon bounded by its edge chain; local conformality and injective individual edges do not establish this.

- **Polygonal converse.** Extend the local corner residue analysis to show that a conformal map onto a polygon satisfies the Schwarz–Christoffel pre-Schwarzian equation globally, so the differential-equation characterization applies.

- **The parameter problem.** For a prescribed polygon, establish prevertices and exponents realizing its vertices and angles; no such existence theorem is established here.

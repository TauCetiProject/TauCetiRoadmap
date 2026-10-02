<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d","ts":"2026-10-02T05:38:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","state":"done"},{"id":"L6","remaining":"polygons with a vertex at infinity (domain-side theorem), and a general univalence criterion for the converse beyond convex or certified polygons","state":"done"}],"readme_sha":"70c388a36b87d95e4d590ef4ba48555eee71e7d957857aa0bfb76ae16a468e84","roadmap":"ConformalMapping","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `d449639` (2026-10-02T05:38:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All seven layers have their central theorems: the Riemann mapping summit, Carathéodory's correspondence for Jordan domains, and the Schwarz–Christoffel theorem for bounded polygonal Jordan domains, which is now unique once three prevertices are fixed. What remains lies outside the stated milestones: polygons with a vertex at infinity, a general univalence criterion for the converse, and prime ends. There is also the bookkeeping against Mathlib's own Riemann mapping work.

### Named results

- **The Riemann mapping theorem** — every nonempty, simply connected, proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc, with normalized and uniqueness forms ([`riemannMapping`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)).

- **Carathéodory's boundary correspondence** — a Riemann map of a bounded Jordan domain extends to a homeomorphism between the closed disc and the closure of the domain ([`exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)).

- **The Schwarz–Christoffel theorem** — a bounded simply connected domain with a polygonal Jordan-curve frontier, whose corners may be reentrant, is the image of the upper half-plane under an affine image of the Schwarz–Christoffel primitive, with prevertices sent to vertices ([`exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier)). It also has a [disc form](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Disc.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelDiscPrimitive_add_of_bijOn).

- **Uniqueness of Schwarz–Christoffel prevertices** — two such representations of the same domain with matching vertices that agree at three prevertices agree at every prevertex and are the same map ([`eq_and_eqOn_of_bijOn_schwarzChristoffelPrimitive`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PrevertexUniqueness.html#TauCeti.eq_and_eqOn_of_bijOn_schwarzChristoffelPrimitive)).

- **The Schwarz reflection principle** — a holomorphic function that is real on a symmetric piece of the real axis continues by conjugation, with line, analytic-arc and circle variants ([`differentiableOn_schwarzReflection_of_symmetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric)).

### Notable definitions and infrastructure

- **The pre-Schwarzian derivative `f''/f'`** drives the Schwarz–Christoffel proof. [Its rigidity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/PreSchwarzian.html#TauCeti.exists_eqOn_const_mul_add_iff_logDeriv_deriv_eqOn) says that maps with equal pre-Schwarzians agree up to an affine change. Together with reflection across edges and the residues at corners, this yields the [Schwarz–Christoffel formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PolygonalDomain.html#TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_domain).

- **[The boundary correspondence between two conformal maps onto a Jordan domain](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/CrossRatio.html#TauCeti.exists_sub_I_div_add_I_eq_unitDiscStandardAutomorphismFormula_of_tendsto)** is a Möbius transformation. As a result, boundary cross-ratios are conformal invariants, and three boundary values determine the map.

- **[The étalé space of holomorphic germs](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/HolomorphicSheaf.html#TauCeti.holomorphicSheaf)** turns analytic continuation into path lifting, and this underlies the [monodromy theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/GlobalBranch.html#TauCeti.continuesInside_iff_exists_analyticOnNhd).

### Roadmap coverage

L0–L4 are done. They cover the local-mapping theorems (Rouché, Hurwitz, Morera, the argument principle), Montel and Vitali, Schwarz–Pick and Poincaré-disc geometry, the Riemann mapping theorem, and reflection, removability and monodromy. L5 is done at its stated Jordan-domain generality, and prime ends were explicitly deferred. L6 is done for bounded polygons: the forward theorem and formula, the angle sum, the disc form, and uniqueness of prevertices up to three-point normalization. The converse is proved unconditionally for convex polygons. For nonconvex ones it needs a simple-boundary hypothesis or finite vertex-height checks. For polygons with a vertex at infinity, only the boundary chain of the primitive has been identified.

## The frontier

- **Unbounded polygons.** The primitive's boundary is now known to be [finite sides closed off by two infinite rays](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Infinity/Ray.html#TauCeti.range_schwarzChristoffelBoundary_of_neg_one_le_sum) when the total exponent is at least −1. Two things are still missing: that this chain is simple and bounds the image, and the domain-side forward theorem, which still assumes boundedness.

- **Univalence for general exponent data.** Find a checkable criterion that makes the Schwarz–Christoffel primitive univalent for arbitrary nonconvex data. Today the converse needs either simplicity of the boundary or explicit vertex-separation and height checks.

- **Prime ends.** Boundary correspondence beyond Jordan domains needs its own definitions and theory. This is a follow-on target, not unfinished L5 work.

- **Mathlib reconciliation.** If Mathlib's Riemann mapping theorem lands, the roadmap calls for deleting the local one and re-proving the L0–L2 prerequisites from Mathlib's lemmas. The supplied material does not show this has happened.

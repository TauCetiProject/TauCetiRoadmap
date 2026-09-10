<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"d8476fa9f4c2cec35cabffce100e7c2e75966e6c","ts":"2026-09-09T22:44:31Z"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `d8476fa` (2026-09-09T22:44:31Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Riemann mapping summit and layers L0–L5 are complete, including the Jordan-domain Carathéodory boundary correspondence. L6 is genuinely partial: the Schwarz–Christoffel integrand, primitive, straight boundary edges and finite vertices are available, but the global map onto a prescribed polygon is not; no in-scope layer remains wholly untouched.

### Named results

- **The Riemann mapping theorem** — every nonempty simply connected proper open subset of `ℂ` is biholomorphic to the unit disc, with normalized existence and uniqueness up to disc automorphisms ([`TauCeti.riemannMapping`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)).
- **The Carathéodory boundary correspondence** — the Riemann map of a bounded Jordan domain extends to a homeomorphism from the closed disc onto the domain closure ([`TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)).
- **The Schwarz reflection principle** — a holomorphic function real on the real boundary continues by conjugation, with companion forms across lines, analytic arcs and circles ([`TauCeti.differentiableOn_schwarzReflection_of_symmetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric)).
- **The monodromy theorem** — continuation from one germ throughout a simply connected domain determines a single global holomorphic function ([`TauCeti.continuesInside_iff_exists_analyticOnNhd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/GlobalBranch.html#TauCeti.continuesInside_iff_exists_analyticOnNhd)).
- **The isometry classification of the Poincaré disc** — every hyperbolic isometry is a disc automorphism or the conjugate of one ([`TauCeti.PoincareDisc.isometry_iff_exists_eq_unitDiscStandardAutomorphismIsometryEquiv_or_comp_star`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Poincare/Isometry/Classification.html#TauCeti.PoincareDisc.isometry_iff_exists_eq_unitDiscStandardAutomorphismIsometryEquiv_or_comp_star)).

### Notable definitions and infrastructure

- **The Schwarz–Christoffel integrand** packages real prevertices and turning exponents into the product whose logarithmic derivative and upper-half-plane boundary values control edge directions ([`TauCeti.schwarzChristoffelIntegrand`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Integrand.html#TauCeti.schwarzChristoffelIntegrand)).
- **The normalized Schwarz–Christoffel primitive** supplies the locally conformal candidate map; its boundary values are straight and injective between active prevertices and converge at finite prevertices under the proved exponent bound ([`TauCeti.schwarzChristoffelPrimitive`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Primitive.html#TauCeti.schwarzChristoffelPrimitive)).
- **The holomorphic sheaf and its étalé space** identify analytic continuation along a path with a continuous lift of its germ map, providing the intended geometric language for strengthening monodromy ([`TauCeti.holomorphicSheaf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/HolomorphicSheaf.html#TauCeti.holomorphicSheaf)).

### Roadmap coverage

L0–L1 provide Rouché, Hurwitz, Morera, the open-mapping degree, Vitali and Montel; L2 provides Schwarz–Pick, the Poincaré metric, its geodesics and isometries, and disc automorphisms; L3 provides Riemann mapping with normalization and uniqueness; L4 provides reflection across the roadmap’s boundary models, Painlevé removability and monodromy; and L5 now provides the homeomorphic extension for Jordan domains, with prime ends outside the stated milestone. L6 has the analytic formula and finite-edge/vertex behaviour, but not a globally injective map or a proof that its image is a specified polygon.

## The frontier

- **Global Schwarz–Christoffel univalence.** Prove that the primitive is injective on the upper half-plane under the polygonal angle and ordering hypotheses; current results give only pointwise conformality and injectivity along individual boundary intervals.
- **Polygon identification.** Show that the boundary values traverse the prescribed polygon and that the primitive maps the upper half-plane onto its interior; this needs the global univalence step and closure of the boundary argument.
- **The boundary point at infinity.** Supply the limiting behaviour needed to join the finite straight edges into the complete polygonal boundary; the present vertex theorem treats finite prevertices.
- **Monodromy in étalé-space form.** Recast the homotopy-invariance theorem directly for lifts into the étalé space and for paths in a domain; the sheaf and lift equivalence now exist, but that stronger statement is not established here.
- **Upstream Riemann-mapping handoff.** The roadmap calls for replacing the local L0–L3 proofs when the corresponding Mathlib results become public; the supplied record does not establish that this has happened.

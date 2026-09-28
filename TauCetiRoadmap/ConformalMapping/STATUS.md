<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"ae69ef93ae1b853b89b7e0966d5895c901e370f2","ts":"2026-09-10T10:57:54Z"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `ae69ef9` (2026-09-10T10:57:54Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Riemann mapping summit and layers L0–L5 are complete, including the Jordan-domain form of Carathéodory boundary correspondence. L6 is genuinely partial: the Schwarz–Christoffel integrand, primitive, boundary values, edges and prevertex asymptotics exist, but no theorem yet identifies a global map onto a prescribed polygon; prime ends remain outside the stated L5 milestone.

### Named results

- **[The Riemann mapping theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping)** — every nonempty simply connected proper open subset of `ℂ` admits a holomorphic bijection onto the unit disc, with normalized and uniqueness forms.

- **[Carathéodory’s boundary correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier)** — a Riemann map of a bounded Jordan domain extends to a homeomorphism between the closed disc and the closure of the domain.

- **[The Schwarz reflection principle](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric)** — a holomorphic function real on a symmetric real boundary continues by conjugation, with line, analytic-arc and circle variants.

- **[The monodromy theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/GlobalBranch.html#TauCeti.continuesInside_iff_exists_analyticOnNhd)** — continuation from one germ throughout a simply connected domain produces a single global holomorphic function; path independence is now available directly for continuations inside the domain.

- **[The isometry classification of the Poincaré disc](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Poincare/Isometry/Classification.html#TauCeti.PoincareDisc.isometry_iff_exists_eq_unitDiscStandardAutomorphismIsometryEquiv_or_comp_star)** — every hyperbolic isometry is a disc automorphism or an automorphism followed by conjugation.

### Notable definitions and infrastructure

- **[The Schwarz–Christoffel integrand](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Integrand.html#TauCeti.schwarzChristoffelIntegrand)** and **[normalized primitive](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Primitive.html#TauCeti.schwarzChristoffelPrimitive)** package real prevertices and turning exponents into a locally conformal upper-half-plane map.

- **[The canonical Schwarz–Christoffel boundary map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Boundary.html#TauCeti.schwarzChristoffelBoundary)** makes prevertex values and straight boundary edges available without choosing limits afresh.

- **[The étalé space of holomorphic germs](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/HolomorphicSheaf.html#TauCeti.holomorphicSheaf)** turns analytic continuation into path lifting and connects the continuation predicates to sheaf-theoretic sections.

### Roadmap coverage

L0–L4 remain done: the local-mapping results, Montel and Vitali, Schwarz–Pick and Poincaré geometry, the Riemann mapping theorem, and reflection, removability and monodromy are all established. L5 is now done at its stated Jordan-domain generality, in both directions and with a homeomorphism of closures; the heavier prime-ends theory was explicitly deferred. L6 is partial: local conformality, finite prevertex limits under the exponent condition, canonical boundary values, straight injective boundary edges, angle changes and leading asymptotics are present, while global polygon mapping is not established.

## The frontier

- **Schwarz–Christoffel polygon mapping.** Prove global injectivity and identify the image of the upper-half-plane primitive as the polygon bounded by the straight edge chain; the current declarations give only local conformality and intervalwise boundary injectivity.

- **The parameter problem.** For an arbitrary prescribed polygon, produce or characterize prevertices and exponents whose Schwarz–Christoffel boundary data realize its vertices and angles; no such existence result is established here.

- **Prime ends.** If boundary correspondence beyond Jordan domains is pursued, prime ends need their own definitions and theory; they are a follow-on target, not unfinished L5 work.

- **Mathlib reconciliation.** The roadmap calls for replacing duplicated L0–L3 proofs and deleting the local Riemann mapping theorem if Mathlib’s version lands, but the supplied material does not establish that this has happened.

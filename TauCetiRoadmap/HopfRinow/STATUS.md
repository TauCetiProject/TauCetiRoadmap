<!--tauceti-status:v1 {"roadmap":"HopfRinow","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57","ts":"2026-09-27T20:34:44+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"the converse energy-criticality theorem and piecewise-C1 minimizer rigidity","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"transport of the connection, geodesics, maximal intervals, and exponential maps across smooth Riemannian isometries","state":"partial"}],"readme_sha":"be763410b661b0f5e57ecf4a98a5f2a84c78ccc46978ddbf19718bc77618c106","roadmap":"HopfRinow","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57"}-->
# Status: HopfRinow

This file documents the status of the HopfRinow roadmap up until `b1ab119` (2026-09-27T20:34:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The distance, geodesic-flow, and Hopf–Rinow equivalence layers are done. Normal-neighbourhood theory is substantial but the reverse energy criterion remains open; the downstream isometry theory is partial. No layer is untouched.

### Named results

- **The Hopf–Rinow equivalence** — for a Riemannian manifold with its Riemannian distance, completeness, properness, all-time geodesics, an everywhere-defined exponential map at one point, and the stated compact-exhaustion condition are equivalent ([`TauCeti.Manifold.tfae_expDomain_eq_univ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/HopfRinow.html#TauCeti.Manifold.tfae_expDomain_eq_univ)).
- **Do Carmo's distance comparison** — the infimum of lengths of piecewise-`C¹` paths agrees with Mathlib's Riemannian extended distance ([`TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/EDistComparison.html#TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise)).
- **The Gauss lemma** — the differential of the exponential map preserves inner products with the radial direction on its natural domain ([`TauCeti.Manifold.inner_mfderiv_riemannianExp_radial`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Basic.html#TauCeti.Manifold.inner_mfderiv_riemannianExp_radial)).
- **Rigidity of normal-ball minimizers** — a minimizing `C¹` curve from the centre that stays in a normal neighbourhood is a radial geodesic up to a continuous nondecreasing surjective reparametrization ([`TauCeti.Manifold.IsNormalDomain.exists_monotoneOn_eq_riemannianExp_smul_of_pathELength_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Rigidity.html#TauCeti.Manifold.IsNormalDomain.exists_monotoneOn_eq_riemannianExp_smul_of_pathELength_eq)).
- **The first variation of energy** — for a fixed-endpoint variation, the energy derivative is the negative integral pairing the variation field with covariant acceleration ([`TauCeti.Manifold.hasDerivAt_energy_of_fixed_endpoints`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/FirstVariation.html#TauCeti.Manifold.hasDerivAt_energy_of_fixed_endpoints)).

### Notable definitions and infrastructure

- The **Levi-Civita connection** gives the unique torsion-free, metric-compatible connection used throughout the geodesic theory ([`CovariantDerivative.leviCivita`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Existence.html#CovariantDerivative.leviCivita)).
- The **Riemannian exponential map** evaluates the maximal geodesic at time one on its natural domain, making the equivalence and normal-ball arguments possible ([`TauCeti.Manifold.riemannianExp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.html#TauCeti.Manifold.riemannianExp)).
- A **normal domain** is a star-shaped tangent neighbourhood on which the exponential map is a diffeomorphism; its inverse is the local Riemannian logarithm ([`TauCeti.Manifold.IsNormalDomain`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal.html#TauCeti.Manifold.IsNormalDomain)).

### Roadmap coverage

Layers 0 and 1 are done: the former now includes regular arc-length reparametrization and `pathELength` lower semicontinuity, and the latter has the spray, smooth local flow, maximal geodesics, and smooth exponential map. Layer 2 has normal balls, logarithms, radial minimization and the first-variation formula, but only the geodesic-to-critical direction and `C¹` minimizer rigidity are established. Layer 3 is done, including the full equivalence, minimizing geodesics, and base-point propagation. Layer 4 is partial: the length-space and complete geodesic-space results and the compact completeness corollary are proved, while smooth Riemannian isometries currently preserve distance and completeness but lack the full transport of the connection, geodesics, maximal intervals, and exponential maps. The Euclidean computations and open-unit-ball incompleteness example are present.

## The frontier

- **Critical points of energy** — define criticality for every fixed-endpoint variation and prove that a smooth critical curve is a geodesic; the fixed-endpoint variation formula supplies the forward calculation.
- **Piecewise-`C¹` equality case** — extend normal-ball minimizer rigidity from `C¹` curves to piecewise-`C¹` minimizers if the roadmap's arbitrary-minimizer clause is to cover the same class as its length comparison.
- **Smooth-isometry transport** — prove preservation of the Levi-Civita connection, geodesics, maximal intervals, and exponential maps, including the `IsRiemannianManifold` identification; preservation of distance and geodesic completeness is already available.

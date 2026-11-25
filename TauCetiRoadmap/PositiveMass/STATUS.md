<!--tauceti-status:v1 {"roadmap":"PositiveMass","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833","ts":"2026-11-25T15:07:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"existence of the mass limit, chart independence and continuity of the mass, the conformal scalar-curvature law, compact exhaustion","state":"partial"},{"id":"Layer 1","remaining":"only Euclidean-exterior weighted norms exist; manifold and bundle spaces, indicial theory, round Dirac spectrum and Fredholm theory remain","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"only the Lohkamp concave truncation of 3.2; 3.0, the torus obstruction, Gauss-Bonnet with boundary and the compactification remain","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"38cc948b219344f93b36aec6e42e76afa242a9c9cd3d18e733e508b0ba6b9a1b","roadmap":"PositiveMass","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833"}-->
# Status: PositiveMass

This file documents the status of the PositiveMass roadmap up until `522d48f` (2026-11-25T15:07:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, ends and the mass functional, is well under way: ends, finite-ended structures, the flux, its normalizations and the conformal change of mass are proved, but the existence of the mass limit is not. Layer 1 and Layer 3 hold only first pieces, and the spinor route (Layers 4–7) and the theorems themselves (Layer 8) have not begun.

### Named results

- **The mass under a conformal change** — if an end has mass m and `u − 1 = O(r^(2−n))` with `∇u = c∇(r^(2−n)) + o(r^(1−n))`, then `u^(4/(n−2)) g` has mass m + 2c ([`IsAsymptoticallyEuclideanEnd.tendsto_normalizedCoordinateFlux_rpow_mul`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/AsymptoticallyEuclidean/Conformal.html#TauCeti.IsAsymptoticallyEuclideanEnd.tendsto_normalizedCoordinateFlux_rpow_mul)); this is the step that lowers a negative mass in the compactification argument.
- **The mass of conformally flat ends** — `(1 + c r^(2−n))^(4/(n−2)) δ` has mass 2c, so spatial Schwarzschild has mass m, fixing the roadmap's normalization ([`tendsto_normalizedCoordinateFlux_conformal_one_add_mul_rpow`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/AsymptoticallyEuclidean/Flux.html#TauCeti.tendsto_normalizedCoordinateFlux_conformal_one_add_mul_rpow)).
- **Lifting ends to finite covers** — a finite-ended structure lifts through a finite Riemannian covering, each end lifting to copies with the mass of the end below ([`IsFiniteEndedAsymptoticallyEuclidean.exists_lift`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/AsymptoticallyEuclidean/Covering.html#TauCeti.IsFiniteEndedAsymptoticallyEuclidean.exists_lift)).
- **Distance along an end** — the Riemannian distance from a fixed point to `φ(x)` is `|x| + o(|x|)` on an end of positive order ([`IsAsymptoticallyEuclideanEnd.isLittleO_dist_sub_norm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/AsymptoticallyEuclidean/Distance.html#TauCeti.IsAsymptoticallyEuclideanEnd.isLittleO_dist_sub_norm)), the input to the large-ball volume limit of 2.3.
- **Lohkamp's truncation levels** — a harmonic h below 1 and tending to 1 admits truncation levels whose smooth concave truncation is superharmonic, strictly somewhere, and constant far out ([`exists_concaveTruncation_comp_of_tendsto_one`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Harmonic/ConcaveTruncation.html#TauCeti.exists_concaveTruncation_comp_of_tendsto_one)), the flattening step of 3.2.

### Notable definitions and infrastructure

- [`IsAsymptoticallyEuclideanEnd`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/AsymptoticallyEuclidean/Basic.html#TauCeti.IsAsymptoticallyEuclideanEnd) and [`normalizedCoordinateFlux`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/AsymptoticallyEuclidean/Flux.html#TauCeti.normalizedCoordinateFlux): the decay condition alone, as the README asks, and the flux whose radius limit is the mass; every later layer states its hypotheses through these.
- [`IsSymbolAtInfinity`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/ContDiff/SymbolClass/Infinity.html#TauCeti.IsSymbolAtInfinity): the `O_k(|x|^(−t))` classes with product, inversion and composition rules, which already give the decay of the inverse metric and volume density of an end.
- [`MemWeightedLp`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Weighted.html#TauCeti.MemWeightedLp): Bartnik's weighted spaces on Euclidean exteriors, with [decay giving membership](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Weighted.html#TauCeti.memWeightedSobolev_of_isBigO) exactly for δ > −t.

### Roadmap coverage

Layer 0 is partial. 0.1 has the definitions, openness and connectedness of end images, the distance asymptotics and the decay of inverse metric and volume density; the compact exhaustion, the sphere area densities and chart-change rigidity (Lee–Parker 9.5) are missing. 0.2 has the flux, its scaling, isometry invariance and covering lifts, but not the existence of the limit, its chart independence or continuity. 0.3 is essentially in place on Euclidean exteriors, without cutoffs and partitions of unity. 0.4 has the conformal mass change but not the scalar-curvature law for `φ^(4/(n−2)) g`. Layer 1 is partial only in that its weighted norm convention exists on Euclidean exteriors; spaces on manifolds and bundles, spherical harmonics, the round Dirac spectrum and the Fredholm theory are untouched. Layer 3 is partial: only the Lohkamp truncation of 3.2. Layers 2 and 4–8 are untouched.

## The frontier

- **Existence of the mass (0.2)** — prove the flux converges for order t > (n−2)/2 and integrable scalar curvature, via the divergence identity for the linearized scalar curvature; the conformal mass change and every theorem of Layer 8 assume it.
- **Chart independence of the mass (0.1–0.2)** — the rigid-motion-plus-error comparison of two parametrizations and invariance of the limit under it.
- **The conformal scalar-curvature law (0.4)** — `Scal = φ^(−(n+2)/(n−2))(a_n Δ⁺φ + Scal φ)`, by substitution in the `e^(2u) g` law the supplier roadmap already provides.
- **Weighted spaces on manifolds (1.1)** — transplant the Euclidean-exterior norms to finite-ended manifolds and bundles, with density, duality and the weighted Poincaré inequality.
- **The rest of 3.2** — the harmonic end-value function, Kelvin capping and the torus gluing; it waits on Layer 1's end-value theory and on 3.1's torus obstruction.

<!--tauceti-status:v1 {"roadmap":"OptimalTransport","to_sha":"36f24f5d94ccf25e167520cf4c0f1a028c064fb0","ts":"2026-10-28T00:12:20Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"the Beiglboeck-Schachermayer and Beiglboeck-Leonard-Schachermayer Borel-cost duality regimes (item 5)","state":"partial"},{"id":"Layer 3","remaining":"explicit measurable structures for p = infinity and extended anchored components (item 2)","state":"partial"},{"id":"Layer 4","remaining":"Pratelli Theorem B for unbounded or infinite continuous costs","state":"partial"},{"id":"Layer 5","remaining":"rectifiable-null sources, Gangbo-McCann existence, relative-interior uniqueness, Sobolev setting and continuity of polar factorization","state":"partial"},{"id":"Layer 6","remaining":"viscosity-to-Aleksandrov, Dirichlet existence, Caffarelli regularity past engulfing, MTW and partial regularity","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"Lagrangian-from-Eulerian superposition, CBB(kappa), p = 1 BV theory, W_infinity Orlicz theory, Riemannian Benamou-Brenier","state":"partial"},{"id":"Layer 9","remaining":"the displacement-interpolation relation and its agreement with map-induced curves, convexity-notion stability lemmas","state":"partial"},{"id":"Layer 10","remaining":"convergence of minimizing movements to maximal-slope or EVI flows, varying-carrier Gamma-convergence, relaxed slopes","state":"partial"},{"id":"Layer 11","remaining":"minimal velocity of curves, full subdifferential theory, first variations, JKO convergence and the PDE flows","state":"partial"},{"id":"Layer 12","remaining":"general stability, multi-marginal duality, Agueh-Carlier, Gaussian fixed-point equation","state":"partial"},{"id":"Layer 13","remaining":"general entropic duality, Sinkhorn-divergence convexity and metrization, certified Sinkhorn examples, Brownian bridges, Schilder","state":"partial"},{"id":"Layer 14","remaining":"finite-N CD and CD*, infinitesimal Hilbertianity, RCD and heat flow, optimal maps on RCD spaces","state":"partial"},{"id":"Layer 15","remaining":"completeness and separability, measured Gromov-Hausdorff, Sturm space of spaces CBB(0), GW barycenters","state":"partial"},{"id":"Layer 16","state":"untouched"}],"readme_sha":"b3658037ebb419d969a95f65364f5362e0a793b5eff35f586a2e2627ad5c6afd","roadmap":"OptimalTransport","to_sha":"36f24f5d94ccf25e167520cf4c0f1a028c064fb0"}-->
# Status: OptimalTransport

This file documents the status of the OptimalTransport roadmap up until `36f24f5` (2026-10-28T00:12:20Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 and 1 are done, and Layers 2–4 each lack a single item. Layers 5, 6 and 8–15 are partial: most have their central theorems in basic regimes but not their summits. Layers 7 and 16 have not begun.

### Named results

- **Brenier's theorem** — for an absolutely continuous source on a finite-dimensional inner product space at finite quadratic cost, the optimal plan is unique and induced by the gradient of a convex potential ([`TauCeti.exists_isKantorovichOptimalTransportMap_gradient`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/OptimalTransport/Brenier.html#TauCeti.exists_isKantorovichOptimalTransportMap_gradient)).
- **The Benamou–Brenier formula** — for `1 ≤ p < ∞` on a finite-dimensional normed space, `W_p^p` is the attained minimum of the action `∫₀¹ ∫ ‖vₜ‖^p dμₜ dt` over continuity-equation solutions joining the laws ([`TauCeti.isLeast_lintegral_isContinuityEquation`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/OptimalTransport/ContinuityEquation/BenamouBrenier.html#TauCeti.isLeast_lintegral_isContinuityEquation)).
- **Lisini's superposition principle** — for `1 < p < ∞` on a complete separable metric space, every absolutely continuous curve in `P_p(X)` is the time-marginal curve of a law on paths with the same averaged speed ([`TauCeti.exists_map_IccExtend_eq_lintegral_curveAction_eq`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Superposition.html#TauCeti.exists_map_IccExtend_eq_lintegral_curveAction_eq)).
- **Uniqueness of Wasserstein geodesics** — a unique optimal coupling together with almost surely unique base geodesics forces a unique geodesic in `P_p(X)` ([`TauCeti.WassersteinSpace.eqOn_of_isGeodesicSegment_of_ae_subsingleton`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Geodesic/Unique.html#TauCeti.WassersteinSpace.eqOn_of_isGeodesicSegment_of_ae_subsingleton)). In particular, the `W₂` geodesic out of an absolutely continuous law is McCann's interpolation.
- **McCann's displacement convexity** — an internal energy satisfying McCann's condition is convex along the Brenier interpolation from an absolutely continuous law ([`TauCeti.internalEnergy_map_smul_add_smul_gradient_le`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/InternalEnergy/DisplacementConvexity.html#TauCeti.internalEnergy_map_smul_add_smul_gradient_le)).

### Notable definitions and infrastructure

- The Aleksandrov Monge–Ampère measure carries Layer 6A–6B. Convex sections ([`TauCeti.convexSection`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Section/Basic.html#TauCeti.convexSection)) with engulfing are where Caffarelli's theory starts.
- The Gromov–Wasserstein space ([`TauCeti.GromovWassersteinSpace`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/OptimalTransport/GromovWasserstein/Space.html#TauCeti.GromovWassersteinSpace)) consists of measured kernels modulo weak isomorphism and is a genuine metric space. Optimal couplings exist for measurable kernels on Polish carriers, and wherever one exists, zero distance is exactly weak isomorphism.
- The measure-contraction property ([`TauCeti.MetricMeasureSpace.MeasureContraction`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/OptimalTransport/MetricMeasure/MeasureContraction.html#TauCeti.MetricMeasureSpace.MeasureContraction)) is the first synthetic curvature condition, with a Bonnet–Myers diameter bound.

### Roadmap coverage

- **Layers 0 and 1** are done.
- **Layer 2** lacks only item 5, the Borel-cost duality regimes.
- **Layer 3** lacks only explicit measurable structures at `p = ∞` (item 2).
- **Layer 4** lacks only Pratelli's Theorem B.
- **Layer 5** has Brenier and the quadratic polar factorization. It lacks rectifiable-null sources, Gangbo–McCann existence, relative-interior uniqueness, and the Sobolev setting and continuity of Brenier's rearrangement.
- **Layer 6** has most of 6A–6B: Alexandrov's theorem, the comparison and maximum principles, Dirichlet uniqueness and the a.e. Jacobian equation. Viscosity-to-Aleksandrov, Dirichlet existence and everything in 6C–6D past sections and engulfing are missing.
- **Layer 8** has items 2–4 and 8, and the Eulerian-from-Lagrangian direction of item 7. It lacks `CBB(κ)` beyond `κ = 0`, the `p = 1` and `W_∞` theories, and the Riemannian formula.
- **Layer 9** has items 2 and 4–6, including geodesic uniqueness. It lacks the displacement-interpolation relation of item 1 and the convexity-notion stability lemmas.
- **Layer 10** has maximal-slope curves, EVI with contraction and semigroup, resolvents, and absolute continuity of limits of minimizing movements. It lacks their convergence to a flow and the varying-carrier Γ-theory.
- **Layer 11** has items 1, 2 and 6 and parts of 3–5. JKO convergence and the PDE flows (items 7–10) are untouched.
- **Layer 12** has items 1–3 and 5, including Le Gouic–Loubes population barycenters ([`TauCeti.WassersteinSpace.exists_isFrechetBarycenter`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/PopulationBarycenter.html#TauCeti.WassersteinSpace.exists_isFrechetBarycenter)). Stability is proved only for finitely supported laws, and Agueh–Carlier is missing.
- **Layer 13** has items 1–2, 6–7 and 10–11. Duality covers only bounded costs.
- **Layer 14** has `MCP`, `CD(K,∞)`, a Cheeger energy and Sturm's distance, but no finite-`N` `CD`, `RCD` or heat flow.
- **Layer 15** has items 2–3, 8–10 and most of 4–5, but no completeness or measured Gromov–Hausdorff theory.
- **Layers 7 and 16** are untouched.

## The frontier

- **Convergence of minimizing movements** (Layer 10, item 5) — the limit curves are now absolutely continuous with an energy–action inequality. What remains is to identify them as curves of maximal slope or EVI flows. That opens JKO convergence in Layer 11.
- **Entropic duality beyond bounded costs** (Layer 13, item 3) — Nutz's potentials under finite-entropy feasibility, and the support-component theorem at the measure level.
- **Lagrangian from Eulerian** (Layer 8, item 7) — lift a continuity-equation solution with finite action to a law on integral curves, and prove the minimal-velocity identity.
- **Caffarelli interior regularity** (Layer 6, item 8) — localization and Vitali covering for sections, then strict convexity and `C¹,α` of the Brenier potential.
- **Displacement interpolations** (Layer 9, item 1) — define the generic relation from optimal dynamic plans and match it with the Euclidean map-induced curves, now that geodesics are unique.

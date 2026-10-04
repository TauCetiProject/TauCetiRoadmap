<!--tauceti-status:v1 {"roadmap":"OptimalTransport","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d","ts":"2026-10-02T05:38:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"duality for costs bounded below by a split sum, dual attainment under a split envelope, Borel-cost regimes, the Schachermayer-Teichmann converse","state":"partial"},{"id":"Layer 3","remaining":"the measured-metric carrier (item 9) and the bounded-Lipschitz Kantorovich-Rubinstein variant","state":"partial"},{"id":"Layer 4","remaining":"Pratelli Theorem B for unbounded or infinite continuous costs","state":"partial"},{"id":"Layer 5","remaining":"Fenchel-Moreau, relative-interior potential uniqueness, rectifiable-null sources, Gangbo-McCann, polar factorization","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","remaining":"Polish-support radius identity, CAT(0) uniqueness, and all Wasserstein barycenter items 3-8","state":"partial"},{"id":"Layer 13","remaining":"Nutz existence of the Schroedinger minimiser, entropic duality, Sinkhorn, zero-temperature limit","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"},{"id":"Layer 16","state":"untouched"}],"readme_sha":"54b87ef74d97179e78d0057b1a5e8df315024d7343613b434f61cbe95faf577c","roadmap":"OptimalTransport","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d"}-->
# Status: OptimalTransport

This file documents the status of the OptimalTransport roadmap up until `d449639` (2026-10-02T05:38:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 and 1 are done, Layer 3 (Wasserstein distances) is done except for the measured-metric carrier and a bounded-Lipschitz variant, and Brenier's theorem now stands at the centre of Layer 5. Kantorovich duality, the Monge problem, barycenters and entropic transport are partial; Layers 6–11 and 14–16 have not begun.

### Named results

- **Brenier's theorem** — for an absolutely continuous source on a finite-dimensional inner product space and finite quadratic optimal cost, the optimal plan is unique and induced by the a.e.-unique gradient of a lower semicontinuous convex potential ([`TauCeti.exists_isKantorovichOptimalTransportMap_gradient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Brenier.html#TauCeti.exists_isKantorovichOptimalTransportMap_gradient)); with an absolutely continuous target the conjugate's gradient is the inverse map.
- **Kantorovich duality on Polish spaces** — for every nonnegative lower semicontinuous cost the optimal cost equals the supremum of integrable dual values ([`TauCeti.isLUB_ofReal_kantorovichDualValue_integrable_of_lowerSemicontinuous`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Duality/LowerSemicontinuous.html#TauCeti.isLUB_ofReal_kantorovichDualValue_integrable_of_lowerSemicontinuous)); dual attainment is proved only for bounded continuous costs ([`TauCeti.isGreatest_kantorovichDualValue_integrable`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Duality/Attainment.html#TauCeti.isGreatest_kantorovichDualValue_integrable)).
- **The Wasserstein space is Polish-grade** — over a Polish base `P_p(X)` is complete and separable, with relative compactness characterised by tightness and uniformly integrable moments ([`TauCeti.WassersteinSpace.isCompact_closure_iff_isTightMeasureSet_and_exists_setLIntegral_edist_rpow_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Compactness.html#TauCeti.WassersteinSpace.isCompact_closure_iff_isTightMeasureSet_and_exists_setLIntegral_edist_rpow_le)).
- **Kantorovich–Rubinstein duality** — `W_1` is the supremum of `∫ f dμ - ∫ f dν` over 1-Lipschitz `f`, for finite first moments on a Polish metric space ([`TauCeti.wassersteinEDist_one_eq_iSup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/KantorovichRubinstein.html#TauCeti.wassersteinEDist_one_eq_iSup)).
- **The twist theorem** — an injective cost derivative and an a.e.-differentiable potential force contact fibres to be singletons, so a certified plan comes from an a.e.-unique measurable map ([`TauCeti.ae_subsingleton_setOf_mem_contactSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Twist/Basic.html#TauCeti.ae_subsingleton_setOf_mem_contactSet)).

### Notable definitions and infrastructure

- Rademacher's theorem for extended-real convex functions ([`TauCeti.ae_eventually_ne_top_and_differentiableAt_toReal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/Differentiability.html#TauCeti.ae_eventually_ne_top_and_differentiableAt_toReal)), bridging proper convex functions to Mathlib's real-valued convexity; it is what makes Brenier's map defined almost everywhere and will serve Monge–Ampère.
- The Fréchet radius ([`TauCeti.frechetRadius`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Measure/FrechetMean.html#TauCeti.frechetRadius)) with its power functional and Chebyshev endpoint, the base-space foundation for Wasserstein barycenters.
- Entropic transport cost ([`TauCeti.entropicTransportCost`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Entropic.html#TauCeti.entropicTransportCost)) and the static Schrödinger value, linked by the Gibbs reformulation.

### Roadmap coverage

- **Layers 0, 1** — done.
- **Layer 2** — items 1, 2, 3, 6, 8 done. Item 4 partial: Polish duality for nonnegative lower semicontinuous costs, with attainment only for bounded continuous costs; the `c ≥ a ⊕ b` theorem and attainment under a split envelope are missing. Item 7 lacks the Schachermayer–Teichmann converse; item 5 untouched.
- **Layer 3** — done except the bounded-Lipschitz Kantorovich–Rubinstein variant and item 9 (measured-metric carrier).
- **Layer 4** — done except Pratelli's Theorem B for unbounded continuous costs.
- **Layer 5** — items 3–6 done, item 2 done for the Rademacher route; Fenchel–Moreau (item 1), the relative-interior potential-uniqueness variant, and items 7–9 (rectifiable-null sources, Gangbo–McCann, polar factorisation) untouched.
- **Layer 12** — items 1–2 done for proper spaces, without the Polish-support identity or CAT(0) uniqueness; items 3–8 untouched.
- **Layer 13** — item 13A.1 (Gibbs identity) and a finite entropy minimiser; Nutz existence, entropic duality and Sinkhorn untouched.
- **Layers 6–11, 14–16** — untouched.

## The frontier

- **Pratelli's Theorem B** (Layer 4, item 3) — Monge equals Kantorovich for unbounded or infinite continuous costs with atomless source; density of graph plans and the graph-convergence theorem are in place.
- **General Polish duality** (Layer 2, item 4) — extend from nonnegative costs to `c ≥ a ⊕ b` with integrable upper semicontinuous `a, b`, and prove dual attainment under a split upper envelope.
- **Entropic minimisers** (Layer 13A, items 2–3) — Nutz's existence and uniqueness of the Schrödinger minimiser, then the Gibbs density and potentials; the definitions and Gibbs identity are ready.
- **Brenier beyond the core** (Layer 5, items 1, 7, 8) — Fenchel–Moreau, the rectifiable-null source theorem, and Gangbo–McCann for strictly convex `h(x - y)`; Monge–Ampère (Layer 6) needs Alexandrov differentiability first.
- **Schachermayer–Teichmann** (Layer 2, item 7) — optimality of finite-cost plans concentrated on `c`-cyclically monotone sets for finite lower semicontinuous costs on Polish spaces.

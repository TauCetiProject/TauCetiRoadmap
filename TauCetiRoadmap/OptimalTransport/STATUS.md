<!--tauceti-status:v1 {"roadmap":"OptimalTransport","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"dual attainment under a split upper envelope, the Borel-cost regimes, the Schachermayer-Teichmann converse","state":"partial"},{"id":"Layer 3","remaining":"the measured-metric carrier (item 9)","state":"partial"},{"id":"Layer 4","remaining":"Pratelli Theorem B for unbounded or infinite continuous costs","state":"partial"},{"id":"Layer 5","remaining":"relative-interior variants, rectifiable-null sources, Gangbo-McCann, polar factorization","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"reparameterization, Arzela-Ascoli and path-space tightness, CBB, path space, Lisini superposition, Benamou-Brenier","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","remaining":"Polish-support radius identity, CAT(0) uniqueness, and all Wasserstein barycenter items 3-8","state":"partial"},{"id":"Layer 13","remaining":"stability of Schroedinger minimisers, entropic duality and potentials, Sinkhorn convergence, zero-temperature limit, dynamic theory","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"},{"id":"Layer 16","state":"untouched"}],"readme_sha":"54b87ef74d97179e78d0057b1a5e8df315024d7343613b434f61cbe95faf577c","roadmap":"OptimalTransport","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: OptimalTransport

This file documents the status of the OptimalTransport roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 and 1 are done. Layer 3 (Wasserstein distances) is done except for the measured-metric carrier, and Layer 4 is done except for Pratelli's theorem for unbounded costs. Brenier's theorem anchors Layer 5. Kantorovich duality, barycenters, entropic transport and now metric curves (Layer 8) are partial; Layers 6, 7, 9–11 and 14–16 have not begun.

### Named results

- **Brenier's theorem** — for an absolutely continuous source on a finite-dimensional inner product space and finite quadratic optimal cost, the optimal plan is unique and is induced by the a.e.-unique gradient of a lower semicontinuous convex potential ([`TauCeti.exists_isKantorovichOptimalTransportMap_gradient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Brenier.html#TauCeti.exists_isKantorovichOptimalTransportMap_gradient)).
- **Kantorovich duality on Polish spaces** — for a lower semicontinuous cost bounded below by `a ⊕ b`, with `a, b` upper semicontinuous and integrable, the optimal cost is the supremum of integrable dual values ([`TauCeti.isLUB_kantorovichDualValue_of_lowerSemicontinuous_bddBelow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Duality/BoundedBelow.html#TauCeti.isLUB_kantorovichDualValue_of_lowerSemicontinuous_bddBelow)). Dual attainment is proved only for bounded continuous costs ([`TauCeti.isGreatest_kantorovichDualValue_integrable`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Duality/Attainment.html#TauCeti.isGreatest_kantorovichDualValue_integrable)).
- **Kantorovich–Rubinstein duality** — `W_1` is the supremum of `∫ f dμ - ∫ f dν` over 1-Lipschitz `f`, for finite first moments on a Polish metric space ([`TauCeti.wassersteinEDist_one_eq_iSup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/KantorovichRubinstein.html#TauCeti.wassersteinEDist_one_eq_iSup)). The bounded-Lipschitz variant is also proved.
- **The Gaussian `W₂` formula** — from a nondegenerate Gaussian to any Gaussian, `W₂²` is the squared distance of the means plus the Bures covariance term, realised by the positive affine map ([`TauCeti.wassersteinEDist_two_multivariateGaussian_rpow_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Gaussian.html#TauCeti.wassersteinEDist_two_multivariateGaussian_rpow_two)).
- **Existence and uniqueness of the Schrödinger minimiser** — against a finite reference measure, a finite static Schrödinger value is attained by exactly one coupling, with no topology on the spaces ([`TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Entropic.html#TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue)).

### Notable definitions and infrastructure

- The Fenchel–Moreau theorem on locally convex spaces ([`TauCeti.fenchelConjugate_flip_fenchelConjugate_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/FenchelMoreau.html#TauCeti.fenchelConjugate_flip_fenchelConjugate_eq)) completes the dual-pair convex tower beneath Brenier. Together with Rademacher's theorem for extended-real convex functions ([`TauCeti.ae_eventually_ne_top_and_differentiableAt_toReal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/Differentiability.html#TauCeti.ae_eventually_ne_top_and_differentiableAt_toReal)), it gives later maps and Monge–Ampère a ready convex-analysis base.
- The metric derivative ([`TauCeti.metricDerivative`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Function/MetricDerivative.html#TauCeti.metricDerivative)) and the `p`-action of a curve ([`TauCeti.curveAction`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Function/CurveAction.html#TauCeti.curveAction)). With the fundamental theorem for absolutely continuous curves and lower semicontinuity of the action, these are the starting point for Lisini superposition and Benamou–Brenier.
- Diagonal matrix scaling, with the Sinkhorn–Knopp theorem for strictly positive kernels ([`Matrix.exists_sinkhorn_scaling`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Data/Matrix/Scaling.html#Matrix.exists_sinkhorn_scaling)), which identifies the scaled matrix as the unique relative-entropy minimiser. This is the finite target for the Sinkhorn convergence theory.

### Roadmap coverage

- **Layers 0, 1** are done.
- **Layer 3** is done except for item 9, the measured-metric carrier.
- **Layer 4** is done except for Pratelli's Theorem B for unbounded or infinite continuous costs.
- **Layer 2** has items 1–3, 6 and 8 done. Item 4 has Polish duality for `c ≥ a ⊕ b` but lacks attainment under a split upper envelope. Item 7 lacks the Schachermayer–Teichmann converse, and item 5 (Borel-cost regimes) is untouched.
- **Layer 5** has items 1 and 3–6 done, and item 2 done along the Rademacher route. The relative-interior variants and items 7–9 (rectifiable-null sources, Gangbo–McCann, polar factorisation) are untouched.
- **Layer 8** has the metric derivative, the fundamental theorem and the lower semicontinuity of the action from item 1. Reparameterisation, Arzelà–Ascoli, path-space tightness, `CBB(κ)` and items 2–9 are missing.
- **Layer 12** has items 1–2 for proper spaces, without the Polish-support identity or CAT(0) uniqueness; items 3–8 are untouched.
- **Layer 13** has item 1, the existence and uniqueness half of item 2 (its stability half is missing), and item 8 for strictly positive kernels. Entropic duality, Sinkhorn convergence and the dynamic theory are untouched.
- **Layers 6, 7, 9–11, 14–16** are untouched.

## The frontier

- **Dual attainment for unbounded costs** (Layer 2, item 4) — prove attainment for real costs with finite primal value under an integrable split upper envelope `c ≤ c_X ⊕ c_Y`. The signed duality it builds on is in place.
- **Entropic potentials and duality** (Layer 13A, item 3) — the Schrödinger density `exp((φ ⊕ ψ - c)/ε)` with potentials unique up to a constant, now that the minimiser exists.
- **Sinkhorn convergence** (Layer 13B, item 9) — Hilbert's projective metric, Birkhoff contraction and rates for alternating scaling; Sinkhorn–Knopp existence and uniqueness are already proved.
- **Pratelli's Theorem B** (Layer 4, item 3) — Monge equals Kantorovich for unbounded or infinite continuous costs with an atomless source; graph-plan density and the graph-convergence theorem are ready.
- **Compactness for curves** (Layer 8, item 1) — the Arzelà–Ascoli theorem with its pointwise relative-compactness hypothesis, and tightness on path space, before Lisini's superposition theorem (item 3).

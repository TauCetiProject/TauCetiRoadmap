<!--tauceti-status:v1 {"roadmap":"OptimalTransport","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"Polish duality for costs bounded below by a split sum, with dual attainment, Borel-cost regimes, the Schachermayer-Teichmann converse","state":"partial"},{"id":"Layer 3","remaining":"the measured-metric carrier (item 9) and the bounded-Lipschitz Kantorovich-Rubinstein variant","state":"partial"},{"id":"Layer 4","remaining":"Pratelli Theorem B for unbounded continuous costs and the graph-plan convergence-in-measure theorem","state":"partial"},{"id":"Layer 5","remaining":"Fenchel-Moreau, finite-dimensional convex API with Rademacher, Brenier and its extensions","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","remaining":"everything beyond the finite entropy minimiser: static Schroedinger problem, entropic duality, Sinkhorn convergence","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"},{"id":"Layer 16","state":"untouched"}],"readme_sha":"54b87ef74d97179e78d0057b1a5e8df315024d7343613b434f61cbe95faf577c","roadmap":"OptimalTransport","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: OptimalTransport

This file documents the status of the OptimalTransport roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 and 1 are done, and Layer 3 (Wasserstein distances) is done except for the measured-metric carrier and a bounded-Lipschitz variant of Kantorovich–Rubinstein. Layer 2 lacks its Polish summit beyond bounded continuous costs; Layers 4 (Monge), 5 (convex analysis, Brenier) and 13 (entropic transport) are partial; everything else has not begun.

### Named results

- **Primal attainment on Polish spaces** — a lower semicontinuous cost `c : X × Y → ℝ≥0∞` admits an optimal plan between any two probability measures on Polish spaces ([`TauCeti.exists_isOptimalCoupling`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Existence.html#TauCeti.exists_isOptimalCoupling)), with stability of values and optimisers under varying data.
- **Kantorovich duality with dual attainment on Polish spaces** — for a bounded continuous nonnegative cost the optimal cost is the greatest value of an integrable dual pair, and some optimal plan is certified by `c`-conjugate potentials ([`TauCeti.isGreatest_kantorovichDualValue_integrable`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Duality/Attainment.html#TauCeti.isGreatest_kantorovichDualValue_integrable)); on compact spaces duality also holds for lower semicontinuous costs.
- **The Wasserstein space is a Polish-grade metric space** — over a Polish base `P_p(X)` is complete and separable, and a family is relatively compact exactly when it is tight with uniformly integrable `p`-moments ([`TauCeti.WassersteinSpace.isCompact_closure_iff_isTightMeasureSet_and_exists_setLIntegral_edist_rpow_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Compactness.html#TauCeti.WassersteinSpace.isCompact_closure_iff_isTightMeasureSet_and_exists_setLIntegral_edist_rpow_le)); on the line `W_p` is the `Lᵖ` distance of quantiles for every `p ∈ [1, ∞]`.
- **Kantorovich–Rubinstein duality** — for laws with finite first moment on a Polish metric space, `W_1` is the supremum of `∫ f dμ - ∫ f dν` over 1-Lipschitz `f` ([`TauCeti.wassersteinEDist_one_eq_iSup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/KantorovichRubinstein.html#TauCeti.wassersteinEDist_one_eq_iSup)).
- **The twist theorem** — if `y ↦ Dₓc(x, y)` is injective and the source potential is differentiable almost everywhere, contact fibres are almost surely singletons ([`TauCeti.ae_subsingleton_setOf_mem_contactSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Twist/Basic.html#TauCeti.ae_subsingleton_setOf_mem_contactSet)), so a certified plan is induced by an a.e.-unique measurable map ([`TauCeti.IsDualCertificate.exists_optimal_transportMap_unique_ae`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Twist/Map.html#TauCeti.IsDualCertificate.exists_optimal_transportMap_unique_ae)).

### Notable definitions and infrastructure

- The `p`-Wasserstein extended distance for every `1 ≤ p ≤ ∞` ([`TauCeti.wassersteinEDist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.html#TauCeti.wassersteinEDist)) and the finite-moment space ([`TauCeti.WassersteinSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Space.html#TauCeti.WassersteinSpace)) with its anchored components, carrying the Borel structure that population laws in Layer 12 will need.
- The Monge value over `HasLaw` transport maps ([`TauCeti.mongeCost`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Monge.html#TauCeti.mongeCost)), with the relaxation inequality to Kantorovich and its equality case at graph plans.
- Legendre–Fenchel conjugates for a general pairing ([`TauCeti.fenchelConjugate`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/Conjugate.html#TauCeti.fenchelConjugate)) and subdifferentials, with Rockafellar's theorem identifying quadratic-cost `c`-cyclically monotone sets with subsets of subdifferential graphs: the entry point to Brenier.

### Roadmap coverage

- **Layers 0, 1** — done. The uncrossing acceptance check on ordered finite supports is covered only through the optimality of the monotone quantile coupling.
- **Layer 2** — items 1, 2, 3, 6, 8 done. Item 4 partial: compact and bounded-continuous Polish duality with attainment, but not the `c ≥ a ⊕ b` theorem. Item 7 partial: Rockafellar–Rüschendorf and cyclically monotone supports of optimal plans for continuous costs, but not the Schachermayer–Teichmann converse. Item 5 untouched.
- **Layer 3** — items 1–8 done, except the bounded-Lipschitz Kantorovich–Rubinstein variant; item 9 (measured-metric carrier) untouched.
- **Layer 4** — items 1, 2, 5, 6 done; item 3 done for bounded continuous costs only (Pratelli's Theorem B missing); item 4 (graph-plan convergence in measure) untouched.
- **Layer 5** — items 1 (without Fenchel–Moreau), 3 and 4 done; items 2 and 5–9, including Brenier, untouched.
- **Layer 13** — only a finite relative-entropy minimiser on the transport polytope, with positive entries.
- **Layers 6–12, 14–16** — untouched.

## The frontier

- **Polish lower-semicontinuous duality** (Layer 2, item 4) — extend the bounded-continuous theorem to costs `c ≥ a ⊕ b` with upper semicontinuous integrable `a, b`, and dual attainment under a split upper envelope. The attainment and certificate machinery is now in place.
- **Brenier's theorem** (Layer 5, item 5) — the finite-dimensional specialisation and Rademacher differentiability of convex potentials (item 2) are the missing prerequisites; Rockafellar, the quadratic `c`-transform identification, and the twist-to-map pipeline are ready.
- **Pratelli's Theorem B and graph-plan convergence** (Layer 4, items 3–4) — Monge equals Kantorovich for unbounded or infinite continuous costs with atomless source, and narrow convergence of graph plans versus convergence in measure.
- **Schachermayer–Teichmann** (Layer 2, item 7) — finite-cost plans concentrated on `c`-cyclically monotone sets are optimal, on Polish spaces for finite lower semicontinuous costs; needs the contact-potential construction.
- **Layer 3 closure and Layer 12 start** — the measured-metric carrier and the bounded-Lipschitz duality variant; Fréchet barycenters on proper metric spaces are self-contained, and the Gaussian geometric-mean identities are ready for the Gaussian barycenter.

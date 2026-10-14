<!--tauceti-status:v1 {"roadmap":"OptimalTransport","to_sha":"71d0c01b9c4dbbe7b85d80cda75b30e1d44a8afb","ts":"2026-10-14T07:34:48Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"dual attainment under a split upper envelope, the Borel-cost regimes, the Schachermayer-Teichmann converse","state":"partial"},{"id":"Layer 3","remaining":"the measured-metric carrier (item 9)","state":"partial"},{"id":"Layer 4","remaining":"Pratelli Theorem B for unbounded or infinite continuous costs","state":"partial"},{"id":"Layer 5","remaining":"relative-interior variants, rectifiable-null sources, Gangbo-McCann, polar factorization","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"reparameterization, Arzela-Ascoli and path-space tightness, CBB, path space, Lisini superposition, Benamou-Brenier","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","remaining":"Polish-support radius identity, CAT(0) uniqueness, and all Wasserstein barycenter items 3-8","state":"partial"},{"id":"Layer 13","remaining":"general entropic duality, Sinkhorn divergences, Sinkhorn objective-gap rates, entropic barycenters, the dynamic Schroedinger theory","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"},{"id":"Layer 16","state":"untouched"}],"readme_sha":"54b87ef74d97179e78d0057b1a5e8df315024d7343613b434f61cbe95faf577c","roadmap":"OptimalTransport","to_sha":"71d0c01b9c4dbbe7b85d80cda75b30e1d44a8afb"}-->
# Status: OptimalTransport

This file documents the status of the OptimalTransport roadmap up until `71d0c01` (2026-10-14T07:34:48Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 and 1 are done, Layer 3 lacks only the measured-metric carrier, and Layer 4 lacks only Pratelli's theorem for unbounded costs. Brenier's theorem anchors Layer 5. Duality, metric curves, barycenters and entropic transport are partial, and Layers 6, 7, 9–11 and 14–16 have not begun.

### Named results

- **Brenier's theorem** — for an absolutely continuous source on a finite-dimensional inner product space and finite quadratic optimal cost, the optimal plan is unique and is induced by the a.e.-unique gradient of a lower semicontinuous convex potential ([`TauCeti.exists_isKantorovichOptimalTransportMap_gradient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Brenier.html#TauCeti.exists_isKantorovichOptimalTransportMap_gradient)).
- **Kantorovich duality on Polish spaces** — for a lower semicontinuous cost bounded below by `a ⊕ b`, with `a, b` upper semicontinuous and integrable, the optimal cost is the supremum of the dual values ([`TauCeti.isLUB_kantorovichDualValue_of_lowerSemicontinuous_bddBelow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Duality/BoundedBelow.html#TauCeti.isLUB_kantorovichDualValue_of_lowerSemicontinuous_bddBelow)). Dual attainment is proved only for bounded continuous costs.
- **Kantorovich–Rubinstein duality** — `W₁` is the supremum of `∫ f dμ - ∫ f dν` over 1-Lipschitz `f`, for finite first moments on a Polish metric space ([`TauCeti.wassersteinEDist_one_eq_iSup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/KantorovichRubinstein.html#TauCeti.wassersteinEDist_one_eq_iSup)).
- **Existence and uniqueness of the Schrödinger minimiser** — against a finite reference measure, a finite static Schrödinger value is attained by exactly one coupling, with no topology on the spaces (`TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue`).
- **Birkhoff's contraction theorem** — a matrix with strictly positive entries contracts Hilbert's projective metric between positive vectors by `tanh(Δ(K)/4) < 1`, where `Δ(K)` is its projective diameter ([`Matrix.hilbertProjectiveDist_mulVec_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Data/Matrix/BirkhoffContraction.html#Matrix.hilbertProjectiveDist_mulVec_le)).

### Notable definitions and infrastructure

- The Fenchel–Moreau theorem on locally convex spaces ([`TauCeti.fenchelConjugate_flip_fenchelConjugate_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Convex/FenchelMoreau.html#TauCeti.fenchelConjugate_flip_fenchelConjugate_eq)), with Rademacher's theorem for convex functions, gives later maps and Monge–Ampère a ready convex-analysis base.
- The metric derivative (`TauCeti.metricDerivative`) and the `p`-action of a curve, with the fundamental theorem for absolutely continuous curves, are the starting point for Lisini superposition and Benamou–Brenier.
- Hilbert's projective metric ([`TauCeti.hilbertProjectiveDist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Data/Matrix/BirkhoffContraction.html#TauCeti.hilbertProjectiveDist)) measures Sinkhorn potentials modulo constants, since on positive vectors it is the oscillation of `log x - log y`. With the Sinkhorn–Knopp theorem ([`Matrix.exists_sinkhorn_scaling`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Data/Matrix/Scaling.html#Matrix.exists_sinkhorn_scaling)), it gives linear convergence of the finite Sinkhorn iteration.

### Roadmap coverage

- **Layers 0, 1** are done.
- **Layer 3** is done except for item 9, the measured-metric carrier. **Layer 4** is done except for Pratelli's Theorem B for unbounded or infinite continuous costs.
- **Layer 2** has items 1–3, 6 and 8. Item 4 lacks attainment under a split upper envelope, item 7 lacks the Schachermayer–Teichmann converse, and item 5 (Borel-cost regimes) is untouched.
- **Layer 5** has items 1–6, without the relative-interior variants; items 7–9 (rectifiable-null sources, Gangbo–McCann, polar factorisation) are untouched.
- **Layer 8** has only part of item 1: the metric derivative, the fundamental theorem and lower semicontinuity of the action.
- **Layer 12** has items 1–2 for proper spaces, without the Polish-support identity or CAT(0) uniqueness. Items 3–8 are untouched.
- **Layer 13** has more than earlier reports recorded. The source also contains iterative proportional fitting with telescoping marginal errors (item 7), linear convergence of finite Sinkhorn for strictly positive kernels and its agreement with proportional fitting (items 9–10), the zero-temperature limit of values (item 5), a stability theorem (item 2), the finite envelope formula in the cost (part of item 4), and Schrödinger potentials for bounded log-densities (part of item 3). These are not yet linked here. Entropic duality in general, Sinkhorn divergences, entropic barycenters and the dynamic theory (13C) are absent.
- **Layers 6, 7, 9–11, 14–16** are untouched.

## The frontier

- **Dual attainment for unbounded costs** (Layer 2, item 4) — attainment for real costs with finite primal value under an integrable split upper envelope `c ≤ c_X ⊕ c_Y`. The signed duality it builds on is in place.
- **Entropic duality beyond bounded kernels** (Layer 13, item 3) — Schrödinger potentials under finite-entropy feasibility and `R ∼ μ⊗ν`, unique up to one constant, and the support-component theorem when the reference has zeros.
- **Sinkhorn rates and examples** (Layer 13, item 9) — objective-gap rates with explicit dependence on `min K`, `max K` and the marginals, plus certified exact examples. The contraction and linear convergence are done.
- **Pratelli's Theorem B** (Layer 4, item 3) — Monge equals Kantorovich for unbounded or infinite continuous costs with an atomless source.
- **Compactness for curves** (Layer 8, item 1) — Arzelà–Ascoli and path-space tightness, before Lisini's superposition theorem (item 3).

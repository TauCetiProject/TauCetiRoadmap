<!--tauceti-status:v1 {"roadmap":"ExponentialCone","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"bef40d88fa90d56a02113e69626e8f015230465dc6698b7b48725233a6caacb8","roadmap":"ExponentialCone","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ExponentialCone

This file documents the status of the ExponentialCone roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All four layers are proved. That covers the closed exponential cone with its literal zero face, the exponential, logarithmic and softplus sections, finite weighted lifting, and the affine process and exponential-coefficient rows. Nothing in the roadmap's stated scope remains open.

### Named results

- **The carrier theorem for the exponential cone** — the native closed cone is exactly the positive branch `v > 0, v·exp(w/v) ≤ u` together with the zero face `v = 0, u ≥ 0, w ≤ 0`. This is proved, not assumed: [`mem_cone_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Cone/Exponential/Basic.html#TauCeti.ExponentialCone.mem_cone_iff).
- **The supporting-halfspace characterization** — a point lies in the cone exactly when `u, v ≥ 0` and `exp(a)·(w + (1 − a)v) ≤ u` for every real `a`: [`mem_cone_iff_forall_exp`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Cone/Exponential/Basic.html#TauCeti.ExponentialCone.mem_cone_iff_forall_exp).
- **Density of the positive branch** — the closure of the positive branch is the whole cone, through an explicit approximation of each zero-face point: [`closure_positive`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Cone/Exponential/Basic.html#TauCeti.ExponentialCone.closure_positive).
- **The softplus perspective representation** — for every `y > 0`, the bound `y·log(1 + exp(x/y)) ≤ t` holds exactly when the two-cone softplus system is feasible. Logistic costs follow by negating the score: [`mul_log_one_add_exp_div_le_iff_softplusSystem`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Cone/Exponential/Representations.html#TauCeti.ExponentialCone.mul_log_one_add_exp_div_le_iff_softplusSystem).
- **Finite weighted exponential lifting** — a nonnegative-weight sum of exponentials is at most `L` exactly when each term lifts to a unit-scale cone point whose heights satisfy the same linear bound: [`sum_mul_exp_le_iff_exists_mem_cone`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Cone/Exponential/Representations.html#TauCeti.ExponentialCone.sum_mul_exp_le_iff_exists_mem_cone).

### Notable definitions and infrastructure

- **The closed exponential cone** [`cone`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Cone/Exponential/Basic.html#TauCeti.ExponentialCone.cone) is the closure of Mathlib's pointed-cone hull of the [positive branch](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Cone/Exponential/Basic.html#TauCeti.ExponentialCone.positive). Convexity, closedness and nonnegative scaling therefore come from the native API, not from wrappers.
- **The softplus system** [`SoftplusSystem`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Cone/Exponential/Representations.html#TauCeti.ExponentialCone.SoftplusSystem) uses two independent auxiliary heights. It covers the positive-scale perspective, the closed face at scale zero (`0 ≤ t` and `x ≤ t`) and emptiness at negative scale, so it gives one interface for softplus and logistic-loss rows.

### Roadmap coverage

All four layers are done. Layer 1 (cone geometry) has the positive-branch API, the carrier theorem, the halfspace route and density. Layer 2 (sections and perspectives) has the exponential and logarithm sections, the logarithmic perspective, the softplus system with its scalar, perspective, zero-scale and negative-scale identities, and the logistic-cost rows. Layer 3 (finite weighted lifting) is proved over any finite index set, which includes empty families and zero weights. Layer 4 (affine exponential inequalities) has the scalar and weighted process rows and the exponential-coefficient row in both its cone form and its logarithmic form. A few rows are substitutions into these theorems and are proved as checked examples rather than named theorems: the affine softplus score, the residual process form, and the affine right sides.

## The frontier

- **Named forms of the substitution rows** — the affine-score softplus, residual process and affine-right-side rows hold only as `example`s. Downstream users who want to cite them would need named theorem versions, which are one-line specializations.
- **Downstream consumers** — the roadmap points generic model lifting to ConvexLifting and boxed-union hulls to BoundedConicHulls. Neither is a prerequisite here, and neither is assessed in this report.
- **Out of scope by design** — salience and properness, the dual cone, a facial classification and general closed-perspective theory are explicitly excluded. Any of them would need a new roadmap.

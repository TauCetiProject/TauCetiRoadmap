<!--tauceti-status:v1 {"roadmap":"ConformalMappingPartII","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the germ-space initial-value theorem, continuation, global solutions, meromorphic local bases and pole clearing (0.2-0.6)","state":"partial"},{"id":"Layer 1","remaining":"surface uniformization of the analytic universal cover, pointed covers, the conformal radius and the roots cover","state":"untouched"},{"id":"Layer 2","remaining":"the Schwarzian ODE, Hempel's accessory parameters and the roots-cover Schwarzian and linear equation (2.4-2.9)","state":"partial"},{"id":"Layer 3","remaining":"the Herglotz formulas, the quotient phase, radial smoothing and Nevanlinna's quotient representation (3.3-3.8)","state":"partial"},{"id":"Layer 4","remaining":"the descended inverse equation, its two hypergeometric solutions, the inverse-ratio germ and zero-balanced continuation (4.2-4.8)","state":"partial"},{"id":"Layer 5","remaining":"the boundary limit of the inverse ratio and the conformal-radius theorem (5.4-5.5)","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"the zero-free logarithmic-derivative estimate (9.4) and the uniform mean-growth argument after it (9.5 onward)","state":"partial"}],"readme_sha":"bade15c329618227fc757ac87b43d2743657cc14d218619e62707e5515b7cb4c","roadmap":"ConformalMappingPartII","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ConformalMappingPartII

This file documents the status of the ConformalMappingPartII roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Neither summit is proved: not the conformal-radius theorem |F_N′(0)| = γ_N, and not the uniform circle-mean bound. But the pieces that need no covering theory are well advanced. The Gamma side of the radius formula is complete, and so is disc-local value distribution (Layer 7). Layers 0, 2, 3, 4 and 9 have their opening milestones. Analytic universal covers (Layer 1), the symmetric covering groups (Layer 6) and the cusp geometry (Layer 8) have not begun, and everything about the roots cover itself waits on Layer 1.

### Named results

- **The positive expansion of the Gamma radius** — γ_N = 16^(1/N)(1 + ζ(3)/(2N³) + 3ζ(5)/(8N⁵) + E_N) with 0 < E_N ≤ 3/N⁶ for every N ≥ 2. It is derived from the odd-zeta series for log γ_N and the log-Gamma Taylor series, together with the closed values γ₂ = Γ(1/4)⁴/(4π²) and γ₃: `TauCeti.exists_pos_forall_gammaRadius_eq`.
- **The disc-local first main theorem** — for f meromorphic on a disc, |T_D(r,f) − T_D(r,1/(f−a)) − log|c(f,a)|| ≤ log⁺|a| + log 2. It is proved without extending f to the plane: `MeromorphicOn.abs_discCharacteristic_sub_discCharacteristic_one_div_sub_sub_log_le`.
- **Gauss's hypergeometric equation** — ₂F₁(a,b;c;·) solves x(1−x)y″ + (c−(a+b+1)x)y′ − ab·y = 0 inside its disc of convergence when c is not a nonpositive integer, and everywhere when the series terminates: [`TauCeti.ordinaryHypergeometric_gaussEquation`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/OrdinaryHypergeometric.html#TauCeti.ordinaryHypergeometric_gaussEquation).
- **The Schwarzian chain rule and Möbius invariance** — S(f∘g) = (S(f)∘g)·g′² + S(g), and postcomposing with a Möbius map leaves S unchanged. This is why the branches of an inverse cover share one Schwarzian: [`TauCeti.schwarzian_comp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Schwarzian.html#TauCeti.schwarzian_comp).
- **The logarithmic mean estimate** — for nonnegative circle-integrable H, the mean of log⁺H is at most log⁺ of the mean of H plus 1/e: [`CircleIntegrable.circleAverage_posLog_le_posLog_circleAverage_add`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Integral/PosLog.html#CircleIntegrable.circleAverage_posLog_le_posLog_circleAverage_add).

### Notable definitions and infrastructure

- `TauCeti.gammaRadius` is the explicit Gamma expression for γ_N, with positivity, the duplication-formula rewrite and the limit 1. It is what the conformal-radius theorem 5.5 will identify with |F_N′(0)|.
- `TauCeti.discCharacteristic` and `TauCeti.discCounting` localize Nevanlinna's characteristic and pole count to compact subdiscs. They come with Jensen's identity, the power law and radial monotonicity, so they apply to covering maps on 𝔻 that have no global meromorphic extension.
- [`TauCeti.LinearEquation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/Complex/LinearEquation.html#TauCeti.LinearEquation) packages a monic holomorphic equation with its solution space and unscaled initial jets. The companion correspondence and an initial-jet isomorphism on discs are already in the library.

### Roadmap coverage

Layer 7 is done: the disc-local counting function and characteristic, positivity and vanishing of the pole count, local Jensen, the first main theorem and its translated form, the power law and radial monotonicity (7.1–7.10). Layer 5 is done except for the two milestones that need the actual cover, the boundary limit of the inverse ratio and the radius theorem (5.4–5.5). The rest is partial at the first milestones. Layer 0 has the equation and companion system (0.1), but not the germ-space initial-value theorem, continuation or meromorphic bases (0.2–0.6). Layer 2 has the Schwarzian, its chain rule and Möbius invariance (2.1–2.3). Layer 3 has Blaschke factors and finite Blaschke products (3.1–3.2). Layer 4 has the Gauss equation (4.1). Layer 9 has the kernel mean, the boundary L¹ control and the logarithmic mean estimate (9.1–9.3). Layers 1, 6 and 8 are untouched.

## The frontier

- **The derivative Herglotz formula (3.3–3.4)** — represent a normalized logarithm and its derivative by the Herglotz kernel. With 9.1–9.3 in place, this is the only roadmap prerequisite left for the zero-free logarithmic-derivative estimate 9.4.
- **The analytic linear initial-value theorem (0.2)** — move the existing disc isomorphism to the germ space at a point. This is short, and it opens continuation (0.3), global solutions (0.4) and the two hypergeometric solutions (4.3).
- **The Schwarzian differential equation (2.4)** — w is a quotient of solutions of y″ + ½S(w)y = 0. It needs 0.2 and an analytic square root of w′.
- **Zero-balanced hypergeometric continuation (4.6–4.8)** — the connection formula for ₂F₁(a,a;2a;1−x) near x = 0, with uniform digamma control. It needs only the native series and Gamma and digamma facts, so it can proceed before the covers exist. It feeds both 5.4 and 8.1.
- **Hyperbolic uniformization (1.1)** — the largest prerequisite. It needs surface Perron and Green-function theory, and it blocks the roots cover, the radius theorem 5.5, Layers 6 and 8, and the omitted-value estimates of Layer 9.

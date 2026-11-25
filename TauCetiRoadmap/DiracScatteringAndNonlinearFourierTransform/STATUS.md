<!--tauceti-status:v1 {"roadmap":"DiracScatteringAndNonlinearFourierTransform","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the parameter-derivative formula and holomorphy into C(J, E to E) of 1.6; the ball-local form of the nonlinear theorem 1.7","state":"partial"},{"id":"Layer 2","remaining":"vague limit of 2.2; localised, weak- and strong-type maximal bounds of 2.3; Fatou, bounded holomorphic, Hardy, Paley-Wiener and outer functions (2.4-2.8)","state":"partial"},{"id":"Layer 3","remaining":"the Dirac fundamental matrix and the Hermite-Biehler property of E and E-tilde","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"99a26b3188f8282edf0df472e3af2187e35c1a7abfd2dccd3c98a94249235c93","roadmap":"DiracScatteringAndNonlinearFourierTransform","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: DiracScatteringAndNonlinearFourierTransform

This file documents the status of the DiracScatteringAndNonlinearFourierTransform roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1, the theory of linear systems with integrable coefficients, is nearly complete: only the parameter-derivative formula of §1.6 and the local form of the nonlinear theorem are missing. Layer 2 has its Poisson and Schwarz integrals, the representation of positive harmonic functions and the nontangential maximal bound; Fatou's theorem, Hardy, Paley–Wiener and outer functions have not begun. Nothing has landed for the Dirac system or anything after it (Layers 3–9).

### Named results

- **Liouville's formula** — for a coefficient `P` integrable on `[a, b]`, the propagator satisfies `det N_P(t, s) = exp ∫ₛᵗ tr P`. The statement is basis-free and is also given for matrices ([`det_propagator`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/Propagator/Liouville.html#TauCeti.det_propagator)).
- **The Dyson expansion of the propagator** — `N_P(t, s)` is the sum of its iterated-integral Dyson terms, and the `n`-th term is bounded by `|∫ₛᵗ ‖P‖|ⁿ/n!` ([`hasSum_propagatorDysonTerm`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/Propagator/Dyson.html#TauCeti.hasSum_propagatorDysonTerm)).
- **Holomorphic dependence on a parameter** — if `z ↦ P(z, t)` is holomorphic and dominated by an integrable function on compact parameter sets, then `z ↦ N_{P z}(t, s)` is holomorphic, and entire coefficients give entire propagators ([`differentiableOn_propagator`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/Propagator/Holomorphic.html#TauCeti.differentiableOn_propagator)). This is what will make the Dirac fundamental matrix entire in Layer 3.
- **Continuous dependence on the coefficient** — `‖N_{P′} − N_P‖ ≤ ‖P′ − P‖₁ exp(‖P′‖₁ + ‖P‖₁)`, so `L¹` convergence of coefficients gives uniform convergence of propagators ([`norm_propagator_sub_propagator_le`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/Propagator.html#TauCeti.norm_propagator_sub_propagator_le)).
- **Nonnegative harmonic functions on the half-plane** — every such `u` is `c Im z + P[ν](z)` with `c ≥ 0` and `ν` Poisson-finite ([`exists_eq_mul_im_add_upperHalfPlanePoissonIntegral`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UpperHalfPlane/Poisson/PositiveHarmonic.html#TauCeti.exists_eq_mul_im_add_upperHalfPlanePoissonIntegral)). The pair `(c, ν)` is unique ([`eq_and_eq_of_mul_im_add_upperHalfPlanePoissonIntegral_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UpperHalfPlane/Poisson/Uniqueness.html#TauCeti.eq_and_eq_of_mul_im_add_upperHalfPlanePoissonIntegral_eq)), and both `c` and `ν(ℝ)` are limits along the imaginary axis.

### Notable definitions and infrastructure

- **The Dyson terms** — the iterated integrals `Dₙ` of the coefficient ([`propagatorDysonTerm`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/Propagator/Dyson.html#TauCeti.propagatorDysonTerm)). Holomorphy in the parameter is proved term by term through them.
- **The Schwarz integral of an `L¹(Π)` density** — `S[h]` and its version `S⁰[h]` normalised at infinity ([`upperHalfPlaneSchwarzIntegralFun`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UpperHalfPlane/Poisson/Function.html#TauCeti.upperHalfPlaneSchwarzIntegralFun)), with `Re S[h] = P[h]`. Outer functions `exp S[h]` in §2.8 are built from it.
- **The nontangential maximal function** — the supremum over cones of any aperture and height ([`nontangentialMaximalFunction`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UpperHalfPlane/Nontangential.html#TauCeti.nontangentialMaximalFunction)). It is already dominated by `max(2, 1 + 2α²)` times the Hardy–Littlewood maximal function on Poisson integrals, which is the domination Fatou's theorem needs.

### Roadmap coverage

Layer 1 is partial but nearly done. Grönwall with an integrable kernel, the linear Carathéodory theorem with its converse for absolutely continuous solutions, and the propagator with its cocycle, bounds, continuity, variation of constants, Dyson expansion and locality are all proved. So are Liouville's formula, continuous dependence on the coefficient, holomorphy and joint continuity in a parameter, and the global nonlinear theorem with its bounds. What remains is the formula `∂_z N = ∫ N ∂_z P N` with holomorphy into `C(J, E →L E)`, and the ball-local form of §1.7. Layer 2 is partial. §2.1 is done. §2.2 lacks only the vague-limit clause, and §2.3 has the cones and the cone comparison but not the localised, weak-type or strong-type bounds. §2.4–§2.8 are untouched. Layers 3–9 are untouched.

## The frontier

- **The vague limit and the maximal bounds of §2.2–§2.3** — the measure `ν` as the vague limit of `u(x + iy) dx`, then the localisation, weak-type and strong-type bounds for `M_1 P[h]`. These are the next steps, and the README routes the weak type for measures through the vague limit.
- **Fatou's theorem for Poisson integrals (§2.4)** — nontangential convergence of `P[ν]` to the density of `ν` almost everywhere. The cone domination is in place, and the Lebesgue-point argument remains.
- **The Dirac system (§3.1)** — the fundamental matrix as the propagator of the entire, trace-free Dirac coefficient. Layer 1 now supplies existence, entireness and `det = 1`, so this is ready to begin.
- **The parameter derivative (§1.6)** — `∂_z N(t, s) = ∫ₛᵗ N(t, r) ∂_z P(r, z) N(r, s) dr` and holomorphy into `C(J, E →L E)`, the last open pieces of Layer 1 apart from the local nonlinear theorem.
- **Hardy and Paley–Wiener spaces (§2.5–§2.7)** — bounded holomorphic functions, `H^p(ℂ₊)` and `PW_t`. Their boundary theory depends on Fatou's theorem.

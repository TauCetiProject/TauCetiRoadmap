<!--tauceti-status:v1 {"roadmap":"StochasticCalculus","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the predictable section theorem, debut, and Poisson existence, regularization and jump-time laws","state":"partial"},{"id":"Layer 1","remaining":"Kolmogorov-Chentsov, the constructed Wiener measure, transformations and random-walk approximation","state":"partial"},{"id":"Layer 2","remaining":"Doob-Meyer, full continuous-time Doob theory and general optional sampling","state":"partial"},{"id":"Layer 3","remaining":"the time-indexed Ito integral process, its local extension and finite-variation integration","state":"partial"},{"id":"Layer 4","remaining":"brackets of general continuous local martingales, covariation and BDG","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"strong Markov restart, reflection, path growth, harmonic measure and local time","state":"partial"},{"id":"Layer 7","remaining":"Girsanov for predictable drifts, Dambis-Dubins-Schwarz and density martingales","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"31c1177d778829ec5cfcd1763280c7858a5840d719f3645d99351a9ad26bf0b4","roadmap":"StochasticCalculus","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: StochasticCalculus

This file documents the status of the StochasticCalculus roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete. Layers 0–4 each have real pieces: filtration and stopping adapters, filtered Brownian and Poisson predicates, their basic martingales, a terminal L² Brownian integral and Brownian quadratic variation. Above that there is a constant-drift Girsanov theorem and right continuity of the augmented Brownian filtration. The Itô formula, Cameron–Martin, SDEs and diffusions have not begun.

### Named results

- **The compensated Poisson martingales** — for a rate-α Poisson process relative to any filtration, [N_t − αt](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Process/Poisson/Martingale.html#TauCeti.Probability.IsFilteredPoissonProcess.martingale_compensated) and [(N_t − αt)² − αt](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Process/Poisson/Martingale.html#TauCeti.Probability.IsFilteredPoissonProcess.martingale_compensated_sq_sub) are martingales. This is the Layer 2.1 item for the roadmap's jump example.
- **The finite-horizon Itô isometry** — for Brownian motion relative to an arbitrary filtration, the terminal integral is a linear isometry from predictable time-product L² into L², determined by its values on predictable rectangles. It is a terminal map, not yet a time-indexed process.
- **Brownian quadratic variation** — along any family of deterministic partitions of [a, b] whose mesh tends to zero, the sums of squared Brownian increments converge in probability to b − a. No nesting is required.
- **Girsanov's theorem for a constant drift** — under the measure tilted by θW_T, the process W_t − θ·min(t, T) is a Brownian motion. The general predictable-drift theorem is not there.
- **Right continuity of the augmented Brownian filtration** — the null-augmented natural filtration of Brownian motion is right-continuous. This is the S6.1 target `brownian_natural_augmentation_isRightContinuous`.

### Notable definitions and infrastructure

- [Filtered Poisson processes](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Process/Poisson/Filtered.html#TauCeti.Probability.IsFilteredPoissonProcess) put the filtration into the Poisson increment law, just as the filtered Brownian predicate does for Brownian motion. The property survives augmentation, smaller filtrations and shifts, which is what the compensator and bracket targets in Layers 2–4 will consume.
- The [energy localizer](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Process/EnergyLocalizer.html#MeasureTheory.Measure.energyLocalizer) stops an integrand when a repaired, continuous square-energy clock reaches a level. On the raw filtration it gives a [localizing sequence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/BrownianMotion/Integral/Energy/Localization.html#TauCeti.LocallyBrownianIntegrable.isLocalizingSequence_energyLocalizer) along which every locally Brownian-integrable integrand becomes square-integrable. This reduces the local Itô integral to the L² one.
- [Pointwise predictable times](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Process/Predictable/StoppingTime.html#TauCeti.IsPredictableTime) are defined by announcing sequences. They have their closure operations and the predictable stochastic intervals, which are the elementary input to the predictable section theorem.

### Roadmap coverage

Layers 0–4 are partial. Layer 0 has the progressive σ-algebra, ambient null augmentation, time measure, real-time hitting of closed sets, the elementary theory of predictable times and the filtered Poisson predicate with its API. It lacks the predictable section theorem, debut, and Poisson existence, regularization and jump-time laws. Layer 1 has the filtered Brownian predicate and its natural-filtration and augmentation adapters, but no constructed Wiener measure or Kolmogorov–Chentsov theorem. Layer 2 has local-martingale centering and congruence, optional stopping for right-continuous martingales, L² maximal inequalities and the Brownian and Poisson martingales, but no Doob–Meyer decomposition. Layer 3 has the integrable domains, the predictable measure, the terminal L² integral and energy localization, but no integral process. Layer 4 has Brownian quadratic (and cubic) variation along partitions, but no general bracket or BDG. Layers 6 and 7 are partial, holding only the two Brownian results named above. Layers 5, 8, 9 and 10 are untouched. The constant-rate Brownian exponential martingale and the closed-form geometric Brownian motion exist from the finance work. They are not the Doléans exponential or an SDE solution.

## The frontier

- **The local Itô integral `exists_isItoIntegral`** — build a time-indexed integral process with a continuous version and the martingale property from the terminal L² map, then glue along the energy localizer. Uniqueness and congruence must hold up to indistinguishability.
- **Poisson existence and regularization (S0.6)** — the projective-limit construction, a càdlàg ℕ-valued version with unit jumps, the jump times as stopping times, and the Erlang and exponential waiting-time laws.
- **The predictable section theorem (S0.5)** — needs S0.2's paving and capacity construction. With it, every stopping time with predictable graph has an a.s. announcing sequence on a complete right-continuous basis.
- **Wiener measure (S1.1–1.2)** — Kolmogorov–Chentsov with Hölder exponents below 1/2, and `exists_wienerMeasure` on continuous paths. At present the Brownian results all assume a given process.
- **Doob–Meyer and continuous brackets (S2.5, S4.1)** — general quadratic variation, and with it the Itô formula of Layer 5, wait on these.

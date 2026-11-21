<!--tauceti-status:v1 {"roadmap":"StochasticCalculus","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the capacity and section engine, the predictable section theorem, and Poisson existence, regularization and jump-time laws","state":"partial"},{"id":"Layer 1","remaining":"Kolmogorov-Chentsov on real time, exists_wienerMeasure, transformations and random-walk approximation","state":"partial"},{"id":"Layer 2","remaining":"the Doob-Meyer decomposition itself, full continuous-time Doob theory and general optional sampling","state":"partial"},{"id":"Layer 3","remaining":"the time-indexed Ito integral process, its local extension and finite-variation integration","state":"partial"},{"id":"Layer 4","remaining":"brackets of general continuous local martingales, covariation and BDG","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"martingale representation, reflection, the LIL and exact modulus, harmonic measure and local time","state":"partial"},{"id":"Layer 7","remaining":"Girsanov for predictable drifts, Dambis-Dubins-Schwarz and density martingales","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"3459f6f4eb8d020ff97cd5624a302418729399d7e856bcd732728df6b85117c7","roadmap":"StochasticCalculus","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: StochasticCalculus

This file documents the status of the StochasticCalculus roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete. Layers 0–4, 6 and 7 are each partial. Brownian motion now has its strong Markov property and simultaneous nowhere differentiability, and there is a terminal L² Itô integral and Brownian quadratic variation. Wiener measure, Doob–Meyer and the integral process are still missing, and the Itô formula, Cameron–Martin, SDEs and diffusions have not begun.

### Named results

- **The strong Markov property of Brownian motion**: at an almost surely finite stopping time, the restarted increment path of a filtered Brownian motion with continuous paths [is a Brownian motion](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/StrongMarkov.html#TauCeti.Probability.IsFilteredPreBrownianReal.isBrownianReal_stoppedValue_shift) [independent of the stopped σ-algebra](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/StrongMarkov.html#TauCeti.Probability.IsFilteredPreBrownianReal.indep_stoppedValue_shift). This is the S6.1 headline `brownian_strongMarkov`.
- **Paley–Wiener–Zygmund nowhere differentiability**: on one full-measure event, the Brownian path is [differentiable at no time t ≥ 0](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/NowhereDifferentiable.html#ProbabilityTheory.IsPreBrownianReal.ae_not_differentiableAt), with no right derivative at 0. It assumes only the finite-dimensional laws.
- **The debut theorem**: on a complete right-continuous filtration, the [debut of every progressive set](https://taucetiproject.org/docs/TauCeti/Probability/Process/Debut.html#MeasurableSet.isStoppingTime_debut) is a stopping time.
- **The finite-horizon Itô isometry**: for Brownian motion relative to any filtration, the terminal integral is a linear isometry from predictable time-product L² into L². It is a terminal map, not yet a time-indexed process.
- **Brownian quadratic variation**: along deterministic partitions of [a, b] whose mesh tends to zero, the sums of squared increments converge in probability to b − a, with no nesting required.

### Notable definitions and infrastructure

- The [L⁰ wrapper](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/L0/Basic.html#TauCeti.L0) carries the bounded metric of convergence in measure. That metric is [complete](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/L0/Complete.html#TauCeti.L0.instCompleteSpace) and makes the wrapper a topological ring, which is the setting for integrals defined as limits in probability.
- [Class DL](https://taucetiproject.org/docs/TauCeti/Probability/Martingale/ClassD.html#TauCeti.IsClassDL) (and class D) processes come with right-continuous martingales as examples and with uniform integrability of discrete compensators. These are the compactness inputs to Doob–Meyer.
- The [optional σ-algebra](https://taucetiproject.org/docs/TauCeti/Probability/Process/Filtration/Optional.html#MeasureTheory.Filtration.optional) sits between predictable and progressive, and holds stopping-time graphs and rays. Together with the Souslin operation, it is the vocabulary of the section theorems.

### Roadmap coverage

Layers 0–4, 6 and 7 are partial; Layers 5, 8, 9 and 10 are untouched.

- **Layer 0** has the progressive and optional σ-algebras, null augmentation, closed-set hitting, debut, pointwise predictable times, the Souslin operation, the L⁰ metric and the filtered Poisson predicate. It lacks the capacity and section engine, the predictable section theorem, and Poisson existence and regularization.
- **Layer 1** has the filtered Brownian predicate and its adapters, Brownian laws on countable time sets, Kolmogorov edge bounds and uniqueness of continuous-path laws. It lacks the Kolmogorov–Chentsov theorem and the constructed Wiener measure.
- **Layer 2** has optional stopping for right-continuous martingales, L² maximal inequalities, the Brownian and Poisson martingales, and the class D/DL machinery. It lacks Doob–Meyer.
- **Layer 3** has the terminal L² integral and energy localization, but no integral process.
- **Layer 4** has Brownian quadratic variation, but no general bracket or BDG.
- **Layer 6** has the strong Markov property, nowhere differentiability and right continuity of the augmented Brownian filtration.
- **Layer 7** has only Girsanov's theorem for a constant drift.

## The frontier

- **Wiener measure (S1.1–1.2)**: the countable-time Brownian laws and the continuous-path uniqueness are in place. What remains is to prove Kolmogorov–Chentsov on ℝ≥0 from the edge bounds and to push the continuous modification to `exists_wienerMeasure` on C(ℝ≥0, ℝ).
- **Doob–Meyer (S2.5)**: the discrete compensators are uniformly integrable. What remains is the limit, a predictable càdlàg compensator and its uniqueness. Continuous brackets, and with them Layer 5, wait on this.
- **The local Itô integral `exists_isItoIntegral`**: a time-indexed integral process with a continuous version, glued along the energy localizer. Brownian martingale representation also needs it.
- **The predictable section theorem (S0.5)**: the Souslin operation is there. The outer-capacity approximation, the filtration-aware paving and the compact-fiber section construction are not.
- **Brownian path growth (S6.3)**: the law of the iterated logarithm and Lévy's exact uniform modulus. Nowhere differentiability no longer blocks anything here.

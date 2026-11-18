<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","state":"done"},{"id":"Layer 14","state":"done"},{"id":"Layer 15","state":"done"}],"readme_sha":"b2f66314aae9b6afd33588f3e918508e316123f5d62f1e437fe69e63446a3ae4","roadmap":"StandardDistributions","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All sixteen layers are done, from the elementary families and closed-form cdfs through Wishart laws, the discrete, noncentral, spherical and circular families, LKJ correlation matrices and scalar stable laws. The last four open statements closed in the most recent window, and no layer is partial or untouched.

### Named results

- **The Bartlett decomposition** — the Cholesky entries of a standard Wishart matrix are independent, with standard Gaussian strict-lower entries and chi diagonal entries of successively decreasing degrees ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Gaussian conditioning with singular covariance** — conditioning a jointly Gaussian vector uses pseudoinverse regression and a generalized Schur complement, singular observed blocks included ([`TauCeti.Probability.condDistrib_multivariateGaussian`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/Conditional/Basic.html#TauCeti.Probability.condDistrib_multivariateGaussian)). When the observed covariance changes rank, the joint laws still vary weakly continuously although the conditional kernel does not ([`TauCeti.Probability.not_continuousAt_gaussianCondKernel_gaussianRankChangeCovariance_zero_zero`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/Conditional/RankChange.html#TauCeti.Probability.not_continuousAt_gaussianCondKernel_gaussianRankChangeCovariance_zero_zero)).
- **Independence of the LKJ partial correlations** — the partial correlations of an LKJ matrix are independent centred symmetric Beta variables, so its law, Cholesky factor, entry marginals, quantiles, determinant moments and mixed entry moments all come from independent Beta draws ([`ProbabilityTheory.HasLaw.iIndepFun_partialCorrelation_lkjMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/LKJ/PartialCorrelation.html#ProbabilityTheory.HasLaw.iIndepFun_partialCorrelation_lkjMeasure)).
- **Stable laws in the S₀ convention** — compensated compound Poisson limits produce a law with characteristic function `exp(imt + Ψ(st))`, a bounded smooth density, exact support, the sharp moment threshold `q < α`, and a cdf that is strictly increasing on the line once α ≥ 1, fully skewed laws included, so quantiles are unique roots ([`TauCeti.Probability.strictMono_cdf_stableMeasure_of_one_le`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Stable/Cdf.html#TauCeti.Probability.strictMono_cdf_stableMeasure_of_one_le)).
- **Lévy's continuity theorem, including existence** — pointwise convergence of characteristic functions to a function continuous at zero yields a unique limiting probability law; this is the existence step for the stable laws ([`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/LevyConvergence.html#TauCeti.exists_probabilityMeasure_of_tendsto_charFun)).

### Notable definitions and infrastructure

- **Change of variables to partial correlations** — integration over positive-definite correlation matrices reduces to an open cube with an explicit product Jacobian, which is what normalizes the LKJ law ([`TauCeti.setIntegral_comp_correlationCoordinatesOfPartialCorrelation`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.setIntegral_comp_correlationCoordinatesOfPartialCorrelation)).
- **Power-law tails under convolution** — tail constants add under convolution and scale by the rate under compound Poisson summation, which carries the jump-measure tails to the stable law ([`TauCeti.Probability.tendsto_rpow_mul_compoundPoissonMeasure_real_Ioi`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/CompoundPoisson/Tail.html#TauCeti.Probability.tendsto_rpow_mul_compoundPoissonMeasure_real_Ioi)).
- **Medians from quantiles** — the quantile at level one half is a median of every probability measure on the line, atoms included, and the medians are exactly the interval up to the upper half-quantile, which settles median statements for every family at once without any uniqueness claim ([`MeasureTheory.Measure.isMedian_quantile_half`](https://taucetiproject.org/docs/TauCeti/Probability/Quantile/Median.html#MeasureTheory.Measure.isMedian_quantile_half)).

### Roadmap coverage

Every layer, 0 through 15, is **done**. Layers 0–6 and 9–13 were already complete. The last window closed the remaining statements: Layer 7's weak-continuity check on the joint laws of `(Z, tZ)`; Layer 8's locally uniform convergence of the direct periodized Gaussian density series; Layer 14's partial-correlation quantiles with endpoint limits and the existence of all natural mixed entry moments; and Layer 15's strict cdf increase and unique-root quantiles for fully skewed laws with α ≥ 1. The median check in Layer 13 also landed. These verdicts follow the gaps that successive progress reports tracked against the README. No single pass has checked every family against every shared requirement.

## The frontier

- **A completion audit** — no named target remains open. What is left is to check each family against the README's shared requirements and per-layer completion checks in one pass, since the roadmap counts as complete only when every check is met and the verdicts above were assembled window by window.

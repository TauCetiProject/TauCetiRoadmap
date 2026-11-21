<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","state":"done"},{"id":"Layer 14","state":"done"},{"id":"Layer 15","state":"done"}],"readme_sha":"b2f66314aae9b6afd33588f3e918508e316123f5d62f1e437fe69e63446a3ae4","roadmap":"StandardDistributions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All sixteen layers are done. They run from the elementary families and closed-form cdfs through Wishart laws, the discrete, noncentral, spherical and circular families, LKJ correlation matrices and scalar stable laws. Recent work adds explicit forms of results that were already met, such as the Wick–Isserlis pairing formula and exact LKJ mixed moments. No layer is partial or untouched.

### Named results

- **The Wick–Isserlis formula** — for a centred Gaussian vector with any positive-semidefinite covariance, a product of coordinates, repeats allowed, has expectation equal to the sum over perfect matchings of the positions of the products of matched covariances, so odd products vanish ([`TauCeti.Probability.integral_prod_multivariateGaussian_eq_sum_perfectMatching`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/Wick.html#TauCeti.Probability.integral_prod_multivariateGaussian_eq_sum_perfectMatching)).
- **The Bartlett decomposition** — the Cholesky entries of a standard Wishart matrix are independent, with standard Gaussian strict-lower entries and chi diagonal entries of successively decreasing degrees ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Gaussian conditioning with singular covariance** — conditioning a jointly Gaussian vector uses pseudoinverse regression and a generalized Schur complement, including when the observed block is singular ([`TauCeti.Probability.condDistrib_multivariateGaussian`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/Conditional/Basic.html#TauCeti.Probability.condDistrib_multivariateGaussian)).
- **Independence of the LKJ partial correlations** — the partial correlations of an LKJ matrix are independent centred symmetric Beta variables ([`ProbabilityTheory.HasLaw.iIndepFun_partialCorrelation_lkjMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/LKJ/PartialCorrelation.html#ProbabilityTheory.HasLaw.iIndepFun_partialCorrelation_lkjMeasure)). From this come the law's marginals, its quantiles, and its [exact mixed entry moments](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/LKJ/MixedMoments.html#TauCeti.Probability.integral_prod_pow_coe_apply_lkjMeasure) as finite sums of products of Beta quotients.
- **Stable laws in the S₀ convention** — compensated compound Poisson limits produce a law with characteristic function `exp(imt + Ψ(st))`, a bounded density, exact support (a half-line for fully skewed laws with α < 1), and the sharp moment threshold `q < α`. For α ≥ 1 the cdf is strictly increasing on the line, so quantiles are unique roots ([`TauCeti.Probability.strictMono_cdf_stableMeasure_of_one_le`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Stable/Cdf.html#TauCeti.Probability.strictMono_cdf_stableMeasure_of_one_le)).

### Notable definitions and infrastructure

- **Lévy's continuity theorem, including existence** — if characteristic functions converge pointwise to a function continuous at zero, then a unique limiting probability law exists. This is the existence step for the stable laws ([`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/LevyConvergence.html#TauCeti.exists_probabilityMeasure_of_tendsto_charFun)).
- **Weighted perfect matchings** — the product of pair weights over a matching, with a recurrence that removes a chosen point and its partner. This is what turns the Gaussian moment recursion into the closed pairing formula ([`TauCeti.PerfectMatching.weight`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Enumerative/PerfectMatching/Weight.html#TauCeti.PerfectMatching.weight)).
- **Change of variables to partial correlations** — integration over positive-definite correlation matrices reduces to an open cube with an explicit product Jacobian, which is what normalizes the LKJ law ([`TauCeti.setIntegral_comp_correlationCoordinatesOfPartialCorrelation`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.setIntegral_comp_correlationCoordinatesOfPartialCorrelation)).

### Roadmap coverage

Every layer, 0 through 15, is **done**, and the README is unchanged since that verdict. Recent work restated or strengthened milestones that were already met. In Layer 5, the Wick–Isserlis formula now has the README's pairing form. In Layer 10, the folded normal family is complete, identified as degree-one noncentral chi; it was recorded late. Layer 14 now has exact LKJ mixed moments. Layers 4, 7 and 15 gained further identities: noncentral F from noncentral Beta, Fréchet as GEV, censored versus truncated Gaussians, and stable density bounds. These verdicts were built up one window at a time. No single pass has yet checked every family against every shared requirement.

## The frontier

- **A completion audit** — no named target remains open. The roadmap counts as complete only when every shared requirement and per-layer completion check is met, and no single pass has yet checked every family against them. Recent declaration extracts were partly truncated, which is a further reason to do that audit against the source.

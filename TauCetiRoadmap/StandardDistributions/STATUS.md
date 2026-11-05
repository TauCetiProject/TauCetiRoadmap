<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"36f24f5d94ccf25e167520cf4c0f1a028c064fb0","ts":"2026-10-28T00:12:20Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"hurdle laws, Gaussian mixtures, weak continuity of the logistic-normal and proper complex Gaussian laws","state":"partial"},{"id":"Layer 8","remaining":"Gaussian lattice sums and their theta-function identity","state":"partial"},{"id":"Layer 9","remaining":"discrete Laplace and Gaussian, multivariate hypergeometric, integer-interval uniform, negative-multinomial characteristic function","state":"partial"},{"id":"Layer 10","remaining":"truncated and skew normal, triangular; noncentral Beta density and cdf","state":"partial"},{"id":"Layer 11","remaining":"multivariate t, matrix normal and logistic-normal densities; conditional multivariate t; proper complex Gaussian","state":"partial"},{"id":"Layer 12","remaining":"von Mises-Fisher normalizer and moments for d at least 2; wrapped-normal density series; wrapped-law chart cdfs and quantiles","state":"partial"},{"id":"Layer 13","remaining":"quantiles for several newer scalar families and for most non-scalar observables","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"}],"readme_sha":"b2f66314aae9b6afd33588f3e918508e316123f5d62f1e437fe69e63446a3ae4","roadmap":"StandardDistributions","to_sha":"36f24f5d94ccf25e167520cf4c0f1a028c064fb0"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `36f24f5` (2026-10-28T00:12:20Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–6 are done, from the elementary scalar families through the full Wishart and inverse-Wishart theory. Layers 7–13 are all partial, and the noncentral t and F laws and the circular laws are now nearly complete. LKJ correlation laws (Layer 14) and scalar stable laws (Layer 15) have not begun.

### Named results

- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries. Those below the diagonal are standard Gaussian, and diagonal entry `i` (counting from zero) is chi with `n - i` degrees of freedom ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Inverse-Wishart diagonal marginals** — at any positive-definite scale `S`, entry `(i, i)` of an inverse-Wishart matrix is inverse gamma with shape `(n - p + 1)/2` and scale `S i i / 2` ([`TauCeti.Probability.map_coe_apply_inverseWishartMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Wishart/Inverse/Marginal.html#TauCeti.Probability.map_coe_apply_inverseWishartMeasure)).
- **Order statistics of uniform samples** — the `k`-th smallest of `n` independent uniforms (counting from zero) is Beta(`k + 1`, `n - k`) ([`TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/OrderStatistic/Basic.html#TauCeti.Probability.map_orderStatistic_pi_uniformMeasure)).
- **Gaussian sums of squares are noncentral chi-squared** — for independent unit-variance Gaussians, the sum of squares is noncentral chi-squared with noncentrality the squared length of the mean vector ([`TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/NoncentralChiSquared/Gaussian.html#TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral)). The noncentral F and Beta laws are built on it, and the noncentral F law now has a [Poisson-series density](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/NoncentralF/PDF.html#TauCeti.Probability.noncentralFPDFReal), cdf and quantile.
- **Fourier criterion for convergence to Haar measure** — laws on the circle tend weakly to Haar probability exactly when every nonzero integer Fourier moment tends to zero ([`MeasureTheory.ProbabilityMeasure.tendsto_haarAddCircle_iff`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Fourier.html#MeasureTheory.ProbabilityMeasure.tendsto_haarAddCircle_iff)). As their spread grows, the wrapped normal and wrapped Cauchy laws become uniform.

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to one-dimensional Gamma and Gaussian integrals. This gives the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes every Wishart density.
- **Incomplete special functions and their inverses** — the regularized incomplete Gamma and Beta functions, the error function, and their inverses such as [`TauCeti.inverseRegularizedGamma`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gamma/Quantile.html#TauCeti.inverseRegularizedGamma) give closed-form cdfs and quantiles across the scalar families.
- **The von Mises–Fisher law as a tilt of the uniform sphere** — [`TauCeti.Probability.vonMisesFisherNaturalMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/VonMisesFisher/Basic.html#TauCeti.Probability.vonMisesFisherNaturalMeasure) is defined for every natural parameter, so its directional moment generating function is a ratio of normalizers before any Bessel formula is known.

### Roadmap coverage

- **Done:** Layers 0–6.
- **Partial:**
  - Layer 7 now has zero-inflated and zero-truncated Poisson and negative-binomial laws, and weak continuity for the multivariate log-normal and noncentral Beta laws. It still lacks hurdle laws, Gaussian mixtures, and weak continuity for the logistic-normal and proper complex Gaussian laws.
  - Layer 8 lacks only the Gaussian lattice sum and its theta identity.
  - Layer 9 gained finite Zipf and the beta-negative-binomial transforms. It lacks the discrete Laplace and discrete Gaussian, the multivariate hypergeometric, the integer-interval uniform, and the negative-multinomial characteristic function.
  - Layer 10 gained Bates and the noncentral t and F densities and cdfs. It lacks the truncated and skew normal, the triangular law, and the noncentral Beta density and cdf.
  - Layer 11 lacks the multivariate t and matrix normal densities, the conditional multivariate t, the proper complex Gaussian, and the logistic-normal density.
  - Layer 12 lacks the von Mises–Fisher normalizer and moments in dimension two and up, the wrapped-normal density series, and chart cdfs for the wrapped laws.
  - Layer 13 lacks quantiles for several of the newer families and for most non-scalar observables.
- **Untouched:** Layers 14 and 15.

## The frontier

- **Von Mises–Fisher in higher dimension** — the normalizer `(2π)^{d/2} κ^{1-d/2} I_{d/2-1}(κ)`, the mean and second moment, and the density of the projection onto the mean direction. The Bessel `I` circle integral and the uniform-sphere coordinate laws are in place.
- **Densities of the multivariate laws** — the multivariate t, matrix normal and logistic-normal densities, then the conditional multivariate t. The multivariate log-normal density shows the pattern.
- **Missing scalar and discrete families** — truncated and skew normal (the skew-normal cdf via Owen's T is ready), triangular, hurdle counts, discrete Laplace and the multivariate hypergeometric. The noncentral Beta law still needs a density and cdf.
- **Gaussian lattice sums** — the theta-function identity of Layer 8.3. It blocks the discrete Gaussian of Layer 9 and the wrapped-normal density series of Layer 12.
- **The untouched layers** — LKJ correlation-matrix laws (14) and scalar stable laws (15). The Lévy, Cauchy and Gaussian special cases that stable laws should recover are already in place.

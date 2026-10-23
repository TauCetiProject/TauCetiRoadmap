<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba","ts":"2026-10-23T04:01:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"6.8: inverse-Wishart diagonal marginals and the Schur-complement chi-squared law at general positive-definite scale","state":"partial"},{"id":"Layer 7","remaining":"zero-inflated, zero-truncated and hurdle laws, size biasing, parts of the weak-continuity table","state":"partial"},{"id":"Layer 8","remaining":"Bessel I circle integral; zeta and Gaussian lattice sums","state":"partial"},{"id":"Layer 9","remaining":"Zipf, discrete Laplace and Gaussian, sampling without replacement; moments of negative multinomial and beta-negative-binomial","state":"partial"},{"id":"Layer 10","remaining":"noncentral t and Beta, inverse Gaussian, truncated and skew normal, Bates","state":"partial"},{"id":"Layer 11","remaining":"multivariate t, proper complex Gaussian, simplex logistic-normal, matrix normal density","state":"partial"},{"id":"Layer 12","remaining":"uniform ball, sphere-coordinate Beta laws, von Mises-Fisher, circle, wrapped normal and wrapped Cauchy","state":"partial"},{"id":"Layer 13","remaining":"Wishart and inverse-Wishart diagonal quantiles and all multivariate and matrix observables","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"}],"readme_sha":"570b4674e33f287b544e31bd4b70e94ffdc62fe3f079da6b86617b1392e8e2e3","roadmap":"StandardDistributions","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `bfcff79` (2026-10-23T04:01:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The scalar, multivariate and Wishart theory of Layers 0–5 is done, and Layer 6 lacks only the inverse-Wishart diagonal marginals at general scale. Layers 7–13 are all partial: 11 and 12 now have their first laws, and compound and mixed Poisson laws are in. Layers 14 (LKJ) and 15 (stable laws) have not begun.

### Named results

- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries, standard Gaussian below the diagonal and chi with `n - i` degrees on diagonal entry `i` (counting from zero) ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Gaussian directions are uniform on the sphere** — the direction of a standard Gaussian vector is uniform on the unit sphere and independent of its norm ([`TauCeti.Probability.stdGaussian_map_sphereDirection_prod_norm`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Uniform/Sphere.html#TauCeti.Probability.stdGaussian_map_sphereDirection_prod_norm)).
- **The noncentral chi-squared law of a Gaussian norm** — the squared norm of an identity-covariance Gaussian vector with mean `m` is noncentral chi-squared with noncentrality `‖m‖²` ([`TauCeti.Probability.map_norm_sq_multivariateGaussian_noncentral`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/NoncentralChiSquared/Gaussian.html#TauCeti.Probability.map_norm_sq_multivariateGaussian_noncentral)).
- **Order statistics of uniform samples are Beta** — the `k`-th smallest of `n` independent uniforms (counting from zero) has law Beta(`k + 1`, `n - k`), and for a general law it is this Beta law pushed through the source quantile ([`TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/OrderStatistic/Basic.html#TauCeti.Probability.map_orderStatistic_pi_uniformMeasure)).
- **Logarithmic-series compounding gives the negative binomial** — a Poisson number of independent logarithmic-series jumps at intensity `-r log (1 - q)` has the negative-binomial law of shape `r` and success probability `1 - q` ([`TauCeti.Probability.compoundPoissonMeasure_logarithmicSeriesMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/LogarithmicSeries/CompoundPoisson.html#TauCeti.Probability.compoundPoissonMeasure_logarithmicSeriesMeasure)).

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to one-dimensional Gamma and Gaussian integrals, giving the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes every Wishart density.
- **Mixtures and convolution powers** — a general `bind` mixture API with [the law of total variance](https://taucetiproject.org/docs/TauCeti/Probability/Moments/Mixture.html#TauCeti.Probability.variance_bind), together with convolution powers, yields [`TauCeti.Probability.compoundPoissonMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/CompoundPoisson/Basic.html#TauCeti.Probability.compoundPoissonMeasure) and [`TauCeti.Probability.mixedPoissonMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Poisson/Mixed/Basic.html#TauCeti.Probability.mixedPoissonMeasure). The noncentral chi-squared and F laws, the negative multinomial and the Dirichlet-multinomial are all built as such mixtures.
- **Incomplete special functions, their inverses, and quantile transport** — [`TauCeti.inverseRegularizedGamma`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gamma/Quantile.html#TauCeti.inverseRegularizedGamma), [`TauCeti.inverseRegularizedIncompleteBeta`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteBeta.html#TauCeti.inverseRegularizedIncompleteBeta) and [`TauCeti.Probability.quantile_map_affine`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Affine.html#TauCeti.Probability.quantile_map_affine) give closed quantiles for the classical families and let new families inherit quantiles from a standard form.

### Roadmap coverage

- **Done:** Layers 0–5.
- **Layer 6:** done except 6.8. Inverse-Wishart diagonal entries are inverse-Gamma only at identity scale.
- **Partial:**
  - Layer 7 now has compound and mixed Poisson, power biasing and general mixtures alongside its quantile, truncation and hazard work. It lacks zero-inflated, zero-truncated and hurdle laws, size biasing, and parts of the weak-continuity table.
  - Layer 8 is unchanged: no Bessel I circle integral, and no zeta or Gaussian lattice sums.
  - Layer 9 lacks Zipf, discrete Laplace and Gaussian, and sampling without replacement. The negative multinomial and beta-negative-binomial laws have masses and normalization but no moments or quantiles yet.
  - Layer 10 lacks noncentral t and noncentral Beta, inverse Gaussian, truncated and skew normal, and Bates.
  - Layer 11 has the matrix normal (without its density) and the multivariate log-normal. Multivariate t, proper complex Gaussian and simplex logistic-normal are missing.
  - Layer 12 has only the uniform sphere. The uniform ball, sphere-coordinate Beta laws, von Mises–Fisher and the circular laws are missing.
  - Layer 13 now covers mixture, compound-Poisson and most new scalar quantiles, but not Wishart diagonals or the multivariate and matrix observables.
- **Untouched:** Layers 14 and 15.

## The frontier

- **Inverse-Wishart diagonal marginals at general scale** — extend the identity-scale result to `(IW(n,S))ᵢᵢ ∼ InverseGamma((n-p+1)/2, Sᵢᵢ/2)` through the README's permutation, congruence and block-inverse steps.
- **Remaining noncentral and scalar laws** — noncentral t and noncentral Beta (the noncentral chi-squared mixture machinery is ready), inverse Gaussian, truncated and skew normal (Owen's T is ready), and Bates as a rescaled Irwin–Hall.
- **Completing Layers 11 and 12** — the matrix normal density, multivariate t, complex Gaussian and logistic-normal; the uniform ball and the Beta laws of sphere coordinates. Von Mises–Fisher and the circle laws need the Bessel I circle integral first.
- **Zero-inflated, truncated and hurdle laws; sampling without replacement** — the atom-mixture quantile and moment API is in place for the first group; multivariate and negative hypergeometric laws remain for the second.
- **Zeta and lattice sums** — Layer 8.3 is the prerequisite for Zipf and the discrete Gaussian, and its theta identities feed the wrapped normal.

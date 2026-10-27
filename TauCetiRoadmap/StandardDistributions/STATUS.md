<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629","ts":"2026-10-27T10:39:33Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"zero-inflated and hurdle laws, Gaussian mixtures, and the remaining entries of the weak-continuity table such as the multivariate log-normal","state":"partial"},{"id":"Layer 8","remaining":"Gaussian lattice sums and their theta-function identity","state":"partial"},{"id":"Layer 9","remaining":"discrete Laplace and Gaussian, multivariate hypergeometric, integer-interval uniform, negative-multinomial characteristic function","state":"partial"},{"id":"Layer 10","remaining":"truncated and skew normal, triangular law, and the noncentral Beta density, cdf and quantile","state":"partial"},{"id":"Layer 11","remaining":"multivariate t and matrix normal densities, proper complex Gaussian, simplex logistic-normal","state":"partial"},{"id":"Layer 12","remaining":"von Mises-Fisher; wrapped-normal density series and chart cdf; circular quantiles","state":"partial"},{"id":"Layer 13","remaining":"quantiles for hypoexponential, noncentral Beta and other scalar families, and for categorical, multivariate and matrix observables","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"}],"readme_sha":"570b4674e33f287b544e31bd4b70e94ffdc62fe3f079da6b86617b1392e8e2e3","roadmap":"StandardDistributions","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `dd217c4` (2026-10-27T10:39:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–6 are done, from the elementary scalar families through the full Wishart and inverse-Wishart theory. Layers 7–13 are partial; among the noncentral laws only the noncentral Beta density and cdf are missing. LKJ correlation laws (Layer 14) and scalar stable laws (Layer 15) have not begun.

### Named results

- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries. Below the diagonal they are standard Gaussian; diagonal entry `i` (from zero) is chi with `n - i` degrees of freedom ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Inverse-Wishart diagonal marginals** — at any positive-definite scale `S`, the entry `(i, i)` of an inverse-Wishart matrix is inverse gamma with shape `(n - p + 1)/2` and scale `S i i / 2` ([`TauCeti.Probability.map_coe_apply_inverseWishartMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Wishart/Inverse/Marginal.html#TauCeti.Probability.map_coe_apply_inverseWishartMeasure)).
- **Order statistics of uniform samples** — the `k`-th smallest of `n` independent uniforms (counting from zero) is Beta(`k + 1`, `n - k`) ([`TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/OrderStatistic/Basic.html#TauCeti.Probability.map_orderStatistic_pi_uniformMeasure)).
- **Gaussian sums of squares are noncentral chi-squared** — for independent unit-variance Gaussians the sum of squares is noncentral chi-squared, with noncentrality the squared length of the mean vector ([`TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/NoncentralChiSquared/Gaussian.html#TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral)).
- **The multivariate t law and its Gaussian limit** — a centred Gaussian vector scaled by `√(ν / V)`, with `V` an independent chi-squared variable, is multivariate t ([`TauCeti.Probability.hasLaw_multivariateT_of_gaussian_chiSquared`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/MultivariateT/Basic.html#TauCeti.Probability.hasLaw_multivariateT_of_gaussian_chiSquared)). As `ν → ∞` it converges weakly to the Gaussian with the same location and scale ([`TauCeti.Probability.tendsto_multivariateTMeasure_atTop`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/MultivariateT/GaussianLimit.html#TauCeti.Probability.tendsto_multivariateTMeasure_atTop)).

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to one-dimensional Gamma and Gaussian integrals. This gives the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes every Wishart density.
- **Incomplete special functions and their inverses** — the regularized incomplete Gamma and Beta functions, the error function, and inverses such as [`TauCeti.inverseRegularizedGamma`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gamma/Quantile.html#TauCeti.inverseRegularizedGamma) give closed cdfs and quantiles across the scalar families. Poisson series of them now give the [noncentral F cdf](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/NoncentralF/Cdf.html#TauCeti.Probability.cdf_noncentralFMeasure_eq).
- **The circle integral of Bessel I** — `∫_{-π}^{π} e^{κ cos θ} cos (n θ) dθ = 2π I_n(κ)` ([`Real.integral_exp_mul_cos_mul_cos`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/BesselI.html#Real.integral_exp_mul_cos_mul_cos)) normalizes the von Mises law and gives its Fourier moments.

### Roadmap coverage

- **Done:** Layers 0–6.
- **Partial:**
  - Layer 7 now has zero-truncated Poisson and negative binomial laws and the noncentral Beta continuity entry. It lacks zero-inflated and hurdle laws, Gaussian mixtures, and other continuity entries such as the multivariate log-normal.
  - Layer 8 lacks only the Gaussian lattice sum and its theta identity.
  - Layer 9 now has finite Zipf and the beta-negative-binomial transforms. It lacks the discrete Laplace and discrete Gaussian, the multivariate hypergeometric, the integer-interval uniform and the negative-multinomial characteristic function.
  - Layer 10 has the Bates law and the noncentral t and F densities, cdfs and quantiles. It lacks the truncated and skew normal, the triangular law, and the noncentral Beta density, cdf and quantile.
  - Layer 11 lacks the multivariate t and matrix normal densities, the proper complex Gaussian and the simplex logistic-normal.
  - Layer 12 now has the wrapped normal law but lacks von Mises–Fisher, the wrapped-normal density series and chart cdf, and circular quantiles.
  - Layer 13 lacks quantiles for some scalar families, among them hypoexponential and noncentral Beta, and for the categorical, multivariate and matrix observables.
- **Untouched:** Layers 14 and 15.

## The frontier

- **The noncentral Beta density and cdf** — the Poisson series of Beta densities and cdfs, with the atom at zero when the first shape is zero, then the root quantile and the link to noncentral F. Its moments and weak continuity are in place.
- **Remaining scalar and count families** — truncated and skew normal (the skew-normal cdf via Owen's T is ready), the triangular law, and zero-inflated and hurdle counts, which can now start from the zero-truncated laws.
- **Gaussian lattice sums** — the theta-function identity of Layer 8.3. It blocks the discrete Gaussian of Layer 9 and the equivalence of the two wrapped-normal density series in Layer 12.
- **Multivariate densities and transforms** — the multivariate t and matrix normal densities at positive-definite scale, and the negative-multinomial characteristic function.
- **The untouched layers** — LKJ correlation-matrix laws (14) and scalar stable laws (15). The Lévy, Cauchy and Gaussian special cases that stable laws should recover are in place, and the Lévy law now has its mgf and quantile.

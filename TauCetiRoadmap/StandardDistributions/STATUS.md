<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3","ts":"2026-10-26T19:49:38Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"zero-inflated and hurdle laws, Gaussian mixtures, and the remaining entries of the weak-continuity table","state":"partial"},{"id":"Layer 8","remaining":"Gaussian lattice sums and their theta-function identity","state":"partial"},{"id":"Layer 9","remaining":"discrete Laplace and Gaussian, finite Zipf, multivariate hypergeometric, integer-interval uniform; negative-multinomial charFun, beta-negative-binomial transforms","state":"partial"},{"id":"Layer 10","remaining":"truncated and skew normal, Bates and triangular; densities and cdfs of the noncentral t, F and Beta laws","state":"partial"},{"id":"Layer 11","remaining":"proper complex Gaussian, simplex logistic-normal, densities of the multivariate t and matrix normal","state":"partial"},{"id":"Layer 12","remaining":"von Mises-Fisher and wrapped normal laws; circular cdfs and quantiles","state":"partial"},{"id":"Layer 13","remaining":"quantiles for several new scalar families and for categorical, multivariate and matrix observables","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"}],"readme_sha":"570b4674e33f287b544e31bd4b70e94ffdc62fe3f079da6b86617b1392e8e2e3","roadmap":"StandardDistributions","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `938acbb` (2026-10-26T19:49:38Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–6 are done, from the elementary scalar families through the full Wishart and inverse-Wishart theory. Layers 7–13 are all partial, and LKJ correlation laws (Layer 14) and scalar stable laws (Layer 15) have not begun.

### Named results

- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries. Those below the diagonal are standard Gaussian, and diagonal entry `i` (counting from zero) is chi with `n - i` degrees of freedom ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Inverse-Wishart diagonal marginals** — at any positive-definite scale `S`, the entry `(i, i)` of an inverse-Wishart matrix is inverse gamma with shape `(n - p + 1)/2` and scale `S i i / 2` ([`TauCeti.Probability.map_coe_apply_inverseWishartMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Wishart/Inverse/Marginal.html#TauCeti.Probability.map_coe_apply_inverseWishartMeasure)). Equivalently, the Schur complement of a Wishart matrix away from one coordinate is a scaled chi-squared variable ([`TauCeti.Probability.map_inv_inv_apply_nonsingularWishartMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Wishart/Inverse/Marginal.html#TauCeti.Probability.map_inv_inv_apply_nonsingularWishartMeasure)).
- **Order statistics of uniform samples** — the `k`-th smallest of `n` independent uniforms (counting from zero) is Beta(`k + 1`, `n - k`) ([`TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/OrderStatistic/Basic.html#TauCeti.Probability.map_orderStatistic_pi_uniformMeasure)), and the gaps between the sorted points are Dirichlet with all shapes one.
- **Gaussian sums of squares are noncentral chi-squared** — for independent unit-variance Gaussians the sum of squares has the noncentral chi-squared law, with noncentrality the squared length of the mean vector ([`TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/NoncentralChiSquared/Gaussian.html#TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral)). The noncentral F and Beta laws are built on it.
- **The multivariate t law** — a centred Gaussian vector scaled by `√(ν / V)`, with `V` an independent chi-squared variable, is multivariate t ([`TauCeti.Probability.hasLaw_multivariateT_of_gaussian_chiSquared`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/MultivariateT/Basic.html#TauCeti.Probability.hasLaw_multivariateT_of_gaussian_chiSquared)), and each of its linear projections is a location-scale Student t law.

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to one-dimensional Gamma and Gaussian integrals. This gives the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes every Wishart density.
- **Incomplete special functions and their inverses** — the regularized incomplete Gamma and Beta functions, the error function, and their inverses such as [`TauCeti.inverseRegularizedGamma`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gamma/Quantile.html#TauCeti.inverseRegularizedGamma) give closed cdfs and quantiles across the scalar families.
- **The circle integral of Bessel I** — `∫_{-π}^{π} e^{κ cos θ} cos (n θ) dθ = 2π I_n(κ)` ([`Real.integral_exp_mul_cos_mul_cos`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/BesselI.html#Real.integral_exp_mul_cos_mul_cos)) normalizes the von Mises law and gives its Fourier moments.

### Roadmap coverage

- **Done:** Layers 0–6.
- **Partial:**
  - Layer 7 has compound and mixed Poisson laws, general mixtures, power biasing, censoring and a weakly continuous matrix normal family. It lacks zero-inflated and hurdle laws and several weak-continuity entries, among them the multivariate log-normal and noncentral Beta.
  - Layer 8 lacks only the Gaussian lattice sum and its theta identity.
  - Layer 9 lacks the discrete Laplace and discrete Gaussian, finite Zipf, the multivariate hypergeometric and the integer-interval uniform. The negative multinomial now has its mgf, factorial moments and convolution but no characteristic function. The beta-negative-binomial still lacks its transforms.
  - Layer 10 lacks the truncated and skew normal, Bates and triangular laws, and densities and cdfs for the noncentral t, F and Beta laws.
  - Layer 11 lacks the multivariate t and matrix-normal densities, the proper complex Gaussian and the simplex logistic-normal.
  - Layer 12 lacks von Mises–Fisher and wrapped normal laws.
  - Layer 13 lacks quantiles for several new scalar families and for the categorical, multivariate and matrix observables.
- **Untouched:** Layers 14 and 15.

## The frontier

- **Completing the noncentral laws** — densities, cdfs and quantiles for the noncentral t, F and Beta laws, and moments for the noncentral chi.
- **Missing scalar and discrete families** — truncated and skew normal (the skew-normal cdf via Owen's T is ready), Bates and triangular, and zero-inflated and hurdle counts. The Lévy, inverse Gaussian, Irwin–Hall and hypoexponential laws still need quantiles.
- **Finishing the multivariate count laws** — the negative-multinomial characteristic function, and the beta-negative-binomial pgf, mgf and characteristic function.
- **Gaussian lattice sums** — the theta-function identity of Layer 8.3. It blocks the discrete Gaussian of Layer 9 and the wrapped normal of Layer 12.
- **The untouched layers** — LKJ correlation-matrix laws (14) and scalar stable laws (15). The Lévy, Cauchy and Gaussian special cases that stable laws should recover are already in place.

<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"}],"readme_sha":"533dfe00919f9cac88ce78a05e89eb066fb50c57960762357846b2f69c78d349","roadmap":"StandardDistributions","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All seven layers are done, from the scalar families and closed-form cdfs of Layers 0–4 to the multivariate Gaussian, Dirichlet and multinomial laws of Layer 5 and the Wishart theory of Layer 6. What remains is cosmetic: a few boundary cases without lemmas of their own, and local stand-ins waiting for upstream Mathlib declarations.

### Named results

- **The Gaussian-Gram form of the Wishart law** — when the covariance is positive definite and there are at least as many vectors as the dimension, the Gram sum of independent centred Gaussian vectors has the nonsingular Wishart density law. So the two Wishart constructions agree wherever both are defined ([`TauCeti.Probability.hasLaw_wishartGram_gaussian_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Agreement.html#TauCeti.Probability.hasLaw_wishartGram_gaussian_nonsingularWishartMeasure)).
- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries. Those below the diagonal are standard Gaussian, and diagonal entry `i` (counting from zero) is chi with `n - i` degrees of freedom ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **The Wishart mean and covariance** — for real degree `n > p - 1` and positive-definite scale `S`, the mean is `n • S`, and entries `(i, j)` and `(k, l)` have covariance `n (S i k * S j l + S i l * S j k)` ([`TauCeti.Probability.integral_id_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Moments.html#TauCeti.Probability.integral_id_nonsingularWishartMeasure), [`TauCeti.Probability.covariance_coe_apply_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Moments.html#TauCeti.Probability.covariance_coe_apply_nonsingularWishartMeasure)).
- **Wishart marginals** — congruence by a matrix `M` of full row rank carries the Wishart law of scale `S` to that of scale `M * S * Mᵀ`. In particular every principal submatrix of a Wishart matrix is Wishart ([`TauCeti.Probability.map_symmetricCongruenceLinearMap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Marginal.html#TauCeti.Probability.map_symmetricCongruenceLinearMap_nonsingularWishartMeasure)).
- **The conditional Gaussian law** — conditioning one block of a jointly Gaussian vector on the other gives the Gaussian with affine mean and Schur-complement covariance, provided the observed block's covariance is positive definite ([`EuclideanSpace.gaussianCondKernel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gaussian/Conditional.html#EuclideanSpace.gaussianCondKernel)).

### Notable definitions and infrastructure

- **Two Wishart families** — [`TauCeti.Probability.wishartGramMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Basic.html#TauCeti.Probability.wishartGramMeasure) is the Gram law at every scale, so it keeps singular laws instead of sending them to zero. [`TauCeti.Probability.nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Nonsingular.html#TauCeti.Probability.nonsingularWishartMeasure) is the real-degree density family. Both have the same trace moment-generating function, so one argument gives the moments of each.
- **Integration over the positive-definite cone** — [`TauCeti.symmetricLebesgue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Lebesgue.html#TauCeti.symmetricLebesgue) fixes the normalization of Lebesgue measure on symmetric matrices. The Cholesky change of variables then turns cone integrals into integrals over triangular coordinates, where the integrand factorizes into one-dimensional Gamma and Gaussian integrals ([`TauCeti.integral_lowerTriangle_det_rpow_mul_exp_neg_trace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Cholesky.html#TauCeti.integral_lowerTriangle_det_rpow_mul_exp_neg_trace)). The result is the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes the Wishart density.
- **Incomplete special functions** — the error function [`TauCeti.Real.erf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Erf.html#TauCeti.Real.erf) and the regularized incomplete gamma and beta functions express the cdfs that have no elementary form. These run from the Gaussian and gamma cdfs to the Student t and F cdfs and the binomial, negative-binomial and Poisson tails.

### Roadmap coverage

All seven layers are done. Layers 0–4 cover the following:

- Mathlib's scalar families and the uniform law, with their densities, moments, transforms and parameter measurability.
- The incomplete special functions and closed-form cdfs.
- The nine new scalar families.
- The pushforward, ratio, mixture and extreme-value relations among the families.

Layer 5 is done. It includes the multivariate Gaussian density, its Bochner mean (taken from Mathlib's `ProbabilityTheory.integral_id_multivariateGaussian` and restated for random variables) and its conditional law, along with the Dirichlet and multinomial laws.

Layer 6 is also done: symmetric Lebesgue measure, Cholesky coordinates, the multivariate Gamma integral, both Wishart families and their agreement, Bartlett, the moments and marginals, and the inverse-Wishart law.

## The frontier

- **Named boundary corollaries** — the chi-squared mean, variance and characteristic function at `k = 0`, and the log-normal mean and variance at `v = 0`, hold only as instances of the general theorems. Nothing is missing mathematically; named lemmas would just make them easier to find. The negative-binomial case at `p = 1` now has its own lemma ([`TauCeti.Probability.negativeBinomialMeasure_eq_dirac_of_successProbability_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/NegativeBinomial/Basic.html#TauCeti.Probability.negativeBinomialMeasure_eq_dirac_of_successProbability_eq_one)).
- **Retiring local stand-ins** — the error function follows the shape proposed in mathlib4#34053, and the exponential mgf and memorylessness follow mathlib4#35504. The README asks for these local versions to be removed once the pinned Mathlib provides the upstream declarations.

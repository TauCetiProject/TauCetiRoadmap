<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"d8476fa9f4c2cec35cabffce100e7c2e75966e6c","ts":"2026-09-09T22:44:31Z"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `d8476fa` (2026-09-09T22:44:31Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–4 are complete. Layer 5 has the principal Gaussian affine, transform, quadratic-form, and conditional-law results but still lacks the multivariate density, a complete multinomial theory, and any Dirichlet development; Layer 6 has substantial symmetric-matrix foundations, while Cholesky and the distributional work have not begun.

### Named results

- **The conditional multivariate Gaussian law** — conditioning one coordinate block on another gives a Gaussian kernel with the usual affine conditional mean and Schur-complement covariance, assuming the full covariance is positive semidefinite and the observed block is positive definite ([`TauCeti.condDistrib_multivariateGaussian`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gaussian/Conditional.html#TauCeti.condDistrib_multivariateGaussian)).
- **The Gaussian quadratic-form mgf** — for a centred multivariate Gaussian, the exponential moment of a symmetric quadratic form is a determinant to the power `-1/2`, exactly on the domain where the square-root sandwich pencil is positive definite ([`TauCeti.mgf_inner_toEuclideanLin_multivariateGaussian`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gaussian/QuadraticForm.html#TauCeti.mgf_inner_toEuclideanLin_multivariateGaussian)).
- **Gamma–Beta independence** — the ratio and sum of two independent Gamma variables with a common rate have the product of a Beta law and a Gamma law ([`TauCeti.map_div_add_prod_gammaMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gamma/Beta.html#TauCeti.map_div_add_prod_gammaMeasure)).
- **The Gamma–Poisson mixture identity** — mixing a Poisson rate by the appropriate Gamma law produces a negative-binomial law ([`TauCeti.Probability.bind_gammaMeasure_poissonMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gamma/Poisson.html#TauCeti.Probability.bind_gammaMeasure_poissonMeasure)).
- **The Student t ratio representation** — a standard Gaussian divided by the square root of an independent scaled chi-squared variable has the Student t law ([`TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/StudentT/ChiSquared.html#TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared)).

### Notable definitions and infrastructure

- **The negative-binomial law** ([`TauCeti.Probability.negativeBinomialMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/NegativeBinomial/Basic.html#TauCeti.Probability.negativeBinomialMeasure)) — supplies the measure-level family needed for convolution, geometric sums, Gamma–Poisson mixtures, cumulative masses, and cast-law transforms, including its shape-zero Dirac boundary.
- **The multinomial law** ([`TauCeti.Probability.multinomialMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Multinomial/Basic.html#TauCeti.Probability.multinomialMeasure)) — provides a finite weighted-Dirac measure on count vectors, its support and singleton masses, binomial cell marginals, and directional exponential transforms.
- **Symmetric Lebesgue measure** ([`TauCeti.symmetricLebesgue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Lebesgue.html#TauCeti.symmetricLebesgue)) — fixes upper-triangular coordinates and the normalization needed for matrix densities; the singular locus is null and invertible congruence has Jacobian factor `|det C|^(p+1)`.

### Roadmap coverage

- **Layers 0–2: done.** The scalar density bridges, elementary theories, probability-generating functions, incomplete special functions, and requested closed-form cdfs remain complete.
- **Layers 3–4: done.** All nine new scalar families now have their requested APIs, and all six groups of classical distributional relations have landed, including the roadmap's compatibility checks.
- **Layer 5: partial.** Covariance matrices are still missing the Bochner mean, and the multivariate Gaussian density and singularity theorem are absent. Affine maps, linear and quadratic transforms, and conditional Gaussian laws are done. Multinomial measures, masses, cell marginals, and directional mgfs exist, but aggregation, mean, covariance, characteristic function, and parameter measurability are not established here; Dirichlet and the remaining shared parameter-measurability work are untouched.
- **Layer 6: partial.** The visible declarations establish the symmetric carrier, Frobenius geometry, upper-triangular coordinates, normalized Lebesgue measure, null singular locus, and congruence change of variables. Because declaration context for this large contribution is truncated, the layer's first item is not certified complete here. Cholesky, multivariate Gamma, both Wishart families, Bartlett decomposition, inverse-Wishart, and matrix-family parameter measurability are untouched.

## The frontier

- **Multivariate Gaussian density** — prove the positive-definite `HasPDF` and Radon–Nikodym formulas by affine change of variables and the complementary singularity theorem; the Bochner mean is separately still missing from the covariance item.
- **Multinomial moments and aggregation** — add fibre-sum pushforwards, the Euclidean mean and covariance matrix, the characteristic function, and parameter measurability; the measure, cell marginals, and directional mgf are available.
- **Dirichlet distribution** — construct the normalized-Gamma pushforward and then prove its simplex support, chart density, moments, marginals, aggregation, and measurability; the Gamma–Beta independence theorem supplies the two-coordinate check.
- **Cholesky and multivariate Gamma** — build the topology-compatible Cholesky equivalence and its Jacobian, then use it to establish the multivariate-Gamma integral over the positive-definite cone.
- **Wishart families** — define the nonsingular density and Gaussian-Gram laws only after the Cholesky and multivariate-Gamma prerequisites; their transforms can reuse the completed Gaussian quadratic-form mgf, while Bartlett and inverse-Wishart remain downstream.

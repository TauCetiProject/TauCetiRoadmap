<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"14e3bf8fa527a79fc9d9fd40529fbe48e93e9a31","ts":"2026-09-10T04:20:00Z"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `14e3bf8` (2026-09-10T04:20:00Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 to 4 are done: every scalar family the roadmap names exists as a measure with its density or mass formula, closed-form cdf, moments, transforms and parameter measurability, and the classical relations among the families are proved. Layer 5 is partial, and Layer 6 has its symmetric-matrix carrier but no Wishart theory.

### Named results

- **The Student t ratio** — a standard Gaussian over the root of an independent chi-squared, normalised by its degrees of freedom, has Student's t law ([`TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/StudentT/ChiSquared.html#TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared)).
- **The Gamma-Beta decomposition** — for two independent gamma variables with a common rate, the ratio of the first to the sum and the sum itself are independent, with Beta and gamma laws ([`TauCeti.map_div_add_prod_gammaMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gamma/Beta.html#TauCeti.map_div_add_prod_gammaMeasure)).
- **The conditional Gaussian law** — for a jointly Gaussian vector with a positive-definite observed block, the regular conditional distribution is the Gaussian kernel with affine mean and Schur-complement covariance, and the two blocks are independent exactly when their cross-covariance vanishes ([`TauCeti.condDistrib_multivariateGaussian`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gaussian/Conditional.html#TauCeti.condDistrib_multivariateGaussian)).
- **The Gaussian quadratic-form transform** — the exponential moment of `x ↦ ⟪x, Θ x⟫` under a centred multivariate Gaussian is finite exactly on an explicit positive-definite pencil condition, where it is a negative half-power of a determinant ([`TauCeti.mgf_inner_toEuclideanLin_multivariateGaussian`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gaussian/QuadraticForm.html#TauCeti.mgf_inner_toEuclideanLin_multivariateGaussian)). This is the input the Wishart trace transforms need.
- **The Gaussian cdf** — for nonzero variance, `cdf (gaussianReal m v) x = (1 + erf ((x - m) / √(2v))) / 2`, with the Dirac step at `v = 0` separate ([`TauCeti.cdf_gaussianReal_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gaussian/Cdf.html#TauCeti.cdf_gaussianReal_eq)).

### Notable definitions and infrastructure

- **Lebesgue measure on symmetric matrices** ([`TauCeti.symmetricLebesgue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Lebesgue.html#TauCeti.symmetricLebesgue)) — the pushforward of product Lebesgue measure along the upper-triangular coordinates, with the Haar instance Mathlib's Jacobian API wants, the comparison with Frobenius volume, the congruence Jacobian `(det C) ^ (p + 1)`, and the fact that singular matrices are null. This fixes the normalization every Wishart constant depends on.
- **The incomplete special functions** ([`TauCeti.regularizedIncompleteBeta`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/IncompleteBeta.html#TauCeti.regularizedIncompleteBeta), [`TauCeti.regularizedGamma`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma.html#TauCeti.regularizedGamma)) — every closed-form cdf in the roadmap runs through them, now including Student's t, Fisher's F, the inverse-gamma law and the negative binomial.
- **The negative-binomial law** ([`TauCeti.Probability.negativeBinomialMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/NegativeBinomial/Basic.html#TauCeti.Probability.negativeBinomialMeasure)) — real shape, the Dirac boundary at shape zero, convolution in the shape, and a generating function on its exact domain; it is the target of both the geometric-sum and Gamma-mixed-Poisson identities.

### Roadmap coverage

Layers 0 to 2 are done as before: the density and Radon-Nikodym bridges, the uniform law, the elementary theory of all ten Mathlib families with probability generating functions, and the special functions with the six closed-form cdfs and tails. Layer 3 is now done too, all nine new scalar families with their listed formulas and completion checks, and so is Layer 4: Gaussian squares, the three ratios, the Gamma-Beta pushforward, the exponential, geometric and Laplace sums, the Gamma-mixed Poisson law, and i.i.d. maxima and minima. Layer 5 is partial. Items 1, 3 and 4 (covariance matrices, affine images, directional and quadratic-form transforms, conditional laws) are done except the Bochner mean of the multivariate Gaussian, which is not established here; item 2's density is missing; the multinomial has masses, coordinate marginals and directional transforms but no mean, covariance, aggregation or characteristic function; Dirichlet is untouched; and item 7's parameter measurability is unrecorded for both. In Layer 6, item 1 is complete and items 2 to 7 have not begun.

## The frontier

- **The multivariate Gaussian density** — the density against volume on `EuclideanSpace ℝ ι` for positive-definite covariance, singularity otherwise, and the Bochner mean. The affine change of variables from the isotropic product density is the intended route.
- **The multinomial mean and covariance** — the Euclidean mean, the entrywise covariance as `covMatrix` with its `covarianceBilin` corollary, the characteristic function, and aggregation along a map of index types. The law, its masses and its directional mgf are in place.
- **Cholesky and the multivariate Gamma integral** — the equivalence between positive-definite symmetric matrices and positive-diagonal lower-triangular ones, its Jacobian in those coordinates, and the resulting integral over the positive-definite cone. Both gate the Wishart density; the carrier they need now exists.
- **The Wishart families** — the nonsingular real-degree density family and the natural-degree Gaussian-Gram family, their trace transforms and spectral characteristic function, and their agreement for positive-definite scale and degree at least the dimension. The quadratic-form mgf supplies the transforms; the density needs the two items above.
- **Dirichlet** — the whole family: the normalization chart, the lower-dimensional density, the Beta coordinate marginal, mean and covariance. Its Gamma-Beta prerequisite is now proved.

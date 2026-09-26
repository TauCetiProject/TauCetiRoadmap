<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"ecb4a7b62fd4acf11ddc30fb0c6a353882b77ace","ts":"2026-09-18T11:03:03Z"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `ecb4a7b` (2026-09-18T11:03:03Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–4 are done. Layer 5 is complete except for the Bochner mean of the multivariate Gaussian; Layer 6 now contains the full Cholesky–multivariate-Gamma–Wishart route and inverse-Wishart theory, but the real-degree nonsingular Wishart still lacks its mean, entrywise covariance, and general full-row-rank pushforward. No layer is untouched.

### Named results

- **The agreement of the two Wishart families** — for positive-definite scale and natural degree at least the dimension, the Gaussian-Gram law is the nonsingular density law ([`TauCeti.wishartGramMeasure_eq_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Agreement.html#TauCeti.wishartGramMeasure_eq_nonsingularWishartMeasure)).
- **The Bartlett decomposition** — the Cholesky factor of a standard nonsingular Wishart matrix has independent standard-Gaussian strict-lower entries and chi-squared diagonal squares ([`TauCeti.bartlett_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.bartlett_nonsingularWishartMeasure)).
- **The multivariate Gamma integral** — the determinant-power exponential integral over the positive-definite cone is the multivariate Gamma function in its classical convergence range ([`TauCeti.integral_posDef_multivariateGamma`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma)).
- **The conditional Gaussian law** — conditioning one block of a positive-definite jointly Gaussian vector gives the affine-mean, Schur-complement Gaussian kernel ([`TauCeti.condDistrib_multivariateGaussian`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gaussian/Conditional.html#TauCeti.condDistrib_multivariateGaussian)).
- **The Student t ratio** — a standard Gaussian divided by the square root of an independent normalized chi-squared variable has Student's t law ([`TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/StudentT/ChiSquared.html#TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared)).

### Notable definitions and infrastructure

- **The two Wishart measures** — [`TauCeti.wishartGramMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Basic.html#TauCeti.wishartGramMeasure) retains singular Gaussian-Gram laws, while [`TauCeti.nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Nonsingular.html#TauCeti.nonsingularWishartMeasure) provides the real-degree density family on the positive-definite cone.
- **Cholesky coordinates** — [`TauCeti.choleskyEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/Cholesky/Equiv.html#TauCeti.choleskyEquiv) and the [measure change of variables](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Cholesky.html#TauCeti.map_cholesky_symmetricLebesgue) turn cone integrals into independent lower-triangular coordinates.
- **The Dirichlet chart density** — [`TauCeti.Probability.dirichletMeasure_eq_map_withDensity_dirichletChartPDF`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Dirichlet/Density.html#TauCeti.Probability.dirichletMeasure_eq_map_withDensity_dirichletChartPDF) gives the constrained law a lower-dimensional Lebesgue density without asserting ambient absolute continuity.

### Roadmap coverage

Layers 0–4 are complete: the scalar families, special-function cdfs, and stated relations among distributions are all present. In Layer 5, the Gaussian density and singularity alternatives, affine and conditional laws, multinomial theory, Dirichlet theory, and parameter measurability are established; only the multivariate Gaussian Bochner mean is not established here. In Layer 6, items 1–3 and 5–7 are complete. Item 4 has both Wishart families, support and singularity results, convolution, transforms, characteristic functions, Gaussian-Gram moments, one-dimensional specializations, and their agreement in the common range; the declaration list does not establish the nonsingular real-degree mean or covariance, or its full-row-rank rectangular pushforward and principal-submatrix corollary.

## The frontier

- **Nonsingular Wishart moments** — derive the Bochner mean and entrywise covariance for arbitrary valid real degree from the trace mgf; the natural-degree Gaussian-Gram formulas do not cover the whole family.
- **Nonsingular Wishart projections** — prove the full-row-rank rectangular congruence law and then record principal-submatrix marginals; only invertible congruence is established here.
- **The multivariate Gaussian mean** — prove integrability of the identity and that its Bochner integral is the mean vector, closing the sole remaining Layer 5 target.

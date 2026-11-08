<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7","ts":"2026-11-07T20:34:01+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","remaining":"stable quantiles at full skewness and the LKJ entry and partial-correlation quantiles","state":"partial"},{"id":"Layer 14","remaining":"identify the LKJ law with the independent-Beta construction; Beta entry marginals, support, block marginals and quantiles of the law","state":"partial"},{"id":"Layer 15","remaining":"support, density positivity and quantiles at full skewness; tail limits of the law, moment thresholds, mean and symmetric fractional moments","state":"partial"}],"readme_sha":"b2f66314aae9b6afd33588f3e918508e316123f5d62f1e437fe69e63446a3ae4","roadmap":"StandardDistributions","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `e583e15` (2026-11-07T20:34:01+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–12 are done, from the elementary scalar families through the matrix, spherical and circular laws. Both summit layers have now begun. Scalar stable laws (Layer 15) exist with their characteristic function, density and convolution theory, and LKJ correlation laws (Layer 14) have their density and normalizer. Both are partial, as is the quantile coverage of Layer 13 where it depends on them.

### Named results

- **Existence of stable laws** — for every valid index and skewness, the stable law in Nolan's S₀ convention (`TauCeti.Probability.stableMeasure`) is the weak limit of compensated compound-Poisson laws. A Lévy–Khintchine integral gives its exponent, it has a bounded smooth density, and laws of a common index are closed under convolution.
- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries. Those below the diagonal are standard Gaussian, and diagonal entry `i` (counting from zero) is chi with `n - i` degrees of freedom ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Lévy's continuity theorem with existence** — if characteristic functions of probability measures converge pointwise to a limit continuous at zero, then some probability measure has that limit as its characteristic function ([`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/LevyConvergence.html#TauCeti.exists_probabilityMeasure_of_tendsto_charFun)). The stable laws are constructed this way.
- **Orthogonal projections of a Gaussian vector** — projections of a standard Gaussian vector onto mutually orthogonal subspaces are independent, and their squared lengths are chi-squared with the subspace dimensions as degrees of freedom ([`TauCeti.Probability.map_norm_sq_orthogonalProjectionOnto_stdGaussian_pi`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/Projection.html#TauCeti.Probability.map_norm_sq_orthogonalProjectionOnto_stdGaussian_pi)).
- **The theta-function identity for Gaussian lattice sums** — the sum of a Gaussian over the integer translates of a point is a Jacobi theta value ([`Real.gaussianLatticeSum_eq_jacobiTheta₂`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gaussian/LatticeSum.html#Real.gaussianLatticeSum_eq_jacobiTheta₂)). The discrete Gaussian is normalized by it.

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to one-dimensional Gamma and Gaussian integrals. This gives the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes every Wishart density.
- **Correlation coordinates and partial correlations** — [Lebesgue measure on unit-diagonal symmetric matrices](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.correlationLebesgue), together with a [change of variables to partial correlations](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.setIntegral_comp_correlationCoordinatesOfPartialCorrelation) on the open cube, turns the LKJ normalizer into a product of symmetric Beta integrals.
- **Fourier inversion for measures** — a finite measure whose characteristic function is integrable has a bounded continuous [inversion density](https://taucetiproject.org/docs/TauCeti/Analysis/Bochner/CharFun/Inversion.html#MeasureTheory.Measure.eq_withDensity_charFunDensity). This is how stable densities exist without a closed form.

### Roadmap coverage

- **Done:** Layers 0–12. Every gap the previous assessment listed has closed, including hurdle counts and Gaussian mixtures (7), discrete Laplace and Gaussian laws and the multivariate hypergeometric law (9), truncated and skew normal laws (10), the multivariate t and matrix normal densities (11), and the von Mises–Fisher normalizer in all dimensions (12).
- **Partial:**
  - Layer 13 now covers quantiles for nearly every scalar family and the specified non-scalar observables. It still lacks stable quantiles at full skewness and the LKJ quantiles.
  - Layer 14 has the LKJ law with its normalizer and almost-sure positive definiteness. Moments, block marginals and sign symmetry are proved only for the independent-Beta construction, which has not yet been identified with the LKJ law. Beta entry marginals, support and quantiles are absent.
  - Layer 15 has existence, transport and convolution, the Gaussian, Cauchy and Lévy cases, the smooth bounded density, weak continuity and the exact exponential-integrability domain. Support, density positivity and quantiles are proved only when the skewness lies strictly between −1 and 1. The tail asymptotics and moment thresholds of the law are missing.

## The frontier

- **LKJ as an independent-Beta construction** — prove that the LKJ law is the image of independent centered symmetric Beta partial correlations under the Gram map. The determinant moments, entry variance `1/(2η+p−1)`, block marginals and sign symmetry already proved for the construction would then transfer at once.
- **LKJ entry marginals and quantiles** — after that bridge, show `(R_ij + 1)/2` is Beta(α, α) with `α = η + (p−2)/2`, the support statement, and the off-diagonal and partial-correlation quantiles.
- **Fully skewed stable laws** — the one-sided support `[d, ∞)` for index below one, full support for index at least one, density positivity and quantiles. The support lemmas for the compound-Poisson approximants and the divergent-centering limits are in place.
- **Stable tails and moments** — the tail constants of the stable Lévy measure are proved. They still need to be transferred to the law, giving `x^α μ((x, ∞)) → C_α s^α (1 + β)`, then `|x|^q` integrable exactly for `q < α`, the mean for index above one, and the symmetric fractional-moment formula.

<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","remaining":"stable-law quantiles; the rest of the coverage table was not re-audited entry by entry","state":"partial"},{"id":"Layer 14","remaining":"the normalizing integral of (det R)^(eta-1), the LKJ law itself, its Beta marginals, partial-correlation independence and quantiles","state":"partial"},{"id":"Layer 15","remaining":"law-level tails and moment thresholds, fully skewed support, exact exponential domain, and quantiles","state":"partial"}],"readme_sha":"b2f66314aae9b6afd33588f3e918508e316123f5d62f1e437fe69e63446a3ae4","roadmap":"StandardDistributions","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–12 are done, judged by the published documentation. That covers the elementary scalar families, Wishart theory, the discrete and noncentral families, and the multivariate and circular laws. Scalar stable laws (Layer 15) now exist, with densities and convolution, but they lack their tail and moment theory. LKJ correlation laws (Layer 14) have their coordinates and normalizer but no law. Layer 13's quantile coverage is missing only the stable laws, as far as this report could check.

### Named results

- **Existence of scalar stable laws** — for shape below two and any valid skewness, compensated compound-Poisson approximations converge to a law with Nolan's S₀ characteristic function; shape two is Gaussian. These laws are closed under convolution at a common shape and have smooth densities (`TauCeti.Probability.stableMeasure`, `TauCeti.Probability.charFun_stableMeasure`).
- **Lévy's continuity theorem, with existence** — if characteristic functions converge pointwise to a limit continuous at zero, that limit is the characteristic function of a probability measure, and the sequence converges weakly to it ([`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/LevyConvergence.html#TauCeti.exists_probabilityMeasure_of_tendsto_charFun)).
- **Gaussian conditioning at singular covariance** — for any positive-semidefinite joint covariance, one block given another is Gaussian. Its mean is the pseudoinverse regression and its covariance the generalized Schur complement ([`TauCeti.Probability.condDistrib_multivariateGaussian`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/Conditional/Basic.html#TauCeti.Probability.condDistrib_multivariateGaussian)).
- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix has independent entries. Those below the diagonal are standard Gaussian, and the diagonal entries are chi with decreasing degrees of freedom ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **The theta identity for Gaussian lattice sums** — the sum of `exp(-(n - c)²/(2s²))` over the integers is a Jacobi theta value. The same sum normalizes the discrete Gaussian law and, rescaled, is the periodized Gaussian density ([`Real.gaussianLatticeSum_eq_jacobiTheta₂`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gaussian/LatticeSum.html#Real.gaussianLatticeSum_eq_jacobiTheta₂)).

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to Gamma and Gaussian integrals. This gives the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) behind every Wishart density.
- **The Fourier inversion density** — [`MeasureTheory.Measure.charFunDensity`](https://taucetiproject.org/docs/TauCeti/Analysis/Bochner/CharFun/Inversion.html#MeasureTheory.Measure.charFunDensity) is a density for any law on `ℝ` with integrable characteristic function. It is how laws known only through their transform get densities and cdfs, stable laws first among them.
- **Correlation-matrix coordinates** — [`TauCeti.correlationLebesgue`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.correlationLebesgue) is volume on unit-diagonal symmetric matrices, and partial correlations parametrize the positive-definite ones bijectively. This is the reference measure and chart the LKJ law needs.

### Roadmap coverage

- **Done:** Layers 0–12. The gaps named in the previous report are closed: hurdle laws and Gaussian mixtures (7), lattice sums (8), discrete Laplace and Gaussian, the multivariate hypergeometric and integer-interval uniform laws (9), truncated and skew normal, triangular, and the noncentral Beta density (10), the multivariate t, matrix normal, logistic-normal and proper complex Gaussian densities (11), and the higher-dimensional von Mises–Fisher normalizer with wrapped-law densities and chart quantiles (12). Several of these are visible only in the published documentation, not in this window's declaration list, which was cut off.
- **Partial:**
  - Layer 13 lacks stable-law quantiles. The rest of its coverage table was not re-audited entry by entry.
  - Layer 14 has its correlation coordinates (14.1), plus the partial-correlation bijection with its determinant, Jacobian and normalizer (most of 14.2). It lacks the normalizing integral, the law itself, and everything in 14.3–14.4.
  - Layer 15 has the exponent and S₁ conversion, existence, convolution, the Gaussian and Lévy special cases, smooth densities and cdfs, full support for non-extreme skewness, and one-sided exponential moments. It lacks law-level tails and moments, the exact support of fully skewed laws, the exact exponential domain, and quantiles.

## The frontier

- **The LKJ law** — prove that the integral of `(det R)^(η-1)` over correlation coordinates equals the LKJ normalizer, using the determinant and Jacobian already proved. Then define the law and derive its Beta marginals and independent partial correlations; the needed moments of the centered symmetric Beta law are in place.
- **Stable tails and moments** — the power-law tail constants are proved for the stable Lévy measure but not for the law. Transferring them gives the sharp threshold `q < α` for `|x|^q` moments and the symmetric fractional-moment formula.
- **Fully skewed stable laws** — the half-line support for shape below one, strict density positivity there, and non-integrability outside the stated exponential domain. Support results already exist for the compound-Poisson approximants.
- **Stable quantiles** — the cdf is smooth. A unique interior-root quantile needs strict increase on the support interior, and it would also close Layer 13.

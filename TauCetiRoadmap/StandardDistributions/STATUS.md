<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"afa08a3ed16fb167e35de371afb1eb03fbc5913a","ts":"2026-11-06T05:03:45Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","remaining":"quantiles for stable and LKJ laws; coverage of every other family not yet audited","state":"partial"},{"id":"Layer 14","remaining":"the normalizer integral identity, lkjMeasure, Beta entry marginals, partial-correlation independence, determinant moments, block marginals","state":"partial"},{"id":"Layer 15","remaining":"full-skewness support and quantiles, tail limits and moment thresholds, exact exponential domain and Laplace formula","state":"partial"}],"readme_sha":"b2f66314aae9b6afd33588f3e918508e316123f5d62f1e437fe69e63446a3ae4","roadmap":"StandardDistributions","to_sha":"afa08a3ed16fb167e35de371afb1eb03fbc5913a"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `afa08a3` (2026-11-06T05:03:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–12 are done, from the elementary scalar families through Wishart theory, the discrete and noncentral families, and the circular and spherical laws. Scalar stable laws (Layer 15) are mostly built: they exist, have the prescribed characteristic function and a density, and are closed under convolution. Their tails, moments and quantiles are still missing. LKJ correlation laws (Layer 14) have their coordinates and normalizer but no law, and Layer 13 lacks quantiles for these two newest families.

### Named results

- **Existence of stable laws** — in Nolan's `S₀` convention, `TauCeti.Probability.stableMeasure` is the weak limit of compensated compound-Poisson approximations along dyadic cutoffs. It has the characteristic function `exp(imt + Ψ(st))`, and two stable laws of the same shape convolve to a third with explicit parameters.
- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries. Those below the diagonal are standard Gaussian, and diagonal entry `i` (counting from zero) is chi with `n - i` degrees of freedom ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Lévy's continuity theorem with existence** — if the characteristic functions of a sequence of probability measures converge pointwise to a function continuous at zero, a limiting law exists and the sequence converges to it ([`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/LevyConvergence.html#TauCeti.exists_probabilityMeasure_of_tendsto_charFun)).
- **The theta-function identity for Gaussian lattice sums** — the sum of Gaussian weights over the integers is a Jacobi theta value ([`Real.gaussianLatticeSum_eq_jacobiTheta₂`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gaussian/LatticeSum.html#Real.gaussianLatticeSum_eq_jacobiTheta₂)). It normalizes the discrete Gaussian law and the wrapped-normal density series.
- **Gaussian sums of squares are noncentral chi-squared** — for independent unit-variance Gaussians, the sum of squares is noncentral chi-squared with noncentrality the squared length of the mean vector ([`TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/NoncentralChiSquared/Gaussian.html#TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral)). The noncentral F, Beta and chi laws are built on it.

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to one-dimensional Gamma and Gaussian integrals. This gives the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes every Wishart density.
- **Fourier inversion for measures** — a finite measure whose characteristic function is integrable has an explicit bounded continuous density ([`MeasureTheory.Measure.eq_withDensity_re_fourierInv_charFun`](https://taucetiproject.org/docs/TauCeti/Analysis/Bochner/CharFun/Inversion.html#MeasureTheory.Measure.eq_withDensity_re_fourierInv_charFun)). This is how stable laws get their smooth, bounded densities and their cdfs.
- **Correlation-matrix coordinates** — [`TauCeti.correlationLebesgue`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.correlationLebesgue) puts Lebesgue measure on unit-diagonal symmetric matrices. The [partial-correlation map](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.bijOn_correlationCoordinatesOfPartialCorrelation) is a bijection from the open cube onto the positive-definite ones, which is the change of variables the LKJ law needs.

### Roadmap coverage

- **Done:** Layers 0–12. The pieces previously missing from Layers 7–12 now all appear in the published documentation, though they have not been audited here milestone by milestone: Gaussian mixtures, hurdle laws, the Gaussian lattice sum, the discrete Laplace and discrete Gaussian, the multivariate hypergeometric, the truncated and skew normal, the triangular law, the noncentral Beta density, the multivariate t, matrix normal and logistic-normal densities, the conditional multivariate t, the proper complex Gaussian, the von Mises–Fisher normalizer and moments, and the wrapped-law densities and chart quantiles.
- **Partial:**
  - Layer 13 lacks quantiles for stable and LKJ laws. Whether every other family's quantile is in place is not established here.
  - Layer 14 has correlation coordinates (14.1), the partial-correlation bijection with its determinant and Jacobian, and the normalizer `Z_p(η)`. It lacks the identity `∫ (det R)^(η-1) = Z_p(η)` and everything about the law itself (14.3–14.4).
  - Layer 15 has 15.1–15.3 and much of 15.4: the density, the smooth cdf, and full support at interior skewness. It lacks support at full skewness, quantiles, the tail limits and moment thresholds of 15.5, and the exact exponential domain and Laplace formula of 15.6.
- **Untouched:** none.

## The frontier

- **Stable tails and moments** — prove `x^α μ((x, ∞)) → C_α s^α (1 + β)` and its mirror, then the sharp threshold `q < α` for `|x|^q`, the mean for `α > 1`, and the symmetric fractional-moment formula. The tail constant and the small-jump variance estimates are already in place.
- **Stable laws at full skewness** — the one-sided support `[d, ∞)` for `α < 1`, strict density positivity on the support interior, the interior-root quantile, and the exact exponential-integrability domain with `M = e^K`. One-sided exponential finiteness is already proved.
- **The LKJ law** — integrate `(det R)^(η-1)` through the partial-correlation Jacobian to get `Z_p(η)`, then define `lkjMeasure`. Its Beta entry marginals, independent partial correlations, determinant moments and principal-block marginals follow from that change of variables.
- **Closing Layer 13** — the stable and LKJ quantiles, followed by a family-by-family audit of the quantile table.

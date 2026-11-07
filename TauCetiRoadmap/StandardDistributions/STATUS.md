<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f","ts":"2026-11-07T17:18:46+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"hurdle laws and weak continuity of the logistic-normal law, not established here","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"multivariate hypergeometric, integer-interval uniform, negative-multinomial characteristic function, not established here","state":"partial"},{"id":"Layer 10","remaining":"truncated and skew normal, triangular; noncentral Beta density and cdf","state":"partial"},{"id":"Layer 11","remaining":"multivariate t, matrix normal and logistic-normal densities; conditional multivariate t","state":"partial"},{"id":"Layer 12","remaining":"von Mises-Fisher normalizer and moments for d at least 2; wrapped-normal density series; wrapped-law chart cdfs and quantiles","state":"partial"},{"id":"Layer 13","remaining":"quantiles for several newer scalar families and for most non-scalar observables","state":"partial"},{"id":"Layer 14","remaining":"the normalizer Z_p, the LKJ law itself, its moments, marginals and quantiles","state":"partial"},{"id":"Layer 15","remaining":"the stable law: compound-Poisson construction, characteristic function, density, support, tails","state":"partial"}],"readme_sha":"b2f66314aae9b6afd33588f3e918508e316123f5d62f1e437fe69e63446a3ae4","roadmap":"StandardDistributions","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `c9dbc67` (2026-11-07T17:18:46+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–6 are done, from the elementary scalar families through the full Wishart theory. Layer 8's special functions are now done as well, with the Gaussian lattice sum. Layers 7 and 9–13 are partial. The LKJ and stable layers (14 and 15) have their first infrastructure but no law yet, as far as this report can establish. The latest evidence covers only modules up to the hypoexponential law alphabetically, so later families may be further along than stated.

### Named results

- **The Bartlett decomposition**: the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries, standard Gaussian below the diagonal and chi with `n - i` degrees of freedom on diagonal entry `i` ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Gaussian sums of squares are noncentral chi-squared**: for independent unit-variance Gaussians, the sum of squares is noncentral chi-squared, with noncentrality equal to the squared length of the mean vector. ([`TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/NoncentralChiSquared/Gaussian.html#TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral)).
- **Poisson summation for the Gaussian lattice sum**: `∑ₙ exp(-(n - c)²/(2s²))` is the Fourier series with coefficients `√(2π)|s| exp(-2π²s²n²)`, and equals a Jacobi theta value ([`Real.gaussianLatticeSum_eq_fourier`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gaussian/PoissonSummation.html#Real.gaussianLatticeSum_eq_fourier), [`Real.gaussianLatticeSum_eq_jacobiTheta₂`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gaussian/LatticeSum.html#Real.gaussianLatticeSum_eq_jacobiTheta₂)).
- **Lévy's continuity theorem with existence**: if characteristic functions converge pointwise to a function continuous at zero, the limit is the characteristic function of a probability measure, and the laws converge to it ([`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/LevyConvergence.html#TauCeti.exists_probabilityMeasure_of_tendsto_charFun)). This is the existence bridge that Layer 15 asks for.
- **Fourier criterion for convergence to Haar measure**: laws on the circle tend weakly to Haar probability exactly when every nonzero Fourier moment tends to zero ([`MeasureTheory.ProbabilityMeasure.tendsto_haarAddCircle_iff`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Fourier.html#MeasureTheory.ProbabilityMeasure.tendsto_haarAddCircle_iff)).

### Notable definitions and infrastructure

- **Integration over the positive-definite cone**: symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to Gamma and Gaussian integrals. This gives the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes every Wishart density.
- **Correlation matrices in partial-correlation coordinates**: [Lebesgue measure on unit-diagonal symmetric matrices](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.correlationLebesgue) comes with a smooth bijection from the open cube of partial correlations. Under it the determinant is `∏(1 - z²)`, and integrals [change variables](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.setIntegral_comp_correlationCoordinatesOfPartialCorrelation). This is what the LKJ normalizer needs.
- **Fourier inversion for measures**: a finite measure with integrable characteristic function has a bounded continuous [inversion density](https://taucetiproject.org/docs/TauCeti/Analysis/Bochner/CharFun/Inversion.html#MeasureTheory.Measure.eq_withDensity_charFunDensity), which is smooth under weighted integrability. This is the route to stable densities.

### Roadmap coverage

- **Done:** Layers 0–6 and Layer 8.
- **Partial:**
  - Layer 7 now has scalar and multivariate Gaussian mixtures and weak continuity of the proper complex Gaussian. Hurdle laws and weak continuity of the logistic-normal law are not established here.
  - Layer 9 gained the discrete Laplace and discrete Gaussian laws, with cdfs, quantiles and transforms. The multivariate hypergeometric law, the integer-interval uniform law and the negative-multinomial characteristic function are not established here.
  - Layer 10 still lacks the truncated and skew normal, the triangular law, and the noncentral Beta density and cdf.
  - Layer 11 gained the proper complex Gaussian with density and moments. It lacks the multivariate t, matrix normal and logistic-normal densities and the conditional multivariate t.
  - Layer 12 lacks the von Mises–Fisher normalizer in dimension two and up, the wrapped-normal density series and chart cdfs, although the periodized Gaussian density is now available.
  - Layer 13 lacks quantiles for several newer families and most non-scalar observables.
  - Layer 14 has its correlation coordinates and the partial-correlation change of variables (14.1 and most of 14.2), but no normalizer or law.
  - Layer 15 has the analytic tools: the Lévy existence bridge, Fourier inversion, the power-weighted cosine integral and a convolution-positivity lemma. It has no stable law.

## The frontier

- **The LKJ law**: integrate `(det R)^(η-1)` in partial-correlation coordinates to get the normalizer `Z_p(η)`, then the law, its Beta entry marginals and the independence of partial correlations. The coordinate change and determinant formula are in place.
- **Stable laws**: build the compensated compound-Poisson approximants, prove that their characteristic functions converge to `exp Ψ`, and apply the Lévy existence bridge. Densities then follow from Fourier inversion, and support and tails from the jump decomposition.
- **Circular laws**: the wrapped-normal density series now has its periodized Gaussian ingredient. The von Mises–Fisher normalizer in dimension two and up still needs the Bessel `I` formula.
- **Multivariate densities**: the multivariate t, matrix normal and logistic-normal densities, then the conditional multivariate t.
- **Remaining scalar and count families**: truncated and skew normal, triangular, hurdle laws, the multivariate hypergeometric law, and the noncentral Beta density. Some may already have landed in modules not covered here.

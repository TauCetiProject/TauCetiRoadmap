<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"the weak-continuity check for the joint laws of (Z, tZ) with a conditional kernel discontinuous at t = 0","state":"partial"},{"id":"Layer 8","remaining":"locally uniform convergence of the direct periodized Gaussian density series","state":"partial"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","state":"done"},{"id":"Layer 14","remaining":"partial-correlation quantiles with endpoint limits; a stated mixed-entry moment theorem","state":"partial"},{"id":"Layer 15","remaining":"strict cdf increase and unique-root quantiles for fully skewed stable laws with alpha at least one","state":"partial"}],"readme_sha":"b2f66314aae9b6afd33588f3e918508e316123f5d62f1e437fe69e63446a3ae4","roadmap":"StandardDistributions","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–6 and 9–13 are done, from the elementary families through Wishart laws, the discrete and noncentral families, multivariate t, spherical and circular laws, and quantile coverage. LKJ correlation-matrix laws and scalar stable laws are each built and nearly complete. Layers 7, 8, 14 and 15 each lack one or two specific statements.

### Named results

- **The Bartlett decomposition** — the Cholesky entries of a standard Wishart matrix are independent, with standard Gaussian strict-lower entries and chi diagonal entries of successively decreasing degrees ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Gaussian conditioning with singular covariance** — conditioning a jointly Gaussian vector uses pseudoinverse regression and a generalized Schur complement, including singular observed blocks ([`TauCeti.Probability.condDistrib_multivariateGaussian`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/Conditional/Basic.html#TauCeti.Probability.condDistrib_multivariateGaussian)).
- **Independence of the LKJ partial correlations** — the partial correlations of an LKJ matrix of shape η are independent centred symmetric Beta variables, so the law, its Cholesky factor, its entry marginals and its determinant moments all come from independent Beta draws ([`TauCeti.Probability.map_correlationCoordinatesOfPartialCorrelation_pi_betaMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/LKJ/PartialCorrelation.html#TauCeti.Probability.map_correlationCoordinatesOfPartialCorrelation_pi_betaMeasure)).
- **Stable laws in the S₀ convention** — compensated compound Poisson limits produce a law with characteristic function `exp(imt + Ψ(st))`, a bounded smooth density, exact support, and the sharp moment threshold `q < α` from the power-law tail constants (`TauCeti.Probability.charFun_stableMeasure`).
- **Lévy's continuity theorem, including existence** — pointwise convergence of characteristic functions to a function continuous at zero yields a unique limiting probability law; this is the existence step for the stable laws ([`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/LevyConvergence.html#TauCeti.exists_probabilityMeasure_of_tendsto_charFun)).

### Notable definitions and infrastructure

- **Change of variables to partial correlations** — integration over positive-definite correlation matrices reduces to an open cube with an explicit product Jacobian, which is what normalizes the LKJ law ([`TauCeti.setIntegral_comp_correlationCoordinatesOfPartialCorrelation`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.setIntegral_comp_correlationCoordinatesOfPartialCorrelation)).
- **Power-law tails under convolution** — tail constants add under convolution and scale by the rate under compound Poisson summation, which carries the jump-measure tails to the stable law ([`TauCeti.Probability.tendsto_rpow_mul_compoundPoissonMeasure_real_Ioi`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/CompoundPoisson/Tail.html#TauCeti.Probability.tendsto_rpow_mul_compoundPoissonMeasure_real_Ioi)).
- **Proper complex Gaussian laws** — realification supplies complex covariance, vanishing pseudocovariance, affine transport and singular support, with a density under positive-definite covariance ([`TauCeti.Probability.properComplexGaussianMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/ProperComplex/Basic.html#TauCeti.Probability.properComplexGaussianMeasure)).

### Roadmap coverage

Layers 0–6 remain **done**. Layers 9–13 are now also **done** on the source: the hurdle, integer-interval uniform and negative-multinomial characteristic-function gaps are closed. So are the truncated and skew normal, triangular and noncentral Beta densities and cdfs, the multivariate t, matrix normal and logistic-normal densities, conditional t, the higher-dimensional von Mises–Fisher normalizer and moments, and the wrapped-law chart cdfs and quantiles. What remains there is packaging, such as a lemma that `Q(1/2)` is a median. Four layers are **partial**:
- Layer 7 lacks the §7.11 check on the joint laws of `(Z, tZ)`.
- Layer 8 lacks locally uniform convergence of the direct periodized Gaussian density series. Only its Fourier form is proved uniformly.
- Layer 14 lacks partial-correlation quantiles and a stated mixed-entry moment theorem.
- Layer 15 lacks strict cdf increase and the unique-root quantile for fully skewed laws with `α ≥ 1`.

## The frontier

- **Fully skewed stable quantiles** — for `|β| = 1` and `1 ≤ α ≤ 2`, deduce strict cdf increase from the existing strict density positivity (`stablePDFReal_pos_of_one_le`), then the interior quantile and its endpoint limits.
- **LKJ partial-correlation quantiles** — state `2 B⁻¹(u) − 1` quantiles and endpoint limits for each partial correlation, and the existence of all natural mixed entry moments.
- **Periodized Gaussian series** — prove locally uniform convergence in the centre `c` of `∑ₙ exp(−(n − c)²/2s²)`. The pointwise sum and the uniform Fourier and cosine series already exist.
- **The rank-change continuity check** — show that the joint laws of `(Z, tZ)` vary weakly continuously in `t` while their conditional kernel at zero is discontinuous at `t = 0`.

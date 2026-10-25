<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a","ts":"2026-10-24T23:22:30Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"6.8: inverse-Wishart diagonal marginals and the Schur-complement chi-squared law at general positive-definite scale","state":"partial"},{"id":"Layer 7","remaining":"zero-inflated and hurdle laws, Gaussian mixtures, and the remaining entries of the weak-continuity table","state":"partial"},{"id":"Layer 8","remaining":"Gaussian lattice sums and their theta-function identity","state":"partial"},{"id":"Layer 9","remaining":"discrete Laplace and Gaussian, finite Zipf, multivariate hypergeometric, integer-interval uniform; negative-multinomial transforms","state":"partial"},{"id":"Layer 10","remaining":"truncated and skew normal, Bates and triangular; densities and cdfs of the noncentral t, F and Beta laws","state":"partial"},{"id":"Layer 11","remaining":"proper complex Gaussian, simplex logistic-normal, densities of the multivariate t and matrix normal","state":"partial"},{"id":"Layer 12","remaining":"von Mises-Fisher and wrapped normal laws; circular cdfs and quantiles","state":"partial"},{"id":"Layer 13","remaining":"quantiles for several new scalar families and for categorical, multivariate and matrix observables","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"}],"readme_sha":"570b4674e33f287b544e31bd4b70e94ffdc62fe3f079da6b86617b1392e8e2e3","roadmap":"StandardDistributions","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `271e1af` (2026-10-24T23:22:30Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–5 are done, and Layer 6 lacks only the inverse-Wishart marginals at general scale. Layers 7–13 are all under way but partial, now including the multivariate t, matrix normal and circular laws. LKJ correlation laws (Layer 14) and scalar stable laws (Layer 15) have not begun.

### Named results

- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries: those below the diagonal are standard Gaussian, and diagonal entry `i` (counting from zero) is chi with `n - i` degrees of freedom ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Order statistics and spacings of uniform samples** — the `k`-th smallest of `n` independent uniforms (counting from zero) is Beta(`k + 1`, `n - k`) ([`TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/OrderStatistic/Basic.html#TauCeti.Probability.map_orderStatistic_pi_uniformMeasure)), and the gaps between the sorted points are Dirichlet with all shapes one ([`TauCeti.Probability.map_tupleSpacings_orderStatistics_pi_uniformMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Dirichlet/Spacing.html#TauCeti.Probability.map_tupleSpacings_orderStatistics_pi_uniformMeasure)).
- **Gaussian sums of squares are noncentral chi-squared** — for independent unit-variance Gaussians, the sum of squares has the noncentral chi-squared law, with noncentrality the squared length of the mean vector ([`TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/NoncentralChiSquared/Gaussian.html#TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral)). The noncentral F and Beta laws are then built as ratios of noncentral and central chi-squared variables.
- **Compound Poisson laws as random sums** — summing a Poisson number of iid jumps, with the count independent of the jumps, gives the compound Poisson law ([`ProbabilityTheory.iIndepFun.hasLaw_sum_range_compoundPoissonMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/CompoundPoisson/RandomSum.html#ProbabilityTheory.iIndepFun.hasLaw_sum_range_compoundPoissonMeasure)).
- **The multivariate t law** — a centred Gaussian vector scaled by `√(ν / V)`, with `V` an independent chi-squared variable, has the multivariate t law ([`TauCeti.Probability.hasLaw_multivariateT_of_gaussian_chiSquared`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/MultivariateT/Basic.html#TauCeti.Probability.hasLaw_multivariateT_of_gaussian_chiSquared)), and every linear projection of it is a location-scale Student t law ([`TauCeti.Probability.map_inner_multivariateTMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/MultivariateT/Marginal.html#TauCeti.Probability.map_inner_multivariateTMeasure)).

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to one-dimensional Gamma and Gaussian integrals. This gives the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes every Wishart density.
- **Incomplete special functions and their inverses** — the regularized incomplete Gamma and Beta functions and the error function, with their inverses such as [`TauCeti.inverseRegularizedGamma`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gamma/Quantile.html#TauCeti.inverseRegularizedGamma), give closed cdfs and quantiles across the scalar families. Poisson series of them give the noncentral chi-squared cdf.
- **The circle integral of Bessel I** — `∫_{-π}^{π} e^{κ cos θ} cos (n θ) dθ = 2π I_n(κ)` ([`Real.integral_exp_mul_cos_mul_cos`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/BesselI.html#Real.integral_exp_mul_cos_mul_cos)) normalizes the von Mises law and yields its Fourier moments.

### Roadmap coverage

- **Done:** Layers 0–5.
- **Layer 6:** done except 6.8. Inverse-Wishart diagonal entries are inverse-Gamma only at identity scale, and the Schur-complement law is absent.
- **Partial:**
  - Layer 7 now has compound and mixed Poisson laws, general mixtures and power biasing. Zero-inflated and hurdle laws are missing, and so are several entries of the weak-continuity table, among them the matrix normal, the multivariate log-normal and noncentral Beta.
  - Layer 8 lacks only the Gaussian lattice sum and its theta identity.
  - Layer 9 lacks the discrete Laplace and discrete Gaussian, finite Zipf, the multivariate hypergeometric and the integer-interval uniform. The negative-multinomial and beta-negative-binomial laws lack their transforms.
  - Layer 10 has nearly every family. Truncated and skew normal, Bates and triangular are absent. The noncentral t, F and Beta laws have no densities or cdfs.
  - Layer 11 has the multivariate t, the matrix normal and the multivariate log-normal, without the t and matrix-normal densities. The proper complex Gaussian and the simplex logistic-normal are absent.
  - Layer 12 has the uniform sphere and ball, von Mises and wrapped Cauchy laws. Von Mises–Fisher and the wrapped normal are absent.
  - Layer 13 lacks quantiles for several new scalar families and for the categorical, multivariate and matrix observables.
- **Untouched:** Layers 14 and 15.

## The frontier

- **Inverse-Wishart marginals at general scale** — extend the identity-scale diagonal law to `(IW(n,S))ᵢᵢ ∼ InverseGamma((n-p+1)/2, Sᵢᵢ/2)`, and prove the Schur-complement chi-squared law. Both need a block-inverse bridge, not yet built.
- **Completing the noncentral laws** — densities, cdfs and quantiles for the noncentral t, F and Beta laws, and moments for the noncentral chi.
- **Missing scalar and discrete families** — truncated and skew normal (the skew-normal cdf via Owen's T is ready), Bates and triangular, and zero-inflated and hurdle counts. Quantiles are still owed for the Lévy, inverse Gaussian, Irwin–Hall and hypoexponential laws.
- **Gaussian lattice sums** — Layer 8.3's theta-function identity blocks the discrete Gaussian of Layer 9 and the wrapped normal of Layer 12.
- **The untouched layers** — LKJ correlation-matrix laws (14) and scalar stable laws (15). The Lévy, Cauchy and Gaussian special cases that stable laws should recover are already in place.

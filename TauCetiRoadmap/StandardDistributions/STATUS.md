<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1","ts":"2026-10-19T17:10:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"6.8: inverse-Wishart diagonal marginals and the Schur-complement chi-squared law at general positive-definite scale","state":"partial"},{"id":"Layer 7","remaining":"compound and mixed Poisson, power biasing, general bind mixtures and zero-inflated laws, most of the weak-continuity table","state":"partial"},{"id":"Layer 8","remaining":"Bessel I circle integral; zeta and Gaussian lattice sums","state":"partial"},{"id":"Layer 9","remaining":"Zipf, Yule-Simon, log-series, discrete Laplace and Gaussian, negative multinomial, Dirichlet-multinomial, beta-negative-binomial, sampling without replacement","state":"partial"},{"id":"Layer 10","remaining":"noncentral laws, inverse Gaussian, Levy, truncated and skew normal, Irwin-Hall and Bates, hypo- and hyperexponential, among others","state":"partial"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","remaining":"quantiles for mixtures, categorical, beta-binomial, Wishart diagonals and all multivariate observables","state":"partial"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"}],"readme_sha":"570b4674e33f287b544e31bd4b70e94ffdc62fe3f079da6b86617b1392e8e2e3","roadmap":"StandardDistributions","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `a5cde7b` (2026-10-19T17:10:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap now has sixteen layers. The original scalar, multivariate and Wishart theory of Layers 0–5 is done, and Layer 6 lacks only the inverse-Wishart diagonal marginals at general scale. Layers 7–10 and 13 are well under way but partial. Layers 11, 12, 14 and 15 (multivariate t and Gaussian transformations, spherical and circular laws, LKJ, stable laws) have not begun.

### Named results

- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent entries: those below the diagonal are standard Gaussian, and diagonal entry `i` (counting from zero) is chi with `n - i` degrees of freedom ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **The Gaussian-Gram form of the Wishart law** — at positive-definite covariance and at least as many vectors as the dimension, the Gram sum of independent centred Gaussian vectors has the nonsingular Wishart density law, so the two Wishart constructions agree wherever both are defined ([`TauCeti.Probability.hasLaw_wishartGram_gaussian_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Agreement.html#TauCeti.Probability.hasLaw_wishartGram_gaussian_nonsingularWishartMeasure)).
- **Order statistics of uniform samples are Beta** — the `k`-th smallest of `n` independent uniforms (counting from zero) has law Beta(`k + 1`, `n - k`). For a general law it is this Beta law pushed through the source quantile ([`TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/OrderStatistic/Basic.html#TauCeti.Probability.map_orderStatistic_pi_uniformMeasure), [`TauCeti.Probability.map_orderStatistic_pi_eq_map_betaMeasure_quantile`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/OrderStatistic/Basic.html#TauCeti.Probability.map_orderStatistic_pi_eq_map_betaMeasure_quantile)).
- **Moment indeterminacy of the log-normal law** — weighting the standard log-normal by `1 + ε sin (2π log x)` gives distinct probability laws that all have the log-normal moments ([`TauCeti.Probability.integral_pow_logNormalMomentPerturbation`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/LogNormal/MomentIndeterminacy.html#TauCeti.Probability.integral_pow_logNormalMomentPerturbation)).
- **Max-stability of the extreme-value laws** — the maximum of an iid generalized extreme-value sample is generalized extreme-value with the same shape. The family converges weakly to Gumbel as the shape tends to zero ([`TauCeti.Probability.map_max_pi_generalizedExtremeValueMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/GeneralizedExtremeValue/Max.html#TauCeti.Probability.map_max_pi_generalizedExtremeValueMeasure), [`TauCeti.Probability.tendsto_generalizedExtremeValueMeasure_nhds_zero_gumbelMeasure`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/GeneralizedExtremeValue/Continuity.html#TauCeti.Probability.tendsto_generalizedExtremeValueMeasure_nhds_zero_gumbelMeasure)).

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to one-dimensional Gamma and Gaussian integrals. This gives the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) that normalizes every Wishart density.
- **Incomplete special functions and their inverses** — the error function and the regularized incomplete Gamma and Beta functions express the closed-form cdfs. Their inverses, [`TauCeti.inverseRegularizedGamma`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gamma/Quantile.html#TauCeti.inverseRegularizedGamma), [`TauCeti.inverseRegularizedIncompleteBeta`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteBeta.html#TauCeti.inverseRegularizedIncompleteBeta) and [`Real.erfInv`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Erf.html#Real.erfInv), turn these into quantile formulas for the Gamma, Beta, Gaussian, Student t, F and chi-squared families.
- **Generic quantile transport** — [`TauCeti.Probability.quantile_map_affine`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Affine.html#TauCeti.Probability.quantile_map_affine) and the monotone-map quantile lemmas carry quantiles through every slope, including reflected upper quantiles. This lets most new families inherit quantiles from a standard form instead of proving them from scratch.

### Roadmap coverage

- **Done:** Layers 0–5, now including Poisson splitting and conditioning.
- **Layer 6:** done except 6.8. Diagonal entries of the inverse-Wishart law are inverse-Gamma only at identity scale.
- **Partial:**
  - Layer 7 has quantiles, truncation, hazards and order-statistic quantiles. It lacks compound and mixed Poisson, power biasing, general `bind` mixtures and most of the weak-continuity table.
  - Layer 8 has Owen's T and the inverse functions. Bessel I lacks its circle integral, and zeta and Gaussian lattice sums are absent.
  - Layer 9 has the categorical, beta-binomial, Poisson-binomial and Skellam laws. Zipf, Yule–Simon, log-series, discrete Laplace and Gaussian, negative multinomial, Dirichlet-multinomial, beta-negative-binomial and the sampling-without-replacement laws are missing.
  - Layer 10 has about half its families. The noncentral, inverse Gaussian, Lévy, skew and truncated normal, Irwin–Hall and hypo- and hyperexponential laws are missing.
  - Layer 13 covers the classical scalar and discrete quantiles but none of the multivariate or matrix observables.
- **Untouched:** Layers 11, 12, 14 and 15.

## The frontier

- **Inverse-Wishart diagonal marginals at general scale** — extend the identity-scale result to `(IW(n,S))ᵢᵢ ∼ InverseGamma((n-p+1)/2, Sᵢᵢ/2)` through the README's congruence and block-inverse bridges.
- **Compound and mixed Poisson laws** — convolution powers, `compoundPoissonMeasure`, `mixedPoissonMeasure` and their transforms. The noncentral chi-squared, F and Beta laws are meant to be built as Poisson mixtures, so this work comes first.
- **Remaining scalar families** — inverse Gaussian, Lévy, truncated and skew normal (Owen's T is ready), generalized normal, asymmetric Laplace, Irwin–Hall and Bates, and hypo- and hyperexponential.
- **Zeta and lattice sums** — Layer 8.3 is the prerequisite for the Zipf and discrete Gaussian laws of Layer 9. Its theta-function identities also feed the wrapped normal of Layer 12.
- **The untouched geometric and matrix layers** — multivariate t and matrix normal (11), uniform sphere and von Mises–Fisher (12, which needs the Bessel I circle integral), LKJ (14) and scalar stable laws (15).

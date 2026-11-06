<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"3a0189695d62134a412200ef4237d0bbb2e95d75","ts":"2026-11-07T02:52:26+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","remaining":"confirm quantile coverage for every family, especially non-scalar observables","state":"partial"},{"id":"Layer 14","remaining":"Jacobian and normalizing integral of the partial-correlation map; the LKJ law, its moments, marginals and quantiles","state":"partial"},{"id":"Layer 15","remaining":"fully skewed support and positivity, quantiles, tails of the law and moment thresholds, closed-form Laplace exponent and exact domain","state":"partial"}],"readme_sha":"b2f66314aae9b6afd33588f3e918508e316123f5d62f1e437fe69e63446a3ae4","roadmap":"StandardDistributions","to_sha":"3a0189695d62134a412200ef4237d0bbb2e95d75"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `3a01896` (2026-11-07T02:52:26+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 through 12 are done, from the elementary scalar families through Wishart theory to the multivariate t and circular laws. Scalar stable laws (Layer 15) and LKJ correlation laws (Layer 14) are partial, and it is not established that Layer 13's quantile coverage is complete.

### Named results

- **The Bartlett decomposition** — the Cholesky factor of a standard Wishart matrix of degree `n` has independent standard Gaussian entries below the diagonal and chi entries on it ([`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Wishart/Bartlett.html#TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure)).
- **Existence of scalar stable laws** — every valid shape and skewness in Nolan's S₀ convention gives a probability measure with the prescribed characteristic function, built as a weak limit of compensated compound-Poisson laws and closed under convolution at a common shape (`TauCeti.Probability.stableMeasure`).
- **The Gaussian lattice sum as a theta function** — `Z(c, s) = ∑ₙ exp(-(n - c)²/(2s²))` is a Gaussian factor times the real part of Jacobi's two-variable theta function ([`Real.gaussianLatticeSum_eq_jacobiTheta₂`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gaussian/LatticeSum.html#Real.gaussianLatticeSum_eq_jacobiTheta₂)).
- **Lévy's continuity theorem with existence** — if characteristic functions converge to a limit continuous at zero, that limit is the characteristic function of a probability measure, the weak limit of the sequence ([`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/LevyConvergence.html#TauCeti.exists_probabilityMeasure_of_tendsto_charFun)).
- **The von Mises–Fisher normalizer** — in dimension at least two, the exponential moment of a linear observable of a uniform sphere point is a modified Bessel `I` expression. This gives the von Mises–Fisher density and moments (`TauCeti.Probability.vonMisesFisherMeasure_eq_withDensity_besselI`).

### Notable definitions and infrastructure

- **Integration over the positive-definite cone** — symmetric Lebesgue measure and the Cholesky change of variables reduce cone integrals to one-dimensional Gamma and Gaussian integrals, giving the [multivariate Gamma integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/MultivariateGamma/Integral.html#TauCeti.integral_posDef_multivariateGamma) behind every Wishart density.
- **Correlation coordinates** — [Lebesgue measure on unit-diagonal symmetric matrices](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.correlationLebesgue) and the [bijection from the open partial-correlation cube](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/SymmetricMatrix/Correlation.html#TauCeti.bijOn_correlationCoordinatesOfPartialCorrelation) onto positive-definite correlation matrices. The LKJ law will be defined in these coordinates.
- **Fourier inversion for measures** — a finite measure on the line with integrable characteristic function has a [continuous inversion density](https://taucetiproject.org/docs/TauCeti/Analysis/Bochner/CharFun/Inversion.html#MeasureTheory.Measure.eq_withDensity_charFunDensity). The stable density and its smooth cdf are built on it.

### Roadmap coverage

- **Done:** Layers 0–12. The last gaps in Layers 7–12 closed recently: hurdle laws and Gaussian mixtures, Gaussian lattice sums, the discrete Laplace and Gaussian, the truncated and skew normal and triangular laws, the multivariate t and matrix normal densities, and the von Mises–Fisher normalizer. For Layers 9–12 these verdicts partly rest on the results being present in the documentation, since the most recent record was truncated.
- **Partial:**
  - Layer 13: most new families brought quantiles, but complete coverage is not established.
  - Layer 14: correlation coordinates (14.1) are done. Of 14.2, the partial-correlation bijection, the determinant formula and the normalizer are done, but not the Jacobian or the normalizing integral. The law, its moments and its marginals (14.3–14.4) have not started.
  - Layer 15: existence, the S₀ and S₁ exponents, affine transport, convolution, and the Gaussian, Cauchy and Lévy cases are done. So are the bounded smooth density, full support for interior skewness, joint weak continuity, and one-sided exponential integrability at full skewness. Still missing: support and positivity at full skewness, quantiles, the tails of the law and its moment thresholds, and the closed-form Laplace exponent with its exact domain.

## The frontier

- **Stable tails and moments** — power-law tail limits of the law itself, then integrability of `|x|^q` exactly for `q < α` and the symmetric fractional-moment formula. The Lévy-measure tail constants and the approximants' moment thresholds are in place.
- **Fully skewed stable laws** — exact support `[d, ∞)` for `α < 1, β = 1` and its reflection, full support for `α ≥ 1`, strict density positivity, then quantiles for all valid shapes.
- **The stable Laplace exponent** — the closed form `K(t)` on the allowed half-line and non-integrability off it. Finiteness on the half-line is proved.
- **The LKJ law** — the Jacobian of the partial-correlation map and the integral of `(det R)^(η-1)`, then `lkjMeasure`, the Beta law of its off-diagonal entries, independence of partial correlations, and principal-block marginals.
- **Layer 13 audit** — check every family against the quantile table; the remaining gaps are no longer clear.

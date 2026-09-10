<!--tauceti-status:v1 {"roadmap":"StandardDistributions","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: StandardDistributions

This file documents the status of the StandardDistributions roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0, 1, and 2 are done: every Mathlib scalar family has its density bridges, parameter measurability, moments, transforms, and closed-form cdf, and the incomplete gamma, incomplete beta, and error functions exist. Layer 3 is partial (three of nine new families complete, three begun, three not started), Layers 4 and 5 have one or two items each, and Layer 6 has not begun.

### Named results

- **The binomial tail identity** — for `m ≤ n`, the mass `Bin(n, p)` puts on `{k | m ≤ k}` is `I_p(m, n - m + 1)`, valid down to `m = 0` through the `a = 0` boundary convention ([`TauCeti.binomial_tail_eq_regularizedIncompleteBeta`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Binomial/Tail.html#TauCeti.binomial_tail_eq_regularizedIncompleteBeta)).
- **The Poisson tail identity** — a Poisson law of rate `r` puts mass `P(n + 1, r)` on `{k | n < k}`, which also gives the cast law's cdf ([`TauCeti.poissonMeasure_tail_eq_regularizedGamma`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Poisson/Tail.html#TauCeti.poissonMeasure_tail_eq_regularizedGamma)).
- **The Gaussian cdf** — for nonzero variance, `cdf (gaussianReal m v) x = (1 + erf ((x - m) / √(2v))) / 2`, with the Dirac step at `v = 0` separate ([`TauCeti.cdf_gaussianReal_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Gaussian/Cdf.html#TauCeti.cdf_gaussianReal_eq)).
- **Cauchy stability under averaging** — the sample mean of `n` independent Cauchy variables has the same Cauchy law, deduced from the characteristic function `exp (i x₀ t - γ |t|)` ([`TauCeti.hasLaw_average_of_iIndepFun_cauchyMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Distributions/Cauchy.html#TauCeti.hasLaw_average_of_iIndepFun_cauchyMeasure)).
- **A law on `ℕ` is determined by its pgf** — finite measures on `ℕ` whose generating functions agree on `(-1, 1)` are equal, via `iteratedDeriv n (pgf id μ) 0 = n! * μ.real {n}` ([`TauCeti.Probability.measure_eq_of_pgf_eqOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/GeneratingFunction.html#TauCeti.Probability.measure_eq_of_pgf_eqOn)).

### Notable definitions and infrastructure

- **The incomplete special functions** ([`TauCeti.regularizedGamma`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma.html#TauCeti.regularizedGamma), [`TauCeti.regularizedIncompleteBeta`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/IncompleteBeta.html#TauCeti.regularizedIncompleteBeta)) — continuity, monotonicity, derivatives, step recurrences, and the reflection formula; every remaining Layer 3 cdf is expressed through these.
- **Probability generating functions** ([`TauCeti.Probability.pgf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/GeneratingFunction.html#TauCeti.Probability.pgf)) — the bridge to `mgf` at `exp t`, multiplicativity over independent sums, the power-series expansion, and closed forms for the four Mathlib discrete laws; the negative binomial and Layer 4's geometric-sum identity run on this.
- **Covariance matrices of Euclidean laws** ([`TauCeti.covMatrix`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Moments/Covariance.html#TauCeti.covMatrix)) — symmetric, positive semidefinite, identified with Mathlib's `covarianceBilin` under `MemLp`, and equal to `S` for `multivariateGaussian m S`; the multinomial and Dirichlet covariance targets are stated against it.

### Roadmap coverage

- **Layer 0: done.** The `HasPDF` bridges, the five `rnDeriv` identifications, the uniform law with its full API and `pdf.IsUniform` check, and parameter measurability for all ten Mathlib families (TauCeti#3752).
- **Layer 1: done.** All ten families and the pgf have their listed moments, exact exponential-integrability domains, transforms, convolution and memorylessness statements, and completion checks. The binomial mean does not appear here; the README expects it from Mathlib.
- **Layer 2: done.** Incomplete gamma and beta, `Real.erf`/`erfc`, `erf x = P(1/2, x²)`, all six closed-form cdfs and tails, and both completion checks.
- **Layer 3: partial.** Laplace, log-normal, and chi-squared are done, including `chiSquaredMeasure 2 = expMeasure (1/2)`. Weibull lacks only its three mgf regimes and cgfs. Student's t has measure, density, probability-measure theorem, symmetry, measurability, and `studentTMeasure 1 = cauchyMeasure 0 1`, but no moments, cdf, or exponential-integrability results. Hypergeometric has masses, support, measurability, and finite-sum transforms, but no mean, variance, symmetry, or binomial limit. Inverse-gamma, Fisher's F, and negative binomial are untouched.
- **Layer 4: mostly untouched.** Item 6 (finite i.i.d. maxima and minima, with the exponential minimum) is done; items 1–5 have not begun.
- **Layer 5: partial.** Item 1 is done except the Bochner mean of the multivariate Gaussian, not established here. Item 3 has the affine-map theorem and the directional `integrableExpSet`/mgf, but not the quadratic-form mgf. Items 2, 4, 5, 6, and 7 are untouched.
- **Layer 6: untouched.**

## The frontier

- **Student's t moments and cdf** — mean for `1 < ν`, variance for `2 < ν`, the matching non-integrability results, the cdf through `regularizedIncompleteBeta (ν/2) (1/2)`, and `integrableExpSet id = {0}`. Its inputs are in place.
- **Weibull mgf regimes and hypergeometric moments** — the three Weibull mgf regimes with their cgfs; the hypergeometric mean, variance, symmetry, and binomial limit.
- **Inverse-gamma, Fisher's F, and negative binomial** — the unbuilt scalar families. Negative binomial is a prerequisite for Layer 4's geometric-sum and gamma-mixed-Poisson items, Fisher's F for its ratio item.
- **Layer 4 relations** — Gaussian squares into chi-squared, the gamma–beta product pushforward, the Erlang and Laplace-difference sums; their Layer 1–3 inputs exist.
- **Multivariate Gaussian density and quadratic forms** — the `HasPDF` theorem by affine change of variables from `TauCeti.pi_gaussianReal_eq_withDensity`, singularity for non-positive-definite `S`, and the quadratic-form mgf. These gate all of Layer 6.

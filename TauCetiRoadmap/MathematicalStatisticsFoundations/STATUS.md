<!--tauceti-status:v1 {"roadmap":"MathematicalStatisticsFoundations","to_sha":"7433fc3695f4fbf5a07041090628c5c94067c0b9","ts":"2026-11-25T18:48:45Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"2.1 sufficiency, bounded completeness, ancillarity and the integration identity; 2.2 factorization; 2.3 Basu","state":"partial"},{"id":"Layer 3","remaining":"3.4 completeness, surjective mean map with analytic inverse (3.5), maximum likelihood (3.6), conditional families (3.7), Pitman-Koopman-Darmois (3.8)","state":"partial"},{"id":"Layer 4","remaining":"4.2 Rao-Blackwell, Lehmann-Scheffe and UMVU U-statistics","state":"partial"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"7.3 equivariant averaging and Blyth's method; 7.5 Strassen and Blackwell's comparison of experiments","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"9.1 empirical objects, 9.2 distances and scores, sparsity and restricted isometry in 9.3, 9.5 and 9.6","state":"partial"}],"readme_sha":"b2853bdec2aec8918e68dad6b3e80fbaf2f4b3bbcdf3e6b3d7b7caa2619e2967","roadmap":"MathematicalStatisticsFoundations","to_sha":"7433fc3695f4fbf5a07041090628c5c94067c0b9"}-->
# Status: MathematicalStatisticsFoundations

This file documents the status of the MathematicalStatisticsFoundations roadmap up until `7433fc3` (2026-11-25T18:48:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 (experiments, densities and tests) and Layer 5 (order statistics and Gaussian samples) are done. Layers 2, 3, 4, 7 and 9 are partial. Layers 6 (tests) and 8 (convergence) have not begun. None of the four headline theorems is proved yet. They are Lehmann–Scheffé, maximum likelihood in exponential families, Neyman–Pearson and Blackwell's comparison of experiments. Most of what they rest on is in place, apart from sufficiency.

### Named results

- **The James–Stein theorem**: for `X ~ N(θ, I)` with `p ≥ 3`, the shrinkage estimator `(1 - (p - 2)/‖X‖²) X` has risk `p - (p - 2)² E‖X‖⁻²`, strictly less than `p` ([`james_stein_risk_eq_and_lt`](https://taucetiproject.org/docs/TauCeti/Statistics/Estimation/JamesStein.html#TauCeti.james_stein_risk_eq_and_lt)). It is proved through [Stein's identity](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/IntegrationByParts/Multivariate.html#TauCeti.Probability.gaussian_integration_by_parts).
- **The information inequality**: in a regular real-parameter model, the squared derivative of the mean of `W` is at most its variance times the Fisher information ([`sq_deriv_le_variance_mul_fisherInformation`](https://taucetiproject.org/docs/TauCeti/Statistics/Estimation/Information.html#TauCeti.sq_deriv_le_variance_mul_fisherInformation)).
- **Optimality of the Pitman estimator**: when the good set has full measure, the Pitman estimator has squared-error risk at most that of every square-integrable location-equivariant estimator ([`pitmanEstimator_risk_zero_le_of_equivariant`](https://taucetiproject.org/docs/TauCeti/Statistics/Estimation/Pitman.html#TauCeti.pitmanEstimator_risk_zero_le_of_equivariant)).
- **The minimax theorem for finite statistical games**: with finitely many parameters and actions, some randomized rule is Bayes for a prior that makes it minimax, so the minimax and maximin values agree ([`exists_statistical_game_saddle_point`](https://taucetiproject.org/docs/TauCeti/Statistics/Decision/FiniteGame.html#TauCeti.exists_statistical_game_saddle_point)).
- **Student's theorem for Gaussian samples**: the residual sum of squares over the variance is `χ²` with `n - 1` degrees of freedom and is independent of the sample mean. The studentized mean therefore has Student's law with `n - 1` degrees of freedom ([`studentizedMean_gaussianSample`](https://taucetiproject.org/docs/TauCeti/Statistics/GaussianSample/Basic.html#ProbabilityTheory.HasLaw.studentizedMean_gaussianSample)).

### Notable definitions and infrastructure

- **Randomized tests** ([`IsStatisticalTest`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Tests.html#TauCeti.IsStatisticalTest)): `[0, 1]`-valued rejection probabilities, together with power, pointwise level, similar, UMP and UMPU tests, and threshold and interval tests. Layer 6 is stated in these terms.
- **Risk and garblings** ([`IsGarbling`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Risk.html#TauCeti.IsGarbling)): the real risk of a randomized rule, its agreement with Mathlib's lower-integral risk, and garblings that preserve risk. These underlie the decision criteria of Layer 7 and are one side of Blackwell's theorem.
- **Natural exponential families** ([`exponentialFamilyMeasure`](https://taucetiproject.org/docs/TauCeti/Statistics/ExponentialFamily/Basic.html#TauCeti.exponentialFamilyMeasure)): the convex natural parameter space and the analytic log partition function, whose gradient is the mean and whose Hessian is the covariance. Laplace determinacy is in place as well ([`ext_of_integral_exp_inner_eq`](https://taucetiproject.org/docs/TauCeti/Probability/Moments/LaplaceDeterminacy/InnerProduct.html#MeasureTheory.Measure.ext_of_integral_exp_inner_eq)), so the completeness argument of 3.4 has its analytic input.

### Roadmap coverage

**Done:**
- **Layer 1:** densities, mixtures with Halmos–Savage, tests, confidence sets and their duality with tests, and risk with garblings.
- **Layer 5:** order-statistic densities, uniform ranks independent of the order statistics, and the sample-mean and residual laws for Gaussian samples. The last are proved as separate theorems rather than one bundled statement.

**Partial:**
- **Layer 2:** completeness and the symmetric-completeness theorem with U-statistics (2.4) are in. Sufficiency, bounded completeness, ancillarity and the integration identity (2.1) are not, and neither are factorization (2.2) and Basu (2.3).
- **Layer 3:** 3.1–3.3 are done. Of 3.5 there is the analytic, injective mean map with invertible derivative, but not its surjectivity onto the interior of the convex hull of the support. Completeness (3.4), maximum likelihood (3.6), conditional families (3.7) and Pitman–Koopman–Darmois (3.8) are open.
- **Layer 4:** done except 4.2 (Rao–Blackwell, Lehmann–Scheffé, UMVU U-statistics).
- **Layer 7:** has the criteria (7.1), finite games and the complete class theorem (7.2) and Scheffé (7.4). It lacks equivariance and Blyth's method (7.3) and Blackwell's comparison (7.5).
- **Layer 9:** has the Bayesian and Monte Carlo objects of 9.4. Of 9.3 it has only the Benjamini–Hochberg count and the kernel density estimator. 9.1, 9.2, 9.5 and 9.6 are not there.

## The frontier

- **Sufficiency and the integration identity (2.1)**: the kernel definition of a sufficient statistic, together with bounded completeness, ancillarity and the integration identity. This is the bottleneck. Rao–Blackwell and Lehmann–Scheffé (4.2), Basu, factorization, Neyman structure and Blackwell's theorem all go through it.
- **Threshold tests and Neyman–Pearson (6.1–6.2)**: the size of a threshold test via the quantile, then the constrained lemma with its uniqueness and the sum-of-errors form. These need only Layer 1, which is complete.
- **Completeness of exponential families (3.4)**: completeness, Laplace determinacy and the tilted laws are all present, but the proof joining them still has to be written. After it come the surjective mean parametrization (3.5) and the maximum likelihood headline (3.6).
- **Layer 8 adapters and boundedness in probability**: these are independent of Layers 2–7 and are the base that later statistics roadmaps share. None of it has started.
- **Blackwell's comparison of experiments (7.5)**: this needs Strassen's dilation theorem and the likelihood-ratio factorization of 2.2, so it comes after sufficiency.

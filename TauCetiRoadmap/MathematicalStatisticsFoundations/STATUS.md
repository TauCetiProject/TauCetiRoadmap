<!--tauceti-status:v1 {"roadmap":"MathematicalStatisticsFoundations","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"1.3 tests and power, 1.4 confidence sets and duality, 1.5 risk and garblings","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"69cd87f322dd9ee6a412b22ff667a96f2582b6822b12ba5f04e2ad8325ad068b","roadmap":"MathematicalStatisticsFoundations","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: MathematicalStatisticsFoundations

This file documents the status of the MathematicalStatisticsFoundations roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has just begun. Real densities and countable mixtures, the first two subsections of Layer 1, are done, and so is the Halmos–Savage lemma that closes them. The rest of Layer 1 (tests, confidence sets, risk and garblings) and all of Layers 2–9 have not started.

### Named results

- **The Halmos–Savage lemma** — a nonempty family of measures dominated by an s-finite measure is dominated by one of its own countable mixtures; this is the step that later lets sufficiency and tests be stated against a single dominating law ([`exists_absolutelyContinuous_countableMixture`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Mixture.html#TauCeti.exists_absolutelyContinuous_countableMixture)).
- **Uniqueness of densities** — two real densities of the same measure with respect to a σ-finite reference measure agree almost everywhere ([`HasDensity.ae_eq`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Density.html#TauCeti.HasDensity.ae_eq)).
- **The integral transfer** — integrating against a law with a density is integrating the density-weighted integrand against the reference measure, with no integrability hypothesis because both sides take Lean's junk value together ([`HasDensity.integral_eq`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Density.html#TauCeti.HasDensity.integral_eq)). A pushforward version also exists ([`HasDensity.integral_map`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Density.html#TauCeti.HasDensity.integral_map)).

### Notable definitions and infrastructure

- **Real densities** ([`HasDensity`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Density.html#TauCeti.HasDensity)) — the roadmap's convention for a measurable, almost-everywhere nonnegative real density. It has the integrability criterion, total mass one for probability laws, and the pushforward of a density that factors through a map. The likelihood ratios of Layers 2, 3 and 6 will be stated through it.
- **Countable mixtures** ([`countableMixture`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Mixture.html#TauCeti.countableMixture)) — the fixed-weight sum of 2^{-(n+1)} times the n-th member of a family. A mixture of probability laws is a probability law, it has the same null sets as its components taken together, and a mixture of laws with densities has the mixed density ([`HasDensity.countableMixture`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Mixture.html#TauCeti.HasDensity.countableMixture), stated for a mixture that is a finite measure).

### Roadmap coverage

Layer 1 is partial: 1.1 (real densities) and 1.2 (countable mixtures and Halmos–Savage) are done, and 1.3 (tests and power), 1.4 (confidence sets) and 1.5 (risk and garblings) are untouched. Layers 2–7, the finite-sample theory of sufficiency, exponential families, unbiased estimation, order statistics, tests and decision theory, are untouched. So are Layers 8 and 9, the convergence vocabulary and the shared vocabulary for later statistics roadmaps, even though the README notes they could be built first. Some of their suppliers are already in Tau Ceti, such as the empirical measures and the total-variation identities, but none of their own targets are.

## The frontier

- **Tests and their power (1.3)** — `IsStatisticalTest`, `testPower`, the pointwise level `HasTestLevel`, similar, UMP and UMPU tests, and the threshold and interval tests. This needs only 1.1 and unblocks all of Layer 6.
- **Risk and garblings (1.5)** — the real risk of a randomized rule, its agreement with Mathlib's lower-integral risk, and garblings as a reflexive, transitive relation that preserves risk. Layers 2 and 7 need it.
- **Confidence sets and test duality (1.4)** — coverage and inverting level-α tests. This follows directly once 1.3 is in.
- **Sufficiency and the integration identity (2.1)** — the kernel definition of a sufficient statistic, completeness and ancillarity. Rao–Blackwell, Basu and Neyman structure all go through it, so it is the next bottleneck after Layer 1.
- **Layer 8 adapters and boundedness in probability** — independent of Layers 2–7, and the shared base for later statistics roadmaps. It could proceed in parallel.

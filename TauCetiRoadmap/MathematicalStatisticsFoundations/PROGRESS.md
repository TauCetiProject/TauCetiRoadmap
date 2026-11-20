# Progress log: MathematicalStatisticsFoundations

An append-only record of what landed on the MathematicalStatisticsFoundations roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"c68ae9d06b080d01f05e780ea4095b719622e240","prs":["forgejo:https://git.taucetiproject.org/taucetiproject/tauceti@1#205"],"roadmap":"MathematicalStatisticsFoundations","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
## MathematicalStatisticsFoundations: 2026-11-18 to 2026-11-19 (`c68ae9d` to `b235000`)

The roadmap's first work is in, and its headline is the [Halmos–Savage lemma](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Mixture.html#TauCeti.exists_absolutelyContinuous_countableMixture): a nonempty family of measures dominated by an s-finite measure is already dominated by one countable mixture of its own members (https://git.taucetiproject.org/taucetiproject/tauceti/pulls/205). The roadmap asks only for a σ-finite dominating measure, so the result is slightly more general than the target. The mixtures are the fixed-weight sums [`countableMixture`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Mixture.html#TauCeti.countableMixture), with weights 2^{-(n+1)} that sum to one. They come with the facts the roadmap lists: a set is null for the mixture exactly when it is null for every component, each component is absolutely continuous with respect to the mixture, and a mixture of laws with densities has the mixed density.

Underneath sits the real-density predicate [`HasDensity`](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Density.html#TauCeti.HasDensity), with its working API. Densities are unique almost everywhere against a σ-finite reference measure, and [integrals transfer](https://taucetiproject.org/docs/TauCeti/Statistics/Experiments/Density.html#TauCeti.HasDensity.integral_eq) with no integrability hypothesis, as the roadmap wants. A density that factors through a map is a density of the pushforward. Together this completes the first two subsections of Layer 1; tests, confidence sets, risk and garblings have not started.

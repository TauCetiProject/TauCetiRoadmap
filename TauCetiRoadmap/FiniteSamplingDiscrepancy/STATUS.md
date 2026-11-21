<!--tauceti-status:v1 {"roadmap":"FiniteSamplingDiscrepancy","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.4, the excess on a finite type as a sum of positive parts of singleton differences, and the set attaining it","state":"partial"},{"id":"Layer 1","remaining":"the norm (etvDist) form of the 1.2 bound for random populations","state":"partial"},{"id":"Layer 2","remaining":"2.1 singleton masses of the two sampling laws, and 2.4 the one-pair formula 1 - p - t min(p, 1-p)","state":"partial"},{"id":"Layer 3","remaining":"3.1 explicit bound (reduction to the one-pair population is proved; needs 2.4), 3.2 strictness, 3.3 characterization","state":"partial"},{"id":"Layer 4","state":"untouched"}],"readme_sha":"98ce257af9cd91e11ea828dc6828b7f523ef57a4845d9a9eea70139ed662f2b1","roadmap":"FiniteSamplingDiscrepancy","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: FiniteSamplingDiscrepancy

This file documents the status of the FiniteSamplingDiscrepancy roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The distinct-values half of the roadmap is essentially complete: the exact collision bound, its sharpening of finite de Finetti, and attainment both by distinct-value populations and by an exchangeable process. The repeated-value half has its groundwork in place but none of its headline formulas: the one-pair formula, the general repeated-value bound and the de Finetti bound with ties are all still to come.

### Named results

- **The exact collision bound** — for any random population, the masses of an event under sampling without and with replacement differ, in either direction, by at most the probability `1 - (n)_m / n^m` that a uniform index map is not injective, sharpening `choose m 2 / n` (`sampleWithoutReplacement_le_sampleWithReplacement_add_collision`, `uniformOn_not_injective_apply_eq`).
- **Finite de Finetti with exact collision error** — Diaconis and Freedman's Theorem 13: the `m`-prefix law of a process exchangeable at `n` is within `1 - (n)_m / n^m` of the with-replacement sample of its `n`-prefix on every event, and within twice that in total variation (`ExchangeableAt.finiteDeFinetti_exact_collision`).
- **Distinct values attain the bound** — for a population of distinct values and `m ≤ n`, the largest excess of the without-replacement law over the with-replacement law is exactly `1 - (n)_m / n^m` ([`iSup_sampleWithoutReplacement_sub_sampleWithReplacement_dirac_eq`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/Distinct.html#TauCeti.Probability.iSup_sampleWithoutReplacement_sub_sampleWithReplacement_dirac_eq)), and the total variation distance is twice that ([`etvDist_sampleWithoutReplacement_sampleWithReplacement_dirac_eq`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/Distinct.html#TauCeti.Probability.etvDist_sampleWithoutReplacement_sampleWithReplacement_dirac_eq)). The all-distinct event must be measurable, unless the value space has measurable singletons.
- **Sharpness of the de Finetti bound** — a uniformly random ordering of `n` distinct values is an exchangeable process that attains the exact collision error on the all-distinct event (`exists_exchangeableAt_attains_collision`).
- **The two-hit mass** — a uniform injective sample of size `m` from `n` indices contains two given indices with probability `m(m-1)/(n(n-1))`, the weight `t` in the one-pair formula ([`uniformOn_injective_mem_range_and_mem_range`](https://taucetiproject.org/docs/TauCeti/Probability/UniformSampling.html#TauCeti.Probability.uniformOn_injective_mem_range_and_mem_range)).

### Notable definitions and infrastructure

- **Sampling a fixed population, and observing it** — [`samplePopulation_dirac`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/Basic.html#TauCeti.Probability.samplePopulation_dirac) writes the sampled law of a deterministic population as a pushforward of the selection law, and [`samplePopulation_map`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/Basic.html#TauCeti.Probability.samplePopulation_map) lets a measurable observation of the values pass through sampling.
- **Reduction to the one-pair population** — combined with the fact that pushforward never increases the excess or the total variation distance, these give, for any population with `x a = x b`, discrepancy bounds in both directions by those of the population that sends `b` to `a` (`iSup_sampleWithoutReplacement_sub_sampleWithReplacement_dirac_le_update_id`). This is Section 3.1's argument, minus the one-pair value.
- **Fibres of the one-pair population** — a sampled word is produced by `2^r` index maps but by only one or two embeddings ([`natCard_update_id_comp_eq_update_id_comp`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/OnePair.html#TauCeti.Probability.natCard_update_id_comp_eq_update_id_comp), [`natCard_embedding_update_id_comp_eq_update_id_comp`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/OnePair.html#TauCeti.Probability.natCard_embedding_update_id_comp_eq_update_id_comp)).

### Roadmap coverage

Layer 0 is partial. Deterministic populations (0.1), observation commuting with sampling (0.2), contraction of excess under measurable maps (0.3) and the norm–excess identity (0.5, in Mathlib's `etvDist` carrier) are proved. The finite-type excess as a sum of positive parts (0.4) is not there in the README's form; a countable-space formula for `etvDist` as the sum of absolute singleton differences exists. Layer 1 is done except for the norm form of the random-population bound in 1.2; the exchangeable attainment of 1.5 is now in the library. Layer 2 is partial: the fibre counts (2.2) and the two-hit mass (2.3) are proved, but the singleton masses (2.1) and the one-pair formula (2.4) are not. Layer 3 is partial only in that the reduction of a repeated-value population to the one-pair population is proved; the explicit bound, strictness and the characterization are not. Layer 4 is untouched.

## The frontier

- **Norm form of the collision bound for random populations (1.2)** — `etvDist` of the two sampling laws of a random population is at most `2(1 - p)`. It should follow from the eventwise bounds and the existing criterion `etvDist_le_of_forall_le_add`.
- **Singleton masses (2.1)** — each sampling law gives a word the number of embeddings, or of maps, producing it, divided by `(n)_m` or `n^m`.
- **Finite-type excess (0.4)** — the excess of finite measures on a finite type as the sum of the positive parts of singleton differences, attained where `ν {y} < μ {y}`.
- **The one-pair formula (2.4)** — the excess for the one-pair population is exactly `1 - p - t·min(p, 1-p)`. It needs 2.1 and 0.4; the two-hit mass and the fibre counts are ready.
- **Repeated values and ties (Layers 3–4)** — once 2.4 lands, the repeated-value bound of 3.1 follows from the existing reduction. Strictness (3.2) is elementary arithmetic and could be done now. The characterization (3.3), the mixture bound and the de Finetti bound with ties follow in order.

<!--tauceti-status:v1 {"roadmap":"FiniteSamplingDiscrepancy","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10","ts":"2026-11-11T00:57:04Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.2 observation commutes with sampling, 0.3 excess contracts under maps, 0.4 excess on a finite type as a sum of singleton differences","state":"partial"},{"id":"Layer 1","remaining":"1.5 attainment by an exchangeable process, and the etvDist form of the 1.2 bound for random populations","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"}],"readme_sha":"729f08fb5904e41512090fbf3913bf6714f8d96aed60406ce65d905472e0eabc","roadmap":"FiniteSamplingDiscrepancy","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10"}-->
# Status: FiniteSamplingDiscrepancy

This file documents the status of the FiniteSamplingDiscrepancy roadmap up until `e06d672` (2026-11-11T00:57:04Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The distinct-values part of the roadmap is essentially in place: the exact collision bound, its sharpening of finite de Finetti, and its attainment by populations of distinct values. Layers 0 and 1 are partial. The repeated-value theory of Layers 2 to 4 has not begun: the one-pair formula, the general bound for repeated values and the de Finetti bound that improves with ties.

### Named results

- **Distinct values attain the collision bound** — for a population of distinct values and a sample no larger than the population, the largest excess of the without-replacement law over the with-replacement law is exactly `1 - (n)_m / n^m` ([`iSup_sampleWithoutReplacement_sub_sampleWithReplacement_dirac_eq`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/Distinct.html#TauCeti.Probability.iSup_sampleWithoutReplacement_sub_sampleWithReplacement_dirac_eq)), attained on the all-distinct event. The all-distinct event must be measurable.
- **The total variation distance for distinct values** — in Mathlib's normalisation, the distance between the two sampling laws is exactly twice the collision probability ([`etvDist_sampleWithoutReplacement_sampleWithReplacement_dirac_eq`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/Distinct.html#TauCeti.Probability.etvDist_sampleWithoutReplacement_sampleWithReplacement_dirac_eq)).
- **The exact collision bound** — for any random population, every measurable event's mass under the two sampling laws differs, in either direction, by at most the probability that a uniform index map is not injective. That probability is computed exactly as `1 - (n)_m / n^m`, improving the union bound `choose m 2 / n` (`sampleWithoutReplacement_le_sampleWithReplacement_add_collision`, `uniformOn_not_injective_apply_eq`).
- **Finite de Finetti with exact collision error** — the Diaconis–Freedman bound: the `m`-prefix law of an `n`-exchangeable process differs from the with-replacement sample of its `n`-prefix by at most `1 - (n)_m / n^m` on every event, and by twice that in total variation (`ExchangeableAt.finiteDeFinetti_exact_collision`).

### Notable definitions and infrastructure

- **Sampling a fixed population** — [`samplePopulation_dirac`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/Basic.html#TauCeti.Probability.samplePopulation_dirac) writes the sampled law of a deterministic population as a pushforward of the selection law, with the specialisations [`sampleWithoutReplacement_dirac`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/Finite.html#TauCeti.Probability.sampleWithoutReplacement_dirac) and [`sampleWithReplacement_dirac`](https://taucetiproject.org/docs/TauCeti/Probability/PopulationSampling/Finite.html#TauCeti.Probability.sampleWithReplacement_dirac). Every exact computation in the roadmap starts from here.
- **Total variation through events** — the library expresses Mathlib's `etvDist` as twice the largest event excess for laws of equal mass (`etvDist_eq_two_mul_iSup_sub`). This is Section 0.5, stated in the `etvDist` carrier rather than the README's signed-measure norm; it turns every eventwise bound here into a distance bound.

### Roadmap coverage

Layer 0 is partial: deterministic populations (0.1) and the norm–excess identity (0.5) are proved. Observation commuting with sampling (0.2), contraction of excess under measurable maps (0.3) and the excess of finite measures as a sum of singleton differences (0.4) were not found. Layer 1 is partial: collision masses (1.1), the eventwise exact bound (1.2), exact-collision finite de Finetti (1.3) and attainment by distinct values (1.4) are proved. The norm form of 1.2 for random populations and the exchangeable attainment example (1.5) were not found. Layers 2, 3 and 4 are untouched.

## The frontier

- **Exchangeable attainment (1.5)** — build the uniformly permuted population on `Equiv.Perm (Fin n)` and show that the prefix law and the with-replacement law give the all-distinct event masses `1` and `(n)_m / n^m`. All of the pieces are now available.
- **Norm form of the random-population bound (1.2)** — `etvDist` of the two sampling laws for a random population is at most `2 * (1 - p)`. It should follow directly from the eventwise bounds and `etvDist_le_of_forall_le_add`.
- **Excess tools (0.2–0.4)** — observation commuting with sampling, contraction of excess under maps, and the finite-type excess sum. Together they are the prerequisites for Layers 2 and 3.
- **The one-pair formula (Layer 2)** — singleton masses, fibre counts for `Function.update id b a`, the two-hit mass `t`, and the exact excess `1 - p - t * min p (1 - p)`. This needs 0.4.
- **Repeated values and ties (Layers 3–4)** — the general bound for non-injective populations, strictness, the characterisation of attainment by distinct values, and the tie-weighted finite de Finetti bound. These need Layer 2 together with 0.2 and 0.3.

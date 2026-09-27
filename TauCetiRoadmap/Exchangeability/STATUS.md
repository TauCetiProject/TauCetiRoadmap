<!--tauceti-status:v1 {"roadmap":"Exchangeability","to_sha":"5b603c69ce30e44bc3ef9dee0cb3f95c2e0f67bb","ts":"2026-09-01T17:14:32Z"}-->
# Status: Exchangeability

This file documents the status of the Exchangeability roadmap up until `5b603c6` (2026-09-01T17:14:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The de Finetti–Ryll-Nardzewski summit and Layers 0–7 are complete, including all three proof routes and the sequence-level empirical, affine, zero-one, ergodic and extreme interfaces. Layer 8 is partial: finite de Finetti and the law-level correspondence are established, while the Markov and array representation converses remain open; nothing in the v1 spine remains unstarted.

### Named results

- **[The de Finetti–Ryll-Nardzewski equivalence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Theorem.html#TauCeti.Probability.deFinetti_RyllNardzewski_equivalence)** — for a process with a.e.-measurable coordinates in a nonempty standard Borel space, contractability is equivalent to exchangeability together with conditional i.i.d.-ness.

- **[De Finetti via L² averaging](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/ViaL2/Theorem.html#TauCeti.Probability.deFinetti_viaL2) and [via Koopman operators](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/ViaKoopman/Theorem.html#TauCeti.Probability.deFinetti_viaKoopman)** — the two alternative lanes now independently obtain the same conditional-i.i.d. conclusion as the reverse-martingale proof.

- **[The empirical-measure form of de Finetti](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/EmpiricalMeasure.html#TauCeti.Probability.deFinetti_empiricalMeasure)** — for a nonempty Polish state space with its Borel structure, the empirical measures converge weakly almost surely to a directing measure.

- **[The quantitative finite de Finetti bound](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/FiniteDeFinetti.html#TauCeti.Probability.ExchangeableAt.prefixLaw_le_sampleWithReplacement_add)** — an `m`-coordinate marginal of an `n`-exchangeable process and its empirical-product mixture differ eventwise by at most `choose m 2 / n`, with the reverse inequality also proved.

- **[The de Finetti correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Correspondence.html#TauCeti.Probability.deFinettiEquiv)** — mixing laws correspond bijectively and affinely to exchangeable path laws; product laws are exactly the [zero-one](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/PathSpace/Law/ZeroOne.html#TauCeti.Probability.exchangeableSigma_trivial_iff_iid), [permutation-ergodic](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/PathSpace/Exchangeable/Ergodic.html#TauCeti.Probability.exchangeableSigma_trivial_iff_ergodicSMul), and [extreme](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/PathSpace/Law/Extreme.html#TauCeti.Probability.exchangeable_extreme_iff_iid) exchangeable laws.

### Notable definitions and infrastructure

- **[The de Finetti barycenter](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Barycenter.html#TauCeti.Probability.deFinettiBarycenter)** packages a mixture of countable product laws and supplies the forward map of the affine correspondence.

- **[Markov exchangeability](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/MarkovExchangeable.html#TauCeti.Probability.MarkovExchangeable)** records invariance under finite paths with the same initial state and transition counts, supporting the developing Diaconis–Freedman lane.

- **[The canonical Aldous–Hoover noise law](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/AldousHoover.html#TauCeti.Probability.AldousHoover.noiseMeasure)** provides the independent uniform global, vertex and cell noise used by the joint and separate array codings.

### Roadmap coverage

Layers 0–2 and 4 were already complete; Layers 3 and 5 are now complete through their L² and Koopman endpoint theorems, and Layers 6–7 now include weak empirical convergence and all specified zero-one, ergodic, extreme and public interfaces. In Layer 8, the countable-index extension, finite de Finetti sampling bounds, and affine classification of exchangeable laws are done. Markov exchangeability is partial: recurrence, excursions, successor arrays and the row-exchangeable-to-mixture bridge exist, but the hard recurrent Markov-exchangeable-to-mixture implication is absent. Arrays are partial: the symmetry and dissociation notions, block and row reductions, row-wise de Finetti, and the forward Aldous–Hoover constructions exist, but no converse representation theorem is declared.

## The frontier

- **Diaconis–Freedman representation.** Prove that the successor array of a recurrent Markov-exchangeable process is row exchangeable; the existing [row-exchangeable successor-array bridge](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/DiaconisFreedman.html#TauCeti.Probability.mixedMarkovChain_of_rowExchangeable_successorProcess) then yields a mixture of Markov chains. The landed last-exit admissibility machinery supplies the finite row permutations needed for this step.

- **Aldous–Hoover representation.** Starting from an arbitrary jointly or separately exchangeable array, construct a measurable coding by the canonical global, vertex and cell noises. The current theory proves row-wise conditional i.i.d.-ness, coupled row coding, dissociation, and that every such coding is exchangeable, but only this forward direction.

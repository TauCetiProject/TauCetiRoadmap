<!--tauceti-status:v1 {"roadmap":"Exchangeability","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"}],"readme_sha":"778c68c43316cb08437ea5f96d30284c70140a43fbc83c1fb228589e1fd2b25a","roadmap":"Exchangeability","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: Exchangeability

This file documents the status of the Exchangeability roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The de Finetti–Ryll-Nardzewski summit was reached by all three classical routes, Layer 8 has every representation theorem it names through Aldous–Hoover for jointly exchangeable arrays, and finite de Finetti has its total-variation form. What remains is the README's ongoing goal of moving general infrastructure out of the exchangeability namespace, which is well advanced.

### Named results

- **[The Aldous–Hoover theorem for jointly exchangeable arrays](https://taucetiproject.org/docs/TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Joint/Representation.html#TauCeti.Probability.jointlyExchangeable_iff_exists_map_jointArray_eq)** — an array with a.e.-measurable entries in a standard Borel space is jointly exchangeable exactly when its law is that of a measurable coding `F(U, U_i, U_j, U_{ij})` of independent uniform global, vertex and edge noise, with one edge variable per unordered pair; the [separately exchangeable analogue](https://taucetiproject.org/docs/TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Separate/Representation.html#TauCeti.Probability.separatelyExchangeable_iff_exists_map_separateArray_eq), with row, column and cell noise, is proved too.

- **[The Diaconis–Freedman theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Recurrence/InitialState.html#TauCeti.Probability.markovExchangeable_iff_mixedMarkovChain)** — a recurrent process is Markov exchangeable if and only if it is a mixture of Markov chains.

- **[The de Finetti–Ryll-Nardzewski equivalence](https://taucetiproject.org/docs/TauCeti/Probability/DeFinetti/Theorem.html#TauCeti.Probability.deFinetti_RyllNardzewski_equivalence)** — for a process with a.e.-measurable coordinates in a standard Borel space, contractability is equivalent to exchangeability together with conditional i.i.d.-ness; the two-way forms such as [contractable iff conditionally i.i.d.](https://taucetiproject.org/docs/TauCeti/Probability/DeFinetti/Theorem.html#TauCeti.Probability.contractable_iff_conditionallyIID) hold under any finite measure.

- **[The finite de Finetti theorem, total-variation form](https://taucetiproject.org/docs/TauCeti/Probability/Exchangeability/FiniteDeFinetti.html#TauCeti.Probability.ExchangeableAt.etvDist_prefixLaw_sampleWithReplacement_le)** — a finite exchangeable `m`-marginal of an `n`-prefix is within `2 * choose m 2 / n` of its with-replacement sample in Mathlib's signed-measure-norm total variation, the convention the README asked any such corollary to name; the eventwise bounds also hold with the exact collision error `1 - (n)_m / n^m`.

- **[The Hewitt–Savage zero-one law in ergodic form](https://taucetiproject.org/docs/TauCeti/Probability/Exchangeability/PathSpace/Exchangeable/Ergodic.html#TauCeti.Probability.ergodicSMul_infinitePi_const)** — finitely supported permutations of time act ergodically on an i.i.d. product law.

### Notable definitions and infrastructure

- **[Conditional independence as a functional representation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Kernel/ConditionalRandomization.html#ProbabilityTheory.CondIndepFun.exists_independent_coding)** realizes conditionally independent variables as measurable codings of the conditioning variable and separate uniform noises. It mentions no exchangeability, and both Aldous–Hoover proofs turn on it.

- **[The de Finetti barycenter](https://taucetiproject.org/docs/TauCeti/Probability/Process/PathLaw/Mixture.html#MeasureTheory.Measure.deFinettiBarycenter)**, the path law `∫ P^{⊗ℕ} dπ(P)` of a mixing law, sits in a general path-law module. Through [the de Finetti correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Correspondence.html#TauCeti.Probability.deFinettiEquiv) it identifies mixing laws bijectively and affinely with exchangeable path laws, which is what makes the extreme-point and ergodic characterizations of product laws statable.

- **[The mean ergodic theorem for conditional expectations](https://taucetiproject.org/docs/TauCeti/Probability/Ergodic/CondExpProjection.html#TauCeti.Probability.tendsto_eLpNorm_birkhoffAverage_sub_condExp)** says Birkhoff averages of a square-integrable observable converge in L² to its conditional expectation given the invariant σ-algebra. It is the general statement behind the Koopman route, now in an ergodic-theory home.

### Roadmap coverage

All nine layers are done. Layers 0–7 cover the finite-marginal and product-kernel foundations, tails and shifts, the L², reverse-martingale and Koopman routes, directing measures and the public sequence API; Layer 4 also has Lᵖ forms of both Lévy's downward and [upward](https://taucetiproject.org/docs/TauCeti/Probability/Martingale/Convergence.html#MeasureTheory.MemLp.tendsto_eLpNorm_condExp) theorems, and the exchangeable, tail and shift-invariant σ-algebras of a contractable law are identified up to null sets. Layer 8 has every item it names: the finite de Finetti bounds on a shared population-sampling construction, with the total-variation corollary; de Finetti for other countable index types; the affine and ergodic decomposition of exchangeable laws; Markov exchangeability through the Diaconis–Freedman theorem; and the Aldous–Hoover representation in both its separate and joint forms.

## The frontier

- **Moving general infrastructure to general homes.** This is the README's parallel ongoing goal. Path laws, tails, block averages, i.i.d. and Markov-chain mixtures, excursions, Markov-chain path masses, conditional randomization, and the Aldous–Hoover noise, codings and random row laws now live in general process, kernel and measure-theory modules. A sizeable exchangeability directory remains, and the supplied material does not establish how much of it is still symmetry-free infrastructure that should move.

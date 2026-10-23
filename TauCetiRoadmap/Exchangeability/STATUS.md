<!--tauceti-status:v1 {"roadmap":"Exchangeability","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba","ts":"2026-10-23T04:01:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"}],"readme_sha":"6983d6da35f29742971c47d02aabd34cfcd2d163c3f205617de9ddeb84748945","roadmap":"Exchangeability","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
# Status: Exchangeability

This file documents the status of the Exchangeability roadmap up until `bfcff79` (2026-10-23T04:01:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. All three classical routes reach the de Finetti–Ryll-Nardzewski summit, and Layer 8 has every representation theorem it names, through Aldous–Hoover for jointly exchangeable arrays. Work now goes to the README's ongoing goal of moving general infrastructure out of the exchangeability namespace, and to sharpening results that are already proved.

### Named results

- **The Aldous–Hoover theorem for jointly exchangeable arrays** — an array with entries in a standard Borel space is jointly exchangeable exactly when its law is that of a measurable coding `F(U, U_i, U_j, U_{ij})` of independent uniform global, vertex and edge noise, with one edge variable per unordered pair ([`jointlyExchangeable_iff_exists_map_jointArray_eq`](https://taucetiproject.org/docs/TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Joint/Representation.html#TauCeti.Probability.jointlyExchangeable_iff_exists_map_jointArray_eq)).

- **The Aldous–Hoover theorem for separately exchangeable arrays** — the same characterization with independent global, row, column and cell noise ([`separatelyExchangeable_iff_exists_map_separateArray_eq`](https://taucetiproject.org/docs/TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Separate/Representation.html#TauCeti.Probability.separatelyExchangeable_iff_exists_map_separateArray_eq)).

- **The Diaconis–Freedman theorem** — a recurrent process is Markov exchangeable if and only if it is a mixture of Markov chains ([`markovExchangeable_iff_mixedMarkovChain`](https://taucetiproject.org/docs/TauCeti/Probability/Exchangeability/Recurrence/InitialState.html#TauCeti.Probability.markovExchangeable_iff_mixedMarkovChain)).

- **The de Finetti–Ryll-Nardzewski equivalence** — for a process in a nonempty standard Borel space, contractability is equivalent to exchangeability together with conditional i.i.d.-ness ([`deFinetti_RyllNardzewski_equivalence`](https://taucetiproject.org/docs/TauCeti/Probability/DeFinetti/Theorem.html#TauCeti.Probability.deFinetti_RyllNardzewski_equivalence)).

- **The finite de Finetti theorem** — an exchangeable `m`-prefix and its with-replacement sample from the `n`-prefix differ on every measurable event by at most the collision probability `1 - (n)_m / n^m`, hence by at most `choose m 2 / n`, in both directions ([`finiteDeFinetti_exact_collision`](https://taucetiproject.org/docs/TauCeti/Probability/Exchangeability/FiniteDeFinetti.html#TauCeti.Probability.ExchangeableAt.finiteDeFinetti_exact_collision), [`finiteDeFinetti`](https://taucetiproject.org/docs/TauCeti/Probability/Exchangeability/FiniteDeFinetti.html#TauCeti.Probability.ExchangeableAt.finiteDeFinetti)).

### Notable definitions and infrastructure

- **Conditional independence as a functional representation** ([`CondIndepFun.exists_independent_coding`](https://taucetiproject.org/docs/TauCeti/Probability/Kernel/ConditionalRandomization.html#ProbabilityTheory.CondIndepFun.exists_independent_coding)) produces conditionally independent variables from the conditioning variable by measurable codings of separate uniform noises. The statement does not involve exchangeability, and both Aldous–Hoover proofs depend on it.

- **The de Finetti correspondence** ([`deFinettiEquiv`](https://taucetiproject.org/docs/TauCeti/Probability/DeFinetti/Correspondence.html#TauCeti.Probability.deFinettiEquiv)) identifies mixing laws with exchangeable path laws, bijectively and affinely. This is what lets the extreme-point and ergodic characterizations of product laws be stated.

- **Excursion reconstruction for recurrent processes** ([`Recurrent.pathLaw_eq_map_pathOfExcursions`](https://taucetiproject.org/docs/TauCeti/Probability/Recurrent/Excursion.html#TauCeti.Probability.Recurrent.pathLaw_eq_map_pathOfExcursions)) says the path law of a recurrent process started at a state is the image of its excursion law under concatenation. It has no symmetry hypothesis, and the Markov-exchangeable theorems behind Diaconis–Freedman are built on it.

### Roadmap coverage

All nine layers are done. Layers 0–7 cover the finite-marginal and product-kernel foundations, tails and shifts, the L², reverse-martingale and Koopman routes, directing measures and the public sequence API; Layer 4 also has the Lᵖ form of Lévy's downward theorem. Layer 8 has every item it names: finite de Finetti on a shared population-sampling construction, now also with exact-collision and total-variation forms (the latter for Mathlib's `etvDist`, the signed-measure norm, where the bound reads `2 * choose m 2 / n`), de Finetti for other countable index types, the affine and ergodic decomposition of exchangeable laws, Markov exchangeability through Diaconis–Freedman, and Aldous–Hoover in its separate and joint forms.

## The frontier

- **Moving general infrastructure to general homes.** This is the README's parallel ongoing goal, and it is well advanced. Path laws, tails, block averages, i.i.d. mixture laws and the de Finetti barycenter, population sampling, mixtures of Markov chains, Aldous–Hoover noise and codings, excursions and recurrence now sit in general process, sampling, ergodic and kernel modules. The supplied material does not show how much general-purpose code is still under the exchangeability namespace.

- **No open roadmap targets.** Every milestone the README lists has landed. Further work beyond sharpening existing statements would need new targets in the README.

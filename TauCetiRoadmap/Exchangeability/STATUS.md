<!--tauceti-status:v1 {"roadmap":"Exchangeability","to_sha":"a65deaded1cae2fdc20c06b7cd5fef04c8e80d6c","ts":"2026-10-12T15:15:23Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"}],"readme_sha":"6983d6da35f29742971c47d02aabd34cfcd2d163c3f205617de9ddeb84748945","roadmap":"Exchangeability","to_sha":"a65deaded1cae2fdc20c06b7cd5fef04c8e80d6c"}-->
# Status: Exchangeability

This file documents the status of the Exchangeability roadmap up until `a65dead` (2026-10-12T15:15:23Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The de Finetti–Ryll-Nardzewski summit was reached by all three classical routes, and Layer 8 has every representation theorem it names, through Aldous–Hoover for jointly exchangeable arrays. What remains is the README's ongoing goal of moving general infrastructure out of the exchangeability namespace.

### Named results

- **[The Aldous–Hoover theorem for jointly exchangeable arrays](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Joint/Representation.html#TauCeti.Probability.jointlyExchangeable_iff_exists_map_jointArray_eq)** — a standard-Borel-valued array is jointly exchangeable exactly when its law is that of a measurable coding `F(U, U_i, U_j, U_{ij})` of independent uniform global, vertex and edge noise, with one edge variable for each unordered pair.

- **The Aldous–Hoover theorem for separately exchangeable arrays** — the analogous characterization by global, row, column and cell noise.

- **[The Diaconis–Freedman theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Recurrence/InitialState.html#TauCeti.Probability.markovExchangeable_iff_mixedMarkovChain)** — a recurrent process is Markov exchangeable if and only if it is a mixture of Markov chains.

- **[The de Finetti–Ryll-Nardzewski equivalence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Theorem.html#TauCeti.Probability.deFinetti_RyllNardzewski_equivalence)** — for a process in a nonempty standard Borel space, contractability is equivalent to exchangeability together with conditional i.i.d.-ness.

- **[The finite de Finetti theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/FiniteDeFinetti.html#TauCeti.Probability.ExchangeableAt.finiteDeFinetti)** — a finite exchangeable marginal and its with-replacement sample differ by at most `choose m 2 / n` on every measurable event, in both directions.

### Notable definitions and infrastructure

- **[Conditional independence as a functional representation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Kernel/ConditionalRandomization.html#ProbabilityTheory.CondIndepFun.exists_independent_coding)** realizes conditionally independent variables as measurable codings of the conditioning variable and separate uniform noises. It mentions no exchangeability, and both Aldous–Hoover proofs turn on it.

- **[The de Finetti correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Correspondence.html#TauCeti.Probability.deFinettiEquiv)** identifies mixing laws bijectively and affinely with exchangeable path laws, which is what makes the extreme-point and ergodic characterizations of product laws statable.

- **[Excursion reconstruction for recurrent processes](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Recurrent/Excursion.html#TauCeti.Probability.Recurrent.pathLaw_eq_map_pathOfExcursions)** says the path law of a recurrent process started at a state is the image of its excursion law under concatenation. It now lives in a general recurrence module with no symmetry hypothesis, and the Markov-exchangeable excursion theorems are built on it.

### Roadmap coverage

All nine layers are done. Layers 0–7 cover the finite-marginal and product-kernel foundations, tails and shifts, the L², reverse-martingale and Koopman routes, directing measures and the public sequence API; Layer 4 also has the Lᵖ form of Lévy's downward theorem it listed as a follow-up, and the exchangeable, tail and shift-invariant σ-algebras of a contractable law are identified up to null sets. Layer 8 has every item it names: the finite de Finetti bounds on a shared population-sampling construction, de Finetti for other countable index types, the affine and ergodic decomposition of exchangeable laws, Markov exchangeability through the Diaconis–Freedman theorem, and the Aldous–Hoover representation in both its separate and joint forms.

## The frontier

- **Moving general infrastructure to general homes.** The README lists this as a parallel ongoing goal. The excursion and recurrence machinery behind Diaconis–Freedman has now moved to general process and recurrence modules, and much martingale, ergodic and kernel material already sits in general files; the supplied material does not establish how much remains under the exchangeability namespace.

- **A total-variation form of finite de Finetti.** The eventwise inequalities are proved. Any total-variation corollary is optional, and the README requires it to say which normalization it uses.

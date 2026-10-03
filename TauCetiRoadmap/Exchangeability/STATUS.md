<!--tauceti-status:v1 {"roadmap":"Exchangeability","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"the Aldous–Hoover representation for jointly exchangeable arrays: code the diagonal and assemble the vertex-strip and off-diagonal pair codings","state":"partial"}],"readme_sha":"3b70cddfc1c8ae2fead44ffe1084182660b44ea01a71d3e0165a5b5420bf4a43","roadmap":"Exchangeability","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: Exchangeability

This file documents the status of the Exchangeability roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The de Finetti–Ryll-Nardzewski summit and Layers 0–7 are complete. Layer 8 is partial but close to finished: finite de Finetti, the exchangeable-law correspondence, the recurrent Markov representation and the separate Aldous–Hoover representation are proved. Only the joint Aldous–Hoover representation is still open. No layer is untouched.

### Named results

- **[The Aldous–Hoover theorem for separately exchangeable arrays](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/AldousHoover/SeparateRepresentation.html#TauCeti.Probability.separatelyExchangeable_iff_exists_map_separateArray_eq)** — a standard-Borel-valued array is separately exchangeable exactly when its law is that of a measurable coding `F(U, U_row i, U_col j, U_cell i j)` of independent uniform noise.

- **[The Diaconis–Freedman theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Recurrence/InitialState.html#TauCeti.Probability.markovExchangeable_iff_mixedMarkovChain)** — a recurrent process is Markov exchangeable if and only if it is a mixture of Markov chains.

- **[The de Finetti–Ryll-Nardzewski equivalence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Theorem.html#TauCeti.Probability.deFinetti_RyllNardzewski_equivalence)** — for a process with a.e.-measurable coordinates in a nonempty standard Borel space, contractability is equivalent to exchangeability together with conditional i.i.d.-ness.

- **[The de Finetti correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Correspondence.html#TauCeti.Probability.deFinettiEquiv)** — mixing laws correspond bijectively and affinely to exchangeable path laws.

- **[The quantitative finite de Finetti bound](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/FiniteDeFinetti.html#TauCeti.Probability.ExchangeableAt.prefixLaw_le_sampleWithReplacement_add)** — a finite exchangeable marginal and its empirical-product mixture differ eventwise by at most `choose m 2 / n`, and the reverse inequality is proved as well.

### Notable definitions and infrastructure

- **[Conditional independence as a functional representation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Kernel/ConditionalRandomization.html#ProbabilityTheory.CondIndepFun.exists_independent_coding)** realizes conditionally independent variables as measurable codings of the conditioning variable and separate uniform noises. It is general probability with no exchangeability in its statement, and it is what turns conditional-independence statements about arrays into codings.

- **[The de Finetti barycenter](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Barycenter.html#TauCeti.Probability.deFinettiBarycenter)** packages mixtures of countable product laws, and the affine correspondence is built on it.

- **[The array tail σ-algebra](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/Tail.html#TauCeti.Probability.arrayTail)** supports conditioning array laws into dissociated components. For separately exchangeable laws, those components are [exactly the extreme points](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/Extreme/Separate.html#TauCeti.Probability.jointlyDissociated_iff_mem_extremePoints_separatelyExchangeable).

### Roadmap coverage

Layers 0–7 remain done: the finite-marginal and product-kernel foundations, tails and shifts, the L², martingale and Koopman routes, directing measures, and the public sequence API are all in place. Layer 8 is still partial. Its finite de Finetti comparison, countable-index extension, affine classification, recurrent Markov-exchangeable representation and separate Aldous–Hoover representation are established. For jointly exchangeable arrays, joint dissociation is known to be equivalent to extremality, and every measurable joint coding is known to be exchangeable. The vertex strips are [coded by i.i.d. vertex noise](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/Strip/VertexCoding.html#TauCeti.Probability.JointlyExchangeable.exists_vertex_strip_coding), and the off-diagonal pairs by [one common pair coding](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/Strip/Cell/OffDiagonalCoding.html#TauCeti.Probability.JointlyExchangeable.exists_common_offDiagonalArray_coding). The joint representation itself has not landed.

## The frontier

- **Joint Aldous–Hoover representation.** Every jointly exchangeable array should be the law of a measurable coding by global, vertex and symmetric edge noise. What remains is to code the diagonal together with the vertex noise, and then to combine the vertex-strip coding with the common off-diagonal pair coding, whose inputs are the crossing strips and the diagonal, into one coding for the whole array. That coding must handle both orientations of each pair.

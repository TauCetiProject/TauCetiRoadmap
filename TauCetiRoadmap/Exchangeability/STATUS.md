<!--tauceti-status:v1 {"roadmap":"Exchangeability","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2","ts":"2026-09-26T20:53:39+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"Aldous–Hoover converse representations for jointly and separately exchangeable arrays","state":"partial"}],"readme_sha":"3b70cddfc1c8ae2fead44ffe1084182660b44ea01a71d3e0165a5b5420bf4a43","roadmap":"Exchangeability","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2"}-->
# Status: Exchangeability

This file documents the status of the Exchangeability roadmap up until `759eb3e` (2026-09-26T20:53:39+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The de Finetti–Ryll-Nardzewski summit and Layers 0–7 are complete. Layer 8 is partial: finite de Finetti, the exchangeable-law correspondence, and the recurrent Markov representation are proved, while the Aldous–Hoover representation converse remains open. No layer is untouched.

### Named results

- **[The Diaconis–Freedman theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Recurrence/InitialState.html#TauCeti.Probability.markovExchangeable_iff_mixedMarkovChain)** — a recurrent process is Markov exchangeable if and only if it is a mixture of Markov chains.

- **[The de Finetti–Ryll-Nardzewski equivalence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Theorem.html#TauCeti.Probability.deFinetti_RyllNardzewski_equivalence)** — for a process with a.e.-measurable coordinates in a nonempty standard Borel space, contractability is equivalent to exchangeability together with conditional i.i.d.-ness.

- **[The de Finetti correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Correspondence.html#TauCeti.Probability.deFinettiEquiv)** — mixing laws correspond bijectively and affinely to exchangeable path laws.

- **[The quantitative finite de Finetti bound](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/FiniteDeFinetti.html#TauCeti.Probability.ExchangeableAt.prefixLaw_le_sampleWithReplacement_add)** — a finite exchangeable marginal and its empirical-product mixture differ eventwise by at most `choose m 2 / n`, with the reverse inequality also proved.

- **[The canonical row-coding representation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/Representation.html#TauCeti.Probability.SeparatelyExchangeable.existsUnique_rowCodingArrayLaw)** — every separately exchangeable array has a unique column-invariant mixing law on row-path measures that reproduces its array law.

### Notable definitions and infrastructure

- **[The de Finetti barycenter](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/DeFinetti/Barycenter.html#TauCeti.Probability.deFinettiBarycenter)** packages mixtures of countable product laws for the affine correspondence.

- **[The array tail σ-algebra](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/Tail.html#TauCeti.Probability.arrayTail)** supports conditioning array laws into dissociated components.

- **[The row-coding array law](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/RowCoding.html#TauCeti.Probability.rowCodingArrayLaw)** samples independent rows from a random path measure, giving the canonical representation its concrete law.

### Roadmap coverage

Layers 0–7 remain done: finite-marginal and product-kernel foundations, tails and shifts, the L², martingale and Koopman routes, directing measures, and the public sequence API are in place. Layer 8 remains partial. Its finite de Finetti comparison, countable-index extension, affine classification, and recurrent Markov-exchangeable representation are established. For arrays, [joint dissociation is equivalent to extremality](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/Extreme/Basic.html#TauCeti.Probability.jointlyDissociated_iff_mem_extremePoints), and [dissociated component laws](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Decomposition.html#TauCeti.Probability.JointlyExchangeable.exists_dissociated_kernel) and canonical row coding are available; the general Aldous–Hoover coding converse is still absent.

## The frontier

- **Separate Aldous–Hoover representation.** Turn the column-invariant mixing law supplied by canonical row coding into a measurable coding with global, row, column and cell noise for every separately exchangeable array.

- **Joint Aldous–Hoover representation.** Construct one coding for every jointly exchangeable array, including its diagonal and the dependence between opposite orientations; the [paired-block reduction](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Probability/Exchangeability/Arrays/Block.html#TauCeti.Probability.JointlyExchangeable.separatelyExchangeable_arrayBlockPair_evenOdd) is available, but no converse coding theorem is established.

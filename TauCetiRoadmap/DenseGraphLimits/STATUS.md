<!--tauceti-status:v1 {"roadmap":"DenseGraphLimits","to_sha":"8515c15598f1e25cf1bc1f871628129321d6440c","ts":"2026-10-14T00:44:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8a","state":"done"},{"id":"Layer 8b","state":"done"},{"id":"Layer 9a","state":"done"},{"id":"Layer 9b","state":"done"},{"id":"Layer 9c","state":"done"}],"readme_sha":"814e769001ea035cbaff04a422828fc27f10ccd5d8763b60852e29c00a4ef940","roadmap":"DenseGraphLimits","to_sha":"8515c15598f1e25cf1bc1f871628129321d6440c"}-->
# Status: DenseGraphLimits

This file documents the status of the DenseGraphLimits roadmap up until `8515c15` (2026-10-14T00:44:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer's stated milestones are proved, from the graphon carrier through both representation summits and sampling convergence. The representation and limit-existence theorems hold on any atomless standard Borel carrier. What remains is housekeeping that the README asks for alongside the mathematics: generic law adapters, and moving graphon-independent prerequisites into general homes.

### Named results

- **The Lovász–Szegedy characterization** — a graph parameter is the homomorphism density of a graphon on an atomless standard Borel carrier exactly when it is isomorphism invariant, multiplicative, normalized, and reflection positive ([`lovasz_szegedy_representability`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/Representability/Representation.html#TauCeti.DenseGraphLimits.lovasz_szegedy_representability)).
- **The Diaconis–Janson graphon-mixture representation** — every exchangeable law on infinite graphs is a mixture of graphon sampling laws, for exactly one mixing measure on graphon space ([`existsUnique_bind_infiniteSampleLawOnSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/ExchangeableGraphLaw/Infinite/Mixture.html#TauCeti.DenseGraphLimits.InfiniteExchangeableGraphLaw.existsUnique_bind_infiniteSampleLawOnSpace)).
- **The convergence equivalence** — for graphons on arbitrary, possibly different, probability carriers, convergence in cut distance is the same as convergence of every homomorphism density ([`tendsto_cutDist_iff_forall_homDensity_tendsto`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/Convergence.html#TauCeti.DenseGraphLimits.tendsto_cutDist_iff_forall_homDensity_tendsto)). As a corollary, every convergent sequence of finite graphs [has a limit graphon](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/Convergence.html#TauCeti.DenseGraphLimits.exists_graphon_tendsto_cutDist_finiteGraphGraphon_iff_forall_homDensityFin_cauchySeq) on any atomless standard Borel carrier.
- **Lovász–Szegedy compactness** — the cut-distance quotient of graphons on any atomless standard Borel carrier is a compact metric space ([`GraphonSpace.instCompactSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/Compact.html#TauCeti.DenseGraphLimits.GraphonSpace.instCompactSpace)).
- **Frieze–Kannan weak regularity** — every graphon is within ε in cut norm of a block-average step graphon with at most 4^⌈1/ε²⌉ parts ([`weak_regularity_frieze_kannan`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/StepGraphon/Regularity.html#TauCeti.DenseGraphLimits.weak_regularity_frieze_kannan)).

### Notable definitions and infrastructure

- **The coupling cut distance** — [`cutDist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/CutMetric/Distance.html#TauCeti.DenseGraphLimits.cutDist) satisfies an [arbitrary-carrier triangle inequality](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/CutMetric/Triangle.html#TauCeti.DenseGraphLimits.cutDist_triangle), so graphon space is a genuine metric quotient over every carrier.
- **The unit-interval representative** — [`unitIntervalRepr`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/UnitIntervalEmbedding.html#TauCeti.DenseGraphLimits.Graphon.unitIntervalRepr) isometrically embeds every graphon space in the unit-interval one. This is how total boundedness, compactness, convergence and sampling convergence carry over to other carriers.
- **Density coordinates** — [`homDensityCoords`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/Coordinates.html#TauCeti.DenseGraphLimits.homDensityCoords) is a [closed embedding](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/Coordinates.html#TauCeti.DenseGraphLimits.isClosedEmbedding_homDensityCoords) of unit-interval graphon space into a product of real lines. It lets measurability on graphon space be checked one density at a time, and the mixture representation rests on it.

### Roadmap coverage

All layers, 0 through 9c, meet their stated milestones. Layers 0–7 cover the following:
- the carrier and the cut metric;
- counting and regularity;
- the AE view;
- compactness;
- equality of the coupling and map cut distances;
- separation and convergence;
- extremal applications, with validation examples.

Layer 8a/8b carry reflection positivity and the Lovász–Szegedy summit, with an example showing that reflection positivity is independent of the other axioms. Layer 9a–9c carry graphon sampling, the Diaconis–Janson representation with its [Aldous–Hoover compatibility](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/ExchangeableGraphLaw/Compatibility.html#TauCeti.DenseGraphLimits.InfiniteExchangeableGraphLaw.exists_jointCoding_mixingMeasure), and almost-sure and in-probability sampling convergence on any probability carrier. Layer 0's three- and four-coordinate `Measure.pi` identifications ([`measurePreserving_finThreeArrow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Constructions/Pi.html#TauCeti.measurePreserving_finThreeArrow), [`measurePreserving_finFourArrow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Constructions/Pi.html#TauCeti.measurePreserving_finFourArrow)) now live in the general measure-theory library.

## The frontier

- **No stated milestone remains open** — every layer's targets are proved. Further work goes beyond what the roadmap requires as written.
- **Generic exchangeable-law adapters** — the README wants the graph-specialized law structures to adapt to a shared generic relational-law API owned by the Exchangeability roadmap. The array-law interface `graphLawArrayLawEquiv` exists. This report has not checked whether adapters to a generic relational-law API exist.
- **Reusable homes** — the README asks that the following graphon-independent prerequisites live in general `TauCeti/` homes: the measure-preserving map from the unit interval, the atomless mod-null equivalence, the martingale `L¹` lemmas, and the `AEEqFun` ergonomics. The `Measure.pi` coordinate lemmas are now there. This report has not verified where the others live.
- **Atomic regressions as named results** — Layer 5's regression checks are unnamed examples. They would need to be stated as named lemmas before anyone downstream could cite them.

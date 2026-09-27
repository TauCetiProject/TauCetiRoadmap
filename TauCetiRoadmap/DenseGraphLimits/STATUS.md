<!--tauceti-status:v1 {"roadmap":"DenseGraphLimits","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2","ts":"2026-09-26T20:53:39+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"total boundedness for the general fixed-carrier GraphonSpace quotient","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"Dirac, finite-atomic, and mixed regressions for coupling/map cut-distance equality","state":"partial"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8a","state":"done"},{"id":"Layer 8b","state":"done"},{"id":"Layer 9a","state":"done"},{"id":"Layer 9b","state":"done"},{"id":"Layer 9c","state":"done"}],"readme_sha":"814e769001ea035cbaff04a422828fc27f10ccd5d8763b60852e29c00a4ef940","roadmap":"DenseGraphLimits","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2"}-->
# Status: DenseGraphLimits

This file documents the status of the DenseGraphLimits roadmap up until `759eb3e` (2026-09-26T20:53:39+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The main compactness, separation, representability, graphon-mixture, and sampling-convergence summits are proved. Layer 2 still lacks an evidenced total-boundedness result for the general fixed-carrier quotient, and Layer 5's prescribed atomic regression gates remain unverified in the supplied record; no layer is otherwise untouched.

### Named results

- **The Lovász–Szegedy characterization** — a graph parameter is the homomorphism density of a unit-interval graphon exactly when it is isomorphism invariant, multiplicative, normalized, and reflection positive ([`lovasz_szegedy_representability`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/Representability/Representation.html#TauCeti.DenseGraphLimits.lovasz_szegedy_representability)).
- **The Diaconis–Janson graphon-mixture correspondence** — probability measures on the graphon quotient correspond to exchangeable probability laws on infinite graphs, with homomorphism densities as the mixture coordinates ([`graphonMixtureLawEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/ExchangeableGraphLaw/InfiniteCorrespondence.html#TauCeti.DenseGraphLimits.graphonMixtureLawEquiv)).
- **Lovász–Szegedy compactness** — the cut-distance quotient of unit-interval graphons is compact ([`GraphonSpaceI.instCompactSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/Compact.html#TauCeti.DenseGraphLimits.GraphonSpaceI.instCompactSpace)).
- **Cross-carrier separation** — two graphons on arbitrary probability carriers have zero cut distance exactly when every finite homomorphism density agrees ([`cutDist_eq_zero_iff_forall_homDensity_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/Separation/Inverse.html#TauCeti.DenseGraphLimits.cutDist_eq_zero_iff_forall_homDensity_eq)).
- **Almost-sure sampling convergence** — the finite windows of a joint infinite graphon sample converge to the source graphon in cut distance almost everywhere ([`infiniteSampleLaw_ae_tendsto_cutDist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/Sampling/AlmostSure/CutDistance.html#TauCeti.DenseGraphLimits.infiniteSampleLaw_ae_tendsto_cutDist)).

### Notable definitions and infrastructure

- **The coupling cut distance** — [`cutDist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/CutMetric/Distance.html#TauCeti.DenseGraphLimits.cutDist) now has an [arbitrary-carrier triangle inequality](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/CutMetric/Triangle.html#TauCeti.DenseGraphLimits.cutDist_triangle), permitting a genuine metric quotient and cross-carrier comparisons.
- **Labeled-graph gluing** — [`LabeledGraph.glue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/Representability/LabeledGraph.html#TauCeti.DenseGraphLimits.LabeledGraph.glue) retains labels under composition, so connection matrices can express reflection positivity.
- **The graph-parameter Möbius transform** — [`graphParamMobius`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/Representability/Moebius.html#TauCeti.DenseGraphLimits.graphParamMobius) supplies consistent finite graph laws for the representation argument.

### Roadmap coverage

Layers 0, 1, 3, 4, 6, 7, 8a, 8b, 9a, 9b, and 9c meet their stated theorem milestones, spanning the strict carrier and AE view, compactness and separation, extremal validation, both representation summits, and both sampling-convergence modes. Layer 2 is partial because total boundedness is declared for `GraphonSpaceI`, while its text asks for the general `GraphonSpace` quotient; its counting and weak-regularity results are in place. Layer 5 is partial: the coupling/map equality and atomless mod-null transport are proved, but the required Dirac, finite-atomic, and mixed regression gates are not established by the supplied declarations.

## The frontier

- **General fixed-carrier total boundedness** — prove the Layer 2 statement for `GraphonSpace` beyond the [unit-interval case](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/DenseGraphLimits/GraphonSpace/TotallyBounded.html#TauCeti.DenseGraphLimits.totallyBounded_graphonSpaceI), or clarify the roadmap's intended carrier scope.
- **Coupling/map regression gates** — establish the Dirac, finite-atomic, and mixed cases against the already proved comparison; the declaration inventory does not show those required checks.

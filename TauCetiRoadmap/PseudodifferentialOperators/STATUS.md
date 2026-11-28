<!--tauceti-status:v1 {"roadmap":"PseudodifferentialOperators","to_sha":"b4f07355dff5247676a8ca6f3ba39d26e14385fb","ts":"2026-11-28T06:58:08Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"connection expansion of symbols, general metric formal adjoints, weighted-circle Bochner counterexample","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"bundle/density Schwartz kernel theorem; proper support and transpose on bundles","state":"partial"},{"id":"Layer 4","remaining":"chart-local coordinate changes, global bundle quantization and atlas independence, principal-symbol exact sequence","state":"partial"},{"id":"Layer 5","remaining":"joint (s,p) interpolation; choice-independent bundle analytic scales and operator mappings; manifold averaging","state":"partial"},{"id":"Layer 6","remaining":"patched bundle parametrix, compact-base Fredholm theory, adjoint-kernel solvability and regularity independence","state":"partial"},{"id":"Layer 7","remaining":"classical elliptic powers and order changes, equivariant product index, elliptic-complex Hodge theory","state":"partial"},{"id":"Layer 8","remaining":"scalar Laplacian H² realization, normalized H² pullback, resolvent and spectral-projection intertwining","state":"partial"},{"id":"Layer 9","remaining":"manifold and bundle wave front calculus and distribution operations; tensor/product hypocontinuity","state":"partial"}],"readme_sha":"1beba27726fd6066fb32d8e4bf4ab512b035dcd25c8d874b8fa6a144672b859b","roadmap":"PseudodifferentialOperators","to_sha":"b4f07355dff5247676a8ca6f3ba39d26e14385fb"}-->
# Status: PseudodifferentialOperators

This file documents the status of the PseudodifferentialOperators roadmap up until `b4f0735` (2026-11-28T06:58:08Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The symbol and asymptotic-expansion layer is done. The other layers are partial, with a substantial Euclidean calculus and admissible distribution pullbacks. Global bundle quantization, its patched Fredholm theory and classical elliptic powers remain unestablished here. The current extract is truncated, so completion claims also rely on the earlier reports.

### Named results

- **Distributional elliptic regularity** — For a properly supported classical elliptic operator of order m on Euclidean space, Pu locally in H^s forces an arbitrary distribution u locally into H^(s+m) ([`IsElliptic.isLocallySobolevAt_of_quantizeDistribution`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/ProperSupport/EllipticRegularity.html#TauCeti.ClassicalSymbol.IsElliptic.isLocallySobolevAt_of_quantizeDistribution)).
- **Hörmander's pullback theorem** — A smooth map between Euclidean open sets pulls back distributions whose wave front sets avoid its normal set, with the cotangent wave front bound and continuity for fixed closed admissible cones in the normal topology ([`waveFrontSet_pullback_subset`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/Pullback/SmoothMap.html#Distribution.waveFrontSet_pullback_subset), [`pullbackCLM`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/NormalTopology/SmoothMap.html#TauCeti.WaveFrontSpace.pullbackCLM)).
- **Microlocal elliptic regularity for systems** — For compactly spatially supported matrix-valued symbols and inputs in some H^t, WF(u) is contained in WF(Op(a)u) together with the characteristic set ([`vectorWaveFrontSet_toDistribution_subset_quantizeSobolev_union_characteristicSet`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/CharacteristicSet.html#TauCeti.Symbol.vectorWaveFrontSet_toDistribution_subset_quantizeSobolev_union_characteristicSet)).
- **Order-zero L^p boundedness** — Order-zero symbols with estimates uniform in position quantize to bounded operators on L^p for 1 < p < ∞ ([`exists_quantizeUniformOrderZeroLp_of_one_lt`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Lp/CalderonZygmund.html#TauCeti.Symbol.exists_quantizeUniformOrderZeroLp_of_one_lt)).
- **Sunada's theorem** — Almost-conjugate subgroups of a finite group acting freely by isometries on a closed connected Riemannian manifold give quotients with isomorphic weak Laplace eigenspaces, without yet establishing the specified H²-domain route ([`nonempty_linearEquiv_weakEigenspace`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Quotient/Isospectral/Weak.html#Subgroup.AlmostConjugate.nonempty_linearEquiv_weakEigenspace)).

### Notable definitions and infrastructure

- **Properly supported parametrices** give two-sided inverses modulo smoothing with kernels within any prescribed distance of the diagonal, enabling the Euclidean distributional regularity theorem ([`exists_hasPropagationLE_quantizeSchwartzValue_eq_add_and_eq_add`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Composition/ProperParametrix.html#TauCeti.Symbol.IsEllipticAbove.exists_hasPropagationLE_quantizeSchwartzValue_eq_add_and_eq_add)).
- **Local little Besov regularity** is defined by compact localization and is invariant under smooth coordinate changes, preparing a chart-independent regularity notion without yet constructing bundle norms ([`IsLocallyMemLittleBesovAt`](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace/Local/Little.html#Distribution.IsLocallyMemLittleBesovAt)).

### Roadmap coverage

Layer 2 is **done**. All other layers are **partial**.

- **Layer 1** has bundle differential operators, jets and Bochner constructions. Connection expansions of symbols, general metric formal adjoints and the weighted-circle counterexample remain.
- **Layers 3–5** have Euclidean kernels, quantization, composition, adjoints and mapping estimates, now with continuity estimates for expansion remainders. Bundle/density kernels, chart-local quantization and global patching, choice-independent bundle function spaces, joint (s,p) interpolation and manifold averaging remain.
- **Layer 6** has Euclidean parametrices and regularity. The patched bundle parametrix, compact-base Fredholm theorem and adjoint-kernel solvability remain.
- **Layers 7–8** have parameter-symbol and spectral ingredients, and weak/smooth Sunada eigenspace comparisons. Classical powers, the equivariant product index and elliptic-complex Hodge theorem remain, as do the scalar H² realization and covering resolvent/projection comparisons.
- **Layer 9** now includes general admissible Euclidean pullback and its normal-topology continuity, alongside products and pushforward. Manifold/bundle versions and full tensor/product hypocontinuity are not established by this record.

## The frontier

- **Global bundle quantization** — Extend operator coordinate changes to chart maps between open sets, then patch the bundle class with atlas independence and the global principal-symbol exact sequence.
- **Bundle analytic scales** — Construct choice-independent H^(s,p), Besov and Zygmund spaces and their operator mappings. Joint (s,p) interpolation remains part of the Euclidean foundation.
- **Patched parametrix and Fredholm theory** — Use global quantization and bundle mapping estimates to prove compact-base Fredholmness, adjoint-kernel solvability and regularity-independent kernels and index.
- **Classical elliptic powers** — Construct contour powers as classical operators and identify them with spectral powers and their Sobolev domains. This needs the global elliptic realization.
- **Manifold microlocal operations** — Patch wave front sets and admissible pullbacks with explicit bundle coefficients, and establish tensor/product hypocontinuity in the normal topology.

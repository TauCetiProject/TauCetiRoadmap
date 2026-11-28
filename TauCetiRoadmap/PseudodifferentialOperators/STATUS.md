<!--tauceti-status:v1 {"roadmap":"PseudodifferentialOperators","to_sha":"b4f07355dff5247676a8ca6f3ba39d26e14385fb","ts":"2026-11-28T06:58:08Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"symmetric covariant-derivative expansion, general bundle metric adjoints, weighted-circle counterexample","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"bundle/density Schwartz kernel theorem, transpose and proper-support comparisons","state":"partial"},{"id":"Layer 4","remaining":"chart-map quantization changes, global bundle patching, atlas independence and principal-symbol sequence","state":"partial"},{"id":"Layer 5","remaining":"joint (s,p) interpolation, bundle Bessel/Besov/Zygmund comparisons, bundle operator estimates and manifold averaging","state":"partial"},{"id":"Layer 6","remaining":"patched bundle parametrix, compact-base Fredholmness, solvability and index independence","state":"partial"},{"id":"Layer 7","remaining":"classical operator powers, order normalization, equivariant product index and elliptic-complex Hodge theory","state":"partial"},{"id":"Layer 8","remaining":"scalar Laplacian H² realization, normalized H² pullback, resolvent and spectral-projection intertwining","state":"partial"},{"id":"Layer 9","remaining":"manifold/bundle wave front calculus and distribution operations; normal-topology tensor/product hypocontinuity","state":"partial"}],"readme_sha":"1beba27726fd6066fb32d8e4bf4ab512b035dcd25c8d874b8fa6a144672b859b","roadmap":"PseudodifferentialOperators","to_sha":"b4f07355dff5247676a8ca6f3ba39d26e14385fb"}-->
# Status: PseudodifferentialOperators

This file documents the status of the PseudodifferentialOperators roadmap up until `b4f0735` (2026-11-28T06:58:08Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 2’s symbol theory is done, and the Euclidean calculus has distributional elliptic regularity, L^p bounds and general admissible pullback. The other layers remain partial: global bundle quantization, its patched Fredholm theory and classical elliptic powers still have no completed construction established here.

### Named results

- **Hörmander’s pullback theorem** — For smooth maps between Euclidean open sets, WF(u) ∩ N_f = ∅ permits pullback, with the expected cotangent wave front inclusion ([`waveFrontSet_pullback_subset`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/Pullback/SmoothMap.html#Distribution.waveFrontSet_pullback_subset)).
- **Microlocal elliptic regularity for systems** — For compactly spatially supported symbols and v ∈ H^t, WF(Op(a)v) equals WF(v) off the characteristic set ([`vectorWaveFrontSet_toDistribution_quantizeSobolev_sdiff_characteristicSet_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/CharacteristicSet.html#TauCeti.Symbol.vectorWaveFrontSet_toDistribution_quantizeSobolev_sdiff_characteristicSet_eq)).
- **Distributional elliptic regularity** — For properly supported elliptic classical operators of order m on Euclidean space, Pu locally in H^s forces an arbitrary distribution u locally into H^(s+m) ([`IsElliptic.isLocallySobolevAt_of_quantizeDistribution`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/ProperSupport/EllipticRegularity.html#TauCeti.ClassicalSymbol.IsElliptic.isLocallySobolevAt_of_quantizeDistribution)).
- **Order-zero L^p boundedness** — Symbols with estimates uniform in position give bounded operators on L^p for 1 < p < ∞ ([`exists_quantizeUniformOrderZeroLp_of_one_lt`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Lp/CalderonZygmund.html#TauCeti.Symbol.exists_quantizeUniformOrderZeroLp_of_one_lt)).
- **Sunada’s isospectrality theorem** — Almost-conjugate subgroups acting freely by isometries on a closed manifold give quotient Laplacians with isomorphic weak H¹ eigenspaces; smooth eigenspaces are also covered ([`nonempty_linearEquiv_weakEigenspace`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Quotient/Isospectral/Weak.html#Subgroup.AlmostConjugate.nonempty_linearEquiv_weakEigenspace)).

### Notable definitions and infrastructure

- **Continuous admissible pullback** — Fixed closed cones avoiding the normal set give a continuous linear pullback in the normal topology, supporting passage to distributional limits ([`WaveFrontSpace.pullbackCLM`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/NormalTopology/SmoothMap.html#TauCeti.WaveFrontSpace.pullbackCLM)).
- **Continuous symbol calculus** — Composition and adjoint remainders vary continuously in their stated lower-order symbol spaces, with common compact spatial supports ([`Continuous.symbol_sharpRemainder`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Composition/Continuity.html#Continuous.symbol_sharpRemainder), [`Continuous.symbol_adjointRemainder`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Adjoint/Continuity.html#Continuous.symbol_adjointRemainder)).
- **Local little Besov regularity** — A cutoff-based predicate supplies a local regularity condition for the little spaces, ready for localization comparisons ([`IsLocallyMemLittleBesovAt`](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace/Local/Little.html#Distribution.IsLocallyMemLittleBesovAt)).

### Roadmap coverage

Layer 2 is done; all other layers remain partial. Layer 1 still lacks the symmetric covariant-derivative expansion, general bundle metric adjoints and weighted-circle counterexample. Layers 3–4 have Euclidean kernels and calculus, but lack bundle/density kernels, chart-map quantization changes, global patching and the global principal-symbol sequence. Layer 5 lacks joint (s,p) interpolation, bundle Bessel/Besov/Zygmund comparisons, bundle operator estimates and manifold averaging. Layer 6 lacks patched bundle parametrices and their compact-base Fredholm and solvability consequences. Layer 7 has symbol and spectral ingredients, without classical operator powers, the product-index theorem or general elliptic-complex Hodge theory. Layer 8 retains its H²-domain, resolvent and spectral-projection gaps. Layer 9 now includes general Euclidean admissible pullback and composition; manifold and bundle wave front calculus remains missing. The truncated extract does not establish further global milestones.

## The frontier

- **Global bundle calculus** — Construct bundle/density kernels, extend quantization changes to chart maps, then patch compatible full symbols with atlas independence and the principal-symbol exact sequence.
- **Bundle function spaces** — Prove joint interpolation and choice-independent general-p Bessel, Besov and Zygmund norms, then transport local operator bounds and averaging.
- **Patched elliptic theory** — After bundle quantization, assemble properly supported parametrices and prove compact-base Fredholmness, adjoint-kernel solvability conditions and regularity-independent index.
- **Classical elliptic powers** — Integrate the resolvent calculus to construct A^z of order dz and identify it with spectral powers; use these for order normalization and the product index.
- **Global microlocal operations** — Localize admissible pullback and the wave front calculus on manifolds and bundles, with density/coefficient comparisons and the required normal-topology tensor/product hypocontinuity.

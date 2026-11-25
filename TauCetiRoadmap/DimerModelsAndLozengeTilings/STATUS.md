<!--tauceti-status:v1 {"roadmap":"DimerModelsAndLozengeTilings","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833","ts":"2026-11-25T15:07:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"regions, IsTiling, tilingSubgraph_bijOn and row tilings (1.3-1.6)","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"the face property gibbsInvariant_isExtreme and gibbsInvariant_extreme_iff_ergodic (4.6(b))","state":"partial"},{"id":"Layer 5","remaining":"the quasilocal dimer specification and its equivalence with IsDimerGibbs (5.2), the face property 5.3, the lozenge instance 5.4","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"the kernel G_w (9.1), Riemann sums 9.2(b), the determinantal measures 9.3-9.5 and the incomplete beta process 9.7","state":"partial"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"9fbce7b42d4071b3654dd8a993b4ed8e2bad2f0c4f6902d8949063fd0ead9b01","roadmap":"DimerModelsAndLozengeTilings","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833"}-->
# Status: DimerModelsAndLozengeTilings

This file documents the status of the DimerModelsAndLozengeTilings roadmap up until `522d48f` (2026-11-25T15:07:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The abstract Gibbs theory of Layer 4 is done except for the face property, and the incomplete beta kernel of 9.6 is complete. Layer 1 has the lattice and the hexagonal graph but no tilings, and Layer 5 has dimer configurations and dimer Gibbs measures but no dimer specification. Height functions, Kasteleyn theory, slopes and the torus have not begun.

### Named results

- **Invariant events are tail events** — under a proper action of an infinite group on a countable index set, every invariant event agrees almost surely with a tail event ([`exists_measurableSet_tailEvents_ae_eq_of_proper`](https://taucetiproject.org/docs/TauCeti/Probability/Process/Tail/ProperAction.html#TauCeti.Probability.exists_measurableSet_tailEvents_ae_eq_of_proper)).
- **Ergodicity of Bernoulli product measures** — under such an action every i.i.d. product measure is ergodic, by this result and Kolmogorov's zero-one law ([`ergodicSMul_arrowAction_infinitePi_const_of_proper`](https://taucetiproject.org/docs/TauCeti/Probability/Ergodic/Bernoulli/Action.html#TauCeti.Probability.ergodicSMul_arrowAction_infinitePi_const_of_proper)).
- **Compactness of invariant Gibbs measures** — for a quasilocal specification over a finite alphabet, the invariant Gibbs measures form a weakly compact set ([`isCompact_setOf_mem_gibbsInvariant`](https://taucetiproject.org/docs/TauCeti/Probability/Gibbs/Closed.html#TauCeti.Specification.isCompact_setOf_mem_gibbsInvariant)).
- **Path independence of the incomplete beta kernel** — the kernel is the contour integral along any piecewise-C¹ path from `ξ̄` to `ξ` that crosses the real axis on the prescribed side ([`incompleteBetaKernel_eq_inv_mul_intervalIntegral_of_le`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteBeta/PathIndependence.html#TauCeti.incompleteBetaKernel_eq_inv_mul_intervalIntegral_of_le), [`_of_lt`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteBeta/PathIndependence.html#TauCeti.incompleteBetaKernel_eq_inv_mul_intervalIntegral_of_lt)).
- **The row kernel is the discrete sine kernel** — along a row, `K_ξ(v; v + (m,0)) = |ξ|^m sin(πsm)/(πm)`, and on the diagonal the kernel is the slope `s` ([`incompleteBetaKernel_add_row`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteBeta/Kernel.html#TauCeti.incompleteBetaKernel_add_row)).

### Notable definitions and infrastructure

- **Specifications on subshifts.** [`Specification`](https://taucetiproject.org/docs/TauCeti/Probability/Gibbs/Specification.html#TauCeti.Specification) holds consistent proper Markov kernels on a closed invariant set of configurations, where the index set may have several orbits. Gibbs measures are characterised by conditional expectations and are stable under tail reweighting, which is the input the face property needs.
- **Dimer Gibbs measures.** [`IsDimerGibbs`](https://taucetiproject.org/docs/TauCeti/Probability/Gibbs/Dimer.html#SimpleGraph.IsDimerGibbs) states the Gibbs property through cylinder identities alone, on the [subshift of dimer configurations](https://taucetiproject.org/docs/TauCeti/Combinatorics/SimpleGraph/Matching/Dimer.html#SimpleGraph.dimerSubshift) of any locally finite graph. It comes with the Boltzmann completion law and gauge invariance.
- **The hexagonal graph.** [`hexGraph`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Tiling/Lozenge/HexGraph.html#TauCeti.hexGraph) is the 3-regular bipartite graph on triangular faces, with its edges [in bijection with lattice edges](https://taucetiproject.org/docs/TauCeti/Combinatorics/Tiling/Lozenge/HexGraph.html#TauCeti.TriEdge.equivHexGraphEdgeSet). It is the bridge the lozenge instance 5.4 will use.

### Roadmap coverage

Layer 4 is done except for 4.6(b): the face property `gibbsInvariant_isExtreme` and the equivalence of extremality with ergodicity. Sections 4.1–4.5, the tail-reweighting step 4.6(a) and closedness 4.6(c) are proved. Layer 1 is partial: 1.1 and 1.2 are done, but regions, tilings, the matching bijection and row tilings (1.3–1.6) are absent. Layer 5 is partial: 5.1 is done, and 5.2 has the Boltzmann law, `IsDimerGibbs` and gauge invariance, but not the quasilocal specification `γ^w` or its equivalence with `IsDimerGibbs`; 5.3 and 5.4 are untouched. Layer 9 is partial: 9.6 is complete, 9.2(a) is proved, and 9.1 has only its one-variable circle integrals. 9.1's kernel `G_w`, the Riemann sums of 9.2(b), and 9.3–9.5 and 9.7 are absent. Layers 2, 3, 6, 7, 8 and 10 are untouched.

## The frontier

- **The face property (4.6(b))** — show that the invariant Gibbs measures form a face of the invariant probability measures, and hence that extreme is the same as ergodic. Its inputs (invariant events are tail events, tail reweighting) are already proved.
- **The dimer specification (5.2–5.3)** — build `γ^w` as a quasilocal `Specification` on the dimer subshift and prove it equivalent to `IsDimerGibbs`. 5.3's `dimerGibbsInvariant_isExtreme` then follows from 4.6(b).
- **Regions and tilings (1.3–1.6)** — `IsTiling`, the regions, and `tilingSubgraph_bijOn` identifying tilings with perfect matchings. These gate all of Layer 2 and the lozenge instance 5.4.
- **The infinite kernel `G_w` (9.1)** — the zeros of `P̂_w`, the inverse identities and the angle formulas. The inner integrals are done; the README routes 9.1 through the Fourier diagonalisation 8.5, which is untouched.
- **Height functions and Thurston's criterion (Layer 2)** — not started, and waiting on 1.3–1.4.

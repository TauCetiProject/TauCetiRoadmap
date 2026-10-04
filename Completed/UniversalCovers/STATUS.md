<!--tauceti-status:v1 {"roadmap":"UniversalCovers","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9","ts":"2026-09-30T18:26:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Stage 0","state":"done"},{"id":"Stage 1","state":"done"},{"id":"Stage 2","state":"done"},{"id":"Stage 3","state":"done"},{"id":"Stage 4","state":"done"}],"readme_sha":"fbe227b0c3a1c352d6058e216db431c69444affe6b5f2ee0aa352909a751ddb6","roadmap":"UniversalCovers","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9"}-->
# Status: UniversalCovers

This file documents the status of the UniversalCovers roadmap up until `0d3161a` (2026-09-30T18:26:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every stage of the roadmap has its stated targets proved. The universal cover is constructed, subgroups of `π₁(X, x₀)` classify connected covers in both pointed and unpointed form, covers are classified categorically with `π₁(X, x₀)` recovered as the automorphisms of the fibre functor, and the application list (`π₁(S¹)`, `π_n(S¹)`, tori, `K(G, 1)` recognition, `RPⁿ`) is complete. What remains lies beyond the roadmap's text: computing higher homotopy groups, and bases without a universal cover.

### Named results

- **The Galois correspondence for pointed covers** — every pointed connected cover of `(X, x₀)` is isomorphic over `X` to `UniversalCover x₀ / H` for exactly one subgroup `H`, with conjugacy classes for unpointed covers and normal subgroups for regular ones ([`existsUnique_subgroup_homeomorph_subgroupQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/Bijection.html#TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient)).
- **The monodromy equivalence** — monodromy is an equivalence from covering spaces of `X` to functors from the fundamental groupoid to types, and over a path-connected base to `π₁(X, x₀)`-sets ([`monodromyEquivalence`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.html#TauCeti.CoveringSpace.monodromyEquivalence)).
- **The fundamental group as fibre-functor automorphisms** — `π₁(X, x₀)` is the automorphism group of the fibre functor over `x₀` on all covering spaces ([`autFiberFunctorMulEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/FiberFunctor.html#TauCeti.CoveringSpace.autFiberFunctorMulEquiv)), while on finite covers the automorphism group is its profinite completion ([`profiniteCompletionAutFiberFunctorMulEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/ProfiniteFiberFunctor.html#TauCeti.FiniteCoveringSpace.profiniteCompletionAutFiberFunctorMulEquiv)).
- **Existence of a simply connected cover** — a path-connected, locally path-connected space is semilocally simply connected exactly when it admits a simply connected covering space, so the roadmap's standing hypothesis cannot be weakened ([`semilocallySimplyConnectedSpace_iff_exists_isCoveringMap_and_simplyConnectedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/SemilocallySimplyConnected.html#TauCeti.semilocallySimplyConnectedSpace_iff_exists_isCoveringMap_and_simplyConnectedSpace)).
- **The fundamental group of real projective space** — `π₁(RPⁿ) ≅ ℤ/2` for `n ≥ 2` at any basepoint, resting on simple connectivity of higher spheres, with `RP¹` and `RP⁰` handled separately ([`fundamentalGroupMulEquivAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/RealProjective/FundamentalGroup/Basic.html#TauCeti.RealProjectiveSpace.fundamentalGroupMulEquivAt)).

### Notable definitions and infrastructure

- The categories of covering spaces over `X` and their connected and finite subcategories ([`CoveringSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Covering/Category.html#TauCeti.CoveringSpace)), which let the classification be an equivalence of categories and give the fibre functor a home.
- The action of `π₁(X, x)` on each homotopy group `π_n(X, x)` by transport around loops ([`homotopyGroupMulAction`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.html#TauCeti.homotopyGroupMulAction)), acting by automorphisms in positive dimensions, with orbits exactly the free homotopy classes.
- Constancy of fibres over a preconnected base: all fibres of a covering map are in bijection ([`IsCoveringMap.nonempty_fiber_equiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Covering/Clopen.html#IsCoveringMap.nonempty_fiber_equiv)), so covers of connected spaces are surjective and connected covers have a well-defined positive degree.

### Roadmap coverage

All five stages are done. Stage 0 (the port: discreteness of homotopy-class fibres, the based-path construction, the `π₁` action, the deck group) and Stage 1 (`Deck(proj) ≃* π₁(X, x₀)ᵐᵒᵖ`, and the quotient of the universal cover by `π₁` homeomorphic to `X`) are finished. Stage 2 is complete on both routes, the subgroup correspondence with `N(H)/H` deck groups and the monodromy-functor lens, extended to the automorphisms of the fibre functor. Stage 3 (the `π_n` API and `π_n` isomorphisms along covers for `n ≥ 2`) and Stage 4 (`π₁(S¹) ≅ ℤ`, `π_n(S¹) = 0`, tori, `K(G, 1)` recognition, `π₁(RPⁿ)` in every dimension) are done. Beyond the roadmap, the classification also covers bases that are not path-connected. Recent work only consolidates: basic fibre-counting facts and functoriality of deck-group conjugation.

## The frontier

- **Higher homotopy of spheres and `RPⁿ`.** The covering isomorphism gives `π_k(RPⁿ) ≅ π_k(Sⁿ)` for `k ≥ 2`, but nothing here computes `π_n(Sⁿ)`; that needs a degree or Hurewicz argument, and neither appears here.
- **Existence of `K(G, 1)` spaces for an arbitrary group.** Only recognition is proved, with circles and tori as examples; constructing one for a given group rests on realization theory the README places outside this roadmap.
- **Bases without a universal cover.** The standing local hypotheses are shown to be exactly what a simply connected cover requires, so the classification cannot be pushed further as stated; spaces failing them would need a different notion of cover, and nothing here attempts one.

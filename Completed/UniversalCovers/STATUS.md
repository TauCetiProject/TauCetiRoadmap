<!--tauceti-status:v1 {"roadmap":"UniversalCovers","to_sha":"f95cc2fb6429e471556c8677e5c64fe8e4cb7940","ts":"2026-09-07T18:24:19Z"}-->
# Status: UniversalCovers

This file documents the status of the UniversalCovers roadmap up until `f95cc2f` (2026-09-07T18:24:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every stage of the roadmap now has its stated targets proved: the universal
cover is constructed, the correspondence between subgroups of `π₁(X, x₀)` and connected covers is
a bijection in both the pointed and unpointed forms, covers are classified categorically by
fundamental-groupoid actions, and the application list (`π₁(S¹)`, `π_n(S¹)`, tori, `K(G, 1)`,
`RPⁿ`) is complete. What remains lies outside the roadmap's own text: higher homotopy groups
beyond vanishing statements, and the standing local hypotheses on the base, which no result here
dispenses with.

### Named results

- **Simple connectivity of spheres** — the unit sphere of a real normed space of dimension
  greater than two is simply connected, and hence so is `Sⁿ` for `n ≥ 2`
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Sphere/SimplyConnected.html#TauCeti.simplyConnectedSpace_sphere_euclideanSpace>).
- **The fundamental group of real projective space** — `π₁(RPⁿ) ≅ ℤ/2` for `n ≥ 2` at any
  basepoint
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/RealProjective/FundamentalGroup/Basic.html#TauCeti.RealProjectiveSpace.fundamentalGroupMulEquivAt>),
  with `RP¹` infinite cyclic through a homeomorphism with the circle and `RP⁰` trivial, so the
  group is known in every dimension.
- **The Galois correspondence for pointed covers** — every pointed connected cover of `(X, x₀)`
  is isomorphic over `X` to `UniversalCover x₀ / H` for exactly one subgroup `H`
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/Bijection.html#TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient>);
  forgetting basepoints gives a bijection with conjugacy classes, subgroup containment matches
  covering maps between the associated covers, and the cover is regular exactly when `H` is
  normal.
- **The deck group of an intermediate cover** — the deck group of the cover attached to
  `H ≤ π₁(X, x₀)` is `N(H)/H`
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/DeckGroup.html#TauCeti.UniversalCover.deckSubgroupQuotientProjEquiv>),
  and `π₁(X, x₀)/H` for normal `H`.
- **The monodromy equivalence** — over a locally path-connected, semilocally simply connected
  base, monodromy is an equivalence from covering spaces to functors from the fundamental
  groupoid to types
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.html#TauCeti.CoveringSpace.monodromyEquivalence>);
  over a path-connected base it reads as an equivalence with `π₁(X, x₀)`-sets, cutting down to
  connected covers and transitive sets, and the finite covers form a Galois category.

### Notable definitions and infrastructure

- The categories of covering spaces, connected covering spaces and finite covering spaces over
  `X` (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Covering/Category.html#TauCeti.CoveringSpace>),
  full subcategories of `TopCat / X`, which let the classification be an equivalence of categories
  rather than a bijection on isomorphism classes.
- The balanced product of the universal cover with a `π₁(X, x₀)`-set
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Covering/BalancedProduct.html#TauCeti.BalancedProduct.isCoveringMap_proj>),
  which realises an arbitrary action as a cover and so supplies essential surjectivity for
  disconnected covers, where quotients of the universal cover do not suffice.
- Basepoint change for higher homotopy groups
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Homotopy/HomotopyGroup/BasepointChange.html#TauCeti.homotopyGroupMulEquivOfPath>),
  built from a collar construction that shrinks a generalized loop into a smaller cube and runs
  the path around the boundary annulus left over.

### Roadmap coverage

Stages 0 and 1 (the construction, the `π₁` action, the deck group, and
`Deck(proj) ≃* π₁(X, x₀)ᵐᵒᵖ`) were finished earlier and are unchanged. Stage 2 is now complete on
both routes: the existence half, the outstanding gap, closed once the descended projection on
`UniversalCover x₀ / H` was shown to be a covering map, and the suggested alternative lens through
transitive `π₁(X)`-sets and the monodromy functor is built as well. Stage 3 is done, with
basepoint change for `π_n` added to the earlier functoriality and product API. Stage 4 is done in
full: `π₁(S¹) ≅ ℤ`, `π_n(S¹) = 0` for `n ≥ 2`, the fundamental group of a torus, `K(G, 1)`
recognition with circles and tori as examples, and `π₁(RPⁿ)` in every dimension. Beyond the
roadmap, the classification is extended to bases that are not path-connected.

## The frontier

- **Higher homotopy of `RPⁿ` and of spheres.** The covering isomorphism gives
  `π_k(RPⁿ) ≅ π_k(Sⁿ)` for `k ≥ 2`, but nothing here computes `π_n(Sⁿ)`, so no concrete group
  results. That needs a degree or Hurewicz argument, and neither appears here.
- **The fibre functor and its automorphisms.** The finite covers are proved to be a Galois
  category with the fibre over `x₀` as fibre functor, but the automorphism group of that functor
  is not identified. Mathlib's `IsFundamentalGroup`/`toAutMulEquiv` interface is the natural
  target; for infinite `π₁` that automorphism group is not `π₁` itself.
- **Existence of `K(G, 1)` spaces for an arbitrary group.** What is proved is recognition: a
  space with weakly contractible universal cover is a `K(G, 1)`, and covers of aspherical spaces
  are aspherical, with circles and tori as examples. No construction realising a given group as a
  fundamental group is present.
- **The standing local hypotheses.** Path-connectedness of the base has been removed from the
  groupoid-level classification, but local path-connectedness and semilocal simple connectivity
  are assumed throughout, and nothing here addresses bases failing them.

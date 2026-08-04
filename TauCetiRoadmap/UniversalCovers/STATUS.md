<!--tauceti-status:v1 {"roadmap":"UniversalCovers","to_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd","ts":"2026-08-03T18:31:13Z"}-->
# Status: UniversalCovers

This file documents the status of the UniversalCovers roadmap up until `11ef09d` (2026-08-03T18:31:13Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**Stage 0, port the foundations.** Done, all four items. Discreteness of the homotopy-class
fibres holds in a semilocally simply connected, locally path-connected space
(`Path.Homotopic.Quotient.instDiscreteTopology`,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/PathHomotopyDiscreteness.html#Path.Homotopic.Quotient.instDiscreteTopology>),
with the tube machinery it needs. `BasedPath x₀` carries the compact-open topology with a
continuous, open endpoint map, and `UniversalCover x₀`
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Basic.html#TauCeti.UniversalCover>)
is its quotient by endpoint-preserving homotopy, with the sheet decomposition. `proj` is a
covering map onto a path-connected base, the total space is path-connected and simply connected,
and simply connected locally path-connected sources lift uniquely
(`UniversalCover.existsUnique_continuousMap_lifts`). The `π₁(X, x₀)` action is free, faithful and
continuous, and `proj` is a quotient covering map for it
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Action.html#TauCeti.UniversalCover.isQuotientCoveringMap>).
`Deck p` and its subgroup-transferred structure are in place, together with conjugation of deck
groups along an isomorphism over the base (`Deck.conjMulEquiv`).

**Stage 1, close out the universal cover.** Done, with the convention pinned to the opposite
group: `UniversalCover.deckFundamentalGroupEquiv`
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Deck/FundamentalGroup/UniversalCover.html#TauCeti.UniversalCover.deckFundamentalGroupEquiv>)
identifies the deck group of `proj` with `(π₁(X, x₀))ᵐᵒᵖ`, and `UniversalCover.isRegular_proj`
records that the deck action is regular. The presentation of `X` as a quotient of the universal
cover is available through `isQuotientCoveringMap`, and generally a quotient covering map with
preconnected nonempty total space has its acting group as deck group
(`Deck.IsQuotientCoveringMap.deckMulEquiv`), with regularity and quotient covering maps
equivalent for preconnected covers (`Deck.isQuotientCoveringMap_iff_isRegular`).

**Stage 2, lifting criterion and Galois correspondence.** Mostly done; the gap is in the
existence half. The lifting criterion is consumed and restated in subgroup form
(`IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le_subgroup`), and the monodromy layer
is complete: covering maps are injective on `π₁`, monodromy is transitive on fibres of a
path-connected cover, the stabiliser of a lift is the recovered subgroup, the fibre is its coset
space (`IsCoveringMap.fiberEquivQuotientRange`), and the number of sheets is its index. Both
classification theorems are proved: pointed connected covers by the recovered subgroup
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/Pointed.html#TauCeti.IsCoveringMap.exists_homeomorph_comp_eq_iff_range_eq>),
unpointed connected covers by its conjugacy class
(`IsCoveringMap.exists_homeomorph_comp_eq_iff_exists_range_eq_map_conj`), with uniqueness of the
universal cover as a special case, and regularity is characterised by normality of the recovered
subgroup (`IsCoveringMap.isRegular_iff_normal_range`). Basepoint change is handled at the level
of subgroups (`FundamentalGroup.basepointChangeSubgroup`, monotone, normality-preserving) and of
covers (any two lifts recover conjugate subgroups). What is not assembled: `SubgroupQuotient H`
is built, is a quotient covering map from the universal cover, and its descended projection
recovers exactly `H`
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/RecoveredSubgroup.html#TauCeti.UniversalCover.range_mapOfEq_subgroupQuotientProj>),
but there is no statement that `subgroupQuotientProj` is itself a covering map, so the
correspondence is not yet known to be onto. The deck group `N(H)/H` is likewise unproved: the
group theory it needs is there (the normalizer quotient acts freely on the orbit quotient, and
transitively when the normalizer acts transitively; the normal case is identified with `G ⧸ H`),
but it has not been connected to the deck group of the cover attached to `H`. The alternative
Galois-category or monodromy-functor lens is untouched.

**Stage 3, higher homotopy.** Done as stated. The `π_n` API was built here: `GenLoop.map` and
`HomotopyGroup.mapHom` with identity and composition laws, invariance under relative homotopy and
under homeomorphism, binary and indexed products (`HomotopyGroup.piMulEquiv`), the constant and
subsingleton cases, and path-connectedness of cubes and cube boundaries. On top of it, any
covering map induces an isomorphism `π_N(E, e) ≃* π_N(X, p e)` for `N` with at least two elements
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Homotopy/HomotopyGroup/Covering.html#TauCeti.IsCoveringMap.homotopyGroupMulEquiv>),
and injectivity holds in every positive dimension.

**Stage 4, applications.** Partly done. `π_n(S¹) = 0` for `n ≥ 2`
(`AddCircle.subsingleton_homotopyGroup`) and the same for arbitrary indexed products of circles.
`π₁(S¹) ≅ ℤ` holds both for `AddCircle` and, new here, for the complex unit circle
(`Circle.fundamentalGroupMulEquiv`), together with the standard corollaries that it is not simply
connected, not contractible and not homeomorphic to a real topological vector space. The
fundamental group of a torus is `Π i, Multiplicative ℤ`
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Torus/FundamentalGroup.html#TauCeti.AddCircle.piFundamentalGroupMulEquiv>).
`K(G, 1)` spaces are defined via asphericity, and circles and tori are shown to be `K(ℤ, 1)` and
`K(Π i, ℤ, 1)`. `RPⁿ` exists as `Sⁿ` modulo the antipodal action, the projection is a regular
covering map, and its deck group is the two-element group `ℤˣ`; `π₁(RPⁿ)` itself is not proved.

## The frontier

The nearest target is the missing link in Stage 2 (7): show that `subgroupQuotientProj`, the
endpoint projection descended to `UniversalCover x₀ / H`, is a covering map. Everything else about
that cover — the quotient covering map from the universal cover, the distinguished basepoint,
surjectivity, and `range_mapOfEq_subgroupQuotientProj` — is already in place, so this single
statement is what lets the H-quotient be fed to the classification theorems and turns them into a
genuine correspondence.

Next after that, Stage 2 (8)'s deck-group half: `Deck(UniversalCover x₀ / H) ≃* N(H)/H`, and the
normal case `π₁(X, x₀)/H`. The group-theoretic side is finished (free and transitive descended
`N(H)/H` actions on orbit quotients, the normal-case identification, basepoint transport of the
normalizer quotient); what is missing is the transfer to deck transformations, plausibly via
`Deck.IsQuotientCoveringMap.deckMulEquiv` once the previous item makes the H-quotient a cover in
its own right.

`π₁(RPⁿ) ≅ ℤ/2` is blocked only on simple connectivity of `Sⁿ` for `n ≥ 2`, which does not appear
anywhere in this development; with it, the regular antipodal cover and its two-element deck group
already recorded would give the result immediately, and `RPⁿ` would join the `K(G, 1)` examples.
The same gap is the reason the roadmap's `π_n(Tᵏ)` line is complete while its `π₁(RPⁿ)` line is
not.

Longer-range and untouched: the alternative route through transitive `π₁(X)`-sets, the monodromy
functor and the Galois-category abstraction, which the roadmap suggests as a second lens on Stage
2 (8). Also unaddressed is any statement about covers of spaces that are not path-connected, where
the standing hypotheses of the whole development exclude the case rather than handle it.

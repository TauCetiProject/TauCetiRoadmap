# Progress log: UniversalCovers

An append-only record of what landed on the UniversalCovers roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"1099f3b5a435778fc581f977cf605c10292c7bf3","prs":[46,57,82,85,88,93,98,102,256,272,287,292,298,397,402,436,442,448,454,461,477,498,504,510,529,533,553,572,580,587,600,614,635,664,719,749,765,871,960,981,990,993,1003,1012,1019,1029,1104,1189,1208,1219,1311,1400,1468,1471,1581,1594,1600,1603,1604,1630,1679,1747,1797],"roadmap":"UniversalCovers","to_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd"}-->
## UniversalCovers: 2026-06-04 to 2026-08-03 (`1099f3b` to `11ef09d`)

The universal cover is now constructed here rather than assumed. Based paths out of `x₀`,
modulo endpoint-preserving homotopy, carry a quotient topology whose endpoint projection is a
covering map, with path-connected and simply connected total space and the expected unique
lifting property, under the roadmap's standing hypotheses on the base (TauCeti#993,
TauCeti#1104, TauCeti#1208,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Covering.html#TauCeti.UniversalCover.isCoveringMap>);
the discreteness of homotopy-class fibres that makes this work came first (TauCeti#990). The
convention question the roadmap flagged resolved against the naive form: with `π₁(X, x₀)` acting
on the left by prepending inverse loops, the deck group of the projection is the *opposite*
fundamental group (TauCeti#1594,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Deck/FundamentalGroup/UniversalCover.html#TauCeti.UniversalCover.deckFundamentalGroupEquiv>).

The classification arrived in both forms. Pointed connected covers of `(X, x₀)` are classified by
the subgroup of `π₁(X, x₀)` they recover (TauCeti#1581,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/Pointed.html#TauCeti.IsCoveringMap.exists_homeomorph_comp_eq_iff_range_eq>),
unpointed ones by its conjugacy class (TauCeti#1600), and a cover is regular exactly when that
subgroup is normal (TauCeti#1630). The existence half is less finished than that sounds: the
quotient `UniversalCover x₀ / H` is built and recovers exactly `H` (TauCeti#1603, TauCeti#1797),
but nothing here records its descended projection as a covering map, and the deck group `N(H)/H`
is present only as group-theoretic scaffolding (TauCeti#600, TauCeti#749).

Higher homotopy came with it: covering maps induce isomorphisms on `π_n` for `n ≥ 2`
(TauCeti#1189), over functoriality, product and invariance API for `π_n` written from scratch
(TauCeti#765, TauCeti#1400). That gives `π_n(S¹) = 0` for `n ≥ 2`, and circles and tori as
`K(G, 1)` spaces (TauCeti#1219, TauCeti#1468). Real projective space arrived as the antipodal
quotient with a two-element deck group (TauCeti#1679, TauCeti#1747), but `π₁(RPⁿ)` is not
established: that needs `Sⁿ` simply connected, which is not here. A third of this window's pull
requests added no new declarations at all.

<!--tauceti-progress:v1 {"from_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd","prs":[1999,2086,2218,2494,2528,2531,2642,2776,2954,3057,3121,3215,3231,3610,3898,3906,3919,4039,4309,4344,4439,4531,4602,4621,4631,4962,5059,5192,5220,5462,5530,5571,5658,5671],"roadmap":"UniversalCovers","to_sha":"f95cc2fb6429e471556c8677e5c64fe8e4cb7940"}-->
## UniversalCovers: 2026-08-03 to 2026-09-07 (`11ef09d` to `f95cc2f`)

The gap the previous window flagged is closed: the unit sphere of a real normed space of
dimension greater than two is simply connected
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Sphere/SimplyConnected.html#TauCeti.simplyConnectedSpace_sphere>,
TauCeti#3906), proved by pushing an arbitrary loop off some point of the sphere and contracting
the punctured sphere onto the antipode of the point it misses. With the antipodal cover already
recorded, this gives `π₁(RPⁿ) ≅ ℤ/2` for `n ≥ 2`
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/RealProjective/FundamentalGroup/Basic.html#TauCeti.RealProjectiveSpace.fundamentalGroupMulEquivAt>).
The small dimensions were filled in separately, `RP¹` by a homeomorphism with the circle and
`RP⁰` as a point, so the fundamental group of real projective space is now known in every
dimension.

The subgroup correspondence became a genuine bijection. The missing link was that the endpoint
projection descended to `UniversalCover x₀ / H` is itself a covering map; with it, every pointed
connected cover of `(X, x₀)` is realised by exactly one subgroup of `π₁(X, x₀)`
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/Bijection.html#TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient>),
unpointed ones by conjugacy classes, and one such cover covers another exactly when the
subgroups are nested. The deck group of the cover attached to `H` is the normalizer quotient
`N(H)/H`, and `π₁(X, x₀)/H` when `H` is normal (TauCeti#2218).

The same classification arrived in categorical form. Covering spaces of `X` are a category
equivalent to functors from the fundamental groupoid to types, and to `π₁(X, x₀)`-sets, cutting
down to connected covers and transitive sets; the finite covers are a Galois category with the
fibre over `x₀` as fibre functor (TauCeti#4039, TauCeti#4531). The groupoid form drops
path-connectedness of the base. Underneath sit basepoint change for higher homotopy groups by a
collar construction, balanced products, and `K(G, 1)` recognition criteria.

<!--tauceti-progress:v1 {"from_sha":"f95cc2fb6429e471556c8677e5c64fe8e4cb7940","prs":[6023,6047,6054,6151,6185,6280,6488,6496,6540,6620,6875,7117,8002,8073,9118,9119,9358,9562,9607,9665],"roadmap":"UniversalCovers","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
## UniversalCovers: 2026-09-07 to 2026-09-30 (`f95cc2f` to `e440f4e`)

The previous report's open question about the fibre functor is settled. Over a base satisfying the roadmap's standing hypotheses, `π₁(X, x₀)` is the full automorphism group of the functor taking every covering space to its fibre over `x₀` ([`autFiberFunctorMulEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/FiberFunctor.html#TauCeti.CoveringSpace.autFiberFunctorMulEquiv)), obtained by transporting Tannaka duality for `G`-sets ([`autForgetActionMulEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/Action/Tannaka.html#TauCeti.autForgetActionMulEquiv)) along the existing classification. Restricted to finite covers, the automorphism group is instead the profinite completion of `π₁(X, x₀)` ([`profiniteCompletionAutFiberFunctorMulEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Classification/ProfiniteFiberFunctor.html#TauCeti.FiniteCoveringSpace.profiniteCompletionAutFiberFunctorMulEquiv)), which is therefore a fundamental group of the Galois category of finite covers in Mathlib's sense (TauCeti#6185).

The standing hypotheses are now shown to be the right ones: a path-connected, locally path-connected space is semilocally simply connected exactly when it has a simply connected covering space ([`semilocallySimplyConnectedSpace_iff_exists_isCoveringMap_and_simplyConnectedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/SemilocallySimplyConnected.html#TauCeti.semilocallySimplyConnectedSpace_iff_exists_isCoveringMap_and_simplyConnectedSpace)), with a variant characterising both local conditions at once. The corollary the roadmap attached to Stage 1 is recorded too: the universal cover modulo `π₁(X, x₀)` is homeomorphic to `X` ([`orbitQuotientHomeomorph`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/UniversalCover/Quotient.html#TauCeti.UniversalCover.orbitQuotientHomeomorph)), and universal covers at different basepoints are identified along paths.

On the higher-homotopy side, `π₁(X, x)` acts on each `π_n(X, x)` by automorphisms, with orbits the free homotopy classes ([`homotopyGroup_mem_orbit_iff_exists_homotopyAlong`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.html#TauCeti.homotopyGroup_mem_orbit_iff_exists_homotopyAlong)), and a loop-space shift identifies the homotopy groups of iterated loop spaces with higher homotopy groups of the space ([`loopSpaceMulEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.html#HomotopyGroup.loopSpaceMulEquiv)). The rest reworked foundations: discreteness of homotopy-class fibres now rests on tube neighbourhoods showing that homotopy classes of paths are open in the compact-open topology, and a large reorganisation of the deck-transformation files added nothing new among the declarations the facts record, though that list is truncated.

<!--tauceti-progress:v1 {"from_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","prs":[10219,10245,10253],"roadmap":"UniversalCovers","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9"}-->
## UniversalCovers: 2026-09-30 to 2026-09-30 (`e440f4e` to `0d3161a`)

A quiet window of consolidation on a roadmap that is already complete. The one new piece of mathematics is a basic fact about covering maps: over a preconnected base all fibres are in bijection ([`IsCoveringMap.nonempty_fiber_equiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Covering/Clopen.html#IsCoveringMap.nonempty_fiber_equiv)), proved by showing that the set of points whose fibre has a given cardinality is clopen, so a covering map from a nonempty space onto a preconnected one is surjective ([`IsCoveringMap.surjective`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Covering/Clopen.html#IsCoveringMap.surjective)). The classification files now use it to see that connected covers have nonempty fibres and positive degree.

The rest tidied the deck-transformation API: conjugating deck groups and their normalizer quotients along homeomorphisms over the base now respects identities and composition.

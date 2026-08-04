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

# Progress log: ConformalMapping

An append-only record of what landed on the ConformalMapping roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"160fbce2172ddb97cbbcc664bd773416f6971c6e","prs":[541,577,578,592,597,673,701,704,752,753,784,787,865,881,902,903,945,978,980,1015,1021,1091,1107,1112,1150,1179,1188,1209,1210,1224,1226,1243,1258,1267,1319,1326,1335,1339,1343,1346,1347,1355,1377,1436,1446,1487,1497,1500,1502,1512,1517,1519,1520,1523,1536,1555,1558,1565,1575,1577,1580,1582,1583,1585,1587,1601,1609,1610,1612,1616,1624,1629,1633,1634,1643],"roadmap":"ConformalMapping","to_sha":"6919462d4134c7850ded5c71cc7a2e8a9054a2d0"}-->
## ConformalMapping: 2026-06-29 to 2026-08-01 (`160fbce` to `6919462`)

The Riemann mapping theorem landed: every nonempty, simply connected, open proper subset of `ℂ`
admits a holomorphic bijection onto the unit disc (TauCeti#1346,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping>),
with a normalized form sending a chosen base point to `0` with positive real derivative, unique as
such (TauCeti#1500), uniqueness up to a disc automorphism (TauCeti#1335), and the corollary that any
two simply connected proper domains are conformally equivalent (TauCeti#1519). It was assembled in
the standard order rather than imported: the family of pointed disc injections is nonempty by the
square-root trick and normal by Montel's selection theorem (TauCeti#1226,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Montel.html#TauCeti.montel>),
the extremal problem has a maximizer (TauCeti#1326), and the maximizer omits nothing (TauCeti#1343).

The layers under and over the summit came with it. Under: Rouché, Hurwitz, Morera as named
theorems, Vitali, the open-mapping degree (TauCeti#1209, TauCeti#1520, TauCeti#1585); Schwarz–Pick
in contraction, infinitesimal and rigidity forms, the Poincaré disc as a proper geodesic space whose
geodesics through the origin are exactly the Euclidean diameters, and `Aut(𝔻)` as a transitively
acting group (TauCeti#752, TauCeti#1512, TauCeti#1502). Over: Schwarz reflection across the real
axis (TauCeti#1091,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric>),
then across a line, an analytic arc and a circle, with Painlevé removability and injectivity of the
reflected map (TauCeti#1243, TauCeti#1377, TauCeti#1565), and the monodromy theorem (TauCeti#1558).

Carathéodory is the open layer, and only its converse direction is proved: a conformal map with an
injective continuous extension makes its domain a Jordan domain (TauCeti#1580), together with the
"only if" half of the continuity theorem (TauCeti#1587). The extension itself is not established;
what landed towards it is machinery — cluster sets, uniformly locally connected boundaries, the area
formula (TauCeti#1555, TauCeti#1624, TauCeti#1583). Schwarz–Christoffel is untouched. Per the
roadmap, the L0–L3 material is reproved from Mathlib's, and its consumers refactored, if the
Mathlib proof lands.

<!--tauceti-progress:v1 {"from_sha":"6919462d4134c7850ded5c71cc7a2e8a9054a2d0","prs":[1636,1642,1646,1648,1655,1657,1667,1668,1673,1675,1687,1701,1732,1749,1750,1760,1765,1768,1784,1788,1798,1800,1812,1828,1832,1835,1837,1851,1855,1858,1884,1948,1950,1966,1969,1970,1973,1979,1981,1983,1988,2001,2002,2008,2018,2019,2028,2046,2047,2059,2066,2068,2076,2089,2090,2100,2110,2112,2113,2125,2126,2157,2160,2205,2215,2257,2260,2284,2314,2331,2354,2366,2425,2430,2458,2509,2527,2535],"roadmap":"ConformalMapping","to_sha":"03fcee5c26082d455072bee2d3044ce5bec908cd"}-->
## ConformalMapping: 2026-08-01 to 2026-08-10 (`6919462` to `03fcee5`)

The window's main effort was the length–area method, the tool the open half of Carathéodory's
continuity theorem needs. The length–area inequality bounds the weighted total of the image lengths
of the circles about a point by the area of the image
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/LengthArea.html#TauCeti.lintegral_circleImageLength_sq_div_le_lintegral_enorm_deriv_sq>),
and Wolff's lemma extracts from it one short circle at some radius between any two (TauCeti#1636,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/LengthArea.html#TauCeti.exists_circleImageLength_sq_lt>).
On it rests a chain about circular crosscuts of a disc: one of finite image length has a limit at
each end, its closed image meets the boundary of the image domain in exactly two points, and, when
that boundary is a Jordan curve, arbitrarily short image crosscuts lie on small Jordan curves
(TauCeti#2527,
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Crosscut/SmallJordanCurve.html#TauCeti.exists_isJordanCurve_superset_closure_image_ball_inter_sphere_diam_le>).
The theorem all of this is for — that the Riemann map of a Jordan domain extends continuously to the
closure — has not landed.

The Poincaré disc became a geometry rather than a metric space. Its distance acquired closed forms,
and it is the least hyperbolic length of a path joining its two arguments
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Hyperbolic/Length.html#TauCeti.hyperbolicDist_le_hyperbolicLength>).
Its geodesics are exactly the Euclidean diameters and the arcs of circles meeting the unit circle at
right angles
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Poincare/OrthogonalCircle.html#TauCeti.PoincareDisc.exists_range_coe_toUnitDisc_geodesicLine_eq_iff>),
and its isometries exactly the disc automorphisms and their conjugates
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Poincare/Isometry/Classification.html#TauCeti.PoincareDisc.isometry_iff_exists_eq_unitDiscStandardAutomorphismIsometryEquiv_or_comp_star>);
a holomorphic self-map is nonexpanding, and is either a strict contraction between every pair of
distinct points or one of those automorphisms.

Older layers were re-cut. Rouché and the argument principle gained winding-number forms for
null-homologous cycles, including the dog-on-a-leash statement
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Rouche.html#TauCeti.rouche_symm_windingNumber_comp>);
Montel became an equivalence, local boundedness being the same as relative compactness in `C(Ω, E)`
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Montel/Precompact.html#TauCeti.isCompact_closure_range_iff_isLocallyBoundedOn>);
and analytic continuation acquired predicates for continuing along a path and inside a domain
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Continuation/Basic.html#TauCeti.ContinuesInside>),
closed under sums, products and derivatives, with concatenation, reparametrisation and monodromy
along free homotopies.

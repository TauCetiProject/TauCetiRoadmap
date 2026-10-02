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

<!--tauceti-progress:v1 {"from_sha":"03fcee5c26082d455072bee2d3044ce5bec908cd","prs":[2092,2660,2679,2698,3131,3147,3155,3156,3408,3426,3813,3855,3957,4002,4087,4151,4168,4576,4638,4701,4778,5003,5403,5497,5599,5653,5866,5895,6206,6226],"roadmap":"ConformalMapping","to_sha":"ae69ef93ae1b853b89b7e0966d5895c901e370f2"}-->
## ConformalMapping: 2026-08-10 to 2026-09-10 (`03fcee5` to `ae69ef9`)

[Carathéodory’s boundary correspondence for Jordan domains](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.html#TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier) is now complete: a Riemann map from the disc onto a bounded domain with Jordan-curve boundary extends to a homeomorphism of the closures. The forward [continuity theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Caratheodory.html#TauCeti.exists_continuousOn_closedBall_eqOn_of_isJordanCurve_frontier) was joined to boundary injectivity through locally preconnected approach regions; the plane-separation input includes [Janiszewski’s theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/PlaneSeparation/Basic.html#TauCeti.janiszewski).

Schwarz–Christoffel theory has begun in earnest. The [integrand](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Integrand.html#TauCeti.schwarzChristoffelIntegrand) is holomorphic and nonvanishing on the upper half-plane, its [normalized primitive](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Primitive.html#TauCeti.schwarzChristoffelPrimitive) is conformal there, and the [canonical boundary map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Boundary.html#TauCeti.schwarzChristoffelBoundary) is continuous at prevertices of total exponent greater than `-1`. Between prevertices it traces injective straight edges with the expected change of angle, and the integrand now has its leading prevertex asymptotic. There is not yet a theorem identifying the primitive globally with a prescribed polygon.

Analytic continuation was also connected to the étalé space of holomorphic germs: [continuation along a path is equivalent to a continuous germ lift](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Continuation/Etale.html#TauCeti.isAnalyticContinuationAlong_iff_continuousOn_germPoint), and [continuation inside a simply connected domain is path-independent](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/GlobalBranch.html#TauCeti.ContinuesInside.eventuallyEq_at_one).

<!--tauceti-progress:v1 {"from_sha":"ae69ef93ae1b853b89b7e0966d5895c901e370f2","prs":[6217,6300,6368,6403,6551,6595,6610,6614,6617,6747,6890,6902,6904,6913,6923,7069,7092,7147,7201,7290,7302,7322,7370,7462,7523,7805,7859,7866,7898,7900,7901,7906,8009,8068,8127,8286,8436,8487,8512,8534,8622,8718,8928,9048,9107,9115,9170,9181,9198,9202,9348,9367,9377,9406,9409,9420,9563,9687,9738,9753,9872],"roadmap":"ConformalMapping","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057"}-->
## ConformalMapping: 2026-09-10 to 2026-09-30 (`ae69ef9` to `dec7a58`)

[The Schwarz–Christoffel theorem for bounded polygonal Jordan domains](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier) landed: if a bounded simply connected domain has a Jordan-curve frontier that is straight away from finitely many corners, each of opening in `(0, 2π)`, then an affine image of the Schwarz–Christoffel primitive maps the upper half-plane onto it, sending real prevertices to the vertices (TauCeti#8718). Reentrant corners are allowed. The proof runs through [Carathéodory on the closed upper half-plane](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/UpperHalfPlane.html#TauCeti.exists_continuousOn_bijOn_upperHalfPlaneSet_of_isJordanCurve_frontier), reflection of the pre-Schwarzian `f''/f'` across straight edges, its residue `β − 1` at each corner, and [rigidity of the pre-Schwarzian](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/PreSchwarzian.html#TauCeti.exists_eqOn_const_mul_add_iff_logDeriv_deriv_eqOn), which together give the [Schwarz–Christoffel formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PolygonalDomain.html#TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_domain). Prevertices can be [normalized](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/ParameterNormalization.html#TauCeti.exists_bijOn_normalized_schwarzChristoffelPrimitive_of_isJordanCurve_frontier) so that one sits at `0` and another at distance `1`.

The converse was also proved: for chosen prevertices and exponents, when is the primitive univalent? It maps the upper half-plane [bijectively onto the convex polygon](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Polygon/Mapping.html#TauCeti.bijOn_schwarzChristoffelPrimitive_interior_closedConvexHull) under the classical convex hypotheses. More generally, it maps [onto the filled interior](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/FilledInterior.html#TauCeti.bijOn_schwarzChristoffelPrimitive_filledHull_sdiff) whenever its compactified boundary is simple, and for nonconvex polygons [finite vertex-height checks](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Polygon/Nonconvex/Mapping.html#TauCeti.bijOn_schwarzChristoffelPrimitive_filledHull_sdiff_of_vertex_separation_of_vertex_heights) certify that simplicity. The route goes through [a covering-map argument](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Covering.html#TauCeti.isCoveringMapOn_schwarzChristoffelPrimitive), plus plane topology such as the fact that [a simple arc does not separate the plane](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/PlaneSeparation/JordanCurve.html#Path.isConnected_compl_range_of_injective). Nonconvex polygons without such certificates, and polygons with a vertex at infinity, remain open.

The rest was upkeep: hyperbolic length and path-perturbation stability for analytic continuation were reworked, and partial fractions with prescribed residues were added.

<!--tauceti-progress:v1 {"from_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057","prs":[9751,9984,10014,10019,10156,10385,10771,10772],"roadmap":"ConformalMapping","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d"}-->
## ConformalMapping: 2026-09-30 to 2026-10-02 (`dec7a58` to `d449639`)

Schwarz–Christoffel maps now have a uniqueness theorem: [three prevertices determine a Schwarz–Christoffel representation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PrevertexUniqueness.html#TauCeti.eq_and_eqOn_of_bijOn_schwarzChristoffelPrimitive). If two representations of the same bounded polygonal Jordan domain send their prevertices to the same vertices and agree at three prevertices, they have the same prevertices and are the same map (TauCeti#10014). Underneath is a fact about any two conformal maps of the upper half-plane onto a Jordan domain: their [boundary correspondence is a Möbius transformation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/CrossRatio.html#TauCeti.exists_sub_I_div_add_I_eq_unitDiscStandardAutomorphismFormula_of_tendsto). So [cross-ratios of prevertices are invariant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PrevertexUniqueness.html#TauCeti.crossRatio_eq_of_bijOn_schwarzChristoffelPrimitive), and [three boundary values pin the map down](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/CrossRatio.html#TauCeti.eqOn_upperHalfPlaneSet_of_tendsto_of_bijOn). The forward theorem also gained a [disc form](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Disc.html#TauCeti.exists_bijOn_const_mul_schwarzChristoffelDiscPrimitive_add_of_bijOn), with prevertices on the unit circle, and the [angle sum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/JordanPolygon.html#TauCeti.exponent_sum_eq_neg_two_of_isJordanCurve_frontier): the turning exponents of a bounded polygonal Jordan domain sum to −2.

Work on polygons with a vertex at infinity started from the map side. When the total exponent is at least −1, the outer edges have infinite length, and the [boundary of the primitive is a chain of finite sides closed off by two infinite rays](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/Infinity/Ray.html#TauCeti.range_schwarzChristoffelBoundary_of_neg_one_le_sum). That identifies the chain only. It does not show the chain is simple, or that the primitive maps onto the region it bounds, so the forward theorem for unbounded polygons is still open.

The supporting work was mostly plane topology and contour integration. [Holomorphic functions have primitives on open sets whose complement has no bounded component](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Primitive.html#TauCeti.Contour.isExactOn_of_filledHull_subset), which gives holomorphic logarithms and roots there. [A Jordan curve with a straight piece bounds a Jordan domain](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Domain.html#TauCeti.IsJordanCurve.isJordanDomain_filledHull_sdiff_of_locally_eq_line). There are also separation lemmas for the closing sides of nonconvex polygons.

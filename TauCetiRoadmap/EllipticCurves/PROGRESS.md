# Progress log: EllipticCurves

An append-only record of what landed on the EllipticCurves roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"d61e56dfdaf58eb7d50f6d2df92611b30a312ca8","prs":[2246,2248,2254,2256,2259,2268,2271,2285,2287,2293,2296,2307,2323,2328,2344,2346,2350,2353,2364,2381,2403,2409,2421,2424,2434,2436,2440,2449,2465,2474,2479,2486,2495,2536,2561,2565,2572,2575,2583,2592,2593,2609,2643,2645,2661,2674,2686,2696,2697,2714,2724,2727,2755,2769,2772,2782,2795,2808],"roadmap":"EllipticCurves","to_sha":"0c1efce3abbc827ff6d7534077387f04adf9b66c"}-->
## EllipticCurves: 2026-08-07 to 2026-08-11 (`d61e56d` to `0c1efce`)

Layer 0 opened. The coordinate ring of an elliptic curve is now a
[Dedekind domain](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/CoordinateRing.html#TauCeti.WeierstrassCurve.Affine.isDedekindDomain_coordinateRing),
the [integrally closed](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/CoordinateRing.html#TauCeti.WeierstrassCurve.Affine.isIntegrallyClosed_coordinateRing)
half being the normality input the induced map on points of an isogeny wants, and the function
field is a [quadratic extension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Finrank.html#WeierstrassCurve.Affine.finrank_functionField)
of the rational function field `K(x)`. On that base sit both halves of the point–place dictionary:
the [place at infinity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/InfinityPlace.html#WeierstrassCurve.Affine.infinityPlace),
where `x` has a double pole, `y` a triple pole and [`x / y` is a uniformiser](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/InfinityPlace.html#WeierstrassCurve.Affine.infinityPlace.isUniformizer_X_div_mk_Y),
and the [place of an affine point](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Place.html#TauCeti.WeierstrassCurve.Affine.CoordinateRing.pointPlace),
injective in the point and of [degree one](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Place.html#TauCeti.WeierstrassCurve.Affine.CoordinateRing.pointPlace.finrank_residueField_eq_one).
Divisors, the fundamental identity, and surjectivity of `toClass` are not there yet.

The [isogeny structure](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.html#TauCeti.Isogeny)
was seeded verbatim — a coordinate-ring pullback with its integrality condition — with its
injectivity and [unique extension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/FunctionField.html#TauCeti.Isogeny.fieldPullback)
to the function field. Degree, finiteness and Frobenius are absent, though the field theory the
last of them wants, [`[K(W) : K(W)^q] = q`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FrobeniusTower.html#TauCeti.WeierstrassCurve.Affine.finrank_fieldRange_frobeniusAlgHom),
landed alongside.

Quadratic twists are close to complete at the level of equations: the twist by parameters `(t, n)`
with the transformation of every invariant, the [twist by a separable quadratic extension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.html#WeierstrassCurve.quadraticTwist)
with `j` unchanged, the change of variables trivialising it over `L`, and the cocycle that change
carries, which is the automorphism `[-1]`. Out of those come the non-isomorphy over `K` and a
[classification of the forms of `E` split by `L`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.html#WeierstrassCurve.exists_smul_eq_or_exists_smul_eq_quadraticTwist)
when `j ∉ {0, 1728}`, with the matching computation [`Aut(E) = {±1}`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Aut.html#WeierstrassCurve.autGroupMulEquiv).
Elsewhere the `S`-integers of a Dedekind domain were built out to their class group and their unit
group (TauCeti#2645, TauCeti#2727), Nagell–Lutz-style denominator bounds appeared, and the points
of a Weierstrass curve over a finite field were shown to be finite in number.

<!--tauceti-progress:v1 {"from_sha":"0c1efce3abbc827ff6d7534077387f04adf9b66c","prs":[2790,2810,2834,2855,2860,2863,2878,2886,2900,2903,2915,2926,2928,2990,3075,3100,3124,3133,3138,3146,3178,3185,3188,3201,3210,3212,3218,3223,3226,3228,3237,3245,3253,3268,3270,3276,3278,3284,3295,3297,3304,3306,3313,3318,3329,3333,3339,3341,3344,3347,3349,3355,3361,3362,3364,3369,3385,3392,3403,3404,3405,3406,3435,3453,3455,3579,3713,3845,3861,3862,3863,3864,3872,3897,3953,3987,3990,3997,4010,4012,4014,4017,4027,4040,4084,4086,4088,4132,4160,4187,4194,4259,4261,4264,4346,4348,4358,4367,4380,4381,4383,4384,4395,4424,4437,4448,4453,4457,4473,4519,4566,4574,4597,4604,4608,4610,4629,4645,4651,4678,4716,4726,4728,4729,4730,4731,4736,4737,4738,4741,4745,4748,4751,4803,4805,4807,4813,4816,4818,4819,4828,4830,4832,4839,4842,4845,4857,4860,4864,4867,4868,4871,4882,4886,4888,4889,4890,4892,4899,4912,4929,4932,4966,4968,4972,4975,4980,4983,5013,5022,5045,5058,5061,5094,5097,5098,5109,5123],"roadmap":"EllipticCurves","to_sha":"f5c212ce5e63da2f726a1ecac5169722f0807981"}-->
## EllipticCurves: 2026-08-11 to 2026-08-30 (`0c1efce` to `f5c212c`)

The [Mordell–Weil theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point_of_numberField) has landed: the rational points of an elliptic curve over a number field form a finitely generated group. Its two halves are present in recognizable form—the [weak Mordell–Weil theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/WeakMordellWeil.html#WeierstrassCurve.Affine.finiteIndex_range_nsmulAddMonoidHom_two) proves finiteness modulo doubling, while the naïve height satisfies an [approximate parallelogram law](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/NaiveHeight.html#WeierstrassCurve.Affine.approx_parallelogram_law) and [Northcott finiteness](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/NaiveHeight.html#WeierstrassCurve.Affine.finite_naiveHeight_le). The same development supplies explicit 2-descent local conditions and a [Selmer-style rank bound](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.html#WeierstrassCurve.Affine.pow_rank_le_card_of_range_μ_le), but not the cohomological Selmer and Sha theory of Layer 7.

The isogeny foundation now carries positive multiplicative degree, separable and inseparable degrees, Frobenius and iterated relative Frobenius. In particular, the [factorisation theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Factorisation.html#TauCeti.Isogeny.existsUnique_comp_eq_iff_fieldRange_le) characterises factorisation by containment of pulled-back function fields, and the [relative Frobenius has degree `p`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/RelativeFrobenius.html#TauCeti.Isogeny.degree_relativeFrobeniusIsogeny). Division-polynomial pullbacks for multiplication by an integer have begun, but the hom-group, quadratic degree form, dual isogeny and Vélu quotients remain absent.

At the foundation, rational points now give both the [degree-one places](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/PointPlace.html#WeierstrassCurve.Affine.pointEquivDegreeOnePlace) and the [entire affine ideal class group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/ToClass.html#WeierstrassCurve.Affine.Point.toClassEquiv), and [translations act faithfully](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Translation.html#WeierstrassCurve.Affine.translationHom_injective) on the function field. Divisor calculus is still missing, as are the Weil pairing and the Hasse bound.

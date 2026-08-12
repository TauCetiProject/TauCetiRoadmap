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

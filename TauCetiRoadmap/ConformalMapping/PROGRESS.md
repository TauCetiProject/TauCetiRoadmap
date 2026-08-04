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
roadmap's own coordination clause, the L0–L3 material is a shim to be retired once the Mathlib proof
lands.

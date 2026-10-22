<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"f91b6396a35d847a87a0d37519325918356bc0fc","ts":"2026-10-21T20:08:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"}],"readme_sha":"7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795","roadmap":"AdicSpaces","to_sha":"f91b6396a35d847a87a0d37519325918356bc0fc"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `f91b639` (2026-10-21T20:08:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The recorded milestones of all seven layers are complete, including the adic Fargues–Fontaine curve for `E = ℚ_p`. The previously partial disc geometry and interval-ring algebra now have their closing theorems; no layer remains recorded as partial or untouched.

### Named results

- **The adic Fargues–Fontaine curve** — [Sheafiness of 𝒪_𝒴](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Adic.html#TauCeti.FarguesFontaine.isSheaf_spaYPresheaf) removes the last hypothesis in the existing quotient construction, giving `𝒳 = 𝒴 / φ^ℤ` as an adic space over a complete rank-one nonarchimedean perfect field of characteristic `p`, without algebraic closedness.

- **Kedlaya’s strong noetherianness theorem** — [Restricted series over an interval ring are noetherian](https://taucetiproject.org/docs/TauCeti/RingTheory/WittVector/IntervalRing/StronglyNoetherian.html#TauCeti.WittVector.isNoetherianRing_isRestricted_subring_intervalRing) in finitely many variables at arbitrary positive polyradii, for closed intervals inside `(0,∞)`, supplying strong noetherianness of the affinoid chart rings.

- **Wedhorn’s five-type classification** — [Every point of the closed unit disc](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Classification.html#TauCeti.ValuationSpectrum.exists_eq_classicalPoint_or_discPoint_or_discPointAbove_or_discPointBelow_or_nestedDiscPoint) over an algebraically closed complete nonarchimedean field is classical, a Gauss-disc point, a nested-disc point, or a rank-two neighbour of a Gauss point, exhausting Example 7.57.

- **Rational subdomains of the closed disc** — [Every rational subset](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/PolynomialDomain.html#TauCeti.ValuationSpectrum.exists_finset_eq_iUnion_holedDisc_of_mem_spaRationalFamily) over an algebraically closed nontrivially valued complete nonarchimedean field is a finite union of closed discs with finitely many open discs removed.

### Notable definitions and infrastructure

- **General topological localisation** — [Wedhorn’s localisation topology](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Basic.html#TauCeti.Huber.PairOfDefinition.locTopology) supplies rational coordinate rings for Huber rings, including the non-Tate ring `A_inf` used to construct the curve.

- **Gluing morphisms** — [Compatible local morphisms out of a sheafy pre-adic space glue uniquely](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/GlueMorphisms.html#TauCeti.PreAdicSpace.glueMorphisms), allowing maps to be assembled on an open cover while retaining the stalk valuations.

### Roadmap coverage

Layers 0 and 1 are done: topological algebra, Tate algebras, and valuation spectra supply the foundations. Layers 3–5 are done: rational localisation and the structure presheaf, all-degree augmented Čech acyclicity for rational covers over strongly noetherian Tate rings, [strongly noetherian sheafiness](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.html#TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian), [stably uniform sheafiness](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Rational/StableUniform.html#TauCeti.Huber.isSheafyRing_of_isStablyUniform), and elementary geometry with gluing and the disc examples. Layer 2 is now done, with the point classification and rational-subdomain description added to the established affinoid theory. Layer 6 is now done: interval-ring strong noetherianness supplies sheafy window charts and closes the quotient construction, including [independence of the pseudouniformiser](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Pseudouniformizer.html#TauCeti.FarguesFontaine.spaXAdicSpaceCongr). This assessment carries forward the earlier completed layers and uses the explicit closing results in the partly truncated declaration extract.

## The frontier

- **No remaining recorded milestone** — The previous disc-classification and interval-ring targets are closed; the supplied evidence identifies no further in-scope target. General coefficient fields, endpoint intervals meeting zero or infinity, and the curve’s structure theory are beyond the construction assessed here.

<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"fd486a548737649acea650f298f83c4eb643851e","ts":"2026-10-21T23:37:36Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"}],"readme_sha":"7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795","roadmap":"AdicSpaces","to_sha":"fd486a548737649acea650f298f83c4eb643851e"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `fd486a5` (2026-10-21T23:37:36Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer of the roadmap is done. The general theory runs from Huber rings through Tate acyclicity, sheafiness and gluing, and the final application, the adic Fargues–Fontaine curve `𝒳 = 𝒴 / φ^ℤ`, is an adic space with no remaining hypothesis.

### Named results

- **Strong noetherianness of the interval rings** — Kedlaya's Theorem 4.10: for every closed interval of radii, [the interval ring `B^I` is strongly noetherian](https://taucetiproject.org/docs/TauCeti/RingTheory/WittVector/IntervalRing/StronglyNoetherian.html#TauCeti.WittVector.isStronglyNoetherian_intervalRing), and hence [stably sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/IntervalChart.html#TauCeti.WittVector.isStablySheafyRing_intervalRing).

- **The adic Fargues–Fontaine curve** — [`𝒪_𝒴` is a sheaf](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Adic.html#TauCeti.FarguesFontaine.isSheaf_spaYPresheaf), the image of each Frobenius window in the quasi-compact quotient `𝒳` is [an open affinoid `Spa(B^I, B^{I,+})`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/QuotientChart.html#TauCeti.FarguesFontaine.quotientMap_image_window_mem_affinoidOpens), and the resulting adic space [does not depend on the pseudouniformiser](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Pseudouniformizer.html#TauCeti.FarguesFontaine.spaXAdicSpaceCongr).

- **Sheafiness of strongly noetherian Tate rings** — Wedhorn's Theorem 8.28(b): [every strongly noetherian Tate ring is sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.html#TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian), resting on Tate acyclicity in all Čech degrees for rational covers (Lemma 8.34); the Buzzard–Verberkmoes theorem for stably uniform rings is also proved.

- **The points of the closed unit disc** — over an algebraically closed complete nonarchimedean field, [every point is of one of Wedhorn's five types](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Classification.html#TauCeti.ValuationSpectrum.exists_eq_classicalPoint_or_discPoint_or_discPointAbove_or_discPointBelow_or_nestedDiscPoint) (Example 7.57), and points of type (4) [exist](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/NestedDiscPoint.html#TauCeti.ValuationSpectrum.exists_forall_ne_classicalPoint_discPoint_discPointAbove_discPointBelow) over separable fields such as `ℂ_p`.

- **Spectrality of the adic spectrum** — for every Huber ring, `Spa(A,A⁺)` is [a spectral space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemSpaOfIsHuberRing) (Wedhorn's Theorem 7.35).

### Notable definitions and infrastructure

- **Adic spaces** — [Wedhorn's Definition 8.22](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.html#TauCeti.PreAdicSpace.isAdic), with open and closed immersions, morphisms locally of finite type, and gluing of both spaces and morphisms. Closed immersions are [monomorphisms](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/ClosedImmersion/Mono.html#TauCeti.AdicSpace.mono_of_isClosedImmersion), and rational opens are affinoid pre-adic spaces.

- **Holed discs** — [every rational subset of the closed unit disc is a finite union of holed discs](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/PolynomialDomain.html#TauCeti.ValuationSpectrum.exists_finset_eq_iUnion_holedDisc_of_mem_spaRationalFamily), which gives a concrete description of the disc's rational subdomains.

- **Classical points of affinoid algebras** — the Nullstellensatz for algebras topologically of finite type (Wedhorn's Proposition 5.61) gives [an injection of the maximal spectrum into `Spa(A, A°)`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.html#TauCeti.ValuationSpectrum.maximalSpectrumToSpa), whose image is exactly the points with maximal support.

### Roadmap coverage

All seven layers are done. Layers 0, 1, 3, 4 and 5 were already complete. Layer 2 is now complete as well: the five-type classification of the points of the disc and the description of its rational subsets were its last missing pieces, and the supporting examples (Wedhorn's 7.58 and 7.59, `Spa(ℤ_p)`, discrete valuation rings, Remark 7.6) are in place. Layer 6 is complete: strong noetherianness of `B^I` makes `𝒪_𝒴` a sheaf, which removes the hypothesis on the window charts and on the identification of the curves for different pseudouniformisers. As the previous report noted, the `ℚ_p⟨T₁,…,Tₙ⟩` example follows from general instances but is not stated on its own.

## The frontier

- **The `ℚ_p⟨T₁,…,Tₙ⟩` example** — a direct consequence of the general noetherianness and strong-noetherianness instances that has not been stated separately.

- **Beyond this roadmap** — the README places non-affinoidness of `𝒳`, vector bundles on the curve, perfectoid spaces and étale theory outside its scope. Further work on the curve belongs to a successor roadmap, for which the stably sheafy interval rings are the intended input.

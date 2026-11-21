<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"}],"readme_sha":"421a1540a785dd06a75fbd7c683993d6f096a9876aca846046cd66ac944b3eab","roadmap":"AdicSpaces","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer of the roadmap is done. The general theory runs from Huber rings through Tate acyclicity, sheafiness and gluing, and the final application, the adic Fargues–Fontaine curve `𝒳 = 𝒴 / φ^ℤ`, is an adic space with no hypothesis left over. Current work refines the existing theory and its examples.

### Named results

- **The adic Fargues–Fontaine curve** — [`𝒪_𝒴` is a sheaf](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Adic.html#TauCeti.FarguesFontaine.isSheaf_spaYPresheaf), the image of each Frobenius window in the quotient `𝒳` is [an open affinoid `Spa(B^I, B^{I,+})`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/QuotientChart.html#TauCeti.FarguesFontaine.quotientMap_image_window_mem_affinoidOpens), and the resulting adic space [does not depend on the pseudouniformiser](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Pseudouniformizer.html#TauCeti.FarguesFontaine.spaXAdicSpaceCongr).

- **Strong noetherianness of the interval rings** — Kedlaya's Theorem 4.10: for every closed interval of radii, [the interval ring `B^I` is strongly noetherian](https://taucetiproject.org/docs/TauCeti/RingTheory/WittVector/IntervalRing/StronglyNoetherian.html#TauCeti.WittVector.isStronglyNoetherian_intervalRing), and hence [stably sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/IntervalChart.html#TauCeti.WittVector.isStablySheafyRing_intervalRing).

- **Sheafiness of strongly noetherian Tate rings** — Wedhorn's Theorem 8.28(b): [every strongly noetherian Tate ring is sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.html#TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian), resting on Tate acyclicity in all Čech degrees for rational covers. Sheafiness also [passes to every rational localisation](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.html#TauCeti.ValuationSpectrum.isSheaf_presentationLimitPresheaf_rationalLocalizationPair), and the Buzzard–Verberkmoes theorem for stably uniform rings is proved.

- **Affinoid algebras are topologically of finite type** — a complete ultrametric normed algebra over a nonarchimedean field is [topologically of finite type exactly when it is a quotient of a Tate algebra](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/TopologicallyFiniteType.html#TauCeti.Huber.isTopologicallyFiniteType_algebraMap_iff_isAffinoidAlgebra), so [the adic spectrum of a classical affinoid algebra is an affinoid adic space](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/StronglyNoetherian.html#TauCeti.ValuationSpectrum.isAdic_presentationLimitPreAdicSpace_of_isAffinoidAlgebra).

- **The closed unit disc** — over an algebraically closed complete nonarchimedean field, [every point is of one of Wedhorn's five types](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Classification.html#TauCeti.ValuationSpectrum.exists_eq_classicalPoint_or_discPoint_or_discPointAbove_or_discPointBelow_or_nestedDiscPoint) (Example 7.57), and [the rational subsets are exactly the finite unions of holed discs](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/PolynomialDomain.html#TauCeti.ValuationSpectrum.mem_spaRationalFamily_iff_isHoledDiscUnion).

### Notable definitions and infrastructure

- **Adic spaces** — [Wedhorn's Definition 8.22](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.html#TauCeti.PreAdicSpace.isAdic), with open and closed immersions, morphisms locally of finite type, and gluing of spaces and morphisms. Rational localisations give [open immersions](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/RationalOpen.html#TauCeti.ValuationSpectrum.isOpenImmersion_presentationLimitPreAdicSpaceComap_toCompletionLocHom) and quotient mappings give closed immersions, which is what makes the open and closed adic subspaces of Layer 5 available.

- **The open mapping theorem over a Tate ring** — [surjective linear maps from complete first-countable nonarchimedean modules are open](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/OpenMapping.html#LinearMap.isOpenMap_of_isTateRing), so [finite modules over a complete noetherian Tate ring have strict finite presentations](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ClosedSubmodule.html#TauCeti.Huber.IsTateRing.exists_presentation_isStrictMap_isOpenMap). This is the form the acyclicity arguments use.

- **Strong noetherianness is stable** — it passes to [rational localisations of Tate rings](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/LocalizationTopology/StronglyNoetherian.html#TauCeti.Huber.PairOfDefinition.isStronglyNoetherian_completion) and to [algebras topologically of finite type over one](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TopologicallyFiniteType/Basic.html#TauCeti.Huber.IsTopologicallyFiniteType.isStronglyNoetherian). This is what lets the sheafiness theorem apply to whole families of affinoids at once.

### Roadmap coverage

All seven layers are done. Layers 0 through 5 give the general theory, from boundedness and Tate algebras through valuation spectra, rational localisation, the structure presheaf, Tate acyclicity and gluing. Layer 6 builds the adic Fargues–Fontaine curve with no remaining hypothesis. The latest material falls in Layers 0, 3, 4 and 5, all already complete. It reworks existing results, for example power-boundedness under completion and the analytic locus, so no layer's state changes.

## The frontier

- **Beyond this roadmap** — no milestone of this roadmap remains open. The README puts non-affinoidness of `𝒳`, vector bundles on the curve, perfectoid spaces, étale theory, completed tensor products and fibre products outside its scope. Further work on the curve belongs to a successor roadmap, which would start from the stably sheafy interval rings.

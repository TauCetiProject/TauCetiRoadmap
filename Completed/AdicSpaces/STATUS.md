<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"b257e0ff255355b2b692c1311d061d2b4dc84e53","ts":"2026-10-26T06:42:33Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"}],"readme_sha":"7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795","roadmap":"AdicSpaces","to_sha":"b257e0ff255355b2b692c1311d061d2b4dc84e53"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `b257e0f` (2026-10-26T06:42:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer of the roadmap is done. The general theory runs from Huber rings through Tate acyclicity, sheafiness and gluing. The final application, the adic Fargues–Fontaine curve `𝒳 = 𝒴 / φ^ℤ`, is an adic space with no hypothesis left over. Current work fills in Layer 0 algebra and connects the theory to classical affinoid algebras.

### Named results

- **Strong noetherianness of the interval rings** — Kedlaya's Theorem 4.10: for every closed interval of radii, [the interval ring `B^I` is strongly noetherian](https://taucetiproject.org/docs/TauCeti/RingTheory/WittVector/IntervalRing/StronglyNoetherian.html#TauCeti.WittVector.isStronglyNoetherian_intervalRing), and hence [stably sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/IntervalChart.html#TauCeti.WittVector.isStablySheafyRing_intervalRing).

- **The adic Fargues–Fontaine curve** — [`𝒪_𝒴` is a sheaf](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Adic.html#TauCeti.FarguesFontaine.isSheaf_spaYPresheaf). The image of each Frobenius window in the quasi-compact quotient `𝒳` is [an open affinoid `Spa(B^I, B^{I,+})`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/QuotientChart.html#TauCeti.FarguesFontaine.quotientMap_image_window_mem_affinoidOpens), and the resulting adic space [does not depend on the pseudouniformiser](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Pseudouniformizer.html#TauCeti.FarguesFontaine.spaXAdicSpaceCongr).

- **Sheafiness of strongly noetherian Tate rings** — Wedhorn's Theorem 8.28(b): [every strongly noetherian Tate ring is sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.html#TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian). The proof rests on Tate acyclicity in all Čech degrees for rational covers (Lemma 8.34). The Buzzard–Verberkmoes theorem for stably uniform rings is also proved.

- **Affinoid algebras are topologically of finite type** — a complete ultrametric normed algebra over a nonarchimedean field is [topologically of finite type exactly when it is a quotient of a Tate algebra](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/TopologicallyFiniteType.html#TauCeti.Huber.isTopologicallyFiniteType_algebraMap_iff_isAffinoidAlgebra). As a result, [the adic spectrum of a classical affinoid algebra is an affinoid adic space](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/StronglyNoetherian.html#TauCeti.ValuationSpectrum.isAdic_presentationLimitPreAdicSpace_of_isAffinoidAlgebra).

- **The points of the closed unit disc** — over an algebraically closed complete nonarchimedean field, [every point is of one of Wedhorn's five types](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Classification.html#TauCeti.ValuationSpectrum.exists_eq_classicalPoint_or_discPoint_or_discPointAbove_or_discPointBelow_or_nestedDiscPoint) (Example 7.57). Spectrality of `Spa(A,A⁺)` for every Huber ring (Theorem 7.35) sits underneath all of this.

### Notable definitions and infrastructure

- **Adic spaces** — [Wedhorn's Definition 8.22](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.html#TauCeti.PreAdicSpace.isAdic), with open and closed immersions, morphisms locally of finite type, and gluing of both spaces and morphisms. Closed immersions are [monomorphisms](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/ClosedImmersion/Mono.html#TauCeti.AdicSpace.mono_of_isClosedImmersion).

- **The open mapping theorem over a Tate ring** — [surjective continuous linear maps between complete metrisable modules are open](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/OpenMapping.html#TauCeti.Huber.IsTateRing.isOpenMap) and induce the quotient topology, and [maps with closed range are strict](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/OpenMapping.html#TauCeti.Huber.IsTateRing.isStrictMap_of_isClosed_range). This is the form the acyclicity arguments use.

- **Open subrings of Huber rings** — [an open subring of a Huber ring is Huber](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/RingOfDefinition.html#TauCeti.Huber.IsHuberRing.subring) (Corollary 6.4(2)). In particular the ring of power-bounded elements is Huber, which lets results about Huber rings be applied directly to `A°`.

### Roadmap coverage

All seven layers are done. Layers 0 through 5 give the general theory, from boundedness and Tate algebras through valuation spectra, rational localisation, the structure presheaf, Tate acyclicity and gluing. Layer 6 builds the adic Fargues–Fontaine curve without any remaining hypothesis. Layer 0 gained material this window, but it was already complete, so its state is unchanged. The `ℚ_p⟨T₁,…,Tₙ⟩` example that earlier reports listed as missing is now in the library's example files, which derive strong sheafiness for `ℚ_p` and its Tate algebras from the general instances.

## The frontier

- **Beyond this roadmap** — no milestone of this roadmap remains open. The README puts non-affinoidness of `𝒳`, vector bundles on the curve, perfectoid spaces, étale theory and fibre products outside its scope. Further work on the curve belongs to a successor roadmap, which would start from the stably sheafy interval rings.

<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"fd486a548737649acea650f298f83c4eb643851e","ts":"2026-10-21T23:37:36Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"}],"readme_sha":"7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795","roadmap":"AdicSpaces","to_sha":"fd486a548737649acea650f298f83c4eb643851e"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `fd486a5` (2026-10-21T23:37:36Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer's milestones are now proved. The last two gaps closed in this window. Kedlaya's strong noetherianness of the interval rings makes `𝒪_𝒴` a sheaf, which removes the hypothesis on the adic Fargues–Fontaine curve, and the classification of points of the closed unit disc completes Wedhorn's Example 7.57. What remains is packaging, not new mathematics.

### Named results

- **Kedlaya's Theorem 4.10** — for every closed interval `I` of positive radii, the interval ring `B^I` [is strongly noetherian](https://taucetiproject.org/docs/TauCeti/RingTheory/WittVector/IntervalRing/StronglyNoetherian.html#TauCeti.WittVector.isStronglyNoetherian_intervalRing), and so is [stably sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/IntervalChart.html#TauCeti.WittVector.isStablySheafyRing_intervalRing). Algebraic closedness of `F` is not assumed.

- **The adic Fargues–Fontaine curve** — [`𝒪_𝒴` is a sheaf](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Adic.html#TauCeti.FarguesFontaine.isSheaf_spaYPresheaf). Hence the quasi-compact orbit space `𝒳 = 𝒴 / φ^ℤ` is covered by window images that are [open affinoids `Spa(B^I, B^{I,+})`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/QuotientChart.html#TauCeti.FarguesFontaine.quotientMap_image_window_mem_affinoidOpens), and it is [independent of the pseudouniformiser up to isomorphism of adic spaces](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Pseudouniformizer.html#TauCeti.FarguesFontaine.spaXAdicSpaceCongr).

- **Sheafiness of strongly noetherian Tate rings** — Wedhorn's Theorem 8.28(b): [a complete Hausdorff strongly noetherian Tate ring is sheafy](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.html#TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian). The library also has Tate acyclicity in all Čech degrees, Corollary 8.35, and the Buzzard–Verberkmoes theorem for stably uniform rings.

- **Spectrality of the adic spectrum** — for every Huber ring, `Spa(A,A⁺)` is [a spectral space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemSpaOfIsHuberRing) (Wedhorn's Theorem 7.35), proved through pro-constructibility rather than through a subspace argument.

- **Points of the closed unit disc** — over an algebraically closed complete nonarchimedean field, [every point is of one of Wedhorn's five types](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Classification.html#TauCeti.ValuationSpectrum.exists_eq_classicalPoint_or_discPoint_or_discPointAbove_or_discPointBelow_or_nestedDiscPoint), and type (4) [really occurs over `ℂ_p`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/NestedDiscPoint.html#TauCeti.ValuationSpectrum.exists_forall_ne_classicalPoint_discPoint_discPointAbove_discPointBelow).

### Notable definitions and infrastructure

- **Adic spaces** — [Wedhorn's Definition 8.22](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.html#TauCeti.PreAdicSpace.isAdic), with open and closed immersions, morphisms locally of finite type and gluing. Closed immersions are monomorphisms and are local on the target. Together with the sheafiness theorems, this yields `Spa(K,K°)`, closed polydiscs, and the open unit disc as a non-affinoid adic space.

- **Rational opens are affinoid** — restricting `Spa(A,A⁺)` to `R(T/s)` [gives the affinoid pre-adic space of `(A⟨T/s⟩, A_U⁺)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/RationalOpen.html#TauCeti.ValuationSpectrum.presentationLimitPreAdicSpaceLocIso). It is how local statements about adic spaces get checked on affinoid pieces.

- **Window charts of the curve** — [the chart `Spa(B^I, B^{I,+}) ⟶ 𝒳`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/QuotientChart.html#TauCeti.FarguesFontaine.spaXWindowChart) on a wandering window is an open immersion and identifies integral sections. This is the identification Layer 6.4 asks for, which makes each chart an isomorphism onto its image in `𝒱^pre`.

### Roadmap coverage

All seven layers are done. Layers 0, 1, 3, 4 and 5 were already complete. This window added Remark 7.6 (the inclusion `Spv(A,I) → Spv A` is not spectral in general) and the spectrum of `ℤ_p`. Layer 2 is now done. Example 7.57 has its five-type classification, every rational subset of the disc is a finite union of holed discs, and Example 7.58 describes the spectrum for the smallest plus ring. Layer 6 is now done: the sheaf property of `𝒪_𝒴` was its last open input. Two small items from the roadmap's examples are not stated as separate theorems, although they follow from general instances: `ℚ_p⟨T₁,…,Tₙ⟩` complete and strongly noetherian, and the unconditional statement that `𝒳` is an adic space.

## The frontier

- **The curve as an adic space, stated outright** — the window-image and pseudouniformiser results are still phrased with "`𝒪_𝒴` is a sheaf" as a hypothesis. A single theorem that composes them with the sheaf theorem would give the roadmap's final application as one declaration.

- **The `ℚ_p⟨T₁,…,Tₙ⟩` example** — record it as a theorem, combining strong noetherianness of complete rank-one fields with the Huber and completeness instances.

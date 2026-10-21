<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"state X as an adic space unconditionally, combining the proved sheafiness of O_Y with the window-chart results that still assume it","state":"partial"}],"readme_sha":"7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795","roadmap":"AdicSpaces","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 through 5 are done, now including Wedhorn's classification of the points of the closed unit disc. The Fargues–Fontaine layer has all its mathematical ingredients, among them Kedlaya's strong noetherianness of interval rings and sheafiness of `𝒪_𝒴`. What remains is to state `𝒳` as an adic space without the sheafiness hypothesis its chart results still carry.

### Named results

- **Kedlaya's Theorem 4.10** — restricted power series over an interval ring `B^I` are noetherian, so [`B^I` is strongly noetherian](https://taucetiproject.org/docs/TauCeti/RingTheory/WittVector/IntervalRing/StronglyNoetherian.html#TauCeti.WittVector.isStronglyNoetherian_intervalRing) and therefore [stably sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/IntervalChart.html#TauCeti.WittVector.isStablySheafyRing_intervalRing). This is the analytic input that makes the Fargues–Fontaine charts sheafy.

- **Sheafiness of `𝒪_𝒴`** — the structure presheaf of `𝒴 ⊆ Spa(A_inf, A_inf)` [is a sheaf](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Adic.html#TauCeti.FarguesFontaine.isSheaf_spaYPresheaf), even though `A_inf` is not Tate. Over each window, `𝒴` is [an adic space isomorphic to `Spa(B^I, B^{I,+})`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/IntervalChart.html#TauCeti.FarguesFontaine.isAdic_spaPreAdicSpace_restrict_windowNumerators).

- **The five types of points of the closed disc** — over an algebraically closed complete nonarchimedean field, [every point of the closed unit disc is of one of Wedhorn's five types](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Classification.html#TauCeti.ValuationSpectrum.exists_eq_classicalPoint_or_discPoint_or_discPointAbove_or_discPointBelow_or_nestedDiscPoint) (Example 7.57). Over `ℂ_p`, points of type (4) [do occur](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/NestedDiscPoint.html#TauCeti.ValuationSpectrum.exists_forall_ne_classicalPoint_discPoint_discPointAbove_discPointBelow).

- **Sheafiness of strongly noetherian Tate rings** — Wedhorn's Theorem 8.28(b): [a strongly noetherian Tate ring is sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.html#TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian), and indeed [stably sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.html#TauCeti.Huber.isStablySheafyRing_of_isStronglyNoetherian) (Corollary 8.35). The Buzzard–Verberkmoes theorem, that [stably uniform Tate rings are sheafy](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Rational/StableUniform.html#TauCeti.Huber.isSheafyRing_of_isStablyUniform), is also proved.

- **Tate acyclicity** — over a strongly noetherian Tate pair, the augmented Čech complex of the structure presheaf is exact in every degree for every rational cover of a rational subset (Wedhorn's Lemma 8.34). The degree-zero case is [the sheaf condition for rational covers](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Rational/Topology.html#TauCeti.ValuationSpectrum.isSheafFor_ofArrows_spaRationalOpens_of_iSup_eq_topCommRingCat).

### Notable definitions and infrastructure

- **Adic spaces and their morphisms.** [Wedhorn's Definition 8.22](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.html#TauCeti.PreAdicSpace.isAdic) comes with open and closed immersions, morphisms locally of finite type, and gluing. Closed immersions are [monomorphisms](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/ClosedImmersion/Mono.html#TauCeti.AdicSpace.mono_of_isClosedImmersion), and both properties can be checked locally on the target. Together with sheafiness, this gives `Spa(K,K°)`, the closed polydiscs and the open unit disc as adic spaces.

- **Window charts of `𝒳`.** For a wandering window, [the chart `Spa(B^I, B^{I,+}) ⟶ 𝒳`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/QuotientChart.html#TauCeti.FarguesFontaine.spaXWindowChart) is an open immersion onto an open affinoid. This is how the curve is shown to be locally affinoid, and it underlies [the isomorphism of the curves for two pseudouniformisers](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Pseudouniformizer.html#TauCeti.FarguesFontaine.spaXAdicSpaceCongr).

- **Holed discs.** [Finite unions of holed discs](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/HoledDisc.html#TauCeti.ValuationSpectrum.IsHoledDiscUnion) are the language for rational subdomains of the disc. [Every rational subset of the closed disc is one](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/PolynomialDomain.html#TauCeti.ValuationSpectrum.exists_finset_eq_iUnion_holedDisc_of_mem_spaRationalFamily), and a holed disc whose holes have unit radius parameters is itself rational.

### Roadmap coverage

Layers 0, 1, 3, 4 and 5 remain done. Layer 2 is now done. Example 7.57's classification of points is complete over an algebraically closed field, and the rational subdomains of the disc are described by holed discs. The analytic-locus criteria of Proposition 7.49(2) and the trivial points of Example 7.59 also landed. The `ℚ_p⟨T₁,…,Tₙ⟩` example still follows from general instances without being stated separately. Layer 6 is partial in a narrow sense. `A_inf`, `𝒴`, the windows, the quotient, the interval rings and their strong noetherianness, the quotient presheaf, the window charts, sheafiness of `𝒪_𝒴` and independence of `ϖ` are all proved. However, the results presenting `𝒳` as locally affinoid still assume sheafiness of `𝒪_𝒴`, and no statement in the supplied material combines them into an unconditional one.

## The frontier

- **`𝒳` as an adic space, unconditionally**: combine [the sheaf property of `𝒪_𝒴`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Adic.html#TauCeti.FarguesFontaine.isSheaf_spaYPresheaf) with the window-chart results, which take it as a hypothesis, to state that `𝒳` is an adic space covered by the two affinoid window images. The isomorphism for two pseudouniformisers can be freed of the same hypothesis. This should need no new mathematics.

- **The `ℚ_p⟨T₁,…,Tₙ⟩` example**: it follows from the general noetherianity and strong-noetherianity instances for Tate algebras over complete nonarchimedean fields, but it is not recorded as a separate statement.

- **Beyond this roadmap**: vector bundles and the rest of the structure theory of the curve are out of scope here. The README sends the stable sheafiness of the chart rings on to its successor roadmap.

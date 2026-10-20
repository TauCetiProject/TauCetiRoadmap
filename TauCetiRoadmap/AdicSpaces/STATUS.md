<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d","ts":"2026-10-13T09:39:50+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"Example 7.57: every point of the closed unit disc is of one of the five types, and the classification of its rational subdomains","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"Kedlaya's strong noetherianness of the interval rings B^I, hence sheafiness of O_Y and the curve X as an adic space without hypothesis","state":"partial"}],"readme_sha":"7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795","roadmap":"AdicSpaces","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `c7ae9d7` (2026-10-13T09:39:50+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations through elementary geometry are done. Spectrality, rational localisation, Tate acyclicity, sheafiness of strongly noetherian and stably uniform Tate rings, and adic spaces with their gluing, closed immersions and disc examples are all proved. What remains is Wedhorn's full classification of the points of the closed unit disc, and the strong noetherianness of Kedlaya's interval rings that would make the Fargues–Fontaine curve an adic space unconditionally.

### Named results

- **Sheafiness of strongly noetherian Tate rings** — Wedhorn's Theorem 8.28(b): [a complete Hausdorff strongly noetherian Tate ring is sheafy](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.html#TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian), and at pair level no completeness is needed. Corollary 8.35 (stable sheafiness) and the Buzzard–Verberkmoes theorem for stably uniform rings are also in the library.

- **Tate acyclicity** — over a strongly noetherian Tate pair, the augmented Čech complex of the structure presheaf is exact in every degree for every rational cover of a rational subset, which is Wedhorn's Lemma 8.34. The degree-zero case is [the sheaf condition for rational covers](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Rational/Topology.html#TauCeti.ValuationSpectrum.isSheafFor_ofArrows_spaRationalOpens_of_iSup_eq_topCommRingCat). The standard Laurent cover of the closed disc is recorded as an example.

- **Spectrality of the adic spectrum** — for every Huber ring, `Spa(A,A⁺)` is [a spectral space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemSpaOfIsHuberRing) (Wedhorn's Theorem 7.35).

- **Rational opens are affinoid** — the restriction of `Spa(A,A⁺)` to `R(T/s)` is [isomorphic as a pre-adic space to `Spa(A⟨T/s⟩, A_U⁺)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/RationalOpen.html#TauCeti.ValuationSpectrum.presentationLimitPreAdicSpaceLocIso) (Wedhorn's Proposition 8.2(2) and Remark 8.8).

- **The Fargues–Fontaine orbit space** — the Frobenius windows cover `𝒴`, they are wandering, and the quotient [`𝒳 = 𝒴 / φ^ℤ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.html#TauCeti.FarguesFontaine.spaX) is [quasi-compact](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.html#TauCeti.FarguesFontaine.compactSpace_spaX). Each window is identified with `Spa(B^I, B^{I,+})`, and `𝒳` is an adic space once `𝒪_𝒴` is shown to be a sheaf.

### Notable definitions and infrastructure

- **Adic spaces** — [Wedhorn's Definition 8.22](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.html#TauCeti.PreAdicSpace.isAdic), together with open and closed immersions, morphisms locally of finite type and gluing. Combined with sheafiness, this gives `Spa(K,K°)`, closed polydiscs and the open unit disc as adic spaces. The open unit disc is not affinoid because it is not quasi-compact.

- **The Čech augmentation criterion** — the augmented Čech complex is exact exactly when the sheaf condition holds and higher Čech cohomology vanishes. This is the form in which all-degree acyclicity is stated.

- **Iterated Tate algebras** — [`A⟨X₁,…,Xₙ,Y⟩ ≅ A⟨X₁,…,Xₙ⟩⟨Y⟩`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Iterate.html#TauCeti.Huber.restrictedOptionEquiv), isometric for the Gauss norms. It lets one-variable arguments be run one variable at a time.

### Roadmap coverage

Layers 0, 1, 3, 4 and 5 are done. In Layer 0, Tate algebras over complete nonarchimedean fields are noetherian (by Kedlaya's Gröbner-basis argument) and such fields are strongly noetherian. The `ℚ_p⟨T₁,…,Tₙ⟩` example follows from these general instances, but it is not stated separately. Layer 4 covers both the strongly noetherian route (all degrees, Theorem 8.28(b), Corollary 8.35) and Buzzard–Verberkmoes, and it includes the non-uniform sheafy example `K⟨X,Q⟩/(Q²)`. Layer 2 is partial. Example 7.57 has its classical points, the Gauss points `η_{a,r}`, the rank-two points next to them, the points of nested discs and the closed subdiscs. The theorem that every point of the disc is of one of the five types is missing, and so is the classification of rational subdomains. Layer 6 is partial. `A_inf`, `𝒴` with an explicit Gauss point, the windows, the quotient topology, the interval rings, the quotient presheaf, the window charts and independence of `ϖ` are done. Sheafiness of `𝒪_𝒴` is still assumed as a hypothesis.

## The frontier

- **Strong noetherianness of interval rings** — prove Kedlaya's Theorem 4.10 for `B^I` with `I ⊂ (0,∞)` closed. Theorem 8.28(b) then makes each window sheafy, the existing reduction makes `𝒪_𝒴` a sheaf, and `𝒳` becomes an adic space with no extra hypothesis.

- **Points of the closed unit disc** — every point type of Example 7.57 has been constructed and recognised. The remaining step is to show that these types exhaust the disc over an algebraically closed field. Type (4) points need a field that is not spherically complete, such as `ℂ_p`, and the library does not construct one.

- **Rational subdomains of the closed disc** — closed subdiscs and their inclusions are described, but no classification of the rational subdomains of the disc has been stated.

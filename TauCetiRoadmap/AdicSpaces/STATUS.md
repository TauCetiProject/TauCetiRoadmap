<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"noetherianity of K⟨X₁,…,Xₙ⟩ for n ≥ 2 (BGR 5.2.6), strong noetherianness of complete rank-one fields, the ℚ_p⟨T₁,…,Tₙ⟩ example","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"Example 7.57: classification of the points and rational subdomains of the closed unit disc","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"assembled topological sheafiness, all-degree Čech exactness, Theorem 8.28(b), Corollary 8.35, Buzzard-Verberkmoes, examples","state":"partial"},{"id":"Layer 5","remaining":"closed immersions, morphisms locally of finite type, gluing, the disc examples","state":"partial"},{"id":"Layer 6","remaining":"nonemptiness and Gauss point of 𝒴, interval rings, quotient sheaf, window charts, independence of ϖ","state":"partial"}],"readme_sha":"7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795","roadmap":"AdicSpaces","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 and 3 are done. Layer 4 has Tate acyclicity in degree zero for every finite rational cover, but it has not yet produced a sheaf of topological rings. Layer 5 has adic spaces and open subspaces but no examples. Layers 0 and 2 each lack a few specified items. Layer 6 has `𝒴`, its Frobenius windows and the topological quotient `𝒳`, but no interval rings or charts.

### Named results

- **Spectrality of the adic spectrum** — for every Huber ring, `Spa(A,A⁺)` is [a spectral space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemSpaOfIsHuberRing), which is Wedhorn's Theorem 7.35.

- **Rational opens are affinoid** — pullback along `A → A⟨T/s⟩` is [a homeomorphism from `Spa(A⟨T/s⟩, A_U⁺)` onto `R(T/s)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/CompletedHomeomorph.html#TauCeti.ValuationSpectrum.spaCompletedLocalizationHomeomorph). It upgrades to [an isomorphism of pre-adic spaces](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/RationalOpen.html#TauCeti.ValuationSpectrum.presentationLimitPreAdicSpaceLocIso) (Wedhorn's Proposition 8.2(2) and Remark 8.8).

- **Faithful flatness along a rational cover** — over a complete Hausdorff strongly noetherian Tate ring, the map from `A` into the product of the coordinate rings of a finite rational cover is [faithfully flat](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/FaithfullyFlat.html#TauCeti.ValuationSpectrum.faithfullyFlat_pi_toCompletionLoc), which is Corollary 8.32.

- **Tate acyclicity in degree zero** — over a strongly noetherian Tate pair, the structure presheaf of topological rings [satisfies the sheaf condition for every rational cover of a rational subset](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Rational/Topology.html#TauCeti.ValuationSpectrum.isSheafFor_ofArrows_spaRationalOpens_of_iSup_eq_topCommRingCat). This is Lemma 8.34 in degree zero, and it makes [the underlying presheaf of sets a sheaf](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.html#TauCeti.ValuationSpectrum.isSheaf_underlying_presentationLimitPresheaf_of_isStronglyNoetherian).

- **The Fargues–Fontaine orbit space** — the windows `U_n`, `V_n` are rational subsets, they [cover `𝒴`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Window.html#TauCeti.FarguesFontaine.iUnion_windowU_union_windowV) and they are wandering. As a result, [`𝒳 = 𝒴 / φ^ℤ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.html#TauCeti.FarguesFontaine.spaX) is [quasi-compact](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.html#TauCeti.FarguesFontaine.compactSpace_spaX) and T0, with the windows embedding as opens.

### Notable definitions and infrastructure

- **Adic spaces** — Wedhorn's [Definition 8.22](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.html#TauCeti.PreAdicSpace.isAdic) makes adic spaces the sheafy objects of `𝒱^pre` with an affinoid adic cover. Since [`Spa(A,A⁺)` is pre-adic](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/RationalOpen.html#TauCeti.ValuationSpectrum.isPreAdic_presentationLimitPreAdicSpace), any sheafiness theorem immediately yields affinoid adic spaces.

- **The structure presheaf** — it is [a sheaf once it is one on rational opens](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/KanExtension.html#TauCeti.ValuationSpectrum.isSheaf_presentationLimitPresheaf_of_isSheaf_rational), and [a criterion](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Category/TopCommRingCat/Sheaf.html#TauCeti.TopCommRingCat.isSheaf_of_isSheaf_forget) reduces the topological sheaf condition to the one for sets plus an inducing condition. Both inputs are now available in the strongly noetherian case.

- **Čech augmentation** — the augmented Čech complex is exact [exactly when the sheaf condition holds and higher Čech cohomology vanishes](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.html#TauCeti.CategoryTheory.quasiIso_cechAugmentation_iff). Layer 4's all-degree statement will take this form.

### Roadmap coverage

Layers 1 and 3 are done. Layer 0 is partial: `K⟨T⟩` is noetherian, Weierstrass theory holds over complete rings with a multiplicative ultrametric norm, and the completed Tate algebra is identified with the Gauss-normed ring of restricted series. Still missing are `K⟨X₁,…,Xₙ⟩` for `n ≥ 2`, strong noetherianness of rank-one fields and the `ℚ_p⟨T₁,…,Tₙ⟩` example. Layer 2 is partial, missing only Example 7.57. Layer 4 is partial. §4.1 has steps 1–6 in degree zero, with topology. Still missing are the assembled sheaf of complete topological rings, all-degree Čech exactness, Theorem 8.28(b) and Corollary 8.35. §4.2 has only the Laurent step of Buzzard–Verberkmoes. Layer 5 is partial: adic spaces, open immersions and open subspaces exist, but closed immersions, morphisms locally of finite type, gluing and the disc examples are missing. Layer 6 is partial. `A_inf`, `𝒴` with power comparison, the windows and the quotient topology of `𝒳` are done. Nonemptiness and the Gauss point of `𝒴`, the interval rings, the quotient sheaf and the charts are missing.

## The frontier

- **Sheafiness of strongly noetherian Tate pairs** — combine the sheaf of sets with the inducing statement on rational covers through the topological criterion. Then pass through completion for Theorem 8.28(b) and Corollary 8.35.

- **All-degree Čech exactness** — the degree-zero chain is complete. Higher Čech cohomology of finite rational covers must vanish before the augmentation criterion applies.

- **First examples of adic spaces** — once a ring is proved sheafy, the affinoid criterion gives `Spa(K,K°)` and the closed disc. Gluing, closed immersions and morphisms locally of finite type remain to be built.

- **Charts on the Fargues–Fontaine curve** — prove `𝒴` nonempty with an explicit Gauss point. Then define the interval rings `B^I` and identify each window with `Spa(B^I,B^{I,+})`. The latter needs Kedlaya's strong noetherianness and Layer 4's sheafiness.

- **Noetherianity of `K⟨X₁,…,Xₙ⟩`** — Weierstrass division and preparation, and the reduction of a distinguished quotient to a polynomial one, are in place. The induction on `n` remains.

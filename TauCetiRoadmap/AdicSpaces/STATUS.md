<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"22df7c042dd40104856f178b64774ef6681232e1","ts":"2026-10-01T07:27:52Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"noetherianity of K⟨X₁,…,Xₙ⟩ for n ≥ 2 (BGR 5.2.6), hence strong noetherianness of complete rank-one fields and the ℚ_p⟨T₁,…,Tₙ⟩ example","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"Example 7.57: classification of the points and rational subdomains of the closed unit disc","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Lemma 8.34 for arbitrary finite rational covers, sheafiness, all-degree Čech exactness, Theorem 8.28(b), Corollary 8.35, the Buzzard-Verberkmoes theorem","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"perfectoid-field packaging of A_inf, the locus 𝒴, power comparison, Frobenius windows, interval rings, charts","state":"partial"}],"readme_sha":"7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795","roadmap":"AdicSpaces","to_sha":"22df7c042dd40104856f178b64774ef6681232e1"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `22df7c0` (2026-10-01T07:27:52Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 and 3 are done; Layer 3 was completed by Wedhorn's pre-adic spaces. Layer 4 has Lemma 8.33 on every rational subset and the Laurent case of Buzzard–Verberkmoes, but no sheafiness theorem yet. Layers 0 and 2 each lack a few specified items, Layer 6 has `A_inf` as a non-Tate Huber ring and nothing beyond, and Layer 5 has not begun.

### Named results

- **Spectrality of the adic spectrum**: for every Huber ring, `Spa(A,A⁺)` is [a spectral space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemSpaOfIsHuberRing). This is Wedhorn's Theorem 7.35.

- **Wedhorn's Proposition 8.2(2) and Remark 8.8**: pullback along `A → A⟨T/s⟩` is [a homeomorphism from `Spa(A⟨T/s⟩, A_U⁺)` onto `R(T/s)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/CompletedHomeomorph.html#TauCeti.ValuationSpectrum.spaCompletedLocalizationHomeomorph). It also upgrades to [an isomorphism of pre-adic spaces](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/RationalOpen.html#TauCeti.ValuationSpectrum.presentationLimitPreAdicSpaceLocIso), so every rational open is an open affinoid subspace.

- **Faithful flatness along a rational cover**: take a finite rational cover over a complete Hausdorff strongly noetherian Tate ring. The map from `A` into the product of the coordinate rings is [faithfully flat](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/FaithfullyFlat.html#TauCeti.ValuationSpectrum.faithfullyFlat_pi_toCompletionLoc), and hence injective. This is Wedhorn's Corollary 8.32.

- **Laurent covers glue**: over a strongly noetherian Tate ring, sections on the two-piece Laurent cover of any rational subset [glue](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/LaurentCover/Restrict.html#TauCeti.ValuationSpectrum.exists_presentationLimitMap_eq_of_inf_laurentCoverOpen) (Lemma 8.33). The same holds [without noetherianity on a stably uniform affinoid](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/LaurentCover/StableUniform.html#TauCeti.ValuationSpectrum.exists_presentationLimitMap_eq_of_inf_laurentCoverOpen_of_isStablyUniform), which is the Laurent step of Buzzard–Verberkmoes.

- **The one-variable Tate algebra is a principal ideal ring**: over a complete nonarchimedean field, [every ideal of the restricted power series is principal](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Ideal.html#TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring), so `K⟨T⟩` is noetherian.

### Notable definitions and infrastructure

- **The structure presheaf**: it is [identified with Wedhorn's limit over rational subsets](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/SubsetLimit.html#TauCeti.ValuationSpectrum.presentationLimitIsoRationalSubsetLimit) and has local stalks. It is [a sheaf once it is one on rational opens](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/KanExtension.html#TauCeti.ValuationSpectrum.isSheaf_presentationLimitPresheaf_of_isSheaf_rational), so sheafiness reduces to finite rational covers.

- **Pre-adic spaces**: Wedhorn's [`(PreAd)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/LocallyAffinoid.html#TauCeti.WedhornPreAdicSpace) is the category of locally affinoid objects of `𝒱^pre` whose presheaf is adapted to the affinoid opens. It sits alongside the sheafy subcategory `𝒱`, which is where Layer 5's adic spaces will live.

- **Čech augmentation**: the augmented Čech complex is exact [exactly when the sheaf condition holds and higher Čech cohomology vanishes](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.html#TauCeti.CategoryTheory.quasiIso_cechAugmentation_iff). This is the form in which Layer 4's all-degree acyclicity will be stated.

### Roadmap coverage

Layers 1 and 3 are done. For Layer 3 this includes the three sheafiness predicates and their invariance under isomorphism and completion. Layer 0 is partial: `K⟨T⟩` is noetherian and adic rings are Huber, but `K⟨X₁,…,Xₙ⟩` for `n ≥ 2`, strong noetherianness of complete rank-one fields and the `ℚ_p⟨T₁,…,Tₙ⟩` example are missing. Layer 2 is partial: everything is in except Example 7.57, which classifies the points and rational subdomains of the closed disc. Layer 4 is partial. §4.1 has steps 1 to 5, but not Lemma 8.34 for arbitrary finite covers, sheafiness, all-degree Čech exactness, Theorem 8.28(b) or Corollary 8.35. §4.2 has the Laurent case but not the Buzzard–Verberkmoes theorem. Layer 6 is partial: [`A_inf` is a complete Hausdorff Huber ring that is not Tate](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/WittVector.html#TauCeti.Huber.WittVector.isTateRing_adicTopology_span_p_teichmuller_iff), stated for Witt vectors of a general perfect ring. The perfectoid-field packaging, `𝒴`, power comparison, the windows and the charts are missing. Layer 5 is untouched.

## The frontier

- **Tate acyclicity for finite rational covers**: run Lemma 8.34's induction from Laurent covers to standard covers to arbitrary finite covers. Then deduce sheafiness through the rational-open criterion, and all-degree Čech exactness through the augmentation criterion.

- **Buzzard–Verberkmoes**: the Laurent step holds on every rational subset of a stably uniform affinoid. The same passage to arbitrary rational covers remains, now without noetherian hypotheses.

- **Affinoid and general adic spaces**: once some ring is proved sheafy, Layer 5 can define affinoid adic spaces in `𝒱`, then open subspaces and gluing. It is not yet proved that `Spa(A,A⁺)` itself lies in `(PreAd)`, that is, that its presheaf is adapted to all affinoid opens rather than just to rational ones.

- **Noetherianity of `K⟨X₁,…,Xₙ⟩`**: the induction needs Weierstrass division over `K⟨X₁,…,Xₙ₋₁⟩`, not just over the field. Until it is done, the strongly noetherian Tate rings of Layer 4 have no example here beyond `K⟨T⟩`.

- **The locus `𝒴` in `Spa(A_inf, A_inf)`**: define `D(p) ∩ D([ϖ])`, and prove it is open, nonempty and Frobenius-stable, with an explicit Gauss point.

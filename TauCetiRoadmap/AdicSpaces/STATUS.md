<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"a3c29b550e007f5a7acf0313f49de95ee2a4b18e","ts":"2026-09-21T12:30:22Z"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `a3c29b5` (2026-09-21T12:30:22Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 and 2 are done, and Layer 0 lacks only the noetherianity end of its restricted-series theory. Layer 3 has the structure presheaf with both defining identifications but no stalk theory, no `𝒪_X⁺` and no sheaf condition; Layer 4 reaches Corollary 8.32 and the two-piece Laurent cover of Lemma 8.33; Layers 5 and 6 have not begun.

### Named results

- **Spectrality of the adic spectrum** — `Spa(A,A⁺)` is [a spectral space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemSpaOfIsHuberRing) for a Huber ring and a ring of integral elements, by the characterisation of the continuous locus inside `Spv(A,IA)`.

- **Wedhorn's completion theorem (Proposition 7.48)** — pullback along `A → Â` is [a homeomorphism `Spa(Â,Â⁺) ≃ Spa(A,A⁺)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Completion/Homeomorph.html#TauCeti.ValuationSpectrum.spaCompletionHomeomorph), for `Â⁺` the closure of the image of `A⁺`, and it [matches rational subsets](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Completion/RationalSubset.html#TauCeti.ValuationSpectrum.spaCompletionHomeomorph_preimage_mem_spaRationalFamily_iff).

- **Faithful flatness along a rational cover (Corollary 8.32)** — for a finite rational cover of `Spa(A,A⁺)`, the map from `A` into the product of the coordinate rings is [faithfully flat](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/FaithfullyFlat.html#TauCeti.ValuationSpectrum.faithfullyFlat_pi_toCompletionLoc), so in particular injective: Čech exactness in degree zero.

- **Exactness for the two-piece Laurent cover (Lemma 8.33)** — a pair of sections over `{|f| ≤ 1}` and `{|f| ≥ 1}` agreeing on the overlap is [a pair of equal constants](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Laurent/Cover.html#TauCeti.Huber.exact_algebraMap_laurentCoverDiff), and the differential onto the overlap is surjective. This is proved for the quotient presentations of the coordinate rings, not for presheaf sections.

- **Weierstrass division** — over a complete nonarchimedean field, a restricted series distinguished of degree `s` at a positive radius divides every restricted series in [exactly one way](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/PowerSeries/WeierstrassDivision.html#TauCeti.PowerSeries.IsDistinguished.existsUnique_mul_add_eq). One variable only.

### Notable definitions and infrastructure

- **The presentation-limit structure presheaf** — the limit over the admissible presentations refining an open is [the coordinate ring `A⟨T/s⟩` on a rational open](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Rational.html#TauCeti.ValuationSpectrum.presentationLimitRationalIso) and [`A` itself on the whole spectrum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/GlobalSections.html#TauCeti.ValuationSpectrum.presentationLimitTopIso), its restrictions being the comparison maps of Proposition 8.2(1). A candidate presheaf had to meet this before anything could be asked of its stalks.

- **The completed rational localisation with its plus ring** — `A_U⁺` is the closure of the integral closure of `A⁺[T/s]`, and [`(A⟨T/s⟩, A_U⁺)` is a Huber pair](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Plus.html#TauCeti.Huber.PairOfDefinition.isRingOfIntegralElements_completedPlusSubring). Presenting it as [a quotient of a restricted power-series ring](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Quotient.html#TauCeti.Huber.PairOfDefinition.rationalQuotientRingEquiv) makes it strongly noetherian over a strongly noetherian base, which is what the flatness chain consumes.

- **Two-sided restricted series `A⟨X,X⁻¹⟩`** — [a ring](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/Restricted/TwoSidedSeries/Ring.html#TauCeti.Huber.twoSidedRestrictedSubmodule.instRing) built by convolving coefficient families that tend to zero cofinitely. It is the coordinate ring of the overlap in the Laurent argument.

### Roadmap coverage

Layer 0 has boundedness, Huber and Tate rings, completion, the restricted-series constructions with their universal properties, and the open mapping theorem; Weierstrass division is present in one variable, but preparation, noetherianity of `K⟨X₁,…,Xₙ⟩` and strong noetherianness of complete rank-one fields are not. Layer 1 is done. Layer 2 is done as specified: spectrality, the rational basis and its stability properties, plus-ring recovery, emptiness, Propositions 7.49(2), 7.51 and 7.52, Corollary 7.53, the standard refinement of Lemma 7.54, completion invariance and quotient pairs. Layer 3 has coordinate rings with their plus rings, comparison and restriction maps, the complete separated target category with all small limits, the presheaf with its rational and global identifications, and germ maps into stalks; it lacks stalk locality, `𝒪_X⁺`, `𝒱^pre` and the sheafiness predicates. The identification of `Spa(A⟨T/s⟩, A_U⁺)` with `R(T/s)` is not itself recorded, though both halves of it now are. Layer 4 has module base change, Lemma 8.31, Proposition 8.30 with its hypothesis discharged, Corollary 8.32 and Lemma 8.33, and nothing beyond them. Layers 5 and 6 are untouched.

## The frontier

- **Čech exactness for an arbitrary finite rational cover** — transport the Laurent statements to sections of the presheaf, then run Lemma 8.34. Corollary 8.32 and Lemma 7.54 are in place, so this is the shortest route left to Theorem 8.28(b).

- **Stalks of the structure presheaf** — show each stalk is local with the point valuation supported at its maximal ideal, so that the valuation factors through the residue field, and define `𝒪_X⁺`. Germ maps exist; nothing above them does.

- **Pre-adic spaces** — define `𝒱^pre`, its affinoid objects and the three sheafiness predicates. This waits on the stalk package, and is the entry point to Layers 5 and 6.

- **Stably uniform affinoids are sheafy** — the Buzzard-Verberkmoes theorem uses no noetherian hypothesis, so it does not depend on the acyclicity chain. Uniformity and stable uniformity are not yet defined here.

- **Strong noetherianness of complete rank-one nonarchimedean fields** — Weierstrass preparation, then noetherianity of `K⟨X₁,…,Xₙ⟩` and its stability under quotients and iteration. Without it the strong-noetherianness hypotheses throughout Layer 4 have no examples.

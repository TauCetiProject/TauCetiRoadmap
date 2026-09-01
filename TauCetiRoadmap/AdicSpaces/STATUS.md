<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"f88533f839b2b774d5d3cf5390f0b592031b01aa","ts":"2026-09-01T13:41:42Z"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `f88533f` (2026-09-01T13:41:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is complete through the characterization and spectrality of continuous valuations. Layers 0, 2, 3 and 4 are genuinely partial: `Spa` and its rational topology are established, completed rational localization and a candidate structure presheaf exist, and the first flatness results toward Tate acyclicity have landed; pre-adic spaces, adic-space geometry and the Fargues–Fontaine curve have not begun.

### Named results

- **[Spectrality of the valuation spectrum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.html#TauCeti.ValuationSpectrum.instSpectralSpace)** — `Spv A` is spectral, via a compact patch presentation whose clopen basic opens generate the valuation-spectrum topology.

- **[The continuous-valuation characterization](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Cont/OfIdeal.html#TauCeti.ValuationSpectrum.cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one)** — for a Huber ring, `Cont A` is exactly the part of `Spv(A,IA)` strictly sub-unit on an ideal of definition; [the resulting continuous locus is spectral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Cont/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemContOfIsHuberRing).

- **[Spectrality of the adic spectrum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemSpaOfIsHuberRing)** — `Spa(A,A⁺)` is spectral for a Huber ring and a ring of integral elements.

- **[The rational-basis theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.html#TauCeti.ValuationSpectrum.isTopologicalBasis_spaRationalFamily)** — rational subsets with open numerator ideal form a basis of quasi-compact opens, closed under finite intersections and admitting finite rational refinements.

- **[Faithful flatness of restricted power series](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/Restricted/Flat.html#TauCeti.Huber.faithfullyFlat_restrictedMvPowerSeriesSubring)** — `A⟨T₁,…,Tₖ⟩` is faithfully flat over a complete noetherian Tate ring, supplying the first principal algebraic input to Tate acyclicity.

### Notable definitions and infrastructure

- **[Completed rational localization](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Completion.html#TauCeti.Huber.PairOfDefinition.toCompletionLoc)** — the structure map `A → A⟨T/s⟩`, its complete-Hausdorff universal property and the integral-closure plus ring provide coordinate rings for rational domains.

- **[Complete separated topological rings](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Basic.html#TauCeti.CompleteSeparatedTopCommRingCat)** — this target category now has [all small limits](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Limits.html#TauCeti.CompleteSeparatedTopCommRingCat.instHasLimits), as required for structure-presheaf values.

- **[The presentation-limit presheaf](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Basic.html#TauCeti.ValuationSpectrum.presentationLimitPresheaf)** — limits of completed localizations over presentations refining an open give a candidate presheaf on `Spa(A,A⁺)`; agreement with rational coordinate rings and the stalk theory are not yet established.

### Roadmap coverage

- **Layers 0–1:** Layer 0 has boundedness, Huber/Tate foundations, ring-of-definition calculus, weighted and ordinary restricted-series infrastructure, open mapping and completed `A⟨T/s⟩`; Weierstrass theory and strong noetherianness for complete rank-one fields remain. Layer 1 is done.
- **Layer 2:** `Spa`, functoriality, spectrality, rational-basis theory, plus-ring recovery, quotient pairs, analytic loci and closed polydiscs are present. Perturbation invariance, rational subsets inside rational subsets, the standard-refinement theorem, and the full emptiness statement without the extra openness hypothesis on `closure {0}` are not established here.
- **Layers 3–4:** Layer 3 has coordinate rings, presentation-change maps, complete-separated limits and the candidate presheaf, but not the rational-domain homeomorphism, rational agreement, stalk valuations or pre-adic spaces. Layer 4 has the finite-module base-change theorem and the two flatness statements of Lemma 8.31, but not flat rational restrictions, Čech exactness or either sheafiness theorem.
- **Layers 5–6:** untouched.

## The frontier

- **Rational-localization homeomorphism** — prove that `Spa(A⟨T/s⟩,A_U⁺) → R(T/s)` is injective and a homeomorphism; only continuity and surjectivity onto the rational subset are established.

- **Rational presentation and refinement** — remove the recorded unit/open-plus qualifications from presentation independence where the roadmap requires this, and prove rational-in-rational and standard-refinement results.

- **Structure-presheaf local geometry** — identify the presentation limit with `A_U` on rational opens, define `𝒪_X⁺`, and prove the stalks are local with residue-field valuations.

- **Tate acyclicity** — continue from module base change and Lemma 8.31 to flat rational restriction maps, Laurent-cover exactness, arbitrary finite rational covers and the strongly noetherian sheafiness theorem.

- **Pre-adic spaces** — define the category and its affinoid objects once the rational presheaf and stalk package are complete; this is the entry point to Layers 5 and 6.

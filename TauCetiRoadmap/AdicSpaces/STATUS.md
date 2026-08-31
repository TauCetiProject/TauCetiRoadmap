<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"01f38d7d4871cdb1a30e90f48c85eefd772c1bb0","ts":"2026-08-21T22:03:41+00:00"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `01f38d7` (2026-08-21T22:03:41+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is complete: valuation spectra, ideal-relative spectra and the continuous locus have the required spectrality and continuity characterisation. Layer 2 now contains the spectral adic spectrum and its core rational topology but remains partial, while Layer 3 has rational-coordinate and categorical infrastructure but no structure presheaf; Layers 4–6 have not begun.

### Named results

- **[Spectrality of valuation spectra](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.html#TauCeti.ValuationSpectrum.instSpectralSpace)** — `Spv A` is spectral via its compact patch presentation, and the ideal-relative [`Spv(A,I)` is spectral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/SpvOfIdeal/Spectral.html#TauCeti.ValuationSpectrum.spectralSpace_spvOfIdeal) under the roadmap’s finiteness hypotheses.

- **[Wedhorn’s continuous-valuation theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Cont/OfIdeal.html#TauCeti.ValuationSpectrum.cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one)** — `Cont A` is exactly the part of `Spv(A,IA)` strictly sub-unit on an ideal of definition; [Corollary 7.12](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Cont/Spectral.html#TauCeti.ValuationSpectrum.spectralSpace_cont_of_pairOfDefinition) makes this locus spectral.

- **[Spectrality of the adic spectrum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition)** — `Spa(A,A⁺)` is spectral because its trace on `Spv(A,IA)` is pro-constructible.

- **[The rational-basis theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.html#TauCeti.ValuationSpectrum.isTopologicalBasis_spaRationalFamily)** — rational subsets form a [quasi-compact](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.html#TauCeti.ValuationSpectrum.isCompact_of_mem_spaRationalFamily) basis [closed under finite intersections](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basic.html#TauCeti.ValuationSpectrum.rationalSubset_inter), and open covers of rational subsets admit [finite rational refinements](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.html#TauCeti.ValuationSpectrum.exists_finite_spaRationalFamily_refinement).

- **[The universal property of completed rational localisation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Completion.html#TauCeti.Huber.PairOfDefinition.existsUnique_continuous_ringHom_completion_locTopology)** — a continuous map that inverts `s` and makes every `t/s` power-bounded factors uniquely and continuously through `A⟨T/s⟩` when the target is complete and Hausdorff.

### Notable definitions and infrastructure

- **[The completed plus ring](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Plus.html#TauCeti.Huber.PairOfDefinition.completedPlusSubring)** — `A_U⁺` is the integral closure of the image of `A⁺[T/s]` in `A⟨T/s⟩`, preparing the Huber-pair coordinates of a rational subset.

- **[Complete separated topological commutative rings](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Basic.html#TauCeti.CompleteSeparatedTopCommRingCat)** — this target category now [has all small limits](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Limits.html#TauCeti.CompleteSeparatedTopCommRingCat.instHasLimits), as required to extend rational coordinates to arbitrary opens.

- **[Strong noetherianness](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/StronglyNoetherian.html#TauCeti.Huber.IsStronglyNoetherian)** — the predicate is defined using completed restricted power-series algebras, with discretely topologised noetherian rings established as examples; the rank-one Tate-algebra and acyclicity theorems remain open.

### Roadmap coverage

Layer 0 remains partial: its Huber-ring and ring-of-definition calculus, weighted and completed restricted series, singleton rational localisation, open mapping, and strong-noetherian definition are present, but the general `T/S` construction, Weierstrass theory and the rank-one strong-noetherian theorem are not. Layer 1 is done. Layer 2 is partial through spectral `Spa`, rational bases, analytic loci and quotient embeddings; plus-ring recovery, the converse emptiness criterion, small-perturbation and iterated-rational results, and classical affinoids are not established here. Layer 3 has a partial 3.1, the complete-separated category with explicit products, equalizers and all small limits, and the abstract rational-cover sheaf criterion, but the localisation-spectrum homeomorphism, structure presheaf, stalk theory and pre-adic spaces are absent. Layers 4–6 are untouched.

## The frontier

- **Rational-localisation spectrum** — prove that the [canonical continuous map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization.html#TauCeti.ValuationSpectrum.spaLocToRationalSubset) `Spa(A_U,A_U⁺) → R(T/s)` is a homeomorphism; only the fact that it lands in `R(T/s)` is established, and valuation and rational-subset identification still depend on this step.

- **Point-detection theorems for `Spa`** — recover `A⁺` from inequalities at all points and prove the missing direction of `Spa(A,A⁺)=∅` exactly when the separated quotient is zero.

- **The structure presheaf** — make rational localisation depend only on the rational subset, define its restriction maps and extend by limits to all opens; then prove local stalks and their residue-field valuations.

- **Tate acyclicity** — establish flatness of rational restriction maps and exactness of augmented Čech complexes for strongly noetherian Tate rings; the predicate and restricted-series algebra alone do not yet give sheafiness.

- **The adic Fargues–Fontaine curve** — pre-adic and adic spaces, gluing, `A_inf`, Frobenius windows, interval rings and the quotient charts remain downstream of the unfinished structure-presheaf and sheafiness layers.

<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"7fbbcda7a64ac5557281d0c3c47cf7fd8aa36d7a","ts":"2026-08-21T21:59:44+00:00"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `7fbbcda` (2026-08-21T21:59:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 and the spectrality of `Spa(A,A⁺)` are complete. Rational-subset topology and ordinary completed rational localisation are substantial but still partial; the localisation chart homeomorphism, structure presheaf, Tate acyclicity, adic-space geometry and Fargues–Fontaine curve have not been established.

### Named results

- **[Spectrality of the valuation spectrum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.html#TauCeti.ValuationSpectrum.instSpectralSpace)** — `Spv A` is spectral through its compact patch presentation.

- **[Wedhorn’s continuous-valuation characterisation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Cont/OfIdeal.html#TauCeti.ValuationSpectrum.cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one)** — continuous valuations are exactly the points of `Spv(A,IA)` that are strictly sub-unit on an ideal of definition; the resulting locus is [spectral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Cont/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemContOfIsHuberRing).

- **[Spectrality of the adic spectrum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.html#TauCeti.ValuationSpectrum.instSpectralSpaceElemSpaOfIsHuberRing)** — `Spa(A,A⁺)` is spectral because its trace in `Spv(A,IA)` is pro-constructible.

- **[The rational-basis theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.html#TauCeti.ValuationSpectrum.isTopologicalBasis_spaRationalFamily)** — rational subsets form a quasi-compact basis closed under finite intersections, and every cover of one has a finite rational refinement.

- **[The universal property of completed rational localisation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Completion.html#TauCeti.Huber.PairOfDefinition.existsUnique_continuous_ringHom_completion_locTopology)** — maps from `A` that invert `s` and make every `t/s` power-bounded extend uniquely and continuously to `A⟨T/s⟩` for complete Hausdorff targets.

### Notable definitions and infrastructure

- **[The completed plus ring](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/LocalizationTopology/Plus.html#TauCeti.Huber.PairOfDefinition.completedPlusSubring)** — `A_U⁺` is the integral closure of the image of `A⁺[T/s]`, providing the intended integral data for a rational chart.

- **[Complete separated topological rings](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Basic.html#TauCeti.CompleteSeparatedTopCommRingCat)** — this target category now has [all small limits](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Limits.html#TauCeti.CompleteSeparatedTopCommRingCat.instHasLimits), supplying the categorical substrate for the structure presheaf.

- **[Restricted series with module coefficients](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/Restricted/PowerSeries.html#TauCeti.Huber.restrictedMvPowerSeriesSubmodule)** — functoriality, preservation of strict surjections and finite-free base change begin the module comparison required for Tate acyclicity, but the finitely generated comparison is not yet an isomorphism.

### Roadmap coverage

- Layer 0 remains partial: boundedness, Huber and Tate rings, completion, weighted and ordinary restricted series, rational one-denominator localisation and open mapping are present; the general many-denominator construction, Weierstrass theory and strong-noetherianity of complete rank-one fields are not established. Layer 1 is complete. Layer 2 has spectral `Spa`, its functoriality, the rational basis, quotient closed embeddings and much of the analytic locus, but not the full plus-ring, emptiness, perturbation and classical-affinoid results. Layer 3 has completed rational localisations, refinement maps, complete-separated limits and the rational-cover sheaf criterion; the chart homeomorphism, actual structure presheaf, stalks and pre-adic spaces are absent. Layer 4 has only initial module-series infrastructure; its sheafiness and Čech theorems are absent. Layers 5 and 6 are untouched.

## The frontier

- **Rational localisation chart** — prove that the canonical map `Spa(A_U,A_U⁺) → R(T/s)` is a homeomorphism with the stated valuation and rational-subset identifications; currently it is only continuous and known to land in the target.

- **Intrinsic affinoid-point results** — finish recovery of `A⁺`, the reverse implication in the emptiness criterion, the complete-case unit criterion in its stated hypotheses, perturbation invariance and rational subsets of rational subsets.

- **Structure presheaf** — use the rational restriction system and complete-separated limits to define sections on all opens, identify rational sections, and construct local stalk valuations.

- **General topological localisation** — extend the one-denominator rational construction to the roadmap’s indexed families of numerator sets and denominators; this is required for the non-Tate `A_inf` applications.

- **Tate acyclicity** — upgrade the module-series comparison to finitely generated modules, then prove flatness of rational restriction maps and exactness of the augmented Čech complex before any sheafiness conclusion.

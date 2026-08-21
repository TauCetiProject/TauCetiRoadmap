<!--tauceti-status:v1 {"roadmap":"AdicSpaces","to_sha":"c9165b9e00ee792a503d99c62a7141257c4c38c8","ts":"2026-08-12T19:46:30Z"}-->
# Status: AdicSpaces

This file documents the status of the AdicSpaces roadmap up until `c9165b9` (2026-08-12T19:46:30Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The valuation-spectrum theory is established through the spectrality of `Spv(A,I)`, and Layer 0 supplies much of the topological algebra needed beneath it. Continuous valuations are genuinely partial, and `Spa`, rational localisation as a completed universal construction, structure sheaves, Tate acyclicity, adic-space geometry and the Fargues–Fontaine curve have not begun.

### Named results

- **[Spectrality of the valuation spectrum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.html#TauCeti.ValuationSpectrum.instSpectralSpace)** — `Spv A` is spectral via a compact patch topology whose clopen basic opens generate the spectral topology.

- **[Spectrality of `Spv(A,I)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/SpvOfIdeal/Spectral.html#TauCeti.ValuationSpectrum.spectralSpace_spvOfIdeal)** — under the roadmap's ideal hypotheses, the ideal-relative valuation spectrum is spectral, with quasi-compact admissible rational opens as a basis.

- **[Spectrality of pro-constructible subspaces](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Spectral/ProConstructible.html#TauCeti.IsProConstructible.spectralSpace)** — every pro-constructible subspace of a spectral space is spectral, providing the transport theorem intended for later `Cont` and `Spa` arguments.

- **[Henkel's open mapping theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/OpenMapping/Henkel.html#TauCeti.HasZeroSequenceOfUnits.isOpenMap)** — a surjective equivariant additive map from a complete first-countable nonarchimedean group to a Baire space is open when the base has a zero sequence of units.

- **[The continuous-valuation inclusion](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/Cont/OfIdeal.html#TauCeti.ValuationSpectrum.cont_subset_spvOfIdeal_extendedIdealOfDefinition)** — every continuous valuation on a Huber ring belongs to `Spv(A,IA)` for the extended ideal of definition; this is only one direction of Wedhorn's Theorem 7.10.

### Notable definitions and infrastructure

- **[Power-bounded elements](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/PowerBounded.html#TauCeti.Huber.powerBoundedSubring)** — the subring `A°` and ideal `A°°`, together with bounded-set calculus and invariance under topological ring isomorphisms, support rings of definition and integral elements.

- **[Weighted restricted power series](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/WeightedRestrictedSeries.html#TauCeti.Huber.weightedRestrictedSubring)** — `A⟨X⟩_T` has its ring topology, functorial maps, dense polynomial subring and [continuous evaluation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Huber/WeightedEval/Continuous.html#TauCeti.Huber.continuous_weightedEvalHom), preparing the non-Tate localisation required later.

- **[The restriction to an ideal](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AdicSpace/RestrictToIdeal.html#TauCeti.ValuationSpectrum.restrictToIdealCodRestrict)** — the map `r_I : Spv A → Spv(A,I)` is a continuous retraction, built from restriction of valuations to the ideal-indexed characteristic subgroup.

### Roadmap coverage

Layer 0 is partial: boundedness and power-boundedness are in place, as are the core Huber/Tate definitions, completion structures, weighted restricted series, the open mapping theorem, and the stated `p`-adic and Laurent-series examples; the full ring-of-definition calculus, general completed topological localisation, strong noetherianness and its restricted-series algebra remain. Layer 1 is complete through 1.4 (`Spv`, its patch proof of spectrality, pro-constructible topology and `Spv(A,I)`), while 1.5 has the continuous locus and only the forward inclusion in Theorem 7.10. Layers 2–6 are untouched.

## The frontier

- **Continuous valuations** — prove the reverse direction of Wedhorn's Theorem 7.10, then closedness and spectrality of `Cont A` and independence from the pair of definition.

- **Completed topological localisation** — finish `A(T/S)` and its separated completion with the universal property for complete Hausdorff targets; the current localisation topology and weighted-series evaluation do not yet supply this object.

- **The adic spectrum** — define `Spa(A,A⁺)` as the bounded continuous locus and prove its pro-constructibility, spectrality and contravariant functoriality; this depends on the completed continuous-valuation step.

- **Rational subsets** — establish their finite-intersection, quasi-compact-basis, refinement and plus-ring results before rational coordinate rings can be attached.

- **The structure presheaf** — construct rational restriction maps and complete separated topological-ring limits; nothing in Layers 3–6 can start in earnest until these are available.

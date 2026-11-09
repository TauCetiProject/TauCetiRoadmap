<!--tauceti-status:v1 {"roadmap":"AdicSpacesPartII","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer R0","remaining":"sheafiness for noetherian rings of definition (R0.2), fibre products (R0.7), finite presentation (R0.6), and R0.8 to R0.14, R0.16 to R0.18, R0.20","state":"partial"},{"id":"Layer R1","state":"untouched"}],"readme_sha":"692b3bdeb99e10c39e08acc426bee9880ebe476a374afaaf9a1f75b9d05dfc21","roadmap":"AdicSpacesPartII","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c"}-->
# Status: AdicSpacesPartII

This file documents the status of the AdicSpacesPartII roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer R0 is partial. Its ring-level inputs are done. Completed tensor products, uniformization and the first morphism classes of adic spaces are largely in place. Huber's sheafiness theorem for a noetherian ring of definition is still missing, and so are fibre products and everything from separatedness to étale morphisms. Layer R1 (analytification) has not begun.

### Named results

- **Huber's Lemma 2.3**: over a Huber ring with a noetherian ring of definition, linear maps of finite modules are strict, and over a complete such ring submodules of finite modules are closed. Completing a finite module is base change to the completion ([`isStrictMap_of_isNoetherianRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Strict.html#TauCeti.Huber.PairOfDefinition.isStrictMap_of_isNoetherianRing), [`ofTensorProduct_bijective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Completion.html#TauCeti.Huber.PairOfDefinition.ofTensorProduct_bijective)).
- **The universal property of the completed tensor product of Huber pairs**: two morphisms into a complete Hausdorff Huber pair that agree on `A` factor uniquely through `(B, B⁺) ⊗̂_A (C, C⁺)` ([`completedTensor.existsUnique_lift`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TensorProduct/Pair.html#TauCeti.Huber.Pair.completedTensor.existsUnique_lift)).
- **Adic morphisms are those that preserve analytic points** (Huber's Proposition 3.2(ii), Wedhorn's Proposition 8.39), built on Wedhorn's Lemma 7.46 for ring maps ([`isAdic_iff_mapsTo_analyticPoints`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Morphisms/Adic.html#TauCeti.AdicSpace.isAdic_iff_mapsTo_analyticPoints), [`isAdicHom_iff_forall_isAnalyticPoint_comap`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/AdicHom.html#TauCeti.ValuationSpectrum.isAdicHom_iff_forall_isAnalyticPoint_comap)).
- **Ascent of noetherian type** (Huber's Corollary 3.4): a ring topologically of finite type over a ring of noetherian type is again of noetherian type ([`IsNoetherianType.of_isTopologicallyFiniteType`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/NoetherianType/TopologicallyFiniteType.html#TauCeti.Huber.IsNoetherianType.of_isTopologicallyFiniteType)).
- **The spectral topology detects uniformity** (Hansen–Kedlaya, Remark 2.11): a Tate ring's spectral topology equals its own topology exactly when the ring is uniform ([`isHomeomorph_toSpectralTop_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TateGauge/Spectral/Topology.html#TauCeti.Huber.SpectralTop.isHomeomorph_toSpectralTop_iff)).

### Notable definitions and infrastructure

- **The completed tensor product of Huber pairs** ([`Huber.Pair.completedTensor`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TensorProduct/Pair.html#TauCeti.Huber.Pair.completedTensor)) has its plus ring, functoriality, symmetry, [cancellation of base change](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TensorProduct/BaseChange.html#TauCeti.Huber.CompletedTensor.cancelBaseChange) and the comparison with adic completion. Fibre products of affinoids will be built on it.
- **The uniformization** ([`Huber.Pair.uniformization`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TateGauge/Spectral/Uniformization.html#TauCeti.Huber.Pair.uniformization)) of a Tate Huber pair is defined, with its universal property for uniform targets. It yields the [uniform completed tensor product](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TensorProduct/Uniform.html#TauCeti.Huber.Pair.uniformCompletedTensor) needed in uniform settings.
- **Morphism and space classes**: [adic morphisms](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Morphisms/Adic.html#TauCeti.AdicSpace.IsAdic), quasi-compact morphisms, morphisms locally of weakly finite type and [locally noetherian adic spaces](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/LocallyNoetherian.html#TauCeti.AdicSpace.IsLocallyNoetherian). On a noetherian-type `Spa(A, A⁺)`, the rational opens are noetherian affinoids. These are the hypotheses the later morphism theory is stated in.

### Roadmap coverage

R0.0, R0.1a, R0.1b and the ring-level inputs R0.1 are done. R0.2 is partial: every listed input is there, including the blow-up, the topologised and filtered Čech complex, and the completed complex. The Artin–Rees strictness of the algebraic complex, the refinement by standard rational coverings and the sheafiness theorem itself are not. R0.3 is partial: the Huber-pair construction and its basic API are done. The theorems that completed base change along topologically finite type maps preserves noetherian type, and that it commutes with rational localisation, were not found. R0.4 has its listed constructions, from the norm of a Tate ring to the uniform completed tensor product. R0.5 has the Banach-module completed tensor product with its universal property, functoriality, unit isomorphism and the finite projective case. R0.6 is partial: it has the adic, quasi-compact, weakly finite type and locally noetherian classes, but finite presentation and locally Huber-standard spaces are missing. R0.7 has only the amalgamation of valuations on tensor products. R0.15 has the definition of continuous differentials, and R0.19 has constructible-topology, spectral-limit, Pro and qcqs-topos foundations. Nothing has landed for R0.8–R0.14, R0.16–R0.18 or R0.20. R1 is untouched.

## The frontier

- **Strictness of the algebraic Čech complex**: use the blow-up charts and Artin–Rees to prove the filtered differentials strict. Completing strict exact complexes then gives exactness of the completed complex.
- **Huber's sheafiness theorem, noetherian ring of definition**: combine that exactness with refinement by standard rational coverings, then deduce stable sheafiness for rings of noetherian type. This would close R0.2.
- **Finishing R0.3**: completed base change along topologically finite type maps preserves noetherian type, and rational localisation commutes with completed tensor products. The presentation and kernel results already proved are the inputs.
- **Fibre products (R0.7)**: identify the completed tensor product of affinoids with their fibre product, then glue to get fibre products along morphisms locally of finite type. Sheafiness of the tensor charts is the real prerequisite.
- **Finite presentation and locally Huber-standard spaces (R0.6)**: these remaining finiteness classes gate unramified, smooth and étale morphisms, which also need continuous differentials beyond their definition.

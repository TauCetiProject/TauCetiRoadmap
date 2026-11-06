<!--tauceti-status:v1 {"roadmap":"AdicSpacesPartII","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer R0","remaining":"Artin-Rees strictness and sheafiness (R0.2), the Huber-pair completed tensor product (R0.3), and R0.4 to R0.20 from Banach modules to tilde-limits","state":"partial"},{"id":"Layer R1","state":"untouched"}],"readme_sha":"63ef7252bd74856f163f4262b99fc0f390076b24f6270414d27ecedc707f7698","roadmap":"AdicSpacesPartII","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd"}-->
# Status: AdicSpacesPartII

This file documents the status of the AdicSpacesPartII roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer R0 is partly done, and only at the ring level. Nearly every input to Huber's sheafiness theorem for noetherian rings of definition is proved, including the submodule blow-up and the topology on the completed Čech complex, but the strictness argument and the theorem itself are not. Work on completed tensor products (R0.3) has begun. R0.4–R0.20 and all of Layer R1 are untouched.

### Named results

- **Exactness of the Čech complex of localizations**: if `f₁, …, fₙ` generate the unit ideal, the extended alternating Čech complex of a module's localizations is exact. This is the algebraic complex that Huber completes ([`cechComplexLocalization_exact`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/LocalizedModule/Cech.html#TauCeti.cechComplexLocalization_exact)).
- **Completion preserves strict exact sequences**: an exact sequence of strict maps of nonarchimedean groups stays exact after completion, provided the source is first countable ([`AddMonoidHom.exact_completion`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Nonarchimedean/Completion/Strict.html#AddMonoidHom.exact_completion)).
- **Huber's Lemma 2.3**: over a Huber ring with a noetherian ring of definition, linear maps of finite modules are strict. Over a complete such ring every submodule of a finite module is closed. Completing a finite module is base change to the completed ring, through a homeomorphism ([`isStrictMap_of_isNoetherianRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Strict.html#TauCeti.Huber.PairOfDefinition.isStrictMap_of_isNoetherianRing), [`isClosed_of_isNoetherianRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Complete.html#TauCeti.Huber.PairOfDefinition.isClosed_of_isNoetherianRing), [`ofTensorProduct_bijective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Completion.html#TauCeti.Huber.PairOfDefinition.ofTensorProduct_bijective)).
- **The blow-up of a finitely generated submodule is proper**: `Proj(⊕ Jⁿ Tⁿ)` is proper and noetherian over a noetherian base, and its standard opens are the spectra of the chart rings `C[F/S]` ([`isProper_toSpec`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Blowup/Submodule.html#TauCeti.AlgebraicGeometry.submoduleBlowup.isProper_toSpec), [`basicOpenIsoSpec`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Blowup/Submodule.html#TauCeti.AlgebraicGeometry.submoduleBlowup.basicOpenIsoSpec)).
- **Noetherianity of complete rings**: a ring that is complete for a finitely generated ideal `I` is noetherian once `R ⧸ I` is (EGA 0, 7.2.6), so adic completions of noetherian rings are noetherian ([`Ideal.isNoetherianRing_of_isAdicComplete`](https://taucetiproject.org/docs/TauCeti/RingTheory/AdicCompletion/Noetherian.html#Ideal.isNoetherianRing_of_isAdicComplete)).

### Notable definitions and infrastructure

- **Huber rings of noetherian type** ([`Huber.IsNoetherianType`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/NoetherianType/Basic.html#TauCeti.Huber.IsNoetherianType)) are the hypothesis for sheafiness and for locally noetherian adic spaces. The class is stable under completion and quotients, and in a complete ring of this type every ideal is closed.
- **The topologised Čech complex of rational localizations.** [Huber's filtration](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/NoetherianCech/Topology.html#TauCeti.Huber.NoetherianCech.filtration) gives each term its natural topology, the differentials are continuous, and the [completed complex](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/NoetherianCech/Completion.html#TauCeti.Huber.NoetherianCech.completedTerm) is defined. The sheafiness theorem will be stated on this complex.
- **The tensor topology** ([`Huber.tensorTopology`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TensorProduct/Topology.html#TauCeti.Huber.tensorTopology)) makes `B ⊗_A C` a Huber ring with adic coprojections whenever both structure maps are adic, and it is independent of the chosen pairs of definition. The library also has its separated completion `CompletedTensor` as a complete Hausdorff Huber ring with a continuous universal property, but without plus rings.

### Roadmap coverage

In R0, locally spectral spaces (R0.0), adic rings of finite ideal type (R0.1a) and noetherian adic completions (R0.1b) are done. The ring-level layer R0.1 is partial: noetherian type, the standing class and adic homomorphisms are in place, but ascent of noetherian type along topologically finite type maps and the analytic-point characterisation of adic homomorphisms are not. R0.2 is partial. It has every listed input, from Čech exactness to the blow-up, and the completed Čech complex, but not the Artin–Rees strictness of the algebraic complex, the refinement by standard rational coverings, or the sheafiness theorem. R0.3 is partial: the topology and the ring-level completion exist, but the Huber-pair construction with its plus ring, functoriality, symmetry, cancellation of base change and the adic-ring comparison do not. R0.4–R0.20 are untouched, and so is R1.

## The frontier

- **Strictness of the algebraic Čech complex**: use the blow-up charts and Artin–Rees to show that the differentials of the topologised rational-localization complex are strict. Completion of strict exact complexes then yields exactness of the completed complex.
- **Huber's sheafiness theorem, noetherian ring of definition**: combine that exactness with refinement of open coverings by standard rational coverings. The Tate case already exists, so this would close R0.2.
- **Completed tensor product of Huber pairs (R0.3)**: add the plus ring (closure of the integral closure of the image of `B⁺ ⊗ C⁺`), `map`, `comm`, cancellation of base change and the comparison with adic completion for adic rings. Fibre products (R0.7) wait on this.
- **Ascent of noetherian type**: show that a complete ring topologically of finite type over a ring of noetherian type is again of noetherian type. This is the remaining R0.1 statement that sheafiness for such rings needs.
- **Adic morphisms and finiteness classes (R0.6)**: affinoid charts and the adic, weakly finite type and finite presentation predicates on adic spaces, built on the ring-level adic homomorphisms.

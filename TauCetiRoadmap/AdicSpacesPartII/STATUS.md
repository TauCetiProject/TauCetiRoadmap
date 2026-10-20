<!--tauceti-status:v1 {"roadmap":"AdicSpacesPartII","to_sha":"9fc5d5a87d00cb696e606ccdae66420cc837c05e","ts":"2026-10-19T21:24:00Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer R0","remaining":"sheafiness for a noetherian ring of definition, completed tensor products, fibre products and all morphism classes (R0.3 to R0.20)","state":"partial"},{"id":"Layer R1","state":"unassessed"}],"readme_sha":"63ef7252bd74856f163f4262b99fc0f390076b24f6270414d27ecedc707f7698","roadmap":"AdicSpacesPartII","to_sha":"9fc5d5a87d00cb696e606ccdae66420cc837c05e"}-->
# Status: AdicSpacesPartII

This file documents the status of the AdicSpacesPartII roadmap up until `9fc5d5a` (2026-10-19T21:24:00Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The opening of layer R0 is in place: locally spectral topology (R0.0), adic rings and noetherianity of adic completions (R0.1a, R0.1b) and much of the ring-level vocabulary of R0.1. The first module-theoretic lemmas of Huber's sheafiness proof (R0.2) have also landed. Sheafiness itself, completed tensor products, fibre products and all the morphism classes are still to come. Nothing for R1 appears in the supplied material.

### Named results

- **Noetherianity of complete rings** — a ring complete for a finitely generated ideal `I` is noetherian as soon as `R ⧸ I` is (EGA 0, 7.2.6): [`Ideal.isNoetherianRing_of_isAdicComplete`](https://taucetiproject.org/docs/TauCeti/RingTheory/AdicCompletion/Noetherian.html#Ideal.isNoetherianRing_of_isAdicComplete).
- **Completion of a noetherian adic ring is noetherian** — the separated completion of a noetherian ring with an adic topology is noetherian (EGA 0, 7.3.1), and it is adic and complete for the extended ideal: [`IsAdic.isNoetherianRing_completion`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Completion/Noetherian.html#IsAdic.isNoetherianRing_completion). Applied to Huber rings, it shows that completion preserves noetherian type ([`IsNoetherianType.completion`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Completion/Noetherian.html#TauCeti.Huber.IsNoetherianType.completion)).
- **Huber's Lemma 2.3(i)** — over a Huber ring with a noetherian ring of definition, complete or not, every linear map between finite modules with their natural topologies is strict: [`PairOfDefinition.isStrictMap_of_isNoetherianRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Strict.html#TauCeti.Huber.PairOfDefinition.isStrictMap_of_isNoetherianRing).
- **Huber's Lemma 2.3(ii), closedness part** — over a complete such ring, finite modules are Hausdorff and every submodule is closed: [`PairOfDefinition.isClosed_of_isNoetherianRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Complete.html#TauCeti.Huber.PairOfDefinition.isClosed_of_isNoetherianRing).
- **Completion preserves strict exact sequences** — for nonarchimedean groups with first-countable source, an exact sequence of strict maps stays exact after separated completion: [`AddMonoidHom.exact_completion`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Nonarchimedean/Completion/Strict.html#AddMonoidHom.exact_completion).

### Notable definitions and infrastructure

- **Huber rings of noetherian type and Huber's standing class.** [`IsNoetherianType`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/NoetherianType/Basic.html#TauCeti.Huber.IsNoetherianType) is the hypothesis of the sheafiness theorem: a noetherian ring of definition, or a strongly noetherian Tate ring. [`IsHuberStandard`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/NoetherianType/HuberStandard.html#TauCeti.Huber.IsHuberStandard) is the narrower class under which the étale theory will be developed. Both cover discrete rings, and the standing class is shown to sit inside noetherian type.
- **Adic homomorphisms.** [`IsAdicHom`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/AdicHom/Basic.html#TauCeti.Huber.IsAdicHom) has the intrinsic criterion (continuous and preserving open ideals), composition and cancellation, the Tate and discrete cases, and adicness of completion and of topologically finite type maps. This is what adic morphisms of spaces and completed tensor products will be built on.
- **Locally spectral spaces and maps.** [`IsLocallySpectralSpace`](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/LocallySpectral.html#TauCeti.IsLocallySpectralSpace) and [`IsLocallySpectralMap`](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/LocallySpectral.html#TauCeti.IsLocallySpectralMap) come with the characterisation of spectral spaces as quasicompact, quasiseparated locally spectral spaces. The relative notion agrees with Mathlib's spectral maps on spectral spaces, can be tested on one cover, and is closed under composition through a locally spectral middle space.

### Roadmap coverage

R0.0 looks complete: every theorem the README asks for is present. R0.1a has the class [`IsAdicRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/AdicRing/Basic.html#TauCeti.IsAdicRing) and the facts about ideals of definition, radicals and continuity. The quotient clause and the complete-local-ring clause are not established here. R0.1b is done in substance (both noetherianity statements), although not under the README's suggested name `IsAdicRing.adicCompletion`. R0.1 is partial. Noetherian type, the standing class, adic homomorphisms and completion of noetherian type have landed. Still open are the Tate equivalence `IsNoetherianType.isStronglyNoetherian`, ascent along topologically finite type maps, closedness of ideals and stable sheafiness. R0.2 is partial: Lemma 2.3(i), the closedness and Hausdorff half of 2.3(ii), and the completion lemma for strict exact sequences. The Čech complex of localisations, the submodule blow-up and the sheafiness theorem are untouched. Nothing is established here for R0.3 to R0.20 or for R1.

## The frontier

- **Huber's Lemma 2.3(ii), completeness** — finite modules over a complete Huber ring with a noetherian ring of definition are complete, and spanning lattices are `I`-adically complete. Openness of spanning lattices and adic completeness of the ring of definition are already here.
- **Closed ideals and noetherian quotients** — `IsNoetherianType.isClosed_ideal` and the quotient statement. The noetherian-ring-of-definition case should follow from the closedness result above.
- **Ascent along topologically finite type maps** — `IsNoetherianType.of_isTopologicallyFiniteType`. It needs the completion results now in place, together with the adicness of topologically finite type maps.
- **Sheafiness for a noetherian ring of definition** — Huber94 Theorem 2.2, Case I. It still needs the exact Čech complex of localisations, the complex form of the strict-completion lemma, and the submodule blow-up with its Artin-Rees estimates.
- **Completed tensor products** (R0.3). These can now be stated, since adic homomorphisms are available, and they are the gateway to fibre products and the morphism classes.

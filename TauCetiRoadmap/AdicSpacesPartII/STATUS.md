<!--tauceti-status:v1 {"roadmap":"AdicSpacesPartII","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer R0","remaining":"sheafiness for noetherian rings of definition, completed tensor products, fibre products and all morphism classes (R0.2 onward)","state":"partial"},{"id":"Layer R1","state":"untouched"}],"readme_sha":"63ef7252bd74856f163f4262b99fc0f390076b24f6270414d27ecedc707f7698","roadmap":"AdicSpacesPartII","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5"}-->
# Status: AdicSpacesPartII

This file documents the status of the AdicSpacesPartII roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer R0 has begun at its ring-level base. The definitions and algebra behind Huber's sheafiness theorem for noetherian rings of definition (R0.0–R0.1b, plus several inputs for R0.2) are largely in place, but the sheafiness theorem itself is not. Nothing from completed tensor products onward (R0.3–R0.20) has landed, and Layer R1, analytification and the rigid–adic comparison, is untouched.

### Named results

- **Exactness of the Čech complex of localizations** — if `f₁, …, fₙ` generate the unit ideal, the extended alternating Čech complex of a module's localizations is exact. This is the algebraic complex Huber completes in his sheafiness proof ([`cechComplexLocalization_exact`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/LocalizedModule/Cech.html#TauCeti.cechComplexLocalization_exact)).
- **Completion preserves strict exact sequences** — an exact sequence of strict maps of nonarchimedean groups stays exact after completion, provided the source is first countable ([`AddMonoidHom.exact_completion`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Nonarchimedean/Completion/Strict.html#AddMonoidHom.exact_completion)).
- **Huber's Lemma 2.3** — over a Huber ring with a noetherian ring of definition, linear maps of finite modules are strict, and over a complete such ring every submodule of a finite module is closed ([`isStrictMap_of_isNoetherianRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Strict.html#TauCeti.Huber.PairOfDefinition.isStrictMap_of_isNoetherianRing), [`isClosed_of_isNoetherianRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Complete.html#TauCeti.Huber.PairOfDefinition.isClosed_of_isNoetherianRing)).
- **Noetherianity of complete rings** — a ring that is complete for a finitely generated ideal `I` is noetherian once `R ⧸ I` is (EGA 0, 7.2.6), and so adic completions of noetherian rings are noetherian ([`Ideal.isNoetherianRing_of_isAdicComplete`](https://taucetiproject.org/docs/TauCeti/RingTheory/AdicCompletion/Noetherian.html#Ideal.isNoetherianRing_of_isAdicComplete)).
- **Ideals of complete noetherian-type rings are closed** — so quotients of a complete Huber ring of noetherian type are again complete, Hausdorff and of noetherian type ([`IsNoetherianType.isClosed_ideal`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/NoetherianType/Quotient.html#TauCeti.Huber.IsNoetherianType.isClosed_ideal)).

### Notable definitions and infrastructure

- **Huber rings of noetherian type** ([`Huber.IsNoetherianType`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/NoetherianType/Basic.html#TauCeti.Huber.IsNoetherianType)) are the rings with a noetherian ring of definition, together with the strongly noetherian Tate rings. This is the hypothesis for sheafiness and for locally noetherian adic spaces. It is stable under [completion](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Completion/Noetherian.html#TauCeti.Huber.IsNoetherianType.completion), and Huber's narrower [standing class](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/NoetherianType/HuberStandard.html#TauCeti.Huber.IsHuberStandard) sits inside it, ready for the étale theory.
- **Adic homomorphisms** ([`Huber.IsAdicHom`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/AdicHom/Basic.html#TauCeti.Huber.IsAdicHom)) are characterised intrinsically as the continuous maps that preserve open ideals. Every topologically finite type map is adic, which is what the adic-morphism and finite-type classes of R0.6 will build on.
- **Locally spectral spaces and maps** ([`IsLocallySpectralSpace`](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/LocallySpectral.html#TauCeti.IsLocallySpectralSpace)) come with their comparison to spectral spaces and maps. They give the topological setting for the underlying spaces of adic morphisms.

### Roadmap coverage

In R0, the opening subsections are essentially done: locally spectral spaces and maps (R0.0), adic rings of finite ideal type (R0.1a) and noetherian adic completions (R0.1b). The R0.1 ring-level layer is partial. Noetherian type, the standing class, adic homomorphisms and closedness of ideals are proved, but ascent of noetherian type along topologically finite type maps and the analytic-point characterisation of adic homomorphisms are not. R0.2 has its Čech, strictness, Artin–Rees and open-subring inputs, but neither the blow-up step nor the sheafiness theorem. R0.3 through R0.20 are untouched, from completed tensor products to tilde-limits. Pro-constructible sets and parts of the constructible topology exist elsewhere in the library, but the R0.19 targets themselves do not. R1 is untouched.

## The frontier

- **Ascent of noetherian type** — show that a complete ring topologically of finite type over a ring of noetherian type is again of noetherian type. This is the last R0.1 statement the sheafiness proof needs.
- **Huber's sheafiness theorem, noetherian ring of definition** — combine the Čech exactness, strictness and completion results with the Artin–Rees blow-up `Proj(⊕ Jⁿ)` to make the completed Čech complex exact on rational coverings. The blow-up step is the main missing piece.
- **Completed tensor products of Huber pairs (R0.3)** — the construction with its topology, plus ring and universal property. Fibre products and every morphism class after R0.6 depend on it.
- **Adic morphisms and finiteness classes (R0.6)** — affinoid charts and the adic, weakly finite type and finite presentation predicates on adic spaces, now that the ring-level adic homomorphisms exist.
- **The constructible topology is profinite (R0.19.1)** — Hausdorffness and total disconnectedness of a spectral space in its constructible topology. This is self-contained and can be done in parallel with the rest.

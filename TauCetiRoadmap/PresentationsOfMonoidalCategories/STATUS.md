<!--tauceti-status:v1 {"roadmap":"PresentationsOfMonoidalCategories","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.2 relabeling and base change (FSymbols.reindex, FSymbols.map, and for RSymbols) with their functoriality lemmas","state":"partial"},{"id":"Layer 1","remaining":"the model category Model P and its MonoidalCategory instance from the F-symbols","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"49aa2797d5194146626ef5ea5e30aea08047474fc0c7f5f22f7634eae63d0966","roadmap":"PresentationsOfMonoidalCategories","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: PresentationsOfMonoidalCategories

This file documents the status of the PresentationsOfMonoidalCategories roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, the algebraic data, is mostly in place: fusion rules, F-symbols and R-symbols are defined, and invertibility is shown to force associativity and commutativity of the multiplicities. Relabeling and base change are missing, and nothing from the constructed category (Layer 1) onwards has begun.

### Named results

- **Associativity of the fusion rules** — over a nontrivial commutative semiring, the existence of F-symbols forces `Σ_e N_{ab}^e N_{ec}^d = Σ_f N_{bc}^f N_{af}^d`, since the invertible matrix `F^{abc}_d` must be square ([`FSymbols.N_assoc`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/FSymbols/Basic.html#TauCeti.FSymbols.N_assoc)).
- **Commutativity of the fusion rules** — the existence of R-symbols forces `N_{ab}^c = N_{ba}^c` by the same counting argument ([`RSymbols.N_comm`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/FSymbols/Basic.html#TauCeti.RSymbols.N_comm)).
- **Braidability of group fusion rules** — for a finite monoid, the all-ones F-symbols carry R-symbols exactly when the monoid is commutative, so in particular the fusion rules of `S₃` carry none ([`RSymbols.nonempty_ofMul_iff`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/FSymbols/Basic.html#TauCeti.RSymbols.nonempty_ofMul_iff)).
- **Uniqueness for a single simple object** — with one simple object, there is exactly one choice of F-symbols and of R-symbols over any commutative semiring, the one with every entry `1` ([`FSymbols.instUnique`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/FSymbols/Basic.html#TauCeti.FSymbols.instUnique)).

### Notable definitions and infrastructure

- **F-symbols** ([`TauCeti.FSymbols`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/FSymbols/Defs.html#TauCeti.FSymbols)) — invertible matrices indexed by the left and right fusion-basis triples, satisfying the pentagon and triangle equations. These are the input to the model category of Layer 1 and the output of extraction in Layer 2. Since inverses are unique, they are determined by `F` alone.
- **R-symbols** ([`TauCeti.RSymbols`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/FSymbols/Defs.html#TauCeti.RSymbols)) — invertible matrices `R^{ab}_c` satisfying the two hexagon equations against given F-symbols. They are the data from which Layer 4 will build braidings.
- **Group fusion rules** ([`FusionRules.ofMul`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/FSymbols/Basic.html#TauCeti.FusionRules.ofMul)) — `N_{gh}^l = [gh = l]` for a type with multiplication and unit, with all-ones F-symbols. This is the first family of examples, and the starting point for comparing with `Vec^ω_G` in Layer 3.4.

### Roadmap coverage

Layer 0 is partial. Subsection 0.1 (the three structures with `ext`) and 0.3 (associativity and commutativity of `N`) are done, and so are the checks for one simple object, the zero ring, and the general obstruction for noncommuting group labels that covers the `S₃` check. Subsection 0.2, `reindex` along relabelings and `map` along ring homomorphisms with their functoriality, is absent, as are the `ℤ/2` pentagon and hexagon checks. Layers 1 to 6 (the model category, extraction and reconstruction, gauge classification, braidings, rigidity, and pivotal and spherical structures) are untouched.

## The frontier

- **Relabeling and base change (0.2)** — `FSymbols.reindex` and `FSymbols.map`, and the same for `RSymbols`, with identity, composition and commutation lemmas. The axioms are polynomial identities, so this needs only Layer 0.1.
- **The model category (1.1)** — `FSymbols.Model P` built from grade-wise matrices over `Mat R`, with its `Preadditive`, `Linear R` and finite-biproduct structure and the simple objects `Model.simple a`.
- **The monoidal structure (1.2)** — the main theorem of Layer 1: `MonoidalCategory (Model P)` through `MonoidalCategory.ofTensorHom`, with associator entries read from `F` and `Finv`. Everything in Layers 2–6 depends on it.
- **The `ℤ/2` and semion examples** — the Layer 0 checks that the pentagon forces `(F^{111}_1)² = 1`, and that `F^{111}_1 = −1` has no R-symbols over `ℤ`. These would test the index conventions before the model is built on them.
- **Split simple families (2.1)** — Layer 2 needs PivotalSpherical's `IsSplitSimpleFamily` and its dual-basis results. Its status should be confirmed before extraction is attempted.

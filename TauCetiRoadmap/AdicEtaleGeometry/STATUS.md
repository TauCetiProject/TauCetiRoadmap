<!--tauceti-status:v1 {"roadmap":"AdicEtaleGeometry","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A0","remaining":"A0.1-A0.7, and in A0.8 the open adic subspace of analytic points with restriction of adic morphisms","state":"partial"},{"id":"Layer A1","remaining":"A1.0.2, object descent in A1.0.3, A1.0.4-5, A1.1, A1.2 fibres and base change, A1.3 onward","state":"partial"},{"id":"Layer A2","state":"untouched"},{"id":"Layer A3","remaining":"A3.1 comparison with the bundled predicate, fpd modules, two-out-of-three, sheaves; all of A3.2","state":"partial"},{"id":"Layer A4","remaining":"everything from finite étale torsors (A4.2) on; only the shared split-ring vocabulary of A4.1 exists","state":"partial"}],"readme_sha":"eff8e4260e91403aa0f1a314ace292c30247853485c065a4cf43bc885fcd6752","roadmap":"AdicEtaleGeometry","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127"}-->
# Status: AdicEtaleGeometry

This file documents the status of the AdicEtaleGeometry roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The first finite étale results are in place: the split-ring vocabulary, its Checks, and henselian colimits. They now extend to the Huber pair of a finite algebra, with its universal property. Layers A0 and A3 have their first point-set and algebraic foundations. The completed pushout, the classical analytic geometry of A2 and the torsor towers of A4 have not begun.

### Named results

- **The universal property of the Huber pair of a finite algebra** — for a finite `A`-algebra `B` with its natural topology, morphisms of Huber pairs `(B, B⁺) → (D, D⁺)` under `(A, A⁺)` are exactly the `A`-algebra maps `B → D` ([`finiteAlgebra.homEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/Pair.html#TauCeti.Huber.Pair.finiteAlgebra.homEquiv)). Here `B⁺` is the integral closure of the image of `A⁺`, and no completeness is assumed.
- **Finite algebras over Tate rings are Tate** — a finite algebra with its natural topology over a Tate ring is again Tate, with the image of a pseudouniformiser as pseudouniformiser ([`IsTateRing.of_isModuleTopology`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/ModuleTopology/FiniteAlgebra.html#TauCeti.Huber.IsTateRing.of_isModuleTopology)).
- **The section criterion for split rings** — a ring has no nonsplit finite étale covers exactly when every faithfully flat finite étale algebra over it has a section ([`isFiniteEtaleSplit_iff_exists_section`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/FiniteEtaleSplit.html#TauCeti.isFiniteEtaleSplit_iff_exists_section)). This is the form in which Scholze's Lemma 15.3 is used.
- **Strictly henselian rings split** — a henselian local ring with separably closed residue field has no nonsplit finite étale covers ([`IsFiniteEtaleSplit.of_henselianLocalRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Henselian/Etale.html#TauCeti.IsFiniteEtaleSplit.of_henselianLocalRing)). So the notion is not confined to fields.
- **Henselian pairs under directed colimits** — a directed colimit of henselian pairs is henselian along the colimit ideal ([`Ring.DirectLimit.henselianRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Henselian/DirectLimit.html#Ring.DirectLimit.henselianRing)).

### Notable definitions and infrastructure

- **Rings without nonsplit finite étale covers** ([`IsFiniteEtaleSplit`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/FiniteEtaleSplit.html#TauCeti.IsFiniteEtaleSplit)) are the class A4's torsor tower is built to reach. They are closed under products, and they are invariant under any ring map along which base change of finite étale algebras is full and essentially surjective.
- **Pseudocoherent modules** ([`IsPseudoCoherentOver`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/PseudoCoherent.html#TauCeti.Huber.IsPseudoCoherentOver)) are defined by finite free resolutions exact up to a given degree. A one-degree-at-a-time criterion through kernels of surjections makes later induction on the degree possible.
- **Analytic points of a pre-adic space** ([`PreAdicSpace.analyticPoints`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Analytic.html#TauCeti.PreAdicSpace.analyticPoints)) are the points with a neighbourhood whose sections contain a topologically nilpotent unit. They form an open set, compatible with restriction, that agrees with the analytic locus on `Spa(A, A⁺)`.

### Roadmap coverage

- **A1 is partial.**
  - A1.0.0, including all its Checks, and A1.0.1 are done.
  - A1.0.3 has its morphism half: maps from finitely presented algebras descend to a finite stage, and base change commutes with directed colimits. Object descent is missing.
  - A1.2 has the pair `(B, B⁺)`, the finite étale morphism predicate and the universal property. Finiteness of the morphism, the fibre bound, surjectivity on spectra and base change are missing.
  - A1.0.2, A1.0.4–A1.0.5, A1.1 beyond the library's existing strongly sheafy definition, and A1.3 onward have not started.
- **A0 is partial.** Only the point-set part of A0.8 exists: analytic points, their openness, restriction, and the comparison on `Spa`. A0.1–A0.7 are untouched.
- **A3 is partial.** The first target of A3.1 is partly done: the definition, the degree 0 and 1 identifications, `top_iff`, `mono`, the projective and noetherian cases, and kernels. Missing are the comparison with the bundled predicate, `Module.IsFPD`, tensor and base change, two-out-of-three, the sheaf theory, and all of A3.2.
- **A2 is untouched.**
- **A4 is partial only in name.** A4.1 points to A1.0.0, and nothing from A4.2 on exists.

## The frontier

- **Object descent of finite étale algebras (A1.0.3)** — show that every finite étale algebra over a directed colimit comes from a finite stage. Morphism descent is in place. Together with the full-and-essentially-surjective invariance, object descent then gives A1.0.3a.
- **Power-bounded henselian pairs (A1.0.2)** — `(A°, ϖA°)` is henselian for a complete Tate ring, by writing `A°` as the directed union of rings of definition. Its colimit prerequisite is done.
- **The rest of the finite étale Huber pair (A1.2)** — finiteness of `(A, A⁺) → (B, B⁺)`, fibres of `Spa` bounded by the rank, and surjectivity for faithfully flat `B`. The base-change isomorphism needs AdicSpacesPartII's completed tensor product of pairs.
- **The analytic locus as an adic space (A0.8)** — package the open set of analytic points as an open adic subspace, and restrict adic morphisms to it. The pullback of analytic points along adic maps is already proved.
- **Pseudocoherence calculus (A3.1)** — two-out-of-three for short exact sequences, `Module.IsFPD`, and flat base change, ahead of pseudocoherent sheaves.

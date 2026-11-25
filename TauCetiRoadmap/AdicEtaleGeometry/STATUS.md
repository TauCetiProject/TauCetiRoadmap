<!--tauceti-status:v1 {"roadmap":"AdicEtaleGeometry","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A0","remaining":"A0.2, A0.4, base change of the analytic locus, geometric symmetry and unit in A0.7, rational clause of A0.6","state":"partial"},{"id":"Layer A1","remaining":"A1.0.3a, Elkik in A1.0.4 and A1.0.5, A1.1 stability, strong sheafiness in A1.2, local-to-global and étale morphisms in A1.3, A1.4 onward","state":"partial"},{"id":"Layer A2","remaining":"A2.1, and A2.4 onward","state":"partial"},{"id":"Layer A3","remaining":"pseudo-flatness and pseudocoherent sheaves in A3.1; presentation transport, Newton functoriality and standard étale presentations in A3.2","state":"partial"},{"id":"Layer A4","remaining":"the torsor tower in A4.3, A4.4, A4.5, the completed tower in A4.7","state":"partial"}],"readme_sha":"a7af882f268f448293f4d6ff99cdb54c78e1d24da9b4d77928644617288d9e35","roadmap":"AdicEtaleGeometry","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: AdicEtaleGeometry

This file documents the status of the AdicEtaleGeometry roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer has begun and none is finished. The algebra under A1 and A4 is largely in place: split rings, henselian `A°`, colimit descent, finite étale torsors and now the splitting torsor. Finite étale morphisms of adic spaces exist but étale morphisms, the sites, Elkik's theorem, the torsor tower and the sheaf theory of A3 have not begun.

### Named results

- **The splitting torsor** — every finite étale algebra over a commutative ring becomes totally split over some finite étale `S_n`-torsor, the ring-theoretic Galois closure ([`exists_perm_isFiniteEtaleTorsor_isTotallySplit`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Torsor/Splitting.html#TauCeti.Algebra.exists_perm_isFiniteEtaleTorsor_isTotallySplit)).
- **The Chase–Harrison–Rosenberg theorem** — an algebra with a finite group action is a finite étale torsor exactly when the base is the ring of invariants and the action is free ([`isFiniteEtaleTorsor_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Torsor/Basic.html#TauCeti.Algebra.isFiniteEtaleTorsor_iff)).
- **Morphisms into an affinoid** — Huber's Proposition 2.1(ii): morphisms from an adic space `X` to `Spa(A, A⁺)` are the continuous ring maps `A → 𝒪_X(X)` carrying `A⁺` into integral sections ([`homSpaEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Affinoid/Hom/Spa.html#TauCeti.AdicSpace.homSpaEquiv)).
- **The adic spectrum of a torsor is a quotient** — for a finite étale `G`-torsor over a Tate ring, `Spa(A, A⁺)` is the orbit space of `Spa(B, B⁺)`, and the projection is open and surjective ([`spaComap_orbits_of_isFiniteEtaleTorsor`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Torsor.html#TauCeti.Huber.Pair.Hom.spaComap_orbits_of_isFiniteEtaleTorsor)).
- **Surjectivity of finite étale Huber pairs** — over a complete Tate base, `Spa(B, B⁺) → Spa(A, A⁺)` is surjective exactly when `B` is faithfully flat ([`surjective_spaComap_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/FiniteAlgebra.html#TauCeti.Huber.Pair.Hom.IsFiniteEtale.surjective_spaComap_iff)).

### Notable definitions and infrastructure

- **Finite étale morphisms of adic spaces** ([`AdicSpace.IsFiniteEtale`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Morphisms/Finite/Etale.html#TauCeti.AdicSpace.IsFiniteEtale)) are, locally on the target, `Spa` of a finite étale Huber pair over a Tate affinoid. They are finite with finite fibres; the local-to-global theorem and the étale morphisms of A1.3 build on them.
- **Affinoid charts of fibre products** ([`restrictInfIsoCompletedTensor`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Pullback/Chart.html#TauCeti.AdicSpace.restrictInfIsoCompletedTensor)) identify the piece of any fibre product over two affinoid charts with `Spa` of their completed tensor product, when that is sheafy. This is the main clause of A0.6's chart independence.
- **The frame algebra** ([`FrameAlgebra`](https://taucetiproject.org/docs/TauCeti/RingTheory/Unramified/Frame.html#TauCeti.Algebra.FrameAlgebra)), the functions on tuples of distinct points of a finite étale algebra, is the torsor that does the splitting.

### Roadmap coverage

- **A0 is partial.** A0.8 is done apart from base change of the analytic locus. A0.1 has the completed pushout, point lifting, both halves of maps into affinoids, and `Spa` of a completed tensor product as a fibre product of charts. A0.6 has its chart identification, without the rational-localisation clause. A0.3, A0.5 and A0.7 have pieces; A0.7 has the ring-level associator and symmetry but not the geometric isomorphisms. A0.2 and A0.4 are untouched.
- **A1 is partial.** A1.0.0 to A1.0.3 are done. A1.0.3a is missing; A1.0.4 has Gabber–Ramero's Newton lemma but not Elkik's theorem; A1.0.5 is missing. A1.1's strongly sheafy definitions are in the source, but its stability package and rational descent are not established here. A1.2 has the pair, its fibres, surjectivity, base change and finiteness, but not strong sheafiness. A1.2a has uniformity but not the integral-closure clause. A1.3 has finite étale morphisms with locality, finiteness and the affinoid case, but not the local-to-global theorem or étale morphisms. A1.4 onward is untouched.
- **A2 is partial.** A2.2 and A2.3 have the relative polydisc, completed tensor products of polydiscs, the torus locus and the two-torus cover. A2.1 and A2.4 onward are untouched.
- **A3 is partial.** A3.1 has the module theory up to stable pseudocoherence, but not pseudo-flatness or sheaves. A3.2 has parts (a) and (b) of the Newton lemma and invertibility of small perturbations, but no standard étale presentations.
- **A4 is partial.** A4.2 and A4.2a are done, and the splitting torsor of A4.3 is proved; the tower is not. The first target of A4.7 is done. A4.4, A4.5 and the completed tower are untouched.

## The frontier

- **The finite étale torsor tower (A4.3).** Define `FiniteEtaleTorsorTower` and prove its existence. Splitting torsors, torsor transitions between tensor products of torsors, the split-colimit criterion and descent from colimits are all in place.
- **Finite étale morphisms beyond the definition (A1.2 to A1.5).** Strong sheafiness of finite étale algebras, then the local-to-global theorem over strongly sheafy affinoids, étale morphisms, composition and base change.
- **Elkik's approximation theorem (A1.0.4, A1.0.5).** With the Newton lemma proved, Théorèmes 2 and 2 bis remain, followed by invariance of finite étale algebras under henselian completion.
- **Fibre products (A0).** Base change of the analytic locus, the geometric symmetry and unit isomorphisms, the rational clause of chart independence, and pullback along rational open immersions (A0.4).
- **Standard étale presentations (A3.2).** Transport of presentations under perturbation, functoriality of the Newton lemma, and the presentations themselves. Pseudo-flatness opens A3.1's sheaf theory.

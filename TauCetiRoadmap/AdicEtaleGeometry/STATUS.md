<!--tauceti-status:v1 {"roadmap":"AdicEtaleGeometry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A0","remaining":"geometric fibre product and maps into affinoids in A0.1, A0.2, A0.4, A0.6, symmetry and unit in A0.7, base change of the analytic locus","state":"partial"},{"id":"Layer A1","remaining":"A1.0.3a, Elkik A1.0.4 and A1.0.5, A1.1, finiteness and strong sheafiness in A1.2, A1.3 onward","state":"partial"},{"id":"Layer A2","remaining":"A2.1, and A2.4 onward; A2.2 and A2.3 have the polydisc, the torus locus and the two-torus cover","state":"partial"},{"id":"Layer A3","remaining":"pseudo-flatness and pseudocoherent sheaves in A3.1; Newton functoriality and standard étale presentations in A3.2","state":"partial"},{"id":"Layer A4","remaining":"splitting torsor and tower in A4.3, A4.4, A4.5, the completed tower in A4.7","state":"partial"}],"readme_sha":"eff8e4260e91403aa0f1a314ace292c30247853485c065a4cf43bc885fcd6752","roadmap":"AdicEtaleGeometry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: AdicEtaleGeometry

This file documents the status of the AdicEtaleGeometry roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer has now begun. The algebraic foundations of A1 (split rings, henselian pairs, colimit descent) and of A4 (finite étale torsors and their descent) are largely in place, and the finite étale Huber pair has its fibre and surjectivity theory. Finite étale morphisms of adic spaces, the torsor tower and the sheaf theory of A3 have not begun.

### Named results

- **Surjectivity of finite étale Huber pairs** — over a complete Tate base, `Spa(B, B⁺) → Spa(A, A⁺)` is surjective exactly when `B` is faithfully flat, and each fibre has at most as many points as the local rank of `B` ([`surjective_spaComap_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/FiniteAlgebra.html#TauCeti.Huber.Pair.Hom.IsFiniteEtale.surjective_spaComap_iff), [`finite_fibre`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/FiniteAlgebra.html#TauCeti.Huber.Pair.Hom.IsFiniteEtale.finite_fibre)).
- **Power-bounded elements are henselian** — in a complete Tate ring, `A°` is henselian along any pseudouniformiser ([`henselianRing_powerBoundedSubring`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Henselian.html#TauCeti.Huber.henselianRing_powerBoundedSubring)).
- **The Chase–Harrison–Rosenberg theorem** — an algebra with a finite group action is a finite étale torsor exactly when the base is the ring of invariants and the action is free ([`isFiniteEtaleTorsor_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Torsor/Basic.html#TauCeti.Algebra.isFiniteEtaleTorsor_iff)).
- **The adic spectrum of a torsor is a quotient** — for a finite étale `G`-torsor over a Tate ring, `Spa(A, A⁺)` is the orbit space of `Spa(B, B⁺)` under `G`, and the projection is open and surjective ([`spaComap_orbits_of_isFiniteEtaleTorsor`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Torsor.html#TauCeti.Huber.Pair.Hom.spaComap_orbits_of_isFiniteEtaleTorsor)).
- **Newton's method for restricted power series** — a system of integral restricted power series whose Jacobian is invertible up to `ϖᵏ` has a unique zero near any approximate zero ([`existsUnique_weightedEval_eq_zero`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/WeightedEval/Newton.html#TauCeti.Huber.existsUnique_weightedEval_eq_zero)).

### Notable definitions and infrastructure

- **The frame algebra** ([`FrameAlgebra`](https://taucetiproject.org/docs/TauCeti/RingTheory/Unramified/Frame.html#TauCeti.Algebra.FrameAlgebra)) is the ring of functions on tuples of pairwise distinct points of a finite étale algebra. For constant rank `n` it [is an `S_n`-torsor](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Torsor/Frame.html#TauCeti.Algebra.FrameAlgebra.isFiniteEtaleTorsor), the main step towards splitting torsors.
- **The analytic locus** ([`AdicSpace.analyticLocus`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Analytic.html#TauCeti.AdicSpace.analyticLocus)) is the open adic subspace on the analytic points. It has a universal property, and adic morphisms restrict to it.
- **Completed pushouts** ([`IsCompletedPushout`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TensorProduct/Pushout.html#TauCeti.Huber.IsCompletedPushout)) express the universal property of completed tensor products for maps into complete pairs. They exist along adic maps, and points lift through them over a Tate base.

### Roadmap coverage

- **A1 is partial.** A1.0.0 through A1.0.3 are done: henselian `A°` closes A1.0.2, and descent of objects from directed colimits closes A1.0.3. A1.0.3a, Elkik's theorem (A1.0.4) and A1.0.5 are missing; A1.0.4 has only groundwork. The first target of A1.2 has the pair, its universal property, the fibre bound, the surjectivity criterion and completed base change. Finiteness of the morphism is not in the supplied material, and strong sheafiness, rational descent, A1.1 and A1.3 onward have not started.
- **A4 is partial.** A4.2 and A4.2a are done. In A4.3 the frame algebra and padding to constant rank exist, but not the splitting-torsor statement or the tower. The first target of A4.7 is done. A4.4, A4.5 and the completed tower are untouched.
- **A0 is partial.** A0.8 is done apart from its base-change clause. A0.1 has the algebraic pushout and point lifting; the geometric fibre product is missing, and maps into affinoids have only their injectivity half. A0.3, A0.5 and A0.7 have pieces: plus-ring tracking, completed base change of finite projective algebras, and associativity without symmetry or unit. A0.2, A0.4 and A0.6 are untouched.
- **A2 is partial.** A2.2 and A2.3 have the relative polydisc with its universal property, the torus locus and the two-torus cover of the disc. A2.1 and A2.4 onward are untouched.
- **A3 is partial.** A3.1 has two-out-of-three, finite projective dimension, change of rings, natural completeness and stable pseudocoherence; pseudo-flatness and the sheaf theory are missing. A3.2 has parts (a) and (b) of the Newton lemma, and no standard étale presentations.

## The frontier

- **The splitting torsor (A4.3).** Show that the frame algebra of the padded algebra splits the original one, giving `Algebra.exists_isFiniteEtaleTorsor_isTotallySplit`; the tower is a directed system of these.
- **Finite étale morphisms of adic spaces (A1.2 to A1.3).** Finiteness of the morphism of pairs, strong sheafiness of finite étale algebras, and descent along rational coverings, before the global definition.
- **The geometric fibre product (A0.1).** `Spa` of a completed pushout of sheafy pairs as a fibre product of adic spaces, and the existence half of maps into affinoids.
- **Elkik's approximation theorem (A1.0.4, A1.0.5).** The completion and Jacobian infrastructure is in place; the section approximation itself, and then invariance of finite étale algebras under henselian completion, remain.
- **Pseudocoherent sheaves and standard étale presentations (A3).** Pseudo-flatness of rational localisations and the Čech theory in A3.1; functoriality of the Newton lemma and standard étale presentations in A3.2.

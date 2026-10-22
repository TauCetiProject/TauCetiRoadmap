<!--tauceti-status:v1 {"roadmap":"AdicEtaleGeometry","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A0","state":"untouched"},{"id":"Layer A1","remaining":"A1.0.2 onward: power-bounded henselian pairs, filtered-colimit descent, strongly sheafy rings, finite étale Huber pairs, the sites","state":"partial"},{"id":"Layer A2","state":"untouched"},{"id":"Layer A3","state":"untouched"},{"id":"Layer A4","remaining":"everything from finite étale torsors (A4.2) on; only the shared split-ring vocabulary of A4.1 exists","state":"partial"}],"readme_sha":"eff8e4260e91403aa0f1a314ace292c30247853485c065a4cf43bc885fcd6752","roadmap":"AdicEtaleGeometry","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
# Status: AdicEtaleGeometry

This file documents the status of the AdicEtaleGeometry roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The finite étale layer A1 has begun: its first two subsections are proved. These are the theory of rings without nonsplit finite étale covers and the stability of henselian pairs under directed colimits. Nothing has landed for the completed-tensor interface A0, the classical analytic geometry of A2, the pseudocoherent modules of A3, or the torsor towers of A4 beyond A4.1, which reuses the split-ring vocabulary.

### Named results

- **The section criterion for split rings** — a ring has no nonsplit finite étale covers exactly when every faithfully flat finite étale algebra over it has a section ([`isFiniteEtaleSplit_iff_exists_section`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/FiniteEtaleSplit.html#TauCeti.isFiniteEtaleSplit_iff_exists_section)). This is the form in which Scholze's Lemma 15.3 is used.
- **Roots of separable polynomials** — over such a ring, every monic polynomial of positive degree whose derivative is a unit modulo it has a root ([`IsFiniteEtaleSplit.exists_root`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/FiniteEtaleSplit.html#TauCeti.IsFiniteEtaleSplit.exists_root)). This is the only consequence the perfectoid tower argument needs.
- **Split fields are separably closed fields** — for a field, having no nonsplit finite étale covers is equivalent to being separably closed ([`isFiniteEtaleSplit_iff_isSepClosed`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/FiniteEtaleSplit.html#TauCeti.isFiniteEtaleSplit_iff_isSepClosed)).
- **Invariance under finite étale equivalences** — if base change along a ring map is an equivalence of finite étale categories, the source has no nonsplit covers if and only if the target has none ([`isFiniteEtaleSplit_iff_of_isEquivalence`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/FiniteEtaleSplit.html#TauCeti.isFiniteEtaleSplit_iff_of_isEquivalence)). This is how the property will move from the tower's colimit to its completion.
- **Henselian pairs under directed colimits** — a directed colimit of henselian pairs is henselian along the colimit ideal ([`Ring.DirectLimit.henselianRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/Henselian/DirectLimit.html#Ring.DirectLimit.henselianRing)).

### Notable definitions and infrastructure

- **Totally split algebras** ([`Algebra.IsTotallySplit`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/FiniteEtaleSplit.html#TauCeti.Algebra.IsTotallySplit)) are finite products of quotients of the base by idempotents. Unlike Mathlib's constant-rank `Algebra.IsFiniteSplit`, they let the number of sheets vary over clopen components. They are stable under base change, products and direct factors.
- **Rings without nonsplit finite étale covers** ([`IsFiniteEtaleSplit`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/FiniteEtaleSplit.html#TauCeti.IsFiniteEtaleSplit)) are closed under arbitrary products. They include the zero ring and separably closed fields. This is the class A4's torsor tower is built to reach.
- **Orthogonal refinement of idempotents** ([`exists_completeOrthogonalIdempotents_of_prod_one_sub_eq_zero`](https://taucetiproject.org/docs/TauCeti/RingTheory/Idempotents/Refinement.html#TauCeti.exists_completeOrthogonalIdempotents_of_prod_one_sub_eq_zero)) turns idempotents whose components cover the spectrum into a complete orthogonal family. Sections are assembled from such a family.

### Roadmap coverage

- **A0, A2 and A3 are untouched.** None of the declarations they name are in the library: the completed pushout, the analytic points, polydiscs, dimension, pseudocoherence and standard étale presentations are all missing.
- **A1 is partial.**
  - A1.0.0 (split rings) and A1.0.1 (henselian colimits) are done, apart from two Checks: the `ℚ_p` non-example and the strictly henselian local ring example are not yet written.
  - From A1.0.2 onward, nothing has been proved for this roadmap.
  - The library does already define strongly sheafy Tate rings, with sheafiness, the restricted power series case and the strongly noetherian case. A1.1's rational localisation, rational descent and space-level notion are not there.
- **A4 is partial only in name.** A4.1 is a pointer to A1.0.0, and the finite étale torsors of A4.2 onward have not started.

## The frontier

- **Power-bounded henselian pairs (A1.0.2)** — show that `(A°, ϖA°)` is henselian for a complete Tate ring by writing `A°` as the directed union of rings of definition. Its one roadmap prerequisite, the colimit theorem, is now in place.
- **Finite étale algebras over filtered colimits (A1.0.3)** — descent of objects and morphisms from `colim R_i` to a finite stage. The stagewise lemmas for monic polynomials and units, and the transfer of splitting along essentially surjective base change, are ready for it. A1.0.3a, on locally constant functions with separably closed values, then follows from the product result.
- **Finite étale torsors (A4.2)** — define the torsor class and its Galois map. The library's Chase–Harrison–Rosenberg map `TauCeti.MulSemiringAction.tensorToPi` is the supplier the README names.
- **Strongly sheafy rings (A1.1)** — complete the existing definition with stability under rational localisation, rational descent, and locally strongly sheafy adic spaces.
- **The completed pushout (A0.1)** — this rests on AdicSpacesPartII's completed tensor product of Huber pairs, which was not found in the library source.

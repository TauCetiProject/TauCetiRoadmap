<!--tauceti-status:v1 {"roadmap":"Orbifolds","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: Orbifolds

This file documents the status of the Orbifolds roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only finite-group and diffeological groundwork for the local theory exists: the action-groupoid dictionary, finite Bochner linearization, invariant inner products, the linear generic-stabilizer theorem and quotient diffeologies. No proper étale presentation, orbifold chart, orbibundle, triangulation or weighted integral has been constructed, so O3–O7 have not begun.

### Named results

- **The generic stabilizer of a finite linear action** — for a finite group acting linearly and continuously on, for instance, a finite-dimensional real vector space, the points whose stabilizer is exactly the action kernel are dense, and they form an open set ([`dense_setOf_stabilizer_eq_ker`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/GroupAction/GenericStabilizer.html#TauCeti.dense_setOf_stabilizer_eq_ker)); in the faithful case, the free locus is dense ([`dense_freeLocus`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/GroupAction/GenericStabilizer.html#TauCeti.dense_freeLocus)).
- **Invariant inner products by averaging** — summing an inner product over its conjugates under a finite group gives an invariant positive-definite form ([`posDef_toQuadraticMap_sumOfConjugatesForm_inner`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/InvariantForm/InnerProduct.html#Representation.posDef_toQuadraticMap_sumOfConjugatesForm_inner)), whose invariant open balls fit inside any neighbourhood of the origin ([`exists_pos_sumOfConjugatesInnerSublevel_subset`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/InvariantForm/InnerProduct.html#Representation.exists_pos_sumOfConjugatesInnerSublevel_subset)).
- **Isotropy as automorphisms in the action groupoid** — the stabilizer of a point is the automorphism group of its object, with every label retained, including elements that act trivially ([`stabilizerMulEquivAut`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Groupoid/ActionCategory.html#CategoryTheory.ActionCategory.stabilizerMulEquivAut)). Orbits are its isomorphism classes ([`orbitQuotientEquivIsomorphismClasses`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Groupoid/ActionCategory.html#CategoryTheory.ActionCategory.orbitQuotientEquivIsomorphismClasses)).
- **`[*/G]` is not a point** — for a nontrivial group, the one-object action groupoid is not equivalent to any thin category ([`isEmpty_equivalence_punit`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Groupoid/ActionCategory.html#CategoryTheory.ActionCategory.isEmpty_equivalence_punit)), which is the roadmap's basic test that isotropy is remembered.

### Notable definitions and infrastructure

- **The quotient diffeology** ([`instDiffeologicalSpaceQuotient`](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeology/Quotient.html#TauCeti.Diffeology.instDiffeologicalSpaceQuotient)), built as a [coinduced diffeology](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeology/Coinduced.html#TauCeti.Diffeology.coinducedDiffeology). Its plots are exactly the maps that locally lift, a function out of it is smooth exactly when its lift is ([`dSmooth_quotient_lift_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeology/Quotient.html#TauCeti.Diffeology.dSmooth_quotient_lift_iff)), and its D-topology is the quotient topology. These are the local laws O2.6 asks for on a finite orbit quotient.
- **Subductions** ([`IsSubduction`](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeology/Subduction.html#TauCeti.Diffeology.IsSubduction)), with descent of smoothness along them. They are the tool for gluing chart quotients into a coarse diffeology.
- **Finite Bochner linearization**, in the library source as the Bochner average and its inverse-function-theorem chart, where a finite group acts linearly through its derivative representation. Faithfulness is not assumed. This is the analytic core of O2.1.

### Roadmap coverage

O1.1 is partial: the algebraic action-groupoid adapter exists (stabilizers, orbits, arrows as label-source pairs), but no Hausdorff proper étale subcategory or arrow-space topology has been defined. O1.2–O1.6 (bibundle maps, weak fiber products, slice presentations, families, collared corner carriers) are untouched. In O2, the local ingredients of O2.1 exist (Bochner chart, invariant inner product and balls), but they are not assembled into the groupoid isomorphism `Γ|U ≅ Γ_x⋉U`. O2.3 has only its linear generic-stabilizer step, with no ineffective kernel or effective reduction. O2.6 has the generic quotient and coinduced diffeology laws, but not the manifold diffeology, chart gluing or Morita independence. O2.2 and O2.5 are untouched, and the material does not establish where O2.4's averaging stands. O3 through O7 are untouched.

## The frontier

- **The proper étale subcategory (O1.1)** — define Hausdorff proper étale presentations on LGP's groupoid carrier, and give the action groupoid's total arrow space its topology and structure-map formulas. Every later layer is stated on this carrier. It waits on LGP G0's carrier being usable.
- **The retained-arrow local chart (O2.1)** — combine the Bochner chart with the invariant ball to prove `Γ|U ≅ Γ_x⋉U`, including the finiteness of `Γ_x` from properness and étaleness. This needs the O1.1 carrier.
- **The coarse diffeology (O2.6)** — construct the manifold diffeology with D-topology equal to the manifold topology, then glue finite-chart quotient diffeologies over a presentation and prove Morita independence.
- **Ineffective kernel and effective reduction (O2.3)** — define the kernel by arrows with identity germ, and move the linear generic-stabilizer theorem into charts to get the dense principal open subset.
- **Finite-chart atlases (O2.2)** — build overlap-arrow torsors and the presenting groupoid, which is the prerequisite for O3 triangulation and everything downstream.

<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"94050b6aee7bc349e209c85bf5e2cec3c49420a8","ts":"2026-09-11T22:46:43Z"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `94050b6` (2026-09-11T22:46:43Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The three-model, representation, Lie, and Jordan/torus layers (Layers 0–2 and 4) are in place. Subgroups and quotients, unipotent and reductive structure, general structure theory, and the explicit Chevalley lane remain partial; no classification theorem from Layer 8 is established in the supplied record.

### Named results

- **The Hopf algebra–affine group scheme anti-equivalence** — `Spec` identifies commutative Hopf algebras contravariantly with affine group schemes, keeping the roadmap's three models interchangeable ([`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat)).
- **The embedding theorem** — every finite-type affine group scheme over a field is a closed subgroup of some general linear group ([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear)).
- **Tannakian reconstruction** — a commutative Hopf algebra's points are exactly the tensor automorphisms of scalar extension on its finite-dimensional comodules ([`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv)).
- **Existence of maximal tori and Borel subgroups** — every finite-type affine group over a field contains a maximal torus, and its geometric fibre contains a Borel subgroup ([`exists_isMaximalTorus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Torus/Existence.html#TauCeti.HopfIdeal.exists_isMaximalTorus), [`exists_geometricBorel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Existence.html#TauCeti.HopfIdeal.exists_geometricBorel)).
- **Reductivity of the special orthogonal groups** — every standard `SOₙ` over a field of characteristic different from two is reductive, completing this worked example only under that characteristic hypothesis ([`reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Reductive.html#TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra)).

### Notable definitions and infrastructure

- **Smoothness criterion** — for finite-type commutative Hopf algebras over a field, smoothness is equivalent to geometric reducedness, making the roadmap's geometric hypotheses checkable on coordinates ([`smoothCommHopfAlgProperty_iff_geometricallyReduced`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Smooth/GeometricallyReduced.html#TauCeti.smoothCommHopfAlgProperty_iff_geometricallyReduced)).
- **The identity component** — over an algebraically closed field it is geometrically connected even without smoothness, strengthening the component theory used in Layer 3 ([`geometricallyConnected_identityComponent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Connected/GroupScheme.html#TauCeti.FiniteTypeCommHopfAlgCat.geometricallyConnected_identityComponent)).
- **Central-isogeny kernels** — over a Noetherian base their coordinate Hopf algebras are finite locally free and bicommutative, so Cartier duality applies ([`kernelFiniteLocallyFree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Isogeny/Kernel.html#TauCeti.CommHopfAlgCat.IsCentralIsogeny.kernelFiniteLocallyFree)).

### Roadmap coverage

Layers 0–2 and 4 meet their stated milestones. Layer 3 has Hopf ideals, kernels, identity components, fppf quotients, and component-quotient representability, but not the general quotient representability results. Layer 5 has geometric unipotence, a Lie–Kolchin theorem under the stronger hypothesis that the derived subgroup is geometrically unipotent, and a unipotent-radical candidate with criteria and examples, but not its general construction-and-maximality theorem. Layer 6 has radicals, centers and central isogenies, plus reductivity for `GLₙ`, `SLₙ`, `Sp₂ₙ`, and now `SOₙ` away from characteristic two; the characteristic-zero equivalence with linear reductivity and simply connected covers remain open. Layer 7 has maximal-torus and Borel existence, dynamic parabolics, and `GLₙ` root data, but no general conjugacy, root datum, or Bruhat theory. Layer 8 has not begun in the supplied record. Layer 9 has several explicit carriers, root-subgroup relations including the type-`G₂` short pair, and Frobenius fixed-point descriptions, but neither a uniform pinned construction nor the pinned isomorphism theorem. The latest point-map functoriality declarations are only partially recorded, so they do not support a stronger layer-level conclusion here.

## The frontier

- **Conjugacy of Borel subgroups and maximal tori.** Existence is settled; conjugacy over an algebraically closed field is still needed before a root datum can be attached canonically to a general group.
- **The unipotent radical.** Prove that the general candidate is the maximal connected normal smooth unipotent closed subgroup; current results give criteria, quotient behavior, and concrete computations.
- **Root data and Weyl groups of general reductive groups.** Extract roots from a maximal torus and identify its normalizer quotient, first in the split case; this depends on conjugacy.
- **Special orthogonal groups in characteristic two.** The reductivity theorem now covers every dimension but explicitly assumes characteristic different from two; the remaining characteristic is not established here.
- **A uniform pinned Chevalley–Demazure construction.** Replace the type-by-type carriers and relations by a construction from arbitrary root data, then prove the pinned isomorphism theorem.

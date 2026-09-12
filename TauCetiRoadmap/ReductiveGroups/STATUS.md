<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"37aec57229a4a5828884027165b25804aac01ac8","ts":"2026-09-12T13:50:33Z"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `37aec57` (2026-09-12T13:50:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Hopf-algebra, group-scheme and functor-of-points dictionary, representations, Lie theory, and the Jordan/tori layer are substantially in place; subgroup quotients remain only partly representable. Layers 5–7 have major structure results but not the general unipotent-radical, conjugacy, or root-datum theorems; Layer 8 is untouched, and the pinned integral lane remains typewise rather than uniform.

### Named results

- **The Hopf algebra–affine group scheme anti-equivalence** — `Spec` contravariantly identifies commutative Hopf algebras with affine group schemes ([`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat)).
- **The embedding theorem** — every finite-type affine group scheme over a field is a closed subgroup of some general linear group ([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear)).
- **Tannakian reconstruction** — points of a commutative Hopf algebra are exactly tensor automorphisms of scalar extension on its finite-dimensional comodules ([`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv)).
- **Existence of maximal tori and Borel subgroups** — every finite-type affine group over a field has a maximal torus, while its geometric fibre has a Borel subgroup ([`exists_isMaximalTorus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Torus/Existence.html#TauCeti.HopfIdeal.exists_isMaximalTorus), [`exists_geometricBorel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Existence.html#TauCeti.HopfIdeal.exists_geometricBorel)).
- **Reductivity of special orthogonal groups** — every standard `SOₙ` is reductive in every dimension over fields of characteristic different from two ([`reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Reductive.html#TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra)).

### Notable definitions and infrastructure

- **Group-like weight spaces.** [`weightSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Weight/Space.html#GroupLike.weightSpace) supplies the eigenspace language used by the triangularization theory.
- **Finite kernels of central isogenies.** [`kernelFiniteLocallyFree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Isogeny/Kernel.html#TauCeti.CommHopfAlgCat.IsCentralIsogeny.kernelFiniteLocallyFree) packages the kernel over a Noetherian base for Cartier duality.
- **Pinned Weyl representatives.** [`geckSimpleWeylPoint`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/GeckLattice/Weyl.html#TauCeti.DynkinType.geckSimpleWeylPoint) realizes simple reflections inside the explicit Geck carrier and controls conjugation on its root subgroups and weight torus.

### Roadmap coverage

Layers 0–2 and 4 are substantially complete. Layer 3 has Hopf ideals, kernels, identity components and fppf quotients, but general quotient representability is not established. Layer 5 has geometric unipotence, a Lie–Kolchin theorem under a derived-subgroup unipotence hypothesis, and quotient criteria for the unipotent radical, but not its general construction and maximality theorem. Layer 6 has radicals, central isogenies and reductivity for `GLₙ`, `SLₙ`, `Sp₂ₘ` and `SOₙ` away from characteristic two; the characteristic-zero equivalence with linear reductivity and simply connected covers remain open. Layer 7 has existence of maximal tori and Borels, dynamic parabolics and Levis, and concrete maximal tori for `GLₙ` and `Sp₂ₘ`, but no conjugacy theorem or root datum for an arbitrary reductive group. Layer 8 is untouched. Layer 9 has explicit carriers, root-subgroup relations, Weyl representatives and Frobenius fixed-point identifications in selected types, but no uniform pinned Chevalley–Demazure construction or isomorphism theorem.

## The frontier

- **Conjugacy of Borel subgroups and maximal tori.** Existence is proved, but conjugacy over an algebraically closed field is not established; this is the immediate prerequisite for making a group's root datum independent of choices.
- **The general unipotent radical.** Construct the maximal connected normal smooth unipotent closed subgroup and prove maximality; current results give criteria, images, and concrete computations.
- **Root data and Weyl groups of arbitrary reductive groups.** Extract roots from a maximal torus and identify its normalizer quotient, beginning with the split case after conjugacy.
- **The classical Lie–Kolchin hypothesis.** Connect connected solvability to geometric unipotence of the derived subgroup so the existing triangularization theorem applies in its usual form.
- **A uniform pinned Chevalley–Demazure construction.** Replace the type-by-type carriers with a construction from root data and prove the pinned isomorphism theorem; current `G₂` relations and Weyl representatives are ingredients, not the result.

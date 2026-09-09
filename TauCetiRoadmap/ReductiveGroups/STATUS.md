<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"15859e1a6e7a78c98096949403e0831c8dd6e269","ts":"2026-09-08T22:58:03Z"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `15859e1` (2026-09-08T22:58:03Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–4 supply the affine-group dictionary, finite-dimensional representation theory, Lie theory, quotients and components, and Jordan/torus theory. Layers 5–7 and 9 are substantial but partial; the classification and existence theorems of Layer 8 have not begun.

### Named results

- **The Hopf algebra–affine group scheme anti-equivalence** — `Spec` identifies commutative Hopf algebras contravariantly with affine group schemes, completing the central bridge among the roadmap’s three models ([`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat)).
- **The embedding theorem** — every finite-type affine group scheme over a field is a closed subgroup of some general linear group ([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear)).
- **Tannakian reconstruction** — a commutative Hopf algebra’s points are precisely the tensor automorphisms of scalar extension on its finite-dimensional comodules ([`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv)).
- **The multiplicative Jordan decomposition** — over a perfect extension field, every point has unique commuting semisimple and unipotent factors, functorially under affine-group homomorphisms ([`jordanDecomposition`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.html#TauCeti.HopfAlgebra.Point.jordanDecomposition)).
- **Borel existence** — the geometric fibre of every finite-type affine group has a Borel subgroup ([`exists_geometricBorel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Existence.html#TauCeti.HopfIdeal.exists_geometricBorel)).

### Notable definitions and infrastructure

- **Maximal tori.** Every finite-type affine group over a field now has a maximal torus, and every torus closed subgroup lies in one; this supplies the starting object for general root data ([`exists_isMaximalTorus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Torus/Existence.html#TauCeti.HopfIdeal.exists_isMaximalTorus)).
- **Representation-theoretic reductivity.** A faithful completely reducible comodule forces normal smooth unipotent closed subgroups to be trivial; in particular, [the standard symplectic group is reductive over every field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Symplectic/Reductive.html#TauCeti.Symplectic.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra).
- **Exceptional and integral models.** Type-specific carriers have root subgroups, base change and Frobenius actions, and `Sp₄` now has [a characteristic-two special isogeny whose square is Frobenius](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/SpecialIsogeny.html#TauCeti.specialIsogeny_comp_specialIsogeny); the analogous `B₂`, `F₄`, and `G₂` results currently reach the split tori rather than full group schemes.

### Roadmap coverage

Layers 0–2 and 4 are done. Layer 3 has Hopf ideals, kernels, identity components and fppf quotients, but general quotient representability is not established. Layer 5 has geometric unipotence, examples, radical infrastructure and Lie–Kolchin under geometric unipotence of the derived subgroup, not the full radical theorem or the unconditional solvable-group statement. Layer 6 has reductive `GL`, `SL` and symplectic examples, centers, derived and solvable radicals, central isogenies and simple connectivity; the characteristic-zero linear-reductivity equivalence, simply connected covers and adjoint forms remain. Layer 7 now has maximal-torus and geometric-Borel existence, dynamic parabolics, and concrete `GLₙ` and `SL₂` Bruhat results, but not conjugacy, root data for arbitrary reductive groups, or general Bruhat and BN-pair theory. Layer 8 is untouched. Layer 9 has several explicit integral carriers and type-specific root-subgroup, base-change, Frobenius and special-isogeny results, not a uniform pinned construction.

## The frontier

- **Representable quotients.** Prove when the fppf quotient by a normal closed subgroup is represented, and when it is affine; the current general construction stops at a quotient sheaf.
- **The unipotent radical.** Establish the general construction and maximality of the maximal connected normal smooth unipotent closed subgroup; current results give a framework, criteria and special cases.
- **Conjugacy and root data.** Prove conjugacy of maximal tori and Borels, then extract roots and Weyl groups for an arbitrary reductive group; existence alone does not supply these identifications.
- **Reductive forms.** Prove the characteristic-zero equivalence with linear reductivity and construct simply connected covers and adjoint forms from central isogenies.
- **Pinned classification.** Supply the Layer 8 classification and a uniform pinned Chevalley–Demazure construction with its isomorphism theorem; extend the full-group special-isogeny result beyond `Sp₄` to the remaining exceptional cases.

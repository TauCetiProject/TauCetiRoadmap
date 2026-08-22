<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"629fa9824c89686bcdafae2adb2a9c4d74a142de","ts":"2026-08-21T22:00:45+00:00"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `629fa98` (2026-08-21T22:00:45+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Hopf-algebra, affine-group-scheme, representation, Lie and Jordan-decomposition summit through Layer 4 is in place, although general quotient representability in Layer 3 remains partial. Layer 5 now reaches the upper-unitriangular characterization of unipotence but not the unipotent radical; Layer 6 has its first reductive family and basic structural subgroups, Layer 7 has begun through pointwise dynamic parabolics, Layer 8 is untouched, and Layer 9 remains preparatory.

### Named results

- **Tannakian reconstruction** — points of a commutative Hopf algebra over a field are exactly tensor automorphisms of scalar extension on its finite-dimensional comodules ([`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv)).
- **The multiplicative Jordan decomposition** — over a perfect extension field every point factors uniquely into commuting semisimple and unipotent parts, functorially under affine-group homomorphisms ([`jordanDecomposition`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.html#TauCeti.HopfAlgebra.Point.jordanDecomposition)).
- **The embedding theorem** — every affine group scheme of finite type over a field is a closed subgroup of some general linear group, via finite-dimensional subcoalgebras ([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear)).
- **The upper-unitriangular characterization of unipotence** — a reduced finite-type affine group over an algebraically closed field is geometrically unipotent exactly when it embeds as a closed subgroup of some `U_n` ([`iff_exists_isClosedImmersion_upperUnitriangularGroupScheme`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Unipotent/Embedding.html#TauCeti.geometricallyUnipotentPointsCommHopfAlgProperty.iff_exists_isClosedImmersion_upperUnitriangularGroupScheme)).
- **Reductivity of tori** — every torus over a field is reductive in arbitrary characteristic ([`torusCommHopfAlgProperty.reductive`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Torus/Reductive.html#TauCeti.torusCommHopfAlgProperty.reductive)).

### Notable definitions and infrastructure

- **The component group.** In the algebraically closed setting, the quotient by the identity component is represented by the finite constant group scheme on the connected components of the spectrum ([`componentGroupFppfGroupObjectIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Connected/ComponentGroup/Representable.html#TauCeti.FiniteTypeCommHopfAlgCat.componentGroupFppfGroupObjectIso)).
- **The represented center.** The functor-of-points center is cut out by a canonical Hopf ideal and represented as a closed commutative subgroup scheme ([`centerGroupScheme`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Center/Basic.html#TauCeti.CommHopfAlgCat.centerGroupScheme)).
- **Dynamic parabolics.** A cocharacter defines pointwise parabolic, Levi and unipotent subgroups; the limit map retracts the parabolic onto its Levi part and yields a unique factorization ([`exists_mem_unipotent_mem_levi`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.html#TauCeti.Cocharacter.exists_mem_unipotent_mem_levi)).

### Roadmap coverage

Layers 0–2 and 4 are done. Layer 3 has Hopf ideals, kernels, fppf quotient sheaves, identity components and the algebraically closed component-group result, but not general representability of quotients or the broader component statement. Layer 5 has geometric unipotence, its upper-unitriangular characterization and solvability consequences; its radical is only a maximal-Lie-dimension candidate. Layer 6 now has centers, derived subgroups, central isogenies, linearly reductive diagonalizable groups and reductive tori, but no general radical theory, simply connected or adjoint forms, or characteristic-zero equivalence with linear reductivity. Layer 7 has the pointwise dynamic parabolic–Levi construction but not general Borels, maximal tori, roots, Weyl groups, Bruhat decomposition or BN-pairs. Layer 8 is untouched. Layer 9 has Chevalley-lattice, toral-carrier and root-subgroup relations, including multiply-laced cases, but no pinned Chevalley–Demazure group scheme over `ℤ`.

## The frontier

- **The unipotent radical.** Upgrade the existing connected normal smooth unipotent subgroup of maximal Lie dimension to a subgroup maximal by inclusion, and prove its universal maximality ([`exists_isUnipotentRadicalCandidate_maximal_finrank_quotientLie`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Basic.html#TauCeti.HopfIdeal.exists_isUnipotentRadicalCandidate_maximal_finrank_quotientLie)).
- **Reductivity of the classical examples.** Tori are settled, but `GL_n`, `SL_n`, orthogonal and symplectic groups still need proofs against the geometric unipotent-radical definition.
- **Lie–Kolchin.** Common fixed vectors are available for two unipotent subgroups when one normalizes the other, but the solvable-group theorem required by the roadmap is not established ([`exists_common_fixed_vector_of_le_normalizer_isUnipotent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Unipotent/NormalJoin.html#Representation.exists_common_fixed_vector_of_le_normalizer_isUnipotent)).
- **Representable structure theory.** Promote the pointwise dynamic parabolic, Levi and unipotent functors to the scheme-level objects needed for general Borels and parabolics, then construct maximal tori, roots and Weyl groups.
- **Pinned Chevalley–Demazure groups.** Complete the general integral construction, pinnings and root-subgroup interface before the pinned isomorphism theorem and the exceptional isogenies can be stated.

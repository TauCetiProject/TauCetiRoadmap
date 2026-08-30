<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"cfd9d5022bdb2bbda7118e7ee8cc6adfab7a2d72","ts":"2026-08-27T12:17:33+00:00"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `cfd9d50` (2026-08-27T12:17:33+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 through 4 are essentially complete. Layers 5 and 6 now contain substantial structure and the first reductive examples, while Layer 7 is developed only for dynamic subgroup functors and concrete general-linear cases; Layer 8 has not begun, and Layer 9 remains at root subgroups, relations, and Lie-theoretic prerequisites.

### Named results

- **The embedding theorem** — every affine group scheme of finite type over a field is a closed subgroup of some general linear group ([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear)).
- **Tannakian reconstruction** — the points of a commutative Hopf algebra over a field are exactly the tensor automorphisms of scalar extension on its finite-dimensional comodules ([`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv)).
- **The multiplicative Jordan decomposition** — over a perfect extension field, every point factors uniquely into commuting semisimple and unipotent parts, compatibly with homomorphisms ([`jordanDecomposition`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.html#TauCeti.HopfAlgebra.Point.jordanDecomposition)).
- **Reductivity of the general and special linear groups** — `GLₙ` and `SLₙ` are reductive over every field ([`GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Reductive.html#TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra), [`SpecialLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Reductive.html#TauCeti.SpecialLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra)).
- **The dynamic Levi decomposition** — the dynamic parabolic attached to a cocharacter is naturally the semidirect product of its unipotent and Levi subgroup functors ([`leviDecompositionNatIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Naturality.html#TauCeti.Cocharacter.leviDecompositionNatIso)).

### Notable definitions and infrastructure

- **The component group scheme.** Over an algebraically closed field, the fppf quotient by the identity component is represented by a finite étale constant group scheme ([`componentGroupFppfGroupObjectIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Connected/ComponentGroup/Representable.html#TauCeti.FiniteTypeCommHopfAlgCat.componentGroupFppfGroupObjectIso), [`componentGroupScheme`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Connected/ComponentGroup/FiniteEtale.html#TauCeti.FiniteTypeCommHopfAlgCat.componentGroupScheme)).
- **Unipotent-radical candidates.** Connected normal smooth unipotent closed subgroups can be multiplied and one exists with maximal Lie dimension, providing the input for a future maximality proof ([`IsUnipotentRadicalCandidate`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Basic.html#TauCeti.HopfIdeal.IsUnipotentRadicalCandidate)).
- **The type-A root datum.** The diagonal torus of `GLₙ` has the coordinate-difference root datum, and its normalizer quotient is identified with that datum’s Weyl group ([`diagonalRootDatum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Root/Datum.html#TauCeti.GeneralLinear.diagonalRootDatum), [`diagonalNormalizerQuotientMulEquivWeylGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Root/WeylGroup.html#TauCeti.GeneralLinear.diagonalNormalizerQuotientMulEquivWeylGroup)).

### Roadmap coverage

Layers 0–2 are done; Layer 3 has closed subgroups, fppf quotients, and identity components, with component-group representability currently over algebraically closed fields; Layer 4 is done. Layer 5 has Kolchin fixed vectors for unipotent groups, upper-unitriangular embeddings, and a maximal-Lie-dimension candidate for the unipotent radical, but not the radical’s maximality or Lie–Kolchin for general solvable groups. Layer 6 has the center and derived subgroup, reductive, semisimple and adjoint properties, and reductivity of tori, `GLₙ`, and `SLₙ`; the general radical, central isogenies, simply connected forms, and the characteristic-zero equivalence with linear reductivity remain. Layer 7 has dynamic parabolic and Levi functors, represented weight parabolics in `GLₙ`, a maximal diagonal torus, and the type-A root datum and Weyl group, but no general Borel/maximal-torus theory, Bruhat decomposition, or non-split theory. Layer 8 is untouched. Layer 9 has classical root subgroups and type-A and symplectic commutator relations, but no pinned Chevalley–Demazure construction over `ℤ`.

## The frontier

- **The unipotent radical.** Prove that a maximal-Lie-dimension candidate contains every other candidate, then package the resulting maximal connected normal smooth unipotent subgroup; product closure and the zero-dimensional tangent criterion are now available.
- **Lie–Kolchin.** Extend the fixed-vector and triangularization results from unipotent and commutative groups to connected solvable groups.
- **Reductive versus linearly reductive.** Prove the characteristic-zero equivalence; only the implication from a linearly reductive geometric fibre to reductivity is present, and the positive-characteristic distinction is represented by the additive group rather than a general theorem.
- **Root data of a group.** Generalize the `GLₙ` calculation by constructing maximal tori and identifying roots, coroots and the normalizer quotient for a general split reductive group.
- **Chevalley–Demazure over `ℤ`.** Build the pinned split group scheme from a root datum, including base change, root-subgroup compatibility and the pinned isomorphism theorem; current classical commutator calculations do not supply that construction.

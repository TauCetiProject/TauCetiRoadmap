<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"835fbbdde8c00ea84da8b4376d2b3712de1b40fd","ts":"2026-09-30T22:19:33Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"representability of general fppf quotients and short exact sequences","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"general maximality theorem for the unipotent radical","state":"partial"},{"id":"Layer 6","remaining":"characteristic-zero equivalence with linear reductivity and simply connected covers","state":"partial"},{"id":"Layer 7","remaining":"general conjugacy of Borels and maximal tori; root datum of an arbitrary reductive group","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"uniform pinned construction from arbitrary root data, the pinned isomorphism theorem, and identification of the explicit carriers with pinned groups","state":"partial"}],"readme_sha":"b6888bb0f65d0f4a7686c047ee2d3204d019fb3e6c35fc0bd83b531ef10b4c1b","roadmap":"ReductiveGroups","to_sha":"835fbbdde8c00ea84da8b4376d2b3712de1b40fd"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `835fbbd` (2026-09-30T22:19:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Four layers are done: the three-way group-scheme dictionary, representation theory, the Lie algebra, and tori and Jordan decomposition. Subgroups and quotients, radicals, reductivity, structure theory and the explicit pinned carriers are partial. Classification has not begun.

### Named results

- **The Hopf algebra–affine group scheme anti-equivalence** — [`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat) identifies commutative Hopf algebras, contravariantly, with affine group schemes.
- **The embedding theorem** — [`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear): every finite-type affine group scheme over a field is a closed subgroup of some general linear group.
- **Tannakian reconstruction** — [`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv) recovers the points of a commutative Hopf algebra as the tensor automorphisms of scalar extension on its finite-dimensional comodules.
- **Reductivity of the classical groups** — [`GLₙ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Reductive.html#TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra), [`SLₙ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Reductive.html#TauCeti.SpecialLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra) and [`Sp₂ₘ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Symplectic/Reductive.html#TauCeti.Symplectic.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra) are reductive over every field, and [`SOₙ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Reductive.html#TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra) is reductive in every dimension away from characteristic two.
- **Faithfully flat morphisms are quotients by their kernels** — [`coinvariants_kernelHopfIdeal_eq_range`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Quotient/Kernel/Coinvariants.html#TauCeti.CommHopfAlgCat.coinvariants_kernelHopfIdeal_eq_range): the functions invariant under the kernel are exactly those pulled back from the target, with no smoothness hypothesis.

### Notable definitions and infrastructure

- **Split classical root data.** The diagonal-torus root data of [`SL_{r+1}`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/DiagonalTorus/RootDatum.html#TauCeti.SpecialLinear.diagonalRootDatum) and [`Sp₂ₘ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Symplectic/DiagonalTorus/RootDatum.html#TauCeti.Symplectic.diagonalRootDatum) sit beside the one for `GLₙ`. Each ties explicit root subgroups to the torus's character and cocharacter lattices.
- **Fppf quotient sheaf.** [`fppfQuotientSheaf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.html#TauCeti.CommHopfAlgCat.fppfQuotientSheaf) gives the quotient by a normal Hopf ideal as a group object in sheaves. It is the object that a representability theorem would identify with a scheme.
- **Explicit Chevalley carriers.** These are toral closures of root subgroups inside general linear groups over `ℤ`, such as the [`E₆` minuscule carrier](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/E6/Minuscule/GroupScheme.html#TauCeti.E6Minuscule.groupScheme). They carry numbered root subgroups, weight tori and Frobenius, and they are what the CFSG consumer builds its finite groups of Lie type on.

### Roadmap coverage

Layers 0–2 and 4 are done.

Layer 3 has the following:
- Hopf ideals, kernels and component groups.
- Fppf quotients and the invariants of a normal subgroup.
- The coordinate exactness of faithfully flat quotients.
- [Surjectivity on rational points of dominant morphisms](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/DominantPoints.html#TauCeti.CommHopfAlgCat.mapPointsFunctor_app_surjective_of_dominant) over an algebraically closed field.

It lacks representability of general quotients and a theory of short exact sequences.

Layer 5 has geometric unipotence and criteria for recognising the unipotent radical, but no general maximality theorem.

Layer 6 has reductivity of the classical groups, radicals, central isogenies, and linear reductivity characterised by splitting. It lacks two things: the characteristic-zero equivalence between reductive and linearly reductive, and simply connected covers.

Layer 7 has the following:
- [Borel subgroups on the geometric fibre](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Existence.html#TauCeti.HopfIdeal.exists_geometricBorel) and maximal tori.
- Dynamic parabolics and Levis.
- [Tits systems](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Diagonal/TitsSystem.html#TauCeti.slTitsSystem) for `GLₙ` and `SLₙ`.
- Root data for three split classical families.

Conjugacy of Borels is proved only for `GLₙ` and [`SL₂`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Borel/Conjugacy.html#TauCeti.SpecialLinear.Borel.exists_conjugate_eq_of_isBorelOverAlgClosed), and nothing extracts a root datum from an arbitrary reductive group.

Layer 8 is untouched.

Layer 9 has the following:
- Explicit carriers for many types, including the short-root `G₂` and `F₄` carriers and the tripled `D₄` carrier.
- Triality on the tripled `D₄` carrier.
- The special isogenies on the `Sp₄` carrier, the `G₂` carrier over `𝔽₃` and the `F₄` carrier over `𝔽₂`, each with its square relation.

It lacks a construction from an arbitrary root datum, the pinned isomorphism theorem, and any identification of the carriers with pinned simply connected groups.

## The frontier

- **Conjugacy of Borels and maximal tori.** Geometric conjugacy is still needed for an arbitrary smooth connected group. It is known only for `GLₙ` and `SL₂`, and the general case is what blocks root data.
- **Root datum of an arbitrary reductive group.** The roots have to be extracted from a maximal torus, and the quotient of its normalizer identified as the Weyl group. This needs conjugacy first.
- **Representable quotients.** It remains to show that the fppf quotient `G/H` is a scheme under suitable hypotheses, and affine when `H` is reductive. The coordinate exactness for faithfully flat morphisms is now available as input.
- **The unipotent radical.** It remains to prove that the connected normal smooth unipotent subgroup is maximal in general. The present criteria only recognise it.
- **Uniform pinned Chevalley–Demazure groups.** This needs the split group scheme over `ℤ` built from an arbitrary root datum, and the pinned isomorphism theorem. Each explicit carrier also still has to be identified with the pinned simply connected group of its type.

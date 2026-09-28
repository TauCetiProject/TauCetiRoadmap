<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"de52a34770e6b94396f1feed7c1d5a562572096f","ts":"2026-09-26T11:19:17Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"general representability of fppf quotients and short exact sequences","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"general maximality theorem for the unipotent radical","state":"partial"},{"id":"Layer 6","remaining":"characteristic-zero equivalence with linear reductivity and simply connected covers","state":"partial"},{"id":"Layer 7","remaining":"conjugacy of Borels and maximal tori; general root data, Bruhat decomposition and BN-pairs","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"uniform pinned construction and isomorphism theorem; G₂ and F₄ special isogenies","state":"partial"}],"readme_sha":"b6888bb0f65d0f4a7686c047ee2d3204d019fb3e6c35fc0bd83b531ef10b4c1b","roadmap":"ReductiveGroups","to_sha":"de52a34770e6b94396f1feed7c1d5a562572096f"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `de52a34` (2026-09-26T11:19:17Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The three-way group-scheme dictionary, representation theory, Lie algebra, and the torus and Jordan-decomposition layer are done. Subgroups and quotients, radicals, reductivity, structure theory, and explicit pinned carriers remain partial; classification has not begun.

### Named results

- **The Hopf algebra–affine group scheme anti-equivalence** — [`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat) identifies commutative Hopf algebras contravariantly with affine group schemes.
- **The embedding theorem** — [`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear) embeds every finite-type affine group scheme over a field as a closed subgroup of some general linear group.
- **Tannakian reconstruction** — [`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv) recovers a commutative Hopf algebra's points as tensor automorphisms of scalar extension on its finite-dimensional comodules.
- **Reductivity of the classical groups** — [`GLₙ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Reductive.html#TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra), [`SLₙ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Reductive.html#TauCeti.SpecialLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra), and [`Sp₂ₘ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Symplectic/Reductive.html#TauCeti.Symplectic.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra) are reductive over every field; [`SOₙ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Reductive.html#TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra) is reductive in every dimension away from characteristic two.
- **Existence of maximal tori and geometric Borels** — [`exists_isMaximalTorus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Torus/Existence.html#TauCeti.HopfIdeal.exists_isMaximalTorus) gives a maximal torus in every finite-type affine group over a field, while [`exists_geometricBorel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Existence.html#TauCeti.HopfIdeal.exists_geometricBorel) gives a Borel on its geometric fibre.

### Notable definitions and infrastructure

- **Split classical root data.** The [`SL_{r+1}`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/DiagonalTorus/RootDatum.html#TauCeti.SpecialLinear.diagonalRootDatum) and [`Sp₂ₘ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Symplectic/DiagonalTorus/RootDatum.html#TauCeti.Symplectic.diagonalRootDatum) diagonal-torus constructions join `GLₙ`, tying explicit root subgroups to their character and cocharacter lattices.
- **Fppf quotient sheaf.** [`fppfQuotientSheaf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.html#TauCeti.CommHopfAlgCat.fppfQuotientSheaf) gives the quotient by a normal Hopf ideal as a group object in sheaves; general scheme representability remains open.
- **Generated subgroup scheme.** [`generatedGroupScheme`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Generated/Basic.html#TauCeti.GeneralLinear.generatedGroupScheme) makes root-subgroup and torus generators into explicit closed carriers inside a general linear group.

### Roadmap coverage

Layers 0–2 and 4 are done. Layer 3 has Hopf ideals, kernels, component groups and fppf quotients, but lacks general quotient representability. Layer 5 has geometric unipotence and radical recognition criteria, without a general maximality theorem; Layer 6 has reductivity of the classical groups, radicals and central isogenies, but lacks the characteristic-zero equivalence with linear reductivity and simply connected covers. Layer 7 has existence of Borels and maximal tori, dynamic parabolics and Levis, and root data for three split classical families, but lacks conjugacy and a root datum for an arbitrary reductive group. Layer 8 is untouched. Layer 9 has explicit carriers and the `Sp₄` special isogeny; the [type-D spin carrier's represented simple generators form an sl₂ triple](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/Orthogonal/TypeD/SpinCarrier/Basic.html#TauCeti.TypeDSpinCarrier.isSl2Triple_rep_rootGenerator), while a construction from arbitrary root data and the pinned isomorphism theorem remain open.

## The frontier

- **Conjugacy of Borels and maximal tori.** Prove geometric conjugacy; existence and preservation under conjugation are established, but this step blocks general root data.
- **Root datum of an arbitrary reductive group.** Extract roots from a maximal torus and identify its normalizer quotient as the Weyl group, after conjugacy is available.
- **The unipotent radical.** Establish general maximality of the connected normal smooth unipotent subgroup; current recognition criteria do not supply it.
- **Uniform pinned Chevalley–Demazure groups.** Construct the split group scheme over `ℤ` from arbitrary root data and prove the pinned isomorphism theorem; the current carriers are type-specific.
- **Remaining numbered symmetries and special isogenies.** Record triality on the tripled `D₄` carrier, construct the short-root `G₂` carrier, and establish the `F₄` and `G₂` special isogenies with their square and root-subgroup relations.

<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"e29d6d25f6ba043928c95fb29195f7bfd83641b4","ts":"2026-10-19T05:07:02Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"representability of G/H for a general closed subgroup; the converse of Matsushima's criterion","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"general maximality theorem for the unipotent radical","state":"partial"},{"id":"Layer 6","remaining":"characteristic-zero equivalence with linear reductivity beyond GLn; simply connected covers; SLn to PGLn as a central isogeny","state":"partial"},{"id":"Layer 7","remaining":"conjugacy of maximal tori; root datum of an arbitrary reductive group; N(T)/T as Weyl group; general Bruhat decomposition","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"uniform pinned construction from arbitrary root data, existence half of the pinned isomorphism theorem, and identification of the explicit carriers with pinned groups","state":"partial"}],"readme_sha":"b6888bb0f65d0f4a7686c047ee2d3204d019fb3e6c35fc0bd83b531ef10b4c1b","roadmap":"ReductiveGroups","to_sha":"e29d6d25f6ba043928c95fb29195f7bfd83641b4"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `e29d6d2` (2026-10-19T05:07:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Four layers are done: the three-way group-scheme dictionary, representations as comodules, the Lie algebra, and tori with Jordan decomposition. Structure theory now has Borel conjugacy over algebraically closed fields, but subgroups and quotients, the unipotent radical, reductivity, structure theory and the pinned Chevalley lane all remain partial. Classification has not begun.

### Named results

- **The Hopf algebra–affine group scheme anti-equivalence** — [`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat) identifies commutative Hopf algebras with affine group schemes, contravariantly.
- **The embedding theorem** — by [`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear), every affine group scheme of finite type over a field is a closed subgroup of some general linear group.
- **Tannakian reconstruction** — [`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv) recovers the points of a commutative Hopf algebra from its finite-dimensional comodules.
- **Borel conjugacy** — by [`IsBorelOverAlgClosed.exists_conjugate_eq`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.html#TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq), any two Borel subgroups of a finite-type affine group over an algebraically closed field are conjugate by a rational point; each of them [contains a maximal torus](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Containment.html#TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_isMaximalTorus_ge).
- **Matsushima's criterion, affine direction, in characteristic zero** — by [`isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Coinvariants.html#TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive), the quotient of a finite-type affine group by a reductive closed subgroup is the affine scheme `Spec O(G)^N`. Over any field, the same holds for a linearly reductive subgroup of a geometrically reduced group.

### Notable definitions and infrastructure

- **Dynamic parabolics as subgroup schemes.** For any cocharacter, the dynamic parabolic, Levi and unipotent subgroups are [closed subgroup schemes](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Dynamic/Representability.html#TauCeti.Cocharacter.parabolicPointsIso), stable under base change. The Levi [is the centralizer of the cocharacter](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Dynamic/Levi/Centralizer.html#BialgHom.leviDefiningHopfIdeal_eq_centralizerHopfIdeal), and multiplication `U × Z → P` [is an isomorphism of schemes](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Coordinate.html#BialgHom.parabolicCoordinateAlgEquiv). This gives the `p`-adic consumers a parabolic and Levi theory that does not wait for root data.
- **Centralizers and normalizers of diagonalizable subgroups.** The [centralizer](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Centralizer/Basic.html#BialgHom.centralizerHopfIdeal) and [normalizer](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Normalizer/Scheme.html#BialgHom.normalizerHopfIdeal) are closed subgroup schemes, and their quotient is [finite étale](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Normalizer/Quotient.html#BialgHom.algebraEtale_coinvariants_centralizer_normalizer). For a maximal torus, this is the finite group `N(T)/T` that should become the Weyl group.
- **Explicit Chevalley carriers.** These are toral closures of root subgroups inside general linear groups over `ℤ`, such as the [`E₆` minuscule carrier](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/E6/Minuscule/GroupScheme.html#TauCeti.E6Minuscule.groupScheme), with [pinnings](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Pinning/Basic.html#TauCeti.Pinning) as data.

### Roadmap coverage

Layers 0–2 and 4 are done, and Layer 8 is untouched.

- **Layer 3** has Hopf ideals, kernels, short exact sequences, Chevalley's theorem on subgroups, quotients by normal subgroups, and now affine quotients by reductive subgroups in characteristic zero. The component group has its universal property for maps to finite étale groups. Still missing: representability of `G/H` for a general closed subgroup, and the converse of Matsushima's criterion.
- **Layer 5** can recognise the unipotent radical, and identifies it for weight parabolics of `GLₙ`, but has no general maximality theorem.
- **Layer 6** proves that the classical groups are reductive, has radicals, centres, derived subgroups (that of a reductive group is reductive) and central isogenies. Linear reductivity in characteristic zero is proved for `GLₙ`, and for `n ≥ 2` it is shown to fail in positive characteristic. The general characteristic-zero equivalence and simply connected covers are not established, and `SLₙ → PGLₙ` is not yet shown to be a central isogeny.
- **Layer 7** has Borel conjugacy over algebraically closed fields, dynamic parabolics and Levis in general, Tits systems for `GLₙ` and `SLₙ`, and root data for three split classical families. It lacks conjugacy of maximal tori, the root datum of an arbitrary reductive group, and the Bruhat decomposition beyond those examples.
- **Layer 9** has pinnings and explicit carriers for many types, but no construction from an arbitrary root datum. This account surveyed only the algebraic-group foundations, so any recent Chevalley-lane work is not reflected.

## The frontier

- **Conjugacy of maximal tori.** Every Borel contains a maximal torus and all Borels are conjugate, so what remains is conjugacy of maximal tori inside a connected solvable group.
- **The Weyl group and root datum of a reductive group.** `N(T)/T` is finite étale; it still has to be identified with the Weyl group of the root system read off from the adjoint action. That is the gateway to Layer 8.
- **`SLₙ → PGLₙ` as a central isogeny.** Finiteness and a central kernel are proved. Injectivity of the coordinate morphism `O(PGLₙ) → O(SLₙ)` is the missing piece.
- **Reductive versus linearly reductive in characteristic zero.** Done for `GLₙ`; the general equivalence for smooth connected groups is not established.
- **Representable quotients `G/H`.** Affine quotients by reductive or linearly reductive subgroups exist. The general case still needs flatness of the orbit map onto a projective orbit, and its identification with the fppf sheaf `G/H`.

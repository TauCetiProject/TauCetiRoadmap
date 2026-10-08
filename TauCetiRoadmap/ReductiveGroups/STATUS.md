<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a","ts":"2026-10-07T18:27:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"representability of G/H for general closed H via flatness of the projective orbit map; affineness of G/H for reductive H","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"general maximality theorem for the unipotent radical","state":"partial"},{"id":"Layer 6","remaining":"characteristic-zero equivalence with linear reductivity; simply connected covers; SLn to PGLn as a central isogeny","state":"partial"},{"id":"Layer 7","remaining":"conjugacy of Borels and maximal tori beyond GLn and SLn; root datum of an arbitrary reductive group; N(T)/T as Weyl group","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"uniform pinned construction from arbitrary root data, existence half of the pinned isomorphism theorem, and identification of the explicit carriers with pinned groups","state":"partial"}],"readme_sha":"b6888bb0f65d0f4a7686c047ee2d3204d019fb3e6c35fc0bd83b531ef10b4c1b","roadmap":"ReductiveGroups","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `8334df2` (2026-10-07T18:27:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Four layers are done: the three-way group-scheme dictionary, representations as comodules, the Lie algebra, and tori with Jordan decomposition. Subgroups and quotients, the unipotent radical, reductivity, structure theory and the pinned Chevalley lane are partial. Classification has not begun.

### Named results

- **The Hopf algebra–affine group scheme anti-equivalence**: [`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat) identifies commutative Hopf algebras with affine group schemes, reversing the direction of morphisms.
- **The embedding theorem**: by [`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear), every affine group scheme of finite type over a field is a closed subgroup of some general linear group.
- **Tannakian reconstruction**: [`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv) recovers the points of a commutative Hopf algebra from its finite-dimensional comodules.
- **Chevalley's theorem on subgroups**: by [`exists_finite_subcomodule_exteriorPower_line_stabilizer`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.html#TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer), a closed subgroup whose ideal is finitely generated is the stabilizer of a line in a finite-dimensional representation.
- **Quotients by normal subgroups**: let `G` be geometrically reduced and of finite type over a field, and `N` a normal closed subgroup. The fppf quotient of `G` by `N` [is represented by the coinvariant Hopf algebra](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Coinvariants.html#TauCeti.CommHopfAlgCat.coinvariantsFppfQuotientIso). The projection is faithfully flat, and [its kernel is exactly `N`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Coinvariants/Exactness.html#TauCeti.CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_eq).

### Notable definitions and infrastructure

- **Orbits in projective space.** The orbit of a line under a group of finite type is a scheme. The map onto it is [flat over a dense open](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/GenericFlatness.html#TauCeti.Comodule.exists_dense_open_flat_toProjectiveOrbit), and rational translations act transitively on its closed points. These are the inputs for representing `G/H` by the orbit of the line from Chevalley's theorem.
- **Borel subgroups and pinnings over a base.** A [Borel subgroup over a ring](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Over.html#TauCeti.HopfIdeal.IsBorelOver) is a smooth closed subgroup that is Borel on every geometric fibre. A [pinning](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Pinning/Basic.html#TauCeti.Pinning) adds a split maximal torus and trivializations of the simple root spaces. Together these give Layer 9 its interface, as data.
- **Explicit Chevalley carriers.** These are toral closures of root subgroups inside general linear groups over `ℤ`, such as the [`E₆` minuscule carrier](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/E6/Minuscule/GroupScheme.html#TauCeti.E6Minuscule.groupScheme). A morphism out of the type-`C` carrier [is determined by its values on the root subgroups and the torus](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/Symplectic/StandardCarrier/Scheme.html#TauCeti.SpStd.groupScheme_hom_ext).

### Roadmap coverage

Layers 0–2 and 4 are done.

- **Layer 3** has Hopf ideals, kernels, component groups, short exact sequences, Chevalley's theorem, and the quotient of a geometrically reduced group by a normal subgroup as the fppf quotient. It lacks representability of `G/H` for a general closed subgroup, and affineness of `G/H` when `H` is reductive.
- **Layer 5** can recognise the unipotent radical but has no general maximality theorem.
- **Layer 6** proves that `GLₙ`, `SLₙ`, `Sp₂ₘ` and `SOₙ` are reductive, the last away from characteristic two. It also has radicals, central isogenies, derived subgroups and linear reductivity. It lacks the characteristic-zero equivalence with linear reductivity, and simply connected covers. For `SLₙ → PGLₙ`, finiteness and a central kernel are proved, but the map is not yet shown to be a central isogeny.
- **Layer 7** has Borel subgroups, maximal tori, dynamic parabolics, Tits systems for `GLₙ` and `SLₙ`, and root data for three split classical families. Conjugacy of Borel subgroups is proved only for `GLₙ` and `SLₙ`.
- **Layer 8** is untouched.
- **Layer 9** has pinnings, explicit carriers for many types with triality and special isogenies, and reductivity of the short-root `G₂` and `F₄` carriers over their prime fields. It lacks a construction from an arbitrary root datum, and the pinned isomorphism theorem.

## The frontier

- **Representable quotients `G/H`.** The ingredients listed above are in place. What remains is to combine them into global flatness of the orbit map, and then to identify the orbit with the fppf sheaf `G/H`. Affineness when `H` is reductive comes after that.
- **`SLₙ → PGLₙ` as a central isogeny.** Over a field, this reduces to injectivity of the coordinate morphism `O(PGLₙ) → O(SLₙ)`, the one missing piece.
- **Conjugacy of Borel subgroups, and root data in general.** Conjugacy is known only for `GLₙ` and `SLₙ`. The general case must come before extracting the root datum of an arbitrary reductive group. Identifying `N(T)/T` with the Weyl group is still open.
- **Reductive versus linearly reductive in characteristic zero.** Linear reductivity and exact invariants exist; the equivalence itself is missing.
- **Carriers as pinned groups.** The type-`C` carrier is matched with the symplectic group only on points over a field. The spin, tripled `D₄` and `E₆` carriers still have to be identified with the smooth connected subgroups their root subgroups generate, and then given pinnings. Also missing are the existence half of the pinned isomorphism theorem and a uniform construction from root data.

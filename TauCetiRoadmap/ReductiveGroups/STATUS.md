<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f","ts":"2026-11-18T04:36:49Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"cofree acyclicity, derived-functor comparison and long exact sequence for rational cohomology; invariants comparison; induction API beyond reciprocity","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"homogeneous quotient representability beyond reduced groups over algebraically closed fields","state":"partial"},{"id":"Layer 3A","remaining":"complex-point comparison, restriction to O(1) sections and remaining worked tests","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 5P","remaining":"realization independence, field-extension and automorphism compatibility, complex Lie exponential comparison","state":"partial"},{"id":"Layer 6","remaining":"simply connected covers; linear reductivity of disconnected groups in char 0; Nagata beyond solvable groups","state":"partial"},{"id":"Layer 6A","remaining":"vector filtrations, sections, cohomological splitting, complement construction and conjugacy","state":"partial"},{"id":"Layer 6B","remaining":"disconnected subgroups with reductive identity component, scheme-level universal property, base change over k-schemes","state":"partial"},{"id":"Layer 7","remaining":"unconditional torus conjugacy, root datum, centralizer equals torus, Bruhat and general parabolic Levi theory","state":"partial"},{"id":"Layer 7C","remaining":"additive root parameterizations, rank-one isogenies, commutators, height filtration and ordered coordinates","state":"partial"},{"id":"Layer 7a","remaining":"Lang adapters for stable parabolics, unipotent radicals and connected centralizers","state":"partial"},{"id":"Layer 7b","state":"untouched"},{"id":"Layer 7c","state":"untouched"},{"id":"Layer 7d","state":"untouched"},{"id":"Layer 7e","state":"untouched"},{"id":"Layer 7f","remaining":"Harish-Chandra to permutation-module adapter","state":"partial"},{"id":"Layer 8","remaining":"split reductive data over general nonempty bases retaining the full root datum","state":"partial"},{"id":"Layer 9","remaining":"Chevalley Lie algebra vs group Lie algebra comparison, uniform pinned group construction, general folding, pinned isomorphism existence","state":"partial"},{"id":"Layer 9D","remaining":"isomorphism and existence theorems, relative center and derived group, forms, perfect-field pseudo-reductivity, nilradical filtration","state":"partial"},{"id":"Layer 9E","state":"untouched"},{"id":"Layer 10","remaining":"induced, Weyl and simple modules, dominant-weight classification, V-dual tensor V identification of coefficient summands","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"92b2037a446d3f00138dcc52cf0633fe023612d6894fa99919d5e8752851ee88","roadmap":"ReductiveGroups","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `bf5b062` (2026-11-18T04:36:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The functor-of-points dictionary, the Lie algebra, tori and solvable groups are done, as is Matsushima's affine quotient for connected reductive subgroups. Rational cohomology now has its Hochschild complex but not its derived-functor theory, so Layer 1 stays partial. Structure theory, Levi complements, the integral constructions, the relative theory and highest-weight theory are partial. The finite-field representation lanes, Steinberg endomorphisms and the spectral layer have not begun.

### Named results

- **Conjugacy of Borel subgroups** — any two Borel subgroups of a finite-type affine group over an algebraically closed field are conjugate, even when the ambient group is not smooth or connected ([`exists_conjugate_eq`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.html#TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq)).
- **Matsushima's affine quotient** — for geometrically reduced finite-type `G` and linearly reductive `N`, the quotient after any field extension is `Spec (K ⊗ O(G)^N)` ([`fppfHomogeneousQuotientBaseChangeIso`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/BaseChange.html#TauCeti.HopfIdeal.fppfHomogeneousQuotientBaseChangeIso)).
- **The classification of tori over any field** — tori over an arbitrary field, perfect or not, are equivalent to continuous Galois lattices through their characters, by descent through the separable closure ([`characterLatticeFunctor_isEquivalence`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Torus/CharacterLattice/Equivalence.html#TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor_isEquivalence)).
- **The cosemisimple decomposition** — over any field, a linearly reductive coalgebra is the direct sum of the coefficient spaces of its simple comodules, labelled by isomorphism classes ([`isInternal_simpleCoefficientSubmodules`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive/Decomposition.html#TauCeti.Coalgebra.IsLinearlyReductive.isInternal_simpleCoefficientSubmodules)).
- **Enough injective comodules** — comodules over a flat coalgebra have enough injectives, with no condition on the coefficient module, because the cofree comodule on an injective module is injective ([`instEnoughInjectives`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/EnoughInjectives.html#TauCeti.ComoduleCat.instEnoughInjectives)).

### Notable definitions and infrastructure

- **The Hochschild complex of a comodule**, `M ⊗ H^⊗n` with the alternating sum of cofaces, has degree-zero cohomology equal to the invariants, naturally in `M`. It is the invariant complex of the cofree resolution and the intended model for rational cohomology ([`cochainComplex`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/Cohomology/Basic.html#TauCeti.Comodule.Cohomology.cochainComplex), [`cohomologyZeroIso`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/Cohomology/Basic.html#TauCeti.Comodule.Cohomology.cohomologyZeroIso)).
- **Reductivity over a ring** means smoothness together with connected reductive geometric fibres. It is stable under base change, every fibre is reductive over any field, and it is the entry point to the relative theory ([`reductiveCommHopfAlgPropertyOver`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Reductive/Over.html#TauCeti.reductiveCommHopfAlgPropertyOver)).
- **The integral Chevalley Lie algebra** of a root datum is built on the full cocharacter group from a table of structure constants, with an integral basis and a universal property. In the simply connected case it is identified over `ℤ` with the Chevalley lattice of the pinned rational Lie algebra, which is where the integral group construction of Layer 9 starts ([`ChevalleyLieAlgebra`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Chevalley/Basic.html#RootPairing.ChevalleyLieAlgebra)).

### Roadmap coverage

Layers 0, 2, 4 and 5 are done; Layer 4 was strengthened by removing the perfect-field hypothesis from the torus classification. The partial layers, with what is missing in each, are:

- 1: the comodule dictionary, the convolution-dual description, enough injectives and the Hochschild complex with `H⁰` are in place. Still missing: cofree acyclicity, the derived-functor comparison, the long exact sequence, the invariants comparison and induction beyond reciprocity.
- 3: general homogeneous quotients.
- 3A: the complex comparison and sections of `O(1)`.
- 5P: the intrinsic comparisons of exp and log.
- 6: simply connected covers, linear reductivity of disconnected groups in characteristic zero, and Nagata's theorem beyond solvable groups.
- 6A: the splitting machinery and the complement itself.
- 6B: disconnected subgroups, the scheme-level universal property and base change over `k`-schemes.
- 7 and 7C: torus conjugacy, root extraction and Bruhat.
- 7a: the Lang adapters. 7f: the permutation adapter.
- 8: pinnings exist over connected bases, but the full split datum does not.
- 9: the integral Chevalley Lie algebra exists, and the type-A and type-D graph fixed algebras are computed. The group comparison, the uniform construction and general folding are missing.
- 9D: classification, relative structure, forms and the nilradical filtration.
- 10: general highest-weight theory.

Layers 7b–7e, 9E and 11 are untouched.

## The frontier

- **Rational cohomology.** Prove that cofree comodules are acyclic for the Hochschild complex, identify its cohomology with the derived functors of invariants, and build the long exact sequence.
- **Maximal-torus conjugacy.** Remove the remaining hypothesis that a diagonalizable subgroup can be conjugated. Centralizer-equals-torus and the root datum depend on this.
- **Algebraic Peter–Weyl.** Over an algebraically closed field, identify each summand of the cosemisimple decomposition with `V* ⊗ V`. In characteristic zero, index them by dominant weights, which needs Layer 10B's Weyl modules.
- **Linear reductivity of disconnected groups.** In characteristic zero, prove that `G` is linearly reductive exactly when its identity component is reductive. Layer 6B's disconnected quotients would then follow from the pinned linearly reductive case.
- **Pseudo-reductive over perfect fields.** Use Galois descent of Hopf ideals to descend the geometric unipotent radical, then prove that the two notions agree.

<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"rational cohomology via the cofree resolution and its long exact sequence, invariants comparison and the induction API beyond reciprocity","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"homogeneous quotient representability beyond reduced groups over algebraically closed fields","state":"partial"},{"id":"Layer 3A","remaining":"complex-point comparison, restriction to O(1) sections and remaining worked tests","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 5P","remaining":"realization independence, field-extension and automorphism compatibility, complex Lie exponential comparison","state":"partial"},{"id":"Layer 6","remaining":"simply connected covers; linear reductivity of disconnected groups in char 0; Nagata beyond solvable groups","state":"partial"},{"id":"Layer 6A","remaining":"vector filtrations, sections, cohomological splitting, complement construction and conjugacy","state":"partial"},{"id":"Layer 6B","remaining":"disconnected subgroups with reductive identity component, scheme-level universal property, base change over k-schemes","state":"partial"},{"id":"Layer 7","remaining":"unconditional torus conjugacy, root datum, centralizer equals torus, Bruhat and general parabolic Levi theory","state":"partial"},{"id":"Layer 7C","remaining":"additive root parameterizations, rank-one isogenies, commutators, height filtration and ordered coordinates","state":"partial"},{"id":"Layer 7a","remaining":"Lang adapters for stable parabolics, unipotent radicals and connected centralizers","state":"partial"},{"id":"Layer 7b","state":"untouched"},{"id":"Layer 7c","state":"untouched"},{"id":"Layer 7d","state":"untouched"},{"id":"Layer 7e","state":"untouched"},{"id":"Layer 7f","remaining":"Harish-Chandra to permutation-module adapter","state":"partial"},{"id":"Layer 8","remaining":"split reductive data over general nonempty bases retaining the full root datum","state":"partial"},{"id":"Layer 9","remaining":"Chevalley Lie algebra vs group Lie algebra comparison, uniform pinned group construction, folding, pinned isomorphism existence and carrier identification","state":"partial"},{"id":"Layer 9D","remaining":"isomorphism and existence theorems, relative center and derived group, forms, perfect-field pseudo-reductivity, nilradical filtration of the Weil example","state":"partial"},{"id":"Layer 9E","state":"untouched"},{"id":"Layer 10","remaining":"induced, Weyl and simple modules, dominant-weight classification, V-dual tensor V identification of coefficient summands","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"7c21735dae6065f0ad8f297dc98be3b7ed3b5049da12a8a644493a17a14c1f8a","roadmap":"ReductiveGroups","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The functor-of-points dictionary, the Lie algebra, tori and solvable groups are done, as is Matsushima's affine quotient for connected reductive subgroups. Comodules now have enough injectives, but rational cohomology itself is still missing, so Layer 1 stays partial. Structure theory, Levi complements, the integral constructions, the relative theory and highest-weight theory are partial. The finite-field representation lanes, Steinberg endomorphisms and the spectral layer have not begun.

### Named results

- **Conjugacy of Borel subgroups** — any two Borel subgroups of a finite-type affine group over an algebraically closed field are conjugate, even when the ambient group is not smooth or connected ([`exists_conjugate_eq`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.html#TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq)).
- **Matsushima's affine quotient** — for geometrically reduced finite-type `G` and linearly reductive `N`, the quotient after any field extension is `Spec (K ⊗ O(G)^N)` ([`fppfHomogeneousQuotientBaseChangeIso`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/BaseChange.html#TauCeti.HopfIdeal.fppfHomogeneousQuotientBaseChangeIso)).
- **The rational Weyl quotient** — for a closed diagonalizable subgroup, the Weyl group is the rational normalizer modulo the rational centralizer ([`normalizerQuotientCentralizerEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Normalizer/WeylGroup.html#BialgHom.normalizerQuotientCentralizerEquiv)).
- **The cosemisimple decomposition** — over any field, a linearly reductive coalgebra is the direct sum of the coefficient spaces of its simple comodules, labelled by isomorphism classes ([`isInternal_simpleCoefficientSubmodules`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive/Decomposition.html#TauCeti.Coalgebra.IsLinearlyReductive.isInternal_simpleCoefficientSubmodules), [`matrixCoefficientSubmodule_eq_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/Isotypic.html#TauCeti.Comodule.matrixCoefficientSubmodule_eq_iff)).
- **Enough injective comodules** — comodules over a flat coalgebra have enough injectives, with no condition on the coefficient module, because the cofree comodule on an injective module is injective ([`instEnoughInjectives`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/EnoughInjectives.html#TauCeti.ComoduleCat.instEnoughInjectives)).

### Notable definitions and infrastructure

- **Reductivity over a ring** means smoothness together with connected reductive geometric fibres. It is stable under base change, every fibre is reductive over any field, and it is the entry point to the relative theory ([`reductiveCommHopfAlgPropertyOver`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Reductive/Over.html#TauCeti.reductiveCommHopfAlgPropertyOver)).
- **The integral Chevalley Lie algebra** of a root datum is built on the full cocharacter group, central torus included, from a table of Chevalley structure constants, with an integral basis and a universal property. In the simply connected case it is identified over `ℤ` with the Chevalley lattice of the pinned rational Lie algebra, which is what the integral group construction of Layer 9 starts from ([`ChevalleyLieAlgebra`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Chevalley/Basic.html#RootPairing.ChevalleyLieAlgebra), [`simplyConnectedChevalleyLieEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Chevalley/Semisimple.html#TauCeti.DynkinType.simplyConnectedChevalleyLieEquiv)).
- **Galois descent of Hopf ideals** identifies the closed subgroups defined over `k` with the Galois-stable closed subgroups over `L`. The perfect-field comparison of pseudo-reductive and reductive groups will need it ([`existsUnique_baseChangeHopfIdeal_eq_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Descent.html#TauCeti.CommHopfAlgCat.existsUnique_baseChangeHopfIdeal_eq_iff)).

### Roadmap coverage

Layers 0, 2, 4 and 5 are done. The partial layers, with what is missing in each, are:

- 1: the comodule dictionary, pinned induction and enough injectives are in place. Rational cohomology through the cofree resolution, the invariants comparison and the induction API beyond reciprocity are missing.
- 3: general homogeneous quotients.
- 3A: the complex comparison and sections of `O(1)`.
- 5P: the intrinsic comparisons of exp and log.
- 6: simply connected covers, linear reductivity of disconnected groups in characteristic zero, and Nagata's theorem beyond solvable groups.
- 6A: the splitting machinery and the complement itself.
- 6B: the connected case is done; disconnected subgroups, the scheme-level universal property and base change over `k`-schemes are missing.
- 7 and 7C: torus conjugacy, root extraction and Bruhat.
- 7a: the Lang adapters. 7f: the permutation adapter.
- 8: pinnings exist over connected bases, but the full split datum does not.
- 9: the integral Chevalley Lie algebra exists; its comparison with the group's Lie algebra, the uniform group construction and folding do not.
- 9D: the relative reductivity predicate and the Weil-restriction example exist; the nilradical filtration, classification, relative structure and forms do not.
- 10: the coefficient decomposition and rank one exist, but general highest-weight theory does not.

Layers 7b–7e, 9E and 11 are untouched.

## The frontier

- **Rational cohomology.** With enough injectives in hand, define rational cohomology as the derived functors of invariants, prove the cofree resolution computes it, and build the long exact sequence.
- **Maximal-torus conjugacy.** Remove the remaining hypothesis that a diagonalizable subgroup can be conjugated. Centralizer-equals-torus and the root datum depend on this.
- **Algebraic Peter–Weyl.** Over an algebraically closed field, identify each summand of the cosemisimple decomposition with `V* ⊗ V`. In characteristic zero, index them by dominant weights, which needs Layer 10B's Weyl modules.
- **Linear reductivity of disconnected groups.** In characteristic zero, prove that `G` is linearly reductive exactly when its identity component is reductive. Layer 6B's disconnected quotients follow from the pinned linearly reductive case once this is in place.
- **Pseudo-reductive over perfect fields.** Use Galois descent to descend the geometric unipotent radical, then prove that the two notions agree.

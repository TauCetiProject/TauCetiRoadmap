<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"cofree acyclicity, derived-functor comparison and long exact sequence for rational cohomology; invariants comparison; induction API beyond reciprocity","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"homogeneous quotient representability beyond reduced groups over algebraically closed fields","state":"partial"},{"id":"Layer 3A","remaining":"complex-point comparison, restriction to O(1) sections and remaining worked tests","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"comodule unipotence and its equivalent forms; G = G_u semidirect T over k-bar; solvable groups over perfect fields; radical quotient under arbitrary extension","state":"partial"},{"id":"Layer 5P","remaining":"realization independence, field-extension and automorphism compatibility, complex Lie exponential comparison","state":"partial"},{"id":"Layer 6","remaining":"simply connected covers; linear reductivity of disconnected groups in char 0; Nagata beyond solvable groups","state":"partial"},{"id":"Layer 6A","remaining":"vector filtrations, sections, cohomological splitting, complement construction and conjugacy","state":"partial"},{"id":"Layer 6B","remaining":"disconnected subgroups with reductive identity component, scheme-level universal property, base change over k-schemes","state":"partial"},{"id":"Layer 7","remaining":"unconditional torus conjugacy, root datum, centralizer equals torus, Bruhat and general parabolic Levi theory","state":"partial"},{"id":"Layer 7C","remaining":"additive root parameterizations, rank-one isogenies, commutators, height filtration and ordered coordinates","state":"partial"},{"id":"Layer 7a","remaining":"Lang adapters for stable parabolics, unipotent radicals and connected centralizers","state":"partial"},{"id":"Layer 7b","state":"untouched"},{"id":"Layer 7c","state":"untouched"},{"id":"Layer 7d","state":"untouched"},{"id":"Layer 7e","state":"untouched"},{"id":"Layer 7f","remaining":"Harish-Chandra to permutation-module adapter","state":"partial"},{"id":"Layer 8","remaining":"split reductive data over general nonempty bases retaining the full root datum","state":"partial"},{"id":"Layer 9","remaining":"Chevalley Lie algebra vs group Lie algebra comparison, uniform pinned group construction, general folding, pinned isomorphism existence","state":"partial"},{"id":"Layer 9D","remaining":"isomorphism and existence theorems, relative center and derived group, forms, nilradical filtration","state":"partial"},{"id":"Layer 9E","state":"untouched"},{"id":"Layer 10","remaining":"induced, Weyl and simple modules, dominant-weight classification, V-dual tensor V identification of coefficient summands","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"850de6e1d9ec1f6378cdec5d77a3ba9cd9ff3de0080db8faff26190fb7214070","roadmap":"ReductiveGroups","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The functor-of-points dictionary, the Lie algebra and tori are done, as is Matsushima's affine quotient for connected reductive subgroups. Unipotent and solvable groups, rational cohomology, structure theory, Levi complements, the integral constructions, the relative theory and highest-weight theory are partial. The finite-field representation lanes, Steinberg endomorphisms and the spectral layer have not begun.

### Named results

- **Conjugacy of Borel subgroups** — any two Borel subgroups of a finite-type affine group over an algebraically closed field are conjugate, even when the ambient group is not smooth or connected ([`exists_conjugate_eq`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.html#TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq)).
- **Matsushima's affine quotient** — for geometrically reduced finite-type `G` and linearly reductive `N`, the quotient after any field extension is `Spec (K ⊗ O(G)^N)` ([`fppfHomogeneousQuotientBaseChangeIso`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/BaseChange.html#TauCeti.HopfIdeal.fppfHomogeneousQuotientBaseChangeIso)).
- **The classification of tori over any field** — tori over an arbitrary field, perfect or not, are equivalent to continuous Galois lattices through their characters ([`characterLatticeFunctor_isEquivalence`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Torus/CharacterLattice/Equivalence.html#TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor_isEquivalence)).
- **Pseudo-reductive equals reductive over perfect fields** — over a perfect field a finite-type affine group is pseudo-reductive exactly when it is reductive, because the `k`-unipotent radical commutes with separable algebraic extensions ([`pseudoReductiveCommHopfAlgProperty_iff_reductive`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/PseudoReductive/Basic.html#TauCeti.pseudoReductiveCommHopfAlgProperty_iff_reductive), [`baseChangeHopfIdeal_unipotentRadicalDefiningIdeal`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Descent.html#TauCeti.FiniteTypeCommHopfAlgCat.baseChangeHopfIdeal_unipotentRadicalDefiningIdeal)).
- **The cosemisimple decomposition** — over any field, a linearly reductive coalgebra is the direct sum of the coefficient spaces of its simple comodules ([`isInternal_simpleCoefficientSubmodules`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive/Decomposition.html#TauCeti.Coalgebra.IsLinearlyReductive.isInternal_simpleCoefficientSubmodules)).

### Notable definitions and infrastructure

- **The Hochschild complex of a comodule**, `M ⊗ H^⊗n` with the alternating sum of cofaces, now exists as a cosimplicial module over any bialgebra, and its degree-zero cocycles are the invariants. It is the intended model for rational cohomology ([`hochschildComplex`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/Hochschild/Complex.html#TauCeti.Comodule.hochschildComplex)).
- **Reductivity over a ring** means smoothness together with connected reductive geometric fibres. It is stable under base change and is the entry point to the relative theory ([`reductiveCommHopfAlgPropertyOver`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Reductive/Over.html#TauCeti.reductiveCommHopfAlgPropertyOver)).
- **The integral Chevalley Lie algebra** of a root datum is built from a table of structure constants, with an integral basis and a universal property. In the simply connected case it is identified over `ℤ` with the Chevalley lattice of the pinned rational Lie algebra ([`ChevalleyLieAlgebra`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Chevalley/Basic.html#RootPairing.ChevalleyLieAlgebra)).

### Roadmap coverage

Layers 0, 2 and 4 are done; Layer 4 now also knows that `D(G)` is smooth exactly when `G` has no `p`-torsion. Layer 5 was previously counted done, but the rewritten roadmap asks for more than is in the library. The radical now descends along separable extensions and `G/R_u(G)` is reductive over a perfect field. Still missing: the comodule definition of unipotence with its equivalent forms, the decomposition `G = G_u ⋊ T` and the perfect-field theory of solvable groups. The other partial layers, with what is missing in each:

- 1: cofree acyclicity, the derived-functor comparison, the long exact sequence and induction beyond reciprocity.
- 3: general homogeneous quotients. 3A: the complex comparison and sections of `O(1)`.
- 5P: the intrinsic comparisons of exp and log.
- 6: simply connected covers, linear reductivity of disconnected groups in characteristic zero, and Nagata's theorem beyond solvable groups. Isogenies now have étale kernels in characteristic zero.
- 6A: the splitting machinery and the complement. 6B: disconnected subgroups and the scheme-level universal property.
- 7 and 7C: torus conjugacy, root extraction and Bruhat.
- 7a: the Lang adapters. 7f: the permutation adapter.
- 8: the full split datum over general bases.
- 9: the group comparison, the uniform construction and general folding.
- 9D: classification, relative structure, forms and the nilradical filtration; the perfect-field pseudo-reductive comparison is now done.
- 10: general highest-weight theory.

Layers 7b–7e, 9E and 11 are untouched.

## The frontier

- **Rational cohomology.** Prove that cofree comodules are acyclic for the Hochschild complex, identify its cohomology with the derived functors of invariants, and build the long exact sequence.
- **Maximal-torus conjugacy.** Remove the remaining hypothesis that a diagonalizable subgroup can be conjugated. Centralizer-equals-torus and the root datum depend on this.
- **Solvable groups.** Over `k̄`, prove `G = G_u ⋊ T` with multiplicative-type subgroups conjugate into `T`. Over a perfect field, prove `G/G_u` is a torus, using the new radical base change.
- **Algebraic Peter–Weyl.** Identify each summand of the cosemisimple decomposition with `V* ⊗ V`, and in characteristic zero index them by dominant weights, which needs Layer 10's Weyl modules.
- **Linear reductivity of disconnected groups.** In characteristic zero, prove that `G` is linearly reductive exactly when its identity component is reductive.

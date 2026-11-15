<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"bb8823c5e38bc55ef007e5f98b63f0746cbf61a9","ts":"2026-11-11T06:13:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"enough injectives, rational cohomology via the cofree resolution, invariants comparison and the induction API beyond reciprocity","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"homogeneous quotient representability beyond reduced groups over algebraically closed fields","state":"partial"},{"id":"Layer 3A","remaining":"complex-point comparison, restriction to O(1) sections and remaining worked tests","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 5P","remaining":"realization independence, field-extension and automorphism compatibility, complex Lie exponential comparison","state":"partial"},{"id":"Layer 6","remaining":"simply connected covers; linear reductivity of disconnected groups in char 0; Nagata beyond solvable groups","state":"partial"},{"id":"Layer 6A","remaining":"vector filtrations, sections, cohomological splitting, complement construction and conjugacy","state":"partial"},{"id":"Layer 6B","remaining":"disconnected subgroups with reductive identity component, scheme-level universal property, base change over k-schemes","state":"partial"},{"id":"Layer 7","remaining":"unconditional torus conjugacy, root datum, centralizer equals torus, Bruhat and general parabolic Levi theory","state":"partial"},{"id":"Layer 7C","remaining":"additive root parameterizations, rank-one isogenies, commutators, height filtration and ordered coordinates","state":"partial"},{"id":"Layer 7a","remaining":"Lang adapters for stable parabolics, unipotent radicals and connected centralizers","state":"partial"},{"id":"Layer 7b","state":"untouched"},{"id":"Layer 7c","state":"untouched"},{"id":"Layer 7d","state":"untouched"},{"id":"Layer 7e","state":"untouched"},{"id":"Layer 7f","remaining":"Harish-Chandra to permutation-module adapter","state":"partial"},{"id":"Layer 8","remaining":"split reductive data over general nonempty bases retaining the full root datum","state":"partial"},{"id":"Layer 9","remaining":"uniform pinned construction, signed fixed Lie algebra and folding, pinned isomorphism existence and carrier identification","state":"partial"},{"id":"Layer 9D","remaining":"isomorphism and existence theorems, relative center and derived group, forms, perfect-field pseudo-reductivity, nilradical filtration of the Weil example","state":"partial"},{"id":"Layer 9E","state":"untouched"},{"id":"Layer 10","remaining":"induced, Weyl and simple modules, dominant-weight classification, V-dual tensor V identification of coefficient summands","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"7c21735dae6065f0ad8f297dc98be3b7ed3b5049da12a8a644493a17a14c1f8a","roadmap":"ReductiveGroups","to_sha":"bb8823c5e38bc55ef007e5f98b63f0746cbf61a9"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `bb8823c` (2026-11-11T06:13:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The functor-of-points dictionary, the Lie algebra, tori and solvable groups are done, as is Matsushima's affine quotient for connected reductive subgroups. The roadmap now also asks for rational cohomology in Layer 1 and for disconnected subgroups in Layer 6B, so both layers are partial again. Structure theory, Levi complements, the integral constructions, the relative theory and highest-weight theory are partial. The finite-field representation lanes, Steinberg endomorphisms and the spectral layer have not begun.

### Named results

- **Conjugacy of Borel subgroups** — any two Borel subgroups of a finite-type affine group over an algebraically closed field are conjugate, even when the ambient group is not smooth or connected ([`exists_conjugate_eq`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.html#TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq)).
- **Matsushima's affine quotient** — for geometrically reduced finite-type `G` and linearly reductive `N`, the quotient after any field extension is `Spec (K ⊗ O(G)^N)` ([`fppfHomogeneousQuotientBaseChangeIso`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/BaseChange.html#TauCeti.HopfIdeal.fppfHomogeneousQuotientBaseChangeIso)).
- **The rational Weyl quotient** — for a closed diagonalizable subgroup, the Weyl group is the rational normalizer modulo the rational centralizer ([`normalizerQuotientCentralizerEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Normalizer/WeylGroup.html#BialgHom.normalizerQuotientCentralizerEquiv)).
- **The cosemisimple decomposition** — over any field, a linearly reductive coalgebra is the direct sum of the coefficient spaces of its simple comodules ([`isInternal_simpleCoefficientSubmodules`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive/Decomposition.html#TauCeti.Coalgebra.IsLinearlyReductive.isInternal_simpleCoefficientSubmodules)). Two simple comodules have the same coefficient space exactly when they are isomorphic ([`matrixCoefficientSubmodule_eq_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/Isotypic.html#TauCeti.Comodule.matrixCoefficientSubmodule_eq_iff)), so the summands are labelled by isomorphism classes.
- **Simplicity of binary forms** — in characteristic `p`, the binary forms of degree `d` are simple exactly when `d + 1 = (a + 1)pᵐ` with `a < p` ([`isAtom_binaryForms_iff_of_charP`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/BinaryForm/Basic.html#TauCeti.SpecialLinear.isAtom_binaryForms_iff_of_charP)).

### Notable definitions and infrastructure

- **Reductivity over a ring** means smoothness together with connected reductive geometric fibres. It is stable under arbitrary base change, every fibre is reductive over any field, and it is the entry point to the relative theory ([`reductiveCommHopfAlgPropertyOver`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Reductive/Over.html#TauCeti.reductiveCommHopfAlgPropertyOver)).
- **Galois descent of Hopf ideals** identifies the closed subgroups defined over `k` with the Galois-stable closed subgroups over `L`. The perfect-field comparison of pseudo-reductive and reductive groups will need it ([`existsUnique_baseChangeHopfIdeal_eq_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Descent.html#TauCeti.CommHopfAlgCat.existsUnique_baseChangeHopfIdeal_eq_iff)).
- **The Weil restriction of `𝔾ₘ` in coordinates** is the complement of the norm hypersurface in affine space, which makes the standard pseudo-reductive, non-reductive example over `k(a^(1/p))` explicit ([`multiplicativeGroupAlgEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/WeilRestriction/Coordinate.html#TauCeti.Algebra.WeilRestriction.multiplicativeGroupAlgEquiv)).

### Roadmap coverage

Layers 0, 2, 4 and 5 are done. The partial layers, with what is missing in each, are:

- 1: the comodule dictionary and pinned induction are in place. Rational cohomology, enough injectives for flat Hopf algebras, and the induction API beyond reciprocity are missing.
- 3: general homogeneous quotients.
- 3A: the complex comparison and sections of `O(1)`.
- 5P: the intrinsic comparisons of exp and log.
- 6: simply connected covers, linear reductivity of disconnected groups in characteristic zero, and Nagata's theorem beyond solvable groups.
- 6A: the splitting machinery and the complement itself.
- 6B: the connected case is done. Disconnected subgroups with reductive identity component, the scheme-level universal property and base change over `k`-schemes are missing.
- 7 and 7C: torus conjugacy, root extraction and Bruhat.
- 7a: the Lang adapters. 7f: the permutation adapter.
- 8: pinnings exist over connected bases, but the full split datum does not.
- 9: the uniform construction and folding.
- 9D: the relative reductivity predicate, its fibres and the Weil-restriction example with coordinates exist. The nilradical filtration, classification, relative structure and forms do not.
- 10: the coefficient decomposition and rank one exist, but general highest-weight theory does not.

Layers 7b–7e, 9E and 11 are untouched.

## The frontier

- **Maximal-torus conjugacy.** Remove the remaining hypothesis that a diagonalizable subgroup can be conjugated. Centralizer-equals-torus and the root datum depend on this.
- **Algebraic Peter–Weyl.** The summands are now labelled by isomorphism classes. Over an algebraically closed field, identify each with `V* ⊗ V`. In characteristic zero, index them by dominant weights, which needs Layer 10B's Weyl modules.
- **Linear reductivity of disconnected groups.** In characteristic zero, prove that `G` is linearly reductive exactly when its identity component is reductive. Layer 6B's disconnected quotients follow from the pinned linearly reductive case once this is in place.
- **Pseudo-reductive over perfect fields.** Use Galois descent to descend the geometric unipotent radical, then prove that the two notions agree.
- **Rational cohomology.** Prove that comodules over a flat Hopf algebra have enough injectives, then build the cofree resolution and its long exact sequence.

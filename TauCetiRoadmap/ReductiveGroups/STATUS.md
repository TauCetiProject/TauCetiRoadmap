<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"7a6772d920699412927989888cd1c7b61ac67cee","ts":"2026-11-10T20:47:44+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"homogeneous quotient representability beyond reduced groups over algebraically closed fields","state":"partial"},{"id":"Layer 3A","remaining":"complex-point comparison, restriction to O(1) sections and remaining worked tests","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 5P","remaining":"realization independence, field-extension and automorphism compatibility, complex Lie exponential comparison","state":"partial"},{"id":"Layer 6","remaining":"simply connected covers; positive-characteristic linear reductivity forcing a torus beyond solvable groups","state":"partial"},{"id":"Layer 6A","remaining":"vector filtrations, sections, cohomological splitting, complement construction and conjugacy","state":"partial"},{"id":"Layer 6B","state":"done"},{"id":"Layer 7","remaining":"unconditional torus conjugacy, root datum, centralizer equals torus, Bruhat and general parabolic Levi theory","state":"partial"},{"id":"Layer 7C","remaining":"additive root parameterizations, rank-one isogenies, commutators, height filtration and ordered coordinates","state":"partial"},{"id":"Layer 7a","remaining":"Lang adapters for stable parabolics, unipotent radicals and connected centralizers","state":"partial"},{"id":"Layer 7b","state":"untouched"},{"id":"Layer 7c","state":"untouched"},{"id":"Layer 7d","state":"untouched"},{"id":"Layer 7e","state":"untouched"},{"id":"Layer 7f","remaining":"Harish-Chandra to permutation-module adapter","state":"partial"},{"id":"Layer 8","remaining":"split reductive data over general nonempty bases retaining the full root datum","state":"partial"},{"id":"Layer 9","remaining":"uniform pinned construction, signed fixed Lie algebra and folding, pinned isomorphism existence and carrier identification","state":"partial"},{"id":"Layer 9D","remaining":"isomorphism and existence theorems, multiplicative type over a base, relative center and derived group, forms, perfect-field pseudo-reductivity","state":"partial"},{"id":"Layer 9E","state":"untouched"},{"id":"Layer 10","remaining":"induced, Weyl and simple modules, dominant-weight classification, V-dual tensor V identification of coefficient summands","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"b2b4ad5e48ef0826f3a0076cfc3be3ec689825c661c09367b689b0602bd5124e","roadmap":"ReductiveGroups","to_sha":"7a6772d920699412927989888cd1c7b61ac67cee"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `7a6772d` (2026-11-10T20:47:44+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations are complete, and so is Matsushima's affine quotient, field extension included. General structure theory, Levi complements, the integral constructions, the relative theory and highest-weight theory are all partial. The finite-field representation lanes, Steinberg endomorphisms and the spectral layer have not begun.

### Named results

- **Conjugacy of Borel subgroups** — any two Borel subgroups of a finite-type affine group over an algebraically closed field are conjugate, even when the ambient group is not smooth or connected ([`exists_conjugate_eq`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.html#TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq)).
- **Matsushima's affine quotient** — for geometrically reduced finite-type `G` and linearly reductive `N`, the quotient after any field extension is `Spec (K ⊗ O(G)^N)` ([`fppfHomogeneousQuotientBaseChangeIso`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/BaseChange.html#TauCeti.HopfIdeal.fppfHomogeneousQuotientBaseChangeIso)).
- **The rational Weyl quotient** — for a closed diagonalizable subgroup, the Weyl group is the rational normalizer modulo the rational centralizer ([`normalizerQuotientCentralizerEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Normalizer/WeylGroup.html#BialgHom.normalizerQuotientCentralizerEquiv)).
- **The cosemisimple decomposition** — over any field, a linearly reductive coalgebra is the direct sum of the coefficient spaces of its simple comodules ([`isInternal_simpleCoefficientSubmodules`](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive/Decomposition.html#TauCeti.Coalgebra.IsLinearlyReductive.isInternal_simpleCoefficientSubmodules)).
- **Simplicity of binary forms** — in characteristic `p`, the binary forms of degree `d` are simple exactly when `d + 1 = (a + 1)pᵐ` with `a < p` ([`isAtom_binaryForms_iff_of_charP`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/BinaryForm/Basic.html#TauCeti.SpecialLinear.isAtom_binaryForms_iff_of_charP)).

### Notable definitions and infrastructure

- **Reductivity over a ring** means smoothness together with connected reductive geometric fibres. It is stable under arbitrary base change, and every fibre is reductive over any field. This is the entry point to the relative theory ([`reductiveCommHopfAlgPropertyOver`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Reductive/Over.html#TauCeti.reductiveCommHopfAlgPropertyOver)).
- **Galois descent of Hopf ideals** identifies the closed subgroups defined over `k` with the Galois-stable closed subgroups over `L`. The perfect-field comparison of pseudo-reductive and reductive groups will need it ([`existsUnique_baseChangeHopfIdeal_eq_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Descent.html#TauCeti.CommHopfAlgCat.existsUnique_baseChangeHopfIdeal_eq_iff)).
- **The polynomial exponential and logarithm** identify nilpotent Lie elements with the points of unipotent subgroups over rational domains ([`expEquivHopfIdealPoints`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Unipotent/Exponential.html#TauCeti.GeneralLinear.expEquivHopfIdealPoints)).

### Roadmap coverage

Layers 0–2, 4, 5 and 6B are done. The partial layers, with what is missing in each, are:

- 3: general homogeneous quotients.
- 3A: the complex comparison and sections of `O(1)`. Proper projective orbits are now in place.
- 5P: the intrinsic comparisons of exp and log.
- 6: simply connected covers, and linear reductivity in positive characteristic.
- 6A: the splitting machinery and the complement itself.
- 7 and 7C: root extraction and Bruhat.
- 7a: the Lang adapters.
- 7f: the permutation adapter.
- 8: pinnings exist over connected bases, but the full split datum does not.
- 9: the uniform construction and folding.
- 9D: the relative reductivity predicate, its fibres and the Weil-restriction example exist, but none of the classification, relative structure or forms do.
- 10: the coefficient decomposition and rank one exist, but general highest-weight theory does not.

Layers 7b–7e, 9E and 11 are untouched. The extracted context was truncated, so some advances may not be reflected here.

## The frontier

- **Maximal-torus conjugacy.** Remove the remaining hypothesis that a diagonalizable subgroup can be conjugated. Centralizer-equals-torus and the root datum depend on this.
- **Algebraic Peter–Weyl.** Over an algebraically closed field, identify each simple coefficient space with `V* ⊗ V`. In characteristic zero, index the summands by dominant weights, which needs Layer 10B's Weyl modules.
- **Pseudo-reductive over perfect fields.** Use Galois descent to descend the geometric unipotent radical, then prove that the two notions agree. After that, show the radical commutes with finite separable extensions.
- **General Levi complements.** Construct equivariant vector filtrations and regular sections, then cohomological splitting and conjugacy in characteristic zero.
- **Root extraction and integral existence.** Construct rank-one root maps, then complete signed folding and the uniform pinned construction. The isomorphism and existence theorems of 9D wait on both.

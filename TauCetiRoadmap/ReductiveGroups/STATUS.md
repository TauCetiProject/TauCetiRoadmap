<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7","ts":"2026-11-07T20:34:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"homogeneous quotient representability beyond reduced groups over algebraically closed fields","state":"partial"},{"id":"Layer 3A","remaining":"properness, complex comparison, restriction to O(1) sections and remaining worked tests","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 5P","remaining":"realization independence, field-extension and automorphism compatibility, complex Lie exponential comparison","state":"partial"},{"id":"Layer 6","remaining":"simply connected covers; positive-characteristic linear reductivity forcing a torus beyond solvable groups","state":"partial"},{"id":"Layer 6A","remaining":"vector filtrations, sections, cohomological splitting, complement construction and conjugacy","state":"partial"},{"id":"Layer 6B","state":"done"},{"id":"Layer 7","remaining":"unconditional torus conjugacy, root datum, centralizer equals torus, Bruhat and general parabolic Levi theory","state":"partial"},{"id":"Layer 7C","remaining":"additive root parameterizations, rank-one isogenies, commutators, height filtration and ordered coordinates","state":"partial"},{"id":"Layer 7a","remaining":"Lang adapters for stable parabolics, unipotent radicals and connected centralizers","state":"partial"},{"id":"Layer 7b","state":"untouched"},{"id":"Layer 7c","state":"untouched"},{"id":"Layer 7d","state":"untouched"},{"id":"Layer 7e","state":"untouched"},{"id":"Layer 7f","remaining":"Harish-Chandra to permutation-module adapter","state":"partial"},{"id":"Layer 7g","state":"untouched"},{"id":"Layer 8","remaining":"classification and existence, relative structure and descent, perfect-field and separable-extension pseudo-reductive comparisons","state":"partial"},{"id":"Layer 9","remaining":"uniform pinned construction, signed fixed Lie algebra and folding, pinned isomorphism existence and carrier identification","state":"partial"},{"id":"Layer 10","remaining":"general induced, Weyl and simple modules, dominant-weight classification and algebraic Peter-Weyl","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"b784ec4d356846e742598a13b5561399db8c67bedaffc32cc1437bb764a78b33","roadmap":"ReductiveGroups","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `e583e15` (2026-11-07T20:34:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Foundations and Matsushima's affine quotient, including field extension, are complete. General structure theory, Levi complements, integral constructions and highest-weight theory remain partial; the finite-field representation and spectral lanes are untouched.

### Named results

- **Conjugacy of Borel subgroups** — any two Borels of a finite-type affine group over an algebraically closed field are conjugate, without smoothness or connectedness of the ambient group ([`exists_conjugate_eq`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.html#TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq)).
- **Matsushima's affine quotient** — for geometrically reduced finite-type `G` and linearly reductive `N`, the quotient after any field extension is `Spec (K ⊗ O(G)^N)` ([`fppfHomogeneousQuotientBaseChangeIso`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/BaseChange.html#TauCeti.HopfIdeal.fppfHomogeneousQuotientBaseChangeIso)).
- **The rational Weyl quotient** — for a closed diagonalizable subgroup, the rational normalizer modulo its rational centralizer is the Weyl group ([`normalizerQuotientCentralizerEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Normalizer/WeylGroup.html#BialgHom.normalizerQuotientCentralizerEquiv)).
- **Simplicity of binary forms** — in characteristic `p`, degree-`d` binary forms are simple exactly when `d + 1 = (a + 1)pᵐ` with `a < p` ([`isAtom_binaryForms_iff_of_charP`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/BinaryForm/Basic.html#TauCeti.SpecialLinear.isAtom_binaryForms_iff_of_charP)).
- **A pseudo-reductive non-reductive group** — for nontrivial finite purely inseparable `K/k`, `Res_(K/k) 𝔾ₘ` is [pseudo-reductive](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/WeilRestriction/PseudoReductive.html#TauCeti.Algebra.WeilRestriction.pseudoReductive_multiplicativeGroup) but [not reductive](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/WeilRestriction/PseudoReductive.html#TauCeti.Algebra.WeilRestriction.not_reductive_multiplicativeGroup_of_isPurelyInseparable).

### Notable definitions and infrastructure

- **Polynomial exponential and logarithm** identify nilpotent Lie elements with unipotent subgroup points over rational domains ([`expEquivHopfIdealPoints`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Unipotent/Exponential.html#TauCeti.GeneralLinear.expEquivHopfIdealPoints)).
- **Contracted centralizers of character kernels** supply candidate root groups with computed tangent weights; additive parameterizations remain ([`unipotentCentralizerKerHopfIdeal`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Dynamic/Unipotent/KernelCentralizer.html#TauCeti.SplitMaximalTorus.unipotentCentralizerKerHopfIdeal)).
- **Reductivity over a ring** is defined by smoothness and connected reductive geometric fibers, with arbitrary base change ([`reductiveCommHopfAlgPropertyOver`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Reductive/Over.html#TauCeti.reductiveCommHopfAlgPropertyOver)).

### Roadmap coverage

Layers 0–2, 4, 5 and 6B are done. Partial layers are 3 (general homogeneous quotients), 3A (complex/projective comparisons and remaining tests), 5P (intrinsic exp/log comparisons), 6 (covers and positive-characteristic linear reductivity), 6A (the reductive quotient step over algebraically closed fields), 7 and 7C (root extraction and Bruhat), 7a (Lang application adapters), 7f (the permutation adapter), 8 (relative predicates and pseudo-reductive examples), 9 (carriers and Lie foundations), and 10 (weights, binary forms and polynomial actions). Layers 7b–7e, 7g and 11 remain untouched. Truncated context limits assessment of further advances.

## The frontier

- **Maximal-torus conjugacy.** Remove the remaining diagonalizable-subgroup conjugation hypothesis.
- **Parabolic Levi theory.** Identify every parabolic with `P(λ)` and prove simple transitivity on Levi complements.
- **General Levi complements.** Construct equivariant vector filtrations and regular sections, then cohomological splitting and conjugacy in characteristic zero.
- **Root extraction and integral existence.** Construct rank-one root maps; complete signed folding and the uniform pinned construction.
- **Highest-weight classification.** Construct general induced and Weyl modules and their simple heads and socles; binary forms cover only rank one.

<!--tauceti-status:v1 {"roadmap":"ReductiveGroups","to_sha":"eaaa3ce3cdadc72cf584dd7ab90a70d08ce55956","ts":"2026-11-06T21:23:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"G/H beyond reduced groups over algebraically closed fields","state":"partial"},{"id":"Layer 3A","remaining":"properness, complex comparison, section restriction, remaining tests","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 5P","remaining":"intrinsic naturality and analytic Lie-exponential comparison","state":"partial"},{"id":"Layer 6","remaining":"simply connected covers; positive-characteristic linear reductivity","state":"partial"},{"id":"Layer 6A","remaining":"vector layers, regular cohomology, Levi existence and conjugacy","state":"partial"},{"id":"Layer 6B","state":"done"},{"id":"Layer 7","remaining":"torus conjugacy, root datum, parabolic comparison, Bruhat decomposition","state":"partial"},{"id":"Layer 7C","remaining":"rank-one maps, commutators, height filtration, factorization","state":"partial"},{"id":"Layer 7a","remaining":"Lang subgroup application adapters","state":"partial"},{"id":"Layer 7b","state":"untouched"},{"id":"Layer 7c","state":"untouched"},{"id":"Layer 7d","state":"untouched"},{"id":"Layer 7e","state":"untouched"},{"id":"Layer 7f","remaining":"Harish-Chandra to permutation-module adapter","state":"partial"},{"id":"Layer 7g","state":"untouched"},{"id":"Layer 8","remaining":"classification, relative descent and forms, inseparable examples","state":"partial"},{"id":"Layer 9","remaining":"uniform integral construction, folded Lie algebra, pinned isomorphism existence","state":"partial"},{"id":"Layer 10","remaining":"general highest-weight classification and algebraic Peter-Weyl","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"b784ec4d356846e742598a13b5561399db8c67bedaffc32cc1437bb764a78b33","roadmap":"ReductiveGroups","to_sha":"eaaa3ce3cdadc72cf584dd7ab90a70d08ce55956"}-->
# Status: ReductiveGroups

This file documents the status of the ReductiveGroups roadmap up until `eaaa3ce` (2026-11-06T21:23:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundational dictionary, representations, Lie theory, tori and unipotent radical are done, as is the Matsushima lane. Structure theory, integral construction and rational representation theory remain partial; finite-field Harish–Chandra theory and the spectral quotient lane have not begun.

### Named results

- **Borel conjugacy** — [any two Borels of a finite-type affine group over an algebraically closed field are conjugate](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.html#TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq), without smoothness or connectedness assumptions.
- **Matsushima's affine quotient** — the quotient by a reductive subgroup in characteristic zero is affine, and [its affine model commutes with field extension](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/BaseChange.html#TauCeti.HopfIdeal.fppfHomogeneousQuotientBaseChangeIso).
- **Weyl invariance of formal characters** — [Finite-dimensional rational representations have formal characters invariant under the rational Weyl group](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Normalizer/FormalCharacter.html#BialgHom.mapDomain_formalCharacter_of_mem_weylGroup) of a closed diagonalizable subgroup.
- **Simplicity of binary forms** — [Degree-d binary forms in characteristic p are simple exactly when d + 1 = (a + 1)pᵐ for some 0 ≤ a < p](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/SpecialLinear/BinaryForm/Basic.html#TauCeti.SpecialLinear.isAtom_binaryForms_iff_of_charP).
- **Polynomial exponential and logarithm** — [Finite exp/log identify nilpotent Lie elements with unipotent subgroup points](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Unipotent/Exponential.html#TauCeti.GeneralLinear.expEquivHopfIdealPoints) over a rational domain, as sets.

### Notable definitions and infrastructure

- **Relative reductivity** — [Smooth affine groups with connected reductive geometric fibres](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Reductive/Over.html#TauCeti.reductiveCommHopfAlgPropertyOver) support base change and products, with SLₙ and Sp₂ₙ as examples.
- **Pseudo-reductivity** — [The predicate retains the ground-field radical](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/PseudoReductive/Basic.html#TauCeti.pseudoReductiveCommHopfAlgProperty); the quotient by the ground-field unipotent radical is pseudo-reductive, and [reductive over an algebraically closed field](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/PseudoReductive/Basic.html#TauCeti.FiniteTypeCommHopfAlgCat.reductive_coinvariants_unipotentRadical).
- **Polynomial representations** — [A rational GLₙ action extends uniquely to the matrix monoid precisely when its coaction is polynomial](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Polynomial.html#TauCeti.GeneralLinear.existsUnique_matrixMonoidComodule_iff); homogeneous coordinate coalgebras and their [Schur-algebra duals](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/MatrixMonoid/SchurAlgebra.html#TauCeti.SchurAlgebra) provide the degreewise framework.

### Roadmap coverage

Layers 0–2, 4, 5 and 6B are done. Layers 3, 3A, 5P and 6 remain partial: general homogeneous representability, projective/complex orbit comparisons, intrinsic exponential compatibility and simply connected covers remain. Layer 6A has the reductive quotient over algebraically closed fields, but no general Levi-complement theorem. Layers 7 and 7C have Borel conjugacy, a finite Weyl action and contracted centralizer intersections; root maps and Bruhat decomposition remain. Layers 7a and 7f retain the Frobenius comparison and GL₃ example, without the Lang application and Harish–Chandra adapters. Layers 8–10 are partial: relative and pseudo-reductive foundations, explicit carriers and rank-one representations precede general classification. Layers 7b–7e, 7g and 11 remain untouched. The declaration extract is truncated; earlier verdicts are retained where it supplies no further evidence.

## The frontier

- **Maximal tori and root extraction** — remove the extra conjugacy hypothesis, construct rank-one root maps and coroots, and identify the Weyl group with N(T)/T.
- **Parabolics and Bruhat coordinates** — identify every parabolic k-subgroup with P(λ), prove Levi conjugacy, then construct the ordered root factors and double-coset decomposition.
- **Intrinsic exponential and Levi complements** — prove realization independence and field/automorphism compatibility; construct vector layers and regular cohomology for characteristic-zero splitting.
- **Projective closed orbits** — establish properness, the complex homogeneous-space comparison and equivariant restriction to sections of O(1).
- **Lang application adapters** — verify smoothness, geometric connectedness and restricted Frobenius for the actual parabolics, unipotent radicals and connected centralizers, then consume the ReductiveGroupsPartII supplier.

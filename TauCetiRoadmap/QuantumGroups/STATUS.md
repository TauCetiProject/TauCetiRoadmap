<!--tauceti-status:v1 {"roadmap":"QuantumGroups","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: QuantumGroups

This file documents the status of the QuantumGroups roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The algebraic lane Q8 has covered its representation theory: the structure of U_q(sl₂), the classification of its simple modules, complete reducibility, local finiteness and type 1, and the classical specialization. Its tensor/Clebsch–Gordan theory and the compact real form are only begun. The compact quantum group lanes Q1–Q7 have not started.

### Named results

- **Complete reducibility** — at a generic parameter every finite-dimensional U_q(sl₂)-module is semisimple, even when K is not assumed diagonalizable ([`isSemisimpleModule_of_finiteDimensional`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/CompleteReducibility.html#TauCeti.UqSl2.isSemisimpleModule_of_finiteDimensional)).
- **Locally finite modules are sums of simples** — a module is locally finite exactly when it is a direct sum of signed ladder modules L_m^ε ([`isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/LocallyFinite.html#TauCeti.UqSl2.isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule)). Among these, the type-1 modules are exactly the sums of the positive L_m^+ ([`isTypeOne_and_isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/TypeOne.html#TauCeti.UqSl2.isTypeOne_and_isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule)).
- **Classification of finite-dimensional simple modules** — every finite-dimensional simple module is isomorphic to exactly one L_m^ε ([`existsUnique_linearEquiv_ladderModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/SimpleClassification.html#TauCeti.UqSl2.existsUnique_linearEquiv_ladderModule)).
- **The center is ℂ[Ω]** — evaluation at the quantum Casimir element is an isomorphism from the polynomial ring onto the center ([`polynomialAlgEquivCenter`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Center.html#TauCeti.UqSl2.polynomialAlgEquivCenter)).
- **The PBW theorem** — the ordered monomials F^a K^b E^c form a basis ([`pbwBasis`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/PBW.html#TauCeti.UqSl2.pbwBasis)). This yields the [triangular decomposition](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Triangular.html#TauCeti.UqSl2.triangularEquiv) and shows that U_q(sl₂) is a [domain](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/OreTower.html#TauCeti.UqSl2.instIsDomain).

### Notable definitions and infrastructure

- **Ore extensions R[X; σ, δ]** ([`OreExtension`](https://taucetiproject.org/docs/TauCeti/Algebra/OreExtension/Basic.html#TauCeti.OreExtension)) — a reusable σ-derivation construction with a universal property, degree theory and a domain theorem. PBW was built on it.
- **Signed ladder modules L_m^ε** ([`LadderModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/LadderModule.html#TauCeti.UqSl2.LadderModule)) — the explicit simple modules in which every classification above is stated. Each also arises as the [simple quotient of a Verma module](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Verma/Submodule.html#TauCeti.UqSl2.VermaModule.ladderModuleEquivQuotient).
- **The isotypic evaluation isomorphism** ([`ladderModuleTensorHomEquiv`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/LocallyFinite.html#TauCeti.UqSl2.ladderModuleTensorHomEquiv)) — V ≃ ⊕ L_m^ε ⊗ Hom(L_m^ε, V), natural in V. It comes from a [general isotypic decomposition](https://taucetiproject.org/docs/TauCeti/RingTheory/Semisimple/IsotypicTensor.html#TauCeti.directSumIsotypicTensorEquiv) of semisimple modules and provides the multiplicity spaces that the tensor theory will need.

### Roadmap coverage

Q1–Q7 are untouched: there are no C*-bialgebras, Haar states, corepresentations, Hopf *-cores, completions, SUq(2), O_F^+ or reconstruction yet. In Q8:

- **Items 2, 4 and 7 are done.** Item 4 includes the one-dimensional L_0^- example (locally finite but not type 1). Item 7 identifies the v = 1 specialization of L_m^+ with the standard sl₂-module V(m), keeping the binomial rescaling between the two bases.
- **Item 1 is done except for the right-coefficient monomial basis of Ore extensions.**
- **Item 3 is done.** The center, the Casimir scalars and complete reducibility are all proved. The corollaries listed last in that item (multiplicity uniqueness and the Hom formulas) are available only through the evaluation isomorphism, not as separate statements.
- **Item 5 is partial.** Only the quantum binomial coproduct formulas for Δ(E^r) and Δ(F^r) have landed. The finite Hopf-module category, duals, pivotal structure, Clebsch–Gordan maps and 6j symbols are absent.
- **Item 6 is partial.** The [star structure](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Star.html#TauCeti.UqSl2.instStarRing) and its compatibility with the coproduct, counit and antipode are proved. The invariant inner products on L_m^+ and the SUq(2) comparison are not; that comparison also needs Q5/Q7.

## The frontier

- **The finite Hopf-module category (Q8.5)** — construct `FiniteHopfModuleCat` for a general Hopf algebra, with its tensor product through the coproduct, its antipode duals and a pivotal structure from a group-like g with S² = Ad(g). Then instantiate it at U_q with g = K⁻¹, using the antipode results already proved.
- **Quantum Clebsch–Gordan (Q8.5)** — the explicit decomposition L_m^ε ⊗ L_n^δ ≃ ⊕ L_(m+n−2j)^(εδ) via the pinned highest-vector recurrence. After that come the 6j matrices and the Biedenharn–Elliott pentagon. This depends on the tensor category above.
- **Invariant inner products (Q8.6)** — the positive invariant form on each L_m^+ for real 0 < q < 1, using the star structure now in place. The comparison with SUq(2) waits on Q5/Q7.
- **Right-coefficient Ore basis (Q8.1)** — the monomial basis with coefficients on the right when σ is bijective, the last open piece of item 1.
- **The compact lane (Q1)** — C*-bialgebras, cancellation and the Haar state. This is the entry point to everything in Q1–Q7, and it relies on CStarAlgebras C2/C5 and VonNeumannAlgebras for minimal tensors, slice maps and weak-* compactness.

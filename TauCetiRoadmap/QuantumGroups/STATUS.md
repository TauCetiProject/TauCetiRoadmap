<!--tauceti-status:v1 {"roadmap":"QuantumGroups","to_sha":"d9fbe7bd6aedb5ed0ffb867836c3ed71aa7d28e5","ts":"2026-11-11T09:30:56+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"untouched"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"compactType_iff, the modular automorphism and Kac equivalence, the universal and reduced completions, and coamenability","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"dual compatibility of Clebsch-Gordan maps, the Hom/End formulas of 8.3, the SUq(2) comparison of 8.6 and the LieHighestWeight comparison of 8.7","state":"partial"}],"readme_sha":"f47c92841654eaf67568ad1a6fe0ded35598894d43457eb59d95709a6170b8c2","roadmap":"QuantumGroups","to_sha":"d9fbe7bd6aedb5ed0ffb867836c3ed71aa7d28e5"}-->
# Status: QuantumGroups

This file documents the status of the QuantumGroups roadmap up until `d9fbe7b` (2026-11-11T09:30:56+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 8, the generic theory of U_q(sl₂), is nearly complete. It covers the classification of modules, complete reducibility and, as of now, the tensor, rigid and pivotal theory with explicit Clebsch–Gordan and 6j maps. What remains there are a few corollaries, the duality compatibility of the Clebsch–Gordan maps, and the compact and classical comparisons. Layer 4 has its first algebraic Haar-integral results. Layers 0–3 and 5–7, the C*-algebraic compact theory, have not begun.

### Named results

- **The quantum Clebsch–Gordan decomposition**: at a generic parameter, L_m^ε ⊗ L_n^δ ≃ ⊕_(j ≤ min(m,n)) L_(m+n−2j)^(εδ) as U_q-modules, through explicit normalized highest vectors ([`clebschGordanEquiv`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/ClebschGordan/Basic.html#TauCeti.UqSl2.clebschGordanEquiv)).
- **The Biedenharn–Elliott pentagon identity**: the 6j change-of-decomposition entries, taken under the actual tensor associator, satisfy the pentagon relation on fourfold products ([`sixJ_pentagon`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/ClebschGordan/Pentagon.html#TauCeti.UqSl2.sixJ_pentagon)).
- **Sphericality and quantum dimensions**: with pivot K⁻¹, the category of finite-dimensional U_q-modules is spherical ([`sphericalCategory`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Pivotal.html#TauCeti.UqSl2.sphericalCategory)), and L_m^ε has quantum dimension ε[m+1]_q ([`quantumDim_ladderModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Pivotal.html#TauCeti.UqSl2.quantumDim_ladderModule)).
- **Complete reducibility**: at a generic parameter every finite-dimensional U_q(sl₂)-module is semisimple, even when K is not assumed diagonalizable ([`isSemisimpleModule_of_finiteDimensional`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/CompleteReducibility.html#TauCeti.UqSl2.isSemisimpleModule_of_finiteDimensional)).
- **Classification of finite-dimensional simple modules**: every one is isomorphic to exactly one signed ladder module L_m^ε ([`existsUnique_linearEquiv_ladderModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/SimpleClassification.html#TauCeti.UqSl2.existsUnique_linearEquiv_ladderModule)).

### Notable definitions and infrastructure

- **The finite Hopf-module category** ([`FiniteHopfModuleCat`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/FiniteHopfModuleCat/Basic.html#TauCeti.FiniteHopfModuleCat)): finite-dimensional modules over any Hopf algebra, with tensor product through the coproduct and antipode duals. It becomes [rigid](https://taucetiproject.org/docs/TauCeti/Algebra/Category/FiniteHopfModuleCat/Rigid.html#TauCeti.FiniteHopfModuleCat.rigidCategory) when the antipode is bijective and [pivotal](https://taucetiproject.org/docs/TauCeti/Algebra/Category/FiniteHopfModuleCat/Pivotal.html#TauCeti.FiniteHopfModuleCat.pivotalCategory) when a group-like element implements S². For a group algebra it is [monoidally equivalent to FDRep](https://taucetiproject.org/docs/TauCeti/Algebra/Category/FiniteHopfModuleCat/FDRep.html#TauCeti.FiniteHopfModuleCat.equivalenceFDRep).
- **Signed ladder modules L_m^ε** (`LadderModule`): the explicit simple modules in which the classification, the Clebsch–Gordan maps and the 6j symbols are all stated.
- **Algebraic invariant integrals** ([`IsLeftInvariantIntegral`](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral.html#LinearMap.IsLeftInvariantIntegral)): a nonzero positive integral is strictly positive, and Haar averaging [unitarizes every finite comodule](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/Unitarization.html#TauCeti.Comodule.exists_basis_coefficientMatrix_mem_unitary). This is the entry point to Layer 4's compact-type theorem.

### Roadmap coverage

Layers 0–3 and 5–7 are untouched: there are no C*-categories, C*-bialgebras, analytic corepresentations, SUq(2), free orthogonal quantum groups or reconstruction yet. Layer 4 is partial. Algebraic faithfulness and strict positivity of invariant integrals, the averaged Haar form, algebraic unitarization and the cancellation maps of §4.1 are in place, as is faithfulness of the Haar GNS representation. The headlines `compactType_iff`, `haar_modular_automorphism` and the Kac equivalence are not, and neither are the completions or coamenability. Layer 8 is partial:

- **§§8.1, 8.2 and 8.4 are done.** That includes the right-coefficient Ore basis, the last open piece of §8.1.
- **§8.3 is done except** the formulas for dim Hom_U(V,W) and End_U(V). The multiplicity of each L_m^ε is read off the formal character.
- **§8.5 is done except** the compatibility of the Clebsch–Gordan and 6j maps with dual evaluation and coevaluation, and the identification of duals and pivot in the FDRep comparison. A representation ring (`repRing`) is in the source.
- **§8.6 is partial.** The invariant inner product on each L_m^+ is proved positive and unique up to scalar; the SUq(2) comparison is absent.
- **§8.7 is partial.** The v = 1 specialization to the standard sl₂-module V(m) is done, but the isomorphism to RepresentationTheory/LieHighestWeight's module is not.

## The frontier

- **Duality of the Clebsch–Gordan maps (§8.5)**: prove that the Clebsch–Gordan inclusions and 6j maps are compatible with the evaluation and coevaluation of the rigid structure, using the [contragredient isomorphisms](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Dual/LadderModule.html#TauCeti.UqSl2.LadderModule.contragredientEquiv) already in place.
- **Hom and End formulas (§8.3)**: dim Hom_U(V,W) = Σ dim Hom_U(L_m^ε,V)·dim Hom_U(L_m^ε,W), and End_U(V) as a product of matrix algebras on the multiplicity spaces. Both follow from complete reducibility and Schur's lemma, both of which are already proved.
- **Duals and pivot under the FDRep comparison (§8.5)**: extend the monoidal equivalence for k[G] so that the generic S⁻¹ left duals and the trivial pivot match FDRep's canonical ones.
- **Algebraic compact type (§4.1)**: the coefficient direction of `compactType_iff` remains: independence of simple coefficient coalgebras, conjugates, the unitarizing matrix and orthogonality. After that come the modular automorphism and the Kac equivalence.
- **The analytic compact lane (Layers 0–1)**: C*-categories, C*-bialgebras, cancellation and the Haar state. This lane relies on CStarAlgebras C2/C5 and VonNeumannAlgebras, and the SUq(2) comparison of §8.6 waits on Layers 5 and 7 that sit above it.

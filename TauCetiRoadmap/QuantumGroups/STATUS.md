<!--tauceti-status:v1 {"roadmap":"QuantumGroups","to_sha":"1b19ebb4ca6fab1281fb00c21dee68df6ff21243","ts":"2026-11-11T12:36:39Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"untouched"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"compactType_iff, the modular automorphism and Kac equivalence, the universal and reduced completions, and coamenability","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"the Hom/End formulas of 8.3, dual compatibility of Clebsch-Gordan maps, the SUq(2) pairing of 8.6 and the LieHighestWeight comparison of 8.7","state":"partial"}],"readme_sha":"6814d3a155666fba1f46a8f801b33736760541a0de184bc6929313a226c1631a","roadmap":"QuantumGroups","to_sha":"1b19ebb4ca6fab1281fb00c21dee68df6ff21243"}-->
# Status: QuantumGroups

This file documents the status of the QuantumGroups roadmap up until `1b19ebb` (2026-11-11T12:36:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 8, the generic algebraic theory of U_q(sl₂), is nearly complete. It has the classification and complete reducibility of modules, the tensor, rigid and spherical theory with explicit Clebsch–Gordan and 6j maps, and now the representation ring. What remains are a few corollaries, the compatibility of the Clebsch–Gordan maps with duals, and the compact and classical comparisons. Layer 4 has its first algebraic Haar-integral results. Layers 0–3 and 5–7, the C*-algebraic compact theory, have not begun.

### Named results

- **The quantum Clebsch–Gordan decomposition**: at a generic parameter, L_m^ε ⊗ L_n^δ ≃ ⊕_(j ≤ min(m,n)) L_(m+n−2j)^(εδ) as U_q-modules, through explicit normalized highest vectors ([`clebschGordanEquiv`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/ClebschGordan/Basic.html#TauCeti.UqSl2.clebschGordanEquiv)).
- **The Biedenharn–Elliott pentagon identity**: the 6j change-of-decomposition entries, taken under the actual tensor associator, satisfy the pentagon relation on fourfold products ([`sixJ_pentagon`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/ClebschGordan/Pentagon.html#TauCeti.UqSl2.sixJ_pentagon)).
- **The representation ring of U_q(sl₂)**: at a generic parameter, the classes of the signed ladder modules form a [ℤ-basis](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/RepresentationRing.html#TauCeti.UqSl2.repRingBasis), and the character map into ℤ[ℂ] is [injective](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/RepresentationRing.html#TauCeti.UqSl2.repRingCharacter_injective). The ring is therefore commutative, and Clebsch–Gordan becomes its [multiplication rule](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/RepresentationRing.html#TauCeti.UqSl2.of_ladderModule_mul_of_ladderModule).
- **Complete reducibility**: at a generic parameter every finite-dimensional U_q(sl₂)-module is semisimple, even when K is not assumed diagonalizable ([`isSemisimpleModule_of_finiteDimensional`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/CompleteReducibility.html#TauCeti.UqSl2.isSemisimpleModule_of_finiteDimensional)).
- **Classification of finite-dimensional simple modules**: every one is isomorphic to exactly one signed ladder module L_m^ε ([`existsUnique_linearEquiv_ladderModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/SimpleClassification.html#TauCeti.UqSl2.existsUnique_linearEquiv_ladderModule)).

### Notable definitions and infrastructure

- **The finite Hopf-module category** ([`FiniteHopfModuleCat`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/FiniteHopfModuleCat/Basic.html#TauCeti.FiniteHopfModuleCat)): finite-dimensional modules over any Hopf algebra, monoidal with biproducts. It is [rigid](https://taucetiproject.org/docs/TauCeti/Algebra/Category/FiniteHopfModuleCat/Rigid.html#TauCeti.FiniteHopfModuleCat.rigidCategory) when the antipode is bijective and [pivotal](https://taucetiproject.org/docs/TauCeti/Algebra/Category/FiniteHopfModuleCat/Pivotal.html#TauCeti.FiniteHopfModuleCat.pivotalCategory) when a group-like element implements S². At U_q with pivot K⁻¹ it is [spherical](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Pivotal.html#TauCeti.UqSl2.sphericalCategory), and L_m^ε has [quantum dimension ε[m+1]_q](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Pivotal.html#TauCeti.UqSl2.quantumDim_ladderModule).
- **Signed ladder modules L_m^ε and their unitary bases**: the explicit simple modules in which the classification, the Clebsch–Gordan maps and the 6j symbols are stated. The positive ones carry a [unique positive invariant inner product](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/LadderModule/InnerProduct.html#TauCeti.UqSl2.LadderModule.eq_smul_invariantForm) and an [orthonormal normalized basis](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/LadderModule/NormalizedBasis.html#TauCeti.UqSl2.LadderModule.normalizedBasis). In that basis the fundamental E, F and K have the entries §8.6 pins for the SUq(2) pairing.
- **Algebraic invariant integrals** ([`IsLeftInvariantIntegral`](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral.html#LinearMap.IsLeftInvariantIntegral)): a nonzero positive integral is strictly positive, and Haar averaging [unitarizes every finite comodule](https://taucetiproject.org/docs/TauCeti/Algebra/Coalgebra/Comodule/Unitarization.html#TauCeti.Comodule.exists_basis_coefficientMatrix_mem_unitary). This is the entry point to Layer 4's compact-type theorem.

### Roadmap coverage

Layers 0–3 and 5–7 are untouched. There are no C*-categories, C*-bialgebras, analytic corepresentations, SUq(2), free orthogonal quantum groups or reconstruction yet. Layer 4 is partial. Faithfulness and strict positivity of algebraic invariant integrals, algebraic unitarization, the cancellation maps of §4.1 and faithfulness of the Haar GNS representation are in place. The headlines `compactType_iff`, the modular automorphism and the Kac equivalence are not, and neither are the completions or coamenability. Layer 8 is partial:

- **§§8.1, 8.2 and 8.4 are done.**
- **§8.3 is done except** the formulas for dim Hom_U(V,W) and End_U(V).
- **§8.5 is done except** two pieces. The Clebsch–Gordan and 6j maps are not yet shown compatible with dual evaluation and coevaluation, and duals and pivot are not identified under the FDRep comparison. The representation ring is in place, though its image is not stated explicitly as the span of the ladder characters.
- **§8.6 is partial.** The invariant metrics and orthonormal bases are done, but the coefficient pairing and the equivalence with SUq(2) corepresentations are absent.
- **§8.7 is partial.** The v = 1 specialization to V(m) is done, but the isomorphism to LieHighestWeight's module is not.

## The frontier

- **Duality of the Clebsch–Gordan maps (§8.5)**: prove that the Clebsch–Gordan inclusions and 6j maps commute with the rigid structure's evaluation and coevaluation, using the [contragredient isomorphisms](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Dual/LadderModule.html#TauCeti.UqSl2.LadderModule.contragredientEquiv). After that, match the S⁻¹ left duals and the trivial pivot with FDRep's for group algebras.
- **Hom and End formulas (§8.3)**: dim Hom_U(V,W) = Σ dim Hom_U(L_m^ε,V)·dim Hom_U(L_m^ε,W), and End_U(V) as a product of matrix algebras on the multiplicity spaces. Both follow from complete reducibility and Schur's lemma, which are proved.
- **Algebraic compact type (§4.1)**: the coefficient direction of `compactType_iff` remains: independence of simple coefficient coalgebras, conjugates, the unitarizing matrix and orthogonality. The modular automorphism and the Kac equivalence come after it.
- **The SUq(2) comparison (§8.6)**: the algebraic side is ready, but the pairing needs SUq(2)'s finite unitary corepresentations from Layers 5 and 7, which do not exist.
- **The analytic compact lane (Layers 0–1)**: C*-categories, C*-bialgebras, cancellation and the Haar state. This lane relies on CStarAlgebras C2/C5 and VonNeumannAlgebras.

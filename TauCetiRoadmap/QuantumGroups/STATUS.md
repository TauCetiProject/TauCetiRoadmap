<!--tauceti-status:v1 {"roadmap":"QuantumGroups","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c","ts":"2026-10-20T05:58:24Z"}-->
# Status: QuantumGroups

This file documents the status of the QuantumGroups roadmap up until `68a457e` (2026-10-20T05:58:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All of the progress so far is in the algebraic lane Q8, generic U_q(sl₂). Its presentation, PBW and Hopf layer is essentially complete, and the finite-dimensional simple modules are classified. Complete reducibility, the tensor theory and the comparisons have not been reached. The compact quantum group part of the roadmap, Q1–Q7, has not begun.

### Named results

- **Classification of finite-dimensional simple U_q(sl₂)-modules** — at a generic parameter, every finite-dimensional simple module is isomorphic to exactly one signed ladder module L_m^ε ([`existsUnique_linearEquiv_ladderModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/SimpleClassification.html#TauCeti.UqSl2.existsUnique_linearEquiv_ladderModule)). The highest-weight vector it needs comes from the finiteness of K's spectrum, not from assuming that K is diagonalizable.
- **The PBW theorem for U_q(sl₂)** — the ordered monomials F^a K^b E^c, with (a, b, c) ∈ ℕ × ℤ × ℕ, form a basis ([`pbwBasis`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/PBW.html#TauCeti.UqSl2.pbwBasis)), obtained by identifying the algebra with an iterated Ore tower ([`oreTowerEquiv`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/OreTower.html#TauCeti.UqSl2.oreTowerEquiv)).
- **U_q(sl₂) is a domain** — this follows because both twists in the Ore tower are injective ([`instIsDomain`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/OreTower.html#TauCeti.UqSl2.instIsDomain)).
- **The square of the antipode** — S² is conjugation by K⁻¹ ([`antipode_antipode`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Antipode.html#TauCeti.UqSl2.antipode_antipode)), and the antipode is bijective with inverse x ↦ K S(x) K⁻¹ ([`antipode_bijective`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Antipode.html#TauCeti.UqSl2.antipode_bijective)). These are the inputs the planned pivotal structure g = K⁻¹ needs.
- **Casimir separation** — the quantum Casimir element is [central](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Casimir.html#TauCeti.UqSl2.casimir_mem_center), and at a generic parameter its scalars on the L_m^ε determine both m and the sign ([`casimirScalar_units_mul_pow_inj`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Casimir.html#TauCeti.UqSl2.casimirScalar_units_mul_pow_inj)). This is the block decomposition that complete reducibility will use.

### Notable definitions and infrastructure

- **Ore extensions R[X; σ, δ]** ([`OreExtension`](https://taucetiproject.org/docs/TauCeti/Algebra/OreExtension/Basic.html#TauCeti.OreExtension)) — a reusable σ-derivation construction with a universal property ([`liftAlgHom`](https://taucetiproject.org/docs/TauCeti/Algebra/OreExtension/Basic.html#TauCeti.OreExtension.liftAlgHom)), a left monomial basis, degree theory and a [domain theorem](https://taucetiproject.org/docs/TauCeti/Algebra/OreExtension/Degree.html#TauCeti.OreExtension.isDomain). When δ = 0 it is identified with Mathlib's skew polynomials ([`skewPolynomialAlgEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/OreExtension/SkewPolynomial.html#TauCeti.OreExtension.skewPolynomialAlgEquiv)). It is what made the PBW and domain results possible.
- **Signed ladder modules L_m^ε** ([`LadderModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/LadderModule.html#TauCeti.UqSl2.LadderModule)) — explicit modules on ℂ^(m+1). They come with simplicity, Schur's lemma, the trace ε[m+1]_q of K⁻¹, and a lifting map from any vector that satisfies the highest-weight conditions. Every later item in Q8 is stated in terms of them.
- **Verma modules** ([`VermaModule`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Verma.html#TauCeti.UqSl2.VermaModule)) — these come with the basis F^j v₀, their universal property, and the [singular-vector criterion](https://taucetiproject.org/docs/TauCeti/QuantumGroups/UqSl2/Verma.html#TauCeti.UqSl2.VermaModule.e_smul_vec_succ_eq_zero_iff): E kills v_(j+1) exactly when μ² = q^(2j).

### Roadmap coverage

Q1–Q7, the compact lane, are untouched: there are no C*-bialgebras, Haar states, corepresentations, Hopf *-cores, completions, SUq(2), O_F^+ or reconstruction yet.

Q8 stands as follows:

- **Item 1 is done except for three pieces.** Everything else has landed: the presentation and its universal property, the Ore construction, PBW, the domain theorem, the Hopf structure, the antipode inverse and square, the rescaling automorphisms, and the q⁻¹ algebra isomorphism. Still missing are the transported coproduct under the q⁻¹ isomorphism, the triangular decomposition, and the right-coefficient monomial basis.
- **Item 2 is done except for the submodules and simple quotients of Verma modules.**
- **Item 3 is partial.** The Casimir element, its centrality and distinct scalars, and the E F^r commutator formula are in place. The theorem that the center is ℂ[Ω] and complete reducibility are not.
- **Items 4–7 are untouched.**

## The frontier

- **Complete reducibility (Q8.3)** — prove every finite-dimensional module semisimple. The pieces in place are the Casimir block splitting, generalized weight spaces and the E F^r commutator formula. What remains is the top-weight-space argument showing K = εq^m on a block.
- **The center of U_q(sl₂) (Q8.3)** — show it is ℂ[Ω] by leading-coefficient reduction in the PBW basis, which now exists.
- **Verma quotients and the rest of Q8.1–2** — the simple quotients of Verma modules, the triangular decomposition, and the coproduct transported to the q⁻¹ presentation.
- **Local finiteness and type 1 (Q8.4)** — the Zorn argument, followed by the L_0^- example. It depends on complete reducibility.
- **The compact lane (Q1)** — C*-bialgebras, cancellation and the Haar state. This is the entry point to everything in Q1–Q7, and it relies on CStarAlgebras C2/C5 and VonNeumannAlgebras for minimal tensors, slice maps and weak-* compactness.

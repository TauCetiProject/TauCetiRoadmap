<!--tauceti-status:v1 {"roadmap":"SeibergWittenTheory","to_sha":"fe8ca8b0765fa23cc5b5baaa3652c8efcd50ad3c","ts":"2026-10-24T01:02:20Z"}-->
# Status: SeibergWittenTheory

This file documents the status of the SeibergWittenTheory roadmap up until `fe8ca8b` (2026-10-24T01:02:20Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The pointwise algebra of SW2 is largely in place: the rank-one quadratic endomorphism Q₀ with its derivative, and the chirality and self-duality algebra of an oriented four-space. Everything global is still to come: Spinᶜ bundles, connections, Dirac operators, gauge quotients, compactness, regularity, orientations, invariants and wall crossing.

### Named results

- **The real derivative of the quadratic map** — Q₀(ψ) = ψψ* − (|ψ|²/2)·Id is smooth, and its real Fréchet derivative at ψ is φ ↦ φψ* + ψφ* − Re⟨ψ,φ⟩·Id, proved in the strict sense, as SW2.2 asks ([`hasStrictFDerivAt_quadraticEnd`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/QuadraticEnd.html#TauCeti.SeibergWitten.hasStrictFDerivAt_quadraticEnd)).
- **The adjoint of the linearized quadratic map** — against a trace-free self-adjoint T, tr(B(ψ,φ)T) = 2Re⟨Tψ, φ⟩, so the formal adjoint of the derivative of Q₀ is T ↦ 2Tψ ([`trace_quadraticEndPolar_mul_of_mem_traceFreeSelfAdjoint`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/TracePairing.html#TauCeti.SeibergWitten.trace_quadraticEndPolar_mul_of_mem_traceFreeSelfAdjoint)).
- **Frame independence of chirality** — Γ = −c(e₁)c(e₂)c(e₃)c(e₄) for every positively oriented orthonormal frame, with Γ² = 1 and Γ anticommuting with every generator ([`chirality_eq`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Chirality.html#CliffordAlgebra.chirality_eq)).
- **The self-duality relation** — c₂(⋆α) = Γc₂(α). Hence anti-self-dual forms kill positive spinors and self-dual forms kill negative ones ([`bivectorExterior_hodgeStar`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Chirality.html#CliffordAlgebra.bivectorExterior_hodgeStar)).
- **The anticommutator of two-forms** — c₂(α)c₂(β) + c₂(β)c₂(α) = −2⟨α,β⟩ − 2⟨⋆α,β⟩Γ. On positive spinors, self-dual forms therefore satisfy a Clifford relation and act faithfully ([`bivectorExterior_mul_bivectorExterior_add_swap`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Chirality.html#CliffordAlgebra.bivectorExterior_mul_bivectorExterior_add_swap)).

### Notable definitions and infrastructure

- **The Hodge star of an oriented inner-product space** — ⋆ : ⋀ᵏV ≃ ⋀ˡV with ⟨⋆x, y⟩ = vol(x ∧ y), its value on orthonormal wedge monomials and ⋆⋆ = (−1)^(kl). This makes "self-dual two-form" a usable hypothesis everywhere above ([`Orientation.hodgeStar`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/HodgeStar.html#Orientation.hodgeStar)).
- **Trace-free self-adjoint endomorphisms** — the real subspace {T : T* = T, tr T = 0}, of dimension n² − 1, with the trace-free projection. It is the target of the curvature equation's Clifford identification ([`traceFreeSelfAdjoint`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Trace/Free.html#TauCeti.traceFreeSelfAdjoint)).
- **The pointwise Clifford map C** — the source also contains a Clifford restriction iα ↦ i c₂(α) from self-dual two-forms to endomorphisms of W⁺ for a Hermitian Clifford module. It comes with the Hilbert–Schmidt normalization tr(C*C) = 4⟨α,β⟩ and, in complex rank two, a real isomorphism onto the trace-free self-adjoint endomorphisms. It is not among the declarations recorded for this roadmap, so it is left unlinked here.

### Roadmap coverage

SW2.2 is done at the pointwise level. Every item it lists is proved: trace zero in rank two, self-adjointness, the eigenvector identity, phase invariance, polarization, the norm estimates and the real derivative. SW1.1 and SW2.1 are partial, and only in their linear-algebra parts. The chirality element and its basic identities exist, but there is no Spinᶜ(4) half-spin representation or descent through (−1,−1). The pointwise self-dual action and the Clifford map exist, but not the smooth eigenbundles Λ± or τ = C*. SW2.3, the two-form quadratic map q = C⁻¹Q₀, has not been defined. SW1.2–SW1.4 and SW3–SW11 are untouched.

## The frontier

- **The two-form quadratic map q (SW2.3)** — compose the inverse Clifford map with Q₀ and prove q(uψ) = q(ψ), C(q(ψ))ψ = (|ψ|²/2)ψ, |q(ψ)|² = |ψ|⁴/8 and the transported derivative. The pointwise ingredients all exist.
- **The adjoint τ = C* and the complexified identities (SW2.1)** — C*C = 4·Id and CC* = 4 times the trace-free projection, τ(Id) = 0, and τ landing in iΛ⁺ on self-adjoint endomorphisms.
- **Half-spin representations of Spinᶜ(4) (SW1.1)** — build ρ± on S±, prove descent, smoothness and det ρ± = z², and compare the native Spin(4) ≃ SU(2)×SU(2) factor labels with this Γ convention. This needs FourManifolds F4's Spinᶜ(n) quotient.
- **The smooth self-dual bundles Λ± (SW2.1)** — globalize the pointwise star through ComplexKahlerGeometry K5a's metric Hodge star. The roadmap is explicit that the algebraic star alone does not supply the bundle.
- **Geometric bundles and the determinant connection (SW1.2–SW1.3)** — associated bundles W±, the line L, the Spinᶜ connection and its curvature formula. These open the way to the Dirac and Weitzenböck work of SW3.

<!--tauceti-status:v1 {"roadmap":"SeibergWittenTheory","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
# Status: SeibergWittenTheory

This file documents the status of the SeibergWittenTheory roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The representation theory of SW1.1 and the pointwise algebra of SW2 are essentially complete. A few smooth-category pieces of later layers exist: the abelian deformation operator, logarithmic derivatives of circle maps, and the cohomological algebra of insertion forms. Nothing global has been built: no Spinᶜ bundles, connections, Dirac operators, gauge quotients, compactness, orientations, invariants or wall crossing.

### Named results

- **The half-spin representations of Spinᶜ(4)** — [s, z] acts on each chirality eigenspace by zρ(s). The action is unitary and Clifford-equivariant, has determinant z², and is smooth on compact Spinᶜ(4) ([`det_spinCGroupHalfSpinRep`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/HalfSpin.html#CliffordAlgebra.det_spinCGroupHalfSpinRep), [`realSpinCHalfSpinSmoothHom`](https://taucetiproject.org/docs/TauCeti/Geometry/Lie/CliffordAlgebra/SpinC/HalfSpin.html#Orientation.realSpinCHalfSpinSmoothHom)).
- **The norm identity for the quadratic two-form** — q = C⁻¹Q₀ satisfies |q(ψ)|² = |ψ|⁴/8, alongside C(q(ψ))ψ = (|ψ|²/2)ψ, phase invariance and Spinᶜ equivariance ([`norm_quadraticTwoForm_sq`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/QuadraticTwoForm.html#TauCeti.SeibergWitten.norm_quadraticTwoForm_sq)).
- **The real derivative of the quadratic map** — Q₀(ψ) = ψψ* − (|ψ|²/2)·Id has strict real derivative φ ↦ φψ* + ψφ* − Re⟨ψ,φ⟩·Id ([`hasStrictFDerivAt_quadraticEnd`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/QuadraticEnd.html#TauCeti.SeibergWitten.hasStrictFDerivAt_quadraticEnd)).
- **The character of W⁺ − W⁻** — on the maximal torus, tr ρ⁺ − tr ρ⁻ = z(w₁ − w₁⁻¹)(w₂ − w₂⁻¹). This is the representation input to the Â-genus calculation of SW3.3a ([`trace_spinCGroupHalfSpinRep_one_sub_neg_one_mk_spinTorus`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/TorusCharacter.html#CliffordAlgebra.trace_spinCGroupHalfSpinRep_one_sub_neg_one_mk_spinTorus)).
- **Logarithmic derivatives of circle maps** — a smooth closed imaginary one-form with periods in 2πiℤ is dlog u for a smooth map u into U(1) ([`exists_mlogDeriv_coe_eq`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/LogDeriv.html#TauCeti.exists_mlogDeriv_coe_eq)).

### Notable definitions and infrastructure

- **The group Spinᶜ(Q)**, the quotient of Spin(Q) × U(1) by (−1, −1). It carries the determinant character z² and double covers SO × U(1); every representation statement above lives on it ([`spinCGroup`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinC.html#CliffordAlgebra.spinCGroup)).
- **The abelian deformation operator** T a = (−2d*a, (da)⁺) on a closed four-manifold. Its kernel is the closed and coclosed one-forms, and its range is annihilated exactly by the closed functions and closed self-dual forms. SW3.4's Fredholm theory starts here ([`abelianDeformationOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/SeibergWitten/AbelianDeformation.html#TauCeti.SeibergWitten.abelianDeformationOperator)).
- **The insertion form**, the alternating integral form (a₁, …, a_r) ↦ ⟨a₁ ⌣ ⋯ ⌣ a_r ⌣ β, f_*[N]⟩ on H¹(X; ℤ), built on a new integral cup product. It has the shape of the full SW8.2 invariant ([`cupInsertionForm`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Cohomology/InsertionForm.html#TauCeti.HomologicalOrientation.cupInsertionForm)).

### Roadmap coverage

SW2.2 is done. SW1.1 is done: descent, unitarity, smoothness, Clifford equivariance, det ρ± = z², Γ* = Γ and the SU(2) factor labels. The supplied material does not say whether this Spinᶜ(4) is the FourManifolds F4 carrier. SW2.1 and SW2.3 are done pointwise (C*C = 4, CC* = 4 times the trace-free projection, τ(Id) = 0, the q identities). Globally, smooth self-dual forms with rank-three fibres exist, but C and τ are not yet bundle maps and q has no Sobolev bounds.

The following are partial:
- SW3.1 has its symbol homotopy from c(ξ) to ic(ξ), but no operator D_A.
- SW3.4 has T, its kernel and cokernel annihilator, and index doubling under realification, but no ellipticity or index.
- SW4.2 is done for smooth maps only.
- SW4.4 has scalar coercivity of Δ + V on H¹, and SW4.5 has the orbit-space metric.
- SW6.1 has the pointwise isomorphism v ↦ c(v)ψ.
- SW8.2 and SW9.4 have their cohomological algebra: half-integrality of ⟨l ⌣ a ⌣ b, [N]⟩, vanishing of four-fold pairings at positive index at most two, and integral divided powers.
- SW11.1 is done pointwise on the Fock model, where W⁺ = Λ⁰ ⊕ Λ² and c₂(ω) acts by −2i on the vacuum.

SW1.2, SW1.3 and SW3.3a have only lemmas: chirality naturality, the infinitesimal determinant splitting, and the torus characters. SW1.4, SW3.2, SW3.3, SW3.5, SW4.1, SW4.3, SW5, SW6.2–SW6.3, SW7, SW8.1, SW8.3, SW9.1–SW9.3, SW10 and SW11.2–SW11.3 are untouched.

## The frontier

- **Fredholm theory of T (SW3.4).** Prove ellipticity, kernel iH¹, cokernel iH⁰ ⊕ iH⁺ and index b₁ − 1 − b₂⁺ on Sobolev completions. The smooth kernel and annihilator are already identified; the Hodge and Sobolev carriers come from ComplexKahlerGeometry K5a.
- **Spinor bundles and the determinant line (SW1.2).** Associate W± and L to a Spinᶜ lift through the smooth representation, with det W⁺ ≃ L ≃ det W⁻ and the line-twist identities. This needs FourManifolds F4's principal lifts.
- **The Spinᶜ connection (SW1.3).** The infinitesimal fact that a determinant direction acts by (ia/2)·Id is proved. The connection, its curvature formula and gauge covariance are not.
- **Globalizing C, τ and q (SW2.1, SW2.3).** Turn the Clifford map and q into bundle maps over Λ⁺ and W⁺, and prove the four-dimensional Sobolev bounds SW4 consumes.
- **Sobolev integral logarithms (SW4.2–SW4.3).** Extend the period theory to H^(s+1) gauges, prove the harmonic integral lattice is discrete and of full rank, then solve the global Coulomb problem.

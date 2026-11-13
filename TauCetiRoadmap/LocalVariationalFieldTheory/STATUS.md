<!--tauceti-status:v1 {"roadmap":"LocalVariationalFieldTheory","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"general jet bundles J^rE and prolongation, the contact bicomplex and finite-order sheaf, polynomial-jet conjugation and the Kaehler comparison","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"sections 3.1-3.9, and in 3.10 the gamma covariance law, the U/T transports, the real Dirac density and its currents","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"ea5148ff22930e1d060fdde5d003d216ea521a1dc6420fd1ee8a4f3596de27f4","roadmap":"LocalVariationalFieldTheory","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: LocalVariationalFieldTheory

This file documents the status of the LocalVariationalFieldTheory roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the algebraic edges of the roadmap exist so far: the finite Dirac Clifford/Spin model of Layer 3 has both of its acceptance theorems, and Layer 1 has categorical real descent and first-order nonlinear jet coordinate changes. The variational machinery itself (jet bundles, the variational bicomplex, the Euler operator, Noether I and II, stress-energy) has not begun.

### Named results

- **The Dirac Clifford–Spin comparison** — the real Clifford representation of Cl(3,1) on ℂ⁴, sending v to −iC(v), [restricts on Spin(3,1) to the Weyl action](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.diracClifford_spinGroup) diag(A, (A†)⁻¹), through the native Spin–SL₂ equivalence rather than by matching squares.
- **Spin covariance of Clifford multiplication** — C(s·v)ρ_W(s) = ρ_W(s)C(v) for every Spin element and vector ([`diracVector_smul_mul_diracWeyl`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.diracVector_smul_mul_diracWeyl)), and the Weyl action [preserves the Dirac pairing](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.conjTranspose_diracWeyl_mul_mul) H₀; together these are the roadmap's second acceptance headline.
- **The Dirac anticommutation relations** — the dual-frame gamma matrices satisfy [{Γ^μ, Γ^ν} = 2η^{μν}](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.diracGamma_mul_add_mul_swap) for η = diag(1, −1, −1, −1), and the chirality matrix Γ⁵ = iΓ⁰Γ¹Γ²Γ³ is [diag(1, −1) in Weyl blocks](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.diracChirality_eq).
- **Real descent as an equivalence of categories** — complexification with its conjugation is [an equivalence](https://taucetiproject.org/docs/TauCeti/Algebra/Category/StarModuleCat/ComplexDescent.html#TauCeti.complexDescent) from real modules to complex modules with conjugation, with the fixed-point functor as inverse and no finiteness hypothesis.
- **The cocycle law for nonlinear first-jet changes** — pulling back first jets by a base map and a nonlinear, base-dependent fibre map [composes correctly](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Jet/Nonlinear.html#TauCeti.firstJetCoordChange_comp), with derivatives taken at the actual intermediate points.

### Notable definitions and infrastructure

- [`firstJetCoordChange`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Jet/Nonlinear.html#TauCeti.firstJetCoordChange) gives first-jet transitions in local coordinates. It is the chart-level input for building the general jet bundle, and it already shows that the derivative part changes affinely, so no zero jet is canonical.
- [`StarModuleCat`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/StarModuleCat/Basic.html#TauCeti.StarModuleCat), the category of modules with a compatible involution, is the target category for transporting real field generators to their complexifications without choosing a basis.
- [`timeFirstToNative`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.timeFirstToNative) fixes the dictionary between physical time-first Minkowski coordinates and the native time-last Clifford form. Every later Dirac computation depends on it.

### Roadmap coverage

Layer 1 is partial: §1.2's realification/complexification equivalence is done, but its extension of conjugation to polynomial jets is not. Of §1.1, only first-order chart transitions exist. The bundles J^rE, prolongation, contact forms, the locally finite-order sheaf and the polynomial comparisons of §§1.3–1.4 are absent. Layer 3 is partial: the matrix and Spin half of §3.10 (finite Dirac) is done, but its gamma covariance under Lorentz transformations, the Weyl-swap and spatial-cycle transports, the real Dirac density, the paired equations and the vector and axial currents are not. §§3.1–3.9 (transposes, Cauchy functionals and brackets, constraints, Maxwell and scalar electrodynamics) are untouched. Layers 2, 4, 5 and 6 are untouched.

## The frontier

- **Gamma covariance and transports (§3.10)** — prove Γ^μ ρ_W(A)(Λ⁻¹)^ν_μ = ρ_W(A)Γ^ν, plus the conjugate-Weyl carrier with ε and the U and spatial-cycle comparisons with the source's gamma blocks. All of this is native matrix algebra and needs no variational input.
- **Polynomial-jet real descent (§1.2, §1.4)** — extend conjugation to polynomial field jets and show it commutes with total derivatives and field evaluation. This needs the polynomial jet algebra with stage-raising total derivations, which does not yet exist.
- **General jet bundles J^rE (§1.1)** — extend the first-order transitions to all orders (Faà di Bruno transitions and cocycles), build the bundle charts, and prove the affine structure over J^(r−1)E and the comparison with the linear vector-bundle jets of PseudodifferentialOperators P1.0.
- **The finite-stage variational bicomplex (§1.3)** — contact forms, d_H and d_V with their raised-stage realization, and the sheafified locally finite-order carrier. Layer 2's Euler operator and everything after it depend on this.
- **Dirac density and currents (§3.10)** — the identity Re L_D = L_D − (i/2)∂_μ(ψ̄Γ^μψ) and the phase and axial currents need Layer 2's first variation and Layer 4's Noether currents, so they come after those layers.

<!--tauceti-status:v1 {"roadmap":"LocalVariationalFieldTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the glued bundle J^rE with affine structure and prolongation, the contact bicomplex and finite-order sheaf, polynomial-jet conjugation and the Kaehler comparison","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"sections 3.1-3.9, and in 3.10 the real Dirac density, paired equations, phase and axial currents and the Grassmann extension","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"47fedc4f340766bccae038b6f9bf231e7eef12e8f2da6b9acfa2d082eee6ae47","roadmap":"LocalVariationalFieldTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: LocalVariationalFieldTheory

This file documents the status of the LocalVariationalFieldTheory roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The matrix and Spin half of the finite Dirac model (§3.10) is complete, including the gamma covariance law and the textbook-frame transports. Layer 1 has chart-level jets of every order, a polynomial jet algebra with total derivatives, and categorical real descent, but no global jet bundle and no variational bicomplex yet. Layers 2, 4, 5 and 6, which hold the Euler operator, the Noether theorems and stress-energy, have not begun.

### Named results

- **The Dirac Clifford–Spin comparison**: the real Clifford representation of Cl(3,1) on ℂ⁴, sending v to −iC(v), [restricts on Spin(3,1) to the Weyl action](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.diracClifford_spinGroup) diag(A, (A†)⁻¹). The proof goes through the native Spin–SL₂ equivalence rather than by matching squares.
- **Spin covariance of Clifford multiplication**: C(s·v)ρ_W(s) = ρ_W(s)C(v) ([`diracVector_smul_mul_diracWeyl`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.diracVector_smul_mul_diracWeyl)), and the Weyl action [preserves the Dirac pairing](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.conjTranspose_diracWeyl_mul_mul) H₀. Together these are the roadmap's second acceptance headline.
- **Lorentz covariance of the Dirac matrices**: Σ_μ (Λ⁻¹)^ν_μ Γ^μ ρ_W(s) = ρ_W(s)Γ^ν, where Λ is the Lorentz transformation induced by s ([`sum_smul_diracGamma_mul_diracWeyl`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/Covariance.html#TauCeti.sum_smul_diracGamma_mul_diracWeyl)). This is the identity behind ψ′(x) = ρ_W(A)ψ(Λ⁻¹x).
- **Realisation of finite jets**: on a finite-dimensional real base, every finite symmetric jet is [the jet of a smooth function with compact support](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Jet/Realization.html#TauCeti.exists_contDiff_hasCompactSupport_iteratedFDeriv_eq) inside any prescribed neighbourhood. This is the jet-surjectivity that Layer 2's source-form uniqueness will need.
- **Real descent as an equivalence of categories**: complexification with its conjugation is [an equivalence](https://taucetiproject.org/docs/TauCeti/Algebra/Category/StarModuleCat/ComplexDescent.html#TauCeti.complexDescent) from real modules to complex modules with conjugation, with no finiteness hypothesis.

### Notable definitions and infrastructure

- [`JetAt`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Jet/Higher.html#TauCeti.JetAt), the order-r jets at a point of local sections in a bundle chart. Nonlinear, base-dependent coordinate changes act on it and [compose correctly](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Jet/Higher.html#TauCeti.JetAt.map_comp), and it is [identified with symmetric derivative tuples](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Jet/Higher.html#TauCeti.JetAt.coordinatesEquiv). These are the fibre and transition data from which JʳE is to be glued.
- [`PolynomialJet`](https://taucetiproject.org/docs/TauCeti/Geometry/Variational/PolynomialJet/Basic.html#TauCeti.PolynomialJet), the polynomial algebra on base coordinates and symmetric field-jet coordinates. Its finite stages are linked by commuting total derivatives that raise jet order by at most one. It is the carrier for the polynomial Kähler complex and for the polynomial-jet conjugation of §1.2.
- [`timeFirstToNative`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dirac/ThreeOne.html#TauCeti.timeFirstToNative) fixes the dictionary between time-first physical coordinates and the native time-last Clifford form. Every Dirac computation depends on it.

### Roadmap coverage

Layer 1 is partial. In §1.1, jet equivalence, its coordinates, truncation, order-zero and order-one comparisons, chart-change laws at every order and local realisation by smooth sections are done at a single point in a chart. The glued bundle JʳE with its Faà di Bruno charts, the affine structure over Jʳ⁻¹E, connection splittings, the P1.0 comparison, holonomic prolongation and the contact ideal are absent. §1.2's categorical real descent is done, but its extension to polynomial jets is not. In §1.3 only the polynomial stage algebras with total derivatives exist: there are no contact forms, d_H or d_V, sheafification or Kähler complex. §1.4 is untouched. Layer 3 is partial. The whole matrix and Spin part of §3.10 is done: both acceptance headlines, gamma covariance, the ε carrier, and the T and U transports with the chirality comparison. The real Dirac density, the paired equations, the vector and axial currents and the Grassmann extension remain, and §§3.1–3.9 are untouched. Layers 2, 4, 5 and 6 are untouched.

## The frontier

- **The global jet bundle JʳE (§1.1)**: glue the chartwise jets into a smooth finite-dimensional bundle, prove the affine structure over Jʳ⁻¹E modelled on Sym^r(T*M)⊗VE, and define holonomic prolongation and the contact ideal. The chart-change laws and the symmetric-tuple coordinates are already in place.
- **Polynomial-jet real descent (§1.2)**: extend conjugation to the polynomial jet algebra and show it commutes with total derivatives and field evaluation. Both the categorical equivalence and the polynomial carrier now exist.
- **The polynomial and finite-stage bicomplex (§§1.3–1.4)**: build the polynomial Kähler/de Rham complex with d_alg² = 0 and its signed comparison with d_H and d_V, then the smooth contact forms and the locally finite-order sheaf. Layer 2 depends on this.
- **First variation and the Euler operator (Layer 2)**: the identity δL = ⟨E(L), δu⟩ + d_HΘ with the order bound 2r. It needs the bicomplex. The jet-realisation theorem already supplies the surjectivity input to source-form uniqueness.
- **Dirac density and currents (§3.10)**: prove Re L_D = L_D − (i/2)∂_μ(ψ̄Γ^μψ), the paired equations, and the phase and axial currents. These need Layer 2's first variation and Layer 4's Noether currents.

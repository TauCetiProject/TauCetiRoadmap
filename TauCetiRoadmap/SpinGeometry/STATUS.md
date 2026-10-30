<!--tauceti-status:v1 {"roadmap":"SpinGeometry","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: SpinGeometry

This file documents the status of the SpinGeometry roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Work so far is confined to the algebraic opening layer G1, which is substantially but not completely done: the Spin(Q)/Spin(−Q) comparison, the scalar trace, the Fock model of a complex structure and the Morita evaluation are in place. Nothing geometric has begun: there are no chirality comparisons (G2), Clifford bundles (G3), spin structures (G4), spinor bundles (G5) or Dirac operators (G6).

### Named results

- **The Spin(Q) ≅ Spin(−Q) comparison** — [`spinGroupEquivNeg`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Neg.html#CliffordAlgebra.spinGroupEquivNeg) links the compact Spin group to the negative-metric model used for geometric Clifford multiplication. It preserves vector actions, sends −1 to −1, and has the bivector sign pinned in its [real-coordinate form](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/Neg.html#CliffordAlgebra.realCliffordSpinGroupEquivNeg).
- **The normalized Fock action intertwines the native one** — [`degreeScaling_comp_spinAction_eq_fockAction_comp`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Spin/Polarization/Fock.html#TauCeti.AlmostComplexStructure.degreeScaling_comp_spinAction_eq_fockAction_comp): scaling Λ^pW by √2^p carries the native spinor action to the √2-normalized action, in which a real vector acts by [√2 times creation plus a √2/2-weighted contraction](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Spin/Polarization/Fock.html#TauCeti.AlmostComplexStructure.fockAction_ι_one_tmul).
- **Morita evaluation** — [`isotypicTensorEquivOfBijective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Morita/ModuleEnd.html#TauCeti.isotypicTensorEquivOfBijective): when an algebra acts on S as all of End S, every module M is S ⊗ Hom(S, M) by s ⊗ T ↦ T(s), naturally in M.
- **The scalar trace is the normalized regular trace** — [`trace_mulLeft_eq_two_pow_mul_scalarTrace`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/Basic.html#CliffordAlgebra.trace_mulLeft_eq_two_pow_mul_scalarTrace): the degree-zero part is 2^(−dim V)·tr(L_a), for every quadratic form.
- **Positivity of the trace pairing** — [`scalarTrace_reverse_mul_self_nonneg`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/OrthogonalBasis.html#CliffordAlgebra.scalarTrace_reverse_mul_self_nonneg): τ(reverse x · x) ≥ 0 when Q is nonnegative on an orthogonal basis. It is [faithful](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/OrthogonalBasis.html#CliffordAlgebra.scalarTrace_reverse_mul_self_eq_zero_iff) when Q is positive there.

### Notable definitions and infrastructure

- [`spinPolarizationData`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Spin/Polarization/ComplexStructure.html#TauCeti.AlmostComplexStructure.spinPolarizationData) polarizes the complexification of a quadratic space by the ±i-eigenspaces of a compatible complex structure J. It plugs the geometric (V, J) into the existing spinor-representation supplier.
- [`sesqComplexification`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/BilinearForm/Complexification.html#LinearMap.BilinForm.sesqComplexification) is the Hermitian form h(x, y) = g_ℂ(x̄, y), which is positive definite when g is. It is the metric behind |v^(1,0)|² = |v|²/2 and the identification of h_J with [twice its pullback](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Complex/HermitianForm.html#TauCeti.SymplecticForm.Invariant.complexAssociatedForm_eq_two_mul_sesqComplexification).
- [`conjStar`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Complexification.html#CliffordAlgebra.conjStar) is the conjugate-linear Clifford involution that makes c(v) skew-Hermitian. It is matched with the tensor-product star, and its interaction with the [scalar trace](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/Basic.html#CliffordAlgebra.scalarTrace) is the input GeneralizedCohomology G5.5 consumes.

### Roadmap coverage

G1 is partial in every item. **G1.1** has the real even-algebra comparison of Spin(n) with the negative-form model. It lacks the rank-zero μ₂ branch, the complex map v ↦ iv with its even-restriction comparison, and the transported real classification. **G1.2** has the polarization, the normalized Fock action with its intertwining equation and Clifford relation, and the metric identities |v^(1,0)|² = |v|²/2 and h_J = 2·pullback. It lacks the three anticommutators, adjointness of wedge and contraction, skew-Hermitian c(v), the 2^p metric comparison, and the 2-plane and tensor computations. **G1.3** has the star, the real trace package, the grading eigenspace characterization and the algebraic Morita evaluation with its dimension formula. It lacks complex positivity of τ_ℂ, the semidefinite null-ideal, the positive Hermitian spinor metric unique up to a positive scalar, and the dual action on S*. **G1.4** has only the element dictionary for Cl(V) ≃ Cl⁰(V ⊕ ℝ). G2 through G6 are untouched.

## The frontier

- **Finish the Fock module (G1.2)** — the creation/annihilation anticommutators, adjointness of wedge and contraction for the exterior Gram metric, skew-Hermitian c(v), and the 2^p factor between the native and normalized metrics.
- **Positive Hermitian spinor metric (G1.3)** — existence of a metric making ρ a *-representation for `conjStar`, transported from the Fock metric, and uniqueness up to a positive scalar via Schur. The Morita evaluation now supplies the multiplicity spaces; the existence proof needs the metric half of G1.2.
- **Complex positivity of the trace (G1.3)** — τ_ℂ(a*a) = Σ|a_I|²·Π b(e_i, e_i) ≥ 0 on the tensor complexification, and the null set as the ideal generated by the radical of b.
- **Odd-dimensional labelled factors (G1.4)** — the central element ω_ℂ, its idempotents, and ψ(ω_ℂ) = −Γ through the Cl(V) ≃ Cl⁰(V ⊕ ℝ) dictionary that is now in place.
- **Volume and chirality (G2.1)** — the normalized volume Γ, its orientation behaviour and the half-spin eigenspace splitting. This depends only on G1 and the existing half-spin suppliers.

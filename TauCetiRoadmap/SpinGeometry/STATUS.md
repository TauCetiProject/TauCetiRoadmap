<!--tauceti-status:v1 {"roadmap":"SpinGeometry","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
# Status: SpinGeometry

This file documents the status of the SpinGeometry roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the algebraic opening layer G1 has begun. Its comparison between the Spin groups of Q and −Q, its conjugate-linear Clifford star and its scalar trace are partly in place. Nothing geometric has landed yet: no volume or chirality comparisons (G2), Clifford bundles (G3), spin structures (G4), spinor bundles (G5) or Dirac operators (G6).

### Named results

- **The Spin(Q) ≅ Spin(−Q) comparison** — [`spinGroupEquivNeg`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Neg.html#CliffordAlgebra.spinGroupEquivNeg) restricts Mathlib's even-subalgebra identification to a group isomorphism. It preserves the vector actions exactly and sends −1 to −1. Its coordinate form [`realCliffordSpinGroupEquivNeg`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/Neg.html#CliffordAlgebra.realCliffordSpinGroupEquivNeg) carries the compact Spin(n) into the negative-definite model, with the bivector sign [pinned](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/Neg.html#CliffordAlgebra.coe_realCliffordSpinGroupEquivNeg_apply_of_coe_eq_ι_mul_ι).
- **The scalar trace is the normalized regular trace** — [`trace_mulLeft_eq_two_pow_mul_scalarTrace`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/Basic.html#CliffordAlgebra.trace_mulLeft_eq_two_pow_mul_scalarTrace): the degree-zero part equals 2^(−dim V)·tr(L_a) for every quadratic form on a finite-dimensional space, when 2 is invertible.
- **Uniqueness of the scalar trace** — [`eq_smul_scalarTrace`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/Basic.html#CliffordAlgebra.eq_smul_scalarTrace): up to scale, the scalar trace is the only cyclic functional invariant under the grade involution. It is also [invariant under algebra isomorphisms](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/Basic.html#CliffordAlgebra.scalarTrace_eq_of_algEquiv).
- **Positivity of the trace pairing** — for an orthogonal basis, τ(reverse x · y) is diagonal in the ordered-product basis ([`scalarTrace_reverse_mul`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/OrthogonalBasis.html#CliffordAlgebra.scalarTrace_reverse_mul)). So the pairing is [nonnegative](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/OrthogonalBasis.html#CliffordAlgebra.scalarTrace_reverse_mul_self_nonneg) when Q is nonnegative on the basis and [faithful](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/OrthogonalBasis.html#CliffordAlgebra.scalarTrace_reverse_mul_self_eq_zero_iff) when Q is positive on it.

### Notable definitions and infrastructure

- [`conjStar`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Complexification.html#CliffordAlgebra.conjStar) is the conjugate-linear involution on the complexified Clifford algebra: coefficient conjugation [`complexConj`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Complexification.html#CliffordAlgebra.complexConj) composed with Clifford conjugation. `complexConj` is characterized by fixing the real vectors. On the tensor carrier `conjStar` is the tensor-product star, and it is the involution for which Clifford multiplication by a real vector becomes skew-Hermitian.
- [`scalarTrace`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/Basic.html#CliffordAlgebra.scalarTrace) is the trace τ of G1.3. Its [base-change compatibility](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/BaseChange.html#CliffordAlgebra.scalarTrace_ofBaseChange) and its [conjugation law](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/BaseChange.html#CliffordAlgebra.scalarTrace_conjStar) τ(a*) = conj τ(a) are the inputs GeneralizedCohomology G5.5 consumes.
- [`basis_eq_prod_map_sort`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/OrthogonalBasis.html#CliffordAlgebra.basis_eq_prod_map_sort) identifies the ordered products e_I of an orthogonal basis with the native Clifford basis, for any Q, degenerate or not.

### Roadmap coverage

G1 is partial. In G1.1, the real even-algebra comparison of Spin(n) with the negative-form model is done. Not yet visible are the rank-zero μ₂ ⊂ Cl(0) branch, the complex v ↦ iv full-algebra map with its even-restriction comparison, and the transport of the real classification and periodicity to the negative form. In G1.3, the conjugate-linear star and most of the scalar-trace package are done, including real positivity and faithfulness. Still missing are positivity of τ_ℂ(a*a) with complex coefficients, the semidefinite null-ideal characterization, the positive Hermitian metric unique up to a positive scalar, and the Morita evaluation isomorphism S⊗Hom_Cl(S,E) ≅ E. G1.2 (the J-polarization and √2-normalized Fock action) and G1.4 (odd-dimensional labelled factors) have not landed. G2 through G6 are untouched.

## The frontier

- **Complex positivity of the trace (G1.3)** — prove τ_ℂ(a*a) = Σ|a_I|²·Π b(e_i,e_i) ≥ 0 on the tensor complexification, and that its null set is the ideal generated by the radical of b. The real coordinate formula and the conjugation law are already in place.
- **Positive Hermitian spinor metric and Morita evaluation (G1.3)** — prove existence and uniqueness, up to a positive scalar, of the metric making ρ a *-representation for `conjStar`, and build the evaluation isomorphism S⊗Hom_Cl(S,E) ≅ E. The existence proof needs the normalized Fock metric from G1.2.
- **Fock polarization of (V,J) (G1.2)** — the isotropic eigenspaces, the adapted polarization data, and the intertwining between the native action and the √2-normalized action with its metric factors.
- **Rest of G1.1** — the rank-zero μ₂ branch, the complex v ↦ iv map with the explicit bivector sign on its even restriction, and the transported real classification for the negative form.
- **Volume and chirality (G2.1)** — the normalized volume Γ, its orientation behaviour and the half-spin eigenspace splitting. This needs only G1 and the existing half-spin suppliers.

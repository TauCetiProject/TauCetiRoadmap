<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"afdb5315ed242f286fba37760118c20786373352","ts":"2026-11-24T12:11:44Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"The eta-quotient criterion: the transformation law on Gamma0(N) with character chi(d), and membership in M_k(N, chi) and S_k(N, chi)","state":"partial"},{"id":"Layer 1","remaining":"The geometric-order dictionary on the effective quotient and the projective valence formula","state":"partial"},{"id":"Layer 2","remaining":"The integral and rational p-adic comparisons of 2.2, including the central localization","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"Agreement at primes outside a finite set, with no character hypothesis","state":"partial"},{"id":"Layer 6","remaining":"|lambda_Q| = 1 for general nebentypus, via equal Petersson norms of f and its transported newform","state":"partial"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"Arithmetic forms of 8.0, rational descent, weight-one coefficient fields, unique Galois conjugates and orbit sizes","state":"partial"},{"id":"Layer 9","remaining":"Galois conjugate newforms, the sharp twist level, inner twists, trace forms and orbit separation","state":"partial"},{"id":"Layer 10","remaining":"Finiteness of H1, Serre duality, genus formula, automorphy bundle, dimension formulas, complex structure on Y1(N), algebraicity","state":"partial"},{"id":"Layer 11","state":"done"}],"readme_sha":"ce38ed7690f61e054a2959dcdf77afe9870d8877ca4fcf7028078b35e9c16ae0","roadmap":"ModularForms","to_sha":"afdb5315ed242f286fba37760118c20786373352"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `afdb531` (2026-11-24T12:11:44Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3, 4, 7 and 11 are done: fixed-character old/new spaces, the conductor, the sharp abscissa and the level-one trace formula. Every other layer is partial. The largest gaps are finiteness of `H¹` (and with it unconditional Riemann–Roch, Serre duality and the dimension formulas), the eta-quotient criterion, the `p`-adic Hecke comparison and the arithmetic weight-one forms of §8.0.

### Named results

- **The Eichler–Selberg trace formula at level one** — for even `k ≥ 4` and `n ≥ 1`, the trace of `Tₙ` on `S_k(SL₂(ℤ))` is −½ Σ_{t² ≤ 4n} P_k(t, n) H(4n − t²) − ½ Σ_{dd′=n} min(d, d′)^{k−1}, with `H` the Hurwitz class number (`trace_heckeTCuspLevelOne_eq_neg_hurwitzClassNumber_sub_min`).
- **The newform decomposition** — `S_k(Γ₁(N))` is [the direct sum](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/Newforms/DirectSum.html#TauCeti.isInternal_map_levelRaiseₗ_cuspFormsNew) of the spaces `V_d S_k(Γ₁(M))ⁿᵉʷ` with `dM ∣ N`, so the newspace has [dimension Σ_{M ∣ N} (μ * μ)(N/M) · dim S_k(Γ₁(M))](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/Newforms/Dimension.html#TauCeti.natCast_finrank_cuspFormsNew_eq_sum_divisors) in every weight (Diamond–Shurman, Theorem 5.8.3).
- **Shimura's Theorem 3.20** — for a prime `p`, the `p`-local Hecke ring of `GL_n` is a polynomial ring over `ℤ` on the `n` diagonal prime cosets, in every rank ([`polynomialRingEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Presentation.html#HeckeRing.GLn.polynomialRingEquiv)).
- **Dedekind's eta transformation law, in Kronecker form** — `η(γτ) = ε(γ)√(cτ + d)·η(τ)` on `SL₂(ℤ)` ([`eta_smul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/DedekindEta/Transformation.html#TauCeti.ModularForm.eta_smul)), with `ε(γ)` given both by Dedekind sums and, for odd `c > 0`, as [`(d/c)·e(((a + d)c − bd(c² − 1) − 3c)/24)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/DedekindEta/Kronecker.html#TauCeti.ModularForm.etaMultiplier_eq_kroneckerSym_mul_of_c_pos_of_odd_c), with a companion formula for even `c`.
- **The sharp noncuspidal abscissa** — for every modular form of weight `k` on a group containing `Γ₁(N)`, the coefficient L-series converges absolutely for `Re s > k`, including weight one ([`abscissaOfAbsConv_qExpansion_coeff_le_of_Gamma1_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/LFunction/Abscissa.html#TauCeti.ModularFormClass.abscissaOfAbsConv_qExpansion_coeff_le_of_Gamma1_le); Diamond–Shurman, Proposition 5.9.1).

### Notable definitions and infrastructure

- [Riemann–Roch for divisor sheaves](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/RiemannRoch.html#TauCeti.RiemannSurface.finrank_divisorSheaf_euler_characteristic), `h⁰(D) − h¹(D) = deg D + 1 − g_an`, under the hypothesis that `H¹(X, 𝒪)` is finite-dimensional. With [the residue theorem](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Differential/Residue/Theorem.html#TauCeti.RiemannSurface.OneForm.sum_residue_eq_zero), the same hypothesis yields finite maps to `ℙ¹` and canonical divisors; on `ℙ¹` itself Riemann–Roch is unconditional.
- [Eta quotients](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/DedekindEta/Quotient.html#TauCeti.ModularForm.etaQuotient), with their order at every cusp given by [Ligozat's formula](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/DedekindEta/Quotient.html#TauCeti.ModularForm.natCast_div_gcd_mul_etaQuotientOrder).
- The [bijection between `Γ₁(N)\ℍ` and Tate normal forms](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Elliptic/Gamma1/TateNormalForm.html#TauCeti.gamma1QuotientEquivTateNormalForm) for `N ≥ 4`, now equivariant for diamonds, together with [the complex Tate curve](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Elliptic/TateUniformization.html#UpperHalfPlane.complexTateUniformization) matched with the Weierstrass curve of `ℤz + ℤ`.

### Roadmap coverage

- **Done:** Layers 3, 4, 7 and 11.
- **Layer 0** has all of §0.1, the eta transformation law with its Dedekind-sum and Kronecker forms, Dedekind reciprocity, and the cusp orders of eta quotients. It lacks the eta-quotient criterion: the law `f|_kγ = χ(d)f` on `Γ₀(N)` and membership in `M_k(N, χ)`.
- **Layers 1 and 2:** Layer 1 lacks the geometric-order dictionary and projective valence formula, Layer 2 the `p`-adic comparison.
- **Layer 5** lacks strong multiplicity one from agreement at primes alone without a character hypothesis. **Layer 6** lacks `|λ_Q| = 1` for general nebentypus.
- **Layers 8 and 9** have no arithmetic forms, rational descent, Galois-conjugate newforms, inner twists or orbit separation. Layer 8 does have the newspace Hecke algebra over `ℚ(χ)`, étale in weight at least two.
- **Layer 10** is partial in every part:
  - **10A** has the cusp and elliptic-point counts and the cusp-width sum, but not the genus formula.
  - **10B** has conditional Riemann–Roch, the residue theorem, the `ℙ¹` case and genus zero, but not finiteness of `H¹`, Serre duality or the general genus comparison.
  - **10C** has the automorphy-sheaf transitions but no line bundle or dimension formula.
  - **10D** has the moduli and Tate-normal-form bijections and the complex Tate curve, but not the complex structure on `Y₁(N)` or algebraicity.

## The frontier

- **The eta-quotient criterion.** What remains is to multiply the Kronecker multipliers of the `γ_δ` down to `χ(d)` using the two congruences and quadratic reciprocity, then read off membership in `M_k(N, χ)` and `S_k(N, χ)`.
- **Finiteness of `H¹`.** The Leray theorem for finite acyclic covers and uniformly bounded Bergman lifts are in; the step concluding `dim H¹(X, 𝒪) < ∞` is not. Serre duality, the genus comparison and the dimension formulas wait on it.
- **The complex structure on `Y₁(N)`.** What remains is the implicit-function chart on the plane model and biholomorphy of the bijection.
- **Cross-level strong multiplicity one, as stated.** What remains is to use eigenvalues at primes alone, with no character hypothesis; the proved version compares all coefficients prime to the levels.
- **Unit pseudo-eigenvalues.** `|λ_Q| = 1` is proved when the Petersson norms of `f` and its transported newform agree. What remains is to prove that equality for general nebentypus.

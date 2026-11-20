<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"The Kronecker form of the eta multiplier and the eta-quotient criterion with Ligozat's cusp orders","state":"partial"},{"id":"Layer 1","remaining":"The geometric-order dictionary on the effective quotient and the projective valence formula","state":"partial"},{"id":"Layer 2","remaining":"The integral and rational p-adic comparisons of 2.2, including the central localization","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"Agreement at primes outside a finite set, with no character hypothesis","state":"partial"},{"id":"Layer 6","remaining":"|lambda_Q| = 1 for general nebentypus, via equal Petersson norms of f and its transported newform","state":"partial"},{"id":"Layer 7","remaining":"The sharp abscissa for arbitrary forms in weight one, via the Eisenstein bound in weight one","state":"partial"},{"id":"Layer 8","remaining":"Arithmetic forms of 8.0, rational descent, weight-one coefficient fields, unique Galois conjugates and orbit sizes","state":"partial"},{"id":"Layer 9","remaining":"Galois conjugate newforms, the sharp twist level, inner twists, trace forms and orbit separation","state":"partial"},{"id":"Layer 10","remaining":"Finiteness of H1, Serre duality, genus formula, automorphy bundle, dimension formulas, complex structure on Y1(N), algebraicity","state":"partial"},{"id":"Layer 11","state":"done"}],"readme_sha":"91486d6b56a377974037a787e36c958f6d0cdcf59f06c6d3baffcaf88f5229e2","roadmap":"ModularForms","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The level-one Eichler–Selberg trace formula, the fixed-character old/new theory and the conductor of a good eigenform are done. The newform decomposition of Diamond–Shurman 5.8.3 now holds across all divisors of the level. Every other layer is partial. The largest gaps are finiteness of `H¹` (and with it unconditional Riemann–Roch, Serre duality and the dimension formulas), the eta-quotient criterion, the `p`-adic Hecke comparison and the arithmetic weight-one forms of §8.0.

### Named results

- **The Eichler–Selberg trace formula at level one** — for even `k ≥ 4` and `n ≥ 1`, the trace of `Tₙ` on `S_k(SL₂(ℤ))` is −½ Σ_{t² ≤ 4n} P_k(t, n) H(4n − t²) − ½ Σ_{dd′=n} min(d, d′)^{k−1}, with `H` the Hurwitz class number (`trace_heckeTCuspLevelOne_eq_neg_hurwitzClassNumber_sub_min`).
- **The newform decomposition** — `S_k(Γ₁(N))` is [the direct sum](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/Newforms/DirectSum.html#TauCeti.isInternal_map_levelRaiseₗ_cuspFormsNew) of the spaces `V_d S_k(Γ₁(M))ⁿᵉʷ` with `dM ∣ N`, so the newspace has [dimension Σ_{M ∣ N} (μ * μ)(N/M) · dim S_k(Γ₁(M))](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/Newforms/Dimension.html#TauCeti.natCast_finrank_cuspFormsNew_eq_sum_divisors) in every weight, with versions for fixed nebentypus and for `Γ₀(N)` (Diamond–Shurman, Theorem 5.8.3).
- **Shimura's Theorem 3.20** — for a prime `p`, the `p`-local Hecke ring of `GL_n` is a polynomial ring over `ℤ` on the `n` diagonal prime cosets, in every rank ([`polynomialRingEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Presentation.html#HeckeRing.GLn.polynomialRingEquiv)).
- **The cusp–Eisenstein decomposition** — `M_k(N, χ) = S_k(N, χ) ⊕ E_k(N, χ)`. It holds [in weight one at every level](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/WeightOne/Dimension.html#TauCeti.isCompl_weightOneEisensteinSubspace_range_cuspToModFormCharSpace), in weight two with the corrected `E₂`, and [in weight `k ≥ 3`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/Dimension.html#TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace) away from levels `1`, `2` and `4`.
- **Dedekind's transformation law for `η`** — `η(γτ) = ε(γ)√(cτ + d)·η(τ)` for `γ ∈ SL₂(ℤ)` ([`eta_smul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/DedekindEta/Transformation.html#TauCeti.ModularForm.eta_smul)), with [`ε(γ) = exp(πi((a + d)/(12c) − s(d, c) − 1/4))`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/DedekindEta/Transformation.html#TauCeti.ModularForm.etaMultiplier_of_c_pos) for `c > 0` and [the reciprocity law of Dedekind sums](https://taucetiproject.org/docs/TauCeti/NumberTheory/DedekindSum.html#TauCeti.dedekindSum_add_dedekindSum).

### Notable definitions and infrastructure

- [Riemann–Roch for divisor sheaves](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/RiemannRoch.html#TauCeti.RiemannSurface.finrank_divisorSheaf_euler_characteristic), `h⁰(D) − h¹(D) = deg D + 1 − g_an`, proved under the hypothesis that `H¹(X, 𝒪)` is finite-dimensional.
- The conductor and primitive associate of a good Hecke eigenform (`EigenformAwayFromLevel.conductor`). They come with the new/old dichotomy, stability under level raising and the cross-level characterisation of equal primitive associates, which together are Layer 4.
- The [bijection between `Γ₁(N)\ℍ` and Tate normal forms](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Elliptic/Gamma1/TateNormalForm.html#TauCeti.gamma1QuotientEquivTateNormalForm) for `N ≥ 4`. This bijection is the map that 10D is to make a biholomorphism onto `Y₁(N)(ℂ)`.

### Roadmap coverage

- **Done:** Layers 3, 4 and 11.
- **Layer 0** has all of §0.1, the transformation law of `η`, the Dedekind-sum value of the multiplier and Dedekind reciprocity. It lacks the Kronecker form and the eta-quotient criterion.
- **Layers 1 and 2** are unchanged: Layer 1 lacks the geometric-order dictionary and projective valence formula, Layer 2 the `p`-adic comparison.
- **Layers 5–7** each lack one piece:
  - **Layer 5:** strong multiplicity one from primes alone, with no character hypothesis.
  - **Layer 6:** `|λ_Q| = 1` in general.
  - **Layer 7:** the weight-one abscissa.
- **Layers 8 and 9** are unchanged: no rational descent, no Galois-conjugate newforms, no inner twists or orbit separation.
- **Layer 10** is partial in every part:
  - **10A** has the cusp and elliptic-point counts, now including `ε₂` and `ε₃` for `Γ₁(N)` and `Γ(N)`. It lacks the genus formula for `X(Γ)`.
  - **10B** has conditional Riemann–Roch, the analytic genus and the principal-parts sequence. It lacks finiteness of `H¹`, Serre duality and the comparison of analytic and topological genus.
  - **10C** has the automorphy-sheaf transitions with their cocycle law, but no line bundle and no dimension formula.
  - **10D** has the moduli bijection, the Tate-normal-form bijection and the coordinate comparison of the complex Tate curve with `℘`. It lacks the complex structure on `Y₁(N)` and algebraicity.

## The frontier

- **Finiteness of `H¹`.** What remains is `dim H¹(X, 𝒪) < ∞`. Riemann–Roch then becomes unconditional, and Serre duality follows by proving the residue pairing perfect; the genus comparison and the dimension formulas of 10C come after.
- **The Kronecker form of the eta multiplier.** All its inputs are proved: the Dedekind-sum value, reciprocity and the two generator laws. The eta-quotient criterion follows from it.
- **The complex structure on `Y₁(N)`.** The division values of `℘` are holomorphic and the Tate-normal-form bijection is in. What remains is the implicit-function chart on the plane model and biholomorphy of the bijection.
- **The weight-one sharp abscissa.** The weight-one cusp–Eisenstein decomposition is in. The Eisenstein bound in weight one is what remains.
- **Cross-level strong multiplicity one, as stated.** The proved versions compare all good indices, or assume compatible characters. What remains is to use primes alone, with no character hypothesis.

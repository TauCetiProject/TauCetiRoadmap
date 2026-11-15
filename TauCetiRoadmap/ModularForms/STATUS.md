<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"The weight-one decomposition M1 = S1 + E1, and all of 0.2: eta multiplier, Dedekind-sum reciprocity, Kronecker form, eta-quotient criterion","state":"partial"},{"id":"Layer 1","remaining":"The geometric-order dictionary on the effective quotient and the projective valence formula","state":"partial"},{"id":"Layer 2","remaining":"The integral and rational p-adic comparisons of 2.2, including the central localization","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"The conductor of a good eigenform and its API","state":"partial"},{"id":"Layer 5","remaining":"Agreement at primes outside a finite set, with no character hypothesis","state":"partial"},{"id":"Layer 6","remaining":"|lambda_Q| = 1 for general nebentypus, via equal Petersson norms of f and its transported newform","state":"partial"},{"id":"Layer 7","remaining":"The sharp abscissa for arbitrary forms in weight one","state":"partial"},{"id":"Layer 8","remaining":"Arithmetic forms of 8.0, rational descent, weight-one coefficient fields, unique Galois conjugates and orbit sizes","state":"partial"},{"id":"Layer 9","remaining":"Galois conjugate newforms, the sharp twist level, inner twists, trace forms and orbit separation","state":"partial"},{"id":"Layer 10","remaining":"Genus formula, finiteness of H1, Riemann-Roch, Serre duality, automorphy bundle, dimension formulas, moduli bijection and complex Tate curve","state":"partial"},{"id":"Layer 11","state":"done"}],"readme_sha":"91486d6b56a377974037a787e36c958f6d0cdcf59f06c6d3baffcaf88f5229e2","roadmap":"ModularForms","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Of the work that remains beyond the library's foundations, the level-one Eichler–Selberg trace formula and the fixed-character old/new decomposition are done. Every other layer is partial: weight-one Eisenstein theory, cross-level strong multiplicity one, Galois stability and the general-level dimension formulas are all still open. Nothing has been done on the eta transformation law, the `p`-adic Hecke comparison, or the arithmetic weight-one forms of §8.0.

### Named results

- **The Eichler–Selberg trace formula at level one** — for even `k ≥ 4` and `n ≥ 1`, the trace of `Tₙ` on `S_k(SL₂(ℤ))` equals −½ Σ_{t² ≤ 4n} P_k(t, n) H(4n − t²) − ½ Σ_{dd′=n} min(d, d′)^{k−1}. Here `H` is the Hurwitz class number and `P_k` a Dickson polynomial (`trace_heckeTCuspLevelOne_eq_neg_hurwitzClassNumber_sub_min`).
- **Shimura's Theorem 3.20** — for a prime `p`, the `p`-local Hecke ring of `GL_n` is a polynomial ring over `ℤ` on the `n` diagonal prime cosets, in every rank `n` ([`polynomialRingEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Presentation.html#HeckeRing.GLn.polynomialRingEquiv)).
- **The cusp–Eisenstein decomposition in weights two and higher** — `M_k(N, χ) = S_k(N, χ) ⊕ E_k(N, χ)` at every level in weight two, the corrected `E₂` included (`isCompl_weightTwoEisensteinSubspace_range_cuspToModFormCharSpace`). In weight `k ≥ 3` it holds away from levels `1`, `2` and `4` ([`isCompl_eisensteinSubspace_range_cuspToModFormCharSpace`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/Dimension.html#TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace)).
- **Old and new spaces at fixed character** — inside `S_k(N, χ)`, the oldspace is spanned by level raises of forms whose characters pull back to `χ`. The newspace is its orthogonal complement, and the oldspace vanishes when `χ` is primitive (`cuspFormsOld_inf_cuspFormCharSpace_eq_iSup`).
- **The coefficient field is a number field** — for a newform of weight `k ≥ 2`, `ℚ(aₙ : n)` is a number field ([`numberField_CoefficientField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/NumberField.html#TauCeti.numberField_CoefficientField)).

### Notable definitions and infrastructure

- The [sheaf `𝒪_D` of a divisor](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/Sheaf.html#TauCeti.RiemannSurface.divisorSheaf) on a Riemann surface and the [point-twist sequence](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/PointTwist.html#TauCeti.RiemannSurface.pointTwistSequence_shortExact) `0 → 𝒪_D → 𝒪_{D+x} → ℂ_x → 0`. The Riemann–Roch induction runs on these.
- The Atkin–Li [pseudo-eigenvalue `λ_Q(f)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/PseudoEigenvalue.html#HeckeRing.GL2.Newform.atkinLehnerPseudoEigenvalue), defined at every exact divisor `Q` of the level, with its product law.
- The newspace Hecke algebras over `ℚ` and over the character field `ℚ(χ)`, both finite. Galois stability is to be proved on these.

### Roadmap coverage

- **Done:** Layers 3 and 11.
- **Layer 0** has the weight-one and weight-two character series with their constant terms, and the weight-two decomposition. It lacks the weight-one decomposition and all of §0.2 (the eta multiplier, Dedekind-sum reciprocity, eta quotients).
- **Layer 1** has cusp orders that are additive and independent of the representative. It lacks the geometric-order dictionary and the projective valence formula.
- **Layer 2** has polynomiality in every rank but nothing of the `p`-adic comparison.
- **Layers 4–7** have their main constructions:
  - **Layer 4:** primitive associates, existence and uniqueness.
  - **Layer 5:** strong multiplicity one across levels, under either a shared-character or an all-coprime-index hypothesis.
  - **Layer 6:** partial Atkin–Lehner transport.
  - **Layer 7:** the sharp abscissa for `k ≥ 2`.

  Each is missing one piece: the conductor, the prime-only character-free form, `|λ_Q| = 1` in general, and weight one.
- **Layers 8–10** are partial. Layer 8 has the cusp-integral lattice and the rational Hecke algebras, but no rational descent and no Galois-conjugate newforms. Layer 9 has Satake parameters, self-duality and primitive twists, but no inner twists or orbit separation. Layer 10 has the cusp and elliptic counts, divisor sheaves and the lattice uniformisation of elliptic curves, but no finiteness of `H¹` and no dimension formula.

## The frontier

- **Weight-one Eisenstein decomposition.** The weight-one series and a dimension bound are in place. What remains is showing they meet `S₁(N, χ)` trivially and span the constant-term image. The weight-one sharp abscissa in Layer 7 waits on this.
- **Cross-level strong multiplicity one, as stated.** Two versions are proved. One assumes the characters agree; the other compares coefficients at every index coprime to the levels. What remains is to use primes alone and drop the character hypothesis.
- **Finiteness of `H¹` and Riemann–Roch.** What remains is `dim H¹(X, 𝒪_D) < ∞`, then Riemann–Roch along the point-twist sequence, Serre duality, and a global automorphy line bundle for the dimension formulas.
- **The eta transformation law.** Not started and needs no other layer: the translation law, `ε(γ)` via Dedekind sums, reciprocity via the residue theorem, the Kronecker form and the eta-quotient criterion.
- **Galois-conjugate newforms.** Showing that each embedding of the coefficient field gives a unique conjugate newform opens the orbit-size statements of §8.2, the Galois-transport and orbit-separation parts of Layer 9, and the orbit letter of the newform label.

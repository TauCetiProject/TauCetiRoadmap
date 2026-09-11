<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"00381680ab2a0cb970acc235c613906f7811bffc","ts":"2026-09-11T15:17:25Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `0038168` (2026-09-11T15:17:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is complete, with the valence formula at level one and general finite index. The Hecke and old/new foundations are substantial, and the prime case of the ring-to-classical action is now identified, but Layers 2–4 and 6 remain partial; Layers 5, 8, 8G, 9 and 11, and the modular-curve and exact-dimension core of Layer 10, have not begun.

### Named results

- **The general-level valence formula** — for a nonzero form on a finite-index subgroup, the stabilizer-weighted interior orders and cusp-orbit orders have total degree `k·[SL₂(ℤ):Γ]/12`: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **The Γ₀(N) Hecke multiplication table** — without a coprimality hypothesis, `T_m T_n` is the divisor sum `∑_{d ∣ gcd(m,n)} d • (S_d T_{mn/d²})`: [`heckeTCompositeGamma0_mul_eq_sum_divisors_gcd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GL2/Gamma0/Diagonal/Composite.html#HeckeRing.GL2.heckeTCompositeGamma0_mul_eq_sum_divisors_gcd).
- **The old/new decomposition** — the Petersson-orthogonal old and new subspaces complement one another in `S_k(Γ₁(N))`, including after restriction to a character space: [`isCompl_cuspFormsOld_cuspFormsNew`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Basic.html#TauCeti.isCompl_cuspFormsOld_cuspFormsNew).
- **The prime Hecke-action identification** — on `M_k(N,χ)`, the Γ₀(N) Hecke-ring generator at every prime acts as the classical `T_p`: [`heckeRingHomCharSpace_heckeTGeneratorGamma0`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Prime.html#HeckeRing.GL2.heckeRingHomCharSpace_heckeTGeneratorGamma0).
- **The normalized Fricke square law** — on `M_k(Γ₁(N))`, `𝒲_N² = (-1)^k`, making `𝒲_N` involutive in even weight: [`normalizedFrickeOperator_normalizedFrickeOperator`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Fricke/Normalized.html#TauCeti.normalizedFrickeOperator_normalizedFrickeOperator).

### Notable definitions and infrastructure

- [`heckeRingHomCharSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.html#HeckeRing.GL2.heckeRingHomCharSpace) packages the Γ₀(N) Hecke ring as a ring of endomorphisms of `M_k(N,χ)`; the prime identification now connects part of this action to Fourier-coefficient formulas.
- A [`Newform`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Newform.html#HeckeRing.GL2.Newform) is now represented in the intended Miyake-style form: a normalized good Hecke eigenform in the new subspace. This records the notion but does not prove that such forms exist or are full eigenforms.
- The [`descendSlash`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Descent/Sum.html#TauCeti.descendSlash) family supplies the level-lowering sum used by the Main Lemma sieve; its equivariance and cusp conditions are available at every prime dividing the level.

### Roadmap coverage

Layer 0 has diamonds, character spaces, parity and the internal character decomposition, but not Eisenstein series with character. Layer 1 is done. Layer 2 has the abstract and Γ₀(N) Hecke rings, rank-two presentation, uniform classical `T_n`, the complete multiplication table and the character-space action; only prime generators are identified with the classical action, while composite indices, scalar cosets, general rank and the local–global hand-off remain. Layer 3 has the Petersson pairing, old/new complements and good-prime oldspace stability, but no adjoints, normality, simultaneous diagonalization, conductor-indexed oldspaces or newspace stability. Layer 4 now has bundled good eigenforms and newforms, their good-index eigenvalue laws, and more of the prime-by-prime descent sieve, but not the Main Lemma, newform existence and decomposition, conductor uniqueness or bad-prime classification. Layer 6 has raw exact-divisor Atkin–Lehner operators and the normalized Fricke operator, not the normalized exact-divisor family or newform signs. Layer 7 has the existing cusp-form continuation work but not the Euler product and completed functional equation. Only the finite-index Sturm preliminaries of Layer 10 are present; the remaining later layers listed above are untouched.

## The frontier

- **The classical `T_n` inside the ring action.** Extend the prime-generator identification to composite and prime-power Hecke elements, and prove that scalar cosets act by `χ(d)`.
- **The Atkin–Lehner Main Lemma.** Iterate the new coprime-filter descent and combine it with the established one-divisor support theorem to deduce that vanishing at every index coprime to `N` forces a form into the oldspace.
- **Petersson adjoints.** Prove `T_n* = ⟨n⟩⁻¹T_n` for `(n,N)=1`, then obtain normality and simultaneous diagonalization on each character space; this requires the operator identifications, not just the abstract ring law.
- **Bad-prime newspace stability.** Establish the separate trace and Fricke adjoint identities for the `p ‖ N`, `p² ∣ N` and `p ∣ cond χ` cases needed by the newform decomposition and bad-prime classification.
- **Normalized Atkin–Lehner theory.** Normalize `W_Q` for every exact divisor, prove the composition laws and newform eigenspace statements, and extract the signs used by the functional equation.

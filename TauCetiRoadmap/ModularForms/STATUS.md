<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"0430506817d8266776910e3757c3461d8c7408cc","ts":"2026-09-12T10:26:45Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `0430506` (2026-09-12T10:26:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1, the general-level valence formula, is complete. The Hecke, Petersson/newform, and Fricke–Atkin–Lehner layers now have substantial foundations, but the Main Lemma, adjoint and bad-prime theory, newform decomposition, and sign theorems remain partial; the coefficient-field, LMFDB, trace-formula, and modular-curve dimension summits have not begun.

### Named results

- **The general-level valence formula** — for a nonzero form on a finite-index subgroup, the stabilizer-weighted interior divisor and cusp-orbit orders have total degree `k·[SL₂(ℤ):Γ]/12`: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **The Γ₀(N) Hecke multiplication table** — for all `m,n`, the product `T_m T_n` is the divisor sum `∑_{d ∣ gcd(m,n)} d • (S_d T_{mn/d²})`: [`heckeTCompositeGamma0_mul_eq_sum_divisors_gcd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GL2/Gamma0/Diagonal/Composite.html#HeckeRing.GL2.heckeTCompositeGamma0_mul_eq_sum_divisors_gcd).
- **The old/new decomposition** — the Petersson-orthogonal old and new subspaces complement one another in `S_k(Γ₁(N))`, including within each character space: [`isCompl_cuspFormsOld_cuspFormsNew`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Basic.html#TauCeti.isCompl_cuspFormsOld_cuspFormsNew).
- **The prime Hecke comparison** — the prime generator of the Γ₀(N) Hecke ring acts on `M_k(N,χ)` as the classical `T_p`, for good and bad primes alike: [`heckeRingHomCharSpace_heckeTGeneratorGamma0`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Prime.html#HeckeRing.GL2.heckeRingHomCharSpace_heckeTGeneratorGamma0).
- **Miyake’s squarefree decomposition** — coefficient vanishing away from a squarefree `l` expresses a cusp form coefficientwise as a sum of degeneracy images indexed by primes dividing `l`: [`exists_qExpansion_coeff_eq_sum_primeFactors_of_squarefree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/SquarefreeDecomposition.html#TauCeti.exists_qExpansion_coeff_eq_sum_primeFactors_of_squarefree).

### Notable definitions and infrastructure

- [`heckeRingHomCharSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.html#HeckeRing.GL2.heckeRingHomCharSpace) makes the integral Γ₀(N) Hecke ring act on each nebentypus space; its prime and scalar generators are now identified with their classical actions.
- [`EigenformAwayFromLevel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Newform.html#HeckeRing.GL2.EigenformAwayFromLevel) and [`Newform`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Newform.html#HeckeRing.GL2.Newform) package the roadmap’s good-index eigenform and its normalized new-subspace refinement without pretending to contain bad-prime eigenvalue data.
- The exact-divisor [`Atkin–Lehner operator`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/Operator.html#TauCeti.Nat.IsExactDivisor.atkinLehnerOperatorCusp) supplies `W_Q` on cusp forms, independent of the chosen matrix and specializing at `Q=N` to the Fricke slash; its present normalization squares to `Q^{k-2}`.

### Roadmap coverage

Layer 0 has diamonds, character spaces, parity, and character decomposition, but not Eisenstein series with character; Layer 1 is done. Layer 2 has the abstract and Γ₀(N) rings, the uniform classical `T_n`, the full multiplication table, and the character-space action, now compared at prime and scalar generators; the composite and prime-power comparison, general-rank polynomial presentation, and local–global hand-off remain. Layer 3 has the Petersson product, character orthogonality, old/new complements, and good-prime oldspace stability, but not adjoints, normality, simultaneous diagonalization, conductor-indexed oldspaces, or bad-prime newspace stability. Layer 4 now has the good-eigenform and newform structures plus a sizeable conductor-descent and squarefree-sieve route, but not the global Main Lemma, newform decomposition, all-`T_n` upgrade, or bad-prime classification. Layer 6 has normalized Fricke theory and unnormalized exact-divisor operators, not the normalized family, its Hecke relations, or newform signs. Layer 7 has analytic continuation and convergence preliminaries, not the Euler product or one-form functional equation. Layers 5, 8, 8G, 9, and 11 remain essentially untouched; Layer 10 has the finite-index Sturm preliminary, not the modular curve or exact dimension formulas.

## The frontier

- **The Atkin–Lehner Main Lemma.** Assemble the factor dichotomy, character descent, and squarefree decomposition into the global statement that coefficient vanishing at every index coprime to `N` forces oldness.
- **The classical `T_n` inside the ring action.** Extend the prime and scalar comparisons to the composite and prime-power Hecke-ring elements so the multiplication table acts as the uniform classical operators.
- **Petersson adjoints.** Prove `T_n* = ⟨n⟩⁻¹T_n` at good indices, then obtain normality and simultaneous diagonalization on each character space.
- **Bad-prime newspace stability.** Establish the level-trace and Fricke adjoint identities in the separate `p ‖ N`, `p² ∣ N`, and `p ∣ cond χ` cases; this is required for the all-operator newform theorem and bad-prime eigenvalues.
- **Normalized Atkin–Lehner signs.** Normalize `W_Q` for general exact divisors, prove its relations with good Hecke operators, and derive the `±1` newform signs in the trivial-nebentypus case.

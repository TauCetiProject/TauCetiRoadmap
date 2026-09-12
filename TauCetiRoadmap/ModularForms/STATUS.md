<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"94050b6aee7bc349e209c85bf5e2cec3c49420a8","ts":"2026-09-11T22:46:43Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `94050b6` (2026-09-11T22:46:43Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 and 1 are complete but for Eisenstein series with character, and at primes the `Γ₀(N)` Hecke ring's action on a nebentypus space is now identified with the classical `Tₚ`. Layer 4 has its objects, a good Hecke eigenform and a newform, but neither the Main Lemma nor the conductor decomposition; Layer 3 still lacks the Petersson adjoints; Layers 5, 8, 8G, 9, 11 and the modular-curve core of Layer 10 have not begun.

### Named results

- **The general-level valence formula** — for a nonzero form on a finite-index subgroup, the interior divisor and cusp-orbit orders have total degree `k·[SL₂(ℤ):Γ]/12`: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **The Hecke ring acts by the classical `Tₚ`** — the prime generator of the integral `Γ₀(N)` Hecke ring acts on `M_k(N, χ)` as the classical `Tₚ`, so the ring and the operators are at last one object: [`heckeRingHomCharSpace_heckeTGeneratorGamma0`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Prime.html#HeckeRing.GL2.heckeRingHomCharSpace_heckeTGeneratorGamma0), at primes only; prime powers and composites are not yet matched.
- **The Γ₀(N) Hecke multiplication table** — `T_m · T_n = ∑_{d ∣ gcd(m,n)} d • (S_d · T_{mn/d²})`, with no coprimality hypothesis: [`heckeTCompositeGamma0_mul_eq_sum_divisors_gcd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GL2/Gamma0/Diagonal/Composite.html#HeckeRing.GL2.heckeTCompositeGamma0_mul_eq_sum_divisors_gcd).
- **The old/new decomposition** — the Petersson-orthogonal old and new subspaces are complementary in `S_k(Γ₁(N))`, and the splitting restricts to each character space: [`isCompl_cuspFormsOld_cuspFormsNew`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Basic.html#TauCeti.isCompl_cuspFormsOld_cuspFormsNew).
- **The Fricke involution** — in even weight the normalized `𝒲_N = (√N)^(2−k)·(· ∣[k] W)` is an involution of `M_k(Γ₁(N))` and of its cusp forms, with complementary `±1` eigenspaces: [`normalizedFrickeOperator_involutive`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Fricke/Normalized.html#TauCeti.normalizedFrickeOperator_involutive), [`isCompl_eigenspace_normalizedFrickeOperatorCusp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Fricke/Normalized.html#TauCeti.isCompl_eigenspace_normalizedFrickeOperatorCusp).

### Notable definitions and infrastructure

- [`Newform`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Newform.html#HeckeRing.GL2.Newform), a good Hecke eigenform in the new subspace with `a₁ = 1`, and the underlying [`EigenformAwayFromLevel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Newform.html#HeckeRing.GL2.EigenformAwayFromLevel), give Layers 4 and 5 the objects their theorems are about. The eigenvalue interface is already arithmetic: multiplicative at coprime good indices, with the prime-power recurrence and `λ_{p²} = λ_p² − χ(p)p^{k−1}`.
- [`descendCuspForm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Descent/CuspForm.html#TauCeti.descendCuspForm) sends a cusp form of level `Γ₁(N)` whose nebentypus is pulled back from `N/p` to one of level `Γ₁(N/p)`, by summing slashes over Miyake's family of matrices. It is the level-lowering engine the Main Lemma's sieve runs on.
- [`Nat.IsExactDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Data/Nat/ExactDivisor.html#TauCeti.Nat.IsExactDivisor) with its `∥` notation and [`atkinLehnerOperator`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/Operator.html#TauCeti.atkinLehnerOperator) open Layer 6's `W_Q` family for `Q ‖ N`, the Fricke operator being its top member.

### Roadmap coverage

Layers 0 and 1 are done apart from Eisenstein series with character. Layer 2 lacks only the composite and prime-power identifications with the classical `Tₙ`, the general-rank presentation and the local–global step. Layer 3 has the Petersson pairing and the old/new complements with their character refinement, plus good-prime stability of the oldspace, but no adjoints, normality or simultaneous diagonalization, and no conductor-indexed oldspace. Layer 4 has the eigenform and newform structures, the eigenvalue system, the level-lowering dichotomy, the one-divisor Atkin–Lehner step and the descent machinery, but not the Main Lemma, the conductor decomposition or the bad-prime classification. Layer 6 has the normalized Fricke involution and the raw `W_Q`, not the normalized `𝒲_Q` away from `Q = N` and not the newform signs. Layer 7 remains the continuation and the abscissa bound. Layer 5 is untouched but for one step toward it, eigenvalue agreement outside a finite set of good indices extending to every good index; Layers 8, 8G, 9 and 11, and the modular-curve and exact-dimension core of Layer 10, are untouched as well, with only the finite-index Sturm bound available there.

## The frontier

- **The composite `Tₙ` in the ring action.** Extend the prime identification to the prime-power and composite ring elements, and to `⟨d⟩` acting by `χ(d)`. The eigenform packaging is stated against those elements, so its eigenvalues are not yet known to be the classical `Tₙ`-eigenvalues.
- **The Atkin–Lehner Main Lemma.** Sieve from "`aₙ = 0` for every `n` coprime to `N`" down to support on the multiples of one divisor, where the one-divisor step takes over. The descent map and the one-prime filter are in hand; the induction chaining them is not, nor the existence half of the conductor decomposition.
- **Petersson adjoints.** Prove `Tₙ* = ⟨n⟩⁻¹Tₙ` for `(n, N) = 1`, then normality and simultaneous diagonalization on each character space. This is a statement about the operators, so it wants the composite identification first.
- **Bad-prime newspace stability.** Prove the trace and Fricke adjoint identities separately for `p ‖ N`, `p² ∣ N` and `p ∣ cond χ`; good-prime stability of the oldspace does not give this.
- **The Atkin–Lehner signs.** Normalize `W_Q` to an involution for every exact divisor, prove it commutes with the good `Tₙ`, and show it acts on a newform of trivial nebentypus by `±1`, the signs multiplying to the Fricke eigenvalue.

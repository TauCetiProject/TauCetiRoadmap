<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"787733ab7904b5650f41f0f62e3da361dd27b254","ts":"2026-09-14T06:53:21Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `787733a` (2026-09-14T06:53:21Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The valence formula of Layer 1 is complete, and the newform layers have reached their central theorems: the Atkin–Lehner Main Lemma, multiplicity one on the new part, and strong multiplicity one at fixed level and nebentypus. What remains partial is everything comparing forms across levels or looking at the primes dividing the level, together with the Petersson adjoint of `Tₙ`; the coefficient-field, LMFDB, trace-formula, and modular-curve summits have not begun.

### Named results

- **The Atkin–Lehner Main Lemma** — a cusp form in `S_k(Γ₁(N), χ)` whose Fourier coefficients vanish at every index coprime to `N` is old, and is a sum of prime degeneracy images from the levels `N / p`: [`mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/MainLemma.html#TauCeti.mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero). It is proved per nebentypus; the character-free statement is not established.
- **Strong multiplicity one, fixed level and nebentypus** — two newforms of the same level, weight and nebentypus whose eigenvalues agree at all but finitely many indices coprime to the level are equal: [`eq_of_forall_notMem_eigenvalue_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.html#HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq). The cross-level statement, needed for conductor uniqueness, is not here.
- **Multiplicity one on the new part** — two Hecke eigenvectors in the new part of `S_k(N, χ)` sharing their eigenvalues at every prime not dividing `N` are proportional: [`smul_eq_smul_of_forall_prime_heckeRingHomCusp_of_mem_cuspFormsNew`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/MultiplicityOne.html#HeckeRing.GL2.smul_eq_smul_of_forall_prime_heckeRingHomCusp_of_mem_cuspFormsNew).
- **The general-level valence formula** — the stabilizer-weighted interior orders and cusp-orbit orders of a nonzero finite-index modular form total `k·[SL₂(ℤ):Γ]/12`: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **The Γ₀(N) Hecke multiplication table** — `T_m T_n` is the divisor sum over `d ∣ gcd(m,n)`, with no coprimality hypothesis: [`heckeTCompositeGamma0_mul_eq_sum_divisors_gcd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GL2/Gamma0/Diagonal/Composite.html#HeckeRing.GL2.heckeTCompositeGamma0_mul_eq_sum_divisors_gcd).

### Notable definitions and infrastructure

- The normalized Atkin–Lehner operators exist at every exact divisor and form a [representation of the exact-divisor group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/Normalized.html#TauCeti.Nat.ExactDivisor.normalizedAtkinLehnerCuspRepresentation) on `S_k(Γ₀(N))`, those divisors forming a Boolean group isomorphic to the subsets of `N`'s prime factors.
- A [`Newform`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Newform.html#HeckeRing.GL2.Newform) packages a nonzero good Hecke eigenform in the newspace with `a₁ = 1`, whose `q`-expansion coefficients are its eigenvalues at good indices, multiplicative and obeying the good-prime recurrence.
- The Petersson pairing is independent of the fundamental domain and equals a single integral over a union of coset translates, and slashing has an adjoint through the [adjugate](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/SlashAdjugate.html#ModularForm.slash_adjugateGL) with no determinant factor, in a form that sums over the cosets a Hecke operator is built from.

### Roadmap coverage

Layer 0 has diamonds, character spaces, parity and their decomposition, but not Eisenstein series with character; Layer 1 is done. Layer 2 has both Hecke rings, uniform classical `T_n`, the full multiplication table, the character-space action with the prime generator identified as `Tₚ`, and the prime-power coefficient formula; the general-rank presentation and the local–global hand-off are untouched. Layer 3 has the pairing, character orthogonality, old/new complements and good-prime stability of the oldspace, but not the adjoint formula, normality, simultaneous diagonalization, the conductor-indexed oldspace, or bad-prime stability of the newspace. Layers 4 and 5 have the Main Lemma, multiplicity one, and fixed-space strong multiplicity one, but not the conductor decomposition, cross-level uniqueness, the all-`n` eigenform upgrade, the bad-prime eigenvalue classification, or the newforms as an orthogonal basis. Layer 6 has the normalized involutions at every exact divisor with their `±1` eigenspaces, not the signs of newforms or the pseudo-eigenvalues at general nebentypus. Layer 7 has only analytic continuation and abscissa bounds. Layers 8, 8G, 9, and 11 are untouched; Layer 10 has only its Sturm-bound preliminaries.

## The frontier

- **The Petersson adjoint of `Tₙ`.** The adjugate slash identities and the aggregate pairing over a union of translated domains are in place; what remains is `Tₙ* = ⟨n⟩⁻¹Tₙ` at good `n`, and after it normality, a simultaneous orthonormal eigenbasis, and the newforms as an orthogonal basis of the newspace.
- **The conductor and its primitive form.** Existence can now be assembled from the level-lowering dichotomy and the Main Lemma; uniqueness of the pair needs cross-level strong multiplicity one, which has not landed.
- **Bad-prime newform theory.** Stability of the newspace under `U_p`, the upgrade of a newform to an eigenform at every index, and the classification of `a_p` by the exponents of `p` in the level and in the conductor of the nebentypus; the `U_p` adjoint is the obstacle.
- **Atkin–Lehner signs.** With `𝒲_Q` normalized at every exact divisor, the missing step is that a newform of trivial nebentypus is an eigenvector with sign `ε_Q`, the signs multiplying to the Fricke sign; `𝒲_Q` is not yet known to commute with the good Hecke operators.
- **The Euler product and the functional equation.** The product needs the multiplicativity and prime-power recurrence packaged as a coefficient characterization; the signed functional equation needs the Fricke sign above.

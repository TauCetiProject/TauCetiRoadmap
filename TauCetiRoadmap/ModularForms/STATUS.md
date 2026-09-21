<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"a065bca531e7dd3e3b93965d9ff0ce8d0262cb9e","ts":"2026-09-17T20:09:27Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `a065bca` (2026-09-17T20:09:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1's general-level valence formula is complete, and the newform theory at fixed nebentypus has reached its classical summits: the Atkin–Lehner Main Lemma, multiplicity one and strong multiplicity one all hold on `S_k(N, χ)`. What stays partial needs the Petersson adjoint of `Tₙ` or the bad primes: normality, `Uₚ`-stability, the bad-prime eigenvalues, the conductor, the Atkin–Lehner signs. The coefficient-field, LMFDB, trace-formula and dimension-formula summits have not begun.

### Named results

- **The Atkin–Lehner Main Lemma** — a cusp form in `S_k(Γ₁(N), χ)` whose Fourier coefficients vanish at every index coprime to `N` is old, indeed a sum `∑_{p ∣ N} V_p f_p` of prime degeneracy images: [`mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/MainLemma.html#TauCeti.mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero). Stated per character space only.
- **Multiplicity one** — a simultaneous eigenspace of the good Hecke operators in the new part of `S_k(N, χ)` is a line once nonzero: [`finrank_cuspFormsNewEigenspace_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/MultiplicityOne.html#HeckeRing.GL2.finrank_cuspFormsNewEigenspace_eq_one).
- **Strong multiplicity one, fixed space** — two newforms of the same level, weight and nebentypus whose eigenvalues agree at all good indices outside a finite set are equal: [`Newform.eq_of_forall_notMem_eigenvalue_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.html#HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq). The cross-level version is not proved.
- **The general-level valence formula** — for a nonzero form on a finite-index subgroup, the stabilizer-weighted interior and cusp-orbit orders total `k·[SL₂(ℤ):Γ]/12`: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **The Γ₀(N) Hecke multiplication table** — `T_m T_n` is the divisor sum over `d ∣ gcd(m,n)`, with no coprimality assumed: [`heckeTCompositeGamma0_mul_eq_sum_divisors_gcd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GL2/Gamma0/Diagonal/Composite.html#HeckeRing.GL2.heckeTCompositeGamma0_mul_eq_sum_divisors_gcd).

### Notable definitions and infrastructure

- A [full Hecke eigenform](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Eigenform.html#HeckeRing.GL2.Eigenform) is now a type, carrying an eigenvalue at every positive index and built from the prime eigenrelations alone. A good eigenform upgrades to one only once the bad-prime scalars are handed in, and producing those for a newform is still owed.
- The [normalized Atkin–Lehner operator](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/Normalized.html#TauCeti.Nat.IsExactDivisor.normalizedAtkinLehnerOperator) exists for every exact divisor `Q ‖ N`, is an involution with complementary `±1` eigenspaces, obeys `𝒲_Q 𝒲_R = 𝒲_{QR/gcd(Q,R)²}`, and gives an action of the exact-divisor group, the family the sign theory needs.
- [Eisenstein series with character](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/Character.html#TauCeti.EisensteinSeries.charEisensteinSeriesMF) exist in weight `k ≥ 3`, proved to lie in `M_k(N, ψφ)` and to vanish unless the parity condition holds, built from a general weighted series matched to Mathlib's indexing. Their `q`-expansions are not computed, though the generalized Bernoulli numbers those need landed separately.

### Roadmap coverage

Layer 1 is done. Layer 0 has diamonds, character spaces, parity, the decomposition and the first Eisenstein series with character, but neither their `q`-expansions nor the cusp–Eisenstein decomposition. Layer 2 has both Hecke rings, uniform `T_n`, the multiplication table and the character-space action at primes and prime powers; the general-rank presentation and local–global hand-off remain. Layer 3 has the Petersson pairing, old/new complements, oldspace stability at good primes and slash-level adjoints, but not `Tₙ* = ⟨n⟩⁻¹Tₙ`, normality, simultaneous diagonalization or bad-prime newspace stability. Layers 4 and 5 are largely done at fixed nebentypus, leaving the bad-prime eigenvalues, the conductor, the orthogonal basis and cross-level strong multiplicity one. Layer 6 has the whole normalized `𝒲_Q` family, not the newform signs. Layer 7 has analytic continuation, the abscissa bounds and a newform's analytic rank and conductor, but not the Euler product or the signed functional equation. Layers 8, 8G, 9 and 11 are untouched; Layer 10 has only its Sturm-bound preliminaries.

## The frontier

- **The Petersson adjoint of `Tₙ`.** Slash-level adjoints `⟪f ∣[k] α, h⟫ = ⟪f, h ∣[k] α^ι⟫` are in place, aggregate forms over coset families included; running them over the Hecke coset decomposition should give `Tₙ* = χ(n)⁻¹Tₙ` at good `n`, hence normality and an orthonormal eigenbasis.
- **Bad-prime newform theory.** Prove that the newspace is stable under `Uₚ` for `p ∣ N`, which upgrades a newform to the full eigenform the type already supports, and then the Atkin–Lehner–Li classification of `a_p` by the `p`-adic valuations of `N` and of the conductor of `χ`, in its three separate cases.
- **The conductor and the primitive pair.** Assemble the Main Lemma with the level-lowering dichotomy into existence of a primitive pair `(M, g)`; uniqueness is blocked on cross-level strong multiplicity one, a different theorem from the fixed-space one now proved.
- **Atkin–Lehner signs and the functional-equation sign.** With `𝒲_Q` normalized for every exact divisor, what remains is `𝒲_Q f = ε_Q(f)·f` on newforms of trivial nebentypus, the signs multiplying to `ε_N`; that converts the two-form functional equation into the one-form statement with sign `i^k·ε_N`.
- **The Eisenstein subspace.** Compute the `q`-expansions of the series with character from the generalized Bernoulli numbers, add the raising parameter and prove spanning, giving `M_k(N, χ) = S_k(N, χ) ⊕ E_k(N, χ)`, which Layer 7's sharp non-cuspidal abscissa consumes.

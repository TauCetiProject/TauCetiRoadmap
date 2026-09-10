<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"b21862652ed4e0e0cb29351a0e78338370755d0a","ts":"2026-09-07T12:00:09Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `b218626` (2026-09-07T12:00:09Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is complete: the valence formula holds at level one and at general finite index. Layer 2 has the abstract Hecke ring, the full level-`N` multiplication table and a ring homomorphism onto each nebentypus space, but no bridge yet to the classical `T_n`. Layer 3 has the Petersson pairing and the old/new splitting without adjoints, Layer 4 has the first divisor-by-divisor step towards newforms, and Layers 5, 8, 9, 11 and the modular-curve core of Layer 10 have not begun.

### Named results

- **The general-level valence formula** — for a nonzero form on a finite-index subgroup, the stabilizer-weighted interior divisor and the cusp-orbit orders have total degree `k·[SL₂(ℤ):Γ]/12`: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **The Γ₀(N) Hecke multiplication table** — `T_m · T_n = ∑_{d ∣ gcd(m,n)} d • (S_d · T_{mn/d²})`, with no coprimality hypothesis: [`heckeTCompositeGamma0_mul_eq_sum_divisors_gcd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GL2/Gamma0/Diagonal/Composite.html#HeckeRing.GL2.heckeTCompositeGamma0_mul_eq_sum_divisors_gcd).
- **The level-one structure theorem** — `E₄` and `E₆` freely generate the graded ring of level-one modular forms: [`mvPolynomialEquivModularForms`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.html#TauCeti.ModularForm.mvPolynomialEquivModularForms).
- **The old/new decomposition** — the Petersson-orthogonal old and new subspaces are complementary in `S_k(Γ₁(N))`, and the splitting restricts to each character space: [`isCompl_cuspFormsOld_cuspFormsNew`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Basic.html#TauCeti.isCompl_cuspFormsOld_cuspFormsNew).
- **The Atkin–Lehner step at one divisor** — a cusp form in `S_k(N, χ)` whose `q`-expansion is supported on the multiples of a divisor `l ≠ 1` of `N` is old: [`mem_cuspFormsOld_of_qExpansionSupportedOnDvd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/AtkinLehner.html#TauCeti.mem_cuspFormsOld_of_qExpansionSupportedOnDvd).

### Notable definitions and infrastructure

- [`heckeRingHomCharSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.html#HeckeRing.GL2.heckeRingHomCharSpace) is the map `Φ_χ` the roadmap asks Layer 2 for: the integral `Γ₀(N)` Hecke ring acting on `M_k(N, χ)` by ring homomorphism, with a cusp-form counterpart. It is the shape Layer 4's eigenform packaging is stated against.
- The uniform operator [`heckeTNat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Operators.html#HeckeRing.GL2.heckeTNat) gives `T_n` for every positive `n` on `M_k(Γ₁(N))`, with `U_p` an alias rather than a separate operator, and `T_{p^r} = T_p^r` at `p ∣ N`.
- [`qSupportedOnDvdSubmodule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/QSupport.html#TauCeti.qSupportedOnDvdSubmodule), the cusp forms whose period-one `q`-expansion is supported on multiples of `d`, is the language the old subspace is now described in; the power-series condition behind it is exactly being a substitution `q ↦ q^d`.

### Roadmap coverage

Layer 0 has the diamonds, the character spaces as their joint eigenspaces, parity and the internal direct sum over characters; Eisenstein series with character are untouched. Layer 1 is done. Layer 2 has the abstract ring with its convolution product and commutativity, the rank-two polynomial presentation, the commutative `Γ₀(N)` ring, the uniform `T_n` with its prime coefficient recurrences, the complete multiplication table and now the character-space ring homomorphism; what is missing is the identification of the ring's elements with the classical `T_n` (including `⟨d⟩` acting by `χ(d)`), the general-rank presentation, and the local–global hand-off, for which uniqueness of the Smith normal form over `ℤ` has now landed. Layer 3 has the Petersson pairing, the old/new complements and good-prime stability of the oldspace, but no Hecke adjoints, normality, simultaneous diagonalization, conductor-indexed oldspaces or newspace stability. Layer 4 has the good-eigenform predicate, the level-lowering dichotomy and the one-divisor Atkin–Lehner step, not the Main Lemma itself, newforms, the conductor decomposition or the bad-prime classification. Layer 6 has the raw Fricke operator with its scalar-square law and inverse-character transport, not the normalized Atkin–Lehner operators or their signs. Layer 7 remains the continuation and abscissa bound. Layers 5, 8, 8G, 9 and 11, and the modular-curve and exact-dimension core of Layer 10, are untouched; only the finite-index Sturm bound is available from Layer 10's preliminaries.

## The frontier

- **The classical `T_n` inside the ring action.** Identify the images of the composite and prime-power Hecke-ring elements under `Φ_χ` with the uniform `T_n`, and the scalar cosets with `χ(d)`. Until this lands, the multiplication table and the `q`-expansion recurrences are facts about two unrelated objects.
- **The Atkin–Lehner Main Lemma.** Sieve from "`aₙ = 0` for every `n` coprime to `N`" down to support on the multiples of a single divisor, which is where the one-divisor step now takes over, and then assemble the existence half of the conductor-indexed newform decomposition.
- **Petersson adjoints.** Prove `T_n* = ⟨n⟩⁻¹T_n` for `(n, N) = 1`, then deduce normality and simultaneous diagonalization on each character space. This needs the previous item, the adjoint being a statement about the operators, not the ring.
- **Bad-prime newspace stability.** Prove the trace and Fricke adjoint identities separately in the `p ‖ N`, `p² ∣ N` and `p ∣ cond χ` cases; good-prime stability of the oldspace does not give this.
- **Normalized Atkin–Lehner theory.** Normalize the Fricke operator to an involution where appropriate, extend it to exact divisors, and prove the newform sign statements the one-form functional equation needs.

<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"6c7a660500e67d41015c572ed28dd47f8669ca68","ts":"2026-09-03T20:47:03+10:00"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `6c7a660` (2026-09-03T20:47:03+10:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is complete at both level one and general finite index with the valence formula. The diamond, Hecke, Petersson, old/new, and Fricke trunk is substantial but still lacks a multiplicative Hecke-ring action on character spaces, Hecke adjoints, and bad-prime newspace stability; eigenform and conductor work has begun, while Eisenstein theory, strong multiplicity one, coefficient fields, modular curves and exact dimension formulas, and the trace formula remain unbuilt.

### Named results

- **The general-level valence formula** — for a nonzero form on a finite-index subgroup, the stabilizer-weighted interior divisor and cusp-orbit orders have total degree `k·[SL₂(ℤ):Γ]/12`: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **The level-one structure theorem** — `E₄` and `E₆` freely generate the graded ring of level-one modular forms: [`mvPolynomialEquivModularForms`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.html#TauCeti.ModularForm.mvPolynomialEquivModularForms).
- **The nebentypus decomposition** — the level-`Γ₁(N)` modular-form space, and likewise its cusp-form space, is the internal direct sum of its character spaces: [`isInternal_modFormCharSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/CharacterDecomp.html#isInternal_modFormCharSpace).
- **The old/new decomposition** — the Petersson-orthogonal old and new subspaces are complementary in `S_k(Γ₁(N))`: [`isCompl_cuspFormsOld_cuspFormsNew`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Basic.html#TauCeti.isCompl_cuspFormsOld_cuspFormsNew).
- **Commutativity of the `Γ₀(N)` Hecke ring** — the Atkin–Lehner anti-involution fixes every double coset, making the Hecke ring commutative: [`commSemiringHeckeRingGamma0`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GL2/Gamma0/AtkinLehner.html#HeckeRing.GL2.commSemiringHeckeRingGamma0).

### Notable definitions and infrastructure

- The uniform operator [`heckeTNat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Operators.html#HeckeRing.GL2.heckeTNat) defines `T_n` for every positive `n`; at bad primes [`heckeUNat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/BadPrime.html#HeckeRing.GL2.heckeUNat) is only an alias, as required by the roadmap’s normalization.
- The Fricke isomorphism [`frickeCharCuspEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Fricke/CharacterSpace.html#TauCeti.frickeCharCuspEquiv) transports `S_k(N,χ)` to `S_k(N,χ⁻¹)`, providing the operator needed for the bad-prime adjoint and functional-equation routes.
- [`IsEigenformAwayFromLevel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Eigenform.html#HeckeRing.GL2.IsEigenformAwayFromLevel) records simultaneous eigenvector status only for indices coprime to the level, keeping the full-eigenform theorem separate.

### Roadmap coverage

Layer 0 has diamonds, character spaces, parity and character decomposition, but neither Eisenstein milestone. Layer 1 is done. Layer 2 has the abstract ring, rank-two local presentation, commutative `Γ₀(N)` ring, uniform `T_n`, prime coefficient formulas, level-supported multiplicativity and `U_p = T_p`; the character-space ring homomorphism, complete multiplication table, general-rank presentation and local–global hand-off remain partial. Layer 3 has the Petersson pairing and old/new complements, plus good-prime stability of the oldspace, but lacks Hecke adjoints, normality, simultaneous diagonalization, exact conductor-indexed oldspaces and newspace stability. Layer 4 has the good-eigenform predicate, coefficient filters and level-lowering dichotomy, not newforms, the Main Lemma, conductor decomposition or bad-prime classification. Layer 6 has the raw Fricke operator, its scalar-square law and inverse-character transport, but not normalized Atkin–Lehner operators or signs. Layer 7 remains limited to the previously established continuation and abscissa bound. Layer 5, Layers 8–9, the modular-curve and exact-dimension core of Layer 10, and Layer 11 are untouched; only the earlier finite-index Sturm bound is already available from Layer 10’s preliminary infrastructure.

## The frontier

- **Character-space Hecke action.** Prove that the linear extension of the `Γ₀(N)` Hecke ring acts multiplicatively on each nebentypus space, and connect its composite and prime-power elements to the uniform `T_n` operators.
- **Petersson adjoints.** Establish `T_n* = ⟨n⟩⁻¹T_n` for `(n,N)=1`, then deduce normality and simultaneous diagonalization on each character space.
- **Bad-prime newspace stability.** Prove the trace and Fricke adjoint identities in the separate `p ‖ N`, `p² ∣ N`, and `p ∣ cond χ` cases; oldspace stability alone does not imply this target.
- **The Atkin–Lehner Main Lemma.** Turn the coefficient filters and level-lowering dichotomy into the statement that a cusp form supported away from indices coprime to the level is old, then assemble the existence half of the conductor-indexed newform decomposition.
- **Normalized Atkin–Lehner theory.** Normalize the Fricke operator to an involution where appropriate, extend it to exact divisors, and prove the newform sign or pseudo-eigenvalue statements needed for the one-form functional equation.

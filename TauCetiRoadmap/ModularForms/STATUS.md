<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"37aec57229a4a5828884027165b25804aac01ac8","ts":"2026-09-12T13:50:33Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `37aec57` (2026-09-12T13:50:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-level valence formula of Layer 1 is complete. The Hecke, Petersson, newform, and Atkin–Lehner layers now have substantial working infrastructure—including the classical prime action, bundled newforms, squarefree descent, and normalized Fricke involutions—but their main adjoint, decomposition, multiplicity-one, and sign theorems remain partial; the coefficient-field, LMFDB, trace-formula, and modular-curve dimension-formula summits have not begun.

### Named results

- **The general-level valence formula** — the stabilizer-weighted interior orders and cusp-orbit orders of a nonzero finite-index modular form total `k·[SL₂(ℤ):Γ]/12`: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **The Γ₀(N) Hecke multiplication table** — `T_m T_n` is the divisor sum over `d ∣ gcd(m,n)`, with no coprimality hypothesis: [`heckeTCompositeGamma0_mul_eq_sum_divisors_gcd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GL2/Gamma0/Diagonal/Composite.html#HeckeRing.GL2.heckeTCompositeGamma0_mul_eq_sum_divisors_gcd).
- **The level-one structure theorem** — `E₄` and `E₆` freely generate the graded ring of level-one modular forms: [`mvPolynomialEquivModularForms`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.html#TauCeti.ModularForm.mvPolynomialEquivModularForms).
- **The old/new decomposition** — the Petersson-orthogonal old and new subspaces complement one another, including inside each nebentypus space: [`isCompl_cuspFormsOld_cuspFormsNew`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Basic.html#TauCeti.isCompl_cuspFormsOld_cuspFormsNew).
- **The normalized Fricke involution** — in even weight, normalized Fricke squares to the identity on cusp forms and splits the space into complementary `±1` eigenspaces: [`normalizedFrickeOperatorCusp_involutive`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Fricke/Normalized.html#TauCeti.normalizedFrickeOperatorCusp_involutive).

### Notable definitions and infrastructure

- The [`Γ₀(N)` Hecke-ring action on a character space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.html#HeckeRing.GL2.heckeRingHomCharSpace) now sends the prime generator to the classical `Tₚ`, connecting the ring multiplication theory to operators on forms at prime indices.
- A [`Newform`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Newform.html#HeckeRing.GL2.Newform) packages a nonzero good Hecke eigenform in the newspace with `a₁ = 1`; no full bad-prime eigenform theorem is built into it.
- An [`Atkin–Lehner matrix`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/Matrix.html#TauCeti.IsAtkinLehnerMatrix) and its operator are available for every exact divisor, providing the family on which normalization and newform signs can be developed.

### Roadmap coverage

Layer 0 has diamonds, character spaces, parity, and their decomposition, but not Eisenstein series with character; Layer 1 is done. Layer 2 has the abstract and `Γ₀(N)` Hecke rings, uniform classical `T_n`, coefficient recurrences, the full ring multiplication table, and the character-space action, with the prime and scalar generators identified; the remaining composite identification, general-rank presentation, and local–global hand-off are not established. Layer 3 has the Petersson pairing, character orthogonality, and old/new complements, but no Hecke adjoints, normality, simultaneous diagonalization, exact conductor-indexed oldspace, or bad-prime newspace stability. Layers 4–5 now have good eigenforms, newforms, eigenvalue recurrences, finite-exception eigenvalue extension, descent, and the squarefree decomposition, but not the Main Lemma, conductor decomposition, full eigenforms, or either form of strong multiplicity one. Layer 6 has normalized Fricke theory and raw exact-divisor Atkin–Lehner operators, not general normalization or newform signs. Layer 7 has analytic continuation and existing abscissa bounds, but not the Euler product or one-form signed functional equation. Layers 8, 8G, 9, and 11 are untouched; Layer 10 has only its Sturm-bound preliminaries, not the modular curve or exact dimension formulas.

## The frontier

- **The Atkin–Lehner Main Lemma.** Assemble the coprime filters, prime-by-prime descent, factor dichotomy, and squarefree decomposition into the global statement that vanishing at every index coprime to `N` forces oldness.
- **Petersson adjoints.** Prove `T_n* = ⟨n⟩⁻¹T_n` at good indices, then obtain normality and simultaneous diagonalization on each character space.
- **The full classical Hecke action.** Extend the prime-generator comparison to composite and prime-power Hecke-ring elements, keeping the scalar normalization explicit.
- **Bad-prime newform theory.** Establish newspace stability under `U_p`, upgrade newforms to full eigenforms, and prove the bad-prime eigenvalue classification.
- **Multiplicity one and conductor uniqueness.** Prove equality of newforms, not merely equality of their good eigenvalues, first in a fixed character space and then across levels; the latter is needed for uniqueness of the primitive pair.

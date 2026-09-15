<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"6f7de9441c7ff58f4eabab53205f18b79725bfb4","ts":"2026-09-14T22:02:57Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `6f7de94` (2026-09-14T22:02:57Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The valence formula at general level is complete, and the newform layer has now reached its two summit theorems: the Atkin–Lehner Main Lemma at fixed nebentypus, and multiplicity one together with strong multiplicity one at fixed level and nebentypus. What remains partial is the Petersson adjoint calculus, bad-prime newform theory, Atkin–Lehner sign theory, and the L-function; the coefficient field, the LMFDB invariants, the modular curve with its dimension formulas, and the trace formula have not begun.

### Named results

- **The general-level valence formula** — the stabilizer-weighted interior orders and cusp-orbit orders of a nonzero finite-index modular form total `k·[SL₂(ℤ):Γ]/12`: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **The Atkin–Lehner Main Lemma** — a cusp form in `S_k(Γ₁(N), χ)` whose Fourier coefficients vanish at every index coprime to `N` lies in the old subspace: [`mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/MainLemma.html#TauCeti.mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero).
- **Multiplicity one** — a simultaneous eigenspace of the good Hecke operators inside the new part of `S_k(N, χ)` is a line once it contains a nonzero form: [`finrank_cuspFormsNewEigenspace_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/MultiplicityOne.html#HeckeRing.GL2.finrank_cuspFormsNewEigenspace_eq_one).
- **Strong multiplicity one, at fixed level and nebentypus** — two newforms of the same level, weight and character whose eigenvalues agree at all but finitely many indices coprime to `N` are equal: [`eq_of_forall_notMem_eigenvalue_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.html#HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq). The cross-level statement is not proved.
- **The old/new decomposition** — the Petersson-orthogonal old and new subspaces complement one another, including inside each nebentypus space: [`isCompl_cuspFormsOld_cuspFormsNew`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Basic.html#TauCeti.isCompl_cuspFormsOld_cuspFormsNew).

### Notable definitions and infrastructure

- The [`Γ₀(N)` Hecke-ring action on a character space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.html#HeckeRing.GL2.heckeRingHomCharSpace), whose prime generator is the classical `Tₚ`, is what makes eigenform statements about the ring and about operators on forms interchangeable; a nonzero form eigen at every good prime is now automatically a [good Hecke eigenform](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/EigenFromPrimes.html#HeckeRing.GL2.EigenformAwayFromLevel.ofForallPrime) at every good index.
- A [`Newform`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Newform.html#HeckeRing.GL2.Newform) packages a nonzero good Hecke eigenform in the newspace with `a₁ = 1`, so its Fourier coefficients are its eigenvalues; it carries no bad-prime eigenform property.
- The [exact divisors of `N` as a Boolean group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Data/Nat/ExactDivisor.html#TauCeti.Nat.ExactDivisor.primeFactorsEquiv), isomorphic to the subsets of `N.primeFactors`, on which the normalized Atkin–Lehner operators form a [representation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/Normalized.html#TauCeti.Nat.ExactDivisor.normalizedAtkinLehnerRepresentation) on `M_k(Γ₀(N))`. This is the group structure the sign theory of Layer 6 will be stated over.

### Roadmap coverage

Layer 1 is done. Layer 0 has the diamond operators, character spaces, parity and the character decomposition, but not Eisenstein series with character. Layer 2 has the abstract and `Γ₀(N)` Hecke rings, the uniform classical `Tₙ`, the full multiplication table and the character-space action with the prime and scalar generators identified; identification at composite and prime-power ring elements, the general-rank presentation, and the local–global hand-off are not established. Layer 3 has the Petersson pairing, character orthogonality, old/new complements, good-prime stability of the oldspace, and the slash-level adjoint identities, but not the Hecke adjoint `Tₙ* = ⟨n⟩⁻¹Tₙ`, normality, simultaneous diagonalization, or bad-prime newspace stability. Layer 4A is essentially closed by the Main Lemma; Layer 5 has the fixed-space theorems but not the cross-level version, so Layer 4B (the conductor) is still open, as is the bad-prime eigenvalue classification. Layer 6 has normalized Fricke, normalized `𝒲_Q` and the exact-divisor representation, but no newform signs. Layer 7 has analytic continuation and abscissa bounds, not the Euler product or the signed functional equation. Layers 8, 8W, 8G, 9 and 11 are untouched; Layer 10 has only its Sturm-bound preliminaries.

## The frontier

- **The Petersson adjoint.** Prove `Tₙ* = ⟨n⟩⁻¹Tₙ` at indices coprime to the level, then normality and simultaneous diagonalization on each character space. The slash-level adjoints and the fundamental-domain tiling are in place; what is missing is assembling them over a coset decomposition of the `Tₙ` double coset.
- **Cross-level strong multiplicity one, and the conductor.** Extend equality of newforms to newforms of different levels; this is the input Layer 4B needs for uniqueness of the primitive pair.
- **Bad-prime newform theory.** Establish stability of the newspace under `Uₚ` for `p ∣ N`, upgrade a newform to an eigenform at every index, and prove the bad-prime eigenvalue classification. The existing stability result covers the old subspace at good primes only.
- **Atkin–Lehner signs and the Euler product.** With `𝒲_Q` now a group representation, the remaining Layer 6 content is the action on newforms and the sign; Layer 7's Euler product and signed functional equation then follow from the eigenvalue multiplicativity already available.
- **The modular curve and the dimension formulas.** Layer 10 has not started beyond the Sturm bound; its hardest input is finiteness of `H¹` on `X(Γ)`, which the lower bounds go through. Layers 8, 8G, 9 and 11 have not begun.

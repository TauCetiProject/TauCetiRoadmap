<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Eisenstein spanning, the cusp–Eisenstein decomposition, and the q-expansion of j","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"General-rank polynomial presentation and local–global hand-off","state":"partial"},{"id":"Layer 3","remaining":"Bad-prime newspace stability outside the p² | N case and exact conductor-indexed oldspace","state":"partial"},{"id":"Layer 4","remaining":"The p ‖ N and p | cond χ eigenvalue cases and uniqueness of the primitive pair","state":"partial"},{"id":"Layer 5","remaining":"Cross-level strong multiplicity one and the full coefficient characterization","state":"partial"},{"id":"Layer 6","remaining":"General-nebentypus pseudo-eigenvalues","state":"partial"},{"id":"Layer 7","remaining":"Sharp noncuspidal abscissa and signs beyond trivial nebentypus","state":"partial"},{"id":"Layer 8","remaining":"General Hecke commutativity on symbols, the period map and its injectivity, and the coefficient field","state":"partial"},{"id":"Layer 8G","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"Analytic curve, Riemann–Roch input, and dimension formulas","state":"partial"},{"id":"Layer 11","remaining":"Remaining trace contributions and the final trace formula","state":"partial"}],"readme_sha":"bb3746a7dddf744322d72c8db49aa099944bd0e02d6fa39e598dcfca70e10d2c","roadmap":"ModularForms","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-level valence formula is proved. Newform spanning and the good-prime spectral theory are in place, and newforms are now full Hecke eigenforms with an Euler product. The conductor, the rest of the bad-prime theory, Eisenstein spanning and the trace formula are partial. Modular symbols have begun, but the Galois and LMFDB layers have not.

### Named results

- **The general-level valence formula**: on a finite-index subgroup, the stabilizer-weighted interior and cusp orders of a nonzero form sum to `k[SL₂(ℤ):Γ]/12` ([`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex)).
- **Newform spanning**: every cusp form on `Γ₁(N)` is a combination of level-raised newforms from divisor levels ([`span_levelRaise_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Decomposition.html#HeckeRing.GL2.Newform.span_levelRaise_eq_top)).
- **The Atkin–Lehner–Li theorem**: at each prime `p ∣ N`, a newform is a `Uₚ`-eigenvector with eigenvalue `aₚ`, so it is an eigenform of every `Tₙ` ([`heckeUCuspNat_eq_qExpansion_coeff_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/FullEigenform.html#HeckeRing.GL2.Newform.heckeUCuspNat_eq_qExpansion_coeff_smul)).
- **The newform Euler product**: for `Re s > k/2 + 1`, `L(s,f) = ∏ₚ (1 − aₚp^{−s} + χ(p)p^{k−1−2s})^{−1}`, with `χ` extended by zero ([`L_eulerProduct`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LFunction/EulerProduct.html#HeckeRing.GL2.Newform.L_eulerProduct)).
- **Hecke's signed functional equation**: a trivial-nebentypus newform satisfies `Λ_N(k−s,f) = i^k ε_N(f) Λ_N(s,f)` ([`frickeCompletedL_sub_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LFunction/Sign.html#HeckeRing.GL2.Newform.frickeCompletedL_sub_eq)).

### Notable definitions and infrastructure

- The [module of modular symbols](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Basic.html#TauCeti.ModularSymbols) is finitely generated. Its [integral Hecke algebra](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Hecke/Finite.html#TauCeti.ModularSymbols.heckeTAlgebra_finite) is a finite `ℤ`-module. Together these give the integral side of the route to coefficient fields.
- The [Petersson adjoint formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Petersson/Normal.html#HeckeRing.GL2.isAdjointPair_heckeTCuspNat) `Tₙ* = ⟨n⟩⁻¹Tₙ` holds for `n` coprime to the level, and it gives a simultaneous orthonormal eigenbasis in each nebentypus space.
- Popa–Zagier's [trace reduction](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LevelOne/TraceFormula/TraceReduction.html#TauCeti.TraceFormulaMatrixModule.ExchangeRelations.trace_periodActionRestrict_eq_trace) moves traces on period polynomials to traces on binary forms. It is the route to the level-one trace formula.

### Roadmap coverage

Layer 1 is done.

Layer 0 has:
- the diamond operators and character spaces;
- the `j` inputs, with orders at `ρ` and `i`, but not `j`'s `q`-expansion;
- a defined Eisenstein subspace, but no proof that it spans or of the cusp–Eisenstein splitting.

Layer 2 lacks the general-rank polynomial presentation.

Layers 3–5 have the good-prime adjoints, the newform basis, spanning, and fixed-level strong multiplicity one. `Uₚ`-eigenvalues are proved at bad primes. What is missing:
- newspace stability and `aₚ` vanishing only in the case `p² ∣ N` with character modulo `N/p`;
- the other valuation cases;
- the exact conductor-indexed oldspace;
- cross-level strong multiplicity one, which the uniqueness of the primitive pair needs.

Layer 6 has the trivial-nebentypus signs but not general pseudo-eigenvalues. Layer 7 has the signed equation, the Euler product, and analytic rank and conductor. It lacks the sharp non-cuspidal abscissa and signs beyond trivial character.

Layer 8 is partial: it has symbols, Manin symbols, the Hecke action and integral finiteness. It lacks the period map, its injectivity, and coefficient fields. Layers 8G and 9 are untouched.

Layer 10 has Sturm-bound preliminaries but not the curve or the dimension formulas. Layer 11 has period-polynomial machinery and some trace contributions, but not the formula.

## The frontier

- **The remaining bad-prime cases.** Prove the `p ‖ N` and `p ∣ cond χ` cases of the `aₚ` classification. The `p² ∣ N` vanishing case alone is now proved.
- **Cross-level strong multiplicity one.** Compare newforms of unrelated levels `N`, `M`. This settles the uniqueness of the primitive pair. So far only the level is pinned along a divisor chain.
- **The period map.** Pair cusp forms with modular symbols and prove injectivity by the Eichler-integral route. General Hecke commutativity on symbols is also still missing, and the transfer to the form side needs it.
- **The Eisenstein decomposition.** Show that the defined Eisenstein subspace is a complement to the cusp forms in `M_k(N, χ)`.
- **The level-one trace formula.** Evaluate the remaining upper-triangular contributions and assemble them against the Hurwitz class-number sum.

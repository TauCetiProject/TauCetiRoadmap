<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2","ts":"2026-09-26T20:53:39+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Eisenstein spanning and the cusp–Eisenstein decomposition","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"General-rank polynomial presentation and local–global hand-off","state":"partial"},{"id":"Layer 3","remaining":"Bad-prime newspace stability and exact conductor-indexed oldspace","state":"partial"},{"id":"Layer 4","remaining":"Bad-prime eigenvalues and existence and uniqueness of the primitive pair","state":"partial"},{"id":"Layer 5","remaining":"Cross-level strong multiplicity one and the full coefficient characterization","state":"partial"},{"id":"Layer 6","remaining":"General-nebentypus pseudo-eigenvalues","state":"partial"},{"id":"Layer 7","remaining":"Newform Euler product and sharp noncuspidal abscissa","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 8G","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"Analytic curve, Riemann–Roch input, and dimension formulas","state":"partial"},{"id":"Layer 11","remaining":"Period-polynomial trace comparison and final trace formula","state":"partial"}],"readme_sha":"bb3746a7dddf744322d72c8db49aa099944bd0e02d6fa39e598dcfca70e10d2c","roadmap":"ModularForms","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `759eb3e` (2026-09-26T20:53:39+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-level valence formula is complete. Newform spanning, the good-Hecke spectral theory, and the signed functional equation for trivial nebentypus have landed; the conductor, bad-prime theory, Eisenstein decomposition, and trace formula remain partial. The coefficient-field, Galois, and LMFDB layers have not begun.

### Named results

- **The general-level valence formula** — stabilizer-weighted interior and cusp orders of a nonzero form total `k[SL₂(ℤ):Γ]/12` on a finite-index subgroup: [`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex).
- **Newform spanning** — every cusp form on `Γ₁(N)` is a linear combination of degeneracy images of newforms at divisor levels: [`span_levelRaise_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Decomposition.html#HeckeRing.GL2.Newform.span_levelRaise_eq_top).
- **The Petersson adjoint formula** — for `n` coprime to the level, the adjoint of `Tₙ` is `⟨n⟩⁻¹Tₙ`: [`isAdjointPair_heckeTCuspNat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Petersson/Normal.html#HeckeRing.GL2.isAdjointPair_heckeTCuspNat).
- **Atkin–Lehner sign multiplication** — for a trivial-nebentypus newform, the signs at the maximal prime-power exact divisors multiply to its Fricke sign: [`prod_atkinLehnerSign_primePow_eq_frickeSign`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/Sign.html#HeckeRing.GL2.Newform.prod_atkinLehnerSign_primePow_eq_frickeSign).
- **Hecke’s signed functional equation** — a trivial-nebentypus newform satisfies `Λ_N(k−s,f)=i^k ε_N(f)Λ_N(s,f)`: [`frickeCompletedL_sub_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LFunction/Sign.html#HeckeRing.GL2.Newform.frickeCompletedL_sub_eq).

### Notable definitions and infrastructure

- The [Fourier coefficient formula for character Eisenstein series](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/QExpansion.html#TauCeti.EisensteinSeries.qExpansion_charEisensteinSeriesMF_coeff) makes their expansion explicit, including the constant term; spanning the Eisenstein subspace is still open.
- [Popa–Zagier’s explicit Hecke element](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LevelOne/TraceFormula/ExplicitElement.html#TauCeti.TraceFormulaMatrixModule.popaZagierElement) supplies a concrete matrix-module operator for the period-polynomial route to the level-one trace formula.

### Roadmap coverage

Layer 1 is done. Layers 0 and 2 are partial: character spaces and Eisenstein expansions exist without Eisenstein spanning, while the classical Hecke action and multiplication table precede the general-rank presentation. Layers 3–5 have good-prime adjoints, an orthonormal eigenbasis, a newform basis and spanning by level raises; bad-prime newspace stability, bad-prime eigenvalues and cross-level uniqueness remain. Layer 6 has the signs for trivial nebentypus, while the general-character pseudo-eigenvalue theory is open. Layer 7 has the signed equation in the trivial-character case, but only an abstract recurrence-based Euler product, not its newform specialization. Layers 8, 8G and 9 are untouched. Layer 10 has Sturm-bound preliminaries without the curve and dimension formulas. Layer 11 has class numbers and period-polynomial machinery without the trace formula.

## The frontier

- **Bad-prime newforms.** Prove `Uₚ` preserves the newspace for `p ∣ N`, then establish the three valuation cases for its eigenvalue; oldspace stability alone does not give this.
- **The primitive pair.** Upgrade the divisor-level eigensystem match to the conductor-indexed oldspace statement and prove uniqueness using newform–newform cross-level strong multiplicity one.
- **The Eisenstein decomposition.** Prove that the raised character Eisenstein series span the Eisenstein subspace, then split modular forms into cusp and Eisenstein parts.
- **The newform Euler product.** Apply the abstract recurrence-based product to newform coefficients with the nebentypus zero-extended at bad primes; the supplied declarations establish the abstract product only.
- **The level-one trace formula.** Connect the explicit matrix element’s period-polynomial action to the trace and Hurwitz class-number terms; the final identity has not landed.

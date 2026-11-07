<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f","ts":"2026-11-07T17:18:46+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Weight-two Eisenstein lower bound beyond squarefree Γ₀(N), and the weight-one Eisenstein series and decomposition","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"The local–global hand-off: comparison with the p-adic double-coset ring, and inverting T(p,…,p)","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"The p ‖ N and p | cond χ eigenvalue cases and uniqueness of the primitive pair","state":"partial"},{"id":"Layer 5","remaining":"Cross-level strong multiplicity one for newforms at unrelated levels","state":"partial"},{"id":"Layer 6","remaining":"|λ_Q| = 1 for general nebentypus: equal Petersson norms of f and its transported newform","state":"partial"},{"id":"Layer 7","remaining":"Sharp noncuspidal abscissa in weights one and two, and signs beyond trivial nebentypus","state":"partial"},{"id":"Layer 8","remaining":"Weight one (sublayer 8W) and Hecke commutativity on symbols at general indices","state":"partial"},{"id":"Layer 8G","remaining":"The Q(χ)-structure of the newspace Hecke algebra, conjugate newforms f^σ and orbit sizes, and rationality of characteristic polynomials","state":"partial"},{"id":"Layer 9","remaining":"Rational characteristic polynomials, newform Galois orbits, inner twists, Galois-group certificates, self-duality and newform labels","state":"partial"},{"id":"Layer 10","remaining":"Finiteness of H¹(𝒪_D), Riemann–Roch, Serre duality, the analytic genus comparison, and the dimension formulas","state":"partial"},{"id":"Layer 11","remaining":"Hurwitz class numbers, the elliptic and remaining hyperbolic contributions, and the Hecke-equivariant transfer to cusp forms","state":"partial"}],"readme_sha":"d99fb41c43ae15ffb7f5aec03fd2c91f3b56d8671c5594224bff3289f390ee3d","roadmap":"ModularForms","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `c9dbc67` (2026-11-07T17:18:46+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-level valence formula and the old/new theory are done. Newforms are full eigenforms with number-field coefficients in weight `≥ 2`, and the cusp–Eisenstein decomposition holds at every level in weight `≥ 3`. Weights one and two, Atkin–Li unimodularity, Galois stability, the LMFDB invariants, Riemann–Roch and the trace formula are partial. Weight-one integrality has not begun.

### Named results

- **The general-level valence formula** — on a finite-index subgroup, the stabilizer-weighted interior and cusp orders of a nonzero form sum to `k[SL₂(ℤ):Γ]/12` ([`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex)).
- **The Atkin–Lehner–Li theorem** — at each prime `p ∣ N` a newform is a `Uₚ`-eigenvector with eigenvalue `aₚ`, so it is an eigenform of every `Tₙ` ([`heckeUCuspNat_eq_qExpansion_coeff_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/FullEigenform.html#HeckeRing.GL2.Newform.heckeUCuspNat_eq_qExpansion_coeff_smul)).
- **The coefficient field is a number field** — for a newform of weight `k ≥ 2`, `ℚ(aₙ : n)` is a number field, because the integral Hecke algebra is a finite `ℤ`-module ([`numberField_CoefficientField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/NumberField.html#TauCeti.numberField_CoefficientField)).
- **The cusp–Eisenstein decomposition** — in weight `k ≥ 3`, the Eisenstein series of nebentypus `χ` span a complement of `S_k(N, χ)` in `M_k(N, χ)` (Diamond–Shurman 4.5.2; [`isCompl_eisensteinSubspace_range_cuspToModFormCharSpace`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/Dimension.html#TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace)). The earlier exclusion of levels `1`, `2` and `4` is gone (TauCeti#20737), and the decomposition also holds on [any group containing `Γ(N)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/Congruence.html#TauCeti.EisensteinSeries.isCompl_congruenceEisensteinSubspace_cuspFormSubmodule).
- **Shimura's Theorem 3.20** — for a prime `p`, the `p`-local Hecke ring of `GL_n` is the polynomial ring on the `n` diagonal prime cosets ([`polynomialRingEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Presentation.html#HeckeRing.GLn.polynomialRingEquiv)).

### Notable definitions and infrastructure

- The [module of modular symbols](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Basic.html#TauCeti.ModularSymbols) and the Hecke-equivariant [period map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Period/Map.html#TauCeti.ModularSymbols.periodMap), which is injective in weight `≥ 2`. They supply the integral structure behind the number-field theorem.
- The [sheaf `𝒪_D` of a divisor](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/Sheaf.html#TauCeti.RiemannSurface.divisorSheaf) on a Riemann surface and its [point-twist sequence](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/PointTwist.html#TauCeti.RiemannSurface.pointTwistSequence_shortExact) `0 → 𝒪_D → 𝒪_{D+x} → ℂ_x → 0`. Riemann–Roch is to be proved by induction along this sequence.
- The Atkin–Li [pseudo-eigenvalue `λ_Q(f)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/PseudoEigenvalue.html#HeckeRing.GL2.Newform.atkinLehnerPseudoEigenvalue), defined by `𝒲_Q f = λ_Q(f)·g` at every exact divisor `Q`, with its product law.

### Roadmap coverage

- **Done.** Layers 1 and 3.
- **Layer 0** is done in weight `≥ 3`. Weights two and one have upper bounds on the Eisenstein part (cusps minus one; half the cusps), but equality only on `Γ₀(N)` at squarefree level in weight two.
- **Layer 2** lacks only its two hand-off milestones, the `p`-adic comparison and inverting `T(p, …, p)`.
- **Layers 4–5** have the newform basis, fixed-level strong multiplicity one and the coefficient characterization. They lack the `p ‖ N` and `p ∣ cond χ` cases, cross-level strong multiplicity one, and uniqueness of the primitive pair.
- **Layer 6** proves `|λ_Q| = 1` only when the nebentypus is trivial at `Q` or away from `Q`.
- **Layer 7** has the sharp abscissa only in weight `≥ 3`, and signs only for trivial character.
- **Layer 8** is done in weight `≥ 2` except Hecke commutativity on symbols at general indices; weight one (8W) has not begun.
- **Layers 8G and 9** have the character field, the complex Hecke correspondence, integral characteristic polynomials, Satake parameters, and Conrey and Galois-orbit labels of characters. They lack the `ℚ(χ)`-structure and what builds on it.
- **Layer 10** has the Sturm bound, cusp and elliptic counts, the degree of `X₀(N) → X(1)`, divisor sheaves, `H¹(𝒪) = 0` on discs, canonical divisors and local automorphy frames. It has no finiteness of `H¹`, no Riemann–Roch and no dimension formula.
- **Layer 11** has the period-polynomial machinery, Popa–Zagier's coset identity and the split conjugacy-class count, but no Hurwitz class numbers and no assembled formula.

## The frontier

- **Unimodularity of `λ_Q`.** For general nebentypus, show `f` and its transported newform `g` have equal Petersson norm; that is all `|λ_Q(f)| = 1` still needs.
- **Low-weight Eisenstein series.** Construct weight-two series at every level, and weight-one series, matching the new upper bounds; the Weierstrass `ζ` function is in place for this. The sharp abscissa in weights one and two waits on it.
- **Finiteness of `H¹(X, 𝒪_D)`.** Bergman spaces with compact restriction and Schwartz's lemma are in place; the Čech `L²` argument is not. Riemann–Roch and the dimension formulas wait on this.
- **Galois stability.** Give the newspace Hecke algebra its `ℚ(χ)`-structure and define `f^σ`; orbit sizes and rational characteristic polynomials follow for Layer 9.
- **The level-one trace formula.** Define Hurwitz class numbers, evaluate the elliptic and remaining hyperbolic contributions, and make the period-polynomial isomorphism Hecke-equivariant.

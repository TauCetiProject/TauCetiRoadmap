<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4","ts":"2026-10-25T09:09:58Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Cusp–Eisenstein decomposition in weight two beyond squarefree Γ₀(N), in weight one, and at levels 2 and 4","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"General-rank polynomial presentation and local–global hand-off","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"The p ‖ N and p | cond χ eigenvalue cases and uniqueness of the primitive pair","state":"partial"},{"id":"Layer 5","remaining":"Cross-level strong multiplicity one for newforms at unrelated levels","state":"partial"},{"id":"Layer 6","remaining":"|λ_Q| = 1 for general nebentypus: equal Petersson norms of f and its transported newform","state":"partial"},{"id":"Layer 7","remaining":"Sharp noncuspidal abscissa in weights one and two, and signs beyond trivial nebentypus","state":"partial"},{"id":"Layer 8","remaining":"Weight one (sublayer 8W) and Hecke commutativity on symbols at general indices","state":"partial"},{"id":"Layer 8G","remaining":"The Q(χ)-structure of the newspace Hecke algebra, conjugate newforms f^σ and orbit sizes, and rationality of characteristic polynomials","state":"partial"},{"id":"Layer 9","remaining":"Rational characteristic polynomials, Galois orbits, inner twists, Galois-group certificates, self-duality and labels","state":"partial"},{"id":"Layer 10","remaining":"Riemann–Roch input, the analytic genus comparison, and the dimension formulas","state":"partial"},{"id":"Layer 11","remaining":"Hurwitz class numbers, the elliptic, hyperbolic and parabolic contributions, and the Hecke-equivariant transfer to cusp forms","state":"partial"}],"readme_sha":"d99fb41c43ae15ffb7f5aec03fd2c91f3b56d8671c5594224bff3289f390ee3d","roadmap":"ModularForms","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `d96e9ce` (2026-10-25T09:09:58Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-level valence formula and the old/new theory of `S_k(N, χ)` are done. Newforms are full Hecke eigenforms with an Euler product, and in weight at least two their coefficient fields are number fields. The cusp–Eisenstein decomposition now holds in weight `k ≥ 3`. Weight one and weight two in general, Atkin–Li unimodularity, Galois stability, the LMFDB invariants, the dimension formulas and the trace formula are partial. The weight-one integrality argument has not begun.

### Named results

- **The general-level valence formula** — on a finite-index subgroup, the stabilizer-weighted interior and cusp orders of a nonzero form sum to `k[SL₂(ℤ):Γ]/12` ([`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex)).
- **The Atkin–Lehner–Li theorem** — at each prime `p ∣ N` a newform is a `Uₚ`-eigenvector with eigenvalue `aₚ`, so it is an eigenform of every `Tₙ` ([`heckeUCuspNat_eq_qExpansion_coeff_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/FullEigenform.html#HeckeRing.GL2.Newform.heckeUCuspNat_eq_qExpansion_coeff_smul)).
- **The newform Euler product** — for `Re s > k/2 + 1`, `L(s,f) = ∏ₚ (1 − aₚp^{−s} + χ(p)p^{k−1−2s})^{−1}`, with `χ` extended by zero ([`L_eulerProduct`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LFunction/EulerProduct.html#HeckeRing.GL2.Newform.L_eulerProduct)).
- **The coefficient field is a number field** — for a newform of weight `k ≥ 2`, `ℚ(aₙ : n)` is a number field, because the integral Hecke algebra is a finite `ℤ`-module ([`numberField_CoefficientField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/NumberField.html#TauCeti.numberField_CoefficientField)).
- **The cusp–Eisenstein decomposition** — in weight `k ≥ 3` and at levels other than `1`, `2` and `4`, the Eisenstein series with character span a complement of `S_k(N, χ)` in `M_k(N, χ)` (Diamond–Shurman 4.5.2; [`isCompl_eisensteinSubspace_range_cuspToModFormCharSpace`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/Dimension.html#TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace)).

### Notable definitions and infrastructure

- The [module of modular symbols](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Basic.html#TauCeti.ModularSymbols) and the Hecke-equivariant [period map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Period/Map.html#TauCeti.ModularSymbols.periodMap), which is [injective in weight `≥ 2`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Period/Injective.html#TauCeti.ModularSymbols.periodMap_injective). They supply the integral structure behind the number-field theorem.
- The Atkin–Li [pseudo-eigenvalue `λ_Q(f)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/PseudoEigenvalue.html#HeckeRing.GL2.Newform.atkinLehnerPseudoEigenvalue), defined at every exact divisor `Q` by `𝒲_Q f = λ_Q(f)·g`. It satisfies Atkin and Li's product law, and at `Q = N` it recovers the Fricke pseudo-eigenvalue of the conjugate-newform theorem.
- The cusp and elliptic-point counts of the congruence subgroups: [the cusps of `Γ₀(N)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Cusp/Count.html#TauCeti.gamma0CuspOrbitEquiv) by divisor-and-unit labels, the cusps of `Γ₁(N)`, and closed forms for `ε₂` and `ε₃` of `Γ₀(N)`. These are the arithmetic inputs that the dimension formulas will consume.

### Roadmap coverage

- **Done.** Layers 1 and 3.
- **Layer 0** is done in weight `≥ 3` away from levels `2` and `4`, and `j`'s `q`-expansion is in place. Weight two is done only on `Γ₀(N)` at squarefree level, and weight one is missing. **Layer 2** lacks the general-rank polynomial presentation; the elementary-divisor lemmas toward it have begun.
- **Layers 4–5** have the newform basis, fixed-level strong multiplicity one, and the coefficient characterization on `M_k(N, χ)`. They lack the `p ‖ N` and `p ∣ cond χ` eigenvalue cases, cross-level strong multiplicity one at unrelated levels, and uniqueness of the primitive pair.
- **Layer 6** has the trivial-character signs, the Fricke theorem, the square of `W_Q`, and `λ_Q` with its product law. `|λ_Q| = 1` is proved only when the nebentypus is trivial at `Q` or away from `Q`.
- **Layer 7** has the sharp abscissa `≤ k` in weight `≥ 3`. It lacks weights one and two, and signs beyond trivial character.
- **Layer 8** is done in weight `≥ 2` except Hecke commutativity on symbols at general indices; weight one (8W) has not begun. **Layers 8G and 9** have the character field, the complex Hecke correspondence, integral newspace characteristic polynomials, Satake parameters and Conrey labels.
- **Layer 10** has the Sturm bound, cusp and elliptic counts, and the degree of `X₀(N) → X(1)`, but no Riemann–Roch and no dimension formula. **Layer 11** has the period-polynomial machinery, Popa–Zagier's coset identity and some orbit contributions, but no Hurwitz class numbers and no assembled formula.

## The frontier

- **Unimodularity of `λ_Q`.** Show that `f` and its transported newform `g` have equal Petersson norm for a general nebentypus; this is now the whole of `|λ_Q(f)| = 1`.
- **Galois stability.** Give the newspace Hecke algebra its `ℚ(χ)`-structure, then define `f^σ`. Orbit sizes and the rationality of the now-integral characteristic polynomials follow, and Layer 9 consumes them.
- **Low-weight Eisenstein theory.** Extend the cusp–Eisenstein decomposition to weight two at every level and character, and to weight one. The sharp abscissa in weights one and two waits on this.
- **The dimension formulas.** The cusp and elliptic counts are in place. The Riemann–Roch chain of 10B is the real blocker.
- **The level-one trace formula.** Define Hurwitz class numbers, evaluate the remaining conjugacy contributions, and make the period-polynomial isomorphism Hecke-equivariant.

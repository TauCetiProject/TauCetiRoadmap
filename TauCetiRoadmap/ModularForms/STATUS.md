<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"afa08a3ed16fb167e35de371afb1eb03fbc5913a","ts":"2026-11-06T05:03:45Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Weight one: independence and spanning of the weight-one Eisenstein series, giving the cusp–Eisenstein decomposition of M_1(N, χ)","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"The hand-off milestones: local–global compatibility of coset decompositions and structure constants, and inverting the central coset","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"The p ‖ N and p | cond χ eigenvalue cases and uniqueness of the primitive pair","state":"partial"},{"id":"Layer 5","remaining":"Cross-level strong multiplicity one for newforms at unrelated levels","state":"partial"},{"id":"Layer 6","remaining":"|λ_Q| = 1 for general nebentypus: equal Petersson norms of f and its transported newform","state":"partial"},{"id":"Layer 7","remaining":"Sharp noncuspidal abscissa in weight one, and signs beyond trivial nebentypus","state":"partial"},{"id":"Layer 8","remaining":"Sublayer 8W beyond integral forms (the Hecke-stable lattice), and Hecke commutativity on symbols at general indices","state":"partial"},{"id":"Layer 8G","remaining":"The Q(χ)-structure of the newspace Hecke algebra, conjugate newforms f^σ and orbit sizes, and rationality of characteristic polynomials","state":"partial"},{"id":"Layer 9","remaining":"Rational characteristic polynomials, Galois orbits of newforms, inner twists, Galois-group certificates, self-duality and labels","state":"partial"},{"id":"Layer 10","remaining":"Analytic Riemann–Roch on X(Γ), the genus comparison, and the dimension formulas","state":"partial"},{"id":"Layer 11","remaining":"Summing the fibre contributions against the weight polynomials into the trace formula, and its acceptance checks","state":"partial"}],"readme_sha":"d99fb41c43ae15ffb7f5aec03fd2c91f3b56d8671c5594224bff3289f390ee3d","roadmap":"ModularForms","to_sha":"afa08a3ed16fb167e35de371afb1eb03fbc5913a"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `afa08a3` (2026-11-06T05:03:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-level valence formula and the old/new theory of `S_k(N, χ)` are done; newforms are full Hecke eigenforms with an Euler product and, in weight `≥ 2`, number-field coefficients. The cusp–Eisenstein decomposition holds in every weight `k ≥ 2`. Weight one, Atkin–Li unimodularity, Galois stability, the LMFDB invariants, the dimension formulas and the trace formula are partial.

### Named results

- **The general-level valence formula** — on a finite-index subgroup, the weighted orders of a nonzero form sum to `k[SL₂(ℤ):Γ]/12` ([`valence_formula_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.valence_formula_finiteIndex)).
- **The Atkin–Lehner–Li theorem** — at each prime `p ∣ N` a newform is a `Uₚ`-eigenvector with eigenvalue `aₚ`, so it is an eigenform of every `Tₙ` ([`heckeUCuspNat_eq_qExpansion_coeff_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/FullEigenform.html#HeckeRing.GL2.Newform.heckeUCuspNat_eq_qExpansion_coeff_smul)).
- **The coefficient field is a number field** — in weight `k ≥ 2`, `ℚ(aₙ : n)` is a number field, since the integral Hecke algebra is a finite `ℤ`-module ([`numberField_CoefficientField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/NumberField.html#TauCeti.numberField_CoefficientField)).
- **The cusp–Eisenstein decomposition** — in every weight `k ≥ 2` and at every level and character, the Eisenstein series span a complement of `S_k(N, χ)` in `M_k(N, χ)` (Diamond–Shurman 4.5.2 and 4.6.2; [`isCompl_eisensteinSubspace_range_cuspToModFormCharSpace`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/Dimension.html#TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace), [`isCompl_weightTwoEisensteinSubspace_range_cuspToModFormCharSpace`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/WeightTwo/Dimension.html#TauCeti.isCompl_weightTwoEisensteinSubspace_range_cuspToModFormCharSpace)).
- **The Eichler–Shimura isomorphism at level one** — period polynomials identify `M_k × S_k` with `W_w` Hecke-equivariantly, so that `Tr(Tₙ | S_k) = (Tr(T̃ₙ | V_w) − σ_{k−1}(n))/2` ([`periodPolynomialEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/LevelOne/PeriodPolynomial/EichlerShimura.html#TauCeti.periodPolynomialEquiv), [`trace_heckeTCuspLevelOne_eq_trace_popaZagierElement`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/LevelOne/PeriodPolynomial/EichlerShimura.html#TauCeti.TraceFormulaMatrixModule.trace_heckeTCuspLevelOne_eq_trace_popaZagierElement)).

### Notable definitions and infrastructure

- The [module of modular symbols](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Basic.html#TauCeti.ModularSymbols) and the Hecke-equivariant [period map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Period/Map.html#TauCeti.ModularSymbols.periodMap), [injective in weight `≥ 2`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Period/Injective.html#TauCeti.ModularSymbols.periodMap_injective). They give the number-field theorem its integral structure.
- The Atkin–Li [pseudo-eigenvalue `λ_Q(f)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/PseudoEigenvalue.html#HeckeRing.GL2.Newform.atkinLehnerPseudoEigenvalue), defined at every exact divisor `Q` by `𝒲_Q f = λ_Q(f)·g`. It satisfies Atkin and Li's product law.
- The [forms integral at every cusp](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/Integral/Basic.html#TauCeti.ModularForm.integralAtCusps), stable under the diamonds and the good `Tₚ`: the first step of the weight-one sublayer 8W.

### Roadmap coverage

- **Done.** Layers 1 and 3.
- **Layer 0** is done in every weight `k ≥ 2`. Weight one has its Eisenstein series and a codimension bound, but no decomposition.
- **Layer 2** has Shimura's polynomial presentation of the `p`-local Hecke ring at every rank; the two hand-off milestones to the automorphic-representations roadmap remain.
- **Layers 4–5** have the newform basis and fixed-level strong multiplicity one, but lack the `p ‖ N` and `p ∣ cond χ` eigenvalue cases, cross-level strong multiplicity one at unrelated levels, and uniqueness of the primitive pair.
- **Layer 6** has the trivial-character signs, the Fricke theorem and `λ_Q` with its product law. `|λ_Q| = 1` is proved only when the nebentypus is trivial at `Q` or away from `Q`.
- **Layer 7** has the Euler product, its nonvanishing, the sharp abscissa in weight `≥ 2`, and the root-number parity of self-dual newforms; it lacks weight one and signs beyond trivial character.
- **Layer 8** is done in weight `≥ 2` except Hecke commutativity on symbols at general indices; 8W has integral forms at the cusps but no Hecke-stable lattice. **Layers 8G and 9** have the character field, the complex Hecke correspondence, integral characteristic polynomials, Conrey labels and character Galois-orbit labels.
- **Layer 10** has the Sturm bound, cusp and elliptic counts, the degree of `X₀(N) → X(1)` and divisor sheaves, but no Riemann–Roch and no dimension formula. **Layer 11** has the Eichler–Shimura transfer and the elliptic, hyperbolic and parabolic fibre sums, with Hurwitz class numbers, but not the assembled formula.

## The frontier

- **The level-one trace formula.** Sum the per-type contributions against the weight polynomials `P_k(t, n)` to evaluate `Tr(T̃ₙ | V_w)`, then check `tr T(1) = dim S_k` and `τ(2) = −24`.
- **Unimodularity of `λ_Q`.** Show that `f` and its transported newform `g` have equal Petersson norm for a general nebentypus; this is now the whole of `|λ_Q(f)| = 1`.
- **Weight one.** Prove the weight-one Eisenstein series independent and spanning a complement of `S₁(N, χ)`, which the weight-one abscissa waits on; separately, build 8W's Hecke-stable lattice.
- **Galois stability.** Give the newspace Hecke algebra its `ℚ(χ)`-structure, then define `f^σ`; orbit sizes and rational characteristic polynomials follow, for Layer 9.
- **The dimension formulas.** The counts and the divisor sheaves are in place; analytic Riemann–Roch on `X(Γ)` and the genus comparison are the real blocker.

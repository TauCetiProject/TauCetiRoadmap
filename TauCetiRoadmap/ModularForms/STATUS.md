<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"The Dedekind-sum value of the eta multiplier, Dedekind reciprocity, the Kronecker form and the eta-quotient criterion","state":"partial"},{"id":"Layer 1","remaining":"The geometric-order dictionary on the effective quotient and the projective valence formula","state":"partial"},{"id":"Layer 2","remaining":"The integral and rational p-adic comparisons of 2.2, including the central localization","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"The conductor of a good eigenform and its API","state":"partial"},{"id":"Layer 5","remaining":"Agreement at primes outside a finite set, with no character hypothesis","state":"partial"},{"id":"Layer 6","remaining":"|lambda_Q| = 1 for general nebentypus, via equal Petersson norms of f and its transported newform","state":"partial"},{"id":"Layer 7","remaining":"The sharp abscissa for arbitrary forms in weight one, now unblocked by the weight-one decomposition","state":"partial"},{"id":"Layer 8","remaining":"Arithmetic forms of 8.0, rational descent, weight-one coefficient fields, unique Galois conjugates and orbit sizes","state":"partial"},{"id":"Layer 9","remaining":"Galois conjugate newforms, the sharp twist level, inner twists, trace forms and orbit separation","state":"partial"},{"id":"Layer 10","remaining":"Finiteness of H1, Riemann-Roch, Serre duality, genus formula, automorphy bundle, dimension formulas, complex structure on Y1(N), complex Tate curve","state":"partial"},{"id":"Layer 11","state":"done"}],"readme_sha":"91486d6b56a377974037a787e36c958f6d0cdcf59f06c6d3baffcaf88f5229e2","roadmap":"ModularForms","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The level-one Eichler–Selberg trace formula and the fixed-character old/new decomposition are done. The cusp–Eisenstein decomposition now holds in every weight. Every other layer is partial. Most open are Riemann–Roch and the dimension formulas, the explicit eta multiplier and eta quotients, the `p`-adic Hecke comparison, and the arithmetic weight-one forms of §8.0.

### Named results

- **The Eichler–Selberg trace formula at level one** — for even `k ≥ 4` and `n ≥ 1`, the trace of `Tₙ` on `S_k(SL₂(ℤ))` is −½ Σ_{t² ≤ 4n} P_k(t, n) H(4n − t²) − ½ Σ_{dd′=n} min(d, d′)^{k−1}, with `H` the Hurwitz class number (`trace_heckeTCuspLevelOne_eq_neg_hurwitzClassNumber_sub_min`).
- **Shimura's Theorem 3.20** — for a prime `p`, the `p`-local Hecke ring of `GL_n` is a polynomial ring over `ℤ` on the `n` diagonal prime cosets, in every rank ([`polynomialRingEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Presentation.html#HeckeRing.GLn.polynomialRingEquiv)).
- **The cusp–Eisenstein decomposition** — `M_k(N, χ) = S_k(N, χ) ⊕ E_k(N, χ)`. In weight one this holds at every level ([`isCompl_weightOneEisensteinSubspace_range_cuspToModFormCharSpace`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/WeightOne/Dimension.html#TauCeti.isCompl_weightOneEisensteinSubspace_range_cuspToModFormCharSpace)). In weight two it holds with the corrected `E₂`, and in weight `k ≥ 3` away from levels `1`, `2` and `4` ([`isCompl_eisensteinSubspace_range_cuspToModFormCharSpace`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/Dimension.html#TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace)).
- **The transformation law of `η`** — for `γ ∈ SL₂(ℤ)`, `η(γτ) = ε(γ)√(cτ + d)·η(τ)` with the principal root, where `ε(γ)` is a 24th root of unity ([`eta_smul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/DedekindEta/Transformation.html#TauCeti.ModularForm.eta_smul)).
- **The moduli bijection for `Γ₁(N)`** — `z ↦ (ℂ/(ℤz + ℤ), 1/N)` identifies `Γ₁(N)\ℍ` with the isomorphism classes of complex elliptic curves with a point of exact order `N` ([`gamma1QuotientEquivExactOrder`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Elliptic/Gamma1Moduli.html#TauCeti.gamma1QuotientEquivExactOrder)).

### Notable definitions and infrastructure

- The [sheaf `𝒪_D` of a divisor](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/Sheaf.html#TauCeti.RiemannSurface.divisorSheaf) and its point-twist sequence now carry their cohomology maps. Each twist [raises `h⁰ − h¹` by one](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/Cohomology/Basic.html#TauCeti.RiemannSurface.finrank_pointTwist_euler_characteristic) once `H¹` is finite-dimensional. This is the Riemann–Roch induction, waiting on that one input.
- The [residue pairing](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Differential/Residue/Pairing.html#TauCeti.RiemannSurface.PrincipalParts.residuePairing) of principal parts with differentials, with the left-exact Mittag-Leffler sequence. Serre duality is to be proved by showing this pairing is perfect.
- The Atkin–Li [pseudo-eigenvalue `λ_Q(f)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/PseudoEigenvalue.html#HeckeRing.GL2.Newform.atkinLehnerPseudoEigenvalue), defined at every exact divisor `Q` of the level, with its product law.

### Roadmap coverage

- **Done:** Layers 3 and 11.
- **Layer 0** has all of §0.1 and the transformation law of `η`. It lacks the explicit multiplier, reciprocity, the Kronecker form and the eta-quotient criterion.
- **Layers 1 and 2** are unchanged: Layer 1 lacks the geometric-order dictionary and projective valence formula, and Layer 2 lacks the `p`-adic comparison.
- **Layers 4–7** each lack one piece:
  - **Layer 4:** the conductor.
  - **Layer 5:** strong multiplicity one from primes alone, with no character hypothesis.
  - **Layer 6:** `|λ_Q| = 1` in general.
  - **Layer 7:** the weight-one abscissa.
- **Layers 8 and 9** are unchanged. Layer 8 has number-field coefficients and the rational Hecke algebras, but no rational descent or Galois-conjugate newforms. Layer 9 has Satake parameters and primitive twists, but no inner twists or orbit separation.
- **Layer 10** is partial in every part:
  - **10A** has the cusp and elliptic counts and the degree of `X₀(N) → X(1)`.
  - **10B** has `H⁰(𝒪) = ℂ` and `H¹(ℙ¹, 𝒪) = 0`, the point-twist sequence, canonical divisors and [Riemann–Hurwitz for canonical divisors](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Differential/Canonical/Degree.html#TauCeti.RiemannSurface.IsCanonicalDivisor.degree_eq_degree_mul_add_ramificationDegree). It lacks finiteness of `H¹`, Riemann–Roch and Serre duality.
  - **10C** has the transition functions of the automorphy sheaf with their cocycle law at elliptic points and cusps, but no line bundle and no dimension formula.
  - **10D** has the uniformisation of elliptic curves, torsion as `Λ/NΛ` and the moduli bijection. It lacks the complex structure on `Y₁(N)`, the complex Tate curve and algebraicity.

## The frontier

- **Finiteness of `H¹` and Riemann–Roch.** Compact restriction of square-integrable Čech cocycles is in. What remains is `dim H¹(X, 𝒪_D) < ∞`; Riemann–Roch then follows along the point-twist sequence, and Serre duality, the genus comparison and the dimension formulas after it.
- **The explicit eta multiplier.** The translation step, the step `ε(γS) = e^{−πi/4}ε(γ)` for `d > 0` and the value at `c = 1` are proved. What remains is the Dedekind sum and its reciprocity law, then the Kronecker form and the eta-quotient criterion.
- **The weight-one sharp abscissa.** Its stated blocker, the weight-one decomposition, has landed; what remains is the Eisenstein bound in weight one.
- **Cross-level strong multiplicity one, as stated.** The proved versions assume equal characters or compare all indices coprime to the levels. What remains is to use primes alone, with no character hypothesis.
- **Galois-conjugate newforms.** Showing that each embedding of the coefficient field gives a unique conjugate newform opens §8.2's orbit sizes and the Galois-transport and orbit-separation parts of Layer 9.

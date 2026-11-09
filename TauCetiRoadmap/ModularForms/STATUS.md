<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7","ts":"2026-11-07T20:34:01+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Spanning cusp-Eisenstein decomposition in weight two beyond squarefree level for Gamma0(N), in weight one, and at levels 2 and 4","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"Local-global compatibility of structure constants and inverting the central coset T(p,...,p)","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"The p || N and p | cond chi eigenvalue cases and uniqueness of the primitive pair","state":"partial"},{"id":"Layer 5","remaining":"Cross-level strong multiplicity one for newforms at unrelated levels","state":"partial"},{"id":"Layer 6","remaining":"|lambda_Q| = 1 for general nebentypus: equal Petersson norms of f and its transported newform","state":"partial"},{"id":"Layer 7","remaining":"Sharp noncuspidal abscissa in weights one and two, and signs beyond trivial nebentypus","state":"partial"},{"id":"Layer 8","remaining":"Weight one (sublayer 8W) and Hecke commutativity on symbols at general indices","state":"partial"},{"id":"Layer 8G","remaining":"The Q(chi)-structure of the newspace Hecke algebra, conjugate newforms and orbit sizes, and rationality of characteristic polynomials","state":"partial"},{"id":"Layer 9","remaining":"Rational characteristic polynomials, Galois orbits of newforms, inner twists, Galois-group certificates and self-duality","state":"partial"},{"id":"Layer 10","remaining":"Finiteness of H1, Riemann-Roch, Serre duality, the analytic genus comparison, and the dimension formulas","state":"partial"},{"id":"Layer 11","remaining":"Hurwitz class numbers, the elliptic, non-split hyperbolic and parabolic contributions, and the Hecke-equivariant transfer","state":"partial"}],"readme_sha":"d99fb41c43ae15ffb7f5aec03fd2c91f3b56d8671c5594224bff3289f390ee3d","roadmap":"ModularForms","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `e583e15` (2026-11-07T20:34:01+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-level valence formula and the old/new theory of `S_k(N, χ)` are done, and Shimura's presentation of the local Hecke ring now holds in every rank. Low-weight Eisenstein theory, Galois stability, the LMFDB invariants, the Riemann–Roch chain and the trace formula are partial, and weight-one modular symbols have not begun. This window's record stops partway through the modular-forms modules, so the newform, L-function and modular-symbol layers are carried forward from the previous report.

### Named results

- **Shimura's Theorem 3.20** — for a prime `p`, the `p`-local Hecke ring of `GL_n` is a polynomial ring over `ℤ` on the `n` diagonal prime cosets, in every rank `n` ([`polynomialRingEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Presentation.html#HeckeRing.GLn.polynomialRingEquiv)).
- **The Atkin–Lehner–Li theorem** — at each prime `p ∣ N` a newform is a `Uₚ`-eigenvector with eigenvalue `aₚ`, so it is an eigenform of every `Tₙ` ([`heckeUCuspNat_eq_qExpansion_coeff_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/FullEigenform.html#HeckeRing.GL2.Newform.heckeUCuspNat_eq_qExpansion_coeff_smul)).
- **The newform Euler product** — for `Re s > k/2 + 1`, `L(s,f) = ∏ₚ (1 − aₚp^{−s} + χ(p)p^{k−1−2s})^{−1}`, with `χ` extended by zero ([`L_eulerProduct`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LFunction/EulerProduct.html#HeckeRing.GL2.Newform.L_eulerProduct)).
- **The coefficient field is a number field** — for a newform of weight `k ≥ 2`, `ℚ(aₙ : n)` is a number field, because the integral Hecke algebra is a finite `ℤ`-module ([`numberField_CoefficientField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/NumberField.html#TauCeti.numberField_CoefficientField)).
- **The cusp–Eisenstein decomposition** — in weight `k ≥ 3` and at levels other than `1`, `2` and `4`, the Eisenstein series with character span a complement of `S_k(N, χ)` in `M_k(N, χ)` (Diamond–Shurman 4.5.2; [`isCompl_eisensteinSubspace_range_cuspToModFormCharSpace`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/EisensteinSeries/Dimension.html#TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace)).

### Notable definitions and infrastructure

- The [sheaf `𝒪_D` of a divisor](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/Sheaf.html#TauCeti.RiemannSurface.divisorSheaf) on a Riemann surface, together with the [point-twist sequence `0 → 𝒪_D → 𝒪_{D+x} → ℂ_x → 0`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor/PointTwist.html#TauCeti.RiemannSurface.pointTwistSequence_shortExact). These are the objects the Riemann–Roch induction runs on.
- The [module of modular symbols](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Basic.html#TauCeti.ModularSymbols) and its Hecke-equivariant [period map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/ModularSymbols/Period/Map.html#TauCeti.ModularSymbols.periodMap). They supply the integral structure behind the number-field theorem.
- The Atkin–Li [pseudo-eigenvalue `λ_Q(f)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/AtkinLehner/PseudoEigenvalue.html#HeckeRing.GL2.Newform.atkinLehnerPseudoEigenvalue), defined at every exact divisor `Q` of the level. It satisfies Atkin and Li's product law.

### Roadmap coverage

- **Done.** Layers 1 and 3.
- **Layer 0** is done in weight `≥ 3` away from levels `2` and `4`. In weights one and two the cusp codimension bounds are proved, but spanning by explicit series is established only in weight two on `Γ₀(N)` at squarefree level.
- **Layer 2** has the polynomial presentation at every rank. It lacks the two hand-off milestones: local–global compatibility of structure constants, and the localization at the central coset.
- **Layers 4–6** have the newform basis, fixed-level strong multiplicity one, the Fricke theorem and `λ_Q` with its product law. They lack the `p ‖ N` and `p ∣ cond χ` eigenvalue cases, cross-level strong multiplicity one, and `|λ_Q| = 1` for general nebentypus.
- **Layers 7, 8, 8G and 9** are as previously reported. The sharp abscissa is known only in weight `≥ 3`, there is no weight-one sublayer, and there is no `ℚ(χ)`-structure on the newspace Hecke algebra. The LMFDB layer gained Galois-orbit labels for Dirichlet characters.
- **Layer 10** has the Sturm bound, the cusp and elliptic counts, and the degree of `X₀(N) → X(1)`. It also has divisor sheaves, the point-twist sequence, `H¹ = 0` on discs, residues, and local trivializations of the automorphy sheaf, but no finiteness of `H¹`, no Riemann–Roch and no dimension formula. **Layer 11** has the period-polynomial machinery, Popa–Zagier's exactness and coset identities, and the count of split hyperbolic classes, but no Hurwitz class numbers.

## The frontier

- **Finiteness of `H¹` on a compact Riemann surface.** Schwartz's lemma, compact Bergman restriction and acyclicity of discs are in place. What remains is assembling them into `dim H¹(X, 𝒪_D) < ∞`. After that, Riemann–Roch follows by induction along the point-twist sequence, followed by Serre duality and the genus comparison.
- **The dimension formulas.** These need the chain above, together with a global automorphy line bundle glued from the existing local trivializations.
- **Low-weight Eisenstein theory.** The codimension bounds are proved. What remains is to show that explicit series attain them in weight two at every level and character, and in weight one. The sharp abscissa in weights one and two waits on this.
- **The Layer 2 hand-off.** Two milestones remain: matching the `p`-local ring with the `p`-adic double-coset ring, including structure constants, and inverting `T(p, …, p)`.
- **The level-one trace formula.** Define Hurwitz class numbers, evaluate the elliptic, non-split hyperbolic and parabolic contributions, and make the period-polynomial isomorphism Hecke-equivariant.

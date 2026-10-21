<!--tauceti-status:v1 {"roadmap":"DiophantineApproximationAndTranscendence","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1","ts":"2026-10-19T17:10:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"M(x⁻¹) = M(x) for the Mahler measure and the lower bound |z| ≥ den(z)^(−d) house(z)^(1−d)","state":"partial"},{"id":"Layer 1","remaining":"finiteness of Thue equations F(x,y)=m, transcendence of the sum of b^(−3^k), and the block-homogeneous jet lemmas of §1.7","state":"partial"},{"id":"Layer 2","remaining":"twisted and subspace heights, unit equations, recurrences, integer grids, block homogenization and the absolute quantitative subspace theorem","state":"partial"},{"id":"Layer 3","remaining":"Lindemann–Weierstrass itself, then Gelfond–Schneider, Schneider–Lang, Baker and the logarithmic-form bounds","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"8665567e53197f0f31ad652ed3b769d0f92e5a756d2de0117a3741561bc27d94","roadmap":"DiophantineApproximationAndTranscendence","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
# Status: DiophantineApproximationAndTranscendence

This file documents the status of the DiophantineApproximationAndTranscendence roadmap up until `a5cde7b` (2026-10-19T17:10:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Roth's theorem, the summit of Layer 1, is proved, along with nearly all of the Layer 0 height and approximation foundations it rests on. Layers 2 and 3 have only their first preliminaries. Effective equations (Layer 4) and special functions (Layer 5) have not begun.

### Named results

- **Roth's theorem** — for a real algebraic irrational α and κ > 2, only finitely many rationals ξ satisfy |ξ − α| ≤ H(ξ)^(−κ) ([`IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/Theorem.html#IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg)). Equivalently, such an α has [irrationality exponent two](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/Theorem.html#IsAlgebraic.irrationalityExponent_eq_two). A version for complex algebraic α is also proved. As the README notes, the method gives no computable constant.
- **The Thue–Roth inequality for binary forms** — a square-free integer binary form F of degree d ≥ 3 satisfies |F(x, y)| ≥ c·max(|x|, |y|)^(d−κ) whenever F(x, y) ≠ 0 ([`MvPolynomial.IsHomogeneous.exists_pos_mul_max_abs_rpow_le_abs_eval`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/BinaryForm.html#MvPolynomial.IsHomogeneous.exists_pos_mul_max_abs_rpow_le_abs_eval)).
- **Roth's lemma** — a polynomial with bounded partial degrees and height has small weighted index at any point whose coordinates have rapidly growing heights ([`TauCeti.weightedIndex_le_of_logHeight_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/IndexEstimate.html#TauCeti.weightedIndex_le_of_logHeight_le)). This is the nonvanishing engine behind the theorem.
- **Thue's approximation theorem** — Thue's earlier exponent d/2 + 1, proved independently through the gap principle ([`TauCeti.thue_approximation_real`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Thue/GapPrinciple.html#TauCeti.thue_approximation_real)).
- **Kronecker's approximation theorem** — if 1, α₁, …, αₙ are linearly independent over ℚ, the points (yαᵢ − xᵢ) come arbitrarily close to any target ([`TauCeti.kronecker_approximation`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Kronecker.html#TauCeti.kronecker_approximation)). It sits alongside Dirichlet's theorem for systems of linear forms.

### Notable definitions and infrastructure

- **The Mahler measure of an algebraic number** ([`TauCeti.mahlerMeasure`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/MahlerMeasure.html#TauCeti.mahlerMeasure)) is defined in any characteristic-zero field, together with the naive height and the house. It is tied to the absolute height and comes with Northcott finiteness and Kronecker's root-of-unity characterisation. Every later height estimate starts here.
- **The weighted index of a multivariate polynomial** ([`MvPolynomial.weightedIndex`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/WeightedIndex.html#MvPolynomial.weightedIndex)) sits on top of multivariate Hasse derivatives and the [generalized Wronskian criterion](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/HasseDeriv/Wronskian.html#MvPolynomial.linearIndependent_iff_exists_genWronskian_ne_zero). The subspace theorem's auxiliary-polynomial arguments will reuse this calculus.
- **The irrationality exponent** ([`TauCeti.irrationalityExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Exponent.html#TauCeti.irrationalityExponent)) has linear-form, simultaneous and algebraic-approximation companions. It is computed through continued fractions and shown to equal two almost everywhere.

### Roadmap coverage

Layer 0 is done apart from two small items: M(x⁻¹) = M(x) for the Mahler measure, and Evertse's lower bound |z| ≥ den(z)^(−d) house(z)^(1−d). Primitive minimal polynomials, heights, Northcott, Siegel's lemma, Dirichlet and Kronecker approximation, all four exponents, and badly approximable numbers are in place, with Littlewood's conjecture kept as a hypothesis. Layer 1 has Roth's theorem in every form §1.6 asks for, plus Thue's construction and the block-substitution chain rule. Still missing there are the transcendence of Σ b^(−3ᵏ), finiteness of solutions to Thue equations F(x, y) = m, and the block-homogeneous jet lemmas at the end of §1.7. Layer 2 has vectors in general position, Plücker coordinates with Cauchy–Binet, and the linear-independence extraction for §2.8, but no twisted heights, unit equations or subspace theorem. Layer 3 has Hermite's integrals, formal exponential sums and Hermite's auxiliary polynomial, but not Lindemann–Weierstrass itself. Layers 4 and 5 are untouched. This assessment rests on a declaration survey that was partly truncated.

## The frontier

- **Lindemann–Weierstrass** — Hermite's identity and estimate, Galois conjugation of exponential sums and the auxiliary polynomial exist. What remains is the auxiliary value: proving it is a nonzero algebraic integer, bounding it, and closing the argument of §3.2.
- **Thue equations and the rest of §1.6** — the binary-form inequality is proved, so finiteness of F(x, y) = m needs only the reduction to a square-free divisor of degree ≥ 3. The transcendence of Σ b^(−3ᵏ) is a direct corollary of Roth's theorem.
- **Layer 0 loose ends** — the inversion invariance of the Mahler measure and the den/house lower bound for |z|.
- **Absolute twisted heights (§2.5)** — Plücker coordinates are in place, but the twisted height, its weights and the Euclidean/Plücker subspace-height duality, which the quantitative subspace theorem consumes, have not started.
- **Unit equations and recurrences (§§2.3–2.4)** — only the general-position notion exists. The finite-rank reduction waits on the product theorem of §2.8.

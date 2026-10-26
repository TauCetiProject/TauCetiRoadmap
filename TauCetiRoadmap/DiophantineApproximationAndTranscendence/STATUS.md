<!--tauceti-status:v1 {"roadmap":"DiophantineApproximationAndTranscendence","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4","ts":"2026-10-25T09:09:58Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the lower bound |z| ≥ den(z)^(−d) house(z)^(1−d) for nonzero algebraic z","state":"partial"},{"id":"Layer 1","remaining":"finiteness of Thue equations F(x,y)=m and transcendence of the sum of b^(−3^k)","state":"partial"},{"id":"Layer 2","remaining":"subspace heights and duality, unit-equation finiteness, recurrences, integer grids and the quantitative subspace theorem","state":"partial"},{"id":"Layer 3","remaining":"Gelfond–Schneider (Lemma 4.27 estimates and conclusion), then Schneider–Lang, Baker and the logarithmic-form bounds","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"8665567e53197f0f31ad652ed3b769d0f92e5a756d2de0117a3741561bc27d94","roadmap":"DiophantineApproximationAndTranscendence","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4"}-->
# Status: DiophantineApproximationAndTranscendence

This file documents the status of the DiophantineApproximationAndTranscendence roadmap up until `d96e9ce` (2026-10-25T09:09:58Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two summits are proved. Roth's theorem completes the substance of Layer 1, and the Lindemann–Weierstrass theorem now completes the first transcendence chapter of Layer 3. Layer 0 is done but for one size estimate. Layer 2 has its basic objects but none of its theorems, and Layers 4 and 5 have not begun.

### Named results

- **Roth's theorem** — for a real algebraic irrational α and κ > 2, only finitely many rationals ξ satisfy |ξ − α| ≤ H(ξ)^(−κ) ([`IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/Theorem.html#IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg)), so α has [irrationality exponent two](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/Theorem.html#IsAlgebraic.irrationalityExponent_eq_two). A complex version is also proved. As the README notes, the constant is not computable.
- **The Lindemann–Weierstrass theorem** — exponentials of distinct algebraic numbers are linearly independent over the algebraic numbers ([`TauCeti.linearIndependent_exp`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Transcendental/Lindemann/Theorem.html#TauCeti.linearIndependent_exp)). Equivalently, exponentials of ℚ-linearly independent algebraic numbers are [algebraically independent](https://taucetiproject.org/docs/TauCeti/NumberTheory/Transcendental/Lindemann/Theorem.html#TauCeti.algebraicIndependent_exp). Both are unconditional and follow Hermite's proof.
- **The Thue–Roth inequality for binary forms** — a square-free integer binary form F of degree d ≥ 3 satisfies |F(x, y)| ≥ c·max(|x|, |y|)^(d−κ) whenever F(x, y) ≠ 0 ([`MvPolynomial.IsHomogeneous.exists_pos_mul_max_abs_rpow_le_abs_eval`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/BinaryForm.html#MvPolynomial.IsHomogeneous.exists_pos_mul_max_abs_rpow_le_abs_eval)).
- **Thue's approximation theorem** — Thue's earlier exponent d/2 + 1, proved independently through the gap principle ([`TauCeti.thue_approximation_real`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Thue/GapPrinciple.html#TauCeti.thue_approximation_real)).
- **Kronecker's approximation theorem** — if 1, α₁, …, αₙ are linearly independent over ℚ, the points (yαᵢ − xᵢ) come arbitrarily close to any target ([`TauCeti.kronecker_approximation`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Kronecker.html#TauCeti.kronecker_approximation)).

### Notable definitions and infrastructure

- **The Mahler measure of an algebraic number** ([`TauCeti.mahlerMeasure`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/MahlerMeasure.html#TauCeti.mahlerMeasure)) comes with the naive height, the house, Northcott finiteness and Kronecker's root-of-unity theorem. Every later height estimate starts here.
- **The weighted index of a multivariate polynomial** ([`MvPolynomial.weightedIndex`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/WeightedIndex.html#MvPolynomial.weightedIndex)) is built on multivariate Hasse derivatives and generalized Wronskians. It drove Roth's lemma, and the block-homogeneous jet calculus now extends it toward the subspace theorem.
- **The twisted height** ([`TauCeti.twistedHeight`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Twisted.html#TauCeti.twistedHeight)) is a product over all places of weighted maxima of linear forms. It is projective, shifts correctly with the weights, and reduces to the absolute height for coordinate forms with zero weights. It is the height that the quantitative subspace theorem is phrased in.

### Roadmap coverage

**Layer 0** is done except for Evertse's lower bound |z| ≥ den(z)^(−d) house(z)^(1−d). M(x⁻¹) = M(x) now holds.

**Layer 1** has Roth's theorem in every form §1.6 asks for. All of §1.7 is in place, including the block-substitution chain rule and the block-homogeneous jet lemmas. Two corollaries are missing: transcendence of Σ b^(−3ᵏ), and finiteness of solutions to Thue equations F(x, y) = m. The square-free-divisor step for the second is now proved.

**Layer 2** has the following objects:

- vectors in general position, with conjugate linear forms shown to be in general position;
- Plücker coordinates, with coprimality for saturated lattices;
- nondegenerate solutions of linear equations with the reduction to them;
- the twisted height and Euclidean heights under field extension;
- block homogenization;
- Gaussian-measure comparisons from Bombieri–Gubler's appendix.

No theorem of the layer is proved, including unit-equation finiteness, recurrences, integer-grid estimates and the subspace theorem.

**Layer 3** has §§3.1–3.2 complete: algebraic logarithms, Hermite integrals and Lindemann–Weierstrass. §3.3 has Schneider's auxiliary function, the exponential-polynomial zero estimate, factoring out prescribed zeros and Schwarz's lemma. Gelfond–Schneider is not proved, and §§3.4–3.8 are untouched.

**Layers 4 and 5** are untouched.

## The frontier

- **Gelfond–Schneider (§3.3)** — the auxiliary function, zero estimate and Schwarz lemma exist. What remains is the extrapolation bounds of Lemma 4.27 (size, house and denominators of the values y_ab) and the final contradiction with the fundamental inequality.
- **Thue equations and Σ b^(−3ᵏ) (§1.6)** — the binary-form inequality and the square-free divisor are both proved, so finiteness of F(x, y) = m is an assembly step. The transcendence of Σ b^(−3ᵏ) is a direct corollary of Roth's theorem.
- **The den/house lower bound (§0.3)** — the last Layer 0 item. The new facts that the denominator divides the leading coefficient of the primitive minimal polynomial are a natural starting point.
- **Twisted heights to subspace heights (§2.5)** — the twisted height exists. The subspace weights and the Euclidean/Plücker height duality, which the quantitative subspace theorem consumes, have not started.
- **Unit equations (§2.3)** — nondegenerate solutions and the reduction to them are in place. Finiteness over ℚ needs the p-adic approximation input of the same section.

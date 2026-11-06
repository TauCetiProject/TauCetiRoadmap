<!--tauceti-status:v1 {"roadmap":"DiophantineApproximationAndTranscendence","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3","ts":"2026-10-26T19:49:38Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the lower bound |z| ≥ den(z)^(−d) house(z)^(1−d) for nonzero algebraic z","state":"partial"},{"id":"Layer 1","remaining":"finiteness of Thue equations F(x,y)=m and transcendence of the sum of b^(−3^k)","state":"partial"},{"id":"Layer 2","remaining":"subspace heights and duality, unit-equation finiteness, recurrences, integer grids and the quantitative subspace theorem","state":"partial"},{"id":"Layer 3","remaining":"Gelfond–Schneider (Lemma 4.27 estimates and conclusion), Schneider–Lang, Baker, archimedean bounds and Yu's several-factor p-adic bound","state":"partial"},{"id":"Layer 4","remaining":"balanced divisors of §4.1, then the exponential, unit, Thue and S-unit equations of §§4.2–4.5","state":"partial"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"82771550516948180af0c26b25cbbcb640485fd8f024831c95b72e15d08042fd","roadmap":"DiophantineApproximationAndTranscendence","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3"}-->
# Status: DiophantineApproximationAndTranscendence

This file documents the status of the DiophantineApproximationAndTranscendence roadmap up until `938acbb` (2026-10-26T19:49:38Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two summits are proved. Roth's theorem completes the substance of Layer 1, and the Lindemann–Weierstrass theorem completes the first transcendence chapter of Layer 3. Layer 0 is done but for one size estimate. Layer 2 has its basic objects but none of its theorems. Layer 4 has only the structure of the rational S-units, and Layer 5 has not begun.

### Named results

- **Roth's theorem** — for a real algebraic irrational α and κ > 2, only finitely many rationals ξ satisfy |ξ − α| ≤ H(ξ)^(−κ) ([`IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/Theorem.html#IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg)), so α has [irrationality exponent two](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/Theorem.html#IsAlgebraic.irrationalityExponent_eq_two). A complex version is also proved. As the README notes, the constant is not computable.
- **The Lindemann–Weierstrass theorem** — exponentials of distinct algebraic numbers are linearly independent over the algebraic numbers ([`TauCeti.linearIndependent_exp`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Transcendental/Lindemann/Theorem.html#TauCeti.linearIndependent_exp)). Equivalently, exponentials of ℚ-linearly independent algebraic numbers are [algebraically independent](https://taucetiproject.org/docs/TauCeti/NumberTheory/Transcendental/Lindemann/Theorem.html#TauCeti.algebraicIndependent_exp).
- **The Thue–Roth inequality for binary forms** — a square-free integer binary form F of degree d ≥ 3 satisfies |F(x, y)| ≥ c·max(|x|, |y|)^(d−κ) whenever F(x, y) ≠ 0 ([`MvPolynomial.IsHomogeneous.exists_pos_mul_max_abs_rpow_le_abs_eval`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Roth/BinaryForm.html#MvPolynomial.IsHomogeneous.exists_pos_mul_max_abs_rpow_le_abs_eval)).
- **Kronecker's approximation theorem** — if 1, α₁, …, αₙ are linearly independent over ℚ, the points (yαᵢ − xᵢ) come arbitrarily close to any target ([`TauCeti.kronecker_approximation`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DiophantineApproximation/Kronecker.html#TauCeti.kronecker_approximation)).
- **The p-adic one-factor estimate** — in a finite extension of ℚ_p, v(α^b − 1) ≤ C(1 + log max(1, |b|)) whenever α^b ≠ 1 ([`TauCeti.exists_log_normalizedValuationWithZero_zpow_sub_one_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/UnitFiltration/Pow/SubOne.html#TauCeti.exists_log_normalizedValuationWithZero_zpow_sub_one_le)). This is the n = 1 case of Yu's bound, with an [explicit form](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/UnitFiltration/Pow/SubOne.html#TauCeti.log_normalizedValuationWithZero_zpow_sub_one_le) for non-torsion units.

### Notable definitions and infrastructure

- **The Mahler measure of an algebraic number** ([`TauCeti.mahlerMeasure`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/MahlerMeasure.html#TauCeti.mahlerMeasure)) comes with the naive height, the house, Northcott finiteness and Kronecker's root-of-unity theorem. Every later height estimate starts here.
- **The weighted index of a multivariate polynomial** ([`MvPolynomial.weightedIndex`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/WeightedIndex.html#MvPolynomial.weightedIndex)) is built on multivariate Hasse derivatives and generalized Wronskians. It drove Roth's lemma, and block-homogeneous jets extend it toward the subspace theorem.
- **The structure of the rational S-units** ([`TauCeti.sUnitsRatMulEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/SUnits/Rat/Structure.html#TauCeti.sUnitsRatMulEquiv)) identifies them with ℤˣ × ℤ^S through the sign and the p-adic valuations, giving rank |S| and an exact height formula. Unit equations over ℚ and the rational S-unit equations of §4.5 are phrased on this group.

### Roadmap coverage

**Layer 0** is done except for Evertse's lower bound |z| ≥ den(z)^(−d) house(z)^(1−d).

**Layer 1** has Roth's theorem in every form §1.6 asks for, Thue's theorem by the gap principle, and all of §1.7. Two corollaries are missing: transcendence of Σ b^(−3ᵏ), and finiteness of solutions to Thue equations F(x, y) = m.

**Layer 2** has general position, Plücker coordinates, nondegenerate solutions of unit-type equations, the twisted height, block homogenization and the Gaussian-measure comparisons. No theorem of the layer is proved: not unit-equation finiteness, recurrences, integer-grid estimates or the subspace theorem.

**Layer 3** has §§3.1–3.2 complete: algebraic logarithms, Hermite integrals and Lindemann–Weierstrass. §3.3 has Schneider's auxiliary function, the exponential-polynomial zero estimate and Schwarz's lemma, but not Gelfond–Schneider. §3.7 has the one-factor estimate only. The rest of §§3.4–3.8 is untouched.

**Layer 4** has the rational S-unit part of §4.1 complete. Balanced divisors and §§4.2–4.5 are untouched. **Layer 5** is untouched.

## The frontier

- **Gelfond–Schneider (§3.3)** — the auxiliary function, zero estimate and Schwarz lemma exist. What remains is the extrapolation bounds of Lemma 4.27 (size, house and denominators of the values y_ab) and the final contradiction with the fundamental inequality.
- **Thue equations and Σ b^(−3ᵏ) (§1.6)** — the binary-form inequality and the square-free divisor are both proved, so finiteness of F(x, y) = m is an assembly step. The transcendence of Σ b^(−3ᵏ) is a direct corollary of Roth's theorem.
- **Balanced divisors and exponential gaps (§§4.1–4.2)** — the bounded-divisor set D_u(α) and its finiteness need only units and the house. The bound |v_p(x)| ≤ log H(x)/log 2 for S-units is immediate from the new height formula; the gap theorems themselves wait on Matveev's bound from §3.6.
- **The den/house lower bound (§0.3)** — the last Layer 0 item. The denominator already divides the leading coefficient of the primitive minimal polynomial, which is the natural starting point.
- **Unit equations over ℚ (§2.3)** — nondegenerate solutions and now finitely generated rational S-unit groups are in place. Finiteness needs the p-adic approximation theorem of the same section.

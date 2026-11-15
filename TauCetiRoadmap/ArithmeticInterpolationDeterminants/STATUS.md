<!--tauceti-status:v1 {"roadmap":"ArithmeticInterpolationDeterminants","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"jet evaluation map (0.2), derivative identities through the Frobenius substitution (0.4), ordinary vs Hasse jets (0.5), Frobenius-graph test (0.6)","state":"partial"},{"id":"Layer 1","remaining":"the Hermite jet equivalence hermiteJet_bijective (1.1) and the kernel statement all_jets_vanish_iff_dvd (1.2)","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"48e621759ed22a643cfcf060197b8196de6a8b851f2a4b3b49299b5412375844","roadmap":"ArithmeticInterpolationDeterminants","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ArithmeticInterpolationDeterminants

This file documents the status of the ArithmeticInterpolationDeterminants roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general determinant toolkit is complete: minors under ring maps, ideal divisibility and row changes, size estimates and integral-norm lower bounds (Layers 2–5) are all proved, as is the confluent Vandermonde determinant. What remains is the polynomial side: Hermite interpolation itself and most of the Frobenius substitution have not begun.

### Named results

- **The confluent Vandermonde determinant** — over every commutative ring, the Hasse jet matrix of the monomials at nodes `a i` with multiplicities `m i` has determinant `∏_{i<j} (a j − a i)^(m i · m j)`, with the sign fixed by the lexicographic row order ([`Matrix.det_confluentVandermonde`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/ConfluentVandermonde.html#Matrix.det_confluentVandermonde)).
- **The Gram change-of-family identity** — if `w i = ∑ j, U i j • v j` in a real inner product space then `det (gram w) = (det U)^2 det (gram v)`, with no independence or dimension hypothesis ([`Matrix.det_gram_matrix_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Gram/ChangeOfFamily.html#Matrix.det_gram_matrix_smul)); the complex form carries `‖det U‖^2`.
- **Determinants in products of row ideals** — if row `i` has entries in `J i`, the determinant lies in `∏ J i`, with full-row minor, column and principal forms ([`Matrix.det_mem_prod_row_ideals`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/Determinant/IdealDivisibility.html#Matrix.det_mem_prod_row_ideals)).
- **Derivatives of a product in an ideal power** — if the Hasse derivatives up to order `K` of each of `h` factors evaluate into `J`, those of the product evaluate into `J^h` (Iwaniec–Kowalski, Lemma 11.14) ([`Polynomial.hasseDeriv_prod_mem_ideal_pow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Polynomial/DerivativeIdealPow.html#Polynomial.hasseDeriv_prod_mem_ideal_pow)), with ordinary and multivariate partial-derivative versions.
- **The factorial determinant bound** — for any absolute value, entries of row `i` bounded by `b i` give `abv (det A) ≤ n! ∏ b i` ([`Matrix.abv_det_le_factorial_prod`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/AbsoluteValue.html#Matrix.abv_det_le_factorial_prod)), alongside the classical Hadamard inequality for square matrices.

### Notable definitions and infrastructure

- [`Matrix.confluentVandermonde`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/ConfluentVandermonde.html#Matrix.confluentVandermonde): the jet matrix of the monomials, which turns the jets of any family of polynomials of degree below `∑ m i` into a matrix product. It is the obvious route to the still-missing Hermite equivalence.
- [`MvPolynomial.powerSubstitution`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/MvPolynomial/PowerSubstitution.html#MvPolynomial.powerSubstitution): the substitution `F ↦ F(X, X^B)`, proved injective below `Z`-degree `B` and identified with the Kronecker substitution. The Frobenius statements will be built on it.
- [`Module.Basis.quotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Basis/ExtendedIdeal.html#Module.Basis.quotient): the reduction of a basis modulo an arbitrary extended ideal. With the reduction of coefficient matrices, it moves a jet matrix from a ring of integers to a residue ring.

### Roadmap coverage

Layers 2, 3, 4 and 5 are done. That covers transport and lifting of minors along non-injective ring maps, coefficient matrices over a finite free algebra, ideal divisibility, unitriangular row changes, the Gram identity, derivatives of products in ideal powers, the factorial and Hadamard bounds with their logarithmic forms, the sharp evaluated-Hasse-derivative bound (landed as [`Polynomial.norm_eval_hasseDeriv_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Polynomial/HasseDerivBound.html#Polynomial.norm_eval_hasseDeriv_le) rather than the README's `norm_hasseDeriv_eval_le`), and the norm divisibility, embedding bounds and prime-sum lower bound. Layer 1 is partial: 1.3 (the confluent Vandermonde determinant) is done, but the Hermite jet equivalence (1.1) and the kernel of the jet map (1.2) are absent. Layer 0 is partial: the power substitution (0.3) and the linearity of Hasse derivatives over `X^(p^e)` ([`Polynomial.hasseDeriv_expand_mul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Polynomial/Expand.html#Polynomial.hasseDeriv_expand_mul), 0.3a) are done, and 0.1 has only a little support API. The jet evaluation map (0.2), the derivative identities through the Frobenius substitution (0.4), the ordinary-versus-Hasse comparison (0.5) and the nonvanishing test (0.6) have not landed.

## The frontier

- **The kernel of the jet map (1.2)** — `all_jets_vanish_iff_dvd`: all jets of order below `m i` vanish at the injective nodes `a i` exactly when `∏ (X − a i)^(m i)` divides `f`. This uses Mathlib's Taylor expansion and the pairwise coprimality of the linear factors.
- **Hermite interpolation (1.1)** — `hermiteJet_bijective`, the linear equivalence from `degreeLT K (∑ m i)` to the jet data, with its adapted basis. It needs 1.2, or alternatively the confluent Vandermonde determinant together with its matrix-product formula.
- **Derivatives through the Frobenius substitution (0.4)** — `hasseDeriv_powerSubstitution` and `iterate_derivative_powerSubstitution`, which build on the power substitution and `hasseDeriv_expand_mul`, both already in place.
- **The Frobenius-graph nonvanishing test (0.6)** — the Hasse and ordinary forms. These need 0.4 and the root-count inequality over an arbitrary field, which the README draws from the pinned libraries; the ordinary form also needs the comparison 0.5.
- **The jet evaluation map (0.2)** — the multivariate jet map on `restrictSupport`, with its monomial matrix, kernel and reduction. The entry and row bounds for such matrices are already proved in Layer 4.

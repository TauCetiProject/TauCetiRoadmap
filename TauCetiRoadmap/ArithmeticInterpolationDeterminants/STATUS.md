<!--tauceti-status:v1 {"roadmap":"ArithmeticInterpolationDeterminants","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"701c21a2bfa0199a527e9e327d4498895d02e6d9fa9c8af1712a2aeb5c19e8e9","roadmap":"ArithmeticInterpolationDeterminants","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ArithmeticInterpolationDeterminants

This file documents the status of the ArithmeticInterpolationDeterminants roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every milestone the README sets is now proved. The interpolation theory is done: the Frobenius substitution and its nonvanishing test, Hermite interpolation and the confluent Vandermonde determinant. So is the determinant toolkit: minors under ring maps, ideal divisibility, size bounds and integral-norm lower bounds.

### Named results

- **Hermite interpolation** — for distinct nodes over a field and arbitrary multiplicities `m i`, the map sending a polynomial of degree below `∑ m i` to its Hasse jets of order `k < m i` at the nodes is bijective, and all those jets vanish exactly when `∏ (X − a i)^(m i)` divides the polynomial ([`Polynomial.hermiteJet_bijective`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/HermiteInterpolation.html#Polynomial.hermiteJet_bijective), [`Polynomial.all_jets_vanish_iff_dvd`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/HermiteInterpolation.html#Polynomial.all_jets_vanish_iff_dvd)). A variant holds over commutative rings whose node differences are units.
- **The confluent Vandermonde determinant** — over every commutative ring, the Hasse jet matrix of the monomials has determinant `∏_{i<j} (a j − a i)^(m i · m j)` ([`Matrix.det_confluentVandermonde`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/ConfluentVandermonde.html#Matrix.det_confluentVandermonde)). It is the matrix of the Hermite jet map, and the map is bijective exactly when this determinant is a unit ([`TauCeti.hermiteJet_bijective_iff_isUnit_det`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/ConfluentVandermonde/Hermite.html#TauCeti.hermiteJet_bijective_iff_isUnit_det)).
- **The Frobenius-graph nonvanishing test** — if `F` is nonzero of `Z`-degree below `q = p^e` and `F(X, X^q)` has degree below `#S · (m + 1)`, some Hasse `Z`-jet of order at most `m` is nonzero at a point `(a, a^q)` with `a ∈ S`. This is Iwaniec–Kowalski, Lemmas 11.16–11.17, proved over an integral domain ([`MvPolynomial.exists_nonzero_hasse_jet_on_frobenius_graph`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/PowerSubstitution.html#MvPolynomial.exists_nonzero_hasse_jet_on_frobenius_graph)). The ordinary-derivative form for `0 < e` and `m < p` is [`MvPolynomial.exists_nonzero_ordinary_jet_on_frobenius_graph`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/PowerSubstitution.html#MvPolynomial.exists_nonzero_ordinary_jet_on_frobenius_graph).
- **The Gram change-of-family identity** — if `w i = ∑ j, U i j • v j` in a real inner product space then `det (gram w) = (det U)^2 det (gram v)`, with no independence or dimension hypothesis ([`Matrix.det_gram_matrix_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Gram/ChangeOfFamily.html#Matrix.det_gram_matrix_smul)).
- **The factorial determinant bound** — for any absolute value, if row `i` has entries bounded by `b i`, then `abv (det A) ≤ n! ∏ b i` ([`Matrix.abv_det_le_factorial_prod`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/AbsoluteValue.html#Matrix.abv_det_le_factorial_prod)). It is the upper half of the two-sided estimate, whose lower half is the integral-norm bound of Layer 5.

### Notable definitions and infrastructure

- [`MvPolynomial.jetEval`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/HasseDeriv/JetEvaluation.html#MvPolynomial.jetEval): the multivariate jet evaluation map on polynomials with prescribed support. Its monomial matrix is natural under ring maps, so an interpolation matrix can be moved between a number field, its ring of integers and a residue field.
- [`MvPolynomial.powerSubstitution`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/MvPolynomial/PowerSubstitution.html#MvPolynomial.powerSubstitution): the substitution `F ↦ F(X, X^B)`, which is injective below `Z`-degree `B` and commutes with differentiation below `p^e`. The nonvanishing test is built on it.
- [`Module.Basis.quotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Basis/ExtendedIdeal.html#Module.Basis.quotient): reduces a basis modulo an arbitrary extended ideal. Together with the lifting of minors along non-injective ring maps, it lets the determinant estimates pass through reduction modulo a prime.

### Roadmap coverage

All six layers are done. Layer 0 has the support-restricted polynomial spaces, the jet evaluation map, the power substitution, linearity of Hasse derivatives over `X^(p^e)`, the derivative identities through the substitution, the ordinary-versus-Hasse comparison, and both forms of the nonvanishing test. Layer 1 has the Hermite jet equivalence with its adapted basis, naturality and ordinary-derivative version, the kernel criterion, and the confluent Vandermonde determinant. Layers 2–5 were already complete and are unchanged. One milestone landed under a different name from the README's: the sharp evaluated-Hasse-derivative bound is [`Polynomial.norm_eval_hasseDeriv_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Polynomial/HasseDerivBound.html#Polynomial.norm_eval_hasseDeriv_le) rather than `norm_hasseDeriv_eval_le`.

## The frontier

- **Merging the two Hermite APIs** — Hermite interpolation now exists twice, as `Polynomial.hermiteJet` (with the kernel criterion, over rings whose node differences are units) and as `TauCeti.hermiteJet` (field version, linked to the confluent Vandermonde matrix). Unifying them, or stating one in terms of the other, is cleanup that no milestone requires.
- **Consumers elsewhere** — the roadmap deliberately leaves both particular interpolation matrices and the proof that their determinants are nonzero to the roadmaps that build them. No milestone remains here.

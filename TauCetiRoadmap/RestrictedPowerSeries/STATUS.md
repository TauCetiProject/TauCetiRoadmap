<!--tauceti-status:v1 {"roadmap":"RestrictedPowerSeries","to_sha":"cc3d57936a61e4525c9a9a66ea0d2cd1b9a3a11a","ts":"2026-10-27T20:01:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"bounded-lift coefficient quotients and their quotient topology","state":"partial"},{"id":"Layer 1","remaining":"full module Gauss norms, completeness and iteration; polynomial completion compatibility","state":"partial"},{"id":"Layer 2","remaining":"finite-extension maximum modulus, module-valued coefficient recovery and analytic chain/Taylor interfaces","state":"partial"},{"id":"Layer 3","remaining":"reduction compatibility with coefficient maps and integral-point evaluation","state":"partial"},{"id":"Layer 4","remaining":"several-variable preparation and full norm, naturality and reindexing interfaces","state":"partial"},{"id":"Layer 5","remaining":"Jacobson and dimension theory, maximal-ideal structure and strict finite-module presentations","state":"partial"},{"id":"Layer 6","remaining":"confirm normed/completed, adic reduction and finite-presentation comparison coverage","state":"unassessed"},{"id":"Layer 7","remaining":"entire Gauss topology and radius-controlled open-disc and overconvergent analytic comparisons","state":"partial"}],"readme_sha":"fb7ebaa755523b8c246a9ed4e2b3b75d6af71d7ed68191679fdcfa3057a3f6b2","roadmap":"RestrictedPowerSeries","to_sha":"cc3d57936a61e4525c9a9a66ea0d2cd1b9a3a11a"}-->
# Status: RestrictedPowerSeries

This file documents the status of the RestrictedPowerSeries roadmap up until `cc3d579` (2026-10-27T20:01:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The main one-variable Banach-ring Weierstrass theorems are proved, alongside factoriality of finite-variable Tate algebras and substantial entire-series algebra. The broader layers remain partial; the topological and adic comparison layer cannot be assessed from the supplied declaration record.

### Named results

- **[Weierstrass division over Banach rings](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Division.html#TauCeti.PowerSeries.IsMulDistinguished.existsUnique_mul_add_eq)** — At every positive radius, a multiplicatively distinguished divisor gives a unique restricted quotient and a polynomial remainder of smaller degree over a complete ultrametric normed commutative ring.
- **[Weierstrass preparation over Banach rings](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Preparation.html#TauCeti.PowerSeries.IsMulDistinguished.existsUnique_isNormMulUnit_isMonicOfDegree_mul_eq)** — Such a divisor factors uniquely as a multiplicative unit times a monic polynomial of the distinguished degree, whose Gauss norm is the radius raised to that degree.
- **[Unique factorisation for Tate algebras](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/UniqueFactorization.html#TauCeti.MvPowerSeries.uniqueFactorizationMonoid)** — The unit-radius Tate algebra in finitely many variables over a complete nonarchimedean field is a unique factorisation domain.
- **[Strassmann’s theorem](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Strassmann.html#TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le)** — The greatest index attaining the radius-dependent Gauss norm bounds the number of distinct zeros in the closed ball, including in complete normed field extensions.
- **[Entire polynomial division](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Entire/Division.html#TauCeti.PowerSeries.existsUnique_entire_mul_add_eq)** — Over a complete ultrametric norm-one ring, division by a polynomial with invertible leading coefficient gives a unique entire quotient and a polynomial remainder of smaller degree.

### Notable definitions and infrastructure

- **[Restricted coefficient families](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Module.html#TauCeti.MvPowerSeries.IsRestrictedFamily)** support module-valued coefficients, convolution by scalar series and bounded coefficient maps; the [unit-radius coefficient isometry](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Coefficients.html#TauCeti.MvPowerSeries.restrictedCoeffLinearIsometryEquiv) identifies scalar restricted series with coefficient families vanishing at infinity.
- **[Analytic substitution](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/AnalyticSubst.html#TauCeti.MvPowerSeries.restrictedAnalyticSubst)** uses convergent monomial sums under the Gauss-norm bounds, allowing nonzero constant terms in the inner series.
- **[The monic entire resultant](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Entire/Resultant.html#Polynomial.entireResultant)** is the determinant of multiplication by the entire remainder in the polynomial quotient, providing a finite algebraic setting for Bézout arguments.

### Roadmap coverage

Layers 0–1 are partial: coefficient modules, radius maps and scalar iteration are available, but bounded-lift quotients and the full module norm and iteration interfaces are not established. Layer 2 is partial despite evaluation, substitution, Hasse derivatives and zero bounds; maximum modulus and module-valued coefficient recovery remain unestablished. Layer 3 has units and integral reduction, with reduction naturality still unestablished. Layer 4 has one-variable division and preparation, and several-variable division; several-variable preparation and full naturality remain unestablished. Layer 5 has factoriality and finite radius presentations, but the Jacobson, dimension and strict finite-module conclusions are not established. Layer 6 is unassessed. Layer 7 has open-disc topology and entire algebra; entire topology and overconvergent comparisons remain unestablished. The declaration extract is truncated, so these gaps are limits of the evidence.

## The frontier

- **Several-variable preparation.** Obtain the normalised polynomial–unit factorisation over the restricted coefficient algebra, with norm estimates, reindexing and coefficient-map compatibility.
- **Maximum modulus.** Realise the Gauss norm at an integral point over a finite normed field extension; the roadmap requires residue-field separation and finite-extension lemmas.
- **Tate-algebra structure.** Establish the Jacobson property and dimension equal to the number of variables, and supply strict finite-module presentations; the Jacobson argument requires extension-valued points separating nonzero series.
- **Bounded lifts and comparisons.** Prove coefficientwise surjectivity with uniform lifting bounds, then exactness and quotient topology for finite presentations on the compared series carriers; algebraic surjectivity alone is insufficient.
- **Entire and overconvergent topology.** Establish entire completeness and polynomial density for all positive-radius Gauss norms, and the radius-controlled derivative and substitution comparisons with the supplied overconvergent algebra.

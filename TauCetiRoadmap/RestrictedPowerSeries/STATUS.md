<!--tauceti-status:v1 {"roadmap":"RestrictedPowerSeries","to_sha":"a67a65006c07449dcb2ebe1a3a8b6bf6e0b909f8","ts":"2026-11-06T16:03:15Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"density of polynomials with coefficients in a dense subset; rescaled unweighted c0 isometry at general radii","state":"partial"},{"id":"Layer 2","remaining":"maximum modulus over finite extensions (2.4); comparison of evaluation with AdicSpaces topological evaluation","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"5.3 least-norm representatives, complete quotient norms with values in |K|, presentation-independent finite-module topology","state":"partial"},{"id":"Layer 6","remaining":"6.3 compatibility with adic reductions; 6.2 evaluation/iteration compatibility and strong noetherianness identification","state":"partial"},{"id":"Layer 7","remaining":"substitution on open-disc series; derivative comparison along the inclusion of W_n in T_n","state":"partial"}],"readme_sha":"874fb0f571d4b7bdebd0664b99087882801c3ff45e5ea45dcdcfe39533a23ba1","roadmap":"RestrictedPowerSeries","to_sha":"a67a65006c07449dcb2ebe1a3a8b6bf6e0b909f8"}-->
# Status: RestrictedPowerSeries

This file documents the status of the RestrictedPowerSeries roadmap up until `a67a650` (2026-11-06T16:03:15Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Weierstrass theory over Banach rings (Layer 4) and units and reduction (Layer 3) are done. The normed foundations, evaluation, Tate-algebra structure, the topological and adic comparisons, and the open-disc, entire and overconvergent algebras all have substantial pieces in place but are each missing named targets. The comparison with series over adic noetherian rings (§6.3) has not begun.

### Named results

- **Weierstrass division over Banach rings** — a series whose distinguished coefficient is a multiplicative unit divides every restricted series at every positive radius, with unique quotient and polynomial remainder and the sharp norm identity. No multiplicative coefficient norm is assumed ([`IsMulDistinguished.existsUnique_mul_add_eq`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Division.html#TauCeti.PowerSeries.IsMulDistinguished.existsUnique_mul_add_eq)).
- **Weierstrass preparation in several variables** — a series distinguished in one variable over the coefficient Tate algebra in the others factors uniquely as a multiplicative unit times a monic polynomial ([`existsUnique_isNormMulUnit_isMonicOfDegree_mul_eq_of_isMulDistinguished`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Weierstrass/Preparation.html#TauCeti.MvPowerSeries.existsUnique_isNormMulUnit_isMonicOfDegree_mul_eq_of_isMulDistinguished)).
- **Tate algebras are unique factorisation domains** — over every complete nonarchimedean field, with no discreteness or spherical-completeness assumption ([`uniqueFactorizationMonoid`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/UniqueFactorization.html#TauCeti.MvPowerSeries.uniqueFactorizationMonoid)).
- **The Nullstellensatz for Tate algebras** — every maximal ideal of K⟨X₁, …, Xₙ⟩ has residue field finite over K. Together with the Jacobson, regularity and Krull-dimension-n results, this is stated on the completed Huber carrier ([`finite_quotient_of_isMaximal_restrictedMvPowerSeriesCompletion`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/Restricted/TateAlgebra.html#Ideal.finite_quotient_of_isMaximal_restrictedMvPowerSeriesCompletion)).
- **The entire resultant detects coprimality** — for monic P and entire F, Res(P, F) is a unit exactly when P and F are coprime in the ring of entire series, which is the interface Fredholm theory consumes ([`isUnit_entireResultant_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Entire/Resultant.html#Polynomial.isUnit_entireResultant_iff)).

### Notable definitions and infrastructure

- **Multiplicative units and multiplicative distinguishedness** replace a global multiplicative-norm hypothesis by a condition on one coefficient. This is what lets the Weierstrass theory run over coefficient rings with nilpotents ([`IsNormMulUnit`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Monoid/MulUnit.html#TauCeti.IsNormMulUnit), [`IsMulDistinguished`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/MulDistinguished.html#TauCeti.PowerSeries.IsMulDistinguished)).
- **Restricted coefficient families** give module-valued series with a Gauss norm, a convolution action and isometric iteration. They carry the coefficient-recovery theorem on ℤ_pⁿ and the exactness of finite presentations ([`IsRestrictedFamily`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Module/Basic.html#TauCeti.MvPowerSeries.IsRestrictedFamily)).
- **Analytic substitution** as a convergent sum, allowing nonzero constant terms. Translation, affine coordinate changes and overconvergent substitution are all special cases of it, which supplies the coordinate changes later layers need ([`restrictedAnalyticSubst`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/AnalyticSubst.html#TauCeti.MvPowerSeries.restrictedAnalyticSubst)).

### Roadmap coverage

**Done.** Layer 0 is done: coefficient maps with bounded lifts, kernels and quotient maps, and the module-valued construction. Layer 3 is done: Neumann-series units, the unit criterion at arbitrary polyradii, and the reduction T° ⧸ T°° ≃ k̃[X]. Layer 4 is done in one and several variables, with naturality, reindexing and the dual-number check.

**Partial.** Layer 1 has norms, completeness, truncation, radius change, rescaling, the unit-radius c₀ model and isometric iteration. Density of polynomials with coefficients in a dense subset is not established here. Layer 2 has evaluation, substitution, Hasse derivatives, Taylor expansion, [Strassmann's theorem](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Strassmann.html#TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le) and coefficient recovery, but not maximum modulus. Layer 5 has distinguished coordinates, Weierstrass quotients, noetherianity at arbitrary radii, unique factorisation, dimension, maximal ideals, the finite presentation at radii in √|K×| and strict norm-one generators. Least-norm representatives, quotient norms and presentation-independent topologies (§5.3) are still open. Layer 6 has the unit-weight Huber comparison, structure theorems transported to the completed carrier, and exact finite presentations after adjoining variables. Layer 7 has open-disc and entire algebras with their topologies, entire division, resultants and normalised preparation, plus overconvergent substitution.

**Untouched.** §6.3 has not begun.

## The frontier

- **Maximum modulus (§2.4)**: for f ∈ Tₙ, find a point over a finite extension where ‖f(x)‖ = ‖f‖. The reduction of §3.3 that it needs is in place.
- **Strict closedness and quotient norms (§5.3)**: strict generators exist. What remains is least-norm coset representatives, completeness of the quotient norm with values in |K|, and independence of the finite-module topology from the presentation. The last of these also finishes §6.4.
- **Adic noetherian comparisons (§6.3)**: show that the normed comparisons of §6.2 are compatible with the reductions of A{X}. This consumes the AdicSpaces `restricted-power-series-adic` supplier, and nothing for it is visible here.
- **Remaining §6.2 compatibilities**: show that the Gauss/Huber comparisons commute with evaluation and iteration, and identify the transported noetherianity with AdicSpaces' strong noetherianness.
- **Operations on open-disc and overconvergent series (§§7.1, 7.3)**: analytic substitution on the open disc and the derivative comparison along Wₙ → Tₙ are not established in the material here.

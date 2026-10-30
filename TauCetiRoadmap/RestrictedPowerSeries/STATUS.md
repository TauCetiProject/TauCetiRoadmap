<!--tauceti-status:v1 {"roadmap":"RestrictedPowerSeries","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629","ts":"2026-10-27T10:39:33+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"surjectivity of coefficient maps under a uniform lifting bound, kernels and quotient maps; Gauss-norm theory of module-valued families","state":"partial"},{"id":"Layer 1","remaining":"isometric splitting for general disjoint variable sets and its module form; weighted c0 comparison at non-unit radii; polynomial completion","state":"partial"},{"id":"Layer 2","remaining":"maximum modulus at finite-extension points, Banach-module coefficient recovery, affine maps, chain rule, Taylor expansion, noncommutative Hasse derivatives","state":"partial"},{"id":"Layer 3","remaining":"topologically nilpotent ideal of the unit ball; reduction compatibility with valued-field maps and integral-point evaluation","state":"partial"},{"id":"Layer 4","remaining":"several-variable preparation, naturality and reindexing compatibility","state":"partial"},{"id":"Layer 5","remaining":"finite free quotients by Weierstrass polynomials, UFD, Jacobson, Krull dimension, maximal ideals, strict closedness, noetherianity at radii in the divisible hull","state":"partial"},{"id":"Layer 6","state":"unassessed"},{"id":"Layer 7","remaining":"overconvergent series (7.3); completeness and polynomial density of the entire ring; evaluation on the open disc","state":"partial"}],"readme_sha":"fb7ebaa755523b8c246a9ed4e2b3b75d6af71d7ed68191679fdcfa3057a3f6b2","roadmap":"RestrictedPowerSeries","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629"}-->
# Status: RestrictedPowerSeries

This file documents the status of the RestrictedPowerSeries roadmap up until `dd217c4` (2026-10-27T10:39:33+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** One-variable Weierstrass theory over Banach rings (Layer 4 in one variable) is essentially complete, and so is the multiplicative-unit and reduction theory of Layer 3. The normed foundations (Layers 0–2), the entire and open-disc series of Layer 7, and the Tate-algebra structure theory of Layer 5 are all partial, Layer 5 being furthest behind. Nothing here addresses overconvergent series or Layer 6.

### Named results

- **Weierstrass division over a Banach ring** — a series that is multiplicatively distinguished of degree `s` at any positive radius divides every restricted series uniquely, leaving a polynomial remainder of degree below `s`. It needs no multiplicative coefficient norm, and the [quotient and remainder operators](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/DivMod.html#TauCeti.PowerSeries.IsMulDistinguished.weierstrassDiv) satisfy the sharp norm identity (Martin, Prop. 1.27; [`IsMulDistinguished.existsUnique_mul_add_eq`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Division.html#TauCeti.PowerSeries.IsMulDistinguished.existsUnique_mul_add_eq)).
- **Weierstrass preparation over a Banach ring** — such a series is, in exactly one way, a multiplicative unit times a monic polynomial of degree `s` with Gauss norm `r^s` (Martin, Cor. 1.28; [`IsMulDistinguished.existsUnique_isNormMulUnit_isMonicOfDegree_mul_eq`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Preparation.html#TauCeti.PowerSeries.IsMulDistinguished.existsUnique_isNormMulUnit_isMonicOfDegree_mul_eq)).
- **Several-variable Weierstrass division** — the one-variable theorem, applied over the coefficient Tate algebra in the remaining variables, gives unique division with the full norm estimate ([`existsUnique_mul_add_eq_of_isMulDistinguished`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/WeierstrassDivision.html#TauCeti.MvPowerSeries.existsUnique_mul_add_eq_of_isMulDistinguished)).
- **Strassmann's theorem** — over a complete ultrametric field, a restricted series that is distinguished of degree `s` has at most `s` zeros. The identity principle for restricted series follows from it ([`IsDistinguished.encard_setOf_evalAt_eq_zero_le`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Strassmann.html#TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le)).
- **Reduction of the Tate algebra** — coefficient reduction identifies `T°/T°°` with the polynomial ring over the residue field. The power-bounded subring of `K⟨X⟩` is the Gauss unit ball ([`restrictedReductionQuotientEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/UnitBall.html#TauCeti.MvPowerSeries.restrictedReductionQuotientEquiv), [`powerBoundedSubring_eq_unitClosedBall`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/UnitBall.html#TauCeti.MvPowerSeries.powerBoundedSubring_eq_unitClosedBall)).

### Notable definitions and infrastructure

- **Multiplicative units and multiplicative distinguishedness** ([`IsNormMulUnit`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Monoid/MulUnit.html#TauCeti.IsNormMulUnit), [`IsMulDistinguished`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/MulDistinguished.html#TauCeti.PowerSeries.IsMulDistinguished)) — these replace a global multiplicative norm by a condition on the one coefficient that matters. This admits Banach rings with nilpotents.
- **Entire series** ([`IsEntire`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Entire/Basic.html#PowerSeries.IsEntire)) — they come with evaluation in complete normed algebras and unique division by polynomials with invertible leading coefficient. They also have a monic [entire resultant](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Entire/Resultant.html#Polynomial.entireResultant), which is a unit exactly when the pair is coprime, and a unique normalised preparation.
- **Analytic substitution** ([`restrictedAnalyticSubst`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/AnalyticSubst.html#TauCeti.MvPowerSeries.restrictedAnalyticSubst)) — a contractive convergent substitution, characterised as the unique continuous algebra map with given variable images. It agrees with formal substitution where defined and supplies translations and the coordinate changes Layer 5 needs.

### Roadmap coverage

**Layers 3 and 4** are nearly finished.

- Layer 3 has the multiplicative-unit calculus, the Neumann-series unit criterion with its converse at all polyradii, reduction, and the units of `T°`.
- Layer 4 has the multiplication estimate, division with bounded operators, preparation with uniqueness, and naturality under coefficient maps that keep the divisor distinguished. Only the several-variable preparation, naturality and reindexing are missing.

**Layers 0, 1, 2 and 7** are partial.

- Layers 0–1: module-valued restricted families, radius restriction, rescaling, the unit-radius `c₀` isometry and the single-variable split `R⟨X, Y⟩ ≃ R⟨Y⟩⟨X⟩` are in place.
- Layer 2: substitution, translation, Hasse derivatives with their Gauss-norm bound, one-variable evaluation and Strassmann are in place. Maximum modulus, coefficient recovery from Banach modules, the chain rule and Taylor expansion are not.
- Layer 7: open-disc and entire series are well developed. Overconvergent series (§7.3) are untouched.

**Layer 5** is partial. Distinguishing triangular automorphisms and finiteness over `T_n` at radii in the divisible hull exist. Of the structure theory, only one irreducibility lemma for distinguished polynomials has landed: unique factorisation, the Jacobson property, Krull dimension, maximal ideals and strict closedness are all absent.

**Layer 6** is not established by the evidence available here.

## The frontier

- **Several-variable preparation** — apply one-variable preparation over the coefficient Tate algebra through the existing split [`restrictedOptionEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Iterate.html#TauCeti.Huber.restrictedOptionEquiv). Then add naturality and reindexing compatibility.
- **Finite quotients by Weierstrass polynomials (§5.1)** — identify `T_n/(w)` with a free `T_(n-1)`-module on `1, X, …, X^(s-1)`. Division is available; this is the induction step for §5.2.
- **Maximum modulus at finite-extension points (§2.4)** — realise the Gauss norm as a value at a point over a finite extension of `K`, using the reduction theorem above. This is the missing input for the Jacobson criterion.
- **Noetherianity at radii in √|K×| (§5.4)** — finiteness over the unit Tate algebra is proved. What remains is the explicit monomial generators with their norm estimates, and transporting the noetherianity supplied by AdicSpaces.
- **Overconvergent series and the entire-series topology** — §7.3 has not started. The entire ring still lacks the completeness and polynomial density, for the topology of all Gauss norms, that the open-disc ring already has.

<!--tauceti-status:v1 {"roadmap":"NewtonPolygons","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the n squared and ceil(n sqrt 2) checks and the comparison with the Mathlib #38050 segment presentation","state":"partial"},{"id":"Layer 1","remaining":"the additive spectral-norm normalisation on an algebraic closure","state":"partial"},{"id":"Layer 2","remaining":"the first-break criterion and the check on 1 + sum of p^ceil(sqrt n) X^n","state":"partial"},{"id":"Layer 3","remaining":"the spectral-norm algebraic-closure and C_p versions of the root dictionary","state":"partial"},{"id":"Layer 4","remaining":"perturbation stability of the closed-disc, open-disc and sphere zero counts, and the C_p boundary-zero check","state":"partial"},{"id":"Layer 5","remaining":"convergence in complete extensions, the point-radius and C_p norm density, and the worked checks","state":"partial"},{"id":"Layer 6","remaining":"the xi_2 factorisation over Q2(i), the sum X^n check, and the valuation-ring form of the preparation contract","state":"partial"}],"readme_sha":"ae2ed7e6bb489adaf85cc12c7dea3c4ed996089694cdc4d9241e901493d25b78","roadmap":"NewtonPolygons","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: NewtonPolygons

This file documents the status of the NewtonPolygons roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The main theorems are in place. They cover polynomial slopes and roots, the product formula, slope factorisation, exact zero counts on discs, the Weierstrass product for entire series, and the `μ`/`λ` preparation for Iwasawa theory. No layer is fully closed yet. The gaps are perturbation stability of zero counts, convergence at points of an extension, the additive spectral-norm normalisation, the valuation-ring form of the Iwasawa contract, and a handful of required worked checks.

### Named results

- **Slopes are negated root valuations**: if a polynomial splits in a valued extension, its finite slopes are the values `-w(α)` over its nonzero roots, with multiplicity ([`Polynomial.newtonSlopes_eq_map_roots_map`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NewtonPolygon/Roots.html#Polynomial.newtonSlopes_eq_map_roots_map)).
- **The product formula**: the Newton polygon of a product is the Minkowski sum of the factors' polygons. This holds for polynomials ([`Polynomial.newtonPolygon_mul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NewtonPolygon/Mul.html#Polynomial.newtonPolygon_mul)) and for entire series ([`PowerSeries.IsEntire.newtonPolygon_mul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NewtonPolygon/Entire.html#PowerSeries.IsEntire.newtonPolygon_mul)).
- **Exact zero counts on a disc**: take a series restricted at `r` and an algebraically closed complete extension. There, the closed disc of radius `r` holds exactly `u_r` zeros counted with multiplicity, the open disc holds `l_r`, and the sphere holds `u_r - l_r` ([`TauCeti.PowerSeries.IsDistinguished.card_zeroMultiset_eq`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/ZeroCount.html#TauCeti.PowerSeries.IsDistinguished.card_zeroMultiset_eq)).
- **The Weierstrass product for entire series**: over an algebraically closed complete field, an entire series with constant coefficient one equals `∏ (1 - X/α)` over its zeros, unconditionally and in every Gauss norm ([`PowerSeries.IsEntire.hasProd_polynomialHom_one_sub_C_inv_mul_X`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Entire/Product.html#PowerSeries.IsEntire.hasProd_polynomialHom_one_sub_C_inv_mul_X)).
- **Weierstrass preparation with a uniformiser power**: over a complete DVR, a nonzero series is `π^μ(f)` times a unit times a distinguished polynomial of degree `λ(f)`, uniquely ([`PowerSeries.exists_pow_mul_distinguished_mul_unit`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/DiscreteValuationRing.html#PowerSeries.exists_pow_mul_distinguished_mul_unit)).

### Notable definitions and infrastructure

- **The lower convex envelope** ([`TauCeti.lowerConvexEnvelope`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Sequence/Envelope.html#TauCeti.lowerConvexEnvelope)) is the greatest convex minorant of a height sequence, defined without reference to coefficients. Its geometry is proved once and reused by every arithmetic polygon.
- **The normalised disc preparation** ([`TauCeti.PowerSeries.IsDiscPreparation`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/DiscPreparation.html#TauCeti.PowerSeries.IsDiscPreparation)) writes `f = P_r U_r` with constant-one factors. As the radius grows, its polynomials converge to an entire series, giving the entire product.
- **The zero multiset** ([`PowerSeries.zeroMultiset`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/ZeroCount.html#PowerSeries.zeroMultiset)) records the zeros of a series on a closed disc, with multiplicity given by the order of the Taylor translate. It agrees with the root multiset of the disc polynomial, so analytic and algebraic multiplicity coincide.

### Roadmap coverage

Every layer is partial; none is untouched.

- **Layer 0** has the full geometry: envelopes, interpolation, faces, Minkowski sums, rational and integer-anchored slope data, and order. It lacks the `n²` and `⌈n√2⌉` checks and the comparison with Mathlib #38050's segment presentation.
- **Layer 1** now includes the rational valuation on [`ℂ_p`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Complex/Valuation.html#PadicComplex.addValuation), with value group `ℚ`, and commensurability for algebraic extensions and completions. The additive spectral-norm normalisation on an algebraic closure is not established here.
- **Layer 2** lacks only the first-break criterion and the check on `1 + Σ p^⌈√n⌉ Xⁿ`.
- **Layer 3** now has [realisability of slope multisets](https://taucetiproject.org/docs/TauCeti/NumberTheory/NewtonPolygon/Realization.html#Polynomial.exists_monic_splits_newtonSlopes_iff), but still lacks the spectral-norm and `ℂ_p` versions of the root dictionary.
- **Layer 4** has disc preparation, the [pure slope factorisation](https://taucetiproject.org/docs/TauCeti/NumberTheory/NewtonPolygon/Factorization.html#Polynomial.existsUnique_isPureSlopeFactorization), analytic multiplicity and all three exact counts. It lacks their stability under perturbation and the `ℂ_p` boundary-zero check.
- **Layer 5** has the intrinsic radius and the whole of entire factorisation (§5.3), but not convergence in extensions (§5.2) or the worked checks.
- **Layer 6** has the [irreducibility criterion](https://taucetiproject.org/docs/TauCeti/NumberTheory/NewtonPolygon/Irreducible.html#Polynomial.irreducible_of_forall_mem_newtonSlopes_eq), the ramification bounds, the abstract complete-DVR preparation and the formal/normed comparison. Its `X^p - p`, `Φ_p(X+1)/p`, `Φ_p` and `p + X + X²` checks are done. It lacks the `ξ₂` factorisation over `ℚ₂(i)`, the `Σ Xⁿ` check, and the valuation-ring form of the preparation contract.

## The frontier

- **Stability of zero counts**: prove that `‖f - g‖_r < ‖f‖_r` preserves the closed-disc, open-disc and sphere counts. The active-index perturbation result of §3.4 and the exact counts are both available.
- **Convergence in extensions**: prove that convergence at a point of norm `r` is equivalent to restrictedness at `r`, and define the point-radius `R_L^{points}`. With the new rational valuation on `ℂ_p`, density of its norms should now be within reach. The discrete strict-inequality example and the Layer 5 checks remain.
- **Spectral-norm normalisation**: give the additive valuation `-log ‖x‖ / log b` on an algebraic closure, then the root dictionary there and its `ℂ_p` specialisation (§§1.3, 3.3).
- **The Iwasawa contract**: state preparation for `O = Valuation.integer (NormedField.valuation K)` as consumed by PadicMeasuresIwasawaAlgebras, and prove the `ξ₂` factorisation over `ℚ₂(i)` and the `Σ Xⁿ` check.
- **Remaining checks**: the Layer 0 examples `n²` and `⌈n√2⌉` with its irrational terminal ray, the #38050 comparison, and the Layer 2 first-break criterion with its `p^⌈√n⌉` example.

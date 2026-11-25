<!--tauceti-status:v1 {"roadmap":"NewtonPolygons","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833","ts":"2026-11-25T15:07:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the polygon subtype, vertices and terminal rays, the infinite-domain trichotomy, integer-indexed faces and raw segment lists","state":"partial"},{"id":"Layer 1","remaining":"the rank-one valuation dictionary, the integer valuation at a uniformiser, and the class-versus-scale comparison","state":"partial"},{"id":"Layer 2","remaining":"the finite-minimum form of the supporting value (2.2) and the X^k shift lemmas for active indices","state":"partial"},{"id":"Layer 3","remaining":"the local product law on a common disc (3.2)","state":"partial"},{"id":"Layer 4","remaining":"the vertex comparison of the disc polynomial with f (4.2), not confirmed in its stated form","state":"partial"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"the Mathlib IsEisensteinAt slope, the X^2 - 9 versus X^2 - 18 check, the local-field ramification index version, and the lambda zero count (6.4)","state":"partial"}],"readme_sha":"86fcbf97341265b794b8a2e87fc4a5d4e16e8b2f81f8e6d34427b4206dc191dd","roadmap":"NewtonPolygons","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833"}-->
# Status: NewtonPolygons

This file documents the status of the NewtonPolygons roadmap up until `522d48f` (2026-11-25T15:07:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All three headline theorems are proved: slope factorisation, exact zero counts on a disc (now also stable under perturbation), and the entire product over zeros. Layer 5 is complete. The other six layers are partial. The rewritten README added targets that are not yet found in the source, mostly in the convex geometry of Layer 0 and the normalisations of Layer 1.

### Named results

- **Slopes are negated root valuations**: if a polynomial splits in a valued extension, its finite slopes are the values `-w(α)` of its nonzero roots, with multiplicity ([`Polynomial.newtonSlopes_eq_map_roots_map`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NewtonPolygon/Roots.html#Polynomial.newtonSlopes_eq_map_roots_map)). Over a complete field this holds in every algebraically closed extension, for the [spectral valuation](https://taucetiproject.org/docs/TauCeti/NumberTheory/NewtonPolygon/Spectral.html#Polynomial.newtonSlopes_eq_map_roots_map_spectralNorm_of_isAlgClosed).
- **The product formula**: the Newton polygon of a product of polynomials, or of entire series, is the Minkowski sum of the factors' polygons ([`Polynomial.newtonPolygon_mul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NewtonPolygon/Mul.html#Polynomial.newtonPolygon_mul)).
- **Exact and stable zero counts on a disc**: in an algebraically closed complete extension, a series restricted at `r` has exactly `u_r` zeros in the closed disc of radius `r`, `l_r` in the open disc and `u_r - l_r` on the sphere ([`TauCeti.PowerSeries.IsDistinguished.card_zeroMultiset_eq`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/ZeroCount.html#TauCeti.PowerSeries.IsDistinguished.card_zeroMultiset_eq)). A perturbation with `‖f - g‖_r < ‖f‖_r` changes none of these counts ([`TauCeti.PowerSeries.card_zeroMultiset_eq_of_gaussNorm_sub_lt`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Perturbation/ZeroCount.html#TauCeti.PowerSeries.card_zeroMultiset_eq_of_gaussNorm_sub_lt)).
- **The Weierstrass product for entire series**: over an algebraically closed complete field, a nonzero entire series is `c Xᵐ` times the unconditional product of `1 - X/α` over its zeros ([`PowerSeries.IsEntire.eq_C_mul_X_pow_mul_tprod_of_order_taylor_eq`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Entire/WeierstrassProduct.html#PowerSeries.IsEntire.eq_C_mul_X_pow_mul_tprod_of_order_taylor_eq)).
- **Convergence is restrictedness**: a series converges at a point of norm `r` in a complete extension exactly when it is restricted at `r` ([`PowerSeries.summable_smul_pow_iff_isRestricted`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Convergence.html#PowerSeries.summable_smul_pow_iff_isRestricted)). So the [pointwise radius](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Convergence.html#PowerSeries.convergenceRadius_eq_radius) equals the intrinsic one over densely normed fields such as `ℂ_p`.

### Notable definitions and infrastructure

- **The lower convex envelope** ([`TauCeti.lowerConvexEnvelope`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Sequence/Envelope.html#TauCeti.lowerConvexEnvelope)) is the greatest convex minorant of a height sequence. It is defined without coefficients, so every arithmetic polygon reuses one geometry.
- **The base-`b` additive valuation of a norm** ([`AddValuation.ofNorm`](https://taucetiproject.org/docs/TauCeti/RingTheory/Valuation/NormNormalization.html#AddValuation.ofNorm)) and its spectral-norm version on algebraic extensions ([`TauCeti.spectralAddValuation`](https://taucetiproject.org/docs/TauCeti/RingTheory/Valuation/Spectral.html#TauCeti.spectralAddValuation)) make polygons over an algebraic closure, or over `ℂ_p`, directly available.
- **The zero multiset** ([`PowerSeries.zeroMultiset`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/ZeroCount.html#PowerSeries.zeroMultiset)) records the zeros of a series on a closed disc, with analytic multiplicity, and agrees with the root multiset of the disc polynomial.

### Roadmap coverage

**Layer 5** is done. Convergence in extensions, the pointwise radius and its comparison with the intrinsic radius have all landed. So have entire factorisation and the worked checks (`Σ p^(n²) Xⁿ`, `Σ p^⌈n/2⌉ Xⁿ`, the `p`-adic exponential). Every other layer is partial:

- **Layer 0** has the envelopes, faces, slope presentations, integer anchors and the `n²`, `-n²`, alternating and `⌈n√2⌉` examples. Still missing: the subtype of polygons with its lattice structure, the vertex walk and terminal rays (§0.2), the infinite-domain trichotomy (§0.3), faces of integer-indexed sequences (§0.5), and raw segment lists (§0.6).
- **Layer 1** has the norm and spectral-norm valuations, commensurability, `ℂ_p`, and the integral normalisation in finite extensions. Not found in the source: the rank-one valuation dictionary, the integer valuation at a uniformiser, and the class-versus-scale comparison.
- **Layer 2** has first breaks, faces from active indices and the boundary check. The §2.2 finite-minimum form of the supporting value and the `X^k` shift lemmas are not confirmed.
- **Layer 3** has the root dictionary in every form, ball counts and realisability, but not the local product law on a common disc (§3.2).
- **Layer 4** now has stable zero counts and the boundary-zero check. The README's vertex comparison of the disc polynomial with `f` (§4.2) is not confirmed under its stated form.
- **Layer 6** has irreducibility and the slope-by-slope factor count. It also has the ramification bounds, the `ξ₂` check, and the valuation-ring preparation needed for Iwasawa theory.

## The frontier

- **Local product law**: show that on a common disc of restrictedness, face endpoints and slope multiplicities of `f g` are the sums for `f` and `g` (§3.2).
- **Eisenstein and local fields in Layer 6**: derive the slope `-1/d` from Mathlib's `Polynomial.IsEisensteinAt`; prove the `X² - 9` versus `X² - 18` check over `ℚ_3`; give the ramification divisibility for `TauCeti.ramificationIndex`; and count the `λ` zeros of a formal preparation in the open unit disc (§6.4).
- **Polygon geometry**: the polygon subtype and lattice (§0.1), vertices and terminal rays (§0.2), the trichotomy for unbounded slopes (§0.3), and raw segment lists matching Mathlib's proposal (§0.6).
- **Valuation dictionary**: the additive valuation of a rank-one valuation, and the integer valuation normalised at a uniformiser (§§1.1–1.2).
- **Supporting values locally**: the finite-minimum form of `S_f` inside the convergence range (§2.2).

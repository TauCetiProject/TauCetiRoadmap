<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"8515c15598f1e25cf1bc1f871628129321d6440c","ts":"2026-10-14T00:44:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 0.5","state":"done"},{"id":"Layer 1","remaining":"the formal logarithm and exponential of the formal group","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"converse directions of Néron–Ogg–Shafarevich, Tamagawa numbers, and the Tate curve's uniformisation L^×/q^ℤ ≅ E_q(L)","state":"partial"},{"id":"Layer 4.5a","state":"done"},{"id":"Layer 4.5b","state":"done"},{"id":"Layer 5","remaining":"the nonabelian H¹ classification of twists (stretch)","state":"partial"},{"id":"Layer 6","remaining":"the rank computation for y² = x³ − x + 1","state":"partial"},{"id":"Layer 7","remaining":"finiteness of Sel_m and its comparison with the explicit étale-algebra 2-Selmer group","state":"partial"},{"id":"Layer 8","remaining":"the implications Szpiro ⟹ abc and abc ⟹ modified Szpiro","state":"partial"}],"readme_sha":"f6859d835c348ad567a40601ade63de60c98574b77e8a62726a0fa7315af7144","roadmap":"EllipticCurves","to_sha":"8515c15598f1e25cf1bc1f871628129321d6440c"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `8515c15` (2026-10-14T00:44:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Mordell–Weil theorem and the whole finite-field layer are proved, including the Hasse bound and rationality of the zeta function. Layers 0, 0.5, 2, 3, 4.5a and 4.5b are complete. Selmer groups and Sha are defined and sit in their exact sequence, but finiteness of the Selmer group, the Tate curve's uniformisation and the converse halves of Néron–Ogg–Shafarevich are still open.

### Named results

- **The Hasse bound** — an elliptic curve over `𝔽_q` satisfies [`(#E(𝔽_q) − (q + 1))² ≤ 4q`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.html#WeierstrassCurve.hasse_bound), with the point at infinity counted. It is proved through the positive-definite degree form on the Frobenius pencil, [`deg(rπ − s) = qr² − a_q rs + s²`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Trace.html#TauCeti.Isogeny.Hom.degree_zsmul_ofIsogeny_baseChangeFrobenius_sub_zsmul_id_eq_frobeniusTrace).
- **Rationality of the zeta function** — `Z(E/𝔽_q, T) = (1 − a_q T + q T²)/((1 − T)(1 − qT))` (`WeierstrassCurve.zetaFunction_eq_mul_inv`, AEC V.2.4). Frobenius satisfies `π² − a_q π + q = 0` and `π + π̂ = a_q`, and the trace recursion for `#E(𝔽_{qⁿ})` follows inside `ℤ[π]` without introducing eigenvalues. The functional equation holds in `ℚ(T)`, and with Hasse it gives the Riemann hypothesis for `E`.
- **The supersingularity criterion over a finite field** — a curve is supersingular exactly when `p ∣ a_q`, equivalently `#E(𝔽_q) ≡ 1 (mod p)`, and over `𝔽_p` with `p ≥ 5` exactly when `#E(𝔽_p) = p + 1` (`WeierstrassCurve.isSupersingular_iff_dvd_frobeniusTrace`, AEC V.4.1).
- **The Mordell–Weil theorem** — the points of an elliptic curve over a number field form a [finitely generated group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point_of_numberField), proved through a [version over Dedekind fraction fields](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point).
- **The determinant of the Tate module is cyclotomic** — for `ℓ` invertible over a separably closed field, `T_ℓ E` is [free of rank 2 over `ℤ_ℓ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.html#WeierstrassCurve.nonempty_linearEquiv_tateModule), and the [determinant of its Galois representation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.html#TauCeti.det_tateModuleGaloisRepresentation) is the cyclotomic character.

### Notable definitions and infrastructure

- **The dual isogeny in general.** Every isogeny has a dual (`TauCeti.Isogeny.dual`), built by factoring it as a separable map after a power of Frobenius. Verschiebung comes with it, and the dual makes the degree an unconditional quadratic form.
- **Point counts as degrees.** Over a separably closed field, [`deg(1 − πⁿ)` is the point count over any degree-`n` extension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/FiniteExtension.html#TauCeti.Isogeny.Hom.degree_one_sub_pow_ofIsogeny_baseChangeFrobenius_eq_pointCount). The zeta function is defined by these degrees and so depends on no chosen field with `qⁿ` elements.
- **Selmer groups and Sha.** `Sel_m(E/K)` and `Ш(E/K)` are defined through general Selmer structures on continuous cohomology (`WeierstrassCurve.selmerGroup`, `WeierstrassCurve.shafarevichTateGroup`), and `0 → E(K)/mE(K) → Sel_m → Ш[m] → 0` is exact. This is the frame that Layer 7's finiteness and the rank computations need.

### Roadmap coverage

Layers 0, 0.5, 2, 3, 4.5a and 4.5b are done. Among them are descent of Vélu curves, field-change functoriality of the Weil pairing, the ordinary endomorphism ring as an order in `ℚ(π)`, semistability through Tate's algorithm, and the `ℚ(√65)` example. Layer 1 lacks only the formal logarithm and exponential. Layer 4 has the reduction filtration `E₁ ⊆ E₀`, potential good reduction, Tate's algorithm with the conductor in all residue characteristics, and one direction of Néron–Ogg–Shafarevich. It lacks the converses, Tamagawa numbers and the Tate curve's uniformisation. Layer 5 lacks only the stretch classification of twists by `H¹`. Layer 6 has `ĥ(φP) = deg φ · ĥ(P)` and injectivity of reduction on torsion, and lacks only the rank of `y² = x³ − x + 1`. Layer 7 lacks finiteness of `Sel_m` and the comparison with the explicit étale-algebra 2-Selmer group. Layer 8 has the Szpiro ratio, the conjecture statements and asymptotic Fermat from Szpiro, and lacks the implications between Szpiro and abc.

## The frontier

- **Finiteness of `Sel_m`.** This needs finiteness of `H¹(G_{K,S}, E[m])`. The explicit 2-Selmer group is already finite, so comparing it with the cohomological `Sel₂` would give the case `m = 2`.
- **The rank of `y² = x³ − x + 1`.** Torsion is trivial and a general 2-descent rank bound exists. What remains is to apply the bound to this curve and exhibit a point of infinite order.
- **The Tate curve's uniformisation.** The coordinate series and their `q^ℤ`-periodicity are in place. Still unproved are that the series satisfy the Weierstrass equation, that they define a homomorphism, and the isomorphism `L^×/q^ℤ ≅ E_q(L)`.
- **Néron–Ogg–Shafarevich, converse directions.** These are unramified `T_ℓ` ⟹ good reduction and finite inertia image ⟹ potential good reduction, together with the `E[N]` criterion. Tamagawa numbers, with `c_v = [E(K) : E₀(K)]`, sit beside them.
- **The formal logarithm.** The formal group law and its torsion are in place, but neither the logarithm nor the exponential is defined.

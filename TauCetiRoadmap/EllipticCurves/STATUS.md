<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"a9e7c03212364b4c7d8f344cedcdb6927ab2045b","ts":"2026-09-06T14:19:49Z"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `a9e7c03` (2026-09-06T14:19:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Mordell–Weil summit is proved, now over Dedekind fraction fields and not only number fields, and the canonical height, Néron–Tate pairing and regulator above it are complete apart from isogeny compatibility. The isogeny layer has degrees, Frobenius, factorisation, `[n]` and the endomorphism monoid, but not the addition that would make it a group; the Weil pairing, the Hasse bound, local arithmetic and the Selmer/Sha layer have not begun.

### Named results

- **The Mordell–Weil theorem** — the rational points form a finitely generated group, [over a number field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point_of_numberField) and, for `y² = f(x)` with `f` monic cubic, [over a Dedekind fraction field with Northcott absolute values](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point).
- **The canonical height** — the height exists, is quadratic, and [vanishes exactly on the torsion points](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.html#WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder), so its pairing is positive definite on the points modulo torsion.
- **The degree of multiplication by `n`** — `[n]` is an isogeny of [degree `n²`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Degree.html#TauCeti.Isogeny.degree_mulByIntIsogeny).
- **The isogeny factorisation theorem** — an isogeny factors uniquely through another exactly when the corresponding pulled-back function fields are nested ([`existsUnique_comp_eq_iff_fieldRange_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Factorisation.html#TauCeti.Isogeny.existsUnique_comp_eq_iff_fieldRange_le)).
- **The Nagell–Lutz theorem** — a nonzero rational torsion point on an integral short Weierstrass equation has integral coordinates, with `y = 0` or `y² ∣ Δ` ([`lutz_nagell`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ShortNagellLutz.html#WeierstrassCurve.lutz_nagell)).

### Notable definitions and infrastructure

- **The endomorphism monoid.** The [hom carrier](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom.html#TauCeti.Isogeny.Hom) is the zero map together with the isogenies, nothing adjoined; the endomorphisms form a monoid with zero and no zero divisors, degree is multiplicative, and the units are the degree-one elements.
- **The fixed-field theorem for translations.** The function field is Galois over the [fixed field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Translation/FixedField.html#WeierstrassCurve.Affine.finrank_translationFixedField) of a finite subgroup of points, of degree its order, and the subgroup is recoverable from that field: the descent-side half of the dual isogeny.
- **The formal group law.** A Weierstrass curve carries a one-dimensional commutative [formal group law](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.html#WeierstrassCurve.formalGroup), the chord addition series being associative over every commutative ring. Only this first of the layer's four formal-group milestones is present.

### Roadmap coverage

Layer 6 is done: Mordell–Weil in both forms, the weak theorem, the naïve-height route, Nagell–Lutz, explicit 2-descent with a rank bound, and the canonical-height milestone except the compatibility `ĥ(φP) = deg φ · ĥ(P)`. Layer 0 has the point–place dictionary, the class-group anchor, and the start of divisor calculus: evaluation of a function on an admissible divisor, and a moving lemma putting a divisor class in general position. Weil reciprocity, the fundamental identity `Σ e·f = [F₁ : F₂]`, and functions with prescribed divisors are absent. Layer 0.5 has functorial base change of coordinate rings, function fields, pullbacks and isogenies, and the translation lane through its fixed-field theorem; Galois descent of function-field maps and of Vélu coefficients has not begun. Layer 1 has degree, separability of the function field, Frobenius and relative Frobenius, factorisation, `[n]` with `deg [n] = n²`, negation, and the hom carrier as a monoid; it lacks the additive group, the degree form, the dual, Verschiebung, Vélu quotients, the invariant differential, and the last three formal-group milestones. Layer 5's quadratic twists are complete for equations and points; split multiplicative reduction and the nonabelian `H¹` stretch are outstanding. Layers 2, 3, 4 and 7 are untouched: no `E[N]` structure, Weil pairing or Tate module; no Hasse bound or zeta function; no reduction filtration, Tate algorithm or Tate curve; no Selmer group or Sha.

## The frontier

- **The degree form on `Hom`.** Addition exists only on coordinate pullbacks, and only where the two tautological points do not cancel. Promoting it to the carrier is what makes `Hom` an additive group and `End` a ring; quadraticity and positive-definiteness of `deg` follow.
- **The dual isogeny.** Both named inputs, the factorisation theorem and the fixed-field theorem, are in place. What remains is base change to the separable closure, descent of the resulting factor to the ground field, and the unpointed induced-place criterion that packages it as an isogeny.
- **The Weil pairing.** Divisor evaluation is built; the pairing still needs a function with divisor `N(P) − N(O)`, Weil reciprocity, independence of the choices, and the dual for `e_N(φP, Q) = e_N(P, φ̂Q)`.
- **The Hasse bound.** Nothing of it is present. It needs `deg (1 − π_q) = #E(𝔽_q)` and Cauchy–Schwarz on the degree form, so it sits behind the first bullet.
- **The formal group over a complete field.** The logarithm and exponential, convergence of `Ê(𝔪)`, and the identification `Ê(𝔪) ≅ E₁(K)` are missing; Layer 4's reduction filtration wants the last of them.

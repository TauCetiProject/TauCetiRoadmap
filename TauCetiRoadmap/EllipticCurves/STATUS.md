<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"94050b6aee7bc349e209c85bf5e2cec3c49420a8","ts":"2026-09-11T22:46:43Z"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `94050b6` (2026-09-11T22:46:43Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Mordell–Weil summit is proved, with the canonical-height package complete except for compatibility with isogenies. Layer 1 now has an additive `Hom` group and substantial invariant-differential calculus, while its quadratic degree form, dual and Vélu quotients remain open; the finite-field layer has begun with point counting and Frobenius trace, but the Hasse bound has not landed, and the Weil-pairing, local-arithmetic and Selmer/Sha layers remain untouched.

### Named results

- **[The Mordell–Weil theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point_of_numberField)** — rational points over a number field form a finitely generated group; a second form covers monic-cubic models over suitable Dedekind fraction fields.
- **[The canonical height](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.html#WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder)** — it is quadratic and vanishes exactly on torsion, yielding a positive-definite Néron–Tate pairing modulo torsion.
- **[The degree of multiplication by `n`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Degree.html#TauCeti.Isogeny.degree_mulByIntIsogeny)** — the multiplication isogeny `[n]` has degree `n²`.
- **[The isogeny factorisation theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Factorisation.html#TauCeti.Isogeny.existsUnique_comp_eq_iff_fieldRange_le)** — one isogeny factors uniquely through another exactly when their pulled-back function fields have the required inclusion.
- **[The differential criterion for separability](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Differential.html#TauCeti.Isogeny.isSeparable_iff_pullbackDifferential_ne_zero)** — an isogeny is separable exactly when its pullback of the invariant differential is nonzero.

### Notable definitions and infrastructure

- **The additive hom group.** Morphisms now form an [additive commutative group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Add.html#TauCeti.Isogeny.Hom.instAddCommGroup), transported through their tautological points; this supplies genuine subtraction and makes `1 − π` an isogeny when nonzero.
- **Adic formal-group points.** The [formal parameter homomorphism](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.html#WeierstrassCurve.formalPointHomAdicCompletion) embeds the formal group into the points over an adic completion, with image characterised by a pole of `x`.
- **Finite-field counting.** The projective [point count](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.html#WeierstrassCurve.pointCount) includes the singular point when present, and the [Frobenius trace](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.html#WeierstrassCurve.frobeniusTrace) packages `q + 1 − #W(F)` without imposing ellipticity on the definition.

### Roadmap coverage

Layer 6 has Mordell–Weil, weak Mordell–Weil, the naïve and canonical heights, Nagell–Lutz and explicit `2`-descent; only canonical-height compatibility with isogenies remains. Layer 0 has the point–place dictionary, class-group anchor and initial divisor calculus, but not the fundamental identity, prescribed divisors or Weil reciprocity. Layer 0.5 reaches functorial base change and the translation fixed-field theorem, not Galois descent. Layer 1 has degrees, Frobenius, factorisation, `[n]`, additive `Hom`, kernels, invariant differentials and an adic-completion form of the formal parametrisation; the quadratic degree form, dual, Vélu quotients, separable-implies-unramified theorem, formal logarithm and exponential are absent. Layer 3 now has its counting conventions and trace, plus separability of `1 − π`, but neither `deg(1 − π) = #E(F)` nor Hasse. Layer 5 has quadratic twists at the level of equations and points, while its split-reduction and nonabelian-cohomology targets remain. Layers 2, 4 and 7 are untouched; no coverage is established here for Layers 4.5a, 4.5b or 8.

## The frontier

- **The quadratic degree form on `Hom`.** The additive group is available; what remains is the parallelogram law, the associated bilinear pairing and positive definiteness.
- **The kernel-degree identity for `1 − π`.** Separability and the bound `#ker ≤ deg` are proved, but equality still needs the separable-implies-unramified fibre count; this is the missing bridge from the new point count to isogeny degree.
- **The Hasse bound.** The trace is now named, but `a_q² ≤ 4q` still awaits the kernel-degree identity and Cauchy–Schwarz for the degree form.
- **The dual isogeny.** Factorisation and the translation fixed-field theorem are in place; base change to the separable closure, Galois descent and the induced-place pointedness argument remain.
- **The Weil pairing.** Its divisor construction still needs prescribed-divisor functions, Weil reciprocity, independence of choices and the dual-isogeny compatibility.

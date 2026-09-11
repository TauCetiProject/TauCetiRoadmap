<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"00381680ab2a0cb970acc235c613906f7811bffc","ts":"2026-09-11T15:17:25Z"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `0038168` (2026-09-11T15:17:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Mordell–Weil summit, canonical height, Néron–Tate pairing and regulator are established, with only isogeny compatibility missing from that height package. The isogeny layer now has an additive hom group and substantial invariant-differential calculus, while the quadratic degree form and dual remain open; the Weil pairing, Hasse bound, reduction theory, and Selmer/Sha layer have not begun.

### Named results

- **The Mordell–Weil theorem** — the rational points form a finitely generated group [over a number field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point_of_numberField), and, for `y² = f(x)` with `f` monic cubic, [over a Dedekind fraction field with Northcott absolute values](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point).
- **The canonical height theorem** — the canonical height is quadratic and [vanishes exactly on torsion points](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.html#WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder), yielding a positive-definite Néron–Tate pairing modulo torsion.
- **The degree theorem for multiplication by `n`** — the multiplication isogeny has [degree `n²`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Degree.html#TauCeti.Isogeny.degree_mulByIntIsogeny).
- **The isogeny factorisation theorem** — an isogeny factors uniquely through another exactly when the corresponding [pulled-back function fields are nested](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Factorisation.html#TauCeti.Isogeny.existsUnique_comp_eq_iff_fieldRange_le).
- **The fixed-field theorem for translations** — the function field has [degree equal to the order of a finite translation subgroup over its fixed field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Translation/FixedField.html#WeierstrassCurve.Affine.finrank_translationFixedField), and the subgroup is recovered from that field.

### Notable definitions and infrastructure

- **The additive hom group.** Morphisms are the zero map together with isogenies, and now carry an [additive commutative group structure](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Add.html#TauCeti.Isogeny.Hom.instAddCommGroup) defined through their tautological points; composition is additive in the outer morphism.
- **The invariant differential calculus.** The invariant differential is a [basis of the one-dimensional differential module](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.html#WeierstrassCurve.Affine.invariantDifferentialBasis), and pullback along an isogeny [detects separability](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Differential.html#TauCeti.Isogeny.isSeparable_iff_pullbackDifferential_ne_zero) and respects addition.
- **Adic formal-group points.** Parameters in an adic ideal form a [formal-group point group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/AdicPoint.html#WeierstrassCurve.FormalGroupPoint) whose map into the curve over an adic completion has [exactly the pole-at-infinity subgroup as its range](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Range.html#WeierstrassCurve.range_formalPointHomAdicCompletion).

### Roadmap coverage

- **Layer 6** has Mordell–Weil in both stated settings, weak Mordell–Weil, the naïve-height argument, Nagell–Lutz, explicit 2-descent and the canonical-height package; only `ĥ(φP) = deg φ · ĥ(P)` is missing from the latter.
- **Layers 0 and 0.5 are partial:** the point–place dictionary, class-group anchor, divisor evaluation, moving lemma, base change, translations and their fixed-field theorem are present; the fundamental identity, Weil reciprocity, prescribed divisors, and both descent milestones are absent.
- **Layer 1 is partial:** degree, Frobenius and relative Frobenius, factorisation, `[n]`, the additive hom group, invariant differentials, and evaluated adic formal-group points are present. The degree form, dual, Verschiebung, Vélu quotients, separable-implies-unramified theorem, formal logarithm and exponential, and the reduction-kernel equivalence are missing.
- **Layer 5** has quadratic twists at the level of equations and points, but not split multiplicative reduction or the nonabelian `H¹` stretch. Layers 2, 3, 4 and 7 remain untouched, and no milestone is established for Layers 4.5a, 4.5b or 8.

## The frontier

- **The degree form on `Hom`.** The additive group is now in place; what remains is quadraticity of degree, the parallelogram law, the associated bilinear pairing, and its positive-definiteness.
- **The Hasse bound.** The isogeny `1 − π` exists and is separable, but `deg(1 − π) = #E(𝔽_q)` and Cauchy–Schwarz for the degree form are still missing.
- **The dual isogeny.** Factorisation, the translation fixed-field theorem, and the infinity-place pointedness criterion are available; descent from the separable closure and the inseparable Frobenius case remain.
- **The Weil pairing.** Divisor evaluation and moving are present, but a function with divisor `N(P) − N(O)`, Weil reciprocity, choice-independence, the torsion structure theorem, and the dual-isogeny compatibility are not.
- **The reduction kernel.** The adic formal group maps injectively onto the pole-at-infinity subgroup; formal logarithms and exponentials and the identification of that subgroup with `E₁(K)` via reduction remain to be built.

<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"d834065379fd7ceac1e705134b110ee5861d7dee","ts":"2026-09-19T10:39:05Z"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `d834065` (2026-09-19T10:39:05Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Mordell–Weil summit is proved, over Dedekind fraction fields as well as number fields, with the canonical height and regulator above it. The finite-field lane has `deg (1 − π_q) = #E(𝔽_q)` but not the Hasse bound, and there is a dual isogeny only where the kernel counts the degree. The reduction filtration, Tate's algorithm, the Weil pairing and Selmer/Sha have not begun.

### Named results

- **The Mordell–Weil theorem** — the rational points form a finitely generated group, [over a number field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point_of_numberField) and, for `y² = f(x)` with `f` monic cubic, [over a Dedekind fraction field with Northcott absolute values](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point).
- **The point count as a degree** — the number of rational points over a finite field [is the degree of `1 − π_q`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/OneSubFrobenius/Degree.html#TauCeti.Isogeny.degree_oneSubFrobeniusIsogeny_eq_pointCount), which earns the Frobenius trace its name.
- **The dual isogeny** — when the kernel of `φ` has `deg φ` points, `[deg φ]` [factors through `φ` by a unique isogeny](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Dual/Basic.html#TauCeti.Isogeny.existsUnique_comp_eq_mulByIntIsogenyOfNeZero_degree) of the same degree — so far only for `1 − π_q`, the one isogeny with a dual.
- **The structure of the `ℓ`-torsion** — `E[ℓ]` is [isomorphic to `(ℤ/ℓ)²`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/TorsionRank.html#TauCeti.Isogeny.nonempty_linearEquiv_ker_mulByPrimeIsogeny) for a prime `ℓ` invertible in an algebraically closed base field, not yet a separably closed one.
- **The canonical height** — quadratic, and [vanishing exactly on the torsion points](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.html#WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder), so its pairing is positive definite modulo torsion.

### Notable definitions and infrastructure

- **The points as degree-zero divisor classes.** A point is [the class of `(P) − (O)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Divisor/Class.html#WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass), inverted by the [sum of a degree-zero divisor](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Divisor/Sum.html#WeierstrassCurve.Affine.divisorSum), which vanishes exactly on the principal divisors: the dictionary the Weil pairing runs on.
- **The additive group of morphisms.** [`Hom(W₁, W₂)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Add.html#TauCeti.Isogeny.Hom.instAddCommGroup) is an additive group on which degree is [quadratic under integer multiples](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Hom.html#TauCeti.Isogeny.Hom.degree_zsmul). Composition is additive in the outer variable only, so `End` is not yet a ring.
- **The minimal-pair model over `ℚ`.** Every elliptic curve over `ℚ` has a [unique](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MinimalPairModel.html#WeierstrassCurve.minimalPairModel_unique) short integral equation in minimal-pair form, whose height is the [naïve height of the curve](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MinimalPairModel.html#WeierstrassCurve.naiveHeight), the ordering a curve table uses; only finitely many have bounded height.

### Roadmap coverage

Layer 6 is done except `ĥ(φP) = deg φ · ĥ(P)`. Layer 0 has the point–place dictionary, points as degree-zero divisor classes, and divisor evaluation and pullback, but not Weil reciprocity; Layer 0.5 lacks Galois descent. Layer 1 has degree, Frobenius, factorisation in both forms, `[n]` with `deg [n] = n²` and its separability criterion, the morphism group, kernels and the invariant differential; it lacks the quadratic degree form, a ring on `End`, separable-implies-unramified, the unconditional dual, Verschiebung and Vélu quotients. The formal group has its law and its points, not its logarithm. Layer 2 has the `ℓ`-torsion structure over an algebraically closed base and a function with divisor `n(T) − n(O)`, nothing else. Layer 3 has the degree identity, the comparison of the two point counts and the bad-reduction trichotomy for the trace, but not the Hasse bound, the ordinary/supersingular dichotomy or the zeta function. Layer 4.5a has global and semi-global minimality and the local minimal discriminant with its valuation, but no minimal discriminant ideal or Weierstrass class; Layer 8 has the minimal-pair model and height alone; Layer 5's quadratic twists are complete, its nonabelian `H¹` stretch not; and Layers 4, 4.5b and 7 are untouched.

## The frontier

- **The Hasse bound.** The point count is a degree; what remains is the degree form on `Hom` — the parallelogram law, bilinearity of `deg (φ + ψ) − deg φ − deg ψ`, and Cauchy–Schwarz on it, whose missing input is additivity of composition in the inner variable — which would also make `End` a ring.
- **The dual isogeny in general.** The conditional construction needs only `#ker φ = deg φ` for separable `φ`: the separable-implies-unramified milestone with the `Σ e · f = deg` identity.
- **The Weil pairing.** Divisor evaluation, the moving lemma and a function with divisor `n(T) − n(O)` are present; what is left is Weil reciprocity `f(div g) = g(div f)` and independence of the choices.
- **`Ê(𝔪) ≅ E₁(K)` and the reduction filtration.** The formal group's points map onto the points whose `x` has a pole; identifying those with the kernel of reduction needs a reduction map on points over a DVR, still absent.
- **Global minimality over a number field.** Local minimal discriminants exist prime by prime; the minimal discriminant ideal, the Weierstrass class, and the coefficient patching that produces one global equation are all still to come.

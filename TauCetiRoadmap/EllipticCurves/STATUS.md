<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"f5c212ce5e63da2f726a1ecac5169722f0807981","ts":"2026-08-30T22:49:04Z"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `f5c212c` (2026-08-30T22:49:04Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Mordell–Weil summit is proved over number fields, including its weak-descent and naïve-height inputs. The function-field and isogeny layers are substantial but incomplete; the Weil pairing, Hasse bound, local-field theory, and cohomological Selmer/Sha layer have not been established.

### Named results

- **The Mordell–Weil theorem** — for an elliptic curve over a number field, the group of rational points is finitely generated ([`fg_point_of_numberField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point_of_numberField)).
- **The weak Mordell–Weil theorem** — for the stated normal form over a Dedekind fraction field, the rational points modulo doubling are finite under finite-class-group and finitely-generated-unit hypotheses on the cubic factors ([`finiteIndex_range_nsmulAddMonoidHom_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/WeakMordellWeil.html#WeierstrassCurve.Affine.finiteIndex_range_nsmulAddMonoidHom_two)).
- **The isogeny factorisation theorem** — an isogeny factors uniquely through another exactly when the corresponding pulled-back function fields are nested ([`existsUnique_comp_eq_iff_fieldRange_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Factorisation.html#TauCeti.Isogeny.existsUnique_comp_eq_iff_fieldRange_le)).
- **Classification of the forms of an elliptic curve split by a quadratic extension** — away from `j = 0, 1728`, a curve becoming isomorphic to `E` over the extension is already isomorphic over the base either to `E` or to its quadratic twist ([`exists_smul_eq_or_exists_smul_eq_quadraticTwist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.html#WeierstrassCurve.exists_smul_eq_or_exists_smul_eq_quadraticTwist)).
- **The Nagell–Lutz theorem** — a nonzero rational torsion point on an integral short Weierstrass equation has integral coordinates, with its `y`-coordinate zero or its square dividing the discriminant ([`lutz_nagell`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ShortNagellLutz.html#WeierstrassCurve.lutz_nagell)).

### Notable definitions and infrastructure

- **The point–place dictionary** identifies rational points with degree-one normalized places, completing that part of the function-field dictionary and distinguishing the affine places from infinity ([`pointEquivDegreeOnePlace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/PointPlace.html#WeierstrassCurve.Affine.pointEquivDegreeOnePlace)).
- **The point–class equivalence** upgrades Mathlib's injection to an equivalence with the affine coordinate ring's ideal class group, providing the class-group anchor needed by induced point maps ([`toClassEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/ToClass.html#WeierstrassCurve.Affine.Point.toClassEquiv)).
- **The naïve height on points** has Northcott finiteness and the approximate parallelogram law, which are the height inputs used to pass from weak Mordell–Weil to finite generation ([`naiveHeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/NaiveHeight.html#WeierstrassCurve.Affine.Point.naiveHeight)).

### Roadmap coverage

Layer 6's main Mordell–Weil theorem, weak theorem, naïve-height route and Nagell–Lutz theorem are done; explicit 2-descent has local conditions and rank-bound machinery, while the canonical height and regulator are absent. Layer 5's concrete quadratic twists now include the point isomorphism and its Galois equivariance, but the split-multiplicative-reduction theorem and the general nonabelian `H¹` stretch remain. Layers 0 and 0.5 have the point–place and point–class equivalences and function-field translations, but no divisor calculus, fundamental identity, or general descent package. Layer 1 has degree, separability, Frobenius, relative Frobenius and factorisation, with multiplication pullbacks only partial; it still lacks the hom-group, quadratic degree form, dual, Vélu quotients and a complete elliptic formal group. Layers 2, 3, 4 and 7 remain essentially untouched beyond prerequisites: there is no Weil pairing or Tate module, Hasse bound, reduction filtration/Tate algorithm/Tate curve, or cohomological Selmer group and Sha.

## The frontier

- **The Hasse bound.** Prove the quadratic degree theory for the isogeny hom-group and identify `deg (1 - π_q)` with the number of finite-field points; the inequality itself is not present.
- **The dual isogeny.** Complete multiplication isogenies, then use the factorisation theorem together with the fixed-field theorem for translations and descent to construct the dual and its two degree identities.
- **The Weil pairing.** Build divisors and principal-divisor calculus on the function field, then use the dual isogeny to obtain the pairing and its isogeny compatibility.
- **The canonical height.** Construct the Néron–Tate height and pairing from the finished naïve-height theory, including vanishing exactly on torsion, isogeny compatibility and the regulator.
- **Local arithmetic.** The `E₁ ⊆ E₀ ⊆ E` filtration, Tate's algorithm and the Tate curve still need their point-level foundations; the Tate-curve strand also retains the roadmap's rank-one valuation refactor prerequisite.

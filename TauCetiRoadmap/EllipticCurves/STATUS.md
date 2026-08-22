<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"7fbbcda7a64ac5557281d0c3c47cf7fd8aa36d7a","ts":"2026-08-21T21:59:44+00:00"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `7fbbcda` (2026-08-21T21:59:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete. The opening function-field theory of isogenies and the concrete quadratic-twist theory are now substantial; Layers 0, 0.5, 3, 4, and 6 remain partial, while the central constructions of the Weil-pairing/Tate-module layer and the Selmer/Sha layer have not begun.

### Named results

- **Multiplicativity of isogeny degree** — every isogeny has finite positive degree, and the degree of a composite is the product of the degrees ([`TauCeti.Isogeny.degree_comp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.html#TauCeti.Isogeny.degree_comp)).
- **The Frobenius isogenies** — finite-field Frobenius is purely inseparable of degree `q`, while relative Frobenius to the Frobenius twist is purely inseparable of degree `p` ([`degree_frobeniusIsogeny`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius.html#TauCeti.Isogeny.degree_frobeniusIsogeny), [`degree_relativeFrobeniusIsogeny`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/RelativeFrobenius.html#TauCeti.Isogeny.degree_relativeFrobeniusIsogeny)).
- **Uniqueness of the place at infinity** — a place of the function field, trivial on the base field, is the infinity place exactly when `x` has a pole there ([`isEquiv_infinityPlace_of_one_lt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/InfinityPlace/Unique.html#WeierstrassCurve.Affine.isEquiv_infinityPlace_of_one_lt)).
- **Classification of the forms split by a quadratic extension** — when `j(E) ∉ {0, 1728}`, a form split by a separable quadratic extension is already isomorphic over the base field to `E` or to its quadratic twist ([`exists_smul_eq_or_exists_smul_eq_quadraticTwist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.html#WeierstrassCurve.exists_smul_eq_or_exists_smul_eq_quadraticTwist)).
- **Galois anti-equivariance of quadratic twists** — over every field containing the quadratic extension, the point-group equivalence intertwines Galois action with multiplication by the quadratic character ([`quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.html#WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map)).

### Notable definitions and infrastructure

- **The isogeny** ([`TauCeti.Isogeny`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.html#TauCeti.Isogeny)) is a coordinate-ring pullback with integrality encoding preservation of infinity; composition, degree, and separability now form a usable first API.
- **The intermediate ring** ([`TauCeti.Isogeny.intermediateRing`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/IntermediateRing/Basic.html#TauCeti.Isogeny.intermediateRing)) is the integral closure through which both coordinate rings embed, preparing the relative-norm construction of the point map; module-finiteness currently requires a separable isogeny.
- **The universal pointed curve** ([`WeierstrassCurve.Universal.pointedCurve`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Universal.html#WeierstrassCurve.Universal.pointedCurve)) supports universal division-polynomial calculations, including candidate [`smulX`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.html#WeierstrassCurve.Universal.Affine.smulX) and [`smulY`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.html#WeierstrassCurve.Universal.Affine.smulY) coordinates for `[n]`.

### Roadmap coverage

Layers 0 and 0.5 have the coordinate/function-field foundation, the two known families of places, uniqueness of infinity, base-change and quadratic-descent results, but not the divisor calculus, point–place bijection, translations, or general descent. Layer 1 has composition, finite degree and its separability theory, absolute and relative Frobenius, and part of the intermediate-ring construction; the induced point map, `[n]`, iterated Frobenius factorisation, hom-group, degree form, dual, Vélu, invariant differential, and formal group remain. Layer 3 has finite point sets, Frobenius, and supporting quadratic-form algebra, not the Hasse bound. Layer 4 has node-polynomial and minimal-model invariance lemmas, not the reduction filtration, Tate’s algorithm, or Tate curve. Layer 5 has the equation-level twists, the special `j`-range classification, and the point equivalence, but not the split-reduction theorem or general nonabelian classification. Layer 6 has `S`-integer arithmetic, integrality and division-polynomial support, but neither heights nor Mordell–Weil. Layer 2 has generic divisor-class support but none of its torsion, Weil-pairing, or Tate-module milestones; Layer 7’s Selmer and Sha constructions are absent.

## The frontier

- **The induced point map.** Prove surjectivity of `Point.toClass`, extend module-finiteness of the intermediate ring beyond the separable case, and assemble `pushClass` and `toPointHom` from extension and relative norm.
- **Integer multiplication and the hom-group.** Identify the universal `smulX` and `smulY` functions with scalar multiplication, package `[n]` as an isogeny for `n ≠ 0`, prove degree `n²`, and construct the additive hom-group and its quadratic degree form.
- **Divisors and the Weil pairing.** Complete induced places, the fundamental identity, the point–place bijection and principal-divisor calculus; the divisor construction and Weil reciprocity are then the prerequisites for Layer 2.
- **The Hasse bound.** Frobenius and its degree are available, but `deg(1 − π_q) = #E(𝔽_q)` and the positive quadratic degree form needed for `a_q² ≤ 4q` are not.
- **Split reduction after quadratic twisting.** Show that a nonsplit multiplicative curve acquires split multiplicative reduction after its separable quadratic twist; the node-polynomial transformation and minimal-model invariance are already available.

<!--tauceti-status:v1 {"roadmap":"ModularCurves","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0B fppf quotients, exactness, killed-by-rank; 0C torsors and free quotients; 0A divisor theorems; 0D-0G","state":"partial"},{"id":"Layer 1","remaining":"smoothness and base change of the Weierstrass model, EllipticCurveGeom, pole sheaves, scheme group law, descent","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"b87d5fcb9f123ffaecf21e174129ecce49a8d2c70680f89527399216f86fa735","roadmap":"ModularCurves","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: ModularCurves

This file documents the status of the ModularCurves roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the foundations exist so far. Over an affine base, Cartier duality for finite locally free commutative group schemes is done. Affine quotients by finite groups are done, and the projective Weierstrass model exists and is proper. Layer 1 has not yet reached an elliptic curve over a scheme, and nothing from isogenies onward (Layers 2–10) has begun.

### Named results

- **Cartier duality of constant and diagonalizable groups.** Over any commutative ring, the dual of the constant group on a finite abelian `G` is `D(G)`, and the dual of `D(G)` is the constant group, with no condition on `|G|`. This specialises to `(ℤ/Nℤ)ᴰ ≅ μ_N` ([`ConstantGroup.cartierDualIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/Constant.html#TauCeti.ConstantGroup.cartierDualIso), [`DiagonalizableGroup.cartierDualIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/Constant.html#TauCeti.DiagonalizableGroup.cartierDualIso)).
- **Cartier duality preserves rank.** A finite locally free commutative group scheme and its dual have the same rank at every point of the base, so the rank may vary across components ([`finrank_cartierDual`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/Rank.html#TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.finrank_cartierDual)).
- **Kernels commute with base change.** The kernel of any homomorphism of group schemes over any base is the fibre over the identity, and taking it commutes with arbitrary base change ([`kernelBaseChangeIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/GroupScheme/Kernel.html#TauCeti.GroupScheme.kernelBaseChangeIso)).
- **Fibres of the invariant quotient are orbits.** For a finite group acting on `Spec A`, two points have the same image in `Spec A^G` exactly when they lie in the same orbit ([`projection_eq_iff_exists_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.html#TauCeti.AffineInvariantQuotient.projection_eq_iff_exists_smul)).
- **Properness of the Weierstrass model.** The projective cubic of any Weierstrass curve is proper over its base, with no ellipticity hypothesis ([`isProper_projModelOver`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.html#WeierstrassCurve.isProper_projModelOver)).

### Notable definitions and infrastructure

- **The Cartier duality anti-equivalence** `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, over an affine base. It is transported from finite projective bicommutative Hopf algebras and includes biduality and base change. Every 0B duality statement above is stated through it.
- **The affine invariant quotient** [`AffineInvariantQuotient.quotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Quotient/Affine.html#TauCeti.AffineInvariantQuotient.quotient). It has a [universal property for affine targets](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Quotient/Affine.html#TauCeti.AffineInvariantQuotient.existsUnique_desc), and its projection is finite under the roadmap's finite-type hypothesis. It is the affine building block for the later Katz–Mazur quotients and coarse moduli.
- **The projective Weierstrass model** [`projModel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.html#WeierstrassCurve.projModel), built as the `Proj` of the graded homogeneous coordinate ring, with zero section `[0:1:0]`. It is the local model that `EllipticCurveGeom` will be defined against.

### Roadmap coverage

**Layer 0 is partial.**
- **0B** is mostly done over an affine base: the anti-equivalence, biduality, base change, rank, the constant and `μ_N` dualities, and kernels with base change. It lacks fppf quotients by a subgroup, exactness of duality, and the theorem that a rank-`N` group is killed by `N`.
- **0C** has only its first item, affine quotients, and the universal property there covers affine targets only.
- **0A** has the relative effective Cartier condition and its stability under base change, but none of its numbered theorems.
- **0D–0G** were not assessed here.

**Layer 1 is partial.** Only part of 1A exists: the model, its properness and its zero section.

**Layers 2–10 are untouched.** The equation-level isogeny and Weil-pairing work elsewhere in the library belongs to the Elliptic Curves roadmap and is not this roadmap's scheme-theoretic Layer 2.

## The frontier

- **Smoothness of the projective model (1A).** Remaining: relative dimension one when `W.IsElliptic`, compatibility with base change and `VariableChange`, and then the definition of `EllipticCurveGeom`. Nothing else blocks this.
- **Killed by its rank (0B).** A finite locally free commutative group scheme of rank `N` is killed by `N`. Layer 3 needs this to turn Drinfeld points into torsion sections.
- **Section divisors and finiteness (0A).** Remaining: the divisor `[P]` of a section, sums and flat pullback, and finite-iff-proper with degree as rank. Layer 1C's pole sheaves need these first.
- **Torsors and free quotients (0C, items 2–3).** Remaining: the Hopf–Galois criterion and the affine case of SGA 3 V 4.1. These also supply the fppf quotient that 0B still needs.
- **Duality off an affine base (0B).** Cartier duality is stated only over `Spec R`. A version over arbitrary `S`, by gluing or descent, needs Layer 0E.

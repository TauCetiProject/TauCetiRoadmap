<!--tauceti-status:v1 {"roadmap":"ModularCurves","to_sha":"87cb0c10c64f78bfeef43f2134bfd36dc8337e4d","ts":"2026-10-07T07:12:28Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0B fppf quotients and exactness; 0C torsors and free quotients; 0A divisor theorems; 0F special cases off affine base; 0D, 0E, 0G","state":"partial"},{"id":"Layer 1","remaining":"base-change functoriality; 1B over general bases; 1C pole sheaves and classification; 1D group axioms; 1E descent","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"b87d5fcb9f123ffaecf21e174129ecce49a8d2c70680f89527399216f86fa735","roadmap":"ModularCurves","to_sha":"87cb0c10c64f78bfeef43f2134bfd36dc8337e4d"}-->
# Status: ModularCurves

This file documents the status of the ModularCurves roadmap up until `87cb0c1` (2026-10-07T07:12:28Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations are taking shape, but no summit is in reach yet. Layer 0's finite group schemes are done over an affine base except for fppf quotients. Layer 1 has a smooth, proper Weierstrass model, elliptic curves over a scheme, and an addition morphism, but no group law yet. Layers 2–10 have not begun.

### Named results

- **Deligne's theorem** — a finite locally free commutative group scheme of constant rank `n` is killed by `n`. It is stated for a commutative, cocommutative Hopf algebra that is finite projective over the base ring ([`convPow_eq_one_of_rankAtStalk`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/KilledByRank.html#TauCeti.AlgHom.convPow_eq_one_of_rankAtStalk)).
- **Cartier duality of constant and diagonalizable groups** — over any commutative ring, the constant group on a finite abelian `G` and `D(G)` are dual to each other, which gives `(ℤ/Nℤ)ᴰ ≅ μ_N` ([`ConstantGroup.cartierDualIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/Constant.html#TauCeti.ConstantGroup.cartierDualIso)).
- **Kernels commute with base change** — over any base, the kernel of a homomorphism of group schemes is the fibre over the identity, and forming it commutes with arbitrary base change ([`kernelBaseChangeIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/GroupScheme/Kernel.html#TauCeti.GroupScheme.kernelBaseChangeIso)).
- **The Weierstrass model is a smooth proper curve** — the projective cubic is proper over its base for any Weierstrass curve ([`isProper_projModelOver`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.html#WeierstrassCurve.isProper_projModelOver)). It is smooth of relative dimension one when the discriminant is a unit ([`smoothOfRelativeDimension_one_projModelOver`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Smooth.html#WeierstrassCurve.smoothOfRelativeDimension_one_projModelOver)).
- **The Bosma–Lenstra addition laws glue** — on a chart cover of `E ×_S E`, the addition formulae agree on overlaps as morphisms of schemes, over any base ring and including nonreduced ones ([`fst_additionOnPiece_eq_snd_additionOnPiece`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Addition/Morphism.html#WeierstrassCurve.fst_additionOnPiece_eq_snd_additionOnPiece)).

### Notable definitions and infrastructure

- **Weil restriction along a finite projective algebra** — [`WeilRestriction`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/WeilRestriction.html#TauCeti.Algebra.WeilRestriction) is a finitely presented algebra representing `T ↦ Hom_B(C, B ⊗ T)`, and its formation commutes with base change. This is the general result of 0F over an affine base, and the source of the Hom-schemes of Layer 3.
- **Elliptic curves over a scheme** — `EllipticCurveGeom`, defined through the pointed local-Weierstrass condition, with [base change](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/GeomBaseChange.html#TauCeti.AlgebraicGeometry.EllipticCurveGeom.baseChange). Every later moduli problem is stated in terms of this object.
- **The affine invariant quotient** — [`AffineInvariantQuotient.quotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Quotient/Affine.html#TauCeti.AffineInvariantQuotient.quotient) is `Spec A^G` for a finite group acting on `Spec A`. Its fibres are the orbits, and its universal property is proved for affine targets. It is the affine building block for the later Katz–Mazur quotients.

### Roadmap coverage

**Layer 0 is partial.** 0B is done over an affine base except for fppf quotients by a subgroup and exactness of duality. 0C has only affine quotients. 0A has only the relative effective Cartier condition and its base change. 0F has the Weil restriction over an affine base, but not its special cases (tuples of sections, homomorphisms of group schemes) or a version over a general base. 0E has only faithfully flat descent of points of affine group schemes. Nothing for 0D or 0G was found in the source.

**Layer 1 is partial.** 1A is done except for functoriality of base change of `EllipticCurveGeom`. The model's own base change and its variable-change isomorphisms are both in place. From 1B, the points dictionary over a field and over a local ring is in the source. 1D has its addition morphism over an affine base, which covers chart steps 1–3, but nothing from step 4 on. 1C and 1E are untouched.

**Layers 2–10 are untouched.**

## The frontier

- **The group axioms (1D).** Remaining: identity, inverse, associativity and commutativity for the addition morphism, compatibility with base change, and agreement with Mathlib's group law on field points. Gluing over a non-affine base needs the 1C classification of pointed isomorphisms.
- **Hom-schemes from Weil restriction (0F).** Remaining: derive the representing schemes for tuples of sections and for homomorphisms of finite locally free group schemes, and globalise the construction off an affine base.
- **Base-change functoriality (1A).** Remaining: identity and composition laws for `EllipticCurveGeom.baseChange`. This is the last 1A item.
- **Section divisors and finiteness (0A).** Remaining: the divisor `[P]` of a section, sums and flat pullback, and finite-iff-proper with degree as rank. Layer 1C's pole sheaves need these first.
- **Torsors and free quotients (0C, items 2–3).** Remaining: the Hopf–Galois criterion and the affine case of SGA 3 V 4.1. These also supply the fppf quotient that 0B still lacks.

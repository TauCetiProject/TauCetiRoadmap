<!--tauceti-status:v1 {"roadmap":"ModularCurves","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c","ts":"2026-10-20T05:58:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"SGA 3 V 4.1 quotients; essential surjectivity in 0D; descent of polarised curves and spreading out; universal subgroup over 0G","state":"partial"},{"id":"Layer 1","remaining":"1C pole sheaves and Weierstrass presentation; 1E polarisation and descent","state":"partial"},{"id":"Layer 2","remaining":"2B quotients E/C; 2C-2F duals, Picard duality, Weil pairing, rigidity","state":"partial"},{"id":"Layer 3","remaining":"naive Gamma0(N); the full-set locus; balanced Gamma1(N); 3D beyond Gamma1(N)","state":"partial"},{"id":"Layer 4","remaining":"4B Weierstrass presentation; KM 4.7.0; 4D regularity","state":"partial"},{"id":"Layer 5","remaining":"5B representability of Y_full(N) and the determinant map; 5C","state":"partial"},{"id":"Layer 6","remaining":"balanced Gamma1(N) and the N-Isog parameter scheme","state":"partial"},{"id":"Layer 7","remaining":"everything beyond KM 5.3.4 and relative Frobenius","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"everything beyond the Legendre and level-three rings over the j-line","state":"partial"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"36066a37c06e5ed79765b3f2da67e986b1c2c8a8eb9b376617ed0a6652d9b641","roadmap":"ModularCurves","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c"}-->
# Status: ModularCurves

This file documents the status of the ModularCurves roadmap up until `68a457e` (2026-10-20T05:58:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The first fine modular curve is done: `Y₁(N)` for `N ≥ 4`, smooth and affine where `N` is invertible, which completes Layer 5A. Katz–Mazur 2.3.1 is complete over any base. Layers 0–7 and 9 are partial. The Drinfeld problems `[Γ(N)]` and `[Γ₁(N)]` are relatively representable, but KM 4.7.0, quotients of elliptic curves and all duality theory are still missing. Layers 8 and 10 have not begun.

### Named results

- **`Y₁(N)` as a fine moduli scheme** — for `N ≥ 4` invertible on `B`, the naive `[Γ₁(N)]` problem is [represented](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/ModularCurve/YOne.html#TauCeti.AlgebraicGeometry.ModuliProblem.gammaOneNaiveRepresentableBy) by an affine scheme cut out of the universal Tate normal form, and that scheme is [smooth over `B`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/ModularCurve/YOne.html#TauCeti.AlgebraicGeometry.EllObj.smooth_yOne_structureMap).
- **Katz–Mazur 2.3.1** — multiplication by `n ≠ 0` is [an isogeny of degree `n²`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Geom/Isogeny.html#TauCeti.AlgebraicGeometry.EllipticCurveGeom.isogenyOfDegree_intCast) over any base, and `E[n]` is [étale wherever `n` is invertible](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Geom/Torsion/Etale/Locus.html#TauCeti.AlgebraicGeometry.EllipticCurveGeom.etale_torsion_hom_of_forall_intCast_ne_zero).
- **Katz–Mazur 3.6.0 for `[Γ(N)]` and `[Γ₁(N)]`** — both Drinfeld problems are relatively representable and finite over `Ell/B`. They are represented by the Drinfeld-basis locus in `E[N] ×_S E[N]` ([`gammaRelRepData`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/ModularCurve/Gamma/Full.html#TauCeti.AlgebraicGeometry.ModuliProblem.gammaRelRepData)) and by the exact-order scheme ([`gammaOneRelRepData`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/ModularCurve/Gamma/One.html#TauCeti.AlgebraicGeometry.ModuliProblem.gammaOneRelRepData)).
- **Rigidity of full level structure (KM 2.7.2)** — for `N ≥ 3`, an automorphism of `E/S` that fixes a naive full level-`N` structure is the identity ([`isRigid_gammaNaive`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/ModularCurve/NaiveLevel.html#TauCeti.AlgebraicGeometry.ModuliProblem.isRigid_gammaNaive)).
- **The group law over any base** — an elliptic curve over any scheme is a commutative group scheme, which on field points is the classical addition ([`lift_projModelPoint_additionMorphism_eq_add`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Addition/Points.html#WeierstrassCurve.lift_projModelPoint_additionMorphism_eq_add)).

### Notable definitions and infrastructure

- **Moduli problems over `Ell/B`** — relative representability, rigidity and simultaneous problems, the terms in which every theorem from Layer 4 onward is stated.
- **Drinfeld bases** — a homomorphism `(ℤ/Nℤ)² → E(S)` is a [Drinfeld basis](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Geom/DrinfeldBasis/Basic.html#TauCeti.AlgebraicGeometry.EllipticCurveGeom.IsDrinfeldBasis) when its divisor `∑ [φ a]` equals `E[N]`. With the exact-order scheme, this states level structure at primes dividing `N`.
- **The relative Grassmannian** — it is a scheme with a [universal property](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Grassmannian/Points.html#Module.Grassmannian.schemeHomEquiv), it is [proper](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Grassmannian/Proper.html#Module.Grassmannian.isProper_toSpec), and being a Hopf ideal is a closed condition on it. These are the ingredients of the 0G subgroup parameter space and of `[N-Isog]`.

### Roadmap coverage

**Layer 0 is partial.** It has Cartier duality, Deligne's theorem, affine finite-group and Hopf–Galois torsor quotients, effective descent for affine and finite locally free schemes and group objects, and the Grassmannian. Missing: SGA 3 V 4.1, the Galois-set equivalence of 0D (only full faithfulness is proved), descent of polarised curves, and the universal subgroup over 0G.

**Layer 1 is partial**: 1C has the classification of pointed isomorphisms over a scheme, but no pole sheaves or presentation theorem, and 1E is barely begun. **Layer 2 is partial**: 2A is done, with 2B–2F untouched.

**Layer 3 is partial**:
- 3N has naive `[Γ(N)]` and `[Γ₁(N)]`, but not naive `[Γ₀(N)]`.
- 3A has the reduction for full sets and the KM 1.11 generator results, but no full-set locus.
- 3B and 3C have the exact-order locus, cyclic subgroups, and `[Γ(N)]`, `[Γ₁(N)]`, `[Γ₀(N)]`, but not the balanced problem.
- 3D has only the `[Γ₁(N)]` comparison.

**Layer 4 is partial**, with the rigidifier normal forms but not KM 4.7.0. **Layer 5 is partial**: 5A is done, 5B up to rigidity and the `GL₂` action, and 5C untouched. **Layer 6 is partial**, with two of its three problems.

**Layers 7 and 9 are partial**, with isolated inputs: KM 5.3.4 and relative Frobenius for Layer 7, and the Legendre and level-three rings over the `j`-line for Layer 9. **Layers 8 and 10 are untouched.**

## The frontier

- **KM 4.7.0 and `Y_full(N)`.** Remaining: represent the simultaneous problems with each rigidifier and quotient by the finite étale equivalence relation. This needs SGA 3 V 4.1 from 0C and the descent of 1E, and would give the representability half of 5B.
- **Pole sheaves and the Weierstrass presentation (1C, 4B).** Remaining: `𝒪_E(n[0])` with `π_*` locally free of rank `n`, and the presentation theorem. The isogeny quotients of 2B are blocked on it.
- **Quotients `E/C` (2B).** Remaining: the norm functor on invertible sheaves, an invariant affine cover, and gluing of the affine torsor quotients. The duals and the Weil pairing come after this.
- **The rest of Layer 6.** Remaining: the balanced `[Γ₁(N)]` problem, which needs Cartier duals of cyclic subgroups from Layer 2. Also `[N-Isog]`, which needs the universal subgroup over the Hopf-ideal locus of the Grassmannian.
- **Naive `[Γ₀(N)]` and the full-set locus (3N, 3A).** Remaining: the Borel quotient of the full-basis carrier, and the closed subscheme of full sets of sections cut out by the norm identities.

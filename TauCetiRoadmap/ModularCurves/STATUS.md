<!--tauceti-status:v1 {"roadmap":"ModularCurves","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d","ts":"2026-10-13T09:39:50+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0C torsor and free quotients; 0D Galois equivalence; most of 0E; 0F off an affine base; 0G representability","state":"partial"},{"id":"Layer 1","remaining":"1B over general bases; 1C pole sheaves, global classification and Weierstrass presentation; 1E polarisation and descent","state":"partial"},{"id":"Layer 2","remaining":"E[N] etale over a general base; isogeny degree; 2B quotients; 2C-2F duals, Picard duality, Weil pairing","state":"partial"},{"id":"Layer 3","remaining":"full sets of sections, exact-order locus, cyclic subgroups, the other level structures, 3D comparison","state":"partial"},{"id":"Layer 4","remaining":"fppf sheafification, 4B Weierstrass presentation, 4C rigidifiers and KM 4.7.0, 4D regularity","state":"partial"},{"id":"Layer 5","remaining":"5A representability of Y1(N) for N at least 4; 5B and 5C","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"b87d5fcb9f123ffaecf21e174129ecce49a8d2c70680f89527399216f86fa735","roadmap":"ModularCurves","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d"}-->
# Status: ModularCurves

This file documents the status of the ModularCurves roadmap up until `c7ae9d7` (2026-10-13T09:39:50+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Elliptic curves over an arbitrary scheme are now commutative group schemes, and multiplication by `n` is finite locally free of rank `n²`. That covers most of Layer 1D and the core of 2A. Layers 0–5 are all partial. The Katz–Mazur formalism of Layers 3–5 has its definitions, the `[Γ₁(N)]` problem and Tate normal form, but no representability theorem. Layers 6–10 have not begun.

### Named results

- **The group law over any base** — an elliptic curve `E/S` is a commutative group object over `S`, with addition glued from the Bosma–Lenstra formulae and inverse given by negation. On field points of a Weierstrass model it is the classical addition ([`lift_projModelPoint_additionMorphism_eq_add`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Addition/Points.html#WeierstrassCurve.lift_projModelPoint_additionMorphism_eq_add)). The group structure itself is `EllipticCurveGeom.grpObj`.
- **Katz–Mazur 2.3.1** — for `n ≠ 0`, `[n] : E ⟶ E` is finite, flat, surjective and of rank `n²`, so `E[n]` is finite locally free of rank `n²` over any base (`EllipticCurveGeom.finrank_torsion_hom`). Étaleness where `n` is invertible is proved only over a field.
- **Deligne's theorem** — a finite locally free commutative group scheme of constant rank `n` is killed by `n` ([`convPow_eq_one_of_rankAtStalk`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/KilledByRank.html#TauCeti.AlgHom.convPow_eq_one_of_rankAtStalk)).
- **Cartier duality of constant and diagonalizable groups** — over any commutative ring, the constant group on a finite abelian `G` and `D(G)` are dual, giving `(ℤ/Nℤ)ᴰ ≅ μ_N` ([`ConstantGroup.cartierDualIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/Constant.html#TauCeti.ConstantGroup.cartierDualIso)).
- **The Weierstrass model is a smooth proper curve** — the projective cubic is proper over any base ring ([`isProper_projModelOver`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.html#WeierstrassCurve.isProper_projModelOver)) and [geometrically integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Integral.html#WeierstrassCurve.geometricallyIntegral_projModelOver). It is smooth of relative dimension one when the discriminant is a unit.

### Notable definitions and infrastructure

- **Elliptic curves over a scheme** — `EllipticCurveGeom` is defined by the pointed local-Weierstrass condition, with functorial base change. Every later moduli problem is stated in terms of it.
- **Moduli problems over `Ell/B`** — the category `Ell/B` of elliptic curves with cartesian arrows is fibred in groupoids over `B`-schemes. On it there are moduli problems, relative representability and rigidity, and the first example is `[Γ₁(N)]`, defined through points of exact order `N`. These are the terms in which Layers 4–10 are stated.
- **Weil restriction along a finite projective algebra** — [`WeilRestriction`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/WeilRestriction.html#TauCeti.Algebra.WeilRestriction) represents `T ↦ Hom_B(C, B ⊗ T)` and commutes with base change. It is the affine source of the Hom-schemes that Layer 3 needs.

### Roadmap coverage

**Layer 0 is partial**: much of it is proved over an affine base. That includes Cartier duality, kernels, Weil restriction, affine invariant quotients, the theory of relative effective Cartier divisors, and descent for affine schemes. Missing are torsor and free quotients (0C), the finite étale Galois equivalence (0D), most of 0E, Hom-schemes over a non-affine base, and representability of the 0G parameter spaces.

**Layer 1 is partial.** 1A and 1D are essentially done. The 1D comparison with Mathlib's field points covers only Weierstrass models. 1B has its field and local-ring stages. 1C has only the divisors `n[0]` and the classification of pointed isomorphisms over an affine base, with no pole sheaves or Weierstrass-presentation theorem. 1E has only `π_*𝒪_E = 𝒪_S`.

**Layer 2 is partial**: 2A lacks étaleness over a general base and isogeny degree, and 2B–2F are untouched. **Layers 3–5 are partial**:
- Layer 3 has points of exact order `N` and their base change.
- Layer 4 has the `Ell/B` and moduli-problem definitions with rigidity.
- Layer 5 has uniqueness of Tate normal form for a global Weierstrass model, with its universal ring.

**Layers 6–10 are untouched.**

## The frontier

- **Pole sheaves and the Weierstrass presentation (1C).** Remaining: `𝒪_E(n[0])`, `π_*` locally free of rank `n` commuting with base change, the classification of pointed isomorphisms over a general base, and the presentation theorem. This needs the Jacobian Challenge cohomology contracts, and it blocks 4B and the quotients of 2B.
- **Drinfeld level structures (3A–3C).** Remaining: full sets of sections, the exact-order locus as a closed subscheme, cyclic subgroups, and the `[Γ(N)]`, balanced `[Γ₁(N)]` and `[Γ₀(N)]` problems. The loci need 0A representability and the 0F Hom-schemes off an affine base.
- **`Y₁(N)` for `N ≥ 4` (5A).** Remaining: Tate normal form for an arbitrary `E/S`, the locus where `[N]P = 0`, representability, smoothness and finite étaleness.
- **Quotients and isogenies (2B).** Remaining: `E/C` for a finite locally free subgroup `C`, which first needs the 0C torsor quotient (the Hopf–Galois criterion and SGA 3 V 4.1).
- **Étale torsion and Picard duality (2A, 2D).** Remaining: `E[N]` étale over any base where `N` is invertible, and the relative Picard functor behind KM 2.5.1, that pointed morphisms are homomorphisms.

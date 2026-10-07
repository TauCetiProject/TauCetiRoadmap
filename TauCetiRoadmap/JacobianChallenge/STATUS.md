<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"41e5e4923e49435450084dd38f558165776282ff","ts":"2026-10-04T21:34:46Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A","state":"done"},{"id":"Layer B","remaining":"finiteness of coherent cohomology on proper schemes, Cech comparison, Serre duality via the relative dualizing sheaf","state":"partial"},{"id":"Layer C","remaining":"proper-flat pushforward, cohomology and base change, semicontinuity, symmetric powers Sym^d X","state":"partial"},{"id":"Layer D","remaining":"fppf sheafification of the rigidified Picard functor, the Pic0 component, representability and properness","state":"partial"},{"id":"Layer E","remaining":"T0 Pic0 = H1(X, O_X), dim Jac = g, theorem of the cube, dual variety and polarizations","state":"partial"},{"id":"Layer F","remaining":"the Abel-Jacobi morphism satisfying the Albanese property, and base change","state":"partial"}],"readme_sha":"ef69cb70770a57f7fb1ff03a8cac347e2ce2091a116b699a4eb19d7d999b16bf","roadmap":"JacobianChallenge","to_sha":"41e5e4923e49435450084dd38f558165776282ff"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `41e5e49` (2026-10-04T21:34:46Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer A is done for curves. Layer B has Riemann–Roch and Serre duality, but it still lacks finiteness for general coherent sheaves and a duality built from `ω_{X/k}`. Layers C through F each have a foothold: relative divisors, a rigidified Picard functor, rigidity for abelian varieties, and the Albanese property stated. There is still no Picard scheme, no Jacobian, and no Abel–Jacobi morphism.

### Named results

- **The Riemann–Roch theorem**: on a proper integral curve over `k` whose codimension-one local rings are discrete valuation rings and which has a `k`-rational point, `χ(𝒪_X(D)) = deg D + 1 − g` for every Weil divisor, with `g = dim H¹(X, 𝒪_X)` ([`eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/RiemannRoch/Basic.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus)).
- **Serre duality for line bundles**: on such a proper curve, `H¹(X, L)^∨ ≅ H⁰(X, ω ⊗ L⁻¹)` for every line bundle `L`, where the canonical bundle `ω` has degree `2g − 2` and is built from Weil differentials ([`nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.html#TauCeti.AlgebraicGeometry.InvertibleSheaf.nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual)).
- **Serre's vanishing theorem**: a quasi-coherent sheaf on the spectrum of a Noetherian ring has no cohomology in positive degree ([`subsingleton_cohomology_succ_of_isQuasicoherent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Cohomology/Affine.html#AlgebraicGeometry.Scheme.Modules.subsingleton_cohomology_succ_of_isQuasicoherent)). This is the affine acyclicity that coherent cohomology rests on.
- **The Cartier–Picard dictionary**: on any integral scheme, Cartier divisors modulo principal divisors form the Picard group ([`classGroupAddEquivLineBundleClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.html#TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.classGroupAddEquivLineBundleClass)). On curves, the degree-zero part is identified with `Cl⁰` ([`classGroupPicZeroAddEquivPicZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/PicZero.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero)).
- **Points of a genus-one curve form `Pic⁰`**: when `k` is integrally closed in `k(X)`, the map `x ↦ [𝒪(x − x₀)]` is a bijection from the points of residue degree one onto `Pic⁰` ([`degreeOneEquivPicZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.degreeOneEquivPicZero)). This is a group-level form of the acceptance check `Jac(E) ≅ E`.

### Notable definitions and infrastructure

- [`relativeDifferentials`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.html#AlgebraicGeometry.Scheme.relativeDifferentials) is the sheaf `Ω_{X/R}` with its universal property for derivations. It is invertible on schemes smooth of relative dimension one, so it is the candidate dualizing sheaf `ω_{X/k}` for a smooth curve.
- [`IsAlbanese`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.html#TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese) states the universal property the Abel–Jacobi map must satisfy, and proves that an object with it is unique up to unique isomorphism. This is what will make independently built Jacobians comparable.
- [`IsRelativeEffectiveCartier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Relative.html#AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier) describes effective Cartier divisors that are flat over a base and stable under flat pullback. These are the families from which `Symᵈ X` and the Abel maps are built.

### Roadmap coverage

- **Layer A is done** in the curve setting, and the Cartier–Picard part now holds on any integral scheme.
- **Layer B is partial.** It has genus, Riemann–Roch, line-bundle Serre duality, Serre vanishing on Noetherian affines, and vanishing above degree one for schemes with affine diagonal covered by two affines. It lacks finite-dimensionality for coherent sheaves on proper schemes, the Čech comparison, and duality through `Ω_{X/k}`.
- **Layer C is partial.** Relative effective Cartier divisors exist. Proper-flat pushforward, cohomology and base change, and `Symᵈ X` do not.
- **Layer D is partial.** The [`rigidifiedPicardFunctor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.html#TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor) exists as a functor of sets. It has no sheafification, no `Pic⁰` component, and no representability.
- **Layer E is partial.** The tangent space at the identity has dimension `dim A`, the rigidity lemma is proved, and pointed morphisms between abelian varieties are homomorphisms. The cube theorem, duals, polarizations, and `T₀Pic⁰ ≅ H¹(X, 𝒪_X)` are missing.
- **Layer F is partial only in the weak sense** that its universal property is stated. No Abel–Jacobi morphism or Jacobian satisfies it yet.

## The frontier

- **Duality with `ω_{X/k}`.** Identify the Weil-differential canonical bundle with `Ω_{X/k}` on a smooth curve. Then discharge the constant-field hypothesis using the new result that `k` is algebraically closed in `k(X)` for geometrically integral `X`.
- **Finiteness of coherent cohomology.** Prove finite-dimensionality for coherent sheaves on proper schemes over `k`. Affine acyclicity and the affine coherent/finite-module equivalence are now available for the Čech argument.
- **`Pic⁰` as a functor.** Sheafify the rigidified Picard functor and cut out the degree-zero subfunctor. Local constancy of degree in flat families needs Layer C.
- **Relative cohomology and symmetric powers.** Build proper-flat pushforward, cohomology and base change, and `Symᵈ X` on top of relative effective Cartier divisors.
- **The Jacobian and Abel–Jacobi.** Prove representability and properness of `Pic⁰` and `T₀Pic⁰ ≅ H¹(X, 𝒪_X)`. Then construct `aj` with the Albanese property and its compatibility with base change. All of this waits on the items above.

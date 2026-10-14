<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"425f53535c31afd6dca52c70a27d1d2d91ffd233","ts":"2026-10-08T17:46:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A","state":"done"},{"id":"Layer B","remaining":"finiteness of coherent cohomology on proper schemes, Cech comparison, Serre duality via the relative dualizing sheaf","state":"partial"},{"id":"Layer C","remaining":"proper-flat pushforward, cohomology and base change, semicontinuity, symmetric powers Sym^d X","state":"partial"},{"id":"Layer D","remaining":"fppf sheafification of the relative Picard presheaf, the Pic0 subfunctor, representability and properness","state":"partial"},{"id":"Layer E","remaining":"T0 Pic0 = H1(X, O_X), dim Jac = g, theorem of the cube, dual variety and polarizations","state":"partial"},{"id":"Layer F","remaining":"the Abel-Jacobi morphism satisfying the Albanese property, and base change","state":"partial"}],"readme_sha":"ef69cb70770a57f7fb1ff03a8cac347e2ce2091a116b699a4eb19d7d999b16bf","roadmap":"JacobianChallenge","to_sha":"425f53535c31afd6dca52c70a27d1d2d91ffd233"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `425f535` (2026-10-08T17:46:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer A is done for curves. Layer B has Riemann–Roch and Serre duality, but it still lacks finiteness for general coherent sheaves and a duality built from `ω_{X/k}`. Layers C through F each have a foothold. There is a relative Picard presheaf with rigidification, a functor of relative effective Cartier divisors, rigidity for abelian varieties, and a statement of the Albanese property. There is still no Picard scheme, no Jacobian and no Abel–Jacobi morphism.

### Named results

- **The Riemann–Roch theorem**: on a proper integral curve over `k` with a `k`-rational point whose codimension-one local rings are discrete valuation rings, `χ(𝒪_X(D)) = deg D + 1 − g` for every Weil divisor, where `g = dim H¹(X, 𝒪_X)` ([`eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/RiemannRoch/Basic.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus)).
- **Serre duality for line bundles**: on such a curve, `H¹(X, L)^∨ ≅ H⁰(X, ω ⊗ L⁻¹)` for every line bundle `L`. Here the canonical bundle `ω` is built from Weil differentials and has degree `2g − 2` ([`nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.html#TauCeti.AlgebraicGeometry.InvertibleSheaf.nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual)).
- **The Cartier–Picard dictionary**: on any integral scheme, Cartier divisors modulo principal ones form the Picard group ([`classGroupAddEquivLineBundleClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.html#TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.classGroupAddEquivLineBundleClass)). On curves, its degree-zero part is `Cl⁰` ([`classGroupPicZeroAddEquivPicZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/PicZero.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero)).
- **Rigidification identifies the Picard presheaf**: for `X → S` with a section, rigidified line-bundle classes on `X_T` are naturally `Pic(X_T)/Pic(T)` ([`rigidifiedPicardFunctorIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Relative.html#TauCeti.AlgebraicGeometry.rigidifiedPicardFunctorIso)). On a proper integral scheme over a field with a rational point, these rigidified bundles have no nontrivial automorphisms over any base ([`autSubgroup_eq_bot_of_universallyClosed`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidity.html#TauCeti.AlgebraicGeometry.RigidifiedLineBundle.autSubgroup_eq_bot_of_universallyClosed)).
- **Points of a genus-one curve form `Pic⁰`**: when `k` is integrally closed in `k(X)`, `x ↦ [𝒪(x − x₀)]` is a bijection from the points of residue degree one onto `Pic⁰` ([`degreeOneEquivPicZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.degreeOneEquivPicZero)). This is the group-level form of the check `Jac(E) ≅ E`.

### Notable definitions and infrastructure

- [`relativeEffectiveCartierSubfunctor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Functor.html#TauCeti.AlgebraicGeometry.relativeEffectiveCartierSubfunctor) is the functor of relative effective Cartier divisors of `X/S`. It is well defined because such divisors are stable under arbitrary base change. It is the functor that `Symᵈ X` should represent, and the source of the Abel maps.
- [`relativeDifferentials`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.html#AlgebraicGeometry.Scheme.relativeDifferentials) is the sheaf `Ω_{X/R}`, invertible on schemes smooth of relative dimension one. It is the candidate dualizing sheaf `ω_{X/k}` for a smooth curve.
- [`IsAlbanese`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.html#TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese) states the universal property the Abel–Jacobi map must satisfy, with uniqueness up to unique isomorphism. This is what will make independently built Jacobians comparable.

### Roadmap coverage

- **Layer A is done** in the curve setting, and the Cartier–Picard part holds on any integral scheme. The ideal sheaf of an effective Cartier divisor is now also shown to be invertible.
- **Layer B is partial.** It has genus, Riemann–Roch, line-bundle Serre duality, Serre vanishing on Noetherian affines, and a two-open-cover description of `H¹`. Missing are finite-dimensionality for coherent sheaves on proper schemes, the general Čech comparison, and duality through `Ω_{X/k}`.
- **Layer C is partial.** Relative effective Cartier divisors and their functor exist, as does flat base change for `f_* 𝒪_X = 𝒪_S`. Missing are proper-flat pushforward of coherent sheaves, cohomology and base change, semicontinuity, and `Symᵈ X`.
- **Layer D is partial.** The relative Picard presheaf `T ↦ Pic(X_T)/Pic(T)` and its rigidified form are in place. Missing are fppf sheafification, the `Pic⁰` subfunctor, representability and properness.
- **Layers E and F are partial.** Layer E has rigidity, the tangent space, and the fact that pointed morphisms are homomorphisms. Layer F has only the Albanese property stated. There are no cube theorem, duals, polarizations, `T₀Pic⁰ ≅ H¹(X, 𝒪_X)` or Abel–Jacobi morphism.

## The frontier

- **Sheafifying the Picard functor.** Pass from the presheaf `Pic(X_T)/Pic(T)` to its fppf sheafification, using the new rigidity result to compare it with the rigidified functor. Then cut out the degree-zero subfunctor; local constancy of degree in flat families needs Layer C.
- **Duality with `ω_{X/k}`.** Identify the Weil-differential canonical bundle with `Ω_{X/k}` on a smooth curve. Then discharge the constant-field hypothesis using the result that `k` is algebraically closed in `k(X)` for geometrically integral `X`.
- **Finiteness of coherent cohomology.** Prove finite-dimensionality for coherent sheaves on proper schemes over `k`. Affine acyclicity and the two-open-cover computation of `H¹` are available for the Čech argument.
- **Relative cohomology and symmetric powers.** Build proper-flat pushforward and cohomology and base change, and represent the relative effective Cartier divisor functor by `Symᵈ X`.
- **The Jacobian and Abel–Jacobi.** Prove representability and properness of `Pic⁰` and `T₀Pic⁰ ≅ H¹(X, 𝒪_X)`. Then construct `aj` with the Albanese property and base change. All of this waits on the items above.

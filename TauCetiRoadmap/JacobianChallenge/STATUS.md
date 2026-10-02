<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A","state":"done"},{"id":"Layer B","remaining":"affine acyclicity and finiteness for general coherent sheaves; Serre duality via the relative dualizing sheaf rather than Weil differentials","state":"partial"},{"id":"Layer C","state":"untouched"},{"id":"Layer D","remaining":"fppf sheafification of the rigidified Picard functor, the Pic0 component, representability and properness","state":"partial"},{"id":"Layer E","remaining":"T0 Pic0 = H1(X, O_X), dim Jac = g, theorem of the cube, dual variety and polarizations","state":"partial"},{"id":"Layer F","state":"untouched"}],"readme_sha":"ef69cb70770a57f7fb1ff03a8cac347e2ce2091a116b699a4eb19d7d999b16bf","roadmap":"JacobianChallenge","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer A is done: divisors, the Picard group, degree and `Pic⁰` as an abstract group are all in place for curves. Layer B has its summit theorems, Riemann–Roch and a form of Serre duality, but lacks the general coherent theory. The Picard functor exists only in rigidified form as a functor of sets, and Layers C and F have not begun.

### Named results

- **The Riemann–Roch theorem** — on a proper integral curve over `k` with discrete-valuation local rings in codimension one and a `k`-rational point, `χ(𝒪_X(D)) = deg D + 1 − g` for every Weil divisor ([`eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/RiemannRoch/Basic.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus)). Its finiteness hypothesis on `H¹(X, 𝒪_X)` is proved separately for such curves.
- **Serre duality for divisor sheaves** — `H¹(𝒪_X(D))^∨ ≅ H⁰(𝒪_X(K − D))` for a canonical divisor `K` coming from a Weil differential, assuming `k` is integrally closed in `k(X)` ([`cohomologyOneDualEquivCohomologyZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero)). Under the same hypothesis `deg K = 2g − 2`.
- **`Cl(X) ≅ Pic(X)`** — on a Noetherian integral curve with discrete-valuation local rings in codimension one, `D ↦ 𝒪_X(D)` identifies divisor classes with line-bundle classes ([`classGroupAddEquivLineBundleClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Picard.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupAddEquivLineBundleClass)).
- **`Cl⁰(X) ≅ Pic⁰(X)`** — on a proper such curve, the degree-zero divisor classes are exactly the kernel of the Euler-characteristic degree `χ(L) − χ(𝒪_X)`, which agrees with the weighted divisor degree ([`classGroupPicZeroAddEquivPicZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/PicZero.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero)).
- **The Weil–Cartier equivalence** — on such a curve, Weil and Cartier divisors are additively equivalent ([`equivCartierDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Cartier/Inverse.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivCartierDivisor)). The equivalence respects effectivity and degree.

### Notable definitions and infrastructure

- [`rigidifiedPicardFunctor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.html#TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor) sends `T` over `S` to the line bundles on `X_T` trivialized along the base-changed section `x₀`. With the proof that a line bundle's automorphisms are exactly the global units, it is the starting object for representability.
- [`genus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Cohomology/Genus.html#AlgebraicGeometry.Scheme.genus) is defined as `dim_k H¹(X, 𝒪_X)`, the cohomological definition the roadmap asks for. It is shown to agree with the function-field genus when `k` is integrally closed in `k(X)`.
- [`AbelianVariety.TangentSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.html#TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace) is the Zariski tangent space at the identity, the left side of the eventual `T₀Pic⁰ ≅ H¹(X, 𝒪_X)`.

### Roadmap coverage

- **Layer A is done** in the curve setting: the Picard group, the divisor–line-bundle dictionary in both Cartier and Weil form, degree with its agreement between the two definitions, and `Pic⁰ = ker deg`.
- **Layer B is partial.** Genus, vanishing above degree one for line bundles on curves, finiteness of their cohomology, Riemann–Roch and Weil-differential Serre duality are proved. Affine acyclicity, Čech comparison, finiteness for general coherent sheaves, and duality through the relative dualizing sheaf `ω_{X/k}` are not.
- **Layer D is partial.** The rigidified Picard functor exists, but not its fppf sheafification, the `Pic⁰` component, representability or properness.
- **Layer E is partial** as before: the category of abelian varieties, commutativity and tangent spaces exist; nothing further is established.
- **Layers C and F are untouched.**

## The frontier

- **Serre duality with `ω_{X/k}`.** Construct the relative dualizing sheaf, match its divisor with the Weil-differential canonical class, and derive the constant-field hypothesis from geometric integrality. The smooth-implies-geometrically-integral lemma ([`Smooth.geometricallyIntegral`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyIntegral.html#TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral)) is available for this.
- **General coherent cohomology.** Prove affine acyclicity and finite-dimensionality for coherent sheaves on proper schemes. Quasi-coherent modules on an affine scheme now form an abelian category with enough injectives, the natural setting for the acyclicity argument.
- **`Pic⁰` as a functor.** Sheafify the rigidified Picard functor and cut out the degree-zero subfunctor. Local constancy of degree in flat families needs Layer C.
- **Relative cohomology and symmetric powers.** Build proper-flat pushforward, cohomology and base change, relative effective Cartier divisors and `Symᵈ X`. The Abel-map route to representability rests on these.
- **The Jacobian and Abel–Jacobi.** Prove representability and properness of `Pic⁰` and `T₀Pic⁰ ≅ H¹(X, 𝒪_X)`, then construct `aj` with its universal property and base change. All of this waits on the items above.

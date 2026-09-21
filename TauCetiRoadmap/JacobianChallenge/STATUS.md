<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"2c0c80ad154f05f4e261095280eeab012f7e1e5f","ts":"2026-09-11T04:26:49Z"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `2c0c80a` (2026-09-11T04:26:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete, and neither the Picard scheme nor the Jacobian has been constructed. Layer A is the strongest part of the roadmap; Layers B and E now have substantial foundations but remain partial, while Layers C, D and F have not begun.

### Named results

- **The Weil–Cartier equivalence** — on a Noetherian integral curve whose codimension-one local rings are discrete valuation rings, Weil divisors and Cartier divisors are additively equivalent ([`equivCartierDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Cartier/Inverse.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivCartierDivisor)).
- **Locally principal divisors give line bundles** — the sheaf `𝒪_X(D)` of a locally principal Weil divisor on such a curve is locally free of rank one ([`isInvertible_sheaf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LocalTriviality.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.IsLocallyPrincipal.isInvertible_sheaf)).
- **`Pic⁰` as a quotient** — degree-zero divisors modulo principal divisors form the degree-zero divisor class group, with every class represented in degree zero ([`weightedDegreeZeroQuotientEquivPicZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/PicZeroQuotient.html#TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.weightedDegreeZeroQuotientEquivPicZero)); this is only an abstract group.
- **Additivity of the curve Euler characteristic** — `dim H⁰-dim H¹` is additive in a short exact sequence when the stated finite-dimensionality hypotheses hold and the relevant `H²` vanishes ([`finrank_cohomology_zero_sub_one_eq_add`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.html#AlgebraicGeometry.Scheme.Modules.finrank_cohomology_zero_sub_one_eq_add)).
- **Commutativity of abelian varieties** — a proper geometrically integral group scheme over a field is a commutative group object ([`isCommMonObj`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.html#TauCeti.AlgebraicGeometry.AbelianVariety.isCommMonObj)).

### Notable definitions and infrastructure

- [`Cohomology`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Cohomology/Basic.html#TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology) packages `Hⁱ(X,M)` as an additive functor; long exact and Mayer–Vietoris sequences now support vanishing and Euler-characteristic arguments.
- [`InvertibleSheaf.tensorProduct`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/LineBundle/TensorProduct.html#TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct) supplies tensor products, symmetry and the trivial line bundle as unit, preparing the group law on line-bundle classes.
- [`AbelianVariety.TangentSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.html#TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace) is the finite-dimensional Zariski tangent space at the identity over the ground field, the eventual left side of `T₀Pic⁰ ≅ H¹(X,𝒪_X)`.

### Roadmap coverage

Layer A is advanced but partial: the divisor theory includes degree, principal divisors, the affine class-group comparison, the curve-level Weil–Cartier equivalence and `D ↦ 𝒪_X(D)`, while line bundles have tensor products; the Picard group of line-bundle classes, the converse line-bundle-to-divisor construction, and agreement of divisor degree with Euler-characteristic degree are not established. Layer B now has cohomology objects, `H⁰` as global sections, exact and Mayer–Vietoris sequences, conditional higher-vanishing results, and a truncated Euler characteristic, but not affine acyclicity, proper finiteness, general vanishing above dimension, genus, Riemann–Roch or Serre duality. Layer E has the category of abelian varieties and tangent spaces, but no identification with `H¹`, dimension computation, dual variety, cube or square theorem, or polarizations. Layers C, D and F remain untouched: there is no relative cohomology and base change, symmetric-power construction, Picard functor or representability, Jacobian, Abel–Jacobi morphism, universal property, or Jacobian base-change theorem.

## The frontier

- **The Picard group and divisor–line-bundle dictionary.** Pass from tensorable line bundles to their group of isomorphism classes, construct inverses, and prove the correspondence with divisors modulo principal divisors.
- **Finiteness and vanishing for coherent cohomology.** Prove affine acyclicity, finite-dimensionality for proper coherent sheaves, and `H²=0` for curves; the present Euler-characteristic theorem assumes the needed finiteness and vanishing.
- **Riemann–Roch and Serre duality.** Construct the relative dualizing sheaf and prove duality, Riemann–Roch, and agreement between divisor degree and `χ(L)-χ(𝒪_X)` after the cohomological prerequisites.
- **Relative cohomology and symmetric powers.** Build proper-flat pushforward, cohomology and base change, semicontinuity, relative effective Cartier divisors, and `Symᵈ X`, which the Abel-map route to representability needs.
- **The Picard scheme and Abel–Jacobi map.** Define and rigidify the fppf Picard functor, prove representability and properness of `Pic⁰`, then construct the Jacobian and establish its universal property and base-change compatibility.

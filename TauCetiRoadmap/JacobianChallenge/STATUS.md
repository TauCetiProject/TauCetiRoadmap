<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"aa9e5f89ab3cee691992ab2274b0da31961faabb","ts":"2026-09-10T22:09:52Z"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `aa9e5f8` (2026-09-10T22:09:52Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete, and the Jacobian itself has not been constructed. Layer A now has a substantial curve-level Weil–Cartier and divisor-to-line-bundle bridge; Layers B and E have genuine beginnings in cohomology and tangent spaces, while the relative theory, Picard scheme and Abel–Jacobi layers have not begun.

### Named results

- **The Weil–Cartier equivalence** — on a Noetherian integral curve whose codimension-one local rings are discrete valuation rings, Weil divisors and Cartier divisors are additively equivalent, compatibly with principal divisors ([`equivCartierDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Cartier/Inverse.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivCartierDivisor)).
- **The divisor-class model of `Pic⁰`** — degree-zero divisors modulo principal divisors form the degree-zero divisor class group, with every class represented in degree zero ([`weightedDegreeZeroQuotientEquivPicZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/PicZeroQuotient.html#TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.weightedDegreeZeroQuotientEquivPicZero)); this remains an abstract group, not a functor or scheme.
- **Triviality of a principal divisor’s line bundle** — on a Noetherian scheme of dimension at most one, multiplication by the defining rational function identifies `𝒪_X(div g)` with the structure sheaf ([`sheafPrincipalDivisorIsoUnit`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Invertible.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheafPrincipalDivisorIsoUnit)).
- **Additivity of the Euler characteristic on a curve** — Euler characteristics in degrees zero and one add across a short exact sequence, assuming finite-dimensionality for the first two terms and vanishing of the first term’s `H²` ([`finrank_cohomology_zero_sub_one_eq_add`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.html#AlgebraicGeometry.Scheme.Modules.finrank_cohomology_zero_sub_one_eq_add)).
- **Dimension of the tangent space at a regular point** — the Zariski tangent-space dimension equals the point’s coheight ([`finrank_zariskiTangentSpace_eq_coheight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/TangentSpace/Basic.html#TauCeti.AlgebraicGeometry.finrank_zariskiTangentSpace_eq_coheight)).

### Notable definitions and infrastructure

- [`Cohomology`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Cohomology/Basic.html#TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology) packages `Hⁱ(X,M)` as an additive functor for sheaves of modules, with `H⁰` identified with global sections and a long exact sequence available for short exact sequences; this supplies the formal core of Layer B.
- [`CartierDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/CartierDivisor/Basic.html#TauCeti.AlgebraicGeometry.Scheme.CartierDivisor) is the group of global sections of `𝒦_X^×/𝒪_X^×`; local equations and their transition units support both the Weil–Cartier equivalence and the construction of [`toInvertibleSheaf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LocalTriviality.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.IsLocallyPrincipal.toInvertibleSheaf).
- [`AbelianVariety.TangentSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.html#TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace) gives the identity tangent space its ground-field vector-space structure and finite-dimensionality, preparing the later comparison `T₀Pic⁰ ≅ H¹(X,𝒪_X)`.

### Roadmap coverage

- **Layer A is partial.** The divisor theory includes scheme Weil and Cartier divisors, their equivalence for the stated Noetherian DVR curves, associated line bundles, tensor products of invertible sheaves, degree by residue-degree weights, and abstract `Pic⁰`. It does not yet supply the full Picard group of line bundles, the complete divisor–line-bundle equivalence, degree via Euler characteristic, or agreement of the two degree definitions.
- **Layers B and E are partial.** Layer B has `Hⁱ`, long exact and Mayer–Vietoris machinery, conditional high-degree vanishing from a two-open acyclic cover, and a truncated Euler characteristic; it lacks proper-scheme finite-dimensionality, the required general curve vanishing, genus, Riemann–Roch, Serre duality and a dualizing sheaf. Layer E has the abelian-variety category, isogenies, base change and finite-dimensional identity tangent spaces, but no `T₀Pic⁰ ≅ H¹`, dual variety, polarization, or theorem of the cube or square.
- **Layers C, D and F are untouched at their stated milestones.** There is no proper-flat coherent pushforward or cohomology-and-base-change theorem, relative effective-divisor or symmetric-power construction, Picard functor or representability theorem, Jacobian scheme, Abel–Jacobi morphism, universal property, or Jacobian base-change theorem.

## The frontier

- **The Picard group and divisor–line-bundle dictionary.** Complete the group of line-bundle isomorphism classes under tensor product and show that the divisor construction descends to, and exhausts, it under the appropriate curve hypotheses.
- **Coherent cohomology on proper curves.** Prove the finiteness and affine-acyclicity results needed to remove the present hypotheses from curve-level `H²` vanishing and Euler-characteristic additivity.
- **Genus, degree and duality.** Define genus and degree from cohomology, prove agreement with weighted divisor degree, and establish Riemann–Roch and Serre duality; these depend on the missing finiteness and vanishing results.
- **Relative cohomology and symmetric powers.** Build proper-flat pushforward, cohomology and base change, semicontinuity, relative effective Cartier divisors and `Symᵈ X`, which are prerequisites for the Abel-map route to representability.
- **The Jacobian scheme and Abel–Jacobi property.** Construct the rigidified relative Picard functor, prove representability and properness of `Pic⁰`, then define the Abel–Jacobi morphism and prove its universal property and base-change compatibility.

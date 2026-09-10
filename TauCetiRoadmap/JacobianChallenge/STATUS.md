<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"d8476fa9f4c2cec35cabffce100e7c2e75966e6c","ts":"2026-09-09T22:44:31Z"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `d8476fa` (2026-09-09T22:44:31Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete, and the Jacobian itself has not been constructed. Layer A now connects Weil divisors to Cartier divisors and line bundles under curve hypotheses; Layer B has an initial cohomology and Euler-characteristic framework; Layer E has tangent-space infrastructure. Layers C, D, and F remain untouched.

### Named results

- **Local principality of Weil divisors on curves** — on a Noetherian integral scheme of dimension at most one whose codimension-one local rings are discrete valuation rings, every Weil divisor is locally principal ([`isLocallyPrincipal_of_forall_coheight_le_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LocallyPrincipal.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.isLocallyPrincipal_of_forall_coheight_le_one)).
- **The locally principal Weil-to-Cartier construction** — a locally principal Weil divisor on such a curve determines a unique Cartier divisor with the prescribed local equations; the resulting homomorphism respects principal divisors, but no inverse or equivalence is established ([`existsUnique_cartierDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Cartier.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.IsLocallyPrincipal.existsUnique_cartierDivisor), [`toCartierDivisorHom`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Cartier.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toCartierDivisorHom)).
- **The divisor sheaf is a line bundle** — a locally principal Weil divisor produces an invertible sheaf `𝒪_X(D)`, while linear equivalence produces isomorphic divisor sheaves ([`isInvertible_sheaf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LocalTriviality.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.IsLocallyPrincipal.isInvertible_sheaf), [`nonempty_iso_sheaf_of_linearlyEquivalent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.nonempty_iso_sheaf_of_linearlyEquivalent)).
- **Mayer–Vietoris exactness for scheme-module cohomology** — the six-term segment associated with two open subsets is exact, yielding the expected vanishing propagation across a cover ([`mayerVietorisSequence_exact`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Cohomology/MayerVietoris.html#TauCeti.AlgebraicGeometry.Scheme.Modules.mayerVietorisSequence_exact)).
- **Additivity of the curve Euler characteristic** — for a short exact sequence, `dim H⁰ - dim H¹` is additive when the relevant cohomology groups are finite-dimensional and the first term has vanishing `H²` ([`finrank_cohomology_zero_sub_one_eq_add`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.html#AlgebraicGeometry.Scheme.Modules.finrank_cohomology_zero_sub_one_eq_add)).

### Notable definitions and infrastructure

- [`CartierDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/CartierDivisor/Basic.html#TauCeti.AlgebraicGeometry.Scheme.CartierDivisor) realizes Cartier divisors as global sections of `𝒦_X^× / 𝒪_X^×`, with local equations and transition-unit cocycles available for later gluing arguments.
- [`Cohomology`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Cohomology/Basic.html#TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology) gives `Hⁱ(X,M)` for sheaves of modules, together with functoriality, long exact sequences, open-set restriction, Mayer–Vietoris, and truncated Euler characteristics.
- [`TangentSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.html#TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace) equips the Zariski tangent space at an abelian variety’s identity with its ground-field vector-space structure and finite-dimensionality, preparing the eventual dimension calculation.

### Roadmap coverage

Layer A is the most developed but remains partial. Scheme Weil divisors, principal divisors, weighted degree, the abstract degree-zero divisor-class quotient, Cartier divisors, divisor sheaves, and tensor products of line bundles exist; what is still missing is `Pic X` as a group of line-bundle classes, inverses for that tensor product, the full Cartier–line-bundle and Weil–Cartier equivalences, and agreement between weighted degree and Euler-characteristic degree. Layer B is started: cohomology, exact sequences, Mayer–Vietoris, flasque vanishing, and conditional Euler-characteristic additivity exist, but affine acyclicity, proper coherent-cohomology finiteness, curve `H²` vanishing, genus, Riemann–Roch, Serre duality, and the dualizing sheaf do not. Layer E has the abelian-variety category and tangent space, but not `T₀Pic⁰ ≅ H¹(X,𝒪_X)`, duality, polarizations, or the theorem of the cube. No supplied declaration establishes the relative theory of Layer C, the Picard functor or representability of Layer D, or Abel–Jacobi and its universal property in Layer F. Part of one divisor-sheaf declaration list is truncated, so no stronger dictionary claim is inferred from it.

## The frontier

- **The Picard group and divisor dictionaries.** Form isomorphism classes of line bundles into a group under tensor product, construct tensor inverses, and prove the Cartier–line-bundle correspondence; the current Weil-to-Cartier map is only one direction.
- **Coherent cohomology on proper curves.** Establish affine acyclicity, finite-dimensionality over the ground field, and vanishing above dimension one; these turn the present conditional Euler characteristic into the input for genus and degree.
- **Riemann–Roch and Serre duality.** Build the relative dualizing sheaf and prove the formulas needed to identify Euler-characteristic degree with divisor degree.
- **Relative cohomology and base change.** Develop proper-flat pushforward, semicontinuity, Grauert-style base change, relative effective Cartier divisors, and symmetric powers before attempting representability.
- **The Picard scheme and Jacobian.** Define and rigidify the relative Picard functor, represent `Pic⁰`, prove properness, then construct Abel–Jacobi, its universal property, base-change compatibility, and the dimension and genus-one checks.

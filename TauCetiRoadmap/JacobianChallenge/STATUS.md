<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1","ts":"2026-10-19T17:10:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A","state":"done"},{"id":"Layer B","remaining":"finite-dimensionality of coherent cohomology on general proper schemes; a natural Serre duality pairing","state":"partial"},{"id":"Layer C","remaining":"coherence of higher direct images under proper maps, cohomology and base change, semicontinuity, symmetric powers Sym^d X","state":"partial"},{"id":"Layer D","remaining":"Hilbert quotients, representability of the Picard sheaf, smoothness and properness of Pic0, the obstruction sequence","state":"partial"},{"id":"Layer E","remaining":"theorem of the cube, projectivity, dual abelian variety, polarizations and theta, multiplication by n","state":"partial"},{"id":"Layer F","remaining":"Abel-Jacobi as a morphism to the Jacobian with the Albanese property, and base change","state":"partial"}],"readme_sha":"a03f0c60f9188e09fd799c9772cf2e0d4238184f8f1823b5cb9801a68a974477","roadmap":"JacobianChallenge","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `a5cde7b` (2026-10-19T17:10:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer A is done for curves. The curve case of Layer B is largely in place: Riemann–Roch, Serre duality through `Ω_{X/k}`, the Čech comparison and vanishing above degree one. General finiteness is not. The Picard functor now has its fppf sheaf, a `Pic⁰` subfunctor and an Abel–Jacobi map into it. Nothing is representable yet, so there is no Jacobian scheme. The abelian-variety theory beyond rigidity has not begun.

### Named results

- **The Riemann–Roch theorem**: on a proper integral curve over `k` with a rational point and discrete-valuation local rings in codimension one, `χ(𝒪_X(D)) = deg D + 1 − g` for every Weil divisor, where `g = dim H¹(X, 𝒪_X)` ([`eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/RiemannRoch/Basic.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus)).
- **Serre duality with the sheaf of differentials**: when `k` is integrally closed in `k(X)` and `Ω_{X/k}` is invertible, `H¹(X, L)^∨ ≅ H⁰(X, Ω_{X/k} ⊗ L⁻¹)` for every line bundle, and `Ω_{X/k}` has degree `2g − 2` ([`nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Modules/Differentials/Canonical.html#TauCeti.AlgebraicGeometry.nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual)). The isomorphism is only shown to exist, not built from a pairing.
- **The Cartier–Picard dictionary**: on an integral scheme, Cartier divisors modulo principal ones form the Picard group ([`classGroupAddEquivLineBundleClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.html#TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.classGroupAddEquivLineBundleClass)). On curves, `Pic⁰` is the degree-zero class group of the function field.
- **Points of an elliptic curve form `Pic⁰`**: Mathlib's chord-and-tangent group of an elliptic curve is isomorphic to `Pic⁰` of its projective model ([`pointAddEquivPicZero`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/PicZero.html#WeierstrassCurve.pointAddEquivPicZero)). This is the group-level form of the acceptance check `Jac(E) ≅ E`, reconciled with Mathlib.
- **Čech cohomology computes sheaf cohomology**: for a quasi-coherent sheaf on a locally Noetherian scheme with affine diagonal, any finite affine cover gives the cohomology through its Čech complex ([`homologyCechComplexIsoCohomology`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Cohomology/Cech.html#AlgebraicGeometry.Scheme.Modules.homologyCechComplexIsoCohomology)).

### Notable definitions and infrastructure

- [`relativePicardDegreeZeroFunctor`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/PicZero/Basic.html#TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFunctor) is `Pic⁰_{X/S}` for a smooth proper geometrically connected family of curves: the classes of degree zero on every geometric fibre. It also exists in rigidified form and has an fppf sheafification. Together with the sheafified Picard functor [`relativePicardFppfSheaf`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Fppf.html#TauCeti.AlgebraicGeometry.relativePicardFppfSheaf), it is the object a Jacobian scheme has to represent.
- [`abelJacobiMapToPicZeroFppf`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Abel/Fppf.html#TauCeti.AlgebraicGeometry.abelJacobiMapToPicZeroFppf) is the Abel–Jacobi map `x ↦ 𝒪(Γₓ − x₀)`, defined on the functor of points of `X` and sending `x₀` to zero.
- [`IsAlbanese`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.html#TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese) states the universal property that Abel–Jacobi must satisfy, with uniqueness up to unique isomorphism.

### Roadmap coverage

- **Layer A is done** in the curve setting.
- **Layer B is partial.** It has genus, Riemann–Roch, duality through `Ω_{X/k}` with `deg Ω = 2g − 2`, affine acyclicity, the Čech comparison for finite affine covers, and vanishing above degree one on curves. It lacks finite-dimensionality of coherent cohomology on general proper schemes.
- **Layer C is partial.** It has flat base change for `H⁰` and `H¹` on two-affine covers, which gives invariance of the genus and of degree under field extension, and higher direct images, computed only for closed immersions. On divisors, there are degree-`d` relative divisor functors, `X` representing degree one, and coefficient charts on the affine line. It lacks coherence of `R^q f_*` for proper `f`, cohomology and base change, semicontinuity, and `Symᵈ X`.
- **Layer D is partial.** The fppf Picard sheaf, `Pic⁰_{X/S}` and the Abel maps exist. Missing are the obstruction sequence, Hilbert quotients, representability, smoothness with `T₀Pic⁰ ≅ H¹(X, 𝒪_X)`, and properness.
- **Layers E and F are partial.** Layer E has rigidity and the tangent space only, with no cube theorem, projectivity, dual or polarization. Layer F has the Albanese property stated and Abel–Jacobi as a map of functors, but no scheme morphism and no base-change theorem.

## The frontier

- **Finiteness of coherent cohomology.** Prove `H^q(X, F)` finite over a Noetherian base for proper `X`, and `R^q f_* F` coherent. The Čech comparison and the `ℙ¹` computation (genus zero, `H⁰(ℙ¹_R, 𝒪) = R`) are the starting points for the projective case. The proper case also needs Chow's lemma.
- **Cohomology and base change.** Semicontinuity, Grauert, and flat base change beyond two-affine covers. Layer D's twisted charts depend on these.
- **Representing `Pic⁰`.** Build the Hilbert quotient and projective Picard representability, then identify the result with the rigidified `Pic⁰` functor. This needs Hilbert schemes from SchemeAndStackFoundations §4.14 and the two items above.
- **`Symᵈ X` and the Abel maps.** Represent degree-`d` relative divisors by `Symᵈ X`. The degree-zero and degree-one cases and the affine-line chart are done. Then prove `AJ_d` surjective for `d ≥ g`.
- **Abelian-variety theory and the Albanese property.** The theorem of the cube, projectivity, duals and polarizations are all untouched. Abel–Jacobi as a morphism satisfying `IsAlbanese` waits on them and on representability.

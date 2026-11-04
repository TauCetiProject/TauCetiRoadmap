<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A","state":"done"},{"id":"Layer B","remaining":"finite-dimensionality of coherent cohomology on general proper schemes; a natural Serre duality pairing","state":"partial"},{"id":"Layer C","remaining":"coherence of higher direct images under proper maps beyond P1 and finite maps, cohomology and base change, semicontinuity, Sym^d X","state":"partial"},{"id":"Layer D","remaining":"Hilbert quotients, representability of the Picard sheaf, smoothness and properness of Pic0, the obstruction sequence","state":"partial"},{"id":"Layer E","remaining":"theorem of the cube, projectivity, dual abelian variety, polarizations and theta, multiplication by nonzero n","state":"partial"},{"id":"Layer F","remaining":"Abel-Jacobi as a closed-immersion morphism to the Jacobian with the Albanese property, and base change","state":"partial"}],"readme_sha":"a03f0c60f9188e09fd799c9772cf2e0d4238184f8f1823b5cb9801a68a974477","roadmap":"JacobianChallenge","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer A is done for curves. The curve case of Layer B is largely in place, with Riemann–Roch, Serre duality through `Ω_{X/k}` and vanishing above degree one. Finiteness of cohomology is proved only for curves and for `ℙ¹` over a Noetherian ring. The fppf Picard sheaf, its `Pic⁰` subfunctor and an Abel–Jacobi map that separates points are all in place. Nothing is representable yet, so there is no Jacobian scheme. The abelian-variety theory beyond rigidity and dimension zero has not begun.

### Named results

- **The Riemann–Roch theorem**: on a proper integral curve over `k` with a rational point and discrete-valuation local rings in codimension one, `χ(𝒪_X(D)) = deg D + 1 − g` for every Weil divisor, where `g = dim H¹(X, 𝒪_X)` ([`eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/RiemannRoch/Basic.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus)).
- **Serre duality with the sheaf of differentials**: when `k` is integrally closed in `k(X)` and `Ω_{X/k}` is invertible, `H¹(X, L)^∨ ≅ H⁰(X, Ω_{X/k} ⊗ L⁻¹)` for every line bundle, and `Ω_{X/k}` has degree `2g − 2` ([`nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Modules/Differentials/Canonical.html#TauCeti.AlgebraicGeometry.nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual)). The isomorphism is only shown to exist, not built from a pairing.
- **The Cartier–Picard dictionary**: on an integral scheme, Cartier divisors modulo principal ones form the Picard group ([`classGroupAddEquivLineBundleClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.html#TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.classGroupAddEquivLineBundleClass)). On curves, `Pic⁰` is the degree-zero class group of the function field.
- **Points of an elliptic curve form `Pic⁰`**: Mathlib's chord-and-tangent group of an elliptic curve is isomorphic to `Pic⁰` of its projective model ([`pointAddEquivPicZero`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/PicZero.html#WeierstrassCurve.pointAddEquivPicZero)). This is the group-level form of the acceptance check `Jac(E) ≅ E`.
- **Abel–Jacobi separates points in positive genus**: on a smooth proper geometrically connected curve of genus at least one, distinct `K`-points have distinct Abel–Jacobi images for every field extension `K` ([`abelJacobiMap_app_injective_of_genus_pos`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Abel/PointSeparation.html#TauCeti.AlgebraicGeometry.abelJacobiMap_app_injective_of_genus_pos)). This is the pointwise half of the closed-immersion check.

### Notable definitions and infrastructure

- [`relativePicardDegreeZeroFunctor`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/PicZero/Basic.html#TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFunctor) is `Pic⁰_{X/S}` for a smooth proper geometrically connected family of curves. It has rigidified and fppf-sheafified forms, and with [`relativePicardFppfSheaf`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Fppf.html#TauCeti.AlgebraicGeometry.relativePicardFppfSheaf) it is the object a Jacobian scheme has to represent.
- [`abelJacobiMapToPicZeroFppf`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Abel/Fppf.html#TauCeti.AlgebraicGeometry.abelJacobiMapToPicZeroFppf) is the Abel–Jacobi map `x ↦ 𝒪(Γₓ − x₀)` on the functor of points of `X`, sending `x₀` to zero. It becomes the roadmap's morphism once `Pic⁰` is representable.
- [`IsAlbanese`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.html#TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese) states the universal property Abel–Jacobi must satisfy, with uniqueness up to unique isomorphism.

### Roadmap coverage

- **Layer A is done** in the curve setting.
- **Layer B is partial.** It has genus, Riemann–Roch, duality through `Ω_{X/k}` with `deg Ω = 2g − 2`, affine acyclicity, the Čech comparison for finite affine covers, and vanishing above degree one on curves. Finiteness on general proper schemes is missing.
- **Layer C is partial.** It has finiteness of all cohomology of finite-type sheaves on `ℙ¹_R` over Noetherian `R`. Higher direct images vanish along affine morphisms and are coherent along finite ones. Flat base change holds for `H⁰` and `H¹` on two-affine covers. It also has relative divisor functors, with `X` representing degree one. It lacks coherence of `R^q f_*` for proper `f`, cohomology and base change, semicontinuity, and `Symᵈ X`.
- **Layer D is partial.** The fppf Picard sheaf, `Pic⁰_{X/S}` and the Abel maps exist. The obstruction sequence, Hilbert quotients, representability, smoothness with `T₀Pic⁰ ≅ H¹(X, 𝒪_X)`, and properness are missing.
- **Layers E and F are partial.** Layer E has rigidity, the tangent space, and the dimension-zero facts: an abelian variety is zero exactly in dimension zero, where every `[n]` is the identity. It has no cube theorem, projectivity, dual or polarization. Layer F has the Albanese property stated and Abel–Jacobi as an injective-on-points map of functors, but no scheme morphism and no base-change theorem.

## The frontier

- **Finiteness of coherent cohomology.** Extend the `ℙ¹_R` result to `ℙⁿ_R` and projective morphisms, then prove `R^q f_* F` coherent for proper `f`. The proper case also needs Chow's lemma.
- **Cohomology and base change.** Semicontinuity, Grauert, and flat base change beyond two-affine covers. Layer D's twisted charts depend on these.
- **Representing `Pic⁰`.** Build the Hilbert quotient and projective Picard representability, then identify the result with the rigidified `Pic⁰` functor. This needs Hilbert schemes from SchemeAndStackFoundations §4.14 and the two items above.
- **`Symᵈ X` and the Abel maps.** Represent degree-`d` relative divisors by `Symᵈ X`, then prove `AJ_d` surjective for `d ≥ g`. Upgrading point separation to a closed immersion also needs injectivity on tangent vectors, and a target scheme.
- **Abelian-variety theory and the Albanese property.** The theorem of the cube, projectivity, duals and polarizations are untouched. Abel–Jacobi as a morphism satisfying `IsAlbanese` waits on them and on representability.

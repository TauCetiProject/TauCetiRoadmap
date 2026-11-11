<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A","state":"done"},{"id":"Layer B","remaining":"finite-dimensionality of coherent cohomology on general proper schemes; a natural Serre duality pairing","state":"partial"},{"id":"Layer C","remaining":"coherence of R^q f_* for proper f, semicontinuity, cohomology and base change and Grauert beyond two-affine covers, Sym^d X","state":"partial"},{"id":"Layer D","remaining":"obstruction sequence, Hilbert quotients, representability of the Picard sheaf, smoothness and properness of Pic0","state":"partial"},{"id":"Layer E","remaining":"theorem of the cube, projectivity, dual abelian variety, polarizations and theta, multiplication by nonzero n","state":"partial"},{"id":"Layer F","remaining":"Abel-Jacobi as a closed-immersion morphism to the Jacobian with the Albanese property, and base change","state":"partial"}],"readme_sha":"a03f0c60f9188e09fd799c9772cf2e0d4238184f8f1823b5cb9801a68a974477","roadmap":"JacobianChallenge","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer A is done for curves. The curve case of Layer B is in place: Riemann–Roch, Serre duality through `Ω_{X/k}`, and finite-dimensional coherent cohomology that vanishes above degree one. Flat base change holds in all degrees and the cohomology of `𝒪(m)` on `ℙⁿ_R` is computed, but higher direct images under proper maps are not yet coherent. Nothing is representable, so there is no Jacobian scheme, and abelian-variety theory beyond rigidity and dimension counts has not begun.

### Named results

- **The Riemann–Roch theorem**: on a proper integral curve over `k` with a rational point and discrete-valuation local rings in codimension one, `χ(𝒪_X(D)) = deg D + 1 − g` for every Weil divisor, where `g = dim H¹(X, 𝒪_X)` ([`eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/RiemannRoch/Basic.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus)).
- **Serre duality with the sheaf of differentials**: when `k` is integrally closed in `k(X)` and `Ω_{X/k}` is invertible, `H¹(X, L)^∨ ≅ H⁰(X, Ω_{X/k} ⊗ L⁻¹)` for every line bundle, and `Ω_{X/k}` has degree `2g − 2` ([`nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Modules/Differentials/Canonical.html#TauCeti.AlgebraicGeometry.nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual)). The isomorphism is shown to exist, not built from a pairing.
- **Flat base change for cohomology**: for a quasi-coherent sheaf on a quasi-compact scheme over `R` with affine diagonal and a flat `R → R'`, `R' ⊗_R Hⁿ(X, M) ≅ Hⁿ(X_{R'}, M)` in every degree, so cohomology dimensions are invariant under field extension ([`cohomologyBaseChangeLinearEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.html#TauCeti.AlgebraicGeometry.cohomologyBaseChangeLinearEquiv)).
- **Points of an elliptic curve form `Pic⁰`**: Mathlib's chord-and-tangent group is isomorphic to `Pic⁰` of the projective model ([`pointAddEquivPicZero`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/PicZero.html#WeierstrassCurve.pointAddEquivPicZero)).
- **Abel–Jacobi separates points in positive genus**: on a smooth proper geometrically connected curve of genus at least one, distinct `K`-points have distinct Abel–Jacobi images for every field extension `K` ([`abelJacobiMap_app_injective_of_genus_pos`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Abel/PointSeparation.html#TauCeti.AlgebraicGeometry.abelJacobiMap_app_injective_of_genus_pos)).

### Notable definitions and infrastructure

- [`relativePicardDegreeZeroFunctor`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/PicZero/Basic.html#TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFunctor) is `Pic⁰_{X/S}` for a smooth proper geometrically connected family of curves. It agrees with the degree-zero rigidified classes, has an fppf sheaf, commutes with base change of the family, and is the object the Jacobian has to represent.
- [`abelJacobiMapToPicZeroFppf`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Abel/Fppf.html#TauCeti.AlgebraicGeometry.abelJacobiMapToPicZeroFppf) is the Abel–Jacobi map `x ↦ 𝒪(Γₓ − x₀)` on functors of points, sending `x₀` to zero.
- [`WeierstrassCurve.toAbelianVariety`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/AbelianVariety.html#WeierstrassCurve.toAbelianVariety) makes an elliptic curve an abelian variety of dimension one, compatibly with field extension. The genus-one checks in Layers E and F can be stated on it.

### Roadmap coverage

- **Layer A is done** in the curve setting.
- **Layer B is partial.** The curve case is complete, including finite-dimensional cohomology of every finite-type sheaf. Finiteness on general proper schemes and a natural duality pairing are missing.
- **Layer C is partial.** It has flat base change over affine bases in all degrees, and for `f_*` as sheaves. Cohomology of `𝒪(m)` on `ℙⁿ_R` is computed in every degree, including the [top degree](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Cohomology/ProjectiveSpace/HigherCohomology.html#Module.Basis.nonempty_linearEquiv_cohomology_top_twistingSheaf), and is finitely generated for `n ≥ 1`. Semicontinuity and degree-zero cohomology and base change hold for two-affine covers. Coherence of `R^q f_*` for proper `f`, the general semicontinuity, cohomology and base change, and Grauert theorems, and `Symᵈ X` are missing.
- **Layer D is partial.** The fppf Picard sheaf, `Pic⁰_{X/S}`, its base change and the Abel maps exist, and bundles of degree at least `g` are effective. It lacks the obstruction sequence, Hilbert quotients, representability, smoothness and properness.
- **Layers E and F are partial.** Layer E has rigidity, the tangent space, dimension zero, and elliptic curves and their products in dimensions one and two. It has no cube theorem, projectivity, dual, polarization or `[n]` for `n ≠ 0`. Layer F states the Albanese property, and has Abel–Jacobi on functors of points, but no Abel–Jacobi morphism of schemes, universal property or base change.

## The frontier

- **Coherence of higher direct images.** With the cohomology of `𝒪(m)` on `ℙⁿ_A` known, prove Serre's theorem that every coherent sheaf on `ℙⁿ_A` is a quotient of a finite sum of twists `𝒪(−m)`, then finiteness for projective morphisms, and reach the proper case by Chow's lemma.
- **Cohomology and base change beyond two-affine covers.** The algebra has landed: finite free models of complexes, locally constant fibre Euler characteristics, and freeness from constant fibre dimension over reduced rings. What remains is the Mumford complex for proper flat `f`, and semicontinuity and Grauert from it.
- **Representing the Picard sheaf.** Build the Hilbert quotient and projective Picard representability, then compare with the rigidified functor. This needs Hilbert schemes from SchemeAndStackFoundations §4.14 and the two items above.
- **`Symᵈ X` and the Abel maps.** Represent degree-`d` relative divisors by `Symᵈ X`, then upgrade the effectivity of degree-`d ≥ g` bundles to surjectivity of `AJ_d`. A closed immersion also needs injectivity on tangent vectors.
- **Abelian-variety theory and the Albanese property.** The theorem of the cube, projectivity, duals and polarizations are untouched. Abel–Jacobi as a morphism satisfying `IsAlbanese` waits on them and on representability.

<!--tauceti-status:v1 {"roadmap":"JacobianChallenge","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A","remaining":"A.3: discharge the standing curve's hypotheses for the existing degree results; P^1 checks such as the squaring-map pullback","state":"partial"},{"id":"Layer B","remaining":"finite-dimensional cohomology on proper schemes; Serre duality through a named residue trace; standing-curve forms of B.3-B.4","state":"partial"},{"id":"Layer C","remaining":"coherence of R^q f_* for proper f, flat base change over a non-affine base, semicontinuity, cohomology and base change, Grauert, Hilb^d","state":"partial"},{"id":"Layer D","remaining":"named Picard scheme, Hilbert quotients, representability, smoothness and properness of Pic0, the Jacobian over any field","state":"partial"},{"id":"Layer E","remaining":"theorem of the cube, projectivity, dual abelian variety, polarizations and theta, autoduality, multiplication by nonzero n","state":"partial"},{"id":"Layer F","remaining":"Abel-Jacobi as a morphism with the Albanese property, closed immersion in positive genus, base change","state":"partial"}],"readme_sha":"57042c8c09e0d651682823b6518c522fc0512807e2317e64f14c1fd4407b0d0f","roadmap":"JacobianChallenge","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: JacobianChallenge

This file documents the status of the JacobianChallenge roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Much of the curve theory over a field is in place: Picard groups, degree, Riemann–Roch, Serre duality as an existence statement, and flat base change over an affine base. The README treats these as supplied results, so no layer is complete. Nothing is yet representable, so there is no Picard scheme, Jacobian or Abel–Jacobi morphism, and the main abelian-variety milestones have not begun.

### Named results

- **The Riemann–Roch theorem** — on a proper integral curve over `k` with a rational point and discrete-valuation local rings in codimension one, `χ(𝒪_X(D)) = deg D + 1 − g` for every Weil divisor ([`eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/RiemannRoch/Basic.html#TauCeti.AlgebraicGeometry.SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus)).
- **Serre duality with the sheaf of differentials** — over an exact constant field with `Ω_{X/k}` invertible, `H¹(X, L)^∨ ≅ H⁰(X, Ω_{X/k} ⊗ L⁻¹)` for every line bundle ([`nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Modules/Differentials/Canonical.html#TauCeti.AlgebraicGeometry.nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual)). Only existence is proved, not a trace pairing.
- **Flat base change for cohomology** — for a quasi-coherent sheaf on a quasi-compact quasi-separated scheme over `R` and a flat `R → R'`, `R' ⊗_R Hⁿ(X, M) ≅ Hⁿ(X_{R'}, M)` in every degree ([`bijective_cohomologyBaseChange`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.html#TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange)).
- **Pointed morphisms are homomorphisms** — over a field, a morphism from a proper geometrically integral monoid scheme to a locally finite type group scheme that preserves the identity is a homomorphism ([`isMonHom_of_one_hom`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Rigidity/GroupScheme.html#TauCeti.AlgebraicGeometry.isMonHom_of_one_hom)).
- **Abel–Jacobi separates points in positive genus** — on a smooth proper geometrically connected curve of genus at least one, distinct `K`-points have distinct Abel–Jacobi images for every field extension `K` ([`abelJacobiMap_app_injective_of_genus_pos`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/Abel/PointSeparation.html#TauCeti.AlgebraicGeometry.abelJacobiMap_app_injective_of_genus_pos)).

### Notable definitions and infrastructure

- [`relativePicardDegreeZeroFunctor`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/PicardFunctor/PicZero/Basic.html#TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFunctor) is `Pic⁰_{X/S}`, the functor the Jacobian must represent. It has an fppf sheaf, commutes with base change and receives the Abel–Jacobi map.
- Mumford's finite projective model ([`exists_quasiIso_finite_projective`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ModuleCat/BaseChange.html#CochainComplex.exists_quasiIso_finite_projective)) replaces a bounded flat complex with finitely generated cohomology by a bounded complex of finite projectives, compatibly with base change. It supplies the algebra behind semicontinuity in every degree.
- Hartshorne's Lemma II.5.14 says that sections over the nonvanishing locus of a line-bundle section extend after tensoring with a power of it ([`exists_map_eq_tmulRight_tensorPowSection`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/LineBundle/TwistedSections.html#AlgebraicGeometry.Scheme.Modules.exists_map_eq_tmulRight_tensorPowSection)). Ampleness can be checked at closed points ([`isAmple_iff_forall_isClosed_singleton`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/LineBundle/Ample.html#TauCeti.AlgebraicGeometry.LineBundleClass.isAmple_iff_forall_isClosed_singleton)). And `𝒪(n)` on `Proj A` is [defined for every `n ∈ ℤ`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/ProjectiveSpectrum/TwistingSheaf/Basic.html#AlgebraicGeometry.Proj.twistingSheaf) as a sheaf of local homogeneous fractions.

### Roadmap coverage

The README states only what remains in each layer, so every layer is partial.
- **Layer A** lacks only A.3's packaging (the proof that the standing curve meets the hypotheses of the existing degree results) and a few `ℙ¹` checks.
- **Layer B** lacks finite-dimensional cohomology on general proper schemes (B.1) and Serre duality through a named residue trace (B.2). B.3 and B.4 need the standing curve's hypotheses discharged.
- **Layer C** has flat base change over an affine base. It lacks coherence of `R^q f_*` for proper `f`, flat base change over a non-affine base, semicontinuity, cohomology and base change, Grauert beyond two-affine covers, and `Hilbᵈ`.
- **Layer D** has the Picard sheaf, `Pic⁰_{X/S}`, base change and Abel maps on functors. It lacks the named Picard scheme, Hilbert quotients, representability, smoothness, properness and the Jacobian.
- **Layer E** has the definition of an abelian variety, rigidity, the tangent space and elliptic curves. It lacks the cube, projectivity, the dual, polarizations, autoduality, and `[n]` for `n ≠ 0`.
- **Layer F** has Abel–Jacobi on points, point separation and the Albanese property as a definition. It lacks the morphism, the universal property, the closed immersion and base change.

## The frontier

- **Serre duality through the trace (B.2).** Define `tr_{X/k}` as a sum of Tate residues and prove its universal property. The local components and residue theorem exist.
- **Coherence of higher direct images (C.1, hence B.1).** Use II.5.14, the ampleness criterion and the new `𝒪(n)` on `Proj A` to show that high twists of a coherent sheaf on `ℙⁿ_A` are globally generated. Then get finiteness for projective morphisms and handle the proper case with Chow's lemma (SchemeAndStackFoundations §4.12).
- **Semicontinuity and cohomology and base change in every degree.** The algebra is in place. What remains is to produce Mumford's complex for a proper flat `f`, which needs C.1's finitely generated cohomology, and then to deduce Grauert.
- **`Hilbᵈ` and representing the Picard sheaf.** Glue `Symᵈ X` from affine pieces (C.4), then build Hilbert quotients and projective Picard representability (D.2–D.4). These also need SchemeAndStackFoundations §4.9 and §4.14.
- **Abelian varieties and the Albanese property.** The theorem of the cube, projectivity and the dual have not been started. The Abel–Jacobi morphism and `isAlbanese_abelJacobi` wait on them and on the Jacobian of D.8.

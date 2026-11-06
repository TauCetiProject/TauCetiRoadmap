<!--tauceti-status:v1 {"roadmap":"ComplexKahlerGeometry","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
# Status: ComplexKahlerGeometry

This file documents the status of the ComplexKahlerGeometry roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** K3.0 is done. K1's almost complex type calculus and K2's Dolbeault operator identities are in place, but K1 lacks submanifolds and Newlander–Nirenberg, and K2 lacks the Dolbeault complex and its local lemmas. K3.MeromorphicGermField and K7.1 are nearly finished; K5a has its Hodge star. Holomorphic bundles (K4), compact Hodge theory (K5b, K6) and the Frölicher spectral sequence (K8) have not started.

### Named results

- **∂̄² = 0 on complex manifolds**: on the complex-valued smooth forms of a complex manifold, [`d = ∂ + ∂̄`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/Dolbeault/ComplexManifold.html#TauCeti.SmoothAlmostComplexStructure.mextDerivₗ_eq_del_add_delBar_ofComplexManifold) and [`∂̄∂̄ = 0`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/Dolbeault/ComplexManifold.html#TauCeti.SmoothAlmostComplexStructure.delBar_delBar_ofComplexManifold).
- **Integrability of `T^(1,0)`**: for a smooth almost complex structure, the `i`-eigenbundle of the complexified tangent bundle is involutive exactly when the Nijenhuis tensor vanishes ([`isInvolutiveComplexDistribution_eigenspace_I_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/Eigenbundle.html#TauCeti.SmoothAlmostComplexStructure.isInvolutiveComplexDistribution_eigenspace_I_iff)).
- **Osgood's lemma**: a function of finitely many complex variables that is continuous and holomorphic in each variable separately is jointly analytic ([`ContinuousOn.analyticOnNhd_of_differentiableAt_update`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyIntegralPolydisc.html#ContinuousOn.analyticOnNhd_of_differentiableAt_update)).
- **The codifferential is the formal adjoint of `d`**: on an oriented boundaryless Riemannian manifold, `∫⟨dα, β⟩ = ∫⟨α, d*β⟩` for smooth forms, one of them compactly supported ([`integralTopForm_inner_mextDeriv_eq_inner_codifferential`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Codifferential.html#TauCeti.SmoothForm.integralTopForm_inner_mextDeriv_eq_inner_codifferential)).
- **The principal-part splitting**: a meromorphic germ at a point of ℂ is uniquely its principal part, a polynomial in `(z - a)⁻¹`, plus a holomorphic germ ([`evalInvSub_principalPart_add_toMeromorphicGerms_regularPart`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/StructureSheaf/MeromorphicGerm.html#TauCeti.holomorphicStructureSheaf.evalInvSub_principalPart_add_toMeromorphicGerms_regularPart)).

### Notable definitions and infrastructure

- **Type projections of smooth forms**: for any smooth almost complex structure, the [projections onto type `(p,q)`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/AlmostComplexType.html#TauCeti.SmoothAlmostComplexStructure.typeProjection) are complementary idempotents, built as polynomials in the derivation that `J` induces on forms. ∂, ∂̄ and the four bidegrees of `d` are stated on them.
- **The Hodge star on Riemannian manifolds**: the [Hodge star of smooth forms](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/HodgeStar.html#TauCeti.SmoothForm.hodgeStar) is built pointwise from the inner-product-space star, and satisfies `α ∧ ⋆β = ⟨α, β⟩ vol` and `⋆⋆ = (-1)^{kl}`. It carries the codifferential and the complex star with its type law, which K5b will consume.
- **Complex de Rham cohomology**: the [complex de Rham complex](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/ComplexCoefficients.html#TauCeti.complexDeRhamComplex) is a cochain complex of complex vector spaces, and its cohomology is [the complexification of real de Rham cohomology](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/ComplexCoefficients.html#TauCeti.complexDeRhamCohomology.complexificationEquiv).

### Roadmap coverage

K3.0 is done, though the local defining-equation comparisons K6 asks of it are not established. K1 is partial. Done: the complex module of forms, the flat `dz` criterion for holomorphy, the joint holomorphic implicit map with local uniqueness, the eigenbundles, `(p,q)` types with wedge, pullback and conjugation, the four bidegrees of `d`, and the Nijenhuis tensor with its type identities, the ∂̄² and ∂² formulas and the involutivity equivalence. A complex orientation lift with positive chart signs exists, but its laws for biholomorphisms, products and pullback were not found. Holomorphic submanifolds and Newlander–Nirenberg are untouched. K2 is partial: ∂ and ∂̄ have their bidegrees, squares, anticommutation, Leibniz rule, conjugation and pullback naturality, and ∂̄-closed functions are holomorphic. The Cauchy transform solves `∂̄u = f` locally, with parameters. The whole-domain Runge solver, the Dolbeault–Grothendieck lemma, the Dolbeault complex, its sheaves and the Dolbeault theorem are absent. K3.MeromorphicGermField is done except for transporting products of Laurent series and an explicit comparison with GlobalHolomorphicFunctions' coefficients, neither established here. K3.HolomorphicStalk has only domain stalks and coordinate generation of the maximal ideal; power series and Weierstrass preparation are untouched, as is the rest of K3. K5a is partial: it has the real and complex Hodge star with their identities, the codifferential, the complex de Rham complex, the delta-series failure and chart `C^k` seminorms, but not the orientation line, density bundle, bundle distributions or Sobolev scale. K7.1 is done except for comparing its atlas and orientation with K1's. K4, K5b, K6, K7.2–K7.4 and K8 are untouched.

## The frontier

- **The Dolbeault complex**: package ∂̄ on `(p,•)` forms as a cochain complex in `ModuleCat ℂ` and define `H^(p,q)_∂̄` with functoriality and the `H^(p,0)` identification. Every identity it needs is proved.
- **The whole-domain parameter solver and Dolbeault–Grothendieck lemma**: extend the local parametric solution of `∂̄u = f` to whole plane domains by the Runge-exhaustion scheme, then eliminate variables on polydiscs. This consumes GlobalHolomorphicFunctions' finite-rank Runge operator.
- **K7.1 orientation comparison**: show the projective atlas carries [the canonical complex orientation](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/Orientation.html#TauCeti.complexOrientationLift). Both sides now exist.
- **K3.HolomorphicStalk**: several-variable power-series comparison, then Weierstrass preparation and division via the contour and Newton-identity route the roadmap describes.
- **Newlander–Nirenberg**: the Nijenhuis calculus it starts from is now complete, but Webster's iteration still needs Henkin's homotopy operator and Hölder–Zygmund estimates.

<!--tauceti-status:v1 {"roadmap":"RiemannianGeometry","to_sha":"fe8ca8b0765fa23cc5b5baaa3652c8efcd50ad3c","ts":"2026-10-24T01:02:20Z"}-->
# Status: RiemannianGeometry

This file documents the status of the RiemannianGeometry roadmap up until `fe8ca8b` (2026-10-24T01:02:20Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Of the roadmap, only the algebraic core of R1's curvature calculus is in substantial shape. It has both Bianchi identities, polarization, the constant-curvature characterization, Schur's theorem and the conformal change laws. The round sphere and upper half-space have been computed as constant-curvature models. I found nothing yet on Jacobi fields, index theory, comparison geometry, minimal submanifolds, Bochner identities or spherical harmonics.

### Named results

- **The second Bianchi identity**: for a smooth connection on any vector bundle and a torsion-free connection on the tangent bundle, the cyclic sum of covariant derivatives of the curvature vanishes ([`covariantDerivative_curvatureOperator_cyclic_eq_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/SecondBianchi.html#CovariantDerivative.covariantDerivative_curvatureOperator_cyclic_eq_zero)).
- **Sectional curvature determines the curvature tensor**: the Riemann tensor is the unique form with the curvature symmetries whose sectional numerators on independent pairs are the given ones ([`riemannCurvatureTensor_eq_of_forall_linearIndependent`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Riemann.html#CovariantDerivative.IsMetricCompatible.riemannCurvatureTensor_eq_of_forall_linearIndependent)).
- **The constant-curvature characterization**: constant sectional curvature κ holds exactly when `R(w,u)v = κ(⟨u,v⟩w − ⟨w,v⟩u)` everywhere ([`hasConstantSectionalCurvature_iff_isConstantCurvatureTensor`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Polarization.html#CovariantDerivative.hasConstantSectionalCurvature_iff_isConstantCurvatureTensor)). It then follows that Ric = (n−1)κg and the scalar curvature is n(n−1)κ. Dimension at most one is treated separately.
- **Schur's theorem**: if every tangent two-plane at each point of a connected manifold of dimension at least three has the same sectional curvature, that curvature is constant. The theorem is in the library as `CovariantDerivative.hasConstantSectionalCurvature_of_forall_hasSectionalCurvatureAt`.
- **Curvature under conformal change**: the curvature operator of the Levi-Civita connection of a rescaled metric, for a `C¹` metric and a positive function ([`curvatureOperator_leviCivitaConnection_rescale`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Conformal.html#Bundle.ContMDiffRiemannianMetric.curvatureOperator_leviCivitaConnection_rescale)). The library also carries the Ricci, scalar, Schouten and Weyl transformation laws.

### Notable definitions and infrastructure

- **Curvature of a connection plus a one-form** ([`curvatureOperator_addOneForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/AddOneForm.html#CovariantDerivative.curvatureOperator_addOneForm)): this one formula covers every transformation law of the form ∇̃ = ∇ + A. Conformal change is the first use, and other metric changes are expected to follow the same route.
- **The polarization identity for curvature-type tensors** ([`six_mul_apply_eq_of_cyclic_eq_zero`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Multilinear/SectionalPolarization.html#LinearMap.six_mul_apply_eq_of_cyclic_eq_zero)): pure multilinear algebra, kept independent of manifolds, so it serves any curvature-like tensor.
- **The Jacobi identity for the manifold Lie bracket** ([`jacobi_identity_mlieBracket_apply`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorField/LieBracket.html#VectorField.jacobi_identity_mlieBracket_apply)): the second Bianchi identity needed it, and so will the left-invariant Lie-group computations.

### Roadmap coverage

R1 is partial. Items 1–2 are essentially done for torsion-free metric connections: the symmetries, both Bianchi identities, polarization, constant curvature and the low-dimensional cases. Item 3 has Schur's theorem. I could not establish the Einstein-constancy statement, local symmetry, or flat-implies-locally-Euclidean. The normal-coordinate jets of item 4, which wait on R2, are absent. In the transformation block the conformal law is present, but I found no bi-invariant Lie-group metrics, Riemannian submersions or projective examples. R4 is partial only through its direct models: the round sphere has curvature +1 and the upper-half-space metric −1. Its comparison theorems are untouched. Some flat-ambient groundwork for R5a and R6 exists: the Gauss formula for isometric immersions into Euclidean space, and a shape operator whose eigenvalues locate the focal points of the squared-distance function. The general immersion and normal-exponential theory is not established here. R2, R3, R5b, R7 and R8 appear untouched.

## The frontier

- **Contracted Bianchi and Einstein constancy**: with the second Bianchi identity and Schur's theorem in place, the next step is to prove that `Ric = a(x)g` forces `a` constant in dimension at least three.
- **Local symmetry**: define ∇R = 0 and prove that parallel transport preserves R exactly when it holds. Constant curvature already gives the hypothesis, so that implication is the cheap first case.
- **Remaining transformation laws**: scaling, products, pullbacks and warped products. The one-form formula above should carry most of the load.
- **Jacobi fields (R2)**: the gateway to the normal-coordinate jets, index forms and every comparison theorem in R4. Nothing for it is in place yet.
- **Riemannian submersions and bi-invariant metrics**: the O'Neill tensors and the formula `R(X,Y)Z = −¼[[X,Y],Z]` have no prerequisite beyond R1's connection algebra.

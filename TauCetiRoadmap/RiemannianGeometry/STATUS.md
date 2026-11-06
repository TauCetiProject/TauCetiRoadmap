<!--tauceti-status:v1 {"roadmap":"RiemannianGeometry","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
# Status: RiemannianGeometry

This file documents the status of the RiemannianGeometry roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** R1's curvature calculus is largely in place through Schur's theorem, Einstein constancy and the first facts about local symmetry, but the normal-coordinate jets are still missing. R2's Jacobi-field theory is substantially partial, and R7.0's scalar Bochner identity and Lichnerowicz bound are proved except for the equality case. The polynomial half of R8.1 is done. Index theory (R3), the comparison theorems of R4, hypersurface stability (R5b), the bundle Weitzenböck identities (R7.1 onward) and spectral completeness (R8.2 onward) have not begun.

### Named results

- **The second Bianchi identity**: for a smooth connection on any vector bundle and a torsion-free connection on the tangent bundle, the cyclic sum of covariant derivatives of the curvature vanishes ([`covariantDerivative_curvatureOperator_cyclic_eq_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/SecondBianchi.html#CovariantDerivative.covariantDerivative_curvatureOperator_cyclic_eq_zero)).
- **Einstein's constancy theorem**: if Ric = a·g for a function a on a connected manifold of dimension other than two, then a is constant ([`eq_of_ricciTensor_eq_smul_inner`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Einstein.html#CovariantDerivative.eq_of_ricciTensor_eq_smul_inner)).
- **The Lichnerowicz estimate**: on a closed n-manifold, n ≥ 2, with Ric ≥ (n−1)k·g, every positive Laplace eigenvalue is at least nk ([`finrank_mul_le_of_laplaceBeltrami_eq_neg_mul`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Lichnerowicz.html#TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul)). It comes from the pointwise [Bochner formula](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Bochner/Basic.html#TauCeti.Manifold.laplaceBeltrami_norm_sq_mgradient) for Δ|grad f|², integrated over the manifold.
- **Conjugate points in positive constant curvature**: along a geodesic of speed c through curvature κ > 0, a normal Jacobi field vanishing at a vanishes again at a + π/(c√κ) ([`apply_add_pi_div_eq_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Jacobi/ConstantCurvature.html#TauCeti.Manifold.IsJacobiFieldOn.apply_add_pi_div_eq_zero)). It rests on the [explicit classification](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Jacobi/Classification.html#TauCeti.Manifold.IsJacobiFieldOn.exists_eq_affine_smul_add_curvatureCosine_smul_add_curvatureSine_smul) of Jacobi fields in constant curvature by model sine and cosine.
- **Curvature of bi-invariant metrics**: for an Ad-invariant inner product on a Lie group, R(a,b)c = −¼[[a,b],c] at the identity ([`curvatureTensor_one`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/LieGroup/BiInvariant.html#CovariantDerivative.IsLeviCivitaConnection.curvatureTensor_one)), so sectional curvature is nonnegative.

### Notable definitions and infrastructure

- **Jacobi fields** ([`IsJacobiFieldOn`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Jacobi/Basic.html#TauCeti.Manifold.IsJacobiFieldOn)): C² solutions of D²J + R(J,γ′)γ′ = 0 on a parameter set, with the regularity of the lift built in. They are the entry point to the exponential map's derivative, the index form and every comparison theorem.
- **The curvature operator on bivectors** ([`curvatureEndomorphism`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/ExteriorSquare.html#CovariantDerivative.curvatureEndomorphism)): a self-adjoint map on Λ²T. Constant curvature κ is exactly the case where this operator is κ·Id, and eigenvalue bounds on it give Ricci bounds.
- **Harmonic homogeneous polynomials** ([`harmonicSubmodule`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/Harmonic.html#MvPolynomial.harmonicSubmodule)): with the Fischer decomposition, the dimension formula, O(n)-equivariance and injective restriction to the unit sphere, this is the finite algebraic input to spherical harmonics.

### Roadmap coverage

R1 is partial. Items 1–3 are largely done: the curvature symmetries, both Bianchi identities, the Ricci identity, the curvature form, frame formulas and isometry naturality of ∇R are all in place, as are polarization, constant curvature, Schur, Einstein constancy, parallel curvature and locally symmetric surfaces. Flat-implies-locally-Euclidean is not there, and item 4's normal-coordinate jets are absent. In the transformation block, conformal change, constant scaling, the warped-product Levi-Civita connection and bi-invariant and left-invariant Lie group metrics (including completeness) are present. Warped-product curvature, Riemannian submersions, homogeneous quotients and the projective examples are not. R2 is partial: the definition, geodesic smoothness, linearity, uniqueness, reparametrization, isometry transport, the Wronskian, the tangential and normal splitting, constant geodesics, variations through geodesics, constant-curvature solutions and Killing fields are done. Global existence, the exact 2n dimension, realization by variations and the d exp formula are missing. R4 is partial only through its models and groundwork: the round sphere of radius r has curvature 1/r², great circles are geodesics, and Jacobi fields in nonpositive curvature are convex. Its comparison theorems are untouched. R5a and R6 keep only the flat-ambient groundwork recorded earlier. R7.0 is done except for the equality case. R8.1 is partial, and R3, R5b, R7.1–R7.8 and R8.2–R8.5 are untouched.

## The frontier

- **Jacobi existence and the exponential differential**: solve the Jacobi equation in a parallel frame for arbitrary initial data, which would make the solution space exactly 2n-dimensional, then prove d exp_(tv)(tw) = J(t). R1's normal-coordinate jets and all of R4 wait on this.
- **Rauch comparison**: the model sine and the nonpositive-curvature case are already in place, so the general bounds |J(t)| ≥ s_κ(t)|DJ(0)| under K ≤ κ, and the reverse under K ≥ κ, are the next step.
- **Spherical eigenvalues of harmonic polynomials**: R8.1 still needs the transfer to the round metric, showing that a harmonic homogeneous polynomial of degree d restricts to an eigenfunction with eigenvalue d(d+m−1).
- **Riemannian submersions**: with bi-invariant metrics done, the O'Neill tensors and normal homogeneous metrics on G/H are next, and they lead on to the projective examples.
- **Flat implies locally Euclidean**: the last open statement in R1 item 3. It needs local parallel frames and the manifold inverse function theorem.

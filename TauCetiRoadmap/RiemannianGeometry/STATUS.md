<!--tauceti-status:v1 {"roadmap":"RiemannianGeometry","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the polar Jacobian ODE, the normal-strip Jacobian and the polar length and area formulas","state":"untouched"},{"id":"Layer 2","remaining":"normal cut times of boundary arcs and the integration formula up to the cut time","state":"untouched"},{"id":"Layer 3","remaining":"the turning theorem with corners and Gauss-Bonnet for disks with corners","state":"untouched"},{"id":"Layer 4","remaining":"disk filling in a one-chart ball and normal balls under K at most 0","state":"untouched"},{"id":"Layer 5","remaining":"conformal invariance of the Dirichlet energy under rescaling and under conformal diffeomorphisms","state":"untouched"}],"readme_sha":"e7576cff1abc1f89740a3e68fe6ef4ff5f5aa1197212c1808ac209965898ae79","roadmap":"RiemannianGeometry/Surfaces","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: RiemannianGeometry

This file documents the status of the RiemannianGeometry roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** R2's theory of Jacobi fields is essentially done. R1's curvature calculus is done apart from flat metrics, the cubic normal-coordinate jet and the O'Neill curvature formulas. R7.0's Bochner and Lichnerowicz theory is substantially done. R3, R4, R5a, R6 and R8.1 have groundwork only. R5b, R7.1 onwards, R8.2 onwards and all five layers of the Surfaces sub-roadmap have not begun.

### Named results

- **The Lichnerowicz estimate** — on a closed manifold of dimension n ≥ 2 with `Ric ≥ (n−1)kg`, every positive Laplace eigenvalue is at least `nk` ([`finrank_mul_le_of_laplaceBeltrami_eq_neg_mul`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Lichnerowicz/Basic.html#TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul)). It comes from the scalar Bochner formula `Δ|grad f|² = 2|Hess f|² + 2 d(Δf)(grad f) + 2 Ric(grad f, grad f)` ([`laplaceBeltrami_norm_sq_mgradient`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Bochner/Basic.html#TauCeti.Manifold.laplaceBeltrami_norm_sq_mgradient)).
- **Einstein's constancy theorem** — on a connected manifold of dimension other than two, `Ric = a g` forces `a` to be constant ([`eq_of_ricciTensor_eq_smul_inner`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Einstein.html#CovariantDerivative.eq_of_ricciTensor_eq_smul_inner)).
- **Jacobi fields in constant curvature** — every Jacobi field is an affine tangential part plus parallel normal fields weighted by the model cosine and sine, so positive curvature κ gives conjugate points at time `π/(√κ c)` ([`exists_eq_affine_smul_add_curvatureCosine_smul_add_curvatureSine_smul`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Jacobi/Classification.html#TauCeti.Manifold.IsJacobiFieldOn.exists_eq_affine_smul_add_curvatureCosine_smul_add_curvatureSine_smul)).
- **Realization of Jacobi fields by geodesic variations** — every Jacobi field along a maximal geodesic is the variation field of a smooth family of geodesics on a common time domain around any compact set, with no completeness assumption ([`exists_geodesicVariation_of_isCompact`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Jacobi/Realization.html#TauCeti.Manifold.IsJacobiFieldOn.exists_geodesicVariation_of_isCompact)).
- **Cartan's second structure equation** — in a `C²` local frame the curvature is `F = dA + A ∧ A` ([`coeff_curvatureOperator_eq_mextDeriv_add_wedge`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/ConnectionForm.html#IsLocalFrameOn.coeff_curvatureOperator_eq_mextDeriv_add_wedge)). The second Bianchi identity also takes the form `d^∇F = 0` ([`exteriorCovariantDerivativeTwo_curvatureForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Exterior/Two.html#CovariantDerivative.exteriorCovariantDerivativeTwo_curvatureForm)).

### Notable definitions and infrastructure

- **Jacobi fields** ([`IsJacobiFieldOn`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Jacobi/Basic.html#TauCeti.Manifold.IsJacobiFieldOn)): `C²` solutions of `D_t²J + R(J,γ′)γ′ = 0`. Along a maximal geodesic they are now known to exist for arbitrary initial data, to form a space of dimension exactly 2n, and to compute `d exp`. These are the inputs to every comparison theorem in R4 and to the index theory of R3.
- **The curvature operator on bivectors** ([`curvatureEndomorphism`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/ExteriorSquare.html#CovariantDerivative.curvatureEndomorphism)): the self-adjoint `Rop` on `Λ²TM`. Scalar curvature is twice its trace, and constant curvature κ is `Rop = κ Id`.
- **The model sine and cosine** ([`curvatureSine`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Trigonometric/Curvature.html#TauCeti.curvatureSine)): the solutions of `y″ + κy = 0` for every sign of κ, which serve as R4's comparison functions.

### Roadmap coverage

**R1** items 1–3 are done except flat-implies-locally-Euclidean and the converse half of the parallel-transport characterization of ∇R = 0. Item 4 has orthonormal geodesic frames, their induced tensor frames and the quadratic metric jet `−⅔⟨R(w,v)v,z⟩`, but not the cubic `∇R` term or the uniform remainder bound. Item 5, the rescaled blow-up limits, is not established here. The transformation laws cover scaling, conformal change, products and warped products, the last now with Ricci and scalar curvature. Bi-invariant metrics are done. Riemannian submersions have their projections and their O'Neill tensors, which are skew-adjoint and natural under isometries. Their curvature formulas, horizontal geodesics, homogeneous quotients and the projective examples are missing.

**R2** is essentially done. The source has existence along maximal geodesics, the 2n-dimensional solution space, `d exp_(tv)(tw) = J(t)`, realization by geodesic variations, and both directions linking Killing fields and isometric flows. I did not confirm the varying-basepoint version of `d exp`.

**R3** has the piecewise first variation, the commutation of mixed derivatives and a carrier for piecewise `Cⁿ` paths. **R4** has its models, the nonpositive-curvature exponential bound and the finite-fundamental-group compactness result, but no comparison theorem. **R7.0** is substantially done. **R8.1** lacks only the spherical eigenvalue identification. **R5a** and **R6** keep their flat-ambient groundwork.

**Surfaces** is untouched: none of its targets appear, though some of the suppliers it names are present.

## The frontier

- **Rauch comparison**: prove `K ≤ κ ⇒ |J(t)| ≥ s_κ(t)|D_tJ(0)|` before the first model zero, and its reverse. Jacobi existence and the model functions are both in place, so nothing upstream blocks it.
- **Conformal invariance of the surface Dirichlet energy (Surfaces Layer 5)**: this layer is independent of Layers 1–4, and the pointwise and volume halves it consumes already exist.
- **The cubic normal-coordinate jet**: add the `−⅙⟨(∇_vR)(e_i,v)v,e_j⟩` term and an honest `O(|v|⁴)` bound uniform over unit vectors. This finishes R1 item 4.
- **O'Neill's curvature formulas**: the tensors `A` and `T`, their skew-adjointness and the smooth projections are ready. Horizontal geodesics and the normal homogeneous metric on `G/H` come next.
- **Second variation and the index form (R3)**: combine the piecewise first variation, piecewise paths and the commutation of mixed derivatives.

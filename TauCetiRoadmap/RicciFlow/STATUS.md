<!--tauceti-status:v1 {"roadmap":"RicciFlow","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Sym2 subbundle and metric families, Ricci/scalar variations, Lie derivative, scaling, normalization and solitons","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"curvature evolution equations, scalar and convex-bundle maximum principles, the Q-specific ODE API","state":"partial"},{"id":"Layer 5","remaining":"dimension count and Weyl splitting, curvature four-tensor of a metric, reaction tensor Q, all curvature cones","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"39f6e087129826421cfa41ebc4bb37ff98b11931e92f794a8f78377d0776c0c5","roadmap":"RicciFlow","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: RicciFlow

This file documents the status of the RicciFlow roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The work so far covers the variation calculus of Layer 1, the abstract ODE invariance criterion of Layer 4, and the first algebraic curvature objects of Layer 5. There is no Ricci flow yet. No parabolic theory, short-time existence, curvature evolution, curvature cones or sphere theorem has started.

### Named results

- **Nagumo's criterion** — [`Convex.forall_mem_posTangentConeAt_iff_forall_mapsTo_Icc`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/ConvexInvariance.html#Convex.forall_mem_posTangentConeAt_iff_forall_mapsTo_Icc): under a locally Lipschitz autonomous field on a real Hilbert space, a closed convex set is invariant exactly when the field lies in its positive tangent cone at every point. This is the 4.3 milestone in its abstract form. A time-dependent sufficient version, [`Convex.mapsTo_Icc_of_mem_posTangentConeAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/ConvexInvariance.html#Convex.mapsTo_Icc_of_mem_posTangentConeAt), comes with it.
- **The first variation of curvature** — [`hasDerivAt_curvatureOperator_of_isLeviCivitaConnection`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/CurvatureVariation.html#TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.hasDerivAt_curvatureOperator_of_isLeviCivitaConnection): for a smooth family of nondegenerate metrics, `∂R(X,Y)Z = (∇_X Γ')(Z,Y) − (∇_Y Γ')(Z,X)`, where `Γ'` is the variation of the connection.
- **The variation of the Levi-Civita connection** — [`two_mul_apply_deriv_difference_eq_derivBilinearTensor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Variation.html#TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.two_mul_apply_deriv_difference_eq_derivBilinearTensor): `2g(Γ'(u,v),w)` is the usual combination of covariant derivatives of `h = ∂g`. This is the invariant form of the Christoffel variation.
- **The variation of the inverse metric** — [`hasDerivAt_inverse`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/Variation.html#TauCeti.Manifold.ContMDiffNondegenerateMetric.hasDerivAt_inverse): `∂g⁻¹ = −g⁻¹ h g⁻¹`.
- **Volume along Ricci flow** — [`hasDerivWithinAt_chartVolumeDensity_of_ricciFlow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Variation.html#TauCeti.hasDerivWithinAt_chartVolumeDensity_of_ricciFlow): `∂_t dμ = −Scal dμ`. It comes from the general [`½ tr_g h` formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Variation.html#TauCeti.hasDerivAt_chartVolumeDensity) and is stated pointwise for the chart density `√det G`.

### Notable definitions and infrastructure

- **Algebraic curvature tensors** — [`algebraicCurvatureSubmodule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/AlgebraicCurvature/Basic.html#TauCeti.FourTensor.algebraicCurvatureSubmodule): the closed submodule of four-tensors with the pair symmetries and the first Bianchi identity, stable under pullback by linear maps. It is the fixed space in which Layers 4–7 will state cone conditions.
- **Ricci and scalar contractions with Kulkarni–Nomizu products** — [`FourTensor.ricci`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/AlgebraicCurvature/Basic.html#TauCeti.FourTensor.ricci) and [`kulkarniNomizu`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/AlgebraicCurvature/Basic.html#TauCeti.FourTensor.kulkarniNomizu). They come with the constant-curvature tensor and with trace identities that the Weyl/Ricci splitting will need.
- **Jacobi's formula** — [`Matrix.hasDerivAt_det_of_entries`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Deriv/Matrix.html#Matrix.hasDerivAt_det_of_entries) and its [manifold form](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/MFDeriv/Det.html#TauCeti.mvfderiv_det_apply), which drive the volume variation.

### Roadmap coverage

Three layers are partial. **Layer 1** has the inverse-metric, connection, curvature and chart-volume variations (1.2). It lacks the `Sym²T*M` subbundle and `IsSmoothMetricFamilyOn` (1.1), the Ricci and scalar variations, the Lie derivative and pullback formula (1.2), scaling and normalization (1.3), and solitons (1.4). **Layer 4** has only Nagumo's criterion and a Picard–Lindelöf existence lemma from 4.3. The curvature evolution equations, maximum principles, and the ODE API for `Q` remain. **Layer 5** has the 5.1 carrier, its closedness, pullback stability, contractions and the Kulkarni–Nomizu product. The dimension count, the Weyl decomposition, the curvature four-tensor of a metric, the reaction tensor (5.2) and all cones (5.3–5.6) remain. **Layers 2, 3, 6, 7 and 8** are untouched.

## The frontier

- **Ricci and scalar variations (1.2)** — contract the curvature variation that has landed to reach `∂ Scal = −⟨h, Ric⟩ + div div h − L_g tr_g h`.
- **The curvature four-tensor of a metric (5.1)** — map a smooth metric's native `curvatureTensor` at a point into `algebraicCurvatureSubmodule`, and identify its traces with `metricRicci` and `metricScalar`.
- **The reaction tensor (5.2)** — define `Q` by its orthonormal-basis contraction, prove it is independent of the basis, and show it preserves the Bianchi submodule. Applying Nagumo's criterion to curvature cones requires this step.
- **The symmetric two-tensor bundle and metric families (1.1)** — `Sym²T*M`, jointly smooth families of metrics and the Ricci-flow predicate. Every flow statement in Layers 2–3 is stated on these.
- **Parabolic foundations (Layer 2)** — not begun. It depends on the PDE Lane F and PseudodifferentialOperators P5 Hölder-space suppliers.

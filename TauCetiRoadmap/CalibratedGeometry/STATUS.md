<!--tauceti-status:v1 {"roadmap":"CalibratedGeometry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"normDet-wedge identity (1.2), Hilbert-norm upper bound (1.3), oriented Grassmannian (1.4), equality planes (1.5), external products (1.6)","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"57e2399b70fef190892d45041f1c1583071a4181f0aa8099dbaa123942baf166","roadmap":"CalibratedGeometry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: CalibratedGeometry

This file documents the status of the CalibratedGeometry roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the opening step is done. Target 1.1 is proved: comass, taken over orthonormal frames, equals the native norm on alternating forms. The rest of Layer 1 has not been started, and nothing has landed for Layers 2–6, which cover calibrated immersions and smooth chains, the fundamental theorem, Wirtinger, special Lagrangian geometry and McLean's theorem.

### Named results

- **Comass equals the native norm**: on a real inner-product space, the operator norm of a real alternating form is the supremum of its absolute values on orthonormal frames, in every degree ([`ContinuousAlternatingMap.norm_eq_sSup_abs_orthonormal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Orthonormal/Alternating.html#ContinuousAlternatingMap.norm_eq_sSup_abs_orthonormal)). This is the roadmap's Layer 1 end theorem. It also holds in degree zero and in degrees above the dimension, where both sides vanish.
- **Attainment of comass**: on a finite-dimensional space, an alternating map of degree at most the dimension attains its norm on some orthonormal frame, a consequence of the compactness of the Stiefel manifold ([`ContinuousAlternatingMap.exists_orthonormal_norm_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Instances/Stiefel/Comass.html#ContinuousAlternatingMap.exists_orthonormal_norm_eq)).

### Notable definitions and infrastructure

- **The orthonormal-frame bound criterion**: for a nonnegative C, the operator norm is at most C exactly when every value on an orthonormal frame is ([`ContinuousAlternatingMap.opNorm_le_iff_le_orthonormal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Orthonormal/Alternating.html#ContinuousAlternatingMap.opNorm_le_iff_le_orthonormal)). It holds for any real normed target and without finite-dimensionality, so the calibration bound in 2.1 can be checked frame by frame. No competing comass norm was introduced, which keeps to the README's intent.

### Roadmap coverage

Layer 1 is partial. Target 1.1 is done. The comass form of 1.2's linear calibration inequality follows from it and the existing simple-vector inequality, but it is not stated separately, and 1.2's norm-determinant identity `normDet L = ‖Le₁∧⋯∧Le_k‖` has not been found in the library. Targets 1.3 (the upper bound `|φ|_H ≤ sqrt(binomial(dim E,k))·comass φ`), 1.4 (the oriented Grassmannian of a general space as an SO(k) quotient of the Stiefel manifold), 1.5 (equality planes and calibrated frames) and 1.6 (external products) are untouched. Layers 2, 3, 4, 5 and 6 are untouched.

## The frontier

- **The rest of 1.2 and 1.3**: what remains is the norm-determinant identity, from `LinearMap.normDet_sq_eq_det_gram` and the Gram norm of a wedge, and the upper bound of the Hilbert-norm comparison through the mass bound on k-vectors. The inputs for both are already in place.
- **Equality planes (1.5)**: define `IsCalibratedFrame` and prove its isometry and SO(k) invariance at the frame level. This does not need the Grassmannian, and it is the linear input for 2.2.
- **The Wirtinger inequality (4.1–4.2)**: this needs only Layer 1, so it can proceed in parallel with Layers 2–3.
- **Smooth calibrations and calibrated immersions (2.1–2.2)**: this is the gateway to the fundamental theorem on closed sources (3.1). It needs the covariant exterior-derivative identity for the Levi-Civita connection and RiemannianGeometry R1.
- **The oriented Grassmannian (1.4)**: blocked on suppliers. It needs SmoothBundlesConnections B1.4 for the quotient structure and GeneralizedCohomology G4.0b and CharacteristicClasses C1.1a for the comparisons.

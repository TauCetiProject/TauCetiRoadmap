<!--tauceti-status:v1 {"roadmap":"YangMillsConnectionsAndCaloricGauge","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"tangent space g𝔤 = 𝔤g; nearest-point retraction (1.2); smooth gauge identities (1.3); transgression forms (1.4); self-duality (1.5); γ₀ and the cubic bound (1.6)","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"4bbed7c789b929c101b7f254ee03424f8fb51696a245b65c074da168db08cec4","roadmap":"YangMillsConnectionsAndCaloricGauge","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: YangMillsConnectionsAndCaloricGauge

This file documents the status of the YangMillsConnectionsAndCaloricGauge roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the first section of Layer 1 has begun: the compact matrix structure group, its invariant inner product and the constructions that produce one. Everything else in Layer 1 is still open: the nearest-point retraction, the gauge identities, the transgression forms, self-duality and the structure constant `γ₀`. Layers 2–10, from critical Sobolev maps into `G` to the caloric gauge, have not begun.

### Named results

- **Invariance of the inner product** — for a structure group, each `Ad(g)` is an isometry of the inner product on `𝔤` ([`innerForm_matrixAdjointRepresentation`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/YangMills/StructureGroup.html#TauCeti.CompactMatrixStructureGroup.innerForm_matrixAdjointRepresentation)), and each `ad X` is skew-adjoint, `⟨[X, Y], Z⟩ = −⟨Y, [X, Z]⟩` ([`innerForm_lie_left`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/YangMills/StructureGroup.html#TauCeti.CompactMatrixStructureGroup.innerForm_lie_left)). These are the facts that make pointwise norms of connections and curvatures gauge invariant.
- **Existence of an admissible inner product** — every closed subgroup of `U(n)` is a structure group for the trace form `−Re tr(XY)`, which is positive definite and `Ad`-invariant ([`ofTraceForm`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/YangMills/StructureGroup.html#TauCeti.CompactMatrixStructureGroup.ofTraceForm), [`posDef_matrixTraceForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Lie/Subgroup/Unitary/Matrix.html#ClosedSubgroup.posDef_matrixTraceForm)).
- **The Lie algebra of a block-diagonal product** — the Lie algebra of `G₁ × G₂ ⊆ U(n ⊕ m)` consists exactly of the block-diagonal matrices `diag(X₁, X₂)` with `Xᵢ` in the Lie algebra of `Gᵢ` ([`mem_matrixLieAlgebra_fromBlocksProd_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Lie/Subgroup/Unitary/Matrix.html#ClosedSubgroup.mem_matrixLieAlgebra_fromBlocksProd_iff)).

### Notable definitions and infrastructure

- **Compact matrix structure group** — [`CompactMatrixStructureGroup`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/YangMills/StructureGroup.html#TauCeti.CompactMatrixStructureGroup) bundles a closed subgroup of `U(n)`, not necessarily connected, with an `Ad(G)`-invariant inner product on its Lie algebra. This is the `(N, G, ⟨·,·⟩)` of the Conventions, and every later layer is stated over it.
- **The matrix Lie algebra of a closed unitary subgroup** — [`matrixLieAlgebra`](https://taucetiproject.org/docs/TauCeti/Geometry/Lie/Subgroup/Unitary/Matrix.html#ClosedSubgroup.matrixLieAlgebra) presents `𝔤` as the real Lie subalgebra of matrices whose exponential line stays in `G`, with the [adjoint representation](https://taucetiproject.org/docs/TauCeti/Geometry/Lie/Subgroup/Unitary/Matrix.html#ClosedSubgroup.matrixAdjointRepresentation) `Ad(g)X = gXg⁻¹` acting on it. Later layers can then treat connections as concrete skew-Hermitian matrix-valued forms.
- **Restriction and products** — [`restrict`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/YangMills/StructureGroup.html#TauCeti.CompactMatrixStructureGroup.restrict) and [`prod`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/YangMills/StructureGroup.html#TauCeti.CompactMatrixStructureGroup.prod) build new structure groups from a closed subgroup or from two factors, the latter with the orthogonal sum of the inner products. These are the constructions behind the README's examples such as `𝔰𝔲(2) ⊕ 𝔰𝔲(2)`.

### Roadmap coverage

Layer 1 is partial. In §1.1, everything is proved except the tangent-space description `T_g G = g𝔤 = 𝔤g`: the definition, the isometry and skew-adjointness, the admissibility of the trace form, restriction and products. Nothing has landed for §§1.2–1.6: the derivative of the nearest-point retraction, the smooth gauge identities and the comparison with SmoothBundlesConnections, the Euclidean transgression and Cartan forms, the self-dual splitting with the pointwise Bogomol'nyi inequality, and `γ₀` with the cubic bound. Layers 2–10 are untouched.

## The frontier

- **Tangent space of `G` (§1.1)** — prove `T_g G = g𝔤 = 𝔤g` from the range of the differential of the inclusion at `1` and `Ad(g)𝔤 = 𝔤`. Both inputs are already in Tau Ceti according to the README, so this closes §1.1.
- **Self-duality in dimension four (§1.5)** — the splitting `F = F⁺ + F⁻`, the identity `⋆⟨F ∧ F⟩ = |F⁺|² − |F⁻|²` and the pointwise Bogomol'nyi inequality. These need only Tau Ceti's Hodge star and the structure group now in place.
- **Gauge identities for smooth data (§1.3)** — the gauge action `O·A = Ad(O)A − O;x`, its effect on curvature, the Bianchi identity and the Leibniz rules, with the comparison to SmoothBundlesConnections B3.1 and B4.1–B4.2.
- **The structure constant `γ₀` (§1.6)** — its definition and scaling, its reduction to the simple ideals, and the cubic bound for self-dual forms. This depends on §1.5 and on LieGroups Layer 5A's compact splitting.
- **The nearest-point retraction (§1.2)** — its derivative along `G` is the orthogonal projection onto `g𝔤`. This waits on RiemannianGeometry R6's tubular retraction and on the tangent-space item above.

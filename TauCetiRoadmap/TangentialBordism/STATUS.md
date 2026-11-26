<!--tauceti-status:v1 {"roadmap":"TangentialBordism","to_sha":"7433fc3695f4fbf5a07041090628c5c94067c0b9","ts":"2026-11-25T18:48:45Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"neat embeddings, face-structured strata and Sard, facewise and relative transversality, corner rounding, doubles; sections 2.2-2.7 not begun","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"a5523bb1547d625a40a026f66a892cb89f86f40cd06ebd8e79aa5b757f75f237","roadmap":"TangentialBordism","to_sha":"7433fc3695f4fbf5a07041090628c5c94067c0b9"}-->
# Status: TangentialBordism

This file documents the status of the TangentialBordism roadmap up until `7433fc3` (2026-11-25T18:48:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Work has begun only in the differential-topology foundations of Layer 2. Sard's theorem now covers sources with boundary, parametric transversality holds for boundaryless manifolds, relative smoothing is available, and manifolds modelled on the quadrant have depth strata. Layer 1's finite Arf algebra is available from its supplier. No bordism group, cycle or witness exists yet, and Layers 3–10 have not begun.

### Named results

- **Sard's theorem in unequal dimensions** — for a `C^k` map from a boundaryless Lindelöf manifold, with `k` large enough relative to the two dimensions, the image of the critical set is [null](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Sard/Basic.html#ContMDiff.isNullSet_image_criticalPoints). This is the input the roadmap consumes from DifferentialGeometry 10.2.
- **Sard's theorem for manifolds with boundary** — the same conclusion for sources modelled on the half-space, so their regular values are [dense](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Sard/HalfSpace.html#ContMDiff.dense_isRegularValue_halfSpace) (Lee, Theorem 6.10); the [null-image statement](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Sard/HalfSpace.html#ContMDiff.isNullSet_image_criticalPoints_halfSpace) is the README's named target.
- **The parametric transversality theorem** — if a family `F : M × S → N` is transverse to an embedding `Z → N`, then almost every slice is [transverse](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Sard/Transversality.html#ContMDiff.isNullSet_setOf_exists_not_transverse). This is proved only when `M`, `S`, `N` and `Z` are all boundaryless.
- **Relative Whitney smoothing** — a continuous map from a σ-compact manifold with corners into a compact manifold without boundary, already smooth near a closed set, is [homotopic rel that set](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/SmoothApprox/Basic.html#ContinuousMap.exists_contMDiff_homotopyRel) to a smooth map, by a homotopy that stays in a prescribed neighbourhood of the diagonal. This is the smoothing theorem of the README.
- **Compact regular neighbourhoods** — every compact subset of a boundaryless σ-compact manifold lies in the interior of a [compact regular sublevel](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/RegularValue/Scalar/RegularDomain.html#IsCompact.exists_isRegularValue_isCompact_setOfPred_le) of a smooth function, which is a compact manifold with boundary.

### Notable definitions and infrastructure

- **Depth strata** — the [depth-k stratum](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Corners/Stratum.html#ModelWithCorners.depthStratum) of a manifold with corners. On the quadrant model it is a [boundaryless (n−k)-manifold](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Corners/Stratum.html#TauCeti.isManifold_depthStratum) whose inclusion is a smooth embedding. Sard's theorem and transversality reach corner sources stratum by stratum through these, so this is the route the roadmap prescribes for them.

### Roadmap coverage

Layer 1 is done as far as this roadmap is concerned. It consumes GeometricTopology's finite Arf algebra over F₂, and the classification, Gauss sums and Lagrangian criterion that its checks exercise are in the library; the geometric Spin-surface refinement belongs to Layer 8. Layer 2 is partial. In 2.1 these are proved: Sard for half-space sources, boundaryless parametric transversality, relative smoothing with diagonal control, compact regular neighbourhoods, and depth strata for the quadrant model. Still missing from 2.1 are neat embeddings, depth strata and Sard for face-structured corners, facewise and relative transversality, corner rounding and doubles. Subsections 2.2–2.7 (model transport, cycles, collared witnesses, quotients, small representatives, the K3 example) have not begun. Layers 3–10 are untouched. These layers need ordinary operations, structured Pontryagin–Thom, the coefficient rings, ABS, the low-dimensional tables, the Cayley plane and realization. Some supplier material is already in the library, such as the framed Pontryagin–Thom collapse and the compact Albert algebra, but none of these layers' own targets has landed.

## The frontier

- **Transversality for half-space sources** — the parametric theorem applied separately to the interior and to the boundary of a half-space source, for a closed embedded `Z`. Both strata are already boundaryless manifolds, so this needs no new geometry.
- **Relative transversality** — a continuous map, smooth near a closed set, should be homotopic rel that set, inside a neighbourhood `D` of the diagonal, to a map transverse to `Z` on every stratum. The smoothing half is in place; this needs the facewise parametric theorem above and the cutoff-perturbation argument in the README.
- **Strata and Sard for face-structured corners** — rebuild the depth strata from DifferentialGeometry 5.5b's local quadrant charts rather than a global quadrant model, then deduce Sard and transversality for these sources.
- **Neat embeddings, corner rounding and doubles** — these collar constructions are what the Layer 2.4 bordism witnesses are glued from. They consume GeometricTopology Layer 1's collars and gluing.
- **Geometric cycles and bordism groups** — Layer 2.5's relative cycles and Layer 3's bordism quotient, the first step towards the homology theory. Nothing exists here yet.

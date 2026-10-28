# Hopf–Rinow completion audit

This inventory checks the full approved README, including the nondegenerate supplier and both
worked examples. It is a completion candidate, not a declaration that the pending source has
merged. The baseline inspected is Tau Ceti `9d7da548c2842877e670193e66d609d127d66129`; three
existing implementation PRs finish the remaining Layer 1 interfaces:

- [#18707](https://github.com/TauCetiProject/TauCeti/pull/18707): joint smoothness of the actual
  Levi–Civita connection coefficients of a bundled metric family, with its coordinate API.
- [#19453](https://github.com/TauCetiProject/TauCeti/pull/19453): nondegenerate metric restriction,
  local-isometry comparison and agreement of the restricted connections on ambient fields.
- [#21067](https://github.com/TauCetiProject/TauCeti/pull/21067): intrinsic metric variation and the
  connection-variation formula along any smooth parameter curve.

All three PRs target main separately. The joint connection-family regularity in #18707 must
merge before the next variation stage in #21067. All must finish normal review and CI before this
archive is marked ready. Their refinements are tracked in the PR discussions.

**Boundary completion checked, 2026-10-28.** Candidate #18707 head
`b9e6ce94f83c66d8f4f121f46091ac7e908a8866` proves joint native coefficient smoothness throughout
all chart domains, including corner-boundary points, and the inverse-matrix index formula using
`fderivWithin` on the actual chart target. It reuses main’s native joint covariant-derivative regularity, finite-dimensional coefficient
smoothness and inverse coordinate metrics. Independent probes take both parameter and base to be
`EuclideanHalfSpace 1` and prove that the base origin is outside the model interior. Both the native
coefficient theorem and the native index formula apply there. The ordinary unrestricted-derivative
formulas remain the distinct interior corollaries. This closes the previously recorded boundary
obligation mathematically; normal current-head review, genuine CI and merging are still required.

Paths in this inventory are under `TauCeti/Geometry/Manifold/` unless otherwise stated.

| Requirement | Canonical implementation and scope check |
|---|---|
| Layer 0, regular reparametrization | `Riemannian/ArcLength.lean`, `exists_unit_speed_reparametrization_Icc` and the open-interval version retain the nonzero-speed hypothesis. |
| Layer 0, length limits and metric comparison | `Riemannian/EVariationComparison.lean` and `MetricVariation.lean` compare the metric variation with the canonical smooth-curve length; they give the specified lower semicontinuity for C¹ curves and a C¹ limit. |
| Layer 0, corners, partitions and the infimum | `PiecewisePath.lean`, `Riemannian/PiecewisePath.lean`, `PathELength.lean` and `EDistComparison.lean` supply piecewise paths, refinement/concatenation, equal-length smoothing and the canonical C¹ Riemannian-distance comparison. No separate downstream distance is used. |
| Layer 0, restriction and finite distance | `Riemannian/Restriction.lean` and the distance-comparison API construct the restricted metric and the convex-flat comparison. Connectedness is retained where finiteness is needed; a compatible ordinary metric uses `IsRiemannianManifold`. |
| Layer 1, nondegenerate metric and musical maps | `VectorBundle/NondegenerateMetric/{Basic,Musical,Signature,Family}.lean` use the actual smooth symmetric nondegenerate forms. There is no positivity or Riemannian-distance assumption in this supplier. |
| Layer 1, nondegenerate connection | `VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/{Existence,Christoffel,Regularity}.lean` prove existence, uniqueness on differentiable fields, metric compatibility, torsion-freeness, smoothness and the positive-definite comparison. |
| Layer 1, parameter families and restriction | The three prerequisites above provide joint coefficient regularity, open restriction and the intrinsic first-variation formula. The derivative field and parameter position/velocity are the native objects; no independently chosen replacement metric or connection is used. |
| Layer 1, along-curve differentiation | `VectorBundle/CovariantDerivative/AlongCurve/{Basic,Pullback,Chart,Acceleration,Metric,NondegenerateMetric,LocalIsometry}.lean` retain the parameter-set and differentiability hypotheses, with restriction, pullback, chart and product rules. |
| Layer 1, geodesic predicate and spray | `Riemannian/Geodesic/{Basic,Spray,Trajectory}.lean` use actual initial position and velocity, the covariant equation and its velocity lift; the setwise predicate has unique-differentiability and C² hypotheses. |
| Layer 1, flow, interval and endpoint control | `Riemannian/Geodesic/{Flow,Maximal,Reparametrization,Escape}.lean` and `IntegralCurve/Extension.lean` provide domain-qualified smooth flow/homogeneity and finite-endpoint extension. Compactness is for bounded tangent states over a compact base, not an unproved fibrewise-to-total-space inference. |
| Layer 1, exponential map | `Riemannian/Geodesic/{Exponential,Smoothness}.lean` supply the open star-shaped natural domain, homogeneity and derivative at zero. Statements using the total function retain its domain conditions. |
| Layer 2, normal geometry and minimization | `Riemannian/Geodesic/Normal/`, `Gauss/` and `Minimizing.lean` supply normal/logarithmic domains, Gauss, radial minimization, the equality/reparametrization cases and escape comparison. The logarithm is domain-qualified. |
| Layer 2, energy variation | `Riemannian/Geodesic/FirstVariation.lean`, `isEnergyCritical_iff_isGeodesicCurveOn`, uses the actual fixed-endpoint variations and the covariant acceleration. |
| Layer 3, the complete implication graph | `Riemannian/Geodesic/HopfRinow.lean`, `tfae_expDomain_eq_univ`, has the specified compact-exhaustion clause and no completeness premise; `Completeness.lean`, `ProperSpace.lean` and `Minimizing.lean` supply the separate implications. Base-point propagation is exported explicitly. |
| Layer 4, compact manifolds | `Riemannian/Geodesic/Compact.lean`, `isGeodesicallyCompleteAt_of_compactSpace`, uses the extended metric and has no connectedness or already-installed ordinary metric hypothesis. |
| Layer 4, metric and isometry interfaces | `Riemannian/LengthSpace.lean`, the geodesic metric-space interfaces and `Riemannian/Isometry/{LeviCivita,AlongCurve,Geodesic,Exponential,Completeness}.lean` give the canonical length/geodesic and smooth-isometry transports. No bare metric-isometry smoothness theorem is assumed. |
| Flat-space acceptance, including dimension zero | `Riemannian/Geodesic/Euclidean.lean` explicitly computes the affine geodesic, maximal interval, exponential domain/map/derivative, normal balls and logarithm. Its model-space hypotheses do not require the space to be nontrivial. |
| Open-unit-ball rejection test | `Riemannian/Geodesic/Examples/OpenUnitBall.lean` computes the finite-time boundary behavior and radial minimizing segments. The associated `RealOpenUnitBall` API proves non-completeness/non-compactness, so the existence of minimizing segments does not imply properness. |

The full corner-family/index implementation and its variation, curvature-jet and Hopf–Rinow
consumers built together in 6,763 Lake jobs after rebasing onto canonical main. All fourteen
trusted environment linters pass on 156 declarations plus 155 generated declarations. The ten probed derivative, coefficient and
index endpoints have only `propext`, `Classical.choice` and `Quot.sound`. The restricted-metric and connection comparisons built in 5,907 jobs and have the
same axiom profile. The intrinsic curve-variation comparison also passed its endpoint probes.
Later review refinements receive their own fresh builds. This is a source/API and key-proof
audit, not an independent replay of every transitive proof.

The archived historical prototype continues to elaborate at the unchanged roadmap dependency
pin. It does not import these newer implementation modules or certify their presence at that
old revision. The merged revisions must be recorded before declaring the archive complete.

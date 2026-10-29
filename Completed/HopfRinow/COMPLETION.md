# Hopf–Rinow completion audit

This inventory checks the full approved README, including the nondegenerate supplier and both
worked examples. It is a completion candidate, not a declaration that the pending source has
merged. The baseline replayed is actual Tau Ceti main
[`f5604a970624`](https://github.com/TauCetiProject/TauCeti/commit/f5604a97062487140a029c405f32d8f199f2316b).
The Layer 1 source prerequisites are:

- [#18707](https://github.com/TauCetiProject/TauCeti/pull/18707): joint smoothness of the actual
  Levi–Civita connection coefficients of a bundled metric family, with its coordinate API.
  All eight reviewed source files are verified verbatim on actual main
  [`1957bfc6fe2f`](https://github.com/TauCetiProject/TauCeti/commit/1957bfc6fe2f8491c98df2ff54c5c6d88be7d193).
- [#19453](https://github.com/TauCetiProject/TauCeti/pull/19453): nondegenerate metric restriction,
  local-isometry comparison and agreement of the restricted connections on ambient fields.
  This supplier is verified on the baseline main revision above.
- [#21067](https://github.com/TauCetiProject/TauCeti/pull/21067): intrinsic metric variation and the
  connection-variation formula along any smooth parameter curve.

All three PRs target main separately. #19453 and #18707 have fulfilled their normal landing
gates. #18707 passed Bors batch 2122's own [genuine CI run 40794264282](https://github.com/TauCetiProject/TauCeti/actions/runs/40794264282):
all four jobs succeeded, including the offline sandboxed build (54,018 Lake jobs) and the
audit of 423,717 declarations against the standard three axioms. The trusted H/B/T artifact's
tested commit and tree match actual main `1957bfc6fe2f` exactly.

#21067 was rebased after that verified landing. Candidate
`7bd7c7558aa213b87ad9b17e4fd954e1bff82424` has sole parent `1957bfc6fe2f` and passes
the local 197-module build (8,421 jobs), 35 key type/axiom
checks and the four acceptance probes with warnings treated as errors. Its fresh current-head
normal review, genuine CI and ordinary merge remain required; these local checks do not prove
that variation has landed. The complete catalog must then pass on actual main.

**Boundary completion checked, 2026-10-28.** Candidate #18707 head
`b9e6ce94f83c66d8f4f121f46091ac7e908a8866` proves joint native coefficient smoothness throughout
all chart domains, including corner-boundary points, and the inverse-matrix index formula using
`fderivWithin` on the actual chart target. It reuses main’s native joint covariant-derivative regularity, finite-dimensional coefficient
smoothness and inverse coordinate metrics. Independent probes take both parameter and base to be
`EuclideanHalfSpace 1` and prove that the base origin is outside the model interior. Both the native
coefficient theorem and the native index formula apply there. A separate acceptance probe takes
both factors to `EuclideanQuadrant 2` and checks the same native endpoints at the codimension-two
corner origin, again proving non-interiority. The ordinary unrestricted-derivative
formulas remain the distinct interior corollaries. This closes the previously recorded boundary
obligation mathematically. All ten current-head review rubrics and genuine CI pass for this
exact #18707 head, now verified on actual main. The dependent #21067 landing remains required.

Paths in this inventory are under `TauCeti/Geometry/Manifold/` unless otherwise stated.

| Requirement | Canonical implementation and scope check |
|---|---|
| Layer 0, regular reparametrization | `Riemannian/ArcLength.lean`, `exists_unit_speed_reparametrization_Icc` and the open-interval version retain the nonzero-speed hypothesis. |
| Layer 0, length limits and metric comparison | `Riemannian/EVariationComparison.lean` and `Riemannian/MetricVariation.lean` compare the metric variation with the canonical smooth-curve length; they give the specified lower semicontinuity for C¹ curves and a C¹ limit. |
| Layer 0, corners, partitions and the infimum | `PiecewisePath.lean`, `Riemannian/PiecewisePath.lean`, `Riemannian/PathELength.lean` and `Riemannian/EDistComparison.lean` supply piecewise paths, refinement/concatenation, equal-length smoothing and the canonical C¹ Riemannian-distance comparison. No separate downstream distance is used. |
| Layer 0, restriction and finite distance | `Riemannian/Restriction.lean` and the distance-comparison API construct the restricted metric and the convex-flat comparison. Connectedness is retained where finiteness is needed; a compatible ordinary metric uses `IsRiemannianManifold`. |
| Layer 1, nondegenerate metric and musical maps | `VectorBundle/NondegenerateMetric/{Basic,Musical,Signature,Family}.lean` use the actual smooth symmetric nondegenerate forms. There is no positivity or Riemannian-distance assumption in this supplier. |
| Layer 1, nondegenerate connection | `VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/{Existence,Christoffel,Regularity}.lean` prove existence, uniqueness on differentiable fields, metric compatibility, torsion-freeness, smoothness and the positive-definite comparison. |
| Layer 1, parameter families and restriction | The three prerequisites above provide joint coefficient regularity, open restriction and the intrinsic first-variation formula. The derivative field and parameter position/velocity are the native objects; no independently chosen replacement metric or connection is used. |
| Layer 1, along-curve differentiation | `VectorBundle/CovariantDerivative/AlongCurve/{Basic,Pullback,Chart,Acceleration,Metric,NondegenerateMetric,LocalIsometry}.lean` retain the parameter-set and differentiability hypotheses, with restriction, pullback, chart and product rules. |
| Layer 1, geodesic predicate and spray | `Riemannian/Geodesic/{Basic,Spray,Trajectory}.lean` use actual initial position and velocity, the covariant equation and its velocity lift; the setwise predicate has unique-differentiability and C² hypotheses. |
| Layer 1, flow, interval and endpoint control | `Riemannian/Geodesic/{Flow,Maximal,Reparametrization,Escape}.lean` and `IntegralCurve/Extension.lean` provide domain-qualified smooth flow/homogeneity and finite-endpoint extension. Compactness is for bounded tangent states over a compact base, not an unproved fibrewise-to-total-space inference. |
| Layer 1, exponential map | `Riemannian/Geodesic/{Exponential,Smoothness}.lean` supply the open star-shaped natural domain, homogeneity and derivative at zero. Statements using the total function retain its domain conditions. |
| Layer 2, normal geometry and minimization | `Riemannian/Geodesic/Normal/`, `Riemannian/Geodesic/Gauss/` and `Riemannian/Geodesic/Minimizing.lean` supply normal/logarithmic domains, Gauss, radial minimization, the equality/reparametrization cases and escape comparison. The logarithm is domain-qualified. |
| Layer 2, energy variation | `Riemannian/Geodesic/FirstVariation.lean`, `isEnergyCritical_iff_isGeodesicCurveOn`, uses the actual fixed-endpoint variations and the covariant acceleration. |
| Layer 3, the complete implication graph | `Riemannian/Geodesic/HopfRinow.lean`, `tfae_expDomain_eq_univ`, has the specified compact-exhaustion clause and no completeness premise; `Riemannian/Geodesic/Completeness.lean`, `Riemannian/Geodesic/ProperSpace.lean` and `Riemannian/Geodesic/Minimizing.lean` supply the separate implications. Base-point propagation is exported explicitly. |
| Layer 4, compact manifolds | `Riemannian/Geodesic/Compact.lean`, `isGeodesicallyCompleteAt_of_compactSpace`, uses the extended metric and has no connectedness or already-installed ordinary metric hypothesis. |
| Layer 4, metric and isometry interfaces | `Riemannian/LengthSpace.lean`, the geodesic metric-space interfaces and `Riemannian/Isometry/{LeviCivita,AlongCurve,Geodesic,Exponential,Completeness}.lean` give the canonical length/geodesic and smooth-isometry transports. No bare metric-isometry smoothness theorem is assumed. |
| Flat-space acceptance, including dimension zero | `Riemannian/Geodesic/Euclidean.lean` explicitly computes the affine geodesic, maximal interval, exponential domain/map/derivative, normal balls and logarithm. Its model-space hypotheses do not require the space to be nontrivial. |
| Open-unit-ball rejection test | `Riemannian/Geodesic/Examples/OpenUnitBall.lean` computes the finite-time boundary behavior and radial minimizing segments. The associated `RealOpenUnitBall` API proves non-completeness/non-compactness, so the existence of minimizing segments does not imply properness. |

A fresh build of all 192 already-merged inventory modules passes in 8,411 Lake jobs on the
baseline above. Its 25 key axiom reports contain only `propext`, `Classical.choice` and
`Quot.sound`. The flat-space acceptance specializes the native APIs to dimension zero, and the
open-unit-ball probe checks actual minimizing segments together with failure of completeness,
properness and compactness of the specified closed ball. The boundary and corner probes compile
with warnings treated as errors at the exact #18707 head above. #21067 has now passed its post-prerequisite rebase and local acceptance checks; fresh
current-head review, genuine CI and normal main inclusion remain outstanding. The full 197-module catalog and native acceptance probes must
pass again on actual main containing both remaining prerequisites. This is a source/API and
key-proof audit, not an independent replay of every transitive proof.

The archived historical prototype continues to elaborate at the unchanged roadmap dependency
pin. It does not import these newer implementation modules or certify their presence at that
old revision. The merged revisions must be recorded before declaring the archive complete.

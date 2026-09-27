<!--tauceti-status:v1 {"roadmap":"HopfRinow","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: HopfRinow

This file documents the status of the HopfRinow roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, the reconciled Riemannian distance, is done up to two loose ends, and the connection half of Layer 1 is done: the Levi-Civita connection exists, is unique and `C^∞`, the along-curve derivative and the geodesic predicate are in place, and geodesics have constant speed. The geodesic spray, its flow, and the exponential map are not built, so Layers 2 and 3 have not begun; Layer 4's length-space and geodesic-space API exists, but its Riemannian instance waits on Layer 3.

### Named results

- **do Carmo's distance is Mathlib's distance** — the infimum of lengths over piecewise-`C¹` paths equals `Manifold.riemannianEDist`, via a corner-smoothing theorem giving every piecewise-`C¹` path a `C¹` path of the same endpoints and length ([`TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/EDistComparison.html#TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise)).
- **Existence and uniqueness of the Levi-Civita connection** — the connection built from the Koszul formula is torsion-free and metric-compatible, and any two such connections agree ([`CovariantDerivative.isLeviCivita_leviCivita`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Existence.html#CovariantDerivative.isLeviCivita_leviCivita), [`CovariantDerivative.IsLeviCivita.unique`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Basic.html#CovariantDerivative.IsLeviCivita.unique)).
- **Smoothness of the Levi-Civita connection** — on a `C^∞` manifold with a `C^∞` metric the connection is `C^∞`, and its Christoffel symbols are `C^∞` on every tangent-trivialization base set ([`CovariantDerivative.instContMDiffCovariantDerivativeLeviCivita`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Regularity.html#CovariantDerivative.instContMDiffCovariantDerivativeLeviCivita), [`CovariantDerivative.contMDiffOn_christoffelSymbol_leviCivita`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Regularity.html#CovariantDerivative.contMDiffOn_christoffelSymbol_leviCivita)).
- **Geodesics have constant speed** — on an open preconnected parameter set a geodesic has the same speed at every two parameters, the lemma that makes a geodesic Cauchy at a finite endpoint ([`TauCeti.Manifold.IsGeodesicCurveOn.norm_curveVelocityWithin_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/ConstantSpeed.html#TauCeti.Manifold.IsGeodesicCurveOn.norm_curveVelocityWithin_eq)).
- **The finite-endpoint extension criterion** — an integral curve of a `C¹` vector field on `Ioo a b` that accumulates at a point of the manifold as `t → b⁻` extends past `b`, with the left-endpoint analogue; hence the maximal integral curve has no cluster point at a finite endpoint ([`IsMIntegralCurveOn.exists_gt_isMIntegralCurveOn_Ioo_of_tendsto`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/IntegralCurve/Extension.html#IsMIntegralCurveOn.exists_gt_isMIntegralCurveOn_Ioo_of_tendsto)).

### Notable definitions and infrastructure

- The ordinary metric space of a preconnected Riemannian manifold ([`TauCeti.MetricSpace.ofRiemannianMetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Distance.html#TauCeti.MetricSpace.ofRiemannianMetric)), with the open-submanifold restriction of a metric, is what lets `ProperSpace`, `CompleteSpace` and the open-unit-ball example be stated.
- The along-curve covariant derivative ([`CovariantDerivative.alongCurveWithin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Basic.html#CovariantDerivative.alongCurveWithin)) and the geodesic predicate with initial data ([`TauCeti.Manifold.IsGeodesicCurveOnFrom`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.html#TauCeti.Manifold.IsGeodesicCurveOnFrom)) are the language every later geodesic statement is written in.
- The maximal integral curve of a `C¹` vector field ([`maximalIntegralCurve`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/IntegralCurve/Maximal.html#maximalIntegralCurve)) and the inverse function theorem for manifolds ([`TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocalDiffeomorph.html#TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq)) are the general tools the exponential map will be built from.

### Roadmap coverage

- **Layer 0**: done except two items. The constant-speed reparametrization of a regular `C¹` curve is absent, and lower semicontinuity landed only as a total-variation bound on the limit curve, not in the `pathELength` form.
- **Layer 1**: the Levi-Civita connection (existence, uniqueness, regularity, Christoffel smoothness), the along-curve derivative, `IsGeodesicCurveOn` with initial data and the chart equation, constant speed, the manifold inverse function theorem, and the finite-endpoint extension criterion are done. Restriction and affine reparametrization of geodesics are done. The geodesic spray is partial: only the Christoffel transformation law under a change of tangent trivialization exists. Local existence and uniqueness of geodesics, smooth dependence and the local flow, the maximal interval `J(p,v)`, the exponential map and its domain, the derivative at zero, and `(a_p) ↔ (d_p)` are untouched.
- **Layer 2** and **Layer 3**: untouched.
- **Layer 4**: the length-space and geodesic-space API is done, including that geodesic spaces are length spaces and that real normed torsors are geodesic spaces. Compact implies geodesically complete has only a general-vector-field forerunner (a `C¹` field on a compact boundaryless manifold is complete); the Riemannian geodesic-space instance and isometry transport are untouched.
- **Worked examples**: segment length and the distance of a convex open subset are the norm distance; the geodesic and exponential computations and the open-unit-ball incompleteness check are untouched.

## The frontier

- **The geodesic spray** — define `S` on `TM`, prove its chart formula `(x, v) ↦ (v, -Γ_x(v, v))` chart-independent using the Christoffel transformation law now in place, deduce `C^∞` from the smooth Christoffel map, and identify its integral curves with velocity lifts of geodesics. Everything below waits on this.
- **Local existence, maximal intervals, and homogeneity** — apply the maximal integral curve and the extension criterion to `S` to get `J(p,v)`; the affine reparametrization lemma is ready for `γ_{p,λv}(t) = γ_{p,v}(λt)`.
- **Smooth dependence and the local geodesic flow** — no `C^k`-dependence theorem for ODE solutions has landed, so this is new analysis rather than assembly.
- **The exponential map and its derivative at zero** — `expDomain p`, openness, smoothness, and the identity derivative; the manifold inverse function theorem then gives a local diffeomorphism at `0`.
- **Layer 0 loose ends and the Riemannian geodesic-space instance** — regular reparametrization and `pathELength`-form lower semicontinuity are self-contained; the geodesic-space instance for a complete connected manifold is blocked on `(f_p)`.

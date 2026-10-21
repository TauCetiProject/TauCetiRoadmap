<!--tauceti-status:v1 {"roadmap":"PositiveScalarCurvature","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
# Status: PositiveScalarCurvature

This file documents the status of the PositiveScalarCurvature roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the first layer has begun. P1 has the definition of positive scalar curvature, its basic laws under pullback, scaling, products and disjoint unions, the round sphere, and concordance as an equivalence relation. It still lacks topologies on the space of metrics, family versions, the projective examples and collared bordisms. Nothing from P2 (bundle metrics) through P6 (exotic spheres) has landed, and in particular the surgery theorem, the α-obstruction and the classification have not.

### Named results

- **Concordance is an equivalence relation** — Two PSC metrics are concordant when a PSC metric on M×ℝ has cylinder ends g₀+dt² and g₁+dt². This relation is reflexive, symmetric and transitive: [`equivalence_concordant`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Concordance.html#Bundle.ContMDiffRiemannianMetric.equivalence_concordant).
- **Scalar curvature of a product** — The scalar curvature of g₁×g₂ is the sum of the scalar curvatures of the two factors: [`scalarCurvature_prodTangentSpace`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Prod.html#Bundle.ContMDiffRiemannianMetric.scalarCurvature_prodTangentSpace).
- **Shrinking a compact PSC factor** — Shrink a PSC metric on a compact factor far enough and it dominates any factor whose scalar curvature is bounded below, so the product has PSC: [`exists_pos_hasPositiveScalarCurvature_prodTangentSpace_rescale`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Basic.html#Bundle.ContMDiffRiemannianMetric.exists_pos_hasPositiveScalarCurvature_prodTangentSpace_rescale).
- **Scaling and diffeomorphism invariance** — Multiplying a metric by c>0 multiplies its scalar curvature by c⁻¹ ([`scalarCurvature_rescale_const`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Scaling.html#Bundle.ContMDiffRiemannianMetric.scalarCurvature_rescale_const)), and pulling a metric back along a diffeomorphism pulls back its scalar curvature ([`scalarCurvature_pullback`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Isometry/Pullback.html#Bundle.ContMDiffRiemannianMetric.scalarCurvature_pullback)).
- **The round sphere** — The round n-sphere of radius r has scalar curvature n(n−1)/r², so it has PSC exactly when n≥2: [`scalarCurvature_sphereRoundMetricOfRadius`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Sphere/Radius.html#TauCeti.scalarCurvature_sphereRoundMetricOfRadius).

### Notable definitions and infrastructure

- [`HasPositiveScalarCurvature`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Basic.html#Bundle.ContMDiffRiemannianMetric.HasPositiveScalarCurvature) is pointwise positivity of the Levi-Civita scalar curvature of a native smooth metric. Scalar curvature is proved smooth, and on a compact manifold PSC is equivalent to a uniform positive lower bound. That margin is what later perturbation and surgery arguments spend.
- [`IsConcordance`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Concordance.html#Bundle.ContMDiffRiemannianMetric.IsConcordance) is concordance on M×ℝ with exact product tails. It comes with the cylinder metric, time reparametrisations and gluing of metrics that agree on an overlap. These are the moves needed for reversing and concatenating concordances, and later for collars.
- [`IsLocalRiemannianIsometry`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.html#TauCeti.IsLocalRiemannianIsometry) carries the naturality of the Levi-Civita connection and of curvature through open inclusions, disjoint-union inclusions and diffeomorphisms. It is the reason that scalar curvature is local.

### Roadmap coverage

P1 is partial. These are done: the PSC predicate, smoothness and continuity of scalar curvature, the compact positive lower bound for a single metric, and the pullback, scaling, product, disjoint-union and restriction laws. Also done are the round-sphere formula, the definition of concordance, and its reversal and concatenation. For Sym²(T*M), only the symmetrisation projection on bilinear sections exists, not the subbundle or its comparison with native metrics. These remain: the C² and C∞ topologies and openness of PSC, uniform bounds for compact families and relative to closed subsets, Scal(CP^d) and Scal(HP^d), half-space collars, the equivalence between concordances on M×ℝ and collared metrics on M×[0,1], and isotopy implies concordance. P2, P3, P4, P5 and P6 are untouched.

## The frontier

- **Projective examples** — Scal(CP^d)=4d(d+1) and Scal(HP^d)=16d(d+2) on R1's normalized projective metrics. The product, scaling and sphere laws are in place, so this depends only on those supplied carriers.
- **Concordances over M×[0,1]** — The conversion between concordances with product tails on M×ℝ and PSC metrics on M×[0,1] with product collars, via the fixed reparametrisation ψ. The reparametrisation and gluing machinery already exists; what is missing is the half-space boundary model.
- **Topology on metrics and openness of PSC** — Build Sym²(T*M) as a subbundle, put the C² and C∞ section topologies on metrics, and prove PSC is open on compact M. Then extend the uniform lower bound to compact families. This consumes K5a's smooth-section topology.
- **Isotopy implies concordance** — Smoothing a compact path of PSC metrics and slowing its parameter. This needs the family bounds above.
- **Bundle metrics and Gromov–Lawson surgery (P2, P3)** — The O'Neill-type formula for shrinking positive fibres, and the torpedo/bending construction. Both follow P1, and neither has started.

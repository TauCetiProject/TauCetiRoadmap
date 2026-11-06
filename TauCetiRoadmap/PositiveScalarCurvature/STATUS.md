<!--tauceti-status:v1 {"roadmap":"PositiveScalarCurvature","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: PositiveScalarCurvature

This file documents the status of the PositiveScalarCurvature roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only P1 has begun, and it is now well advanced. It has the PSC predicate with its pullback, scaling, product and disjoint-union laws, the round sphere, concordance with its collared form, the metric bundle Sym²(T*M), and a uniform scalar gap for compact families. It still lacks topologies on the space of metrics, the projective examples and isotopy implies concordance. P2 (bundle metrics) through P6 (exotic spheres) are untouched. In particular there is no surgery theorem, no α-obstruction and no classification.

### Named results

- **Concordance is an equivalence relation** — Two PSC metrics are concordant when a PSC metric on M×ℝ ends in the cylinders g₀+dt² and g₁+dt². This relation is reflexive, symmetric and transitive: [`equivalence_concordant`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Concordance.html#Bundle.ContMDiffRiemannianMetric.equivalence_concordant).
- **Concordances can be taken on M×[0,1]** — Two metrics are concordant exactly when there is a PSC metric on M×[0,1] that is a product near both boundary components: [`concordant_iff_exists_isCollaredConcordance`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Concordance.html#Bundle.ContMDiffRiemannianMetric.concordant_iff_exists_isCollaredConcordance).
- **Uniform scalar gap for compact families** — On a compact manifold, a compact family of PSC metrics whose chart metrics vary continuously to second order has scalar curvature bounded below by a single positive constant: [`exists_pos_forall_le_scalarCurvature`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Family.html#TauCeti.Manifold.exists_pos_forall_le_scalarCurvature).
- **Shrinking a compact PSC factor** — Shrink a PSC metric on a compact factor far enough and it dominates a factor whose scalar curvature is bounded below, so the product has PSC. This builds on the [additivity of scalar curvature on products](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Prod.html#Bundle.ContMDiffRiemannianMetric.scalarCurvature_prodTangentSpace): [`exists_pos_hasPositiveScalarCurvature_prodTangentSpace_rescale`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Basic.html#Bundle.ContMDiffRiemannianMetric.exists_pos_hasPositiveScalarCurvature_prodTangentSpace_rescale).
- **The round sphere** — The round n-sphere of radius r has scalar curvature n(n−1)/r²: [`scalarCurvature_sphereRoundMetricOfRadius`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Sphere/Radius.html#TauCeti.scalarCurvature_sphereRoundMetricOfRadius).

### Notable definitions and infrastructure

- [`HasPositiveScalarCurvature`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Basic.html#Bundle.ContMDiffRiemannianMetric.HasPositiveScalarCurvature) is pointwise positivity of the Levi-Civita scalar curvature of a native smooth metric. It is invariant under pullback by local diffeomorphisms and under restriction, including to M×[a,b].
- [`scalarCurvatureOfJet`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Jet.html#TauCeti.Manifold.scalarCurvatureOfJet) writes scalar curvature in a chart as an explicit expression in the metric's Gram matrix and its first two derivatives. This expression is [continuous](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Jet.html#ContinuousAt.scalarCurvatureOfJet) wherever the Gram matrix is invertible. It is the bridge from C² closeness of metrics to closeness of scalar curvature, and every perturbation argument will rely on it.
- [`positiveDefiniteSymmetricSectionEquiv`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Section.html#Bundle.ContMDiffRiemannianMetric.positiveDefiniteSymmetricSectionEquiv) identifies native smooth metrics with the convex cone of positive-definite sections of the [smooth bundle of symmetric bilinear forms](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Bilinear/Symmetric.html#ContMDiffVectorBundle.symmetricBilinearMaps). This is the carrier on which the section topology is still to be placed.

### Roadmap coverage

P1 is partial. The following are done: Sym²(T*M) and its comparison with native metrics, the PSC predicate, smoothness of scalar curvature and its continuity as a function of the 2-jet, and the compact lower bound for one metric and for compact families. Also done are the pullback, scaling, product, disjoint-union and restriction laws, the round-sphere formula, concordance with reversal and concatenation, and its equivalence with collared concordance on M×[0,1]. Still missing are the C² and C∞ topologies on metrics, with atlas independence and openness of PSC, and the family bound relative to a closed subset. Scal(CP^d) and Scal(HP^d), collar-smoothing laws and isotopy implies concordance are also missing. The family bound so far assumes chart-wise C² continuity, not continuity in a topology on metrics. P2, P3, P4, P5 and P6 are untouched.

## The frontier

- **Topology on metrics and openness of PSC** — Put K5a's smooth-section topology and the explicit C² topology on the section space of Sym²(T*M), compare them with finite-atlas seminorms, and prove PSC open on compact M. The jet continuity theorem supplies most of the analysis. What remains is the topology and atlas independence.
- **Projective examples** — Scal(CP^d)=4d(d+1) and Scal(HP^d)=16d(d+2) on R1's normalized projective metrics. This depends only on those supplied carriers.
- **Isotopy implies concordance** — Smooth a compact path of PSC metrics relative to its endpoints and slow its parameter. The uniform family gap and collared concordances are in place, but the path has to live in the metric topology above.
- **Relative family bounds** — The uniform gap for families that are fixed near a specified closed subset, which later relative surgery constructions need.
- **Bundle metrics and Gromov–Lawson surgery (P2, P3)** — Shrinking positive fibres via the O'Neill-type formula, and the torpedo and bending construction. Both follow P1, and neither has started.

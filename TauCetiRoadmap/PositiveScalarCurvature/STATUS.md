<!--tauceti-status:v1 {"roadmap":"PositiveScalarCurvature","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Scal(CP^d)=4d(d+1) and Scal(HP^d)=16d(d+2) on the projective carriers","state":"partial"},{"id":"Layer 2","remaining":"Lie structure of the isometry group, smooth associated bundles, connection metrics and the O'Neill formula, projective-plane bundles","state":"partial"},{"id":"Layer 3","remaining":"general tube principal-curvature estimates, bending outside the product case, the surgery theorem, relative and family versions","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"bb3392b5ec3bba24e1cf11bbddeca1c6f5b6dabe987bfe652c95f0bc6daf7097","roadmap":"PositiveScalarCurvature","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: PositiveScalarCurvature

This file documents the status of the PositiveScalarCurvature roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 (metrics, positivity and families) is done except for the projective model computations. Layers 2 and 3 are genuinely partial. Distance isometries are now known to be smooth, but the isometry group is not yet a Lie group, and the bending step of Gromov–Lawson surgery is proved only in a product neighbourhood. Layers 4, 5 and 6 (bordism, the α-obstruction, exotic spheres) have not begun.

### Named results

- **Isotopic metrics are concordant** — On a closed manifold, two metrics joined by a C²-continuous path of PSC metrics are concordant: [`JoinedIn.concordant`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Isotopy.html#JoinedIn.concordant).
- **Positive scalar curvature is an open condition** — On a closed manifold, PSC metrics form an open set in the C² topology, and hence in the C∞ topology: [`isOpen_setOf_hasPositiveScalarCurvature_chartC2`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Topology.html#Bundle.ContMDiffRiemannianMetric.isOpen_setOf_hasPositiveScalarCurvature_chartC2).
- **Myers–Steenrod, smoothness half** — A map that preserves Riemannian distances, into a complete manifold, is smooth and preserves the metric: [`Isometry.contMDiff`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Isometry/Smooth.html#Isometry.contMDiff). Hence a distance-preserving bijection is a [smooth Riemannian isometry](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Isometry/Smooth.html#IsometryEquiv.toRiemannianIsometry).
- **The Gromov–Lawson handle metric** — The torpedo metric has PSC in dimension at least three, and so does its product with a round Sᵐ, m≥2, of any radius: [`hasPositiveScalarCurvature_torpedoMetric_prodTangentSpace_sphereRoundMetricOfRadius`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Handle.html#TauCeti.hasPositiveScalarCurvature_torpedoMetric_prodTangentSpace_sphereRoundMetricOfRadius).
- **Bending in a product neighbourhood** — Suppose that near a sphere of codimension q≥3 the metric is a product of a metric with scalar curvature at least R₀>0 and the flat normal disc. Then the metric bent along a Gromov–Lawson curve has PSC: [`hasPositiveScalarCurvature_rotationalMetric_prodTangentSpace`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Bending/Product.html#TauCeti.IsGromovLawsonBendingCurve.hasPositiveScalarCurvature_rotationalMetric_prodTangentSpace).

### Notable definitions and infrastructure

- The topologies on metrics. The [chart Cᵏ topology](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Topology.html#Bundle.ContMDiffRiemannianMetric.chartCkTopology) is defined by uniform convergence of coordinate derivatives, and it [coincides with the section-space topology](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Riemannian/ChartSectionTopology.html#Bundle.ContMDiffRiemannianMetric.chartCkTopology_eq_frameCkTopology) on symmetric 2-tensors. On compact M, the smooth metrics [form an open subspace of the smooth symmetric sections](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Riemannian/ChartSectionTopology.html#Bundle.ContMDiffRiemannianMetric.isOpenEmbedding_toSymmetricSection_chartCInfty). The finite-order section topology also works on manifolds with boundary.
- [`scalarCurvatureOfJet`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Jet.html#TauCeti.Manifold.scalarCurvatureOfJet) expresses scalar curvature through the metric's 2-jet in a chart. Every continuity statement about PSC rests on it.
- The Gromov–Lawson bending curve, a small-angle bend, a straight shrinking segment and a final bend to the vertical, [exists with speed equal to its radius](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/PositiveScalarCurvature/Bending/Reparametrization.html#TauCeti.exists_isGromovLawsonBendingCurve_speed_eq_radius) for every q≥3, R₀>0, error constant and tube radius. The hypersurface it sweeps out is a smooth embedding.

### Roadmap coverage

- **Layer 1 is partial, with one item left.** The following are done:
  - Sym²(T*M) and the identification of metrics with its positive-definite sections.
  - The C², Cᵏ and C∞ topologies, with atlas independence, the comparison with the section topology, and the boundary case.
  - Openness of PSC and the uniform gaps.
  - The pullback, scaling, product, union, restriction and quotient laws for metrics and isotopies.
  - The round sphere.
  - Concordance with collars, and the theorem that isotopy implies concordance.

  Only Scal(CPᵈ) and Scal(HPᵈ) remain.
- **Layer 2 is partial.** The isometry group of a compact metric space is compact, and distance isometries are smooth Riemannian isometries. The Lie group structure of the isometry group is still missing, as are smooth associated bundles, connection metrics with the O'Neill formula, and the projective-plane bundles.
- **Layer 3 is partial.** The following are in place:
  - The torpedo and handle metrics and the bending-term formula.
  - The bending curves and their embedded hypersurfaces.
  - PSC of the bent metric in a product neighbourhood.
  - Connected sums of metrics that already match on a neck.

  Still missing are the tube estimates for a general metric, the surgery theorem and its relative and family versions.
- **Layers 4, 5 and 6 are untouched.**

## The frontier

- **Tube estimates (3.1)** — Prove that q−1 principal curvatures of a small distance tube are −1/r+O(1) and the rest are O(1), together with the rescaled C² comparison with the normal sphere-bundle metric. These supply the error constant the existing bending curves absorb, extending bending beyond the product case.
- **The surgery theorem (3.2)** — Glue the bent region to the exterior with a uniform positive margin to get PSC on the surgered manifold. Deforming a PSC metric into torpedo form near a point would also make the connected-sum theorem unconditional.
- **Myers–Steenrod, Lie half (2.1)** — Compactness via Arzelà–Ascoli, no small subgroups, and the Lie structure of the isometry group. This needs CompactGroups' Peter–Weyl separation and LieGroups' closed-subgroup theorem.
- **Projective examples (1.3)** — Scal(CPᵈ)=4d(d+1) and Scal(HPᵈ)=16d(d+2) on RiemannianGeometry R1's projective carriers. The last items of Layer 1; 2.3 needs them.
- **Connection metrics (2.2)** — Smooth associated bundles P×_G F, the formula Scal(g_ε)=Scal(g_B)+ε⁻²Scal(g_F)−ε²|A|², and shrinking a PSC fibre. This waits on SmoothBundlesConnections B1 and B3.1, and on 2.1 for the structure group.

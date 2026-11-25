<!--tauceti-status:v1 {"roadmap":"GaussianIsoperimetryAndClusters","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2","ts":"2026-11-25T12:15:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"lower semicontinuity, convex and Lipschitz-domain perimeters, translation derivative, Lipschitz coarea, cylinders, the n = 1 boundary formulas","state":"partial"},{"id":"Layer 3","remaining":"interface decomposition, interface quadratic form, isoperimetricProfile and existence of minimizing clusters","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"1f9b90a51f78aad600c3885b47d67095937f9daa35a4ea925f8ee2ab3c4759ca","roadmap":"GaussianIsoperimetryAndClusters","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2"}-->
# Status: GaussianIsoperimetryAndClusters

This file documents the status of the GaussianIsoperimetryAndClusters roadmap up until `58174b5` (2026-11-25T12:15:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1, the one-dimensional Gaussian toolkit, is done. Layer 2, weighted variation and perimeter, is largely done, and Layer 3 has only the definition of clusters. The model simplicial cluster, the isoperimetric theorem itself, its functional and concentration forms and Ehrhard's inequality (Layers 4–9) have not begun.

### Named results

- **The weighted Gauss–Green formula** — for a C¹ weight, a set of locally finite perimeter and a compactly supported C¹ field, the integral of the weighted divergence over the set equals the flux through the reduced boundary against the weighted Hausdorff measure; a [bounded-field version](https://taucetiproject.org/docs/TauCeti/Analysis/BoundedVariation/Weighted/GaussGreen.html#TauCeti.integral_weightedDivergence_eq_integral_reducedBoundary_of_bounded) holds for finite measures ([`integral_weightedDivergence_eq_integral_reducedBoundary`](https://taucetiproject.org/docs/TauCeti/Analysis/BoundedVariation/Weighted/GaussGreen.html#TauCeti.integral_weightedDivergence_eq_integral_reducedBoundary)).
- **Weighted perimeter as boundary measure** — the weighted perimeter of a set of locally finite perimeter is the e^{−W}-weighted Hausdorff measure of its reduced boundary ([`weightedPerimeter_eq_lintegral_reducedBoundary`](https://taucetiproject.org/docs/TauCeti/Analysis/BoundedVariation/Weighted/ReducedBoundary.html#TauCeti.weightedPerimeter_eq_lintegral_reducedBoundary)).
- **The weighted coarea formula** — weighted variation is the integral over levels of the weighted perimeters of superlevel sets, for every locally integrable function ([`weightedVariation_eq_lintegral_weightedPerimeter`](https://taucetiproject.org/docs/TauCeti/Analysis/BoundedVariation/Weighted/Coarea.html#TauCeti.weightedVariation_eq_lintegral_weightedPerimeter)).
- **Gaussian perimeter of a half-space** — the half-space at signed distance c from the origin has Gaussian perimeter φ(c), which is I(γ(H)) and so the equality case the isoperimetric theorem will target ([`gaussianPerimeter_setOf_inner_lt`](https://taucetiproject.org/docs/TauCeti/Analysis/BoundedVariation/Weighted/HalfSpace.html#TauCeti.gaussianPerimeter_setOf_inner_lt)).
- **Mills' ratio bound** — for r > 0 the Gaussian tail satisfies 1 − Φ(r) < φ(r)/r, alongside the sharpened bound 1 − Φ(r) ≤ e^{−r²/2}/2 ([`one_sub_cdf_gaussianReal_lt_gaussianPDFReal_div`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/Cdf.html#TauCeti.Probability.one_sub_cdf_gaussianReal_lt_gaussianPDFReal_div)).

### Notable definitions and infrastructure

- **The Gaussian isoperimetric function** [`gaussianIsoperimetricProfile`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Gaussian/IsoperimetricProfile.html#TauCeti.Probability.gaussianIsoperimetricProfile), I = φ ∘ Φ⁻¹, comes with I′ = −Φ⁻¹, I″ = −1/I and strict concavity on [0, 1]. It is the right-hand side of every isoperimetric inequality to come.
- **Weighted variation and perimeter** [`weightedVariation`](https://taucetiproject.org/docs/TauCeti/Analysis/BoundedVariation/Weighted/Basic.html#TauCeti.weightedVariation), defined by duality for any C¹ weight. It has the density-bounded form, comparison with Euclidean variation and identification with the weighted variation measure. Compactness in L¹(μ) for finite μ, the step that will give minimizers, is also in place.
- **Clusters** [`Cluster`](https://taucetiproject.org/docs/TauCeti/Analysis/BoundedVariation/Weighted/Cluster.html#TauCeti.Cluster), tuples of disjoint finite-perimeter cells covering the space up to a null set. They have a total perimeter, equivalence up to null sets, permutation, grouping of cells and transport by isometries.

### Roadmap coverage

Layer 1 is done: the isoperimetric function with its calculus, both tail bounds, and the orthogonal splitting with half-space measures Φ(s). Layer 2 is partial. The definitions, the density-bounded form, the variation-measure identity, the BV coarea formula, compactness, the frontier bound, the half-space and ball perimeters, Gauss–Green with its bounded-field form and isometry invariance are proved. Still missing: lower semicontinuity, the perimeter of open convex sets and Lipschitz domains, the translation derivative of γ(U + tw), the weighted Lipschitz coarea formula and cylinders. The boundary-measure and Gauss–Green statements also need the one-dimensional case, since they assume dimension at least 2. Layer 3 is partial: §3.1 is done, while interfaces, the interface quadratic form, profiles and existence of minimizers are absent. Layers 4 through 9 are untouched.

## The frontier

- **Lower semicontinuity of weighted perimeter** — the only piece of §2.4 still missing. With the compactness already proved, it unlocks existence of minimizing clusters (§3.5).
- **The interface decomposition** — writing cell perimeters as sums of interface areas A_ij (§3.2). It needs GeometricMeasureTheory's density trichotomy on reduced boundaries and feeds the interface quadratic form of §3.3.
- **Cylinders and the translation derivative** — Gaussian perimeter of U ⊕ F^⊥ (§2.7) and the derivative of γ(U + tw) (§2.5). Both rest on the orthogonal splitting and the bounded-field Gauss–Green formula already in place.
- **Gaussian isoperimetry on the line** — Layer 5, the first case of the main theorem, needs the one-dimensional versions of the boundary formulas, now stated only in dimension at least 2.
- **The model simplicial cluster** — Layer 4 needs only Layers 1–3 and Gauss–Green, and nothing for it has started, beginning with the sum-zero hyperplane `simplexTangent`.

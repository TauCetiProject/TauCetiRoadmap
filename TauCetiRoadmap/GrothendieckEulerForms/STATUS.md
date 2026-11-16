<!--tauceti-status:v1 {"roadmap":"GrothendieckEulerForms","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"the matrix-valued Betti Poincare series of 3.7: its definition, independence of the minimal resolution, diagonal-support criterion, shift law, and worked checks","state":"partial"},{"id":"Layer 4","remaining":"the 4.5 identity C(q) B(q,-1) = I with the Betti Poincare matrix; the Ext power-series form is proved for infinite minimal resolutions","state":"partial"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"}],"readme_sha":"026731cb6d3d4ed19cef11d09d6d79ec20d36a312a983862a67a5aebd9174fd0","roadmap":"GrothendieckEulerForms","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: GrothendieckEulerForms

This file documents the status of the GrothendieckEulerForms roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0, 1, 2, 5, 6 and 7 are done, as are all five worked examples. Layers 3 and 4 are done apart from the matrix-valued Betti Poincaré series of §3.7 and the Betti form of the §4.5 Cartan identity, neither of which has begun. Their Ext-series counterparts are proved, including for infinite resolutions.

### Named results

- **The resolution theorem** — for a resolving subcategory of an exact category, inclusion induces an isomorphism on exact K₀, inverse to the alternating class of any finite resolution, with a graded Laurent version ([`TauCeti.ExactStructure.IsResolving.resolutionEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/GrothendieckGroup/Resolving.html#TauCeti.ExactStructure.IsResolving.resolutionEquiv)).
- **Cartan unimodularity** — when modules have finite projective resolutions the Cartan matrix has determinant ±1 ([`TauCeti.cartanMatrix_det_eq_one_or_neg_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/GrothendieckGroup/UnimodularCartanMatrix.html#TauCeti.cartanMatrix_det_eq_one_or_neg_one)), and the graded Cartan matrix has determinant ±qⁿ; the dual numbers, with Cartan matrix `[2]`, show the hypothesis is needed.
- **Linearity as a Cartan–Poincaré identity** — over a finite-dimensional, nonnegatively graded algebra with semisimple degree-zero part, the simples have linear resolutions exactly when `Cᵀ · P_tot(-q)` is the diagonal of the `dim End(Sᵢ)`, as an identity of formal power series with no bound on Ext ([`TauCeti.forall_exists_isLinear_iff_cartan_poincare_maslovEulerPowerSeries`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/GradedModuleCat/CartanMap/ExtEuler/PowerSeries.html#TauCeti.forall_exists_isLinear_iff_cartan_poincare_maslovEulerPowerSeries)).
- **The graded quiver comparison** — for `kQ` with the path-length grading, the graded Cartan matrix is `(1 - qAᵀ)⁻¹` and the q-Euler matrix of the vertex simples is `I - q⁻¹A`, recovering the Ringel form at `q = 1` ([`TauCeti.PathAlgebra.gradedExtEulerForm_gradedVertexSimpleClassBasis_eq_inv`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Quiver/PathAlgebra/GradedExtEuler/CartanMatrix.html#TauCeti.PathAlgebra.gradedExtEulerForm_gradedVertexSimpleClassBasis_eq_inv)).
- **Euler duality over a general field** — the projective/module Euler form has zero radicals over every field, and is perfect exactly when every simple is absolutely simple ([`TauCeti.projectiveExtEuler_isPerfPair_iff`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/GrothendieckGroup/EulerDuality.html#TauCeti.projectiveExtEuler_isPerfPair_iff)).

### Notable definitions and infrastructure

- [`TauCeti.gradedCartanMatrix`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Category/GradedModuleCat/CartanMap/Matrix.html#TauCeti.gradedCartanMatrix) — the graded Cartan matrix in arbitrary Laurent bases, whose change-of-basis formula lets the Cartan, q-Euler and Poincaré matrices be compared.
- [`TauCeti.bigradedExtPoincarePowerSeries`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/EulerCharacteristic/ExtEuler/Graded/Poincare/PowerSeries.html#TauCeti.bigradedExtPoincarePowerSeries) — the bigraded Ext Poincaré series with infinite cohomological support. Together with an [Euler power series](https://taucetiproject.org/docs/TauCeti/Algebra/Bigraded/PowerSeries.html#TauCeti.Bigraded.eulerPowerSeries) taken one internal degree at a time, it makes the Cartan identities meaningful for algebras like the dual numbers, whose simples have no finite resolution.
- [`TauCeti.LaurentTriangulatedK0`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/GrothendieckGroup/Laurent/Triangulated.html#TauCeti.LaurentTriangulatedK0) — graded triangulated K₀ over `ℤ[q,q⁻¹]`, an invariant of graded triangulated categories whose specializations at `q = ±1` relate grading shift and suspension.

### Roadmap coverage

Layers 0, 1, 2, 5, 6 and 7 are done; Layer 0 now also has admissible morphisms, and exact categories have unbounded relative projective resolutions with a horseshoe lemma. Layer 3 is done except for the Betti Poincaré series of §3.7: its definition from a minimal resolution, independence of that resolution, the diagonal-support criterion, the shift law, and the §3.7 checks. Both directions of the Ext-based diagonal criterion are proved. Layer 4 is done except for the §4.5 identity `C(q) · B(q, -1) = I` stated with that Betti matrix. Its Ext-series analogue holds as a power-series identity for minimal resolutions with finite-dimensional terms, and in the linear case.

## The frontier

- **The Betti Poincaré series** — define it from a minimal graded projective resolution by finitely generated terms, prove it independent of that resolution, that diagonal support means linear, and that `M{1}` has `q` times the series of `M`; then run the §3.7 checks for `1 ⟶ 2`, `k[x]/(x²)` and the dual numbers. For minimal resolutions the Ext Poincaré series against simples carry the same data, so comparing the two is the natural route.
- **The Betti form of the Cartan identity** — prove `C(q) · B(q, -1) = I` coefficientwise under local finiteness, and as Laurent matrices for finite resolutions. The Ext-series version is proved for infinite minimal resolutions, so this is mostly translation once the Betti series exists.
- **Update the §3.7 status in the README** — it still says only the forward direction of the diagonal criterion has landed, but [the converse against simples](https://taucetiproject.org/docs/TauCeti/Algebra/Category/GradedModuleCat/Idempotent/MinimalResolution.html#TauCeti.GradedProjectiveResolution.exists_isLinear_iff_subsingleton_ext_simple) is proved over a semisimple degree-zero part.

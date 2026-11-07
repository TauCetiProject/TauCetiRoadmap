<!--tauceti-status:v1 {"roadmap":"RealAnalyticGeometry","to_sha":"5d671b97e3d9afab126136a621a8044b6f545468","ts":"2026-10-24T12:00:07Z"}-->
# Status: RealAnalyticGeometry

This file documents the status of the RealAnalyticGeometry roadmap up until `5d671b9` (2026-10-24T12:00:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is at its foundations. Semianalytic sets are defined, with the full first block of their R1 calculus, and R0's neighbourhood complexification adapter is proved. R2 has some preparatory convex and band lemmas but not its subdivision lemma or Łojasiewicz's theorem. Local normal decomposition, the Nash comparison of R1.1, and everything in R3–R5 (complexification of manifolds, Stein theory, Grauert's embedding, manifold triangulation) have not begun.

### Named results

- **Complexification on an open set**: a real-analytic function on an open subset of ℝⁿ extends holomorphically to an open complex neighbourhood whose real points are exactly the original set. The neighbourhood can be chosen conjugation-invariant, with the extension commuting with conjugation. This is R0's neighbourhood adapter ([`AnalyticOnNhd.exists_complexification`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/Complexification/Neighborhood.html#AnalyticOnNhd.exists_complexification); the vector-valued form is [`exists_complexification_pi`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/Complexification/Neighborhood.html#AnalyticOnNhd.exists_complexification_pi)).
- **Uniqueness of complexifications**: two holomorphic functions near the real points of an open set that agree on those real points agree on a smaller conjugation-invariant neighbourhood ([`AnalyticOnNhd.exists_eqOn_of_forall_real`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/Complexification/Neighborhood.html#AnalyticOnNhd.exists_eqOn_of_forall_real)).
- **Equivalence of semianalytic presentations**: a set is semianalytic at a point exactly when, near that point, it is a finite union of sets cut out by one analytic equation and finitely many strict analytic inequalities ([`TauCeti.semianalyticAt_iff_exists_iUnion`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAnalytic/Semianalytic/Basic.html#TauCeti.semianalyticAt_iff_exists_iUnion)).
- **Analytic preimages of semianalytic sets**: the preimage of a semianalytic set under a real-analytic map is semianalytic ([`TauCeti.IsSemianalytic.preimage`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAnalytic/Semianalytic/Basic.html#TauCeti.IsSemianalytic.preimage)). Images under analytic isomorphisms behave in the same way ([`Equiv.isSemianalytic_image_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAnalytic/Semianalytic/Basic.html#Equiv.isSemianalytic_image_iff)).
- **Coning a triangulated boundary**: coning a triangulation of the intrinsic frontier of a compact convex set to an interior point triangulates the set ([`Geometry.SimplicialComplex.space_cone_of_space_eq_intrinsicFrontier`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/SimplicialComplex/Cone.html#Geometry.SimplicialComplex.space_cone_of_space_eq_intrinsicFrontier)).

### Notable definitions and infrastructure

- **Semianalytic sets**: [`TauCeti.SemianalyticAt`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAnalytic/Semianalytic/Basic.html#TauCeti.SemianalyticAt) and [`TauCeti.IsSemianalytic`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAnalytic/Semianalytic/Basic.html#TauCeti.IsSemianalytic) follow the README's convention: the analytic functions and the Boolean formula may vary from point to point. They come with shrinking invariance, closure under finite Boolean operations and [locally finite unions](https://taucetiproject.org/docs/TauCeti/Geometry/RealAnalytic/Semianalytic/Basic.html#LocallyFinite.isSemianalytic_iUnion), and the inclusion of [semialgebraic sets](https://taucetiproject.org/docs/TauCeti/Geometry/RealAnalytic/Semianalytic/Basic.html#TauCeti.IsSemialgebraic.isSemianalytic). Every later layer's compatibility condition is stated in these terms.
- **Cones on simplicial complexes**: the [cone](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/SimplicialComplex/Cone.html#Geometry.SimplicialComplex.cone) with apex condition [`IsConeApex`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/SimplicialComplex/Cone.html#Geometry.SimplicialComplex.IsConeApex), which guarantees the apex lies off every face's affine span. This is the inductive step of R2's convex-polyhedral subdivision lemma.
- **Band calculus**: the library already has closures of regions between graphs and the band interpolation maps, together with their restriction and continuity properties (`TauCeti.closure_regionBetween`, `TauCeti.regionBetweenMap`). These are the endpoint helpers that the README asks R2 to export ahead of the analytic induction, corresponding to Łojasiewicz's Lemmas 11–12 and 14.

### Roadmap coverage

**R0** is partial. The neighbourhood adapter is done, with conjugation compatibility and uniqueness, but the chart-local germ API on real-analytic manifolds (restriction, pullback, composition, transport across chart equivalences) is not established. **R1** is partial. Its first paragraph is done in a normed space: presentations, shrinking, equivalence of presentations, Boolean closure, and analytic preimage/isomorphism stability. The manifold-level notion, the local normal-decomposition theorem, dimension theory, the frontier condition and component finiteness are untouched. **R1.1** has only the semialgebraic-implies-semianalytic inclusion; Nash germs and locally semialgebraic sets are untouched. **R2** has preparatory pieces only: the cone construction and the band calculus. The subdivision lemma itself, the normal-box API, Łojasiewicz's Theorem 1 and R2.1 are untouched. **R3, R4 and R5** are untouched.

## The frontier

- **R1 local normal decomposition**: partition a coordinate neighbourhood into connected, locally closed analytic pieces on which a finite family of analytic functions has constant sign. It needs real Weierstrass preparation from the complexification adapter, plus CK K3's convergent preparation and the RealAlgebraicGeometry Layers 1, 2 and 4 suppliers.
- **Relative convex-polyhedral subdivision lemma**: the dimension induction that retains lower-face triangulations and cones to an interior point. The coning step is proved; what remains is common-face agreement, coverage, and the locally finite family statement.
- **R0 chart-local germ API**: restriction, pullback, composition and chart transport of `AnalyticAt` germs on `IsManifold 𝓘(ℝ,E) ω M`, and their agreement with RealAlgebraicGeometry Layer 7's complexification maps.
- **Manifold-level semianalytic sets**: the notion tested in the shared `TauCeti.IsAnalyticSubmanifold` charts, transported through the chart-invariance results already proved in a normed space.
- **R1 dimension and frontier condition**: these wait on the normal decomposition, and define dimension through it.

<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce","ts":"2026-10-01T19:24:41Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"collar and tubular-neighbourhood existence, gluing along boundary pieces, handle attachment and connected sum","state":"partial"},{"id":"Layer 2","remaining":"Brown's global bicollaring theorem (stated only as a hypothesis) and local flatness of PL embeddings","state":"partial"},{"id":"Layer 3","remaining":"continuity of inversion (a topological group), and the Watanabe statement; Smale is stated, not proved","state":"partial"},{"id":"Layer 4","remaining":"bracket invariance under Reidemeister II, Reidemeister III, Reidemeister and Markov theorems, PL realization, sliceness, Jones and HOMFLY","state":"partial"},{"id":"Layer 5","remaining":"the knot complement as a manifold with torus boundary, Dehn filling along a slope, and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, Seifert matrices of actual knots, the tau import and mutation","state":"partial"},{"id":"Layer 7","remaining":"Mostow invariance and metric-independent hyperbolic volume, the Weeks manifold, virtual Haken-ness","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"leaves and taut foliations, the Euler class of an oriented plane bundle, and the Euler-class bound","state":"partial"},{"id":"Layer 11","remaining":"the reconciliation: polyhedra of combinatorial manifolds are PL manifolds for layer 1's PLGroupoid, and Whitehead's converse","state":"partial"}],"readme_sha":"0de990f4a469924f6292ffabe6004d6fa925a5c47df4e6102e6741ace1e7cf8d","roadmap":"GeometricTopology","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `8a32441` (2026-10-01T19:24:41Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete. The most developed are knot theory (layer 4), the simplicial layer (11) and Riemannian geometry (layer 7). Layer 4's diagrams now carry planarity and the second Reidemeister move. The Smale and virtual fibering conjectures are stated but not proved. Layers 8 and 9 have not begun, and layer 10 has only its first definition.

### Named results

- **Isometry invariance of Riemannian volume** — a differentiable homeomorphism whose tangent maps preserve the metric carries one Riemannian volume onto the other, with no orientation hypothesis ([`Homeomorph.measurePreserving_riemannianVolume`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Isometry.html#Homeomorph.measurePreserving_riemannianVolume)). So total volume is an isometry invariant of compact Riemannian manifolds.
- **The Burau-Alexander polynomial is a Markov invariant** — it changes only by a unit under either Markov move ([`TauCeti.MarkovEquiv.associated_burauAlexander`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Burau/Alexander.html#TauCeti.MarkovEquiv.associated_burauAlexander)). It follows that the trefoil braid is not Markov equivalent to the trivial braid.
- **S-equivalence invariance of the Tristram-Levine signature** — the signature of a Seifert matrix is unchanged under S-equivalence ([`SEquivalent.tristramLevineSignature_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/TristramLevine/SEquivalence.html#TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent.tristramLevineSignature_eq)).
- **The second Reidemeister move preserves planarity** — inserting a two-crossing clasp inside a face of a PD code gives a planar code exactly when the original code was planar ([`TauCeti.PDCode.isPlanar_insertClasp_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/PDCode/ClaspInsertion.html#TauCeti.PDCode.isPlanar_insertClasp_iff)). Across two faces it does not.
- **Topological concordance is an equivalence relation** — for locally flat embeddings in collared form ([`TauCeti.TopologicallyConcordant.equivalence`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocallyFlat/Concordance/Basic.html#TauCeti.TopologicallyConcordant.equivalence)). Smoothly concordant embeddings of boundaryless manifolds are also topologically concordant.

### Notable definitions and infrastructure

- **The weak Whitney topology on diffeomorphisms** ([`Diffeomorph.weakWhitneyTopology`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Topology.html#Diffeomorph.weakWhitneyTopology)) is the space that layer 3's homotopy statements live in. It has closed pointwise-fixing subgroups, a jointly continuous action, and now [continuous composition](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Composition.html#Diffeomorph.continuousMul).
- **Planar PD codes** ([`TauCeti.PDCode.IsPlanar`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/PDCode/Planar.html#TauCeti.PDCode.IsPlanar)) are defined through faces and the permutation triple of the diagram's graph. This supplies the face data that the second and third Reidemeister moves need. Braid words [close up](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/BraidWord/PDCode.html#TauCeti.BraidWord.closure) to oriented PD codes.
- **Hyperbolic metrics** ([`TauCeti.HyperbolicMetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic.html#TauCeti.HyperbolicMetric)) are bundled complete metrics of constant curvature `-1`. Their volume ([`TauCeti.hypVolumeOfMetric`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Volume.html#TauCeti.hypVolumeOfMetric)) is the quantity that Mostow invariance and the Weeks target refer to.

### Roadmap coverage

No layer is done. Layers 1 to 7, 10 and 11 are partial, and layers 8 and 9 are untouched.

- **Layer 4** has braids, Burau and Temperley-Lieb, and Markov equivalence. It has Gauss and PD codes with planarity, the Kauffman bracket invariant under Reidemeister I, clasp insertion as Reidemeister II, and closure from braid words to diagrams. It also has S-equivalence of Seifert matrices and smooth links. It lacks invariance of the bracket under Reidemeister II, Reidemeister III, Reidemeister's and Markov's theorems, realization as PL knots, sliceness, and the Jones and HOMFLY polynomials.
- **Layer 11** has realization, subdivision, combinatorial manifolds, collapse, and statements of the Zeeman and triangulation conjectures. It does not yet reconcile any of this with the PL groupoid.
- **Layer 7** has volume, sectional curvature, hyperbolic metrics and their volume, and the fibering and Haken predicates. It lacks Mostow invariance and the Weeks manifold.
- **Layer 3** has its topology, relative subgroups, continuous composition and the Smale statement. It lacks continuity of inversion and the Watanabe statement.
- **Layers 1 and 2** have the boundary as a manifold, the closed ball as a manifold with boundary, local collars, the normal space, the PL groupoid and local flatness. They have no existence theorem for collars or tubular neighbourhoods, and no gluing or connected sum. Brown's theorem appears only as a hypothesis.
- **Layer 6** has smooth and topological concordance but no concordance group.
- **Layer 5** has only slopes, and **layer 10** has only foliations.

## The frontier

- **`Diff(M)` as a topological group** — composition is continuous, so only continuity of inversion remains, which needs an inverse-function estimate. Watanabe's statement also needs the homotopy groups of `Diff(D⁴, ∂)`.
- **Reidemeister invariance of the bracket** — Reidemeister II can now be performed inside a face, but the bracket has not been shown invariant under it. Reidemeister III has not been defined. Both are needed to make the normalized bracket a link invariant and to define the Jones polynomial.
- **Mostow invariance of hyperbolic volume** — a metric-independent volume needs Mostow's theorem in dimension at least 3. The Weeks target also needs the Weeks manifold, which in turn needs Dehn filling (layer 5) or face-pairings.
- **The collar and tubular-neighbourhood theorems** — these are the missing input for gluing. Gluing in turn is needed for handles, connected sum, the concordance group, Dehn filling and Heegaard splittings.
- **Seifert matrices of knots** — signatures are S-equivalence invariants of matrices, but no knot yet produces a Seifert matrix.

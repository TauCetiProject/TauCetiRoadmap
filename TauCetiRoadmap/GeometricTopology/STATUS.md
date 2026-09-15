<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No Kirby-list statement can be written yet. The simplicial layer (layer 11) is substantially built short of its two theorems; layers 1 through 5 each have real foundations but none has reached its first geometric construction (gluing, a topology on the diffeomorphism group, a knot diagram, a Dehn filling); layers 6 through 10 have not begun.

### Named results

- **The boundary of a manifold with boundary is a manifold** — for a `C^k` manifold modelled on the Euclidean half-space, the boundary is a `C^k` manifold one dimension down and its inclusion a smooth embedding ([`TauCeti.isManifold_boundary`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Boundary/Charts.html#TauCeti.isManifold_boundary)).
- **Smooth embeddings are locally flat** — a `C^n` embedding into a boundaryless manifold has a slice chart around every image point ([`TauCeti.IsLocallyFlat.of_isSmoothEmbedding`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocallyFlat/Smooth.html#TauCeti.IsLocallyFlat.of_isSmoothEmbedding)).
- **Codimension-one local flatness is local bicollaring** — for an embedding, local flatness with one-dimensional complementary model is exactly having local bicollars, the local half of Brown's theorem ([`TauCeti.isLocallyFlat_iff_isEmbedding_and_isLocallyBicollared`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocallyFlat/Bicollar.html#TauCeti.isLocallyFlat_iff_isEmbedding_and_isLocallyBicollared)).
- **The Alexander polynomial of a Seifert matrix** — Conway-normalised, symmetric, invariant under congruence and enlargement, and equal to `t − 1 + t⁻¹` and `−t + 3 − t⁻¹` on the trefoil and figure-eight matrices ([`TauCeti.KnotTheory.alexander`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Alexander.html#TauCeti.KnotTheory.alexander)).
- **The boundary of the standard simplex realizes to a sphere** — the realization of the boundary of the standard `(n+1)`-simplex is homeomorphic to `Sⁿ`, the round-trip the acceptance criteria ask for ([`AbstractSimplicialComplex.realizationStandardSuccSimplexBoundaryHomeomorphSphere`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/SimplicialComplex/Simplex/BoundarySphere.html#AbstractSimplicialComplex.realizationStandardSuccSimplexBoundaryHomeomorphSphere)).

### Notable definitions and infrastructure

- **Isotopy and ambient isotopy, defined once** ([`TauCeti.AmbientIsotopic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Homotopy/AmbientIsotopic/Basic.html#TauCeti.AmbientIsotopic)) — the general relations on continuous maps the encoding conventions call for, with naturality, products, homeomorphism of complements, and smooth specialisations (diffeotopies, smooth ambient isotopy of bundled embeddings) for knot equivalence to instantiate.
- **The self-diffeomorphism group and its reference inclusion** ([`TauCeti.Diff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Group.html#TauCeti.Diff), [`TauCeti.orthogonalToDiffSphere`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Sphere.html#TauCeti.orthogonalToDiffSphere)) — the group, its relative subgroups, and `O(n+1) → Diff(Sⁿ)` as an injective homomorphism: the algebraic half of the Smale conjecture.
- **Combinatorial manifolds and simplicial collapse** ([`PreAbstractSimplicialComplex.IsCombinatorialManifold`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold.html#PreAbstractSimplicialComplex.IsCombinatorialManifold), [`PreAbstractSimplicialComplex.Collapsible`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/SimplicialComplex/Collapse/Basic.html#PreAbstractSimplicialComplex.Collapsible)) — spheres and balls by stellar equivalence up to relabelling to the standard simplex and its boundary, the link condition on top, and collapse with cones collapsible: the vocabulary for Manolescu and Zeeman.

### Roadmap coverage

- **Layer 1: partial.** Boundary-as-manifold done for the half-space model; collars only local (a product collar chart and smooth local collar at each boundary point), no global `∂M × [0,1)`; PL pregroupoid and groupoid done with `PLGroupoid ≤ continuousGroupoid`. Gluing, handles, tubular neighbourhoods, connected sum untouched.
- **Layer 2: partial.** `IsLocallyFlat` with restriction, homeomorphism invariance, products, and composition under an explicit compatibility hypothesis; smooth implies locally flat (boundaryless only); local bicollaring. Global bicollaring, PL implies locally flat, the Annulus Conjecture untouched.
- **Layer 3: partial.** Group, relative groups, diffeotopies, the `O(n+1)` inclusion. No `C^∞` topology, no smooth-families map; Smale not stateable.
- **Layer 4: partial.** Braid groups, unreduced and reduced Burau, Temperley–Lieb with the Jones representation, Markov equivalence with component count, Alexander from a Seifert matrix, a smooth circle presentation (no framing). No diagrams, Reidemeister or Markov theorems, Seifert matrix of a knot, Jones polynomial, slice-ness.
- **Layer 5: partial.** Slopes and the framed bijection with `ℚ ∪ {∞}`; no complement, filling, or unknot identities.
- **Layers 6 to 10: untouched.**
- **Layer 11: partial, furthest along.** Realization, links, joins and cones, barycentric and stellar subdivision, combinatorial manifolds, `IsTriangulable`, collapse, the ordered cylinder. Not done: reconciliation with layer 1's PL groupoid, Manolescu, Zeeman.
- **Smoothing comparison:** PL-implies-Top is the groupoid inclusion; the other stages untouched.

## The frontier

- **Gluing along the boundary** — the spine. Boundary manifold and local collars exist; a global collar `∂M × [0,1)` is the missing step before `glue`, with Dehn filling and connected sum blocked behind it.
- **The `C^∞` topology on `Diff(M)`** — the group and `O(n+1) → Diff(Sⁿ)` exist; the initial topology in charts for compact `M` makes that inclusion continuous and the Smale conjecture stateable.
- **Knot diagrams, or a Seifert matrix of a knot** — the Alexander polynomial has no knot behind it. A diagram type with Reidemeister moves is the hub of the README's spanning tree and what Markov's theorem needs; either route makes the polynomial an invariant.
- **Zeeman's conjecture as a statement** — collapsibility and the ordered cylinder `K × I` exist; only a contractible-2-complex predicate remains. The nearest Kirby-list target.
- **Combinatorial manifold implies PL manifold** — both sides exist, but the realization has only the weak topology and no charts; a PL atlas on the polyhedron comes first.

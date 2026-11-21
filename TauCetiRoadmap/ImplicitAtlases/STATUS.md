<!--tauceti-status:v1 {"roadmap":"ImplicitAtlases","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"orientation lines, finite-group chain invariants, parity, homotopy K-sheaves, compact-cover Čech, purity, extension by zero, duality, interval diagrams","state":"partial"},{"id":"Layer 1","remaining":"boundary atlases, smooth enhancement, finite subatlases and reindexing, the ineffective-point and reflection examples","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"403ce519236c58d95ccdd488cc64817a954eea21f49a3c35c00303faa04338ff","roadmap":"ImplicitAtlases","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ImplicitAtlases

This file documents the status of the ImplicitAtlases roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the first two layers have begun. Layer 1 has the definition of a topological implicit atlas, its first consequences and two examples. Layer 0 has the finite-index products of groups and obstruction representations, along with one direction of the comparison between sheaves and K-sheaves. Nothing has landed for deformation spaces, the virtual complex, the orientation sheaf, the virtual class or any of its laws (Layers 2–7).

### Named results

- **Footprints are open and cover the base** — the regular footprints V_I of an implicit atlas are [open](https://taucetiproject.org/docs/TauCeti/Topology/ImplicitAtlas/Basic.html#TauCeti.ImplicitAtlas.isOpen_footprint) and [cover X](https://taucetiproject.org/docs/TauCeti/Topology/ImplicitAtlas/Basic.html#TauCeti.ImplicitAtlas.iUnion_footprint), which is the input for extracting a finite subatlas.
- **No atlas in everywhere-negative dimension** — a [nonempty space carries no atlas](https://taucetiproject.org/docs/TauCeti/Topology/ImplicitAtlas/Basic.html#TauCeti.ImplicitAtlas.isEmpty_of_forall_neg) whose expected dimensions d + m_I are all negative, because the regular locus is empty wherever d + m_I < 0. The virtual dimension is an integer throughout, as the conventions require.
- **The K-sheaf of a sheaf** — on a locally compact Hausdorff space, the K-presheaf of germs of a sheaf along compact sets [is a K-sheaf](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/KSheaf/OfPresheaf.html#TopCat.Presheaf.IsSheaf.isKSheaf_toKPresheaf). This is one half of Pardon's Lemma A.1.8. The inverse functor and the equivalence are not yet there.

### Notable definitions and infrastructure

- **[Implicit atlases](https://taucetiproject.org/docs/TauCeti/Topology/ImplicitAtlas/Basic.html#TauCeti.ImplicitAtlas)** following Pardon's Definition 3.1.1. The structure has thickenings with Γ_I-actions, Kuranishi maps, regular loci and footprint maps on zero sets. It includes the cocycle, quotient, freeness, local product-projection and covering axioms, with U_IJ taken as the range of ψ_IJ. The test inputs are the [manifold atlas](https://taucetiproject.org/docs/TauCeti/Topology/ImplicitAtlas/Examples.html#TauCeti.ImplicitAtlas.ofChartedSpace) and the [atlas s(x) = xᵐ on a point](https://taucetiproject.org/docs/TauCeti/Topology/ImplicitAtlas/Examples.html#TauCeti.ImplicitAtlas.powAtlas).
- **[External products of representations](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Pi/External.html#Representation.externalPi)** realise E_I as a representation of Γ_I. They come with the equivariant projections, restrictions, extensions by zero, relabellings and disjoint-union splittings that the atlas axioms and the later product constructions need.

### Roadmap coverage

Layer 0 is partial. §0.1 is largely done: the products, sums, disjoint-union splittings and relabellings exist, though associativity is proved only on underlying functions. §0.6 has the sheaf-to-K-sheaf direction only. The integral orientation lines of §0.2 (as H_m(E, E∖0)), finite-group invariants on chains, parity normalization, homotopy K-sheaves, compact-cover Čech hypercohomology, purity, extension by zero, closed-subset duality and interval diagrams are all absent. Layer 1 is partial. §1.1 has the definition and its basic API, but not the ineffective-point and reflection examples or the orientation compatibility of coordinate changes. Boundary atlases (§1.2), smooth enhancement (§1.3) and subatlases with reindexing (§1.4) are absent. Layers 2 through 7 are untouched.

## The frontier

- **Finite subatlases (§1.4)** — every implicit atlas on a compact space has a finite subatlas. The footprints are already known to be open and to cover X, so what remains is the restriction of an atlas to a subset of indices and the compactness argument. Injective relabelling can then reuse the external-product relabellings.
- **The remaining §1.1 test atlases** — the ineffective ℤ/2 point and the reflection atlas s(x) = x². The later layers use these as witnesses for freeness and for the failure of local orientability.
- **Boundary atlases and smooth enhancement (§1.2–§1.3)** — the boundary restriction as an atlas of dimension d − 1, and smooth enhancement as data on regular loci. Neither depends on anything outside Layer 1.
- **Orientation lines (§0.2)** — o_E = H_m(E, E∖0; ℤ), with linear automorphisms acting by the sign of the determinant and the ordered sum and permutation comparisons. These need the coordinate orientation generators of AlgebraicTopology Layer 2.
- **The K-sheaf equivalence and compact-cover Čech cohomology (§0.6–§0.7)** — the reverse indexing functor, homotopy K-sheaves and the compact-cover groups with their comparison to Tau Ceti's open-cover Čech cohomology. These depend on TopologicalSheafCohomology TS1.1, TS1.2 and §1.4.

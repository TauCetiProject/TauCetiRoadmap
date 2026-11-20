<!--tauceti-status:v1 {"roadmap":"LieGroupoidsPoisson","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"level-fibre submanifolds, smooth-subbundle API, continuous functors, Lie groupoids with examples, bisections and isotropy groups","state":"partial"},{"id":"Layer 1","remaining":"G1.1 locality and local-frame API, the algebroid complex G1.3a, morphisms and pullbacks, G1.4 to G1.6 beyond the tangent algebroid","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"f1bd17769c92cb6b9b10697f2aa4c81681ed796e02253503337aa3260534880e","roadmap":"LieGroupoidsPoisson","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: LieGroupoidsPoisson

This file documents the status of the LieGroupoidsPoisson roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is still at its foundations, in Layers 0 and 1. Topological groupoids and their basic examples are done, and the constant-rank theorem holds in local form. Lie algebroids are defined with their Lie–Rinehart structure, and the Chevalley–Eilenberg complex of a Lie algebra exists in every degree. Lie groupoids, Poisson structures, integration theory and symplectic groupoids have not begun.

### Named results

- **The constant-rank theorem** — a smooth map from a finite-dimensional manifold, whose rank near a point never exceeds its rank there, is its derivative in suitable smooth local coordinates. No Hausdorff or countability hypothesis is needed ([`exists_openPartialHomeomorph_comp_eq_mfderiv_comp`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConstantRank.html#ContMDiffOn.exists_openPartialHomeomorph_comp_eq_mfderiv_comp)). In these coordinates the level set is the [kernel of the derivative](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConstantRank.html#ContMDiffOn.exists_openPartialHomeomorph_apply_eq_iff_mem_ker).
- **The submersion comparison** — a smooth map between finite-dimensional boundaryless manifolds is a submersion in Mathlib's normal-form sense exactly when every differential has a continuous right inverse ([`submersion_iff_split_mfderiv`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Submersion/Split.html#TauCeti.submersion_iff_split_mfderiv)).
- **The anchor is a Lie homomorphism** — the anchor of a Lie algebroid sends brackets of sections to brackets of vector fields. This is derived from Jacobi and Leibniz, not assumed ([`anchor_bracket`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LieAlgebroid/Basic.html#TauCeti.LieAlgebroid.anchor_bracket)).
- **The Chevalley–Eilenberg differential squares to zero** — for a Lie algebra with coefficients in a module, in every degree ([`d_d`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Cohomology/ChevalleyEilenberg.html#TauCeti.LieModule.Cohomology.d_d)). [Cartan's formula](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Cohomology/ChevalleyEilenberg.html#TauCeti.LieModule.Cohomology.curryLeft_d_succ) is also proved.
- **Involutivity of differential kernels** — for any smooth map, the kernels of the differential form an involutive distribution, with no constant-rank hypothesis ([`isInvolutiveDistribution_ker_mfderiv`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Distribution/Kernel.html#ContMDiff.isInvolutiveDistribution_ker_mfderiv)).

### Notable definitions and infrastructure

- **[Topological groupoids](https://taucetiproject.org/docs/TauCeti/Topology/CategoryTheory/Groupoid/Basic.html#TauCeti.IsTopologicalGroupoid)** — a Mathlib groupoid whose objects and total arrows carry topologies, with multiplication continuous on composable pairs. Restrictions, products, and the action, unit, pair and one-object examples have honest arrow topologies, not discrete ones. This is the type on which the Lie groupoid atlas is meant to live.
- **[Lie algebroids](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LieAlgebroid/Basic.html#TauCeti.LieAlgebroid)** — the section type is indexed by the algebroid, so two structures on one bundle cannot produce clashing bracket instances. The sections form a [Lie–Rinehart algebra](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LieAlgebroid/Basic.html#TauCeti.LieAlgebroid.Sections.instLieRinehartAlgebra), and the [tangent algebroid](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LieAlgebroid/Tangent.html#TauCeti.LieAlgebroid.tangent) is the basic example.
- **[The split-derivative submersion predicate](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Submersion/Split.html#TauCeti.IsDiffSubmersionAt)** — the right-inverse counterpart of Mathlib's immersion predicate. It is closed under composition and has a chart normal form at regular points, which is the form the Lie groupoid source and target axioms will use.

### Roadmap coverage

Layer 0 is partial. In §G0.0, topological groupoids, restriction, products, openness of source and target from local sections, and the unit, pair, group and action examples are done; continuous functors are not. In §G0.1, the submersion comparison and bracket naturality, including the immersion-restriction corollary, are done. The constant-rank theorem is proved only in its local coordinate form: level fibres as embedded submanifolds, the embedded local image and the smooth-subbundle API are missing. Lie groupoids (§G0.2–§G0.4) are not defined. The only piece of them in place is the common-complement lemma, which is needed for bisections. Layer 1 is partial. The §G1.1 definition and the Lie-algebra half of §G1.3 are done. The §G1.1 locality and local-frame API, the algebroid complex, and §G1.4–§G1.6 apart from the tangent algebroid are missing. Layers 2–7 are untouched.

## The frontier

- **Lie groupoids (§G0.2)** — put a smooth atlas on the total arrow type of the existing topological groupoid, with split-submersive source and target and Hausdorff source fibres. Then prove the iterated composable-arrow manifolds and translation diffeomorphisms. The unit, pair and group examples can then be upgraded from their topological versions.
- **Constant-rank level fibres (§G0.1)** — turn the local level coordinates into embedded submanifold structures of dimension `dim X − r` with their universal property. This is the input for the isotropy Lie groups of §G0.4.
- **The algebroid Chevalley–Eilenberg complex (§G1.3a)** — the differential on sections of `Alt^k(A)` with `d_A² = 0`. It needs a smooth fibrewise alternating-map bundle and wedge product.
- **Finishing §G1.1** — bracket locality, restriction to opens, and local frames with structure functions.
- **The smooth-subbundle API (§G0.1)** — kernels and images of constant-rank bundle maps, which subalgebroids (§G1.2) and isotropy algebras (§G1.5) wait on.

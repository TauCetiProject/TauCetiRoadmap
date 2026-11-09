<!--tauceti-status:v1 {"roadmap":"LieGroupoidsPoisson","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"constant-rank theorem, smooth-subbundle API, Lie groupoids with examples, bisections and isotropy groups","state":"partial"},{"id":"Layer 1","remaining":"G1.1 locality and local-frame API, the algebroid complex G1.3a, morphisms and pullbacks, G1.4 to G1.6 beyond the tangent algebroid","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"e7ec3bdf66bda315ef64ca3a7478fa8eb7348b427d7ac158370fb405ef604ab9","roadmap":"LieGroupoidsPoisson","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: LieGroupoidsPoisson

This file documents the status of the LieGroupoidsPoisson roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is at its foundations. Lie algebroids are defined with their Lie–Rinehart structure, and the Chevalley–Eilenberg complex of a Lie algebra exists in every degree. Some smooth foundations are in place: topological groupoids, the submersion comparison and bracket naturality. Lie groupoids, Poisson structures, integration theory and symplectic groupoids have not begun.

### Named results

- **The submersion comparison** — a smooth map between finite-dimensional boundaryless manifolds is a submersion in Mathlib's normal-form sense exactly when every differential has a continuous right inverse ([`submersion_iff_split_mfderiv`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Submersion/Split.html#TauCeti.submersion_iff_split_mfderiv)). With finite-dimensional targets, this is the same as [being a regular point](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Submersion/Split.html#TauCeti.isDiffSubmersionAt_iff_isRegularPoint).
- **The anchor is a Lie homomorphism** — the anchor sends brackets of sections to brackets of vector fields. This is derived from Jacobi and Leibniz, not assumed ([`anchor_bracket`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LieAlgebroid/Basic.html#TauCeti.LieAlgebroid.anchor_bracket)).
- **The Chevalley–Eilenberg differential squares to zero** — in every degree, for a Lie algebra with coefficients in a module ([`d_d`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Cohomology/ChevalleyEilenberg.html#TauCeti.LieModule.Cohomology.d_d)). This defines [Lie algebra cohomology](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Cohomology/ChevalleyEilenberg.html#TauCeti.LieModule.Cohomology.cohomology) in all degrees, and in degrees one and two the differential agrees with Mathlib's ([`d₂₃_twoCochainEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Cohomology/ChevalleyEilenberg.html#TauCeti.LieModule.Cohomology.d₂₃_twoCochainEquiv)).
- **Cartan's formula** — `ι_x d ω = L_x ω − d ι_x ω` for Lie algebra cochains ([`curryLeft_d_succ`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Cohomology/ChevalleyEilenberg.html#TauCeti.LieModule.Cohomology.curryLeft_d_succ)).
- **Involutivity of differential kernels** — for any smooth map, the kernels of the differential form an involutive distribution, with no submersion or constant-rank hypothesis ([`isInvolutiveDistribution_ker_mfderiv`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Distribution/Kernel.html#ContMDiff.isInvolutiveDistribution_ker_mfderiv)). This is what will make source-vertical fields on a groupoid closed under the bracket.

### Notable definitions and infrastructure

- **[Lie algebroids](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LieAlgebroid/Basic.html#TauCeti.LieAlgebroid)** — the section type is indexed by the algebroid. Two algebroid structures on one bundle therefore cannot produce clashing bracket instances. The sections form a [Lie–Rinehart algebra](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LieAlgebroid/Basic.html#TauCeti.LieAlgebroid.Sections.instLieRinehartAlgebra) over the smooth functions, and the [tangent algebroid](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LieAlgebroid/Tangent.html#TauCeti.LieAlgebroid.tangent) is the basic example.
- **[The split-derivative submersion predicate](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Submersion/Split.html#TauCeti.IsDiffSubmersionAt)** — the right-inverse counterpart of Mathlib's immersion predicate, closed under composition and depending only on germs. This is the form the Lie groupoid source and target axioms will use.
- **[Lie algebra cochains as alternating maps](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Cohomology/ChevalleyEilenberg.html#TauCeti.LieModule.Cohomology.cochainComplex)** — a Lie algebra acts on alternating maps, and interior products can be curried and uncurried. This is the algebraic model that the algebroid complex will follow fibrewise.

### Roadmap coverage

Layer 0 is partial. Topological groupoids are in the library: restrictions, products, the action groupoid, and openness of source and target from local sections. The submersion comparison and bracket naturality for related vector fields are also proved, including the immersion-restriction corollary. Still missing are the constant-rank theorem, the generic smooth-subbundle API, Lie groupoids and their examples, and bisections and isotropy groups. Layer 1 is partial. The §G1.1 definition and its Lie–Rinehart structure are done, and so is the standalone Lie-algebra half of §G1.3. Still missing are the §G1.1 locality, restriction and local-frame API, the algebroid complex §G1.3a, morphisms and pullbacks, and §G1.4–§G1.6 apart from the tangent algebroid. Layers 2–7 are untouched.

## The frontier

- **The algebroid Chevalley–Eilenberg complex (§G1.3a)** — build the differential on sections of `Alt^k(A)` and prove `d_A² = 0`. The Lie-algebra complex and Cartan formula supply the algebra; this needs DifferentialGeometry 0.2's alternating-map bundle and a smooth fibrewise wedge.
- **Finishing §G1.1** — bracket locality, restriction to opens, local frames with structure functions, and the converse local-frame criterion.
- **Lie groupoids (§G0.2–§G0.4)** — smooth atlases on the arrow space compatible with the existing topological-groupoid layer, with source and target in the split-submersion sense. Then the unit, pair, group, action and gauge examples, and bisections. The isotropy Lie groups wait on the constant-rank theorem.
- **The constant-rank theorem and subbundle API (§G0.1)** — the local normal form `(u,v) ↦ (u,0)` without a Hausdorff hypothesis, and kernels and images of constant-rank bundle maps. Subalgebroids (§G1.2) and isotropy algebras (§G1.5) depend on these.
- **Transformation and zero-anchor algebroids (§G1.4)** — immediate next examples on the existing structure, using the `ξ ↦ −ξ_M` sign convention.

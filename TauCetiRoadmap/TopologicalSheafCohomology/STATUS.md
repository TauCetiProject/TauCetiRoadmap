<!--tauceti-status:v1 {"roadmap":"TopologicalSheafCohomology","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"moduleCohomologyForgetComparison (V RnΓ_R ≅ Hn U) and all of §0.2 bounded-below derived sections","state":"partial"},{"id":"Layer 1","remaining":"the compact Hausdorff isomorphism Čech ≅ RΓ_R of §1.3 and all of §1.4 hypercohomology with its two spectral sequences","state":"partial"},{"id":"Layer 2","state":"done"}],"readme_sha":"74dae51d5c1d2eab3097994931dbd6034a10ae2f5ea7310b885d48fedd9a6810","roadmap":"TopologicalSheafCohomology","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: TopologicalSheafCohomology

This file documents the status of the TopologicalSheafCohomology roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 2, the proper finite-fiber stalk theorem, is done. The arbitrary-space Čech foundations of Layer 1 are largely in place, along with most ingredients of the compact Hausdorff comparison, but the comparison isomorphism itself and all of the bounded-below hypercohomology are still to come. Layer 0 can compute derived global sections from flasque and Godement resolutions, but the module-to-abelian comparison and the bounded-below derived sections have not started.

### Named results

- **The finite-fiber stalk isomorphism** — for a closed map out of a Hausdorff space with finite fiber over y, the canonical map from (f_*F)_y to the product of the stalks F_x over the fiber is an isomorphism. Proper maps are closed, so this is the roadmap's TS3.5 target, with no hypothesis on the target space ([`isIso_fiberStalkMap`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/FiberStalk.html#TopCat.Presheaf.isIso_fiberStalkMap)).
- **Acyclic resolutions compute derived functors** — a functorial resolution by objects adapted to F computes RⁿF, naturally in the argument. Flasque resolutions of module sheaves are the main example ([`rightDerivedIsoOfResolution`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Abelian/AcyclicResolution.html#CategoryTheory.Functor.rightDerivedIsoOfResolution), [`rightDerivedΓIsoOfIsFlasque`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/Flasque/Resolution.html#CategoryTheory.Sheaf.rightDerivedΓIsoOfIsFlasque)).
- **Godement sections compute derived global sections** — on any topological space, the cohomology of the global sections of the Godement resolution is naturally isomorphic, as R-modules, to the native RⁿΓ_R ([`rightDerivedΓIsoGodement`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/Cohomology/Godement.html#TauCeti.Topology.rightDerivedΓIsoGodement)).
- **Finite covers compute Čech cohomology on compact spaces** — on a compact space, the colimit over finite indexed covers is canonically isomorphic to the colimit over point-neighborhood covers. No separation axiom is needed ([`finiteCechCohomologyIso`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/Cech/Cofinal.html#TauCeti.Topology.finiteCechCohomologyIso)).
- **The long exact Čech sequence on compact spaces** — on a compact normal space, a short exact sequence of module sheaves gives a long exact sequence in cover-colimit Čech cohomology. When the middle term is flasque, the connecting map is an isomorphism in positive degrees ([`cechCohomologyδ`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/Cech/LongExactSequence.html#CategoryTheory.ShortComplex.ShortExact.cechCohomologyδ), [`isIso_cechCohomologyδ_succ_of_isFlasque`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/Cech/LongExactSequence.html#CategoryTheory.ShortComplex.ShortExact.isIso_cechCohomologyδ_succ_of_isFlasque)).

### Notable definitions and infrastructure

- **Čech cohomology as a cover colimit** ([`cechCohomology`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/Cech/Colimit.html#TauCeti.Topology.cechCohomology)) — the colimit over u-small point-neighborhood covers, ordered by the existence of a refinement, on an arbitrary space. Transition maps do not depend on the choice of refinement. This is the TS1.2 interface that CharacteristicClasses consumes.
- **Mutually cofinal systems** ([`cechCohomologyIso`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Sites/SheafCohomology/Cech/Cofinal.html#TauCeti.CategoryTheory.cechCohomologyIso)) — any two directed cover systems that refine each other give canonically isomorphic Čech cohomology. Finite-cover and point-cover computations can therefore be used interchangeably.
- **The ordered Čech complex** ([`strictMonoCechComplexHomotopyEquiv`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Sites/SheafCohomology/Cech/Ordered/HomotopyEquiv.html#TauCeti.CategoryTheory.strictMonoCechComplexHomotopyEquiv)) — over a linearly ordered index type, the complex on strictly increasing tuples is homotopy equivalent to the native tuple complex.

### Roadmap coverage

**Layer 2 is done.** The library has the definition of the product-of-stalks map, its germ formula, its naturality, the identity and composition formulas, and the isomorphism for closed maps with finite fibers out of Hausdorff spaces.

**Layer 1 is partial.**
- §1.1: raw refinement maps exist, as do homotopies between the maps of any two refinements and the ordered presentation. The library also has fixed-cover restriction and pullback maps.
- §1.2: complete as far as the source shows. It covers the cover systems, the colimit, cofinality, finite-cover cofinality on compact spaces, degree-zero normalization and vanishing on the empty space.
- §1.3: the ingredients are present on compact normal spaces. They are the long exact sequence, flasque Čech vanishing, dimension shifting, locally-zero vanishing and sheafification invariance. The isomorphism Čechⁿ ≅ RⁿΓ_R has not been stated.
- §1.4 is untouched.

**Layer 0 is partial.** The constant-ring adapter between R-module sheaves and R_X-modules is in the source. So are the acyclic-resolution comparison and the Godement computation. The comparison `moduleCohomologyForgetComparison` with abelian cohomology is not proved, and nothing of §0.2 has landed.

## The frontier

- **Compact Hausdorff Čech/derived comparison (§1.3)** — combine the flasque dimension shift with the Godement embedding to build Čechⁿ(X;F) ≅ RⁿΓ_R(F) with matching connecting maps. The fixed-cover statement for covers acyclic on intersections also remains.
- **Module-to-abelian comparison (§0.1)** — prove V RⁿΓ_R ≅ Hⁿ U. The route is to observe that the underlying abelian sheaves of the Godement terms are flasque and apply the abelian acyclicity theorem to the same sections complex. The Godement computation of RⁿΓ_R that this needs is already done.
- **Bounded-below derived sections (§0.2)** — specialize native bounded-below derived functors to Γ_R and compare them with totalized Godement sections, shifts and cones.
- **Hypercohomology and its two spectral sequences (§1.4)** — the hypercohomology double complex, its pagewise colimits and the strong convergence proof. This needs §0.2 and §1.3 first.
- **Order-free and well-ordered forms (§1.1)** — the ordered complex currently assumes a linearly ordered index type. The comparison between two well-orderings, the orientation-line form, and the compatibility of ordered and tuple refinement homotopies are not established here.

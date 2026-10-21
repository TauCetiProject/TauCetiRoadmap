<!--tauceti-status:v1 {"roadmap":"GeneralizedCohomology","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
# Status: GeneralizedCohomology

This file documents the status of the GeneralizedCohomology roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Work so far is all foundations for G2. Most of the pointed simplicial category is in place: smash product, closed structure, tensors, circle, suspension and loops. The raw mapping-path fibration is largely built. Nothing in the library is yet a spectrum or a cohomology theory, and G1 and G3–G5 have not begun.

### Named results

- **Hurewicz fibrations via lifting functions** — a continuous map is a Hurewicz fibration for test spaces in the relevant universe exactly when it has a continuous lifting function ([`isHurewiczFibration_iff_nonempty_liftingFunction`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/MappingPath/LiftingFunction.html#TauCeti.isHurewiczFibration_iff_nonempty_liftingFunction)).
- **The path fibration of a map** — the endpoint map of the mapping-path replacement of any continuous map is a Hurewicz fibration ([`MappingPathSpace.isHurewiczFibration_endpoint`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/MappingPath/LiftingFunction.html#TauCeti.MappingPathSpace.isHurewiczFibration_endpoint)). The replacement itself is [homotopy equivalent to the source](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/MappingPath/Basic.html#TauCeti.MappingPathSpace.homotopyEquiv).
- **Fibres of the mapping-path fibre are loop spaces** — given a reference path, the fibre of the source projection over a point is homotopy equivalent to the loop space ([`MappingPathFiber.projFiberHomotopyEquivLoopSpace`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/MappingPath/Fiber.html#TauCeti.MappingPathFiber.projFiberHomotopyEquivLoopSpace)). As the README requires, no identification independent of the path is claimed.
- **The simplicial suspension–loop adjunction** — smashing with `S¹ = Δ[1]/∂Δ[1]` on the left is left adjoint to pointed maps out of `S¹` ([`PointedSSet.suspensionLoopAdjunction`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Suspension.html#TauCeti.PointedSSet.suspensionLoopAdjunction)).

### Notable definitions and infrastructure

- **The closed symmetric monoidal category of pointed simplicial sets** ([`PointedSSet.monoidalClosed`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Closed.html#TauCeti.PointedSSet.monoidalClosed)). This is the degreewise smash product, with unit `S⁰` and the pointed mapping simplicial set as internal hom. Symmetric spectra will be modules over a monoid in this category.
- **Simplicial tensors and cotensors** ([`PointedSSet.simplicialTensorCotensorAdjunction`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Tensor.html#TauCeti.PointedSSet.simplicialTensorCotensorAdjunction)). These are `K₊ ∧ X` and `Map_*(K₊, X)`, the enrichment the model-structure and SM7 arguments will need.
- **The finite-bijection groupoid** ([`FiniteBijection`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/FiniteBijection.html#TauCeti.FiniteBijection)). This is the skeleton indexing symmetric sequences, with its block-sum symmetric monoidal structure and symmetric-group automorphisms.

### Roadmap coverage

G2.1 is partial. The undercategory carrier and its equivalence with simplicial pointed types are done, as are the smash product with all its coherence data, closure, tensors and cotensors, the circle, and suspension–loop. Still missing are the Kan–Quillen and pointed model structures, the realization ⊣ Sing Quillen equivalence and the realization–product comparison. G2.10 is partial. The Hurewicz predicate, both path fibrations, the loop-space fibre comparison and functoriality are done. Still missing are the comparison of the space of paths ending in a fibre with the loop space of the base, k-ification into the convenient category, and the derived-homotopy-fibre and long exact sequence comparisons. G2.2 has only its indexing groupoid, and G2.3–G2.9 are untouched. G1 (axiomatic theories) and G3–G5 (Brown representability, Leray–Hirsch/Thom, duality and Thom spectra) are untouched.

## The frontier

- **The Kan–Quillen model structure** — build it on simplicial sets and then on pointed ones, and prove realization ⊣ Sing is a Quillen equivalence. This closes G2.1 and is the base for the level and stable model structures.
- **Symmetric sequences and Day convolution** — define functors from the finite-bijection groupoid to pointed simplicial sets, prove the induction/wedge formula, and build the sphere sequence as a commutative monoid. Its modules are the symmetric spectra.
- **The fibre of a Hurewicz fibration and the loop space of its base** — this is G2.10's square-lifting construction, valid on all loop components. Fibre transport along a supplied path is the next step after it.
- **Convenient-category and long exact sequence comparisons for path fibrations** — k-ify the raw mapping-path carriers and compare them with the derived homotopy fibre. This waits on DGFloer's fibration exact sequence.
- **G1 axiomatic theories** — reduced and unreduced integer-graded theories and their equivalence can start now. They depend only on the pointed CW suppliers, not on the spectral model.

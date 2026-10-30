<!--tauceti-status:v1 {"roadmap":"GeneralizedCohomology","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3","ts":"2026-10-26T19:49:38Z"}-->
# Status: GeneralizedCohomology

This file documents the status of the GeneralizedCohomology roadmap up until `938acbb` (2026-10-26T19:49:38Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The spectral model now has its carrier. Symmetric spectra are defined as modules over the commutative sphere monoid, on top of a mostly complete pointed simplicial category and a substantial raw theory of Hurewicz fibrations. No model structure, stable homotopy category or cohomology theory exists yet. G1 and G3–G5 have not begun.

### Named results

- **The homotopy fibre of a fibre inclusion is the loop space of the base** — for a Hurewicz fibration, paths in the total space from the fibre to a chosen point are homotopy equivalent to loops in the base, on every component and with no connectedness hypothesis ([`FiberInclusionPathFiber.loopHomotopyEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/HurewiczFibration/FiberInclusion.html#TauCeti.FiberInclusionPathFiber.loopHomotopyEquiv)).
- **Hurewicz fibrations via lifting functions** — a continuous map is a Hurewicz fibration exactly when it has a continuous lifting function ([`isHurewiczFibration_iff_nonempty_liftingFunction`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/MappingPath/LiftingFunction.html#TauCeti.isHurewiczFibration_iff_nonempty_liftingFunction)).
- **The path fibration of a map** — the endpoint map of the mapping-path replacement of any continuous map is a Hurewicz fibration ([`MappingPathSpace.isHurewiczFibration_endpoint`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/MappingPath/LiftingFunction.html#TauCeti.MappingPathSpace.isHurewiczFibration_endpoint)), and, given a reference path, its fibres are [homotopy equivalent to loop spaces](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/MappingPath/Fiber.html#TauCeti.MappingPathFiber.projFiberHomotopyEquivLoopSpace).
- **Commutativity of Day convolution monoids** — a lax braided functor out of a symmetric monoidal category is a commutative monoid for Day convolution ([`DayFunctor.isCommMonObj`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/DayConvolution/Monoid.html#CategoryTheory.MonoidalCategory.DayFunctor.isCommMonObj)). This is what makes the sphere sequence a commutative monoid.
- **The simplicial suspension–loop adjunction** — smashing with `S¹ = Δ[1]/∂Δ[1]` is left adjoint to pointed maps out of `S¹` ([`PointedSSet.suspensionLoopAdjunction`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Suspension.html#TauCeti.PointedSSet.suspensionLoopAdjunction)).

### Notable definitions and infrastructure

- **Symmetric spectra** ([`SymmetricSpectrum`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.html#TauCeti.SymmetricSpectrum)) are modules over the sphere sequence `n ↦ (S¹)^∧n`, which carries coordinate-permutation actions and block-concatenation multiplication. Unit, associativity and equivariance are module laws, not side conditions, and limits are [computed levelwise](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/Limits.html#TauCeti.SymmetricSpectrum.isLimitOfLevelwise).
- **Symmetric sequences under Day convolution** ([`SymmetricSequence`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/SymmetricSequence.html#TauCeti.SymmetricSequence)) are functors from the finite-bijection groupoid to pointed simplicial sets, and form a symmetric monoidal category. Smash powers `X^∧n` give [braided monoidal examples](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Smash/Power.html#TauCeti.PointedSSet.instBraidedFiniteBijectionSmashPowFunctor).
- **The closed symmetric monoidal category of pointed simplicial sets** ([`PointedSSet.monoidalClosed`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Closed.html#TauCeti.PointedSSet.monoidalClosed)) has the degreewise smash product, unit `S⁰` and the pointed mapping simplicial set as internal hom. Tensors and cotensors by simplicial sets are also in place.

### Roadmap coverage

G2.1 is partial. The pointed carrier, smash product with full coherence, closure, tensors, cotensors, the circle and suspension–loop are done. Still missing are the Kan–Quillen and pointed model structures, the realization ⊣ Sing Quillen equivalence and the realization–product comparison. G2.2 is partial. The finite-bijection groupoid, symmetric sequences with symmetric monoidal Day convolution, the commutative sphere monoid, symmetric spectra as its modules, and limits are done. Still missing are the induction/wedge formula, free spectra and evaluation adjunctions, colimits, the smash over the sphere, function spectra and the higher sphere monoids `S^(k)`. G2.10 is partial. The Hurewicz predicate and its Serre comparison, both path fibrations, the reference-path loop comparison, and the fibre-inclusion loop comparison are done. Still missing are the convenient-category k-ification, the derived-homotopy-fibre and long exact sequence comparisons, fixed-data relative lifting and numerable bundles. A lifting-function fibre transport, with homotopy invariance and concatenation, is present in the source, but whether it meets G2.10's endpoint-fibre comparison is not established here. G2.3–G2.9 are untouched, as are G1 (axiomatic theories) and G3–G5 (Brown representability, Leray–Hirsch/Thom, duality and Thom spectra).

## The frontier

- **Finishing the symmetric-spectrum category** — prove the wedge formula `(A⊗B)_n = ∨ (Σ_n)₊ ∧_(Σ_p×Σ_q) (A_p∧B_q)`, construct free spectra `F_n` with their evaluation adjunctions, colimits, the smash over the sphere as a balanced coequalizer, and function spectra.
- **The Kan–Quillen model structure** — build it on simplicial sets and on pointed ones, and prove realization ⊣ Sing is a Quillen equivalence. This closes G2.1, and the level and stable model structures of G2.3 need it.
- **Higher sphere monoids** — define `S^(k)` with levels `(S^k)^∧n` and block actions, reusing the smash-power and Day-monoid machinery now in place.
- **Fibre transport along a supplied path** — the G2.10 construction through the pullback over the path, with both homotopy-inverse endpoint maps, including empty fibres.
- **G1 axiomatic theories** — reduced and unreduced integer-graded theories and their equivalence. These can start now, since they depend only on the pointed CW suppliers and not on the spectral model.

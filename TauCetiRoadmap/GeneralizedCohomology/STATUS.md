<!--tauceti-status:v1 {"roadmap":"GeneralizedCohomology","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"G1.1 theory categories on CW complexes, the G1.2 quotient comparison and reduced/unreduced equivalence, and G1.3-G1.7","state":"partial"},{"id":"Layer 2","remaining":"assembled Kan-Quillen and level/stable model structures, Omega-spectra, the stable category, G2.4, G2.6, G2.8, G2.9","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"HP^n CW structure, quaternionic Grassmannians and bundle classification, G4.0b, and G4.1-G4.6","state":"partial"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"811e46d8a891df590094c74ebc35e8ea5ee7af6f711d54a940955a548576b335","roadmap":"GeneralizedCohomology","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: GeneralizedCohomology

This file documents the status of the GeneralizedCohomology roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The point-set theory of symmetric spectra is nearly complete, and Layer 4 has started with the topology of the compact symplectic groups. The homotopy theory is partial: factorization systems and simplicial enrichment exist, but no model structure has been assembled. There is no stable category and no cohomology theory on CW complexes yet. Layer 3 and Layer 5 have not begun.

### Named results

- **The first-column fibration of the symplectic groups.** Sending a quaternionic unitary matrix to its first column is a locally trivial Serre fibration `Sp(n) → Sp(n+1) → S^(4n+3)` ([`quaternionUnitaryFirstColumn_mem_serreFibrations`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Quaternion/Symplectic/FirstColumn.html#TauCeti.quaternionUnitaryFirstColumn_mem_serreFibrations)). It exhibits the sphere as `Sp(n+1)/Sp(n)`.
- **Homotopy stability for `Sp(n)`.** The block inclusion `Sp(n) → Sp(n+1)` is `(4n+2)`-connected ([`isNConnected_unitaryOneBlockSucc_quaternion`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Quaternion/Symplectic/SimplyConnected.html#TauCeti.isNConnected_unitaryOneBlockSucc_quaternion)). It follows that every `Sp(n)` is simply connected and in fact 2-connected.
- **Anodyne extensions are Kan–Quillen trivial cofibrations.** With weak equivalences defined through geometric realization, every anodyne extension is a weak equivalence ([`anodyneExtensions_le_trivialCofibrations`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/WeakHomotopyEquivalence/Realization.html#SSet.modelCategoryQuillen.anodyneExtensions_le_trivialCofibrations)), and so is every trivial fibration.
- **Projective cofibrations of symmetric spectra are free-cell complexes.** They are exactly the retracts of relative cell complexes built from free spectra on boundary inclusions ([`projectiveCofibrations_eq_retracts_transfiniteCompositions`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/LevelFactorization.html#TauCeti.SymmetricSpectrum.projectiveCofibrations_eq_retracts_transfiniteCompositions)).
- **The homotopy fibre of a fibre inclusion is the loop space of the base.** For a Hurewicz fibration, this holds on every component ([`FiberInclusionPathFiber.loopHomotopyEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/HurewiczFibration/FiberInclusion.html#TauCeti.FiberInclusionPathFiber.loopHomotopyEquiv)).

### Notable definitions and infrastructure

- **Symmetric spectra as sphere modules** ([`SymmetricSpectrum`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.html#TauCeti.SymmetricSpectrum)). Modules over a commutative monoid form a closed symmetric monoidal category, so the smash product over the sphere and function spectra come from general theory.
- **Simplicial enrichment of spectra** ([`mappingSpaceBifunctor`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/Tensor.html#TauCeti.SymmetricSpectrum.mappingSpaceBifunctor)). Spectra have tensors, cotensors and mapping spaces, which satisfy the pushout-product and pullback-hom compatibilities with the level factorization systems ([`projectiveCofibrations_levelSmashBifunctor_pushoutObjObjι`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/PullbackHom.html#TauCeti.SymmetricSpectrum.projectiveCofibrations_levelSmashBifunctor_pushoutObjObjι)). This is the simplicial input that the level and stable model structures need.
- **Eilenberg–MacLane spectra** ([`SymmetricSpectrum.eilenbergMacLane`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/EilenbergMacLane.html#TauCeti.SymmetricSpectrum.eilenbergMacLane)). The point-set `HR` and `HM` are the input for G2.7's ordinary theories, but their homotopy groups have not been computed.

### Roadmap coverage

**Layer 1 is partial.** For homology pretheories it has the long exact sequence of a triple, `Hᵢ(X) ≅ H̃ᵢ(X₊)` and the split augmentation. Still missing are G1.1's theory categories on CW complexes, the quotient comparison and the reduced/unreduced equivalence of G1.2, and all of G1.3–G1.7.

**Layer 2 is partial.**
- G2.2 is done except for the model-theoretic transfer theorems for the higher sphere monoids.
- G2.1 has its carrier, factorization systems and weak-equivalence facts, but no assembled Kan–Quillen model category.
- G2.3 has the level factorization systems, stabilization maps and simplicial enrichment, but no model structure and no Ω-spectra.
- G2.10 has transport, relative lifting and the fibre/path-fibre comparison, but not k-ification, the derived-fibre comparison or the long exact sequence.
- G2.5 and G2.7 have only point-set pieces.
- G2.4, G2.6, G2.8 and G2.9 are untouched, and G2.11 is not assessed here.

**Layer 3 is untouched.** Only the nonabelian `lim¹` it consumes exists.

**Layer 4 is partial.** G4.0a has the first-column fibration and simple connectivity of `Sp(r)`, `Sp(1) ≅ S³ ≅ SU(2)`, and the transitive action of `Sp(n+1)` on `HPⁿ`. The rest of G4.0 and all of G4.1–G4.6 are untouched.

**Layer 5 is untouched.**

## The frontier

- **The Kan–Quillen model structure.** The remaining axiom is that a monomorphism which is a weak equivalence is anodyne. After it come the pointed version and the realization ⊣ Sing Quillen equivalence.
- **The level projective model structure on spectra.** The factorizations and the simplicial compatibilities are in place. What remains is to show that the projective cofibrations which are level equivalences are exactly the maps lifting against level fibrations. This needs Kan–Quillen.
- **Ω-spectra and the stable model structure.** Define Ω-spectra by weak-equivalence adjoint structure maps, then localize to the stable projective structure.
- **The rest of G4.0a.** Remaining are the CW structure on `HPⁿ` with Hopf attaching maps, quaternionic Grassmannians and the classification of quaternionic bundles, and the Spin homomorphism by covering lifting, now that `Sp(r)` is simply connected. Bundle classification needs G2.9's join classifier.
- **G1 axiomatic theories on CW complexes.** Remaining are integer-graded reduced and unreduced theories with the wedge axiom, and their equivalence. The pretheory-level G1.2 comparisons are ready to be reused. None of this needs the spectral model.

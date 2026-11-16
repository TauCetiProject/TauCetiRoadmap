<!--tauceti-status:v1 {"roadmap":"GeneralizedCohomology","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
# Status: GeneralizedCohomology

This file documents the status of the GeneralizedCohomology roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The point-set theory of symmetric spectra is nearly complete, including free spectra, colimits, the smash over the sphere, function spectra and Eilenberg–MacLane spectra. The topological fibration layer is well advanced. Homotopy theory has only started: factorization systems exist for simplicial sets and for spectra, but no model structure is assembled, and there is no stable category or cohomology theory yet. G3 has only an algebraic `lim¹` input, and G4 and G5 have not begun.

### Named results

- **The wedge formula for Day convolution** — level `n` of the Day convolution of two symmetric sequences is the coproduct, over subsets `S` of `Fin n`, of `F(#S) ∧ G(#Sᶜ)`, included by shuffles ([`DayFunctor.isColimitShuffleCofan`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/FiniteBijection/Shuffle.html#CategoryTheory.MonoidalCategory.DayFunctor.isColimitShuffleCofan)).
- **Anodyne extensions are Kan–Quillen trivial cofibrations** — with weak equivalences defined through geometric realization, every anodyne extension is a weak equivalence ([`anodyneExtensions_le_trivialCofibrations`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/WeakHomotopyEquivalence/Realization.html#SSet.modelCategoryQuillen.anodyneExtensions_le_trivialCofibrations)), and so is every trivial fibration ([`weakEquivalence_of_rlp_monomorphisms`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/PrismRealization.html#SSet.modelCategoryQuillen.weakEquivalence_of_rlp_monomorphisms)).
- **Projective cofibrations of symmetric spectra are free-cell complexes** — they are exactly the retracts of relative cell complexes built from free spectra on boundary inclusions, and they pair with level trivial fibrations in a weak factorization system ([`projectiveCofibrations_eq_retracts_transfiniteCompositions`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/LevelFactorization.html#TauCeti.SymmetricSpectrum.projectiveCofibrations_eq_retracts_transfiniteCompositions)).
- **The homotopy fibre of a fibre inclusion is the loop space of the base** — for a Hurewicz fibration, paths in the total space from the fibre to a chosen point are homotopy equivalent to loops in the base, on every component ([`FiberInclusionPathFiber.loopHomotopyEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/HurewiczFibration/FiberInclusion.html#TauCeti.FiberInclusionPathFiber.loopHomotopyEquiv)).
- **Relative homotopy lifting for NDR pairs** — a Hurewicz fibration lifts homotopies relative to the subspace of an NDR pair ([`IsHurewiczFibration.exists_lift_of_ndrPair`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/HurewiczFibration/RelativeLifting.html#TauCeti.IsHurewiczFibration.exists_lift_of_ndrPair)).

### Notable definitions and infrastructure

- **Symmetric spectra as sphere modules** ([`SymmetricSpectrum`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.html#TauCeti.SymmetricSpectrum)). Modules over a commutative monoid form a [symmetric monoidal](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Mod/Symmetric.html#CategoryTheory.Mod.symmetricCategory), [closed](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Mod/Closed.html#CategoryTheory.Mod.monoidalClosed) category under the balanced tensor product, so the smash over the sphere and function spectra come from general theory.
- **Eilenberg–MacLane spectra** ([`SymmetricSpectrum.eilenbergMacLane`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Spectra/EilenbergMacLane.html#TauCeti.SymmetricSpectrum.eilenbergMacLane)). `HR` is the commutative monoid `n ↦ R~[Sⁿ]` of reduced free modules on spheres, and each `R`-module `M` gives an `HR`-module `HM`. This is the point-set input for G2.7's ordinary theories; its homotopy groups are not yet computed.
- **The nonabelian `lim¹`** ([`GroupTower.limOne`](https://taucetiproject.org/docs/TauCeti/Algebra/Group/Tower.html#TauCeti.GroupTower.limOne)) is the orbit set of the twisted action on a product of groups. For towers of modules it [agrees with the cokernel of `1 − shift`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Tower/GroupTower.html#TauCeti.ModuleTower.groupTowerLimOneEquiv), which is what G3.10's unstable Milnor sequence needs.

### Roadmap coverage

G2.2 is done except for the model, positive-flat and commutative transfer theorems for the higher sphere monoids `S^(k)`, which wait on G2.3. The sphere monoids themselves, with symmetric spectra as `S^(1)`-modules, are defined. G2.1 is partial. The pointed closed symmetric monoidal carrier, its simplicial enrichment, Kan–Quillen weak equivalences with two-out-of-three, both factorization systems, and the facts that anodyne extensions and trivial fibrations are weak equivalences are done. Still missing are the assembled model category, the pointed model structure, the realization ⊣ Sing Quillen equivalence and the realization–product comparison. G2.10 is partial. Fibre transport along a supplied path, the fibre versus mapping-path fibre comparison, NDR relative lifting and bundle cores from group cocycles are now in place. Still missing are k-ification, the derived-fibre and long exact sequence comparisons, and Hurewicz lifting for numerable bundles. G2.3 is partial: it has level factorization systems and stabilization maps, but no level or stable model structure and no Ω-spectra with weak-equivalence adjoints. G2.5 has only the level formula `(Σ∞K)_n ≅ Sⁿ ∧ K`, and G2.7 has only the point-set `HR` and `HM`. G1 has only the long exact sequence of a triple for homology pretheories, and G3 has only the nonabelian `lim¹`. G2.4, G2.6, G2.8, G2.9, G4 and G5 are untouched.

## The frontier

- **Assembling the Kan–Quillen model structure** — the remaining axiom is that a monomorphism which is a weak equivalence is anodyne, after which come the pointed version and the realization ⊣ Sing Quillen equivalence.
- **The level projective model structure on spectra** — both factorization systems exist; what remains is identifying the maps lifting against level fibrations with the projective cofibrations that are level equivalences. This needs the Kan–Quillen structure.
- **Ω-spectra and stable equivalences** — define Ω-spectra by weak-equivalence adjoint structure maps (only the strict-isomorphism criterion exists now) and the stable projective model structure.
- **Finishing G2.10** — k-ification of the raw carriers, comparison with the derived homotopy fibre, the long exact sequence, and Hurewicz lifting for numerable bundles.
- **G1 axiomatic theories** — integer-graded reduced and unreduced cohomology theories on CW spaces and their equivalence, which need nothing from the spectral model.

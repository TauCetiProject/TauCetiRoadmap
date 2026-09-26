<!--tauceti-status:v1 {"roadmap":"ClassFieldTheory","to_sha":"de52a34770e6b94396f1feed7c1d5a562572096f","ts":"2026-09-26T11:19:17Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Tate cup product, generic cup-product criterion, and Tate–Nakayama generalization","state":"partial"},{"id":"Layer 1","remaining":"Tate restriction tower law","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","remaining":"local coefficients, Brauer group, invariant map, and duality","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"},{"id":"Layer 14","state":"untouched"}],"readme_sha":"c7539775413fe42c462cefef2ffea4385853c0629cefd2a16dbfafa76084a134","roadmap":"ClassFieldTheory","to_sha":"de52a34770e6b94396f1feed7c1d5a562572096f"}-->
# Status: ClassFieldTheory

This file documents the status of the ClassFieldTheory roadmap up until `de52a34` (2026-09-26T11:19:17Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Class formations and their fundamental classes are proved, completing Layer 2. The cohomology supplier, finite-layer machinery, and Layer 5 Galois dictionary are partial; Tate's theorem, the abstract Artin map, and the local and global arithmetic theorems have not begun.

### Named results

- **The degree formula for the second cohomology of a class formation** — [`ClassFormation.natCard_H2`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ClassFormation.html#TauCeti.ClassFieldTheory.ClassFormation.natCard_H2) gives the order of this cyclic group as the layer degree, with the fundamental class as generator.
- **The scaling laws for the fundamental class** — [`fundamentalClass_restrict`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ClassFormation.html#TauCeti.ClassFieldTheory.ClassFormation.fundamentalClass_restrict), [`fundamentalClass_cor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ClassFormation.html#TauCeti.ClassFieldTheory.ClassFormation.fundamentalClass_cor), and [`fundamentalClass_infl`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ClassFormation.html#TauCeti.ClassFieldTheory.ClassFormation.fundamentalClass_infl) establish its restriction and the relative-degree factors under corestriction and inflation.
- **Two-periodicity of cyclic Tate cohomology** — [`Rep.FiniteCyclicGroup.periodicIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.html#Rep.FiniteCyclicGroup.periodicIso) identifies degrees congruent modulo two.
- **Sylow reduction of cohomological vanishing** — [`groupCohomology.isZero_of_isZero_sylow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/GroupCohomology/Sylow.html#TauCeti.groupCohomology.isZero_of_isZero_sylow) reduces vanishing to one Sylow subgroup for each prime.

### Notable definitions and infrastructure

- **Class formations** — [`ClassFormation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ClassFormation.html#TauCeti.ClassFieldTheory.ClassFormation) takes the invariant as data and derives the [fundamental class](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ClassFormation.html#TauCeti.ClassFieldTheory.ClassFormation.fundamentalClass); its separate subgroup-layer theorems supply the three hypotheses needed for Tate's theorem.
- **Finite normal layers** — [`NormalLayer`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/Basic.html#TauCeti.ClassFieldTheory.NormalLayer) supplies norm quotients and cohomological maps, giving the eventual Artin map its source and its compatibility squares.
- **Class fields** — [`classField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/ClassField.html#TauCeti.ClassFieldTheory.classField) fixes the field attached to an open normal subgroup, a common target for local and global existence.

### Roadmap coverage

Layer 2 is done. Layer 0 is partial: the Tate cup product, generic cup-product criterion, and Tate–Nakayama generalization remain. Layer 1 is partial because the Tate restriction tower law is not established in the supplied history. Layer 5 is partial only in its Galois dictionary; its local coefficient, Brauer, invariant, and duality results are still absent. Layers 3–4 and 6–14 are untouched, including Tate's theorem, reciprocity, existence, Weil groups, norm theorems, and Hilbert reciprocity.

## The frontier

- **Tate cup product** — construct it in all integer bidegrees with the naturality and projection formula needed by the generic criterion.
- **Tate's cup-product criterion** — prove the generic theorem from its three explicit hypotheses; the cup product is its missing prerequisite.
- **The class-formation Tate isomorphism** — apply that criterion to the fundamental class and the three existing subgroup-layer theorems, then prove its compatibility with restriction, corestriction, conjugation, and scaled inflation.
- **Abstract Artin map** — derive the norm-quotient equivalence from the Tate isomorphism and prove its norm kernel, character formula, and functoriality.
- **Local Brauer invariant** — build the local coefficient and Brauer machinery and its invariant map; this Layer 5 work can proceed alongside the abstract Artin map.

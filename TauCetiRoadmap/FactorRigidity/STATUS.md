<!--tauceti-status:v1 {"roadmap":"FactorRigidity","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"joint representations, the correspondence of a normal CP map, and weak containment of correspondences","state":"untouched"},{"id":"Layer 2","remaining":"the general tracial basic construction, relative amenability and the localization lemma","state":"untouched"},{"id":"Layer 3","remaining":"quantitative and positive-definite forms of 3.1, the pairs (Z2 x G, Z2), tracial relative property (T), spectral gap of actions and fullness","state":"partial"},{"id":"Layer 4","remaining":"positive-definite and conditionally negative-definite functions on groups, Schoenberg, the Haagerup property of free groups","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"a430a808057d4c59a901510136ae3675e7887ffe51c70bc9d08ad2f9d6d908fe","roadmap":"FactorRigidity","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: FactorRigidity

This file documents the status of the FactorRigidity roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the opening of Layer 3 has begun: relative property (T) for subgroups of discrete groups is defined and characterized by Kazhdan pairs, and spectral gap of a single representation is in place. None of the five end theorems has landed, and the other nine layers are untouched.

### Named results

**The Kazhdan pair characterization** — a subgroup has relative property (T) exactly when one finite set F and one δ > 0 force a nonzero invariant vector in every unitary representation with an (F, δ)-invariant unit vector ([`Subgroup.relativePropertyT_iff_exists_isKazhdanPair`](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT/KazhdanPair.html#Subgroup.relativePropertyT_iff_exists_isKazhdanPair)); it is stated for representations in a universe containing both the group and the representation spaces.

**Property (T) of finite groups** — every finite group has property (T), by averaging a nearly invariant unit vector ([`Subgroup.relativePropertyT_top_of_finite`](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT.html#Subgroup.relativePropertyT_top_of_finite)); more generally every finite subgroup of any group has relative property (T), and for a finite group (Γ, 1) is an explicit Kazhdan pair ([`Subgroup.isKazhdanPair_top_univ_one`](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT/KazhdanPair.html#Subgroup.isKazhdanPair_top_univ_one)).

### Notable definitions and infrastructure

- **Relative property (T)** ([`Subgroup.RelativePropertyT`](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT.html#Subgroup.RelativePropertyT)), built on [almost invariant vectors](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Continuous/AlmostInvariant.html#ContRepresentation.HasAlmostInvariantVectors) for Mathlib's continuous representations. It matches the roadmap's 3.1 definition and passes to smaller subgroups and to homomorphic images, which is the carrier both Layer 3 end theorems are stated on.
- **The Hilbert direct sum of unitary representations** ([`ContRepresentation.hilbertSum`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Continuous/Unitary/HilbertSum.html#ContRepresentation.hilbertSum)), acting coordinatewise on ℓ², with invariant vectors computed coordinate by coordinate. It is what turns a family of counterexamples into one, and it will be needed again for weak containment and spectral gap arguments.
- **Spectral gap of a representation**, with its equivalence to the absence of almost invariant vectors on the orthogonal complement of the invariants (Anantharaman–Popa, Corollary 15.1.4), is present for unitary representations; spectral gap of actions, Bernoulli shifts and fullness are not.

### Roadmap coverage

Layer 3 is partial. In 3.1 the definitions, the Kazhdan pair characterization, the checks for the trivial subgroup and finite groups, and monotonicity and images are done. The quantitative ε-close form, the positive-definite-function criterion, finite-index transfer and the `slTwoAction` convention are missing. Nothing for 3.2 (the pairs (ℤ²⋊G, ℤ²)) or 3.3 (tracial inclusions) exists. 3.4 has only representation-level spectral gap. Layers 1–2 (correspondence coefficients, weak containment, the general basic construction, relative amenability) and Layers 4–10 (Haagerup approximation, intertwining by bimodules, Cartan pairs, cost, deformations, Bernoulli strong rigidity, solidity) have nothing landed. Several of these, Layers 7, 9 and 10 in particular, also wait on group von Neumann algebras, crossed products and amplifications from supplier roadmaps.

## The frontier

- **Completing §3.1** — the quantitative Kazhdan-pair form (a nearby invariant vector, not just a nonzero one), the criterion by positive-definite functions converging uniformly on Λ, and finite-index transfer. The positive-definite criterion needs group positive-definite functions in the roadmap's convention `φ(gᵢ⁻¹gⱼ)`, which Layer 4.1 also needs.
- **The SL₂(ℤ) action and the semidirect product pair** — define `slTwoAction` on the multiplicative copy of ℤ² with the column-vector check, so that the Layer 3 targets in Suggested.lean can be stated against library definitions.
- **Relative property (T) of (ℤ²⋊SL₂(ℤ), ℤ²) and Burger's generalization** — needs the projection-valued spectral measure of the restriction to ℤ² on the dual torus, its pushforward to the projective line, and its G-equivariance, together with nonamenability of F₂ from AmenableGroups.
- **The Haagerup property of free groups** — the other statable end theorem. Layer 4.1's conditionally negative-definite functions, Schoenberg's theorem and the word-length construction have not begun.
- **Correspondences and weak containment (Layer 1)** — the entry point for everything tracial. It is blocked on Subfactors §S1's normal correspondences and fusion and on CStarAlgebras' tensor norms.

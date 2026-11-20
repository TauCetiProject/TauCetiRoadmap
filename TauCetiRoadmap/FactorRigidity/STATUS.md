<!--tauceti-status:v1 {"roadmap":"FactorRigidity","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"joint representations, the correspondence of a normal CP map, and weak containment of correspondences","state":"untouched"},{"id":"Layer 2","remaining":"the general tracial basic construction, relative amenability and the localization lemma","state":"untouched"},{"id":"Layer 3","remaining":"quantitative and positive-definite forms of 3.1, finite-index transfer, tracial relative property (T), spectral gap of actions and fullness","state":"partial"},{"id":"Layer 4","remaining":"Haagerup permanence for finite-index overgroups and countable unions; Haagerup approximation of tracial algebras and its relative version","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"5e04d53c625040bbcf9ab2b44c94e51f134652705ed421ff24113d8313246435","roadmap":"FactorRigidity","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: FactorRigidity

This file documents the status of the FactorRigidity roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Both of the roadmap's group-theoretic end theorems are proved: relative property (T) for (ℤ²⋊G, ℤ²) with G ≤ SL₂(ℤ) nonamenable, and Haagerup's theorem for free groups. Layers 3 and 4 are partial. Their tracial-algebra halves have not begun, and neither have Layers 1–2 and 5–10, where the three II₁-factor end theorems sit.

### Named results

**Burger's theorem** — for a subgroup G ≤ SL₂(ℤ), the pair (ℤ²⋊G, ℤ²) has relative property (T) exactly when G is not amenable ([`relativePropertyT_inl_iff_not_amenable`](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT/SpecialLinear.html#TauCeti.relativePropertyT_inl_iff_not_amenable)). It is stated with the AmenableGroups notion `Amenable` rather than the README's `IsAmenableDiscrete`.

**The Kazhdan–Margulis theorem** — (ℤ²⋊SL₂(ℤ), ℤ²) has relative property (T) ([`relativePropertyT_inl_slTwo`](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT/SpecialLinear.html#TauCeti.relativePropertyT_inl_slTwo)). It is the case G = SL₂(ℤ), using [nonamenability of SL₂(ℤ)](https://taucetiproject.org/docs/TauCeti/GroupTheory/PropertyT/SpecialLinear.html#TauCeti.not_amenable_slTwoZ).

**Haagerup's theorem** — the free group on any countable set of generators has the Haagerup property ([`hasHaagerupProperty_freeGroup`](https://taucetiproject.org/docs/TauCeti/GroupTheory/HaagerupProperty/FreeGroup.html#TauCeti.hasHaagerupProperty_freeGroup)). The key step is [Haagerup's lemma](https://taucetiproject.org/docs/TauCeti/GroupTheory/FreeGroup/GeodesicEdges.html#FreeGroup.posSemidef_pow_norm_inv_mul), proved from geodesic edge sets in the Cayley tree.

**Schoenberg's theorem** — a kernel ψ is conditionally negative semidefinite iff exp(−tψ) is positive semidefinite for every t > 0 ([`condNegSemidef_iff_forall_posSemidef_cexp_neg_mul`](https://taucetiproject.org/docs/TauCeti/Analysis/PositiveDefinite/Kernel/Schoenberg.html#Matrix.condNegSemidef_iff_forall_posSemidef_cexp_neg_mul)).

**Rigidity excludes Haagerup** — in a group with the Haagerup property, every subgroup with relative property (T) is finite ([`HasHaagerupProperty.finite_of_relativePropertyT`](https://taucetiproject.org/docs/TauCeti/GroupTheory/HaagerupProperty/PropertyT.html#TauCeti.HasHaagerupProperty.finite_of_relativePropertyT)). So ℤ²⋊SL₂(ℤ) and infinite property (T) groups are not Haagerup. This is the group-level shadow of the roadmap's intertwining theorem.

### Notable definitions and infrastructure

- **The spectral measure of a unitary representation of a discrete abelian group** ([`ContRepresentation.spectralPVM`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Continuous/Unitary/SpectralMeasure.html#ContRepresentation.spectralPVM)) is a projection-valued measure on the Pontryagin dual. It comes with uniqueness, its commutant, the trivial-character projection onto the invariant vectors, and naturality and equivariance under restriction and in semidirect products. It is the engine of Burger's theorem.
- **The GNS construction for positive-definite functions on groups** ([`gnsRepresentation`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Continuous/Unitary/PositiveDefinite.html#Matrix.PosSemidef.gnsRepresentation)) identifies positive-definite functions with the coefficients of unitary representations ([`posSemidef_inv_mul_iff_exists_isUnitary`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Continuous/Unitary/PositiveDefinite.html#TauCeti.posSemidef_inv_mul_iff_exists_isUnitary)). It is what lets Haagerup approximations be tested against relative (T).
- **The Haagerup property** ([`HasHaagerupProperty`](https://taucetiproject.org/docs/TauCeti/GroupTheory/HaagerupProperty/Basic.html#TauCeti.HasHaagerupProperty)), in the README's net form. It holds for finite and [amenable](https://taucetiproject.org/docs/TauCeti/GroupTheory/HaagerupProperty/Amenable.html#TauCeti.hasHaagerupProperty_of_amenable) groups and passes to subgroups.

### Roadmap coverage

Layer 3 is partial. §3.2 is done: both theorems, plus the amenable unipotent non-example. In §3.1 the definitions, the Kazhdan-pair characterization, `slTwoAction`, permanence under subgroups and images, and the checks for finite groups and ℤ are done. The quantitative ε-close form, the positive-definite-function criterion and finite-index transfer are still missing. §3.3 (tracial inclusions) has nothing, and §3.4 has only representation-level spectral gap. Layer 4 is partial. §4.1 is nearly complete, but finite-index overgroups and increasing countable unions are not yet proved for the Haagerup property, though induction of positive-definite functions from finite-index subgroups is in place. §§4.2–4.3 (tracial and relative Haagerup approximation) are untouched. Layers 1, 2 and 5–10 have nothing landed. Most also wait on supplier roadmaps: Subfactors, VonNeumannAlgebras, CStarAlgebras and FreeProbability.

## The frontier

- **Finishing §4.1** — Haagerup permanence for finite-index overgroups, which needs only assembly from the existing induced-function lemmas, and for increasing countable unions.
- **Finishing §3.1** — the quantitative Kazhdan-pair form (an invariant vector ε-close to the given one), the criterion by positive-definite functions converging uniformly on Λ, and finite-index transfer. The GNS construction now supplies the positive-definite side.
- **Spectral gap of actions (§3.4)** — Koopman representations and spectral gap of Bernoulli actions of nonamenable groups. These need VonNeumannAlgebras' Bernoulli shift and the P₂ criterion from OperatorAlgebraDynamics. Fullness also waits on tracial ultrapowers.
- **Correspondences and weak containment (Layer 1)** — the entry point for everything tracial, including §§3.3 and 4.2. It is blocked on Subfactors §S1's normal correspondences and on CStarAlgebras' completely positive maps and tensor norms.
- **Tracial relative (T) and relative Haagerup (§§3.3, 4.3)** — these turn the two group theorems into statements about L(ℤ²⋊F_n), which Layers 5–7 need for F(L(ℤ²⋊F_n)) = {1}. They depend on Layer 1 and on the general basic construction of Layer 2.1.

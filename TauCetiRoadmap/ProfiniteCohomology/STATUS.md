<!--tauceti-status:v1 {"roadmap":"ProfiniteCohomology","to_sha":"d9fbe7bd6aedb5ed0ffb867836c3ed71aa7d28e5","ts":"2026-11-11T09:30:56+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"the R-linear functor instance on continuousCochainsFunctor","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"explicit finite-quotient transitions agree with finiteLevelTransition under the groupCohomology comparisons, degrees 0, 1, 2","state":"partial"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"degree-one square: conjugation followed by explicitCor1 equals explicitCor1","state":"partial"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","remaining":"independence of cd_p and scd_p from the extra coefficient universe (11.2)","state":"partial"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","remaining":"double-coset formula over several double cosets, N(1) = 1, the expansion, and the norm for general discrete commutative G-rings","state":"partial"}],"readme_sha":"2388297e606ab6b8c068628b4abec683f8490ea0c459b52cc89e738508857d80","roadmap":"ProfiniteCohomology","to_sha":"d9fbe7bd6aedb5ed0ffb867836c3ed71aa7d28e5"}-->
# Status: ProfiniteCohomology

This file documents the status of the ProfiniteCohomology roadmap up until `d9fbe7b` (2026-11-11T09:30:56+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0, 2, 3, 5, 7, 8, 9, 10 and 12 are done, so the low-degree theory, exact sequences, Shapiro's lemma, the Galois interface, the all-degree toolkit and the graded cup product are all in place. The revised README reopens one stated target in each of Layers 1, 4, 6 and 11. In Layer 13 the `𝔽₂` Evens norm is built and is transitive and multiplicative on classes. Norms with general ring coefficients, the full double-coset formula, the normalization and the expansion have not been done.

### Named results

- **Hilbert 90 and the Kummer isomorphism**: continuous `H¹(G_K, (Kˢ)ˣ)` vanishes, so `Kˣ/(Kˣ)ⁿ ≅ H¹(G_K, μₙ)` for `n` invertible in `K` ([`TauCeti.hilbert90`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/Hilbert90.html#TauCeti.hilbert90), [`TauCeti.kummerIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/Kummer.html#TauCeti.kummerIso)).
- **The strict-dimension criterion**: NSW (3.3.4), `scd_p G ≤ n` exactly when `cd_p G ≤ n` and the `p`-primary part of `H^{n+1}(U, ℤ)` vanishes for every open `U` ([`strictCohomologicalDimensionLE_iff_forall_openSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/IntegralCriterion.html#TauCeti.strictCohomologicalDimensionLE_iff_forall_openSubgroup)).
- **The cohomology of `ℤ̂`**: `cd_p ℤ̂ = 1` for every prime `p` ([`zHat.cohomologicalDimensionAt_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/CohomologicalDimension.html#TauCeti.zHat.cohomologicalDimensionAt_eq_one)), and `H²(ℤ̂, ℤ) ≅ ℚ/ℤ` ([`zHat.h2EquivRatCircle`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/IntegralCohomology.html#TauCeti.zHat.h2EquivRatCircle)).
- **The index-two exact sequence in all degrees**: for `U` of index two, `χ_U ⌣ x = 0` exactly when `x` is a corestriction from `U` ([`exact_cor_cup_of_index_two`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/IndexTwo/CupExact.html#OpenSubgroup.exact_cor_cup_of_index_two)).
- **Transitivity of the Evens norm**: for compact open `V ≤ U` of finite index in `G`, `N_V^G = N_U^G ∘ N_V^U` on `𝔽₂`-cohomology classes, up to transport of degrees ([`evensNorm_trans`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Norm/Transitivity.html#OpenSubgroup.evensNorm_trans)).

### Notable definitions and infrastructure

- **Dimension shifting** ([`dimensionShiftIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/DimensionShifting/Basic.html#TauCeti.ContCohomology.dimensionShiftIso)), `Hⁱ⁺¹(G, M) ≅ Hⁱ(G, Coind_1^G M ⧸ M)`. Together with Shapiro's lemma in every degree, it drives the cohomological-dimension arguments.
- **The Evens norm** ([`evensNorm`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Norm/Basic.html#OpenSubgroup.evensNorm)), the function `Hⁿ(U, 𝔽₂) → H^{l n}(G, 𝔽₂)` for `U` open of index `l`. It sends a class to the class of the diagonal tensor of a representing cocycle. At index two it [is the explicit index-two norm](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Norm/IndexTwo.html#OpenSubgroup.evensNormIndexTwo_eq), which makes the graph cocycle a standard construction.
- **The index-two Evens norm** ([`evensNormIndexTwo`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/IndexTwoNorm.html#TauCeti.ContCohomology.evensNormIndexTwo)), `H¹(U, 𝔽₂) → H²(G, 𝔽₂)`, the pullback of the `D₁₆` extension class. This is the half of Layer 13 that the Quadratic Form Invariants roadmap consumes.

### Roadmap coverage

Layers 0, 2, 3, 5, 7, 8, 9, 10 and 12 are done. Layer 0 was completed when [finite products of smooth discrete representations](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Products.html#TauCeti.IsSmoothDiscrete.pi) landed. The README still lists Layer 10's agreement with the Layer 4 systems in degrees `0, 1, 2` as a target, but the source has it, as natural isomorphisms `explicitFiniteQuotientSystem0/1/2IsoContinuous`. Layers 1, 4, 6 and 11 are each done except for one target that the revised README adds and the source lacks:

- Layer 1: the `R`-linear functor instance on the cochain functor.
- Layer 4: agreement of the explicit transitions with `finiteLevelTransition` under the comparisons with `groupCohomology`.
- Layer 6: the degree-one square of conjugation against corestriction.
- Layer 11: independence of `cd_p` and `scd_p` from the extra coefficient universe.

Layer 13 is partial. Its index-two half is done. Of the general construction at `A = 𝔽₂`, the following are proved on classes: the cocycle-level norm, independence of choices, the public function, agreement with the index-two form, `N_G^G = id`, naturality, transitivity and multiplicativity (`evensNorm_cup`). The double-coset formula is proved only for a single double coset. Nothing beyond `𝔽₂` coefficients has been built.

## The frontier

- **The double-coset formula over several double cosets**: express the restriction of `N_U^G x` to `K` as a cup product of norms over `K \ G / U`. The [Mackey comparison of tensor-induced resolutions](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Tensor/Induction/DoubleCoset/Complex.html#TauCeti.smoothTensorInducedMackeyResolutionIso) is now in place, and only the [single-double-coset case](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Norm/Restriction.html#OpenSubgroup.trivialF2Map_evensNorm_of_surjective) is stated.
- **Normalization and expansion at `𝔽₂`**: prove `N_U^G 1 = 1`, then that the norm of `1 + χ` expands as `∑ Nᵢ(χ)` with `N₁ = cor` and `N_l = N_U^G`.
- **One-item closures in Layers 1, 4 and 6**: each is short. The cochain functor's `R`-linear instance needs only `cochainsMap_smul` at `φ = id`. The degree-one conjugation square follows from a transversal change and `explicitCor1_eq_transversal`. The transitions in Layer 4 need to be matched with `finiteLevelTransition`.
- **Universe independence of `cd_p`**: build the chain isomorphism between the homogeneous cochain complexes at the two universe parameters, as Layer 11 describes, and conclude that both invariants are equal.
- **The norm for a discrete commutative `G`-ring**: milestones 2 to 7 in general, starting from the tensor-induced ring and its multiplication. Multiplying tensor factors [as an algebra map](https://taucetiproject.org/docs/TauCeti/RingTheory/PiTensorProduct/FiberwiseMul.html#PiTensorProduct.mulAlgHom) is available. The equivariant `G`-ring structure is not.

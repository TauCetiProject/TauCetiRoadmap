<!--tauceti-status:v1 {"roadmap":"ProfiniteCohomology","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7","ts":"2026-11-08T16:58:25+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"closure of discrete modules under finite products is not stated; subgroups, quotients and the internal hom are","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","remaining":"general Evens norm: transitivity on classes and the double-coset formula with several double cosets","state":"partial"}],"readme_sha":"3de01748da26fab0677e41a100e8f9b36bdd6a6f5a46728c061f1e524341c941","roadmap":"ProfiniteCohomology","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7"}-->
# Status: ProfiniteCohomology

This file documents the status of the ProfiniteCohomology roadmap up until `a4fcb57` (2026-11-08T16:58:25+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 to 12 are done: the low-degree theory and its worked examples, the comparisons, exact sequences, change of groups, Shapiro's lemma, the Galois interface, the all-degree toolkit, cohomological dimension and the graded cup product. Layer 0 lacks one closure statement. In Layer 13 the general Evens norm now exists on classes and agrees with the index-two norm. Transitivity on classes and the general double-coset formula are still open.

### Named results

- **Hilbert 90 and the Kummer isomorphism** — continuous `H¹(G_K, (Kˢ)ˣ)` vanishes, so `Kˣ/(Kˣ)ⁿ ≅ H¹(G_K, μₙ)` for `n` invertible in `K` ([`TauCeti.hilbert90`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/Hilbert90.html#TauCeti.hilbert90), [`TauCeti.kummerIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/Kummer.html#TauCeti.kummerIso)).
- **The strict-dimension criterion** — NSW (3.3.4): `scd_p G ≤ n` exactly when `cd_p G ≤ n` and the `p`-primary part of `H^{n+1}(U, ℤ)` vanishes for every open `U` ([`strictCohomologicalDimensionLE_iff_forall_openSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/IntegralCriterion.html#TauCeti.strictCohomologicalDimensionLE_iff_forall_openSubgroup)).
- **The cohomology of `ℤ̂`** — `cd_p ℤ̂ = 1` for every prime `p` ([`zHat.cohomologicalDimensionAt_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/CohomologicalDimension.html#TauCeti.zHat.cohomologicalDimensionAt_eq_one)), and `H²(ℤ̂, ℤ) ≅ ℚ/ℤ` ([`zHat.h2EquivRatCircle`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/IntegralCohomology.html#TauCeti.zHat.h2EquivRatCircle)).
- **The index-two exact sequence in all degrees** — for `U` of index two, `χ_U ⌣ x = 0` exactly when `x` is a corestriction from `U` ([`exact_cor_cup_of_index_two`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/IndexTwo/CupExact.html#OpenSubgroup.exact_cor_cup_of_index_two)).
- **The general Evens norm is the index-two norm** — at index two, the tensor-induced norm on classes equals the explicit graph-class norm, so the ad hoc formula becomes a standard construction ([`evensNormIndexTwo_eq`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Norm/IndexTwo.html#OpenSubgroup.evensNormIndexTwo_eq)). This is milestone 10.

### Notable definitions and infrastructure

- **Dimension shifting** ([`dimensionShiftIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/DimensionShifting/Basic.html#TauCeti.ContCohomology.dimensionShiftIso)), `Hⁱ⁺¹(G, M) ≅ Hⁱ(G, Coind_1^G M ⧸ M)`. Together with Shapiro's lemma in every degree, it drives the cohomological-dimension arguments.
- **The Evens norm** ([`evensNorm`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Norm/Basic.html#OpenSubgroup.evensNorm)), the plain function `Hⁿ(U, 𝔽₂) → H^{l n}(G, 𝔽₂)` for `U` open of index `l`. It sends a class to the class of the diagonal tensor of any representing cocycle, which is well defined because [cohomologous cocycles have the same norm](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Tensor/Induction/Resolution.html#TauCeti.smoothTensorInducedDiagonalClass_eq_of_sub_eq_d).
- **The index-two Evens norm** ([`evensNormIndexTwo`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/IndexTwoNorm.html#TauCeti.ContCohomology.evensNormIndexTwo)), `H¹(U, 𝔽₂) → H²(G, 𝔽₂)`. On classes it is the pullback of the `D₁₆` extension class. This is the half of Layer 13 that the Quadratic Form Invariants roadmap consumes.

### Roadmap coverage

Layers 1 to 12 are done. Layer 0 is done except that no declaration states that discrete modules are closed under finite products; subgroups, quotients and the internal hom are covered. Layer 13 is partial. Its explicit index-two half is done. Of the ten milestones of the general construction:

- Milestones 1 to 7 and 10 are done. That takes in the wreath product, tensor induction, the cocycle-level norm, independence of the representative and of the transversal, the public function `N_U^G`, and agreement with the index-two norm on classes. The index-one and degree-zero edge cases are done too.
- Milestone 8 is partly done. Inflation compatibility, naturality and conjugation invariance are proved on classes. Multiplicativity is proved on cocycles, and the source also states it on classes as `evensNorm_cup`. Transitivity is proved on cocycles only. The double-coset formula is proved only when there is a single double coset.
- Milestone 9 applies only if the norm is built by descent through finite quotients. The norm here is built directly, so the milestone looks moot.

## The frontier

- **Transitivity on classes**: `N_V^G = N_U^G ∘ N_V^U`, up to transport of degrees. It should follow from the [cocycle-level transitivity](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Tensor/Induction/Transitivity/Resolution.html#TauCeti.coeffMap_smoothTensorInducedDiagonalClass_transitivity) together with `evensNorm_cochainClass`.
- **The general restriction and double-coset formula**: the restriction of `N_U^G x` to `H` as a cup product over double cosets `H \ G / U`. Only the [single-double-coset case](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Norm/Restriction.html#OpenSubgroup.trivialF2Map_evensNorm_of_surjective) is stated. The Mackey isomorphism for tensor induction and its compatibility with gradings are available.
- **Finite products of discrete modules**: state the closure that Layer 0 lists. Outside Layer 13, this is the only item not yet established.
- **Milestone 9**: confirm that it is moot for the direct construction, or prove the norm compatible with the finite-quotient norms if the roadmap wants that comparison anyway.

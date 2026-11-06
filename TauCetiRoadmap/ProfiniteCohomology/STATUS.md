<!--tauceti-status:v1 {"roadmap":"ProfiniteCohomology","to_sha":"36f24f5d94ccf25e167520cf4c0f1a028c064fb0","ts":"2026-10-28T00:12:20Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"closure of discrete modules under finite products is not stated; subgroups, quotients and the internal hom are","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","remaining":"general Evens norm: representative independence, the class-level function N, its laws, and agreement with the index-two norm on classes","state":"partial"}],"readme_sha":"d98c3de694ffbb79d03482b37501f56bc8ff1c6d5845afb7c64eef0cc51662ae","roadmap":"ProfiniteCohomology","to_sha":"36f24f5d94ccf25e167520cf4c0f1a028c064fb0"}-->
# Status: ProfiniteCohomology

This file documents the status of the ProfiniteCohomology roadmap up until `36f24f5` (2026-10-28T00:12:20Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 to 12 are done. That covers the low-degree theory and its worked examples, the comparisons, exact sequences, change of groups, Shapiro's lemma, the Galois interface, the all-degree toolkit, cohomological dimension and the graded cup product. Layer 0 lacks one closure statement. In Layer 13 the index-two Evens norm is complete, and the general norm now exists at the level of cocycles, but not yet as a function on cohomology classes.

### Named results

- **Hilbert 90 and the Kummer isomorphism** — continuous `H¹(G_K, (Kˢ)ˣ)` vanishes, so `Kˣ/(Kˣ)ⁿ ≅ H¹(G_K, μₙ)` for `n` invertible in `K` ([`TauCeti.hilbert90`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/Hilbert90.html#TauCeti.hilbert90), [`TauCeti.kummerIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/Kummer.html#TauCeti.kummerIso)).
- **The strict-dimension criterion** — NSW (3.3.4): `scd_p G ≤ n` exactly when `cd_p G ≤ n` and the `p`-primary part of `H^{n+1}(U, ℤ)` vanishes for every open `U` ([`strictCohomologicalDimensionLE_iff_forall_openSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/IntegralCriterion.html#TauCeti.strictCohomologicalDimensionLE_iff_forall_openSubgroup)). The `p`-primary class-module theorem of NSW (3.6.4) is built on the same theory.
- **The cohomology of `ℤ̂`** — `cd_p ℤ̂ = 1` for every prime `p` ([`zHat.cohomologicalDimensionAt_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/CohomologicalDimension.html#TauCeti.zHat.cohomologicalDimensionAt_eq_one)), and `H²(ℤ̂, ℤ) ≅ ℚ/ℤ` ([`zHat.h2EquivRatCircle`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/IntegralCohomology.html#TauCeti.zHat.h2EquivRatCircle)).
- **The index-two exact sequence in all degrees** — for `U` of index two, `χ_U ⌣ x = 0` exactly when `x` is a corestriction from `U` ([`exact_cor_cup_of_index_two`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/IndexTwo/CupExact.html#OpenSubgroup.exact_cor_cup_of_index_two)). For an order-two group, mod-two cohomology is the polynomial algebra on its character ([`cyclicTwoCohomPolynomialEquiv`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/TrivialF2/CyclicTwo.html#TauCeti.cyclicTwoCohomPolynomialEquiv)).
- **The general norm recovers the graph class** — at index two and in degree one, the tensor-induced norm of a character's cocycle is the graph class of the explicit construction ([`smoothTensorInducedDiagonalClass_eq_graphClass`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/TensorInduction.html#TauCeti.ContCohomology.smoothTensorInducedDiagonalClass_eq_graphClass)). This is milestone 10 at the level of cocycles.

### Notable definitions and infrastructure

- **Dimension shifting** ([`dimensionShiftIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/DimensionShifting/Basic.html#TauCeti.ContCohomology.dimensionShiftIso)), `Hⁱ⁺¹(G, M) ≅ Hⁱ(G, Coind_1^G M ⧸ M)`. Together with Shapiro's lemma in every degree, it drives the cohomological-dimension arguments.
- **The index-two Evens norm** ([`evensNormIndexTwo`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/IndexTwoNorm.html#TauCeti.ContCohomology.evensNormIndexTwo)), `H¹(U, 𝔽₂) → H²(G, 𝔽₂)`, the graph class descended to classes. On classes it is the pullback of the `D₁₆` extension class. It is the half of Layer 13 that the Quadratic Form Invariants roadmap consumes.
- **The norm of a cocycle** ([`smoothTensorInducedDiagonalClass`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Tensor/Induction/Resolution.html#TauCeti.smoothTensorInducedDiagonalClass)). The tensor-induced total resolution has an explicit contraction in characteristic two. Through that contraction, the diagonal tensor of an invariant degree-`n` cocycle gives a class in degree `l n`. With trivial `𝔽₂` coefficients the class [does not depend on the transversal](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Tensor/Induction/ChangeTransversal/Resolution.html#TauCeti.smoothTensorInducedDiagonalClass_trivialF2_changeTransversal).

### Roadmap coverage

Layers 1 to 12 are done. Layer 0 is done except that no declaration states that discrete modules are closed under finite products; subgroups, quotients and the internal hom are covered. Layer 13 is partial. Its explicit index-two half is done, including both `C₄` checks. The general construction has ten milestones:

- Milestones 1 to 3 are done: the wreath product, the monomial homomorphism and tensor induction.
- Milestone 4, the cocycle-level norm with degree `q ↦ l q`, is done.
- Milestone 5 is half done. Cocycles are known to map to cocycles, but no statement yet says that cohomologous cocycles have the same norm.
- Milestone 6, transversal independence, is done for trivial `𝔽₂` coefficients.
- Milestone 10 is proved at the level of cocycles only.
- Milestones 7 to 9 are not started.

## The frontier

- **The norm is independent of the representative**: show that cohomologous invariant cocycles have the same norm, which completes milestone 5. The coboundary-shift endomorphisms ([`exists_gradedResolutionTopRep_hom_apply_eq_add`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Resolution/CoboundaryShift.html#TopRep.exists_gradedResolutionTopRep_hom_apply_eq_add)) and the fact that chain maps over the identity preserve classes are the tools for this.
- **The public norm `N_U^G : H^q(U, 𝔽₂) → H^{l q}(G, 𝔽₂)`**: descend the cocycle-level norm to cohomology classes as a plain function (milestone 7). It needs the item above.
- **Agreement with the index-two norm on classes**: `evensNormIndexTwo_eq`, the class-level form of the cocycle identity that already exists. It should follow from the cocycle identity once the public norm is defined.
- **The laws of the norm**: multiplicativity, transitivity, the restriction and double-coset formula, and compatibility with inflation (milestone 8). The transitivity and Mackey isomorphisms for tensor induction are already available.
- **Finite products of discrete modules**: state the closure that Layer 0 lists. It is the only item outside Layer 13 that has not been established.

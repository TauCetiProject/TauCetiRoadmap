<!--tauceti-status:v1 {"roadmap":"ComputabilityTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","remaining":"uniform index maps for union, intersection, image and projection; serialization of pairs and tagged unions; stage comparison maps","state":"partial"},{"id":"L2","remaining":"complement invariance, invariance under computable bijections, and a noncomputable subset of a computable set","state":"partial"},{"id":"L3","remaining":"normal forms and normal-form codes; Post's theorem and hierarchy strictness at every level","state":"partial"},{"id":"L4","remaining":"the Delta-0-2 form of the Limit Lemma, which waits on Post's theorem","state":"partial"},{"id":"L5","remaining":"the Kleene-Post construction of incomparable sets below the halting set","state":"partial"},{"id":"L6","state":"done"},{"id":"L7","state":"done"},{"id":"L8","state":"done"},{"id":"L9","state":"done"}],"readme_sha":"c6bba16fee1cf4824e0aa4b96f3bfebeec2ab5328e2aad174ae44eb922f6327e","roadmap":"ComputabilityTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ComputabilityTheory

This file documents the status of the ComputabilityTheory roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All three priority constructions of Soare's Chapter VII are proved. These are the low simple set (L7), the Friedberg–Muchnik construction (L8), and Sacks's cone avoidance and splitting with low halves, with their degree corollaries (L9). The foundations under them are complete or nearly so. What is still missing: Post's theorem above level one, the Kleene–Post construction, and some uniform index maps and invariance lemmas in L1 and L2.

### Named results

- **Sacks's splitting theorem with low halves** — every c.e. set is the [disjoint union of two low c.e. sets](https://taucetiproject.org/docs/TauCeti/Computability/SacksSplitting/Low.html#TauCeti.SacksSplitting.exists_split_low_not_turingReducible), neither of which computes a prescribed noncomputable c.e. set. No infinitude hypothesis is placed on the set being split.
- **No minimal c.e. degree** — below every nonzero c.e. degree there is [a low c.e. degree strictly between it and 0](https://taucetiproject.org/docs/TauCeti/Computability/SacksSplitting/Degree.html#TauCeti.exists_low_degree_mem_Ioo). The same splitting gives [incomparable low halves](https://taucetiproject.org/docs/TauCeti/Computability/SacksSplitting/Degree.html#TauCeti.exists_split_low_incomparable) of any noncomputable c.e. set, and [two low halves of the halting set whose join is not low](https://taucetiproject.org/docs/TauCeti/Computability/SacksSplitting/Degree.html#TauCeti.exists_low_join_not_low).
- **The Friedberg–Muchnik theorem** — two c.e. sets, neither Turing reducible to the other, built by the [original witness-and-restraint construction](https://taucetiproject.org/docs/TauCeti/Computability/FriedbergMuchnik/Basic.html#TauCeti.friedberg_muchnik). Both of their degrees lie strictly between 0 and 0′.
- **Soare's low simple set** — a finite-injury c.e. set that is both [simple](https://taucetiproject.org/docs/TauCeti/Computability/Simple/Low.html#TauCeti.simple_lowSimpleSet) and [low](https://taucetiproject.org/docs/TauCeti/Computability/Simple/Lowness.html#TauCeti.low_lowSimpleSet).
- **Π⁰₂-completeness of totality** — the indices of total programs relative to Z are [exactly as hard as any Π⁰₂(Z) predicate](https://taucetiproject.org/docs/TauCeti/Computability/Hierarchy/Totality.html#TauCeti.ArithmeticalHierarchy.isPi_two_iff_oneOneReducible_totality), under one-one reductions, and are not Σ⁰₂(Z).

### Notable definitions and infrastructure

- **Single-oracle programs** — a numbered [oracle-program type](https://taucetiproject.org/docs/TauCeti/Computability/SingleOracle/Code.html#TauCeti.Oracle.Single.Code). Its bounded runs record their use and satisfy the [use principle](https://taucetiproject.org/docs/TauCeti/Computability/SingleOracle/Evaln.html#TauCeti.Oracle.Single.Code.evaln_eq_some_of_eqOn). Every negative reducibility result in the roadmap quantifies over these programs.
- **Injury calculus and length of agreement** — public [injury sets](https://taucetiproject.org/docs/TauCeti/Computability/Priority/Injury/Basic.html#TauCeti.Priority.injurySet) and agreement restraints, with [Soare's Lemma 1](https://taucetiproject.org/docs/TauCeti/Computability/Priority/Agreement/Basic.html#TauCeti.Oracle.Single.Code.computablePred_mem_stageLimit_of_eval_eq) turning finite injury into nonreduction. All four priority constructions are clients of this calculus.
- **Uniform splitting codes** — a primitive recursive [operator on program codes](https://taucetiproject.org/docs/TauCeti/Computability/SacksSplitting/Code.html#TauCeti.SacksSplitting.splitCode) that outputs the two Sacks halves. Disjointness and union hold for all inputs, and lowness holds under the noncomputability promise.

### Roadmap coverage

L0, L6, L7, L8 and L9 are done. L9 covers the agreement machinery, cone avoidance, low splitting with uniform output codes, and every corollary of L9.4. L1 is partial: stages, serialization of sets and range presentations are proved, including [injective enumerations of infinite c.e. sets](https://taucetiproject.org/docs/TauCeti/Computability/Enumeration/Range.html#REPred.exists_injective_computable_range). Still missing are the uniform index maps for union, intersection, image and projection, and the serialization of pairs and tagged unions. L2 is partial: padding, the fixed-point theorem, joins, degrees and the split reductions are present, but complement invariance `A ≡_T Aᶜ` was not found. L3 is partial. L3.1 is done, and L3.2 has the pointclasses, their closure lemmas, Post's theorem at level one, and full classifications of `TOT`, `FIN` and `INF`. The normal forms and Post's theorem at every level are still missing. L4 is done except the Δ⁰₂ form of the Limit Lemma. The Modulus Lemma, both directions of the relativized Limit Lemma, and now [Soare's criterion for c.e. degree](https://taucetiproject.org/docs/TauCeti/Computability/Approximation/CEDegree.html#TauCeti.Approximation.exists_rePred_turingEquivalent_iff_exists_isModulus) are all proved. L5 is partial: it has the inseparable pair, Post's simple set and the cone-avoiding simple set, but not Kleene–Post.

## The frontier

- **Post's theorem at every level (L3.2)** — the alternating-quantifier normal forms and their codes, `post_sigma` and `post_delta` for all n, and strictness of the hierarchy. This needs iterated-jump arguments over the existing pointclasses.
- **The Δ⁰₂ Limit Lemma (L4.3)** — a set is Δ⁰₂(Z) exactly when it is a limit of uniformly Z-computable approximations. It is immediate once Post's theorem at level two exists.
- **Kleene–Post (L5.3)** — two Turing-incomparable sets below ∅′, by a ∅′-computable finite-extension procedure. It depends only on the use principle and the jump, both of which exist.
- **Uniform c.e. index maps (L1.2, L1.3)** — computable index maps for union, intersection, image and projection, with their relative forms, and serialization of pairs and tagged disjoint unions.
- **Reducibility invariances (L2.2)** — complement invariance, invariance under computable bijections, and a noncomputable subset of a computable set.

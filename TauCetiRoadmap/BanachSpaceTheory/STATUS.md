<!--tauceti-status:v1 {"roadmap":"BanachSpaceTheory","to_sha":"9fc5d5a87d00cb696e606ccdae66420cc837c05e","ts":"2026-10-19T21:24:00Z"}-->
# Status: BanachSpaceTheory

This file documents the status of the BanachSpaceTheory roadmap up until `9fc5d5a` (2026-10-19T21:24:00Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The duality layer (B1) is essentially in place. Reflexivity and bases (B2, B3) are well advanced, but the hard compactness theorems of B2 are still missing. B4, B6 and B7 have their opening definitions, and B5 has not begun. None of the five depth milestones (James, Pietsch, Grothendieck, local reflexivity, Dvoretzky) has started.

### Named results

- **The closed-range theorem** — a bounded operator between Banach spaces has closed range exactly when its adjoint does ([`isClosed_range_precomp_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Dual/Adjoint.html#ContinuousLinearMap.isClosed_range_precomp_iff)). The finitely supported sequences inside `ℓ²` show that the domain must be complete.
- **The Bishop–Phelps theorem** — norm-attaining functionals are dense in the dual of a Banach space ([`dense_setOf_exists_norm_apply_eq_norm`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Dual/BishopPhelps.html#TauCeti.dense_setOf_exists_norm_apply_eq_norm)). It is also proved in its support-point and support-functional forms for closed convex sets.
- **The Milman–Pettis theorem** — every uniformly convex Banach space is reflexive ([`surjective_inclusionInDoubleDual_of_uniformConvexSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Uniform.html#TauCeti.surjective_inclusionInDoubleDual_of_uniformConvexSpace)).
- **James's basis criterion** — a Banach space with a Schauder basis is reflexive exactly when the basis is shrinking and boundedly complete ([`surjective_inclusionInDoubleDual_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Bases/Reflexive.html#SchauderBasis.surjective_inclusionInDoubleDual_iff)).
- **Gantmacher's theorem** — an operator into a Banach space is weakly compact exactly when its adjoint is ([`isWeaklyCompact_precomp_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/WeaklyCompact.html#ContinuousLinearMap.isWeaklyCompact_precomp_iff)). It comes with the bidual-range criterion and with the identity of an infinite-dimensional reflexive space as an example that is weakly compact but not compact.

### Notable definitions and infrastructure

- **The approximation property and its bounded and metric variants** ([`HasApproximationProperty`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/ApproximationProperty/Basic.html#TauCeti.HasApproximationProperty)). The implications MAP ⇒ BAP ⇒ AP are proved, the properties transport along equivalences and projections, and a basis gives the BAP. `c₀` and `ℓᵖ` have the MAP. This is the base Grothendieck's equivalence and the tensor comparisons will build on.
- **The absolutely p-summing gauge** ([`summingENorm`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/AbsolutelySumming.html#ContinuousLinearMap.summingENorm)). It is defined through the weak `ℓᵖ` norm of finite families, and the gauge is proved lower semicontinuous, subadditive and monotone in `p`. A generic [operator-gauge carrier](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/Carrier.html#TauCeti.OperatorGauge.completeSpace_carrier_of_lowerSemicontinuous) proves completeness for any lower semicontinuous gauge, which is what the Banach ideal `Π_p` needs.
- **The Banach–Mazur distance** ([`banachMazurDist`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/BanachMazur.html#TauCeti.banachMazurDist)). It is symmetric and satisfies the multiplicative triangle inequality, and in finite dimensions distance one means isometric. It is the yardstick for all of B7.

### Roadmap coverage

**B1** is essentially done: annihilators and the weak-star double annihilator, the dual of a quotient and of a subspace, isometric adjoints, the closed-range theorem with its counterexample, Goldstine, the bipolar theorem, Mazur's lemma, weak boundedness and an explicit weak-star metric on dual balls. **B2** is partial. Reflexivity has its weak-compactness characterisation and passes to subspaces, quotients and duals. Bishop–Phelps, Milman–Pettis and the weakly compact operator theory are done. Eberlein–Šmulian, James's theorem, Krein–Šmulian and the `Lᵖ` uniform-convexity estimates are missing. **B3** is partial. The general basis theory and James's criterion are done, as are the bases of `c₀` and `ℓᵖ` and the dualities c₀* = ℓ¹ and (ℓ¹)* = ℓ∞. Still missing are `(ℓᵖ)* = ℓᑫ`, the unconditional-multiplier theory, Schur's theorem, the classical (non)reflexivity examples and the Haar basis. **B4** is partial: the approximation-property layer is there, apart from the MAP for `Lᵖ[0,1]`, but Grothendieck's equivalence, the tensor norms, nuclear operators and integral forms are untouched. **B6** has only its definitions and elementary ideal laws. **B7** has only the Banach–Mazur distance. **B5** is untouched.

## The frontier

- **Eberlein–Šmulian and James's theorem** — the remaining core of B2. With reflexivity and Bishop–Phelps in place, these and Krein–Šmulian are the natural next targets.
- **The Banach ideal Π_p** — bundle the summing gauge as a normed carrier using the operator-gauge completeness criterion. Then prove the `p = 1` characterisation by unconditional and absolutely convergent series. Pietsch domination comes after that.
- **Classical sequence-space facts for B3** — Schur's theorem for `ℓ¹`, nonreflexivity of `c₀` and `ℓ¹`, and `(ℓᵖ)* = ℓᑫ`. The bases and the endpoint dualities already present make these short.
- **Projective and injective tensor norms** — not begun. Grothendieck's AP equivalence and nuclear operators in B4 depend on them.
- **Finite representability and local reflexivity** — B7's next step after the Banach–Mazur distance.

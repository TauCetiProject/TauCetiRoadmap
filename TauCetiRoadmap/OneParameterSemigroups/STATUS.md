<!--tauceti-status:v1 {"roadmap":"OneParameterSemigroups","to_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd","ts":"2026-08-03T18:31:13Z"}-->
# Status: OneParameterSemigroups

This file documents the status of the OneParameterSemigroups roadmap up until `11ef09d` (2026-08-03T18:31:13Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Of the three headline representation theorems, one is proved: Bernstein's, in the existence-and-uniqueness form. The C₀-semigroup layer is a working theory — objects, growth bounds, the unbounded generator, the Laplace-transform resolvent, dissipativity, the abstract Cauchy problem — but stops short of its two generation theorems, Hille-Yosida and Lumer-Phillips, which need the Yosida approximation and have not been started. Positive-definite functions have their predicate, their kernel theory and the Fourier plumbing, but Bochner's theorem and the Berg-Christensen-Ressel representation are untouched.

### Named results

- **Bernstein's theorem** — a completely monotone function on `[0,∞)` is the Laplace transform of a unique finite positive measure on `ℝ≥0` ([`existsUnique_isFiniteMeasure_integral_exp_neg_mul_eq_of_isCompletelyMonotone`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Bernstein/Unique.html#TauCeti.existsUnique_isFiniteMeasure_integral_exp_neg_mul_eq_of_isCompletelyMonotone)). Only this direction is stated; the roadmap's iff also wants that every such transform is completely monotone.
- **The generator determines the semigroup** — two C₀ semigroups on a real Banach space with the same infinitesimal generator coincide ([`eq_of_generator_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Generator/Uniqueness.html#TauCeti.Semigroups.StronglyContinuousSemigroup.eq_of_generator_eq)), so a vanishing generator gives the identity and a bounded one gives `exp (t • A)`.
- **Converse of Lumer-Phillips** — the generator of a contraction semigroup is m-dissipative ([`isMDissipative_generator`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Dissipative/Basic.html#TauCeti.Semigroups.ContractionSemigroup.isMDissipative_generator)), with the Hilbert-space form `⟪Ax, x⟫ ≤ 0` proved equivalent to dissipativity there.
- **The abstract Cauchy problem** — the orbit of a domain vector is a classical solution of `u' = Au`, `u(0) = x` ([`isClassicalSolution_realOperator`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/CauchyProblem.html#TauCeti.Semigroups.StronglyContinuousSemigroup.isClassicalSolution_realOperator)), and every orbit is a mild solution.
- **Kolmogorov decomposition** — a positive-definite kernel has a canonical Hilbert space and feature map, and any other realization receives a unique isometry from it ([`kolmogorovIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.html#TauCeti.IsPositiveDefiniteKernel.kolmogorovIsometry)).

### Notable definitions and infrastructure

- [`generator`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Generator/Basic.html#TauCeti.Semigroups.StronglyContinuousSemigroup.generator), the infinitesimal generator as a `LinearPMap` on its natural domain, with density and closedness proved. This is what lets the semigroup theory talk about unbounded operators without a parallel API, and it is the object every generation theorem is about.
- [`resolventFun`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Resolvent/Basic.html#TauCeti.Semigroups.StronglyContinuousSemigroup.resolventFun), the Laplace-transform resolvent as a function of the spectral parameter alone, which is what carries the resolvent identity, smoothness on `(ω,∞)`, and `dⁿR/dλⁿ = (-1)ⁿ n! R(λ)ⁿ⁺¹` — the estimates the Yosida approximation runs on.
- [`IsPositiveDefinite`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PositiveDefinite/Basic.html#TauCeti.IsPositiveDefinite), stated for any involutive additive monoid rather than for a group. The involution, not subtraction, is what makes the same predicate serve both Bochner on an inner-product space and the BCR notion on `[0,∞) × V`.

### Roadmap coverage

Part A has everything below the generation theorems: the semigroup and contraction-semigroup objects, growth bounds and exponential shifting, the generator with its domain, closedness and commutation with `S(t)`, the resolvent as a pointwise Bochner integral with the identity, derivative formulas and — for contractions — the iterated bound `‖R(λ)ⁿ‖ ≤ λ⁻ⁿ`, dissipativity, the identity and bounded-generator examples with the bridge to Mathlib's Banach-algebra `resolvent`, and the Cauchy problem. Not there: both generation milestones, the general `(M, ω)` power bound in its sharp form (what is proved bounds `‖R(λ)ⁿ‖` by `(M/(λ−ω))ⁿ`, weaker than `M/(λ−ω)ⁿ` unless `M = 1`), complex analyticity via complexification, bounded perturbation, and C₀ groups. Part B has the completely monotone and Bernstein-function predicates with their closure and example API and the representation theorem; the Lévy-Khinchine representation and the Stieltjes correspondences are untouched, as is composition of a completely monotone function with a Bernstein one. Part C has the predicate, kernels, closure, continuity, normalization, pullbacks, limits, the Fourier-convention conversion, the fact that a finite measure's transform is positive definite, and the Gaussian; neither Bochner's theorem nor BCR is established, and the LCA stretch has not begun.

## The frontier

- **Hille-Yosida generation theorem** — the whole statement remains. The resolvent API it consumes is in place; what is missing is the sharp `(M, ω)` power bound, the Yosida approximation `Aλ = λ² R(λ,A) − λI`, and the Cauchy property of `e^{tAλ}x` uniformly on compact time intervals, from which `S(t)x` is defined.
- **Lumer-Phillips, forward direction** — a densely defined m-dissipative operator generates a contraction semigroup. Both predicates and the converse are done, so this is the same Yosida construction under a different hypothesis set.
- **Bochner's theorem on a finite-dimensional real inner-product space** — nothing yet. The ingredients are unusually complete: the convention conversion, positive-definiteness of a finite measure's transform, the Kolmogorov decomposition, and tightness and weak-cluster tooling reused from the Bernstein proof.
- **BCR semigroup-Bochner** — gated on Bochner for existence, but the uniqueness half is independent, and the `ℝ≥0` factor of the needed Laplace-Fourier injectivity already exists as the Laplace-determinacy lemma behind Bernstein uniqueness.
- **Bernstein as a genuine iff** — then the Lévy-Khinchine representation and the completely monotone / Bernstein correspondences.

<!--tauceti-status:v1 {"roadmap":"OneParameterSemigroups","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","remaining":"optional: show that each exponential e^{-pt} spans an extreme ray of the completely monotone cone","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"6fc90278e68584b60e34678f30b5072cc9686e94a96c6c5fdeb152833efc025d","roadmap":"OneParameterSemigroups","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: OneParameterSemigroups

This file documents the status of the OneParameterSemigroups roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All three parts are done. Every named milestone is proved, and the two stretch goals the README names, Stone's theorem and Bochner's theorem on locally compact abelian groups, are proved too. The one open item is the converse half of the extreme-ray description of completely monotone functions.

### Named results

- **The Hille–Yosida characterization** — a densely defined operator on a real Banach space generates a C₀ semigroup with `‖S(t)‖ ≤ M e^{ωt}` exactly when `M ≥ 1`, `(ω, ∞)` lies in its resolvent set, and `‖R(λ,A)ⁿ‖ ≤ M/(λ−ω)ⁿ` for all `n ≥ 1` ([`hilleYosida_generation_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Generation.html#TauCeti.Semigroups.hilleYosida_generation_iff)).
- **Stone's theorem** — an operator `A` on a complex Hilbert space is self-adjoint exactly when `iA` generates a unitary C₀-group, and that group is unique ([`isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.html#LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul)).
- **The Hausdorff–Bernstein–Widder theorem** — a function is continuous on `[0, ∞)` and completely monotone on `(0, ∞)` exactly when it is the Laplace transform of a unique finite positive measure on `ℝ≥0` ([`hausdorff_bernstein_widder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.html#TauCeti.hausdorff_bernstein_widder)).
- **Bochner's theorem on locally compact abelian groups** — a function is continuous and positive definite exactly when it is the Fourier–Stieltjes transform of a unique finite inner regular measure on the Pontryagin dual ([`continuous_and_isPositiveDefiniteSub_iff_existsUnique_innerRegular_pontryaginMeasureTransform_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Bochner/LocallyCompactGroup.html#TauCeti.continuous_and_isPositiveDefiniteSub_iff_existsUnique_innerRegular_pontryaginMeasureTransform_eq)). The finite-dimensional [`bochner`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Bochner/BochnerTheorem.html#TauCeti.bochner) on an inner-product space `V` and [Herglotz's theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Bochner/Herglotz.html#TauCeti.isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq) on `ℤ` sit beside it as concrete forms.
- **The Berg–Christensen–Ressel representation** — a function on `ℝ≥0 × V` is bounded, continuous and positive definite exactly when it is the Laplace–Fourier transform of a unique finite measure ([`bcr_semigroup_bochner`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PositiveDefinite/SemigroupGroup/FourierLaplace/Existence.html#TauCeti.bcr_semigroup_bochner)).

### Notable definitions and infrastructure

- The normed [`Complexification`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Normed/Module/Complexification.html#TauCeti.Complexification) of a real Banach space uses the Taylor norm, so complexifying operators and semigroups loses no constants. This is how the real-Banach-first theory reaches a [holomorphic resolvent](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Resolvent/Complex.html#TauCeti.Semigroups.StronglyContinuousSemigroup.analyticOnNhd_resolvent_complexGenerator) with the Hille–Yosida bounds.
- [`IsCompleteBernsteinFunction`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Stieltjes/CompleteBernstein.html#TauCeti.IsCompleteBernsteinFunction) ties Part B together. It is matched with Stieltjes functions through `t f(t)`, `f(1/t)` and [reciprocals](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Stieltjes/Reciprocal.html#TauCeti.isCompleteBernsteinFunction_iff_continuousWithinAt_isStieltjesFunction_inv), and it has the [Pick characterization](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Stieltjes/Pick.html#TauCeti.isCompleteBernsteinFunction_iff_continuousWithinAt_nonneg_exists_analyticOnNhd).
- The [integrated form](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Continuous/Integrated/Basic.html#ContRepresentation.integratedOperatorL1) `π(f) = ∫ f(g) π(g) dg` of a strongly continuous representation turns convolution into composition. For a unitary abelian representation it generates a commutative C⋆-algebra. That algebra drives the [cyclic spectral theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fourier/Pontryagin/StronglyContinuous.html#ContRepresentation.exists_pontryaginMeasureTransform_eq_inner) for such representations, which gives the existence half of Bochner on LCA groups.

### Roadmap coverage

Parts A, B and C are done.

- **Part A** has every milestone and API item, including generator uniqueness, dissipativity in duality-map form, the bounded perturbation theorem, a holomorphic complex resolvent, density of smooth vectors, the abstract Cauchy problem with uniqueness, and the C₀-group stretch through Stone's theorem. Its acceptance examples now include multiplication semigroups on ℓᵖ, which give a strongly continuous semigroup that is [not norm-continuous](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Multiplication/Lp/Basic.html#TauCeti.Semigroups.ContractionSemigroup.ofLpMultiplication_not_continuousAt_zero).
- **Part B** has Bernstein's theorem, the closure properties (now also closure under [tail integrals](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Integral/Tail.html#TauCeti.IsCompletelyMonotoneOnIoi.isContinuousCompletelyMonotoneOnIoi_integral_Ioi)), Lévy–Khintchine, and the Stieltjes and complete-Bernstein correspondences. It also shows that every extreme ray of the completely monotone cone is exponential.
- **Part C** has Bochner on `V`, BCR with uniqueness and all three acceptance examples. The LCA stretch is now closed as well.

## The frontier

- **Exponentials span extreme rays**: the proved direction says that every extreme ray of the completely monotone cone is spanned by some `e^{-pt}`. The converse, that each `e^{-pt}` actually spans an extreme ray, is not stated. It should follow from uniqueness in Hausdorff–Bernstein–Widder.
- **An `RCLike` scalar field for semigroups**: the README lists an `[RCLike 𝕜]` formulation of the real-Banach semigroup theory as a possible later generalization. At present the complex case goes through complexification, and nothing more general has been started.

<!--tauceti-status:v1 {"roadmap":"OneParameterSemigroups","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4","ts":"2026-10-25T09:09:58Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"ce806a27d23697d07617d9ad3a9ac2ada10b8ae9fc5d229579db63565d2a0b9e","roadmap":"OneParameterSemigroups","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4"}-->
# Status: OneParameterSemigroups

This file documents the status of the OneParameterSemigroups roadmap up until `d96e9ce` (2026-10-25T09:09:58Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All three parts are done. Every named milestone is proved, along with two stretch results, Stone's theorem and Bochner's theorem on locally compact abelian groups. The last open API item, the description of the extreme rays of the completely monotone cone, is now closed in both directions.

### Named results

- **The Hille–Yosida characterization** — a densely defined operator on a real Banach space generates a C₀ semigroup with `‖S(t)‖ ≤ M e^{ωt}` exactly when `M ≥ 1`, `(ω, ∞)` lies in its resolvent set, and `‖R(λ,A)ⁿ‖ ≤ M/(λ−ω)ⁿ` for all `n ≥ 1` ([`hilleYosida_generation_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Generation.html#TauCeti.Semigroups.hilleYosida_generation_iff)). The classical contraction form, `‖R(λ,A)‖ ≤ 1/λ` for `λ > 0`, is stated separately as [`exists_contractionSemigroup_generator_eq_iff_forall_norm_resolvent_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Contraction.html#TauCeti.Semigroups.exists_contractionSemigroup_generator_eq_iff_forall_norm_resolvent_le).
- **Stone's theorem** — an operator `A` on a complex Hilbert space is self-adjoint exactly when `iA` generates a unitary C₀-group, and that group is unique ([`isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.html#LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul)).
- **The Hausdorff–Bernstein–Widder theorem** — a function is continuous on `[0, ∞)` and completely monotone on `(0, ∞)` exactly when it is the Laplace transform of a unique finite positive measure on `ℝ≥0` ([`hausdorff_bernstein_widder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.html#TauCeti.hausdorff_bernstein_widder)).
- **Bochner's theorem on locally compact abelian groups** — a function is continuous and positive definite exactly when it is the Fourier–Stieltjes transform of a unique finite inner regular measure on the Pontryagin dual ([`continuous_and_isPositiveDefiniteSub_iff_existsUnique_innerRegular_pontryaginMeasureTransform_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Bochner/LocallyCompactGroup.html#TauCeti.continuous_and_isPositiveDefiniteSub_iff_existsUnique_innerRegular_pontryaginMeasureTransform_eq)). The finite-dimensional [`bochner`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Bochner/BochnerTheorem.html#TauCeti.bochner) on an inner-product space `V` is the form the README asks for.
- **The Berg–Christensen–Ressel representation** — a function on `ℝ≥0 × V` is bounded, continuous and positive definite exactly when it is the Laplace–Fourier transform of a unique finite measure ([`bcr_semigroup_bochner`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PositiveDefinite/SemigroupGroup/FourierLaplace/Existence.html#TauCeti.bcr_semigroup_bochner)).

### Notable definitions and infrastructure

- The resolvent set of a partial linear map is defined on any topological module: a point belongs to it when `λI − A` has a continuous linear inverse. This is the shared core the README asks for. The resolvent identity, analyticity, perturbation and the bridge to Mathlib's Banach-algebra resolvent are built on it. For a bounded generator, the semigroup's resolvent is identified with the [Neumann series](https://taucetiproject.org/docs/TauCeti/Analysis/Semigroups/BoundedGenerator/Resolvent.html#TauCeti.Semigroups.StronglyContinuousSemigroup.ofBounded_resolvent_eq_inv_smul_tsum_pow).
- The normed [`Complexification`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Normed/Module/Complexification.html#TauCeti.Complexification) of a real Banach space uses the Taylor norm, so complexifying loses no constants. It is how the real-Banach-first theory reaches a holomorphic resolvent with the Hille–Yosida bounds on a half-plane.
- The Laplace transform [turns convolution into multiplication](https://taucetiproject.org/docs/TauCeti/Analysis/CompletelyMonotone/Laplace/Convolution.html#TauCeti.laplaceTransform_conv), so closure properties of completely monotone functions become operations on their representing measures. Products become convolutions, multiplying by `e^{-pt}` becomes translation, and the extreme rays are exactly the point masses.

### Roadmap coverage

Parts A, B and C are done. **Part A** has both generation theorems and the API around them: generator uniqueness, dissipativity in both duality-map and resolvent form, bounded perturbation, a holomorphic complex resolvent, density of smooth vectors, and the abstract Cauchy problem. Its acceptance examples now include [multiplication semigroups on Lᵖ of any measure space](https://taucetiproject.org/docs/TauCeti/Analysis/Semigroups/Multiplication/MeasureLp/BoundedBelow.html#TauCeti.Semigroups.StronglyContinuousSemigroup.ofMeasureLpMultiplication). **Part B** has Bernstein's theorem, closure under limits, series, products and tail integrals, Lévy–Khintchine, and the Stieltjes and complete Bernstein correspondences. It also has the [two-sided description of extreme rays](https://taucetiproject.org/docs/TauCeti/Analysis/CompletelyMonotone/Bernstein/Extremal.html#TauCeti.IsContinuousCompletelyMonotoneOnIoi.extreme_ray_iff_exists_eq_mul_exp_neg_mul). **Part C** has Bochner on `V`, BCR with uniqueness, and all three acceptance examples. The BCR predicate is now literally the generic positive-definiteness on `ℝ≥0 × V` with the product involution, as the README specifies.

## The frontier

- **README housekeeping**: the README still describes the LCA stretch of Bochner as not begun, although the theorem is in the library. With every milestone proved, the roadmap is a candidate to be marked complete.
- **Handing the resolvent core across**: the README gives the scalar generalization of the shared resolvent core to `OperatorTheory/SelfAdjointSpectralTheory`. The core here is stated for topological modules, so that roadmap can consume it directly. Whether that roadmap needs more is for its own report to say.

<!--tauceti-status:v1 {"roadmap":"OneParameterSemigroups","to_sha":"835fbbdde8c00ea84da8b4376d2b3712de1b40fd","ts":"2026-09-30T22:19:33Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","remaining":"stretch only: Bochner on LCA groups, whose function-to-measure direction is not established","state":"done"}],"readme_sha":"6fc90278e68584b60e34678f30b5072cc9686e94a96c6c5fdeb152833efc025d","roadmap":"OneParameterSemigroups","to_sha":"835fbbdde8c00ea84da8b4376d2b3712de1b40fd"}-->
# Status: OneParameterSemigroups

This file documents the status of the OneParameterSemigroups roadmap up until `835fbbd` (2026-09-30T22:19:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All three parts are done. Every named milestone is proved: Hille–Yosida, Lumer–Phillips and the abstract Cauchy problem; Bernstein's theorem; Bochner's theorem and the Berg–Christensen–Ressel representation. Stone's theorem is also proved as a stretch. The only open target is the LCA form of Bochner's theorem, a stretch goal that so far has only its easy direction and the GNS representation.

### Named results

- **The Hille–Yosida characterization**: a densely defined operator on a real Banach space generates a C₀ semigroup with `‖S(t)‖ ≤ M e^{ωt}` exactly when `M ≥ 1`, `(ω, ∞)` lies in its resolvent set, and `‖R(λ,A)ⁿ‖ ≤ M/(λ−ω)ⁿ` for all `n ≥ 1` ([`hilleYosida_generation_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Generation.html#TauCeti.Semigroups.hilleYosida_generation_iff)).
- **Stone's theorem**: an operator `A` on a complex Hilbert space is self-adjoint exactly when `iA` generates a unitary C₀-group, and that group is unique ([`isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.html#LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul)).
- **The Hausdorff–Bernstein–Widder theorem**: a function is continuous on `[0, ∞)` and completely monotone on `(0, ∞)` exactly when it is the Laplace transform of a finite positive measure on `ℝ≥0`, and that measure is unique ([`hausdorff_bernstein_widder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.html#TauCeti.hausdorff_bernstein_widder)).
- **Bochner's theorem**: on a finite-dimensional real inner-product space, the continuous positive-definite functions are exactly the Fourier transforms of finite Borel measures, and the measure is unique ([`bochner`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Bochner/BochnerTheorem.html#TauCeti.bochner)).
- **The Berg–Christensen–Ressel representation**: a function on `ℝ≥0 × V` is bounded, continuous and positive definite exactly when it is the Laplace–Fourier transform of a finite measure, and that measure is unique ([`bcr_semigroup_bochner`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PositiveDefinite/SemigroupGroup/FourierLaplace/Existence.html#TauCeti.bcr_semigroup_bochner)).

### Notable definitions and infrastructure

- The normed [`Complexification`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Normed/Module/Complexification.html#TauCeti.Complexification) of a real Banach space uses the Taylor norm, so complexifying operators and C₀ semigroups loses no constants. This is how the real-Banach-first theory reaches a [holomorphic resolvent](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Resolvent/Complex.html#TauCeti.Semigroups.StronglyContinuousSemigroup.analyticOnNhd_resolvent_complexGenerator) with the Hille–Yosida bounds.
- [`IsCompleteBernsteinFunction`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Stieltjes/CompleteBernstein.html#TauCeti.IsCompleteBernsteinFunction) ties Part B together. It matches Stieltjes functions through `t f(t)`, `f(1/t)` and now [reciprocals](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Stieltjes/Reciprocal.html#TauCeti.isCompleteBernsteinFunction_iff_continuousWithinAt_isStieltjesFunction_inv), and it has the [Pick characterization](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Stieltjes/Pick.html#TauCeti.isCompleteBernsteinFunction_iff_continuousWithinAt_nonneg_exists_analyticOnNhd) through holomorphic extension to the slit plane.
- The [GNS representation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PositiveDefinite/Function/GNS.html#TauCeti.IsPositiveDefiniteSub.gnsRepresentation) of a positive-definite function on an abelian group realizes the function as a matrix coefficient of a unitary representation. That representation is strongly continuous when the function is continuous at `0`. It is the starting point for the function-to-measure direction of Bochner's theorem on LCA groups.

### Roadmap coverage

Parts A, B and C are done.

- **Part A** has every milestone and API item, including the following:
  - uniqueness for the Cauchy problem
  - duality-map dissipativity
  - a holomorphic complex resolvent
  - the optional target of density of smooth vectors, with smooth vectors characterized by `C^∞` orbits
  - the C₀-group stretch through Stone's theorem
- **Part B** is now complete. The reciprocal Stieltjes–complete Bernstein correspondence closed its last gap, and the extreme rays of the completely monotone cone are now shown to be exponentials. These join Bernstein's theorem, the closure properties, Lévy–Khintchine and the Pick characterization.
- **Part C** has Bochner on `V`, BCR with uniqueness and all three acceptance examples. Its LCA stretch has the transform of measures into positive-definite functions and the GNS representation, but no representation theorem.

## The frontier

- **Bochner's theorem on LCA groups**: show that every continuous positive-definite function on a locally compact abelian group is the transform of a unique finite measure on the dual. The measure-to-function direction and the strongly continuous GNS representation are in place. What remains is to extract a spectral measure from that representation and identify it on the Pontryagin dual. That is the heavy step, and the README ties it to upstream Pontryagin-duality support.
- **Exponentials as extreme rays**: the proved direction says that an extreme ray of the completely monotone cone is exponential. The converse, that each `e^{-pt}` actually spans an extreme ray, is not stated here. It should follow from uniqueness in Hausdorff–Bernstein–Widder.

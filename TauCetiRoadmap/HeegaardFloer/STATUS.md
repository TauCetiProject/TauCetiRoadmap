<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d","ts":"2026-10-02T05:38:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane M","remaining":"smooth stable/unstable manifolds, Morse-Smale transversality, compactness and gluing, the Morse complex and its homology","state":"partial"},{"id":"Lane F0","remaining":"regular zeros of Fredholm sections of Banach bundles as manifolds; Fredholmness and index of the strip operator d/ds + A(s)","state":"partial"},{"id":"Lane F1","remaining":"Sobolev spaces on strips, trace, Calderon-Zygmund, totally real boundary regularity, Riemann-Roch, Maslov index for paths","state":"partial"},{"id":"Lane F2","remaining":"local theory, the rest of Gromov compactness, transversality and gluing","state":"partial"},{"id":"Lane F3","remaining":"the exact Floer complex: action functional, strip moduli, d^2 = 0, continuation maps","state":"partial"},{"id":"Lane F4","remaining":"spin^c structures, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Lane F5","state":"untouched"}],"readme_sha":"a442c388e741c9070d26e0faf8b073097c9d2e85fa784d1ba085bf85a0a68174","roadmap":"HeegaardFloer","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `d449639` (2026-10-02T05:38:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Morse–Sard and Sard–Smale summits are complete. Lane M reaches the local stable-manifold theorem, and `Sym^g(Σ)` is a complex analytic manifold with weak admissibility characterized on domains. Every lane from F0 to F4 is partial. No chain complex has been built: Morse homology, Floer homology, holomorphic `HF̂`, Lane F5 and the reconciliations have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values. It builds on the finite-dimensional [Morse–Sard theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#TauCeti.ContDiff.addHaar_image_criticalPoints_eq_zero) and has a [global parametric form](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/LevelSet/GlobalParametric.html#TauCeti.isMeagre_setOf_not_isRegularParameter).

- **The local stable-manifold theorem at a Morse critical point** ([`TauCeti.IsNondegenerateCriticalPoint.exists_localStableSet_homeomorph_closedBall`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/LocalInvariantManifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_localStableSet_homeomorph_closedBall)) — the points whose negative-gradient trajectories stay nearby form a closed disk of dimension `n` minus the Morse index. The [unstable version](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/LocalInvariantManifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_localUnstableSet_homeomorph_closedBall) accompanies it. Both are Lipschitz graphs and are not yet shown to be smooth.

- **Symmetric powers of Riemann surfaces are complex manifolds** ([`TauCeti.isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)) — the elementary-symmetric charts have analytic transition maps, including where points collide.

- **The mean-value inequality** ([`TauCeti.mul_le_eight_mul_setIntegral_ball_of_neg_mul_sq_le_laplacian`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/MeanValueInequality.html#TauCeti.mul_le_eight_mul_setIntegral_ball_of_neg_mul_sq_le_laplacian)) — on a planar disk, a nonnegative function with `Δw ≥ -Aw²` and small integral is at most eight times its average at the centre. This is the analytic input to bubbling.

- **Weak admissibility via area forms** ([`TauCeti.HeegaardRegionSystem.weaklyAdmissible_iff_exists_pos_forall_sum_mul_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/Admissibility.html#TauCeti.HeegaardRegionSystem.weaklyAdmissible_iff_exists_pos_forall_sum_mul_eq_zero)) — a diagram is weakly admissible exactly when its regions carry positive areas that vanish on periodic domains. Then only [finitely many nonnegative domains](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/Admissibility.html#TauCeti.HeegaardRegionSystem.WeaklyAdmissible.finite_setOf_isDomainBetween_basepoint_eq_nonneg) join two generators with fixed basepoint multiplicities.

### Notable definitions and infrastructure

- The [regular-level-set theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/LevelSet/Manifold.html#TauCeti.isManifold_levelSet) makes a regular level set of a Fredholm map a manifold whose dimension is the index. The [intrinsic linearization of a bundle section](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Linearization.html#TauCeti.sectionLinearization) at a zero, whose Fredholmness and index do not depend on the trivialization, is the first step in moving this from maps to sections.

- In `Sym^g(Σ)`, tori of disjoint curves are [maximal totally real](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/TotallyReal.html#TauCeti.isMaximalTotallyReal_range_fderiv_symChartAt_ofFn). A curve's [intersection order with the basepoint divisor](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/BasepointIntersection/Order.html#TauCeti.basepointIntersectionOrder) does not depend on the chart and is positive exactly on the divisor. These are the local ingredients of `n_z(φ) ≥ 0`.

- Two Maslov indices are ready to be compared. The analytic one, for [loops of totally real subspaces](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TotallyReal/Maslov/Prod.html#TauCeti.TotallyRealLoop.maslovIndex_prod), satisfies the axioms and a twisting formula. The other is Lipshitz's [combinatorial index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/MaslovIndex.html#TauCeti.HeegaardRegionSystem.maslovIndex) `e(D) + n_x(D) + n_y(D)`.

### Roadmap coverage

Lane F0 is partial. Linear Fredholm theory, the nonlinear normal form, Sard–Smale, parametric transversality, regular level sets and Riesz theory for compact perturbations are done. Fredholm sections of Banach bundles have only their linearization, and the strip operator `d/ds + A(s)` is missing. Lane M is partial. It has the Morse lemma, generic Morse perturbations, Morse height functions on spheres, exponential convergence and topological local invariant manifolds. It lacks smooth invariant manifolds, Morse–Smale transversality, compactness, gluing and the complex. In Lane F1 there is only supercritical `W^{1,p}` multiplication and the Maslov index for loops. Lane F2 has F2.1's definitions, energy identities and the mean-value inequality, which opens F2.3; local theory, transversality and gluing are untouched. F3 has only linear cotangent-model facts. F4 covers F4.1's geometry, part of F4.2, and the domain-level half of F4.3's admissibility; nearly-symmetric `J` and F4.4–F4.5 are untouched. F5, the reconciliations and all acceptance criteria are untouched.

## The frontier

- **Smooth stable and unstable manifolds** — upgrade the Lipschitz graphs, already flat at the critical point, to `C¹` embedded disks on manifolds. Morse–Smale transversality waits on this.

- **Morse–Smale moduli and the Morse complex** — make stable and unstable manifolds transverse, then prove broken-trajectory compactness and gluing to get `∂² = 0`. Spheres and tori are the acceptance check.

- **Fredholm sections and the strip operator** — prove that regular zeros of a Fredholm section form a manifold of dimension the index, and that `d/ds + A(s)` is Fredholm. The second needs Lane F1's Sobolev spaces on strips.

- **The Cauchy–Riemann elliptic package** — `W^{k,p}` on strips, trace, Calderón–Zygmund, totally real boundary regularity, and the Maslov index for paths with Riemann–Roch. This is still the long pole.

- **Energy bounds for disks in `Sym^g(Σ)`** — show that a holomorphic disk's energy is the area of its domain and that `n_z(φ) ≥ 0`. The admissibility finiteness then becomes OS's energy bound.

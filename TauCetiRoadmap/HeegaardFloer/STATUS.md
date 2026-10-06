<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane M","remaining":"embedded global stable/unstable manifolds, Morse-Smale transversality, compactness and gluing, the Morse complex and its homology","state":"partial"},{"id":"Lane F0","remaining":"Fredholm property and index of the strip operator d/ds + A(s) with invertible asymptotics","state":"partial"},{"id":"Lane F1","remaining":"Sobolev spaces on strips, trace, Calderon-Zygmund, totally real boundary regularity, Riemann-Roch, Maslov index for paths","state":"partial"},{"id":"Lane F2","remaining":"local theory, the rest of Gromov compactness, transversality and gluing","state":"partial"},{"id":"Lane F3","remaining":"strip moduli in T*M, d^2 = 0, continuation maps, invariance and the T*S^1 computation","state":"partial"},{"id":"Lane F4","remaining":"spin^c structures, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Lane F5","state":"untouched"}],"readme_sha":"a442c388e741c9070d26e0faf8b073097c9d2e85fa784d1ba085bf85a0a68174","roadmap":"HeegaardFloer","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane F0 is done except for the strip operator. It has Morse–Sard, Sard–Smale, and the theorem that generic zero sets of Fredholm sections are manifolds of dimension the index. Lane M has `C¹` local stable manifolds, and `Sym^g(Σ)` is a complex manifold. Every lane from M to F4 is partial. No chain complex has been built: Morse homology, Floer homology, holomorphic `HF̂`, Lane F5 and the reconciliations have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values. It builds on the finite-dimensional [Morse–Sard theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#ContDiff.addHaar_image_criticalPoints_eq_zero).

- **Generic regular zeros of Fredholm sections** ([`TauCeti.eventually_residual_exists_isManifold_sectionZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero)) — for a residual set of parameters, the zeros of a universal Fredholm section of a Banach bundle form a manifold of dimension the index, with tangent spaces the kernels of the linearization. This is the abstract form of every transversality argument downstream.

- **The local stable-manifold theorem at a Morse critical point** ([`TauCeti.IsNondegenerateCriticalPoint.exists_localStableSet_homeomorph_closedBall`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/LocalInvariantManifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_localStableSet_homeomorph_closedBall)) — the points whose negative-gradient trajectories stay nearby form a disk of dimension `n` minus the Morse index. The disk is the graph of a [`C¹` map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/LyapunovPerron/Local.html#ContinuousLinearMap.contDiffAt_localStableGraphMap) tangent to the stable subspace. The unstable version also holds.

- **Symmetric powers of Riemann surfaces are complex manifolds** ([`TauCeti.isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)) — the elementary-symmetric charts have analytic transition maps, including where points collide.

- **The energy identity for holomorphic strips** ([`TauCeti.stdComplexLineEnergy_eq_of_tendstoUniformlyOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Symplectic/Cotangent/Action.html#TauCeti.stdComplexLineEnergy_eq_of_tendstoUniformlyOn)) — a holomorphic strip with boundary on two exact graphs has energy equal to the drop in action between its ends. It is proved for a linear cotangent space only.

### Notable definitions and infrastructure

- Weak admissibility is characterized by [positive areas vanishing on periodic domains](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/Admissibility.html#TauCeti.HeegaardRegionSystem.weaklyAdmissible_iff_exists_pos_forall_sum_mul_eq_zero). Consequently only finitely many nonnegative domains join two generators. This is the domain-level half of the Ozsváth–Szabó energy bound.

- The Ozsváth–Szabó [class `ε(x, y)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/CurveHomology.html#TauCeti.HeegaardRegionSystem.epsilon) vanishes exactly when a domain joins `x` to `y`. It separates the two generators of a diagram of `ℝP³`, and it is the obstruction that spin^c structures will be built from.

- In `Sym^g(Σ)`, tori of disjoint curves are [maximal totally real](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/TotallyReal.html#TauCeti.isMaximalTotallyReal_range_fderiv_symChartAt_ofFn). A curve has a [basepoint intersection number](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/BasepointIntersection/Number.html#TauCeti.basepointIntersectionNumber) that is additive and reparametrization-invariant, and that number bounds its intersection count. These are the curve-level ingredients of `n_z(φ) ≥ 0`.

### Roadmap coverage

Lane F0 is done except for the Fredholm property and index of the strip operator `d/ds + A(s)`. It has linear Fredholm theory, the nonlinear normal form, Sard–Smale, parametric transversality, and manifolds of regular zeros for both maps and bundle sections. Lane M is partial. It has the Morse lemma, generic Morse perturbations, Morse spheres, exponential convergence and `C¹` local invariant graphs. It lacks embedded global stable manifolds, Morse–Smale transversality, compactness, gluing and the complex. Lane F1 has only supercritical `W^{1,p}` multiplication and the Maslov index for loops. Lane F2 has F2.1's definitions, energy identities and the mean-value inequality; local theory, transversality and gluing are untouched. Lane F3 has the action functional and the energy–action identity in a linear cotangent space, but no strip moduli. Lane F4 covers F4.1's geometry, Lipshitz's Maslov index and the class `ε` from F4.2, and domain-level admissibility from F4.3. Nearly-symmetric `J` and F4.4–F4.5 are untouched. F5, the reconciliations and all acceptance criteria are untouched.

## The frontier

- **Stable manifolds as embedded submanifolds** — turn the `C¹` local graphs into embedded disks and globalize them along the flow on a manifold. Morse–Smale transversality waits on this.

- **The Morse complex** — prove broken-trajectory compactness and gluing to get `∂² = 0`, with spheres and tori as the acceptance check.

- **The strip operator** — show that `d/ds + A(s)` with invertible asymptotics is Fredholm, so the section package has its first real application. This needs Lane F1's Sobolev spaces on strips.

- **The Cauchy–Riemann elliptic package** — `W^{k,p}` on strips, trace, Calderón–Zygmund, totally real boundary regularity, and the Maslov index for paths with Riemann–Roch. This is still the long pole.

- **Spin^c structures and energy in `Sym^g(Σ)`** — identify the group where `ε` lives with `H₁(Y)`, define `s_z`, and prove that a holomorphic disk's energy is the area of its domain. Admissibility finiteness then becomes Ozsváth–Szabó's energy bound.

<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057","ts":"2026-09-30T00:20:29Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane M","remaining":"smooth stable/unstable manifolds, Morse-Smale transversality, compactness and gluing, the Morse complex and its homology","state":"partial"},{"id":"Lane F0","remaining":"Fredholm sections of Banach bundles; Fredholmness and index of the strip operator d/ds + A(s)","state":"partial"},{"id":"Lane F1","remaining":"Sobolev spaces on strips, trace, Calderon-Zygmund, totally real boundary regularity, Riemann-Roch, Maslov index for paths","state":"partial"},{"id":"Lane F2","remaining":"local theory, Gromov compactness, transversality and gluing (F2.2-F2.5)","state":"partial"},{"id":"Lane F3","remaining":"the exact Floer complex: action functional, strip moduli, d^2 = 0, continuation maps","state":"partial"},{"id":"Lane F4","remaining":"spin^c structures, nearly-symmetric J and energy bounds, the HF-hat complex and its invariance","state":"partial"},{"id":"Lane F5","state":"untouched"}],"readme_sha":"a442c388e741c9070d26e0faf8b073097c9d2e85fa784d1ba085bf85a0a68174","roadmap":"HeegaardFloer","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `dec7a58` (2026-09-30T00:20:29Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Morse–Sard and Sard–Smale summits are complete, Lane M now reaches the local stable- and unstable-manifold theorem, and `Sym^g(Σ)` exists as a complex analytic manifold. Every lane from F0 to F4 is partial. No chain complex has been built: Morse homology, Floer homology, holomorphic `HF̂`, Lane F5 and the reconciliations have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — for a sufficiently smooth Fredholm map on an open subset of a separable Banach space, the critical values are meagre. It builds on the finite-dimensional [Morse–Sard theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#TauCeti.ContDiff.addHaar_image_criticalPoints_eq_zero), and there is now a [global parametric form](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/LevelSet/GlobalParametric.html#TauCeti.isMeagre_setOf_not_isRegularParameter) for universal Fredholm equations.

- **The local stable-manifold theorem at a Morse critical point** ([`TauCeti.IsNondegenerateCriticalPoint.exists_localStableSet_homeomorph_closedBall`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/LocalInvariantManifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_localStableSet_homeomorph_closedBall)) — the points whose negative-gradient trajectories stay nearby form a closed disk of dimension `n` minus the Morse index. The unstable version is [its companion](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/LocalInvariantManifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_localUnstableSet_homeomorph_closedBall). Both are Lipschitz graphs, not yet shown to be smooth.

- **The Morse lemma** ([`TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/NormalForm.html#TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart)) — near a nondegenerate critical point, a smooth chart identifies the function with its Hessian quadratic form.

- **Symmetric powers of Riemann surfaces are complex manifolds** ([`TauCeti.isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)) — the elementary-symmetric charts have analytic transition maps, including where points collide.

- **The Maslov index of totally real loops** ([`TauCeti.TotallyRealLoop.maslovIndex_prod`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TotallyReal/Maslov/Prod.html#TauCeti.TotallyRealLoop.maslovIndex_prod)) — defined as a degree in the circle. It satisfies [homotopy invariance](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/TotallyReal/Maslov/Index.html#TauCeti.TotallyRealLoop.maslovIndex_eq_of_homotopy), normalization and the direct-sum axiom.

### Notable definitions and infrastructure

- The [regular-level-set theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/LevelSet/Manifold.html#TauCeti.isManifold_levelSet) makes a regular level set of a Fredholm map a manifold whose dimension is the index. Together with the Fredholm local normal form, this is the "moduli space is generically a manifold" step, but only for maps, not yet for sections of Banach bundles.

- In `Sym^g(Σ)`, a torus of disjoint curves is [closed, embedded](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Sym/Pi.html#TauCeti.Sym.isClosedEmbedding_ofFn_subtypeVal) and [maximal totally real](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/TotallyReal.html#TauCeti.isMaximalTotallyReal_range_fderiv_symChartAt_ofFn). The basepoint divisor is locally one affine equation, which gives holomorphic curves isolated intersections of positive order. These are the ingredients of `n_z(φ) ≥ 0`.

- Lipshitz's [combinatorial Maslov index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/MaslovIndex.html#TauCeti.HeegaardRegionSystem.maslovIndex) `e(D) + n_x(D) + n_y(D)` is defined on Heegaard region systems, is additive, and is computed for `S¹ × S²`. It is ready to be compared with the analytic index.

### Roadmap coverage

Lane F0 is partial: the linear Fredholm theory, the nonlinear normal form, Sard–Smale, parametric transversality and regular level sets are done. Still missing are Fredholm sections of Banach bundles and the strip operator `d/ds + A(s)`. Lane M is partial. It has the Morse lemma, generic Morse perturbations, height functions on spheres and their products, exponential convergence, and topological local stable and unstable manifolds that generate the global ones. Connecting orbits reduce to level slices. Missing are smoothness of the invariant manifolds, Morse–Smale transversality, compactness, gluing, the complex and its homology. Lane F1 is partial only through supercritical `W^{1,p}` multiplication on `ℝⁿ` and the Maslov index for loops; Calderón–Zygmund, boundary regularity, Riemann–Roch and spectral flow are missing. F2 has F2.1's definitions, closed two-forms, energy identities and zero-energy rigidity; F2.2–F2.5 are untouched. F3 has only linear cotangent-model facts. F4 covers F4.1's complex geometry and part of F4.2, with Gordan–Stiemke alternatives toward admissibility; F4.3–F4.5 are untouched. F5, the reconciliations and all acceptance criteria are untouched.

## The frontier

- **Smooth stable and unstable manifolds** — upgrade the Lipschitz graphs, which are already flat at the critical point, to `C¹` embedded disks, and transport them to manifolds. Morse–Smale transversality depends on this step.

- **Morse–Smale moduli and the Morse complex** — perturb to make stable and unstable manifolds transverse, then prove broken-trajectory compactness and gluing to get `∂² = 0`. The acceptance check is spheres and tori, whose Morse functions are already Morse.

- **Fredholm sections and the strip operator** — lift the map-level regular-value theory to Banach bundles and prove `d/ds + A(s)` Fredholm. This needs Lane F1's Sobolev spaces on strips.

- **The Cauchy–Riemann elliptic package** — build `W^{k,p}` spaces on strips, the trace, Calderón–Zygmund estimates, totally real boundary regularity, and the Maslov index for paths with Riemann–Roch. This remains the long pole.

- **Positivity and admissibility in `Sym^g(Σ)`** — turn the basepoint-divisor intersection theory into `n_z(φ) ≥ 0` for holomorphic disks, and state weak admissibility through the Gordan–Stiemke alternatives.

<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b","ts":"2026-09-29T08:26:13+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane M","remaining":"stable manifolds, Morse–Smale moduli spaces, gluing, the Morse differential and homology","state":"partial"},{"id":"Lane F0","remaining":"Fredholm sections of Banach bundles and the strip operator with its index","state":"partial"},{"id":"Lane F1","remaining":"surface and strip Sobolev theory, elliptic and boundary estimates, Maslov index and Riemann–Roch with boundary","state":"untouched"},{"id":"Lane F2","remaining":"local curve theory, compactness, transversality and gluing","state":"partial"},{"id":"Lane F3","remaining":"exact Lagrangian Floer complex, homology and invariance","state":"untouched"},{"id":"Lane F4","remaining":"totally real tori, disk counts, admissibility, holomorphic HF̂ and invariance","state":"partial"},{"id":"Lane F5","remaining":"cylindrical reformulation, bordered and knot Floer homology","state":"untouched"}],"readme_sha":"a442c388e741c9070d26e0faf8b073097c9d2e85fa784d1ba085bf85a0a68174","roadmap":"HeegaardFloer","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `163ce80` (2026-09-29T08:26:13+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Morse–Sard and Sard–Smale are proved, and the symmetric power of a complex curve now has its analytic manifold structure. Morse homology and the remaining nonlinear and holomorphic analysis are partial; no Floer homology or reconciliation theorem is established.

### Named results

- **The Morse–Sard theorem** ([`TauCeti.ContDiff.addHaar_image_criticalPoints_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#TauCeti.ContDiff.addHaar_image_criticalPoints_eq_zero)) — critical values of a sufficiently smooth map between finite-dimensional real normed spaces have additive Haar measure zero.
- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — critical values of a sufficiently smooth Fredholm map on an open subset of a separable Banach space are meagre.
- **The regular-level-set theorem for Fredholm maps** ([`TauCeti.isManifold_levelSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/LevelSet/Manifold.html#TauCeti.isManifold_levelSet)) — a regular level set with surjective Fredholm derivative of constant index `n` is an `n`-dimensional smooth manifold.
- **The Morse lemma** ([`TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/NormalForm.html#TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart)) — a smooth chart puts a function near a nondegenerate critical point into its Hessian quadratic normal form.
- **The analytic manifold theorem for symmetric powers** ([`TauCeti.isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)) — the elementary-symmetric charts make the symmetric power of a Hausdorff complex curve an analytic manifold, including at coincident points.

### Notable definitions and infrastructure

- The [Morse index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Index.html#TauCeti.morseIndex), stable and unstable spectral subspaces, and gradient-flow estimates prepare the local dynamics needed for the stable-manifold theorem; [small linear perturbations](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Generic.html#TauCeti.exists_norm_lt_hasNondegenerateCriticalPointsOn_sub) and [sphere height](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Morse/Sphere/Basic.html#TauCeti.isMorse_sphereHeight) give Morse functions to test against.
- [Symplectic smooth two-forms](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Symplectic/Manifold/TwoForm.html#TauCeti.SmoothTwoForm.IsSymplectic) now encode closedness and fiberwise nondegeneracy, allowing the manifold-level symplectic setting to be stated.
- The [basepoint divisor](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Data/Sym/Basic.html#TauCeti.Sym.basepointDivisor) has local affine equations; holomorphic intersections have positive order, with local finiteness proved for curves contained in a single symmetric chart and not in the divisor.

### Roadmap coverage

Lane M is partial: Morse functions, normal forms, generic perturbations, spectral and flow estimates, and orbit slices exist, but stable manifolds, Morse–Smale moduli spaces, gluing, and homology do not. Lane F0 is partial despite its Sard–Smale and parametric regularity results: Fredholm sections of Banach bundles and the strip operator remain. F1 is untouched. F2 is partial through manifold-level almost complex and symplectic structures, pseudoholomorphic maps, and energy results, without the required curve compactness, transversality, or gluing. F3 has cotangent infrastructure but no Floer complex, so its homology milestone is untouched. F4 is partial through the analytic symmetric power and local basepoint-divisor intersection theory; the totally real tori, admissibility bounds, holomorphic differential, and invariance are missing. F5 and the three reconciliations are untouched.

## The frontier

- **Stable-manifold theorem** — construct local stable and unstable submanifolds for nondegenerate negative-gradient critical points from the spectral splitting and exponential estimates.
- **Morse complex** — establish transverse connecting-orbit moduli spaces, broken-trajectory compactness and gluing, then prove the differential squares to zero; the stable-manifold theorem is an immediate prerequisite.
- **Fredholm sections and strip operators** — extend map-level regularity to Banach-bundle sections and prove the Fredholm and index statements for `d/ds + A(s)`; the strip analysis needs the Sobolev package in F1.
- **Cauchy–Riemann elliptic package** — build surface and strip Sobolev spaces, elliptic and totally real boundary estimates, and Riemann–Roch with boundary before holomorphic moduli spaces can be controlled.
- **Holomorphic Heegaard geometry** — construct the totally real tori and global basepoint intersection theory on the analytic symmetric power, then establish the compactness and transversality needed to count disks.

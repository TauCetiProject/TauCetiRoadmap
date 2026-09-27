<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"6704398b2cce336011717b9d7c800ea9729d50c3","ts":"2026-09-04T20:19:53Z"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `6704398` (2026-09-04T20:19:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Morse–Sard and Sard–Smale summits are complete, and much of Lane F0's abstract nonlinear Fredholm substrate is now available. Lane M, the manifold-level definitions in F2.1, and the symmetric-power geometry in F4.1 are genuinely partial; the Cauchy–Riemann package, every Floer homology theory, holomorphic `HF̂`, Lane F5, and the reconciliations have not begun in the recorded declarations.

### Named results

- **The Morse–Sard theorem** ([`TauCeti.ContDiff.addHaar_image_criticalPoints_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#TauCeti.ContDiff.addHaar_image_criticalPoints_eq_zero)) — the critical values of a sufficiently smooth map between finite-dimensional real normed spaces have additive Haar measure zero.

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — for a sufficiently smooth Fredholm map on an open subset of a separable Banach space, the critical values are meagre, so regular values are dense.

- **The regular-level-set theorem for Fredholm maps** ([`TauCeti.isManifold_levelSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/LevelSet/Manifold.html#TauCeti.isManifold_levelSet)) — a level set with surjective Fredholm derivative of constant index `n` is a smooth manifold modelled on `Fin n → 𝕜`.

- **The Morse lemma** ([`TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/NormalForm.html#TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart)) — near a nondegenerate critical point, a smooth chart identifies the function with its Hessian quadratic form.

- **The Fredholm local normal form** ([`ContinuousLinearMap.FredholmPackage.apply_normalFormOpenPartialHomeomorph_symm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/NormalForm.html#ContinuousLinearMap.FredholmPackage.apply_normalFormOpenPartialHomeomorph_symm)) — in local coordinates a nonlinear Fredholm map splits into its essential coordinate and a finite-dimensional obstruction.

### Notable definitions and infrastructure

- The [Morse index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Index.html#TauCeti.morseIndex), negative-gradient flows, and stable and unstable sets support the dynamical route through Lane M; confined trajectories converge in both time directions under compactness and nondegeneracy hypotheses.

- [Smooth almost complex structures](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.html#TauCeti.SmoothAlmostComplexStructure), [smooth two-forms](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/TwoForm.html#TauCeti.SmoothTwoForm), and [pseudoholomorphic maps](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Symplectic/Manifold/JHolomorphic.html#TauCeti.IsPseudoholomorphic) make the nonlinear Cauchy–Riemann equation and its energy identities stateable on manifolds; closedness of the two-form is not established here.

- The [elementary-symmetric charted-space structure](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower.html#TauCeti.symChartedSpace) equips an `n`th symmetric power with local coefficient charts, providing the topological beginning of the `Sym^g(Σ)` construction but not yet a smooth or complex atlas.

### Roadmap coverage

Lane F0 is advanced but partial: linear Fredholm theory now includes compact-perturbation invariance, and the nonlinear theory includes local normal form, Sard–Smale, parametric regularity, and regular level-set manifolds; the strip operator and a Banach-bundle Fredholm-section package remain. Lane M has the Morse lemma, index, model and global flows, stable-set language, and compactly confined trajectory convergence, but no stable-manifold theorem, Morse–Smale moduli spaces, gluing, differential, or homology. Lane F1 is untouched. F2.1 is partial at the level of manifold structures, pseudoholomorphic maps, and energy, while F2.2–F2.5 are untouched. F3 has only cotangent-model infrastructure and no Floer complex. F4.1 has symmetric-power charts but not the required complex geometry; F4.2–F4.5, F5, all three reconciliations, and all four acceptance criteria remain untouched.

## The frontier

- **Stable-manifold theorem** — turn the Morse normal form and gradient-flow foundations into local stable and unstable submanifolds; this is the nearest missing step in Lane M and precedes the λ-lemma.

- **Morse–Smale moduli spaces** — use finite-dimensional Sard to obtain transverse stable/unstable intersections, then prove broken-trajectory compactness and gluing before defining the differential and showing its square is zero.

- **Fredholm sections and strip operators** — lift the map-level regular-value theory to sections of Banach bundles and prove `d/ds + A(s)` Fredholm with the intended index; the latter depends on the Sobolev and elliptic work of Lane F1.

- **The Cauchy–Riemann elliptic package** — build the required `W^{k,p}` spaces on strips and surfaces, trace and multiplication results, Calderón–Zygmund estimates, totally real boundary regularity, and Riemann–Roch with boundary. This remains the long pole for every holomorphic moduli space.

- **Smooth symmetric powers** — prove smooth or complex compatibility of the elementary-symmetric charts, then construct the `Sym^g(Σ)` geometry, the totally real tori, and the basepoint divisor required by F4.1.

<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"24235056b6507147b26a23ebc76a66597cefa0b9","ts":"2026-10-15T16:37:23Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane M","remaining":"Morse-Smale genericity, compactness and gluing, the Morse complex and its homology, and the stable-manifold theory for pseudo-gradient flows on manifolds","state":"partial"},{"id":"Lane F0","remaining":"Fredholm property and index of the strip operator d/ds + A(s) with invertible asymptotics","state":"partial"},{"id":"Lane F1","remaining":"Sobolev spaces on strips, trace, Calderon-Zygmund, general totally real boundary regularity, Riemann-Roch, Maslov index for paths","state":"partial"},{"id":"Lane F2","remaining":"local theory, the rest of Gromov compactness, transversality and gluing","state":"partial"},{"id":"Lane F3","remaining":"strip moduli in T*M, d^2 = 0, continuation maps, invariance and the T*S^1 computation","state":"partial"},{"id":"Lane F4","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Lane F5","state":"untouched"}],"readme_sha":"a19ecee1601706b1b50adb35a09859c17a721f46fa4ce2d90a1e591db5fe3aa3","roadmap":"HeegaardFloer","to_sha":"24235056b6507147b26a23ebc76a66597cefa0b9"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `2423505` (2026-10-15T16:37:23Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane F0 is done except for the strip operator: it has Morse–Sard, Sard–Smale, and generic manifolds of zeros of Fredholm sections. Lane M has global stable and unstable manifolds and the dimension of trajectory spaces in a vector space, and adapted pseudo-gradients on compact manifolds. Every lane from M to F4 is partial. No chain complex has been built: Morse homology, Floer homology, holomorphic `HF̂`, Lane F5 and the reconciliations have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values. It builds on the finite-dimensional [Morse–Sard theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#ContDiff.addHaar_image_criticalPoints_eq_zero).

- **Generic regular zeros of Fredholm sections** ([`TauCeti.eventually_residual_exists_isManifold_sectionZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero)) — for a residual set of parameters, the zeros of a universal Fredholm section of a Banach bundle form a manifold of dimension the index.

- **The stable-manifold theorem for a Morse critical point** ([`TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold)) — the global stable set of the negative-gradient flow is a `C¹` manifold modelled on the stable Hessian subspace; the [unstable version](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_unstableSet_isManifold) also holds. It is proved for a `C²` function with globally Lipschitz gradient on a finite-dimensional inner product space, not on a manifold.

- **Existence of adapted pseudo-gradients** ([`TauCeti.IsMorse.exists_isAdaptedPseudoGradient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Morse/PseudoGradient/Existence.html#TauCeti.IsMorse.exists_isAdaptedPseudoGradient)) — every Morse function on a compact manifold has a decreasing vector field that is the linear model field near each critical point (Audin–Damian, Proposition 2.2.3).

- **Symmetric powers of Riemann surfaces are complex manifolds** ([`TauCeti.isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)) — the elementary-symmetric charts have analytic transition maps, even where points collide.

### Notable definitions and infrastructure

- Where unstable and stable sets meet transversally, the level slice of their intersection, which is the space of unparametrized trajectories, is a `C¹` submanifold of [dimension the index difference minus one](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/TrajectorySpace.html#TauCeti.IsNondegenerateCriticalPoint.finrank_span_tangentConeAt_unstableSet_inter_stableSet_level_add_morseIndex). It is [discrete](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/TrajectorySpace.html#TauCeti.IsNondegenerateCriticalPoint.isDiscrete_unstableSet_inter_stableSet_level) when the indices differ by one. These are the trajectories the Morse differential will count.

- Weak admissibility is characterized by [positive areas vanishing on periodic domains](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/Admissibility.html#TauCeti.HeegaardRegionSystem.weaklyAdmissible_iff_exists_pos_forall_sum_mul_eq_zero), so only finitely many nonnegative domains join two generators. This is the domain-level half of the Ozsváth–Szabó energy bound.

- The genus-one [lens space diagram](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/LensSpace.html#TauCeti.HeegaardRegionSystem.lensSpace) is weakly admissible, and the class `ε` puts its `p` generators [in bijection with `ℤ/p`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/LensSpace.html#TauCeti.HeegaardRegionSystem.epsilon_lensSpace_bijective), with no domain between distinct generators. This is the combinatorial input to the `HF̂(L(p, q)) = 𝔽^p` acceptance check.

### Roadmap coverage

Lane F0 is done except for the Fredholm property and index of the strip operator `d/ds + A(s)`. Lane M is partial. In a finite-dimensional inner product space with globally Lipschitz gradient, it has the Morse lemma, generic Morse perturbations, convergence of trajectories, global `C¹` stable and unstable manifolds, and the dimension and discreteness of transverse trajectory spaces. The Morse–Smale predicate, a perturbation family and the elementary breaking step are also there. On compact manifolds it has the Morse lemma, finiteness of the critical set and adapted pseudo-gradients. It lacks Morse–Smale genericity, full compactness, gluing and the complex. Lane F1 has supercritical `W^{1,p}` multiplication, the Maslov index for loops, and Schwarz reflection for a constant totally real boundary condition. Lane F2 has F2.1's definitions, energy identities and the mean-value inequality; local theory, transversality and gluing are untouched. Lane F3 has the action functional and the [energy–action identity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Symplectic/Cotangent/Action.html#TauCeti.stdComplexLineEnergy_eq_of_tendstoUniformlyOn) in a linear cotangent space, but no strip moduli. Lane F4 covers F4.1's geometry, Lipshitz's Maslov index and the class `ε` from F4.2, domain-level admissibility from F4.3, and the lens space diagram. Spin^c structures in general, nearly-symmetric `J` and F4.4–F4.5 are untouched. F5, the reconciliations and all acceptance criteria are untouched.

## The frontier

- **Morse–Smale genericity** — show that a generic small perturbation makes every unstable set transverse to every stable set, removing the hypothesis from the trajectory-space results. Sard–Smale and the perturbation family are available.

- **The Morse complex** — prove compactness of the index-one trajectory spaces, so the count is finite, then broken-trajectory compactness and gluing for `∂² = 0`.

- **Morse theory on manifolds** — run the stable-manifold and trajectory-space theory for the flow of an adapted pseudo-gradient on a compact manifold, with spheres and tori as the acceptance check.

- **The strip operator** — show that `d/ds + A(s)` with invertible asymptotics is Fredholm, the first real application of the section package. This needs Lane F1's Sobolev spaces on strips, still the long pole.

- **Spin^c structures and energy in `Sym^g(Σ)`** — identify the group where `ε` lives with `H₁(Y)` in general, define `s_z`, and prove that a holomorphic disk's energy is the area of its domain.

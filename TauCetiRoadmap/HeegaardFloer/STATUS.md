<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a","ts":"2026-10-24T23:22:30Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane M","remaining":"global gluing for the index-two parity count, Morse-Smale genericity, the complex on manifolds, invariance and comparison with singular homology","state":"partial"},{"id":"Lane F0","remaining":"Fredholm property and index of d/ds + A(s) on the strip with A(s) acting on an infinite-dimensional space","state":"partial"},{"id":"Lane F1","remaining":"Sobolev spaces on strips, trace, Calderon-Zygmund, general totally real boundary regularity, Riemann-Roch, spectral flow","state":"partial"},{"id":"Lane F2","remaining":"local theory, bubble trees and boundary Gromov compactness, transversality and gluing","state":"partial"},{"id":"Lane F3","remaining":"strip moduli in T*M, d^2 = 0, continuation maps, invariance and the T*S^1 computation","state":"partial"},{"id":"Lane F4","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Lane F5","state":"untouched"}],"readme_sha":"a19ecee1601706b1b50adb35a09859c17a721f46fa4ce2d90a1e591db5fe3aa3","roadmap":"HeegaardFloer","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `271e1af` (2026-10-24T23:22:30Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Fredholm and Sard–Smale substrate is in place. It includes the trajectory operator `d/ds + A(s)` for finite-dimensional `A`, but not yet the Floer strip. Lane M has a mod-two Morse boundary whose square vanishes once broken index-two trajectories are shown to come in pairs; that global gluing step is the nearest summit. Every lane from M to F4 is partial, and no homology theory has been computed yet. Lane F5 and the reconciliations have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values. It builds on the finite-dimensional [Morse–Sard theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#ContDiff.addHaar_image_criticalPoints_eq_zero).

- **The trajectory operator is Fredholm** ([`TauCeti.WeakDerivStep.isFredholm_trajectoryOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/EnergyEstimate/Fredholm.html#TauCeti.WeakDerivStep.isFredholm_trajectoryOperator)) — for a `C¹` family of symmetric operators on a finite-dimensional space with invertible limits, `u ↦ u' + A u` is Fredholm from `W^{1,2}(ℝ, E)` to `L²(ℝ, E)`. Its index is [the difference of the Morse indices of the limits](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/EnergyEstimate/Index.html#TauCeti.WeakDerivStep.index_trajectoryOperator_eq_finrank_pointSpectralSubspace_sub_finrank).

- **The stable-manifold theorem for a Morse critical point** ([`TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold)) — the global stable set of the negative-gradient flow is a `C¹` manifold modelled on the stable Hessian subspace. It is proved for a `C²` function with globally Lipschitz gradient on a finite-dimensional inner product space; on compact manifolds, adapted pseudo-gradients and slice charts for stable and unstable manifolds are also available.

- **Darboux's theorem** ([`TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Darboux.html#TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq)) — a closed two-form that is nondegenerate at a point is constant in suitable local coordinates. It is proved by Moser's argument from the Poincaré lemma.

- **Symmetric powers of Riemann surfaces are complex manifolds** ([`TauCeti.isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)) — the elementary-symmetric charts have analytic transition maps, even where points collide.

### Notable definitions and infrastructure

- For a residual set of parameters, the zeros of a universal Fredholm section [form a manifold of dimension the index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero), and [zeros of negative index do not occur](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.mem_residual_setOf_forall_section_ne_zero_of_index_neg). This is the transversality engine every lane will call.

- The mod-two Morse boundary counts index-one trajectories, and [its square vanishes exactly when broken index-two trajectories are even in number](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Boundary/Square.html#TauCeti.morseBoundary_comp_morseBoundary_eq_zero_iff). This turns `∂² = 0` into a statement about compactified trajectory spaces.

- The genus-one lens space diagram is weakly admissible, with its `p` generators in bijection with `ℤ/p` and no domain between distinct generators. This is the combinatorial input to the `HF̂(L(p, q)) = 𝔽^p` acceptance check.

### Roadmap coverage

Lane F0 is done except for the strip operator in Floer's setting, where `A(s)` acts on an infinite-dimensional space; the finite-dimensional case and its index are proved. Lane M is partial. In a vector space with compact sublevels it has stable manifolds, trajectory spaces, finite index-one counts, index-two sequential compactness, local gluing near a hyperbolic point and the parity reduction of `∂² = 0`, but neither global gluing nor Morse–Smale genericity. On compact manifolds it has the Morse lemma, adapted pseudo-gradients and Morse–Smale trajectory manifolds, but no complex. Lane F1 has supercritical `W^{1,p}` multiplication, Maslov indices for loops and paths, and Schwarz reflection for constant boundary conditions. Lane F2 has the definitions, Darboux and Moser, the mean-value inequality, energy quantization, finitely many bubbling points and continuous extension across punctures; local theory, transversality and gluing are untouched. Lane F3 has Hamiltonian flows, the action functional and exact graph translations in a linear cotangent space, but no strip moduli. Lane F4 has F4.1's geometry, Lipshitz's Maslov index, the relative grading, domain-level admissibility and the lens space diagram. Lane F5, the reconciliations and all acceptance criteria are untouched.

## The frontier

- **`∂² = 0` for the Morse complex** — glue the local closed-interval models into a compact one-manifold whose boundary is the broken index-two trajectories, then apply the even-boundary count for compact one-manifolds.

- **Morse–Smale genericity** — feed the surjectivity of admissible perturbations into parametric Sard–Smale, so that transversality becomes a theorem rather than a hypothesis.

- **Morse homology on manifolds** — carry the complex to the flow of an adapted pseudo-gradient on a compact manifold, with spheres and tori as the acceptance check, then continuation and invariance.

- **The Floer strip operator** — prove the Fredholm property of `d/ds + A(s)` when `A(s)` is an unbounded operator on an infinite-dimensional space. This needs Lane F1's Sobolev spaces on strips, still the long pole.

- **Spin^c structures and energy in `Sym^g(Σ)`** — identify the group where `ε` lives with `H₁(Y)` in general, define `s_z`, and prove that a holomorphic disk's energy is the area of its domain.

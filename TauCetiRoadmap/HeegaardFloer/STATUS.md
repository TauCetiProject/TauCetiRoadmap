<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f","ts":"2026-11-07T17:18:46Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"global gluing for mod-two d^2 = 0, integral orientations and the complex, singular comparison, continuation, Bott theory, products, Witten comparison","state":"partial"},{"id":"Lane M","remaining":"global gluing for mod-two d^2 = 0, integral orientations and the complex, singular comparison, continuation, Bott theory, products, Witten comparison","state":"partial"},{"id":"Layer 2","remaining":"relative Morse-Smale genericity, regularity-loss comparisons, closed-return and Bott genericity, the infinite-dimensional strip operator","state":"partial"},{"id":"Layer 3","remaining":"Sobolev adapters on strips, spectral flow equals index, Conley-Zehnder conventions, determinant-line orientations, weighted Riemann-Roch","state":"partial"},{"id":"Layer 4","remaining":"local theory, bubble trees and boundary Gromov compactness, transversality, gluing, sphere and four-dimensional applications","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in T*M, d^2 = 0, continuation maps, invariance and the T*S^1 computation","state":"partial"},{"id":"Layer 6","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f014b850362ce327a3fbae8ba3cb6d2242808ad9ce25327e9607c973a540de3e","roadmap":"HeegaardFloer","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `c9dbc67` (2026-11-07T17:18:46Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is finished. The transversality engine of Layer 2 (Sard, Sard–Smale and generic zeros of Fredholm sections) is the most complete piece. Morse homology has a mod-two boundary on compact manifolds but not yet `∂² = 0`. Layers 3–6 have scattered foundations without moduli spaces, and Layers 7 and 8 have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on a Lindelöf subset of a Banach space has meagre critical values. On Banach manifolds it is proved [at Smale's sharp regularity](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Sard/Fredholm.html#ContMDiff.isMeagre_image_criticalPoints_of_index_le_two), but only for index at most two.

- **Fredholm trajectory operators** ([`TauCeti.WeakDerivStep.isFredholm_trajectoryOperator_of_hasLyapunovForm`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/EnergyEstimate/Lyapunov.html#TauCeti.WeakDerivStep.isFredholm_trajectoryOperator_of_hasLyapunovForm)) — on a finite-dimensional space, `u ↦ u' + A u` is Fredholm from `W^{1,2}` to `L²` when the limits of `A` are hyperbolic. Along a gradient trajectory its index is [the difference of the Morse indices](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Fredholm.html#IsIntegralCurve.index_trajectoryOperator_hessianOperator).

- **The stable-manifold theorem for a Morse critical point** ([`TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold)) — the global stable set of the negative-gradient flow is a manifold modelled on the stable Hessian subspace. This is proved in a vector space with Lipschitz gradient; on compact manifolds the analogue is proved for adapted pseudo-gradients.

- **Darboux's theorem** (`TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq`) — a closed two-form that is nondegenerate at a point is constant in suitable local coordinates, proved by Moser's argument.

- **Symmetric powers of Riemann surfaces are complex manifolds** ([`TauCeti.isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)) — the elementary-symmetric charts have analytic transitions, even where points collide.

### Notable definitions and infrastructure

- For a residual set of parameters, the zeros of a universal Fredholm section [form a manifold of dimension the index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero). Every moduli space in the roadmap will be cut out by this result.

- On a compact manifold with a Morse–Smale adapted pseudo-gradient, the mod-two Morse boundary counts unparametrized trajectories, and [its square vanishes exactly when broken index-two trajectories are even in number](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Square.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary_eq_zero_iff). Its boundary is already computed to vanish on spheres and the torus.

- The genus-one lens space diagram is weakly admissible, with its `p` generators in bijection with `ℤ/p` and no domain between distinct generators. This is the combinatorial input to the `HF̂(L(p, q)) = 𝔽^p` check.

### Roadmap coverage

Layer 1 (Lane M) is partial. It has stable manifolds, trajectory spaces, broken compactness and local gluing in a Morse box, plus the mod-two boundary on compact manifolds and the Witten differential with `d_t² = 0`. Global gluing, the integral complex with orientations (§1.3), the singular comparison, continuation, the Bott theory, products and the Witten comparison are all missing. Layer 2 is partial: it has Sard on manifolds, Sard–Smale, Fredholm sections, determinant lines and finite-dimensional trajectory operators, but not relative Morse–Smale genericity (§2.6) or §§2.7–2.9. Layer 3 is partial. It has Maslov indices of totally real and symplectic loops, regular crossings, the tanh and neck examples, and the disc kernel for rotating-line boundaries, but no strip Sobolev theory, spectral flow, Conley–Zehnder index or weighted Riemann–Roch. Layer 4 has foundations, Darboux, energy quantization, the Fubini–Study form and `UT(S²) ≅ SO(3)`, but no local theory, transversality or gluing. Layer 5 has action and energy only in a linear cotangent space, plus a Neumann maximum principle on the strip. Layer 6 has `Sym^g(Σ)`, the Maslov index, admissibility and the lens space diagram, but no spin^c structures in general and no `HF̂`. Layers 7 and 8 are untouched.

## The frontier

- **`∂² = 0` for the mod-two Morse complex** — join the Morse-box gluing models into a compact one-manifold whose ends are the broken index-two trajectories, then apply the even endpoint count.

- **Morse–Smale genericity** — feed the surjectivity of admissible perturbations into parametric Sard–Smale, so that transversality becomes a theorem rather than a hypothesis (§2.6).

- **The integral Morse complex** — orient unstable manifolds, prove the face-sign formula, and check the sphere, the torus and `ℝP²` over `ℤ` (§1.3).

- **The Floer strip operator** — prove the Fredholm property of `d/ds + A(s)` when `A(s)` is unbounded on an infinite-dimensional space. This needs Layer 3's Sobolev spaces on strips, still the long pole.

- **Spin^c structures and energy in `Sym^g(Σ)`** — identify the group where `ε` lives with `H₁(Y)` in general and prove that a holomorphic disk's energy is the area of its domain.

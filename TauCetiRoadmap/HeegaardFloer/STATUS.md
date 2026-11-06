<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"d406259a890e9a86ec475a6713071e36e0355114","ts":"2026-11-06T01:27:37Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"global gluing for d^2 = 0 on manifolds, Morse-Smale genericity, integral orientations, continuation, Bott complexes, products and comparisons","state":"partial"},{"id":"Lane M","remaining":"global gluing for d^2 = 0 on manifolds, Morse-Smale genericity, integral orientations, continuation, Bott complexes, products and comparisons","state":"partial"},{"id":"Layer 2","remaining":"the Floer strip operator with infinite-dimensional A(s), Morse-Smale and Bott genericity, regularity-loss comparisons","state":"partial"},{"id":"Layer 3","remaining":"Sobolev spaces on strips, totally real boundary regularity, general Riemann-Roch with weighted ends, spectral flow","state":"partial"},{"id":"Layer 4","remaining":"local theory, Gromov compactness with boundary, transversality, gluing and the sphere-domain sections","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in T*M, d^2 = 0, continuation maps, invariance","state":"partial"},{"id":"Layer 6","remaining":"Spin^c structures in general, nearly-symmetric J, the HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","remaining":"the strands differential and matched-circle algebra, and all cylindrical, bordered and knot curve theory","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f7df5b538dc115870d446064a1b6571dc437dcf60451398d17dea86d22651676","roadmap":"HeegaardFloer","to_sha":"d406259a890e9a86ec475a6713071e36e0355114"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `d406259` (2026-11-06T01:27:37Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Fredholm, Sard–Smale and Calderón–Zygmund foundations are in place. Mod-two Morse homology is one global gluing step short of `∂² = 0` on compact manifolds, and only the sphere has been computed. Every layer from 1 to 6 is partial and no Floer homology exists yet. Layer 7 has only algebraic scaffolding, and Layer 8's reconciliations have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values.

- **The linearization along a gradient trajectory is Fredholm** ([`IsIntegralCurve.isFredholm_trajectoryOperator_hessianOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Fredholm.html#IsIntegralCurve.isFredholm_trajectoryOperator_hessianOperator)) — for a `C³` function on a finite-dimensional space, the operator `d/ds + Hess f(γ(s))` along a trajectory between nondegenerate critical points is Fredholm, with [index the difference of their Morse indices](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Fredholm.html#IsIntegralCurve.index_trajectoryOperator_hessianOperator).

- **The stable-manifold theorem for a Morse critical point** ([`TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold)) — for a `C^(n+1)` function with globally Lipschitz gradient, the global stable set is a `C^n` manifold modelled on the stable Hessian subspace.

- **The Calderón–Zygmund inequality for `∂̄`** ([`TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)) — for `1 < p < ∞`, the full derivative of a Schwartz map on `ℂ` is bounded in `L^p` by its Cauchy–Riemann derivative. It is proved through Mihlin's multiplier theorem.

- **Darboux's theorem** (`TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq`) — a closed two-form that is nondegenerate at a point is constant in suitable local coordinates.

### Notable definitions and infrastructure

- On a compact manifold with a Morse–Smale adapted pseudo-gradient, the [mod-two Morse boundary](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Basic.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary) counts index-one trajectories, and [its square vanishes exactly when broken index-two trajectories are even in number](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Square.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary_eq_zero_iff). This turns `∂² = 0` into a statement about compactified trajectory spaces.

- For a residual set of parameters, the zeros of a universal Fredholm section [form a manifold of dimension the index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero). This is the transversality engine every layer will call.

- On the unit disc with boundary values on a line turning with Maslov index `k`, the [kernel of `∂̄`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UnitDisc/RotatingLineBoundary.html#TauCeti.unitDiscCauchyRiemannKernel) [has dimension `k + 1`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UnitDisc/RotatingLineBoundary.html#TauCeti.finrank_unitDiscCauchyRiemannKernel). This is the model case of boundary Riemann–Roch, which the index of a holomorphic disc will reduce to.

### Roadmap coverage

Layer 1 (Lane M) is partial. In a vector space it has stable and unstable manifolds, trajectory spaces, finite index-one counts, index-two compactness and local gluing. On compact manifolds it now has the Morse–Smale trajectory manifolds, finite broken counts, the boundary operator and the sphere computation. Global gluing, Morse–Smale genericity, integral orientations, continuation, Bott complexes, products and every comparison theorem are missing. Layer 2 has Sard–Smale, the parametric transversality engine, determinant lines and the finite-dimensional trajectory operator, but neither the Floer strip operator nor the genericity statements. Layer 3 has Calderón–Zygmund on the plane, the disc Riemann–Roch model, Maslov indices and crossing-form jumps, but not Sobolev spaces on strips, totally real boundary regularity, general Riemann–Roch or spectral flow. Layer 4 has its symplectic foundations, the Wirtinger inequality, energy quantization, bubbling points and cross ratios for sphere domains. Its local theory, transversality and gluing are untouched. Layer 5 has no-escape for strips and the identification of time-independent strips with gradient lines, but no strip moduli. Layer 6 has the symmetric-product geometry, the relative grading and the lens space diagram. Layer 7 has a strands algebra without its differential, plus type `D` structures with the box tensor product, and none of its curve theory. Layer 8 is untouched.

## The frontier

- **`∂² = 0` for the Morse complex on manifolds** — glue the local transverse-disc models into a compact one-manifold whose ends are the broken index-two trajectories, then apply the even endpoint count, which is already proved.

- **Morse–Smale genericity** — turn transversality from a hypothesis into a theorem through the parametric Sard–Smale engine. After that, continuation maps and invariance, with tori as the next acceptance check.

- **The Floer strip operator** — prove that `d/ds + A(s)` is Fredholm when `A(s)` is unbounded on an infinite-dimensional space. This needs Sobolev spaces on strips and totally real boundary regularity on top of the planar Calderón–Zygmund estimate.

- **Spectral flow and Riemann–Roch** — sum the crossing-form jumps along a path to get spectral flow, and extend the disc model to general totally real boundary conditions.

- **Exact Lagrangian Floer homology in `T*M`** — build the strip moduli spaces and their compactness. No-escape and the gradient-line identification supply the confinement and the Morse comparison.

<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"global gluing for the index-two parity count, Morse-Smale genericity, integral orientations, invariance, Bott complexes and the M.4 to M.10 comparisons","state":"partial"},{"id":"Lane M","remaining":"global gluing for the index-two parity count, Morse-Smale genericity, integral orientations, invariance, Bott complexes and the M.4 to M.10 comparisons","state":"partial"},{"id":"Layer 2","remaining":"the Floer strip operator with infinite-dimensional A(s), the determinant line bundle, Morse-Smale and Bott genericity, closed-return genericity","state":"partial"},{"id":"Layer 3","remaining":"interior W^{1,p} estimates, Sobolev spaces on strips, totally real boundary regularity, spectral flow, general Riemann-Roch","state":"partial"},{"id":"Layer 4","remaining":"local theory, boundary Gromov compactness, transversality and gluing, showing PSL(2, C) gives all sphere automorphisms, nonsqueezing","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in a Liouville domain, d^2 = 0, continuation maps and invariance","state":"partial"},{"id":"Layer 6","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","remaining":"the strands algebra of a matched circle, cylindrical curves, bordered modules and pairing, knot Floer theory","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f7df5b538dc115870d446064a1b6571dc437dcf60451398d17dea86d22651676","roadmap":"HeegaardFloer","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Fredholm and Sard–Smale substrate is in place, but not yet the Floer strip operator. Layer 1 has a mod-two Morse boundary on compact manifolds whose square vanishes once broken index-two trajectories are shown to pair up; that global gluing step is the nearest summit. Layers 1 to 7 are all partial, no Floer-type homology has been computed in general, and the reconciliations of Layer 8 have not begun.

### Named results

- **The Sard–Smale theorem** ([`isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values.

- **The Morse trajectory operator is Fredholm** ([`isFredholm_trajectoryOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/EnergyEstimate/Fredholm.html#TauCeti.WeakDerivStep.isFredholm_trajectoryOperator)) — for symmetric operators on a finite-dimensional space with invertible limits, `u ↦ u' + A u` is Fredholm from `W^{1,2}` to `L²`; along a gradient trajectory of a `C³` function its [index is the difference of the Morse indices](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Fredholm.html#IsIntegralCurve.index_trajectoryOperator_hessianOperator).

- **The stable-manifold theorem for a Morse critical point** ([`exists_stableSet_isManifold`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold)) — for a globally `C^(n+1)` function with Lipschitz gradient on a finite-dimensional inner product space, the global stable set is a `C^n` manifold modelled on the stable Hessian subspace.

- **The Calderón–Zygmund inequality for `∂̄`** ([`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)) — for `1 < p < ∞`, the `Lᵖ` norm of the derivative of a map on the plane is controlled by the `Lᵖ` norm of its Cauchy–Riemann derivative.

- **Symmetric powers of Riemann surfaces are complex manifolds** ([`isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)) — the elementary-symmetric charts have analytic transition maps, even where points collide.

### Notable definitions and infrastructure

- For a residual set of parameters, the zeros of a universal Fredholm section [form a manifold of dimension the index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero). Every moduli space will use this.

- On a compact manifold with a Morse–Smale adapted pseudo-gradient, the [mod-two Morse boundary](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Basic.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary) counts index-one trajectories, and [its square vanishes exactly when broken index-two trajectories are even in number](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Square.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary_eq_zero_iff). This turns `∂² = 0` into a statement about compactified trajectory spaces.

- The [Maslov index of a loop of symplectic matrices](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/SymplecticGroup/Maslov.html#TauCeti.GLSymplectic.maslovIndex), with the homotopy, product, direct-sum and normalization axioms, joins the earlier index for loops of totally real subspaces.

### Roadmap coverage

Layer 1 (Lane M) is partial. It has stable manifolds and trajectory spaces, and on compact manifolds the boundary operator, index-two sequential compactness, local gluing in a Morse box and the parity reduction of `∂² = 0`. Global gluing, Morse–Smale genericity, integral orientations, invariance and everything from M.4 onward are missing. Layer 2 is partial: Sard, Sard–Smale, generic section zeros and the finite-dimensional trajectory operator are done, and the determinant line of a single Fredholm operator exists with local stabilization of families; the determinant line bundle, the Floer strip operator, and Bott and closed-return genericity are not. Layer 3 is partial: Maslov indices, crossing forms, Schwarz reflection, planar Calderón–Zygmund and the disc kernel count for rotating-line boundaries, but no interior estimate, Sobolev spaces on strips, spectral flow or general Riemann–Roch. Layer 4 is partial: Darboux, Wirtinger, energy quantization, bubbling points, the four-dimensional self-dual description of compatible structures, and, from §4.6a, the Fubini–Study form, the continuous Möbius action and its sharp triple transitivity; local theory, transversality and gluing are untouched. Layer 5 is partial (action and energy in a linear cotangent space, no escape for strips), with no strip moduli. Layer 6 is partial: `Sym^g(Σ)` geometry, Lipshitz's Maslov index, domain-level admissibility and the lens space diagram, but no spin^c structures and no `HF̂` complex. Layer 7 has only type `D` structures and their box tensor product. Layer 8 is untouched.

## The frontier

- **`∂² = 0` for the mod-two Morse complex**: glue the local Morse-box models into a compact one-manifold whose boundary is the broken index-two trajectories, then apply the even-endpoint count already available.

- **Morse–Smale genericity**: feed the surjectivity of admissible perturbations into parametric Sard–Smale, so that transversality becomes a theorem rather than a hypothesis.

- **Interior Cauchy–Riemann estimates**: localize the planar Calderón–Zygmund inequality to the `W^{1,p}(K)` bound of §3.2, then add variable coefficients and totally real boundary conditions.

- **The Floer strip operator**: prove the Fredholm property of `d/ds + A(s)` when `A(s)` is unbounded on an infinite-dimensional space. This needs Sobolev spaces on strips from §3.1.

- **Spin^c structures and energy in `Sym^g(Σ)`**: identify the group where `ε` lives with `H₁(Y)` in general, define `s_z`, and prove that a holomorphic disk's energy is the area of its domain.

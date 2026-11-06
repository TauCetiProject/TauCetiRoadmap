<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"6b391d7924044abbf36eec52a61dece9f9999e16","ts":"2026-11-05T21:11:17Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"global gluing for the index-two parity count, orientations, invariance, Bott complexes and the singular and Witten comparisons","state":"partial"},{"id":"Lane M","remaining":"global gluing for the index-two parity count, orientations, invariance, Bott complexes and the singular and Witten comparisons","state":"partial"},{"id":"Layer 2","remaining":"Morse-Smale genericity, the strip operator with infinite-dimensional A(s), closed-return and Bott genericity","state":"partial"},{"id":"Layer 3","remaining":"Sobolev surface adapters, general totally real boundary regularity, Riemann-Roch with weighted ends, spectral flow","state":"partial"},{"id":"Layer 4","remaining":"local theory, bubble trees and boundary Gromov compactness, transversality, gluing and nonsqueezing","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in T*M, d^2 = 0, continuation maps and invariance","state":"partial"},{"id":"Layer 6","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f7df5b538dc115870d446064a1b6571dc437dcf60451398d17dea86d22651676","roadmap":"HeegaardFloer","to_sha":"6b391d7924044abbf36eec52a61dece9f9999e16"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `6b391d7` (2026-11-05T21:11:17Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Fredholm and Sard–Smale substrate is in place, and Morse homology on compact manifolds has a mod-two boundary whose square vanishes once broken index-two trajectories are shown to pair up. No homology theory has been computed in general. The Cauchy–Riemann, holomorphic-curve, exact Floer and Heegaard layers are all partial, with foundations but no moduli spaces. The cylindrical, bordered and knot layer and the reconciliations have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values.

- **The linearized operator along a gradient trajectory is Fredholm** ([`IsIntegralCurve.isFredholm_trajectoryOperator_hessianOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Fredholm.html#IsIntegralCurve.isFredholm_trajectoryOperator_hessianOperator)) — for a `C³` function on a finite-dimensional inner product space, its [index is the difference of the Morse indices](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Fredholm.html#IsIntegralCurve.index_trajectoryOperator_hessianOperator) of the ends.

- **The stable-manifold theorem for a Morse critical point** ([`TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold)) — the global stable set of the negative-gradient flow is an embedded manifold modelled on the stable Hessian subspace, for a function with globally Lipschitz gradient.

- **The Calderón–Zygmund inequality for `∂̄`** ([`TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)) — for `1 < p < ∞`, the `Lᵖ` norm of the full derivative is controlled by the Cauchy–Riemann operator alone.

- **Riemann–Roch for the disc with a rotating-line boundary** ([`TauCeti.finrank_unitDiscCauchyRiemannKernel`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UnitDisc/RotatingLineBoundary.html#TauCeti.finrank_unitDiscCauchyRiemannKernel)) — with boundary on `w^{k/2}ℝ`, the holomorphic solutions form a real space of dimension `k + 1`, which is zero for negative Maslov index.

### Notable definitions and infrastructure

- For a residual set of parameters, the zeros of a universal Fredholm section [form a manifold of dimension the index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero). This is the transversality engine every moduli space will call.

- The [mod-two Morse boundary on a compact manifold](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Basic.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary), defined for Morse–Smale adapted pseudo-gradients, [squares to zero exactly when broken index-two trajectories are even in number](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Square.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary_eq_zero_iff). This turns `∂² = 0` into a statement about compactified trajectory spaces.

- [Determinant lines of Fredholm operators](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/DeterminantLine.html#ContinuousLinearMap.IsFredholm.finrank_detLine) are the carrier for the integral orientations the roadmap keeps throughout.

### Roadmap coverage

Layer 1 (Lane M) is partial. On compact manifolds it has the Morse lemma, adapted pseudo-gradients, Morse–Smale trajectory manifolds, finite index-one and broken counts, index-two compactness, local gluing through transverse discs and the parity reduction of `∂² = 0`. The sphere's height function has zero boundary. Global gluing, orientations, continuation, Bott theory and every comparison are absent. Layer 2 is partial: Sard, Sard–Smale, Fredholm sections, determinant lines and the finite-dimensional trajectory operator are proved, but Morse–Smale genericity and the strip, closed-return and Bott genericity sections are not. Layer 3 is partial, with Calderón–Zygmund, the model disc kernel, Maslov indices, constant-boundary Schwarz reflection and crossing forms. Sobolev adapters on surfaces, general Riemann–Roch, weighted ends and spectral flow remain. Layer 4 is partial: Darboux, the Wirtinger inequality, energy quantization, convergence off finitely many bubbling points and the Möbius geometry of the sphere, but no local theory, transversality or gluing. Layer 5 has the action, a no-escape principle and gradient-line strips, but no strip complex. Layer 6 has the symmetric-product geometry, Lipshitz's index, admissibility and the lens space diagram, but no `HF̂`. Layers 7 and 8 are untouched.

## The frontier

- **`∂² = 0` for Morse homology on a compact manifold** — assemble the local gluing models into a compact one-manifold whose ends are the broken index-two trajectories. The even-endpoint count for such spaces is already proved.

- **Morse–Smale genericity** — feed the surjectivity of admissible perturbations into parametric Sard–Smale, so that transversality becomes a theorem rather than a hypothesis.

- **The Floer strip operator** — prove Fredholmness of `d/ds + A(s)` when `A(s)` acts on an infinite-dimensional space. This needs Layer 3's Sobolev spaces on strips and surfaces.

- **Riemann–Roch beyond the model disc** — pass from rotating-line boundary conditions to general totally real bundles, and from crossing forms to spectral flow.

- **Spin^c structures and energy in `Sym^g(Σ)`** — identify the group carrying `ε` with `H₁(Y)` in general and prove that a holomorphic disk's energy is the area of its domain; the Wirtinger inequality is the pointwise input.

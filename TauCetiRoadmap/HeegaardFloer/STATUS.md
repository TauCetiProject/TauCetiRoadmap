<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"3a0189695d62134a412200ef4237d0bbb2e95d75","ts":"2026-11-07T02:52:26+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"global gluing for the index-two parity count, integral orientations, continuation and invariance, Bott complexes, products, Witten and singular comparisons","state":"partial"},{"id":"Lane M","remaining":"global gluing for the index-two parity count, integral orientations, continuation and invariance, Bott complexes, products, Witten and singular comparisons","state":"partial"},{"id":"Layer 2","remaining":"the Floer strip operator, generic Morse-Smale metrics, regularity-loss comparisons, closed-return and Bott genericity","state":"partial"},{"id":"Layer 3","remaining":"Sobolev spaces on strips and weighted ends, Calderon-Zygmund beyond Schwartz functions, spectral flow, general Riemann-Roch","state":"partial"},{"id":"Layer 4","remaining":"local theory, Gromov compactness, transversality, gluing, sphere automorphisms and simple curves, nonsqueezing, compact Lagrangian discs","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in a Liouville domain, d^2 = 0, continuation maps and invariance","state":"partial"},{"id":"Layer 6","remaining":"Spin^c structures in general, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","remaining":"cylindrical curves, bordered algebra gradings and type A modules, bordered pairing, knot Floer homology","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f014b850362ce327a3fbae8ba3cb6d2242808ad9ce25327e9607c973a540de3e","roadmap":"HeegaardFloer","to_sha":"3a0189695d62134a412200ef4237d0bbb2e95d75"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `3a01896` (2026-11-07T02:52:26+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Fredholm and Sard–Smale substrate is in place, and on compact manifolds Lane M has every local ingredient of the mod-two Morse complex, but `∂² = 0` is not yet proved outright. Layers 1 through 7 are all partial, and none has computed a homology theory yet. Layer 7 has only the algebraic type `D` interface, and the reconciliations of Layer 8 have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values.

- **The linearised gradient-trajectory operator is Fredholm** ([`IsIntegralCurve.index_trajectoryOperator_hessianOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Fredholm.html#IsIntegralCurve.index_trajectoryOperator_hessianOperator)) — along a negative gradient trajectory of a `C³` function between nondegenerate critical points, `d/ds + Hess f(γ(s))` is Fredholm. Its index is `ind p − ind q`, the dimension count every Morse moduli space uses.

- **The Calderón–Zygmund inequality for `∂̄`** ([`TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)) — for `1 < p < ∞`, the `L^p` norm of the derivative of a Schwartz function on the plane is bounded by that of its `∂̄`. It is proved for Schwartz functions only, not yet for Sobolev maps or with boundary conditions.

- **The Maslov index of symplectic loops** ([`TauCeti.GLSymplectic.maslovIndex_scalarRotationLoop`](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/SymplecticGroup/Maslov.html#TauCeti.GLSymplectic.maslovIndex_scalarRotationLoop)) — defined through the polar decomposition and the determinant. It satisfies homotopy invariance, the product and direct-sum axioms, and the normalisation that the rotation loop in `U(n)` has index `n`.

- **Darboux's theorem** (`TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq`) — a closed two-form that is nondegenerate at a point is constant in suitable local coordinates, by Moser's argument.

### Notable definitions and infrastructure

- For a residual set of parameters, the zeros of a universal Fredholm section [form a manifold of dimension the index](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero). This is the transversality engine every lane will call.

- The mod-two Morse boundary on a compact manifold. [Its square vanishes exactly when broken index-two trajectories are even in number](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Boundary/Square.html#TauCeti.morseBoundary_comp_morseBoundary_eq_zero_iff), and a [broken trajectory glues inside a Morse chart](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Stable/Gluing.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.exists_homeomorph_closure_splitGluingPairs). Together they turn `∂² = 0` into a count of endpoints of compact one-manifolds.

- The Riemann sphere as a symplectic domain. It has the [Fubini–Study form of area one](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/OnePoint/FubiniStudy.html#OnePoint.integral_fubiniStudyDensity) and a [jointly continuous `PSL(2, ℂ)` action](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/OnePoint/ContinuousSMul.html#OnePoint.instContinuousSMulPSL) that is sharply triply transitive, and the cross ratio classifies quadruples of points. This is the start of the sphere-curve theory behind nonsqueezing.

### Roadmap coverage

Layer 1 (Lane M) is partial. On compact manifolds it has stable and unstable manifolds, Morse–Smale trajectory manifolds, finite index-one counts, broken compactness, local gluing and the parity reduction. The sphere is computed. Still missing are global gluing, integral orientations, continuation, the Bott, product and Witten comparisons, and comparison with singular homology. Layer 2 is partial. It has sharp Sard, Sard–Smale, parametric transversality, determinant lines and the finite-dimensional trajectory operator, but not the strip operator, generic Morse–Smale metrics or Bott genericity. Layer 3 is partial. It has supercritical `W^{1,p}` multiplication, Calderón–Zygmund for Schwartz functions, Maslov indices, crossing forms and the rotating-line disc kernel. Weighted strip Sobolev spaces, spectral flow and general Riemann–Roch remain. Layer 4 is partial. It has the linear foundations, Darboux, the Wirtinger inequality, energy quantization, bubbling points, a four-dimensional compatible-`J` criterion and the start of 4.6a. Local theory, transversality, gluing, nonsqueezing and 4.7 are untouched. Layer 5 is partial: Hamiltonian flows, the action functional, no-escape for strips, and time-independent Floer strips identified with gradient lines. There is no strip moduli space. Layer 6 is partial. It has the symmetric-product charts and embeddings, Lipshitz's Maslov index, the relative grading, positivity criteria for admissibility and the lens space diagram. Layer 7 has only type `D` structures and their box tensor, and Layer 8 is untouched.

## The frontier

- **`∂² = 0` for the Morse complex** — assemble the Morse-chart gluing into a compact one-manifold whose endpoints are the broken index-two trajectories, then apply the even-endpoint count.

- **Morse–Smale genericity** — feed the surjectivity of admissible perturbations into parametric Sard–Smale, so that transversality becomes a theorem rather than a hypothesis.

- **The Floer strip operator** — prove `d/ds + A(s)` Fredholm when `A(s)` is unbounded on an infinite-dimensional space. This needs Calderón–Zygmund extended from Schwartz functions to Sobolev maps on strips with totally real boundary.

- **Sphere automorphisms** — identify `PSL(2, ℂ)` with all biholomorphisms of the sphere and build the stabilisers, the next step of 4.6a towards simple sphere curves.

- **Spinᶜ structures and energy in `Sym^g(Σ)`** — define `s_z` in general and prove that a holomorphic disk's energy is the area of its domain.

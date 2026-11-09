<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe","ts":"2026-11-09T11:59:37+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"charts at broken ends for d^2 = 0, Morse-Smale genericity, integral orientations, invariance, Bott complexes and the M.4 to M.10 comparisons","state":"partial"},{"id":"Lane M","remaining":"charts at broken ends for d^2 = 0, Morse-Smale genericity, integral orientations, invariance, Bott complexes and the M.4 to M.10 comparisons","state":"partial"},{"id":"Layer 2","remaining":"sharp Sard and Sard-Smale in higher codimension and index, weighted 2.4 theory, the Floer strip operator, the determinant line bundle, Morse-Smale, Bott and closed-return genericity","state":"partial"},{"id":"Layer 3","remaining":"W^{1,p} and bundle versions of the interior estimates, Sobolev spaces on strips, totally real boundary estimates, Hilbert-space spectral flow, general Riemann-Roch","state":"partial"},{"id":"Layer 4","remaining":"local theory, boundary Gromov compactness, transversality and gluing, nonsqueezing","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in a Liouville domain, d^2 = 0, continuation maps and invariance","state":"partial"},{"id":"Layer 6","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","remaining":"the algebra of a matched circle, cylindrical curves, bordered modules and pairing, knot Floer theory","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f014b850362ce327a3fbae8ba3cb6d2242808ad9ce25327e9607c973a540de3e","roadmap":"HeegaardFloer","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `d92acc5` (2026-11-09T11:59:37+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Fredholm theory, Sard–Smale and parametric transversality exist, with Sard–Smale at sharp regularity only in index at most two, but the Floer strip operator does not yet. Layer 1 has a mod-two Morse complex on compact manifolds, together with Künneth and duality statements, but `∂² = 0` is still conditional on gluing at broken ends. Layers 1 to 7 are partial, no Floer-type homology has been constructed in general, and Layer 8 has not begun.

### Named results

- **The Sard–Smale theorem** ([`isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on a Lindelöf subset of a Banach space has meagre critical values. When the index is at most two, it holds at [Smale's sharp regularity](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm_of_index_le_two) `C^k` with `k > max(index, 0)`.

- **Fredholmness of the trajectory operator with hyperbolic limits** ([`isFredholm_trajectoryOperator_of_hasLyapunovForm`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/EnergyEstimate/Lyapunov.html#TauCeti.WeakDerivStep.isFredholm_trajectoryOperator_of_hasLyapunovForm)) — for continuous coefficients on a finite-dimensional space whose limits are hyperbolic, `u ↦ u' + A u` is Fredholm from `W^{1,2}` to `L²`. Along a gradient trajectory its [index is the difference of the Morse indices](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Fredholm.html#IsIntegralCurve.index_trajectoryOperator_hessianOperator).

- **The Calderón–Zygmund inequality for `∂̄`** ([`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)) — for `1 < p < ∞` and Schwartz maps on the plane, `‖Du‖_{Lᵖ} ≤ C ‖∂̄u‖_{Lᵖ}`. Localized, it gives the [interior estimate](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/InteriorEstimate.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv_add_eLpNorm) for smooth maps.

- **The Künneth formula for the mod-two Morse complex** ([`morseChainSeparatedSumEquiv_comp_morseBoundary`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Boundary/Prod.html#TauCeti.morseChainSeparatedSumEquiv_comp_morseBoundary)) — for `f(x) + g(y)` on Euclidean spaces, the chains are a tensor product and `∂ = ∂ ⊗ 1 + 1 ⊗ ∂`.

- **The strands algebra is a differential algebra** ([`differential_differential`](https://taucetiproject.org/docs/TauCeti/LowDimTopology/Bordered/StrandsAlgebra/Differential.html#TauCeti.StrandsAlgebra.differential_differential)) — in characteristic two, resolving crossings gives a differential on `A(n)` that squares to zero and satisfies the Leibniz rule.

### Notable definitions and infrastructure

- For a residual set of parameters, the zeros of a universal Fredholm section [form a manifold of dimension the index](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero). Every moduli space will need this.

- The [mod-two Morse boundary](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Basic.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary) on compact manifolds, with [`∂² = 0` reduced to a parity count](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Square.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary_eq_zero_iff) of broken index-two trajectories. This turns the main identity into a statement about one compactified space.

- [Symmetric powers of Riemann surfaces are complex manifolds](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace), even where points collide. This is the ambient space of Layer 6.

### Roadmap coverage

Layer 1 (Lane M) is partial. Its pieces are stable manifolds, unparametrized trajectory manifolds, the mod-two boundary, the opposite-function duality and Euclidean Künneth, sequential compactness, and a compactified index-two space that is one-dimensional at unbroken trajectories. The [Witten complex](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/Witten.html#TauCeti.wittenComplex) also exists, without its Laplacian. Still missing are charts at the broken ends, Morse–Smale genericity, integral orientations, invariance, Bott complexes and the M.4–M.10 comparisons. Layer 2 is partial. Sard and Sard–Smale are sharp only in codimension or index at most two. Global parametric transversality and §2.4's finite-dimensional Fredholm theorem are done, though without weights. The determinant line bundle, the Floer strip operator and Bott and closed-return genericity are missing. Layer 3 is partial: it has Maslov indices, crossing forms, Calderón–Zygmund and interior estimates for smooth maps, but not the `W^{1,p}`, bundle or boundary estimates, spectral flow or Riemann–Roch. Layer 4 has linear foundations and compatible structures on manifolds, energy quantization and the sphere's automorphisms, including `PSL(2, ℂ) ≃ SO(3)` up to homotopy. It lacks local theory, transversality and gluing. Layer 5 has action, energy and no-escape for strips, but no strip moduli. Layer 6 has `Sym^g(Σ)`, Lipshitz's Maslov index and weak admissibility at a generator, but no general spin^c structures and no `HF̂` complex. Layer 7 has type `D` structures and the differential strands algebra, but no matched-circle algebra and no curves. Layer 8 is untouched.

## The frontier

- **`∂² = 0` for the mod-two Morse complex**: build boundary charts at the finitely many broken ends of the compactified index-two space. The even-endpoint count then applies.

- **Morse–Smale genericity**: the spanning perturbation families are in place, so the remaining step is to feed them into parametric transversality and make the Morse–Smale condition a theorem rather than a hypothesis.

- **Cauchy–Riemann estimates for maps and bundles**: extend the interior `Lᵖ` estimates to `W^{1,p}` maps and bundles, and prove the totally real boundary estimates.

- **The Floer strip operator**: prove that `d/ds + A(s)` is Fredholm when `A(s)` is unbounded on an infinite-dimensional space. This needs Sobolev spaces on strips from §3.1.

- **The algebra of a matched circle**: cut the differential strands algebra down by a matching to get the bordered algebra of §7.4.

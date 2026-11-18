<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"corners beyond index two, Morse-Smale genericity, integral orientations, continuation maps and invariance, Bott complexes, the M.4 to M.10 comparisons","state":"partial"},{"id":"Lane M","remaining":"corners beyond index two, Morse-Smale genericity, integral orientations, continuation maps and invariance, Bott complexes, the M.4 to M.10 comparisons","state":"partial"},{"id":"Layer 2","remaining":"openness of Morse functions, the Floer strip operator, trajectory path charts, Morse-Smale, Bott and closed-return genericity","state":"partial"},{"id":"Layer 3","remaining":"W^{1,p} and bundle interior estimates, totally real boundary estimates, Sobolev spaces on strips, Hilbert-space spectral flow, general Riemann-Roch","state":"partial"},{"id":"Layer 4","remaining":"local theory, boundary Gromov compactness, transversality and gluing, nonsqueezing","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in a Liouville domain, d^2 = 0, continuation maps and invariance","state":"partial"},{"id":"Layer 6","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the holomorphic HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","remaining":"cylindrical curves and their compactness, bordered modules from curves and pairing, knot Floer theory","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f014b850362ce327a3fbae8ba3cb6d2242808ad9ce25327e9607c973a540de3e","roadmap":"HeegaardFloer","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The mod-two Morse complex on a compact manifold is now a genuine complex, and the abstract transversality package (sharp Sard, Sard–Smale, parametric transversality, the determinant line bundle) is in place. Integral Morse homology, Morse–Smale genericity, continuation maps and the Floer strip operator are missing. Layers 1 to 7 are partial, no Floer-type homology has been constructed, and Layer 8 has not begun.

### Named results

- **The mod-two Morse complex** ([`morseBoundary_comp_morseBoundary`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Differential.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary)) — for a Morse function on a compact boundaryless manifold and a Morse–Smale adapted pseudo-gradient, `∂ ∘ ∂ = 0`, since broken index-two trajectories come in pairs.

- **Morse–Smale as surjectivity** ([`isMorseSmale_iff_forall_surjective_trajectoryOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/MorseSmale/Fredholm.html#TauCeti.isMorseSmale_iff_forall_surjective_trajectoryOperator)) — for a `C²` function on a Euclidean space with globally Lipschitz gradient, the flow is Morse–Smale exactly when every linearized operator `ξ ↦ ξ' + Hess f(γ) ξ` from `W^{1,2}` to `L²` is onto.

- **The sharp Morse–Sard theorem** ([`ContDiff.addHaar_image_criticalPoints_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#ContDiff.addHaar_image_criticalPoints_eq_zero)) — a `C^n` map between finite-dimensional real spaces with `n > max(dim E − dim F, 0)` has critical values of measure zero.

- **The Sard–Smale theorem** ([`isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a `C^k` Fredholm map with `k > max(index, 0)` on a Lindelöf subset of a Banach space has meagre critical values.

- **The Calderón–Zygmund inequality for `∂̄`** ([`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)) — for `1 < p < ∞`, `‖Du‖_{Lᵖ} ≤ C ‖∂̄u‖_{Lᵖ}` on the plane.

### Notable definitions and infrastructure

- The determinant lines of Fredholm operators form a [rank-one vector bundle](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/DeterminantLine/Bundle.html#TauCeti.FredholmDetLine.vectorBundle) over the space of Fredholm operators.

- For a residual set of parameters, the zeros of a universal Fredholm section [form a manifold of dimension the index](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero).

- The [Maslov index of a path of Lagrangians](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/Maslov.html#Matrix.UnitaryGroup.maslovIndex), built from Souriau's formula with its four axioms, in which index formulas for strips will be stated.

### Roadmap coverage

Layer 1 (Lane M) is partial. It has stable manifolds with slice charts, trajectory spaces, the mod-two complex with `∂² = 0`, duality, Euclidean Künneth, the ℝP² example, the [Witten complex](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/Witten.html#TauCeti.wittenComplex) and a continuation potential. Missing: corners beyond index two, Morse–Smale genericity, integral orientations (M.3), continuation maps and invariance, Bott complexes, and the M.4 to M.10 comparisons. Layer 2 has §2.1 done and the determinant line bundle from §2.2. Finite-dimensional trajectory operators are Fredholm exactly when their limits are hyperbolic, and Morse functions are dense in `C^n`. Missing: openness of Morse functions, the Floer strip operator, path charts, and Morse–Smale, Bott and closed-return genericity. Layer 3 is partial: Maslov indices, [index equals spectral flow](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/EnergyEstimate/SpectralFlow.html#TauCeti.WeakDerivStep.index_trajectoryOperator_eq_finsum_sigPos_sub_sigNeg_crossingForm) in finite dimensions, and interior estimates for smooth maps, but no `W^{1,p}`, bundle or boundary estimates and no Riemann–Roch. Layer 4 has linear foundations, energy quantization, and sphere automorphisms acting properly on nonconstant maps, but no local theory, transversality or gluing. Layer 5 has action, energy, no-escape, and chords as the critical points of the action, but no strip moduli. Layer 6 has `Sym^g(Σ)` with its totally real Heegaard tori, admissibility and a combinatorial hat count, but no holomorphic `HF̂` complex. Layer 7 has the strands algebra, type `D` structures, `A∞` modules, box tensor products and the generators of glued diagrams, but no curves. Layer 8 is untouched.

## The frontier

- **Morse–Smale genericity**: prove that Morse functions are open in `C^k`, then use the surjectivity criterion and parametric transversality to make Morse–Smale a generic condition. The criterion is currently Euclidean, with globally Lipschitz gradient.

- **Integral Morse homology (M.3)**: orient descending manifolds, define signed counts and prove `d² = 0` over `ℤ`, with ℝP² giving `d₂ = ±2` as the check. This needs the corner orientations of M.2.

- **Continuation maps**: count trajectories of the continuation potential to get chain maps, then prove the homotopies that give invariance of Morse homology.

- **The Floer strip operator**: prove that `d/ds + A(s)` is Fredholm when `A(s)` is unbounded on an infinite-dimensional space, and identify its index with spectral flow. This needs Sobolev spaces on strips from §3.1.

- **Cauchy–Riemann estimates for maps and bundles**: extend the interior `Lᵖ` estimates to `W^{1,p}` maps and bundles, and prove the totally real boundary estimates.

<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"integral d^2 = 0, corners beyond index two, Morse-Smale genericity, continuation chain maps and invariance, Bott complexes, the M.4 to M.10 comparisons","state":"partial"},{"id":"Lane M","remaining":"integral d^2 = 0, corners beyond index two, Morse-Smale genericity, continuation chain maps and invariance, Bott complexes, the M.4 to M.10 comparisons","state":"partial"},{"id":"Layer 2","remaining":"the Floer strip operator, trajectory path charts on manifolds, Morse-Smale, Bott and closed-return genericity","state":"partial"},{"id":"Layer 3","remaining":"unbounded spectral flow and the index of d/ds - A, W^{1,p} bundle and totally real boundary estimates, general Riemann-Roch","state":"partial"},{"id":"Layer 4","remaining":"local theory, boundary Gromov compactness, transversality and gluing, nonsqueezing","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in a Liouville domain, d^2 = 0, continuation maps and invariance","state":"partial"},{"id":"Layer 6","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the holomorphic HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","remaining":"cylindrical curves and their compactness, bordered modules from curves and pairing, knot Floer theory","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f014b850362ce327a3fbae8ba3cb6d2242808ad9ce25327e9607c973a540de3e","roadmap":"HeegaardFloer","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Mod-two Morse homology on compact manifolds now exists as a chain complex with computed invariants. Morse functions are generic, and the abstract transversality and spectral-flow machinery is in place. Integral Morse homology, Morse–Smale genericity, continuation invariance and the Floer strip operator are missing. Layers 1 to 7 are partial, no Floer-type homology has been constructed, and Layer 8 has not begun.

### Named results

- **The mod-two Morse complex** ([`morseBoundary_comp_morseBoundary`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Differential.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary)) — for a Morse function on a compact boundaryless manifold and a Morse–Smale adapted pseudo-gradient, `∂ ∘ ∂ = 0`, because broken index-two trajectories come in pairs.

- **Morse homology sees the Euler characteristic** ([`sum_range_neg_one_pow_mul_finrank_homology_morseComplex_eq_eulerChar`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/ChainComplex.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.sum_range_neg_one_pow_mul_finrank_homology_morseComplex_eq_eulerChar)) — the alternating sum of the mod-two Morse Betti numbers is the Euler characteristic of the manifold. The strong Morse inequalities and Poincaré duality hold alongside it.

- **Generic functions are Morse** ([`mem_residual_setOf_forall_mem_criticalPoints_isManifoldNondegenerateCriticalPoint`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Generic/Universal/Residual.html#TauCeti.mem_residual_setOf_forall_mem_criticalPoints_isManifoldNondegenerateCriticalPoint)) — for `k ≥ 2`, `C^k` functions with only nondegenerate critical points are residual on a compact boundaryless manifold.

- **The Sard–Smale theorem** ([`isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a `C^k` Fredholm map with `k > max(index, 0)` on a Lindelöf subset of a Banach space has meagre critical values.

- **Homotopy invariance of spectral flow** ([`spectralFlow_eq_of_homotopy`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/Spectral/Flow.html#TauCeti.spectralFlow_eq_of_homotopy)) — continuous paths of bounded self-adjoint Fredholm operators that are homotopic with fixed endpoints have the same spectral flow.

### Notable definitions and infrastructure

- The [integral Morse boundary](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Integral.html#TauCeti.IsAdaptedPseudoGradient.signedMorseBoundary), built from [orientation data](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Integral.html#TauCeti.MorseOrientation) in linearizing Morse charts. It reduces to the mod-two boundary and changes by conjugation when orientations are reversed, which is the setting in which `∂² = 0` over `ℤ` will be proved.

- The determinant lines of Fredholm operators form a [rank-one vector bundle](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/DeterminantLine/Bundle.html#TauCeti.FredholmDetLine.vectorBundle), and orientations can now be transported along paths. Coherent orientations of moduli spaces will come from this.

- The [Maslov index of a path of Lagrangians](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/Maslov.html#Matrix.UnitaryGroup.maslovIndex), built from Souriau's formula. The Conley–Zehnder index is now tied to it, being [minus twice the Maslov index on loops](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/SymplecticGroup/ConleyZehnder.html#TauCeti.GLSymplectic.conleyZehnderIndex_eq_neg_two_mul_maslovIndex), and the index formulas for strips will be stated in these terms.

### Roadmap coverage

Layer 1 (Lane M) is partial. It has stable manifolds, trajectory spaces, the mod-two complex with its homology, duality, Künneth, the ℝP² computation, the Witten complex and a mod-two continuation map. For integral coefficients there is a signed boundary, but `∂² = 0` over `ℤ` is only reduced to cancelling signs of broken trajectories. Missing: corners beyond index two, Morse–Smale genericity, continuation chain maps and invariance, Bott complexes, and the M.4 to M.10 comparisons. Layer 2 now has §2.1, generic Morse functions (§2.3) and the determinant line bundle. Missing: the Floer strip operator, trajectory path charts on manifolds, and Morse–Smale, Bott and closed-return genericity. Layer 3 has Maslov and Conley–Zehnder indices, spectral flow for bounded paths, the [Calderón–Zygmund inequality for `∂̄`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv) with interior estimates for smooth maps, and the first Sobolev spaces on strips. It lacks unbounded spectral flow, `W^{1,p}`, bundle and boundary estimates, and Riemann–Roch. Layer 4 has linear foundations, complex normal charts, energy quantization and sphere automorphisms, but no local theory, transversality or gluing. Layer 5 has action, energy and no-escape, but no strip moduli. Layer 6 has `Sym^g(Σ)`, admissibility and a combinatorial hat count, but no holomorphic `HF̂`. Layer 7 has the strands algebra, type `D` structures, `A∞` modules and stable Hamiltonian structures, but no curves. Layer 8 is untouched.

## The frontier

- **Integral `∂² = 0` (M.3)**: show that the two ends of each compactified index-two component carry opposite signs, then check ℝP² with `d₂ = ±2`. The orientation-line model and the sign reduction are already in place.

- **Morse–Smale genericity**: Morse functions are now residual. What remains is to make Morse–Smale a generic condition on metrics or pseudo-gradients. The surjectivity criterion that would feed parametric transversality is still Euclidean, with globally Lipschitz gradient.

- **Continuation maps**: prove that the mod-two continuation map is a chain map, then construct the digon and triangle homotopies that give invariance.

- **The Floer strip operator**: extend spectral flow to unbounded families with a common compactly embedded domain, and prove that `∂_s − A(s)` is Fredholm with index `−SF(A)`. The `H¹` space on strips has begun.

- **Cauchy–Riemann estimates for maps and bundles**: extend the interior `Lᵖ` estimates to `W^{1,p}` maps and bundles, and prove the totally real boundary estimates.

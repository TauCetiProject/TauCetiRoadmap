<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"integral d^2 = 0, corners in general, Morse-Smale genericity, continuation invariance, Bott complexes, the M.4 to M.10 comparisons","state":"partial"},{"id":"Lane M","remaining":"integral d^2 = 0, corners in general, Morse-Smale genericity, continuation invariance, Bott complexes, the M.4 to M.10 comparisons","state":"partial"},{"id":"Layer 2","remaining":"the Floer strip operator, trajectory path charts on manifolds, Morse-Smale, Bott and closed-return genericity","state":"partial"},{"id":"Layer 3","remaining":"unbounded spectral flow and the index of d/ds - A, the augmented Holder disc solver, W^{1,p} bundle and boundary estimates, Riemann-Roch","state":"partial"},{"id":"Layer 4","remaining":"local theory for general J, boundary Gromov compactness, transversality and gluing, nonsqueezing","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in a Liouville domain, d^2 = 0, continuation maps and invariance","state":"partial"},{"id":"Layer 6","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the holomorphic HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","remaining":"cylindrical curves and their compactness, bordered modules from curves and pairing, knot Floer theory","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f014b850362ce327a3fbae8ba3cb6d2242808ad9ce25327e9607c973a540de3e","roadmap":"HeegaardFloer","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Mod-two Morse homology on compact manifolds exists as a chain complex with computed invariants, Morse functions are generic, and spectral flow for bounded paths is complete with its regular-crossing formula. Integral Morse homology, Morse–Smale genericity, continuation invariance and the Floer strip operator are missing. Layers 1 to 7 are partial, no Floer-type homology has been constructed, and Layer 8 has not begun.

### Named results

- **The mod-two Morse complex** — for a Morse function on a compact boundaryless manifold with a Morse–Smale adapted pseudo-gradient, [`morseBoundary_comp_morseBoundary`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Differential.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary) gives `∂ ∘ ∂ = 0`, and its homology has the [Euler characteristic of the manifold](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/ChainComplex.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.sum_range_neg_one_pow_mul_finrank_homology_morseComplex_eq_eulerChar).

- **Generic functions are Morse** — for `k ≥ 2`, the `C^k` functions with only nondegenerate critical points form a residual set on a compact boundaryless manifold ([`mem_residual_setOf_forall_mem_criticalPoints_isManifoldNondegenerateCriticalPoint`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Generic/Universal/Residual.html#TauCeti.mem_residual_setOf_forall_mem_criticalPoints_isManifoldNondegenerateCriticalPoint)).

- **The Sard–Smale theorem** — a `C^k` Fredholm map with `k > max(index, 0)` on a Lindelöf subset of a Banach space has meagre critical values ([`isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)).

- **The regular-crossing formula for spectral flow** — along a path of self-adjoint Fredholm operators on a real Hilbert space, invertible at its ends and with only regular crossings, the spectral flow is the sum of the signatures of the crossing forms ([`spectralFlow_eq_finsum_sigPos_sub_sigNeg_crossingForm`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/Spectral/RegularCrossings.html#TauCeti.spectralFlow_eq_finsum_sigPos_sub_sigNeg_crossingForm)). Homotopy invariance, concatenation and direct sums hold alongside it.

- **The Riemann–Hilbert problem with Hölder data** — on the unit disc, `h − wᵏ h̄ = φ` has a solution that is holomorphic inside and `α`-Hölder up to the boundary whenever `k ≥ −1` ([`exists_holderOnWith_closedBall_sub_zpow_mul_conj_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UnitDisc/RiemannHilbert.html#TauCeti.exists_holderOnWith_closedBall_sub_zpow_mul_conj_eq)). It rests on Privalov's theorem for the Cauchy integral.

### Notable definitions and infrastructure

- The [integral Morse boundary](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Integral.html#TauCeti.IsAdaptedPseudoGradient.signedMorseBoundary), built from orientation data in Morse charts. It reduces to the mod-two boundary, and it is where `∂² = 0` over `ℤ` will be proved.

- The determinant lines of Fredholm operators form a [rank-one vector bundle](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/DeterminantLine/Bundle.html#TauCeti.FredholmDetLine.vectorBundle) with analytic chart transitions, which is what coherent orientations of moduli spaces will be built from.

- The [Maslov index of a path of Lagrangians](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/Maslov.html#Matrix.UnitaryGroup.maslovIndex), tied to the Conley–Zehnder index on loops.

### Roadmap coverage

Layer 1 (Lane M) is partial. It has the mod-two complex with homology, duality and Künneth, a signed boundary whose `∂² = 0` is only reduced to cancelling signs, and a mod-two continuation map. In Euclidean models it also has gluing at the centre of a hyperbolic box, Cerf's birth–death normal form, and a Witten Laplacian whose low-energy forms are counted by critical points. Missing: integral `∂² = 0`, corners in general, continuation invariance, Bott complexes and the M.4 to M.10 comparisons. Layer 2 has Sard, Sard–Smale, generic Morse functions and the determinant line bundle. It lacks the Floer strip operator, trajectory path charts on manifolds, and Morse–Smale, Bott and closed-return genericity. Layer 3 has the Maslov and Conley–Zehnder indices, bounded spectral flow with the regular-crossing formula, interior Calderón–Zygmund estimates, a similarity principle, and the scalar Hölder Riemann–Hilbert problem on the disc. It lacks unbounded spectral flow, the augmented `ℂⁿ` disc solver, `W^{1,p}` bundle and boundary estimates, and Riemann–Roch. Layer 4 has linear foundations, energy quantization, sphere automorphisms, and area monotonicity and positivity of intersections for genuinely holomorphic maps. It has no local theory for general `J`, no compactness, transversality or gluing. Layers 5 to 7 keep their earlier partial foundations (action and no-escape, `Sym^g(Σ)` with a combinatorial hat count, the strands algebra and `A∞` modules), with no moduli of strips or curves. Layer 8 is untouched. The latest work was only partly surveyed, so some of it may be missing here.

## The frontier

- **Integral `∂² = 0` (M.3)**: show that the two ends of each compactified index-two component carry opposite signs, then check ℝP² with `d₂ = ±2`.

- **Morse–Smale genericity**: localized metric variations now make the linearized operator onto along a single Euclidean trajectory. What remains is the parametric transversality argument over metrics or pseudo-gradients on a manifold.

- **Continuation maps**: prove that the mod-two continuation map is a chain map, then build the homotopies that give invariance. The local birth–death analysis for Cerf families is in place.

- **The Floer strip operator**: extend spectral flow to unbounded families with a common compactly embedded domain, and prove that `∂_s − A(s)` is Fredholm with index `−SF(A)`. Self-adjointness on a common domain is the first piece.

- **The Hölder disc solver (§3.2)**: lift the scalar Riemann–Hilbert results to the augmented real-boundary operator on `ℂⁿ`, prove it is a Banach isomorphism, and perturb it by a Neumann series.

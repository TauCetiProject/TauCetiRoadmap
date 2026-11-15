<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"a6027b1d24fcb935c53bd5b50d11b40991cda418","ts":"2026-11-11T08:00:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"charts at broken ends for d^2 = 0, Morse-Smale genericity, integral orientations, continuation maps and invariance, Bott complexes, the M.4 to M.10 comparisons","state":"partial"},{"id":"Lane M","remaining":"charts at broken ends for d^2 = 0, Morse-Smale genericity, integral orientations, continuation maps and invariance, Bott complexes, the M.4 to M.10 comparisons","state":"partial"},{"id":"Layer 2","remaining":"openness of Morse functions, the determinant line bundle, the Floer strip operator, trajectory path charts, Morse-Smale, Bott and closed-return genericity","state":"partial"},{"id":"Layer 3","remaining":"W^{1,p} and bundle interior estimates, totally real boundary estimates, Sobolev spaces on strips, Hilbert-space spectral flow, general Riemann-Roch","state":"partial"},{"id":"Layer 4","remaining":"local theory, boundary Gromov compactness, transversality and gluing, nonsqueezing","state":"partial"},{"id":"Layer 5","remaining":"strip moduli in a Liouville domain, d^2 = 0, continuation maps and invariance","state":"partial"},{"id":"Layer 6","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the holomorphic HF-hat complex and its invariance","state":"partial"},{"id":"Layer 7","remaining":"cylindrical curves and their compactness, bordered modules from curves and pairing, knot Floer theory","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f014b850362ce327a3fbae8ba3cb6d2242808ad9ce25327e9607c973a540de3e","roadmap":"HeegaardFloer","to_sha":"a6027b1d24fcb935c53bd5b50d11b40991cda418"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `a6027b1` (2026-11-11T08:00:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The transversality foundations are now in place: Sard and Sard–Smale hold at sharp regularity, and parametric transversality holds too. The Floer strip operator and the determinant line bundle do not exist yet. Layer 1 has a mod-two Morse complex on compact manifolds, but `∂² = 0` is still conditional on gluing at broken ends. Layers 1 to 7 are partial, no Floer-type homology has been constructed, and Layer 8 has not begun.

### Named results

- **The sharp Morse–Sard theorem** ([`ContDiff.addHaar_image_criticalPoints_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#ContDiff.addHaar_image_criticalPoints_eq_zero)) — a `C^n` map between finite-dimensional real spaces with `n > max(dim E − dim F, 0)` has critical values of Haar measure zero, exactly the regularity §2.1 asks for.

- **The Sard–Smale theorem** ([`isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a Fredholm map on a Lindelöf subset of a Banach space that is `C^k` with `k > max(index, 0)` has meagre critical values, at Smale's sharp bound for every index.

- **Index equals spectral flow** ([`index_trajectoryOperator_eq_finsum_sigPos_sub_sigNeg_crossingForm`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/EnergyEstimate/SpectralFlow.html#TauCeti.WeakDerivStep.index_trajectoryOperator_eq_finsum_sigPos_sub_sigNeg_crossingForm)) — for symmetric coefficients on a finite-dimensional space with invertible limits, the index of `d/ds + A(s)` is the signed count of crossings.

- **The Calderón–Zygmund inequality for `∂̄`** ([`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)) — for `1 < p < ∞` and Schwartz maps on the plane, `‖Du‖_{Lᵖ} ≤ C ‖∂̄u‖_{Lᵖ}`, which localizes to an [interior estimate](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/InteriorEstimate.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv_add_eLpNorm) for smooth maps.

- **The Künneth formula for the mod-two Morse complex** ([`morseChainSeparatedSumEquiv_comp_morseBoundary`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Boundary/Prod.html#TauCeti.morseChainSeparatedSumEquiv_comp_morseBoundary)) — for `f(x) + g(y)` on Euclidean spaces, the chains form a tensor product and `∂ = ∂ ⊗ 1 + 1 ⊗ ∂`.

### Notable definitions and infrastructure

- For a residual set of parameters, the zeros of a universal Fredholm section [form a manifold of dimension the index](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero). Every moduli space will need this.

- The [mod-two Morse boundary](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Basic.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary) on compact manifolds, together with the theorem that [`∂² = 0` exactly when broken trajectory pairs come in even numbers](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Compactification.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary_eq_zero_iff_even_ncard_morseBrokenTrajectoryPairs). This turns the main identity into a statement about one compactified space.

- The [Maslov index of a path of Lagrangians](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/Maslov.html#Matrix.UnitaryGroup.maslovIndex) is built from Souriau's formula and satisfies the homotopy, catenation, direct-sum and normalization axioms. Index formulas for strips will be stated in terms of it.

### Roadmap coverage

Layer 1 (Lane M) is partial. It has stable manifolds, trajectory spaces, the mod-two boundary with duality and Euclidean Künneth, and a compactified index-two space. It also has the [Witten complex](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/Witten.html#TauCeti.wittenComplex), a Euclidean [Witten Laplacian](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/WittenLaplacian/Basic.html#TauCeti.euclideanWittenLaplacian) with its harmonic-oscillator model, and a [continuation potential](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/ContinuationPotential.html#TauCeti.isMorseOn_continuationPotential) on `M × [0, 1]`. Still missing are charts at broken ends, Morse–Smale genericity, integral orientations, continuation maps and invariance, Bott complexes and the M.4–M.10 comparisons. In Layer 2, §2.1 is done, including the manifold version. The rest of the layer is partial. Morse functions are [dense](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Generic/Basic.html#TauCeti.dense_setOf_forall_mem_criticalPoints_isManifoldNondegenerateCriticalPoint) in `C^n`, but they are not yet shown to be open there. Finite-dimensional trajectory operators are Fredholm with weights below the gap. Missing are the determinant line bundle, the Floer strip operator, path charts, and Morse–Smale, Bott and closed-return genericity. Layer 3 is partial: it has Maslov indices, finite-dimensional spectral flow and interior estimates for smooth maps, but no `W^{1,p}`, bundle or boundary estimates and no Riemann–Roch. Layer 4 has linear foundations, energy quantization and the sphere's automorphisms, but no local theory, transversality or gluing. Layer 5 has action, energy and no-escape, but no strip moduli. Layer 6 has `Sym^g(Σ)`, admissibility, and a combinatorial hat count with lens-space, `S¹ × S²` and trefoil examples. It has no holomorphic `HF̂` complex. Layer 7 has the strands algebra, its matched subalgebra and box tensor products with type `D` structures and bounded type `A` modules. It has no curves, so no bordered modules from geometry and no knot Floer theory. Layer 8 is untouched.

## The frontier

- **`∂² = 0` for the mod-two Morse complex**: build boundary charts at the finitely many broken ends of the compactified index-two space. The even-endpoint count then applies.

- **Morse–Smale genericity**: show that the dense Morse set is open in `C^k`, then feed the perturbation families into parametric transversality, making the Morse–Smale condition a theorem.

- **Continuation maps**: count trajectories of the continuation potential to get chain maps, then prove the homotopies that give invariance of Morse homology.

- **The Floer strip operator**: prove that `d/ds + A(s)` is Fredholm when `A(s)` is unbounded on an infinite-dimensional space, and identify its index with spectral flow there. This needs Sobolev spaces on strips from §3.1.

- **Cauchy–Riemann estimates for maps and bundles**: extend the interior `Lᵖ` estimates to `W^{1,p}` maps and bundles, and prove the totally real boundary estimates.

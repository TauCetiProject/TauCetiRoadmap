<!--tauceti-status:v1 {"roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"higher-order Morrey and Rellich up to the half-disc boundary; continuity of composition above order one","state":"partial"},{"id":"Layer 2","remaining":"existence of isothermal charts on a surface, the Schottky double, perturbation stability of totally real embeddings","state":"partial"},{"id":"Layer 3","remaining":"Sobolev-coefficient estimates (3.3), boundary estimates (3.4), vector similarity principle (3.5)","state":"partial"},{"id":"Layer 4","remaining":"weak differential and the weak pseudoholomorphic equation on surfaces","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"Fredholm property, duality and agreement with the smooth theory for real Cauchy–Riemann operators","state":"partial"},{"id":"Layer 7","remaining":"Maslov index of a bundle pair and Riemann–Roch; only model-case index computations exist","state":"partial"}],"readme_sha":"f762f4519c513495dc09fc5660364df608999050b6c8a75ed9349f303fc52e2e","roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: PseudoholomorphicCurveAnalysis

This file documents the status of the PseudoholomorphicCurveAnalysis roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The constant-coefficient core of Layer 3 (PH3.1–3.2) is done. Layers 1 and 2 are mostly built: what remains there is mainly boundary versions and existence on surfaces. The variable-coefficient estimates (PH3.3–3.5), bootstrapping, Fredholm theory and Riemann–Roch have definitions or groundwork but none of their main theorems.

### Named results

- **The Calderón–Zygmund inequality for `∂̄`**: in every `Lᵖ` with `1 < p < ∞`, the full derivative of a map from the plane is bounded by its `∂̄`. This is the analytic engine behind the later estimates ([`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)).
- **Hölder gain for the Cauchy transform at every order**: for data supported in a fixed disc, `T` is bounded from `C^{k,α}` to `C^{k+1,α}` on any larger disc, for every `k` ([`cauchyTransformCkCLM`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Pompeiu/Holder/Higher.html#TauCeti.cauchyTransformCkCLM)).
- **Interior regularity for `∂̄`**: a solution in `L^p_loc` whose `∂̄` lies in `W^{k,p}_loc` is in `W^{k+1,p}_loc`, with the interior estimate ([`HasWeakConjWirtingerDerivOn.memWkpLoc_succ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Wirtinger/Regularity.html#TauCeti.HasWeakConjWirtingerDerivOn.memWkpLoc_succ)).
- **Morrey's embedding at higher order**: for `p > 2`, a map in `W^{k+1,p}_loc` agrees almost everywhere with a `Cᵏ` map ([`MemWkpLoc.exists_contDiffOn_ae_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Local/Morrey/Higher.html#TauCeti.MemWkpLoc.exists_contDiffOn_ae_eq)).
- **Adapted charts along a totally real submanifold**: near any point there is a chart that flattens the submanifold onto `ℝⁿ` and turns `J` into `i` along it. The chart can be chosen to converge when the data converge ([`exists_adaptedChart`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/AdaptedChart.html#TauCeti.exists_adaptedChart)).

### Notable definitions and infrastructure

- **The local Sobolev class** [`MemWkpLoc`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Local/Basic.html#TauCeti.MemWkpLoc) now has products, composition and change of variables at every order, on half-discs as well as in the interior. Because of that it can serve as the chart-level class: the library now defines Sobolev maps from Riemann surfaces, with or without boundary, through it (`MemWkpLocMap`).
- **Weak solutions with Sobolev coefficients** ([`IsWeakCRSolution`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/CauchyRiemann/RoughCoefficients/Weak.html#TauCeti.IsWeakCRSolution)) for `∂_s + J∂_t + S` come with Green's formula and the differentiated system. This is exactly the setting of PH3.3.
- **Sobolev sections of vector bundles and `(0,1)`-forms**: the Banach spaces `SobolevSection` and `zeroOneSobolevSections`, together with a definition of real Cauchy–Riemann operators, give Layer 6 its domain and target spaces.

### Roadmap coverage

- **Layer 1 is partial.** The interior theory of 1.2 and 1.3 is done: Morrey, mixed products, composition, change of variables and local Rellich. Morrey up to the half-disc boundary exists only at order one, and Rellich and continuity of composition above order one are not yet done.
- **Layer 2 is partial.** 2.1 and 2.3 are done. 2.2 still lacks stability under perturbation on manifolds. For 2.4 there are the planar Beltrami chart, holomorphic transitions, the analytic atlas built from given isothermal charts, and the bordered holomorphic groupoid. Isothermal charts are not yet shown to exist on a surface, and the Schottky double is not built.
- **Layer 3 is partial.** 3.1 and 3.2 are done. For 3.3 only the setup exists. For 3.4 there are the half-disc weak equation, Schwarz reflection for constant coefficients and normal-derivative recovery. For 3.5, unique continuation and isolated zeros are proved given a similarity factorization, but the vector similarity principle is missing.
- **Layers 4, 6 and 7 are partial.** Layer 4 has the class of maps and the planar weak equation, with its invariances and Gromov's graph construction. Layer 6 has its function spaces and the operators, but no Fredholm theorem. Layer 7 has index computations for model cases (disc, annulus, torus), but no Maslov index of a bundle pair.
- **Layer 5 is untouched**, apart from its worked counterexamples.

## The frontier

- **Estimates with Sobolev coefficients (PH3.3)**: prove the exponent ladder and the order-zero lemma, then run the induction on the differentiated system. Its inputs, divergence-form Laplace regularity and mixed-exponent products, have landed.
- **The vector similarity principle (PH3.5)**: produce [`HasSimilarityFactorizationAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/CauchyRiemann/UniqueContinuation.html#TauCeti.HasSimilarityFactorizationAt) for `W^{1,p}` structures and `Lᵖ` zeroth-order terms. Unique continuation and isolated zeros then follow from theorems already proved.
- **Boundary estimates (PH3.4)**: reflect the variable-coefficient equation across `ℝ` and climb the orders up to the boundary. This needs PH3.3 and the higher-order half-disc versions of Morrey and Rellich from PH1.
- **Isothermal charts and the Schottky double (PH2.4)**: rescale the coefficient and apply the planar Beltrami chart to show isothermal charts exist on every surface, then glue the double from the reflected chart changes.
- **Elliptic bootstrapping (PH5.1)**: an induction over the existing composition and product theorems, blocked on PH3.3 in the interior and PH3.4 at the boundary.

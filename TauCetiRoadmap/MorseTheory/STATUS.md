<!--tauceti-status:v1 {"roadmap":"MorseTheory","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: MorseTheory

This file documents the status of the MorseTheory roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The local theory, critical-free band deformation, regular levels as submanifolds, the Lusternik–Schnirelmann bound and gradient convergence with an exponential rate are all proved. Handle and cell attachment on a manifold, the CW model, Morse approximation, the Morse inequalities and Morse–Bott theory have not begun.

### Named results

- **The Lusternik–Schnirelmann theorem** — on a compact boundaryless manifold, the Lusternik–Schnirelmann count of M is at most the number of critical points of any smooth function, degenerate or not, with an infinite critical set counting as ∞ ([`lsCategoryCount_univ_le_totalCriticalCount`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/LusternikSchnirelmann.html#TauCeti.lsCategoryCount_univ_le_totalCriticalCount)).
- **Milnor's regular-interval theorem** — if f⁻¹[a,b] is compact and free of critical points, then {f ≤ a} is a deformation retract of {f ≤ b} ([`exists_sublevelDeformation`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Deformation.html#TauCeti.exists_sublevelDeformation)), and an ambient diffeomorphism carries one sublevel onto the other ([`exists_diffeomorph_sublevel`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Deformation.html#TauCeti.exists_diffeomorph_sublevel)).
- **The normalized Morse lemma on a manifold** — near a nondegenerate critical point of index λ there are Euclidean coordinates in which f = f(p) − Σ_{i<λ} yᵢ² + Σ_{i≥λ} yᵢ² on the whole chart ([`exists_normalized_morseChart`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/NormalizedChart.html#TauCeti.IsManifoldNondegenerateCriticalPoint.exists_normalized_morseChart)).
- **Exponential convergence of gradient trajectories** — a negative gradient trajectory converging to a nondegenerate critical point approaches it at rate C·e^{−μt} in Riemannian distance, for any C¹ metric ([`exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/ExponentialConvergence.html#TauCeti.exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient)). Convergence itself is proved for proper bounded-below Morse functions ([`IsMorse.exists_tendsto_maximalIntegralCurve_neg_mgradient`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/GradientFlow.html#TauCeti.IsMorse.exists_tendsto_maximalIntegralCurve_neg_mgradient)).
- **Regular levels are embedded submanifolds** — a regular level f⁻¹(c) is a manifold of dimension dim E − 1 whose inclusion is a smooth embedding with tangent space ker df ([`isSmoothEmbedding_coe_scalarRegularLevel`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/RegularValue/Scalar/Level.html#TauCeti.isSmoothEmbedding_coe_scalarRegularLevel)).

### Notable definitions and infrastructure

- [The critical Hessian](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Hessian.html#TauCeti.criticalHessian) is a bilinear form on the tangent space that agrees with the coordinate Hessian in every chart. It is what makes index statements chart-free.
- [Admissible Morse charts](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/AdmissibleCharts.html#TauCeti.IsMorse.exists_admissible_morseCharts) give, at an isolated critical level of a compact band, a width ε and pairwise disjoint normalized charts each containing Milnor's ellipsoid. These are the charts the handle attachment is to be built in.
- [Milnor's handle retraction](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/HandleRetraction.html#TauCeti.exists_inter_quadraticSublevelUnionCell_deformation) in the quadratic model −‖u‖² + ‖v‖² retracts a fibrewise star-shaped set onto its lower sublevel together with the negative cell. This is the local input to cell attachment.

### Roadmap coverage

M1 is mostly done: the critical Hessian and its comparisons, the normalized chart, isolation, compact finiteness, C² persistence with index and smooth critical-point continuation are proved. Identifying the Hessian with DG's metric Hessian and the extended-value critical counts are not found. M2 is partial. Band deformation, the band product homeomorphism, the disc sublevels, the regular-level atlas and embedding, the submersion normal form and admissible charts are proved. The sublevel and band boundary atlases, handle and cell attachment on M, the chart-change comparisons and the CW model are not. M3 has only a smooth proper exhaustion function on every sigma-compact manifold; the strong topology and Morse approximation are untouched. M4 is partial: the main Lusternik–Schnirelmann inequality is proved, but the cup-length and component corollaries, the minimum c(M) and all Morse inequalities are not found. M5 is untouched. M6 appears complete: trapped and proper convergence, the manifold Łojasiewicz inequality, energy decay, tail-length bounds and exponential distance decay are all proved.

## The frontier

- **Cell attachment across a critical level** — glue the quadratic-model retraction into M through the admissible charts and combine it with the band deformation, giving M_{c+ε} ≃ M_{c−ε} ∪ D^λ relative to the lower sublevel.
- **Sublevels and bands as manifolds with boundary** — the regular-level atlas is in place, so what remains is the boundary atlases for M_a and f⁻¹[a,b] and the smooth version of the band product.
- **Lusternik–Schnirelmann corollaries (M4)** — the cup-length bound #Crit(f) ≥ cupLength + 1 needs AlgebraicTopology's categorical-cover supplement. The minimum c(M) needs a finite Morse witness, which waits on Morse approximation.
- **Morse approximation in the strong topology (M3)** — define strong C^k neighbourhoods, then run the compact-exhaustion perturbation argument. The smooth proper exhaustion it starts from is available.
- **The CW model and the strong Morse inequalities** — the sequence of regular sublevels for a proper bounded-below Morse function is proved ([`exists_regular_sublevel_exhaustion`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Exhaustion.html#TauCeti.IsMorse.exists_regular_sublevel_exhaustion)), but both steps wait on cell attachment.

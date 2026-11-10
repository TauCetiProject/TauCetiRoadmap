<!--tauceti-status:v1 {"roadmap":"MorseTheory","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
# Status: MorseTheory

This file documents the status of the MorseTheory roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The ordinary Morse theory of compact manifolds is in place up to the strong Morse inequalities: local theory, band deformation, cell attachment across a critical level, Morse approximation, the Lusternik–Schnirelmann bound and gradient convergence. Partial: the global CW model, the degenerate two-critical-point sphere theorem, and Morse–Bott theory, which has its definitions but none of the attachment theory.

### Named results

- **The strong Morse inequalities** — for a Morse function on a compact boundaryless manifold, bₙ − bₙ₋₁ + ⋯ ± b₀ ≤ cₙ − cₙ₋₁ + ⋯ ± c₀ over any field ([`IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_le`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Inequalities.html#TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_le)), packaged as the polynomial identity Σcᵢtⁱ = Σbᵢtⁱ + (1+t)Q(t) with Q in ℕ[t] ([`IsMorse.exists_sum_range_monomial_eq_add_mul`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Inequalities.html#TauCeti.IsMorse.exists_sum_range_monomial_eq_add_mul)), and also proved for regular bands and cobordisms.
- **Milnor's cell attachment theorem** — crossing a critical level with compact band is, up to homotopy relative to the lower sublevel, attaching one λ-cell for each critical point of index λ ([`IsMorse.exists_morseCellAttachment_deformation`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Cell/Comparison.html#TauCeti.IsMorse.exists_morseCellAttachment_deformation)).
- **Reeb's theorem** — a compact manifold with a Morse function that has exactly two critical points is homeomorphic to a sphere ([`IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Reeb.html#TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two)). This is the nondegenerate case only.
- **The Lusternik–Schnirelmann theorem** — on a compact boundaryless manifold every smooth function, degenerate or not, has at least as many critical points as the Lusternik–Schnirelmann count of M ([`lsCategoryCount_univ_le_totalCriticalCount`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/LusternikSchnirelmann.html#TauCeti.lsCategoryCount_univ_le_totalCriticalCount)). It now also bounds [the minimal critical count c(M)](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/MinCriticalCount.html#TauCeti.lsCategoryCount_univ_le_minCriticalCount).
- **Exponential convergence of gradient trajectories** — a forward negative-gradient trajectory of a Morse function that converges does so at rate C·e^{−ct} in Riemannian distance, for all t ≥ 0 ([`IsMorse.exists_edist_le_exp_of_tendsto_neg_mgradient`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Trajectory.html#TauCeti.IsMorse.exists_edist_le_exp_of_tendsto_neg_mgradient)).

### Notable definitions and infrastructure

- [The Morse relative CW complex](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/RelCWComplex.html#TauCeti.morseRelCWComplex) of a critical level, with its relative homology [free on the critical points](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Cell/Homology.html#TauCeti.IsMorse.exists_singularHomology_sublevelPair_iso_sigma). The Morse inequalities are proved from this, level by level.
- [The strong Whitney topology](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ContMDiffMap/Chart/Strong.html#ContMDiffMap.manifoldStrongWhitneyTopology) on smooth maps. It does not depend on the chart family and [agrees with the weak topology on a compact manifold](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ContMDiffMap/Chart/Strong.html#ContMDiffMap.manifoldStrongWhitneyTopology_eq_manifoldWeakWhitneyTopology). It is the setting for Morse approximation on noncompact manifolds.
- [Morse–Bott families](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Bott/Family.html#TauCeti.IsMorseBottFamily) present the critical set as embedded critical submanifolds. Their normal Hessian is a smooth family of forms and their index is locally constant, which is what the negative-bundle attachment needs.

### Roadmap coverage

M1 is done except the identification of the critical Hessian with DG's metric Hessian, which was not found. M3 appears complete. The library has the strong topology with chart independence, density of Morse functions on compact manifolds and, in the source, in the strong topology with relative and proper versions (`dense_setOf_isMorse_manifoldStrongWhitney`, `exists_isMorse_isProperMap_bddBelow`). M6 is done, now also stated for prescribed integral curves as the README names them. M2 is done through single critical levels: sublevels and bands as manifolds with boundary with their outward co-orientation, the smooth band product, cell and handle attachment, chart-change and width comparisons, and the double-well and ℝP² checks. Missing are the global CW model `exists_cwComplex_homotopyEquiv` and the parametric families of comparisons. M4 is done outside M4.1. That covers the strong and weak inequalities, Euler equality, the lacunary principle, Euler-characteristic parity, freeness and vanishing of top (co)homology, the cup-length and component-sum corollaries, c(M), and the torus and projective examples. In M4.1 only the two-Euclidean-cover step and preliminaries for Brown's theorem have landed. M5 is partial: the definitions, normal Hessian and vector-space parametric Morse lemma exist, but the normal-bundle Morse lemma, disc-bundle attachment and spectral sequence do not.

## The frontier

- **The degenerate two-critical-point sphere theorem (M4.1)** — the Euclidean cover and cellular-set collapsing exist. Brown's bicollared Schoenflies theorem, the open-map step of invariance of domain, the two-open-cell lemma and the final composition remain.
- **The CW model** — iterate the relative CW complexes along the regular sublevel exhaustion to get a CW complex homotopy equivalent to M with one λ-cell per index-λ critical point. AlgebraicTopology's tower and pushout comparisons are the inputs.
- **Morse–Bott attachment (M5)** — prove the Morse lemma on the actual normal bundle, then attach negative disc bundles across a critical band and identify the relative homology through Thom coefficients.
- **Parametric chart comparisons (M2)** — extend the chart-change comparison continuously over compact CW parameter spaces, as the README specifies.
- **The metric Hessian (M1)** — show the critical Hessian equals DifferentialGeometry's Hessian for every smooth metric.

<!--tauceti-status:v1 {"roadmap":"MorseTheory","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c","ts":"2026-10-20T05:58:24Z"}-->
# Status: MorseTheory

This file documents the status of the MorseTheory roadmap up until `68a457e` (2026-10-20T05:58:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The finite Morse core is in place up to, but not including, cell attachment on a manifold. Critical Hessians, normal forms and critical-free band deformation are proved, and so is trapped gradient convergence without a rate. The handle step exists only in the quadratic model. The CW model, Morse approximation, the Morse inequalities and Morse–Bott theory have not begun.

### Named results

- **Milnor's regular-interval theorem** — if f⁻¹[a,b] is compact and free of critical points, then {f ≤ a} is a deformation retract of {f ≤ b} ([`exists_sublevelDeformation`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Deformation.html#TauCeti.exists_sublevelDeformation)), and an ambient diffeomorphism carries one sublevel onto the other ([`exists_diffeomorph_sublevel`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Deformation.html#TauCeti.exists_diffeomorph_sublevel)).
- **The product structure of a regular band** — a compact band with no critical points is homeomorphic to a level times an interval ([`exists_bandHomeomorph`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Deformation.html#TauCeti.exists_bandHomeomorph)). This is a homeomorphism only; the smooth interior and boundary-piece statements are not yet proved.
- **The normalized Morse lemma on a manifold** — near a nondegenerate critical point of index λ there are Euclidean coordinates in which f = f(p) − Σ_{i<λ} yᵢ² + Σ_{i≥λ} yᵢ² on the whole chart ([`exists_normalized_morseChart`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/NormalizedChart.html#TauCeti.IsManifoldNondegenerateCriticalPoint.exists_normalized_morseChart)).
- **Persistence of nondegenerate critical points** — every small C² perturbation still has a unique nearby critical point, with the same Morse index ([`exists_mem_nhds_eventually_criticalPoint`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Persistence.html#TauCeti.IsManifoldNondegenerateCriticalPoint.exists_mem_nhds_eventually_criticalPoint)). Separately, a nondegenerate critical point continues smoothly through a C³ family ([`exists_contDiffAt_criticalPoint_continuation`](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/CriticalPointContinuation.html#TauCeti.IsNondegenerateCriticalPoint.exists_contDiffAt_criticalPoint_continuation)).
- **Convergence of gradient trajectories** — for a proper, bounded-below Morse function and any C¹ metric, every negative gradient trajectory converges to a critical point ([`IsMorse.exists_tendsto_maximalIntegralCurve_neg_mgradient`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/GradientFlow.html#TauCeti.IsMorse.exists_tendsto_maximalIntegralCurve_neg_mgradient)). The proof goes through the energy identity and ω-limit sets.

### Notable definitions and infrastructure

- [The critical Hessian](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Hessian.html#TauCeti.criticalHessian) is a bilinear form on the tangent space. It agrees with the coordinate Hessian in every chart, and its index can be read from a matrix in any basis or from maximal definite subspaces. This is what makes index statements chart-free.
- [The self-modelled copy](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ModelTransport/Boundaryless.html#TauCeti.BoundarylessModel) of a manifold with a boundaryless model lets results proved for the standard model 𝓘(ℝ,E) transfer to arbitrary models. Immersions, criticality, index and adapted pseudo-gradients have already been transported this way.
- [Milnor's handle retraction](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/HandleRetraction.html#TauCeti.exists_inter_quadraticSublevelUnionCell_deformation) works in the quadratic model −‖u‖² + ‖v‖². It shows that a fibrewise star-shaped set retracts onto its lower sublevel together with the negative cell. This is the local input to cell attachment.

### Roadmap coverage

M1 is mostly done. The critical Hessian, its chart and matrix comparisons, the normalized chart, the saddle model, isolation, compact finiteness and C² persistence with index are all proved. Still open are identifying the Hessian with DG's metric Hessian and the extended-value critical counts. M2 is partial. The critical-free band deformation, the ambient version, the critical-level deformation, the band product homeomorphism and the disc sublevels near a minimum or maximum are proved. Not found in the source: the regular-level and sublevel manifold-with-boundary atlases, handle and cell attachment on M, the chart-change comparisons, and the CW model. M3 is untouched beyond persistence, and M4 and M5 are untouched. M6 is partial: compact-trapped and proper convergence are proved, but exponential decay on manifolds is not.

## The frontier

- **Cell attachment across a critical level** — the quadratic-model retraction has to be glued into M through disjoint Morse charts and combined with the band deformation. That gives the homotopy equivalence M_{c+ε} ≃ M_{c−ε} ∪ D^λ relative to the lower sublevel.
- **Regular levels and sublevels as manifolds** — the scalar-level atlas and the boundary atlases for M_a and for bands are still missing. The smooth version of the band product depends on them, and so does the cobordism material.
- **Exponential convergence on manifolds (M6)** — transport the vector-space Łojasiewicz-type estimate to charts to get dist(γ(t), p) ≤ C·e^{−ct}.
- **The Lusternik–Schnirelmann bound (M4)** — the critical-level deformation it needs has landed. What remains is the critical-level induction and AlgebraicTopology's categorical-cover supplement.
- **Morse approximation in the strong topology (M3)** — define the strong C^k neighbourhoods first, then use the compact-exhaustion perturbation argument. Both are untouched.

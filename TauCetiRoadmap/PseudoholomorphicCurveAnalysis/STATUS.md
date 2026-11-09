<!--tauceti-status:v1 {"roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Morrey, algebra, composition and change of variables at higher order; half-disc extension theorem; vector-valued local Rellich","state":"partial"},{"id":"Layer 2","remaining":"adapted totally real charts, isothermal coordinates, bordered holomorphic groupoid, Schottky double","state":"partial"},{"id":"Layer 3","remaining":"higher-order Hölder gain, W1p bound for T, Sobolev-coefficient and boundary estimates, vector similarity principle","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"Maslov index of a bundle pair and Riemann–Roch; only splitting-step ingredients exist","state":"partial"}],"readme_sha":"f762f4519c513495dc09fc5660364df608999050b6c8a75ed9349f303fc52e2e","roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c"}-->
# Status: PseudoholomorphicCurveAnalysis

This file documents the status of the PseudoholomorphicCurveAnalysis roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations are partly built. Layer 3 has its basic planar operators, the definitions of Layer 2 are in place, and Layer 1 has its local Sobolev class but not yet the embedding and composition theorems. Nothing has been proved yet about Sobolev maps from surfaces, nonlinear bootstrapping, Fredholm theory or Riemann–Roch (Layers 4–6), and Layer 7 has only some groundwork.

### Named results

- **The Calderón–Zygmund inequality for `∂̄`**: in every `Lᵖ` with `1 < p < ∞`, the full derivative of a map from the plane is bounded by its `∂̄`. This is the analytic engine of every later estimate ([`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)).
- **Boundedness of the Beurling transform on `Lᵖ`**: the Beurling operator is the bounded extension to `Lᵖ`, for `1 < p < ∞`, of its Fourier multiplier on `L²` ([`beurlingLp`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/Beurling.html#TauCeti.beurlingLp)).
- **Hölder gain for the Cauchy transform**: for a source supported in a fixed disc, the Cauchy integral is `C^{1,α}` on each output disc and solves `∂̄T f = f` ([`exists_contDiffOn_holderOnWith_fderiv_pi_inv_smul_integral_sub_inv_smul`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Pompeiu/Holder/Gain.html#TauCeti.exists_contDiffOn_holderOnWith_fderiv_pi_inv_smul_integral_sub_inv_smul)).
- **Weyl's lemma for `∂̄`**: a distributional solution of `∂̄u = 0` with finite-dimensional complex values agrees almost everywhere with a holomorphic function ([`HasWeakConjWirtingerDerivOn.exists_differentiableOn_ae_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/Weyl.html#TauCeti.HasWeakConjWirtingerDerivOn.exists_differentiableOn_ae_eq)).
- **Lagrangians are totally real**: a Lagrangian embedding is a totally real embedding for every tame almost complex structure ([`IsLagrangianEmbedding.isTotallyRealEmbedding`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/TotallyReal/Basic.html#TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding.isTotallyRealEmbedding)).

### Notable definitions and infrastructure

- **Finite-regularity almost complex structures** ([`ContMDiffAlmostComplexStructure`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/ContMDiff.html#TauCeti.ContMDiffAlmostComplexStructure)) and their **domain-dependent families** ([`ContMDiffAlmostComplexStructureFamily`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/Family.html#TauCeti.ContMDiffAlmostComplexStructureFamily)) have pullbacks, products and chart expressions, and the inhomogeneous terms include Floer's equation. This is the data that the weak equation of Layer 4 will be stated over.
- **The local Sobolev class** [`MemWkpLoc`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Local/Basic.html#TauCeti.MemWkpLoc) is one definition over arbitrary subsets of `ℂ`. It takes weak derivatives in the interior and `Lᵖ` bounds on compact sets that reach the boundary, so it already serves the half-disc case.
- **The Cauchy transform** [`cauchyTransform`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Pompeiu/Basic.html#TauCeti.cauchyTransform) is McDuff–Salamon's `π⁻¹` normalisation. It is a right and left inverse of `∂̄` on compactly supported `C¹` data and is bounded on `Lᵖ` between fixed discs.

### Roadmap coverage

Layers 1, 2 and 3 are partial, and Layers 4, 5 and 6 are untouched. Layer 7 is partial only in a weak sense. In Layer 1 the class and its linear API are done. The higher-order reflection exists only as an operator on the normal line, and local Rellich only for scalar `W^{k,p}`. The Morrey, algebra, composition and change-of-variables theorems of 1.2 are not yet done. In Layer 2, 2.1 is essentially done, and 2.2 is done apart from stability under perturbation on manifolds; that result exists so far only for linear frames. For 2.3 there is the normal extension map whose derivative intertwines `i` with `J`, but not the chart. For 2.4 there is the closed half-plane model, constant-coefficient Beltrami maps and a topological double. In Layer 3, 3.1 is done at order zero, and 3.2 has Weyl's lemma and the smooth interior estimate. Sections 3.3–3.5, which need Sobolev coefficients, the boundary and the vector similarity principle, have not been started. In Layer 7 only ingredients of the Riemann–Roch splitting step exist: nowhere-vanishing sections in high rank and Hermitian metrics.

## The frontier

- **Higher-order Hölder and `W^{1,p}` bounds for `T` (PH3.1)**: extend the Hölder gain from `C^{0,α}` to `C^{k,α}`, and bound `T : Lᵖ(D_r) → W^{1,p}(D_R)`. With these, 3.1 is complete and the Beltrami contraction of 2.4 becomes possible.
- **Interior estimates with Sobolev coefficients (PH3.3)**: weak regularity and the estimate for `∂_s + J∂_t + S` with `J ∈ W^{ℓ,p}`. This is the linear input to bootstrapping, and it is blocked on the products and composition of PH1.2.
- **Products and composition in `W^{k,p}_loc` (PH1.2)**: Morrey, the algebra property, mixed exponents and the chain rule at higher order, proved by induction from the existing first-order files.
- **Adapted totally real charts (PH2.3)**: invert the normal extension map with the inverse function theorem to get a chart in which `L` is `ℝⁿ` and `J = i` along it.
- **Isothermal coordinates (PH2.4)**: the Beltrami solution with Hölder coefficients, the bordered holomorphic groupoid and the Schottky double as a Riemann surface. These depend on the higher-order part of 3.1.

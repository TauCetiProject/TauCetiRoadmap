<!--tauceti-status:v1 {"roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"7ff6709183647c204f5c0fd6302a14f6eaf0c0ac","ts":"2026-11-26T13:27:49Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"isothermal atlas on a surface from the planar charts; perturbation stability of totally real embeddings","state":"partial"},{"id":"Layer 3","remaining":"estimates above order one up to the totally real boundary (regularity is proved)","state":"partial"},{"id":"Layer 4","remaining":"weak differential, invariance on manifolds, totally real boundary predicate","state":"partial"},{"id":"Layer 5","remaining":"surface statements of bootstrapping; uniform estimates for converging data and at the boundary","state":"partial"},{"id":"Layer 6","remaining":"Fredholm property, duality and agreement with the smooth theory for real Cauchy–Riemann operators","state":"partial"},{"id":"Layer 7","remaining":"Maslov index of a bundle pair and Riemann–Roch; only model-case index computations and point twisting exist","state":"partial"}],"readme_sha":"f23778fe3388fd44d3dc3cf8d6bfb4b53b92301613b73854837431a984395c99","roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"7ff6709183647c204f5c0fd6302a14f6eaf0c0ac"}-->
# Status: PseudoholomorphicCurveAnalysis

This file documents the status of the PseudoholomorphicCurveAnalysis roadmap up until `7ff6709` (2026-11-26T13:27:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The planar analysis is essentially complete. The local Sobolev theory is done, and the linear estimates with Sobolev coefficients and the similarity principle have landed. The headline bootstrapping theorem is proved in planar form, both in the interior and at a totally real boundary. What remains is mostly on the manifold side: isothermal atlases on surfaces, the rest of Layer 4, the surface versions of bootstrapping, the Fredholm theorem, and Riemann–Roch.

### Named results

- **Elliptic bootstrapping, planar form**: a weak solution of `∂ₛu + J(z,u)∂ₜu = η(z,u)` with `C^ℓ` data is in `W^{ℓ+1,p}_loc` and is smooth for smooth data. The [boundary version](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/Weak/Bootstrap/Boundary.html#TauCeti.memWkpLoc_of_isWeakCauchyRiemannOn_halfPlane) holds on the half-plane with a totally real boundary condition. This is McDuff–Salamon Theorem B.4.1 in coordinates ([`memWkpLoc_of_isWeakCauchyRiemannOn`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/Weak/Bootstrap.html#TauCeti.memWkpLoc_of_isWeakCauchyRiemannOn)).
- **Interior estimates with Sobolev coefficients**: for `∂ₛξ + J∂ₜξ + Sξ = η` with `J` and `S` only Sobolev, `ξ` gains one derivative over `η` at every order. The constant is uniform over bounded coefficients (McDuff–Salamon Lemma B.4.6 and Proposition B.4.9; [`crInteriorEstimate`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/RoughCoefficients/HigherOrder/Estimate.html#TauCeti.crInteriorEstimate)).
- **Regularity up to a totally real boundary**: on the half-plane, weak solutions with Sobolev coefficients and a totally real boundary condition are `W^{k+1,q}` up to the real axis at every order. The proof reflects the equation across the axis ([`IsWeakCRSolutionHalf.memWkpLoc_succ_of_hasWeakFDerivOn`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/RoughCoefficients/HalfPlane/HigherOrder.html#TauCeti.IsWeakCRSolutionHalf.memWkpLoc_succ_of_hasWeakFDerivOn)).
- **The Carleman similarity principle**: near a zero, a weak solution of a vector Cauchy–Riemann equation is an invertible Sobolev frame times a holomorphic map. Unique continuation and isolated zeros of positive order follow ([`exists_similarity_of_isWeakLinearCauchyRiemannOn`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/Similarity/Weak.html#TauCeti.exists_similarity_of_isWeakLinearCauchyRiemannOn)).
- **The Calderón–Zygmund inequality for `∂̄`**: in every `Lᵖ` with `1 < p < ∞`, the full derivative of a planar map is bounded by its `∂̄`. Every estimate above rests on it ([`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)).

### Notable definitions and infrastructure

- **The local Sobolev class** [`MemWkpLoc`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Local/Basic.html#TauCeti.MemWkpLoc) now has its full toolkit on discs and half-discs: Morrey, products, composition and its continuity, change of variables, and Rellich. The bootstrapping induction uses all of them.
- **Weak pseudoholomorphic maps** ([`IsWeakPseudoholomorphic`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Sobolev/Pseudoholomorphic.html#TauCeti.IsWeakPseudoholomorphic)) from a Riemann surface are read off as the planar weak equation in charts. They are the hypothesis that the surface version of bootstrapping will need.
- **Isothermal coordinates in the plane** ([`exists_isothermal_chart_ckHolder`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Beltrami/Isothermal.html#TauCeti.Beltrami.exists_isothermal_chart_ckHolder)): every `C^{ℓ,α}` structure has a local `C^{ℓ+1,α}` chart in which it is `i`, and the chart is smooth for smooth structures. These are the local charts from which surface atlases will be built.

### Roadmap coverage

- **Layer 1 is done**: interior and half-disc embeddings, products, composition with continuity, change of variables, and Rellich with `Cᵏ` convergence.
- **Layers 2 and 3 are partial, each with one gap.** Layer 2 has its structures, totally real embeddings, adapted charts, the Schottky double and local isothermal charts. It lacks stability of totally real embeddings under perturbation of `J`, and isothermal charts are not yet assembled into an atlas on a surface. In Layer 3, 3.1–3.3 and 3.5 are done, the boundary similarity principle being stated for the standard structure `i`. In 3.4, regularity up to the boundary holds at every order, but the boundary estimate only at order one.
- **Layers 4–7 are partial.** Layer 4 has the class of maps and the weak equation, and planar invariance under biholomorphic chart changes. It lacks the weak differential, invariance on manifolds and the boundary predicate. Layer 5 has the planar bootstrapping theorems and planar interior compactness with fixed data, but no surface statement. Layer 6 has its spaces and operators, Rellich and Morrey, and the regularity of annihilators, but no Fredholm theorem. Layer 7 has only model index computations, point twisting and local-index groundwork.

## The frontier

- **Bootstrapping on surfaces (PH5.1)**: transfer the planar theorems through isothermal and adapted charts. The boundary case uses the `C^{ℓ−1}` pushed-forward structure, so it needs `ℓ ≥ 2`. This is blocked on the rest of PH4 and the isothermal atlas.
- **The rest of PH4**: the weak differential `du`, invariance under biholomorphisms and diffeomorphisms on manifolds, and the totally real boundary predicate.
- **The isothermal atlas (PH2.4)**: assemble the local charts into a holomorphic atlas on a surface, and prove the converse construction.
- **Higher-order boundary estimates and PH5.2**: prove the boundary estimate above order one with uniform constants. Then extend compactness to converging data and to the boundary case.
- **The Fredholm theorem (PH6.3)**: the estimates, the similarity principle and the regularity of annihilators are now available. What remains is to assemble them in charts. Riemann–Roch (PH7.2) and the Maslov index of a bundle pair (PH7.1) follow after it.

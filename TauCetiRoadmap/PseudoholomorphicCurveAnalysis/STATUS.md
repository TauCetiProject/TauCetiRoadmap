<!--tauceti-status:v1 {"roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"7ff6709183647c204f5c0fd6302a14f6eaf0c0ac","ts":"2026-11-26T13:27:49Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Compactness and composition continuity across the full requested exponent range on half-discs are not established by the extract","state":"partial"},{"id":"Layer 2","remaining":"Perturbation stability of totally real embeddings; lift planar isothermal coordinates to the surface atlas comparison","state":"partial"},{"id":"Layer 3","remaining":"Higher-order quantitative boundary estimates; similarity and unique continuation for variable structures at the boundary","state":"partial"},{"id":"Layer 4","remaining":"Intrinsic weak differential, invariance under manifold coordinate changes, and totally real boundary predicate","state":"partial"},{"id":"Layer 5","remaining":"Intrinsic manifold bootstrapping; uniform compactness for varying data and up to the boundary","state":"partial"},{"id":"Layer 6","remaining":"Global Fredholm property, adjoint duality, kernel regularity and agreement with the smooth theory","state":"partial"},{"id":"Layer 7","remaining":"Doubled bundle and bundle-pair Maslov index; general Riemann–Roch and line-bundle vanishing theorem","state":"partial"}],"readme_sha":"f23778fe3388fd44d3dc3cf8d6bfb4b53b92301613b73854837431a984395c99","roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"7ff6709183647c204f5c0fd6302a14f6eaf0c0ac"}-->
# Status: PseudoholomorphicCurveAnalysis

This file documents the status of the PseudoholomorphicCurveAnalysis roadmap up until `7ff6709` (2026-11-26T13:27:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The planar theory now reaches nonlinear bootstrapping in the interior and in adapted totally real boundary coordinates. The intrinsic surface theorems and uniform boundary compactness remain partial; the general Fredholm and Riemann–Roch theorems are not established here.

### Named results

- **Interior elliptic bootstrapping** — for finite p > 2, a weak W¹ᵖ solution with C^ℓ domain-dependent, inhomogeneous data gains regularity to W^{ℓ+1,p} locally ([`memWkpLoc_of_isWeakCauchyRiemannOn`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/Weak/Bootstrap.html#TauCeti.memWkpLoc_of_isWeakCauchyRiemannOn)).
- **Elliptic bootstrapping at a totally real boundary** — the adapted planar model gains the same derivative when the boundary subspace is flat and J is normalized along it; this does not yet supply the intrinsic manifold statement ([`memWkpLoc_of_isWeakCauchyRiemannOn_halfPlane_prod`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/Weak/Bootstrap/Boundary.html#TauCeti.memWkpLoc_of_isWeakCauchyRiemannOn_halfPlane_prod)).
- **Interior estimates with Sobolev coefficients** — for p > 2 and p/(p−1) < q ≤ p, solutions of ∂ₛξ + J∂ₜξ + Sξ = η satisfy estimates at every admissible order, uniformly under coefficient norm bounds ([`crInteriorEstimate`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/RoughCoefficients/HigherOrder/Estimate.html#TauCeti.crInteriorEstimate)).
- **The Carleman similarity principle** — continuous W¹ᵖ complex structures and Lᵖ zeroth-order terms, p > 2, admit a local factorization of weak solutions into an invertible Sobolev frame and a holomorphic map ([`exists_similarity_of_isWeakLinearCauchyRiemannOn`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/Similarity/Weak.html#TauCeti.exists_similarity_of_isWeakLinearCauchyRiemannOn)).
- **Planar compactness under gradient bounds** — for fixed smooth nonlinear data, compact image bounds and local gradient bounds give a subsequence converging locally with all derivatives to a solution ([`exists_subseq_tendstoLocallyUniformlyOn_of_isWeakCauchyRiemannOn`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/Weak/Compactness/Uniform.html#TauCeti.exists_subseq_tendstoLocallyUniformlyOn_of_isWeakCauchyRiemannOn)).

### Notable definitions and infrastructure

- **Local Sobolev calculus** now supplies higher-order products and composition on half-discs, including continuity of composition for p > 2 and a [boundary Rellich theorem with Cᵏ convergence](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Local/Compactness/ContDiff/HalfDisc.html#Module.Basis.exists_subseq_memWkpLoc_inter_setOf_im_nonneg_tendstoLocallyUniformlyOn_iteratedFDeriv).
- **Weak pseudoholomorphic maps** allow domain-dependent structures and inhomogeneous terms, providing the chartwise equation to which planar bootstrapping applies ([`IsWeakPseudoholomorphic`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Sobolev/Pseudoholomorphic.html#TauCeti.IsWeakPseudoholomorphic)).
- **Sobolev sections over compact surfaces** provide the operator spaces; [compact lower-order inclusion on closed manifolds](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Sobolev/Rellich.html#TauCeti.SobolevSection.isCompactOperator_lowerOrderL) and bordered Morrey regularity support the future Fredholm argument.

### Roadmap coverage

All seven layers remain partial. Layer 1's interior calculus is done, and its boundary calculus now includes higher-order products, composition and Cᵏ compactness for p > 2; the full requested exponent range is not established by the truncated extract. Layer 2 has finite-regularity structures, adapted charts and the Schottky double, plus planar [isothermal coordinates](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Beltrami/Isothermal.html#TauCeti.Beltrami.exists_isothermal_chart_ckHolder); perturbation stability and the surface atlas construction remain. Layer 3 retains completed PH3.1–3.2 and now has interior Sobolev-coefficient estimates and vector similarity; higher-order quantitative boundary estimates and variable-structure boundary similarity remain. Layer 4 still lacks the intrinsic weak differential, manifold invariance and boundary predicate. Layer 5 has planar bootstrapping and fixed-data interior compactness, with manifold transfer and varying-data boundary compactness outstanding. Layer 6 has spaces, operators and compactness infrastructure but no general Fredholm theorem. Layer 7 retains model index computations and point twisting; the bundle-pair Maslov index and general Riemann–Roch remain open.

## The frontier

- **Higher-order boundary estimates (PH3.4)** — turn higher-order boundary regularity into quantitative estimates uniform under Sobolev coefficient bounds.
- **Intrinsic surface regularity (PH2.4, PH4, PH5.1)** — lift planar coordinates to the surface atlas, construct the weak differential and transport laws, and apply adapted charts to the manifold boundary theorem.
- **Uniform compactness with varying data (PH5.2)** — extend fixed-data planar compactness to converging structures and forcing terms on surfaces, including the boundary and its limiting condition.
- **Fredholm theory (PH6.3)** — globalize the estimates, identify range annihilators with adjoint solutions, and establish duality and kernel regularity before passing to rough compact perturbations.
- **Riemann–Roch (PH7)** — construct the doubled bundle and its Maslov index, then connect the general Fredholm index to the Chern and Euler characteristic formula.

<!--tauceti-status:v1 {"roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f","ts":"2026-11-18T04:36:49Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Rellich up to the half-disc boundary above order one; continuity of composition above order one","state":"partial"},{"id":"Layer 2","remaining":"existence of isothermal charts on a surface; perturbation stability of totally real embeddings","state":"partial"},{"id":"Layer 3","remaining":"order-zero lemma and estimates for Sobolev coefficients (3.3), boundary estimates (3.4), vector similarity principle (3.5)","state":"partial"},{"id":"Layer 4","remaining":"weak differential, invariance under biholomorphisms and diffeomorphisms, totally real boundary predicate","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"Fredholm property, duality and agreement with the smooth theory for real Cauchy–Riemann operators","state":"partial"},{"id":"Layer 7","remaining":"Maslov index of a bundle pair and Riemann–Roch; only model-case index computations and point twisting exist","state":"partial"}],"readme_sha":"f23778fe3388fd44d3dc3cf8d6bfb4b53b92301613b73854837431a984395c99","roadmap":"PseudoholomorphicCurveAnalysis","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f"}-->
# Status: PseudoholomorphicCurveAnalysis

This file documents the status of the PseudoholomorphicCurveAnalysis roadmap up until `bf5b062` (2026-11-18T04:36:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The constant-coefficient core of Layer 3 (PH3.1–3.2) and the adapted charts of PH2.3 are done. The Schottky double and the weak pseudoholomorphic equation on surfaces now exist. The variable-coefficient estimates (PH3.3–3.5), bootstrapping, the Fredholm theorem and Riemann–Roch have groundwork but none of their main theorems.

### Named results

- **The Calderón–Zygmund inequality for `∂̄`**: in every `Lᵖ` with `1 < p < ∞`, the full derivative of a map from the plane is bounded by its `∂̄`. This is the analytic engine behind the later estimates ([`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/CalderonZygmund.html#TauCeti.exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv)).
- **Interior regularity for `∂̄`**: a solution in `L^p_loc` whose `∂̄` lies in `W^{k,p}_loc` is in `W^{k+1,p}_loc`, with the interior estimate ([`HasWeakConjWirtingerDerivOn.memWkpLoc_succ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Wirtinger/Regularity.html#TauCeti.HasWeakConjWirtingerDerivOn.memWkpLoc_succ)).
- **Morrey's embedding at every order, up to the boundary**: for `p > 2`, a map in `W^{k+1,p}_loc` agrees almost everywhere with a `Cᵏ` map ([`MemWkpLoc.exists_contDiffOn_ae_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Local/Morrey/Higher.html#TauCeti.MemWkpLoc.exists_contDiffOn_ae_eq)). On a half-disc the `C^{k,1−2/p}` representative reaches the flat edge ([`Wkp.exists_contDiffOn_holderOnWith_iteratedFDeriv_complexHalfDisc`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Wkp/Planar.html#TauCeti.Wkp.exists_contDiffOn_holderOnWith_iteratedFDeriv_complexHalfDisc)).
- **Adapted charts along a totally real submanifold**: near any point there is a chart that flattens the submanifold onto `ℝⁿ` and turns `J` into `i` along it. The charts can be chosen to converge when the data converge, and this now holds for embeddings into manifolds ([`IsTotallyRealEmbedding.exists_adaptedChart`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/TotallyReal/AdaptedChart.html#TauCeti.IsTotallyRealEmbedding.exists_adaptedChart)).
- **The Schottky double**: two copies of a Riemann surface with boundary, glued along the boundary by Schwarz reflection of the charts, form a Riemann surface without boundary ([`SchottkyDouble.instIsManifold`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/BorderedHolomorphic/SchottkyDouble.html#TauCeti.SchottkyDouble.instIsManifold)).

### Notable definitions and infrastructure

- **The local Sobolev class** [`MemWkpLoc`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Local/Basic.html#TauCeti.MemWkpLoc) has products, composition and change of variables at every order. Through it, Sobolev maps from Riemann surfaces are defined, and for `p > 2` [it suffices to test one atlas](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Sobolev/LocalMap/Atlas/Higher.html#TauCeti.memWkpLocMap_iff_of_subset_maximalAtlas_of_two_lt) at every order.
- **Weak pseudoholomorphic maps** ([`IsWeakPseudoholomorphic`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Sobolev/Pseudoholomorphic.html#TauCeti.IsWeakPseudoholomorphic)) allow domain-dependent `J` and inhomogeneous terms. They are read off as the planar weak equation in charts and agree with the classical notion for `C¹` maps. This is the hypothesis of the bootstrapping theorem PH5.1.
- **Sobolev sections over compact surfaces**, with or without boundary, give Layer 6 its domain and target spaces. They now come with [Rellich compactness](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Sobolev/Rellich.html#TauCeti.SobolevSection.isCompactOperator_lowerOrderL) on closed manifolds and a Morrey embedding for bordered surfaces.

### Roadmap coverage

- **Layer 1 is partial.** The interior theory is done. On half-discs, Morrey now holds at every order and mixed products at order one. Rellich up to the boundary above order one and continuity of composition above order one are still missing.
- **Layer 2 is partial.** 2.1 and 2.3 are done. 2.2 lacks stability under perturbation of `J`. 2.4 has the Beltrami chart, the holomorphic atlas built from given isothermal charts, the bordered groupoid, the closed disc and now the Schottky double. It is not yet proved that isothermal charts exist on every surface.
- **Layer 3 is partial.** 3.1 and 3.2 are done. 3.3 has the exponent ladder and the differentiated system, but not the order-zero lemma or the estimate. 3.4 has the half-disc trace condition, Green's formula and the reflected adjoint, but no estimate. 3.5 lacks the vector similarity principle.
- **Layers 4, 6 and 7 are partial.** Layer 4 has the class of maps and the weak equation with coordinates, comparison and locality. It lacks the weak differential, invariance and the boundary condition. Layer 6 has its spaces, operators, Rellich and Morrey theorems and compact multiplication, but no Fredholm theorem. Layer 7 has model index computations (the disc for every Maslov index, the annulus, the torus) and point twisting. It has no Maslov index of a bundle pair and no Riemann–Roch.
- **Layer 5 is untouched.** The only related result is compactness of weak solutions for the constant structure `i`.

## The frontier

- **Estimates with Sobolev coefficients (PH3.3)**: prove the order-zero lemma (McDuff–Salamon Lemma B.4.6), then run the induction. The ladder, the differentiated system and divergence-form Laplace regularity are all in place.
- **The vector similarity principle (PH3.5)**: produce [`HasSimilarityFactorizationAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/CauchyRiemann/UniqueContinuation.html#TauCeti.HasSimilarityFactorizationAt) for `W^{1,p}` structures and `Lᵖ` zeroth-order terms. Unique continuation and isolated zeros then follow from theorems already proved.
- **Existence of isothermal charts (PH2.4)**: rescale the Beltrami coefficient and apply the planar Beltrami chart to show that every surface has isothermal charts.
- **The rest of PH4**: the weak differential `du`, invariance under biholomorphisms and diffeomorphisms, and the totally real boundary predicate.
- **Boundary estimates (PH3.4) and bootstrapping (PH5.1)**: reflect the variable-coefficient equation and climb the orders up to the boundary. Both are blocked on PH3.3, and the Fredholm theorem of PH6.3 waits on the same estimates.

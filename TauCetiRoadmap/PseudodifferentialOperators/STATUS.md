<!--tauceti-status:v1 {"roadmap":"PseudodifferentialOperators","to_sha":"5b5d5152e4ad63b4ce6da9c1ba84c74226026aa4","ts":"2026-11-24T09:13:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Sym^j connection expansion of symbols, metric formal adjoints of general bundle operators, weighted-circle Bochner counterexample","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"bundle and density Schwartz kernel theorem; proper support and transpose on bundles","state":"partial"},{"id":"Layer 4","remaining":"chart-map coordinate changes, patched global bundle quantization with atlas independence, global principal-symbol sequence","state":"partial"},{"id":"Layer 5","remaining":"bundle H^(s,p), Besov and Zygmund spaces; operator mapping on compact bundles; equivariant averaging on manifolds","state":"partial"},{"id":"Layer 6","remaining":"patched parametrix, Fredholm property on compact bases, solvability, index independence of s","state":"partial"},{"id":"Layer 7","remaining":"A^z as a classical operator, order change of index, equivariant product index theorem, elliptic-complex Hodge theory","state":"partial"},{"id":"Layer 8","remaining":"scalar Laplacian H^2 realization, normalized pullback on H^2, resolvent and spectral-projection intertwining","state":"partial"},{"id":"Layer 9","remaining":"general admissible pullback along smooth maps, manifold and bundle wave front sets","state":"partial"}],"readme_sha":"1beba27726fd6066fb32d8e4bf4ab512b035dcd25c8d874b8fa6a144672b859b","roadmap":"PseudodifferentialOperators","to_sha":"5b5d5152e4ad63b4ce6da9c1ba84c74226026aa4"}-->
# Status: PseudodifferentialOperators

This file documents the status of the PseudodifferentialOperators roadmap up until `5b5d515` (2026-11-24T09:13:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Euclidean theory is now close to complete. It has the symbol calculus (Layer 2 is done), distributional elliptic regularity, microlocality, L^p bounds and nonlinear coordinate changes, and Layer 1's differential operators on bundles are nearly finished. Nothing pseudodifferential has reached a manifold yet: bundle quantization, the patched parametrix, Fredholm theory, elliptic powers and the product index have not started.

### Named results

- **Distributional elliptic regularity**: if a classical symbol of order m is elliptic and its operator P is properly supported, then Pu ∈ H^s near x forces an arbitrary distribution u into H^(s+m) near x ([`IsElliptic.isLocallySobolevAt_of_quantizeDistribution`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/ProperSupport/EllipticRegularity.html#TauCeti.ClassicalSymbol.IsElliptic.isLocallySobolevAt_of_quantizeDistribution)).
- **Microlocality**: a properly supported pseudodifferential operator does not enlarge the wave front set, and an elliptic one preserves it exactly ([`waveFrontSet_quantizeDistribution_subset`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/ProperSupport/Microlocality.html#TauCeti.Symbol.waveFrontSet_quantizeDistribution_subset), [`IsElliptic.waveFrontSet_quantizeDistribution`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/ProperSupport/Microlocality.html#TauCeti.ClassicalSymbol.IsElliptic.waveFrontSet_quantizeDistribution)).
- **L^p boundedness of order-zero operators**: a symbol of order 0 with estimates uniform in x gives a bounded operator on L^p for 1 < p < ∞ ([`exists_quantizeUniformOrderZeroLp_of_one_lt`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Lp/CalderonZygmund.html#TauCeti.Symbol.exists_quantizeUniformOrderZeroLp_of_one_lt)). It extends the Calderón–Vaillancourt L² bound.
- **Changes of coordinates (Kuranishi's trick)**: transporting Op(a) along a diffeomorphism κ of ℝⁿ gives a pseudodifferential operator. Classical symbols stay classical, and the principal symbol transforms by the cotangent map ([`ClassicalSymbol.exists_quantizeSchwartzValue_comp_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/CoordinateChange.html#TauCeti.ClassicalSymbol.exists_quantizeSchwartzValue_comp_eq)). The theorem assumes compact spatial support and an invertible averaged derivative of κ.
- **Sunada's theorem**: for almost-conjugate subgroups acting freely by isometries on a closed manifold, the two quotients have isomorphic Laplace eigenspaces ([`nonempty_linearEquiv_weakEigenspace`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Quotient/Isospectral/Weak.html#Subgroup.AlmostConjugate.nonempty_linearEquiv_weakEigenspace)). This covers weak H¹ eigenspaces and smooth eigenspaces, not the H² route the roadmap specifies.

### Notable definitions and infrastructure

- **Classical symbols** ([`ClassicalSymbol`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Symbol/Classical.html#TauCeti.ClassicalSymbol)): they are closed under composition, adjoints, averaging over compact groups and diffeomorphism pullback ([`ClassicalSymbol.pullback`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Symbol/Pullback.html#TauCeti.ClassicalSymbol.pullback)).
- **The properly supported parametrix** ([`exists_hasPropagationLE_quantizeSchwartzValue_eq_add_and_eq_add`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Composition/ProperParametrix.html#TauCeti.Symbol.IsEllipticAbove.exists_hasPropagationLE_quantizeSchwartzValue_eq_add_and_eq_add)): this is a two-sided inverse modulo smoothing operators, with kernel within any prescribed distance of the diagonal.
- **The product of distributions** ([`Distribution.product`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/Product.html#Distribution.product)): it is defined when no wave front covectors at a common point are opposite, and comes with Hörmander's wave front bound.

### Roadmap coverage

Layer 2 is done; the other eight layers are partial.

- **Layer 1** is nearly complete. It has higher jets, the Bochner connection and Dirac-type D*D. It lacks the Sym^j∇^j connection expansion of symbols, existence of metric formal adjoints for general bundle operators, and the weighted-circle Bochner counterexample as a theorem.
- **Layers 3, 4 and 5** are complete on ℝⁿ except for a few items: the joint (s,p) interpolation, and coordinate changes along chart maps between open sets. Every bundle form is missing. That means the density Schwartz kernel theorem, the patched global quantization with atlas independence, and the global principal-symbol sequence. It also means bundle H^(s,p), Besov and Zygmund spaces, operator mapping on compact bundles, and equivariant averaging on manifolds.
- **Layer 6** has parametrices and regularity on ℝⁿ, including distributional regularity, global estimates and the four-dimensional nonlinear bootstrap. The patched parametrix, Fredholm theory on compact bases, solvability and index independence are missing.
- **Layer 7** has ingredients only. These are powers of homogeneous principal symbols, parameter-dependent and weakly parameter-dependent calculi with contour integrals, the cut-off external product symbol, and the de Rham symbol complex.
- **Layer 8** has Sunada isospectrality and normalized pullback on L² and H¹. It lacks the scalar Laplacian's H² realization and the resolvent and spectral-projection intertwining.
- **Layer 9** has the Euclidean wave front calculus. It covers pseudolocality, microlocal elliptic regularity, diffeomorphism invariance, products and proper pushforward. General admissible pullback and the manifold and bundle versions are missing.

## The frontier

- **Global bundle quantization**: patch chart quantizations into a class on vector bundles, prove atlas independence and the principal-symbol exact sequence. The Euclidean coordinate and frame changes now exist, but only for diffeomorphisms of all of ℝⁿ, not chart maps between open sets.
- **Patched parametrix and Fredholm theory**: assemble Σ ψ_j Q_j φ_j from the properly supported local parametrices. This needs bundle quantization first.
- **Sobolev scales on bundles**: H^(s,p)(E) for p ≠ 2 is still missing, and the p = 2 version is not shown independent of its chart partition. Besov and Zygmund spaces on bundles are also missing, and so is operator mapping on them.
- **Elliptic powers**: only σ^z of a positive homogeneous symbol and abstract spectral powers exist. A^z still has to be built as a classical operator of order dz via the resolvent contour integral and matched with the spectral power.
- **Admissible pullback**: pullback is proved along linear inclusions, submersions and diffeomorphisms. The general criterion WF(u) ∩ N_f = ∅ for an arbitrary smooth map, and the manifold versions, remain.

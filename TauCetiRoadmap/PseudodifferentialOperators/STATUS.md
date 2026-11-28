<!--tauceti-status:v1 {"roadmap":"PseudodifferentialOperators","to_sha":"b4f07355dff5247676a8ca6f3ba39d26e14385fb","ts":"2026-11-28T06:58:08Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Sym^j connection expansion of symbols, metric formal adjoints of general bundle operators, weighted-circle Bochner counterexample","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"Schwartz kernel theorem for bundle- and density-valued kernels on manifolds","state":"partial"},{"id":"Layer 4","remaining":"bundle principal-symbol exact sequence over noncompact bases; audit of the 4.2 checklist against the new manifold class","state":"partial"},{"id":"Layer 5","remaining":"joint (s,p) interpolation","state":"partial"},{"id":"Layer 6","remaining":"Fredholm property and index theory for elliptic operators between vector bundles","state":"partial"},{"id":"Layer 7","remaining":"A^z as a classical operator of order dz, equivariant product index theorem, elliptic-complex Hodge theory","state":"partial"},{"id":"Layer 8","remaining":"scalar Laplacian H^2 realization and normalized pullback on H^2","state":"partial"},{"id":"Layer 9","remaining":"wave front sets of distributions on manifolds and bundles","state":"partial"}],"readme_sha":"1beba27726fd6066fb32d8e4bf4ab512b035dcd25c8d874b8fa6a144672b859b","roadmap":"PseudodifferentialOperators","to_sha":"b4f07355dff5247676a8ca6f3ba39d26e14385fb"}-->
# Status: PseudodifferentialOperators

This file documents the status of the PseudodifferentialOperators roadmap up until `b4f0735` (2026-11-28T06:58:08Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Euclidean theory is essentially complete, and the calculus has now reached manifolds. Classical pseudodifferential operators exist on manifolds and between vector bundles, with parametrices, and scalar elliptic operators on compact manifolds are Fredholm. What is still missing is Fredholm theory between bundles, elliptic powers A^z as operators, the equivariant product index, and wave front sets on manifolds.

### Named results

- **Elliptic operators on compact manifolds are Fredholm**: a scalar elliptic classical operator of order m is Fredholm H^s(M) → H^(s−m)(M) for every real s ([`isFredholm_chartSobolevExtension`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Manifold/Fredholm.html#TauCeti.IsClassicalElliptic.isFredholm_chartSobolevExtension)). Its index does not depend on s ([`index_chartSobolevExtension_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Manifold/Fredholm.html#TauCeti.IsClassicalElliptic.index_chartSobolevExtension_eq)), and it is invariant under homotopies of the principal symbol.
- **The principal-symbol exact sequence on bundles**: on a compact manifold, 0 → Ψ^(m−1)(E, F) → Ψ^m(E, F) → S^m_hom(T*M∖0; Hom(E, F)) → 0 is exact ([`sectionClassicalPrincipalSymbolLinearMap_surjective`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Manifold/VectorBundle/SymbolQuantization.html#TauCeti.sectionClassicalPrincipalSymbolLinearMap_surjective)).
- **Distributional elliptic regularity**: if a properly supported elliptic operator P of order m has Pu ∈ H^s near x, then an arbitrary distribution u lies in H^(s+m) near x ([`IsElliptic.isLocallySobolevAt_of_quantizeDistribution`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/ProperSupport/EllipticRegularity.html#TauCeti.ClassicalSymbol.IsElliptic.isLocallySobolevAt_of_quantizeDistribution)). This is proved on ℝⁿ.
- **Hörmander's pullback theorem**: a distribution whose wave front set meets no normal covector of a smooth map f pulls back along f, and its wave front set pulls back with it ([`Distribution.pullback`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/Pullback/SmoothMap.html#Distribution.pullback), [`waveFrontSet_pullback_subset`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/WaveFrontSet/Pullback/SmoothMap.html#Distribution.waveFrontSet_pullback_subset)). This is proved for maps between open sets of Euclidean space.
- **Sunada's theorem**: quotients of a closed manifold by almost-conjugate subgroups acting freely by isometries have self-adjoint Laplacians with the same spectrum and isomorphic eigenspaces ([`spectrum_negLaplacian_eq`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Quotient/Isospectral/Spectrum.html#Subgroup.AlmostConjugate.spectrum_negLaplacian_eq)).

### Notable definitions and infrastructure

- **Classical pseudodifferential operators between bundles** ([`sectionClassicalPseudodifferentialOperators`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Manifold/VectorBundle/Basic.html#TauCeti.sectionClassicalPseudodifferentialOperators)): properly supported operators whose matrix entries, compressed to any chart of the maximal atlas, are Euclidean classical quantizations. This builds in atlas independence, and the class is closed under composition, formal adjoints and diffeomorphisms.
- **Patched quantization** ([`exists_sub_patchedQuantization_mem_smoothingPseudodifferentialOperators`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Manifold/PatchedQuantization.html#TauCeti.exists_sub_patchedQuantization_mem_smoothingPseudodifferentialOperators)): on a σ-compact manifold, every operator is a locally finite sum of chart quantizations, modulo order −∞.
- **Sobolev spaces of sections** ([`sectionChartSobolevSpaceCongr`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Manifold/VectorBundle/Sobolev.html#TauCeti.sectionChartSobolevSpaceCongr)): H^s(M; E) does not depend on the charts, frames and cutoffs used to define it.

### Roadmap coverage

Layer 2 is done; the other eight layers are partial. The manifold material was read from the documentation and has not been audited item by item against the roadmap's checklists.

- **Layer 1** is unchanged. It lacks the Sym^j connection expansion of symbols, metric formal adjoints for general bundle operators, and the weighted-circle Bochner counterexample.
- **Layers 3 and 4** now reach manifolds and bundles. They have chart compressions, patched quantization, smooth kernels of smoothing operators on compact bases, transposes on bundle test sections, and the principal-symbol exact sequence (on compact bases for bundles, σ-compact for scalars). A Schwartz kernel theorem for bundle- or density-valued kernels has not been established here.
- **Layer 5** has Sobolev, H^(s,p), Besov and Hölder–Zygmund estimates for operators on manifolds and between bundles, chart-independent H^s(M; E), and averaging over compact groups on manifolds. Joint (s,p) interpolation is still missing.
- **Layer 6** is done for scalar operators on compact manifolds: parametrices, Fredholm property, regularity of kernels, and independence of s for the kernel, index and solvability. Between bundles there are parametrices, elliptic estimates and finite-dimensional kernels, but no Fredholm theorem.
- **Layer 7** has symbol powers, abstract index tools and a multiplicative equivariant index for intertwining maps, but A^z is not yet a classical operator.
- **Layer 8** has isospectrality, and the normalized pullback now intertwines resolvents and spectral projections. All of this runs through H¹, not the H² realization the roadmap specifies.
- **Layer 9** has the full Euclidean calculus, now including pullback along arbitrary smooth maps and elliptic regularity for systems, but nothing on manifolds.

## The frontier

- **Fredholm theory between bundles**: lift the scalar Fredholm and index theorems to P : H^(s+m)(E) → H^s(F). The bundle parametrix, Rellich theorem and Sobolev spaces are already in place.
- **Elliptic powers**: build A^z as a classical operator of order dz from the resolvent contour integral, and match it with the spectral power of the self-adjoint realization, which now exists ([`isSelfAdjoint_chartSobolevRealization`](https://taucetiproject.org/docs/TauCeti/Analysis/Pseudodifferential/Manifold/L2.html#TauCeti.IsClassicalElliptic.isSelfAdjoint_chartSobolevRealization)).
- **Equivariant product index**: combine the cut-off external product symbol and the equivariant index of intertwining maps into the index theorem for external products of elliptic operators.
- **Wave front sets on manifolds**: transport the Euclidean calculus, now diffeomorphism-invariant, to distributions on manifolds and bundles.
- **The H² Laplacian for Layer 8**: realize the scalar Laplacian with domain H², and show that the normalized pullback preserves it.

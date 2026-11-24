<!--tauceti-status:v1 {"roadmap":"Hyperfunctions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the relative Dolbeault complex, the orientation sheaf, the edge comparison over C in all degrees, derived composition of supports","state":"partial"},{"id":"Layer 1","remaining":"gluing of the one-dimensional quotient presheaf, the Sato sheaf B_M, bundle coefficients and hyperdensities","state":"partial"},{"id":"Layer 2","remaining":"Malgrange top vanishing, FS and duality theory, Stein-ness of polyhedra, compact duality, purity and flabbiness","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 3a","state":"untouched"},{"id":"Layer 4","remaining":"the Cauchy embedding on arbitrary opens and its uniqueness, the embedding in dimension n","state":"partial"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"cee591efee0bdf0a714b3416f4d3cc65e2594026f71ca9bafceb88d3ac08d123","roadmap":"Hyperfunctions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: Hyperfunctions

This file documents the status of the Hyperfunctions roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0's supported and local cohomology works for module coefficients, but it has no relative Dolbeault complex and no orientation sheaf. In dimension one the jump formula and a local Cauchy embedding are proved, but the quotient presheaf is not yet a sheaf. Layer 2 has gathered analytic inputs, but none of compact duality, purity or flabbiness is proved. Layers 3, 3a and 5 have not begun.

### Named results

- **The Sokhotski–Plemelj formula**: for a compactly supported distribution u on ℝ, the jump C_u(x + iγ) − C_u(x − iγ) of its Cauchy transform tends to u as γ → 0. This is §4.2's jump formula, proved under the name [`tendsto_integral_smul_cauchyTransform_sub`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/Plemelj.html#Distribution.tendsto_integral_smul_cauchyTransform_sub).
- **The Cauchy class determines the distribution**: on an open V with compact closure in Ω, the class of the Cauchy transform of u in O(ℂ ∖ ℝ)/O(W(V)) vanishes exactly when u vanishes on V ([`cauchyClass_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/Localization.html#TauCeti.Hyperfunction.cauchyClass_eq_zero_iff)). This is the local form of injectivity of the one-dimensional embedding.
- **The degenerate edge comparison**: if 𝓗_S^q(F) = 0 for q ≠ n, then H_Z^(n+j)(W, F) ≅ H_Z^j(W, 𝓗_Sⁿ(F)) for closed Z ⊆ S, in every degree j, for abelian sheaves ([`supportedHPresheafEdgeIso`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/LocalCohomology/Basic.html#CategoryTheory.Sheaf.supportedHPresheafEdgeIso)). For module coefficients only j = 0 is proved ([`supportedModuleHEdgeEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/LocalCohomology/Edge.html#CategoryTheory.Sheaf.supportedModuleHEdgeEquiv)).
- **Top-degree ∂̄-exactness from the Poisson equation**: a solution of Δv = 4f on an open set of ℂⁿ gives an explicit (0, n−1)-form whose ∂̄ is f dz̄₁ ∧ ⋯ ∧ dz̄ₙ ([`exists_contDiffOn_delBarCoeff_univ_eq_of_sum_iteratedFDeriv_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Wirtinger/TopDegree.html#TauCeti.exists_contDiffOn_delBarCoeff_univ_eq_of_sum_iteratedFDeriv_eq)). This is the last step of §2.0a's route to Malgrange's top-degree vanishing.
- **Schauder's theorem**: a bounded operator between real or complex Banach spaces is compact exactly when its adjoint is ([`isCompactOperator_precomp_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/Compact/Adjoint.html#ContinuousLinearMap.isCompactOperator_precomp_iff)).

### Notable definitions and infrastructure

- **Supported cohomology with module coefficients**, [`supportedModuleH`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology/Module.html#CategoryTheory.Sheaf.supportedModuleH), is Ext out of the relative free sheaf Q_S(W). Flasque resolutions compute it, and it is the coefficient setting the roadmap works in.
- **The Cauchy class** [`cauchyClass`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/Localization.html#TauCeti.Hyperfunction.cauchyClass) sends a distribution on Ω to a one-dimensional hyperfunction on each relatively compact V. It is independent of the cutoff and natural under both restrictions, so it is ready to be glued into the embedding of §4.2.
- **The strong dual of a compact inductive limit**, [`strongDualEquiv`](https://taucetiproject.org/docs/TauCeti/Analysis/LocallyConvex/CompactInductiveLimit.html#TauCeti.dualProjectiveLimit.strongDualEquiv), identifies it with the projective limit of the stage duals. It is the tool for making A[K] DFS.

### Roadmap coverage

**Layer 0 is partial.** §0.1 has the module-coefficient theory, derived functors as Ext, the scalar and forgetful comparisons, underived composition of supports and support truncation; the edge comparison is complete only for abelian coefficients. Missing from §0.1 are the formulation on `DerivedCategory.Plus`, derived composition of supports and the twist by an orientation local system. All of §0.2 (the relative Dolbeault complex) and §0.3 (the orientation sheaf) is missing. **Layer 1 is partial only through §1.3**: the quotient presheaf is separated but not a sheaf, and §§1.1, 1.2 and 1.4 are untouched. **Layer 2 is partial.** §2.0a has the filled exhaustion, analyticity of harmonic functions, the multipole expansion and the Δ-to-∂̄ step, but not harmonic Runge or the exhaustion limit. §2.0e has Schauder and compact inductive-limit duality. §2.1a has polynomial polyhedra with their plurisubharmonic exhaustion but no Stein conclusion. **Layer 4 is partial in dimension one**: it has the jump formula and the local Cauchy class, but not the embedding on arbitrary opens or §§4.1 and 4.3–4.6. **Layers 3, 3a and 5 are untouched**; only the delta-series divergence that §5.2 contrasts with exists.

## The frontier

- **The Cauchy embedding in dimension one**: uniqueness of `IsCauchyEmbedding` needs only cutoffs, restriction and separatedness, all present. Existence and the full embedding need `oneDimBoundaryPresheaf_isSheaf`, which waits on Cousin I on open subsets of ℂ from GlobalHolomorphicFunctions §7.4.
- **The edge comparison over ℂ**: transport the abelian all-degree edge comparison to complex coefficients through the coefficient comparisons, and prove 𝓗_S^q(F ⊗ L) ≃ 𝓗_S^q(F) ⊗ L for an orientation local system L.
- **Malgrange top vanishing**: the Δ-to-∂̄ step is done. What remains is solving Δv = 4f on an arbitrary open set, which needs the Newton potential of a compact distribution, harmonic Runge by Hahn–Banach and the exhaustion limit, plus the (p, q) sign for p ≥ 1. The separation step needs ComplexKahlerGeometry §5.3's compact-distribution dual.
- **The orientation sheaf**: define or_(M/X) = 𝓗ⁿ_M(ℤ_X), compute its stalks in normal coordinates and prove the square pairing. Every definition of Layer 1 depends on it.
- **The relative Dolbeault complex**: build A^(p,•)(W, W ∖ S) in the relative coordinates and identify it with H^q_S(W, Ω^p). This needs ComplexKahlerGeometry §2.5's Dolbeault resolution.

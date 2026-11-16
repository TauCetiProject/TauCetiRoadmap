<!--tauceti-status:v1 {"roadmap":"Hyperfunctions","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
# Status: Hyperfunctions

This file documents the status of the Hyperfunctions roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** HF0's supported cohomology now works for module coefficients, with support truncation and the lowest edge comparison, but no orientation sheaf or Dolbeault cone. HF1 has only the separated one-dimensional quotient presheaf. HF2's analytic preparation has many inputs but none of its main theorems. HF4 has the one-dimensional Cauchy transform and Plemelj formula, without the embedding. Purity, flabbiness, duality, HF3, HF3a and HF5 have not begun.

### Named results

- **The Sokhotski–Plemelj formula**: for a compactly supported distribution u on ℝ, the jump C_u(x + iγ) − C_u(x − iγ) of its Cauchy transform tends to u as γ → 0. This is HF4's identity bv₊C_u − bv₋C_u = u ([`tendsto_integral_smul_cauchyTransform_sub`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/Plemelj.html#Distribution.tendsto_integral_smul_cauchyTransform_sub)).
- **The degenerate edge comparison, lowest case**: if 𝓗_S^q(F) = 0 for q < n, then H_Zⁿ(W, F) ≃ Γ_Z(W, 𝓗_Sⁿ(F)) for closed Z ⊆ S ([`supportedModuleHEdgeEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/LocalCohomology/Edge.html#CategoryTheory.Sheaf.supportedModuleHEdgeEquiv)). The case n = 0 is also proved in every degree j ([`bijective_postcomp_mk₀_supportedSectionsι`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/LocalCohomology/Basic.html#CategoryTheory.Sheaf.bijective_postcomp_mk₀_supportedSectionsι)).
- **Support truncation**: if 𝓗_S^q(F) vanishes for every q < n, then so does H_S^q(W, F) on every open W. This turns local purity into global vanishing ([`subsingleton_supportedModuleH_of_isZero_supportedModuleHSheaf`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/LocalCohomology/Edge.html#CategoryTheory.Sheaf.subsingleton_supportedModuleH_of_isZero_supportedModuleHSheaf)).
- **Derived supported sections are Ext**: the right derived functors of F ↦ Γ_S(W, F) agree with Ext out of Q_S(W), and flasque resolutions compute them ([`rightDerivedSupportedSubmoduleSectionsIso`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology/Derived.html#CategoryTheory.Sheaf.rightDerivedSupportedSubmoduleSectionsIso)).
- **Schauder's theorem**: a bounded operator between real or complex Banach spaces is compact exactly when its adjoint is. FunctionalDuality needs it ([`isCompactOperator_precomp_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/Compact/Adjoint.html#ContinuousLinearMap.isCompactOperator_precomp_iff)).

### Notable definitions and infrastructure

- **Supported cohomology with module coefficients** [`supportedModuleH`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology/Module.html#CategoryTheory.Sheaf.supportedModuleH) is Ext out of the relative free sheaf Q_S(W), following the roadmap's recipe. It is sheafified into the local cohomology sheaves [`supportedModuleHSheaf`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/LocalCohomology/Module.html#CategoryTheory.Sheaf.supportedModuleHSheaf). Both have long exact coefficient sequences.
- **The Cauchy transform of a distribution** [`cauchyTransform`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/CauchyTransform.html#Distribution.cauchyTransform) is holomorphic off ℝ and independent of the cutoff. It is HF4's representative once one-dimensional hyperfunctions form a sheaf.
- **The strong dual of a compact inductive limit** [`strongDualEquiv`](https://taucetiproject.org/docs/TauCeti/Analysis/LocallyConvex/CompactInductiveLimit.html#TauCeti.dualProjectiveLimit.strongDualEquiv) identifies it with the projective limit of the stage duals, and bounded sets lie in a single stage. With bounded holomorphic Banach stages and Montel compactness of restriction, this is the apparatus for making A[K] DFS.

### Roadmap coverage

**HF0 is partial.** Already proved:
- the supported theory, excision, flasque acyclicity and local cohomology sheaves for module coefficients
- comparisons of supported sections with restriction of scalars and with underlying abelian groups
- enough injectives in larger universes
- the derived-functor and flasque-resolution comparisons
- support truncation and the edge comparison for j = 0
- FlasqueLocality with its finite-product and locally finite-power corollaries
- relative coordinates (a, b) ↦ (da, fa − db) on the shifted mapping cone

Still missing from HF0:
- the edge comparison for j > 0
- the Dolbeault relative cone itself
- the orientation sheaf and its square pairing
- relative integration and cup-product signs

**HF1 is partial only in dimension one**: the quotient presheaf is separated, but has no gluing. **HF2's analytic preparation is partial.** It has the filled exhaustion, analyticity of harmonic functions, the Dirichlet problem on balls, the multipole expansion and harmonic polynomial approximation of the Newtonian kernel, Schauder's theorem and the compact inductive-limit duality. Neither Malgrange top vanishing nor Stein duality is proved. HF2.1a has polynomial convexity, polyhedron interiors and their strictly plurisubharmonic exhaustion, but no Stein conclusion. **HF4 is partial in dimension one** as described above. **HF2.1b to HF2.3, HF3, HF3a and HF5 are untouched.**

## The frontier

- **Higher edge comparison**: extend H_Zⁿ ≃ Γ_Z(W, 𝓗_Sⁿ) to H_Z^(n+j)(W, F) ≃ H_Z^j(S, 𝓗_Sⁿ(F)) for j > 0, through the local hypercohomology filtration. Flabbiness needs j = 1.
- **One-dimensional gluing and embedding**: prove the existence half of the sheaf condition for O(ℂ ∖ ℝ)/O(W(U)), which needs GH0's vanishing of H¹ on open subsets of ℂ. Then send u to the class of its Cauchy transform and prove naturality under restriction.
- **Orientation sheaf**: define or_(M/X) = 𝓗_Mⁿ(ℤ_X), compute its stalks by Euclidean relative cohomology and prove or ⊗ or ≃ ℤ_M. HF1's definition of B_M depends on it.
- **Harmonic Runge and Malgrange top vanishing**: the multipole expansion and kernel approximation are done. Remaining: the Newton potential of a compact distribution, Hahn–Banach separation, the weak Poisson solution and the exhaustion limit. The separation needs K5a's compact-distribution dual.
- **The germ space A[K] as a DFS space**: apply the compact inductive-limit duality to cofinal H^∞ stages near a real compact, prove Hausdorffness by jet evaluations, and conclude Stein-ness of polyhedron interiors from the exhaustion via R3.1's criterion.

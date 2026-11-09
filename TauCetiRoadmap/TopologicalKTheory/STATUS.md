<!--tauceti-status:v1 {"roadmap":"TopologicalKTheory","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
# Status: TopologicalKTheory

This file documents the status of the TopologicalKTheory roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Work so far sits entirely in T1, the bundle category and its Grassmannian carriers, and much of it is in place. Homotopy invariance, classification and the stable carriers in T1 are still missing. Nothing toward K-groups (T2) or later layers has landed, apart from two pieces of groundwork for T4.

### Named results

- **Bundles are summands of trivial bundles** — over a compact Hausdorff base, every real or complex finite-rank bundle embeds in a trivial bundle, and the orthogonal complement of its image completes it to a trivial bundle ([`exists_biprod_iso_trivial`](https://taucetiproject.org/docs/TauCeti/Topology/VectorBundle/FiniteRank/Complement.html#TauCeti.FiniteRankBundleCore.exists_biprod_iso_trivial)).
- **Existence of Riemannian metrics** — a real finite-rank bundle over a normal paracompact base carries a continuous metric, built with a partition of unity ([`nonempty_continuousRiemannianMetric`](https://taucetiproject.org/docs/TauCeti/Topology/VectorBundle/Riemannian/Existence.html#TauCeti.nonempty_continuousRiemannianMetric)).
- **Ranges of projections form a bundle** — the images of a continuous family of projections form a vector bundle, of locally constant rank ([`rangeVectorBundle`](https://taucetiproject.org/docs/TauCeti/Topology/VectorBundle/IdempotentRange.html#TauCeti.rangeVectorBundle)).
- **Constant-rank kernels are subbundles** — the kernels of a continuous bundle map of constant rank have continuous local frames, and therefore form a subbundle ([`hasLocalSubbundleFrames_ker`](https://taucetiproject.org/docs/TauCeti/Topology/VectorBundle/ConstantRank.html#TauCeti.hasLocalSubbundleFrames_ker)).
- **Extending bundle isomorphisms** — over a normal paracompact base, a bundle map that is continuous and invertible on a closed set extends to a neighbourhood of that set and stays invertible there ([`exists_continuous_clm_bundle_extension_isInvertible`](https://taucetiproject.org/docs/TauCeti/Topology/VectorBundle/Extension.html#TauCeti.exists_continuous_clm_bundle_extension_isInvertible)).

### Notable definitions and infrastructure

- **Finite-rank cores** ([`FiniteRankBundleCore`](https://taucetiproject.org/docs/TauCeti/Topology/VectorBundle/FiniteRank/Basic.html#TauCeti.FiniteRankBundleCore)) — bundles recorded as charts indexed by base points, with matrix transition maps. They form a preadditive category with Whitney-sum biproducts, pullback, duality, a [symmetric monoidal tensor product](https://taucetiproject.org/docs/TauCeti/Topology/VectorBundle/FiniteRank/Monoidal.html#TauCeti.FiniteRankBundleCore.instSymmetricCategory), realification and complexification. Conjugate, exterior-power and determinant functors are also present. This is the category that T2's group completion would act on, but it covers constant rank only.
- **The finite Grassmannian** ([`finiteGrassmannian`](https://taucetiproject.org/docs/TauCeti/Topology/Grassmannian/Basic.html#TauCeti.finiteGrassmannian)) — a quotient of frames, compared with Mathlib's `Module.Grassmannian`. It is compact and Hausdorff, has graph charts, and carries a tautological bundle with γ ⊕ γ⊥ trivial. It comes with rank and ambient stabilization maps, and the Whitney-sum map is covered by a tautological bundle isomorphism. The [infinite Grassmannian](https://taucetiproject.org/docs/TauCeti/Topology/Grassmannian/Infinite.html#TauCeti.infiniteGrassmannian.isColimit) is their colimit.
- **The companion pencil** ([`companionPencil_eq_mul`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/CompanionPencil.html#TauCeti.companionPencil_eq_mul)) — factors a polynomial's companion pencil into elementary matrices and diag(1, …, 1, p(z)), together with a continuous invertible homotopy between them. This is the first T4 ingredient for Bott periodicity.

### Roadmap coverage

**T1 is partial.** Done so far:

- **T1.2:** most bundle operations, for constant-rank cores.
- **T1.3:** metrics, and complements over compact bases.
- **T1.5:** most of the finite Grassmannian carrier: frame and orthonormal quotients, graph charts, tautological and complement bundles, and stabilization.

Missing in T1:

- **T1.1:** the variable-rank atlas category has its definition and the reconstruction of a total space from an atlas. Its full faithfulness and essential surjectivity against actual bundles are not established here.
- **T1.3:** splitting of short exact sequences and the homotopy of metric choices.
- **T1.4:** homotopy invariance over X×I and clutching. Only the cylinder-subdivision and isomorphism-extension lemmas exist.
- **T1.5:** the Stiefel fibrations and their connectivity bounds, and the Schubert cells. The sphere bundle SO(n) → SO(n+1) → Sⁿ is in place, but the general fibrations are not.
- **T1.6:** classification and the stable carriers, beyond the colimit topology on the infinite Grassmannian.

**T2, T3, T5, T6 and T7 are untouched.** T4 has only the companion-pencil algebra.

## The frontier

- **Homotopy invariance (T1.4)** — the cylinder-transport isomorphism pr_X*E₀ ≅ E over X×I. Continuous cylinder subdivisions, Hom-bundle continuity and extension of invertibility are all in place; the transport product and its independence of choices remain.
- **Atlas equivalence (T1.1)** — prove that the variable-rank atlas category is equivalent to actual finite-rank bundles, which gives essential smallness. T2.0's group completion needs this category.
- **Remaining T1.2 operations** — Hom bundles, the line-bundle identity Λʲ(L⊗E) ≅ L^⊗j ⊗ ΛʲE, and the coherence and base-change isomorphisms between the operations.
- **Grassmannian classification (T1.5–T1.6)** — the general Stiefel fibrations, Schubert cells and classifying maps into the stable Grassmannian.
- **K⁰ and KO⁰ (T2.0)** — group completion of the bundle category. It needs the atlas equivalence and, for homotopy invariance of K-classes, T1.4.

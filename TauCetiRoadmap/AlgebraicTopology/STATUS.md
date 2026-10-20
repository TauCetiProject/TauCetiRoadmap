<!--tauceti-status:v1 {"roadmap":"AlgebraicTopology","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1","ts":"2026-10-19T17:10:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Stage 1","state":"done"},{"id":"Stage 2","state":"done"},{"id":"Stage 3","state":"done"},{"id":"Stage 4","remaining":"chain-level cellular-singular comparison through the skeletal filtration exact couple","state":"partial"},{"id":"Stage 5","remaining":"Tor-Kunneth, Cartan-Leray and Serre spectral sequences; torus homology as exterior powers","state":"partial"},{"id":"Stage 6","remaining":"Ext spectral sequence, integral fundamental classes, Poincare and Poincare-Lefschetz duality, linking pairing","state":"partial"},{"id":"Stage 7","remaining":"fibre-bundle multiplicativity, which waits on the Serre spectral sequence","state":"partial"},{"id":"Stage 8","remaining":"relative Hurewicz, homological Whitehead, finite CW type of compact smooth manifolds and the homology-sphere corollary","state":"partial"}],"readme_sha":"42430a88b1b2cbc66f8e8420b8d0f8d2c9c8631fb654d6e030b63eaa499ce041","roadmap":"AlgebraicTopology","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
# Status: AlgebraicTopology

This file documents the status of the AlgebraicTopology roadmap up until `a5cde7b` (2026-10-19T17:10:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Van Kampen, relative singular homology, and excision with Mayer–Vietoris (Stages 1–3) are done. The CW, product, cohomology, Euler-characteristic and homotopy stages are well advanced: the absolute Hurewicz theorem, Whitehead's theorem, Künneth, and the homology of projective spaces are proved. Manifold duality, the relative Hurewicz theorem, and every spectral sequence except the Čech one are still missing.

### Named results

- **The van Kampen theorem** — for any open cover, the fundamental groupoid is the colimit of the fundamental groupoids of the finite intersections ([`TauCeti.FundamentalGroupoid.isColimitCechCocone`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/FundamentalGroupoid/Cech/Colimit.html#TauCeti.FundamentalGroupoid.isColimitCechCocone)). The based and free-product corollaries follow.
- **Excision and Mayer–Vietoris** — relative singular homology is unchanged by removing a set whose closure lies in the interior of the subspace ([`TopPair.isIso_singularHomologyMap_excisionMap_compl`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Singular/Excision.html#TopPair.isIso_singularHomologyMap_excisionMap_compl)). The Mayer–Vietoris sequence is derived from it.
- **The Hurewicz theorem** — for an `(n−1)`-connected space and `n ≥ 2`, the Hurewicz map `πₙ(X) → Hₙ(X; ℤ)` is a natural isomorphism ([`HomotopyGroup.cubicalHurewiczSingularHomologyAddEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/Hurewicz/Comparison.html#HomotopyGroup.cubicalHurewiczSingularHomologyAddEquiv)), and lower homology vanishes in positive degrees.
- **Whitehead's theorem** — a weak homotopy equivalence between spaces of CW type is a homotopy equivalence ([`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/Whitehead.html#ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv)).
- **Projective spaces** — `H₂ᵢ(CPⁿ; R) ≅ R` for `i ≤ n` and the odd groups vanish ([`TauCeti.ComplexProjectiveSpace.singularHomologyIso`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Cellular/ComplexProjective.html#TauCeti.ComplexProjectiveSpace.singularHomologyIso)), so `χ(CPⁿ) = n + 1`. The homology of `RPᴺ` is computed with any coefficients, `ℤ/2` in odd degrees below `N` integrally.

### Notable definitions and infrastructure

- **Comparison of Mathlib's CW structures** — a classical relative CW complex in a Hausdorff space becomes a categorical one ([`TauCeti.toRelativeCWComplex`](https://taucetiproject.org/docs/TauCeti/Topology/CWComplex/Classical/RelativeCWComplex.html#TauCeti.toRelativeCWComplex)), and conversely, with round trips returning the same cells. A complex built by attaching cells can now use the cellular theory.
- **The Čech–singular double complex** — its total complex is quasi-isomorphic to singular chains ([`TauCeti.quasiIso_cechTotalAugmentation`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cech/OrderedQuasiIso.html#TauCeti.quasiIso_cechTotalAugmentation)). Its spectral sequence has its first page identified and vanishes beyond the cover's size.
- **Top homology of compact manifolds from local homology** — top homology is the module of parallel families of local classes ([`TauCeti.isLimitLocalHomologySystemCone`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/TopHomology.html#TauCeti.isLimitLocalHomologySystemCone)). Local orientations come from manifold orientations and transport along paths. This is the ground for fundamental classes.

### Roadmap coverage

Stages 1–3 are done. Stage 4 has the cellular–singular comparison on homology, for infinite-dimensional complexes when sequential colimits are exact. It also has incidence numbers as local degrees of attaching maps, the degree-`m` two-cell check, projective spaces, cofibrations, cellular approximation, and both directions of the CW comparison. It lacks the chain-level comparison through the skeletal filtration. Stage 5 has Eilenberg–Zilber, Künneth over fields and PIDs with natural sequences and splittings, the Wang sequence, transfer for constant- and variable-degree covers with the permutation local system, first homology of tori natural in integer matrices, and the Čech items. It lacks the Tor, Cartan–Leray and Serre spectral sequences and the exterior-power torus calculation. Stage 6 has cochains, universal coefficients, cup, cap and cross products, twisted cup products and local orientations. It lacks the Ext spectral sequence, integral fundamental classes, duality and linking. Stage 7 lacks only fibre-bundle multiplicativity. Stage 8 has relative homotopy functors, the Kan–cubical comparison, the cube-to-sphere quotient, absolute Hurewicz and Whitehead. It lacks relative Hurewicz, homological Whitehead and the manifold corollaries.

## The frontier

- **Relative Hurewicz and homological Whitehead** — the relative Hurewicz map exists, but not the connectivity theorem for based pairs or the degree-two commutativity argument. Homological Whitehead for simply connected complexes follows from it with the mapping cylinder.
- **Serre spectral sequence** — the spectral sequence of a filtered space exists with finite convergence, and fibre bundles give Serre fibrations. What remains is the skeletal filtration of the total space and `E² = H_p(B; H_q(F))` with monodromy. Bundle Euler multiplicativity waits on it.
- **Fundamental classes and Poincaré duality** — the compact simply connected case gives `Hₙ(M) ≅ R`. The integral fundamental class of an oriented compact manifold, both forms of duality, and the linking pairing remain. They consume differential geometry's orientation API.
- **Algebraic spectral sequences** — the bicomplex machinery is in place, but the Künneth Tor, universal-coefficient Ext and Cartan–Leray spectral sequences are absent.
- **Manifolds of finite CW type** — waits on geometric topology's smooth triangulation, and then gives the homology-sphere corollary.

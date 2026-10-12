<!--tauceti-status:v1 {"roadmap":"RestrictedProducts","to_sha":"df51a897f47dacef2dc5f45a9f0ac5b1d40fd313","ts":"2026-10-06T10:29:26Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"b567d4f0e9dcab90bac40cb2136ee29376d5e34a63b9896302f43d3d4d046c6d","roadmap":"RestrictedProducts","to_sha":"df51a897f47dacef2dc5f45a9f0ac5b1d40fd313"}-->
# Status: RestrictedProducts

This file documents the status of the RestrictedProducts roadmap up until `df51a89` (2026-10-06T10:29:26Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All four layers are done. Every export in the README's contract is proved, and rejection tests show which hypotheses cannot be dropped. The sum splitting now holds for an arbitrary filter, as the README asks. Nothing is partial or untouched. What comes next belongs to the roadmaps that consume this one.

### Named results

- **The away-`S` decomposition** — for a finite set `S` of indices, a restricted product is the plain product of the factors at `S` times the restricted product away from `S`. It is continuous for every reference family, and a homeomorphism once the reference subgroups away from `S` are open ([`awayDecomposition`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Away/Decomposition.html#TauCeti.awayDecomposition), [`continuous_awayDecomposition_symm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Away/Decomposition.html#TauCeti.continuous_awayDecomposition_symm)).
- **Non-open reference subgroups can break the group topology** — take copies of `ℚ` with the trivial subgroups as reference family, so the restricted product is the finitely supported sequences with the final topology over their finite-dimensional stages. That restricted product is not a topological group ([`not_isTopologicalGroup_restrictedProduct_rat_bot`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/NotContinuousMul.html#TauCeti.not_isTopologicalGroup_restrictedProduct_rat_bot)), so the inverse of the cofinite sum splitting is discontinuous ([`not_continuous_restrictedProductSum_symm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/NotContinuousMul.html#TauCeti.not_continuous_restrictedProductSum_symm)), and so is the inverse of the away decomposition.
- **The sum splitting over any filter** — over `ι₁ ⊕ ι₂`, a restricted product is the product of the restricted products over the summands, with respect to the comap filters ([`restrictedProductSum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Sum.html#TauCeti.restrictedProductSum)). For a principal filter it is a homeomorphism for every reference family ([`continuous_restrictedProductSum_symm_of_principal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Sum.html#TauCeti.continuous_restrictedProductSum_symm_of_principal)).
- **The continuity criterion for diagonals** — the diagonal of continuous coordinate homomorphisms is continuous when a single cofinite set of indices is integral for every element ([`continuous_rationalDiagonal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Diagonal.html#TauCeti.continuous_rationalDiagonal)). Pointwise eventual integrality is not enough ([`continuous_eval_and_not_continuous_rationalDiagonal_range_coeMonoidHom`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Diagonal.html#TauCeti.continuous_eval_and_not_continuous_rationalDiagonal_range_coeMonoidHom)).
- **The surjectivity criterion for componentwise maps** — a componentwise map is surjective exactly when every coordinate map is surjective and all but finitely many carry the source reference subgroup onto the target one ([`restrictedProductMap_surjective_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Map.html#TauCeti.restrictedProductMap_surjective_iff)). So for coordinatewise isomorphisms, eventual bijectivity on reference subgroups is necessary for an equivalence, not just sufficient.

### Notable definitions and infrastructure

- **Componentwise maps from eventual preservation** — [`restrictedProductMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Map.html#TauCeti.restrictedProductMap) accepts coordinate maps that preserve the reference subgroups only outside a finite set, which is how arithmetic supplies them.
- **Change of reference family and double cosets** — [`restrictedProductCongr`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Congr/Basic.html#TauCeti.restrictedProductCongr) identifies the restricted products of two families that agree off a finite set, continuously in both directions. Double-coset spaces transport along it only to the transported subgroups ([`doubleCosetCongr`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Congr/DoubleCoset.html#TauCeti.doubleCosetCongr)).
- **Additive forms** — the maps, equivalences and diagonal also exist for additive groups, for instance [`addAwayDecomposition`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Away/Decomposition.html#TauCeti.addAwayDecomposition) and [`addRationalDiagonal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/RestrictedProduct/Diagonal.html#TauCeti.addRationalDiagonal). An adelic consumer needs these to split the adeles of a global field along finitely many places and to embed the field diagonally.

### Roadmap coverage

All four layers are done. Layer 0 has:

- the integral subgroups, with both eventual comparison theorems (neither assumes the reference family open);
- compactness with no openness hypothesis;
- bundled compact open families.

Layer 1 has componentwise maps, change of factors, change of reference family and reindexing, each with coordinate formulas and continuity in both directions. Layer 2 has restriction away from `S`, the sum splitting (now over an arbitrary filter, which settles rejection test 10), the finite collapse, and the away-`S` decomposition. Layer 3 has the diagonal with its coordinate formula, injectivity criterion, compatibility laws and continuity criterion.

## The frontier

- **Orthogonal adelic point groups.** OrthogonalSpinGroups' Layer 3 builds its adelic orthogonal and spin point groups on these carriers, restriction maps and diagonals. Every name it imports now exists, but no other TauCeti module imports these files yet.
- **The successor roadmaps.** The README assigns the following to successor roadmaps (`AlgebraicGroupStrongApproximation`, `ArithmeticReductionTheory`, `TamagawaMeasures`, `AdelicFourierAnalysis`), none of which is in the roadmap repository yet:
  - compact open families from integral models;
  - strong approximation and reduction theory;
  - Tamagawa measures and adelic Fourier analysis.
- **Continuity of the inverse sum splitting for other filters.** The inverse of the sum splitting is proved continuous in two cases:
  - for principal filters, with any reference family;
  - for the cofinite filter, with open reference subgroups.

  No other filter is covered, and the roadmap does not ask for more.
- **Aliases once FLT's layer reaches Mathlib.** The README wants the ported change of factors, reindexing and eventual comparison lemmas to become aliases once FLT's second restricted-product layer is upstreamed.

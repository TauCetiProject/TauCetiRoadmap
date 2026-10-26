<!--tauceti-status:v1 {"roadmap":"KhovanovHomology","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: KhovanovHomology

This file documents the status of the KhovanovHomology roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** K1, K2 and K3 are all partial. The circles of a smoothing, the graded circle algebra with its merge and split maps, and the state-sum form of the Jones comparison are in place, but no Khovanov complex of a diagram exists yet. Nothing for G or for K4–K7 has landed.

### Named results

- **The enhanced state sum computes the Jones polynomial.** For a nonempty oriented diagram, the signed count of enhanced states by bidegree is `(q + q⁻¹)` times the Jones polynomial at `t^(1/2) = −q` ([`enhancedStateSum_eq_mul_eval₂_jonesPolynomial`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/EnhancedState.html#TauCeti.OrientedPDCode.enhancedStateSum_eq_mul_eval₂_jonesPolynomial)). The empty diagram has sum `1`. This is the chain-level half of the K3 Euler characteristic theorem.
- **Cube edges change at most one circle.** When two states differ at one crossing, they never both have two circles through it. So two circles merge, one splits, or one circle is replaced by one ([`card_circlesAt_add_card_circlesAt_le_three`](https://taucetiproject.org/docs/TauCeti/KnotTheory/PDCode/ResolvedCircle/Adjacent.html#TauCeti.PDCode.card_circlesAt_add_card_circlesAt_le_three)).
- **The boundary-count criterion for chord diagrams.** A chord diagram with `m` bands has at most `m + 1` boundary cycles, with equality exactly when no two bands interleave ([`orbitCount_finRotate_mul_add_orbitCount_eq_iff`](https://taucetiproject.org/docs/TauCeti/Combinatorics/ChordDiagram.html#Function.Involutive.orbitCount_finRotate_mul_add_orbitCount_eq_iff)). This is the one-vertex step of the README's planar disc/band argument.
- **The circle count of a smoothing.** For every state, the finite set of resolved circles, crossing-free components included, has exactly the native loop count `stateLoopCount` of elements (`card_resolvedCircle`).
- **The Khovanov Frobenius equation.** The dual numbers with `Δ1 = 1⊗ε + ε⊗1` and `Δε = ε⊗ε` satisfy the Frobenius equation ([`isFrobenius`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Frobenius.html#TauCeti.Khovanov.isFrobenius)), and their Frobenius form is a perfect pairing.

### Notable definitions and infrastructure

- **The signed cube totalization** ([`cubeComplex`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/Cube/Basic.html#CategoryTheory.Functor.cubeComplex)). It turns any commutative cube of subsets into a cochain complex with the roadmap's sign convention, functorially in the cube. The resolution cube will be fed into it.
- **Graded circle tensors** ([`CircleTensor`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/CircleTensor.html#TauCeti.Khovanov.CircleTensor)). Each finite circle set gets one copy of `R[ε]` per circle, with the enhanced-state basis and the [quantum grading](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/QuantumGrading.html#TauCeti.Khovanov.quantumGrading). Merging and splitting along an arbitrary map of circle sets is functorial and has degree `|τ| − |σ|`. The [split](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Split.html#TauCeti.Khovanov.fiberwiseSplit) is defined as the adjoint of the merge for the Frobenius pairing, so relabelling circles never introduces a sign.
- **Resolution merge and split maps** ([`resolutionMergeMap`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Merge.html#TauCeti.PDCode.resolutionMergeMap), [`resolutionSplitMap`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/ResolutionSplit.html#TauCeti.PDCode.resolutionSplitMap)). These act on the actual resolved-circle tensors along the saddle correspondence, have degree `−1` and are mutually adjoint. They have explicit enhanced-state formulas, so they are the edge maps of the future Khovanov cube.

### Roadmap coverage

**K1** is partial. Done: the circle quotient and its count, transport under relabelling, slot rotation, mirror, disjoint union and crossing-free label permutations, the adjacent-state analysis with its saddle and unchanged-circle correspondences, and the chord-diagram boundary-count lemmas. Missing: the link component type, move data and marks; the spanning-tree contraction deriving noncrossing from `IsPlanar`, and with it the planar merge/split classification; partial and vertex resolution; the PL disc models; and the local planar calculus. **K2** is partial. Done: the Frobenius algebra, its quantum grading with the degrees of `m`, `Δ`, unit and counit, circle tensors with the enhanced-state basis, and merge and split on actual configurations. Missing: the mixed merge/split relations on actual cube faces and the whole formal local cobordism category with `S`, `T`, `4Tu`, its `χ` grading and the `Mat_` envelope. **K3** is partial. Done: the generic totalization, the state cochain degree and quantum shift, and the state-sum Jones identity. Missing: crossing reordering, face restriction, cones, the Khovanov complex itself, its homology and finiteness, Euler–Poincaré, and the formal open-diagram complexes. **G** and **K4–K7** are untouched.

## The frontier

- **Planar cube edges are merges or splits.** Contract a spanning tree of each ribbon graph, carry the native Euler equality of `IsPlanar` to the one-vertex chord diagram, and apply the boundary-count criterion. This rules out the one-to-one change on planar codes.
- **The Khovanov complex.** Put the resolution merge and split maps on the edges of the resolution cube and prove that faces commute, which needs the two-crossing face configurations. Then apply the totalization with the normalized shifts. This depends on the item above.
- **The Euler characteristic of `Kh`.** Prove Euler–Poincaré quantum component by quantum component, which turns the state-sum identity into `χ_q Kh(D;ℤ) = (q+q⁻¹)·eval(T↦−q, jonesPolynomial)`. This is blocked on the complex.
- **Completing the cube API.** Add the crossing-reordering chain isomorphism with subset-permutation signs, face restriction, height shifts and the mapping-cone description.
- **The formal local cobordism category.** Build the surface presentations, the cell-count grading and the `S`, `T`, `4Tu` quotient. These come before the formal complexes of K3 and every Reidemeister homotopy in K4.

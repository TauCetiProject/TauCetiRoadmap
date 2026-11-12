<!--tauceti-status:v1 {"roadmap":"KhovanovHomology","to_sha":"941bb58ae04c2464c632a44d715f17b21b6bea5e","ts":"2026-11-12T09:51:59+11:00"}-->
# Status: KhovanovHomology

This file documents the status of the KhovanovHomology roadmap up until `941bb58` (2026-11-12T09:51:59+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Khovanov homology of planar oriented diagrams is defined, finite and computes the Jones polynomial, so the algebraic core of K1–K3 is in place. It is not yet a link invariant. K1, K2, K3, K5 and K6 are partial, and G, K4 and K7 have not begun.

### Named results

- **Khovanov's theorem** — for a nonempty planar oriented diagram, the graded Euler characteristic of `Khⁱʲ(D;R)` is `(q + q⁻¹)` times the Jones polynomial at `t^(1/2) = −q`, over a Noetherian ring with the rank-nullity property, such as `ℤ` or a field ([`khovanovEulerChar_eq_mul_eval₂_jonesPolynomial`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/EulerCharacteristic.html#TauCeti.OrientedPDCode.khovanovEulerChar_eq_mul_eval₂_jonesPolynomial)).
- **The planarity criterion** — a PD code with connected graph is planar exactly when the chord diagram left by contracting a spanning tree has no interleaving bands ([`isPlanar_iff_isNoncrossingMatching`](https://taucetiproject.org/docs/TauCeti/KnotTheory/PDCode/ChordDiagram.html#TauCeti.PDCode.isPlanar_iff_isNoncrossingMatching)).
- **Planar cube edges are merges or splits** — two states of a planar code that differ at one crossing either merge two circles or split one, never replace one circle by another ([`IsPlanar.card_circlesAt_eq_two_or_card_circlesAt_eq_two`](https://taucetiproject.org/docs/TauCeti/KnotTheory/PDCode/ResolvedCircle/Planar.html#TauCeti.PDCode.IsPlanar.card_circlesAt_eq_two_or_card_circlesAt_eq_two)).
- **The faces of the resolution cube commute** — the two routes around every square face give the same composite of merges and splits ([`resolutionEdgeMap_comp_resolutionEdgeMap_comm`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Resolution/Edge.html#TauCeti.PDCode.resolutionEdgeMap_comp_resolutionEdgeMap_comm)).
- **The skein mapping cone** — at any crossing, the unnormalized complex is the mapping cone of the saddle map between the complexes of the two resolutions ([`khovanovBracketMappingConeIso`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Resolution/Skein.html#TauCeti.PDCode.khovanovBracketMappingConeIso)).

### Notable definitions and infrastructure

- **The normalized Khovanov complex** ([`khovanovComplex`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Complex.html#TauCeti.OrientedPDCode.khovanovComplex)) and its [homology](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Homology.html#TauCeti.OrientedPDCode.khovanovHomology). Each quantum component is a bounded complex of finite free modules supported in `[−n₋, n₊]`. It is isomorphic to a [finite-free enhanced-state model](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Computational.html#TauCeti.OrientedPDCode.khovanovEnhancedComplexIso) with explicit differentials.
- **The cube toolkit** — [crossing reordering](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/Cube/Reindex.html#CategoryTheory.Functor.cubeComplexReindexIso), the [cube complex as a mapping cone](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/Cube/MappingCone.html#CategoryTheory.Functor.cubeComplexMappingConeIso) along any index and [dual cubes](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/Cube/Dual/Complex.html#CategoryTheory.Functor.dualCubeComplexIso). These give the skein cone and the [mirror comparison](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Mirror.html#TauCeti.OrientedPDCode.khovanovComplexMirrorIso), which identifies the complex of the mirror with the dual complex.
- **The reduced complex** at a mark ([`reducedKhovanovComplex`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Khovanov/Reduced.html#TauCeti.OrientedPDCode.reducedKhovanovComplex)). It is the image of the `X` action, with the short exact sequence `0 → C̃⟨−1⟩ → C → C̃⟨1⟩ → 0`.

### Roadmap coverage

**K1** is partial. Done: circles, their count and transport; link components with their count; marks; words of Reidemeister moves; resolution at a single crossing; the planar merge/split classification via spanning-tree contraction. Missing: the PL disc/band models, the local planar calculus with gluing and closures, and component bijections for all native moves. **K2** is partial. The Frobenius object, circle tensors, graded maps and the merge/split face relations are done, but the formal local cobordism category with `S`, `T`, `4Tu`, its `χ` grading and the `Mat_` envelope has not started. **K3** is partial. The signed cube with reordering and cones, the complex, homology, finiteness, Euler–Poincaré and the Jones identity are done. The formal open-diagram complexes, planar insertion and closed Frobenius evaluation are missing. **K5** is partial. It has the unnormalized skein cone, the mirror-dual complex, the reduced complex with its sequence, the `X` action at a mark and parity of quantum degrees. Missing: the normalized long exact sequence, universal coefficients, Künneth, Ext-level mirror duality, orientation reversal, the `q = 1` value, mark slides and connected sum. **K6** is partial: the empty link, unknot and unlinks are computed, but there are no matrices, Smith-normal-form certificates, Hopf links, trefoils or torus links. **G**, **K4** and **K7** are untouched, apart from combinatorial resolution lemmas for kinks that prepare the first Reidemeister move.

## The frontier

- **Reidemeister invariance (K4).** Construct the chain homotopy equivalences for the first, second and third moves and their variants, then deduce invariance along move words. The skein cone, reordering isomorphisms and kink resolutions are the available tools. The README asks for these as formal local maps, so the full version waits on the cobordism category.
- **Normalized skein sequence and coefficients (K5).** Translate the skein cone through the `n₊, n₋` shifts and signs into the normalized long exact sequence. Then prove the universal-coefficient and Künneth sequences for bounded finite free complexes, and turn the mirror-dual complex into the Hom/Ext statement on homology.
- **Certified computations (K6).** Build integer matrices and Smith-normal-form certificates on the enhanced-state model. Then compute the Hopf links and both trefoils, including the `ℤ/2` at `(3,7)` for the positive trefoil.
- **The formal local cobordism category (K2).** Build surface presentations, the cell-count grading, the `S`, `T`, `4Tu` quotient and the `Mat_` envelope. These are needed for K3's open-diagram complexes and K4's local homotopies.
- **Plane geometry (G).** The smooth plane-diagram adapter and the relative Reidemeister theorem are needed before invariance can be stated for smooth links rather than PD codes.

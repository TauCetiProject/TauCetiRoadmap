<!--tauceti-status:v1 {"roadmap":"TensorProductCombinatorics","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"hive types, interpolation and concavity, boundary_antitone; fixed-boundary fibres and hiveCount; the polyhedral, largest-lift, counting and cone-series lanes","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"3155030e622c34c533019e2722efe5a762d86bc3b14774ae9120acd6578036ae","roadmap":"TensorProductCombinatorics","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: TensorProductCombinatorics

This file documents the status of the TensorProductCombinatorics roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the opening of Layer 1 exists: the triangular lattice, its dihedral symmetries and its unit rhombi. No hive, hive count, honeycomb, puzzle or comparison theorem has landed, and Layers 2 through 9 have not begun.

### Notable definitions and infrastructure

- **The triangular lattice** — [`Vertex`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.Vertex) is the finite type of nonnegative barycentric triples of sum n, with the third-turn [rotation](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.Vertex.rotate), a [reflection](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.Vertex.reflect) and translation into larger triangles; it is the index set every hive, and through hives every later layer, will be a function on.
- **Unit rhombi** — [`IsRhombus`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.IsRhombus) is a decidable predicate on four vertices in perimeter order with the obtuse corners marked, so the hive inequality h(b) + h(d) ≤ h(a) + h(c) can be stated without further bookkeeping; rhombi are closed under all the lattice symmetries.
- **The Euclidean model** — the equilateral [planar embedding](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.Vertex.plane) is injective and halves barycentric squared distances, so the rhombus diagonals have [planar squared lengths 1 and 3](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.IsRhombus.diagonal_dist_sq), as the README asks.

### Roadmap coverage

Layer 1 is partial: of §1.1, the lattice, rhombi, symmetries and the Euclidean comparison are done, but the hive types themselves (integral and real hives, gauge comparisons, interpolation and the concavity criterion, `boundary_antitone`) are not; §§1.2–1.6 (fixed-boundary polytopes and `hiveCount`, the rational polyhedron and Farkas adapters, largest lifts, vector-partition counting and the rational cone series) are untouched. Layers 2–9 (Gelfand–Tsetlin and Littlewood–Richardson comparisons, the octahedron recurrence, honeycombs and saturation, puzzles, Grassmannian cohomology, Hermitian spectra and Horn, type-A crystals, and the commutor) are untouched. Tau Ceti has generic crystal and LS-path files that Layer 8 would specialize, but none of the type-A objects or comparisons that Layer 8 itself owns.

## The frontier

- **Hives and their boundaries** — define integral and real normalized hives on the lattice and prove `boundary_antitone`, so that each side of an integer hive is a dominant weight; this is the next step and needs only what is now in place plus `TauCeti.DominantWeight`.
- **Finite fibres and the hive count** — prove that fixed-boundary integral fibres are finite, giving `hiveCount`, together with the entry bounds and finite output support of §1.2; every counting theorem downstream rests on this.
- **The concavity criterion** — interpolation of a lattice function is concave exactly when all rhombus inequalities hold, by the adjacent-triangle bending test; this is what lets Layers 4 and 7 pass between hives and real geometry.
- **The polyhedral adapters** — the Farkas certificate with unrestricted equality multipliers and the largest-lift selection of §§1.3–1.4, which saturation in Layer 4 needs.
- **The hive Littlewood–Richardson rule** — the summit `schur_mul_eq_finsum_hiveCount` waits on all of the above and on the Layer 2 comparisons with Gelfand–Tsetlin patterns and Littlewood–Richardson tableaux, the latter consumed from SchurWeyl.

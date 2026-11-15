<!--tauceti-status:v1 {"roadmap":"CoboundaryExpansion","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"cochains, holonomy, defect, gauge action and gauge distance with their invariances (2.2-2.6); the carrier 2.1 is in place","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"the cross-degree cost and constant, the bounds and h1Err_complete (9.2-9.4); distErr of 9.1 is done","state":"partial"}],"readme_sha":"45b9bbaa8c94e1ab273152eadddf3917eff632905eab5a7a736925a20b3aa160","roadmap":"CoboundaryExpansion","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: CoboundaryExpansion

This file documents the status of the CoboundaryExpansion roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is complete: it supplies the conjugation-invariant norms, the moved-point norm and the parity retraction. Layer 2 has its edge/triangle carrier but no cochains, and Layer 9 has only its distance with errors. The cochain theory, the Cheeger constant, the star bound, replication and every computed value (Layers 3–8) have not begun.

### Named results

- **Hamming distance as a group norm** — the number of points where two permutations differ is the moved-point norm of their quotient, so the normalized Hamming metric is the bi-invariant metric of a group norm ([`Equiv.Perm.hammingDist_eq_movedNorm`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Perm/MovedNorm.html#Equiv.Perm.hammingDist_eq_movedNorm)).
- **The parity retraction is norm-decreasing** — sending even permutations to the identity and odd ones to a fixed transposition never increases the number of moved points ([`Equiv.Perm.movedNorm_parityRetract_le`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Perm/ParityRetract.html#Equiv.Perm.movedNorm_parityRetract_le)). This is what will let the headline transfer Kozlov's binary witnesses to `Sym(3)` without losing gauge distance.
- **Conjugation invariance is bi-invariance of the metric** — a group norm is conjugation invariant exactly when its metric is also right invariant ([`GroupNorm.isConjInvariant_iff_dist_mul_right`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Group/ConjInvariant.html#GroupNorm.isConjInvariant_iff_dist_mul_right)). Conversely, every bi-invariant metric arises from such a norm, and the two constructions are inverse.

### Notable definitions and infrastructure

- **The moved-point norm** ([`Equiv.Perm.movedNorm`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Perm/MovedNorm.html#Equiv.Perm.movedNorm)) is the coefficient norm of every permutation result in the roadmap. It is conjugation invariant, at least two on odd permutations, and exactly two on transpositions.
- **Conjugation-invariant seminorms** ([`GroupSeminorm.IsConjInvariant`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Group/ConjInvariant.html#GroupSeminorm.IsConjInvariant)) are closed under pullback along injective homomorphisms (hence restriction to subgroups), positive scaling, sums and maxima. They are invariant under cyclic rotation of a product, which is what makes triangle holonomies orientation-independent in Layer 2.
- **The distance with errors** ([`Equiv.Perm.distErr`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Perm/DistErr.html#Equiv.Perm.distErr)) compares permutations of different degrees. It is symmetric, equals the normalized Hamming distance in equal degree, and is bounded below by `1 − min/max`.

### Roadmap coverage

Layer 1 is done: 1.1 through 1.4 are all proved. Layer 2 is partial. The carrier `TwoComplex V`, its conversions to and from the rank-three graded complex with both round trips, the complete complex with its edge and triangle counts, and relabelling along vertex bijections are in place (2.1). Cochains, holonomy, defect, the gauge action, gauge distance and every invariance (2.2–2.6) are absent. Layer 9 is partial: only 9.1 is proved, while the cross-degree cost, constant, bounds and value (9.2–9.4) are absent. Layers 3, 4, 5, 6, 7 and 8 are untouched.

## The frontier

- **Cochains and gauge distance (2.2)** — define `Cochain X G` with holonomy, defect, cost, gauge distance and the gauge action on the existing `TwoComplex` carrier. Every later layer waits on this, and it has no outside blocker.
- **Orientation, gauge invariance and finite coefficients (2.3–2.5)** — use the cyclic-rotation lemmas of Layer 1 to show that defect and gauge distance are independent of the vertex order and of gauges, and that the infimum is attained for finite groups.
- **The Cheeger constant (Layer 3)** — define `h1`, `h1Norm` and `h1Sym` with their basic bounds once Layer 2 is in place.
- **The star bound (Layer 4)** — prove `card V / 3 ≤ h1 (complete V) ℓ` via the star identity. This is the first theorem that needs only Layers 2 and 3, and the main consumer of the conjugation-invariance API.
- **Change of coefficients (2.6)** — show that pushing a cochain forward along a norm-decreasing homomorphism does not increase its defect or gauge distance. Combined with the parity retraction, this is the remaining ingredient of the `Sym(3)` reduction in 8.1.

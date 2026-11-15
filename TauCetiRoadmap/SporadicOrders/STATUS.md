<!--tauceti-status:v1 {"roadmap":"SporadicOrders","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe","ts":"2026-11-09T11:59:37+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"the M23 carrier; orders of M23, M24, J1, J2, McL and Co3","state":"partial"},{"id":"Layer 2","remaining":"surjections for M23 and Co3; size corollaries beyond M22 and HS","state":"partial"}],"readme_sha":"36e7c91ecf97d1030ffaff1298a5006d0c6e6f58fac61cd3b4a562f25a86d668","roadmap":"SporadicOrders","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe"}-->
# Status: SporadicOrders

This file documents the status of the SporadicOrders roadmap up until `d92acc5` (2026-11-09T11:59:37+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done: the order formula, the orbit description and the membership criterion are all proved for an arbitrary permutation group. Layers 1 and 2 are both partial. Layer 1 has proved the orders of four of the ten models. Layer 2 has shown that eight of the ten presented groups map onto their models. M₂₃ has not been started.

### Named results

- **The stabilizer-chain order formula** — the order of a subgroup of `Equiv.Perm α` is the product of the basic-orbit lengths times the order of the last pointwise stabilizer. Infinite groups need no special case, because both sides are then `0` ([`Subgroup.prod_ncard_orbit_mul_card_stabilizerChain`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAction/Stabilizer/Chain.html#Subgroup.prod_ncard_orbit_mul_card_stabilizerChain)). Along a base, the order is just the product of the orbit lengths.
- **The membership criterion along a base** — an element lies in the group exactly when sifting it through representatives of the basic orbits ends in the identity ([`Subgroup.mem_iff_exists_prod_eq`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAction/Stabilizer/Chain.html#Subgroup.mem_iff_exists_prod_eq)).
- **The orders of M₁₁, M₁₂ and M₂₂** — the three Mathieu models have orders 7920, 95040 and 443520 ([`card_M11`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/Mathieu/Eleven.html#TauCeti.Sporadic.card_M11), [`card_M12`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/Mathieu/Twelve.html#TauCeti.Sporadic.card_M12), [`card_M22`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/Mathieu/TwentyTwo.html#TauCeti.Sporadic.card_M22)). Each order is certified by a finite sifting check.
- **The order of the Higman–Sims model** — the degree-100 model has order 44352000. The proof computes the basic orbits 100, 77, 60, 32 and 3 one at a time ([`card_HS`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/HigmanSims/Order.html#TauCeti.Sporadic.card_HS)).
- **The presented M₂₄ maps onto its model** — the seven relators of `M24G1-P1` hold at `(a, b⁻¹)`, and these two permutations generate the degree-24 model, so the presented group surjects onto it ([`exists_surjective_M24`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Mathieu/TwentyFour/PermutationModel.html#TauCeti.Sporadic.exists_surjective_M24)). The same pattern covers M₁₁, M₁₂, M₂₂, J₁, J₂, Higman–Sims and McLaughlin.

### Notable definitions and infrastructure

- **Orders from successful sifts** — if lists of stabilizer-chain elements have distinct images and absorb each other's products under sifting, the group's order is the product of the list lengths and the points form a base. Every hypothesis except two memberships is a check that `decide` runs ([`Subgroup.natCard_eq_prod_length_of_siftCheck`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAction/Stabilizer/Sift.html#Subgroup.natCard_eq_prod_length_of_siftCheck)). This is the route the remaining orders can take.
- **Orbits of generated groups** — the orbit of a point under `Subgroup.closure S` is the least set closed under `S` and `S⁻¹`. On a finite type, closure under `S` alone is enough ([`MulAction.isLeast_orbit_closure`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAction/Orbit/Closure.html#MulAction.isLeast_orbit_closure)). This turns a computed orbit into a proved one.
- **Surjections from satisfying assignments** — if an assignment satisfies every relator and its values generate `H`, the presented group surjects onto `H` ([`TauCeti.GroupPresentation.exists_surjective_of_closure_range_eq`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Presentation/GroupPresentation.html#TauCeti.GroupPresentation.exists_surjective_of_closure_range_eq)). This reduces each Layer 2 target to closed permutation equations.

### Roadmap coverage

**Layer 0** is done: 0.1, 0.2 and 0.3, together with the k-transitive orbit lengths. **Layer 1** is partial.
- Nine carriers are defined from their ATLAS files. There is no `M23` carrier.
- `card_M11`, `card_M12`, `card_M22` and `card_HS` are proved.
- J₁, J₂ and McL have partial stabilizer chains: J₁ through 266·110, J₂ through 100·63, and McL through four of its six basic orbits.
- M₂₃, M₂₄ and Co₃ have no order. Co₃ has only transitivity.

**Layer 2** is partial.
- Surjections are proved for M₁₁, M₁₂, M₂₂, M₂₄, J₁, J₂, HS and McL, each with a nontrivial presented group.
- The size corollary is stated only for M₂₂ and HS.
- M₂₃ and Co₃ have no surjection.

The end theorems live in `TauCeti.Sporadic`, not the README's `TauCetiRoadmap.SporadicOrders`.

## The frontier

- **Orders of J₁, J₂ and McL** — each needs only its last few basic orbits: J₁'s final orbit of 6, J₂'s orbits of 24 and 4, and McL's orbits of 5 and 2. The sifting route used for the Mathieu groups could close all three.
- **`card_M24`** — the carrier and surjection exist. The seven basic orbits 24, 23, 22, 21, 20, 16 and 3 remain, a natural next target for the sifting certificate.
- **M₂₃** — nothing exists yet: no carrier, order or surjection. The presentation is already supplied by CFSGStatement.
- **Co₃** — the carrier is defined and transitive. The order 495766656000 on 276 points is the largest computation in the roadmap. The surjection from the seven-generator presentation needs explicit images of all seven generators, not just the ATLAS pair.
- **Size corollaries** — `le_natCard_group_<Name>` follows immediately once each remaining order lands. M₁₁ and M₁₂ already have both ingredients but no stated bound.

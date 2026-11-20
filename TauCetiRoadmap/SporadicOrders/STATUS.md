<!--tauceti-status:v1 {"roadmap":"SporadicOrders","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"card_McL (its fifth basic orbit, of length 5) and card_Co3 (basic orbits 56, 45, 16 and a base)","state":"partial"},{"id":"Layer 2","remaining":"size corollaries for M11 and M12, and for McL and Co3 once their orders land","state":"partial"}],"readme_sha":"9ab92c1b6014d945a78dcf8ac61bca990499a08ca57d16a58de612ffd46ac587","roadmap":"SporadicOrders","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: SporadicOrders

This file documents the status of the SporadicOrders roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, the general theory of stabilizer chains, is done. All ten ATLAS models are defined, and every one of the ten presented groups maps onto its model. Eight of the ten orders are proved. McLaughlin and Co₃ remain, so Layers 1 and 2 are both partial.

### Named results

- **The stabilizer-chain order formula** — the order of a permutation group is the product of its basic-orbit lengths times the order of the last pointwise stabilizer. No finiteness hypothesis is needed ([`Subgroup.prod_ncard_orbit_mul_card_stabilizerChain`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAction/Stabilizer/Chain.html#Subgroup.prod_ncard_orbit_mul_card_stabilizerChain)).
- **The orders of the five Mathieu models** — M₁₁, M₁₂, M₂₂, M₂₃ and M₂₄ have orders 7920, 95040, 443520, 10200960 and 244823040 ([`card_M11`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/Mathieu/Eleven.html#TauCeti.Sporadic.card_M11), [`card_M12`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/Mathieu/Twelve.html#TauCeti.Sporadic.card_M12), [`card_M22`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/Mathieu/TwentyTwo.html#TauCeti.Sporadic.card_M22), `card_M23`, [`card_M24`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Mathieu/TwentyFour/Order.html#TauCeti.Sporadic.card_M24)).
- **The orders of the Janko and Higman–Sims models** — J₁ has order 175560 on 266 points, J₂ has order 604800 on 100 points, and Higman–Sims has order 44352000 on 100 points ([`card_J1`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Janko/One/Order.html#TauCeti.Sporadic.card_J1), [`card_J2`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/Janko/Two/Order.html#TauCeti.Sporadic.card_J2), [`card_HS`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/HigmanSims/Order.html#TauCeti.Sporadic.card_HS)).
- **Every presented group maps onto its model** — in each of the ten cases, the transcribed relators hold of permutations that generate the model, so no presentation collapses ([`exists_surjective_M24`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Mathieu/TwentyFour/PermutationModel.html#TauCeti.Sporadic.exists_surjective_M24)). For Co₃ the presentation is Djoković's, on seven involutions rather than the ATLAS pair, and `exists_surjective_Co3` supplies seven explicit involutions of the 276 points.
- **Lower bounds on the presented groups** — where the order is known, a finite presented group is at least as large as its model. This is stated for M₂₂, M₂₃, M₂₄, J₁, J₂ and Higman–Sims ([`le_natCard_group_J2`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/Sporadic/Janko/Two/Order.html#TauCeti.Sporadic.le_natCard_group_J2)).

### Notable definitions and infrastructure

- **Orders from sifting checks** — if the stabilizer-chain lists pass two finite checks that `decide` can run, then the group's order is the product of the list lengths and the points form a base ([`Subgroup.natCard_eq_prod_length_of_siftCheck`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAction/Stabilizer/Sift.html#Subgroup.natCard_eq_prod_length_of_siftCheck)). This is how the Mathieu orders were proved.
- **Bases from rigidity** — a relation-preserving map that fixes some seed points fixes every point determined by its relations to points of lower rank ([`Function.apply_eq_self_of_rank`](https://taucetiproject.org/docs/TauCeti/Logic/Function/Rigidity.html#Function.apply_eq_self_of_rank)). Combined with invariant graph data, this proves that a few points form a base without a full sift. It was used for J₂, Higman–Sims and McLaughlin.
- **Surjections from satisfying assignments** — if an assignment satisfies every relator and its values generate `H`, then the presented group surjects onto `H` ([`TauCeti.GroupPresentation.exists_surjective_of_closure_range_eq`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Presentation/GroupPresentation.html#TauCeti.GroupPresentation.exists_surjective_of_closure_range_eq)). This reduces each Layer 2 target to equations between permutations.

### Roadmap coverage

**Layer 0** is done: the order formula, the orbits of generated groups, and membership along a base. **Layer 1** is partial.
- All ten carriers are defined, including M₂₃ and Co₃.
- Eight orders are proved.
- McLaughlin has five of its six basic orbits (275, 112, 81, 36 and 2) and a proved base, but not the fifth orbit of length 5.
- Co₃ is 2-transitive and has three of its six basic orbits (276, 275 and 162).

**Layer 2** is partial.
- All ten surjections are proved, with the presented groups nontrivial.
- The size corollary is missing for M₁₁ and M₁₂, though both ingredients exist, and for McLaughlin and Co₃, which still lack orders.

The end theorems live in `TauCeti.Sporadic`, not the README's `TauCetiRoadmap.SporadicOrders`.

## The frontier

- **`card_McL`** — the fifth basic orbit is the only missing piece: the orbit of `4` under the stabilizer of `0, 1, 2, 3`, of length 5. With it, the order is 89812800 · 5 · 2 = 898128000, and the size bound follows at once.
- **Size bounds for M₁₁ and M₁₂** — both the order and the surjection are proved. The two `le_natCard_group` statements are routine.
- **`card_Co₃`** — the basic orbits 56, 45 and 16 remain, along with a proof that six points form a base. At 495766656000 on 276 points, this is the largest computation in the roadmap.
- **Co₃ size bound** — this follows immediately once `card_Co3` lands, since the surjection already exists.
